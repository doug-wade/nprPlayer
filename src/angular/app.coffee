'use strict';

# Declare app level module which depends on filters, and services

angular.module('nprOnDemand', [
  'nprOnDemand.templates',
  'ngResource'
  ]).
  config(($locationProvider) ->
    $locationProvider.html5Mode(true))
