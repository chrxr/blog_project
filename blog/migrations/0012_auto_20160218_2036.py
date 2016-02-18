# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0011_auto_20160218_2034'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bookmark',
            name='notes',
            field=wagtail.wagtailcore.fields.RichTextField(null=True, blank=True, verbose_name='Bookmark notes'),
        ),
    ]
