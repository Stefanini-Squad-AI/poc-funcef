program Assistencial;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  FCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  FCadMestreDet in '..\..\Cm\Forms\Source\FCadMestreDet.pas' {frmCadMestreDetalhe},
  FCadMulti in '..\..\Cm\Forms\Source\FCadMulti.pas' {frmCadastroMulti},
  FConsAvancada in 'FConsAvancada.pas' {frmConsAvancada},
  RSimples in '..\..\Cm\Relats\Source\RSimples.pas',
  RMestreDet in '..\..\Cm\Relats\Source\RMestreDet.pas',
  RPai in '..\..\Cm\Relats\Source\RPai.pas' {relPai},
  FCliente in 'FCliente.pas',
  Message in 'Message.pas',
  FEstimaContr in 'FEstimaContr.pas' {frmEstimaContr},
  FNumInsc in 'FNumInsc.pas' {frmnuminsc},
  FCobraContribAss in 'FCobraContribAss.pas' {frmCobraContribuicao},
  FCadSitPlano in 'FCadSitPlano.pas' {frmCadSitPlano},
  fAssocTabCap in 'fAssocTabCap.pas' {frmAssocTabCap},
  FLerCodProvento in 'FLerCodProvento.pas' {frmLerCodProvento},
  FCadDatasPlanass in 'FCadDatasPlanass.pas' {frmCadDatasPlanass},
  FCadContribuicaoCS in 'FCadContribuicaoCS.pas' {frmCadContribuicaoCS},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FDivergContribAss in 'FDivergContribAss.pas' {frmDivergContribAss},
  FVlrDtDiverg in 'FVlrDtDiverg.pas' {frmVlrDtDiverg},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  fContrCalc in 'fContrCalc.pas' {frmContrCalc},
  dintegracapcar in 'dintegracapcar.pas' {dtmIntegraCAPCAR: TDataModule},
  FCadCalendPrev in 'fcadcalendprev.pas' {frmCadCalendPrev},
  FCalendDatas in 'fcalenddatas.pas' {frmCalendDatas},
  FCalendGeraAno in 'fcalendgeraano.pas' {frmCalendGeraAno},
  fCancBenefAss in 'fCancBenefAss.pas' {frmCancBenefAss},
  fPessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  DBaseDados in '..\..\Cm\Forms\Source\dBaseDados.pas' {dtmBaseDados: TDataModule},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports: TDataModule},
  FCadAlteradorContribCS in 'FCadAlteradorContribCS.pas' {frmCadAlteradorContribCS},
  uSincronismo in 'uSincronismo.pas',
  FConsultar in '..\..\Cm\Forms\Source\FConsultar.pas' {frmConsultar},
  fConsLote in 'fConsLote.pas' {frmConsLote},
  UDividaAssist in 'UDividaAssist.pas',
  DAPrev in 'daprev.pas' {dtmAPrev: TDataModule},
  FCtrlInterface in 'fctrlinterface.pas' {frmCtrlinterface},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  fCpLayout in 'fCpLayout.pas' {FrmCpLayout},
  UModulo in 'UModulo.pas',
  UMascaras in 'umascaras.pas',
  FPedeInfAux in 'fpedeinfaux.pas',
  UAdmPrev in 'UAdmPrev.pas',
  UFuncoesUteis in 'ufuncoesuteis.pas',
  UConsAvancPrev in 'UConsAvancPrev.pas',
  FCadGeralPart in 'FCadGeralPart.pas' {frmCadGeralPart},
  fCadBenSeguro in 'fCadBenSeguro.pas' {frmCadBenSeguro},
  fInserePart in 'fInserePart.pas' {FrmInserePart},
  FCadGrupoFamiliarass in 'FCadGrupoFamiliarass.pas' {FrmCadGrupoFamiliarass},
  FIntegraCAPCAR in 'fIntegraCapCar.pas' {frmIntegraCAPCAR},
  FCmReport in 'FCmReport.pas' {FrmCmReport},
  RBeneficiarios in 'RBeneficiarios.pas' {RptBeneficiarios},
  RTabCap in 'RTabCap.pas' {RptTabCap},
  RALTCAP in 'RALTCAP.pas' {RptAltCap},
  RCancelados in 'RCancelados.pas' {RptCancelados},
  RBenSegCancel in 'RBenSegCancel.pas' {RptBenSegCancel},
  uCmCtrlRptAssistencial in 'uCmCtrlRptAssistencial.pas',
  RTOTALENVIO in 'RTOTALENVIO.pas' {RptTotalEnvio},
  RFATURA in 'RFATURA.pas' {RptFatura},
  FProdass in 'FProdass.pas' {FrmProdass},
  fTpLayout in 'fTpLayout.pas' {FrmTpLayout},
  RParticipantes in 'RParticipantes.pas' {RptParticipantes},
  RBenSeg in 'RBenSeg.pas' {RptBenSeg},
  FAssocProvPatro in 'FAssocProvPatro.pas' {frmAssocProvPatro},
  fLgLayout in 'fLgLayout.pas' {frmLgLayout},
  ULayoutAss in 'ULayoutAss.pas',
  FRelPlanos in 'FRelPlanos.pas' {frmPlanAssist},
  RHeadFoot in '..\..\Cm\Relats\Source\RHeadFoot.pas' {relHeadFoot},
  fConsHistContrAss in 'fConsHistContrAss.pas' {frmConsultContr},
  RVlReceb in 'RVlReceb.pas' {RptVlReceb},
  UAdmAss in 'UAdmAss.pas',
  UContribuicaoPrev in 'UContribuicaoPrev.pas',
  rpartcancel in 'rpartcancel.pas' {RptPartCancel},
  RQtPart in 'RQtPart.pas' {RptQtPart},
  fAlteraDados in 'fAlteraDados.pas' {frmAlteraDados},
  RVlEnvio in 'RVlEnvio.pas' {RptVlEnvio},
  fCadHstContribuicao in 'fCadHstContribuicao.pas' {frmCadHstContribuicao},
  RTotalCalc in 'RTotalCalc.pas' {RptTotalCalc},
  RVlCalc in 'RVlCalc.pas' {RptVlCalc},
  fExportDados in 'fExportDados.pas' {frmExportDados},
  fImportDados in 'fImportDados.pas' {frmImportDados},
  RBoletos in 'rboletos.pas' {RptBoletos},
  FormataArquivo in 'FormataArquivo.pas' {FrmFormataArq},
  FDesfazEnvios in 'FDesfazEnvios.pas' {FrmDesfazEnvios},
  FCadCapSegAss in 'FCadCapSegAss.pas' {FRMCadCapSegAss},
  fAplicaDiferenca in 'fAplicaDiferenca.pas' {frmAplicaDiferenca},
  FFiltroRelFatura in 'FFiltroRelFatura.pas' {FrmFiltroRelFatura},
  dRelFat in 'dRelFat.pas' {dtmRelFat},
  dRelValsRecebPatro in 'dRelValsRecebPatro.pas' {dtmRelValsRecebPatro},
  fParamRelValRecebPatro in 'fParamRelValRecebPatro.pas' {frmParamRelValRecebPatro},
  FCadDepenBenef in 'FCadDepenBenef.pas' {frmCadDepenBenef},
  FCadSinistros in 'FCadSinistros.pas' {FrmCadSinistros},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FCadPartAss in 'FCadPartAss.pas' {FrmCadPartAss},
  FCadPlanass in 'FCadPlanass.pas' {FrmCadPlanass},
  FParamAssist in 'FParamAssist.pas' {FrmParamAssist},
  FPedeOpcoesPlano in 'FPedeOpcoesPlano.pas' {FrmPedeOpcoesPlano},
  FCadOpcoesPartAss in 'FCadOpcoesPartAss.pas' {FrmCadOpcoesPartAss},
  FCancPartAss in 'FCancPartAss.pas' {FrmCancPartAss},
  fInscBenefAss in 'fInscBenefAss.pas' {frmInscBenefAss},
  FSincoPrevAss in 'FSincoPrevAss.pas' {FrmSincoPrevAss},
  FRecebeContribuicao in 'FRecebeContribuicao.pas' {frmRecebeContribuicao},
  FLancCAP in 'FLancCAP.pas' {FrmLancCap},
  FMigraPlano in 'FMigraPlano.pas' {FrmMigraPlano};

{$R *.RES}
{$R ASSISTENCIAL_RES.RES}

begin
  frmcmEntrada:= TfrmcmEntrada.Create(Application);
  frmcmEntrada.Show;
  frmcmEntrada.Update;

  Application.Initialize;
  Application.Title := 'Administração Assistencial';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtmAPrev, dtmAPrev);
  Application.CreateForm(TdtmIntegraCAPCAR, dtmIntegraCAPCAR);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmcmEntrada.Hide;
  frmcmEntrada.Free;

  //sTipoPrevidencia := 'F';

  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo AdmAssistencial
================================================================================
CM$VER      3.01.09g    07/12/2007
--------------------------------------------------------------------------------
- Resoluçaõ da Pendência Nº 26637
  Tela\Opção No Sistema: Contribuições | Preparo de Contribuições
  Descrição: - Acerto no insert que estava gravando idpessoa e idtitular = 0.
             - Acerto na qryVerifContrib da fContrCalc.
             -Colocando filtro sitrecebimento = 1 para não pagas, e 3 para as
             outras opções.
             - Colocando Commit no final de mensagem de Efetuado com Sucesso.
             - NVL(PARTASS.FLGINSCRICAOCANC,0) = 0 no MontaSelect.
- Resoluçaõ da Pendência Nº 26837
  Tela\Opção No Sistema: Cadastro | Plano
  Descrição: - Acrescentado campo situação na fCadPlanass.
             - Acrescentado outer join do campo idestab na query principal.
================================================================================
CM$VER      3.01.09f    08/11/2007
--------------------------------------------------------------------------------
- Resoluçaõ da Pendência Nº 26638
  Tela\Opção No Sistema: Cadastro | Participantes | Incluir/Alterar Participante
  Descrição: Foi criado um RadioGroup para controlar o FLGCOBCARNE
================================================================================
CM$VER      3.01.09e    07/11/2007
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 26714
  Tela\Opçao No Sistema: Contribuições | Envio de Contribuição
  Descrição: Acerto na nas condições que usam o FLGCOBCARNE
================================================================================
CM$VER      3.01.09d    06/11/2007
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 26793
  Tela\Opçao No Sistema: Contribuições | Desfaz envio
  Descrição: Adicionando condição no MontaSelect.
================================================================================
CM$VER      3.01.09c    26/10/2007
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 25570 reabertura
  Tela\Opçao No Sistema: Cadastros | Dependentes
  Descrição: Retirando check para inscrição e cancelamento de Beneficiário no Plano
             Assistencial e acrescentando botão de Inscrição e Cancelamento.
================================================================================
CM$VER      3.01.09b    18/10/2007
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 25570
  Tela\Opçao No Sistema: Cadastros | Dependentes
  Descrição: Acrescentando filtro na Query qry para pegar o plano correto.
             Acrescentando a criação do form frmCancBenefAss na função CancelaBenefPlanAss.
             Colocando a propriedade modalresult para mrNone no botão bbtnConfirmar
             nos forms fCancBenefAss e fInscBenefAss.
================================================================================
CM$VER      3.01.09a    18/10/2007
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 26570
  Tela\Opçao No Sistema: Relatórios/ AdmAssistencial/Analíticos/Contribuições Recebidas
  Descrição: Inserido Filtro para Tipo de Folha no relatório
================================================================================
CM$VER      3.01.09     23/07/2007
--------------------------------------------------------------------------------
* Liberação de versão no padrão 5.10.17.
================================================================================
CM$VER      3.01.07     06/06/2007
--------------------------------------------------------------------------------
* Liberação de versão no padrão 5.10.16.
================================================================================
CM$VER      3.01.06a    06/06/2007
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 25507
  Tela\Opçao No Sistema: Cadastro de Dependentes Assistenciais
  Descrição: Incluir informação do plano assistencial na seleção de pessoa.
             Resolver erro que aparecia quando se associava o dependente ao plano assistencial ("EDataBaseError - qryEndPess: Dataset not in edit or insert mode").
================================================================================
CM$VER      3.01.06     03/04/2007
--------------------------------------------------------------------------------
* Liberação de versão no padrão 5.10.15.
- Resolução da Pendência Nº 25395
  Tela\Opçao No Sistema: Contribuições | Preparo de Contribuições | Desfazer
  Descrição: Acerto na consulta de participante com inclusão da funcionalidade NVL.
- Resolução da Pendência Nº 24340
  Tela\Opçao No Sistema: Cadastro | Participantes | Inclusão e Alteração
  Descrição: Acerto na rotina de gravação de novos planos.
================================================================================
CM$VER      3.01.05     14/02/2007
--------------------------------------------------------------------------------
* Liberação de versão no padrão 5.10.14.
- Resolução da Pendência Nº 24812
  Tela\Opçao No Sistema: Cadastro | Participantes | Inclusão e Alteração
  Descrição:
            - Correção para gravar corretamente as contribuições.
            - Acerto na gravação dos campos VALORBASE.
            - Acerto na query da regra de cálculo das opções.
            - Acerto no preparo de contribuições de assistidos.
            - Acerto no envio de contribuições para o banco.
            - Acerto no lançamento da ficha financeira das contribuições.
- Resolução da Pendência Nº 24340
  Tela\Opçao No Sistema: Cadastro | Participantes | Inclusão e Alteração
  Descrição: Acerto na consideração de contribuições marcadas para pagamento.
- Resolução da Pendência Nº 24354
  Tela\Opçao No Sistema: Contribuições | Preparo de contribuições
  Descrição: Acerto na variável do mês de referência.
================================================================================
CM$VER      3.01.04     04/01/2007
--------------------------------------------------------------------------------
- Liberação de versão no padrão 5.10.13.
*
- Resolução da Pendência Nº 24097
  Tela\Opçao No Sistema: Preparo de contribuições
  Descrição: Acerto na consideração de nº de opções válidas.
- Resolução da Pendência Nº 23922
  Tela\Opçao No Sistema: Cadastro | Participantes | Cancelamento
  Descrição: Correção para retirar referencia ao campo IDSITPLANOASS.
================================================================================
CM$VER      3.01.03     15/09/2006
--------------------------------------------------------------------------------
- Liberação de versão no padrão 5.10.12.
================================================================================
CM$VER      3.01.02     28/07/2006
--------------------------------------------------------------------------------
- Liberação de versão no padrão 5.10.11.
================================================================================
CM$VER      3.01.01     12/07/2006
--------------------------------------------------------------------------------
- Liberação de versão no padrão 5.10.10
================================================================================
CM$VER      3.01.00     09/05/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 16826
  Tela\Opçao No Sistema: Cadastro | Dependentes
  Descrição: Correção para segregar os dependentes de forma que só apareçam os
             dependentes assistenciais no Modulo Assistencial.
- Resolução da Pendência Nº 19265
  Tela\Opçao No Sistema: Contribuições | Envio
  Descrição: Correção na captura de datas na tela de envio de contribuições assistenciais;
             Implementação do desfazer na tela de Envio para desfazer somente o envio e não o preparo.
	     mudança da rotina para compatibilidades com nova metodologia de cadastro.
- Resolução da Pendência Nº 21206
  Tela\Opçao No Sistema: Contribuição | Sincronização com o Previdenciário
  Descrição: Retirada da opção do menu principal e transferir a operação para ser realizada 
	     como um passo no preparo de contribuição.
- Resolução da Pendência Nº 21360
  Tela\Opçao No Sistema: Contribuição | Tratamento de divergências
  Descrição: Revisão da tela de tratamento de divergências
- Resolução da Pendência Nº 21625/21765
  Tela\Opçao No Sistema: Cadastro | Cadastro de Participantes
  Descrição: Implementação das telas abaixo para o padrão CM separando-as da atual tela:
             - tela de cadastro de Participantes (Inclusão de plano); e
             - tela de cadastro de Participantes (Cancelamento de plano).
- Resolução da Pendência Nº 21625/15504
  Tela\Opçao No Sistema: Cadastro | Planos Assistenciais
  Descrição: Implementação de diversas telas para o padrão CM separando-as da atual tela:
             - tela de cadastro de Planos.
- Resolução da Pendência Nº 21625/21766
  Tela\Opçao No Sistema: Cadastro | Dependentes
  Descrição: Implementação de diversas telas para o padrão CM separando-as da atual tela:
             - tela de cadastro de Dependentes do Participantes.
- Resolução da Pendência Nº 21625/21767
  Tela\Opçao No Sistema: Cadastro | Beneficiários
  Descrição: Implementação de diversas telas para o padrão CM separando-as da atual tela:
             - tela de cadastro de Beneficiários participantes do Plano.
- Resolução da Pendência Nº 21625/20874
  Tela\Opçao No Sistema: Cadastro | (diversas telas)
  Descrição: Criação de tabela e tela para cadastrar beneficiários do participante, ou seja,  
	     recebedores de algum benefício assistencial.
             Criação da estrutura VALORBASE nas  tabelas para criar facilidades para relatórios e rotinas a serem criadas,
	     atendendo a solicitação da estrutura da nova regra de seguro a ser implantada.
- Resolução da Pendência Nº 21762
  Tela\Opçao No Sistema: Contribuição | Sincronização com o Previdenciário
  Descrição: Implementação para correção da tela de sincronização que só verificava falecimentos no previdenciário.  
             Verificação de mudanças ocorrida no previdenciário para atualizar o assistencial:
	       * mudança da situação para assistido;
	       * mudança da situação para ativo;
	       * mudança da situação para mantido;
	       * falecimento;
	       * demissão da patrocinadora;
	       * mudança de plano previdenciário.
	     Todas estas mudanças, após confirmação do operador, implicarão em atualização automática nos dados assistenciais.
================================================================================
CM$VER      3.00.18a    14/03/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 21743
  Tela\Opçao No Sistema: Contribuições | Cobranças | Envio
  Descrição: Correção na consulta para pegar o portador forma correto para envio
             de cobrança bancária.
================================================================================
CM$VER      3.00.18     24/01/2006
--------------------------------------------------------------------------------
Liberação de Padrão 5.10.08
================================================================================
CM$VER      3.00.17a    24/01/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 19265
  Tela\Opçao No Sistema: Contribuições | Cobranças | Desfazer Envio
  Descrição: Criação da rotina de Desfazer Individual
- Resolução da Pendência Nº 19224
  Tela\Opçao No Sistema: Contribuições | Cobranças | Envio
  Descrição: Acerto na parametrização contábil / financeira
================================================================================
CM$VER      3.00.17     21/07/2005
--------------------------------------------------------------------------------
Liberação no padrão 5.10.07
================================================================================
CM$VER      3.00.16     11/05/2005
--------------------------------------------------------------------------------
Liberação no padrão 5.10.06
================================================================================
CM$VER      3.00.15m    11/01/2005
--------------------------------------------------------------------------------
Pendência: 17423
Tela: Cadastros \ Sinistros
Descrição: Foi colocado para funcionar o campo oservação.
================================================================================
CM$VER      3.00.15l    05/11/2004
--------------------------------------------------------------------------------
Pendência: 18058
Tela: Contribuições \ Cobrança \ Envio
Descrição: Incluir na consulta de envio junção entre as tabelas CONTASS e ELEGPATRO.
================================================================================
CM$VER      3.00.15k    14/10/2004
--------------------------------------------------------------------------------
Pendência: 17090
Tela: Contribuições \ Cobrança \ Envio
Descrição: Foi corrigido o problema que não permitia o envio das cobranças bancárias para uma única patrocinadora.
Pendência: 17703
Tela: Cadastros \ Capitais
Descrição: Foi corrigido o problema que não permitia alterar o valor R$ 100.000,00 para R$ 103.000,00 marcanco apenas o 0 (zero) substituído pelo 3 (três).
================================================================================
CM$VER      3.00.15j    27/09/2004
--------------------------------------------------------------------------------
Pendência: 17794
Tela: Abertura da Tela de Integração Contábil e Financeira
Descrição: A tela de Integração Contábil e Financeira não está sendo aberta.
================================================================================
CM$VER      3.00.15i    24/09/2004
--------------------------------------------------------------------------------
Pendência: 17780
Tela: Integração Contábil/Financeira
Descrição: Ajuste na exibição das listas de código de desembolso e recebimento, que não estão aparecendo nas pastas Contas a Receber e Devolução.
================================================================================
CM$VER      3.00.15h    13/09/2004
--------------------------------------------------------------------------------
Pendência Nº 17424 - Não se está executando um relatório elaborado no Gerador de Relatórios.
================================================================================
CM$VER      3.00.15g    28/06/2004
--------------------------------------------------------------------------------
Pendência Nº 17074 - Incluir um campo para armazenar a informação de data de 
vigência da apólice no Cadastro de Sinistros.
================================================================================
CM$VER      3.00.15f    07/06/2004
--------------------------------------------------------------------------------
Pendência Nº 16945 - No Cadastro Geral de Participantes as informações relativas
a Planos e Contribuições Assistenciais estão vindo em duplicidade.
================================================================================
CM$VER      3.00.15e    31/05/2004
--------------------------------------------------------------------------------
Pendência Nº 16853 - - Retirar os parametros IDMOTIVOCONTRIBA, 
IDMOTIVOATRASOAS, IDMOTIVODEVOLAS, IDMOTIVOFINANCAS, 
IDMOTIVOFORMPAG e IDMOTIVOFORMCOMA
da tabela PARAMAPREV e colocá-los na tabela PARAMASSIST.
================================================================================
CM$VER      3.00.15d    26/05/2004
--------------------------------------------------------------------------------
Pendência Nº 16825 - Criação do Controle de Sinistros
Pendência Nº 16827 - Erro ao fazer o envio das contribuições de
 ativos da patrocinadora CBTU.
================================================================================
CM$VER      3.00.15c    19/05/2004
--------------------------------------------------------------------------------
Pendência Nº 16261 - No Cadastro Geral de Participantes , alterar a tela de cadastro
para que, quando um participante seja cancelado, seja possível consultá-lo nesta tela. 
Hoje, o sistema não permite mais consultar seus dados. 
Pendência Nº 16777 - Gravação da nova chave primária sequencial (idtmpdesc).
================================================================================
CM$VER      3.00.15b    06/04/2004
--------------------------------------------------------------------------------
Pendência Nº 16259 - Relatorios | Analiticos | Boletos - Acertar divergências entre 
a opção de apropriação, recebidos e pendentes. Num exemplo prático ao tirar o 
relatório para um determinado mês, marcando apropriação saem 54 linhas, marcando
recebido saem 27 linhas. Logo, marcando pendentes deveriam sair mais 27 linhas. 
Porém, o relatório de pendentes sai em branco.
Pendência Nº 16262 - Relatorio de Fatura - A fatura emitida está com erro em todos os 
valores calculados. 
Pendência Nº 16263 - Relatorios | Cadastrais | Participantes - Este relatório sai
 SEMPRE em branco.
Pendência Nº 16264 - A Consulta Geral de Pessoa não funciona quando acessada
pelo módulo Assistencial. Após selecionar a matrícula, os campos aparecem em branco. 
Isto está ocorrendo apenas quando a consulta é acessada pelo módulo Assistencial. 
Acessando por outro módulo ela funciona corretamente.
Pendência Nº 16261 - Cadastro de Participantes - Alterar a tela de cadastro de 
participantes para que, quando um participante seja cancelado, seja possível 
consultá-lo nesta tela. Hoje, o sistema não permite mais consultar seus dados. 
================================================================================
CM$VER      3.00.15a    22/12/2003
--------------------------------------------------------------------------------
Pendência Nº  15467 - Alterar exibição de Centro de Custo e Centro de Responsabilidade: para
NOVOS registros, filtrar qualquer lista de CC e CR pelo plano vigente
(IDPLANCENTCUST = Sistema.PlanoCC e IDPLANCENTRESPON = Sistema.PlanoCR,
respectivamente). Na exibição do código, passar a usar o campo
CODEXTERNO.
Os campos a gravar permanecem como estão (CODCENTROCUSTO e
CODCENTRORESPON).
Usar um dataset ÚNICO (CMSqlParams + CMClientDataSet, em caso de
multi-camadas) para o sistema inteiro (deve ficar em um datamodule já
existente ou a ser criado)
Pendência Nº - 15470 - Alterar exibição de Centro de Custo e Centro de Responsabilidade: para
NOVOS registros, filtrar qualquer lista de CC e CR pelo plano vigente
(IDPLANCENTCUST = Sistema.PlanoCC e IDPLANCENTRESPON = Sistema.PlanoCR,
respectivamente). Na exibição do código, passar a usar o campo
CODEXTERNO.
Os campos a gravar permanecem como estão (CODCENTROCUSTO e
CODCENTRORESPON).
Usar um dataset ÚNICO (CMSqlParams + CMClientDataSet, em caso de
multi-camadas) para o sistema inteiro (deve ficar em um datamodule já
existente ou a ser criado)
================================================================================
CM$VER      3.00.15     10/12/2003
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.02
================================================================================
CM$VER      3.00.14c    02/12/2003
--------------------------------------------------------------------------------
Pendência Nº 15745 - Ao fazer o preparo de Dezembro/03, o sistema apresentou a seguinte mensagem:
Erro: General SQL error
ORA-00923 FROM Keyword not found where expected
================================================================================
CM$VER      3.00.14b    05/11/2003
--------------------------------------------------------------------------------
Resolução da Pendencia 15472 : Revisão de toda a rotina da tela de 
Cadastro / Participantes, pois algumas funções não estão funcionando.
================================================================================
CM$VER      3.00.14a    27/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15501
  > Tela\Opçao No Sistema: Cadastros / Dependentes
  Não permitir cadastrar um dependente para um beneficiario que não seja participante  assistencial.
Mostrar o Plano Assistencial do Beneficiário.
- Resolução da Pendência Nº 15241
  > Tela\Opçao No Sistema: Cadastros/Dependentes
  Criar um campo de data de inscrição no plano assistencial, pois ao cadastrar um dependente/beneficiário assistencial, o sistema coloca como data o dia atual, e sendo necessário alterar a data de entrada após o cadastro.
- Resolução da Pendência Nº 15173
  > Tela\Opçao No Sistema: Consultas/Relatórios/Analíticos/Cálculo de Contribuições
  O relatório não está trazendo dados, quando existe algum participante assistencial com o campo IDESTAB vazio na tabela ELEGPATRO.
Alterar a query colocando um left join  AND (EP.IDESTAB  = PR.IDPESSOA(+)) 
================================================================================
CM$VER      3.00.14     24/10/2003
--------------------------------------------------------------------------------
p.15170
p.15171
p.15175 
p.15176
p.15186 
p.15188 
p.15189
p.15233
p.15234
p.15235
p.15236
p.15238
p.15240
p.15242
p.15070 
================================================================================
CM$VER      3.00.13     15/10/2003
--------------------------------------------------------------------------------
>Ajuste na query qryValores da tela FrmLancCap
>Acertos na tela de tratamento de divergências
================================================================================
CM$VER      3.00.11     13/10/2003
--------------------------------------------------------------------------------
>Resolução da pendência 15124: Ao tentar inserir um dependente para Beneficiário do Plano, está apresentando erro de Access violation.
>Resolução da pendência 15125: Ao inserir um pensionista em um grupo familiar e logo após consultá-lo, não aparece na tela os dados gravados.
- Resolução da Pendência Nº 15108
  > Tela\Opçao No Sistema: Contribuições\Preparo\Normal
  Não está sendo possível fazero preparo para CBTU
- Resolução da Pendência Nº 14998
  > Tela\Opçao No Sistema: COBRANÇA
  No envio da cobrança de seguro o sistema deveria fazer o lançamento automático no contas a pagar do valor segregado.
- Resolução da Pendência Nº 14987
  > Tela\Opçao No Sistema: Cadastro\Auxiliares\Atualizar Plano Previdenciário
  Rever todo o algorítmo de sincronização das tabelas do Assistencial com a Tabela PartPrevPlan do Previdencial, pois apresentou problemas na refer.
================================================================================
CM$VER      3.00.10j    29/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15108
  > Tela\Opçao No Sistema: Contribuições\Preparo\Normal
  Não está sendo possível fazero preparo para CBTU
- Resolução da Pendência Nº 14987
  > Tela\Opçao No Sistema: Cadastro\Auxiliares\Atualizar Plano Previdenciário
  Rever todo o algorítmo de sincronização das tabelas do Assistencial com a Tabela PartPrevPlan do Previdencial, pois apresentou problemas na refer.
================================================================================
CM$VER      3.00.07j    29/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14164
  > Tela\Opçao No Sistema: Contribuições/Cobrança/Recebimento
  O recebimento não está filtrando por patrocinadora.
================================================================================
CM$VER      3.00.07i    27/05/2003
--------------------------------------------------------------------------------
> Pequeno ajuste no Relatório de Demonstrativo de valores Calculados X valores recebidos
- Resolução da Pendência Nº 14131
  > Tela\Opçao No Sistema: Cobrança/envio - Cobrança/Preparo
  Criar um botão (inverter seleçaão) para que seja possível a seleção de todos os itens do checklistBox.
================================================================================
CM$VER      3.00.07h    26/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13981
  > Tela\Opçao No Sistema: Relatórios
  Implementar um relatório (FATURA) de Valores Recebidos.
================================================================================
CM$VER      3.00.07g    19/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13983
  > Tela\Opçao No Sistema: Consulta\Histórico de Cobranças
  Incluir na consulta desta tela a cobrança de divergência por pessoa. Selecionar no montaSelect uma pessoa e visualizar as divergências cobradas.
- Resolução da Pendência Nº 13982
  > Tela\Opçao No Sistema: Relatórios
  Implementar um relatório (Analítico) que visualize as divergências cobradas no mês.
================================================================================
CM$VER      3.00.07f    12/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13146
  > Tela\Opçao No Sistema: Contribuições/Cobrança/Recebimento/Recebimento de Cobranças Via Interface
  Recebimento dos pagamentos efetuados através de descontos em folha de pagamento das patrocinadoras utilizando o interfacePrev.
a) Fazer o batimento das informações entre o envio do pagamento efetuado para a seguradora, o pagamento dos prêmios e o retorno dos descontos ocorridos na folha de pagamentop das patrocinadoras.
Ao fim do processamento o usuário ficará sabendo.
a.a) se houve demissão na patrocinadora e consequentemente o pagamento de prêmio a maior para a seguradora.
a.b.) se houve contratação na patrocinadora e consequentemente não houve o repasse do prêmio para a seguradora, pagamento a menor.
a.c.) se não houve pagamento, devido o participante se encontrar em auxílio doença, e o desconto ter sido efetuado na folha de assistidos.
a.d.) se não houve o pagamento em nenhum dos lados, tanto na folha de assistidos quanto na folha de pagamento da patrocinadora, devido o termino da licença e o retorno do participante para a patrocinadora. continua no anexo.
- Resolução da Pendência Nº 13145
  > Tela\Opçao No Sistema: Contribuições/Divergências/Tratamento de Divergências/Tratamento de Divergencia de Cobranças
  Tratamento de divergência.
No tratamento de divergência terá que se fazer o recebimento das prestações enviadas as patrocinadoras, folha de assistidos e das boletas, fazer a atualização dos valores não recebidos, da diferença dos valores recebidos a menor e a devolução dos valores recebidos a maior, fazer o reenvio das divergências tratadas para folha de pagto, boletas e deb. C/C.
Patrocinadora: o usuário poderá escolher a patrocinadora a qual deseja fazer o tratamento de divergência.
a) CBTU
b) RFFSA
Tipo de Plano: o usuário poderá escolher o tipo de plano ao qual deseja fazer o tratamento de divergência.
A) Plano A
b) Plano B
Situação do Participante: o usuário poderá escolher a situação em que se encontra o participante a qual se deseja fazer o tratamento de divergência.
a) Ativo
b) Assistido
c) Auto Patrocinado
d) Matricula
Nota: esta rotina terá que fazer cálculo nas diferenças encontradas a maior e a menor.
Atualização Monetária
Juros
Multa
================================================================================
CM$VER      3.00.07c    05/05/2003
--------------------------------------------------------------------------------
* Ajuste na query de exportação de arquivos para seguradora, preparo e faturas.
================================================================================
CM$VER      3.00.07b    28/04/2003
--------------------------------------------------------------------------------
> Resolução da pendência 13858
================================================================================
CM$VER      3.00.07a    22/04/2003
--------------------------------------------------------------------------------
> Resolução da pendência 13799 - Implementação de novo relatório de fatura, pois o antigo está obsoleto e apresenta divergência nos valores.
================================================================================
CM$VER      3.00.06c    15/04/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13145
  > Tela\Opçao No Sistema: Contribuições/Divergências/Tratamento de Divergências/Tratamento de Divergencia de Cobranças
  Tratamento de divergência.
No tratamento de divergência terá que se fazer o recebimento das prestações enviadas as patrocinadoras, folha de assistidos e das boletas, fazer a atualização dos valores não recebidos, da diferença dos valores recebidos a menor e a devolução dos valores recebidos a maior, fazer o reenvio das divergências tratadas para folha de pagto, boletas e deb. C/C.
Patrocinadora: o usuário poderá escolher a patrocinadora a qual deseja fazer o tratamento de divergência.
a) CBTU
b) RFFSA
Tipo de Plano: o usuário poderá escolher o tipo de plano ao qual deseja fazer o tratamento de divergência.
A) Plano A
b) Plano B
Situação do Participante: o usuário poderá escolher a situação em que se encontra o participante a qual se deseja fazer o tratamento de divergência.
a) Ativo
b) Assistido
c) Auto Patrocinado
d) Matricula
Nota: esta rotina terá que fazer cálculo nas diferenças encontradas a maior e a menor.
Atualização Monetária
Juros
Multa
- Resolução da Pendência Nº 13146
  > Tela\Opçao No Sistema: Contribuições/Cobrança/Recebimento/Recebimento de Cobranças Via Interface
  Recebimento dos pagamentos efetuados através de descontos em folha de pagamento das patrocinadoras utilizando o interfacePrev.
a) Fazer o batimento das informações entre o envio do pagamento efetuado para a seguradora, o pagamento dos prêmios e o retorno dos descontos ocorridos na folha de pagamentop das patrocinadoras.
Ao fim do processamento o usuário ficará sabendo.
a.a) se houve demissão na patrocinadora e consequentemente o pagamento de prêmio a maior para a seguradora.
a.b.) se houve contratação na patrocinadora e consequentemente não houve o repasse do prêmio para a seguradora, pagamento a menor.
a.c.) se não houve pagamento, devido o participante se encontrar em auxílio doença, e o desconto ter sido efetuado na folha de assistidos.
a.d.) se não houve o pagamento em nenhum dos lados, tanto na folha de assistidos quanto na folha de pagamento da patrocinadora, devido o termino da licença e o retorno do participante para a patrocinadora. continua no anexo.
================================================================================
CM$VER      3.00.06b    10/04/2003
--------------------------------------------------------------------------------
* Pequeno ajuste na tela de Atualizaçaõ de Plano previdenciário.
================================================================================
CM$VER      3.00.06a    08/04/2003
--------------------------------------------------------------------------------
** Atualiza a o plano assistencial do participante de acordo com novo plano Previdenciário e nova patro Patro.
================================================================================
CM$VER      3.00.05c    03/04/2003
--------------------------------------------------------------------------------
Ajustes nas queries da tela 'Exportação de informações para arquivos' que estavam apresentando produto carteziano.
================================================================================
CM$VER      3.00.05b    19/05/2003
--------------------------------------------------------------------------------
*Acerto na tela de Cadastro de Capitais
- Resolução da Pendência Nº 13983
  > Tela\Opçao No Sistema: Consulta\Histórico de Cobranças
  Incluir na consulta desta tela a cobrança de divergência por pessoa. Selecionar no montaSelect uma pessoa e visualizar as divergências cobradas.
- Resolução da Pendência Nº 13982
  > Tela\Opçao No Sistema: Relatórios
  Implementar um relatório (Analítico) que visualize as divergências cobradas no mês.
================================================================================
CM$VER      3.00.05a    07/05/2003
--------------------------------------------------------------------------------
*ACERTO NA QUERy DO DESFAZER
================================================================================
CM$VER      3.00.05     18/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12993
  > Tela\Opçao No Sistema: a implementar
  Aplicar o reajuste de 15,25% nos prêmios mensais do seguro de vida em grupo, conforme renovação da apólice.
- Resolução da Pendência Nº 13107
  > Tela\Opçao No Sistema: Cadastro de Capitais
  Criar uma tela de cadastro mestre detalhe para dar manutenção 'a tabela CapSegAss.
================================================================================
CM$VER      3.00.04a    13/03/2003
--------------------------------------------------------------------------------
* Com atualizações nas queries que buscam as patrocinadoras;
* Com atualização e otimização na query de busca para na tela cadastro/Auxiliares/Atualizar Plano Previdenciário.
================================================================================
CM$VER      3.00.03     13/12/2002
--------------------------------------------------------------------------------
Tela de Exportação - Permitir selecionar uma ou mais patrocinadoras ao mesmo tempo.
Alteração na query do relatório de Fatura para buscar somente os participantes ativos no
 Plano Assistencial.
.
================================================================================
CM$ALT}























































