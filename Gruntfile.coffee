module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-bower')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-jade')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-npm-install')
  grunt.loadNpmTasks('grunt-html2js')

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    coffee: {
      compile_dev: {
        files: {
          'public/js/app.js': 'src/app.coffee',
          'public/js/controllers.js': 'src/*Ctrl.coffee',
          'public/js/directives.js': 'src/nomPlayer.coffee',
          'routes/index.js': 'routes/index.coffee',
          'web.js': 'src/web.coffee'
        }
      },
      bower: {
        main: {
          dest: 'bower_components/'
        }
      }
      compile_prod: {
        files: {
          'src/app.js': 'src/*.coffee',
          'routes/index.js': 'routes/index.coffee',
          'web.js': 'src/web.coffee'
        }
      }
    },
    html2js: {
      options: {
        module: 'nprOnDemand.templates'
      },
      dev: {
        src: ['src/templates/*.html'],
        dest: 'public/js/templates.js'
      },
      prod: {
        src: ['src/templates/*.html'],
        dest: 'src/templates.js'
      }
    },
    jade: {
      compile: {
        options: {
          data: {
            debug: true
          }
        },
        files: {
          'src/templates/nomPlayer.html': 'src/templates/nomPlayer.jade'
        }
      }
    },
    uglify: {
      options: {
        banner: { 
          '/* <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'
        }
      },
      dist: {
        files: {
          'public/js/nprOnDemand.min.js': ['src/templates.js', 'src/app.js']
        }
      }
    },
    watch: {
      coffee: {
        files: ['<%= coffee.compile_dev.files %> '],
        tasks: ['compile_dev']
      },
      ng_templates: {
        files: ['<%= html2js.dev.src %>'],
        tasks: ['compile_dev']
      }
    }
  })

  grunt.registerTask('deps', ['npm-install', 'bower:main'])
  grunt.registerTask('compile_dev', ['jade:compile', 'html2js:dev', 'coffee:compile_dev'])
  grunt.registerTask('compile_prod', ['jade:compile', 'html2js:prod', 'coffee:compile_prod', 'uglify:dist'])