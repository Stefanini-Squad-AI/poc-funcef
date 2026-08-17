
unit rDemonstrativo5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport,
  pptypes,uCtrlContab,uCtrlRptDemonstrativo, TXRB;

type
  TrptDemonstrativo5 = class(TFrmCmReport)
    rptDemonstrativo5: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppLabel71: TppLabel;
    ppLabel81: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLblSubTit2: TppLabel;
    pplbl13: TppLabel;
    pplbl14: TppLabel;
    pplbl15: TppLabel;
    pplbl16: TppLabel;
    pplbl17: TppLabel;
    pplbl18: TppLabel;
    pplbl19: TppLabel;
    pplbl20: TppLabel;
    pplbl21: TppLabel;
    pplbl22: TppLabel;
    pplbl23: TppLabel;
    pplbl24: TppLabel;
    rptDemonstrativo5Label1: TppLabel;
    ppLblSubTit3: TppLabel;
    rptDemonstrativo5DBImage1: TppDBImage;
    txtFiltro5: TppLabel;
    bndDetDemo5: TppDetailBand;
    dbtxtNomeDemo5: TppDBText;
    ppLine62: TppLine;
    ppdblbl24: TppDBText;
    ppdblbl23: TppDBText;
    ppdblbl22: TppDBText;
    ppdblbl21: TppDBText;
    ppdblbl20: TppDBText;
    ppdblbl19: TppDBText;
    ppdblbl18: TppDBText;
    ppdblbl17: TppDBText;
    ppdblbl16: TppDBText;
    ppdblbl15: TppDBText;
    ppdblbl14: TppDBText;
    ppdblbl13: TppDBText;
    rptDemonstrativo5DBText1: TppDBText;
    rptDemonstrativo5DBText2: TppDBText;
    ppFooterBand20: TppFooterBand;
    ppLine63: TppLine;
    lblsistema: TppLabel;
    rptDemonstrativo5Label2: TppLabel;
    rptDemonstrativo5Label3: TppLabel;
    ppCalc40: TppSystemVariable;
    rptDemonstrativo5Calc1: TppSystemVariable;
    rptDemonstrativo5Group1: TppGroup;
    rptDemonstrativo5GroupHeaderBand1: TppGroupHeaderBand;
    rptDemonstrativo5GroupFooterBand1: TppGroupFooterBand;
    pplDemonstrativo5: TppBDEPipeline;
    dsDemonstrativo5: TwwDataSource;
    cdsDemonstrativo5: TCMClientDataSet;
    sqlPerAux: TCMSqlParams;
    cdsPerAux: TCMClientDataSet;
    cdsEmpresa: TCMClientDataSet;
    sqlEmpresa: TCMSqlParams;
    sqlDemoAux: TCMSqlParams;
    cdsDemoAux: TCMClientDataSet;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    cdsPerAux2: TCMClientDataSet;
    sqlPeraux2: TCMSqlParams;
    pplEmpresaProp: TppBDEPipeline;
    cdsEmpresaProp: TCMClientDataSet;
    sqlEmpresaProp: TCMSqlParams;
    dsEmpresaProp: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure ppHeaderBand19BeforePrint(Sender: TObject);
    procedure bndDetDemo5BeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rptDemonstrativo5Label2Print(Sender: TObject);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    CtrlRptDemonstrativo :TCtrlRptDemonstrativo;
    CtrlContab :TCtrlContab;

    sNomeRelat1,sNomeRelat2,sLinhaAcima,sLinhaAbaixo,sNomeDemo,sNomeExerc :string;
    sNomeCCusto,sNomeAtivProj,sPacTipoPerResult,sNomePer1,sNomePer2,sNomeMoedaReal :string;
    bIngles :Boolean;
    iPlano,iPerDemoIni,iPerDemoFim,iExercicio,iPagIni :integer;
    sPerDataFim,sNomeLingua1,sNomeLingua2 :string;
  public
    { Public declarations }
  end;

var
  rptDemonstrativo5: TrptDemonstrativo5;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo,  uData, uFuncaoGeral;

{$R *.DFM}

procedure TrptDemonstrativo5.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptDemonstrativo := TCtrlRptDemonstrativo.Create;
  CtrlRptDemonstrativo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);


  CtrlRptDemonstrativo.cdsDemonstrativo := cdsDemonstrativo5;

end;

procedure TrptDemonstrativo5.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptDemonstrativo.Free;
  CtrlContab.free;
end;

procedure TrptDemonstrativo5.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[11].SpinEditSettings.Value := 1;

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
                                                    'WHERE   '+
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


end;

procedure TrptDemonstrativo5.ppHeaderBand19BeforePrint(
  Sender: TObject);
var sNome, sNomeIng : string;
begin
   inherited;

   with sqlPerAux2 do
   begin
      Prepare;
      ParamByName('IDPESSOA').asFloat  := CrmRptCM.IdEmpresa;
      ParamByName('PEREXERCICIO').asInteger := iExercicio;
      Open;
      cdsPerAux2.First;

      while not cdsPerAux2.eof do
      begin
         sNome    := cdsPerAux2.FieldByName('PERNOME').asString;
         sNomeIng := cdsPerAux2.FieldByName('PERNOMEOUTLING').asString;

         case cdsPerAux2.FieldByName('PERNUMERO').asInteger of
            1: begin
                  if bIngles then
                     pplbl13.caption := sNomeIng
                  else
                     pplbl13.caption := sNome;
               end;
            2: begin
                  if bIngles then
                     pplbl14.caption := sNomeIng
                  else
                     pplbl14.caption := sNome;
               end;
            3: begin
                  if bIngles then
                     pplbl15.caption := sNomeIng
                  else
                     pplbl15.caption := sNome;
               end;
            4: begin
                  if bIngles then
                     pplbl16.caption := sNomeIng
                  else
                     pplbl16.caption := sNome;
               end;
            5: begin
                  if bIngles then
                     pplbl17.caption := sNomeIng
                  else
                     pplbl17.caption := sNome;
               end;
            6: begin
                  if bIngles then
                     pplbl18.caption := sNomeIng
                  else
                     pplbl18.caption := sNome;
               end;
            7: begin
                  if bIngles then
                     pplbl19.caption := sNomeIng
                  else
                     pplbl19.caption := sNome;
               end;
            8: begin
                  if bIngles then
                     pplbl20.caption := sNomeIng
                  else
                     pplbl20.caption := sNome;
               end;
            9: begin
                  if bIngles then
                     pplbl21.caption := sNomeIng
                  else
                     pplbl21.caption := sNome;
               end;
            10: begin
                  if bIngles then
                     pplbl22.caption := sNomeIng
                  else
                     pplbl22.caption := sNome;
               end;
            11: begin
                  if bIngles then
                     pplbl23.caption := sNomeIng
                  else
                     pplbl23.caption := sNome;
               end;
            12: begin
                  if bIngles then
                     pplbl24.caption := sNomeIng
                  else
                     pplbl24.caption := sNome;
               end;

         end;
         cdsPerAux2.next;
      end;
   end;

   //Configura o espaçamento entre as labels dos meses
   pplbl13.visible := false;
   pplbl14.visible := false;
   pplbl15.visible := false;
   pplbl16.visible := false;
   pplbl17.visible := false;
   pplbl18.visible := false;
   pplbl19.visible := false;
   pplbl20.visible := false;
   pplbl21.visible := false;
   pplbl22.visible := false;
   pplbl23.visible := false;
   pplbl24.visible := false;

   if (iPerDemoIni <= 1) then
      pplbl13.visible := true;
   if (iPerDemoIni <= 2) then
      pplbl14.visible := true;
   if (iPerDemoIni <= 3) then
      pplbl15.visible := true;
   if (iPerDemoIni <= 4) then
      pplbl16.visible := true;
   if (iPerDemoIni <= 5) then
      pplbl17.visible := true;
   if (iPerDemoIni <= 6) then
      pplbl18.visible := true;
   if (iPerDemoIni <= 7) then
      pplbl19.visible := true;
   if (iPerDemoIni <= 8) then
      pplbl20.visible := true;
   if (iPerDemoIni <= 9) then
      pplbl21.visible := true;
   if (iPerDemoIni <= 10) then
      pplbl22.visible := true;
   if (iPerDemoIni <= 11) then
      pplbl23.visible := true;
   if (iPerDemoIni <= 12) then
      pplbl24.visible := true;

   if (iPerDemoFim < 12) then
      pplbl24.visible := false;
   if (iPerDemoFim < 11) then
      pplbl23.visible := false;
   if (iPerDemoFim < 10) then
      pplbl22.visible := false;
   if (iPerDemoFim < 9) then
      pplbl21.visible := false;
   if (iPerDemoFim < 8) then
      pplbl20.visible := false;
   if (iPerDemoFim < 7) then
      pplbl19.visible := false;
   if (iPerDemoFim < 6) then
      pplbl18.visible := false;
   if (iPerDemoFim < 5) then
      pplbl17.visible := false;
   if (iPerDemoFim < 4) then
      pplbl16.visible := false;
   if (iPerDemoFim < 3) then
      pplbl15.visible := false;
   if (iPerDemoFim < 2) then
      pplbl14.visible := false;

   //Configura a linha separatória
   if sLinhaAcima = 'N' then begin
      ppLine60.Visible := False;
   end else begin
      ppLine60.Visible := True;
      if sLinhaAcima = 'V' then begin
         ppLine60.Width := 223044;
         ppLine60.Left  := 61383;
      end else begin
         ppLine60.Left  := 0;
         if sLinhaAcima = 'T' then begin
            ppLine60.Width := 60854;
         end else begin
            ppLine60.Width := 284300;
         end;
      end;
   end;
   //
   if sLinhaAbaixo = 'N' then begin
      ppLine61.Visible := False;
   end else begin
      ppLine61.Visible := True;
      if sLinhaAbaixo = 'V' then begin
         ppLine61.Width := 223044;
         ppLine61.Left  := 61383;
      end else begin
         ppLine61.Left  := 0;
         if sLinhaAbaixo = 'T' then begin
            ppLine61.Width := 60854;
         end else begin
            ppLine61.Width := 284300;
         end;
      end;
   end;

end;

procedure TrptDemonstrativo5.bndDetDemo5BeforePrint(Sender: TObject);
var sFormatoPos, sFormatoNeg : string;
begin
   inherited;

   //Configura o espaçamento entre as labels dos meses
   ppdblbl13.visible := false;
   ppdblbl14.visible := false;
   ppdblbl15.visible := false;
   ppdblbl16.visible := false;
   ppdblbl17.visible := false;
   ppdblbl18.visible := false;
   ppdblbl19.visible := false;
   ppdblbl20.visible := false;
   ppdblbl21.visible := false;
   ppdblbl22.visible := false;
   ppdblbl23.visible := false;
   ppdblbl24.visible := false;

   if (iPerDemoIni <= 1) then
      ppdblbl13.visible := true;
   if (iPerDemoIni <= 2) then
      ppdblbl14.visible := true;
   if (iPerDemoIni <= 3) then
      ppdblbl15.visible := true;
   if (iPerDemoIni <= 4) then
      ppdblbl16.visible := true;
   if (iPerDemoIni <= 5) then
      ppdblbl17.visible := true;
   if (iPerDemoIni <= 6) then
      ppdblbl18.visible := true;
   if (iPerDemoIni <= 7) then
      ppdblbl19.visible := true;
   if (iPerDemoIni <= 8) then
      ppdblbl20.visible := true;
   if (iPerDemoIni <= 9) then
      ppdblbl21.visible := true;
   if (iPerDemoIni <= 10) then
      ppdblbl22.visible := true;
   if (iPerDemoIni <= 11) then
      ppdblbl23.visible := true;
   if (iPerDemoIni <= 12) then
      ppdblbl24.visible := true;

   if (iPerDemoFim < 12) then
      ppdblbl24.visible := false;
   if (iPerDemoFim < 11) then
      ppdblbl23.visible := false;
   if (iPerDemoFim < 10) then
      ppdblbl22.visible := false;
   if (iPerDemoFim < 9) then
      ppdblbl21.visible := false;
   if (iPerDemoFim < 8) then
      ppdblbl20.visible := false;
   if (iPerDemoFim < 7) then
      ppdblbl19.visible := false;
   if (iPerDemoFim < 6) then
      ppdblbl18.visible := false;
   if (iPerDemoFim < 5) then
      ppdblbl17.visible := false;
   if (iPerDemoFim < 4) then
      ppdblbl16.visible := false;
   if (iPerDemoFim < 3) then
      ppdblbl15.visible := false;
   if (iPerDemoFim < 2) then
      ppdblbl14.visible := false;

   //imprime as contas indentadas
   if cdsDemonstrativo5.FieldByName('FLGINDENTACAO').asString <> '' then
      dbtxtNomeDemo5.left := (4000 * StrToInt(cdsDemonstrativo5.FieldByName('FLGINDENTACAO').asString));

   CtrlRptDemonstrativo.EspecificaParametros(Self,cdsDemonstrativo5.FieldByName('ELETIPOELEM').asString,cdsDemonstrativo5.FieldByName('FLGNEGRITO').asString,bndDetDemo5);

   //imprime as linhas separadoras de acordo com o tipo
   ppLine62.Visible   := False;
   ppLine62.Height    := 1852;
   bndDetDemo5.Height := 4600;
   //
   if cdsDemonstrativo5.FieldByName('FLGDECIMAIS').asString = 'S' then begin
      sFormatoPos := '#,0.00';
      if cdsDemonstrativo5.FieldByName('FLGTIPONEGATIVO').asString = 'M'  then begin
         sFormatoNeg := '-#,0.00';
      end else begin
         sFormatoNeg := '(#,0.00)';
      end;
   end else begin
      sFormatoPos := '#,0';
      if cdsDemonstrativo5.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
         sFormatoNeg := '-#,0';
      end else begin
         sFormatoNeg := '(#,0)';
      end;
   end;

   ppdblbl13.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppdblbl14.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppdblbl15.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppdblbl16.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppdblbl17.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppdblbl18.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppdblbl19.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppdblbl20.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppdblbl21.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppdblbl22.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppdblbl23.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   ppdblbl24.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;

   if cdsDemonstrativo5.FieldByName('FLGTIPOLINHA').asString = 'X' then begin
      bndDetDemo5.visible := false;
   end else begin
      bndDetDemo5.visible := true;
   end;

   if cdsDemonstrativo5.FieldByName('FLGTIPOLINHA').asString = 'N' then begin
      bndDetDemo5.Height := 4600;
   end;

   if cdsDemonstrativo5.FieldByName('FLGTIPOLINHA').asString = 'E' then begin
      bndDetDemo5.Height := 7408;
   end;

   if cdsDemonstrativo5.FieldByName('FLGTIPOLINHA').asString = 'F' then begin
      bndDetDemo5.Height := 7408;
      ppLine62.Visible   := True;
      ppLine62.Style     := lsSingle;
      ppLine62.Weight    := 1;
   end;

   if cdsDemonstrativo5.FieldByName('FLGTIPOLINHA').asString = 'D' then begin
      bndDetDemo5.Height := 7408;
      ppLine62.Visible   := True;
      ppLine62.Style     := lsDouble;
      ppLine62.Weight    := 1;
   end;

   if cdsDemonstrativo5.FieldByName('FLGTIPOLINHA').asString = 'G' then begin
      bndDetDemo5.Height := 7408;
      ppLine62.Visible   := True;
      ppLine62.Style     := lsSingle;
      ppLine62.Weight    := 2;
   end;

   if ppLine62.Visible then begin
      if copy(cdsDemonstrativo5.FieldByName('FLGTRACO').asString,2,1) = 'A' then begin
         ppLine62.Top := 265 ;
      end else begin
         ppLine62.Top := 4600 ;
      end;

      if copy(cdsDemonstrativo5.FieldByName('FLGTRACO').asString,1,1) = 'V' then begin
         ppLine62.Width := 216694;
         ppLine62.Left  := 62971;
      end else begin
         if copy(cdsDemonstrativo5.FieldByName('FLGTRACO').asString,1,1) = 'T' then begin
            ppLine62.Visible := False;
            if cdsDemonstrativo5.FieldByName('FLGNEGRITO').asString = 'S' then begin
               dbtxtNomeDemo5.Font.Style :=[fsBold,fsUnderline];
            end else begin
               dbtxtNomeDemo5.Font.Style :=[fsUnderline];
            end;
         end else begin
            ppLine62.Left  := 529;
            ppLine62.Width := 284300;
         end;
      end;

   end;

end;

procedure TrptDemonstrativo5.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
    if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
    begin
       sPacTipoPerResult := CtrlContab.TipoOpEncer;
    end else
    begin
       sPacTipoPerResult := '';
    end;

   iPagIni     := CmpRptCM.ParamValues[11].AsInteger;
   iPlano      := Modulo.iPlano;
   iPerDemoIni := StrToInt(CmpRptCM.ParamValues[1].AsString);
   iPerDemoFim := StrToInt(CmpRptCM.ParamValues[2].AsString);
   iExercicio  := StrToInt(CmpRptCM.ParamValues[0].AsString);
   bIngles     := CmpRptCM.ParamValues[8].AsBoolean;


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

   sqlEmpresaProp.Prepare;
   sqlEmpresaProp.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlEmpresaProp.Open;

   //=================== pega a data final do exercicio atual ================
   sqlPerAux2.Prepare;
   sqlPerAux2.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlPerAux2.ParamByName('PEREXERCICIO').asInteger := iExercicio;
   sqlPerAux2.Open;
   sPerDataFim     := DateToStr((cdsPerAux2.FieldByName('PERDATFIM').asDateTime));
   //==========================================================================

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

   ppLabel71.Caption  := sNomeRelat1;
   ppLabel127.Caption := sNomeRelat2;
   ppLabel128.Caption := sNomeDemo;

   if CmpRptCM.ParamValues[4].AsString <> '' then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME '+
                         'FROM  CENTCUST '+
                         'WHERE '+
                         '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND '+
                         '   (RTRIM(CODCENTROCUSTO) = ''' + trim(CmpRptCM.ParamValues[4].AsString) + ''') ' +
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
                         '   (IDPESSOA    = '+FloatToStr(CrmRptCM.IdEmpresa)+') AND '+
                         '   (UNIDNEGOC = '+CmpRptCM.ParamValues[5].AsString + ') ' +
                         'ORDER BY UNIDNEGOC');
      sqlTitulos.Open;
      sNomeAtivProj := cdsTitulos.FieldByName('NOME').asString;
   end else
   begin
      sNomeAtivProj := '<Todas>';
   end;

   if CmpRptCM.ParamValues[7].AsBoolean then begin
      txtFiltro5.Caption := 'Centro de Custo: ' + sNomeCCusto  + '    Ativ.Proj.: ' + sNomeAtivProj;
   end else begin
      txtFiltro5.Caption := '';
   end;


   if CmpRptCM.ParamValues[8].AsBoolean then begin
      if CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString then begin
         ppLabel81.Caption := sNomeLingua1 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end else begin
         ppLabel81.Caption := sNomeLingua1 + '/'+CmpRptCM.ParamValues[0].AsString + ' to ' +
                                                 sNomeLingua2 + '/'+CmpRptCM.ParamValues[0].AsString;
      end;
   end else begin
      if CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString then begin
         ppLabel81.Caption := sNomePer1 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end else begin
         ppLabel81.Caption := sNomePer1 + '/'+ CmpRptCM.ParamValues[0].AsString + ' a ' +
                                                    sNomePer2 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end;
   end;

   if trim(CmpRptCM.ParamValues[6].AsString) = '' then begin
      ppLblSubTit2.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  ' + Modulo.sSiglaMoedaCorr;
   end else begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT MOECODIGO, MOESIGLA   '+
                         'FROM  MOEDA '+
                         'WHERE ' +
                         '     MOEINATIVO = ''A'' '+
                         'AND  (MOECODIGO = ' + CmpRptCM.ParamValues[6].AsString +') '+
                         'ORDER BY MOECODIGO ');
      sqlTitulos.Open;
      sNomeMoedaReal := cdsTitulos.FieldByName('MOESIGLA').AsString;
      ppLblSubTit2.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  ' + cdsTitulos.FieldByName('MOESIGLA').AsString;
   end;
   ppLblSubTit3.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL2').AsString;

   if CtrlRptDemonstrativo.ProcessaDemoModelo5(cdsDemoAux.FieldByName('IDDEMONSTRATIVO').asInteger,
                                               StrToInt(CmpRptCM.ParamValues[0].AsString),
                                               StrToInt(CmpRptCM.ParamValues[1].AsString),
                                               StrToInt(CmpRptCM.ParamValues[2].AsString),
                                               iPlano,
                                               CrmRptCM.IdEmpresa,
                                               cdsDemoAux.FieldByName('DEMNATUREZA').AsString,
                                               sPacTipoPerResult,
                                               CmpRptCM.ParamValues[4].AsString,
                                               CmpRptCM.ParamValues[5].AsString,
                                               CmpRptCM.ParamValues[12].AsString,
                                               CmpRptCM.ParamValues[6].AsString,
                                               sPerDataFim,
                                               CmpRptCM.ParamValues[10].AsBoolean,
                                               CmpRptCM.ParamValues[9].AsBoolean) then
   begin
      inherited;

   end;


end;

procedure TrptDemonstrativo5.rptDemonstrativo5Label2Print(
  Sender: TObject);
begin
  inherited;
  rptDemonstrativo5Label2.Caption := IntToStr((iPagIni + StrToInt(rptDemonstrativo5Calc1.text)) - 1);

end;

procedure TrptDemonstrativo5.CmpRptCMParamControlEnter(
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

procedure TrptDemonstrativo5.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

end.
