import os
from os.path import join

target = 'x86_64-apple-darwin-'
bin_dir = join(os.getenv('PREFIX'), 'bin')

for fn in os.listdir(bin_dir):
    if fn.startswith(target):
        os.rename(join(bin_dir, fn),
                  join(bin_dir, fn.replace(target, '')))
