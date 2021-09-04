<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class FollowsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function store(User $user)
    {
        return auth()->user()->following()->toggle($user->profile);
    }

    public function followersList(User $user)
    {
        $users = $user->profile->followers;

        return view('usersList', compact('users'));
    }

    public function followingList(User $user)
    {
        $profiles = $user->following;

        foreach($profiles as $profile){
            $users[] = $profile->user;
        }

        return view('usersList', compact('users'));
    }
}
