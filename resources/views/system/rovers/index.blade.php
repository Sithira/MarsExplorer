@extends('system.system_layout')

@section('content')
        <div class="col-md-12">
            <h3>
                List of Rovers
                <br />
                <a href="#" data-toggle="modal" data-target="#exampleModalLong" class="btn btn-primary btn-sm"><i class="far fa-plus-square"></i> Add New Rover</a>
            </h3>
        </div>

        @foreach($rovers as $rover)
            <div class="col-md-4 mt-2">
                <div class="card">
                    <img width="100%" src="/assets/img/icon-images/rover-display.png" class="card-img-top">
                    <div class="card-body">
                        <h3 class="card-title text-center">{!! $rover->name !!}</h3>

                        <div class="text-center">
                            <a href="{!! route('rovers.show', $rover->id) !!}" class="btn btn-primary">View More Info</a>
                        </div>

                        <br />

                    </div>
                </div>
            </div>
        @endforeach

    <!-- Modal -->
    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Add New Rover</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label for="roverType">Rover Type: </label>
                    <select class="form-control" name="roverType" id="roverType">
                        @foreach($roverTypes as $type)
                            <option value="{!! $type->id !!}">{!! $type->name !!}</option>
                        @endforeach
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

@endsection