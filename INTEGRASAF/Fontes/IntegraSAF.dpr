program IntegraSAF;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipal in '..\..\Cm\Forms\Source\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  UModulo in 'UModulo.pas',
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  fCadParam in 'fCadParam.pas' {FrmCadParam},
  DIntegraSaf in 'DIntegraSaf.pas' {DtmIntegraSaf: TDataModule},
  fLog in 'fLog.pas' {FrmLog},
  DtmRptSaf in 'DtmRptSaf.pas' {DRptSaf},
  FCadHistoricos in 'FCadHistoricos.pas' {FrmCadHistoricos},
  FCadHistXTipoAlter in 'FCadHistXTipoAlter.pas' {FrmCadHistXTipoAlter},
  dReports in '..\..\CM\Forms\Source\Relatorios\dReports.pas' {dtmReports},
  fBolqueiaHist in 'fBolqueiaHist.pas' {FrmBolqueiaHist};

{$R *.RES}
{$R INTEGRASAF_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Integração CM X SAF';
  Application.CreateForm(TDtmIntegraSaf, DtmIntegraSaf);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo IntegraSAF
================================================================================
CM$VER      3.01.00     08/10/2001
--------------------------------------------------------------------------------
- Implementação do bloqueio do hsitório para importação de lançamentos
================================================================================
CM$VER      3.00.03     15/05/2001
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Correção na inclusão automática de Banco e Agência no momento da Importação
================================================================================
CM$VER      3.00.02     09/05/2001
--------------------------------------------------------------------------------
- Correção na atribuição da data de lançamento e vencimento da importação;
================================================================================
CM$VER      3.00.01     02/05/2001
--------------------------------------------------------------------------------
- Correção na exibição do form de logde operações após o login.
- Imporação de Documentos
   Data de Lançamento dos documentos importados é igual a de vencimento
================================================================================
CM$VER      3.00.00     04/04/2001
--------------------------------------------------------------------------------
Liberação das Versões Em Delphi 5
================================================================================
CM$VER      2.01.00     08/03/2001
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Coreção na selecão dos códigos correspondentes referentes ao Tipo de Desembolso\
  Recebimento.
================================================================================
CM$VER      2.00.07     25/01/2001
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Implementação exclusão de lançamentos em função do período informado no arquivo;
  Verificação do cadastro da AP pelo total prev;
================================================================================
CM$VER      2.00.06     04/01/2001
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Correção no cadastro de Clientes de acordo com o código do empreendimento\unidade;
================================================================================
CM$VER      2.00.05     20/11/2000
--------------------------------------------------------------------------------
- Correção no relatório de Obras X C. Respon X Desemb X Unid. Negócio
- Cadastro de Obras X C. Respon X Desemb X Atividade/Projeto
  Correção na validação dos campos obrigatórios;
  Correção na seleção e gravação da Atividade/Projeto
- Importação de Lançamentos
  Correção na validação de Atividade\Projeto relacionada ao Obra e da seleção do
  Centro de responsabilidade padrão para importação 
================================================================================
CM$VER      2.00.04     08/08/2000
--------------------------------------------------------------------------------
- Atualização do projeto para compatiblização com o novo padrão
================================================================================
CM$VER      2.00.03     14/07/2000
--------------------------------------------------------------------------------
- Importação de Lançamentos
  Correção no lançamento de Estornos;
  Correção na leitura do valor do documento ( amortização );
  Correção nos testes referentes a contabilização dos lançamentos e baixas;
================================================================================
CM$VER      2.00.02     24/02/2000
--------------------------------------------------------------------------------
Atualização das funções ed integração com o Contas a Receber
================================================================================
CM$VER      2.00.01     14/11/2000
--------------------------------------------------------------------------------
- Importação de lançamentos
  * Correção na Gravação do Documento do Cliente\Fornecedor: 
     Exclusão da máscara no momento da gravação no banco;
  * Diferenciação das mensagens de log do Contas a Pagar\Receber;
  * Inclusão do Idforcli da CM nas mensagens de erro da conta;
  * Inclusão do teste do centro de custo: Verirfica se esta ativo e se é analítico;
  * Inclusão da validação do número do documento: Só permite cadastrar registros com número do SAF.
  * Inclusão do lançamento de alteradores de acordo com o histórico;
- Cadastro de Históricos SAF
  Implementação do Cadastro com importação;
- Relacionamento de Histórico SAF X Código do Alterador
  Implementação do Relacionamento;
  
================================================================================
CM$VER      2.00.00     08/11/2000
--------------------------------------------------------------------------------
Implementação do Módulo
================================================================================
CM$ALT}













































