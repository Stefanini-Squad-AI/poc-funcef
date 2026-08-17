unit REmail;
{*******************************************************************************
Rotina...........: criação do relatório
Nº WO ...........: 11539
Data da Alteração: 14/06/2013
Responsável......: Helen V Bianchi
Descrição........: Relatório Email pessoal, corporativo e demais dados
********************************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, uCmSqlParams, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppVar, ppPrnabl,
  ppBands, ppCache, uSistema, ppStrtch, ppMemo, DBTables, Wwquery,
  ppModule, daDataModule, Provider;

type
  TRptEmail = class(TFrmCmReport)
    rpEmail: TppReport;
    ppEmail: TppBDEPipeline;
    cdsEmail: TCMClientDataSet;
    dsEmail: TwwDataSource;
    sqlEmail: TCMSqlParams;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    lblEmpresa: TppLabel;
    lblEnd1: TppLabel;
    lblEnd2: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    lblSitFunc: TppLabel;
    lblPeriodo: TppLabel;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppShape2: TppShape;
    lblNome: TppLabel;
    lblMatr: TppLabel;
    lblCargo: TppLabel;
    lblCCusto: TppLabel;
    lblTipo: TppLabel;
    ppShape3: TppShape;
    rpAdverteSuspensaoDBNome: TppDBText;
    lblModulo: TppLabel;
    rpAdverteSuspensaoDBMatric: TppDBText;
    rpAdverteSuspensaoDBCargo: TppDBText;
    rpAdverteSuspensaoDBUnd: TppDBText;
    rpAdverteSuspensaoDBTipo: TppDBText;
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
    ppDBText4: TppDBText;
    ppLabel2: TppLabel;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppDBText1: TppDBText;
    cdsEmailNOME: TStringField;
    cdsEmailMATRICULA: TStringField;
    cdsEmailIDPESSOA: TFloatField;
    cdsEmailCARGO: TStringField;
    cdsEmailUNIDADE: TStringField;
    cdsEmailCODEXTERNO: TStringField;
    cdsEmailCPF: TStringField;
    cdsEmailEMAIL: TStringField;
    cdsEmailDATAADMISSAO: TDateTimeField;
    cdsEmailDATADESLIGAMENTO: TDateTimeField;
    cdsEmailEMAILFUNCEF: TStringField;
    cdsEmailDIRETORIA: TStringField;
    ppDBText2: TppDBText;
    cdsEmailTIPOSIT: TStringField;
    ppLabel8: TppLabel;
    ppDBText3: TppDBText;
    lblNumPag: TppSystemVariable;
    ProvisaoFeriasrpLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    procedure cdsEmailAfterScroll(DataSet: TDataSet);
    procedure ppSummaryBand1AfterPrint(Sender: TObject);
    procedure cdsEmailAfterOpen(DataSet: TDataSet);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptEmail: TRptEmail;

implementation

uses fAguarde, dCds, uModulo, uCtrlUsoGeralRH, uCtrlFuncoesRH;


{$R *.DFM}

procedure TRptEmail.cdsEmailAfterScroll(
  DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptEmail.ppSummaryBand1AfterPrint(Sender: TObject);
begin
 // frmAguarde.Apaga;
end;

procedure TRptEmail.cdsEmailAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := cdsEmail.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptEmail.CrmRptCMBeforePrint(Sender: TObject);
var
   sFiltroData : string;
   sCampoData  : string;
begin
  inherited;

  qryFundacao.Open;

  // dados gerais do relatorio
  if CmpRptCM.ParamByName('DataInicio').asString <> '30/12/1899' then
  begin
     sFiltroData        := ' to_date('+quotedstr(CmpRptCM.ParamByName('DataInicio').asString)+') and to_date('+quotedstr(CmpRptCM.ParamByName('DataFinal').asString)+') ' ;
     lblPeriodo.Caption := CmpRptCM.ParamByName('DataInicio').asString +' a '+CmpRptCM.ParamByName('DataFinal').asString;;
  end
  else
  begin
     sFiltroData        := '';
     ppLabel1.Caption   := '';
     lblPeriodo.Caption := '';
  end;

  lblSitFunc.Caption  := CmpRptCM.ParamByName('ListaSitFunc').asString;



  cdsEmail.Close;
  sqlEmail.SQl.Clear;
  sqlEmail.SQL.Add('SELECT DISTINCT p.nome, f.matricula, p.idpessoa, c.titulo as Cargo,');
  sqlEmail.SQL.Add('       ct.nome as Unidade, ct.codexterno, p.numdocumento AS cpf,  p.email  ,  ');
  sqlEmail.SQL.Add('       f.DATAADMISSAO,f.Datadesligamento,PF.EMAILFUNCEF, s.tiposit ,   ');
  sqlEmail.SQL.Add('       ( SELECT DISTINCT CD.NOME');
  sqlEmail.SQL.Add('         FROM CENTCUST C JOIN CENTCUST CD ON REGEXP_REPLACE (CD.CODEXTERNO, ''\D'' ) = SUBSTR(REGEXP_REPLACE (C.CODEXTERNO, ''\D'' ), 0, 2) ');
  sqlEmail.SQL.Add('              AND CD.IDEMPRESA = C.IDEMPRESA');
  sqlEmail.SQL.Add('              AND CD.IDPLANCENTCUST = C.IDPLANCENTCUST');
  sqlEmail.SQL.Add('              AND C.CODCENTROCUSTO=F.CODCENTROCUSTO) AS DIRETORIA ');
  sqlEmail.SQL.Add('FROM  funcionario f, pessoa p, cargo c, sitfunc s, centcust ct, PESSOAFISICA PF   ');
  sqlEmail.SQL.Add('WHERE p.idpessoa = f.idpessoa  ');
  sqlEmail.SQL.Add('  and f.idsitfunc = s.idsitfunc');
  sqlEmail.SQL.Add('  and ct.codcentrocusto = f.codcentrocusto');
  sqlEmail.SQL.Add('  and decode(f.idfuncao, null, f.idcargo, f.idfuncao) = c.idcargo(+)  ');
  sqlEmail.SQL.Add('  and P.IDPESSOA = PF.IDPESSOA(+)');

  if CmpRptCM.ParamByName('ListaIdFunc').asString <> '' then
     sqlEmail.SQL.Add('           and p.idpessoa in ('+CmpRptCM.ParamByName('ListaIdFunc').asString+')');
  if CmpRptCM.ParamByName('ListaSitFunc').asString <> '' then
     sqlEmail.SQL.Add('           and s.tiposit in ('+CmpRptCM.ParamByName('ListaSitFunc').asString+')');
  if sFiltroData <> '' then
     sqlEmail.SQL.Add('          and (s.tiposit <> ''D'' OR f.Datadesligamento  between ' + sFiltroData+')' );
  sqlEmail.SQL.Add('     order by P.nome');

  sqlEmail.Open;
end;

end.
