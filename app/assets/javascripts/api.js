function submitForm(){
  alert("we are inside button function");

     $.ajax({
         url: 'https://santiago.pixfizz.com/v1/admin/users/2760630',
         method: 'POST',
         dataType: 'json',
         data: "user[email]=santiago@gmail.com",
         success: function(data){
           console.log('succes: '+data);
         }
       });
}
