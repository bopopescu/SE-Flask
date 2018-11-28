import DB_access as db

def getSearch(data):
    query = "select * from books where {} = '{}'".format(data['radiobutton'],data['search'])
    return db.select(query)[0]

def getBook(isbn):
    query = 'select * from books where isbn = \'' + isbn + '\''
    return db.select(query)[0]

def getBookLowInv():
    query = 'select * from books where amount <= 10'
    return db.select(query)[0]

def checkoutBook(isbn):
    query = 'update books SET amount=amount-1 where isbn = \'' + isbn + '\''
    db.update(query)
def addBook(data):
    title = data['title']
    author = data['author']
    detail = data['detail']
    isbn = data['isbn']
    subject = data['genre']
    pic_url = data['pic_url']
    price = data['price']
    amount = data['amount']
    promo = data['promo']
    vendor = data['vendor']
    query = "INSERT INTO books() VALUES('"+subject+"','"+title+"','"+ isbn + "','"+author+"','"+ detail +"',"+ price +",'"+pic_url+"',"+promo+","+amount+","+vendor+")"
    db.update(query)

def deleteBook(data):
    title = data['title']
    author = data['author']
    isbn = data['isbn']
    query = "DELETE from books WHERE title='"+ title +"' AND author='"+ author +"' AND isbn='" + isbn + "'"
    db.update(query)

def updateBook(data):
    title = data['title']
    author = data['author']
    detail = data['detail']
    isbn = data['isbn']
    subject = data['genre']
    pic_url = data['pic_url']
    price = data['price']
    amount = data['amount']
    promo = data['promo']
    vendor = data['vendor']
    query = "UPDATE books SET subject = '"+ subject+ "',title = '"+title+"', isbn = '"+ isbn + "',author = '"+author+"',detail = '"+ detail +"',price = "+ price +", pic_url = '"+pic_url+"',promo = "+promo+",amount="+amount+",vendor_id="+vendor+" WHERE isbn='"+ isbn + "'"
    db.update(query)

def getAll():
    query= 'select * from books'
    return db.select(query)[0]