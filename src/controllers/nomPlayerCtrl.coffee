'use strict'

class nomPlayerCtrl
  @inject = ['$scope']

  constructor: ($scope) ->
    @audio = document.createElement('audio')
    @audio.src = $scope.episode.tracks[0].url
    @audio.addEventListener('ended', () -> $scope.$apply(() -> $scope.stop()))

    $scope.playing = false
    $scope.audio = @audio
    $scope.play = @play
    $scope.stop = @stop

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