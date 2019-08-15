<?xml version='1.0' encoding='UTF-8'?>
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
		<Item Name="lib" Type="Folder" URL="../lib">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="V1.0_UI.vi" Type="VI" URL="../UI-Project/V1.0_UI.vi"/>
		<Item Name="V1.1_UI.vi" Type="VI" URL="../UI-Project/V1.1_UI.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="instr.lib" Type="Folder">
				<Item Name="Close.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Close.vi"/>
				<Item Name="Configure Filter Wheel.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Configure Filter Wheel.vi"/>
				<Item Name="Configure Jog.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/Universal Focus Control Unit (UFC)/Configure Jog.vi"/>
				<Item Name="Configure Lamp.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Configure Lamp.vi"/>
				<Item Name="Get AF Control Parameter.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/Active-Pasive Auto Focus Control Unit (A1M - P1M)/Get AF Control Parameter.vi"/>
				<Item Name="Get Limit Status.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Action - Status/Get Limit Status.vi"/>
				<Item Name="Get Movement Status.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Action - Status/Get Movement Status.vi"/>
				<Item Name="Initialize.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Initialize.vi"/>
				<Item Name="Lamp Enabled.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Lamp Enabled.vi"/>
				<Item Name="Login Device.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Action - Status/Login Device.vi"/>
				<Item Name="Logout Device.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Action - Status/Logout Device.vi"/>
				<Item Name="Move Focusing Unit.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Action - Status/Move Focusing Unit.vi"/>
				<Item Name="Move To Start Position Enabled.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Action - Status/Move To Start Position Enabled.vi"/>
				<Item Name="Olympus Command.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Private/Olympus Command.vi"/>
				<Item Name="Olympus IX BX Series.lvlib" Type="Library" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Olympus IX BX Series.lvlib"/>
				<Item Name="Origin Initialization.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Action - Status/Origin Initialization.vi"/>
				<Item Name="Select Filter Wheel.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Select Filter Wheel.vi"/>
				<Item Name="Select Lamp.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Select Lamp.vi"/>
				<Item Name="Select Prism.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Select Prism.vi"/>
				<Item Name="Set Active Objective.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Set Active Objective.vi"/>
				<Item Name="Set Lamp intensity.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Set Lamp intensity.vi"/>
				<Item Name="Set Shutter Status Extended.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Set Shutter Status Extended.vi"/>
				<Item Name="Set Software Limits.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Public/Configure/Universal Focus Control Unit (UFC)/Set Software Limits.vi"/>
			</Item>
			<Item Name="user.lib" Type="Folder">
				<Item Name="Andor SDK.lvlib" Type="Library" URL="/&lt;userlib&gt;/Andor SDK/Andor SDK.lvlib"/>
				<Item Name="SYSTEMTIME structure typedef.ctl" Type="VI" URL="/&lt;userlib&gt;/atmcd32d.llb/SYSTEMTIME structure typedef.ctl"/>
				<Item Name="Tango_DLL.lvlib" Type="Library" URL="/&lt;userlib&gt;/TANGO_DLL/Tango_DLL.lvlib"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Acquire Input Data.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Acquire Input Data.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Close Input Device.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Close Input Device.vi"/>
				<Item Name="Close.vi" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Hacker/LINX/Public/Close.vi"/>
				<Item Name="closeJoystick.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeJoystick.vi"/>
				<Item Name="closeKeyboard.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeKeyboard.vi"/>
				<Item Name="closeMouse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeMouse.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Digital Write 1 Chan.vi" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Hacker/LINX/Public/Peripherals/Digital/Digital Write 1 Chan.vi"/>
				<Item Name="Digital Write N Chans.vi" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Hacker/LINX/Public/Peripherals/Digital/Digital Write N Chans.vi"/>
				<Item Name="Digital Write.vi" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Hacker/LINX/Public/Peripherals/Digital/Digital Write.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrorDescriptions.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/ErrorDescriptions.vi"/>
				<Item Name="errorList.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/errorList.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Image Type" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/Image Type"/>
				<Item Name="IMAQ ArrayToImage" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ ArrayToImage"/>
				<Item Name="IMAQ Create" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Create"/>
				<Item Name="IMAQ GetImageSize" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ GetImageSize"/>
				<Item Name="IMAQ Image.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Image.ctl"/>
				<Item Name="Initialize.vi" Type="VI" URL="/&lt;vilib&gt;/LabVIEW Hacker/LINX/Public/Initialize.vi"/>
				<Item Name="Intialize Keyboard.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Intialize Keyboard.vi"/>
				<Item Name="joystickAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/joystickAcquire.vi"/>
				<Item Name="keyboardAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/keyboardAcquire.vi"/>
				<Item Name="LMH-LINX.lvlib" Type="Library" URL="/&lt;vilib&gt;/MakerHub/LINX/LMH-LINX.lvlib"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="mouseAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/mouseAcquire.vi"/>
				<Item Name="NI_Vision_Development_Module.lvlib" Type="Library" URL="/&lt;vilib&gt;/vision/NI_Vision_Development_Module.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Reset myRIO.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Utilities/vis/Reset myRIO.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Smart Open.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Onboard IO/DIO/vis/Smart Open.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="VISA Find Search Mode.ctl" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Find Search Mode.ctl"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Write.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Onboard IO/DIO/vis/Write.vi"/>
			</Item>
			<Item Name="AndorCapabilities typedef.ctl" Type="VI" URL="../lib/ANDOR/Libraries/atmcd32d/AndorCapabilities typedef.ctl"/>
			<Item Name="AndorCreaterErrorCluster.vi" Type="VI" URL="../UI-Project/AndorCreaterErrorCluster.vi"/>
			<Item Name="AndorLiveMode.vi" Type="VI" URL="../UI-Project/AndorLiveMode.vi"/>
			<Item Name="CalibrateTANGO.vi" Type="VI" URL="../UI-Project/CalibrateTANGO.vi"/>
			<Item Name="CameraError2MultiList.vi" Type="VI" URL="../lib/ANDOR/OwnVIs/CameraError2MultiList.vi"/>
			<Item Name="Channel2Valves.vi" Type="VI" URL="../lib/Arduino/VIs/Channel2Valves.vi"/>
			<Item Name="Close.vi" Type="VI" URL="../lib/Olympus IX BX Series/OwnVIs/lib/Olympus IX BX Series/Public/Close.vi"/>
			<Item Name="Close.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Close.vi"/>
			<Item Name="Configure Jog.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Configure/Universal Focus Control Unit (UFC)/Configure Jog.vi"/>
			<Item Name="Configure Lamp.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Configure Lamp.vi"/>
			<Item Name="Connect.vi" Type="VI" URL="../lib/Tango/VIs/lib/Tango/SubVIs/Connect.vi"/>
			<Item Name="ConvertErrCodeToMessage.vi" Type="VI" URL="../UI-Project/lib/ANDOR/Andor SDK/ConvertErrCodeToMessage.vi"/>
			<Item Name="Error Code Enum typedef.ctl" Type="VI" URL="../lib/ANDOR/Libraries/atmcd32d/Error Code Enum typedef.ctl"/>
			<Item Name="Feed.vi" Type="VI" URL="../UI-Project/Feed.vi"/>
			<Item Name="Flush.vi" Type="VI" URL="../UI-Project/Flush.vi"/>
			<Item Name="Initialize.vi" Type="VI" URL="../lib/Olympus IX BX Series/OwnVIs/lib/Olympus IX BX Series/Public/Initialize.vi"/>
			<Item Name="Initialize.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Initialize.vi"/>
			<Item Name="liblinxdevice.dll" Type="Document" URL="liblinxdevice.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="lm Color Enable.vi" Type="VI" URL="../UI-Project/lib/SOLA/LabVIEW 2015 Library (32bit)/LumencorDLL32/VIs/lm Color Enable.vi"/>
			<Item Name="lm Color Level.vi" Type="VI" URL="../lib/ANDOR/OwnVIs/lib/SOLA/LabVIEW 2015 Library (32bit)/LumencorDLL32/VIs/lm Color Level.vi"/>
			<Item Name="lm Color Level.vi" Type="VI" URL="../UI-Project/lib/SOLA/LabVIEW 2015 Library (32bit)/LumencorDLL32/VIs/lm Color Level.vi"/>
			<Item Name="lm Init.vi" Type="VI" URL="../lib/ANDOR/OwnVIs/lib/SOLA/LabVIEW 2015 Library (32bit)/LumencorDLL32/VIs/lm Init.vi"/>
			<Item Name="lm Init.vi" Type="VI" URL="../UI-Project/lib/SOLA/LabVIEW 2015 Library (32bit)/LumencorDLL32/VIs/lm Init.vi"/>
			<Item Name="lm Shut Down.vi" Type="VI" URL="../lib/ANDOR/OwnVIs/lib/SOLA/LabVIEW 2015 Library (32bit)/LumencorDLL32/VIs/lm Shut Down.vi"/>
			<Item Name="lm Shut Down.vi" Type="VI" URL="../UI-Project/lib/SOLA/LabVIEW 2015 Library (32bit)/LumencorDLL32/VIs/lm Shut Down.vi"/>
			<Item Name="Login Device.vi" Type="VI" URL="../lib/Olympus IX BX Series/OwnVIs/lib/Olympus IX BX Series/Public/Action - Status/Login Device.vi"/>
			<Item Name="Login Device.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Action - Status/Login Device.vi"/>
			<Item Name="Logout Device.vi" Type="VI" URL="../lib/Olympus IX BX Series/OwnVIs/lib/Olympus IX BX Series/Public/Action - Status/Logout Device.vi"/>
			<Item Name="Logout Device.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Action - Status/Logout Device.vi"/>
			<Item Name="lvinput.dll" Type="Document" URL="/&lt;resource&gt;/lvinput.dll"/>
			<Item Name="Move Focusing Unit.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Action - Status/Move Focusing Unit.vi"/>
			<Item Name="nivision.dll" Type="Document" URL="nivision.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivissvc.dll" Type="Document" URL="nivissvc.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Olympus Command.vi" Type="VI" URL="../lib/Olympus IX BX Series/Private/Olympus Command.vi"/>
			<Item Name="Positions2MultiList.vi" Type="VI" URL="../UI-Project/Positions2MultiList.vi"/>
			<Item Name="Pump.vi" Type="VI" URL="../UI-Project/Pump.vi"/>
			<Item Name="Query_Olympus_wo_Login.vi" Type="VI" URL="../UI-Project/Query_Olympus_wo_Login.vi"/>
			<Item Name="Select Filter Wheel.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Select Filter Wheel.vi"/>
			<Item Name="Select Prism.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Select Prism.vi"/>
			<Item Name="Set Active Objective.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Set Active Objective.vi"/>
			<Item Name="Set Lamp intensity.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Set Lamp intensity.vi"/>
			<Item Name="Set Shutter Status Extended.vi" Type="VI" URL="../UI-Project/lib/Olympus IX BX Series/Public/Configure/BX2A - IX2 Frame Control Unit/Set Shutter Status Extended.vi"/>
			<Item Name="ShamrockCIF.dll" Type="Document" URL="ShamrockCIF.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="TangoConnectSub.vi" Type="VI" URL="../UI-Project/TangoConnectSub.vi"/>
			<Item Name="Valves2Linx.vi" Type="VI" URL="../lib/Arduino/VIs/Valves2Linx.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
