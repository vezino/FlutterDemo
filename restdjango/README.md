# Restapi

## Get Python

https://www.python.org/downloads/release/python-3810/


## Virtual env create

Create destination directory:

mkdir restdjango

python3 -m venv /Users/jmrivero/Dev_Boxes/FlutterDemo/restdjango

## Activate venv:
- cd /Users/jmrivero/Dev_Boxes/FlutterDemo/restdjango/
- source bin/activate

## Install Django and requirments
- pip install -r requirements.txt


## Create and migrate DB
- python manage.py migrate

## Create supersuser
- python manage.py createsuperuser

## Access Restapi Admin:

http://localhost:8000/admin


## restapi endpoint
http://localhost:8000/api-token-auth/


## Run Django Server

python manage.py runserver [::]:8000 --noreload


## Get auth token
curl -X POST -H "Content-Type: application/json" \
 -d '{"username":"loki","password":"Wh1te_strip35"}' \
http://localhost:8000/api-token-auth/


## Get user list
curl -H "Authorization":"Token ddb95e01bc4a8c9af8a65742d91d72fbeb796054" http://localhost:8000/api/user/

