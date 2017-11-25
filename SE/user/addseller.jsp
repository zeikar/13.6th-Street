<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/user/admincheck.jsp"%>
<%@include file="/common/header.jsp"%>

<div class="container">
    <div class="row">
        <h2>판매자 등록 승인</h2>
        <hr />
        <div class="table-responsive">
            <form class="form-inline" name="admin_user" action="" method="post">
		    	<table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" name="select-all" id="select-all" /> 전체 선택
                            </th>
                            <th>No.</th>
                            <th>사용자 ID</th>
                            <th>이름</th>
                            <th>등록 신청일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>                                
                                <label><input type="checkbox" name="permit" /> 판매자 등록 승인</label>
                            </td>
                            <td> 12 </td>
                            <td> WA2000 </td>
                            <td> 와쨩!</td>
                            <td> <a href="#stay_here" data-placement="right" data-toggle="tooltip" title="2017년 11월 16일 17시 08분 12초">1주 전</a> </td>
                        </tr> 
                        <tr>
                            <td>
                                <label><input type="checkbox" name="permit" /> 판매자 등록 승인</label>
                            </td>
                            <td> 3 </td>
                            <td> UMP45 </td>
                            <td> 움뀨 >,<</td>
                            <td> <a href="#stay_here" data-placement="right" data-toggle="tooltip" title="2017년 11월 16일 17시 08분 12초">1주 전</a> </td>
                        </tr> 
                    </tbody>
                </table>
                <hr />
                <input type="submit" class="btn btn-success" value="선택한 판매자 승인" />
                <input type="reset" class="btn btn-default" />
            </form>
        </div>
    </div>
</div>

<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});

// Listen for click on toggle checkbox
$('#select-all').click(function(event) {  
    var all = this.checked;

    // Iterate each checkbox
    $(':checkbox').each(function() {
        this.checked = all;
    });
});
</script>

<%@include file="/common/footer.jsp"%>