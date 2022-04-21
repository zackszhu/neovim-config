local yabs = require('yabs')

yabs:setup({
    tasks = {
        build = {
            command = "just build",
            output = "echo",
            condition = require('yabs.conditions').file_exists('justfile')
        },
        run = {
            command = "just run",
            output = "buffer",
            condition = require('yabs.conditions').file_exists('justfile')
        },
    }
})
