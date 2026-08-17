program ModAcesso;

uses
  Forms,
  fPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  fTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  fCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  fCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  fSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  DAutorizacao in '..\..\Cm\Forms\Source\DAutorizacao.pas' {DtmAutorizacao: TDataModule},
  dCds in '..\..\cmrhobjutil50\Package\dCds.pas' {dmCds: TDataModule},
  fConfigBiometria in '..\..\cmrhobjutil50\Biometria\fConfigBiometria.pas' {FrmConfigBiometriaBSP},
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  uModulo in 'uModulo.pas',
  fCadEstacao in '..\FontesMT\fCadEstacao.pas' {frmCadEstacao},
  fRegAcesso in '..\FontesMT\fRegAcesso.pas' {frmRegAcesso},
  fCadParam in '..\FontesMT\fCadParam.pas' {frmCadParam},
  fLancaHoraPonto in '..\FontesMT\fLancaHoraPonto.pas' {frmLancaHoraPonto},
  fCadLocalizacao in '..\..\Shared\ModComp\FontesMT\fCadLocalizacao.pas' {frmCadLocalizacao},
  fRegVezes in '..\FontesMT\fRegVezes.pas' {frmRegVezes},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  fSelPessoalMT in '..\..\Shared\ModComp\FontesMT\fSelPessoalMT.pas' {frmSelPessoalMT},
  fParamAcessoPessEstacao in '..\Reports\Source\fParamAcessoPessEstacao.pas' {frmParamAcessoPessEstacao},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  RAcessoPessoa in '..\Reports\Source\RAcessoPessoa.pas' {RptAcessoPessoa},
  RAcessoEstacao in '..\Reports\Source\RAcessoEstacao.pas' {RptAcessoEstacao},
  uCmCtrlRptModAcesso in '..\CtrlObjetos\uCmCtrlRptModAcesso.pas',
  fControlePonto in '..\FontesMT\fControlePonto.pas' {frmControlePonto},
  fLancaHoras in '..\FontesMT\fLancaHoras.pas' {frmLancaHoras},
  fParamQuantAcessos in '..\Reports\Source\fParamQuantAcessos.pas' {frmParamQuantAcessos},
  RQuantAcessos in '..\Reports\Source\RQuantAcessos.pas' {RptQuantAcessos},
  fRegBancoHoras in '..\FontesMT\fRegBancoHoras.pas' {frmRegBancoHoras},
  fParamExtratoBH in '..\Reports\Source\fParamExtratoBH.pas' {frmParamExtratoBH},
  RExtratoBH in '..\Reports\Source\RExtratoBH.pas' {RptExtratoBH},
  fParamLancRubIndiv in '..\..\Shared\ModComp\Reports\Source\fParamLancRubIndiv.pas' {frmParamLancRubIndiv},
  RLancRubIndiv in '..\..\Shared\ModComp\Reports\Source\RLancRubIndiv.pas' {RptLancRubIndiv},
  fParamCartaoPonto in '..\Reports\Source\fParamCartaoPonto.pas' {frmParamCartaoPonto},
  RCartaoPonto in '..\Reports\Source\RCartaoPonto.pas' {RptCartaoPonto},
  fCriaRubrica in '..\FontesMT\fCriaRubrica.pas' {frmCriaRubrica},
  fCadRegHorarioVariavel in '..\..\Shared\ModComp\FontesMT\fCadRegHorarioVariavel.pas' {frmCadRegHorarioVariavel},
  fParamQuadroHoraTrab in '..\..\Shared\ModComp\Reports\Source\fParamQuadroHoraTrab.pas' {frmParamQuadroHoraTrab},
  RQuadroHoraTrab in '..\..\Shared\ModComp\Reports\Source\RQuadroHoraTrab.pas' {RptQuadroHoraTrab},
  fParamEscalaHorario in '..\..\Shared\ModComp\Reports\Source\fParamEscalaHorario.pas' {frmParamEscalaHorario},
  REscalaHorario in '..\..\Shared\ModComp\Reports\Source\REscalaHorario.pas' {RptEscalaHorario},
  uBiometriaTypes in '..\..\cmrhobjutil50\Biometria\uBiometriaTypes.pas',
  uBiometria in '..\..\cmrhobjutil50\Biometria\uBiometria.pas',
  fRegQuantAcessosColet in '..\FontesMT\fRegQuantAcessosColet.pas' {frmRegQuantAcessosColet},
  fGravaCartoes in '..\FontesMT\fGravaCartoes.pas' {frmGravaCartoes},
  uCtrlModeloAcesso_Inner in '..\CtrlObjetos\uCtrlModeloAcesso_Inner.pas',
  uCtrlModeloAcesso in '..\CtrlObjetos\uCtrlModeloAcesso.pas',
  uCtrlModeloAcesso_Rodbel in '..\CtrlObjetos\uCtrlModeloAcesso_Rodbel.pas',
  uCtrlModeloAcesso_Passo in '..\CtrlObjetos\uCtrlModeloAcesso_Passo.pas',
  fVisualizarArquivosLog in '..\..\Shared\ModComp\FontesMT\fVisualizarArquivosLog.pas' {frmVisualizarArquivosLog},
  fConfigRegAcesso in '..\FontesMT\fConfigRegAcesso.pas' {frmConfigRegAcesso},
  uCtrlPessoaFuncionario in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlPessoaFuncionario.pas',
  uCtrlUsoGeralRH in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlUsoGeralRH.pas',
  uCtrlEstacaoAcesso in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlEstacaoAcesso.pas',
  uDbEstacaoAcesso in '..\..\cmrhobjutil50\DbObjetos\uDbEstacaoAcesso.pas',
  uCtrlCustomRH in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlCustomRH.pas',
  uCtrlBancoHoras in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlBancoHoras.pas',
  uDbBancoHoras in '..\..\cmrhobjutil50\DbObjetos\uDbBancoHoras.pas',
  uCtrlListTerceirosRH in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlListTerceirosRH.pas',
  uCtrlDiaExtra in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlDiaExtra.pas',
  uDbDiaExtraTrab in '..\..\cmrhobjutil50\DbObjetos\uDbDiaExtraTrab.pas',
  uCtrlFerias in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlFerias.pas',
  uDbFerias in '..\..\cmrhobjutil50\DbObjetos\uDbFerias.pas',
  uCtrlAntec13 in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlAntec13.pas',
  uDbAntecip13 in '..\..\cmrhobjutil50\DbObjetos\uDbAntecip13.pas',
  uCtrlCargo in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlCargo.pas',
  uDbCargo in '..\..\cmrhobjutil50\DbObjetos\uDbCargo.pas',
  uCtrlRegAcessoFunc in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlRegAcessoFunc.pas',
  uDbAcessoFunc in '..\..\cmrhobjutil50\DbObjetos\uDbAcessoFunc.pas',
  uCtrlHorarioVariavel in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlHorarioVariavel.pas',
  uDbHorarioVariavel in '..\..\cmrhobjutil50\DbObjetos\uDbHorarioVariavel.pas',
  uCtrlTurnoSem in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlTurnoSem.pas',
  uDbTurnoSem in '..\..\cmrhobjutil50\DbObjetos\uDbTurnoSem.pas',
  uCtrlAssociaHorario in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlAssociaHorario.pas',
  uCtrlTurnoDia in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlTurnoDia.pas',
  uDbTurnoDia in '..\..\cmrhobjutil50\DbObjetos\uDbTurnoDia.pas',
  uCtrlParamRH in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlParamRH.pas',
  uDbParamRH in '..\..\cmrhobjutil50\DbObjetos\uDbParamRH.pas',
  uDbParamRHDatas in '..\..\cmrhobjutil50\DbObjetos\uDbParamRHDatas.pas',
  uCtrlLocalizacoes in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlLocalizacoes.pas',
  uDBLocalizacao in '..\..\cmrhobjutil50\DbObjetos\uDBLocalizacao.pas',
  uCtrlTipoArea in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlTipoArea.pas',
  uDBTipoArea in '..\..\cmrhobjutil50\DbObjetos\uDBTipoArea.pas',
  uCtrlResponsavel in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlResponsavel.pas',
  uDBResponsavel in '..\..\cmrhobjutil50\DbObjetos\uDBResponsavel.pas',
  uDbMotivo in '..\..\cmrhobjutil50\DbObjetos\uDbMotivo.pas',
  uCtrlMotivo in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlMotivo.pas',
  uDbFuncionario in '..\..\cmrhobjutil50\DbObjetos\uDbFuncionario.pas',
  uDbEstrangeiro in '..\..\cmrhobjutil50\DbObjetos\uDbEstrangeiro.pas',
  uDbUltEmpr in '..\..\cmrhobjutil50\DbObjetos\uDbUltEmpr.pas',
  uCtrlGlobalRH in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlGlobalRH.pas',
  uCtrlHoraTrab in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlHoraTrab.pas',
  uDbHoraTrab in '..\..\cmrhobjutil50\DbObjetos\uDbHoraTrab.pas',
  uCtrlLancaHoras in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlLancaHoras.pas',
  uDbRubricaIndiv in '..\..\cmrhobjutil50\DbObjetos\uDbRubricaIndiv.pas',
  uCtrlRubricaIndiv in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlRubricaIndiv.pas',
  uDbFilialPessoa in '..\..\cmrhobjutil50\DbObjetos\uDbFilialPessoa.pas',
  uCtrlPessoaFilialPessoa in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlPessoaFilialPessoa.pas',
  uDbProvDesc in '..\..\cmrhobjutil50\DbObjetos\uDbProvDesc.pas',
  uCtrlProvDesc in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlProvDesc.pas',
  uDbRubXSit in '..\..\cmrhobjutil50\DbObjetos\uDbRubXSit.pas',
  uDbRubXRub in '..\..\cmrhobjutil50\DbObjetos\uDbRubXRub.pas',
  uDbProfiss in '..\..\cmrhobjutil50\DbObjetos\uDbProfiss.pas',
  uCtrlProfiss in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlProfiss.pas',
  uDbGrInstr in '..\..\cmrhobjutil50\DbObjetos\uDbGrInstr.pas',
  uCtrlGrInstr in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlGrInstr.pas',
  uCtrlPessoaSindicato in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlPessoaSindicato.pas',
  uDbSindicato in '..\..\cmrhobjutil50\DbObjetos\uDbSindicato.pas',
  uDbAliquotaSind in '..\..\cmrhobjutil50\DbObjetos\uDbAliquotaSind.pas',
  uCtrlSelPessoal in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlSelPessoal.pas',
  uCtrlPessoaCandidato in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlPessoaCandidato.pas',
  uCtrlSitFunc in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlSitFunc.pas',
  uDbCandidat in '..\..\cmrhobjutil50\DbObjetos\uDbCandidat.pas',
  uDbSitFunc in '..\..\cmrhobjutil50\DbObjetos\uDbSitFunc.pas',
  uDbRequiCand in '..\..\cmrhobjutil50\DbObjetos\uDbRequiCand.pas',
  uDbHstAval in '..\..\cmrhobjutil50\DbObjetos\uDbHstAval.pas',
  uDbHstTrn in '..\..\cmrhobjutil50\DbObjetos\uDbHstTrn.pas',
  prjProtocoloRB_TLB in 'prjProtocoloRB_TLB.pas',
  fRegQuemMarcaPonto in '..\FontesMT\fRegQuemMarcaPonto.pas' {frmRegQuemMarcaPonto},
  uGravaCartoes in 'uGravaCartoes.pas',
  SysUtils in '..\..\cmrhobjutil50\Package\sysutils.pas',
  fRegAcesso2 in '..\FontesMT\fRegAcesso2.pas' {frmRegAcesso2},
  uCtrlTipOcMed in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlTipOcMed.pas',
  uDbTipOcMed in '..\..\cmrhobjutil50\DbObjetos\uDbTipOcMed.pas',
  fCadRegHorarioColet in '..\FontesMT\fCadRegHorarioColet.pas' {frmCadRegHorarioColet},
  fCadOcorr in '..\FontesMT\fCadOcorr.pas' {frmCadOcorr},
  fSelEstAusencia in '..\FontesMT\fSelEstAusencia.pas' {frmSelEstAusencia},
  fParamPontoPessoa in '..\Reports\Source\fParamPontoPessoa.pas' {frmParamPontoPessoa},
  RPontoPessoa in '..\Reports\Source\RPontoPessoa.pas' {RptPontoPessoa},
  fParamPresencaCasa in '..\Reports\Source\fParamPresencaCasa.pas' {frmParamPresencaCasa},
  RPresencaCasa in '..\Reports\Source\RPresencaCasa.pas' {RptPresencaCasa},
  uCtrlFuncoesRH in '..\..\cmrhobjutil50\CtrlObjetos\uCtrlFuncoesRH.pas';

{$R MODACESSO_RES.RES}
{$R *.RES}

begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Controle de Ponto e Acesso';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Controle de Ponto e Acesso
================================================================================
CM$VER      3.02.12     26/06/2008
--------------------------------------------------------------------------------
(Pendência 27134)
- Alteração no tratamento dos lançamentos no Banco de Horas, com a exclusão do campo
  "Situação do Lançamento (Aberto, Procesado, Expirado)", pois esta informação não era
  muito relevante para as funcionalidades do sistema e, até pelo contrário, a sua manipulação
  as tornava por vezes confusas, podendo induzir a situações de dúvida ou mesmo de erro.
  Esta ação levou também a algumas revisões nas rotinas de apuração e exibição do saldo
  do Banco de Horas, exigindo no total alteração nestas telas, relatório e controles:
  * Transações / Controle Individual do Ponto
  * Transações / Lançamentos no Banco de Horas
  * Consultas / Relatórios / Ponto ... / Operacionais / Extrato do Banco de Horas
  * uCtrlBancoHoras
  * uCtrlLancaHoras
================================================================================
CM$VER      3.02.11     07/03/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      3.02.10     22/02/2008
--------------------------------------------------------------------------------
(Pendência 27454)
- Transações / Controle Individual do Ponto:
  * A tela não atualizava os horários normais corretamente quando
    o usuário mudava as datas e havia horário variável no período (este
    poderia ficar na tela indevidamente).  
  Exemplo: Quando aparece o período inteiro (16/01/2008 a 15/02/2008) o 
           horário de saída esta correto (às 17h30), porém quando solicito 
           somente o dia 16/01/2008 o horário de saída esta como 18H. 
           Somente a partir do dia 11/02/2008 que o horário será alterado. 
================================================================================
CM$VER      3.02.09     15/02/2008
--------------------------------------------------------------------------------
(Pendência 27134)
- Transações / Lançamento Coletivo do Ponto: 
  * Correção do tratamento dado a um registro abonado (não sendo de falta).
================================================================================
CM$VER      3.02.08     25/03/2008
--------------------------------------------------------------------------------
(Pendência 27233 - Complemento)
- Transações / Registro de Acesso:
  * Alteração na forma de buscar o Centro de Custo da pessoa, pois a anterior
    poderia exibir o Centro de Custo errado, em certas situações.
(Pendência 27249)
- Transações / Controle Individual do Ponto e Lançamento Coletivo do Ponto:
  * Alteração na contagem do período de acumulação no Banco de Horas, para
    efeito de tranferência (ou não) para a Folha
================================================================================
CM$VER      3.02.07     15/01/2008
--------------------------------------------------------------------------------
(Pendência 27233)
- Transações / Registro Individual de Ponto:
  * Alteração na forma de buscar o Centro de Custo da pessoa, pois a anterior
    poderia exibir o Centro de Custo errado, em certas situações.
================================================================================
CM$VER      3.02.06     08/01/2008
--------------------------------------------------------------------------------
(Pendência 27175)
- Consultas / Relatórios / Operacionais:
  * Implementação do relatório "Presenças na Casa", que lista os empregados presentes no
    momento da emissão (entrada <= hora atual e saída em branco) ou presentes em um
    período selecionado (entre data/hora inicial e data/hora final).
================================================================================
CM$VER      3.02.05     06/11/2007
--------------------------------------------------------------------------------
(Pendência 26256 - Complemento)
- Transações / Controle Individual do Ponto e Lançamento Coletivo do Ponto: 
  * Correção da contagem de atrasos, em certas situações de desconto do intervalo.
    (Obs.: isto havia sido anunciado na versão anterior mas, por um lapso, faltou).
================================================================================
CM$VER      3.02.04     06/09/2007
--------------------------------------------------------------------------------
(Pendência 25421 - complemento)
- Consultas / Relatórios / Ponto ... / Operacionais/Marcação de Ponto por Pessoa:
  * Inclusão da opção para exibir o saldo no banco de horas;
  * Inclusão do total de horas trabalhadas (tendo as horas extras como opção);
  * Substituição, no cabeçalho, do nome da empresa pela razão social;
  * Inclusão, no cabeçalho, do CNPJ e endereço da empresa;
  * Inclusão do Centro de Custo (atual) do empregado;
  * Inclusão do intervalo normal para quem não bate intervalo.
(Pendência 26256)
- Transações / Controle Individual do Ponto e Lançamento Coletivo do Ponto: 
  * Correção da contagem de atrasos, em certas situações de desconto do intervalo.
================================================================================
CM$VER      3.02.03     24/08/2007
--------------------------------------------------------------------------------
(Pendência 26196)
- Consultas / Relatórios / Ponto ... / Operacionais / Marcação de Ponto por Pessoa:
  * Revisão e acertos dos casos em que haja dados incompletos (ex.: Entrada sem Saída).
  * Inclusão dessa informação na coluna Observação, nos casos aplicáveis.
================================================================================
CM$VER      3.02.02     21/08/2007
--------------------------------------------------------------------------------
(Pendência 26176)
- Transações / Registro de Acesso e Registro de Quem Marca Ponto:
  * Adequação aos casos de "Escala Rotativa", cujo tratamento não estava
    correto em todas as situações.
(Pendência 25704 - Complemento)
- Transações / Controle Individual do Ponto e Lançamento Coletivo do Ponto: 
  * Foi acrescentada a opção para que as Horas Extras Transferidas (do Banco de Horas)
    sejam as do Saldo Anterior Apenas ou Saldo Anterior + Movim. do Período, se Data
    Limite estiver atingida.
================================================================================
CM$VER      3.02.01     15/08/2007
--------------------------------------------------------------------------------
(Pendência 25816)
- Transações / Controle Individual do Ponto e Lançamento Coletivo do Ponto: 
  * Foi acrescentada a totalização de Horas Extras Transferidas (do Banco de Horas), 
    de forma separada das demais. Isto permite que o usuário, migre essas horas para
    a Folha, p.ex., em uma rubrica específica, diferente das demais horas extras.
    O motivo desta separação é para que as horas que foram acumuladas no Banco,
    já com um fator de acréscimo, caiam em uma rubrica que as calcule na Folha sem
    nenhum outro acréscimo, diferentemente das demais horas extras que são sempre
    calculadas pela Folha com os acréscimos acordados.
(Pendência 25976)  
- Consultas / Relatórios / Ponto ... / Operacionais / Extrato do Banco de Horas:
  * Foi corrigida a emissão quando era solicitado para "Pessoas a Selecionar",
    pois não retornava ninguém, mesmo havendo resultado a exibir.
  * Foi incluída a opção "Simular Desembolso com o Banco de Horas?", que mostra
    o valor a pagar pelo saldo do Banco de Horas (ou descontar se este for negativo).
================================================================================
CM$VER      3.02.00     26/07/2007
--------------------------------------------------------------------------------
- Consultas / Relatórios / Ponto ... / Operacionais / Marcação de Ponto por Pessoa:
  * Revisão e acertos em alguns cálculos de totalização de horas.
  * Inclusão da informação sobre o Saldo do Banco de Horas, nos casos aplicáveis.
(Pendência 25650)
- Cadastros / Ocorrências e Exames (Motivos de Abono):
  * Inclusão do campo "Ocorrência Força Migração para a Folha (Não vai para Banco de Horas)",
    que permite ao usuário "forçar" um pagamento ou desconto na Folha, mesmo que o padrão
    seja acumular no Banco de Horas.
- Transações / Controle Individual do Ponto e Lançamento Coletivo do Ponto:
  * Tratamento do uso do novo campo acima citado.
    (OBS. IMPORTANTE: o sistema não permite indicar um motivo para uma falta, se esta não
    for abonada. Neste caso, o usuário deverá registrar uma entrada e saída no mesmo horário,
    p.ex., no horário normal de entrada, fazendo com que o total de horas seja entendido pelo
    sistema como um atraso).
  * Revisão e acertos diversos nos cálculos de totalização de horas.
================================================================================
CM$VER      3.01.10     23/07/2007
--------------------------------------------------------------------------------
(Pendência 25664)
- Sistemas \ Usuário \ Direitos \ Transações \ Controle Individual do Ponto
  * Criado opção para habilitar direitos ao uso do botão Abonar
(Pendência 25786)
- Sistemas \ Usuário \ Direitos \ Transações \ Controle Individual do Ponto
  * Criado opção para habilitar direitos ao uso do botão Considera Descanso
================================================================================
CM$VER      3.01.09     20/07/2007
--------------------------------------------------------------------------------
(Ref. Pendências 25352 e 25396)
- Consultas / Relatórios / Ponto ... / Operacionais / Marcação de Ponto por Pessoa:
  * Inclusão de informação sobre o Adicional Noturno;
  * Correção no tratamento de múltiplas batidas no mesmo dia.
================================================================================
CM$VER      3.01.08     18/07/2007
--------------------------------------------------------------------------------
(Ref. Pendência 25732)
- Transações / Controle Individual do Ponto e Lançamento Coletivo do Ponto:
  * Correção no cálculo da situação de múltiplas batidas no mesmo dia.
================================================================================
CM$VER      3.01.07     10/07/2007
--------------------------------------------------------------------------------
(Pendência 25732)
- Transações / Controle Individual do Ponto e Lançamento Coletivo do Ponto:
  * Tratamento e cálculo da situação de múltiplas batidas no mesmo dia.
(Pendência 25421)
- Consultas / Relatórios / Ponto ... / Operacionais/Marcação de Ponto por Pessoa:
  * Inclusão da opção para incluir rodapé com assinaturas.
================================================================================
CM$VER      3.01.06     02/07/2007
--------------------------------------------------------------------------------
(Pendência 25704)
- Transações / Lançamento Coletivo do Ponto:
  * Correção nas totalizações e lançamentos para a Folha e para o
    Banco de Horas.
(Pendência 25724)
- Transações / Controle Individual do Ponto e Lançamento Coletivo do Ponto:
  * Foi incluída a opção para indicar quais dias são tratados como DSR para
    efeito de hora extra ampliada em relação àquela realizada em dia normal
    de trabalho.
    Obs.: a tela Lançamento Coletivo do Ponto vai considerar as mesmas opções
             que o usuário informou na tela Controle Individual do Ponto.
 
================================================================================
CM$VER      3.01.05     25/06/2007
--------------------------------------------------------------------------------
(Pendência 25347)
- TDbParamRH:
  * Inclusão do campo PRAZOPONTO na tabela PARAMRH.
- Sistema / Configurações / Parâmetros do Sistema:
  * Inclusão do campo "Prazo para Fechamento do Ponto (em dias)".
- Transações / Controle Individual do Ponto:
  * Tratamento da restrição do "Prazo para Fechamento do Ponto".
- Transações / Registro Individual de Acesso:
  * O alerta agora observa o "Prazo para Fechamento do Ponto".
(Pendências 25352 e 25396)
- TCmCtrlRptModAcesso:
  * Inclusão do relatório 4775.
- TCtrlFerias:
  * Inclusão do método ListFeriasNoDia.
- TCtrlHoraTrab:
  * Inclusão do método ListHoraFunc.
- Consultas / Relatórios / Ponto ... / Operacionais:
  * Inclusão do relatório "Marcação de Ponto por Pessoa", com várias
   opções seletivas, configurando-se um relatório multi-uso.
================================================================================
CM$VER      3.01.04     08/06/2007
--------------------------------------------------------------------------------
(Pendência 25251 - Complementação)
- Transações / Controle Individual do Ponto:
 * Foi corrigida a distribuição de horas (banco e a pagar) no caso de horas extras
   realizadas em dia de folga.
================================================================================
CM$VER      3.01.03     04/06/2007
--------------------------------------------------------------------------------
(Pendência 25251)
- Transações / Controle Individual do Ponto:
 * Foi corrigida a totalização de horas no caso de horas extras antecipadas
   (antes da entrada) e em que o parâmetro "Máximo de horas extras" estivesse
   com 0 (zero).
================================================================================
CM$VER      3.01.02     30/05/2007
--------------------------------------------------------------------------------
(Pendência 25267)
- Transações / Controle Individual do Ponto / Apuração do Ponto no Período em Referência:
  * Os totais de minutos do Banco de Horas são agora exibidos também em horas:minutos.
(Pendência 25487)
- Transações / Controle Individual do Ponto:
  * O sistema agora traz, na data fim do período, a data atual do sistema e não a data do último dia do
    período aberto para o ponto, quando a data atual estiver inserida nesse período.
(Pendência 25425)
- Transações / Controle Individual do Ponto:
  * Ao editar batidas que estão na condição de "Múltiplas Batidas", o sistema agora retém
   a informação na tela, sem a necessidade de que esta seja fechada e reaberta.
================================================================================
CM$VER      3.01.01     18/05/2007
--------------------------------------------------------------------------------
- Transações / Controle Individual do Ponto:
  * O botão "Lançar" só é habilitado se o usuário tiver esse direito.
================================================================================
CM$VER      3.01.00     27/04/2007
--------------------------------------------------------------------------------
(Pendência 24920) 
- Sistema / Configuração / Parâmetros:
  * Inclusão, na divisória "Ponto Eletrônico", de uma caixa relativa ao Registro Individual de Acesso,
    onde o usuário poderá optar se:
    1) A Pessoa Pode Marcar Estando em Férias;
    2) A Pessoa Pode Marcar Estando Afastada;
    3) A Pessoa Pode Alterar Sua Batida.
- Transações / Registro Individual de Acesso:
  * Inclusão de críticas relativas aos parâmetros acima citados.
================================================================================
CM$VER      3.00.07     16/04/2007
--------------------------------------------------------------------------------
- Transações / Registro Individual de Acesso:
  (Pendência 25056)
  * O sistema agora inibe a marcação de intervalo se a pessoa não estiver 
    habilitada para tal.
  * O sistema agora inibe a marcação indevida de intervalo ou saída, caso
    as marcações antecessoras não tiverem ainda sido feitas.
  * O sistema agora permite múltiplas batidas no mesmo dia, pedindo ao
    usuário uma confirmação para essa ação.
- Transações / Controle Individual do Ponto:
  * O sistema agora permite a visualização, abono e edição de múltiplas
    batidas no mesmo dia.
================================================================================
CM$VER      3.00.06     05/04/2007
--------------------------------------------------------------------------------
- Consultas / Relatórios / Ponto ... / Operacionais / Acessos e Marcação de Ponto por Pessoa:
  * Implementação da opção para listar apenas uma pessoa.
================================================================================
CM$VER      3.00.05     02/04/2007
--------------------------------------------------------------------------------
- Consultas / Relatórios / Ponto ... / Cadastrais / Quadro de Horários de Trabalho:
  * Correção do relatório.
- Consultas / Relatórios / Ponto ... / Operacionais / Escala de Horários:
  * Correção do relatório.
================================================================================
CM$VER      3.00.04     26/03/2007
--------------------------------------------------------------------------------
- Transações / Revesamento de Horários de Trabalho:
  * Implementação da funcionalidade "inserção coletiva". 
================================================================================
CM$VER      3.00.03     06/03/2007
--------------------------------------------------------------------------------
(Pendência 24634)
- Transações / Registro Individual de Acesso:
  * Para exibição no rodapé da tela, o sistema agora busca data e hora no servidor
    do Banco de Dados, e não na máquina local.
================================================================================
CM$VER      3.00.02     15/02/2007
--------------------------------------------------------------------------------
(Pendência: 24472)
- Cadastros / Estação:
   * O sistema emite um alerta caso o usuário tente inserir uma estação com o
      mesmo nome de outra já cadastrada.
 
================================================================================
CM$VER      3.00.01     08/02/2007
--------------------------------------------------------------------------------
- Cadastros / Ocorrências e Exames (Motivos de Abono):
  * Inclusão da tela, que permite cadastrar as ocorrências, exames, etc. que possam ser
    usados como motivos de abono das ausências. Obs.: o sistema utiliza as mesmas 
    informações usadas também no Módulo RH - Medicina e Segurança do Trabalho.
- Transações / Registro Individual de Acesso:
  * Inclusão da tela, que permite que o usuário (que é também empregado) faça o seu 
    próprio registro do ponto. Para esse registro, o sistema busca data e hora no servidor
    do Banco de Dados (Pendência 24448), e não na máquina local.
- Transações / Controle Individual do Ponto:
  * Redesenho completo da tela, com inclusão dos campos Motivo e Observação.
- Consultas / Relatórios / Ponto ... / Operacionais / Cartão de Ponto:
  * Na coluna "Observações", consta agora a informação registrada no campo Motivo e, 
    na ausência deste, no campo Observação. Se nenhum dos dois estiverem registrados,
    exibe o conteúdo genérico que já era usado anteriormente.
- Consultas / Estatística de Motivos de Ausência:
  * Inclusão da tela, que mostra uma estatística da informação registrada no campo Motivo. 
================================================================================
CM$ALT}

























































































































































