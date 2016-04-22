function submitForm(){
  alert("we are inside button function");

     $.ajax({
         url: 'http://santiago.pixfizz.com/v1/admin/users/2760630',
         method: 'POST',
         dataType: 'json',
         data: 'email':'santiago@nowhereprod.com',
         success: function(data){
           console.log('succes: '+data);
         }
       });
}
