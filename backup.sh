#!/bin/bash

#Purpose = Backing up postgres db

#START

TIME=`date +%b-%d-%y`

FILENAME=backup-$TIME.sql

DATABASE=blog_project

DESDIR=/home/chrxr/blog_project/backups

pg_dump $DATABASE > $DESDIR/$FILENAME

#END 
