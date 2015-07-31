app.controller('jobController', ['$scope', '$http', function ($scope, $http) {

  $scope.message = "Hell";
  $scope.get = function() {
        $http.get("http://localhost:9292/api/jobs").success(function(result) {
            console.log("Success", result);
            $scope.result = result;
        }).error(function() {
            console.log("error");
        });
    };

    $scope.post = function(value) {
        $http.post("http://localhost:9292/api/jobs", { 'employer': value }).success(function(result) {
            console.log(result);
            $scope.resultPost = result;
        }).error(function() {
            console.log("error");
        });
    };

}]);