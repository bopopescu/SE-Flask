from objects import Account #import account class objects.py
import acc_persist as ap

def handle_acc(case,data):
    if case == 'register':
        acc = Account(data)
        query = ap.register(acc)
        return query
    elif case == 'login':
        return ap.login(data)
    elif case == 'type':
        return ap.verify_type(data)
    elif case == 'profile':
        return ap.get_info(data)
    elif case == 'add':
        ap.add_user(data)
    elif case == 'delete':
        ap.rmv_user(data)
    elif case == 'update':
        ap.update_user(data)
    elif case == 'changepass':
        ap.update_pass(data)
    elif case == 'changeinfo':
        ap.update_info(data)
    elif case == 'subscribe':
        ap.update_info(data)