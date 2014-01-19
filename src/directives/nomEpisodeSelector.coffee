'use strict'

# Directives
class nomEpisodeSelector
  @options = () ->
    restrict: 'E'
    templateUrl: 'templates/nomEpisodeSelector.html'
    controller: 'nomEpisodeCtrl'

angular.module('nprOnDemand').directive 'nomEpisodeSelector', nomEpisodeSelector.options