#!/usr/bin/env python
import sys
import subprocess as sp
from time import strftime
from os import path

chars = {
    'arc_down_right': '\u256D',
    'horizontal': '\u2500',
    'arc_up_left': '\u2570'
}


def with_color(string, color, bold=False, underline=False, background=False,
               high_intensity=False):
    colors = {
        'black': 0,
        'red': 1,
        'green': 2,
        'yellow': 3,
        'blue': 4,
        'purple': 5,
        'cyan': 6,
        'white': 7
    }

    def format_face():
        if underline:
            return '4'

        if bold:
            return '1'

        return '0'

    def format_color():
        codes = {
            (False, False): 30,
            (False, True): 40,
            (True, False): 90,
            (True, True): 100
        }

        return str(colors.get(color) + codes[(high_intensity, background)])

    return '\\[\e[{0};{1}m\\]{2}\\[\e[0m\\]'.format(
        format_face(),
        format_color(),
        string)


def cwd():
    return '\w'


def git_info():
    try:
        try:
            branch_name = sp.check_output(
                ['git', 'symbolic-ref', 'HEAD', '--short', '--quiet']
            ).decode('utf-8')
            branch_name = branch_name.strip()
        except sp.CalledProcessError:
            branch_name = '<detached>'

        uncommited = sp.call(['git', 'diff', '--quiet',
                              '--ignore-submodules', 'HEAD'])

        unmerged = sp.check_output(['git', 'ls-files', '--unmerged'])
        unmerged = unmerged.decode('utf-8')

        green_check = with_color(' \u2713', 'green')
        red_check = with_color(' \u2718', 'red')
        unmerged_indicator = with_color(' \u26a1', 'blue')
        return '{1}{2}{0}'.format(with_color('({})'.format(branch_name), 'green'),
                                     red_check if uncommited else green_check,
                                     unmerged_indicator if unmerged else '')
    except:
        return ''


def error_level():
    e = sys.argv[1]

    return ((' ' + with_color(' {0} '.format(e), 'red', background=True) + ' ')
            if e != '0' else '')


def venv_path():
    try:
        exec_path = sys.base_exec_prefix
        parts = exec_path.split(path.sep)
        parts = parts[(len(parts) - 3):(len(parts) - 1)] \
            if len(parts) > 2 else parts
        return "/".join(parts)
    except Exception as e:
        return 'Unresolved'


def venv_info():
    has_python = int(sys.argv[2]) if len(sys.argv) > 2 else 0

    return ("{1}{0}".format(
        with_color("({})".format(venv_path()), 'green'),
        with_color("\U0001F40D", 'yellow', bold=True)
    )
            if has_python else "")


def currtime():
    return ' {} '.format(with_color(strftime('%H:%M:%S'), 'green'))


def prompt():

    val = [
            with_color(
                chars['arc_down_right'] +
                chars['horizontal'] +
                chars['horizontal'], 'blue'
            ),


            currtime(),
            cwd(),
            # with_color(' (', 'green'),
            git_info(),
            with_color(' ', 'green'),
            venv_info(),
            # with_color(')', 'green'),
            '\n',
            with_color(chars['arc_up_left'] + chars['horizontal'], 'blue'),
            '$ '
        ]
    return "".join(val)



if __name__ == "__main__":
    sys.stdout.write(prompt())
