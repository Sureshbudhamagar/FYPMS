<form method="post" action="{{ route('tableheader.store') }}">

{{ csrf_field() }}

<label>Label</label>
<br>
<input type="text" name="label">

<br><br>
<label>Name</label>
<br>
<input type="text" name="name">

<br><br>
<label>Type</label>
<br>
<select name="type">
<option>text</option>
<option>textarea</option>
<option>select</option>
<option>checkbox</option>
<option>radio</option>
<option>file</option>
</select>

<br><br>
<label>Option(s)</label>
<br>
<input type="text" name="options[]"><br>
<input type="text" name="options[]"><br>
<input type="text" name="options[]"><br>

<br><br>
<label>Option default value</label>
<br>
<input type="text" name="default">

<br><br>
<lable>Form Display order</lable>
<br>
<input type="number" name="display_order" value="0">

<br><br>
<input type="submit" value="Create">

</form>