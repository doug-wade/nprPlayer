db_client_factory = require('./db_client')
db_client = db_client_factory.get_client()

exports.station = (req, res) ->
  res.json(db_client.get_stations())
  null

exports.program = (req, res) ->
  res.json(db_client.get_programs(req.params.program))
  null

exports.episode = (req, res) ->
  res.json(db_client.get_items(req.params.station, req.params.program))
  null