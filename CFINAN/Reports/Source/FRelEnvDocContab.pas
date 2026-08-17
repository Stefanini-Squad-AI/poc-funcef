unit FRelEnvDocContab;
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 160767/5542
Nº KINTANA..: 1362753
Data........: 18/07/2011
Responsável.: Leandro S. Costa
Descrição...: Quando não retornar nenhum documento para o Lote, a grid ficará desabilitada
              dessa forma não permitindo que o usuário clique e ocasione erros.
---------------------------------------------------------------------------------------------------}
{
--------------------------------------------------------------------------------
Data      : 18/03/2008
Pendência :
Autor     : Augusto
Descrição : Novo tratameto para o processo, agora lendo e gravando dados na tabela
            MOVINFINANC
--------------------------------------------------------------------------------
Rotina..........: AjustaColunasGrid, _ValidaDefazLotes
N. Sol..........: 90187-90779-90780-90781
N. Kintana......: 380204-383016-383017-383018
Data............: 12/11/2008
Responsável.....: Marilza Colpani
Descrição.......: - Corrigido o envio de parte dos documentos de um lote;
                  - Resultado da pesquisa de Documentos está retornando Nodocumento;
                  - O último filtro do formulário está identificado (Nº Fatura).
                  - Inserido filtros: Data do Envio e Data da Baixa;
                  - Filtro Planilha Contábil foi referenciado ao campo PLNPLANIL da tabela PLANILHA;
                  - Ao alterar entre as abas ”Não Enviados” e “Enviados”, os Checks Box da opção Módulos permanecem ativados;
                  - Corrigido problemas da movimentação do Controle Financeiro;
                  - Corrigida as consultas por: Documento, Número AP/AR, Número do Lote, Valor Documento, Planilha Contábil;
                  - A Hora do Envio foi corrigida;
                  - Inserido Check Box nos documentos na opção “Enviados”;
                  - Inserido número da planilha contábil dos documentos;
                  - Valor do documento está sendo exibido corretamente;
                  - Corrigido as emissões de relatórios.
--------------------------------------------------------------------------------
Rotina..........: Consulta de documentos
N. Sol..........: 90187-90779-90780-90781
N. Kintana......: 380204-383016-383017-383018
Data............: 28/11/2008
Responsável.....: Marilza Colpani
Descrição.......: Inclusão do campo NUMLANCTO no cdsDocumentos, qryDocumentos e SqlDocumentos
--------------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, StdCtrls, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Buttons, CmParamReport,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, Db,
  uCmSqlParams, DBClient, uCMClientDataSet, uCtrlParamIntegra, MontaSelect,
  Mask, DBTables, Wwquery, uCtrlRptEnvioDocumento, Provider, ComCtrls,
  wwdblook;

type
  TfrmParamRelatEnvDocContab = class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    SbAdTodos: TSpeedButton;
    SbAdInverte: TSpeedButton;
    cdsLotes: TCMClientDataSet;
    sqlLotes: TCMSqlParams;
    dsLotes: TDataSource;
    MontaSelect1: TMontaSelect;
    qryDocumentos: TwwQuery;
    dspDocumentos: TDataSetProvider;
    MontaSelect2: TMontaSelect;
    pnlTopo: TPanel;
    pnlPageControl: TPanel;
    pagFiltro: TPageControl;
    tabNaoEnviados: TTabSheet;
    tabEnviados: TTabSheet;
    lbltsEnvIdEnvio: TLabel;
    GrBxFiltroDatas: TGroupBox;
    lblAte: TLabel;
    lblDe: TLabel;
    DlIni: TCMDateTimePicker;
    DlFim: TCMDateTimePicker;
    rdbDtLancto: TRadioButton;
    rdbDtdisponib: TRadioButton;
    rdbDtEnvioContab: TRadioButton;
    btPesquisa: TButton;
    btDesfazerEnvio: TButton;
    grbxModulos: TGroupBox;
    cbContasPagar: TCheckBox;
    cbContasReceber: TCheckBox;
    cbCFinan: TCheckBox;
    GroupBox1: TGroupBox;
    ednVlrDoc: TRealEdit;
    edtNroDoc: TEdit;
    edtNroApAr: TEdit;
    edtPlanilhaContab: TEdit;
    edtNroLote: TEdit;
    lblNroDocumento: TLabel;
    lblApAr: TLabel;
    lblVlrDoc: TLabel;
    lblNroLote: TLabel;
    lblPlanilhaContab: TLabel;
    sqlDocumentos: TCMSqlParams;
    cdsDocumentos: TCMClientDataSet;
    dsDocumentos: TDataSource;
    Panel2: TPanel;
    dbgrdLote: TwwDBGrid;
    dbgrdDocumento: TwwDBGrid;
    Bevel1: TBevel;
    dspLotes: TDataSetProvider;
    qryLotes: TwwQuery;
    cdsLotesSELECIONADO: TFloatField;
    cdsLotesSTATUS: TStringField;
    cdsLotesHISTORICO: TStringField;
    cdsLotesVALORLANCFINAN: TFloatField;
    cdsLotesNUMCHQBORDERO: TStringField;
    cdsLotesDATALANCFINAN: TDateTimeField;
    cdsLotesENTRADASAIDA: TStringField;
    cdsLotesDATADISPFINANC: TDateTimeField;
    cdsLotesIDENVIODOCUMENTO: TFloatField;
    cdsLotesCODLANCFINANC: TFloatField;
    cdsLotesNOMEMODULO: TStringField;
    cdsLotesPORTADORCONTA: TStringField;
    edtIdEnvio: TEdit;
    btPesqIdEnvio: TButton;
    cdsDocumentosVLRBRUTO: TFloatField;
    cdsDocumentosVLRLIQUIDO: TFloatField;
    cdsDocumentosNUMLOTE: TFloatField;
    cdsDocumentosTIPO: TStringField;
    cdsDocumentosCODLANCFINANC: TFloatField;
    cdsDocumentosCODDOCUMENTO: TFloatField;
    cdsDocumentosIDPESSOA: TFloatField;
    cdsDocumentosIDFORCLI: TFloatField;
    cdsDocumentosNODOCUMENTO: TFloatField;
    cdsDocumentosNUMAPGR: TFloatField;
    cdsDocumentosNOME: TStringField;
    cdsDocumentosRAZAOSOCIAL: TStringField;
    cdsDocumentosSELECIONADO: TFloatField;
    cdsDocumentosSTATUS: TStringField;
    btFazerEnvio: TButton;
    MsDocumentos: TMontaSelect;
    btnBuscaDoc: TBitBtn;
    btnLimpaDoc: TBitBtn;
    rdbDtBaixaDocumento: TRadioButton;
    cdsDocumentosPLNPLANIL: TFloatField;
    cdsDocumentosNUMLANCTO: TFloatField;
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btPesquisaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tabNaoEnviadosShow(Sender: TObject);
    procedure tabEnviadosShow(Sender: TObject);
    procedure btPesqIdEnvioClick(Sender: TObject);
    procedure btDesfazerEnvioClick(Sender: TObject);
    procedure cdsLotesSELECIONADOChange(Sender: TField);
    procedure cdsDocumentosSELECIONADOChange(Sender: TField);
    procedure btFazerEnvioClick(Sender: TObject);
    procedure btnBuscaDocClick(Sender: TObject);
    procedure btnLimpaDocClick(Sender: TObject);
    procedure pagFiltroChange(Sender: TObject);
    procedure rdbDtLanctoClick(Sender: TObject);
    procedure FocoEntrada(Sender: TObject);
    procedure ednVlrDocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsLotesAfterScroll(DataSet: TDataSet);
    procedure cdsLotesAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
    CtrlEnvioDocumento : TCtrlRptEnvioDocumento;
    procedure ExecutaPesquisa(IdEnvio: String=''; IdModulo: String='');
    function  TrocaPontoOuVirgula(bTrocaPorPonto: Boolean; sValor: string): string;
    procedure AjustaColunasGrid(const pMostraEnviar: Boolean);
    procedure AcertaDocumento(const pSelecionado: Integer);
    function  ImprimeRelatorio(const pIDEnvio : Integer) : Boolean;
    function  AcertaParametros(Const pIDEnvio : Integer) : Boolean;
    procedure AtivaRelacionamento;
    procedure DesAtivaRelacionamento;
    procedure Defaultbotoes(const poBotao: Tobject);
  public
    { Public declarations }
  end;

var
  frmParamRelatEnvDocContab: TfrmParamRelatEnvDocContab;
  IdEnvio : Integer;



  implementation

uses uSistema, DBaseDados, UMensErro;

{$R *.DFM}

procedure TfrmParamRelatEnvDocContab.SbAdTodosClick(Sender: TObject);
var registro : TbookMark;
begin
  inherited;
  DesativaRelacionamento;
  with cdslotes do
  begin
    registro := GetBookmark;
    DisableControls;
    First;
    while not Eof do
    begin
      Edit;
      FieldByName('SELECIONADO').AsString := '1';
      Post;
      Next;
    end;
    GotoBookmark(Registro);
    FreeBookmark(Registro);
    EnableControls;
  end;
  AtivaRelacionamento;
end;

procedure TfrmParamRelatEnvDocContab.SbAdInverteClick(Sender: TObject);
var registro : TbookMark;
begin
  inherited;
  DesativaRelacionamento;
  with cdsLotes do
  begin
    registro := GetBookmark;
    DisableControls;
    First;
    begin
      Edit;
      if FieldByName('SELECIONADO').AsString = '1' then
        FieldByName('SELECIONADO').AsString := '0'
      else
        FieldByName('SELECIONADO').AsString := '1';
      Post;
      Next;
    end;
    GotoBookmark(Registro);
    FreeBookmark(Registro);
    EnableControls;
  end;
  AtivaRelacionamento;
end;

procedure TfrmParamRelatEnvDocContab.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEnvioDocumento:= TCtrlRptEnvioDocumento.Create;

  CtrlEnvioDocumento.Initialize(DtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True);

//  rdbDtVenc.Checked:= True;
  DlIni.date := now;
  DlFim.date := now;

  pagFiltro.ActivePage := tabNaoEnviados;
  DefaultBotoes(btPesquisa);
end;

procedure TfrmParamRelatEnvDocContab.Defaultbotoes(const poBotao : Tobject);
begin
  bbtnConfirmar.Default := (poBotao = bbtnConfirmar);
  btPesquisa.Default    := (poBotao = btPesquisa);
end;

procedure TfrmParamRelatEnvDocContab.bbtnConfirmarClick(Sender: TObject);
begin
   //If (Not cbCFinan.Checked) and (cdsDocumentos.IsEmpty) then
  If (cdsLotes.IsEmpty) then
    MsgDlg('Execute a consulta antes de imprimir.','Erro',mtError,[mbOk],0)
  else
  begin
    If edtIdEnvio.text <> '' then
      idEnvio := StrToInt(edtIdEnvio.Text);

    if not ImprimeRelatorio(idEnvio) then
      MsgDlg('Não existem dados a serem impressos.','Erro',mtError,[mbOk],0)
    else
      ModalResult := mrOk;
  end;
end;

function TfrmParamRelatEnvDocContab.AcertaParametros(Const pIdEnvio : Integer) : Boolean;
var SCodDocumento: String;
    sNomeArqMovimento,
    sNomeArqDocumento : pChar;
begin
  Result := False;
  Cmp_Padrao.ParamValues[0].AsString  :=  DlIni.Text;
  Cmp_Padrao.ParamValues[1].AsString  :=  DlFim.Text;
  Cmp_Padrao.ParamValues[2].AsString  :=  '';
  Cmp_Padrao.ParamValues[3].AsString  :=  '';
  Cmp_Padrao.ParamValues[4].AsString  :=  '';
  Cmp_Padrao.ParamValues[5].AsString  := IntToStr(pIDEnvio);
  Cmp_Padrao.ParamValues[6].AsBoolean := (pagFiltro.ActivePage = tabNaoEnviados);
  Cmp_Padrao.ParamValues[7].AsBoolean := (pagFiltro.ActivePage <> tabNaoEnviados);
  Cmp_Padrao.ParamValues[8].AsString  :=  '';

  if rdbDtLancto.Checked then
    Cmp_Padrao.ParamValues[9].AsString := 'L';
  if rdbDtdisponib.Checked then
    Cmp_Padrao.ParamValues[9].AsString := 'D';
  if rdbDtEnvioContab.Checked then
    Cmp_Padrao.ParamValues[9].AsString := 'C';
  if rdbDtBaixaDocumento.Checked then
    Cmp_Padrao.ParamValues[9].AsString := 'B';

  SCodDocumento := '';

  cdsDocumentos.First;
  while not cdsDocumentos.Eof do
  begin
    if (cdsDocumentos.FieldByName('SELECIONADO').AsString = '1') or
       (pagFiltro.ActivePage = tabEnviados) then
    begin
      If Pos(',' + cdsDocumentos.FieldByName('CODLANCFINANC').AsString,sCodDocumento) = 0 then
        SCodDocumento := SCodDocumento + ',' + cdsDocumentos.FieldByName('CODLANCFINANC').AsString;
      Result := True;
    end;
    cdsDocumentos.Next;
  end;
  Result := Result or ((cbCFinan.Checked) and (CdsDocumentos.isEmpty));

  Cmp_Padrao.ParamValues[10].AsString := copy(SCodDocumento,2,length(SCodDocumento));

  GetMem(sNomeArqMovimento,255);
  GetTempFileName(pChar(Sistema.TempDir),'TMP',0,sNomeArqMovimento);
  GetMem(sNomeArqDocumento,255);
  GetTempFileName(pChar(Sistema.TempDir),'TMP',0,sNomeArqDocumento);

  Cmp_Padrao.ParamValues[11].AsString := sNomeArqMovimento;
  Cmp_Padrao.ParamValues[12].AsString := sNomeArqDocumento;

end;

function TfrmParamRelatEnvDocContab.ImprimeRelatorio(const pIdEnvio : integer): Boolean;
begin
  Result := AcertaParametros(pIDEnvio);
  If Result then
  begin
    cdsLotes.SaveToFile(Cmp_Padrao.ParamValues[11].AsString);
    cdsDocumentos.SaveToFile(Cmp_Padrao.ParamValues[12].AsString);
  end;

  // essa parte foi mudada pois não há mais necessidade de validar dessa forma,
  // uma vez que serão sempre impressos tudo o que estiver na grid, obedecendo
  // os critérios de filtragem de acordo com a active page do pagfiltro.
  //

  {  If pagFiltro.ActivePage = tabNaoEnviados then
  begin
    If Result then
    begin
      cdsLotes.SaveToFile(Cmp_Padrao.ParamValues[11].AsString);
      cdsDocumentos.SaveToFile(Cmp_Padrao.ParamValues[12].AsString);
    end;
  end
  else
  begin
    if  (pagFiltro.ActivePage = tabEnviados) and
        (edtIdEnvio.Text <> '') and
        (cdsDocumentos.Eof) then
    begin
      ExecutaPesquisa(IntToStr(pIdEnvio));
      Result := Not cdsDocumentos.IsEmpty;
    end;
  end; }
end;

procedure TfrmParamRelatEnvDocContab.btPesquisaClick(Sender: TObject);
var FIdModulo: String;
begin
  inherited;
  DefaultBotoes(bbtnConfirmar);
  // --> Leandro S. Costa SOL: 160767/5542 Kintana: 1362753
  dbgrdDocumento.Enabled := True;
  dbgrdLote.Enabled      := True;
    
  //Marilza 01/12/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  if ((cbContasPagar.Checked = false) and (cbContasReceber.Checked = false) and (cbCFinan.Checked = false)) then
  begin
    MsgDlg('Favor selecionar um Módulo!','Erro',mtError,[mbOk],0);
    Exit;
  end;
    // Se está usando o item Não Enviados
  if  (pagFiltro.ActivePage = tabNaoEnviados) and
     ((cbContasPagar.Checked) or (cbContasReceber.Checked) or (cbCFinan.Checked)) then
  begin
    FIdModulo := '';
    if cbContasPagar.Checked then
      FIdModulo := FIdModulo+',3';

    if cbContasReceber.Checked then
      FIdModulo := FIdModulo+',4';

    if cbCFinan.Checked then
      FIdModulo := FIdModulo+',9';

    FIdModulo := copy(FIdModulo,2,length(FIdModulo));
    ExecutaPesquisa('',FIdModulo);
  end
  else
    ExecutaPesquisa(edtIdEnvio.Text,'');
    //Marilza 01/12/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  edtNroDoc.Text         := '';
  edtNroApAr.Text        := '';
  edtNroLote.Text        := '';
  ednVlrDoc.Text         := '';
  edtPlanilhaContab.Text := '';
  
  // --> Leandro S. Costa SOL: 160767/5542 Kintana: 1362753
  cdsLotesAfterScroll(cdsLotes);
end;

function TfrmParamRelatEnvDocContab.TrocaPontoOuVirgula(bTrocaPorPonto: Boolean; sValor: string): string;
var i,
    iItemsString: integer;
    sValorFinal: string;

begin
//  Esta função troca todos as vírgulas encontradas na string
//  passada por ponto, para poderem ser usadas nas qry's.
   Result       := '';
   iItemsString := Length(sValor);

   for i := 1 to iItemsString do
   begin
     //  Se for trocar vírgula por ponto...
     if bTrocaPorPonto then
     begin
        if sValor[i] = ',' then
           sValorFinal := sValorFinal + '.'
        else
           sValorFinal := sValorFinal + sValor[i];
     end
     else
     //  Se for trocar ponto por vírgula...
     begin
        if sValor[i] = '.' then
           sValorFinal := sValorFinal + ','
        else
           sValorFinal := sValorFinal + sValor[i];
     end;
   end;

   Result := sValorFinal;

end;

Function AcertaDecimal(const pValor : String) : string;
begin
 Result := StringReplace(pValor,'.','',[rfReplaceAll,rfIgnoreCase]);
 Result := StringReplace(Result,',','.',[rfReplaceAll,rfIgnoreCase]);
end;

procedure TfrmParamRelatEnvDocContab.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlEnvioDocumento.Free;
end;

procedure TfrmParamRelatEnvDocContab.tabNaoEnviadosShow(Sender: TObject);
begin
  inherited;

  AjustaColunasGrid(true);

  GrBxFiltroDatas.Enabled    := True;
  GrBxFiltroDatas.Font.Color := clWindowFrame;

  rdbDtLancto.Enabled      := True;
  rdbDtdisponib.Enabled    := True;
  rdbDtEnvioContab.Enabled := False;
  rdbDtBaixaDocumento.Enabled := True;
  lblDe.Enabled            := True;
  lblAte.Enabled           := True;
  DlIni.Enabled            := True;
  DlFim.Enabled            := True;
  btPesquisa.Enabled       := True;
  cbContasPagar.Enabled    := True;
  cbContasReceber.Enabled  := True;
  cbCFinan.Enabled         := True;
  btPesqIdEnvio.Enabled    := False;
  edtIdEnvio.Enabled       := False;
  btDesfazerEnvio.Visible  := False;
  btFazerEnvio.Visible     := True;
  grbxModulos.Font.Color   := clWindowFrame;
  //Marilza 13/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  edtNroDoc.Text := '';
  edtNroApAr.Text := '';
  edtNroLote.Text := '';
  ednVlrDoc.Text := '';
  edtPlanilhaContab.Text := '';

end;

procedure TfrmParamRelatEnvDocContab.tabEnviadosShow(Sender: TObject);
begin
  inherited;
  AjustaColunasGrid(false);
//  btPesquisa.Enabled      := False;
  rdbDtEnvioContab.Enabled    := True;
  cbContasPagar.Enabled       := False;
  cbContasReceber.Enabled     := False;
  cbCFinan.Enabled            := False;
  btPesqIdEnvio.Enabled       := True;
  btDesfazerEnvio.Visible     := True;
  btFazerEnvio.Visible        := False;
  edtIdEnvio.Enabled          := True;

  grbxModulos.Font.Color := clGrayText;
  GrBxModulos.Enabled    := False;

  //Marilza 28/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  edtNroDoc.Text := '';
  edtNroApAr.Text := '';
  edtNroLote.Text := '';
  ednVlrDoc.Text := '';
  edtPlanilhaContab.Text := '';

  if edtIdEnvio.Text <> '' then
    ExecutaPesquisa(edtIdEnvio.Text);

end;

procedure TfrmParamRelatEnvDocContab.AjustaColunasGrid(const pMostraEnviar: Boolean);
begin
  cdsDocumentos.Close;
  cdsLotes.Close;
  with dbgrdLote.Selected do
  begin
    Clear;

    If pMostraEnviar then
      Add('SELECIONADO'#9'6'#9'Enviar'#9'F')
    else
      Add('SELECIONADO'#9'6'#9'Desfazer'#9'F');

    Add('STATUS'#9'14'#9'Status Envio'#9'F');
    Add('HISTORICO'#9'30'#9'Histórico'#9'F');
    Add('NOMEMODULO'#9'20'#9'Sistema de Origem'#9'F');
    Add('ENTRADASAIDA'#9'3'#9'Tipo'#9'F');
    Add('DATALANCFINAN'#9'12'#9'Lançamento'#9'F');
    Add('DATADISPFINANC'#9'12'#9'Disponibilidade'#9'F');
    Add('NUMCHQBORDERO'#9'10'#9'Cheque'#9'F');
    Add('PORTADORCONTA'#9'40'#9'Portador Conta'#9'F');
    Add('VALORLANCFINAN'#9'16'#9'Valor'#9'F');
  end;

  with dbgrdDocumento.Selected do
  begin
    Clear;
    If pMostraEnviar then
      Add('SELECIONADO'#9'6'#9'Enviar'#9'F');
    //else
      //Add('SELECIONADO'#9'6'#9'Enviar'#9'F');

    Add('STATUS'#9'14'#9'Status Envio'#9'F');
    Add('STATUSDOC'#9'14'#9'Status Envio'#9'F');
    Add('RAZAOSOCIAL'#9'30'#9'Razão Social'#9'F');
    Add('NODOCUMENTO'#9'20'#9'Documento'#9'F');
    //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
    Add('PLNPLANIL'#9'14'#9'Pln.Contabil'#9'F');
    //    Add('VLRLIQUIDO'#9'16'#9'Valor Documento'#9'F');
    Add('VLRBRUTO'#9'16'#9'Valor Documento'#9'F');
  end;
end;

procedure TfrmParamRelatEnvDocContab.AtivaRelacionamento;
begin
  cdsDocumentos.MasterSource    := dsLotes;
  cdsDocumentos.IndexFieldNames := 'CODLANCFINANC';
  cdsDocumentos.MasterFields    := 'CODLANCFINANC';
end;

procedure TfrmParamRelatEnvDocContab.DesAtivaRelacionamento;
begin
  cdsDocumentos.MasterSource    := Nil;
  cdsDocumentos.IndexFieldNames := '';
  cdsDocumentos.MasterFields    := '';
end;


procedure TfrmParamRelatEnvDocContab.ExecutaPesquisa(IdEnvio: String='';
                                                     IdModulo: String='');
var
  FTipoData:  TTipoData;
  FTipoEnvio: TTipoEnvio;
  sValor : String;
begin

  if rdbDtLancto.Checked then
    FTipoData := tdLancamento
  else if rdbDtdisponib.Checked then
    FTipoData := tdDisponibilidade
  else if rdbDtEnvioContab.Checked then
    FTipoData := tdEnvioContabilidade
  else if rdbDtBaixaDocumento.Checked then
    FTipoData := tdBaixaDoc;

  if pagFiltro.ActivePage = tabNaoEnviados then
    FTipoEnvio := TpNaoEnviado
  else
    FTipoEnvio := TpEnviado;

  sValor := '';
  If ednVlrDoc.Text <> '0,00' then
    sValor := AcertaDecimal(ednVlrDoc.Text);

  cdsLotes.Data := CtrlEnvioDocumento.ListaPesquisa(cdsDocumentos,
                                                    DlIni.Text,
                                                    DlFim.Text,
                                                    FTipoData,
                                                    FTipoEnvio,
                                                    IdEnvio,
                                                    IdModulo,
                                                    edtNroDoc.Text,
                                                    edtNroApAr.Text,
                                                    edtNroLote.Text,
                                                    edtPlanilhaContab.Text,
                                                    sValor);
  AtivaRelacionamento;
end;

procedure TfrmParamRelatEnvDocContab.btPesqIdEnvioClick(Sender: TObject);
begin
  inherited;
  MontaSelect2.Executar;
  if MontaSelect2.RetornouValor then
  begin
    edtIdEnvio.Text:= MontaSelect2.ValoresChave[0];
    ExecutaPesquisa(edtIdEnvio.Text);
  end;
end;

procedure TfrmParamRelatEnvDocContab.btDesfazerEnvioClick(Sender: TObject);
     //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
    // Função para validar se pelo menos um lote foi selecionado ao desfazer envio.
    Function _ValidaDefazLotes(const _oleLote : OleVariant) : Boolean;
    var oDoc : TClientDataSet;
    begin
      Result:= False;
      oDoc := TClientDataSet.Create(nil);
      try
        oDoc.Data := _oleLote;
        oDoc.First;
        while not( oDoc.Eof ) do
        begin
          if oDoc.FieldByName('SELECIONADO').AsString = '1' then
          begin
            Result:= True;
          end;
          oDoc.Next;
        end;
        oDoc.Close;
      finally
        FreeAndNil(oDoc);
      end;
    end;

var
  bResult: boolean;
begin
  inherited;
   bResult := (edtIdEnvio.Text <> '') or (_validaDefazLotes(cdsLotes.data));

  //Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  {if edtIdEnvio.Text = '' then
  begin
    MsgDlg('Selecione o envio a ser desfeito.' ,'Erro',mtInformation,[mbOk],0);
    exit;
  end;   }


  If Not bResult then
  begin
    MsgDlg('Selecione o envio a ser desfeito.' ,'Erro',mtInformation,[mbOk],0);
    exit;
  end;

  If CtrlEnvioDocumento.GravaDesfazEnvioDocumento(cdsLotes.data,
                                                  cdsDocumentos.data,
                                                  edtIdEnvio.Text) then
  begin
    //sqlDocumentos.Open;
    MsgDlg('Operação Efetuada com Sucesso!' ,'Aviso',mtInformation,[mbOk],0);
    edtIdEnvio.Text := '';
  end
  else
    MsgDlg(CtrlEnvioDocumento.MessageInfo ,'Erro',mtError,[mbOk],0);
end;

procedure TfrmParamRelatEnvDocContab.AcertaDocumento(const pSelecionado : Integer);
var registro : TbookMark;
begin
  cdsDocumentosSELECIONADO.OnChange := Nil;
  with cdsDocumentos do
  begin
    registro := GetBookmark;
    DisableControls;
    First;
    While Not Eof do
    begin
      Edit;
      FieldByName('SELECIONADO').Value := pSelecionado;
      post;
      next;
    end;
    GotoBookmark(Registro);
    FreeBookmark(Registro);
    EnableControls;
  end;
  cdsDocumentosSELECIONADO.OnChange := cdsDocumentosSELECIONADOChange;
end;

procedure TfrmParamRelatEnvDocContab.cdsLotesSELECIONADOChange(Sender: TField);
begin
  inherited;
  If (AnsiUpperCase(cdsLotes.FieldByName('NOMEMODULO').asString) <> 'CONTROLE FINANCEIRO') Then
    AcertaDocumento(cdsLotesSelecionado.asInteger);
end;

procedure TfrmParamRelatEnvDocContab.cdsDocumentosSELECIONADOChange(Sender: TField);
var registro : TbookMark;
    iStatus,
    iExiste : Integer;
begin
  inherited;

  cdsLotesSELECIONADO.OnChange := Nil;

  iExiste := 0;
  iStatus := cdsDocumentos.FieldByName('Selecionado').AsInteger;
  with cdsDocumentos do
  begin

    DisableControls;
    registro := GetBookmark;
    First;
    While Not Eof do
    begin
      If (FieldByName('Selecionado').asInteger = 1) then
      begin
        iExiste := FieldByName('Selecionado').AsInteger;
        Break;
      end;
      Next;
    end;

    If ((iStatus = 0) and (iExiste = 1)) then
      iStatus := iExiste;

    cdsLotes.Edit;
    cdsLotes.FieldByName('SELECIONADO').Value := iStatus;
    cdsLotes.Post;

    GotoBookmark(Registro);
    FreeBookmark(Registro);
    EnableControls;
  end;

  cdsLotesSELECIONADO.OnChange := cdsLotesSELECIONADOChange;

end;

procedure TfrmParamRelatEnvDocContab.btFazerEnvioClick(Sender: TObject);
begin
  inherited;
  If CtrlEnvioDocumento.GravaFazEnvioDocumento(DlIni.Text,
                                               DlFim.Text,
                                               cdsLotes.data,
                                               cdsDocumentos.data,
                                               idEnvio
                                               ) then
    bbtnConfirmar.Click;

end;

procedure TfrmParamRelatEnvDocContab.btnBuscaDocClick(Sender: TObject);
begin
  inherited;
  MSDocumentos.Executar;

  if MSDocumentos.RetornouValor then
  begin
    edtNroDoc.Text         := MSDocumentos.ValoresChave[1];
//Marilza 12/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
//    edtNroApAr.Text        := MSDocumentos.ValoresChave[5];
//    ednVlrDoc.Text         := MSDocumentos.ValoresChave[3];
//    edtNroLote.Text        := MsDocumentos.ValoresChave[9];
//    edtPlanilhaContab.Text := MsDocumentos.ValoresChave[8];
  end;

end;

procedure TfrmParamRelatEnvDocContab.btnLimpaDocClick(Sender: TObject);
begin
  inherited;
  edtNroDoc.Clear;
  edtNroApAr.Clear;
  ednVlrDoc.Clear;
  edtNroLote.Clear;
  edtPlanilhaContab.Clear;
end;

procedure TfrmParamRelatEnvDocContab.pagFiltroChange(Sender: TObject);
begin
  inherited;
  edtIdEnvio.Text := '';
  grbxModulos.Enabled:= True;
  rdbDtLancto.Checked := True;
  //Marilza 28/11/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  cbContasPagar.Checked := True;
  cbContasReceber.Checked := True;
  cbCFinan.Checked := True;
end;


procedure TfrmParamRelatEnvDocContab.rdbDtLanctoClick(Sender: TObject);
begin
  inherited;
  //Marilza 01/12/2008 N.Sol's: 90187-90779-90780-90781/N.Kintana's: 380204-383016-383017-383018
  edtNroDoc.Text         := '';
  edtNroApAr.Text        := '';
  edtNroLote.Text        := '';
  ednVlrDoc.Text         := '';
  edtPlanilhaContab.Text := '';
  DefaultBotoes(btPesquisa);
end;

procedure TfrmParamRelatEnvDocContab.FocoEntrada(Sender: TObject);
begin
  inherited;
  DefaultBotoes(btPesquisa);
end;

procedure TfrmParamRelatEnvDocContab.ednVlrDocKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
  begin
    key := 0;
    btPesquisa.Click;
  end;
end;

procedure TfrmParamRelatEnvDocContab.cdsLotesAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  // --> Leandro S. Costa SOL: 160767/5542 Kintana: 1362753
  dbgrdDocumento.Enabled := True;  
  if cdsDocumentos.Active then
  begin
   if cdsDocumentos.RecordCount = 0 then
     dbgrdDocumento.Enabled := False
   else
     dbgrdDocumento.Enabled := True;
  end;//if..then
  Application.ProcessMessages;
end;

procedure TfrmParamRelatEnvDocContab.cdsLotesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  // --> Leandro S. Costa SOL: 160767/5542 Kintana: 1362753
  dbgrdLote.Enabled := True;  
  if cdsLotes.Active then
  begin
  
   if cdsLotes.RecordCount = 0 then
    dbgrdLote.Enabled := False
   else
    dbgrdLote.Enabled := True;
  end;//if..then
  Application.ProcessMessages;
  
end; //


end.
