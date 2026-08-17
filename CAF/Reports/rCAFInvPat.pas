unit rCAFInvPat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, uCmSqlParams, Db,
  DBClient, uCMClientDataSet, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl,
  ppCache, ppProd, ppReport, Wwdatsrc, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  uCMfileUtils, uCtrlPadroes, IvDictio, IvMulti, TXRB;

type
  TRptCAFInvPat = class(TFrmCmReport)
    ppInvPat: TppBDEPipeline;
    dsInvPat: TwwDataSource;
    rpInvPat: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppLabel40: TppLabel;
    LblEmpresa: TppLabel;
    ppDetailBand17: TppDetailBand;
    rpInvPatDBText4: TppDBText;
    rpInvPatDBText5: TppDBText;
    rpInvPatShape1: TppShape;
    rpInvPatShape2: TppShape;
    rpInvPatShape3: TppShape;
    rpInvPatLabel7: TppLabel;
    rpInvPatLabel8: TppLabel;
    rpInvPatLabel9: TppLabel;
    ppFooterBand17: TppFooterBand;
    ppLine36: TppLine;
    LBLSISTEMA: TppLabel;
    ppCalc33: TppSystemVariable;
    ppCalc34: TppSystemVariable;
    rpInvPatGroup1: TppGroup;
    rpInvPatGroupHeaderBand1: TppGroupHeaderBand;
    ppLine35: TppLine;
    rpInvPatLabel1: TppLabel;
    rpInvPatLabel2: TppLabel;
    rpInvPatDBText1: TppDBText;
    rpInvPatDBText2: TppDBText;
    rpInvPatLabel3: TppLabel;
    rpInvPatLabel4: TppLabel;
    rpInvPatLabel5: TppLabel;
    rpInvPatGroupFooterBand1: TppGroupFooterBand;
    rpInvPatGroup2: TppGroup;
    rpInvPatGroupHeaderBand2: TppGroupHeaderBand;
    rpInvPatLabel6: TppLabel;
    rpInvPatDBText3: TppDBText;
    rpInvPatGroupFooterBand2: TppGroupFooterBand;
    cdsInvPat: TCMClientDataSet;
    sqlInvPat: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFInvPat: TRptCAFInvPat;

implementation

{$R *.DFM}

procedure TRptCAFInvPat.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text := ' SELECT NOME, IDLOCALIZACAO ' +
                                                      ' FROM LOCALIZACAO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY NOME ';
   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ' + #39 + 'A' + #39 +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text := ' SELECT DESCCONJUNTO, IDCONJUNTO '+
                                                      ' FROM CONJUNTO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY DESCCONJUNTO ';
end;

procedure TRptCAFInvPat.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      with sqlInvPat do
      begin
         if CmpRptCM.ParamByName('CONTROLE').AsString = 'Total' then
         begin
            SQL.Strings[11] := '   AND B.CONTROLE = ' + #39 + 'T' + #39;
         end else
         if CmpRptCM.ParamByName('CONTROLE').AsString = 'Físico' then
         begin
            SQL.Strings[11] := '   AND B.CONTROLE = ' + #39 + 'F' + #39;
         end else
         begin
            SQL.Strings[11] := '';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('GRUPO').AsInteger <> 0 then
         begin
            SQL.Strings[12] := '   AND B.IDGRUPO = ' + inttostr(CmpRptCM.ParamByName('GRUPO').AsInteger);
         end else
         begin
            SQL.Strings[12] := '';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('CLASSE').AsInteger <> 0 then
         begin
            SQL.Strings[13] := '   AND B.IDCLASSEBEM = ' + inttostr(CmpRptCM.ParamByName('CLASSE').AsInteger);
         end else
         begin
            SQL.Strings[13] := '';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('LOCALIZACAO').AsInteger <> 0 then
         begin
            SQL.Strings[14] := '   AND C.IDLOCALIZACAO = ' + inttostr(CmpRptCM.ParamByName('LOCALIZACAO').AsInteger);
         end else
         begin
            SQL.Strings[14] := '';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('RESPONSAVEL').AsInteger <> 0 then
         begin
            SQL.Strings[15] := '   AND C.IDRESPONSAVEL = ' + inttostr(CmpRptCM.ParamByName('RESPONSAVEL').AsInteger);
         end else
         begin
            SQL.Strings[15] := '';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('CONJUNTO').AsInteger <> 0 then
         begin
            SQL.Strings[16] := '   AND B.IDCONJUNTO = ' + inttostr(CmpRptCM.ParamByName('CONJUNTO').AsInteger);
         end else
         begin
            SQL.Strings[16] := '';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamByName('ORDENACAO').AsInteger = 1 then
         begin
            SQL.Strings[24] := ' ORDER BY L.NOME, CB.DESCRICAO, B.PLACA';
         end else
         begin
            SQL.Strings[24] := ' ORDER BY L.NOME, CB.DESCRICAO, B.DESBEM';
         end;
      end;
      //----------------------------------------------------------------------------------
      ppLabel40.Caption := 'Relação de Bens para Levantamento do Inventário Patrimonial';
      Screen.Cursor := crSQLWait;
      sqlInvPat.Prepare;
      sqlInvPat.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlInvPat.Open;
      Screen.Cursor := crDefault;
   except
      on E : Exception Do
      begin
         CMDebugToFile('RELAÇÃO DE BENS PARA LEVANTAMENTO DO INVENTÁRIO PATRIMONIAL' + #13 + E.Message);
      end;
   end;
end;

end.
