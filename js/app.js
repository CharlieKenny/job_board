var app = angular.module('jobBoardApp', ['ngRoute']);

app.config(function($httpProvider) {
      //Enable cross domain calls
      $httpProvider.defaults.useXDomain = true;

      $httpProvider.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

      //Remove the header used to identify ajax call  that would prevent CORS from working
      delete $httpProvider.defaults.headers.common['X-Requested-With'];
  });

app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/employer', {
        templateUrl: 'employer.html',
        controller: 'jobController'
      }).
      when('/applicant', {
        templateUrl: 'applicant.html',
        controller: 'jobController'
      }).
      otherwise({
        redirectTo: '/'
      });
}]);