import os
import sys


sys.path.append(os.getcwd())


from fastapi import *
from datetime import datetime
import json
from bson import ObjectId, json_util

from Environment import *
from utilities.Database import database as db

router = APIRouter()
# db = Mongo_DB()


@router.post("/create", deprecated=0)
async def _():
    try:
        blank_data = {"created_at": datetime.now()}

        await db["c_store"].insert_one({**blank_data})

        return 1
    except Exception as e:
        return Response(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR)


@router.post("/read", deprecated=0)
async def _(
    query: str = Form(""),
    offset: int = Form(0),
    limit: int = Form(100),
):
    try:

        # fmt: off

        if query == "":
            search = (
                await db["c_store"]
                .find({"is_active": {"$ne": False}}) # avoid inactive
                .skip(offset)
                .limit(limit)
                .to_list(length=None)
            )

        # search = (
        #     await db["c_store"]
        #             .find({"name": {"$regex": query, "$options": "i"}})
        #             .skip(int(offset))
        #             .limit(int(limit))
        #             .to_list(length=None)
        # )
        # fmt: on

        return json.loads(json_util.dumps(search))

    except Exception:
        return Response(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR)


@router.post("/update", deprecated=0)
async def _(
    id: str = Form(..., json_schema_extra={"example": ""}),  # 69b8e5e5c725212733d04e56
    name: str = Form(""),
):
    try:

        now = datetime.now()

        if name != "":
            await db["c_store"].update_one({"_id": ObjectId(id)}, {"$set": {"name": name, "updated_at": now}})

        return 1

    except Exception as e:
        return Response(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR)


@router.post("/delete", deprecated=0)
async def _(
    id: str = Form(..., json_schema_extra={"example": ""}),  # 69b8e5e5c725212733d04e56
):
    try:
        now = datetime.now()

        await db["c_store"].update_one({"_id": ObjectId(id)}, {"$set": {"is_active": False, "updated_at": now}})

        return 1
    except Exception as e:
        return Response(status_code=status.HTTP_500_INTERNAL_SERVER_ERROR)


if __name__ == "__main__":
    os.system("python Application.py")
