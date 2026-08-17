unit rOrdemPgtoNova;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, DBTables,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppVar, ppBands, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, DBClient,
  uCMClientDataSet, uCmSqlParams, Wwquery, ppStrtch, ppSubRpt,
  uCtrlParamIntegra, Provider, uExtensoCM,uCMTypes,uCmDbObject,uCmControlObject,
  dBaseDados, uSistema, uDataBase;

type
  TrptOrdemPgtoNova = class(TFrmCmReport)
    sqlOrdemPago: TCMSqlParams;
    cdsOrdemPago: TCMClientDataSet;
    sqlResContab: TCMSqlParams;
    cdsResContab: TCMClientDataSet;
    pplResContab: TppBDEPipeline;
    dsResContab: TwwDataSource;
    rpOrdemPagoArg: TppReport;
    pplblTitFatEmit: TppLabel;
    LblEmpresa: TppLabel;
    ppDetailBand1: TppDetailBand;
    rpFaturaEmiteDBText2: TppDBText;
    rpFaturaEmiteDBText3: TppDBText;
    rpFaturaEmiteDBText4: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    lblSistema: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    rpFaturaEmiteSummaryBand1: TppSummaryBand;
    rpFaturaEmiteSubReport1: TppSubReport;
    rpFaturaEmiteChildReport1: TppChildReport;
    rpFaturaEmiteChildReport1DetailBand1: TppDetailBand;
    rpFaturaEmiteDBText6: TppDBText;
    rpFaturaEmiteGroup1: TppGroup;
    rpFaturaEmiteGroupHeaderBand1: TppGroupHeaderBand;
    rpFaturaEmiteDBText1: TppDBText;
    rpFaturaEmiteLabel1: TppLabel;
    rpFaturaEmiteGroupFooterBand1: TppGroupFooterBand;
    pplOrdemPago: TppBDEPipeline;
    dsOrdemPago: TwwDataSource;
    qryOrdemPago: TwwQuery;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText4: TppDBText;
    qryResContab: TwwQuery;
    ExtensoOP: TExtensoCM;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine5: TppLine;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine6: TppLine;
    ppLabel20: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppTitleBand1: TppTitleBand;
    rpFaturaEmiteLabel4: TppLabel;
    ppLabel22: TppLabel;
    ppLabel21: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLine1: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppLabel26: TppLabel;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLine7: TppLine;
    ppLabel27: TppLabel;
    ppLine8: TppLine;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppShape5: TppShape;
    ppLabel32: TppLabel;
    ppShape6: TppShape;
    ppLabel33: TppLabel;
    ppShape7: TppShape;
    ppLabel34: TppLabel;
    updOrdemPago: TUpdateSQL;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppLabel11Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptOrdemPgtoNova: TrptOrdemPgtoNova;

implementation

{$R *.DFM}


procedure TrptOrdemPgtoNova.CrmRptCMBeforePrint(Sender: TObject);
var iNumLote : Double;
    sNumSlip : String;
begin
  inherited;
  //
  qryOrdemPago.Close;
  if CmpRptCM.ParamValues[3].AsInteger <> 0 then begin
     qryOrdemPago.SQL.Delete(33);
     qryOrdemPago.SQL.Insert(33,'  AND (LP.NUMSLIP = '+CmpRptCM.ParamValues[3].AsString+')');
  end;
  qryOrdemPago.ParamByName('IDEMPRESA').AsFloat    := CrmRptCM.IdEmpresa;
  qryOrdemPago.ParamByName('CODALTERADOR').AsFloat := CmpRptCM.ParamValues[2].AsFloat;
  qryOrdemPago.ParamByName('DATAINI').AsString     := CmpRptCM.ParamValues[0].AsString;
  qryOrdemPago.ParamByName('DATAFIM').AsString     := CmpRptCM.ParamValues[1].AsString;
  qryOrdemPago.Open;
  //
  Try
     StartTransacao;
     iNumLote := -1;
     sNumSlip:='';
     qryOrdemPago.First;
     while not qryOrdemPago.Eof do Begin
        if qryOrdemPago.FieldByName('NUMSLIP').isNull then begin
           if (qryOrdemPago.FieldByName('NUMLOTE').AsFloat <> iNumLote) then begin
              sNumSlip := FloatToStr(LeUltRegistro(nil,'SLIPDOCUMENTO'));
              if not ExecutarQuery(dtmBaseDados.qry,'UPDATE DOCUMENTO ' +
                      'SET NUMSLIP = ''' + sNumSlip + ''' ' +
                      'WHERE CODDOCUMENTO IN ' +
                      '(SELECT CODDOCUMENTO FROM LOTEXDOCUM ' +
                      'WHERE NUMLOTE = (' + qryOrdemPago.FieldByName('NUMLOTE').AsString + '))' + ' AND ' +
                      'NUMSLIP IS NULL') then Abort;
              if not ExecutarQuery(dtmBaseDados.qry,'UPDATE LOTEPAGTO SET NUMSLIP = ''' + sNumSlip + ''' ' +
                   'WHERE NUMLOTE = ' + qryOrdemPago.FieldByName('NUMLOTE').AsString + ' AND ' +
                   'NUMSLIP IS NULL') then Abort;
              iNumLote := qryOrdemPago.FieldByName('NUMLOTE').AsFloat;
           end;
           qryOrdemPago.Edit;
           qryOrdemPago.FieldByName('NUMSLIP').AsString := sNumSlip;
           qryOrdemPago.Post;
        end;
        qryOrdemPago.Next;
     end;
     qryOrdemPago.First;
     CommitTransacao;
  Except
     RollBackTransacao;
     Raise;
  end;

end;

procedure TrptOrdemPgtoNova.ppLabel11Print(Sender: TObject);
begin
  inherited;
  ExtensoOP.Valor             := qryOrdemPago.FieldByName('TOTALLOTE').AsFloat;
  ExtensoOP.CaracterAdicional := '* ';
  ExtensoOP.CompletaExtenso   := true;
  ExtensoOP.TamanhoLinha      := 120;
  ExtensoOP.DescricaoMoeda.Singular:='Peso';
  ExtensoOP.DescricaoMoeda.Plural:='Pesos';
  ExtensoOP.Escreve;
  if qryOrdemPago.FieldByName('TOTALLOTE').AsFloat <> 0 then begin
     ppLabel11.Caption    := ExtensoOP.LinhasExtenso.Linha1;
     ppLabel12.Caption    := ExtensoOP.LinhasExtenso.Linha2;
  end else begin
     ppLabel11.Caption    := '';
     ppLabel12.Caption    := '';
  end;

end;

end.

