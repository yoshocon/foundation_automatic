from pymongo import MongoClient
import hashlib
import time
m = hashlib.md5()
client = MongoClient()
db = client.foundation
accounts = db.accounts

class automatic(object):
    def __init__(self):
        self.PASSWORD = "a1234567"
        self.EMAIL = "robot@gmail.com"
        self.PHONE = "0987654321"
        self.IDCODE = "A123456789"
        self.ADDRESS = "robot test home"
        self.AUTHORITY = "User"

    def __create_MD5(self, account, password):
        string = account + password
        m.update(string)
        psw = m.hexdigest()
        return psw

    def register_user(self, account, sex, birthday):
        name = account
        account = account
        password = self.PASSWORD
        pwHash = self.__create_MD5(account, password)
        email = self.EMAIL
        phone = self.PHONE
        sex = sex
        identity = self.IDCODE
        idHash = self.__create_MD5(account, identity)
        birthday = birthday
        address= self.ADDRESS
        authority = self.AUTHORITY
        createTime = time.strftime("%a %b %d %Y %H:%M:%S")
        data = {
            "name": name,
            "account": account,
            "pwHash": pwHash,
            "email": email,
            "telephone": phone,
            "sex": sex,
            "idHash": idHash,
            "birthday": birthday,
            "address": address,
            "authenticate": 'false',
            "authorty": authority,
            "createTime": createTime
        }
        accounts.insert(data);

    def delete_user(self):
        data = accounts.delete_many({ "email": self.EMAIL })
