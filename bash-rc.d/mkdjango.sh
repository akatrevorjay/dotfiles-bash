#!/bin/bash

alias mkdjango='
if [[ ! -d "$HOME/.virtualenvs/$1" ]]; then
    echo "Creating virtualenv and installing django (git)"
    mkvirtualenv "$1"
    workon "$1"
    pip install -e "git+git://github.com/django/django.git#egg=Django"
fi

django-admin.py startproject \
    --template /home/trevorj/code/github/django-base-template \
    --extension py,md \
    "$1"

pushd "$1"'

