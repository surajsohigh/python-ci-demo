# Use official Python image
ARG PYTHON_VERSION=3.11
FROM python:${PYTHON_VERSION}-slim

# Set working directory
WORKDIR /app

# Copy dependency file
COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install pytest pytest-cov flake8 black

# Copy project files
COPY . .

# Default command
CMD ["pytest", "--cov=.", "--cov-report=term"]
