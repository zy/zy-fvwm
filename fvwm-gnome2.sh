#! /bin/sh

# Very hasty and simple script to generate some menus for FVWM from the GNOME directory /usr/share/applications
# Needs bells, whistles, options, flannel, improvements, documentation, kde. Nah.
SYSFILES=`find /usr/share/applications -name *.desktop`
LOCALFILES=`find /usr/local/share/applications -name *.desktop`
for FILE in ${SYSFILES} ${LOCALFILES}; do
        NAME=`basename $FILE .desktop` awk -F= '
BEGIN {
        name=$FILE
}

/^Name=/ { name=$2 }
/^Name/ { if (!altname) { altname=$2 } }
/^Categories=/ { categories=$2 }
/^Icon=/ { icon=$2 }
/^Exec=/ { run=$2 }

END {
        filename = ENVIRON["NAME"]
        if (!name) { name = altname}
        if (!name) { name = filename}
        if (!run) { run = filename }
        if (!icon) { icon = "/usr/share/pixmaps/mini/gnome-unknown.png" }
        printf("%s:%s:%s:%s:%s\n",  categories, name, filename, icon, run)
}' $FILE
done | sed -e "s/GNOME;//g; s/KDE;//g; s/GTK;//g; s/QT;//g; s/Qt;//g; \
s/Application;//g; s/X-\([A-Za-z-]*\);//g; s/Viewer;//g; \
s/\([A-Za-z-]*;\)\1/\1/g; \
" |sort | awk -F: '
BEGIN {
        menu=""
        print "DestroyMenu Gnome2Menu"
        print "AddToMenu Gnome2Menu \"Applications Menu%mini/gnome-unknown.png%\" Title"
}

function build_menu(cat,name,filename,icon,run) {
        num=split(cat,list,";")
        
        parent_menu="Gnome2Menu"
        if (num > 0) {
            menu_name=""
        }
        else {
            menu_name="Other"
            if (!exists[menu_name]) {
                    exists[menu_name]="y"
                    printf("AddToMenu %s \"%s%%mini/gnome-unknown.png%%\" Popup %s\n", parent_menu, menu_name, menu_name)
                    printf("DestroyMenu %s\n", menu_name)
                    printf("AddToMenu %s \"%s%mini/gnome-unknown.png%\" Title\n", menu_name, menu_name)
            }
        }
        for (i=1; i<num; i++) {
                if (menu_name) {
                        menu_name=menu_name "-" list[i]
                } else {
                        menu_name = list[i]
                }
                if (!exists[menu_name]) {
                        exists[menu_name]="y"
                        printf("AddToMenu %s \"%s%%mini/gnome-unknown.png%%\" Popup %s\n", parent_menu, list[i], menu_name)
                        printf("DestroyMenu %s\n", menu_name)
                        printf("AddToMenu %s \"%s%mini/gnome-unknown.png%\" Title\n", menu_name, menu_name)
                }
                parent_menu = menu_name
        }
        num=split(icon,list,"/")
        if (list[num] !~ /(.png|.xpm)$/) list[num] = list[num] ".png"
        icon = list[num]
        mini_icon = "mini/" icon
        printf("AddToMenu %s \"%s (%s)%%%s%%\" Exec exec %s\n", menu_name, name, filename, mini_icon, run)
        num=split(run,list," ")
        printf("Style %s* Icon %s, MiniIcon %s\n", list[1], icon, mini_icon)
}

{
        categories=$1
        name=$2
        filename=$3
        icon=$4
        run=$5
        build_menu(categories,name,filename,icon,run)

}'
