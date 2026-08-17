unit fCadAjuste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  StdCtrls, Mask, DBCtrls, CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio, Db,
  IvMulti, IvEMulti, Wwdatsrc, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, uCMClientDataSet, DBClient,
  FCadastroMestreDetMT, uCtrlAjuste;

type
  TfrmCadAjuste = class(TFrmCadastroMestreDetMT)
    dbedCodPesqui: TDBEdit;
    dbedDescricao: TDBEdit;
    dbedData: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dblcEntidade: TwwDBLookupCombo;
    Label5: TLabel;
    dbedFator: TDBEdit;
    CdsDet: TCMClientDataSet;
    CdsEntidade: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcEntidadeChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlAjuste: TCtrlAjuste;

    procedure Sel(IdPesqSalar: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadAjuste: TfrmCadAjuste;

implementation

uses uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadAjuste.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAjuste := TCtrlAjuste.Create;
  CtrlAjuste.InitializeAs(Padroes);
  CtrlAjuste.CdsDet := CdsDet;

  sbtnProcurarClick(Sender);

  CdsEntidade.Data := CtrlAjuste.ListEntidade;
end;

procedure TfrmCadAjuste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlAjuste);
  inherited;
end;

procedure TfrmCadAjuste.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadAjuste.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDPESQSALAR').asString := Cds.FieldByName('IDPESQSALAR').asString;
  CdsDet.FieldByName('FATOR').asInteger := 0;
end;

procedure TfrmCadAjuste.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadAjuste.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadAjuste.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dblcEntidade.CanFocus) then
    dblcEntidade.SetFocus;
end;

procedure TfrmCadAjuste.dblcEntidadeChange(Sender: TObject);
begin
  if (CdsDet.State in [dsInsert, dsEdit]) then
    if (Trim(dblcEntidade.Text) = '') then
      CdsDet.FieldByName('NOME').Clear
    else
      CdsDet.FieldByName('NOME').asString := dblcEntidade.Text;
end;

procedure TfrmCadAjuste.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcEntidade.Text) = '') then
  begin
    MsgDlg('Selecione uma Entidade.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblcEntidade.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadAjuste.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  CmeCadastroFind(Sender);
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadAjuste.Sel(IdPesqSalar: double);
begin
  Cds.Data := CtrlAjuste.ListMestre(IdPesqSalar);
  CdsDet.Data := CtrlAjuste.ListDetalhe(IdPesqSalar);
end;

function TfrmCadAjuste.GravarRegistro: boolean;
begin
  Result := CtrlAjuste.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlAjuste.MessageInfo);
end;

end.
