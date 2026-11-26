// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 20/02/2006
// Pendência   : 21606
// Descricao   : Colocar em qryPrinc filtro 1=2, para otimizar abertura do módulo
//------------------------------------------------------------------------------
unit DRelPortFormaVersao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppModule, raCodMod;

type
  TdtmRelPortadorVersao = class(TdtmReports)
    qryPrinc: TwwQuery;
    dsPrinc: TwwDataSource;
    ppPrinc: TppBDEPipeline;
    rptPrinc: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel10: TppLabel;
    ppLine7: TppLine;
    ppDBText1: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine8: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine9: TppLine;
    ppLabelSistema: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel19: TppLabel;
    ppLine11: TppLine;
    ppDBCalcTotalGeral: TppDBCalc;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLine12: TppLine;
    ppDBCalcValorPort: TppDBCalc;
    ppLabel20: TppLabel;
    ppLine15: TppLine;
    ppDBImage1: TppDBImage;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText33: TppDBText;
    ppDBText31: TppDBText;
    ppLabel21: TppLabel;
    ppDBText32: TppDBText;
    rpFichaBeneficiosLabel1: TppLabel;
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
    ppLabel11: TppLabel;
    ppDBCalcQuantPort: TppDBCalc;
    ppDBCalcQuantGeral: TppDBCalc;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine10: TppLine;
    ppLine13: TppLine;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel1: TppLabel;
    ppDBText15: TppDBText;
    function MostraParam(Form: string): boolean; override;
    procedure pAbreFundacao;
    procedure pFechaFundacao;
    procedure qryPrincBeforeOpen(DataSet: TDataSet);
    procedure qryPrincAfterClose(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmRelPortadorVersao: TdtmRelPortadorVersao;

implementation

Uses fprelportformaversao,UadmprevFB, uSistema;

{$R *.DFM}

function TdtmRelPortadorVersao.MostraParam(Form: string): boolean;
 var frm : TForm;
begin
  if UPPERCASE(Form) = 'FRMPRELPORTFORMAVERSAO' then
    frm:=Tfrmprelportformaversao.Create(Application)
  else
    frm:=nil;

  if frm = nil then
    Result := true
  else
  begin
    with frm do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TdtmRelPortadorVersao.pAbreFundacao;
begin
  inherited;
  QryFundacao.Close;
  QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  QryFundacao.Open;
end;

procedure TdtmRelPortadorVersao.pFechaFundacao;
begin
  inherited;
  QryFundacao.Close;
end;

procedure TdtmRelPortadorVersao.qryPrincBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  pAbreFundacao;
end;

procedure TdtmRelPortadorVersao.qryPrincAfterClose(DataSet: TDataSet);
begin
  inherited;
  pFechaFundacao;
end;

procedure TdtmRelPortadorVersao.FormCreate(Sender: TObject);
begin
  inherited;
  ppLabelSistema.Text:= Sistema.NomeAplicativo;
end;

end.
{==============================================================================|
| UNIT: dtmRelPortadorVersao                                                   |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULE DO RELATORIO DE PORTADOR FORMA POR VERSÃO                      |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: FERNANDO                                                      |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/03/2002 A 14/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   CRIAÇÃO DO DATAMODULE                                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/03/2002 A 26/03/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAR IDPATRO E IDPLANOPREV NO DETALHE                                   |
| - COLOCAR QUEBRA POR DATA DE PAGAMENTO E PORTADOR FORMA                      |
| - COLOCAR TOTALIZADOR DE QUANTIDADE                                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/08/2002 A 14/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS) - Pendência 7277.                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Acerto no relatório (tamanho do logotipo e       |
|                              acerto do rodapé).                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

