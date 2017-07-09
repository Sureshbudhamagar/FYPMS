<form action="{{ $url or Request::url() }}" method="POST">
    {{ method_field('DELETE') }}
    {{ csrf_field() }}
    <button type='submit' class="{{ $class or 'btn btn-danger btn-xs' }}" value="{{ $value or 'delete' }}" style="float: left; margin-left: 10px">{!! $text or 'delete' !!}</button>
</form>
