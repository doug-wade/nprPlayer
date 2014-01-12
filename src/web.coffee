# Module dependencies

express = require('express')
routes = require('./routes/index')
http = require('http')
path = require('path')
app = express()

oneDay = 86400000

# all environments
app.set('port', process.env.PORT || 3000)
app.set('views', __dirname + '/views')
app.set('view engine', 'jade')
app.use(express.logger('dev'))
app.use(express.methodOverride())
app.use(express.static(path.join(__dirname, 'public')))
app.use(express.static(path.join(__dirname, 'bower_components')))
app.use(app.router)

# development only
if (app.get('env') == 'development')
  app.use(express.errorHandler())
  app.use(express.static(path.join(__dirname, 'public')))
  app.use(express.static(path.join(__dirname, 'bower_components')))

# production only
if (app.get('env') == 'production')
  # TODO: Add logging
  app.use(express.compress())
  app.use(express.static(path.join(__dirname, 'public'), { maxAge: oneDay }))
  app.use(express.static(path.join(__dirname, 'bower_components', { maxAge: oneDay })))

# serve index and view partials
app.get('/', routes.index)

# redirect all others to the index (HTML5 history)
# app.get('*', routes.index)

# Start Server
http.createServer(app).listen(app.get('port'), () ->
  console.log('Express server listening on port ' + app.get('port')))