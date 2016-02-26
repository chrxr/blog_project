from django.db import models
from django.contrib.syndication.views import Feed
from django.core.urlresolvers import reverse
from blog.models import BlogPage

class BlogsFeed(Feed):
    title = "My blog articles"
    link = "/blogs-feed/"
    description = "All of my blogs as the are published"

    def items(self):
        return BlogPage.objects.live().order_by('-date')

    def item_title(self, item):
        return item.title

    def item_description(self, item):
        return item.intro

    def item_link(self, item):
        base_url = item.get_absolute_url()
        amp_url = base_url + "amp"
        return amp_url
