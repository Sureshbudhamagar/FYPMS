<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'FYPMS - Sushang - Suresh Budha Magar') }}</title>

    <!-- Styles -->
    <link href="/css/app.css" rel="stylesheet">

    <!-- Scripts -->
    <script>
        window.Laravel = {!! json_encode([
            'csrfToken' => csrf_token(),
        ]) !!};
    </script>
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">

                    <!-- Collapsed Hamburger -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <!-- Branding Image -->
                    <a class="navbar-brand" href="{{ url('/') }}">
                        {{ config('app.name', 'Laravel') }}
                    </a>
                </div>

                <div class="collapse navbar-collapse" id="app-navbar-collapse">
                    <!-- Left Side Of Navbar -->
                    <ul class="nav navbar-nav">
                        &nbsp;
                        @if (!Auth::guest())
                          @if(Auth::user()->role == 'admin')
                          <li><a href="{{ url('admin/project/list') }}">Projects</a></li>
                          <li><a href="{{ url('admin/supervisor/list') }}">Supervisors</a></li>
                          <li><a href="{{ url('admin/student/list') }}">Students</a></li>
                          <li><a href="{{ url('admin/message/inbox') }}">Inbox <span class="badge">{{ App\Models\Message::where('status', 0)->where('to', Auth::user()->id)->count()}}</span></a></li>
                          @endif
                        @endif
                    </ul>

                    <ul class="nav navbar-nav">
                        &nbsp;
                        @if (!Auth::guest())
                          @if(Auth::user()->role == 'supervisor')
                          <li><a href="{{ url('supervisor/project/list') }}">Supervised  Project</a></li>
                          <li><a href="{{ url('supervisor/task') }}">Task</a></li>
                          <li><a href="{{ url('supervisor/task/create') }}">Create a Task</a></li>
                          <li><a href="{{ url('supervisor/project-invitation') }}">Invitations <span class="badge">{{ App\Models\ProjectInvitation::where('status', 'pending')->where('email', Auth::user()->email)->count()}}</span></a></li>
                          <li><a href="{{ url('supervisor/message/inbox') }}">Inbox  <span class="badge">{{ App\Models\Message::where('status', 0)->where('to', Auth::user()->id)->count()}}</span></a></li>
                          @endif
                        @endif
                    </ul>

                    <ul class="nav navbar-nav">
                        &nbsp;
                        @if (!Auth::guest())
                          @if(Auth::user()->role == 'student')
                          <li><a href="{{ url('student/project/create') }}">Submit Project</a></li>
                          <li><a href="{{ url('student/project') }}">My Projects</a></li>
                          <li><a href="{{ url('student/assignment') }}">Assignments</a></li>
                          <li><a href="{{ url('student/project-invitation') }}">Invitations <span class="badge">{{ App\Models\ProjectInvitation::where('status', 'pending')->where('email', Auth::user()->email)->count()}}</span></a></li>
                          <li><a href="{{ url('student/message/inbox') }}">Inbox  <span class="badge">{{ App\Models\Message::where('status', 0)->where('to', Auth::user()->id)->count()}}</span></a></li>
                          @endif
                        @endif


                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="nav navbar-nav navbar-right">
                        <!-- Authentication Links -->
                        @if (Auth::guest())
                            <li><a href="{{ url('/login') }}">Login</a></li>
                            <li><a href="{{ url('/register') }}">Register</a></li>
                        @else
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    {{ Auth::user()->fname }} {{ Auth::user()->lname }} <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="{{ url('change-password') }}">Change password</a>
                                        <a href="{{ url('/logout') }}"
                                            onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                            Logout
                                        </a>

                                        <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        @endif
                    </ul>
                </div>
            </div>
        </nav>

        @include('utils.message')

        @yield('content')
    </div>


<?php /*
    <div id="root">
      <input type="text" id="input" v-model="message">

      @{{ message }}
    </div>

    <template id="auto-complete">
     <input type="text" name="{{id}}" list="{{id}}" :style="styleObject" />
     <datalist id="{{id}}">
     <option v-for="framework in frameworks" value="{{framework}}" />
     </datalist>
    </template>

    <div id="app">
 <auto-complete :frameworks="list" :id="id"></auto-complete>
</div>

    <!-- Scripts -->

    <script>
      // document.querySelector('#input').value = 'Hello';

      let data = {
        message: "Hello World"
      }

      var app = new Vue({
        el: '#root',
        data: data
      });


      Vue.component("auto-complete", {
          props : ['frameworks', 'id'],
          template : "#auto-complete",
      })

      new Vue({
       el: "#app",
        data: {
            id: 'jsFrameworks',
            list: [
               'JQuery',
               'React',
               'VueJs',
               'AngularJs',
            ]
           }
        })
    </script>
*/ ?>


<!-- Scripts -->
<script src="/js/app.js"></script>

@yield('page_specific_scripts')



<script>
new Vue({
  el: '#app',
  data: {
    selected: null,
    typeahead: null,
    states: ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
  },

  methods: {
    select: function(state){
      this.typeahead = state
      this.selected = state
    },

    input: function(){
      this.selected = null
    }
  }
});
</script>




</body>
</html>
