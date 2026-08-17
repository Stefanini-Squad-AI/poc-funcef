unit rDemonstrativo4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCtrlRptDemonstrativo,
  Db, DBTables, Wwquery, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppClass, ppVar, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, uCmSqlParams, DBClient, uCMClientDataSet, TXRB;

type
  TrptDemonstrativo4 = class(TFrmCmReport)
    rptDemonstrativo4: TppReport;
    bndDemo4: TppHeaderBand;
    txtEmpDemo41: TppLabel;
    txtDataDemo4: TppLabel;
    dbtxtCol1: TppLabel;
    txtEmpDemo42: TppLabel;
    txtTituloDemo41: TppLabel;
    ppLine56: TppLine;
    ppLine57: TppLine;
    txtTituloDemo42: TppLabel;
    dbtxtCol2: TppLabel;
    dbtxtCol4: TppLabel;
    dbtxtCol3: TppLabel;
    dbtxtCol6: TppLabel;
    dbtxtCol5: TppLabel;
    dbtxtColTot: TppLabel;
    txtTituloDemo43: TppLabel;
    rptDemonstrativo4DBImage1: TppDBImage;
    txtFiltro4: TppLabel;
    bndDetDemo4: TppDetailBand;
    dbtxtNomeDemo4: TppDBText;
    dbtxtCol1Demo4: TppDBText;
    dbtxtCol2Demo4: TppDBText;
    dbtxtCol3Demo4: TppDBText;
    dbtxtCol4Demo4: TppDBText;
    dbtxtCol5Demo4: TppDBText;
    dbtxtCol6Demo4: TppDBText;
    dbtxtColPDemo4: TppDBText;
    ppFooterBand19: TppFooterBand;
    lblsistema: TppLabel;
    ppLine59: TppLine;
    rptDemonstrativo4Label1: TppLabel;
    rptDemonstrativo4Label2: TppLabel;
    ppCalc38: TppSystemVariable;
    rptDemonstrativo4Calc1: TppSystemVariable;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppLine73: TppLine;
    ppGroup15: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppLine72: TppLine;
    pplDemonstrativo4: TppBDEPipeline;
    dsDemonstrativo4: TwwDataSource;
    cdsDemonstrativo4: TCMClientDataSet;
    cdsDemo4Colunas: TCMClientDataSet;
    sqlDemo4Colunas: TCMSqlParams;
    sqlDemoAux: TCMSqlParams;
    cdsDemoAux: TCMClientDataSet;
    sqlEmpresa: TCMSqlParams;
    cdsEmpresa: TCMClientDataSet;
    cdsPerAux: TCMClientDataSet;
    sqlPerAux: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    sqlEmpresaProp: TCMSqlParams;
    cdsEmpresaProp: TCMClientDataSet;
    pplEmpresaProp: TppBDEPipeline;
    dsEmpresaProp: TwwDataSource;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bndDemo4BeforePrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rptDemonstrativo4Label1Print(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
  private
    CtrlRptDemonstrativo :TCtrlRptDemonstrativo;

    sNomeRelat1,sNomeRelat2,sLinhaAcima,sLinhaAbaixo,sNomeDemo,sNomeExerc :string;
    sNomeCCusto,sNomeAtivProj,sNomePer1,sNomePer2,sNomeMoedaReal :string;
    iPlano,iDemo,iPagIni :integer;
    sFormato,sNomePatro,sNomePlano,sPerDataFim,sNomeLingua1,sNomeLingua2,sNomeMoeda :string;
  public
    { Public declarations }
  end;

var
  rptDemonstrativo4: TrptDemonstrativo4;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uString,
     uModulo,  uData, uFuncaoGeral;

{$R *.DFM}

procedure TrptDemonstrativo4.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;
   CmpRptCM.ParamValues[12].SpinEditSettings.Value := 1;

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


   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text:='SELECT  '+
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

   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';


   CmpRptCM.ParamValues[8].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';


   CmpRptCM.ParamValues[3].AsDateTime:=Now;
   CmpRptCM.ParamValues[4].AsDateTime:=Now;


   CmpRptCM.ParamValues[7].LookupSettings.SQL.Text:='SELECT '+
                                                    '   CODCENTROCUSTO, '+
                                                    '   NOME '+
                                                    'FROM '+
                                                    '   CENTCUST '+
                                                    'WHERE '+
                                                    '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';

   CmpRptCM.ParamValues[8].LookupSettings.SQL.Text:='SELECT '+
                                                    '   UNIDNEGOC, '+
                                                    '   NOME, '+
                                                    '   UNECODIGO '+
                                                    'FROM '+
                                                    '   UNIDNEGOCIO '+
                                                    'WHERE '+
                                                    '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                                                    'ORDER BY NOME';


end;

procedure TrptDemonstrativo4.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRptDemonstrativo := TCtrlRptDemonstrativo.Create;
  CtrlRptDemonstrativo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);


  CtrlRptDemonstrativo.cdsDemonstrativo := cdsDemonstrativo4;

end;

procedure TrptDemonstrativo4.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptDemonstrativo.Free;


end;

procedure TrptDemonstrativo4.bndDemo4BeforePrint(Sender: TObject);
var
  i :integer;
begin
  inherited;
   if sLinhaAcima = 'N' then begin
      ppLine56.Visible := False;
   end else begin
      ppLine56.Visible := True;
      if sLinhaAcima = 'V' then begin
         ppLine56.Width := 197115;
         ppLine56.Left  := 74348;
      end else begin
         ppLine56.Left  := 0;
         if sLinhaAcima = 'T' then begin
            ppLine56.Width := 74083;
         end else begin
            ppLine56.Width := 271463;
         end;
      end;
   end;
   //
   if sLinhaAbaixo = 'N' then begin
      ppLine57.Visible := False;
   end else begin
      ppLine57.Visible := True;
      if sLinhaAbaixo = 'V' then begin
         ppLine57.Width := 197115;
         ppLine57.Left  := 74348;
      end else begin
         ppLine57.Left  := 0;
         if sLinhaAbaixo = 'T' then begin
            ppLine57.Width := 74083;
         end else begin
            ppLine57.Width := 271463;
         end;
      end;
   end;

   with sqlDemo4Colunas do begin
      Prepare;
      ParamByName('IDDEMONSTRATIVO').asInteger := iDemo;
      Open;
      i := 1;
      dbtxtCol1.caption  := '';
      dbtxtCol2.caption  := '';
      dbtxtCol3.caption  := '';
      dbtxtCol4.caption  := '';
      dbtxtCol5.caption  := '';
      dbtxtCol6.caption  := '';

      while not cdsDemo4Colunas.eof do begin
         case i of
            1:  dbtxtCol1.caption  := cdsDemo4Colunas.FieldByName('NOMECOLUNA').asString;
            2:  dbtxtCol2.caption  := cdsDemo4Colunas.FieldByName('NOMECOLUNA').asString;
            3:  dbtxtCol3.caption  := cdsDemo4Colunas.FieldByName('NOMECOLUNA').asString;
            4:  dbtxtCol4.caption  := cdsDemo4Colunas.FieldByName('NOMECOLUNA').asString;
            5:  dbtxtCol5.caption  := cdsDemo4Colunas.FieldByName('NOMECOLUNA').asString;
            6:  dbtxtCol6.caption  := cdsDemo4Colunas.FieldByName('NOMECOLUNA').asString;
         end;
         inc(i);
         cdsDemo4Colunas.next;
      end;
      //Close;
   end;

end;

procedure TrptDemonstrativo4.CrmRptCMBeforePrint(Sender: TObject);
var
  sDataI, sDataF :String;
  iMes1,iDia1, iAno1:word;
  iMes2,iDia2, iAno2:word;
begin
  inherited;
   iPagIni   := CmpRptCM.ParamValues[12].AsInteger;
   iPlano    := Modulo.iPlano;
   sPerDataFim  := '';
   sNomeLingua2 := '';
   sNomePer2    := '';
   sNomeLingua1 := '';
   sNomePer1    := '';
   iMes1        := 0;
   iDia1        := 0;
   iAno1        := 0;
   iMes2        := 0;
   iDia2        := 0;
   iAno2        := 0;


   sqlEmpresaProp.Prepare;
   sqlEmpresaProp.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlEmpresaProp.Open;

   //======= abre abre empresa para pegar os nomes dos relatorios =======
   sqlEmpresa.Prepare;
   sqlEmpresa.ParamByName('IDPESSOA').asFloat := CrmRptCM.IdEmpresa;
   sqlEmpresa.Open;
   sNomeRelat1 := cdsEmpresa.FieldByName('NOMERELAT1').AsString;
   sNomeRelat2 := cdsEmpresa.FieldByName('NOMERELAT2').AsString;
   //=====================================================================

   //==== pega dados do demonstrativo, salto de pagina,titulos, etc..=====
   sqlDemoAux.Prepare;
   sqlDemoAux.ParamByName('IDDEMO').asInteger:=StrToInt(CmpRptCM.ParamValues[6].AsString);
   sqlDemoAux.Open;
   sNomeDemo := cdsDemoAux.FieldByName('DEMDESCDEMONSTRAT').asString;
   iDemo     := cdsDemoAux.FieldByName('IDDEMONSTRATIVO').asInteger;
   //=====================================================================

   //===== pega nomes em outra lingua ========
   if CmpRptCM.ParamValues[1].AsString <> '' then
   begin
     sqlPerAux.Prepare;
     sqlPerAux.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
     sqlPerAux.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
     sqlPerAux.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[1].AsString);
     sqlPerAux.Open;
     sNomeLingua1 := cdsPerAux.FieldByName('PERNOMEOUTLING').asString;
     sNomePer1    := cdsPerAux.FieldByName('PERNOME').asString;
     iMes1 :=  StrToInt(CmpRptCM.ParamValues[1].AsString);
   end;

   if CmpRptCM.ParamValues[2].AsString <> '' then
   begin
     sqlPerAux.Prepare;
     sqlPerAux.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
     sqlPerAux.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
     sqlPerAux.ParamByName('PERNUMERO').asInteger    := StrToInt(CmpRptCM.ParamValues[2].AsString);
     sqlPerAux.Open;
     sPerDataFim  := DateToStr(cdsPerAux.FieldByName('PERDATFIM').asDateTime);
     sNomeLingua2 := cdsPerAux.FieldByName('PERNOMEOUTLING').asString;
     sNomePer2    := cdsPerAux.FieldByName('PERNOME').asString;
     iMes2 :=  StrToInt(CmpRptCM.ParamValues[2].AsString);
   end;

   if CmpRptCM.ParamValues[3].AsDateTime <> 0 then
   begin
     DecodeDate(CmpRptCM.ParamValues[3].AsDateTime, iDia1, iMes1, iAno1);

     sqlPerAux.Prepare;
     sqlPerAux.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
     sqlPerAux.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
     sqlPerAux.ParamByName('PERNUMERO').asInteger    := iMes1;
     sqlPerAux.Open;
     sNomeLingua1 := cdsPerAux.FieldByName('PERNOMEOUTLING').asString;
     sNomePer1    := cdsPerAux.FieldByName('PERNOME').asString;
   end;

   if CmpRptCM.ParamValues[4].AsDateTime <> 0 then
   begin
     DecodeDate(CmpRptCM.ParamValues[4].AsDateTime, iDia2, iMes2, iAno2);

     sqlPerAux.Prepare;
     sqlPerAux.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
     sqlPerAux.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
     sqlPerAux.ParamByName('PERNUMERO').asInteger    := iMes2;
     sqlPerAux.Open;
     sPerDataFim  := DateToStr(cdsPerAux.FieldByName('PERDATFIM').asDateTime);
     sNomeLingua2 := cdsPerAux.FieldByName('PERNOMEOUTLING').asString;
     sNomePer2    := cdsPerAux.FieldByName('PERNOME').asString;
   end;
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

   txtEmpDemo41.Caption    := sNomeRelat1;
   txtEmpDemo42.Caption    := sNomeRelat2;
   txtTituloDemo41.Caption := sNomeDemo;

   if CmpRptCM.ParamValues[18].AsBoolean then begin
      sFormato := '#,##0.00';
   end else begin
      sFormato := '#,##0';
   end;

   if CmpRptCM.ParamValues[7].AsString <> '' then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT CODCENTROCUSTO, NOME '+
                         'FROM  CENTCUST '+
                         'WHERE '+
                         '   (IDEMPRESA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                         'ORDER BY CODCENTROCUSTO');
      sqlTitulos.Open;
      sNomeCCusto := CmpRptCM.ParamValues[7].AsString + ' - ' + cdsTitulos.FieldByName('NOME').asString;
   end else
   begin
      sNomeCCusto := '<Todos>';
   end;


   if CmpRptCM.ParamValues[8].AsString <> '' then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT UNIDNEGOC, NOME, UNECODIGO '+
                         'FROM  UNIDNEGOCIO '+
                         'WHERE '+
                         '       (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                         '   AND (UNIDNEGOC = '+CmpRptCM.ParamValues[8].AsString+')'+
                         'ORDER BY UNIDNEGOC');
      sqlTitulos.Open;
      sNomeAtivProj := cdsTitulos.FieldByName('NOME').asString;
   end else
   begin
      sNomeAtivProj := '<Todas>';
   end;

   if CmpRptCM.ParamValues[10].AsString <> '' then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT  IDPLANOPREV,  NOME '+
                         'FROM PLANPREVCONTABIL ' +
                         'WHERE (IDPLANOPREV = ' + CmpRptCM.ParamValues[10].AsString + ') ' +
                         'ORDER BY IDPLANOPREV ');


      sqlTitulos.Open;
      sNomePlano := cdsTitulos.FieldByName('NOME').asString;
   end else
   begin
      sNomePlano := '<Todas>';
   end;

   if CmpRptCM.ParamValues[11].AsString <> '' then
   begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT  PA.IDPESSOA, PE.NOME ' +
                         'FROM  PESSOA PE, PATRO PA '+
                         'WHERE  '+
                         '    (PA.IDPESSOA = PE.IDPESSOA) AND '+
                         '    (PA.IDPESSOA = ' + CmpRptCM.ParamValues[11].AsString + ') ' +
                         'ORDER BY PE.NOME ');



      sqlTitulos.Open;
      sNomePatro := cdsTitulos.FieldByName('NOME').asString;
   end else
   begin
      sNomePatro := '<Todas>';
   end;

   if Sistema.UsaPlanoPatro then
   begin
      if CmpRptCM.ParamValues[15].Asboolean then
      begin
         txtFiltro4.Caption := 'Centro de Custo: ' + sNomeCCusto + '    Ativ.Proj.: ' + sNomeAtivProj+ '    Plano Prev.: ' + sNomePlano+ '    Patrocinadora: ' + sNomePatro;
      end else
      begin
         txtFiltro4.Caption := '';
      end;
   end else
   begin
      if CmpRptCM.ParamValues[15].Asboolean then
      begin
         txtFiltro4.Caption := 'Centro de Custo: ' + sNomecCusto + '    Ativ.Proj.: ' + sNomeAtivProj;
      end else
      begin
         txtFiltro4.Caption := '';
      end;
   end;


   if CmpRptCM.ParamValues[5].AsInteger = 0 then
   begin
      if CmpRptCM.ParamValues[14].AsBoolean then
      begin
         if CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString then
         begin
            txtDataDemo4.Caption := sNomeLingua1 + '/'+ CmpRptCM.ParamValues[0].AsString;
         end else
         begin
            txtDataDemo4.Caption := sNomeLingua1 + '/'+CmpRptCM.ParamValues[0].AsString + ' to ' +
                                    sNomeLingua2 + '/'+CmpRptCM.ParamValues[0].AsString;
         end;
      end else
      begin
        if CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString then begin
           txtDataDemo4.Caption := sNomePer1 + '/'+ CmpRptCM.ParamValues[0].AsString;
        end else
        begin
           txtDataDemo4.Caption := sNomePer1 + '/'+ CmpRptCM.ParamValues[0].AsString + ' a ' +
                                   sNomePer2 + '/'+ CmpRptCM.ParamValues[0].AsString;
        end;
      end;
   end else
   begin
      if CmpRptCM.ParamValues[14].AsBoolean then begin
         txtDataDemo4.Caption := CmpRptCM.ParamValues[3].AsString + ' to ' + CmpRptCM.ParamValues[4].AsString;
      end else begin
         txtDataDemo4.Caption := CmpRptCM.ParamValues[3].AsString + ' a ' + CmpRptCM.ParamValues[4].AsString;
      end;
   end;


   if trim(CmpRptCM.ParamValues[9].AsString) = '' then begin
      txtTituloDemo42.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  '+ Modulo.sSiglaMoedaCorr;
   end else begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT MOECODIGO, MOESIGLA   '+
                         'FROM  MOEDA '+
                         'WHERE ' +
                         '     MOEINATIVO = ''A'' '+
                         'AND  (MOECODIGO = ' + CmpRptCM.ParamValues[9].AsString +') '+
                         'ORDER BY MOECODIGO ');
      sqlTitulos.Open;
      sNomeMoedaReal := cdsTitulos.FieldByName('MOESIGLA').AsString;
      txtTituloDemo42.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  '+sNomeMoeda;
   end;
   txtTituloDemo43.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL2').AsString;

   if CmpRptCM.ParamValues[3].AsDateTime <> 0 then
      sDataI := DateToStr(CmpRptCM.ParamValues[3].AsDateTime)
   else
      sDataI := '';

   if CmpRptCM.ParamValues[4].AsDateTime <> 0 then
      sDataF := DateToStr(CmpRptCM.ParamValues[4].AsDateTime)
   else
      sDataF := '';

   if CtrlRptDemonstrativo.ProcessaDemoModelo4(cdsDemoAux.FieldByName('IDDEMONSTRATIVO').asInteger,
                                               iPlano,
                                               StrToInt(CmpRptCM.ParamValues[0].AsString),
                                               iMes1,
                                               iMes2,
                                               CmpRptCM.ParamValues[13].AsInteger,
                                               cdsDemoAux.FieldByName('DEMNATUREZA').AsString,
                                               CmpRptCM.ParamValues[7].AsString,
                                               CmpRptCM.ParamValues[8].AsString,
                                               CmpRptCM.ParamValues[9].AsString,
                                               sDataI,
                                               SDataF,
                                               sPerDataFim,
                                               CmpRptCM.ParamValues[10].AsString,
                                               CmpRptCM.ParamValues[11].AsString,
                                               sFormato,
                                               CmpRptCM.ParamValues[20].AsString,
                                               CrmRptCM.IdEmpresa,
                                               CmpRptCM.ParamValues[16].AsBoolean,
                                               CmpRptCM.ParamValues[17].AsBoolean,
                                               CmpRptCM.ParamValues[19].AsBoolean) then
   begin
      inherited;

   end;


end;

procedure TrptDemonstrativo4.rptDemonstrativo4Label1Print(Sender: TObject);
begin
  inherited;
  rptDemonstrativo4Label1.Caption := IntToStr((iPagIni + StrToInt(rptDemonstrativo4Calc1.text)) - 1);

end;

procedure TrptDemonstrativo4.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

procedure TrptDemonstrativo4.CmpRptCMParamControlEnter(
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

end.
