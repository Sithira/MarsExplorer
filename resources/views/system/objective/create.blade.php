@extends('system.system_layout')

@section('content')

    <div class="row">
        <div class="col-md-8 col-md-offset-2">

            <div class="card" style="padding: 10px">

                @include('vendor.flash.ErrorFlash')

                {!! Form::open(['method' => 'POST', 'action' => ['ObjectiveController@store', $rover->id]]) !!}

                {!! Form::hidden('rover_id', $rover->id) !!}

                    <div class="card-header">
                        <h4 class="card-title">
                            Add a new Objective to the {!! strtoupper($rover->name) !!}
                        </h4>
                    </div>
                    <div class="card-content">
                        <div class="form-group">
                            <label>Mission Name </label>
                            <input type="text" disabled value="{!! $mission->name !!}" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Objective Name </label>
                            <input type="text" name="name" id="name" placeholder="Objective name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Objective Type </label>
                            <input type="text" name="type" id="type" placeholder="Objective type" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Objective Description </label>
                            <textarea id="description" name="description" placeholder="Objective Description" class="form-control"></textarea>
                        </div>
                        <button type="submit" class="btn btn-fill btn-info">Add Objective</button>
                    </div>
                {!! Form::close() !!}
            </div>

        </div>
    </div>

@endsection