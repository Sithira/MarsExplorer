@extends('system.system_layout')

@section('content')

    @include('vendor.flash.ErrorFlash')

    <h3 class="title">{!! $rover->name !!}</h3>

    <br />
    <a class="btn btn-danger" href="/rover/{!! $rover->id !!}/explore"><i class="ti-search"></i> Explore Mars using {!! $rover->name !!}</a>
    &nbsp;
    &nbsp;
    <a class="btn btn-success" href="{!! url()->current() !!}/objectives/create"><i class="ti-plus"></i> Add new Objective to the rover</a>
    <br />

    <!-- CAMERAS -->
    <div class="row">

        <div class="col-md-12">
            <h3><i class="ti-camera"></i> CAMERAS</h3>
        </div>

        @foreach($cameras as $camera)
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <img width="80px" src="/assets/img/icon-images/rover-camera.png" alt="#" class="card-img-top">
                        </div>
                        <h3 class="card-title text-center">{!! $camera->name !!}</h3>
                        <div class="text-center">
                            <p>MAIN CAM: {!! ($camera->ismaincam) ? "<span style='font-weight: bold' class='text-success'>YES</span>" : "NO" !!}</p>
                            <p>FOCAL LENGTH: {!! $camera->focal_length !!}</p>
                            <p>FIELD OF VIEW: {!! $camera->field_of_view !!}</p>
                            <p>RESOLUTION: {!! $camera->resolution !!}</p>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach

    </div>

    <!-- SENSORS -->
    <div class="row">
        <div class="col-md-12">
            <h3><i class="ti-signal"></i> SENSORS</h3>
        </div>

        @foreach($sensorsAndTypes as $sensor)
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <div class="text-center">
                                <img width="80px" src="/assets/img/icon-images/rover-sensor.png" alt="#" class="card-img-top">
                            </div>
                        </div>

                        <h3 class="card-title text-center">{!! $sensor->name !!}</h3>

                        <div class="text-center">
                            <p>{!! $sensor->type !!}</p>
                        </div>

                    </div>
                </div>
            </div>
        @endforeach

    </div>

    <!-- Orbiters -->
    <div class="row">
        <div class="col-md-12">
            <h3><i class="ti-layout-media-right"></i> Orbiters</h3>
        </div>

        @foreach($orbiterList as $orbiter)
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <div class="text-center">
                            <img width="80px" src="/assets/img/icon-images/rover-orbiter.png" alt="#" class="card-img-top">
                        </div>

                        <h3 class="card-title text-center">{!! $orbiter->type !!}</h3>

                        <div class="text-center">
                            <p>Planet: {!! $orbiter->planet !!}</p>
                            <p>Mode: {!! $orbiter->cmode !!}</p>
                        </div>

                    </div>
                </div>
            </div>
        @endforeach
    </div>

    <div class="row">
        <div class="col-md-12">

            <h3 class="title">
                <i class="ti-image"></i> Images Taken by the this rover
            </h3>

            <a class="btn btn-primary" href="{!! url()->current() !!}/images"><i class="ti-arrow-circle-right"></i> Images</a>
        </div>
    </div>

@endsection