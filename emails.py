from flask import Flask, render_template, redirect, request
from flask_mail import Mail, Message
import os
import mysql.connector
from acc_handler import handle_acc


app = Flask(__name__)


# setup mysql connection information
mysql_connection_info = {
    'host': 'jsmalls128.mysql.pythonanywhere-services.com',
    'user': 'jsmalls128',
    'passwd': 'Thepassword',
    'database': 'jsmalls128$web',
    'auth_plugin': 'mysql_native_password'
}

mysql_connection = mysql.connector.connect(**mysql_connection_info)
db = mysql_connection.cursor(dictionary=True)


mail = Mail(app)
mail.connect()


def registrationConfirmation(user_email):
    l = []
    l.append(user_email)
    msg = Message('Hello', sender = 'group2emails6050@gmail.com', recipients = l)
    msg.body = "http://jsmalls128.pythonanywhere.com/"
    mail.send(msg)

@app.route('/register', methods=['GET','POST'])
def register():
    if(request.method == 'POST'):
        acc = handle_acc('register',request.form.copy())
        if(acc == 1):
            return render_template('register.htm',error="This username has already been taken!")

        registrationConfirmation(request.form.copy()['email'])
        return redirect("http://jsmalls128.pythonanywhere.com/static/registrationConfirmation.htm")
    else:
        return render_template('register.htm',error="")

@app.route("/orderConfirmation")
def orderConfirmation():
    msg = Message('Hello', sender = 'group2emails6050@gmail.com', recipients = ['group2emails6050@gmail.com'])
    msg.body = "{}".format("<<<place order here>>>")
    mail.send(msg)
    return "Sent"

@app.route("/subscriptionEmail")
def subscriptionEmail():
    l = list()
    msg = Message('Subscription Email', sender = 'group2emails6050@gmail.com', recipients = l)
    msg.body = "You are now subscribed to news and promo emails from BookWORM."
    mail.send(msg)
    return render_template("/profile")

@app.route("/emailNewsPromos")
def emailNewsPromos():
    email_list = list()
    db.execute('SELECT * FROM accounts WHERE sub=1');
    subscribers = db.fetchall()
    for subscriber in subscribers:
        email_list.append(subscriber['email'])
    msg = Message('Hello', sender = 'group2emails6050@gmail.com', recipients = email_list)
    msg.subject = "News and promos"
    msg.body = "An email with news and promo has been sent to: \n"
    mail.send(msg)
    return render_template('emailNewsPromos.htm', title='News and Promos', email_list=email_list)
