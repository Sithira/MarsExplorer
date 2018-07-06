<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/rovers', 'RoverController@index')->name('rovers');

Route::get('/rovers/{id}', 'RoverController@show')->name('rovers.show');

Route::get('/rovers/{id}/images', 'RoverController@images');

Route::get('/rover/{roverId}/explore', 'ExplorerMarsController@explore');

Route::delete('/rovers/delete-image/', 'RoverController@deleteImage');

Route::get('/rovers/{id}/objectives/create', 'ObjectiveController@create');

Route::get('/rovers/{roverId}/objectives/{objectiveId}', 'ObjectiveController@edit');

Route::post('/rovers/{id}/objectives', 'ObjectiveController@store');

Route::post('/rovers/{id}/objectives/{objectiveId}', 'ObjectiveController@update');

Route::get('/reports', 'ReportController@index');

Route::get('/reports/{roverId}', 'ReportController@getReportForRover');

Route::get('/test', function() {
    (new \App\Http\Controllers\ExplorerMarsController())->explore(1);
});
