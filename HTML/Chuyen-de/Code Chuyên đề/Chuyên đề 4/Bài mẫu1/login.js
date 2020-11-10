function check_login(){
	var myform=document.forms['login-form'];
	if(myform.username.value ==''){
		alert("Vui lòng nhập tên tài khoản");
		return false;
	}
	if(myform.password.value ==''){
		alert("Vui lòng nhập mật khẩu");
		return false;
	}
	if(myform.username.value=='Admin'&& myform.password.value==123456){
		window.location.assign('welcom.html');
		return false;
	}else{
		alert("tên hoặc mật khẩu không chính xác");
	}
}