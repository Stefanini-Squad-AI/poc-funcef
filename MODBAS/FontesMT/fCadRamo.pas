unit fCadRamo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, Provider, DBTables, Wwquery, MontaSelect, Db, DBClient, ImgList, uCMClientDataSet,
  CmEventosCadastro, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, FCadastroMT, uCtrlRamoFornecedor;

type
  TfrmCadRamo = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    dbedCodigo: TDBEdit;
    dbedDescr: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  private
    CtrlRamoFornecedor: TCtrlRamoFornecedor;
    procedure Sel(IdRamoFornecedor: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadRamo: TfrmCadRamo;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadRamo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRamoFornecedor := TCtrlRamoFornecedor.Create;
  CtrlRamoFornecedor.InitializeAs(Padroes);
  CtrlRamoFornecedor.Cds := Cds;
  Sel(-1);
end;

procedure TfrmCadRamo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlRamoFornecedor);
  inherited;
end;

procedure TfrmCadRamo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadRamo.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadRamo.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadRamo.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRamo.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRamo.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadRamo.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadRamo.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadRamo.Sel(IdRamoFornecedor: double);
begin
  Cds.Data := CtrlRamoFornecedor.ListaRamoFornecedor(IdRamoFornecedor);
end;

function TfrmCadRamo.GravarRegistro: boolean;
begin
  Result := CtrlRamoFornecedor.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlRamoFornecedor.MessageInfo);
end;

end.
