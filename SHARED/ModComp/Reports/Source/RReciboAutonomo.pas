// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

{--------------------------------------------------------------------------------------------------
Rotina.........: *.dfm (sqlReciboAutonomo e rpReciboAutonomo - campo mesano), MontarDadosRelatorio, CrmRptCMBeforePrint
N. Sol..........: 217186-15443
N. Kintana......: 2053651
Data............: 12/01/2015
Responsável.....: Edilaine Ferraresi
Descrição.......: impressão do contra-cheque para mais de um mês
---------------------------------------------------------------------------------------------------
{ Rotina........: -
N. Sol..........: 37978
N. Kintana......: 524455
Data............: 13/08/2009
Responsável.....: Marilza Colpani
Descrição.......: Implementação do relatório de Tipo de Pagamento para Conselheiros.
*******************************************************************************}
unit RReciboAutonomo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppDB, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDBPipe, ppDBBDE,
  ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport;

type
  TRptReciboAutonomo = class(TFrmCmReport)
    sqlReciboAutonomo: TCMSqlParams;
    CdsReciboAutonomo: TCMClientDataSet;
    rpReciboAutonomo: TppReport;
    ppDetailBand1: TppDetailBand;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppLine42: TppLine;
    Figura3: TppImage;
    ppImage6: TppImage;
    ppShape25: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLabel22: TppLabel;
    ppShape26: TppShape;
    Figura1: TppImage;
    Figura2: TppImage;
    ppShape27: TppShape;
    ppShape28: TppShape;
    ppLine45: TppLine;
    Figura3_2: TppImage;
    ppImage10: TppImage;
    ppShape29: TppShape;
    ppLabel24: TppLabel;
    ppLabel26: TppLabel;
    ppDBText91: TppDBText;
    ppDBText144: TppDBText;
    ppDBText147: TppDBText;
    ppLabel28: TppLabel;
    ppLabel30: TppLabel;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLabel31: TppLabel;
    ppShape30: TppShape;
    Figura1_2: TppImage;
    Figura2_2: TppImage;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape34: TppShape;
    ppShape36: TppShape;
    ppLabel35: TppLabel;
    ppShape37: TppShape;
    lblReciboAutonomoNOME: TppLabel;
    ppLabel37: TppLabel;
    lblReciboAutonomoNATUREZA: TppLabel;
    ppDBText152: TppDBText;
    ppDBText153: TppDBText;
    ppDBText154: TppDBText;
    ppDBText155: TppDBText;
    lblReciboAutonomoMATRICULA: TppLabel;
    ppShape38: TppShape;
    ppShape40: TppShape;
    lblReciboAutonomoCODIGO: TppLabel;
    lblReciboAutonomoDESCRICAO: TppLabel;
    lblReciboAutonomoVALOR: TppLabel;
    ppLine50: TppLine;
    lblReciboAutonomoTOT_LIQ: TppLabel;
    lblReciboAutonomoBASE_IRRF: TppLabel;
    lblReciboAutonomoSAL_REMUNERACAO: TppLabel;
    ppDBText156: TppDBText;
    ppDBText157: TppDBText;
    ppDBText158: TppDBText;
    ppDBText159: TppDBText;
    ppDBText160: TppDBText;
    ppDBText161: TppDBText;
    ppDBText162: TppDBText;
    ppDBText163: TppDBText;
    ppDBText164: TppDBText;
    ppDBText165: TppDBText;
    ppDBText166: TppDBText;
    ppDBText167: TppDBText;
    ppDBText168: TppDBText;
    ppDBText169: TppDBText;
    ppDBText170: TppDBText;
    ppDBText201: TppDBText;
    ppDBText202: TppDBText;
    ppDBText203: TppDBText;
    ppDBText204: TppDBText;
    ppDBText205: TppDBText;
    ppDBText206: TppDBText;
    ppDBText207: TppDBText;
    ppDBText208: TppDBText;
    ppDBText209: TppDBText;
    ppDBText210: TppDBText;
    ppDBText211: TppDBText;
    ppDBText212: TppDBText;
    ppDBText213: TppDBText;
    ppDBText214: TppDBText;
    ppDBText215: TppDBText;
    ppDBText216: TppDBText;
    ppDBText217: TppDBText;
    ppDBText218: TppDBText;
    ppDBText219: TppDBText;
    ppDBText220: TppDBText;
    ppDBText221: TppDBText;
    ppDBText222: TppDBText;
    ppDBText223: TppDBText;
    ppDBText224: TppDBText;
    ppDBText225: TppDBText;
    ppDBText226: TppDBText;
    ppDBText227: TppDBText;
    ppDBText228: TppDBText;
    ppDBText229: TppDBText;
    ppDBText230: TppDBText;
    dbtxtReciboPagamentoFOLHA: TppDBText;
    ppDBText232: TppDBText;
    ppDBText233: TppDBText;
    dbtxtReciboAutonomoTOT_PROVENTOS: TppDBText;
    ppDBText235: TppDBText;
    ppDBText236: TppDBText;
    ppDBText239: TppDBText;
    ppLabel55: TppLabel;
    ppLine51: TppLine;
    ppDBText240: TppDBText;
    ppDBText241: TppDBText;
    ppDBText244: TppDBText;
    ppDBText245: TppDBText;
    ppDBText246: TppDBText;
    ppDBText249: TppDBText;
    ppDBText250: TppDBText;
    ppDBText251: TppDBText;
    ppDBText254: TppDBText;
    ppDBText255: TppDBText;
    ppDBText256: TppDBText;
    ppDBText259: TppDBText;
    ppDBText260: TppDBText;
    ppDBText261: TppDBText;
    ppDBText264: TppDBText;
    ppDBText265: TppDBText;
    ppDBText266: TppDBText;
    ppDBText269: TppDBText;
    ppDBText270: TppDBText;
    ppDBText271: TppDBText;
    ppDBText274: TppDBText;
    ppDBText275: TppDBText;
    ppDBText276: TppDBText;
    ppDBText279: TppDBText;
    ppDBText280: TppDBText;
    ppDBText281: TppDBText;
    ppDBText284: TppDBText;
    ppDBText285: TppDBText;
    ppDBText286: TppDBText;
    ppDBText289: TppDBText;
    lblReciboAutonomoCOD_AG: TppLabel;
    lblReciboAutonomoCTDEPOS: TppLabel;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppImage13: TppImage;
    lblReciboAutonomoAgencia: TppDBText;
    ppDBText291: TppDBText;
    lblReciboAutonomoDEP_IR: TppLabel;
    lblReciboAutonomoSAL_BRUTO: TppLabel;
    dbtxtReciboAutonomoMARGEM2: TppDBText;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    lblReciboAutonomoBASE_ISS: TppLabel;
    lblReciboAutonomoDESC: TppLabel;
    lblReciboAutonomoBASE_INSS: TppLabel;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLabel69: TppLabel;
    ppShape47: TppShape;
    lblReciboAutonomoNOME_2: TppLabel;
    ppLabel71: TppLabel;
    lblReciboAutonomoNATUREZA_2: TppLabel;
    ppDBText297: TppDBText;
    ppDBText298: TppDBText;
    ppDBText299: TppDBText;
    ppDBText300: TppDBText;
    lblReciboAutonomoMATRICULA_2: TppLabel;
    ppShape48: TppShape;
    ppShape50: TppShape;
    lblReciboAutonomoCODIGO_2: TppLabel;
    lblReciboAutonomoDESCRICAO_2: TppLabel;
    lblReciboAutonomoVALOR_2: TppLabel;
    ppDBText301: TppDBText;
    ppDBText302: TppDBText;
    ppDBText303: TppDBText;
    ppDBText304: TppDBText;
    ppDBText305: TppDBText;
    ppDBText306: TppDBText;
    ppDBText307: TppDBText;
    ppDBText308: TppDBText;
    ppDBText309: TppDBText;
    ppDBText310: TppDBText;
    ppDBText311: TppDBText;
    ppDBText312: TppDBText;
    ppDBText313: TppDBText;
    ppDBText314: TppDBText;
    ppDBText315: TppDBText;
    ppDBText346: TppDBText;
    ppDBText347: TppDBText;
    ppDBText348: TppDBText;
    ppDBText349: TppDBText;
    ppDBText350: TppDBText;
    ppDBText351: TppDBText;
    ppDBText352: TppDBText;
    ppDBText353: TppDBText;
    ppDBText354: TppDBText;
    ppDBText355: TppDBText;
    ppDBText356: TppDBText;
    ppDBText357: TppDBText;
    ppDBText358: TppDBText;
    ppDBText359: TppDBText;
    ppDBText360: TppDBText;
    ppDBText361: TppDBText;
    ppDBText362: TppDBText;
    ppDBText363: TppDBText;
    ppDBText364: TppDBText;
    ppDBText365: TppDBText;
    ppDBText366: TppDBText;
    ppDBText367: TppDBText;
    ppDBText368: TppDBText;
    ppDBText369: TppDBText;
    ppDBText370: TppDBText;
    ppDBText371: TppDBText;
    ppDBText372: TppDBText;
    ppDBText373: TppDBText;
    ppDBText374: TppDBText;
    ppDBText375: TppDBText;
    ppDBText376: TppDBText;
    ppLabel85: TppLabel;
    ppLine70: TppLine;
    ppDBText385: TppDBText;
    ppDBText386: TppDBText;
    ppDBText389: TppDBText;
    ppDBText390: TppDBText;
    ppDBText391: TppDBText;
    ppDBText394: TppDBText;
    ppDBText395: TppDBText;
    ppDBText396: TppDBText;
    ppDBText399: TppDBText;
    ppDBText400: TppDBText;
    ppDBText401: TppDBText;
    ppDBText404: TppDBText;
    ppDBText405: TppDBText;
    ppDBText406: TppDBText;
    ppDBText409: TppDBText;
    ppDBText410: TppDBText;
    ppDBText411: TppDBText;
    ppDBText414: TppDBText;
    ppDBText415: TppDBText;
    ppDBText416: TppDBText;
    ppDBText419: TppDBText;
    ppDBText420: TppDBText;
    ppDBText421: TppDBText;
    ppDBText424: TppDBText;
    ppDBText425: TppDBText;
    ppDBText426: TppDBText;
    ppDBText429: TppDBText;
    ppDBText430: TppDBText;
    ppDBText431: TppDBText;
    ppDBText434: TppDBText;
    lblReciboAutonomoCOD_AG_2: TppLabel;
    lblReciboAutonomoCTDEPOS_2: TppLabel;
    ppLine71: TppLine;
    ppLine72: TppLine;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppImage14: TppImage;
    lblReciboAutonomoAgencia_2: TppDBText;
    ppDBText436: TppDBText;
    lblReciboAutonomoBANCO: TppLabel;
    ppDBText292: TppDBText;
    lblReciboAutonomoCPF: TppLabel;
    ppLine56: TppLine;
    pdbtxt1: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    dsReciboAutonomo: TwwDataSource;
    ppReciboAutonomo: TppBDEPipeline;
    ppLine2: TppLine;
    ppLine67: TppLine;
    ppDBText2: TppDBText;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppDBText3: TppDBText;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppDBText4: TppDBText;
    lblReciboAutonomoBANCO_2: TppLabel;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppDBText5: TppDBText;
    lblReciboAutonomoCPF_2: TppLabel;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    dbtxtReciboAutonomoTOT_PROVENTOS_2: TppDBText;
    ppDBText9: TppDBText;
    lblReciboAutonomoDESC_2: TppLabel;
    lblReciboAutonomoTOT_LIQ_2: TppLabel;
    lblReciboAutonomoSAL_BRUTO_2: TppLabel;
    lblReciboAutonomoSAL_REMUNERACAO_2: TppLabel;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    lblReciboAutonomoDEP_IR_2: TppLabel;
    lblReciboAutonomoBASE_ISS_2: TppLabel;
    lblReciboAutonomoBASE_IRRF_2: TppLabel;
    lblReciboAutonomoBASE_INSS_2: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    dbtxtReciboAutonomoMARGEM2_2: TppDBText;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppDBText14: TppDBText;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine57: TppLine;
    ppShape4: TppShape;
    ppLabel14: TppLabel;
    ppShape5: TppShape;
    ppLabel15: TppLabel;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLine68: TppLine;
    ppLine69: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppLine81: TppLine;
    ppLine78: TppLine;
    ppShape10: TppShape;
    ppMesAno1E: TppDBText;
    ppMesAno1D: TppDBText;
    ppMesAno2E: TppDBText;
    ppMesAno2D: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsReciboAutonomoAfterOpen(DataSet: TDataSet);
    procedure CdsReciboAutonomoAfterScroll(DataSet: TDataSet);
    procedure rpReciboPagamentoSmryBndAfterPrint(Sender: TObject);
  private
    { Private declarations }
    iPagina : integer;                                                  // edilaine - SOL 217186-15443 / KTN 2053651
    procedure MontarDadosRelatorio(iVez : integer; sMesAno : string);   // edilaine - SOL 217186-15443 / KTN 2053651
    procedure MontarDados_Suprimido;
  public
    { Public declarations }
    iNumMeses : integer;                            // edilaine - SOL 217186-15443 / KTN 2053651
    IdEmpresa, MesRef, AnoRef, Ordenacao: integer;
    ListaIdEstab, ListaIdFunc, TipoContrato, SitFunc, NomeTabela, TipoPagamento,
    sFigura1, sFigura2, sFigura3: string;
  end;

var
  RptReciboAutonomo: TRptReciboAutonomo;

implementation
uses uCtrlFuncoesRH, dCds, fAguarde, uCtrlUsoGeralRH, USistema;

{$R *.DFM}

procedure TRptReciboAutonomo.CrmRptCMBeforePrint(Sender: TObject);
var
  DocID: array[1..2] of integer;
  iMes, iAno: integer;
  iNumVezes : integer;          // edilaine - SOL 217186-15443 / KTN 2053651
  sMesAtual : string;           // edilaine - SOL 217186-15443 / KTN 2053651
  sMesBase  : string;           // edilaine - SOL 217186-15443 / KTN 2053651
begin
  inherited;
  Figura1.Picture.LoadFromFile(sFigura1);
  Figura1_2.Picture.LoadFromFile(sFigura1);

  Figura2.Picture.LoadFromFile(sFigura2);
  Figura2_2.Picture.LoadFromFile(sFigura2);

  Figura3.Picture.LoadFromFile(sFigura3);
  Figura3_2.Picture.LoadFromFile(sFigura3);

  DocID[1] := 0;
  DocID[2] := 0;

  iMes := MesRef;
  iAno := AnoRef;

  // edilaine - SOL 217186-15443 / KTN 2053651 - inicio
  sMesBase := '01/' + fu.UltimosCaracteres('00'+IntToStr(iMes), 2) + '/'+IntToStr(iAno);
  iPagina  := 1;
  // edilaine - SOL 217186-15443 / KTN 2053651 - fim

  for iNumVezes := 0 to iNumMeses-1 do   // edilaine - SOL 217186-15443 / KTN 2053651
  begin

    // edilaine - SOL 217186-15443 / KTN 2053651 - inicio
    sMesAtual := fu.IncData(sMesBase, 0, iNumVezes, 0);

    MesRef := fu.ExtraiMes( StrToDate(sMesAtual) );
    AnoRef := fu.ExtraiAno( StrToDate(sMesAtual) );

    iMes := MesRef;
    iAno := AnoRef;
    // edilaine - SOL 217186-15443 / KTN 2053651 = fim;

    with (dmCds.sql.SQL) do
    begin
      Clear;
      Add('SELECT DISTINCT');
      Add('  PJ.RAZAOSOCIAL AS EMPRESA,');
      Add('  PF.NOME AS EMPREGADO,');
      Add('  P.FLGDESCONTO AS TIPORUBRICA,');
      Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
      Add('    ''Rescisao'','''',''Rescisão'','''',''13.o Salar'','''',H.REFERENCIA)) AS REFERENCIA,');
      Add('  F.MATRICULA,');
      Add('  F.TIPOCONTRATO,');
      Add('  F.NUMCONTASALARIO,');
      Add('  AG.NUMAGENCIA,');
      Add('  BA.NUMBANCO,');
      Add('  CC.CODCENTROCUSTO,');
      Add('  CC.NOME AS NOMECENTROCUSTO,');
      Add('  PFIS.NUMDEPIRRF,');
      Add('  PFIS.NUMDEPSALF,');     
      Add('  C.TITULO, DECODE(C2.TITULO,NULL,'''','' / '' || C2.TITULO) AS FUNCAO,');
      Add('  P.CODRUBCLT AS CODRUBRICA,');
      Add('  RP.CODPROVDESC AS CODRUBRICACLIENTE,');
      Add('  RP.DESCRPROVDESC AS RUBRICA,');
      Add('  (''CNPJ: '' || PJ.NUMDOCUMENTO) AS CGC,');
      Add('  PF.NUMDOCUMENTO AS CPF,');
      Add('  PIS.NUM AS PIS,');
      Add('  H.VALORPROVENTO AS VALOR,');
      Add('  MARGEM1.VALORMARGEM AS VALORMARGEM1,');
      Add('  MARGEM2.VALORMARGEM AS VALORMARGEM2,');
      Add('  DECODE(SALCONTRA.SALARIOCONTRATUAL,');
      Add('    NULL, F.SALARIOATUAL * (CASE');
      Add('                              WHEN F.TIPOPAGAMENTO = ''M'' THEN 1');
      Add('                              WHEN F.TIPOPAGAMENTO = ''D'' THEN 30');
      Add('                              WHEN F.TIPOPAGAMENTO = ''T'' THEN 1');
      Add('                              ELSE HT.JORNADAMENSAL');
      Add('                            END),');
      Add('    SALCONTRA.SALARIOCONTRATUAL) AS SALBASE');
      Add('FROM');
      Add('  ' +NomeTabela+ ' H, PESSOA PJ, PESSOA PF, PESSOAFISICA PFIS, PROVDESC P,');
      Add('  RUBRICAXPESS RP, FUNCIONARIO F, CARGO C,  CARGO C2, HORATRAB HT,');
      Add('  CENTCUST CC, SITFUNC ST, AGENCIABANCARIA AG, BANCO BA, FILIALPESSOA FP,');
      // -------------------------------------------------------------------------- //
      // Última evolução Funcional do Funcionário
      // -------------------------------------------------------------------------- //
      Add('  (SELECT');
      Add('     EVOL.IDCARGO, EVOL.IDFUNCAO, EVOL.IDPESSOA, EVOL.IDEMPRESA, EVOL.CODCENTROCUSTO');
      Add('   FROM');
      Add('     EVOLFUNC EVOL,');
      Add('     (SELECT');
      Add('        MAX(DATAALTERFUNC) AS DATAALTERFUNC, IDPESSOA');
      Add('      FROM');
      Add('        EVOLFUNC');
      Add('      WHERE');
      Add('        (DATAALTERFUNC <= TO_DATE(' +
        QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
        IntToStr(iAno))+ ',''DD/MM/YYYY''))');
      Add('      GROUP BY');
      Add('        IDPESSOA) HST2,');
      Add('     (SELECT');
      Add('        MAX(TRGDTINCLUSAO) AS DATAINCLUSAO, IDPESSOA');
      Add('      FROM');
      Add('        EVOLFUNC');
      Add('      WHERE');
      Add('        (DATAALTERFUNC <= TO_DATE(' +
        QuotedStr(IntToStr(FU.TrazUltDiaMes(iMes, iAno)) +'/'+ FU.PoeZero(iMes) +'/'+
        IntToStr(iAno))+ ',''DD/MM/YYYY''))');
      Add('      GROUP BY');
      Add('        IDPESSOA) HST3');
      Add('   WHERE');
      Add('     (EVOL.DATAALTERFUNC = HST2.DATAALTERFUNC) AND');
      Add('     (EVOL.IDPESSOA      = HST2.IDPESSOA) AND');
      Add('     (EVOL.TRGDTINCLUSAO = HST3.DATAINCLUSAO) AND');
      Add('     (EVOL.IDPESSOA      = HST3.IDPESSOA)) HST,');
      // -------------------------------------------------------------------------- //
      // Margem 1 (CLT = 90010)
      // -------------------------------------------------------------------------- //
      Add('  (SELECT DISTINCT');
      Add('     H.IDPESSOA, H.VALORPROVENTO AS VALORMARGEM');
      Add('   FROM');
      Add('     ' +NomeTabela+ ' H, PROVDESC P');
      Add('   WHERE');
      Add('     (H.MES        = ' +
        QuotedStr(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef))+ ') AND');
      Add(FU.MontaLinhaSelSQL('     (H.IDMOTIVO',TipoPagamento,2));
      Add('     (P.CODRUBCLT  = ''90010'') AND');
      Add('     (P.IDPROVENTO = H.IDRUBRICA)) MARGEM1,');
      // -------------------------------------------------------------------------- //
      // Margem 2 (CLT = 90012)
      // -------------------------------------------------------------------------- //
      Add('  (SELECT DISTINCT');
      Add('     H.IDPESSOA, H.VALORPROVENTO AS VALORMARGEM');
      Add('   FROM');
      Add('     ' +NomeTabela+ ' H, PROVDESC P');
      Add('   WHERE');
      Add('     (H.MES        = ' +
        QuotedStr(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef))+ ') AND');
      Add(FU.MontaLinhaSelSQL('     (H.IDMOTIVO',TipoPagamento,2));
      Add('     (P.CODRUBCLT  = ''90012'') AND');
      Add('     (P.IDPROVENTO = H.IDRUBRICA)) MARGEM2,');
      // -------------------------------------------------------------------------- //
      // Salario Contratual (CLT = 60052)
      // -------------------------------------------------------------------------- //
      Add('  (SELECT DISTINCT');
      Add('     H.IDPESSOA, H.VALORPROVENTO AS SALARIOCONTRATUAL');
      Add('   FROM');
      Add('     ' +NomeTabela+ ' H, PROVDESC P');
      Add('   WHERE');
      Add('     (H.MES        = ' +
        QuotedStr(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef))+ ') AND');
      Add(FU.MontaLinhaSelSQL('     (H.IDMOTIVO',TipoPagamento,2));
      Add('     (P.CODRUBCLT  = ''60052'') AND');
      Add('     (P.IDPROVENTO = H.IDRUBRICA)) SALCONTRA,');
      // -------------------------------------------------------------------------- //
      // PIS do Funcionário
      // -------------------------------------------------------------------------- //
      Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
      Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
      Add('   WHERE ((TDO.SIGLADOCUMENTO = ''PIS:'') OR');
      Add('          (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'')) AND');
      Add('         (TDO.IDDOCUMENTO     = DP.IDDOCUMENTO) AND');
      Add('         (DP.IDPESSOA         = F.IDPESSOA)) PIS');
      // -------------------------------------------------------------------------- //
      Add('WHERE');
      Add(FU.MontaLinhaSelSQL('  (FP.IDFILIALPESSOA',ListaIdEstab,1));

      // Funcionário(s) selecionado(s)
      if (ListaIdFunc <> '') then
        Add(FU.MontaLinhaSelSQL('  (F.IDPESSOA',ListaIdFunc,8))
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (CtrlUsoGeralRH.UsuXCCusto <> '') then
          Add(FU.MontaLinhaSelSQL(
            '  (TRIM(DECODE(HST.CODCENTROCUSTO,' +CR_LF+
            '     NULL,F.CODCENTROCUSTO,' +CR_LF+
            '     HST.CODCENTROCUSTO))',CtrlUsoGeralRH.UsuXCCusto,1));

        Add(FU.MontaLinhaSelSQL('  (ST.TIPOSIT',SitFunc,8));
        Add(FU.MontaLinhaSelSQL('  (F.TIPOCONTRATO',SitFunc,4));
      end;

      Add('  (H.MES              = ' +QuotedStr(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef))+ ') AND');
      Add(FU.MontaLinhaSelSQL('  (H.IDMOTIVO',TipoPagamento,7));
      Add('  (H.IDPESSJUR        = ' +IntToStr(IdEmpresa)+ ') AND');
      Add('  (F.IDSITFUNC        = ST.IDSITFUNC) AND');
      Add('  (F.IDHORARIO        = HT.IDHORARIO) AND');
      Add('  (FP.IDFILIALPESSOA  = F.IDESTAB) AND');
      Add('  (F.IDESTAB          = PJ.IDPESSOA) AND');
      Add('  (F.IDPESSOA         = PFIS.IDPESSOA) AND');
      Add('  (F.IDPESSOA         = PF.IDPESSOA) AND');
      Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
      Add('  (DECODE(HST.IDCARGO,NULL,F.IDCARGO,HST.IDCARGO) = C.IDCARGO) AND');
      Add('  (H.IDRUBRICA        = RP.IDRUBRICA) AND');
      Add('  (DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA) = CC.IDEMPRESA) AND');
      Add('  (DECODE(HST.CODCENTROCUSTO,NULL,F.CODCENTROCUSTO,HST.CODCENTROCUSTO) = CC.CODCENTROCUSTO) AND');
      Add('  (H.IDRUBRICA        = P.IDPROVENTO) AND');
      Add('  (RP.IDPESSOA        = DECODE(HST.IDEMPRESA,NULL,F.IDEMPRESA,HST.IDEMPRESA)) AND');
      Add('  (F.IDPESSOA         = SALCONTRA.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA         = PIS.IDPESSOA(+)) AND');
      Add('  (F.IDAGENCIASALARIO = AG.IDPESSOA(+)) AND');
      Add('  (AG.IDBANCO         = BA.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA         = MARGEM1.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA         = MARGEM2.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA         = HST.IDPESSOA(+)) AND');
      Add('  (HST.IDFUNCAO       = C2.IDCARGO(+))');
      Add('ORDER BY');
      case (Ordenacao) of
        0 : Add('  EMPRESA, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
        1 : Add('  EMPRESA, NOMECENTROCUSTO, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
        2 : Add('  EMPRESA, NOMECENTROCUSTO, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
        3 : Add('  EMPRESA, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
      end;
      //SaveToFile('c:\qry1.txt');
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    end;
    dmCds.sql.Open;

    // edilaine - SOL 217186-15443 / KTN 2053651 - comentado inicio
    {LblMesRef.Caption := FU.MesExtensoAno(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef));
    LblMesRef2.Caption := LblMesRef.Caption;
    LblMesRef3.Caption := LblMesRef.Caption;
    LblMesRef4.Caption := LblMesRef.Caption;
    } // edilaine - SOL 217186-15443 / KTN 2053651 - comentado fim

    // Monta Query Principal
    MontarDadosRelatorio(iNumVezes, sMesAtual);

  end;
  MontarDados_Suprimido;
  // edilaine - SOL 217186-15443 / KTN 2053651 - fim

  CdsReciboAutonomo.First;
  frmAguarde.Apaga;
end;

procedure TRptReciboAutonomo.CdsReciboAutonomoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptReciboAutonomo.CdsReciboAutonomoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptReciboAutonomo.MontarDadosRelatorio(iVez : integer; sMesAno : string);   // edilaine - SOL 217186-15443 / KTN 2053651
var
  sMatricula: string;
  rSalBase, rBaseINSS, rBaseFGTS, rFGTSMes, rBaseIRRF, rProventos, rDescontos,
  rMargem1, rMargem2, rSalPart: real;
  {iPagina,} iRubrica: integer;     // edilaine - SOL 217186-15443 / KTN 2053651
  Marca: TBookmark;
  bTemDesconto: boolean;
  sDtExtenso : string;    // edilaine - SOL 217186-15443 / KTN 2053651
begin

  sDtExtenso := FU.MesExtensoAno( fu.RetornaAnoMes( StrToDate(sMesAno) ) );   // edilaine - SOL 217186-15443 / KTN 2053651

  if iVez = 0 then               // edilaine - SOL 217186-15443 / KTN 2053651
     sqlReciboAutonomo.Open;

  if not(dmCds.Cds.IsEmpty) then
  begin
    CdsReciboAutonomo.IndexName := '';
    //iPagina := 1;                    // edilaine - SOL 217186-15443 / KTN 2053651
    while not(dmCds.Cds.EOF) do
    begin
      sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;
      Marca := dmCds.Cds.GetBookMark;
      bTemDesconto := false;

      // Calculo todas as páginas do Funcionário
      repeat
        if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger = 1) then
          bTemDesconto := true;
        dmCds.Cds.Next;
      until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
            (dmCds.Cds.EOF);

      dmCds.Cds.GotoBookmark(Marca);
      dmCds.Cds.FreeBookmark(Marca);

      rBaseINSS:=0; rSalPart:=0; rBaseFGTS:=0; rFGTSMes:=0; rBaseIRRF:=0;
      rProventos:=0; rDescontos:=0;

      // Monto as informações em Páginas por Funcionário
      repeat
        CdsReciboAutonomo.Append;

        CdsReciboAutonomo.FieldByName('MESANO').asString := sDtExtenso; // edilaine - SOL 217186-15443 / KTN 2053651

        CdsReciboAutonomo.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
        CdsReciboAutonomo.FieldByName('PAGINA').asInteger := iPagina;
        CdsReciboAutonomo.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
        CdsReciboAutonomo.FieldByName('CODCENTROCUSTO').asString := dmCds.Cds.FieldByName('CODCENTROCUSTO').AsString;
        CdsReciboAutonomo.FieldByName('NATUREZA').asString := 'Conselheiro'; //Marilza Colpani 13/08/2009 N.Sol 37978/N.Kintana 524455
        CdsReciboAutonomo.FieldByName('PIS').AsString := dmCds.Cds.FieldByName ('PIS').AsString; //Marilza Colpani 13/08/2009 N.Sol 37978/N.Kintana 524455
        CdsReciboAutonomo.FieldByName('NUMBANCO').AsString := dmCds.Cds.FieldByName ('NUMBANCO').AsString; //Marilza Colpani 13/08/2009 N.Sol 37978/N.Kintana 524455
        CdsReciboAutonomo.FieldByName('CPF').AsString := dmCds.Cds.FieldByName ('CPF').AsString; //Marilza Colpani 13/08/2009 N.Sol 37978/N.Kintana 524455
        CdsReciboAutonomo.FieldByName('NUMAGENCIA').asString := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        CdsReciboAutonomo.FieldByName('NUMCONTASALARIO').asString := dmCds.Cds.FieldByName('NUMCONTASALARIO').asString;
        CdsReciboAutonomo.FieldByName('TIPOCONTRATO').asString := dmCds.Cds.FieldByName('TIPOCONTRATO').asString;
        CdsReciboAutonomo.FieldByName('NUMDEPSALF').asInteger := dmCds.Cds.FieldByName('NUMDEPSALF').asInteger;
        CdsReciboAutonomo.FieldByName('NUMDEPIRRF').asInteger := dmCds.Cds.FieldByName('NUMDEPIRRF').asInteger;
        CdsReciboAutonomo.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
        CdsReciboAutonomo.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;

        if (dmCds.Cds.FieldByName('TIPOCONTRATO').asString <> 'A') then
        begin
          CdsReciboAutonomo.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;
          CdsReciboAutonomo.FieldByName('CARGO').asString := trim(dmCds.Cds.FieldByName('TITULO').asString) +
            trim(dmCds.Cds.FieldByName('FUNCAO').asString);
          CdsReciboAutonomo.FieldByName('NUMAGENCIA').asString := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
//        end
//        else
//        begin
//          CdsReciboAutonomo.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('TITULO').asString;
//          CdsReciboAutonomo.FieldByName('CARGO').asString :=
//            dmCds.Cds.FieldByName('PIS').asString +
//            FU.Replicate(' ', 32)+
//            dmCds.Cds.FieldByName('CPF').asString;
//          CdsReciboAutonomo.FieldByName('NUMAGENCIA').asString :=
//            dmCds.Cds.FieldByName('NUMBANCO').asString + ' / ' +
//            dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        end;

        rSalBase := dmCds.Cds.FieldByName('SALBASE').asFloat;
        rMargem1 := dmCds.Cds.FieldByName('VALORMARGEM1').asFloat;
        rMargem2 := dmCds.Cds.FieldByName('VALORMARGEM2').asFloat;

        // Preencho cada Linha da Página do Funcionário com suas Rubricas
        iRubrica := 1;
        repeat
          if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) then
          begin
            if (bTemDesconto) and (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger = 1) then
            begin
              Inc(iRubrica);
              bTemDesconto := false;
            end;

            CdsReciboAutonomo.FieldByName('CODRUBRICA'+IntToStr(iRubrica)).asString := dmCds.Cds.FieldByName('CODRUBRICACLIENTE').asString;
            CdsReciboAutonomo.FieldByName('RUBRICA'+IntToStr(iRubrica)).asString := dmCds.Cds.FieldByName('RUBRICA').asString;
            CdsReciboAutonomo.FieldByName('REFERENCIA'+IntToStr(iRubrica)).asString := dmCds.Cds.FieldByName('REFERENCIA').asString;

            //Marilza Colpani 13/08/2009 N.Sol 37978/N.Kintana 524455
            CdsReciboAutonomo.FieldByName('VALORRUB'+IntToStr(iRubrica)).asFloat := dmCds.Cds.FieldByName('VALOR').asFloat;
            if (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger = 0) then
            begin
              rProventos := rProventos + dmCds.Cds.FieldByName('VALOR').asFloat;
            end
            else
            begin
              rDescontos := rDescontos + dmCds.Cds.FieldByName('VALOR').asFloat;
            end;
            Inc(iRubrica);
          end
          else
          begin
            // Base do INSS
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60056') then
              rBaseINSS := rBaseINSS + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Base Prev. Priv.
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '90011') then
              rSalPart := rSalPart + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // FGTS do Mês
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '40695') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '43696') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '43700') then
              rFGTSMes := rFGTSMes + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Remuneração para Autônomo
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60052') and
               (dmCds.Cds.FieldByName('TIPOCONTRATO').asString = 'A') then
              rSalBase := rSalBase + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Base do FGTS
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60695') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '62022') then
              rBaseFGTS := rBaseFGTS + dmCds.Cds.FieldByName('VALOR').asFloat
            else
            // Base do IRRF
            if (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60026') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '60028') or
               (dmCds.Cds.FieldByName('CODRUBRICA').asString = '62026') then
              rBaseIRRF := rBaseIRRF + dmCds.Cds.FieldByName('VALOR').asFloat;
          end;
          sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;

          dmCds.Cds.Next;
        until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
              (dmCds.Cds.EOF) or
              ((sMatricula = dmCds.Cds.FieldByName('MATRICULA').asString) and
               (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) and
               (iRubrica = 26));

        if (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
           (dmCds.Cds.EOF) then
        begin
          CdsReciboAutonomo.FieldByName('SALBASE').asFloat := rSalBase;
          CdsReciboAutonomo.FieldByName('VALORMARGEM1').asFloat := rMargem1;
          CdsReciboAutonomo.FieldByName('VALORMARGEM2').asFloat := rMargem2;
          CdsReciboAutonomo.FieldByName('BASEINSS').asFloat := rBaseINSS;
          CdsReciboAutonomo.FieldByName('SALPART').asFloat := rSalPart;
          CdsReciboAutonomo.FieldByName('BASEFGTS').asFloat := rBaseFGTS;
          CdsReciboAutonomo.FieldByName('FGTSMES').asFloat := rFGTSMes;
          CdsReciboAutonomo.FieldByName('BASEIRRF').asFloat := rBaseIRRF;
          CdsReciboAutonomo.FieldByName('TOT_PROVENTOS').asFloat := rProventos;
          CdsReciboAutonomo.FieldByName('TOT_DESCONTOS').asFloat := rDescontos;
          CdsReciboAutonomo.FieldByName('TOT_GERAL').asString :=
            FU.ValStr(rProventos - rDescontos, 12, 2, true, ',');
        end
        else
          CdsReciboAutonomo.FieldByName('TOT_GERAL').asString := 'CONTINUA';

        CdsReciboAutonomo.Post;

        Inc(iPagina);
      until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
            (dmCds.Cds.EOF);
    end;
  {  MontarDados_Suprimido;              // edilaine - SOL 217186-15443 / KTN 2053651 - comentario inicio
  end
  else
  begin
    CdsReciboAutonomo.Insert;
    CdsReciboAutonomo.Post;
  }  // edilaine - SOL 217186-15443 / KTN 2053651 - comentario fim  
  end;
end;

procedure TRptReciboAutonomo.MontarDados_Suprimido;
var
  c: byte;
  CdsAux: TCMClientDataSet;
begin
  // Se for uma pessoa, não há motivo para suprimir os dados
  if (CdsReciboAutonomo.RecordCount = 1) then
    exit;

  CdsAux := TCMClientDataSet.Create(Self);
  try
    CdsAux.Data := CdsReciboAutonomo.Data;
    CdsAux.First;
    CdsReciboAutonomo.EmptyDataSet;
    repeat
      CdsReciboAutonomo.Append;
      for c:=0 to (CdsAux.FieldCount div 2)-1 do
        CdsReciboAutonomo.Fields[c].Value := CdsAux.Fields[c].Value;
      CdsReciboAutonomo.Post;

      CdsAux.Next; // Pegar a próxima pessoa/página do Recibo Auxiliar

      if not(CdsAux.EOF) then
      begin
        CdsReciboAutonomo.Edit;
        for c:=0 to (CdsAux.FieldCount div 2)-1 do
          CdsReciboAutonomo.FieldByName(CdsAux.Fields[c].FieldName+'_2').Value :=
            CdsAux.Fields[c].Value;
        CdsReciboAutonomo.Post;

        CdsAux.Next; // Pegar a próxima pessoa/página do Recibo Auxiliar
      end;
    until (CdsAux.EOF);
  finally
    CdsAux.Free;
  end;  
end;



procedure TRptReciboAutonomo.rpReciboPagamentoSmryBndAfterPrint(
  Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
