/**
 * Created by Paweł on 2015-02-28.
 */
(function(){

    var app = angular.module('clientsService',[]);

    app.factory('clients',['$http',function($http){
        var _api = {};

            _api.getClients = function(callback){
                callback = callback ||function(){};

                $http.get('api.php/clients')
                    .success(function(data){
                        callback(data)
                    })
            };

        return _api;
    }]);

})();