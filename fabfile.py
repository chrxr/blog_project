from __future__ import with_statement
from fabric.api import *
from fabric.colors import red


env.roledefs['production'] = ['chrxr@139.59.163.178']

@roles('production')
def deploy_production(branch="master"):
    with cd('/home/chrxr/blog_project'):
        run("git fetch")
        run("git checkout %s" % branch)
        run("git pull")
        run("/home/chrxr/Env/blog_project/bin/pip install -r requirements.txt")
        run("/home/chrxr/Env/blog_project/bin/python manage.py migrate --settings=blog_project.settings.production --noinput")
        run("/home/chrxr/Env/blog_project/bin/python manage.py collectstatic --settings=blog_project.settings.production --noinput")

        sudo("service nginx restart")
        sudo("service uwsgi restart")


def deploy():
    execute(deploy_production)
