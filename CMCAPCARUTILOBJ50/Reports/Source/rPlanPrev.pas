//  Daniel Simões em 12/01/2006 - P: 15393 --------------------------------
//  1=> Não foi preciso adicionar o campo CODEXTERNO no select porque o relatório
//      só exibe os dados pelo nome.
//  2=> Adicionado um ORDER BY no select executado no BeforeExecute do componente
//      CmpRptCM para que o centro de responsabilidade seja exibido em ordem
//      alfabética.
unit rPlanPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppMemo, ppStrtch, ppRegion,
  ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, Db, DBTables, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport, uCtrlParamIntegra, uCmSqlParams, DBClient,
  uCMClientDataSet, CMProcuraSubTipo, TXRB;

type
  TRptPlanPrev = class(TFrmCmReport)
    dsprevanali: TwwDataSource;
    ppPrevanali: TppBDEPipeline;
    rpPrevAnali: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    rpPrevAnaliRegion1: TppRegion;
    rpPrevAnaliLabel7: TppLabel;
    ppLine5: TppLine;
    rpPrevAnaliLabel5: TppLabel;
    rpPrevAnaliLabel4: TppLabel;
    rpPrevAnaliLabel3: TppLabel;
    rpPrevAnaliLabel2: TppLabel;
    rpPrevAnaliLabel1: TppLabel;
    rpPrevAnaliLabel6: TppLabel;
    rpPrevAnaliRegion2: TppRegion;
    ppMemo1: TppMemo;
    ppDetailBand3: TppDetailBand;
    rpPrevAnaliDBText1: TppDBText;
    rpPrevAnaliDBText2: TppDBText;
    rpPrevAnaliDBText3: TppDBText;
    rpPrevAnaliDBText4: TppDBText;
    rpPrevAnaliDBText5: TppDBText;
    rpPrevAnaliDBText6: TppDBText;
    rpPrevAnaliDBText7: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine6: TppLine;
    ppLabel8: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    rpPrevAnaliSummaryBand1: TppSummaryBand;
    rpPrevAnaliLabel9: TppLabel;
    rpPrevAnaliDBCalc3: TppDBCalc;
    rpPrevAnaliDBCalc4: TppDBCalc;
    rpPrevAnaliGroup1: TppGroup;
    rpPrevAnaliGroupHeaderBand1: TppGroupHeaderBand;
    rpPrevAnaliGroupFooterBand1: TppGroupFooterBand;
    rpPrevAnaliLabel8: TppLabel;
    rpPrevAnaliDBCalc1: TppDBCalc;
    rpPrevAnaliDBCalc2: TppDBCalc;
    CdsPrevAnali: TCMClientDataSet;
    SqlPrevAnali: TCMSqlParams;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    sFavorevido, sCentroRespon, sPlano: string;

  public
    { Public declarations }
  end;

var
  RptPlanPrev: TRptPlanPrev;

implementation

{$R *.DFM}

procedure TRptPlanPrev.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
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
end;

procedure TRptPlanPrev.FormCreate(Sender: TObject);
begin
  inherited;
  sFavorevido := '';
  sCentroRespon := '';
  sPlano := '';
end;

procedure TRptPlanPrev.CrmRptCMBeforePrint(Sender: TObject);
var
  speriodo, ssql, ssqlcentrespon: string;
begin
  inherited;
  if not (((not CmpRptCM.ParamValues[1].IsNull) and (not
    CmpRptCM.ParamValues[2].IsNull) or ((not CmpRptCM.ParamValues[3].IsNull) and
    (not CmpRptCM.ParamValues[4].IsNull)))) then
  begin
    exit;
  end;
  if ((not CmpRptCM.ParamValues[1].IsNull) or (not
    CmpRptCM.ParamValues[2].IsNull)) then
    speriodo := ' l.datalancto>=' + #39 + CmpRptCM.ParamValues[1].AsString + #39
      + ' and l.datalancto<=' + #39 + CmpRptCM.ParamValues[2].AsString + #39 +
      ' and ';

  if (not CmpRptCM.ParamValues[3].IsNull) and (not
    CmpRptCM.ParamValues[4].IsNull) then
  begin
    speriodo := speriodo + ' d.dataprogramada>=' + #39 +
      CmpRptCM.ParamValues[3].AsString + #39 + ' and d.dataprogramada<=' + #39 +
      CmpRptCM.ParamValues[1].AsString + #39 + ' and ';
  end;

  if ParamIntegra.recpag = 'P' then
    rpPrevAnaliLabel2.caption := 'Fornecedor'
  else
    rpPrevAnaliLabel2.caption := 'Cliente';
  ppMemo1.lines.clear;
  ppMemo1.lines.add('Período ' + CmpRptCM.ParamValues[1].AsString + ' até ' +
    CmpRptCM.ParamValues[2].AsString);
  if (not CmpRptCM.ParamValues[3].IsNull) and (not
    CmpRptCM.ParamValues[4].IsNull) then
    ppmemo1.lines.add('Data Vencto ' + CmpRptCM.ParamValues[3].AsString + ' até '
      + CmpRptCM.ParamValues[4].AsString);

  if CmpRptCM.ParamValues[0].Asinteger <> 0 then
  begin
    ssql := ssql + ' d.idforcli= ' + IntToStr(CmpRptCM.ParamValues[0].AsInteger) + ' and ';
    ppmemo1.lines.add(CmpRptCM.ParamValues[0].caption + ' ' + sFavorevido);
  end;
  if not CmpRptCM.ParamValues[7].IsNull then
  begin
    ssql := ssql + ' round(l.valor,2)= :valor  and ';
    ppmemo1.lines.add('Valor ' + floattostr(CmpRptCM.ParamValues[7].AsFloat));
  end;
  if not CmpRptCM.ParamValues[8].IsNull then
  begin
    ssql := ssql + ' d.numapgr =' + CmpRptCM.ParamValues[8].AsString + ' and ';
    ppmemo1.lines.add('Ap/Gr ' + CmpRptCM.ParamValues[8].AsString);
  end;
  if not CmpRptCM.ParamValues[5].IsNull then
  begin
    ssqlcentrespon := ' rtrim(r.codcentrorespon)=' + #39 +
      CmpRptCM.ParamValues[5].AsString + #39 + ' and';
    ppmemo1.lines.add('Centro Responsabilidade ' + sCentroRespon);
  end;
  if not CmpRptCM.ParamValues[6].IsNull then
  begin
    ssqlcentrespon := ssqlcentrespon + ' r.idplanoprev=' + #39 +
      CmpRptCM.ParamValues[6].AsString + #39 + ' and';
    ppmemo1.lines.add('Previdência ' + sPlano);
  end;
  SqlPrevanali.sql.clear;
  SqlPrevanali.sql.add('select  numapgr , nomerespon , nome , sum(valorbruto) as valorbruto, ' +
    ' sum(valorliquido) as valorliquido, dataprogramada , nomepp  ' +
    'from  ' +
    '(select d.numapgr, cr.nome as nomerespon , p.nome,  ' +
    '          sum(r.valor) as valorbruto,  ' +
    '          sum(r.valor*saldo.valor/l.valor) as valorliquido,  ' +
    '         d.dataprogramada, pp.nome as nomepp ' +
    ' from documento d, lanctodocum l, rateiodocum r, centrespon cr, PLANPREVCONTABIL pp, pessoa p ,  ' +
    ' (select d.coddocumento, sum(decode(d.recpag,''' + ParamIntegra.recpag +
    ''', (decode(lan.debcre,''D'',lan.valor*-1,lan.valor)) , (decode(lan.debcre,''C'',lan.valor*-1,lan.valor)))) as valor ' +
    ' from documento d,lanctodocum l ,lanctodocum lan where ' + speriodo +
    ' l.operacao=d.operacao and lan.coddocumento=d.coddocumento and rtrim(lan.operacao) not in (''5'',''15'') and d.recpag=''' +
    ParamIntegra.recpag + ''' and d.idpessoa=' + FloattoStr(CrmRptCM.IdEmpresa)
      +
    ' and d.coddocumento=l.coddocumento and d.numfatura is null group by d.coddocumento) saldo   ' +
    ' where  ' +
    ' d.coddocumento=l.coddocumento and d.coddocumento=r.coddocumento and     ' +
    ' r.codcentrorespon=cr.codcentrorespon and ' +
    ' r.idplanoprev =pp.idplanoprev and d.idforcli=p.idpessoa and d.operacao=l.operacao and l.valor <> 0 and    ' +
    ' d.numfatura is null and  ' + speriodo +
    ' d.recpag=''' + ParamIntegra.recpag + ''' and d.idpessoa=' +
      FloattoStr(CrmRptCM.IdEmpresa) + ' and ' +
    ' d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag +
    ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 +
    ' and b.idusuario=' + FloattoStr(CrmRptCM.IdUsuario) + ') ' +
    ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = ''' +
      ParamIntegra.RecPag +
    '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
      FloattoStr(CrmRptCM.idusuario) + ')) and ' +
    ' l.estorno is null and  ' + ssql + ssqlcentrespon +
    ' d.coddocumento=saldo.coddocumento    ' +
    ' group by pp.nome, cr.nome, p.nome , d.dataprogramada , d.numapgr  ' +
    ' union all     ' +
    ' select parcela.numapgr , cr.nome as nomerespon , p.nome , ' +
    '        sum(r.valor*parcela.valor/l.valor) as valorbruto,     ' +
    '        sum((r.valor*parcela.valor/l.valor)*saldo.valor/parcela.valor) as valorliquido,  ' +
    '        parcela.dataprogramada, pp.nome as nomepp  ' +
    ' from documento d, lanctodocum l, rateiodocum r, centrespon cr, PLANPREVCONTABIL pp, pessoa p ,  ' +
    ' (select d.coddocumento,d.numfatura,sum(decode(d.recpag,''' +
      ParamIntegra.recpag +
    ''', (decode(lan.debcre,''D'',lan.valor*-1,lan.valor)) , (decode(lan.debcre,''C'',lan.valor*-1,lan.valor)))) as valor   ' +
    ' from documento d,lanctodocum l,lanctodocum lan where ' + speriodo +
    ' l.operacao=d.operacao and lan.coddocumento=d.coddocumento and rtrim(lan.operacao) <> ''5'' and d.recpag=''' +
    ParamIntegra.recpag + ''' and d.idpessoa=' + FloattoStr(CrmRptCM.idempresa) +
      ' and d.coddocumento=l.coddocumento and rtrim(d.operacao)=''3'' group by d.coddocumento,d.numfatura) saldo  ' +
    ', ' +
    ' (select l.valor,d.numfatura, d.numapgr ,d.coddocumento,d.dataprogramada from documento d, lanctodocum l where d.coddocumento=l.coddocumento  and   ' +
    '  d.recpag=''' + ParamIntegra.recpag +
      ''' and d.idpessoa=1 and rtrim(l.operacao)=''3'' and ' + speriodo + ssql +
    ' d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag +
      ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
    ParamIntegra.recpag + #39 + ' and b.idusuario=' +
      FloattoStr(CrmRptCM.IdUsuario) + ') ' +
      ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
      ParamIntegra.RecPag +
    '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 +
      ParamIntegra.recpag + #39 + ' and a.codtipdoc=b.codtipdoc and b.idusuario='
      + FloattoStr(CrmRptCM.IdUsuario) +
    ')) and l.estorno is null ) parcela where  d.coddocumento=l.coddocumento and  d.coddocumento=r.coddocumento and   ' +
    ' r.codcentrorespon=cr.codcentrorespon and  r.idplanoprev =pp.idplanoprev and l.valor <> 0 and ' +
    ' d.idforcli=p.idpessoa and d.operacao=l.operacao and   ' + ssqlcentrespon +
    ' rtrim(d.operacao)=''1'' and d.numfatura is not null and  ' +
    ' d.recpag=''' + ParamIntegra.recpag + ''' and d.idpessoa=' +
      FloattoStr(CrmRptCM.idempresa) + ' and  ' +
    ' d.numfatura=saldo.numfatura and  d.numfatura=parcela.numfatura and      ' +
    ' saldo.coddocumento=parcela.coddocumento ' +
    ' group by pp.nome, cr.nome , p.nome , parcela.dataprogramada , parcela.numapgr )  ' +
    ' group by  nomepp, nomerespon , nome , dataprogramada , numapgr  ');
  if not CmpRptCM.ParamValues[7].IsNull then
  begin
    SqlPrevAnali.Prepare;
    SqlPrevAnali.ParamByName('valor').AsFloat :=
      CmpRptCM.ParamValues[7].AsFloat;
  end;
  SqlPrevAnali.open;
end;

procedure TRptPlanPrev.CmpRptCMParamControlExit(Sender: TPainelControles;
  Index: Integer);
begin
  inherited;
  case Index of
    0: sFavorevido := TPainelControles(Sender).CtrlLookup.Text;
    5: sCentroRespon := TPainelControles(Sender).CtrlLookup.Text;
    6: sPlano := TPainelControles(Sender).CtrlLookup.Text;
  end;
end;

end.

