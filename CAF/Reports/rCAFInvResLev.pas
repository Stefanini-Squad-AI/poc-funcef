unit rCAFInvResLev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, 
  Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, DB, Wwdatsrc, DBTables, Wwquery, DBClient,
  uCMClientDataSet, uCmSqlParams, MontaSelect, uCMfileUtils, uCtrlPadroes,
  IvDictio, IvMulti;

type
  TRptCAFInvResLev = class(TFrmCmReport)
    dsInvResLev: TwwDataSource;
    ppInvResLev: TppBDEPipeline;
    rpInvResLev: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel35: TppLabel;
    ppLine21: TppLine;
    ppLabel36: TppLabel;
    ppLine9: TppLine;
    ppLabel11: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    lblSelecao: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLine10: TppLine;
    ppDetailBand6: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine23: TppLine;
    ppLabel37: TppLabel;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    sqlInvResLev: TCMSqlParams;
    cdsInvResLev: TCMClientDataSet;
    MSInventBens: TMontaSelect;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFInvResLev: TRptCAFInvResLev;

implementation

{$R *.dfm}

procedure TRptCAFInvResLev.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      //----------------------------------------------------------------------------------
      // Processa os Filtros
      //----------------------------------------------------------------------------------
      cdsInvResLev.Close;
      if CmpRptCM.ParamByName('OPCAO').AsInteger = 1 then
      begin
         sqlInvResLev.SQL.Strings[31] := ' AND I.IIBFLGPLACA = 1';
      end else
      if CmpRptCM.ParamByName('OPCAO').AsInteger = 2 then
      begin
         sqlInvResLev.SQL.Strings[31] := ' AND I.IIBFLGPLACA = 2';
      end else
      if CmpRptCM.ParamByName('OPCAO').AsInteger = 3 then
      begin
         sqlInvResLev.SQL.Strings[31] := ' AND I.IIBFLGPLACA = 5';
      end else
      if CmpRptCM.ParamByName('OPCAO').AsInteger = 4 then
      begin
         sqlInvResLev.SQL.Strings[31] := ' AND I.IIBFLGPLACA = 4';
      end else
      if CmpRptCM.ParamByName('OPCAO').AsInteger = 5 then
      begin
         sqlInvResLev.SQL.Strings[31] := ' AND I.IIBFLGPLACA = 3';
      end else
      begin
         sqlInvResLev.SQL.Strings[31] := ' ';
      end;
      //----------------------------------------------------------------------------------
      sqlInvResLev.Prepare;
      sqlInvResLev.ParamByName('IDINVENTARIOBENS').AsFloat := strtofloat(MSInventBens.ValoresChave[0]);
      sqlInvResLev.ParamByName('IDEMPRESA').AsFloat := strtofloat(MSInventBens.ValoresChave[1]);
      sqlInvResLev.Open;
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamByName('OPCAO').AsInteger of
         0 : lblSelecao.Caption := 'Bens do levantamento';
         1 : lblSelecao.Caption := 'Bens da localização encontrados';
         2 : lblSelecao.Caption := 'Bens da localização não encontrados';
         3 : lblSelecao.Caption := 'Bens não cadastrados';
         4 : lblSelecao.Caption := 'Bens pertencentes a outras localizações';
         5 : lblSelecao.Caption := 'Bens encontrados em outras localizações';
      else
         lblSelecao.Caption := 'Completo';
      end;
   except
      on E : Exception Do
      begin
         CMDebugToFile('RESULTADO DO LEVANTAMENTO DE INVENTARIO : ' + E.Message);
      end;
   end;
end;

procedure TRptCAFInvResLev.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   MSInventBens.Filtro.Add('INVENTARIOBENS.IDEMPRESA = ' + FloatToStr(CrmRptCM.IdEmpresa));
end;

end.
