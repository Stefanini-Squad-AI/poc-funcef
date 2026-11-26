unit FCtrlDivBenefContab;

{
***************************** REGISTRO DE ALTERAÇÕES **********************************
***************************************************************************************
---------------------------------------------------------------------------------------
Alteracao   : btnGeraRelClick
Pendência   : WO27589
Responsável : Luis Ferrari
Merge       : 11/02/2026
Data        : 27/11/2025
Descrição   : Ajuste na query do relatorio da planilha
---------------------------------------------------------------------------------------
Alteracao   : MontaSQLAnalitica
Pendência   : WO31403
Responsável : Edilaine
Data        : 20/01/2026
Descrição   : Ajuste no Campo Reversao de Provisão de Perda
---------------------------------------------------------------------------------------
Alteracao   : MontaSQLAnalitica
Pendência   : WO18827
Responsável : Edilaine
Data        : 07/02/2025
Descrição   : Ajuste no Campo Saldo Remanescente
---------------------------------------------------------------------------------------
Alteracao   : MontaSQLAnalitica
Pendência   : WO15318
Responsável : Helen V Bianchi
Data        : 10/10/2024
Descrição   : Ajuste no Campo Saldo Remanescente
---------------------------------------------------------------------------------------
Alteracao   :
Pendência   : WO8772
Responsável : edilaine
Data        : 07/03/2024
Descrição   : Erro ao atualizar saldo de contas após contabilização
---------------------------------------------------------------------------------------
Alteracao   : Contabiliza
Pendência   : 126276
Responsável : edilaine
Data        : 11/07/2023
Descrição   : Historico de Movimentos da Divida
---------------------------------------------------------------------------------------
Alterações  : MontaSQLAnalitica
Pendência   : SIG 133536
Responsável : Luis Ferrari
Data        : 06/07/2023
Descrição   : Ajuste na query sobre itens suspensos e não gerados.(Retirado opção de 1ª parcela
--------------------------------------------------------------------------------------
Alterações  : criacao da funcionalidade
Pendência   : SIG 134591
Responsável : Luis Ferrari
Data        : 03/07/2023
Descrição   : Ajuste dos PLNCODIGO na tabela hstdividabenefxcontab
--------------------------------------------------------------------------------------
Alterações  : criacao da funcionalidade
Pendência   : SIG 115304
Responsável : edilaine
Data MERGE  : 25/01/2023
Data        : 20/09/2021
Descrição   : Contabilização dos tipos de dividas e provisao de perdas
--------------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, StdCtrls, TB97Ctls, Spin, IvDictio, IvMulti, IvEMulti,
  fcButton, fcImgBtn, fcShapeBtn, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  fcLabel, ComCtrls, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery,
  uCtrlContab, uCtrlPadroes, uCtrlLancamento, uCtrlPeriodo,
  Grids, Wwdbigrd, Wwdbgrid, FExportDManual, ppEndUsr, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppProd, ppClass, ppReport, ppCtrls, ppVar, ppPrnabl, ppBands,
  ppCache, FPreviewExport, ppDBBDE, ppStrtch, ppSubRpt, UControleDividaBenef,
  UFuncoesUteis;

type
  TOperacaoOk = (toNone, toSucesso, toErro);

  TfrmCtrlDivBenefContab = class(TfrmWizardMT)
    qryAnalitica: TwwQuery;
    dsAnalitica: TDataSource;
    qryGeral: TwwQuery;
    qryPlanos: TwwQuery;
    qryContaItens: TwwQuery;
    qryUpd: TwwQuery;
    ppGeral: TppDBPipeline;
    rpContabiliza: TppReport;
    dsContabiliza: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppTitleBand1: TppTitleBand;
    ppImage2: TppImage;
    lbl_Titulo: TppLabel;
    ppLabel2: TppLabel;
    ppLabel16: TppLabel;
    ppLabel28: TppLabel;
    ppLabel37: TppLabel;
    ppLabel41: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine9: TppLine;
    lbl_mescobranca: TppLabel;
    qryDesfaz: TwwQuery;
    ppSubProvisao: TppSubReport;
    ppChildReport1: TppChildReport;
    ppSubGeral: TppSubReport;
    ppChildReport2: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppTitleBand3: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppShape2: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppShape3: TppShape;
    ppLabel8: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel3: TppLabel;
    lbl_Rodape: TppLabel;
    qryContab: TwwQuery;
    dsGeral: TDataSource;
    ppContabil: TppBDEPipeline;
    ppSituacao: TppBDEPipeline;
    dsSituacao: TDataSource;
    qrySituacao: TwwQuery;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    pplblContabRP: TppLabel;
    pplblContabAP: TppLabel;
    pplblContabTPP: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppShape5: TppShape;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppShape6: TppShape;
    ppLabel19: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppSubSituacao: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppTitleBand4: TppTitleBand;
    ppShape7: TppShape;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLabel20: TppLabel;
    ppShape8: TppShape;
    ppDBText6: TppDBText;
    ppShape4: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    pplblGeralREC: TppLabel;
    pplblGeralFORMA: TppLabel;
    pplblGeralSR: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine10: TppLine;
    ppdbSituacao: TppDBText;
    btnGeraRel: TToolbarButton97;
    pplblGeralSLD: TppLabel;
    ppLine3: TppLine;
    ppDBText7: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppSubGeralBaixa: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppShape9: TppShape;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    pplblBaixaREC: TppLabel;
    pplblBaixaFORMA: TppLabel;
    pplblBaixaBD: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    pplblBaixaSLD: TppLabel;
    ppLine19: TppLine;
    ppShape10: TppShape;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppShape11: TppShape;
    ppLabel29: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    pplblBaixaSR: TppLabel;
    ppLine20: TppLine;
    ppDBText21: TppDBText;
    ppDBCalc14: TppDBCalc;
    pplblContabPP: TppLabel;
    ppDBText13: TppDBText;
    ppDBCalc9: TppDBCalc;
    ppLabel18: TppLabel;
    ppDBText14: TppDBText;
    ppLine14: TppLine;
    pplblSitTit: TppLabel;
    ppLine21: TppLine;
    ppLabel7: TppLabel;
    ppDBText22: TppDBText;
    ppDBCalc10: TppDBCalc;
    qryAux: TwwQuery;
    qryExporta: TwwQuery;
    ppSubPlnCodigo: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppShape12: TppShape;
    ppLabel13: TppLabel;
    ppLine22: TppLine;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine23: TppLine;
    ppShape13: TppShape;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    qryPlncodigo: TwwQuery;
    dsPlncodigo: TDataSource;
    ppPlnCodigo: TppDBPipeline;
    ppLabel17: TppLabel;
    ppLabel21: TppLabel;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppDBText27: TppDBText;
    ppDBText26: TppDBText;
    Panel2: TPanel;
    grdAnalitica: TwwDBGrid;
    plnLista: TPanel;
    grpMESCOB: TGroupBox;
    cbbMesCobr: TComboBox;
    seAnoCobr: TSpinEdit;
    btnProcessar: TBitBtn;
    Panel1: TPanel;
    btnGeraConfere: TToolbarButton97;
    lblTotalDiv: TLabel;
    Panel3: TPanel;
    memResult: TMemo;
    Panel4: TPanel;
    pnlOpcao: TPanel;
    btnContabOK: TSpeedButton;
    Label1: TLabel;
    chkDesfaz: TCheckBox;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText28: TppDBText;
    ppDBCalc15: TppDBCalc;
    ppLine26: TppLine;
    qrySaldoDiv: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraConfereClick(Sender: TObject);
    procedure btnGeraRelClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure rpContabilizaBeforePrint(Sender: TObject);
    procedure ppdbSituacaoPrint(Sender: TObject);
    procedure qryAnaliticaAfterOpen(DataSet: TDataSet);
    procedure pplblGeralSLDGetText(Sender: TObject; var Text: String);
    procedure pplblContabPPGetText(Sender: TObject; var Text: String);
    procedure pplblGeralSRGetText(Sender: TObject; var Text: String);
    procedure pplblBaixaSRGetText(Sender: TObject; var Text: String);
    procedure pplblSitTitGetText(Sender: TObject; var Text: String);
    procedure pplblContabAPGetText(Sender: TObject; var Text: String);
    procedure btnProcessarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlContab     : TCtrlContab;
    CtrlLancamento : TCtrlLancamento;
    CtrlPeriodo    : TCtrlPeriodo;

    OperacaoOK    : TOperacaoOk;

    sMesCobranca  : string;
    bTemBaixaReaj : boolean;
    bPeriodoContabilizado : boolean;

    function MontaSQLAnalitica(bRelatorio : boolean = false) : string;
    function MontaSQLAnaliticaContab : string;
    function AbreDividasAContabilizar(bCarregaDados : boolean; bJaContabilizou : boolean = false) : boolean;


    procedure FormataLinhasHistorico(sHistorico : string;
                                     var Hist1 : string;
                                     var Hist2 : string;
                                     var Hist3 : string;
                                     var Hist4 : string;
                                     var Hist5 : string);


    function InsereContabil( const sSQL            : String;
                             const dDataLanc       : TDateTime;
                             var   sResult         : TStringList;
                             var   sErro           : TStringList;
                             var   iPlanilhaResult : Integer;
                             const prPlano         : string = ''
                           ): Integer;


    procedure TelaInicial;

    procedure Contabiliza;
    procedure DesfazContabiliza;

    procedure InsereHstContabil;
//    procedure PreenchePLNCodigoHstContabil(piIdPlanoprev, piPLNCodigo : integer);   // SIG 134591
    procedure PreenchePLNCodigoHstContabil(piIdPlanoprev, piPLNCodigo : integer; piMesCobranca : string);  // SIG 134591
    procedure ApagaHstContabil(piIdPlanoPrev : integer);

  public
    { Public declarations }
  end;

var
  frmCtrlDivBenefContab: TfrmCtrlDivBenefContab;

implementation

{$R *.DFM}

uses
   uDatabase, uSistema, uMensErro, UAdmPrev, DBaseDados, uIntegraBack;



procedure TfrmCtrlDivBenefContab.FormShow(Sender: TObject);
begin
  inherited;
  CtrlLancamento := TCtrlLancamento.Create;
  CtrlLancamento.Initialize(dtmBaseDados.dbBaseDados,
                            true,
                            Sistema.ConnectionType,
                            Sistema.ConnectionSide);

  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.initializeas( CtrlLancamento );
  CtrlPeriodo.OnMessageInfo := nil;

  CtrlContab := TCtrlContab.Create;
  CtrlContab.initializeas( CtrlLancamento );

  grdAnalitica.Selected.Clear;
  grdAnalitica.Selected.Add('CODDIVIDA'#9'10'#9'Cod. Divida');
  grdAnalitica.Selected.Add('Matricula'#9'10'#9'Matrícula');
  grdAnalitica.Selected.Add('Nome'#9'40'#9'Nome');
  grdAnalitica.Selected.Add('PlanoContab'#9'10'#9'Plano Contab');
  grdAnalitica.Selected.Add('DtLancDivida'#9'13'#9'Dt Lanc Dívida');
  grdAnalitica.Selected.Add('VlrBenef'#9'10'#9'Valor Benefício');
  grdAnalitica.Selected.Add('SaldoDevIni'#9'10'#9'Saldo Dev Ini');
  grdAnalitica.Selected.Add('SaldoDevAtual'#9'10'#9'Saldo Dev Mês Ant.');
  grdAnalitica.Selected.Add('Reajuste'#9'10'#9'Reajuste');
  grdAnalitica.Selected.Add('UltParcela'#9'10'#9'Ult Parcela');
  grdAnalitica.Selected.Add('VlrParcela'#9'10'#9'Vlr Parcela');
  grdAnalitica.Selected.Add('SituacaoParc'#9'10'#9'Situação Parcela');
  grdAnalitica.Selected.Add('IniCobranca'#9'12'#9'Ini Cobr');
  grdAnalitica.Selected.Add('FimCobranca'#9'12'#9'Fim Cobr'#9'F');
  grdAnalitica.Selected.Add('Percentual'#9'10'#9'% Parcela');
  grdAnalitica.Selected.Add('QtdePagas'#9'10'#9'Qtde Pagas');
  grdAnalitica.Selected.Add('QtdeParcelas'#9'10'#9'Qtde Tot Parcelas');
  grdAnalitica.Selected.Add('VlrRecebido'#9'10'#9'Recebimento');
  grdAnalitica.Selected.Add('RevBaixaDef'#9'10'#9'Rev. Baixa Def.');
  grdAnalitica.Selected.Add('ProvBaixaDef'#9'10'#9'Provisão Baixa Def.');
  grdAnalitica.Selected.Add('SldRemanescente'#9'10'#9'Saldo Remanescente');
  grdAnalitica.Selected.Add('SituacaoDivida'#9'10'#9'Situação Dívida');
  grdAnalitica.Selected.Add('Motivo'#9'10'#9'Motivo');
  grdAnalitica.Selected.Add('OBSERVACAO'#9'10'#9'Obs Final');
  grdAnalitica.Selected.Add('SldProvisaoAnt'#9'10'#9'Saldo Provisão Ant.');
  grdAnalitica.Selected.Add('ReversaoProv'#9'10'#9'Reversão Provisão');
  grdAnalitica.Selected.Add('Provisionar'#9'10'#9'A Provisionar');
  grdAnalitica.Selected.Add('SaldoProvisaoAtual'#9'10'#9'Saldo Provisão');

  OperacaoOK := toNone;

  TelaInicial();

end;

procedure TfrmCtrlDivBenefContab.btnContinuarClick(Sender: TObject);
begin
  OperacaoOK := toNone;

  case pagControle.ActivePageIndex of

    0: begin
         if chkDesfaz.checked then
         begin
           if VerificaPeridoBloqueado(sMesCobranca, grpMESCOB, false, chkDesfaz.checked) = 0 then
           begin
             inherited;
             DesfazContabiliza;
           end
           else
             Abort;
         end
         else
         begin
           if VerificaPeridoBloqueado(sMesCobranca, grpMESCOB) = 0 then
           begin
             if MsgDlg('Confirma a contabilização de Provisões das Dívidas de Benefício?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
             begin
               inherited;
               btnContinuar.enabled := false;
               Contabiliza;
             end
             else
               Abort;
           end
           else
             Abort;
         end;
       end;

   end;

   btnVoltar.visible  := pagControle.ActivePageIndex = 1;
   btnGeraRel.visible := pagControle.ActivePageIndex = 0;
end;


procedure TfrmCtrlDivBenefContab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CtrlContab.Free;
  CtrlLancamento.Free;
  CtrlPeriodo.Free;

  inherited;
end;


function TfrmCtrlDivBenefContab.MontaSQLAnaliticaContab : string;
var
   sSQL : string;
begin
  sSQL :=
  'SELECT C.CodDivida,                                       ' + #13 +
  '       (select matricula                                  ' + #13 +
  '          from depentit d where d.idpessoa = cp.idpessoa  ' + #13 +
  '           and d.idtitular = cp.idtitular) as Matricula,  ' + #13 +
  '       P.NOME,                                            ' + #13 +

  '       C.IDPLANPREVCONTAB as PlanoContab,                 ' + #13 +

  '       C.IDPLANOPREV,                                     ' + #13 +
  '       C.DtLancDivida,                                    ' + #13 +
  '       C.VlrBenef,                                        ' + #13 +
  '       C.SaldoDevIni,                                     ' + #13 +
  '       C.SaldoDevAtual,                                   ' + #13 +
  '       C.REAJUSTE,                                        ' + #13 +
  '       C.UltParcela,                                      ' + #13 +
  '       C.VlrParcela,                                      ' + #13 +
  '       DECODE(C.FLGSITUACAO, 0, ''Preparada'',                 ' + #13 +
  '                             1, ''Enviada'',                   ' + #13 +
  '                             2, ''Enviada e Não Recebida'',    ' + #13 +
  '                             3, ''Recebida'',                  ' + #13 +
  '                             4, ''Recebida com Divergência'',  ' + #13 +
  '                             5, ''Suspensa'', DECODE(C.FLGSTATUS, 2, ''Suspensa'', '''')) as SituacaoParc,  ' + #13 +
  '       C.IniCobranca,                                     ' + #13 +
  '       C.FimCobranca,                                     ' + #13 +
  '       C.Percentual,                                      ' + #13 +
  '       C.QtdePagas,                                       ' + #13 +
  '       C.QtdeParcelas,                                    ' + #13 +
  '       C.VlrRecebido,                                     ' + #13 +
  '       C.ProvBaixaDef,                                                       ' + #13 +
  '       C.RevBaixaDef,                                                        ' + #13 +
  '       C.SaldoBaixa,                                                         ' + #13 +
  '       C.SldRemanescente,                                 ' + #13 +
  '       C.FLGFORMACAO,                                     ' + #13 +
  '       CASE                                               ' + #13 +
  '         WHEN C.FLGSTATUS = 1 THEN ''DÍVIDA ATIVA''                          ' + #13 +
  '         WHEN C.FLGSTATUS = 2 AND C.FLGACAOJUD = 1 THEN ''SUSPENSA - JUD''   ' + #13 +
  '         WHEN C.FLGSTATUS = 2 AND C.FLGACAOJUD <>1 THEN ''SUSPENSA - ADM''   ' + #13 +
  '         WHEN C.FLGSTATUS = 3 AND C.FLGQUITADO = 1 THEN ''DÍVIDA QUITADA''   ' + #13 +
  '         WHEN C.FLGSTATUS = 3 AND C.FLGQUITADO = 0 THEN ''DÍVIDA ENCERRADA'' ' + #13 +
  '       END as SituacaoDivida,                                                ' + #13 +
  '       C.OBSERVACAO as Motivo,                                               ' + #13 +
  '       C.OBSERVACAO,                                                         ' + #13 +
  '       C.SldProvisaoAnt,                                                     ' + #13 +
  '       C.Provisionar,                                                        ' + #13 +
  '       C.RevProvisao   as ReversaoProv,                                      ' + #13 +
  '       C.SaldoProvisao as SaldoProvisaoAtual,                                ' + #13 +
  '       CP.IDPESSJUR,                           ' + #13 +
  '       C.PLNCODIGO,                            ' + #13 +
  '       C.FLGSTATUS,                            ' + #13 +
  '       C.FLGQUITADO,                           ' + #13 +
  '       C.FLGACAOJUD,                           ' + #13 +
  '       C.FLGSITUACAO                           ' + #13 +

  '  FROM HSTDIVIDABENEFXCONTAB   C                   ' + #13 +

  '  JOIN CONTROLEDIVIDABENEFICIO CP                  ' + #13 +
  '    ON CP.IDCONTROLEDIVIDABENEFICIO = C.CODDIVIDA  ' + #13 +

  '  JOIN PESSOA P                                    ' + #13 +
  '    ON P.IDPESSOA = CP.IDPESSOA                    ' + #13 +

  ' WHERE C.MESCOBRANCA = '+QuotedStr(sMesCobranca);

  sSQL := 'SELECT CC.* FROM ('+sSQL+') CC ';

  Result := sSQL;
end;


function TfrmCtrlDivBenefContab.MontaSQLAnalitica(bRelatorio : boolean = false) : string;
var
   sSQL : string;
begin
  sSQL :=
  'SELECT C.IDCONTROLEDIVIDABENEFICIO as CodDivida,         ' + #13 +
  '       (select matricula                                 ' + #13 +
  '          from depentit d where d.idpessoa = c.idpessoa  ' + #13 +
  '           and d.idtitular = c.idtitular) as Matricula,  ' + #13 +
  '       (select nome from pessoa p where p.idpessoa = c.idpessoa) as Nome, ' + #13 +

  '       PI.IDPLANPREVCONTAB as PlanoContab,     ' + #13 +

  '       C.IDPLANOPREV,                          ' + #13 +
  '       C.FONTEPAGADORA,                        ' + #13 +
  '       C.Data as DtLancDivida,                 ' + #13 +
  '       C.Valorbeneficio      as VlrBenef,      ' + #13 +
  '       C.Saldodevedorinicial as SaldoDevIni,   ' + #13 ;

  if (bRelatorio) then
    sSQL := sSQL +
    '       DECODE(TO_CHAR(C.MESINICIO, ''YYYY/MM''), '+QuotedStr(sMESCOBRANCA)+',  ' + #13 +
    '            0, NVL(H.SALDODEVEDORANT, C.SALDODEVEDORATUAL))  as SaldoDevAtual, ' + #13
//    '                           + GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0))                          ' + #13 +
//    '                           - GREATEST(NVL(H.VLRREVBAIXADEF,0), NVL(PP.REVBAIXADEF,0))  as SaldoDevAtual, ' + #13
  else if (chkDesfaz.checked) then
    sSQL := sSQL +
    '       C.SALDODEVEDORATUAL as SaldoDevAtual, ' + #13
  else
    sSQL := sSQL +
    '       DECODE(TO_CHAR(C.MESINICIO, ''YYYY/MM''), '+QuotedStr(sMESCOBRANCA)+',  ' + #13 +
    '            0, NVL(H.SALDODEVEDORANT, C.SALDODEVEDORATUAL))  as SaldoDevAtual, ' + #13;
//    '       DECODE(C.FLGQUITADO, 1, C.VALORULTIMAPARCELA, NVL(H.SALDODEVEDORANT, C.SALDODEVEDORATUAL))        ' + #13 +
//    '                           + GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0))                          ' + #13 +
//    '                           - GREATEST(NVL(H.VLRREVBAIXADEF,0), NVL(PP.REVBAIXADEF,0))  as SaldoDevAtual, ' + #13;

  sSQL := sSQL +
  '       -- reajuste saldo devedor               ' + #13 +
  '       DECODE(C.ULTMESREAJ, '+QuotedStr(sMESCOBRANCA)+', (C.Saldodevedoratual + NVL(H.ValorRecebido,0)) - H.SALDODEVEDORANT, 0) AS REAJUSTE, '+ #13;

  sSQL := sSQL +
  '       C.Valorultimaparcela  as UltParcela,    ' + #13 +
  '       H.NUMEROPARCELA       as NumParcela,    ' + #13 +
  '       H.VALORPREVISTO       as VlrParcela,    ' + #13 +
  '       DECODE(H.FLGSITUACAO, 0, ''Preparada'', ' + #13 +
  '                             1, ''Enviada'',   ' + #13 +
  '                             2, ''Enviada e Não Recebida'',    ' + #13 +
  '                             3, ''Recebida'',  ' + #13 +
  '                             4, ''Recebida com Divergência'',  ' + #13 +
  '                             5, ''Suspensa'', DECODE(C.FLGSTATUS, 2, ''Suspensa'', '''')) as SituacaoParc,  ' + #13 +
  '       C.Mesinicio  as IniCobranca,            ' + #13 +
  '       C.Mesfim     as FimCobranca,            ' + #13 +
  '       C.Percentual as Percentual,             ' + #13 +
  '       C.Quantidadeparcelaspagas as QtdePagas, ' + #13 +
  '       C.Qtdeparcelas as QtdeParcelas,         ' + #13 +
  '       NVL(H.ValorRecebido,0) as VlrRecebido,  ' + #13 ;



  if (bRelatorio) then
    sSQL := sSQL +
    '      -- provisao de baixa                                                      ' + #13 +
    '      GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0)) as ProvBaixaDef,       ' + #13 +
    '      GREATEST(NVL(H.VLRREVBAIXADEF,0), NVL(PP.REVBAIXADEF,0)) as RevBaixaDef,  ' + #13 +
    '      NVL(C.SALDOBAIXADEF,0)  as SaldoBaixa,                                    ' + #13 +

    '       C.SALDODEVEDORATUAL as SldRemanescente, ' + #13
  else if (chkDesfaz.checked) then
    sSQL := sSQL +
    '      -- provisao de baixa                                                      ' + #13 +
    '      GREATEST(NVL(H.VLRREVBAIXADEF,0), NVL(PP.REVBAIXADEF,0)) as ProvBaixaDef, ' + #13 +
    '      GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0)) as RevBaixaDef,        ' + #13 +
    '      NVL(C.SALDOBAIXADEF,0) + GREATEST(NVL(H.VLRREVBAIXADEF,0), NVL(PP.REVBAIXADEF,0))          '+ #13 +
    '                             - GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0)) as SaldoBaixa, '+ #13 +
    //WO15318 - Helen V Bianchi - Inicio
    //'       C.SALDODEVEDORATUAL + GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0))         ' + #13 +
    //'                           - GREATEST(NVL(H.VLRREVBAIXADEF,0), NVL(PP.REVBAIXADEF,0))  as SldRemanescente, ' + #13
    '       (DECODE(TO_CHAR(C.MESINICIO, ''YYYY/MM''), '+QuotedStr(sMESCOBRANCA)+',  ' + #13 +
    '       C.Saldodevedorinicial, NVL(H.SALDODEVEDORANT, C.SALDODEVEDORATUAL))  - NVL(H.ValorRecebido,0)) + ' + #13 +
    '       NVL(C.SALDOBAIXADEF,0) - GREATEST(NVL(H.VLRREVBAIXADEF,0), NVL(PP.REVBAIXADEF,0))    ' + #13 +
    //edilaine WO18827 : inicio
    //      -- reajuste saldo devedor
    '       - DECODE(C.ULTMESREAJ, '+QuotedStr(sMESCOBRANCA)+', (C.Saldodevedoratual + NVL(H.ValorRecebido,0)) - H.SALDODEVEDORANT, 0) '+ #13 +
    //edilaine WO18827 : fim
    '       - GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0)) as SldRemanescente, ' + #13
  else
    sSQL := sSQL +
    '      -- provisao de baixa                                                     ' + #13 +
    '      GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0)) as ProvBaixaDef,      ' + #13 +
    '      GREATEST(NVL(H.VLRREVBAIXADEF,0), NVL(PP.REVBAIXADEF,0)) as RevBaixaDef, ' + #13 +
    '      NVL(C.SALDOBAIXADEF,0) - GREATEST(NVL(H.VLRREVBAIXADEF,0), NVL(PP.REVBAIXADEF,0))          '+ #13 +
    '                             + GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0)) as SaldoBaixa, '+ #13 +
    //WO15318 - Helen V Bianchi - Inicio
    //'       C.SALDODEVEDORATUAL - GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0))         ' + #13 +
    //'                           + GREATEST(NVL(H.VLRREVBAIXADEF,0), NVL(PP.REVBAIXADEF,0))  as SldRemanescente, ' + #13;
    '       (DECODE(TO_CHAR(C.MESINICIO, ''YYYY/MM''), '+QuotedStr(sMESCOBRANCA)+',  ' + #13 +
    '       C.Saldodevedorinicial, NVL(H.SALDODEVEDORANT, C.SALDODEVEDORATUAL))  - NVL(H.ValorRecebido,0)) - ' + #13 +
    '       NVL(C.SALDOBAIXADEF,0) - GREATEST(NVL(H.VLRREVBAIXADEF,0), NVL(PP.REVBAIXADEF,0))    ' + #13 +
    //edilaine WO18827 : inicio
    //      -- reajuste saldo devedor
    '       + DECODE(C.ULTMESREAJ, '+QuotedStr(sMESCOBRANCA)+', (C.Saldodevedoratual + NVL(H.ValorRecebido,0)) - H.SALDODEVEDORANT, 0) '+ #13 +
    //edilaine WO18827 : fim
    '       - GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0)) as SldRemanescente, ' + #13;
    //WO15318 - Helen V Bianchi - Fim
  sSQL := sSQL +
  '       DECODE(TO_CHAR(C.MESINICIO, ''YYYY/MM''), '+QuotedStr(sMESCOBRANCA) +', 1, 0) AS FLGFORMACAO,    ' + #13 +
  '       CASE                                       ' + #13 +
  '         WHEN C.FLGSTATUS = 1 THEN ''DÍVIDA ATIVA''                          ' + #13 +
  '         WHEN C.FLGSTATUS = 2 AND C.FLGACAOJUD = 1 THEN ''SUSPENSA - JUD''   ' + #13 +
  '         WHEN C.FLGSTATUS = 2 AND C.FLGACAOJUD <>1 THEN ''SUSPENSA - ADM''   ' + #13 +
  '         WHEN C.FLGSTATUS = 3 AND C.FLGQUITADO = 1 THEN ''DÍVIDA QUITADA''   ' + #13 +
  '         WHEN C.FLGSTATUS = 3 AND C.FLGQUITADO = 0 THEN ''DÍVIDA ENCERRADA'' ' + #13 +
  '       END as SituacaoDivida,                  ' + #13 +
  '       C.OBSERVACAO as Motivo,                 ' + #13 +
  '       H.OBSERVACAO,                           ' + #13;

  if (bRelatorio) then
  begin
    sSQL := sSQL +
    '     -- provisao de perda                                                                                   ' + #13 +
    '     NVL(C.SALDOPROVPERDA, 0) - NVL(H.VLRPROVPERDA, 0)                                                      ' + #13 +
    '                              + GREATEST(NVL(H.VLRREVPROVISAO,0), NVL(PP.REVPROVISAO,0)) as SldProvisaoAnt, ' + #13 +

    '     NVL(CG.VLRPROVPERDA,0) + NVL(H.VLRPROVPERDA, 0) as Provisionar,                                        ' + #13 +
    '     NVL(CG.VLRREVPROVISAO,0) + GREATEST(NVL(H.VLRREVPROVISAO,0), NVL(PP.REVPROVISAO,0)) as ReversaoProv,   ' + #13 +
    '     NVL(C.SALDOPROVPERDA, 0)  as SaldoProvisaoAtual,                          ' + #13 ;

  end
  else if (chkDesfaz.checked) then
  begin
    sSQL := sSQL +
    '     -- provisao de perda                          ' + #13 +
    '     NVL(C.SALDOPROVPERDA, 0)  as SldProvisaoAnt,  ' + #13 +
    '     NVL(CG.VLRREVPROVISAO,0) + GREATEST(NVL(H.VLRREVPROVISAO,0), NVL(PP.REVPROVISAO,0)) as Provisionar,        ' + #13 +
    '     NVL(CG.VLRPROVPERDA,0) + NVL(H.VLRPROVPERDA, 0) as  ReversaoProv,                                          ' + #13 +
    '     NVL(C.SALDOPROVPERDA, 0) - NVL(H.VLRPROVPERDA, 0)                                                          ' + #13 +
    '                              + GREATEST(NVL(H.VLRREVPROVISAO,0), NVL(PP.REVPROVISAO,0)) as SaldoProvisaoAtual, ' + #13
  end
  else
  begin
    sSQL := sSQL +
    '     -- provisao de perda      ' + #13 +
    '     NVL(C.SALDOPROVPERDA,0)  - NVL(CG.VLRPROVPERDA,0) + NVL(CG.VLRREVPROVISAO,0) as SldProvisaoAnt,      ' + #13 +
    '     NVL(CG.VLRPROVPERDA,0)   + NVL(H.VLRPROVPERDA, 0) as Provisionar,                                    ' + #13 +
    '     NVL(CG.VLRREVPROVISAO,0) + GREATEST(NVL(H.VLRREVPROVISAO,0), NVL(PP.REVPROVISAO,0)) as ReversaoProv, ' + #13 +
    '     NVL(C.SALDOPROVPERDA, 0) + NVL(H.VLRPROVPERDA, 0)                                                    ' + #13 +
    '                              - GREATEST(NVL(H.VLRREVPROVISAO,0), NVL(PP.REVPROVISAO,0)) as SaldoProvisaoAtual,  ' + #13;
  end;

  if (chkDesfaz.checked) then
    sSQL := sSQL +
    '       -- para atualizar saldo                                 ' + #13 +
    '       NVL(C.SALDOPROVPERDA, 0) - NVL(H.VLRPROVPERDA, 0)       ' + #13 +
    '                                + GREATEST(NVL(H.VLRREVPROVISAO,0), NVL(PP.REVPROVISAO,0)) as AjustaProvisao_Sld,  ' + #13
  else
    sSQL := sSQL +
    '       -- para atualizar saldo                                 ' + #13 +
    '       NVL(C.SALDOPROVPERDA, 0) + NVL(H.VLRPROVPERDA, 0)       ' + #13 +
    '                                - GREATEST(NVL(H.VLRREVPROVISAO,0), NVL(PP.REVPROVISAO,0)) as AjustaProvisao_Sld,  ' + #13;

  sSQL := sSQL +
  '       CASE                                                  ' + #13 +
  '         WHEN                                                ' + #13 +
  '            NVL(H.VLRPROVPERDA, 0) > 0 OR                    ' + #13 +
  '            NVL(H.VLRREVPROVISAO, PP.REVPROVISAO) > 0 OR     ' + #13 +
  '            GREATEST(NVL(H.VLRBAIXADEF,0), NVL(PP.BAIXADEF,0)) - NVL(H.VLRREVBAIXADEF,0) > 0  ' + #13 +
  '         THEN 1                                              ' + #13 +
  '         ELSE 0                                              ' + #13 +
  '       END FLGAJUSTASALDO,                                   ' + #13 +

  '       CG.CTRLOPERACAO,                        ' + #13 +
  '       CG.VLRPROVPERDA   AS CARGA_PROVISAO,    ' + #13 +
  '       CG.VLRREVPROVISAO AS CARGA_REVERSAO,    ' + #13 +

  '       BF.IDPERFILINVEST,                      ' + #13 +
  '       C.IDPESSJUR,                            ' + #13 +
  '       H.PLNCODIGO,                            ' + #13 +
  '       C.FLGSTATUS,                            ' + #13 +
  '       C.FLGQUITADO,                           ' + #13 +
  '       C.FLGACAOJUD,                           ' + #13 +
  '       H.FLGSITUACAO                           ' + #13 +

  '  FROM CONTROLEDIVIDABENEFICIO C               ' + #13 +

  '  JOIN PESSOA P                                ' + #13 +
  '    ON P.IDPESSOA = C.IDPESSOA                 ' + #13 +

  ' LEFT                                            ' + #13 +
  ' JOIN BENEFBFCIARIO BF                           ' + #13 +
  '   ON BF.IDPESSOA    = C.IDPESSOA                ' + #13 +
  '  AND BF.IDTITULAR   = C.IDTITULAR               ' + #13 +
  '  AND BF.IDPESSJUR   = C.IDPESSJUR               ' + #13 +
  '  AND BF.IDPLANOPREV = C.IDPLANOPREV             ' + #13 +
  '  AND BF.IDBENEFICIO = C.IDBENEFICIO             ' + #13 +
  '  AND BF.NUMEROPROCESSO = C.NUMEROPROCESSO       ' + #13 +

  ' LEFT                                            ' + #13 +
  ' JOIN PERFILINVEST PI                            ' + #13 +
  '   ON PI.IDPERFILINVEST = BF.IDPERFILINVEST      ' + #13 +

  ' LEFT                                        ' + #13 +
  ' JOIN (SELECT HD.IDCONTROLEDIVIDABENEFICIO,  ' + #13 +
  '              HD.MESCOBRANCA,                ' + #13 +
  '              SUM(DECODE(HD.FLGDEVOLUCAO, 1, -HD.ValorRecebido, HD.ValorRecebido))        AS ValorRecebido, ' + #13 +
  '              SUM(DECODE(NVL(HD.FLGDEVOLUCAO,0), 1, -HD.VALORPREVISTO, HD.VALORPREVISTO)) AS VALORPREVISTO, ' + #13 +
  '              MAX(HD.NUMEROPARCELA)          AS NUMEROPARCELA,  ' + #13 +
  '              MAX(HD.FLGSITUACAO)            AS FLGSITUACAO,    ' + #13 +
  '              MAX(NVL(HD.VLRPROVPERDA,0))    AS VLRPROVPERDA,   ' + #13 +
  '              MAX(NVL(HD.VLRREVPROVISAO,0))  AS VLRREVPROVISAO, ' + #13 +
  '              MAX(NVL(HD.VLRBAIXADEF,0))     AS VLRBAIXADEF,    ' + #13 +
  '              MAX(NVL(HD.VLRREVBAIXADEF,0))  AS VLRREVBAIXADEF, ' + #13 +
  '              MAX(HD.IDPESSJUR)              AS IDPESSJUR,      ' + #13 +
  '              MAX(HD.PLNCODIGO)              AS PLNCODIGO,      ' + #13 +
  '              MAX(TRIM(HD.OBSERVACAO))       AS OBSERVACAO,     ' + #13 +
  '              MAX(NVL(HD.SALDODEVEDORANT,0)) AS SALDODEVEDORANT ' + #13 +
  //'              LISTAGG(TRIM(HD.OBSERVACAO), ''; '')       ' + #13 +
  //'                WITHIN GROUP (ORDER BY HD.IDCONTROLEDIVIDABENEFICIO, HD.NUMEROPARCELA) AS OBSERVACAO ' + #13 +
  '         FROM HSTDIVIDABENEFICIO HD                             ' + #13 +
  '         JOIN CONTROLEDIVIDABENEFICIO C1                        ' + #13 +
  '           ON C1.IDCONTROLEDIVIDABENEFICIO = HD.IDCONTROLEDIVIDABENEFICIO ' + #13 +
  '        WHERE HD.MESCOBRANCA = '+QuotedStr(sMESCOBRANCA)          + #13 +
//  '           OR (HD.MESCOBRANCA > '+QuotedStr(sMESCOBRANCA)         + #13 +                     // SIG 133536 Ferrari
//  '           AND HD.NUMEROPARCELA = 1                             ' + #13 +                     // SIG 133536 Ferrari
//  '           AND TO_CHAR(C1.MESINICIO, ''YYYY/MM'') <= '+QuotedStr(sMESCOBRANCA)+')' + #13 +    // SIG 133536 Ferrari
  '        GROUP BY HD.IDCONTROLEDIVIDABENEFICIO, HD.MESCOBRANCA   ' + #13 +
  '      ) H                                                       ' + #13 +
  '   ON C.IDCONTROLEDIVIDABENEFICIO = H.IDCONTROLEDIVIDABENEFICIO ' + #13 +
  //'  AND H.MESCOBRANCA = '+QuotedStr(sMESCOBRANCA)                   + #13 +

  ' LEFT  ' + #13 +
  ' JOIN CTRLDIVIDABENEFCARGA CG ' + #13 +
  '   ON CG.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO  ' + #13 +
  '  AND CG.MESANO = '+QuotedStr(sMESCOBRANCA)                         + #13 +
  '  AND CG.CTRLOPERACAO <> ''CARG''                                 ' + #13 +

  ' LEFT                                            ' + #13 +
  ' JOIN (SELECT H2.IDCONTROLEDIVIDABENEFICIO,      ' + #13 +
  '              H2.ValorRecebido,                  ' + #13 +
  '              DECODE(C2.FLGSTATUS, 1, /*ativa*/  ' + #13 +
  '                                   CASE          ' + #13 +
  //'                                     WHEN C2.SALDOPROVPERDA > (C2.Saldodevedoratual - H2.ValorRecebido) AND C2.SALDOPROVPERDA > 0 ' + #13 +   //edilaine WO31403
  //'                                       THEN C2.SALDOPROVPERDA - (C2.Saldodevedoratual - H2.ValorRecebido) ' + #13 +                           //edilaine WO31403
  '                                     WHEN C2.SALDOPROVPERDA > (H2.SaldoAnt - H2.ValorRecebido) AND C2.SALDOPROVPERDA > 0 ' + #13 +   //edilaine WO31403
  '                                       THEN C2.SALDOPROVPERDA - (H2.SaldoAnt - H2.ValorRecebido) ' + #13 +                           //edilaine WO31403
  '                                     ELSE           ' + #13 +
  '                                       0            ' + #13 +
  '                                   END,             ' + #13 +
  '                                2, /*suspensa*/     ' + #13 +
  '                                   CASE             ' + #13 +
  '                                     WHEN C2.SALDOPROVPERDA > (C2.Saldodevedoratual - H2.ValorRecebido) AND C2.SALDOPROVPERDA > 0 ' + #13 +
  '                                       THEN C2.SALDOPROVPERDA - (C2.Saldodevedoratual - H2.ValorRecebido) ' + #13 +
  '                                     ELSE           ' + #13 +
  '                                       0            ' + #13 +
  '                                   END,             ' + #13 +
  '                                3, /*encerrada*/    ' + #13 +
  '                                   CASE             ' + #13 +
  '                                     WHEN H2.ValorRecebido <> 0 and C2.Saldodevedoratual = 0  ' + #13 +
  '                                       THEN C2.SALDOPROVPERDA   ' + #13 +
  '                                     ELSE           ' + #13 +
  '                                       0            ' + #13 +
  '                                   END,             ' + #13 +
  '                                0                   ' + #13 +
  '                     ) as REVPROVISAO,               ' + #13 +

  '                     0 as BAIXADEF,   ' + #13 +

  '              DECODE(C2.FLGSTATUS, 1,       ' + #13 +
  '                                   CASE     ' + #13 +
  '                                     WHEN C2.SALDOBAIXADEF > 0 AND C2.Saldodevedoratual = 0 ' + #13 +
  '                                       THEN C2.SALDOBAIXADEF  ' + #13 +
  '                                     ELSE   ' + #13 +
  '                                       0    ' + #13 +
  '                                   END,     ' + #13 +
  '                    0)  as REVBAIXADEF      ' + #13 +

{  '              DECODE(C2.FLGSTATUS, 3,               ' + #13 +
  '                                     CASE            ' + #13 +
  '                                       WHEN H2.ValorRecebido = 0 and C2.Saldodevedoratual > 0   ' + #13 +
  '                                         THEN C2.Saldodevedoratual  ' + #13 +
  '                                       ELSE          ' + #13 +
  '                                         0           ' + #13 +
  '                                     END,            ' + #13 +
  '                                   0)  as BAIXADEF   ' + #13 +
}
  '         FROM (SELECT H3.IDCONTROLEDIVIDABENEFICIO,                               ' + #13 +
  '                      SUM(DECODE(NVL(H3.FLGDEVOLUCAO,0), 1, -H3.ValorRecebido, H3.ValorRecebido)) AS ValorRecebido, ' + #13 +
  '                      MAX(H3.SALDODEVEDORANT) AS SALDOANT                         ' + #13 +   //edilaine WO31403
  '                 FROM HSTDIVIDABENEFICIO H3, CONTROLEDIVIDABENEFICIO C3           ' + #13 +
  '                WHERE H3.IDCONTROLEDIVIDABENEFICIO = C3.IDCONTROLEDIVIDABENEFICIO ' + #13 +
  '                  AND H3.MESCOBRANCA   = '+QuotedStr(sMESCOBRANCA)                  + #13 +
  '                  AND C3.FONTEPAGADORA = 1                ' + #13 +
  '                  GROUP BY H3.IDCONTROLEDIVIDABENEFICIO   ' + #13 +
  '              ) H2                                        ' + #13 +
  '         JOIN CONTROLEDIVIDABENEFICIO C2                                   ' + #13 +
  '           ON C2.IDCONTROLEDIVIDABENEFICIO = H2.IDCONTROLEDIVIDABENEFICIO  ' + #13 +
  '        WHERE C2.FONTEPAGADORA = 1                                         ' + #13 +
  '      ) PP                                                                 ' + #13 +
  '   ON PP.IDCONTROLEDIVIDABENEFICIO = H.IDCONTROLEDIVIDABENEFICIO           ' + #13 +

  'WHERE C.FONTEPAGADORA = 1                                                  ' + #13 +
  //'  AND (TO_CHAR(C.MESINICIO, ''YYYY/MM'') = '+QuotedStr(sMESCOBRANCA)         + #13 +
  '  AND (EXISTS (SELECT 1                                                     ' + #13 +
  '                FROM HSTDIVIDABENEFICIO H1                                 ' + #13 +
  '                JOIN CONTROLEDIVIDABENEFICIO C4                                  ' + #13 +
  '                  ON C4.IDCONTROLEDIVIDABENEFICIO = H1.IDCONTROLEDIVIDABENEFICIO ' + #13 +
  '               WHERE H1.IDCONTROLEDIVIDABENEFICIO = H.IDCONTROLEDIVIDABENEFICIO  ' + #13 +
  '                 AND C4.FONTEPAGADORA = 1                                        ' + #13 +
  '                 AND H1.MESCOBRANCA >= '+QuotedStr(sMESCOBRANCA)+')'                + #13 +
  '   OR (C.FLGSTATUS = 2 AND TO_CHAR(C.MESINICIO,''YYYY/MM'') <= '+QuotedStr(sMESCOBRANCA)+') )'  + #13;  // SIG 133536

  if (chkDesfaz.checked) then
     sSQL := sSQL + '  AND H.PLNCODIGO IS NOT NULL ' + #13
  else if (bRelatorio)  then
     sSQL := sSQL + '  AND (H.PLNCODIGO IS NOT NULL OR (H.PLNCODIGO IS NULL AND C.FLGSTATUS = 2)' + #13 +
                    '                               OR (H.PLNCODIGO IS NULL AND NVL(H.ValorRecebido,0) > 0))' + #13
  else
     sSQL := sSQL + '  AND H.PLNCODIGO IS NULL ' + #13;

  sSQL   := 'SELECT CC.* FROM ('+sSQL+') CC WHERE CC.FONTEPAGADORA = 1';

  Result := sSQL;

end;


function TfrmCtrlDivBenefContab.AbreDividasAContabilizar(bCarregaDados : boolean; bJaContabilizou : boolean = false): boolean;
begin
  Result := false;

   try
      qryAnalitica.close;
      qryAnalitica.SQL.Clear;
      if not bJaContabilizou then
         qryAnalitica.SQL.Text := MontaSQLAnalitica
      else
         qryAnalitica.SQL.Text := MontaSQLAnaliticaContab;

      if not bCarregaDados then
         qryAnalitica.SQL.Add('AND 1 = 2');

      qryAnalitica.SQL.Add('ORDER BY CC.FLGSTATUS, CC.MATRICULA ');
      qryAnalitica.Open;

      lblTotalDiv.Visible := False;

      if not(qryAnalitica.isEmpty) then
      begin
         lblTotalDiv.Caption := FormatFloat('#,#0', qryAnalitica.RecordCount) + ' Dívidas';
         lblTotalDiv.Visible := True;

        if chkDesfaz.checked then
           plnLista.Caption := 'Desfazer Contabilização'
        else if not bJaContabilizou then
           plnLista.Caption := 'Dívidas a Contabilizar'
        else
           plnLista.Caption := 'Dívidas Contabilizadas';

         Result := True;
      end
      else
      begin
        if chkDesfaz.checked then
           MsgDlg('Não foram encontradas dívidas para desfazer a contabilizar no mês '+sMescobranca+'!',
                  'Benefício', mtInformation, [mbOK], 0)
        else if bCarregaDados then
           MsgDlg('Não foram encontradas dívidas para contabilizar no mês '+sMescobranca+' !',
                  'Benefício', mtInformation, [mbOK], 0);
         Repaint;
      end;
   except
      Raise;
      Repaint;
   end;

end;


procedure TfrmCtrlDivBenefContab.Contabiliza;
var
  iPlanilha      : Integer;
  iResult        : Integer;
  iContador      : Integer;
  sResult        : TStringList;
  sErro          : TStringList;
  sSQLContab     : String;
  sHistorico     : String;
  sDataContab    : String;
  s              : String;
  dDataIni       : TDateTime;
  dDataContab    : TDateTime;
  sSQLAnalitica  : string;
  sSQLSaldo      : string;
  lstMovDivida   : TStringList;    //edilaine SIG126276
  sTipo, sDivida : string;         //edilaine SIG126276
begin
   // ----------------------------------------------------------------------------------------------
   // limpa e inicializa o memo de resultado
   memResult.Clear;

   dDataIni := Now;

   memResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDataIni));
   memResult.Lines.Add(' ');

   memResult.Lines.Add('Contabilização de Dívidas de Benefício: '+sMesCobranca);
   memResult.Lines.Add(' ');
   // ----------------------------------------------------------------------------------------------

   sErro := TStringList.Create;

   sDataContab := '01'+copy(sMesCobranca,5,3)+'/'+copy(sMesCobranca,1,4);
   dDataContab := TrazUltDiaData(StrToDate(sDataContab));
   //sHistorico  := 'DÍVIDAS DE BENEFÍCIO - ref: ' + sDataContab;

   lstMovDivida   := TStringList.create;    //edilaine SIG126276

   // ----------------------------------------------------------------------------------------
   //    Contabilização
   // ----------------------------------------------------------------------------------------

   try
     sSQLAnalitica := MontaSQLAnalitica;

     sSQLContab := 'SELECT CON.IDPLANOPREV, CON.PlanoContab, PP.NOME, CON.IDPESSJUR,  ' +#13+
                   '       SUM(DECODE(CON.FLGFORMACAO, 1, CON.SaldoDevIni, 0)) AS FORMASALDO, ' +#13+
                   '       SUM(CON.PROVISIONAR)        AS PROVISAO,       ' +#13+
                   '       SUM(CON.REVERSAOPROV)       AS REVPROVISAO,    ' +#13+
                   '       SUM(CON.SALDOPROVISAOATUAL) AS TOTAL_PROVISAO, ' +#13+
                   '       SUM(CON.PROVBAIXADEF)       AS BAIXA,          ' +#13+
                   '       SUM(CON.REVBAIXADEF)        AS REVBAIXA,       ' +#13+
                   '       SUM(CON.SALDOBAIXA)         AS SALDO_BAIXA,    ' +#13+
                   '       SUM(CON.VLRRECEBIDO)        AS PARCELAS_MES,   ' +#13+
                   '       SUM(CON.SLDREMANESCENTE)    AS SALDO_ATUAL,    ' +#13+
                   '       SUM(NVL(CON.REAJUSTE, 0))   AS REAJUSTE,       ' +#13+
                   '       SUM(DECODE(CON.CTRLOPERACAO, ''SLD'',  (CON.CARGA_PROVISAO-CON.CARGA_REVERSAO), 0)) AS REVFORMASALDO ' +#13+
                   '  FROM ( ' + sSQLAnalitica +' ) CON  '            +#13+
                   '  JOIN PLANPREVCONTABIL PP ON PP.IDPLANOPREV = CON.PLANOCONTAB ' +#13+
                   ' WHERE CON.IDPLANOPREV = :IDPLANOPREV '+#13+
                   ' GROUP BY CON.IDPLANOPREV, CON.PlanoContab, PP.NOME, CON.IDPESSJUR  ' +#13+
                   ' ORDER BY CON.IDPLANOPREV ';

     qryPlanos.close;
     qryPlanos.Open;

     if not qryPlanos.isEmpty then
     begin

       // Inicia uma transação - só se não houver transação iniciada
       if dtmBaseDados.dbBaseDados.InTransaction then
       begin
          MsgDlg('Transação anterior em progresso!', 'Benefício', mtError, [mbOk], 0);
          OperacaoOK := toErro;
          Repaint;
          Exit;
       end;

       StartTransacao;

       try
          InsereHstContabil();
       except
         begin
           s := FormatDateTime('hh:mm:ss', Now) + ' -  ('+
                CompletaString(qryPlanos.FieldByName('NOME').AsString, ' ', 22, true)+')';
           memResult.Lines.Add(s  + ': ERRO ao atualizar histórico contábil');
           RollbackTransacao;
           OperacaoOK := toErro;
            Abort;
         end;
       end;


       while not qryPlanos.eof do
       begin
         iPlanilha := 0;

         iResult := InsereContabil(sSQLContab,
                                   dDataContab,
                                   sResult,
                                   sErro,
                                   iPlanilha,
                                   qryPlanos.FieldByName('IDPLANOPREV').AsString
                                  );

         // ----------------------------------------------------------------------------------------
         s := FormatDateTime('hh:mm:ss', Now) + ' -  ('+
              CompletaString(qryPlanos.FieldByName('NOME').AsString, ' ', 22, true)+')';

         case iResult of
              -6 : memResult.Lines.Add(s  + ': ERRO - período contábil');
              -5 : memResult.Lines.Add(s  + ': ERRO ao efetuar lançamento contábil');
              -4 : memResult.Lines.Add(s  + ': ERRO ao buscar parâmetros para integração');
              -3 : memResult.Lines.Add(s  + ': ERRO ao atualizar itens contabilizados');
              -2 : memResult.Lines.Add(s  + ': Não foram encontrados itens a contabilizar');
              -1 : memResult.Lines.Add(s  + ': ERRO ao selecionar os itens a contabilizar');
              0  : memResult.Lines.Add(s  + ': Contabilização efetuada na planilha ' + IntToStr(iPlanilha));
         end;

         if (iResult <> 0) and (iResult <> -2) then
         begin
            OperacaoOk := toErro;
            RollbackTransacao;
            Abort;
         end
         else
         begin

           if iPlanilha > 0 then
           begin
             try
               qryUpd.Close;
               qryUpd.Sql.Clear;
               qryUpd.Sql.Text :=
                       ' UPDATE HSTDIVIDABENEFICIO  HU '+
                       '    SET HU.PLNCODIGO   = '+IntToStr(iPlanilha) +
                       '  WHERE HU.MESCOBRANCA = '+QuotedStr(sMesCobranca) +
                       '    AND HU.IDPLANOPREV = '+qryPlanos.FieldByName('IDPLANOPREV').AsString +
                       '    AND EXISTS (SELECT 1 ' +
                       '                  FROM ( ' + sSQLAnalitica +' ) CON  ' +
                       '                 WHERE CON.CODDIVIDA = HU.IDCONTROLEDIVIDABENEFICIO )';
               qryUpd.ExecSql;
               qryUpd.Close;
             except
               begin
                 s := FormatDateTime('hh:mm:ss', Now) + ' -  ('+
                      CompletaString(qryPlanos.FieldByName('NOME').AsString, ' ', 22, true)+')';
                 memResult.Lines.Add(s  + ': ERRO ao atualizar código da planilha nas dívidas');
                 OperacaoOk := toErro;
                 RollbackTransacao;
                 Abort;
               end;
             end;

             
             try
//                PreenchePLNCodigoHstContabil(qryPlanos.FieldByName('IDPLANOPREV').AsInteger, iPlanilha);      // SIG 134591
                PreenchePLNCodigoHstContabil(qryPlanos.FieldByName('IDPLANOPREV').AsInteger, iPlanilha, sMesCobranca);  // SIG 134591
             except
               begin
                 s := FormatDateTime('hh:mm:ss', Now) + ' -  ('+
                      CompletaString(qryPlanos.FieldByName('NOME').AsString, ' ', 22, true)+')';
                 memResult.Lines.Add(s  + ': ERRO ao atualizar código da planilha no Histórico Contábil');
                 OperacaoOk := toErro;
                 RollbackTransacao;
                 Abort;
               end;
             end;


             try
               // ajusta saldos
              sSQLSaldo := sSQLAnalitica;
              sSQLSaldo := StringReplace(sSQLSaldo, 'AND H.PLNCODIGO IS NULL', 'AND H.PLNCODIGO IS NOT NULL', []);


               qryUpd.Close;
               //qryUpd.SQL.Text := 'SELECT 1 FROM ( '+ sSQLSaldo +' ) CON '+          //edilaine SIG126276
               qryUpd.SQL.Text := 'SELECT CON.* FROM ( '+ sSQLSaldo +' ) CON '+        //edilaine SIG126276
                                  ' WHERE CON.IDPLANOPREV = '+qryPlanos.FieldByName('IDPLANOPREV').AsString +
                                  '   AND CON.FLGAJUSTASALDO = 1';
               qryUpd.Open;
               if not qryUpd.isEmpty then
               begin
                 //edilaine SIG2626 : inicio
                 while not qryUpd.eof do
                 begin
                   if (qryUpd.FieldByName('FLGSTATUS').AsInteger = 3) and (qryUpd.FieldByName('SALDOBAIXA').AsFloat > 0) and   //edilaine WO8772
                      (qryUpd.FieldByName('SALDODEVATUAL').AsFloat > 0) then                                                   //edilaine WO8772
                      lstMovDivida.Add('CODDIVIDA='+qryUpd.FieldByName('CODDIVIDA').AsString +',OPERACAO=4');

                   qryUpd.next;
                 end;
                 //edilaine SIG2626 : fim

                 sSQLSaldo := 'MERGE INTO CONTROLEDIVIDABENEFICIO CD  '+
                              ' USING (SELECT CON.AJUSTAPROVISAO_SLD, '+
                              '               DECODE(NVL(CON.REVBAIXADEF,0),0, CON.SALDOBAIXA) SALDOBAIXA, '+
                              '               NVL(CON.SldRemanescente,0) AS SALDODEVEDOR, '+
                              '               CON.CODDIVIDA, '+
                              '               CASE           '+
                              '                 WHEN NVL(CON.SldRemanescente,0) = 0 AND NVL(CON.SALDOBAIXA,0) > 0 '+
                              '                 THEN 3             '+
                              '                 ELSE CON.FLGSTATUS '+
                              '               END STATUS '+
                              '         FROM ( '+ sSQLSaldo +' ) CON '+
                              '        WHERE CON.IDPLANOPREV = '+qryPlanos.FieldByName('IDPLANOPREV').AsString +
                              '          AND CON.FLGAJUSTASALDO = 1 ) U '+
                              ' ON (CD.IDCONTROLEDIVIDABENEFICIO = U.CODDIVIDA) '+
                              ' WHEN MATCHED THEN  '+
                              '   UPDATE           '+
                              '      SET CD.SALDOPROVPERDA    = U.AJUSTAPROVISAO_SLD, '+
                              '          CD.SALDOBAIXADEF     = U.SALDOBAIXA,         '+
                              '          CD.SALDODEVEDORATUAL = U.SALDODEVEDOR,       '+
                              '          CD.FLGSTATUS         = U.STATUS              ';

                 qryUpd.Close;
                 qryUpd.SQL.Text := sSQLSaldo;
                 qryUpd.ExecSql;

                 //edilaine SIG126276 : inicio
                 for iContador := 0 to lstMovDivida.count-1 do
                 begin
                   sDivida := copy(lstMovDivida.Strings[iContador], 1, pos(',', lstMovDivida.Strings[iContador]) );
                   sDivida := StringReplace(sDivida, 'CODDIVIDA=', '', []);

                   sTipo   := copy(lstMovDivida.Strings[iContador], pos(',', lstMovDivida.Strings[iContador])+1, length(lstMovDivida.Strings[iContador]) );
                   sTipo   := StringReplace(sTipo, 'OPERACAO=', '', []);

                   CriaLogDivida(sDivida, sTipo );
                 end;
                 //edilaine SIG126276 : fim

               end;

             except
               begin
                 s := FormatDateTime('hh:mm:ss', Now) + ' -  ('+
                      CompletaString(qryPlanos.FieldByName('NOME').AsString, ' ', 22, true)+')';
                 memResult.Lines.Add(s  + ': ERRO ao atualizar saldos das dívidas');
                 RollbackTransacao;
                 OperacaoOK := toErro;
                 Abort;
               end;
             end;
           end;

         end;
         // ----------------------------------------------------------------------------------------
         //    FIM Contabilização
         // ----------------------------------------------------------------------------------------

          qryPlanos.next;
       end;

       OperacaoOK := toSucesso;

       CommitTransacao;
     end
     else
     begin
       s := FormatDateTime('hh:mm:ss', Now);
       memResult.Lines.Add(s + ': Não foram encontrados itens a contabilizar');
       OperacaoOk := toNone;
     end;

   finally
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Final do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));
      sErro.Free;
      lstMovDivida.Free;    //edilaine SIG126276
   end;
end;


function TfrmCtrlDivBenefContab.InsereContabil(const sSQL            : String;
                                               const dDataLanc       : TDateTime;
                                               var   sResult         : TStringList;
                                               var   sErro           : TStringList;
                                               var   iPlanilhaResult : Integer;
                                               const prPlano         : string = ''
                                              ): Integer;
Var
  sDebCre : Char;

  piIdPatro, piIdPlanoPrev : integer;
  pdVlrLanc: Double;
  sCampo   : string;
  sCodCentroCustoC, sCodCentroCustoD, sdtEmissao,
  sUnidNegoc, sSubConta, sSubContaCre : String;
  ContaContabilDebito, ContaContabilCredito : string;
  pTpOperCobranca : string;
  sHIstorico, sHST1, sHST2, sHST3, sHST4, sHST5 : String;
  iPeriodo, iExercicio : integer;
  qryItensContabiliza : TwwQuery;
  qryAux              : TwwQuery;
begin

   Result := 0;

   // cria a query que deve resultar nos itens a serem contabilizados
   qryAux              := TwwQuery.Create(Application);
   qryAux.DatabaseName := 'BaseDados';

   qryItensContabiliza              := TwwQuery.Create(Application);
   qryItensContabiliza.DatabaseName := 'BaseDados';

   try
      // -------------------------------------------------------------------------------------------
      //    1º - seleção dos itens a contabilizar
      // -------------------------------------------------------------------------------------------

      try
         try
            qryItensContabiliza.SQL.Text := sSQL;
            qryItensContabiliza.ParamByName('IDPLANOPREV').AsString := prPlano;
            qryItensContabiliza.Open;

         except
            on E:Exception do
            begin
               sErro.Add(E.Message);
               Result := -1; // ERRO ao abrir
               Exit;
            end;
         end;
      finally
      end;


      // abre a tabela de itens a contabilizar - não havendo, sai...
      if qryItensContabiliza.isEmpty then
      begin
         Result := -2;  // não há itens
         Exit;
      end;

      sUnidNegoc        := '-1';
      sSubConta         := '-1';
      sSubContaCre      := '-1';
      sCodCentroCustoC  := '-1';
      sCodCentroCustoD  := '-1';
      pTpOperCobranca   := '03';

      CtrlPeriodo.RetornaPeriodoExercicioData( Sistema.idEmpresa, DateToStr(dDataLanc) );
      iPeriodo   := CtrlPeriodo.Periodo;
      iExercicio := CtrlPeriodo.Exercicio;


      if (CtrlPeriodo.TestaPeriodoBloqueadoProc(Sistema.idEmpresa, tbBloqueado, iPeriodo, iExercicio, False)) then
      begin
         Result := -6;  // período bloqueado
         sErro.Add(CtrlPeriodo.Messageinfo);
         Exit;
      end;


      while not qryItensContabiliza.eof do
      begin

        //contas
        qryContaItens.Close;
        qryContaItens.ParamByName('IDPLANOPREV').AsString := prPlano;
        qryContaItens.open;

        while not qryContaItens.eof do
        begin                             

           case qryContaItens.FieldByName('ITEM').AsInteger of
             1 : sHIstorico := 'Formação de saldo relativo a dívida de assistidos decorrente de revisão de benefícios';
             2 : sHIstorico := 'Reversão de formação de saldo relativo a dívida de assist. decorrente de revisão de benef.';
             3 : sHIstorico := 'Reversão de saldo relativo a baixa definitiva de dívida de assistidos';
             4 : sHIstorico := 'Reversão de saldo relativo a baixa definitiva por reativação de dívida de assistidos';
             5 : sHIstorico := 'Formação de provisao p/ perda dívida assist. decorrente de revisão de benef. (EXPEC VIDA/SUSP)';
             6 : sHIstorico := 'Reversão provisao perda de dívida de assist. decorrente de revisão de benef. (EXPEC VIDA/SUSP)';
             7 : sHIstorico := 'Atualização monetária dívida de assistidos decorrente de revisão de benefícios';
          end;

          sCampo := qryContaItens.FieldByName('TIPO').AsString;
          FormataLinhasHistorico(sHistorico, sHST1, sHST2, sHST3, sHST4, sHST5);

          { Insere valores }
          Try


            ContaContabilDebito  := qryContaItens.FieldByName('PLACONTAD').AsString;
            ContaContabilCredito := qryContaItens.FieldByName('PLACONTAC').AsString;
            piIdPlanoPrev := qryItensContabiliza.FieldByName('PlanoContab').AsInteger;
            piIdPatro     := qryItensContabiliza.FieldByName('IDPESSJUR').AsInteger;
            pdVlrLanc     := qryItensContabiliza.FieldByName(sCampo).AsFloat;

            //falta contas
            if (pdVlrLanc > 0) and ((ContaContabilDebito  = '') or (ContaContabilCredito = '')) then
            begin
              Result := -4;
              Exit;
            End;

            if pdVlrLanc > 0 then
            begin
              If Not CtrlLancamento.InsereLancaContab ( '2',                                  // LACTIPO
                                                    Sistema.IdEmpresa,                        // IDEMPRESA
                                                    Sistema.IdModulo,                         // IMODULOORIGEM
                                                    Sistema.IdUsuario,                        // IDUSUARIOINCLUSAO
                                                    IntegraBack.Plano,                        // PLANO

                                                    StrToInt(sUnidNegoc),                     // UNIDNEGOC
                                                    StrToInt(sSubConta),                      // LISUBCONTADEB
                                                    StrToInt(sSubContaCre),                   // LISUBCONTACRE
                                                    piIdPlanoPrev,                            // IPLANOPREV

                                                    piIdPatro,                                // IPATRO
                                                    iPlanilhaResult,                          // LIPLNCODIGO
                                                    0,                                        // INUMLAN

                                                    FormatDateTime('dd/mm/yyyy', dDataLanc),  // SDATALANC
                                                    '',                                       // SNUMDOC

                                                    sHST1,                                    // LACHIST1
                                                    sHST2,                                    // LACHIST2
                                                    sHST3,                                    // LACHIST3
                                                    sHST4,                                    // LACHIST4
                                                    sHST5,                                    // LACHIST5

                                                    pTpOperCobranca,                          // STIPOOPER
                                                    sCodCentroCustoD,                         // SCCUSTOD

                                                    ContaContabilDebito,                      // SCONTAD
                                                    sCodCentroCustoC,                         // SCCUSTOC
                                                    ContaContabilCredito,                     // SCONTAC
                                                    '',                                       // SCODHIST
                                                    (pdVlrLanc),                              // RVALLANC
                                                    False,                                    // BJUNTA
                                                    Sistema.UsaPlanoPatro,                    // BUSAPLANOPATRO
                                                    -1,                                       // IIDSEGREGACRITER
                                                    -1                                        // DDATASEGREGACRITER
                                                  ) Then
              Begin
                Result := -5;
                sErro.Add( CtrlLancamento.MessageInfo );
                Exit;
              End;

              iPlanilhaResult := Trunc(CtrlLancamento.RetornoPlnCodigo);

            end;
          Except
             on E:Exception do
             begin
                sErro.Add(E.Message);
                Result := -3; // ERRO ao abrir
                Exit;
             end;
          End;

          qryContaItens.next;
        end;

        qryItensContabiliza.next;
      end;

      //nao achou nada para contabilizar
      if iPlanilhaResult = 0 then
         Result := -2;

   finally
     FreeAndNil(qryItensContabiliza);
     FreeAndNil(qryAux);
   end;

end;


procedure TfrmCtrlDivBenefContab.btnGeraConfereClick(Sender: TObject);
var
  sNomeColunas : TStringList;
  ind : integer;
begin
  inherited;
  if qryAnalitica.isEmpty then
     abort;

  qryExporta.close;
  qryExporta.SQL.Clear;
  if not bPeriodoContabilizado then
     qryExporta.SQL.Text := MontaSQLAnalitica
  else
     qryExporta.SQL.Text := MontaSQLAnaliticaContab; 
  qryExporta.SQL.Add('ORDER BY CC.FLGSTATUS, CC.MATRICULA ');
  qryExporta.Open;

  sNomeColunas := TStringList.create;
  for ind := 0 to grdAnalitica.FieldCount-1 do
    sNomeColunas.Add(grdAnalitica.Columns[ind].FieldName +'='+ grdAnalitica.Columns[ind].DisplayLabel );

  fmQrExportDManual := TfmQrExportDManual.Create(nil);
  try
    with fmQrExportDManual do
    begin
      fmQrExportDManual.bGeraCabecalho := true;
      fmQrExportDManual.sTituloExporta := 'Analítico de Dívidas de Benefícios de Assistidos - '+Copy(RetornaNomeMes(cbbMesCobr.Itemindex+1),1,3)+'/'+Copy(sMesCobranca,1,4);
      fmQrExportDManual.DataSet(qryExporta, -1);
      fmQrExportDManual.lstCamposNaoExportar.commatext := 'AJUSTAPROVISAO_SLD, FLGAJUSTASALDO, OPERACAO, IDPESSJUR, IDPLANOPREV, '+
                                                          'CARGA_PROVISAO, CARGA_REVERSAO, IDPERFILINVEST, PLNCODIGO, NUMPARCELA,'+
                                                          'FLGSTATUS, FLGFORMACAO, FLGQUITADO, FLGACAOJUD, FLGSITUACAO,'+
                                                          'SALDOBAIXA, FONTEPAGADORA';
      fmQrExportDManual.lstNomeColunas.commatext       := sNomeColunas.commatext;
      fmQrExportDManual.ShowModal;
    end;
  finally
    FreeAndNil(fmQrExportDManual);
    FreeAndNil(sNomeColunas);
  end;
end;

procedure TfrmCtrlDivBenefContab.FormataLinhasHistorico(sHistorico : string;
                                                        var Hist1 : string;
                                                        var Hist2 : string;
                                                        var Hist3 : string;
                                                        var Hist4 : string;
                                                        var Hist5 : string);
var
   Hist : Array[1..5] of String;
   iLoop, iFator, ind, iNum : Integer;
   sComp : String;
begin
   Hist[1] := '';
   Hist[2] := '';
   Hist[3] := '';
   Hist[4] := '';
   Hist[5] := '';

   iFator := 0;
   For iLoop := 1 to 5 do
   Begin
     Hist[iLoop] := copy(sHistorico,(iFator+1),40);
     if length(trim(copy(sHistorico,(iFator+1),200))) <= 40 then
        Break;

     iNum := 40;
     for ind := 1 to 40 do
     begin
       if copy(Hist[iLoop],iNum,1) = ' ' then
       Begin
          Hist[iLoop] := copy(sHistorico,(iFator+1),iNum);
          Break;
       end;
       iNum:=(iNum-1);
     end;

     if (iNum = 0) and (Hist[iLoop] <> '') then
       iFator := iFator + 40
     else

     iFator := iFator+iNum;
   end;

   Hist1 := Hist[1];
   Hist2 := Hist[2];
   Hist3 := Hist[3];
   Hist4 := Hist[4];
   Hist5 := Hist[5];
end;


procedure TfrmCtrlDivBenefContab.btnGeraRelClick(Sender: TObject);
var
  sSQLAnalitica,
  sSQLRelat1,
  sSQLRelat2,
  sSQLRelat3 : string;
  bRelatorio : boolean;
begin
  inherited;

  bRelatorio := (bPeriodoContabilizado) or (PagControle.ActivePage = TabSheet1);

  if bPeriodoContabilizado then
     sSQLAnalitica := MontaSQLAnaliticaContab()
  else
     sSQLAnalitica := MontaSQLAnalitica(bRelatorio);

  sSQLRelat1 := 'SELECT CON.PlanoContab, PP.NOME,   ' +#13+
                '       SUM(con.SaldoDevAtual) AS SALDO_ANT,   ' +#13+
                '       SUM(DECODE(CON.FLGFORMACAO, 1, CON.SaldoDevIni, 0)) AS FORMASALDO, ' +#13+
                '       SUM(-CON.VLRRECEBIDO)    AS PARCELAS_MES,  ' +#13+
                '       SUM(-CON.PROVBAIXADEF)   AS BAIXADEF,      ' +#13+
                '       SUM(CON.REVBAIXADEF)     AS REVBAIXADEF,   ' +#13+
                '       sum(NVL(CON.REAJUSTE,0)) AS REAJUSTE,      ' +#13+
                '       SUM(CON.SLDREMANESCENTE) AS SALDO_ATUAL,   ' +#13+
                '       TO_CHAR( ADD_MONTHS(TO_DATE('+QuotedStr(sMESCOBRANCA+'/01')+', ''YYYY/MM/DD''),-1), ''YYYY/MM'') AS MES_ANT ' +#13+
                '  FROM ( ' + sSQLAnalitica +' ) CON  '            +#13+
                '  JOIN PLANPREVCONTABIL PP ON PP.IDPLANOPREV = CON.PLANOCONTAB '      +#13+
                ' GROUP BY CON.PlanoContab, PP.NOME  ' +#13+
                ' ORDER BY CON.PlanoContab ';

  sSQLRelat2 := 'SELECT CON.PlanoContab, PP.NOME,  ' +#13+
                '       SUM(con.SldProvisaoAnt)     AS SALDO_PROV,     ' +#13+
                '       SUM(CON.PROVISIONAR)        AS PROVISAO,       ' +#13+
                '       SUM(-CON.REVERSAOPROV)      AS REVPROVISAO,    ' +#13+
                '       SUM(CON.SALDOPROVISAOATUAL) AS TOTAL_PROVISAO  ' +#13+
                '  FROM ( ' + sSQLAnalitica +' ) CON  '            +#13+
                '  JOIN PLANPREVCONTABIL PP ON PP.IDPLANOPREV = CON.PLANOCONTAB '      +#13+
                ' GROUP BY CON.PlanoContab, PP.NOME  ' +#13+
                ' ORDER BY CON.PlanoContab ';

  sSQLRelat3 := 'SELECT COUNT(CON.CODDIVIDA)     AS QTD,   ' +#13+
                '       SUM(CON.SLDREMANESCENTE) AS SALDO, ' +#13+
                '       CON.SITUACAODIVIDA                 ' +#13+
                '  FROM ( ' + sSQLAnalitica +' ) CON       ' +#13+
                '  JOIN PLANPREVCONTABIL PP ON PP.IDPLANOPREV = CON.PLANOCONTAB '      +#13+
                ' GROUP BY ROLLUP(CON.SITUACAODIVIDA) ' +#13+
                ' ORDER BY 2 ';

  dsSituacao.DataSet := qrySituacao;
  qrySituacao.close;
  qrySituacao.SQL.Text := sSQLRelat3;
  qrySituacao.Open;

  dsGeral.DataSet := qryGeral;
  qryGeral.Filtered := false;
  qryGeral.close;
  qryGeral.SQL.Text := sSQLRelat1;
  qryGeral.Open;

  // verifica se tem baixa definitiva
  qryGeral.Filter   := 'BAIXADEF <> 0 OR REAJUSTE <> 0';
  qryGeral.Filtered := true;
  bTemBaixaReaj     := not qryGeral.eof;
  qryGeral.Filtered := false;

  dsContabiliza.DataSet := qryContab;
  qryContab.close;
  qryContab.SQL.Text := sSQLRelat2;
  qryContab.Open;

  dsPlnCodigo.DataSet := qryPlnCodigo;
  qryPlnCodigo.close;
  qryPlnCodigo.SQL.clear;
  qryPlnCodigo.SQL.Add('SELECT DISTINCT L.IDPLANOPREV, PP.NOME, H.PLNCODIGO,  PL.PLNDATDIA, PL.PLNPLANIL');
  if bPeriodoContabilizado then
     qryPlnCodigo.SQL.Add('  FROM HSTDIVIDABENEFXCONTAB H    ')
  else
     qryPlnCodigo.SQL.Add('  FROM HSTDIVIDABENEFICIO H       ');
  qryPlnCodigo.SQL.Add('  JOIN PLANILHA PL                ');
  qryPlnCodigo.SQL.Add('    ON PL.PLNCODIGO = H.PLNCODIGO ');
  qryPlnCodigo.SQL.Add('  JOIN LANCAMENTO L               ');
  qryPlnCodigo.SQL.Add('    ON L.PLNCODIGO = PL.PLNCODIGO ');
//  qryPlnCodigo.SQL.Add('   AND L.LACNUMLAN = 1            ');      WO27589 Ferrari
  qryPlnCodigo.SQL.Add('  JOIN PLANPREVCONTABIL PP ON PP.IDPLANOPREV= L.IDPLANOPREV ');
  qryPlnCodigo.SQL.Add(' WHERE H.MESCOBRANCA = '+QuotedStr(sMesCobranca) );
  qryPlnCodigo.SQL.Add('   AND H.PLNCODIGO IS NOT NULL ');
  qryPlnCodigo.SQL.Add(' ORDER BY 1                    ');
  qryPlnCodigo.Open;


  TFrmPreviewExport.CreateModalPreviewExp(Application, rpContabiliza,'CONTROLE DE DÍVIDAS DE BENEFÍCIOS', qryContab);

end;

procedure TfrmCtrlDivBenefContab.DesfazContabiliza;
var
  sSQLAnalitica : string;
  sSQLSaldo     : string;
  sSQLDesfaz, s : string;
  iPlnCodigo    : integer;
  lstPlanilha   : TStringList;
  dDataIni      : TDatetime;
begin
  inherited;

  // limpa e inicializa o memo de resultado
  memResult.Clear;

  dDataIni := Now;

  memResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDataIni));
  memResult.Lines.Add(' ');

  memResult.Lines.Add('Buscar Contabilização de Dívidas de Benefício: '+sMesCobranca);
  memResult.Lines.Add(' ');


  lstPlanilha   := TStringList.create;
  sSQLAnalitica := MontaSQLAnalitica();

  sSQLSaldo := sSQLAnalitica;
//  sSQLSaldo := StringReplace(sSQLSaldo, 'AND H.PLNCODIGO IS NULL', 'AND H.PLNCODIGO IS NOT NULL', []);

  try
    sSQLDesfaz := 'SELECT CON.IDPLANOPREV, CON.PlanoContab, PP.NOME, CON.PLNCODIGO  '    +#13+
                  '  FROM ( ' + sSQLAnalitica +' ) CON  '                                +#13+
                  '  JOIN PLANPREVCONTABIL PP ON PP.IDPLANOPREV = CON.PLANOCONTAB '      +#13+
                  ' GROUP BY CON.IDPLANOPREV, CON.PlanoContab, PP.NOME, CON.PLNCODIGO  ' +#13+
                  ' ORDER BY CON.IDPLANOPREV ';
    qryDesfaz.close;
    qryDesfaz.SQL.text := sSQLDesfaz;
    qryDesfaz.Open;
    if qryDesfaz.isEmpty then
    begin
      memResult.Lines.Add('Não foram encontradas dívidas contabilizadas no mês selecionado');
      memResult.Lines.Add(' ');
      exit;
    end;


    if MsgDlg('Confirma o processo de desfazer a contabilização no mês selecionado?',
              'Benefício', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
       exit;

    try
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         MsgDlg('Transação anterior em progresso!', 'Benefício', mtError, [mbOk], 0);
         Repaint;
         Exit;
      end;

      StartTransacao;

      while not qryDesfaz.eof do
      begin
        s := FormatDateTime('hh:mm:ss', Now) + ' -  ('+
             CompletaString(qryDesfaz.FieldByName('NOME').AsString, ' ', 22, true)+')';

        memResult.Lines.Add(s + ': Desfazendo planilha: '+qryDesfaz.FieldByName('PLNCODIGO').AsString);

        if lstPlanilha.IndexOf( qryDesfaz.FieldByName('PLNCODIGO').AsString ) = -1 then
        begin
          lstPlanilha.Add( qryDesfaz.FieldByName('PLNCODIGO').AsString );

          //atualiza saldos controle de dívidas
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Text := 'SELECT CON.*,                 '+
                            '       (SELECT HC.FLGSTATUS   '+
                            '          FROM HSTDIVIDABENEFXCONTAB HC    '+
                            '         WHERE HC.CODDIVIDA = CON.CODDIVIDA '+
                            '           AND HC.MESCOBRANCA = '+QuotedStr(sMesCobranca) +
                            '       ) AS STATUSANT '+
                            ' FROM ( '+ sSQLSaldo +' ) CON '+
                            ' WHERE CON.IDPLANOPREV = '+qryDesfaz.FieldByName('IDPLANOPREV').AsString +
                            '   AND CON.FLGAJUSTASALDO = 1';
          qryAux.Open;
          while not qryAux.eof do
          //if not qryAux.isEmpty then
          begin
            //edilaine SIG126276 : inicio
            qrySaldoDiv.Close;
            qrySaldoDiv.ParamByName('CODDIVIDA').AsInteger := qryAux.FieldByName('CODDIVIDA').AsInteger;
            qrySaldoDiv.Open;
            //edilaine SIG126276 : fim

            qryUpd.close;
            qryUpd.SQL.clear;
            qryUpd.SQL.Add('UPDATE CONTROLEDIVIDABENEFICIO CD ');
            qryUpd.SQL.Add('      SET CD.SALDOPROVPERDA    = '+OraNumero(qryAux.FieldByName('AJUSTAPROVISAO_SLD').AsString) +', ' );
            qryUpd.SQL.Add('          CD.SALDOBAIXADEF     = '+OraNumero(qryAux.FieldByName('SALDOBAIXA').AsString)         +', ' );
            qryUpd.SQL.Add('          CD.SALDODEVEDORATUAL = '+OraNumero(qryAux.FieldByName('SLDREMANESCENTE').AsString)    +', ' );
            qryUpd.SQL.Add('          CD.FLGSTATUS         = '+qryAux.FieldByName('STATUSANT').AsString      );
            qryUpd.SQL.Add(' WHERE CD.IDCONTROLEDIVIDABENEFICIO = '+qryAux.FieldByName('CODDIVIDA').AsString );
            qryUpd.ExecSql;

            //edilaine SIG126276 : inicio
            {insere movimento}
            if (qryAux.FieldByName('FLGSTATUS').AsString = '3') and (qryAux.FieldByName('STATUSANT').AsString = '1') and
               (qrySaldoDiv.FieldByName('SALDOBAIXADEF').AsFloat <> qryAux.FieldByName('SALDOBAIXA').AsFloat) then
            begin
              {desfaz baixa definitiva}
              CriaLogDivida(qryAux.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, '12' );
            end;
            //edilaine SIG126276 : fim

            qryAux.next;
          end;

          //atualiza plncodigo das dividas
          qryUpd.Close;
          qryUpd.Sql.Clear;
          qryUpd.Sql.Text :=
                  ' UPDATE HSTDIVIDABENEFICIO  HU '+
                  '    SET HU.PLNCODIGO   = null  '+
                  '  WHERE HU.MESCOBRANCA = '+QuotedStr(sMesCobranca) +
                  '    AND HU.PLNCODIGO   = '+qryDesfaz.FieldByName('PLNCODIGO').AsString;
          qryUpd.ExecSql;
          qryUpd.Close;

          ApagaHstContabil(qryDesfaz.FieldByName('IDPLANOPREV').AsInteger);

          iPlnCodigo := qryDesfaz.FieldByName('PLNCODIGO').AsInteger;

          if not CtrlLancamento.ExcluiLancaContab( Sistema.IdUsuario,                      // iUsuario
                                                   iPlnCodigo,                             // iPlnCodigo
                                                   Sistema.IdModulo,                       // iModuloOrigem
                                                   0,                                      // iNumLan
                                                   Sistema.UsaPlanoPatro,                  // bUsaPlanoPatro
                                                   True                                    // bExcluiPlanilha
                                                  )
          then begin
            OperacaoOK := toErro;
            RollbackTransacao;
            MsgDlg('Ocorreu um erro ao desfazer as dívidas contabilizadas no mês selecionado!',
                   'Benefício', mtInformation, [mbOK], 0);
            Exit;
          end;

        end
        else
          ApagaHstContabil(qryDesfaz.FieldByName('IDPLANOPREV').AsInteger);

        qryDesfaz.next;
      end;

      CommitTransacao;

      bPeriodoContabilizado := false;
      
      OperacaoOK := toSucesso;

      MsgDlg('Processo desfeito com sucesso!', 'Benefício', mtInformation, [mbOK], 0);

    Except
      begin
        OperacaoOK := toErro;
        RollbackTransacao;
        MsgDlg('Ocorreu um erro ao desfazer as dívidas contabilizadas no mês selecionado!',
               'Benefício', mtInformation, [mbOK], 0);
      end;
    End;

  finally
    memResult.Lines.Add(' ');
    memResult.Lines.Add('Final do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    memResult.Lines.Add(' ');
    memResult.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));

    btnContinuar.enabled := false;

    FreeAndNil(lstPlanilha);

    qrySaldoDiv.close;        //edilaine SIG126276
    qryAux.close;             //edilaine SIG126276
  end;
end;


procedure TfrmCtrlDivBenefContab.btnVoltarClick(Sender: TObject);
begin

  case pagControle.ActivePageIndex of

    1:
       begin
         inherited;
         TelaInicial();
       end;
   end;

   btnVoltar.visible  := pagControle.ActivePageIndex = 1;
   btnGeraRel.visible := pagControle.ActivePageIndex = 0;
end;

procedure TfrmCtrlDivBenefContab.rpContabilizaBeforePrint(Sender: TObject);
begin
  inherited;
  lbl_mescobranca.caption := 'Período '+RetornaNomeMes(cbbMesCobr.Itemindex+1)+'/'+Copy(sMesCobranca,1,4);

  ppSubGeral.Visible      := not bTemBaixaReaj;
  ppSubGeralBaixa.Visible := bTemBaixaReaj;

  if (PagControle.ActivePage = TabSheet1) or (bPeriodoContabilizado) then
    ppSubPlnCodigo.visible  := true
  else
    ppSubPlnCodigo.visible  := false;


  if bTemBaixaReaj then
     ppSubProvisao.ShiftRelativeTo := ppSubGeralBaixa
  else
     ppSubProvisao.ShiftRelativeTo := ppSubGeral;
end;

procedure TfrmCtrlDivBenefContab.ppdbSituacaoPrint(Sender: TObject);
begin
  inherited;
  if ppdbSituacao.caption = '' then
     ppdbSituacao.caption := 'TOTAL';
end;


procedure TfrmCtrlDivBenefContab.qryAnaliticaAfterOpen(DataSet: TDataSet);
var
  ind : integer;
begin
  inherited;
  for ind := 0 to qryAnalitica.Fields.count-1 do
    if (qryAnalitica.Fields[ind].DataType = ftFloat) and
       (pos(LowerCase(qryAnalitica.Fields[ind].FieldName), 'coddivida|planocontab|qtdepagas|qtdeparcelas') = 0) then
    begin
      TNumericField(qryAnalitica.Fields[ind]).DisplayFormat := '#,##0.00';
    end;
end;

procedure TfrmCtrlDivBenefContab.pplblGeralSLDGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := Text + ' ' +qryGeral.FieldByName('MES_ANT').AsString;
end;

procedure TfrmCtrlDivBenefContab.pplblContabPPGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := Text + ' '+qryGeral.FieldByName('MES_ANT').AsString;
end;

procedure TfrmCtrlDivBenefContab.pplblGeralSRGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := Text + ' '+Copy(RetornaNomeMes(cbbMesCobr.Itemindex+1),1,3)+'/'+Copy(sMesCobranca,1,4);
end;

procedure TfrmCtrlDivBenefContab.pplblBaixaSRGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := Text + ' '+Copy(RetornaNomeMes(cbbMesCobr.Itemindex+1),1,3)+'/'+Copy(sMesCobranca,1,4);
end;

procedure TfrmCtrlDivBenefContab.pplblSitTitGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := Text + ' '+RetornaNomeMes(cbbMesCobr.Itemindex+1)+'/'+Copy(sMesCobranca,1,4);
end;

procedure TfrmCtrlDivBenefContab.pplblContabAPGetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := Text + ' '+Copy(RetornaNomeMes(cbbMesCobr.Itemindex+1),1,3)+'/'+Copy(sMesCobranca,1,4);
end;

procedure TfrmCtrlDivBenefContab.InsereHstContabil;
var
  _query : TwwQuery;
  sSQL   : string;
begin
  _query := TwwQuery.create(nil);
  _query.DataBaseName := 'BaseDados';

  sSQL := MontaSQLAnalitica();

  try
    _query.close;
    _query.sql.Clear;
    _query.SQL.Add('insert into HSTDIVIDABENEFXCONTAB (');
    _query.SQL.Add('       CODDIVIDA,        ');
    _query.SQL.Add('       MESCOBRANCA,      ');
    _query.SQL.Add('       PLNCODIGO,        ');
    _query.SQL.Add('       FLGSTATUS,        ');
    _query.SQL.Add('       FLGACAOJUD,       ');
    _query.SQL.Add('       FLGQUITADO,       ');
    _query.SQL.Add('       IDPLANOPREV,      ');
    _query.SQL.Add('       IDPLANPREVCONTAB, ');
    _query.SQL.Add('       DTLANCDIVIDA,     ');
    _query.SQL.Add('       VLRBENEF,         ');
    _query.SQL.Add('       SALDODEVINI,      ');
    _query.SQL.Add('       SALDODEVATUAL,    ');
    _query.SQL.Add('       ULTPARCELA,       ');
    _query.SQL.Add('       VLRPARCELA,       ');
    _query.SQL.Add('       FLGSITUACAO,      ');
    _query.SQL.Add('       INICOBRANCA,      ');
    _query.SQL.Add('       FIMCOBRANCA,      ');
    _query.SQL.Add('       PERCENTUAL,       ');
    _query.SQL.Add('       QTDEPAGAS,        ');
    _query.SQL.Add('       QTDEPARCELAS,     ');
    _query.SQL.Add('       VLRRECEBIDO,      ');
    _query.SQL.Add('       SLDREMANESCENTE,  ');
    _query.SQL.Add('       MOTIVO,           ');
    _query.SQL.Add('       OBSERVACAO,       ');
    _query.SQL.Add('       SLDPROVISAOANT,   ');
    _query.SQL.Add('       REVPROVISAO,      ');
    _query.SQL.Add('       PROVISIONAR,      ');
    _query.SQL.Add('       SALDOPROVISAO,    ');
    _query.SQL.Add('       REVBAIXADEF,      ');
    _query.SQL.Add('       PROVBAIXADEF,     ');
    _query.SQL.Add('       SALDOBAIXA,       ');
    _query.SQL.Add('       REAJUSTE,         ');
    _query.SQL.Add('       FLGFORMACAO       ');
    _query.SQL.Add('  ) ');
    _query.SQL.Add('SELECT                   ');
    _query.SQL.Add('       I.CODDIVIDA,      ');
    _query.SQL.Add('       '+QuotedStr(sMESCOBRANCA)+', ');
    _query.SQL.Add('       I.PLNCODIGO,      ');
    _query.SQL.Add('       I.FLGSTATUS,      ');
    _query.SQL.Add('       I.FLGACAOJUD,     ');
    _query.SQL.Add('       I.FLGQUITADO,     ');
    _query.SQL.Add('       I.IDPLANOPREV,    ');
    _query.SQL.Add('       I.PLANOCONTAB,    ');
    _query.SQL.Add('       I.DTLANCDIVIDA,   ');
    _query.SQL.Add('       I.VLRBENEF,       ');
    _query.SQL.Add('       I.SALDODEVINI,    ');
    _query.SQL.Add('       I.SALDODEVATUAL,  ');
    _query.SQL.Add('       I.ULTPARCELA,     ');
    _query.SQL.Add('       I.VLRPARCELA,     ');
    _query.SQL.Add('       I.FLGSITUACAO,    ');
    _query.SQL.Add('       I.INICOBRANCA,    ');
    _query.SQL.Add('       I.FIMCOBRANCA,    ');
    _query.SQL.Add('       I.PERCENTUAL,     ');
    _query.SQL.Add('       I.QTDEPAGAS,      ');
    _query.SQL.Add('       I.QTDEPARCELAS,   ');
    _query.SQL.Add('       I.VLRRECEBIDO,    ');
    _query.SQL.Add('       I.SLDREMANESCENTE,');
    _query.SQL.Add('       I.MOTIVO,         ');
    _query.SQL.Add('       I.OBSERVACAO,     ');
    _query.SQL.Add('       I.SLDPROVISAOANT, ');
    _query.SQL.Add('       I.REVERSAOPROV,   ');
    _query.SQL.Add('       I.PROVISIONAR,    ');
    _query.SQL.Add('       I.SALDOPROVISAOATUAL, ');
    _query.SQL.Add('       I.REVBAIXADEF,        ');
    _query.SQL.Add('       I.PROVBAIXADEF,       ');
    _query.SQL.Add('       I.SALDOBAIXA,         ');
    _query.SQL.Add('       I.REAJUSTE,           ');
    _query.SQL.Add('       I.FLGFORMACAO         ');
    _query.SQL.Add('  FROM ('+sSQL +') I         ');
    _query.SQL.Add('  JOIN PLANPREVCONTABIL PP ON PP.IDPLANOPREV = I.PLANOCONTAB ');
   // _query.SQL.Add(' WHERE I.IDPLANOPREV = '+IntToStr(iIdPlanoprev) );

    try
      _query.ExecSql;
    except
      raise;
    end;

  finally
    FreeAndNil(_query);
  end;
end;



procedure TfrmCtrlDivBenefContab.ApagaHstContabil(piIdPlanoPrev : integer);
var
  _query : TwwQuery;
begin
  _query := TwwQuery.create(nil);
  _query.DataBaseName := 'BaseDados';

  try
    _query.close;
    _query.sql.Clear;
    _query.sql.Add('DELETE FROM HSTDIVIDABENEFXCONTAB ');
    _query.sql.Add(' WHERE MESCOBRANCA = '+QuotedStr(sMESCOBRANCA) );
    _query.sql.Add('   AND IDPLANOPREV = '+IntToStr(piIdPlanoPrev) );
    _query.ExecSql;

  finally
    FreeAndNil(_query);
  end;
end;


procedure TfrmCtrlDivBenefContab.btnProcessarClick(Sender: TObject);
var
   iBloqContabil : integer;
begin
  inherited;

  sMesCobranca := inttostr(seAnoCobr.Value)+'/'+formatfloat('00',(cbbMesCobr.Itemindex+1));

  iBloqContabil := VerificaPeridoBloqueado(sMesCobranca, grpMESCOB, false);

  bPeriodoContabilizado := (iBloqContabil = 1);

  btnContabOK.enabled := bPeriodoContabilizado;
  chkDesfaz.enabled   := bPeriodoContabilizado;

  if (iBloqContabil <= 1) then
  begin
    AbreDividasAContabilizar(true, bPeriodoContabilizado );
  end
  else
  begin
    AbreDividasAContabilizar(false, bPeriodoContabilizado );
  end;
end;


procedure TfrmCtrlDivBenefContab.TelaInicial;
begin
  if (OperacaoOk <> toErro) then
  begin
    seAnoCobr.Value      := strtoint(FormatDateTime('YYYY',now));
    cbbMesCobr.ItemIndex := strtoint(FormatDateTime('MM',now))-1;

    chkDesfaz.checked   := false;
    chkDesfaz.enabled   := false;
    btnContabOK.enabled := false;

    AbreDividasAContabilizar(false, bPeriodoContabilizado );
  end;
end;

procedure TfrmCtrlDivBenefContab.PreenchePLNCodigoHstContabil(piIdPlanoprev, piPLNCodigo : integer; piMesCobranca : string);
var
  _query : TwwQuery;
  sSQL   : string;
begin
  _query := TwwQuery.create(nil);
  _query.DataBaseName := 'BaseDados';

  try
    _query.SQL.Add('UPDATE HSTDIVIDABENEFXCONTAB' );
    _query.SQL.Add('   SET PLNCODIGO   = '+IntToStr(piPLNCodigo) );
    _query.SQL.Add(' WHERE IDPLANOPREV = '+IntToStr(piIdPlanoprev) );
    _query.SQL.Add(' AND   MESCOBRANCA = '+ QuotedStr(piMesCobranca) );    // SIG 134591
    try
      _query.ExecSql;
    except
      raise;
    end;

  finally
    FreeAndNil(_query);
  end;
end;


end.

