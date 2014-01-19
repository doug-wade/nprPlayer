'use strict'

# Directives
class nomTrackLink
  @options = () ->
    restrict: 'E'
    replace: true
    scope:
      episode: '='
    templateUrl: 'templates/nomEpisodeLink.html'

angular.module('nprOnDemand').directive 'nomTrackLink', nomTrackLink.options