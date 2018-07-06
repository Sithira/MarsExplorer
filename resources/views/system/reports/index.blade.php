@extends('system.system_layout')

@section('content')
    <div class="row">
        @foreach($rovers as $rover)
            <div class="col-md-4 mt-2">
                <div class="card">
                    <img width="100%" src="/assets/img/icon-images/rover-report.png" class="card-img-top">
                    <div class="card-body">
                        <h3 class="card-title text-center">{!! $rover->name !!}</h3>

                        <div class="text-center">
                            <a href="/reports/{!! $rover->id !!}" class="btn btn-primary"><i class="ti-book"></i> Get Report</a>
                        </div>

                    </div>
                </div>
            </div>
        @endforeach
    </div>
@endsection