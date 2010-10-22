

#!/bin/sh
# rxvt +sb -name fvwm-run-dialog -title "run" -geometry 80x1+224+360 \  
# --keysym.0xFF0D: " &\nexit\n" -e bash --init-file \
# $HOME/.fvwm/run-dialog.bash-init

rxvt  -name fvwm-run-dialog -title "run" -geometry 80x1+224+360 \  
# -e bash --init-file $zy/linux/x/fvwm/run-dialog.bash-init
# +sb
# --keysym.0xFF0D: " &\n exit\n" 
