# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('wagtailcore', '0023_alter_page_revision_on_delete_behaviour'),
        ('blog', '0012_auto_20160218_2036'),
    ]

    operations = [
        migrations.CreateModel(
            name='BookmarkPage',
            fields=[
                ('page_ptr', models.OneToOneField(auto_created=True, to='wagtailcore.Page', parent_link=True, primary_key=True, serialize=False, on_delete=models.CASCADE)),
                ('intro', models.CharField(blank=True, max_length=250, null=True)),
            ],
            options={
                'abstract': False,
            },
            bases=('wagtailcore.page',),
        ),
    ]
