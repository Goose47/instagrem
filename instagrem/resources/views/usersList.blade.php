@extends('layouts.app')

@section('content')
    <div class="container">
        @foreach($users as $user)
            <div class="row col-6 offset-3 d-flex align-items-center pt-3">
                <img src="{{ $user->profile->profileImage() }}" class="w-100 rounded-circle" style="max-width: 40px">

                <a href="{{ route('profile.show', $user->id) }}"><span class="text-dark pl-3">{{ $user->username }}</span></a>
            </div>
        @endforeach
    </div>
@endsection

