FROM python:3.11-slim

WORKDIR /app

# (except.dockerignore)
COPY . .

RUN pip install --no-cache-dir -r requirements.txt
# for healthcheck via pgrep need procps
RUN apt update && apt install -y procps

CMD ["python", "main.py"]
