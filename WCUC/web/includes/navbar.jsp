<header>
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark secondary-color lighten-1 scrolling-navbar double-nav">
        <a class="navbar-brand ml-3" href="#">Control Using Computer Lab</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-5" aria-controls="navbarSupportedContent-5" aria-expanded="true" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse show" id="navbarSupportedContent-5" style="">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link waves-effect waves-light" href="#"><i class="fas fa-grip-horizontal"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link waves-effect waves-light" href="/RoomEdit/list"><i class="fas fa-border-none"></i> Edit Room And Seat</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link waves-effect waves-light" href="edit_teacher.jsp"><i class="fas fa-user-cog"></i> Edit Teacher</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/SelectControl/list">Select Control</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/RoomControl/list">Room Control</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle waves-effect waves-light" id="navbarDropdownMenuLink-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fas fa-cogs"></i> Edit Banlist</a>
                    <div class="dropdown-menu dropdown-secondary" aria-labelledby="navbarDropdownMenuLink-5">
                        <a class="dropdown-item waves-effect waves-light" href="/EditStudent/list"><i class="fas fa-users-cog"></i> Websites</a>
                        <a class="dropdown-item waves-effect waves-light" href="/EditCourse/list"><i class="fas fa-tasks"></i> Software</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle waves-effect waves-light" id="navbarDropdownMenuLink-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fas fa-cogs"></i> Edit Other</a>
                    <div class="dropdown-menu dropdown-secondary" aria-labelledby="navbarDropdownMenuLink-5">
                        <a class="dropdown-item waves-effect waves-light" href="/EditStudent/list"><i class="fas fa-users-cog"></i> Edit Student</a>
                        <a class="dropdown-item waves-effect waves-light" href="/EditCourse/list"><i class="fas fa-tasks"></i> Edit Course</a>
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto nav-flex-icons">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle waves-effect waves-light" id="navbarDropdownMenuLink-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        ${sessionScope.username} <i class="fas fa-user"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg-right dropdown-secondary" aria-labelledby="navbarDropdownMenuLink-5">
                        <a class="dropdown-item waves-effect waves-light" href="/EditStudent/list"><i class="fas fa-users-cog"></i> Edit Password</a>
                        <a class="dropdown-item waves-effect waves-light"  href="/signout"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>