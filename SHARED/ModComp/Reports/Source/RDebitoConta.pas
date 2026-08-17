unit RDebitoConta;

{--------------------------------------------------------------------------------------------------
Rotina.........: *.dfm (sqlDemonstrativoDBC e rpDemonstrativoDBC - campo mesano), MontarDadosRelatorio, CrmRptCMBeforePrint
N. Sol..........: 217186-15443
N. Kintana......: 2053651
Data............: 12/01/2015
Responsável.....: Edilaine Ferraresi
Descrição.......: impressão do contra-cheque para mais de um mês
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 134951
Nº KINTANA..: 800471
Data........: 26/11/2010
Responsável.: Thaise Amaral Martins
Descrição...: Tela criada para impressão de novo relatório contendo as rubricas
              com débito em conta somente de funcionarios que autorizam o débio em conta.
-------------------------------------------------------------------------------------------------- }


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE,
  ppParameter, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, ppStrtch, ppRichTx, USistema, ppSubRpt;

type
  TRptDebitoConta = class(TFrmCmReport)
    ppDemonstrativoDBC: TppBDEPipeline;
    dsDemonstrativoDBC: TwwDataSource;
    CdsDemonstrativoDBC: TCMClientDataSet;
    sqlDemonstrativoDBC: TCMSqlParams;
    rpDemonstrativoDBC: TppReport;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppShape4: TppShape;
    ppLine11: TppLine;
    Figura3: TppImage;
    ppImage4: TppImage;
    ppLabel11: TppLabel;
    ppLabel1: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppShape9: TppShape;
    Figura1: TppImage;
    Figura2: TppImage;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLine39: TppLine;
    Figura3_2: TppImage;
    ppImage7: TppImage;
    ppLabel39: TppLabel;
    lblReciboPagamentoC_CUSTO2_2: TppLabel;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppDBText150: TppDBText;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppShape22: TppShape;
    Figura1_2: TppImage;
    Figura2_2: TppImage;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape10: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel12: TppLabel;
    ppShape23: TppShape;
    ppLabel13: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel21: TppLabel;
    ppDBText14: TppDBText;
    dbtxtReciboPagamentoDESCONTO2: TppDBText;
    dbtxtReciboPagamentoDESCONTO3: TppDBText;
    dbtxtReciboPagamentoDESCONTO4: TppDBText;
    dbtxtReciboPagamentoDESCONTO5: TppDBText;
    dbtxtReciboPagamentoDESCONTO6: TppDBText;
    dbtxtReciboPagamentoDESCONTO7: TppDBText;
    dbtxtReciboPagamentoDESCONTO8: TppDBText;
    dbtxtReciboPagamentoDESCONTO9: TppDBText;
    dbtxtReciboPagamentoDESCONTO10: TppDBText;
    dbtxtReciboPagamentoDESCONTO11: TppDBText;
    dbtxtReciboPagamentoDESCONTO12: TppDBText;
    dbtxtReciboPagamentoDESCONTO13: TppDBText;
    dbtxtReciboPagamentoDESCONTO14: TppDBText;
    dbtxtReciboPagamentoDESCONTO15: TppDBText;
    dbtxtReciboPagamentoREFERENCIA1: TppDBText;
    dbtxtReciboPagamentoREFERENCIA2: TppDBText;
    dbtxtReciboPagamentoREFERENCIA3: TppDBText;
    dbtxtReciboPagamentoREFERENCIA4: TppDBText;
    dbtxtReciboPagamentoREFERENCIA5: TppDBText;
    dbtxtReciboPagamentoREFERENCIA6: TppDBText;
    dbtxtReciboPagamentoREFERENCIA7: TppDBText;
    dbtxtReciboPagamentoREFERENCIA8: TppDBText;
    dbtxtReciboPagamentoREFERENCIA9: TppDBText;
    dbtxtReciboPagamentoREFERENCIA10: TppDBText;
    dbtxtReciboPagamentoREFERENCIA11: TppDBText;
    dbtxtReciboPagamentoREFERENCIA12: TppDBText;
    dbtxtReciboPagamentoREFERENCIA13: TppDBText;
    dbtxtReciboPagamentoREFERENCIA14: TppDBText;
    dbtxtReciboPagamentoREFERENCIA15: TppDBText;
    dbtxtReciboPagamentoRUBRICA1: TppDBText;
    dbtxtReciboPagamentoRUBRICA2: TppDBText;
    dbtxtReciboPagamentoRUBRICA3: TppDBText;
    dbtxtReciboPagamentoRUBRICA4: TppDBText;
    dbtxtReciboPagamentoRUBRICA5: TppDBText;
    dbtxtReciboPagamentoRUBRICA6: TppDBText;
    dbtxtReciboPagamentoRUBRICA7: TppDBText;
    dbtxtReciboPagamentoRUBRICA8: TppDBText;
    dbtxtReciboPagamentoRUBRICA9: TppDBText;
    dbtxtReciboPagamentoRUBRICA10: TppDBText;
    dbtxtReciboPagamentoRUBRICA11: TppDBText;
    dbtxtReciboPagamentoRUBRICA12: TppDBText;
    dbtxtReciboPagamentoRUBRICA13: TppDBText;
    dbtxtReciboPagamentoRUBRICA14: TppDBText;
    dbtxtReciboPagamentoRUBRICA15: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA1: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA2: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA3: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA4: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA5: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA6: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA7: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA8: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA9: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA10: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA11: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA12: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA13: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA14: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA15: TppDBText;
    ppDBText15: TppDBText;
    ppLabel22: TppLabel;
    dbtxtReciboPagamentoCODRUBRICA16: TppDBText;
    dbtxtReciboPagamentoRUBRICA16: TppDBText;
    dbtxtReciboPagamentoREFERENCIA16: TppDBText;
    dbtxtReciboPagamentoDESCONTO16: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA17: TppDBText;
    dbtxtReciboPagamentoRUBRICA17: TppDBText;
    dbtxtReciboPagamentoREFERENCIA17: TppDBText;
    dbtxtReciboPagamentoDESCONTO17: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA18: TppDBText;
    dbtxtReciboPagamentoRUBRICA18: TppDBText;
    dbtxtReciboPagamentoREFERENCIA18: TppDBText;
    dbtxtReciboPagamentoDESCONTO18: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA19: TppDBText;
    dbtxtReciboPagamentoRUBRICA24: TppDBText;
    dbtxtReciboPagamentoREFERENCIA19: TppDBText;
    dbtxtReciboPagamentoDESCONTO19: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA20: TppDBText;
    dbtxtReciboPagamentoRUBRICA19: TppDBText;
    dbtxtReciboPagamentoREFERENCIA20: TppDBText;
    dbtxtReciboPagamentoDESCONTO20: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA21: TppDBText;
    dbtxtReciboPagamentoRUBRICA20: TppDBText;
    dbtxtReciboPagamentoREFERENCIA21: TppDBText;
    dbtxtReciboPagamentoDESCONTO21: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA22: TppDBText;
    dbtxtReciboPagamentoRUBRICA21: TppDBText;
    dbtxtReciboPagamentoREFERENCIA22: TppDBText;
    dbtxtReciboPagamentoDESCONTO22: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA23: TppDBText;
    dbtxtReciboPagamentoRUBRICA22: TppDBText;
    dbtxtReciboPagamentoREFERENCIA23: TppDBText;
    dbtxtReciboPagamentoDESCONTO23: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA24: TppDBText;
    dbtxtReciboPagamentoRUBRICA23: TppDBText;
    dbtxtReciboPagamentoREFERENCIA24: TppDBText;
    dbtxtReciboPagamentoDESCONTO24: TppDBText;
    dbtxtReciboPagamentoCODRUBRICA25: TppDBText;
    dbtxtReciboPagamentoRUBRICA25: TppDBText;
    dbtxtReciboPagamentoREFERENCIA25: TppDBText;
    dbtxtReciboPagamentoDESCONTO25: TppDBText;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine18: TppLine;
    ppImage8: TppImage;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    lblReciboPagamentoCARGO_2: TppLabel;
    lblReciboPagamentoC_CUSTO_2: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel29: TppLabel;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText151: TppDBText;
    ppDBText152: TppDBText;
    ppDBText153: TppDBText;
    ppDBText154: TppDBText;
    ppDBText155: TppDBText;
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
    ppDBText171: TppDBText;
    ppDBText172: TppDBText;
    ppDBText173: TppDBText;
    ppDBText174: TppDBText;
    ppDBText175: TppDBText;
    ppDBText176: TppDBText;
    ppDBText177: TppDBText;
    ppDBText178: TppDBText;
    ppDBText179: TppDBText;
    ppDBText180: TppDBText;
    ppDBText181: TppDBText;
    ppDBText182: TppDBText;
    ppDBText183: TppDBText;
    ppDBText184: TppDBText;
    ppDBText185: TppDBText;
    ppDBText186: TppDBText;
    ppDBText187: TppDBText;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppDBText190: TppDBText;
    ppDBText191: TppDBText;
    ppDBText192: TppDBText;
    ppDBText193: TppDBText;
    ppDBText201: TppDBText;
    ppDBText202: TppDBText;
    ppDBText203: TppDBText;
    ppDBText205: TppDBText;
    ppDBText206: TppDBText;
    ppDBText207: TppDBText;
    ppDBText208: TppDBText;
    ppDBText210: TppDBText;
    ppDBText211: TppDBText;
    ppDBText212: TppDBText;
    ppDBText213: TppDBText;
    ppDBText215: TppDBText;
    ppDBText216: TppDBText;
    ppDBText217: TppDBText;
    ppDBText218: TppDBText;
    ppDBText220: TppDBText;
    ppDBText221: TppDBText;
    ppDBText222: TppDBText;
    ppDBText223: TppDBText;
    ppDBText225: TppDBText;
    ppDBText226: TppDBText;
    ppDBText227: TppDBText;
    ppDBText228: TppDBText;
    ppDBText230: TppDBText;
    ppDBText231: TppDBText;
    ppDBText232: TppDBText;
    ppDBText233: TppDBText;
    ppDBText235: TppDBText;
    ppDBText236: TppDBText;
    ppDBText237: TppDBText;
    ppDBText238: TppDBText;
    ppDBText240: TppDBText;
    ppDBText241: TppDBText;
    ppDBText242: TppDBText;
    ppDBText243: TppDBText;
    ppDBText245: TppDBText;
    ppDBText246: TppDBText;
    ppDBText247: TppDBText;
    ppDBText248: TppDBText;
    ppDBText250: TppDBText;
    lblReciboPagamentoAgencia_2: TppLabel;
    ppLabel38: TppLabel;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine42: TppLine;
    ppImage9: TppImage;
    ppDBText251: TppDBText;
    ppDBText252: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText132: TppDBText;
    ppLine14: TppLine;
    ppLabel25: TppLabel;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppLabel4: TppLabel;
    ppShape15: TppShape;
    ppLabel26: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppShape24: TppShape;
    ppLine20: TppLine;
    ppLabel33: TppLabel;
    ppShape12: TppShape;
    ppLine21: TppLine;
    ppShape25: TppShape;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine17: TppLine;
    ppLine26: TppLine;
    ppLine19: TppLine;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape5: TppShape;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppShape6: TppShape;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppLabel15: TppLabel;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppMesAno1E: TppDBText;
    ppMesAno1D: TppDBText;
    ppMesAno2E: TppDBText;
    ppMesAno2D: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    iPagina : integer;                                                  // edilaine - SOL 217186-15443 / KTN 2053651
    procedure MontarDadosRelatorio(iVez : integer; sMesAno : string);   // edilaine - SOL 217186-15443 / KTN 2053651
    procedure MontarDados_Suprimido;
  public
    iNumMeses : integer;                            // edilaine - SOL 217186-15443 / KTN 2053651
    IdEmpresa, MesRef, AnoRef, Ordenacao: integer;
    ListaIdEstab, ListaIdFunc, TipoContrato, SitFunc, NomeTabela, TipoPagamento,
    sFigura1, sFigura2, sFigura3, ListaIdRubrica: string;
    { Public declarations }
  end;

var
  RptDebitoConta: TRptDebitoConta;

implementation
uses dCds, uCtrlFuncoesRH, fAguarde, uCtrlUsoGeralRH;
{$R *.DFM}

procedure TRptDebitoConta.MontarDadosRelatorio(iVez : integer; sMesAno : string);   // edilaine - SOL 217186-15443 / KTN 2053651
var
  sMatricula: string;
  rSalBase, rBaseINSS, rBaseFGTS, rFGTSMes, rBaseIRRF, rProventos, rDescontos,
  rMargem1, rMargem2, rSalPart, rSalBaseCargoEstr, rEmprestimoFuncef, rExcessoDebito: real;
  {iPagina,} iRubrica : integer;      // edilaine - SOL 217186-15443 / KTN 2053651
  Marca: TBookmark;
  iTotal: Real;
  bTemDesconto: boolean;
  sDtExtenso : string;    // edilaine - SOL 217186-15443 / KTN 2053651
begin

  sDtExtenso := FU.MesExtensoAno( fu.RetornaAnoMes( StrToDate(sMesAno) ) );   // edilaine - SOL 217186-15443 / KTN 2053651

  if iVez = 0 then               // edilaine - SOL 217186-15443 / KTN 2053651
     sqlDemonstrativoDBC.Open;

  if not(dmCds.Cds.IsEmpty) then
  begin
    CdsDemonstrativoDBC.IndexName := '';
    //iPagina := 1;                     // edilaine - SOL 217186-15443 / KTN 2053651
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
      rProventos:=0; rDescontos:=0; rSalBaseCargoEstr:=0; rEmprestimoFuncef:=0; rExcessoDebito:=0;

      // Monto as informações em Páginas por Funcionário
      repeat
        CdsDemonstrativoDBC.Append;
        //if iPagina mod 2 > 0 then
        //  CdsDemonstrativoDBC.FieldByName('MATRICULA_2').asString := dmCds.Cds.FieldByName('MATRICULA').asString;

        CdsDemonstrativoDBC.FieldByName('MESANO').asString := sDtExtenso; // edilaine - SOL 217186-15443 / KTN 2053651

        CdsDemonstrativoDBC.FieldByName('MATRICULA').asString := dmCds.Cds.FieldByName('MATRICULA').asString;
        CdsDemonstrativoDBC.FieldByName('EMPREGADO').asString := dmCds.Cds.FieldByName('EMPREGADO').asString;
        CdsDemonstrativoDBC.FieldByName('PAGINA').asInteger := iPagina;
        CdsDemonstrativoDBC.FieldByName('CODCENTROCUSTO').asString := dmCds.Cds.FieldByName('CODCENTROCUSTO').asString;
        CdsDemonstrativoDBC.FieldByName('NUMAGENCIA').asString := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        CdsDemonstrativoDBC.FieldByName('NUMBANCO').asString := dmCds.Cds.FieldByName('NUMBANCO').asString;

        CdsDemonstrativoDBC.FieldByName('NUMCONTASALARIO').asString := dmCds.Cds.FieldByName('NUMCONTASALARIO').asString;
        CdsDemonstrativoDBC.FieldByName('TIPOCONTRATO').asString := dmCds.Cds.FieldByName('TIPOCONTRATO').asString;
        CdsDemonstrativoDBC.FieldByName('NUMDEPSALF').asInteger := dmCds.Cds.FieldByName('NUMDEPSALF').asInteger;
        CdsDemonstrativoDBC.FieldByName('NUMDEPIRRF').asInteger := dmCds.Cds.FieldByName('NUMDEPIRRF').asInteger;
        CdsDemonstrativoDBC.FieldByName('EMPRESA').asString := dmCds.Cds.FieldByName('EMPRESA').asString;
        CdsDemonstrativoDBC.FieldByName('CGC').asString := dmCds.Cds.FieldByName('CGC').asString;

        if (dmCds.Cds.FieldByName('TIPOCONTRATO').asString <> 'A') then
        begin
          CdsDemonstrativoDBC.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('NOMECENTROCUSTO').asString;
          CdsDemonstrativoDBC.FieldByName('CARGO').asString := trim(dmCds.Cds.FieldByName('TITULO').asString) +
            trim(dmCds.Cds.FieldByName('FUNCAO').asString);
          CdsDemonstrativoDBC.FieldByName('NUMAGENCIA').asString := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        end
        else                                                  
        begin
          CdsDemonstrativoDBC.FieldByName('C_CUSTO').asString := dmCds.Cds.FieldByName('TITULO').asString;
          CdsDemonstrativoDBC.FieldByName('CARGO').asString :=
            dmCds.Cds.FieldByName('PIS').asString +
            FU.Replicate(' ', 32)+
            dmCds.Cds.FieldByName('CPF').asString;
          CdsDemonstrativoDBC.FieldByName('NUMAGENCIA').asString :=
            dmCds.Cds.FieldByName('NUMBANCO').asString + ' / ' +
            dmCds.Cds.FieldByName('NUMAGENCIA').asString;
        end;

        rSalBase := dmCds.Cds.FieldByName('SALBASE').asFloat;

        // Preencho cada Linha da Página do Funcionário com suas Rubricas
        iRubrica := 1;
        iTotal:= 0;
        repeat
          CdsDemonstrativoDBC.FieldByName('CODRUBRICA'+IntToStr(iRubrica)).asString  := dmCds.Cds.FieldByName('CODRUBRICACLIENTE').asString;
          CdsDemonstrativoDBC.FieldByName('RUBRICA'+IntToStr(iRubrica)).asString     := dmCds.Cds.FieldByName('RUBRICA').asString;
          CdsDemonstrativoDBC.FieldByName('REFERENCIA'+IntToStr(iRubrica)).asString  := dmCds.Cds.FieldByName('REFERENCIA').asString;
          CdsDemonstrativoDBC.FieldByName('VALOR'+IntToStr(iRubrica)).AsFloat        := dmCds.Cds.FieldByName('VALOR').AsFloat;

          iTotal:= iTotal + dmCds.Cds.FieldByName('VALOR').AsFloat;

          CdsDemonstrativoDBC.FieldByName('TOT_GERAL').AsFloat:= iTotal;
          Inc(iRubrica);
          sMatricula := dmCds.Cds.FieldByName('MATRICULA').asString;


          dmCds.Cds.Next;
          until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
                 (dmCds.Cds.EOF) or
                 ((sMatricula = dmCds.Cds.FieldByName('MATRICULA').asString) and
                 (dmCds.Cds.FieldByName('TIPORUBRICA').asInteger < 2) and
                  (iRubrica = 26));
          CdsDemonstrativoDBC.Post;

          Inc(iPagina);
          until (sMatricula <> dmCds.Cds.FieldByName('MATRICULA').asString) or
               (dmCds.Cds.EOF);
    end;
  {  MontarDados_Suprimido;    // edilaine - SOL 217186-15443 / KTN 2053651 - comentario inicio
  end
  else
  begin
    CdsDemonstrativoDBC.Insert;
    CdsDemonstrativoDBC.Post;
  } // edilaine - SOL 217186-15443 / KTN 2053651 - comentario - fim
  end;
end;

procedure TRptDebitoConta.CrmRptCMBeforePrint(Sender: TObject);
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
      //Add('  F.NUMCONTASALARIO,');
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
      Add('  DECODE(SALCONTRA.SALARIOCONTRATUAL,');
      Add('    NULL, F.SALARIOATUAL * (CASE');
      Add('                              WHEN F.TIPOPAGAMENTO = ''M'' THEN 1');
      Add('                              WHEN F.TIPOPAGAMENTO = ''D'' THEN 30');
      Add('                              WHEN F.TIPOPAGAMENTO = ''T'' THEN 1');
      Add('                              ELSE HT.JORNADAMENSAL');
      Add('                            END),');
      Add('    SALCONTRA.SALARIOCONTRATUAL) AS SALBASE, ');
      Add('    CB.CONTACORRENTE AS NUMCONTASALARIO');
      Add('FROM');
      Add('  ' +NomeTabela+ ' H, PESSOA PJ, PESSOA PF, PESSOAFISICA PFIS, CONTABANCARIA CB, ');

      //Thaise: Trazendo o excesso de débito + débito em conta
      Add('  ( ');
      Add('select * ');
      Add('  from provdesc ');
      Add(' where idprovento in (select idproventoexcessodeb ');
      Add('                       from provdesc ');
      Add('                      where flgexcessodeb = 1 ');
      Add('                      and   FLGDEBCONTA = 1 ) ');
      Add('   ) P, ');

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
        Add(FU.MontaLinhaSelSQL('  (F.IDPESSOA',ListaIdFunc,8));

      //Rubrica(s) selecionada(s)
      if (ListaIdRubrica <> '') then
        Add(FU.MontaLinhaSelSQL('  (RP.CODPROVDESC',ListaIdRubrica,8));

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
      //Add('  (F.IDAGENCIASALARIO = AG.IDPESSOA(+)) AND');
      Add('  (AG.IDBANCO         = BA.IDPESSOA(+)) AND');
      Add('  (F.IDPESSOA         = HST.IDPESSOA(+)) AND');
      Add('  (HST.IDFUNCAO       = C2.IDCARGO(+)) AND');
      Add('  (CB.IDPESSOA = F.IDPESSOA) AND');
      Add('  (CB.IDAGENCIA = AG.IDPESSOA) AND');
      Add('  (CB.FLGCONTAPREF = 1) AND');

      //Thaise: Somente os funcionários cujas matriculas estão cadastradas na Tabela Genérica, ou seja,
      //que autorizam o débito em conta.
      Add('    F.MATRICULA IN (SELECT V.VALOR ');
      Add('      FROM TABGENERUSUARIO T , VALTABGENER V ');
      Add('      WHERE T.IDUSUARIO = ' + InttoStr(Sistema.IdUsuario));
      Add('      AND V.CODTABELA = ''DEBCONTA''');
      Add('      AND V.CODCAMPO = ''MATRICULA'')');

      Add('ORDER BY');
      case (Ordenacao) of
        0 : Add('  EMPRESA, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
        1 : Add('  EMPRESA, NOMECENTROCUSTO, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
        2 : Add('  EMPRESA, NOMECENTROCUSTO, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
        3 : Add('  EMPRESA, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
      end;
      SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');
    end;
    dmCds.sql.Open;

    // edilaine - SOL 217186-15443 / KTN 2053651 - comentado inicio
    {ppAnoMesRef1_Cab.Caption := FU.MesExtensoAno(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef));
    ppAnoMesRef2_Cab.Caption := FU.MesExtensoAno(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef));
    ppAnoMesRef1_Det.Caption := FU.MesExtensoAno(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef));
    ppAnoMesRef2_Det.Caption := FU.MesExtensoAno(IntToStr(AnoRef) +'/'+ FU.PoeZero(MesRef));
    } // edilaine - SOL 217186-15443 / KTN 2053651 - comentado fim

    // Monta Query Principal
    MontarDadosRelatorio(iNumVezes, sMesAtual);

  end;
  MontarDados_Suprimido;
  // edilaine - SOL 217186-15443 / KTN 2053651 - fim

  CdsDemonstrativoDBC.First;
  frmAguarde.Apaga;
end;

procedure TRptDebitoConta.MontarDados_Suprimido;
var
  c: byte;
  CdsAux: TCMClientDataSet;
begin
  // Se for uma pessoa, não há motivo para suprimir os dados
  if (CdsDemonstrativoDBC.RecordCount = 1) then
    exit;

  CdsAux := TCMClientDataSet.Create(Self);
  try
    CdsAux.Data := CdsDemonstrativoDBC.Data;
    CdsAux.First;
    CdsDemonstrativoDBC.EmptyDataSet;
    repeat
      CdsDemonstrativoDBC.Append;
      for c:=0 to (CdsAux.FieldCount div 2)-1 do
        CdsDemonstrativoDBC.Fields[c].Value := CdsAux.Fields[c].Value;
      CdsDemonstrativoDBC.Post;

      CdsAux.Next; // Pegar a próxima pessoa/página do Recibo Auxiliar

      if not(CdsAux.EOF) then
      begin
        CdsDemonstrativoDBC.Edit;
        for c:=0 to (CdsAux.FieldCount div 2)-1 do
          CdsDemonstrativoDBC.FieldByName(CdsAux.Fields[c].FieldName+'_2').Value :=
            CdsAux.Fields[c].Value;
        CdsDemonstrativoDBC.Post;

        CdsAux.Next; // Pegar a próxima pessoa/página do Recibo Auxiliar
      end;
    until (CdsAux.EOF);
  finally
    CdsAux.Free;
  end;
end;

end.
