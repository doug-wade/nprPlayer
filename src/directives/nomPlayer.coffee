'use strict'

# Directives
class nomPlayer 
  @options = () ->
    restrict: 'E'
    templateUrl: 'templates/nomPlayer.html'
    controller: 'nomPlayerCtrl'
    transclude: true

angular.module('nprOnDemand').directive 'nomPlayer', nomPlayer.options