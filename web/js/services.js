/**
 * Created by Paweł on 2015-02-28.
 */
(function(){

    var app = angular.module('httpService',[]);

    app.factory('clients',['$http',function($http){
        var _api = {};

            _api.getClients = function(callback){
                callback = callback ||function(){};

                $http.get('api.php/clients')
                    .success(function(data){
                        callback(data)
                    })
            };

        _api.getClient = function(clientId, succes, error){
            succes = succes ||function(){};
            error = error ||function(){};

            $http.get('api.php/client/'+clientId)
                .success(function(data){
                    succes(data)
                })
                .error(error);
        };

        return _api;
    }]);

    app.factory('users',['$http',function($http){
        var _api = {};

        _api.getUsers = function(callback){
            callback = callback ||function(){};

            $http.get('api.php/users')
                .success(function(data){
                    callback(data)
                })
        };

        return _api;
    }]);


    app.factory('sectors',['$http',function($http){
        var _api = {};

        _api.getSectors = function(callback){
            callback = callback ||function(){};

            $http.get('api.php/company-sectors')
                .success(function(data){
                    callback(data)
                })
        };

        return _api;
    }]);

})();