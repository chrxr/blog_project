# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import modelcluster.fields
import modelcluster.contrib.taggit


class Migration(migrations.Migration):

    dependencies = [
        ('taggit', '0001_initial'),
        ('blog', '0007_auto_20150621_2048'),
    ]

    operations = [
        migrations.CreateModel(
            name='BlogPageTag',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('content_object', modelcluster.fields.ParentalKey(related_name='tagged_items', to='blog.BlogPage')),
                ('tag', models.ForeignKey(related_name='blog_blogpagetag_items', to='taggit.Tag', on_delete=models.CASCADE)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='blogpage',
            name='tags',
            field=modelcluster.contrib.taggit.ClusterTaggableManager(to='taggit.Tag', through='blog.BlogPageTag', blank=True, help_text='A comma-separated list of tags.', verbose_name='Tags'),
        ),
    ]
