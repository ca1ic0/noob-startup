#!/usr/bin/python
import os 
import time
import subprocess
import random
def useradd(username):
    str(username)
    cm = "sudo useradd -m -s /usr/bin/bash " + username
    print("[command]" + cm)
    if os.system(cm) != 0 :
        print("[log]用户:"+username+"创建失败")
        return ()
    else:
        print("[log]用户:"+username+"创建成功")
        now = time.localtime()
        formatted_date = time.strftime("%H%M%S", now)
        password = username  + str(random.randint(1,100))  + str(formatted_date)  
        cm = f"echo {username}:{password} | sudo chpasswd"
        if os.system(cm) != 0 :
            print("[log]用户:"+username+"密码变更失败")
        else:
            print("[log]用户:"+username+"密码:"+password)

        return (username , password)
    
with open("username.txt", 'r') as file:
    with open("user-pass.txt" , "w") as output:
        users = file.readlines()
        for user in users:
            user = user.strip('\n')
            a = useradd(user)
            if a != () :
                print(a , file=output)
                #记录用户账号密码
            

