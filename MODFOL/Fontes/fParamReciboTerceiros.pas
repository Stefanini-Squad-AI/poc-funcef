// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamReciboTerceiros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin,
  checklst, TREdit, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  ComCtrls, Gauges, fcLabel, fSairAjuda;

type
  // Usada na rotina de geração da query para identificar o processo que se quer 
  TTipoGeracao = (tpRelatorio, tpCAP);

  TfrmParamReciboTerceiros = class(TfrmSairAjuda)
    pgctrlPrincipal: TPageControl;
    tbshRelatorio: TTabSheet;
    tbshCAP: TTabSheet;
    pgctrlCAP: TPageControl;
    tbshSelecaoCAP: TTabSheet;
    tbshResultCAP: TTabSheet;
    memResult: TMemo;
    Label11: TLabel;
    Label1: TLabel;
    dtPagamento: TCMDateTimePicker;
    dblcTipoDoc: TwwDBLookupCombo;
    chkRateioCC: TCheckBox;
    bbtnGerarCAP: TBitBtn;
    qryTipoDoc: TwwQuery;
    qryAux: TwwQuery;
    lblProcesso: TLabel;
    pbProgresso: TProgressBar;
    bvAguarde: TBevel;
    tblDocumentos: TTable;
    Bevel1: TBevel;
    bbtnSalvar: TBitBtn;
    svdlgDialogo: TOpenDialog;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    gbxFavorecidos: TGroupBox;
    chklstFavorecido: TCheckListBox;
    bbtnSelTodosFunc: TBitBtn;
    bbtnInverteSelFunc: TBitBtn;
    gbxTipoPag: TGroupBox;
    chklstTipoFolha: TCheckListBox;
    gbxMesAnoRef: TGroupBox;
    dtedDataRef: TCMDateTimePicker;
    rgProcesso: TRadioGroup;
    rgAutoriza: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosFuncClick(Sender: TObject);
    procedure bbtnInverteSelFuncClick(Sender: TObject);
    procedure chklstFavorecidoDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure dtedDataRefChange(Sender: TObject);
    procedure chklstFavorecidoClickCheck(Sender: TObject);
    procedure dblcTipoDocChange(Sender: TObject);
    procedure bbtnGerarCAPClick(Sender: TObject);
    procedure pgctrlPrincipalChange(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure memResultChange(Sender: TObject);
    procedure chklstFavorecidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstTipoFolhaClickCheck(Sender: TObject);
    procedure chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    ListaCodTipoFolha, ListaCodFavorecido: TStringList;
    iPlano, iCodDocumento, UltIdBanco, iUnidNegoc, PortadorFormaDefault,
    iProvento, UltIdFavorecido: integer;
    sCodTipRecDes, sCodCentroRespon, sDebCre,
    sNomeTabela, sAnoMes, sCodFavorecidoSel, sCodTipoFolhaSel, sMensagem: string;
    dUltValorProvento, dTotal: double;

    procedure HabilitaBtOk;
    procedure HabilitaBtGerarCAP;
    procedure FazIntegraCAP;
    procedure GeraQueryPrincipal(TipoGeracao: TTipoGeracao);
    procedure FinalizarProcesso;
  end;

var
  frmParamReciboTerceiros: TfrmParamReciboTerceiros;

implementation

uses uSistema, uMensErro, uDocumento, uDataBase, fAguarde, dBaseDados, uFuncoesUteisRH,
  uFuncoesFolha, UsoGeralRH, dRelatorios2, fPrincipal;

{$R *.DFM}

procedure TfrmParamReciboTerceiros.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  ListaCodFavorecido := TStringList.Create;
  ListaCodTipoFolha := TStringList.Create;
  Documento := TDocumento.Create;

  cmbTipoPapel.Items.Assign(dtmRelatorios2.rpReciboTerceiros.PrinterSetup.PaperNames);

  iPos := ProcuraStList(cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  qryTipoDoc.Open;  
  FazQuery(dtmBaseDados.qry,'SELECT NORMALFIM FROM PARAMRH');
  dtedDataRef.Date := dtmBaseDados.qry.FieldByName('NORMALFIM').asDateTime;

  // Monto a Lista de Favorecidos
  chklstFavorecido.Items.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT');
    SQL.Add('  P.IDPESSOA, UPPER(DECODE(P.TIPO,''F'',P.NOME,P.RAZAOSOCIAL)) AS NOME');
    SQL.Add('FROM');
    SQL.Add('  PESSOA P, RUBRICAINDIV RI, RUBRICAXPESS RP');
    SQL.Add('WHERE');
    SQL.Add('  (RP.IDPESSOA      = '+IntToStr(Sistema.IdEmpresa)+') AND');
    SQL.Add('  (RI.FLGTPRUBMANUT = ''2'') AND');
    SQL.Add('  (RP.IDPESSOA      = RI.IDEMPRESA) AND');
    SQL.Add('  (RP.IDRUBRICA     = RI.IDRUBRICA) AND');
    SQL.Add('  (RI.IDFAVORECIDO  = P.IDPESSOA) AND');
    SQL.Add('  (P.NOME          IS NOT NULL)');
    SQL.Add('ORDER BY');
    SQL.Add('  NOME');
    Open;
    while not(EOF) do
    begin
      ListaCodFavorecido.Add(FieldByName('IDPESSOA').asString);
      chklstFavorecido.Items.Add(FieldByName('NOME').asString);
      Next;
    end;
  end;

  // Monto a Lista de Tipos de Folha
  chklstTipoFolha.Items.Clear;
  with (dtmBaseDados.qry) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT');
    SQL.Add('  IDMOTIVO, DESCRICAO');
    SQL.Add('FROM');
    SQL.Add('  MOTIVO');
    SQL.Add('WHERE');
    SQL.Add('  (GRUPOMOTIVO IN (''F'',''D''))');
    SQL.Add('ORDER BY');
    SQL.Add('  DESCRICAO');
    Open;
    while not(EOF) do
    begin
      ListaCodTipoFolha.Add(FieldByName('IDMOTIVO').asString);
      chklstTipoFolha.Items.Add(FieldByName('DESCRICAO').asString);
      Next;
    end;
  end;

  pgctrlPrincipal.ActivePageIndex := 0;
  pgctrlCAP.ActivePageIndex := 0;

  HabilitaBtOk;
end;

procedure TfrmParamReciboTerceiros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaCodTipoFolha.Free;
  ListaCodFavorecido.Free;

  dtmBaseDados.qry.Close;
  qryTipoDoc.Close;
  inherited;
end;

procedure TfrmParamReciboTerceiros.chklstFavorecidoDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmParamReciboTerceiros.dtedDataRefChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamReciboTerceiros.dblcTipoDocChange(Sender: TObject);
begin
  HabilitaBtGerarCAP;
end;

procedure TfrmParamReciboTerceiros.pgctrlPrincipalChange(Sender: TObject);
begin
  case (pgctrlPrincipal.ActivePageIndex) of
    0 : HabilitaBtOk;
    1 : bbtnConfirmar.Enabled := false;
  end;  
end;

procedure TfrmParamReciboTerceiros.memResultChange(Sender: TObject);
begin
  bbtnSalvar.Enabled := (memResult.Lines.Count > 0);
end;

procedure TfrmParamReciboTerceiros.chklstFavorecidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstFavorecidoClickCheck(Sender);
end;

procedure TfrmParamReciboTerceiros.chklstTipoFolhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstTipoFolhaClickCheck(Sender);
end;

procedure TfrmParamReciboTerceiros.chklstFavorecidoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
  HabilitaBtOk;
end;

procedure TfrmParamReciboTerceiros.chklstTipoFolhaClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmParamReciboTerceiros.bbtnSelTodosFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFavorecido.Items.Count-1 do
    chklstFavorecido.Checked[c] := true;

  chklstFavorecido.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamReciboTerceiros.bbtnInverteSelFuncClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFavorecido.Items.Count-1 do
    chklstFavorecido.Checked[c] := not(chklstFavorecido.Checked[c]);

  chklstFavorecido.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamReciboTerceiros.bbtnSalvarClick(Sender: TObject);
begin
  svdlgDialogo.Title    := 'Escolha a Pasta para salvar o Resultado da Geração';
  svdlgDialogo.FileName := '';
  if (svdlgDialogo.Execute) then
    memResult.Lines.SaveToFile(svdlgDialogo.FileName);
end;

procedure TfrmParamReciboTerceiros.bbtnConfirmarClick(Sender: TObject);
begin
  GeraQueryPrincipal(tpRelatorio);

  frmAguarde.Mostra('Recibo de Pagamento a Terceiros');
  frmAguarde.Pos := 0;

  dtmRelatorios2.qryReciboTerceiros.SQL.Text := dtmBaseDados.qry.SQL.Text;
  dtmRelatorios2.qryReciboTerceiros.Open;

  if not(dtmRelatorios2.qryReciboTerceiros.IsEmpty) then
  begin
    // Testa se o Usuário QUER ou NÃO o Rodapé de Autorizações
    dtmRelatorios2.rpFolhaPontoShape3.Visible      := (rgAutoriza.ItemIndex = 0);
    dtmRelatorios2.rpReciboTerceirosLine2.Visible  := (rgAutoriza.ItemIndex = 0);
    dtmRelatorios2.rpReciboTerceirosLabel2.Visible := (rgAutoriza.ItemIndex = 0);
    dtmRelatorios2.rpReciboTerceirosLabel3.Visible := (rgAutoriza.ItemIndex = 0);

    dtmRelatorios2.rpReciboTerceiros.PrinterSetup.PaperName :=
      cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
  end
  else
  begin
    ModalResult := mrNone;
    frmAguarde.Apaga;
    MsgDlg('Não há dados a serem exibidos!'+CR_LF+
           'Verifique.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
  end;
end;

procedure TfrmParamReciboTerceiros.bbtnGerarCAPClick(Sender: TObject);
var
  bErro: boolean;
  iUltPessJur: integer;
  sCentCust: string;
begin
  pbProgresso.Position := 0;
  lblProcesso.Visible  := true;
  tbshSelecaoCAP.Repaint;

  GeraQueryPrincipal(tpCAP);

  // query que contém todos os documentos criados neste processo
  if not(AbreTempDocum(tblDocumentos)) then
  begin
    FinalizarProcesso;
    exit;
  end;

  with (qryAux) do
  begin
    // Recupero o Portador Forma Padrão (É aquele que não possui o Banco associado)
    Close;
    SQL.Clear;
    SQL.Add('SELECT CodPortForma FROM BANCOPORTFOLHA WHERE (IdBanco IS NULL)');
    Open;

    if (IsEmpty) then
      PortadorFormaDefault := 0
    else
      PortadorFormaDefault := FieldByName('CodPortForma').asInteger;

    // Recupero o Banco que a Empresa possui conta
    Close;
    SQL.Clear;
    SQL.Add('SELECT PC.IdBanco FROM PortadorForma PF, PortadorConta PC');
    SQL.Add('WHERE PF.CodPortForma = ' + IntToStr(PortadorFormaDefault));
    SQL.Add('AND   PF.CodPortador  = PC.CodPortador');
    Open;

    if (IsEmpty) then
      UltIdBanco := 0
    else
      UltIdBanco := FieldByName('IDBANCO').asInteger;

    Close;
  end;
  frmPrincipal.prmCodTipDoc := dblcTipoDoc.LookupValue;

  try
    dtmBaseDados.qry.Open;
  except
    MsgDlg('Ocorreu um erro na abertura da Query principal!'+CR_LF+
           'Entre em contato com a CM Soluções.', 'Aviso',
           mtWarning, [mbOk,mbHelp], 0);
    FinalizarProcesso;
    exit;
  end;

  if (dtmBaseDados.qry.IsEmpty) then
  begin
    MsgDlg('Não há dados a serem gerados com os Parâmetros selecionados!'+CR_LF+
           'Verifique e tente novamente.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    FinalizarProcesso;
    exit;
  end;

  pbProgresso.Max := dtmBaseDados.qry.RecordCount;
  pnlFundo.Refresh;
  Dock971.Refresh;

  // LOOP para a geração da Linhas de Integração
  iUltPessJur := -1;
  bErro := false;
  memResult.Lines.Clear;
  while not(dtmBaseDados.qry.EOF) do
  begin
    // Quebra empresa
    if (dtmBaseDados.qry.FieldByName('IDEMPRESA').asInteger <> iUltPessJur) then
    begin
      iUltPessJur := dtmBaseDados.qry.FieldByName('IDEMPRESA').asInteger;
      // Pego o Plano de Contas
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT PR.PLANO FROM PLANO PL, PARAMCONTAB PR');
      qryAux.SQL.Add('WHERE  (PR.IDPESSOA = ' +IntToStr(iUltPessJur)+ ') AND');
      qryAux.SQL.Add('       (PR.PLANO    = PL.PLANO)');
      qryAux.Open;
      iPlano := qryAux.FieldByName('PLANO').asInteger;
      qryAux.Close;
    end;

    iProvento := dtmBaseDados.qry.FieldByName('IDRUBRICA').asInteger;
    sCentCust := dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT');
    qryAux.SQL.Add('  C.IDPLANO1, C.IDPLANO2, C.CONTADEBITO, C.IDPESSDEBITO,');
    qryAux.SQL.Add('  C.CONTACREDITO, C.IDPESSCREDITO, C.CODSUBDEBITO,');
    qryAux.SQL.Add('  C.CODSUBCREDITO, C.RECPAG, C.CODTIPRECDES, C.CODCENTRORESPON,');
    qryAux.SQL.Add('  C.UNIDNEGOC, C.IDFAVORECIDO, PD.DESCRICAO, PD.FLGDESCONTO');
    qryAux.SQL.Add('FROM');
    qryAux.SQL.Add('  CONTABFOLHA C, PROVDESC PD');
    qryAux.SQL.Add('WHERE');
    qryAux.SQL.Add('  (C.IDPROVENTO     = '+IntToStr(iProvento)+') AND');
    qryAux.SQL.Add('  (C.CODCENTROCUSTO = '+QuotedStr(dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString)+') AND');
    qryAux.SQL.Add('  (C.IDEMPRESA      = '+dtmBaseDados.qry.FieldByName('IDEMPRESA').asString+') AND');
    qryAux.SQL.Add('  (C.IDPROVENTO     = PD.IDPROVENTO)');
    qryAux.Open;

    if (qryAux.IsEmpty) then
    begin
      sCentCust := '';
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT');
      qryAux.SQL.Add('  C.IDPLANO1, C.IDPLANO2, C.CONTADEBITO, C.IDPESSDEBITO,');
      qryAux.SQL.Add('  C.CONTACREDITO, C.IDPESSCREDITO, C.CODSUBDEBITO,');
      qryAux.SQL.Add('  C.CODSUBCREDITO, C.RECPAG, C.CODTIPRECDES, C.CODCENTRORESPON,');
      qryAux.SQL.Add('  C.UNIDNEGOC,C.IDFAVORECIDO, PD.DESCRICAO, PD.FLGDESCONTO');
      qryAux.SQL.Add('FROM');
      qryAux.SQL.Add('  CONTABFOLHA C, PROVDESC PD');
      qryAux.SQL.Add('WHERE');
      qryAux.SQL.Add('  (C.IDPROVENTO      = '+IntToStr(iProvento)+') AND');
      qryAux.SQL.Add('  (C.CODCENTROCUSTO IS NULL) AND');
      qryAux.SQL.Add('  (C.IDPROVENTO = PD.IDPROVENTO)');
      qryAux.Open;
    end;

    if not(qryAux.IsEmpty) then
    begin
      iUnidNegoc       := qryAux.FieldByName('UNIDNEGOC').asInteger;
      sCodCentroRespon := qryAux.FieldByName('CODCENTRORESPON').asString;
      sCodTipRecDes    := qryAux.FieldByName('CODTIPRECDES').asString;
      UltIdFavorecido  := dtmBaseDados.qry.FieldByName('IDFAVORECIDO').asInteger;

      // Indica se é um Débito ou Crédito
      if (qryAux.FieldByName('FLGDESCONTO').asInteger = 0) then
        sDebCre := 'D'
      else
        sDebCre := 'C';

      // Guardo o valor da Rubrica
      dUltValorProvento := dtmBaseDados.qry.FieldByName('VALOR').asFloat;
      if (sCodTipRecDes <> '') then
        FazIntegraCAP
      else
      begin
        bErro := true;
        memResult.Lines.Add('[Erro] Geração dos dados para o Contas a Pagar');
        memResult.Lines.Add('Favorecido.......: ' +dtmBaseDados.qry.FieldByName('FAVORECIDO').asString);
        if (chkRateioCC.Checked) then
          memResult.Lines.Add('Centro de Custo: ' +dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString);
        memResult.Lines.Add('Rubrica............: ' +IntToStr(iProvento));
        memResult.Lines.Add('Código do Tipo de Recebimento ou Desembolso em branco.');
        memResult.Lines.Add(Replicate('-',97));
      end;
    end;
    pbProgresso.StepIt;
    dtmBaseDados.qry.Next;
  end;

  // Totalizo os valores dos documentos a serem gerados
  dTotal := 0;
  tblDocumentos.First;
  while not (tblDocumentos.EOF) do
  begin
    if (tblDocumentos.FieldByName('DEBCRE').asString = 'D') Then
      dTotal := dTotal + tblDocumentos.FieldByName('VALOR').asFloat
    else
      dTotal := dTotal - tblDocumentos.FieldByName('VALOR').asFloat;

    tblDocumentos.Next;
  end;
  tblDocumentos.First;

  // Gravo no Banco os Documentos
  try
    iCodDocumento := DescarregaQryDocumentos(
      tblDocumentos,
      UltIdBanco,
      0,
      IntToStr(PortadorFormaDefault),
      Copy(sAnoMes,5,2),
      Copy(sAnoMes,1,4),
      dTotal,
      StrToDate(dtPagamento.Text),
      Documento,
      chkRateioCC.Checked);

    if (bErro) then
      MsgDlg('Contas a Pagar efetuada com erros!'+CR_LF+
             'Consulte Resultado da geração para maiores detalhes.', 'Informação',
             mtWarning, [mbOk,mbHelp], 0)
    else
      MsgDlg('Contas a Pagar efetuada com sucesso.', 'Informação', mtWarning, [mbOk,mbHelp], 0);
  except
    MsgDlg('Ocorreu um erro na geração do Contas a Pagar.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
  end;
  FinalizarProcesso;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------
procedure TfrmParamReciboTerceiros.FinalizarProcesso;
begin
  dtmBaseDados.qry.Close;
  tblDocumentos.Close;

//  ApagaTabelaTemp(ExtractFilePath(Application.ExeName), 'TempDoc');

  pgctrlCAP.ActivePageIndex := 1;
  pbProgresso.Position := 0;
  lblProcesso.Visible := false;
end;

procedure TfrmParamReciboTerceiros.GeraQueryPrincipal(TipoGeracao: TTipoGeracao);
begin
  // Favorecidos selecionados
  CriaListaOpcoes(chklstFavorecido, ListaCodFavorecido, sCodFavorecidoSel, ',', false);

  // Tipos de Folha selecionados
  CriaListaOpcoes(chklstTipoFolha, ListaCodTipoFolha, sCodTipoFolhaSel, ',', false);

  if (rgProcesso.ItemIndex = 0) then
    sNomeTabela := 'PREVIAFOLPAG'
  else
    sNomeTabela := 'HISTRUBSAL';

  sAnoMes := QuotedStr(Copy(dtedDataRef.Text,7,4) +'/'+ Copy(dtedDataRef.Text,4,2));

  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    if (TipoGeracao = tpRelatorio) then
    begin
      Add('SELECT');
      Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
      Add('  DECODE(P.TIPO,''F'',P.NOME,P.RAZAOSOCIAL) AS NOME,');
      Add('  ('+QuotedStr(dtedDataRef.Text)+') AS DATA_REF,');
      Add('  (DECODE(PJ.NUMDOCUMENTO,NULL,'''', ''CNPJ: '' || PJ.NUMDOCUMENTO)) AS CGC,');
      Add('  CPF_CGC.NUM AS CPFCGC,');
      Add('  RTRIM(DECODE(RTRIM(ESTADUAL.NUMDOCUMENTO),'''',');
      Add('    DECODE(RTRIM(MUNICIPAL.NUMDOCUMENTO),'''','''',');
      Add('    ''Inscrição Municipal: ''|| MUNICIPAL.NUMDOCUMENTO),');
      Add('    ''Inscrição Estadual: '' || ESTADUAL.NUMDOCUMENTO)) AS ESTADUALMUNICIPAL,');
      Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||''''|| DECODE(E.COMPLEMENTO,'' '','' - '' ||''''||');
      Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||'' - CEP:''||');
      Add('    RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,');
      Add('  RTRIM(RP.DESCRPROVDESC) || DECODE(PD.CODRUBCLT,''50018'','' ('' ||');
      Add('    DECODE(PFAV.NOME,'''','''',RTRIM(PFAV.NOME)) || '')'') AS DESCRICAO,');
      Add('  HIST.VALOR,');
      Add('  CONTA_BANCARIA.NOME_BANCO,');
      Add('  CONTA_BANCARIA.AGENCIA,');
      Add('  CONTA_BANCARIA.CONTACORRENTE');
      Add('FROM');
      Add('  PESSOA PJ, PESSOA P, PESSOA PFAV, ENDPESS E, RUBRICAXPESS RP,');
      Add('  RUBRICAINDIV RI, PROVDESC PD, FUNCIONARIO F, ESTADO ES, CIDADES,');
      // ------------------------------------------------------------------ //
      // Inscrição Estadual
      Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
      Add('   WHERE (TD.SIGLADOCUMENTO = ''ESTADUAL:'') AND');
      Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) ESTADUAL,');
      // -------------------------------------------------------------------------- //
      // Inscrição Municipal
      Add('  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO');
      Add('   FROM   DOCPESSOA D, TIPODOCOFICIAL TD');
      Add('   WHERE (TD.SIGLADOCUMENTO = ''MUNICIPAL:'') AND');
      Add('         (TD.IDDOCUMENTO    = D.IDDOCUMENTO)) MUNICIPAL,');
      // ------------------------------------------------------------------ //
      // CNPJ
      Add('  (SELECT DP.IDPESSOA, RTRIM(DP.NUMDOCUMENTO) AS NUM');
      Add('   FROM   DOCPESSOA DP, TIPODOCOFICIAL TDO');
      Add('   WHERE  ((TDO.SIGLADOCUMENTO = ''CPF:'') OR');
      Add('           (TDO.SIGLADOCUMENTO = ''CGC:'')) AND');
      Add('          (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO)) CPF_CGC,');
      // ------------------------------------------------------------------ //
      // Histórico de Rubricas
      Add('  (SELECT');
      Add('     RI.IDEMPRESA, RI.IDFAVORECIDO, H.IDRUBRICA, SUM(H.VALORPROVENTO) AS VALOR');
      Add('   FROM');
      Add('     '+sNomeTabela+' H, RUBRICAINDIV RI');
      Add('   WHERE');

      if (Pos(',',sCodFavorecidoSel) > 0) then
        Add('     (RI.IDFAVORECIDO   IN (' +sCodFavorecidoSel+ ')) AND')
      else
        Add('     (RI.IDFAVORECIDO    = ' +sCodFavorecidoSel+ ') AND');

      Add('     (RI.FLGTPRUBMANUT   = ''2'') AND');
      Add('     (((RI.FLGPERMANENTE = ''0'') AND');
      Add('       (RI.ANOMESINICIO  = ' +sAnoMes+ ')) OR');
      Add('      (RI.FLGPERMANENTE  = ''1'')) AND');
      Add('     (H.MES              = ' +sAnoMes+ ') AND');

      if (sCodTipoFolhaSel <> '') then
      begin
        if (Pos(',',sCodTipoFolhaSel) > 0) then
          Add('     (H.IDMOTIVO        IN (' +sCodTipoFolhaSel+ ')) AND')
        else
          Add('     (H.IDMOTIVO         = ' +sCodTipoFolhaSel+ ') AND');
      end;

      Add('     (RI.IDEMPRESA       = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
      Add('     (RI.IDRUBRICA       = H.IDRUBRICA) AND');
      Add('     (RI.IDPESSOA        = H.IDPESSOA)');
      Add('   GROUP BY H.IDRUBRICA, RI.IDFAVORECIDO, RI.IDEMPRESA) HIST,');
      // ------------------------------------------------------------------ //
      Add('  (SELECT DISTINCT');
      Add('     FAV.IDPESSOA, (''Banco: ''||RTRIM(PB.NOME)) AS NOME_BANCO,');
      Add('     (''Agência: ''||RTRIM(A.NUMAGENCIA)||'' - ''||RTRIM(PA.NOME)) AS AGENCIA,');
      Add('     (''Conta: ''||C.CONTACORRENTE) AS CONTACORRENTE');
      Add('   FROM');
      Add('     PESSOA PA, PESSOA PB, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B, FORNSERV FAV');
      Add('   WHERE');

      if (Pos(',',sCodFavorecidoSel) > 0) then
        Add('     (FAV.IDPESSOA IN (' +sCodFavorecidoSel+ ')) AND')
      else
        Add('     (FAV.IDPESSOA = ' +sCodFavorecidoSel+ ') AND');

      Add('     (FAV.IDPESSOA = C.IDPESSOA) AND');
      Add('     (C.IDAGENCIA  = A.IDPESSOA) AND');
      Add('     (A.IDBANCO    = B.IDPESSOA) AND');
      Add('     (A.IDPESSOA   = PA.IDPESSOA) AND');
      Add('     (B.IDPESSOA   = PB.IDPESSOA)) CONTA_BANCARIA');
      // ------------------------------------------------------------------ //
      Add('WHERE');
      Add('  (HIST.IDEMPRESA    = RI.IDEMPRESA) AND');
      Add('  (HIST.IDRUBRICA    = RI.IDRUBRICA) AND');
      Add('  (HIST.IDEMPRESA    = RP.IDPESSOA) AND');
      Add('  (HIST.IDRUBRICA    = RP.IDRUBRICA) AND');
      Add('  (HIST.IDFAVORECIDO = P.IDPESSOA) AND');
      Add('  (HIST.IDFAVORECIDO = RI.IDFAVORECIDO) AND');
      Add('  (HIST.IDRUBRICA    = PD.IDPROVENTO) AND');
      Add('  (HIST.IDEMPRESA    = F.IDEMPRESA) AND');
      Add('  (RI.IDPESSOA       = F.IDPESSOA) AND');
      Add('  (F.IDESTAB         = PJ.IDPESSOA) AND');
      Add('  (RI.IDPESSOA       = PFAV.IDPESSOA(+)) AND');
      Add('  (P.IDPESSOA        = CPF_CGC.IDPESSOA(+)) AND');
      Add('  (PJ.IDPESSOA       = E.IDPESSOA(+)) AND');
      Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO(+)) AND');
      Add('  (E.IDCIDADES       = CIDADES.IDCIDADES(+)) AND');
      Add('  (CIDADES.IDESTADO  = ES.IDESTADO(+)) AND');
      Add('  (PJ.IDPESSOA       = ESTADUAL.IDPESSOA(+)) AND');
      Add('  (PJ.IDPESSOA       = MUNICIPAL.IDPESSOA(+)) AND');
      Add('  (P.IDPESSOA        = CONTA_BANCARIA.IDPESSOA(+))');
      Add('ORDER BY');
      Add('  UPPER(NOME)');
    end
    else
    begin
      Add('SELECT');
      Add('  HIST.IDEMPRESA, F.CODCENTROCUSTO,');
      Add('  PFAV.NOME AS FAVORECIDO, PFAV.IDPESSOA AS IDFAVORECIDO,');
      Add('  HIST.IDRUBRICA, HIST.VALOR');
      Add('FROM');
      Add('  PESSOA PFAV, FUNCIONARIO F,');
      // ------------------------------------------------------------------ //
      // Histórico de Rubricas
      Add('  (SELECT');
      Add('     RI.IDEMPRESA, RI.IDFAVORECIDO, H.IDRUBRICA, H.IDPESSOA,');
      Add('     SUM(H.VALORPROVENTO) AS VALOR');
      Add('   FROM');
      Add('     '+sNomeTabela+' H, RUBRICAINDIV RI');
      Add('   WHERE');

      if (Pos(',',sCodFavorecidoSel) > 0) then
        Add('     (RI.IDFAVORECIDO   IN (' +sCodFavorecidoSel+ ')) AND')
      else
        Add('     (RI.IDFAVORECIDO    = ' +sCodFavorecidoSel+ ') AND');

      Add('     (RI.FLGTPRUBMANUT   = ''2'') AND');
      Add('     (((RI.FLGPERMANENTE = ''0'') AND');
      Add('       (RI.ANOMESINICIO  = ' +sAnoMes+ ')) OR');
      Add('      (RI.FLGPERMANENTE  = ''1'')) AND');
      Add('     (H.MES              = ' +sAnoMes+ ') AND');

      if (sCodTipoFolhaSel <> '') then
      begin
        if (Pos(',',sCodTipoFolhaSel) > 0) then
          Add('     (H.IDMOTIVO        IN (' +sCodTipoFolhaSel+ ')) AND')
        else
          Add('     (H.IDMOTIVO         = ' +sCodTipoFolhaSel+ ') AND');
      end;

      Add('     (RI.IDEMPRESA       = ' +IntToStr(Sistema.IDEmpresa)+ ') AND');
      Add('     (RI.IDRUBRICA       = H.IDRUBRICA) AND');
      Add('     (RI.IDPESSOA        = H.IDPESSOA)');
      Add('   GROUP BY RI.IDEMPRESA, RI.IDFAVORECIDO, H.IDRUBRICA, H.IDPESSOA) HIST');
      // ------------------------------------------------------------------ //
      Add('WHERE');

      if (Pos(',',sCodFavorecidoSel) > 0) then
        Add('  (PFAV.IDPESSOA IN (' +sCodFavorecidoSel+ ')) AND')
      else
        Add('  (PFAV.IDPESSOA  = ' +sCodFavorecidoSel+ ') AND');

      Add('  (PFAV.IDPESSOA  = HIST.IDFAVORECIDO) AND');
      Add('  (HIST.IDPESSOA  = F.IDPESSOA)');
      Add('ORDER BY');
      Add('  PFAV.IDPESSOA, HIST.IDRUBRICA');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
end;

procedure TfrmParamReciboTerceiros.HabilitaBtOk;
var
  c: integer;
  bSelFavorec: boolean;
begin
  // Verifica se algum Favorecido foi selecionado
  bSelFavorec := false;
  for c:=0 to chklstFavorecido.Items.Count-1 do
    if (chklstFavorecido.Checked[c]) then
    begin
      bSelFavorec := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelFavorec) and (Trim(dtedDataRef.Text) <> '');

  if (bSelFavorec) and (Trim(dtedDataRef.Text) <> '') then
    bbtnGerarCAP.Tag := 1
  else
    bbtnGerarCAP.Tag := 0;

  HabilitaBtGerarCAP;
end;

procedure TfrmParamReciboTerceiros.HabilitaBtGerarCAP;
begin
  bbtnGerarCAP.Enabled := (bbtnGerarCAP.Tag = 1) and (Trim(dblcTipoDoc.Text) <> '') and
    (Trim(dtPagamento.Text) <> '');
end;

procedure TfrmParamReciboTerceiros.FazIntegraCAP;
begin
  if not(AlimentaQryDocumentos(tblDocumentos,
         -1,
         -1,
         iPlano,
         IFF(iUnidNegoc <> 0, iUnidNegoc, -1),
         PortadorFormaDefault,
         UltIdFavorecido,
         '',
         sCodCentroRespon,
         sCodTipRecDes,
         sDebCre,
         dUltValorProvento,
         sMensagem,
         0,
         IFF(chkRateioCC.Checked, dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString, ''))) then
  begin
    memResult.Lines.Add('[Erro] Geração dos dados para o Contas a Pagar');
    memResult.Lines.Add('Favorecido.......: ' +dtmBaseDados.qry.FieldByName('FAVORECIDO').asString);
    if (chkRateioCC.Checked) then
      memResult.Lines.Add('Centro de Custo: ' +dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString);
    memResult.Lines.Add('Rubrica............: ' +IntToStr(iProvento));
    memResult.Lines.Add(sMensagem);
    memResult.Lines.Add(Replicate('-',97));
  end
  else
  begin
    memResult.Lines.Add('[Ok] Geração dos dados para o Contas a Pagar');
    memResult.Lines.Add('Favorecido.......: ' +dtmBaseDados.qry.FieldByName('FAVORECIDO').asString);
    if (chkRateioCC.Checked) then
      memResult.Lines.Add('Centro de Custo: ' +dtmBaseDados.qry.FieldByName('CODCENTROCUSTO').asString);
    memResult.Lines.Add('Rubrica............: ' +IntToStr(iProvento));
    memResult.Lines.Add(Replicate('-',97));
  end;
end;

end.
