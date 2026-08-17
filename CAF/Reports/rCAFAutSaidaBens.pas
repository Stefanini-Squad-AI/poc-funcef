unit rCAFAutSaidaBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, DB, Wwdatsrc, DBTables, Wwquery,
  ppStrtch, ppMemo, IvDictio, IvMulti, DBClient, uCMClientDataSet,
  uCmSqlParams, MontaSelect, uCMfileUtils, uCtrlPadroes;

type
  TRptCAFAutSaidaBens = class(TFrmCmReport)
    dsAutSaiBens: TwwDataSource;
    ppAutSaiBens: TppBDEPipeline;
    sqlAutSaiBens: TCMSqlParams;
    cdsAutSaiBens: TCMClientDataSet;
    MSTermo: TMontaSelect;
    rpAutSaiBens: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel3: TppLabel;
    ppLine5: TppLine;
    ppLabel8: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText2: TppDBText;
    rpAutSaiMatLine10: TppLine;
    ppFooterBand3: TppFooterBand;
    ppLabel12: TppLabel;
    rpAutSaiMatLine9: TppLine;
    ppCalc6: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    rpAutSaiMatGroup1: TppGroup;
    rpAutSaiMatGroupHeaderBand1: TppGroupHeaderBand;
    rpAutSaiMatLabel1: TppLabel;
    rpAutSaiMatLabel2: TppLabel;
    rpAutSaiMatGroupFooterBand1: TppGroupFooterBand;
    rpAutSaiMatLine2: TppLine;
    rpAutSaiMatLabel3: TppLabel;
    rpAutSaiMatDBText1: TppDBText;
    rpAutSaiMatDBText2: TppDBText;
    rpAutSaiMatLabel4: TppLabel;
    rpAutSaiMatLabel5: TppLabel;
    rpAutSaiMatDBText3: TppDBText;
    rpAutSaiMatDBText5: TppDBText;
    rpAutSaiMatLabel7: TppLabel;
    rpAutSaiMatLabel8: TppLabel;
    rpAutSaiMatDBText6: TppDBText;
    rpAutSaiMatLabel9: TppLabel;
    rpAutSaiMatDBText7: TppDBText;
    rpAutSaiMatLabel6: TppLabel;
    rpAutSaiMatDBText4: TppDBText;
    rpAutSaiMatLine3: TppLine;
    rpAutSaiMatLine6: TppLine;
    rpAutSaiMatLine4: TppLine;
    rpAutSaiMatLabel10: TppLabel;
    rpAutSaiMatLabel12: TppLabel;
    rpAutSaiMatLine8: TppLine;
    rpAutSaiMatLabel13: TppLabel;
    rpAutSaiMatLabel15: TppLabel;
    rpAutSaiMatLabel16: TppLabel;
    rpAutSaiMatLabel17: TppLabel;
    rpAutSaiMatLabel18: TppLabel;
    rpAutSaiMatLabel19: TppLabel;
    rpAutSaiMatLabel21: TppLabel;
    rpAutSaiMatLine5: TppLine;
    rpAutSaiMatLine7: TppLine;
    rpAutSaiMatLine1: TppLine;
    rpAutSaiMatLine11: TppLine;
    rpAutSaiMatLabel11: TppLabel;
    rpAutSaiMatLabel14: TppLabel;
    rpAutSaiMatLine12: TppLine;
    rpAutSaiMatLabel20: TppLabel;
    rpAutSaiMatLine13: TppLine;
    rpAutSaiMatDesBem: TppMemo;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpAutSaiMatDesBemPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFAutSaidaBens: TRptCAFAutSaidaBens;

implementation

{$R *.dfm}

procedure TRptCAFAutSaidaBens.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   MSTermo.Filtro.Add('SAIDATEMPORARIA.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
end;

procedure TRptCAFAutSaidaBens.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      //----------------------------------------------------------------------------------
      // Processa os Filtros
      //----------------------------------------------------------------------------------
      cdsAutSaiBens.Close;
      with sqlAutSaiBens do
      begin
         if CmpRptCM.ParamValues[2].AsInteger <> 0 then
         begin
            SQL.Strings[16] := '   AND ST.IDSAIDATEMPORARIA = ' + MSTermo.ValoresChave[0];
         end else
         begin
            SQL.Strings[16] := ' ';
         end;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      sqlAutSaiBens.Prepare;
      sqlAutSaiBens.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlAutSaiBens.ParamByName('DATAMOVINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlAutSaiBens.ParamByName('DATAMOVFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
      sqlAutSaiBens.Open;
      Screen.Cursor := crDefault;
   except
      on E : Exception Do
      begin
         CMDebugToFile('AUTORIZAÇÃO PARA SAÍDA TEMPORÁRIA DE BENS : ' + E.Message);
      end;
   end;
end;

procedure TRptCAFAutSaidaBens.rpAutSaiMatDesBemPrint(Sender: TObject);
begin
   inherited;
   rpAutSaiMatDesBem.Text := trim(cdsAutSaiBens.FieldByName('DESBEM').AsString);
   //-------------------------------------------------------------------------------------
   if cdsAutSaiBens.FieldByName('PUBANO').AsFloat <> 0 then
      rpAutSaiMatDesBem.Text := rpAutSaiMatDesBem.Text + ' Ano de Publicação : ' + trim(cdsAutSaiBens.FieldByName('PUBANO').AsString);
   //-------------------------------------------------------------------------------------
   if not cdsAutSaiBens.FieldByName('PUBAUTOR').IsNull then
      rpAutSaiMatDesBem.Text := rpAutSaiMatDesBem.Text + ' Autor : ' + trim(cdsAutSaiBens.FieldByName('PUBAUTOR').AsString);
   //-------------------------------------------------------------------------------------
   if not cdsAutSaiBens.FieldByName('PUBEDITORA').IsNull then
      rpAutSaiMatDesBem.Text := rpAutSaiMatDesBem.Text + ' Editora : ' + trim(cdsAutSaiBens.FieldByName('PUBEDITORA').AsString);
end;

end.
