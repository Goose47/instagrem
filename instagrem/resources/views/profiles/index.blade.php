@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-3 p-5">
            <img src="{{ $user->profile->profileImage() }}" class="rounded-circle" style="max-height: 180px">
        </div>
        <div class="col-9 pt-5">
            <div class="d-flex justify-content-between align-items-baseline">
                <div class="d-flex align-items-baseline pb-4">
                    <div class="h5">{{$user->username}}</div>

                    @if(is_null(auth()->user()) || $user->id !== auth()->user()->id)
                        <follow-button user-id="{{ $user->id }}" follows="{{ $follows }}"></follow-button>
                    @endif

                </div>

                @can('update', $user->profile)
                    <a href="{{ route('p.create') }}">Add new post</a>
                @endcan

            </div>

            @can('update', $user->profile)
                <a href="{{ route('profile.edit', $user->id) }}">Edit Profile</a>
            @endcan

            <div class="d-flex">
                <div class="pr-5">
                    <strong>{{ $counts['posts'] }}</strong> posts
                </div>

                <div class="pr-5">
                    <a href="{{ route('followers.list', $user->id) }}">
                        <span class="text-dark">
                            <strong>{{ $counts['followers'] }}</strong> followers
                        </span>
                    </a>
                </div>

                <div class="pr-5">
                    <a href="{{ route('following.list', $user->id) }}">
                        <span class="text-dark">
                            <strong>{{ $counts['following'] }}</strong> following
                        </span>
                    </a>
                </div>

            </div>
            <div class="pt-4 font-weight-bold">{{ $user->profile->title }}</div>
            <div>{{ $user->profile->description }}</div>
            <div><a href="{{ $user->profile->url }}">{{ $user->profile->url }}</a></div>
        </div>
    </div>
    <div class="row pt-5">
        @foreach($user->posts as $post)
            <div class="col-4 pb-4">
                <a href="{{ route('p.show', $post->id) }}">
                    <img src="/storage/{{$post->image}}" class="w-100">
                </a>
            </div>
        @endforeach

    </div>
</div>
@endsection
