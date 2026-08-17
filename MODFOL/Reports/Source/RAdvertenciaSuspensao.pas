unit RAdvertenciaSuspensao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, uCmSqlParams, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppVar, ppPrnabl,
  ppBands, ppCache, uSistema, ppStrtch, ppMemo, DBTables, Wwquery,
  ppModule, daDataModule, Provider;

type
  TRptAdverteSuspensao = class(TFrmCmReport)
    rpAdvSuspensao: TppReport;
    ppAdvSuspensao: TppBDEPipeline;
    cdsAdvSuspensao: TCMClientDataSet;
    dsAdvSuspensao: TwwDataSource;
    sqlAdvSuspensao: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblEmpresa: TppLabel;
    lblEnd1: TppLabel;
    lblEnd2: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    lblContrato: TppLabel;
    lblSitFunc: TppLabel;
    lblPeriodo: TppLabel;
    ppLabel4: TppLabel;
    ppShape1: TppShape;
    lblDtEmissao: TppSystemVariable;
    ppLabel5: TppLabel;
    ppShape2: TppShape;
    lblNome: TppLabel;
    lblMatr: TppLabel;
    lblCargo: TppLabel;
    lblCCusto: TppLabel;
    lblTipo: TppLabel;
    lblDtAto: TppLabel;
    lblDtAdv: TppLabel;
    lblDias: TppLabel;
    lblMotivo: TppLabel;
    ppShape3: TppShape;
    rpAdverteSuspensaoDBNome: TppDBText;
    lblModulo: TppLabel;
    ProvisaoFeriasrpLabel1: TppLabel;
    lblNumPag: TppSystemVariable;
    rpAdverteSuspensaoDBMatric: TppDBText;
    rpAdverteSuspensaoDBCargo: TppDBText;
    rpAdverteSuspensaoDBUnd: TppDBText;
    rpAdverteSuspensaoDBTipo: TppDBText;
    rpAdverteSuspensaoDBDtAto: TppDBText;
    rpAdverteSuspensaoDBDtSusp: TppDBText;
    rpAdverteSuspensaoDBDias: TppDBText;
    rpAdverteSuspensaoDBMotivo: TppDBMemo;
    rpRelPensAlimDBImage1: TppDBImage;
    ppFundacao: TppBDEPipeline;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField10: TppField;
    dsFundacao: TwwDataSource;
    qryFundacao: TwwQuery;
    qryFundacaoBLOCO1: TStringField;
    qryFundacaoBLOCO2: TMemoField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    cdsAdvSuspensaoNOME: TStringField;
    cdsAdvSuspensaoMATRICULA: TStringField;
    cdsAdvSuspensaoIDPESSOA: TFloatField;
    cdsAdvSuspensaoCARGO: TStringField;
    cdsAdvSuspensaoUNIDADE: TStringField;
    cdsAdvSuspensaoTIPO: TStringField;
    cdsAdvSuspensaoDATAATO: TDateTimeField;
    cdsAdvSuspensaoDATAADVSUSP: TDateTimeField;
    cdsAdvSuspensaoQUANTDIAS: TFloatField;
    cdsAdvSuspensaoMOTIVO: TMemoField;
    ppAdvSuspensaoppField1: TppField;
    procedure cdsAdvSuspensaoAfterScroll(DataSet: TDataSet);
    procedure ppSummaryBand1AfterPrint(Sender: TObject);
    procedure cdsAdvSuspensaoAfterOpen(DataSet: TDataSet);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptAdverteSuspensao: TRptAdverteSuspensao;

implementation

uses fAguarde, dCds, uModulo, uCtrlUsoGeralRH, uCtrlFuncoesRH;


{$R *.DFM}

procedure TRptAdverteSuspensao.cdsAdvSuspensaoAfterScroll(
  DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptAdverteSuspensao.ppSummaryBand1AfterPrint(Sender: TObject);
begin
 // frmAguarde.Apaga;
end;

procedure TRptAdverteSuspensao.cdsAdvSuspensaoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := cdsAdvSuspensao.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptAdverteSuspensao.CrmRptCMBeforePrint(Sender: TObject);
var
   sFiltroData : string;
   sCampoData  : string;
begin
  inherited;

  qryFundacao.Open;

  // dados gerais do relatorio
  lblPeriodo.Caption  := CmpRptCM.ParamByName('DataInicio').asString +' a '+CmpRptCM.ParamByName('DataFinal').asString;
  lblContrato.Caption := CmpRptCM.ParamByName('ContratoExtenso').asString;
  lblSitFunc.Caption  := CmpRptCM.ParamByName('SitFuncExtenso').asString;

  sFiltroData := ' to_date('+quotedstr(CmpRptCM.ParamByName('DataInicio').asString)+') and to_date('+quotedstr(CmpRptCM.ParamByName('DataFinal').asString)+') ';

  if CmpRptCM.ParamByName('SelDtAdvSusp').asInteger = 0 then
     sCampoData := ' a.dataadvsusp '
  else
     sCampoData := ' a.dataato ';


  cdsAdvSuspensao.Close;
  sqlAdvSuspensao.SQl.Clear;
  sqlAdvSuspensao.SQL.Add('select p.nome, f.matricula,');
  sqlAdvSuspensao.SQL.Add('       p.idpessoa,');
  sqlAdvSuspensao.SQL.Add('       c.titulo as Cargo,');
  sqlAdvSuspensao.SQL.Add('       ct.nome as Unidade,');
  sqlAdvSuspensao.SQL.Add('       decode(a.tipo, ''S'', ''Suspensão'', ''Advertência'') as Tipo,');
  sqlAdvSuspensao.SQL.Add('       a.dataato, a.dataadvsusp, a.quantdias, a.motivo');
  sqlAdvSuspensao.SQL.Add('  from advertsusp a, funcionario f, pessoa p, cargo c, sitfunc s, centcust ct');
  sqlAdvSuspensao.SQL.Add(' where p.idpessoa = f.idpessoa');
  sqlAdvSuspensao.SQL.Add('   and a.idpessoa = f.idpessoa');
  sqlAdvSuspensao.SQL.Add('   and f.idsitfunc = s.idsitfunc');
  sqlAdvSuspensao.SQL.Add('   and ct.codcentrocusto = f.codcentrocusto');
  sqlAdvSuspensao.SQL.Add('   and decode(f.idfuncao, null, f.idcargo, f.idfuncao) = c.idcargo(+)');

  if CmpRptCM.ParamByName('ListaCCusto').asString <> '' then
     sqlAdvSuspensao.SQL.Add('   and f.codcentrocusto in ('+CmpRptCM.ParamByName('ListaCCusto').asString+')');

  if CmpRptCM.ParamByName('ListaIdFunc').asString <> '' then
     sqlAdvSuspensao.SQL.Add('   and p.idpessoa in ('+CmpRptCM.ParamByName('ListaIdFunc').asString+')')
  else
  begin
    sqlAdvSuspensao.SQL.Add('   and f.tipocontrato in ('+CmpRptCM.ParamByName('ListaContrato').asString+')');
    sqlAdvSuspensao.SQL.Add('   and s.tiposit in ('+CmpRptCM.ParamByName('ListaSitFunc').asString+')');
  end;

  if (CmpRptCM.ParamByName('CargoSel').asString <> '') then
  begin
    if CmpRptCM.ParamByName('CargoAlter').asBoolean then
      sqlAdvSuspensao.SQL.Add('   and f.idfuncao = '+CmpRptCM.ParamByName('CargoSel').asString )
    else
      sqlAdvSuspensao.SQL.Add('   and c.idcargo = '+CmpRptCM.ParamByName('CargoSel').asString );
  end;

  if CmpRptCM.ParamByName('CargoAlter').asBoolean then
     sqlAdvSuspensao.SQL.Add('   and nvl(f.idfuncao,0) > 0' );

  sqlAdvSuspensao.SQL.Add('   and '+sCampoData+' between ' + sFiltroData );
  sqlAdvSuspensao.SQL.Add(' order by p.nome, a.dataato');

  sqlAdvSuspensao.Open;
end;

end.
