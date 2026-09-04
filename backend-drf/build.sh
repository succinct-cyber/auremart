#!/usr/bin/env bash
set -o errexit

echo "========== CLICKMART NEW BUILD =========="
echo "BUILD MARKER: 2026-09-04-CLICKMART-001"
echo "Current directory:"
pwd

echo "Python:"
python --version

echo "Requirements:"
cat requirements.txt

echo "========== INSTALLING =========="
pip install -r requirements.txt

echo "========== CHECKING SIMPLEJWT =========="
python -c "import rest_framework_simplejwt; print('SIMPLEJWT OK')"

echo "========== DJANGO CHECK =========="
python manage.py check

echo "========== COLLECT STATIC =========="
python manage.py collectstatic --no-input

echo "========== MIGRATE =========="
python manage.py migrate

echo "========== BUILD COMPLETE =========="