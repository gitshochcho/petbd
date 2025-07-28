<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


    Route::post('doctor/reg', [App\Http\Controllers\Api\Cms\AuthClientController::class, 'docReg']);

