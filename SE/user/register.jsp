<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/loginchecknot.jsp"%>
<%@include file="/common/header.jsp"%>

<div class="container">
    <div class="row main">
        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
            <div class="panel-heading ">
                <div class="panel-title text-center">
                    <h1 class="title">13.6th Street<br />회원 가입</h1>
                    <hr />
                </div>
            </div>
            <div class="main-login main-center">
                <form method="post" action="registerproc.jsp"
                 onsubmit="return validateForm()">
                    
                    <div class="form-group">
                        <label for="userid" class="cols-sm-2 control-label">ID</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="userid" id="userid"  placeholder="아이디를 입력하세요" autocomplete="off"/>
                            </div>
                        </div>

                        <div class="info" id="id_info" style="display:none;">
                            <ul>
								<li id="id_duplicate" class="invalid"><strong>중복되지 않는</strong> 아이디</li>
                                <li id="id_valid" class="invalid"><strong>사용가능</strong>한 문자 (대소문자, 숫자)</li>
                                <li id="id_length" class="invalid">아이디 길이 <strong>4 이상 12 이하</strong></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password" class="cols-sm-2 control-label">비밀번호</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
                                <input type="password" class="form-control" name="password" id="password"  placeholder="비밀번호를 입력하세요" autocomplete="off"/>
                            </div>
                        </div>

                        <div class="info" id="pswd_info" style="display:none;">
                            <ul>
                                <li id="length" class="invalid">비밀번호 길이 <strong> 8 이상 20 이하</strong></li>
                                <li id="pw_valid" class="invalid"><strong>사용가능</strong>한 문자 (대소문자, 숫자)</li>
                                <li id="number" class="invalid"><strong>숫자 1개 이상</strong></li>
                            </ul>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="confirm" class="cols-sm-2 control-label">비밀번호 확인</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
                                <input type="password" class="form-control" name="confirm" id="confirm"  placeholder="비밀번호를 한 번 더 입력하세요" autocomplete="off"/>
                            </div>
                        </div>

                        <div class="info" id="cfrm_info" style="display:none;">
                            <ul>
                                <li id="equal" class="invalid">비밀번호와 <strong>일치</strong></li>
                            </ul>
                        </div>
                    </div>

					<div class="form-group">
                        <label for="email" class="cols-sm-2 control-label">Email</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i></span>
                                <input type="email" class="form-control" name="email" id="email"  placeholder="이메일을 입력하세요 (ex. example@example.com)" autocomplete="off"/>
                            </div>
                        </div>

                        <div class="info" id="mail_info" style="display:none;">
                            <ul>
                                <li id="mailaddress" class="invalid">정상적인 <strong> 이메일 주소</strong></li>
                            </ul>
                        </div>
                    </div>

					<div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">이름</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="name" id="name"  placeholder="이름을 입력하세요 (ex. 홍길동)" autocomplete="off"/>
                            </div>
                        </div>

                        <div class="info" id="name_info" style="display:none;">
                            <ul>
                                <li id="validname" class="invalid">정상적인 <strong> 한글 이름</strong></li>
                            </ul>
                        </div>
                    </div>

					<div class="form-group">
                        <label for="phone" class="cols-sm-2 control-label">전화번호</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="phone" id="phone"  placeholder="전화번호를 입력하세요 (ex. 010-0000-0000)" autocomplete="off"/>
                            </div>
                        </div>

                        <div class="info" id="phone_info" style="display:none;">
                            <ul>
                                <li id="phonenum" class="invalid">정상적인 <strong>전화번호</strong></li>
                            </ul>
                        </div>
                    </div>

					<div class="form-group">
                        <label for="address" class="cols-sm-2 control-label">주소</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-road" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="address" id="address"  placeholder="주소를 입력하세요"
									 onfocus="sample3_execDaumPostcode()" onclick="sample3_execDaumPostcode()" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

					<div id="wrap" class="cols-sm-10" style="display:none;border:1px solid;height:300px;margin:5px 0;position:relative">
						<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
                    
                    <hr />

                    <div class="form-group ">
                        <button type="submit" id="submit" class="btn btn-primary btn-lg btn-block login-button">회원 가입</button>
                    </div>                    
                </form>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function(){
	
    //document.getElementById('submit').disabled = true;


    $('input[id=userid]').keyup(function() {
		var userid = $(this).val();
		
		idCheck(userid);
		
		//validate userid
		if ( userid.match(/^[a-zA-Z0-9]+/) ) {
			$('#id_valid').removeClass('invalid').addClass('valid');
		} else {
			$('#id_valid').removeClass('valid').addClass('invalid');
		}

        //validate the length
		if ( userid.length < 4 || userid.length > 12 ) {
			$('#id_length').removeClass('valid').addClass('invalid');
		} else {
			$('#id_length').removeClass('invalid').addClass('valid');
		}
		
	}).focus(function() {
		$('#id_info').show();
	}).blur(function() {
		//$('#id_info').hide();
	});   

	$('input[id=password]').keyup(function() {
		var pswd = $(this).val();
		var confirm = $('#confirm').val();
		
		//validate the length
		if ( pswd.length < 8 || pswd.length > 20 ) {
			$('#length').removeClass('valid').addClass('invalid');
		} else {
			$('#length').removeClass('invalid').addClass('valid');
		}

		//validate pswd
		if ( pswd.match(/^[a-zA-Z0-9]+/) ) {
			$('#pw_valid').removeClass('invalid').addClass('valid');
		} else {
			$('#pw_valid').removeClass('valid').addClass('invalid');
		}
		
		//validate letter
		/*if ( pswd.match(/[A-z]/) ) {
			$('#letter').removeClass('invalid').addClass('valid');
		} else {
			$('#letter').removeClass('valid').addClass('invalid');
		}*/

		//validate capital letter
		/*if ( pswd.match(/[A-Z]/) ) {
			$('#capital').removeClass('invalid').addClass('valid');
		} else {
			$('#capital').removeClass('valid').addClass('invalid');
		}*/

		//validate number
		if ( pswd.match(/\d/) ) {
			$('#number').removeClass('invalid').addClass('valid');
		} else {
			$('#number').removeClass('valid').addClass('invalid');
		}
		
		//validate space
		/*if ( pswd.match(/[^a-zA-Z0-9\-\/]/) ) {
			$('#space').removeClass('invalid').addClass('valid');
		} else {
			$('#space').removeClass('valid').addClass('invalid');
		}*/

		//validate the equal
		if ( pswd == confirm ) {            
			$('#equal').removeClass('invalid').addClass('valid');
		} else {
			$('#equal').removeClass('valid').addClass('invalid');
		}
		
	}).focus(function() {
		$('#pswd_info').show();
	}).blur(function() {
		//$('#pswd_info').hide();
	});

    $('input[id=confirm]').keyup(function() {
		var pswd = $('#password').val();
        var confirm = $(this).val();
		
		//validate the equal
		if ( pswd == confirm ) {            
			$('#equal').removeClass('invalid').addClass('valid');
		} else {
			$('#equal').removeClass('valid').addClass('invalid');
		}
				
	}).focus(function() {
		$('#cfrm_info').show();
	}).blur(function() {
		//$('#cfrm_info').hide();
	});	

	$('input[id=email]').keyup(function() {
		var mail = $(this).val();
		
		//validate mailaddress
		if ( mail.match(/^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/) ) {
			$('#mailaddress').removeClass('invalid').addClass('valid');
		} else {
			$('#mailaddress').removeClass('valid').addClass('invalid');
		}
		
	}).focus(function() {
		$('#mail_info').show();
	}).blur(function() {
		//$('#mail_info').hide();
	});

	$('input[id=name]').keyup(function() {
		var name = $(this).val();
		
		//validate name
		if ( name.match(/^[가-힣]{2,4}$/) ) {
			$('#validname').removeClass('invalid').addClass('valid');
		} else {
			$('#validname').removeClass('valid').addClass('invalid');
		}
		
	}).focus(function() {
		$('#name_info').show();
	}).blur(function() {
		//$('#mail_info').hide();
	});


	$('input[id=phone]').keyup(function() {
		var phone = $(this).val();
		
		//validate phone
		if ( phone.match( /^([0-9]{2,3})-([0-9]{3,4})-([0-9]{4})$/ ) ) {
			$('#phonenum').removeClass('invalid').addClass('valid');
		} else {
			$('#phonenum').removeClass('valid').addClass('invalid');
		}
		
	}).focus(function() {
		$('#phone_info').show();
	}).blur(function() {
		//$('#phone_info').hide();
	});

	$('input[id=address]').keyup(function() {
		this.val('');
	});

});

function validateForm()
{
   	if($('#id_duplicate').attr("class") == 'invalid' ||
		$('#id_valid').attr("class") == 'invalid' ||
	   	$('#id_length').attr("class") == 'invalid')
	{		
		alert("아이디를 다시 입력하세요");
		$('#userid').val('');
		$('#userid').focus();
		$('#userid').keyup();
		return false;
	}
	if($('#length').attr("class") == 'invalid' ||
		$('#pw_valid').attr("class") == 'invalid'||
		$('#number').attr("class") == 'invalid')
	{		
		alert("비밀번호를 다시 입력하세요");
		$('#password').val('');
		$('#password').focus();
		$('#password').keyup();
		return false;
	}
	if($('#equal').attr("class") == 'invalid')
	{		
		alert("비밀번호를 다시 확인하세요");
		$('#confirm').val('');
		$('#confirm').focus();
		$('#confirm').keyup();
		return false;
	}	
	if($('#mailaddress').attr("class") == 'invalid')
	{		
		alert("이메일을 다시 입력하세요");
		$('#email').val('');
		$('#email').focus();
		$('#email').keyup();
		return false;
	}	
	if($('#validname').attr("class") == 'invalid')
	{		
		alert("이름을 다시 입력하세요");
		$('#name').val('');
		$('#name').focus();
		$('#name').keyup();
		return false;
	}
	if($('#phonenum').attr("class") == 'invalid')
	{		
		alert("전화번호를 다시 입력하세요");
		$('#phone').val('');
		$('#phone').focus();
		$('#phone').keyup();
		return false;
	}
	 
	if($('#address').val() == '')
	{
		alert("주소를 입력하세요");
		return false;
	}
	
	$('#submit').text("회원 가입 중...");
	$('#submit').prop('disabled', true);
	return true;
}
</script>

<script>
// 회원가입 시 아이디 중복체크 기능
function idCheck(str) 
{
	re = /^\w+$/;
	
	if (window.XMLHttpRequest) 
	{
		// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	} 
	else
	{  // code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttp.onreadystatechange = 
	function()
	{
		if (this.readyState == 4 && this.status == 200) 
		{
			// document.getElementById("id_check").innerHTML=this.responseText;
			//id_duplicate userid
			if ( this.responseText == "OK" ) {
				$('#id_duplicate').removeClass('invalid').addClass('valid');
			} else {
				$('#id_duplicate').removeClass('valid').addClass('invalid');
			}
		}
	}

	xmlhttp.open("GET","idcheck.jsp?userid="+str, true);
	xmlhttp.send();
}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/SE/js/address.js"></script>

<%@include file="/common/footer.jsp"%>