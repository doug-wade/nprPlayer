'use strict'

# Directives
class nomEpisodeSelector
  @options = () ->
    controller: 'nomEpisodeCtrl'
    require: '^ngModel'
    restrict: 'E'
    scope:
      episode: '='
    templateUrl: 'templates/nomEpisodeSelector.html'

angular.module('nprOnDemand').directive 'nomEpisodeSelector', nomEpisodeSelector.options
