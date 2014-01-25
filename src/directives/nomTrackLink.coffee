'use strict'

# Directives
class nomTrackLink
  @options = () ->
    restrict: 'E'
    scope:
      episode: '@'
    templateUrl: 'templates/nomEpisodeLink.html'

angular.module('nprOnDemand').directive 'nomTrackLink', nomTrackLink.options