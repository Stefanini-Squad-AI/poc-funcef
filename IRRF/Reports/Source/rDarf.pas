unit rDarf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db,
  Wwdatsrc, DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlRptGPS, uSistema, DBaseDados;

type
  TfrmRptDarf = class(TFrmCmReport)
    dsDarf: TwwDataSource;
    pplDarf: TppBDEPipeline;
    pplDarfppField1: TppField;
    pplDarfppField2: TppField;
    pplDarfppField3: TppField;
    pplDarfppField4: TppField;
    pplDarfppField5: TppField;
    pplDarfppField6: TppField;
    pplDarfppField7: TppField;
    pplDarfppField8: TppField;
    pplDarfppField9: TppField;
    pplDarfppField10: TppField;
    pplDarfppField11: TppField;
    pplDarfppField12: TppField;
    pplDarfppField13: TppField;
    pplDarfppField14: TppField;
    pplDarfppField15: TppField;
    pplDarfppField16: TppField;
    pplDarfppField17: TppField;
    pplDarfppField18: TppField;
    pplDarfppField19: TppField;
    pplDarfppField20: TppField;
    pplDarfppField21: TppField;
    pplDarfppField22: TppField;
    pplDarfppField23: TppField;
    pplDarfppField24: TppField;
    rpDarf: TppReport;
    ppDetailBand1: TppDetailBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppShape28: TppShape;
    ppShape27: TppShape;
    rpDarfShape1: TppShape;
    rpDarfShape12: TppShape;
    rpDarfShape13: TppShape;
    rpDarfShape10: TppShape;
    rpDarfShape11: TppShape;
    rpDarfShape8: TppShape;
    rpDarfShape9: TppShape;
    rpDarfShape2: TppShape;
    rpDarfImage1: TppImage;
    rpDarfLabel1: TppLabel;
    rpDarfLabel2: TppLabel;
    rpDarfLabel3: TppLabel;
    rpDarfLabel4: TppLabel;
    rpDarfShape3: TppShape;
    rpDarfLabel5: TppLabel;
    rpDarfLabel6: TppLabel;
    rpDarfShape4: TppShape;
    rpDarfLabel7: TppLabel;
    rpDarfLabel8: TppLabel;
    rpDarfShape5: TppShape;
    rpDarfShape6: TppShape;
    rpDarfShape7: TppShape;
    rpDarfLabel10: TppLabel;
    rpDarfLabel11: TppLabel;
    rpDarfLabel12: TppLabel;
    rpDarfLabel13: TppLabel;
    rpDarfLabel14: TppLabel;
    rpDarfLabel15: TppLabel;
    rpDarfLabel16: TppLabel;
    rpDarfLabel17: TppLabel;
    rpDarfShape14: TppShape;
    rpDarfShape15: TppShape;
    rpDarfLabel18: TppLabel;
    rpDarfLabel19: TppLabel;
    rpDarfShape16: TppShape;
    rpDarfShape17: TppShape;
    rpDarfLabel20: TppLabel;
    rpDarfLabel21: TppLabel;
    rpDarfShape18: TppShape;
    rpDarfShape19: TppShape;
    rpDarfLabel22: TppLabel;
    rpDarfLabel23: TppLabel;
    rpDarfShape20: TppShape;
    rpDarfShape21: TppShape;
    rpDarfLabel25: TppLabel;
    rpDarfMemo2: TppMemo;
    rpDarfDBText2: TppDBText;
    rpDarfDBText3: TppDBText;
    rpDarfDBText4: TppDBText;
    rpDarfDBText5: TppDBText;
    rpDarfDBText6: TppDBText;
    rpDarfDBText7: TppDBText;
    rpDarfDBText10: TppDBText;
    rpDarfDBText11: TppDBText;
    rpDarfDBText12: TppDBText;
    rpDarfLabel41: TppLabel;
    rpDarfLabel9: TppLabel;
    rpDarfMemo1: TppMemo;
    rpDarfShape22: TppShape;
    rpDarfShape23: TppShape;
    rpDarfLabel26: TppLabel;
    rpDarfLabel27: TppLabel;
    rpDarfLabel28: TppLabel;
    rpDarfLabel29: TppLabel;
    rpDarfDBText8: TppDBText;
    rpDarfDBText9: TppDBText;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape8: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppImage1: TppImage;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppShape14: TppShape;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppShape15: TppShape;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppLabel52: TppLabel;
    ppMemo1: TppMemo;
    ppDBText3: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppMemo2: TppMemo;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppShape29: TppShape;
    ppMemo3: TppMemo;
    ppGroupFooterBand1: TppGroupFooterBand;
    sqlDarf: TCMSqlParams;
    cdsDarf: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpDarfPrintingComplete(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    CtrlRptGPS : TCtrlRptGPS;
  public
    { Public declarations }
  end;

var
  frmRptDarf: TfrmRptDarf;

implementation


{$R *.DFM}

procedure TfrmRptDarf.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with sqlDarf do
    Begin
      SQL.Clear;
      SQL.Add('SELECT D.IDDARF,                   ');
      SQL.Add('       D.IDPESSOA,                 ');
      SQL.Add('       D.CODNATUREZA,              ');
      SQL.Add('       D.NUMDOCUMENTO,             ');
      SQL.Add('       D.REFERENCIA,               ');
      SQL.Add('       D.PROCESSO,                 ');
      SQL.Add('       D.DATAINIAPURACAO,          ');
      SQL.Add('       D.DATAFINALAPURACAO,        ');
      SQL.Add('       D.DATAVENCDARF,             ');
      SQL.Add('       D.DATAPAGTODARF,            ');
      SQL.Add('       D.VLRBASECALCULO,           ');
      SQL.Add('       D.PERCIRRF,                 ');
      SQL.Add('       (D.VLRIRRF - NVL(D.VLRDESCONTO,0)) AS VLRIRRF, ');
      SQL.Add('       D.VLRMULTA,                 ');
      SQL.Add('       D.VLRJUROS,                 ');
      SQL.Add('       D.VLRTOTAL,                 ');
      SQL.Add('       D.OBSDARF,                  ');
      SQL.Add('       D.FLGIMPRESSO,              ');
      SQL.Add('       D.CODDOCUMENTO,             ');
      SQL.Add('       D.NUMLANCMULTA,             ');
      SQL.Add('       D.NUMLANCJUROS,             ');
      SQL.Add('       D.DATAEMISDARF,             ');
      SQL.Add('       P.RAZAOSOCIAL,              ');
      SQL.Add('       T.NUMERO AS TELEFONE        ');
      SQL.Add('FROM PESSOA P,                                ');
      SQL.Add('     TELENDPESS T,                            ');
      SQL.Add('     DARF D,                                  ');
      SQL.Add('     (SELECT MAX(T.IDTELEFONE) AS IDTELEFONE  ');
      SQL.Add('      FROM PESSOA P,                          ');
      SQL.Add('           TELENDPESS T                       ');
      SQL.Add('      WHERE (P.IDPESSOA = :pIDEMPRESA)        ');
      SQL.Add('        AND (P.IDENDCOMERCIAL = T.IDENDERECO) ');
      SQL.Add('        AND (T.TIPO LIKE ''%C%'' )) TM        ');
      SQL.Add('WHERE (D.IDPESSOA = :pIDEMPRESA)              ');
      SQL.Add('  AND (P.IDPESSOA = :pIDEMPRESA)              ');
      SQL.Add('  AND (D.IDPESSOA = P.IDPESSOA)               ');
      SQL.Add('  AND (P.IDENDCOMERCIAL = T.IDENDERECO(+))    ');
      SQL.Add('  AND (T.IDTELEFONE = TM.IDTELEFONE(+))       ');
      if CmpRptCM.ParamValues[0].AsInteger = 0 then
        Begin
          SQL.Add('  AND ((D.FLGIMPRESSO <> ''S'') OR (D.FLGIMPRESSO IS NULL))               ');
        end
      else
        Begin
          SQL.Add('  AND (D.FLGIMPRESSO = ''S'')                 ');
        end;

      if trim(CmpRptCM.ParamValues[1].AsString) <> '' then
         SQL.Add('  AND (D.DATAEMISDARF >= TO_DATE('''+trim(CmpRptCM.ParamValues[1].AsString)+''',''DD/MM/YYYY'')) ');
      if trim(CmpRptCM.ParamValues[2].AsString) <> '' then
         SQL.Add('  AND (D.DATAEMISDARF <= TO_DATE('''+trim(CmpRptCM.ParamValues[2].AsString)+''',''DD/MM/YYYY'')) ');
      if trim(CmpRptCM.ParamValues[3].AsString) <> '' then
         SQL.Add('  AND (D.CODNATUREZA = '''+CmpRptCM.ParamValues[3].AsString+''') ');
      SQL.Add(' ORDER BY D.CODNATUREZA, D.IDDARF ');
      Prepare;
      ParamByName('pIDEMPRESA').AsFloat := CrmRptCM.IdEmpresa;
      Open;
    end;
end;

procedure TfrmRptDarf.rpDarfPrintingComplete(Sender: TObject);
begin
  inherited;
  cdsDarf.First;
  While not cdsDarf.EOF do
   Begin
     //Atualiza darf como impresso.
     CtrlRptGPS.ExecutarSQL('UPDATE DARF SET FLGIMPRESSO = ''S'' '+
                             'WHERE IDDARF = '+cdsDarf.FieldByName('IDDARF').AsString);
     cdsDarf.Next;
   end;
end;

procedure TfrmRptDarf.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptGPS := TCtrlRptGPS.Create;
  CtrlRptGPS.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
end;

end.
