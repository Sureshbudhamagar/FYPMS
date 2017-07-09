<script>
    var cleartime;
    $(document).ready(function () {

       $('#rejectModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var rejectID = button.data('id') // Extract info from data-* attributes
            $('#project_id').val(rejectID);

        });
        $(document).on('click', '.rejectBtn', function () {
            /*disabled button after clicked*/
            $(this).prop('disabled', true);
            var project_id = $('#project_id').val();
            var message = $('#rejectmessage').val();
            //Location Schedule Page
            var request = $.ajax({
                url: "{{ url('project/rejectinvitation') }}",
                type: "POST",
                data: {project_id: project_id, message : message},
                dataType: "json"
            });
            request.done(function (data) {
                $(this).prop('disabled', false);
                if (data.type == 'success') {
                    alert(data.message);
                    $(location).attr('href',"{{ url('supervisor/project-invitation') }}" );
                }
                else{
                $(location).attr('href',data.url);
                }
               
            });
            request.fail(function (jqXHR, textStatus) {
                $(this).prop('disabled', false);
                alert("Request failed: " + textStatus);
            });
        });

       $('#holdModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var rejectID = button.data('id') // Extract info from data-* attributes
            $('#project_id').val(rejectID);

        });
        $(document).on('click', '.holdBtn', function () {
            /*disabled button after clicked*/
            $(this).prop('disabled', true);
            var project_id = $('#project_id').val();
            var message = $('#holdmessage').val();
            //Location Schedule Page
            var request = $.ajax({
                url: "{{ url('project/holdinvitation') }}",
                type: "POST",
                data: {project_id: project_id, message : message},
                dataType: "json"
            });
            request.done(function (data) {
                $(this).prop('disabled', false);
                if (data.type == 'success') {
                    alert(data.message);
                    $(location).attr('href',"{{ url('supervisor/project-invitation') }}" );
                }
                else{
                $(location).attr('href',data.url);
                }
               
            });
            request.fail(function (jqXHR, textStatus) {
                $(this).prop('disabled', false);
                alert("Request failed: " + textStatus);
            });
        });
       
    });

</script>