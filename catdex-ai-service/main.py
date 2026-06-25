from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.responses import JSONResponse
from pydantic import BaseModel
import shutil
import os
from ultralytics import YOLO
from google import genai
from dotenv import load_dotenv

load_dotenv()

app = FastAPI(title="CatDex AI Service")

# Initialize YOLOv8 
model = YOLO('yolov8n.pt') 

# Initialize Gemini
client = genai.Client(api_key=os.getenv("GEMINI_API_KEY"))

@app.get("/")
async def root():
    return {"message": "Welcome to CatDex AI Service! The API is running correctly. Use POST /api/detect to scan cats."}

@app.post("/api/detect")
async def detect_cat(image: UploadFile = File(...)):
    temp_file = f"temp_{image.filename}"
    with open(temp_file, "wb") as buffer:
        shutil.copyfileobj(image.file, buffer)

    try:
        # Run YOLOv8 inference
        results = model(temp_file)
        
        cat_detected = False
        boxes = results[0].boxes
        for box in boxes:
            if int(box.cls) == 16: # 16 is cat in COCO
                cat_detected = True
                break
        
        if not cat_detected:
            os.remove(temp_file)
            return JSONResponse(status_code=400, content={"message": "Tidak ditemukan kucing."})

        prompt = """
        Buat profil karakter kucing fiksi yang lucu untuk aplikasi koleksi mirip Pokemon.
        Berikan format balasan JSON murni seperti ini:
        {
          "name": "Nama Kucing Unik",
          "description": "Deskripsi lucu maksimal 2 kalimat.",
          "rarity": "Common"
        }
        """
        
        response = client.models.generate_content(
            model='gemini-2.5-flash',
            contents=prompt,
        )
        import json
        import re
        
        text = response.text
        match = re.search(r'\{.*\}', text, re.DOTALL)
        if match:
            cat_data = json.loads(match.group(0))
        else:
            cat_data = {
                "name": "Kucing Misterius",
                "description": "Kucing yang tidak bisa dijelaskan dengan kata-kata.",
                "rarity": "Common"
            }

        os.remove(temp_file)
        return cat_data

    except Exception as e:
        if os.path.exists(temp_file):
            os.remove(temp_file)
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
