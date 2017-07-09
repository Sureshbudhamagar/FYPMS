<form method="post" action="{{ route('tabledata.store') }}" enctype="multipart/form-data">

{{ csrf_field() }}

@foreach($tableheader as $header)

<br><br>
<label>{{ $header->label }}</label>

<?php 

switch($header->type) {
    case 'text':
    ?>
    <input type="text" name="{{ $header->name }}" value="{{ $header->default }}">
    <?php 
    break;

    case 'textarea':
    ?>
    <textarea name="{{ $header->name }}" value="{{ $header->default }}">
    <?php 
    break;

    case 'select':
    $options = unserialize($header->options);
    ?>
    <select name="{{ $header->name }}" value="{{ $header->default }}">
    @foreach($options as $option)
        <option>{{ $option }}</option>
    @endforeach
    </select>
    <?php 
    break;

    case 'radio':
    $options = unserialize($header->options);
    ?>
    @foreach($options as $option)
        <br>
        <input type="radio" name="{{ $header->name }}" value="{{ $option }}" @if($option == $header->default) checked @endif>
        {{ $option }} 
    @endforeach
    <?php 
    break;

    case 'checkbox':
    $options = unserialize($header->options);
    ?>
    @foreach($options as $option)
        <br>
        <input type="checkbox" name="{{ $header->name }}[]" value="{{ $option }}" @if($option == $header->default) checked @endif>
        {{ $option }}
    @endforeach
    <?php 
    break;
}

?>

<br><br>

@endforeach

<input type="submit" value="Create">
</form>