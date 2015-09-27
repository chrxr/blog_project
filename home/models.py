from django.db import models

from django.shortcuts import render
from wagtail.wagtailcore.models import Page, Site
from wagtail.wagtailcore.fields import RichTextField
from wagtail.wagtailadmin.edit_handlers import FieldPanel
from blog.models import BlogPage


class HomePage(Page):
    body = RichTextField(blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('body')
    ]

    def serve(self, request):
        # Get blogs
        blogs = BlogPage.objects.filter(live=True)
        blogs = blogs.order_by('-date')

        tag = request.GET.get('tag')
        print(tag)
        if tag:
            blogs = blogs.filter(tags__name=tag)
        show_nav = True
        return render(request, self.template, {
            'self': self,
            'blogs': blogs,
            'show_nav': show_nav,
        })
