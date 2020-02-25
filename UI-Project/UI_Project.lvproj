﻿<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="18008000">
	<Property Name="CCSymbols" Type="Str"></Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
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
		<Item Name="AndorOWN.lvlib" Type="Library" URL="../../lib/ANDOR/OwnVIs/AndorOWN.lvlib"/>
		<Item Name="AndorSDK.lvlib" Type="Library" URL="../../lib/ANDOR/Andor SDK/AndorSDK.lvlib"/>
		<Item Name="Arduino.lvlib" Type="Library" URL="../../lib/ARDUINO/VIs/Arduino.lvlib"/>
		<Item Name="Config.lvlib" Type="Library" URL="../../lib/Config/Config.lvlib"/>
		<Item Name="ContinousLoop.lvlib" Type="Library" URL="../../lib/ContinuousLoop/ContinousLoop.lvlib"/>
		<Item Name="LumencorDLL32.lvlib" Type="Library" URL="../../lib/SOLA/LabVIEW 2015 Library (32bit)/LumencorDLL32/LumencorDLL32.lvlib"/>
		<Item Name="Olympus IX BX Series.lvlib" Type="Library" URL="../../lib/Olympus IX BX Series/Olympus IX BX Series.lvlib"/>
		<Item Name="Tango.lvlib" Type="Library" URL="../../lib/TANGO Stage/SDK/Tango.lvlib"/>
		<Item Name="TangoOWN.lvlib" Type="Library" URL="../../lib/TANGO Stage/TangoOWN.lvlib"/>
		<Item Name="LVTiffWriter.lvlib" Type="Library" URL="../../lib/tiff/LVTiffWriter/LVTiffWriter.lvlib"/>
		<Item Name="Calibration.lvlib" Type="Library" URL="../../lib/Calib/Calibration.lvlib"/>
		<Item Name="LVH-LINX.lvlib" Type="Library" URL="../../lib/ARDUINO/Backup LabVIEW Arduino Connection/LINX/LVH-LINX.lvlib"/>
		<Item Name="Sec2Timestamp.vi" Type="VI" URL="../../lib/ContinuousLoop/Sec2Timestamp.vi"/>
		<Item Name="00 - TODOs.txt" Type="Document" URL="../../00 - TODOs.txt"/>
		<Item Name="TangoMove.vi" Type="VI" URL="../../lib/TANGO Stage/VIs/TangoMove.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="user.lib" Type="Folder">
				<Item Name="Tango_DLL.lvlib" Type="Library" URL="/&lt;userlib&gt;/Tango_DLL/Tango_DLL.lvlib"/>
				<Item Name="Tango_DLL.dll" Type="Document" URL="/&lt;userlib&gt;/Tango_DLL/Tango_DLL.dll"/>
				<Item Name="LSX Get Error.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Get Error.vi"/>
				<Item Name="Tango_DLL.lvlib" Type="Library" URL="/&lt;userlib&gt;/Tango/Tango_DLL.lvlib"/>
				<Item Name="LSX Send String.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Send String.vi"/>
				<Item Name="LSX Get Switches.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Get Switches.vi"/>
				<Item Name="LSX Set Analog Output.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Set Analog Output.vi"/>
				<Item Name="LSX Get Switch Active.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Get Switch Active.vi"/>
				<Item Name="LSX Move Abs Single Axis.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Move Abs Single Axis.vi"/>
				<Item Name="LSX Move Rel Single Axis.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Move Rel Single Axis.vi"/>
				<Item Name="LSX Get Accel.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Get Accel.vi"/>
				<Item Name="LSX Get Vel.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Get Vel.vi"/>
				<Item Name="LSX Set Accel.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Set Accel.vi"/>
				<Item Name="LSX Set Vel.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Set Vel.vi"/>
				<Item Name="LSX Get Limit.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Get Limit.vi"/>
				<Item Name="LSX Get Active Axes.vi" Type="VI" URL="/&lt;userlib&gt;/TANGO_DLL/VIs/LSX Get Active Axes.vi"/>
				<Item Name="Cooler ON.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Cooler ON.vi"/>
				<Item Name="Cooler OFF.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Cooler OFF.vi"/>
				<Item Name="Get HS Speed.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get HS Speed.vi"/>
				<Item Name="Get Start Up Time.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Start Up Time.vi"/>
				<Item Name="Get Status.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Status.vi"/>
				<Item Name="Get Temperature Range.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Temperature Range.vi"/>
				<Item Name="Get Temperature Status.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Temperature Status.vi"/>
				<Item Name="Get Temperature.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Temperature.vi"/>
				<Item Name="Get Temperature F.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Temperature F.vi"/>
				<Item Name="Is Cooler On.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Is Cooler On.vi"/>
				<Item Name="Save As Tiff.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Save As Tiff.vi"/>
				<Item Name="Set Fan Mode.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set Fan Mode.vi"/>
				<Item Name="Set Shutter.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set Shutter.vi"/>
				<Item Name="Shut Down.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Shut Down.vi"/>
				<Item Name="Start Acquisition.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Start Acquisition.vi"/>
				<Item Name="White Balance.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/White Balance.vi"/>
				<Item Name="Get Hardware Version.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Hardware Version.vi"/>
				<Item Name="Get Number VS Speeds.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Number VS Speeds.vi"/>
				<Item Name="Get VS Speed.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get VS Speed.vi"/>
				<Item Name="Get Software Version.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Software Version.vi"/>
				<Item Name="Get Number HS Speeds.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Number HS Speeds.vi"/>
				<Item Name="Set Temperature.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set Temperature.vi"/>
				<Item Name="Set Acquisition Mode.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set Acquisition Mode.vi"/>
				<Item Name="Set Accumulation Cycle Time.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set Accumulation Cycle Time.vi"/>
				<Item Name="Set Exposure Time.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set Exposure Time.vi"/>
				<Item Name="Set HS Speed.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set HS Speed.vi"/>
				<Item Name="Set Read Mode.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set Read Mode.vi"/>
				<Item Name="Set Trigger Mode.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set Trigger Mode.vi"/>
				<Item Name="Set VS Speed.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set VS Speed.vi"/>
				<Item Name="Set Number Accumulations.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set Number Accumulations.vi"/>
				<Item Name="Set Number Kinetics.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set Number Kinetics.vi"/>
				<Item Name="Set Kinetic Cycle Time.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Set Kinetic Cycle Time.vi"/>
				<Item Name="Get Acquisition Timings.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Acquisition Timings.vi"/>
				<Item Name="Get Acquired Data.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Acquired Data.vi"/>
				<Item Name="Get Camera Information.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Camera Information.vi"/>
				<Item Name="Get Camera Serial Number.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Camera Serial Number.vi"/>
				<Item Name="Get Controller Card Model.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Controller Card Model.vi"/>
				<Item Name="Get Available Cameras.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Available Cameras.vi"/>
				<Item Name="Get Camera Handle.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Get Camera Handle.vi"/>
				<Item Name="Initialize.vi" Type="VI" URL="/&lt;userlib&gt;/Andor SDK/VIs/Initialize.vi"/>
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
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
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
				<Item Name="joystickAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/joystickAcquire.vi"/>
				<Item Name="keyboardAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/keyboardAcquire.vi"/>
				<Item Name="LMH-LINX.lvlib" Type="Library" URL="/&lt;vilib&gt;/MakerHub/LINX/LMH-LINX.lvlib"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="mouseAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/mouseAcquire.vi"/>
				<Item Name="NI_Vision_Development_Module.lvlib" Type="Library" URL="/&lt;vilib&gt;/vision/NI_Vision_Development_Module.lvlib"/>
				<Item Name="NI_XML.lvlib" Type="Library" URL="/&lt;vilib&gt;/xml/NI_XML.lvlib"/>
				<Item Name="Normalize End Of Line.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Normalize End Of Line.vi"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
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
				<Item Name="Write.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Onboard IO/DIO/vis/Write.vi"/>
				<Item Name="Is Path and Not Empty.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Is Path and Not Empty.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="subDisplayMessage.vi" Type="VI" URL="/&lt;vilib&gt;/express/express output/DisplayMessageBlock.llb/subDisplayMessage.vi"/>
				<Item Name="IMAQ ReadFile" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ ReadFile"/>
				<Item Name="IMAQ Dispose" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Dispose"/>
				<Item Name="VISA Find Search Mode.ctl" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Find Search Mode.ctl"/>
				<Item Name="LVRowAndColumnTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRowAndColumnTypeDef.ctl"/>
				<Item Name="Cast Image 2 Method.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Management.llb/Cast Image 2 Method.ctl"/>
				<Item Name="IMAQ Cast Image 2" Type="VI" URL="/&lt;vilib&gt;/vision/Management.llb/IMAQ Cast Image 2"/>
				<Item Name="Set Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Busy.vi"/>
				<Item Name="Set Cursor (Icon Pict).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Icon Pict).vi"/>
				<Item Name="Set Cursor (Cursor ID).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor (Cursor ID).vi"/>
				<Item Name="Set Cursor.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Set Cursor.vi"/>
				<Item Name="Unset Busy.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/cursorutil.llb/Unset Busy.vi"/>
			</Item>
			<Item Name="DOMUserDefRef.dll" Type="Document" URL="DOMUserDefRef.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="liblinxdevice.dll" Type="Document" URL="liblinxdevice.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="lvinput.dll" Type="Document" URL="/&lt;resource&gt;/lvinput.dll"/>
			<Item Name="mscorlib" Type="VI" URL="mscorlib">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivision.dll" Type="Document" URL="nivision.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivissvc.dll" Type="Document" URL="nivissvc.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="ArdnoFeed.vi" Type="VI" URL="../../lib/lib/Arduino/VIs/ArdnoFeed.vi"/>
			<Item Name="ArdnoPump.vi" Type="VI" URL="../../lib/lib/Arduino/VIs/ArdnoPump.vi"/>
			<Item Name="ArdnoFlush.vi" Type="VI" URL="../../lib/lib/Arduino/VIs/ArdnoFlush.vi"/>
			<Item Name="ConvertErrCodeToMessage.vi" Type="VI" URL="../../lib/lib/ANDOR/OwnVIs/ConvertErrCodeToMessage.vi"/>
			<Item Name="ArdnoAllValvesOpened.vi" Type="VI" URL="../../lib/lib/Arduino/VIs/ArdnoAllValvesOpened.vi"/>
			<Item Name="Connect.vi" Type="VI" URL="../../lib/TANGO Stage/SubVIs/Connect.vi"/>
			<Item Name="OlympusQuery.vi" Type="VI" URL="../../lib/lib/Olympus IX BX Series/OwnVIs/OlympusQuery.vi"/>
			<Item Name="TangoCalibrate.vi" Type="VI" URL="../../lib/lib/TANGO Stage/VIs/TangoCalibrate.vi"/>
			<Item Name="ArdnoValve2Linx.vi" Type="VI" URL="../../lib/lib/Arduino/VIs/ArdnoValve2Linx.vi"/>
			<Item Name="AxisControl.ctl" Type="VI" URL="../../lib/TANGO Stage/SubVIs/AxisControl.ctl"/>
			<Item Name="Axis_Switch.ctl" Type="VI" URL="../../lib/TANGO Stage/SubVIs/Axis_Switch.ctl"/>
			<Item Name="DequeueWithParameters.vi" Type="VI" URL="../../lib/TANGO Stage/SubVIs/DequeueWithParameters.vi"/>
			<Item Name="Timout_Operations.vi" Type="VI" URL="../../lib/TANGO Stage/SubVIs/Timout_Operations.vi"/>
			<Item Name="GetAnalogOutValues.vi" Type="VI" URL="../../lib/TANGO Stage/SubVIs/GetAnalogOutValues.vi"/>
			<Item Name="CheckLimitSwitches.vi" Type="VI" URL="../../lib/TANGO Stage/SubVIs/CheckLimitSwitches.vi"/>
			<Item Name="MaeanderDemo_Dlg.vi" Type="VI" URL="../../lib/TANGO Stage/SubVIs/MaeanderDemo_Dlg.vi"/>
			<Item Name="Maeander_Param.ctl" Type="VI" URL="../../lib/TANGO Stage/SubVIs/Maeander_Param.ctl"/>
			<Item Name="MaeanderDemo.vi" Type="VI" URL="../../lib/TANGO Stage/SubVIs/MaeanderDemo.vi"/>
			<Item Name="DialogSpeed.vi" Type="VI" URL="../../lib/TANGO Stage/SubVIs/DialogSpeed.vi"/>
			<Item Name="SequenceDemo_dlg.vi" Type="VI" URL="../../lib/TANGO Stage/SubVIs/SequenceDemo_dlg.vi"/>
			<Item Name="SequenceParam.ctl" Type="VI" URL="../../lib/TANGO Stage/SubVIs/SequenceParam.ctl"/>
			<Item Name="SequenceDemo.vi" Type="VI" URL="../../lib/TANGO Stage/SubVIs/SequenceDemo.vi"/>
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
				<Property Name="Source[1].itemID" Type="Ref"></Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/AndorOWN.lvlib/AndorCreaterErrorCluster.vi</Property>
				<Property Name="Source[2].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[2].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[2].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[2].properties[1].value" Type="Bool">true</Property>
				<Property Name="Source[2].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/AndorOWN.lvlib/AndorReturn2Error.vi</Property>
				<Property Name="Source[3].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[3].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[3].properties[1].type" Type="Str">Remove block diagram</Property>
				<Property Name="Source[3].properties[1].value" Type="Bool">true</Property>
				<Property Name="Source[3].propertiesCount" Type="Int">2</Property>
				<Property Name="Source[3].type" Type="Str">VI</Property>
				<Property Name="Source[4].itemID" Type="Ref"></Property>
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
