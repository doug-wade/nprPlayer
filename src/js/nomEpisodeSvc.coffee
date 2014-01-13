'use strict'

class nomEpisodeSvc
  @inject = ['$resource']

  constructor: ($resource) -> 
    @station_endpoint = $resource('/api/station')
    @program_endpoint = $resource('/api/program')
    @episode_endpoint = $resource('/api/episode')

    @cache = {}
    @CACHE_BASE_KEY = 'CACHE_BASE_KEY'

  get_stations: () ->
    results = []
    if @cache[CACHE_BASE_KEY].null?
      results = @cache[CACHE_BASE_KEY]
    else
      results = @station_endpoint.get({})
      return results

  get_programs: (query) ->
    return @program_endpoint.get(query)

  get_episodes: (query) ->
    return @episode_endpoint.get(query)

angular.module('nprOnDemand').factory 'nomEpisodeSvc', nomEpisodeSvc