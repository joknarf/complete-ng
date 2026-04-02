[![Joknarf Tools](https://img.shields.io/badge/Joknarf%20Tools-Visit-darkgreen?logo=github)](https://joknarf.github.io/joknarf-tools)
[![bash](https://img.shields.io/badge/shell-bash%20|%20zsh%20-blue.svg)]()
[![Licence](https://img.shields.io/badge/licence-MIT-blue.svg)](https://shields.io/)

# complete-ng
bash/zsh <kbd>Tab</kbd> completion nextgen with interactive/search menu

## features

* replace bash/zsh completion multiple choices output by interactive selector menu
* browse directories inside the menu
* view/edit files directly from the menu
* single <kbd>Tab</kbd> on command line displays choices
* launch menu from empty command line with <kbd>Tab</kbd> to browse files/directories

## pre-requisites

* gnu awk (need brew install gawk on macOS)
* gnu grep (need brew install grep on macOS)

## install

You can use a shell plugin manager like the famous [thefly](https://github.com/joknarf/thefly) (multi shell plugin/dotfiles manager and teleporter anywhere)
```
fly add joknarf/complete-ng
```
or just
```
git clone https://github.com/joknarf/complete-ng
source complete-ng/complete-ng.plugin.<yourshell>
```

for a complete next-gen shell experience, see also this project:

* [joknarf/shell-ng](https://github.com/joknarf/shell-ng) : compilation of joknarf shell plugins which includes
  * [joknarf/nerdp](https://github.com/joknarf/nerdp) : dynamic PS1 prompt (you can see it in the demo)
  * [joknarf/complete-ng](https://github.com/joknarf/complete-ng) : Tab completion nextgen (this plugin)
  * [joknarf/redo](https://github.com/joknarf/redo) : replacement of shell history command search (<kbd>Ctrl</kbd><kbd>R</kbd> or <kbd>Esc</kbd><kbd>/</kbd>) with interactive menu
  * [joknarf/seedee](https://github.com/joknarf/seedee) :  directory history navigation with arrows + interactive menu

## demo

![complete-ng](https://github.com/joknarf/complete-ng/assets/10117818/e8993060-4134-4ab5-8a1f-c2ea6d0d5696)

![demo](https://github.com/joknarf/complete-ng/assets/10117818/44831cb1-ea69-4982-9852-e339a453e803)

## file/folder icons

As depending to your terminal font, the icons may not render correctly, you can choose the icons you want using environment variables, here are some sample of dir/file icons, choose the ones fitting your terminal font (use nerd version of your font to have more choice):
```
SELECTOR_FOLDER_ICON='' # 🖿 🗀 📁 📂 🖿         
SELECTOR_FILE_ICON=''   #  🗎            🗋 🖹  
```

## keys in menu

|key                             | action                                                |
|--------------------------------|-------------------------------------------------------|
|<kbd>▼</kbd>                    | select next item                                      | 
|<kbd>▲</kbd>                    | select prev item                                      |
|<kbd>End</kbd>                  | select last item                                      |
|<kbd>Home</kbd>                 | select first item                                     | 
|<kbd>▶</kbd>                    | browse selected directory                             |
|<kbd>◀</kbd>                    | browse parent directory                               |
|<kbd>F3</kbd>                   | view file using PAGER (or less)                       |
|<kbd>F4</kbd>                   | edit file usint EDITOR (or vi)                        |
|<kbd>Shift</kbd><kbd>▼</kbd>/<kbd>PgUp</kbd>/<kbd>Ctl</kbd><kbd>F</kbd>| next page      |
|<kbd>Shift</kbd><kbd>▲</kbd>/<kbd>PgDn</kbd>/<kbd>Ctl</kbd><kbd>B</kbd>| previous page  |
|<kbd>Esc</kbd>                  | exit                                                  |
|<kbd>Ctrl</kbd><kbd>A</kbd>     | use all screen to display menu                        |
|<kbd>Enter</kbd>/<kbd>Tab</kbd> | put selected item on command line                     |

