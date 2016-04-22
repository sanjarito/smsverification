function submitForm(){
  alert("we are inside button function");

     $.ajax({
         url: 'https://santiago.pixfizz.com/v1/admin/users/2760630',
         method: 'PUT',
         dataType: 'jsonp',
         username: 'santiago_casar@pixfizz.com',
         password: 'Detech28!!',
         data: JSON.stringify({"first_name": "Adam"}),
         success: function(data){
           console.log('succes: '+data);
         }
       });
}
