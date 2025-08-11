<?php

namespace App\Controllers\API;

use App\Controllers\BaseController;

class API extends BaseController
{
    public function index()
    {
        return $this->response->setJSON([
            'status' => 'success',
            'message' => 'Hello from API Controller'
        ]);
    }
}