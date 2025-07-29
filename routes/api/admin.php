<?php

use App\Enums\TokenAbility;
use App\Http\Controllers\Api\Admin\AuthClientController;
use App\Http\Controllers\Api\Admin\AuthController;
use App\Http\Controllers\Api\Admin\RoleController;
use App\Http\Controllers\Api\Admin\RolePermissionController;
use App\Http\Controllers\Api\Admin\ServicePricingController;
use App\Http\Controllers\Api\Admin\TreeEntityController;
use App\Http\Controllers\Api\Admin\DoctorProfileController;
use App\Http\Controllers\Api\Admin\UserController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\Admin\PetController;
use App\Http\Controllers\Api\Admin\OrganizationController;
use App\Http\Controllers\Api\Admin\GroomerProfileController;
use App\Http\Controllers\Api\Admin\ServiceController;
use App\Http\Controllers\Api\Admin\AppointmentController;


//Auth
Route::controller(AuthController::class)->group(function () {
    Route::post('/login', 'login')->name('adminAuth.login');
    Route::post('/otp-resend', 'reqOtpResend')->name('adminAuth.otp_resend');
    Route::post('/otp-verify', 'reqOtpVerify')->name('adminAuth.otp_verify');
    Route::post('/set-password', 'setNewPassword')->name('adminAuth.set_password');
    Route::post('/forgot-password', 'forgotPassword')->name('adminAuth.forgotPassword');
});

//Use Refresh Token
Route::middleware(['auth:sanctum', 'ability:' . TokenAbility::ISSUE_ACCESS_TOKEN->value])->group(function () {
    Route::post('/refresh-token', [AuthController::class, 'refreshToken']);
});

//Use Access Token
Route::middleware(['auth:sanctum', 'ability:' . TokenAbility::ACCESS_API->value])->group(function () {
    // Auth
    Route::controller(AuthController::class)->group(function () {
        Route::post('/user', 'getUser')->name('adminAuth.getUser');
        Route::post('/logout', 'logout')->name('adminAuth.logout');
    });
    // Tree Entity
    Route::controller(TreeEntityController::class)->name('tree-entity.')->prefix('tree-entity')->group(function () {
        Route::get('build-menu', 'buildmenu')->name('build-menu');
        Route::post('main-menu', 'treemenuNew')->name('tree-menu');
        Route::post('update-menu', 'updateMenu')->name('update-menu');
        Route::post('delete-menu', 'deleteMenu')->name('delete-menu');
        Route::post('restore/{id}', 'restore')->name('restore');
    });

    Route::apiResource('tree-entity', TreeEntityController::class);
    Route::apiResource('auth-client', AuthClientController::class);
    Route::controller(AuthClientController::class)->group(function () {
        Route::post('auth-client/all', 'index')->name('auth-client.all');
        Route::post('auth-client/restore/{id}', 'restore')->name('tree-entity.restore');
    });

    // Roles
    Route::apiResource('roles', RoleController::class);
    Route::controller(RoleController::class)->group(function () {
        Route::post('roles/all', 'index')->name('roles.all');
        Route::post('roles/restore/{id}', 'restore')->name('roles.restore');
    });

    //use when required
    //->middleware([
    //     'index' => 'check.permission:view',
    //     'store' => 'check.permission:add',
    //     'update' => 'check.permission:edit',
    //     'destroy' => 'check.permission:delete',
    // ])

    // Role Permissions
    Route::controller(RolePermissionController::class)->group(function () {
        Route::post('role-permissions/show/{id}', 'show')->name('roles.show');
        Route::post('role-permissions/permission-update/{id}', 'pupdate')->name('roles.permission-update');
    });


    //Users
    Route::apiResource('users', UserController::class);
    Route::controller(UserController::class)->group(function () {
        Route::post('users/all', 'index')->name('users.all');
        Route::post('users/restore/{id}', 'restore')->name('users.restore');
    });


     // Pet Management Routes
        Route::prefix('pets')->group(function () {
            Route::get('/', [PetController::class, 'index'])->name('pets.index');
            Route::post('/', [PetController::class, 'store'])->name('pets.store');
            Route::get('/{id}', [PetController::class, 'show'])->name('pets.show');
            Route::put('/{id}', [PetController::class, 'update'])->name('pets.update');
            Route::delete('/{id}', [PetController::class, 'destroy'])->name('pets.destroy');
            Route::get('/owner/{ownerId}', [PetController::class, 'getByOwner'])->name('pets.getByOwner');
            Route::get('/categories/list', [PetController::class, 'getPetCategories'])->name('pets.getPetCategories');
            Route::get('/subcategories/list', [PetController::class, 'getPetSubcategories'])->name('pets.getPetSubcategories');
            Route::get('/breeds/list', [PetController::class, 'getPetBreeds'])->name('pets.getPetBreeds');
        });




        // Pet Category Management Routes
        Route::prefix('pet-categories')->group(function () {
            Route::get('/', [App\Http\Controllers\Api\Admin\PetCategoryController::class, 'index'])->name('pet-category.index');
            Route::post('/', [App\Http\Controllers\Api\Admin\PetCategoryController::class, 'store'])->name('pet-category.store');
            Route::get('/{id}', [App\Http\Controllers\Api\Admin\PetCategoryController::class, 'show'])->name('pet-category.show');
            Route::put('/{id}', [App\Http\Controllers\Api\Admin\PetCategoryController::class, 'update'])->name('pet-category.update');
            Route::delete('/{id}', [App\Http\Controllers\Api\Admin\PetCategoryController::class, 'destroy'])->name('pet-category.destroy');
            Route::get('/active/list', [App\Http\Controllers\Api\Admin\PetCategoryController::class, 'getActive'])->name('pet-category.getActive');
        });

        // Pet Subcategory Management Routes
        Route::prefix('pet-subcategories')->group(function () {
            Route::get('/', [App\Http\Controllers\Api\Admin\PetSubcategoryController::class, 'index'])->name('pet-subcategories.index');
            Route::post('/', [App\Http\Controllers\Api\Admin\PetSubcategoryController::class, 'store'])->name('pet-subcategories.store');
            Route::get('/{id}', [App\Http\Controllers\Api\Admin\PetSubcategoryController::class, 'show'])->name('pet-subcategories.show');
            Route::put('/{id}', [App\Http\Controllers\Api\Admin\PetSubcategoryController::class, 'update'])->name('pet-subcategories.update');
            Route::delete('/{id}', [App\Http\Controllers\Api\Admin\PetSubcategoryController::class, 'destroy'])->name('pet-subcategories.destroy');
            Route::get('/category/{categoryId}', [App\Http\Controllers\Api\Admin\PetSubcategoryController::class, 'getByCategory'])->name('pet-subcategories.getByCategory');
            Route::get('/active/list', [App\Http\Controllers\Api\Admin\PetSubcategoryController::class, 'getActive'])->name('pet-subcategories.getActive');
        });

        // Pet Breed Management Routes
        Route::prefix('pet-breeds')->group(function () {
            Route::get('/', [App\Http\Controllers\Api\Admin\PetBreedController::class, 'index'])->name('pet-subcategories.index');
            Route::post('/', [App\Http\Controllers\Api\Admin\PetBreedController::class, 'store'])->name('pet-subcategories.store');
            Route::get('/{id}', [App\Http\Controllers\Api\Admin\PetBreedController::class, 'show'])->name('pet-subcategories.show');
            Route::put('/{id}', [App\Http\Controllers\Api\Admin\PetBreedController::class, 'update'])->name('pet-subcategories.update');
            Route::delete('/{id}', [App\Http\Controllers\Api\Admin\PetBreedController::class, 'destroy'])->name('pet-subcategories.destroy');
            Route::get('/subcategory/{subcategoryId}', [App\Http\Controllers\Api\Admin\PetBreedController::class, 'getBySubcategory'])->name('pet-subcategories.getBySubcategory');
            Route::get('/active/list', [App\Http\Controllers\Api\Admin\PetBreedController::class, 'getActive'])->name('pet-subcategories.getActive');
        });

        // Pet Helper Routes (for dropdowns)
        Route::prefix('pets')->group(function () {
            Route::get('/categories', [App\Http\Controllers\Api\Admin\PetController::class, 'getPetCategories'])->name('pets.getPetCategories');
            Route::get('/subcategories', [App\Http\Controllers\Api\Admin\PetController::class, 'getPetSubcategories'])->name('pets.getPetSubcategories');
            Route::get('/breeds', [App\Http\Controllers\Api\Admin\PetController::class, 'getPetBreeds'])->name('pets.getPetBreeds');
        });

        // Organization Management Routes
        Route::prefix('organizations')->group(function () {
            Route::get('/', [OrganizationController::class, 'index'])->name('organizations.index');
            Route::post('/', [OrganizationController::class, 'store'])->name('organizations.store');
            Route::get('/{id}', [OrganizationController::class, 'show'])->name('organizations.show');
            Route::put('/{id}', [OrganizationController::class, 'update'])->name('organizations.update');
            Route::delete('/{id}', [OrganizationController::class, 'destroy'])->name('organizations.destroy');
            Route::get('/active/list', [OrganizationController::class, 'getActive'])->name('organizations.getActive');
        });

        // Groomer Profile Management Routes
        Route::prefix('groomer-profiles')->group(function () {
            Route::get('/', [GroomerProfileController::class, 'index'])->name('organizations.index');
            Route::post('/', [GroomerProfileController::class, 'store'])->name('organizations.store');
            Route::get('/{id}', [GroomerProfileController::class, 'show'])->name('organizations.show');
            Route::put('/{id}', [GroomerProfileController::class, 'update'])->name('organizations.update');
            Route::delete('/{id}', [GroomerProfileController::class, 'destroy'])->name('organizations.destroy');
            Route::get('/organization/{organizationId}', [GroomerProfileController::class, 'getByOrganization'])->name('organizations.getByOrganization');
            Route::get('/user/{userId}', [GroomerProfileController::class, 'getByUser'])->name('organizations.getByUser');
        });

        // Doctor Profile Management Routes
        Route::prefix('doctor-profiles')->group(function () {
            Route::get('/', [DoctorProfileController::class, 'index'])->name('doctor-profiles.index');
            Route::post('/', [DoctorProfileController::class, 'store'])->name('doctor-profiles.index');
            Route::get('/{id}', [DoctorProfileController::class, 'show'])->name('doctor-profiles.index');
            Route::put('/{id}', [DoctorProfileController::class, 'update'])->name('doctor-profiles.index');
            Route::delete('/{id}', [DoctorProfileController::class, 'destroy'])->name('doctor-profiles.index');
            Route::get('/organization/{organizationId}', [DoctorProfileController::class, 'doctor-profiles'])->name('organizations.index');
            Route::get('/user/{userId}', [DoctorProfileController::class, 'getByUser'])->name('doctor-profiles.index');
        });

        // Service Management Routes
        Route::prefix('services')->group(function () {
            Route::get('/', [ServiceController::class, 'index'])->name('services.index');
            Route::post('/', [ServiceController::class, 'store'])->name('services.store');
            Route::get('/{id}', [ServiceController::class, 'show'])->name('services.show');
            Route::put('/{id}', [ServiceController::class, 'update'])->name('services.update');
            Route::delete('/{id}', [ServiceController::class, 'destroy'])->name('services.destroy');
            Route::get('/organization/{organizationId}', [ServiceController::class, 'getByOrganization'])->name('services.getByOrganization');
            Route::get('/{serviceId}/pricing', [ServiceController::class, 'getServicePricing'])->name('services.getServicePricing');
            Route::put('/{serviceId}/pricing', [ServiceController::class, 'updateServicePricing'])->name('services.updateServicePricing');
        });

        // Service Pricing Management Routes
        Route::prefix('service-pricing')->group(function () {

            Route::get('/', [ServicePricingController::class, 'index'])->name('services.index');
            Route::post('/', [ServicePricingController::class, 'store'])->name('services.store');
            Route::get('/{id}', [ServicePricingController::class, 'show'])->name('services.show');
            Route::put('/{id}', [ServicePricingController::class, 'update'])->name('services.update');
            Route::delete('/{id}', [ServicePricingController::class, 'destroy'])->name('services.destroy');
            Route::get('/service/{serviceId}', [ServicePricingController::class, 'getByService'])->name('services.getByService');
            Route::get('/service/{serviceId}/category/{categoryId}', [ServicePricingController::class, 'getByServiceAndCategory'])->name('services.getByServiceAndCategory');
            Route::post('/bulk-update', [ServicePricingController::class, 'bulkUpdate'])->name('services.bulkUpdate');
        });

        // Appointment Management Routes
        Route::prefix('appointments')->group(function () {
            Route::get('/', [AppointmentController::class, 'index'])->name('appointments.index');
            Route::post('/', [AppointmentController::class, 'store'])->name('appointments.store');
            Route::get('/{id}', [AppointmentController::class, 'show'])->name('appointments.show');
            Route::put('/{id}', [AppointmentController::class, 'update'])->name('appointments.update');
            Route::delete('/{id}', [AppointmentController::class, 'destroy'])->name('appointments.destroy');
            Route::patch('/{id}/status', [AppointmentController::class, 'updateStatus'])->name('appointments.updateStatus');
            Route::get('/pet/{petId}', [AppointmentController::class, 'getByPet'])->name('appointments.getByPet');
            Route::get('/professional/{type}/{id}', [AppointmentController::class, 'getByProfessional'])->name('appointments.getByProfessional');
            Route::get('/dashboard/stats', [AppointmentController::class, 'getDashboardStats'])->name('appointments.getDashboardStats');
        });
});
