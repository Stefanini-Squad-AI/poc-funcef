unit FExecGeraDocConvenio;

interface

// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotina     : GeraArquivoPagamentoleiauteCNAB240
//Data       : 14/08/2020
//SIG        : 101599
//Autor      : Andre Imakawa / Cássio Florencio Rovaroto
//Descrição  : Alteração do SIG 101587 foi feita no trecho errado.
//***************************************************************************************
//Rotina     : GeraArquivoPagamentoleiauteCNAB240
//Data       : 11/08/2020
//SIG        : 101587
//Autor      : Andre Imakawa / Cássio Florencio Rovaroto
//Descrição  : Corigir a conta corrente da entidade.
//***************************************************************************************
//Rotina             : FormShow
//N. SIG..........   : 60540
//Data da Alteração: :
//Alteração Form:    : FExecGeraDocConvenio
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : A partir da introdução do arquivo eletrônico "SIACC 240" não
//                     haverá mais a geração do arquivo pela funcionalidade.
//--------------------------------------------------------------------------------------------------
// DFM        :
// SIG        : 94275
// Data       : 13/11/2019
// Rotina     : ListaRegistros
// Descricao  : Sistema não está levando as rubricas de desconto para geração do arquivo de pagamento
//              Feito group by no objeto cdsListaArquivo.
//--------------------------------------------------------------------------------------------------
//Rotina      : (.dfm cdsListaArquivo, qryBuscaTerc, qryRateioPerc), MontaConsultaBuscaRateio
//              ListaRegistros, CalculaTaxa
//Pendência   : SIG 21438
//Responsável : Edilaine
//Data        : 12/06/2017
//Descrição   : pagamentos a terceiros
//--------------------------------------------------------------------------------------------------
// DFM        : sqlRateioSemArquivo e sqlRateio
// SIG        : 67667
// Data       : 09/05/2018
// Rotina     : CalculaTaxa e ListaRateioSemDocumento
// Descricao  : Buscar o IdPlanoContabil da PerfilInvest e não mais da HISTRUBSAL
//------------------------------------------------------------------------------
// Data       : 21/05/2014
// Rotina     : FormShow
// Pendência  : SOL 230501 PPM 389460
// Descricao  : não é possível acessar a versão sem que altere o e depois retorne.
//--------------------------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
{*******************************************************************************
Data      : 19/02/2008
Rotina    : GeraDocumentoSemArquivo
Pendência : 27424
Descricao : Revertendo um FormatFloat para FloatToStr, pois o StrToFloat gerava erro e para um
            número
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Data      : 18/01/2008
Rotina    : btnConfirmarClick e VerificaPlanoPatro
Pendência : 27078
Descricao : Nova verificação das combinações de plano e patrocinadora antes do disparo da integração
            com CaP
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Data      : 08/01/2008
Rotina    : GravaProcessoConvenio(...), FiltraRelatorio
Pendência : 27078
Descricao : - Criação e gravação de novo campo IDFAVRATEIO, para corrigir a questão da integridade
              referencial com a tabela PROCCONVENIODOC
            - Gravação do campo IDFAVORECIDO conforme consta na PROCCONVENIODOC (integridade)
            - Alteração da qurey do relatório (join apenas) para buscar o favorecido indicado pelo
              campo IDFAVRATEIO
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Data      : 16/10/2007
Rotina    : - (qryInsertProcConvRateio)
Pendência : 20840 (reabertura)
Descricao : - Retirada do campo IDLAYOUT da gravação da ProcConvRateio
            - Detalhamento das mensagens de erro para algumas situações
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Data      : 18/12/2006 a 08/01/2007
Rotina    : -
Pendência : 20840
Descricao : Criação de novo form para geração de documentos para repasse de convênios
---------------------------------------------------------------------------------------------------}



uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  Mask, wwdbedit, Wwdbspin, CheckLst, mVersaoPagto, Grids, Wwdbigrd,
  Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, Db,
  DBClient, Wwdatsrc, DBTables, Wwquery,
  uCtrlIntBanco, uDocumento, uCtrlDocumento, ppDB, ppDBPipe, ppDBBDE,
  ppBands, ppClass, ppCtrls, ppVar, ppRichTx, ppPrnabl, ppStrtch, ppMemo,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, uCMClientDataSet, fcCombo,
  fcColorCombo, fPreview,
  fFrameProgresso;


type
  TContaBaixa = Record
    sConta      : String;
    fValor      : Currency;
    iUnidNegoc  : Integer;
    iPatro      : Integer;
    iPlanoPrev  : Integer;
  end;

  TConvRateio = Record
    IDPatro           : Integer;
    IDPlanPrevContab  : Integer;
    IDFavorecido      : Integer;
    IDLayout          : Integer;
    sTipoRecebDesemb  : String;
    fValorRateio      : Currency;
  end;

  TfrmExecGeraDocConvenio = class(TfrmWizardMT)
    cboMes: TComboBox;
    Label15: TLabel;
    DBspnAno: TwwDBSpinEdit;
    Panel3: TPanel;
    molVersaoPagto: TmolVersaoPagto;
    edtPrevisaoPagto: TCMDateTimePicker;
    Label1: TLabel;
    dtsListaArquivo: TwwDataSource;
    cdsListaArquivo: TClientDataSet;
    sqlListaArquivo: TCMSqlParams;
    sqlRateio: TCMSqlParams;
    cdsRateio: TClientDataSet;
    Panel4: TPanel;
    chkGravaArquivo: TCheckBox;
    chkGeraDocSemArquivo: TCheckBox;
    PageControl1: TPageControl;
    tbsArquivo: TTabSheet;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    dbgDocSemArq: TwwDBGrid;
    DBgrdArquivo: TwwDBGrid;
    Panel1: TPanel;
    lblRateio: TLabel;
    lblLinhasTotal: TLabel;
    lblDesconto2: TLabel;
    lblLinhasRateio: TLabel;
    Panel2: TPanel;
    Label4: TLabel;
    lblTotalArquivo: TLabel;
    lblDesconto: TLabel;
    lblLiquido: TLabel;
    sqlRateioSemArquivo: TCMSqlParams;
    cdsRateioSemArquivo: TClientDataSet;
    dtsRateioSemArquivo: TwwDataSource;
    Panel5: TPanel;
    lblTotalSemArquivo: TLabel;
    Panel6: TPanel;
    cdsRateioSemArquivoIDPLANOCONTABIL: TFloatField;
    cdsRateioSemArquivoIDPATRO: TFloatField;
    cdsRateioSemArquivoIDFAVORECIDO: TFloatField;
    cdsRateioSemArquivoNOME: TStringField;
    cdsRateioSemArquivoCODTIPRECDESFAV: TStringField;
    cdsRateioSemArquivoPLACONTA: TStringField;
    cdsRateioSemArquivoUNIDNEGOC: TFloatField;
    cdsRateioSemArquivoCODCENTRORESPON: TStringField;
    cdsRateioSemArquivoCODPORTFORMA: TFloatField;
    cdsRateioSemArquivoVALOR: TFloatField;
    qryPortadorForma: TwwQuery;
    chkGeraDocComArquivo: TCheckBox;
    qryAux: TwwQuery;
    cdsListaArquivoCONTALIQUIDO: TStringField;
    cdsListaArquivoIDPESSOA: TFloatField;
    cdsListaArquivoNOME: TStringField;
    cdsListaArquivoRAZAOSOCIAL: TStringField;
    cdsListaArquivoNUMDOCUMENTO: TStringField;
    cdsListaArquivoCONTACORRENTE: TStringField;
    cdsListaArquivoNUMAGENCIA: TStringField;
    cdsListaArquivoCODBANCOFAVORECIDO: TStringField;
    cdsListaArquivoLOGRADOURO: TStringField;
    cdsListaArquivoNUMERO: TStringField;
    cdsListaArquivoCOMPLEMENTO: TStringField;
    cdsListaArquivoBAIRRO: TStringField;
    cdsListaArquivoCIDADE: TStringField;
    cdsListaArquivoCODESTADO: TStringField;
    cdsListaArquivoCEP: TStringField;
    cdsListaArquivoIDFORCLI: TFloatField;
    cdsListaArquivoCODDOCUMENTO: TFloatField;
    cdsListaArquivoVALOR: TFloatField;
    cdsListaArquivoVALORDESCONTO: TFloatField;
    cdsListaArquivoVALORJUROS: TFloatField;
    cdsListaArquivoDATAVENCTO: TStringField;
    cdsListaArquivoDATAPROGRAMADA: TStringField;
    cdsListaArquivoTIPOMOEDA: TFloatField;
    cdsListaArquivoNUMLOTE: TFloatField;
    cdsListaArquivoCODPORTFORMA: TFloatField;
    cdsListaArquivoCODPORTADOR: TFloatField;
    cdsListaArquivoCODFORMAPAGTO: TFloatField;
    cdsListaArquivoCODTIPOPAGTO: TFloatField;
    cdsListaArquivoFLGEMITEAVISO: TStringField;
    cdsListaArquivoCODARQUIVOREMESSA: TFloatField;
    cdsListaArquivoIDBANCO: TFloatField;
    cdsListaArquivoNOCONTACORR: TStringField;
    cdsListaArquivoCODBARRA: TStringField;
    cdsListaArquivoCODBARRAVALOR: TStringField;
    cdsListaArquivoNODOCUMENTO: TStringField;
    cdsListaArquivoCOMPLDOCUMENTO: TStringField;
    cdsListaArquivoTIPO: TStringField;
    cdsListaArquivoNUMEMPRESABANCO: TStringField;
    cdsListaArquivoDEBCRE: TStringField;
    cdsListaArquivoTIPOCONTA: TStringField;
    cdsListaArquivoNOMEAGENCIA: TStringField;
    cdsListaArquivoLIVRE: TStringField;
    cdsListaArquivoLINHAS: TFloatField;
    qryInsertProcConvenioDoc: TwwQuery;
    qryInsertProcConvRateio: TwwQuery;
    qryInsertConvDocXVersao: TwwQuery;
    btnRelatorio: TBitBtn;
    rdgRelatorio: TRadioGroup;
    sqlRelatorio: TCMSqlParams;
    cdsRelatorio: TCMClientDataSet;
    rptAnalitico: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel37: TppLabel;
    rptProvPerdaSint_memPatro: TppRichText;
    ppDetailBand1: TppDetailBand;
    ppShape11: TppShape;
    ppLine9: TppLine;
    ppDBText34: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine11: TppLine;
    ppShape13: TppShape;
    ppDBCalc40: TppDBCalc;
    ppLabel18: TppLabel;
    ppShape18: TppShape;
    pplAnalitico: TppBDEPipeline;
    dtsRelatorio: TwwDataSource;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText2: TppDBText;
    GroupBox1: TGroupBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    pplSintetico: TppBDEPipeline;
    rptSintetico: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppRichText1: TppRichText;
    ppShape1: TppShape;
    ppLabel12: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppLine2: TppLine;
    ppShape2: TppShape;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine3: TppLine;
    ppLabel17: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppLine4: TppLine;
    ppShape3: TppShape;
    ppDBCalc1: TppDBCalc;
    ppLabel19: TppLabel;
    sqlPlanPatro: TCMSqlParams;
    cdsPlanPatro: TCMClientDataSet;
    cdsPlanPatroIDPLANOPREV: TFloatField;
    cdsPlanPatroIDPATRO: TFloatField;
    cdsListaArquivoPAGTOTERC: TFloatField;             //edilaine - SIG21438
    cdsListaArquivoIDFAVORECIDOPAI: TFloatField;
    qryBuscaTerc: TwwQuery;
    cdsListaArquivoIDCBANCARIA: TFloatField;
    cdsListaArquivoIDRUBRICA: TFloatField;
    qryRateioPerc: TwwQuery;
    cdsListaArquivoVLRORIGEM: TFloatField;       //edilaine - SIG21438

    procedure cboMesExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure ppShape11Print(Sender: TObject);
    procedure ppLine9Print(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private // Private declarations

    CorAtual : TColor;

    Documento         : TDocumento;
    CtrlDocumento     : TCtrlDocumento;
    CtrlIntBanco      : TCtrlIntBanco;

    fVlrRateioSemDoc  : Currency;
    fVlrRateioComDoc  : Currency;
    fTotalDesconto    : Currency;

    bExisteComArq     : Boolean;

    iIdArquivoPagto, iCodDocArq, iIdDocPessoa: Integer;//Andre Imakawa - SIG 60540

    procedure PreencheVersoes;
    procedure CalculaTaxa;
    procedure ListaRegistros(const pdDataPagto: TDateTime);

    function  VerificaPreenchimentoFiltro : Boolean;
    function  VerificaPreenchimentoRelat  : Boolean;
    function  VerificaPlanoPatro          : Boolean;

    function  TotalizaRepasse: Currency;
    procedure ListaRateioSemDocumento;

    function  GeraDocumentoComArquivo(var pCodDocumento: Integer) : Boolean;
    function  GeraDocumentoSemArquivo : Boolean;

    function  GeraArquivo(pCodDocumento: Integer): Boolean;
    procedure MsgErro(sMsg: String);

    function  ExisteDocArq    : Boolean;
    function  DocumentoUnico  : Boolean;

    function  GravaProcessoConvenio(const iCodDocumento  : Integer;
                                          vConvRateio    : array of TConvRateio
                                   ): Boolean;

    procedure MontaConsulta;
    procedure FiltraRelatorio;

    //edilaine - SIG21438 - inicio
    procedure MontaConsultaBuscaRateio(sSQLRateio : string);
    //edilaine - SIG21438 - fim

    // Andre Imakawa - SIG 60540 - Inicio
    Function GeraArquivoPagamentoleiauteCNAB240(pCodDocumento: Integer): Boolean;
    function SetRegistrosArquivoPagamento( pCodPortForma: Integer; pValorTotal: Double): Boolean;
    function SetFavorecidoArqPagamento(pNome, pDocumento,   pBanco, pAgencia, pConta, pTipoConta,
                                       pOperacao: string; pValor: double;
                                       pCodDocumento, pIdForCli: Integer): Boolean;
    function SetDocumentoArqPagamento(pCodDocumento, pCodForma: Integer; pValor: Double): Boolean;
    function SetStatusDocArquivoPagamento(pCodDocumento: Integer): Boolean;


    // Andre Imakawa - SIG 60540 - Fim

  public  // Public declarations


  end;



var
  frmExecGeraDocConvenio: TfrmExecGeraDocConvenio;



implementation
{$R *.DFM}
uses
  dBaseDados, uDataBase, uSistema, uDiasUteis, uVerificaPreenchimento, uMensErro, uAdmPrevFB,
  UFuncoesUteisFB,    //edilaine - SIG21438
  uFuncoesFolha, uIntegraBack, uObjFolha, fAguarde;



procedure TfrmExecGeraDocConvenio.cboMesExit(Sender: TObject);
begin
  inherited;
  PreencheVersoes;
end;



procedure TfrmExecGeraDocConvenio.PreencheVersoes;
begin
  molVersaoPagto.Mes        := cboMes.ItemIndex + 1;
  molVersaoPagto.Ano        := trunc(DBspnAno.Value);
  molVersaoPagto.IDFundacao := Sistema.IDEmpresa;

  molVersaoPagto.Preenche;
end;



procedure TfrmExecGeraDocConvenio.FormShow(Sender: TObject);
begin
  inherited;

  cboMes.ItemIndex  := DiasUteis.ExtraiMes(Date) - 1;
  DBspnAno.Value    := DiasUteis.ExtraiAno(Date);

  PreencheVersoes(); // SOL 230501 PPM 389460

  //Cássio Rovaroto - SIG 60540 - Início
  //chkGeraDocComArquivo.Enabled := False;
  chkGravaArquivo.Checked := True;
  chkGravaArquivo.Enabled := False;
  //Cássio Rovaroto - SIG 60540 - Fim
end;



procedure TfrmExecGeraDocConvenio.btnContinuarClick(Sender: TObject);
var
  sMsg : String;
begin
  // -----------------------------------------------------------------------------------------------

  case pagControle.ActivePageIndex of
    0: if not(VerificaPreenchimentoFiltro) then Exit;
  end;

  // -----------------------------------------------------------------------------------------------

  if ExisteDocArq then
  begin
    sMsg := 'Já existe "documento com arquivo" gerado para alguma das versões selecionadas. ' + #13 +
            'Não será gerado novo documento. ' + #13 + #13 +
            'Deseja prosseguir?';

    if MsgDlg(sMsg, Sistema.NomeModulo, mtInformation, [mbYes, mbNo], 0) = mrNo then
    begin
      Repaint;
      Exit;
    end;
  end;

  // -----------------------------------------------------------------------------------------------

  case pagControle.ActivePageIndex of

    0:
    begin
      ListaRegistros(edtPrevisaoPagto.Date);
      ListaRateioSemDocumento;
      CalculaTaxa;
    end;

  end;

  // -----------------------------------------------------------------------------------------------

  inherited;

  //Cássio Rovaroto - SIG nº 60540 - Início
  if (not(chkGeraDocComArquivo.Enabled)) or (not (chkGravaArquivo.Enabled)) then
  begin
    sMsg := 'Os arquivos de remessa somente serão gerados a partir da funcionalidade Remessa Eletrônica.';
    MsgDlg(sMsg, Sistema.NomeModulo, mtInformation, [mbOk], 0);
    chkGeraDocComArquivo.Checked := True;
    chkGeraDocSemArquivo.Checked := True;
  end;
  //Cássio Rovaroto - SIG nº 60540 - Fim

  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmExecGeraDocConvenio.ListaRegistros(const pdDataPagto: TDateTime);
var
  sSQL      : String;
  sListaFav : String;
  index       : TBookmark;    //edilaine - SIG21438
  sContaLiq   : string;       //edilaine - SIG21438
  rValorOri   : Double;       //edilaine - SIG21438
  rValorTerc  : Double;       //edilaine - SIG21438
  rValorAcum  : Double;       //edilaine - SIG21438
  rAcPercTerc : Double;       //edilaine - SIG21438
  nLinhas     : integer;      //edilaine - SIG21438
begin
  // -----------------------------------------------------------------------------------------------
  sSQL:=
  'SELECT '                                                                                 + #13 +
  '  CONTALIQUIDO, '                                                                        + #13 +
  '  IDFAVORECIDO AS IDPESSOA, '                                                            + #13 +
  '  NOME, '                                                                                + #13 +
  '  NOME AS RAZAOSOCIAL, '                                                                 + #13 +
  '  NUMDOCUMENTO, '                                                                        + #13 +
  '  CONTACORRENTE, '                                                                       + #13 +
  '  NUMAGENCIA , '                                                                         + #13 +
  '  NUMBANCO AS CODBANCOFAVORECIDO, '                                                      + #13 +
  '  '' '' LOGRADOURO, '                                                                    + #13 +
  '  '' '' NUMERO, '                                                                        + #13 +
  '  '' '' COMPLEMENTO, '                                                                   + #13 +
  '  '' '' BAIRRO, '                                                                        + #13 +
  '  '' '' CIDADE, '                                                                        + #13 +
  '  '' '' CODESTADO, '                                                                     + #13 +
  '  '' '' CEP, '                                                                           + #13 +
  '  IDFAVORECIDO AS IDFORCLI, '                                                            + #13 +
  '  IDFAVORECIDO AS CODDOCUMENTO, '                                                        + #13 +
  '  LINHAS, '                                                                              + #13 +
  '  VALOR, '                                                                               + #13 +
  '  0.00 VALORDESCONTO, '                                                                  + #13 +
  '  0.00 VALORJUROS, '                                                                     + #13 +
  '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', pdDataPagto)) + ' AS DATAVENCTO, '          + #13 +
  '  ' + QuotedStr(FormatDateTime('DD/MM/YYYY', pdDataPagto)) + ' AS DATAPROGRAMADA, '      + #13 +
  '  0 TIPOMOEDA, '                                                                         + #13 +
  '  0 NUMLOTE, '                                                                           + #13 +
  '  CODPORTFORMA, '                                                                        + #13 +
  '  CODPORTFORMA AS CODPORTADOR, '                                                         + #13 +
  '  CODFORMAPAGTO, '                                                                       + #13 +
  '  CODTIPOPAGTO, '                                                                        + #13 +
  '  FLGEMITEAVISO, '                                                                       + #13 +
  '  CODARQUIVOREMESSA, '                                                                   + #13 +
  '  IDBANCO, '                                                                             + #13 +
  '  NOCONTACORR, '                                                                         + #13 +
  '  ' + ''' '' CODBARRA, '                                                                 + #13 +
  '  ' + ''' '' CODBARRAVALOR, '                                                            + #13 +
  '  IDFAVORECIDO||''-''||IDFAVORECIDO||''-'' AS NODOCUMENTO, '                             + #13 +
  '  ' + '''02'' AS COMPLDOCUMENTO, '                                                       + #13 +
  '  ' + '''F'' AS TIPO, '                                                                  + #13 +
  '  NUMEMPRESABANCO, '                                                                     + #13 +
  '  ' + ''' '' AS DEBCRE, '                                                                + #13 +
  '  ' + '''1'' AS TIPOCONTA, '                                                             + #13 +
  '  NOMEAGENCIA, '                                                                         + #13 +
  '  ' + '''                         '' AS LIVRE '                                          + #13 +
  '  , PAGTOTERC '                                                                          + #13 +  //edilaine - SIG21438
  '  , 0 AS IDFAVORECIDOPAI '                                                               + #13 +  //edilaine - SIG21438
  '  , IDCBANCARIA '                                                                        + #13 +  //edilaine - SIG21438
  '  , IDRUBRICA '                                                                          + #13 +  //edilaine - SIG21438
  '  , 0.00 AS VLRORIGEM '                                                                  + #13 +  //edilaine - SIG21438
  '  , FLGARQUIVO '                                                                         + #13#10 + // Andre Imakawa - SIG 60540
  '  , CODFORMA   '                                                                         + #13#10 + // Andre Imakawa - SIG 60540

  // Andre Imakawa - SIG 94275 - Inicio
  'FROM '                                                                                   + #13 +
  '  ( '                                                                                    + #13 +
  '       SELECT CODPORTFORMA,'                                                             + #13#10 +
  '       CONTALIQUIDO,'                                                                    + #13#10 +
  '       FLGGERACAP,'                                                                      + #13#10 +
  '       FLGELETRONICO,'                                                                   + #13#10 +
  '       NOME,'                                                                            + #13#10 +
  '       IDFAVORECIDO,'                                                                    + #13#10 +
  '       CONTACORRENTE,'                                                                   + #13#10 +
  '       NUMAGENCIA,'                                                                      + #13#10 +
  '       NUMBANCO,'                                                                        + #13#10 +
  '       NUMDOCUMENTO,'                                                                    + #13#10 +
  '       CODARQUIVOREMESSA,'                                                               + #13#10 +
  '       PATHARQUIVOREM,'                                                                  + #13#10 +
  '       DMAIS,'                                                                           + #13#10 +
  '       CONTROLEREMESSA,'                                                                 + #13#10 +
  '       CODFORMAPAGTO,'                                                                   + #13#10 +
  '       FLGEMITEAVISO,'                                                                   + #13#10 +
  '       CODTIPOPAGTO,'                                                                    + #13#10 +
  '       NUMEMPRESABANCO,'                                                                 + #13#10 +
  '       IDBANCO,'                                                                         + #13#10 +
  '       NOCONTACORR,'                                                                     + #13#10 +
  '       NOMEAGENCIA,'                                                                     + #13#10 +
  '       SUM(LINHAS) AS LINHAS,'                                                           + #13#10 +
  '       SUM(VALOR) AS VALOR,'                                                             + #13#10 +
  '       PAGTOTERC,'                                                                       + #13#10 +
  '       IDCBANCARIA,'                                                                     + #13#10 +
  '       IDRUBRICA,'                                                                       + #13#10 +
  '       FLGARQUIVO, '                                                                     + #13#10 + // Andre Imakawa - SIG 60540
  '       CODFORMA   '                                                                      + #13#10 + // Andre Imakawa - SIG 60540

  'FROM('                                                                                   + #13#10 +
  // Andre Imakawa - SIG 94275 - Fim

  '  SELECT '                                                                               + #13 +
  '    LD.CODPORTFORMAFAV AS CODPORTFORMA, '                                                + #13 +
  '    DECODE(H.FLGDESCONTO,1,H.PLACONTAC,H.PLACONTAD) AS CONTALIQUIDO, '                   + #13 +
  '    LD.FLGGERACPAGAR AS FLGGERACAP, '                                                    + #13 +
  '    LD.FLGELETRONICO, '                                                                  + #13 +
  '    PF.NOME, '                                                                           + #13 +
  '    H.IDFAVORECIDO, '                                                                    + #13 +
  '    CB.CONTACORRENTE, '                                                                  + #13 +
  '    AG.NUMAGENCIA, '                                                                     + #13 +
  '    BC.NUMBANCO, '                                                                       + #13 +
  '    PF.NUMDOCUMENTO, '                                                                   + #13 +
  '    PFR.CODARQUIVOREMESSA, '                                                             + #13 +
  '    PFR.PATHARQUIVOREM, '                                                                + #13 +
  '    PFR.DMAIS, '                                                                         + #13 +
  '    PFR.CONTROLEREMESSA, '                                                               + #13 +
  '    PFR.CODFORMAPAGTO, '                                                                 + #13 +
  '    PFR.FLGEMITEAVISO, '                                                                 + #13 +
  '    PFR.CODTIPOPAGTO, '                                                                  + #13 +
  '    PFR.NUMEMPRESABANCO, '                                                               + #13 +
  '    PCT.IDBANCO, '                                                                       + #13 +
  '    PCT.NOCONTACORR, '                                                                   + #13 +
  '    PA.NOME AS NOMEAGENCIA, '                                                            + #13 +
  '    COUNT(*) AS LINHAS, '                                                                + #13 +
  '    SUM(DECODE(H.FLGDESCONTO, 1, H.VALORPROVENTO, 0 - H.VALORPROVENTO)) AS VALOR '       + #13 +
  '    , NVL(RXB.PAGTOTERC, 0) AS PAGTOTERC '                                               + #13 +  //edilaine - SIG21438
  '    , DECODE(RXB.PAGTOTERC, 1, RXB.IDCBANCARIA, 0) AS IDCBANCARIA '                      + #13 +  //edilaine - SIG21438
  '    , DECODE(RXB.PAGTOTERC, 1, H.IDRUBRICA, 0) AS IDRUBRICA '                            + #13 +  //edilaine - SIG21438
  '    , NVL(PFR.FLGARQUIVO,''N'') AS FLGARQUIVO '                                          + #13 +  // Andre Imakawa - SIG 60540
  '    , PFR.CODFORMA                            '                                          + #13 +  // Andre Imakawa - SIG 60540


  '  FROM '                                                                                 + #13 +
  '    HISTRUBSAL             H,   '                                                        + #13 +
  '    PROVDESC               PD,  '                                                        + #13 +
  '    PESSOA                 PF,  '                                                        + #13 +
  '    RUBRICAXCONTABANCARIA  RXB, '                                                        + #13 +
  '    CONTABANCARIA          CB,  '                                                        + #13 +
  '    AGENCIABANCARIA        AG,  '                                                        + #13 +
  '    BANCO                  BC,  '                                                        + #13 +
  '    PORTADORFORMA          PFR, '                                                        + #13 +
  '    PORTADORCONTA          PCT, '                                                        + #13 +
  '    PESSOA                 PA,  '                                                        + #13 +

  '    ( '                                                                                  + #13 +
  '    SELECT '                                                                             + #13 +
  '      MIN(IDLAYOUT) IDLAYOUT, IDFAVORECIDO '                                             + #13 +
  '    FROM '                                                                               + #13 +
  '      LAYOUTXCOLUNAS '                                                                   + #13 +
  '    GROUP BY '                                                                           + #13 +
  '      IDFAVORECIDO '                                                                     + #13 +
  '    ) LC, '                                                                              + #13 +

  '    LAYOUTDESCONTO         LD '                                                          + #13 +

  '  WHERE '                                                                                + #13 +
  '        H.IDHSTFOLHABENEF    IN (' + molVersaoPagto.Versoes + ') '                       + #13 +
  '    AND H.IDFAVORECIDO       = PF.IDPESSOA '                                             + #13 +
  '    AND H.IDMODULO           = 18 '                                                      + #13 +
  '    AND H.IDRUBRICA          = PD.IDPROVENTO '                                           + #13 +
  '    AND H.FLGDESCONTO        IN (0,1) '                                                  + #13 +
  '    AND H.FLGESPECIAL        = 0 '                                                       + #13 +
  '    AND H.FLGPENSAOALIM      = 0 '                                                       + #13 +
  '    AND H.FLGTIPODESC        IN (''C'',''Y'') '                                          + #13 +
  '    AND PFR.RECPAG           = ''P'' '                                                   + #13 +
  '    AND PCT.CODPORTADOR      = PFR.CODPORTADOR '                                         + #13 +
  '    AND PFR.CODPORTFORMA     = LD.CODPORTFORMAFAV '                                      + #13 +
  '    AND NVL(PF.TIPO, ''F'')  = ''J'' '                                                   + #13 +
  '    AND RXB.IDPESSOA(+)      = H.IDFAVORECIDO '                                          + #13 +
  '    AND RXB.IDRUBRICA(+)     = H.IDRUBRICA '                                             + #13 +
  '    AND CB.IDCBANCARIA(+)    = RXB.IDCBANCARIA '                                         + #13 +
  '    AND CB.IDPESSOA(+)       = RXB.IDPESSOA '                                            + #13 +
  '    AND AG.IDPESSOA(+)       = CB.IDAGENCIA '                                            + #13 +
  '    AND AG.IDPESSOA          = PA.IDPESSOA(+) '                                          + #13 +
  '    AND BC.IDPESSOA(+)       = AG.IDBANCO '                                              + #13 +
  '    AND LC.IDFAVORECIDO(+)   = H.IDFAVORECIDO '                                          + #13 +
  '    AND LD.IDLAYOUT(+)       = LC.IDLAYOUT '                                             + #13 +
  '    AND LD.FLGGERACPAGAR(+)  = 1 '                                                       + #13 +

  '  GROUP BY '                                                                             + #13 +
  '    H.IDFAVORECIDO, PF.NOME, CB.CONTACORRENTE, AG.NUMAGENCIA, '                          + #13 +
  '    DECODE(H.FLGDESCONTO, 1, H.PLACONTAC, H.PLACONTAD), '                                + #13 +
  '    PF.NUMDOCUMENTO, PFR.CODARQUIVOREMESSA, PFR.PATHARQUIVOREM, '                        + #13 +
  '    PFR.DMAIS, PFR.CONTROLEREMESSA, PFR.CODFORMAPAGTO, '                                 + #13 +
  '    PFR.FLGEMITEAVISO, PFR.CODTIPOPAGTO, PFR.NUMEMPRESABANCO, '                          + #13 +
  '    PCT.IDBANCO, PCT.NOCONTACORR, PA.NOME, '                                             + #13 +
  '    BC.NUMBANCO, LD.CODPORTFORMAFAV, LD.FLGGERACPAGAR, LD.FLGELETRONICO '                + #13 +
  '    , RXB.PAGTOTERC '                                                                    + #13 +  //edilaine - SIG21438
  '    , DECODE(RXB.PAGTOTERC, 1, RXB.IDCBANCARIA, 0) '                                     + #13 +  //edilaine - SIG21438
  '    , DECODE(RXB.PAGTOTERC, 1, H.IDRUBRICA, 0) '                                         + #13 +  //edilaine - SIG21438
  '    , NVL(PFR.FLGARQUIVO,''N'') '                                                        + #13 +  // Andre Imakawa - SIG 60540
  '    , PFR.CODFORMA              '                                                        + #13 +  // Andre Imakawa - SIG 60540


  // Andre Imakawa - SIG 94275 - Inicio
  ')'                                                                                       + #13#10 +
  'GROUP BY'                                                                                + #13#10 +
  'CODPORTFORMA,'                                                                           + #13#10 +
  '       CONTALIQUIDO,'                                                                    + #13#10 +
  '       FLGGERACAP,'                                                                      + #13#10 +
  '       FLGELETRONICO,'                                                                   + #13#10 +
  '       NOME,'                                                                            + #13#10                                                                   +
  '       IDFAVORECIDO,'                                                                    + #13#10 +
  '       CONTACORRENTE,'                                                                   + #13#10 +
  '       NUMAGENCIA,'                                                                      + #13#10 +
  '       NUMBANCO,'                                                                        + #13#10 +
  '       NUMDOCUMENTO,'                                                                    + #13#10 +
  '       CODARQUIVOREMESSA,'                                                               + #13#10 +
  '       PATHARQUIVOREM,'                                                                  + #13#10 +
  '       DMAIS,'                                                                           + #13#10 +
  '       CONTROLEREMESSA,'                                                                 + #13#10 +
  '       CODFORMAPAGTO,'                                                                   + #13#10 +
  '       FLGEMITEAVISO,'                                                                   + #13#10 +
  '       CODTIPOPAGTO,'                                                                    + #13#10 +
  '       NUMEMPRESABANCO,'                                                                 + #13#10 +
  '       IDBANCO,'                                                                         + #13#10 +
  '       NOCONTACORR,'                                                                     + #13#10 +
  '       NOMEAGENCIA,'                                                                     + #13#10 +
  '       PAGTOTERC,'                                                                       + #13#10 +
  '       IDCBANCARIA,'                                                                     + #13#10 +
  '       IDRUBRICA,'                                                                       + #13#10 +
  '       FLGARQUIVO, '                                                                     + #13#10 +   // Andre Imakawa - SIG 60540
  '       CODFORMA   '                                                                      + #13#10 +   // Andre Imakawa - SIG 60540

  // Andre Imakawa - SIG 94275 - Fim

  '  ) '                                                                                    + #13 +

  'WHERE '                                                                                  + #13 +
  '      FLGELETRONICO  = 1 '                                                               + #13 +
  '  AND FLGGERACAP     = 1 '                                                               + #13 +
  '  AND CONTACORRENTE  IS NOT NULL '                                                       + #13 +
  '  AND NUMAGENCIA     IS NOT NULL '                                                       + #13 +
  '  AND NUMBANCO       IS NOT NULL '                                                       + #13 +
  '  AND VALOR          > 0 '                                                               + #13 +

  'ORDER BY '                                                                               + #13 +
  '  NOME '                                                                                 + #13;
  // -----------------------------------------------------------------------------------------------

  cdsListaArquivo.Close;
  sqlListaArquivo.SQL.Clear;
  sqlListaArquivo.SQL.Text := sSQL;
  sqlListaArquivo.Open;

  // -----------------------------------------------------------------------------------------------

  lblTotalArquivo.Caption := 'Valor total:  ' + FormatFloat('#,#0.00', TotalizaRepasse);

  // -----------------------------------------------------------------------------------------------

  sListaFav := '';

  cdsListaArquivo.DisableControls;
  cdsListaArquivo.First;
  while not(cdsListaArquivo.EOF) do
  begin
    sListaFav := sListaFav + cdsListaArquivo.FieldByName('IDPESSOA').AsString + ', ';

    //edilaine - SIG21438 - inicio
    if cdsListaArquivo.FieldByName('PAGTOTERC').AsInteger = 1 then
    begin
      //busca dados do terceiro
      qryBuscaTerc.close;
      qryBuscaTerc.ParamByName('IDPESSOA').AsInteger    := cdsListaArquivo.FieldByName('IDPESSOA').AsInteger;
      qryBuscaTerc.ParamByName('IDRUBRICA').AsInteger   := cdsListaArquivo.FieldByName('IDRUBRICA').AsInteger;
      qryBuscaTerc.ParamByName('IDCBANCARIA').AsInteger := cdsListaArquivo.FieldByName('IDCBANCARIA').AsInteger;
      qryBuscaTerc.ParamByName('DTPAGAMENTO').AsString  := edtPrevisaoPagto.text;
      qryBuscaTerc.Open;

      //se houver terceiro, calcula o valor referente ao percentual e insere na lista
      if not qryBuscaTerc.IsEmpty then
      begin
        index := cdsListaArquivo.GetBookmark;
        sContaLiq   := cdsListaArquivo.FieldByName('CONTALIQUIDO').AsString;
        rValorOri   := cdsListaArquivo.FieldByName('VALOR').AsCurrency;
        nLinhas     := cdsListaArquivo.FieldByName('LINHAS').AsInteger;
        rValorAcum  := 0;
        rAcPercTerc := 0;

        while not qryBuscaTerc.Eof do
        begin
          // insere dados do terceiro na lista
          rValorTerc := rValorOri * (qryBuscaTerc.FieldByName('PERCENTUAL').AsFloat / 100);
          rValorTerc := ArredondaValor(rValorTerc,2);

          cdsListaArquivo.Append;
          cdsListaArquivo.FieldByName('CONTALIQUIDO').AsString       := sContaLiq;
          cdsListaArquivo.FieldByName('IDPESSOA').AsInteger          := qryBuscaTerc.FieldByName('IDPESSOATERC').AsInteger;
          cdsListaArquivo.FieldByName('NOME').AsString               := qryBuscaTerc.FieldByName('NOME').AsString;
          cdsListaArquivo.FieldByName('RAZAOSOCIAL').AsString        := qryBuscaTerc.FieldByName('NOME').AsString;
          cdsListaArquivo.FieldByName('NUMDOCUMENTO').AsString       := qryBuscaTerc.FieldByName('NUMDOCUMENTO').AsString;
          cdsListaArquivo.FieldByName('CONTACORRENTE').AsString      := qryBuscaTerc.FieldByName('CONTACORRENTE').AsString;
          cdsListaArquivo.FieldByName('NUMAGENCIA').AsString         := qryBuscaTerc.FieldByName('NUMAGENCIA').AsString;
          cdsListaArquivo.FieldByName('CODBANCOFAVORECIDO').AsString := qryBuscaTerc.FieldByName('NUMBANCO').AsString;
          cdsListaArquivo.FieldByName('IDFORCLI').AsInteger          := qryBuscaTerc.FieldByName('IDPESSOATERC').AsInteger;
          cdsListaArquivo.FieldByName('CODDOCUMENTO').AsInteger      := qryBuscaTerc.FieldByName('IDPESSOATERC').AsInteger;
          cdsListaArquivo.FieldByName('LINHAS').AsInteger            := nLinhas;
          cdsListaArquivo.FieldByName('VALOR').AsCurrency            := rValorTerc;
          cdsListaArquivo.FieldByName('DATAVENCTO').AsString         := edtPrevisaoPagto.Text;
          cdsListaArquivo.FieldByName('DATAPROGRAMADA').AsString     := edtPrevisaoPagto.Text;
          cdsListaArquivo.FieldByName('CODPORTFORMA').AsInteger      := qryBuscaTerc.FieldByName('CODPORTFORMA').AsInteger;
          cdsListaArquivo.FieldByName('CODPORTADOR').AsInteger       := qryBuscaTerc.FieldByName('CODPORTFORMA').AsInteger;
          cdsListaArquivo.FieldByName('CODFORMAPAGTO').AsInteger     := qryBuscaTerc.FieldByName('CODFORMAPAGTO').AsInteger;
          cdsListaArquivo.FieldByName('CODTIPOPAGTO').AsInteger      := qryBuscaTerc.FieldByName('CODTIPOPAGTO').AsInteger;
          cdsListaArquivo.FieldByName('FLGEMITEAVISO').AsString      := qryBuscaTerc.FieldByName('FLGEMITEAVISO').AsString;
          cdsListaArquivo.FieldByName('CODARQUIVOREMESSA').AsInteger := qryBuscaTerc.FieldByName('CODARQUIVOREMESSA').AsInteger;
          cdsListaArquivo.FieldByName('IDBANCO').AsInteger           := qryBuscaTerc.FieldByName('IDBANCO').AsInteger;
          cdsListaArquivo.FieldByName('NOCONTACORR').AsString        := qryBuscaTerc.FieldByName('NOCONTACORR').AsString;
          cdsListaArquivo.FieldByName('NODOCUMENTO').AsString        := qryBuscaTerc.FieldByName('NODOCUMENTO').AsString;
          cdsListaArquivo.FieldByName('COMPLDOCUMENTO').AsString     := qryBuscaTerc.FieldByName('COMPLDOCUMENTO').AsString;
          cdsListaArquivo.FieldByName('TIPO').AsString               := qryBuscaTerc.FieldByName('TIPO').AsString;
          cdsListaArquivo.FieldByName('TIPOCONTA').AsString          := qryBuscaTerc.FieldByName('TIPOCONTA').AsString;
          cdsListaArquivo.FieldByName('NUMEMPRESABANCO').AsString    := qryBuscaTerc.FieldByName('NUMEMPRESABANCO').AsString;
          cdsListaArquivo.FieldByName('NOMEAGENCIA').AsString        := qryBuscaTerc.FieldByName('NOMEAGENCIA').AsString;
          cdsListaArquivo.FieldByName('LINHAS').AsInteger            := nLinhas;
          cdsListaArquivo.FieldByName('IDRUBRICA').AsInteger         := qryBuscaTerc.FieldByName('IDRUBRICA').AsInteger;
          cdsListaArquivo.FieldByName('IDFAVORECIDOPAI').AsInteger   := qryBuscaTerc.FieldByName('FAVORECIDOPAI').AsInteger;
          cdsListaArquivo.FieldByName('IDCBANCARIA').AsInteger       := qryBuscaTerc.FieldByName('IDCBANCARIATERC').AsInteger;
          cdsListaArquivo.FieldByName('FLGARQUIVO').AsString         := qryBuscaTerc.FieldByName('FLGARQUIVO').AsString; // Andre Imakawa - SIG 60540
          cdsListaArquivo.Post;

          rValorAcum  := rValorAcum + rValorTerc;

          rAcPercTerc := rAcPercTerc + qryBuscaTerc.FieldByName('PERCENTUAL').AsFloat;

          qryBuscaTerc.next;
        end;

        // se o pagamento for todo para o terceiro, e tem residio em relação ao valor original, joga no ultimo terceiro
        if (rAcPercTerc = 100) and ((rValorOri - rValorAcum) <> 0) then
        begin
          rValorTerc := cdsListaArquivo.FieldByName('VALOR').AsCurrency + ArredondaValor(rValorOri - rValorAcum,2);

          cdsListaArquivo.Edit;
          cdsListaArquivo.FieldByName('VALOR').AsCurrency := rValorTerc;
          cdsListaArquivo.Post;
        end;

        cdsListaArquivo.GotoBookmark(index);
        cdsListaArquivo.FreeBookmark(index);

        // ajusta o valor do favorecido
        cdsListaArquivo.Edit;
        if (rAcPercTerc = 100) then
           cdsListaArquivo.FieldByName('VALOR').AsCurrency  := 0
        else
           cdsListaArquivo.FieldByName('VALOR').AsCurrency  := ArredondaValor(rValorOri - rValorAcum,2);
        cdsListaArquivo.FieldByName('VLRORIGEM').AsCurrency := rValorOri;
        cdsListaArquivo.Post;
      end;
    end;
    //edilaine - SIG21438 - fim

    cdsListaArquivo.Next;
  end;

  // tira a vírgula do final
  delete(sListaFav, length(sListaFav), 2);

  // -----------------------------------------------------------------------------------------------

  cdsListaArquivo.EnableControls;

  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmExecGeraDocConvenio.CalculaTaxa;
var
  sSQL              : String;
  sListaFav         : String;
  fValorDesconto    : Currency;
  fTotalDesconto2   : Currency;
  bErro             : Boolean;
  IDCalculo         : Integer;
  iTotLinhas        : Integer;
  iTotLinhasRateio  : Integer;
  rValorCalc        : Double;            //edilaine - SIG21438
  rValorAcumTerc    : Double;            //edilaine - SIG21438
  rValorAcum        : Double;            //edilaine - SIG21438
  rValorTerc        : Double;            //edilaine - SIG21438
  i                 : Integer;           //edilaine - SIG21438
  sCampo            : string;            //edilaine - SIG21438
  cdsTerceiro       : TClientDataSet;    //edilaine - SIG21438
begin
  // -----------------------------------------------------------------------------------------------
  sSQL:=
  'SELECT '                                                                                 + #13 +
  '  LOD.CODPORTFORMAFAV AS CODPORTFORMA, LOD.FLGGERACPAGAR AS FLGGERACAP, '                + #13 +
  '  LOD.FLGELETRONICO, LOD.PLACONTABAIXA, LOD.IDREGRATXADMIN, LOD.CODTIPRECDES, '          + #13 +
  '  LOD.IDLAYOUT, '                                                                        + #13 +

  '  RXP.UNIDNEGOC, NVL(RXP.CODTIPRECDESFAV, HRS.CODTIPRECDES) AS CODTIPRECDESFAV, '        + #13 +
  '  RXP.CODCENTRORESPON, '                                                                 + #13 +

  '  PFA.NOME, PFA.NUMDOCUMENTO, '                                                          + #13 +
  '  CBA.CONTACORRENTE, '                                                                   + #13 +

  //'  HRS.IDPLANOCONTABIL, HRS.IDPATRO, HRS.IDFAVORECIDO, '                                  + #13 +  // Andre Imakawa - SIG 67667
  '  PI.IDPLANPREVCONTAB AS IDPLANOCONTABIL, HRS.IDPATRO, HRS.IDFAVORECIDO, '               + #13 +    // Andre Imakawa - SIG 67667
  '  DECODE(HRS.FLGDESCONTO, 1, HRS.PLACONTAC, HRS.PLACONTAD) AS PLACONTA, '                + #13 +
  '  0.00 AS DESCONTO, '                                                                    + #13 +
  '  SUM(DECODE(HRS.FLGDESCONTO, 1, HRS.VALORPROVENTO, 0 - HRS.VALORPROVENTO)) AS VALOR, '  + #13 +
  '  COUNT(HRS.FLGDESCONTO) AS LINHAS, '                                                    + #13 +
  '  RXB.PAGTOTERC,  '                                                                      + #13 +   //edilaine - SIG21438
  '  DECODE(RXB.PAGTOTERC, 1, RXB.IDCBANCARIA, 0) AS IDCBANCARIA, '                         + #13 +   //edilaine - SIG21438
  '  DECODE(RXB.PAGTOTERC, 1, HRS.IDRUBRICA, 0) AS IDRUBRICA  '                             + #13 +   //edilaine - SIG21438

  'FROM '                                                                                   + #13 +
  '  HISTRUBSAL             HRS, '                                                          + #13 +
  '  PESSOA                 PFA, '                                                          + #13 +
  '  RUBRICAXCONTABANCARIA  RXB, '                                                          + #13 +
  '  CONTABANCARIA          CBA, '                                                          + #13 +
  '  PROVDESC               PVD, '                                                          + #13 +
  '  RUBRICAXPLANO          RXP, '                                                          + #13 +

  '  ( '                                                                                    + #13 +
  '  SELECT '                                                                               + #13 +
  '    MIN(IDLAYOUT) IDLAYOUT, IDFAVORECIDO '                                               + #13 +
  '  FROM '                                                                                 + #13 +
  '    LAYOUTXCOLUNAS '                                                                     + #13 +
  '  GROUP BY '                                                                             + #13 +
  '    IDFAVORECIDO '                                                                       + #13 +
  '  ) LXC, '                                                                               + #13 +

  '  LAYOUTDESCONTO         LOD '                                                           + #13 +
  '  ,PERFILINVEST  PI   '                                                                  + #13 +  // Andre Imakawa - SIG 67667

  'WHERE '                                                                                  + #13 +
  '      LOD.FLGELETRONICO    = 1 '                                                         + #13 +
  '  AND HRS.IDHSTFOLHABENEF  IN (' + molVersaoPagto.Versoes + ') '                         + #13 +
  '  AND HRS.IDFAVORECIDO     = PFA.IDPESSOA '                                              + #13 +
  '  AND HRS.IDMODULO         = 18 '                                                        + #13 +
  '  AND HRS.FLGDESCONTO      IN (0,1) '                                                    + #13 +
  '  AND HRS.FLGESPECIAL      = 0 '                                                         + #13 +
  '  AND HRS.FLGPENSAOALIM    = 0 '                                                         + #13 +
  '  AND HRS.FLGTIPODESC      IN (''C'', ''Y'') '                                           + #13 +
  '  AND NVL(PFA.TIPO, ''F'') = ''J'' '                                                     + #13 +
  '  AND RXB.IDPESSOA(+)      = HRS.IDFAVORECIDO '                                          + #13 +
  '  AND RXB.IDRUBRICA(+)     = HRS.IDRUBRICA '                                             + #13 +
  '  AND CBA.IDCBANCARIA(+)   = RXB.IDCBANCARIA '                                           + #13 +
  '  AND CBA.IDPESSOA(+)      = RXB.IDPESSOA '                                              + #13 +
  '  AND LXC.IDFAVORECIDO(+)  = HRS.IDFAVORECIDO '                                          + #13 +
  '  AND HRS.IDRUBRICA        = PVD.IDPROVENTO '                                            + #13 +
  '  AND HRS.IDRUBRICA        = RXP.IDRUBRICA '                                             + #13 +
  '  AND HRS.IDPLANOPREV      = RXP.IDPLANOPREV '                                           + #13 +
  '  AND HRS.IDPATRO          = RXP.IDPESSJUR '                                             + #13 +
  '  AND LOD.IDLAYOUT(+)      = LXC.IDLAYOUT '                                              + #13 +
  '  AND LOD.FLGGERACPAGAR(+) = 1 '                                                         + #13 +

  '  AND HRS.IDPERFILINVEST = PI.IDPERFILINVEST '                                           + #13 + // Andre Imakawa - SIG 67667

  'GROUP BY '                                                                               + #13 +
  '  LOD.CODPORTFORMAFAV, LOD.FLGGERACPAGAR, '                                              + #13 +
  '  LOD.FLGELETRONICO, LOD.PLACONTABAIXA, LOD.IDREGRATXADMIN, LOD.CODTIPRECDES, '          + #13 +
  '  LOD.IDLAYOUT, '                                                                        + #13 +
  '  RXP.UNIDNEGOC, NVL(RXP.CODTIPRECDESFAV, HRS.CODTIPRECDES), '                           + #13 +
  '  RXP.CODCENTRORESPON, '                                                                 + #13 +
  '  PFA.NOME, PFA.NUMDOCUMENTO, '                                                          + #13 +
  '  CBA.CONTACORRENTE, '                                                                   + #13 +
  '  DECODE(HRS.FLGDESCONTO, 1, HRS.PLACONTAC, HRS.PLACONTAD), '                            + #13 +
  //'  HRS.IDPLANOCONTABIL, HRS.IDPATRO, HRS.IDFAVORECIDO '                                   + #13 + // Andre Imakawa - SIG 67667
  '  PI.IDPLANPREVCONTAB, HRS.IDPATRO, HRS.IDFAVORECIDO, '                                  + #13 +   // Andre Imakawa - SIG 67667
  '  RXB.PAGTOTERC, '                                                                       + #13 +   //edilaine - SIG21438
  '  DECODE(RXB.PAGTOTERC, 1, RXB.IDCBANCARIA, 0), '                                        + #13 +   //edilaine - SIG21438
  '  DECODE(RXB.PAGTOTERC, 1, HRS.IDRUBRICA, 0) '                                           + #13 +   //edilaine - SIG21438

  'ORDER BY '                                                                               + #13 +
  '  PFA.NOME, CBA.CONTACORRENTE ';
  // -----------------------------------------------------------------------------------------------

  // O dataset de rateio corresponde ao dataset de exibição (cdsListaArquivo), mas tem menos campos,
  // e agrupado pelos campos necessários ao registro do rateio no documento de CaP
  // (conta de baixa, plano, patro, tipo de desembolso)

  cdsRateio.Close;
  sqlRateio.SQL.Clear;
  sqlRateio.SQL.Text := sSQL;
  sqlRateio.Open;

  MontaConsultaBuscaRateio(sSQL);    //edilaine - SIG21438
  // -----------------------------------------------------------------------------------------------

  // Itera pelo dataset calculando o valor de desconto para cada linha, e atualizando o dataset

  fVlrRateioComDoc  := 0;
  iTotLinhas        := 0;
  iTotLinhasRateio  := 0;
  fTotalDesconto    := 0;

  //edilaine - SIG21438 - inicio
  cdsTerceiro := TClientDataSet.Create(nil);
  try
    try
      cdsTerceiro.CloneCursor(cdsListaArquivo, True);

      {filtra favorecidos com terceiros parametrizados}
      cdsListaArquivo.DisableControls;
      cdsListaArquivo.First;
      cdsListaArquivo.Filter   := '(PAGTOTERC = 1) AND (VLRORIGEM > 0)';
      cdsListaArquivo.Filtered := True;
      while not cdsListaArquivo.Eof do
      begin
        //busca lançamentos do favorecido
        qryRateioPerc.close;
        qryRateioPerc.ParamByName('IDFAVORECIDO').AsInteger := cdsListaArquivo.FieldByName('IDPESSOA').AsInteger;
        qryRateioPerc.ParamByName('IDRUBRICA').AsInteger    := cdsListaArquivo.FieldByName('IDRUBRICA').AsInteger;
        qryRateioPerc.ParamByName('IDCBANCARIA').AsInteger  := cdsListaArquivo.FieldByName('IDCBANCARIA').AsInteger;
        qryRateioPerc.ParamByName('TOTAL').AsCurrency       := cdsListaArquivo.FieldByName('VLRORIGEM').AsCurrency;
        qryRateioPerc.Open;

        //busca dados do terceiro
        qryBuscaTerc.close;
        qryBuscaTerc.ParamByName('IDPESSOA').AsInteger    := cdsListaArquivo.FieldByName('IDPESSOA').AsInteger;
        qryBuscaTerc.ParamByName('IDRUBRICA').AsInteger   := cdsListaArquivo.FieldByName('IDRUBRICA').AsInteger;
        qryBuscaTerc.ParamByName('IDCBANCARIA').AsInteger := cdsListaArquivo.FieldByName('IDCBANCARIA').AsInteger;
        qryBuscaTerc.ParamByName('DTPAGAMENTO').AsString  := edtPrevisaoPagto.text;
        qryBuscaTerc.Open;

        while not qryBuscaTerc.eof do
        begin
          rValorAcumTerc := 0;
          //localiza terceiro registrados anteriormente
          if cdsTerceiro.Locate('IDPESSOA;IDRUBRICA;IDCBANCARIA',
                                 VarArrayOf([qryBuscaTerc.FieldByName('IDPESSOATERC').AsString,
                                             qryBuscaTerc.FieldByName('IDRUBRICA').AsString,
                                             qryBuscaTerc.FieldByName('IDCBANCARIATERC').AsString]), []) then
          begin
            //pega valor que já foi proporcionalizado pelo % do terceiro
            rValorTerc := cdsTerceiro.FieldByName('VALOR').AsCurrency;

            // para cada terceiro sera inserida uma nova linha de rateio baseada no rateio do favorecido
            qryRateioPerc.first;
            while not qryRateioPerc.Eof do
            begin
              rValorCalc := rValorTerc * (qryRateioPerc.FieldByName('PERCENTUAL').AsFloat / 100);
              rValorCalc := ArredondaValor(rValorCalc,2);

              //insere lançamento de rateio
              cdsRateio.Append;
              cdsRateio.FieldByName('CODPORTFORMA').AsInteger      := qryBuscaTerc.FieldByName('CODPORTFORMA').AsInteger;
              cdsRateio.FieldByName('FLGGERACAP').AsInteger        := qryBuscaTerc.FieldByName('FLGGERACAP').AsInteger;
              cdsRateio.FieldByName('FLGELETRONICO').AsInteger     := qryBuscaTerc.FieldByName('FLGELETRONICO').AsInteger;
              cdsRateio.FieldByName('PLACONTABAIXA').AsString      := qryBuscaTerc.FieldByName('PLACONTABAIXA').AsString;
              cdsRateio.FieldByName('IDREGRATXADMIN').AsString     := qryBuscaTerc.FieldByName('IDREGRATXADMIN').AsString;
              cdsRateio.FieldByName('CODTIPRECDES').AsString       := qryBuscaTerc.FieldByName('CODTIPRECDES').AsString;
              cdsRateio.FieldByName('IDLAYOUT').AsInteger          := qryBuscaTerc.FieldByName('IDLAYOUT').AsInteger;
              cdsRateio.FieldByName('UNIDNEGOC').AsInteger         := qryRateioPerc.FieldByName('UNIDNEGOC').AsInteger;
              cdsRateio.FieldByName('CODTIPRECDESFAV').AsString    := qryRateioPerc.FieldByName('CODTIPRECDESFAV').AsString;
              cdsRateio.FieldByName('CODCENTRORESPON').AsInteger   := qryRateioPerc.FieldByName('CODCENTRORESPON').AsInteger;
              cdsRateio.FieldByName('NOME').AsString               := qryBuscaTerc.FieldByName('NOME').AsString;
              cdsRateio.FieldByName('NUMDOCUMENTO').AsString       := qryBuscaTerc.FieldByName('NUMDOCUMENTO').AsString;
              cdsRateio.FieldByName('CONTACORRENTE').AsString      := qryBuscaTerc.FieldByName('CONTACORRENTE').AsString;
              cdsRateio.FieldByName('IDPLANOCONTABIL').AsInteger   := qryRateioPerc.FieldByName('IDPLANOCONTABIL').AsInteger;
              cdsRateio.FieldByName('IDPATRO').AsInteger           := qryRateioPerc.FieldByName('IDPATRO').AsInteger;
              cdsRateio.FieldByName('IDFAVORECIDO').AsInteger      := qryBuscaTerc.FieldByName('IDPESSOATERC').AsInteger;
              cdsRateio.FieldByName('PLACONTA').AsString           := qryRateioPerc.FieldByName('PLACONTA').AsString;
              cdsRateio.FieldByName('DESCONTO').AsCurrency         := 0;
              cdsRateio.FieldByName('VALOR').AsCurrency            := rValorCalc;
              cdsRateio.FieldByName('LINHAS').AsInteger            := qryRateioPerc.FieldByName('LINHAS').AsInteger;
              cdsRateio.Post;

              rValorAcumTerc := rValorAcumTerc + rValorCalc;

              qryRateioPerc.next;

              // verifica se o valor rateado corresponde ao valor calculado para o terceiro
              if (qryRateioPerc.Eof) and ((rValorTerc - rValorAcumTerc) <> 0) then
              begin
                rValorCalc := cdsRateio.FieldByName('VALOR').AsCurrency;
                rValorCalc := rValorCalc + (rValorTerc - rValorAcumTerc);
                // se houve diferença, lança no último rateio
                cdsRateio.Edit;
                cdsRateio.FieldByName('VALOR').AsCurrency := rValorCalc;
                cdsRateio.Post;
              end;
            end;
          end;
          qryBuscaTerc.next;
        end;

        // ajusta os valores no rateio do Favorecido
        rValorTerc := cdsListaArquivo.FieldByName('VALOR').AsCurrency;
        rValorAcum := 0;
        qryRateioPerc.first;
        while not qryRateioPerc.eof do
        begin
          //localiza o rateio para recalcular o valor
          if cdsRateio.Locate('IDFAVORECIDO;UNIDNEGOC;CODTIPRECDESFAV;CODCENTRORESPON;IDPLANOCONTABIL',
                              VarArrayOf([qryRateioPerc.FieldByName('IDFAVORECIDO').AsString,
                                          qryRateioPerc.FieldByName('UNIDNEGOC').AsString,
                                          qryRateioPerc.FieldByName('CODTIPRECDESFAV').AsString,
                                          qryRateioPerc.FieldByName('CODCENTRORESPON').AsString,
                                          qryRateioPerc.FieldByName('IDPLANOCONTABIL').AsString]), []
                             ) then
          begin
            if (rValorTerc > 0) then
            begin
              rValorCalc := rValorTerc * (qryRateioPerc.FieldByName('PERCENTUAL').AsFloat / 100);
              rValorCalc := ArredondaValor(rValorCalc,2);

              cdsRateio.Edit;
              cdsRateio.FieldByName('VALOR').AsCurrency := rValorCalc;
              cdsRateio.Post;

              rValorAcum := rValorAcum + rValorCalc;
            end
            else
              cdsRateio.delete;
          end;

          qryRateioPerc.next;

          // verifica se o valor rateado corresponde ao valor calculado para o terceiro
          if (qryRateioPerc.Eof) and ((rValorTerc - rValorAcum) <> 0) then
          begin
            rValorCalc := cdsRateio.FieldByName('VALOR').AsCurrency;
            rValorCalc := rValorCalc + (rValorTerc - rValorAcum);

            // se houve diferença, lança no último rateio
            cdsRateio.Edit;
            cdsRateio.FieldByName('VALOR').AsCurrency := rValorCalc;
            cdsRateio.Post;
          end;
        end;

        // se o pagamento for 100% para terceiros, apaga o favorecido 
        if cdsListaArquivo.FieldByName('VALOR').AsCurrency = 0 then
           cdsListaArquivo.Delete;

        cdsListaArquivo.next;
      end;
      cdsListaArquivo.Filter   := '';
      cdsListaArquivo.Filtered := False;
      cdsListaArquivo.First;
      cdsListaArquivo.EnableControls;
    except
      MsgDlg('Erro no processo de rateio de valores', Sistema.NomeModulo, mtError, [mbOk, mbHelp], 0);
    end;
  finally
    FreeAndNil(cdsTerceiro);
  end;
  //edilaine - SIG21438 - fim

  cdsRateio.First;
  while not(cdsRateio.EOF) do
  begin
    sSQL                := 'SELECT ' + cdsRateio.FieldByName('LINHAS').AsString + ' AS QUANTLINHAS FROM DUAL ';

    fVlrRateioComDoc    := fVlrRateioComDoc + cdsRateio.FieldByName('VALOR').AsCurrency;
    iTotLinhas          := iTotLinhas + cdsRateio.FieldByName('LINHAS').AsInteger;
    fValorDesconto      := 0;

    if not(cdsRateio.FieldByName('IDREGRATXADMIN').IsNULL) then
    begin
      fValorDesconto    := StrToFloat(ClienteNumero(RegraNumerica(cdsRateio.FieldByName('IDREGRATXADMIN').AsString, sSQL, bErro, IDCalculo)));
      iTotLinhasRateio  := iTotLinhasRateio + cdsRateio.FieldByName('LINHAS').AsInteger;
    end;

    fTotalDesconto      := fTotalDesconto + fValorDesconto;

    cdsRateio.Edit;
    cdsRateio.FieldByName('DESCONTO').AsCurrency := fValorDesconto;
    cdsRateio.Post;

    cdsRateio.Next;
  end;

  lblRateio.Caption       := 'Valor total:  '     + FormatFloat('#,#0.00', fVlrRateioComDoc);
  lblLinhasTotal.Caption  := 'Total Linhas: '     + FormatFloat('#,#0', iTotLinhas);
  lblLinhasRateio.Caption := 'Linhas Desconto: '  + FormatFloat('#,#0', iTotLinhasRateio);
  lblDesconto.Caption     := 'Desconto: '         + FormatFloat('#,#0.00', fTotalDesconto);
  lblLiquido.Caption      := 'Valor líquido: '    + FormatFloat('#,#0.00', fVlrRateioComDoc - fTotalDesconto);

  // -----------------------------------------------------------------------------------------------

  // A partir do dataset atualizado, soma os valores de desconto por Favorecido/Conta-corrente para
  // gravar esses valores no dataset de exibição

  cdsRateio.First;
  while not(cdsRateio.EOF) do
  begin
    if cdsListaArquivo.Locate('IDPESSOA;CONTACORRENTE',
                              VarArrayOf([cdsRateio.FieldByName('IDFAVORECIDO').AsString,
                                          cdsRateio.FieldByName('CONTACORRENTE').AsString]),
                              []
                             ) then
    begin
      cdsListaArquivo.Edit;
      cdsListaArquivo.FieldByName('VALORDESCONTO').AsCurrency := cdsListaArquivo.FieldByName('VALORDESCONTO').AsCurrency +
                                                                 cdsRateio.FieldByName('DESCONTO').AsCurrency;
      cdsListaArquivo.Post;
    end;

    cdsRateio.Next;
  end;

  // -----------------------------------------------------------------------------------------------

  // Só para conferência (temporário até homologar o processo):

  fTotalDesconto2 := 0;

  cdsListaArquivo.DisableControls;
  cdsListaArquivo.First;
  while not(cdsListaArquivo.EOF) do
  begin
    fTotalDesconto2 := fTotalDesconto2 + cdsListaArquivo.FieldByName('VALORDESCONTO').AsCurrency;
    cdsListaArquivo.Next;
  end;
  cdsListaArquivo.EnableControls;

  lblDesconto2.Caption := 'Desconto: '       + FormatFloat('#,#0.00', fTotalDesconto2);

  // -----------------------------------------------------------------------------------------------
end;



function TfrmExecGeraDocConvenio.VerificaPreenchimentoFiltro: Boolean;
begin
  Result := False;

	try
    if cboMes.ItemIndex < 0 then
      raise EValidacao.CreateVal('É necessário indicar o Mês!', cboMes);

    if DBspnAno.Value <= 1980 then
       raise EValidacao.CreateVal('É necessário indicar o Ano!', DBspnAno);

    if length(trim(edtPrevisaoPagto.Text)) = 0 then
       raise EValidacao.CreateVal('É necessário indicar a Previsão de Pagamento!', edtPrevisaoPagto);

    if length(trim(molVersaoPagto.Versoes)) = 0 then
       raise EValidacao.CreateVal('É necessário selecionar pelo menos uma versão da Folha!', molVersaoPagto.lstVersao);

  except
    on ev : EValidacao do
    begin
		  if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
			Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;



function TfrmExecGeraDocConvenio.VerificaPreenchimentoRelat: Boolean;
var
  sMsg : String;
begin
  Result := False;

	try
    if length(trim(molVersaoPagto.Versoes)) = 0 then
       raise EValidacao.CreateVal('É necessário selecionar pelo menos uma versão da Folha!', molVersaoPagto.lstVersao);

    sMsg := 'Não há documento originado pelas versões selecionadas. ' + #13 + #13 +
            'Verifique a seleção de versões.';

    if not(ExisteDocArq) then
      raise EValidacao.CreateVal(sMsg, molVersaoPagto.lstVersao);

    sMsg := 'As versões selecionadas deram origem a mais de um documento. ' + #13 +
            'O relatório exige documento único.'                            + #13 + #13 +
            'Favor reverVerifique a seleção de versões.';

    if not(DocumentoUnico) then
      raise EValidacao.CreateVal(sMsg, btnRelatorio);

  except
    on ev : EValidacao do
    begin
		  if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
			Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;



function TfrmExecGeraDocConvenio.TotalizaRepasse: Currency;
var
  fValor : Currency;
begin
  fValor := 0;

  cdsListaArquivo.DisableControls;
  cdsListaArquivo.First;

  while not(cdsListaArquivo.EOF) do
  begin
    fValor := fValor + cdsListaArquivo.FieldByName('VALOR').AsCurrency;

    cdsListaArquivo.next;
  end;

  cdsListaArquivo.EnableControls;
  cdsListaArquivo.First;

  Result := fValor;
end;



procedure TfrmExecGeraDocConvenio.ListaRateioSemDocumento;
var
  sSQL    : String;
  fValor  : Currency;
begin
  // -----------------------------------------------------------------------------------------------
  sSQL :=
  'SELECT '                                                                                         + #13 +
  '  IDPLANOCONTABIL, IDPATRO, IDFAVORECIDO, NOME, CODTIPRECDESFAV, '                               + #13 +
  '  PLACONTA, UNIDNEGOC, CODCENTRORESPON, CODPORTFORMA, SUM(VALOR) AS VALOR '                      + #13 +

  'FROM '                                                                                           + #13 +

  '  ( '                                                                                            + #13 +
  '  SELECT '                                                                                       + #13 +
  //'    HRS.IDPLANOCONTABIL, HRS.IDPATRO, HRS.IDFAVORECIDO, PFA.NOME, '                              + #13 + // Andre Imakawa - SIG 67667
  '    PI.IDPLANPREVCONTAB AS IDPLANOCONTABIL, HRS.IDPATRO, HRS.IDFAVORECIDO, PFA.NOME, '           + #13 +   // Andre Imakawa - SIG 67667
  '    NVL(RXP.CODTIPRECDESFAV, HRS.CODTIPRECDES) AS CODTIPRECDESFAV, '                             + #13 +
  '    DECODE(HRS.FLGDESCONTO, 1, HRS.PLACONTAC, HRS.PLACONTAD) AS PLACONTA, '                      + #13 +
  '    RXP.UNIDNEGOC, RXP.CODCENTRORESPON, LOD.CODPORTFORMAFAV AS CODPORTFORMA, '                   + #13 +
  '    SUM(DECODE(PVD.FLGDESCONTO, 1, HRS.VALORPROVENTO, 0 - HRS.VALORPROVENTO)) AS VALOR '         + #13 +

  '  FROM '                                                                                         + #13 +
  '    HISTRUBSAL     HRS, '                                                                        + #13 +
  '    PROVDESC       PVD, '                                                                        + #13 +
  '    RUBRICAXPLANO  RXP, '                                                                        + #13 +
  '    PESSOA         PFA, '                                                                        + #13 +

  '    ( '                                                                                          + #13 +
  '    SELECT '                                                                                     + #13 +
  '      MIN(LC.IDLAYOUT) AS IDLAYOUT, LC.IDFAVORECIDO '                                            + #13 +
  '    FROM '                                                                                       + #13 +
  '      LAYOUTXCOLUNAS LC '                                                                        + #13 +
  '    GROUP BY '                                                                                   + #13 +
  '      LC.IDFAVORECIDO '                                                                          + #13 +
  '    ) LXC, '                                                                                     + #13 +

  '    LAYOUTDESCONTO LOD  '                                                                        + #13 +
  '    ,PERFILINVEST  PI   '                                                                        + #13 +  // Andre Imakawa - SIG 67667
  '  WHERE '                                                                                        + #13 +

  '        HRS.IDHSTFOLHABENEF        IN (' + molVersaoPagto.Versoes + ') '                         + #13 +
  '    AND HRS.IDFAVORECIDO           = PFA.IDPESSOA '                                              + #13 +
  '    AND HRS.IDMODULO               = 18 '                                                        + #13 +
  '    AND HRS.IDRUBRICA              = PVD.IDPROVENTO '                                            + #13 +
  '    AND HRS.IDRUBRICA              = RXP.IDRUBRICA '                                             + #13 +
  '    AND HRS.IDPLANOPREV            = RXP.IDPLANOPREV '                                           + #13 +

  '    AND HRS.FLGDESCONTO            IN (0, 1) '                                                   + #13 +
  '    AND HRS.FLGESPECIAL            = 0 '                                                         + #13 +

  '    AND HRS.IDPATRO                = RXP.IDPESSJUR '                                             + #13 +
  '    AND HRS.FLGPENSAOALIM          = 0 '                                                         + #13 +
  '    AND HRS.FLGTIPODESC            IN (''C'',''Y'') '                                            + #13 +
  '    AND NVL(PFA.TIPO, ''F'')       = ''J'' '                                                     + #13 +
  '    AND LXC.IDFAVORECIDO           = HRS.IDFAVORECIDO '                                          + #13 +
  '    AND LXC.IDLAYOUT               = LOD.IDLAYOUT '                                              + #13 +
  '    AND NVL(LOD.FLGGERACPAGAR, 0)  = 1 '                                                         + #13 +
  '    AND NVL(LOD.FLGELETRONICO, 0)  = 0 '                                                         + #13 +

  '    AND HRS.IDPERFILINVEST = PI.IDPERFILINVEST '                                                 + #13 + // Andre Imakawa - SIG 67667

  '    AND EXISTS ( '                                                                               + #13 +
  '               SELECT 1 '                                                                        + #13 +
  '               FROM '                                                                            + #13 +
  '                 LAYOUTXCOLUNAS LCO, '                                                           + #13 +
  '                 LAYOUTDESCONTO LDO  '                                                           + #13 +
  '               WHERE '                                                                           + #13 +
  '                     LCO.IDFAVORECIDO           = HRS.IDFAVORECIDO '                             + #13 +
  '                 AND LDO.IDLAYOUT               = LCO.IDLAYOUT '                                 + #13 +
  '                 AND LDO.FLGGERACPAGAR          = 1 '                                            + #13 +
  '                 AND NVL(LDO.FLGELETRONICO, 0)  = 0 '                                            + #13 +
  '               ) '                                                                               + #13 +

  '  GROUP BY '                                                                                         + #13 +
  //'    HRS.IDPLANOCONTABIL, HRS.IDPATRO, PVD.FLGDESCONTO, NVL(RXP.CODTIPRECDESFAV, HRS.CODTIPRECDES), ' + #13 +  // Andre Imakawa - SIG 67667
  '    PI.IDPLANPREVCONTAB, HRS.IDPATRO, PVD.FLGDESCONTO, NVL(RXP.CODTIPRECDESFAV, HRS.CODTIPRECDES), ' + #13 +    // Andre Imakawa - SIG 67667
  '    DECODE(HRS.FLGDESCONTO, 1, HRS.PLACONTAC, HRS.PLACONTAD), HRS.IDFAVORECIDO, PFA.NOME, '          + #13 +
  '    RXP.UNIDNEGOC, RXP.CODCENTRORESPON, LOD.CODPORTFORMAFAV '                                        + #13 +
  '  ) '                                                                                                + #13 +

  'GROUP BY '                                                                                     + #13 +
  '  IDPLANOCONTABIL, IDPATRO, IDFAVORECIDO, NOME, CODTIPRECDESFAV, PLACONTA, UNIDNEGOC, '        + #13 +
  '  CODCENTRORESPON, CODPORTFORMA '                                                              + #13 +

  'ORDER '                                                                                        + #13 +
  '  BY IDFAVORECIDO '                                                                            + #13;

  // -----------------------------------------------------------------------------------------------

  cdsRateioSemArquivo.Close;
  sqlRateioSemArquivo.SQL.Clear;
  sqlRateioSemArquivo.SQL.Text := sSQL;
  sqlRateioSemArquivo.Open;

  // -----------------------------------------------------------------------------------------------

  // Itera pelo dataset calculando o valor de desconto para cada linha, e atualizando o dataset

  fVlrRateioSemDoc := 0;

  cdsRateioSemArquivo.DisableControls;
  cdsRateioSemArquivo.First;

  while not(cdsRateioSemArquivo.EOF) do
  begin
    fVlrRateioSemDoc := fVlrRateioSemDoc + cdsRateioSemArquivo.FieldByName('VALOR').AsCurrency;

    cdsRateioSemArquivo.Next;
  end;

  cdsRateioSemArquivo.EnableControls;
  cdsRateioSemArquivo.First;

  // -----------------------------------------------------------------------------------------------

  lblTotalSemArquivo.Caption := 'Valor total:  ' + FormatFloat('#,#0.00', fVlrRateioSemDoc);

  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmExecGeraDocConvenio.btnConfirmarClick(Sender: TObject);
var
  sMsg          : String;

  bChkArquivo   : Boolean;
  bChkComArq    : Boolean;
  bChkSemArq    : Boolean;

  bExisteDocArq : Boolean;

  bErroArquivo  : Boolean;
  bErroComArq   : Boolean;
  bErroSemArq   : Boolean;
  iCodDocumento : Integer;
begin
  bChkArquivo   := chkGravaArquivo.Checked;
  bChkComArq    := chkGeraDocComArquivo.Checked;
  bChkSemArq    := chkGeraDocSemArquivo.Checked;

  if (not(bChkComArq)) and  (not(bChkSemArq)) then
  begin
    MsgDlg('Necessário selecionar ao menos uma opção de geração.', Sistema.NomeModulo, mtInformation, [mbOk], 0);
    Exit;
  end;

  bExisteDocArq := False;

  bErroArquivo  := False;
  bErroComArq   := False;
  bErroSemArq   := False;
  iCodDocumento := 0;
  try
    // ---------------------------------------------------------------------------------------------

    if chkGeraDocComArquivo.Checked then
    begin
      if not(VerificaPlanoPatro) then Abort;
    end;


    // ---------------------------------------------------------------------------------------------

    if (chkGeraDocComArquivo.Checked) or (chkGeraDocSemArquivo.Checked) then
    begin
      StartTransacao;

      // -------------------------------------------------------------------------------------------

      if chkGeraDocComArquivo.Checked then
      begin
        if not(ExisteDocArq) then
        begin
          CtrlDocumento := TCtrlDocumento.Create;
          CtrlDocumento.Initialize(dtmBaseDados.dbBaseDados,
                                   True,
                                   Sistema.ConnectionType,
                                   Sistema.ConnectionSide,
                                   Sistema.AppRemoteServer,
                                   True
                                  );

          CtrlDocumento.OpenTransaction := False;

          try
            if not(GeraDocumentoComArquivo(iCodDocumento)) then
            begin
              bErroComArq := True;
              RollBackTransacao;
              Exit;
            end;
          finally
            CtrlDocumento.Free;
          end;

          try
            CtrlIntBanco := TCtrlIntBanco.Create;
            CtrlIntBanco.Initialize(dtmBaseDados.DbBaseDados,
                                     True,
                                     Sistema.ConnectionType,
                                     Sistema.ConnectionSide,
                                     Sistema.AppRemoteServer,
                                     True,
                                     MsgErro
                                    );

            try
              if not(GeraArquivo(iCodDocumento)) then bErroArquivo := True;
            except
              bErroArquivo := True;
            end;

          finally
            CtrlIntBanco.Free;
          end;

        end
        else
        begin
          bExisteDocArq := True;
        end;
      end;

      // -------------------------------------------------------------------------------------------

      if chkGeraDocSemArquivo.Checked then
      begin
        try
          Documento := TDocumento.Create;
          if not(GeraDocumentoSemArquivo) then
          begin
            bErroSemArq := True;
            RollBackTransacao;
            Exit;
          end;
        finally
          Documento.Free;
        end;
      end;

      //CommitTransacao;
    end;

     // ---------------------------------------------------------------------------------------------


    if (bErroArquivo) or (bExisteDocArq)  or (bErroComArq) then
      RollBackTransacao
    else
      CommitTransacao;
    // ---------------------------------------------------------------------------------------------

  finally

    sMsg := '';

    // ---------------------------------------------------------------------------------------------

    if not(bChkArquivo) then
    begin
      sMsg := sMsg + '- Não foi selecionada a geração de arquivo de remessa' + #13 + #13;
    end
    else
    begin
      if bErroArquivo then
      begin
        sMsg := sMsg + '- ERRO na geração do arquivo de remessa' + #13 + #13;
      end;
      {
      else
      begin
        sMsg := sMsg + '- Arquivo de remessa gerado ' + #13 + #13;
      end;
      }
    end;

    // ---------------------------------------------------------------------------------------------

    if not(bChkComArq) then
    begin
      sMsg := sMsg + '- Não foi selecionada a geração de "documento com arquivo"' + #13 + #13;
    end
    else
    begin
      if bExisteDocArq then
      begin
        sMsg := sMsg + '- Já existe "documento com arquivo" referente a alguma das versões da Folha selecionda(s)' + #13 + #13;
      end
      else
      begin
        if bErroComArq then
        begin
          sMsg := sMsg + '- ERRO na geração de "documento com arquivo"' + #13 + #13;
        end
        else
        begin
          sMsg := sMsg + '- "Documento com arquivo" gerado' + #13 + #13;
        end;
      end;
    end;

    // ---------------------------------------------------------------------------------------------

    if not(bChkSemArq) then
    begin
      sMsg := sMsg + '- Não foi selecionada a geração de "documento sem arquivo"' + #13 + #13;
    end
    else
    begin
      if bErroSemArq then
      begin
        sMsg := sMsg + '- ERRO na geração de "documento sem arquivo"' + #13 + #13;
      end
      else
      begin
          sMsg := sMsg + '- "Documento sem arquivo" gerado' + #13 + #13;
      end;
    end;

    // ---------------------------------------------------------------------------------------------

    MsgDlg(sMsg, Sistema.NomeModulo, mtInformation, [mbOk], 0);
    Repaint;

    IrParaPagina(0);

    Repaint;
    inherited;
  end;
end;



function TfrmExecGeraDocConvenio.GeraArquivo(pCodDocumento: Integer): Boolean;
var
  sPathArquivoRem : String;
  sFlgArquivo: string;
begin
  try
    try
      sFlgArquivo := cdsListaArquivo.FieldByName('FLGARQUIVO').AsString;
      if sFlgArquivo = 'N' Then
      begin
        with qryPortadorForma do
        begin
          Close;
          if not(Prepared) then Prepare;
          ParamByName('PCODPORTFORMA').AsInteger := cdsListaArquivo.FieldByName('CODPORTFORMA').AsInteger;
          Open;
        end;

        CtrlIntBanco.FechaQryTexto := True;

        if chkGravaArquivo.Checked then
        begin

             sPathArquivoRem := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa); // ExtractFilePath(Application.ExeName);
           //sPathArquivoRem := 'C:\'; // ExtractFilePath(Application.ExeName);

          if qryPortadorForma.FieldByName('PATHARQUIVOREM').AsString <> '' then
          begin
            sPathArquivoRem := qryPortadorForma.FieldByName('PATHARQUIVOREM').AsString;
          end;

          CtrlIntBanco.IndiceDoBanco := qryPortadorForma.FieldByName('CODARQUIVOREMESSA').AsInteger;

          If Not dtmBaseDados.dbBaseDados.InTransaction Then
            StartTransacao;

          if CtrlIntBanco.VerficaDadosEmpresa('P', qryPortadorForma.FieldByName('CODPORTFORMA').AsInteger) then
          begin
            if CtrlIntBanco.ValidaRemessa('P', cdsListaArquivo.Data, False) then
            begin
              frmAguarde.Apaga;

              CtrlIntBanco.ExibeArquivoGerado := False;
              CtrlIntBanco.IdentficaOrigem    := '18';
              CtrlIntBanco.DataPagamento      := edtPrevisaoPagto.Text;

              CtrlIntBanco.MontaPagamentoEletronico(qryPortadorForma.FieldByName('CODARQUIVOREMESSA').AsInteger,
                                                    qryPortadorForma.FieldByName('CONTROLEREMESSA').AsInteger,
                                                    cdsListaArquivo.Data,
                                                    sPathArquivoRem
                                                   );

              //CommitTransacao;
              Result := True;
            end
            else
            begin
              //RollbackTransacao;
              Result := False;
              MsgDlg('Erro no processo de geração do Arquivo de Remessa de Pagamento.', Sistema.NomeModulo, mtError, [mbOk, mbHelp], 0);
            end;
          end;
        end;
      end
      else
      begin

        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          StartTransacao;
        if GeraArquivoPagamentoleiauteCNAB240(pCodDocumento) then
          Result := True
        else
          Result := False;

      end;

    except
      on E:Exception do
      begin
        //RollbackTransacao;
        Result := False;
        MsgDlg('Erro no processo de geração do Arquivo de Remessa de Pagamento:' + E.Message, Sistema.NomeModulo, mtError, [mbOk, mbHelp], 0);
        Repaint;
      end;
    end;

  finally
    frmAguarde.Apaga;
  end;
end;



function TfrmExecGeraDocConvenio.GeraDocumentoComArquivo(var pCodDocumento: Integer): Boolean;
var
  iPlnCodigo    : Integer;
  iCodDocumento : Integer;
  iRateioDocum  : Integer;
  iNumLancto    : Integer;
  i, j, y, z    : Integer;
  fValor        : Currency;
  bAchou        : boolean;
  vContaBaixa   : array of TContaBaixa;
  vConvRateio   : array of TConvRateio;
begin
  Result := False;

  try
    CtrlDocumento.Prepare(OpDocumento, odlEfetivo);

    CtrlDocumento.IdEspAcesso     := Sistema.IdEspAcesso;
    CtrlDocumento.IdModulo        := Sistema.IDModulo;
    CtrlDocumento.IdUsuario       := Sistema.IDUsuario;

    // Gerar codigo do documento
    iCodDocumento   := CtrlDocumento.GetSequenceDocumento;
    iRateioDocum    := 0;
    iPlnCodigo      := 0;
    fValor          := 0;

    // ---------------------------------------------------------------------------------------------

    with qryPortadorForma do
    begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('PCODPORTFORMA').AsInteger := cdsListaArquivo.FieldByName('CODPORTFORMA').AsInteger;
      Open;
    end;

    if iCodDocumento <= 0 then
    begin
      MsgDlg('Erro ao Gerar código do Documento', Sistema.NomeModulo, mtError, [mbOk], 0);
      Repaint;
      Result := False;
      Exit;
    end;
    pCodDocumento := iCodDocumento; // Andre Imakawa - SIG 60540
    // ---------------------------------------------------------------------------------------------

    CtrlDocumento.SetValues(iCodDocumento,                                          // liCodDocumento
                            StrToFloat(FloatToStr(Date) + '752961'),                // fNumDoc,   // rNoDocumento
                            '',                                                     // sComplemento
                            '0',                                                    // sStatus
                            'P',                                                    // sRecPag
                            '2',                                                    // sOperacao
                            '',                                                     // sNumSlip
                            '',                                                     // sNumLeitCodBarras
                            '',                                                     // sPlaConta (conta de baixa)
                            '',                                                     // sCodCentroCusto
                            '',                                                     // sNossoNumero
                            '',                                                     // sNumDigCodBarras
                            '',                                                     // sGrupoDoc
                            '',                                                     // sFlgEmiteLancBaix
                            '',                                                     // sFlgConfirmaRecPag
                            'N',                                                    // sEmisBloq
                            '',                                                     // sReferencia,
                            '',                                                     // sObs
                            edtPrevisaoPagto.Date,                                  // dDataVencto
                            Date,                                                   // dDataEmissao
                            edtPrevisaoPagto.Date,                                  // dDataProgramada
                            0,                                                      // dDataRemessa
                            0,                                                      // dDataLimite
                            0,                                                      // dDataCorrecao
                            0,                                                      // rVlrMulta
                            0,                                                      // rVlrJuros
                            0,                                                      // rVlrDesconto
                            0,                                                      // rPercJurosSimples
                            0,                                                      // rPercJurosAturalial
                            StrToInt(prmCodTipDoc),                                 // liCodTipDoc
                            Sistema.IDEmpresa,                                      // liIDPessoa
                            18,                                                     // liIDModulo
                            752961,                                                 // liIDForCli
                            0,                                                      // liNumFatura
                            -1,                                                     // liIDCBancaria
                            0,                                                      // liUnidNegoc
                            IntegraBack.Plano,                                      // liPlano
                            0,                                                      // liNumcpbaixa,
                            0,                                                      // liNumapgr,
                            0,                                                      // liMoecodigo,
                            0,                                                      // liLotetransmissao,
                            0,                                                      // liIndicecorrecao,
                            Sistema.Idusuario,                                      // liIdusuarioinclusao,
                            Sistema.IdEmpresa,                                      // liIdempresa,
                            0,                                                      // liFlgnaoconciliado,
                            0,                                                      // liControleremessa,
                            0,                                                      // liCodsubconta,
                            qryPortadorForma.FieldByName('CODPORTFORMA').AsInteger, // liCodportforma,
                            0,                                                      // liCodgrupocnab,
                            0,                                                      // liCodgeradorinss,
                            qryPortadorForma.FieldByName('CODFORMA').AsInteger      // liCodForma
                           );

    // ---------------------------------------------------------------------------------------------

    j := 0;

    cdsRateio.First;
    while not(cdsRateio.EOF) do
    begin
      // -------------------------------------------------------------------------------------------

      // Insere registros no vetor que posteriormente será usado para fazer insert na ProConvRateio

      inc(j);
      SetLength(vConvRateio, j);

      vConvRateio[j-1].IDPatro          := cdsRateio.FieldByName('IDPATRO').AsInteger;
      vConvRateio[j-1].IDPlanPrevContab := cdsRateio.FieldByName('IDPLANOCONTABIL').AsInteger;
      vConvRateio[j-1].IDFavorecido     := cdsRateio.FieldByName('IDFAVORECIDO').AsInteger;
      vConvRateio[j-1].IDLayout         := cdsRateio.FieldByName('IDLAYOUT').AsInteger;
      vConvRateio[j-1].sTipoRecebDesemb := cdsRateio.FieldByName('CODTIPRECDESFAV').AsString;
      vConvRateio[j-1].fValorRateio     := cdsRateio.FieldByName('VALOR').AsCurrency;

      // -------------------------------------------------------------------------------------------

      CtrlDocumento.RateioDocum.SetValues(cdsRateio.FieldByName('VALOR').AsCurrency,          // rValor
                                          0,                                                  // rValorOM
                                          0,                                                  // rVlrResOrcamen
                                          iRateioDocum,                                       // liIDRateioDocum
                                          Sistema.IDEmpresa,                                  // liIDEmpresa
                                          iCodDocumento,                                      // liCodDocumento
                                          cdsRateio.FieldByName('UNIDNEGOC').AsInteger,       // liUnidNegoc
                                          -1,                                                 // liMoeCodigo
                                          Sistema.IdUsuario,                                  // liIDUsuarioInclusao
                                          -1,                                                 // liIDReservaOrcamen
                                          IntegraBack.Plano,                                  // liPlano
                                          cdsRateio.FieldByName('IDPLANOCONTABIL').AsInteger, // liIDPlanoPrev
                                          cdsRateio.FieldByName('IDPATRO').AsInteger,         // liIDPatro
                                          SistemaFolha.IdProgramaFolha,                       // liIDPrograma
                                          0,                                                  // liIDprocesso,
                                          Sistema.IDEmpresa,                                  // liIDEmpresa
                                          cdsRateio.FieldByName('CODTIPRECDESFAV').AsString,  // sCodTipRecDes
                                          'P',                                                // sRecPag
                                          cdsRateio.FieldByName('CODCENTRORESPON').AsString,  // sCodCentroRespon
                                          SistemaFolha.CODCCUSTOFINAN,                        // sCodCentroCusto
                                          ''                                                  // sNumImovel
                                         );

      // Se houver desconto, lança uma nova linha na RateioDocum a partir do mesmo registro
      if cdsRateio.FieldByName('DESCONTO').AsCurrency > 0 then
      begin
        // -----------------------------------------------------------------------------------------

        // Insere registros no vetor que posteriormente será usado para fazer insert na ProConvRateio

        inc(j);
        SetLength(vConvRateio, j);

        vConvRateio[j-1].IDPatro          := cdsRateio.FieldByName('IDPATRO').AsInteger;
        vConvRateio[j-1].IDPlanPrevContab := cdsRateio.FieldByName('IDPLANOCONTABIL').AsInteger;
        vConvRateio[j-1].IDFavorecido     := cdsRateio.FieldByName('IDFAVORECIDO').AsInteger;
        vConvRateio[j-1].IDLayout         := cdsRateio.FieldByName('IDLAYOUT').AsInteger;
        vConvRateio[j-1].sTipoRecebDesemb := cdsRateio.FieldByName('CODTIPRECDES').AsString;
        vConvRateio[j-1].fValorRateio     := cdsRateio.FieldByName('DESCONTO').AsCurrency * (-1);

        // -----------------------------------------------------------------------------------------

        CtrlDocumento.RateioDocum.SetValues(cdsRateio.FieldByName('DESCONTO').AsCurrency * (-1),  // rValor
                                            0,                                                    // rValorOM
                                            0,                                                    // rVlrResOrcamen
                                            iRateioDocum,                                         // liIDRateioDocum
                                            Sistema.IDEmpresa,                                    // liIDEmpresa
                                            iCodDocumento,                                        // liCodDocumento
                                            cdsRateio.FieldByName('UNIDNEGOC').AsInteger,         // liUnidNegoc
                                            -1,                                                   // liMoeCodigo
                                            Sistema.IdUsuario,                                    // liIDUsuarioInclusao
                                            -1,                                                   // liIDReservaOrcamen
                                            IntegraBack.Plano,                                    // liPlano
                                            cdsRateio.FieldByName('IDPLANOCONTABIL').AsInteger,   // liIDPlanoPrev
                                            cdsRateio.FieldByName('IDPATRO').AsInteger,           // liIDPatro
                                            SistemaFolha.IdProgramaFolha,                         // liIDPrograma
                                            0,                                                    // liIDprocesso,
                                            Sistema.IDEmpresa,                                    // liIDEmpresa
                                            cdsRateio.FieldByName('CODTIPRECDES').AsString,       // sCodTipRecDes
                                            'P',                                                  // sRecPag
                                            cdsRateio.FieldByName('CODCENTRORESPON').AsString,    // sCodCentroRespon
                                            SistemaFolha.CODCCUSTOFINAN,                          // sCodCentroCusto
                                            ''                                                    // sNumImovel
                                           );
      end;

      // -------------------------------------------------------------------------------------------

      // Tratamento de múltiplas contas de baixa

      bAchou := False;

      // A cada registro, verifica se o conjunto de parâmetros já existe no vetor; se existir, acumula
      // o valor; se não, cria um novo elemento no vetor
      for y := 0 to length(vContaBaixa) - 1 do
      begin
        if not(bAchou) and
           (vContaBaixa[y].sConta     = cdsRateio.FieldByName('PLACONTA').AsString) and
           (vContaBaixa[y].iPatro     = cdsRateio.FieldByName('IDPATRO').AsInteger) and
           (vContaBaixa[y].iUnidNegoc = cdsRateio.FieldByName('UNIDNEGOC').AsInteger) and
           (vContaBaixa[y].iPlanoPrev = cdsRateio.FieldByName('IDPLANOCONTABIL').AsInteger) then
        begin
          vContaBaixa[y].fValor := vContaBaixa[y].fValor + cdsRateio.FieldByName('VALOR').AsCurrency;
          bAchou                := True;
        end;
      end;

      if {(y >= (length(vContaBaixa) - 1)) and} not(bAchou) then
      begin
        z := length(vContaBaixa) + 1;
        SetLength(vContaBaixa, z);

        vContaBaixa[z - 1].sConta      := cdsRateio.FieldByName('PLACONTA').AsString;
        vContaBaixa[z - 1].fValor      := cdsRateio.FieldByName('VALOR').AsCurrency;
        vContaBaixa[z - 1].iPatro      := cdsRateio.FieldByName('IDPATRO').AsInteger;
        vContaBaixa[z - 1].iUnidNegoc  := cdsRateio.FieldByName('UNIDNEGOC').AsInteger;
        vContaBaixa[z - 1].iPlanoPrev  := cdsRateio.FieldByName('IDPLANOCONTABIL').AsInteger;
      end;


      // Se houver desconto, faz o mesmo, com 2 ressalvas: o valor é negativo e a conta de baixa é outra
      if cdsRateio.FieldByName('DESCONTO').AsCurrency > 0 then
      begin
        bAchou := False;

        for y := 0 to length(vContaBaixa) - 1 do
        begin
           if  not(bAchou) and
              (vContaBaixa[y].sConta     = cdsRateio.FieldByName('PLACONTABAIXA').AsString) and
              (vContaBaixa[y].iPatro     = cdsRateio.FieldByName('IDPATRO').AsInteger) and
              (vContaBaixa[y].iUnidNegoc = cdsRateio.FieldByName('UNIDNEGOC').AsInteger) and
              (vContaBaixa[y].iPlanoPrev = cdsRateio.FieldByName('IDPLANOCONTABIL').AsInteger) then
           begin
             vContaBaixa[y].fValor := vContaBaixa[y].fValor - cdsRateio.FieldByName('DESCONTO').AsCurrency;
             bAchou                := True;
           end;
        end;

        if {y >= (length(vContaBaixa) - 1)} not(bAchou) then
        begin
          z := length(vContaBaixa) + 1;
          SetLength(vContaBaixa, z);

          vContaBaixa[z - 1].sConta      := cdsRateio.FieldByName('PLACONTABAIXA').AsString;
          vContaBaixa[z - 1].fValor      := cdsRateio.FieldByName('DESCONTO').AsCurrency * (-1);
          vContaBaixa[z - 1].iPatro      := cdsRateio.FieldByName('IDPATRO').AsInteger;
          vContaBaixa[z - 1].iUnidNegoc  := cdsRateio.FieldByName('UNIDNEGOC').AsInteger;
          vContaBaixa[z - 1].iPlanoPrev  := cdsRateio.FieldByName('IDPLANOCONTABIL').AsInteger;
        end;
      end;

      cdsRateio.Next;
    end;

    // ---------------------------------------------------------------------------------------------

    // Lança as contas de baixa no documento
    for y := 0 to length(vContaBaixa) - 1 do
    begin
      CtrlDocumento.CCBaixasXDocum.SetValues(vContaBaixa[y].fValor,        //
                                             0,                            // liIDCcBaixasXDocum
                                             Sistema.IDEmpresa,            // liIDPessos
                                             iCodDocumento,                // liCodDocumento
                                             vContaBaixa[y].iUnidNegoc,    // liUnidNegoc
                                             IntegraBack.Plano,            // liPlano
                                             vContaBaixa[y].iPlanoPrev,    // liIDPlanoPrev
                                             vContaBaixa[y].iPatro,        // liIDPatro
                                             -1,                           // liIDSegregaCriter
                                             vContaBaixa[y].sConta         // sPlaConta
                                            );
    end;

    // Limpa o vetor de contas
    SetLength(vContaBaixa, 0);

    // ---------------------------------------------------------------------------------------------

    CtrlDocumento.Lanctodocum.SetValues(Date,                                   // dDataLancto
                                        iCodDocumento,                          // liCodDocumento
                                        0,                                      // liNumLancto
                                        (fVlrRateioComDoc - fTotalDesconto),    // rVlrLiquido
                                        0,                                      // rValorOM
                                        (fVlrRateioComDoc - fTotalDesconto),    // rValor
                                        -1,                                     // liUnidNegoc
                                        iPlnCodigo,                             // liPlnCodigo
                                        0,                                      // liNumlotemanual,
                                        Sistema.IDusuario,                      // liIdusuarioinclusao,
                                        Sistema.IDEmpresa,                      // liIdempresa,
                                        0,                                      // liIdnflivro,
                                        0,                                      // liEstorno,
                                        0,                                      // liCodtipdoc,
                                        0,                                      // liCoddocinss,
                                        0,                                      // liCodalterador
                                        '2',                                    // sOperacao,
                                        '',                                     // sNumrecibo,
                                        '',                                     // sNumnf,
                                        '',                                     // sNumfatura,
                                        'Pagamento de Consignação',             // sHistoricocompl,
                                        '',                                     // sFlgtipofatura,
                                        '',                                     // sFlgrecebeunf,
                                        '',                                     // sFlgfatemitida,
                                        'C',                                    // DebCre
                                        15,                                     // liIdModulo
                                        IntegraBack.Plano,                      // liPlanoConta
                                        True                                    // bUsaPlanoPatro
                                       );

    // ---------------------------------------------------------------------------------------------

    if not(CtrlDocumento.Insert) then
    begin
      MsgDlg('Erro na geração do Documento: ' + CtrlDocumento.MessageInfo, Sistema.NomeModulo, mtError, [mbOk], 0);
      Repaint;
      Result := False;
      Exit;
    end;

    // ---------------------------------------------------------------------------------------------

    // Por causa da constraint com a tabela Documento, os inserts na ProcConvenioDoc e ProConvRateio
    // só pode ser feito aqui, após a criação do Documento

    if not(GravaProcessoConvenio(iCodDocumento,
                                 vConvRateio
                                )) then
    begin
      Result := False;
      // André Pontes - pendência 20840 (reabertura)
      MsgDlg('Erro na gravação do Processo do Convênio', Sistema.NomeModulo, mtError, [mbOk], 0);
      Repaint;
      Exit;
    end;

  except
    on E: exception do
    begin
      Result := False;
      // André Pontes - pendência 20840 (reabertura)
      MsgDlg('Erro no processo de geração de Documento COM Arquivo: ' + E.message, Sistema.NomeModulo, mtError, [mbOk], 0);
      Repaint;
      Exit;
    end;
  end;

  // -----------------------------------------------------------------------------------------------

  Result := True;

  // -----------------------------------------------------------------------------------------------
end;




function TfrmExecGeraDocConvenio.GravaProcessoConvenio(const iCodDocumento  : Integer;
                                                             vConvRateio    : array of TConvRateio
                                                      ): Boolean;
var
  i             : Integer;
  iProcConvenio : Integer;
  iProcRateio   : Integer;
  iVersaoPagto  : Integer;
  sListaVersoes : TStringList;
begin
  Result := False;

  // -----------------------------------------------------------------------------------------------

  // Gravação da PROCCONVENIODOC
  try
    iProcConvenio := LeUltRegistro(nil, 'PROCCONVENIODOC');
  except
    ShowMessage('Erro ao incrementar sequence');
  end;

  with qryInsertProcConvenioDoc do
  begin
    Close;
    if not(Prepared) then Prepare;

    ParamByName('PIDPROCCONV').AsInteger      := iProcConvenio;
    ParamByName('PIDFUNDACAO').AsInteger      := Sistema.IDEmpresa;
    ParamByName('PIDFAVORECIDO').AsInteger    := 752961;
    ParamByName('PCODDOCUMENTO').AsInteger    := iCodDocumento;
    ParamByName('PDATAPAGAMENTO').AsDateTime  := edtPrevisaoPagto.Date;
    ParamByName('PVALORLIQUIDO').AsCurrency   := (fVlrRateioComDoc - fTotalDesconto);
    ParamByName('PVALOREFETIVO').AsCurrency   := (fVlrRateioComDoc - fTotalDesconto);
    ParamByName('PRECPAG').AsString           := 'P';

    try
      ExecSQL;
    except
      MsgDlg('Erro ao inserir na PROCCONVENIODOC', Sistema.NomeModulo, mtError, [mbOk], 0);
      Repaint;
      Exit;
    end;
  end;

  // -----------------------------------------------------------------------------------------------

  // Gravação da PROCONVRATEIO (a partir do vetor criado anteriormente)
  for i := 0 to length(vConvRateio) - 1 do
  begin
    iProcRateio := LeUltRegistro(nil, 'PROCONVRATEIO');

    with qryInsertProcConvRateio do
    begin
      Close;
      if not(Prepared) then Prepare;

      ParamByName('PIDPROCCONVRATEIO').AsInteger    := iProcRateio;
      ParamByName('PIDPATRO').AsInteger             := vConvRateio[i].IDPatro;
      ParamByName('PIDEMPRESAPROP').AsInteger       := Sistema.IDEmpresa;
      ParamByName('PRECPAG').AsString               := 'P';
      ParamByName('PCODTIPRECDES').AsString         := vConvRateio[i].sTipoRecebDesemb;
      ParamByName('PIDPLANPREVCONTABIL').AsInteger  := vConvRateio[i].IDPlanPrevContab;
      ParamByName('PIDPROCCONV').AsInteger          := iProcConvenio;
      ParamByName('PCODDOCUMENTO').AsInteger        := iCodDocumento;
      ParamByName('PIDFUNDACAO').AsInteger          := Sistema.IDEmpresa;
      ParamByName('PVALOR').AsCurrency              := vConvRateio[i].fValorRateio;

      // André Pontes - pendência 27078 - 08/01/2008
      ParamByName('PIDFAVORECIDO').AsInteger        := 752961;
      ParamByName('PIDFAVRATEIO').AsInteger         := vConvRateio[i].IDFavorecido;

      // André Pontes - pendência 20840 (reabertura)
      // retirada do parâmetro abaixo
//      ParamByName('PIDLAYOUT').AsInteger            := vConvRateio[i].IDLayout;

      try
        ExecSQL;
      except
        MsgDlg('Erro ao inserir na PROCONVRATEIO', Sistema.NomeModulo, mtError, [mbOk], 0);
        Repaint;
        Exit;
      end;  // try..except
    end;  // with qryInsertProcConvRateio
  end;  // for i := 0 to length(vConvRateio) - 1

  // -----------------------------------------------------------------------------------------------

  // Gravação da CONVDOCXVERSAO
  sListaVersoes := TStringList.Create;

  try
    sListaVersoes.AddStrings(molVersaoPagto.Lista);

    for i := 0 to sListaVersoes.Count - 1 do
    begin
      iVersaoPagto := StrToInt(sListaVersoes.Strings[i]);

      with qryInsertConvDocXVersao do
      begin
        Close;
        if not(Prepared) then Prepare;

        ParamByName('PCODDOCUMENTO').AsInteger    := iCodDocumento;
        ParamByName('PIDHSTFOLHABENEF').AsInteger := iVersaoPagto;

        try
          ExecSQL;
        except
          MsgDlg('Erro ao inserir na CONVDOCXVERSAO', Sistema.NomeModulo, mtError, [mbOk], 0);
          Repaint;
          Exit;
        end;  // try..except
      end;  // with qryInsertProcConvRateio
    end;  // for i := 0 to length(vConvRateio) - 1
  finally
    FreeAndNil(sListaVersoes);
  end;

  Result := True;

  // -----------------------------------------------------------------------------------------------
end;



function TfrmExecGeraDocConvenio.GeraDocumentoSemArquivo: Boolean;
var
  iPlnCodigo    : Integer;
  i             : Integer;
  iCodDocumento : Integer;
  iCodPortForma : Integer;
  iFavorecido   : Integer;
  iNumLancto    : Integer;
  sListaFav     : TStringList;
  sNome         : String;
  fValor        : Currency;
begin
  Result          := False;
  iPlnCodigo      := 0;
  iCodDocumento   := Documento.GetCodigo(qryAux);
  sListaFav       := TStringList.Create;
  iFavorecido     := 0;
  fValor          := 0;
  sNome           := '';
  iCodPortForma   := 0;

  cdsRateioSemArquivo.First;
  while not(cdsRateioSemArquivo.EOF) do
  begin
    if (iFavorecido <> cdsRateioSemArquivo.FieldByName('IDFAVORECIDO').AsInteger) then
    begin
      if iFavorecido <> 0 then
      begin
        // André Pontes - pendência 27424 - 19/02/2008 - revertido para FloatToStr
        sListaFav.Add(IntToStr(iFavorecido) + ';' + FloatToStr(fValor) + ';' + sNome + ';' + IntToStr(iCodPortForma));
      end;

      fValor        := 0;
      iFavorecido   := cdsRateioSemArquivo.FieldByName('IDFAVORECIDO').AsInteger;
      iCodPortForma := cdsRateioSemArquivo.FieldByName('CODPORTFORMA').AsInteger;
    end;

    try
      fValor  := fValor + cdsRateioSemArquivo.FieldByName('VALOR').AsFloat;
      sNome   := cdsRateioSemArquivo.FieldByName('NOME').AsString;
    except
    end;
    cdsRateioSemArquivo.next;
  end;

  if iFavorecido <> 0 then
  begin
    // André Pontes - pendência 27424 - 19/02/2008 - revertido para FloatToStr
    sListaFav.Add(IntToStr(iFavorecido)+ ';' + FloatToStr(fValor)+ ';' + sNome + ';' + IntToStr(iCodPortForma));
  end;

  for i := 0 to (sListaFav.Count - 1) do
  begin
    try
      iFavorecido := StrToInt(Piece(sListaFav[i], ';', 1));
    except
    end;

    sNome := Piece(sListaFav[i], ';', 3);
    try
      fValor := StrToFloat(Piece(sListaFav[i], ';', 2));
    except
    end;

    try
      iCodPortForma := StrToInt(Piece(sListaFav[i], ';', 4));
    except
    end;

    with qryPortadorForma do
    begin
      Close;
      if not(Prepared) then Prepare;
      ParamByName('PCODPORTFORMA').AsInteger := iCodPortForma; // cdsListaArquivo.FieldByName('CODPORTFORMA').AsInteger;
      Open;
    end;

    if (iFavorecido > 0) and (fValor > 0) then
    begin
      iCodDocumento := Documento.GetCodigo(qryAux);
      if iCodDocumento > 0 then
      begin
        cdsRateioSemArquivo.First;

        // -----------------------------------------------------------------------------------------

        Documento.Inserir(qryAux,
                          iCodDocumento,
                          IntToStr(Sistema.IdModulo),
                          IntToStr(IntegraBack.Plano),
                          cdsRateioSemArquivo.FieldByName('PLACONTA').AsString,
                          '', // sCCustoCliFor
                          -1, // iMoeCodigo (nao é em outra moeda)
                          -1,
                          Sistema.IdEmpresa,
                          iFavorecido, // IdForCli
                          StrToInt(prmCodTipDoc),
                          qryPortadorForma.FieldByName('CODPORTFORMA').AsInteger,
                          'P', // recpag
                          StrtoFloat(floattostr(date)+IntToStr(iFavorecido)),
                          '',
                          FormatDateTime('DD/MM/YYYY', date), // DataEmissao
                          FormatDateTime('dd/mm/yyyy', edtPrevisaoPagto.date),
                          FormatDateTime('dd/mm/yyyy', edtPrevisaoPagto.date),
                          '0', // sStatus
                          -1,  // iNumFatura
                          '2', // sOperacao
                          Sistema.IdUsuario,
                          -1,
                          qryPortadorForma.FieldByName('CODFORMA').AsInteger,
                          '',
                          '',
                          False,
                          0,
                          0,
                          0
                         );

        // -----------------------------------------------------------------------------------------

        iNumLancto := Documento.GerarNumLancto(qryAux, iCodDocumento);
        if iNumLancto > 0 then
        begin
          Documento.CriarLanctoDoc(qryAux,
                                   iCodDocumento,
                                   iNumLancto,
                                   -1,
                                   iplncodigo,
                                   FormatDateTime('dd/mm/yyyy', date),
                                   fValor,
                                   0,
                                   -1,
                                   'C',
                                   '2', // sOperacao
                                   copy('Pagto Consig ' + sNome, 1, 60),
                                   Sistema.IdUsuario,
                                   False,
                                   qryPortadorForma.FieldByName('CODPORTFORMA').AsInteger,
                                   ''
                                  );

          // ---------------------------------------------------------------------------------------

          while not(cdsRateioSemArquivo.EOF) do
          begin
            if (iFavorecido = cdsRateioSemArquivo.FieldByName('IDFAVORECIDO').AsInteger) then
            begin
              Documento.Rateio.Inserir(
                iCodDocumento,
                cdsRateioSemArquivo.FieldByName('CODTIPRECDESFAV').AsString,
                'P',
                cdsRateioSemArquivo.FieldByName('CODCENTRORESPON').AsString,
                Sistema.IdEmpresa,
                cdsRateioSemArquivo.FieldByName('VALOR').AsFloat,
                0,
                Sistema.IdUsuario,
                cdsRateioSemArquivo.FieldByName('UNIDNEGOC').AsInteger,
                -1,
                SistemaFolha.CODCCUSTOFINAN,
                cdsRateioSemArquivo.FieldByName('IDPATRO').AsInteger,
                SistemaFolha.IdProgramaFolha,
                cdsRateioSemArquivo.FieldByName('IDPLANOCONTABIL').AsInteger);
            end;

            cdsRateioSemArquivo.next;
          end;  // while not(cdsRateioSemArquivo.EOF) do
        end;  // if iNumLancto > 0
      end;  // if iCodDocumento > 0
    end;  // if (iFavorecido > 0) and (fValor > 0)
  end;

  sListaFav.free;

  Result := True;
end;



procedure TfrmExecGeraDocConvenio.MsgErro(sMsg: String);
begin
  ShowMessage(sMsg);
  Repaint;
end;



function TfrmExecGeraDocConvenio.ExisteDocArq: Boolean;
var
  sSQL : String;
begin
  sSQL :=
  'SELECT '                 + #13 +
  '  COUNT(*) AS VERSOES '  + #13 +
  'FROM '                   + #13 +
  '  CONVDOCXVERSAO '       + #13 +
  'WHERE '                  + #13 +
  '  IDHSTFOLHABENEF IN ('  + molVersaoPagto.Versoes + ') ';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Text := sSQL;
  qryAux.Open;

  Result := False;
  if qryAux.FieldByName('VERSOES').AsInteger > 0 then Result := True;

  qryAux.Close;
end;



function TfrmExecGeraDocConvenio.DocumentoUnico: Boolean;
var
  sSQL : String;
begin
  sSQL :=
  'SELECT '                                         + #13 +
  '  COUNT(DISTINCT(CODDOCUMENTO)) AS DOCUMENTOS '  + #13 +
  'FROM '                                           + #13 +
  '  CONVDOCXVERSAO '                               + #13 +
  'WHERE '                                          + #13 +
  '  IDHSTFOLHABENEF IN (' + molVersaoPagto.Versoes + ') ';

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Text := sSQL;
  qryAux.Open;

  Result := False;
  if qryAux.FieldByName('DOCUMENTOS').AsInteger = 1 then Result := True;

  qryAux.Close;
end;



procedure TfrmExecGeraDocConvenio.btnRelatorioClick(Sender: TObject);
begin
  if not(VerificaPreenchimentoRelat) then Exit;

  try
    MontaConsulta;
  except
    Screen.Cursor := crDefault;
    Raise;
    Repaint;
  end;
end;



procedure TfrmExecGeraDocConvenio.MontaConsulta;
begin
   inherited;

   FiltraRelatorio;
end;



procedure TfrmExecGeraDocConvenio.FiltraRelatorio;
var
  sSQL : String;
begin
  sSQL :=
  'SELECT '                                                     + #13 +
  '  PES.NOME AS FAVORECIDO, '                                  + #13;

  if rdgRelatorio.ItemIndex = 2 then sSQL := sSQL +
  '  PPC.NOME AS PLANO, PTR.NOME AS PATRO, '                    + #13 +
  '  TRD.DESCRICAO AS TIPODESEMB, '                             + #13;

  case rdgRelatorio.ItemIndex of
    0, 1: sSQL := sSQL + '  SUM(PCR.VALOR) AS VALOR '           + #13;
    2:    sSQL := sSQL + '  PCR.VALOR '                         + #13;
  end;

  sSQL := sSQL +
  'FROM '                                                       + #13 +
  '  PESSOA           PES, '                                    + #13 +
  '  PROCONVRATEIO    PCR, '                                    + #13 +
  '  PROCCONVENIODOC  PCD, '                                    + #13;

  if rdgRelatorio.ItemIndex = 2 then sSQL := sSQL +
  '  PLANPREVCONTABIL PPC, '                                    + #13 +
  '  PESSOA           PTR, '                                    + #13 +
  '  TIPORECEBDESEMB  TRD, '                                    + #13;

  sSQL := sSQL +
  '  ( '                                                        + #13 +
  '  SELECT DISTINCT '                                          + #13 +
  '    CODDOCUMENTO '                                           + #13 +
  '  FROM '                                                     + #13 +
  '    CONVDOCXVERSAO '                                         + #13 +
  '  WHERE '                                                    + #13 +
  '    IDHSTFOLHABENEF IN (' + molVersaoPagto.Versoes + ') '    + #13 +
  '  ) CXV '                                                    + #13 +

  'WHERE '                                                      + #13 +
  '      CXV.CODDOCUMENTO       = PCD.CODDOCUMENTO '            + #13 +
  '  AND PCD.CODDOCUMENTO       = PCR.CODDOCUMENTO '            + #13 +

  // André Pontes - pendência 27078 - 08/01/2008
//  '  AND PCR.IDFAVORECIDO       = PES.IDPESSOA '                + #13;
  '  AND PCR.IDFAVRATEIO        = PES.IDPESSOA '                + #13;

  if rdgRelatorio.ItemIndex = 2 then sSQL := sSQL +
  '  AND PCR.IDPATRO            = PTR.IDPESSOA '                + #13 +
  '  AND PCR.IDPLANPREVCONTABIL = PPC.IDPLANOPREV '             + #13 +
  '  AND PCR.CODTIPRECDES       = TRD.CODTIPRECDES '            + #13 +
  '  AND TRD.RECPAG             = ''P'' '                       + #13;

  if rdgRelatorio.ItemIndex <> 2 then sSQL := sSQL +
  'GROUP BY '                                                   + #13;

  case rdgRelatorio.ItemIndex of
    0: sSQL := sSQL + '  PES.NOME, SIGN(PCR.VALOR) '            + #13;
    1: sSQL := sSQL + '  PES.NOME '                             + #13;
  end;

  sSQL := sSQL +
  'ORDER BY '                                                   + #13 +
  '  PES.NOME ';

  cdsRelatorio.Close;
  sqlRelatorio.SQL.Clear;
  sqlRelatorio.SQL.Text := sSQL;
  sqlRelatorio.Open;

  case rdgRelatorio.ItemIndex of
    0, 1: TfrmPreview.CreateModalPreview(Application, rptSintetico, rptSintetico.PrinterSetup.DocumentName);
    2:    TfrmPreview.CreateModalPreview(Application, rptAnalitico, rptAnalitico.PrinterSetup.DocumentName);
  end;
end;



procedure TfrmExecGeraDocConvenio.ppShape11Print(Sender: TObject);
begin
  inherited;

  if chkCorLinha.Checked then
  begin
    if CorAtual = clWhite then
    begin
      CorAtual := cboCorLinha.SelectedColor;
    end
    else
    begin
      CorAtual := clWhite;
    end;
  end
  else
  begin
    CorAtual := clWhite;
  end;

  (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TfrmExecGeraDocConvenio.ppLine9Print(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := chkLinhas.Checked;
end;



procedure TfrmExecGeraDocConvenio.FormCreate(Sender: TObject);
begin
  inherited;
  rdgRelatorio.Hint :=
  '- por Favorecido (analítico): ' + #13 +
  'Exibe os valores agrupados por favorecido, sendo 1 linha para o repasse e 1 linha para o desconto ' + #13 + #13 +

  '- por Favorecido (líquido): ' + #13 +
  'Exibe os valores líquidos por favorecido (repasse - desconto) ' + #13 + #13 +

  '- pelo Rateio: ' + #13 +
  'Exibe os valores como foram lançados no documento (agrupados por favorecido, plano, patrocinadora e tipo de desembolso) ';
end;



function TfrmExecGeraDocConvenio.VerificaPlanoPatro: Boolean;
var
  sMsg    : string;
  sNome   : string;
  IDPlano : Integer;
  IDPatro : Integer;
  sPlanoxPatro : string;        //edilaine - SIG21438
begin
  Result := False;

	try
    sqlPlanPatro.Open;

    cdsRateio.First;
    while not(cdsRateio.eof {cdsListaArquivo.EOF}) do               //edilaine - SIG21438
    begin
      IDPlano := cdsRateio.FieldByName('IDPLANOCONTABIL').AsInteger;
      IDPatro := cdsRateio.FieldByName('IDPATRO').AsInteger;
      sNome   := cdsRateio.FieldByName('NOME').AsString;

      //edilaine - SIG21438 - inicio
      if pos('.'+IntToStr(IDPlano)+'-'+IntToStr(IDPatro)+'.', sPlanoxPatro) = 0 then
      begin
        if not(cdsPlanPatro.Locate('IDPLANOPREV;IDPATRO', VarArrayOf([IDPlano, IDPatro]), [])) then
        begin
          sMsg := 'O favorecido ' + sNome + #13 +
                  'possui uma combinação de Plano (' + IntToStr(IDPlano) + ') e ' +
                  'Patrocinadora (' + IntToStr(IDPatro) + ') inválida para lançamento no financeiro. ' + #13;

          raise EValidacao.CreateVal(sMsg, btnConfirmar);
        end;

        sPlanoxPatro := sPlanoxPatro + '.'+IntToStr(IDPlano)+'-'+IntToStr(IDPatro)+'.';
      end;
      //edilaine - SIG21438 - fim

      cdsRateio.Next;
    end;

  except
    on ev : EValidacao do
    begin
		  if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
			Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;

//edilaine - SIG21438 - inicio
procedure TfrmExecGeraDocConvenio.MontaConsultaBuscaRateio(sSQLRateio : string);
var
  sSQL    : string;
begin
  sSQL := sSQLRateio;
  sSQL := StringReplace(sSQL, 'FROM', ', :TOTAL AS VALTOTAL   FROM ', [rfIgnoreCase]);
  sSQL := StringReplace(sSQL, 'AND RXB.IDPESSOA(+)',
                                  '  AND RXB.IDPESSOA     = :IDFAVORECIDO '+
                                  '  AND RXB.IDRUBRICA    = :IDRUBRICA '+
                                  '  AND RXB.IDCBANCARIA  = :IDCBANCARIA '+
                              '  AND RXB.IDPESSOA(+)', [rfIgnoreCase]);
  qryRateioPerc.Close;
  qryRateioPerc.SQL.clear;
  qryRateioPerc.SQL.Text := 'SELECT T.*, ROUND((T.VALOR / T.VALTOTAL) *100, 2) AS PERCENTUAL '+
                            '  FROM ('+sSQL+') T';
  qryRateioPerc.prepare;
end;
//edilaine - SIG21438 - fim

// Andre Imakawa - SIG 60540 - Inicio

Function TfrmExecGeraDocConvenio.GeraArquivoPagamentoleiauteCNAB240(pCodDocumento: Integer): boolean;
  var
    rValorArquivo: Real;
    ProcessamentoOK: boolean;
begin
  try
    ProcessamentoOK := True;
    cdsListaArquivo.DisableControls;
    if not SetRegistrosArquivoPagamento(cdsListaArquivo.FieldByName('CODPORTFORMA').AsInteger,
                                        (fVlrRateioComDoc - fTotalDesconto)
                                        ) then
    begin
      MsgDlg('Problema na geração do arquivo de pagamento.' + #13 +
             'REF(1)' , Sistema.NomeModulo, mtInformation, [mbOk], 0);
      ProcessamentoOK := false;                                  
    end;

    iCodDocArq := 0;

    cdsListaArquivo.First;
    while not cdsListaArquivo.Eof do
    begin
      if not SetFavorecidoArqPagamento(cdsListaArquivo.FieldByName('NOME').AsString,  //Nome do recebedor
                                       cdsListaArquivo.FieldByName('NUMDOCUMENTO').AsString, //Núemro do CPF
                                       cdsListaArquivo.FieldByName('CODBANCOFAVORECIDO').AsString, //Número do banco
                                       cdsListaArquivo.FieldByName('NUMAGENCIA').AsString, //Número da agência bancária
                                       //Copy(cdsListaArquivo.FieldByName('CONTACORRENTE').AsString, 3, length(cdsListaArquivo.FieldByName('CONTACORRENTE').AsString)- 3), //Número da conta corrente sem a operação // Andre Imakawa - SIG 101587
                                       cdsListaArquivo.FieldByName('CONTACORRENTE').AsString,
                                       cdsListaArquivo.FieldByName('TIPOCONTA').AsString,    //Andre Imakawa - SIG 60540
                                       //'1', //Tipo da Operação - Débito em conta   //Andre Imakawa - SIG 60540
                                       Copy(cdsListaArquivo.FieldByName('CONTACORRENTE').AsString, 0, 3), //Número da Operação
                                       cdsListaArquivo.FieldByName('VALOR').AsFloat, //Valor a receber
                                       pCodDocumento, //Número do documento financeiro
                                       cdsListaArquivo.fieldByName('IDPESSOA').AsInteger //ID do Recebedor
                                       ) then
      begin
        MsgDlg('Problema na geração do arquivo de pagamento.' + #13 +
             'REF(2)' , Sistema.NomeModulo, mtInformation, [mbOk], 0);
        ProcessamentoOK := false;
      end;

      // Andre Imakawa - SIG 101599 - Inicio
      // Andre Imakawa - SIG 101587 - Inicio

      if not SetDocumentoArqPagamento(cdsListaArquivo.FieldByName('CODDOCUMENTO').AsInteger,
                                       cdsListaArquivo.FieldByName('CODFORMA').AsInteger,
                                       cdsListaArquivo.FieldByName('VALOR').AsFloat) then
      begin
        MsgDlg('Problema na geração do arquivo de pagamento.' + #13 +
             'REF(3)' , Sistema.NomeModulo, mtInformation, [mbOk], 0);
        ProcessamentoOK := false;
      end;

      // Andre Imakawa - SIG 101587 - Fim
      // Andre Imakawa - SIG 101599 - Fim
      cdsListaArquivo.Next;
    end;

    // Andre Imakawa - SIG 101599 - Inicio
    {
    if not SetStatusDocArquivoPagamento(pCodDocumento) then
    begin
      MsgDlg('Problema na geração do arquivo de pagamento.' + #13 +
             'REF(4)' , Sistema.NomeModulo, mtInformation, [mbOk], 0);
      ProcessamentoOK := false;
    end;
    }
    // Andre Imakawa - SIG 101599 - Fim
    Result := ProcessamentoOK;
    cdsListaArquivo.EnableControls;
  except
    on E: Exception Do
    begin
      cdsListaArquivo.EnableControls;
      MsgDlg('Problema na geração do arquivo de pagamento.' + #13 +
             e.message , Sistema.NomeModulo, mtInformation, [mbOk], 0);
      Result := false;
    end;
  end;
end;

function TfrmExecGeraDocConvenio.SetRegistrosArquivoPagamento(
  pCodPortForma: Integer; pValorTotal: Double): Boolean;
var
  sSQL : string;
  qryArquivoPagto: TwwQuery;
  iNSA: Integer;
  sNumEmpresaBanco: string;
begin
  Result := False;
  qryArquivoPagto := TwwQuery.Create(nil);
  
  try
    qryArquivoPagto.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;

    sSQL := 'SELECT SEQARQUIVOPAGTO.NEXTVAL SEQ FROM DUAL ';
    FazQuery(qryArquivoPagto, sSQL);

    iIdArquivoPagto := qryArquivoPagto.FieldByName('SEQ').AsInteger;
    qryArquivoPagto.Close;

    sSQL :=  'SELECT TRIM(NUMEMPRESABANCO) AS NUMEMPRESABANCO FROM PORTADORFORMA WHERE CODPORTFORMA = ' + IntToStr(pCodPortForma);
    FazQuery(qryArquivoPagto, sSQL);
    sNumEmpresaBanco := qryArquivoPagto.FieldByName('NUMEMPRESABANCO').AsString;
    qryArquivoPagto.Close;

    sSQL := 'SELECT SEQ_NSA_SIACC_' + sNumEmpresaBanco + '.NEXTVAL AS NSA FROM DUAL';
    FazQuery(qryArquivoPagto, sSQL);
    iNSA := qryArquivoPagto.FieldByName('NSA').AsInteger;
    qryArquivoPagto.Close;

    sSQL := 'INSERT INTO ARQUIVOPAGTO (IDARQUIVOPAGTO, VLRTOTAL, FLGENVIADO, CODPORTFORMA, NSA) VALUES (' +
            IntToStr(iIdArquivoPagto) + ', ' +
            Stringreplace(FloatToStr(pValorTotal), ',', '.', [rfReplaceAll]) + ', ' +
            QuotedStr('N') + ', ' +
            IntToStr(pCodPortForma) + ', ' +
            IntToStr(iNSA) + ')';

    if ExecutarQuery(qryArquivoPagto, sSQL) then
      Result := True;
  finally
    FreeAndNil(qryArquivoPagto);
  end;
end;

function TfrmExecGeraDocConvenio.SetFavorecidoArqPagamento(pNome, pDocumento,
  pBanco, pAgencia, pConta, pTipoConta, pOperacao: string; pValor: double;
  pCodDocumento, pIdForCli: Integer): Boolean;
var
  sSQL: string;
  qryDocumentosxPessoas: TwwQuery;
  
begin
  Result := False;
  qryDocumentosxPessoas := TwwQuery.Create(nil);

  try
    qryDocumentosxPessoas.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;

    sSQL :=  'SELECT SEQDOCXPESSOAS.NEXTVAL IDDOCUMENTOXPESSOAS FROM DUAL     ';
    FazQuery(qryDocumentosxPessoas, sSQL);

    iIdDocPessoa := qryDocumentosxPessoas.FieldByName('IDDOCUMENTOXPESSOAS').AsInteger;
    qryDocumentosxPessoas.Close;

    sSQL := 'INSERT INTO DOCUMENTOXPESSOAS(IDDOCUMENTOXPESSOAS, CODDOCUMENTO, IDFORCLI, RAZAOSOCIAL, NUMDOCUMENTO, ' +
            'NUMBANCO, NUMAGENCIA, NUMOPERACAO, NUMCONTA, TIPOCONTA, VALOR, FLGIMPORTADO, IDTITULAR) VALUES(' +
            IntToStr(iIdDocPessoa) + ', ' +
            IntToStr(pCodDocumento) + ', ' +
            IntToStr(pIdForCli) + ', ' +
            QuotedStr(pNome) + ', ' +
            QuotedStr(pDocumento) + ', ' +
            QuotedStr(pBanco) + ', ' +
            QuotedStr(pAgencia) + ', ' +
            QuotedStr(pOperacao) + ', ' +
            QuotedStr(pConta) + ', ' +
            QuotedStr(pTipoConta) + ', ' +
            StringReplace(FloatToStr(pValor), ',', '.', [rfReplaceAll]) + ', ' +
            QuotedStr('S') + ', ' +
            ' NULL )';

    if ExecutarQuery(qryDocumentosxPessoas, sSQL) then
      Result := True;
  finally
    FreeAndNil(qryDocumentosxPessoas);
  end;
end;


function TfrmExecGeraDocConvenio.SetDocumentoArqPagamento(pCodDocumento,
  pCodForma: Integer; pValor: Double): Boolean;
var
  sSQL: string;
  qryArquivoxDocum: TwwQuery;
begin
  Result := False;
  qryArquivoxDocum := TwwQuery.Create(nil);

  try
    qryArquivoxDocum.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;

    //sSQL :=  'SELECT SEQCODDOCARQ.NEXTVAL CODDOCARQ FROM DUAL ';
    //FazQuery(qryArquivoxDocum, sSQL);

    Inc(iCodDocArq);
    //iCodDocArq := qryArquivoxDocum.FieldByName('CODDOCARQ').AsInteger;
    qryArquivoxDocum.Close;

    sSQL := 'INSERT INTO ARQUIVOXDOCUM (IDARQUIVOPAGTO, CODDOCARQ, ID_DOC_CODBARRAS_PESSOAS, CODFORMA, VALOR, TIPO) VALUES (' +
            IntToStr(iIdArquivoPagto) + ', ' +
            IntToStr(iCodDocArq) + ', ' +
            IntToStr(iIdDocPessoa) + ', ' +
            IntToStr(pCodForma) + ', ' +
            Stringreplace(FloatToStr(pValor), ',', '.', [rfReplaceAll]) + ', ' +
            '2)';

    if ExecutarQuery(qryArquivoxDocum, sSQL) then
      Result := True;
  finally
    FreeAndNil(qryArquivoxDocum);
  end;
end;

function TfrmExecGeraDocConvenio.SetStatusDocArquivoPagamento(
  pCodDocumento: Integer): Boolean;
var
  sSQL: string;
  qryDocumento: TwwQuery;
begin
  Result := False;
  qryDocumento := TwwQuery.Create(nil);

  try
    qryDocumento.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;
    
    sSQL := 'UPDATE DOCUMENTO SET STATUS = 1 WHERE CODDOCUMENTO = ' + IntToStr(pCodDocumento);

    if ExecutarQuery(qryDocumento, sSQL) then
    begin
      Result := True;
    end;
  finally
    FreeAndNil(qryDocumento);
  end;
end;

// Andre Imakawa - SIG 60540 - Fim


end.
