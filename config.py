import os
from dotenv import load_dotenv
load_dotenv()
class Config:
 SECRET_KEY=os.getenv('SECRET_KEY','PROD')
 OPENWEATHER_API_KEY=os.getenv('OPENWEATHER_API_KEY')
