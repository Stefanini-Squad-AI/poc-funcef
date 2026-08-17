unit FSelOrigem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Db, DBClient, uCMClientDataSet;

type
  TfrmSelOrigem = class(TfrmOkCancelar)
    lblTipoUsuario: TLabel;
    lblInterface: TLabel;
    dblkpInterface: TDBLookupComboBox;
    grpAtencao: TGroupBox;
    lblMsg: TLabel;
    cdsInterface: TCMClientDataSet;
    cdsInterfaceIDWEBINTERFACE: TFloatField;
    cdsInterfaceNOMEINTERFACE: TStringField;
    cdsInterfaceENDLOGIN: TStringField;
    cdsInterfaceEMAIL: TStringField;
    cdsInterfaceTIMEOUT: TFloatField;
    cdsInterfaceMENUALTURA: TFloatField;
    cdsInterfaceMENULARGURA: TFloatField;
    cdsInterfaceMENUTAMFONTE: TFloatField;
    cdsInterfaceMENUPOSX: TFloatField;
    cdsInterfaceMENUPOSY: TFloatField;
    cdsInterfaceMENUDISTANCIA: TFloatField;
    cdsInterfaceMENUNOMEFONTE: TStringField;
    cdsInterfaceMENUCORFONTE: TStringField;
    cdsInterfaceMENUCORFONTESEL: TStringField;
    cdsInterfaceMENUCORFUNDO: TStringField;
    cdsInterfaceMENUCORFUNDOSEL: TStringField;
    cdsInterfaceFLGUSAMENU: TStringField;
    cdsInterfaceFLGUSALAYERS: TStringField;
    cdsInterfaceFLGDEMO: TStringField;
    dtsTipoUsuario: TDataSource;
    dtsInterface: TDataSource;
    cmbTipoUsuario: TComboBox;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelOrigem: TfrmSelOrigem;

implementation

{$R *.DFM}

procedure TfrmSelOrigem.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if ( dblkpInterface.Text = '' ) or ( dblkpInterface.Text = '' ) then
  begin
    ShowMessage('É necessário escolher o tipo de usuário e a interface.');
    exit;
  end;

  ModalResult := mrOk;
end;

end.
