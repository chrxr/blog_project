import csv
import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "blog_project.settings")

import django
from django.db import models

from blog.models import Bookmark

django.setup()

with open('csvtest.csv', 'rt') as f:
    reader = csv.reader(f)
    my_list = list(reader)

headings = my_list.pop(0)

for row in my_list:
    new_item = {}
    i = 0
    for heading in headings:
        new_item[heading] = row[i]
        i = i+1
    new_bookmark = Bookmark()
    new_bookmark.title = new_item['title']
    new_bookmark.url = new_item['url']
    new_bookmark.date_read = new_item['date_read']
    new_bookmark.notes = new_item['notes']
    new_bookmark.save()
