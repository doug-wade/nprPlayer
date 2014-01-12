'use strict'

# Controllers

class nomPlayerCtrl
  @inject = ['$scope']

  constructor: ($scope) ->
    scope = $scope

    audio = document.createElement('audio')
    audio.src = '/media/npr.mp4'
    audio.addEventListener('ended', () -> scope.$apply(() -> scope.stop()))

    scope.playing = false
    scope.audio = audio
    scope.play = @play
    scope.stop = @stop

    @scope = scope

  play: =>
    @scope.audio.play()
    @scope.playing = true

  stop: =>
    @scope.audio.pause()
    @scope.playing = false

angular.module('nprOnDemand').controller 'nomPlayerCtrl', nomPlayerCtrl