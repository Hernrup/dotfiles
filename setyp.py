#!/usr/bin/env python
import os
from os.path import expanduser
from os.path import join
import tempfile
from datetime import datetime

files_to_move = [
    ('.bash_functions', ''),
    ('.bash_profile', ''),
    ('.bashrc', ''),
    ('.gitignore', ''),
    ('.vimrc', ''),
    ('.ideavimrc', ''),
    ('bash_prompt.py', ''),
    ('pycharm_keymap_custom.xml', '.PyCharm40/config/keymaps')
]

base_path = os.path.realpath(os.path.dirname(__file__))


def get_user_folder():
    return expanduser("~")


def get_backup_name(path):
    return join(
        os.path.dirname(path),
        "{}_{}".format(
            os.path.basename(path),
            datetime.now().strftime("%Y%m%d-%H_%M_%S")
        ))


def link(src, dest):
    if not os.path.exists(src):
        raise ValueError("{} does not exist".format(src))

    if os.path.islink(dest):
        os.unlink(dest)
        print("{}: UNLINKED".format(dest))

    if os.path.exists(dest):
        backup_name = get_backup_name(dest)
        os.rename(dest, backup_name)
        print("{} -> {}: BACKUP CREATED".format(dest, backup_name))

    try:
        os.symlink(src, dest)
        print("{} -> {}: LINKED".format(src, dest))
    except Exception as e:
        print("{}: ERROR".format(e))


def link_files():
    for r in files_to_move:
        f, d = r
        link(join(base_path, f), join(get_user_folder(), d, f))

if __name__ == '__main__':
    link_files()
