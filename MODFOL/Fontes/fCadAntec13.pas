unit fCadAntec13;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, ImgList;

type
  TfrmCadAntec13 = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label10: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dbtxtSituacao: TDBText;
    Label15: TLabel;
    Label3: TLabel;
    speAnoAntec: TwwDBSpinEdit;
    speMesAntec: TwwDBSpinEdit;
    dbrgProc: TDBRadioGroup;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    edNomeMes: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dbrgProcChange(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure speMesAntecChange(Sender: TObject);
    procedure dsDetDataChange(Sender: TObject; Field: TField);
    procedure qryDetBeforeInsert(DataSet: TDataSet);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    Ano1, Mes1, Dia1: word;

    procedure AtualizaDados (ID: integer);
  public
    { Public declarations }
  end;

const                     
  MES: array[1..12] of string = (
    'JANEIRO','FEVEREIRO','MARÇO','ABRIL','MAIO','JUNHO','JULHO',
    'AGOSTO','SETEMBRO','OUTUBRO','NOVEMBRO','DEZEMBRO');  
var
  frmCadAntec13: TfrmCadAntec13;

implementation

uses uMensErro, uDataBase, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadAntec13.AtualizaDados (ID: integer);
begin
  qry.Close;
  qry.ParamByName('IDPESSOA').asInteger := ID;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').asInteger := ID;
  qryDet.Open;
end;

procedure TfrmCadAntec13.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Clear;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add ('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);

  with (MontaSelect.Filtro) do
  begin
    Add ('EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA');
    Add ('CARGO.IDCARGO        = FUNCIONARIO.IDCARGO');
    Add ('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;

  qry.Prepare;
  qryDet.Prepare;

  AtualizaDados (-1);

  sbtnProcurarClick(Sender);
end;

procedure TfrmCadAntec13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qry.UnPrepare;
  qryDet.Close;
  qryDet.UnPrepare;  
  inherited;
end;

procedure TfrmCadAntec13.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadAntec13.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[6] <> '')  then
  begin
    AtualizaDados (StrToInt(MontaSelect.ValoresChave[6]));

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

procedure TfrmCadAntec13.speMesAntecChange(Sender: TObject);
begin
  inherited;
  if (speMesAntec.Value > 12) then
    speMesAntec.Value := 1
  else
  if (speMesAntec.Value < 1) then
    speMesAntec.Value := 12;

  edNomeMes.Text := MES[Round(speMesAntec.Value)];
end;

procedure TfrmCadAntec13.dbrgProcChange(Sender: TObject);
begin
  inherited;
  if (qryDet.State in [dsEdit, dsInsert]) and (dbrgProc.ItemIndex = 0) then
    if (MsgDlg('Confirma Registro Apenas para Histórico ?', LerMensagem(4), mtConfirmation,
       [mbYes, mbNo], 0) <> mrYes) then
      dbrgProc.ItemIndex := 1;
end;

procedure TfrmCadAntec13.dsDetDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if (qryDet.State in [dsEdit, dsInsert]) and (speMesAntec.Value > 0) then
    edNomeMes.Text := MES[Round(speMesAntec.Value)];
end;

procedure TfrmCadAntec13.sbtnAltDetClick(Sender: TObject);
begin
  if (dbrgProc.ItemIndex = 0) then
  begin
    MsgDlg('Antecipação Processada! Alteração Não Permitida','Aviso', mtInformation,[mbOk,mbHelp],0);
    sbtnAlterar.Down := false;
    sbtnAltDet.Down  := false;
    exit;
  end;
  inherited;
end;

procedure TfrmCadAntec13.bbtnOkDetClick(Sender: TObject);
begin
  if (qryDet.FieldbyName('ANO').Value = Null) then
  begin
    MsgDlg('Informe o Ano de Referência !', 'Aviso', mtInformation,[mbOk,mbHelp],0);
    speAnoAntec.SetFocus;
    exit;
  end;

  if (qryDet.FieldbyName('MES').Value = Null) then
  begin
    MsgDlg('Informe o Mês da Antecipação !', 'Aviso', mtInformation,[mbOk,mbHelp],0);
    speMesAntec.SetFocus;
    exit;
  end;
  inherited;
end;

procedure TfrmCadAntec13.qryDetBeforeInsert(DataSet: TDataSet);
var
  JaTem: boolean;
begin
  inherited;
  JaTem := not(qryDet.EOF);

  if (JaTem) then
  begin
    qryDet.Last;
    Ano1 := qryDet.FieldByName('ANO').asInteger;
    Mes1 := qryDet.FieldByName('MES').asInteger;
  end
  else
    DecodeDate(qry.FieldByName('DATAADMISSAO').Value, Ano1, Mes1, Dia1);

  Inc(Ano1);
end;

procedure TfrmCadAntec13.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('IDPESSOA').asInteger    := qry.FieldByName('IDPESSOA').asInteger;
  qryDet.FieldByName('FLGOCORRIDA').asInteger := 0;
  qryDet.FieldByName('ANO').asInteger         := Ano1;
  qryDet.FieldByName('MES').asInteger         := Mes1;
end;

procedure TfrmCadAntec13.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
  inherited;
end;

end.
