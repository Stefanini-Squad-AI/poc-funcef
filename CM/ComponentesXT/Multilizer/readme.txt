Welcome to MULTILIZER
---------------------

This file contains the version history of MULTILIZER.

The following table contains the sub directories of MULTILIZER directory:

Subdir     Describtion
---------- --------------------------------
CBuilder1  C++Builder 1.0 components, online help and samples
CBuilder3  C++Builder 3.0 components, online help and samples
CBuilder4  C++Builder 4.0 components, online help and samples
CBuilder5  C++Builder 5.0 components, online help and samples
Delphi1    Delphi 1.0 components, online help and samples
Delphi2    Delphi 2.0 components, online help and samples
Delphi3    Delphi 3.0 components, online help and samples
Delphi4    Delphi 4.0 components, online help and samples
Delphi5    Delphi 5.0 components, online help and samples
Docs       Documentation
DS         Dictionary Server
Java       Java components, documentation and samples
LM         Language Manager
VB16       16-bit Visual Basic components, online help and samples
VB32       32-bit Visual Basic components, online help and samples
WAP        WAP documentation and samples
WFC        WFC components, documentation and samples
WIN        Windows documentation and samples

Depending on your license and setup type you might not have all the sub
directories.


1) MULTILIZER Language Manager (LM)
-----------------------------------

The current version is 4.0.69

New features:

4.0.69 - LM could not save Unicode coded MLD files.
       - LM raised an exception when the user tried to changed the active
         language 
4.0.67 - LM uses relative path name even if the file is not a sub dir of
         the project dir.
4.0.66 - ISOToNLS.txt included into the EXE file.
       - It is possible to add a new language into a deployed dictionary.
4.0.64 - C++Builder 5 support.
4.0.62 - DSTP 1.1 support.
4.0.53 - When Delphi 1 or 16-bit VB is used, cuts the translation that 
         are longer that 255 characters
4.0.49 - Scans the strings of THeader control
4.0.47 - UTF-8 support
4.0.46 - Better checking for the property file locale
       - Ignores the commentents (#) on the property file.
       - Ignores the empty ("" or "=") property file lines.
       - Context sensitive resource strings. The resource string is
         identified by the string id and the native value.
4.0.45 - A character set can be assigned to the native column of the custom
         glossary. This makes it possible to render correctly none ASCII
         native strings.
4.0.41 - Message string format checking improved to cover Delphi and Java.
4.0.39 - You can specify the character set of the native column.
       - Incomplete string checking improved.
4.0.36 - Raize Components suppoer added.
       - New map file formt ensures that the map file format is always up to date.
4.0.35 - InfoPower include strings removed. LM scans the strings form the DFM files.
       - LM scans the Selected property of TwwDBGrid and TwwLookupDialog.
4.0.34 - Text DFM scanning added. Use this version with Delphi 5.
4.0.33 - Painting of the grid improved.
       - If the original dictionary is a binary dictionary then the exchanged
         dictionary has the same name and the same amount of languages.
         However, all languages except the exchanged are disabled. This means
         that they are not visible and can not be edited.
4.0.32 - Import feature improved to be much faster.
4.0.30 - LM can scan custom ListView and TreeView components.
4.0.24 - LM and LM for BDE combined.
4.0.15 - LM does not automatically scan the Name property of the TFont object.
       - LM does not automatically scan the resource string of the application.
         You have to manually add the scan file to enable the resource string
         scanning.
4.0.14 - Sorting improved. Symbol characters (e.g. &) are ignored.
4.0.12 - Scanning performance inproved
4.0.11 - Support for distributed dictionaries added.
4.0.10 - LM and LM for ODBC combined. Two LM versions still remain: LM, and LM
         for BDE.
       - Translator's Manual can added to the exhange package.
4.0.8  - Opens Microsoft Glossary file (CSV) as read only.
       - Glossary translation speed increased considerably.
       - Improved glossary files.
4.0.7  - Java's property resource bundle support
       - Supports both UTF-16LE and UTF-16BE Unicode file formats.
       - Drag and drop added to the language dialog to make easier to select
         new languages.
       - Dictionary Wizard can create a new project file (LMP) from the old
         dictionary data (MLD, TXT).
       - Dictionary Wizard automatically generates teh right Scan Files from
         the DPR file when a dictionary project for Delphi is created.
4.0.6  - HTML support
4.0.4  - You can make LM to extract all but tagged strings from the source code
4.0.2  - LM removed automatically those rows that are unused
         (=not found from the source code) and have been not translated.
         Also LM removes unused duplicate rows.
4.0.0  - LM is multilingual
       - Context sensitive dictionaries
       - MLTP 1.0 support
       - Glossaries
       - Printing support
       - WFC support
       - Multiline cells
       - Improved scanning options
3.0.19 - Supports MLD version 3 (Language contains the Charset property)
3.0.18 - JBuilder support added. LM can scan the string from the initForm
         (VJ++) and from the jbInit (JB) function without tagging the strings.
3.0.17 - Visual J++ support added
3.0.14 - LM does not include string that contains tab, line feed, or carriage
         return characters to a text dictionary.
3.0.8  - Resource string scanning added.
3.0.7  - Language Manager for BDE 3 removed.
         LM for BDE requires now BDE 4 or later.
3.0.6  - Name changed to MULTILIZER Language Manager
       - Three versions available:
         1) Language Manager. Single exe, not setup required.
         2) Language Manager for BDE. Requires BDE.
         3) Language Manager for ODBC. Requires ODBC.
       - Include strings are now stored in a text files. You can add your own
         custom include string files
       - Master database can be stored either in
         1) a local binary file (MLM)
         2) a database (LM for BDE and LM for ODBC)
       - Deploy Wizard added. This makes it possible to send the dictionary
         and LM to your translator.
3.0.4  - DE can scan pure text files as well.
       - DE for BDE can not access databases directly througs ODBC but uses
         only BDE.

Bug corrections:

4.0.63 - LM failed to save a server dictionary properly to DS 1.2.
4.0.58 - LM reported an error when trying to scan a textula DFM file
         containing a long TMemo lines.
4.0.57 - LM contained two location of every string from the Java's
         property files.
4.0.56 - LM coded the carriage return + line feed in the text dictionary
         incorrectly to #L#C when it should have been #C#L.
4.0.55 - LM could not read the second (or later) location from the map file.
4.0.51 - LM failed to scan the Java initialization function if the following
         code style was used:
         public void jbInit() {
           ...
         }
         LM required
         public void jbInit()
         {
           ...
         }
4.0.43 - BDE glossary sometimes reported an exception when saving the
         glossary.
4.0.42 - Adding a Multilizer Glossary File (MLM) to the glossary file failed:
         "Can not focus a disabled..."
       - LM hanged or reported an exception on some Microsoft Glossary files
         when Translate | Using Glossries was selected
4.0.38 - LM failed to scan textual DFM files that contained long strings.
         LM hanged in the inifinite loop.    
       - LM failed to scan the STRINGTABLE if the tag was written in lower
         case characters (e.g. "stringtable").
4.0.37 - If the native language contained one ASCII characters the Language
         dialog did not show the Native language. This caused the native 
         langauge to be removed when a new language was added.
4.0.35 - LM scans properly the VB strings containing " characters.
4.0.33 - LM could only edit property files that were in the main directory
4.0.32 - Exporting Unicode (Java) dictionaries failed
4.0.31 - Having PDCLIB32.DLL on a library path caused runtime error 217
4.0.30 - LM caused an access violation when the user tried to print all pages.
       - The Language dialog did not make any difference between "Korean" and
         "Korean, Johab" languages.
       - The exchanged dictionary lost the screen shot information attached
         to it.
4.0.28 - LM failed to detect the scan targets of the collection items properly.
         LM either scanned every strings from the collection item or none.
4.0.27 - If the exchanged package were crated using Windows 9x and the package
         was copied on the root dir the following error occured:
         "C:\\name.lm1 does not exist"
4.0.24 - The font dialog failed to show correctly the font names of the far
         eastern font.
4.0.23 - LM failed to scan every second resource string in the RC file. 
4.0.22 - Dictionary Wizard could not create a new project from the the existing 
         database dictionary.
4.0.20 - LM failed to start on a system having ODBC version 2.5 or earlier.
         Runtime error 217 was reported. This has been fixed.
         LM works also on ODBC 2.5.
4.0.17 - LM lost the string context of the distributed Java dictionaries.
4.0.16 - Sorting fixed to make difference between &xxx and xxx
         (e.g. &File and File)
4.0.13 - WFC: Extracts only those string specified by the scan targets.
4.0.11 - After using IME LM did not show the cell value properly but the string
         was drawn usig the Ansi character set instead of the native character 
         set.
4.0.10 - The Next button of th Export Wizard was sometimes initially disabled
4.0.7  - Printing of the current page failed
       - Resource file scan file did not stick its values
4.0.6  - LM could not always add new items to the glossary.
       - The OK button of Custom locale dialog box was sometimes disabled.
       - Paste works properly also when some other page but All-page is
         turned on.
       - LM hanged of the length of MLTP message was exactly 256 bytes
       - If the LM project file was in the root directory (e.g. a:\) LM could
         not other the project if run on Windows 95 or 98.
         "Can not open file A:\\test.mld" error message was prompted.
4.0.3  - Grid showed some extra characters in the end of the Far Eastern
         strings. This has been fixed.
4.0.2  - The type of the deployed dictionary matches the original dictionary
         (flat or context sensitive)
       - Language Manager raised an Registry exeption if it was originally
         installed by Administrator user and started by a User user.
       - The language cut off some of the multiline cells.
         This has been corrected.
4.0.0  - Translate and Fill Test features do not translate any more those rows
         that have been marked do not translate.
3.0.19 - A tab character does not raise an exception after editing the cell.
3.0.16 - Deployed dictionary contained sometimes empty native string.
         This has been corrected.
3.0.15 - When making a deploying package in 95/98 one of the deploy packages
         got corrupted. This disabled the opening of the dictionary project.
         This has been corrected.
3.0.14 - Pressing right Ctrl does not clear cell any more
       - "Invalid support data" error fixed in the deploy package (Windows95)
3.0.13 - Add to master works also with locale master dictionaries
3.0.12 - Master Dictionary can be save to any BDE database
3.0.11 - Source code scanning improved to accept all kinds of ObjectPascal 
         comments.
3.0.10 - Deploy Wizard includes the correct map file.
3.0.9  - License bug corrected. 3.0.8 failed to run as a professional license.
         It was standard always.
3.0.4  - STRINGTABLE of resource files are correctly scanned.
       - Resource files can use { and } instead of BEGIN and END.
       - Saves properly Paradox and dBases dictionaries.
       - Dictionary sometimes corrupted when the user added test language.
         This bug has been corrected.
       - DE for BDE does not require ODBC32.DLL any more.
       - If one ore more language column was hidden the editing cell was
         missplaced.
3.0.3  - Master dictionary can be save to another Alias/Data source
3.0.2  - Can create Access databases trough BDE
3.0.1  - Author level user can create/edit MDS user ids.


2) MULTILIZER VCL Edition
-------------------------

The current version is 4.2.19

New features:

4.2.19 - 
4.2.17 - TIvCustomDictionary.Find made public
4.2.15 - C++Builder 5 support.
       - Raize Controls 2.5 support.
       - ivtoForceCharsetChange item added to TIvTranslator.Options
       - Full QuickReport support added.
4.2.10 - Delphi 1 use heap to store the index and active translation
         of TIvBinaryDicitonary and TIvTextDicitonary components.
         This makes it possible to handle very large dictionaries.
4.2.8  - UTF-8 support in TIvTextDictionary.
4.2.7  - ML translates automatically strings returned from the LoadStr
         function. This works only when the runtime packages are not used.
       - Context sensitive resource strings.
       - Inhereted language columns. If the dictionary contains a language
         and a sublanguage (e.g. English and English (UK)) and the sub
         language misses the translation the dictionary uses the string
         in the (super)language.
4.2.6  - ivtoTranslateOCX flag added to the TIvTranslator.Options property.
4.2.3  - Tested with TDBScroll component.
       - If the uses set the Storage property to ivsEmbedded or ivsResource
         ML informs the user how to update the dictionary data.
4.2.1  - Help system improved:
         * CNT files customized for each compiler version.
         * Help merging automatized.
         * 16-bit online help added.
4.2.0  - Delphi 5 support.
       - TIvRaizeModule added.
       - ML copes with the automatic hotkeys mapping of VCL 5.
4.1.21 - TIvInfoPowerModule added.
       - Comments added to the TARGETS.TXT.
4.1.20 - ivrChartset added to TIvRestriction.
4.1.19 - TIv1stClassModule added.
4.1.12 - The dictionary of the translator can be change even after the
         translation is bound.
4.1.11 - Module consept added.
         TIvControlModule and TIvChartModule component added.
4.1.6  - About box included in the desing time.
4.1.0  - C++Builder 4.0 support. C++Builder 4 package is IvML45.bpk.
       - MLD version 3 support.
       - Context sensitive dictionaries.
       - The native language can be any language.
       - InitialLayout property added TIvTranslator.
       - TIvExdendedTranslator translates the fixed cells of TStringGrid.
4.0.5  - TIvFileDictionary, TIvEmbeddedDictionary and TIvUnicodeDictionary
         has been combined into TIvTextDictionary.
       - TIvFileDictionary can read dictionary data from resource as well.
       - TIvBinaryDictionary and TIvEmbeddedBinaryDictionary 
         has been combined into TIvBinaryDictionary.
       - TIvBinaryDictionary can read dictionary data from resource as well.
       - TIvEmbeddedDictionary, TIvUnicodeDictionary and
         TIvEmbeddedBinaryDictionary components exist for backward combability,
         but they are not registered by default and they exist on "ML Old"
         palette.
4.0.0  - Delphi 4 support. Delphi 4 package is IvML40.dpk
       - Registration of common dialog components moved to IvDlgReg unit
       - Registration of bidirectional components moved to IvBidReg unit
       - Translating of resource strings implemented
       - Binding property added to TIvDictionary

3.0.6  - Name changed to MULTILIZER for VCL
       - Registation of TIvODBCDictionary moved to IvODBCReg unit
       - C++Builder package renamed from IvMLC30 to IvML35
3.0.4  - Margins properties added to TIvPageSetupDialog

Bug corrections:

4.2.18 - ML caused an application error when a TIvDialogModele was on
         a data module.
4.2.16 - If TIvTextDictionary.Storage was ivsResource the dictionary
         failed to read the dictionary data and reported an exception.
4.2.14 - When TIvServerDictionary was used not all UI items we translated.
       - When ML tranlslated a TStringList whar had the Sorted property
         set true the object raised an exception "Oparation not allowed ..."
4.2.13 - TIvParser.CodeStr coded carriager return and line feed
         incorrectly.
4.2.12 - TIvBinaryDictionary raised an exception in Delphi 1 if the
         translation length was greater than 255.
4.2.11 - If a component contained a reference to another component not
         owner by the form, TIvTranslator caused an indefinite recursion
         when translation the form. This caused a stack overflow.
4.2.9  - TIvDictionary raised the
         'The Multilizer Configuration is corrupted...' exception when
         Stream.WriteComponent(Dictionary);
         was called on run time.
4.2.7  - ML failed to translate TStrings when the TIvServerDictionary was used
         and the proscanning state was on.
4.2.5  - Delphi 5: ML did not translate the menu items correctly if they
         contained hotkeys (&).
       - Setting of the TIvLanguage.CodePage property did not update
         the TIvLanguage.Charset property if the Charset already had 
         value.
4.2.2  - TIvLanguage.PrimaryEquals did not properly compared netural
         language (=Primary = 0).
4.2.0  - Memory leaks fixed in the TIvModule.
4.1.21 - System menu of a MDI application got translated wrongly.
4.1.19 - The application crashed of the common dialog component did not
         have an owner and TIvDialogModule was used.
4.1.17 - If the MDI application had one child and it was maximized, the 
         active language was changed and the child was normalized again,
         the position and size of the child was wrong.
         Thanks Daniel!
4.1.16 - The font mapping was wrong in the Far Eastern languages on 
         Delphi 2 and C++Builder 1 application.
         ML used 'System' instead of 'MS Sans Serif'. This caused the form
         using too large font.
4.1.13 - If ML tried to change the font character set of TWinControl based
         component that had no handle allocated, an error was raised.
4.1.10 - The dicitonary did not find all the flat string if the context
         sensitive dictionary was used.
         The result was the TIvDictionary.Translate could not always transate
         the string (if it contained the context information)
4.1.9  - The language.Charset value of MLD version 2 dictionaries got corrupted
         when the dictionary was opened.
4.1.8  - The Font.Charset property of the TWinControls was not properly updated.
4.1.7  - Retranslation of child form failed after one retranslation.
4.1.5  - Context sensitive dictionaries did not work properly when inherited
         form were used. The translator translated in a flat way all but
         the topmost form in the inheritance chain.
       - The Help button on common dialog components did not launch help.
       - Inserting of the TTable component on a form that contained the
         TIvTranslator raised an exception.
4.1.4  - The context sensitive dictionaries did not work on TIvODBCDictionary
4.1.3  - The context sensitive dictionaries did not work on TIvDBDictionary
       - If the language changes when a MDI child windows has been maximized ML 
         properly restores the minimized and maximized buttons.
         Note! The close button looks grayed but it is in fact enabled.
4.1.2  - The automatic resource string translation did not work if there was
         more than one dictionary component creared. This has been corrected.
4.1.1  - The default language used to be the first none native language of the
         dictionary. This caused troubles when the language was not compatible
         to the current code page. Now the default language is the first
         compatible language. Default language is used when the dicitonary
         does not support the current locale.
4.1.0  - If the embedded dictionary contained a string that was longer that 255
         characters, the dictionary raised "Could not find the property" when
         trying to open the dictionary. This has been corrected.
       - After language chnage the multiple selections of TListBox and the
         multiple checks of TCheckListBox was cleared. This has been corrected.
4.0.6  - If the native column of a TIvBinaryDictionary contained none-ASCII
         characters the opening of the dictionary failed.
         This has been corrected.
4.0.4  - The Locale property of language was invalid when the primary language
         was LANG_NEUTRAL. This has been corrected.
4.0.3  - Debug infromation removed from the DCUs.
         This made them about 30 % smaller. Also IDE does not prompt you
         give the source code any more when an exception occurs.
4.0.2  - The bidirectional support of multilingual grids improved.
4.0.1  - When using TIvEmbeddedDictionary and the locale files was not
         available, Multilizer raised "Locale files XXX not found".
         This has been corrected.

3.0.7  - The target properties of an inherited translator do not duplicate any
         more.
3.0.5  - TIvFont dialog failed to return the selected color of the font when
         used with Delphi 2 or C++Builder 1. The bug has been corrected.
       - TIvEmbeddedBinaryDictionary can contain zero custom locales.
         No more "Invalid locale offset" when saving the form containing the
         dictionary.
       - If the Language property was -1 (or -2), the PrimaryLanguage property 
         0, and the SubLanguage property 1, the dictionary should have set the 
         language and locale matching the current system settings. However
         the dictionary set the language correctly but changed incorretly the
         locale to the default locale of the language. This has been corrected.
3.0.3  - Memory leaks removed from the TIvFileDictionary
       - Online help checked, improved and keywords added
3.0.2  - ShortTimeFormat is now correctly formatted (16-bit)
3.0.1  - Memory leaks corrected
       - RTL/LTR reading order change works
       - Bidirectional Grids scroll right when on RLT mode
       - Delphi 1 setup corrected to access new serial numbers

Delphi 1: MULTILIZER contains only 16-bit DCUs.
          No 16-bit Language Manager is included.
          Use 32-bit Language Manager.


3) MULTILIZER Visual Basic Edition
----------------------------------

The current version equals the VCL Edition

Version 4.0 is the first MULTILIZER version for Visual Basic. The version
number is synchronized to VCL version.

New features:

4.1.0  - MLD version 3 support
       - Context sensitive dictionaries
       - The native language can be any language
       - InitialLayout property added TIvTranslator
       - Targets property change so that by the default the default targets
         are used. In most cases there is not need to specify the targets
         file.

Bug corrections:

4.1.1  - Context sensitive dictionaries work.
       - Charset properties of sub components are also updated.
4.0.6  - See VCL 4.0.6
4.0.5  - TIvFileDictionary, TIvEmbeddedDictionary and TIvUnicodeDictionary
         has been combined into TIvFileDictionary.
       - TIvFileDictionary can read dictionary data from resource as well.
       - TIvBinaryDictionary and TIvEmbeddedBinaryDictionary 
         has been combined into TIvBinaryDictionary.
       - TIvBinaryDictionary can read dictionary data from resource as well.
4.0.2  - Dependency to ODBC32.DLL removed.
4.0.1  - Font mapping corrected


4) MULTILIZER Java Edition
--------------------------

See the MULTILIZER Java Edition documentation      


5) MULTILIZER WFC Edition
-------------------------

See the MULTILIZER WFC Edition documentation      


6) MULTILIZER Dictionary Server (MDS)
-------------------------------------

The current version is 1.2.0

New features:

1.2.0  - Dictionary caching enabled.
       - Commonication protocol (DSTP) uses UTF-8 instead of Ansi characters.
1.1.4  - Inhereted language columns.
1.1.3  - Context sensitive dictionaries supported with Java clients.
1.1.0  - MLD verison 3 support. Context sensitive dictionaries.
1.0.2  - Name changed to MULTILIZER Dictionary Server

Bug corrections:

1.1.2  - Context sensitive sorting and finding fixed.
1.0.1  - Author level user can create/edit user ids.
       - One master can delete another master
1.0.3  - Unicode dictionaries works properly when used on VCL client.
