import os
import pathlib
path = str(pathlib.Path.home()) + "/.oh-my-zsh"
print(path)
if os.path.isdir(path):
    print("OK")
else:
    print("NO")
