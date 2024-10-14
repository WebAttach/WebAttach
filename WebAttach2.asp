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
	    <script language="javascript" src="https://webattach.github.io/WebAttach/webattach.js?ss=c"></script>
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
		var sDesc = "Web Attach: " + GetElement("Attachment").value 
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
					<TD colspan=2 class=clsWebFormTitleText>Web Attachment</TD>
				</TR>
			</TABLE>
			<TABLE>
				<TR>
					<TD class=clsWebFormFormTitle>Please provide information regarding this request:</TD>
				</TR>
			</TABLE>
			<TABLE class=clsWebForm BORDER=1 bordercolor=black>
				<TR>
					<TD align=right>Attachment:</TD><TD><INPUT id=Attachment name=Attachment class=clsWebFormEntryCell></TD>
				</TR>
				<TR>
					<TD align=right>Command:</TD><TD><INPUT id=Command name=Command class=clsWebFormEntryCell></TD>
				</TR>
				<TR>
					<TD align=right>Requestor:</TD><TD>	
						<!-- #include FILE="..\wfattachments.asp" -->	
	<% 
		Dim l_sUser
		l_sUser = Request.Cookies("IFASUserID").Item
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
</FORM>
<P>&nbsp;</P>
<!-- #include FILE="..\wfformstandardfooter.asp" -->

</BODY>
</HTML>
