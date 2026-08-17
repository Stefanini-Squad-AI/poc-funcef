unit FCadRamoFornecedorMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlRamoFornecedor
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TfrmCadRamoFor = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedRamoFor: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    RamoFornecedor: TCtrlRamoFornecedor;
    Procedure Seleciona( IdRamoFornecedor: Double = 0 );
  public
    { Public declarations }
  end;

var
  frmCadRamoFor: TfrmCadRamoFor;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TfrmCadRamoFor.Seleciona( IdRamoFornecedor: Double );
begin
  Cds.Data := RamoFornecedor.ListaRamoFornecedor( IdRamoFornecedor );
end;

procedure TfrmCadRamoFor.FormCreate(Sender: TObject);
begin
  inherited;
  RamoFornecedor := TCtrlRamoFornecedor.Create;
  RamoFornecedor.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  RamoFornecedor.cds := cds;
  Seleciona( -1 );
end;

procedure TfrmCadRamoFor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  RamoFornecedor.Free;
end;

procedure TfrmCadRamoFor.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
end;

procedure TfrmCadRamoFor.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := RamoFornecedor.Gravar;
end;

procedure TfrmCadRamoFor.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := RamoFornecedor.Gravar;
end;

procedure TfrmCadRamoFor.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := RamoFornecedor.Gravar;
end;

procedure TfrmCadRamoFor.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( RamoFornecedor.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TfrmCadRamoFor.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedRamoFor.SetFocus;
end;

procedure TfrmCadRamoFor.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedRamoFor.SetFocus;
end;

end.

