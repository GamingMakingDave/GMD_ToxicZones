fx_version 'bodacious'
game 'gta5'

author 'GMD-Scripts'
version '1.0.0'

client_scripts {
    'client/toxiczones-cl.lua'
}

server_scripts {
    'server/toxiczones-sv.lua',
    '@oxmysql/lib/MySQL.lua'
} 
shared_script 'config.lua'

dependencies {
    'es_extended',
    'oxmysql'
}