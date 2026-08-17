program Cotas;

{%ToDo 'Cotas.todo'}

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\CM\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\CM\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\CM\Forms\Source\fAguarde.pas' {frmAguarde},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FSairAjuda in '..\..\CM\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\CM\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroCS in '..\..\CM\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  FProgressoDuplo in '..\..\Cm\Forms\Source\FProgressoDuplo.pas' {frmProgressoDuplo},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  FWizardMT in '..\..\Cm\Forms\SourceMT\FWizardMT.pas' {frmWizardMT},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  fParamCota in 'fParamCota.pas' {frmParamCota},
  uCtrlCarteiraSPC in '..\CtrlObjects\uCtrlCarteiraSPC.pas',
  uCtrlCotatipooper in '..\CtrlObjects\uCtrlCotatipooper.pas',
  uDbCotatipooper in '..\DbObjects\uDbCotatipooper.pas',
  uDbAtivocota in '..\DbObjects\uDbAtivocota.pas',
  uCtrlAtivoCota in '..\CtrlObjects\uCtrlAtivoCota.pas',
  uCtrlPerfilCota in '..\CtrlObjects\uCtrlPerfilCota.pas',
  uDbPerfilcota in '..\DbObjects\uDbPerfilcota.pas',
  uDbNoperfilxativo in '..\DbObjects\uDbNoperfilxativo.pas',
  uDbNoperfilcota in '..\DbObjects\uDbNoperfilcota.pas',
  uCtrlParametros in '..\CtrlObjects\uCtrlParametros.pas',
  uCtrlHstMovCota in '..\CtrlObjects\uCtrlHstMovCota.pas',
  uDbHstmovcota in '..\DbObjects\uDbHstmovcota.pas',
  uDbCotacotacao in '..\DbObjects\uDbCotaCotacao.pas',
  uCtrlCotaCotacao in '..\CtrlObjects\uCtrlCotaCotacao.pas',
  uCtrlCota in '..\CtrlObjects\uCtrlCota.pas',
  uCtrlEmprestimo in '..\CtrlObjects\uCtrlEmprestimo.pas',
  uDbCarteiraSpc in '..\DbObjects\uDbCarteiraSpc.pas',
  uDbCota in '..\DbObjects\uDbCota.pas',
  uDbCotaCalculo in '..\DbObjects\uDbCotaCalculo.pas',
  uDbCotaMovim in '..\DbObjects\uDbCotaMovim.pas',
  uDbCotaPerfil in '..\DbObjects\uDbCotaPerfil.pas',
  uCtrlListTerceiros in '..\CtrlObjects\uCtrlListTerceiros.PAS',
  uCtrlParamCota in '..\CtrlObjects\uCtrlParamCota.pas',
  uDbParamcota in '..\DbObjects\uDbParamCota.pas',
  fCadCarteiraSPC in 'fCadCarteiraSPC.pas' {frmCadCarteiraSPC},
  fCadPerfilCota in 'fCadPerfilCota.pas' {frmCadPerfilCota},
  fCadAtivos in 'fCadAtivos.pas' {frmCadAtivos},
  fCadParamEmprestimo in 'fCadParamEmprestimo.pas' {frmCadParamEmprestimo},
  fCadParamInvestimento in 'fCadParamInvestimento.pas' {frmCadParamInvestimento},
  fCadParamImobiliario in 'fCadParamImobiliario.pas' {frmCadParamImobiliario},
  fCadPrimCota in 'fCadPrimCota.pas' {frmCadPrimCota},
  fExecCalcPrimCota in 'fExecCalcPrimCota.pas' {frmExecCalcPrimCota},
  fExecCalcCota in 'fExecCalcCota.pas' {frmExecCalcCota},
  fConsultaPerfil in 'fConsultaPerfil.pas' {frmConsultaPerfil},
  fExecFechamento in 'fExecFechamento.pas' {frmExecFechamento},
  fCadCotaTipoOper in 'fCadCotaTipoOper.pas' {frmCadCotatipooper},
  mAtivoCota in 'mAtivoCota.pas' {molAtivoCota: TFrame},
  uTypesCota in 'uTypesCota.pas',
  dMs in 'dMs.pas' {dtmMS: TDataModule},
  bAtivo in 'bAtivo.pas' {busAtivo},
  cRelMovCota in 'cRelMovCota.pas' {cfgRelMovCota},
  dRelMovCota in 'dRelMovCota.pas' {dtmRelMovCota},
  fCadHstMovCota in 'fCadHstMovCota.pas' {frmCadHstMovCota},
  fExecImportaLancamento in 'fExecImportaLancamento.pas' {frmExecImportaLancamento},
  CRel in 'CRel.pas' {cfgRel},
  dLookCota in 'dLookCota.pas' {dtmLookCotas: TDataModule},
  dRelPerfilConsolidado in 'dRelPerfilConsolidado.pas' {dtmRelPerfilConsolidado},
  cRelParamAtivo in 'cRelParamAtivo.pas' {cfgRelParamAtivo},
  dRelParamAtivo in 'dRelParamAtivo.pas' {dtmRelParamAtivo},
  fCadastroMTCotas in 'fCadastroMTCotas.pas' {FrmCadastroMTCotas},
  fCadastroGridMTCotas in 'fCadastroGridMTCotas.pas' {FrmCadastroGridMTCotas},
  uDbFluxoCota in '..\DbObjects\uDbFluxoCota.pas',
  uCotaComum in 'uCotaComum.pas';

{$R *.RES}
{$R COTAS_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Controle de Cotas & Informações SPC';
  Application.HelpFile := 'C:\ProjetosCM5\Help\Cotas.chm';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TfrmProgressoDuplo, frmProgressoDuplo);
  Application.CreateForm(TdtmMS, dtmMS);
  Application.CreateForm(TdtmLookCotas, dtmLookCotas);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Controle de Cotas & Informações SPC
================================================================================
CM$VER      3.18.01c    18/03/2008
--------------------------------------------------------------------------------
Implementação do Help no Sistema.
================================================================================
CM$VER      3.18.01b    11/03/2008
--------------------------------------------------------------------------------
- Pendência 26690
  Melhora na seleção dos tipos de operação na tela de cadastro de parâmetros de
    movimentação de investimentos.
================================================================================
CM$VER      3.18.01a    08/11/2007
--------------------------------------------------------------------------------
Compilação no padrão 18
================================================================================
CM$VER      3.17.00a    01/08/2007
--------------------------------------------------------------------------------
- Pendência : 24831
  Ajuste na tela de cadastro de perfis para criticar pastas com mesmo nome.
- Pendencia : 24796
  A expansão da composição dos ativos passa obedecer ao flag.
- Pendencia : 25659
  Implementação na Consulta de Perfil Consolidado, da correção na soma das
   aplicações, para não ocorrer a duplicidade de valores cotizados e
   rentabilizados dos Fundos de Investimentos.
================================================================================
CM$VER      3.16.00a    18/07/2007
--------------------------------------------------------------------------------
Compilação no padrão 16
================================================================================
CM$VER      3.15.00a    18/07/2007
--------------------------------------------------------------------------------
Compilação no padrão 15
================================================================================
CM$VER      3.14.01b    18/07/2007
--------------------------------------------------------------------------------
- Pendencia : 23433
  Ajuste no remanejamento de movimentações em dias não úteis para o dia útil
    imediatamente seguinte.
- Pendencia : 25909
  Implementação de memória de cálculo da cota no relatório de Perfil Consolidado
================================================================================
CM$VER      3.14.01a    16/02/200
--------------------------------------------------------------------------------
- Pendência : 22362
  Implementação para calcular cotas de segmentos com mais de 1000 itens.
- Pendência : 22502
  As rubricas de Lucro/Prejuizo passa a sensibilizar o cálculo da cota.
- Pendência : 22803
  Ajuste na consulta de perfil para ativos sem saldo no periodo selecionado.
- Pendência : 23433
  Ajuste no calculo de cotas de ativos com movimentação em dia não útil.
================================================================================
CM$VER      3.04.01     17/07/2006
--------------------------------------------------------------------------------
Compilação com padrão 5.10.10
================================================================================
CM$VER      3.02.01     29/08/2005
--------------------------------------------------------------------------------
Compilação no padrão 5.10.7
================================================================================
CM$VER      3.02.00b    26/08/2005
--------------------------------------------------------------------------------
Alteração no lay-out do relatório Perfil Consolidado
Liberação para compilação no padrão 5.10.07
================================================================================
CM$ALT}






















