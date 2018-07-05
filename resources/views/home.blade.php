@extends('system.system_layout')

@section('content')
    @include('system.partials.__topbar')
@endsection

@section('javascript')
    <script type="text/javascript">
        $(document).ready(function(){

            demo.initChartist();

            $.notify({
                icon: 'ti-user',
                message: "<b>Welcome, {!! Auth::user()->username !!}</b>"

            },{
                type: 'success',
                timer: 2000
            });

        });
    </script>
@endsection
