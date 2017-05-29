function Hello($scope, $http) {
    $http.get('greeting').
        success(function(data) {
        		$scope.user = data;
        		});

    $scope.update = function() {
        $http.get('greeting',{params: {name: $scope.name}}).
	        success(function(data) {
	            $scope.user = data;
	        } );
        
    }
   
}
