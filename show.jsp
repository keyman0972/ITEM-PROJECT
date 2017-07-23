<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/pages/include/include.Taglib.jsp"%>
<html>
<head>
<title></title>
<base target="_self" />
<s:include value="/WEB-INF/pages/include/include.Scripts.jsp" />
</head>
<body>
<s:form method="post" theme="simple" action="%{progAction}" >
<s:hidden name="labItemMst.ver" />
	<div class="progTitle">
		<s:include value="/WEB-INF/pages/include/include.ShowTitle.jsp" />
	</div>
	<div id="tb">
	<div>
		<table width="100%" border="0" cellpadding="4" cellspacing="0">
			<tr class="trBgOdd">
				<td width="20%" class="colNameAlign required">*<s:text name="itemId"/>：</td>
				<td width="30%">
					<s:property value="labItemMst.itemId"/>
				</td>					
				<td width="20%" class="colNameAlign required">*<s:text name="itemName"/>：</td>		
				<td width="30%">
					<s:property value="labItemMst.itemName"/>
				</td>
			</tr>
			<tr class="trBgEven">
				<td width="20%" class="colNameAlign  required">*<s:text name="itemPrice"/>：</td>
				<td width="30%">
					<s:property value="labItemMst.itemPrice"/>
				</td>
				<td width="20%" class="colNameAlign">&nbsp;<s:text name="itemPromoPrice"/>：</td>
				<td width="30%">
					<s:property value="labItemMst.itemPromoPrice"/>
				</td>
			</tr>
			<tr class="trBgOdd">
				<td width="20%" class="colNameAlign required">*<s:text name="itemQty"/>：</td>
				<td width="30%">
					<s:property value="labItemMst.itemQty"/>
				</td>
				<td width="20%" class="colNameAlign required">*<s:text name="itemStatus"/>：</td>
				<td width="30%">
					<input type="radio" id="itemStatus1" name="itemStatus" value="%{labItemMst.itemStatus}" disabled <s:if test='labItemMst.itemStatus =="0"'>checked</s:if> /><s:text name="itemStatus.0" />
					<input type="radio" id="itemStatus2" name="itemStatus" value="%{labItemMst.itemStatus}" disabled <s:if test='labItemMst.itemStatus =="1"'>checked</s:if> /><s:text name="itemStatus.1" />
				</td>
			</tr>
			<tr class="trBgEven">
				<td width="20%" class="colNameAlign required">*<s:text name="labItemMst.suppId"/>：</td>
				<td width="30%">
					<s:property value="labItemMst.labSuppMst.suppId"/>
				</td>
			</tr>
		</table>
	</div>
	</div>
	<br>
	<!-- 按鍵組合 --> 
	<s:include value="/WEB-INF/pages/include/include.ShowButton.jsp" />
	<!-- 按鍵組合 -->
</s:form>
</body>
</html>