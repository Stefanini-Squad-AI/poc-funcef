
{******************************************************************************}
{  Now Quick Export can use several languages in one project. By default, it   }
{  works with resources that are linked into .BPL file. If you need            }
{  multi-language support in your project, make several language DLLs          }
{  and switch to particular language by this code:                             }
{                                                                              }
{  uses QExport3;                                                              }
{                                                                              }
{  QExportLocale.LoadDll('QEEnglish.dll'); // load English resources           }
{  ...                                                                         }
{  QExportLocale.UnloadDll; // unload resource DLL and use default resources   }
{                                                                              }
{  To make the DLL, run MakeDll.bat file in this folder, or MakeAll.bat file   }
{  in the LANGUAGES folder to make DLLs for all languages.                     }
{******************************************************************************}


library QEEnglish;

{$R QEResStr.res}

begin
end.