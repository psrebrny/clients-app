/**
 * Created by Paweł on 2015-02-28.
 */

(function(){

    var app = angular.module('clientsApp', ['ui.router']);

    app.config(['$stateProvider','$urlRouterProvider',function($stateProvider, $urlRouterProvider) {

        $urlRouterProvider.otherwise("/clients");
        $stateProvider
            .state('clients', {
                url: "/clients",
                templateUrl: "views/clients-list.html"
            })
            .state('sectors', {
                url: "/sectors",
                templateUrl: "views/sectors-list.html"
            })
            .state('users', {
                url: "/users",
                templateUrl: "views/users-list.html"
            })

    }]);

})();