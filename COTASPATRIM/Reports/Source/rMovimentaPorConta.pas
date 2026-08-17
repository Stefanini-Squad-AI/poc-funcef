unit rMovimentaPorConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, Db, Wwdatsrc,
  DBClient, uCMClientDataSet, uCmSqlParams,dBaseDados, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppPrnabl, ppCtrls,
  ppBands, ppCache, ppVar;

type
  TrptMovimentaPorConta = class(TFrmCmReport)
    SqlMovConta: TCMSqlParams;
    cdsMovConta: TCMClientDataSet;
    DsMovConta: TwwDataSource;
    ppBDEMovConta: TppBDEPipeline;
    rptMovConta: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    LblPosiForn: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppCalc4: TppSystemVariable;
    ppLabel12: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppSystemVariable1: TppSystemVariable;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel123: TppLabel;
    ppLine3: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptMovimentaPorConta: TrptMovimentaPorConta;

implementation

{$R *.DFM}

procedure TrptMovimentaPorConta.CrmRptCMBeforePrint(Sender: TObject);
var
   ativo, conta, tipomovimentacao: integer;
   dataini, datafim : string;

begin
  inherited;

  ativo:= CmpRptCM.ParamValues[0].AsInteger;
  conta:= CmpRptCM.ParamValues[1].AsInteger;
  tipomovimentacao:= CmpRptCM.ParamValues[2].AsInteger;
  dataini:= CmpRptCM.ParamValues[3].AsString;
  datafim:= CmpRptCM.ParamValues[4].AsString;

  LblPosiForn.Caption:=  'Período do movimento: '+ dataini +' a '+ datafim;

  with SqlMovConta, SqlMovConta.sql do
  begin
     Clear;

     add(' select ca.NOME AS ATIVO  ,      ');
     add('   cp.NOME AS CONTA       ,      ');
     add('   er.DTREF               ,      ');
     add('   tm.NOME as NOMEMOVIM   ,      ');
     add('   rt.NOME as NOMEROTEIRO ,      ');
     add('   rm.VALOR as QTDECOTAS  ,      ');
     add('   vc.VALOR as VALORCOTA  ,      ');
     add('   ( rm.VALOR * vc.VALOR ) as VALORMOV ');
     add(' from CPROTAPRMOV  rm , ');
     add('      CPROTAPURADO ra , ');
     add('      CPEXECROT    er , ');
     add('      CPVALORCOTA  vc , ');
     add('      CPROTEIRO    rt , ');
     add('      CPTIPOMOVIM  tm,  ');
     add('      CPCONTA      cp,  ');
     add('      CPATIVO      ca   ');

     add(' where  rm.IDCPROTAPURADO = ra.IDCPROTAPURADO ');
     add('        and  ra.IDCPEXECROT    = er.IDCPEXECROT ');
     add('        and  er.IDCPVALORCOTA  = vc.IDCPVALORCOTA ');
     add('        and  vc.FLGVALIDO      = ''S'' ');
     add('        and  ra.IDCPROTEIRO    = rt.IDCPROTEIRO ');
     add('        and  rm.IDCPTIPOMOVIM = tm.IDCPTIPOMOVIM ');
     add('        and  er.DTREF         >= to_date( :DATAINI, ''dd/mm/yyyy'' )');
     add('        and  er.DTREF         <= to_date( :DATAFIM, ''dd/mm/yyyy'' )');
     add('        and  rt.IDCPATIVO = :ATIVO');
     add('        and  ca.IDCPATIVO   = rt.IDCPATIVO ');
     add('        AND  rm.idcpconta = cp.idcpconta   ');

     if conta>-1 then
     begin
          add('  and  rm.IDCPCONTA  = '+ inttostr(conta));
     end;

     if tipomovimentacao>-1 then
     begin
        add(' and  rm.IDCPTIPOMOVIM  = '+ inttostr(tipomovimentacao ));
     end;

     add(' ORDER BY 2 ');
     Prepare;
     ParamByName('DATAINI').AsString:= dataini;
     parambyname('DATAFIM').AsString:= datafim;
     parambyname('ATIVO').AsInteger:= ativo;



     Open;
  end;
  
end;

end.
