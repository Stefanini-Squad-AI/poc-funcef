unit fCadRegSitFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadastroCS, FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  Mask, DBCtrls, Wwtable, CMProcura, wwdbedit, TREdit, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadRegSitFunc = class(TfrmCadMestreDetalheCS)
    updDet: TUpdateSQL;
    qryMotivoOfi: TwwQuery;
    qryDet: TwwQuery;
    Label1: TLabel;
    dbedMat: TwwDBEdit;
    Label6: TLabel;
    dbedNome: TwwDBEdit;
    dbtxtSituacao: TDBText;
    qrySitFunc: TwwQuery;
    qryMovContr: TwwQuery;
    Label4: TLabel;
    dbedDatAlt: TCMDateTimePicker;
    Label7: TLabel;
    dblcSitFunc: TwwDBLookupCombo;
    Label2: TLabel;
    dblcMotivoOfic: TwwDBLookupCombo;
    Label3: TLabel;
    dblcMotivoGer: TwwDBLookupCombo;
    Label5: TLabel;
    dblcMovContrCAGED: TwwDBLookupCombo;
    qryMotivoGer: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblcSitFuncCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    procedure AtualizarDetalhe(IdPessoa: integer);
  end;

var
  frmCadRegSitFunc: TfrmCadRegSitFunc;

implementation

uses {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF},
  uSistema, uMensErro, uDataBase, uFuncoesUteis, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadRegSitFunc.AtualizarDetalhe(IdPessoa: integer);
begin
  qry.Close;
  qry.ParamByName('IDPESSOA').asInteger := IDPessoa;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').asInteger := IDPessoa;
  qryDet.Open;
end;

procedure TfrmCadRegSitFunc.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Clear;

  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  with (MontaSelect.Filtro) do
  begin
    Add ('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add ('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add ('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  qrySitFunc.Open;
  qryMovContr.Open;
  qryMotivoOfi.Open;
  qryMotivoGer.Open;

  qry.Close;
  qry.Prepare;
  qryDet.Close;
  qryDet.Prepare;

  sbtnProcurarClick(Self);

  if (MontaSelect.ValoresChave.Count = 0) or (MontaSelect.ValoresChave[0] = '') then
    AtualizarDetalhe (-1);
end;

procedure TfrmCadRegSitFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qrySitFunc.Close;
  qryMovContr.Close;
  qryMotivoOfi.Close;
  qryMotivoGer.Close;
  qry.Close;
  qry.UnPrepare;
  qryDet.Close;
  qryDet.UnPrepare;
  inherited;
end;

procedure TfrmCadRegSitFunc.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  // Para fazer a procura na criação do Formulário
end;

procedure TfrmCadRegSitFunc.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    AtualizarDetalhe (StrToInt(MontaSelect.ValoresChave[0]));

    if (qry.FieldByName('TIPOSIT').asString = 'D') then
      dbtxtSituacao.Font.Color := clRed
    else
    if (qry.FieldByName('TIPOSIT').asString = 'F') then
      dbtxtSituacao.Font.Color := clGreen
    else
    if (qry.FieldByName('TIPOSIT').asString = 'A') then
      dbtxtSituacao.Font.Color := clBlue;
  end;
end;

procedure TfrmCadRegSitFunc.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IdPessoa').asInteger := qry.FieldByName('IdPessoa').asInteger;
end;

procedure TfrmCadRegSitFunc.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('MOT_OFICIAL').asString   := Trim(dblcMotivoOfic.Text);
  qryDet.FieldByName('MOT_GERENCIAL').asString := Trim(dblcMotivoGer.Text);
  qryDet.FieldByName('MOVCONTRCAGED').asString := Trim(dblcMovContrCAGED.Text);
  qryDet.FieldByName('SITUACAO').asString      := Trim(dblcSitFunc.Text);
end;

procedure TfrmCadRegSitFunc.dblcSitFuncCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (Modified) then
    qryDet.FieldByName('SITUACAO').asString := qrySitFunc.FieldByName('DESCRICAO').asString;
end;

procedure TfrmCadRegSitFunc.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcSitFunc.Text) = '') then
  begin
    MsgDlg('Informe a Situação Funcional', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dblcSitFunc.SetFocus;
    exit;
  end;

  if (qryDet.FieldByName('DATASITFUNC').Value = Null) then
  begin
    MsgDlg('Informe a Data de Alteração', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dbedDatAlt.SetFocus;
    exit;
  end;

  inherited;
end;

procedure TfrmCadRegSitFunc.CmeCadastroConfirma(Sender: TObject);
begin
  if (CmeCadastro.Operacao = OpAlterar) then
    AplicaAlteracoes([qryDet]);
  inherited;
end;

end.
