#!/bin/sh

SELF=$(readlink -f "$0")
HERE=${SELF%/*}

export PATH="${HERE}/bin${PATH:+:$PATH}"
export LD_LIBRARY_PATH="${HERE}/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="/usr/lib64/qt5/plugins"
export XDG_SESSION_TYPE=x11
export QT_QPA_PLATFORM=xcb
unset WAYLAND_DISPLAY
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_STYLE_OVERRIDE=fusion # 解决使用自带qt情况下，字体颜色全白看不到的问题

# paste from builtin scripts
if [ $XMODIFIERS ]
    then
        im_module=$XMODIFIERS
        echo 'use XMODIFIERS'
        export QT_IM_MODULE=${im_module#*=}
elif [ $GTK_IM_MODULE ]
    then
        echo 'use GTK_IM_MODULE'
        export QT_IM_MODULE=${GTK_IM_MODULE}
fi
echo ${QT_IM_MODULE}

exec wemeetapp $*
