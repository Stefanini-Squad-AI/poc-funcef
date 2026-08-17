{==============================================================================|
| UNIT: DRELFOLHA                                                              |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULE DE RELATORIO DE SEGUNDA VIA CONTRA CHEQUE                      |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25.09.2001 A 25.09.2001                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   ALTERAÇÃO NA QUERY QRYDEMONSTPAG E NO RELATÓRIO DE SEGUNDA VIA DO CONTRA   |
| CHEQUE.                                                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}
unit dRel2ViaCCheque;

interface

uses
  Windows , Messages, SysUtils, Classes , Graphics, Controls, Forms  , Dialogs ,
  dReports, ppCtrls , Db      , ppBands , ppPrnabl, ppClass , ppProd , ppReport,
  DBTables, Wwquery , Wwdatsrc, ppComm  , ppCache , ppDB    , ppDBBDE, ppStrtch,
  ppSubRpt, ppMemo  , uSistema, ppRichTx, ppVar, ppRelatv, ppDBPipe;

type
  TdtmRel2ViaCCheque = class(TdtmReports)
    dsdemonstpag: TwwDataSource;
    qrydemonstpag: TwwQuery;
    ppdemonstpag: TppBDEPipeline;
    rpdemonstpag: TppReport;
    ppHeaderBandRel: TppHeaderBand;
    ppShape1: TppShape;
    pplTituloRelat: TppLabel;
    pplMesPagto: TppLabel;
    ppDetailBand22: TppDetailBand;
    ppRectRubricas: TppShape;
    ppdbDescricaoRub: TppDBText;
    ppdbValorRubrica: TppDBText;
    ppdbCodigoRub: TppDBText;
    ppFooterBand: TppFooterBand;
    ppLine38: TppLine;
    ppLabel96: TppLabel;
    ppRectTotal: TppShape;
    pplTotalProvento: TppLabel;
    pplTotalDesconto: TppLabel;
    pplLiquido: TppLabel;
    pplBanco: TppLabel;
    pplAgencia: TppLabel;
    pplContaCorrente: TppLabel;
    ppdbProvento: TppDBCalc;
    ppdbDesconto: TppDBCalc;
    ppdbBanco: TppDBText;
    ppdbAgencia: TppDBText;
    ppdbContaCorrente: TppDBText;
    pplValorLiquido: TppLabel;
    rpdemonstpagSummaryBand1: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppRectDados: TppShape;
    pplNome: TppLabel;
    pplDataNasc: TppLabel;
    pplMatricula: TppLabel;
    pplEndereco: TppLabel;
    pplInscricao: TppLabel;
    pplDataInicio: TppLabel;
    ppdbNome: TppDBText;
    ppdbLogra: TppDBText;
    ppDBText44: TppDBText;
    ppdbDataInicio: TppDBText;
    pplBairro: TppLabel;
    ppdbBairro: TppDBText;
    pplCidade: TppLabel;
    pplNumDep: TppLabel;
    ppdbCidade: TppDBText;
    ppdbDatanasc: TppDBText;
    ppdbNumDep: TppDBText;
    pplEstado: TppLabel;
    ppdbEstado: TppDBText;
    pplCEP: TppLabel;
    ppdbCep: TppDBText;
    ppDBText52: TppDBText;
    ppdbmespag: TppDBText;
    ppGroupFooterBandTotal: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppRectCabecRubricas: TppShape;
    ppDBText54: TppDBText;
    pplCodigoRub: TppLabel;
    pplDescricaoRub: TppLabel;
    pplValorRubrica: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppCalc33: TppSystemVariable;
    ppCalc34: TppSystemVariable;
    ppdbNomeFundacao: TppDBText;
    ppdbCepFund: TppDBText;
    ppdbRazaoSocial: TppDBText;
    ppdbImagem: TppDBImage;
    ppdbEnderecoFund: TppDBText;
    ppdbBarIDUF: TppDBText;
    pplMesRub: TppLabel;
    ppdbMesRub: TppDBText;
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
    ppFundacaoppField1: TppField;
    ppFundacaoppField2: TppField;
    ppFundacaoppField3: TppField;
    ppFundacaoppField4: TppField;
    ppFundacaoppField5: TppField;
    ppFundacaoppField6: TppField;
    ppFundacaoppField7: TppField;
    ppFundacaoppField8: TppField;
    ppFundacaoppField9: TppField;
    ppFundacaoppField10: TppField;
    ppFundacaoppField11: TppField;
    ppFundacaoppField12: TppField;
    procedure NomePatroPrint(Sender: TObject);
    procedure LblEmpresaPrint(Sender: TObject);
    procedure LblSistemaPrint(Sender: TObject);
    function MostraParam(Form: string): boolean; override;
    procedure qrydemonstpagBeforeOpen(DataSet: TDataSet);
    procedure qrydemonstpagBeforeClose(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure rpdemonstpagSummaryBand1AfterPrint(Sender: TObject);
    procedure pplValorLiquidoPrint(Sender: TObject);
  private
    { Private declarations }
    pIdFundacao: integer;
  public
    { Public declarations }
    procedure pAbreFundacao;
    procedure pFechaFundacao;
  end;

var
  dtmRel2ViaCCheque: TdtmRel2ViaCCheque;

implementation

uses FPRel2ViaCCheque, fAguarde;

{$R *.DFM}

procedure TdtmRel2ViaCCheque.FormCreate(Sender: TObject);
begin
  inherited;
  pIdFundacao:=Sistema.IdEmpresa;
end;

procedure TdtmRel2ViaCCheque.pAbreFundacao;
begin
  inherited;
  QryFundacao.Close;
  QryFundacao.ParamByName('pFundacao').AsInteger:= pIdFundacao;
  QryFundacao.Open;
end;

procedure TdtmRel2ViaCCheque.pFechaFundacao;
begin
  inherited;
  QryFundacao.Close;
end;

procedure TdtmRel2ViaCCheque.qrydemonstpagBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRel2ViaCCheque.qrydemonstpagBeforeClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

function TdtmRel2ViaCCheque.MostraParam(Form: string): boolean;
 var frm: TForm;
begin
  if UPPERCASE(Form) = 'FRMPREL2VIACCHEQUE' then
    frm:=TfrmPRel2ViaCCheque.Create(Application)
  else
    frm:=nil;

  if frm = nil then
    Result:= true
  else
  begin
    with frm do
    begin
      Result:= (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TdtmRel2ViaCCheque.LblEmpresaPrint(Sender: TObject);
begin
  inherited;
  //Impressão do Nome da Empresa No Cabeçalho do Relatório
  (Sender as TppLabel).Caption:= Sistema.NomeEmpresa;
end;

procedure TdtmRel2ViaCCheque.LblSistemaPrint(Sender: TObject);
begin
  inherited;
  //Impressão do Nome do Módulo + Versão no Rodapé do Relatório
  (Sender as TppLabel).Caption:= Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TdtmRel2ViaCCheque.NomePatroPrint(Sender: TObject);
begin
  pAbreFundacao;
  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
end;

procedure TdtmRel2ViaCCheque.rpdemonstpagSummaryBand1AfterPrint(
  Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TdtmRel2ViaCCheque.pplValorLiquidoPrint(Sender: TObject);
begin
  inherited;
  pplValorLiquido.Caption := FormatFloat('#,##0.00',
                             ppdbProvento.Value - ppdbDesconto.Value);
end;

end.

