from django.db import models

from django.utils.safestring import mark_safe
from markdown import markdown
from pygments import highlight
from pygments.formatters import get_formatter_by_name
from pygments.lexers import get_lexer_by_name

from modelcluster.fields import ParentalKey
from modelcluster.tags import ClusterTaggableManager
from modelcluster.models import ClusterableModel

from taggit.models import Tag, TaggedItemBase
from taggit.managers import TaggableManager
from django.shortcuts import render
from wagtail.wagtailcore.models import Page, Orderable, Site
from wagtail.wagtailcore.fields import RichTextField, StreamField
from wagtail.wagtailcore.blocks import ChoiceBlock, TextBlock, ChooserBlock, StructBlock, ListBlock, StreamBlock, FieldBlock, CharBlock, RichTextBlock, PageChooserBlock, RawHTMLBlock
from wagtail.wagtailadmin.edit_handlers import (FieldPanel,
                                                InlinePanel,
                                                MultiFieldPanel,
                                                PageChooserPanel,
                                                StreamFieldPanel,)
from wagtail.contrib.wagtailroutablepage.models import RoutablePageMixin, route
from wagtail.wagtailimages.edit_handlers import ImageChooserPanel
from wagtail.wagtailimages.blocks import ImageChooserBlock
from wagtail.wagtailsearch import index
from wagtail.wagtailsnippets.models import register_snippet

# -- Start snippets -- #

class BookmarkTag(TaggedItemBase):
    content_object = ParentalKey('blog.Bookmark', related_name='tagged_items')

class Bookmark(ClusterableModel):
    url = models.URLField("Bookmark URL")
    title = models.CharField("Bookmark title", max_length=255, blank=True)
    notes = RichTextField("Bookmark notes", null=True, blank=True)
    date_read = models.DateField()
    tags = TaggableManager(through=BookmarkTag, blank=True)

    panels = [
        FieldPanel('url'),
        FieldPanel('title'),
        FieldPanel('notes'),
        FieldPanel('date_read'),
        FieldPanel('tags'),
    ]

    def __str__(self):
        return self.title.encode("utf8")

register_snippet(Bookmark)


class BookmarkPlacement(models.Model):
    page = ParentalKey('wagtailcore.Page', related_name='bookmark_placements')
    quote = models.ForeignKey('blog.Bookmark', related_name='+')

# -- End snippets -- #

class BlogPageTag(TaggedItemBase):
    content_object = ParentalKey('blog.BlogPage', related_name='tagged_items')

class CodeBlock(StructBlock):
    """
    Code Highlighting Block
    """
    LANGUAGE_CHOICES = (
        ('bash', 'Bash/Shell'),
        ('css', 'CSS'),
        ('django', 'Django templating language'),
        ('html', 'HTML'),
        ('javascript', 'Javascript'),
        ('python', 'Python'),
        ('scss', 'SCSS'),
    )

    language = ChoiceBlock(choices=LANGUAGE_CHOICES)
    code = TextBlock()

    class Meta:
        icon = 'code'

    def render(self, value):
        src = value['code'].strip('\n')
        lang = value['language']

        lexer = get_lexer_by_name(lang)
        formatter = get_formatter_by_name(
            'html',
            linenos=None,
            cssclass='codehilite',
            style='default',
            noclasses=False,
        )
        return mark_safe(highlight(src, lexer, formatter))


class MarkDownBlock(TextBlock):
    """ MarkDown Block """

    class Meta:
        icon = 'code'

    def render_basic(self, value):
        md = markdown(
            value,
            [
                'markdown.extensions.fenced_code',
                'codehilite',
            ],
        )
        return mark_safe(md)


class BlogPage(RoutablePageMixin, Page):
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
        ('markdown', MarkDownBlock()),
        ('real_codeblock', CodeBlock()),
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

    @property
    def home_page(self):
        return self.get_parent()

    @property
    def next_blog(self):
        blogs = BlogPage.objects.filter(live=True).order_by('-date')
        current_index = blogs.index(self)

    def get_absolute_url(self):
        return self.full_url

    @route(r'^$', name='normal_blog')
    def normal_blog(self, request):
        site_root = self.get_parent()
        # blogs = BlogPage.objects.filter(live=True).order_by('-date')
        # blog_list = []
        # next_blog = ''
        # previous_blog = ''
        # show_nav = True
        # for blog in blogs:
        #     blog_list.append(blog.id)
        # if self.id:
        #     current_index = blog_list.index(self.id)
        #     if current_index > 0:
        #         previous_index = current_index - 1
        #     next_index = current_index + 1
        #     try:
        #         next_blog = BlogPage.objects.filter(id = blog_list[next_index])
        #     except:
        #         next_blog = '/'
        #     try:
        #         previous_blog = BlogPage.objects.filter(id = blog_list[previous_index])
        #     except:
        #         previous_blog = '/'
        return render(request, self.template, {
            'self': self,
            'site_root': site_root,
            # 'next_blog': next_blog,
            # 'previous_blog': previous_blog,
            # 'show_nav': show_nav,
        })

    @route(r'^amp/$', name='amp_blog')
    def amp_blog(self,request):
        """
        View function for the past events page
        """
        site_root = self.get_parent()
        self.template = 'blog/blog_page_amp.html'

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

class BookmarkPage(Page):
    intro = models.CharField(max_length=250, null=True, blank=True)

    content_panels = Page.content_panels + [
        FieldPanel('intro'),
    ]

    def serve(self, request):
        if request.method == 'GET':
            request_tag = request.GET.get('tag', False)
            if request_tag:
                bookmarks = Bookmark.objects.filter(tags__name__contains=request_tag)
            else:
                bookmarks = Bookmark.objects.all()
        else:
            bookmarks = Bookmark.objects.all()

        tags = []

        for bookmark in bookmarks:
            tag_list = bookmark.tags.all()
            for tag in tag_list:
                tags.append(str(tag.name))

        def f7(seq):
            seen = set()
            seen_add = seen.add
            return [x for x in seq if not (x in seen or seen_add(x))]

        tags = (f7(tags))
        tags = sorted(tags, key=str.lower)

        show_nav = True

        return render(request, self.template, {
            # 'show_nav': show_nav,
            'request_tag': request_tag,
            'self': self,
            'bookmarks': bookmarks,
            'tags': tags,
        })
