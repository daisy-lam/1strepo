FROM python:3.9-slim

# 強制不產生緩存檔案，並即時輸出 Log
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# 複製並安裝
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製所有檔案到 /app
COPY . .

# 暴露埠號
EXPOSE 8080

# 修改啟動指令，明確指定路徑
CMD ["python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
