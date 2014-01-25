default_banner = '/* <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n'

module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-bower')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-jade')
  grunt.loadNpmTasks('grunt-contrib-stylus')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-npm-install')
  grunt.loadNpmTasks('grunt-html2js')

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    coffee: {
      compile_dev: {
        files: {
          'public/js/app.js': 'src/angular/app.coffee',
          'public/js/controllers.js': 'src/controllers/*.coffee',
          'public/js/services.js': 'src/services/*.coffee',
          'public/js/directives.js': 'src/directives/*.coffee',
          'routes/index.js': 'src/express/index.coffee',
          'routes/api.js': 'src/express/api.coffee',
          'routes/db_client.js': 'src/express/db_client.coffee', 
          'web.js': 'src/express/web.coffee'
        }
      },
      compile_prod: {
        files: {
          'src/app.js': 'src/js/*.coffee',
          'routes/index.js': 'routes/index.coffee',
          'web.js': 'src/web.coffee'
        }
      }
    },
    bower: {
      install: {
        options: {
          target_dir: './public/vendor',
          install: true,
          cleanTargetDir: false,
          cleanBowerDir: false,
          copy: true,
          layout: 'byType'
        }
      }
    },
    html2js: {
      options: {
      module: 'nprOnDemand.templates'
      },
      dev: {
        src: ['public/templates/*.html'],
        dest: 'public/js/templates.js'
      },
      prod: {
        src: ['public/templates/*.html'],
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
          'public/templates/nomPlayer.html': 'src/templates/nomPlayer.jade',
          'public/templates/nomEpisodeSelector.html': 'src/templates/nomEpisodeSelector.jade'
          'public/templates/nomEpisodeLink.html': 'src/templates/nomTrackList.jade'
        }
      }
    },
    stylus: {
      compile: {
        options: {
          compress: false,
          linenos: false,
          firebug: false,
          banner: default_banner
        },
        files: {
          'public/css/app.css': 'src/stylus/app.styl'
        }
      }
    },
    uglify: {
      options: {
        banner: default_banner
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

  grunt.registerTask('deps', ['npm-install', 'bower:install'])
  grunt.registerTask('compile_dev', ['jade:compile', 'html2js:dev', 'coffee:compile_dev', 'stylus'])
  grunt.registerTask('compile_prod', ['jade:compile', 'html2js:prod', 'coffee:compile_prod', 'uglify:dist', 'stylus'])