import os
import sys


sys.path.append(os.getcwd())


from fastapi import *
from fastapi.responses import *
from fastapi.middleware.cors import *

from Environment import *

from routers import Home
from routers import Credential
from routers import Product


app = FastAPI(title=TITLE, version="1.0.0", docs_url="/")
app.add_middleware(CORSMiddleware, allow_origins=["*"], allow_credentials=True, allow_methods=["*"], allow_headers=["*"])


app.include_router(Product.router, prefix="/product", tags=["Product"])
app.include_router(Credential.router, prefix="/credential", tags=["Credential"])
app.include_router(Home.router, prefix="/home", tags=["Home"])
# app.include_router(Asset.router, prefix="/assets", tags=["Asset"])


if __name__ == "__main__":

    import os
    import uvicorn
    import webbrowser
    from threading import Timer

    def open_browser():
        webbrowser.open("http://127.0.0.1:8000")

    Timer(1, open_browser).start()

    module_name = os.path.relpath(os.path.abspath(__file__), os.getcwd()).replace("\\", ".").replace("/", ".")[:-3]
    variable_name = "app"

    uvicorn.run(
        f"{module_name}:{variable_name}",
        host="127.0.0.1",
        port=8000,
        reload=True,
        reload_includes=[
            "routers/*.py",
            "utilities/*.py",
            "Application.py",
            "Environment.py",
        ],
        reload_excludes=["__pycache__"],
    )
