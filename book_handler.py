import book_persist as bp

def handle_book(case,data):
    if case == 'search':
        return bp.getSearch(data)
    elif case == 'view':
        return bp.getBook(data)
    elif case == 'add':
        bp.addBook(data)
    elif case == 'delete':
        bp.deleteBook(data)
    elif case == 'update':
        bp.updateBook(data)
    elif case == 'checkout':
        bp.checkoutBook(data)
    elif case == 'home':
        return bp.getAll()
    elif case == 'lowInv':
        return bp.getBookLowInv()
    elif case == 'dailySale':
        return bp.getDailySale(data)

res = handle_book('home','')
for i in res:
    print(i)