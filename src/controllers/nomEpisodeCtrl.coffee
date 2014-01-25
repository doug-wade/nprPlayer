'use strict'

class nomEpisodeCtrl
  @inject = ['$scope', 'nomEpisodeSvc']

  constructor: ($scope, nomEpisodeSvc) ->
    @episode_svc = nomEpisodeSvc
    $scope.getStations = @get_stations
    @scope = $scope

  get_stations: () ->
    @episode_svc.get_stations()

angular.module('nprOnDemand').controller 'nomEpisodeCtrl', nomEpisodeCtrl