unit ADO_QExport3Reg;

{$I VerCtrl.inc}

interface

procedure Register;

implementation

uses {$IFDEF VCL6}DesignIntf{$ELSE}DsgnIntF{$ENDIF}, QExport3Dsgn, Classes,
  ADO_QExport3Access, ADO_QExport3Dsgn, ADO_QExport3Dialog, QExport3Common;
{$R *.dcr}

procedure Register;
begin
  RegisterComponents(S_COMPONENT_PAGE, [TADO_QExport3Dialog,
                                        TADO_QExport3Access]);
  RegisterPropertyEditor(TypeInfo(string), TADO_QExport3Access, 'DatabaseName',
    TQDatabaseNameProperty);
  RegisterPropertyEditor(TypeInfo(string), TADO_QExport3Dialog, 'About',
    TQExportAboutProperty);
  RegisterPropertyEditor(TypeInfo(string), TADO_QExport3Dialog, '_Version',
    TQExportVersionProperty);

end;

end.

