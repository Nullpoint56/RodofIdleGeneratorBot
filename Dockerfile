# Base image
FROM python:3.12-slim

# Environment
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY src/ src/

# Create persistent folders (optional)
RUN mkdir -p data logs

# Preload with initial data if exists
COPY data/ data/

# Entrypoint
CMD ["python", "src/bot.py"]
