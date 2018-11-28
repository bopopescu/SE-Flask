from mako.template import Template
from acc_handler import *
import cart_handler as ch
import book_handler as bh
import cart_persist as cp
from datetime import date
import random
from flask import request,redirect,make_response
from flask import render_template
from flask import Flask
from flask_mail import Mail, Message


app = Flask(__name__)
app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USERNAME'] = 'group2emails6050@gmail.com'
app.config['MAIL_PASSWORD'] = '#6050project'
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USE_SSL'] = False

mail = Mail(app)
mail.connect()

# Home page view
@app.route('/',methods=['GET'])
def bookview():
    pres = bh.handle_book('home','')
    #if the request has cookies (Logged in) will load this
    if request.cookies.get('username') != None:
        acc_type = handle_acc('type',request.cookies.get('username'))[0].get('acct_type')
        if(acc_type == 'customer'):
            resp = render_template('index.htm',p=pres,user=request.cookies.get('username'),count=request.cookies.get('count'),log="Logout")
        elif(acc_type == 'owner'):
            resp = redirect('/owner')
        elif(acc_type == 'vendor'):
            resp = redirect('/vendor')
        elif(acc_type == 'admin'):
            resp = redirect('/admin',302)
        else:
            resp = 'How did you get here???'
    else:
        books = bh.handle_book('home','')
        resp = make_response(render_template('index.htm',p=books,user='Account',count=0,log="Login"))
    return resp

@app.route('/owner', methods=['GET'])
def ownerView():
    resp = ''
    resp = redirect('http://jsmalls128.pythonanywhere.com/static/ownerMainPage.htm')
    return resp

@app.route('/owner/<report>', methods=['GET'])
def ownerViewSelection(report):
    resp = ''
    if(report == 'daily'):
        dictlist = bh.handle_book('dailySale',str(date.today()))
        resp = make_response(render_template('endOfDaySales.htm',items=dictlist,date=str(date.today())))
    elif(report == 'inventory'):
        dictlist = bh.handle_book('lowInv','0')
        resp = make_response(render_template('lowInventory.htm',items=dictlist,date=str(date.today())))
    return resp

def registrationConfirmation(user_email):
    l = []
    l.append(user_email)
    msg = Message('Verification Email', sender = 'group2emails6050@gmail.com', recipients = l)
    msg.body = "http://jsmalls128.pythonanywhere.com/login"
    mail.send(msg)

"""def orderConfirmation(user_email):
    l = []
    l.append(user_email)
    msg = Message('Confirmation Email', sender = 'group2emails6050@gmail.com', recipients = l)
    msg.body = "http://jsmalls128.pythonanywhere.com/login"
    mail.send(msg)"""

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

@app.route('/login', methods=['GET','POST'])
def login():
    if(request.method == 'POST'):
        valid = handle_acc('login',request.form.copy())
        if valid:
            resp = redirect("/",code=302)
            resp.set_cookie('username',request.form['user'])
            num = ch.handle_cart('count',request.form['user'])
            resp.set_cookie('count',str(num))
            return resp
        else:
            return redirect("static/loginerr.htm")
    else:
        return render_template('Login.htm')

@app.route('/signout')
def signout():
    resp = redirect('/')
    resp.set_cookie('username', '', expires=0)
    return resp

@app.route('/delete',methods=['POST'])
def delete():
    data = request.form.copy()
    handle_acc('delete',data)
    resp = redirect('/signout')
    return resp

@app.route('/cart',methods=['GET','POST'])
def viewcart():
    if request.method == 'POST':
        #if they change quantity in cart
        data = request.form.copy()
        data['user'] = request.cookies.get('username')
        ch.handle_cart('quantity',data)
        resp = redirect("/cart")
        num = ch.handle_cart('count',request.cookies.get('username'))
        resp.set_cookie('count',str(num))
        #resp.set_cookie('count',str(data['qty']))#update count cookie if they entirely remove item from cart
    else:
        if int(request.cookies.get('count')) != 0:
            item,sub = ch.handle_cart('view',request.cookies.get('username'))
            resp =  render_template('cart.htm',count=request.cookies.get('count'),items=item,subtotal=sub)
        #if no items in cart
        else:
            resp = redirect("static/cartproto.htm")
    return resp

@app.route('/search',methods=['GET','POST'])
def search():
    if request.method == 'POST':
        dictlist = bh.handle_book('search',request.form.copy())
        if request.cookies.get('username') != None:
            resp = render_template('search.htm',items=dictlist,user=request.cookies.get('username'),count=request.cookies.get('count'),log="Logout")
        else:
            resp = render_template('search.htm',items=dictlist,user="Account",count=0,log="Login")
    return resp

@app.route('/profile',methods=['GET','POST'])
def profile():
    if (request.cookies.get('username') != None):
        info = handle_acc('profile',request.cookies.get('username'))
        return render_template('profile.htm',details=info[0])
    else:
        return redirect("/login")

@app.route('/profile/<action>',methods=['GET','POST'])
def profilechange(action):
    data = request.form.copy()
    if (action=='passwd'):
        valid = handle_acc('login',data)
        if(valid):
            handle_acc('changepass',data)
            return redirect("/profile")
    elif (action=='info'):
        handle_acc('changeinfo', data)
        return redirect("/signout")
    elif (action=='sub'):
        handle_acc('subscribe', data)
        return redirect("/profile")
    else:
        return redirect("/login")

@app.route('/b/',methods=['GET','POST'])
def selBook():
    if request.method == 'POST':
        data = request.form.copy()
        data['user'] = request.cookies.get('username')
        ch.handle_cart('add',data)
        resp = redirect("/cart")
        resp.set_cookie('count',str(int(request.cookies.get('count'))+1))
    else:
        isbn = request.args.get('book')
        info = bh.handle_book('view',isbn)
        if request.cookies.get('username') != None:
            resp = render_template('book.htm',details=info[0],user=request.cookies.get('username'),count=request.cookies.get('count'),log="Logout")
        #if the request has cookies will load this
        else:
            resp = render_template('book.htm',details=info[0],user='Account',count=0,log="Login")
    return resp

@app.route('/vendor', methods=['GET','POST'])
def vendorviewselection():
    resp = ''
    if(request.method == 'POST'):
        data = request.form.copy()
        if(data['radiobutton'] == 'add'):
            bh.handle_book('add',data)
            resp = render_template('manageBooks.htm',Confirmation="Book added!")
        elif(data['radiobutton'] == 'delete'):
            bh.handle_book('delete',data)
            resp = render_template('manageBooks.htm',Confirmation="Book deleted!")
        elif(data['radiobutton'] == 'update'):
            bh.handle_book('update',data)
            resp = render_template('manageBooks.htm',Confirmation="Book updated!")
    else:
        resp = redirect('/static/vendor.htm')
    return resp

@app.route('/checkout', methods=['GET','POST'])
def checkoutview():
    resp = redirect("/cart")
    if(request.method == 'POST'):
        itemString =""
        item,sub = ch.handle_cart('view',request.cookies.get('username'))
        info = handle_acc('profile',request.cookies.get('username'))
        empty = item
        for book in item:
            itemString += book['title']
        data = request.form.copy()
        data['customer_id'] = request.cookies.get('username')
        data['order_num'] = random.randint(100000000,999999999)
        data['order_id'] = data['customer_id'] + str(data['order_num'])
        data['order_date'] = str(date.today())
        data['ship_add'] = data.get("add1s") +" " +data.get("add2s") +" "+ data.get("citys")+", "+ data.get("states")+ " "+ data.get("zips")
        data['total'] = sub
        data['items'] = itemString
        respo = make_response(render_template('confirm.htm',count=request.cookies.get('count'),items=item,subtotal=sub,details=info[0],conf_nmb=data['order_num'],date=data['order_date'],conf_id=data['order_id'],ship_add=data['ship_add']))
        #orderConfirmation(info[0]['email'])
        ch.handle_cart('checkout',data)
        for book in empty:
            cp.updateItem(request.cookies.get('username'),book['isbn'],0)
            bh.handle_book('checkout',book['isbn'])
        respo.set_cookie('count',str(0))
        return respo
        #Should take input from form and put into order object
    else:
        if int(request.cookies.get('count')) != 0:
            item,sub = ch.handle_cart('view',request.cookies.get('username'))
            return render_template('checkout.htm',count=request.cookies.get('count'),items=item,subtotal=sub)
        else:
            return redirect('/cart')
        resp =  redirect('static/checkoutproto.htm')
    return resp

@app.route('/admin/<action>', methods=['GET','POST'])
def adminviewselection(action):
    resp = ''
    if(request.method == 'POST'):
        data = request.form.copy()
        if(action == 'book'):
            if(data['radiobutton'] == 'add'):
                bh.handle_book('add',data)
                resp = render_template('manageBooks.htm',Confirmation="Book added!")
            elif(data['radiobutton'] == 'delete'):
                bh.handle_book('delete',data)
                resp = render_template('manageBooks.htm',Confirmation="Book deleted!")
            elif(data['radiobutton'] == 'update'):
                bh.handle_book('update',data)
                resp = render_template('manageBooks.htm',Confirmation="Book updated!")
        elif(action == 'account'):
            if(data['radiobutton'] == 'add'):
                handle_acc('add',data)
                resp = render_template('manageAccounts.htm',Confirmation="Account added!")
            elif(data['radiobutton'] == 'delete'):
                handle_acc('delete',data)
                resp = render_template('manageAccounts.htm',Confirmation="Account deleted!")
            elif(data['radiobutton'] == 'update'):
                handle_acc('update',data)
                resp = render_template('manageAccounts.htm',Confirmation="Account updated!")
        elif(action == 'order'):
            if(data['radiobutton'] == 'add'):
                handle_acc('add',data)
                resp = render_template('manageOrders.htm',Confirmation="Order added!")
            elif(data['radiobutton'] == 'delete'):
                handle_acc('delete',data)
                resp = render_template('manageOrders.htm',Confirmation="Order deleted!")
            elif(data['radiobutton'] == 'update'):
                handle_acc('update',data)
                resp = render_template('manageOrders.htm',Confirmation="Order updated!")
    else:
        if(action == 'book'):
            resp = redirect('http://jsmalls128.pythonanywhere.com/static/manageBooks.htm')
        elif(action == 'account'):
            resp = redirect('http://jsmalls128.pythonanywhere.com/static/manageAccounts.htm')
        elif(action == 'order'):
            resp = redirect('http://jsmalls128.pythonanywhere.com/static/manageOrders.htm')
        else:
            resp = "How did you get here?!?!?!"
    return resp

@app.route('/admin', methods=['GET','POST'])
def adminview():
    resp = ''
    if(request.method == 'POST'):
        data = request.form.copy()
        if(data['radiobutton'] == 'add'):
            bh.handle_book('add',data)
            resp = render_template('manageBooks.htm',Confirmation="Book added!")
        elif(data['radiobutton'] == 'delete'):
            bh.handle_book('delete',data)
            resp = render_template('manageBooks.htm',Confirmation="Book deleted!")
        elif(data['radiobutton'] == 'update'):
            bh.handle_book('update',data)
            resp = render_template('manageBooks.htm',Confirmation="Book updated!")
    else:
        resp = render_template('adminMain.htm',user=request.cookies.get('username'),log="Logout")
    return resp

if __name__ == '__main__':
    app.run()