from .base import *


# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False
TEMPLATE_DEBUG = False

EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'

ALLOWED_HOSTS = ['chrxr.com']

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

try:
    from .local import *
except ImportError:
    pass
