fs     = require('fs')
join   = require('path').join
logger = require 'grunt-legacy-log'

module.exports = (grunt)->

  grunt.initConfig
    watch:
      jade:
        files: 'views/**/*.jade'
        tasks: 'jade'

    jade:
      sync:
        options:
          pretty: false

        files: [{
          expand: true
          dest: './public'
          src:  './views/**/*.jade'
          ext:  '.html'
          filter: (src)->
            dest = join '.', 'public', src.replace(/jade$/, 'html')
            try
              destMod = +fs.lstatSync(dest).mtime
            catch e
              if e.code is 'ENOENT'
                return true
              throw e

            fs.lstatSync(src).mtime > destMod
        }]

  grunt.event.on 'watch', (action, filepath)->
    if action is 'deleted'
      if filepath.indexOf('views') is 0
        fileToDelete = join '.', 'public', filepath.replace(/jade$/, 'html')
        grunt.log.oklns "Deleting #{ fileToDelete }"
        grunt.file.delete(fileToDelete)

  grunt.log = new logger.Log({grunt: grunt})

  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.registerTask 'default', ['jade']
