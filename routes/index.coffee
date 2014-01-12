exports.index = (req, res) ->
  res.render('index')

exports.partials = (req, res) ->
  name = req.params.name
  res.render('../views/partials/' + name, { title: name })
