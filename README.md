# PENTVIM 🐍


Neo-vim config maded to solve some of the usual needs on the code with vim,
i inspired this project on the need of implement some tools from visualstudio,
like auto-compile the code or run the code automaticly with only one key combination.

## Problem to solve

Some nvim config can be more user friendly, but they have to much keybinds and sometimes
can be confusing from the new user, the filosofy of pentvim is give you more with less.

A minimal config with all the essentials for a user.

# Dependencies

-`Vim`
-`Neo-vim`

# Instalation

```Bash
git clone https://github.com/yaelcalleja/Pentvim
```

.

Completamente inspirado en Lazy-Vim pero con algunos cambios

Acciones interesantes:
    -Ctrl + s : Guardar el archivo
    -Modo normal <espacio> + e = Barra lateral que permite explorar archivos. (Neo-Tree)
    -Modo normal <espacio> + ff = Buscar archivos en el espacio actual. (Telescope)
    -Modo normal <espacio> + r = En lenguajes como python y c++ compila/interpreta el codigo y 
    te abre una terminal con el codigo listo en la parte de abajo. (Similar a visualstudio)
