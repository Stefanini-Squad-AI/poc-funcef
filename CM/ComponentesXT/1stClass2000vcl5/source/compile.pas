unit fClass;
{
//
// Components : Registration for 1stClass
//
// Copyright (c) 1999 by Woll2Woll Software
//
}
interface

uses Classes, Graphics, DBTables, DB, fcColorCombo, fcButton, fcLabel,
  fcStatusBar, fcMsg, fcImageForm, fcImager, fcButtonGroup,
  fcOutlookBar, fcClearPanel, fcDBTreeView, fctreeview,
  Controls, fcFontCombo, fcShapeBtn, fcImgBtn, fcTreeCombo,
  fcBitmap, fcOutlookList, fcDemoRichEdit, fcCollection;

procedure Register;

implementation

{$r 1stClass.dcr}

procedure Register;
begin
  RegisterComponents('1stClass', [TfcTreeView]);
  RegisterComponents('1stClass', [TfcDBTreeView]);
  RegisterComponents('1stClass', [TfcButtonGroup, TfcOutlookBar]);
  RegisterComponents('1stClass', [TfcImageForm]);
  RegisterComponents('1stClass', [TfcStatusBar]);
  RegisterComponents('1stClass', [TfcImager]);
  RegisterComponents('1stClass', [TfcShapeBtn]);
  RegisterComponents('1stClass', [TfcImageBtn]);
  RegisterComponents('1stClass', [TfcTreeCombo]);
  RegisterComponents('1stClass', [TfcFontCombo]);
  RegisterComponents('1stClass', [TfcColorCombo]);
  RegisterComponents('1stClass', [TfcColorList]);
  RegisterComponents('1stClass', [TfcLabel]);
  RegisterClasses([TfcDemoRichEdit]);
end;

end.
