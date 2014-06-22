module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    coffee:
      compile:
        options:
          bare: true
          join: true
        files:
          "public/js/app.js": [
            "assets/javascripts/application.coffee"
            "assets/javascripts/controllers/*.coffee"
            "assets/javascripts/directives/*.coffee"
            "assets/javascripts/services/*.coffee"
          ]

    sass:
      compile:
        files:
          "public/css/app.css": [
            "assets/stylesheets/sensu-dashboard.scss"
          ]

    jade:
      compile:
        options:
          pretty: true
        files: [
          expand: true
          cwd: "assets/views"
          src: [ "index.jade", "templates/{,*/}*.jade" ]
          dest: "public"
          ext: ".html"
        ]

    watch:
      coffee:
        files: [ "assets/javascripts/**/*.coffee" ]
        tasks: [ "coffee" ]
      sass:
        files: [ "assets/stylesheets/**/*.scss" ]
        tasks: [ "sass" ]
      jade:
        files: [ "assets/views/**/*.jade" ]
        tasks: [ "jade" ]

    connect:
      static:
        options:
          port: 8000
          base: "public"

  # Load the GruntJS plugins.
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-sass"

  # Default task(s).
  grunt.registerTask "default", [ "coffee", "sass", "jade", "connect", "watch" ]

  return
