// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Nº SIG.....: SIG TIBERO
//Data.......: 20/02/2018
//Responsável: Everson Luiz Pereira da Cunha
//Descrição..: Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//             Retirada de INDEX, +rule etc.
//             Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------


unit fConsultaGlobalPrevia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBTables, Wwquery, StdCtrls, wwdblook, ComCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  TREdit, TEdNum,uDocumento, uIntegraBack, MontaSelect, fcButton, fcImgBtn,
  fcShapeBtn, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, Menus,
  mxpivsrc, mxgrid, mxDB, mxtables, mxstore, Wwdbspin, DBaseDados, UMensErro,
  CheckLst, uFuncoesfolha, uAdmPrevFB;

type
  TfrmConsultaGlobalPrevia = class(TfrmSairAjuda)
    qryLote: TwwQuery;
    Panel7: TPanel;
    Panel14: TPanel;
    pnlProgbar: TPanel;
    prgBar: TProgressBar;
    dqryValores: TDecisionQuery;
    dsValores: TDecisionSource;
    dcValores: TDecisionCube;
    PageControl1: TPageControl;
    tbsLotes: TTabSheet;
    dbgLotes: TwwDBGrid;
    dsLote: TwwDataSource;
    tbsInformacoes: TTabSheet;
    dpValores: TDecisionPivot;
    DecisionGrid1: TDecisionGrid;
    Panel1: TPanel;
    fcsbtnHistorico: TfcShapeBtn;
    qryLoteIDLOTE: TFloatField;
    qryLoteMESREFERENCIA: TStringField;
    qryLoteDESCRTIPOFOLHA: TStringField;
    qryLoteFLGIDATMP: TFloatField;
    qryLoteFLGVOLTATMP: TFloatField;
    qryLotePROC: TStringField;
    qryLoteIDHSTFOLHABENEF: TFloatField;
    qryLoteDESCRICAO: TStringField;
    tbsAnalise: TTabSheet;
    qryVersao: TwwQuery;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    pnlAnaliseSelecao: TPanel;
    lblVersao: TLabel;
    chklstVersao: TCheckListBox;
    Label5: TLabel;
    cmbPatro: TwwDBLookupCombo;
    Label6: TLabel;
    cmbPlano: TwwDBLookupCombo;
    lblFator: TLabel;
    rgValor: TRadioGroup;
    fcbtnProcessar: TfcShapeBtn;
    spAnalise: TSplitter;
    dbgCompara: TwwDBGrid;
    qryCompara: TwwQuery;
    dsCompara: TwwDataSource;
    lblPercentual: TLabel;
    redDif: TRealEdit;
    lblCaracterPercent: TLabel;
    redFator: TRealEdit;
    qryComparaMATRICULA: TStringField;
    qryComparaINSCRICAONUMERO: TFloatField;
    qryComparaTITULAR: TStringField;
    qryComparaBENEFICIARIO: TStringField;
    qryComparaPATROCINADORA: TStringField;
    qryComparaPLANO: TStringField;
    qryComparaVALBASE: TFloatField;
    qryComparaVALCORRENTE: TFloatField;
    qryComparaDIFERENCA: TFloatField;
    qryComparaVARIACAO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dqryValoresAfterOpen(DataSet: TDataSet);
    procedure dqryValoresAfterClose(DataSet: TDataSet);
    procedure fcsbtnHistoricoClick(Sender: TObject);
    procedure qryLoteAfterScroll(DataSet: TDataSet);
    procedure DecisionGrid1DecisionExamineCell(Sender: TObject; iCol, iRow,
      iSum: Integer; const ValueArray: TValueArray);
    procedure fcbtnProcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgLotesRowChanged(Sender: TObject);
  private
    { Private declarations }
    ListaVersao: TStringList;
  public
    { Public declarations }
  end;

var
  frmConsultaGlobalPrevia: TfrmConsultaGlobalPrevia;

implementation

{$R *.DFM}

procedure TfrmConsultaGlobalPrevia.FormCreate(Sender: TObject);
begin
  inherited;
  ListaVersao:=TStringList.Create;
  qryLote.Open;
  WindowState := wsMaximized;
  PageControl1.activepage:=tbsLotes;
  tbsInformacoes.tabvisible:=false;
  tbsAnalise.tabvisible:=true;
end;

procedure TfrmConsultaGlobalPrevia.FormShow(Sender: TObject);
begin
  inherited;
  qryVersao.Close;
  qryVersao.Open;
  chklstVersao.Clear;
  ListaVersao.Clear;
  While Not qryVersao.Eof Do
  Begin
    chklstVersao.Items.Add(qryVersao.FieldByName('HISTORICO').AsString);
    chklstVersao.ItemIndex := 0;
    ListaVersao.Add(qryVersao.FieldByName('IDHSTFOLHABENEF').AsString);
    qryVersao.Next;
  End;

  qryPatro.close;
  qryPatro.open;
  qryPlano.close;
  qryPlano.open;
end;

procedure TfrmConsultaGlobalPrevia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ListaVersao.Free;
  qryLote.Close;
  dqryValores.Close;
end;

procedure TfrmConsultaGlobalPrevia.dqryValoresAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dpValores.Visible := True;
end;

procedure TfrmConsultaGlobalPrevia.dqryValoresAfterClose(DataSet: TDataSet);
begin
  inherited;
  dpValores.Visible := False;
end;

procedure TfrmConsultaGlobalPrevia.fcsbtnHistoricoClick(Sender: TObject);
begin
  inherited;
  dqryValores.Close;
  dqryValores.parambyname('idlote').asinteger:=qryLote.fieldbyname('idlote').asinteger;
  try
    dqryValores.Open;
    tbsInformacoes.tabvisible:=true;
    PageControl1.activepage:=tbsInformacoes;
  except
    MsgDlg(' Só existe um de previa'+#13+
          'impossibilitando essa consulta. Para conferir essas informações por '+#13+
          'favor use o relatório de pagamento.', 'Informação', mtInformation, [mbOk], 0);
  end;
end;

procedure TfrmConsultaGlobalPrevia.qryLoteAfterScroll(DataSet: TDataSet);
begin
  inherited;
  tbsInformacoes.tabvisible:=false;
end;

procedure TfrmConsultaGlobalPrevia.DecisionGrid1DecisionExamineCell(
  Sender: TObject; iCol, iRow, iSum: Integer;
  const ValueArray: TValueArray);
 var col, row: integer;
     ss1,ss: string;
     subl: integer;
begin
  inherited;
  col:=icol;
  row:=irow;
  ss1:=dcValores.GetMemberAsString(0, 0);
  ss1:=dqryValores.fieldbyName('IDPATRO').AsString;
  ss1:=dqryValores.fieldbyName('PATROCINADORA').AsString;
  ss1:=dcValores.GetMemberAsString(1, 0);
  ss1:=dqryValores.fieldbyName('IDPLANOPREV').AsString;
  ss1:=dqryValores.fieldbyName('PLANO').AsString;
  ss1:=dcValores.GetMemberAsString(2, 0);
  ss1:=dqryValores.fieldbyName('IDPROVENTO').AsString;
  ss1:=dqryValores.fieldbyName('RUBRICA').AsString;
  ss:=DecisionGrid1.cells[col,row];
end;

procedure TfrmConsultaGlobalPrevia.dbgLotesRowChanged(Sender: TObject);
begin
  inherited;
  qryCompara.close;
end;

procedure TfrmConsultaGlobalPrevia.fcbtnProcessarClick(Sender: TObject);
 var sversao: string;
     ssql: string;
begin
  inherited;
  MontaFiltro(chklstVersao, ListaVersao, sVersao);

  if (ListaVersao.count = 0) then
  begin
    MsgDlg('Selecione uma versão de pagamento para comparação.', 'Informação',
      mtInformation, [mbOk], 0);
    exit;
  end;

  if (rgValor.itemindex < 0) then
  begin
    MsgDlg('Selecione a forma de comparação do valor.', 'Informação',
      mtInformation, [mbOk], 0);
    exit;
  end;

  try
    if (redFator.value < 0) then
    begin
      MsgDlg('Fator inválido. Deve ser maior do 0 (zero).', 'Informação',
        mtInformation, [mbOk], 0);
      exit;
    end;
  except
    MsgDlg('Fator inválido. Deve ser maior do 0 (zero).', 'Informação',
      mtInformation, [mbOk], 0);
    exit;
  end;

  ssql:='SELECT E.MATRICULA, PP.INSCRICAONUMERO, TIT.NOME AS TITULAR, '+
               'BEN.NOME AS BENEFICIARIO, PT.NOME AS PATROCINADORA, '+
               'PL.NOME AS PLANO, VH1.VALBASE, VH2.VALCORRENTE, '+
               'ABS(VH2.VALCORRENTE - VH1.VALBASE) AS DIFERENCA, '+
               'TO_NUMBER(DECODE(VH1.VALBASE, 0, '''', '+
                  'ROUND((VH2.VALCORRENTE - VH1.VALBASE*'+
                  OraNumero(FloatToStr(redFator.value))+
                  ')/VH1.VALBASE*100*'+OraNumero(FloatToStr(redFator.value))+
                  ', 2))) AS VARIACAO '+
        'FROM (SELECT H.IDTITULAR, H.IDRESPONSAVEL, H.IDPATRO, H.IDPLANOPREV, '+
                     'SUM(DECODE(P.FLGDESCONTO, 0, '+
                         'DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO, 0), '+
                         'DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO*-1, 0))) VALBASE '+
              'FROM HISTRUBSAL H, PROVDESC P ';

  if ListaVersao.count > 1 then
    ssql:=ssql+'WHERE H.IDHSTFOLHABENEF IN ('+sVersao+') '
  else
    ssql:=ssql+'WHERE H.IDHSTFOLHABENEF = '+sVersao+' ';

  case rgValor.itemindex of
    0: ssql:=ssql+'AND P.FLGDESCONTO = 0 ';
    1: ssql:=ssql+'AND P.FLGDESCONTO = 0 AND H.MESCOBRANCA = H.MES ';
//    2: ssql:=ssql+'AND P.IDPROVENTO IN (SELECT IDRUBRICA '+    //Everson TIBERO
    2: ssql:=ssql+'AND P.IDPROVENTO IN (SELECT BPP.IDRUBRICA '+  //Everson TIBERO
                                       'FROM BENEFPLANPREV BPP, BENEFICIO B '+
                                       'WHERE BPP.FLGREFERENCIA = 0 '+
                                       'AND BPP.IDBENEFICIO = B.IDBENEFICIO '+
                                       'AND H.IDPLANOPREV = BPP.IDPLANOPREV '+
                                       'AND B.IDTPPAGTOBENEFIC <> 1)';
    3: ssql:=ssql+'AND P.FLGDESCONTO IN (0, 1) ';
  end;

  ssql:=ssql+'AND P.FLGESPECIAL = 0 '+
             'AND H.IDMODULO = 18 '+
             'AND H.IDRUBRICA = P.IDPROVENTO '+
             'GROUP BY H.IDTITULAR, H.IDRESPONSAVEL, H.IDPATRO, H.IDPLANOPREV) VH1, '+
            '(SELECT H.IDTITULAR, H.IDRESPONSAVEL, H.IDPATRO, H.IDPLANOPREV, '+
                    'SUM(DECODE(P.FLGDESCONTO, 0, '+
                        'DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO, 0), '+
                        'DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO*-1, 0))) VALCORRENTE '+
             'FROM PREVIA H, PROVDESC P '+
             'WHERE H.IDLOTE = '+inttostr(qryLote.fieldbyname('idlote').asinteger)+' '+
             'AND H.IDRUBRICA = P.IDPROVENTO '+
             'AND P.FLGESPECIAL = 0 ';

  case rgValor.itemindex of
    0: ssql:=ssql+'AND P.FLGDESCONTO = 0 ';
    1: ssql:=ssql+'AND P.FLGDESCONTO = 0 AND H.MESCOBRANCA = H.MES ';
//    2: ssql:=ssql+'AND P.IDPROVENTO IN (SELECT IDRUBRICA '+   //Everson TIBERO
    2: ssql:=ssql+'AND P.IDPROVENTO IN (SELECT BPP.IDRUBRICA '+ //Everson TIBERO
                                       'FROM BENEFPLANPREV BPP, BENEFICIO B '+
                                       'WHERE BPP.FLGREFERENCIA = 0 '+
                                       'AND BPP.IDBENEFICIO = B.IDBENEFICIO '+
                                       'AND H.IDPLANOPREV = BPP.IDPLANOPREV '+
                                       'AND B.IDTPPAGTOBENEFIC <> 1)';
    3: ssql:=ssql+'AND P.FLGDESCONTO IN (0, 1) ';
  end;

  ssql:=ssql+'GROUP BY H.IDTITULAR, H.IDRESPONSAVEL, H.IDPATRO, H.IDPLANOPREV) VH2, '+
       'PESSOA PT, PESSOA TIT, PESSOA BEN, PLANPREV PL, ELEGPATRO E, PARTPREVPLAN PP '+
       'WHERE VH1.IDTITULAR = VH2.IDTITULAR '+
       'AND VH1.IDRESPONSAVEL = VH2.IDRESPONSAVEL '+
       'AND VH1.IDTITULAR = PP.IDPESSOA '+
       'AND VH1.IDPATRO = PP.IDPESSJUR '+
       'AND VH1.IDPLANOPREV = PP.IDPLANOPREV '+
       'AND PP.SEQPROPOSTA = 1 '+
       'AND PP.FLGDESATIVADO = 0 '+
       'AND VH1.IDTITULAR = E.IDPESSOA '+
       'AND VH1.IDPATRO = E.IDPESSJUR '+
       'AND VH1.IDTITULAR = TIT.IDPESSOA '+
       'AND VH1.IDRESPONSAVEL = BEN.IDPESSOA '+
       'AND VH1.IDPATRO = PT.IDPESSOA '+
       'AND VH1.IDPLANOPREV = PL.IDPLANOPREV '+
       'AND TO_NUMBER(DECODE(VH1.VALBASE, 0, '''', '+
         'ROUND((VH2.VALCORRENTE - VH1.VALBASE*'+OraNumero(FloatToStr(redFator.value))+
         ')/VH1.VALBASE*100*'+OraNumero(FloatToStr(redFator.value))+', 2))) >= '+
         OraNumero(FloatToStr(redDif.value))+' ';

  // Se for escolhida uma Patrocinadora ...
  If cmbPatro.Text <> '' Then
    ssql:=ssql+'AND PT.IDPESSOA = '+inttostr(qryPatro.fieldbyname('idpessoa').asinteger)+' ';

  // Se for escolhido um Plano ...
  If cmbPlano.Text <> '' Then
    ssql:=ssql+'AND PL.IDPLANOPREV = '+inttostr(qryPlano.fieldbyname('idplanoprev').asinteger)+' ';

  ssql:=ssql+'ORDER BY TO_NUMBER(DECODE(VH1.VALBASE, 0, '''', '+
         'ROUND((VH2.VALCORRENTE - VH1.VALBASE*'+OraNumero(FloatToStr(redFator.value))+
         ')/VH1.VALBASE*100*'+OraNumero(FloatToStr(redFator.value))+', 2))) DESC';

  qryCompara.close;
  qryCompara.sql.clear;
  qryCompara.sql.add(ssql);
  try
    qryCompara.open;
  except
    MsgDlg('Erro ao abrir consulta.', 'Informação', mtInformation, [mbOk], 0);
  end;
end;

end.
{==============================================================================|
| UNIT: FCONSULTAGLOBALPREVIA                                                  |
| DESCRIÇÃO FUNCIONAL:                                                         |
| Construir nova tela de consulta das informações globais da Prévia por lote   |
| de processamento. Exibir estado do processamento (se foi efetivada ou não).  |
| No caso de Previas já efetivadas permitir a exclusão de todos os registros.  |
| Exibir para cada lote informações de quantidades de rubricas,                |
| de recebedores, de titulares, totais de provento e de desconto,              |
| permitindo abertura por rubrica, planos e patrocinadoras.                    |
| Para cada grupo exibir a lista de recebedores (matricula e nome recebedor)   |
| que constam da Previa selecionada.                                           |
| Permitir a exclusão de uma pessoa de uma Previa Normal, caso esta não possua |
| mais benefício preparado no respectivo lote.                                 |
|                                                                              |
|------------------------------------------------------------------------------}

