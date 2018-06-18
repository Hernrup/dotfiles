"https://github.com/dhruvasagar/vim-table-mode
"
"Use :TableModeToggle mapped to <Leader>tm.
"
"Moving around
"
"Now you can move between cells using table mode motions [|, ]|, {| & }| to move left | right | up | down cells respectively. The left | right motions wrap around the table and move to the next | previous row after the last | first cell in the current row if one exists.
"
"
"Manipulating Table
"
"Cell Text Object :
"
"Tableize provides a text object for manipulating table cells. Following the vim philosophy the you have i| & a| for the inner and around (including the immidiate right table separator) the table cell.
"
"    Delete Row :
"
"    You can use the <Leader>tdd mapping defined by the option g:table_mode_delete_row_map to delete the current table row (provided you are within a table row), this can be preceeded with a [count] to delete multiple rows just like you would with 'dd'.
"
"    Delete Column :
"
"    You can use the <Leader>tdc mapping defined by the option g:table_mode_delete_column_map to delete the entire current column (provided you are within a table row), this can also be preceeded with a [count] to delete multiple columns.

Plug 'dhruvasagar/vim-table-mode', {'for': ['markdown']}
let g:table_mode_corner="|"
