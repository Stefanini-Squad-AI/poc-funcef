
unit rDemonstrativo7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, uCmRptManager, TXComp, CmParamReport,
  pptypes,uCtrlContab,uCtrlRptDemonstrativo, TXRB;

type
  TrptDemonstrativo7 = class(TFrmCmReport)
    rptDemonstrativo2: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel42: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    rptDemonstrativo2Line1: TppLine;
    rptDemonstrativo2Line2: TppLine;
    rptDemonstrativo2Label1: TppLabel;
    rptDemonstrativo2Label2: TppLabel;
    rptDemonstrativo2Label3: TppLabel;
    rptDemonstrativo2Label4: TppLabel;
    rptDemonstrativo2Label5: TppLabel;
    rptDemonstrativo2Label6: TppLabel;
    rptDemonstrativo2Label11: TppLabel;
    rptDemonstrativo2Label15: TppLabel;
    rptDemonstrativo2DBImage1: TppDBImage;
    txtFiltro2: TppLabel;
    dbtxtNomeDemo1: TppDBText;
    rptDemonstrativo2DBTx1: TppDBText;
    rptDemonstrativo2DBTx3: TppDBText;
    rptDemonstrativo2Line3: TppLine;
    rptDemonstrativo2DBTx2: TppDBText;
    rptDemonstrativo2DBTx4: TppDBText;
    rptDemonstrativo2DBTx5: TppDBText;
    rptDemonstrativo2DBTx6: TppDBText;
    rptDemonstrativo2DBTx7: TppDBText;
    rptDemonstrativo2DBTx8: TppDBText;
    rptDemonstrativo2DBTx9: TppDBText;
    rptDemonstrativo2DBTx10: TppDBText;
    rptDemonstrativo2DBTx11: TppDBText;
    rptDemonstrativo2DBTx12: TppDBText;
    rptDemonstrativo2DBText1: TppDBText;
    ppFooterBand12: TppFooterBand;
    lblsistema: TppLabel;
    ppLine33: TppLine;
    rptDemonstrativo2Label16: TppLabel;
    rptDemonstrativo2Label17: TppLabel;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    rptDemonstrativo1Group1: TppGroup;
    rptDemonstrativo1GroupHeaderBand1: TppGroupHeaderBand;
    rptDemonstrativo1GroupFooterBand1: TppGroupFooterBand;
    pplDemonstrativo2: TppBDEPipeline;
    pplDemonstrativo1ppField1: TppField;
    pplDemonstrativo1ppField2: TppField;
    pplDemonstrativo1ppField3: TppField;
    pplDemonstrativo1ppField4: TppField;
    pplDemonstrativo1ppField5: TppField;
    pplDemonstrativo1ppField6: TppField;
    pplDemonstrativo1ppField7: TppField;
    pplDemonstrativo1ppField8: TppField;
    pplDemonstrativo1ppField9: TppField;
    pplDemonstrativo1ppField10: TppField;
    pplDemonstrativo1ppField11: TppField;
    pplDemonstrativo1ppField12: TppField;
    pplDemonstrativo1ppField13: TppField;
    pplDemonstrativo1ppField14: TppField;
    pplDemonstrativo1ppField15: TppField;
    pplDemonstrativo1ppField16: TppField;
    pplDemonstrativo1ppField17: TppField;
    pplDemonstrativo1ppField18: TppField;
    pplDemonstrativo1ppField19: TppField;
    pplDemonstrativo1ppField20: TppField;
    pplDemonstrativo1ppField21: TppField;
    pplDemonstrativo1ppField22: TppField;
    pplDemonstrativo1ppField23: TppField;
    pplDemonstrativo1ppField24: TppField;
    pplDemonstrativo1ppField25: TppField;
    pplDemonstrativo1ppField26: TppField;
    pplDemonstrativo1ppField27: TppField;
    pplDemonstrativo1ppField28: TppField;
    pplDemonstrativo1ppField29: TppField;
    pplDemonstrativo1ppField30: TppField;
    pplDemonstrativo1ppField31: TppField;
    pplDemonstrativo1ppField32: TppField;
    pplDemonstrativo1ppField33: TppField;
    pplDemonstrativo1ppField34: TppField;
    pplDemonstrativo1ppField35: TppField;
    pplDemonstrativo1ppField36: TppField;
    pplDemonstrativo1ppField37: TppField;
    pplDemonstrativo1ppField38: TppField;
    pplDemonstrativo1ppField39: TppField;
    pplDemonstrativo1ppField40: TppField;
    pplDemonstrativo1ppField41: TppField;
    dsDemonstrativo2: TwwDataSource;
    cdsDemonstrativo2: TCMClientDataSet;
    cdsPerAux: TCMClientDataSet;
    sqlPerAux: TCMSqlParams;
    cdsTitulos: TCMClientDataSet;
    sqlTitulos: TCMSqlParams;
    sqlDemoAux: TCMSqlParams;
    cdsDemoAux: TCMClientDataSet;
    sqlEmpresa: TCMSqlParams;
    cdsEmpresa: TCMClientDataSet;
    bndDetDemo1: TppDetailBand;
    sqlEmpresaProp: TCMSqlParams;
    cdsEmpresaProp: TCMClientDataSet;
    pplEmpresaProp: TppBDEPipeline;
    dsEmpresaProp: TwwDataSource;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine6: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppHeaderBand12BeforePrint(Sender: TObject);
    procedure bndDetDemo1AfterPrint(Sender: TObject);
    procedure bndDetDemo1BeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rptDemonstrativo2Label17Print(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    procedure CmpRptCMParamControlEnter(Sender: TPainelControles;
      Index: Integer);
  private
    CtrlRptDemonstrativo :TCtrlRptDemonstrativo;
    CtrlContab :TCtrlContab;

    sNomeRelat1,sNomeRelat2,sLinhaAcima,sLinhaAbaixo,sDataIni,sNomeDemo,sNomePerPar1,sNomePerPar2 :string;
    sNomeCCusto,sNomeAtivProj,sPacTipoPerResult,sNomePer1,sNomePer2,sNomeMoedaReal,sNomeMoedaOrc :string;
    bIngles :Boolean;
    iPlano,iPagIni :integer;
    sNomeLingua1,sNomeLingua2,sNomeExerc :string;

  public
    { Public declarations }
  end;

var
  rptDemonstrativo7: TrptDemonstrativo7;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema,
     uModulo, uData, uFuncaoGeral;

{$R *.DFM}

procedure TrptDemonstrativo7.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  if CtrlContab.SelecionaParametros(CrmRptCM.IdEmpresa) then
  begin
     sPacTipoPerResult := CtrlContab.TipoOpEncer;
  end else
  begin
     sPacTipoPerResult := '';
  end;

   iPagIni := CmpRptCM.ParamValues[8].AsInteger;
   bIngles := CmpRptCM.ParamValues[10].AsBoolean;
   iPlano  := Modulo.iPlano;

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

   //===== pega a data inicial do exercicio atual ========
   sqlPerAux.Sql.Clear;
   sqlPerAux.Sql.Add('SELECT PERNUMERO, PERNOME,PERNOMEOUTLING ,PERDATFIM,PERDATINI ');
   sqlPerAux.Sql.Add('FROM PERIODO                                                  ');
   sqlPerAux.Sql.Add('WHERE (IDPESSOA =:IDPESSOA) AND  (PEREXERCICIO=:PEREXERCICIO) ');
   sqlPerAux.Sql.Add('ORDER BY PERNUMERO                                            ');

   sqlPerAux.Prepare;
   sqlPerAux.ParamByName('IDPESSOA').asFloat       := CrmRptCM.IdEmpresa;
   sqlPerAux.ParamByName('PEREXERCICIO').asInteger := StrToInt(CmpRptCM.ParamValues[0].AsString);
   sqlPerAux.Open;
   sDataIni     := DateToStr((cdsPerAux.FieldByName('PERDATINI').asDateTime-1));

   //===== pega nomes em outra lingua ========
   sqlPerAux.Sql.Clear;
   sqlPerAux.Sql.Add('SELECT PERNUMERO, PERNOME,PERNOMEOUTLING ,PERDATFIM,PERDATINI ');
   sqlPerAux.Sql.Add('FROM PERIODO ');
   sqlPerAux.Sql.Add('WHERE (IDPESSOA =:IDPESSOA) AND (PEREXERCICIO=:PEREXERCICIO) AND (PERNUMERO=:PERNUMERO) ');
   sqlPerAux.Sql.Add('ORDER BY PERNUMERO ');

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

   ppLabel42.Caption := sNomeRelat1;
   ppLabel54.Caption := sNomeRelat2;
   ppLabel55.Caption := sNomeDemo;

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
                         '   (IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') '+
                         '   AND (UNIDNEGOC = '+CmpRptCM.ParamValues[5].AsString+')'+
                         ' ORDER BY UNIDNEGOC');
      sqlTitulos.Open;
      sNomeAtivProj := cdsTitulos.FieldByName('NOME').asString;
   end else
   begin
      sNomeAtivProj := '<Todas>';
   end;

   if CmpRptCM.ParamValues[11].AsBoolean then begin
      txtFiltro2.Caption := 'Centro de Custo: ' + sNomeCCusto  + '    Ativ.Proj.: ' + sNomeAtivProj;
   end else begin
      txtFiltro2.Caption := '';
   end;

   if CmpRptCM.ParamValues[10].AsBoolean then begin
      sNomePerPar1 := sNomeLingua1;
      sNomePerPar1 := sNomeLingua2;
      if CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString then begin
         ppLabel48.Caption := sNomeLingua1 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end else begin
         ppLabel48.Caption := sNomeLingua1 + '/'+CmpRptCM.ParamValues[0].AsString + ' to ' +
                              sNomeLingua2 + '/'+CmpRptCM.ParamValues[0].AsString;
      end;
   end else begin
      sNomePerPar1 := sNomePer1;
      sNomePerPar1 := sNomePer2;
      if CmpRptCM.ParamValues[1].AsString = CmpRptCM.ParamValues[2].AsString then begin
         ppLabel48.Caption := sNomePer1 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end else begin
         ppLabel48.Caption := sNomePer1 + '/'+ CmpRptCM.ParamValues[0].AsString + ' a ' +
                                                    sNomePer2 + '/'+ CmpRptCM.ParamValues[0].AsString;
      end;
   end;

   if trim(CmpRptCM.ParamValues[6].AsString) = '' then begin
      rptDemonstrativo2Label1.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  ' + Modulo.sSiglaMoedaCorr;
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
      rptDemonstrativo2Label1.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL').AsString +'  ' + cdsTitulos.FieldByName('MOESIGLA').AsString;
   end;

   if trim(CmpRptCM.ParamValues[7].AsString) <> '' then begin
      sqlTitulos.SQL.Clear;
      sqlTitulos.SQL.Add('SELECT MOECODIGO, MOESIGLA   '+
                         'FROM  MOEDA '+
                         'WHERE ' +
                         '     MOEINATIVO = ''A'' '+
                         'AND  (MOECODIGO = ' + CmpRptCM.ParamValues[7].AsString +') '+
                         'ORDER BY MOECODIGO ');
      sqlTitulos.Open;
      sNomeMoedaOrc := cdsTitulos.FieldByName('MOESIGLA').AsString;
   end;
   rptDemonstrativo2Label15.Caption := cdsDemoAux.FieldByName('DEMTITULOCOMPL2').AsString;

   if CtrlRptDemonstrativo.ProcessaDemoModelo2(cdsDemoAux.FieldByName('IDDEMONSTRATIVO').asInteger,
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
                                               sNomePerPar1,
                                               sNomePerPar2,
                                               sNomeDemo,
                                               sNomeMoedaReal,
                                               sNomeMoedaOrc,
                                               CmpRptCM.ParamValues[14].AsString,
                                               CrmRptCM.IdEmpresa,
                                               CmpRptCM.ParamValues[13].AsBoolean,
                                               CmpRptCM.ParamValues[12].AsBoolean,
                                               CmpRptCM.ParamValues[9].AsBoolean) then

   begin
      inherited;

   end;

end;

procedure TrptDemonstrativo7.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptDemonstrativo := TCtrlRptDemonstrativo.Create;
  CtrlRptDemonstrativo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);


  CtrlRptDemonstrativo.cdsDemonstrativo := cdsDemonstrativo2;

end;

procedure TrptDemonstrativo7.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRptDemonstrativo.Free;
  CtrlContab.free;
end;

procedure TrptDemonstrativo7.ppHeaderBand12BeforePrint(
  Sender: TObject);
begin
  inherited;
   if bIngles then begin
      rptDemonstrativo2Label2.caption  := 'C U R R E N T   M O N T H';
      rptDemonstrativo2Label3.caption  := 'BUDGET';
      rptDemonstrativo2Label4.caption  := 'ACTUAL';
      rptDemonstrativo2Label5.caption  := 'L.YEAR';
      rptDemonstrativo2Label6.caption  := 'Y E A R   T O   D A T E';
      ppLabel49.caption                := 'BUDGET';
      ppLabel50.caption                := 'ACTUAL';
      ppLabel53.caption                := 'L.YEAR';
   end else begin
      rptDemonstrativo2Label2.caption  := 'P E R Í O D O   C O R R E N T E';
      rptDemonstrativo2Label3.caption  := 'ORÇADO';
      rptDemonstrativo2Label4.caption  := 'REALIZADO';
      rptDemonstrativo2Label5.caption  := 'EX.ANT.';
      rptDemonstrativo2Label6.caption  := 'A C U M U L A D O   N O   E X E R C Í C I O';
      ppLabel49.caption                := 'ORÇADO';
      ppLabel50.caption                := 'REALIZADO';
      ppLabel53.caption                := 'EX.ANT.';
   end;

   if Modulo.sLinhaAcima = 'N' then begin
      rptDemonstrativo2Line1.Visible := False;
   end else begin
      rptDemonstrativo2Line1.Visible := True;
      if sLinhaAcima = 'V' then begin
         rptDemonstrativo2Line1.Width := 188384;
         rptDemonstrativo2Line1.Left  := 83079;
      end else begin
         rptDemonstrativo2Line1.Left  := 0;
         if sLinhaAcima = 'T' then begin
            rptDemonstrativo2Line1.Width := 81756;
         end else begin
            rptDemonstrativo2Line1.Width := 271463;
         end;
      end;
   end;
   //
   if sLinhaAbaixo = 'N' then begin
      rptDemonstrativo2Line2.Visible := False;
   end else begin
      rptDemonstrativo2Line2.Visible := True;
      if sLinhaAbaixo = 'V' then begin
         rptDemonstrativo2Line2.Width := 188384;
         rptDemonstrativo2Line2.Left  := 83079;
      end else begin
         rptDemonstrativo2Line2.Left  := 0;
         if sLinhaAbaixo = 'T' then begin
            rptDemonstrativo2Line2.Width := 81756;
         end else begin
            rptDemonstrativo2Line2.Width := 271463;
         end;
      end;
   end;

end;

procedure TrptDemonstrativo7.bndDetDemo1AfterPrint(Sender: TObject);
begin
  inherited;
  if cdsDemonstrativo2.FieldByName('FLGSALTAPAGINA').asString = 'S' then begin
     //Ver comando para saltar pagina
  end;

end;

procedure TrptDemonstrativo7.bndDetDemo1BeforePrint(Sender: TObject);
var sFormatoNeg, sFormatoPos, sForPerNeg, sForPerPos : string;
begin
   inherited;
   //imprime as contas indentadas
   if cdsDemonstrativo2.FieldByName('FLGINDENTACAO').asString <> '' then
      dbtxtNomeDemo1.left := (114036 + (4000 * StrToInt(cdsDemonstrativo2.FieldByName('FLGINDENTACAO').asString)));

   CtrlRptDemonstrativo.EspecificaParametros(Self,cdsDemonstrativo2.FieldByName('ELETIPOELEM').asString,cdsDemonstrativo2.FieldByName('FLGNEGRITO').asString,bndDetDemo1);

   //imprime as linhas separadoras de acordo com o tipo
   rptDemonstrativo2Line3.Visible := False;
   rptDemonstrativo2Line3.Height  := 1852 ;
   bndDetDemo1.Height             := 4600;
   //
   if cdsDemonstrativo2.FieldByName('FLGDECIMAIS').asString = 'S' then begin
      sFormatoPos := '#,0.00';
      if cdsDemonstrativo2.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
         sFormatoNeg := '-#,0.00';
      end else begin
         sFormatoNeg := '(#,0.00)';
      end;
   end else begin
      sFormatoPos := '#,0';
      if cdsDemonstrativo2.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
         sFormatoNeg := '-#,0';
      end else begin
         sFormatoNeg := '(#,0)';
      end;
   end;

   sForPerPos := '#,0.00';
   if cdsDemonstrativo2.FieldByName('FLGTIPONEGATIVO').asString = 'M' then begin
      sForPerNeg := '-#,0.00';
   end else begin
      sForPerNeg := '(#,0.00)';
   end;

   rptDemonstrativo2DBTx1.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   rptDemonstrativo2DBTx2.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   rptDemonstrativo2DBTx3.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   rptDemonstrativo2DBTx4.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   rptDemonstrativo2DBTx5.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;
   rptDemonstrativo2DBTx6.DisplayFormat := sFormatoPos + ';' + sFormatoNeg;

   //Percentuais
   rptDemonstrativo2DBTx7.DisplayFormat := sForPerPos + ';' + sForPerNeg;
   rptDemonstrativo2DBTx8.DisplayFormat := sForPerPos + ';' + sForPerNeg;
   rptDemonstrativo2DBTx9.DisplayFormat := sForPerPos + ';' + sForPerNeg;
   rptDemonstrativo2DBTx10.DisplayFormat := sForPerPos + ';' + sForPerNeg;
   rptDemonstrativo2DBTx11.DisplayFormat := sForPerPos + ';' + sForPerNeg;
   rptDemonstrativo2DBTx12.DisplayFormat := sForPerPos + ';' + sForPerNeg;

   if cdsDemonstrativo2.FieldByName('FLGTIPOLINHA').asString = 'X' then begin
      bndDetDemo1.visible := false;
   end else begin
      bndDetDemo1.visible := true;
   end;

   if cdsDemonstrativo2.FieldByName('FLGTIPOLINHA').asString = 'N' then begin
      bndDetDemo1.Height := 4600;
   end;

   if cdsDemonstrativo2.FieldByName('FLGTIPOLINHA').asString = 'E' then begin
      bndDetDemo1.Height := 7408;
   end;

   if cdsDemonstrativo2.FieldByName('FLGTIPOLINHA').asString = 'F' then begin
      bndDetDemo1.Height               := 7408;
      rptDemonstrativo2Line3.Visible   := True;
      rptDemonstrativo2Line3.Style     := lsSingle;
      rptDemonstrativo2Line3.Weight    := 1;
   end;

   if cdsDemonstrativo2.FieldByName('FLGTIPOLINHA').asString = 'D' then begin
      bndDetDemo1.Height             := 7408;
      rptDemonstrativo2Line3.Visible := True;
      rptDemonstrativo2Line3.Style   := lsDouble;
      rptDemonstrativo2Line3.Weight  := 1;
   end;

   if cdsDemonstrativo2.FieldByName('FLGTIPOLINHA').asString = 'G' then begin
      bndDetDemo1.Height             := 7408;
      rptDemonstrativo2Line3.Visible := True;
      rptDemonstrativo2Line3.Style   := lsSingle;
      rptDemonstrativo2Line3.Weight  := 2;
   end;

   if rptDemonstrativo2Line3.Visible then begin
      if copy(cdsDemonstrativo2.FieldByName('FLGTRACO').asString,2,1) = 'A' then begin
         rptDemonstrativo2Line3.Top := 265 ;
      end else begin
         rptDemonstrativo2Line3.Top := 4600 ;
      end;

      if copy(cdsDemonstrativo2.FieldByName('FLGTRACO').asString,1,1) = 'V' then begin
         rptDemonstrativo2Line3.Width := 188119;
         rptDemonstrativo2Line3.Left  := 83344;
      end else begin
         if copy(cdsDemonstrativo2.FieldByName('FLGTRACO').asString,1,1) = 'T' then begin
            rptDemonstrativo2Line3.Visible := False;
            if cdsDemonstrativo2.FieldByName('FLGNEGRITO').asString = 'S' then begin
               dbtxtNomeDemo1.Font.Style :=[fsBold,fsUnderline];
            end else begin
               dbtxtNomeDemo1.Font.Style :=[fsUnderline];
            end;
         end else begin
            rptDemonstrativo2Line3.Left  := 0;
            rptDemonstrativo2Line3.Width := 271463;
         end;
      end;
   end;

end;

procedure TrptDemonstrativo7.CmpRptCMBeforeExecute(
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

procedure TrptDemonstrativo7.rptDemonstrativo2Label17Print(
  Sender: TObject);
begin
  inherited;
  rptDemonstrativo2Label17.Caption := IntToStr((iPagIni + StrToInt(ppCalc23.text)) - 1);

end;

procedure TrptDemonstrativo7.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
begin
  inherited;
   case Index of
      0: sNomeExerc :=Trim(TPainelControles(Sender).CtrlLookup.Text);
   end;

end;

procedure TrptDemonstrativo7.CmpRptCMParamControlEnter(
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
