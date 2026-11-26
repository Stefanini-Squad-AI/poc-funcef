{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit dRelFolhaAtividade;

interface
                                        
uses
  Windows , Messages, SysUtils, Classes , Graphics, Controls, Forms   , Dialogs,
  dReports, ppReport, ppStrtch, ppSubRpt, ppBands , ppCtrls , ppPrnabl, ppDB   ,
  ppClass , ppProd  , Db      , DBTables, Wwquery , Wwdatsrc, ppComm  , ppCache,
  ppDBBDE , FMostraRelat, ppVar, ppRelatv, ppDBPipe,
  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TdtmRelFolhaAtividade = class(TdtmReports)
    qryFundacao                          : TwwQuery;
    dsFundacao                           : TwwDataSource;
    ppFundacao                           : TppBDEPipeline;
    qryPreparo                           : TQuery;
    dsPreparo                            : TDataSource;
    plPreparo                            : TppBDEPipeline;
    rpPreparo                            : TppReport;
    ppHeaderBand1                        : TppHeaderBand;
    ppDetailBand1                        : TppDetailBand;
    ppFooterBand1                        : TppFooterBand;
    ppLine2                              : TppLine;
    ppLabel4                             : TppLabel;
    rpPreparoLabel1                      : TppLabel;
    rpPreparoLabel3                      : TppLabel;
    rpPreparoLabel4                      : TppLabel;
    rpPreparoLine1                       : TppLine;
    rpPreparoDBText1                     : TppDBText;
    rpPreparoDBText2                     : TppDBText;
    rpPreparoDBText3                     : TppDBText;
    rpPreparoDBImage1                    : TppDBImage;
    rpPreparoDBText4                     : TppDBText;
    rpPreparoDBText5                     : TppDBText;
    rpPreparoLabel6                      : TppLabel;
    rpPreparoLabel7                      : TppLabel;
    rpPreparoDBText7                     : TppDBText;
    rpPreparoDBText8                     : TppDBText;
    rpPreparoDBText9                     : TppDBText;
    rpPreparoDBText10                    : TppDBText;
    lblBenficio                          : TppDBText;
    rpPreparoDBText6                     : TppDBText;
    rpPreparoLabel8                      : TppLabel;
    rpPreparoDBText12                    : TppDBText;
    rpPreparoDBText13                    : TppDBText;
    rpPreparoLabel9                      : TppLabel;
    rpPreparoLabel10                     : TppLabel;
    rpPreparoDBText14                    : TppDBText;
    rpPreparoLabel11                     : TppLabel;
    rpPreparoDBText15                    : TppDBText;
    rpPreparoLine2                       : TppLine;
    rpPreparoLabel14                     : TppLabel;
    rpPreparoLabel15                     : TppLabel;
    rpPreparoDBText18                    : TppDBText;
    rpPreparoDBText20                    : TppDBText;
    rpPreparoLine3                       : TppLine;
    rpPreparoLabel17                     : TppLabel;
    rpPreparoLabel2                      : TppLabel;
    rpPreparoLabel5                      : TppLabel;
    rpPreparoSubReport1                  : TppSubReport;
    rpPreparoChildReport1DetailBand1     : TppDetailBand;
    rpPreparoLabel12                     : TppLabel;
    lblContribuicao                      : TppDBText;
    rpPreparoChildReport1DBText1         : TppDBText;
    rpPreparoChildReport1DBText2         : TppDBText;
    qryContrib                           : TQuery;
    dsContrib                            : TDataSource;
    plContrib                            : TppBDEPipeline;
    rpPreparoDBCalc1: TppDBCalc;
    rpPreparoDBCalc2: TppDBCalc;
    rpPreparoLabel13: TppLabel;
    rpPreparoDBCalc3: TppDBCalc;
    rpPreparoDBCalc4: TppDBCalc;
    rpPreparoLabel16: TppLabel;
    rpPreparoSummaryBand1: TppSummaryBand;
    rpPreparoLabel18: TppLabel;
    rpPreparoDBCalc5: TppDBCalc;
    rpPreparoDBCalc6: TppDBCalc;
    ppCalc1: TppSystemVariable;
    qryCabecaBenef: TQuery;
    dsCabecaBenef: TDataSource;
    plCabecaBenef: TppBDEPipeline;
    function MostraParam(Form: string): boolean;override;
  private
    { Private declarations }
    iContr,
    iBene   : integer;
  public
    { Public declarations }
  end;

var
  dtmRelFolhaAtividade : TdtmRelFolhaAtividade;
  bFaz                 : Boolean;

implementation

Uses UFuncoesUteisFB, FParamRelPreparo, USistema;


{$R *.DFM}

function TdtmRelFolhaAtividade.MostraParam(Form: string): boolean;
Var
  Frm : TForm;

begin
  if UPPERCASE(Form) = 'FRMPARAMRELPREPARO' then frm := TfrmParamRelPreparo.Create(Application);
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

end.

{==============================================================================|
| UNIT: DRELFOLHAATIVIDADE                                                     |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   DATA MODULE DO RELATÓRIO DE BENEFÍCIOS PREPARADOS                          |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/09/2002 A 18/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| RESOLUÇÃO DA PENDÊNCIA: 6985                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Posicionei o subrelatório de Contribuição na seção Detalhe do Relatório |
|    para que o resultado do mesmo mostrasse todas as contribuições            |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITADO POR ALGUM CLIENTE ESPECÍFICO)                       |
| RESOLUÇÃO DA PENDÊNCIA:                                                      |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITADO POR ALGUM CLIENTE ESPECÍFICO)                       |
| RESOLUÇÃO DA PENDÊNCIA:                                                      |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITADO POR ALGUM CLIENTE ESPECÍFICO)                       |
| RESOLUÇÃO DA PENDÊNCIA:                                                      |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITADO POR ALGUM CLIENTE ESPECÍFICO)                       |
| RESOLUÇÃO DA PENDÊNCIA:                                                      |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITADO POR ALGUM CLIENTE ESPECÍFICO)                       |
| RESOLUÇÃO DA PENDÊNCIA:                                                      |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITADO POR ALGUM CLIENTE ESPECÍFICO)                       |
| RESOLUÇÃO DA PENDÊNCIA:                                                      |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITADO POR ALGUM CLIENTE ESPECÍFICO)                       |
| RESOLUÇÃO DA PENDÊNCIA:                                                      |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITADO POR ALGUM CLIENTE ESPECÍFICO)                       |
| RESOLUÇÃO DA PENDÊNCIA:                                                      |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|                                                                              |
|==============================================================================}

