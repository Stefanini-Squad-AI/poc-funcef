unit rConfCotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RRelatWeb, uCmRptManager, TXComp, CmParamReport, Db, DBTables, 
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  StdCtrls, ADODB, DBClient, Provider, uSistema, ppModule, daDataModule,
  uCtrlGeral,uCtrlParamIntegra, FCmReport, uCmSqlParams,
  uCMClientDataSet;

type
  TRPTConfCotas = class(TFrmCmReport)
    dsConfCotas: TwwDataSource;
    pplConfCotas: TppBDEPipeline;
    pplConfCotasppField1: TppField;
    pplConfCotasppField2: TppField;
    pplConfCotasppField3: TppField;
    pplConfCotasppField4: TppField;
    pplConfCotasppField5: TppField;
    rptConfCotas: TppReport;
    ppHeaderBand7: TppHeaderBand;
    pplblTituloConfCotas: TppLabel;
    ppLine22: TppLine;
    ppLabel42: TppLabel;
    ppLabel45: TppLabel;
    ppLine23: TppLine;
    pplblTituloConfCotas2: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText50: TppDBText;
    ppDBText62: TppDBText;
    dbtxtAP: TppDBText;
    ppDBText68: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLabel55: TppLabel;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    cdsConfCotas: TCMClientDataSet;
    sqlConfCotas: TCMSqlParams;
    cdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
     iExercicio       : Integer;

    { Private declarations }

    CtrlGeral : TCtrlGeral;


  public
    { Public declarations }
  end;

var
  RPTConfCotas: TRPTConfCotas;
  sMascaraUnidNegoc : string;

implementation

uses uDatabase, DBaseDados;

{$R *.DFM}

procedure TRPTConfCotas.ppDetailBand6BeforePrint(Sender: TObject);
begin
  inherited;

   sMascaraUnidNegoc := CtrlGeral.CalcMascaraPorGrau(ParamIntegra.MascaraUnidNegoc,
                CtrlGeral.CalcGrau(ParamIntegra.MascaraUnidNegoc, cdsConfCotas.FieldByName('UNECODIGO').asString));

   dbtxtAP.DisplayFormat := sMascaraUnidNegoc + ';0; ';
  // bImprimeAP := true;

end;

procedure TRPTConfCotas.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:='SELECT '+
                                                    '    (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ' +
                                                    '   PERNUMERO, '+
                                                    '   PERNOME, '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY '+
                                                    '   PEREXERCICIO, '+
                                                    '   PERNUMERO ';


end;

procedure TRPTConfCotas.CrmRptCMBeforePrint(Sender: TObject);
var sTitulo : string;
    iGrau,iNumDig : Integer;
begin
   inherited;
   sTitulo := 'Conferência de Cotas por Atividade/Projeto - ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger) + '/' + IntToStr(CmpRptCM.ParamValues[0].AsInteger);

   //Imprime os títulos
   pplblTituloConfCotas.caption := sTitulo;

   sTitulo := '';
   if CmpRptCM.ParamValues[2].AsInteger = 0 then begin
      sTitulo := sTitulo +  '     Valores do Período';
   end else begin
      sTitulo := sTitulo +  '     Acumulados até o Período';
   end;

   iNumDig := 0;
   if CmpRptCM.ParamValues[3].AsBoolean = True then begin
      iGrau   := CtrlGeral.CalcGrauMax(ParamIntegra.MascaraUnidNegoc);
      iNumDig := CtrlGeral.CalcNumEleGrau(ParamIntegra.MascaraUnidNegoc,(iGrau-1));
   end;

   pplblTituloConfCotas2.caption := sTitulo;

   sqlAux.SQL.Clear;
   sqlAux.SQL.Add('SELECT ((SUM(DECODE(R.VLRRATEIO, NULL, 0, R.VLRRATEIO))/T.TOT)*100) AS PERC,');
   sqlAux.SQL.Add('    SUM(DECODE(R.VLRRATEIO, NULL, 0, R.VLRRATEIO)) AS VALORCOTA ');
   sqlAux.SQL.Add('FROM RATEIOATIVPROJ R, UNIDNEGOCIO U,                             ');
   sqlAux.SQL.Add('   (SELECT SUM(DECODE(VLRRATEIO, NULL, 0, VLRRATEIO)) AS TOT                                  ');
   sqlAux.SQL.Add('      FROM RATEIOATIVPROJ                                         ');
   sqlAux.SQL.Add('      WHERE                                                       ');
   sqlAux.SQL.Add('        (PEREXERCICIO =:PEREXERCICIO) AND                         ');
   if CmpRptCM.ParamValues[1].AsString = '' then begin
      sqlAux.SQL.Add('     (PERNUMERO IS NULL) AND                                   ');
   end else begin
      if CmpRptCM.ParamValues[2].asInteger = 0 then begin
         sqlAux.SQL.Add('  (PERNUMERO =:PERNUMERO) AND                               ');
      end else begin
         sqlAux.SQL.Add('  ((PERNUMERO <=:PERNUMERO) OR (PERNUMERO IS NULL)) AND     ');
      end;
   end;
   sqlAux.SQL.Add('        (IDPESSOA     =:IDPESSOA)) T                              ');
   sqlAux.SQL.Add('WHERE                                                             ');
   sqlAux.SQL.Add('   (R.PEREXERCICIO =:PEREXERCICIO) AND                            ');
   if CmpRptCM.ParamValues[1].AsString = '' then begin
      sqlAux.SQL.Add('   (R.PERNUMERO IS NULL) AND                                   ');
   end else begin
      if CmpRptCM.ParamValues[2].asInteger = 0 then begin
         sqlAux.SQL.Add('   (R.PERNUMERO =:PERNUMERO) AND                               ');
      end else begin
         sqlAux.SQL.Add('   ((R.PERNUMERO <=:PERNUMERO) OR (R.PERNUMERO IS NULL)) AND   ');
      end;
   end;
   sqlAux.SQL.Add('   (RTRIM(U.UNECODIGO) LIKE :UNECODIGO || ''%'') AND ');
   sqlAux.SQL.Add('   (R.IDPESSOA     =:IDPESSOA) AND                                ');
   sqlAux.SQL.Add('   (R.IDPESSOA     = U.IDPESSOA) AND                              ');
   sqlAux.SQL.Add('   (R.UNIDNEGOC    = U.UNIDNEGOC)                                 ');
   sqlAux.SQL.Add('GROUP BY T.TOT                 ');

   if not sqlAux.Prepared then sqlAux.Prepare;

   //Faz a query
   with sqlConfCotas do begin
      SQL.Clear;
      SQL.Add('SELECT UNIDNEGOC, UNECODIGO, NOME, (0) as VALORCOTA, (0) as PERC ');
      SQL.Add('FROM UNIDNEGOCIO ');
      SQL.Add('WHERE (IDPESSOA=:IDPESSOA) ');

      if CmpRptCM.ParamValues[3].asBoolean = True then
         SQL.Add('  AND (LENGTH(UNECODIGO) = '+IntToStr(iNumDig)+')          ');
      SQL.Add('ORDER BY UNECODIGO ');

      Prepare;
      ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
      Open;

      cdsConfCotas.First;

      While not cdsConfCotas.Eof do begin
         sqlAux.ParamByName('UNECODIGO').AsString := trim(cdsConfCotas.FieldByName('UNECODIGO').AsString);
         sqlAux.ParamByName('PEREXERCICIO').asInteger := CmpRptCM.ParamValues[0].asInteger;
         sqlAux.ParamByName('PERNUMERO').asInteger := CmpRptCM.ParamValues[1].asInteger;
         sqlAux.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
         sqlAux.Open;
         //
         cdsConfCotas.Edit;
         cdsConfCotas.FieldByName('VALORCOTA').AsFloat := cdsAux.FieldByName('VALORCOTA').AsFloat;
         cdsConfCotas.FieldByName('PERC').AsFloat      := cdsAux.FieldByName('PERC').AsFloat;
         cdsConfCotas.Post;
         cdsConfCotas.Next;
      end;
      cdsConfCotas.First;
   end;

end;

procedure TRPTConfCotas.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGeral := TCtrlGeral.Create;
  CtrlGeral.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP',tiCAP);

end;

procedure TRPTConfCotas.CmpRptCMParamControlEnter(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
   case Index of
      1: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter := 'PEREXERCICIO = '+IntToStr(iExercicio);
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
   end;

end;

procedure TRPTConfCotas.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
   case Index of
      0: iExercicio:= StrToInt(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

end.
