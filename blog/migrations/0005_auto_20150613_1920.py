# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0004_auto_20150613_1908'),
    ]

    operations = [
        migrations.AddField(
            model_name='blogpage',
            name='subtitle',
            field=models.CharField(max_length=255, null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='blogpage',
            name='date',
            field=models.DateField(null=True, verbose_name=b'Post date', blank=True),
        ),
        migrations.AlterField(
            model_name='blogpage',
            name='intro',
            field=models.CharField(max_length=250, null=True, blank=True),
        ),
    ]
