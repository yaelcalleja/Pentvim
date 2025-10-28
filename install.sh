#!/bin/bash

NVIM_DIR="$HOME/.config/nvim/"
REPO_URL="https://github.com/yaelcalleja/Pentvim"
NVIM_BACKUP="$HOME/.config/nvim.bak"


main(){
if pacman -Q git nvim base-devel &> /dev/null2; then
    echo "[*] Found dependencies!!!"
    echo "----Pentvim installation initiated----"
    read -p "[?] Do you want to backup your atual nvim config?"
    case $REPLY in
        [Yy]* ) echo "[*] Wait until the backup is completed"
            mkdir -p  "$(dirname "$NVIM_BACKUP")" 
            mv "$NVIM_DIR" "$NVIM_BACKUP"
            echo "[*] Last configuration saved on $NVIM_BACKUP"
            ;;
        [Nn]* ) read -p "[?] Ok, remove the $NVIM_DIR?"
            case $REPLY in 
                [Yy]* ) "rm -rf $NVIM_DIR && mkdir $NVIM_DIR"
                    echo "[*] Done"
                    ;;
                [Nn]* ) echo "[/] Cannot install the nvim configuration... exiting"
                    return 1
            esac
            ;;
         *) echo "[/] Invalid option... exiting"
             return 1
         ;;
    esac
    echo "[*] Cloning the repository"
    git clone $REPO_URL $NVIM_DIR
    if [ $? -ne 0 ]; then
        echo "[/] The repository failled to be cloned..."
        if [ -d "$NVIM_DIR" ]; then
            echo "[*] Getting back to the backup nvim"
            mv "$NVIM_BACKUP" "$NVIM_DIR"
            echo "[*] Done"
        fi
        exit 1
    fi
    echo "[*] Repository cloned succesfully... Starting the plugin installation"
    echo "[*] This can take a while..."
    nvim --headless "+PackerSync" +qa
    echo "[/Ok\] Done, you can open your new pentvim"

else
    read -p "[/] Dependencies (git nvim base-devel) not found, do you want to install it? [y/n]"
    case $REPLY in
        y) echo "[*] Installation initiated"
            sudo pacman -S git nvim base-devel
            if [ $? -ne 0 ]; then
                echo "[/] Can't install the dependencies... exiting"
                return 1
            fi
            main
            ;;
        n) echo "[*] Ok exiting"
            return 1
            ;;
    esac
fi 
}

main
