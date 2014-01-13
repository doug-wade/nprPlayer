fs = require('fs')
path = require('path')

class DBClient

  constructor: () ->
    @files = {
      stations_file: path.resolve('./resources/stations.json'),
      programs_file: path.resolve('./resources/programs.json'),
      episodes_file: path.resolve('./resources/episodes.json')
    }

  get_json_from_file: (json_file) ->
    if fs.existsSync(json_file)
      JSON.parse(fs.readFileSync(json_file, "utf8"))
    else
      console.warn("No such file: " + json_file)
      []

  get_stations: () ->
    stations = @get_json_from_file(@files.stations_file)["stations"]
    { "stations": stations }

  get_programs = (station) ->
    programs = @get_json_from_file(@files.programs_file)["programs"]

    if station is null or station is ""
      results = programs
    else
      filtered = []
      programs.reduce (test) -> filtered.push test unless test.station != station
      results = filtered

    { "programs": results }

  get_episodes = (station, program) ->
    episodes = @get_json_from_file(files.episodes_file)["episodes"]

    if station is null or station is "" or program is null or program is ""
      results = episodes
    else
      filtered = []
      episodes.reduce (test) -> filtered.push test unless test.station != station or test.program != program
      results = filtered

    { "episodes": results }

# TODO: wrap this up in a class to export
exports.get_client = () -> new DBClient()