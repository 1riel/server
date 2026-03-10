import os
import sys

sys.path.append(os.getcwd())

from fastapi import *
from fastapi.responses import *
from fastapi.middleware.cors import *
from datetime import datetime

from PIL import Image
from io import BytesIO

from Environment import *
from utilities.Storage import Storage
from utilities.Token import Token


router = APIRouter()

s3 = Storage()
tk = Token()


MAX_SIZE = 2000


@router.post("/")
async def _(
    path: str = Form(..., json_schema_extra={"example": "assets/background.png"}),
    height: int = Form(..., json_schema_extra={"example": 100}),
):
    try:

        # validate width and height
        if height > MAX_SIZE or height <= 0:
            return Response(status_code=status.HTTP_400_BAD_REQUEST)

        # check if object exists
        if not s3.object_exists(MINIO_BUCKET_PUBLIC, path):
            return Response(status_code=status.HTTP_404_NOT_FOUND)

        resized_path = f"{height}/{path}".lstrip("/")

        # get object from s3
        file = s3.get_object(MINIO_BUCKET_PUBLIC, path)
        with Image.open(file) as image:
            width = int(image.width * height / image.height)
            image = image.resize((width, height), Image.Resampling.LANCZOS)
            image_buffer = BytesIO()
            image.save(image_buffer, format="PNG")
            image_buffer.seek(0)

        # remove existing resized image if exists
        if s3.object_exists(MINIO_BUCKET_PUBLIC, resized_path):
            s3.remove_object(MINIO_BUCKET_PUBLIC, resized_path)

        # upload resized image to s3
        s3.put_object(
            MINIO_BUCKET_PUBLIC,
            resized_path,
            image_buffer,
            image_buffer.getbuffer().nbytes,  # get size of byte array
        )

        return 1

    except Exception:
        return Response(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR)


if __name__ == "__main__":
    os.system("python Application.py")
