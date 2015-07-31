app.controller('jobController', ['$scope', '$http', function ($scope, $http) {

  $scope.message = "Hell";
  $scope.get = function() {
        $http.get("http://localhost:9292/").success(function(result) {
            console.log("Success", result);
            $scope.result = result;
        }).error(function() {
            console.log("error");
        });
    };

}]);