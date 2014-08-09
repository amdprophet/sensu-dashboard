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
            "assets/javascripts/config.coffee"
            "assets/javascripts/application.coffee"
            "assets/javascripts/utilities/*.coffee"
            "assets/javascripts/filters/*.coffee"
            "assets/javascripts/controllers/*.coffee"
            "assets/javascripts/directives/*.coffee"
            "assets/javascripts/services/*.coffee"
          ]

    concat:
      "angular":
        files:
          "public/js/vendor/angular/angular.js": ["bower_components/angular/angular.js"]
      "angular-animate":
        files:
          "public/js/vendor/angular-animate/angular-animate.js": ["bower_components/angular-animate/angular-animate.js"]
      "angular-resource":
        files:
          "public/js/vendor/angular-resource/angular-resource.js": ["bower_components/angular-resource/angular-resource.js"]
      "angular-route":
        files:
          "public/js/vendor/angular-route/angular-route.js": ["bower_components/angular-route/angular-route.js"]
      "bootstrap":
        files:
          "public/css/vendor/bootstrap/bootstrap.css": ["bower_components/bootstrap/dist/css/bootstrap.css"]
          "public/css/vendor/bootstrap/bootstrap.css.map": ["bower_compontents/bootstrap/dist/css/bootstrap.css/map"]
          "public/js/vendor/bootstrap/bootstrap.js": ["bower_components/bootstrap/dist/js/bootstrap.js"]

      "jquery":
        files:
          "public/js/vendor/jquery/jquery.js": ["bower_components/jquery/dist/jquery.js"]

    sass:
      compile:
        files:
          "public/css/app.css": "assets/stylesheets/app.scss"

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
  grunt.loadNpmTasks "grunt-bower-install-simple"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"

  # Default task(s).
  grunt.registerTask "default", [
    "bower-install-simple",
    "coffee",
    "concat",
    "sass",
    "jade",
    "connect",
    "watch",
  ]

  return
