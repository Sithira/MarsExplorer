<html>

<title>Rover Report</title>

<style>
    html {
        position: relative;
        min-height: 100%;
    }

    footer {
        position: absolute;
        left: 0;
        bottom: 0;
        height: 20px;
        width: 100%;
    }

    footer p {
        text-align: center;
    }
</style>

<body>
    <h3 style="text-align: center">Full Report on ROVER : {!! $rover->name !!}</h3>

    <br />

    <p>Current State: {!! $rover->state !!}</p>
    <p>Rover Volume: {!! $volume->volume_tot !!}</p>

    <table border="1" width="100%">
        <thead>
            <tr>
                <th>Item</th>
                <th>Count</th>
            </tr>
        </thead>

        <tbody>
            <tr>
                <td>Number of Cameras </td>
                <td>{!! count($cameras) !!}</td>
            </tr>

            <tr>
                <td>Number of Communication Methods</td>
                <td>{!! count($orbitersAndCommunications) !!}</td>
            </tr>

            <tr>
                <td>Number of Coordinates</td>
                <td>{!! count($computersAndCoordinates) !!}</td>
            </tr>

            <tr>
                <td>Number of Sensors</td>
                <td>{!! count($sensorsAndTypes) !!}</td>
            </tr>

            <tr>
                <td>Number of Orbiters used to communicate</td>
                <td>{!! count($orbiterList) !!}</td>
            </tr>

            <tr>
                <td>Number of Images taken</td>
                <td>{!! count($images) !!}</td>
            </tr>

        </tbody>
    </table>

    <footer>
        <p>Report Generated On : {!! \Carbon\Carbon::now()->toDateTimeString() !!} <br/>
            &copy; copyrights to TechNinja 2018
        </p>
    </footer>

</body>

</html>