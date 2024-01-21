#!/usr/bin/python3
""" Function that deploys """
from fabric.api import *

env.hosts = ['100.25.143.99', '54.87.240.11']
env.user = 'ubuntu'

def do_clean(number=0):
    """Deletes out-of-date archives"""
    number = int(number)
    if number < 0:
        return False
    number += 1

    # Local clean
    local("cd versions; ls -t | tail -n +{} | xargs rm -rf".format(number))

    # Remote clean
    run("cd /data/web_static/releases; ls -t | tail -n +{} | xargs rm -rf".format(number))