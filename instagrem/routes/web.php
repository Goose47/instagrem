<?php

use Illuminate\Support\Facades\Route;

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


Auth::routes();

Route::get('/', function(){
   return redirect(route('p.index'));
});

Route::resource('profile', ProfilesController::class)
    ->only([
        'show', 'edit', 'update'
    ])
    ->parameters([
        'profile' => 'user'
    ]);

Route::resource('p', PostsController::class)->parameters([
    'p' => 'post'
]);

Route::post('/follow/{user}', 'FollowsController@store')->name('follow.store');

Route::get('/{user}/followers', 'FollowsController@followersList')->name('followers.list');
Route::get('/{user}/following', 'FollowsController@followingList')->name('following.list');



