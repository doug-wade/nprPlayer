'use strict'

class nomAppCtrl
  @inject = ['$scope']

  constructor: ($scope) ->
    $scope.episode = { "station": "NPR", "program": "All Things Considered", "episode": "Thursday" , "tracks": [{ "name": "Pentagon saya: Y'all gun die.", "url": "/media/pentagon.mp3"}, { "name": "Vets hella pissed; can't remember why.", "url": "/media/vets.mp3"}, { "name": "Why governemt isn't always a terrible idea.", "url": "/media/mva.mp3"}]}
    @scope = $scope

angular.module('nprOnDemand').controller 'nomAppCtrl', nomAppCtrl