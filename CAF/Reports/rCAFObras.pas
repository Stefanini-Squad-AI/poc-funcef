unit rCAFObras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, DB, 
  DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
  DBClient, uCMClientDataSet, uCmSqlParams, MontaSelect, uCMfileUtils, uCtrlPadroes,
  IvDictio, IvMulti;

type
  TRptCAFObras = class(TFrmCmReport)
    ppObras: TppBDEPipeline;
    dsObras: TwwDataSource;
    rpObras: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText24: TppDBText;
    ppDBText26: TppDBText;
    ppDBText25: TppDBText;
    ppDBText46: TppDBText;
    ppDBText56: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine27: TppLine;
    ppLabel61: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel58: TppLabel;
    ppDBText23: TppDBText;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLine28: TppLine;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel80: TppLabel;
    ppLine29: TppLine;
    ppDBText31: TppDBText;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc4: TppDBCalc;
    ppLine30: TppLine;
    sqlObras: TCMSqlParams;
    cdsObras: TCMClientDataSet;
    MSObra: TMontaSelect;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppLabel64Print(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFObras: TRptCAFObras;

implementation

{$R *.dfm}

procedure TRptCAFObras.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   MSObra.Filtro.Add('CAFOBRA.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
end;

procedure TRptCAFObras.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      //----------------------------------------------------------------------------------
      // Processa os Filtros
      //----------------------------------------------------------------------------------
      cdsObras.Close;
      with sqlObras do
      begin
         if CmpRptCM.ParamValues[1].AsInteger <> 0 then
         begin
            SQL.Strings[13] := '   AND O.IDCAFOBRA = ' + MSObra.ValoresChave[0];
            SQL.Strings[14] := '   AND O.IDPESSOA  = ' + MSObra.ValoresChave[1];
            SQL.Strings[15] := ' ';
         end else
         begin
            SQL.Strings[13] := ' ';
            SQL.Strings[14] := ' ';
            if CmpRptCM.ParamValues[0].AsInteger < 2 then
            begin
               SQL.Strings[15] := '   AND O.FLGOBRA = ' + inttostr(CmpRptCM.ParamValues[0].AsInteger);
            end else
            begin
               SQL.Strings[15] := ' ';
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      sqlObras.Prepare;
      sqlObras.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlObras.Open;
      TFloatField(cdsObras.FieldByName('VALOFI')).DisplayFormat := '#,##0.00;(#,##0.00); ';
      Screen.Cursor := crDefault;
   except
      on E : Exception Do
      begin
         CMDebugToFile('CADASTRO DE OBRAS : ' + #13 + E.Message);
      end;
   end;
end;

procedure TRptCAFObras.ppLabel64Print(Sender: TObject);
begin
   inherited;
   if cdsObras.FieldByName('FLGOBRA').AsInteger = 1 then
      ppLabel64.Caption := 'Encerrado em ' + cdsObras.FieldByName('DTAENCERRAOBRA').AsString
   else
      ppLabel64.Caption := 'Em Aberto';
end;

end.
