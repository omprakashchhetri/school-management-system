<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */

$routes->group('api', ['namespace' => 'App\\Controllers\\Api'], function ($routes) {
    // $routes->get('products', 'Products::index');
});


$routes->get('/', 'Web\DashboardController::index');
$routes->get('login', 'Web\Auth::login');