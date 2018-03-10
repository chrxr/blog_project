# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.core.blocks
import wagtail.images.blocks
import wagtail.core.fields


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0008_auto_20150624_1226'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blogindexrelatedlink',
            name='link_external',
            field=models.URLField(blank=True, verbose_name='External link'),
        ),
        migrations.AlterField(
            model_name='blogindexrelatedlink',
            name='title',
            field=models.CharField(help_text='Link title', max_length=255),
        ),
        migrations.AlterField(
            model_name='blogpage',
            name='body',
            field=wagtail.core.fields.StreamField((('heading', wagtail.core.blocks.CharBlock(classname='full title', icon='title')), ('paragraph', wagtail.core.blocks.RichTextBlock(icon='pilcrow')), ('image', wagtail.images.blocks.ImageChooserBlock(icon='image')), ('codeblock', wagtail.core.blocks.TextBlock(icon='cogs'))), blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='blogpage',
            name='date',
            field=models.DateField(blank=True, verbose_name='Post date', null=True),
        ),
    ]
