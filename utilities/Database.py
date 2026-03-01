import os
import sys

sys.path.append(os.getcwd())


from pymongo import AsyncMongoClient
from typing import *

from Environment import *


class Mongo_DB:

    async def list_collection_names(self):
        return await self.db.list_collection_names()

    client = AsyncMongoClient(
        MONGO_URL,
        connectTimeoutMS=5000,  # 5 second
        serverSelectionTimeoutMS=5000,  # 5 second
    )

    db = client[MONGO_DATABASE]

    c_credential = db["c_credential"]
    c_credential_reset_otp = db["c_credential_reset_otp"]
    c_credential_signup_otp = db["c_credential_signup_otp"]

    c_product = db["c_product"]

    c_template = db["c_template"]


if __name__ == "__main__":
    import asyncio

    async def main():
        db = Mongo_DB()
        data = await db.c_credential.find_one({"username": "aaaaa"})
        print(data)

    asyncio.run(main())
