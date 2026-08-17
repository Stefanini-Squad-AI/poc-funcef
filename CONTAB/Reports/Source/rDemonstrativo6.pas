
unit rDemonstrativo6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport,
  pptypes,uCtrlContab,uCtrlRptDemonstrativo, TXRB;

type
  TrptDemonstrativo6 = class(TFrmCmReport)
    rptDemonstrativo6: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    linAcima: TppLine;
    linAbaixo: TppLine;
    ppLabel129: TppLabel;
    ppLabel131: TppLabel;
    ppDBImage1: TppDBImage;
    txtSaldoAnterior: TppLabel;
    txtDebito: TppLabel;
    txtCredito: TppLabel;
    txtSaldo: TppLabel;
    txtFiltro6: TppLabel;
    bndDetDemo6: TppDetailBand;
    dbtxtNomeDemo6: TppDBText;
    dbtxtSaldoAntDemo6: TppDBText;
    dbtxtDebDemo6: TppDBText;
    dbtxtSaldoDemo6: TppDBText;
    linDemo6: TppLine;
    dbtxtCreDemo6: TppDBText;
    dbtxtDCSaldoAntDemo6: TppDBText;
    dbtxtDCSaldoDemo6: TppDBText;
    rptDemonstrativo6DBText1: TppDBText;
    ppFooterBand21: TppFooterBand;
    ppLine66: TppLine;
    lblsistema: TppLabel;
    rptDemonstrativo6Label1: TppLabel;
    rptDemonstrativo6Label2: TppLabel;
    ppCalc42: TppSystemVariable;
    rptDemonstrativo6Calc1: TppSystemVariable;
    rptDemonstrativo6Group1: TppGroup;
    rptDemonstrativo6GroupHeaderBand1: TppGroupHeaderBand;
    rptDemonstrativo6GroupFooterBand1: TppGroupFooterBand;
    pplDemonstrativo6: TppBDEPipeline;
    dsDemonstrativo6: TwwDataSource;
    cdsDemonstrativo6: TCMClientDataSet;
    cdsEmpresa: TCMClientDataSet;
    sqlEmpresa: TCMSqlParams;
    sqlDemoAux: TCMSqlParams;
    cdsDemoAux: TCMClientDataSet;
    cdsPerAux: TCMClientDataSet;
    sqlPerAux: TCMSqlParams;
    dsEmpresaProp: TwwDataSource;
    pplEmpresaProp: TppBDEPipeline;
    cdsEmpresaProp: TCMClientDataSet;
    sqlEmpresaProp: TCMSqlParams;
    cdsPerAux2: TCMClientDataSet;
    sqlPeraux2: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    procedure nt(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppHeaderBand20BeforePrint(Sender: TObject);
    procedure bndDetDemo6BeforePrint(Sender: TObject);
    procedure rptDemonstrativo6Label1Print(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    CtrlRptDemonstrativo :TCtrlRptDemonstrativo;
    CtrlContab :TCtrlContab;


    sNomeRelat1,sNomeRelat2,sLinhaAcima,sLinhaAbaixo,sNomeDemo,sNomeExerc :string;
    sNomeCCusto,sNomeAtivProj,sNomePer1,sNomePer2,sNomeMoedaReal,sPacTipoPerResult :string;
    bIngles :Boolean;
    iPlano,iPagIni :integer;
    sDataFim,sNomeLingua1,sNomeLingua2 :string;

  public
    { Public declarations }
  end;

var
  rptDemonstrativo6: TrptDemonstrativo6;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo,  uData, uFuncaoGeral;

{$R *.DFM}

procedure TrptDemonstrativo6.nt(var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[7].SpinEditSettings.Value := 1;

   CmpRptCM.ParamValues[0].LookupSettings.SQL.Text:='SELECT DISTINCT '+
                                                    '   PEREXERCICIO '+
                                                    'FROM '+
                                                    '   PERIODO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY PEREXERCICIO';

   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:='SELECT '+
                                                    '   (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ' +
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
                                                    '   (PEREXERCICIO || ' + QuotedStr(' - ')  + ' || PERNOME) AS PEREXERCNOME, ' +
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


end;

procedure TrptDemonstrativo6.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
  begin
     sPacTipoPerResult := CtrlContab.TipoOpEncer;
  end else
  begin
     sPacTipoPerResult := '';
  end;


   iPagIni := CmpRptCM.ParamValues[7].AsInteger;
   iPlano  := Modulo.iPlano;
   bIngles := CmpRptCM.ParamValues[8].AsBoolean;

   //======= abre abre empresa para pegar os nomes dos relatorios =======
   sqlEmpresa.Prepare;
   sqlEmpresa.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlEmpresa.Open;
   sNomeRelat1 := cdsEmpresa.FieldByName('NOMERELAT1').AsString;
   sNomeRelat2 := cdsEmpresa.FieldByName('NOMERELAT2').AsString;
   //=====================================================================

   sqlEmpresaProp.Prepare;
   sqlEmpresaProp.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlEmpresaProp.Open;

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

   //================ pega a datfim do periodo final  ================
   sqlPerAux2.Prepare;
   sqlPerAux2.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlPerAux2.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
   sqlPerAux2.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[2].AsString);
   sqlPerAux2.Open;
   sDataFim     := DateToStr((cdsPerAux2.FieldByName('PERDATFIM').asDateTime));
   //=========================================================================

   //====================== pega nomes em outra lingua ======================
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

   ppLabel45.Caption  := sNomeRelat1;
   ppLabel125.Caption := sNomeRelat2;
   ppLabel126.Caption := sNomeDemo;

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
                         '   (UNIDNEGOC   = '+CmpRptCM.ParamValues[5].AsString + ') ' +
                         'ORDER BY UNIDNEGOC');
      sqlTitulos.Open;
      sNomeAtivProj := cdsTitulos.FieldByName('NOME').asString;
   end else
   begin
      sNomeAtivProj := '<Todas>';
   end;

   if CmpRptCM.ParamValues[9].AsBoolean then begin
      txtFiltro6.Caption := 'Centro de Custo: ' + sNomeCCusto  + '    Ativ.Proj.: ' + sNomeAtivProj;
   end else begin
      txtFiltro6.Caption := '';
   end;


   if CmpRptCM.ParamValues[8].AsBoolean then begin
      if CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString then begin
         ppLabel46.Caption := sNomeLingua1 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end else begin
         ppLabel46.Caption := sNomeLingua1 + '/'+CmpRptCM.ParamValues[0].AsString + ' to ' +
                                                 sNomeLingua2 + '/'+CmpRptCM.ParamValues[0].AsString;
      end;
   end else begin
      if CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString then begin
         ppLabel46.Caption := sNomePer1 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end else begin
         ppLabel46.Caption := sNomePer1 + '/'+ CmpRptCM.ParamValues[0].AsString + ' a ' +
                                            sNomePer2 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end;
   end;

   if trim(CmpRptCM.ParamValues[6].AsString) = '' then begin
      ppLabel129.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  ' + Modulo.sSiglaMoedaCorr;
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
      ppLabel129.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  ' + cdsTitulos.FieldByName('MOESIGLA').AsString;
   end;
   ppLabel131.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL2').AsString;


   if CtrlRptDemonstrativo.ProcessaDemoModelo6(cdsDemoAux.FieldByName('IDDEMONSTRATIVO').asInteger, //demo
                                               iPlano,                                              //plano
                                               StrToInt(CmpRptCM.ParamValues[0].AsString),          //exerc
                                               StrToInt(CmpRptCM.ParamValues[1].AsString),          //perini
                                               StrToInt(CmpRptCM.ParamValues[2].AsString),          //perfim
                                               CrmRptCM.IdEmpresa,                                  //empresa
                                               CmpRptCM.ParamValues[4].AsString,                    //c.custo
                                               CmpRptCM.ParamValues[5].AsString,                    //ativ
                                               CmpRptCM.ParamValues[6].AsString,                    //moeda
                                               sDataFim,                                            //datfim
                                               sPacTipoPerResult,
                                               cdsDemoAux.FieldByName('DEMNATUREZA').AsString,
                                               CmpRptCM.ParamValues[10].AsBoolean,          //perfim
                                               CmpRptCM.ParamValues[11].AsBoolean) then     //perfim
   begin
      inherited;

   end;


end;

procedure TrptDemonstrativo6.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptDemonstrativo := TCtrlRptDemonstrativo.Create;
  CtrlRptDemonstrativo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptDemonstrativo.CdsDemonstrativo := cdsDemonstrativo6;

  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TrptDemonstrativo6.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptDemonstrativo.free;
  CtrlContab.free;
end;

procedure TrptDemonstrativo6.ppHeaderBand20BeforePrint(
  Sender: TObject);
begin
  inherited;
   if bIngles then begin
      txtSaldoAnterior.caption := 'Last Balance';
      txtDebito.caption        := 'Debit';
      txtCredito.caption       := 'Credit';
      txtSaldo.caption         := 'Balance';
   end else begin
      txtSaldoAnterior.caption := 'Saldo Anterior';
      txtDebito.caption        := 'Débito';
      txtCredito.caption       := 'Crédito';
      txtSaldo.caption         := 'Saldo Atual';
   end;

   if sLinhaAcima = 'N' then begin
      linAcima.Visible := False;
   end else begin
      linAcima.Visible := True;
      if sLinhaAcima = 'V' then begin
         linAcima.Width := 97367;
         linAcima.Left  := 97102;
      end else begin
         linAcima.Left  := 529;
         if sLinhaAcima = 'T' then begin
            linAcima.Width := 95250;
         end else begin
            linAcima.Width := 194469;
         end;
      end;
   end;
   //
   if sLinhaAbaixo = 'N' then begin
      linAbaixo.Visible := False;
   end else begin
      linAbaixo.Visible := True;
      if sLinhaAbaixo = 'V' then begin
         linAbaixo.Width := 97367;
         linAbaixo.Left  := 97102;
      end else begin
         linAbaixo.Left  := 529;
         if sLinhaAbaixo = 'T' then begin
            linAbaixo.Width := 95250;
         end else begin
            linAbaixo.Width := 194469;
         end;
      end;
   end;

end;

procedure TrptDemonstrativo6.bndDetDemo6BeforePrint(Sender: TObject);
var sFormatoNeg, sFormatoPos : string;
begin
   inherited;

   //imprime as contas indentadas
   dbtxtNomeDemo6.left := (4000 * StrToInt(cdsDemonstrativo6.FieldByName('FLGINDENTACAO').asString));

   CtrlRptDemonstrativo.EspecificaParametros(Self,cdsDemonstrativo6.FieldByName('ELETIPOELEM').asString,cdsDemonstrativo6.FieldByName('FLGNEGRITO').asString,bndDetDemo6);

   //imprime as linhas separadoras de acordo com o tipo
   linDemo6.Visible   := False;
   linDemo6.Height    := 1852 ;
   bndDetDemo6.Height := 4600;
   //
   if cdsDemonstrativo6.FieldByName('FLGDECIMAIS').asString = 'S' then begin
      sFormatoPos := '#,0.00';
      if cdsDemonstrativo6.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
         sFormatoNeg := '-#,0.00';
      end else begin
         sFormatoNeg := '(#,0.00)';
      end;
   end else begin
      sFormatoPos := '#,0';
      if cdsDemonstrativo6.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
         sFormatoNeg := '-#,0';
      end else begin
         sFormatoNeg := '(#,0)';
      end;
   end;

   dbtxtSaldoAntDemo6.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   dbtxtSaldoDemo6.DisplayFormat    := sFormatoPos + ';' + sFormatoNeg;
   dbtxtDebDemo6.DisplayFormat      := sFormatoPos + ';' + sFormatoNeg;
   dbtxtCreDemo6.DisplayFormat      := sFormatoPos + ';' + sFormatoNeg;

   if cdsDemonstrativo6.FieldByName('FLGTIPOLINHA').asString = 'X' then begin
      bndDetDemo6.visible := false;
   end else begin
      bndDetDemo6.visible := true;
   end;

   if cdsDemonstrativo6.FieldByName('FLGTIPOLINHA').asString = 'N' then begin
      bndDetDemo6.Height := 4600;
   end;

   if cdsDemonstrativo6.FieldByName('FLGTIPOLINHA').asString = 'E' then begin
      bndDetDemo6.Height := 7408;
   end;

   if cdsDemonstrativo6.FieldByName('FLGTIPOLINHA').asString = 'F' then begin
      bndDetDemo6.Height := 7408;
      linDemo6.Visible   := True;
      linDemo6.Style     := lsSingle;
      linDemo6.Weight    := 1;
   end;

   if cdsDemonstrativo6.FieldByName('FLGTIPOLINHA').asString = 'D' then begin
      bndDetDemo6.Height := 7408;
      linDemo6.Visible   := True;
      linDemo6.Style     := lsDouble;
      linDemo6.Weight    := 1;
   end;

   if cdsDemonstrativo6.FieldByName('FLGTIPOLINHA').asString = 'G' then begin
      bndDetDemo6.Height := 7408;
      linDemo6.Visible   := True;
      linDemo6.Style     := lsSingle;
      linDemo6.Weight    := 2;
   end;

   if linDemo6.Visible then begin
      if copy(cdsDemonstrativo6.FieldByName('FLGTRACO').asString,2,1) = 'A' then begin
         linDemo6.Top := 265 ;
      end else begin
         linDemo6.Top := 4600 ;
      end;

      if copy(cdsDemonstrativo6.FieldByName('FLGTRACO').asString,1,1) = 'V' then begin
         linDemo6.Width := 97367;
         linDemo6.Left  := 97631;
      end else begin
         if copy(cdsDemonstrativo6.FieldByName('FLGTRACO').asString,1,1) = 'T' then begin
            linDemo6.Visible := False;
            if cdsDemonstrativo6.FieldByName('FLGNEGRITO').asString = 'S' then begin
               dbtxtNomeDemo6.Font.Style :=[fsBold,fsUnderline];
            end else begin
               dbtxtNomeDemo6.Font.Style :=[fsUnderline];
            end;
         end else begin
            linDemo6.Left  := 794;
            linDemo6.Width := 194734;
         end;
      end;

   end;

end;

procedure TrptDemonstrativo6.rptDemonstrativo6Label1Print(
  Sender: TObject);
begin
  inherited;
  rptDemonstrativo6Label1.Caption := IntToStr((iPagIni + StrToInt(rptDemonstrativo6Calc1.text)) - 1);

end;

procedure TrptDemonstrativo6.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[7].SpinEditSettings.Value := 1;

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

end;

procedure TrptDemonstrativo6.CmpRptCMParamControlEnter(
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

procedure TrptDemonstrativo6.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

end.
