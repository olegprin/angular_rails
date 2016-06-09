(function() {
  var app = angular.module('flapperNews', ['$scope']);
  app.controller('MainCtrl', function($scope){
    $scope.test = 'Hello world!';
  });
})();