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
		<Item Name="VIs" Type="Folder" URL="../VIs">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Connect.vi" Type="VI" URL="../../lib/Tango/SubVIs/Connect.vi"/>
		<Item Name="Olympus IX BX Series.lvlib" Type="Library" URL="../../lib/Olympus IX BX Series/Olympus IX BX Series.lvlib"/>
		<Item Name="TangoConnect.vi" Type="VI" URL="../../lib/Tango/VIs/TangoConnect.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="instr.lib" Type="Folder">
				<Item Name="Olympus Command.vi" Type="VI" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Private/Olympus Command.vi"/>
				<Item Name="Olympus IX BX Series.lvlib" Type="Library" URL="/&lt;instrlib&gt;/Olympus IX BX Series/Olympus IX BX Series.lvlib"/>
			</Item>
			<Item Name="user.lib" Type="Folder">
				<Item Name="Andor SDK.lvlib" Type="Library" URL="/&lt;userlib&gt;/Andor SDK/Andor SDK.lvlib"/>
				<Item Name="Tango_DLL.lvlib" Type="Library" URL="/&lt;userlib&gt;/TANGO_DLL/Tango_DLL.lvlib"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Acquire Input Data.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Acquire Input Data.vi"/>
				<Item Name="Close Input Device.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Close Input Device.vi"/>
				<Item Name="closeJoystick.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeJoystick.vi"/>
				<Item Name="closeKeyboard.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeKeyboard.vi"/>
				<Item Name="closeMouse.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/closeMouse.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="ErrorDescriptions.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/ErrorDescriptions.vi"/>
				<Item Name="errorList.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/errorList.vi"/>
				<Item Name="Image Type" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/Image Type"/>
				<Item Name="IMAQ ArrayToImage" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ ArrayToImage"/>
				<Item Name="IMAQ Create" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Create"/>
				<Item Name="IMAQ GetImageSize" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ GetImageSize"/>
				<Item Name="IMAQ Image.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Image.ctl"/>
				<Item Name="Intialize Keyboard.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/Intialize Keyboard.vi"/>
				<Item Name="joystickAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/joystickAcquire.vi"/>
				<Item Name="keyboardAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/keyboardAcquire.vi"/>
				<Item Name="LMH-LINX.lvlib" Type="Library" URL="/&lt;vilib&gt;/MakerHub/LINX/LMH-LINX.lvlib"/>
				<Item Name="mouseAcquire.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/inputDevices.llb/mouseAcquire.vi"/>
				<Item Name="NI_Vision_Development_Module.lvlib" Type="Library" URL="/&lt;vilib&gt;/vision/NI_Vision_Development_Module.lvlib"/>
				<Item Name="Reset myRIO.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Utilities/vis/Reset myRIO.vi"/>
				<Item Name="Smart Open.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Onboard IO/DIO/vis/Smart Open.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Write.vi" Type="VI" URL="/&lt;vilib&gt;/myRIO/Instrument Drivers/Onboard IO/DIO/vis/Write.vi"/>
			</Item>
			<Item Name="AndorCreaterErrorCluster.vi" Type="VI" URL="../../lib/ANDOR/OwnVIs/AndorCreaterErrorCluster.vi"/>
			<Item Name="AndorLiveMode.vi" Type="VI" URL="../../lib/ANDOR/OwnVIs/AndorLiveMode.vi"/>
			<Item Name="ArdnoChannel2Valves.vi" Type="VI" URL="../../lib/Arduino/VIs/ArdnoChannel2Valves.vi"/>
			<Item Name="ArdnoFeed.vi" Type="VI" URL="../../lib/Arduino/VIs/ArdnoFeed.vi"/>
			<Item Name="ArdnoFlush.vi" Type="VI" URL="../../lib/Arduino/VIs/ArdnoFlush.vi"/>
			<Item Name="ArdnoPump.vi" Type="VI" URL="../../lib/Arduino/VIs/ArdnoPump.vi"/>
			<Item Name="ArdnoValve2Linx.vi" Type="VI" URL="../../lib/Arduino/VIs/ArdnoValve2Linx.vi"/>
			<Item Name="ConvertErrCodeToMessage.vi" Type="VI" URL="../../lib/ANDOR/OwnVIs/ConvertErrCodeToMessage.vi"/>
			<Item Name="liblinxdevice.dll" Type="Document" URL="liblinxdevice.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="LumencorDLL32.dll" Type="Document" URL="../../lib/SOLA/LabVIEW 2015 Library (32bit)/LumencorDLL32/LumencorDLL32.dll"/>
			<Item Name="LumencorDLL32.lvlib" Type="Library" URL="../../lib/SOLA/LabVIEW 2015 Library (32bit)/LumencorDLL32/LumencorDLL32.lvlib"/>
			<Item Name="lvinput.dll" Type="Document" URL="/&lt;resource&gt;/lvinput.dll"/>
			<Item Name="nivision.dll" Type="Document" URL="nivision.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivissvc.dll" Type="Document" URL="nivissvc.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Olympus Command.vi" Type="VI" URL="../../lib/Olympus IX BX Series/Private/Olympus Command.vi"/>
			<Item Name="OlympusQuery.vi" Type="VI" URL="../../lib/Olympus IX BX Series/OwnVIs/OlympusQuery.vi"/>
			<Item Name="TangoCalibrate.vi" Type="VI" URL="../../lib/Tango/VIs/TangoCalibrate.vi"/>
			<Item Name="TangoConnectSub.vi" Type="VI" URL="../../lib/Tango/VIs/TangoConnectSub.vi"/>
			<Item Name="TangoPositions2MultiList.vi" Type="VI" URL="../../lib/Tango/VIs/TangoPositions2MultiList.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
