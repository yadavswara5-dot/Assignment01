import datetime

import requests 

URL='https://api.openweathermap.org/data/2.5/weather'
def get_weather(city,key):
 r=requests.get(URL,params={'q':city,'appid':key,'units':'metric'},timeout=10)
 if r.status_code!=200:return None
 data=r.json()
 return {
    "city": data["name"],
    "temperature": data["main"]["temp"],
    "condition": data["weather"][0]["description"].title(),
    "humidity": data["main"]["humidity"],
    "wind_speed": data["wind"]["speed"],
    "updated": datetime.datetime.fromtimestamp(data["dt"]).strftime("%Y-%m-%d %H:%M:%S")    
}