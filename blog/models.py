from django.db import models

from modelcluster.fields import ParentalKey
from modelcluster.tags import ClusterTaggableManager
from taggit.models import Tag, TaggedItemBase
from django.shortcuts import render
from wagtail.wagtailcore.models import Page, Orderable, Site
from wagtail.wagtailcore.fields import RichTextField, StreamField
from wagtail.wagtailcore.blocks import TextBlock, ChooserBlock, StructBlock, ListBlock, StreamBlock, FieldBlock, CharBlock, RichTextBlock, PageChooserBlock, RawHTMLBlock
from wagtail.wagtailadmin.edit_handlers import (FieldPanel,
                                                InlinePanel,
                                                MultiFieldPanel,
                                                PageChooserPanel,
                                                StreamFieldPanel,)
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtailimages.blocks import ImageChooserBlock
from wagtail.wagtailsearch import index


class BlogPageTag(TaggedItemBase):
    content_object = ParentalKey('blog.BlogPage', related_name='tagged_items')

class BlogPage(Page):
    subtitle = models.CharField(max_length=255, null=True, blank=True)
    main_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    date = models.DateField("Post date", null=True, blank=True)
    intro = models.CharField(max_length=250, null=True, blank=True)
    body = StreamField([
        ('heading', CharBlock(classname="full title", icon='title')),
        ('paragraph', RichTextBlock(icon='pilcrow')),
        ('image', ImageChooserBlock(icon='image')),
        ('codeblock', TextBlock(icon='cogs')),
    ], blank=True, null=True)
    tags = ClusterTaggableManager(through=BlogPageTag, blank=True)
    listing_intro = RichTextField(null=True, blank=True)
    listing_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
      )

    search_fields = Page.search_fields + (
        index.SearchField('intro'),
        index.SearchField('body'),
    )

    content_panels = Page.content_panels + [
        FieldPanel('subtitle'),
        ImageChooserPanel('main_image'),
        FieldPanel('date'),
        FieldPanel('intro'),
        StreamFieldPanel('body'),
        FieldPanel('tags'),
    ]

    promote_panels = Page.promote_panels + [
        FieldPanel('listing_intro'),
        ImageChooserPanel('listing_image'),
    ]

    # @property
    # def site_root(self):
    #     return site.root_page

    def serve(self, request):
        # Get blogs
        site_root = self.get_parent()
        return render(request, self.template, {
            'self': self,
            'site_root': site_root,
        })

class LinkFields(models.Model):
    link_external = models.URLField("External link", blank=True)
    link_page = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        related_name='+'
    )

    @property
    def link(self):
        if self.link_page:
            return self.link_page.url
        else:
            return self.link_external

    panels = [
        FieldPanel('link_external'),
        PageChooserPanel('link_page'),
    ]

    class Meta:
        abstract = True


# Related links
class RelatedLink(LinkFields):
    title = models.CharField(max_length=255, help_text="Link title")

    panels = [
        FieldPanel('title'),
        MultiFieldPanel(LinkFields.panels, "Link"),
    ]

    class Meta:
        abstract = True


class BlogIndexRelatedLink(Orderable, RelatedLink):
    page = ParentalKey('BlogIndexPage', related_name='related_links')


class BlogIndexPage(Page):
    intro = RichTextField(blank=True)

    content_panels = Page.content_panels + [
        InlinePanel('related_links', label="Related links"),
    ]