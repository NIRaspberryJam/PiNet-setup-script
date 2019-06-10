import requests
import pwd
import json
from secret import api_key

users = pwd.getpwall()
usernames = []
for user in users:
    if user.pw_uid > 1000:
        usernames.append(user.pw_name)

data = {"usernames": usernames, "token":api_key}
requests.post("https://workshops.niraspberryjam.com/api/upload_pinet_usernames", json=json.dumps(data))