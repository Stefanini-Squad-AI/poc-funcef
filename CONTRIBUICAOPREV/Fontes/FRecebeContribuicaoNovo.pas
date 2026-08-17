Unit FRecebeContribuicaoNovo;

// Alterações:

{***************************************************************************************************
Alteração  : AbreArquivo
Nº SIG.....: 57285
Data.......: 23/10/2017
Responsável: Andre Imakawa
Descrição..: Correção aba valor a receber, valores estavam saindo duplicados
****************************************************************************************************
Alteração  : (FRecebeContribuicao) funcionalidade renomeada e ajustada (mtos componentes removidos
Nº SIG.....: 33372
Data.......: 09/11/2016
Responsável: Edilaine Ferraresi
Descrição..: Ajustes para Equacionamento - Recebimento Contrib via Folha através de procedure
****************************************************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, checklst,
  ComCtrls, wwdblook, Spin, Db, DBTables, OpenArqText,
  TB97, URegra, Wwdatsrc, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, IvDictio,
  IvMulti, IvEMulti, Wwquery, wwdbdatetimepicker, CMDateTimePicker,
  ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, DBGrids, MontaSelect, 
  FTelaAut, uCMTypes,uCMClientDataSet, uCmSqlParams, DBClient, Provider,
  fPreviewExport, UAutorizacao, ImgList;

type
  TRecParamArquivoRet = record
    sMesCobranca : string;
    iIdPessJur   : integer;
    iIdPlanoPrev : integer;
    sIdContrib   : string;
    sDataRecebe  : TDate;
  end;
  TTipoArquivo = (taRetorno, taValReceber, taAmbos);

  TfrmRecebeContribuicaoNovo = class(TfrmOkCancelar)
    SaveDlg: TSaveDialog;
    qryPatro: TwwQuery;
    qryAux: TwwQuery;
    pgctrlOpcoes: TPageControl;
    tbsOpcoes: TTabSheet;
    pnlTabSheet1: TPanel;
    tbsResultado: TTabSheet;
    pnlTabSheet4: TPanel;
    bbtnSalvar: TBitBtn;
    memResult: TMemo;
    Label1: TLabel;
    Panel2: TPanel;
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    bbtnReceber: TBitBtn;
    GroupBox3: TGroupBox;
    dtRecebimento: TCMDateTimePicker;
    bbtnDesfazer: TBitBtn;
    rgrpTipoFolha: TRadioGroup;
    qryPlano: TwwQuery;
    Panel1: TPanel;
    rgrpPatro: TRadioGroup;
    rgrpPlano: TRadioGroup;
    GroupBox5: TGroupBox;
    tbsArqRetorno: TTabSheet;
    lstContrib: TListBox;
    Panel3: TPanel;
    lstContribSel: TListBox;
    sbtnDesUmaContrib: TSpeedButton;
    sbtnDesTodasContrib: TSpeedButton;
    sbtnSelUmaContrib: TSpeedButton;
    sbtnSelTodasContrib: TSpeedButton;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    edtNumReceb: TEdit;
    btnNumReceb: TBitBtn;
    Panel4: TPanel;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    Label6: TLabel;
    lblTotReg: TLabel;
    lblTotRejeitado: TLabel;
    Label9: TLabel;
    gridArqRet: TwwDBGrid;
    tbsValorRec: TTabSheet;
    gridValorRec: TwwDBGrid;
    qryContrib: TwwQuery;
    qryArqRetorno: TwwQuery;
    dsArqRetorno: TDataSource;
    msIncluiContrib: TMontaSelect;
    cdsArqRetorno: TCMClientDataSet;
    sqlArqRetorno: TCMSqlParams;
    dspArqRetorno: TDataSetProvider;
    qryUpdArqRet: TwwQuery;
    rpArqRetorno: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage2: TppImage;
    ppLabel16: TppLabel;
    ppLabel28: TppLabel;
    ppLabel37: TppLabel;
    ppLabel41: TppLabel;
    lbl_Titulo: TppLabel;
    ppLine9: TppLine;
    ppLabel8: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel9: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine1: TppLine;
    ppArqRetorno: TppBDEPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel52: TppLabel;
    ppDBText7: TppDBText;
    ppLabel10: TppLabel;
    ppDBText89: TppDBText;
    ppLine2: TppLine;
    ppDBText5: TppDBText;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine3: TppLine;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    qryValReceber: TwwQuery;
    dsValReceber: TDataSource;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    dsRetornoImp: TDataSource;
    qryRetornoImp: TwwQuery;
    imgTitulosGrids: TImageList;
    btnMarcaTodas: TBitBtn;
    btnInverte: TBitBtn;
    procedure bbtnReceberClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grpMesAnoRefExit(Sender: TObject);
    procedure sbtnSelUmaContribClick(Sender: TObject);
    procedure sbtnDesUmaContribClick(Sender: TObject);
    procedure sbtnSelTodasContribClick(Sender: TObject);
    procedure sbtnDesTodasContribClick(Sender: TObject);
    procedure rgrpPatroClick(Sender: TObject);
    procedure rgrpPlanoClick(Sender: TObject);
    procedure cmbMesCobChange(Sender: TObject);
    procedure spedAnoCobChange(Sender: TObject);
    procedure btnNumRecebClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure pgctrlOpcoesChange(Sender: TObject);
    procedure cdsArqRetornoAfterOpen(DataSet: TDataSet);
    procedure gridArqRetTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure msIncluiContribBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure dtRecebimentoChange(Sender: TObject);
    procedure qryValReceberAfterOpen(DataSet: TDataSet);
    procedure rgrpTipoFolhaClick(Sender: TObject);
    procedure gridArqRetCalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure btnMarcaTodasClick(Sender: TObject);
    procedure btnInverteClick(Sender: TObject);


  private { Private declarations }

    sAnoMesCobrancaTela    : string;
    sValorEsperado         : string;
    bErro                  : boolean;

    iIdPatroSelecionada : integer;
    iIdPlanoSelecionado : integer;
    rParametros         : TRecParamArquivoRet;
    bTemAcessoRecebe    : boolean;          

    procedure PreencheContribuicoes(lista : TListBox);
    procedure HabilitaControles;
    procedure CarregaArquivoRetorno;
    procedure AbreArquivo(tArquivo : TTipoArquivo; const DataSet : TwwQuery = nil);
    procedure MarcaDesmarca(sOperacao : string);


  public  { Public declarations }

   sIDPlanosDesfDoc : String;

  end;

var
  frmRecebeContribuicaoNovo: TfrmRecebeContribuicaoNovo;



implementation
{$R *.DFM}
uses 
  UMensErro, UDataBase, UAdmPrev, FLerSituacaoPlano, DPreparaContrib,
  DBaseDados, USistema, UModulo, UContribuicaoPrev, UIntegraBack,
  fAguarde, DAPrev, uSincronismo, UParticipante,
  DAPrevIntegraBack, UFuncoesUteis, FDesfDocContribuicao;



procedure TfrmRecebeContribuicaoNovo.FormCreate(Sender: TObject);
begin
  inherited;

  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  qryPatro.Close;
  qryPatro.SQL.Clear;
  qryPatro.SQL.Add(' SELECT P.IDPESSOA, P.NOME, PT.FLGACEITANAOID, PT.FLGANO13, PT.IDRUBSALPARTICIP,  '+
                   '        PT.FLGGERACAR                         '+
                   ' FROM   PESSOA P , PATRO PT                   '+
                   ' WHERE  P.IDPESSOA    = PT.IDPESSOA           '+
                   ' AND    PT.FLGGERACAR = 1                     '+
                   ' AND    PT.IDFUNDACAO = '+IntToStr(iIdFundacao)+
                   ' ORDER BY P.IDPESSOA desc ');

  // Preencher chkList da Patrocinadora
  qryPatro.Open;
  while not qryPatro.eof do
  begin
    rgrpPatro.Items.AddObject(qryPatro.FieldByName('NOME').AsString, TObject(qryPatro.FieldByName('IDPESSOA').AsInteger) );
    qryPatro.next;
  end;

end;

procedure TfrmRecebeContribuicaoNovo.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;

  // verifica status do controle de acesso do botão RECEBER
  bTemAcessoRecebe := (bbtnReceber.enabled);

  DecodeDate(date, AYear, AMonth, ADay);

  if (AMonth >= 1) and (AMonth <= 12) then
  begin
    cmbMesCob.ItemIndex         := AMonth - 1;
    cmbMesCob.Text              := cmbMesCob.Items[cmbMesCob.ItemIndex];
    spedAnoCob.Text             := IntToStr(AYear);
  end;

  spedAnoCob.Text               := IntToStr(AYear);
  dtRecebimento.Text            := DateToStr(date);

  pgctrlOpcoes.ActivePage       := tbsOpcoes;

  bbtnReceber.enabled   := false;
  bbtnConfirmar.enabled := false;
  rgrpPatro.Itemindex   := 0;

  lblTotRejeitado.caption := '';
  lblTotReg.caption       := '';

  PreencheContribuicoes(lstContrib);
end;



procedure TfrmRecebeContribuicaoNovo.bbtnDesfazerClick(Sender: TObject);
var i, iIdPessJur, iPlnCodigo : longint;
    sIDPlanos,
    sUltMesPreparo,
    sMsgErro                  : string;
    bOk                       : boolean;
    cTipoEnvPrev              : char;
    iCodDocumento             : longint;
    bDesfaz13                 : Boolean; 
begin
  inherited;

  memResult.Clear;

  MsgDlg('Sempre será feito o desfazer de todos os planos','Atenção',mtInformation,[mbOk,mbHelp],0);

  // Preencher mes de referência
  if (Trim(cmbMesCob.Text) = '') or (Trim(spedAnoCob.Text) = '')
  then begin
     MsgDlg('Preencha o mês de cobrança.','Erro',mtError,[mbOk,mbHelp],0);
     frmAguarde.Apaga; 
     Exit;
  end;

  sAnoMesCobrancaTela  := Trim(spedAnoCob.Text)+'/';
  if cmbMesCob.ItemIndex <= 8
  then sAnoMesCobrancaTela := sAnoMesCobrancaTela+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sAnoMesCobrancaTela := sAnoMesCobrancaTela+IntToStr(cmbMesCob.ItemIndex+1);

  if (Trim(dtRecebimento.Text) = '')
   then begin
     MsgDlg('O campo Data de Recebimento é obrigatório.','Erro',mtError,[mbOk,mbHelp],0);
         frmAguarde.Apaga;
         Exit;
      end;

  sIDPlanos := IntToStr(iIdPlanoSelecionado);
  sIDPlanosDesfDoc := sIDPlanos;

  //Todo desfazer foi substituído por essa nova funcionalidade definida na IC.
  AbrirFormModal(frmDesfDocContribuicao, TfrmDesfDocContribuicao);

end;


procedure TfrmRecebeContribuicaoNovo.bbtnConfirmarClick(Sender: TObject);
var
    numRec : string;
begin
  inherited;

  if cdsArqRetorno.isEmpty then
     exit;

  numRec := cdsArqRetorno.FieldByName('NUMRECEBIMENTO').AsString;
  AbreArquivo(taRetorno, qryRetornoImp);

  TFrmPreviewExport.CreateModalPreviewExp(Application, rpArqRetorno, 'Arquivo de Retorno da Patrocinadora', qryRetornoImp);

  gridArqRet.setFocus;
  
end;


procedure TfrmRecebeContribuicaoNovo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmAguarde.pbAguarde.Visible  := False;
  inherited;
end;


procedure TfrmRecebeContribuicaoNovo.grpMesAnoRefExit(Sender: TObject);
begin
  inherited;
  sAnoMesCobrancaTela  := Trim(spedAnoCob.Text)+'/';
  if cmbMesCob.ItemIndex <= 8
  then sAnoMesCobrancaTela := sAnoMesCobrancaTela+'0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sAnoMesCobrancaTela := sAnoMesCobrancaTela+IntToStr(cmbMesCob.ItemIndex+1);
end;


procedure TfrmRecebeContribuicaoNovo.HabilitaControles;
var
  bHabilita : boolean;
begin
  bHabilita := (Trim(cmbMesCob.Text) <> '') and (Trim(spedAnoCob.text) <> '') and (lstContribSel.Items.Count > 0);

  bbtnReceber.Enabled   := (bHabilita) and (bTemAcessoRecebe);
  tbsArqRetorno.TabVisible := (bHabilita);
  tbsValorRec.TabVisible   := (bHabilita) and (rgrpTipoFolha.ItemIndex = 0);
  tbsResultado.TabVisible  := bHabilita;

  cdsArqRetorno.close;
  if (tbsArqRetorno.TabVisible) then
     CarregaArquivoRetorno();
end;

procedure TfrmRecebeContribuicaoNovo.PreencheContribuicoes(lista : TListBox);
begin
  lista.clear;
  qryContrib.Close;
  qryContrib.Open;
  while not qryContrib.eof do
  begin
    lista.Items.AddObject( qryContrib.FieldByName('NOME').AsString, TObject(qryContrib.FieldByName('IDCONTRIBUICAO').AsInteger) );
    qryContrib.next;
  end;
end;

procedure TfrmRecebeContribuicaoNovo.sbtnSelUmaContribClick(Sender: TObject);
var
   index : integer;
   item  : integer;
begin
  inherited;
  if lstContrib.Items.Count > 0 then
  begin
    index := lstContrib.ItemIndex;
    if index <> -1 then
    begin
      item  := Integer(lstContrib.Items.Objects[index]);
      lstContribSel.Items.AddObject( lstContrib.Items.Strings[index] , TObject( item ) );
      lstContrib.Items.Delete(index);
      HabilitaControles;
    end;
  end;
end;

procedure TfrmRecebeContribuicaoNovo.sbtnDesUmaContribClick(Sender: TObject);
var
   index : integer;
   item  : integer;
begin
  inherited;
  if lstContribSel.Items.Count > 0 then
  begin
    index := lstContribSel.ItemIndex;
    if index <> -1 then
    begin
      item  := Integer(lstContribSel.Items.Objects[index]);
      lstContrib.Items.AddObject( lstContribSel.Items.Strings[index] , TObject( item ) );
      lstContribSel.Items.Delete(index);
      HabilitaControles;
    end;
  end;
end;

procedure TfrmRecebeContribuicaoNovo.sbtnSelTodasContribClick(Sender: TObject);
begin
  inherited;
  lstContrib.clear;
  PreencheContribuicoes(lstContribSel);
  HabilitaControles;
end;

procedure TfrmRecebeContribuicaoNovo.sbtnDesTodasContribClick(Sender: TObject);
begin
  inherited;
  lstContribSel.clear;
  PreencheContribuicoes(lstContrib);
  HabilitaControles;
end;

procedure TfrmRecebeContribuicaoNovo.AbreArquivo(tArquivo : TTipoArquivo; const DataSet : TwwQuery);
var
   sSQL : TStringList;
   qryTotal : TwwQuery;
   index    : integer;
begin
  sSQL     := TStringList.create;
  qryTotal := TwwQuery.Create(nil);

  try
    if (tArquivo = taRetorno) or (tArquivo = taAmbos) then
    begin
      sSql.Add('SELECT ''N'' as SELECIONA,');
      sSql.Add('       R.NUMRECEBIMENTO,  ');
      sSql.Add('       DE.MATRICULA,      ');
      sSql.Add('       DE.NOME,           ');
      sSql.Add('       H.MESCOBRANCA,     ');
      sSql.Add('       H.MESREFERENCIA,   ');
      sSql.Add('       H.VALORESPERADO,   ');
      sSql.Add('       NVL((SELECT SUM(DECODE(HA.FLGTIPO, ''A'', HA.VALOR, -HA.VALOR)) ALTERADOR ');
      sSql.Add('             FROM HSTATRASOCONTRIB HA                  ');
      sSql.Add('            WHERE HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO ');
      sSql.Add('              AND HA.MESREFERENCIA = H.MESREFERENCIA   ');
      sSql.Add('              AND HA.MESCOBRANCA = H.MESCOBRANCA       ');
      sSql.Add('              AND HA.IDMOTIVO = H.IDMOTIVO),           ');
      sSql.Add('           0) ALTERADORES,                             ');
      sSql.Add('       H.VALORESPERADO +                               ');
      sSql.Add('       NVL((SELECT SUM(DECODE(HA.FLGTIPO, ''A'', HA.VALOR, -HA.VALOR)) ALTERADOR ');
      sSql.Add('             FROM HSTATRASOCONTRIB HA                  ');
      sSql.Add('            WHERE HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO ');
      sSql.Add('              AND HA.MESREFERENCIA = H.MESREFERENCIA   ');
      sSql.Add('              AND HA.MESCOBRANCA = H.MESCOBRANCA       ');
      sSql.Add('              AND HA.IDMOTIVO = H.IDMOTIVO),           ');
      sSql.Add('           0) VALOR_TOTAL,                             ');
      sSql.Add('       C.NOME AS CONTRIBUICAO,                         ');
      sSql.Add('       DECODE(H.FLGDEVOLUCAO, 0,                       ');
      sSql.Add('                ''Enviada e não recebida'',            ');
      sSql.Add('                ''Enviada e não efetivamente paga'') AS SITUACAO, ');
      sSql.Add('       H.SITRECEBIMENTO,                               ');
      sSql.Add('       H.IDPLANOPREV,                                  ');
      sSql.Add('       PATRO.NOME AS PATRONOME,                        ');
      sSql.Add('       H.IDPESSJUR,                                    ');
      sSql.Add('       PLANO.NOME AS PLANONOME,                        ');
      sSql.Add('       R.OBSERVACOES,                                  ');
      sSql.Add('       H.FLGDEVOLUCAO                                  ');
      sSql.Add('  FROM RETORNOHSTCONTRIBPATRO R                        ');
      sSql.Add('  JOIN HSTCONTRIBPREV H                                ');
      sSql.Add('    ON H.NUMRECEBIMENTO = R.NUMRECEBIMENTO             ');
      sSql.Add('  JOIN (SELECT P.NOME, D.IDTITULAR, D.IDPESSOA,        ');
      sSql.Add('               D.MATRICULA                             ');
      sSql.Add('         FROM DEPENTIT D                               ');
      sSql.Add('         JOIN PESSOA P ON P.IDPESSOA = D.IDPESSOA) DE  ');
      sSql.Add('    ON DE.IDTITULAR = H.IDTITULAR                      ');
      sSql.Add('   AND DE.IDPESSOA = H.IDPESSOA                        ');
      sSql.Add('  JOIN (SELECT P.IDPESSOA, P.NOME                      ');
      sSql.Add('          FROM PESSOA P, PATRO PT                      ');
      sSql.Add('         WHERE PT.IDPESSOA = P.IDPESSOA                ');
      sSql.Add('           AND PT.IDFUNDACAO = 1) PATRO                ');
      sSql.Add('    ON H.IDPESSJUR = PATRO.IDPESSOA                    ');
      sSql.Add('  JOIN CONTRIBUICAO C                                  ');
      sSql.Add('    ON C.IDCONTRIBUICAO = H.IDCONTRIBUICAO             ');
      sSql.Add('  JOIN PLANPREV PLANO                                  ');
      sSql.Add('    ON H.IDPLANOPREV = PLANO.IDPLANOPREV               ');

      {se mudar/aumentar as condições fixas aqui, deve incluir esses parametros tb para a consulta da
       inclusão no evento msIncluiContribBeforeOpenCds }
      sSql.Add(' WHERE H.SITRECEBIMENTO = 1                            ');
      sSql.Add('   AND H.MESCOBRANCA = '+QuotedStr(rParametros.sMesCobranca));
      sSql.Add('   AND H.IDPESSJUR   = '+IntToStr(rParametros.iIdPessJur));
      sSql.Add('   AND H.IDPLANOPREV = '+IntToStr(rParametros.iIdPlanoPrev));

      // utiliza a lista de contribuição apenas se não forem selecionadas todas
      if lstContrib.Items.Count > 0 then
         sSql.Add('   AND ' + QuebrarListaFiltro(1, 'H.IDCONTRIBUICAO', rParametros.sIdContrib, 500) );

      sSql.Add(' ORDER BY R.NUMRECEBIMENTO                             ');

      if DataSet = nil then
      begin
        qryArqRetorno.sql.Clear;
        qryArqRetorno.sql := sSQL;
        cdsArqRetorno.close;
        cdsArqRetorno.open;
        cdsArqRetorno.first;

        {totalizador}
        qryTotal.DatabaseName := qryArqRetorno.DatabaseName;
        qryTotal.sql.Text := 'Select SUM(DECODE(FLGDEVOLUCAO, 0, VALORESPERADO,-VALORESPERADO) + ALTERADORES) '+
                             '  from ('+sSQL.text+')';
        qryTotal.Open;
        lblTotRejeitado.caption := FormatFloat(',0.00;-,0.00', qryTotal.Fields[0].AsFloat);
        lblTotReg.caption := IntToStr(cdsArqRetorno.recordcount);
      end
      else
      begin
        DataSet.sql.Clear;
        DataSet.sql := sSQL;
        DataSet.open;
      end;

    end;

    if (tArquivo = taValReceber) or (tArquivo = taAmbos) and (rgrpTipoFolha.itemIndex = 0) then
    begin
      sSQL.clear;
      sSql.Add('SELECT C.FLGPAGADOR,  ');
      sSql.Add('       DECODE(C.FLGPAGADOR, ''P'', ''Patrocionadora'', ''Participante'') AS PAGADOR, ');
      sSql.Add('       SUM(DECODE(HST.FLGDEVOLUCAO,   ');
      sSql.Add('                  0,                  ');
      sSql.Add('                  HST.VALORESPERADO,  ');
      sSql.Add('                  -HST.VALORESPERADO)) VALORESPERADO, ');
      sSql.Add('       SUM(NVL(DECODE(HST.FLGDEVOLUCAO, 0,   ');
      sSql.Add('              (DECODE(HA.FLGTIPO, ''A'', HA.VALOR, -HA.VALOR)), ');
      sSql.Add('              (DECODE(HA.FLGTIPO, ''A'', HA.VALOR, -HA.VALOR))), 0)) ALTERA,  ');
      sSql.Add('       SUM(DECODE(HST.FLGDEVOLUCAO,                            ');
      sSql.Add('                  0,                                           ');
      sSql.Add('                  HST.VALORESPERADO,                           ');
      sSql.Add('                  -HST.VALORESPERADO)) +                       ');
      sSql.Add('       SUM(NVL(DECODE(HST.FLGDEVOLUCAO, 0,   ');
      sSql.Add('              (DECODE(HA.FLGTIPO, ''A'', HA.VALOR, -HA.VALOR)), ');
      sSql.Add('              (DECODE(HA.FLGTIPO, ''A'', HA.VALOR, -HA.VALOR))), 0)) TOTAL,  ');
      sSql.Add('       PATRO.NOME AS PATRONOME,                                ');
      sSql.Add('       PLANO.NOME AS PLANONOME                                 ');
      sSql.Add('  FROM HSTCONTRIBPREV HST                                      ');
      
{      sSql.Add('  JOIN DEPENTIT DE                                             ');
      sSql.Add('    ON DE.IDPESSOA = HST.IDPESSOA                              ');
      sSql.Add('   AND DE.IDTITULAR = HST.IDTITULAR                            '); }

      //sSql.Add('  LEFT JOIN HSTATRASOCONTRIB HA                                '); // Andre Imakawa - SIG 57285

      // Andre Imakawa - SIG 57285 - Inicio
      sSql.Add('  LEFT JOIN (SELECT SUM(Decode(Flgtipo, ''A'', Valor, -Valor)) Valor, ' );
      sSql.Add('                    Numrecebimento, '                                   );
      sSql.Add('                    Mesreferencia, '                                    );
      sSql.Add('                    Mescobranca, '                                      );
      sSql.Add('                    Idmotivo, '                                         );
      sSql.Add('                    Flgtipo '                                           );
      sSql.Add('               FROM Hstatrasocontrib '                                  );
      sSql.Add('              group by Numrecebimento, '                                );
      sSql.Add('                       Mesreferencia, '                                 );
      sSql.Add('                       Mescobranca, '                                   );
      sSql.Add('                       Idmotivo, '                                      );
      sSql.Add('                       Flgtipo) Ha '                                    );
      // Andre Imakawa - SIG 57285 - Fim

      sSql.Add('    ON HA.NUMRECEBIMENTO = HST.NUMRECEBIMENTO                  ');
      sSql.Add('   AND HA.MESREFERENCIA = HST.MESREFERENCIA                    ');
      sSql.Add('   AND HA.MESCOBRANCA = HST.MESCOBRANCA                        ');
      sSql.Add('   AND HA.IDMOTIVO = HST.IDMOTIVO                              ');

      sSql.Add('  JOIN CONTPREV C                                              ');
      sSql.Add('    ON C.IDPLANOPREV = HST.IDPLANOPREV                         ');
      sSql.Add('   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO                   ');

{      sSql.Add('  JOIN CONTPLANPATRO CP                                        ');
      sSql.Add('    ON CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAO                  ');
      sSql.Add('   AND CP.IDPLANOPREV = HST.IDPLANOPREV                        ');
      sSql.Add('   AND CP.IDPESSJUR = HST.IDPESSJUR                            ');  }

      sSql.Add('  JOIN (SELECT P.IDPESSOA, P.NOME                              ');
      sSql.Add('          FROM PESSOA P, PATRO PT                              ');
      sSql.Add('         WHERE PT.IDPESSOA = P.IDPESSOA                        ');
      sSql.Add('           AND PT.IDFUNDACAO = 1) PATRO                        ');
      sSql.Add('    ON HST.IDPESSJUR = PATRO.IDPESSOA                          ');
      sSql.Add('  JOIN PLANPREV PLANO                                          ');
      sSql.Add('    ON HST.IDPLANOPREV = PLANO.IDPLANOPREV                     ');
      sSql.Add(' WHERE HST.MESCOBRANCA = '+QuotedStr(rParametros.sMesCobranca));
      sSql.Add('   AND HST.IDPLANOPREV = '+IntToStr(rParametros.iIdPlanoPrev));
      sSql.Add('   AND HST.IDPESSJUR   = '+IntToStr(rParametros.iIdPessJur));
      sSql.Add('   AND HST.SEQPROPOSTA = 1 ');
      sSql.Add('   AND HST.DATAPREVISAORECE = '+QuotedStr(dtRecebimento.Text ));
      sSql.Add('   AND ((HST.SITRECEBIMENTO IN (1) AND NVL(HST.VALORRECEBIDO, 0) = 0 AND      ');
      sSql.Add('       HST.DATARECEBIMENTO IS NULL AND HST.CODDOCUMENTOPREV IS NULL AND       ');
      sSql.Add('       C.FLGPAGADOR = ''P'') OR                                               ');
      sSql.Add('       (HST.SITRECEBIMENTO IN (2, 3) AND HST.DATARECEBIMENTO IS NOT NULL AND  ');
      sSql.Add('       HST.VALORRECEBIDO IS NOT NULL AND HST.CODDOCUMENTOPREV IS NULL AND     ');
      sSql.Add('       HST.FOLHAORIGEM <> ''B'' AND HST.FLGDESCFOLHA = 1))     ');
      sSql.Add('   AND NOT EXISTS (SELECT 1                                    ');
      sSql.Add('                     FROM RETORNOHSTCONTRIBPATRO R             ');
      sSql.Add('                    WHERE R.NUMRECEBIMENTO = HST.NUMRECEBIMENTO) ');

      // utiliza a lista de contribuição apenas se não forem selecionadas todas
      if lstContrib.Items.Count > 0 then
         sSql.Add('   AND ' + QuebrarListaFiltro(1, 'HST.IDCONTRIBUICAO', rParametros.sIdContrib, 500) );

      sSql.Add('GROUP BY C.FLGPAGADOR, PATRO.NOME, PLANO.NOME');

      if DataSet = nil then
      begin
        qryValReceber.sql.Clear;
        qryValReceber.sql := sSQL;
        qryValReceber.open;
        qryValReceber.first;
      end
      else
      begin
        DataSet.sql.Clear;
        DataSet.sql := sSQL;
        DataSet.open;
        DataSet.first;
      end;


    end;

  finally
    FreeAndNil( sSQL );
  end;

end;

procedure TfrmRecebeContribuicaoNovo.CarregaArquivoRetorno;
var
  item, i : integer;
  sContribuicoes : string;
  sMesCobranca   : string;
begin

  for i := 0 to lstContribSel.items.count-1 do
  begin
    item  := Integer(lstContribSel.Items.Objects[i]);
    sContribuicoes := sContribuicoes + iff(sContribuicoes='', '', ', ') + IntToStr(item);
  end;

  sMesCobranca := Trim(spedAnoCob.Text)+'/'+CompletaString( IntToStr(cmbMesCob.ItemIndex+1), '0', 2, false);

  {verifica se mudou algum parametro}
  if (rParametros.sMesCobranca <> sMesCobranca) or (rParametros.iIdPessJur <> iIdPatroSelecionada) or
     (rParametros.sIdContrib <> sContribuicoes) or (rParametros.iIdPlanoPrev <> iIdPlanoSelecionado) then
  begin
    {atualiza valor dos parametros}
    rParametros.sMesCobranca := sMesCobranca;
    rParametros.iIdPessJur   := iIdPatroSelecionada;
    rParametros.iIdPlanoPrev := iIdPlanoSelecionado;
    rParametros.sIdContrib   := sContribuicoes;

    AbreArquivo(taRetorno);

    if pgctrlOpcoes.ActivePage = tbsValorRec then
       AbreArquivo(taValReceber);

  end;
end;

procedure TfrmRecebeContribuicaoNovo.rgrpPatroClick(Sender: TObject);
begin
  inherited;
  iIdPatroSelecionada := Integer(rgrpPatro.Items.Objects[rgrpPatro.ItemIndex]);

  qryPlano.Close;
  qryPlano.ParamByName('pIDPESSJUR').AsInteger := iIdPatroSelecionada;
  qryPlano.Open;

  {preenche grupo de opcoes}
  rgrpPlano.Items.clear;
  while not qryPlano.eof do
  begin
    rgrpPlano.Items.AddObject(qryPlano.FieldByName('NOME').AsString, TObject(qryPlano.FieldByName('IDPLANOPREV').AsInteger) );
    qryPlano.next;
  end;
  rgrpPlano.ItemIndex := 0;
end;

procedure TfrmRecebeContribuicaoNovo.rgrpPlanoClick(Sender: TObject);
begin
  inherited;
  iIdPlanoSelecionado := Integer(rgrpPlano.Items.Objects[rgrpPlano.ItemIndex]);
  HabilitaControles;
end;

procedure TfrmRecebeContribuicaoNovo.cmbMesCobChange(Sender: TObject);
begin
  inherited;
  HabilitaControles;
end;

procedure TfrmRecebeContribuicaoNovo.spedAnoCobChange(Sender: TObject);
begin
  inherited;
  if length(spedAnoCob.text) = 4 then
     HabilitaControles;
end;

procedure TfrmRecebeContribuicaoNovo.btnNumRecebClick(Sender: TObject);
begin
  inherited;
  if edtNumReceb.text <> '' then
  begin
    if not cdsArqRetorno.locate('NUMRECEBIMENTO', edtNumReceb.text, [loPartialKey]) then
       MsgDlg('Não foi encontrado registro de contribuição com o número de recebimento informado.','Atenção',mtInformation,[mbOK],0)
    else
       gridArqRet.setfocus;
  end;
end;

procedure TfrmRecebeContribuicaoNovo.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if cdsArqRetorno.IsEmpty then
     Exit;

  cdsArqRetorno.DisableControls;
  cdsArqRetorno.Filter   := 'SELECIONA = ''S'' ';
  cdsArqRetorno.Filtered := true;
  if cdsArqRetorno.isEmpty then
  begin
    MsgDlg('Nenhuma contribuição foi selecionada.','Atenção',mtInformation,[mbOK],0);
    cdsArqRetorno.filtered := false;
    cdsArqRetorno.EnableControls;
    exit;
  end;


  if MsgDlg('Confirma exclusão da(s) contribuição(ões) da lista?.','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then
  begin
    try
      {cdsArqRetorno.DisableControls;
      cdsArqRetorno.Filter   := 'SELECIONA = ''S'' ';
      cdsArqRetorno.Filtered := true;
      if not cdsArqRetorno.eof then   }
      begin

        if not(dtmBaseDados.dbBaseDados.InTransaction) then
           dtmBaseDados.dbBaseDados.StartTransaction;

        qryUpdArqRet.sql.clear;
        qryUpdArqRet.sql.Text := 'DELETE FROM RETORNOHSTCONTRIBPATRO WHERE NUMRECEBIMENTO = :PNUMRECEBIMENTO';

        while not cdsArqRetorno.eof do
        begin
          qryUpdArqRet.close;
          qryUpdArqRet.ParamByName('PNUMRECEBIMENTO').AsInteger := cdsArqRetorno.FieldByName('NUMRECEBIMENTO').AsInteger;
          qryUpdArqRet.ExecSql;

          cdsArqRetorno.delete;
        end;

        if (dtmBaseDados.dbBaseDados.InTransaction) then
           dtmBaseDados.dbBaseDados.Commit;

      end;
      cdsArqRetorno.filtered := false;
      cdsArqRetorno.EnableControls;
      AbreArquivo(taRetorno);

    except
        if (dtmBaseDados.dbBaseDados.InTransaction) then
           dtmBaseDados.dbBaseDados.RollBack;
    end;

  end;
  gridArqRet.setfocus;
end;

procedure TfrmRecebeContribuicaoNovo.btnIncluirClick(Sender: TObject);
begin
  inherited;
  msIncluiContrib.Executar;

  try
    if msIncluiContrib.RetornouValor then
    begin
      if not(dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.StartTransaction;

      qryUpdArqRet.sql.clear;
      qryUpdArqRet.sql.Text := 'INSERT INTO RETORNOHSTCONTRIBPATRO '+
                               '  (NUMRECEBIMENTO, FLGEXISTEHST, TRGDTINCLUSAO, TRGUSERINCLUSAO, OBSERVACOES) '+
                               'VALUES '+
                               '  (:PNUMRECEBIMENTO, 1, :PDATA, :PUSUARIO, '''') ';
      qryUpdArqRet.ParamByName('PNUMRECEBIMENTO').AsInteger := StrToInt(msIncluiContrib.ValoresChave[0]);
      qryUpdArqRet.ParamByName('PDATA').AsDateTime          := Now;
      qryUpdArqRet.ParamByName('PUSUARIO').AsInteger        := Sistema.IdUsuario;
      qryUpdArqRet.ExecSQL;

      if (dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.Commit;

      AbreArquivo(taRetorno);
    end;

    gridArqRet.setfocus;
    
  except
      if (dtmBaseDados.dbBaseDados.InTransaction) then
         dtmBaseDados.dbBaseDados.RollBack;
  end;

end;

procedure TfrmRecebeContribuicaoNovo.pgctrlOpcoesChange(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.enabled := (pgctrlOpcoes.ActivePage = tbsArqRetorno);

  if pgctrlOpcoes.ActivePage = tbsArqRetorno then
  begin
    gridArqRet.setFocus;
  end;

  if (pgctrlOpcoes.ActivePage = tbsValorRec) then
  begin
    if (rParametros.sDataRecebe <> dtRecebimento.date) then
       rParametros.sDataRecebe := dtRecebimento.date;
    AbreArquivo(taValReceber);
    gridValorRec.setFocus;
  end;
end;

procedure TfrmRecebeContribuicaoNovo.cdsArqRetornoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(cdsArqRetorno.FieldByName('VALORESPERADO')).DisplayFormat := ',0.00;-,0.00';
  TNumericField(cdsArqRetorno.FieldByName('VALOR_TOTAL')).DisplayFormat   := ',0.00;-,0.00';
  TNumericField(cdsArqRetorno.FieldByName('ALTERADORES')).DisplayFormat   := ',0.00;-,0.00';
  TStringField(cdsArqRetorno.FieldByName('SELECIONA')).ReadOnly           := false;
end;

procedure TfrmRecebeContribuicaoNovo.gridArqRetTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;

  if (not cdsArqRetorno.isEmpty) and
     ((AFieldName = 'NUMRECEBIMENTO') or (AFieldName = 'MATRICULA') or (AFieldName = 'NOME') or (AFieldName = 'MESREFERENCIA')) then
  begin
    If (Trim(cdsArqRetorno.IndexName) = Trim('asc' + AFieldName)) Then
      cdsArqRetorno.IndexName := 'desc' + AFieldName
    Else
      cdsArqRetorno.IndexName := 'asc' + AFieldName;
  end;
  cdsArqRetorno.first;
end;

procedure TfrmRecebeContribuicaoNovo.msIncluiContribBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
var
   sSQL : string;
begin
  inherited;
  sSQL := copy(sqlText, 1, Pos('ORDER', sqlText)-1);
  sSQL := sSQL + ' and h.idplanoprev = '+IntToStr(rParametros.iIdPlanoPrev) +
                 ' and h.idpessjur   = '+IntToStr(rParametros.iIdPessJur) +
                 ' and h.mescobranca = '+QuotedStr(rParametros.sMesCobranca) +
                 ' and h.sitrecebimento = 1 '+
                 ' and not exists (select 1 '+
                 '    from RETORNOHSTCONTRIBPATRO r '+
                 '   where r.numrecebimento = h.numrecebimento) ';

  // utiliza a lista de contribuição apenas se não forem selecionadas todas
  if lstContrib.Items.Count > 0 then
     sSQL := sSQL + '   AND ' + QuebrarListaFiltro(1, 'H.IDCONTRIBUICAO', rParametros.sIdContrib, 500);

  sqlText := sSQL + copy(sqlText, Pos('ORDER', sqlText), length(sqlText));
end;



procedure TfrmRecebeContribuicaoNovo.bbtnReceberClick(Sender: TObject);
var
  sMsgErro  : string;
  SP_PROC   : TStoredProc;
begin
  inherited;

  try
    qryPatro.Locate('IDPESSOA', iIdPatroSelecionada, [loCaseInsensitive]);
    // Gravar memo de Resultado
    memResult.Lines.Add('--------------------------------------------------------------------');
    memResult.Lines.Add('Patrocinadora : ' + qryPatro.FieldByName('NOME').AsString);
    memResult.Lines.Add('--------------------------------------------------------------------');
    memResult.Lines.Add('Início do Processamento : ' + DateTimeToStr(Now));

    try
      SP_PROC := TStoredProc.Create(Self);
      SP_PROC.DatabaseName  := 'BaseDados';

      if rgrpTipoFolha.ItemIndex = 0 then
      begin
        SP_PROC.StoredProcName  := 'CM.SP_CP_RECEB_PATRO';

        //Criando os parametros
        SP_PROC.Params.CreateParam(ftString,   'pMESCOBRANCA', ptInput);
        SP_PROC.Params.CreateParam(ftDate,     'pDATARECEBIMENTO', ptInput);
        SP_PROC.Params.CreateParam(ftInteger,  'pIDPESSJUR', ptInput);
        SP_PROC.Params.CreateParam(ftInteger,  'pIDPLANOPREV', ptInput);
        SP_PROC.Params.CreateParam(ftString,   'pIDCONTRIBUICAO', ptInput);
        SP_PROC.Params.CreateParam(ftInteger,  'pUSER', ptInput);
        SP_PROC.Params.CreateParam(ftString,   'pOutERRO', ptOutput);
        SP_PROC.Params.CreateParam(ftString,   'pOutDocumento', ptOutput);

        //Passandos os parâmetros
        SP_PROC.ParamByName('pMESCOBRANCA').AsString    := rParametros.sMesCobranca;
        SP_PROC.ParamByName('pDATARECEBIMENTO').AsDate  := dtRecebimento.date;
        SP_PROC.ParamByName('pIDPESSJUR').AsInteger     := rParametros.iIdPessJur;
        SP_PROC.ParamByName('pIDPLANOPREV').AsInteger   := rParametros.iIdPlanoPrev;
        SP_PROC.ParamByName('pIDCONTRIBUICAO').AsString := rParametros.sIdContrib;
        SP_PROC.ParamByName('pUSER').AsInteger          := Sistema.IdUsuario;

        if not SP_PROC.Prepared then
           SP_PROC.Prepare;

        SP_PROC.Close;
        SP_PROC.ExecProc;

      end
      else
      begin
        SP_PROC.StoredProcName  := 'CM.SP_CP_RECEB_ASSIS';

        //Criando os parametros
        SP_PROC.Params.CreateParam(ftString,   'pMESCOBRANCA', ptInput);
        SP_PROC.Params.CreateParam(ftString,   'pOutERRO', ptOutput);

        //Passandos os parâmetros
        SP_PROC.ParamByName('pMESCOBRANCA').AsString := rParametros.sMesCobranca;

        if not SP_PROC.Prepared then
           SP_PROC.Prepare;

        SP_PROC.Close;
        SP_PROC.ExecProc;

      end;

      {apresenta msg de erro, caso tenha ocorrido}
      sMsgErro := SP_PROC.parambyName('pOutERRO').asString;
      bErro    := (sMsgErro <> EmptyStr);
      if sMsgErro <> EmptyStr then
      begin
        MsgDlg(sMsgErro, Sistema.NomeModulo, mtWarning, [mbOk], 0);
        pgctrlOpcoes.ActivePage := tbsResultado;
        if (rgrpTipoFolha.ItemIndex = 0) then
           memResult.Lines.Add('[ERRO ] - '+sMsgErro)
        else
           memResult.Lines.Add('[AVISO] - '+sMsgErro);

      end;

      if (not bErro) and (rgrpTipoFolha.ItemIndex = 0) then
      begin
        pgctrlOpcoes.ActivePage := tbsResultado;
        memResult.Lines.Add('Documento(s) gerado(s): '+SP_PROC.parambyName('pOutDocumento').asString);
      end;

      memResult.Lines.Add(' ');
      memResult.Lines.Add('Término do Processamento : ' + DateTimeToStr(Now));

    except
      MsgDlg('Erro ao Receber Contribuição.', 'Erro', mtError, [mbOk], 0);
    end;

  finally
    FreeAndNil(SP_PROC);
  end;

end;


procedure TfrmRecebeContribuicaoNovo.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
    memResult.Lines.SaveToFile(savedlg.filename);
end;


procedure TfrmRecebeContribuicaoNovo.dtRecebimentoChange(Sender: TObject);
begin
  inherited;
  if (length(dtRecebimento.text) = 10) and (rgrpTipoFolha.itemIndex = 0) and
     (Trim(cmbMesCob.Text) <> '') and (Trim(spedAnoCob.text) <> '') and (lstContribSel.Items.Count > 0) and
     (pgctrlOpcoes.ActivePage = tbsValorRec) then
  begin
    AbreArquivo(taValReceber);
  end;
end;

procedure TfrmRecebeContribuicaoNovo.qryValReceberAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TNumericField(qryValReceber.FieldByName('VALORESPERADO')).DisplayFormat := ',0.00;-,0.00';
  TNumericField(qryValReceber.FieldByName('ALTERA')).DisplayFormat        := ',0.00;-,0.00';
  TNumericField(qryValReceber.FieldByName('TOTAL')).DisplayFormat         := ',0.00;-,0.00';
end;

procedure TfrmRecebeContribuicaoNovo.rgrpTipoFolhaClick(Sender: TObject);
begin
  inherited;
  tbsValorRec.TabVisible := (rgrpTipoFolha.ItemIndex = 0);
end;


procedure TfrmRecebeContribuicaoNovo.gridArqRetCalcTitleImage(
  Sender: TObject; Field: TField;
  var TitleImageAttributes: TwwTitleImageAttributes);
begin
  inherited;
  if (not cdsArqRetorno.isEmpty) and
     ((Field.FieldName = 'NUMRECEBIMENTO') or (Field.FieldName = 'MATRICULA') or
      (Field.FieldName = 'NOME') or (Field.FieldName = 'MESREFERENCIA')) then
  begin
    TitleImageAttributes.ImageIndex := 0;
    If Trim(cdsArqRetorno.IndexName) = Trim('desc' + Field.FieldName) Then
       TitleImageAttributes.ImageIndex := 1;
  End;
end;

procedure TfrmRecebeContribuicaoNovo.btnMarcaTodasClick(Sender: TObject);
begin
  inherited;
  MarcaDesmarca('TODAS');
end;

procedure TfrmRecebeContribuicaoNovo.btnInverteClick(Sender: TObject);
begin
  inherited;
  MarcaDesmarca('INVERTE');
end;

procedure TfrmRecebeContribuicaoNovo.MarcaDesmarca(sOperacao: string);
begin
  cdsArqRetorno.DisableControls;
  cdsArqRetorno.First;
  while not cdsArqRetorno.eof do
  begin
    cdsArqRetorno.edit;
    if (sOperacao = 'TODAS') then
       cdsArqRetorno.FieldByName('SELECIONA').AsString := 'S'
    else  //inverter
       cdsArqRetorno.FieldByName('SELECIONA').AsString := iff(cdsArqRetorno.FieldByName('SELECIONA').AsString = 'S', 'N', 'S');
    cdsArqRetorno.post;

    cdsArqRetorno.next;
  end;
  cdsArqRetorno.First;
  cdsArqRetorno.EnableControls;
  gridArqRet.setFocus;
end;

end.
