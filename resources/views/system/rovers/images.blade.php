@extends('system.system_layout')

@section('content')

    <div class="row">
        @foreach($images as $image)
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <img width="100%" src="{!! $image->data !!}" alt="img" class="card-img-top">
                        <h3 class="card-title text-center">
                            Image Significance: {!! $image->significance !!}
                            <br />
                            <small>
                                Coordinates: {!! $image->coordinates !!}
                            </small>
                        </h3>

                        <div class="text-center">
                            {!! Form::open(['method' => 'DELETE', 'action' => 'RoverController@deleteImage']) !!}
                            {!! Form::hidden('image_id', $image->id) !!}
                            {!! Form::submit('Delete Image', ['class' => 'btn btn-danger']) !!}
                            {!! Form::close() !!}
                        </div>

                    </div>
                </div>
            </div>
        @endforeach
    </div>

@endsection