unit fCadDARF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls,
  TabControlDetalhe, CmEventosCadastro, ImgList, fCadastroMestreDetMT, DBClient,
  uCMClientDataSet, uCtrlDARF;

type
  TfrmCadDARF = class(TFrmCadastroMestreDetMT)
    dbedCodigo: TDBEdit;
    dbedDescr: TDBEdit;
    Label2: TLabel;
    Label1: TLabel;
    dbedDescrDet: TDBEdit;
    Label3: TLabel;
    dbedCodigoDet: TDBEdit;
    Label4: TLabel;
    CdsDet: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
  private
    CtrlDARF: TCtrlDARF;

    procedure Sel(IdContribDARF: integer);
    function  GravarRegistro(Exclusao: boolean): boolean;
  end;

var
  frmCadDARF: TfrmCadDARF;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadDARF.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlDARF := TCtrlDARF.Create;
  CtrlDARF.InitializeAs(Padroes);
  CtrlDARF.Cds := Cds;
  CtrlDARF.CdsDet := CdsDet;
  Sel(-1);
end;

procedure TfrmCadDARF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlDARF);
  inherited;
end;

procedure TfrmCadDARF.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadDARF.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadDARF.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDCONTRIBDARF').asInteger := Cds.FieldByName('IDCONTRIBDARF').asInteger;
  CdsDet.FieldByName('IDITEMDARF').Clear;
  CdsDet.FieldByName('DESCRICAO').Clear;
end;

procedure TfrmCadDARF.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadDARF.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadDARF.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(false);
end;

procedure TfrmCadDARF.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro(true);
end;

procedure TfrmCadDARF.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadDARF.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dbedCodigoDet.CanFocus) then
    dbedCodigoDet.SetFocus;
end;

procedure TfrmCadDARF.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dbedCodigoDet.Text) = '') then
  begin
    MsgDlg('Digite o Código.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedCodigoDet.SetFocus;
  end
  else
  if (Trim(dbedDescrDet.Text) = '') then
  begin
    MsgDlg('Digite a Descrição.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedDescrDet.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadDARF.bbtnConfirmarClick(Sender: TObject);
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

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadDARF.Sel(IdContribDARF: integer);
begin
  Cds.Data := CtrlDARF.ListMestre(IdContribDARF);
  CdsDet.Data := CtrlDARF.ListDetalhe(IdContribDARF);
end;

function TfrmCadDARF.GravarRegistro(Exclusao: boolean): boolean;
begin
  if (Exclusao) then
    Result := CtrlDARF.Excluir
  else
    Result := CtrlDARF.Gravar;

  if not(Result) then
    raise exception.Create(CtrlDARF.MessageInfo);
end;

end.
