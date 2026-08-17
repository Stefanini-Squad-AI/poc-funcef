unit rGpsGerados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, uCmSqlParams, DBClient, uCMClientDataSet,
  TXRB;

type
  TfrmRptGpsGerados = class(TFrmCmReport)
    cdsGps: TCMClientDataSet;
    cmSqlGps: TCMSqlParams;
    dsGpsGerado: TwwDataSource;
    pplGpsGerado: TppBDEPipeline;
    rpGpsGerado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    rpDarfEmiteLabel1: TppLabel;
    rpDarfEmiteLabel4: TppLabel;
    ppDetailBand5: TppDetailBand;
    rpDarfEmiteDBText11: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppLabel11: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    rpDarfEmiteGroup1: TppGroup;
    rpDarfEmiteGroupHeaderBand1: TppGroupHeaderBand;
    rpDarfEmiteDBText1: TppDBText;
    rpDarfEmiteLabel6: TppLabel;
    rpDarfEmiteLabel7: TppLabel;
    rpDarfEmiteDBText2: TppDBText;
    rpDarfEmiteLabel8: TppLabel;
    rpDarfEmiteDBText4: TppDBText;
    rpDarfEmiteLabel11: TppLabel;
    rpDarfEmiteLabel12: TppLabel;
    rpDarfEmiteLabel14: TppLabel;
    rpDarfEmiteDBText7: TppDBText;
    rpDarfEmiteDBText8: TppDBText;
    rpDarfEmiteDBText10: TppDBText;
    rpDarfEmiteLine1: TppLine;
    rpDarfEmiteLine2: TppLine;
    rpDarfEmiteGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    function PegaValorMulta(CodDocumento, CodAlteradorMulta, CodAlteradorJuros : LongInt) : Real;
  public            
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TfrmRptGpsGerados.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
    //preenche os dados no relatório
  ppLabel1.caption := CmpRptCM.ParamValues[0].AsString + ' - ' + CmpRptCM.ParamValues[1].AsString;

  with cmSqlGps do
     Begin
       SQL.Clear;
       sql.Append('SELECT PJ.IDPESSOA AS IDEMPRESA, PJ.RAZAOSOCIAL AS EMPRESA, ''                '' AS TOTAL, ');
       sql.Append('       PJ.NUMDOCUMENTO AS CGC, D.CODGERADORINSS, D.DATAPROGRAMADA, ');
       sql.Append('       L.VALOR, L.DATALANCTO, D.CODDOCUMENTO, D.DATAVENCTO,');
       sql.Append('       D.NODOCUMENTO, ''                '' AS VALORJUROS, PJF.RAZAOSOCIAL AS EMPRESAFORNECEDOR,');
       sql.Append('       PJF.NUMDOCUMENTO AS CGCFORNECEDOR, D.DATAPROGRAMADA, D.DATAEMISSAO,');
       sql.Append('       DD.CODDOCUMENTO AS DOCGERADOR, DD.NODOCUMENTO AS NUMERODOCUMETO');
       sql.Append('  FROM DOCUMENTO D, DOCUMENTO DD, LANCTODOCUM L, PESSOA PJ,');
       sql.Append('       (SELECT DISTINCT CODDOCINSS FROM LANCTODOCUM WHERE CODDOCINSS IS NOT NULL) I,');
       sql.Append('               PESSOA PJF');
       sql.Append('         WHERE (PJ.IDPESSOA = :IDPESSOA)');
       sql.Append('           AND (D.IDPESSOA = :IDPESSOA)');
       sql.Append('           AND (D.CODGERADORINSS = DD.CODDOCUMENTO)');
       sql.Append('           AND (DD.RECPAG = ''P'') ');
       sql.Append('           AND (DD.IDFORCLI = PJF.IDPESSOA)');

       if CmpRptCM.ParamValues[2].AsInteger = 0 then
         Begin
           SQL.Append('  AND (D.DATAPROGRAMADA >= TO_DATE(:DATAINI,''DD/MM/YYYY''))');
           SQL.Append('  AND (D.DATAPROGRAMADA <= TO_DATE(:DATAFIM,''DD/MM/YYYY''))');
         end
       else
         Begin
           SQL.Append('  AND (L.DATALANCTO >= TO_DATE(:DATAINI,''DD/MM/YYYY''))');
           SQL.Append('  AND (L.DATALANCTO <= TO_DATE(:DATAFIM,''DD/MM/YYYY''))');
         end;

       sql.Append('           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
       sql.Append('           AND (D.OPERACAO = L.OPERACAO)');
       sql.Append('           AND (I.CODDOCINSS  = D.CODDOCUMENTO)');

       if CmpRptCM.ParamValues[2].AsInteger = 0 then
          sql.Append('           ORDER BY D.DATAPROGRAMADA')
       else
          sql.Append('           ORDER BY L.DATALANCTO');


       Prepare;
       ParamByName('IDPESSOA').AsFloat   := CrmRptCM.idEmpresa;
       ParamByName('DATAINI').AsString   := CmpRptCM.ParamValues[0].AsString;
       ParamByName('DATAFIM').AsString   := CmpRptCM.ParamValues[1].AsString;
       Open;
     end;

     cdsGps.first;
     while not cdsGps.eof do
       Begin
         cdsGps.edit;
         cdsGps.fieldByname('VALORJUROS').Asstring := FormatFloat('#,##0.00', PegaValorMulta(cdsGps.fieldByname('CODDOCUMENTO').Asinteger, CmpRptCM.ParamValues[3].Asinteger, CmpRptCM.ParamValues[4].Asinteger));
         cdsGps.fieldByname('TOTAL').Asstring := FormatFloat('#,##0.00', (cdsGps.fieldByname('VALORJUROS').AsFloat + cdsGps.fieldByname('VALOR').AsFloat));
         cdsGps.post;
         cdsGps.next;
       end;
     cdsGps.first;
end;

function TfrmRptGpsGerados.PegaValorMulta(CodDocumento, CodAlteradorMulta,
                                          CodAlteradorJuros: Integer): Real;
Var
  SsqlPegaValor : TCMSqlParams;
  Cds : TclientDataSet;
begin
  try
    SsqlPegaValor := TCMSqlParams.Create(self);
    Cds := TclientDataSet.Create(self);
    with SsqlPegaValor do
      Begin
        ClientDataSet := Cds;
        sql.Clear;
        Sql.Append('SELECT SUM(DECODE(DEBCRE, ''C'', VALOR, VALOR * 1)) AS VALOR');
        sql.Append('  FROM LANCTODOCUM ');
        sql.Append(' WHERE CODDOCUMENTO = :CODDOCUMENTO');
        sql.Append('   AND OPERACAO = ''4''');
        sql.Append('   AND CODALTERADOR IN (:MULTA, :JUROS)');
        Prepare;
        ParamByName('CODDOCUMENTO').Asinteger := CodDocumento;
        ParamByName('MULTA').Asinteger        := CodAlteradorMulta;
        ParamByName('JUROS').Asinteger        := CodAlteradorJuros;
        open;
        Result := cds.fieldByname('VALOR').AsFloat;
      end;
  finally
     SsqlPegaValor.free;
     Cds.free;
  end;
end;

end.
