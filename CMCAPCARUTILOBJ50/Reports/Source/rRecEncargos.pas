{-------------------------------------------------------------------------------
  Data      : 13/09/2007
  Autor     : Antonio Marcos
  Pendência : 24539 - Ajuste
  Descrição :
----------------------------------------------------------------------------------
  Data      : 01/11/2005
  Autor     : Rodolpho da Silva
  Pendência : 20581
  Descrição : Corrigido o erro em que ao selecionar mais de 1 (um) tipo de
              encargo, os demais selecionados eram ignorados.
-------------------------------------------------------------------------------
//Alterado por: andre tavares - pendência 17102 - 29/07/2004 - fiz um decode na query para
//              andre tavares - pendência 17785 - 29/09/2004 - coloquei os left joins
//                                        verificar se o imposto retido foi estornado.
//              andre tavares  - pendência 18508 - 22/02/2004 fiz um decodede para zerar o valorbase do imposto estornado
-------------------------------------------------------------------------------}

unit rRecEncargos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra, TXRB,
  uctrlTipoAgre, uctrlPadroes;

type
  TRptRecEncargos = class(TFrmCmReport)
    PpRecEnc: TppBDEPipeline;
    DsRecEnc: TwwDataSource;
    RptRecEnc: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine8: TppLine;
    ppLabel9: TppLabel;
    RptRecEncLabel1: TppLabel;
    RptRecEncLabel2: TppLabel;
    RptRecEncLabel3: TppLabel;
    LblEncargo: TppLabel;
    LblPeriodo: TppLabel;
    LblData: TppLabel;
    RptRecEncLabel4: TppLabel;
    RptRecEncLabel5: TppLabel;
    RptRecEncLabel6: TppLabel;
    RptRecEncLabel7: TppLabel;
    RptRecEncLabel8: TppLabel;
    RptRecEncLabel9: TppLabel;
    RptRecEncLabel10: TppLabel;
    RptRecEncLabel11: TppLabel;
    ppLabel49: TppLabel;
    ppDetailBand2: TppDetailBand;
    RptRecEncDBText1: TppDBText;
    RptRecEncDBText2: TppDBText;
    RptRecEncDBText3: TppDBText;
    RptRecEncDBText4: TppDBText;
    RptRecEncDBText5: TppDBText;
    RptRecEncDBText6: TppDBText;
    RptRecEncDBText8: TppDBText;
    RptRecEncDBText7: TppDBText;
    ppDBText20: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine9: TppLine;
    ppLabel14: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    RptRecEncSummaryBand1: TppSummaryBand;
    RptRecEncLabel12: TppLabel;
    RptRecEncDBCalc1: TppDBCalc;
    RptRecEncLine1: TppLine;
    RptRecEncLine2: TppLine;
    SqlRecEnc: TCMSqlParams;
    CdsRecEnc: TCMClientDataSet;
    ppDBText1: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel3: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ctrlTipoAgre: TctrlTipoAgre;
    nomeEncargo : string;
  public
    { Public declarations }
  end;

var
  RptRecEncargos: TRptRecEncargos;

implementation

uses uSistema;

{$R *.DFM}

procedure TRptRecEncargos.CrmRptCMBeforePrint(Sender: TObject);
var
    sSQL               : String;
    sDataIni, sDataFim : String;
begin
   inherited;

   sDataIni := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)) + ',''dd/mm/yyyy'')';
   sDataFim := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)) + ',''dd/mm/yyyy'')';

   sSQL :=
   'SELECT ' +
   '   IR.CODTIPOCUSTAGREG, ' +
   '   T.DESCCUSTAGREG, ' +
   '   IR.DATARETENCAO, '     +
   ' NVL(DECODE(L.ESTORNO, NULL, DECODE(IR.FLGESTORNADO, ''S'', 0, ROUND(IR.VLRBASE, 2)), ROUND(IR.VLRBASE, 2),0), 0) AS VLRBASE, '+
   '   NVL(DECODE(L.ESTORNO, NULL, DECODE(IR.FLGESTORNADO, ''S'', 0, ROUND(IR.VLRRETIDO, 2)), ROUND(IR.VLRRETIDO, 2), 0), 0) AS VLRRETIDO, '+
   '   D.DATAPROGRAMADA, '+
   '   D.NODOCUMENTO, '+
   '   D.COMPLDOCUMENTO, '+
   '   D.IDFORCLI, '+
   '   P.RAZAOSOCIAL, '+
   '   P.NUMDOCUMENTO '+
   'FROM '+
   '   IMPOSTORETIDO IR, DOCUMENTO D, PESSOA P, TIPOAGRE T, '+
   '   LANCTODOCUM L '+
   'WHERE ';

   //  Início - Rodolpho da Silva - P: 20204 - 19/09/2005
   if  Trim(CmpRptCM.ParamValues[2].AsString) <> '' then
     sSQL := sSQL +  '   (IR.CODTIPOCUSTAGREG IN ' + CmpRptCM.ParamValues[2].AsString + ') AND ';

   sSQL := sSQL +
   //  Fim - Rodolpho da Silva - P: 20204 - 19/09/2005

   '   (IR.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) AND '+
   '   (D.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ') AND '+
   '   (IR.DATARETENCAO BETWEEN ' + sDataIni + ' AND ' + sDataFim + ') AND '+
   '   (IR.CODDOCUMENTO = D.CODDOCUMENTO) AND '+
   '    D.CODTIPDOC IN (SELECT CODTIPDOC FROM TIPODOCRECPAG A WHERE A.RECPAG = ''P'' AND NOT EXISTS '+
   '           (SELECT 1 FROM USUARIOXTPDOCTO B WHERE B.RECPAG=''P'' '+
   '            AND B.IDUSUARIO= '+ IntToStr(Sistema.IdUsuario) + ') '+
   '            UNION  SELECT CODTIPDOC  FROM TIPODOCRECPAG A '+
   '            WHERE A.RECPAG =   ''P''  AND EXISTS '+
   '            (SELECT 1 FROM USUARIOXTPDOCTO B WHERE B.RECPAG=''P'' AND A.CODTIPDOC=B.CODTIPDOC '+
   '            AND B.IDUSUARIO= '+ IntToStr(Sistema.IdUsuario)+ ')) AND '+
   '   (D.IDFORCLI = P.IDPESSOA) '+
   ' AND L.CODDOCUMENTO(+) = IR.CODDOCUMENTO AND L.NUMLANCTO(+) = IR.NUMLANCTO '+
   'ORDER BY '+
   '  IR.CODTIPOCUSTAGREG, ' +
   '  IR.DATARETENCAO, '+
   '  P.RAZAOSOCIAL, D.IDFORCLI';

   SqlRecEnc.Sql.Clear;
   SqlRecEnc.Sql.Text := sSQL;

   SqlRecEnc.Open;
   LblEncargo.Caption := nomeEncargo;
   LblPeriodo.Caption := 'De ' + CmpRptCM.ParamValues[0].AsString + ' a ' + CmpRptCM.ParamValues[1].AsString;
   LblData.Caption := CmpRptCM.ParamValues[3].AsString;

   //amf 27.08.2007 - 24539
   ctrlTipoAgre := TCtrlTipoagre.Create;
   ctrlTipoAgre.InitializeAs(Padroes);
end;

procedure TRptRecEncargos.ppDetailBand2BeforePrint(Sender: TObject);
var
  cds:TClientDataSet;
begin
  inherited;
  try
    //amf 27.08.2007
    cds := TClientDataSet.Create(nil);
    cds.data := ctrlTipoAgre.ListFAIXATIPOAGREG(cdsRecEnc.FieldByName('CODTIPOCUSTAGREG').AsFloat);

   if ( not cds.fieldByName('VLRINICIALFAIXA').isNull ) then
    begin
       RptRecEncDBText7.Visible :=
         (cdsRecEnc.FieldByName('VLRBASE').AsFloat >= cds.FieldByName('VLRINICIALFAIXA').AsFloat);
    end;

  finally
    freeAndNil(cds);
  end;
end;

procedure TRptRecEncargos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  freeAndNil(ctrlTipoAgre);
end;

end.

