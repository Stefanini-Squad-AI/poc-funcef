unit rCAFMovPatBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  FCmReport, ppVar, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, MontaSelect,
  uCMfileUtils, uCtrlPadroes, IvDictio, IvMulti;

type
  TRptCAFMovPatBem = class(TFrmCmReport)
    sqlMovBem: TCMSqlParams;
    dsMovBem: TwwDataSource;
    ppMovBem: TppBDEPipeline;
    rpMovBem: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLabel24: TppLabel;
    ppLine33: TppLine;
    ppLabel38: TppLabel;
    rpMovBemLabel6: TppLabel;
    rpMovBemLabel7: TppLabel;
    rpMovBemLabel8: TppLabel;
    rpMovBemLabel9: TppLabel;
    ppDetailBand16: TppDetailBand;
    rpMovBemDBText4: TppDBText;
    rpMovBemDBText5: TppDBText;
    rpMovBemDBText6: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand16: TppFooterBand;
    ppLine34: TppLine;
    ppLabel39: TppLabel;
    ppCalc31: TppSystemVariable;
    ppCalc32: TppSystemVariable;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    rpMovBemLabel1: TppLabel;
    rpMovBemDBText1: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    rpMovBemGroup1: TppGroup;
    rpMovBemGroupHeaderBand1: TppGroupHeaderBand;
    rpMovBemLine2: TppLine;
    rpMovBemLabel2: TppLabel;
    rpMovBemCalc1: TppVariable;
    rpMovBemDBText2: TppDBText;
    rpMovBemLabel5: TppLabel;
    ppLabel10: TppLabel;
    rpMovBemLabel4: TppLabel;
    rpMovBemLabel3: TppLabel;
    rpMovBemLine1: TppLine;
    rpMovBemGroupFooterBand1: TppGroupFooterBand;
    cdsMovBem: TCMClientDataSet;
    MSBem: TMontaSelect;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpMovBemCalc1Print(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    sTipoGrupo, sClasseGrupo : String;
  public
    { Public declarations }
  end;

var
  RptCAFMovPatBem: TRptCAFMovPatBem;

implementation

{$R *.DFM}

procedure TRptCAFMovPatBem.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO, G.TIPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.INATIVO = 0 ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

procedure TRptCAFMovPatBem.CrmRptCMBeforePrint(Sender: TObject);
var
   iMoedaOficial, iAux : Integer;
   sMascaraEmpresa,
   sMascaraGrupo,
   sMascaraPlaca       : String;

begin
   inherited;
   try
      //----------------------------------------------------------------------------------
      // Captura as Mascaras
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      with sqlParamCaf do
      begin
         Prepare;
         ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
         //-------------------------------------------------------------------------------
         sMascaraEmpresa := '';
         for iAux := 1 to length(trim(Floattostr(CrmRptCM.IdEmpresa))) do
         begin
            sMascaraEmpresa := sMascaraEmpresa + '#';
         end;
         //-------------------------------------------------------------------------------
         sMascaraGrupo := trim(cdsParamCaf.FieldByName('MASCCODGRUPO').AsString);
         iAux := 1;
         while iAux <= length(sMascaraGrupo) do
         begin
            if sMascaraGrupo[iAux] = '9' then
               sMascaraGrupo[iAux] := '#';
            iAux := iAux + 1;
         end;
         //-------------------------------------------------------------------------------
         if cdsParamCaf.FieldByName('SEQBEMEMP').AsFloat = 0 then
         begin
            sMascaraPlaca := sMascaraEmpresa + '.#########;0; ';
         end else
         begin
            sMascaraPlaca := sMascaraGrupo   + '.#######;0; '
         end;
      end;
      //----------------------------------------------------------------------------------
      // Processa os Filtros
      //----------------------------------------------------------------------------------
      cdsMovBem.Close;
      with sqlMovBem do
      begin
         if CmpRptCM.ParamValues[2].AsInteger <> 0 then
         begin
            if sTipoGrupo = 'S' then
            begin
               SQL.Strings[51] := ' AND (LTRIM(RTRIM(G.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
            end else
            begin
               SQL.Strings[51] := '   AND SCB.IDGRUPO = ' + inttostr(CmpRptCM.ParamValues[2].AsInteger);
            end;
         end else
         begin
            SQL.Strings[51] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[3].AsInteger <> 0 then
         begin
            SQL.Strings[31] := '   AND SCB1.IDBEM = ' + MSBem.ValoresChave[1];
            SQL.Strings[52] := '   AND B.IDBEM = ' + MSBem.ValoresChave[1];
         end else
         begin
            SQL.Strings[31] := ' ';
            SQL.Strings[52] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[4].AsInteger <> 0 then
         begin
            SQL.Strings[53] := '   AND HM.IDTIPOMOVIMENTACAO = ' + inttostr(CmpRptCM.ParamValues[4].AsInteger);
         end else
         begin
            SQL.Strings[53] := ' ';
         end;
         //-------------------------------------------------------------------------------
         Prepare;
         ParamByName('IDPESSOA').AsFloat       := CrmRptCM.IdEmpresa;
         ParamByName('MOECODIGO').AsInteger    := iMoedaOficial;
         ParamByName('IDTAXADEP').AsInteger    := 1;                             // Brasil
         ParamByName('PDATAMOVINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
         ParamByName('PDATAMOVFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
      end;
      //----------------------------------------------------------------------------------
      rpMovBemCalc1.DisplayFormat := sMascaraPlaca;
      rpMovBemLabel7.Text := datetostr(CmpRptCM.ParamValues[0].AsDateTime);
      rpMovBemLabel8.Text := datetostr(CmpRptCM.ParamValues[1].AsDateTime);
      //----------------------------------------------------------------------------------
      sqlMovBem.Open;
      Screen.Cursor := crDefault;
      if cdsMovBem.IsEmpty then
         if CmpRptCM.ParamValues[2].AsInteger <> 0 then
            Raise Exception.Create('Não há movimentações no Periodo para o Grupo especificado!')
         else
            Raise Exception.Create('Não há movimentações no Periodo especificado!');
   except
      On E : Exception Do
      begin
         CMDebugToFile('MOVIMENTO PATRIMONIAL POR BEM: ' + #13 + E.Message);
      end;
   end;
end;

procedure TRptCAFMovPatBem.rpMovBemCalc1Print(Sender: TObject);
begin
   inherited;
   rpMovBemCalc1.Text := cdsMovBem.FieldByName('PLACA').AsString;
end;

procedure TRptCAFMovPatBem.CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
begin
   inherited;
   if Index = 2 then
   begin
      sTipoGrupo := Sender.CdsDisplay.FieldByName('TIPO').AsString;
      sClasseGrupo := trim(Sender.CdsDisplay.FieldByName('CLASSE').AsString);
   end;
   // Sender.CtrlLookup.Text;
end;

end.
