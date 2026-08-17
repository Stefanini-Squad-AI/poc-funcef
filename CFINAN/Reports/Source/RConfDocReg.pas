unit RConfDocReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmSqlParams, DBClient,
  uCMClientDataSet, TXRB, uSistema;

type
  TRptConfDocReg = class(TFrmCmReport)
    rpConfDocReg: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel52: TppLabel;
    pplblEmpresa: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine34: TppLine;
    pplblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup7: TppGroup;
    grpbIDRelaciona: TppGroupHeaderBand;
    ppLabel66: TppLabel;
    dbtGrupo: TppDBText;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup8: TppGroup;
    grpbFlgNI: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppDBText30: TppDBText;
    ppConfDocReg: TppBDEPipeline;
    dsConfDocReg: TwwDataSource;
    cdsConfDocReg: TCMClientDataSet;
    spConfDocReg: TCMSqlParams;
    ppDBText1: TppDBText;
    CMSqlParams1: TCMSqlParams;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    SqlDadosEmpresa: TCMSqlParams;
    ppLDadosEmpresa: TppDBPipeline;
    dsDadosEmpresa: TwwDataSource;
    CdsDadosEmpresa: TCMClientDataSet;
    dbLogo: TppDBImage;
    ppShape1: TppShape;
    lblAdicionais: TppLabel;
    ppLine1: TppLine;
    ppDBText2: TppDBText;
    ppDBText5: TppDBText;
    ppDBText3: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppShape2: TppShape;

    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);


  private { Private declarations }


  public  { Public declarations }


  end;



var
  RptConfDocReg: TRptConfDocReg;



implementation
{$R *.DFM}



procedure TRptConfDocReg.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODPORTADOR, '+
                                                    '   DESCRICAO '+
                                                    'FROM PORTADORCONTA '+
                                                    'WHERE (IDPESSOA = '+
                                                     FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY DESCRICAO ';
end;



procedure TRptConfDocReg.CrmRptCMBeforePrint(Sender: TObject);
var
  sfiltro : String;
begin
   inherited;

   //  Abre a qry do logo da empresa Marcus Oliveira
   SqlDadosEmpresa.Prepare;
   SqlDadosEmpresa.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   SqlDadosEmpresa.Open;

   if Assigned(lblAdicionais) then

   begin

     if ( CmpRptCM.ParamValues[0].AsString <> '' ) then

        sfiltro := 'Data Inicial: ' + CmpRptCM.ParamValues[0].AsString + '     ' ;

     if ( CmpRptCM.ParamValues[1].AsString <> '' ) then

        sfiltro := sfiltro + 'Data Final: '   + CmpRptCM.ParamValues[1].AsString + '    ' ;

     if ( CmpRptCM.ParamValues[2].AsString <> '' ) then

        sfiltro := sfiltro + 'Conta: ' + CmpRptCM.ParamValues[2].DispalyText + '    ' ;

      lblAdicionais.Caption :=  sfiltro;

   end;


   with spConfDocReg do
   begin
      SQL.Clear;
      SQL.Add('SELECT ');
      SQL.Add('   DECODE (REL.FLGNI, ''I'', ''Lancto. não identificado'', ''Lancto. conciliado '') AS DESCDOC,   ');
      SQL.Add('   DECODE (REL.FLGNI, ''I'', ''Total do Lançamento não identificado '', ''Total do lançamento conciliado '') AS DESCLANCTO, ');
      SQL.Add('   M.DATACONCILIACAO, ');

      SQL.Add('   REL.CODLANCFINANC, ');
      SQL.Add('   P.DESCRICAO, ');
      SQL.Add('   M.HISTORICO, ');
      SQL.Add('   M.VALORLANCFINAN, ');
      SQL.Add('   M.DATALANCFINAN, ');
      SQL.Add('   REL.IDRELACIONANI, ');
      SQL.Add('   REL.FLGMARCADO, ');
      SQL.Add('   RF.VALOR, ');
      SQL.Add('   REL.FLGNI, ');
      SQL.Add('   PC.NOME AS PLANO ');
      SQL.Add('FROM ');
      SQL.Add('   (SELECT ');
      SQL.Add('       R.CODLANCFINANC, ');
      SQL.Add('       R.IDRELACIONANI, ');
      SQL.Add('       R.FLGMARCADO, ');
      SQL.Add('       R.FLGNI ');
      SQL.Add('    FROM ');
      SQL.Add('       RelacionaNI R ');
      SQL.Add('    WHERE ');
      SQL.Add('       Exists(SELECT ');
      SQL.Add('                 M1.CODLANCFINANC ');
      SQL.Add('              FROM ');
      SQL.Add('                 RelacionaNI R1, ');
      SQL.Add('                 MovimFinanc M1 ');
      SQL.Add('              WHERE ');
      SQL.Add('                 (R1.CODLANCFINANC=M1.CODLANCFINANC) AND ');
      SQL.Add('                 (R1.IDRELACIONANI=R.IDRELACIONANI) AND ');
      SQL.Add('                 (M1.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND ');
      SQL.Add('                 (R1.FLGNI=''I'') ');

      if not(CmpRptCM.ParamValues[2].IsNull) then
         SQL.Add('                 AND (M1.CODPORTADOR = '+
                                    FloatToStr(CmpRptCM.ParamValues[2].AsFloat)+') ');

      if (not(CmpRptCM.ParamValues[0].IsNull) and not(CmpRptCM.ParamValues[1].IsNull)) then
       begin
          SQL.Add('                 AND (M1.DATALANCFINAN >= TO_DATE('''+
                                    FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime)+
                                    ''',''dd/mm/yyyy'')) ');
          SQL.Add('                 AND (M1.DATALANCFINAN <= TO_DATE( '''+
                                    FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[1].AsDateTime)+
                                    ''',''dd/mm/yyyy'')))) REL, ');
       end
      else
       SQL.Add('                 )) REL, ');

      SQL.Add('   MovimFinanc M, ');
      SQL.Add('   PortadorConta P, ');
      SQL.Add('   RateioFinanc RF, ');
      SQL.Add('   PlanPrevContabil PC ');
      SQL.Add('WHERE ');
      SQL.Add('   (REL.CODLANCFINANC=M.CODLANCFINANC) AND ');
      SQL.Add('   (M.CODPORTADOR=P.CODPORTADOR) AND ');
      SQL.Add('   (M.CODLANCFINANC=RF.CODLANCFINANC) AND ');
      SQL.Add('   (RF.IDPLANOPREV=PC.IDPLANOPREV(+)) AND ');
      SQL.Add('   (M.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') ');
      SQL.Add('ORDER BY ');
      SQL.Add('   DATACONCILIACAO, REL.IDRELACIONANI,REL.FLGNI, P.DESCRICAO ');
      Open;

   end;
end;



end.
