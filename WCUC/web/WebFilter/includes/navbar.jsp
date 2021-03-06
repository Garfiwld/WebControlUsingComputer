<header>
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark secondary-color lighten-1 scrolling-navbar double-nav">
        <a id="digital-clock" class="navbar-brand ml-3" href="#">Control Using Computer Lab</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-5" aria-controls="navbarSupportedContent-5" aria-expanded="true" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse show" id="navbarSupportedContent-5" style="">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link waves-effect waves-light" href="room.jsp"><i class="fas fa-th"></i> Room Control</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link waves-effect waves-light" href="room_info.jsp"><i class="fas fa-users-class"></i> Room Info</a>
                </li>
                <%
                    if ("Admin".equals(session.getAttribute("trole"))) {
                %>
                <li class="nav-item">
                    <a class="nav-link waves-effect waves-light" href="Admin/edit_teacher.jsp"><i class="fas fa-user-cog"></i> Edit Teacher</a>
                </li>
                <%
                    }
                %>
                <li class="nav-item">
                    <a class="nav-link waves-effect waves-light" href="edit_student.jsp"><i class="fas fa-users-cog"></i> Edit Student</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto nav-flex-icons">
                <li class="nav-item dropdown">

                    <a class="nav-link dropdown-toggle waves-effect waves-light" id="navbarDropdownMenuLink-5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        ${sessionScope.tfirstname} ${sessionScope.tlastname} <i class="fas fa-user"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg-right dropdown-secondary" aria-labelledby="navbarDropdownMenuLink-5">
                        <a class="dropdown-item waves-effect waves-light"  href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>