import os
import sys

sys.path.append(os.getcwd())


from PIL import Image
from io import BytesIO
from utilities.Storage import Storage

from Environment import *


class Converter:

    s3 = Storage()
    MAX_SIZE = 2000

    def to_thumbnail(self, input_path: str, input_height: int):

        # check if height is valid
        if input_height > self.MAX_SIZE or input_height <= 0:
            print("Invalid height")
            return 0

        # check if object exists
        if not self.s3.object_exists(MINIO_BUCKET_PUBLIC, input_path):
            print("Object does not exist")
            return 0

        file = self.s3.get_object(MINIO_BUCKET_PUBLIC, input_path)
        old_image = Image.open(BytesIO(file.read()))

        output_width = int(old_image.width * input_height / old_image.height)
        new_image = old_image.resize((output_width, input_height), Image.Resampling.LANCZOS)

        # remove old image if exists
        output_path = f"{input_height}/{input_path}"
        if self.s3.object_exists("public", output_path):
            self.s3.remove_object("public", output_path)

        # save new image to s3
        image_buffer = BytesIO()
        new_image.save(image_buffer, format="PNG")
        image_buffer.seek(0)
        self.s3.put_object(
            "public",
            output_path,
            image_buffer,
            image_buffer.getbuffer().nbytes,
        )


# convert = Converter()

# convert.to_thumbnail("assets/logo_itc.png", 200)
