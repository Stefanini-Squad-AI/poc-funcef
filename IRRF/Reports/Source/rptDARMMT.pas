unit rptDARMMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppCtrls, ppPrnabl,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db,
  Wwdatsrc, DBTables, Wwquery, uCtrlRptGPS, uSistema, DBaseDados;

type
  TrptDARM = class(TFrmCmReport)
    dsDARM: TwwDataSource;
    ppDARM: TppBDEPipeline;
    rpDARM: TppReport;
    rpGPSDtlBnd: TppDetailBand;
    rpGPSShape6: TppShape;
    rpGPSLine1: TppLine;
    rpGPSLabel3: TppLabel;
    rpGPSLabel1: TppLabel;
    rpGPSLabel2: TppLabel;
    rpGPSLabel4: TppLabel;
    rpGPSLabel12: TppLabel;
    rpGPSLabel13: TppLabel;
    rpGPSLabel15: TppLabel;
    rpGPSLabel18: TppLabel;
    rpGPSLabel19: TppLabel;
    rpGPSLabel20: TppLabel;
    rpGPSDBText1: TppDBText;
    rpGPSImage1: TppImage;
    rpGPSLblMes1: TppLabel;
    rpGPSDBText6: TppDBText;
    rpGPSLblTerceiros1: TppLabel;
    rpGPSLblCodPag1: TppLabel;
    rpGPSLabel16: TppLabel;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText56: TppDBText;
    rpGPSSmryBnd: TppSummaryBand;
    rpGPSGrp: TppGroup;
    rpGPSGrpHdrBnd: TppGroupHeaderBand;
    rpGPSGrpFootBnd: TppGroupFooterBand;
    cdsDARM: TCMClientDataSet;
    cmSqlDARM: TCMSqlParams;
    sqlProcura: TCMSqlParams;
    cdsProcura: TCMClientDataSet;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLabel4: TppLabel;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine1: TppLine;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppLabel7: TppLabel;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppLine2: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText2: TppDBText;
    ppImage1: TppImage;
    ppLabel18: TppLabel;
    ppDBText3: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppLabel24: TppLabel;
    ppDBText7: TppDBText;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppLabel25: TppLabel;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLine3: TppLine;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppLabel28: TppLabel;
    ppShape34: TppShape;
    ppShape35: TppShape;
    ppLabel29: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    function PegaValorMulta(CodDocumento, CodAlteradorMulta: LongInt) : Real;
    function PegaValorJuros(CodDocumento, CodAlteradorJuros : LongInt) : Real;
    procedure rpDARMPrintingComplete(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function VerificaDocISS(CodDocISS : LongInt) : Boolean;
  private
    { Private declarations }
    CtrlRptGPS : TCtrlRptGPS;
  public
    { Public declarations }
  end;

var
  rptDARM: TrptDARM;

implementation

{$R *.DFM}

procedure TrptDARM.CrmRptCMBeforePrint(Sender: TObject);
begin
  //preenche os dados no relatório

  rpGPSLblCodPag1.caption := CmpRptCM.ParamValues[4].AsString;
  rpGPSLblMes1.caption    := CmpRptCM.ParamValues[3].AsString;
  ppLabel20.caption       := CmpRptCM.ParamValues[4].AsString;
  ppLabel18.caption       := CmpRptCM.ParamValues[3].AsString;

  with cmSqlDARM do
     Begin
       SQL.Clear;
       sql.Append('SELECT PJ.IDPESSOA AS IDEMPRESA, PJ.RAZAOSOCIAL AS EMPRESA, ES.CODESTADO, D.DATAVENCTO, ');
       sql.Append('       PJ.NUMDOCUMENTO AS CGC, RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||''''|| DECODE(E.COMPLEMENTO,'' '','' - '' ||''''||');
       sql.Append('       RTRIM(E.COMPLEMENTO)) AS RUA, E.IDCIDADES, RTRIM(E.BAIRRO) AS BAIRRO, RTRIM(C.NOME) AS CIDADE, D.CODGERADORINSS,');
       sql.Append('       RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP, L.VALOR, L.DATALANCTO, D.CODDOCUMENTO, D.NODOCUMENTO, 0 AS VALORJUROS, 0 AS VALORMULTA, 0 AS VALORTOTAL,');
       sql.Append('       PJF.RAZAOSOCIAL AS EMPRESAFORNECEDOR, ESF.CODESTADO CODESTADOFORNECEDOR, PJF.NUMDOCUMENTO AS CGCFORNECEDOR, D.DATAPROGRAMADA, L.DATALANCTO, ');
       sql.Append('       RTRIM(EF.LOGRADOURO) ||'', ''|| EF.NUMERO ||''''|| DECODE(EF.COMPLEMENTO,'' '','' - '' ||''''||');
       sql.Append('       RTRIM(EF.COMPLEMENTO)) AS RUAFORNECEDOR, EF.IDCIDADES IDCIDADESFORNECEDOR, RTRIM(EF.BAIRRO) AS BAIRROFORNECEDOR, DD.CODDOCUMENTO AS DOCGERADOR, DD.NODOCUMENTO AS NUMERODOCUMETO,');
       sql.Append('       RTRIM(CF.NOME) AS CIDADEFORNECEDOR, RTRIM(SUBSTR(EF.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(EF.CEP,6,3)) AS CEPFORNECEDOR');
       sql.Append('  FROM DOCUMENTO D, DOCUMENTO DD, LANCTODOCUM L, PESSOA PJ, ENDPESS E, CIDADES C, ESTADO ES, ');
       sql.Append('       (SELECT DISTINCT CODDOCINSS FROM LANCTODOCUM WHERE CODDOCINSS IS NOT NULL) I,');
       sql.Append('       PESSOA PJF, ENDPESS EF, CIDADES CF, ESTADO ESF');
       sql.Append(' WHERE (PJ.IDPESSOA = E.IDPESSOA)');
       sql.Append('   AND (PJ.IDENDCOMERCIAL= E.IDENDERECO)');
       sql.Append('   AND (E.IDCIDADES = C.IDCIDADES(+))');
       sql.Append('   AND (C.IDESTADO = ES.IDESTADO(+))');
       sql.Append('   AND (PJ.IDPESSOA = :IDPESSOA)');
       sql.Append('   AND (D.IDPESSOA = :IDPESSOA)');
       sql.Append('   AND (D.CODGERADORINSS = DD.CODDOCUMENTO)');
       sql.Append('   AND (DD.RECPAG = ''P'')');
       sql.Append('   AND (DD.IDFORCLI = PJF.IDPESSOA)');
       sql.Append('   AND (PJF.IDPESSOA = EF.IDPESSOA(+))');
       sql.Append('   AND (PJF.IDENDCOMERCIAL= EF.IDENDERECO(+))');
       sql.Append('   AND (EF.IDCIDADES = CF.IDCIDADES(+))');
       sql.Append('   AND (CF.IDESTADO = ESF.IDESTADO(+))');
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
       sql.Append('   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
       sql.Append('   AND (D.OPERACAO = L.OPERACAO)');
       sql.Append('   AND (I.CODDOCINSS  = D.CODDOCUMENTO)');

       if CmpRptCM.ParamValues[7].Asinteger = 0 then
          sql.Append('   AND NOT EXISTS (SELECT IM.CODDOCISS FROM DOCISS IM WHERE (IM.CODDOCISS = D.CODDOCUMENTO) AND (IM.FLGIMPRESSO = ''S''))')
       else
          sql.Append('   AND EXISTS (SELECT IM.CODDOCISS FROM DOCISS IM WHERE (IM.CODDOCISS = D.CODDOCUMENTO) AND (IM.FLGIMPRESSO = ''S''))');


       if CmpRptCM.ParamValues[2].Asinteger = 0 then
       begin
          SQL.Append('ORDER BY D.DATAPROGRAMADA');
       end
       else
       begin
          SQL.Append('ORDER BY L.DATALANCTO');
       end;
       
       Prepare;
       ParamByName('IDPESSOA').AsFloat   := CrmRptCM.idEmpresa;
       ParamByName('DATAINI').AsString   := CmpRptCM.ParamValues[0].AsString;
       ParamByName('DATAFIM').AsString   := CmpRptCM.ParamValues[1].AsString;
       Open;
     end;

     cdsDARM.first;
     while not cdsDARM.eof do
     Begin
        cdsDARM.edit;
        cdsDARM.fieldByname('VALORJUROS').Asstring := FormatFloat('#,##0.00', PegaValorJuros(cdsDARM.fieldByname('CODDOCUMENTO').Asinteger, CmpRptCM.ParamValues[5].Asinteger));
        cdsDARM.fieldByname('VALORMULTA').Asstring := FormatFloat('#,##0.00', PegaValorMulta(cdsDARM.fieldByname('CODDOCUMENTO').Asinteger, CmpRptCM.ParamValues[6].Asinteger));
        cdsDARM.fieldByname('VALORTOTAL').AsFloat := cdsDARM.fieldByname('VALOR').AsFloat + cdsDARM.fieldByname('VALORJUROS').AsFloat - cdsDARM.fieldByname('VALORMULTA').AsFloat;
        cdsDARM.post;
        cdsDARM.next;
     end;
     cdsDARM.first;
end;


function TrptDARM.PegaValorMulta(CodDocumento, CodAlteradorMulta:  Integer): Real;
Var
  SsqlPegaValor : TCMSqlParams;
  Cds : TclientDataSet;
begin
   try
      SsqlPegaValor := TCMSqlParams.Create(self);
      Cds := TclientDataSet.Create(self);
      with SsqlPegaValor do
      begin
         ClientDataSet := Cds;
         sql.Clear;
         Sql.Append('SELECT SUM(DECODE(DEBCRE, ''C'', VALOR, VALOR * 1)) AS VALOR');
         sql.Append('  FROM LANCTODOCUM ');
         sql.Append(' WHERE CODDOCUMENTO = :CODDOCUMENTO');
         sql.Append('   AND OPERACAO = ''4''');
         sql.Append('   AND CODALTERADOR = :MULTA');
         Prepare;
         ParamByName('CODDOCUMENTO').Asinteger := CodDocumento;
         ParamByName('MULTA').Asinteger        := CodAlteradorMulta;
         open;
         Result := cds.fieldByname('VALOR').AsFloat;
      end;
   finally
      SsqlPegaValor.free;
      Cds.free;
   end;
end;

function TrptDARM.PegaValorJuros(CodDocumento, CodAlteradorJuros: Integer): Real;
Var
  SsqlPegaValor : TCMSqlParams;
  Cds : TclientDataSet;
begin
   try
      SsqlPegaValor := TCMSqlParams.Create(self);
      Cds := TclientDataSet.Create(self);
      with SsqlPegaValor do
      begin
         ClientDataSet := Cds;
         sql.Clear;
         Sql.Append('SELECT SUM(DECODE(DEBCRE, ''C'', VALOR, VALOR * 1)) AS VALOR');
         sql.Append('  FROM LANCTODOCUM ');
         sql.Append(' WHERE CODDOCUMENTO = :CODDOCUMENTO');
         sql.Append('   AND OPERACAO = ''4''');
         sql.Append('   AND CODALTERADOR = :JUROS');
         Prepare;
         ParamByName('CODDOCUMENTO').Asinteger := CodDocumento;
         ParamByName('JUROS').Asinteger        := CodAlteradorJuros;
         open;
         Result := cds.fieldByname('VALOR').AsFloat;
      end;
   finally
      SsqlPegaValor.free;
      Cds.free;
   end;
end;


procedure TrptDARM.rpDARMPrintingComplete(Sender: TObject);
begin
   inherited;
   cdsDARM.First;
   while not cdsDARM.EOF do
   begin
      //Atualiza darf como impresso.
      Try //se o documento existe em docinss eu atualizo se não eu eu inclu-o
         if VerificaDocISS(cdsDARM.FieldByName('CODDOCUMENTO').AsInteger) then
         begin
            CtrlRptGPS.ExecutarSQL('UPDATE DOCISS SET CODIGOPGTO = '+quotedStr(rpGPSLblCodPag1.caption)+',' +
                                   '       COMPETENCIA = '+quotedStr(rpGPSLblMes1.caption)+', '+
                                   '       FLGIMPRESSO = ''S''');
         end
         else
         Begin
              CtrlRptGPS.ExecutarSQL('INSERT INTO DOCISS(CODDOCISS, CODIGOPGTO, COMPETENCIA, FLGIMPRESSO) VALUES( '+
                                      cdsDARM.FieldByName('CODDOCUMENTO').AsString+','+
                                      quotedStr(rpGPSLblCodPag1.caption)+','+
                                      quotedStr(rpGPSLblMes1.caption)+', ''S'')');
            end;
      Except
      end;
      cdsDARM.Next;
   end;
end;




procedure TrptDARM.FormCreate(Sender: TObject);
begin
  CtrlRptGPS := TCtrlRptGPS.Create;
  CtrlRptGPS.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
end;



function TrptDARM.VerificaDocISS(CodDocISS: Integer): Boolean;
begin
   with SqlProcura do
   begin
      sql.Clear;
      sql.Append('SELECT COUNT(*) AS TOTAL');
      sql.Append('  FROM DOCISS');
      sql.Append(' WHERE CODDOCISS = :PCODDOCISS');
      Prepare;
      ParamByName('PCODDOCISS').AsInteger := CodDocISS;
      open;
      Result := cdsProcura.FieldByName('TOTAL').AsInteger > 0;
   end;
end;


end.



