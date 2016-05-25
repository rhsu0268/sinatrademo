console.log("Pulled in js file");

var app = angular.module('myApp', []);

app.controller('MyCtrl', function($scope, $http) 
{
	$scope.loadData = function() 
	{
		console.log("Load Data called!");

		$http.get('/pull_cake_json').success(function(data) {
        	$scope.items = data;
        	console.log($scope.items);
      	});
	}

});