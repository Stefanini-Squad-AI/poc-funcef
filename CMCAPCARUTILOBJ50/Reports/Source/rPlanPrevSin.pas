//  Daniel Simões em 12/01/2006 - P: 15394 --------------------------------
//  1=> Não foi preciso adicionar o campo CODEXTERNO no select porque o relatório
//      não exibe o conteúdo desse campo.
//  2=> Adicionado um ORDER BY no select executado no BeforeExecute do componente
//      CmpRptCM para que o centro de responsabilidade seja exibido em ordem
//      alfabética.
Unit rPlanPrevSin;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, Wwdatsrc, DBTables, ppCtrls, ppBands, ppVar,
  ppMemo, ppStrtch, ppRegion, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra, CMProcuraSubTipo,
  TXRB;

Type
  TRptPlanPrevSin = Class(TFrmCmReport)
    ppPrevsint: TppBDEPipeline;
    rpPrevSint: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    rpPrevSintRegion1: TppRegion;
    rpPrevSintMemo1: TppMemo;
    rpPrevSintRegion2: TppRegion;
    rpPrevSintLabel6: TppLabel;
    rpPrevSintLabel1: TppLabel;
    rpPrevSintLabel2: TppLabel;
    rpPrevSintLine1: TppLine;
    ppDetailBand2: TppDetailBand;
    rpPrevSintDBText1: TppDBText;
    rpPrevSintDBText2: TppDBText;
    rpPrevSintDBText3: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine4: TppLine;
    ppLabel5: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    rpPrevSintSummaryBand1: TppSummaryBand;
    rpPrevSintLabel3: TppLabel;
    rpPrevSintDBCalc1: TppDBCalc;
    rpPrevSintDBCalc2: TppDBCalc;
    dsprevsint: TwwDataSource;
    SqlPrevSint: TCMSqlParams;
    CdsPrevSint: TCMClientDataSet;
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
    Procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
    Procedure FormCreate(Sender: TObject);
    Procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    sFavorevido, sCentroRespon, sPlano: String;
  public
    { Public declarations }
  End;

Var
  RptPlanPrevSin: TRptPlanPrevSin;

Implementation

{$R *.DFM}

Procedure TRptPlanPrevSin.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Begin
  Inherited;
  If ParamIntegra.recpag = 'R' Then
  Begin
    CmpRptCM.ParamValues[0].Caption := 'Cliente';
    CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcCliente;
    CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  End
  Else
  Begin
    CmpRptCM.ParamValues[0].Caption := 'Favorecido';
    CmpRptCM.ParamValues[0].ProcuraFCSettings.ForCli := fcFornecedor;
    CmpRptCM.ParamValues[0].ProcuraFCSettings.CampoEdit := ceRazaoSocial;
  End;
  CmpRptCM.ParamValues[1].TextDefault := DateToStr(date);
  CmpRptCM.ParamValues[2].TextDefault := DateToStr(date);
  CmpRptCM.ParamValues[5].LookupSettings.SQL.text :=
    '  SELECT CODEXTERNO AS CODCENTRORESPON,NOME,ANALITICOSINTET, CODCENTROCUSTO ' + #13 +
    ' FROM CENTRESPON ' + #13 +
    '     where idpessoa=' + Floattostr(CrmRptCM.IdEmpresa) + ' order by NOME';
  CmpRptCM.ParamValues[6].LookupSettings.SQL.text :=
    '  SELECT IDPLANOPREV, NOME FROM PLANPREVCONTABIL ORDER BY NOME';
End;

Procedure TRptPlanPrevSin.CmpRptCMParamControlExit(
  Sender: TPainelControles; Index: Integer);
Begin
  Inherited;
  Case Index Of
    0: sFavorevido := TPainelControles(Sender).CtrlLookup.Text;
    5: sCentroRespon := TPainelControles(Sender).CtrlLookup.Text;
    6: sPlano := TPainelControles(Sender).CtrlLookup.Text;
  End;
End;

Procedure TRptPlanPrevSin.FormCreate(Sender: TObject);
Begin
  Inherited;
  sFavorevido := '';
  sCentroRespon := '';
  sPlano := '';
End;

Procedure TRptPlanPrevSin.CrmRptCMBeforePrint(Sender: TObject);
Var
  speriodo, ssql, ssqlcentrespon: String;
Begin
  Inherited;
  If Not (((Not CmpRptCM.ParamValues[1].IsNull) And (Not
    CmpRptCM.ParamValues[2].IsNull) Or ((Not CmpRptCM.ParamValues[3].IsNull) And
    (Not CmpRptCM.ParamValues[4].IsNull)))) Then
  Begin
    exit;
  End;
  If ((Not CmpRptCM.ParamValues[1].IsNull) Or (Not
    CmpRptCM.ParamValues[2].IsNull)) Then
    speriodo := ' l.datalancto>=' + #39 + CmpRptCM.ParamValues[1].AsString + #39
      + ' and l.datalancto<=' + #39 + CmpRptCM.ParamValues[2].AsString + #39 +
      ' and ';

  If (Not CmpRptCM.ParamValues[3].IsNull) And (Not
    CmpRptCM.ParamValues[4].IsNull) Then
    speriodo := speriodo + ' d.dataprogramada>=' + #39 +
      CmpRptCM.ParamValues[3].AsString + #39 + ' and d.dataprogramada<=' + #39 +
      CmpRptCM.ParamValues[1].AsString + #39 + ' and ';

  rpPrevSintMemo1.lines.clear;
  rpPrevSintMemo1.lines.add('Período ' + CmpRptCM.ParamValues[1].AsString +
    ' até ' + CmpRptCM.ParamValues[2].AsString);
  If (Not CmpRptCM.ParamValues[3].IsNull) And (Not
    CmpRptCM.ParamValues[4].IsNull) Then
    rpPrevSintMemo1.lines.add('Data Vencto ' + CmpRptCM.ParamValues[3].AsString +
      ' até ' + CmpRptCM.ParamValues[4].AsString);

  If CmpRptCM.ParamValues[0].AsInteger <> 0 Then
  Begin
    ssql := ssql + ' d.idforcli= ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ' and ';
    rpPrevSintMemo1.lines.add(CmpRptCM.ParamValues[0].caption + ' ' +
      sFavorevido);
  End;
  If Not CmpRptCM.ParamValues[7].IsNull Then
  Begin
    ssql := ssql + ' round(l.valor,2)= :valor  and ';
    rpPrevSintMemo1.lines.add('Valor ' +
      floattostr(CmpRptCM.ParamValues[7].AsFloat));
  End;
  If Not CmpRptCM.ParamValues[8].IsNull Then
  Begin
    ssql := ssql + ' d.numapgr =' + CmpRptCM.ParamValues[8].AsString + ' and ';
    rpPrevSintMemo1.lines.add('Ap/Gr ' + CmpRptCM.ParamValues[8].AsString);
  End;
  If Not CmpRptCM.ParamValues[5].IsNull Then
  Begin
    ssqlcentrespon := ' rtrim(r.codcentrorespon)=' + #39 +
      CmpRptCM.ParamValues[5].AsString + #39 + ' and';
    rpPrevSintMemo1.lines.add('Centro Responsabilidade ' + sCentroRespon);
  End;
  If Not CmpRptCM.ParamValues[6].IsNull Then
  Begin
    ssqlcentrespon := ssqlcentrespon + ' r.idplanoprev=' + #39 +
      CmpRptCM.ParamValues[6].AsString + #39 + ' and';
    rpPrevSintMemo1.lines.add('Previdência ' + sPlano);
  End;
  SqlPrevSint.sql.clear;
  SqlPrevSint.sql.add('select sum(valorbruto) as valorbruto, sum(valorliquido) as valorliquido, nomepp  ' +
    '   from  ' +
    '     (select sum(r.valor) as valorbruto, sum(r.valor*saldo.valor/l.valor) as valorliquido,  ' +
    '         pp.nome as nomepp ' +
    '       from documento d, lanctodocum l , rateiodocum r, centrespon cr, PLANPREVCONTABIL pp, pessoa p ,  ' +
    '       (select d.coddocumento, sum(decode(d.recpag,''' + ParamIntegra.recpag
    +
    ''', (decode(lan.debcre,''D'',lan.valor*-1,lan.valor)) , (decode(lan.debcre,''C'',lan.valor*-1,lan.valor)))) as valor  ' +
    ' from documento d,lanctodocum l ,lanctodocum lan where ' + speriodo +
    ' l.operacao=d.operacao and lan.coddocumento=d.coddocumento and rtrim(lan.operacao) not in (''5'',''15'') and d.recpag=''' +
    ParamIntegra.recpag + ''' and d.idpessoa=' + FloattoStr(CrmRptCM.IdEmpresa) +
    ' and d.coddocumento=l.coddocumento and d.numfatura is null group by d.coddocumento) saldo   ' +
    ' where d.coddocumento=l.coddocumento and d.coddocumento=r.coddocumento and  r.codcentrorespon=cr.codcentrorespon and ' +
    ' r.idplanoprev =pp.idplanoprev and d.idforcli=p.idpessoa and d.operacao=l.operacao and l.valor <> 0 and    ' +
    ' d.numfatura is null and  ' + speriodo + ' d.recpag=''' +
    ParamIntegra.recpag + ''' and d.idpessoa=' +
    FloattoStr(CrmRptCM.IdEmpresa) + ' and l.estorno is null and  ' + ssql +
    ssqlcentrespon +
    ' d.coddocumento=saldo.coddocumento group by pp.nome ' +
    ' union all     ' +
    ' select sum(r.valor*parcela.valor/l.valor) as valorbruto,     ' +
    '        sum((r.valor*parcela.valor/l.valor)*saldo.valor/parcela.valor) as valorliquido,  ' +
    '        pp.nome as nomepp  ' +
    ' from documento d, lanctodocum l, rateiodocum r, centrespon cr, PLANPREVCONTABIL pp, pessoa p ,  ' +
    ' (select d.coddocumento,d.numfatura,sum(decode(d.recpag,''' +
    ParamIntegra.recpag +
    ''', (decode(lan.debcre,''D'',lan.valor*-1,lan.valor)) , (decode(lan.debcre,''C'',lan.valor*-1,lan.valor))  ) )  as valor   ' +
    ' from documento d,lanctodocum l,lanctodocum lan where ' + speriodo +
    ' l.operacao=d.operacao and lan.coddocumento=d.coddocumento and rtrim(lan.operacao) <> ''5'' and d.recpag=''' +
    ParamIntegra.recpag + ''' and d.idpessoa=' + FloattoStr(CrmRptCM.IdEmpresa) +
    ' and d.coddocumento=l.coddocumento and rtrim(d.operacao)=''3'' group by d.coddocumento,d.numfatura) saldo  ' +
    ', ' +
    ' (select l.valor,d.numfatura, d.numapgr ,d.coddocumento,d.dataprogramada from documento d, lanctodocum l where d.coddocumento=l.coddocumento  and   ' +
    '  d.recpag=''' + ParamIntegra.recpag +
    ''' and d.idpessoa=1 and rtrim(l.operacao)=''3'' and ' + speriodo + ssql +
    ' l.estorno is null ) parcela  ' +
    ' where  ' +
    ' d.coddocumento=l.coddocumento and     ' +
    ' d.coddocumento=r.coddocumento and   ' +
    ' r.codcentrorespon=cr.codcentrorespon and     ' +
    ' r.idplanoprev =pp.idplanoprev and l.valor <> 0 and ' +
    ' d.idforcli=p.idpessoa and  ' +
    ' d.operacao=l.operacao and   ' +
    ssqlcentrespon +
    ' rtrim(d.operacao)=''1'' and d.numfatura is not null and  ' +
    ' d.recpag=''' + ParamIntegra.recpag + ''' and d.idpessoa=' +
    FloattoStr(CrmRptCM.IdEmpresa) + ' and  ' +
    ' d.numfatura=saldo.numfatura and  ' +
    ' d.numfatura=parcela.numfatura and      ' +
    ' saldo.coddocumento=parcela.coddocumento ' +
    ' group by  ' +
    '         pp.nome  )  ' +
    ' group by  nomepp    ');
  If Not CmpRptCM.ParamValues[7].IsNull Then
  Begin
    SqlPrevSint.Prepare;
    SqlPrevSint.ParamByName('valor').AsFloat := CmpRptCM.ParamValues[7].AsFloat;
  End;
  SqlPrevSint.open;
End;

End.

