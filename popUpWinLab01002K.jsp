<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/include/include.Taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<base target="_self" />
<s:include value="/WEB-INF/pages/include/include.Scripts.jsp" />
<script type="text/javascript" src="<s:url value="/ddscPlugin/ddsc.gridList.plugin.js"/>"></script>
<script type="text/javascript" src="<s:url value="/jquery/jquery.alphanumeric.js"/>"></script>
<script type="text/javascript" src="<s:url value="/js/ddsc.input.js"/>"></script>
<script language="javascript">
var popUpParam = window.dialogArguments;
function returnObj() {
	var obj = new Object(); 
	obj.itemId = $("#tblGrid").getSelectedRow().find('td').eq(1).attr('lang');
	obj.itemName = $("#tblGrid").getSelectedRow().find('td').eq(2).attr('lang');
	obj.itemPrice = $("#tblGrid").getSelectedRow().find('td').eq(3).attr('lang');
	obj.itemPromoPrice = $("#tblGrid").getSelectedRow().find('td').eq(4).attr('lang');
	obj.itemQty = $("#tblGrid").getSelectedRow().find('td').eq(5).attr('lang');
	
	window.returnValue = obj;
	window.close();
}
$(document).ready(function() {
	$('#tblGrid').initGrid({"height": "305", doubleClick: returnObj});
});
</script>
</head>
<body>
<s:form id="rume" theme="simple" action="%{progAction}">	
	<div class="progTitle">
  		<s:include value="/WEB-INF/pages/include/include.Title.jsp" />
	</div>
	<div id="tb">
		<fieldset style="-moz-border-radius:8px;">
		<table width="100%" border="0" cellpadding="2" cellspacing="0">
			<tr class="trBgOdd">
				<td width="20%" align="right">&nbsp;<s:text name="itemId"/>：</td>
				<td width="30%">
					<s:textfield name="itemId" size="12" maxlength="16"/>
				</td>
				<td width="20%" align="right">&nbsp;<s:text name="itemName"/>：</td>
				<td width="30%">
					<s:textfield name="itemName" size="12" maxlength="16"/>
				</td>
			</tr>
		</table>
		<!-- 按鍵組合 --><s:include value="/WEB-INF/pages/include/include.popUpButton.jsp" /><!-- 按鍵組合 --> 
		</fieldset>
		<table id="tblGrid" width="100%" border="0" cellpadding="2" cellspacing="1" >
			<thead>
				<tr align="center" bgcolor="#e3e3e3">
					<th width="5%"><s:text name="fix.00164" /></th>
					<th width="20%"><s:text name="itemId" /></th>
					<th width="25%"><s:text name="itemName" /></th>
					<th width="15%"><s:text name="itemPrice" /></th>
					<th width="15%"><s:text name="itemPromoPrice" /></th>
					<th><s:text name="itemQty" /></th>
					<th style="display:none"></th>
				</tr>
			 </thead>
			 <tbody>
				 <s:iterator value="labItemMstList" status="status">
					<tr>
						<td id="sn" width="5%" align="center"><s:property value="#status.index+1" /></td>
						<td width="20%" lang="<s:property value="ITEM_ID"/>">
							<s:label>
								<s:property value="ITEM_ID" />
							</s:label>
						</td>
						<td width="25%" lang="<s:property value="ITEM_NAME"/>">
							<s:label>
								<s:property value="ITEM_NAME" />
							</s:label>
						</td>
						<td width="15%" lang="<s:property value="ITEM_PRICE"/>">
							<s:label>
								<s:property value="ITEM_PRICE" />
							</s:label>
						</td>
						<td width="15%" lang="<s:property value="ITEM_PROMO_PRICE"/>">
							<s:label>
								<s:property value="ITEM_PROMO_PRICE" />
							</s:label>
						</td>
						<td lang="<s:property value="ITEM_QTY"/>">
							<s:label>
								<s:property value="ITEM_QTY" />
							</s:label>
						</td>
						<td style="display:none"></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<!-- 分頁按鍵列 --><s:include value="/WEB-INF/pages/include/include.PaginationBar.jsp" /><!-- 分頁按鍵列 -->
</s:form>
</body>
</html>