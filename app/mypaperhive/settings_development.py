import os
from pathlib import Path
from dotenv import load_dotenv

from .settings_base import *

# Base directory of the project
BASE_DIR = Path(__file__).resolve().parent.parent

# Load environment variables from .env.development only
load_dotenv(BASE_DIR.parent / ".env.development")

# Secret key (required)
SECRET_KEY = os.getenv('DJANGO_SECRET_KEY')
if not SECRET_KEY:
    raise Exception("DJANGO_SECRET_KEY is not set in the environment")

# DEBUG mode for development (default True)
DEBUG = os.getenv("DEBUG", "True").lower() in ("true", "1", "yes")

# Allowed hosts, fallback to localhost if empty
ALLOWED_HOSTS = os.getenv("ALLOWED_HOSTS", "localhost,127.0.0.1").split(",")

# Database configuration with fallback to local SQLite
DATABASES = {
    'default': {
        'ENGINE': os.getenv("DATABASE_ENGINE", "django.db.backends.sqlite3"),
        'NAME': os.getenv("DATABASE_NAME", BASE_DIR / 'db.sqlite3'),
        'USER': os.getenv("DATABASE_USER", ""),
        'PASSWORD': os.getenv("DATABASE_PASSWORD", ""),
        'HOST': os.getenv("DATABASE_HOST", ""),
        'PORT': os.getenv("DATABASE_PORT", ""),
    }
}

# Security settings - can be relaxed in development if you want
SECURE_SSL_REDIRECT = False
SESSION_COOKIE_SECURE = False
CSRF_COOKIE_SECURE = False
SECURE_HSTS_SECONDS = 0
SECURE_HSTS_INCLUDE_SUBDOMAINS = False
SECURE_HSTS_PRELOAD = False

# Static files directory for collectstatic
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
