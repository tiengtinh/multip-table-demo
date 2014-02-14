path = require("path")
fs = require("fs")
module.exports = (grunt) ->
  grunt.initConfig
    watch:
      coffee:
        files: "coffee/**/*.coffee"
        tasks: ["newer:coffee:compile"]

    coffee:
      options:
        bare: true
        sourceMap: false        
        #sourceRoot: 'js',
        join: false

      compile:
        expand: true
        src: "**/*.coffee"
        dest: "js"
        cwd: "coffee"
        ext: ".js"

    requirejs:
      compile:
        options:
          optimize: "none"
          baseUrl: "./components"
          include: "almond/almond"
          mainConfigFile: "js/r-config.js"
          name: "../js/r-config"
          out: "build/script.js"

    uncss:
      dist:
        files:
          "www/build/tidy.css": ["www/coffee/templates/photoDetailTml.html", "www/index.html", "www/coffee/templates/photoTml.html"]

        
        #stylesheets: ['www/css/bootstrap.css', 'www/css/bootstrap-theme.css', 'www/css/index.css']
        csspath: "www/css"

    processhtml:
      dist:
        files:
          "index.html": ["index.dev.html"]

    cssmin:
      main:
        files:
          'build/style.css': ['css/index.css']

    uglify:
      #options:
      main:
        files:
          'build/script.js': ['components/quojs/quo.js', 'components/riotjs/riot.js', 'js/exts/quo-ext.js', 'js/utils.js', 'js/db.js', 'js/models/CellModel.js', 'js/RandomAssembler.js', 'js/CellsFactory.js', 'js/views/CellView.js', 'js/app.js', 'js/controllers/IndexController.js', 'js/controllers/DetailController.js', 'js/routeHandler.js']

    htmlmin:
      main:
        options:
          removeComments: true
          collapseWhitespace: true
        files:
          'index.html': 'index.html'


  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-requirejs"
  grunt.loadNpmTasks "grunt-newer"  
  grunt.loadNpmTasks "grunt-processhtml"  
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-htmlmin"

  grunt.registerTask "default", ["watch"]
  grunt.registerTask "build", ["uglify", "cssmin", "processhtml", "htmlmin"]