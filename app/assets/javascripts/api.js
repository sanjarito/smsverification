function submitForm(){
  alert("we are inside button function");
  $.ajax({
     url: '/apps/texty/verify',
     data: {
        format: 'json'
     },
     dataType: 'json',
     success: function(data) {
        var $phone = $('<h1>').text(data.phones[0].phone_num);
      },
     type: 'GET'
  });
 }


  //
  // $.ajax({
  //   type: 'GET',
  //   url: '/apps/texty/verify',
  //   data: data,
  //   success: success,
  //   dataType: dataType
  //   })
  // }
