#!/usr/bin/env bash
echo "SEENODE BUILD 0ec8993 STARTED"

set -o errexit

echo "===== BUILD START ====="
echo "Commit/environment check:"
pwd
python --version

echo "===== REQUIREMENTS ====="
cat requirements.txt

pip install -r requirements.txt

echo "===== INSTALLED PACKAGES ====="
pip show djangorestframework-simplejwt
pip show djangorestframework

echo "===== DJANGO CHECK ====="
python manage.py check

echo "===== COLLECT STATIC ====="
python manage.py collectstatic --no-input

echo "===== MIGRATE ====="
python manage.py migrate

echo "===== BUILD COMPLETE ====="