local status, lualine = pcall(require, 'lualine')
if not status then
        return
end
 
lualine.setup({
    options = {
        globalstatus = true,
        sections = {
        },
        inactive_sections = {
        },
        extensions = {'neo-tree', 'lazy'},
    }
})

