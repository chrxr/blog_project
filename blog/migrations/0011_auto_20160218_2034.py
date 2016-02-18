# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import blog.models
import wagtail.wagtailimages.blocks
import wagtail.wagtailcore.fields
import modelcluster.contrib.taggit
import wagtail.wagtailcore.blocks
import modelcluster.fields


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailcore', '0020_add_index_on_page_first_published_at'),
        ('taggit', '0001_initial'),
        ('blog', '0010_auto_20150707_2114'),
    ]

    operations = [
        migrations.CreateModel(
            name='Bookmark',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, verbose_name='ID', serialize=False)),
                ('url', models.URLField(verbose_name='Bookmark URL')),
                ('title', models.CharField(max_length=255, blank=True, verbose_name='Bookmark title')),
                ('notes', models.CharField(max_length=255, blank=True, verbose_name='Bookmark notes')),
                ('date_read', models.DateField()),
            ],
        ),
        migrations.CreateModel(
            name='BookmarkPlacement',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, verbose_name='ID', serialize=False)),
                ('page', modelcluster.fields.ParentalKey(to='wagtailcore.Page', related_name='bookmark_placements')),
                ('quote', models.ForeignKey(to='blog.Bookmark', related_name='+')),
            ],
        ),
        migrations.CreateModel(
            name='BookmarkTag',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, verbose_name='ID', serialize=False)),
                ('content_object', modelcluster.fields.ParentalKey(to='blog.Bookmark', related_name='tagged_items')),
                ('tag', models.ForeignKey(to='taggit.Tag', related_name='blog_bookmarktag_items')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AlterField(
            model_name='blogpage',
            name='body',
            field=wagtail.wagtailcore.fields.StreamField((('heading', wagtail.wagtailcore.blocks.CharBlock(classname='full title', icon='title')), ('paragraph', wagtail.wagtailcore.blocks.RichTextBlock(icon='pilcrow')), ('image', wagtail.wagtailimages.blocks.ImageChooserBlock(icon='image')), ('codeblock', wagtail.wagtailcore.blocks.TextBlock(icon='cogs')), ('markdown', blog.models.MarkDownBlock()), ('real_codeblock', wagtail.wagtailcore.blocks.StructBlock((('language', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[('bash', 'Bash/Shell'), ('css', 'CSS'), ('django', 'Django templating language'), ('html', 'HTML'), ('javascript', 'Javascript'), ('python', 'Python'), ('scss', 'SCSS')])), ('code', wagtail.wagtailcore.blocks.TextBlock()))))), blank=True, null=True),
        ),
        migrations.AddField(
            model_name='bookmark',
            name='tags',
            field=modelcluster.contrib.taggit.ClusterTaggableManager(verbose_name='Tags', blank=True, to='taggit.Tag', through='blog.BookmarkTag', help_text='A comma-separated list of tags.'),
        ),
    ]
