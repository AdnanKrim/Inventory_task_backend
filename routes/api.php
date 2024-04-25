<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\InventoryController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group(['middleware' => 'auth:sanctum'], function(){
    //item Api
    Route::get('item-list',[ItemController::class,'itemList'])->name('item-list');
    Route::post('add-item',[ItemController::class,'itemAdd'])->name('add-item');

    //Inventory Api
    Route::post('add-inventory',[InventoryController::class,'inventoryAdd'])->name('add-inventory');
    Route::get('inventory-detail',[InventoryController::class,'inventoryDetail'])->name('inventory-detail');
    });

//login and reg Api.....
Route::post("user-login",[UserController::class,'userLogin'])->name('user-login');
Route::post("user-reg",[UserController::class,'userReg'])->name('user-reg');
