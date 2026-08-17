package UTotalPrev;

{$R *.RES}
{$ALIGN ON}
{$ASSERTIONS ON}
{$BOOLEVAL OFF}
{$DEBUGINFO ON}
{$EXTENDEDSYNTAX ON}
{$IMPORTEDDATA ON}
{$IOCHECKS ON}
{$LOCALSYMBOLS ON}
{$LONGSTRINGS ON}
{$OPENSTRINGS ON}
{$OPTIMIZATION ON}
{$OVERFLOWCHECKS OFF}
{$RANGECHECKS OFF}
{$REFERENCEINFO OFF}
{$SAFEDIVIDE OFF}
{$STACKFRAMES OFF}
{$TYPEDADDRESS OFF}
{$VARSTRINGCHECKS ON}
{$WRITEABLECONST ON}
{$MINENUMSIZE 1}
{$IMAGEBASE $400000}
{$DESCRIPTION 'Componentes e Forms da Solução TotalPrev'}
{$IMPLICITBUILD OFF}

requires
  Vcl50,
  CmCompo50,
  TB97_d5,
  ip50d_d5,
  Qrpt50,
  CmForms50,
  CmBack50,
  CMRegra50,
  CmRelatsOld50;

contains
  uRegTotalPrev in 'uRegTotalPrev.pas',
  dRel2ViaCCheque in 'dRel2ViaCCheque.pas',
  FConsPart in 'FConsPart.pas' {frmConsPart},
  FPRel2ViaCCheque in 'FPRel2ViaCCheque.pas',
  Nova_Tela in 'Nova_Tela.pas' {Form1},
  UConsPart in 'UConsPart.pas',
  dConsPart in 'dConsPart.pas' {dtmConsPart: TDataModule},
  UModulo in 'FontesComuns\UModulo.pas',
  dRelTempoServico in 'FontesComuns\dRelTempoServico.pas',
  FCadHistFuncPartCS in 'FontesComuns\fcadhistfuncpartcs.pas',
  FInformaData in 'FontesComuns\FInformaData.pas',
  FPedeInfAux in 'FontesComuns\FPedeInfAux.pas',
  FPRelHisFuncional in 'FontesComuns\FPRelHisFuncional.pas',
  UAdmPrevComum in 'FontesComuns\UAdmPrevComum.pas',
  DAPrev in 'FontesComuns\DAPrev.pas',
  UTypesEmptmo in 'FontesComuns\IntegraEmptmo\UTypesEmptmo.pas',
  DDividaEP in 'FontesComuns\IntegraEmptmo\DDividaEP.pas' {dtmDividaEP: TDataModule},
  dEmptmo in 'FontesComuns\IntegraEmptmo\dEmptmo.pas' {dtmEmptmo: TDataModule},
  FEspera in 'FontesComuns\IntegraEmptmo\FEspera.pas' {frmEspera},
  FProgresso in 'FontesComuns\IntegraEmptmo\FProgresso.pas' {frmProgresso},
  UCalcEmptmo in 'FontesComuns\IntegraEmptmo\UCalcEmptmo.pas',
  UFuncoesEmptmo in 'FontesComuns\IntegraEmptmo\UFuncoesEmptmo.pas',
  UIntegraEmptmo in 'FontesComuns\IntegraEmptmo\UIntegraEmptmo.pas',
  dCalcEmptmo in 'FontesComuns\IntegraEmptmo\dCalcEmptmo.pas' {dtmCalcEmptmo: TDataModule},
  UMascaras in 'FontesComuns\UMascaras.pas',
  uSincronismo in 'FontesComuns\uSincronismo.pas',
  FConfigRelatInforme in 'FontesComuns\RelaInformeRendimentos\FConfigRelatInforme.pas',
  uFiario in 'FontesComuns\uFiario.pas',
  fEmisEtiq in 'FontesComuns\fEmisEtiq.pas';

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo CMTotalPrev50
================================================================================
CM$VER      5.00.12     19/04/2002
--------------------------------------------------------------------------------
Incluído a unit "UEtiquetaCM.pas" que é utilizada pelo AdmPrev e CentralAP.
================================================================================
CM$VER      5.00.11     18/04/2002
--------------------------------------------------------------------------------
Conserto de um bug na exibição do label de BLOQUEIO.
================================================================================
CM$VER      5.00.10     16/04/2002
--------------------------------------------------------------------------------
-Inclusão da UNIT UFIARIO.PAS que é comum a vários módulos.
-Inclusão da função PegaDadosDoServidor que serve para pegar a 
  data corrente no servidor para fins de cálculo de Tempo de serviço, 
  Tempo de Contribuição, etc.
- Conserto na TabSheet RUBS para pegar todas as rubs da pessoa, igual no Central de Atendimentos.
- Remoção da TabSheet Rubs Pendentes que estava mostrando informações redundantes, pois essas 
   informações já são exibidas na TabSheet RUBS.
================================================================================
CM$VER      5.00.09c    12/04/2002
--------------------------------------------------------------------------------
Conserto das telas de dados funcionais que nao estava trazendo os dados do participante
 e de consulta de RUBS que não estava trazendo as RUBS de recadastramento.
================================================================================
CM$VER      5.00.07b    03/04/2002
--------------------------------------------------------------------------------
Inclusão do campo de isenção de IRRF na tela de dados pessoais
================================================================================
CM$VER      5.00.07a    05/02/2002
--------------------------------------------------------------------------------
Alteração nas apresentação das informações de reserva do participante:
  - a coluna data referência passa a ser a data da última alimentação da reserva;
  - acrescentou-se uma coluna com o valor da cota relativa a reserva;
  - inclusão da data da cota no rodapé da tela;
  - totalizador de valor das reservas do participante e das reservas de controle independentes.
================================================================================
CM$VER      5.00.06b    03/12/2001
--------------------------------------------------------------------------------
Inclusão da data final prevista do benefício no conjunto de informações dos benefícios vinculados aos participantes.
Inclusão das seguintes informações associadas aos dependentes:
  - conta para dedução de IRRF.
  - conta para salário família.
  - é dependente legal.
================================================================================
CM$VER      5.00.06     03/12/2001
--------------------------------------------------------------------------------
Inclusão do saldo total das reservas do participante.
Inclusão salário de participação associado a contribuição mensal informada.
================================================================================
CM$VER      1.00.08     14/11/2000
--------------------------------------------------------------------------------
- A pasta Plano esta mostrando todos os planos do participante
- E as pastas Histórico de Contribuição, benefícios e Reservas estão sendo filtradas pelo
  plano selecionado na pasta Plano
================================================================================
CM$VER      1.00.06     13/10/2000
--------------------------------------------------------------------------------
- Consulta completa da tabela de Eventos filtrando somente pelo Titular
================================================================================
CM$VER      1.00.05     04/10/2000
--------------------------------------------------------------------------------
Alterações da modelagem das RUBs
================================================================================
CM$ALT}






































