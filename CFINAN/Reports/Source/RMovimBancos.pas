unit RMovimBancos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmSqlParams, DBClient,
  uCMClientDataSet;

type
  TRptMovimBancos = class(TFrmCmReport)
    rpMovimBancos: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel52: TppLabel;
    ppLine33: TppLine;
    pplblEmpresa: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText28: TppDBText;
    lblTipoDoc: TppLabel;
    ppDBText31: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine34: TppLine;
    pplblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup7: TppGroup;
    grpbIDRelaciona: TppGroupHeaderBand;
    ppLine35: TppLine;
    ppLabel66: TppLabel;
    dbtGrupo: TppDBText;
    ppLine38: TppLine;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup8: TppGroup;
    grpbFlgNI: TppGroupHeaderBand;
    ppLine37: TppLine;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppLine39: TppLine;
    ppDBText30: TppDBText;
    ppLine40: TppLine;
    ppLabel71: TppLabel;
    ppMovimBancos: TppBDEPipeline;
    dsMovimBancos: TwwDataSource;
    cdsMovimBancos: TCMClientDataSet;
    spMovimBancos: TCMSqlParams;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure grpbIDRelacionaAfterPrint(Sender: TObject);
    procedure grpbFlgNIAfterPrint(Sender: TObject);
    procedure ppDetailBand12AfterPrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptMovimBancos: TRptMovimBancos;

implementation

{$R *.DFM}

procedure TRptMovimBancos.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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

procedure TRptMovimBancos.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   with spConfDocReg do
   begin
      SQL.Clear;
      SQL.Add('SELECT ');
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
      SQL.Add('                 (R1.FLGMARCADO = '''+CmpRptCM.ParamValues[3].AsString+''') AND ');
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
      SQL.Add('   REL.IDRELACIONANI,REL.FLGNI,P.DESCRICAO ');
      Open;
   end;
end;

procedure TRptMovimBancos.grpbIDRelacionaAfterPrint(Sender: TObject);
begin
   inherited;
   grpbFlgNI.Visible:=False;
end;

procedure TRptMovimBancos.grpbFlgNIAfterPrint(Sender: TObject);
begin
   inherited;
   grpbFlgNI.Visible:=True;

   if cdsConfDocReg.FieldByName('FLGNI').AsString='I' then
      lblTipoDoc.Caption:='Regularizados'
   else
      lblTipoDoc.Caption:='Relacionados';

   lblTipoDoc.Visible:=True;
end;

procedure TRptMovimBancos.ppDetailBand12AfterPrint(Sender: TObject);
begin
   inherited;
   lblTipoDoc.Visible:=False;
end;

end.
