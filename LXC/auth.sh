# Place this file in "/etc/lxc/hooks/auth.sh" 
# and "sudo chmod +x auth.sh"
# Remember to change <username> and <container name> 
# Also check with "echo $DISPLAY" to know the current display id ":0" - if its different - change that also

#!/bin/bash
COOKIE=$(su - <user-name> -c "xauth list :0" | awk '{print $3}' | head -1)
if [ -n "$COOKIE" ]; then
    lxc-attach -n <container-name> -- xauth add :0 MIT-MAGIC-COOKIE-1 "$COOKIE"
fi
