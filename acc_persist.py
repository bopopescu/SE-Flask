import DB_access as db

def register(acc):
    query = "insert into accounts(name,email,birthdate,username,password,acct_type) values ('{}','{}','{}','{}','{}','{}')".format(acc.name,acc.email,acc.date,acc.user,acc.passw,acc.type)
    db.update(query)
    query = "insert into address(add_line_1,add_line_2,state,zip,cust_id,city) values ('{}','{}','{}','{}','{}','{}')".format(acc.addr.ad1,acc.addr.ad2,acc.addr.st,acc.addr.zip,acc.user,acc.addr.city)
    db.update(query)
    return query
#worthless if you're not using the domain classes
#can also be called by an admin who is adding a user

#Verifies if user with username and password exits
def login(creds):
    query = "select * from accounts where username='{}' and password='{}'".format(creds['user'],creds['pass'])
    num = db.select(query)[1]#returns number of tuples found by query
    if num == 0:
        return False
    else:
        return True
#returns true or false depending on if user credentials are found in database

def verify_type(creds):
    return db.select("SELECT acct_type FROM accounts WHERE username='{}'".format(creds))[0]

def give_perm(user,level):
    query = 'update accounts set acct_type = \''+level+'\' where username = \'' + user + '\''
    db.update(query)
#used by admin to set user permissions: vendor, admin, owner, or cust (demoted..)
def add_user(data):
    name = data['name']
    email = data['email']
    birth = data['birth']
    username = data['username']
    password = data['password']
    acct_type = data['acct_type']
    query = "INSERT INTO accounts(name,email,birthdate,username,password,acct_type) VALUES('"+name+"','"+email+"','"+ birth + "','"+username+"','"+ password +"','"+ acct_type+"')"
    db.update(query)

def rmv_user(data):
    user = data['username']
    query = 'delete from accounts where username = \'' + user + '\''
    db.update(query)
#called by admin to delete accounts

def update_user(data): #contains dict of all user attributes?
    name = data['name']
    email = data['email']
    birth = data['birth']
    username = data['username']
    password = data['password']
    acct_type = data['acct_type']
    query = "UPDATE accounts SET name = '"+ name + "',email = '"+email+"', birthdate = '"+ birth + "',username = '"+username+"',password = '"+ password +"', acct_type = '"+ acct_type +"' WHERE username='"+ username + "'"
    db.update(query)

def get_info(data):
    query = "select * from accounts where username='{}'".format(data)
    return db.select(query)[0]
#if promos are one time use for user maybe there should be something here...
