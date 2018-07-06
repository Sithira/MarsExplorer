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
                <a href="/reports">
                    <i class="ti-book"></i>
                    <p>Reports</p>
                </a>
            </li>
        </ul>
    </div>
</div>