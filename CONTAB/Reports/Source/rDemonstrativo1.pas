unit rDemonstrativo1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport,
  pptypes,uCtrlContab,uCtrlRptDemonstrativo, TXRB;


type
  TrptDemonstrativo1 = class(TFrmCmReport)
    rptDemonstrativo: TppReport;
    ppHeaderBand11: TppHeaderBand;
    ppLabel47: TppLabel;
    ppLblTituloDemo2: TppLabel;
    rptDemonstrativoLabel1: TppLabel;
    rptDemonstrativoLabel2: TppLabel;
    rptDemonstrativoLabel3: TppLabel;
    rptDemonstrativoLabel4: TppLabel;
    rptDemonstrativoLabel5: TppLabel;
    rptDemonstrativoLine1: TppLine;
    rptDemonstrativoLine2: TppLine;
    rptDemonstrativoLabel6: TppLabel;
    rptDemonstrativoLabel7: TppLabel;
    rpEmiteFaturaDBImage1: TppDBImage;
    txtFiltro1: TppLabel;
    bndDetDemo: TppDetailBand;
    dbtxtNomeDemo: TppDBText;
    rptDemonstrativoDBText1: TppDBText;
    rptDemonstrativoDBText2: TppDBText;
    rptDemonstrativoDBText3: TppDBText;
    rptDemonstrativoLine3: TppLine;
    rptDemonstrativoDBText4: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLine36: TppLine;
    LBLSISTEMA: TppLabel;
    rptDemonstrativoLabel8: TppLabel;
    rptDemonstrativoLabel9: TppLabel;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    rptDemonstrativoGroup1: TppGroup;
    rptDemonstrativoGroupHeaderBand1: TppGroupHeaderBand;
    rptDemonstrativoGroupFooterBand1: TppGroupFooterBand;
    pplDemonstrativo: TppBDEPipeline;
    pplDemonstrativoppField1: TppField;
    pplDemonstrativoppField2: TppField;
    pplDemonstrativoppField3: TppField;
    pplDemonstrativoppField4: TppField;
    pplDemonstrativoppField5: TppField;
    pplDemonstrativoppField6: TppField;
    pplDemonstrativoppField7: TppField;
    pplDemonstrativoppField8: TppField;
    pplDemonstrativoppField9: TppField;
    pplDemonstrativoppField10: TppField;
    pplDemonstrativoppField11: TppField;
    pplDemonstrativoppField12: TppField;
    pplDemonstrativoppField13: TppField;
    pplDemonstrativoppField14: TppField;
    pplDemonstrativoppField15: TppField;
    pplDemonstrativoppField16: TppField;
    pplDemonstrativoppField17: TppField;
    pplDemonstrativoppField18: TppField;
    pplDemonstrativoppField19: TppField;
    pplDemonstrativoppField20: TppField;
    dsDemonstrativo: TwwDataSource;
    cdsDemonstrativo: TCMClientDataSet;
    cdsEmpresa: TCMClientDataSet;
    sqlEmpresa: TCMSqlParams;
    sqlDemoAux: TCMSqlParams;
    cdsDemoAux: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    cdsPeriodoAnt: TCMClientDataSet;
    sqlPeriodoAnt: TCMSqlParams;
    cdsPeriodoAtu: TCMClientDataSet;
    sqlPeriodoAtu: TCMSqlParams;
    sqlEmpresaProp: TCMSqlParams;
    cdsEmpresaProp: TCMClientDataSet;
    pplEmpresaProp: TppBDEPipeline;
    dsEmpresaProp: TwwDataSource;
    procedure ppHeaderBand11BeforePrint(Sender: TObject);
    procedure bndDetDemoAfterPrint(Sender: TObject);
    procedure bndDetDemoBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rptDemonstrativoLabel9Print(Sender: TObject);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    CtrlRptDemonstrativo :TCtrlRptDemonstrativo;
    CtrlContab :TCtrlContab;
    sNomeRelat1,sNomeRelat2,sLinhaAcima,sLinhaAbaixo,sNomeDemo,sNomeExerc :string;
    sNomeCCusto,sNomeAtivProj,sPacTipoPerResult,sNomePer,sNomeMoeda :string;
    bIngles,bDiferenca :Boolean;
    iPlano,iPagIni :integer;

  public
    { Public declarations }
  end;

var
  rptDemonstrativo1: TrptDemonstrativo1;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo,  uData, uFuncaoGeral,uCtrlParamIntegra,FSM_FxLib;

{$R *.DFM}

procedure TrptDemonstrativo1.ppHeaderBand11BeforePrint(Sender: TObject);
begin
  inherited;
   if bIngles then begin
      rptDemonstrativoLabel1.caption := 'THIS MONTH CLOSING';
      rptDemonstrativoLabel2.caption := 'LAST YEAR CLOSING';
      rptDemonstrativoLabel3.caption := 'DIFERENCE';
   end else begin
      rptDemonstrativoLabel1.caption := 'SALDO ATUAL';
      rptDemonstrativoLabel2.caption := 'SALDO DO ANO ANTERIOR';
      rptDemonstrativoLabel3.caption := 'DIFERENÇA';
   end;

   if bDiferenca then
      rptDemonstrativoLabel3.visible := true
   else
      rptDemonstrativoLabel3.visible := false;

   if sLinhaAcima = 'N' then begin
      rptDemonstrativoLine1.Visible := False;
   end else begin
      rptDemonstrativoLine1.Visible := True;
      if sLinhaAcima = 'V' then begin
         rptDemonstrativoLine1.Width := 85725;
         rptDemonstrativoLine1.Left  := 111654;
      end else begin
         rptDemonstrativoLine1.Left  := 529;
         if sLinhaAcima = 'T' then begin
            rptDemonstrativoLine1.Width := 106098;
         end else begin
            rptDemonstrativoLine1.Width := 197380;
         end;
      end;
   end;
   //
   if sLinhaAbaixo = 'N' then begin
      rptDemonstrativoLine2.Visible := False;
   end else begin
      rptDemonstrativoLine2.Visible := True;
      if sLinhaAbaixo = 'V' then begin
         rptDemonstrativoLine2.Width := 85725;
         rptDemonstrativoLine2.Left  := 111654;
      end else begin
         rptDemonstrativoLine2.Left  := 0;
         if sLinhaAbaixo = 'T' then begin
            rptDemonstrativoLine2.Width := 106098;
         end else begin
            rptDemonstrativoLine2.Width := 197380;
         end;
      end;
   end;

end;

procedure TrptDemonstrativo1.bndDetDemoAfterPrint(Sender: TObject);
begin
  inherited;
   if cdsDemonstrativo.FieldByName('FLGSALTAPAGINA').asString = 'S' then begin
     //Ver comando para saltar pagina
   end;

end;

procedure TrptDemonstrativo1.bndDetDemoBeforePrint(Sender: TObject);
var sFormatoPos, sFormatoNeg : string;
begin
   inherited;
    if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
    begin
       sPacTipoPerResult := CtrlContab.TipoOpEncer;
    end else
    begin
       sPacTipoPerResult := '';
    end;


   if bDiferenca then
      rptDemonstrativoDBText3.visible := true
   else
      rptDemonstrativoDBText3.visible := false;

   //Quebra a página se necessário
   if cdsDemonstrativo.FieldByName('FLGSALTAPAGINA').asString = 'S' then begin
      bndDetDemo.PageStart;
   end;

   //imprime as contas indentadas
   dbtxtNomeDemo.left := (4000 * StrToIntDef(cdsDemonstrativo.FieldByName('FLGINDENTACAO').asString,0));
  
   CtrlRptDemonstrativo.EspecificaParametros(Self, cdsDemonstrativo.FieldByName('ELETIPOELEM').asString,cdsDemonstrativo.FieldByName('FLGNEGRITO').asString, bndDetDemo);

   //imprime as linhas separadoras de acordo com o tipo
   rptDemonstrativoLine3.Visible := False;
   rptDemonstrativoLine3.Height  := 1852;
   bndDetDemo.Height             := 5292;
   //
   if cdsDemonstrativo.FieldByName('FLGDECIMAIS').asString = 'S' then begin
      sFormatoPos := '#,0.00';
      if cdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
         sFormatoNeg := '-#,0.00';
      end else begin
         sFormatoNeg := '(#,0.00)';
      end;
   end else begin
      sFormatoPos := '#,0';
      if cdsDemonstrativo.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
         sFormatoNeg := '-#,0';
      end else begin
         sFormatoNeg := '(#,0)';
      end;
   end;

   rptDemonstrativoDBText1.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   rptDemonstrativoDBText2.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   rptDemonstrativoDBText3.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;

   if cdsDemonstrativo.FieldByName('FLGTIPOLINHA').asString = 'X' then begin
      bndDetDemo.visible := false;
   end else begin
      bndDetDemo.visible := true;
   end;

   if cdsDemonstrativo.FieldByName('FLGTIPOLINHA').asString = 'N' then begin
      bndDetDemo.Height := 4600;
   end;

   if cdsDemonstrativo.FieldByName('FLGTIPOLINHA').asString = 'E' then begin
      bndDetDemo.Height := 7408;
   end;

   if cdsDemonstrativo.FieldByName('FLGTIPOLINHA').asString = 'F' then begin
      bndDetDemo.Height               := 7408;
      rptDemonstrativoLine3.Visible   := True;
      rptDemonstrativoLine3.Style     := lsSingle;
      rptDemonstrativoLine3.Weight    := 1;
   end;

   if cdsDemonstrativo.FieldByName('FLGTIPOLINHA').asString = 'D' then begin
      bndDetDemo.Height             := 7408;
      rptDemonstrativoLine3.Visible := True;
      rptDemonstrativoLine3.Style   := lsDouble;
      rptDemonstrativoLine3.Weight  := 1;
   end;

   if cdsDemonstrativo.FieldByName('FLGTIPOLINHA').asString = 'G' then begin
      bndDetDemo.Height             := 7408;
      rptDemonstrativoLine3.Visible := True;
      rptDemonstrativoLine3.Style   := lsSingle;
      rptDemonstrativoLine3.Weight  := 2;
   end;

   if rptDemonstrativoLine3.Visible then begin
      if copy(cdsDemonstrativo.FieldByName('FLGTRACO').asString,2,1) = 'A' then begin
         rptDemonstrativoLine3.Top := 265 ;
      end else begin
         rptDemonstrativoLine3.Top := 4600 ;
      end;

      if copy(cdsDemonstrativo.FieldByName('FLGTRACO').asString,1,1) = 'V' then begin
         rptDemonstrativoLine3.Width := 106098;
         rptDemonstrativoLine3.Left  := 91281;
      end else begin
         if copy(cdsDemonstrativo.FieldByName('FLGTRACO').asString,1,1) = 'T' then begin
            rptDemonstrativoLine3.Visible := False;
            if cdsDemonstrativo.FieldByName('FLGNEGRITO').asString = 'S' then begin
               dbtxtNomeDemo.Font.Style :=[fsBold,fsUnderline];
            end else begin
               dbtxtNomeDemo.Font.Style :=[fsUnderline];
            end;
         end else begin
            rptDemonstrativoLine3.Left  := 529;
            rptDemonstrativoLine3.Width := 197380;
         end;
      end;

   end;

end;

procedure TrptDemonstrativo1.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[6].SpinEditSettings.Value := 1;

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

   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text:='SELECT  '+
                                                    '  IDDEMONSTRATIVO,   '+
                                                    '  IDPESSOA,          '+
                                                    '  DEMDESCDEMONSTRAT, '+
                                                    '  DEMNATUREZA '+
                                                    'FROM ' +
                                                    '  DEMONSTRATIVO ' +
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY ' +
                                                    '  DEMDESCDEMONSTRAT ';

   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';


   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

  CmpRptCM.ParamValues[5].LookupSettings.SQL.Text:= 'SELECT '+
                                                    '  MOECODIGO, '+
                                                    '  MOEDESC,   '+
                                                    '  MOESIGLA   '+
                                                    'FROM '+
                                                    '  MOEDA '+
                                                    'WHERE ' +
                                                    '  MOEINATIVO = ''A'' '+
                                                    'ORDER BY MOEDESC ';
end;



procedure TrptDemonstrativo1.CrmRptCMBeforePrint(Sender: TObject);
begin
  if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
  begin
     sPacTipoPerResult := CtrlContab.TipoOpEncer;
  end else
  begin
     sPacTipoPerResult := '';
  end;

   iPagIni    := CmpRptCM.ParamValues[6].AsInteger;
   bIngles    := CmpRptCM.ParamValues[12].AsBoolean;
   bDiferenca := CmpRptCM.ParamValues[11].AsBoolean;
   iPlano     := Modulo.iPlano;

   sqlEmpresaProp.Prepare;
   sqlEmpresaProp.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlEmpresaProp.Open;

   //===== pega dados do exercicio anterior para testar cotacao da moeda ========
   sqlPeriodoAnt.Prepare;
   sqlPeriodoAnt.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlPeriodoAnt.ParamByName('PEREXERCICIO').asInteger := (StrToInt(CmpRptCM.ParamValues[0].AsString)-1);
   sqlPeriodoAnt.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);
   sqlPeriodoAnt.Open;
   //=====================================================================

   //===================== pega nome do periodo ==========================
   sqlPeriodoAtu.Prepare;
   sqlPeriodoAtu.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlPeriodoAtu.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
   sqlPeriodoAtu.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);
   sqlPeriodoAtu.Open;
   //=====================================================================

   //======= abre abre empresa para pegar os nomes dos relatorios =======
   sqlEmpresa.Prepare;
   sqlEmpresa.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlEmpresa.Open;
   sNomeRelat1 := cdsEmpresa.FieldByName('NOMERELAT1').AsString;
   sNomeRelat2 := cdsEmpresa.FieldByName('NOMERELAT2').AsString;
   //=====================================================================


   //==== pega dados do demonstrativo, salto de pagina,titulos, etc..=====
   sqlDemoAux.Prepare;
   sqlDemoAux.ParamByName('IDDEMO').asInteger:=StrToInt(CmpRptCM.ParamValues[2].AsString);
   sqlDemoAux.Open;
   sNomeDemo := cdsDemoAux.FieldByName('DEMDESCDEMONSTRAT').asString;
   //=====================================================================

   //Imprime os títulos
   if cdsDemoAux.FieldByName('FLGTRACOACIMA').IsNull then begin
      sLinhaAcima := 'C';
   end else begin
      sLinhaAcima := cdsDemoAux.FieldByName('FLGTRACOACIMA').AsString;
   end;
   if cdsDemoAux.FieldByName('FLGTRACOABAIXO').IsNull then begin
      sLinhaAbaixo := 'C';
   end else begin
      sLinhaAbaixo := cdsDemoAux.FieldByName('FLGTRACOABAIXO').AsString;
   end;

   //============== Monta os titulos ==============
   ppLabel47.Caption              := sNomeRelat1;
   rptDemonstrativoLabel4.Caption := sNomeRelat2;
   rptDemonstrativoLabel5.Caption := sNomeDemo;


   if CmpRptCM.ParamValues[3].AsString <> '' then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT CODEXTERNO, NOME           ');
      sqlTitulos.SQL.Add('FROM  CENTCUST                        ');
      sqlTitulos.SQL.Add('WHERE                                 ');
      sqlTitulos.SQL.Add('   (IDEMPRESA      = :IDEMPRESA)  AND    ');
      sqlTitulos.SQL.Add('   (CODEXTERNO = :CODCENTROCUSTO) ');
      sqlTitulos.Prepare;
      sqlTitulos.ParamByName('IDEMPRESA').asFloat       := CrmRptCM.IdEmpresa;
      sqlTitulos.ParamByName('CODCENTROCUSTO').asString := CmpRptCM.ParamValues[3].AsString;
      sqlTitulos.Open;

      sNomeCCusto := CmpRptCM.ParamValues[3].AsString + ' - ' + cdsTitulos.FieldByName('NOME').asString;
   end else
   begin
      sNomeCCusto := '<Todos>';
   end;

   if CmpRptCM.ParamValues[4].AsString <> '' then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT UNIDNEGOC, NOME, UNECODIGO '+
                         'FROM  UNIDNEGOCIO '+
                         'WHERE '+
                         '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                         '   AND (UNIDNEGOC = '+CmpRptCM.ParamValues[4].AsString+')'+
                         'ORDER BY UNIDNEGOC');
      sqlTitulos.Open;
      sNomeAtivProj := cdsTitulos.FieldByName('NOME').asString;
   end else
   begin
      sNomeAtivProj := '<Todas>';
   end;

   if CmpRptCM.ParamValues[13].AsBoolean then begin
      txtFiltro1.Caption := 'Centro de Custo: ' + sNomeCCusto  + '    Ativ.Proj.: ' + sNomeAtivProj;
   end else begin
      txtFiltro1.Caption := '';
   end;

   if CmpRptCM.ParamValues[12].AsBoolean then begin
      sNomePer :=  cdsPeriodoAtu.FieldByName('PERNOMEOUTLING').AsString;
      ppLblTituloDemo2.Caption    := cdsPeriodoAtu.FieldByName('PERNOMEOUTLING').AsString + '/'+CmpRptCM.ParamValues[0].AsString;
   end else begin
      sNomePer := cdsPeriodoAtu.FieldByName('PERNOME').AsString;
      ppLblTituloDemo2.Caption    := cdsPeriodoAtu.FieldByName('PERNOME').AsString + '/'+CmpRptCM.ParamValues[0].AsString;
   end;

   if trim(CmpRptCM.ParamValues[5].AsString) = '' then begin
      rptDemonstrativoLabel6.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  '+ Modulo.sSiglaMoedaCorr;
   end else begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT MOECODIGO, MOESIGLA   '+
                         'FROM  MOEDA '+
                         'WHERE ' +
                         '     MOEINATIVO = ''A'' '+
                         'AND  (MOECODIGO = ' + CmpRptCM.ParamValues[5].AsString +') '+
                         'ORDER BY MOECODIGO ');
      sqlTitulos.Open;
      sNomeMoeda := cdsTitulos.FieldByName('MOESIGLA').AsString;
      rptDemonstrativoLabel6.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  '+cdsTitulos.FieldByName('MOESIGLA').AsString;
   end;

   rptDemonstrativoLabel7.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL2').AsString;

   if CtrlRptDemonstrativo.ProcessaDemoModelo1(cdsDemoAux.FieldByName('IDDEMONSTRATIVO').asInteger,
                                               iPlano,
                                               StrToInt(CmpRptCM.ParamValues[0].AsString),
                                               StrToInt(CmpRptCM.ParamValues[1].AsString),
                                               sPacTipoPerResult,
                                               cdsDemoAux.FieldByName('DEMNATUREZA').AsString,
                                               CmpRptCM.ParamValues[3].AsString,
                                               CmpRptCM.ParamValues[15].AsString,
                                               CmpRptCM.ParamValues[4].AsString,
                                               CmpRptCM.ParamValues[5].AsString,
                                               cdsPeriodoAtu.FieldByName('PERDATFIM').AsString,
                                               cdsPeriodoAnt.FieldByName('PERDATFIM').AsString,
                                               sNomePer,
                                               sNomeDemo,
                                               sNomeMoeda,
                                               CrmRptCM.IdEmpresa,
                                               CmpRptCM.ParamValues[9].AsBoolean,
                                               CmpRptCM.ParamValues[8].AsBoolean,
                                               CmpRptCM.ParamValues[7].AsBoolean,
                                               CmpRptCM.ParamValues[10].AsBoolean,
                                               CmpRptCM.ParamValues[14].AsBoolean) then
   begin
      inherited;
   end;

end;

procedure TrptDemonstrativo1.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptDemonstrativo := TCtrlRptDemonstrativo.Create;
  CtrlRptDemonstrativo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);


  CtrlRptDemonstrativo.cdsDemonstrativo := cdsDemonstrativo;
end;

procedure TrptDemonstrativo1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptDemonstrativo.free;
  CtrlContab.free;
end;

procedure TrptDemonstrativo1.rptDemonstrativoLabel9Print(Sender: TObject);
begin
  inherited;
 rptDemonstrativoLabel9.Caption := IntToStr((iPagIni + StrToInt(ppCalc21.text)) - 1);
end;

procedure TrptDemonstrativo1.CmpRptCMParamControlEnter(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      1: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter   := 'PEREXERCICIO = '+IntToStr(StrToIntDef(sNomeExerc,0));
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
   end;

end;

procedure TrptDemonstrativo1.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

end.
