# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.core.fields
import wagtail.core.blocks
import wagtail.images.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0005_auto_20150613_1920'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blogpage',
            name='body',
            field=wagtail.core.fields.StreamField([(b'heading', wagtail.core.blocks.CharBlock(classname=b'full title', icon=b'title')), (b'paragraph', wagtail.core.blocks.RichTextBlock(icon=b'pilcrow')), (b'image', wagtail.images.blocks.ImageChooserBlock(icon=b'image')), (b'codeblock', wagtail.core.blocks.TextBlock(icon=b'cogs'))], null=True, blank=True),
        ),
    ]
