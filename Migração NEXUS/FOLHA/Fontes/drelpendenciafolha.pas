unit dRelPendenciaFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppModule, raCodMod;

type
  TDtmRelPendencia = class(TdtmReports)
    qryRelPendencia: TwwQuery;
    rpRelPendencia: TppReport;
    plRelPendencia: TppBDEPipeline;
    dsRelPendencia: TwwDataSource;
    qryFundacao: TwwQuery;
    qryFundacaoNOME: TStringField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    qryFundacaoLOGRADOURO: TStringField;
    qryFundacaoNUMERO: TStringField;
    qryFundacaoCOMPLEMENTO: TStringField;
    qryFundacaoBAIRRO: TStringField;
    qryFundacaoCIDADE: TStringField;
    qryFundacaoCODESTADO: TStringField;
    qryFundacaoCEP: TStringField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoENDERECO: TStringField;
    qryFundacaoBARCIDUF: TStringField;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppHeaderBand27: TppHeaderBand;
    ppLabelTitulo: TppLabel;
    ppDbTextEmpresa: TppDBText;
    ppDbTextCep: TppDBText;
    ppDbTextRSocial: TppDBText;
    ppDbImageEmpresa: TppDBImage;
    ppDbTextEndereco: TppDBText;
    ppDbTextBairro: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDetailBand28: TppDetailBand;
    ppDbTextMatricula: TppDBText;
    ppDbTextRecebedor: TppDBText;
    ppDbTextMesRef: TppDBText;
    ppDbTextValorProvento: TppDBText;
    ppDbTextValorRecebido: TppDBText;
    ppDbTextRubrica: TppDBText;
    ppFooterBand27: TppFooterBand;
    ppLine62: TppLine;
    ppLabelNomeSistema: TppLabel;
    ppCalcPagina: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabelMatricula: TppLabel;
    ppLabelRecebedor: TppLabel;
    ppLabelMesRef: TppLabel;
    ppLabelValorProvento: TppLabel;
    ppLabelValorRecebido: TppLabel;
    ppLabelVersao: TppLabel;
    ppDBTextVersao: TppDBText;
    ppLabelRubrica: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppDBCalcQuant: TppDBCalc;
    ppLabelDescRubrica: TppLabel;
    ppDBTextDescRubrica: TppDBText;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBText1: TppDBText;
    ppCalc24: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    procedure qryRelPendenciaAfterClose(DataSet: TDataSet);
    procedure qryRelPendenciaAfterOpen(DataSet: TDataSet);
    procedure qryRelPendenciaBeforeOpen(DataSet: TDataSet);
    procedure rpRelPendenciaBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    function MostraParam(Form: string): boolean; override;
  end;

var
  DtmRelPendencia: TDtmRelPendencia;

implementation

Uses
  uAdmPrevFB, uMensErro, fAguarde, FPRelPendenciaFolha;

{$R *.DFM}
function TDtmRelPendencia.MostraParam(Form: string): boolean;
 Var frm: TForm;
begin
  frm:=Nil;
  if UPPERCASE(Form) = 'FRMPRELPENDENCIA' then
    frm := TFrmPRelPendencia.Create(Application);
  if frm = nil then Result := true
  else
  begin
    with frm do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TDtmRelPendencia.pAbreFundacao;
begin
  inherited;
  qryFundacao.Close;
  qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  qryFundacao.Open;
end;

procedure TDtmRelPendencia.pFechaFundacao;
begin
  inherited;
  qryFundacao.Close;
end;

procedure TDtmRelPendencia.qryRelPendenciaAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TDtmRelPendencia.qryRelPendenciaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TDtmRelPendencia.qryRelPendenciaBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TDtmRelPendencia.rpRelPendenciaBeforePrint(Sender: TObject);
begin
  inherited;
  pAbreFundacao;
end;

end.

{==============================================================================|
| UNIT: dRelPendenciaFolha                                                     |
| DESCRIÇÃO FUNCIONAL: Relatório de rubricas de desconto pendentes de          |
|  processamento.                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/10/2002 A 30/10/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Criação da Unit.                                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

