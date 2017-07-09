<!-- Modal -->
 <input type="hidden"  name="project_id" id="project_id">
<div class = "modal fade" id = "rejectModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "rejectModalLabel" aria-hidden = "true">
   
   <div class = "modal-dialog">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                  &times;
            </button>
            
            <h4 class = "modal-title" id = "rejectModalLabel">
               Reject Message For Student
            </h4>
         </div>
         
         <div class = "modal-body">
            <textarea name="rejectmessage" id="rejectmessage" class="form-control" rows="8"></textarea>
         </div>
         
         <div class = "modal-footer">
            <button type = "button" class = "btn btn-default" data-dismiss = "modal">
               Close
            </button>
                <button type="button" class="btn btn-primary rejectBtn">Submit</button>

         </div>
         
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
  
</div><!-- /.modal -->

<!-- Modal -->
<div class = "modal fade" id = "holdModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "holdModalLabel" aria-hidden = "true">
   
   <div class = "modal-dialog">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                  &times;
            </button>
            
            <h4 class = "modal-title" id = "holdModalLabel">
               Hold Message For Student
            </h4>
         </div>
         
         <div class = "modal-body">
            <textarea name="holdmessage" id="holdmessage" class="form-control" rows="8"></textarea>
         </div>
         
         <div class = "modal-footer">
            <button type = "button" class = "btn btn-default" data-dismiss = "modal">
               Close
            </button>
            
             <button type="button" class="btn btn-primary holdBtn">Submit</button>

         </div>
         
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
  
</div><!-- /.modal -->