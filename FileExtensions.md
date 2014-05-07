LabView File Extensions and descriptions

.aliases - File that maps targets to URLs. The URL varies by target. Usually, the URL for a target on a network is an IP address. Targets on serial ports display the URL as the serial port. LabVIEW creates the file automatically when you create a LabVIEW project. If you build an application, the .aliases file is copied into the application. LabVIEW creates a new .aliases file each time you open the project. You do not need to check the .aliases file into source control.
.bin3	 - File to include example VIs in NI Example Finder
.ctl	 - Control
.ctt	 - Control template
.llb	 - VI library. You can group several VIs together and save them in an LLB.
.lvclass - LabVIEW Class library. When you create and save a LabVIEW class, LabVIEW creates a class library file that defines a new data type.
.lvlib	 - LabVIEW project library. LabVIEW project libraries are collections of VIs, type definitions, shared variables, palette files, and other files, including other project libraries.
.lvm	 - The text-based measurement file is a tab-delimited text file you can open with a spreadsheet application or a text-editing application.
.lvproj	 - LabVIEW project
.lvlps	 - File that stores project settings that are specific to the local machine. You should not check .lvlps files into source control because .lvlps files contain settings specific to the computer you are using; for example, .lvlps files contain the local source code control configuration. LabVIEW saves .lvlps files when you save a project, and correctly renames the file when you rename a project. You can remove or delete .lvlps files without affecting the performance or behavior of a project because .lvlps files only contain project settings specific to the local machine. If you build an application, LabVIEW does not copy the .lvlps file into the built application.
.mnu	 - Palette
.rc	 - Configuration file used to store Property Node information for IVI Instrument Drivers and define refnum data types for instrument drivers.
.rtm	 - Run-time menu
.tdm	 - The .tdm file uses an XML-based format to store waveform properties and links to a binary file that contains waveform data.
.vi	 - Virtual instrument
.vit	 - Virtual instrument template
.xctl	 - XControl
.xnode	 - File used internally by LabVIEW. If you create a LabVIEW project that includes VIs that require .xnode files, the .xnode files appear under Dependencies in the Project Explorer window. You cannot modify .xnode files, so .xnode files are locked in the Project Explorer window.