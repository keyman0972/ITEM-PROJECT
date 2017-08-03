<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/pages/include/include.Taglib.jsp"%>
<html>
<head>
<title></title>
<base target="_self" />
<s:include value="/WEB-INF/pages/include/include.Scripts.jsp" />
<script type="text/javascript" src="<s:url value="/jquery/jquery.alphanumeric.js"/>"></script>
<script type="text/javascript" src="<s:url value="/ddscPlugin/ddsc.validation.plugin.js"/>"></script>
<script type="text/javascript" src="<s:url value="/jquery/ui/jquery.ui.datepicker.min.js"/>"></script>
<script type="text/javascript" src="<s:url value="/js/ddsc.input.js"/>"></script>
<script language="javascript">
function validate() {
	$("#frm01001K").validate("clearPrompt");
	$("#itemId").validateRequired({fieldText:'<s:text name="itemId" />'});
	$("#itemName").validateRequired({fieldText:'<s:text name="itemName" />'});
	$("#itemPromoPrice"). validateFromToEndNumeric ({require:false, leng:10, scale:2, 
		endField:{fieldId:'itemPrice', require:true, length:10, scale:2, fieldText:'<s:text name="itemPrice" />'},
		message:'<s:text name="eC.0031"><s:param value="getText(\"itemPromoPrice\")"/><s:param value="getText(\"itemPrice\")"/></s:text>'
	});
	$("#itemQty").validateRequired({fieldText:'<s:text name="itemQty" />'});
	$("#itemStatus0").validateRequired({fieldText:'<s:text name="itemStatus" />'});
	$("#suppId").validateRequired({fieldText:'<s:text name="suppId" />'});
	
	return $("#frm01001K").validate("showPromptWithErrors");
}

function chooseSuppId(obj) {
	var params = "prodCode=<s:property value="labItemMst.labSuppMst.suppId"/>&suppId=" + $("#suppId").val();
	var oRtn = popUpWindow({"popUpPath":"popupWindowKm","winType":"popUpWin01001K","params" : params});

	if (typeof(oRtn) != "undefined" && oRtn != null) {
		$("#suppId").val(oRtn.suppId);
		$("#suppName").html(oRtn.suppName);
	}
    return false;
}

function selectSuppName(){
	var suppId = $('#suppId').val();
	if(suppId != null){
		$.ajax({
		      type: 'post',
		      timeout: '2000',
		      url:'<s:url value="/ajax/ajaxQuery/queryDataByParams.action" />',
		      dataType:'json',
		      data:{queryName: 'findSuppMstByKey', params: '{suppId: "' + suppId + '"}'},
		      success: function(rtn_data){
		    	  if(rtn_data.results.length == 1 && rtn_data.results[0] != "" && rtn_data.results[0] != null){
					  $("#suppName").html(rtn_data.results[0][1]);			    		  
		    	  }else{
		    		  $('#suppName').html("");
		    	  }
			  },
		});
	}
}
function onRadio(){
	var index = $("#CheckOfitemStatus input").length;
	var bool = false;
	for(var i=0;i<index;i++){
		if($("#itemStatus"+i).prop("checked") == true){
			bool=true;
		}
	}
	if(!bool){
			$("#itemStatus1").prop("checked", true);

	}
}


$(document).ready(function(){
	$("#imgSuppId").bind("click", chooseSuppId);
	
	$("#suppId").bind("change", selectSuppName);
	
	onRadio();
});
</script>
</head>
<body>
<s:form id="frm01001K" method="post" theme="simple" action="%{progAction}" target="ifrConfirm">
<s:hidden name="labItemMst.ver" />
	<div class="progTitle">
		<s:include value="/WEB-INF/pages/include/include.EditTitle.jsp" />
	</div>
	<div id="tb">
	<div>
		<table width="100%" border="0" cellpadding="4" cellspacing="0" >
			<tr class="trBgOdd">
				<td width="20%" class="colNameAlign required">*<s:text name="itemId"/>：</td>
				<td width="30%">
					<s:textfield cssClass="enKey" id="itemId" name="labItemMst.itemId" value="%{labItemMst.itemId}" readonly="progAction == 'updateSubmit'" size="16" maxlength="16" cssClass="enKey"/>
				</td>					
				<td width="20%" class="colNameAlign required">*<s:text name="itemName"/>：</td>	
				<td width="30%">
					<s:textfield id="itemName" name="labItemMst.itemName" value="%{labItemMst.itemName}" size="35" maxlength="64"/>
				</td>
			</tr>
			<tr class="trBgEven">
				<td width="20%" class="colNameAlign required">*<s:text name="itemPrice"/>：</td>
				<td width="30%">
					<s:textfield id="itemPrice" name="labItemMst.itemPrice" value="%{labItemMst.itemPrice}" maxlength="12" size="20" cssClass="numeric2" />
				</td>
				<td width="20%" class="colNameAlign">:<s:text name="itemPromoPrice"/>：</td>
				<td>
					<s:textfield id="itemPromoPrice" name="labItemMst.itemPromoPrice" value="%{labItemMst.itemPromoPrice}" maxlength="12" size="20" cssClass="numeric2" />
				</td>
			</tr>
			<tr class="trBgOdd">
				<td width="20%" class="colNameAlign required">*<s:text name="itemQty"/>：</td>
				<td width="30%">
					<s:textfield id="itemQty" name="labItemMst.itemQty" value="%{labItemMst.itemQty}" maxlength="16" size="13" cssClass="numKey" />
				</td>
				<td width="20%" class="colNameAlign required">*<s:text name="itemStatus"/>：</td>
				<td width="30%">
				<span id="CheckOfitemStatus">
					<input type="radio" id="itemStatus0" name="labItemMst.itemStatus" value="0" <s:if test='labItemMst.itemStatus =="0"'>checked</s:if> /><label for="itemStatus0"><s:text name="itemStatus.0" /></label>
					<input type="radio" id="itemStatus1" name="labItemMst.itemStatus" value="1" <s:if test='labItemMst.itemStatus =="1"'>checked</s:if> /><label for="itemStatus1"><s:text name="itemStatus.1" /></label>				
				</span>
				</td>
			</tr>
			<tr class="trBgEven">
				<td width="20%" class="colNameAlign required">*<s:text name="suppId"/>：</td>
				<td width="30%">
					<s:textfield id="suppId" name="labItemMst.labSuppMst.suppId" value="%{labItemMst.labSuppMst.suppId}" maxlength="16" size="20" cssClass="enKey"/>
					<input type="image" id="imgSuppId" class="imgPopUp suppId" src="<s:url value="/image_icons/search.png"/>" />
					<s:label id="suppName" name="labItemMst.labSuppMst.suppName" />
				</td>
			</tr>
		</table>
	</div>
	</div>
	<br>
	<!-- 按鍵組合 --> 
	<s:include value="/WEB-INF/pages/include/include.EditButton.jsp" />
	<!-- 按鍵組合 --> 
</s:form>
<iframe id="ifrConfirm" name="ifrConfirm" width="100%" height="768" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="display:none; border: 0px none"></iframe>
</body>
</html>