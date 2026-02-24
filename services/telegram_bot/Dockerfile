FROM python:3.12-slim

RUN python -m pip install --upgrade pip

RUN pip install python-telegram-bot 
RUN pip install python-dotenv
RUN pip install ipdb

COPY services/telegram_bot/Application.py services/telegram_bot/Application.py
COPY utilities/Debug.py utilities/Debug.py
COPY Environment.py Environment.py


CMD [ "python", "services/telegram_bot/Application.py" ]