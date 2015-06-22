# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailimages', '0006_add_verbose_names'),
        ('blog', '0006_auto_20150621_1957'),
    ]

    operations = [
        migrations.AddField(
            model_name='blogpage',
            name='listing_image',
            field=models.ForeignKey(related_name='+', on_delete=django.db.models.deletion.SET_NULL, blank=True, to='wagtailimages.Image', null=True),
        ),
        migrations.AddField(
            model_name='blogpage',
            name='listing_intro',
            field=wagtail.wagtailcore.fields.RichTextField(null=True, blank=True),
        ),
    ]
