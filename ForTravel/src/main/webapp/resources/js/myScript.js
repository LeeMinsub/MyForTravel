function myAjax(url1,async1,dataType1,data1,success1){
$.ajax({
  			type : "get",
  			url : url1,
  			async:async1,
  			dataType : dataType1,
  			data:data1,
  			success : function(responseData,status,xhr){
  				$(success1).html(responseData)
  			},//end sucess
  			error : function(error) {
  				console.log(error);
  			}
  		}); //end ajax
}