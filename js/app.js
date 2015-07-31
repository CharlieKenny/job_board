var app = angular.module('jobBoardApp', ['ngRoute']);

app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/route1', {
        templateUrl: 'employer.html',
        controller: 'jobController'
      }).
      when('/route2', {
        templateUrl: 'applicant.html',
        controller: 'jobController'
      }).
      otherwise({
        redirectTo: '/'
      });
}]);