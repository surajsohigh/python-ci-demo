# ---------- Base ----------
ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION}-slim

# ---------- Environment ----------
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# ---------- System Dependencies ----------
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# ---------- Python Dependencies ----------
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# ---------- Copy Project ----------
COPY . .

# ---------- Default Command ----------
CMD ["python", "app.py"]
