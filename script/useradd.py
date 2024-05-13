#!/usr/bin/python
import os 

def useradd(username):
    str(username)
    cm = "sudo useradd -m -s /usr/bin/bash " + username
    print("[command]" + cm)
    if os.system(cm) != 0 :
        print("[log]用户:"+username+"创建失败")
    else:
        print("[log]用户:"+username+"创建成功")

with open("username.txt", 'r') as file:
    users = file.readlines()
    for user in users:
        user = user.strip('\n')
        useradd(user)

