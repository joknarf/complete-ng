# complete-ng
bash completion nextgen

* replace bash completion multiple choices output by interactive selector menu
* browse directories inside the menu
* view/edit files directly from the menu
* single <kbd>tab</kbd> on command line displays choices
* launch menu from empty command line with <tab> to browse files/directories

# usage

```
source ./complete-ng
```
* need to be sourced after bash_completion 

## keys in menu

|key                             | action                                                |
|--------------------------------|-------------------------------------------------------|
|<kbd>⇩</kbd>                    | select next item                                      | 
|<kbd>⇧</kbd>                    | select prev item                                      |
|<kbd>End</kbd>                  | select last item                                      |
|<kbd>Home</kbd>                 | select first item                                     | 
|<kbd>⇨</kbd>                    | browse selected directory                             |
|<kbd>⇦</kbd>                    | browse parent directory                               |
|<kbd>F3</kbd>                   | view file using PAGER (or less)                       |
|<kbd>F4</kbd>                   | edit file usint EDITOR (or vi)                        |
|<kbd>Shift</kdb>+<kbd>⇩</kbd>/<kbd>PgUp</kbd>/<kbd>Ctl</kbd>+<kbd>F</kbd>| next page    |
|<kbd>Shift</kdb>+<kbd>⇧</kbd>/<kbd>PgDn</kbd>/<kbd>Ctl</kbd>+<kbd>B</kbd>| previous page|
|<kbd>Esc</kbd>                  | exit                                                  |
|<kbd>Ctrl</kbd>+<kbd>A</kbd>    | use all screen to display menu                        |
|<kbd>Enter</kbd>/<kbd>Tab</kbd> | put selected item on command line                     |

