﻿<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="18008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="VIs" Type="Folder" URL="../VIs">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="AcqSingleImageToTiff.vi" Type="VI" URL="../../config/AcqSingleImageToTiff.vi"/>
		<Item Name="AndorCreaterErrorCluster.vi" Type="VI" URL="../../lib/ANDOR/OwnVIs/AndorCreaterErrorCluster.vi"/>
		<Item Name="AndorIdle.vi" Type="VI" URL="../../lib/ANDOR/OwnVIs/AndorIdle.vi"/>
		<Item Name="AndorLiveMode.vi" Type="VI" URL="../../lib/ANDOR/OwnVIs/AndorLiveMode.vi"/>
		<Item Name="AndorReturn2Error.vi" Type="VI" URL="../../lib/ANDOR/OwnVIs/AndorReturn2Error.vi"/>
		<Item Name="AndorSDK.lvlib" Type="Library" URL="../../lib/ANDOR/Andor SDK/AndorSDK.lvlib"/>
		<Item Name="ArdnoAllValvesClosed.vi" Type="VI" URL="../../lib/ARDUINO/VIs/ArdnoAllValvesClosed.vi"/>
		<Item Name="ArdnoAllValvesOpened.vi" Type="VI" URL="../../lib/ARDUINO/VIs/ArdnoAllValvesOpened.vi"/>
		<Item Name="ArdnoChannel2Valves.vi" Type="VI" URL="../../lib/ARDUINO/VIs/ArdnoChannel2Valves.vi"/>
		<Item Name="ArdnoDilutionStep.vi" Type="VI" URL="../../lib/ARDUINO/VIs/ArdnoDilutionStep.vi"/>
		<Item Name="ArdnoFeed.vi" Type="VI" URL="../../lib/ARDUINO/VIs/ArdnoFeed.vi"/>
		<Item Name="ArdnoFlush.vi" Type="VI" URL="../../lib/ARDUINO/VIs/ArdnoFlush.vi"/>
		<Item Name="ArdnoPump.vi" Type="VI" URL="../../lib/ARDUINO/VIs/ArdnoPump.vi"/>
		<Item Name="ArdnoSingleValveControl.vi" Type="VI" URL="../../lib/ARDUINO/VIs/ArdnoSingleValveControl.vi"/>
		<Item Name="ArdnoValve2Linx.vi" Type="VI" URL="../../lib/ARDUINO/VIs/ArdnoValve2Linx.vi"/>
		<Item Name="CalibComputeRatio.vi" Type="VI" URL="../../Calibration/CalibComputeRatio.vi"/>
		<Item Name="ConfigFormatToXMLElement.vi" Type="VI" URL="../../lib/Config/ConfigFormatToXMLElement.vi"/>
		<Item Name="ConfigParseImage.vi" Type="VI" URL="../../lib/Config/ConfigParseImage.vi"/>
		<Item Name="ConfigParseInitialConfiguration.vi" Type="VI" URL="../../lib/Config/ConfigParseInitialConfiguration.vi"/>
		<Item Name="ConfigParseLoop.vi" Type="VI" URL="../../lib/Config/ConfigParseLoop.vi"/>
		<Item Name="ConfigParseMicroscope.vi" Type="VI" URL="../../config/ConfigParseMicroscope.vi"/>
		<Item Name="ConfigParseMultipleMicroscopes.vi" Type="VI" URL="../../lib/Config/ConfigParseMultipleMicroscopes.vi"/>
		<Item Name="ConfigParsePos.vi" Type="VI" URL="../../lib/Config/ConfigParsePos.vi"/>
		<Item Name="ConfigParseProgram.vi" Type="VI" URL="../../lib/Config/ConfigParseProgram.vi"/>
		<Item Name="Connect.vi" Type="VI" URL="../../lib/TANGO Stage/SubVIs/Connect.vi"/>
		<Item Name="ContBuildProgamQueue.vi" Type="VI" URL="../../Continuous_Loop/ContBuildProgamQueue.vi"/>
		<Item Name="ContinousLoopMain.vi" Type="VI" URL="../../Continuous_Loop/ContinousLoopMain.vi"/>
		<Item Name="ContinuosSplitMicroSettings.vi" Type="VI" URL="../../Continuous_Loop/ContinuosSplitMicroSettings.vi"/>
		<Item Name="ContSplitGeneralSettings.vi" Type="VI" URL="../../Continuous_Loop/ContSplitGeneralSettings.vi"/>
		<Item Name="ConvertErrCodeToMessage.vi" Type="VI" URL="../../lib/ANDOR/OwnVIs/ConvertErrCodeToMessage.vi"/>
		<Item Name="CreateProgram.vi" Type="VI" URL="../../config/CreateProgram.vi"/>
		<Item Name="Disconnect.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_SQL/Access/CONNECTa.llb/Disconnect.vi"/>
		<Item Name="ExportPosList.vi" Type="VI" URL="../../config/ExportPosList.vi"/>
		<Item Name="LumencorDLL32.lvlib" Type="Library" URL="../../lib/SOLA/LabVIEW 2015 Library (32bit)/LumencorDLL32/LumencorDLL32.lvlib"/>
		<Item Name="Olympus IX BX Series.lvlib" Type="Library" URL="../../lib/Olympus IX BX Series/Olympus IX BX Series.lvlib"/>
		<Item Name="OlympusQuery.vi" Type="VI" URL="../../lib/Olympus IX BX Series/OwnVIs/OlympusQuery.vi"/>
		<Item Name="TangoCalibrate.vi" Type="VI" URL="../../lib/TANGO Stage/VIs/TangoCalibrate.vi"/>
		<Item Name="TangoConnect.vi" Type="VI" URL="../../lib/TANGO Stage/VIs/TangoConnect.vi"/>
		<Item Name="TangoConnectSub.vi" Type="VI" URL="../../lib/Tango/VIs/TangoConnectSub.vi"/>
		<Item Name="TangoPositions2MultiList.vi" Type="VI" URL="../../lib/TANGO Stage/VIs/TangoPositions2MultiList.vi"/>
		<Item Name="TangoSelectPos.vi" Type="VI" URL="../../lib/TANGO Stage/VIs/TangoSelectPos.vi"/>
		<Item Name="XMLAppendPosToConfig.vi" Type="VI" URL="../../config/XMLAppendPosToConfig.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="user.lib" Type="Folder">
				<Item Name="Tango_DLL.dll" Type="Document" URL="/&lt;userlib&gt;/Tango_DLL/Tango_DLL.dll"/>
				<Item Name="Tango_DLL.lvlib" Type="Library" URL="/&lt;userlib&gt;/Tango_DLL/Tango_DLL.lvlib"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Acquire Input Data.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Acquire Input Data.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Close Input Device.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Close Input Device.vi"/>
				<Item Name="closeJoystick.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeJoystick.vi"/>
				<Item Name="closeKeyboard.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeKeyboard.vi"/>
				<Item Name="closeMouse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeMouse.vi"/>
				<Item Name="compatCalcOffset.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatCalcOffset.vi"/>
				<Item Name="compatFileDialog.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatFileDialog.vi"/>
				<Item Name="compatOpenFileOperation.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOpenFileOperation.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Cursor While Loop Global.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_SQL/Access/MISCa.llb/Cursor While Loop Global.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrorDescriptions.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/ErrorDescriptions.vi"/>
				<Item Name="errorList.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/errorList.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="FindCloseTagByName.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindCloseTagByName.vi"/>
				<Item Name="FindElement.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindElement.vi"/>
				<Item Name="FindElementStartByName.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindElementStartByName.vi"/>
				<Item Name="FindEmptyElement.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindEmptyElement.vi"/>
				<Item Name="FindFirstTag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindFirstTag.vi"/>
				<Item Name="FindMatchingCloseTag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/FindMatchingCloseTag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Image Type" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/Image Type"/>
				<Item Name="Image Unit" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/Image Unit"/>
				<Item Name="IMAQ ArrayToImage" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ ArrayToImage"/>
				<Item Name="IMAQ Create" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Create"/>
				<Item Name="IMAQ GetImageInfo" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ GetImageInfo"/>
				<Item Name="IMAQ GetImageSize" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ GetImageSize"/>
				<Item Name="IMAQ Image.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Image.ctl"/>
				<Item Name="IMAQ ImageToArray" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ ImageToArray"/>
				<Item Name="Intialize Keyboard.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Intialize Keyboard.vi"/>
				<Item Name="Is Path and Not Empty.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Is Path and Not Empty.vi"/>
				<Item Name="joystickAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/joystickAcquire.vi"/>
				<Item Name="keyboardAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/keyboardAcquire.vi"/>
				<Item Name="LMH-LINX.lvlib" Type="Library" URL="/&lt;vilib&gt;/MakerHub/LINX/LMH-LINX.lvlib"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="Maximum Rows While Loop Global.vi" Type="VI" URL="/&lt;vilib&gt;/addons/_SQL/Access/MISCa.llb/Maximum Rows While Loop Global.vi"/>
				<Item Name="mouseAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/mouseAcquire.vi"/>
				<Item Name="NI_Vision_Development_Module.lvlib" Type="Library" URL="/&lt;vilib&gt;/vision/NI_Vision_Development_Module.lvlib"/>
				<Item Name="NI_XML.lvlib" Type="Library" URL="/&lt;vilib&gt;/xml/NI_XML.lvlib"/>
				<Item Name="Normalize End Of Line.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Normalize End Of Line.vi"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Open_Create_Replace File.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/Open_Create_Replace File.vi"/>
				<Item Name="ParseXMLFragments.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/ParseXMLFragments.vi"/>
				<Item Name="Read From XML File(array).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File(array).vi"/>
				<Item Name="Read From XML File(string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File(string).vi"/>
				<Item Name="Read From XML File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Read From XML File.vi"/>
				<Item Name="Reset myRIO.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Utilities/vis/Reset myRIO.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Smart Open.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Onboard IO/DIO/vis/Smart Open.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="To .NET Object.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/dotnet.llb/To .NET Object.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Write to XML File(array).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File(array).vi"/>
				<Item Name="Write to XML File(string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File(string).vi"/>
				<Item Name="Write to XML File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/xml.llb/Write to XML File.vi"/>
				<Item Name="Write.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Onboard IO/DIO/vis/Write.vi"/>
			</Item>
			<Item Name="AndorAcqSingleImageToTiff.vi" Type="VI" URL="../../lib/ANDOR/OwnVIs/AndorAcqSingleImageToTiff.vi"/>
			<Item Name="AndorConvertErrCodeToMessage.vi" Type="VI" URL="../../lib/ANDOR/OwnVIs/AndorConvertErrCodeToMessage.vi"/>
			<Item Name="ConfigAppendPosToConfig.vi" Type="VI" URL="../../lib/Config/ConfigAppendPosToConfig.vi"/>
			<Item Name="ConfigExportPosList.vi" Type="VI" URL="../../lib/Config/ConfigExportPosList.vi"/>
			<Item Name="ConfigFileParser.vi" Type="VI" URL="../../lib/Config/ConfigFileParser.vi"/>
			<Item Name="DOMUserDefRef.dll" Type="Document" URL="DOMUserDefRef.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="liblinxdevice.dll" Type="Document" URL="liblinxdevice.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="lvinput.dll" Type="Document" URL="/&lt;resource&gt;/lvinput.dll"/>
			<Item Name="LVTiffWriter.lvlib" Type="Library" URL="../../lib/tiff/LVTiffWriter/LVTiffWriter.lvlib"/>
			<Item Name="mscorlib" Type="VI" URL="mscorlib">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivision.dll" Type="Document" URL="nivision.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivissvc.dll" Type="Document" URL="nivissvc.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="TangoCalibrate.vi" Type="VI" URL="../../lib/Tango/VIs/TangoCalibrate.vi"/>
			<Item Name="TangoPositions2MultiList.vi" Type="VI" URL="../../lib/Tango/VIs/TangoPositions2MultiList.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="BUILD_UI" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{BB88D6B3-56C7-476C-8870-CDFE78D14031}</Property>
				<Property Name="App_INI_GUID" Type="Str">{18FBCF5D-FDA0-42A3-B6A0-FE669799F8B9}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{F99458F3-B4A4-4C88-9372-A5A85D94875D}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">BUILD_UI</Property>
				<Property Name="Bld_localDestDir" Type="Path">../builds/NI_AB_PROJECTNAME/BUILD_UI</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{180767D5-288E-4B0C-87DE-D0DEC2C8ECF6}</Property>
				<Property Name="Bld_userLogFile" Type="Path">../builds/UI_Project/BUILD_V1.1_UI/UI_Project_BUILD_V1.1_UI_log.txt</Property>
				<Property Name="Bld_userLogFile.pathType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_version.build" Type="Int">5</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">UserInterface.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../builds/NI_AB_PROJECTNAME/BUILD_UI/UserInterface.exe</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../builds/NI_AB_PROJECTNAME/BUILD_UI/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{6A5651A3-B186-41D9-ABB3-C3092F13AC53}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/VIs/V1.1_UI.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/AndorCreaterErrorCluster.vi</Property>
				<Property Name="Source[2].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[2].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[2].properties[1].value" Type="Bool">true</Property>
				<Property Name="Source[2].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/AndorReturn2Error.vi</Property>
				<Property Name="Source[3].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[3].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[3].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[3].properties[1].value" Type="Bool">true</Property>
				<Property Name="Source[3].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[3].type" Type="Str">VI</Property>
				<Property Name="Source[4].itemID" Type="Ref">/My Computer/ConvertErrCodeToMessage.vi</Property>
				<Property Name="Source[4].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[4].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[4].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[4].properties[1].value" Type="Bool">true</Property>
				<Property Name="Source[4].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[4].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">5</Property>
				<Property Name="TgtF_companyName" Type="Str">TUM Fakultät für Physik</Property>
				<Property Name="TgtF_enableDebugging" Type="Bool">true</Property>
				<Property Name="TgtF_fileDescription" Type="Str">BUILD_UI</Property>
				<Property Name="TgtF_internalName" Type="Str">BUILD_UI</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2019 TUM Fakultät für Physik</Property>
				<Property Name="TgtF_productName" Type="Str">BUILD_UI</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{D3808586-AEAD-4262-B2C2-1618F22E4E6B}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">UserInterface.exe</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
