<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/logincheck.jsp"%>
<%@include file="/common/header.jsp"%>

<div class="container">
    <div class="row main">
        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
            <div class="panel-heading ">
                <div class="panel-title text-center">
                    <h1 class="title">회원 정보 수정</h1>
                    <hr />
                </div>
            </div> 
            <div class="main-login main-center">
                <form method="post" action="edituserproc.jsp"
                 onsubmit="return validateForm()">
              
                	<div class="form-group">
                        <label for="password" class="cols-sm-2 control-label">비밀번호</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></span>
                                <input type="password" class="form-control" name="password" id="password"  placeholder="비밀번호를 수정하려면 입력하세요" autocomplete="off"/>
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
                                <input type="password" class="form-control" name="confirm" id="confirm"  placeholder="비밀번호를 수정하려면 한 번 더 입력하세요" autocomplete="off"/>
                            </div>
                        </div>

                        <div class="info" id="cfrm_info" style="display:none;">
                            <ul>
                                <li id="equal" class="invalid">비밀번호와 <strong>일치</strong></li>
                            </ul>
                        </div>
                    </div>

					<div class="form-group">
                        <label for="phone" class="cols-sm-2 control-label">전화번호</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="phone" id="phone" value="<%=UserAccountController.getUserPhoneNumber(userId)%>" placeholder="전화번호를 입력하세요 (ex. 010-0000-0000)" autocomplete="off"/>
                            </div>
                        </div>

                        <div class="info" id="phone_info" style="display:none;">
                            <ul>
                                <li id="phonenum" class="valid">정상적인 <strong>전화번호</strong></li>
                            </ul>
                        </div>
                    </div>

					<div class="form-group">
                        <label for="address" class="cols-sm-2 control-label">주소</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-road" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="address" id="address" value="<%=UserAccountController.getUserAddress(userId)%>" placeholder="주소를 입력하세요"
									 onfocus="sample3_execDaumPostcode()" onclick="sample3_execDaumPostcode()" autocomplete="off"/>
                            </div>
                        </div>
                    </div>

					<div id="wrap" class="cols-sm-10" style="display:none;border:1px solid;height:300px;margin:5px 0;position:relative">
						<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
                    
                    <hr />

                    <div class="form-group ">
                        <button type="submit" id="submit" class="btn btn-primary btn-lg btn-block login-button">회원 정보 수정</button>
                    </div>         
                </form>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function(){

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
	if($('#password').val() != "" || $('#confirm').val() != "")
	{
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

	$('#submit').text("회원 정보 수정 중...");
	$('#submit').prop('disabled', true);
	return true;
}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/SE/js/address.js"></script>

<%@include file="/common/footer.jsp"%>