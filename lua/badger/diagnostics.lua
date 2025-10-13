--Modificando los iconos que se muestran para casos de error
local signs = {
    Error = " ", --Icono de error
    Warn = " ", --Icono de advertencia
    Hint = "", --Icono de pista
    Info = " ", --Icono de informacion
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(h1,{text = icon, texthl = hl, numhl= hl})
end

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
})
