{-------------------------------------------------------------------------------
---------------------------- ALTERAÇÕES ----------------------------------------
--------------------------------------------------------------------------------

 N. SIG........: 128734
 Dt Alteração..: 30/08/2022
 Responsável...: Everson Cunha
 Descrição.....: Criação da funcionalidade
--------------------------------------------------------------------------------}

unit fExcluiDocumentosDrive;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, MAHlpBtn, CMDateTimePicker, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, MontaSelect, Db, Wwdatsrc,
  DBTables, Wwquery, TREdit, DBClient, uCMClientDataSet, uCmSqlParams, uDataBase,
  CMProcura, TB97Tlbr, TB97, IvDictio, IvMulti, IvEMulti, Buttons,
  wwdbdatetimepicker, DBaseDados, UMensErro, uSistema, uCtrlPadroes, uCtrlDocumento;

const
  MSG01 = 'Preenchimento incorreto do campo';
  MSG02 = 'Não existem documentos a exibir utilizando os filtros informados.'
               + #13#10 + 'Favor verifique os filtros e Selecione novamente.';

type
  TFrmExcluiDocumentosDrive = class(TfrmOkCancelar)
    pnlTop: TPanel;
    gbDatas: TGroupBox;
    lblLancamento: TLabel;
    lblEmissao: TLabel;
    lblVencimento: TLabel;
    lblProgramada: TLabel;
    lblEmissao_a: TLabel;
    lblLancamento_a: TLabel;
    lblVencimento_a: TLabel;
    lblProgramada_a: TLabel;
    dbeDataLanc: TCMDateTimePicker;
    dbeDataEmi: TCMDateTimePicker;
    dbeDataVenc: TCMDateTimePicker;
    dbeDataProgr: TCMDateTimePicker;
    dbeDataEmi_Fim: TCMDateTimePicker;
    dbeDataLanc_Fim: TCMDateTimePicker;
    dbeDataVenc_Fim: TCMDateTimePicker;
    dbeDataProgr_Fim: TCMDateTimePicker;
    BtnSelecionar: TBitBtn;
    GpbNumDocumento: TGroupBox;
    edtNumDocumento: TEdit;
    GrpValorMoeda: TGroupBox;
    lblValorMoeda_De: TLabel;
    lblValorMoeda_a: TLabel;
    pnlDivDisponiveis: TPanel;
    pnlDisponiveis: TPanel;
    pnlBotoes: TPanel;
    pnlDivSelecionados: TPanel;
    Panel1: TPanel;
    GrdDisponiveis: TwwDBGrid;
    GrdSelecionados: TwwDBGrid;
    MontaSelect: TMontaSelect;
    DsDisponiveis: TwwDataSource;
    DsSelecionados: TwwDataSource;
    BtnAddAll: TSpeedButton;
    btnAdd: TSpeedButton;
    BtnRemove: TSpeedButton;
    btnRemoveAll: TSpeedButton;
    pnlValor: TPanel;
    edtVlrTotal: TRealEdit;
    gbxRazaoSocial: TGroupBox;
    ProcuraRz: TCMProcura;
    cdsSelecionados: TCMClientDataSet;
    cdsDisponiveis: TCMClientDataSet;
    sqlSelecionados: TCMSqlParams;
    sqlDisponiveis: TCMSqlParams;
    cdsDisponiveisCODDOCUMENTO: TFloatField;
    cdsDisponiveisNODOCUMENTO: TFloatField;
    cdsDisponiveisRAZAOSOCIAL: TStringField;
    cdsDisponiveisDATAPROGRAMADA: TDateTimeField;
    cdsDisponiveisVALOR: TFloatField;
    edtValorMoeda_De: TRealEdit;
    edtValorMoeda_a: TRealEdit;
    cdsSelecionadosCODDOCUMENTO: TFloatField;
    cdsSelecionadosNODOCUMENTO: TFloatField;
    cdsSelecionadosRAZAOSOCIAL: TStringField;
    cdsSelecionadosDATAPROGRAMADA: TDateTimeField;
    cdsSelecionadosVALOR: TFloatField;
    ds: TDataSource;
    cds: TCMClientDataSet;
    cdsRAZAOSOCIAL: TStringField;
    cdsDisponiveisORIGEM_DOCUMENTO: TStringField;
    cdsSelecionadosORIGEM_DOCUMENTO: TStringField;
    procedure BtnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveAllClick(Sender: TObject);
    procedure BtnAddAllClick(Sender: TObject);
    procedure edtNumDocumentoKeyPress(Sender: TObject; var Key: Char);
  private
    sSqlLimpo: string;
    Query: TwwQuery;
    CtrlDocumento: TCtrlDocumento;
    procedure LimpaFiltros;
    function getQueryFiltro: string;
    function ValidaEntrada: Boolean;
    procedure FazQuery2(sqlparam: TCMSqlParams; sSql: string);
    function PovoaCds(cdsOrigem, cdsDestino: TCMClientDataSet): boolean;
    function RealizaExclusao : boolean;
    procedure LimpaCDS(oCds: TCMClientDataSet);
  public
    { Public declarations }
  end;

var
  FrmExcluiDocumentosDrive: TFrmExcluiDocumentosDrive;

implementation

{$R *.DFM}

procedure TFrmExcluiDocumentosDrive.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlDocumento := TCtrlDocumento.Create;
  CtrlDocumento.InitializeAs(Padroes);

  edtVlrTotal.Value := 0;
  sSqlLimpo := sqlDisponiveis.SQL.GetText;

  Query := TwwQuery.Create(nil);
  Query.DatabaseName := 'basedados';

  sqlDisponiveis.Prepare;
  sqlSelecionados.Prepare;

  sqlDisponiveis.open;
  sqlSelecionados.open;

  {sem este cds o componente ProcuraRz - estoura erros ao deletar}
  cds.CreateDataSet;
  cds.Insert;
end;

procedure TFrmExcluiDocumentosDrive.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bbtnCancelar.Click;
  FreeAndNil(Query);
  FreeAndNil(CtrlDocumento);
  cds.Cancel;

  inherited;
end;

procedure TFrmExcluiDocumentosDrive.BtnSelecionarClick(Sender: TObject);
begin
  inherited;

  edtVlrTotal.Value := 0;

  if not (ValidaEntrada) then
    exit;

  LimpaCDS(cdsSelecionados);
  FazQuery2(sqlDisponiveis, getQueryFiltro);

  if (cdsDisponiveis.IsEmpty) then
  begin
    MsgDlg(MSG02, 'Aviso', mtWarning, [mbOK], 0);
    exit;
  end;
end;

function TFrmExcluiDocumentosDrive.ValidaEntrada: Boolean;
begin
  result := True;

  if (dbeDataEmi.Text <> EmptyStr) and (dbeDataEmi_Fim.Text <> EmptyStr) then
  begin
    if (dbeDataEmi.Date > dbeDataEmi_Fim.Date) then
    begin
      MsgDlg(MSG01 + ' <Data Emissão>.', 'Aviso', mtWarning, [mbOK], 0);
      result := false;
    end;
  end;

  if (dbeDataLanc.Text <> EmptyStr) and (dbeDataLanc_Fim.Text <> EmptyStr) then
  begin
    if (dbeDataLanc.Date > dbeDataLanc_Fim.Date) then
    begin
      MsgDlg(MSG01 + ' <Data Lançamento>.', 'Aviso', mtWarning, [mbOK], 0);
      result := false;
    end;
  end;

  if (dbeDataVenc.Text <> EmptyStr) and (dbeDataVenc_Fim.Text <> EmptyStr) then
  begin
    if (dbeDataVenc.Date > dbeDataVenc_Fim.Date) then
    begin
      MsgDlg(MSG01 + ' <Data Vencimento>.', 'Aviso', mtWarning, [mbOK], 0);
      result := false;
    end;
  end;

  if (dbeDataProgr.Text <> EmptyStr) and (dbeDataProgr_Fim.Text <> EmptyStr) then
  begin
    if (dbeDataProgr.Date > dbeDataProgr_Fim.Date) then
    begin
      MsgDlg(MSG01 + ' <Data Programada>.', 'Aviso', mtWarning, [mbOK], 0);
      result := false;
    end;
  end;

  if (edtValorMoeda_De.Value > 0) and (edtValorMoeda_a.Value > 0) then
  begin
    if (edtValorMoeda_De.Value > edtValorMoeda_a.Value) then
    begin
      MsgDlg(MSG01 + ' <Valor Moeda Corrente>.', 'Aviso', mtWarning, [mbOK], 0);
      result := false;
    end;
  end;                
end;

procedure TFrmExcluiDocumentosDrive.FazQuery2(sqlparam: TCMSqlParams; sSql: string);
begin
  sqlparam.ClientDataSet.Close;
  sqlparam.SQL.Clear;
  sqlparam.SQL.Add(sSql);
  sqlparam.Open;
end;

procedure TFrmExcluiDocumentosDrive.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  cdsDisponiveis.Cancel;
  cdsSelecionados.Cancel;
  LimpaFiltros;

  if (dtmBaseDados.dbBaseDados.InTransaction) then
    dtmBaseDados.dbBaseDados.Rollback;
end;

procedure TFrmExcluiDocumentosDrive.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if cdsSelecionados.IsEmpty then
  begin
    MsgDlg('Não há registros selecionados para Exclusão', 'Aviso', mtInformation, [mbOk], 0);
    exit;
  end;

  if MsgDlg('Confirma a exclusão dos registros selecionados?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  if not (RealizaExclusao) then
    exit;

  LimpaCDS(cdsSelecionados);
  edtVlrTotal.Value := 0;

  MsgDlg('Operação efetuada com Sucesso', 'Informação', mtInformation, [mbOK], 0);
end;

function TFrmExcluiDocumentosDrive.RealizaExclusao;
begin
  result := true;

  try
    StartTransacao;

    CtrlDocumento.OpenTransaction := False;
    CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
    CtrlDocumento.IdUsuario := Sistema.idUsuario;
    CtrlDocumento.IdEspAcesso := Sistema.idEspAcesso;
    CtrlDocumento.UsaPlanoPatro := Sistema.UsaPlanoPatro;
    CtrlDocumento.IdModulo := Sistema.idModulo;

    cdsSelecionados.First;

    while not(cdsSelecionados.Eof) do
    begin
      CtrlDocumento.CodDocumento := cdsSelecionados.fieldbyname('coddocumento').AsInteger;

      if not CtrlDocumento.Delete then
        raise Exception.create(CtrlDocumento.MessageInfo);

      if not (ExecutarQuery(Query, 'DELETE FROM ETL_DRIVE.INTEGRA_DRIVE_FINANC WHERE CODDOCUMENTO = ' + cdsSelecionados.fieldbyname('coddocumento').asString )) then
        raise Exception.create('Erro ao excluir as informações da base SINQIA/DRIVE');

      cdsSelecionados.Next;
    end;

    CommitTransacao;
  except
    on e : Exception do
    begin
      result := false;
      RollBackTransacao;
      MsgDlg(e.message, 'Erro', mtError, [mbOK], 0);
    end;
  end;
end;

procedure TFrmExcluiDocumentosDrive.LimpaFiltros;
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TEdit) then
      TEdit(Components[i]).Text := EmptyStr
    else
    if (Components[i] is TCMDateTimePicker) then
      TCMDateTimePicker(Components[i]).Text := EmptyStr
    else
    if (Components[i] is TwwDBLookupCombo) then
      TwwDBLookupCombo(Components[i]).Text := EmptyStr
    else
    if (Components[i] is TRealEdit) then
      TRealEdit(Components[i]).Value := 0
  end;

  ProcuraRz.Text := EmptyStr;

  FazQuery2(sqlDisponiveis, sSqlLimpo);
  FazQuery2(sqlSelecionados, sSqlLimpo);
end;

procedure TFrmExcluiDocumentosDrive.bbtnSairClick(Sender: TObject);
begin
  bbtnCancelar.Click;

  inherited;
end;

function TFrmExcluiDocumentosDrive.getQueryFiltro: string;
var
  sSQL: TStringList;
  sVlr: string;
begin
  try
    sSQL := TStringList.Create;
    sSQL.add('SELECT D.CODDOCUMENTO, D.NODOCUMENTO, D.DATAPROGRAMADA, ');
    sSQL.add('       DECODE(D.RECPAG, ''P'', ''Contas a Pagar'', ''R'', ''Contas a Receber'') ORIGEM_DOCUMENTO, D.RECPAG, ');
    sSQL.add('       P.RAZAOSOCIAL, L.VALOR ');
    sSQL.add('  FROM CM.DOCUMENTO D ');
    sSQL.add('  JOIN CM.LANCTODOCUM L ON L.CODDOCUMENTO = D.CODDOCUMENTO AND L.OPERACAO = 2 ');
    sSQL.add('  JOIN CM.PESSOA P ON P.IDPESSOA = D.IDFORCLI ');
    sSQL.add(' WHERE D.IDMODULO = 740 ');
    sSQL.add('   AND D.STATUS <> 2 ');

    if (ProcuraRz.Text <> EmptyStr) then
      sSQL.add(' AND D.IDFORCLI = ' + MontaSelect.ValoresChave[0]);

    if (dbeDataEmi.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAEMISSAO,''DD/MM/RRRR'') >=' + QuotedStr(dbeDataEmi.Text));

    if (dbeDataEmi_Fim.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAEMISSAO,''DD/MM/RRRR'') <=' + QuotedStr(dbeDataEmi_Fim.Text));

    if (dbeDataLanc.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(L.DATALANCTO,''DD/MM/RRRR'') >=' + QuotedStr(dbeDataLanc.Text));

    if (dbeDataLanc_Fim.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(L.DATALANCTO,''DD/MM/RRRR'') <=' + QuotedStr(dbeDataLanc_Fim.Text));

    if (dbeDataVenc.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAVENCTO,''DD/MM/RRRR'') >= ' + QuotedStr(dbeDataVenc.Text));

    if (dbeDataVenc_Fim.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAVENCTO,''DD/MM/RRRR'') <=' + QuotedStr(dbeDataVenc_Fim.Text));

    if (dbeDataProgr.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAPROGRAMADA,''DD/MM/RRRR'') >= ' + QuotedStr(dbeDataProgr.Text));

    if (dbeDataProgr_Fim.Text <> EmptyStr) then
      sSQL.add(' AND TO_DATE(D.DATAPROGRAMADA,''DD/MM/RRRR'') <= ' + QuotedStr(dbeDataProgr_Fim.Text));

    if (edtNumDocumento.Text <> EmptyStr) then
      sSQL.add(' AND D.NODOCUMENTO = ' + edtNumDocumento.Text);

    if (edtValorMoeda_De.Value > 0) then
      sSQL.add(' AND L.VALOR >= ' + StringReplace(FormatFloat('0.00', edtValorMoeda_De.Value), ',', '.', [rfReplaceAll, rfIgnoreCase]));

    if (edtValorMoeda_a.Value > 0) then
      sSQL.add(' AND L.VALOR <= ' + StringReplace(FormatFloat('0.00', edtValorMoeda_a.Value), ',', '.', [rfReplaceAll, rfIgnoreCase]));

    sSQL.Add(' ORDER BY DATAPROGRAMADA, ORIGEM_DOCUMENTO, RAZAOSOCIAL, VALOR');

    Result := sSQL.GetText;
  finally
    FreeAndNil(sSQL);
  end;
end;

function TFrmExcluiDocumentosDrive.PovoaCds(cdsOrigem, cdsDestino: TCMClientDataSet): boolean;
begin
  result := False;
  
  if (cdsOrigem.IsEmpty) then
    exit;

  cdsDestino.Insert;
  cdsDestino.FieldByName('CODDOCUMENTO').AsString := cdsOrigem.FieldByName('CODDOCUMENTO').AsString;
  cdsDestino.FieldByName('NODOCUMENTO').AsString := cdsOrigem.FieldByName('NODOCUMENTO').AsString;
  cdsDestino.FieldByName('RAZAOSOCIAL').AsString := cdsOrigem.FieldByName('RAZAOSOCIAL').AsString;
  cdsDestino.FieldByName('DATAPROGRAMADA').AsDateTime := cdsOrigem.FieldByName('DATAPROGRAMADA').AsDateTime;
  cdsDestino.FieldByName('VALOR').AsCurrency := cdsOrigem.FieldByName('VALOR').AsCurrency;
  cdsDestino.FieldByName('ORIGEM_DOCUMENTO').AsString := cdsOrigem.FieldByName('ORIGEM_DOCUMENTO').AsString;
  cdsDestino.Post;

  result := True;
end;

procedure TFrmExcluiDocumentosDrive.btnAddClick(Sender: TObject);
begin
  inherited;

  if (PovoaCds(cdsSelecionados, cdsDisponiveis)) then
  begin
    edtVlrTotal.Value := edtVlrTotal.Value - cdsSelecionados.FieldByName('VALOR').AsCurrency;
    cdsSelecionados.Delete;
  end;
end;

procedure TFrmExcluiDocumentosDrive.BtnAddAllClick(Sender: TObject);
begin
  inherited;

  cdsSelecionados.First;
  while not (cdsSelecionados.Eof) do
  begin
    if (PovoaCds(cdsSelecionados, cdsDisponiveis)) then
    begin
      edtVlrTotal.Value := edtVlrTotal.Value - cdsSelecionados.FieldByName('VALOR').AsCurrency;
      cdsSelecionados.Delete;
    end;
  end;
end;

procedure TFrmExcluiDocumentosDrive.BtnRemoveClick(Sender: TObject);
begin
  inherited;

  if PovoaCds(cdsDisponiveis, cdsSelecionados) then
  begin
    edtVlrTotal.Value := edtVlrTotal.Value + cdsDisponiveis.FieldByName('VALOR').AsCurrency;
    cdsDisponiveis.Delete;
  end;
end;

procedure TFrmExcluiDocumentosDrive.btnRemoveAllClick(Sender: TObject);
begin
  inherited;

  cdsDisponiveis.First;
  while not (cdsDisponiveis.Eof) do
  begin
    if (PovoaCds(cdsDisponiveis, cdsSelecionados)) then
    begin
      edtVlrTotal.Value := edtVlrTotal.Value + cdsDisponiveis.FieldByName('VALOR').AsCurrency;
      cdsDisponiveis.Delete;
    end
  end;
end;

procedure TFrmExcluiDocumentosDrive.edtNumDocumentoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if not (Key in ['0'..'9', #08]) then
    Key := #;
end;

procedure TFrmExcluiDocumentosDrive.LimpaCDS(oCds: TCMClientDataSet);
begin
  oCds.First;
  while not (oCds.Eof) do
    oCds.Delete;
end;

end.

