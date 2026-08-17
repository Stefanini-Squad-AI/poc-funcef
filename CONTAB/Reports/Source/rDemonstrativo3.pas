unit rDemonstrativo3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport,
  pptypes,uCtrlContab,uCtrlRptDemonstrativo, TXRB;

type
  TrptDemonstrativo3 = class(TFrmCmReport)
    rptDemonstrativo3: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel64: TppLabel;
    ppLine30: TppLine;
    ppLine31: TppLine;
    rptDemonstrativo3Label1: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    rptDemonstrativo3Label2: TppLabel;
    rptDemonstrativo3DBImage1: TppDBImage;
    txtFiltro3: TppLabel;
    ppDetailBand4: TppDetailBand;
    dbtxtNomeDemo3: TppDBText;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppLine32: TppLine;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    rptDemonstrativo3DBText1: TppDBText;
    ppFooterBand13: TppFooterBand;
    lblsistema: TppLabel;
    ppLine34: TppLine;
    rptDemonstrativo3Label3: TppLabel;
    rptDemonstrativo3Label4: TppLabel;
    ppCalc26: TppSystemVariable;
    rptDemonstrativo3Calc1: TppSystemVariable;
    rptDemonstrativo3Group1: TppGroup;
    rptDemonstrativo3GroupHeaderBand1: TppGroupHeaderBand;
    rptDemonstrativo3GroupFooterBand1: TppGroupFooterBand;
    pplDemonstrativo3: TppBDEPipeline;
    pplDemonstrativo3ppField1: TppField;
    pplDemonstrativo3ppField2: TppField;
    pplDemonstrativo3ppField3: TppField;
    pplDemonstrativo3ppField4: TppField;
    pplDemonstrativo3ppField5: TppField;
    pplDemonstrativo3ppField6: TppField;
    pplDemonstrativo3ppField7: TppField;
    pplDemonstrativo3ppField8: TppField;
    pplDemonstrativo3ppField9: TppField;
    pplDemonstrativo3ppField10: TppField;
    pplDemonstrativo3ppField11: TppField;
    pplDemonstrativo3ppField12: TppField;
    pplDemonstrativo3ppField13: TppField;
    pplDemonstrativo3ppField14: TppField;
    pplDemonstrativo3ppField15: TppField;
    pplDemonstrativo3ppField16: TppField;
    pplDemonstrativo3ppField17: TppField;
    pplDemonstrativo3ppField18: TppField;
    pplDemonstrativo3ppField19: TppField;
    pplDemonstrativo3ppField20: TppField;
    pplDemonstrativo3ppField21: TppField;
    pplDemonstrativo3ppField22: TppField;
    pplDemonstrativo3ppField23: TppField;
    pplDemonstrativo3ppField24: TppField;
    pplDemonstrativo3ppField25: TppField;
    pplDemonstrativo3ppField26: TppField;
    pplDemonstrativo3ppField27: TppField;
    pplDemonstrativo3ppField28: TppField;
    pplDemonstrativo3ppField29: TppField;
    pplDemonstrativo3ppField30: TppField;
    pplDemonstrativo3ppField31: TppField;
    pplDemonstrativo3ppField32: TppField;
    pplDemonstrativo3ppField33: TppField;
    pplDemonstrativo3ppField34: TppField;
    dsDemonstrativo3: TwwDataSource;
    cdsDemonstrativo3: TCMClientDataSet;
    cdsEmpresa: TCMClientDataSet;
    sqlEmpresa: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    sqlDemoAux: TCMSqlParams;
    cdsDemoAux: TCMClientDataSet;
    cdsPerAux: TCMClientDataSet;
    sqlPerAux: TCMSqlParams;
    cdsPerAux2: TCMClientDataSet;
    sqlPerAux2: TCMSqlParams;
    sqlEmpresaProp: TCMSqlParams;
    cdsEmpresaProp: TCMClientDataSet;
    pplEmpresaProp: TppBDEPipeline;
    dsEmpresaProp: TwwDataSource;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppHeaderBand13BeforePrint(Sender: TObject);
    procedure ppDetailBand4AfterPrint(Sender: TObject);
    procedure ppDetailBand4BeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rptDemonstrativo3Label3Print(Sender: TObject);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    CtrlRptDemonstrativo :TCtrlRptDemonstrativo;
    CtrlContab :TCtrlContab;
    sNomeLingua1,sNomeLingua2,sDataIni,sNomeExerc :string;
    sNomeRelat1,sNomeRelat2,sLinhaAcima,sLinhaAbaixo,sNomeDemo:string;
    sNomeCCusto,sNomeAtivProj,sPacTipoPerResult,sNomePer1,sNomePer2 :string;
    bIngles :Boolean;
    iPlano,iPagIni :integer;
  public
    { Public declarations }
  end;

var
  rptDemonstrativo3: TrptDemonstrativo3;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo,  uData, uFuncaoGeral;

{$R *.DFM}

procedure TrptDemonstrativo3.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[8].SpinEditSettings.Value := 1;

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

   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text:='SELECT '+
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


   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text:='SELECT  '+
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

   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';


   CmpRptCM.ParamValues[5].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

  CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:= 'SELECT '+
                                                    '  MOECODIGO, '+
                                                    '  MOEDESC,   '+
                                                    '  MOESIGLA   '+
                                                    'FROM '+
                                                    '  MOEDA '+
                                                    'WHERE ' +
                                                    '  MOEINATIVO = ''A'' '+
                                                    'ORDER BY MOEDESC ';

  CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:= 'SELECT '+
                                                    '  MOECODIGO, '+
                                                    '  MOEDESC,   '+
                                                    '  MOESIGLA   '+
                                                    'FROM '+
                                                    '  MOEDA '+
                                                    'WHERE ' +
                                                    '  MOEINATIVO = ''A'' '+
                                                    'ORDER BY MOEDESC ';

end;

procedure TrptDemonstrativo3.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptDemonstrativo := TCtrlRptDemonstrativo.Create;
  CtrlRptDemonstrativo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);


  CtrlRptDemonstrativo.cdsDemonstrativo := cdsDemonstrativo3;

end;

procedure TrptDemonstrativo3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptDemonstrativo.Free;
  CtrlContab.free;

end;

procedure TrptDemonstrativo3.ppHeaderBand13BeforePrint(
  Sender: TObject);
begin
  inherited;
   if bIngles then begin
      ppLabel66.caption  := 'C U R R E N T   M O N T H';
      ppLabel59.caption  := 'BUDGET';
      ppLabel60.caption  := 'ACTUAL';
      ppLabel61.caption  := 'LAST YEAR';
      ppLabel70.caption  := 'Y E A R   T O   D A T E';
      ppLabel67.caption  := 'BUDGET';
      ppLabel68.caption  := 'ACTUAL';
      ppLabel69.caption  := 'LAST YEAR';
   end else begin
      ppLabel66.caption  := 'P E R Í O D O   C O R R E N T E';
      ppLabel59.caption  := 'ORÇADO';
      ppLabel60.caption  := 'REALIZADO';
      ppLabel61.caption  := 'EXER.ANTERIOR';
      ppLabel70.caption  := 'A C U M U L A D O   N O   E X E R C Í C I O';
      ppLabel67.caption  := 'ORÇADO';
      ppLabel68.caption  := 'REALIZADO';
      ppLabel69.caption  := 'EXER.ANTERIOR';
   end;

   if Modulo.sLinhaAcima = 'N' then begin
      ppLine30.Visible := False;
   end else begin
      ppLine30.Visible := True;
      if Modulo.sLinhaAcima = 'V' then begin
         ppLine30.Width := 166952;
         ppLine30.Left  := 104511;
      end else begin
         ppLine30.Left  := 0;
         if Modulo.sLinhaAcima = 'T' then begin
            ppLine30.Width := 102923;
         end else begin
            ppLine30.Width := 271463;
         end;
      end;
   end;
   //
   if Modulo.sLinhaAbaixo = 'N' then begin
      ppLine31.Visible := False;
   end else begin
      ppLine31.Visible := True;
      if Modulo.sLinhaAbaixo = 'V' then begin
         ppLine31.Width := 166952;
         ppLine31.Left  := 104511;
      end else begin
         ppLine31.Left  := 0;
         if Modulo.sLinhaAbaixo = 'T' then begin
            ppLine31.Width := 102923;
         end else begin
            ppLine31.Width := 271463;
         end;
      end;
   end;

end;

procedure TrptDemonstrativo3.ppDetailBand4AfterPrint(Sender: TObject);
begin
  inherited;
  if cdsDemonstrativo3.FieldByName('FLGSALTAPAGINA').asString = 'S' then begin
     //Ver comando para saltar pagina
  end;

end;

procedure TrptDemonstrativo3.ppDetailBand4BeforePrint(
  Sender: TObject);
var sFormatoPos, sFormatoNeg, sForPerPos, sForPerNeg : string;
begin
   inherited;

   //imprime as contas indentadas
   if cdsDemonstrativo3.FieldByName('FLGINDENTACAO').asString <> '' then
      dbtxtNomeDemo3.left := (4000 * StrToInt(cdsDemonstrativo3.FieldByName('FLGINDENTACAO').asString));

   //imprime as linhas separadoras de acordo com o tipo
   ppLine32.Visible     := False;
   ppLine32.Height      := 1852;
   ppDetailBand4.Height := 4600;
 
   CtrlRptDemonstrativo.EspecificaParametros(Self,cdsDemonstrativo3.FieldByName('ELETIPOELEM').asString,cdsDemonstrativo3.FieldByName('FLGNEGRITO').asString,ppDetailBand4);

   if cdsDemonstrativo3.FieldByName('FLGDECIMAIS').asString = 'S' then begin
      sFormatoPos := '#,0.00';
      if cdsDemonstrativo3.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
         sFormatoNeg := '-#,0.00';
      end else begin
         sFormatoNeg := '(#,0.00)';
      end;
   end else begin
      sFormatoPos := '#,0';
      if cdsDemonstrativo3.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
         sFormatoNeg := '-#,0';
      end else begin
         sFormatoNeg := '(#,0)';
      end;
   end;


   sForPerPos := '#,0.00';
   if cdsDemonstrativo3.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
      sForPerNeg := '-#,0.00';
   end else begin
      sForPerNeg := '(#,0.00)';
   end;


   ppDBText11.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppDBText14.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppDBText13.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppDBText15.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppDBText16.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppDBText17.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;

   //Percentuais
   ppDBText22.DisplayFormat := sForPerPos + ';' + sForPerNeg;
   ppDBText23.DisplayFormat := sForPerPos + ';' + sForPerNeg;
   ppDBText24.DisplayFormat := sForPerPos + ';' + sForPerNeg;

   if cdsDemonstrativo3.FieldByName('FLGTIPOLINHA').asString = 'X' then begin
      ppDetailBand4.visible := false;
   end else begin
      ppDetailBand4.visible := true;
   end;

   if cdsDemonstrativo3.FieldByName('FLGTIPOLINHA').asString = 'N' then begin
      ppDetailBand4.Height := 4600;
   end;

   if cdsDemonstrativo3.FieldByName('FLGTIPOLINHA').asString = 'E' then begin
      ppDetailBand4.Height := 7408;
   end;

   if cdsDemonstrativo3.FieldByName('FLGTIPOLINHA').asString = 'F' then begin
      ppDetailBand4.Height := 7408;
      ppLine32.Visible     := True;
      ppLine32.Style       := lsSingle;
      ppLine32.Weight      := 1;
   end;

   if cdsDemonstrativo3.FieldByName('FLGTIPOLINHA').asString = 'D' then begin
      ppDetailBand4.Height := 7408;
      ppLine32.Visible     := True;
      ppLine32.Style       := lsDouble;
      ppLine32.Weight      := 1;
   end;

   if cdsDemonstrativo3.FieldByName('FLGTIPOLINHA').asString = 'G' then begin
      ppDetailBand4.Height := 7408;
      ppLine32.Visible     := True;
      ppLine32.Style       := lsSingle;
      ppLine32.Weight      := 2;
   end;

   if ppLine32.Visible then begin
      if copy(cdsDemonstrativo3.FieldByName('FLGTRACO').asString,2,1) = 'A' then begin
         ppLine32.Top := 265 ;
      end else begin
         ppLine32.Top := 4600 ;
      end;

      if copy(cdsDemonstrativo3.FieldByName('FLGTRACO').asString,1,1) = 'V' then begin
         ppLine32.Width := 166952;
         ppLine32.Left  := 104511;
      end else begin
         if copy(cdsDemonstrativo3.FieldByName('FLGTRACO').asString,1,1) = 'T' then begin
            ppLine32.Visible := False;
            if cdsDemonstrativo3.FieldByName('FLGNEGRITO').asString = 'S' then begin
               dbtxtNomeDemo3.Font.Style :=[fsBold,fsUnderline];
            end else begin
               dbtxtNomeDemo3.Font.Style :=[fsUnderline];
            end;
         end else begin
            ppLine32.Left  := 0;
            ppLine32.Width := 271463;
         end;
      end;
   end;

end;

procedure TrptDemonstrativo3.CrmRptCMBeforePrint(Sender: TObject);
begin
    if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
    begin
       sPacTipoPerResult := CtrlContab.TipoOpEncer;
    end else
    begin
       sPacTipoPerResult := '';
    end;

   iPagIni := CmpRptCM.ParamValues[8].AsInteger;
   bIngles := CmpRptCM.ParamValues[9].AsBoolean;
   iPlano  := Modulo.iPlano;

   //======= abre abre empresa para pegar os nomes dos relatorios =======
   sqlEmpresa.Prepare;
   sqlEmpresa.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlEmpresa.Open;
   sNomeRelat1 := cdsEmpresa.FieldByName('NOMERELAT1').AsString;
   sNomeRelat2 := cdsEmpresa.FieldByName('NOMERELAT2').AsString;
   //=====================================================================

   //==== pega dados do demonstrativo, salto de pagina,titulos, etc..=====
   sqlDemoAux.Prepare;
   sqlDemoAux.ParamByName('IDDEMO').asInteger:=StrToInt(CmpRptCM.ParamValues[3].AsString);
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

   sqlEmpresaProp.Prepare;
   sqlEmpresaProp.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlEmpresaProp.Open;
   //===== pega nomes em outra lingua ========
   sqlPerAux.Prepare;
   sqlPerAux.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlPerAux.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
   sqlPerAux.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);
   sqlPerAux.Open;
   sNomeLingua1 := cdsPerAux.FieldByName('PERNOMEOUTLING').asString;
   sNomePer1    := cdsPerAux.FieldByName('PERNOME').asString;

   sqlPerAux.Prepare;
   sqlPerAux.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlPerAux.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
   sqlPerAux.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[2].AsString);
   sqlPerAux.Open;
   sNomeLingua2 := cdsPerAux.FieldByName('PERNOMEOUTLING').asString;
   sNomePer2    := cdsPerAux.FieldByName('PERNOME').asString;
   //=====================================================================

   //===== pega a data inicial do exercicio atual ========
   sqlPerAux2.Prepare;
   sqlPerAux2.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlPerAux2.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
   sqlPerAux2.Open;
   sDataIni := DateToStr((cdsPerAux2.FieldByName('PERDATINI').asDateTime-1));


   ppLabel57.Caption := sNomeRelat1;
   ppLabel62.Caption := sNomeRelat2;
   ppLabel64.Caption := sNomeDemo;

   if CmpRptCM.ParamValues[4].AsString <> '' then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME '+
                         'FROM  CENTCUST '+
                         'WHERE '+
                         '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                         'ORDER BY CODCENTROCUSTO');
      sqlTitulos.Open;
      sNomeCCusto := CmpRptCM.ParamValues[4].AsString + ' - ' + cdsTitulos.FieldByName('NOME').asString;
   end else
   begin
      sNomeCCusto := '<Todos>';
   end;

   if CmpRptCM.ParamValues[5].AsString <> '' then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT UNIDNEGOC, NOME, UNECODIGO '+
                         'FROM  UNIDNEGOCIO '+
                         'WHERE '+
                         '     (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                         ' AND (UNIDNEGOC = '+CmpRptCM.ParamValues[5].AsString+')'+
                         'ORDER BY UNIDNEGOC');
      sqlTitulos.Open;
      sNomeAtivProj := cdsTitulos.FieldByName('NOME').asString;
   end else
   begin
      sNomeAtivProj := '<Todas>';
   end;


   if CmpRptCM.ParamValues[10].AsBoolean then begin
      txtFiltro3.Caption := 'Centro de Custo: ' + sNomeCCusto  + '    Ativ.Proj.: ' + sNomeAtivProj;
   end else begin
      txtFiltro3.Caption := '';
   end;

   if CmpRptCM.ParamValues[9].AsBoolean then begin
      if CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString then begin
         ppLabel58.Caption := sNomeLingua1 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end else begin
         ppLabel58.Caption := sNomeLingua1 + '/'+CmpRptCM.ParamValues[0].AsString + ' to ' +
                                                 sNomeLingua2 + '/'+CmpRptCM.ParamValues[0].AsString;
      end;
   end else begin
      if CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString then begin
         ppLabel58.Caption := sNomePer1 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end else begin
         ppLabel58.Caption := sNomePer1 + '/'+ CmpRptCM.ParamValues[0].AsString + ' a ' +
                                            sNomePer2 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end;
   end;

   if trim(CmpRptCM.ParamValues[6].AsString) = '' then begin
      rptDemonstrativo3Label1.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  ' + Modulo.sSiglaMoedaCorr;
   end else begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT MOECODIGO, MOESIGLA   '+
                         'FROM  MOEDA '+
                         'WHERE ' +
                         '     MOEINATIVO = ''A'' '+
                         'AND  (MOECODIGO = ' + CmpRptCM.ParamValues[6].AsString +') '+
                         'ORDER BY MOECODIGO ');
      sqlTitulos.Open;
      rptDemonstrativo3Label1.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  ' + cdsTitulos.FieldByName('MOESIGLA').AsString;
   end;

   if trim(CmpRptCM.ParamValues[6].AsString) = '' then begin
      rptDemonstrativo3Label1.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  ' + Modulo.sSiglaMoedaCorr;
   end else begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT MOECODIGO, MOESIGLA   '+
                         'FROM  MOEDA '+
                         'WHERE ' +
                         '     MOEINATIVO = ''A'' '+
                         'AND  (MOECODIGO = ' + CmpRptCM.ParamValues[6].AsString +') '+
                         'ORDER BY MOECODIGO ');
      sqlTitulos.Open;
      rptDemonstrativo3Label1.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  ' + cdsTitulos.FieldByName('MOESIGLA').AsString;
   end;
   rptDemonstrativo3Label2.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL2').AsString;

   if CtrlRptDemonstrativo.ProcessaDemoModelo3(cdsDemoAux.FieldByName('IDDEMONSTRATIVO').asInteger,
                                               iPlano,
                                               StrToInt(CmpRptCM.ParamValues[0].AsString),
                                               StrToInt(CmpRptCM.ParamValues[1].AsString),
                                               StrToInt(CmpRptCM.ParamValues[2].AsString),
                                               sPacTipoPerResult,
                                               cdsDemoAux.FieldByName('DEMNATUREZA').AsString,
                                               CmpRptCM.ParamValues[4].AsString,
                                               CmpRptCM.ParamValues[5].AsString,
                                               CmpRptCM.ParamValues[6].AsString,
                                               CmpRptCM.ParamValues[7].AsString,
                                               sDataIni,
                                               CmpRptCM.ParamValues[13].AsString,
                                               CrmRptCM.IdEmpresa,
                                               CmpRptCM.ParamValues[12].AsBoolean,
                                               CmpRptCM.ParamValues[11].AsBoolean) then
   begin
      inherited;

   end;

end;

procedure TrptDemonstrativo3.rptDemonstrativo3Label3Print(Sender: TObject);
begin
  inherited;
  rptDemonstrativo3Label3.Caption := IntToStr((iPagIni + StrToInt(rptDemonstrativo3Calc1.text)) - 1);

end;

procedure TrptDemonstrativo3.CmpRptCMParamControlEnter(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      1: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter   := 'PEREXERCICIO = '+IntToStr(StrToIntDef(sNomeExerc,0));
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
      2: Begin
         TPainelControles(Sender).CdsDisplay.Filtered := False;
         TPainelControles(Sender).CdsDisplay.Filter   := 'PEREXERCICIO = '+IntToStr(StrToIntDef(sNomeExerc,0));
         TPainelControles(Sender).CdsDisplay.Filtered := True;
         end;
   end;

end;

procedure TrptDemonstrativo3.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

end.
