@if (count($errors) > 0)
  <div class="alert alert-danger">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Whoops!</strong> There were some problems with your input.<br><br>
    <ul>
      @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
      @endforeach
    </ul>
  </div>
@endif


<div class="flash-message">
    @foreach (['danger', 'warning', 'success', 'info'] as $msg)
      @if(Session::has('alert-' . $msg))

      <p class="alert alert-{{ $msg }}">{{ Session::get('alert-' . $msg) }} <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></p>
      @endif
    @endforeach
  </div> <!-- end .flash-message -->
 @if(Session::has('success'))
        <div class="alert alert-info" >
            <div class="container">
                <b>{{ Session::get('success') }}</b>
            </div>
        </div>
@endif

 @if(Session::has('error'))
        <div class="alert alert-info" >
            <div class="container">
                <b>{{ Session::get('error') }}</b>
            </div>
        </div>
@endif

