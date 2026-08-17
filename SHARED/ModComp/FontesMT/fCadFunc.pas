{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
 Atender.......: WO16172
 Data Alteração: 12/11/2024
 Responsável...: Leandro Pocebon
 Descrição.....: Habilita a opção de união estavel somenete quando estado civil for
                 diferente de casado.
--------------------------------------------------------------------------------
 Atender.......: WO12254
 Data Alteração: 11/07/2024
 Responsável...: Luis Ferrari
 Descrição.....: Na Validação da Informação Origem Cessão do Trabalhador na aba Situação Funcional
                 não olhe mais pelo Tipo de Contrato de Trabalho e sim pela Categoria do Trabalhador para o Esocial
                 Quando for CODIGOESOCIAL in(305,410)
--------------------------------------------------------------------------------
 Atender.......: WO12255
 Data Alteração: 12/07/2024
 Responsável...: Luis Ferrari
 Descrição.....: Alteração de Validação no campo Data Final da Aba Situação Funcional
                 do item Prazo Det. ou Experiência agora ficou de fora da validação
                 AUTONOMO, CESSAO e PROP/DIR S/ VINC 
--------------------------------------------------------------------------------
 WO ...........: 11098
 Data Alteração: 07/06/2024
 Responsável...: Arnaldo Vicente Scarin
 Descrição.....: Inclusão do campos "Possui Seguro de Vida em Grupo"
--------------------------------------------------------------------------------
 Nº SIG........: 136024
 Data Alteração: 09/06/2023
 Responsável...: Everson Cunha
 Descrição.....: Inclusão dos campos Tempo Residência e Condição Ingresso Traba-
                 lhador - Estrangeiro
--------------------------------------------------------------------------------
 Nº SIG........: 134422
 Data Alteração: 11/05/2023
 Responsável...: Everson Cunha
 Descrição.....: Inclusão do campo E-mail Pessoal - cm.pessoafisica.emailfuncef
--------------------------------------------------------------------------------
 Nº SIG........: 127819
 Data Alteração: 06/10/2022
 Responsável...: Everson Cunha
 Descrição.....: Apresentar coluna com a situação do dependente
--------------------------------------------------------------------------------
 N. SIG.............: 118900
 Data da Alteração..: 16/09/2021
 Responsável........: Everson Cunha
 Descrição..........: Retornar campo que havia sido retirado da tela
-------------------------------------------------------------------------------- 
 N. SIG.............: 112819
 Data da Alteração..: 20/01/2021
 Responsável........: Andre Imakawa
 Descrição..........: Criticas para preenchimento de dados da aba Situacao 
                      Funcional
--------------------------------------------------------------------------------
 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 N. SIG..........   : 96978
 Data da Alteração: : 16/06/2020
 Responsável:       : Edilaine
 Descrição.......   : Criticas para preenchimento de dados da aba Situacao
                      Funcional
--------------------------------------------------------------------------------
 N. SIG..........   : 99908
 Data da Alteração: : 20/05/2020
 Responsável:       : Edilaine
 Descrição.......   : inclusão IDPESSOA no cadastro de telefone
--------------------------------------------------------------------------------
 N. SIG..........   : 90602
 Data da Alteração: : 20/08/2019
 Responsável:       : Everson Cunha
 Descrição.......   : Correções após subir SIG70569
--------------------------------------------------------------------------------
//N. SIG..........   : 70569
//Data da Alteração: : 08/08/2019
//Responsável:       : Everson Cunha
//Descrição.......   : Melhorias no cadastro de processos para adequação a
//                     versão 2.4.02 do manual do eSocial
--------------------------------------------------------------------------------
//Rotina             : .dfm
//N. SIG..........   : SIG TIBERO
//Data da Alteração: : 22/10/2018
//Alteração Form:    : fCadFunc
//Responsável:       : Everson Luiz Pereira da Cunha
//Descrição.......   : Inclusão do DisplayFormat = dd/MM/yyyy em todos os campos
//                     de data
--------------------------------------------------------------------------------
//Rotina             : Create
//N. SIG..........   : 64144
//Data da Alteração: : 05/03/2018
//Alteração Form:    : fCadFunc
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Alteração na forma de criação da classe TCtrlPessoaFuncionario.
--------------------------------------------------------------------------------
//Rotina             : cbbTipoProcChange, bbtnOkDetClick, sbtnInsDetClick
//N. SIG..........   : 62232
//Data da Alteração: : 07/02/2018
//Alteração Form:    : fCadFunc
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Correção aplicada sobre a aba de Processos, adaptando as
//                     necessidades da versão da eSocial.
//***************************************************************************************
//Rotina             : dblckCargo1Change
//N. SIG..........   : 62992
//Data da Alteração: : 06/02/2018
//Alteração Form:    : fCadFunc
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Correção aplicada na aba Situação Funcional, permitindo a definição
//                     de dados de estágio, quando o tipo de cargo for determinado. 
//***************************************************************************************
//Rotina             : dblckCargo1Change, dbrgTipContraChange
//N. SIG..........   : 62180
//Data da Alteração: : 24/01/2018
//Alteração Form:    : fCadFunc
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Correção na aba Situação Funcional, permitindo que o agente de
//                     integração seja preenchido quando for selecionado o cargo
//                     AUXILIAR ADMINISTRATIVO - APRENDIZ.    
//***************************************************************************************
//***************************************************************************************
//Rotina             : FormCreate, VerificaAbaGeral, dbrgContrPrevChange, dbrgIsentoChange,
//										           tbshEstrangeiroEnter, CdsAfterInsert, bbtnConfirmarClick,
//                     dbrgTipContraChange, dbLkpCbxIndSuspChange, cmbMatProcChange,
//                     btnDockIndSuspOKClick, CmeCadastroFind, CmeDetalheDelete,
//                     toolbtnExcluirIndSuspClick, toolbtnAlterarIndSuspClick,
//                     pgcProcessosChange, btnDockIndSuspVoltarClick, tbcDetalheChanging,
//                     DefineHabDadosEstagio, DefineHabDadosCessao, LimpaCamposProcesso,
//                     dbrgNaturChange, bbtnOkDetClick, sbtnInsDetClick, CmeCadastroAfterConfirma,
//                     CmeCadastroBeforeConfirma, cbbTipoProcChange, bbtnCancelarDetClick,
//N. SIG..........   : 38475.59780
//Data da Alteração: : 08/12/2017
//Alteração Form:    : fCadFunc
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Adaptações da funcionliadade de Cadastro de Pessoal, para a versão
//										 2.4.01 da eSocial.  
//***************************************************************************************
{
Nº SIG...........: 58609
Data da Alteração: 28/11/2017
Responsável......: Andre Imakawa
Descrição........: Não necessario fazer delete na funcionalidade
***************************************************************************************
Nº SIG...........: 58333
Data da Alteração: 21/11/2017
Responsável......: Andre Imakawa
Descrição........: Retornar informação do Estagio, que foi excluido no sol 250384
***************************************************************************************
Nº SIG...........: 49177
Data da Alteração: 18/07/2017
Responsável......: William Santana
Descrição........: Ao tentarmos alterar o cadastro de determinado funcionário, o sistema
                   busca na aba "Situação Funcional", campo "C. Custo" os centros de custos
                   que estão ativos e inativos
***************************************************************************************
Nº SIG...........: 27550
Data da Alteração: 28/10/2016
Responsável......: Michelle Suellyn Mota
Descrição........: ER180 - Limitar 4 alterações no ano para Rateio Auxílio Alimentação.
                         - Criar Histórico de Alterações com filtro Ano.
                   DFM - Alterações de leiaute e nomenclatura de campos/colunas.
--------------------------------------------------------------------------------------------------
Nº SIG...........: 22093
Data da Alteração: 26/08/2016                                    [
Responsável......: Darivaldo Alencar
Descrição...: Criar campo para NIF no Consulta geral de pessoas e na tela elegível participante
Alterações..: Alteração no modo de exibição e obrigatoriedade dos campos da aba Documentação.
--------------------------------------------------------------------------------------------------
Nº SOL: 29916
Data da Alteração: 28/09/2016
Alteração Form: retirada de validação
Responsável: William Moreira da Silva
Descrição: Modificar validação que não permite voltar documento para 'branco'
--------------------------------------------------------------------------------------------------
Nº SIG...........: 20673
Data da Alteração: 08/06/2016
Responsável......: Michelle Mota/Darivaldo Alencar
Descrição........: ER180 e ER141 - Inclusão da flag "Ativo" - exclusão lógica.
--------------------------------------------------------------------------------------------------
Nº SOL: 250384.17324
Nº PPM 1070235
Data da Alteração: 24/02/2016
Alteração Form: Leiaute e campos novos
Responsável: Michelle Suellyn Mota
Descrição: Mudança no leiaute e campos novos para adequar ao eSocial
**************************************************************************************
--------------------------------------------------------------------------------------------------
Nº SOL...........: 267877
Nº PPM...........: 1241250
Data da Alteração: 21/01/2016
Responsável......: William Santana
Descrição........: corrigir a funcionalidade da aba Contrato temporário na parte Substitutos.
--------------------------------------------------------------------------------------------------
Nº SOL...........: 207737               
Nº KINTANA.......: 2018095
Data da Alteração: 15/08/2014
Responsável......: Felipe A. Santos
Descrição........: Criação da Aba Contrato Temporário.
--------------------------------------------------------------------------------------------------
Nº SOL......: 211661/15807
Nº KINTANA..: 2060908
Data........: 22/09/2014
Responsavel.: William Santana
Descrição...: Padronização da nomenclatura quanto as opções de classificação de estado civíl.
--------------------------------------------------------------------------------------------------
Nº SOL............: 211502.16259
Nº PPM............: 442499
Data da Alteração.: 28/10/2014
Alteração Form....: Criação de nova aba 'Recisão'
Responsável.......: William Santana
Descrição.........: Desenvolvimento do produto referente ao SOL 211502.
--------------------------------------------------------------------------------------------------
Nº SOL......: 229874/16584
Nº PPM......: 544346
DFM.........: Inclusão de novos componentes no dfm.
Data........: 30/10/2014
Responsavel.: Felipe A. Santos
Descrição...: alteração da aba dados pessoais, criação do est. civil União estável, criação do campo
              Isento de Contr. Previdenciária e criação dos campos Número do processo.
--------------------------------------------------------------------------------------------------
Nº SOL: 229871/16137
Nº PPM: 407073
Data da Alteração: 02/10/2014
Alteração Form: criado os cadastros de estágiario, dados cessão, Grau a exposição
                a agentes nocivos, categoria de trabalhadores. alteração nas abas
                ultimo emprego, endereço, dados pessoais.
Responsável: Felipe A. Santos
Descrição: criado os cadastros de estágiario, dados cessão, Grau a exposição
           a agentes nocivos, categoria de trabalhadores. alteração nas abas
           ultimo emprego, endereço, dados pessoais.
--------------------------------------------------------------------------------------------------}
{--------------------------------------------------------------------------------------------------
Nº SOL......: 201365
Nº KINTANA..: 1965590
Data........: 21/07/2013
Responsavel.: William Santana
Descrição...: Criar nova aba 'Benefícios' no cadastro de pessoal para exibir informações de benefícios sociais
--------------------------------------------------------------------------------------------------
N. Sol..........: 188194
N. Kintana......: 1779198
Data............: 25/03/2013
Responsável.....: Higor Nayde Ferreira
Descrição.......: Incluir novos campos das telas de Registro de Alteração Funcional e Cadastro de Pessoal.

{--------------------------------------------------------------------------------------------------
Nº SOL......: 188203
Nº KINTANA..: 1786979
Data........: 17/12/2012
Responsavel.: André Oliveira
Descrição...: Inclusão no cadastro de dependentes a informação de participação no Plano Medicamento
              e no cadastro de pessoal um campo indicando a quantidade de dependentes no Plano Medicamento.
              A quantidade de dependentes cadastrados no Plano Medicamento será a soma dos dependentes de
              determinado funcionário que estejam com a flag marcada em seus cadastros.
-------------------------------------------------------------------------------------------------- }
{--------------------------------------------------------------------------------------------------
N. Sol..........: 194603
N. Kintana......: 1857408
Data............: 19/11/2012
Responsável.....: Higor Nayde Ferreira
Descrição.......: Ajuste ao carregar o Salario em relação ao cargo.

-------------------------------------------------------------------------------------------------- }
{--------------------------------------------------------------------------------------------------
N. Sol..........: 189417
N. Kintana......: 1787370
Data............: 06/09/2012
Responsável.....: Fernando Xavier
Descrição.......: Erro ao cadastrar novo func. quando há um novo cadastramento a partir do cadastro
                  feito pelo módulo RH/Recrutamento e Seleção.


N. Sol..........: 185455
N. Kintana......: 1739618
Data............: 20/07/2012
Responsável.....: Mosé Cornetta
Descrição.......: Apenas trazer analiticos e ativos

Nº SOL......: 186932
Nº KINTANA..: 1761860
Data........: 06/08/2012
Responsável.: William Moreira
Descrição...: Inabilitar combo de tipo sanguineo disponível no cadastro de pessoal na aba de dados pessoais.
-------------------------------------------------------------------------------------------------- }

{--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 177441/9122
Nº KINTANA..: 1635284
Data........: 15/06/2012
Responsável.: Felipe Santos
Alteração...: Alteração somente no DFM.
Descrição...: Na tela tbsSitFunc o campo C. Custo erá pesquisado pelo código agora a pesquisa é
              feita pelo nome, o campo do lado "ednomeccusto" foi alterado o visible para false.
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------

Rotina......: -
Nº SOL......: 172600
Nº KINTANA..: 1570562
Data........: 14/02/2012
Responsável.: Monica Gonzaga
Descrição...: Ajuste no data de experiencia do fun, pois estava trazendo o valor errado.
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: dbcmbDeficFis
Nº SOL......: 172250
Nº KINTANA..: 1547587
Data........: 31/01/2012
Responsável.: Edilaine Ferraresi
Descrição...: Alterada descrição do item 5 para Intelectual (mental).
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: dbcmbTipoDocumentoChange
Nº SOL......: 138283
Nº KINTANA..: 840489
Data........: 30/06/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Incluindo comboBox para seleção de multiplas mascaras para um
              mesmo documento.
-------------------------------------------------------------------------------------------------- }
{ --------------------------------------------------------------------------------------------------
Rotina......: TfrmCadFunc.sbtnInserirClick, TfrmCadFunc.sbtnAlterarClick, TfrmCadFunc.bbtnConfirmarClick
Nº SOL......: 138283/6221
Nº KINTANA..: 1402575
Data........: 01/09/2011
Responsável.: Otacilio Aquino
Descrição...: Atualização dos campos no cadastro de pessoas.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 24591
Nº KINTANA..: 524457
Data........: 28/10/2010
Responsável.: Thaise Amaral Martins
Descrição...: Desabilitando campos que só podem ser alterados no módulo Folha de Pagamento caso
              o funcionário possua vínculo empregatício com a Funcef.
-------------------------------------------------------------------------------------------------- }
//N. Sol.............: 128674
//N. Kintana.........: 691473
//Data...............: 16/12/2009
//Responsável........: Arnaldo V. Scarin
//Descrição..........: Correção do Exception que está acontecendo na criação
//                     de Histórico do Funcionário.

//Rotina.............: -
//N. Sol.............: 73915
//N. Kintana.........: 524411
//Data...............: 23/10/2009
//Responsável........: Henrique Massao
//Descrição..........: Foram incluidos novos campos no controle de histórico de alterações

//Rotina.............: Create
//N. Sol.............: 103661
//N. Kintana.........: 472575
//Data...............: 20/02/2009
//Responsável........: Ricardo Alves
//Descrição..........: Adicionado campo NUMCRACHA para edição na aba de
//                     situação do funcionário

unit fCadFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Spin, Menus,
  MontaSelect, DBTables, Wwdatsrc, TB97, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd,
  Wwdbgrid, checklst, DBCtrls, TabControlDetalhe, wwdblook, Mask, wwdbedit, ExtCtrls, ExtDlgs,
  TREdit, Wwdbspin, TB97Ctls, TB97Tlbr, IvDictio, Db, IvMulti, IvEMulti, CMDBLookupCombo,
  CmEventosCadastro, ImgList, ComCtrls, CMDateTimePicker, wwdbdatetimepicker, Wwdotdot,
  Wwdbcomb, DBClient, uCMClientDataSet, CMProcura, TB97Tlwn, fpessoaMT, uCtrlListTerceirosRH,
  uCtrlGlobalRH, uCtrlMotivo, uCtrlPais, uCtrlSitFunc, uCtrlCargo, uCtrlPessoaSindicato,
  uCtrlPessoaFilialPessoa, uCtrlGrInstr, uCtrlProfiss, uCtrlFonte, uCtrlHoraTrab,
  uCtrlUltimosEmpregos, uCtrlVincEmpr, uCtrlMovContrCAGED, uCtrlTipoTrab, uCtrlCatEmprGRE,
  uCtrlSitRisco, uCtrlFaixaSal, uCtrlPessoaDependente, uCtrlPessoaEstrangeiro,
  uCtrlIntegraPrevRH,Wwquery,
  {WIlliam Santana  - SOL: 201365 - KINTANA: 1965590} uCtrlTipoBenSal,{end- WIlliam Santana} 
  ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, FPreview {Ini-MSMT-SIG27550}, uCtrlHistAlterBenef, jclSysUtils{Fim-MSMT-SIG27550};

type
  TfrmCadFunc = class(TFrmPessoaMT)
    tbsDadosPess: TTabSheet;
    tbsUltEmpr: TTabSheet;
    dbgrUltEmpr: TwwDBGrid;
    opndArqBmp: TOpenPictureDialog;
    dsUltEmpr: TwwDataSource;
    tbshOutros: TTabSheet;
    Label44: TLabel;
    dblckVincEmpr: TwwDBLookupCombo;
    Label45: TLabel;
    dblckMovContrCAGED: TwwDBLookupCombo;
    dblckTipoTrab: TwwDBLookupCombo;
    Label46: TLabel;
    gbxFGTS: TGroupBox;
    tbsSitFunc: TTabSheet;
    gbxIdent: TGroupBox;
    gbxContr: TGroupBox;
    gbxDeslig: TGroupBox;
    gbxSalar: TGroupBox;
    gbxLotacao: TGroupBox;
    Label35: TLabel;
    dbedMatric: TwwDBEdit;
    Label21: TLabel;
    dbedDatAdmis: TCMDateTimePicker;
    Label36: TLabel;
    dblckSitFunc: TwwDBLookupCombo;
    Label31: TLabel;
    dblckHorario: TwwDBLookupCombo;
    Label37: TLabel;
    dblckFonte: TwwDBLookupCombo;
    dbrgTipContra: TDBRadioGroup;
    gbxContrato: TGroupBox;
    lblFinal: TLabel;
    dbedFinalContr: TCMDateTimePicker;
    Label23: TLabel;
    dbedDatSaida: TCMDateTimePicker;
    Label24: TLabel;
    dbedRetorno: TCMDateTimePicker;
    dbedSalario: TDBRealEdit;
    Label50: TLabel;
    Label51: TLabel;
    dbedDatSalar: TCMDateTimePicker;
    dbrgTipoSalar: TDBRadioGroup;
    Label29: TLabel;
    dblckEstab: TwwDBLookupCombo;
    Label32: TLabel;
    dbedDatLotac: TCMDateTimePicker;
    Label53: TLabel;
    dblckChefe: TwwDBLookupCombo;
    Label54: TLabel;
    tbshDependentes: TTabSheet;
    dbgrdDepen: TwwDBGrid;
    dsDependentes: TwwDataSource;
    gbxCargo1: TGroupBox;
    dblckCargo1: TwwDBLookupCombo;
    dbedCargo1: TCMDateTimePicker;
    gbxCargo2: TGroupBox;
    dblckCargo2: TwwDBLookupCombo;
    dbedCargo2: TCMDateTimePicker;
    dbspeStep1: TwwDBSpinEdit;
    dbspeStep2: TwwDBSpinEdit;
    dbedDatRefHor: TCMDateTimePicker;
    Label55: TLabel;
    Label25: TLabel;
    dblckMotivo1: TwwDBLookupCombo;
    Label13: TLabel;
    dblckMotivo2: TwwDBLookupCombo;
    edNomeCCusto: TEdit;
    dblckCCusto: TwwDBLookupCombo;
    pgctrlDadosPess: TPageControl;
    tbshGeral: TTabSheet;
    tbshEstrangeiro: TTabSheet;
    dsEstrangeiro: TwwDataSource;
    pnlUltEmpr: TPanel;
    Label12: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    dblckUltCargo: TwwDBLookupCombo;
    dbedUltAdm: TCMDateTimePicker;
    dbedUltDem: TCMDateTimePicker;
    dbedUltSal: TDBRealEdit;
    dblckUltMotivo: TwwDBLookupCombo;
    dbedUltCargo: TwwDBEdit;
    dbedUltEmpresa: TwwDBEdit;
    dbedNumSeq: TwwDBEdit;
    msAgencia: TMontaSelect;
    gbxContaSal: TGroupBox;
    dblckBancoSalario: TwwDBLookupCombo;
    mskedNumAgenciaSalario: TMaskEdit;
    spbtProcuraAgenciaSalario: TSpeedButton;
    lblNumConta: TLabel;
    mskedNumContaSalario: TMaskEdit;
    rgFGTSopcao: TDBRadioGroup;
    lblDatOpc: TLabel;
    dbedDatOpc: TCMDateTimePicker;
    Label48: TLabel;
    dbedContas: TwwDBEdit;
    Label49: TLabel;
    dbedValFG: TDBRealEdit;
    Label11: TLabel;
    dblckBancoFGTS: TwwDBLookupCombo;
    Label58: TLabel;
    mskedNumAgenciaFGTS: TMaskEdit;
    spbtProcuraAgenciaFGTS: TSpeedButton;
    Label59: TLabel;
    mskedNumContaFGTS: TMaskEdit;
    Label56: TLabel;
    dblckCatEmpr: TwwDBLookupCombo;
    Label57: TLabel;
    dblckSitRisco: TwwDBLookupCombo;
    spedDias: TSpinEdit;
    pnlAlteraSal: TPanel;
    rgInformaSalario: TRadioGroup;
    cmbSteps: TComboBox;
    tbbtnConfInfo: TToolbarButton97;
    tbbtnCancelInfo: TToolbarButton97;
    Bevel2: TBevel;
    gbxOpcoes: TGroupBox;
    Label33: TLabel;
    Label60: TLabel;
    edOpcaoTicket: TEdit;
    edOpcoesPerc: TEdit;
    Label30: TLabel;
    edOpcoesDataAssoc: TEdit;
    Label4: TLabel;
    dbspedDataCheg: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    dblckNacionalidadePai: TwwDBLookupCombo;
    dblckNacionalidadeMae: TwwDBLookupCombo;
    Label67: TLabel;
    wwDBEdit4: TwwDBEdit;
    Label68: TLabel;
    wwDBEdit5: TwwDBEdit;
    dbrgrpFLGCASADOBRASILEIRO: TDBRadioGroup;
    dbrgrpFLGFILHOSBRASILEIROS: TDBRadioGroup;
    Label2: TLabel;
    dbedDatNasc: TCMDateTimePicker;
    Label15: TLabel;
    cmbRaca: TComboBox;
    dblckNacional: TwwDBLookupCombo;
    Label18: TLabel;
    dblckGrauInstr: TwwDBLookupCombo;
    Label20: TLabel;
    dblckProfissao: TwwDBLookupCombo;
    Label34: TLabel;
    dblckSindi: TwwDBLookupCombo;
    gbxFiliacao: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    CdsUltEmpr: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    CdsPaises: TCMClientDataSet;
    CdsCidadeNasc: TCMClientDataSet;
    CdsEstadoNasc: TCMClientDataSet;
    CdsCCusto: TCMClientDataSet;
    CdsSitFunc: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsChefe: TCMClientDataSet;
    CdsSindicato: TCMClientDataSet;
    CdsGrauInstr: TCMClientDataSet;
    CdsProfissao: TCMClientDataSet;
    CdsFonteRecr: TCMClientDataSet;
    CdsEstab: TCMClientDataSet;
    CdsHorario: TCMClientDataSet;
    Label69: TLabel;
    CdsVincEmpr: TCMClientDataSet;
    Panel4: TPanel;
    chkGravaHstAltCad: TCheckBox;
    CdsMovContrCAGED: TCMClientDataSet;
    CdsTipoTrab: TCMClientDataSet;
    CdsSitRisco: TCMClientDataSet;
    CdsCatEmpr: TCMClientDataSet;
    CdsFaixaSal: TCMClientDataSet;
    CdsEstrangeiro: TCMClientDataSet;
    CdsDependentes: TCMClientDataSet;
    chkMarcaPonto: TDBCheckBox;
    lblBanco: TLabel;
    lblAgencia: TLabel;
    CdsCargo2: TCMClientDataSet;
    dsCargo2: TwwDataSource;
    dsCargo1: TwwDataSource;
    Label43: TLabel;
    Label47: TLabel;
    lblTipoDuracaoContr: TLabel;
    dbedDuracaoContr: TwwDBEdit;
    dbedProrr: TwwDBEdit;
    dbrgDeficienteFis: TGroupBox;
    dbcmbDeficFis: TwwDBComboBox;
    lbl1: TLabel;
    edtNUMEROCRACHA: TwwDBEdit;
    pnlTipoDocumento: TPanel;
    LbTpDocumento: TLabel;
    dbcmbTipoDocumento: TCMDBLookupCombo;
    CdsTipoDocumento: TCMClientDataSet;
    dsTipoDocumento: TwwDataSource;
    dsPlanos: TwwDataSource;
    cdsPlanos: TCMClientDataSet;
    //gbxCargo1: TGroupBox;

    GBoxDepend1: TGroupBox;
//William Santana SOL 201365 KIN 1965590
   dsTipoBen: TwwDataSource;
    CdsTipoBen: TCMClientDataSet;
    ChkLBoxTipoBen: TCheckListBox;
    CdsTipoBenSal: TCMClientDataSet;
    dsTipoBenSal: TwwDataSource;
    lblPSaude: TLabel;
    lblPOdont: TLabel;
    lblPmedic: TLabel;
    dBEditQtdPSaude: TwwDBEdit;
    dBEditQtdPOdont: TwwDBEdit;
    dBEditQtdPMedic: TwwDBEdit;
    GBoxTipoBeneficios: TGroupBox;
    grpSinPercAl: TGroupBox;
    dbePercRatAliment: TwwDBEdit;
    dbePercRatRefei: TwwDBEdit;
    lblPercAlim: TLabel;
    lblPercRefe: TLabel;
//END - William Santana SOL 201365 KIN 1965590
    Label71: TLabel;
    //dblckCargo1: TwwDBLookupCombo;
    //dbedCargo1: TCMDateTimePicker;
    //gbxCargo2: TGroupBox;
    Label72: TLabel;
    //dblckCargo2: TwwDBLookupCombo;
    //dbedCargo2: TCMDateTimePicker;
    //dbspeStep2: TwwDBSpinEdit;
    Label73: TLabel;
    Label74: TLabel;
    //dbspeStep1: TwwDBSpinEdit;
    gbxFuncao: TGroupBox;
    Label75: TLabel;
    dbedDataFuncao: TCMDateTimePicker;
    dbedFuncao: TDBRealEdit;
    Label76: TLabel;
    gbxSalarioFuncao: TGroupBox;
    Label78: TLabel;
    dbedVlrSalarioFuncao: TDBRealEdit;
    lblsinalpercalimentacao: TLabel;
    lblsinalpercrefeicao: TLabel;
    lblTipoLogradouro: TLabel;
    dblkpTpLogradouro: TwwDBLookupCombo;
    cdsTpLogradouro: TCMClientDataSet;
    lblObsTd: TLabel;
    dbmmoObsTd: TDBMemo;
    grbNatur: TGroupBox;
    dbrgNatur: TDBRadioGroup;
    CdsEstagiario: TCMClientDataSet;
    dsEstagiario: TwwDataSource;
    CdsDadosCessao: TCMClientDataSet;
    dsDadosCessao: TwwDataSource;
    dbedtCNPJUltEmp: TwwDBEdit;
    dbedtMatUltEmp: TwwDBEdit;
    lblCNPJUltEmp: TLabel;
    lblMatUltEmp: TLabel;
    tbsheSocial: TTabSheet;
    grbCategTrab: TGroupBox;
    Label77: TLabel;
    lblDescCateg: TLabel;
    GroupBox3: TGroupBox;
    Label80: TLabel;
    dbcmbDescCateg: TwwDBLookupCombo;
    dbcmbDescGrauExp: TwwDBLookupCombo;
    msInsEnsino: TMontaSelect;
    msAgenteInt: TMontaSelect;
    msSupervisor: TMontaSelect;
    CdsGrupoCateg: TCMClientDataSet;
    CdsDescCateg: TCMClientDataSet;
    CdsGrauExpAgenNoc: TCMClientDataSet;
    dsGrupoCateg: TDataSource;
    dsDescCateg: TDataSource;
    dsGrauExpAgenNoc: TDataSource;
    dbedUF: TwwDBEdit;
    lblUF: TLabel;
    Label17: TLabel;
    lblCodMunicipio: TLabel;
    dbedCodMunicipio: TwwDBEdit;
    cmbGrupoCateg: TComboBox; // Felipe A. Santos SOL 229874/16584 KTN 544346
    msProcesso: TMontaSelect;
    pnlRecisaoContrato: TPanel;
    grpRecisao: TGroupBox;
    lblDtHomolog: TLabel;
    lblSituacao: TLabel;
    lblDesRessalva: TLabel;
    cbbSituacaoRecisao: TwwDBComboBox;
    dbmDescRessalva: TDBMemo;
    tmpDtHomologacao: TCMDateTimePicker;
    chkRessalva: TDBCheckBox;
    pnlRecisaoImagem: TPanel;
    pnlRecBotoes: TPanel;
    btnAssociaRecisao: TButton;
    btnImprimirTermo: TBitBtn;
    scrbxTermo: TScrollBox;
    dbimgTermoHomolog: TDBImage;
    rpTermo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    pmgTermo: TppImage;
    gbxDepend: TGroupBox;
    //Término - WIlliam Santana - SOL 211502.16259 PPM 442499
    dbrgSexo: TDBRadioGroup;
    dsEstCivil: TwwDataSource;
    CdsEstCivil: TCMClientDataSet;
    lblEstCivil: TLabel;
    dblckEstCivil: TwwDBLookupCombo;
    tbsContratoTemp: TTabSheet;
    grbCargo: TGroupBox;
    lblNivel: TLabel;
    dblckCargoCTemp: TwwDBLookupCombo;
    dbspinedtNivel: TwwDBSpinEdit;
    grbPrazo: TGroupBox;
    lblDuracao: TLabel;
    Label10: TLabel;
    lblPrevTermino: TLabel;
    lblPrevAviso: TLabel;
    dtPrevTerm: TCMDateTimePicker;
    dtPrevAviso: TCMDateTimePicker;
    dbedtDuracao: TwwDBEdit;
    grbSituacao: TGroupBox;
    rbAtivo: TRadioButton;
    rbDesligado: TRadioButton;
    rbEfetivado: TRadioButton;
    grbDataDesligEfetiv: TGroupBox;
    dtDesligEfeitv: TCMDateTimePicker;
    grbSalario: TGroupBox;
    lblValorSal: TLabel;
    dbedtSalario: TwwDBEdit;
    grbSub: TGroupBox;
    dbgrdSub: TwwDBGrid;
    pnlSub: TPanel;
    lblMatSub: TLabel;
    lblSubst: TLabel;
    sbtnProcurarSub: TSpeedButton;
    grbLotacao: TGroupBox;
    lblCCustoSub: TLabel;
    lblDirSub: TLabel;
    dblckCentCustoCTemp: TwwDBLookupCombo;
    dbedtDir: TwwDBEdit;
    grbPeriodo: TGroupBox;
    lblInicioSubst: TLabel;
    lblFimSubst: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    grbMotivo: TGroupBox;
    rbAuxDoenca: TRadioButton;
    rbAuxDoencaAcid: TRadioButton;
    rbLicencaMaternidade: TRadioButton;
    dbedtSubstituido: TwwDBEdit;
    dbedtMatriculaSub: TwwDBEdit;
    Panel9: TPanel;
    dckBtnsInsAlt: TDock97;
    Toolbar976: TToolbar97;
    btnInsertCTempSub: TToolbarButton97;
    btnAlterarCTempSub: TToolbarButton97;
    dckbtnsSub: TDock97;
    Toolbar977: TToolbar97;
    btnOkDetSub: TBitBtn;
    btnCancelarDetSub: TBitBtn;
    btnVoltarDetSub: TBitBtn;
    grbObservacoes: TGroupBox;
    dbgrdObs: TwwDBGrid;
    pnlObs: TPanel;
    lblDataObs: TLabel;
    lblObservacoes: TLabel;
    dtDataObs: TCMDateTimePicker;
    dbmmoObs: TDBMemo;
    Panel6: TPanel;
    dckObs: TDock97;
    Toolbar973: TToolbar97;
    btnAltCTempObs: TToolbarButton97;
    btnInsertCTempObs: TToolbarButton97;
    dckBtnsObs: TDock97;
    Toolbar972: TToolbar97;
    btnOkObs: TBitBtn;
    btnCancelarObs: TBitBtn;
    btnVoltarObs: TBitBtn;
    cdsContratoTempObs: TCMClientDataSet;
    dsContratoTempObs: TwwDataSource;
    CmeCTempObs: TCmEventosCadastro;
    CmeCTempSubst: TCmEventosCadastro;
    msCTempSub: TMontaSelect;
    dsContratoTempSubst: TwwDataSource;
    cdsContratoTempSubst: TCMClientDataSet;
    dsContratoTemp: TwwDataSource;
    cdsContratoTemp: TCMClientDataSet;
    cdsDiretoria: TCMClientDataSet;
    Label3: TLabel;
    dblckNatural: TwwDBLookupCombo;
    Label65: TLabel;
    dblckCidadeNasc: TwwDBLookupCombo;
    dbrgContrPrev: TDBRadioGroup;
    dbrgIsento: TDBRadioGroup;
    dbrgrpUNIAOESTAVEL: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label28: TLabel;
    tbsProcessos: TTabSheet;
    dbgrdProcessos: TwwDBGrid;
    Panel7: TPanel;
    CdsProcessos: TCMClientDataSet;
    dsProcessos: TwwDataSource;
    CdsIndicativoSusp: TCMClientDataSet;
    CdsCidadeMunicipio: TCMClientDataSet;
    CdsVerificaProcContr: TCMClientDataSet;
    cbbDESCCONTRIBPREV: TwwDBComboBox;
    dbchkEndAtivo: TDBCheckBox;
    dbchkTelFlgAtivo: TDBCheckBox;
    dbchkContFlgAtivo: TDBCheckBox;
    CdsContatoNOME: TStringField;
    CdsContatoCARGO: TStringField;
    CdsContatoSETOR: TStringField;
    CdsContatoFLGATIVO: TStringField;
    CdsContatoIDCONTATO: TFloatField;
    CdsContatoIDPESSOA: TFloatField;
    CdsContatoIDENDERECO: TFloatField;
    CdsContatoEMAIL: TStringField;
    CdsContatoNASCIMENTO: TDateTimeField;
    CdsContatoOBS: TMemoField;
    CdsTelefoneFLGATIVO: TStringField;
    CdsEnderecoFLGATIVO: TStringField;
    CdsDependentesNOME: TStringField;
    CdsDependentesDESCRICAO: TStringField;
    CdsDependentesDATANASC: TDateTimeField;
    CdsDependentesFLGCONTAIMPOSTOR: TStringField;
    CdsDependentesFLGCONTASALARIOF: TStringField;
    CdsDependentesDATACADASTRO: TDateTimeField;
    CdsDependentesFIMIMPOSTOR: TDateTimeField;
    CdsDependentesATIVO: TStringField;
    pnlHistAlter: TPanel;
    cbbAnoHistAlter: TComboBox;
    lblHistAlter: TLabel;
    dbgrdHistAlter: TwwDBGrid;
    dsUltEmprGrid: TwwDataSource;
    CdsUltEmprGrid: TCMClientDataSet;
    CdsHistAlterBenef: TCMClientDataSet;
    dsHistAlter: TDataSource;
    CdsAnoAlteraHist: TCMClientDataSet;
    dsAnoAlteraHist: TDataSource;
    CdsGridHistAlterBenef: TCMClientDataSet;
    dsGridHistAlterBenef: TDataSource;
    // Andre Imakawa - SIG 58333 - Inicio
    grbInfoEstagio: TGroupBox;
    lblNaturEstagio: TLabel;
    lblNivelEstag: TLabel;
    lblAreaAtu: TLabel;
    lblNumApolSeguro: TLabel;
    lblInsEnsino: TLabel;
    lblAgenIntegracao: TLabel;
    sbtnInsEnsino: TSpeedButton;
    sbtnAgenIntegracao: TSpeedButton;
    rbObrigatorio: TRadioButton;
    rbNObrigatorio: TRadioButton;
    grbSpVisorEstag: TGroupBox;
    lblNomeSpVisorEstag: TLabel;
    lblCPFspVisorEstag: TLabel;
    sbtnSupervisor: TSpeedButton;
    dbedtNomeSprvisor: TwwDBEdit;
    dbedtCPFspvisor: TwwDBEdit;
    dbedtAreaAtu: TwwDBEdit;
    dbedtNumApolSeguro: TwwDBEdit;
    dbedtInsEnsino: TwwDBEdit;
    dbedtAgenIntegracao: TwwDBEdit;
    dbcmbNivelEstag: TwwDBComboBox;
    grbCessaoTrab: TGroupBox;
    lblCNPJEmpCed: TLabel;
    lblDtAdmisCessao: TLabel;
    dbedtCNPJEmpCed: TwwDBEdit;
    dbedDtAdmisCes: TCMDateTimePicker;
    pgcProcessos: TPageControl;
    tbsProcDados: TTabSheet;
    grpInfos: TGroupBox;
    Label27: TLabel;
    Label52: TLabel;
    Label79: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label66: TLabel;
    Label84: TLabel;
    Label86: TLabel;
    dblkpcbbIDCIDADES: TwwDBLookupCombo;
    edtCODIDENTVARA: TwwDBEdit;
    edtDataFim: TCMDateTimePicker;
    edtDataInicio: TCMDateTimePicker;
    dbrgrpAUTORACAO: TDBRadioGroup;
    cbbTipoProc: TComboBox;
    edtUFSecaoJud: TEdit;
    edtCodMunicipio: TEdit;
    cbbCONTRIABRANDECISAO: TComboBox;
    edtNumeroProc: TMaskEdit;
    tbsIndicativoSusp: TTabSheet;
    DockMonitora: TDock97;
    ToolbarIndSusp: TToolbar97;
    toolbtnInserirIndSusp: TToolbarButton97;
    toolbtnAlterarIndSusp: TToolbarButton97;
    toolbtnExcluirIndSusp: TToolbarButton97;
    dbGrdProcessoIndSusp: TwwDBGrid;
    pnlIndSusps: TPanel;
    Label92: TLabel;
    Label93: TLabel;
    rdGrpIndDeposito: TRadioGroup;
    dbDtpDtDecisao: TCMDateTimePicker;
    dbLkpCbxIndSusp: TwwDBLookupCombo;
    DockDetIndSusp: TDock97;
    Toolbar974: TToolbar97;
    btnDockIndSuspOK: TBitBtn;
    btnDockIndSuspCanc: TBitBtn;
    btnDockIndSuspVoltar: TBitBtn;
    Label70: TLabel;
    dsProcessosXIndicativoSusp: TDataSource;
    cdsProcessosXIndicativoSusp: TCMClientDataSet;
    cmbMatProc: TComboBox;
    Label7: TLabel;
    dbedDecrNatur: TwwDBEdit;
    edtCodEsocial: TwwDBEdit;
    lblCodEsocial: TLabel;
    edtMatriculaCessao: TwwDBEdit;
    lblMatriculaCessao: TLabel;
    dbrgrpBenefPrev: TDBRadioGroup;
    CdsDependentesSITDEPENDENTE: TStringField;
    lblEmailPessoal: TLabel;
    dbedtEmailPessoal: TwwDBEdit;
    lblTempoResidencia: TLabel;
    cbbtempo_residencia: TwwDBComboBox;
    cbbCondicaoIngresso: TwwDBComboBox;
    lblCondicaoIngresso: TLabel;
    GroupBox5: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    // Andre Imakawa - SIG 58333 - Fim
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure rgFGTSopcaoClick(Sender: TObject);
    procedure dblckSitFuncChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbedFinalContrExit(Sender: TObject);
    procedure dbedDuracaoContrExit(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure dblckCCustoChange(Sender: TObject);
    procedure tbshEstrangeiroEnter(Sender: TObject);
    procedure dbrgNaturChange(Sender: TObject);
    procedure dbedDecrNaturKeyPress(Sender: TObject; var Key: Char);
    procedure dblckUltCargoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet;
      modified: Boolean);
    procedure spbtProcuraAgenciaSalarioClick(Sender: TObject);
    procedure mskedNumAgenciaSalarioExit(Sender: TObject);
    procedure mskedNumAgenciaSalarioEnter(Sender: TObject);
    procedure mskedNumContaSalarioExit(Sender: TObject);
    procedure dbedRetornoExit(Sender: TObject);
    procedure spedDiasExit(Sender: TObject);
    procedure dbedSalarioEnter(Sender: TObject);
    procedure rgInformaSalarioClick(Sender: TObject);
//    procedure dblckFaixa1Change(Sender: TObject);  fora
    procedure tbbtnConfInfoClick(Sender: TObject);
    procedure tbbtnCancelInfoClick(Sender: TObject);
    procedure dsSubTipoStateChange(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dblckNacionalChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dblckCargo1Change(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure dbedMatricExit(Sender: TObject);
    procedure CdsSubTipoAfterScroll(DataSet: TDataSet);
    procedure CdsPessoaFisicaAfterScroll(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure cmbStepsChange(Sender: TObject);
    procedure dblckBancoSalarioExit(Sender: TObject);
    procedure dblckBancoSalarioEnter(Sender: TObject);
    procedure mskedNumContaSalarioEnter(Sender: TObject);
    procedure dbedContaEnter(Sender: TObject);
    procedure dbedContaExit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure PintarCampos(lEdit: Array of TComponent; Color: TColor);
    procedure dbcmbTipoDocumentoChange(Sender: TObject);
    procedure dbedSalarioChange(Sender: TObject);//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    procedure dbspeStep1Change(Sender: TObject);//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    procedure dbspeStep2Change(Sender: TObject); //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    procedure dblckCargo2Change(Sender: TObject); //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    //William Santana SOL 201365 KIN 1965590
    procedure Tipobeneficio(didpessoa: Double);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure ValidaKeyPercRateio(Sender: TObject; var Key: Char);
    procedure ValidaPercRateio(Sender: TObject);
    //END - William Santana SOL 201365 KIN 1965590
    procedure dbcmbDeficFisChange(Sender: TObject);
    procedure dbrgTipContraChange(Sender: TObject);
    procedure dblckCargoCTempChange(Sender: TObject);
    procedure dbedtDuracaoKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtDuracaoExit(Sender: TObject);
    procedure dtPrevTermExit(Sender: TObject);
    procedure dblckCentCustoCTempChange(Sender: TObject);
    procedure btnInsertCTempSubClick(Sender: TObject);
    procedure btnAlterarCTempSubClick(Sender: TObject);
    procedure btnVoltarDetSubClick(Sender: TObject);
    procedure dtInicioExit(Sender: TObject);
    procedure btnCancelarDetSubClick(Sender: TObject);
    procedure dbspinedtNivelChange(Sender: TObject);
    procedure CmeCTempSubstBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCTempSubstAtualizaBotoes(Sender: TObject);
    procedure CmeCTempSubstConfirma(Sender: TObject);
    procedure CmeCTempSubstInsert(Sender: TObject);
    procedure CmeCTempSubstEdit(Sender: TObject);
    procedure btnOkDetSubClick(Sender: TObject);
    procedure sbtnProcurarSubClick(Sender: TObject);
    procedure btnInsertCTempObsClick(Sender: TObject);
    procedure btnAltCTempObsClick(Sender: TObject);
    procedure btnOkObsClick(Sender: TObject);
    procedure btnCancelarObsClick(Sender: TObject);
    procedure btnVoltarObsClick(Sender: TObject);
    procedure CmeCTempObsInsert(Sender: TObject);
    procedure CmeCTempObsEdit(Sender: TObject);
    procedure CmeCTempObsCancel(Sender: TObject);
    procedure CmeCTempObsAtualizaBotoes(Sender: TObject);
    procedure CmeCTempObsConfirma(Sender: TObject);
    procedure dbedDatAdmisExit(Sender: TObject);
    procedure dbgrdObsDblClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnInsEnsinoClick(Sender: TObject);
    procedure sbtnAgenIntegracaoClick(Sender: TObject);
    procedure sbtnSupervisorClick(Sender: TObject);
    procedure cmbGrupoCategChange(Sender: TObject);
    procedure DBNUMEROKeyPress(Sender: TObject; var Key: Char);
    procedure dbrgIsentoChange(Sender: TObject); // Felipe A. Santos SOL 229874/16584 KTN 544346
    procedure dbrgContrPrevChange(Sender: TObject);// Felipe A. Santos SOL 229874/16584 KTN 544346
    //Início - William Santana - SOL 211502.16259 PPM 442499
    procedure chkRessalvaClick(Sender: TObject);
    procedure btnAssociaRecisaoClick(Sender: TObject);
    procedure CdsImagemOutroAfterScroll(DataSet: TDataSet);
    procedure btnImprimirTermoClick(Sender: TObject);
    //Término - William Santana - SOL 211502.16259 PPM 442499
    // Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    procedure dblckEstCivilChange(Sender: TObject);
    procedure cbbTipoProcChange(Sender: TObject);
    //procedure cbbIndicaDecisaoChange(Sender: TObject); //Everson Cunha - SIG70569
    procedure cbbCONTRIABRANDECISAOChange(Sender: TObject);
    procedure CdsProcessosAfterInsert(DataSet: TDataSet);
    procedure CdsProcessosBeforePost(DataSet: TDataSet);
    //procedure cbbApurFapChange(Sender: TObject);  //Everson Cunha - SIG70569
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure cbbDESCCONTRIBPREVChange(Sender: TObject);
    procedure dblkpcbbIndicativoSuspChange(Sender: TObject);
    procedure dbrgrpINDICATDEPOSITOChange(Sender: TObject);
    procedure dbrgrpAUTORACAOChange(Sender: TObject);
    procedure LimpaCamposProcessos;
    procedure dblckSitRiscoChange(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure CdsEnderecoFLGATIVOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CdsTelefoneFLGATIVOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CdsContatoFLGATIVOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure CmpCidadesApertouBotao(Sender: TObject);
    procedure CmpCidadesValidaDados(Sender: TObject);
    procedure dbePercRatAlimentClick(Sender: TObject);
    procedure cbbAnoHistAlterChange(Sender: TObject);
    procedure dbePercRatAlimentEnter(Sender: TObject);
    procedure dbePercRatRefeiClick(Sender: TObject);
    procedure dbePercRatRefeiEnter(Sender: TObject);
    procedure chb_ContaInativaClick(Sender: TObject);
    procedure dblckCCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbLkpCbxIndSuspChange(Sender: TObject);
    procedure cmbMatProcChange(Sender: TObject);
    procedure btnDockIndSuspOKClick(Sender: TObject);
    procedure btnDockIndSuspVoltarClick(Sender: TObject);
    procedure pgcProcessosChange(Sender: TObject);
    procedure toolbtnInserirIndSuspClick(Sender: TObject);
    procedure toolbtnAlterarIndSuspClick(Sender: TObject);
    procedure toolbtnExcluirIndSuspClick(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dblkpcbbIDCIDADESExit(Sender: TObject);
    // Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlPais: TCtrlPais;
    CtrlSitFunc: TCtrlSitFunc;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlCargo: TCtrlCargo;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;
    CtrlGrInstr: TCtrlGrInstr;
    CtrlProfiss: TCtrlProfiss;
    CtrlFonte: TCtrlFonte;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlUltimosEmpregos: TCtrlUltimosEmpregos;
    CtrlVincEmpr: TCtrlVincEmpr;
    CtrlMovContrCAGED: TCtrlMovContrCAGED;
    CtrlTipoTrab: TCtrlTipoTrab;
    CtrlSitRisco: TCtrlSitRisco;
    CtrlCatEmprGRE: TCtrlCatEmprGRE;
    CtrlFaixaSal: TCtrlFaixaSal;
    CtrlPessoaDependente: TCtrlPessoaDependente;
    CtrlPessoaEstrangeiro: TCtrlPessoaEstrangeiro;
    CtrlIntegraPrevRH: TCtrlIntegraPrevRH;
    CtrlHistAlterBenef: TCtrlHistAlterBenef; // Michelle Mota - SIG27550
    //William Santana - SOL: 201365 - KINTANA: 1965590
    CtrlTipoBenSal: TCtrlTipoBenSal;
    bOkclick     : Boolean;
    bAlteraClick : Boolean;
    //William Santana - SOL: 201365 - KINTANA: 1965590
    bFocoEmSalario: boolean;
    iPaisAntigo, iIndex: integer;

    // Felipe A. Santos SOL 207737 KTN 2018095
    dDataFim : TDateTime;
    // Felipe A. Santos SOL 207737 KTN 2018095 - Fim

    // Guarda os Dados da Conta Salário e Conta do FGTS
    sIdAgenciaSalario, sNumContaSalario, sNumAgenciaSalario,
    sIdAgenciaFGTS, sNumContaFGTS, sNumAgenciaFGTS: string;

    iHelp : integer; // Felipe A. Santos SOL 229871.16137 PPM 407073

    //Cássio Rovaroto - SIG nº 38475.59780 - Início
    bPossuiIndicativo: boolean;
    fIdProcesso: Integer;
    sTipoOperacao: String;
    //Cássio Rovaroto - SIG nº 38475.59780 - Fim

    // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Inicio
    strDocumentos, strDocumentosExtra: TStringList;
    procedure Proc_GravaDocMemoria;
    // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Fim

    procedure SelHstDados;
    procedure SelHstAltCad(PrimeiraVez: boolean);
    function SoNumero(fField: String): String;

    // Felipe A. Santos - SOL 229871.16137 PPM 407073
    function VerificaDadosPessoais : boolean;
    function VerificaSituacaoFuncional(pTipoContrato: Integer = 0): boolean; // Andre Imakawa - SIG 112819
    function VerificaEsocial : boolean;
    procedure PostEstagiario;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
    procedure PostDadosCessao;
    procedure PreencheCmbGrupoCateg;
    // Felipe A. Santos - SOL 229871.16137 PPM 407073

    //Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    function VerificaOutros : Boolean;
    function VerificaAbaGeral : Boolean;
    function VerificaAnoChegada: boolean;
    //function VerificaCondTrabEstr: boolean; //Everson Cunha - SIG38475
    function VerificaProcContrPrev(vIdPessoa: string): boolean;
    function VerificaProcContrIR(vIdPessoa: string): boolean;
    //Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

    // Felipe A. Santos SOL 207737 KTN 2018095 - inicio
    function ValidaDataPrevisaoTermino : boolean;
    function ValidaContratoTemp : boolean;
    function VerificaDataFimSubstitutos : boolean;
    procedure FazerVoltarDetContratoTempSub;
    procedure FazerVoltarDetContratoTempObs;
    procedure TrazerParaFrenteDetCTemp(Sender : TObject);
    procedure TravaContratoTemp;
    procedure HabilitaContratoTemp;
    procedure PostContratoTemp;
    procedure HabilitaBotoesDetCTemp;
    // Felipe A. Santos SOL 207737 KTN 2018095 - fim

    Function VerificaEnderecoAtivo(iContaSim: Integer): Boolean; //Darivaldo Alencar - SIG 20673
    procedure AtivaFlagAtivo;//Darivaldo Alencar SIG 20673
    {Início - Michelle Mota - SIG27550}
    procedure HabDesabBenef(controle : Boolean);
    procedure VerAltHistBenef;
    {Termino - Michelle Mota - SIG27550}

    //Cássio Rovaroto - SIG nº 28475.59780 - Início
    procedure DefineHabDadosEstagio(pHabilita: boolean);
		procedure DefineHabDadosCessao(pHabilita: boolean);
    procedure LimpaCamposProcesso;
    //Cássio Rovaroto - SIG nº 28475.59780 - Fim

  protected
    sValorInicialBanco, sValorBanco, sValorInicialAgencia, sValorAgencia, sValorInicialConta,
    sValorConta, sInicialAgencia, sAgencia, sInicialConta, sConta, sInicialContaPreferencial, sContaPreferencial : String;
    procedure SelSubTipo(IdPessoa: double); override;
  public
    lUltempr, {*} valorflgativo{*Michelle Mota - SIG 20673}{Ini - MSMT - SIG27550}, containativa{Fim - MSMT - SIG27550}: String;

    bTtravarCadastro: Boolean;
    procedure SelFuncionario(IdPessoa: double);
    procedure HabilitarCampos;
  end;

var
  frmCadFunc: TfrmCadFunc;
  GuardaCCusto: string;
  ObrigaAnoChegada: Boolean = False;  //Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  ObrigaProcesso: Boolean = False;  //Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  ObrigaVinculo: Boolean = False;  //Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  NovoRegistro: Boolean = False;  //Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  AnoAtual : string; // Michelle Mota - SIG27550
  Alterado : boolean;// Michelle Mota - SIG27550
  VlrAntAliment, VlrAntRefeic: Double;// Michelle Mota - SIG27550

implementation

uses uCMTypes, uSistema, uModulo, uMensErro, uDiasUteis, uCtrlFuncoesRH, uCtrlPadroes,
  fRegistraOcorr, fTelaAut, uCtrlPessoa, uCtrlPessoaFuncionario, uCtrlUsoGeralRH, dCds,
  fAguarde, fObservacaoCtemp {Felipe A. Santos SOL 207737 KTN 2018095};

{$R *.DFM}

procedure TfrmCadFunc.FormCreate(Sender: TObject);
//var
  //c: integer;
begin
  // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Inicio
  strDocumentos      := TStringList.Create;
  strDocumentosExtra := TStringList.Create;
  // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Fim

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlPais := TCtrlPais.Create;
  CtrlPais.InitializeAs(Padroes);

  CtrlSitFunc := TCtrlSitFunc.Create;
  CtrlSitFunc.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.InitializeAs(Padroes);

  CtrlGrInstr := TCtrlGrInstr.Create;
  CtrlGrInstr.InitializeAs(Padroes);

  CtrlProfiss := TCtrlProfiss.Create;
  CtrlProfiss.InitializeAs(Padroes);

  CtrlFonte := TCtrlFonte.Create;
  CtrlFonte.InitializeAs(Padroes);

  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlVincEmpr := TCtrlVincEmpr.Create;
  CtrlVincEmpr.InitializeAs(Padroes);

  CtrlMovContrCAGED := TCtrlMovContrCAGED.Create;
  CtrlMovContrCAGED.InitializeAs(Padroes);

  CtrlTipoTrab := TCtrlTipoTrab.Create;
  CtrlTipoTrab.InitializeAs(Padroes);

  CtrlSitRisco := TCtrlSitRisco.Create;
  CtrlSitRisco.InitializeAs(Padroes);

  CtrlCatEmprGRE := TCtrlCatEmprGRE.Create;
  CtrlCatEmprGRE.InitializeAs(Padroes);

  CtrlFaixaSal := TCtrlFaixaSal.Create(Sistema.IdEmpresa);
  CtrlFaixaSal.InitializeAs(Padroes);

  CtrlPessoaDependente := TCtrlPessoaDependente.Create;
  CtrlPessoaDependente.InitializeAs(Padroes);

  CtrlPessoaEstrangeiro := TCtrlPessoaEstrangeiro.Create;
  CtrlPessoaEstrangeiro.InitializeAs(Padroes);

  {Início - Michelle Mota - SIG27550}
  CtrlHistAlterBenef := TCtrlHistAlterBenef.Create;
  CtrlHistAlterBenef.InitializeAs(Padroes);
  CtrlHistAlterBenef.CdsHistAlterBenef := CdsHistAlterBenef;
  Alterado := False;
  VlrAntAliment := 0;
  VlrAntRefeic := 0;
  {Término - Michelle Mota - SIG27550}

  CtrlUltimosEmpregos := TCtrlUltimosEmpregos.Create;
  CtrlUltimosEmpregos.InitializeAs(Padroes);
  CtrlUltimosEmpregos.CdsUltimosEmpregos := CdsUltEmpr;
  CdsUltEmprGrid := CdsUltEmpr; // Michelle Mota - SIG27550

  //Cássio Rovaroto - SIG nº 64144 - Início
  //Pessoa := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
  //  CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral, true, true);
  Pessoa := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral, true, true,
      0, false, 0, true);
  //Cássio Rovaroto - SIG nº 64144 - Fim
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stFuncionario;
  Pessoa.TipoPessoa := tpFisica;
  Pessoa.MostraFoto := true;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;
  Pessoa.FormCaption := Self.Caption;
  Pessoa.ObrigaDocumento := true;

  // Felipe A. Santos SOL 207737 KTN 2018095
  TCtrlPessoaFuncionario(Pessoa).CdsContratoTemp := cdsContratoTemp;
  TCtrlPessoaFuncionario(Pessoa).CdsContratoTempSubst := cdsContratoTempSubst;
  TCtrlPessoaFuncionario(Pessoa).CdsContratoTempObs := cdsContratoTempObs;
  TCtrlPessoaFuncionario(Pessoa).UsaContratoTemp := True;

  TravaContratoTemp;
  FazerVoltarDetContratoTempSub;
  FazerVoltarDetContratoTempObs;
  rbDesligado.Checked := False;
  rbEfetivado.Checked := False;
  rbAtivo.Checked := False;
  // Felipe A. Santos SOL 207737 KTN 2018095

  CtrlIntegraPrevRH := TCtrlIntegraPrevRH.Create;
  CtrlIntegraPrevRH.InitializeAs(Padroes);

  //William Santana - SOL: 201365 - KINTANA: 1965590
  CtrlTipoBenSal := TCtrlTipoBenSal.Create;
  CtrlTipoBenSal.InitializeAs(Padroes);
  //William Santana

  TCtrlPessoaFuncionario(Pessoa).CdsImagemOutro := CdsImagemOutro;  //William Santana - SOL 211502.16259

  TCtrlPessoaFuncionario(Pessoa).CdsEstrangeiro := CdsEstrangeiro;
  TCtrlPessoaFuncionario(Pessoa).CdsUltEmpr := CdsUltEmpr;
  TCtrlPessoaFuncionario(Pessoa).CdsProcessos := CdsProcessos;  // Michelle Mota - SOL: 250384.17324 - PPM: 1070235 ER180

  // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
  TCtrlPessoaFuncionario(Pessoa).CdsEstagiario := CdsEstagiario;
  TCtrlPessoaFuncionario(Pessoa).CdsDadosCessao := CdsDadosCessao;

  cdsTpLogradouro.Data := TCtrlPessoaFuncionario(Pessoa).ListTipoLogradouro;
  CdsGrupoCateg.Data := TCtrlPessoaFuncionario(Pessoa).ListCategTrabaEsocial(True, '');
  CdsDescCateg.Data := TCtrlPessoaFuncionario(Pessoa).ListCategTrabaEsocial(False, '-1');
  CdsGrauExpAgenNoc.Data :=  TCtrlPessoaFuncionario(Pessoa).ListGrauExpAgentEsocial;

  rbObrigatorio.Checked := False;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  rbNObrigatorio.Checked := False;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333

  PreencheCmbGrupoCateg;
  // Felipe A. Santos SOL 229871.16137 PPM 407073 - fim

  //Vinicius Maciel SOL138283 Kintana 840489
  pessoa.CdsTipoDocumento := cdsTipoDocumento;
  //Vinicius Maciel SOL138283 Kintana 840489 - Fim
  inherited;
  case (Sistema.IdModulo) of
    MODAUTO :
    begin
      iHelp := 4170005;  // Felipe A. Santos SOL 229871.16137 PPM 407073
      HelpContext := 4170005;
      bbtnAjuda.HelpContext := 4170005;
    end;
    MODFOL :
    begin
      iHelp := 210007;// Felipe A. Santos SOL 229871.16137 PPM 407073
      HelpContext := 210007;
      bbtnAjuda.HelpContext := 210007;
    end;
  end;

  Pessoa.SaveModuloRespon := (Modulo.IdContraCheque = FCRT);
  chkGravaHstAltCad.Checked := (Modulo.IdContraCheque = FUNCEF);

  MontaSelect.SensivelACaixa[0] := 'N';
  MontaSelect.SensivelACaixa[1] := 'N';
  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
    Add('FUNCIONARIO.IDSITFUNC = SITFUNC.IDSITFUNC(+)');
  end;

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('*');
  CdsCCusto.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('D,A');
  CdsSitFunc.Data := CtrlSitFunc.ListGeral(0, '', 'R,G');
  CdsCargo.Data := CtrlCargo.ListCargo;
  CdsCargo2.Data := CtrlCargo.ListCargo;
  CdsSindicato.Data := CtrlPessoaSindicato.ListPessoaSindicato;
  CdsGrauInstr.Data := CtrlGrInstr.ListGrauInstrucao;
  CdsProfissao.Data := CtrlProfiss.ListProfissao;
  CdsFonteRecr.Data := CtrlFonte.ListGeral;
  CdsHorario.Data := CtrlHoraTrab.ListHoraTrab;
  CdsChefe.Data := TCtrlPessoaFuncionario(Pessoa).ListChefe(Sistema.IdEmpresa);
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsVincEmpr.Data := CtrlVincEmpr.ListGeral;
  CdsMovContrCAGED.Data := CtrlMovContrCAGED.ListGeral;
  CdsTipoTrab.Data := CtrlTipoTrab.ListGeral;    
  CdsSitRisco.Data := CtrlSitRisco.ListGeral;
  CdsCatEmpr.Data := CtrlCatEmprGRE.ListGeral;
  CdsBanco.Data := CtrlListTerceirosRH.ListBancoComMasc;
  CdsEstCivil.Data := TCtrlPessoaFuncionario(Pessoa).ListEstCivil; //William Santana - SOL 211661/15807 - KIN 2060908
  //CdsCondTrabEstr.Data := TCtrlPessoaFuncionario(Pessoa).ListCondTrabEstr; //Michelle Mota - SOL: 250384.17324 - PPM: 1070235  //Everson Cunha - SIG38475
  CdsCidadeMunicipio.Data := CtrlListTerceirosRH.ListCidadeMunicipio;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235

  iPaisAntigo := -1;
  dblckNacional.OnChange := nil;
  CdsPaises.Data := CtrlPais.ListaPais;
  dblckNacional.OnChange := dblckNacionalChange;
  dblckNacionalChange(Sender);

  case (CdsParamRH.FieldByName('INDDURACAOCONTR').asInteger) of
    1 : lblTipoDuracaoContr.Caption := '(Dias)';
    2 : lblTipoDuracaoContr.Caption := '(Semanas)';
    3 : lblTipoDuracaoContr.Caption := '(Meses)';
    4 : lblTipoDuracaoContr.Caption := '(Anos)';
  end;

  //gbxCargo2.Visible := (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);
  {gbxFaixa1.Visible := (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) or
                       (Modulo.IdContraCheque = FUNCEF);
  gbxFaixa2.Visible := (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);// and
  //                     (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1);
  } // higor Nayde Ferreira fora
  {if  (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1)  then fora
  begin
    CdsFaixaSal.Data := CtrlFaixaSal.ListFaixaSal;
    dblckFaixa1.Selected.Clear;
    dblckFaixa1.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
    dblckFaixa1.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

    for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
      dblckFaixa1.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
        CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);

    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) or
       (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
    begin
      dblckFaixa2.Selected.Clear;
      dblckFaixa2.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
      dblckFaixa2.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

      for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
        dblckFaixa2.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
          CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);
    end;

    dbspeStep1.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
    dbspeStep2.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
  end
  else
  begin
    if (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
    begin
      CdsFaixaSal.Data := CtrlFaixaSal.ListFaixaSal;
      dblckFaixa2.DataSource := nil;
      dblckFaixa2.DataField  := '';
      dblckFaixa2.DataSource := dsCargo2;
      dblckFaixa2.DataField  := 'IDFAIXASALARIAL';
      dblckFaixa2.ReadOnly := true;
      dblckFaixa2.Selected.Clear;
      dblckFaixa2.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
      dblckFaixa2.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

      for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
        dblckFaixa2.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
          CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);

      dbspeStep2.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
    end;
    if (Modulo.IdContraCheque = FUNCEF) then
    begin
      CdsFaixaSal.Data := CtrlFaixaSal.ListFaixaSal;
      dblckFaixa1.DataSource := nil;
      dblckFaixa1.DataField  := '';
      dblckFaixa1.DataSource := dsCargo1;
      dblckFaixa1.DataField  := 'IDFAIXASALARIAL';
      dblckFaixa1.ReadOnly := true;
      dblckFaixa1.Selected.Clear;
      dblckFaixa1.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
      dblckFaixa1.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

      for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
        dblckFaixa1.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
          CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);

      dbspeStep1.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
    end;
  end; } // fora

  pgctrlDadosPess.ActivePageIndex := 0;
  gbxOpcoes.Visible := (Modulo.IdContraCheque = FUNCEF);

  // Chamada do Empregado Identificado
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
    SelPessoa(StrToFloat(CtrlUsoGeralRH.IdUsuarioGeral));

  //William Santana SOL: 201365 - KIN: 1965590
  // Popula os itens do checkBox com os itens da tabela TIPOBENSAL
     CdsTipoBenSal.data := CtrlTipoBenSal.PopulaCheckListbox;

     while not(CdsTipoBenSal.Eof) do
     begin
     ChkLBoxTipoBen.Items.AddObject(CdsTipoBenSal.FieldByName('DescrBenefSalar').asString,
     tobject(CdsTipoBenSal.FieldByName('IDBenefSalar').asinteger));
     CdsTipoBenSal.next;
     end;
     {Início - Michelle Mota - SIG27550}
     ChkLBoxTipoBen.Height := 25 * CdsTipoBenSal.RecordCount;
     ChkLBoxTipoBen.itemHeight := 25;
     //GBoxTipoBeneficios.Height := 30 + ChkLBoxTipoBen.Height;
     GBoxTipoBeneficios.Height := grpSinPercAl.Height;
     containativa := '';
     {Término - Michelle Mota - SIG27550}
     GBoxTipoBeneficios.Enabled:= false;
  //END William Santana

  // Felipe A. Santos SOL 229871.16137 PPM 407073  - início
  //grbInfoEstagio.Top := -1;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  //grbCessaoTrab.Top := -1;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  //grbInfoEstagio.Left := 744;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  //grbCessaoTrab.Left := 744;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  // Felipe A. Santos SOL 229871.16137 PPM 407073  - fim

  // Felipe A. Santos SOL 229874/16584 KTN 544346 - início
  //cmpNumProcIR.Visible := False;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  //cmpNumProcCP.Visible := False;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  // Felipe A. Santos SOL 229874/16584 KTN 544346 - fim

  Proc_GravaDocMemoria;  // Sol 189417 Kintana 1787370

  dbrgrpUNIAOESTAVEL.Enabled := False;// Michelle Mota - SOL: 250384.17324 - PPM:1070235
  
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  DefineHabDadosCessao(False);
  DefineHabDadosEstagio(False);
  TCtrlPessoaFuncionario(Pessoa).CdsProcessosXIndicativoSusp := cdsProcessosXIndicativoSusp;
  cdsIndicativoSusp.Data := TCtrlPessoaFuncionario(Pessoa).SelIndicativoSusp;
  pgcProcessos.Align := alClient;
  fIdProcesso := -1;
  bPossuiIndicativo := False;

  cdsProcessos.Data := TCtrlPessoaFuncionario(Pessoa).ListFuncProcessos('-1');
  cdsProcessosXIndicativoSusp.Data := TCtrlPessoaFuncionario(Pessoa).SelProcessosXIndicativoSusp(-1);
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim

end;

procedure TfrmCadFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Inicio
  FreeAndNil(strDocumentos);
  FreeAndNil(strDocumentosExtra);
  // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Fim

  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlPais);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlSitFunc);
  FreeAndNil(CtrlCargo);
  FreeAndNil(Pessoa);
  FreeAndNil(CtrlPessoaSindicato);
  FreeAndNil(CtrlGrInstr);
  FreeAndNil(CtrlProfiss);
  FreeAndNil(CtrlFonte);
  FreeAndNil(CtrlHoraTrab);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlUltimosEmpregos);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlVincEmpr);
  FreeAndNil(CtrlMovContrCAGED);
  FreeAndNil(CtrlTipoTrab);
  FreeAndNil(CtrlSitRisco);
  FreeAndNil(CtrlCatEmprGRE);
  FreeAndNil(CtrlFaixaSal);
  FreeAndNil(CtrlPessoaDependente);
  FreeAndNil(CtrlPessoaEstrangeiro);
  FreeAndNil(CtrlIntegraPrevRH);
  inherited;
end;

procedure TfrmCadFunc.FormShow(Sender: TObject);
begin
  inherited;
  cmbRaca.Enabled := false;
  //dbcmbTipoSang.Enabled := false;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  mskedNumAgenciaSalario.Enabled := false;
  mskedNumContaSalario.Enabled := false;
  spbtProcuraAgenciaSalario.Enabled := false;
  mskedNumAgenciaFGTS.Enabled := false;
  mskedNumContaFGTS.Enabled := false;
  spbtProcuraAgenciaFGTS.Enabled := false;
  spedDias.Enabled := false;
  spedDias.Value := 0;
  CmeCadastro.Operacao := opIdle;
  CmeCadastroAtualizaBotoes(Sender);

  Proc_GravaDocMemoria;
end;

procedure TfrmCadFunc.CmeCadastroFind(Sender: TObject);
var
  sPercREB, sDataAssoc: string;
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    TCtrlPessoaFuncionario(Pessoa).MudouEnderecoResidencial := false;
    TCtrlPessoaFuncionario(Pessoa).MudouSituacao := false;

    if (Modulo.IdContraCheque = FUNCEF) then
    begin
      // Pego o Tipo de Ticket
      edOpcaoTicket.Text := CtrlListTerceirosRH.GetOpcaoTicket(MontaSelect.ValoresChave[1]);
      // Pego o Perc. REB e Data Assoc.
      CtrlListTerceirosRH.GetPercREB_DataAssoc(MontaSelect.ValoresChave[1], sPercREB, sDataAssoc);
      edOpcoesPerc.Text := sPercREB;
      edOpcoesDataAssoc.Text := sDataAssoc;
    end;

   	//Cássio - SIG nº 57136 - Início
  	cdsProcessos.Data := TCtrlPessoaFuncionario(Pessoa).ListFuncProcessos(Cds.FieldByName('IDPESSOA').AsString);
  	fIdProcesso := cdsProcessos.FieldByname('IDPROCESSO').AsInteger;
  	cdsProcessosXIndicativoSusp.Data := TCtrlPessoaFuncionario(Pessoa).SelProcessosXIndicativoSusp(Cds.FieldByName('IDPESSOA').AsInteger);
  	//Cássio - SIG nº 57136 - Fim
  end;
end;

procedure TfrmCadFunc.CmeDetalheAtualizaBotoes(Sender: TObject);
var
  bAltContaSalario: boolean;
begin
  inherited;
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    if (pgctrlDetalhe.ActivePage = tbsDet) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgEnderIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgEnderAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgEnderExc').asInteger = 1);
    end
    else
    if (pgctrlDetalhe.ActivePage = tbsTelefone) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgTelefIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgTelefAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgTelefExc').asInteger = 1);
    end
    else
    if (pgctrlDetalhe.ActivePage = tbsContato) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgConttIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgConttAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgConttExc').asInteger = 1);
    end
    else
    if (pgctrlDetalhe.ActivePage = tbsDadosPess) then
      gbxDepend.Enabled := false
    else
    if (pgctrlDetalhe.ActivePage = tbsSitFunc) then
      tbsSitFunc.Enabled := false
    else
    if (pgctrlDetalhe.ActivePage = tbshOutros) then
    begin
      bAltContaSalario := (CdsParamRH.FieldByName('FlgCtSalAlt').asInteger = 1) and (CdsSubTipo.State in [dsInsert,dsEdit]);
      dblckBancoSalario.ReadOnly := not(bAltContaSalario);
      dblckBancoSalario.Enabled := bAltContaSalario;
      dblckBancoSalario.TabStop := bAltContaSalario;
      mskedNumAgenciaSalario.ReadOnly := not(bAltContaSalario);
      mskedNumAgenciaSalario.Enabled := bAltContaSalario;
      mskedNumAgenciaSalario.TabStop := bAltContaSalario;
      mskedNumContaSalario.ReadOnly := bAltContaSalario;
      mskedNumContaSalario.Enabled := bAltContaSalario;
      mskedNumContaSalario.TabStop := bAltContaSalario;
      spbtProcuraAgenciaSalario.Enabled := bAltContaSalario;
    end
    else
    if (pgctrlDetalhe.ActivePage = tbsUltEmpr) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgEmprgIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgEmprgAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgEmprgExc').asInteger = 1);
    end;
  end;
end;

procedure TfrmCadFunc.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CdsSubTipo.FieldByName('TIPOPAGAMENTO').asString := 'M';
  if (CdsParamRH.FieldByName('FLGNUMERAMATRIC').asInteger = 1) then
    dbedMatric.Text := TCtrlPessoaFuncionario(Pessoa).GetProxMatricula(
      CdsParamRH.FieldByName('TAMANHOMATRIC').asInteger);

  cdsContratoTemp.Insert; // Felipe A. Santos SOL 207737 KTN 2018095

  HabilitarCampos;
end;

procedure TfrmCadFunc.dsStateChange(Sender: TObject);
begin
  inherited;
  cmbRaca.Enabled := (Cds.State in [dsInsert,dsEdit]);
  //dbcmbTipoSang.Enabled := cmbRaca.Enabled;  William Moreira da Silva - SOL 186932 KINTANA 1761860
  mskedNumAgenciaSalario.Enabled := cmbRaca.Enabled;
  mskedNumContaSalario.Enabled := cmbRaca.Enabled;
  spbtProcuraAgenciaSalario.Enabled := cmbRaca.Enabled;
  mskedNumAgenciaFGTS.Enabled := cmbRaca.Enabled;
  mskedNumContaFGTS.Enabled := cmbRaca.Enabled;
  spbtProcuraAgenciaFGTS.Enabled := cmbRaca.Enabled;
  spedDias.Enabled := cmbRaca.Enabled;
end;

procedure TfrmCadFunc.dsSubTipoStateChange(Sender: TObject);
begin
  inherited;
  //Higor Nayde Ferreira Sol 188194 - Kintana 1779198 Inicio
  dbedSalario.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
  dblckBancoSalario.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
  dblckBancoFGTS.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
  dbedValFG.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
  dbedDatSalar.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
  dbedDataFuncao.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 fim

  //Início - William Santana - SOL 211502.16259 PPM 442499
   tmpDtHomologacao.ReadOnly := not(CdsSubTipo.State in [dsInsert,dsEdit]);
   btnAssociaRecisao.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
   btnImprimirTermo.Enabled  := not(CdsSubTipo.isEmpty);
  //Término - William Santana - SOL 211502.16259 PPM 442499
end;

procedure TfrmCadFunc.CdsSubTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (CdsSubTipo.Active) then
  begin
    lblDatOpc.Visible := (rgFGTSopcao.ItemIndex = 0);
    dbedDatOpc.Visible := (rgFGTSopcao.ItemIndex = 0);
    dbedSalario.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
    dbedRetornoExit(nil);
  end;
end;

procedure TfrmCadFunc.CdsPessoaFisicaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  //(2->Branca; 4->Preta; 6->Amarela; 8->Parda; 0->Indígena)
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '2') then
    cmbRaca.ItemIndex := 0
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '4') then
    cmbRaca.ItemIndex := 1
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '6') then
    cmbRaca.ItemIndex := 2
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '0') then
    cmbRaca.ItemIndex := 4
  else
    cmbRaca.ItemIndex := 3;

  // Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  case CdsPessoaFisica.FieldByName('DESCCONTRIBPREV').AsInteger of
    1: cbbDESCCONTRIBPREV.ItemIndex := 0;
    2: cbbDESCCONTRIBPREV.ItemIndex := 1;
    3: cbbDESCCONTRIBPREV.ItemIndex := 2;
  end;
  // Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
end;

procedure TfrmCadFunc.dblckCCustoChange(Sender: TObject);
Begin

  if (Trim(dblckCCusto.Text) <> '') then
  begin
    CdsCCusto.Locate('CODCENTROCUSTO', dblckCCusto.Text, []);
    edNomeCCusto.Text := CdsCCusto.FieldByName('NOME').asString;
  end
  else
    edNomeCCusto.Text := '';
  //Mose - SOL : 185455 KTN 1739618 Inicio
  //Início - William Santana - SIG 49177 - comentado
//  if CdsSubTipo.State in [dsedit, dsinsert] then
//  begin
//     if ((GuardaCCusto <> dblckCCusto.Text) or (GuardaCCusto<>'')) then
//     begin
//        if ((CdsCCusto.FieldByName('ATIVO').asString = 'Não') or (CdsCCusto.FieldByName('STATUSGRUPOCDC').asString = 'S'))  then
//           begin
//                if (dblckCCusto.Text <> GuardaCCusto) then
//                begin
//                MsgDlg('Não é permitido alterar para um centro de custo inativo ou sintético', 'Aviso', mtWarning, [mbOk], 0);
//                dblckCCusto.Text := GuardaCCusto;
//                exit;
//                end;
//           end;
//     end;
//  end;
  //Término - William Santana - SIG 49177
  //Mose - SOL : 185455 KTN 1739618 Fim
end;

//Início - William Santana - SIG 49177
procedure TfrmCadFunc.dblckCCustoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //colocando verificação no evento closeUp, pois não passa pelo onChange quando o nome é igual
  if CdsSubTipo.State in [dsedit, dsinsert] then
  begin
     if ((GuardaCCusto <> CdsSubTipo.FieldByName('CODCENTROCUSTO').AsString) or (GuardaCCusto<>'')) then
     begin
        if ((CdsCCusto.FieldByName('ATIVO').asString = 'Não') or (CdsCCusto.FieldByName('STATUSGRUPOCDC').asString = 'S'))  then
           begin
              MsgDlg('Não é permitido alterar para um centro de custo inativo ou sintético', 'Aviso', mtWarning, [mbOk], 0);
              CdsCCusto.Locate('CODCENTROCUSTO', GuardaCCusto, []);
              dblckCCusto.Text := CdsCCusto.FieldByName('NOME').asString;
              CdsSubTipo.FieldByName('CODCENTROCUSTO').AsString := GuardaCCusto;
              exit;
           end
        else
           GuardaCCusto := CdsSubTipo.FieldByName('CODCENTROCUSTO').AsString;
     end;
  end;
end;
//Término - William Santana - SIG 49177


procedure TfrmCadFunc.dblckNacionalChange(Sender: TObject);
begin
{  gbxNaturalidade.Enabled := (Trim(dblckNacional.Text) <> '') or
    (CdsPessoaFisica.FieldByName('IdPessoa').IsNull);} //Michelle Mota - SOL: 250384.17324 - PPM:1070235

  if (iPaisAntigo <> CdsPaises.FieldByName('IDPAIS').asInteger) then //Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  //or (gbxNaturalidade.Enabled) then //Michelle Mota - SOL: 250384.17324 - PPM:1070235
  begin
    iPaisAntigo := CdsPaises.FieldByName('IDPAIS').asInteger;
    CdsEstadoNasc.Data := CtrlListTerceirosRH.ListEstado(
      CdsPaises.FieldByName('IDPAIS').asInteger);

    CdsCidadeNasc.Data := CtrlListTerceirosRH.ListCidadeNasc(
      CdsPaises.FieldByName('IDPAIS').asInteger);

    if (CdsPessoaFisica.State in [dsInsert, dsEdit]) then
    begin
      CdsPessoaFisica.FieldByName('CODESTADO').Clear;
      CdsPessoaFisica.FieldByName('IDCIDADES').Clear;
    end;
  end;


end;

procedure TfrmCadFunc.dblckCargo1Change(Sender: TObject);
begin
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  if not(CdsCargo.Active) or (CdsCargo.FieldByName('CBO2002').IsNull) then
    gbxCargo1.Caption := 'Cargo Oficial ( ou Básico)'
  else
    gbxCargo1.Caption := 'Cargo Oficial ( ou Básico) (CBO: ' +CdsCargo.FieldByName('CBO2002').asString+ ')';

  dbspeStep1Change(dbspeStep1);
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198

  //Cássio Rovaroto - SIG nº 62180 - Início
	//Se o cargo for igual a AUXILIAR ADMINISTRATIVO - APRENDIZ, habilitar o campo Agente de Integração
	if CdsCargo.FieldByName('IDCARGO').AsInteger = 200701 then
  begin
    grbInfoEstagio.Enabled := True;
    grbInfoEstagio.Font.Color := clWindowText;
    //grbSpVisorEstag.Font.Color := clBtnShadow;
    lblAgenIntegracao.Enabled := True;
  	dbedtAgenIntegracao.Enabled := True;
    sbtnAgenIntegracao.Enabled := True;
  end
  else
  //Cássio Rovaroto - SIG nº 62992 - Início
  if (dbrgTipContra.ItemIndex = 3) then
  begin
    DefineHabDadosEstagio(True);
    DefineHabDadosCessao(False);
  end
    else
    if ((dbrgTipContra.ItemIndex = 4) or (dbrgTipContra.ItemIndex = 5)) then
    begin
      DefineHabDadosCessao(True);
      DefineHabDadosEstagio(False);
    end
    else
  //Cássio Rovaroto - SIG nº 62992 - Fim
    begin
      grbInfoEstagio.Enabled := False;
      grbInfoEstagio.Font.Color := clBtnShadow;
      lblAgenIntegracao.Enabled := False;
  	  dbedtAgenIntegracao.Enabled := False;
      sbtnAgenIntegracao.Enabled := False;
    end;
  //Cássio Rovaroto - SIG nº 62180 - Fim
end;

procedure TfrmCadFunc.dblckCargo2Change(Sender: TObject);
begin
  inherited;
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  dbspeStep2Change(dbspeStep2);
end;

procedure TfrmCadFunc.dblckSitFuncChange(Sender: TObject);
begin
  if (Cds.State in [dsEdit, dsInsert]) then
    TCtrlPessoaFuncionario(Pessoa).MudouSituacao := true;
end;

procedure TfrmCadFunc.dbrgNaturChange(Sender: TObject);
begin
  dbedDecrNatur.Enabled := (dbrgNatur.ItemIndex = 0);
  // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
  //lblDataNatur.Visible := (dbrgNatur.ItemIndex = 0);  //Everson Cunha - SIG38475
  //dbedDataNatur.Visible := (dbrgNatur.ItemIndex = 0); //Everson Cunha - SIG38475

  //Cássio Rovaroto - SIG n 38475.59780 - Início
  //if dbrgNatur.ItemIndex = 0 then    //Everson Cunha - SIG38475
  //	dbedDataNatur.Color := clWindow; //Everson Cunha - SIG38475
    
  //if (Cds.State in [dsEdit, dsInsert]) then //Everson Cunha - SIG38475
	//  if dbedDataNatur.Visible then           //Everson Cunha - SIG38475
  //		dbedDataNatur.SetFocus;               //Everson Cunha - SIG38475
  //Cássio Rovaroto - SIG n 38475.59780 - Fim

  // Felipe A. Santos SOL 229871.16137 PPM 407073 - fim
end;
//
{procedure TfrmCadFunc.dblckFaixa1Change(Sender: TObject); fora
var //higor  Inicio   Sol 194603  Sol194603
 qryAux : TwwQuery;
 sSql : string;
begin
  qryAux:= TwwQuery.Create(Self);
  qryAux.Databasename := 'BaseDados';
  if not(CdsSubTipo.Active) or (Cds.State = dsBrowse) then
    exit;

  if not(CdsSubTipo.IsEmpty) and (Trim(dblckFaixa1.Text) <> '') then
  begin
    if (CdsSubTipo.FieldByName('NIVELINDIV1').asInteger = 0) then
      CdsSubTipo.FieldByName('NIVELINDIV1').asInteger := 1;

      if (dbspeStep1.Text = '') then
         dbspeStep1.Text := '1';

      sSql :=  'SELECT STEP' + dbspeStep1.text+ //CdsSubTipo.FieldByName('NIVELINDIV1').asString +
             ' FROM FAIXASAL WHERE IDFAIXASALARIAL ='+dblckFaixa1.Text;

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.Open;

      CdsSubTipo.FieldByName('SALARIOATUAL').asFloat :=
      StrToFloat(qryAux.FieldByName('STEP'+dbspeStep1.text).AsString);
      //higor  Fim   Sol 194603  Sol194603
  end
  else
    CdsSubTipo.FieldByName('SALARIOATUAL').Clear;
end; } //fora

procedure TfrmCadFunc.dbedDecrNaturKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9']) then
    Key := #0;
end;

procedure TfrmCadFunc.dblckUltCargoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: boolean);
begin
  if (Modified) and (Trim(dblckUltCargo.Text) <> '') and
     (pgctrlDetalhe.ActivePage = tbsUltEmpr) then
    CdsUltEmpr.FieldbyName('CARGO').asString := dblckUltCargo.Text;
end;

procedure TfrmCadFunc.dbedSalarioEnter(Sender: TObject);
begin
  //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  {if not(CdsSubTipo.Active) or (bFocoEmSalario) then
  begin
    bFocoEmSalario := false;
    exit;
  end;

  if not(CdsSubTipo.IsEmpty) and (Cds.State <> dsBrowse) and (
     not(CdsSubTipo.FieldByName('IDCARGO').IsNull)) then
  begin
    pnlAlteraSal.Top  := gbxSalar.Top + dbedSalario.Top + dbedSalario.Height;
    pnlAlteraSal.Left := gbxSalar.Left + dbedSalario.Left;

    pnlAlteraSal2.Visible := False;
    dbedSalario.Enabled := true;
    pnlAlteraSal.Visible := true;
    rgInformaSalario.ItemIndex := 0;
    rgInformaSalario.SetFocus;
  end;}
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
end;

procedure TfrmCadFunc.tbshEstrangeiroEnter(Sender: TObject);
begin
  if (Cds.State in [dsInsert, dsEdit]) then
  begin
    if (CdsEstrangeiro.IsEmpty) then
    begin
      CdsEstrangeiro.Insert;
      //CdsEstrangeiro.FieldByName('FLGNATURALIZADO').asInteger := 1; //Cássio Rovaroto - SIG nº 38475.59780
    end
    else
        CdsEstrangeiro.Edit;
  end;
end;

procedure TfrmCadFunc.mskedNumAgenciaSalarioEnter(Sender: TObject);
begin
  if (TMaskEdit(Sender).Name = 'mskedNumAgenciaSalario') then
    sNumAgenciaSalario := Trim(mskedNumAgenciaSalario.Text)
  else
    sNumAgenciaFGTS := Trim(mskedNumAgenciaFGTS.Text);



end;

procedure TfrmCadFunc.mskedNumAgenciaSalarioExit(Sender: TObject);
var
  sNumAgencia: string;
  IdAgenciaBancaria: double;
begin
  if (TMaskEdit(Sender).Name = 'mskedNumAgenciaSalario') then
    sNumAgencia := sNumAgenciaSalario
  else
    sNumAgencia := sNumAgenciaFGTS;

  if (Trim(TMaskEdit(Sender).Text) <> '') and (sNumAgencia <> Trim(TMaskEdit(Sender).Text)) then
  begin
    IdAgenciaBancaria := CtrlListTerceirosRH.GetIdAgenciaBancaria(TMaskEdit(Sender).Text);
    if (IdAgenciaBancaria = 0) then
    begin
      MsgDlg('Agência não cadastrada.', 'Aviso', mtWarning, [mbOk,mbHelp], iHelp); // Alteradoa por Felipe A. Santos SOL 229871.16137 PPM 407073
      TMaskEdit(Sender).Text := sNumAgencia;
      TMaskEdit(Sender).SetFocus;
    end
    else
      sNumAgencia := FloatToStr(IdAgenciaBancaria);
  end
  else
    sNumAgencia := '';

  if (TMaskEdit(Sender).Name = 'mskedNumAgenciaSalario') then
    sIdAgenciaSalario := sNumAgencia
  else
    sIdAgenciaFGTS := sNumAgencia;

  


end;

procedure TfrmCadFunc.mskedNumContaSalarioExit(Sender: TObject);
begin
  if (TMaskEdit(Sender).Name = 'mskedNumContaSalario') then
    sNumContaSalario := Trim(mskedNumContaSalario.Text)
  else
    sNumContaFGTS := Trim(mskedNumContaFGTS.Text);

  if mskedNumContaSalario.text <> sValorInicialConta  then
    sValorConta := mskedNumContaSalario.text;
end;

procedure TfrmCadFunc.dbedMatricExit(Sender: TObject);
var
  dIdPessoa: double;
begin
  dIdPessoa := TCtrlPessoaFuncionario(Pessoa).GetMatriculaJaExiste(dbedMatric.Text,
    Sistema.IdEmpresa);

  if (dIdPessoa > 0) and (dIdPessoa <> Cds.FieldByName('IDPESSOA').asFloat) then
  begin
    MsgDlg('Matrícula já cadastrada para esta Empresa.' +CR_LF+ 'Informe outra.', 'Aviso',
      mtWarning, [mbOk,mbHelp], iHelp); // Alterado por Felipe A. Santos SOL229871.16137
    if dbedMatric.CanFocus then
    dbedMatric.SetFocus;
  end;
end;

procedure TfrmCadFunc.dbedFinalContrExit(Sender: TObject);
var
  iDuracao: integer;
begin
  if (dbedFinalContr.Text <> '') and not(Cds.IsEmpty) then
  begin
    iDuracao := TCtrlPessoaFuncionario(Pessoa).SetDuracaoContrato(dbedDatAdmis.Date,
      dbedFinalContr.Date, CdsParamRH.FieldByName('INDDURACAOCONTR').asInteger);
    if (FU.StrInt(dbedDuracaoContr.Text) > 0) and
       (iDuracao > FU.StrInt(dbedDuracaoContr.Text)) then
     // CdsSubTipo.FieldByName('PRORROGCONTRATO').asInteger :=     //MONICA -  Número da SOL: 172600
       // iDuracao - FU.StrInt(dbedDuracaoContr.Text)            //MONICA -  Número da SOL: 172600 
    else
    begin
      CdsSubTipo.FieldByName('PRORROGCONTRATO').asInteger := 0;
      CdsSubTipo.FieldByName('DURACAOCONTRATO').asInteger := iDuracao;
    end;
  end;
end;

procedure TfrmCadFunc.dbedDuracaoContrExit(Sender: TObject);
var
  DataIni: TDate;
begin
  if not(Cds.IsEmpty) then
  begin
    if (dbedDatAdmis.Text <> '') then
      DataIni := StrToDate(dbedDatAdmis.Text)
    else
      DataIni := Date;

//MONICA -  Número da SOL: 172600 - INICIO IF
     if (dbedDuracaoContr.Text = '0') or (dbedDuracaoContr.Text = '') then
     dbedFinalContr.Text := ''
     else
     begin
      TCtrlPessoaFuncionario(Pessoa).SetDataFinalContrato(DataIni,
      FU.StrInt(dbedDuracaoContr.Text) + FU.StrInt(dbedProrr.Text),
      CdsParamRH.FieldByName('INDDURACAOCONTR').asInteger);

      dbedFinalContr.Text := CdsSubTipo.FieldByName('DATAFIMCONTRATO').asString;
     end;
       //MONICA -  Número da SOL: 172600 - FIM IF


    end;
  end;


procedure TfrmCadFunc.dbedRetornoExit(Sender: TObject);
begin
  if (Trim(dbedRetorno.Text) <> '') and (Trim(dbedDatSaida.Text) <> '') then
    spedDias.Value := DiasUteis.IntervaloDias(StrToDate(dbedDatSaida.Text),
      StrToDate(dbedRetorno.Text))
  else
    spedDias.Value := 0;
end;

procedure TfrmCadFunc.spedDiasExit(Sender: TObject);
begin
  if (Trim(spedDias.Text) <> '') and (Trim(dbedDatSaida.Text) <> '') then
    CdsSubTipo.FieldByName('DATARETORNO').asDateTime :=
      StrToDate(dbedDatSaida.Text) + StrToInt(spedDias.Text)
  else
    CdsSubTipo.FieldByName('DATARETORNO').Clear;
end;

procedure TfrmCadFunc.spbtProcuraAgenciaSalarioClick(Sender: TObject);
var
  lookAux: TwwDBLookupCombo;
begin
  if (TSpeedButton(Sender).Name = 'spbtProcuraAgenciaSalario') then
    lookAux := dblckBancoSalario
  else
    lookAux := dblckBancoFGTS;

  if (Trim(lookAux.Text) <> '') then
  begin
    msAgencia.Filtro.Clear;
    msAgencia.Filtro.Add('BANCO.IDPESSOA           = ' +lookAux.LookupValue);
    msAgencia.Filtro.Add('BANCO.IDPESSOA           = AGENCIABANCARIA.IDBANCO');
    msAgencia.Filtro.Add('AGENCIABANCARIA.IDPESSOA = PESSOA.IDPESSOA');
    msAgencia.Executar;

    if (msAgencia.RetornouValor) then
    begin
      if (TSpeedButton(Sender).Name = 'spbtProcuraAgenciaSalario') then
      begin
        sIDAgenciaSalario := msAgencia.ValoresChave[1];
        mskedNumAgenciaSalario.Text := msAgencia.ValoresChave[0];
      end
      else
      begin
        sIDAgenciaFGTS := msAgencia.ValoresChave[1];
        mskedNumAgenciaFGTS.Text := msAgencia.ValoresChave[0];
      end;
    end;
  end;
end;

procedure TfrmCadFunc.rgFGTSopcaoClick(Sender: TObject);
begin
  lblDatOpc.Visible := (rgFGTSopcao.ItemIndex = 0);
  dbedDatOpc.Visible := (rgFGTSopcao.ItemIndex = 0);
end;

procedure TfrmCadFunc.rgInformaSalarioClick(Sender: TObject);
var
  c: integer;
begin
  cmbSteps.Text := '';
  cmbSteps.Enabled := (rgInformaSalario.ItemIndex = 1);

  if (rgInformaSalario.ItemIndex = 1) then
  begin
    cmbSteps.Items.Clear;
    dmCds.Cds.Data := CtrlFaixaSal.ListFaixaCargo(CdsSubTipo.FieldByName('IDCARGO').asFloat);
    if not(dmCds.Cds.IsEmpty) then
    begin
      for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
        cmbSteps.Items.Add(FormatFloat('#0.00',
          dmCds.Cds.FieldByName('STEP' +IntToStr(c)).asFloat));
    end
    else
    begin
      MsgDlg('Não Existe Faixa Salarial Associada.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp); // Alterado por Felipe A. Santos 229871.16137
      if rgInformaSalario.CanFocus then
      rgInformaSalario.SetFocus;
    end;
  end;
end;

procedure TfrmCadFunc.tbbtnConfInfoClick(Sender: TObject);
begin
  if (rgInformaSalario.ItemIndex = 1) and (Trim(cmbSteps.Text) <> '') then
    CdsSubTipo.FieldByName('SALARIOATUAL').asFloat :=
      StrToFloat(FU.TiraCaracter(cmbSteps.Text,'.'));
  tbbtnCancelInfoClick(Sender);
  tbbtnConfInfo.Down := false;
end;

procedure TfrmCadFunc.tbbtnCancelInfoClick(Sender: TObject);
begin
  pnlAlteraSal.Visible := false;
  dbedSalario.Enabled := true;
  bFocoEmSalario := true;
  dbedSalario.SetFocus;
  tbbtnCancelInfo.Down := false;
end;

procedure TfrmCadFunc.sbtnInserirClick(Sender: TObject);

var i:integer; //William Santana  - SOL: 201365 - KINTANA: 1965590

begin
  SelHstAltCad(true);

  if sValorINicialAgencia = '' then
  sValorInicialAgencia := mskedNumAgenciaSalario.text ;

  if sInicialAgencia = '' then
  sValorInicialAgencia := mskedNumAgenciaSalario.text ;

  inherited;
  // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Inicio
  lstDocumentos.Items[3].Selected := True;
  lstDocumentos.Items[0].Selected := True;
  // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Fim
   //mose.
  With CdsCCusto do
     begin

       Filter := ' ATIVO = ''Sim'' AND  STATUSGRUPOCDC = ''A'' ';
       Filtered := True;
       //Filtered := False;
       //Filter := '';

     end;
    //mose.

   //William Santana - SOL: 201365 - KINTANA: 1965590
   if not(bOkclick) or (bAlteraClick) then  
   begin
    for i:=0 to ChkLBoxTipoBen.items.count -1 do
    ChkLBoxTipoBen.Checked[i] := true;
    GBoxTipoBeneficios.Enabled  := true;
   end;
   bOkclick := False;
   bAlteraClick := False;
   //END- William Santana - SOL: 201365 - KINTANA: 1965590

   // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
   CdsEstagiario.Insert;
   CdsDadosCessao.Insert;

  cmbGrupoCateg.Enabled := True;
   // Felipe A. Santos SOL 229871.16137 PPM 407073 - fim

  //Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  NovoRegistro := True;
  cbbDESCCONTRIBPREV.Enabled := False;
  cbbDESCCONTRIBPREV.Text := '';
  //Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

  HabDesabBenef(true);// Michelle Mota - SIG27550
end;

procedure TfrmCadFunc.sbtnAlterarClick(Sender: TObject);
begin
    //Mose - SOL : 185455 KTN 1739618 Inicio
   //GuardaCCusto:= dblckCCusto.Text;  //William Santana - SIG 49177
    GuardaCCusto := dblckCCusto.LookupValue;  //William Santana - SIG 49177
   //Mose - SOL : 185455 KTN 1739618 Inicio
   SelHstAltCad(true);

   //Agência da conta salário
   if sValorInicialAgencia = '' then
   sValorInicialAgencia := mskedNumAgenciaSalario.text ;

   //Agência
   if sInicialAgencia = '' then
   sInicialAgencia := DbeAgencia.text ;
   
  inherited;
  // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Inicio
  iIndex :=  lstDocumentos.Selected.Index;

  Proc_GravaDocMemoria;

  lstDocumentos.Items[3].Selected := True;
  lstDocumentos.Items[iIndex].Selected := True;
  // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Fim

  //William Santana - SOL: 201365 - KINTANA: 1965590
   GBoxTipoBeneficios.Enabled  := true;
   bAlteraClick                := True;
  //END- William Santana - SOL: 201365 - KINTANA: 1965590

  // Felipe A. Santos SOL 229871.16137 PPM 407073 - início

  if CdsEstagiario.IsEmpty then
    CdsEstagiario.Insert
  else
    CdsEstagiario.Edit;

  if CdsDadosCessao.IsEmpty then
    CdsDadosCessao.Insert
  else
    CdsDadosCessao.Edit;

  cmbGrupoCateg.Enabled := True;
  // Felipe A. Santos SOL 229871.16137 PPM 407073 - fim

  HabDesabBenef(true);// Michelle Mota - SIG27550}
end;

procedure TfrmCadFunc.bbtnOkDetClick(Sender: TObject);
begin
  {Início - Michelle Mota - SIG27550}
  if (CdsUltEmpr.State in [dsInsert, dsEdit]) then
    CdsUltEmpr.FieldByName('DESCMOTIVO').AsString := dblckUltMotivo.Text;

  if (pgctrlDetalhe.ActivePage = tbsDadosBancarios) then
    begin
      CdsContaBancaria.FieldByName('TPCONTA').AsString     :=  IFF(CdsContaBancaria.FieldByName('TIPOCONTA').AsInteger = 1, 'Corrente', IFF(CdsContaBancaria.FieldByName('TIPOCONTA').AsInteger = 2,'Salário', 'Poupança'));
      CdsContaBancaria.FieldByName('PREF').AsString        :=  IFF(ChbContaPref_Padrao.Checked, 'Sim', 'Não');
      CdsContaBancaria.FieldByName('INATIVA').AsString     :=  containativa;
    end;
  {Término - Michelle Mota - SIG27550}
  //Agência
  if DbeAgencia.text <> sInicialAgencia  then
  sAgencia := DbeAgencia.text;
  sInicialAgencia:='';

  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
    if dblkpTpLogradouro.Text = '' then
    begin
       MsgDlg('Selecione o campo Tipo de Logradouro', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
       if dblkpTpLogradouro.CanFocus then
       dblkpTpLogradouro.SetFocus;
       Exit;
    end;
    // Felipe A. Santos SOL 229871.16137 PPM 407073 - fim

    CdsEnderecoTIPOLOGRADOURO.AsString := dblkpTpLogradouro.Text; // Felipe A. Santos SOL 229871.16137 PPM 407073

    TCtrlPessoaFuncionario(Pessoa).GuardarAlteracaoEndereco;
  end
  else if (pgctrlDetalhe.ActivePage = tbsUltEmpr) then
  begin
    if (CdsUltEmpr.FieldByName('NUMSEQ').IsNull) then
    begin
      MsgDlg('Número de Sequência deve ser preenchido.', 'Aviso', mtWarning, [mbOk,mbHelp], iHelp); // Alterado por Felipe A. Santos SOL 229871.16137 PPM 407073
      dbedNumSeq.SetFocus;
      exit;
    end
    // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
    else if (Trim(dbedtCNPJUltEmp.Text) = '') then
    begin
      MsgDlg('Preencha o campo CNPJ da empresa anterior', 'Aviso', mtWarning, [mbOk,mbHelp], iHelp);
      if dbedtCNPJUltEmp.CanFocus then
      dbedtCNPJUltEmp.SetFocus;
      Exit;
    end
    else if (Trim(dbedtMatUltEmp.Text) = '') then
    begin
      MsgDlg('Preencha a Matrícula da empresa anterior', 'Aviso', mtWarning, [mbOk,mbHelp], iHelp);
      if dbedtMatUltEmp.CanFocus then
      dbedtMatUltEmp.SetFocus;
      Exit;
    end;
    // Felipe A. Santos SOL 229871.16137 PPM 407073 - fim
  // Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  end
  else if (pgctrlDetalhe.ActivePage = tbsProcessos) then
  begin
    CdsProcessos.FieldByname('NUMERO').AsString := edtNumeroProc.Text;
    if (cbbTipoProc.Text = '') then
      begin
        MsgDlg('Informe o Tipo.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        cbbTipoProc.SetFocus;
        Exit;
      end;
    //Cássio Rovaroto - SIG nº 38475.59780 - Início
    //if (dblkpcbbIndicativoSusp.text = '') then
    //  begin
    //    MsgDlg('Selecione o Indicativo de suspensão da exigibilidade.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    //    Exit;
    //  end;
    //Cássio Rovaroto - SIG nº 38475.59780 - Fim
    if (edtNumeroProc.Text = '') then
      begin
        MsgDlg('Informe o Número.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        edtNumeroProc.SetFocus;
        Exit;
      end;
    if (edtDataInicio.Text = '') then
      begin
        MsgDlg('Informe a Data Início.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        edtDataInicio.SetFocus;
        Exit;
      end;
    if (edtDataInicio.Date > edtDataFim.Date) and (edtDataFim.Text <> '') then
      begin
        MsgDlg('A data fim não pode ser menor que a data início.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        edtDataFim.SetFocus;
        Exit;
      //end
    //Cássio Rovaroto - SIG nº 38475.59780 - Início
      //else
      //begin
      //	if edtDataFim.Text = '' then
      //  	cdsProcessos.FieldByName('DATAFIM').AsDateTime := 0;	
      end;
    if (dblkpcbbIDCIDADES.Text = '') then
      begin
        MsgDlg('Selecione a Cidade.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        dblkpcbbIDCIDADES.SetFocus;
        dblkpcbbIDCIDADES.DropDown;
        Exit;
      end;
    if (edtUFSecaoJud.Text = '') then
      begin
        MsgDlg('Informe a UF da Seção Judiciária.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        Exit;
      end;
    if (edtCodMunicipio.Text = '') then
      begin
        MsgDlg('Informe o Código do Município.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        Exit;
      end;
    if (edtCODIDENTVARA.Text = '') then
      begin
        MsgDlg('Selecione o Código de Ident. da Vara.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        edtCODIDENTVARA.SetFocus;
        Exit;
      end;
    //if (edtDataDecisao.Text = '') then
    //  begin
    //    MsgDlg('Obrigatório preencher a Data da Decisão.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    //    Exit;
    //  end;
    //Cássio Rovaroto - SIG nº 38475.59780 - Fim
    if (cbbCONTRIABRANDECISAO.Text = '') then
      begin
        MsgDlg('Selecione o tipo de Contribuição abrangida pela Decisão.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        cbbCONTRIABRANDECISAO.SetFocus;
        Exit;
      end;

    if (cmbMatProc.Text = '') then
      begin
        MsgDlg('Selecione a Matéria do Processo.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
        cmbMatProc.SetFocus;
        Exit;
      end;

    //Everson Luiz - SIG70569 - Início
    //if (cbbEXTENDECISAO.Text = '') then
    //begin
    //  MsgDlg('Selecione a Extensão da Decisão/Sentença.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    //  Exit;
    //end;
    //Everson Luiz - SIG70569 - Fim

    //Everson Luiz SIG70569 - Início
    {if (cbbIndicaDecisao.Text = '') then
    begin
      MsgDlg('Selecione o Indicativo da Decisão.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      Exit;
    end;
    if (cbbApurFap.Text = '') then
    begin
      MsgDlg('Informe a Forma de Apuração do FAP.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      Exit;
    end;}
    //Everson Luiz SIG70569 - Fim
    
    //Cássio Rovaroto - SIG nº38475.59780 - Início
    if dbrgrpAUTORACAO.ItemIndex =  -1 then
    begin
      MsgDlg('É obrigatória a definição do autor da ação.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      dbrgrpAUTORACAO.SetFocus;
      Exit;
    end;

    //Cássio Rovaroto - SIG nº 62232 - Início
    if (cdsProcessos.State in [dsInsert]) then            //Everson Cunha - SIG70569
    //if (cdsProcessos.State in [dsInsert, dsEdit]) then  //Everson Cunha - SIG70569
    //Cássio Rovaroto - SIG nº 62232 - Fim
    begin
    	if TCtrlPessoaFuncionario(Pessoa).VerificaProcessoFuncionario(edtNumeroProc.Text, cds.FieldByName('IDPESSOA').asInteger) then
      begin
      	MsgDlg('Número de processo já cadastrado para este funcionário.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
       	edtNumeroProc.SetFocus;
        Exit;
      end;
    end; //Everson Cunha - SIG70569

      //Cássio Rovaroto - SIG nº 62232 - Início
      //if (cdsProcessosXIndicativoSusp.FieldByName('IDINDICATIVOSUSP').IsNull) then
      //Indicativo de suspensão somente deve existir se o Tipo de Processo for diferente de "Número de Benefício" e a matéria do processo igual a
      //"Tributária".
      //if (cdsProcessosXIndicativoSusp.FieldByName('IDINDICATIVOSUSP').IsNull) and ((cbbTipoProc.ItemIndex <> 2) and (cmbMatProc.ItemIndex = 0))then //Everson Cunha - SIG38475
      if (cdsProcessosXIndicativoSusp.FieldByName('IDINDICATIVOSUSP').IsNull) and (cmbMatProc.ItemIndex = 0)then                                      //Everson Cunha - SIG38475
      //Cássio Rovaroto - SIG nº 62232 - Fim
      begin
        MsgDlg('É necessário indicar pelo menos um Indicativo de Suspensão ao processo.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
        pgcProcessos.ActivePage := tbsIndicativoSusp;
        case cbbTipoProc.ItemIndex of
          0: CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('A');
          1: CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('J');
          //2: CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('N'); //Everson Cunha - SIG38475
          2: CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('F'); //Everson Cunha - SIG70569
        end;

        cdsIndicativoSusp.Filtered := False;
        cdsIndicativoSusp.Filter := 'TIPO = ' + QuotedStr(cdsProcessos.FieldByName('TIPO').AsString);
        cdsIndicativoSusp.Filtered := True;

        pgcProcessosChange(self);
        Exit;
      end;
    //end; //Everson Cunha - SIG70569
    //Cássio Rovaroto - SIG nº38475.59780 - Fim
    //Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  end;

  inherited;

  AtivaFlagAtivo; //Darivaldo Alencar SIG 20673

  // Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  if (pgctrlDetalhe.ActivePage = tbsProcessos) then
  begin
    LimpaCamposProcessos;
  end;
  // Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
end;



procedure TfrmCadFunc.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
  sDoc: string;
  iIndex, I: Integer;
  id : Integer; // Michelle Mota - SIG27550
  dIDPESSOA :Double; //William Santana - SOL: 201365 - KINTANA: 1965590


begin
    if not (ValidaEntrada) then Abort; // Darivaldo Alencar - SIG 22093
    //Darivaldo Alencar SIG 20673-inicio
    if not(VerificaEnderecoAtivo(0)) then Abort;
    //Darivaldo Alencar SIG 20673 -fim
    
    // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
    if not VerificaDadosPessoais then
       Exit;
   // Felipe A. Santos SOL 207737 KTN 2018095 - início
    if not(ValidaContratoTemp) then
       Exit;
    // Felipe A. Santos SOL 207737 KTN 2018095 - fim

    if not VerificaSituacaoFuncional(dbrgTipContra.ItemIndex) then
       Exit;

    if not VerificaEsocial then
       Exit;
    // Felipe A. Santos SOL 229871.16137 PPM 407073 - fim

    // Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
    if not VerificaOutros then
      Exit;   
    //Cássio Rovaroto - SIG nº 38475.59780 - Início
    //if not VerificaAbaGeral then
    //  Exit;
  	if dbrgContrPrev.ItemIndex = 0 then
  	begin
  		if VerificaProcContrPrev( CdsSubTipo.FieldByName('IDPESSOA').AsString ) = False then
    	 if MsgDlg('Foi definida a Isenção de cobrança de Contribuição Previdenciária, ' +#13 +
       					 'mas não houve a definição do número do processo. Confirma esta situação?', 'Atenção', mtWarning, [mbYes, mbNo], 0) = mrNo then
       begin
        MsgDlg('Informe o Número do Processo de Isenção de Contribuição Previdenciária.', 'Aviso', mtInformation, [mbOk], 0);
        tbcDetalhe.TabIndex := 14;
      	tbcDetalheChange(pgctrlDetalhe);
        Exit;
       end;
  	end;

    if dbrgIsento.ItemIndex = 0 then
  	begin
  		if VerificaProcContrIR( CdsSubTipo.FieldByName('IDPESSOA').AsString ) = False then
    	 if MsgDlg('Foi definida a Isenção de cobrança de Imposto de Renda, mas não houve ' +#13 +
       					 'a definição do número do processo. Confirma esta situação?', 'Atenção', mtWarning, [mbYes, mbNo], 0) = mrNo then
       begin
        MsgDlg('Informe o Número do Processo de Isenção de Imposto de Renda.', 'Aviso', mtInformation, [mbOk], 0);
        tbcDetalhe.TabIndex := 14;
      	tbcDetalheChange(pgctrlDetalhe);
        Exit;
       end;
  	end;
    //Cássio Rovaroto - SIG nº 38475.59780 - Fim
    
    if not VerificaAnoChegada then
      Exit;
    //if not VerificaCondTrabEstr then //Everson Cunha - SIG38475
    //  Exit;                          //Everson Cunha - SIG38475
    // Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

    //Cássio Rovaroto - SIG nº 38475.59780 - Início
		//Se o cargo for igual a AUXILIAR ADMINISTRATIVO - APRENDIZ, obrigatório preencher o Agente de Integração
		if CdsSubTipo.FieldByName('IDCARGO').AsInteger = 200701 then
    begin
    	if CdsEstagiario.FieldByName('NOMEAI').IsNull then
      begin
      	MsgDlg('Favor, informar o agente de integração do estagiário.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
        tbcDetalhe.TabIndex := 7;
	       tbcDetalheChange(Self);
        Exit;
      end;
    end;

    //Caso não exista nenhum dados registrado relacionado a pessoa estrangeira então cancela a linha aberta.
    if CdsEstrangeiro.FieldByName('ANOCHEGADA').IsNull then
      CdsEstrangeiro.Cancel;
    //Cássio Rovaroto - SIG nº 38475.59780 - Fim

    bOkclick := True; // William Santana SOL - 201365 KIN- 1965590

    // SOL: 138283/622 1 - KINTANA: 1402575 Otacilio Aquino - Inicio
    // Verifica se os campos estão preenchido no caso de uma edição.
    // Verifica os campos alterados atraves do ListView

	//William Moreira da Silva - SIG 29916 - Inicio
    CdsDocumento.First;
    while not CdsDocumento.Eof do
    begin
          sDoc := StringReplace(CdsDocumento.FieldByName('NUMDOCUMENTO').AsString, '.', '', [rfReplaceAll]);//10 é o número do documento

          if (Trim(sDoc) <> '') then
          begin
                  if((CdsDocumento.FieldByName('OBRIGAUF').AsString = 'S') and (dbcmbEstadoDoc.Text = '')) then
                  begin
                        MessageBox(Handle, PChar('Obrigatório preencher a Unidade de Federação '+CdsDocumento.FieldByName('NOMEDOCUMENTO').AsString), 'Atenção', MB_OK + MB_ICONWARNING);
                        Exit;
                  end;
                  if((CdsDocumento.FieldByName('OBRIGAORGAO').AsString = 'S') and (EdtOrgaoEmissor.Text = '')) then
                  begin
                        MessageBox(Handle, PChar('Obrigatório preencher o Órgão Emissor  '+CdsDocumento.FieldByName('NOMEDOCUMENTO').AsString), 'Atenção', MB_OK + MB_ICONWARNING);
                        Exit;
                  end;
                  if((CdsDocumento.FieldByName('OBRIGAEMISSAO').AsString = 'S') and (EdtDataEmissao_Padao.Text = '')) then
                  begin
                        MessageBox(Handle, PChar('Obrigatório preencher a Data da Emissão '+CdsDocumento.FieldByName('NOMEDOCUMENTO').AsString), 'Atenção', MB_OK + MB_ICONWARNING);
                        Exit;
                  end;
                  if((CdsDocumento.FieldByName('FLGOBRIGAVALIDADE').AsString = 'S') and (EdtDataValidade_Padrao.Text = ''))then
                  begin
                        MessageBox(Handle, PChar('Obrigatório preencher a Data de Validade do documento '+CdsDocumento.FieldByName('NOMEDOCUMENTO').AsString), 'Atenção', MB_OK + MB_ICONWARNING);
                        Exit;
                  end;
                  if((CdsDocumento.FieldByName('OBRIGACATG').AsString = 'S') and (edtCategoria.Text = ''))then
                  begin
                        MessageBox(Handle, PChar('Obrigatório preencher a Categoria  '+CdsDocumento.FieldByName('NOMEDOCUMENTO').AsString), 'Atenção', MB_OK + MB_ICONWARNING);
                        Exit;
                  end;
                  if((CdsDocumento.FieldByName('OBRIGAPRMHAB').AsString = 'S') and (cbxDataHabilitacao.Text = ''))then
                  begin
                        MessageBox(Handle, PChar('Obrigatório preencher a Data da primeira habilitação  '+CdsDocumento.FieldByName('NOMEDOCUMENTO').AsString), 'Atenção', MB_OK + MB_ICONWARNING);
                        Exit;
                  end;
          end;
        CdsDocumento.Next;
    end;
    //William Moreira da Silva - SIG 29916 - Inicio
	
    if (Cds.State = dsEdit) then
    begin
      //William Moreira da Silva - SIG 29916 - Inicio
      {For iIndex := 0 to lstDocumentos.Items.Count - 1 do
      begin
        sDoc := StringReplace(lstDocumentos.Items[iIndex].SubItems.Text, '.', '', [rfReplaceAll]);
        sDoc := StringReplace(sDoc, '-', '', [rfReplaceAll]);
        sDoc := StringReplace(sDoc, '/', '', [rfReplaceAll]);
        sDoc := StringReplace(sDoc, '\', '', [rfReplaceAll]);
        if (Trim(sDoc) = '') and (Trim(strDocumentos[iIndex]) <> '') then
        begin
          MessageBox(Handle, PChar('Preencha o campo ' + '"' + lstDocumentos.Items[iIndex].Caption + '"' + ' da Documentação.'), 'Atenção', MB_OK + MB_ICONWARNING);
          tbcDetalhe.TabIndex      := 0;
          pgctrlDetalhe.ActivePage := tbsDocumento;
          lstDocumentos.Items[iIndex].Selected := True;
          edDocNumDocumento.SetFocus;
          Exit;
        end;
      end;}
	  //William Moreira da Silva - SIG 29916 - Fim

      // Verifica os campos alterados que nao aparecem no ListView
      CdsDocumento.First;
      I := 0;
      while not CdsDocumento.Eof do
      begin
        For iIndex := 0 to CdsDocumento.Fields.Count - 1 do
        begin
          sDoc := StringReplace(CdsDocumento.Fields[iIndex].AsString, '.', '', [rfReplaceAll]);
          sDoc := StringReplace(sDoc, '-', '', [rfReplaceAll]);
          sDoc := StringReplace(sDoc, '/', '', [rfReplaceAll]);
          sDoc := StringReplace(sDoc, '\', '', [rfReplaceAll]);
          if (Trim(sDoc) = '') and (Trim(strDocumentosExtra[I]) <> '') then
          begin
           //William Moreira da Silva - SIG 29916 - Inicio
			//CdsDocumento.Delete;   // Andre Imakawa - SIG 58609
            //MessageBox(Handle, 'Campo com valor alterado não pode ficar em branco.', 'Verifique', MB_OK + MB_ICONWARNING);
            //tbcDetalhe.TabIndex      := 0;
            //pgctrlDetalhe.ActivePage := tbsDocumento;
            //Exit;
			//William Moreira da Silva - SIG 29916 - Fim
          end;
          Inc(I);
        end;
        CdsDocumento.Next;
      end;

    end;
    // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Inicio

    //Agência da conta salário
    if mskedNumAgenciaSalario.text <> sValorInicialAgencia  then
    sValorAgencia := mskedNumAgenciaSalario.text;
    sValorInicialAgencia := '';


    if (Cds.State = dsInsert) and (CdsSubTipo.FieldByName('IDMOTIVODESLIGRAIS').IsNull) then
    begin
      tbcDetalhe.TabIndex := 7;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
      pgctrlDetalhe.ActivePageIndex := 7;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
      MsgDlg('Você deve selecionar o Motivo Oficial da Admissão.', 'Aviso',
        mtWarning, [mbOk,mbHelp], iHelp); // Alterado por Felipe A. Santos SOL 229871.16137 PPM 407073


      dblckMotivo1.SetFocus;
      exit;
    end;
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    if (Cds.State in [dsInsert,dsEdit]) and (CdsSubTipo.FieldByName('DATAFUNCAO').IsNull)
    and (not CdsSubTipo.FieldByName('IDFUNCAO').isNull) then
    begin
        if dbedDataFuncao.Text = '' then begin
           MsgDlg('Data de Efetivação é obrigatório.', 'Aviso',mtWarning, [mbOk,mbHelp], iHelp);  // Alterado Felipe A. Santos SOL 229871.16137 PPM 407073
           dbedDataFuncao.SetFocus;
           Exit;
       end;
    end;

   //Início - William Santana - SOL 211502.16259 PPM 442499
   //O campo HOMOLOGACAONUMERO da tabela funcionario está com tipo VARCHAR2
    CdsSubTipo.FieldByName('HOMOLOGACAONUMERO').AsString := tmpDtHomologacao.Text;
   //Término - William Santana - SOL 211502.16259 PPM 442499

   // William Santana SOL - 201365 KIN- 1965590
   // Grava ou remove tipo de beneficio de acordo com os itens marcados no checkbox caso esteja editando
   if cds.State = dsEdit then Tipobeneficio(CdsSubTipo.FieldByName('Idpessoa').AsFloat);
   //END - William Santana SOL - 201365 KIN- 1965590

 //Higor Nayde Ferreira Sol 188194 - Kintana 1779198

    //(2->Branca; 4->Preta; 6->Amarela; 8->Parda; 0->Indígena)
    case (cmbRaca.ItemIndex) of
      0 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 2;
      1 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 4;
      2 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 6;
      4 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 0;
      else CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 8;
    end;

    // Conta Salário e Conta FGTS
    CdsSubTipo.FieldByName('NUMCONTASALARIO').asString := sNumContaSalario;
    CdsSubTipo.FieldByName('IDAGENCIASALARIO').asString := sIDAgenciaSalario;
    CdsSubTipo.FieldByName('NUMCONTAFGTS').asString := sNumContaFGTS;
    CdsSubTipo.FieldByName('IDAGENCIAFGTS').asString := sIDAgenciaFGTS;

    CdsPessoaFisica.FieldByName('IDESTADO').Clear;
    if (CdsSubTipo.FieldByName('IDEMPRESA').IsNull) then
      CdsSubTipo.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;

    bInserindo := (Cds.State = dsInsert);
    SelHstAltCad(false);
    SelHstDados;

   // TCtrlPessoaFuncionario(Pessoa).GravaAltEvolFunc(Sistema.IdEmpresa);

    if not(bInserindo) and (TCtrlPessoaFuncionario(Pessoa).MudouSituacao) and
       (CdsSitFunc.FieldByName('TipoSit').asString = 'F') and
       (Copy(CdsParamRH.FieldByName('MATRDIS').asString,7,1) < '6') then
      TfrmRegistraOcorr.RegistrarOcorrenciaMedica(Cds.FieldByName('IDPESSOA').asFloat,
        Cds.FieldByName('NOME').asString, dbedDatSaida.Date, dbedRetorno.Date);

    //Início - William Santana - SOL 211661/15807 - KIN 2060908
    if (cdsPessoaFisica.FieldByName('ESTCIVIL').AsString = EmptyStr) then
    begin
     MsgDlg('O estado civil deve ser selecionado.', 'Erro', mtError, [mbOk], 0);
     tbcDetalhe.TabIndex := 5;
     pgctrlDetalhe.ActivePageIndex := 5;
     dblckEstCivil.SetFocus;
     exit;
    end;
    //Término -  William Santana - SOL 211661/15807 - KIN 2060908    

    TCtrlPessoaFuncionario(Pessoa).PassouGravacao := false;
    {Início - Michelle Mota - SIG27550}
    if (CdsHistAlterBenef.RecordCount < 4) and (Alterado) then
      begin
        if CtrlHistAlterBenef.GetProxId > CdsHistAlterBenef.FieldByName('IDHSTALTRATEIOAUXALIMENT').AsInteger then
          id := CtrlHistAlterBenef.GetProxId
        else
          id := CdsHistAlterBenef.FieldByName('IDHSTALTRATEIOAUXALIMENT').AsInteger + 1;

        CdsHistAlterBenef.Insert;
        CdsHistAlterBenef.FieldByName('IDHSTALTRATEIOAUXALIMENT').AsInteger := id;
        CdsHistAlterBenef.FieldByName('IDPESSOA').AsInteger := CdsSubTipo.FieldByName('IDPESSOA').AsInteger;
        CdsHistAlterBenef.FieldByName('ANO').AsString := AnoAtual;
        CdsHistAlterBenef.FieldByName('PERC_ALIMENTACAO').AsFloat := VlrAntAliment;
        CdsHistAlterBenef.FieldByName('PERC_REFEICAO').AsFloat := VlrAntRefeic;
        CdsHistAlterBenef.Post;

        Alterado := False;

        CtrlHistAlterBenef.Gravar;
      end;
    {Término - Michelle Mota - SIG27550}
    
    inherited;

    if (TCtrlPessoaFuncionario(Pessoa).PassouGravacao) then
    begin
        if not(TCtrlPessoaFuncionario(Pessoa).GravarHistorico(
             chkGravaHstAltCad.Checked, bInserindo, Sistema.IdEmpresa)) then
        MsgDlg(TCtrlPessoaFuncionario(Pessoa).MessageInfo, 'Erro', mtError, [mbOk,mbHelp], iHelp); // Alterado por Felipe A. Santos SOL 229871.16137 PPM 407073

      TCtrlPessoaFuncionario(Pessoa).MudouSituacao := false;
    end;

   // William Santana SOL - 201365 KIN- 1965590
   // Grava ou remove tipo de beneficio de acordo com os itens marcados no checkbox caso esteja inserindo
   if cds.State = dsinsert then
     Tipobeneficio(TCtrlPessoaFuncionario(Pessoa).IdPessoa);   

    GBoxTipoBeneficios.Enabled := False;

    if (cds.State = dsinsert) then
    begin
       for i:=0 to ChkLBoxTipoBen.items.count -1 do
       ChkLBoxTipoBen.Checked[i] := true;
       GBoxTipoBeneficios.Enabled := True;
    end;

    //END - William Santana SOL - 201365 KIN- 1965590

    // Chama a rotina de integraçao dos sistemas previdenciários com os sistemas
    // de RH e Folha de Pagamento de uma Fundação
    if (Sistema.TipoEmpresa = 'P') then
    begin
      frmAguarde.Mostra('Atualizando o Cadastro do Funcionário no Previdenciário');
      frmAguarde.Pos := 0;

      if not(CtrlIntegraPrevRH.AtualizaDadosPrevFuncionario(
             Sistema.IdEmpresa, TCtrlPessoaFuncionario(Pessoa).IdPessoa)) then
        MsgDlg(CtrlIntegraPrevRH.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], iHelp); // ALterado por Felipe A. Santos SOL 229871.16137 PPM 407073

      frmAguarde.Apaga;
    end;

  SelSubTipo(CdsPessoaFisica.FieldByName('IDPESSOA').AsFloat); // Michelle Mota - SOL: 250384.17324 - PPM: 1070235

  HabDesabBenef(False);

end;

procedure TfrmCadFunc.bbtnCancelarClick(Sender: TObject);
var
 i : Integer; //William Santana - SOL: 201365 - KINTANA: 1965590
begin
  inherited;
  //Mose - SOL : 185455 KTN 1739618 Inicio
  GuardaCCusto := '';
  With CdsCCusto do
     begin

       Filter := ' ATIVO = ''Sim'' AND  STATUSGRUPOCDC = ''A'' ';
       Filtered := False;

     end;
  //Mose - SOL : 185455 KTN 1739618 Fim
  if (Assigned(Self.ActiveControl)) and
     (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') and
     (Cds.FieldByName('IDPESSOA').asFloat > 0) then
    CmeCadastroFind(Sender);

  TCtrlPessoaFuncionario(Pessoa).MudouSituacao := false;

  // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Inicio
  if not Cds.IsEmpty then
    SelPessoa(Cds.FieldByName('IDPESSOA').AsFloat)
  else
    SelPessoa(-271504);
  // SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Fim

  //William Santana - SOL: 201365 - KINTANA: 1965590     
  for i := 0 to ChkLBoxTipoBen.Items.Count - 1 do
   ChkLBoxTipoBen.Checked[i]  := False;
   GBoxTipoBeneficios.Enabled := False;
  //END- William Santana - SOL: 201365 - KINTANA: 1965590

  CdsHistAlterBenef.Cancel; //Michelle Mota - SIG27550
  
  TravaContratoTemp; // Felipe A. Santos SOL 207737 KTN 2018095

  HabDesabBenef(false);// Michelle Mota - SIG27550}
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------


procedure TfrmCadFunc.SelFuncionario(IdPessoa: double);
begin
  SelPessoa(IdPessoa);
end;

procedure TfrmCadFunc.SelSubTipo(IdPessoa: double);
 var i:integer;  //William Santana - SOL: 201365 - KINTANA: 1965590
     wAno,wMes,wDia: word;//michelle mota - sig27550
begin
  inherited;
  CdsSubTipo.Data     := TCtrlPessoaFuncionario(Pessoa).ListFuncionario(FloatToStr(IdPessoa));
  CdsUltEmpr.Data     := CtrlUltimosEmpregos.ListUltimosEmpregos(IdPessoa);
  {Início - Michelle Mota - SIG27550}
  DecodeDate(now, wAno, wMes, wDia);  
  CdsUltEmprGrid.Data := CtrlUltimosEmpregos.ListUltimosEmpregosGrid(IdPessoa);
  CdsAnoAlteraHist.Data := CtrlHistAlterBenef.ListAnosHistAltera(FloatToStr(idPessoa));
  CdsHistAlterBenef.Data := CtrlHistAlterBenef.ListHistAlteraBenef(FloatToStr(IdPessoa), FloatToStr(wAno));
  CdsGridHistAlterBenef.Data := CtrlHistAlterBenef.ListGridHistAlteraBenef(FloatToStr(IdPessoa), FloatToStr(wAno));
  if (CdsHistAlterBenef.RecordCount >= 4) then
    begin
      dbePercRatAliment.ReadOnly := True;
      dbePercRatRefei.ReadOnly := True;
    end
  else
    begin
      dbePercRatAliment.ReadOnly := False;
      dbePercRatRefei.ReadOnly := False;
    end;
  CdsAnoAlteraHist.First;
  cbbAnoHistAlter.Items.Clear;
  while not CdsAnoAlteraHist.eof do
    begin
      cbbAnoHistAlter.Items.Add(CdsAnoAlteraHist.FieldByName('ANO').AsString);
      CdsAnoAlteraHist.Next;
    end;
  cbbAnoHistAlter.Text := IntToStr(wAno);
  AnoAtual := IntToStr(wAno);

  if (dbePercRatRefei.Text <> '') then
    begin
      VlrAntRefeic := StrToFloat(dbePercRatRefei.Text);
      VlrAntAliment := StrToFloat(dbePercRatAliment.Text);
    end;
  {Término - Michelle Mota - SIG27550}
  CdsSubTipo.Data     := TCtrlPessoaFuncionario(Pessoa).ListFuncionario(FloatToStr(IdPessoa)); // Higor Nayde Ferreira SOL 194603 KTN 1857408
  CdsDependentes.Data := CtrlPessoaDependente.SelDependentesPessoa(IdPessoa);
  CdsPlanos.Data      := CtrlPessoaDependente.SelQtePlanos(IdPessoa);
  CdsEstrangeiro.Data := CtrlPessoaEstrangeiro.SelEstrangeiro(IdPessoa);
  CdsProcessos.Data := TCtrlPessoaFuncionario(Pessoa).ListFuncProcessos(FloatToStr(IdPessoa)); // Michelle Mota - SOL: 250384.17324 - PPM: 1070235

  // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
  CdsEstagiario.Data  := TCtrlPessoaFuncionario(Pessoa).ListEstagiario(IdPessoa);
  CdsDadosCessao.Data  := TCtrlPessoaFuncionario(Pessoa).ListDadosCessao(IdPessoa);

  cmbGrupoCateg.ItemIndex := cmbGrupoCateg.Items.IndexOf(TCtrlPessoaFuncionario(Pessoa).GetGrupoCategTrabaEsocial(IdPessoa));
  cmbGrupoCategChange(Self);

  if CdsEstagiario.FieldByName('NATUREZAESTAGIO').AsString = 'O' then
     rbObrigatorio.Checked := True
  else
     rbNObrigatorio.Checked := True; //Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  // Felipe A. Santos SOL 229871.16137 PPM 407073 - fim

  // Felipe A. Santos - SOL 207737 KTN 2018095
  if TCtrlPessoaFuncionario(Pessoa).UsaContratoTemp then
  begin
    CdsContratoTemp.Data := TCtrlPessoaFuncionario(Pessoa).ListContratoTemp(IdPessoa);
    CdsContratoTempSubst.Data := TCtrlPessoaFuncionario(Pessoa).ListContratoTempSubst(cdsContratoTemp.FieldByName('IDCONTRATOTEMP').AsFloat);
    CdsContratoTempObs.Data := TCtrlPessoaFuncionario(Pessoa).ListContratoTempObs(cdsContratoTemp.FieldByName('IDCONTRATOTEMP').AsFloat);
  end;
  // Felipe A. Santos - SOL 207737 KTN 2018095

  dbrgNaturChange(nil);

  // Pego a Agência e Banco para a Conta Salário
  if not(CdsSubTipo.FieldByName('IDAGENCIASALARIO').IsNull) then
  begin
    dmCds.Cds.Data := CtrlListTerceirosRH.ListIdAgencia_e_NumBanco(
      CdsSubTipo.FieldByName('IDAGENCIASALARIO').asFloat);

    sIDAgenciaSalario := CdsSubTipo.FieldByName('IDAGENCIASALARIO').asString;
    mskedNumAgenciaSalario.Text := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
    dblckBancoSalario.LookUpValue := dmCds.Cds.FieldByName('IDBANCO').asString;
  end
  else
  begin
    mskedNumContaSalario.Text := '';
    sNumContaSalario := '';
    sIDAgenciaSalario := '';
    mskedNumAgenciaSalario.Text := '';
    dblckBancoSalario.LookUpValue := '-1';
  end;

  // Pego a Agência e Banco para a Conta para o FGTS
  if not(CdsSubTipo.FieldByName('IDAGENCIAFGTS').IsNull) then
  begin
    dmCds.Cds.Data := CtrlListTerceirosRH.ListIdAgencia_e_NumBanco(
      CdsSubTipo.FieldByName('IDAGENCIAFGTS').asFloat);

    sIDAgenciaFGTS := CdsSubTipo.FieldByName('IDAGENCIAFGTS').asString;
    mskedNumAgenciaFGTS.Text := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
    dblckBancoFGTS.LookUpValue := dmCds.Cds.FieldByName('IDBANCO').asString;
  end
  else
  begin
    mskedNumContaFGTS.Text := '';
    sNumContaFGTS := '';
    sIDAgenciaFGTS := '';
    mskedNumAgenciaFGTS.Text := '';
    dblckBancoFGTS.LookUpValue := '-1';
  end;

  //Início - William Santana - SOL 211502.16259 PPM 442499
  CdsImagemOutro.Data := TCtrlPessoaFuncionario(Pessoa).ListImagem(IdPessoa);
  tmpDtHomologacao.Text := CdsSubTipo.FieldByName('HOMOLOGACAONUMERO').AsString;
  //Término - William Santana - SOL 211502.16259 PPM 442499

  mskedNumContaSalario.Text := CdsSubTipo.FieldByName('NUMCONTASALARIO').asString;
  sNumContaSalario := mskedNumContaSalario.Text;
  mskedNumContaFGTS.Text := CdsSubTipo.FieldByName('NUMCONTAFGTS').asString;
  sNumContaFGTS := mskedNumContaFGTS.Text;

  //Início - William Santana - SOL 211661/15807 - KIN 2060908
  dblckEstCivil.text := TCtrlPessoaFuncionario(Pessoa).MostraEstCivil(CdsPessoaFisica.FieldByName('ESTCIVIL').AsString);
  //Término - William Santana - SOL 211661/15807 - KIN 2060908

  dblckBancoFGTS.Update;
  dblckBancoSalario.Update;

  // Felipe A. Santos - SOL 207737 KTN 2018095
  if TCtrlPessoaFuncionario(Pessoa).UsaContratoTemp then
  begin
    if not(cdsContratoTemp.IsEmpty) then
    begin
      dblckCargoCTemp.Update;

      if cdsContratoTemp.FieldByName('SITUACAO').AsString = 'A' then
         rbAtivo.Checked := True
      else if cdsContratoTemp.FieldByName('SITUACAO').AsString = 'E' then
         rbEfetivado.Checked := True
      else
         rbDesligado.Checked := True;
    end;
  end;
  // Felipe A. Santos - SOL 207737 KTN 2018095
  
end;

procedure TfrmCadFunc.SelHstDados;
begin
  // Obtém os Dados necessários à alteração da Evolução Funcional
  TCtrlPessoaFuncionario(Pessoa).SelDadosEvolFunc;
  // Obtém os Dados necessários à alteração da Situação Funcional
  TCtrlPessoaFuncionario(Pessoa).SelDadosSitFunc(CdsSitFunc.FieldByName('TIPOSIT').asString);
end;


Function SomenteNumeros(Const pTexto : String) : String;
var i : Integer;
begin
  Result := '';
  For i := 1 to length(pTexto) do
  begin
    If pTexto[i] in ['0'..'9'] then
      Result := Result + pTexto[i]
  end;
end;


//Parâmetros para SLQ DO HISTÓRICO
procedure TfrmCadFunc.SelHstAltCad(PrimeiraVez: boolean);

   function LocalizaInfo(Const oCds : TCMClientDataSet;
                         Const sFiltro : String;
                         Const sCampo  : String ) : String;
   begin
     Result := '';
     With oCds do
     begin
       //SOL 73915 - Matrícula Caixa.
       Filter := sFiltro;
       Filtered := True;
       Result := FieldByName(sCampo).asString;
       Filtered := False;
       Filter := '';
       //Fim - filtro.
     end;
   end;



var
  sMatriculaCaixa : String;
  sContaPref      : String;
  sMatricula      : String;
  sNome           : String;
  dDataNasc       : tDateTime;
  dDataAdm        : tDateTime;
  sHora           : String;
  sNomeChefe      : String;
  sGrauInstr      : String;
  sEstCivil       : String;
  sSindicato      : String;
  sProfissao      : String;
  sTelefone       : String;
  iNumDepIR       : Integer;
  iNumDepSF       : Integer;
  iNumFone        : Integer;
  sTipoContrato   : String;
  sIdSitRisco     : String;
  sCategoria      : String;
  sDDDFone        : String;
  sDDIFone        : String;
  sBanco          : String;
  iTipoConta      : Integer;
begin
  With CdsDocumento do
  begin
    //SOL 73915 - Matrícula Caixa.
    Filter := 'IDDocumento = 3';
    Filtered := True;
    sMatriculaCaixa := fieldByName('NUMDOCUMENTO').asString;
    Filtered := False;
    Filter := '';
    //Fim - filtro.
  end;

  if chbContaPref_Padrao.Checked then
    sContaPref := '1'
  else
    sContaPref := '0';

  //Henrique Massão SOL 73915 KTN 524411
  // Obtém o Número dos documentos que podem ser alterados
  TCtrlPessoaFuncionario(Pessoa).SelHstDocumentos(PrimeiraVez);
  // Obtém campos iniciais que podem ser alterados

  sMatricula    := CdsSubTipo.FieldByName('MATRICULA').asString;
  sNome         := Cds.FieldByName('NOME').asString;
  dDataNasc     := CdsPessoaFisica.FieldByName('DATANASC').asDateTime;
  dDataAdm      := CdsSubTipo.FieldByName('DATAADMISSAO').asDateTime;
  sHora         := CdsHorario.FieldByName('NOMEHORARIO').asString;
  sNomeChefe    := CdsChefe.FieldByName('NOME').asString;
  sGrauInstr    := CdsGrauInstr.FieldByName('DESCRICAO').asString;
  sEstCivil     := CdsPessoaFisica.FieldByName('ESTCIVIL').asString;
  sSindicato    := CdsSindicato.FieldByName('RAZAOSOCIAL').asString;
  sProfissao    := CdsProfissao.FieldByName('DESCRICAO').asString;
  iNumDepIR     := CdsPessoaFisica.FieldByName('NUMDEPIRRF').asInteger;
  iNumDepSF     := CdsPessoaFisica.FieldByName('NUMDEPSALF').asInteger;
  sTelefone     := SomenteNumeros(CdsTelefone.FieldByName('Numero').asString);
  iNumFone      := StrToIntDef(sTelefone,0);
  sTipoContrato := CdsSubTipo.FieldByName('TIPOCONTRATO').asString;
  sIdSitRisco   := CdsSubTipo.FieldByName('IDSITRISCO').asString;
  sCategoria    := CdsCatEmpr.FieldByName('IDCATEMPRGRE').asString;
  sDDDFone      := CdsTelefone.FieldByName('DDD').asString;
  sDDIFone      := CdsTelefone.FieldByName('DDI').asString;
  sBanco        := CdsBanco.FieldByName('IDPESSOA').asString;
  If CdsContaBancaria.FieldByName('TipoConta').asString = '' then
   iTipoConta   := 0
  Else
   iTipoConta   := CdsContaBancaria.FieldByName('TIPOCONTA').asInteger;

  TCtrlPessoaFuncionario(Pessoa).SelHstAltCad(PrimeiraVez,
                                              sMatricula,
                                              sNome,
                                              dDataNasc,
                                              dDataAdm,
                                              sHora,
                                              sNomeChefe,
                                              sGrauInstr,
                                              sEstCivil,
                                              sSindicato,
                                              sProfissao,
                                              iNumDepIR,
                                              iNumDepSF,
                                              iNumFone,
                                              sTipoContrato,
                                              sIdSitRisco,
                                              sCategoria,
                                              sDDDFone,
                                              sDDIFone,
                                              sBanco,
                                              iTipoConta,
                                              sAgencia,
                                              sConta,
                                              sContaPref,
                                              sMatriculaCaixa,
                                              sValorBanco,
                                              sValorAgencia,
                                              sValorConta);

end;

procedure TfrmCadFunc.cmbStepsChange(Sender: TObject);
begin
  inherited;
  dbspeStep1.Value := cmbSteps.ItemIndex + 1;
end;

procedure TfrmCadFunc.dblckBancoSalarioExit(Sender: TObject);
begin
  inherited;

  if dblckBancoSalario.text <> sValorInicialBanco  then
    sValorBanco := dblckBancoSalario.text;
end;
procedure TfrmCadFunc.dblckBancoSalarioEnter(Sender: TObject);
begin
  inherited;
  if sValorINicialBanco = '' then
    sValorInicialBanco := dblckBancoSalario.text ;

end;

procedure TfrmCadFunc.mskedNumContaSalarioEnter(Sender: TObject);
begin
  inherited;
  if sValorINicialConta = '' then
    sValorInicialConta := mskedNumContaSalario.text ;
end;

procedure TfrmCadFunc.dbedContaEnter(Sender: TObject);
begin
  inherited;
  if sInicialConta = '' then
    sInicialConta := dbedConta.text ;
end;

procedure TfrmCadFunc.dbedContaExit(Sender: TObject);
begin
  inherited;

 if dbedConta.text <> sInicialConta  then
    sConta := dbedConta.text;
    sInicialConta:= '';
end;

procedure TfrmCadFunc.CmeCadastroEdit(Sender: TObject);
var x: Integer;
begin
  inherited;
    bTtravarCadastro:= False;
    if Pessoa.TravaAlteracao(Cds.FieldByName('IDPESSOA').AsInteger) then
    begin
      bTtravarCadastro:= True;
      //dbrgEstCivil.Enabled:= False;   //William Santana - SOL 211661/15807 - KIN 2060908
      dblckEstCivil.Enabled:= False;    //William Santana - SOL 211661/15807 - KIN 2060908
      gbxDepend.Enabled:= False;
      dblckNacional.Enabled:= False;
      //gbxNaturalidade.Enabled:= False; //Michelle Mota - SOL: 250384.17324 - PPM:1070235
      gbxFiliacao.Enabled:= False;
      dbrgSexo.Enabled:= False;
      dbedDatNasc.Enabled:= False;
      dbrgIsento.Enabled:= False;
      cmbRaca.Enabled:= False;
      dbrgDeficienteFis.Enabled:= False;
      gbxFiliacao.Enabled:= False;
      dblckGrauInstr.Enabled:= False;
      dblckProfissao.Enabled:= False;
      dblckSindi.Enabled:= False;
      dbspedDataCheg.Enabled:= False;
      dbrgNatur.Enabled:= False;
      GroupBox2.Enabled:= False;
      dbedDecrNatur.Enabled:= False;
      wwDBEdit4.Enabled:= False;
      wwDBEdit5.Enabled:= False;
      //DBRadioGroup2.Enabled:= False; //Michelle Mota - SOL: 250384.17324 - PPM:1070235
      //DBRadioGroup3.Enabled:= False; //Michelle Mota - SOL: 250384.17324 - PPM:1070235
      //dbcmbTipoSang.Enabled:= False;
      dbedMatric.Enabled:= False;
      dbedDatAdmis.Enabled:= False;
      dblckSitFunc.Enabled:= False;
      dblckMotivo1.Enabled:= False;
      dblckMotivo2.Enabled:= False;
      dblckHorario.Enabled:= False;
      chkMarcaPonto.Enabled:= False;
      dbedDatRefHor.Enabled:= False;
      dblckFonte.Enabled:= False;
      edtNUMEROCRACHA.Enabled:= False;
      gbxDeslig.Enabled:= False;
      //bxCargo.Enabled:= False; FORA 		//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
      //dbedDatCargo.Enabled:= False;		//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
      dbrgTipContra.Enabled:= False;
      gbxContrato.Enabled:= False;
      gbxSalar.Enabled:= False;
      dbrgTipoSalar.Enabled:= False;
      gbxLotacao.Enabled:= False;
      dblckVincEmpr.Enabled:= False;
      dblckMovContrCAGED.Enabled:= False;
      dblckTipoTrab.Enabled:= False;
      gbxFGTS.Enabled:= False;
      gbxContaSal.Enabled:= False;
      gbxCargo1.Enabled:= False;
      gbxCargo2.Enabled:= False;
     // gbxFaixa1.Enabled:= False; 			//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
     // gbxFaixa2.Enabled:= False; fora		//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
      dbedContas.Enabled:= False;
      dbedValFG.Enabled:= False;

      lUltempr:= '';
      CdsUltEmpr.First;
      while not CdsUltEmpr.Eof do
      begin
        lUltempr:= lUltempr + ' ' + CdsUltEmpr.FieldByName('NUMSEQ').AsString;
        CdsUltEmpr.Next;
      end;
//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
    // PintarCampos([dbrgEstCivil, gbxDepend, dblckNacional,                    //William Santana - SOL 211661/15807 - KIN 2060908
       PintarCampos([{dbrgEstCivil,} gbxDepend, dblckNacional, dblckEstCivil,   //William Santana - SOL 211661/15807 - KIN 2060908
                    //gbxNaturalidade, //Michelle Mota - SOL: 250384.17324 - PPM:1070235
                    gbxFiliacao, dbrgSexo,
                    dbedDatNasc, dbrgIsento, cmbRaca,
                    dbrgDeficienteFis, gbxFiliacao, dblckGrauInstr, dblckProfissao,
                    dblckSindi, dbspedDataCheg, dbrgNatur, GroupBox2,
                    dbedDecrNatur, wwDBEdit4, wwDBEdit5,
                    //DBRadioGroup2,DBRadioGroup3, //Michelle Mota - SOL: 250384.17324 - PPM:1070235
                    //dbcmbTipoSang,
                    dbedMatric, dbedDatAdmis,
                    dblckSitFunc, dblckMotivo1, dblckMotivo2, dblckHorario, chkMarcaPonto,
                    dbedDatRefHor, dblckFonte, edtNUMEROCRACHA, gbxDeslig,
                    {FORAgbxCargo, dbedDatCargo,} dbrgTipContra, gbxContrato,
                    gbxSalar, dbrgTipoSalar, gbxLotacao,
                    dblckVincEmpr, dblckMovContrCAGED, dblckTipoTrab,
                    gbxFGTS, gbxContaSal, gbxCargo1, gbxCargo2,
                    {gbxFaixa1, gbxFaixa2,} dbedContas, dbedValFG], clGray);

    end
    else
    begin
      // Felipe A. Santos SOL 207737 KTN 2018095  - inicio
      if cdsContratoTemp.IsEmpty then
        cdsContratoTemp.Insert
      else
        cdsContratoTemp.Edit;

      HabilitaContratoTemp;
      // Felipe A. Santos SOL 207737 KTN 2018095- fim
   end;

end;

procedure TfrmCadFunc.sbtnAltDetClick(Sender: TObject);
begin
  if bTtravarCadastro then
  begin
    if pos(CdsUltEmpr.FieldByName('NUMSEQ').Asstring, lUltempr) > 0 then
    begin
      dbedNumSeq.Enabled:= False;
      dblckUltCargo.Enabled:= False;
      dbedUltEmpresa.Enabled:= False;
      dbedUltCargo.Enabled:= False;
      dbedUltAdm.Enabled:= False;
      dbedUltDem.Enabled:= False;
      dbedUltSal.Enabled:= False;
      dblckUltMotivo.Enabled:= False;
      PintarCampos([dbedNumSeq, dblckUltCargo, dbedUltEmpresa, dbedUltCargo,
                    dbedUltAdm, dbedUltDem, dbedUltSal, dblckUltMotivo], clGray);
    end
    else
    begin
      dbedNumSeq.Enabled:= True;
      dblckUltCargo.Enabled:= True;
      dbedUltEmpresa.Enabled:= True;
      dbedUltCargo.Enabled:= True;
      dbedUltAdm.Enabled:= True;
      dbedUltDem.Enabled:= True;
      dbedUltSal.Enabled:= True;
      dblckUltMotivo.Enabled:= True;
      PintarCampos([dbedNumSeq, dblckUltCargo, dbedUltEmpresa, dbedUltCargo,
                    dbedUltAdm, dbedUltDem, dbedUltSal, dblckUltMotivo], clWindow);
    end;
  end;
  inherited;
  // Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  if (pgctrlDetalhe.ActivePage = tbsProcessos) then
  begin
    edtNumeroProc.Text := CdsProcessos.FieldByName('NUMERO').AsString;

    edtUFSecaoJud.Text := CdsCidadeMunicipio.FieldByName('CODESTADO').AsString;
    edtCodMunicipio.Text := CdsCidadeMunicipio.FieldByName('CODMUNICIPIO').AsString;

    case CdsProcessos.FieldByName('CONTRIABRANDECISAO').AsInteger of
        1: cbbCONTRIABRANDECISAO.ItemIndex := 0;
        2: cbbCONTRIABRANDECISAO.ItemIndex := 1;
    end;
    cbbCONTRIABRANDECISAO.Text := CdsProcessos.FieldByName('contriabrandec').AsString;

    if CdsProcessos.FieldByName('TIPO').AsString = 'A' then begin
      cbbTipoProc.ItemIndex := 0;
      CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('A');
      end;

    if CdsProcessos.FieldByName('TIPO').AsString = 'J' then begin
      cbbTipoProc.ItemIndex := 1;
      CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('J');
      end;
    //Everson Cunha - SIG38475 - Ini
    {if CdsProcessos.FieldByName('TIPO').AsString = 'N' then
    begin
      cbbTipoProc.ItemIndex := 2;
      CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('N');
    end;}
    //Everson Cunha - SIG38475 - Fim

    //Everson Cunha - SIG70569 - Início
    if CdsProcessos.FieldByName('TIPO').AsString = 'F' then
    begin
      //cbbTipoProc.ItemIndex := 3; //Everson Cunha - SIG38475
      cbbTipoProc.ItemIndex := 2;   //Everson Cunha - SIG38475
      CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('F');
    end;
    //Everson Cunha - SIG70569 - Fim

    cbbTipoProc.Text := CdsProcessos.FieldByName('TIPODEPROC').AsString;

    //Everson Luiz SIG70569 - Início
    {case CdsProcessos.FieldByName('INDICATDECISAO').AsInteger of
        1: cbbIndicaDecisao.ItemIndex := 0;
        2: cbbIndicaDecisao.ItemIndex := 1;
        3: cbbIndicaDecisao.ItemIndex := 2;
        4: cbbIndicaDecisao.ItemIndex := 3;
        5: cbbIndicaDecisao.ItemIndex := 4;
        9: cbbIndicaDecisao.ItemIndex := 5;
    end;
    cbbIndicaDecisao.Text := CdsProcessos.FieldByName('indicativodecisao').AsString;

    if CdsProcessos.FieldByName('APURFAP').AsInteger = 1 then cbbApurFap.ItemIndex := 0;
    if CdsProcessos.FieldByName('APURFAP').AsInteger = 2 then cbbApurFap.ItemIndex := 1;
    cbbApurFap.Text := CdsProcessos.FieldByName('apuracaofap').AsString;}
    //Everson Luiz SIG70569 - Fim

    //Everson Cunha - SIG90602 - Início
    case CdsProcessos.FieldByName('CODMATPROC').AsInteger of
      1: cmbMatProc.ItemIndex := 0;
      //Everson Cunha - SIG38475 - Ini
      {2: cmbMatProc.ItemIndex := 1;
      3: cmbMatProc.ItemIndex := 2;
      4: cmbMatProc.ItemIndex := 3;
      5: cmbMatProc.ItemIndex := 4;
      6: cmbMatProc.ItemIndex := 5;
      7: cmbMatProc.ItemIndex := 6;
      8: cmbMatProc.ItemIndex := 7;
      99: cmbMatProc.ItemIndex := 8;}
      7: cmbMatProc.ItemIndex := 1;
      //Everson Cunha - SIG38475 - Fim
    end;
    //Everson Cunha - SIG90602 - Fim

    cmbMatProc.Text := CdsProcessos.FieldByName('CODMATPROCDESC').AsString;

    fIdProcesso := cdsProcessos.FieldByName('IDPROCESSO').asInteger;
    cdsProcessosXIndicativoSusp.Filtered := False;
    cdsProcessosXIndicativoSusp.Filter := 'IDPROCESSO = ' + IntToStr(fIdProcesso);
    cdsProcessosXIndicativoSusp.Filtered := True;
    //Application.ProcessMessages;
  end;
  // Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

  AtivaFlagAtivo;  // Darivaldo Alencar - SIG 20673
end;

procedure TfrmCadFunc.sbtnInsDetClick(Sender: TObject);
begin
  if bTtravarCadastro then
  begin
    dbedNumSeq.Enabled:= True;
    dblckUltCargo.Enabled:= True;
    dbedUltEmpresa.Enabled:= True;
    dbedUltCargo.Enabled:= True;
    dbedUltAdm.Enabled:= True;
    dbedUltDem.Enabled:= True;
    dbedUltSal.Enabled:= True;
    dblckUltMotivo.Enabled:= True;
    PintarCampos([dbedNumSeq, dblckUltCargo, dbedUltEmpresa, dbedUltCargo,
                  dbedUltAdm, dbedUltDem, dbedUltSal, dblckUltMotivo], clWindow);
  end;

  inherited;

   AtivaFlagAtivo;//Darivaldo Alencar SIG 20673

  // Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
  if (pgctrlDetalhe.ActivePage = tbsProcessos) then
  begin
  	pgcProcessos.ActivePageIndex := 0;
   	LimpaCamposProcessos;
   	cdsProcessos.FieldByName('IDPROCESSO').AsInteger :=  TCtrlPessoaFuncionario(Pessoa).GetProxIdProcesso;
   	fIdProcesso := cdsProcessos.FieldByName('IDPROCESSO').AsInteger;

    //Cássio Rovaroto - SIG nº 62232 - Início
    //cdsProcessosXIndicativoSusp.Filtered := False;
    //cdsProcessosXIndicativoSusp.Filter := 'IDPROCESSO ' + IntToStr(fIdProcesso);
    //cdsProcessosXIndicativoSusp.Filtered := True;
    if not cdsProcessosXIndicativoSusp.IsEmpty then
    begin
      cdsProcessosXIndicativoSusp.Filtered := False;
      cdsProcessosXIndicativoSusp.Filter := 'IDPROCESSO = ' + IntToStr(fIdProcesso);
      cdsProcessosXIndicativoSusp.Filtered := True;
    end;
    //Cássio Rovaroto - SIG nº 62232 - Fim

   	cbbTipoProc.SetFocus;
  end;
end;

//Darivaldo Alencar SIG 20673 inicio
procedure TfrmCadFunc.AtivaFlagAtivo;
begin
  If (pgctrlDetalhe.ActivePage= tbsDet) then
    begin
      if (CdsEndereco.State in [dsInsert]) then
        begin
          CdsEnderecoFLGATIVO.asString := 'S';
          dbchkEndAtivo.Checked := True;
        End
      else if (CdsEndereco.State in [dsEdit]) then
        begin
            dbchkEndAtivo.Checked := CdsEnderecoFLGATIVO.AsString = 'S';
        end;
    end
  else
  if (pgctrlDetalhe.ActivePage= tbsTelefone) then
    begin
      if ( CdsTelefone.State in [dsInsert]) then
        begin
          CdsTelefoneFLGATIVO.asString := 'S';
          CdsTelefone.FieldByName('IDPESSOA').AsInteger := Cds.FieldByName('IDPESSOA').AsInteger;    //edilaine SIG99908
          dbchkTelFLGATIVO.Checked := True;
        End
      else if ( CdsTelefone.State in [dsEdit]) then
        begin
          //edilaine SIG99908 - inicio
          if CdsTelefone.FieldByName('IDPESSOA').AsString = '' then
             CdsTelefone.FieldByName('IDPESSOA').AsInteger := Cds.FieldByName('IDPESSOA').AsInteger;
          //edilaine SIG99908 - fim
          dbchkTelFLGATIVO.Checked :=  CdsTelefoneFLGATIVO.AsString = 'S';
        end;
    end
  else
  if (pgctrlDetalhe.ActivePage= tbsContato) then
    begin
      if (CdsContato.State in [dsInsert]) then
        begin
          CdsContato.FieldByName('FLGATIVO').asString := 'S';
          dbchkContFlgAtivo.Checked := True;
        End
      else if (CdsContato.State in [dsEdit]) then
        begin
          dbchkContFlgAtivo.Checked := CdsContato.FieldByName('FLGATIVO').AsString = 'S';
        end;
    end;
end;
//Darivaldo Alencar SIG 20673 -fim

procedure TfrmCadFunc.sbtnExcluiDetClick(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = tbsUltEmpr then
  begin
    if pos(CdsUltEmpr.FieldByName('NUMSEQ').Asstring, lUltempr) > 0 then
    begin
      MessageDlg('A operação só pode ser feita no módulo Folha de Pagamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;

  inherited;

end;

procedure TfrmCadFunc.HabilitarCampos;
begin
  //dbrgEstCivil.Enabled:= True;    //William Santana - SOL 211661/15807 - KIN 2060908
  dblckEstCivil.Enabled:= True;    //William Santana - SOL 211661/15807 - KIN 2060908
  gbxDepend.Enabled:= True;
  dblckNacional.Enabled:= True;
  //gbxNaturalidade.Enabled:= True; //Michelle Mota - SOL: 250384.17324 - PPM:1070235
  gbxFiliacao.Enabled:= True;
  dbrgSexo.Enabled:= True;
  dbedDatNasc.Enabled:= True;
  dbrgIsento.Enabled:= True;
  cmbRaca.Enabled:= True;
  dbrgDeficienteFis.Enabled:= True;
  gbxFiliacao.Enabled:= True;
  dblckGrauInstr.Enabled:= True;
  dblckProfissao.Enabled:= True;
  dblckSindi.Enabled:= True;
  dbspedDataCheg.Enabled:= True;
  dbrgNatur.Enabled:= True;
  GroupBox2.Enabled:= True;
  dbedDecrNatur.Enabled:= True;
  wwDBEdit4.Enabled:= True;
  wwDBEdit5.Enabled:= True;
  //DBRadioGroup2.Enabled:= True; //Michelle Mota - SOL: 250384.17324 - PPM:1070235
  //DBRadioGroup3.Enabled:= True; //Michelle Mota - SOL: 250384.17324 - PPM:1070235
  //dbcmbTipoSang.Enabled:= True; William Moreira da Silva - SOL 186932 KINTANA 1761860
  dbedMatric.Enabled:= True;
  dbedDatAdmis.Enabled:= True;
  dblckSitFunc.Enabled:= True;
  dblckMotivo1.Enabled:= True;
  dblckMotivo2.Enabled:= True;
  dblckHorario.Enabled:= True;
  chkMarcaPonto.Enabled:= True;
  dbedDatRefHor.Enabled:= True;
  dblckFonte.Enabled:= True;
  edtNUMEROCRACHA.Enabled:= True;
  gbxDeslig.Enabled:= True;
//  gbxCargo.Enabled:= True; fora	//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
//  dbedDatCargo.Enabled:= True;	//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  dbrgTipContra.Enabled:= True;
  gbxContrato.Enabled:= True;
  gbxSalar.Enabled:= True;
  dbrgTipoSalar.Enabled:= True;
  gbxLotacao.Enabled:= True;
  dblckVincEmpr.Enabled:= True;
  dblckMovContrCAGED.Enabled:= True;
  dblckTipoTrab.Enabled:= True;
  gbxFGTS.Enabled:= True;
  gbxContaSal.Enabled:= True;
  gbxCargo1.Enabled:= True;
  gbxCargo2.Enabled:= True;
  //gbxFaixa1.Enabled:= True; fora	//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  //gbxFaixa2.Enabled:= True;		//Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  dbedContas.Enabled:= True;
  dbedValFG.Enabled:= True;
  dbedNumSeq.Enabled:= True;
  dblckUltCargo.Enabled:= True;
  dbedUltEmpresa.Enabled:= True;
  dbedUltCargo.Enabled:= True;
  dbedUltAdm.Enabled:= True;
  dbedUltDem.Enabled:= True;
  dbedUltSal.Enabled:= True;
  dblckUltMotivo.Enabled:= True;
  if bTtravarCadastro then //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
 // PintarCampos([dbrgEstCivil, gbxDepend, dblckNacional,                    //William Santana - SOL 211661/15807 - KIN 2060908
    PintarCampos([{dbrgEstCivil,} gbxDepend, dblckNacional, dblckEstCivil,   //William Santana - SOL 211661/15807 - KIN 2060908
                  //gbxNaturalidade, //Michelle Mota - SOL: 250384.17324 - PPM:1070235
                  gbxFiliacao, dbrgSexo,
                  dbedDatNasc, dbrgIsento, cmbRaca,
                  dbrgDeficienteFis, gbxFiliacao, dblckGrauInstr, dblckProfissao,
                  dblckSindi, dbspedDataCheg, dbrgNatur, GroupBox2,
                  dbedDecrNatur, wwDBEdit4, wwDBEdit5,
                  //DBRadioGroup2,DBRadioGroup3, //Michelle Mota - SOL: 250384.17324 - PPM:1070235
                  //dbcmbTipoSang,
                  dbedMatric, dbedDatAdmis,
                  dblckSitFunc, dblckMotivo1, dblckMotivo2, dblckHorario, chkMarcaPonto,
                  dbedDatRefHor, dblckFonte, edtNUMEROCRACHA, gbxDeslig,
                  {FORAgbxCargo, dbedDatCargo,} dbrgTipContra, gbxContrato,
                  gbxSalar, dbrgTipoSalar, gbxLotacao,
                  dblckVincEmpr, dblckMovContrCAGED, dblckTipoTrab,
                  gbxFGTS, gbxContaSal, gbxCargo1, gbxCargo2,
                  {gbxFaixa1, gbxFaixa2,} dbedContas, dbedValFG,
                  dbedNumSeq, dblckUltCargo, dbedUltEmpresa, dbedUltCargo,
                  dbedUltAdm, dbedUltDem, dbedUltSal, dblckUltMotivo], clWindow);
    bTtravarCadastro:= False; //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  HabilitaContratoTemp; // Felipe A. Santos SOL 207737 KTN 2018095
end;

procedure TfrmCadFunc.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  HabilitarCampos;
end;

procedure TfrmCadFunc.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  HabilitarCampos;
  //Início - WIlliam Santana - SOL 211502.16259 PPM 442499
  CdsImagemOutro.Close;
  tmpDtHomologacao.Clear;
  //Término - WIlliam Santana - SOL 211502.16259 PPM 442499
end;

procedure TfrmCadFunc.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  HabilitarCampos;
  TravaContratoTemp; // Felipe A. Santos SOL 207737 KTN 2018095
  cmbGrupoCateg.Text := ''; // Felipe A. Santos SOL 229871.16137 PPM 407073
  cmbGrupoCateg.Enabled := False; // Felipe A. Santos SOL 229871.16137 PPM 407073
  LimpaCamposProcesso; //Cássio Rovaroto - SIG nº 38475.59780
  cdsProcessosXIndicativoSusp.Filtered := False;
end;

procedure TfrmCadFunc.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  HabilitarCampos;
  if cmbGrupoCateg.Enabled then
  begin
 		cmbGrupoCateg.Text := ''; // Felipe A. Santos SOL 229871.16137 PPM 407073
  	cmbGrupoCateg.Enabled := False; // Felipe A. Santos SOL 229871.16137 PPM 407073
  end;
end;

procedure TfrmCadFunc.PintarCampos(lEdit: array of TComponent;
  Color: TColor);
var x: integer;
begin
  //Thaise - Função criada para pintar os campos de maneira dinâmica.

  //1) Declaro lEdit como uma lista de Componentes - pode ser qualquer componente de TObject;
  //2) Coloco a cor desejada para a variável Color, do tipo TColor;
  //3) Faço um laço 'For' para a minha lista inteira de componentes e verifico o tipo de classe que ele pertence, para então pintar.
  for x:= 0 to High(lEdit) do
  begin
    if TObject(lEdit[x]).ClassType = TwwDBEdit then
      TwwDBEdit(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBEdit then
      TDBEdit(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TGroupBox then
      TGroupBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TCheckListBox then
      TCheckListBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TCMProcura then
      TCMProcura(lEdit[x]).Font.Color:= Color;

    if TObject(lEdit[x]).ClassType = TwwDBGrid then
      TwwDBGrid(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBMemo then
      TDBMemo(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TwwDBLookupCombo then
      TwwDBLookupCombo(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TRadioGroup then
      TRadioGroup(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBCheckBox then
      TDBCheckBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TCMDateTimePicker then
      TCMDateTimePicker(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBRealEdit then
      TDBRealEdit(lEdit[x]).Color:= Color;
  end;
end;

// SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Inicio
procedure TfrmCadFunc.Proc_GravaDocMemoria;
var iIndex, I: Integer;
    sDoc: string;
begin
  strDocumentos.Clear;
  strDocumentosExtra.Clear;

  // Pegar os valores do ListView e guardar para verificar se teve alteração.
  For iIndex := 0 to lstDocumentos.Items.Count - 1 do
  begin
    sDoc := StringReplace(lstDocumentos.Items[iIndex].SubItems.Text, '.', '', [rfReplaceAll]);
    sDoc := StringReplace(sDoc, '-', '', [rfReplaceAll]);
    sDoc := StringReplace(sDoc, '/', '', [rfReplaceAll]);
    sDoc := StringReplace(sDoc, '\', '', [rfReplaceAll]);
    strDocumentos.Insert(iIndex, Trim(sDoc));
  end;

  // Alguns campos não foi possivel pegar direto do ListView pegar do ClientDataser Documento.
  CdsDocumento.First;
  I := 0;
  while not CdsDocumento.Eof do
  begin
    For iIndex := 0 to CdsDocumento.Fields.Count - 1 do
    begin
      sDoc := StringReplace(CdsDocumento.Fields[iIndex].AsString, '.', '', [rfReplaceAll]);
      sDoc := StringReplace(sDoc, '-', '', [rfReplaceAll]);
      sDoc := StringReplace(sDoc, '/', '', [rfReplaceAll]);
      sDoc := StringReplace(sDoc, '\', '', [rfReplaceAll]);
      strDocumentosExtra.Insert( I, Trim(sDoc));
      Inc(I);
    end;
    CdsDocumento.Next;
  end;
end;
// SOL: 138283/6221 - KINTANA: 1402575 Otacilio Aquino - Fim

//Vinicius Maciel SOL138283 Kintana 840489
procedure TfrmCadFunc.dbcmbTipoDocumentoChange(Sender: TObject);
var
  sText, sNumDocumentoAntigo, sMask: String;
  iQtdMask: Integer;
begin
  inherited;
  dbcmbTipoDocumento.OnChange := Nil;
  sText := dbcmbTipoDocumento.Text;
  with CdsDocumento do
      if not (State in [dsInactive,dsBrowse]) then
      begin
        FieldByname('NUMDOCUMENTO').EditMask := StringReplace(Pessoa.MaskField(Pessoa.SelMascara(FieldByname('IDDOCUMENTO').asString,CdsTipoDocumento.FieldByName('IDTIPODOCPESSOAXMASC').asString)), '#', 'a', [rfReplaceAll]);
      end;
      if sText <>'' then
      begin

          {if CdsTemp.Locate(('valuedoc'),CdsDocumento.FieldByname('IDDOCUMENTO').asString,[]) then
          begin     }
              {CdsTemp.edit;
              CdsTemp.FieldByName('valueMask').asString := sText; }
                  if (CdsTipodocumento.fieldbyname('idtipodocpessoaxmasc').asstring<>'') and (CdsDocumento.state <> dsBrowse)  then
                  begin
                      if (CdsDocumento.FieldByName('idtipodocpessoaxmasc').asString <> CdsTipodocumento.fieldbyname('idtipodocpessoaxmasc').asstring) then
                      begin
                        sNumDocumentoAntigo := CdsDocumento.FieldByName('NUMDOCUMENTO').asString;
                        CdsDocumento.FieldByname('NUMDOCUMENTO').clear;
                        sMask := CdsDocumento.FieldByName('NUMDOCUMENTO').EditMask;
                        iQtdMask := Length(SoNumero(sMask)) - 1;
                        CdsDocumento.FieldByName('NUMDOCUMENTO').asString := Copy(sNumDocumentoAntigo,1,iQtdMask);
                        edDocNumDocumentoExit(self);
                      end;
                  CdsDocumento.Edit;
                  CdsDocumento.FieldByName('idtipodocpessoaxmasc').asString := CdsTipodocumento.fieldbyname('idtipodocpessoaxmasc').asstring;
                  CdsDocumento.Post;
                  end;
              {CdsTemp.FieldByName('mask').asString := CdsDocumento.FieldByname('NUMDOCUMENTO').EditMask;  }
         { end
          Else
          begin
             { CdsTemp.insert;
              CdsTemp.FieldByName('valueMask').asString := sText;
              CdsTemp.FieldByName('valuedoc').asString := CdsDocumento.FieldByname('IDDOCUMENTO').asString;
              CdsTemp.FieldByName('mask').asString := CdsDocumento.FieldByname('NUMDOCUMENTO').EditMask; }
         { end; }
        {  CdsTemp.Post;     }
      end;
  Pessoa.CarregaTipoDocumento(CdsDocumento.FieldByName('IDDOCUMENTO').asString);  //Carrega novamente os itens do Cds
  dbcmbTipoDocumento.Text := {CdsTemp.FieldByName('valueMask').asString;}sText;      //Carrega novamente a exibição dos itens
  dbcmbTipoDocumento.OnChange := dbcmbTipoDocumentoChange;
end;

function TfrmCadFunc.SoNumero(fField : String): String;
var
  I : Byte;
begin
  Result := '';
  for I := 1 To Length(fField) do
     if ((fField [I] In ['0'..'9']) or (fField [I] = '#')) Then
       Result := Result + fField [I];
end;
//Vinicius Maciel SOL138283 Kintana 840489 - FIM


//Higor Nayde Ferreira Sol 188194 - Kintana 1779198 Inicio
procedure TfrmCadFunc.dbedSalarioChange(Sender: TObject);
begin
  dbspeStep2Change(dbspeStep2);
  if  (dbedFuncao.Value <= 0)then
      dbedVlrSalarioFuncao.Value := dbedSalario.Value
  else
   dbedVlrSalarioFuncao.value := dbedSalario.Value + dbedFuncao.Value;

  //dbedVlrSalarioFuncao.value := dbedSalario.Value + dbedFuncao.Value;
end;

procedure TfrmCadFunc.dbspeStep1Change(Sender: TObject);
var
 qryAux : TwwQuery;
 sSql : string;
begin
  if not(CdsSubTipo.Active) or (Cds.State = dsBrowse) then
    exit;

  //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  if not(CdsSubTipo.IsEmpty) and (Trim(dbspeStep1.Text) <> '') and
    (Trim(dblckCargo1.LookupValue) <> '') then
  begin
    if (CdsSubTipo.FieldByName('NIVELINDIV1').asInteger = 0) then
      CdsSubTipo.FieldByName('NIVELINDIV1').asInteger := 1;

    if StrToIntDef(dbspeStep1.Text, 0) = 0 then
       dbspeStep1.Field.AsInteger := 1;

    qryAux:= TwwQuery.Create(Self);
    try
      qryAux.Databasename := 'BaseDados';

      sSql :=  'SELECT STEP' + dbspeStep1.Text +
               '  FROM CARGO C, FAIXASAL S '+
               ' WHERE C.IDCARGO = ' + dblckCargo1.LookupValue +
               '   AND C.IDFAIXASALARIAL = S.IDFAIXASALARIAL ';
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.Open;

      CdsSubTipo.FieldByName('SALARIOATUAL').AsFloat := qryAux.Fields[0].AsFloat;

      dbspeStep2Change(dbspeStep2);

    finally
      qryAux.Close;
      FreeAndNil(qryAux);
    end;
    //Higor Nayde Ferreira Sol 188194 - Kintana 1779198 - Fim
  end
  else
    CdsSubTipo.FieldByName('SALARIOATUAL').Clear;


end;

procedure TfrmCadFunc.dbspeStep2Change(Sender: TObject);
var
 qryAux : TwwQuery;
 sSql : string;
begin
  if not(CdsSubTipo.Active) or (Cds.State = dsBrowse) then
    exit;

  //Higor Nayde Ferreira Sol 188194 - Kintana 1779198
  if not(CdsSubTipo.IsEmpty) and (Trim(dbspeStep2.Text) <> '') and
    (Trim(dblckCargo2.LookupValue) <> '') then
  begin
    if (CdsSubTipo.FieldByName('NIVELINDIV2').asInteger = 0) then
      CdsSubTipo.FieldByName('NIVELINDIV2').asInteger := 1;

    if StrToIntDef(dbspeStep2.Text, 0) = 0 then
       dbspeStep2.Field.AsInteger := 1;

    qryAux := TwwQuery.Create(Self);
    try
      qryAux.Databasename := 'BaseDados';

      sSql :=  'SELECT STEP' + dbspeStep2.Text +
               '  FROM CARGO C, FAIXASAL S '+
               ' WHERE C.IDCARGO = ' + dblckCargo2.LookupValue +
               '   AND C.IDFAIXASALARIAL = S.IDFAIXASALARIAL ';
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.Open;

      if (qryAux.Fields[0].AsFloat > 0) then
         CdsSubTipo.FieldByName('VLRFUNCAO').AsFloat := qryAux.Fields[0].AsFloat - CdsSubTipo.FieldByName('SALARIOATUAL').AsFloat
      else
         CdsSubTipo.FieldByName('VLRFUNCAO').AsFloat := 0.00;//CdsSubTipo.FieldByName('SALARIOATUAL').AsFloat;

    finally
      qryAux.Close;
      FreeAndNil(qryAux);
    end;
    //Higor Nayde Ferreira Sol 188194 - Kintana 1779198 - Fim
  end
  else
    CdsSubTipo.FieldByName('VLRFUNCAO').Clear;
end;

//WIlliam Santana SOL: 201365 - KINTANA: 1965590     
procedure TfrmCadFunc.Tipobeneficio(didpessoa: Double);
var
  i: Integer;
begin
         
  for i := 0 to ChkLBoxTipoBen.Items.Count - 1 do
  begin
     if (ChkLBoxTipoBen.Checked[i]) then
       TCtrlPessoaFuncionario(Pessoa).GravarTipoBeneficio(dIDPESSOA,
                                            (integer(ChkLBoxTipoBen.Items.Objects[i])))
     else
       TCtrlPessoaFuncionario(Pessoa).RemoverTipoBeneficio(dIDPESSOA,
                                            (integer(ChkLBoxTipoBen.Items.Objects[i])));
  end;

  if ((dbePercRatAliment.Text = '') xor (dbePercRatRefei.Text = '')) then
  begin
    if (dbePercRatRefei.Text = '') then
      cdsSubTipo.FieldByName('PERCRATREFEICAO').AsFloat    := (100 - StrToFloat(dbePercRatAliment.Text));

    if (dbePercRatAliment.Text = '') then
      cdsSubTipo.FieldByName('PERCRATALIMENTACAO').AsFloat := (100 - StrToFloat(dbePercRatRefei.Text));
  end;

end;

procedure TfrmCadFunc.sbtnProcurarClick(Sender: TObject);
var
 i : Integer;
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
   CdsTipoBen.Data   :=  TCtrlPessoaFuncionario(Pessoa).ListTipoBen(CdsSubTipo.FieldByName('Idpessoa').AsFloat);

   for i := 0 to ChkLBoxTipoBen.Items.Count - 1 do
    ChkLBoxTipoBen.Checked[i]  := False;

   while not (CdsTipoBen.Eof) do
   begin
    for i := 0 to ChkLBoxTipoBen.Items.Count - 1 do
    begin
      if (integer(ChkLBoxTipoBen.Items.Objects[i])) = CdsTipoBen.FieldByName('IDBENEFSALFUNC').AsInteger then
        ChkLBoxTipoBen.Checked[i] := true;
    end;
     CdsTipoBen.next;
   end;   
  end;
  NovoRegistro := False; // Michelle Mota - SOL: 250384.17324 - PPM: 1070235
end;

///////// Rotina de validação de caracteres e de percentual de rateio /////////

procedure TfrmCadFunc.ValidaKeyPercRateio(Sender: TObject; var Key: Char);
begin
  if (key in ['0' .. '9', ',', #8, #13, DecimalSeparator]) then
  begin
   if (Key = DecimalSeparator) and
      (Pos(DecimalSeparator, TEdit(Sender).Text) > 0) then
         Key := #0
   else
   if (Pos(DecimalSeparator, TEdit(Sender).Text) > 0) and (key <> #8) and
    (Length(Copy(TEdit(Sender).Text, Pos(DecimalSeparator, TEdit(Sender).Text ) + 1, 3 )) >= 2)
   then Key := #0;
  end
  else Key := #0;
end;


procedure TfrmCadFunc.ValidaPercRateio(Sender: TObject);
 var
  VlrPerc : Double;

begin
  if cdsSubTipo.State in [dsEdit, dsInsert] then
  begin

    TEdit(Sender).text := TEdit(Sender).Text;

    if (TEdit(Sender).text = '') then TEdit(Sender).text := '0';

    if (Pos(DecimalSeparator,TEdit(Sender).text) <> Length(TEdit(Sender).Text)) then
    begin
      VlrPerc :=  StrToFloat(TEdit(Sender).text);
      if VlrPerc > 100 then
      TEdit(Sender).Text := '100';

      VlrPerc  := (100 - StrToFloat(TEdit(Sender).text));
      if TEdit(Sender).Name = 'dbePercRatAliment' then
       begin
         {Início - Michelle Mota - SIG27550}
         //if (cdsSubTipo.FieldByName('PERCRATREFEICAO').AsFloat <> VlrPerc) then
         if (VlrAntRefeic <> VlrPerc) then
             Alterado := True
         else
           Alterado := False;
         {Término - Michelle Mota - SIG27550}

         dbePercRatRefei.Text := FloatToStr(VlrPerc);

         cdsSubTipo.FieldByName('PERCRATREFEICAO').AsFloat    := VlrPerc;
         cdsSubTipo.FieldByName('PERCRATALIMENTACAO').AsFloat := StrToFloat(TEdit(Sender).text);
       end
      else
       begin
         {Início - Michelle Mota - SIG27550}
         //if (cdsSubTipo.FieldByName('PERCRATALIMENTACAO').AsFloat <> VlrPerc) then
         if (VlrAntAliment <> VlrPerc) then
             Alterado := True
         else
           Alterado := False;
         {Término - Michelle Mota - SIG27550}

         dbePercRatAliment.Text := FloatToStr(VlrPerc);

         cdsSubTipo.FieldByName('PERCRATREFEICAO').AsFloat    := StrToFloat(TEdit(Sender).text);
         cdsSubTipo.FieldByName('PERCRATALIMENTACAO').AsFloat := VlrPerc;
       end;
    end ;
  end;
end;

//END - WIlliam Santana SOL: 201365 - KINTANA: 1965590

// Felipe A. Santos SOL 229871.16137 PPM 407073  - início
function TfrmCadFunc.VerificaDadosPessoais: boolean;
begin
     Result := False;

     //Everson Cunha - SIG38475 - Ini
     {if dbrgRecebBenef.ItemIndex = -1 then
     begin
        tbcDetalhe.TabIndex := 5;
        tbcDetalheChange(Self);
        pgctrlDadosPess.ActivePage := tbshGeral;
        MsgDlg('Selecione uma opção no campo Recebe o Benefício Previdenciário da aposentadoria','Aviso', mtWarning, [mbOk,mbHelp], iHelp);
        dbrgRecebBenef.SetFocus;
        Exit;
     end;}
     //Everson Cunha - SIG38475 - Fim

     if (UpperCase(dbcmbDeficFis.Text) = 'REABILITADO') and (Trim(dbmmoObsTd.Text) = '') then
     begin
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(Self);
       pgctrlDadosPess.ActivePage := tbshGeral;
       MsgDlg('Preencha o campo Observação','Aviso', mtWarning, [mbOk,mbHelp], iHelp);
       dbmmoObsTd.SetFocus;
       Exit;
     end;

     //Everson Cunha - SIG38475 - Ini
     {if (dbspedDataCheg.text <> EmptyStr) then
     if (dbrgNatur.ItemIndex = 0) and (dbedDataNatur.Date = 0) then
     begin
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(Self);
       pgctrlDadosPess.ActivePage := tbshEstrangeiro;
       MsgDlg('Preencha o campo Data de Naturalização','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
       if dbedDataNatur.CanFocus then dbedDataNatur.SetFocus;
       Exit;
     end;

     if (dbspedDataCheg.Date <> 0) then
     begin
       if (dtpDataEmissao.Date = 0) then
       begin
         tbcDetalhe.TabIndex := 5;
         tbcDetalheChange(Self);
         pgctrlDadosPess.ActivePage := tbshEstrangeiro;
         MsgDlg('Preencha o campo Data de Emissão','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
         dtpDataEmissao.SetFocus;
         Exit;
       end;

       if (Trim(dbedtOrgEmissor.Text) = '') then
       begin
         tbcDetalhe.TabIndex := 5;
         tbcDetalheChange(Self);
         pgctrlDadosPess.ActivePage := tbshEstrangeiro;
         MsgDlg('Preencha o campo Órgão Emissor','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
         dbedtOrgEmissor.SetFocus;
         Exit;
       end;
     end;}
     //Everson Cunha - SIG38475 - Fim

     //Michelle Mota - SOL: 250384.17324 - PPM:1070235 ínicio
     // Felipe A. Santos SOL 229874/16584 KTN 544346 - início
     {if (dbrgIsento.ItemIndex = 0) and (Trim(cmpNumProcIR.Text) = '') then
     begin
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(Self);
       MsgDlg('Informe o Número do Processo', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
       cmpNumProcIR.SetFocus;
       Exit;
     end
     else if (dbrgContrPrev.ItemIndex = 0) and (Trim(cmpNumProcCP.Text) = '') then
     begin
       tbcDetalhe.TabIndex := 5;
       tbcDetalheChange(Self);
       MsgDlg('Informe o Número do Processo', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
       cmpNumProcCP.SetFocus;
       Exit;
     end;}
     // Felipe A. Santos SOL 229874/16584 KTN 544346 - fim
     //Michelle Mota - SOL: 250384.17324 - PPM:1070235 - fim
     Result := True;
end;
// Felipe A. Santos SOL 229871.16137 PPM 407073  - fim

// Felipe A. Santos SOL 229871.16137 PPM 407073  - início
procedure TfrmCadFunc.dbcmbDeficFisChange(Sender: TObject);
begin
  inherited;
  dbmmoObsTd.Visible := (UpperCase(dbcmbDeficFis.Text) = 'REABILITADO');
  lblObsTd.Visible := (UpperCase(dbcmbDeficFis.Text) = 'REABILITADO');
end;
// Felipe A. Santos SOL 229871.16137 PPM 407073  - fim

// Felipe A. Santos SOL 229871.16137 PPM 407073  - início
function TfrmCadFunc.VerificaSituacaoFuncional(pTipoContrato: Integer = 0): boolean;   // Andre Imakawa - SIG 112819
begin
  Result := False;

  //edilaine SIG96978 : inicio
  //Dados: Identificaçao
  if dbedMatric.text =  '' then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe a Matrícula','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dbedMatric.SetFocus;
    Exit;
  end
  else if dbedDatAdmis.text =  '' then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe Data de Admissão','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dbedDatAdmis.SetFocus;
    Exit;
  end
  else if dblckSitFunc.text =  '' then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe a Situação Funcional','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dblckSitFunc.SetFocus;
    Exit;
  end
  else if (dblckMotivo1.text =  '') then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe o Motivo Oficial da Alteração Funcional','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dblckMotivo1.SetFocus;
    Exit;
  end
  else if (dblckMotivo2.text =  '')  then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe o Motivo Gerencial da Alteração Funcional','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dblckMotivo2.SetFocus;
    Exit;
  end
  else if (dblckHorario.text =  '') then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe o Horário de Trabalho','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dblckHorario.SetFocus;
    Exit;
  end
  else if (dbedDatRefHor.text =  '') and (pTipoContrato <> 6) then    // Andre Imakawa - SIG 112819
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe a Data referente ao Horário','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dbedDatRefHor.SetFocus;
    Exit;
  end
  else if (dblckFonte.text =  '') and (pTipoContrato <> 6) then   // Andre Imakawa - SIG 112819
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe a Fonte de Recrutamento','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dblckFonte.SetFocus;
    Exit;
  end
  else if (edtNUMEROCRACHA.text =  '') and (pTipoContrato <> 6) then    // Andre Imakawa - SIG 112819
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe o Número do Crachá','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    edtNUMEROCRACHA.SetFocus;
    Exit;
  end;

  //Dados: Lotaçao
  if (dblckEstab.text =  '') then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe o Estabelecimento de Lotação','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dblckEstab.SetFocus;
    Exit;
  end
  else if (dblckCCusto.text =  '') then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe o Centro de Custo da Lotação','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dblckCCusto.SetFocus;
    Exit;
  end
  else if (dbedDatLotac.text =  '') then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe a Data de Efetivação','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dbedDatLotac.SetFocus;
    Exit;
  end
  else if (dblckChefe.text =  '') and (pTipoContrato <> 6) then   // Andre Imakawa - SIG 112819
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe a Subordinação de Lotação','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    dblckChefe.SetFocus;
    Exit;
  end;

  //Dados: Contrato de Trabalho
  if (dbrgTipContra.ItemIndex = -1) then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe o Tipo de Contrato de Trabalho','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    if dbrgTipContra.CanFocus then dbrgTipContra.SetFocus;
    Exit;
  end
  else if (dbedDuracaoContr.text =  '') then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe a Duração do Prazo Det. ou Experiência','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    if dbedDuracaoContr.CanFocus then dbedDuracaoContr.SetFocus;
    Exit;
  end
  else if (dbedProrr.text =  '') then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe o prazo de Prorrogação','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    if dbedProrr.CanFocus then dbedProrr.SetFocus;
    Exit;
  end
  else if (dbedFinalContr.text =  '') and (pTipoContrato <> 6)  // Andre Imakawa - SIG 112819
           and (pTipoContrato <> 4)  and (pTipoContrato <> 5) then       // WO12255 Ferrari
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe o prazo de Prorrogação do Contrato','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    if dbedFinalContr.CanFocus then dbedFinalContr.SetFocus;
    Exit;
  end;

  //Dados: Cargo
  if (dblckCargo1.text =  '') then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe o Cargo Oficial','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    if dblckCargo1.CanFocus then dblckCargo1.SetFocus;
    Exit;
  end
  else if (dbedCargo1.text =  '') then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe a Data de Efetivação no Cargo Oficial','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    if dbedCargo1.CanFocus then dbedCargo1.SetFocus;
    Exit;
  end
  else if (dbspeStep1.text =  '') then
  begin
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    MsgDlg('Informe a Nivel do Cargo Oficial','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    if dbspeStep1.CanFocus then dbspeStep1.SetFocus;
    Exit;
  end;
  //edilaine SIG96978 : fim

  // Estagiário
  //Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  if (dbrgTipContra.ItemIndex = 3) then
  begin
    if not(rbObrigatorio.Checked) and not(rbNObrigatorio.Checked) then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Selecione um tipo de Natureza do Estágio','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      rbObrigatorio.SetFocus;
      Exit;
    end
    else if (dbcmbNivelEstag.Text = '') then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Selecione o Nível do Estagiário','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      dbcmbNivelEstag.SetFocus;
      Exit;
    end
    else if (Trim(dbedtAreaAtu.Text) = '') then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Preencha a área de atuação do estagiário','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      dbedtAreaAtu.SetFocus;
      Exit;
    end
    else
    if (Trim(dbedtNumApolSeguro.Text) = '') then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Preencha o número da Apólice','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      dbedtNumApolSeguro.SetFocus;
      Exit;
    end
    else
     if (Trim(dbedtInsEnsino.Text) = '') then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Preencha o nome da Instituição de Ensino','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      dbedtInsEnsino.SetFocus;
      Exit;
    end
    else if (Trim(dbedtAgenIntegracao.Text) = '') then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Preencha o nome do Agente de Integração','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      dbedtAgenIntegracao.SetFocus;
      Exit;
    end
    else if (Trim(dbedtNomeSprvisor.Text) = '') then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Preencha o campo Nome referente a Supervisor do Estágio.','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      if dbedtNomeSprvisor.CanFocus then dbedtNomeSprvisor.SetFocus;
      Exit;
    end
    else if (Trim(dbedtCPFspvisor.Text) = '') then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Preencha o campo CPF referente a Supervisor do Estágio.','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      dbedtCPFspvisor.enabled;   //edilaine SIG96978
      if dbedtCPFspvisor.CanFocus then dbedtCPFspvisor.SetFocus;
      Exit;
    end;

  end
//  else if (dbrgTipContra.ItemIndex in [4, 5])    // WO12254 Ferrari
  else if  ((CdsDescCateg.fieldbyname('CODIGOESOCIAL').asstring   = '305') or    // WO12254 Ferrari
           (CdsDescCateg.fieldbyname('CODIGOESOCIAL').asstring   = '410')) then   // WO12254 Ferrari
  begin
    //Everson Cunha - SIG38475 - Ini
    if (Trim(edtCodEsocial.Text) = '') then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Preencha o Código da Categoria nos Dados da Cessão','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      edtCodEsocial.SetFocus;
      Exit;
    end
    //Everson Cunha - SIG38475 - Fim
    else if (Trim(dbedtCNPJEmpCed.Text) = '') then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Preencha o número do CNPJ','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      dbedtCNPJEmpCed.SetFocus;
      Exit;
    end
    //Everson Cunha - SIG38475 - Ini
    else if (Trim(edtMatriculaCessao.Text) = '') then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Preencha a Matrícula nos Dados da Cessão','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      edtMatriculaCessao.SetFocus;
      Exit;
    end
    //Everson Cunha - SIG38475 - Fim
    else if (dbedDtAdmisCes.Date = 0) then
    begin
      tbcDetalhe.TabIndex := 7;
      tbcDetalheChange(Self);
      MsgDlg('Preencha o campo Data de Admissão no Cedente','Aviso', mtWarning, [mbOk, mbHelp], iHelp);
      dbedDtAdmisCes.SetFocus;
      Exit;
    end;
  end;
    //Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333

  Result := True;
end;
// Felipe A. Santos SOL 229871.16137 PPM 407073  - fim

// Felipe A. Santos SOL 229871.16137 PPM 407073  - início
procedure TfrmCadFunc.dbrgTipContraChange(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  //Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
  //grbInfoEstagio.Visible := (dbrgTipContra.ItemIndex = 3);
  //grbCessaoTrab.Visible := (dbrgTipContra.ItemIndex = 4) or (dbrgTipContra.ItemIndex = 5);
  // Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333

  if (dbrgTipContra.ItemIndex = 3) then
  begin
    DefineHabDadosEstagio(True);
    DefineHabDadosCessao(False);
    Exit;
  end;

	if ((dbrgTipContra.ItemIndex = 4) or (dbrgTipContra.ItemIndex = 5)) then
  begin
    DefineHabDadosCessao(True);
    DefineHabDadosEstagio(False);
  end
  else
  begin
  	DefineHabDadosCessao(False);
    DefineHabDadosEstagio(False);
  end;

  //Cássio Rovaroto - SIG nº 62180 - Início
  if (CdsCargo.FieldByName('IDCARGO').AsInteger = 200701) and (dbrgTipContra.ItemIndex <> 3) then
  begin
    grbInfoEstagio.Enabled := True;
    grbInfoEstagio.Font.Color := clWindowText;
    grbSpVisorEstag.Font.Color := clBtnShadow;
    lblAgenIntegracao.Enabled := True;
  	dbedtAgenIntegracao.Enabled := True;
    sbtnAgenIntegracao.Enabled := True;
  end;
  //Cássio Rovaroto - SIG nº 62180 - Fim
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
end;
// Felipe A. Santos SOL 229871.16137 PPM 407073  - fim

// Felipe A. Santos SOL 229871.16137 PPM 407073  - início
//Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235// Andre Imakawa - SIG 58333
procedure TfrmCadFunc.PostEstagiario;
var
   sNaturEstagio : string;
begin
  //Cássio Rovaroto - SIG nº 62180 - Início
  //if (dbrgTipContra.ItemIndex = 3) then
  if ((dbrgTipContra.ItemIndex = 3) or (CdsCargo.FieldByName('IDCARGO').AsInteger = 200701)) then
  //Cássio Rovaroto - SIG nº 62180 - Fim
  begin
    if rbObrigatorio.Checked then
       sNaturEstagio := 'O'
    else
       sNaturEstagio := 'N';

    CdsEstagiario.FieldByName('NATUREZAESTAGIO').AsString := sNaturEstagio;
    CdsEstagiario.Post;
  end
  else
    CdsEstagiario.Cancel;
end; //Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
// Felipe A. Santos SOL 229871.16137 PPM 407073  - fim

// Felipe A. Santos SOL 229871.16137 PPM 407073  - início
procedure TfrmCadFunc.PostDadosCessao;
begin
  if (dbrgTipContra.ItemIndex in [4, 5]) then
     CdsDadosCessao.Post
  else
     CdsDadosCessao.Cancel;
end;
// Felipe A. Santos SOL 229871.16137 PPM 407073  - fim

// Felipe A. Santos SOL 229871.16137 PPM 407073  - início
procedure TfrmCadFunc.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited CmeCadastroBeforeConfirma(sender, Accept);
  // Felipe A. Santos SOL 229874/16584 KTN 544346 - início
  //Michelle Mota - SOL: 250384.17324 - PPM:1070235 ínicio 
  {if (dbrgIsento.ItemIndex = 1) then
  begin
    cmpNumProcIR.Text := '';
    cdsPessoaFisica.FieldByName('IDPROCESSOSIR').AsInteger := 0;
  end;

  if (dbrgContrPrev.ItemIndex = 1) then
  begin
    cmpNumProcCP.Text := '';
    cdsPessoaFisica.FieldByName('IDPROCESSOSCP').AsInteger := 0;
  end;}
  // Felipe A. Santos SOL 229874/16584 KTN 544346 - fim
  //Michelle Mota - SOL: 250384.17324 - PPM:1070235 fim
  
  if Accept then
  begin
    PostEstagiario;//Michelle Mota - SOL: 250384.17324 - PPM: 1070235 // Andre Imakawa - SIG 58333
    PostDadosCessao;
    PostContratoTemp; //William Santana SOL - 207737 KTN 2018095
  end;
  cdsProcessosXIndicativoSusp.Filtered := False; //Cássio Rovaroto - SIG 38475.59780
end;
// Felipe A. Santos SOL 229871.16137 PPM 407073  - Fim

function TfrmCadFunc.VerificaEsocial: boolean;
begin
     // Felipe A. Santos SOL 229871.16137 PPM 407073  - início
     Result := False;

     if cmbGrupoCateg.Text = '' then
     begin
       tbcDetalhe.TabIndex := 11;
       tbcDetalheChange(Self);
       MsgDlg('Selecione o Grupo da Categoria', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
       if cmbGrupoCateg.canfocus then
       cmbGrupoCateg.SetFocus;
       Exit;
     end
     else if dbcmbDescCateg.Text = '' then
     begin
       tbcDetalhe.TabIndex := 11;
       tbcDetalheChange(Self);
       MsgDlg('Selecione a Descrição da Categoria do Trabalhador', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
       if dbcmbDescCateg.canfocus then
       dbcmbDescCateg.SetFocus;
       Exit;
     end
     else if dbcmbDescGrauExp.Text = '' then
     begin
       tbcDetalhe.TabIndex := 11;
       tbcDetalheChange(Self);
       MsgDlg('Selecione a Descrição do Grau de Exposição a Agente Nocivos', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
       if dbcmbDescGrauExp.canfocus then
       dbcmbDescGrauExp.SetFocus;
       Exit;
     end;

     Result := True;
     // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
end;

procedure TfrmCadFunc.sbtnInsEnsinoClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 229871.16137 PPM 407073  - início
  msInsEnsino.Executar;

  if msInsEnsino.RetornouValor then
  begin
    cdsEstagiario.FieldByName('IDINSTITUICAOENSINO').AsInteger := StrToInt(msInsEnsino.ValoresChave[0]);
    cdsEstagiario.FieldByName('NOMEIE').AsString := msInsEnsino.ValoresChave[1];
  end;
  // Felipe A. Santos SOL 229871.16137 PPM 407073  - início
end;

procedure TfrmCadFunc.sbtnAgenIntegracaoClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 229871.16137 PPM 407073  - início
  msAgenteInt.Executar;

  if msAgenteInt.RetornouValor then
  begin
    cdsEstagiario.FieldByName('IDAGENTEINT').AsInteger := StrToInt(msAgenteInt.ValoresChave[0]);
    cdsEstagiario.FieldByName('NOMEAI').AsString := msAgenteInt.ValoresChave[1];
  end;
  // Felipe A. Santos SOL 229871.16137 PPM 407073  - fim
end;

procedure TfrmCadFunc.sbtnSupervisorClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 229871.16137 PPM 407073  - início
  msSupervisor.Executar;

  if msSupervisor.RetornouValor then
  begin
    cdsEstagiario.FieldByName('IDSUPERVISOR').AsInteger := StrToInt(msSupervisor.ValoresChave[0]);
    cdsEstagiario.FieldByName('NOMESV').AsString := msSupervisor.ValoresChave[1];
    cdsEstagiario.FieldByName('CNPJSV').AsString := msSupervisor.ValoresChave[2];
  end;
  // Felipe A. Santos SOL 229871.16137 PPM 407073  - fim
end;

procedure TfrmCadFunc.PreencheCmbGrupoCateg;
begin
  // Felipe A. Santos SOL 229871.16137 PPM 407073  - início
  CdsGrupoCateg.First;
  while not CdsGrupoCateg.Eof do
  begin
     cmbGrupoCateg.Items.Add(CdsGrupoCateg.FieldByName('GRUPO').AsString);
     CdsGrupoCateg.Next;
  end;
  // Felipe A. Santos SOL 229871.16137 PPM 407073  - fim
end;

procedure TfrmCadFunc.cmbGrupoCategChange(Sender: TObject);
begin
  inherited;
   // Felipe A. Santos SOL 229871.16137 PPM 407073  - início
  if (cmbGrupoCateg.Text <> '') then
  begin
     CdsDescCateg.Data := TCtrlPessoaFuncionario(Pessoa).ListCategTrabaEsocial(False, cmbGrupoCateg.Text);
  end;
  // Felipe A. Santos SOL 229871.16137 PPM 407073  - fim
end;

// Willam Santana SOL 229871.16137 PPM 407073  - início
procedure TfrmCadFunc.DBNUMEROKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not(key in ['0' .. '9', #8, #13]) then
    key := #0 ;
end;
// Willam Santana SOL 229871.16137 PPM 407073  - fim

// Felipe A. Santos SOL 229874/16584 KTN 544346 - início

procedure TfrmCadFunc.dbrgIsentoChange(Sender: TObject);
begin
  inherited;
  //Michelle Mota - SOL: 250384.17324 - PPM:1070235 ínicio
  {lblNumProcIR.Visible := (dbrgIsento.ItemIndex = 0);
  cmpNumProcIR.Visible := (dbrgIsento.ItemIndex = 0);}
  //Michelle Mota - SOL: 250384.17324 - PPM:1070235 fim
end;

procedure TfrmCadFunc.dbrgContrPrevChange(Sender: TObject);
begin
  inherited;
  //Michelle Mota - SOL: 250384.17324 - PPM:1070235 ínicio
  {lblNumProcCP.Visible := (dbrgContrPrev.ItemIndex = 0);
  cmpNumProcCP.Visible := (dbrgContrPrev.ItemIndex = 0);}
  //Michelle Mota - SOL: 250384.17324 - PPM:1070235 fim
end;
// Felipe A. Santos SOL 229874/16584 KTN 544346 - fim

//Início - WIlliam Santana - SOL 211502.16259 PPM 442499
procedure TfrmCadFunc.chkRessalvaClick(Sender: TObject);
begin
  inherited;
  dbmDescRessalva.enabled := chkRessalva.checked;
end;

procedure TfrmCadFunc.btnAssociaRecisaoClick(Sender: TObject);
begin
  inherited;
  frmCadFunc.AssociaOutraImagem(dsImagemOutro, TBlobField(CdsImagemOutro.FieldByName('IMAGEM')),TFloatField(CdsSubTipo.FieldByName('IDIMGRECISAO')),'Recisão');

  dbimgTermoHomolog.Height := dbimgTermoHomolog.Picture.Height ;
  dbimgTermoHomolog.Width  := dbimgTermoHomolog.Picture.Width ;

end;

procedure TfrmCadFunc.CdsImagemOutroAfterScroll(DataSet: TDataSet);
begin
  inherited;   
  dbimgTermoHomolog.Height := dbimgTermoHomolog.Picture.Height ;
  dbimgTermoHomolog.Width  := dbimgTermoHomolog.Picture.Width ;
end;

                                                                 
procedure TfrmCadFunc.btnImprimirTermoClick(Sender: TObject);
var
  sFileName: String;    
begin
  inherited;  
  if not(CdsImagemOutro.FieldByName('idImagem').IsNull) then
  begin
    pmgTermo.Picture := dbimgTermoHomolog.Picture;

    TFrmPreview.CreateModalPreview(Self, rpTermo, 'Rescisão');
  end;
end;

//Término - WIlliam Santana - SOL 211502.16259 PPM 442499

// Felipe A. Santos - SOL 207737 KTN 2018095


procedure TfrmCadFunc.dblckCargoCTempChange(Sender: TObject);
begin
  inherited;
  if cdsContratoTemp.State in [dsInsert, dsEdit] then
  begin
    CdsFaixaSal.Data := CtrlFaixaSal.ListFaixaSal(CdsCargo.FieldByName('IDFAIXASALARIAL').AsFloat);

    if dbspinedtNivel.Value <> 0 then
       cdsContratoTemp.FieldByName('SALARIOATUAL').AsFloat := cdsFaixaSal.FieldByName('STEP' + FloatToStr(dbspinedtNivel.Value)).AsFloat;

    HabilitaBotoesDetCTemp;
  end;
end;


procedure TfrmCadFunc.dbedtDuracaoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not(key in ['0' .. '9', #8, #13]) then
     Key := #0;
end;

procedure TfrmCadFunc.dbedtDuracaoExit(Sender: TObject);
begin
  inherited;
  if cdsContratoTemp.State in [dsInsert, dsEdit] then
  begin
    if (dbedDatAdmis.Date <> 0) and (dbedtDuracao.Text <> '') then
    begin
       cdsContratoTemp.FieldByName('PREVISAOTERMINO').AsDateTime := dbedDatAdmis.Date + StrToFloat(dbedtDuracao.Text);
       cdsContratoTemp.FieldByName('PREVISAOAVISOPREV').AsDateTime := dtPrevTerm.Date - 30;
    end;

    if cdsContratoTempSubst.State in [dsInsert, dsEdit]  then
    begin
      if (dtInicio.Date <> 0) and (dbedtDuracao.Text <> '') then
         cdsContratoTempSubst.FieldByName('DATAFIM').AsDateTime := dtInicio.Date + StrToFloat(dbedtDuracao.Text);
    end;
  end;
end;

procedure TfrmCadFunc.dtPrevTermExit(Sender: TObject);
begin
  inherited;
  if (cdsContratoTemp.State in [dsInsert, dsEdit]) and (dtPrevTerm.Date <> 0) then
     cdsContratoTemp.FieldByName('PREVISAOAVISOPREV').AsDateTime := dtPrevTerm.Date - 30;

  ValidaDataPrevisaoTermino;
end;

function TfrmCadFunc.ValidaContratoTemp: boolean;
var
   dDataAvisoPrev : TDateTime;
begin
     Result := False;

     if ((dbspinedtNivel.Value <> 0) or
        (dbedtSalario.Text <> '') or
        (dbedtDuracao.Text <> '') or
        (dtPrevTerm.Date <> 0) or
        (dtPrevAviso.Date <> 0) or
        (rbAtivo.Checked) or
        (rbEfetivado.Checked) or
        (rbDesligado.Checked) or
        (dtDesligEfeitv.Date <> 0) or
        not(cdsContratoTempSubst.IsEmpty) or
        not(cdsContratoTempObs.IsEmpty)) and (dblckCargoCTemp.LookupValue = '') then
     begin
        MsgDlg('Favor, informar o Cargo!', 'Atenção', mtWarning, [mbOK], 0);
        tbcDetalhe.TabIndex := 11;
        tbcDetalheChange(Self);
        if dblckCargoCTemp.CanFocus then dblckCargoCTemp.SetFocus;
        Exit;
     end;

     if (rbEfetivado.Checked)  then
     begin
        if (dtDesligEfeitv.Date = 0) then
        begin
          MsgDlg('Favor, informar a data de efetivação!', 'Atenção', mtWarning, [mbOK], 0);
          tbcDetalhe.TabIndex := 11;
          tbcDetalheChange(Self);
          dtDesligEfeitv.SetFocus;
          Exit;
        end;
     end
     else if (rbDesligado.Checked) then
     begin
        if (dtDesligEfeitv.Date = 0) then
        begin
          MsgDlg('Favor, informar a data de desligamento!', 'Atenção', mtWarning, [mbOK], 0);
          tbcDetalhe.TabIndex := 11;
          tbcDetalheChange(Self);
          dtDesligEfeitv.SetFocus;
          Exit;
        end;
     end;

     // Data de Previsão Aviso Préviso deve ser menos 30 dias exatos do que a data de previsão de término
     dDataAvisoPrev := dtPrevTerm.Date - 30;

     if (dtPrevAviso.Date <> dDataAvisoPrev) and (dtPrevAviso.Date <> 0) then
     begin
          MsgDlg('A previsão de aviso prévio deve ser de exatamente 30 dias.', 'Atenção', mtWarning, [mbOk], 0);
          tbcDetalhe.TabIndex := 11;
          tbcDetalheChange(Self);
          dtPrevAviso.SetFocus;
          Exit;
     end;

     if not ValidaDataPrevisaoTermino then
     begin
        tbcDetalhe.TabIndex := 11;
        tbcDetalheChange(Self);
        if dtPrevTerm.CanFocus then dtPrevTerm.SetFocus;
        Exit;
     end;

     if (dtDesligEfeitv.Date <= dbedDatAdmis.Date) and (dtDesligEfeitv.Date <> 0) then
     begin
        MsgDlg('A Data de desligamento ou efetivação  deve ser maior que a Data de Admissão do empregado','Atenção', mtWarning, [mbOk], 0);
        tbcDetalhe.TabIndex := 11;
        tbcDetalheChange(Self);
        dtDesligEfeitv.SetFocus;
        Exit;
     end;

     Result := True;
end;

procedure TfrmCadFunc.dblckCentCustoCTempChange(Sender: TObject);
begin
  inherited;
  if dblckCentCustoCTemp.LookupValue <> '' then
  begin
       cdsDiretoria.Data := CtrlListTerceirosRH.GetDirDoCentroCusto(StrToInt(dblckCentCustoCTemp.LookupValue));
       dbedtDir.Text := cdsDiretoria.FieldByName('NOMEDIRETORIA').AsString;
  end;
end;

procedure TfrmCadFunc.btnInsertCTempSubClick(Sender: TObject);
begin
  inherited;
  if not VerificaDataFimSubstitutos then  // Verifica se o ultimo substituto está encerrado
     Exit;

  CmeCTempSubst.Insert(Self);
end;

function TfrmCadFunc.VerificaDataFimSubstitutos: boolean;
begin
   if cdsContratoTempSubst.IsEmpty then
   begin
      Result := True;
      Exit;
   end;

   Result := False;

   cdsContratoTempSubst.Last;

   if cdsContratoTempSubst.FieldByName('DATAFIM').AsDateTime = 0 then
   begin
      MsgDlg('O registro de substituição anterior ainda não foi encerrado. Por favor, verifique!', 'Atenção', mtWarning, [mbOk], 0);
      Exit;
   end;

   Result := True;
end;

procedure TfrmCadFunc.TrazerParaFrenteDetCTemp(Sender: TObject);
begin
    if ((Sender as TToolbarButton97).Name = 'btnInsertCTempSub') or
       ((Sender as TToolbarButton97).Name = 'btnAlterarCTempSub') then
    begin
        pnlSub.BringToFront;
        pnlSub.Align := alNone;
        pnlSub.Width := 843;
        dckbtnsSub.Visible := True;
    end
    else
    if ((Sender as TToolbarButton97).Name = 'btnInsertCTempObs') or
       ((Sender as TToolbarButton97).Name = 'btnAltCTempObs') then
    begin
       pnlObs.BringToFront;
       pnlSub.Align := alNone;
       pnlObs.Width := 843;
       dckBtnsObs.Visible := True;
    end;
end;

procedure TfrmCadFunc.FazerVoltarDetContratoTempSub;
begin
   pnlSub.SendToBack;
   dckbtnsSub.Visible := False;
end;

procedure TfrmCadFunc.FazerVoltarDetContratoTempObs;
begin
   pnlObs.SendToBack;
   dckBtnsObs.Visible := False;
end;

procedure TfrmCadFunc.btnAlterarCTempSubClick(Sender: TObject);
begin
  inherited;
  if cdsContratoTempSubst.State = dsEdit then
  begin
     btnAlterarCTempSub.Down := True;
     Exit;
  end;

  CmeCTempSubst.Edit(Self);
end;

procedure TfrmCadFunc.btnVoltarDetSubClick(Sender: TObject);
begin
  inherited;
  btnCancelarDetSubClick(Self);
end;

procedure TfrmCadFunc.dtInicioExit(Sender: TObject);
begin
  inherited;
  if (dtInicio.Date <> 0) and (dbedtDuracao.Text <> '') then
     cdsContratoTempSubst.FieldByName('DATAFIM').AsDateTime := dtInicio.Date + StrtoInt(dbedtDuracao.Text);
end;

procedure TfrmCadFunc.btnCancelarDetSubClick(Sender: TObject);
begin
  inherited;
  cdsContratoTempSubst.Cancel;
  CmeCTempSubst.AtualizaBotoes(Self);
end;


procedure TfrmCadFunc.PostContratoTemp;
var
  sSituacao : string;
begin
   if rbAtivo.Checked then
     sSituacao := 'A'
  else if rbEfetivado.Checked then
     sSituacao := 'E'
  else if rbDesligado.Checked then
     sSituacao := 'D';

   if (cdsContratoTemp.State in [dsInsert, dsEdit]) and (dblckCargoCTemp.LookupValue <> '') then
   begin
     cdsContratoTemp.FieldByName('IDCARGO').AsInteger := StrToInt(dblckCargoCTemp.LookupValue);
     cdsContratoTemp.FieldByName('SITUACAO').AsString := sSituacao;
     cdsContratoTemp.Post;
   end
   else
   begin
     cdsContratoTemp.Cancel;
     cdsContratoTempSubst.Cancel;
     cdsContratoTempObs.Cancel;
   end;
end;

procedure TfrmCadFunc.HabilitaContratoTemp;
begin
   grbSituacao.Enabled := True;
   dbspinedtNivel.Enabled := True;
   HabilitaBotoesDetCTemp;
end;

procedure TfrmCadFunc.TravaContratoTemp;
begin
   grbSituacao.Enabled := False;
   dbspinedtNivel.Enabled := False;
   btnAltCTempObs.Enabled := False;
   btnAlterarCTempSub.Enabled := False;
   btnInsertCTempSub.Enabled := False;
   btnInsertCTempObs.Enabled := False;
end;

procedure TfrmCadFunc.dbspinedtNivelChange(Sender: TObject);
begin
  inherited;
  if cdsContratoTemp.State in [dsInsert, dsEdit] then
  begin
    if not(CdsFaixaSal.IsEmpty) then
    begin
        if dbspinedtNivel.Value = 0 then
           cdsContratoTemp.FieldByName('SALARIOATUAL').AsString := ''
        else
           cdsContratoTemp.FieldByName('SALARIOATUAL').AsString := CdsFaixaSal.FieldByName('STEP' + FloatToStr(dbspinedtNivel.Value)).AsString;
    end;
  end;
end;

procedure TfrmCadFunc.CmeCTempSubstBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if (dbedtSubstituido.Text = '') then
  begin
     MsgDlg('Favor, informar o Substituído!', 'Atenção', mtWarning, [mbOk], 0);
     Exit;
  end;

  if not(rbAuxDoenca.Checked) and
     not(rbAuxDoencaAcid.Checked) and
     not(rbLicencaMaternidade.Checked) then
  begin
     MsgDlg('Favor, informar o Motivo da Substituição!', 'Atenção', mtWarning, [mbOk], 0);
     Exit;
  end;

  if (dblckCentCustoCTemp.LookupValue = '') then
  begin
    MsgDlg('Favor, informar o Centro de Custo!', 'Atenção', mtWarning, [mbOk], 0);
    if dblckCentCustoCTemp.CanFocus then dblckCentCustoCTemp.SetFocus;
    Exit;
  end;

  if (dtInicio.Date > dtFim.Date) and  (dtFim.Date <> 0) then
  begin
     MsgDlg('A data fim não pode ser menor que a data inicio', 'Atenção', mtWarning, [mbOk], 0);
     if dtFim.CanFocus then dtFim.SetFocus;
     Exit;
  end;

  if (dtInicio.Date < dDataFim) and (dDataFim <> 0) then
  begin
     MsgDlg('A substituição que está cadastrando está se iniciando antes do término da substituição anterior. Por favor, verifique!', 'Atenção', mtWarning, [mbOk], 0);
     if dtInicio.CanFocus then dtInicio.SetFocus;
     Exit;
  end;

  Accept := True;
end;

procedure TfrmCadFunc.CmeCTempSubstAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if cdsContratoTempSubst.State = dsInsert then
  begin
     btnAlterarCTempSub.Enabled := False;
     btnInsertCTempSub.Down := True;
     TrazerParaFrenteDetCTemp(btnInsertCTempSub);
  end
  else if cdsContratoTempSubst.State = dsEdit then
  begin
     btnInsertCTempSub.Enabled := False;
     btnAlterarCTempSub.Down := True;
     TrazerParaFrenteDetCTemp(btnAlterarCTempSub);
  end
  else
  begin
     btnInsertCTempSub.Enabled := True;
     btnAlterarCTempSub.Enabled := True;
     btnInsertCTempSub.Down := False;
     btnAlterarCTempSub.Down := False;
     FazerVoltarDetContratoTempSub;
  end;
end;

procedure TfrmCadFunc.CmeCTempSubstConfirma(Sender: TObject);
var
   iIdPessoaSub, iIdMotivo : integer;
   sDescricao, sMotivo : string;
begin
   inherited;

   if msCTempSub.RetornouValor then
      // Início - William Santana - SOL 267877 PPM 1241250
    //iIdPessoaSub := StrToInt(msCTempSub.ValoresChave[0]);
    iIdPessoaSub := StrToInt(msCTempSub.ValoresChave[0])
   else
     iIdPessoaSub := cdsContratoTempSubst.FieldByName('IDPESSOA').AsInteger;
   // Término - William Santana - SOL 267877 PPM 1241250


   if rbAuxDoenca.Checked then
      sDescricao := 'A'
   else if rbAuxDoencaAcid.Checked then
      sDescricao := 'D'
   else if rbLicencaMaternidade.Checked then
      sDescricao := 'L';

   if sDescricao = 'A' then
   begin
      sMotivo := 'Auxílio doença';
      iIdMotivo := 23;
   end
   else if sDescricao = 'D' then
   begin
      sMotivo := 'Auxílio doença acidentário';
      iIdMotivo := 24;
   end
   else if sDescricao = 'L' then
   begin
      sMotivo := 'Licença maternidade';
      iIdMotivo := 22;
   end;

   cdsContratoTempSubst.FieldByName('IDPESSOA').AsInteger := iIdPessoaSub;
   cdsContratoTempSubst.FieldByName('DESCRICAO').AsString := sDescricao;
   cdsContratoTempSubst.FieldByName('MOTIVO').AsString := sMotivo;
   cdsContratoTempSubst.FieldByName('CODDIRETORIA').AsString := cdsDiretoria.FieldByName('CODDIRETORIA').AsString;
   cdsContratoTempSubst.FieldByName('DIRETORIA').AsString := dbedtDir.Text;
   cdsContratoTempSubst.FieldByName('NOMECENTROCUSTO').AsString := dblckCentCustoCTemp.Text;
   cdsContratoTempSubst.FieldByName('IDMOTIVO').AsInteger  := iIdMotivo;
   cdsContratoTempSubst.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   cdsContratoTempSubst.Post;

   CmeCTempSubst.AtualizaBotoes(Self);
end;

procedure TfrmCadFunc.CmeCTempSubstInsert(Sender: TObject);
begin
  inherited;
  CmeCTempSubst.Operacao := opInserir;

  // pega a data fim do ultimo registro para validação da mesma
  cdsContratoTempSubst.Last;
  dDataFim := cdsContratoTempSubst.FieldByName('DATAFIM').AsDateTime;

  cdsContratoTempSubst.Insert;
  CmeCTempSubst.AtualizaBotoes(Self);
end;

procedure TfrmCadFunc.CmeCTempSubstEdit(Sender: TObject);
begin
  inherited;
  CmeCTempSubst.Operacao := opAlterar;

  if cdsContratoTempSubst.FieldByName('IDMOTIVO').AsInteger = 23 then
     rbAuxDoenca.Checked := True
  else if cdsContratoTempSubst.FieldByName('IDMOTIVO').AsInteger = 24 then
     rbAuxDoencaAcid.Checked := True
  else if cdsContratoTempSubst.FieldByName('IDMOTIVO').AsInteger = 22 then
     rbLicencaMaternidade.Checked := True;

  dblckCentCustoCTemp.Update;

  cdsContratoTempSubst.Edit;
  CmeCTempSubst.AtualizaBotoes(Self);
end;

procedure TfrmCadFunc.btnOkDetSubClick(Sender: TObject);
begin
  inherited;
  CmeCTempSubst.Confirma(Self);
end;

procedure TfrmCadFunc.sbtnProcurarSubClick(Sender: TObject);
begin
  inherited;
  msCTempSub.Executar;

  if msCTempSub.RetornouValor then
  begin
     cdsContratoTempSubst.FieldByName('NOME').AsString := msCTempSub.ValoresChave[2];
     cdsContratoTempSubst.FieldByName('MATRICULA').AsString := msCTempSub.ValoresChave[1];
  end;
end;

procedure TfrmCadFunc.btnInsertCTempObsClick(Sender: TObject);
begin
  inherited;
  if cdsContratoTempObs.State = dsInsert then
  begin
       btnInsertCTempObs.Down := True;
       Exit;
  end;

  CmeCTempObs.Insert(Self);
end;

procedure TfrmCadFunc.btnAltCTempObsClick(Sender: TObject);
begin
  inherited;
  if cdsContratoTempObs.State = dsEdit then
  begin
       btnAltCTempObs.Down := True;
       Exit;
  end;

  CmeCTempObs.Edit(Self);
end;

procedure TfrmCadFunc.btnOkObsClick(Sender: TObject);
begin
  inherited;
  CmeCTempObs.Confirma(Self);
end;

procedure TfrmCadFunc.btnCancelarObsClick(Sender: TObject);
begin
  inherited;
  CmeCTempObs.Cancel(Self);
end;

procedure TfrmCadFunc.btnVoltarObsClick(Sender: TObject);
begin
  inherited;
  btnCancelarObsClick(Self);
end;

procedure TfrmCadFunc.CmeCTempObsInsert(Sender: TObject);
begin
  inherited;
  CmeCTempObs.Operacao := opInserir;
  cdsContratoTempObs.Insert;
  CmeCTempObs.AtualizaBotoes(Self);
end;

procedure TfrmCadFunc.CmeCTempObsEdit(Sender: TObject);
begin
  inherited;
  CmeCTempObs.Operacao := opAlterar;
  cdsContratoTempObs.Edit;
  CmeCTempObs.AtualizaBotoes(Self);
end;

procedure TfrmCadFunc.CmeCTempObsCancel(Sender: TObject);
begin
  inherited;
  cdsContratoTempObs.Cancel;
  CmeCTempObs.AtualizaBotoes(self);
end;

procedure TfrmCadFunc.CmeCTempObsAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if cdsContratoTempObs.State = dsInsert then
  begin
       btnAltCTempObs.Enabled := False;
       btnInsertCTempObs.Down := True;
       TrazerParaFrenteDetCTemp(btnInsertCTempObs);
  end
  else if cdsContratoTempObs.State = dsEdit then
  begin
       btnAltCTempObs.Down := True;
       btnInsertCTempObs.Enabled := False;
       TrazerParaFrenteDetCTemp(btnAltCTempObs);
  end
  else
  begin
       btnAltCTempObs.Enabled := True;
       btnAltCTempObs.Down := False;
       btnInsertCTempObs.Enabled := True;
       btnInsertCTempObs.Down := False;
       FazerVoltarDetContratoTempObs;
  end;
end;

procedure TfrmCadFunc.CmeCTempObsConfirma(Sender: TObject);
begin
  inherited;
  cdsContratoTempObs.FieldByName('OBSERVACAO2').AsString := copy(cdsContratoTempObs.FieldByName('OBSERVACAO').AsString, 1, 255);
  cdsContratoTempObs.Post;
  CmeCTempObs.AtualizaBotoes(Self);
end;


procedure TfrmCadFunc.dbedDatAdmisExit(Sender: TObject);
begin
  inherited;
  if cdsContratoTemp.State in [dsInsert, dsEdit] then
  begin
    if (dbedDatAdmis.Date <> 0) and (dbedtDuracao.Text <> '') then
    begin
       cdsContratoTemp.FieldByName('PREVISAOTERMINO').AsDateTime := dbedDatAdmis.Date + StrToFloat(dbedtDuracao.Text);
       cdsContratoTemp.FieldByName('PREVISAOAVISOPREV').AsDateTime := dtPrevTerm.Date - 30;
    end;
  end;
end;

function TfrmCadFunc.ValidaDataPrevisaoTermino: boolean;
var
   dDifDias : TDateTime;
begin
  Result := False;

  if (dtPrevTerm.Date < dbedDatAdmis.Date) and (dtPrevTerm.Date <> 0) then
  begin
    MsgDlg('A previsão de término deve ser maior que a data de admissão','Atenção', mtWarning, [mbOk], 0);
    Exit;
  end;

  dDifDias := dtPrevTerm.Date - dbedDatAdmis.Date;

  if (dbedtDuracao.Text <> '') and (dtPrevTerm.Date <> 0) and (dbedDatAdmis.Date <> 0) then
  begin
    if (StrToFloat(dbedtDuracao.Text) <> dDifDias) then
    begin
      MsgDlg('A data de previsão de termino não coincide com a quantidade de dias.','Atenção', mtWarning, [mbOk], 0);
      dbedtDuracao.SetFocus;
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfrmCadFunc.dbgrdObsDblClick(Sender: TObject);
begin
  inherited;
  if not(cdsContratoTempObs.IsEmpty) then
     AbrirForm(frmObservacaoCTemp, TfrmObservacaoCTemp, False);
end;

procedure TfrmCadFunc.HabilitaBotoesDetCTemp;
begin
   if (dblckCargoCTemp.LookupValue <> '') then
   begin
     btnAltCTempObs.Enabled := True;
     btnAlterarCTempSub.Enabled := True;
     btnInsertCTempSub.Enabled := True;
     btnInsertCTempObs.Enabled := True;
   end;
end;

//procedure TfrmCadFunc.CmeCadastroBeforeConfirma(sender: TObject;
//  var Accept: Boolean);
//begin
//  inherited CmeCadastroBeforeConfirma(sender, Accept);
//
//  if Accept then
//  begin
//    PostContratoTemp;
//  end;
//end;

// Felipe A. Santos SOL 207737 KTN 2018095 - fim

// Início - Michelle Mota - SOL: 250384.17324 - PPM: 1070235
function TfrmCadFunc.VerificaOutros: boolean;
begin
  if (ObrigaVinculo) then begin
    if (cdsSitRisco.FieldByName('FLGMULTVINCULOS').AsInteger = 0) then
      Result := true
    else If ((cbbDESCCONTRIBPREV.Text <> '') and
       (cdsSitRisco.FieldByName('FLGMULTVINCULOS').AsInteger = 1)) then
      Result := True
    else If ((cbbDESCCONTRIBPREV.Text = '') and
       (cdsSitRisco.FieldByName('FLGMULTVINCULOS').AsInteger = 1)) then
      begin
        tbcDetalhe.TabIndex := 8;
        tbcDetalheChange(Self);
        MsgDlg('Favor, informar o desconto da contribuição previdenciária.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
        if cbbDESCCONTRIBPREV.canfocus then
        cbbDESCCONTRIBPREV.SetFocus;

        Result := False;
      end;
  end
  else
    Result := True;
end;

function TfrmCadFunc.VerificaProcContrPrev(vIdPessoa: string): boolean;
var
  VerifProcMemoria : Boolean;
  Cod : Integer;
begin
  VerifProcMemoria := False;
    if (CdsPessoaFisica.FieldByName('FLGISENTOCONTRPREVID').AsInteger = 1) then begin  // item do radiogroup
      CdsVerificaProcContr.Data := TCtrlPessoaFuncionario(Pessoa).ListProcContrPrev(vIdPessoa);
      if (CdsProcessos.State in [dsBrowse, dsEdit, dsInsert, dsOpening]) then
      begin

          CdsProcessos.IndexFieldNames:='DATAFIM';
          CdsProcessos.FindKey(['']);
          CdsProcessos.First;
          while not CdsProcessos.Eof do
            begin

              Cod := CdsProcessos.FieldByName('CONTRIABRANDECISAO').AsInteger;

              if (Cod = 2)  and (CdsProcessos.FieldByName('DATAFIM').AsString = '') then // registro da combo
              begin
                 VerifProcMemoria := true;
                 Break;
              end;

              CdsProcessos.Next;
            end;
      end;

      if (not (CdsVerificaProcContr.isempty)) or (VerifProcMemoria)  then
        Result := True
      else
        Result := False;
  end
  else
    Result := True;
end;

function TfrmCadFunc.VerificaProcContrIR(vIdPessoa: string): boolean;
var
  VerifProcMemoria : Boolean;
  Cod : Integer;
begin
  VerifProcMemoria := False;
  if (CdsPessoaFisica.FieldByName('FLGISENTOIRRF').AsInteger = 1) then
  begin  // item do radiogroup
      CdsVerificaProcContr.Data := TCtrlPessoaFuncionario(Pessoa).ListProcContrIR(vIdPessoa);
      if (CdsProcessos.State in [dsBrowse, dsEdit, dsInsert, dsOpening]) then
      begin
          CdsProcessos.IndexFieldNames:='DATAFIM';
          CdsProcessos.FindKey(['']);
          CdsProcessos.First;
          while not CdsProcessos.Eof do
          begin

              Cod := CdsProcessos.FieldByName('CONTRIABRANDECISAO').AsInteger;

              if (Cod = 1) and (CdsProcessos.FieldByName('DATAFIM').AsString = '') then // registro da combo
              begin
                 VerifProcMemoria := true;
                 Break;
              end;

              CdsProcessos.Next;
          end;
      end;
  
      if (not (CdsVerificaProcContr.isempty)) or (VerifProcMemoria)  then
        Result := True
      else
        Result := False;
  end
  else
    Result := True;
end;

function TfrmCadFunc.VerificaAbaGeral: boolean;
begin
    if ( VerificaProcContrPrev( CdsSubTipo.FieldByName('Idpessoa').AsString ) ) and
       ( VerificaProcContrIR( CdsSubTipo.FieldByName('Idpessoa').AsString ) ) then
    	Result := True
    else
    begin
    	tbcDetalhe.TabIndex := 14;
      tbcDetalheChange(pgctrlDetalhe);
      MsgDlg('Favor cadastrar um processo.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    	Result := False;
    end;
end;

function TfrmCadFunc.VerificaAnoChegada: boolean;
begin
  Result := True;
  if ((dblckNacional.Text <> 'Brasileira') AND (dblckNacional.Text <> '')) and
     (dbspedDataCheg.Text = '') then
    begin
      tbcDetalhe.TabIndex := 5;
      tbcDetalheChange(Self);
      pgctrlDadosPess.ActivePage := tbshEstrangeiro;
      MsgDlg('Preencha o Ano de chegada.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      if dbspedDataCheg.CanFocus then
        dbspedDataCheg.SetFocus;

      Result := False;
    end;
end;

//Everson Cunha - SIG38475 - Ini
{function TfrmCadFunc.VerificaCondTrabEstr: boolean;
begin
  Result := True;
  if ((dblckNacional.Text <> 'Brasileira') AND (dblckNacional.Text <> '')) and
     (wdblkpcmbIDCONDICAOTRABEST.Text = '') then
    begin
      tbcDetalhe.TabIndex := 5;
      tbcDetalheChange(Self);
      pgctrlDadosPess.ActivePage := tbshEstrangeiro;
      MsgDlg('Favor, informar a Condição do Trabalhador Estrangeiro no Brasil.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      if wdblkpcmbIDCONDICAOTRABEST.CanFocus then
        wdblkpcmbIDCONDICAOTRABEST.SetFocus;

      Result := False;
    end;
end;}
//Everson Cunha - SIG38475 - Fim

procedure TfrmCadFunc.dblckEstCivilChange(Sender: TObject);
begin
  inherited;

    //if (CdsEstCivil.FieldByName('ESTCIVIL').AsString = 'S')  then //Leandro WO16172
    if (CdsEstCivil.FieldByName('ESTCIVIL').AsString <> 'C')  then  //Leandro WO16172
      dbrgrpUNIAOESTAVEL.Enabled := True
    else
    begin
      dbrgrpUNIAOESTAVEL.Enabled := False;
      if (CdsPessoaFisica.State in [dsInsert, dsEdit]) then
        cdsPessoaFisica.FieldByName('UNIAOESTAVEL').Asstring := 'N';
    end;

end;

procedure TfrmCadFunc.cbbTipoProcChange(Sender: TObject);
begin
  inherited;
  if (CdsProcessos.State in [dsInsert, dsEdit]) then
  begin
   if (cbbTipoProc.ItemIndex = 0) then
   begin
     CdsProcessos.FieldByName('TIPO').AsString := 'A';
     CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('A');
     CdsProcessos.FieldByName('TIPODEPROC').AsString := 'Administrativo';
     //Cássio Rovaroto - SIG nº 62232 - Início

     //Everson Cunha - SIG70569 - Início
     //edtNumeroProc.MaxLength := 17;
     edtNumeroProc.MaxLength := 21;
     cmbMatProc.Enabled := True;
     //Everson Cunha - SIG70569 - Fim

     edtNumeroProc.SetFocus;
     //Cássio Rovaroto - SIG nº 62232 - Fim
   end
   else
   if (cbbTipoProc.ItemIndex = 1) then
   begin
     CdsProcessos.FieldByName('TIPO').AsString := 'J';
     CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('J');
     CdsProcessos.FieldByName('TIPODEPROC').AsString := 'Judicial';
     //Cássio Rovaroto - SIG nº 62232 - Início
     edtNumeroProc.MaxLength := 20;
     edtNumeroProc.SetFocus;
     //Cássio Rovaroto - SIG nº 62232 - Fim
     cmbMatProc.Enabled := True; //Everson Cunha - SIG70569

   //Cássio Rovaroto - SIG nº 38475.59780 - Início
   end
   //Everson Cunha - SIG38475 - Ini
   {else
   if (cbbTipoProc.ItemIndex = 2) then //Everson Cunha - SIG70569
   begin
   	 CdsProcessos.FieldByName('TIPO').AsString := 'N';
     CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('N');
     CdsProcessos.FieldByName('TIPODEPROC').AsString := 'Número de Benefício (NB) do INSS';
     //Cássio Rovaroto - SIG nº 62232 - Início
     edtNumeroProc.MaxLength := 10;
     edtNumeroProc.SetFocus;
     //Cássio Rovaroto - SIG nº 62232 - Fim

     //Everson Cunha - SIG70569 - Início
     cmbMatProc.Enabled := False;
     cmbMatProc.ItemIndex := 5;
     CdsProcessos.FieldByName('CODMATPROC').AsInteger := 6;
     //Everson Cunha - SIG70569 - Fim
   end}
   //Everson Cunha - SIG38475 - Fim
   //Cássio Rovaroto - SIG nº 38475.59780 - Fim

   //Everson Cunha - SIG70569 - Início
   else
   begin
     CdsProcessos.FieldByName('TIPO').AsString := 'F';
     CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('F');
     CdsProcessos.FieldByName('TIPODEPROC').AsString := 'Processo FAP de exercício anterior a 2019';
     edtNumeroProc.MaxLength := 16;
     edtNumeroProc.SetFocus;
     cmbMatProc.Enabled := True;
   end;
   //Everson Cunha - SIG70569 - Fim
  end;
end;

//Everson Luiz SIG70569 - Início
{procedure TfrmCadFunc.cbbIndicaDecisaoChange(Sender: TObject);
begin
  inherited;
  if (CdsProcessos.State in [dsInsert, dsEdit]) then begin
  case cbbIndicaDecisao.ItemIndex of
    0: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 1;
    1: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 2;
    2: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 3;
    3: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 4;
    4: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 5;
    5: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 9;
  end;

  CdsProcessos.FieldByName('indicativodecisao').AsString := cbbIndicaDecisao.Text;
  end;
end;}
//Everson Luiz SIG70569 - Fim

procedure TfrmCadFunc.cbbCONTRIABRANDECISAOChange(Sender: TObject);
begin
  inherited;
  if (CdsProcessos.State in [dsInsert, dsEdit]) then
  begin
    case cbbCONTRIABRANDECISAO.ItemIndex of
      0: CdsProcessos.FieldByName('CONTRIABRANDECISAO').AsInteger := 1;
      1: CdsProcessos.FieldByName('CONTRIABRANDECISAO').AsInteger := 2;
    end;

    CdsProcessos.FieldByName('contriabrandec').AsString := cbbCONTRIABRANDECISAO.Text;
  end;
end;

procedure TfrmCadFunc.CdsProcessosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //if (CdsProcessos.State in [dsInsert, dsEdit]) then begin
  //CdsProcessos.FieldByName('INDICATDEPOSITO').AsInteger := 0;
  //CdsProcessos.FieldByName('AUTORACAO').AsString := 'N';
  //end;
end;

procedure TfrmCadFunc.CdsProcessosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (CdsProcessos.State in [dsInsert, dsEdit]) then
    CdsProcessos.FieldByName('IDFILIALPESSOA').Value := null;
end;

//Everson Luiz SIG70569 - Início
{procedure TfrmCadFunc.cbbApurFapChange(Sender: TObject);
begin
  inherited;
  if (CdsProcessos.State in [dsInsert, dsEdit]) then begin
  case cbbApurFap.ItemIndex of
    0: CdsProcessos.FieldByName('APURFAP').AsInteger := 1;
    1: CdsProcessos.FieldByName('APURFAP').AsInteger := 2;
  end;

  CdsProcessos.FieldByName('apuracaofap').AsString := cbbApurFap.Text;
  end;
end;}
//Everson Luiz SIG70569 - Fim

procedure TfrmCadFunc.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  //if (Cds.State = dsInsert) then
  //begin
  //  if (CdsEstrangeiro.IsEmpty) then
  //  begin
  //    CdsEstrangeiro.Insert;
  //    CdsEstrangeiro.FieldByName('FLGCASADOBRASILEIRO').asInteger := 0;
  //    CdsEstrangeiro.FieldByName('FLGFILHOSBRASILEIROS').asInteger := 0;
  //  end;
  //end;
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim

end;

procedure TfrmCadFunc.cbbDESCCONTRIBPREVChange(Sender: TObject);
begin
  inherited;
  {if (CdsPessoaFisica.State in [dsInsert, dsEdit]) then begin
    case cbbDESCCONTRIBPREV.ItemIndex of
      0: CdsPessoaFisica.FieldByName('DESCCONTRIBPREV').AsInteger := 1;
      1: CdsPessoaFisica.FieldByName('DESCCONTRIBPREV').AsInteger := 2;
      2: CdsPessoaFisica.FieldByName('DESCCONTRIBPREV').AsInteger := 3;
    end;
  end; }
end;

procedure TfrmCadFunc.dblkpcbbIndicativoSuspChange(Sender: TObject);
begin
  inherited;
//  if (CdsProcessos.State in [dsInsert, dsEdit]) then
//    CdsProcessos.FieldByName('idindicatsusp').AsString   := dblkpcbbIndicativoSusp.Text;
end;

procedure TfrmCadFunc.dbrgrpINDICATDEPOSITOChange(Sender: TObject);
begin
  inherited;
  //if (CdsProcessos.State in [dsInsert, dsEdit]) then begin
  //if (dbrgrpINDICATDEPOSITO.Value = '1') then
  //  CdsProcessos.FieldByName('indicativodeposito').AsString := 'Sim'
  //else
  //  CdsProcessos.FieldByName('indicativodeposito').AsString := 'Não';
  //end;
end;

procedure TfrmCadFunc.dbrgrpAUTORACAOChange(Sender: TObject);
begin
  inherited;
  if (CdsProcessos.State in [dsInsert, dsEdit]) then begin
  //if (dbrgrpAUTORACAO.Value = '1') then //Everson Cunha - SIG90602
    if (dbrgrpAUTORACAO.Value = 'S') then   //Everson Cunha - SIG90602
      CdsProcessos.FieldByName('autorac').AsString := 'Sim'
    else
      CdsProcessos.FieldByName('autorac').AsString := 'Não';
  end;
end;

procedure TfrmCadFunc.LimpaCamposProcessos;
begin
  cbbTipoProc.Text := '';
  cbbTipoProc.ItemIndex := -1; //Everson Luiz SIG70569
  edtNumeroProc.Text := '';
  edtDataInicio.Text := '';
  edtDataFim.Text := '';
  //dblkpcbbIndicativoSusp.Text := ''; //Cássio Rovaroto - SIG nº 38475.59780
  dblkpcbbIDCIDADES.Text := '';
  edtUFSecaoJud.Text := '';
  edtCodMunicipio.Text := '';
  edtCODIDENTVARA.Text := '';
  //edtDataDecisao.Text := ''; //Cássio Rovaroto - SIG nº 38475.59780
  cbbCONTRIABRANDECISAO.Text := '';
  cbbCONTRIABRANDECISAO.ItemIndex := -1; //Everson Luiz SIG70569
  //cbbIndicaDecisao.Text := ''; //Everson Luiz SIG70569
  //cbbApurFap.Text := ''; //Everson Luiz SIG70569
  cmbMatProc.Text := '';
  cmbMatProc.ItemIndex := -1; //Everson Luiz SIG70569
end;

procedure TfrmCadFunc.dblckSitRiscoChange(Sender: TObject);
begin
  inherited;

  if CdsPessoaFisica.State in [dsInsert, dsEdit] then begin
    if ((dblckSitRisco.Text <> '') and (cdsSitRisco.FieldByName('FLGMULTVINCULOS').AsInteger = 1)) then
      begin
        ObrigaVinculo := True;
        cbbDESCCONTRIBPREV.Enabled := True;
      end
    else
      begin
        ObrigaVinculo := False;
        cbbDESCCONTRIBPREV.Enabled := False;
        cbbDESCCONTRIBPREV.Text := '';
        CdsPessoaFisica.FieldByName('DESCCONTRIBPREV').Value := null;
      end;
  end
  else begin
      case CdsPessoaFisica.FieldByName('DESCCONTRIBPREV').AsInteger of
          1: cbbDESCCONTRIBPREV.ItemIndex := 0;
          2: cbbDESCCONTRIBPREV.ItemIndex := 1;
          3: cbbDESCCONTRIBPREV.ItemIndex := 2;
      else begin
         cbbDESCCONTRIBPREV.ItemIndex := -1;
         cbbDESCCONTRIBPREV.Enabled := False;
         end
      end;
  end;
end;
//Término - Michelle Mota - SOL: 250384.17324 - PPM: 1070235

//Darivaldo Alencar  SIG 20673 -inicio
Function TfrmCadFunc.VerificaEnderecoAtivo(iContaSim: Integer): Boolean;
var
   CdsAux: TCmClientDataSet;
begin
  Result := True;
  CdsAux:= TCmClientDataSet.create(nil);
  CdsAux.CloneCursor(CdsEndereco, true, true);

  CdsAux.first;
  while not(CdsAux.eof) do
  begin
    if (CdsAux.FieldByName('FLGATIVO').AsString = 'S') then
       iContaSim := iContaSim + 1;
    CdsAux.next;
  end;

  if (iContaSim > 1) then
  begin
     MsgDlg('Existe mais de um endereço ativo cadastrado para o funcionário.'+#13+'Verifique!','Aviso',mtWarning,[mbOK],0);
     Result := False
  end
  else
    Result := True;

  FreeAndNil(CdsAux);
end;
//Darivaldo Alencar  SIG 20673 -fim

// Início - Michelle Mota - SIG 20673
procedure TfrmCadFunc.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  CdsEndereco.Filtered := False;

  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  if pgctrlDetalhe.ActivePage = tbsProcessos then
  begin
    cdsProcessosXIndicativoSusp.First;
    while not cdsProcessosXIndicativoSusp.Eof do
    begin
      cdsProcessosXIndicativoSusp.Delete;
      cdsProcessosXIndicativoSusp.Next;
    end;
    cdsProcessos.Cancel;
    bbtnVoltarDetClick(Sender);
  end;
  //Cássio - SIG nº 38475.59780 - Fim
end;

procedure TfrmCadFunc.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  CdsEndereco.Filtered := False;
end;

procedure TfrmCadFunc.CdsEnderecoFLGATIVOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.value = 'S' then
    Text := 'Sim'
  else if Sender.value = 'N' then
    Text := 'Não'
  else
    Text := '';
end;

procedure TfrmCadFunc.CdsTelefoneFLGATIVOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.value = 'S' then
    Text := 'Sim'
  else if Sender.value = 'N' then
    Text := 'Não'
  else
    Text := '';
end;  

procedure TfrmCadFunc.CdsContatoFLGATIVOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.value = 'S' then
    Text := 'Sim'
  else if Sender.value = 'N' then
    Text := 'Não'
  else
    Text := '';
end;

procedure TfrmCadFunc.CmpCidadesApertouBotao(Sender: TObject);
begin
  inherited;
  //Darivaldo Alencar SIG 20673 -inicio
  if (dbchkEndAtivo.checked) then
     valorflgativo := 'S'
  else
     valorflgativo := 'N';
  //Darivaldo Alencar SIG 20673 -fim
end;

procedure TfrmCadFunc.CmpCidadesValidaDados(Sender: TObject);
begin
  inherited;
  CdsEnderecoFLGATIVO.asString := valorflgativo;
  dbchkEndAtivo.Checked := (valorflgativo = 'S');
end;
// Término - Michelle Mota - SIG 20673


procedure TfrmCadFunc.dbePercRatAlimentClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG27550}
  dbePercRatAliment.SelectAll;
  VerAltHistBenef;
  {Término - Michelle Mota - SIG27550}
end;

procedure TfrmCadFunc.cbbAnoHistAlterChange(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG27550}
  CdsGridHistAlterBenef.Data := CtrlHistAlterBenef.ListGridHistAlteraBenef(CdsSubTipo.FieldByName('IdPessoa').AsString, (cbbAnoHistAlter.Text));
  {Término - Michelle Mota - SIG27550}
end;

procedure TfrmCadFunc.dbePercRatAlimentEnter(Sender: TObject);
begin
  inherited;
  VerAltHistBenef;// Michelle Mota - SIG27550}
end;

procedure TfrmCadFunc.dbePercRatRefeiClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG27550}
  dbePercRatRefei.SelectAll;
  VerAltHistBenef;
  {Término - Michelle Mota - SIG27550}
end;

procedure TfrmCadFunc.dbePercRatRefeiEnter(Sender: TObject);
begin
  inherited;
  VerAltHistBenef;// Michelle Mota - SIG27550}
end;

procedure TfrmCadFunc.chb_ContaInativaClick(Sender: TObject);
begin
  inherited;
  {Início - Michelle Mota - SIG27550}
  if (chb_ContaInativa.Checked) then
    containativa := 'Sim'
  else
    containativa := 'Não';
  {Término - Michelle Mota - SIG27550}
end;

procedure TfrmCadFunc.HabDesabBenef(controle : Boolean);
begin
  {Início - Michelle Mota - SIG27550}
  dbePercRatAliment.Enabled := controle;
  dbePercRatRefei.Enabled := controle;
  cbbAnoHistAlter.Enabled := controle;
  {Término - Michelle Mota - SIG27550}
end;

procedure TfrmCadFunc.VerAltHistBenef;
begin
  {Início - Michelle Mota - SIG27550}
  if (dbePercRatAliment.ReadOnly) then
    MsgDlg('Permitido apenas 4 alterações por ano.', 'Aviso', mtWarning, [mbOk], 0);
  {Término - Michelle Mota - SIG27550}
end;

procedure TfrmCadFunc.DefineHabDadosEstagio(pHabilita: boolean);
begin
  grbInfoEstagio.Enabled := pHabilita;

  if pHabilita then
    grbInfoEstagio.Font.Color := clWindowText
  else
    grbInfoEstagio.Font.Color := clBtnShadow;

  lblNaturEstagio.Enabled := pHabilita;
  rbObrigatorio.Enabled := pHabilita;
  rbNObrigatorio.Enabled := pHabilita;

  lblNivelEstag.Enabled := pHabilita;
  dbcmbNivelEstag.Enabled := pHabilita;

  lblAreaAtu.Enabled := pHabilita;
  dbedtAreaAtu.Enabled := pHabilita;

  lblNumApolSeguro.Enabled := pHabilita;
  dbedtNumApolSeguro.Enabled := pHabilita;

  lblInsEnsino.Enabled := pHabilita;
  dbedtInsEnsino.Enabled := pHabilita;
  sbtnInsEnsino.Enabled := pHabilita;

  lblAgenIntegracao.Enabled := pHabilita;
  dbedtAgenIntegracao.Enabled := pHabilita;
  sbtnAgenIntegracao.Enabled := pHabilita;

  grbSpVisorEstag.Enabled := pHabilita;
  if pHabilita then
    grbSpVisorEstag.Font.Color := clWindowText
  else
    grbSpVisorEstag.Font.Color := clBtnShadow;

  lblNomeSpVisorEstag.Enabled := pHabilita;
  dbedtNomeSprvisor.Enabled := pHabilita;
  sbtnSupervisor.Enabled := pHabilita;
  lblCPFspVisorEstag.Enabled := pHabilita;
  dbedtCPFspvisor.Enabled := pHabilita;
end;

procedure TfrmCadFunc.DefineHabDadosCessao(pHabilita: boolean);
begin
  grbCessaoTrab.Enabled := pHabilita;

  if pHabilita then
    grbCessaoTrab.Font.Color := clWindowText
  else
    grbCessaoTrab.Font.Color := clBtnShadow;

  lblCodEsocial.Enabled := pHabilita; //Everson Cunha - SIG38475
  edtCodEsocial.Enabled := pHabilita; //Everson Cunha - SIG38475

  lblCNPJEmpCed.Enabled := pHabilita;
  dbedtCNPJEmpCed.Enabled := pHabilita;

  lblMatriculaCessao.Enabled := pHabilita; //Everson Cunha - SIG38475
  edtMatriculaCessao.Enabled := pHabilita; //Everson Cunha - SIG38475

  lblDtAdmisCessao.Enabled := pHabilita;
  dbedDtAdmisCes.Enabled := pHabilita;
end;

procedure TfrmCadFunc.dbLkpCbxIndSuspChange(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  if cdsIndicativoSusp.FieldByName('INDSUSP').AsString = '90' then
  begin
     rdGrpIndDeposito.ItemIndex := 0;
     rdGrpIndDeposito.Enabled := False;
  end
  else
  if cdsIndicativoSusp.FieldByName('INDSUSP').AsString = '02'   then
  begin
     rdGrpIndDeposito.ItemIndex := 1;
     rdGrpIndDeposito.Enabled := False;
  end
  else
	if cdsIndicativoSusp.FieldByName('INDSUSP').AsString = '03'   then
  begin
     rdGrpIndDeposito.ItemIndex := 1;
     rdGrpIndDeposito.Enabled := False;
  end
  else
  begin
    rdGrpIndDeposito.ItemIndex := -1;
    rdGrpIndDeposito.Enabled := True;
  end;
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
end;

procedure TfrmCadFunc.cmbMatProcChange(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  if (CdsProcessos.State in [dsInsert, dsEdit]) then
  begin
    case cmbMatProc.ItemIndex of
      0: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 1;
      //Everson Cunha - SIG38475 - Ini
      {1: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 2;
      2: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 3;
      3: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 4;
      4: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 5;
      5: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 6;
      6: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 7;
      7: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 8;
      8: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 99;}
      1: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 7;
      //Everson Cunha - SIG38475 - Fim
    end;

    CdsProcessos.FieldByName('CODMATPROCDESC').AsString := cmbMatProc.Text;
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
  end;
end;

procedure TfrmCadFunc.btnDockIndSuspOKClick(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto -  SIG nº 38475.59780 - Início
  if dbLkpCbxIndSusp.Value = EmptyStr then
  begin
    Application.MessageBox('É obrigatória a definição do Indicativo de Suspensão da Exigibilidade.', PChar(ExtractFileName(Application.Title)), MB_ICONWARNING);
    dbLkpCbxIndSusp.SetFocus;
    Exit;
  end;

  if dbDtpDtDecisao.Text = '' then
  begin
    Application.MessageBox('É obrigatória a informação da Data de Decisão da Suspensão.', PChar(ExtractFileName(Application.Title)), MB_ICONWARNING);
    dbDtpDtDecisao.SetFocus;
    Exit;
  end;

  if rdGrpIndDeposito.ItemIndex =  -1 then
  begin
    Application.MessageBox('É necessário informar a existência, ou não, de Depósito Integral do Montante.', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
    Exit;
  end;

  if cdsProcessosXIndicativoSusp.State in [dsInsert, dsEdit] then
  begin
  	cdsProcessosXIndicativoSusp.FieldByName('INDICATDEPOSITO').AsInteger := rdGrpIndDeposito.ItemIndex;

    case rdGrpIndDeposito.ItemIndex of
    	0: cdsProcessosXIndicativoSusp.FieldByName('DEPOSITO').AsString := 'Não';
    	1: cdsProcessosXIndicativoSusp.FieldByName('DEPOSITO').AsString := 'Sim';
    end;

    cdsProcessosXIndicativoSusp.FieldByName('INDICATIVO').AsString := dbLkpCbxIndSusp.Value;
    cdsProcessosXIndicativoSusp.FieldByName('IDPROCESSO').asInteger := fIdProcesso;         

    cdsProcessosXIndicativoSusp.Post;
    btnDockIndSuspVoltarClick(Self);
  end;
  //Cássio Rovaroto -  SIG nº 38475.59780 - Fim
end;

procedure TfrmCadFunc.btnDockIndSuspVoltarClick(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  DockDetIndSusp.Visible := False;
  dbGrdProcessoIndSusp.BringToFront;
  toolbtnInserirIndSusp.Enabled := True;
  toolbtnAlterarIndSusp.Enabled := True;
  toolbtnExcluirIndSusp.Enabled := True;
  toolbtnInserirIndSusp.Down := False;
  toolbtnAlterarIndSusp.Down := False;
  toolbtnExcluirIndSusp.Down := False;

  cdsProcessosXIndicativoSusp.Cancel;

  cdsProcessosXIndicativoSusp.Filtered := False;
  cdsProcessosXIndicativoSusp.Filter := 'IDPROCESSO = ' + cdsProcessos.FieldByName('IDPROCESSO').AsString;
  cdsProcessosXIndicativoSusp.Filtered := True;
  
  if cdsProcessosXIndicativoSusp.RecordCount = 0 then
  begin
    toolbtnAlterarIndSusp.Enabled := False;
    toolbtnExcluirIndSusp.Enabled := False;
  end;
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
end;

procedure TfrmCadFunc.pgcProcessosChange(Sender: TObject);
begin
  inherited;

  if pgcProcessos.ActivePage = tbsIndicativoSusp then
  begin
    if (cdsProcessos.State in [dsInsert, dsEdit])  then
    begin
    	if (cbbTipoProc.ItemIndex = -1) then
      begin
      	pgcProcessos.ActivePageIndex := pgcProcessos.ActivePageIndex - 1;
  			pgcProcessos.OnChange(Self);
      	Application.MessageBox('É necessário definir o Tipo do Processo antes de indicar as informações de Suspensão da Exigibilidade.', PChar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      	cbbTipoProc.SetFocus;
      	Abort;
      end
      else
      begin
        if (cdsProcessos.FieldByName('IDPROCESSO').asInteger <= 0) and not(bPossuiIndicativo) then
        begin
        	cdsProcessosXIndicativoSusp.Data := TCtrlPessoaFuncionario(Pessoa).SelProcessosXIndicativoSusp(Cds.FieldByName('IDPESSOA').asInteger);
          bPossuiIndicativo := true;
        end;
        bbtnOkDet.Enabled := False;
        bbtnCancelarDet.Enabled := False;
        bbtnVoltarDet.Enabled := False;

        cdsProcessosXIndicativoSusp.Filtered := False;
  			cdsProcessosXIndicativoSusp.Filter := 'IDPROCESSO = ' + cdsProcessos.FieldByName('IDPROCESSO').AsString;
  			cdsProcessosXIndicativoSusp.Filtered := True;

        case cbbTipoProc.ItemIndex of
      		0: CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('A');
        	1: CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('J');
        	//2: CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('N'); //Everson Cunha - SIG38475
          2: CdsIndicativoSusp.Data := CtrlListTerceirosRH.ListIndicativoSusp('F'); //Everson Cunha - SIG38475
      	end;
      end;
     //Cássio Rovaroto - SIG nº 38475.59780 - Fim
    end;
  end
  else
  begin
    bbtnOkDet.Enabled := True;
    bbtnCancelarDet.Enabled := True;
    bbtnVoltarDet.Enabled := True;

    if cdsProcessosXIndicativoSusp.RecordCount = 0 then
    begin
    	toolbtnAlterarIndSusp.Enabled := False;
    	toolbtnExcluirIndSusp.Enabled := False;
    end;
  end;
end;

procedure TfrmCadFunc.toolbtnInserirIndSuspClick(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  dbLkpCbxIndSusp.Text:= '';
  dbDtpDtDecisao.TExt:= '';
  rdGrpIndDeposito.ItemIndex := -1;
  toolbtnInserirIndSusp.Down := True;
  toolbtnAlterarIndSusp.Enabled := False;
  toolbtnExcluirIndSusp.Enabled := False;
  DockDetIndSusp.Visible := True;
  btnDockIndSuspOK.Visible := True;
  btnDockIndSuspCanc.Visible := True;
  btnDockIndSuspVoltar.Visible := True;
  dbGrdProcessoIndSusp.SendToBack;
  dbLkpCbxIndSusp.SetFocus;
  
  cdsProcessosXIndicativoSusp.Insert;
  cdsProcessosXIndicativoSusp.FieldByName('IDPROCESSOSXINDICATIVOSUSP').AsInteger :=  TCtrlPessoaFuncionario(Pessoa).GetProxIdProcessosXIndicativoSusp;

  sTipoOperacao := 'Insert';
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
end;

procedure TfrmCadFunc.toolbtnAlterarIndSuspClick(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  toolbtnAlterarIndSusp.Down := True;
  toolbtnInserirIndSusp.Enabled := False;
  toolbtnExcluirIndSusp.Enabled := False;
  DockDetIndSusp.Visible := True;
  btnDockIndSuspOK.Visible := True;
  btnDockIndSuspCanc.Visible := True;
  btnDockIndSuspVoltar.Visible := True;
  dbGrdProcessoIndSusp.SendToBack;
  rdGrpIndDeposito.ItemIndex := cdsProcessosXIndicativoSusp.FieldByName('INDICATDEPOSITO').AsInteger;


  cdsProcessosXIndicativoSusp.Edit;
  sTipoOperacao := 'Update';
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
end;

procedure TfrmCadFunc.toolbtnExcluirIndSuspClick(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  if (MsgDlg('Deseja realmente excluir este registro?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
  begin
    cdsProcessosXIndicativoSusp.Delete;
  end;
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
end;

procedure TfrmCadFunc.LimpaCamposProcesso;
begin
  cbbTipoProc.Text := '';
  edtUFSecaoJud.Text := '';
  edtCodMunicipio.Text := '';
  dbrgrpAUTORACAO.ItemIndex := -1;
end;

procedure TfrmCadFunc.CmeDetalheDelete(Sender: TObject);
begin
  //Cássio Rovaroto - SIG nº 38475.59780 - Início
  if pgctrlDetalhe.ActivePage = tbsProcessos then
  begin
    if cdsProcessosXIndicativoSusp.RecordCount > 0 then
    begin
      while not cdsProcessosXIndicativoSusp.Eof do
      begin
        cdsProcessosXIndicativoSusp.Delete;
        cdsProcessosXIndicativoSusp.Next;
      end;
    end;
  end;
  //Cássio Rovaroto - SIG nº 38475.59780 - Fim
  inherited;
end;

procedure TfrmCadFunc.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;

  //Cássio Rovaroto - SIG 38475.59780 - Início
  if pgctrlDetalhe.ActivePage = tbsDadosPess then
  begin
    if dbrgContrPrev.ItemIndex = 0 then
      MsgDlg('Favor inserir os dados do processo relacionado a isenção de Contribuição Previdenciária.', 'Aviso', mtWarning, [mbOk], 0);

    if dbrgIsento.ItemIndex = 0 then
    	MsgDlg('Favor inserir os dados do processo relacionado a isenção de Imposto de Renda.', 'Aviso', mtWarning, [mbOk], 0);
  end;
  //Cássio Rovaroto - SIG 38475.59780 - Fim
end;

procedure TfrmCadFunc.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
	 if pgctrlDetalhe.ActivePage = tbsProcessos then
		LimpaCamposProcessos;
end;

procedure TfrmCadFunc.dblkpcbbIDCIDADESExit(Sender: TObject);
begin
  inherited;
  if (CdsProcessos.State in [dsInsert, dsEdit]) then
  begin
    edtUFSecaoJud.Text := CdsCidadeMunicipio.FieldByName('CODESTADO').AsString;
    edtCodMunicipio.Text := CdsCidadeMunicipio.FieldByName('CODMUNICIPIO').AsString;
    CdsProcessos.FieldByName('nomecidade').AsString :=  dblkpcbbIDCIDADES.Text;
    CdsProcessos.FieldByName('uf').AsString :=  edtUFSecaoJud.Text;
    CdsProcessos.FieldByName('codmunicipio').AsString :=  edtCodMunicipio.Text;
  end;
end;

end.


