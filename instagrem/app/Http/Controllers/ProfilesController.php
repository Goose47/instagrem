<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateProfileRequest;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Cache;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\File;


class ProfilesController extends Controller
{
    public function show(User $user)
    {
        $follows = auth()->user() ? auth()->user()->following->contains($user->id) : false;

        if(Cache::has('counts')) {
            $counts = Cache::get('counts');
        }else {
            $counts = [
                'posts' => $user->posts->count(),
                'followers' => $user->profile->followers->count(),
                'following' => $user->following->count()
            ];

            Cache::put('counts', $counts, now()->addSeconds(30));
        }

        return view('profiles.index', compact('user', 'follows', 'counts'));
    }

    public function edit(User $user)
    {
        $this->authorize('update', $user->profile);

        return view('profiles.edit', compact('user'));
    }

    public function update(User $user, UpdateProfileRequest $request)
    {
        $this->authorize('update', $user->profile);

        $data = $request->validated();

        if($request->has('image')){
            File::delete(public_path("/storage/{$user->profile->image}"));
            $imagePath = $request->file('image')->store('profiles', 'public');

            $image = Image::make(public_path("storage/$imagePath"))->fit(1000, 1000);
            $image->save();

            $imageArray = ['image' => $imagePath];
        }

        auth()->user()->profile->update(array_merge(
            $data,
            $imageArray ?? []
        ));

        return redirect(route('profile.show', $user->id));
    }
}
