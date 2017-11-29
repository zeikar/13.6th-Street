<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/logincheck.jsp"%>
<%@include file="/common/header.jsp"%>

<%
    String name = UserAccountController.getUserName(userId);
    int point = UserAccountController.getUserPoint(userId);
    String bankAccountNumber = UserAccountController.getUserBankAccountNumber(userId);
    if(bankAccountNumber.equals("null"))
    {
        bankAccountNumber = "";
    }
%>

<div class="container">
    <div class="row">
        <h2>포인트 환급</h2>

        <%
        if(request.getParameter("success") != null)
        {
        %>
        <div class="alert alert-success alert-dismissable fade in">
            <strong>포인트 환급 성공!</strong> 저희 13.6th Street를 이용해 주셔서 감사합니다.
        </div>
        <%
        }
        %>
        <%
        if(request.getParameter("error") != null)
        {
        %>
        <div class="alert alert-danger alert-dismissable fade in">
            <strong>포인트 환급에 실패하였습니다.</strong> 다시 한 번 확인해 주시기 바랍니다.
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

        <form method="post" action="pointrefundproc.jsp"
                 onsubmit="return validateForm()">

            <div class="panel panel-default">
                <div class="panel-heading">환급할 포인트 금액과 환급받을 계좌 번호를 입력해 주세요</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="point">포인트 금액</label>
                        <input type="number" min="1" max="<%=point%>" class="form-control" name="point" id="point"  placeholder="포인트 입력" onKeyUp="isOKtoRefund()" onChange="isOKtoRefund()"/>
                    </div>
                    <div class="form-group">
                        <label for="refund_number">통장 계좌 번호</label>
                        <input type="text" class="form-control" name="refund_number" id="refund_number" value="<%=bankAccountNumber%>" placeholder="환급받을 통장 계좌 번호를 입력하세요" onKeyUp="isOKtoRefund()" onChange="isOKtoRefund()"/>
                    </div>                    
                </div>
            </div>

            <!-- Trigger the modal with a button -->
            <button type="button" id="refund_btn" disabled="disabled" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" OnClick="generateRefundMessage()">환급</button>



            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">환급 확인</h4>
                        </div>
                        <div class="modal-body">
                            <p><%=name%> 님이 요청하신 환급 내역은 다음과 같습니다.</p>
                            <p> 환급 포인트 : <span id="point_msg"></span></p>
                            <p> 통장 계좌 번호 : <span id="refund_msg"></span></p>
                        </div>
                        <div class="modal-footer">   
                            <p>정말로 환급하시겠습니까?</p>
                            <button type="submit" id="submit" class="btn btn-success">환급</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script>

function isOKtoRefund()
{
    var point = $('#point').val();
    var refund_number = $('#refund_number').val();

    point = point.replace(/^0+/, '');
    if(point == "" ||
        !point.match(/^[0-9]+$/))
    {
        $('#refund_btn').attr("disabled", "disabled");
        return;
    }

    if(refund_number == "" ||
        !refund_number.match(/^[0-9]+$/))
    {
        $('#refund_btn').attr("disabled", "disabled");
        return;
    }

    $('#refund_btn').removeAttr("disabled");
}

function validateForm()
{	  
	$('#submit').text("환급 중...");
	$('#submit').prop('disabled', true);
	return true;
}

function generateRefundMessage()
{    
    $('#point_msg').html($('#point').val());
    $('#refund_msg').html($('#refund_number').val());
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

<%@include file="/common/sideMenu.jsp"%>
<%@include file="/common/footer.jsp"%>