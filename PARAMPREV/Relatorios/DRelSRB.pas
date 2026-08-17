// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor       : Paulo Ramos
// Data        : 30/05/2006
// Pendencia   : 22491
// Rotina      : dfm
// Alteração   : Ajuste nos sqls dos objetos updatesql.
//------------------------------------------------------------------------------
// Rotinas     : PreencheRubricasCELULAR e PreencheRubricasBRT
// Autor(a)    : Gleyber
// Data        : 25/11/2003
// Pendencia   : 15686
// Alteração   : Inclusão de novas rubricas criada pelas Patrocinadoras
//               Celular CRT: ADICIONAL DE TRANSFERÊNCIA           - 25471
//               BRT        : SALÁRIO LICENÇA DOENÇA/ACID TRABALHO - 21084
//------------------------------------------------------------------------------
// Rotinas     :
// Autor(a)    : Augusto
// Data        : 05/08/2003
// Pendencia   :
// Alteração   : Acerto no Controle de Férias. (FCRT)
//------------------------------------------------------------------------------
// Rotinas     :
// Autor(a)    : Augusto
// Data        : 21/07/2003
// Pendencia   : 14416 
// Alteração   : Inclusão da Rubrica 3662 nos calculos
//------------------------------------------------------------------------------
// Rotinas     :
// Autor(a)    : Augusto
// Data        : 17/06/2003
// Alteração   : Inclusão da Rubrica 25160 nos calculos 
//------------------------------------------------------------------------------
// Rotinas     :
// Autor(a)    : Augusto
// Data        : 06/05/2003
// Alteração   : Utilizar o numero de meses que possuem valores para calcular a média
//------------------------------------------------------------------------------
// Rotinas     :
// Autor(a)    : Augusto
// Data        : 05/05/2003
// Alteração   : Inclusao da rubrica 5128 na soma dos salarios
//------------------------------------------------------------------------------

unit DRelSRB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppVar,
  ppRelatv, ppDBPipe, ppModule, daDataModule, ppStrtch, ppSubRpt, Grids,
  DBGrids, ppEndUsr;

type
  TdtmRelSRB = class(TdtmReports)
    ppBdeSRB: TppBDEPipeline;
    dsSRB: TwwDataSource;
    QrySRB: TwwQuery;
    ppSRB: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel16: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppFooterBand5: TppFooterBand;
    ppLine10: TppLine;
    ppLabel18: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    QryRubricasA: TwwQuery;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText12: TppDBText;
    dsSRBAux: TDataSource;
    ppBdeSRBAux: TppBDEPipeline;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBText13: TppDBText;
    ppLabel31: TppLabel;
    ppDBText14: TppDBText;
    ppLabel32: TppLabel;
    ppDBText15: TppDBText;
    ppLabel33: TppLabel;
    ppDBText16: TppDBText;
    ppLabel34: TppLabel;
    ppDBText17: TppDBText;
    ppLabel35: TppLabel;
    ppDBText18: TppDBText;
    ppLabel36: TppLabel;
    ppDBText19: TppDBText;
    ppLabel37: TppLabel;
    QrySRBAux: TwwQuery;
    ppDBText20: TppDBText;
    ppLabel38: TppLabel;
    dsSRBParcelaB: TDataSource;
    ppBdeSRBAuxB: TppBDEPipeline;
    QrySRBAuxB: TwwQuery;
    QryRubricasB: TwwQuery;
    UpdSRBAux: TUpdateSQL;
    updSRBParcelaB: TUpdateSQL;
    ppSRBB: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppDetailBand7: TppDetailBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel55: TppLabel;
    ppLabel58: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppFooterBand6: TppFooterBand;
    ppLine26: TppLine;
    ppLabel62: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    qryAux: TwwQuery;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText38: TppDBText;
    ppLabel13: TppLabel;
    ppDBText39: TppDBText;
    ppLabel15: TppLabel;
    ppLabel20: TppLabel;
    ppDBText40: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel28: TppLabel;
    ppLabel61: TppLabel;
    ppLabel63: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppDBText41: TppDBText;
    ppLabel39: TppLabel;
    ppDBParcelaB: TppDBText;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppDBResultado: TppLabel;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    rpResumoCobrDBImage1: TppDBImage;
    rpResumoCobrDBText1: TppDBText;
    rpResumoCobrDBText2: TppDBText;
    rpResumoCobrDBText3: TppDBText;
    rpResumoCobrDBText10: TppDBText;
    rpResumoCobrDBText11: TppDBText;
    rpResumoCobrDBText12: TppDBText;
    rpResumoCobrDBText13: TppDBText;
    rpResumoCobrDBText14: TppDBText;
    rpResumoCobrLabel10: TppLabel;
    ppShape1: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLinhaParcA: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel17: TppLabel;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel66: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppShape8: TppShape;
    ppLabel40: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppLabel69: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLabel49: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppShape11: TppShape;
    ppLabel54: TppLabel;
    ppLabel56: TppLabel;
    ppShape12: TppShape;
    ppLine7: TppLine;
    DsgnCM: TppDesigner;
    DsgnCMB: TppDesigner;
    ppSubTotalSRB: TppLabel;
    qryRelINSS: TwwQuery;
    updRelINSS: TUpdateSQL;
    dsRelINSS: TDataSource;
    ppBDERelINSS: TppBDEPipeline;
    ppRelINSS: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape13: TppShape;
    ppDBText33: TppDBText;
    ppShape14: TppShape;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppDBText34: TppDBText;
    ppLabel70: TppLabel;
    ppDBText35: TppDBText;
    ppLabel71: TppLabel;
    ppDBText36: TppDBText;
    ppLabel72: TppLabel;
    ppDBText53: TppDBText;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppDBText54: TppDBText;
    ppLabel75: TppLabel;
    ppDBText55: TppDBText;
    ppLabel76: TppLabel;
    ppDBText56: TppDBText;
    ppDBImage2: TppDBImage;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppLabel77: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape15: TppShape;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppLabel87: TppLabel;
    ppShape18: TppShape;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLine8: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine9: TppLine;
    ppLabel90: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    DsgnRelINSS: TppDesigner;
    qryRubricasINSS: TwwQuery;
    ppLabel78: TppLabel;
    ppDBText65: TppDBText;
    ppLabel91: TppLabel;
    ppDBText72: TppDBText;
    ppDBCalc2: TppDBCalc;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppINSSRESULT: TppLabel;
    ppINSSMEDIA: TppLabel;
    ppLabel84: TppLabel;
    ppDBText70: TppDBText;
    ppShape7: TppShape;
    ppDBText21: TppDBText;
    ppLabel41: TppLabel;
    ppDBText22: TppDBText;
    ppLabel42: TppLabel;
    ppDBText23: TppDBText;
    ppLabel43: TppLabel;
    ppDBText24: TppDBText;
    ppLabel44: TppLabel;
    ppDBText37: TppDBText;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDBText42: TppDBText;
    ppLabel67: TppLabel;
    ppDBText43: TppDBText;
    ppLabel68: TppLabel;
    ppDBText44: TppDBText;
    ppLabel95: TppLabel;
    ppDBText71: TppDBText;
    ppShape2: TppShape;
    ppDBText5: TppDBText;
    ppLabel19: TppLabel;
    ppDBText6: TppDBText;
    ppLabel21: TppLabel;
    ppDBText7: TppDBText;
    ppLabel22: TppLabel;
    ppDBText8: TppDBText;
    ppLabel23: TppLabel;
    ppDBText9: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText10: TppDBText;
    ppLabel26: TppLabel;
    ppDBText11: TppDBText;
    ppLabel27: TppLabel;
    ppDBText27: TppDBText;
    ppLabel96: TppLabel;
    ppDBText73: TppDBText;
    ppLabel97: TppLabel;
    ppINSSFATORPREV: TppLabel;
    qryRubricasAAux: TwwQuery;
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
    dTotalParcelaA, dTotalParcelaB :double;
  public
    { Public declarations }
    sIdCalculo, sNomeIndiceTeto, sNomeIndiceReaj, sAnoMesRef, sDataReferencia,
    sGrupoRubrica : String;
    iIdPessoa, iIdPessJur, iIdCalculo, iIdBeneficio : Integer;
    sAnoMesInicio, sAnoMesFinal : string;
    sRubricasANAOConsiderar, sRubricasAConsiderar : string;

    // Variaveis para INSS
    iNumSalarios : integer;
    dValorTetoUltimoMes,
    dSomaINSS, dFatorPrevidenciario : double;
    varfields : variant;
    iNumDiasFERIAS  : double;
    sMesesFERIAS,
    sMaiorMesFERIAS   : string;
    bHistRubSal      : boolean;
    procedure PreencheRubricasFCRT;
    procedure PreencheRubricasCELULAR;
    procedure PreencheRubricasBRT;
    procedure MontaQueryParcelaA;
    procedure MontaQueryParcelaB;
    procedure MontaQueryINSS;
    Function  MostraParam(Form: string): boolean; OverRide;
    Function  AcertaHistorico(sAnoMesRef, sNomeIndiceReaj :String): String;
    procedure TrataRubricasFerias;
  end;

var
  dtmRelSRB: TdtmRelSRB;
  TipoRel : LongInt;

implementation

uses UDataBase, UAdmPREV;

{$R *.DFM}

function TdtmRelSRB.MostraParam(Form: string): boolean;
var frm : TForm;
begin
{     frm := nil;
     if UpperCase(Form)= 'FRMPARAMRELATREGRA1' then begin //Relat. Formulas
        TipoRel := 1;
        frm := TfrmParamRelatRegra.Create(Application);
        frm.Caption := 'Seleção de Fórmulas para Impressão';
     end else begin
         if UpperCase(Form)= 'FRMPARAMRELATREGRA2' then begin //Relat. Variaveis
            TipoRel := 2;
            frm := TfrmParamRelatRegra.Create(Application);
            frm.Caption := 'Seleção de Variáveis para Impressão';
         end else begin
             if UpperCase(Form)= 'FRMPARAMRELATREGRA3' then begin //Relat. Campos
                TipoRel := 3;
                frm := TfrmParamRelatRegra.Create(Application);
                frm.Caption := 'Seleção de Campos para Impressão';
             end else begin
                 if UpperCase(Form)= 'FRMPARAMRELATREGRA4' then begin //Relat. Regras
                    TipoRel := 4;
                    frm := TfrmParamRelatRegra.Create(Application);
                    frm.Caption := 'Seleção de Regras para Impressão';
                 end;
             end;
         end;
     end;

     if frm = nil then Result := False
     else begin
          with frm do begin
               Result := (Showmodal = mrOk);
               Free;
          end;
     end;      }
end;
procedure TdtmRelSRB.PreencheRubricasFCRT;
begin

{  // RUBRICAS CONTEMPLADAS
      1000,      1115,      1007,      1001,      1120,      1332,
      3384,      1127,      3385,      1122,      1333,      1328,
      1189,      1060,      1058,      3383,      1396,      1194,
      1009,      1008,      1165,      1184,      1188,      3381

}
   if (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1000')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1115')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1007')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1001')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '3381')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '25167') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '3662')  or { Augusto 21/07/2003 }
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '25160') or { Augusto 17/06/2003 }
//      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '25168') or { Augusto 25/06/2003 }
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '378') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '385') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '719') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '726') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '379') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '386') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '720') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '727') 
//      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '20003')
   then begin
      QrySRBAux.FieldByName('SALARIO').AsFloat :=  QrySRBAux.FieldByName('SALARIO').AsFloat + QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1120') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1332') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '3384') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1127')
   then begin
      QrySRBAux.FieldByName('ANUENIO').AsFloat :=  QrySRBAux.FieldByName('ANUENIO').AsFloat + QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '3385') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1122') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1333') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1328') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1189') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1060') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1058') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '3383')
   then begin
      QrySRBAux.FieldByName('FUNCAOGRATIF').AsFloat :=  QrySRBAux.FieldByName('FUNCAOGRATIF').AsFloat+ QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1396') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1194')
   then begin
      QrySRBAux.FieldByName('GRATFERIAS').AsFloat :=  QrySRBAux.FieldByName('GRATFERIAS').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1009') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1008')
   then begin
      QrySRBAux.FieldByName('DIFERENCA').AsFloat :=  QrySRBAux.FieldByName('DIFERENCA').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1165')
   then begin
      QrySRBAux.FieldByName('PROMOCAORETRO').AsFloat :=  QrySRBAux.FieldByName('PROMOCAORETRO').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1184') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '1188')
   then begin
      QrySRBAux.FieldByName('FERIAS').AsFloat :=  QrySRBAux.FieldByName('FERIAS').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end


end;

procedure TdtmRelSRB.PreencheRubricasCELULAR;
begin
   if (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5087') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5064') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5179') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5217') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5088') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5086') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5090') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5037') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5023') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5150') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5085') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5089') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5261') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5022') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5036') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5149') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5002') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5008') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5032') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5280') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '3662') or { Augusto 21/07/2003 }
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5128') or { Augusto 05/05/2003 }
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '25167') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '25160') or { Augusto 17/06/2003 }
//      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '25471') or // Gleyber - 25/11/2003 - Pendência 15686
//      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '25168') or { Augusto 25/06/2003 }
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '378') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '385') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '719') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '726') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '379') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '386') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '720') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '727')

      //      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '20003')
   then begin
      QrySRBAux.FieldByName('SALARIO').AsFloat :=  QrySRBAux.FieldByName('SALARIO').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5034') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5091') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5221') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5035') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5004') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5003') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5119')
   then begin
      QrySRBAux.FieldByName('ANUENIO').AsFloat := QrySRBAux.FieldByName('ANUENIO').AsFloat+ QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5227') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5226') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5052') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5286') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5053') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5051')
   then begin
      varFields[0] := QryRubricasA.FieldByName('MES').AsString;
      varFields[1] := '5787';

      if qryRubricasAAux.Locate('MES;IDRUBRICA',varFields,[loCaseInsensitive])
      then begin
         if iNumDiasFERIAS > 30
         then begin
            if QryRubricasA.FieldByName('MES').AsString = sMaiorMesFERIAS
            then QrySRBAux.FieldByName('GRATFERIAS').AsFloat := QrySRBAux.FieldByName('GRATFERIAS').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
         end
         else QrySRBAux.FieldByName('GRATFERIAS').AsFloat := QrySRBAux.FieldByName('GRATFERIAS').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
      end;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5232') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5063') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5062') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5060') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5120')
   then begin
      QrySRBAux.FieldByName('FUNCAOGRATIF').AsFloat := QrySRBAux.FieldByName('FUNCAOGRATIF').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5072') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5070') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5071')
   then begin
      QrySRBAux.FieldByName('HORAEXTRAINCORP').AsFloat := QrySRBAux.FieldByName('HORAEXTRAINCORP').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5225') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5050') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5156') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5049') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '5155')
   then begin
      QrySRBAux.FieldByName('FERIAS').AsFloat := QrySRBAux.FieldByName('FERIAS').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end;

end;

procedure TdtmRelSRB.PreencheRubricasBRT;
var bAchou : boolean;
begin

   // Especificacao do Cliente para a patrocinadora BRT - BRASILTELECOM
   // Se dentro dos 12 últimos meses de salários-de-participação, existir
   // mais de uma rubrica 21140-Gratif. de Férias, então somar a quantidade
   // de dias do código 23318-Res Quant Dias Férias Mês e se a quantidade
   // de dias for < ou = a 31 dias, deixar no cálculo as duas rubricas 21140
   // e seus códigos de devoluções ou diferenças em suas incidências ou
   // posteriores a elas.
   // Se for > que 31 dias, deixar apenas a última incidência( mais atual)
   // da rubrica e seus códigos de devolução e/ou diferenças dessa incidência
   // ou posteriores a ela.
   // Se dentro dos 12 últimos meses de salários-de-participação,
   // existir apenas uma rubrica 21140-Gratif. de Férias, deixar no cálculo
   // a rubrica 21140 e seus códigos de devoluções ou diferenças
   // em sua incidência ou posterior a ela.
   // Se dentro dos 12 últimos meses de salários-de-participação,
   // não existir a rubrica 21140-Gratif. de Férias, verificar se existe a
   // rubrica  20045 nesse período.
   // Se houver, utilizar os valores da incidência do código mais atual
   // Buscar as ocorrencias da rubrica 21140 nos 12 ultimos meses

   if (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21559') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21455') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21702') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21173') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21486') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21701') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21528') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21522') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21704') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21575') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21008') or
//       (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21002') or  { Augusto 26/08/2003 }
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21248') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21708') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21560') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21703') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21689') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21671') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21700') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21574') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21007') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21001') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21247') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21688') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21670') or
//      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21699') or { Augusto 26/08/2003 }
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21557') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21391') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21000') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21573') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21006') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21339') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21246') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21346') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21345') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9147')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9146')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9243')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9175')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9002')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9143')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9301')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9364')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9362')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9334')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9384')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9310')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9282')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9148')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9155')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9131')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9134')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9161')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9166')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9185')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9365')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9000')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9023')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9145')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9034') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9142')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9144')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9151')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9154')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9156')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9137')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9009')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9208')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9209')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '25167') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '3662')  or { Augusto 21/07/2003 }
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '25160') or { Augusto 17/06/2003 }
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21084') or // Gleyber - 25/11/2003 - Pendência 15686
//      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '25168') or { Augusto 25/06/2003 }
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '378') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '385') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '719') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '726') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '379') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '386') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '720') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '727') 
      
//      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '20003')
   then begin
      QrySRBAux.FieldByName('SALARIO').AsFloat :=  QrySRBAux.FieldByName('SALARIO').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21362') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21343') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21360') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21597') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21026') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21788') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21786') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21359') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21596') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21025') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21167') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21024') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21166') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21595') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21685') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21358') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9173') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9164') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9167') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9098') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9383') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9370') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9369') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9306') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9371') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9307') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9288') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9001') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9163') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9165') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9168') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9162')
   then begin
      QrySRBAux.FieldByName('ANUENIO').AsFloat := QrySRBAux.FieldByName('ANUENIO').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21142') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21240') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21154') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21141') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21153') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21158') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21140') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21239') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21152') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21242') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21385') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21384') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9091')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9283')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9285')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21147') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '20045')
   then begin
      QrySRBAux.FieldByName('GRATFERIAS').AsFloat := QrySRBAux.FieldByName('GRATFERIAS').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat   
{      if QryRubricasA.FieldByName('IDRUBRICA').AsString = '20045'
      then QrySRBAux.FieldByName('GRATFERIAS').AsFloat := QrySRBAux.FieldByName('GRATFERIAS').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat
      else begin
         varFields[0] := QryRubricasA.FieldByName('MES').AsString;
         varFields[1] := '23318';

         if qryRubricasAAux.Locate('MES;IDRUBRICA',varFields,[loCaseInsensitive])
         then begin
            if iNumDiasFERIAS > 31
            then begin
               if QryRubricasA.FieldByName('MES').AsString = sMaiorMesFERIAS
               then QrySRBAux.FieldByName('GRATFERIAS').AsFloat := QrySRBAux.FieldByName('GRATFERIAS').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
            end
            else QrySRBAux.FieldByName('GRATFERIAS').AsFloat := QrySRBAux.FieldByName('GRATFERIAS').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
         end;
      end;
}
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21628') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21183') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21784') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21627') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21224') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21361') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21626') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21181') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21223') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9033') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9031') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9302') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9305') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9304') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9292') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9026') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9028') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9024') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9025') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21182') // nao está na planilha do Cicero mas Claudia pediu para incluir
   then begin
      QrySRBAux.FieldByName('FUNCAOGRATIF').AsFloat := QrySRBAux.FieldByName('FUNCAOGRATIF').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21022') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21076') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21009') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21021') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9062')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9059')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9057')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9058')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9063')
   then begin
      QrySRBAux.FieldByName('HORAEXTRAINCORP').AsFloat := QrySRBAux.FieldByName('HORAEXTRAINCORP').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21156') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21539') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21139') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21276') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21151') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21118') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21138') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21275') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21155') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21150') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21262') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21157') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21161') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21162') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21137') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21274') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21352') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21237') or
//      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21263') or  // retirado em 04.11.2002 a pedido da Adriana
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21546') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21149') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21238') or
//      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21261') or // retirado em 04.11.2002 a pedido da Adriana
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21146') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9093') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9284') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9258') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9139') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9085') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9087') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9256') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9300') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9259') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9079') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9271') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9272') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9257') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '20047') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '20043')
   then begin
      QrySRBAux.FieldByName('FERIAS').AsFloat := QrySRBAux.FieldByName('FERIAS').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21647') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9185')
   then begin
      QrySRBAux.FieldByName('PERICJUDICIAL').AsFloat := QrySRBAux.FieldByName('PERICJUDICIAL').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
   else if
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21186') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21189') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21185') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21188') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21184') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '21187') or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9205')  or
      (QryRubricasA.FieldByName('IDRUBRICA').AsString = '9201')
   then begin
      QrySRBAux.FieldByName('GDVGOG').AsFloat := QrySRBAux.FieldByName('GDVGOG').AsFloat+QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
   end
end;

{------------------------------------------------------------------------------}
procedure TdtmRelSRB.ppSummaryBand1BeforePrint(Sender: TObject);
begin
  inherited;
  ppDBResultado.Caption := FormatFloat('###,##0.00', dTotalParcelaA + dTotalParcelaB);
  ppSubTotalSRB.Caption := FormatFloat('###,##0.00', dTotalParcelaA);
end;

procedure TdtmRelSRB.ppDetailBand6BeforePrint(Sender: TObject);
begin
  inherited;
  if ppLinhaParcA.Brush.Color = clWhite
  then ppLinhaParcA.Brush.Color := clSilver
  else ppLinhaParcA.Brush.Color := clWhite;
end;

procedure TdtmRelSRB.MontaQueryParcelaA;
Var
  sMesAno, sAnoMesIndice, sSQL,
  sAnoMesAtual, sAnoMesInicioLocal : String;
  iNumLinha : integer;
  dParcelaB,
  dTotalRubrica : double;
  dTotalCompara : double; // Gleyber - 01/04/2003

begin
  inherited;
  { Tabela Virtual }
  QrySRBAux.Close;
  QrySRBAux.Open;
  QrySRBAux.Delete;

  varFields    := VarArrayCreate([0,1],varVariant);


  { Preenche Query principal do relatório com 12 meses zerados }
  // Calcula data de Inicio do Processamento
  sSQL := 'SELECT TO_CHAR(ADD_MONTHS(TO_DATE('''+sAnoMesRef+''', ''YYYY/MM''),-12 ),''YYYY/MM'') AS ANOMESPROC '+
          'FROM DUAL ';
  FazQuery(QryAux, sSQL);
  sAnoMesInicio := sAnoMesRef;
  sAnoMesInicioLocal := QryAux.FieldByName('ANOMESPROC').AsString;
  sAnoMesFinal := SAnoMesAnterior(sAnoMesRef);
  sAnoMesAtual := sAnoMesInicioLocal;
  while sAnoMesAtual <= sAnoMesFinal do
  begin
     // Transfere dados para qry virtual
     QrySRBAux.Append;
     // Zera campos
     QrySRBAux.FieldByName('SALARIO').AsFloat         := 0; // preenchido por rubricas
     QrySRBAux.FieldByName('ANUENIO').AsFloat         := 0; // preenchido por rubricas
     QrySRBAux.FieldByName('FERIAS').AsFloat          := 0; // preenchido por rubricas
     QrySRBAux.FieldByName('GRATFERIAS').AsFloat      := 0; // preenchido por rubricas
     QrySRBAux.FieldByName('HORAEXTRAINCORP').AsFloat := 0; // preenchido por rubricas
     QrySRBAux.FieldByName('PERICJUDICIAL').AsFloat   := 0; // preenchido por rubricas
     QrySRBAux.FieldByName('PROMOCAORETRO').AsFloat   := 0; // preenchido por rubricas
     QrySRBAux.FieldByName('DIFERENCASCOMPL').AsFloat := 0; // preenchido por rubricas
     QrySRBAux.FieldByName('GDVGOG').AsFloat          := 0; // preenchido por rubricas
     QrySRBAux.FieldByName('FUNCAOGRATIF').AsFloat    := 0; // preenchido por rubricas
     QrySRBAux.FieldByName('LIMITANTE').AsFloat       := 0; // preenchido da detcalculo
     QrySRBAux.FieldByName('VALORCOMPAR').AsFloat     := 0; // calculado
     QrySRBAux.FieldByName('SUBTOTAL').AsFloat        := 0; // calculado
     QrySRBAux.FieldByName('INDICE').AsFloat          := 0; // preenchido por rubricas
     QrySRBAux.FieldByName('SUBCORRIGIDO').AsFloat    := 0; // calculado
     QrySRBAux.FieldByName('INSALUBRIDADE').AsFloat   := 0; // ????
     QrySRBAux.FieldByName('FATOR').AsFloat           := 0; // ????
     QrySRBAux.FieldByName('TOTALGERAL').AsFloat      := 0; // calculado
     QrySRBAux.FieldByName('PARCELAB').AsFloat        := 0; // calculado
     sSQL := ' SELECT TO_CHAR(TO_DATE('''+sAnoMesAtual+''',''YYYY/MM''),''MON/YYYY'') AS MESANO '+
             ' FROM DUAL ';
     FazQuery(QryAux, sSQL);

     QrySRBAux.FieldByName('DATA').AsString           := qryAux.FieldByName('MESANO').AsString;
     QrySRBAux.FieldByName('ANOMES').AsString         := sAnoMesAtual;
     QrySRBAux.Post;
     sAnoMesAtual := ProximoAnoMes(StrToInt(Copy(sAnoMesAtual,6,2)), StrToInt(Copy(sAnoMesAtual,1,4)) );
  end;
  {----------------------------------------------------------------------------}
  { PROCESSAMENTO PARCELA "A"                                                  }
  {----------------------------------------------------------------------------}

  // CAMILLE - 13.02.2003
  TrataRubricasFerias;


  { Rubricas da Media }
  QryRubricasA.Close;
  QryRubricasA.SQL.Clear;
  if not bHistRubSal
  then begin
     sSQL := ' SELECT TO_CHAR(TO_DATE(D.ANOMESREF,''YYYY/MM''),''MON/YYYY'') AS MESANO,   '+
          '        P.IDGRUPORUBRICA, EL.IDPESSJUR, D.IDRUBRICA,                           '+
          '        D.VLRRUBRICA VALORPROVENTO,  D.ANOMESREF MES                           '+
          ' FROM   ELEGPATRO EL, DETCALCULO D, PROVDESC P                                 '+
          ' WHERE  EL.IDPESSOA   = '+ IntToStr(iIdPessoa)                                  +
          ' AND    EL.IDPESSJUR  = '+ IntToStr(iIdPessJur)                                 +
          ' AND    D.IDCALCULO = '+OraNumero(sIdCalculo)                                   +
          ' AND    D.ANOMESREF < '+ QuotedStr(sAnoMesRef)                                  +
          ' AND    D.ANOMESREF >= TO_CHAR(ADD_MONTHS(TO_DATE('+ QuotedStr(sAnoMesRef)+', ''YYYY/MM''),-12), ''YYYY/MM'') '+
          ' AND    SUBSTR(D.ANOMESREF,6,2) <> ''13''                                   '+
          ' AND    D.IDRUBRICA = P.IDPROVENTO                                          ';
     if Trim(sRubricasAConsiderar) <> ''
     then  begin
        // substituir H por D
        while Pos('H', sRubricasAConsiderar) > 0 do sRubricasAConsiderar[Pos('H', sRubricasAConsiderar)] := 'D';
         sRubricasAConsiderar := StringReplace(sRubricasAConsiderar, 'D.MES', 'D.ANOMESREF', [rfReplaceAll, rfIgnoreCase]);


{
        sSQL := sSQL +' AND  (                                                     '+
                       '         (P.IDGRUPORUBRICA IN ('+sGrupoRubrica+') ) OR '+
                                 sRubricasAConsiderar+
                       '       ) ';
}
        sSQL := sSQL +' AND  (                                                     '+
                       '        ( (P.IDGRUPORUBRICA IN ('+sGrupoRubrica+
                                ') AND D.IDRUBRICA NOT IN ('+sRubricasANAOConsiderar+'))) OR '+
                                sRubricasAConsiderar+
                       '       ) ';

     end;
     sSQL := sSQL +' ORDER BY  D.ANOMESREF                                                      ';
  end
  else begin
     sSQL := ' SELECT TO_CHAR(TO_DATE(H.MES,''YYYY/MM''),''MON/YYYY'') AS MESANO,         '+
          '        P.IDGRUPORUBRICA, H.IDPATRO, H.IDRUBRICA, H.CODPROVDESC,               '+
          '        H.VALORPROVENTO,  H.MES                                                '+
          ' FROM   HISTRUBSAL H, PROVDESC P                                               '+
          ' WHERE  H.IDPESSOA  = '+ IntToStr(iIdPessoa)                                    +
          ' AND    H.IDPATRO = '+ IntToStr(iIdPessJur)                                     +
          ' AND    H.MES       < '+ QuotedStr(sAnoMesRef)                                  +
          ' AND    H.MES       >= TO_CHAR(ADD_MONTHS(TO_DATE('+ QuotedStr(sAnoMesRef)+', ''YYYY/MM''),-12), ''YYYY/MM'') '+
          ' AND    SUBSTR(H.MES,6,2) <> ''13'' '+
          ' AND    H.IDRUBRICA = P.IDPROVENTO  ';
     if Trim(sRubricasAConsiderar) <> ''
     then  begin
        sSQL := sSQL +' AND  (                                                     '+
                       '        ( (P.IDGRUPORUBRICA IN ('+sGrupoRubrica+
                                ') AND H.IDRUBRICA NOT IN ('+sRubricasANAOConsiderar+'))) OR '+
                                sRubricasAConsiderar+
                       '       ) ';

     end;

     sSQL := sSQL +' ORDER BY  H.MES ';
  end;

  QryRubricasA.SQL.Add(sSQL);
  QryRubricasA.Open;

  QryRubricasAAUX.Close;
  QryRubricasAAUX.SQL.Clear;
  if iIdPessJur = 50031
  then sSQL := ' SELECT TO_CHAR(TO_DATE(H.MES,''YYYY/MM''),''MON/YYYY'') AS MESANO,           '+
               '        P.IDGRUPORUBRICA, H.IDPATRO, H.IDRUBRICA, H.CODPROVDESC,              '+
               '        H.VALORPROVENTO,  H.MES                                               '+
               ' FROM   HISTRUBSAL H, PROVDESC P                                              '+
               ' WHERE  H.IDPESSOA  = '+ IntToStr(iIdPessoa)                                   +
               ' AND    H.IDPATRO   = '+ IntToStr(iIdPessJur)                                  +
               ' AND    H.IDRUBRICA IN (21140, 23318)                                         '+
               ' AND    H.MES       < '+ QuotedStr(sAnoMesRef)                                 +
               ' AND    H.MES       >= TO_CHAR(ADD_MONTHS(TO_DATE('+ QuotedStr(sAnoMesRef)+', ''YYYY/MM''),-12), ''YYYY/MM'') '+
               ' AND    SUBSTR(H.MES,6,2) <> ''13''                                           '+
               ' AND    H.IDRUBRICA = P.IDPROVENTO                                            '+
               ' ORDER BY  H.MES '
  else sSQL := ' SELECT TO_CHAR(TO_DATE(H.MES,''YYYY/MM''),''MON/YYYY'') AS MESANO,           '+
               '        P.IDGRUPORUBRICA, H.IDPATRO, H.IDRUBRICA, H.CODPROVDESC,              '+
               '        H.VALORPROVENTO,  H.MES                                               '+
               ' FROM   HISTRUBSAL H, PROVDESC P                                              '+
               ' WHERE  H.IDPESSOA  = '+ IntToStr(iIdPessoa)                                   +
               ' AND    H.IDPATRO   = '+ IntToStr(iIdPessJur)                                  +
               ' AND    H.IDRUBRICA IN (5051, 5787)                                           '+
               ' AND    H.MES       < '+ QuotedStr(sAnoMesRef)                                 +
               ' AND    H.MES       >= TO_CHAR(ADD_MONTHS(TO_DATE('+ QuotedStr(sAnoMesRef)+', ''YYYY/MM''),-12), ''YYYY/MM'') '+
               ' AND    SUBSTR(H.MES,6,2) <> ''13''                                           '+
               ' AND    H.IDRUBRICA = P.IDPROVENTO                                            '+
               ' ORDER BY  H.MES ';
  QryRubricasAAUX.SQL.Add(sSQL);
  QryRubricasAAUX.Open;

  iNumDiasFERIAS := 0;
  qryRubricasAAux.First;
  while not qryRubricasAAux.Eof do
  begin
     if qryRubricasAAux.FieldByName('IDRUBRICA').AsInteger = 23318
     then iNumDiasFERIAS := iNumDiasFERIAS + qryRubricasAAux.FieldByName('VALORPROVENTO').AsFloat
     else if qryRubricasAAux.FieldByName('IDRUBRICA').AsInteger = 5787
     then iNumDiasFERIAS := iNumDiasFERIAS + qryRubricasAAux.FieldByName('VALORPROVENTO').AsFloat;

     qryRubricasAAux.Next;
  end;

  sMesesFERIAS    := '';
  sMaiorMesFERIAS := '0000/00';
  qryRubricasAAux.First;
  while not qryRubricasAAux.Eof do
  begin
     if qryRubricasAAux.FieldByName('IDRUBRICA').AsInteger = 21140
     then begin
        sMesesFERIAS := sMesesFERIAS+','+qryRubricasAAux.FieldByName('MES').AsString;
        if qryRubricasAAux.FieldByName('MES').AsString > sMaiorMesFERIAS
        then sMaiorMesFERIAS := qryRubricasAAux.FieldByName('MES').AsString;
     end;

     if qryRubricasAAux.FieldByName('IDRUBRICA').AsInteger = 5051
     then begin
        sMesesFERIAS := sMesesFERIAS+','+qryRubricasAAux.FieldByName('MES').AsString;
        if qryRubricasAAux.FieldByName('MES').AsString > sMaiorMesFERIAS
        then sMaiorMesFERIAS := qryRubricasAAux.FieldByName('MES').AsString;
     end;

     qryRubricasAAux.Next;
  end;


  // Varre as rubricas da media preenchendo a qry virtual
  sMesAno := QryRubricasA.FieldByName('MESANO').AsString;
  while not QryRubricasA.Eof do
  begin
    dTotalRubrica := 0;
    // Transfere dados para qry virtual
    if not QrySRBAux.Locate('ANOMES',QryRubricasA.FieldByName('MES').AsString, [loCaseInsensitive])
    then begin
       qryRubricasA.Next;
       continue;
    end;

    QrySRBAux.Edit;
    QrySRBAux.FieldByName('DATA').AsString           := QryRubricasA.FieldByName('MESANO').AsString;
    QrySRBAux.FieldByName('ANOMES').AsString         := QryRubricasA.FieldByName('MES').AsString;

    sMesAno := QryRubricasA.FieldByName('MESANO').AsString;
    // Processa todas as rubricas do Mês
    while (QryRubricasA.FieldByName('MESANO').AsString = sMesAno) and
          (not QryRubricasA.EOF) do
    begin
       if iIdPessJur = 1
       then PreencheRubricasFCRT
       else if iIdPessJur = 50028
       then PreencheRubricasCELULAR
       else if iIdPessjur = 50031
       then PreencheRubricasBRT;

       dTotalRubrica := dTotalRubrica + QryRubricasA.FieldByName('VALORPROVENTO').AsFloat;
       QryRubricasA.Next;
    end;

    sMesAno := QryRubricasA.FieldByName('MESANO').AsString;
    QrySRBAux.Post;
  end;

  // Processar campos calculados
  qrySRBAux.First;
  dTotalParcelaA   := 0;
  iNumLinha        := 0;
  iNumSalarios     := 0;

  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT SUM(VLRCALCULO) PARCELAB           '+
             ' FROM   DETCALCULO                         '+
             ' WHERE  IDCALCULO = '+OraNumero(sIdCalculo) +
             ' AND TIPOCALCULO LIKE ''RB%''              '+
             ' AND FLGUTILIZADO = ''S''                  ');
     Open;

     if not IsEmpty
     then dParcelaB := FieldByName('PARCELAB').AsFloat
     else dParcelaB := 0;
  end;

  while not qrySRBAux.Eof do
  begin
     inc(iNumLinha);

     qrySRBAux.Edit;
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT PARCA.VLRTETO, PARCA.VLRCALCULO, PARCA.VLRRUBRICA, PARCA.VLRINDICE, PARCA.VLRCORRIGIDO, '+
                '        PARCB.VLRCORRIGIDO AS PARCELAB                                                          '+
                ' FROM   DETCALCULO PARCA, DETCALCULO PARCB                                                      '+
                ' WHERE  PARCA.IDCALCULO      = '+OraNumero(sIdCalculo)+
                ' AND    PARCA.ANOMESREF      = '''+qrySRBAux.FieldByName('ANOMES').AsString+''''+
                ' AND    ((PARCA.DESCRICAO      LIKE ''RUBRICA TIPO A%'') OR                    '+
                '         (PARCA.DESCRICAO      LIKE ''RUBRICA TIPO E%'') OR                    '+  
                '         (PARCA.DESCRICAO      LIKE ''RUBRICA TIPO C%'') )                     '+
                ' AND    PARCB.IDCALCULO(+)   = PARCA.IDCALCULO     '+
                ' AND    PARCB.TIPOCALCULO(+) = ''TPB''           ');
        Open;

        // Gleyber - 01/04/2003 - Início
        dTotalCompara :=  QrySRBAux.FieldByName('VALORCOMPAR').AsFloat +
                          QrySRBAux.FieldByName('SALARIO').AsFloat +
                          QrySRBAux.FieldByName('ANUENIO').AsFloat +
                          QrySRBAux.FieldByName('FERIAS').AsFloat +
                          QrySRBAux.FieldByName('GRATFERIAS').AsFloat +
                          QrySRBAux.FieldByName('HORAEXTRAINCORP').AsFloat +
                          QrySRBAux.FieldByName('PERICJUDICIAL').AsFloat +
                          QrySRBAux.FieldByName('PROMOCAORETRO').AsFloat +
                          QrySRBAux.FieldByName('DIFERENCASCOMPL').AsFloat +
                          QrySRBAux.FieldByName('GDVGOG').AsFloat +
                          QrySRBAux.FieldByName('FUNCAOGRATIF').AsFloat;
        // Gleyber - 01/04/2003 - Fim

        if (IsEmpty)  and (dTotalCompara = 0)  // Gleyber - 01/04/2003 - Início
        then begin
           qrySRBAux.FieldByName('LIMITANTE').AsFloat     := 0;
           qrySRBAux.FieldByName('INDICE').AsFloat        := 1;
           qrySRBAux.FieldByName('SUBCORRIGIDO').AsFloat  := 0;
           qrySRBAux.FieldByName('TOTALGERAL').AsFloat    := 0;
           QrySRBAux.FieldByName('PARCELAB').AsFloat      := dParcelaB;
           qrySRBAux.FieldByName('VALORCOMPAR').AsFloat   := 0;
           QrySRBAux.FieldByName('SUBTOTAL').AsFloat      := 0;
        end
        else begin
           if not bHistRubSal
           then begin
              qrySRBAux.FieldByName('LIMITANTE').AsFloat     := FieldByName('VLRTETO').AsFloat;
              qrySRBAux.FieldByName('INDICE').AsFloat        := FieldByName('VLRINDICE').AsFloat;
              qrySRBAux.FieldByName('VALORCOMPAR').AsFloat   := FieldByName('VLRCALCULO').AsFloat;
              if (QrySRBAux.FieldByName('VALORCOMPAR').AsFloat > FieldByName('VLRTETO').AsFloat) and
                 (FieldByName('VLRTETO').AsFloat > 0)
              then QrySRBAux.FieldByName('SUBTOTAL').AsFloat := FieldByName('VLRTETO').AsFloat
              else QrySRBAux.FieldByName('SUBTOTAL').AsFloat := qrySRBAux.FieldByName('VALORCOMPAR').AsFloat;
              qrySRBAux.FieldByName('SUBCORRIGIDO').AsFloat  := FieldByName('VLRCORRIGIDO').AsFloat;
              QrySRBAux.FieldByName('PARCELAB').AsFloat := dParcelaB;
           end
           else begin
              qrySRBAux.FieldByName('LIMITANTE').AsFloat     := FieldByName('VLRTETO').AsFloat;
              // Gleyber - 01/04/2003 - Início
              If FieldByName('VLRINDICE').AsFloat > 0
                Then qrySRBAux.FieldByName('INDICE').AsFloat  := FieldByName('VLRINDICE').AsFloat
                Else qrySRBAux.FieldByName('INDICE').AsFloat  := 1;
              // Gleyber - 01/04/2003 - Fim
              qrySRBAux.FieldByName('VALORCOMPAR').AsFloat   := QrySRBAux.FieldByName('VALORCOMPAR').AsFloat
                                                              + QrySRBAux.FieldByName('SALARIO').AsFloat
                                                              + QrySRBAux.FieldByName('ANUENIO').AsFloat
                                                              + QrySRBAux.FieldByName('FERIAS').AsFloat
                                                              + QrySRBAux.FieldByName('GRATFERIAS').AsFloat
                                                              + QrySRBAux.FieldByName('HORAEXTRAINCORP').AsFloat
                                                              + QrySRBAux.FieldByName('PERICJUDICIAL').AsFloat
                                                              + QrySRBAux.FieldByName('PROMOCAORETRO').AsFloat
                                                              + QrySRBAux.FieldByName('DIFERENCASCOMPL').AsFloat
                                                              + QrySRBAux.FieldByName('GDVGOG').AsFloat
                                                              + QrySRBAux.FieldByName('FUNCAOGRATIF').AsFloat;

              if (QrySRBAux.FieldByName('VALORCOMPAR').AsFloat > FieldByName('VLRTETO').AsFloat) and
                 (FieldByName('VLRTETO').AsFloat > 0)
              then QrySRBAux.FieldByName('SUBTOTAL').AsFloat := FieldByName('VLRTETO').AsFloat
              else QrySRBAux.FieldByName('SUBTOTAL').AsFloat := qrySRBAux.FieldByName('VALORCOMPAR').AsFloat;

              qrySRBAux.FieldByName('SUBCORRIGIDO').AsFloat  := qrySRBAux.FieldByName('SUBCORRIGIDO').AsFloat+
                                                                (QrySRBAux.FieldByName('SUBTOTAL').AsFloat *
                                                                 QrySRBAux.FieldByName('INDICE').AsFloat );

              QrySRBAux.FieldByName('PARCELAB').AsFloat := dParcelaB;
           end;
        end;

        dTotalParcelaA                                    := dTotalParcelaA + qrySRBAux.FieldByName('SUBCORRIGIDO').AsFloat;
        qrySRBAux.FieldByName('TOTALGERAL').AsFloat       := qrySRBAux.FieldByName('SUBCORRIGIDO').AsFloat;

        //if qrySRBAux.FieldByName('SUBCORRIGIDO').AsFloat > 0 then
        
        { Codigo Retornardo para calcular média em cima dos meses que possuem }
        { valor.                                                              }
        if qrySRBAux.FieldByName('SUBCORRIGIDO').AsFloat > 0
        then
        inc(iNumSalarios);
     end;
     qrySRBAux.Next;
  end;

  if (qrySRBAux.RecordCount > 0)
  then begin
     if iNumSalarios <= 0 then iNumSalarios := 12;
     dTotalParcelaA := dTotalParcelaA / iNumSalarios;
     dTotalParcelaB := dParcelaB;
  end
  else begin
     dTotalParcelaA := 0;
     dTotalParcelaB := 0;
  end;

  qrySRBAux.First;
end;
{----------------------------------------------------------------------------}
{ PROCESSAMENTO PARCELA "B"                                                  }
{----------------------------------------------------------------------------}
procedure TdtmRelSRB.MontaQueryParcelaB;
Var
  Formato, sMesAno, sAnoMesFinal, sAnoMesIndice, sAnoMesProc, sAnoMesIni, sSQL : String;
  dTotalRubrica : Double;
  iNumPassada, iAnoProc, iMesProc, iIdRubrica : Integer;
begin
  inherited;

  {----------------------------------------------------------------------------}
  { PROCESSAMENTO PARCELA "B"                                                  }
  {----------------------------------------------------------------------------}
  QrySRBAuxB.Close;
  QrySRBAuxB.Open;
  QrySRBAuxB.Delete;

  // Rubricas da Media
  qryRubricasB.Close;
  qryRubricasB.SQL.Clear;
  sSQL := ' SELECT TO_CHAR(TO_DATE(D.ANOMESREF,''YYYY/MM''),''MON/YYYY'') AS MESANO,         '+
          '        D.ANOMESREF, D.VLRINDICE AS INDICE,                                        '+
          '        SUM(D.VLRCALCULO) AS PROPORCAO,                                            '+
          '        SUM(D.VLRRUBRICA) AS VALOR                                                 '+
          ' FROM   DETCALCULO D, CALCULO C                                                    '+
          ' WHERE C.IDPESSOA       = '+ IntToStr(iIdPessoa)                                    +
          ' AND   C.IDCALCULO      = '+ OraNumero(sIdCalculo)                                  +
          ' AND   ( (C.IDBENEFICIO = '+IntToStr(iIdBeneficio)+') OR (C.IDBENEFICIO IS NULL) ) '+
          ' AND   D.IDCALCULO      = C.IDCALCULO                                              '+
          ' AND   D.TIPOCALCULO    LIKE ''RB%''                                               '+
          ' AND   D.FLGUTILIZADO   = ''S''                                                    '+
          ' GROUP BY D.ANOMESREF, D.VLRINDICE                                                 '+
          ' ORDER BY D.ANOMESREF                                                              ';
  qryRubricasB.SQL.Add(sSQL);
  qryRubricasB.Open;

  // Calcula data de Inicio do Processamento
  sSQL := 'SELECT TO_CHAR(ADD_MONTHS(TO_DATE('''+sAnoMesRef+''', ''YYYY/MM''),-60 ),''YYYY/MM'') AS ANOMESPROC '+
          'FROM DUAL ';

  FazQuery(QryAux, sSQL);
  sAnoMesIni  := QryAux.FieldByName('ANOMESPROC').AsString;
  sAnoMesFinal := SAnoMesAnterior(sAnoMesRef);
  sAnoMesProc := sAnoMesIni;
  iNumPassada := 0;
  // Preencher os 60 meses da qry virtual com zeros
  while sAnoMesProc <= sAnoMesFinal do
  begin
      inc(iNumPassada);
      QrySRBAuxB.Append;
      QrySRBAuxB.FieldByName('IDRUBRICA').AsString := '0';
      QrySRBAuxB.FieldByName('NOME').AsString      := '';
      QrySRBAuxB.FieldByName('ANOMESREF').AsString := sAnoMesProc;
      FazQuery(QryAux, 'SELECT TO_CHAR(TO_DATE('''+sAnoMesProc+''','' YYYY/MM''),''MON/YYYY'') AS MESANO FROM DUAL ');
      QrySRBAuxB.FieldByName('DATA').AsString      := qryAux.FieldByName('MESANO').AsString;
      QrySRBAuxB.FieldByName('ORDEM').AsInteger    := iNumPassada;
      QrySRBAuxB.FieldByName('VALOR').AsFloat      := 0;
      QrySRBAuxB.FieldByName('INDICE').AsFloat     := 0;
      QrySRBAuxB.FieldByName('PROPORCAO').AsFloat  := 0;
      QrySRBAuxB.Post;

      sAnoMesProc := ProximoAnoMes(StrToInt(Copy(sAnoMesProc,6,2)), StrToInt(Copy(sAnoMesProc,1,4)) );
  end;


  qryRubricasB.First;
  while not qryRubricasB.Eof do
  begin
     if qrySRBAuxB.Locate('ANOMESREF', qryRubricasB.FieldByName('ANOMESREF').AsString, [loCaseInsensitive])
     then begin
        qrySRBAuxB.Edit;
        qrySRBAuxB.FieldByName('VALOR').AsFloat      := qrySRBAuxB.FieldByName('VALOR').AsFloat      + qryRubricasB.FieldByName('VALOR').AsFloat;
        qrySRBAuxB.FieldByName('INDICE').AsFloat     := qryRubricasB.FieldByName('INDICE').AsFloat;
        qrySRBAuxB.FieldByName('PROPORCAO').AsFloat  := qrySRBAuxB.FieldByName('PROPORCAO').AsFloat  + qryRubricasB.FieldByName('PROPORCAO').AsFloat;
        qrySRBAuxB.Post;
     end;

     qryRubricasB.Next;
  end;

  qrySRBAuxB.First;
end;


Function TdtmRelSRB.AcertaHistorico(sAnoMesRef, sNomeIndiceReaj :String): String;
Var
  sAnoMesIndice, sSQL : String;
  iAnoProc, iMesProc : Integer;
Begin
  { Busca Teto }
  sAnoMesIndice := sAnoMesRef;
  sSQL := 'SELECT '+
          '  1 AS REGRA, C.COTVALOR, C.COTMESREF AS MES '+
          'FROM   '+
          '  MOEDA M, COTACAOMOEDA C  '+
          'WHERE  '+
          '  M.MOESIGLA  = '''+sNomeIndiceReaj+''' AND '+
          '  M.MOECODIGO = C.MOECODIGO         AND '+
          '  SUBSTR(C.COTMESREF,3,4)||''/''||SUBSTR(C.COTMESREF,1,2) = '+
          QuotedStr(Copy(sAnoMesIndice,1,4)+'/'+Copy(sAnoMesIndice,6,2));

  { Preenche Indice caso encontre algum }
  If FazQuery(QryAux, sSQL) Then Begin
    QrySRBAuxB.FieldByName('INDICE').AsFloat   := ( (QryAux.FieldByName('COTVALOR').AsFloat/100)+1 );
    QrySRBAuxB.FieldByName('FATOR').AsFloat    := 0;
  End Else Begin
    QrySRBAuxB.FieldByName('INDICE').AsFloat   := 1;
    QrySRBAuxB.FieldByName('FATOR').AsFloat    := 0;
  End;
  { Preenche o resto dos dados }
  QrySRBAuxB.FieldByName('DATA').AsString :=
    UpperCase(FormatDateTime('MMM/YYYY', StrToDate('01/'+ Copy(sAnoMesRef,6,2) +'/'+ Copy(sAnoMesRef,1,4)) ));

  QrySRBAuxB.FieldByName('IDRUBRICA').AsInteger :=
    QryRubricasB.FieldByName('IDRUBRICA').AsInteger;
  QrySRBAuxB.FieldByName('NOME').AsString       :=
    QryRubricasB.FieldByName('DESCRICAO').AsString;

  { Calcula proximo Ano/Mes de processamento }
  iAnoProc := StrToInt(Copy(sAnoMesRef,1,4));
  iMesProc := (StrToInt(Copy(sAnoMesRef,6,2))+1);
  { Caso Ano pulado recalcula }
  If iMesProc > 12 Then Begin
    iAnoProc := iAnoProc + 1;
    iMesProc := 1;
  End;
  { Acerta casas }
  If iMesProc < 10 Then Begin
    sAnoMesRef := IntToStr(iAnoProc)+'/0'+IntToStr(iMesProc);
  End Else Begin
    sAnoMesRef := IntToStr(iAnoProc)+'/'+IntToStr(iMesProc);
  End;
  {------------------------------------------}
  QrySRBAuxB.Post;

  QrySRBAuxB.Append;

  { Zera campos }
  QrySRBAuxB.FieldByName('VALORREAL').AsFloat      := 0;
  QrySRBAuxB.FieldByName('VALORLIMITADO1').AsFloat := 0;
  QrySRBAuxB.FieldByName('VALORLIMITADO2').AsFloat := 0;
  QrySRBAuxB.FieldByName('INDICE').AsFloat         := 0;
  QrySRBAuxB.FieldByName('FATOR').AsFloat          := 0;
  QrySRBAuxB.FieldByName('VALORCORRIGIDO1').AsFloat := 0;
  QrySRBAuxB.FieldByName('VALORCORRIGIDO2').AsFloat := 0;
  QrySRBAuxB.FieldByName('VALORPROPORCAO1').AsFloat := 0;
  QrySRBAuxB.FieldByName('VALORPROPORCAO2').AsFloat := 0;
  QrySRBAuxB.FieldByName('DATA').AsString :=
    QryRubricasB.FieldByName('MESANO').AsString;
  {-----------------------------------------------------}

  Result := sAnoMesRef;
End;

{----------------------------------------------------------------------------}
{ PROCESSAMENTO INSS                                                         }
{----------------------------------------------------------------------------}
procedure TdtmRelSRB.MontaQueryINSS;
Var
  sAnoMesFinal,
  sAnoMesIni,
  sAnoMesProc,
  sSQL          : string;

  iNumPassada   : integer;

begin
  inherited;

  {----------------------------------------------------------------------------}
  { PROCESSAMENTO INSS                                                         }
  {----------------------------------------------------------------------------}
  QryRelINSS.Close;
  QryRelINSS.Open;
  QryRelINSS.Delete;

  // Buscar fator previdenciario
  qryAux.Close;
  qryAux.SQL.Clear;
  sSQL := ' SELECT D.VALOR AS FATORPREVIDENCIARIO '+
          ' FROM   DETCALCULO D, CALCULO C        '+
          ' WHERE C.IDPESSOA       = '+ IntToStr(iIdPessoa)                            +
          ' AND   C.IDCALCULO      = '+ OraNumero(sIdCalculo)                          +
          ' AND   ( (C.IDBENEFICIO = '+IntToStr(iIdBeneficio)+') OR (C.IDBENEFICIO IS NULL) ) '+
          ' AND   D.IDCALCULO      = C.IDCALCULO                                      '+
          ' AND   D.TIPOCALCULO    IS NULL                                            '+
          ' AND   D.IDPESSOA       = C.IDPESSOA                                       '+
          ' AND   D.VALOR          IS NOT NULL                                        ';

  qryAux.SQL.Add(sSQL);
  qryAux.Open;
  if not qryAux.IsEmpty
  then dFatorPrevidenciario := StrToFloat(ClienteNumero(qryAux.FieldByName('FATORPREVIDENCIARIO').AsString))
  else dFatorPrevidenciario := 0;

  // Rubricas da Media
  qryRubricasINSS.Close;
  qryRubricasINSS.SQL.Clear;
  sSQL := ' SELECT TO_CHAR(TO_DATE(D.ANOMESREF,'' YYYY/MM''),''MON/YYYY'') AS MESANO, '+
          '        D.ANOMESREF,                                                       '+
          '        D.VLRTETO AS TETO,                                                 '+
          '        D.VLRINDICE AS INDICE,                                             '+
          '        SUM(D.VLRCALCULO) AS SALARIO,                                      '+
          '        SUM(D.VLRRUBRICA) AS SALARIOLIMITADO,                              '+
          '        SUM(D.VLRCORRIGIDO) AS SALARIOCORRIGIDO                            '+
          ' FROM   DETCALCULO D, CALCULO C                                            '+
          ' WHERE C.IDPESSOA       = '+ IntToStr(iIdPessoa)                            +
          ' AND   C.IDCALCULO      = '+ OraNumero(sIdCalculo)                          +
          ' AND   ( (C.IDBENEFICIO = '+IntToStr(iIdBeneficio)+') OR (C.IDBENEFICIO IS NULL) ) '+
          ' AND   D.IDCALCULO      = C.IDCALCULO                                      '+
          ' AND   D.TIPOCALCULO    = ''SUM''                                          '+
          ' GROUP BY D.ANOMESREF, D.VLRTETO, D.VLRINDICE                              '+
          ' ORDER BY D.ANOMESREF                                                      ';
  qryRubricasINSS.SQL.Add(sSQL);
  qryRubricasINSS.Open;

  // Calcula data de Inicio do Processamento
  sSQL := ' SELECT TO_CHAR(ADD_MONTHS(TO_DATE('''+sAnoMesRef+''', ''YYYY/MM''),-48 ),''YYYY/MM'') AS ANOMESPROC '+
          ' FROM DUAL ';

  FazQuery(QryAux, sSQL);
  sAnoMesIni  := QryAux.FieldByName('ANOMESPROC').AsString;
  sAnoMesFinal := SAnoMesAnterior(sAnoMesRef);
  sAnoMesProc := sAnoMesIni;
  iNumPassada := 0;
  // Preencher os 48 meses da qry virtual com zeros
  while sAnoMesProc <= sAnoMesFinal do
  begin
      inc(iNumPassada);
      QryRelINSS.Append;
      QryRelINSS.FieldByName('IDRUBRICA').AsString := '0';
      QryRelINSS.FieldByName('NOME').AsString      := '';
      QryRelINSS.FieldByName('ANOMESREF').AsString := sAnoMesProc;
      FazQuery(QryAux, 'SELECT TO_CHAR(TO_DATE('''+sAnoMesProc+''','' YYYY/MM''),''MON/YYYY'') AS MESANO FROM DUAL ');
      QryRelINSS.FieldByName('DATA').AsString            := qryAux.FieldByName('MESANO').AsString;
      QryRelINSS.FieldByName('SALARIO').AsFloat          := 0;
      QryRelINSS.FieldByName('SALARIOLIMITADO').AsFloat  := 0;
      QryRelINSS.FieldByName('SALARIOCORRIGIDO').AsFloat := 0;
      QryRelINSS.FieldByName('INDICE').AsFloat           := 0;
      QryRelINSS.FieldByName('TETO').AsFloat             := 0;
      QryRelINSS.FieldByName('FATORPREVIDENCIARIO').AsFloat:= 0;
      QryRelINSS.Post;

      sAnoMesProc := ProximoAnoMes(StrToInt(Copy(sAnoMesProc,6,2)), StrToInt(Copy(sAnoMesProc,1,4)) );
  end;

  dSomaINSS := 0;
  QryRelINSS.First;
  while not QryRelINSS.Eof do
  begin
     if qryRubricasINSS.Locate('ANOMESREF', QryRelINSS.FieldByName('ANOMESREF').AsString, [loCaseInsensitive])
     then begin
        QryRelINSS.Edit;
        QryRelINSS.FieldByName('INDICE').AsFloat     := qryRubricasINSS.FieldByName('INDICE').AsFloat;
        QryRelINSS.FieldByName('TETO').AsFloat       := qryRubricasINSS.FieldByName('TETO').AsFloat;
        QryRelINSS.FieldByName('SALARIO').AsFloat    := qryRelINSS.FieldByName('SALARIO').AsFloat
                                                      + qryRubricasINSS.FieldByName('SALARIO').AsFloat;
        QryRelINSS.FieldByName('SALARIOLIMITADO').AsFloat    := qryRelINSS.FieldByName('SALARIOLIMITADO').AsFloat
                                                      + qryRubricasINSS.FieldByName('SALARIOLIMITADO').AsFloat;
        QryRelINSS.FieldByName('SALARIOCORRIGIDO').AsFloat    := qryRelINSS.FieldByName('SALARIOCORRIGIDO').AsFloat
                                                      + qryRubricasINSS.FieldByName('SALARIOCORRIGIDO').AsFloat;
        QryRelINSS.FieldByName('FATORPREVIDENCIARIO').AsFloat:= dFatorPrevidenciario;
        dSomaINSS := dSomaINSS + qryRubricasINSS.FieldByName('SALARIOCORRIGIDO').AsFloat;
        QryRelINSS.Post;
     end;
     QryRelINSS.Next;
  end;

  // Contar numero de salarios
  iNumSalarios := 0;
  QryRelINSS.First;
  while not QryRelINSS.Eof do
  begin
     if QryRelINSS.FieldByName('SALARIO').AsFloat > 0
     then inc(iNumSalarios);

     if QryRelINSS.FieldByName('TETO').AsFloat > 0
     then dValorTetoUltimoMes := QryRelINSS.FieldByName('TETO').AsFloat;

     QryRelINSS.Next;
  end;

  QryRelINSS.First;
end;

procedure TdtmRelSRB.ppGroupFooterBand1BeforePrint(Sender: TObject);
var dResult : double;
begin
  inherited;
  if iNumSalarios > 0
  then begin
     dResult := (dSomaINSS / iNumSalarios) * dFatorPrevidenciario;
     if dResult > dValorTetoUltimoMes then dResult := dValorTetoUltimoMes;
     ppINSSMEDIA.Caption      := FormatFloat('###,##0.00', dSomaINSS / iNumSalarios);
     ppINSSRESULT.Caption     := FormatFloat('###,##0.00', dResult );
     ppINSSFATORPREV.Caption  := FormatFloat('###,##0.00000000', dFatorPrevidenciario );
  end
  else begin
     ppINSSMEDIA.Caption  := FormatFloat('###,##0.00', 0);
     ppINSSRESULT.Caption := FormatFloat('###,##0.00', 0);
  end;

end;

procedure TdtmRelSRB.TrataRubricasFerias;
var
   sAnoMesRubrica1,
   sAnoMesRubrica2,
   sMesesEncontrados,    sUtilizado,
   sMenorAnoMesRubrica1, sAnoMesRubrica   : string;  // CAMILLE - 27.11.2002
   iContRubrica1        : word;
   iSomaDias            : longint;

begin
   if iIdPessJur = 1 // FCRT
   then begin
      // -----------------------------------------------------------------
      // Especificacao do Cliente para a patrocinadora FCRT  :
      // Se dentro dos 12 meses, existir mais de uma rubrica 1194
      // - Gratificação de Férias, então considerar apenas a última,
      // desprezar as incidências anteriores no cálculo da média aritmética
      // e considerar a rubrica 1396 - Devolução Gratificação de Férias,
      // somente quando ela ocorrer após a última incidência da rubrica 1194.
      // -----------------------------------------------------------------
      // Buscar as ocorrencias da rubrica 1194 nos 12 ultimos meses
      FazQuery(qryAux,
              ' SELECT DISTINCT H.MES, H.IDRUBRICA  '+
              ' FROM   HISTRUBSAL H, PROVDESC P '+
              ' WHERE  H.IDPESSOA   = '+IntToStr(iIdPessoa)+
              ' AND    H.IDPATRO    = '+IntToStr(iIdPessJur)+
              ' AND    H.MES        < '''+sAnoMesInicio+''''+
              ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                       QuotedStr(sAnoMesInicio)+', ''YYYY/MM''),12), ''YYYY/MM'')  '+
              ' AND    SUBSTR(H.MES,6,2) <> ''13'' '+ // CAMILLE - 22.07.2002
              ' AND    ((P.IDPROVENTO = 1194) OR (P.IDPROVENTO = 1396))         '+
              ' AND    H.IDRUBRICA = P.IDPROVENTO '+
              ' ORDER BY H.MES' );
      if not qryAux.IsEmpty
      then begin // Pessoa teve uma ou mais gratificacao de ferias
         sAnoMesRubrica1      := '0000/00';
         sAnoMesRubrica2      := '0000/00';
         iContRubrica1        := 0;
         sRubricasAConsiderar := '';
         sRubricasANAOConsiderar := '';  // CAMILLE - 27.11.2002

         while not qryAux.Eof do
         begin
            if (qryAux.FieldByName('IDRUBRICA').AsString = '1194') and
               (qryAux.FieldByName('MES').AsString > sAnoMesRubrica1)
            then begin
               sAnoMesRubrica1 := qryAux.FieldByName('MES').AsString;
               inc(iContRubrica1);
            end;

            if (qryAux.FieldByName('IDRUBRICA').AsString = '1396') and
               (qryAux.FieldByName('MES').AsString > sAnoMesRubrica2)
            then sAnoMesRubrica2 := qryAux.FieldByName('MES').AsString;

            qryAux.Next;
         end;

         sRubricasAConsiderar := ' ( (H.IDRUBRICA = 1194) AND (H.MES = '''+sAnoMesRubrica1+''') ) ';
         if Trim(sRubricasANAOConsiderar) = ''     // CAMILLE - 27.11.2002
         then sRubricasANAOConsiderar := '1194'
         else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',1194';

         if sAnoMesRubrica2 > sAnoMesRubrica1
         then begin
            sRubricasAConsiderar := '( '+ sRubricasAConsiderar + ' OR '+
                                      '  ( (H.IDRUBRICA = 1396) AND (H.MES = '''+sAnoMesRubrica2+''') ) '+
                                      ') ';
         if Trim(sRubricasANAOConsiderar) = ''     // CAMILLE - 27.11.2002
         then sRubricasANAOConsiderar := '1396'
         else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',1396';
         end
      end;
   end
   else if iIdPessJur = 50028 // CELULAR
   then begin
      // -----------------------------------------------------------------
      // Especificacao do Cliente para a patrocinadora CELULAR :
      // Se dentro dos 12 últimos meses, existir mais de uma rubrica 5051
      // (1/3 CONST.FÉRIAS) então somar a quantidade de dias do código
      // 5787 (Qtde. dias férias mês)
      // Se a quantidade for <= que 30 dias,
      // Entao deixar no cálculo as duas rubricas 5051
      // Senão utilizar a última incidência da rubrica  e para este caso
      // também deverá ser utilizado as rubricas de devolução (=5227, 5226 e 5286)
      // e as de diferenças (= 5053 e 5052), pagas nesta última incidência ou posteriormente.
      // Se dentor dos 12 ultimos meses, existir apenas uma rubrica 5051
      // Entao pegar esta rubrica e suas diferencas
      // -----------------------------------------------------------------
      // Buscar as ocorrencias da rubrica 5051 nos 12 ultimos meses
      FazQuery(qryAux,
              ' SELECT DISTINCT H.MES, H.IDRUBRICA  '+
              ' FROM   HISTRUBSAL H, PROVDESC P '+
              ' WHERE  H.IDPESSOA   = '+IntToStr(iIdPessoa)+
              ' AND    H.IDPATRO    = '+IntToStr(iIdPessJur)+
              ' AND    H.MES        < '''+sAnoMesInicio+''''+
              ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                       QuotedStr(sAnoMesInicio)+', ''YYYY/MM''),12), ''YYYY/MM'')  '+
              ' AND    SUBSTR(H.MES,6,2) <> ''13'' '+ // CAMILLE - 22.07.2002
              ' AND    P.IDPROVENTO = 5051         '+
              ' AND    H.IDRUBRICA = P.IDPROVENTO  '+
              ' ORDER BY H.MES' );
      sAnoMesRubrica1      := '0000/00';
      sAnoMesRubrica2      := '0000/00';
      sMenorAnoMesRubrica1 := '2999/12';
      sMesesEncontrados    := '';
      iContRubrica1        := 0;
      sRubricasAConsiderar := '';
      sRubricasANAOConsiderar := '';   // CAMILLE - 27.11.2002

      if not qryAux.IsEmpty
      then begin // Pessoa teve uma ou mais rubrica de ferias
         sAnoMesRubrica1      := '0000/00';
         sAnoMesRubrica2      := '0000/00';
         sMesesEncontrados    := '';
         iContRubrica1        := 0;
         sRubricasAConsiderar := '';
         sRubricasANAOConsiderar := ''; // CAMILLE - 27.11.2002
         while not qryAux.Eof do
         begin
            if (qryAux.FieldByName('MES').AsString > sAnoMesRubrica1)
            then begin
               sAnoMesRubrica1 := qryAux.FieldByName('MES').AsString;
               inc(iContRubrica1);
               if Trim(sMesesEncontrados) = ''
               then sMesesEncontrados := ''''+sAnoMesRubrica1+''''
               else sMesesEncontrados := sMesesEncontrados + ','''+sAnoMesRubrica1+'''';

               if sAnoMesRubrica1 < sMenorAnoMesRubrica1
               then sMenorAnoMesRubrica1 := sAnoMesRubrica1;
            end;

            qryAux.Next;
         end;
      end;

      if iContRubrica1 > 1 // Existe mais de uma rubrica 5051
      then begin           // Entao, somar a qtde de dias da rubrica 5787
      FazQuery(qryAux,
                 ' SELECT DISTINCT H.MES, SUM(H.VALORPROVENTO) AS NUMDIAS '+
                 ' FROM   HISTRUBSAL H, PROVDESC P '+
                 ' WHERE  H.IDPESSOA   = '+IntToStr(iIdPessoa)+
                 ' AND    H.IDPATRO    = '+IntToStr(iIdPessJur)+
                 ' AND    H.MES        < '''+sAnoMesInicio+''''+
                 ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                          QuotedStr(sAnoMesInicio)+', ''YYYY/MM''),12), ''YYYY/MM'')  '+
                 ' AND    SUBSTR(H.MES,6,2) <> ''13'' '+ // CAMILLE - 22.07.2002
                 ' AND    P.IDPROVENTO = 5787         '+
                 ' AND    H.IDRUBRICA  = P.IDPROVENTO '+
                 ' GROUP BY H.MES                     '+
                 ' ORDER BY H.MES                     ');
         qryAux.First;
         iSomaDias := 0;
         while not qryAux.Eof do
         begin
            if (qryAux.FieldByName('MES').AsString > sAnoMesRubrica2)
            then begin
               sAnoMesRubrica2 := qryAux.FieldByName('MES').AsString;
               iSomaDias       := iSomaDias + qryAux.FieldByName('NUMDIAS').AsInteger;
            end;
            qryAux.Next;
         end;

         // Se NumDias <= 30 Entao incluir no calculo as duas rubricas 5051
         // Senao, utilizar a ultima incidencia e as rubricas 5227,5226,5286,5053,5052
         if iSomaDias <= 30
         then begin
            sRubricasAConsiderar := ' ( (  (H.IDRUBRICA = 5051) AND (H.MES  IN ('+sMesesEncontrados+') )  ) OR  '+
                                    '   (  ((H.IDRUBRICA IN ( 5227,5226,5286,5053,5052)) AND (H.MES  >= '''+sMenorAnoMesRubrica1+''') )'+
                                    '    )  '+
                                    '  ) ';
            if Trim(sRubricasANAOConsiderar) = ''     // CAMILLE - 27.11.2002
            then sRubricasANAOConsiderar := '5051,5227,5226,5286,5053,5052'
            else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',5051,5227,5226,5286,5053,5052';

         end
         else begin
            sRubricasAConsiderar := ' ( ( ( (H.IDRUBRICA = 5051) AND (H.MES  = '''+sAnoMesRubrica1+''') ) ) OR '+
                                    '   ( ( (H.IDRUBRICA IN ( 5227,5226,5286,5053,5052)) AND (H.MES  >= '''+sAnoMesRubrica1+''') ) )  '+
                                    ' ) ';
            if Trim(sRubricasANAOConsiderar) = ''     // CAMILLE - 27.11.2002
            then sRubricasANAOConsiderar := '5051,5227,5226,5286,5053,5052'
            else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',5051,5227,5226,5286,5053,5052';
         end;
      end
      else begin
         if iContRubrica1 > 0 // só tem 1 rubrica 5051 no periodo de 12 meses
         then begin
            sRubricasAConsiderar := ' ( ( ( (H.IDRUBRICA = 5051) AND (H.MES  = '''+sAnoMesRubrica1+''') ) ) OR '+
                                    '   ( ( (H.IDRUBRICA IN ( 5227,5226,5286,5053,5052)) AND (H.MES  >= '''+sAnoMesRubrica1+''') ) )  '+
                                    ' ) ';
            if Trim(sRubricasANAOConsiderar) = ''     // CAMILLE - 27.11.2002
            then sRubricasANAOConsiderar := '5051,5227,5226,5286,5053,5052'
            else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',5051,5227,5226,5286,5053,5052';
         end;
      end;
   end
   else begin // BRTPREV
      // CAMILLE-13.02.2003
      // -----------------------------------------------------------------
      // Especificacao do Cliente para a patrocinadora BRT - BRASILTELECOM
      // Se dentro dos 12 últimos meses de salários-de-participação, existir
      // mais de uma rubrica 21140-Gratif. de Férias, então somar a quantidade
      // de dias do código 23318-Res Quant Dias Férias Mês e se a quantidade
      // de dias for < ou = a 31 dias, deixar no cálculo as duas rubricas 21140
      // e seus códigos de devoluções ou diferenças em suas incidências ou
      // posteriores a elas.
      // Se for > que 31 dias, deixar apenas a última incidência( mais atual)
      // da rubrica e seus códigos de devolução e/ou diferenças dessa incidência
      // ou posteriores a ela.
      // Se dentro dos 12 últimos meses de salários-de-participação,
      // existir apenas uma rubrica 21140-Gratif. de Férias, deixar no cálculo
      // a rubrica 21140 e seus códigos de devoluções ou diferenças
      // em sua incidência ou posterior a ela.
      // Se dentro dos 12 últimos meses de salários-de-participação,
      // não existir a rubrica 21140-Gratif. de Férias, verificar se existe a
      // rubrica  20045 nesse período.
      // Se houver, utilizar os valores da incidência do código mais atual
      // Buscar as ocorrencias da rubrica 21140 nos 12 ultimos meses
      FazQuery(qryAux,
              ' SELECT DISTINCT H.MES, H.IDRUBRICA  '+
              ' FROM   HISTRUBSAL H, PROVDESC P '+
              ' WHERE  H.IDPESSOA   = '+IntToStr(iIdPessoa)+
              ' AND    H.IDPATRO    = '+IntToStr(iIdPessJur)+
              ' AND    H.MES        < '''+sAnoMesInicio+''''+
              ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                       QuotedStr(sAnoMesInicio)+', ''YYYY/MM''), -12), ''YYYY/MM'')  '+
              ' AND    SUBSTR(H.MES,6,2) <> ''13''  '+
              ' AND    P.IDPROVENTO = 21140         '+
              ' AND    H.IDRUBRICA  = P.IDPROVENTO  '+
              ' ORDER BY H.MES' );
      sAnoMesRubrica1      := '0000/00';
      sAnoMesRubrica2      := '0000/00';
      sMenorAnoMesRubrica1 := '2999/12';
      sMesesEncontrados    := '';
      iContRubrica1        := 0;
      sRubricasAConsiderar := '';
      sRubricasANAOConsiderar := '';

      if not qryAux.IsEmpty
      then begin // Pessoa teve uma ou mais rubrica de ferias
         sAnoMesRubrica1      := '0000/00';
         sAnoMesRubrica2      := '0000/00';
         sMesesEncontrados    := '';
         iContRubrica1        := 0;
         sRubricasAConsiderar := '';
         sRubricasANAOConsiderar := '';
         while not qryAux.Eof do
         begin
            if (qryAux.FieldbyName('MES').AsString > sAnoMesRubrica1)
            then begin
               sAnoMesRubrica1 := qryAux.FieldbyName('MES').AsString;
               inc(iContRubrica1);
               if Trim(sMesesEncontrados) = ''
               then sMesesEncontrados := ''''+sAnoMesRubrica1+''''
               else sMesesEncontrados := sMesesEncontrados + ','''+sAnoMesRubrica1+'''';

               if sAnoMesRubrica1 < sMenorAnoMesRubrica1
               then sMenorAnoMesRubrica1 := sAnoMesRubrica1;
            end;

            qryAux.Next;
         end;
      end;

      if iContRubrica1 > 1 // Existe mais de uma rubrica 21140
      then begin           // Entao, somar a qtde de dias da rubrica 23318
      FazQuery(qryAux,
                 ' SELECT DISTINCT H.MES, SUM(H.VALORPROVENTO) AS NUMDIAS '+
                 ' FROM   HISTRUBSAL H, PROVDESC P '+
                 ' WHERE  H.IDPESSOA   = '+IntToStr(iIdPessoa)+
                 ' AND    H.IDPATRO    = '+IntToStr(iIdPessJur)+
                 ' AND    H.MES        < '''+sAnoMesInicio+''''+
                 ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                          QuotedStr(sAnoMesInicio)+', ''YYYY/MM''),-12), ''YYYY/MM'')  '+
                 ' AND    SUBSTR(H.MES,6,2) <> ''13'' '+
                 ' AND    P.IDPROVENTO = 23318        '+
                 ' AND    H.IDRUBRICA  = P.IDPROVENTO '+
                 ' GROUP BY H.MES                     '+
                 ' ORDER BY H.MES                     ');
         qryAux.First;
         iSomaDias := 0;
         while not qryAux.Eof do
         begin
            if (qryAux.FieldbyName('MES').AsString > sAnoMesRubrica2)
            then begin
               sAnoMesRubrica2 := qryAux.FieldbyName('MES').AsString;
               iSomaDias       := iSomaDias + qryAux.FieldByName('NUMDIAS').AsInteger;
            end;
            qryAux.Next;
         end;

         // Se NumDias <= 31 Entao incluir no calculo as duas rubricas 21140
         // Senao, utilizar a ultima incidencia e as rubricas :
         // [21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,
         //  21384,9091,9283,9285,21147]
         if iSomaDias <= 31
         then begin
            sRubricasAConsiderar := ' ( (  (H.IDRUBRICA = 21140) AND (H.MES  IN ('+sMesesEncontrados+') )  ) OR  '+
                                    '   (  ((H.IDRUBRICA IN (21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147)) AND (H.MES  >= '''+sMenorAnoMesRubrica1+''') )'+
                                    '    )  '+
                                    '  ) ';

            if Trim(sRubricasANAOConsiderar) = ''
            then sRubricasANAOConsiderar := '21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147'
            else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147';

         end
         else begin
            sRubricasAConsiderar := ' ( ( ( (H.IDRUBRICA = 21140) AND (H.MES  = '''+sAnoMesRubrica1+''') ) ) OR '+
                                    '   ( ( (H.IDRUBRICA IN ( 21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147)) AND (H.MES  >= '''+sAnoMesRubrica1+''') ) )  '+
                                    ' ) ';

            if Trim(sRubricasANAOConsiderar) = ''
            then sRubricasANAOConsiderar := '21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147'
            else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147';

         end;
      end
      else begin
         if iContRubrica1 > 0 // só tem 1 rubrica 21140 no periodo de 12 meses
         then begin
            sRubricasAConsiderar := ' ( ( ( (H.IDRUBRICA = 21140) AND (H.MES  = '''+sAnoMesRubrica1+''') ) ) OR '+
                                    '   ( ( (H.IDRUBRICA IN (21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147)) AND (H.MES  >= '''+sAnoMesRubrica1+''') ) )  '+
                                    ' ) ';
            if Trim(sRubricasANAOConsiderar) = ''
            then sRubricasANAOConsiderar := '21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147'
            else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',21140,21142,21240,21154,21141,21153,21158,21239,21152,21242,21385,21384,9091,9283,9285,21147';

         end
         else begin // nao existe a rubrica 21140. Buscar ultima incidencia da 20045
            FazQuery(qryAux,
                    ' SELECT DISTINCT H.MES, H.IDRUBRICA  '+
                    ' FROM   HISTRUBSAL H, PROVDESC P '+
                    ' WHERE  H.IDPESSOA   = '+IntToStr(iIdPessoa)+
                    ' AND    H.IDPATRO    = '+IntToStr(iIdPessJur)+
                    ' AND    H.MES        < '''+sAnoMesInicio+''''+
                    ' AND    H.MES        >= TO_CHAR(ADD_MONTHS(TO_DATE('+
                                             QuotedStr(sAnoMesInicio)+', ''YYYY/MM''),12), ''YYYY/MM'')  '+
                    ' AND    SUBSTR(H.MES,6,2) <> ''13''  '+
                    ' AND    P.IDPROVENTO = 20045         '+
                    ' AND    H.IDRUBRICA  = P.IDPROVENTO  '+
                    ' ORDER BY H.MES' );
            sAnoMesRubrica1      := '0000/00';
            sAnoMesRubrica2      := '0000/00';
            sMenorAnoMesRubrica1 := '2999/12';
            sMesesEncontrados    := '';
            iContRubrica1        := 0;
            sRubricasAConsiderar := '';
            sRubricasANAOConsiderar := '';

            if not qryAux.IsEmpty
            then begin // Pessoa teve uma ou mais rubrica de ferias
               sAnoMesRubrica1      := '0000/00';
               sAnoMesRubrica2      := '0000/00';
               sMesesEncontrados    := '';
               iContRubrica1        := 0;
               sRubricasAConsiderar := '';
               while not qryAux.Eof do
               begin
                  if (qryAux.FieldbyName('MES').AsString > sAnoMesRubrica1)
                  then begin
                     sAnoMesRubrica1 := qryAux.FieldbyName('MES').AsString;
                     inc(iContRubrica1);
                     if Trim(sMesesEncontrados) = ''
                     then sMesesEncontrados := ''''+sAnoMesRubrica1+''''
                     else sMesesEncontrados := sMesesEncontrados + ','''+sAnoMesRubrica1+'''';

                     if sAnoMesRubrica1 < sMenorAnoMesRubrica1
                     then sMenorAnoMesRubrica1 := sAnoMesRubrica1;
                  end;

                  qryAux.Next;
               end;
            end;

            if iContRubrica1 >= 1 // Existe uma ou mais rubrica 20045
            then begin            // Utilizar ultima incidencia da rubrica 20045
               sRubricasAConsiderar := ' ( (H.IDRUBRICA = 20045 ) AND (H.MES  = '''+sAnoMesRubrica1+''') )  ';

               if Trim(sRubricasANAOConsiderar) = ''
               then sRubricasANAOConsiderar := '20045'
               else sRubricasANAOConsiderar := sRubricasANAOConsiderar +',20045';
            end
         end;
      end;
   end;

end;

end.


