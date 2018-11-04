#!/usr/bin/python
#find out how get sass working
#/*version 2*/
import re
import os
with open('widgets.jos.css') as f:lines=f.read().splitlines() 
#with open('widgets.jos.1.css') as f:lines=f.read().splitlines() 

print 'process...'
print os.getcwd()

dialog='GtkDialog'
messagedialog='GtkMessageDialog'
popover='GtkPopover'
if re.search('3.20',os.getcwd()):
    print '3.20'
    dialog='dialog'
    messagedialog='messagedialog'
    popover='popover'
else:
    print '3.16'

with open('widgets.css', 'w') as f: 

    #these are the normal defs
    for l in lines:
        m=re.sub('_dialog','',l)
        m=re.sub('_borderwidth','1px',m)
        f.write(m)
        f.write('\n')

    f.write("""/* Portion for green pop up dialogs ********************* */\n """)
    f.write("""/* Portion for green pop up dialogs ********************* */\n """)
    f.write("""/* Portion for green pop up dialogs ********************* */\n """)
    f.write("""/* Portion for green pop up dialogs ********************* */\n """)

    for l in lines:
        m=re.sub('_dialog',dialog,l)
        m=re.sub('bg_gen','bg_menu',m)
        m=re.sub('ts_gen','ts_menu',m)
        m=re.sub('bs_gen','bs_menu',m)
        m=re.sub('sel_gen','sel_menu',m)
        m=re.sub('fg_gen','fg_menu',m)
        m=re.sub('_borderwidth','1px',m)
        f.write(m)
        f.write('\n')

    f.write("""/* Portion for green pop messagedialog ********************* */\n """)
    f.write("""/* Portion for green pop messagedialog ********************* */\n """)
    f.write("""/* Portion for green pop messagedialog ********************* */\n """)
    f.write("""/* Portion for green pop messagedialog ********************* */\n """)

    #these are the same ones inside a dialog
    for l in lines:
        m=re.sub('_dialog',messagedialog,l)
        m=re.sub('bg_gen','bg_menu',m)
        m=re.sub('ts_gen','ts_menu',m)
        m=re.sub('bs_gen','bs_menu',m)
        m=re.sub('sel_gen','sel_menu',m)
        m=re.sub('fg_gen','fg_menu',m)
        m=re.sub('_borderwidth','1px',m)
        f.write(m)
        f.write('\n')

    f.write("""/* Portion for green pop popover ********************* */\n """)
    f.write("""/* Portion for green pop popover ********************* */\n """)
    f.write("""/* Portion for green pop popover ********************* */\n """)
    f.write("""/* Portion for green pop popover ********************* */\n """)

    #these are the same ones inside popover
    for l in lines:
        m=re.sub('_dialog',popover,l)
        m=re.sub('bg_gen','bg_menu',m)
        m=re.sub('ts_gen','ts_menu',m)
        m=re.sub('bs_gen','bs_menu',m)
        m=re.sub('sel_gen','sel_menu',m)
        m=re.sub('fg_gen','fg_menu',m)
        m=re.sub('_borderwidth','1px',m)
        f.write(m)
        f.write('\n')


    f.write(m)
    f.write('\n')

