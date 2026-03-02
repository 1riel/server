import os
import sys

from typing import Optional

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


@router.get("/{p:path}")
async def _(
    p: str = Path(..., json_schema_extra={"example": "apple.png"}),
):
    try:

        # check if object exists
        if not s3.object_exists(MINIO_BUCKET_PUBLIC, f"assets/{p}"):
            return Response(status_code=status.HTTP_404_NOT_FOUND)

        # get file extension
        ext = p.split(".")[-1].lower()

        # get object from s3
        data = s3.get_object(MINIO_BUCKET_PUBLIC, f"assets/{p}")

        # load image
        content = data.read()

        # prepare byte stream
        bio = BytesIO()

        # open image from bytes
        image = Image.open(BytesIO(content))

        # make the background white for png images
        if ext in ["png"]:
            image_background = Image.new("RGB", image.size, (255, 255, 255))
            image_background.paste(image, mask=image.split()[-1])
            image = image_background

        image.save(bio, format="JPEG")  # save image to byte array
        bio.seek(0)  # reset pointer to start
        return StreamingResponse(
            bio,
            media_type="image/jpeg",
            headers={
                "Cache-Control": "public, max-age=31536000",
            },
        )

    except Exception:
        return Response(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR)


if __name__ == "__main__":
    os.system("python Application.py")
