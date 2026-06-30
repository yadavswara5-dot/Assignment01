from flask import Blueprint,render_template,request,current_app
from .services import get_weather
main=Blueprint('main',__name__)
@main.route('/',methods=['GET','POST'])
def index():
 w=None;e=None
 if request.method=='POST':
  w=get_weather(request.form['city'],current_app.config['OPENWEATHER_API_KEY'])
  if not w:e='City not found or API unavailable.'
 return render_template('index.html',weather=w,error=e)
@main.route('/health')
def health(): return {'status':'UP'}
