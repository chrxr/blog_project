# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.core.fields
import wagtail.core.blocks
import wagtail.images.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_blogindexpage_blogindexrelatedlink'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blogpage',
            name='body',
            field=wagtail.core.fields.StreamField([(b'heading', wagtail.core.blocks.CharBlock(classname=b'full title', icon=b'title')), (b'paragraph', wagtail.core.blocks.RichTextBlock(icon=b'pilcrow')), (b'image', wagtail.images.blocks.ImageChooserBlock(icon=b'image'))], null=True, blank=True),
        ),
    ]
