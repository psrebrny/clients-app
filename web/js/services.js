/**
 * Created by Paweł on 2015-02-28.
 */
(function(){

    var app = angular.module('httpService',[]);

    app.factory('routeChecker', ['$state',function($state){
        var _api = {};

            _api.isActive = function(state){
                //console.log( $state.current.name.indexOf(state))
                return ( $state.current.name.indexOf(state) !== -1)

            };

        return _api
    }]);

    app.factory('clients',['$http',function($http){
        var _api = {};

        _api.getClients = function(callback){
            callback = callback ||function(){};

            $http.get('api.php/clients')
                .success(function(data){
                    callback(data)
                })
        };

        _api.getClient = function(clientId, success, error){
            success = success ||function(){};
            error = error ||function(){};

            $http.get('api.php/client/'+clientId)
                .success(function(data){
                    success(data)
                })
                .error(error);
        };

        _api.updateClient = function(clientId, clientData, success){
            success = success || function(){};

            $http.put('api.php/client/'+clientId, clientData)
                .success(success);
        };

        _api.saveNewClient = function(clientData, success){
            success = success || function(){};
            $http.post('api.php/client', clientData)
                .success(function(data){
                    success(data.client);
                })
        };

        _api.deleteClient = function(clientId, success){
            success = success || function(){};

            $http.delete('api.php/client/'+clientId)
                .success(success);
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

    app.factory('timeline', ['$http',function($http){
        var _api = {};

        var helperOptions = {
            phone: {
                color: 'blue',
                message: 'telefon do klienta'
            },
            'envelope-o': {
                color: 'green',
                message: 'wysyłka maila do klienta'
            },
            users: {
                color: 'purple',
                message: 'spotkanie z klientem'
            },
            'file-text-o': {
                color: 'red',
                message: 'podpisanie umowy z klientem'
            }
        };

        _api.eventTypes = [
            {
                value: 'phone',
                name: 'Kontakt telefoniczny'
            },
            {
                value: 'envelope-o',
                name: 'Kontakt mailowy'
            },
            {
                value: 'users',
                name: 'Spotkanie'
            },
            {
                value: 'file-text-o',
                name: 'Podpisanie umowy'
            }
        ];

        _api.timelineHelper = function(contactType){

            return helperOptions[contactType];

        };

        var parseTimeline = function(timeline){
            angular.forEach(timeline, function(element, index){
                element['contact_date'] = new Date(element['contact_date'])
            });

            return timeline;
        };

        _api.getClientTimeline = function(clientId, success){
            success = success || function(){};

            $http.get('api.php/client/'+clientId+'/timeline')
                .success(function(timeline){

                    timeline = parseTimeline(timeline);
                    success(timeline);

                });
        };

        _api.addTimelineEvent = function(clientId, eventData, success){
            success = success || function(){};

            $http.post('api.php/client/'+clientId+'/timeline', eventData)
                .success(function(data){

                    var timeline = parseTimeline(data.timeline);
                    success(timeline);

                })
        };

        return _api;
    }])

})();