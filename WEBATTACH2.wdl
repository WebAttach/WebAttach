<MODEL xmlns:dt="urn:schemas-microsoft-com:datatypes"><ModelData><Vendor dt:dt="string">Superion LLC</Vendor><CreateDate dt:dt="dateTime">2024-10-14T00:00:00.000</CreateDate><Description dt:dt="string">To Do</Description><Author dt:dt="string">Unknown</Author><Version dt:dt="int">1</Version><Status dt:dt="string">Active</Status><DisplayName dt:dt="string">Web Attach 2</DisplayName><Documentation dt:dt="string"></Documentation><TriggerObject dt:dt="string">WebForm</TriggerObject><TriggerEvent dt:dt="string">ACCEPT</TriggerEvent><ReEntrancy><Closed dt:dt="string">R</Closed></ReEntrancy><StartDateTime dt:dt="dateTime">1899-12-30T00:00:00.000</StartDateTime><ActivitySeed dt:dt="int">7</ActivitySeed><TransitionHwm dt:dt="int">10</TransitionHwm><WPDLVersion dt:dt="string">Version 7.04 XML Variant</WPDLVersion><DesignLocation><xPos dt:dt="int">0</xPos><yPos dt:dt="int">0</yPos></DesignLocation><Identity dt:dt="string">WEBATTACH2</Identity><AprvOrderBy dt:dt="string"></AprvOrderBy><AprvGroupBy dt:dt="string"></AprvGroupBy><URL dt:dt="string">%BASE%/workflow/custom/webattach2.asp?Key=%KEY%</URL><ExtLabel dt:dt="string">APPROVAL</ExtLabel><FilterChanges dt:dt="int">0</FilterChanges><FilterTables dt:dt="int">0</FilterTables><DataFilter dt:dt="string"></DataFilter><TableFilter dt:dt="string"></TableFilter><TriggerType dt:dt="string">FORM TRIGGERED</TriggerType><TimeOption dt:dt="string">D</TimeOption><DailyOption dt:dt="string">C</DailyOption><DailySequence dt:dt="int">1</DailySequence><WeeklySequence dt:dt="int">1</WeeklySequence><WeeklyDays dt:dt="string">NYNNNNN</WeeklyDays><MonthlyOption dt:dt="string">C</MonthlyOption><MonthlyDaySequence dt:dt="int">1</MonthlyDaySequence><MonthlyMonthSequence dt:dt="int">1</MonthlyMonthSequence><MonthlyDayType dt:dt="string">first</MonthlyDayType><MonthlyDay dt:dt="string">day</MonthlyDay><StartDate dt:dt="dateTime">2024-10-10T09:18:50.000</StartDate><EndDate dt:dt="dateTime">2050-12-31T00:00:00.000</EndDate><StartTime dt:dt="dateTime">1899-12-30T12:00:00.000</StartTime><IncludeImageLinks dt:dt="int">-1</IncludeImageLinks><JobEnabled dt:dt="int">0</JobEnabled><JobPrompts dt:dt="string"></JobPrompts><StateEnabled dt:dt="int">0</StateEnabled><StateField dt:dt="string"></StateField><Misc1 dt:dt="string"></Misc1><Misc2 dt:dt="string"></Misc2><Misc3 dt:dt="string"></Misc3><PossibleStates dt:dt="string"></PossibleStates><LimitRunningJobs dt:dt="int">0</LimitRunningJobs><WaitEnabled dt:dt="int">0</WaitEnabled><MaxJobs dt:dt="int">1</MaxJobs><WaitTime dt:dt="int">0</WaitTime><CancelEnabled dt:dt="int">-1</CancelEnabled><Mask dt:dt="string"></Mask><AttachDefinitions dt:dt="string"></AttachDefinitions><ENotify dt:dt="string">S</ENotify><TasklistCddReport dt:dt="string"></TasklistCddReport><TasklistCddCriteria dt:dt="string"></TasklistCddCriteria><TasklistURL dt:dt="string"></TasklistURL></ModelData><WorkFlows><WorkFlow MapKey="Main Flow"><id dt:dt="string">Main Flow</id><Description dt:dt="string">To Do It</Description><Activities><Activity MapKey="A2"><id dt:dt="string">A2</id><Description dt:dt="string">Cancel Instance</Description><Who dt:dt="string">P</Who><Person dt:dt="string">_CREATOR</Person><WaitSettings><Wait dt:dt="int">1</Wait><WaitFor dt:dt="int">2</WaitFor><Units dt:dt="string">Days</Units><AfterTimeout dt:dt="string">Retry Forever</AfterTimeout></WaitSettings><LevelInvariant dt:dt="int">0</LevelInvariant><ConditionGrid><AllQualifying dt:dt="int">0</AllQualifying><SkipNoQualified dt:dt="int">1</SkipNoQualified><SkipDupQualifyingRoles dt:dt="int">0</SkipDupQualifyingRoles><SkipDupQualifyingUsers dt:dt="int">0</SkipDupQualifyingUsers></ConditionGrid><Action><ProgID dt:dt="string">Bt50wf.VBScript</ProgID><Settings dt:dt="string">&lt;TEXT&gt;&lt;![CDATA['This script shall remove the currently attached instance
'The deleterec method lines need to be uncommented.
'A message box appears for each child record deleted.


set instance = model.getInstanceRecord
targetkey = instance.Key



'msgbox "Deleting Instance: " &amp;  targetkey
	
	
				
Dim oINSTANCEVAR, oINSTANCEVARSelect, oINSTANCEVARWhere, oINSTANCEVARWhereclause
		
Set oINSTANCEVAR = CreateObject("BT20.WFInstanceVar")
Set oINSTANCEVARSelect= CreateObject("BT20.BTSelectCursor")
Set oINSTANCEVARWhere = CreateObject("BT20.BTStaticWhereClause")
oINSTANCEVARSelect.addrecordsource(oINSTANCEVAR)
oINSTANCEVARWhereclause = "wf_key = '" &amp;  targetkey &amp; "'"
oINSTANCEVARWhere.PutSQL(oINSTANCEVARWhereclause)
oINSTANCEVARSelect.AddWhereClause(oINSTANCEVARWhere)
		
Do While (0 = oINSTANCEVARSelect.SFetchNext())
	'msgbox "Deleting Instance Var Record"
	Result = oINSTANCEVAR.DeleteRec()
Loop
		
Set oINSTANCEVAR = Nothing
Set oINSTANCEVARSelect = Nothing
Set oINSTANCEVARWhere = Nothing

		
Dim oHISTORY, oHISTORYSelect, oHISTORYWhere, oHISTORYWhereclause
		
Set oHISTORY = CreateObject("BT20.WFHistory")
Set oHISTORYSelect= CreateObject("BT20.BTSelectCursor")
Set oHISTORYWhere = CreateObject("BT20.BTStaticWhereClause")
oHISTORYSelect.addrecordsource(oHISTORY)
oHISTORYWhereclause =  "wf_key = '" &amp; targetkey &amp; "'" 
oHISTORYWhere.PutSQL(oHISTORYWhereclause)
oHISTORYSelect.AddWhereClause(oHISTORYWhere)
		
Do While (0 = oHISTORYSelect.SFetchNext())
     'msgbox "Deleting History  record"
     Result = oHISTORY.DeleteRec()
Loop
		
Set oHISTORY = Nothing
Set oHISTORYSelect = Nothing
Set oHISTORYWhere = Nothing		

		
Dim oINSTANCE, oINSTANCESelect, oINSTANCEWhere, oINSTANCEWhereclause
		
Set oINSTANCE = CreateObject("BT20.WFInstance")
Set oINSTANCESelect= CreateObject("BT20.BTSelectCursor")
Set oINSTANCEWhere = CreateObject("BT20.BTStaticWhereClause")
oINSTANCESelect.addrecordsource(oINSTANCE)
oINSTANCEWhereclause = "wf_key = '" &amp; targetkey &amp; "'"
oINSTANCEWhere.PutSQL(oINSTANCEWhereclause)
oINSTANCESelect.AddWhereClause(oINSTANCEWhere)
		
Do While (0 = oINSTANCESelect.SFetchNext())
     'msgbox "Deleting Instance Record " 
     Result = oINSTANCE.DeleteRec()
Loop
		
Set oINSTANCE = Nothing
Set oINSTANCESelect = Nothing
Set oINSTANCEWhere = Nothing
]]&gt;&lt;/TEXT&gt;
</Settings></Action><EnterAll dt:dt="int">0</EnterAll><ExitAll dt:dt="int">0</ExitAll><Role dt:dt="string"></Role><DesignLocation><xPos dt:dt="int">407</xPos><yPos dt:dt="int">98</yPos></DesignLocation><IsStartNode dt:dt="int">0</IsStartNode><IsEndNode dt:dt="int">0</IsEndNode><ActionExecution dt:dt="string">C</ActionExecution><ForceSend dt:dt="int">0</ForceSend><ExtState dt:dt="string"></ExtState><RestrictAccess dt:dt="string">U</RestrictAccess><ForceSendToAnother dt:dt="int">0</ForceSendToAnother><WhenUserViewConditionBasedFilter dt:dt="string"></WhenUserViewConditionBasedFilter><WhenTranslatedConditionBasedFilter dt:dt="string"></WhenTranslatedConditionBasedFilter><ForceSendToCreator dt:dt="int">0</ForceSendToCreator><ForceOtherwiseEnd dt:dt="int">-1</ForceOtherwiseEnd></Activity><Activity MapKey="A3"><id dt:dt="string">A3</id><Description dt:dt="string">Process Content</Description><Who dt:dt="string">P</Who><Person dt:dt="string">_CREATOR</Person><WaitSettings><Wait dt:dt="int">1</Wait><WaitFor dt:dt="int">2</WaitFor><Units dt:dt="string">Days</Units><AfterTimeout dt:dt="string">Retry Forever</AfterTimeout></WaitSettings><LevelInvariant dt:dt="int">0</LevelInvariant><ConditionGrid><AllQualifying dt:dt="int">0</AllQualifying><SkipNoQualified dt:dt="int">1</SkipNoQualified><SkipDupQualifyingRoles dt:dt="int">0</SkipDupQualifyingRoles><SkipDupQualifyingUsers dt:dt="int">0</SkipDupQualifyingUsers></ConditionGrid><Action><ProgID dt:dt="string">Bt50wf.VBScript</ProgID><Settings dt:dt="string">&lt;TEXT&gt;&lt;![CDATA[set content = Model.GetInstanceData()

'doc 1231448
'https://cas-app-prod.cascloud.aspgov.com/Finance/workflow/custom/webattach2.asp?Key=02D378B1-793C-4A45-BE31-70B8D9CEDE38

	dim instancerecord, instancedata, changecount, lifecount
	instancerecord = Model.GetInstanceRecord()
	instancedata = Model.GetInstanceData()
	Dim Funds, SelectCursor, WhereClause, WhereParams
	
	Set Funds = CreateObject("BT20.GLKGrpMaster")
	Set SelectCursor = CreateObject("BT20.BTSelectCursor")
	Set WhereClause = CreateObject("BT20.BTStaticWhereClause")
	
	SelectCursor.AddRecordSource(Funds)
	WhereParams = "grpid = 'FUND' and gr = 'GL'" 
	WhereClause.PutSQL(WhereParams)
	SelectCursor.AddWhereClause(WhereClause)
	
	Do While (0 = SelectCursor.SFetchNext())

	Loop
	

	Dim AppEnvironment, BrokerPath
	Dim btDBData
	Set btDBData = CreateObject("BTDBData.BTDBData")
	BrokerPath = btDBData.WWWServer &amp; "isapi/btwebrqb.dll"
	AppEnvironment = btDBData.ConnectionName
	AppUser = "SPSAPPUSER"


	Dim xR 
	Dim xO
	xR =  "&lt;sbixml&gt;&lt;NetSightMessage&gt;&lt;Header&gt;&lt;Connection&gt;" &amp; AppEnvironment &amp; "&lt;/Connection&gt;&lt;UserID&gt;" &amp; AppUser &amp; "&lt;/UserID&gt;&lt;Timeout&gt;90000&lt;/Timeout&gt;&lt;/Header&gt;&lt;Request Type=""ReportFetch"" Distinct=""1""&gt;&lt;DataObject ProgId=""BT20.GLKGrpMaster""&gt;&lt;WhereClause&gt;&lt;/WhereClause&gt;&lt;/DataObject&gt;&lt;ReportFormat&gt;&lt;Detail BT20OBJ=""BT20.GLKGrpMaster""/&gt;&lt;/ReportFormat&gt;&lt;/ReportFetch&gt;&lt;/Request&gt;&lt;/NetSightMessage&gt;&lt;/sbixml&gt;"
	set xO = CreateObject("MSXML2.DOMDocument")
	Set hO = CreateObject("MSXML2.SERVERXMLHTTP")
	xO.async = False
	xO.loadXML(xR) 
	hO.open "POST",BrokerPath,0
	hO.setOption(2) = 4096
	hO.send(xO)
	for each rO in hO.responsexml.selectnodes("//Response")
	
	next



	'Call model.Mail(variables.emailTo, variables.emailSubject, variables.emailMsg)

	

	Dim RecSet
	Set RecSet = CreateObject("ADODB.Recordset")
	RecSet.fields.append "WKey", 200,36 
	RecSet.fields.append "WModel", 200,36 
	RecSet.fields.append "WVersion",3
	RecSet.Open	
	RecSet.AddNew
	RecSet.Fields("WKey") = oINST.Key
	RecSet.Fields("WModel") = oINST.ModelId
	RecSet.Fields("WVersion") = oINST.Version
	RecSet.Update

	
	If RecSet.RecordCount &gt; 0 Then
		RecSet.MoveFirst
		While Not RecSet.EOF	
			'RecSet.Fields("WVersion") 

		RecSet.MoveNext
		Wend
	End If
	Set RecSet = Nothing


]]&gt;&lt;/TEXT&gt;
</Settings></Action><EnterAll dt:dt="int">0</EnterAll><ExitAll dt:dt="int">0</ExitAll><Role dt:dt="string"></Role><DesignLocation><xPos dt:dt="int">406</xPos><yPos dt:dt="int">179</yPos></DesignLocation><IsStartNode dt:dt="int">0</IsStartNode><IsEndNode dt:dt="int">0</IsEndNode><ActionExecution dt:dt="string">C</ActionExecution><ForceSend dt:dt="int">0</ForceSend><ExtState dt:dt="string"></ExtState><RestrictAccess dt:dt="string">U</RestrictAccess><ForceSendToAnother dt:dt="int">0</ForceSendToAnother><WhenUserViewConditionBasedFilter dt:dt="string"></WhenUserViewConditionBasedFilter><WhenTranslatedConditionBasedFilter dt:dt="string"></WhenTranslatedConditionBasedFilter><ForceSendToCreator dt:dt="int">0</ForceSendToCreator><ForceOtherwiseEnd dt:dt="int">-1</ForceOtherwiseEnd></Activity><Activity MapKey="End"><id dt:dt="string">End</id><Description dt:dt="string"></Description><Who dt:dt="string">N</Who><Person dt:dt="string"></Person><WaitSettings><Wait dt:dt="int">0</Wait><WaitFor dt:dt="int">0</WaitFor><Units dt:dt="string">Days</Units><AfterTimeout dt:dt="string"></AfterTimeout></WaitSettings><LevelInvariant dt:dt="int">0</LevelInvariant><ConditionGrid><AllQualifying dt:dt="int">0</AllQualifying><SkipNoQualified dt:dt="int">1</SkipNoQualified><SkipDupQualifyingRoles dt:dt="int">0</SkipDupQualifyingRoles><SkipDupQualifyingUsers dt:dt="int">0</SkipDupQualifyingUsers></ConditionGrid><Action><ProgID dt:dt="string">Bt50wf.End</ProgID><Settings dt:dt="string"></Settings></Action><EnterAll dt:dt="int">0</EnterAll><ExitAll dt:dt="int">0</ExitAll><Role dt:dt="string"></Role><DesignLocation><xPos dt:dt="int">702</xPos><yPos dt:dt="int">31</yPos></DesignLocation><IsStartNode dt:dt="int">0</IsStartNode><IsEndNode dt:dt="int">-1</IsEndNode><ActionExecution dt:dt="string">C</ActionExecution><ForceSend dt:dt="int">0</ForceSend><ExtState dt:dt="string"></ExtState><RestrictAccess dt:dt="string"></RestrictAccess><ForceSendToAnother dt:dt="int">0</ForceSendToAnother><WhenUserViewConditionBasedFilter dt:dt="string"></WhenUserViewConditionBasedFilter><WhenTranslatedConditionBasedFilter dt:dt="string"></WhenTranslatedConditionBasedFilter><ForceSendToCreator dt:dt="int">0</ForceSendToCreator><ForceOtherwiseEnd dt:dt="int">-1</ForceOtherwiseEnd></Activity><Activity MapKey="A1"><id dt:dt="string">A1</id><Description dt:dt="string">Update Content</Description><Who dt:dt="string">N</Who><Person dt:dt="string"></Person><WaitSettings><Wait dt:dt="int">1</Wait><WaitFor dt:dt="int">2</WaitFor><Units dt:dt="string">Days</Units><AfterTimeout dt:dt="string">Retry Forever</AfterTimeout></WaitSettings><LevelInvariant dt:dt="int">0</LevelInvariant><ConditionGrid><AllQualifying dt:dt="int">0</AllQualifying><SkipNoQualified dt:dt="int">1</SkipNoQualified><SkipDupQualifyingRoles dt:dt="int">0</SkipDupQualifyingRoles><SkipDupQualifyingUsers dt:dt="int">0</SkipDupQualifyingUsers></ConditionGrid><Action><ProgID dt:dt="string">Bt50wf.VBScript</ProgID><Settings dt:dt="string"></Settings></Action><EnterAll dt:dt="int">0</EnterAll><ExitAll dt:dt="int">0</ExitAll><Role dt:dt="string"></Role><DesignLocation><xPos dt:dt="int">413</xPos><yPos dt:dt="int">31</yPos></DesignLocation><IsStartNode dt:dt="int">0</IsStartNode><IsEndNode dt:dt="int">0</IsEndNode><ActionExecution dt:dt="string">C</ActionExecution><ForceSend dt:dt="int">0</ForceSend><ExtState dt:dt="string"></ExtState><RestrictAccess dt:dt="string">U</RestrictAccess><ForceSendToAnother dt:dt="int">0</ForceSendToAnother><WhenUserViewConditionBasedFilter dt:dt="string"></WhenUserViewConditionBasedFilter><WhenTranslatedConditionBasedFilter dt:dt="string"></WhenTranslatedConditionBasedFilter><ForceSendToCreator dt:dt="int">0</ForceSendToCreator><ForceOtherwiseEnd dt:dt="int">-1</ForceOtherwiseEnd></Activity><Activity MapKey="A6"><id dt:dt="string">A6</id><Description dt:dt="string">Attach Report</Description><Who dt:dt="string">P</Who><Person dt:dt="string">_CREATOR</Person><WaitSettings><Wait dt:dt="int">1</Wait><WaitFor dt:dt="int">2</WaitFor><Units dt:dt="string">Days</Units><AfterTimeout dt:dt="string">Retry Forever</AfterTimeout></WaitSettings><LevelInvariant dt:dt="int">0</LevelInvariant><ConditionGrid><AllQualifying dt:dt="int">0</AllQualifying><SkipNoQualified dt:dt="int">1</SkipNoQualified><SkipDupQualifyingRoles dt:dt="int">0</SkipDupQualifyingRoles><SkipDupQualifyingUsers dt:dt="int">0</SkipDupQualifyingUsers></ConditionGrid><Action><ProgID dt:dt="string">Bt50wf.WFDocument</ProgID><Settings dt:dt="string">&lt;xml&gt;&lt;Type&gt;&lt;![CDATA[CDD]]&gt;&lt;/Type&gt;&lt;DiscardFlag&gt;&lt;![CDATA[N]]&gt;&lt;/DiscardFlag&gt;&lt;DiscardDate&gt;&lt;![CDATA[12/31/2050]]&gt;&lt;/DiscardDate&gt;&lt;ReportName&gt;&lt;![CDATA[WEBATTACH2]]&gt;&lt;/ReportName&gt;&lt;BuildAttachments&gt;&lt;![CDATA[FALSE]]&gt;&lt;/BuildAttachments&gt;&lt;AttachmentDefinition&gt;&lt;![CDATA[]]&gt;&lt;/AttachmentDefinition&gt;&lt;/xml&gt;
</Settings></Action><EnterAll dt:dt="int">0</EnterAll><ExitAll dt:dt="int">0</ExitAll><Role dt:dt="string"></Role><DesignLocation><xPos dt:dt="int">577</xPos><yPos dt:dt="int">392</yPos></DesignLocation><IsStartNode dt:dt="int">0</IsStartNode><IsEndNode dt:dt="int">0</IsEndNode><ActionExecution dt:dt="string">C</ActionExecution><ForceSend dt:dt="int">0</ForceSend><ExtState dt:dt="string"></ExtState><RestrictAccess dt:dt="string">U</RestrictAccess><ForceSendToAnother dt:dt="int">0</ForceSendToAnother><WhenUserViewConditionBasedFilter dt:dt="string"></WhenUserViewConditionBasedFilter><WhenTranslatedConditionBasedFilter dt:dt="string"></WhenTranslatedConditionBasedFilter><ForceSendToCreator dt:dt="int">0</ForceSendToCreator><ForceOtherwiseEnd dt:dt="int">-1</ForceOtherwiseEnd></Activity><Activity MapKey="A7"><id dt:dt="string">A7</id><Description dt:dt="string">Present Report</Description><Who dt:dt="string">P</Who><Person dt:dt="string">_CREATOR</Person><WaitSettings><Wait dt:dt="int">1</Wait><WaitFor dt:dt="int">2</WaitFor><Units dt:dt="string">Days</Units><AfterTimeout dt:dt="string">Retry Forever</AfterTimeout></WaitSettings><LevelInvariant dt:dt="int">0</LevelInvariant><ConditionGrid><AllQualifying dt:dt="int">0</AllQualifying><SkipNoQualified dt:dt="int">1</SkipNoQualified><SkipDupQualifyingRoles dt:dt="int">0</SkipDupQualifyingRoles><SkipDupQualifyingUsers dt:dt="int">0</SkipDupQualifyingUsers></ConditionGrid><Action><ProgID dt:dt="string">Bt50wf.NotifyUser</ProgID><Settings dt:dt="string">&lt;xml&gt;&lt;EmailBody&gt;&lt;![CDATA[]]&gt;&lt;/EmailBody&gt;&lt;ToList&gt;&lt;![CDATA[keith@koahills.com]]&gt;&lt;/ToList&gt;&lt;CcList&gt;&lt;![CDATA[]]&gt;&lt;/CcList&gt;&lt;BccList&gt;&lt;![CDATA[]]&gt;&lt;/BccList&gt;&lt;EmailSubject&gt;&lt;![CDATA[]]&gt;&lt;/EmailSubject&gt;&lt;ToDefault&gt;&lt;![CDATA[0]]&gt;&lt;/ToDefault&gt;&lt;CcDefault&gt;&lt;![CDATA[None]]&gt;&lt;/CcDefault&gt;&lt;BccDefault&gt;&lt;![CDATA[None]]&gt;&lt;/BccDefault&gt;&lt;BodyDefault&gt;&lt;![CDATA[]]&gt;&lt;/BodyDefault&gt;&lt;SubjectDefault&gt;&lt;![CDATA[]]&gt;&lt;/SubjectDefault&gt;&lt;MappingEnabled&gt;&lt;![CDATA[N]]&gt;&lt;/MappingEnabled&gt;&lt;ExternalFile&gt;&lt;![CDATA[]]&gt;&lt;/ExternalFile&gt;&lt;AttachmentType&gt;&lt;![CDATA[NONE]]&gt;&lt;/AttachmentType&gt;&lt;CDDReport&gt;&lt;![CDATA[WEBATTACH2]]&gt;&lt;/CDDReport&gt;&lt;Attachments&gt;&lt;![CDATA[]]&gt;&lt;/Attachments&gt;&lt;Process&gt;&lt;![CDATA[N]]&gt;&lt;/Process&gt;&lt;/xml&gt;
</Settings></Action><EnterAll dt:dt="int">0</EnterAll><ExitAll dt:dt="int">0</ExitAll><Role dt:dt="string"></Role><DesignLocation><xPos dt:dt="int">674</xPos><yPos dt:dt="int">392</yPos></DesignLocation><IsStartNode dt:dt="int">0</IsStartNode><IsEndNode dt:dt="int">0</IsEndNode><ActionExecution dt:dt="string">C</ActionExecution><ForceSend dt:dt="int">0</ForceSend><ExtState dt:dt="string"></ExtState><RestrictAccess dt:dt="string">U</RestrictAccess><ForceSendToAnother dt:dt="int">0</ForceSendToAnother><WhenUserViewConditionBasedFilter dt:dt="string"></WhenUserViewConditionBasedFilter><WhenTranslatedConditionBasedFilter dt:dt="string"></WhenTranslatedConditionBasedFilter><ForceSendToCreator dt:dt="int">0</ForceSendToCreator><ForceOtherwiseEnd dt:dt="int">-1</ForceOtherwiseEnd></Activity><Activity MapKey="A4"><id dt:dt="string">A4</id><Description dt:dt="string">Hold For Actiion</Description><Who dt:dt="string">P</Who><Person dt:dt="string">_CREATOR</Person><WaitSettings><Wait dt:dt="int">1</Wait><WaitFor dt:dt="int">2</WaitFor><Units dt:dt="string">Days</Units><AfterTimeout dt:dt="string">Retry Forever</AfterTimeout></WaitSettings><LevelInvariant dt:dt="int">0</LevelInvariant><ConditionGrid><AllQualifying dt:dt="int">0</AllQualifying><SkipNoQualified dt:dt="int">1</SkipNoQualified><SkipDupQualifyingRoles dt:dt="int">0</SkipDupQualifyingRoles><SkipDupQualifyingUsers dt:dt="int">0</SkipDupQualifyingUsers></ConditionGrid><Action><ProgID dt:dt="string">Bt50wf.TaskApprovals</ProgID><Settings dt:dt="string"></Settings></Action><EnterAll dt:dt="int">0</EnterAll><ExitAll dt:dt="int">0</ExitAll><Role dt:dt="string"></Role><DesignLocation><xPos dt:dt="int">341</xPos><yPos dt:dt="int">391</yPos></DesignLocation><IsStartNode dt:dt="int">0</IsStartNode><IsEndNode dt:dt="int">0</IsEndNode><ActionExecution dt:dt="string">C</ActionExecution><ForceSend dt:dt="int">0</ForceSend><ExtState dt:dt="string"></ExtState><RestrictAccess dt:dt="string">U</RestrictAccess><ForceSendToAnother dt:dt="int">0</ForceSendToAnother><WhenUserViewConditionBasedFilter dt:dt="string"></WhenUserViewConditionBasedFilter><WhenTranslatedConditionBasedFilter dt:dt="string"></WhenTranslatedConditionBasedFilter><ForceSendToCreator dt:dt="int">0</ForceSendToCreator><ForceOtherwiseEnd dt:dt="int">-1</ForceOtherwiseEnd></Activity><Activity MapKey="A5"><id dt:dt="string">A5</id><Description dt:dt="string">Report</Description><Who dt:dt="string">P</Who><Person dt:dt="string">_CREATOR</Person><WaitSettings><Wait dt:dt="int">1</Wait><WaitFor dt:dt="int">2</WaitFor><Units dt:dt="string">Days</Units><AfterTimeout dt:dt="string">Retry Forever</AfterTimeout></WaitSettings><LevelInvariant dt:dt="int">0</LevelInvariant><ConditionGrid><AllQualifying dt:dt="int">0</AllQualifying><SkipNoQualified dt:dt="int">1</SkipNoQualified><SkipDupQualifyingRoles dt:dt="int">0</SkipDupQualifyingRoles><SkipDupQualifyingUsers dt:dt="int">0</SkipDupQualifyingUsers></ConditionGrid><Action><ProgID dt:dt="string">Bt50wf.CDDReport</ProgID><Settings dt:dt="string">&lt;xml&gt;&lt;Report&gt;WEBATTACH2&lt;/Report&gt;&lt;Criteria&gt;&lt;/Criteria&gt;&lt;Destination&gt;&lt;/Destination&gt;&lt;Prompts&gt;&lt;![CDATA[]]&gt;&lt;/Prompts&gt;&lt;/xml&gt;
</Settings></Action><EnterAll dt:dt="int">0</EnterAll><ExitAll dt:dt="int">0</ExitAll><Role dt:dt="string"></Role><DesignLocation><xPos dt:dt="int">454</xPos><yPos dt:dt="int">391</yPos></DesignLocation><IsStartNode dt:dt="int">0</IsStartNode><IsEndNode dt:dt="int">0</IsEndNode><ActionExecution dt:dt="string">C</ActionExecution><ForceSend dt:dt="int">0</ForceSend><ExtState dt:dt="string"></ExtState><RestrictAccess dt:dt="string">U</RestrictAccess><ForceSendToAnother dt:dt="int">0</ForceSendToAnother><WhenUserViewConditionBasedFilter dt:dt="string"></WhenUserViewConditionBasedFilter><WhenTranslatedConditionBasedFilter dt:dt="string"></WhenTranslatedConditionBasedFilter><ForceSendToCreator dt:dt="int">0</ForceSendToCreator><ForceOtherwiseEnd dt:dt="int">-1</ForceOtherwiseEnd></Activity><Activity MapKey="Start"><id dt:dt="string">Start</id><Description dt:dt="string"></Description><Who dt:dt="string">N</Who><Person dt:dt="string"></Person><WaitSettings><Wait dt:dt="int">0</Wait><WaitFor dt:dt="int">0</WaitFor><Units dt:dt="string">Days</Units><AfterTimeout dt:dt="string"></AfterTimeout></WaitSettings><LevelInvariant dt:dt="int">0</LevelInvariant><ConditionGrid><AllQualifying dt:dt="int">0</AllQualifying><SkipNoQualified dt:dt="int">1</SkipNoQualified><SkipDupQualifyingRoles dt:dt="int">0</SkipDupQualifyingRoles><SkipDupQualifyingUsers dt:dt="int">0</SkipDupQualifyingUsers></ConditionGrid><Action><ProgID dt:dt="string">Bt50wf.Start</ProgID><Settings dt:dt="string"></Settings></Action><EnterAll dt:dt="int">0</EnterAll><ExitAll dt:dt="int">1</ExitAll><Role dt:dt="string"></Role><DesignLocation><xPos dt:dt="int">32</xPos><yPos dt:dt="int">31</yPos></DesignLocation><IsStartNode dt:dt="int">-1</IsStartNode><IsEndNode dt:dt="int">0</IsEndNode><ActionExecution dt:dt="string">C</ActionExecution><ForceSend dt:dt="int">0</ForceSend><ExtState dt:dt="string"></ExtState><RestrictAccess dt:dt="string"></RestrictAccess><ForceSendToAnother dt:dt="int">0</ForceSendToAnother><WhenUserViewConditionBasedFilter dt:dt="string"></WhenUserViewConditionBasedFilter><WhenTranslatedConditionBasedFilter dt:dt="string"></WhenTranslatedConditionBasedFilter><ForceSendToCreator dt:dt="int">0</ForceSendToCreator><ForceOtherwiseEnd dt:dt="int">0</ForceOtherwiseEnd></Activity></Activities><Transitions><Transition MapKey="T10"><id dt:dt="string">T10</id><LevelInvariant dt:dt="int">0</LevelInvariant><Description dt:dt="string"></Description><From dt:dt="string">A7</From><To dt:dt="string">End</To><Condition dt:dt="string"></Condition><UserViewOfCondition dt:dt="string"></UserViewOfCondition><ExitOrder dt:dt="int">1</ExitOrder></Transition><Transition MapKey="T1"><id dt:dt="string">T1</id><LevelInvariant dt:dt="int">0</LevelInvariant><Description dt:dt="string"></Description><From dt:dt="string">Start</From><To dt:dt="string">A1</To><Condition dt:dt="string">/xml/WebformData/PurchaseItem[. = "Update Content"]</Condition><UserViewOfCondition dt:dt="string">{PurchaseItem} = "Update Content"</UserViewOfCondition><ExitOrder dt:dt="int">1</ExitOrder></Transition><Transition MapKey="T3"><id dt:dt="string">T3</id><LevelInvariant dt:dt="int">0</LevelInvariant><Description dt:dt="string"></Description><From dt:dt="string">Start</From><To dt:dt="string">A3</To><Condition dt:dt="string">/xml/WebformData/Department[. = "Process Content"]</Condition><UserViewOfCondition dt:dt="string">{Department} = "Process Content"</UserViewOfCondition><ExitOrder dt:dt="int">2</ExitOrder></Transition><Transition MapKey="T2"><id dt:dt="string">T2</id><LevelInvariant dt:dt="int">0</LevelInvariant><Description dt:dt="string"></Description><From dt:dt="string">A1</From><To dt:dt="string">End</To><Condition dt:dt="string"></Condition><UserViewOfCondition dt:dt="string"></UserViewOfCondition><ExitOrder dt:dt="int">1</ExitOrder></Transition><Transition MapKey="T5"><id dt:dt="string">T5</id><LevelInvariant dt:dt="int">0</LevelInvariant><Description dt:dt="string"></Description><From dt:dt="string">Start</From><To dt:dt="string">A4</To><Condition dt:dt="string"></Condition><UserViewOfCondition dt:dt="string"></UserViewOfCondition><ExitOrder dt:dt="int">3</ExitOrder></Transition><Transition MapKey="T4"><id dt:dt="string">T4</id><LevelInvariant dt:dt="int">0</LevelInvariant><Description dt:dt="string"></Description><From dt:dt="string">A3</From><To dt:dt="string">End</To><Condition dt:dt="string"></Condition><UserViewOfCondition dt:dt="string"></UserViewOfCondition><ExitOrder dt:dt="int">1</ExitOrder></Transition><Transition MapKey="T7"><id dt:dt="string">T7</id><LevelInvariant dt:dt="int">0</LevelInvariant><Description dt:dt="string"></Description><From dt:dt="string">A4</From><To dt:dt="string">A5</To><Condition dt:dt="string"></Condition><UserViewOfCondition dt:dt="string"></UserViewOfCondition><ExitOrder dt:dt="int">1</ExitOrder></Transition><Transition MapKey="T6"><id dt:dt="string">T6</id><LevelInvariant dt:dt="int">0</LevelInvariant><Description dt:dt="string"></Description><From dt:dt="string">A4</From><To dt:dt="string">End</To><Condition dt:dt="string"></Condition><UserViewOfCondition dt:dt="string"></UserViewOfCondition><ExitOrder dt:dt="int">2</ExitOrder></Transition><Transition MapKey="T9"><id dt:dt="string">T9</id><LevelInvariant dt:dt="int">0</LevelInvariant><Description dt:dt="string"></Description><From dt:dt="string">A6</From><To dt:dt="string">A7</To><Condition dt:dt="string"></Condition><UserViewOfCondition dt:dt="string"></UserViewOfCondition><ExitOrder dt:dt="int">1</ExitOrder></Transition><Transition MapKey="T8"><id dt:dt="string">T8</id><LevelInvariant dt:dt="int">0</LevelInvariant><Description dt:dt="string"></Description><From dt:dt="string">A5</From><To dt:dt="string">A6</To><Condition dt:dt="string"></Condition><UserViewOfCondition dt:dt="string"></UserViewOfCondition><ExitOrder dt:dt="int">1</ExitOrder></Transition></Transitions><DesignLocation><xPos dt:dt="int">5</xPos><yPos dt:dt="int">75</yPos></DesignLocation></WorkFlow></WorkFlows></MODEL>
