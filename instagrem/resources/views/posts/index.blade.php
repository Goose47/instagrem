@extends('layouts.app')

@section('content')
    <div class="container">
        @foreach($posts as $post)
            <div class="row col-6 offset-3">
                <a href="{{ route('p.show', $post->id) }}">
                    <img src="/storage/{{ $post->image }}" class="w-100">
                </a>
            </div>

            <div class="row col-6 offset-3 pt-2 pb-4">
                    <div class="d-flex">

                        <div class="font-weight-bold pr-2">
                            <a href="{{ route('profile.show', $post->user->id) }}">
                                <span class="text-dark">{{ $post->user->username }}</span>
                            </a>
                        </div>

                        <p>
                            {{ $post->caption }}
                        </p>

                    </div>
            </div>
        @endforeach

            <div class="row">
                <div class="col-12 justify-content-center d-flex">
                    {{ $posts->links('pagination::bootstrap-4') }}
                </div>
            </div>

    </div>
@endsection
