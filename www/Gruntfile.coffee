path = require("path")
fs = require("fs")
module.exports = (grunt) ->
  grunt.initConfig
    watch:
      coffee:
        files: "coffee/**/*.coffee"
        tasks: ["newer:coffee:compile"]
      livereload:
        options:
          livereload: 35729
        files: [
          'index.dev.html'
          'css/**/*.css'
          'js/**/*.js'
        ]

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

    processhtml:
      dist:
        files:
          "build/index.html": ["index.html"]

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
          collapseBooleanAttributes: true
          collapseWhitespace: true
          removeAttributeQuotes: true
          removeCommentsFromCDATA: true
          removeEmptyAttributes: true
          removeOptionalTags: true
          removeRedundantAttributes: true
          useShortDoctype: true
        files:
          'build/index.html': 'build/index.html'
          #expand: true
    
    imagemin:
      dist:
        files:[
          expand: true
          cwd: 'img/'
          src: '**/*.{gif,jpeg,jpg,png}'
          dest: 'build/img/'
        ]

    connect:
      options:
        port: 9000
        livereload: 35729
        hostname: 'localhost'
      livereload:
        options:
          open: true
      dist:
        options:
          open: true
          base: 'build'
          livereload: false

    clean:
      dist: 'build'


  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-coffee"  
  grunt.loadNpmTasks "grunt-newer"  
  grunt.loadNpmTasks "grunt-processhtml"  
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-htmlmin"
  grunt.loadNpmTasks "grunt-contrib-imagemin"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-clean"

  grunt.registerTask "dev", ['connect:livereload', "watch"]
  grunt.registerTask "build", ["clean:dist", "uglify", "cssmin", "processhtml", "htmlmin", "imagemin"]
  grunt.registerTask "dist", ["build", "connect:dist:keepalive"]
  grunt.registerTask "default", ["dev"]