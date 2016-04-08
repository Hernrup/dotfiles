#!/usr/bin/env python
from os.path import abspath, dirname, join
from subprocess import call
from argh import ArghParser
from urllib import request
import subprocess
from install_dot_files import main as install_dots
def argh_parse():
    parser = ArghParser()
    parser.add_commands(
        [dump_cygwin_package_list,
         install_cygwin_packages_from_list,
         install_dot_files])
    parser.dispatch()


def dump_cygwin_package_list():
    packagefile = abspath(join(dirname(__file__), 'cygwin_packages'))
    with open(packagefile, 'w') as f:
        call('cygcheck -c -d | sed -e "3,2d" -e \'s/ .*$//',
             shell=True, stdout=f)


def install_cygwin_packages_from_list():
    build = 'setup-x86_64.exe'
    packagefile = abspath(join(dirname(__file__), 'cygwin_packages'))
    setupfile = abspath(join(get_cygwin_folder(), build))
    packages = ','.join([x.strip() for x in open(packagefile).readlines()])
    url = "http://cygwin.com/{}".format(build)
    print(url)
    r = request.urlopen(url)
    open(setupfile, 'wb').write(r.read())
    subprocess.call([setupfile, '-P', packages])


def get_cygwin_folder():
    return join('c:/', 'tools', 'cygwin')


def install_dot_files():
    install_dots()

if __name__ == '__main__':
    argh_parse()
