# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import wagtail.wagtailcore.fields
import wagtail.wagtailcore.blocks
import wagtail.wagtailimages.blocks
import blog.models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0009_auto_20150630_0644'),
    ]

    operations = [
        migrations.AlterField(
            model_name='blogpage',
            name='body',
            field=wagtail.wagtailcore.fields.StreamField([(b'heading', wagtail.wagtailcore.blocks.CharBlock(classname=b'full title', icon=b'title')), (b'paragraph', wagtail.wagtailcore.blocks.RichTextBlock(icon=b'pilcrow')), (b'image', wagtail.wagtailimages.blocks.ImageChooserBlock(icon=b'image')), (b'codeblock', wagtail.wagtailcore.blocks.TextBlock(icon=b'cogs')), (b'markdown', blog.models.MarkDownBlock()), (b'real_codeblock', wagtail.wagtailcore.blocks.StructBlock([(b'language', wagtail.wagtailcore.blocks.ChoiceBlock(choices=[(b'bash', b'Bash/Shell'), (b'css', b'CSS'), (b'django', b'Django templating language'), (b'html', b'HTML'), (b'javascript', b'Javascript'), (b'python', b'Python'), (b'scss', b'SCSS')])), (b'code', wagtail.wagtailcore.blocks.TextBlock())]))], null=True, blank=True),
        ),
    ]
