function Hello($scope, $http) {
    $http.get('greeting', {data: {name: name}}).
        success(function(data) {
            $scope.greeting = data;
        });

    
//    	$scope.update = () => {
//    		console.log($scope.name)
//    	}
//    
    $scope.update = function() {
        	
          $http({
      	  method: 'GET',
      	  url: '/greeting',
      	  params: {
      		  name: $scope.name
      	  }
      	}).then(function successCallback(response) {
      	    // this callback will be called asynchronously
      	    // when the response is available
      		console.log("okok");
      		$scope.greeting = response.data;
      	  }, function errorCallback(response) {
      	    // called asynchronously if an error occurs
      	    // or server returns response with an error status.
      		$scope.greeting = "BAD REQUEST";
      		console.log("hello bad req");
      	  });
    }
    
    $http({
    	  method: 'GET',
    	  url: '/someUrl'
    	}).then(function successCallback(response) {
    	    // this callback will be called asynchronously
    	    // when the response is available
    	  }, function errorCallback(response) {
    	    // called asynchronously if an error occurs
    	    // or server returns response with an error status.
    	  });
   
}

