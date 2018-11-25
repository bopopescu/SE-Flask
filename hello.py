import mysql.connector
from mako.template import Template

mysql_connection_info = {

    'host': 'localhost',

    'user': 'root',

    'passwd': 'Jsmalls128',

    'database': 'web',

    'auth_plugin': 'mysql_native_password'
} 
from flask import Flask
app = Flask(__name__)

@app.route('/',methods=['GET'])
def bookview():
    p = bh.handle_book('home','')
    if request.cookies.get('username') != None:
        template = Template(filename='')
        resp = make_response(template.render(presidents=p,user=request.cookies.get('username'),count=request.cookies.get('count')))
        #if the request has cookies will load this
    else:
        template = Template(filename='')
        resp = make_response(template.render(presidents=p))
    return resp