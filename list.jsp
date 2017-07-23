<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/pages/include/include.Taglib.jsp"%>
<html>
<head>
<title></title>
<s:include value="/WEB-INF/pages/include/include.Scripts.jsp" />
<script type="text/javascript" src="<s:url value="/jquery/jquery.alphanumeric.js"/>"></script>
<script type="text/javascript" src="<s:url value="/ddscPlugin/ddsc.gridList.plugin.js"/>"></script>
<script type="text/javascript" src="<s:url value="/ddscPlugin/ddsc.popupWindow.plugin.js"/>"></script>	
<script type="text/javascript" src="<s:url value="/js/ddsc.input.js"/>"></script>
<script language="javascript">
function getParameter() {
	var param = "labItemMst.itemId=" + $("#tblGrid").getSelectedRow().find('td').eq(2).text();
	return param;
}
function onCheckbox(){
	var index = $("#checkboxId input").length;
	var bool = false;
	for(var i=0;i<index;i++){
		if($("#itemStatus"+i).prop("checked") == true){
			bool=true;
		}
	}
	if(!bool){
		for(var i=0;i<index;i++){
			$("#itemStatus"+i).prop("checked", true);
		}
	}
}


$(document).ready(function() {
	$("#tblGrid").initGrid({lines:3});
	$('#tb').initPopupWindow({dailogWidth:'960', dailogHeight:'640'});
	onCheckbox();
});
</script>
</head>
<body> 
<s:form id="frm01002K" theme="simple" action="%{progAction}" >
	<div class="progTitle">
  		<s:include value="/WEB-INF/pages/include/include.Title.jsp" />
	</div>
	<div id="tb">
		<fieldset id="listFieldset">
		<table width="100%" border="0" cellpadding="2" cellspacing="0">
			<tr class="trBgOdd">
				<td width="20%" class="colNameAlign">&nbsp;<s:text name="itemId"/>：</td>
				<td width="30%"><s:textfield name="labItemMst.itemId" cssClass="enKey" maxlength="32" size="16"/></td>
				<td width="20%" class="colNameAlign">&nbsp;<s:text name="itemName"/>：</td>
				<td width="30%"><s:textfield name="labItemMst.itemName" maxlength="32" size="32"/></td>
			</tr>
			<tr class="trBgEven">
				<td width="20%" class="colNameAlign">&nbsp;<s:text name="suppId"/>：</td>
				<td width="30%"><s:textfield name="labItemMst.labSuppMst.suppId" cssClass="enKey" maxlength="32" size="16"/></td>
				<td width="20%" class="colNameAlign">&nbsp;<s:text name="itemStatus"/>：</td>
				<td width="30%">
				<span id="checkboxId">
					<input type="checkbox" id="itemStatus0" name="itemStatus[0]" value="0" <s:if test="itemStatus[0] == \"0\"">checked</s:if> /><s:text name="itemStatus.0" />
					<input type="checkbox" id="itemStatus1" name="itemStatus[1]" value="1" <s:if test="itemStatus[1] == \"1\"">checked</s:if> /><s:text name="itemStatus.1" />				
				</span>
				</td>
			</tr>
		</table>
		<!-- 按鍵組合 --><s:include value="/WEB-INF/pages/include/include.ListButton.jsp" /><!-- 按鍵組合 --> 
		</fieldset>
		<table id="tblGrid" class ="labSuppMstList" width="100%" border="0" cellpadding="2" cellspacing="1">
			<thead>
				<tr align="center" bgcolor="#e3e3e3">
					<th width="3%"><s:text name="fix.00164" /></th>
					<th width="10%"><s:text name="fix.00090" /></th>
					<th width="12%"><s:text name="itemId" /></th>   
					<th width="12%"><s:text name="itemName" /></th> 
					<th width="12%"><s:text name="itemPrice" /></th>	
					<th width="12%"><s:text name="itemPromoPrice" /></th>
					<th width="12%"><s:text name="itemStatus" /></th>
					<th width="12%"><s:text name="itemQty" /></th>
					<th><s:text name="suppId" /></th>			
				</tr>
			 </thead>
			 <tbody>
				 <s:iterator value="labItemMstList" status="status">
				 	<tr>
						<td width="3%" id="sn" align="center"><s:property value="#status.index+1" /></td>
						<!-- 表單按鍵 --> 
						<td width="10%"><s:include value="/WEB-INF/pages/include/include.actionButton.jsp" /></td>
						<!-- 表單按鍵 -->
						<td width="12%"><label><s:property value="ITEM_ID" /></label></td>
						<td width="12%"><label><s:property value="ITEM_NAME" /></label></td>
						<td width="12%"><label><s:property value="ITEM_PRICE" /></label></td>	
						<td width="12%"><label><s:property value="ITEM_PROMO_PRICE" /></label></td>
						<td width="12%">
							<label>
								<s:if test="ITEM_STATUS == \"0\""><s:text name="itemStatus.0" /></s:if>
								<s:elseif test="ITEM_STATUS == \"1\""><s:text name="itemStatus.1" /></s:elseif>
							</label>
						</td>
						<td width="12%"><label><s:property value="ITEM_QTY" /></label></td>
						<td><label><s:property value="SUPP_ID" /></label></td>
					</tr>
				 </s:iterator>
			 </tbody>
		</table>
	</div>
	<!-- 分頁按鍵列 --><s:include value="/WEB-INF/pages/include/include.PaginationBar.jsp" /><!-- 分頁按鍵列 -->
</s:form>
</body>
</html>