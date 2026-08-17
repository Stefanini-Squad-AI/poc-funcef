 unit FCadEvolFuncPrev;

{ Alterações:
---------------------------------------------------------------------------------------------------
Pendência   : SIG 98745
Responsável : Rafael Vasconcelos
Data        : 12/03/2020
Descrição   : Opção para alterar a rubrica MG30 em tela.
---------------------------------------------------------------------------------------------------
Pendência   : SSIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 27/02/2018
Descrição   : Melhoria no Planus para adequação ao TIBERO.
              Inclusão de alias nas tabelas e campos.
              Retirar INDEX, +rule etc
---------------------------------------------------------------------------------------------------
Pendência   : SOL 180917 KTN 1706762
Responsável : Felipe Azevedo dos Santos
Data        : 23/07/2013
Descrição   : Somente permitir alterações quando o IDPESSJUR do participante for igual a
              91008(caixa).
---------------------------------------------------------------------------------------------------
Pendência   : SOL 201305 Kintana 1958008
Responsável : Fernando Xavier
Data        : 11/03/2013
Descrição   : Ajustar consulta colocando o outher join no idplanoprev para a Qry.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 202904 KINTANA 1963731
Responsável : Monica da Silva Gonzaga
Data        :23/03/2013
Descrição   : Exclusão do UPDATE DATAFINAL=NULL
---------------------------------------------------------------------------------------------------
Pendência   : SOL 201035 KINTANA 1943436
Responsável : William Moreira da Silva
Data        : 20/02/2013
Descrição   : Erro ao vizualizar as evoluções funcionais dos não participantes.
              Alteração apenas no dfm.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 197680 KINTANA 1894473
Responsável : Otacilio Aquino
Data        : 03/01/2013
Descrição   : Implementado o campo DATAFIM na consulta de periodo do cargo informado.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 187866 KINTANA 1780115
Responsável : José Roberto Marque - JRM6
Data        : 04/10/2012
Descrição   : Passa a contemplar os campos : dias, descricao, modo;
---------------------------------------------------------------------------------------------------
Pendência   : SOL 182293 KINTANA 1699025
Responsável : Fernando Xavier
Data        : 15/06/2012
Descrição   : Erro ao tentar excluir ATS matricula para testes 3472202 .
---------------------------------------------------------------------------------------------------
Pendência   : SOL 162100 KINTANA 1374819
Responsável : Fernando Xavier
Data        : 27/07/2011
Descrição   : Ajustar consulta passando o idplanoprev para a Qry.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 159682 KINTANA 1321743
Responsável : Fanuel Junior
Data        : 15/06/2011
Descrição   : Corrigido ao excluir o cargo da situação cadastrada de Assistido
---------------------------------------------------------------------------------------------------
Pendência   : SOL 150774 KINTANA 1097199
Responsável : FERNANDO XAVIER
Data        : 14/01/2011
Descrição   :  Inconsistência ao inserir função para o participante
---------------------------------------------------------------------------------------------------
Pendência   : SOL 146435 KINTANA 996974
Responsável : Ádler Souza
Data        : 25/10/2010
Descrição   : Ajuste na Query que traz os participantes com FLGDESATIVADO a 0.
---------------------------------------------------------------------------------------------------
Pendência   : SOL 134106 KINTANA 803098
Responsável : BRUNO AZEVEDO
Data        : 11/05/2010
Descrição   : Ao abrir uma nova transação, verificar se ja não existe uma em aberto.
---------------------------------------------------------------------------------------------------
Autor     : Ádler Souza
Rotina    : Cadastro de evolução funcional
Pendência : SOL 126672 Kintana 668660
Data      : 13/11/2009
Descrição : Filtrando a passagem dos valores chaves do monta select para os paramentros
da qryfuncao, para que seja passado somente se ele não vier de outra tela.
---------------------------------------------------------------------------------------------------
Autor     : Henrique Massão
Rotina    : Cadastro de evolução funcional
Pendência : SOL 67138 Kintana 525172
Data      : 16/06/2009
Descrição : Foi habilitado alterar a data inicial de forma manual pelo usuário.
---------------------------------------------------------------------------------------------------
Autor     : Jéssica Lana
Rotina    : Cadastro de Evolução funcional
Pendência : SOL 116427 Kintana 546727
Data      : 11/08/2009
Descrição : Alterações nas propriedades da tela (Codigo do cargo)
---------------------------------------------------------------------------------------------------
Autor     : Ádler Souza
Rotina    : Cadastro de Evolução funcional
Pendência : SOL 121368 Kintana 589276
Data      : 14/07/2009
Descrição : Alterações nas propriedades da tela e ao chamar o form.
---------------------------------------------------------------------------------------------------
Autor     : Renato Visoni
Rotina    : Cadastro de Evglução funcional
Pendência : SOL 116261 Kintana 572991
Data      : 19/06/2009
Descrição : Foi alterada a query qry.
---------------------------------------------------------------------------------------------------
Autor     : Renato Visoni
Rotina    : Cadastro de Evglução funcional
Pendência : SOL 116572 Kintana 547247
Data      : 19/06/2009
Descrição : Foi alterada as propriedades WindowsState para Normal
-------------------------------
--------------------------------------------------------------------
Autor     : Henrique Massão
Rotina    : Cadastro de evgolução funcional
Pendência : SOL 119793 Kintana 570601
Data      : 15/06/2009
Descrição : Foi alterada a qryFuncao a qual avaia o campo SEQHISTFUNC duplicado.
---------------------------------------------------------------------------------------------------
Autor     : Renato Visoni
Rotina    : VerificaEfetivaSemData,IniciaVariavel
Pendência : Sol 94508 \ Kintana 407724
Data      : 01/09/2008
Descrição : Ajuste no fonte para aparecer crítica quando o usuário inserir mais de uma função efetiva
            no histórico de evolução funcional do participante, criei a função VerificaEfetivaSemData
            utilizando a SQL que ja existia no fonte e uma procedure IniciaVariavel, utilizada para
            controlar a quantidade de itens que foram inseridos e que foram deletados, fazendo com que
            o sistema nunca permita incluir 2 registros efetivos com a data em branco.
            As Variaveis utilizadas foram iQntInicial,iDeletado,bDataBranco.
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Rotina    : -
Pendência : 26788
Data      : 25/01/2008
Descrição : Correção da exibição da "Situação (Categoria)", na aba de Cargo
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Rotina    : nova CmeDetalheBeforeConfirma(...)
Pendência : 26261
Data      : 03/01/2008
Descrição : Verificação de existência se mais de uma função efetiva sem data final antes da gravação
----------------------------------------------------------------------------------------------------
Autor     : André Pontes
Rotina    : - (qryAdicIncorp)
Pendência : 26797
Data      : 09/11/2007
Descrição : Corrigida query do adicional de incorporação, que estava com o mesmo filtro do
            adicional de compensação
----------------------------------------------------------------------------------------------------
Autor     : Claudio Faria
Rotina    : Varias
Pendência : 19962
Data      : 16/08/2007
Descrição : Troca do DateToStr para FormatDateTime
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : Diversos
Pendência : 25792
Data      : 12/07/2007
Descrição : Criação do cadastro de adicional de Incorporação
----------------------------------------------------------------------------------------------------
Autor     : Bruno Bastos
Rotina    :
Pendência : 22599
Data      : 20/06/2006
Descrição : Alteração de SQL dentro dos componentes qryFuncao e
            qryAdicCompens para adicionar novo código de modofuncao.
----------------------------------------------------------------------------------------------------
Autor     : Paulo Ramos
Rotina    : CmeDetalheConfirma
Pendência : 21972
Data      : 03/04/2006
Descrição : Coloquei nvl(percfuncao) na atualização da função na Elegpatro
            para não pegar os registros da evolfuncprev que sejam adicional
            compensatório sobre funções. Estes registros tem o campo idfuncao
            preenchido, mas tem o percfuncao nulo.
----------------------------------------------------------------------------------------------------
Autor     : Leo
Rotina    : qryrubsalarial
Pendência : 20647
Data      : 18/11/2005
Descrição : retirei a cláusula AND   H.TIPOITEMPCS = 1  da query qryrubsalarial
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Rotina    : QryAdicCompens
Pendência : 19106
Data      : 16/05/2005
Descrição : Trazer apenas a ultima vigencia do cadastro
----------------------------------------------------------------------------------------------------
Autor     : Gleyber
Rotina    : - Tela -
Pendência : 18183
Data      : 30/11/2004
Descrição : Acréscimo do campo de segundo percentual (PERC2A)
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Rotina    : Adicional compensatorio
Data      : 26/11/2004
----------------------------------------------------------------------------------------------------
Autor     : Augusto
Descrição : Acerto do cadastro
Rotina    : CmeCadastroConfirma
Pendência : 17938
Data      : 11/11/2004
Descrição : Caso vindo de um evento não confirma e reabrir uma transação, que o padrão
            faz automaticamente
----------------------------------------------------------------------------------------------------
Autor     : LeoFuncef
Rotina    : CmeDetalheConfirma
Pendência : ---
Data      : 09.11.2004
Descrição : apenas atualiza a função caso ela seja efetiva (MODOFUNCAO = 'EF')
----------------------------------------------------------------------------------------------------
Autor     : LeoFuncef
Rotina    : CmeDetalheConfirma
Pendência : ---
Data      : 10.05.2004
Descrição : acerto na modificação abaixo
----------------------------------------------------------------------------------------------------
Autor     : LeoFuncef
Rotina    : CmeDetalheConfirma
Pendência : ---
Data      : 26.04.2004
Descrição : Ataulização do cargo e função da ELEGPATRO
----------------------------------------------------------------------------------------------------
Autor     : Camille
Rotina    : PermiteAlteracaoPorExcecao
Pendência : ---
Data      : 03.02.2004
Descrição : Cricao de rotina de controles de acesso por excecao
----------------------------------------------------------------------------------------------------
Rotina    : Diversas
Autor(a)  : Camille
Data      : 20.01.2004
Alteração : Abertura das querys retiradas do formshow e colocada no formcreate
            para atender aos casos em que o form é chamado por outro form
            já com as querys abertas
----------------------------------------------------------------------------------------------------
Rotina    : Diversas
Autor(a)  : Camille
Data      : 20.01.2004
Alteração : Controle de saída da tela. Só sair no click do sair, e não no
            OK e no Cancelar. Como a tela é fsNormal, o ok e o cancelar
            estão saindo da tela.
----------------------------------------------------------------------------------------------------
Rotina    : sbCalcSalMantidoClick
Autor(a)  : Camille
Data      : 13.01.2004
Alteração : acerto para chamar regra de salário de mantido parcial
----------------------------------------------------------------------------------------------------
Rotina    : sbCalcSalMantidoClick
Autor(a)  : Leo
Data      : 20.11.2003
Alteração : passar dataref como a data atual, para pegar os dados atualizados de cargos e funções.
            a data anterior era a própria data do evento. Neste caso, o cálculo sempre
            resultava o mesmo valor.
----------------------------------------------------------------------------------------------------
Rotina    : CmeCadastroFind
Autor(a)  : Leo
Data      : 19.11.2003
Alteração : adicionei MP na crítica que torna o calc. do sal. de manutenção visível
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 19.11.2003
Alteração : acerto da formataçãodo combo de cargo dblkpcmbCargoxNivel, que estava
            mostrando o código do cargo
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 19.11.2003
Alteração : modificações em qrydet, upddet para gravação correta dos cargos
            o parâmetro SEQHISTFUNC estava incorreto
----------------------------------------------------------------------------------------------------
Autor(a)  : Augusto FUNCEF
Data      : 13/11/2003
Alteração : Inclusao do campo FLGDIRETOR na query do calculo do Sal. Mantido
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 23.10.2003
Alteração : Alteração da propriedade FormStyle para fsNormal e Visible False
            para chamar com o ShowModal na tela de Retroativo
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 02.10.2003
Alteração : Acrescimo do campo salario de manutenção para ser recalculado
           quando da alteracao de algum item da evolucao funcional
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 02.09.2003
Alteração : Alteração no filtro de multi-fundação que não pode ser por
            participante porque esta tela tem que mostrar pessoas que também
            não sejam participantes
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 01.09.2003
Alteração : Alteração em todas as querys e grids para acrescentar o campo
            situação cadastrada
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 26.08.2003
Alteração : Alteração na qryFUNCAO para mostrar o código da função diferente
            do grupo
----------------------------------------------------------------------------------------------------
Autor(a)  : Carlos Guedes
Data      : 30 e 31/07/2003
Alteração : A exibição dos dados na grid em cores diferenciadas pela situação
            foi alterada para indentificar pela origem (Cadastro / Interface)
----------------------------------------------------------------------------------------------------
Autor(a)  : Carlos Guedes
Data      : 30/07/2003
Alteração : Corrigindo a query QRY. Faltava uma left-join para satisfazer
            determinada condição na parte de TITULAR.
            AND    PP.IDSITPART        = SP.IDSITPART(+)
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 28.07.2003
Alteração : Coloquei o bInseriuDetalhe como publico para poder usar no
            FRetroativoPrev
----------------------------------------------------------------------------------------------------
Autor(a)  : Camille
Data      : 21.06.2003
Alteração : Inclusao do Filtro de MULTI-FUNDACAO
----------------------------------------------------------------------------------------------------
Rotina    : QRYDET
Autor(a)  : Leo
Data      : 18.06.2002
Alteração : modificação do componente QRYDET para inclusão de informações de nível salarial
----------------------------------------------------------------------------------------------------
Rotina    :
Autor(a)  : Leo
Data      : 15.04.2002
Alteração : modificação do componente QRY para inclusão do IDTITULAR
----------------------------------------------------------------------------------------------------
Rotina    : sbtnCalcEnquadramentoClick
Autor(a)  : Leo
Data      : 15.04.2002
Alteração : Inclusão do parâmetro de IDTITULAR
----------------------------------------------------------------------------------------------------
Rotina    : EnviaContribuicao
Autor(a)  : Camille
Data      : 01.04.2002
Alteração : Criação do novo modo de função na query qryModoFuncao
----------------------------------------------------------------------------------------------------
Augusto 28/08/2002 - Acerto na pesquisa de Dependente/Beneficiario
----------------------------------------------------------------------------------------------------}

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
    Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
    Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
    wwdblook, wwdbedit, DBCtrls2, Mask, wwdbdatetimepicker, CMDateTimePicker,
    CmEventosCadastro, ImgList, Wwdotdot, Wwdbcomb,DBClient;







type
  TfrmCadEvolFuncPrev = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    lblnome: TLabel;
    dbedNomeParticipante: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    Label8: TLabel;
    DBText3: TDBText;
    lblmat: TLabel;
    DBText5: TDBText;
    Label7: TLabel;
    DBText6: TDBText;
    Label4: TLabel;
    dbDataInicio: TCMDateTimePicker;
    lblTituloTipo: TLabel;
    qryFuncoes: TwwQuery;
    qryCargoxNivel: TwwQuery;
    qryVigenciaNivel: TwwQuery;
    qryVigenciaFuncao: TwwQuery;
    tbsFuncao: TTabSheet;
    tbsATS: TTabSheet;
    tbsRubSal: TTabSheet;
    pnlControlesFuncao: TPanel;
    dbgrdFuncao: TwwDBGrid;
    dsFuncao: TwwDataSource;
    updFuncao: TUpdateSQL;
    qryFuncao: TwwQuery;
    Label11: TLabel;
    Label12: TLabel;
    dblkpcmbFuncao: TwwDBLookupCombo;
    dbDataInicioFuncao: TCMDateTimePicker;
    dbgrdATS: TwwDBGrid;
    dbgrdRubSal: TwwDBGrid;
    dsATS: TwwDataSource;
    updATS: TUpdateSQL;
    qryATS: TwwQuery;
    pnlATS: TPanel;
    Label14: TLabel;
    dbDataInicioATS: TCMDateTimePicker;
    Label15: TLabel;
    dbDataFinalATS: TCMDateTimePicker;
    Label16: TLabel;
    dbedValorATS: TDBEdit2;
    dsRubSalarial: TwwDataSource;
    updRubSalarial: TUpdateSQL;
    qryRubSalarial: TwwQuery;
    pnlControlesRubSalarial: TPanel;
    qryProvDesc: TwwQuery;
    grpMesAnoRef: TGroupBox;
    GroupBox1: TGroupBox;
    dbedAnoMesRefRubSal: TwwDBEdit;
    dbedAnoMesCobRubSal: TwwDBEdit;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label17: TLabel;
    dbedValor: TwwDBEdit;
    dblkpcmbRubrica: TwwDBLookupCombo;
    spbtnCalcPercATS: TSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    qryModoFuncao: TwwQuery;
    dblkpcmbModoFuncao: TwwDBLookupCombo;
    Label20: TLabel;
    wwDBEdit1: TwwDBEdit;
    Label5: TLabel;
    dblkpcmbModoCargo: TwwDBLookupCombo;
    qryModoCargo: TwwQuery;
    tbsAdicInsalub: TTabSheet;
    tbsAdicPericul: TTabSheet;
    tbsAdicCompens: TTabSheet;
    tbsAdicNoturno: TTabSheet;
    pnlAdicCompensatorio: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    dblkpcmbFuncaoAdicCompens: TwwDBLookupCombo;
    dtInicioAdicCompens: TCMDateTimePicker;
    dtFimAdicCompens: TCMDateTimePicker;
    edPercAdicCompens: TwwDBEdit;
    dbgrdAdicCompens: TwwDBGrid;
    dbgrdAdicInsalub: TwwDBGrid;
    dbgrdAdicPericul: TwwDBGrid;
    dsAdicCompens: TwwDataSource;
    updAdicCompens: TUpdateSQL;
    qryAdicCompens: TwwQuery;
    Panel1: TPanel;
    Label13: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    SpeedButton1: TSpeedButton;
    dtInicioAdicInsalub: TCMDateTimePicker;
    dtFimAdicInsalub: TCMDateTimePicker;
    dbedPercInsalub: TDBEdit2;
    dsAdicInsalub: TwwDataSource;
    updAdicInsalub: TUpdateSQL;
    qryAdicInsalub: TwwQuery;
    dsAdicPericul: TwwDataSource;
    updAdicPericul: TUpdateSQL;
    qryAdicPericul: TwwQuery;
    Panel2: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    SpeedButton2: TSpeedButton;
    dtIniAdicPericul: TCMDateTimePicker;
    dtFIMAdicPericul: TCMDateTimePicker;
    dbedPercPericul: TDBEdit2;
    dsAdicNoturno: TwwDataSource;
    updAdicNoturno: TUpdateSQL;
    qryAdicNoturno: TwwQuery;
    pnlAdicNoturno: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    dtInicioAdicNoturno: TCMDateTimePicker;
    dtFimAdicNoturno: TCMDateTimePicker;
    dbedPercAdicNoturno: TDBEdit2;
    Label31: TLabel;
    dbedQtdeMinutos: TDBEdit2;
    Label32: TLabel;
    DBText1: TDBText;
    sbtnCalcEnquadramento: TSpeedButton;
    qryeventos: TwwQuery;
    dbcSituacao: TwwDBComboBox;
    qryaux: TwwQuery;
    Shape5: TShape;
    Label1: TLabel;
    Shape1: TShape;
    Label2: TLabel;
    qryFuncaoIDPESSJUR: TFloatField;
    qryFuncaoIDPESSOA: TFloatField;
    qryFuncaoSEQHISTFUNC: TFloatField;
    qryFuncaoIDPESSJURCG: TFloatField;
    qryFuncaoIDCARGOEXT: TFloatField;
    qryFuncaoIDPESSJURFG: TFloatField;
    qryFuncaoIDFUNCAO: TFloatField;
    qryFuncaoDATAINICIO: TDateTimeField;
    qryFuncaoDATAFINAL: TDateTimeField;
    qryFuncaoPERC1AC: TFloatField;
    qryFuncaoPERC2AC: TFloatField;
    qryFuncaoPERCATS: TFloatField;
    qryFuncaoPERCINSALUB: TFloatField;
    qryFuncaoPERCPERICUL: TFloatField;
    qryFuncaoPERCFUNCAO: TFloatField;
    qryFuncaoMODOFUNCAO: TStringField;
    qryFuncaoORIGEM: TStringField;
    qryFuncaoFLGSITPART: TStringField;
    qryFuncaoDESCORIGEM: TStringField;
    qryFuncaoDESCMODO: TStringField;
    qryFuncaoCODIGO: TStringField;
    qryFuncaoGRUPO: TStringField;
    qryFuncaoFUNCAO: TStringField;
    qryFuncaoSIT: TStringField;
    qryFuncaoDESCSIT: TStringField;
    qryAdicCompensIDPESSJUR: TFloatField;
    qryAdicCompensIDPESSOA: TFloatField;
    qryAdicCompensSEQHISTFUNC: TFloatField;
    qryAdicCompensIDPESSJURCG: TFloatField;
    qryAdicCompensIDCARGOEXT: TFloatField;
    qryAdicCompensIDPESSJURFG: TFloatField;
    qryAdicCompensIDFUNCAO: TFloatField;
    qryAdicCompensDATAINICIO: TDateTimeField;
    qryAdicCompensDATAFINAL: TDateTimeField;
    qryAdicCompensPERC1AC: TFloatField;
    qryAdicCompensPERC2AC: TFloatField;
    qryAdicCompensPERCATS: TFloatField;
    qryAdicCompensPERCINSALUB: TFloatField;
    qryAdicCompensPERCPERICUL: TFloatField;
    qryAdicCompensPERCFUNCAO: TFloatField;
    qryAdicCompensMODOFUNCAO: TStringField;
    qryAdicCompensORIGEM: TStringField;
    qryAdicCompensFLGSITPART: TStringField;
    qryAdicCompensDESCORIGEM: TStringField;
    qryAdicCompensDESCMODO: TStringField;
    qryAdicCompensCODIGO: TStringField;
    qryAdicCompensFUNCAO: TStringField;
    qryAdicCompensGRUPO: TStringField;
    qryAdicCompensSIT: TStringField;
    qryAdicCompensDESCSIT: TStringField;
    qryATSIDPESSJUR: TFloatField;
    qryATSIDPESSOA: TFloatField;
    qryATSSEQHISTFUNC: TFloatField;
    qryATSIDPESSJURCG: TFloatField;
    qryATSIDCARGOEXT: TFloatField;
    qryATSIDPESSJURFG: TFloatField;
    qryATSIDFUNCAO: TFloatField;
    qryATSDATAINICIO: TDateTimeField;
    qryATSDATAFINAL: TDateTimeField;
    qryATSPERC1AC: TFloatField;
    qryATSPERC2AC: TFloatField;
    qryATSPERCATS: TFloatField;
    qryATSPERCINSALUB: TFloatField;
    qryATSPERCPERICUL: TFloatField;
    qryATSPERCFUNCAO: TFloatField;
    qryATSMODOFUNCAO: TStringField;
    qryATSORIGEM: TStringField;
    qryATSFLGSITPART: TStringField;
    qryATSDESCORIGEM: TStringField;
    qryATSSIT: TStringField;
    qryATSDESCSIT: TStringField;
    qryAdicInsalubIDPESSJUR: TFloatField;
    qryAdicInsalubIDPESSOA: TFloatField;
    qryAdicInsalubSEQHISTFUNC: TFloatField;
    qryAdicInsalubIDPESSJURCG: TFloatField;
    qryAdicInsalubIDCARGOEXT: TFloatField;
    qryAdicInsalubIDPESSJURFG: TFloatField;
    qryAdicInsalubIDFUNCAO: TFloatField;
    qryAdicInsalubDATAINICIO: TDateTimeField;
    qryAdicInsalubDATAFINAL: TDateTimeField;
    qryAdicInsalubPERC1AC: TFloatField;
    qryAdicInsalubPERC2AC: TFloatField;
    qryAdicInsalubPERCATS: TFloatField;
    qryAdicInsalubPERCINSALUB: TFloatField;
    qryAdicInsalubPERCPERICUL: TFloatField;
    qryAdicInsalubPERCFUNCAO: TFloatField;
    qryAdicInsalubMODOFUNCAO: TStringField;
    qryAdicInsalubORIGEM: TStringField;
    qryAdicInsalubFLGSITPART: TStringField;
    qryAdicInsalubDESCORIGEM: TStringField;
    qryAdicInsalubSIT: TStringField;
    qryAdicInsalubDESCSIT: TStringField;
    qryAdicNoturnoIDPESSJUR: TFloatField;
    qryAdicNoturnoIDPESSOA: TFloatField;
    qryAdicNoturnoSEQHISTFUNC: TFloatField;
    qryAdicNoturnoIDPESSJURCG: TFloatField;
    qryAdicNoturnoIDCARGOEXT: TFloatField;
    qryAdicNoturnoIDPESSJURFG: TFloatField;
    qryAdicNoturnoIDFUNCAO: TFloatField;
    qryAdicNoturnoDATAINICIO: TDateTimeField;
    qryAdicNoturnoDATAFINAL: TDateTimeField;
    qryAdicNoturnoPERC1AC: TFloatField;
    qryAdicNoturnoPERC2AC: TFloatField;
    qryAdicNoturnoPERCATS: TFloatField;
    qryAdicNoturnoPERCINSALUB: TFloatField;
    qryAdicNoturnoPERCPERICUL: TFloatField;
    qryAdicNoturnoPERCFUNCAO: TFloatField;
    qryAdicNoturnoPERCADNOT: TFloatField;
    qryAdicNoturnoQTDEMINUTOS: TFloatField;
    qryAdicNoturnoMODOFUNCAO: TStringField;
    qryAdicNoturnoORIGEM: TStringField;
    qryAdicNoturnoFLGSITPART: TStringField;
    qryAdicNoturnoDESCORIGEM: TStringField;
    qryAdicNoturnoSIT: TStringField;
    qryAdicNoturnoDESCSIT: TStringField;
    qryAdicPericulIDPESSJUR: TFloatField;
    qryAdicPericulIDPESSOA: TFloatField;
    qryAdicPericulSEQHISTFUNC: TFloatField;
    qryAdicPericulIDPESSJURCG: TFloatField;
    qryAdicPericulIDCARGOEXT: TFloatField;
    qryAdicPericulIDPESSJURFG: TFloatField;
    qryAdicPericulIDFUNCAO: TFloatField;
    qryAdicPericulDATAINICIO: TDateTimeField;
    qryAdicPericulDATAFINAL: TDateTimeField;
    qryAdicPericulPERC1AC: TFloatField;
    qryAdicPericulPERC2AC: TFloatField;
    qryAdicPericulPERCATS: TFloatField;
    qryAdicPericulPERCINSALUB: TFloatField;
    qryAdicPericulPERCPERICUL: TFloatField;
    qryAdicPericulPERCFUNCAO: TFloatField;
    qryAdicPericulMODOFUNCAO: TStringField;
    qryAdicPericulORIGEM: TStringField;
    qryAdicPericulFLGSITPART: TStringField;
    qryAdicPericulDESCORIGEM: TStringField;
    qryAdicPericulSIT: TStringField;
    qryAdicPericulDESCSIT: TStringField;
    qrySitPart: TwwQuery;
    Label33: TLabel;
    dblkpcmbSitCargo: TwwDBLookupCombo;
    Label34: TLabel;
    qrySitPartFUNCAO: TwwDBLookupCombo;
    Label35: TLabel;
    dblkpcmbSitPartAdicCompens: TwwDBLookupCombo;
    Label36: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label37: TLabel;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label38: TLabel;
    wwDBLookupComboSit: TwwDBLookupCombo;
    Label39: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    qryFuncaoDESCSITCADASTRADA: TStringField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDPESSJURCG: TFloatField;
    qryDetIDCARGOEXT: TFloatField;
    qryDetIDPESSJURFG: TFloatField;
    qryDetIDFUNCAO: TFloatField;
    qryDetDATAINICIO: TDateTimeField;
    qryDetDATAFINAL: TDateTimeField;
    qryDetPERC1AC: TFloatField;
    qryDetPERC2AC: TFloatField;
    qryDetPERCATS: TFloatField;
    qryDetPERCINSALUB: TFloatField;
    qryDetPERCPERICUL: TFloatField;
    qryDetPERCFUNCAO: TFloatField;
    qryDetMODOFUNCAO: TStringField;
    qryDetORIGEM: TStringField;
    qryDetCODIGO: TStringField;
    qryDetDESCORIGEM: TStringField;
    qryDetDESCMODO: TStringField;
    qryDetDESCSITCADASTRADA: TStringField;
    qryDetCARGO: TStringField;
    qryDetFLGSITPART: TStringField;
    qryDetDESCSIT: TStringField;
    qryAdicCompensDESCSITCADASTRADA: TStringField;
    qryATSDESCSITCADASTRADA: TStringField;
    qryAdicInsalubDESCSITCADASTRADA: TStringField;
    qryAdicNoturnoDESCSITCADASTRADA: TStringField;
    qryAdicPericulDESCSITCADASTRADA: TStringField;
    qryDetSIT: TStringField;
    lblTitSalMantido: TLabel;
    sbCalcSalMantido: TSpeedButton;
    updSalManut: TUpdateSQL;
    qrySalManut: TwwQuery;
    dbSalMantido: TLabel;
    qryDetSEQHISTFUNC: TFloatField;
    dblkpcmbCargoxNivel: TwwDBLookupCombo;
    ed2PercAdicCompens: TwwDBEdit;
    Label40: TLabel;
    tbsAdicIncorp: TTabSheet;
    Panel3: TPanel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    dblkpcmbFuncaoAdicIncorp: TwwDBLookupCombo;
    dtInicioAdicIncorp: TCMDateTimePicker;
    CMDateTimePicker3: TCMDateTimePicker;
    edPercAdicIncorp: TwwDBEdit;
    dblkpcmbSitPartAdicIncorp: TwwDBLookupCombo;
    dbgrdAdicIncorp: TwwDBGrid;
    qryAdicIncorp: TwwQuery;
    dsAdicIncorp: TwwDataSource;
    updAdicIncorp: TUpdateSQL;
    qryAdicIncorpIDPESSJUR: TFloatField;
    qryAdicIncorpIDPESSOA: TFloatField;
    qryAdicIncorpSEQHISTFUNC: TFloatField;
    qryAdicIncorpIDPESSJURCG: TFloatField;
    qryAdicIncorpIDCARGOEXT: TFloatField;
    qryAdicIncorpIDPESSJURFG: TFloatField;
    qryAdicIncorpIDFUNCAO: TFloatField;
    qryAdicIncorpDATAINICIO: TDateTimeField;
    qryAdicIncorpDATAFINAL: TDateTimeField;
    qryAdicIncorpPERC1AC: TFloatField;
    qryAdicIncorpPERC2AC: TFloatField;
    qryAdicIncorpPERCATS: TFloatField;
    qryAdicIncorpPERCINSALUB: TFloatField;
    qryAdicIncorpPERCPERICUL: TFloatField;
    qryAdicIncorpPERCFUNCAO: TFloatField;
    qryAdicIncorpMODOFUNCAO: TStringField;
    qryAdicIncorpPERCINCORP: TFloatField;
    qryAdicIncorpORIGEM: TStringField;
    qryAdicIncorpFLGSITPART: TStringField;
    qryAdicIncorpDESCORIGEM: TStringField;
    qryAdicIncorpDESCMODO: TStringField;
    qryAdicIncorpDESCSITCADASTRADA: TStringField;
    qryAdicIncorpCODIGO: TStringField;
    qryAdicIncorpFUNCAO: TStringField;
    qryAdicIncorpGRUPO: TStringField;
    CMDateTimePicker2: TCMDateTimePicker;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    DBEdDias: TDBEdit;
    wwDBCBDescricao: TwwDBComboBox;
    qryAdicNoturnoDESCRICAO: TStringField;
    qryAdicNoturnoMODO: TStringField;
    qryAdicNoturnoDESCMODO: TStringField;
    wwDBCBModo: TwwDBComboBox;
    Label49: TLabel;
    qryAdicNoturnoQTDIAS: TFloatField;

    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure qryFuncaoBeforePost(DataSet: TDataSet);
    procedure qryATSBeforePost(DataSet: TDataSet);
    procedure qryRubSalarialBeforePost(DataSet: TDataSet);
    procedure dbedAnoMesRefRubSalExit(Sender: TObject);
    procedure dblkpcmbRubricaEnter(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure qryAdicCompensBeforePost(DataSet: TDataSet);
    procedure qryAdicInsalubBeforePost(DataSet: TDataSet);
    procedure qryAdicPericulBeforePost(DataSet: TDataSet);
    procedure qryAdicNoturnoBeforePost(DataSet: TDataSet);
    procedure sbtnCalcEnquadramentoClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dbgrdDetCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure qryDetCalcFields(DataSet: TDataSet);
    procedure dbgrdFuncaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure qryFuncaoCalcFields(DataSet: TDataSet);
    procedure qryAdicCompensCalcFields(DataSet: TDataSet);
    procedure dbgrdAdicCompensCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure qryATSCalcFields(DataSet: TDataSet);
    procedure dbgrdATSCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure qryAdicInsalubCalcFields(DataSet: TDataSet);
    procedure dbgrdAdicInsalubCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure qryAdicNoturnoCalcFields(DataSet: TDataSet);
    procedure dbgrdAdicNoturnoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure qryAdicPericulCalcFields(DataSet: TDataSet);
    procedure dbgrdAdicPericulCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure tbcDetalheChange(Sender: TObject);
    procedure sbCalcSalMantidoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdAdicIncorpCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure qryAdicIncorpCalcFields(DataSet: TDataSet);
    procedure qryAdicIncorpBeforePost(DataSet: TDataSet);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure DBEdDiasExit(Sender: TObject);
    procedure DBEdDiasEnter(Sender: TObject);


  private { Private declarations }

    bAlterouAlgumItem : boolean;
    bClickNoOKCancel  : boolean;
    bClickNoSair      : boolean;
    bDataBranco       : Boolean;
    

  public  { Public declarations }

    bEmTransacaoExterna : Boolean;
    bInseriuDetalhe : boolean;
    iQntInicial,iDeletado  : Integer;

    function  VerificaVigenciaNivel(piIdPessJur   : Longint;
                                        piIdCargoExt : longint;
                                    psDataRef     : string
                                   ): Boolean;

    function  VerificaVigenciaFuncao(piIdPessJur  : longint;
                                        piIdFuncao   : longint;
                                     psDataRef    : string
                                    ): Boolean;

    Function VerificaEfetivaSemData():Boolean;
    procedure pr_Data;
    Procedure IniciaVariavel();


  end;




var
  frmCadEvolFuncPrev: TfrmCadEvolFuncPrev;
  b_Erro            : Boolean = false;
  lFazRefresh       : Boolean;
  {SOL:187866 KTN:1780115 - JRM6}
  IQuantDias        : Integer;
  {SOL:187866 KTN:1780115 - JRM6}


implementation
{$R *.DFM}
uses
  DBaseDados,FAguarde, UMensErro, UDataBase, UPCS, DAPrev, UFuncoesUteis, UAdmPrev,
  USistema, DRelatAdmPREV2, UParticipante, FTelaAut;

procedure TfrmCadEvolFuncPrev.pr_Data ;
var  TSql : twwquery;
     dDataAux : string;
     dDataAux1 : Variant;

begin

     if dsDet.State = dsedit then
     begin
       TSql := Twwquery.Create(Self);
       TSql.databasename := 'BASEDADOS';
       TSql.sql.Clear;
       TSql.sql.Add(' select count(1) qtde FROM EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N '+
                    ' WHERE E.DATAFINAL is null'+
                    ' and E.seqhistfunc  <> '+ qryDet.FieldByName('seqhistfunc').AsString +
                    ' and E.IDPESSOA      = '+ qryDet.FieldByName('IDPESSOA').AsString +
                    ' AND E.IDPESSJUR     = '+ qryDet.FieldByName('IDPESSJUR').asString+
                    ' AND CE.IDCARGOEXT  = E.IDCARGOEXT'+
                    ' AND CE.IDPESSJUR   = E.IDPESSJUR'+
                    ' AND CN.IDPESSJUR   = CE.IDPESSJUR'+
                    ' AND CN.IDCARGOEXT  = CE.IDCARGOEXT'+
                    ' AND N.IDNIVEL      = CN.IDNIVEL'+
                    ' AND N.IDPESSJUR    = CN.IDPESSJUR');


       TSql.Open;
       if (TSql.fieldbyname('qtde').value > 0) and (qryDet.FieldByName('DATAFINAL').AsString = '') then
       begin
         messagedlg('Funcionário já possui um cargo em aberto.',mterror,[mbok],0);
         TSql.Free;
         abort;
       end;

       if (qryDet.FieldByName('DATAFINAL').OldValue <> qryDet.FieldByName('DATAFINAL').newValue) and
          (qryDet.FieldByName('DATAFINAL').asstring <> '') then
       begin

          dDataAux1 := qryDet.FieldByName('DATAFINAL').oldValue;

          if dDataAux1 = null then
             dDataAux := qryDet.FieldByName('DATAFINAL').asstring
          else
             dDataAux := DateToStr(qryDet.FieldByName('DATAFINAL').oldValue);

          TSql.sql.Clear;
          
           //Everson TIBERO - Início
          {TSql.sql.Add(' select min(datainicio) as datainicio FROM EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N '+
                       ' where datainicio   > to_date('+#39+dDataAux+#39+',''dd/mm/rrrr'')'+     }

          TSql.sql.Add(' select min(E.datainicio) as datainicio FROM EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N '+
                       ' where E.datainicio   > to_date('+#39+dDataAux+#39+',''dd/mm/rrrr'')'+
          //Everson TIBERO - Fim

                       ' and E.IDPESSOA     = ' + MontaSelect.ValoresChave[1] +
                       ' AND E.IDPESSJUR   = ' + MontaSelect.ValoresChave[0] +
                       ' AND CE.IDCARGOEXT  = E.IDCARGOEXT'+
                       ' AND CE.IDPESSJUR   = E.IDPESSJUR'+
                       ' AND CN.IDPESSJUR   = CE.IDPESSJUR'+
                       ' AND CN.IDCARGOEXT  = CE.IDCARGOEXT'+
                       ' AND N.IDNIVEL      = CN.IDNIVEL'+
                       ' AND N.IDPESSJUR    = CN.IDPESSJUR');
          TSql.Open;

          if (TSql.fieldbyname('datainicio').AsString <> '') and
             (trunc(qryDet.FieldByName('DATAFINAL').Asdatetime) >= trunc(TSql.fieldbyname('datainicio').AsDateTime) ) then
          begin
             messagedlg('Data fim deste cargo deverá ser menor que a data inicio do cargo posterior.',mterror,[mbok],0);
             TSql.Free;
             abort;
          end;

       end;
       TSql.Free;
     end;


     if (qryDet.RecordCount > 0) and ((dsDet.State = dsinsert) or (qryDet.FieldByName('datainicio').OldValue <> qryDet.FieldByName('datainicio').newValue)) then
     begin

       if dsDet.State = dsinsert then
          dDataAux := qryDet.FieldByName('datainicio').AsString
       else
          dDataAux := '';  //Fanuel Junior SOL 159682 KINTANA 1321743
          //dDataAux := DateToStr(qryDet.FieldByName('datainicio').oldValue);


       TSql := Twwquery.Create(Self);
       TSql.databasename := 'BASEDADOS';
       TSql.sql.Clear;

//       TSql.sql.Add(' select max(datainicio) as datainicio FROM EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N '+ //Everson TIBERO
       TSql.sql.Add(' select max(E.datainicio) as datainicio FROM EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N '+ //Everson TIBERO
                    ' where E.datainicio   < to_date('+#39+dDataAux+#39+',''dd/mm/rrrr'')'+
                    ' and E.IDPESSOA      = ' + MontaSelect.ValoresChave[1] +
                    ' AND E.IDPESSJUR    = ' + MontaSelect.ValoresChave[0]+
                    ' AND CE.IDCARGOEXT  = E.IDCARGOEXT'+
                    ' AND CE.IDPESSJUR   = E.IDPESSJUR'+
                    ' AND CN.IDPESSJUR   = CE.IDPESSJUR'+
                    ' AND CN.IDCARGOEXT  = CE.IDCARGOEXT'+
                    ' AND N.IDNIVEL      = CN.IDNIVEL'+
                    ' AND N.IDPESSJUR    = CN.IDPESSJUR');
       TSql.Open;

       if (not TSql.isempty) and (trunc(qryDet.fieldbyname('datainicio').AsDateTime) <= trunc(TSql.fieldbyname('datainicio').AsDateTime)) then
       begin
         messagedlg('Data início deste cargo deverá ser maior que a data inicio do cargo anterior.',mterror,[mbok],0);
         TSql.Free;
         abort;
       end;
       TSql.Free;
     end;
end;


function  TfrmCadEvolFuncPrev.VerificaVigenciaNivel(piIdPessJur   : Longint;
                                                        piIdCargoExt : longint;
                                                    psDataRef     : string
                                                   ): Boolean;
begin
   Result := False;

   // Verificar se existe CargoxNivel com vigencia entre as datas informadas
   frmAguarde.Mostra('Verificando vigência de cargo ... ');

   Application.ProcessMessages;

   qryVigenciaNivel.Close;
   qryVigenciaNivel.ParamByName('IdPessJur').AsInteger   := piIdPessJur;
   qryVigenciaNivel.ParamByName('IdCargoExt').AsInteger  := piIdCargoExt;
   qryVigenciaNivel.ParamByName('DataInicio').AsDateTime := StrToDate(psDataRef);
   qryVigenciaNivel.Open;

   If not qryVigenciaNivel.IsEmpty then
     Result := True;

   frmAguarde.Apaga;
end;



function  TfrmCadEvolFuncPrev.VerificaVigenciaFuncao(piIdPessJur  : longint;
                                                        piIdFuncao   : longint;
                                                     psDataRef    : string
                                                    ): Boolean;
begin
   Result := False;

   frmAguarde.Mostra('Verificando vigência de grupo funcional  ... ');

   Application.ProcessMessages;

   qryVigenciaFuncao.Close;
   qryVigenciaFuncao.ParamByName('IdPessJur').AsInteger   := piIdPessJur;
   qryVigenciaFuncao.ParamByName('IdCargoExt').AsInteger  := piIdFuncao;
   qryVigenciaFuncao.ParamByName('DataInicio').AsDateTime := StrToDate(psDataRef);
   qryVigenciaFuncao.Open;

   if not qryVigenciaFuncao.IsEmpty then 
     Result := True;

   frmAguarde.Apaga;
end;



procedure TfrmCadEvolFuncPrev.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
     qry.Close;
     qry.ParamByName('IdPessJur').Value      := StrToInt(MontaSelect.ValoresChave[0]);
     qry.ParamByName('IdPessoa').Value       := StrToInt(MontaSelect.ValoresChave[1]);
     qry.ParamByName('IdPlanoprev').Value    := StrToInt(MontaSelect.ValoresChave[2]);// SOL 162100 KINTANA 1374819
     qry.Open;



     if qry.fieldbyname('TITULAR').AsInteger = 1 then
     begin
        lblnome.Caption := 'Nome do Participante';
        lblmat.caption  := 'Matrícula Participante';
        DBText6.Visible := True;
     end else begin
        lblnome.caption := 'Nome Depen./Benef.';
        lblmat.caption  := 'Matrícula Depen./Benef.';
        DBText6.Visible := False;
     end;

     if (qry.FieldByName('FLGSITPART').AsString = 'MA') or
        (qry.FieldByName('FLGSITPART').AsString = 'MP')   
     then begin
        lblTitSalMantido.Visible := True;
        sbCalcSalMantido.Visible := True;
        dbSalMantido.Visible     := True;
        dbSalMantido.Caption     := ClienteNumero(qry.FieldByName('SALMANTIDO').AsString);
     end
     else begin
        lblTitSalMantido.Visible := False;
        sbCalcSalMantido.Visible := False;
        dbSalMantido.Visible     := False;
        dbSalMantido.Caption     := '0,00';
     end;

     qryeventos.Close;
     qryeventos.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qryeventos.ParamByName('IdPessoa').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryeventos.Open;

     qryDet.Close;
     qryDet.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qryDet.ParamByName('IdPessoa').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryDet.Open;

     qryFuncao.Close;
     qryFuncao.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qryFuncao.ParamByName('IdPessoa').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryFuncao.ParamByName('IDPLANOPREV').Value := StrToInt(OraNumero(MontaSelect.ValoresChave[2]));
     qryFuncao.Open;

     qryAdicCompens.Close;
     qryAdicCompens.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qryAdicCompens.ParamByName('IdPessoa').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryAdicCompens.Open;

     qryAdicIncorp.Close;
     qryAdicIncorp.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qryAdicIncorp.ParamByName('IdPessoa').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryAdicIncorp.Open;

     qryAdicInsalub.Close;
     qryAdicInsalub.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qryAdicInsalub.ParamByName('IdPessoa').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryAdicInsalub.Open;

     qryAdicPericul.Close;
     qryAdicPericul.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qryAdicPericul.ParamByName('IdPessoa').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryAdicPericul.Open;

     qryAdicNoturno.Close;
     qryAdicNoturno.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qryAdicNoturno.ParamByName('IdPessoa').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryAdicNoturno.Open;

     qryATS.Close;
     qryATS.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qryATS.ParamByName('IdPessoa').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryATS.Open;

     qryRubSalarial.Close;
     qryRubSalarial.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qryRubSalarial.ParamByName('IdPessoa').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qryRubSalarial.Open;

     qryFuncoes.Close;
     qryFuncoes.ParamByName('IdPessJur').Value  := StrToInt(MontaSelect.ValoresChave[0]);
     qryFuncoes.Open;

     qryCargoxNivel.Close;
     qryCargoxNivel.ParamByName('IdPessJur').Value  := StrToInt(MontaSelect.ValoresChave[0]);
     qryCargoxNivel.Open;

     qryProvDesc.Close;
     qryProvDesc.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qryProvDesc.Open;

     qrySalManut.Close;
     qrySalManut.ParamByName('IdPessJur').Value   := StrToInt(MontaSelect.ValoresChave[0]);
     qrySalManut.ParamByName('IdPessoa').Value    := StrToInt(MontaSelect.ValoresChave[1]);
     qrySalManut.ParamByName('IDPLANOPREV').Value := StrToInt(OraNumero(MontaSelect.ValoresChave[2]));
     qrySalManut.ParamByName('SEQPROPOSTA').Value := 1;
     qrySalManut.Open;

     bInseriuDetalhe := False;
  end;
end;



procedure TfrmCadEvolFuncPrev.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  // No caso desta tela, qualquer insercao deve ser feita no final das linhas já
  // existentes. Logo, não é possível utilizar o comando INSERT mas sim APPEND.
  if pgctrlDetalhe.ActivePage = tbsDet then
  Begin
    qryDet.Append;

    dbDataInicio.enabled := True;
  End
  else if pgctrlDetalhe.ActivePage = tbsFuncao
  then qryFuncao.Append
  else if pgctrlDetalhe.ActivePage = tbsATS
  then qryATS.Append
  else if pgctrlDetalhe.ActivePage = tbsAdicCompens
  then qryAdicCompens.Append
  
  Else If pgctrlDetalhe.ActivePage = tbsAdicIncorp Then
    qryAdicIncorp.Append
  
  else if pgctrlDetalhe.ActivePage = tbsAdicInsalub
  then qryAdicInsalub.Append
  else if pgctrlDetalhe.ActivePage = tbsAdicPericul
  then qryAdicPericul.Append
  else if pgctrlDetalhe.ActivePage = tbsAdicNoturno
  then qryAdicNoturno.Append
  else if pgctrlDetalhe.ActivePage = tbsRubSal
  then qryRubSalarial.Insert;

  bInseriuDetalhe := False;
end;



procedure TfrmCadEvolFuncPrev.CmeDetalheEdit(Sender: TObject);
begin
  if ((pgctrlDetalhe.ActivePage = tbsDet)           and (qryDet.FieldbyName('Origem').AsString         <> 'C') ) or
     ((pgctrlDetalhe.ActivePage = tbsFuncao)        and (qryFuncao.FieldbyName('Origem').AsString      <> 'C') ) or
     ((pgctrlDetalhe.ActivePage = tbsAdicInsalub)   and (qryAdicInsalub.FieldbyName('Origem').AsString <> 'C') ) or
     ((pgctrlDetalhe.ActivePage = tbsAdicPericul)   and (qryAdicPericul.FieldbyName('Origem').AsString <> 'C') ) or
     ((pgctrlDetalhe.ActivePage = tbsAdicCompens)   and (qryAdicCompens.FieldbyName('Origem').AsString <> 'C') ) or
     ((pgctrlDetalhe.ActivePage = tbsAdicIncorp)    and (qryAdicIncorp.FieldbyName('Origem').AsString <> 'C') )  or
     ((pgctrlDetalhe.ActivePage = tbsAdicNoturno)   and (qryAdicNoturno.FieldbyName('Origem').AsString <> 'C') ) or
     ((pgctrlDetalhe.ActivePage = tbsATS)           and (qryATS.FieldbyName('Origem').AsString         <> 'C') )
  then
  begin
    if not PermiteAlteracaoPorExcecao( qry.FieldByName('IDPESSJUR').AsInteger, 'E') then
    begin
      MsgDlg('Esta entrada da "Evolução Funcional" não foi cadastrada manualmente '+
            'e, por isto, não pode ser alterada.','Erro',mtError,[mbOk,mbHelp],0);
      Abort;
    end;
  end;

  // Não permitir alterar Data Incial quando alteração para não haver "buracos" entre datas
  //SOL 67138 - Henrique Massão
  //dbDataInicio.enabled := false;

  inherited;
end; // CmeDetalhe.Edit(Self)



procedure TfrmCadEvolFuncPrev.CmeDetalheConfirma(Sender: TObject);
var
  iSeqHistFunc : longint;
begin

  if VerificaEfetivaSemData = False then
  begin
    Exit;
  end;

  With QryAux Do
  Begin
    Sql.Clear;
    If qrydet.State = dsInsert Then
    Begin
      sql.clear;
      sql.Add(' SELECT *  FROM EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N '+
              '  WHERE E.DATAINICIO   > TO_DATE('+#39+qryDet.FieldByName('DATAINICIO').asstring+#39+',''dd/mm/rrrr'')'+
              // SOL 197680 KTN 1894473 Otacilio ** Inicio **
              '    AND E.DATAFINAL    < TO_DATE('+#39+qryDet.FieldByName('DATAFINAL').asstring+#39+',''dd/mm/rrrr'')'+
              // SOL 197680 KTN 1894473 Otacilio ** Fim **
              '    AND E.IDPESSOA     = ' + MontaSelect.ValoresChave[1] +
              '    AND E.IDPESSJUR    = ' + MontaSelect.ValoresChave[0] +
              '    AND CE.IDCARGOEXT  = E.IDCARGOEXT'+
              '    AND CE.IDPESSJUR   = E.IDPESSJUR'+
              '    AND CN.IDPESSJUR   = CE.IDPESSJUR'+
              '    AND CN.IDCARGOEXT  = CE.IDCARGOEXT'+
              '    AND N.IDNIVEL      = CN.IDNIVEL'+
              '    AND N.IDPESSJUR    = CN.IDPESSJUR');
      Open;
      if (not QryAux.isempty) then
      begin
        messagedlg('Existe um cargo informado com esse período.',mterror,[mbok],0);
        abort;
      end;

      // só no caso de insert
      Sql.clear;
      Sql.Add(' UPDATE EVOLFUNCPREV '+
              ' SET DATAFINAL = TO_DATE('''+ FormatDateTime('dd/mm/yyyy', qryDet.FieldByname('DATAINICIO').AsDateTime - 1)+''')'+
              ' WHERE IDPESSOA = '+ qry.FieldByName('IDPESSOA').AsString +
              '   AND IDPESSJUR = '+ qry.FieldByName('IDPESSJUR').AsString +
              '   AND datainicio = (SELECT MAX(e.datainicio) '+
              '                       from EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N '+
                        '            WHERE E.IDPESSJUR = '+qry.FieldByName('IdPessJur').AsString+' '+
                        '              AND E.IDPESSOA = '+qry.FieldByName('IdPessoa').AsString+
                        '              AND CE.IDCARGOEXT  = E.IDCARGOEXT '+
                        '              AND CE.IDPESSJUR   = E.IDPESSJUR  '+
                        '              AND CN.IDPESSJUR   = CE.IDPESSJUR  '+
                        '              AND CN.IDCARGOEXT  = CE.IDCARGOEXT '+
                        '              AND N.IDNIVEL      = CN.IDNIVEL   '+
                        '              AND N.IDPESSJUR    = CN.IDPESSJUR  '+
                        '              AND E.datainicio < '+#39+DateToStr(qryDet.FieldByName('datainicio').newvalue)+#39+'  ) ');
    End
    Else If qrydet.State = dsEdit Then
    Begin

      lFazRefresh := True;

      // Esta query pega o registro imediatamente anterior ao max(seqhistfunc)
      // e altera sua data final.
      Sql.Add(' UPDATE EVOLFUNCPREV '+
              ' SET DATAFINAL = TO_DATE('''+ FormatDateTime('dd/mm/yyyy', qryDet.FieldByname('DATAINICIO').AsDateTime - 1)+''')'+
              ' WHERE IDPESSOA = '+ qry.FieldByName('IDPESSOA').AsString +
              '   AND SEQHISTFUNC = ( '+
              ' 	SELECT MAX(SEQHISTFUNC) FROM EVOLFUNCPREV '+
              ' 	WHERE IDPESSOA = '+ qry.FieldByName('IDPESSOA').AsString +
              ' 	AND IDPESSJUR = '+ qry.FieldByName('IDPESSJUR').AsString +
              ' 	AND IDCARGOEXT IN (SELECT IDCARGOEXT FROM EVOLFUNCPREV '+
              ' 			WHERE IDPESSOA = '+ qry.FieldByName('IDPESSOA').AsString +
              ' 			AND IDPESSJUR = '+ qry.FieldByName('IDPESSJUR').AsString +
              ' 			AND IDCARGOEXT IS NOT NULL) '+
              ' 	AND SEQHISTFUNC <> (SELECT MAX(SEQHISTFUNC)     FROM EVOLFUNCPREV '+
              ' 			WHERE IDPESSOA = '+ qry.FieldByName('IDPESSOA').AsString +
              ' 			AND IDPESSJUR = '+ qry.FieldByName('IDPESSJUR').AsString +
              ' 			AND IDCARGOEXT IS NOT NULL)) ');
    End;
    If (qryDet.State in ([dsInsert])) or ( (qryDet.State in ([dsedit])) and(qryDetDATAINICIO.NewValue <> qryDetDATAINICIO.oldValue))  Then
    Try
      ExecSql;
    Except
      MsgDlg('Erro ao atualizar Data Final do Cargo','Erro',mtError,[mbOk,mbHelp],0);
    End;
  End; // With


   qryaux.close;
  qryaux.sql.text := ' UPDATE ELEGPATRO EL SET EL.IDCARGOEXT = '+
                     ' (SELECT EV.IDCARGOEXT '+
                     ' FROM EVOLFUNCPREV EV '+
                     ' WHERE EV.IDPESSOA = EL.IDPESSOA AND '+
                     ' EV.IDPESSJUR = EL.IDPESSJUR AND '+
                     ' EV.IDCARGOEXT IS NOT NULL AND '+
                     ' EV.MODOFUNCAO = ''EF'' AND '+
                     ' EV.DATAINICIO = (SELECT MAX(EX.DATAINICIO) '+
                     '                  FROM EVOLFUNCPREV EX '+
                     '                  WHERE EX.IDPESSOA = EV.IDPESSOA AND '+
                     '                  EX.IDPESSJUR = EV.IDPESSJUR AND '+
                     '                  EX.IDCARGOEXT IS NOT NULL AND '+
                     '                  EX.MODOFUNCAO = ''EF'' )) '+
                     ' WHERE  '+
                     ' EL.IDPESSOA =  '+qry.FieldByName('IDPESSOA').AsString+' '+
                     ' AND EL.IDPESSJUR = '+qry.FieldByName('IDPESSJUR').AsString+' '+
                     ' AND EXISTS (SELECT 1 '+
                     ' FROM EVOLFUNCPREV EV '+
                     ' WHERE EV.IDPESSOA = EL.IDPESSOA AND '+
                     ' EV.IDPESSJUR = EL.IDPESSJUR AND '+
                     ' EV.IDCARGOEXT IS NOT NULL AND '+
                     ' EV.IDCARGOEXT <> NVL(EL.IDCARGOEXT,0) ) ';
  Try
    qryaux.ExecSql;
  Except
    MsgDlg('Erro ao preencher Cargo atual.','Erro',mtError,[mbOk,mbHelp],0);
  End;



  qryaux.close;
  qryaux.sql.text := ' UPDATE ELEGPATRO EL SET EL.IDFUNCAOEXT   = '+
                     ' (SELECT EV.IDFUNCAO '+
                     ' FROM EVOLFUNCPREV EV '+
                     ' WHERE EV.IDPESSOA = EL.IDPESSOA AND '+
                     ' EV.IDPESSJUR = EL.IDPESSJUR AND '+
                     ' EV.MODOFUNCAO = ''EF'' AND '+ 
                     ' EV.DATAFINAL IS NULL AND '+ 
                     ' EV.IDFUNCAO IS NOT NULL AND '+
                     ' NVL(EV.PERCFUNCAO,0) > 0 AND '+ 
                     ' EV.DATAINICIO = (SELECT MAX(EX.DATAINICIO) '+
                     '                  FROM EVOLFUNCPREV EX '+
                     '                  WHERE EX.IDPESSOA = EV.IDPESSOA AND '+
                     '                  EX.IDPESSJUR = EV.IDPESSJUR AND '+
                     '                  EX.MODOFUNCAO = ''EF'' AND '+ 
                     '                  EX.DATAFINAL IS NULL AND '+ 
                     '                  NVL(EV.PERCFUNCAO,0) > 0 AND '+ 
                     '                  EX.IDFUNCAO IS NOT NULL)) '+
                     ' WHERE  '+
                     ' EL.IDPESSOA =  '+qry.FieldByName('IDPESSOA').AsString+' '+
                     ' AND EL.IDPESSJUR = '+qry.FieldByName('IDPESSJUR').AsString+' '+
                     ' AND EXISTS (SELECT 1 '+
                     ' FROM EVOLFUNCPREV EV '+
                     ' WHERE EV.IDPESSOA = EL.IDPESSOA AND '+
                     ' EV.IDPESSJUR = EL.IDPESSJUR AND '+
                     ' EV.IDFUNCAO IS NOT NULL AND '+
                     ' EV.IDFUNCAO <> NVL(EL.IDFUNCAOEXT,0))';
  Try
    qryaux.ExecSql;
  Except
    MsgDlg('Erro ao preencher Função atual.','Erro',mtError,[mbOk,mbHelp],0);
  End;


  //Renato Visoni - Sol 94508 \ Kintana 407724
  if (pgctrlDetalhe.ActivePage = tbsFuncao) and (CMDateTimePicker1.DateTime = 0) and (dblkpcmbModoFuncao.LookupValue='EF') then begin
    inc(iQntInicial);
  end else if (pgctrlDetalhe.ActivePage = tbsFuncao) and (CMDateTimePicker1.DateTime > 0) and (bDataBranco) and (dblkpcmbModoFuncao.LookupValue='EF') and (qryFuncao.State in [dsEdit]) then begin
    inc(iDeletado);                                                                                       
  end;
  //Renato Visoni - Sol 94508 \ Kintana 407724

//   qryDet.post;
  inherited;
end; // CmeDetalhe.Confirma(Self)



procedure TfrmCadEvolFuncPrev.CmeCadastroConfirma(Sender: TObject);
var
  sNovaDataFinal  : string;
  bInsert         : Boolean;
  bUltimoCargo    : Boolean;
begin
  try

    { Caso esteja numa transação externa não utilizar }
    { as rotinas do padrão pois elas tentam abrir uma outra transação.            }

    //BRUNO AZEVEDO SOL 134106 KINTANA 803098
    //If Not bEmTransacaoExterna Then Begin
    if not (dtmBaseDados.dbBaseDados.InTransaction) then begin
      inherited;
      AplicaAlteracoes([qryDet,qryFuncao, qryATS, qryAdicCompens, qryAdicIncorp, qryAdicInsalub, qryAdicPericul, qryAdicNoturno, qryRubSalarial]);
    End
    Else
    Begin
      qry.ApplyUpdates;            qry.CommitUpdates;
      qryDet.ApplyUpdates;         qryDet.CommitUpdates;
      qryFuncao.ApplyUpdates;      qryFuncao.CommitUpdates;
      qryATS.ApplyUpdates;         qryATS.CommitUpdates;
      qryAdicCompens.ApplyUpdates; qryAdicCompens.CommitUpdates;
      qryAdicIncorp.ApplyUpdates;  qryAdicIncorp.CommitUpdates;
      qryAdicInsalub.ApplyUpdates; qryAdicInsalub.CommitUpdates;
      qryAdicPericul.ApplyUpdates; qryAdicPericul.CommitUpdates;
      qryAdicNoturno.ApplyUpdates; qryAdicNoturno.CommitUpdates;
      qryRubSalarial.ApplyUpdates; qryRubSalarial.CommitUpdates;

    End;
    qryDet.close;
    qryDet.Open;

    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
  except
     raise;
  end;
end; // CmeCadastro.Confirma(Self)



procedure TfrmCadEvolFuncPrev.FormShow(Sender: TObject);
begin
  inherited;
  bClickNoOKCancel  := False;
  bClickNoSair      := False;

  qryModoFuncao.Close;
  qryModoFuncao.Open;

  qryModoCargo.Close;
  qryModoCargo.Open;

  qrySitPart.Close;
  qrySitPart.Open;

  MontaSelect.Filtro.Add('EL.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
//SOL 121368 - KINTANA 589276 - Álder Souza - INÍCIO
  //SOL 116572 - KINTANA 547247
  //WindowState := wsMaximized;
  //FormStyle   := fsMDIChild;
  //Fim
//SOL 121368 - KINTANA 589276 - Álder Souza - FIM

  Shape1.visible := true;
  Shape5.visible := true;
  Label1.visible := true;

  // Se a query ja estiver aberta com um participante, é porque foi chamada de outra tela
  // Neste caso, o botão de alterar pode ser habilitado internamente no programa
  sbtnAlterar.Enabled := True;

end;



procedure TfrmCadEvolFuncPrev.qryDetBeforePost(DataSet: TDataSet);
VAR
  sData : String;
begin

  if qryDet.State = dsInsert
  then begin
     if Trim(dblkpcmbCargoxNivel.Text) = ''
     then begin
        MsgDlg('Preencha o cargo.','Erro',mtError,[mbOk,mbHelp],0);
        Abort;
     end;

     if Trim(dbDataInicio.Text) = ''
     then begin
        MsgDlg('Preencha a Data de Início do Cargo. ','Erro',mtError,[mbOk,mbHelp],0);
        Abort;
     end;

     if not VerificaVigenciaNivel ( qry.FieldByName('IdPessJur').AsInteger,
                                    qryCargoxNivel.FieldByName('IdCargoExt').AsInteger,
                                    dbDataInicio.Text )
     then begin
        MsgDlg('O cargo informado não estava vigente na data '+dbDataInicio.Text+'. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
        Abort;
     end;

     If qryDet.FieldByName('FLGSITPART').IsNull
     Then qryDet.FieldByName('FLGSITPART').AsString := qry.FieldByName('FLGSITPART').AsString;
  end;

  with qryDet do
  begin
     FieldByName('Origem').AsString            := 'C'; // Cadastrado
     FieldByName('DescOrigem').AsString        := 'Cadastrado'; // Cadastrado

     if State = dsInsert
     then begin
        FieldByName('IdPessJur').AsInteger        := qry.FieldByName('IdPessJur').AsInteger;
        FieldByName('IdPessoa').AsInteger         := qry.FieldByName('IdPessoa').AsInteger;
        FieldByName('SeqHistFunc').AsInteger      := LeUltRegistro(nil,'EVOLFUNCPREV');
        FieldByName('IdCargoExt').AsInteger       := qryVigenciaNivel.FieldByName('IdCargoExt').AsInteger;
        FieldByName('IdPessJurCG').AsInteger      := qryVigenciaNivel.FieldByName('IdPessJur').AsInteger;
        FieldByName('Cargo').AsString             := qryCargoxNivel.FieldbyName('Titulo').AsString;
        FieldByName('DescModo').AsString          := dblkpcmbModoCargo.Text;
     end;

     FieldByName('IdFuncao').AsString          := '';
     FieldByName('IdPessJurFG').AsString       := '';
  end;


  if qryDetDATAFINAL.AsString <> '' then
  begin
     if trunc(qryDetDATAFINAL.AsDateTime) < trunc(qryDetDATAINICIO.AsDateTime) then
     begin
        MsgDlg('Data final está menor que a data de início do Cargo. ','Erro',mtError,[mbOk,mbHelp],0);
        Abort;
     end;
  end;

  PR_Data;


  //atualiza data fim do cargo anterior
  //no momento da inserção de um novo cargo
  if (qryDet.State = dsEdit) and (qryDetDATAINICIO.NewValue <> qryDetDATAINICIO.oldValue)then
  begin
     qryaux.close;

     if (qryDet.FieldByName('datainicio').oldvalue <> null) then begin
       sData := qryDet.FieldByName('datainicio').oldvalue;
     end else begin
       sData := DateToStr(Date());
     end;

     qryaux.sql.text := ' UPDATE EVOLFUNCPREV SET DATAFINAL  = TO_DATE('''+dbDataInicio.Text+''',''DD/MM/YYYY'') -1 '+
                        ' WHERE IDPESSJUR = '+qry.FieldByName('IdPessJur').AsString+' '+
                        ' AND IDPESSOA = '+qry.FieldByName('IdPessoa').AsString+'  '+
//                        ' AND datainicio = (SELECT MAX(datainicio) FROM '+ //Everson TIBERO
                        ' AND datainicio = (SELECT MAX(e.datainicio) FROM '+ //Everson TIBERO
                        '                    EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N '+
                        '                    WHERE E.IDPESSJUR = '+qry.FieldByName('IdPessJur').AsString+' '+
                        '                    AND E.IDPESSOA = '+qry.FieldByName('IdPessoa').AsString+
                        '                    AND CE.IDCARGOEXT  = E.IDCARGOEXT '+
                        '                    AND CE.IDPESSJUR   = E.IDPESSJUR  '+
                        '                    AND CN.IDPESSJUR   = CE.IDPESSJUR  '+
                        '                    AND CN.IDCARGOEXT  = CE.IDCARGOEXT '+
                        '                    AND N.IDNIVEL      = CN.IDNIVEL   '+
                        '                    AND N.IDPESSJUR    = CN.IDPESSJUR  '+
                        '                    AND E.datainicio < '+#39+sData+#39+'  ) ';
     try
        qryaux.ExecSql;
     except
        MsgDlg('Erro na atualização na data final no cargo anterior.','Erro',mtError,[mbOk,mbHelp],0);
     end;

  end;

  inherited;
end;



procedure TfrmCadEvolFuncPrev.qryFuncaoBeforePost(DataSet: TDataSet);
begin
  if qryFuncao.State = dsInsert
  then begin
     if Trim(dblkpcmbFuncao.Text) = ''
     then begin
        MsgDlg('Preencha a função.','Erro',mtError,[mbOk,mbHelp],0);
        Abort;
     end;


     if Trim(dbDataInicioFuncao.Text) = ''
     then begin
        MsgDlg('Preencha a Data de Início da Função. ','Erro',mtError,[mbOk,mbHelp],0);
        Abort;
     end;

     if not VerificaVigenciaFuncao ( qry.FieldByName('IdPessJur').AsInteger,
                                     qryFuncoes.FieldByName('IdCargoExt').AsInteger,
                                     dbDataInicioFuncao.Text)
     then begin
        MsgDlg('O grupo funcional informado não estava vigente na data '+dbDataInicioFuncao.Text+'. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
        Abort;
     end;
  end;

  with qryFuncao do
  begin
     FieldByName('Origem').AsString            := 'C';          // Cadastrado
     FieldByName('DescOrigem').AsString        := 'Cadastrado'; // Cadastrado

     if State = dsInsert
     then begin
        FieldByName('IdPessJur').AsInteger        := qry.FieldByName('IdPessJur').AsInteger;
        FieldByName('IdPessoa').AsInteger         := qry.FieldByName('IdPessoa').AsInteger;
        FieldByName('SeqHistFunc').AsInteger      := LeUltRegistro(nil,'EVOLFUNCPREV');
     end;

     FieldByName('IdCargoExt').AsString           := '';
     FieldByName('IdPessJurCG').AsString          := '';

     FieldByName('Codigo').AsString           := qryFuncoes.FieldByName('Codigo').AsString;
     FieldByName('IdPessJurFG').AsInteger     := qry.FieldByName('IdPessJur').AsInteger;
     FieldByName('Funcao').AsString           := qryFuncoes.FieldByName('Titulo').AsString;
     FieldByName('DescModo').AsString         := dblkpcmbModoFuncao.Text;

  end;

  inherited;
end;



procedure TfrmCadEvolFuncPrev.qryATSBeforePost(DataSet: TDataSet);
begin
  // Testar campos obritgatorios
  if Trim(dbDataInicioATS.Text) = ''
  then begin
     MsgDlg('Preencha a Data de Início do Adicional. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if Trim(dbedValorATS.Text) = ''
  then begin
     MsgDlg('Preencha o Percentual do Adicional. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if StrToFloat(ClienteNumero(Trim(dbedValorATS.Text))) > 100
  then begin
     MsgDlg('Percentual Inválido. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;


  with qryATS do
  begin
     FieldByName('Origem').AsString            := 'C'; // Cadastrado
     FieldByName('DescOrigem').AsString        := 'Cadastrado'; // Cadastrado
     if State = dsInsert
     then begin
        FieldByName('IdPessJur').AsInteger        := qry.FieldByName('IdPessJur').AsInteger;
        FieldByName('IdPessoa').AsInteger         := qry.FieldByName('IdPessoa').AsInteger;
        FieldByName('SeqHistFunc').AsInteger      := LeUltRegistro(nil,'EVOLFUNCPREV');
     end;

     FieldByName('IdCargoExt').AsString        := '';
     FieldByName('IdPessJurCG').AsString       := '';
     FieldByName('IdFuncao').AsString          := '';
     FieldByName('IdPessJurFG').AsString       := '';
  end;

  inherited;
end;



procedure TfrmCadEvolFuncPrev.bbtnConfirmarClick(Sender: TObject);
var
  sMsgErro : string;
begin
  if qrySalManut.Active and (qrySalManut.UpdatesPending)
  then qrySalManut.ApplyUpdates;

  bClickNoOKCancel  := True;

  inherited;
//SOL 126672 - Ádler Souza
  qryFuncao.Close;

  if not bEmTransacaoExterna then
  begin
    //BRUNO AZEVEDO SOL 134106 KINTANA 803098
    qryFuncao.ParamByName('IdPessJur').Value   := qry.FieldByName('IdPessJur').AsInteger;
    qryFuncao.ParamByName('IdPessoa').Value    := qry.FieldByName('IdPessoa').AsInteger;
    qryFuncao.ParamByName('IDPLANOPREV').Value := qry.FieldByName('IdPlanoPrev').AsInteger;
    //BRUNO AZEVEDO SOL 134106 KINTANA 803098
  end;

  qryFuncao.Open;
//SOL 126672 - Ádler Souza
   // SOL 162100 KINTANA 1374819
   if not (dtmBaseDados.dbBaseDados.InTransaction) then
   begin
      inherited;
      AplicaAlteracoes([qryDet,qryFuncao, qryATS, qryAdicCompens, qryAdicIncorp, qryAdicInsalub, qryAdicPericul, qryAdicNoturno, qryRubSalarial]);
   End
   Else
   Begin
      qry.ApplyUpdates;            qry.CommitUpdates;
      qryDet.ApplyUpdates;         qryDet.CommitUpdates;
      qryFuncao.ApplyUpdates;      qryFuncao.CommitUpdates;
      qryATS.ApplyUpdates;         qryATS.CommitUpdates;
      qryAdicCompens.ApplyUpdates; qryAdicCompens.CommitUpdates;
      qryAdicIncorp.ApplyUpdates;  qryAdicIncorp.CommitUpdates;
      qryAdicInsalub.ApplyUpdates; qryAdicInsalub.CommitUpdates;
      qryAdicPericul.ApplyUpdates; qryAdicPericul.CommitUpdates;
      qryAdicNoturno.ApplyUpdates; qryAdicNoturno.CommitUpdates; 
      qryRubSalarial.ApplyUpdates; qryRubSalarial.CommitUpdates;
    End;
    // SOL 162100 KINTANA 1374819
end;



procedure TfrmCadEvolFuncPrev.sbtnAltDetClick(Sender: TObject);
begin
  if Trim(FormatDateTime('dd/mm/yyyy', Date)) = ''
  then begin
     MsgDlg('Informe a data de referência.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  inherited;

  bDataBranco := (qryFuncao.FieldByName('DataFinal').asstring='');

end;



procedure TfrmCadEvolFuncPrev.qryRubSalarialBeforePost(DataSet: TDataSet);
var
   sData            : string;
begin
  sData := '01/'+Copy(dbedAnoMesRefRubSal.Text,6,2)+'/'+Copy(dbedAnoMesRefRubSal.Text,1,4);

  with qryRubSalarial do
  begin
     FieldByName('CODPROVDESC').AsString        := qryProvDesc.FieldByName('CodProvDesc').AsString;
     FieldByName('FLGCOMPOEREMTOTAL').AsInteger := qryProvDesc.FieldByName('FLGCOMPOEREMTOTAL').AsInteger;
     FieldByName('FLGCOMPOESALBENEF').AsInteger := qryProvDesc.FieldByName('FLGCOMPOESALBENEF').AsInteger;
     FieldByName('FLGCOMPOESALPART').AsInteger  := qryProvDesc.FieldByName('FLGCOMPOESALPART').AsInteger;
     FieldByName('FLGCONCESSAO').AsInteger      := 0;
     FieldByName('FLGIRRF').AsInteger           := qryProvDesc.FieldByName('FLGIRRF').AsInteger;
     FieldByName('FLGPREVIA').AsInteger         := 1;
     FieldByName('FLGSALBENEFRETRO').AsInteger  := qryProvDesc.FieldByName('FLGSALBENEFRETRO').AsInteger;
     FieldByName('FLGSALPARTATUARIA').AsInteger := qryProvDesc.FieldByName('FLGSALPARTATUARIA').AsInteger;
     FieldByName('FLGSALPARTRETRO').AsInteger   := qryProvDesc.FieldByName('FLGSALPARTRETRO').AsInteger;
     FieldByName('FLGSRB').AsInteger            := 0;
     FieldByName('IDMODULO').AsInteger          := Sistema.IdModulo;
     FieldByName('IDMOTIVO').AsInteger          := prmIdMotivoContrib;
     FieldByName('IDPATRO').AsInteger           := qry.FieldByName('IdPessJur').AsInteger;
     FieldByName('IDPESSJUR').AsInteger         := qry.FieldByName('IdPessJur').AsInteger;
     FieldByName('IDPESSOA').AsInteger          := qry.FieldByName('IdPessoa').AsInteger;
     FieldByName('REFERENCIA').AsString         := '***';
     FieldByName('SEQRUBRICA').AsInteger        := 1;
     FieldByName('FLGEQUIPARACAO').AsInteger    := 1;
     FieldByName('TIPOITEMPCS').AsInteger       := 1;
     FieldByName('MODULO').AsString             := 'AdmPREV';
     FieldByName('DESCRPROVDESC').AsString      := qryProvDesc.FieldByName('DESCRPROVDESC').AsString;
  end;

  inherited;
end;



procedure TfrmCadEvolFuncPrev.dbedAnoMesRefRubSalExit(Sender: TObject);
var
  sData  : string;
    iIdPCS : longint;
begin
  sData := '01/'+Copy(dbedAnoMesRefRubSal.Text,6,2)+'/'+Copy(dbedAnoMesRefRubSal.Text,1,4);

  // Verificar o PCS válido na data de inicio do periodo informado
  iIdPCS := PCSValido ( qry.FieldByName('IdPessJur').AsInteger, sData );
  if iIdPCS < 0
  then begin
    MsgDlg('Não existe nenhum PCS válido em '+sData+'. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
    Abort;
  end;

  qryProvDesc.Close;
  qryProvDesc.ParamByName('IdPessJur').Value   := qry.FieldByName('IdPessJur').AsInteger;
  qryProvDesc.Open;

  if dbedAnoMesCobRubSal.Text = ''
  then begin
     qryRubSalarial.FieldByName('MesCobranca').AsString := dbedAnoMesRefRubSal.Text;
     qryRubSalarial.FieldByName('Mes').AsString := dbedAnoMesRefRubSal.Text;
     dbedAnoMesCobRubSal.Text := dbedAnoMesRefRubSal.Text;
  end;
end;



procedure TfrmCadEvolFuncPrev.dblkpcmbRubricaEnter(Sender: TObject);
var
  sData  : string;
    iIdPCS : longint;
begin
  sData := '01/'+Copy(dbedAnoMesRefRubSal.Text,6,2)+'/'+Copy(dbedAnoMesRefRubSal.Text,1,4);

  // Verificar o PCS válido na data de inicio do periodo informado
  iIdPCS := PCSValido ( qry.FieldByName('IdPessJur').AsInteger, sData );
  if iIdPCS < 0
  then begin
    MsgDlg('Não existe nenhum PCS válido em '+sData+'. Verifique. ','Erro',mtError,[mbOk, mbHelp],0);
    Abort;
  end;

  qryProvDesc.Close;
  qryProvDesc.ParamByName('IdPessJur').Value   := qry.FieldByName('IdPessJur').AsInteger;
  qryProvDesc.Open;
end;



procedure TfrmCadEvolFuncPrev.qryAdicCompensBeforePost(DataSet: TDataSet);
begin
  inherited;

  if qryAdicCompens.State = dsInsert
  then begin
     if Trim(dblkpcmbFuncaoAdicCompens.Text) = ''
     then begin
        MsgDlg('Preencha a Função Base do Adicional Compensatório.','Erro',mtError,[mbOk,mbHelp],0);
        Abort;
     end;


     if Trim(dtInicioAdicCompens.Text) = ''
     then begin
        MsgDlg('Preencha a Data de Início do Adicional. ','Erro',mtError,[mbOk,mbHelp],0);
        Abort;
     end;

     if not VerificaVigenciaFuncao ( qry.FieldByName('IdPessJur').AsInteger,
                                     qryFuncoes.FieldByName('IdCargoExt').AsInteger,
                                     dtInicioAdicCompens.Text)
     then begin
        MsgDlg('O grupo funcional informado não estava vigente na data '+dtInicioAdicCompens.Text+'. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
        Abort;
     end;
  end;

  with qryAdicCompens do
  begin
     FieldByName('Origem').AsString            := 'C'; // Cadastrado
     FieldByName('DescOrigem').AsString        := 'Cadastrado'; // Cadastrado

     if State = dsInsert
     then begin
        FieldByName('IdPessJur').AsInteger        := qry.FieldByName('IdPessJur').AsInteger;
        FieldByName('IdPessoa').AsInteger         := qry.FieldByName('IdPessoa').AsInteger;
        FieldByName('SeqHistFunc').AsInteger      := LeUltRegistro(nil,'EVOLFUNCPREV');
     end;

     FieldByName('IdCargoExt').AsString           := '';
     FieldByName('IdPessJurCG').AsString          := '';

     FieldByName('Codigo').AsString           := qryFuncoes.FieldByName('Codigo').AsString;
     FieldByName('IdPessJurFG').AsInteger     := qry.FieldByName('IdPessJur').AsInteger;
     FieldByName('Funcao').AsString           := qryFuncoes.FieldByName('Titulo').AsString;
  end;

  inherited;
end;



procedure TfrmCadEvolFuncPrev.qryAdicInsalubBeforePost(DataSet: TDataSet);
begin
  inherited;

  // Testar campos obritgatorios
  if Trim(dtInicioAdicInsalub.Text) = ''
  then begin
     MsgDlg('Preencha a Data de Início do Adicional. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if Trim(dbedPercInsalub.Text) = ''
  then begin
     MsgDlg('Preencha o Percentual do Adicional. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if StrToFloat(ClienteNumero(Trim(dbedPercInsalub.Text))) > 100
  then begin
     MsgDlg('Percentual Inválido. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;


  with qryAdicInsalub do
  begin
     FieldByName('Origem').AsString            := 'C'; // Cadastrado
     FieldByName('DescOrigem').AsString        := 'Cadastrado'; // Cadastrado
     if State = dsInsert
     then begin
        FieldByName('IdPessJur').AsInteger        := qry.FieldByName('IdPessJur').AsInteger;
        FieldByName('IdPessoa').AsInteger         := qry.FieldByName('IdPessoa').AsInteger;
        FieldByName('SeqHistFunc').AsInteger      := LeUltRegistro(nil,'EVOLFUNCPREV');
     end;

     FieldByName('IdCargoExt').AsString        := '';
     FieldByName('IdPessJurCG').AsString       := '';
     FieldByName('IdFuncao').AsString       := '';
     FieldByName('IdPessJurFG').AsString       := '';
  end;

  inherited;
end;



procedure TfrmCadEvolFuncPrev.qryAdicPericulBeforePost(DataSet: TDataSet);
begin
  inherited;

  // Testar campos obrigatorios
  if Trim(dtIniAdicPericul.Text) = ''
  then begin
     MsgDlg('Preencha a Data de Início do Adicional. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if Trim(dbedPercPericul.Text) = ''
  then begin
     MsgDlg('Preencha o Percentual do Adicional. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  if StrToFloat(ClienteNumero(Trim(dbedPercPericul.Text))) > 100
  then begin
     MsgDlg('Percentual Inválido. ','Erro',mtError,[mbOk,mbHelp],0);
     Abort;
  end;

  with qryAdicPericul do
  begin
    FieldByName('Origem').AsString            := 'C'; // Cadastrado
    FieldByName('DescOrigem').AsString        := 'Cadastrado'; // Cadastrado
    if State = dsInsert then
    begin
        FieldByName('IdPessJur').AsInteger        := qry.FieldByName('IdPessJur').AsInteger;
        FieldByName('IdPessoa').AsInteger         := qry.FieldByName('IdPessoa').AsInteger;
        FieldByName('SeqHistFunc').AsInteger      := LeUltRegistro(nil,'EVOLFUNCPREV');
    end;

    FieldByName('IdCargoExt').AsString        := '';
    FieldByName('IdPessJurCG').AsString       := '';
    FieldByName('IdFuncao').AsString       := '';
    FieldByName('IdPessJurFG').AsString       := '';
  end;

  inherited;
end;



procedure TfrmCadEvolFuncPrev.qryAdicNoturnoBeforePost(DataSet: TDataSet);
Var
  IDias: Integer;
  BErro: Boolean;

begin
  inherited;

  // Testar campos obrigatorios
  if Trim(dtInicioAdicNoturno.Text) = '' then
  begin
    MsgDlg('Preencha a Data de Início do Adicional. ','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;

  {SOL:187866 KTN:1780115 - JRM6}
  if (StrToIntDef(DBEdDias.text,0)>31) then
  begin
    MsgDlg('O campo "DIAS" deverá ser preenchido com o valor entre 1 à 31','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;
  {SOL:187866 KTN:1780115 - JRM6}

  if Trim(dbedQtdeMinutos.Text) = '' then
  begin
    MsgDlg('Preencha a Quantidade de Minutos. ','Erro',mtError,[mbOk,mbHelp],0);
    dbedQtdeMinutos.SetFocus;
    Abort;
  end;

  if StrToFloat(ClienteNumero(Trim(dbedPercAdicNoturno.Text))) > 100 then
  begin
    MsgDlg('Percentual Inválido. ','Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;

  with qryAdicNoturno do
  begin
    FieldByName('Origem').AsString            := 'C'; // Cadastrado
    FieldByName('DescOrigem').AsString        := 'Cadastrado'; // Cadastrado

    if State = dsInsert then
    begin
      FieldByName('IdPessJur').AsInteger        := qry.FieldByName('IdPessJur').AsInteger;
      FieldByName('IdPessoa').AsInteger         := qry.FieldByName('IdPessoa').AsInteger;
      FieldByName('SeqHistFunc').AsInteger      := LeUltRegistro(nil,'EVOLFUNCPREV');
      FieldByName('DESCSIT').AsString           := '';
    end;

    {SOL:187866 KTN:1780115 - JRM6}
    if FieldByName('MODO').Asstring = 'E' then
      FieldByName('DESCMODO').AsString := 'Efetivo'
    else
      FieldByName('DESCMODO').AsString := 'Facultativo';

    if FieldByName('DESCSITCADASTRADA').AsString = 'Assistido' then FieldByName('FLGSITPART').Asstring := 'AS'
    else if FieldByName('DESCSITCADASTRADA').AsString = 'Ativo' then FieldByName('FLGSITPART').Asstring := 'AT'
         else FieldByName('FLGSITPART').Asstring := 'XX';
    {SOL:187866 KTN:1780115 - JRM6}

    FieldByName('IdCargoExt').AsString        := '';
    FieldByName('IdPessJurCG').AsString       := '';
    FieldByName('IdFuncao').AsString          := '';
    FieldByName('IdPessJurFG').AsString       := '';
  end;

  inherited;
end;



procedure TfrmCadEvolFuncPrev.sbtnCalcEnquadramentoClick(Sender: TObject);
var
  dValorEnquadramento : double;
begin
  inherited;
  // Verificar se existe regra associada a patrocinadora/plano
  if (not qry.Active) then Exit;


  dValorEnquadramento := CalculaEnquadramento( dtmAPrev.qryAux,
                                               qry.FieldByName('IDPESSJUR').AsInteger,
                                               qry.FieldByName('IDPLANOPREV').AsInteger,
                                               qry.FieldByName('IDPESSOA').AsInteger,
                                               qry.FieldByName('IDTITULAR').AsInteger,
                                               qry.FieldByName('SEQPROPOSTA').AsInteger);
  if dValorEnquadramento > 0
  then qry.FieldByName('VLRENQUADRAMENTO').AsFloat := dValorEnquadramento;
end;



procedure TfrmCadEvolFuncPrev.sbtnExcluiDetClick(Sender: TObject);
var dDatainicio  : TDatetime;
begin
  //Monica da Silva Gonzaga  - SOL 202904 KINTANA 1963731 - INICIO
  {// SOL 182293 KINTANA 1699025
  If qryDet.FieldByName('datainicio').oldvalue = Null then
     dDatainicio := 0
  else
     dDatainicio := qryDet.FieldByName('datainicio').oldvalue;

  qryaux.close;
  qryaux.sql.clear;
  // SOL 182293 KINTANA 1699025
  qryaux.sql.add('     UPDATE EVOLFUNCPREV SET DATAFINAL  = NULL '+
                     ' WHERE IDPESSJUR = '+qry.FieldByName('IdPessJur').AsString+' '+
                     ' AND IDPESSOA = '+qry.FieldByName('IdPessoa').AsString+'  '+
                     ' AND datainicio = (SELECT MAX(E.datainicio) FROM '+
                     '                    EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N '+
                        '                 WHERE E.IDPESSJUR = '+qry.FieldByName('IdPessJur').AsString+' '+
                        '                    AND E.IDPESSOA = '+qry.FieldByName('IdPessoa').AsString+
                        '                    AND E.datainicio < '+#39+datetostr(dDatainicio)+#39+     // SOL 182293 KINTANA 1699025
                        '                    AND CE.IDCARGOEXT  = E.IDCARGOEXT '+
                        '                    AND CE.IDPESSJUR   = E.IDPESSJUR  '+
                        '                    AND CN.IDPESSJUR   = CE.IDPESSJUR  '+
                        '                    AND CN.IDCARGOEXT  = CE.IDCARGOEXT '+
                        '                    AND N.IDNIVEL      = CN.IDNIVEL   '+
                        '                    AND N.IDPESSJUR    = CN.IDPESSJUR)  ');}//Monica da Silva Gonzaga  - SOL 202904 KINTANA 1963731 - FIM
  try
    // qryaux.ExecSql;//Monica da Silva Gonzaga SOL 202904 KINTANA 1963731
     //Renato Visoni - Sol 94508 \ Kintana 407724
     if (pgctrlDetalhe.ActivePage = tbsFuncao) and (QryFuncao.FieldByname('DataFinal').AsDateTime = 0) and (QryFuncao.FieldByname('ModoFuncao').Asstring='EF') then begin
       inc(iDeletado);
     end;
     //Renato Visoni - Sol 94508 \ Kintana 407724
  except
     MsgDlg('Erro na atualização na data final no cargo anterior.','Erro',mtError,[mbOk,mbHelp],0);
  end;

  inherited;
end;



procedure TfrmCadEvolFuncPrev.dbgrdDetCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  if (qrydet.FieldByName('FLGSITPART').AsString = 'AT' ) or (qrydet.FieldByName('FLGSITPART').AsString = '')
  then begin //ativo na época
     ABrush.Color := clWhite;
     AFont.Color  := clWindowText;
  end
  else if (qrydet.FieldByName('FLGSITPART').AsString = 'AS' )
  then begin //assistido na ápoca
     ABrush.Color := $00CAFFFF;
     AFont.Color  := clWindowText;
  end;
end;



procedure TfrmCadEvolFuncPrev.qryDetCalcFields(DataSet: TDataSet);
var
  sSit, sDescSit : String;
begin
  inherited;

  //verificar na query de ventos, qual a situação do participante
  //na época
  if not qryeventos.isempty then
  begin

     qryeventos.first;
     while not qryeventos.eof do
     begin
        if qrydet.fieldbyname('DATAINICIO').AsFloat >
           qryeventos.fieldbyname('DATAEVENTO').AsFloat then
        begin
           sSit := qryeventos.fieldbyname('SIT').AsString;
           sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
        end
        else break;

        qryeventos.next;
     end;
  end
  else
  begin
     sSit := qryeventos.fieldbyname('SIT').AsString;
     sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
  end;

  qrydet.fieldbyname('SIT').AsString := sSit;
  qrydet.fieldbyname('DESCSIT').AsString   := sDescSit;
end;



procedure TfrmCadEvolFuncPrev.dbgrdFuncaoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  if (qryFuncao.FieldByName('FLGSITPART').AsString = 'AT' ) or (qrydet.FieldByName('FLGSITPART').AsString = '')
  then begin //ativo na época
     ABrush.Color := clWhite;
     AFont.Color  := clWindowText;
  end
  else if (qryFuncao.FieldByName('FLGSITPART').AsString = 'AS' )
  then begin //assistido na ápoca
     ABrush.Color := $00CAFFFF;
     AFont.Color  := clWindowText;
  end;
end;



procedure TfrmCadEvolFuncPrev.qryFuncaoCalcFields(DataSet: TDataSet);
var sSit, sDescSit : String;
begin
  inherited;

  //verificar na query de ventos, qual a situação do participante
  //na época
  if not qryeventos.isempty then
  begin
     qryeventos.first;
     while not qryeventos.eof do
     begin
        if qryfuncao.fieldbyname('DATAINICIO').AsFloat >
           qryeventos.fieldbyname('DATAEVENTO').AsFloat then
        begin
           sSit := qryeventos.fieldbyname('SIT').AsString;
           sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
        end
        else break;

        qryeventos.next;
     end;
  end
  else
  begin
     sSit := qryeventos.fieldbyname('SIT').AsString;
     sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
  end;

  qryfuncao.fieldbyname('SIT').AsString := sSit;
  qryfuncao.fieldbyname('DESCSIT').AsString   := sDescSit;
end;



procedure TfrmCadEvolFuncPrev.qryAdicCompensCalcFields(DataSet: TDataSet);
var
  sSit, sDescSit : String;
begin
  inherited;

  //verificar na query de ventos, qual a situação do participante
  //na época
  if not qryeventos.isempty then
  begin

     qryeventos.first;
     while not qryeventos.eof do
     begin
        if qryAdicCompens.fieldbyname('DATAINICIO').AsFloat >
           qryeventos.fieldbyname('DATAEVENTO').AsFloat then
        begin
           sSit := qryeventos.fieldbyname('SIT').AsString;
           sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
        end
        else break;

        qryeventos.next;
     end;
  end
  else
  begin
     sSit := qryeventos.fieldbyname('SIT').AsString;
     sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
  end;

  qryAdicCompens.fieldbyname('SIT').AsString := sSit;
  qryAdicCompens.fieldbyname('DESCSIT').AsString   := sDescSit;
end;



procedure TfrmCadEvolFuncPrev.dbgrdAdicCompensCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  if (qryAdicCompens.FieldByName('FLGSITPART').AsString = 'AT' ) or (qrydet.FieldByName('FLGSITPART').AsString = '')
  then begin //ativo na época
     ABrush.Color := clWhite;
     AFont.Color  := clWindowText;
  end
  else if (qryAdicCompens.FieldByName('FLGSITPART').AsString = 'AS' )
  then begin //assistido na ápoca
     ABrush.Color := $00CAFFFF;
     AFont.Color  := clWindowText;
  end;
end;



procedure TfrmCadEvolFuncPrev.qryATSCalcFields(DataSet: TDataSet);
var
  sSit, sDescSit : String;
begin
  inherited;

  //verificar na query de ventos, qual a situação do participante
  //na época
  if not qryeventos.isempty then
  begin

     qryeventos.first;
     while not qryeventos.eof do
     begin
        if qryats.fieldbyname('DATAINICIO').AsFloat >
           qryeventos.fieldbyname('DATAEVENTO').AsFloat then
        begin
           sSit := qryeventos.fieldbyname('SIT').AsString;
           sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
        end
        else break;

        qryeventos.next;
     end;
  end
  else
  begin
     sSit := qryeventos.fieldbyname('SIT').AsString;
     sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
  end;

  qryats.fieldbyname('SIT').AsString := sSit;
  qryats.fieldbyname('DESCSIT').AsString   := sDescSit;
end;



procedure TfrmCadEvolFuncPrev.dbgrdATSCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  if (qryats.FieldByName('FLGSITPART').AsString = 'AT' ) or (qrydet.FieldByName('FLGSITPART').AsString = '')
  then begin //ativo na época
     ABrush.Color := clWhite;
     AFont.Color  := clWindowText;
  end
  else if (qryats.FieldByName('FLGSITPART').AsString = 'AS' )
  then begin //assistido na ápoca
     ABrush.Color := $00CAFFFF;
     AFont.Color  := clWindowText;
  end;
end;



procedure TfrmCadEvolFuncPrev.qryAdicInsalubCalcFields(DataSet: TDataSet);
var
  sSit, sDescSit : String;
begin
  //verificar na query de ventos, qual a situação do participante
  //na época
  if not qryeventos.isempty then
  begin

     qryeventos.first;
     while not qryeventos.eof do
     begin
        if qryAdicInsalub.fieldbyname('DATAINICIO').AsFloat >
           qryeventos.fieldbyname('DATAEVENTO').AsFloat then
        begin
           sSit := qryeventos.fieldbyname('SIT').AsString;
           sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
        end
        else break;

        qryeventos.next;
     end;
  end
  else
  begin
     sSit := qryeventos.fieldbyname('SIT').AsString;
     sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
  end;

  qryAdicInsalub.fieldbyname('SIT').AsString := sSit;
  qryAdicInsalub.fieldbyname('DESCSIT').AsString   := sDescSit;
end;



procedure TfrmCadEvolFuncPrev.dbgrdAdicInsalubCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  if (qryAdicInsalub.FieldByName('FLGSITPART').AsString = 'AT' ) or (qrydet.FieldByName('FLGSITPART').AsString = '')
  then begin //ativo na época
     ABrush.Color := clWhite;
     AFont.Color  := clWindowText;
  end
  else if (qryAdicInsalub.FieldByName('FLGSITPART').AsString = 'AS' )
  then begin //assistido na ápoca
     ABrush.Color := $00CAFFFF;
     AFont.Color  := clWindowText;
  end;
end;



procedure TfrmCadEvolFuncPrev.qryAdicNoturnoCalcFields(DataSet: TDataSet);
var
  sSit, sDescSit : String;
begin
  //verificar na query de Eventos, qual a situação do participante
  //na época
  if not qryeventos.isempty then
  begin
    qryeventos.first;
    while not qryeventos.eof do
    begin
      if qryAdicNoturno.fieldbyname('DATAINICIO').AsFloat >
         qryeventos.fieldbyname('DATAEVENTO').AsFloat then
      begin
        sSit := qryeventos.fieldbyname('SIT').AsString;
        sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
      end
      else break;

      qryeventos.next;
    end;
  end
  else
  begin
     sSit := qryeventos.fieldbyname('SIT').AsString;
     sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
  end;

  qryAdicNoturno.fieldbyname('SIT').AsString := sSit;
  qryAdicNoturno.fieldbyname('DESCSIT').AsString   := sDescSit;
end;



procedure TfrmCadEvolFuncPrev.dbgrdAdicNoturnoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  if (qryAdicNoturno.FieldByName('FLGSITPART').AsString = 'AT' ) or (qrydet.FieldByName('FLGSITPART').AsString = '')
  then begin //ativo na época
     ABrush.Color := clWhite;
     AFont.Color  := clWindowText;
  end
  else if (qryAdicNoturno.FieldByName('FLGSITPART').AsString = 'AS' )
  then begin //assistido na ápoca
     ABrush.Color := $00CAFFFF;
     AFont.Color  := clWindowText;
  end;
end;



procedure TfrmCadEvolFuncPrev.qryAdicPericulCalcFields(DataSet: TDataSet);
var
  sSit, sDescSit : String;
begin
  //verificar na query de ventos, qual a situação do participante
  //na época
  if not qryeventos.isempty then
  begin
     qryeventos.first;
     while not qryeventos.eof do
     begin
        if qryAdicPericul.fieldbyname('DATAINICIO').AsFloat >
           qryeventos.fieldbyname('DATAEVENTO').AsFloat then
        begin
           sSit := qryeventos.fieldbyname('SIT').AsString;
           sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
        end
        else break;

        qryeventos.next;
     end;
  end
  else
  begin
     sSit := qryeventos.fieldbyname('SIT').AsString;
     sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
  end;

  qryAdicPericul.fieldbyname('SIT').AsString := sSit;
  qryAdicPericul.fieldbyname('DESCSIT').AsString   := sDescSit;
end;



procedure TfrmCadEvolFuncPrev.dbgrdAdicPericulCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  if (qryAdicPericul.FieldByName('FLGSITPART').AsString = 'AT' ) or (qrydet.FieldByName('FLGSITPART').AsString = '')
  then begin //ativo na época
     ABrush.Color := clWhite;
     AFont.Color  := clWindowText;
  end
  else if (qryAdicPericul.FieldByName('FLGSITPART').AsString = 'AS' )
  then begin //assistido na ápoca
     ABrush.Color := $00CAFFFF;
     AFont.Color  := clWindowText;
  end;
end;



procedure TfrmCadEvolFuncPrev.tbcDetalheChange(Sender: TObject);
begin
  inherited;

  if tbcDetalhe.tabindex = 7 then
  begin
     Shape1.visible := false;
     Label2.visible := false;
     Shape5.visible := false;
     Label1.visible := false;
  end
  else
  begin
     Shape1.visible := true;
     Label2.visible := true;
     Shape5.visible := true;
     Label1.visible := true;
  end;
end;



procedure TfrmCadEvolFuncPrev.sbCalcSalMantidoClick(Sender: TObject);
var
  dSalarioMantido : double;
    sSQL            : string;
    sValorRegra     : string;
    bErro           : boolean;
    iIdRegra        : longint;
begin
    inherited;

    // Verificar se existe regra associada a patrocinadora/plano
    if (not qry.Active) then Exit;

    if qry.FieldByName('FLGSITPART').AsString = 'MA'
    then iIdRegra := qry.FieldByName('IDRGSALMANUT').AsInteger
    else iIdRegra := qry.FieldByName('IDRGSALMANUTPART').AsInteger;

    if iIdRegra <= 0 then Exit;

    sSQL := ' SELECT '''+qry.FieldByName('INSCRICAODATA').AsString    +''' AS INSCRICAODATAFUND, '+
                     '''' + FormatDateTime('dd/mm/yyyy', Date) + ''' AS DATAREF , '+   
                     ''''+qry.FieldByName('DATAINICIOMANUT').AsString +''' AS DATAINICIOMANUT,   '+
                     ''''+qry.FieldByName('NIVEL').AsString+''' AS NIVEL,             '+
                     ''''+qry.FieldByName('NIVEL').AsString+''' AS NIVELCONF,         '+
                     '  -1  AS IDEVENTOGERADOR,   '+
                     OraNumero(qry.FieldByName('SALMANTIDO').AsString)+'   AS VALORPROVENTO,     '+
                     ''''+Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' + Copy(FormatDateTime('dd/mm/yyyy', Date),4,2)+''' AS MESREFERENCIA, '+ 
                     OraNumero(qry.FieldByName('SALTOTAL').AsString)+'   AS VALORREMTOTAL,     '+
                     OraNumero(qry.FieldByName('VALORRESERVA').AsString)+'   AS VALORRESERVA,      '+
                     OraNumero(qry.FieldByName('IdCargoExt').AsString) +' AS IDCARGOEXT,    '+
                     OraNumero(qry.FieldByName('IdCargoExt').AsString)+' AS IDCARGOCONF,   '+
                   '0 AS SOMAITEMNOPBC, '+ // SRB
                   '0 AS SOMAITEMNADIB, '+ // SRB
            '         PF.DATANASC, PLP.IDRGSALMANUT,                                '+
            '        EL.SALTOTAL, EL.TEMPOSERVANTERIOR, EL.TEMPONAOCREDITADO,      '+
            '        EL.TEMPOSERVANTREAL, EL.TEMPOSITESPECIAL, EL.IDSITFUNC,       '+
            '        EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3, EL.DATAADMISSAO, '+
            '        EL.DATADEMISSAO,                                              '+
            '        PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA,  '+
            '        PP.IDSITPART, PP.IDSITPLANOPREV, EL.FLGDIRETOR                '+
            ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF, PLANPREVPATRO PLP '+
            ' WHERE  PP.IDPESSOA    = ' + qry.FieldByName('IDTITULAR').AsString    + ' AND ' +
            '        PP.IDPESSJUR   = ' + qry.FieldByName('IDPESSJUR').AsString   + ' AND ' +
            '        PP.IDPLANOPREV = ' + qry.FieldByName('IDPLANOPREV').AsString + ' AND ' +
            '        PP.SEQPROPOSTA = ' + qry.FieldByName('SEQPROPOSTA').AsString + ' AND ' +
            '        EL.IDPESSOA    = PP.IDPESSOA      AND ' +
            '        EL.IDPESSJUR   = PP.IDPESSJUR     AND ' +
            '        PF.IDPESSOA    = EL.IDPESSOA      AND ' +
            '        PP.IDPLANOPREV = PLP.IDPLANOPREV AND ' +
            '        PP.IDPESSJUR   = PLP.IDPESSJUR ';

    sValorRegra := RegraNumerica( IntToStr(iIdRegra),                          
                                  sSQL, bErro, iIdCalculoGeral);

    sValorRegra := FormatFloat('#0.00', StrToFloat(ClienteNumero(sValorRegra)));

    if Abs(StrToFloat(ClienteNumero(sValorRegra)) - StrToFloat(ClienteNumero(qry.FieldByName('SALMANTIDO').AsString))) > 0.01 then
    begin
          if MsgDlg('O novo salário calculado ('+ClienteNumero(sValorRegra)+') é MENOR que '+
                 'o salário atual ('+qry.FieldByName('SALMANTIDO').AsString+'). '+#13+
                 'Deseja realmente atualizar este salário ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
          then Exit;
    end;


    dbSalMantido.Caption := ClienteNumero(sValorRegra);
    qrySalManut.Edit;
    qrySalManut.FieldByName('SALMANTIDO').AsFloat      := StrToFloat(ClienteNumero(sValorRegra));
    qrySalManut.FieldByName('SALPARTICIPACAO').AsFloat := StrToFloat(ClienteNumero(sValorRegra)); // SOL 162100 KINTANA 1374819
    qrySalManut.Post;
end;



procedure TfrmCadEvolFuncPrev.bbtnCancelarClick(Sender: TObject);
begin
  if qrySalManut.Active and (qrySalManut.UpdatesPending) then qrySalManut.CancelUpdates;

  bClickNoOKCancel  := True;

  inherited;
end;



procedure TfrmCadEvolFuncPrev.sbtnProcurarClick(Sender: TObject);
begin
  bClickNoOKCancel  := False;
  bClickNoSair      := False;
  bEmTransacaoExterna := False; //SOL 126672 - Ádler Souza

  inherited;
  //Renato Visoni - Sol 94508 \ Kintana 407724
  IniciaVariavel();
  //Renato Visoni - Sol 94508 \ Kintana 407724

  // Felipe A. Santos SOL 180917 KTN 1706762

  if MontaSelect.RetornouValor then
  begin
    // somente deixa fazer alterações quando o IDPESSJUR = 91008
    if (MontaSelect.ValoresChave[0] <> '91008') then
       sbtnAlterar.Enabled := false
    else
       sbtnAlterar.Enabled := true;
  end;

  // Felipe A. Santos SOL 180917 KTN 1706762 - FIM

end;



procedure TfrmCadEvolFuncPrev.bbtnSairClick(Sender: TObject);
begin
  bClickNoOKCancel  := False;
  bClickNoSair      := True; 

  inherited;
end;



procedure TfrmCadEvolFuncPrev.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bClickNoOKCancel and (not bClickNoSair) then Abort; // CAMILLE - 20.01.2004

  inherited;
end;



procedure TfrmCadEvolFuncPrev.FormCreate(Sender: TObject);

begin
  inherited;

  bEmTransacaoExterna := False;
  qry.Close;
  qry.ParamByName('IdPessJur').Value      := 0;
  qry.ParamByName('IdPessoa').Value       := 0;
  qry.ParamByName('IdPlanoprev').Value    := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IdPessJur').Value      := 0;
  qryDet.ParamByName('IdPessoa').Value       := 0;
  qryDet.Open;

  qryFuncao.Close;
  qryFuncao.ParamByName('IdPessJur').Value   := 0;
  qryFuncao.ParamByName('IdPessoa').Value    := 0;
  // JRM6
  qryFuncao.ParamByName('IDPLANOPREV').Value := 0;

  qryFuncao.Open;

  qryAdicCompens.Close;
  qryAdicCompens.ParamByName('IdPessJur').Value   := 0;
  qryAdicCompens.ParamByName('IdPessoa').Value    := 0;
  qryAdicCompens.Open;

  qryAdicIncorp.Close;
  qryAdicIncorp.ParamByName('IdPessJur').Value   := 0;
  qryAdicIncorp.ParamByName('IdPessoa').Value    := 0;
  qryAdicIncorp.Open;

  qryAdicInsalub.Close;
  qryAdicInsalub.ParamByName('IdPessJur').Value   := 0;
  qryAdicInsalub.ParamByName('IdPessoa').Value    := 0;
  qryAdicInsalub.Open;

  qryAdicPericul.Close;
  qryAdicPericul.ParamByName('IdPessJur').Value   := 0;
  qryAdicPericul.ParamByName('IdPessoa').Value    := 0;
  qryAdicPericul.Open;

  qryAdicNoturno.Close;
  qryAdicNoturno.ParamByName('IdPessJur').Value   := 0;
  qryAdicNoturno.ParamByName('IdPessoa').Value    := 0;
  qryAdicNoturno.Open;

  qryATS.Close;
  qryATS.ParamByName('IdPessJur').Value   := 0;
  qryATS.ParamByName('IdPessoa').Value    := 0;
  qryATS.Open;

  qryRubSalarial.Close;
  qryRubSalarial.ParamByName('IdPessJur').Value   := 0;
  qryRubSalarial.ParamByName('IdPessoa').Value    := 0;
  qryRubSalarial.Open;

  qryProvDesc.Close;
  qryProvDesc.ParamByName('IdPessJur').Value   := 0;
  qryProvDesc.Open;
end;



procedure TfrmCadEvolFuncPrev.dbgrdAdicIncorpCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

  If (qryAdicIncorp.FieldByName('FLGSITPART').AsString = 'AT' ) or (qrydet.FieldByName('FLGSITPART').AsString = '') Then
  Begin //ativo na época
    ABrush.Color := clWhite;
    AFont.Color  := clWindowText;
  End
  Else
    If (qryAdicIncorp.FieldByName('FLGSITPART').AsString = 'AS' ) Then
    Begin //assistido na ápoca
      ABrush.Color := $00CAFFFF;
      AFont.Color  := clWindowText;
    End;
end;



procedure TfrmCadEvolFuncPrev.qryAdicIncorpCalcFields(DataSet: TDataSet);
var
  sSit, sDescSit : String;
begin
  inherited;

  //verificar na query de ventos, qual a situação do participante
  //na época
  If Not qryEventos.isempty Then
  Begin
    qryEventos.first;
    While Not qryEventos.eof Do
    Begin
      If qryAdicIncorp.fieldbyname('DATAINICIO').AsFloat >
         qryEventos.fieldbyname('DATAEVENTO').AsFloat Then
      Begin
        sSit     := qryEventos.fieldbyname('SIT').AsString;
        sDescSit := qryEventos.fieldbyname('SITUACAO').AsString
      End
      Else
        Break;

      qryEventos.next;
    End;
  End
  Else
  Begin
    sSit     := qryeventos.fieldbyname('SIT').AsString;
    sDescSit := qryeventos.fieldbyname('SITUACAO').AsString
  End;

  qryAdicIncorp.fieldbyname('SIT').AsString     := sSit;
  qryAdicIncorp.fieldbyname('DESCSIT').AsString := sDescSit;
end;



procedure TfrmCadEvolFuncPrev.qryAdicIncorpBeforePost(DataSet: TDataSet);
begin
  inherited;
  If qryAdicIncorp.State = dsInsert Then
  Begin
    If Trim(dblkpcmbFuncaoAdicCompens.Text) = '' Then
    Begin
      MsgDlg('Preencha a Função Base do Adicional Compensatório.','Erro',mtError,[mbOk,mbHelp],0);
      Abort;
    End;

    If Trim(dtInicioAdicCompens.Text) = '' Then
    Begin
      MsgDlg('Preencha a Data de Início do Adicional. ','Erro',mtError,[mbOk,mbHelp],0);
      Abort;
    End;

    If Not VerificaVigenciaFuncao ( qry.FieldByName('IdPessJur').AsInteger,
                                    qryFuncoes.FieldByName('IdCargoExt').AsInteger,
                                    dtInicioAdicCompens.Text) Then
    Begin
      MsgDlg('O grupo funcional informado não estava vigente na data '+dtInicioAdicCompens.Text+'. Verifique.','Erro',mtError,[mbOk, mbHelp],0);
      Abort;
    End;
  End;

  With qryAdicIncorp Do
  Begin
    FieldByName('ORIGEM').AsString            := 'C'; // Cadastrado
    FieldByName('DESCORIGEM').AsString        := 'Cadastrado'; // Cadastrado

    If State = dsInsert Then
    Begin
      FieldByName('IDPESSJUR').AsInteger        := qry.FieldByName('IDPESSJUR').AsInteger;
      FieldByName('IDPESSOA').AsInteger         := qry.FieldByName('IDPESSOA').AsInteger;
      FieldByName('SEQHISTFUNC').AsInteger      := LeUltRegistro(nil,'EVOLFUNCPREV');
    End;

    FieldByName('IDCARGOEXT').AsString           := '';
    FieldByName('IDPESSJURCG').AsString          := '';

     FieldByName('CODIGO').AsString           := qryFuncoes.FieldByName('CODIGO').AsString;
     FieldByName('IDPESSJURFG').AsInteger     := qry.FieldByName('IDPESSJUR').AsInteger;
     FieldByName('FUNCAO').AsString           := qryFuncoes.FieldByName('TITULO').AsString;
  End;
  inherited;
end;



procedure TfrmCadEvolFuncPrev.CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
var
  sSQL : string;
  sMsg : string;
begin
  inherited;

  // -----------------------------------------------------------------------------------------------
  // André Pontes - pendência 26261 - 03/01/2008
  // Verificação de existência se mais de uma função efetiva sem data final antes da gravação
  // -----------------------------------------------------------------------------------------------



  {
  if dblkpcmbModoFuncao.LookupValue  ='EF' then begin
    sSQL :=
    'SELECT '                                                                       + #13 +
    '  EV.IDFUNCAO '                                                                + #13 +

    'FROM '                                                                         + #13 +
    '  EVOLFUNCPREV EV '                                                            + #13 +

    'WHERE '                                                                        + #13 +
    '      EV.IDPESSOA            = ' + qry.FieldByName('IDPESSOA').AsString        + #13 +
    '  AND EV.IDPESSJUR           = ' + qry.FieldByName('IDPESSJUR').AsString       + #13 +
    '  AND EV.MODOFUNCAO          = ''EF'' '                                        + #13 +
    '  AND EV.DATAFINAL           IS NULL '                                         + #13 +
    '  AND EV.IDFUNCAO            IS NOT NULL '                                     + #13 +
    '  AND NVL(EV.PERCFUNCAO, 0)  > 0 '                                             + #13 +
    '  AND EV.DATAINICIO          = ( '                                             + #13 +
    '                               SELECT '                                        + #13 +
    '                                 MAX(EX.DATAINICIO) '                          + #13 +
    '                               FROM '                                          + #13 +
    '                                 EVOLFUNCPREV EX '                             + #13 +
    '                               WHERE '                                         + #13 +
    '                                     EX.IDPESSOA           = EV.IDPESSOA '     + #13 +
    '                                 AND EX.IDPESSJUR          = EV.IDPESSJUR '    + #13 +
    '                                 AND EX.MODOFUNCAO         = ''EF'' '          + #13 +
    '                                 AND EX.DATAFINAL          IS NULL '           + #13 +
    '                                 AND NVL(EV.PERCFUNCAO, 0) > 0 '               + #13 +
    '                                 AND EX.IDFUNCAO           IS NOT NULL '       + #13 +
    '                               ) ';

    // -----------------------------------------------------------------------------------------------


    

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Text := sSQL;
    qryAux.Open;

    if qryAux.RecordCount > 0 then
    begin
      sMsg := 'Há mais de uma função efetiva sem data final! ' + #13 +
              'É necessário corrigir essa situação antes de prosseguir.';

      MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
      Repaint;


      Accept := False;
      Exit;
    end;
  end;
  Accept := True;
  }
  // -----------------------------------------------------------------------------------------------
end;



function  TfrmCadEvolFuncPrev.VerificaEfetivaSemData():Boolean;
var
  sSQL : string;
  sMsg : string;

begin

  //Renato Visoni - Sol 94508 \ Kintana 407724
  Result := True;
  if (qryFuncao.state in [dsInsert,dsEdit]) and (pgctrlDetalhe.ActivePage = tbsFuncao) then begin
    if (CMDateTimePicker1.DateTime = 0) and (dblkpcmbModoFuncao.LookupValue  ='EF') and ((iQntInicial - iDeletado)>0) then begin
      begin
        sMsg := 'Há mais de uma função efetiva sem data final! ' + #13 +
                'É necessário corrigir essa situação antes de prosseguir.';

        MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbOk], 0);
        Repaint;

        Result := False;
      end;
    end;
  end;
  //Renato Visoni - Sol 94508 \ Kintana 407724
end;

procedure TfrmCadEvolFuncPrev.IniciaVariavel;
var sSql : String;
begin

  Try
  //Renato Visoni - Sol 94508 \ Kintana 407724
  //Pega a quantidade inicial de itens Efetivos com data Final Null
  sSQL :=
    'SELECT '                                                                       + #13 +
    '  EV.IDFUNCAO '                                                                + #13 +

    'FROM '                                                                         + #13 +
    '  EVOLFUNCPREV EV '                                                            + #13 +

    'WHERE '                                                                        + #13 +
    '      EV.IDPESSOA            = ' + qry.FieldByName('IDPESSOA').AsString        + #13 +
    '  AND EV.IDPESSJUR           = ' + qry.FieldByName('IDPESSJUR').AsString       + #13 +
    '  AND EV.MODOFUNCAO          = ''EF'' '                                        + #13 +
    '  AND EV.DATAFINAL           IS NULL '                                         + #13 +
    '  AND EV.IDFUNCAO            IS NOT NULL '                                     + #13 +
    '  AND NVL(EV.PERCFUNCAO, 0)  > 0 '                                             + #13 +
    '  AND EV.DATAINICIO          = ( '                                             + #13 +
    '                               SELECT '                                        + #13 +
    '                                 MAX(EX.DATAINICIO) '                          + #13 +
    '                               FROM '                                          + #13 +
    '                                 EVOLFUNCPREV EX '                             + #13 +
    '                               WHERE '                                         + #13 +
    '                                     EX.IDPESSOA           = EV.IDPESSOA '     + #13 +
    '                                 AND EX.IDPESSJUR          = EV.IDPESSJUR '    + #13 +
    '                                 AND EX.MODOFUNCAO         = ''EF'' '          + #13 +
    '                                 AND EX.DATAFINAL          IS NULL '           + #13 +
    '                                 AND NVL(EV.PERCFUNCAO, 0) > 0 '               + #13 +
    '                                 AND EX.IDFUNCAO           IS NOT NULL '       + #13 +
    '                               ) ';

    // -----------------------------------------------------------------------------------------------


  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Text := sSQL;
  qryAux.Open;

  iQntInicial := qryAux.Recordcount;
  iDeletado   := 0;
  //Renato Visoni - Sol 94508\ Kintana 407724
  except
  end;
end;

procedure TfrmCadEvolFuncPrev.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  //Renato Visoni - Sol 94508 \ Kintana 407724
  IniciaVariavel();
  //Renato Visoni - Sol  \ Kintana 407724           gustavo
end;

procedure TfrmCadEvolFuncPrev.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryDetDATAINICIO.AsString := '';
end;

procedure TfrmCadEvolFuncPrev.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  if tbcDetalhe.TabIndex = 0 then //SOL 150774 KINTANA 1097199
    dbDataInicio.SetFocus;
  {SOL:187866 KTN:1780115 - JRM6}
  if tbcDetalhe.TabIndex = 5 then
  begin
//    if dsDet.State <> dsinsert then qryDet.Append;
    dtInicioAdicNoturno.SetFocus;
  end;
  {SOL:187866 KTN:1780115 - JRM6}

end;

procedure TfrmCadEvolFuncPrev.DBEdDiasExit(Sender: TObject);
Var
  IDias: Integer;

begin
  {SOL:187866 KTN:1780115 - JRM6}
  b_Erro := False;

  IDias := StrToIntDef( DBEdDias.text, 0);

  If  dsAdicNoturno.State in [dsInsert,dsEdit] then
  begin
    if DBEdDias.text <> '' then
    begin
      if (IDias < 0) or (IDias > 31) then
      begin
        b_Erro := true;
        MsgDlg('O campo "DIAS" deverá ser preenchido com o valor entre 1 à 31','Erro',mtError,[mbOk,mbHelp],0);

        if (IQuantDias > 0) and (IQuantDias < 32) then
          qryAdicNoturno.FieldByName('QTDIAS').AsInteger := IQuantDias;

        DBEdDias.text := '';
        DBEdDias.SetFocus;
      end;
//    end
//    else
//    begin
//      qryAdicNoturno.FieldByName('QTDIAS').Clear;
    end;
  end;
  {SOL:187866 KTN:1780115 - JRM6}
end;


procedure TfrmCadEvolFuncPrev.DBEdDiasEnter(Sender: TObject);
{SOL:187866 KTN:1780115 - JRM6}
begin
  inherited;
  IQuantDias := qryAdicNoturno.FieldByName('QTDIAS').AsInteger;
  if b_Erro then
  begin
    DBEdDias.Text := '';
    b_Erro := False;
  end;
end;
{SOL:187866 KTN:1780115 - JRM6}

end.
