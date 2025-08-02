
from .settings_base import *

# Base directory van het project (komt uit settings_base, maar expliciet kan geen kwaad)
BASE_DIR = Path(__file__).resolve().parent.parent

# Debug altijd uit in productie
DEBUG = True

# Load environment variables for production
load_dotenv(BASE_DIR.parent / ".env.production")

# Vereiste: ALLOWED_HOSTS moet gevuld zijn in productie
ALLOWED_HOSTS = os.getenv("ALLOWED_HOSTS", "").split(",")
if not ALLOWED_HOSTS or ALLOWED_HOSTS == ['']:
    raise Exception("ALLOWED_HOSTS environment variable must be set in production")




# Secret key ophalen (moet aanwezig zijn in productie)
SECRET_KEY = os.getenv('DJANGO_SECRET_KEY')
if not SECRET_KEY:
    raise Exception("DJANGO_SECRET_KEY must be set in production environment")

# Security settings: verplicht en strak in productie
SECURE_SSL_REDIRECT = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True
SECURE_HSTS_SECONDS = 3600
SECURE_HSTS_INCLUDE_SUBDOMAINS = True
SECURE_HSTS_PRELOAD = True
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

# Database configuratie via environment variables (aanpassen voor jouw DB)
DATABASES = {
    'default': {
        'ENGINE': "django.db.backends.postgresql",
        'NAME': os.getenv("POSTGRES_DB"),
        'USER': os.getenv("POSTGRES_USER"),
        'PASSWORD': os.getenv("POSTGRES_PASSWORD"),
        'HOST': os.getenv("POSTGRES_HOST", "db"),
        'PORT': os.getenv("POSTGRES_PORT", "5432"),
    }
}


required_db_vars = ["POSTGRES_DB", "POSTGRES_USER", "POSTGRES_PASSWORD", "POSTGRES_HOST"]
for var in required_db_vars:
    if not os.getenv(var):
        raise Exception(f"Environment variable {var} must be set for production database connection")
