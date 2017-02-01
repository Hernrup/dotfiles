#!/usr/bin/env python
import os
from os.path import join, abspath, basename, expanduser
from datetime import datetime
from shutil import copyfile


files_to_link = [
    ('.gitignore', ''),
    ('.gitconfig', ''),
    ('.vimrc', ''),
    ('.ideavimrc', ''),
    ('.minttyrc', ''),
    ('.tmux.conf', ''),
    ('.vim', ''),
    ('bin', ''),
    ('.zshrc', ''),
    ('.zsh', ''),
    ('.ctags', ''),
    ('.config', ''),
]

files_to_copy_if_not_existing = [
    ('.gitconfig_local', '')
]

base_path = os.path.realpath(os.path.dirname(__file__))


def get_user_folder():
    path = abspath(expanduser("~"))
    print('Syncing to path: {}'.format(path))
    return path


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

    if os.path.exists(dest):
        backup_name = get_backup_name(dest)
        os.rename(dest, backup_name)
        print("{} -> {}: BACKUP CREATED".format(dest, backup_name))

    try:
        os.symlink(src, dest)
        print("{} -> {}: LINKED".format(src, dest))
    except Exception as e:
        print("{}: ERROR".format(e))


def copy(src, dest):
    if not os.path.exists(src):
        raise ValueError("{} does not exist".format(src))

    if os.path.islink(dest):
        print("{}: Exists. No Copy".format(dest))
        return

    if os.path.exists(dest):
        print("{}: Exists. No Copy".format(dest))
        return

    try:
        copyfile(src, dest)
        print("{} -> {}: COPIED".format(src, dest))
    except Exception as e:
        print("{}: ERROR".format(e))


def link_files(dest_path):
    for r in files_to_link:
        f, d = r
        link(join(base_path, f), join(dest_path, d, basename(f)))


def copy_files(dest_path):
    for r in files_to_copy_if_not_existing:
        f, d = r
        copy(join(base_path, f), join(dest_path, d, basename(f)))


def sync(dest_path):
    link_files(dest_path)
    copy_files(dest_path)


def main():
    sync(get_user_folder())


if __name__ == '__main__':
    main()
