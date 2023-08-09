local jdtls_path = fn.stdpath('data') .. '/mason/share/jdtls'
local lombok_path = jdtls_path .. '/lombok.jar'
local config = {
    cmd = { 'jdtls', '--jvm-arg=-javaagent:' .. lombok_path },
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml' }),
    settings = {
        java = {},
    },

    init_options = {
        bundles = {},
    },
}
require('jdtls').start_or_attach(config)
require('jdtls.setup').add_commands()
