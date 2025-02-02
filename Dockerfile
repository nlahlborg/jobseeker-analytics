# Dockerfile
FROM python:3.11-slim

WORKDIR /

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose the port (important for Uvicorn)
EXPOSE 8000

# Use Uvicorn to run the app.  The host needs to be 0.0.0.0 for Docker
CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]