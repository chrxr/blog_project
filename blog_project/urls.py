from django.conf.urls import include, url
from django.conf import settings
from django.contrib import admin

from wagtail.admin import urls as wagtailadmin_urls
from wagtail.documents import urls as wagtaildocs_urls
from wagtail.core import urls as wagtail_urls
from wagtail.contrib.sitemaps.views import sitemap
from blog_feed.feeds import BlogsFeed, BlogsFeedAmp
from search.views import search



urlpatterns = [
    url(r'django-admin/', admin.site.urls),

    url(r'admin/', include(wagtailadmin_urls)),
    url(r'documents/', include(wagtaildocs_urls)),

    url(r'search/$', search, name='search'),
    url('sitemap\.xml$', sitemap),
    url(r'amp-feed/$', BlogsFeedAmp()),
    url(r'blog-feed/$', BlogsFeed()),
    url(r'', include(wagtail_urls)),
]


if settings.DEBUG:  
    from django.conf.urls.static import static
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns
    from django.views.generic import TemplateView

    # Serve static and media files from development server
    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
