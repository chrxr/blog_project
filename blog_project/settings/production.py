from .base import *


# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False
TEMPLATE_DEBUG = False

SECRET_KEY = os.environ.get("SECRET_KEY")

ALLOWED_HOSTS = os.environ.get("DJANGO_ALLOWED_HOSTS").split(" ")

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

LOGGING = { 
    'version': 1, 
    'disable_existing_loggers': False,
    'handlers': {
    	'file': {
    		'level': 'DEBUG',
    		'class': 'logging.FileHandler',
    		'filename': BASE_DIR + '/debug.log',
    	},
    },
    'loggers': {
        'django.request': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}

# CACHES = {
#     'default': {
#         'BACKEND': 'django.core.cache.backends.memcached.MemcachedCache',
#         'LOCATION': [
#             '127.0.0.1:11211',
#         ]
#     }
# }

try:
    from .local import *
except ImportError:
    pass
