<?php

namespace App\Controllers\Web;

use App\Controllers\BaseController;

class DashboardController extends BaseController
{
    public function index(): string
    {
        return view('templates/header')
            .  view('templates/sidebar')
            .  view('templates/topbar')
            .  view('pages/dashboard')
            .  view('templates/footer')
        ;
    }
}