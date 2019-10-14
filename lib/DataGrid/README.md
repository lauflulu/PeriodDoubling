<h1>Description</h1>

The DataGrid inherits from and extends the Multicolumn Listbox control.  It implements the developer requirements of assigning a data type to each column.  It then forces the user to enter data through those data types.

The data types are defined by a dialog that is invoked during edit time by a right-click menu option.

<h1>LabVIEW Version</h1>

This code is currently published in LabVIEW 2018

<h1>Build Instructions</h1>

The DataGrid is a QControl and requires the QControl Toolkit, available here: <a href="http://bit.ly/QControlNITools">http://bit.ly/QControlNITools.</a>

Included in the source is the <b>\\DataGrid Configuration\DataGrid Configuration.vipb</b> file.  This file is used by the VI Package Manager (VIPM) to build a package that can then be distributed.  Follow the instructions from JKI on how to use VIPM: <a href="https://vipm.jki.net/">https://vipm.jki.net/</a>

The <b>DataGrid.lvclass</b> and all its members can be distributed as a Class Library and built into the using application.


<h1>Installation Guide</h1>

This DataGrid Configuration is meant to be installed as a VIPM Package.  

Manual installation is not recommended but can be accomplished by putting the right files in the right locations within the LabVIEW folder.
<ul><li>The file <b>\DataGrid Configuration\DataGrid Config.llb</b> must be copied to copy to: <i>[LabVIEW]\resource\plugins\PopupMenus\edit time panel and diagram</i>
<li>All of the rest of the code from the <b>DataGrid Configuration</b> folder must be copied to: <i>[LabVIEW]\vi.lib\QSI\DataGrid Configuration</i></ul>

After copying the files, the files in the <b>\DataGrid Configuration\DataGrid Config.llb</b> will need to be opened, re-linked, and saved.

<b>CAUTION: After copying avoid linking back to the source.  It is best to uninstall the toolbar while working on the source.  Otherwise cross-linking could occur.</b>

The <b>DataGrid.lvclass</b> and all its members can be distributed as a Class Library and built into the using application.

<h1>Execution</h1>
The edit time behavior is defined by a right-click menu plugin. The right-click menu invokes a dialog that allows the developer to add/remove columns, move column up/down (left/right), and choose column data type. In the dialog further custom configuration for each data type is also displayed.

<h1>Support</h1>
Submit Issues or Merge Requests through GitLab.