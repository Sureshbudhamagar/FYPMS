<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>FYPMS - Sushang (Suresh Budha Magar)</title>

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">

        <link href="/css/app.css" rel="stylesheet">
        <script src="/js/jquery-1.10.2.min.js"></script>
        <link href="/css/main.css" rel="stylesheet">


        <!-- Styles -->

        <script>
        $(document).ready(function() {
            $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
            $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
        });
        </script>
    </head>
    <body>
        <div class="flex-center position-ref full-height">
            @if (Route::has('login'))
                <div class="top-right links">
                    @if (Auth::check())
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ url('/login') }}">Login</a>
                        <a href="{{ url('/register') }}">Register</a>
                    @endif
                </div>
            @endif

            <div class="content">
              <h2>
                    FYPMS
              </h2>

            </div>
        </div>





        @yield('content')




        <script>
        $(document).ready(function() {
          // alert('hello');
          // console.log('img error');
          // $(document).on('error', 'img', function () {
          //   console.log('ok error');
          //   $(this).unbind("error").attr("src", "{{ asset('assets/images/no-image.png') }}");
          // });
          $('img').one('error', function() {
            // console.log('one');
            $(this).unbind("error");
            this.src = '{{ asset('images/no-image.png') }}';
            console.clear();
          });
        });
        </script>


            </body>
        </html>
