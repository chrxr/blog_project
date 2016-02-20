# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import taggit.managers


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0013_bookmarkpage'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bookmark',
            name='tags',
            field=taggit.managers.TaggableManager(help_text='A comma-separated list of tags.', blank=True, verbose_name='Tags', through='blog.BookmarkTag', to='taggit.Tag'),
        ),
    ]
