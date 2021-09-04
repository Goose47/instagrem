@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-8">
                <img src="/storage/{{$post->image}}" class="w-100">
            </div>
            <div class="col-4">
                <div class="d-flex align-items-center">
                    <div class="pr-3">
                        <img src="{{ $post->user->profile->profileImage() }}" class="w-100 rounded-circle" style="max-width: 40px">
                    </div>

                    <div class="font-weight-bold pl-3">
                        <a href="{{ route('profile.show', $post->user->id) }}">
                            <span class="text-dark">{{ $post->user->username }}</span>
                        </a>
                    </div>

                </div>

                <hr>

                <p>
                    <a href="{{ route('profile.show', $post->user->id) }}">
                        <span class="text-dark font-weight-bold">{{ $post->user->username }}</span>
                    </a>
                    <span> {{ $post->caption }}</span>
                </p>
            </div>
        </div>
    </div>
@endsection
