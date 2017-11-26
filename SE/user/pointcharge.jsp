<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/logincheck.jsp"%>
<%@include file="/common/header.jsp"%>

<%
    String name = UserAccountController.getUserName(userId);
    int point = UserAccountController.getUserPoint(userId);
    String creditCardNumber = UserAccountController.getUserCreditCardNumber(userId);
    if(creditCardNumber.equals("null"))
    {
        creditCardNumber = "";
    }
    String bankAccountNumber = UserAccountController.getUserBankAccountNumber(userId);
    if(bankAccountNumber.equals("null"))
    {
        bankAccountNumber = "";
    }
%>

<div class="container">
    <div class="row">
        <h2>포인트 충전</h2>

        <%
        if(request.getParameter("success") != null)
        {
        %>
        <div class="alert alert-success alert-dismissable fade in">
            <strong>포인트 충전 성공!</strong> 저희 13.6th Street를 이용해 주셔서 감사합니다.
        </div>
        <%
        }
        %>
        <%
        if(request.getParameter("error") != null)
        {
        %>
        <div class="alert alert-danger alert-dismissable fade in">
            <strong>포인트 충전에 실패하였습니다.</strong> 다시 한 번 확인해 주시기 바랍니다.
        </div>
        <%
        }
        %>
        
        <hr />

        <div class="panel panel-default">
            <div class="panel-heading"><%=name%> 님이 소유 중인 포인트</div>
            <div class="panel-body"><%=point%></div>
        </div>

        <hr />

        <form method="post" action="pointchargeproc.jsp"
                 onsubmit="return validateForm()">

            <div class="panel panel-default">
                <div class="panel-heading">충전할 포인트 금액과 결제 수단 및 번호를 입력해 주세요</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="point">포인트 금액</label>
                        <input type="number" min="1" class="form-control" name="point" id="point"  placeholder="포인트 입력" onKeyUp="isOKtoPay()" onChange="isOKtoPay()"/>
                    </div>
                    <div class="form-group">
                        <label for="refund_number">결제 수단</label>
                        <div class="radio">
                            <label><input type="radio" value="credit_card" id="credit_card" name="radio" onclick="radioSelected(this.value)" >카드 결제</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" value="bank_account" id="bank_account" name="radio" onclick="radioSelected(this.value)" >통장 결제</label>
                        </div>
                    </div>
                     <div class="form-group">
                        <label for="pay_number">카드 번호 혹은 통장 번호</label>
                        <input type="text" class="form-control" name="pay_number" id="pay_number" placeholder="카드 혹은 통장 결제를 선택하세요" onKeyUp="isOKtoPay()" onChange="isOKtoPay()" disabled/>
                    </div>                      
                </div>
            </div>

            <!-- Trigger the modal with a button -->
            <button type="button" id="pay_btn" disabled="disabled" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" OnClick="generatePayMessage()">결제</button>



            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">결제 확인</h4>
                        </div>
                        <div class="modal-body">
                            <p><%=name%> 님이 요청하신 결제 내역은 다음과 같습니다.</p>
                            <p> 결제 포인트 : <span id="point_msg"></span></p>
                            <p> 결제 수단 : <span id="pay_msg"></span></p>
                            <p> <span id="card_or_account_msg"></span></p>
                        </div>
                        <div class="modal-footer">   
                            <p>정말로 결제하시겠습니까?</p>
                            <button type="submit" id="submit" class="btn btn-success">결제</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script>

function radioSelected(val)
{
    if(val == "credit_card")
    {
        $('#pay_number').val("<%=creditCardNumber%>");
        $('#pay_number').attr("placeholder", "카드 번호를 입력하세요 (- 제외)");
    }
    else
    {
        $('#pay_number').val("<%=bankAccountNumber%>");
        $('#pay_number').attr("placeholder", "통장 계좌번호를 입력하세요 (- 제외)");
    }

    $("input").prop('disabled', false);

    isOKtoPay();
}

function isOKtoPay()
{
    var point = $('#point').val();
    var pay_number = $('#pay_number').val();

    point = point.replace(/^0+/, '');
    if(point == "" ||
        !point.match(/^[0-9]+$/))
    {
        $('#pay_btn').attr("disabled", "disabled");
        return;
    }

    if(pay_number == "" ||
        !pay_number.match(/^[0-9]+$/))
    {
        $('#pay_btn').attr("disabled", "disabled");
        return;
    }

    if($('#credit_card').is(':checked') == false && 
    $('#bank_account').is(':checked') == false)
    {
        $('#pay_btn').attr("disabled", "disabled");
        return;
    }

    $('#pay_btn').removeAttr("disabled");
}

function validateForm()
{	  
	$('#submit').text("결제 중...");
	$('#submit').prop('disabled', true);
	return true;
}

function generatePayMessage()
{    
    $('#point_msg').html($('#point').val());

    if($('#credit_card').is(':checked'))
    {
        $('#pay_msg').html('카드 결제');
        $('#card_or_account_msg').html('카드 번호 : ' + $('#pay_number').val());
    }
    else
    {
        $('#pay_msg').html('통장 결제');
        $('#card_or_account_msg').html('통장 번호 : ' + $('#pay_number').val());
    }
}

$(document).ready(function() {
  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
});

</script>

<%@include file="/common/footer.jsp"%>