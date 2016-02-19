import csv
import django
from django.db import models
from blog.models import Bookmark

django.setup()

bookmarks = Bookmark.objects.all()

for bookmark in bookmarks:
    print bookmark.date_read

with open('csvtest.csv', 'rb') as f:
    reader = csv.reader(f)
    my_list = list(reader)

headings = my_list.pop(0)

for row in my_list:
    new_item = {headings[0]:row[0],headings[1]:row[1], headings[2]:row[2]}
    new_bookmark = Bookmark()
    new_bookmark.title = new_item['title']
    new_bookmark.url = new_item['url']
    new_bookmark.date_read = new_item['date_read']
    new_bookmark.save()
