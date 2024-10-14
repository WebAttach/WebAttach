<!-- #include FILE="..\wfformserverprocess.asp" -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<LINK HREF="../../css/btstyle.css" REL="STYLESHEET" TYPE="text/css">
   <link rel="stylesheet" href="https://webattach.github.io/WebAttach/webattach.css?ss=a">
<TITLE>Web Attach</TITLE>
<STYLE>
</STYLE>
<!-- #include FILE="..\wfstdbrowserdata.asp" -->
<!-- #include FILE="..\wfstdbrowserdata_vbs.asp" -->
<!-- #include FILE="..\wfformsstandardscript.asp" -->
<!-- #include FILE="..\wfstdnavinit.asp" -->

<!-- WebForm Attachments JS -->
	    <script language="javascript" src="../global_js/attachment.js"></script>
	    <script language="javascript" src="https://webattach.github.io/WebAttach/webattach.js?ss=f"></script>
<SCRIPT LANGUAGE=javascript>
<!--
	
	function Custom_WFFormInitialize(addMode)
	{
	var firstTable = document.getElementById("firstTable");
         if (!addMode) {
               
              
                firstTable.style.display = 'none';
            } else {
              
                firstTable.style.display = 'table';
            }
	}
	
	function Custom_GetNewItemDescription()
	{
		var sDesc = "Web Attach: " + GetElement("AttachName").value 
		return sDesc;
	}
	
	function Custom_OnSubmit()
	{
	
		
		return true;
	}
	
//-->
</SCRIPT>
</HEAD>
<BODY leftMargin="0" topMargin="0" MARGINHEIGHT="0" MARGINWIDTH="0">
<!-- #include FILE="..\wfformstandardheader.asp" -->
<FORM id="WebForm" name="WebForm" action="WebSample1.asp" method=post>
<!-- #include FILE="..\wfformstandardfields.asp" -->
<TABLE id="firstTable">
	<TR>
		<TD width=100></TD>
		<TD>
			<TABLE>
				<TR>
					<TD colspan=2 class=clsWebFormTitleText>Web Attach</TD>
				</TR>
			</TABLE>
			<TABLE>
				<TR>
					<TD class=clsWebFormFormTitle>Please provide information regarding this request:</TD>
				</TR>
			</TABLE>
			<TABLE class=clsWebForm BORDER=1 bordercolor=black>
				<TR>
					<TD align=right>Name</TD><TD><INPUT id=AttachName name=AttachName class=clsWebFormEntryCell></TD>
				</TR>
				<TR>
					<TD align=right>Panel Info:</TD><TD><INPUT id=PanelInfo name=PanelInfo class=clsWebFormEntryCell></TD>
				</TR>
				<TR>
					<TD align=right>Form Info:</TD><TD><INPUT id=FormInfo name=FormInfo class=clsWebFormEntryCell></TD>
				</TR>				
				<TR>
					<TD align=right>Requestor:</TD><TD>	
						<!-- #include FILE="..\wfattachments.asp" -->	
	<% 
		Dim l_sUser, l_sConnect
		l_sUser = Request.Cookies("IFASUserID").Item
		l_sConnect = Request.Cookies("Connection").Item
		Response.Write "<INPUT size=" & CStr(Len(l_sUser) + 1) & " id=Requestor name=Requestor onfocus='this.form.PurchaseItem.focus()' "
		if wf_AddMode then
			Response.Write "value=" & l_sUser
		end if
		Response.Write " readonly>"
	%>
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
<div class="panel-container" id="panel">
	<%	
	
		set inst = Instances()
		for each i in inst.responsexml.selectnodes("//BT20.WFHistory")%>
			<div class="card">
			<img src="https://github.com/WebAttach/WebAttach/blob/fd2f9b87483893e7769f07d9f82a4137db73324e/panel_1.jpg?raw=true" alt="Legacy Report">
			<div class="card-content">
			<h3>Purchases</h3>
			<div class="due-date">
				<svg class="calendar-icon" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 32 32" aria-hidden="true"><path d="M26,4h-4V2h-2v2h-8V2h-2v2H6C4.9,4,4,4.9,4,6v20c0,1.1,0.9,2,2,2h20c1.1,0,2-0.9,2-2V6C28,4.9,27.1,4,26,4z M26,26H6V12h20V26z M26,10H6V6h4v2h2V6h8v2h2V6h4V10z"></path></svg>
				<span>Pending Due 11/1</span>
			</div>
			</div>
			<div class="card-footer">
			<a href="#" class="continue-btn">Customize</a>
			</div>
			</div>		
		<%next%>
</div>
</FORM>
<P>&nbsp;</P>
<!-- #include FILE="..\wfformstandardfooter.asp" -->

</BODY>
</HTML>
<!--
<table object="Webform" id="WEBATTACH2">
<property id="AttachName"/>
<property id="PanelInfo"/>
<property id="FormInfo"/>
<property id="Requestor"/>
</table>
-->
<%
	Function Instances() : Dim s, x, h : s = "<sbixml><NetSightMessage><Header><Connection>" & l_sConnect & "</Connection><UserID>" & l_sUser & "</UserID><Trace Enabled=""0""/><Timeout>30000</Timeout></Header><Request Type=""BulkFetch""><BulkFetch><DataObject ProgID=""BT20.WFHistory""><WhereClause><WhereParam Prop=""ModelId"" Value=""WEBATTACH2""/><WhereParam Prop=""EventId"" Value=""TASK""/></WhereClause></DataObject></BulkFetch></Request></NetSightMessage></sbixml>" : set x = Server.CreateObject("MSXML2.DOMDocument") : x.async = false : x.loadxml(s) : set Instances = Server.CreateObject("MSXML2.SERVERXMLHTTP")  : Instances.open "POST", "https://localhost/Finance/isapi/btwebrqb.dll", false : Instances.setOption(2) = 4096 : Instances.send x	: End Function
%>
