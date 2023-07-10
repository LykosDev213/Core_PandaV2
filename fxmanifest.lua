----------------------------------------------------------------------------------------------------
--------------------------------  PandaCore by lykos -----------------------------------------------
----------------------------------------------------------------------------------------------------
fx_version 'adamant'
game 'gta5'

client_script{
    "core/cl/cl_core.lua",
    "core/script/otage.lua",
    "core/script/change_seat.lua",
    "core/script/command.lua",
    "core/script/hide_trunk",
    "core/script/ko.lua",
    "core/script/levermain.lua",
    "core/script/porter.lua",
    "core/script/remorquebateau.lua",
}

server_script {
    "core/sv/sv_core.lua",
    "core/sv/command.lua",
    "core/sv/otage.lua",
    "core/sv/porter.lua",
    "core/sv/sync.lua",
}
