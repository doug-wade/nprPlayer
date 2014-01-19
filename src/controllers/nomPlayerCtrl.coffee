'use strict'

class nomPlayerCtrl
  @inject = ['$scope']

  constructor: ($scope) ->
    @audio = document.createElement('audio')
    @audio.src = '/media/pentagon.mp3'
    @audio.addEventListener('ended', () -> $scope.$apply(() -> $scope.stop()))

    $scope.playing = false
    $scope.audio = @audio
    $scope.play = @play
    $scope.stop = @stop

    $scope.episode = { "station": "NPR", "program": "All Things Considered", "episode": "Thursday" , "tracks": [{ "name": "Pentagon saya: Y'all gun die.", "url": "/media/pentagon.mp3"}, { "name": "Vets hella pissed; can't remember why.", "url": "/media/vets.mp3"}, { "name": "Why governemt isn't always a terrible idea.", "url": "/media/mva.mp3"}]}

    @scope = $scope

  play: =>
    @audio.play()
    @scope.audio.play()
    @scope.playing = true

  change: (track) =>
    @stop()
    @audio.src = track.url
    @play()

  stop: =>
    @scope.audio.pause()
    @scope.playing = false

angular.module('nprOnDemand').controller 'nomPlayerCtrl', nomPlayerCtrl