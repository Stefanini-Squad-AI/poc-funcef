unit rAnaliticoCotasDiarias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppCtrls, ppBands, ppReport, ppStrtch, ppSubRpt, ppPrnabl,
  ppClass, ppCache, ppDB, ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd,
  uCmRptManager, TXComp, TXRB, CmParamReport, ppModule, raCodMod,
  ppParameter, ppVar, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  uSistema, DBaseDados, uFuncaoGeral;

type
  TrptAnaliticoCotasDiarias = class(TFrmCmReport)
    rptAnaliticoCotPag: TppReport;
    ppBDECota: TppBDEPipeline;
    ppParameterList1: TppParameterList;
    sqlCota: TCMSqlParams;
    cdsCota: TCMClientDataSet;
    dtsCota: TDataSource;
    sqlSaldo: TCMSqlParams;
    cdsSaldo: TCMClientDataSet;
    cdsSaldoCota: TCMClientDataSet;
    sqlSaldoCota: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel20: TppLabel;
    ppDBText11: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppCota: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape5: TppShape;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel21: TppLabel;
    ppLine3: TppLine;
    lblCotaSaldoAbertura: TppLabel;
    lblCotaQtdCotas: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppLabel19: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    raCodeModule3: TraCodeModule;
    ppContaCorrente: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape3: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppFooterBand1: TppFooterBand;
    ppLabel123: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel13: TppLabel;
    lblSaldoAbertura: TppLabel;
    lblEntradas: TppLabel;
    lblSaidas: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    sqlSaldoDet: TCMSqlParams;
    cdsSaldoDet: TCMClientDataSet;
    dsSaldoDet: TDataSource;
    ppBDESaldoDet: TppBDEPipeline;
    sqlCCDet: TCMSqlParams;
    cdsCCDet: TCMClientDataSet;
    dsCCDet: TDataSource;
    ppBDECCDet: TppBDEPipeline;
    ppLine7: TppLine;
    ppLabel22: TppLabel;
    lblCCValor: TppLabel;
    cdsQuery: TCMClientDataSet;
    sqlQuery: TCMSqlParams;
    CdsLogo: TCMClientDataSet;
    dsLogo: TDataSource;
    pplLogo: TppDBPipeline;
    SqlLogo: TCMSqlParams;
    ppDBImage1: TppDBImage;
    ppDBText2: TppDBText;
    ppLabel23: TppLabel;
    ppLine8: TppLine;
    ppLabel12: TppLabel;
    lblSaldoAplicFechamento: TppLabel;
    ppLabel2: TppLabel;
    ppLine4: TppLine;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppCotaPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppContaCorrentePrint(Sender: TObject);
    procedure cdsCotaAfterOpen(DataSet: TDataSet);
    procedure cdsCotaBeforeScroll(DataSet: TDataSet);
  private
    NRENTRRENT, NRSAIDARENT, NRSLDAPLICADO,
    NRSALDOANTCTA, NRSALDOATUCTA, NRSLDATIVOANT : String;
  public
    fCotaAnt    : extended;
    fFechaConta : extended;
  end;

var
  rptAnaliticoCotasDiarias: TrptAnaliticoCotasDiarias;

implementation

{$R *.DFM}

procedure TrptAnaliticoCotasDiarias.CrmRptCMBeforePrint(Sender: TObject);
var
  ativo, idSituacao: integer;
  Dtini, Dtfim:string;
begin
  inherited;
  ativo := CmpRptCM.ParamValues[0].AsInteger;
  Dtini := trim( CmpRptCM.ParamValues[1].AsString );
  Dtfim := trim( CmpRptCM.ParamValues[2].AsString );
  idSituacao := CmpRptCM.ParamValues[3].AsInteger;


  with sqlCota, sqlCota.sql do
  begin
    close;
    clear;
    add(' SELECT IDCPVALORCOTA, IDCPATIVO, QUERYENTRADA, VALOR, DTCOTA, NRSLDATIVOANT, ');
    add(' NRENTRRENT, NRSAIDARENT, FLGVALIDO, NRSLDAPLICADO, NRSALDOANTCTA, NRSALDOATUCTA  ');
    add(' FROM CPVALORCOTA ');
    add(' WHERE 1 = 1 ');

    if Dtini <> '' then
       add('       and  DTCOTA  >= to_date( '+ QuotedStr(Dtini) +', ''dd/mm/yyyy'' )');

    if Dtfim <> '' then
       add('       and  DTCOTA  <= to_date( '+ QuotedStr(Dtfim) +', ''dd/mm/yyyy'' )');

    add('          and IDCPATIVO = ' + inttostr(ativo));

    if idSituacao = 1 then
      add('        and FLGSTATUS = ''C'' ');     // Calculada
    if idSituacao = 2 then
       add('       and FLGSTATUS = ''P'' ');    // Pendente de divulgação
    if idSituacao = 3 then
       add('       and FLGSTATUS = ''U'' ');     // Divulgação recusada
    if idSituacao = 4 then
       add('       and FLGSTATUS = ''D'' ');     // Divulgada
    if idSituacao = 5 then
       add('       and FLGSTATUS = ''N'' ');     // Pendente de recálculo
    if idSituacao = 6 then
       add('       and FLGSTATUS = ''O'' ');     // Recálculo recusado
    if idSituacao= 7 then
       add('       and FLGSTATUS = ''R'' ');     // Recalculada
    if idSituacao = 8 then
       add('       and FLGVALIDO = ''S'' ');     // Apenas as válidas

    add(' ORDER BY DTCOTA, FLGVALIDO, IDCPVALORCOTA '); 
    prepare;
    open;
  end;
  
  sqlSaldoDet.open;
  sqlCCDet.open;
 
end;

procedure TrptAnaliticoCotasDiarias.ppGroupHeaderBand1BeforePrint( Sender: TObject);
begin
  inherited;
  NRENTRRENT    := cdsCota.fieldbyname('NRENTRRENT').AsString;
  NRSAIDARENT   := cdsCota.fieldbyname('NRSAIDARENT').AsString;
  NRSLDAPLICADO := cdsCota.fieldbyname('NRSLDAPLICADO').AsString;
  NRSALDOANTCTA := cdsCota.fieldbyname('NRSALDOANTCTA').AsString;
  NRSALDOATUCTA := cdsCota.fieldbyname('NRSALDOATUCTA').AsString;
  NRSLDATIVOANT := cdsCota.fieldbyname('NRSLDATIVOANT').AsString;

  lblEntradas.Caption             := '0,00';
  lblSaidas.Caption               := '0,00';
  lblSaldoAplicFechamento.caption := '0,00';
  lblSaldoAbertura.Caption        := '0,00';
  lblCCValor.caption              := '0,00';
  lblCotaQtdCotas.Caption         := '0,000000';
  lblCotaSaldoAbertura.caption    := '0,00';

  if trim( cdsCota.fieldbyname('QUERYENTRADA').AsString ) <> '' then
  begin
    cdsQuery.close;
    sqlQuery.sql.clear;
    sqlQuery.sql.Add( cdsCota.fieldbyname('QUERYENTRADA').AsString );
    sqlQuery.prepare;
    sqlQuery.open;

    lblEntradas.Caption             := formatfloat( '#,##0.00', cdsQuery.fieldByName( NRENTRRENT ).AsFloat      );
    lblSaidas.Caption               := formatfloat( '#,##0.00', cdsQuery.fieldByName( NRSAIDARENT ).AsFloat     );
    lblSaldoAplicFechamento.caption := formatfloat( '#,##0.00', cdsQuery.fieldByName( NRSLDAPLICADO ).AsFloat   );
    lblSaldoAbertura.Caption        := formatfloat( '#,##0.00', cdsQuery.fieldByName( NRSLDAPLICADO ).AsFloat - cdsQuery.fieldByName(NRSAIDARENT).Asfloat  - cdsQuery.fieldByName(NRENTRRENT).AsFloat );

    lblCCValor.caption              := formatfloat( '#,##0.00', cdsQuery.fieldByName( NRSALDOANTCTA ).AsFloat );
    fFechaConta                     := cdsQuery.fieldByName( NRSALDOATUCTA ).AsFloat;

    lblCotaQtdCotas.Caption         := formatFloat( '#,##0.000000', cdsQuery.fieldbyname( NRSLDATIVOANT ).AsFloat );
    lblCotaSaldoAbertura.caption    := formatFloat( '#,##0.00', cdsQuery.fieldbyname( NRSLDATIVOANT ).asFloat * fCotaAnt );

    ppContaCorrente.Visible := True;
  end
  else
    ppContaCorrente.Visible := False;
end;


procedure TrptAnaliticoCotasDiarias.ppCotaPrint(Sender: TObject);
begin
  inherited;
  cdsSaldoDet.close;
  sqlSaldoDet.sql.clear;
  sqlSaldoDet.sql.add(' SELECT CC.DESCRICAO, SUM(CP.SALDOCOTAS) AS SALDO, (SUM(CP.SALDOCOTAS) * '+ FuncaoGeral.OraNumero(strtofloat(formatFloat('#,##0.000000', cdsCota.fieldbyname('VALOR').AsFloat))) +') AS VALOR ');
  sqlSaldoDet.sql.add('  FROM CPSALDOCONTA CP, CPVALORCOTA CV, CPCONTA CC ');
  sqlSaldoDet.sql.add('  WHERE CP.DTSALDO = TO_DATE('+QuotedStr( cdsCota.fieldbyname('DTCOTA').AsString )+',''DD/MM/YYYY'') ');
  sqlSaldoDet.sql.add('  AND CP.IDCPVALORCOTA = CV.IDCPVALORCOTA ');
  sqlSaldoDet.sql.add('  AND CP.IDCPCONTA = CC.IDCPCONTA ');
  sqlSaldoDet.sql.add('  AND CV.FLGVALIDO = ''S'' ');
  sqlSaldoDet.sql.add('  GROUP BY CC.DESCRICAO ');
  sqlSaldoDet.prepare;
  sqlSaldoDet.open;
end;


procedure TrptAnaliticoCotasDiarias.FormCreate(Sender: TObject);
begin
  inherited;
  SqlLogo.SQL.Text :=
   ' SELECT I.IMAGEM, P.RAZAOSOCIAL ' +
   ' FROM ' +
   '    IMAGENS I, ' +
   '    PESSOA P ' +
   ' WHERE ' +
   '    (P.IDIMAGEM = I.IDIMAGEM) AND ' +
   '    (P.IDPESSOA = ' + IntToStr( Sistema.IdEmpresa ) + ' ) ';

  SqlLogo.Open;
end;


procedure TrptAnaliticoCotasDiarias.ppContaCorrentePrint(Sender: TObject);
begin
  inherited;
  cdsCCDet.close;
  sqlCCDet.sql.clear;
  sqlCCDet.sql.add(' SELECT CM.NOME, ');
  sqlCCDet.sql.add(' DECODE(CO.FLGTPMOVIM, ''T'', ''Transferência'', ''C'', ''Cotização'', ''R'', ''Rentabilidade'', ''Outra operação'' ) AS TIPO, ');
  sqlCCDet.sql.add(' DECODE(CO.FLGENTSAI, ''S'',SUM(CO.VALOR)*-1, SUM(CO.VALOR)) AS VALOR, ');
  sqlCCDet.sql.add(' 1 AS ORDEM ');
  sqlCCDet.sql.add(' FROM CPVALORCOTA CV, CPEXECROT CE, CPROTAPURADO CR, CPROTAPRMOV CO, CPTIPOMOVIM CM ');
  sqlCCDet.sql.add(' WHERE CV.IDCPVALORCOTA = CE.IDCPVALORCOTA ');
  sqlCCDet.sql.add('       AND CE.IDCPEXECROT = CR.IDCPEXECROT ');
  sqlCCDet.sql.add('       AND CR.IDCPROTAPURADO = CO.IDCPROTAPURADO ');
  sqlCCDet.sql.add('       AND CO.IDCPTIPOMOVIM = CM.IDCPTIPOMOVIM ');
  sqlCCDet.sql.add('       AND  CV.DTCOTA  = to_date( ' + QuotedStr(cdsCota.fieldbyname('DTCOTA').AsString) + ', ''dd/mm/yyyy'' )');
  sqlCCDet.sql.add('       AND  CO.FLGTPMOVIM  in ( ''R'', ''C'' ) ');
  sqlCCDet.sql.add(' GROUP BY CM.NOME, CO.FLGENTSAI, ');
  sqlCCDet.sql.add('       DECODE(CO.FLGTPMOVIM, ''T'', ''Transferência'', ''C'', ''Cotização'', ''R'', ''Rentabilidade'', ''Outra operação'') ');
  sqlCCDet.sql.add(' ORDER BY ORDEM ');
  sqlCCDet.prepare;
  sqlCCDet.open;

  cdsCCDet.Append;
  cdsCCDet.FieldByName('NOME').AsString  := 'Saldo de fechamento';
  cdsCCDet.FieldByName('VALOR').AsFloat  := fFechaConta;
  cdsCCDet.FieldByName('ORDEM').AsFloat  := 2;
  cdsCCDet.Post;
end;


procedure TrptAnaliticoCotasDiarias.cdsCotaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  fCotaAnt    := 0;
  fFechaConta := 0;
end;


procedure TrptAnaliticoCotasDiarias.cdsCotaBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  fCotaAnt    := cdsCota.fieldbyname('VALOR').AsFloat;
  fFechaConta := 0;
end;


end.
