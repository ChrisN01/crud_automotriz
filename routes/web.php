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
    return view('auth.login');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

/*Rutas para los clientes*/
Route::resource('/clients', 'ClientController')->middleware('auth');
Route::get('/clients', 'ClientController@get_clients')->middleware('auth')->name('client.list');
Route::post('/clients/delete/{id}/{concessionaire_id}', 'ClientController@delete')->middleware('auth')->name('client.delete');

Route::get('/concessionaires/clients', 'ClientController@client_location')->middleware('auth')->name('client.by_location');
Route::get('/clients/location/{id}', 'ClientController@search_clients_by_location')->middleware('auth')->name('client.search.location');

/*Rutas para los concesionarios*/
Route::get('/concessionaires/list', 'ClientController@get_concessionaires')->middleware('auth');
Route::resource('/concessionaires', 'ConcessionaireController')->middleware('auth');

Route::get('/locations', 'ClientController@get_locations')->middleware('auth');