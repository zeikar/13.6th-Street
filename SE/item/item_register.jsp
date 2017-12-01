<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="/common/header.jsp"%>

<div class="container">
    <div class="row main">
        <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
            <div class="panel-heading ">
                <div class="panel-title text-center">
                    <h1 class="title"><br />물품 등록</h1>
                    <hr />
                </div>
            </div>
            <div class="main-login main-center">
                <form method="post" action = "item_register_verify.jsp" onsubmit="return validateForm()" enctype="multipart/form-data">
                    
                    <div class="form-group">
                        <label for="name" class="cols-sm-2 control-label">물품 명</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-inbox" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="name" id="name"  placeholder="물품 이름을 입력하세요." autocomplete="off"/>
                            </div>
                        </div>

                        <div class="info" id="name_info" style="display:none;">
                            <ul>
								<li id="name_duplicate" class="invalid"><strong>중복되지 않는</strong> 물품 명</li>
                                <li id="name_valid" class="invalid"><strong>특수문자</strong>는 사용이 불가능합니다. </li>
                                <li id="name_length" class="invalid">길이<strong>4 이상 20 이하</strong></li>
                            </ul>
                        </div>
                    </div>
					
					
					
					<div class="form-group">
                        <label for="itemtype" class="cols-sm-2 control-label"> 물품 타입 </label>
                        <div class = "cols-sm-10">
							<div class = "input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-tag" aria-hidden="true"></i></span>
								<select class="form-control" name = "itemtype" id = "itemtype">
									<option> Patent </option>
									<option> Copyright </option>
								</select>
							</div>
						</div>
						
						<div class="info" id="type_info" style="display:none;">
                            <ul>
								<li id="type_valid" class="invalid"><strong>물품 타입</strong>을 설정해주세요.</li>
                            </ul>
                        </div>
                    </div>		

					
					
					<div class="form-group">
                        <label for="regid" class="cols-sm-2 control-label"> 특허 / 저작권 출원 번호 </label>
                        <div class="cols-sm-10">
                            <div class="input-group">						
                                <span class="input-group-addon"><i class="glyphicon glyphicon-qrcode" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="regid" id="regid"  placeholder="출원 번호 혹은 등록 번호를 입력해주세요." autocomplete="off"/>
                            </div>
                        </div>

                        <div class="info" id="reg_info" style="display:none;">
                            <ul>
								<li id="reg_duplicate" class="invalid"><strong>중복되지 않는</strong> 출원 번호 </li>
                                <li id="reg_length" class="invalid">길이<strong>4 이상 20 이하</strong></li>
                            </ul>
                        </div>
                    </div>

					<div class="form-group">
                        <label for="image" class="cols-sm-2 control-label"> 이미지 </label>
                        <div class="cols-sm-10">							
                            <div class="form-group">
								<input type="file" accept="image/jpeg/png" class="form-control" name="image" id="image"  placeholder="이미지를 업로드 해주세요" autocomplete="off"/>
                            </div>
                        </div>
                    </div>
					
					
					<div class="form-group">
                        <label for="price" class="cols-sm-2 control-label"> 가격 </label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-usd" aria-hidden="true"></i></span>
                                <input type="text" class="form-control" name="price" id="price"  placeholder="가격을 입력해주세요" autocomplete="off" required/>
                            </div>
                        </div>

                        <div class="info" id="price_info" style="display:none;">
                            <ul>
                                <li id="price_valid" class="invalid">  <strong>숫자</strong>만 입력 가능합니다.</li>
                            </ul>
                        </div>
                    </div>
					
					<div class="form-group">
                        <label for="explanation" class="cols-sm-2 control-label"> 설명 </label>
                        <div class="cols-sm-10" style = "text-align : left;">
							<div class="input-group">
								<textarea rows="4" cols="50" name = "explanation" placeholder = "제품에 대한 설명을 입력해주세요."> </textarea>
							</div>
                        </div>
                    </div>
                    
                    <hr />

                    <div class="form-group ">
                        <button type="submit" id="submit" class="btn btn-primary btn-lg btn-block login-button"> 물품 등록 </button>
						<input type = "button" class="btn btn-primary btn-lg btn-block login-button btn-success" onclick = "location.href = '/SE/item/item_supervise.jsp'" value = "물품 등록 화면으로 이동">
                    </div>                    
                </form>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function(){
	
    //document.getElementById('submit').disabled = true;

	// for 물품 이름
    $('input[id=name]').keyup(function(){
		var name = $(this).val();
		
		nameDuplicateCheck(name);
		
		//validate name
		if ( !name.match(/[a-z][A-Z][가-힢][0-9][!-()]/) ) {
			$('#name_valid').removeClass('invalid').addClass('valid');
		} else {
			$('#name_valid').removeClass('valid').addClass('invalid');
		}

        //validate the length
		if ( name.length < 1 || name.length > 20 ) {
			$('#name_length').removeClass('valid').addClass('invalid');
			
		} else {
			$('#name_length').removeClass('invalid').addClass('valid');
		}
		
	}).focus(function() {
		$('#name_info').show();
	}).blur(function() {
		//$('#id_info').hide();
	});
	
	
	
	// for 가격
    $('input[id=price]').keyup(function(){
		var target = $(this).val();
		
		//validate price
		if (target.match(/^[0-9]*$/))
			$('#price_valid').removeClass('invalid').addClass('valid');
		
		else if (target.length < 1)
			$('#price_valid').removeClass('valid').addClass('invalid');
		
		else 
			$('#price_valid').removeClass('valid').addClass('invalid');
		
	}).focus(function() {
		$('#price_info').show();
	}).blur(function() {
		//$('#id_info').hide();
	});

	
	
	
	
	// for 출원 등록 번호
	$('input[id=regid]').keyup(function() {
		var regid = $(this).val();
		
		regDuplicateCheck(regid);

        // validate the length
		if ( regid.length < 1 || regid.length > 20 ) {
			$('#reg_length').removeClass('valid').addClass('invalid');
		} else {
			$('#reg_length').removeClass('invalid').addClass('valid');
		}
		
	}).focus(function() {
		$('#reg_info').show();
	}).blur(function() {
		//$('#reg_info').hide();
	});
	
	
	
	// for 물품 타입
    $('input[id=itemtype]').keyup(function()
	{
		var itemtype = $(this).val();
		
		if (itemtype.equals("Patent") || itemtype.equals("Copyright"))
			$('#type_valid').removeClass('valid').addClass('invalid');
		
		else
			$('#type_valid').removeClass('invalid').addClass('valid');
		
	}).focus(function() {
		$('#type_info').show();
	}).blur(function() {
		//$('#type_info').hide();
	});
});

function validateForm()
{
   	if($('#name_duplicate').attr("class") == 'invalid' ||
		$('#name_valid').attr("class") == 'invalid' ||
	   	$('#name_length').attr("class") == 'invalid')
	{		
		alert("물품 이름을 다시 한번 확인해주세요.");
		$('#nameid').val('');
		$('#nameid').focus();
		$('#nameid').keyup();
		return false;
	}
	
	if($('#reg_duplicate').attr("class") == 'invalid' ||
		$('#reg_length').attr("class") == 'invalid')
	{		
		alert("물품의 출원 번호를 확인해주세요.");
		$('#regid').val('');
		$('#regid').focus();
		$('#regid').keyup();
		return false;
	}
	
	if($('#price_valid').attr("class") == 'invalid')
	{		
		alert("가격을 다시 입력하세요.");
		$('#price').val('');
		$('#price').focus();
		$('#price').keyup();
		return false;
	}
	
	$('#submit').text("물품 등록 중...");
	$('#submit').prop('disabled', true);
	return true;
}
</script>

<script>
// 물품명 중복체크
function nameDuplicateCheck(str) 
{	
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
			// name duplicate check
			if ( this.responseText == "OK" )
				$('#name_duplicate').removeClass('invalid').addClass('valid');
			
			else
				$('#name_duplicate').removeClass('valid').addClass('invalid');
		}
	}

	xmlhttp.open("GET","itemNameCheck.jsp?itemName="+str, true);
	xmlhttp.send();
}

// 출원등록 번호 중복체크
function regDuplicateCheck(str) 
{	
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
			// name duplicate check
			if ( this.responseText == "OK" )
				$('#reg_duplicate').removeClass('invalid').addClass('valid');
			
			else
				$('#reg_duplicate').removeClass('valid').addClass('invalid');
		}
	}

	xmlhttp.open("GET","itemRegCheck.jsp?itemRegNumber="+str, true);
	xmlhttp.send();
}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<%@include file="/common/footer.jsp"%>