unit RAlteraContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppCtrls, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, Wwdatsrc, ppMemo, ppStrtch, ppSubRpt, DBTables, Wwquery,
  Provider, StdCtrls, TXRB;

type
  TRptAlteraContrato = class(TFrmCmReport)
    dsContratos: TwwDataSource;
    pplContratos: TppBDEPipeline;
    rpAlteraContrato: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLine8: TppLine;
    lblEmpresa: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand5: TppFooterBand;
    lblSistema: TppLabel;
    ppLine12: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel12: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppDBText3: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText4: TppDBText;
    ppLabel15: TppLabel;
    ppDBText5: TppDBText;
    ppLabel16: TppLabel;
    ppDBText6: TppDBText;
    ppLabel17: TppLabel;
    ppDBText7: TppDBText;
    ppLabel18: TppLabel;
    ppDBText8: TppDBText;
    ppLabel19: TppLabel;
    ppDBText9: TppDBText;
    ppLabel20: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel37: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel30: TppLabel;
    ppLine13: TppLine;
    ppDetailBand5: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppSummaryBand3: TppSummaryBand;
    ppLine14: TppLine;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppDBText22: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine15: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel21: TppLabel;
    ppDBText12: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel27: TppLabel;
    ppDBText18: TppDBText;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    dsAditamentos: TwwDataSource;
    pplAditamentos: TppBDEPipeline;
    dsLog: TwwDataSource;
    pplLog: TppBDEPipeline;
    qryLog: TwwQuery;
    qryAditamentos: TwwQuery;
    qryContratos: TwwQuery;
    Label1: TLabel;
    spContratos: TCMSqlParams;
    cdsContratos: TCMClientDataSet;
    spAditamentos: TCMSqlParams;
    cdsAditamentos: TCMClientDataSet;
    spLog: TCMSqlParams;
    cdsLog: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    procedure AbreContrato;
    procedure AbreAditamento;
    procedure AbreLog;
    procedure AbreQueries;
  public
    { Public declarations }
  end;

var
  RptAlteraContrato: TRptAlteraContrato;

implementation

{$R *.DFM}

uses uSistema;

procedure TRptAlteraContrato.AbreContrato;
begin
  with spContratos.SQL do begin
    Clear;
    Add('SELECT ');
    Add('   C.IDCONTRATO, ');
    Add('   C.NOMECONTRATO, ');
    Add('   C.IDFORCLI, ');
    Add('   P.NOME AS NOMEFORCLI, ');
    Add('   C.IDRESPONSAVEL, ');
    Add('   RS.NOME AS NOMERESP, ');
    Add('   C.DATAASSINATURA, ');
    Add('   C.DATABASECONTRATO, ');
    Add('   C.DATAPREVENCERRA, ');
    Add('   C.DATAEFETENCERRA, ');
    Add('   OI.IDITEM, ');
    Add('   I.NOME_ITEM, ');
    Add('   OI.IDOBJETO, ');
    Add('   O.NOMEOBJETO, ');
    Add('   OI.DATABASEITEM, ');
    Add('   OI.MOECODIGO, ');
    Add('   M.MOEDESC, ');
    Add('   OI.QTDEITEM, ');
    Add('   OI.VALORUNITARIOOBJETO, ');
    Add('   OI.VALORTOTALOBJETO, ');
    Add('   OI.DATAINICIOCOBR, ');
    Add('   OI.OBSERVACAO, ');
    Add('   C.VALORBASECONTRATO, ');
    Add('   DECODE (C.TIPOCONTRATO,''P'',''A Pagar'',''R'',''A Receber'') TIPOC, ');
    Add('   DECODE (OI.FREQUENCIA,''M'',''mensal'',''U'','+
            '''unica'',''D'',''diaria'',''A'',''anual'') AS FREQ, ');
    Add('   DECODE (i.tipocobranca, ''PQ'',''Sim'',''PV'',''Sim'',''EQ'',''Sim'','+
                                   '''EV'',''Sim'',''AQ'',''Sim'',''AV'',''Sim'',''Nao'') AS TPCOB, ');
    Add('   R.PERCRATEIOCONTR, ');
    Add('   CC.NOME AS NOMECC, ');
    Add('   ADT.DATAASSADITAMENTO AS DATAADITAMENTO ');
    Add('FROM ');
    Add('   CONTRATOORIG C, ');
    Add('   OBJXITORIG OI, ');
    Add('   OBJETOCONTRATUAL O, ');
    Add('   ITEMCONTRATUAL I, ');
    Add('   RATEIOCENTROCUSTO R, ');
    Add('   CENTCUST CC, ');
    Add('   PESSOA P, ');
    Add('   PESSOA RS, ');
    Add('   MOEDA M, ');
    Add('   CONTRATOUSUARIO CXU, ');
    Add('   (SELECT AD1.DATAASSADITAMENTO, ');
    Add('           AD1.IDCONTRATO ');
    Add('    FROM ADITAMENTO AD1 ');
    Add('    WHERE (AD1.IDADITAMENTO=(SELECT MAX(AD2.IDADITAMENTO) ');
    Add('                             FROM ADITAMENTO AD2 ');
    Add('                             WHERE (AD2.IDCONTRATO= AD1.IDCONTRATO)))) ADT ');
    Add('WHERE ');
    Add('    (C.IDFORCLI=P.IDPESSOA(+)) AND ');
    Add('    (C.IDRESPONSAVEL=RS.IDPESSOA(+)) AND ');
    Add('    (C.IDCONTRATO=OI.IDCONTRATO(+)) AND ');
    Add('    (C.IDCONTRATO = ADT.IDCONTRATO(+)) AND ');
    Add('    (C.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND ');
    Add('    (OI.IDITEM=I.IDITEM) AND ');
    Add('    (OI.IDOBJETO=O.IDOBJETO) AND ');
    Add('    (OI.MOECODIGO=M.MOECODIGO(+)) AND ');
    Add('    (OI.IDCONTRATO=R.IDCONTRATO(+)) AND ');
    Add('    (OI.IDOBJETO=R.IDOBJETO(+)) AND ');
    Add('    (OI.IDITEM=R.IDITEM(+)) AND ');
    Add('    (R.IDEMPRESA=CC.IDEMPRESA) AND ');
    Add('    (R.CODCENTROCUSTO=CC.CODCENTROCUSTO) AND ');
    Add('    (CXU.IDCONTRATO = C.IDCONTRATO) AND ');
    Add('    (CXU.IDUSUARIO = '+FloatToStr(CrmRptCM.IdUsuario)+') ');

    case CmpRptCM.ParamValues[0].AsInteger  of
       1: Add('    AND (RTRIM(C.FLGFIMCONTRATO) = ''N'') ');
       2: Add('    AND (RTRIM(C.FLGFIMCONTRATO) = ''S'') ');
       3: Add('    AND (RTRIM(C.FLGFIMCONTRATO) = ''E'') ');
    end;

    case CmpRptCM.ParamValues[1].AsInteger  of
       1: Add('    AND (C.DATAPREVENCERRA IS NOT NULL) ');
       2: Add('    AND (C.DATAPREVENCERRA IS NULL) ');
    end;

    case CmpRptCM.ParamValues[2].AsInteger of
       0: begin
             if not(CmpRptCM.ParamValues[3].IsNull) then
                Add('  AND (C.DATAASSINATURA >= TO_DATE('''+
                FormatDateTime('ddd/mm/yyyy', CmpRptCM.ParamValues[3].AsDateTime)+''',''dd/mm/yyyy'')) ');

             if not(CmpRptCM.ParamValues[4].IsNull) and
                   ((CmpRptCM.ParamValues[3].AsDateTime<=CmpRptCM.ParamValues[4].AsDateTime) or
                    (CmpRptCM.ParamValues[3].IsNull)) then
                Add('  AND (C.DATAASSINATURA <= TO_DATE('''+
                FormatDateTime('ddd/mm/yyyy', CmpRptCM.ParamValues[4].AsDateTime)+''',''dd/mm/yyyy'')) ');
          end;
       1: begin
             if not(CmpRptCM.ParamValues[3].IsNull) then
                Add('  AND (C.DATAPREVENCERRA >= TO_DATE('''+
                FormatDateTime('ddd/mm/yyyy', CmpRptCM.ParamValues[3].AsDateTime)+''',''dd/mm/yyyy'')) ');

             if not(CmpRptCM.ParamValues[4].IsNull) and
                   ((CmpRptCM.ParamValues[3].AsDateTime<=CmpRptCM.ParamValues[4].AsDateTime) or
                    (CmpRptCM.ParamValues[3].IsNull)) then
                Add('  AND (C.DATAPREVENCERRA <= TO_DATE('''+
                FormatDateTime('ddd/mm/yyyy', CmpRptCM.ParamValues[4].AsDateTime)+''',''dd/mm/yyyy'')) ');
          end;
    end;
    Add('ORDER BY NOMECONTRATO, NOMEOBJETO, NOME_ITEM, NOMECC ');
  end;
  spContratos.Open;
end;

procedure TRptAlteraContrato.AbreAditamento;
var sContrato : String;
begin
  sContrato := IntToStr(cdsContratos.FieldByName('IDCONTRATO').AsInteger);
  with spAditamentos.SQL do begin
    Clear;
    Add('SELECT C.IDCONTRATO, ');
    Add('       A.IDADITAMENTO, ');
    Add('       C.NOMECONTRATO, ');
    Add('       A.DATAASSADITAMENTO, ');
    Add('       A.CODADITAMENTO, ');
    Add('       A.DESCADITAMENTO ');
    Add('  FROM CONTRATOORIG C,ADITAMENTO A ');
    Add(' WHERE A.IDCONTRATO = C.IDCONTRATO ');
    Add('   AND C.IDCONTRATO = ' + sContrato );
    Add('ORDER BY C.NOMECONTRATO, C.IDCONTRATO, A.DATAASSADITAMENTO, A.CODADITAMENTO ');
  end;
  spAditamentos.Open;
  ppSubReport1.Visible := not cdsAditamentos.IsEmpty;
end;

procedure TRptAlteraContrato.AbreLog;
var sAditamento : String;
begin
  sAditamento := IntToStr(cdsAditamentos.FieldByName('IDADITAMENTO').AsInteger);
  with spLog.SQL do begin
    Clear;
    Add('SELECT L.IDADITAMENTO, ');
    Add('       DECODE(L.IDITEM, NULL, ''Contrato'', I.NOME_ITEM) AS DSC_ITEM, ');
    Add('       DECODE(F.DESCRICAO, NULL, F.FIELDNAME, SUBSTR(F.DESCRICAO,1,40) ) AS DESCRICAO, ');
    Add('       L.VLRANTERIOR, ');
    Add('       L.VLRATUAL ');
    Add('  FROM LOGADITAMENTO L, ITEMCONTRATUAL I, ');
    Add('       DDFIELD F ');
    Add(' WHERE L.IDDDFIELD = F.IDDDFIELD ');
    Add('   AND L.IDITEM = I.IDITEM(+) ');
    Add('   AND L.IDADITAMENTO = ' + sAditamento );
    Add(' ORDER BY DSC_ITEM, DESCRICAO ');
  end;
  spLog.Open;
  ppSubReport2.Visible := not cdsLog.IsEmpty;
end;

procedure TRptAlteraContrato.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;

   AbreQueries;
end;

procedure TRptAlteraContrato.AbreQueries;
begin
  qryContratos.Close;
  qryAditamentos.Close;
  qryLog.Close;

  qryContratos.ParamByName('FLGCONTRATO').AsString:='_';
  qryContratos.ParamByName('TIPOCONTRATO').AsString:='_';
  case CmpRptCM.ParamValues[0].AsInteger  of
     0: qryContratos.ParamByName('FLGCONTRATO').AsString:='TODOS';
     1: qryContratos.ParamByName('TIPOCONTRATO').AsString:='N';
     2: qryContratos.ParamByName('TIPOCONTRATO').AsString:='S';
     3: qryContratos.ParamByName('TIPOCONTRATO').AsString:='E';
  end;

  qryContratos.ParamByName('TIPODATA').AsString:='_';
  case CmpRptCM.ParamValues[2].AsInteger of
     0: qryContratos.ParamByName('TIPODATA').AsString:='DTASS';
     1: qryContratos.ParamByName('TIPODATA').AsString:='DTVNC';
  end;

  case CmpRptCM.ParamValues[1].AsInteger of
     0: qryContratos.ParamByName('FLGDATAENC').AsString:='TODAS';
     1: qryContratos.ParamByName('FLGDATAENC').AsString:='DTVENCD';
     2: qryContratos.ParamByName('FLGDATAENC').AsString:='DTVENCI';
  end;

  qryContratos.ParamByName('IDPESSOA').AsFloat  := Sistema.IdEmpresa;
  qryContratos.ParamByName('DTINICIO').AsDate   := StrToDate(FormatDateTime('ddd/mm/yyyy', CmpRptCM.ParamValues[3].AsDateTime));
  qryContratos.ParamByName('DTFIM').AsDate      := StrToDate(FormatDateTime('ddd/mm/yyyy', CmpRptCM.ParamValues[4].AsDateTime));
  qryContratos.ParamByName('IDUSUARIO').AsFloat := Sistema.IdUsuario;

  qryContratos.Open;
  qryAditamentos.Open;
  qryLog.Open;
end;

end.
