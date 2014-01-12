'use strict'

# Directives
class nomPlayer 
  @options = () ->
    restrict: 'E'
    templateUrl: 'templates/nomPlayer.html'
    controller: 'nomPlayerCtrl'

angular.module('nprOnDemand').directive 'nomPlayer', nomPlayer.options