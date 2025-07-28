<?php

use App\Enums\TokenAbility;

use App\Http\Controllers\Api\Cms\AuthClientController;
use App\Http\Controllers\Api\Admin\TreeEntityController;
use App\Http\Controllers\Api\Cms\PetOwnerController;
use Illuminate\Support\Facades\Route;

Route::controller(AuthClientController::class)->group(function () {
    Route::post('/login', 'login')->name('cmsAuth.login');
});

Route::controller(PetOwnerController::class)->prefix('pet-owner')->group(function () {
    Route::post('/register', 'register')->name('cmsAuth.register');
});

Route::post('doctor/reg', [App\Http\Controllers\Api\Cms\AuthClientController::class, 'docReg']);


Route::middleware(['auth:sanctum', 'ability:' . TokenAbility::ISSUE_ACCESS_TOKEN->value])->group(function () {
    Route::post('/refresh-token', [AuthClientController::class, 'refreshToken']);
});


Route::middleware(['auth:sanctum', 'ability:' . TokenAbility::ACCESS_API->value])->group(function () {
    Route::post('/me', [AuthClientController::class, 'getUser']);


    Route::controller(TreeEntityController::class)->name('tree-entity.')->prefix('tree-entity')->group(function () {
        Route::get('show-menu', 'showmenu')->name('show-menu');
    });
});
