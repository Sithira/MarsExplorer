<div class="sidebar" data-background-color="black" data-active-color="danger">

    <!--
        Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
        Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
    -->

    <div class="sidebar-wrapper">
        <div class="logo">
            <a href="/" class="simple-text">
                Mars-Explorer
            </a>
        </div>

        <ul class="nav">
            <li class="active">
                <a href="/">
                    <i class="ti-panel"></i>
                    <p>Dashboard</p>
                </a>
            </li>

            <li>
                <a href="{!! route('rovers') !!}">
                    <i class="ti-target"></i>
                    <p>Rovers</p>
                </a>
            </li>

            <li>
                <a href="missions.html">
                    <i class="ti-view-list-alt"></i>
                    <p>Missions</p>
                </a>
            </li>
            <li>
                <a href="rovers.html">
                    <i class="ti-target"></i>
                    <p>Rovers</p>
                </a>
            </li>
            <li>
                <a href="sensors.html">
                    <i class="ti-signal"></i>
                    <p>Sensors</p>
                </a>
            </li>
            <li>
                <a href="cameras.html">
                    <i class="ti-camera"></i>
                    <p>Cameras</p>
                </a>
            </li>
            <li>
                <a href="notifications.html">
                    <i class="ti-package"></i>
                    <p>Reports</p>
                </a>
            </li>
        </ul>
    </div>
</div>