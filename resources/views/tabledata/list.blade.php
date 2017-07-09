<table width="100%" border="1">

<thead>
<tr>
@foreach($tableheader as $header)
<th>
    {{ $header->label }}
</th>
@endforeach
</tr>

</thead>

<tbody>
@foreach($tabledata as $tdata)
<?php $row = json_decode($tdata->table_data_values);?>
        <tr>
            @foreach($tableheader as $header)
                <td>
                <?php $name = $header->name; ?>
                @if(is_object(json_decode($row->$name)) || is_array(json_decode($row->$name)))
                    @foreach(json_decode($row->$name) as $data)
                        {{ $data }} <br>
                    @endforeach 
                @else 
                {{ $row->$name }}
                @endif

                </td>
            @endforeach
        </tr>    
    
@endforeach
</tbody>

</table>