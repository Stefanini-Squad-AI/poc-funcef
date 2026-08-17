unit RListaInscritosTurma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppStrtch, ppMemo, ppCtrls, ppVar, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCmRptManager,
  TXComp, TXRB, CmParamReport, DBTables, Wwquery;

type
  TRptListaInscritos = class(TFrmCmReport)
    rpListaInscritos: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape3: TppShape;
    lblFundacao: TppLabel;
    lblEnd1: TppLabel;
    lblEnd2: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    lblCarga: TppLabel;
    lblTurma: TppLabel;
    lblCurso: TppLabel;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppShape2: TppShape;
    lblNome: TppLabel;
    lblMatr: TppLabel;
    lblCCusto: TppLabel;
    rpRelPensAlimDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
    rpListaInscritosDBNome: TppDBText;
    rpListaInscritosDBMatric: TppDBText;
    rpListaInscritosDBUnd: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppTurmaInscr: TppBDEPipeline;
    ppAdvSuspensaoppField1: TppField;
    ppAdvSuspensaoppField2: TppField;
    ppAdvSuspensaoppField3: TppField;
    ppAdvSuspensaoppField4: TppField;
    ppAdvSuspensaoppField5: TppField;
    dsTurmaInscr: TwwDataSource;
    cdsTurmaInscr: TCMClientDataSet;
    cdsTurmaInscrNOME: TStringField;
    cdsTurmaInscrMATRICULA: TStringField;
    cdsTurmaInscrIDPESSOA: TFloatField;
    cdsTurmaInscrCARGO: TStringField;
    cdsTurmaInscrUNIDADE: TStringField;
    sqlTurmaInscr: TCMSqlParams;
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
    ProvisaoFeriasrpLabel1: TppLabel;
    lblNumPag: TppSystemVariable;
    ppLabel4: TppLabel;
    lblDtEmissao: TppSystemVariable;
    ppLabel6: TppLabel;
    lblDtIni: TppLabel;
    ppLabel8: TppLabel;
    lblDtFim: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    lblHrIni: TppLabel;
    lblHrFim: TppLabel;
    ppLabel10: TppLabel;
    lblEmpresa: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure cdsTurmaInscrAfterOpen(DataSet: TDataSet);
    procedure cdsTurmaInscrAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    sIdTurma      : string;
    sCurso        : string;
    sTurma        : string;
    sEmpresa      : string;
    sCargaHoraria : string;
    sDataIni      : string;
    sDataFim      : string;
    sHoraIni      : string;
    sHoraFim      : string;
    sPessoasInscritas : string;

  end;

var
  RptListaInscritos: TRptListaInscritos;

implementation

uses fAguarde, dCds, uModulo, uCtrlUsoGeralRH, uCtrlFuncoesRH;

{$R *.DFM}

procedure TRptListaInscritos.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  qryFundacao.Open;

  lblFundacao.Caption := qryFundacaoRAZAOSOCIAL.asString;
  lblEnd1.caption     := qryFundacaoBLOCO1.AsString;
  lblEnd2.caption     := qryFundacaoBLOCO2.AsString;
// SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e 13 Andares
// Brasília  DF  CEP 70.712-900 - (061)3329-1700 - www.funcef.com.br

  lblCurso.Caption   := sCurso;
  lblTurma.Caption   := sTurma;
  lblEmpresa.Caption := sEmpresa;
  lblCarga.Caption   := sCargaHoraria;
  lblDtIni.Caption   := sDataIni;
  lblDtFim.Caption   := sDataFim;
  lblHrIni.Caption   := sHoraIni;
  lblHrFim.Caption   := sHoraFim;

  cdsTurmaInscr.Close;
  sqlTurmaInscr.SQl.Clear;
  sqlTurmaInscr.SQL.Add('select p.nome, f.matricula,');
  sqlTurmaInscr.SQL.Add('       p.idpessoa,');
  sqlTurmaInscr.SQL.Add('       c.titulo as Cargo,');
  sqlTurmaInscr.SQL.Add('       ct.nome as Unidade');
  sqlTurmaInscr.SQL.Add('  from hsttrn h, funcionario f, pessoa p, cargo c, sitfunc s, centcust ct');
  sqlTurmaInscr.SQL.Add(' where p.idpessoa = f.idpessoa');
  sqlTurmaInscr.SQL.Add('   and h.idpessoa = f.idpessoa');
  sqlTurmaInscr.SQL.Add('   and f.idsitfunc = s.idsitfunc');
  sqlTurmaInscr.SQL.Add('   and ct.codcentrocusto = f.codcentrocusto');
  sqlTurmaInscr.SQL.Add('   and decode(f.idfuncao, null, f.idcargo, f.idfuncao) = c.idcargo(+)');
  sqlTurmaInscr.SQL.Add('   and h.idTurma = '+sIdTurma);

  if sPessoasInscritas <> '' then
     sqlTurmaInscr.SQL.Add('   and p.idPessoa in ('+sPessoasInscritas+')');

  sqlTurmaInscr.SQL.Add(' order by p.nome');

  sqlTurmaInscr.Open;
end;


procedure TRptListaInscritos.cdsTurmaInscrAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Max := cdsTurmaInscr.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptListaInscritos.cdsTurmaInscrAfterScroll(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

end.
