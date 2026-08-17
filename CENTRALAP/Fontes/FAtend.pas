// ********************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ***************************************
// ********************************************************************************************
//*********************************************************************************************
//Nº SIG.....: 52491
//Data.......: 14/08/2017
//Responsável: Osni Cavalcante
//Descrição..: Foi incluída uma instrução de commit após a confirmação dos dados de atendimento
//             para eliminar os travamento que estavamo ocorrendo entre os usuários.
//*********************************************************************************************
{
-----------------------------------------------------------------------------------------------
Pendência   : SOL 251827 PPM 764141
Responsável : Petri Nocentini
Descrição   : Erro ao tentar adicionar endereço
------------------------------------------------------------------------------
Pendência   : SOL 186428 Kintana 1751725
Responsável : Fernando Xavier
Descrição   : Menus desabilatados mesmo apos conceder acesso ao usuario
              refeito o SOL 183267
------------------------------------------------------------------------------

Pendência   : SOL 183267 Kintana 1713326
Responsável : Fanuel Marinho
Descrição   : Mesmo com as opções desabilitadas INCLUIR, ALTERAR e EXCLUIR
              no Sistemas / Usuários os botões continuam habilitadas na guia
              DADOS DO PARTICIPANTE.
------------------------------------------------------------------------------
Pendência   : SOL 175950 Kintana 1602996
Responsável : Vinicius Ferreira
Data        : entre 08/03/2012
Descrição   : Concerto de Erros:
              Ao fechar consulta geral de pessoa
              Ao abrir Contracheque e Consulta Part na tela inicial.
------------------------------------------------------------------------------
Pendência   : SOL 159518 Kintana 1506423
Responsável : Fanuel Junior
Descrição   : No atendimento da matrícula 0101570 ocorre o erro
              [EConvertError - '' is not a valid floating point value].
------------------------------------------------------------------------------
Pendência   : SOL 171141 KINTANA 1531616
Responsável : Vinicius Ferreira
Data        : 02/01/2012
Descrição   : Ajuste no recebimento de valores da variavel IdPessjur
              na função PegaParticipanteAtend
------------------------------------------------------------------------------
Pendência   : SOL 172517 Kintana 1553783
Responsável : Fanuel Junior
Descrição   : Algum processo está implicando na abertura de múltiplas conexões
------------------------------------------------------------------------------
Pendência   : SOL 164803 KINTANA 1419435
Responsável : Eraldo Silva
Descrição   : Problemas mas montagem da query de entrada de ELEGIBILIDADE
------------------------------------------------------------------------------
Pendência   : SOL 161927 KINTANA 1375111
Responsável : Otacilio Aquino
Descrição   : Ajuste para carregar o ID e Descricao do Plano Previdenciario.
------------------------------------------------------------------------------
Pendência   : SOL 160536 KINTANA 1349537
Responsável : Renato Visoni
Descrição   : Ajuste na consulta que carrega plano do participante quando ele for
              pensionista.
--------------------------------------------------------------------------------
Pendência   : SOL 158091 KINTANA 1274676
Responsável : BRUNO AZEVEDO
Data        : 17/05/2011
Descrição   : Ajuste na consulta que carrega os dados do titular e beneficiário.
--------------------------------------------------------------------------------
Pendência   : SOL 157920 KINTANA 1268194
Responsável : BRUNO AZEVEDO
Data        : 13/05/2011
Descrição   : Ajuste na consulta de participantes com 2 planos.
--------------------------------------------------------------------------------
Pendência   : SOL 147993 Kintana 1031104
Responsável : Fanuel Junior
Data        : 12/01/2011
Descrição   : Restringir o tipo de informação digitada em campos de endereço
e nos campos DDD e DDI.
------------------------------------------------------------------------------
Pendência   : SOL 149870 KINTANA 1081729
Responsável : BRUNO AZEVEDO
Data        : 04/01/2011
Descrição   : Correção ao carregar o valor do combo "Cidade".
--------------------------------------------------------------------------------
Autor(a)    :  Fanuel Junior
Data        :  03/12/2010
Pendência   :  SOL 148123 Kintana 1039106
Descricao   :  Estava aparecendo um erro de endereço está em branco ou não existe e depois mudava o UF para GO.
------------------------------------------------------------------------------
Pendência   : SOL 148514 KINTANA 1047194
Responsável : BRUNO AZEVEDO
Data        : 07/12/2010
Descrição   : Correção ao carregar o plano previdênciário.
--------------------------------------------------------------------------------
Autor(a)    :  Daniel Begnami
Data        :  17/12/2009
Pendência   :  SOL 128696 KINTANA 692035
Descricao   :  Erro na localizção da pilhas na memoria, devido ao objeto nao ser destruido corretamente
------------------------------------------------------------------------------
Autor(a)    :  Ádler Souza
Data        :  17/09/2009
Pendência   :  SOL 124254 KINTANA 631869
Descricao   :  Foi corrigido o erro que ocorria ao fechar a tela de pesquisa de
               pessoas.
------------------------------------------------------------------------------
Autor(a)    :  Jéssica Lana
Data        :  13/08/2009
Pendência   :  SOL 116583 KINTANA 547369
Descricao   :  Foi alterado o critério de pesquisa padrão("igual a") no campo
               Matricula (botão 'Atender').
------------------------------------------------------------------------------
Autor(a)    :  Renato Visoni
Data        :  06/08/2009
Pendência   :  SOL 118595 KINTANA 562853
Descricao   :  Na consulta da matricula (2132208) o sistema gerava produto cartesiano
devido a falta de relacionamento com a tabela bfciariotitplan.
------------------------------------------------------------------------------
Autor(a)    :  Renato Visoni
Data        :  06/07/2009
Pendência   :  SOL 121.210 - KTN - 587.987
Descricao   :  Alteração na qryTitular.
------------------------------------------------------------------------------
Autor(a)    :  Renato Visoni
Data        :  15/06/2009
Pendência   :  SOL 119972 KINTANA 572231
Descricao   :  O sistema estava buscando o plano errado do participante, alteramos
a qryPlanoPrevBeneficiario :
 De   :  AND BNF.IDSITBENEFICIO IN (1, 2, 7)
 Para : AND BNF.IDSITBENEFICIO IN (SELECT MIN(SB1.IDSITBENEFICIO) FROM BENEFBFCIARIO
 SB1 WHERE BNF.IDPESSOA = SB1.IDPESSOA AND SB1.IDSITBENEFICIO IN (1, 2, 7))
------------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  17/04/2009
Pendência   :  SOL 114115 KINTANA 532979
Descricao   :  O sistema mostrava a mensagem: "A Data do Crédito NÃO pode ser
               anterior a hoje. Favor verificar..." pois não conseguia calcular
               a data de crédito.
------------------------------------------------------------------------------
{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  27/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
                  Analista Responsável: Gustavo Viegas
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 98697
Data        : 01/04/2009
Responsável : Jéssica Lana
Descrição   : Foi inserido a informação dos 'documentos do responsavel' na tela
              de atendimento.
--------------------------------------------------------------------------------
Pendência   : 97690
Data        : 24/03/2009
Responsável : Jéssica Lana
Descrição   : Foi inserido a informação do 'Nome do responsável' e 'Tipo de
              responsável' na tela de atendimento.
--------------------------------------------------------------------------------
Pendência   : 98696
Data        : 23/03/2009
Responsável : Jéssica Lana
Descrição   : Foi inserido a informação do 'Número do Processo' e as informações
              correspondentes a 'Autoração' e 'Nome da Vara' na tela de
              atendimento para melhor visualização.
--------------------------------------------------------------------------------
Pendência   : 98698
Data        : 17/03/2009
Responsável : Jéssica Lana
Descrição   : Foi modificado nos campos MATRÍCULA SOLICITANTE e MATRÍCULA
              TITULAR do combobox, para trazer padrão "igual a".
--------------------------------------------------------------------------------
Pendência   : 98836
Data        : 17/03/2009
Responsável : Jéssica Lana
Descrição   : Foi inserido a informação da 'SITUAÇÃO NO PLANO DO PARTICIPANTE'
              para facilitar o atendimento.
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27846
Data        : 12/05/2008
Responsável : Daniel Simões
Descrição   : Ao exlcuir um registro em qualquer das sub-abas pertencentes a aba
              'Dados do Participante', o registro entrava em modo de edição e se
              clica-se no botão ok o registro era excluido. Passa a excluir os
              registros da forma convencional.
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27845
Data        : 09/05/2008
Responsável : Daniel Simões
Descrição   : Mudança na estrutura na aba 'Dados do Participante'.
              1ª.: Em cada sub-aba havia um componente 'TDock97'. Retirei todas
                   elas e coloquei apenas uma, onde atende as necessidades de
                   todas as sub-abas.

              2ª.: Consertei o erro relatado na pendência onde ao clicar nos
                   botões de 'Incluir/Alterar/Excluir' e após clicasse em 'Ok'
                   ou 'Cancelar' os mesmos continuavam "apertados".

              3ª.: Também retirei todos os botões de 'Ok/Cancelar/Voltar' de
                   cada sub-aba e coloquei uma só que atende a todas elas.

              ps.: Não é o ideal. O certo seria implementar toda essa rotina de
                   'Mestre/Detalhe' de acordo com o padrão especificado, mas
                   fazer isso seria muito trabalhoso e teria que mexer em vários
                   pontos da tela, o que poderia comprometer o funcionamento da
                   mesma, além de levar muito mais tempo para realizar essa
                   correção. 
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27751
Data        : 28/04/2008
Responsável : Daniel Simões
Descrição   : Passa a testar se a query 'qryContaCorrente' está em modo de
              edição ou inserção na hora de atribuir algum valor para ela no
              OnExit do componente edit 'edDigBanco'...
--------------------------------------------------------------------------------
Pendência   : 27033
Data        : 07/12/2007
Responsável : Daniel Simões
Descrição   : Algumas 'Tab's' foram redimensionadas para poderem ser
              visualizadas inteiramente na resolução "800x600" ...
--------------------------------------------------------------------------------
Pendência   : 26886
Data        : 19/11/2007
Responsável : Daniel Simões
Descrição   : Recompilação do projeto para trazer os dados na tela de Consulta
              Contratos de Empréstimo...
--------------------------------------------------------------------------------
Pendência   : 23929
Data        : 08/11/2007
Responsável : Daniel Simões
Descrição   : Implementada crítica para preencher o e-mail de forma correta
              ( nome "@" email.com ) ...
--------------------------------------------------------------------------------
Pendência   : 26645
Data        : 19/10/2007
Responsável : Gustavo Mendes
Descrição   : Corrigindo grid de assunto, pois estava inserindo uma linha em
              branco e ao gravar estorava um erro de constraint.
--------------------------------------------------------------------------------
Pendência   : 23998
Data        : 20/01/2007
Responsável : Daniel Simões
Descrição   : Feito um join na query "qryAssuntoXAtend" da tabela ASSUNTOXATEND
              com a tabela RUBS para ser exibido o número da Rubs no grid de
              Assunto...
--------------------------------------------------------------------------------
Pendência   : 23991
Data        : 19/12/2006
Responsável : Daniel Simões
Descrição   : Correção na tela de atendimento ao entrar na Consulta Geral de
              Pessoas. Estava entrando a tela de busca, quando o certo seria
              entrar direto na CGP já com os dados carregados do participante
              selecionado no atendimento...
--------------------------------------------------------------------------------
Pendência   : 23992
Data        : 18/12/2006
Responsável : Daniel Simões
Descrição   : Correção na chamada da query da tela de busca Consulta Geral de
              Pessoas. O campo "Situação atual na Fundação" estav preenchendo
              errado. Foi alterado na query de 'DESCRICAO' para 'SITFUND'...
--------------------------------------------------------------------------------
Pendência   : 23988
Data        : 15/12/2006
Responsável : Daniel Simões
Descrição   : Reposicionamento do CMECadastroInsert na função
              MostraConsultaAtendimento...
--------------------------------------------------------------------------------
Pendência   : 21551
Data        : 12/09/2006
Responsável : Daniel Simões
Descrição   : Alteração do form de busca do participante/dependente na tela de
              atendimento. Passa a buscar pelo Form "fConsPessoaGeral" usado na
              Consulta Geral de Pessoas, ao invés do busca do MontaSelect, que
              era a forma de busca anterior...
--------------------------------------------------------------------------------
Andre tavares - pendencia 17981 - 13/01/2005
Andre tavares - pendencia 17975 - 12/01/2005
Andre tavares - pendência 17224 - 23/07/2004
Andre tavares - pendência 15718 - 20/02/2004
Andre tavares - pendência 15870 - 06/01/2004
André Tavares - pendência 15531 - 03/11/2003
André tavares - pendência 15048 - 17/09/2003
--------------------------------------------------------------------------------
Pendência   : 14219
Responsável : Gleyber
Data        : 05/05/2003
Descrição   : Ao se escolher a cidade muda-se automaticamente o estado.
--------------------------------------------------------------------------------
Pendência   :
Responsável : André Tavares
Data        : 10/01/2002
Descrição   : Atualizado o método CmeCadastroFind. Inclui cidade, IdTipoAtend no
              montaselect e alimenta os campos Tipo de Atendimento CIDADE e UF
              na consulta de atendimento.
--------------------------------------------------------------------------------
Atualizado em SET/2001 - Flavio Dias (FDIAS) (FCRT)
--------------------------------------------------------------------------------
Atualizado em 15/10/2000
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FAtend;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
   StdCtrls, Buttons,  ComCtrls, ToolWin, Grids, Wwdbigrd,
   Wwdbgrid, ExtCtrls, wwdblook, Mask, MskEdDlg, DBTables,
   wwdbedit, wwriched,  TB97, TB97Ctls, TB97Tlbr, IvDictio, IvMulti,
   IvEMulti, Menus, CMDBLookupCombo, FCadastroGrid, MontaSelect, Wwdotdot,
   Wwdbcomb, FCadastroCS, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn,
   fcClearPanel, fcButtonGroup, fcOutlookBar, CMProcura, JCLSysUtils,
   {$IFNDEF Versao05} UcmTypes, {$ELSE} uComum, {$ENDIF} Fpreview,

   ppCtrls, ppBands, ppPrnabl,
   ppClass, ppProd, ppReport, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
   ppSubRpt, ppRegion, ppRichTx, ppForms, ppPrvDlg, ppTypes, ppMemo, ppVar,
   ppRelatv, ppDBPipe, ppEndUsr,

   CMDateTimePicker, Wwquery, CmEventosCadastro, ImgList,
   uValidaDoc, CheckLst, wwdbdatetimepicker,
   Wwtable, TREdit,Ufiario, uIntegraEP, fCadInscricao, uConsPart,
   rContrato, FExecquitacao, fCancQuitacao, fExecAmortizacao, fCancAmortizacao
   ,FExecTrataParcela ,fAgendaComum, fCalendarioAgenda
   {$IFNDEF Padrao_5_09_11 } ,FMTAcompProc {$ELSE} ,FAcompProc, ppEndUsr,
   ppVar, ppCtrls, ppPrnabl {$ENDIF}

   , FConsPessoaGeral, dConsPart, dConsPart1, uIntegraModulo, DBGrids; // Daniel - 21551


type
   TRegAtendimento = Record
      IDATEND            : Real;
      IDTIPOATEND        : Real;
      CODATEND           : Real;
      DATA               : TDateTime;
      NOMESOLICITANTE    : String;
      TELSOLICITANTE     : String;
      CODATENDENTE       : String;
      RESPOSTA           : String;
      STATUS             : String;
      OBSERVACAO         : String;
      IDTITULAR          : Real;
      IDPESSJUR          : Real;
      DATAINICIO         : TDateTime;
      LOGRADOURO         : String;
      NUMEROSOLIC        : String;
      COMPLEMSOLIC       : String;
      BAIRROSOLIC        : String;
      CEPSOLIC           : String;
      CIDADESOLIC        : String;
      IDESTADO           : Integer;
      PERGUNTA           : String;
      COMPLCODATEND      : Real;
      IDLOCALATENDXCPU   : Real;
      DDISOLIC           : String;
      DDDSOLIC           : String;
      TIPOSOLIC          : String;
      NUMEROTELSOLIC     : String;
      IDTELEFONE         : Real;
      CODESTADOSOLIC     : String;
      IDBENEFICIARIO     : Real;
      IDPLANOPREV        : Integer;
      sequencia          : Integer;
      NUMDOCUMENTOCPF    : string;
      NUMDOCUMENTORG     : string;
      EMAIL              : string;
      DTHORACHEGADA      : tDateTime;
      IDUSUARIO          : Integer; // André Tavares - 15048 - 17/09/2003
      NomeContatoTel     : String; // Daniel Simões - 22898
   end;

   TfrmAtend = class(TfrmCadastroCS)
      PgAtend             : TPageControl;
      TbShtAtend          : TTabSheet;
      Timer1              : TTimer;
      dspartprev          : TwwDataSource;
      dsreserva           : TwwDataSource;
      Panel1              : TPanel;
      Label11             : TLabel;
      Label12             : TLabel;
      Label7              : TLabel;
      Label8              : TLabel;
      Label39             : TLabel;
      EdMat: TEdit;
      EdCpf: TEdit;
      EdInsc: TEdit;
      EdPlano: TEdit;
      EdNome: TEdit;
      edPatro                : TEdit;
      BtnConsultaAtendimento : TBitBtn;
      TbDadosAtend        : TTabSheet;
      Label2              : TLabel;
      Label20             : TLabel;
      Label21             : TLabel;
      Label22             : TLabel;
      Label23             : TLabel;
      Label24             : TLabel;
      Label26             : TLabel;
      edtLogradouro       : TwwDBEdit;
      edtNumero           : TwwDBEdit;
      edtComplem          : TwwDBEdit;
      edtbairro           : TwwDBEdit;
      edtcep              : TwwDBEdit;
      DBEdNomeSol: TwwDBEdit;
      TbsAssuntos         : TTabSheet;
      MsResposta          : TMontaSelect;
      GpAnteiror          : TGroupBox;
      EdCod: TEdit;
      EdSeque: TEdit;
      TbsGeral            : TTabSheet;
      Observacao          : TLabel;
      Label25             : TLabel;
      MemResposta: TwwDBRichEdit;
      MenPerguntaATEND: TwwDBRichEdit;
      Label29             : TLabel;
      MemObs: TwwDBRichEdit;
      Dock973             : TDock97;
      tb97BotoesDetalhe   : TToolbar97;
      sbtnInsDet          : TSpeedButton;
      sbtnExcluiDet       : TSpeedButton;
      PnlAssunto          : TPanel;
      assunto             : TLabel;
      Label27             : TLabel;
      BtnGetResposta      : TBitBtn;
      DBCheckBox1         : TDBCheckBox;
      DBCheckBox2         : TDBCheckBox;
      Dock974             : TDock97;
      tb97Detalhe         : TToolbar97;
      bbtnOkDet           : TBitBtn;
      bbtnCancelarDet     : TBitBtn;
      bbtnVoltarDet       : TBitBtn;
      QryAssuntoxAtend    : TwwQuery;
      DsAssuntoxAtend     : TwwDataSource;
      UpdAssuntoxAtend    : TUpdateSQL;
      EdtSitCad           : TEdit;
      QryAssuntoxAtendAnt : TwwQuery;
      DsAssuntoxAtendAnt  : TwwDataSource;
      QryAssuntoxAtendAntIDASSUNTOXATEND: TFloatField;
      QryAssuntoxAtendAntIDASSUNTO: TFloatField;
      QryAssuntoxAtendAntIDATEND: TFloatField;
      QryAssuntoxAtendAntIDASSUNTOXRESP: TFloatField;
      QryAssuntoxAtendAntIDPROCESSO: TFloatField;
      QryAssuntoxAtendAntEXISTERAD: TFloatField;
      QryAssuntoxAtendAntEXISTERUB: TFloatField;
      QryAssuntoxAtendAntNOME: TStringField;
      QryAssuntoxAtendAntIDTIPOPROCESSO: TFloatField;
      QryAssuntoxAtendAntIDMODELORUB: TFloatField;
      BtnAtendAnt         : TBitBtn;
      LblAssunto          : TLabel;
      QryAssuntoxAtendAntDESCRESPATEN: TMemoField;
      DBEdit1             : TDBEdit;
      ReResposta          : TwwDBRichEdit;
      MsFormaAtend        : TMontaSelect;
      PnlAssuntoAtend     : TPanel;
      GrdAssunto          : TwwDBGrid;
      Splitter5           : TSplitter;
      ReRespostaAux       : TwwDBRichEdit;
      QryBuscaResposta    : TwwQuery;
      QryBuscaRespostaDESCRESPATEN: TMemoField;
      PpmRubsPendentes    : TPopupMenu;
      PpmCancela          : TMenuItem;
      PpmGera2via         : TMenuItem;
      PpmEmite2Via        : TMenuItem;
      PpmEmite            : TMenuItem;
      CkbFiltraPlano      : TCheckBox;
      Bevel1              : TBevel;
      Bevel2              : TBevel;
      Bevel3              : TBevel;
      Label4              : TLabel;
      QryEstado           : TwwQuery;
      QryEstadoCODESTADO  : TStringField;
      tbsDadosParticip    : TTabSheet;
      QryEstadoIDESTADO   : TFloatField;
      QryAssuntoxAtendAntIDRUB: TFloatField;
      QRYALTRUBS          : TwwQuery;
      tbShtSimulaBenef    : TTabSheet;
      dbDataDib           : TCMDateTimePicker;
      dbdatademissao      : TCMDateTimePicker;
      dbdatarequerimento  : TCMDateTimePicker;
      dbDataEvento        : TCMDateTimePicker;
      Label49             : TLabel;
      Label50             : TLabel;
      Label51             : TLabel;
      Label52             : TLabel;
      Label53             : TLabel;
      Label54             : TLabel;
      Label55             : TLabel;
      bbnumerobeneficiario: TMaskEdit;
      qryTipoAtend        : TwwQuery;
      dsTipoAtend         : TwwDataSource;
      qryCidades          : TwwQuery;
      dblkCidade          : TwwDBLookupCombo;
      qryUF               : TwwQuery;
      dblkEstado          : TwwDBLookupCombo;
      tbbConsultaParticip : TToolbarButton97;
      Label38             : TLabel;
      edtDDI              : TwwDBEdit;
      edtDDD              : TwwDBEdit;
      Label41             : TLabel;
      edtNumeroTelefone   : TwwDBEdit;
      Label31             : TLabel;
      pnlDadosAtendimento : TPanel;
      Label3              : TLabel;
      dblkTipoAtendimento : TwwDBLookupCombo;
      Label28             : TLabel;
      dbdateInicio        : TCMDateTimePicker;
      dbdateFim           : TCMDateTimePicker;
      Label1              : TLabel;
      Label40             : TLabel;
      EdDlgHoraInicio: TcmMaskEditDlg;
      Label6              : TLabel;
      EdDlgHora: TcmMaskEditDlg;
      Label9              : TLabel;
      ednum               : TwwDBEdit;
      Label17             : TLabel;
      EdSeq: TwwDBEdit;
      DbEdAtend: TEdit;
      Label5              : TLabel;
      Label30             : TLabel;
      wwDBEdit3           : TwwDBEdit;
      GroupBox4           : TGroupBox;
      chkTipoTelefone     : TCheckListBox;
      pgCtrlDadosParticip : TPageControl;
      tbsEnderecos        : TTabSheet;
      tbsTelefones        : TTabSheet;
      dbEnderecos         : TwwDBGrid;
      dsEnderecos         : TwwDataSource;
      qryEnderecos: TwwQuery;
      qryTelefones        : TwwQuery;
      dsTelefone          : TwwDataSource;
      updTelefones        : TUpdateSQL;
      updEnderecos        : TUpdateSQL;
      tbsContaCorrente    : TTabSheet;
      qryParam            : TwwQuery;
      pnlContasCorrentes  : TPanel;
      DBGCONTASCORRENTE: TwwDBGrid;
      updContaCorrente    : TUpdateSQL;
      dsContaCorrente     : TwwDataSource;
      qryContaCorrente    : TwwQuery;
      EDIDPLANOPREV: TEdit;
      qryPessoa: TwwQuery;
      qryPessoaIDENDCORRESP: TFloatField;
      qryPessoaIDENDCOMERCIAL: TFloatField;
      qryPessoaIDENDENTREGA: TFloatField;
      qryPessoaIDENDRESIDENCIAL: TFloatField;
      qryPessoaIDENDCOBRANCA: TFloatField;
      qryCidadesIDCIDADES: TFloatField;
      qryCidadesCODESTADO: TStringField;
      qryCidadesNOME: TStringField;
      qryCidadesIDESTADO: TFloatField;
      qryCidadesIDPAIS: TFloatField;
      QRYINSENDERECO: TwwQuery;
      qryaltendereco: TwwQuery;
      QryEstadoIDPAIS: TFloatField;
      QRYESTADO1: TwwQuery;
      PopupMenu1: TPopupMenu;
      qrycomercial: TwwQuery;
      qryresidencial: TwwQuery;
      qryentrega: TwwQuery;
      qrycobranca: TwwQuery;
      qrycorresp: TwwQuery;
      pnlEnderecos: TPanel;
      Label10: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      Label15: TLabel;
      pnl: TPanel;
      btnEndOk: TBitBtn;
      btnEndCancelar: TBitBtn;
      btnEndVoltar: TBitBtn;
      pnlTelefones: TPanel;
      dbgTelefones: TwwDBGrid;
      pnlCadTelefones: TPanel;
      Label36: TLabel;
      Label37: TLabel;
      Label42: TLabel;
      Label43: TLabel;
      GroupBox2: TGroupBox;
      chkTelComercial: TCheckBox;
      chkTelFax: TCheckBox;
      chkTelCelular: TCheckBox;
      chkTelRecado: TCheckBox;
      chkTelParticular: TCheckBox;
      dblkLogradouro: TwwDBLookupCombo;
      edtTelDDI: TwwDBEdit;
      edtTelDDD: TwwDBEdit;
      edtTelNumeroTelefone: TwwDBEdit;
      btnTelOk: TBitBtn;
      btnTelCancelar: TBitBtn;
      btnTelVoltar: TBitBtn;
      qryTelefonesLOGRADOURO: TStringField;
      qryTelefonesDDI: TStringField;
      qryTelefonesDDD: TStringField;
      qryTelefonesNUMERO: TStringField;
      qryTelefonesTIPO: TStringField;
      qryInsereTelefone: TQuery;
      qryAlteraTelefone: TQuery;
      qryTelefonesIDTELEFONE: TFloatField;
      qryTelefonesIDENDERECO: TFloatField;
      dblkpcmbBanco: TwwDBLookupCombo;
      dblkpcmbAgencia: TwwDBLookupCombo;
      Panel3: TPanel;
      Label45: TLabel;
      Label47: TLabel;
      dbedContaBancaria: TDBEdit;
      Label48: TLabel;
      rgrpTipoConta: TDBRadioGroup;
      dbgrpContaPref: TDBRadioGroup;
      dbgrpContaConj: TDBRadioGroup;
      btnCCOk: TBitBtn;
      btnCCCancelar: TBitBtn;
      btnCCVoltar: TBitBtn;
      qryBanco: TwwQuery;
      qryAgencia: TwwQuery;
      qryInsContaCorrente: TwwQuery;
      QRYALTCONTACORRENTEOLD: TwwQuery;
      qryBancoIDPESSOA: TFloatField;
      qryBancoBANCO: TStringField;
      qryBancoNUMBANCO: TStringField;
      qryAgenciaIDPESSOA: TFloatField;
      qryAgenciaAGENCIA: TStringField;
      qryAgenciaNUMAGENCIA: TStringField;
      qryAgenciaIDBANCO: TFloatField;
      Label44: TLabel;
      qrycontapreferencial: TwwQuery;
      qrycontapreferencialIDCBANCARIA: TFloatField;
      qrycontapreferencialCONTACORRENTE: TStringField;
      qrycontapreferencialIDAGENCIA: TFloatField;
      qrycontapreferencialFLGCONTAPREF: TFloatField;
      qrycontapreferencialIDPESSOA: TFloatField;
      qrycontapreferencialTIPOCONTA: TStringField;
      qrycontapreferencialFLGCONTACONJUNTA: TStringField;
      qrycontapreferencialIDBANCO: TFloatField;
      qrycontapreferencialNOMEAGENCIA: TStringField;
      qrycontapreferencialNOMEBANCO: TStringField;
      qrycontapreferencialDESCTIPO: TStringField;
      QRYAGENCIA1: TwwQuery;
      QRYAGENCIA1IDPESSOA: TFloatField;
      QRYAGENCIA1NUMAGENCIA: TStringField;
      QRYAGENCIA1NOME: TStringField;
      qryGrupo: TwwQuery;
      qryexcendereco: TwwQuery;
      qryexctelefone: TwwQuery;
      qryExcContaCorrente: TwwQuery;
      QRYPENDECIA: TwwQuery;
      TbShtDocsXBenef: TTabSheet;
      DBGriddocsXbenef: TwwDBGrid;
      DSdocsXbenef: TwwDataSource;
      QrydocsXbenef: TwwQuery;
      Bevel4: TBevel;
      Label46: TLabel;
      QryGrupoAssunto: TwwQuery;
      DBLKAssunto: TwwDBLookupCombo;
      QryAssunto: TwwQuery;
      DBLKGrupoAssunto: TwwDBLookupCombo;
      DSAssunto: TwwDataSource;
      dblkBeneficio: TwwDBLookupCombo;
      dblkSitBenef: TwwDBLookupCombo;
      Label56: TLabel;
      Label57: TLabel;
      QryBeneficio: TwwQuery;
      qrySitBenef: TwwQuery;
      qrySitBenefIDSITBENEF: TFloatField;
      qrySitBenefDESCRICAO: TStringField;
      QrydocsXbenefNOMEDOCUMENTO: TStringField;
      QrydocsXbenefIDBENEFICIO: TFloatField;
      QrydocsXbenefIDSITBENEF: TFloatField;
      QryGrupoAssuntoDESCGRUPOASSUNTO: TStringField;
      QryGrupoAssuntoIDGRUPOASSUNTO: TFloatField;
      QryRespostaPadrao: TwwQuery;
      QryRespostaPadraoDESCRESPATEN: TMemoField;
      QryRespostaPadraoIDASSUNTOXRESP: TFloatField;
      QRYPENDECIAIDATEND: TFloatField;
      Label58: TLabel;
      DBedRG: TwwDBEdit;
      Label59: TLabel;
      DBedCPF: TwwDBEdit;
      Bevel5: TBevel;
      qrydocpessoa: TwwQuery;
      qryParamIDPESSOA: TFloatField;
      qryParamIDCARTAPADRAO: TFloatField;
      qryParamIDETIQPADRAO: TFloatField;
      qryParamIDTIPOATENDPADRAO: TFloatField;
      qryParamIDDOCRG: TFloatField;
      CMValidaCPF: TCMValidaDoc;
      qryTipoAtendIDTIPOATEND: TFloatField;
      qryTipoAtendNOME: TStringField;
      qryTipoAtendFLGEMITERUBS: TStringField;
      qryGrupoIDPESSOA: TFloatField;
      qryGrupoIDCARTAPADRAO: TFloatField;
      qryGrupoIDETIQPADRAO: TFloatField;
      qryGrupoIDTIPOATENDPADRAO: TFloatField;
      qryGrupoIDDOCRG: TFloatField;
      qryGrupoFLGCTRLPROTOCOLO: TFloatField;
      qryGrupoIDFIARIOENDINC: TFloatField;
      qryGrupoIDFIARIOENDALT: TFloatField;
      qryGrupoIDFIARIOENDEXC: TFloatField;
      qryGrupoIDFIARIOCCINC: TFloatField;
      qryGrupoIDFIARIOCCALT: TFloatField;
      qryGrupoIDFIARIOCCEXC: TFloatField;
      qryGrupoIDFIARIOTELINC: TFloatField;
      qryGrupoIDFIARIOTELALT: TFloatField;
      qryGrupoIDFIARIOTELEXC: TFloatField;
      qryGrupoIDPROTOCOLORUB: TFloatField;
      qryPessoaFisica: TwwQuery;
      qryPessoaFisicaFLGBLOQUEIO: TFloatField;
      qryCidadesUF: TStringField;
      qryIDATEND: TFloatField;
      qryIDTIPOATEND: TFloatField;
      qryCODATEND: TFloatField;
      qryDATA: TDateTimeField;
      qryNOMESOLICITANTE: TStringField;
      qryTELSOLICITANTE: TStringField;
      qryCODATENDENTE: TStringField;
      qryRESPOSTA: TStringField;
      qrySTATUS: TStringField;
      qryOBSERVACAO: TStringField;
      qryIDTITULAR: TFloatField;
      qryIDPESSJUR: TFloatField;
      qryDATAINICIO: TDateTimeField;
      qryLOGRADOURO: TStringField;
      qryNUMEROSOLIC: TStringField;
      qryCOMPLEMSOLIC: TStringField;
      qryBAIRROSOLIC: TStringField;
      qryCEPSOLIC: TStringField;
      qryCIDADESOLIC: TStringField;
      qryCOMPLCODATEND: TFloatField;
      qryIDLOCALATENDXCPU: TFloatField;
      qryPERGUNTA: TStringField;
      qryIDESTADO: TFloatField;
      qryDDISOLIC: TStringField;
      qryDDDSOLIC: TStringField;
      qryTIPOSOLIC: TStringField;
      qryNUMEROTELSOLIC: TStringField;
      qryIDTELEFONE: TFloatField;
      qryCODESTADOSOLIC: TStringField;
      qryIDBENEFICIARIO: TFloatField;
      qryNUMDOCUMENTOCPF: TStringField;
      qryNUMDOCUMENTORG: TStringField;
      BtnImprime: TBitBtn;
      BDEPdocsXbenef: TppBDEPipeline;
      ppRdocsXbenef: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppDBText1: TppDBText;
      DSBeneficio: TwwDataSource;
      ppBDEBeneficio: TppBDEPipeline;
      ppDBTextBeneficio: TppDBText;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDBText2: TppDBText;
      DSsitBenef: TwwDataSource;
      ppBDEPsitBenef: TppBDEPipeline;
      ppLabel3: TppLabel;
      qryFunPatroPlan: TwwQuery;
      DSfunPatroPlan: TwwDataSource;
      ppBDEPfunPatroPlan: TppBDEPipeline;
      ppDBText3: TppDBText;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppDBTextPatro: TppDBText;
      Calc2: TppSystemVariable;
      LblSistema: TppLabel;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppLine1: TppLine;
      ppDBImage1: TppDBImage;
      qryFun: TwwQuery;
      qryFunNOME: TStringField;
      qryFunRAZAOSOCIAL: TStringField;
      qryFunLOGRADOURO: TStringField;
      qryFunNUMERO: TStringField;
      qryFunCOMPLEMENTO: TStringField;
      qryFunBAIRRO: TStringField;
      qryFunCIDADE: TStringField;
      qryFunCODESTADO: TStringField;
      qryFunCEP: TStringField;
      qryFunIMAGEM: TBlobField;
      DSfun: TwwDataSource;
      ppBDEPipeline1: TppBDEPipeline;
      ppLine2: TppLine;
      ppLine3: TppLine;
      ppSystemVariable1: TppSystemVariable;
      QryBeneficioIDSERVICOS: TFloatField;
      QryBeneficioNOME: TStringField;
      MSParticipDepen_velho: TMontaSelect;
      EmailSolicit: TwwDBEdit;
      Label60: TLabel;
      qryEMAIL: TStringField;
      tbsDocumentos: TTabSheet;
      DBGDocumentos: TwwDBGrid;
      PnlDocumentos: TPanel;
      btnDocOk: TBitBtn;
      btnDocCancelar: TBitBtn;
      btnDocVoltar: TBitBtn;
      DBedRG2: TwwDBEdit;
      qryDocumentos: TwwQuery;
      DsDocumentos: TwwDataSource;
      UpdDocumentos: TUpdateSQL;
      qryDocumentosIDPESSOA: TFloatField;
      qryDocumentosNUMDOCUMENTO: TStringField;
      qryDocumentosNOMEDOCUMENTO: TStringField;
      qryTipoDocPessoa: TwwQuery;
      DBLKTipoDocPessoa: TwwDBLookupCombo;
      qryDocumentosIDDOCUMENTO: TFloatField;
      qryTipoDocPessoaIDDOCUMENTO: TFloatField;
      qryTipoDocPessoaNOMEDOCUMENTO: TStringField;
      Label61: TLabel;
      Label62: TLabel;
      qryParamFLGCTRLPROTOCOLO: TFloatField;
      qryParamIDFIARIOENDINC: TFloatField;
      qryParamIDFIARIOTELEXC: TFloatField;
      qryParamIDFIARIOTELALT: TFloatField;
      qryParamIDFIARIOTELINC: TFloatField;
      qryParamIDFIARIOCCEXC: TFloatField;
      qryParamIDFIARIOCCALT: TFloatField;
      qryParamIDFIARIOCCINC: TFloatField;
      qryParamIDFIARIOENDEXC: TFloatField;
      qryParamIDFIARIOENDALT: TFloatField;
      qryParamIDPROTOCOLORUB: TFloatField;
      qryParamFLGMUDALOCALATEND: TFloatField;
      qryParamFLGCONFIRMADATA: TFloatField;
      Label63: TLabel;
      QRYALTCONTACORRENTE: TwwQuery;
      qryContaCorrenteCONTACORRENTE: TStringField;
      qryContaCorrenteIDAGENCIA: TFloatField;
      qryContaCorrenteFLGCONTACONJUNTA: TStringField;
      qryContaCorrenteNOMEAGENCIA: TStringField;
      qryContaCorrenteNOMEBANCO: TStringField;
      qryContaCorrenteNUMAGENCIA: TStringField;
      qryContaCorrenteIDBANCO: TFloatField;
      qryContaCorrenteNUMBANCO: TStringField;
      qryContaCorrenteFLGCONTAPREF: TFloatField;
      qryContaCorrenteTIPOCONTA: TStringField;
      qryContaCorrenteTIPOCONTA_1: TStringField;
      qryContaCorrenteIDCBANCARIA: TFloatField;
      MsParticipDepen: TMontaSelect;
      qryTitular: TwwQuery;
      EdtBloqueio: TEdit;
      QryAssuntoxAtendIDASSUNTOXATEND: TFloatField;
      QryAssuntoxAtendIDASSUNTO: TFloatField;
      QryAssuntoxAtendIDATEND: TFloatField;
      QryAssuntoxAtendIDASSUNTOXRESP: TFloatField;
      QryAssuntoxAtendIDPROCESSO: TFloatField;
      QryAssuntoxAtendEXISTERAD: TFloatField;
      QryAssuntoxAtendEXISTERUB: TFloatField;
      QryAssuntoxAtendDESCRESPATEN: TMemoField;
      QryAssuntoxAtendNOME: TStringField;
      QryAssuntoxAtendIDTIPOPROCESSO: TFloatField;
      QryAssuntoxAtendIDMODELORUB: TFloatField;
      QryAssuntoxAtendIDGRUPOASSUNTO: TFloatField;
      QryAssuntoxAtendIDRUB: TFloatField;
      qryEnderecosIDPESSOA: TFloatField;
      qryEnderecosIDENDERECO: TFloatField;
      qryEnderecosIDCIDADES: TFloatField;
      qryEnderecosLOGRADOURO: TStringField;
      qryEnderecosIDPAIS: TFloatField;
      qryEnderecosNOME: TStringField;
      qryEnderecosCODESTADO: TStringField;
      qryEnderecosNUMERO: TStringField;
      qryEnderecosCOMPLEMENTO: TStringField;
      qryEnderecosBAIRRO: TStringField;
      qryEnderecosCIDADE: TStringField;
      qryEnderecosCEP: TStringField;
      qrySitPart: TwwQuery;
      tbbEmprestimo: TToolbarButton97;
      PpMenuEmptimo: TPopupMenu;
      InscricaoContrato: TMenuItem;
      Contratacao: TMenuItem;
      ConsultaContrato1: TMenuItem;
      qutacaoAntecipada: TMenuItem;
      CancelamentodeQuitacao: TMenuItem;
      Amortizacao: TMenuItem;
      CancelamentodeAmortizacao: TMenuItem;
      TratIndivParcelas1: TMenuItem;
      qryExecTelContato: TwwQuery;
      qryExecTelEndPess: TwwQuery;
      Label65: TLabel;
      qryDTHORACHEGADA: TDateTimeField;
      CMDTPHoraChegada: TCMDateTimePicker;
      qryIDUSUARIO: TFloatField;
      ToolbarButton971: TToolbarButton97;
      PpMenuPessoa: TPopupMenu;
      DadosPessoais1: TMenuItem;
      ContraCheque1: TMenuItem;
      qryClassifica: TwwQuery;
      qryAux: TwwQuery;
      QryAssuntoNOME: TStringField;
      QryAssuntoNOMEPLANOPREV: TStringField;
      QryAssuntoIDASSUNTO: TFloatField;
      QryAssuntoIDTIPOPROCESSO: TFloatField;
      QryAssuntoIDCONFIGRUBS: TFloatField;
      QryAssuntoIDGRUPOASSUNTO: TFloatField;
      QryAssuntoFLGCHAMAEMPRESTIM: TFloatField;
      QryAssuntoDESCRUB: TStringField;
      QryAssuntoIDPLANOPREV: TFloatField;
      edDigBanco: TwwDBEdit;
      Label66: TLabel;
      edDigAgencia: TwwDBEdit;
      qryVerifImpressao: TwwQuery;
      RptModelo: TppReport;
      ppDetailBand2: TppDetailBand;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppdetalhe_documentos: TppBDEPipeline;
      ppDetalhe_Dependente_IRRF: TppBDEPipeline;
      PpDados: TppBDEPipeline;
      ppDetalhe_Telefones: TppBDEPipeline;
      qryPlanoPrevBeneficiario: TwwQuery;
      N1: TMenuItem;
      N2: TMenuItem;
      N3: TMenuItem;
      N4: TMenuItem;
      N5: TMenuItem;
      mnuAssinaturaContrato: TMenuItem;
      mnuHistoricoSuspensao: TMenuItem;
      N6: TMenuItem;
      QrydocsXbenefOBSERVACAO: TMemoField;
      DBMemo1: TDBMemo;
      ppDBMemo1: TppDBMemo;
      btnAgendamento: TToolbarButton97;
      ToolbarSep972: TToolbarSep97;
      qryEmpresaProp: TQuery;
      qryUFCODESTADO: TStringField;
      qryUFNOMEESTADO: TStringField;
      qryUFIDESTADO: TFloatField;
      pnlEndereco: TPanel;
      EDLOGRADORO1: TwwDBEdit;
      ednumero1: TwwDBEdit;
      edcomplemento1: TwwDBEdit;
      edbairro1: TwwDBEdit;
      DbedLocal: TwwDBEdit;
      edcep1: TwwDBEdit;
      dblkestado1: TwwDBLookupCombo;
      dblkCidade1: TwwDBLookupCombo;
      Label16: TLabel;
      Label32: TLabel;
      Label64: TLabel;
      Label33: TLabel;
      Label34: TLabel;
      Label35: TLabel;
      Label18: TLabel;
      Label19: TLabel;
      GroupBox1: TGroupBox;
      chkbxComercial: TCheckBox;
      chkbxEntrega: TCheckBox;
      chkbxCobranca: TCheckBox;
      chkbxCorrespondencia: TCheckBox;
      chkbxResidencial: TCheckBox;
      ppDetalhe_Beneficiario: TppBDEPipeline;
      ppDetalhe_Dependente: TppBDEPipeline;
      tbsContatos: TTabSheet;
      pnlContatos: TPanel;
      btnContatoOk: TBitBtn;
      btnContatoCancel: TBitBtn;
      btnContatoVoltar: TBitBtn;
      mnbm: TLabel;
      lblPdeMail: TLabel;
      lblPdNome: TLabel;
      lblPdSetor: TLabel;
      lblNasc: TLabel;
      lblObs: TLabel;
      dbedContatoEmail: TDBEdit;
      dbedCargo: TDBEdit;
      dbedSetor: TDBEdit;
      GroupBox6: TGroupBox;
      dbgContatoRamal: TwwDBGrid;
      dbnInsereRamal: TDBNavigator;
      dbMemoObs: TDBMemo;
      dbedContatoNome: TDBEdit;
      dbedDataNascimento: TCMDateTimePicker;
      dbgContato: TwwDBGrid;
      qryContato: TwwQuery;
      dsContato: TwwDataSource;
      qryContatoIDCONTATO: TFloatField;
      qryContatoIDPESSOA: TFloatField;
      qryContatoIDENDERECO: TFloatField;
      qryContatoNOME: TStringField;
      qryContatoEMAIL: TStringField;
      qryContatoCARGO: TStringField;
      qryContatoSETOR: TStringField;
      qryContatoNASCIMENTO: TDateTimeField;
      qryContatoOBS: TMemoField;
      qryRamal: TwwQuery;
      qryRamalIDCONTATO: TFloatField;
      qryRamalIDTELEFONE: TFloatField;
      qryRamalRAMAL: TStringField;
      qryRamalNUMERO: TStringField;
      qryRamalNOME: TStringField;
      qryRamalIDTELCONTATO: TFloatField;
      dsRamal: TwwDataSource;
      qryContatoTelefones: TStringField;
      updContato: TUpdateSQL;
      updRamal: TUpdateSQL;
      qryInsereContato: TwwQuery;
      qryInsereRamal: TwwQuery;
      qryAlteraContato: TwwQuery;
      qryAlteraRamal: TwwQuery;
      qryExcluiContato: TwwQuery;
      qryExcluiRamal: TwwQuery;
      edtNomeContato: TwwDBEdit;
      Label67: TLabel;
      qryCONTATOTEL: TStringField;
      dblcTelefone: TCMDBLookupCombo;
      wwQuery1: TwwQuery;
      qryBancoFLGVALIDACC: TStringField;
      MS_Atendimento: TMontaSelect;
      QryAssuntoxAtendIDCONTRATOEMPTMO: TFloatField;
      QryAssuntoxAtendVLRSOLICITADO: TFloatField;
      QryAssuntoxAtendNUMPARCELAS: TFloatField;
      QryAssuntoxAtendFLGCHAMAEMPRESTIM: TFloatField;
      btnEmprestimo: TToolbarButton97;
      Dock9710: TDock97;
      Toolbar977: TToolbar97;
      sbtnInsereDetalhe: TToolbarButton97;
      sbtnAlteraDetalhe: TToolbarButton97;
      sbtnExcluiDetalhe: TToolbarButton97;
      Dock975: TDock97;
      Toolbar972: TToolbar97;
      btnOk: TBitBtn;
      btnCancelar: TBitBtn;
      btnVoltar: TBitBtn;
    EdSitPlano: TEdit;
    qryTitularNOME: TStringField;
    qryTitularNUMDOCUMENTO: TStringField;
    qryTitularINSCRICAONUMERO: TFloatField;
    qryTitularPLANO: TStringField;
    qryTitularIDRGELEGBENEF: TFloatField;
    qryTitularIDPLANOPREV: TFloatField;
    qryTitularPATRO: TStringField;
    qryTitularIDPESSJUR: TFloatField;
    qryTitularSEQPROPOSTA: TFloatField;
    qryTitularDESCRICAO: TStringField;
    qryTitularSITUACAONOPLANO: TStringField;
    QryProcJud: TQuery;
    DSProcJud: TDataSource;
    EdTipoRespon: TEdit;
    Label68: TLabel;
    EdNomeRespon: TEdit;
    Label69: TLabel;
    QryRespon: TQuery;
    DSRespon: TDataSource;
    QryDocRespon: TQuery;
    DSDocRespon: TDataSource;
    TbsOutrasInfor: TTabSheet;
    PageOutrasInfor: TPageControl;
    TbShtProcJud: TTabSheet;
    DBGridProcJud: TwwDBGrid;
    wwIButton2: TwwIButton;
    TbsDadosAlim: TTabSheet;
    QryAlimentada: TQuery;
    DsAlimetada: TDataSource;
    DBGridAlim: TwwDBGrid;
    wwIButton1: TwwIButton;
    PageDadosAssunto: TPageControl;
    wwDBGrid1: TwwDBGrid;
    wwIButton3: TwwIButton;
    qryPlanoPrevBeneficiarioNOME: TStringField;
    qryPlanoPrevBeneficiarioNUMDOCUMENTO: TStringField;
    qryPlanoPrevBeneficiarioINSCRICAONUMERO: TFloatField;
    qryPlanoPrevBeneficiarioPLANO: TStringField;
    qryPlanoPrevBeneficiarioIDRGELEGBENEF: TFloatField;
    qryPlanoPrevBeneficiarioIDPLANOPREV: TFloatField;
    qryPlanoPrevBeneficiarioPATRO: TStringField;
    qryPlanoPrevBeneficiarioIDPESSJUR: TFloatField;
    qryPlanoPrevBeneficiarioSEQPROPOSTA: TFloatField;
    qryPlanoPrevBeneficiarioDESCRICAO: TStringField;
    qryPlanoPrevBeneficiarioSITUACAONOPLANO: TStringField;
    qryPlanoPrevBeneficiarioFLGINTERNO: TStringField;
    qryPlanoPrevBeneficiarioNOME_TITULAR: TStringField;
    qryPlanoPrevBeneficiarioCPF_TITULAR: TStringField;
    qryPlanoPrevBeneficiarioMATRICULA_TITULAR: TStringField;
    qryPlanoPrevBeneficiarioIDTITULAR: TFloatField;
    qryPlanoPrevBeneficiarioEMAIL_TITULAR: TStringField;
    qryForceCommit: TwwQuery;


      procedure ValidaCampoNumericoDDD(var Key: char);
      procedure ValidaCampoNumerico(var Key: char);
      procedure Timer1Timer(Sender: TObject);
      procedure sbtnAlterarClick(Sender: TObject);
      procedure bbtnSairClick(Sender: TObject);
      procedure cmbfilialEnter(Sender: TObject);
      procedure dbgridempDblClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure BtnConsultaAtendimentoClick(Sender: TObject);
      procedure BtnGetRespostaClick(Sender: TObject);
      procedure sbtnInsDetClick(Sender: TObject);
      procedure sbtnExcluiDetClick(Sender: TObject);
      procedure bbtnVoltarDetClick(Sender: TObject);
      procedure bbtnOkDetClick(Sender: TObject);
      procedure dbgridprocDblClick(Sender: TObject);
      procedure BtnAtendAntClick(Sender: TObject);
      procedure bbtnCancelarDetClick(Sender: TObject);
      procedure ProcuraAssuntoValidaDados(Sender: TObject);
      procedure PgAtendChange(Sender: TObject);
      procedure GrdDocRecebidosCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure CkbFiltraPlanoClick(Sender: TObject);
      procedure edtufExit(Sender: TObject);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure tbshtConsPartEnter(Sender: TObject);
      procedure sbtnInserirClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure tbbConsultaParticipClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure dblkTipoAtendimentoExit(Sender: TObject);
      procedure btnEndVoltarClick(Sender: TObject);
      procedure btnEndCancelarClick(Sender: TObject);
      procedure btnEndOkClick(Sender: TObject);
      procedure tbsEnderecosShow(Sender: TObject);
      procedure btnTelOkClick(Sender: TObject);
      procedure btnTelCancelarClick(Sender: TObject);
      procedure btnTelVoltarClick(Sender: TObject);
      procedure tbsTelefonesShow(Sender: TObject);
      procedure btnCCOkClick(Sender: TObject);
      procedure btnCCCancelarClick(Sender: TObject);
      procedure btnCCVoltarClick(Sender: TObject);
      procedure tbsContaCorrenteShow(Sender: TObject);
      procedure dblkpcmbBancoExit(Sender: TObject);
      procedure TbShtDocsXBenefShow(Sender: TObject);
      procedure DBLKGrupoAssuntoChange(Sender: TObject);
      procedure DBLKAssuntoChange(Sender: TObject);
      procedure dblkSitBenefChange(Sender: TObject);
      procedure dblkBeneficioChange(Sender: TObject);
      procedure TbShtDocsXBenefEnter(Sender: TObject);
      procedure DBEdNomeSolChange(Sender: TObject);
      procedure TbsAssuntosEnter(Sender: TObject);
      procedure BtnImprimeClick(Sender: TObject);
      procedure pgCtrlDadosParticipEnter(Sender: TObject);
      procedure DBedRG2Change(Sender: TObject);
      procedure btnDocOkClick(Sender: TObject);
      procedure btnDocVoltarClick(Sender: TObject);
      procedure tbsDocumentosShow(Sender: TObject);
      procedure btnDocCancelarClick(Sender: TObject);
      procedure PageDadosAssuntoChange(Sender: TObject);
      procedure DblkNumAgenciaChange(Sender: TObject);
      procedure dblkpcmbAgenciaChange(Sender: TObject);
      procedure dblkpcmbBancoChange(Sender: TObject);
      procedure InscricaoContratoClick(Sender: TObject);
      procedure ContratacaoClick(Sender: TObject);
      procedure ConsultaContrato1Click(Sender: TObject);
      procedure qutacaoAntecipadaClick(Sender: TObject);
      procedure CancelamentodeQuitacaoClick(Sender: TObject);
      procedure AmortizacaoClick(Sender: TObject);
      procedure CancelamentodeAmortizacaoClick(Sender: TObject);
      procedure TratIndivParcelas1Click(Sender: TObject);
      procedure dblkCidadeChange(Sender: TObject);
      procedure rgrpTipoContaChange(Sender: TObject);
      procedure DadosPessoais1Click(Sender: TObject);
      procedure ContraCheque1Click(Sender: TObject);
      procedure edDigBancoExit(Sender: TObject);
      procedure edDigAgenciaExit(Sender: TObject);
      procedure GravaEmissaoCarta(Sender: TObject);
      procedure mnuAssinaturaContratoClick(Sender: TObject);
      procedure mnuHistoricoSuspensaoClick(Sender: TObject);
      procedure btnAgendamentoClick(Sender: TObject);
      procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
      procedure qryBeforeOpen(DataSet: TDataSet);
      procedure qryAfterOpen(DataSet: TDataSet);
      procedure CmeCadastroAfterConfirma(Sender: TObject);
      procedure btnContatoOkClick(Sender: TObject);
      procedure btnContatoCancelClick(Sender: TObject);
      procedure btnContatoVoltarClick(Sender: TObject);
      procedure tbsContatosShow(Sender: TObject);
      procedure dbgContatoKeyDown(Sender: TObject; var Key: Word;
        Shift: TShiftState);
      procedure dbnInsereRamalBeforeAction(Sender: TObject;
        Button: TNavigateBtn);
      procedure FormActivate(Sender: TObject);
      procedure sbtnProcurarClick(Sender: TObject);
      procedure QryAssuntoxAtendAfterScroll(DataSet: TDataSet);
      procedure btnEmprestimoClick(Sender: TObject);
      procedure AbrirQueryAssunto;
      procedure sbtnInsereDetalheClick(Sender: TObject);
      procedure sbtnAlteraDetalheClick(Sender: TObject);
      procedure sbtnExcluiDetalheClick(Sender: TObject);
      procedure btnOkClick(Sender: TObject);
      procedure btnCancelarClick(Sender: TObject);
      procedure btnVoltarClick(Sender: TObject);
      procedure tbsDadosParticipShow(Sender: TObject);
    procedure pgCtrlDadosParticipChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dblkCidade1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean); // Gustavo Mendes - 26645
    procedure edtNumeroTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure edtDDDKeyPress(Sender: TObject; var Key: Char);
    procedure edtDDIKeyPress(Sender: TObject; var Key: Char);
    procedure edtTelDDIKeyPress(Sender: TObject; var Key: Char);
    procedure edtTelDDDKeyPress(Sender: TObject; var Key: Char);
    procedure edtTelNumeroTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure edcep1KeyPress(Sender: TObject; var Key: Char);
    procedure edtcepKeyPress(Sender: TObject; var Key: Char);
    procedure pgCtrlDadosParticipChange(Sender: TObject); // Gustavo Mendes - 26645

   private
      Flagcheckinsere          : Boolean; //Petri Nocentini SOL 251827 PPM 764141
      bPodeAlterarEstado       : Boolean; // David - 21629
      IdAtendPendAnt           : Extended; // David - 21749 - ID do Atendimento pendente anterior
      sSituacaoAnt             : String;
      sIdAtendInsert           : String;
      sNomeOriginal            : String;
      sPatro                   : String;
      MatricSolicit            : String;
      NomeTit                  : String;
      NumCpfTit                : String;
      NumCpfSolicit            : String;
      NumCPF                   : String;
      MatricTit                : String;
      sSitPart                 : String;
      sPlano                   : String;
      NomeSolicit              : String;
      IdTitular                : String;
      IdPessjur                : String;
      IdTelefone               : String;
      IdPessoa                 : String;
      IdBeneficiario           : String;
      Sequencia                : String;
      IdSitPart                : Integer;
      iInscricao               : Integer;
      bNovoAtendimento         :  Boolean;
      habilitaAgendamento      : Boolean;

      // Daniel - 27845
      HabilitaInclusao         : Boolean;
      HabilitaEdicao           : Boolean;
      HabilitaExclusao         : Boolean;
      sFlgStatusQuery          : String;
      // Fim.

      iLinhaFiltro             : Integer;
      FlgExcluir               : Integer;
      bCancelaAtendimento      : Boolean;
      FiContratoEmptmo         : Extended;

      procedure Selecionar(const IdAtend: LongInt);
      procedure Selecionarfilhas;
      procedure PegaParticipanteAtend; // Daniel - 21551
      procedure AtualizaDadosRub;
      procedure AtualizaDetalhe(bAtualiza: Boolean);
      procedure AbreQryAssuntoxAtend;

      function BuscaAtendPend(IdTitular :LongInt) : boolean;
      function JaExistePreferencial: boolean;

      function VerificaAutorizacao(sIdOperFunc : String):boolean;//Fanuel Marinho SOL183267 Kintana1713326

      procedure VeriricaAbaDadosParticip;

      procedure ContinuaAtendPendente;
      procedure BuscaCpfRG(idpessoa : string);
      procedure ResetaQueries;

      function ValidaCpf(Cpf: String): Boolean;

      procedure AvisaPreenchimentoEndereco; // Daniel Simões - 21784
      procedure MostraConsultaAtendimento; // Daniel Simões - 21551
      procedure SetiContratoEmptmo(const Value: Extended);

      // Marchetti - 22046
      procedure HabilitaMenuEmprestimo(const iEvento : Integer);
      procedure HabilitaBotaoEmprestimo(const iEvento : Integer);
      // Fim.

      function GravaDadosAssuntoXEP : Boolean; // Marchetti - Pendencia 22042
   public
     IDPLANOPREV          : String;

// Daniel Simões - 21551 - Início ----------------------------------------------
     sIdPessoaConsPart    : String;
     sIdPessJurConsPart   : String;
     sIdPlanoPrevConsPart : String;
     sSeqPropostaConsPart : String;
     sDataBaseName        : String;
     sIdRgElegBenef       : String;
     sIdTitular           : String;
     iIdtitular           : Integer;
     iRetornou            : Integer; //SOL124254 - Ádler Souza
// Daniel Simões - 21551 - Fim -------------------------------------------------

     //Otacilio Aquino SOL 161927  KINTANA 1375111
     sIdPlano             : String;
     sPlanoPrev           : String;

      property iContratoEmptmo : Extended read FiContratoEmptmo write SetiContratoEmptmo;
   end;

var frmAtend  : TfrmAtend;
    ConsPart2 : TConsPart;
    deletaDoc : Boolean;


implementation


{$R *.DFM}


uses  UDataBase, UAutorizacao, UMensErro, FTelaAut, FConsHistRecEmp,
      USistema, dAtend, dRelCentralAP, Fconsatend, umoduloCap, uRad,
      uFuncaoGeral, uRubs, dBasedados, uAtendimento,UCalcDV,
      FPrincipal,  fDataHora, DRubs,
      fHistoricoSuspensaoCob, FCadAssinaturaContrato;


procedure TFrmAtend.ContinuaAtendPendente;
var RegAtendimento : TRegAtendimento;
begin
  GpAnteiror.Visible := True;
  bNovoAtendimento   := False;

  qry.First; // FDIAS - FCRT - 25.09.2001

  with RegAtendimento do begin
    IDATEND          := qryIDATEND.AsFloat;
    IDTIPOATEND      := qryIDTIPOATEND.AsFloat;
    CODATEND         := qryCODATEND.AsFloat;
    DATA             := qryDATA.AsDateTime;
    NOMESOLICITANTE  := qryNOMESOLICITANTE.AsString;
    NomeSolicit      := qryNOMESOLICITANTE.AsString;
    TELSOLICITANTE   := TrimLeft(TrimRight(qryTELSOLICITANTE.AsString));
    CODATENDENTE     := qryCODATENDENTE.AsString;
    RESPOSTA         := qryRESPOSTA.AsString;
    STATUS           := qrySTATUS.AsString;
    OBSERVACAO       := qryOBSERVACAO.AsString;
    IDTITULAR        := qryIDTITULAR.AsFloat;
    IDPESSJUR        := qryIDPESSJUR.AsFloat;
    DATAINICIO       := qryDATAINICIO.AsDateTime;
    LOGRADOURO       := qryLOGRADOURO.AsString;
    NUMEROSOLIC      := qryNUMEROSOLIC.AsString;
    COMPLEMSOLIC     := qryCOMPLEMSOLIC.AsString;
    BAIRROSOLIC      := qryBAIRROSOLIC.AsString;
    CEPSOLIC         := qryCEPSOLIC.AsString;
    CIDADESOLIC      := qryCIDADESOLIC.AsString;
    IDESTADO         := qryIDESTADO.AsInteger;
    PERGUNTA         := qryPERGUNTA.AsString;
    COMPLCODATEND    := qryCOMPLCODATEND.AsFloat;
    IDLOCALATENDXCPU := qryIDLOCALATENDXCPU.AsFloat;
    DDISOLIC         := qryDDISOLIC.AsString;
    DDDSOLIC         := qryDDDSOLIC.AsString;
    TIPOSOLIC        := qryTIPOSOLIC.AsString;
    NUMEROTELSOLIC   := TrimLeft(TrimRight(qryNUMEROTELSOLIC.AsString));
    NomeContatoTel   := qryCONTATOTEL.AsString; // Daniel Simões - 22898
    IDTelefone       := qryIDTelefone.AsFloat;
    CODESTADOSOLIC   := qryCODESTADOSOLIC.AsString;
    IDbeneficiario   := qryIDbeneficiario.AsFloat;
    NUMDOCUMENTOCPF  := qryNUMDOCUMENTOCPF.AsString;
    NumCpfSolicit    := qryNUMDOCUMENTOCPF.AsString;
    NUMDOCUMENTORG   := qryNUMDOCUMENTORG.AsString;
    EMAIL            := qryEMAIL.AsString;
    DTHORACHEGADA    := qryDTHORACHEGADA.AsDateTime;
    IDUSUARIO        := Sistema.IdUsuario; // André Tavares - 15048 - 17/09/2003
  end;

  // David - 21749
  IdAtendPendAnt := qryIDATEND.AsFloat;
  sSituacaoAnt   := qrySTATUS.AsString;
  // Fim.

  Qry.Cancel;
  Qry.Edit;
  QrySTATUS.AsString := 'Concluído';
  Qry.Post;

  with QryAssuntoxAtendAnt do begin
    if Active       then Close;
    if not Prepared then Prepare;

    ParamByName('IDATEND').AsFloat := qryIDATEND.AsFloat;
    Open;
  end;

  Qry.Append;

  CmeCadastro.Operacao := OpInserir;
  CmeCadastro.AtualizaBotoes(Self);

  with RegAtendimento do begin
    qryIDATEND.AsFloat          := 0;
    qryIDTIPOATEND.AsFloat      := IDTIPOATEND;
    qryCODATEND.AsFloat         := CODATEND;
    qryDATA.AsDateTime          := Now;
    qryNOMESOLICITANTE.AsString := NOMESOLICITANTE;
    NomeSolicit                 := qryNOMESOLICITANTE.AsString;
    qryTELSOLICITANTE.AsString  := TrimLeft(TrimRight(TELSOLICITANTE));
    qryCODATENDENTE.AsString    := CODATENDENTE;
    qryRESPOSTA.AsString        := RESPOSTA;
    qrySTATUS.AsString          := STATUS;
    qryOBSERVACAO.AsString      := OBSERVACAO;
    qryIDTITULAR.AsFloat        := IDTITULAR;
    qryIDPESSJUR.AsFloat        := IDPESSJUR;
    qryDATAINICIO.AsDateTime    := Now;
    qryLOGRADOURO.AsString      := LOGRADOURO;
    qryNUMEROSOLIC.AsString     := NUMEROSOLIC;
    qryCOMPLEMSOLIC.AsString    := COMPLEMSOLIC;
    qryBAIRROSOLIC.AsString     := BAIRROSOLIC;
    qryCEPSOLIC.AsString        := CEPSOLIC;
    qryCIDADESOLIC.AsString     := CIDADESOLIC;
    qryDDISOLIC.AsString        := DDISOLIC;
    qryDDDSOLIC.AsString        := DDDSOLIC;
    qryTIPOSOLIC.AsString       := TIPOSOLIC;
    qryNUMEROTELSOLIC.AsString  := TrimLeft(TrimRight(NUMEROTELSOLIC));
    qryCONTATOTEL.AsString      := NomeContatoTel; // Daniel Simões - 22898
    qryTELSOLICITANTE.AsString  := TrimLeft(TrimRight(NUMEROTELSOLIC));
    qryIDTelefone.AsFloat       := IDTELEFONE;
    qrycodestadosolic.AsString  := CODESTADOSOLIC;
    qryIDbeneficiario.AsFloat   := IDBENEFICIARIO;
    qryPERGUNTA.AsString        := PERGUNTA;
    qryCOMPLCODATEND.AsFloat    := COMPLCODATEND;
    qryNUMDOCUMENTOCPF.AsString := NUMDOCUMENTOCPF;
    NumCpfSolicit               := qryNUMDOCUMENTOCPF.asString;
    qryNUMDOCUMENTORG.AsString  := NUMDOCUMENTORG;
    qryEMAIL.AsString           := EMAIL;
    qryDTHORACHEGADA.AsDateTime := DTHORACHEGADA;
    qryIDUSUARIO.AsFloat        := Sistema.IdUsuario; // André Tavares - 15048 - 17/09/2003

    if (IDESTADO<>0) then
         qryIDESTADO.AsInteger := IDESTADO
    else qryIDESTADO.Clear;

    if (ModuloCap.IdTipoAtend<>0) then qryIDTIPOATEND.AsFloat := ModuloCap.IdTipoAtend;
  end;

  SelecionarFilhas;

  with dtmAtend.QryCountAtend do begin
    if Active       then Close;
    if not Prepared then Prepare;

    ParamByname('CODATEND').AsFloat := RegAtendimento.CodAtend;
    Open;

    qryCOMPLCODATEND.AsFloat := FieldByName('NUMATEND').AsFloat;
    EdCod.Text               := FloattoStr(qryCODATEND.AsFloat);
    EdSeque.Text             := FloatToStr(FieldByName('NUMATEND').AsFloat - 1);
    Close;

  end;

  AbreQryAssuntoxAtend;
  DBEdNomeSolChange(self);

  // Tavares - 24/09/2002

  qryAssuntoXAtendAnt.first;
  while not qryAssuntoXAtendAnt.eof do
  begin
     QryAssuntoxAtend.Append;
     QryAssuntoxAtendIDATEND.AsFloat    := QryIDATEND.AsFloat;
     QryAssuntoxAtendDESCRESPATEN.Clear;
     qryAssuntoXAtendNOME.AsString      := qryAssuntoXAtendAntNOME.AsString;
     qryAssuntoXAtendIDASSUNTO.AsString := qryAssuntoXAtendAntIDASSUNTO.AsString;
     QryAssuntoxAtend.Post;
     qryAssuntoXAtendAnt.Next;
  end;
  // Tavares - 24/09/2002
end;

procedure TFrmAtend.CmeCadastroInsert(Sender: TObject);
begin
  sIdAtendInsert              := '';
  CmeCadastro.RepetirInsert   := False;
  PgAtend.Enabled             := True;
  PgAtend.ActivePage          := TbShtAtend;
  PageDadosAssunto.ActivePage := TbDadosAtend;
  TbDadosAtend.Enabled        := True;
  BtnAtendAnt.Tag             := 0;
  sbtnInsDet.Visible          := True;
  sbtnExcluiDet.Visible       := True;
  BtnGetResposta.Visible      := True;
  tb97BotoesDetalhe.Visible   := True;
  GrdAssunto.DataSource       := DsAssuntoxAtend;
  LblAssunto.Caption          := 'Assuntos do Atendimento Corrente';
  LblAssunto.Left             := 112;

  if (Qry.IsEmpty) or (MsgDlg('Deseja Continuar o atendimento ?','Atendimento',mtConfirmation,[mbYes,mbNO],0)=mrNo) then
  begin
    bNovoAtendimento := True; // Novo Atendimento...

    if (QryAssuntoxAtendAnt.Active) then QryAssuntoxAtendAnt.Close;

    inherited;

    GpAnteiror.Visible := False;
    PegaParticipanteAtend;

    qryClassifica.Close;
    qryClassifica.Sql.Text := 'SELECT IDPESSOA FROM PARTPREVPLAN WHERE IDPESSOA = '+IdTitular;
    qryClassifica.Open;

    if (qryClassifica.IsEmpty) and (Application.MessageBox('O Titular Selecionado é Apenas um Elegível. Deseja Continuar o Atendimento ?','Atendimento',Mb_YesNo+Mb_IConQuestion)=Id_No) then
    begin
      bbtnCancelarClick( nil );
      //Abort;
      Exit;
    end;

    // Se é participante...
    if (dtmConsPart1.Cds.FieldByName('IDTITULAR').AsString=dtmConsPart1.Cds.FieldByName('IDPESSOA').AsString) then begin
      Tag := 0;

      qryIDUSUARIO.AsFloat        := Sistema.IdUsuario;
      qrycodatendente.AsFloat     := Sistema.IdUsuario;
      qryIdPessjur.AsFloat        := StrToFloat(IdPessJur);
      qryIdTitular.AsFloat        := StrToFloat(IdTitular);
      qryCODATEND.AsFloat         := qryIDATEND.AsFloat;
      qryIDLOCALATENDXCPU.AsFloat := ModuloCap.IdLocaAtendxCpu;
      qryCOMPLCODATEND.AsFloat    := 0;

      if (ModuloCap.IdTipoAtend<>0) then qryIDTIPOATEND.AsFloat := ModuloCap.IdTipoAtend;
    end else begin {Senão é um dependente}
      Tag := 1;

      qryIDUSUARIO.AsFloat        := Sistema.IdUsuario;
      qryCODATENDENTE.AsFloat     := Sistema.IdUsuario;
      qryIDPESSJUR.AsFloat        := StrToFloat(IdPessJur);
      qryIDTITULAR.AsFloat        := StrToFloat(IdTitular);
      qryIDBENEFICIARIO.AsFloat   := StrToFloat(IdBeneficiario);
      qryCODATEND.AsFloat         := qryIDATEND.AsFloat;
      qryIDLOCALATENDXCPU.AsFloat := ModuloCap.IdLocaAtendxCpu;
      qryCOMPLCODATEND.AsFloat    := 0;

      if (ModuloCap.IdTipoAtend<>0) then qryIDTIPOATEND.AsFloat := ModuloCap.IdTipoAtend;
    end;

    AbreQryAssuntoxAtend;

    if ( BuscaAtendPend(StrToInt(IdTitular)) ) then begin
      if ( Application.MessageBox('Deseja Continuar o atendimento ?','Atendimento',Mb_YesNo+Mb_IConQuestion)=Id_Yes ) then
      begin
        Selecionar(qryPENDECIAIDATEND.AsInteger);

        // Continua atendimento Pendente...
        ContinuaAtendPendente;
      end;
    end;

    qryAssunto.Close;
    qryGrupoAssunto.Close;
    AbrirQueryAssunto; // Gustavo Mendes - 26645

    if (bNovoAtendimento) then begin
      EdCod.Text   := '';
      EdSeque.Text := '';
    end;

    qryIDUSUARIO.AsFloat                     := Sistema.IdUsuario;
    qry.FieldByName('DATAINICIO').AsDateTime := Now;
    qry.FieldByName('DATA').AsDateTime       := Now;
    EdDlgHoraInicio.Text                     := Timetostr(Time);
    EdDlgHora.Text                           := Timetostr(Time);
    qrycodatendente.AsFloat                  := Sistema.IdUsuario;
  end else ContinuaAtendPendente; // Continua atendimento pendente...

  qryIDLOCALATENDXCPU.AsFloat := ModuloCap.IdLocaAtendxCpu;
  BtnAtendAnt.Visible         := not bNovoAtendimento;

  if (IdBeneficiario<>'') then begin
    if (qryContaCorrente.Active) then qrycontacorrente.Close;

    qryContaCorrente.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
    qryContaCorrente.Open;
  end;

  CMDTPHoraChegada.DateTime := qryDTHORACHEGADA.AsDateTime;
  CMDTPHoraChegada.Time     := StrToTime('00:00:01');

  if not ( ValidaCpf(Trim(DBedCPF.Text)) ) then begin
    if (DBedCPF.CanFocus) then DBedCPF.setFocus;

    ShowMessage('Cpf Inválido !');
  end;
end; // end da procedure...

procedure TFrmAtend.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if (MontaSelect.RetornouValor) then begin
    sIdAtendInsert := '';

    if (MontaSelect.ValoresChave[7]='') then begin // ATEND.IDTITULAR
      MsgDlg('Elegível / Participante ou Dependente Inválido.','Erro',mtError,[mbOK],0);
      TbShtAtend.Enabled := False;
      Abort;
    end;

    TbShtAtend.Enabled := True;

    Selecionar(StrToInt(MontaSelect.ValoresChave[5]));   // ATEND.IDATEND
    EdNome.Text   := MontaSelect.ValoresChave[0];        // PESSOA.NOME
    NomeTit       := MontaSelect.ValoresChave[0];        // PESSOA.NOME
    sNomeOriginal := MontaSelect.ValoresChave[10];       // BF.MOME

    if (Trim(sNomeOriginal)='') then sNomeOriginal := MontaSelect.ValoresChave[0]; // PESSOA.NOME

    EdCpf.Text     := MontaSelect.ValoresChave[1];                 // PESSOA.NUMDOCUMENTO
    NumCpfTit      := MontaSelect.ValoresChave[1];                 // PESSOA.NUMDOCUMENTO
    EdMat.Text     := MontaSelect.ValoresChave[2];                 // ELEGPATRO.MATRICULA
    MatricTit      := MontaSelect.ValoresChave[2];                 // ELEGPATRO.MATRICULA
    EdInsc.Text    := MontaSelect.ValoresChave[3];                 // PARTPREVPLAN.INSCRICAONUMERO
    iInscricao     := StrToIntDef(MontaSelect.ValoresChave[3],-1); // PARTPREVPLAN.INSCRICAONUMERO
    EdPlano.Text   := MontaSelect.ValoresChave[4];                 // PLANPREV.NOME
    sPlano         := MontaSelect.ValoresChave[4];                 // PLANPREV.NOME
    EdPatro.Text   := MontaSelect.ValoresChave[9];                 // PJ.NOME
    sPatro         := MontaSelect.ValoresChave[9];                 // PJ.NOME
    IdPessJur      := MontaSelect.ValoresChave[6];                 // PJ.IDPESSOA
    IdTitular      := MontaSelect.ValoresChave[7];                 // ATEND.IDTITULAR
    IdPlanoPrev    := MontaSelect.ValoresChave[11];                // PLANPREV.IDPLANOPREV
    EdtSitCad.Text := MontaSelect.ValoresChave[8];                 // SITPART.DESCRICAO
    sSitPart       := MontaSelect.ValoresChave[8];                 // SITPART.DESCRICAO
    EdSitPlano.Text:= MontaSelect.ValoresChave[12];                //SITPP.DESCRICAO - Jéssica  Lana Nunes dos Santos SOL 98863 17/03/2009
    DbEdAtend.Text := dtmAtend.QryUsuario.FieldByName('NOMEUSUARIO').AsString;

    IdBeneficiario := MontaSelect.ValoresChave[15];//Petri Nocentini SOL 251827 PPM 764141

    //Jéssica Lana SOL 98698 - 20/03/2009
    QryProcJud.close;
    QryProcJud.ParamByName('IDPESSOA').AsInteger := StrToInt(IdTitular);
    QryProcJud.Open;
    //Fim ...

     //Jéssica Lana SOL 97690 - 25/03/2009
    QryRespon.close;
    QryRespon.ParamByName('IDPESSOA').AsInteger  := StrToInt(MontaSelect.ValoresChave[15]);
    QryRespon.ParamByName('IDTITULAR').AsInteger := StrToInt(MontaSelect.ValoresChave[7]);
    QryRespon.Open;

    EdTipoRespon.Text   := QryRespon.FieldByname('DESCRICAO').asstring;       //Jéssica Lana SOL 97690 24/03/2009
    EdNomeRespon.Text   := QryRespon.FieldByname('Nome').asstring;           //Jéssica Lana SOL 97690 24/03/2009
    //Fim ...

         //Jéssica Lana SOL 98697 - 01/04/2009
    QryDocRespon.close;
    QryDocRespon.ParamByName('IDRESPON').AsInteger := QryRespon.FieldByName('IDRESPONNAOREC').AsInteger;
    QryDocRespon.Open;
    //Fim ...

      //Henrique Massão
       qryalimentada.close;
       qryalimentada.parambyname('IDTITULAR').AsInteger := StrToInt(IDTITULAR);
       //Jéssica Santos - 28/08/2009 - SOL 116583 
      //qryalimentada.open;
      //End


    if (DbEdAtend.Text='') then DbEdAtend.Text := Sistema.NomeUsuario;

    EdDlgHoraInicio.Text    := TimeToStr(Time);
    EdDlgHoraInicio.Enabled := False;
    Timer1.Enabled          := True;

    AbreQryAssuntoxAtend;

    // Preenche os dados do assunto...
    DblkAssunto.Text := QryAssuntoxAtendNome.AsString;

    if (QryAssuntoxAtendIDGRUPOASSUNTO.AsString<>'') then begin
      QryGrupoAssunto.Close;
      QryGrupoAssunto.SQL.Clear;
      QryGrupoAssunto.SQL.Add('SELECT GRUPOASSUNTO.DESCGRUPOASSUNTO, ' +
                              '       GRUPOASSUNTO.IDGRUPOASSUNTO '    +
                              'FROM GRUPOASSUNTO '                     +
                              'WHERE GRUPOASSUNTO.IDGRUPOASSUNTO = '   + QryAssuntoxAtendIDGRUPOASSUNTO.AsString +
                              'ORDER BY GRUPOASSUNTO.DESCGRUPOASSUNTO');
      QryGrupoAssunto.Open;
      DblkGrupoAssunto.Text := qryGrupoAssunto.fieldByName('DESCGRUPOASSUNTO').AsString;
    end;
  end else
    TbShtAtend.Enabled := False;
end;



procedure TFrmAtend.Selecionarfilhas;
begin
  // Fechando as Queries filhas;
  with dtmAtend do begin
    with qryusuario do begin
      if dtmAtend.qryUsuario.Active     then dtmAtend.qryUsuario.Close;
      if Active                         then Close;
      if not Prepared                   then Prepare;
      if qryCODATENDENTE.AsString <> '' then ParamByName('CODATEND').AsFloat := StrtoFloat(qryCODATENDENTE.AsString);
    end;

    with qryscroll do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    end;

    with qryevent do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    end;

    with qryplanprev do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDPESSOA').AsFloat  := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
      Open;
    end;

    with qrycontrib do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    end;

    with qrybenef do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    end;

    with qrypartprev do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    end;

    with qryhistfunc do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    end;

    with qrypartgeral do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    end;

    with qrydepentit do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
    end;

    with qryendereco do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
    end;

    with qryplanass do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    end;

    with qrypart do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    end;

    with qryprocesso do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
    end;

    with qrycontribprev do begin
      if Active       then Close;
      if not Prepared then Prepare;

      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    end;

    FuncaoGeral.FechaQry([qryRubXBeneficio,
                          qryTipoDocRubPendentes,
                          qryRUBpendentes,
                          qryTipoDocXRub,
                          qryRUBpendentesHistorico],
                          False,
                          True);
  end;
end;

procedure TFrmAtend.Selecionar(const IdAtend: LongInt);
begin

  with qry do
  begin
    Close;
    if not Prepared then Prepare;
    Params[0].Asfloat := IdAtend;
    Open;
  end;

  if IdAtend <> -1 then
     Selecionarfilhas
  else
  begin
    ednome.text := '';
    edcpf.text := '';
    edinsc.text := '';
    edPlano.text := '';
    edmat.text := '';
    edPatro.text := '';
    eddlghorainicio.text := '';
    eddlghora.text := '';
    edcod.text := '';
    edseque.text := '';
    EdtSitCad.Text := '';
    EdSitPlano.Text :=''; //Jéssica Lana SOL 98863 - 17/03/2009
    EdTipoRespon.Text :=''; //Jéssica Lana SOL 97690 - 24/03/2009
    EdNomeRespon.Text :=''; //Jéssica Lana SOL 97690 - 24/03/2009
  end;
end;

procedure TfrmAtend.Timer1Timer(Sender: TObject);
begin
  inherited;
  eddlghora.text := timetostr(time);
end;

procedure TfrmAtend.sbtnAlterarClick(Sender: TObject);
begin
  PgAtend.activepage := TbShtAtend;
  inherited;
end;

procedure TfrmAtend.bbtnSairClick(Sender: TObject);
begin

   QryProcJud.close;

  if CmeCadastro.Operacao in [opInserir, opAlterar] then begin
    MsgDlg('Não é possível fechar esta janela com um atendimento em curso.','Erro', mtError, [mbOK], 0);
    Exit;
  end;

  Timer1.Enabled := False;

  try
    Fiario.Free;
    Rad.Free;
    Atendimento.Free;
  except end;

  if ConsPart2 <> nil then // Vinicius Ferreira SOL 175950 Kintana 1602996
  FreeAndNil(ConsPart2);

  inherited;
end;

procedure TfrmAtend.cmbfilialEnter(Sender: TObject);
begin
  inherited;
  if not dtmAtend.qryfilial.active then
     dtmAtend.qryfilial.open;
end;

procedure TfrmAtend.dbgridempDblClick(Sender: TObject);
begin
  inherited;
  if not dtmAtend.qryemp.eof then
     AbrirFormModal(frmConsHistRecEmp, TfrmConsHistRecEmp);
end;

procedure TfrmAtend.FormCreate(Sender: TObject);
begin
  inherited;
  Flagcheckinsere := False; //Petri Nocentini SOL 251827 PPM 764141
  //Henrique Massão
  RptModelo.Template.FileName:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\teste.TXT ';
  bPodeAlterarEstado := True; // David - 21629
  IdAtendPendAnt     := 0; // David - 21749
  sSituacaoAnt       := '';

  qryEmpresaProp.Close;
  qryEmpresaProp.Open;

  HabilitaAgendamento := ( UpperCase(qryEmpresaProp.FieldByName('FLGAGENDAMENTO').AsString)='S' );

  qryEmpresaProp.Close;

  bbtnSair.Enabled := False;
  NomeSolicit      := '';
  NumCPF           := '';
  deletaDoc        := False;

  // Tavares - 09/05/2002
  TbShtAtend.Enabled := False;
  ResetaQueries;
  IdBeneficiario := '';
  FlgExcluir     := 0;
  // Fim.

  Fiario                    := TFiario.Create;
  Atendimento               := TAtendimento.Create;
  Atendimento.IdUsuario     := Sistema.IdUsuario; // Tavares
  iLinhaFiltro              := -1;
  Rad                       := Trad.Create;
  CmeCadastro.RepetirInsert := False;
  Selecionar(-1);

  PgAtend.ActivePage          := TbShtAtend;
  PageDadosAssunto.ActivePage := TbDadosAtend;
end;

procedure TfrmAtend.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;

  if (Shift=[ssCtrl]) then
    case Key of
      ord('I'), ord('i') :
        begin
          if (PageDadosAssunto.ActivePage=tbsDadosParticip) then begin
            if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) or
               (pgCtrlDadosParticip.ActivePage=tbsTelefones) or
               (pgCtrlDadosParticip.ActivePage=tbsContaCorrente) then

               if sbtnInsereDetalhe.Enabled then //Fanuel Marinho SOL183267 Kintana1713326
                  sbtnInsereDetalheClick(Sender); // Daniel - 27845

          end;

          if (PgAtend.ActivePage=TbShtAtend) then
            if (PageDadosAssunto.ActivePage=TbsAssuntos) then sbtnInsDetClick(Sender);
        end;

      ord('A'), ord('a') :
        begin
          if (PageDadosAssunto.ActivePage=tbsDadosParticip) then begin
            if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) or
               (pgCtrlDadosParticip.ActivePage=tbsTelefones) or
               (pgCtrlDadosParticip.ActivePage=tbsContaCorrente) then

            if sbtnAlteraDetalhe.Enabled then //Fanuel Marinho SOL183267 Kintana1713326
              sbtnAlteraDetalheClick(Sender); // Daniel - 27845

          end;
        end;

       ord('E'), ord('e') :
         begin
           if (PageDadosAssunto.ActivePage=tbsDadosParticip) then begin
             if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) or
                (pgCtrlDadosParticip.ActivePage=tbsTelefones) or
                (pgCtrlDadosParticip.ActivePage=tbsContaCorrente) then

              if sbtnAlteraDetalhe.Enabled then //Fanuel Marinho SOL183267 Kintana1713326
               sbtnExcluiDetalheClick(Sender); // Daniel - 27845

           end;

           if (PgAtend.ActivePage=TbShtAtend) then
             if (PageDadosAssunto.ActivePage=TbsAssuntos) then sbtnExcluiDetClick(Sender);
         end;

       ord('R'), ord('r') :
         begin
           if (PgAtend.ActivePage=TbShtAtend) then
             if (PageDadosAssunto.ActivePage=TbsAssuntos) then BtnGetRespostaClick(Sender);
         end;

       ord('D'), ord('d') :
         begin
           if (PgAtend.ActivePage=TbShtAtend) then
             if (PageDadosAssunto.ActivePage=TbsAssuntos) then BtnAtendAntClick(Sender);
         end;

  end else
    case Key of
      VK_F3: PgAtend.ActivePage := TbShtAtend;
      VK_F4: tbbConsultaParticipClick(Sender);
      VK_F5: begin
               PgAtend.ActivePage          := TbShtAtend;
               PageDadosAssunto.ActivePage := TbDadosAtend;
             end;
      VK_F6: begin
               PgAtend.ActivePage          := TbShtAtend;
               PageDadosAssunto.ActivePage := TbsAssuntos;
             end;
      VK_F7: begin
               PgAtend.ActivePage          := TbShtAtend;
               PageDadosAssunto.ActivePage := TbsGeral;
             end;
      VK_F8: begin
               PgAtend.ActivePage          := TbShtAtend;
               PageDadosAssunto.ActivePage := tbsDadosParticip;
             end;
      VK_F9: begin
               PgAtend.ActivePage          := TbShtAtend;
               PageDadosAssunto.ActivePage := tbShtSimulaBenef;
             end;
      // Andre Tavares - 17/01/2002
      VK_F11: begin
                PgAtend.ActivePage          := TbShtAtend;
                PageDadosAssunto.ActivePage := TbShtDocsXBenef;
              end;
      // Fim.

     //Jéssica Lana - SOL 98696 - 23/03/2009
      VK_F12: begin
               PgAtend.ActivePage          := TbShtAtend;
               PageOutrasInfor.ActivePage  := TbShtProcJud;
             end;
     //Fim ...

  else
    PgAtend.ActivePage := TbShtAtend;
  end;

  PgAtendChange(Self);
end;

procedure TfrmAtend.bbtnCancelarClick(Sender: TObject);
var sTipo, sAux : String;
begin
  bCancelaAtendimento := False;

  if (Sender<>bbtnCancelar) then begin
    Selecionar(-1);

    PgAtend.Enabled             := False;
    PageDadosAssunto.Enabled    := False;
    tbbConsultaParticip.Enabled := False;

    // Daniel - 27845
    sbtnInsereDetalhe.Enabled   := False;
    sbtnAlteraDetalhe.Enabled   := False;
    sbtnExcluiDetalhe.Enabled   := False;
    // Fim.

    inherited;
  end else begin
    if not (ds.State in ([dsInsert,dsEdit]) ) then Exit;

    // David - 21749
    if MsgDlg( 'Esta operação irá definir a situação do atendimento como "Cancelado". ' + #13+#10 + #13+#10 +
               'Contudo, todas as operações realizadas durante este atendimento (como contratações de empréstimos ou agendamentos, por exemplo) já ' +
               'encontram-se registradas e não serão canceladas.' + #13+#10 + #13+#10 +
               'Confirma o cancelamento do presente atendimento?','Atenção', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      Exit;
    end;
    // Fim.

    // Cancelamento...
    bCancelaAtendimento := True;

    qry.Edit;
    qryIDUSUARIO.AsFloat := Sistema.IdUsuario;

    if (QryAssuntoxAtend.State in [dsEdit,dsInsert]) then bbtnCancelarDet.Click;

    qry.FieldByName('IDTIPOATEND').AsInteger   := qryTipoAtend.FieldbyName('IDTIPOATEND').AsInteger;
    qry.FieldByName('CIDADESOLIC').AsString    := dblkCidade.Text;
    qry.FieldByName('CODESTADOSOLIC').AsString := dblkEstado.LookupValue;
    sAux                                       := FormatDateTime('dd/mm/yyyy',dbDateFim.Date)+' '+eddLgHora.Text;
    qry.FieldByName('DATA').AsDateTime         := StrToDateTime(sAux);

    if (CmeCadastro.Operacao=opInserir) then qryIDATEND.Clear;

    try
      // Telefone do Solicitante...
      begin
        sTipo := '';

        if chkTipoTelefone.Checked[0] then sTipo := sTipo + 'C';
        if chkTipoTelefone.Checked[1] then sTipo := sTipo + 'P';
        if chkTipoTelefone.Checked[2] then sTipo := sTipo + 'F';
        if chkTipoTelefone.Checked[3] then sTipo := sTipo + 'L';
        if chkTipoTelefone.Checked[4] then sTipo := sTipo + 'R';

        if ( sTipo='' ) then begin
          chkTipoTelefone.State[0] := cbChecked;
          sTipo := 'C';
        end;

        qry.FieldByName('TIPOSOLIC').AsString := sTipo;
      end;

      if (dtmAtend.QryDadosParticip.Active)       then dtmAtend.QryDadosParticip.Close;
      if not (dtmAtend.QryDadosParticip.Prepared) then dtmAtend.QryDadosParticip.Prepare;

      if ( Self.Tag=0 ) then
           dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := qryIDTITULAR.AsFloat
      else dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := qryIDBENEFICIARIO.AsFloat;

      dtmAtend.QryDadosParticip.Open;
      dtmAtend.QryDadosParticip.Close;

      if ( Trim(dbDateFim.Text)='' ) then dbDateFim.Date := Date;

      Qry.First;

      while not Qry.Eof do begin
        Atendimento.IdAtend              := qryIDATEND.AsFloat;
        Atendimento.IdTipoAtend          := StrtoInt(dblkTipoAtendimento.LookupValue);
        Atendimento.IdTitular            := qryIDTITULAR.AsFloat;
        Atendimento.Idbeneficiario       := qryIDBENEFICIARIO.AsFloat;
        Atendimento.IdPessjur            := qryIDPESSJUR.AsFloat;
        Atendimento.ComplCondAtend       := qryCOMPLCODATEND.AsFloat;
        Atendimento.IdLocalAtendXCpu     := qryIDLOCALATENDXCPU.AsFloat;
        Atendimento.Data                 := qryDATA.AsDateTime;
        Atendimento.DataInicio           := qryDATAINICIO.AsDateTime;
        Atendimento.CodAtend             := qryCODATEND.Asfloat;
        Atendimento.CodAtendente         := qryCODATENDENTE.AsString;
        Atendimento.Resposta             := qryRESPOSTA.AsString;
        Atendimento.Status               := qrySTATUS.AsString;
        Atendimento.Observacao           := qryOBSERVACAO.AsString;
        Atendimento.Pergunta             := qryPERGUNTA.AsString;
        Atendimento.NomeSolicitante      := qryNOMESOLICITANTE.AsString;
        NomeSolicit                      := qryNOMESOLICITANTE.AsString;
        Atendimento.TelSolicitante       := TrimLeft(TrimRight(qryTELSOLICITANTE.AsString));
        Atendimento.Logradouro           := qryLOGRADOURO.AsString;
        Atendimento.NumeroSolic          := qryNUMEROSOLIC.AsString;
        Atendimento.ComplemSolic         := qryCOMPLEMSOLIC.AsString;
        Atendimento.BairroSolicitante    := qryBAIRROSOLIC.AsString;
        Atendimento.CepSolicitante       := qryCEPSOLIC.AsString;
        Atendimento.CidadeSolicitante    := qryCIDADESOLIC.AsString;
        Atendimento.IdEstado             := QryIdEstado.AsInteger;
        Atendimento.CodEstadoSolicitante := qryCODESTADOSOLIC.AsString;
        Atendimento.TipoSolic            := qryTIPOSOLIC.AsString;
        Atendimento.DDISolic             := qryDDISOLIC.AsString;
        Atendimento.DDDSolic             := qryDDDSOLIC.AsString;
        Atendimento.NumeroTelSolic       := TrimLeft(TrimRight(qryNUMEROTELSOLIC.AsString));
        Atendimento.TelSolicitante       := TrimLeft(TrimRight(qryNUMEROTELSOLIC.AsString));
        Atendimento.NumDocumentoCPF      := qryNUMDOCUMENTOCPF.ASsTRING;
        NumCpfSolicit                    := qryNUMDOCUMENTOCPF.ASsTRING;
        Atendimento.NumDocumentoRG       := qryNUMDOCUMENTORG.ASsTRING;
        Atendimento.Email                := qryEMAIL.ASsTRING;
        Atendimento.DTHORACHEGADA        := qryDTHORACHEGADA.asDateTime;
        Atendimento.IdUsuario            := qryIDUSUARIO.asInteger;

        if (qryIDATEND.AsFloat<>0 ) then
          Atendimento.Edit
        else begin
          sAux                   := FormatDateTime('dd/mm/yyyy',dbDateFim.Date)+' '+EdDlgHora.Text;
          Atendimento.Data       := StrToDateTime(sAux);
          Atendimento.DataInicio := StrToDateTime(FormatDateTime('dd/mm/yyyy',dbDateInicio.Date)+' '+EdDlgHoraInicio.Text);
          Atendimento.Status     := 'Cancelado';
          Atendimento.Insert;
        end;

        Qry.Next;
      end;

      QryAssuntoxAtend.First;

      while not QryAssuntoxAtend.Eof do begin
        QryAssuntoxAtend.Edit;
        QryAssuntoxAtendIDPROCESSO.Clear;
        QryAssuntoxAtend.Post;

        Atendimento.Assuntos.IdAssuntoxAtend    := QryAssuntoxAtendIDASSUNTOXATEND.AsFloat;
        Atendimento.Assuntos.IdAssunto          := QryAssuntoxAtendIDASSUNTO.AsFloat;
        Atendimento.Assuntos.IdAssuntoxResposta := QryAssuntoxAtendIDASSUNTOXRESP.AsFloat;
        Atendimento.Assuntos.IdProcesso         := QryAssuntoxAtendIDPROCESSO.AsFloat;
        Atendimento.Assuntos.Insert;

        QryAssuntoxAtend.Next;
      end;

      qryAux.Close;

      sAux            := FormatDateTime('dd/mm/yyyy',dbDateFim.Date)+' '+EdDlgHora.Text;
      qryAux.Sql.Text := ' UPDATE ATEND SET DATA = TO_DATE( '+QuotedStr(sAux)+', ''DD/MM/YYYY HH24:MI:SS'' ) WHERE IDATEND = '+FormatFloat('0',Atendimento.IdAtend);
      qryAux.ExecSql;

      // David - 21749
      if (IdAtendPendAnt>0) then begin
        qryAux.Sql.Text := ' UPDATE ATEND SET STATUS = '''+sSituacaoAnt+''' WHERE IDATEND = '+FormatFloat('0',IdAtendPendAnt);
        qryAux.ExecSql;
        IdAtendPendAnt  := 0;
        sSituacaoAnt    := '';
      end;

      FuncaoGeral.FechaQry([Qry,QryAssuntoxAtend],False,True);
      Qry.Open;
      QryAssuntoxAtend.Open;
    except
      MsgDlg('Erro ao cancelar Atendimento!','Atenção',mtError,[mbOk],0);
      Raise;
    end;

    Selecionar(-1);
    CmeCadastro.AtualizaBotoes(Self);
    AbreQryAssuntoxAtend;

    BtnAtendAnt.Tag             := 0;
    sbtnInsDet.Visible          := False;
    sbtnExcluiDet.Visible       := True;
    BtnGetResposta.Visible      := True;
    tb97BotoesDetalhe.Visible   := True;
    GrdAssunto.DataSource       := DsAssuntoxAtend;
    LblAssunto.Caption          := 'Assuntos do Atendimento Corrente';
    LblAssunto.Left             := 112;
    tbbConsultaParticip.Enabled := False;
    ResetaQueries;
    IdBeneficiario              := '-1';
    TbShtAtend.Enabled          := False;

    pnlEnderecos.SendToBack;
    pnlcadTelefones.SendToBack;
    pnlContasCorrentes.SendToBack;
    pnlDocumentos.SendToBack;

    bbtnCancelarClick(nil);
    sbtnInserir.Enabled := True;
    QryProcJud.close;
  end;
  with qryalimentada do
  close;
end;

procedure TfrmAtend.BtnConsultaAtendimentoClick(Sender: TObject);
begin
  inherited;

  if Qry.State In [DsEdit,DsInsert] then begin
    AbrirForm( frmConsAtend, TfrmConsAtend, false );
    frmConsAtend.cmbpatroEnter(frmConsAtend.cmbpatro);
    frmConsAtend.cmbpatro.Text        := edPatro.Text;
    frmConsAtend.cmbpatro.LookupValue := qryIDPESSJUR.AsString;
    frmConsAtend.edmatricula.Text     := trim(edmat.Text);
    frmConsAtend.edcpf.Text           := edcpf.Text;
    frmConsAtend.ednome.Text          := trim(ednome.Text);
    frmConsAtend.edinsc.Text          := trim(edinsc.Text);
    iInscricao                        := strToIntDef(edinsc.Text, -1);

    frmConsAtend.bbtnConsultarClick(sender);
  end;
end;


procedure TfrmAtend.BtnGetRespostaClick(Sender: TObject);
begin
  inherited;

  if DblkAssunto.Text = '' then
     MsgDlg('Obrigatório Indicar o Assunto','Erro',MtError,[MbOk],0)
  else
  begin
     MsResposta.Caption := 'Seleciona Resposta Padrão Para o Assunto ' + DblkAssunto.Text;
     MsResposta.Filtro.Clear;
     MsResposta.Filtro.Add('ASSUNTOXRESP.IDASSUNTO = ' + QryAssuntoxAtendIDASSUNTO.AsString);
     MsResposta.Filtro.Add('RESPATEND.IDRESPATEND = ASSUNTOXRESP.IDRESPATEND');
     MsResposta.Executar;
     if MsResposta.RetornouValor then
     begin
       if QryBuscaResposta.Active then QryBuscaResposta.Close;
       if not QryBuscaResposta.Prepared then QryBuscaResposta.Prepare;
       QryBuscaResposta.Params[0].AsFloat := StrToInt(MsResposta.ValoresChave[2]);
       QryBuscaResposta.Open;

       if QryBuscaResposta.IsEmpty then
          QryAssuntoxAtendDESCRESPATEN.Clear
       else
          QryAssuntoxAtendDESCRESPATEN.AsString := QryBuscaRespostaDESCRESPATEN.AsString;

       QryAssuntoxAtendIDASSUNTOXRESP.AsFloat := StrToInt(MsResposta.ValoresChave[0]);

     end
     else
     begin
       QryAssuntoxAtendDESCRESPATEN.Clear;
       QryAssuntoxAtendIDASSUNTOXRESP.Clear;
     end;
  end;
end;





procedure TfrmAtend.AtualizaDadosRub;
begin
  with dtmAtend do begin
     with qryTipoDocRubPendentes do
     begin
      Close;
      if not Prepared then Prepare;
      ParamByName('idpessjur').AsFloat   := qryidpessjur.AsFloat ;
      ParamByName('idTitular').AsFloat   := qryidTitular.AsFloat ;
      ParamByName('idplanoprev').AsFloat := strToFloat(IDPLANOPREV);
      Open;
     end;

     with qryRUBpendentes do
     begin
      Close;
      if not Prepared then Prepare;
      ParamByName('idpessjur').AsFloat   := qryidpessjur.AsFloat ;
      ParamByName('idTitular').AsFloat   := qryidTitular.AsFloat ;
      ParamByName('idplanoprev').AsFloat := strToFloat(IDPLANOPREV);
      Open;
     end;

     with qryRUBpendentesHistorico do
     begin
      Close;
      if not Prepared then Prepare;
      ParamByName('idpessjur').AsFloat   := qryidpessjur.AsFloat ;
      ParamByName('idTitular').AsFloat   := qryidTitular.AsFloat ;
      ParamByName('idplanoprev').AsFloat := strToFloat(IDPLANOPREV);
      Open;
     end;

     with qryTpRecebimento do
     begin
       Close;
       Open;
     end;

     with qryTpCancelamento do
     begin
       Close;
       Open;
     end;

     with QryRubs do
     begin
       if Active then Close;
       if not Prepared then Prepare;
       ParamByName('idpessjur').AsFloat := qryidpessjur.AsFloat ;
       ParamByName('idTitular').AsFloat := qryidTitular.AsFloat ;
       ParamByName('idplanoprev').AsFloat := strToFloat(IDPLANOPREV);
       Open;
     end;

     qryTipoDocXRub.Close;
     qryTipoDocXRub.Open;

     qryRubXBeneficio.Close;
     qryRubXBeneficio.Open;

     QryHistRubs.Close;
     QryHistRubs.Open;
  end;
end;

procedure TfrmAtend.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  AbrirQueryAssunto; // Gustavo Mendes - 26645

  CkbFiltraPlanoClick(sender);

  DblkGrupoAssunto.Enabled := true;
  DblkAssunto.Enabled      := true;

  if Qry.State In [DsEdit,DsInsert] then
  begin
    AtualizaDetalhe(True);
    QryAssuntoxAtend.Append;
    QryAssuntoxAtendIDATEND.AsFloat := QryIDATEND.AsFloat;
    QryAssuntoxAtendDESCRESPATEN.Clear;
  end;

end;

procedure TfrmAtend.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  if Qry.State in [DsEdit, DsInsert] then 
  begin
    if(QryAssuntoxAtend.IsEmpty = false) and
      (Application.MessageBox('Confirma a Exclusão ?','Atenção',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
      QryAssuntoxAtend.Delete;
  end;
  DblkGrupoAssunto.Enabled := QryAssuntoxAtend.State in [dsEdit, DsInsert];
  DblkAssunto.Enabled := QryAssuntoxAtend.State in [dsEdit, DsInsert];
  DblkGrupoAssunto.text := '';
  DblkAssunto.text := '';
  ReResposta.Text := '';
end;

procedure TfrmAtend.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  AtualizaDetalhe(False);
  QryAssuntoxAtend.Cancel;
end;

procedure TfrmAtend.AtualizaDetalhe(bAtualiza: Boolean);
begin
  inherited;
  if bAtualiza then
  begin
    PnlAssuntoAtend.SendToBack;
    sbtnExcluiDet.Enabled := false;
  end
  else
  begin
    PnlAssuntoAtend.BringToFront;
    sbtnExcluiDet.Enabled := true;
  end;
  BtnGetResposta.Enabled := bAtualiza;
  sbtnInsDet.Enabled     := not bAtualiza;
end;


procedure TfrmAtend.bbtnOkDetClick(Sender: TObject);
var sIdAssunto : String;
begin
  sIdAssunto := DBLKAssunto.LookupValue;

  // Marchetti - 22042
  if not QryAssuntoflgChamaemprestim.IsNull then begin
     QryAssuntoxAtendIDASSUNTOXATEND.AsFloat     := LeultRegistro(nil,'ASSUNTOXATEND');
     QryAssuntoxAtendFLGCHAMAEMPRESTIM.AsInteger := QryAssuntoflgChamaemprestim.AsInteger;
  end;
  // Fim.

  inherited;

  // Valida Assunto...
  if (DblkAssunto.Text<>'') and (DBLKGrupoAssunto.Text<>'') then begin
    if (QryAssuntoxAtend.State=dsInsert) then begin
      QryAssuntoxAtend.Post;
      sbtnInsDet.Click;
    end else begin
      QryAssuntoxAtend.Post;
      bbtnVoltarDet.Click;
    end;

    DBLKGrupoAssunto.Text := '';
    DBLKAssunto.Text      := '';
    ReResposta.Text       := '';
  end;

  { Chama o empréstimo conforme o assunto. }
  QryAssunto.Locate('IDASSUNTO', StrToIntDef(sIdAssunto,-1),[]); // Tavares - 25/09/2002
end;



procedure TfrmAtend.AbreQryAssuntoxAtend;
begin
  with QryAssuntoxAtend do begin
    if Active       then Close;
    if not Prepared then Prepare;

    ParamByname('IDATEND').AsFloat := qryIDATEND.AsFloat;
    Open;
  end;
end;

procedure TfrmAtend.CmeCadastroConfirma(Sender: TObject);
var IdEndereco, iIdCidade, Idtelefone : LongInt;
    Id, Grupo                         : Integer;
    sAux, sTipo, IdAux                : String;
begin
  if (CmeCadastro.Operacao=opInserir) then qryIDATEND.Clear;

  PgAtend.ActivePage          := TbShtAtend;
  PageDadosAssunto.ActivePage := TbDadosAtend;

  try
    // Telefone do Solicitante...
    begin
      sTipo := '';

      if chkTipoTelefone.Checked[0] then sTipo := sTipo + 'C';
      if chkTipoTelefone.Checked[1] then sTipo := sTipo + 'P';
      if chkTipoTelefone.Checked[2] then sTipo := sTipo + 'F';
      if chkTipoTelefone.Checked[3] then sTipo := sTipo + 'L';
      if chkTipoTelefone.Checked[4] then sTipo := sTipo + 'R';

      if ( sTipo='' ) then begin
        chkTipoTelefone.State[0] := cbChecked;
        sTipo := 'C';
      end;

      qry.FieldByName('TIPOSOLIC').AsString := sTipo;
    end;

    if (dtmAtend.QryDadosParticip.Active)       then dtmAtend.QryDadosParticip.Close;
    if not (dtmAtend.QryDadosParticip.Prepared) then dtmAtend.QryDadosParticip.Prepare;

    if ( Self.Tag=0 ) then
         dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := qryIDTITULAR.AsFloat
    else dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := qryIDBENEFICIARIO.AsFloat;

    dtmAtend.QryDadosParticip.Open;
    dtmAtend.QryDadosParticip.Close;

    if ( Trim(dbDateFim.Text)='' ) then dbDateFim.Date :=Date;

    Qry.First;

    while not Qry.Eof do begin
      Atendimento.IdAtend              := qryIDATEND.AsFloat;
      Atendimento.IdTipoAtend          := StrtoInt(dblkTipoAtendimento.LookupValue);
      Atendimento.IdTitular            := qryIDTITULAR.AsFloat;
      Atendimento.Idbeneficiario       := qryIDBENEFICIARIO.AsFloat;
      Atendimento.IdPessjur            := qryIDPESSJUR.AsFloat;
      Atendimento.ComplCondAtend       := qryCOMPLCODATEND.AsFloat;
      Atendimento.IdLocalAtendXCpu     := qryIDLOCALATENDXCPU.AsFloat;
      Atendimento.Data                 := qryDATA.AsDateTime;
      Atendimento.DataInicio           := qryDATAINICIO.AsDateTime;
      Atendimento.CodAtend             := qryCODATEND.Asfloat;
      Atendimento.CodAtendente         := qryCODATENDENTE.AsString;
      Atendimento.Resposta             := qryRESPOSTA.AsString;
      Atendimento.Status               := qrySTATUS.AsString;
      Atendimento.Observacao           := qryOBSERVACAO.AsString;
      Atendimento.Pergunta             := qryPERGUNTA.AsString;
      Atendimento.NomeSolicitante      := qryNOMESOLICITANTE.AsString;
      NomeSolicit                      := qryNOMESOLICITANTE.AsString;
      Atendimento.TelSolicitante       := TrimLeft(TrimRight(qryTELSOLICITANTE.AsString));
      Atendimento.Logradouro           := qryLOGRADOURO.AsString;
      Atendimento.NumeroSolic          := qryNUMEROSOLIC.AsString;
      Atendimento.ComplemSolic         := qryCOMPLEMSOLIC.AsString;
      Atendimento.BairroSolicitante    := qryBAIRROSOLIC.AsString;
      Atendimento.CepSolicitante       := qryCEPSOLIC.AsString;
      Atendimento.CidadeSolicitante    := qryCIDADESOLIC.AsString;
      Atendimento.IdEstado             := QryIdEstado.AsInteger;
      Atendimento.CODESTADOSOLICITANTE := qryCODESTADOSOLIC.AsString;
      Atendimento.TipoSolic            := qryTIPOSOLIC.AsString; // FDIAS - FCRT - SET/2001
      Atendimento.DDISolic             := qryDDISOLIC.AsString;
      Atendimento.DDDSolic             := qryDDDSOLIC.AsString;
      Atendimento.NumeroTelSolic       := TrimLeft(TrimRight(qryNUMEROTELSOLIC.AsString));
      Atendimento.TelSolicitante       := TrimLeft(TrimRight(qryNUMEROTELSOLIC.AsString));
      Atendimento.NumDocumentoCPF      := qryNUMDOCUMENTOCPF.ASsTRING;
      NumCpfSolicit                    := qryNUMDOCUMENTOCPF.ASsTRING;
      Atendimento.NumDocumentoRG       := qryNUMDOCUMENTORG.ASsTRING;
      Atendimento.Email                := qryEMAIL.ASsTRING;
      Atendimento.DTHORACHEGADA        := qryDTHORACHEGADA.asDateTime;
      Atendimento.IDUSUARIO            := qryIDUSUARIO.asInteger; // André Tavares - 15048 - 17/09/2003

      if (qryIDATEND.AsFloat<>0) then
        Atendimento.Edit
      else begin
        // Andre Tavares - 06/01/2004 - 15870
        sAux             := FormatDateTime('dd/mm/yyyy',dbDateFim.Date)+' '+EdDlgHora.Text; // David - Pendência 20211
        Atendimento.Data := StrToDateTime(sAux);
        // Fim.

        // David - 20211
        Atendimento.DataInicio := StrToDateTime(FormatDateTime('dd/mm/yyyy',dbDateInicio.Date)+' '+EdDlgHoraInicio.Text);
        Atendimento.Status     := ModuloCap.GetStatusAtend(bNovoAtendimento);
        Atendimento.Insert;
      end;

      Qry.Next;
    end;


    QryAssuntoxAtend.First;

    while not QryAssuntoxAtend.Eof do begin
      // Gera Rad
      if (Sistema.UsaRAD) and (not QryAssuntoxAtendIDTIPOPROCESSO.IsNull) and
         (QryAssuntoxAtendIDPROCESSO.IsNull) then
      begin
        Rad.TipoProcesso := QryAssuntoxAtendIDTIPOPROCESSO.AsInteger;
        Rad.IdPessoa     := Sistema.IdEmpresa;
        Rad.IdPessResp   := qryIDTITULAR.AsInteger;
        Rad.OBS          := Trim(Copy(' Atendimento Nº: '+qryIDATEND.AsString+' Complemento: '+qryCOMPLCODATEND.AsString+(#13+#10)+
                                      ' Assunto: '       +DBLKAssunto.Text   +
                                      ' Atendente: '     +dbEdAtend.Text     +
                                      ' Solicitante: '   +dbEdNomeSol.Text   +
                                      ' Elegível ou Participante: '          +EdNome.Text,1,200));

        QryAssuntoxAtend.Edit;
        QryAssuntoxAtendIDPROCESSO.AsFloat := Rad.IniciarProcesso;
        QryAssuntoxAtend.Post;

        MsgDlg('Foi iniciado o processo no RAD número: '+QryAssuntoxAtendIDPROCESSO.AsString,'Atenção',mtInformation,[mbOk],0);
      end else begin
        QryAssuntoxAtend.Edit;
        QryAssuntoxAtendIDPROCESSO.Clear;
        QryAssuntoxAtend.Post;
      end;

      // Insere o Assunto do Atendimento...
      { Descomentei a linha abaixo por causa do erro de constraint R_1700. }
      Atendimento.Assuntos.IdAssuntoxAtend    := QryAssuntoxAtendIDASSUNTOXATEND.AsFloat;
      Atendimento.Assuntos.IdAssunto          := QryAssuntoxAtendIDASSUNTO.AsFloat;
      Atendimento.Assuntos.IdAssuntoxResposta := QryAssuntoxAtendIDASSUNTOXRESP.AsFloat;
      Atendimento.Assuntos.IdProcesso         := QryAssuntoxAtendIDPROCESSO.AsFloat;
      Atendimento.Assuntos.IDContratoEmptmo   := QryAssuntoxAtendIDCONTRATOEMPTMO.AsFloat;
      Atendimento.Assuntos.VlrSolicitado      := QryAssuntoxAtendVLRSOLICITADO.AsCurrency;
      Atendimento.Assuntos.NumParcelas        := QryAssuntoxAtendNUMPARCELAS.AsInteger;
      Atendimento.Assuntos.Insert;

      // Gera Rub Fiario
      if (QryAssuntoxAtendEXISTERUB.AsFloat>0) then begin
        Rubs.FormCaption     := 'Assunto: '+QryAssuntoxAtendNOME.AsString;
        Rubs.IdAssuntoxAtend := Atendimento.Assuntos.IdAssuntoxAtend;

        // Andre Tavares - 14/01/2005 - 18075
        Rubs.Beneficio.IdPessJur   := StrToFloat(IDPESSJUR);
        Rubs.Beneficio.IdPessoa    := StrToFloat(IDBENEFICIARIO);
        Rubs.Beneficio.Idtitular   := StrToFloat(IDTITULAR);
        Rubs.Beneficio.IdPlanoPrev := StrToFloat(IDPLANOPREV);
        // Fim.

        Rubs.Execute;
        qryGrupo.Open;

        if (qryGrupo.IsEmpty=False) and (qryGrupoIDPROTOCOLORUB.AsInteger<>0) and not
           (qryGrupoIDPROTOCOLORUB.IsNull) then
        begin
          Fiario.IdGrupo      := qryGrupoIDPROTOCOLORUB.AsInteger;
          Fiario.IdPessoa     := StrToInt(IdBeneficiario);
          Fiario.IdTitular    := StrToInt(IdTitular);
          Fiario.Idusuario    := Sistema.IdUsuario;
          Fiario.Idmodulo     := 19;
          Fiario.IdRubs       := Trunc(RUBS.IdRubs); // André Tavares - 14/09/2004
          Fiario.Descricao    := 'Geração de Rub referente ao  '+qryAssuntoxAtendNome.AsString;
          Fiario.DataInclusao := Date;
          Fiario.Inserir;
        end;

        with QRYALTRUBS do begin
          ParamByName('IDRUBS').AsFloat     := RUBS.IdRubs;
          ParamByName('FLGSTATUS').AsString := '1'; // André Tavares - 14/09/2004
          ExecSql;
        end;

        QryAssuntoxAtend.Edit;
        QryAssuntoxAtendIDRUB.AsFloat := RUBS.IdRubs;
        QryAssuntoxAtend.Post;

// Andre Tavares - 17975 - 12/01/2005 - Início ---------------------------------
        if ( Trunc(Rubs.IdRubs)>0 ) then
          qryVerifImpressao.Close;
          qryVerifImpressao.ParamByName('IDRUBS').AsInteger := Trunc(Rubs.IdRubs);
          qryVerifImpressao.Open;

          if not (qryVerifImpressao.IsEmpty) then begin
            if Application.MessageBox(pChar('Foi Gerada a RUBS de Número: '+FormatFloat('#0',Rubs.IdRubs)+#13+#10+
                                            ' Deseja Imprimir? '),'RUBS',Mb_YesNo+Mb_IConQuestion)=Id_Yes then
              dtmRubs.PrintRubs(trunc(rubs.idrubs), rptModelo);
          end else
            Application.MessageBox(pchar('Foi Gerada a RUBS de Número: '+FormatFloat('#0',RUBS.IdRubs)),'RUBS',MB_OK);
      end;

      QryAssuntoxAtend.Next;
    end;

    // Atualiza o email na tabela Pessoa...
    if ( UpperCase(EdNome.Text)=UpperCase(DBEdNomeSol.Text) ) then
       IdAux := IdTitular
    else
       IdAux := IdBeneficiario;

    if ( IdAux<>'' ) then
    begin
      dtmAtend.qryDadosPessoa.Close;
      dtmAtend.qryDadosPessoa.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdAux);
      dtmAtend.qryDadosPessoa.Open;

      if not (dtmAtend.qryDadosPessoa.IsEmpty) then
      begin
        dtmAtend.qryDadosPessoa.Edit;
        dtmAtend.qryDadosPessoaEMAIL.AsString := EmailSolicit.Text;
        dtmAtend.qryDadosPessoa.Post;
        dtmAtend.qryDadosPessoa.ApplyUpdates;
      end;
    end;

    qryAux.Close;

    // David - 20211
    sAux            := FormatDateTime('dd/mm/yyyy',dbDateFim.Date)+' '+EdDlgHora.Text;
    qryAux.Sql.Text := ' UPDATE ATEND SET DATA = TO_DATE( ' +QuotedStr(sAux)+', ''DD/MM/YYYY HH24:MI:SS'' ) WHERE IDATEND = '+FormatFloat('0',Atendimento.IdAtend);
    qryAux.ExecSql;
// Andre Tavares - 17975 - 12/01/2005 - Fim ------------------------------------

    // David - 20211
    if (CmeCadastro.Operacao=opInserir) then begin
      if (sIdAtendInsert<>'') then begin
        qryAux.Sql.text := ' UPDATE AGENDAMENTO SET IDATEND = '+FormatFloat('0',Atendimento.IdAtend)+
                           ' WHERE IDAGENDAMENTO IN ( '+sIdAtendInsert+' )';
        qryAux.ExecSql;
      end;
    end;

    FuncaoGeral.FechaQry([Qry,QryAssuntoxAtend],False,True);

    Qry.Open;
    QryAssuntoxAtend.Open;

    //Osni Cavalcante - SIG 52491 - Início da alteração
    qryForceCommit.Close;
    qryForceCommit.ExecSQL;
    //Osni Cavalcante - SIG 52491 -  Fim da alteração

  except
    MsgDlg('Erro Ao Confirmar Atendimento','Atenção',mtError,[mbOk],0);
    Raise;
  end;

  Selecionar(-1);
  CmeCadastro.AtualizaBotoes(Self);
  AbreQryAssuntoxAtend;

  BtnAtendAnt.Tag             := 0;
  sbtnInsDet.Visible          := False;
  sbtnExcluiDet.Visible       := True;
  BtnGetResposta.Visible      := True;
  tb97BotoesDetalhe.Visible   := True;
  GrdAssunto.DataSource       := DsAssuntoxAtend;
  LblAssunto.Caption          := 'Assuntos do Atendimento Corrente';
  LblAssunto.Left             := 112;
  tbbConsultaParticip.Enabled := False;
  ResetaQueries;
  IdBeneficiario              := '-1';
  TbShtAtend.Enabled          := False;

end;

procedure TfrmAtend.CmeCadastroCancel(Sender: TObject);
begin
  Inherited;
  if QryAssuntoxAtend.Active And QryAssuntoxAtend.UpdatesPending then
     QryAssuntoxAtend.cancelUpdates;
  qry.Close;
  qry.Open;

  sIdAtendInsert := '';

  AbreQryAssuntoxAtend;

  ResetaQueries;
  idBeneficiario := '-1';
end;

procedure TfrmAtend.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
var idendereco : real;
  sAux : string;
begin
  Accept := False;
  qryIDUSUARIO.asFloat             := sistema.idusuario;

  if QryAssuntoxAtend.State in [DsEdit,DsInsert] then
    bbtnCancelarDet.Click;

  if dbednomesol.Text = ''  then
   begin
      MsgDlg('Favor informar o solicitante!','Atenção',mtError,[mbOk],0);
      if dbednomesol.CanFocus then
      begin
        dbednomesol.SetFocus;
        exit;
      end;
   end;

   if dbdateInicio.Text = ''  then
   begin
      MsgDlg('Favor informar a Data Inicio!','Atenção',mtError,[mbOk],0);
      if dbdateInicio.CanFocus then dbdateInicio.SetFocus;
      exit;
   end;

   if dbdateInicio.Text > dbdateFim.Text  then
   begin
      MsgDlg('Data Inicial maior que a Final!','Atenção',mtError,[mbOk],0);
      if dbdateInicio.CanFocus then dbdateInicio.SetFocus;
      exit;
   end;
   if edtLogradouro.Text = ''  then
   begin
      MsgDlg('Favor informar o logradouro do solicitante!','Atenção',mtError,[mbOk],0);
      if edtLogradouro.CanFocus then edtLogradouro.SetFocus;
      exit;
   end;

  if edtbairro.Text = ''  then
   begin
      MsgDlg('Favor informar o bairro do endereço do solicitante!','Atenção',mtError,[mbOk],0);
      if edtbairro.CanFocus then edtbairro.SetFocus;
      exit;
   end;

  if edtcep.Text = ''  then
   begin
      MsgDlg('Favor informar o CEP do endereço do solicitante!','Atenção',mtError,[mbOk],0);
      if edtcep.CanFocus then edtcep.SetFocus;
      exit;
   end;

  if dblkCidade.LookupValue = ''  then
   begin
      MsgDlg('Favor informar a Cidade do endereço do solicitante!','Atenção',mtError,[mbOk],0);
      if dblkCidade.Canfocus then
        dblkCidade.SetFocus;
      exit;
   end;

  if dblkEstado.LookupValue = ''  then
   begin
      MsgDlg('Favor informar o Estado do endereço do solicitante!','Atenção',mtError,[mbOk],0);
      if dblkEstado.CanFocus then
        dblkEstado.SetFocus;
      exit;
   end;

  if (dblkTipoAtendimento.LookupValue = '') or (dblkTipoAtendimento.text = '') then
     begin
       MsgDlg('Favor informar a Forma de Atendimento!','Atenção',mtError,[mbOk],0);
       if dblkTipoAtendimento.CanFocus then
         dblkTipoAtendimento.SetFocus;
       exit;
     end;

  if (QryAssuntoxAtend.IsEmpty) and (QryAssuntoxAtendAnt.IsEmpty) then
  begin
    MsgDlg('Favor informar o Assunto!','Atenção',mtError,[mbOk],0);
    if DblkGrupoAssunto.CanFocus then DblkGrupoAssunto.SetFocus;
    exit;
  end;

// Daniel - 23929 - Início -----------------------------------------------------
  if (Trim(EmailSolicit.Text)<>'') then begin
    if (Pos('@',EmailSolicit.Text)=0) then begin
      MsgDlg('E-mail inválido. Não foi encontrado o caracter ''@''.','Aviso',mtInformation,[mbOk],0);
      ModalResult := mrNone;
      Exit;
    end;
  end;
// Daniel - 23929 - Fim --------------------------------------------------------

  qry.FieldByName('IDTIPOATEND').AsInteger   := qryTipoAtend.FieldbyName('IDTIPOATEND').AsInteger;
  qry.FieldByName('CIDADESOLIC').AsString    := dblkCidade.text;
  qry.FieldByName('CODESTADOSOLIC').AsString := dblkEstado.LookupValue;

  // Tavares - 25/04/2003 - 13817
  if strToTime(CMDTPHoraChegada.Text) > strToTime(eddlghorainicio.text) then begin
    MsgDlg('A Hora de Chegada Não Pode Ser Posterior à Hora de Início do Atendimento','Atenção',mtError,[mbOk],0);
    if CMDTPHoraChegada.CanFocus then CMDTPHoraChegada.SetFocus;
    Exit;
  end;
  // Fim.

  sAux := FormatDateTime( 'dd/mm/yyyy', dbdateFim.Date ) + ' ' + eddlghora.Text;
  qry.FieldByName('DATA').AsDateTime := StrToDateTime( sAux );
  Accept := True;
end;

procedure TfrmAtend.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  Inherited;

  btnAgendamento.Enabled := ( habilitaAgendamento and ( not qry.IsEmpty ) );

  sbtnExcluiDet.Enabled := not QryAssuntoxAtend.IsEmpty;
  DblkGrupoAssunto.Enabled := QryAssuntoxAtend.State in [dsEdit, DsInsert];
  DblkAssunto.Enabled := QryAssuntoxAtend.State in [dsEdit, DsInsert];
  DblkGrupoAssunto.text := '';
  DblkAssunto.text := '';
  ReResposta.Text := '';
  pnlFundo.Enabled := True;
  sbtnProcurar.Enabled := not (CmeCadastro.Operacao in [OpInserir,Opalterar]);
end;

procedure TfrmAtend.dbgridprocDblClick(Sender: TObject);
begin
  inherited;
  with dtmAtend do
  begin
     if not qryprocesso.IsEmpty then
     begin
       {$IFNDEF Padrao_5_09_11 }
        Application.CreateForm(TFrmMTAcompProc,FrmMTAcompProc);

        FrmMTAcompProc.sTipoProc := qryprocessoTIPOPROCESSO.AsString;
        FrmMTAcompProc.sObs      := Trim(Copy(' Atendimento Nº: ' + FloattoStr(qryCODATEND.AsFloat) + ' Complemento: ' + qryCOMPLCODATEND.AsString + (#13+#10) +
                                              ' Assunto: ' + DblkAssunto.Text +
                                              ' Atendente: ' + dbedatend.Text +
                                              ' Solicitante: ' + dbednomesol.Text +
                                              ' Elegível ou Participante: ' + ednome.Text,1,200));
        FrmMTAcompProc.iNumProc  := qryprocessoIDPROCESSO.AsInteger;
        FrmMTAcompProc.sPessoa   := ednome.Text;
        FrmMTAcompProc.sDoc      := edmat.Text;
        FrmMTAcompProc.sUsuario  := Sistema.NomeUsuario;
        FrmMTAcompProc.ShowModal;

       {$ELSE}
        Application.CreateForm(TFrmAcompProc,FrmAcompProc);

        FrmAcompProc.sTipoProc := qryprocessoTIPOPROCESSO.AsString;
        FrmAcompProc.sObs      := Trim(Copy(' Atendimento Nº: ' + FloattoStr(qryCODATEND.AsFloat) + ' Complemento: ' + qryCOMPLCODATEND.AsString + (#13+#10) +
                                            ' Assunto: ' + DblkAssunto.Text +
                                            ' Atendente: ' + dbedatend.Text +
                                            ' Solicitante: ' + dbednomesol.Text +
                                            ' Elegível ou Participante: ' + ednome.Text,1,200));
        FrmAcompProc.iNumProc  := qryprocessoIDPROCESSO.AsInteger;
        FrmAcompProc.sPessoa   := ednome.Text;
        FrmAcompProc.sDoc      := edmat.Text;
        FrmAcompProc.sUsuario  := Sistema.NomeUsuario;
        FrmAcompProc.ShowModal;
       {$ENDIF}
     end;
  end;
end;

procedure TfrmAtend.BtnAtendAntClick(Sender: TObject);
begin
  inherited;
  Case BtnAtendAnt.Tag of
  0: begin
       try
         BtnAtendAnt.Tag          := 1;
         sbtnInsDet.Visible       := False;
         sbtnExcluiDet.Visible    := False;
         BtnGetResposta.Visible   := False;
         GrdAssunto.DataSource    := DsAssuntoxAtendAnt;
         ReRespostaAux.DataSource := DsAssuntoxAtendAnt;
         LblAssunto.Caption       := 'Assuntos do Atendimento Anterior';
         LblAssunto.Left          := 37;
       except end;
     end;
  1: begin
      try
        BtnAtendAnt.Tag           := 0;
        sbtnInsDet.Visible        := True;
        sbtnExcluiDet.Visible     := True;
        BtnGetResposta.Visible    := True;
        tb97BotoesDetalhe.Visible := True;
        GrdAssunto.DataSource     := DsAssuntoxAtend;
        ReRespostaAux.DataSource  := DsAssuntoxAtend;
        LblAssunto.Caption        := 'Assuntos do Atendimento Corrente';
        LblAssunto.Left           := 112;
      except end;
    end;
  end;
end;

procedure TfrmAtend.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  AtualizaDetalhe(False);
  QryAssuntoxAtend.Cancel;
end;


Function TfrmAtend.BuscaAtendPend(IdTitular :LongInt) : boolean;
begin
 with QryPENDECIA do
  begin
     if Active then Close;
     if not Prepared then Prepare;
     ParamByname('IDTITULAR').AsINTEGER := IDTITULAR;
     Open;

    if NOT qryPENDECIA.EOF   THEN
      Application.MessageBox('Existem atendimentos pendentes para este Titular. ','Atendimento',Mb_IconInformation);

     Result := not qryPENDECIA.IsEmpty;
  end;
end;


procedure TfrmAtend.ProcuraAssuntoValidaDados(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> nil)  then
  begin
    if (QryAssuntoxAtend.State in [DsEdit, DsInsert]) And
   (qryAssunto.isEmpty = False) then
    begin
      if (DblkGrupoAssunto.text = '') or (DblkAssunto.text = '')then
      begin
         if DblkGrupoAssunto.CanFocus then DblkGrupoAssunto.SetFocus
      end
      else
      begin
         if (QryAssunto.FieldByName('IDCONFIGRUBS').AsString = '') then
         begin
            QryAssuntoxAtendEXISTERUB.AsFloat := 0;
            QryAssuntoxAtendIDMODELORUB.AsFloat := 0;
         end
         else
         begin
             QryAssuntoxAtendEXISTERUB.AsFloat := 1;
             QryAssuntoxAtendIDMODELORUB.AsFloat := QryAssunto.FieldByName('IDCONFIGRUBS').AsFloat;
         end;

         if (QryAssunto.FieldByName('IDTIPOPROCESSO').AsString = '') then
         begin
            QryAssuntoxAtendIDTIPOPROCESSO.Clear;
            QryAssuntoxAtendEXISTERAD.AsINTEGER := 0;
         end
         else
         begin
            QryAssuntoxAtendIDTIPOPROCESSO.AsFloat := QryAssunto.FieldByName('IDTIPOPROCESSO').AsFloat;
            QryAssuntoxAtendEXISTERAD.AsINTEGER := 1;
         end;

         QryAssuntoxAtendNOME.AsString := DblkAssunto.Text;
         QryAssuntoxAtendIdAssunto.asInteger := QryAssunto.fieldByName('IDAssunto').asInteger;
         BtnGetResposta.Enabled := FazQuery(DtmbaseDados.Qry,'SELECT IDRESPATEND FROM ASSUNTOXRESP WHERE IDASSUNTO = ' + QryAssuntoxAtendIdAssunto.AsString);
      end;
    end;
  end;
end;

procedure TfrmAtend.PgAtendChange(Sender: TObject);
begin
  inherited;
  with dtmAtend do
  begin
    Case PgAtend.ActivePage.PageIndex of
      1:
      begin
        Application.CreateForm(TConsPart, ConsPart2);
        ConsPart2.sIdPessoa    := IDTITULAR;
        ConsPart2.sIdPessjur   := IDPESSJUR;
        ConsPart2.sIdPlanoprev := IDPLANOPREV;
        ConsPart2.sSeqProposta := sequencia;
        ConsPart2.DataBaseName := 'BaseDados';
        ConsPart2.MostraConsulta;
      end;

    end;
  end;
end;

procedure TfrmAtend.GrdDocRecebidosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if Field.FieldName = 'FLGRECEBIDO' then  ABrush.Color := $00C6FFFF;
end;

procedure TfrmAtend.CkbFiltraPlanoClick(Sender: TObject);
begin
  inherited;

  // FDias - 28.10.2004
  qryassunto.Close;
  qryAssunto.Sql.Clear;
  qryAssunto.Sql.Add('SELECT  A.NOME,  P.NOME AS NOMEPLANOPREV, A.IDASSUNTO, A.IDTIPOPROCESSO, A.IDCONFIGRUBS,' +
                     '        A.IDGRUPOASSUNTO, A.FLGCHAMAEMPRESTIM , C.DESCRUB, A.IDPLANOPREV '+
                    'FROM  ASSUNTO A , PLANPREV P, CONFIGRUBS C '+
                    'WHERE ' );
  if (CkbFiltraPlano.Checked) and (trim(IDPLANOPREV) <> '') then
     qryAssunto.Sql.Add( '( A.IDPLANOPREV = '+  trim(IDPLANOPREV)  +') AND ');
  if (dblkGrupoAssunto.LookUpValue <> '') and (DblkGrupoAssunto.LookUpValue <> '' )then
     qryAssunto.Sql.Add( '( A.IDGRUPOASSUNTO = '+ DblkGrupoAssunto.LookUpValue +') AND ' );

     qryAssunto.Sql.Add( '( A.IDPLANOPREV  = P.IDPLANOPREV(+))  AND '+
                         '( A.IDCONFIGRUBS = C.IDCONFIGRUBS(+)) '+
                         'ORDER BY A.NOME');
  qryAssunto.Open;
end;

procedure TfrmAtend.edtufExit(Sender: TObject);
begin
   QryESTADO.ACTIVE := FALSE;
end;

procedure TfrmAtend.tbshtConsPartEnter(Sender: TObject);
begin
  inherited;
  ConsPart1.sIdPessoa    := IDBENEFICIARIO;
  ConsPart1.sIdPessjur   := IDPESSJUR;
  ConsPart1.sIdPlanoprev := IDPLANOPREV;
  ConsPart1.sSeqProposta := sequencia;
  ConsPart1.DataBaseName := 'BaseDados';
  ConsPart1.MostraConsulta;
end;

procedure TfrmAtend.sbtnInserirClick(Sender: TObject);
begin

  try  // SOL128696 - Daniel Begnami

  // Daniel - 21551 - Início -----------------------------------------------------
    ConsPart2    := TConsPart.Create(frmAtend);
    dtmConsPart  := TdtmConsPart.Create(Self);
    dtmConsPart1 := TdtmConsPart1.Create(Self);

    MostraConsultaAtendimento;

    if iRetornou <> -1  then //SOL124254 - Ádler Souza
    begin

    DblkAssunto.Text            := '';
    DblkGrupoAssunto.Text       := '';
    ReResposta.Text             := '';
    PgAtend.Enabled             := True;
    PageDadosAssunto.Enabled    := True;
    tbbConsultaParticip.Enabled := True;

    if (qry.State in [dsInsert,dsEdit]) then sbtnInserir.Enabled := False;

    if (qryparamIDTIPOATENDPADRAO.AsString<>'') and (not qryparamIDTIPOATENDPADRAO.isnull) then begin
      if (qryParamFLGCONFIRMADATA.AsInteger=1) then begin
        if ( qryTipoAtend.Locate('IDTIPOATEND',TipoAtend,[loCaseInsensitive,loPartialKey]) ) then begin
          dblkTipoAtendimento.LookupValue := FloatToStr(TipoAtend);
          dblkTipoAtendimento.Text        := qryTipoAtendNOME.AsString;
          dblkTipoAtendimento.Refresh;
        end;
      end else begin
        qryTipoAtend.Locate('IDTIPOATEND',qryParamIDTIPOATENDPADRAO.AsInteger,[loCaseInsensitive,loPartialKey]);
        dblkTipoAtendimento.LookupValue := IntToStr(qryParamIDTIPOATENDPADRAO.AsInteger);
        dblkTipoAtendimento.Text        := qryTipoAtendNOME.AsString;
      end;
    end;



      //Jéssica Lana SOL 98698 KINTANA  20/03/2009
      QryProcJud.close;
      QryProcJud.ParamByName('IDPESSOA').AsInteger := StrToInt(dtmConsPart1.Cds.FieldByName('IDPESSOA').AsString);
      QryProcJud.Open;
      //Fim ...

      //Jéssica Lana SOL 97690 - 25/03/2009
      QryRespon.close;
      QryRespon.ParamByName('IDPESSOA').AsInteger  := StrToInt(dtmConsPart1.Cds.FieldByName('IDPESSOA').AsString);
      QryRespon.ParamByName('IDTITULAR').AsInteger := StrToInt(dtmConsPart1.Cds.FieldByName('IDTITULAR').AsString);
      QryRespon.Open;

      EdTipoRespon.Text   := QryRespon.FieldByname('DESCRICAO').asstring;       //Jéssica Lana SOL 97690 24/03/2009
      EdNomeRespon.Text   := QryRespon.FieldByname('Nome').asstring;            //Jéssica Lana SOL 97690 24/03/2009
      //Fim ...

      //Jéssica Lana SOL 98697 KINTANA  01/04/2009
      QryDocRespon.close;
      QryDocRespon.ParamByName('IDRESPON').AsInteger := QryRespon.FieldByName('IDRESPONNAOREC').AsInteger;
      QryDocRespon.Open;
      //Fim ...
    end; //Fim - SOL124254 - Ádler Souza

    // Daniel - 21551 - Fim --------------------------------------------------------

  // Inicio - SOL128696 - Daniel Begnami
  finally
    FreeAndNil(ConsPart2);
    FreeAndNil(dtmConsPart);
    FreeAndNil(dtmConsPart1);
  end;
  // Fim - SOL128696 - Daniel Begnami

end;

procedure TfrmAtend.ResetaQueries;
begin
  qryDocumentos.Close;

  qryCidades.Close;
  qryCidades.Open;

  qryUF.Close;
  qryUF.Open;

  qryTipoAtend.Close;
  qryTipoAtend.Open;

  qryParam.Close;
  qryParam.Open;

  qryEnderecos.Close;
  qryEnderecos.ParamByName('IDPESSOA').AsInteger := -1;
  qryEnderecos.Open;

  qryBeneficio.Close;
  qryBeneficio.Open;

  qrySitBenef.Close;
  qrySitBenef.Open;

  qryDocsXBenef.Close;

  qryContaCorrente.Close;
  qryContaCorrente.ParamByName('IDPESSOA').AsInteger := -1;
  qryContaCorrente.Open;

  qryTelefones.Close;
  qryTelefones.ParamByName('IDPESSOA').AsInteger := -1;
  qryTelefones.Open;

  // Daniel - 21663
  qryContato.Close;
  qryContato.ParamByName('PIDPESSOA').AsInteger := -1;
  qryContato.Open;

  qryRamal.Close;
  qryRamal.ParamByName('PIDCONTATO').AsInteger := -1;
  qryRamal.Open;
  // Fim.
end;


procedure TfrmAtend.FormShow(Sender: TObject);
begin
  inherited;

  // Daniel - 27845
  HabilitaInclusao            := sbtnInsereDetalhe.Enabled;
  HabilitaEdicao              := sbtnAlteraDetalhe.Enabled;
  HabilitaExclusao            := sbtnExcluiDetalhe.Enabled;
  sbtnInsereDetalhe.Enabled   := False;
  sbtnAlteraDetalhe.Enabled   := False;
  sbtnExcluiDetalhe.Enabled   := False;
  // Fim.

  bbtnSair.Enabled            := True;

  // Marchetti - 22046
  HabilitaMenuEmprestimo(-1);

  IntegraModulo.iEvento         := -1;
  IntegraModulo.iContratoEmptmo := -1;
  IntegraModulo.fValorSolic     := 0;
  IntegraModulo.iNumParcelas    := 0;
  // Fim.
end;

procedure TfrmAtend.tbbConsultaParticipClick(Sender: TObject);
begin
  inherited;
  {Daniel - 21551 - Comentei esta linha porque botei pra dar um create na
   uConsPart no FormCreate do form...}
  ConsPart2            := TConsPart.Create(frmAtend);
  ConsPart2.sIdTitular := idTitular;

  if StrtoIntDef(idBeneficiario, 0) <> 0 then
       ConsPart2.sIdpessoa := idBeneficiario
  else ConsPart2.sIdpessoa := idTitular;

  ConsPart2.MostraConsultaAtendimento; // Daniel - 23991

  //FreeAndNil(ConsPart2); // Vinicius Ferreira SOL 175950 Kintana 1602996
end;


procedure TfrmAtend.bbtnConfirmarClick(Sender: TObject);
begin
  qry.Edit;

  inherited;

  // David - 21749
  IdAtendPendAnt := 0;
  sSituacaoAnt   := '';

  pnlEnderecos.SendToBack;
  pnlCadTelefones.SendToBack;
  pnlContasCorrentes.SendToBack;
  PnlDocumentos.SendToBack;

  try
   if not (dtmBaseDados.dbBaseDados.InTransaction) then
     Sistema.GravaLogOperacoes('Operação Atendimento para o IDPESSOA = '+IdTitular);
  except
    raise Exception.Create('Não foi possível Gravar o Log');
  end;
end;

procedure TfrmAtend.dblkTipoAtendimentoExit(Sender: TObject);
begin
  inherited;
  dblkTipoAtendimento.LookupValue := InttoStr(qryTipoAtend.FieldByName('IDTIPOATEND').AsInteger);
end;

procedure TfrmAtend.btnEndVoltarClick(Sender: TObject);
begin
  inherited;
  qryEnderecos.Cancel;
  pnlEnderecos.SendToBack;
end;

procedure TfrmAtend.btnEndCancelarClick(Sender: TObject);
begin
  inherited;
  qryEnderecos.Cancel;
  pnlEnderecos.SendToBack;
end;

procedure TfrmAtend.btnEndOkClick(Sender: TObject);
var idEndereco, idEndereco1 : double;
begin
  // inherited;

  if (EdLogradoro1.Text='') then begin
    PgAtend.ActivePage := TbShtAtend;
    MsgDlg('Favor informar o logradouro do Beneficiario!','Atenção',mtError,[mbOk],0);
    if EdLogradoro1.CanFocus then EdLogradoro1.SetFocus;
    Exit;
  end;

  if (EdBairro1.Text='') then begin
    PgAtend.ActivePage := TbShtAtend;
    MsgDlg('Favor informar o bairro do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);
    if EdBairro1.CanFocus then edbairro1.SetFocus;
    Exit;
  end;

  if (EdCep1.Text='') then begin
    PgAtend.ActivePage := TbShtAtend;
    MsgDlg('Favor informar o CEP do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);
    if EdCep1.CanFocus then EdCep1.SetFocus;
    Exit;
  end;

  if (dblkCidade1.LookupValue='') then begin
    PgAtend.ActivePage := TbShtAtend;
    MsgDlg('Favor informar a Cidade do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);
    if dblkCidade1.CanFocus then dblkCidade1.SetFocus;
    Exit;
  end;

  if (dblkEstado1.LookupValue='') or (Length(dblkEstado1.LookupValue)<2) or
     (not qryUF.Locate('CODESTADO',DblkEstado1.LookupValue,[loCaseInsensitive,loPartialKey])) then
  begin
    PgAtend.ActivePage := TbShtAtend;
    MsgDlg('Favor informar o Estado do endereço do solicitante!','Atenção',mtError,[mbOk],0);
    if dblkEstado1.CanFocus then dblkEstado1.SetFocus;
      Exit;
  end;

  
  if (dbedLocal.Text='') then begin
    PgAtend.ActivePage := TbShtAtend;
    MsgDlg('Favor informar o local do Beneficiario!','Atenção',mtError,[mbOk],0);
    if dbedlocal.CanFocus then dbedlocal.SetFocus;
    Exit;
  end;



  with QryESTADO1 do begin
    if Active then Close;
    if not Prepared then Prepare;
    ParamByName('CODESTADO1').AsString := dblkEstado1.LookupValue;
    Open;
  end;

  if (qryEnderecos.State=dsEdit) then
    if MsgDlg( 'Deseja alterar as informações do atendimento referentes ao endereço '+#13+#10+
               'do solicitante com base nas alterações deste registro?',
               'Atenção',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
      qry.FieldByName('CEPSOLIC').AsString := qryEnderecos.FieldByName('CEP').AsString;

      // David - 21629
      dblkEstado.LookupValue := dblkEstado1.LookupValue;
      dblkEstado.Text        := dblkEstado1.Text;
      dblkCidade.LookupValue := dblkCidade1.Text;
      dblkCidade.Text        := dblkCidade1.Text;

      qry.FieldByName('LOGRADOURO').AsString   := qryEnderecos.FieldByName('LOGRADOURO').AsString;
      qry.FieldByName('NUMEROSOLIC').AsString  := qryEnderecos.FieldByName('NUMERO').AsString;
      qry.FieldByName('COMPLEMSOLIC').AsString := qryEnderecos.FieldByName('COMPLEMENTO').AsString;
      qry.FieldByName('BAIRROSOLIC').AsString  := qryEnderecos.FieldByName('BAIRRO').AsString;
    end;

  if (qryEnderecos.State=dsInsert) then begin
    IdEndereco                                        := LeultRegistro(NIL,'ENDPESS');
    IdEndereco1                                       := IdEndereco;
    qryINSENDERECO.ParamByName('IDENDERECO').AsFloat  := IdEndereco;
    qryINSENDERECO.ParamByName('IDPESSOA').AsFloat    := StrToFloat(idBeneficiario);
    qryINSENDERECO.ParamByName('IDCIDADES').AsFloat   := qryCidadesIdCidades.AsFloat;
    qryINSENDERECO.ParamByName('IDPAIS').AsFloat      := 1;
    qryINSENDERECO.ParamByName('LOGRADOURO').AsString :=  EdLogradoro1.Text;
    qryINSENDERECO.ParamByName('NUMERO').AsString     :=  EdNumero1.Text;

    if (Length(EdComplemento1.Text)>20) then
         qryINSENDERECO.ParamByName('COMPLEMENTO').AsString := Copy(EdComplemento1.Text,1,20)
    else qryINSENDERECO.ParamByName('COMPLEMENTO').AsString := EdComplemento1.Text;

    qryINSENDERECO.ParamByName('BAIRRO').AsString    := EdBairro1.Text;
    qryINSENDERECO.ParamByName('CODESTADO').AsString := dblkEstado1.Text;

    if (Length(dblkCidade1.Text)>20) then
         qryINSENDERECO.ParamByName('CIDADE').AsString := Copy(dblkcidade1.Text,1,20)
    else qryINSENDERECO.ParamByName('CIDADE').AsString := dblkCidade1.Text;

    qryINSENDERECO.ParamByName('CEP').AsString  := EdCep1.Text;
    qryINSENDERECO.ParamByName('NOME').AsString := DbEdLocal.Text;
    qryinsENDERECO.ExecSql
  end;

  if ( (qryEnderecos.State=dsEdit) and (FlgExcluir=0) ) then begin
    qryALTENDERECO.ParamByName('IDENDERECO').AsFloat  := qryEnderecosIdendereco.AsFloat;
    IdEndereco1                                       := qryEnderecosIdendereco.AsFloat;
    qryALTENDERECO.ParamByName('IDPESSOA').AsFloat    := StrToFloat(IdBeneficiario);
    qryALTENDERECO.ParamByName('IDCIDADES').AsFloat   := qryCidadesIDCIDADES.AsFloat;
    qryALTENDERECO.ParamByName('IDPAIS').AsFloat      := 1;
    qryALTENDERECO.ParamByName('LOGRADOURO').AsString := EdLogradoro1.Text;
    qryALTENDERECO.ParamByName('NUMERO').AsString     := EdNumero1.Text;

    if (Length(EdComplemento1.Text)>20) then
         qryALTENDERECO.ParamByName('COMPLEMENTO').AsString := Copy(EdComplemento1.Text,1,20)
    else qryALTENDERECO.ParamByName('COMPLEMENTO').AsString := EdComplemento1.Text;

    qryALTENDERECO.ParamByName('BAIRRO').AsString    := EdBairro1.Text;
    qryALTENDERECO.ParamByName('CODESTADO').AsString := dblkEstado1.Text;

    if (Length(dblkCidade1.Text)>20) then
         qryALTENDERECO.ParamByName('CIDADE').AsString := Copy(dblkCidade1.Text,1,20)
    else qryALTENDERECO.ParamByName('CIDADE').AsString := dblkCidade1.Text;

    qryALTENDERECO.ParamByName('CEP').AsString  := EdCep1.Text;
    qryALTENDERECO.ParamByName('NOME').AsString := DbEdLocal.Text;
    qryaltENDERECO.ExecSql;
  end;

  if (FlgExcluir=1) then begin
    if Application.MessageBox('Ao excluir o endereço, será excluído também os telefones deste. '+
                              'Exclui o endereço e seus telefoens?','Atendimento',Mb_YesNo+Mb_IConQuestion)=Id_Yes then
    begin
      // Exclui telefone do endereco pessoal por causa da constraint...
      qryExecTelEndPess.ParamByName('IDENDERECO').AsFloat := qryEnderecosIDENDERECO.AsFloat;
      qryExecTelEndPess.ExecSQL;

      // Exclui telefone de contato do endereco por causa da constraint...
      qryExecTelContato.ParamByName('IDTELEFONE').AsFloat := qryEnderecosIDENDERECO.AsFloat;
      qryExecTelContato.ExecSql ;

      IdEndereco1                                      := qryEnderecosIDENDERECO.AsFloat;
      qryExcEndereco.ParamByName('IDENDERECO').AsFloat := qryEnderecosIDENDERECO.AsFloat;
      qryExcEndereco.ExecSql;
    end;
  end;

  // David - 21629
  //----------------------------------------------------------------------------
  if  ( (qryEnderecos.State=dsEdit) and (FlgExcluir=0) ) or (qryEnderecos.State=dsInsert) then begin
    if (chkbxComercial.Checked) then begin
     qryComercial.ParamByName('IDPESSOA').AsFloat       := StrToFloat(IdBeneficiario);
     qryComercial.ParamByName('IDENDCOMERCIAL').AsFloat := IdEndereco1;
     qryComercial.ExecSQL;
    end else begin
      if (qryPessoaIdendComercial.AsFloat=IdEndereco1) then begin
        qryComercial.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
        qryComercial.ParamByName('IDENDCOMERCIAL').Clear;
        qryComercial.ExecSQL;
      end;
    end;

    if (chkbxResidencial.Checked) then begin
      qryResidencial.ParamByName('IDPESSOA').AsFloat         := StrToFloat(IdBeneficiario);
      qryResidencial.ParamByName('IDENDRESIDENCIAL').AsFloat := IdEndereco1;
      qryResidencial.ExecSQL;
    end else begin
      if (qryPessoaIdendResidencial.AsFloat=IdEndereco1) then begin
        qryResidencial.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
        qryResidencial.ParamByName('IDENDRESIDENCIAL').Clear;
        qryResidencial.ExecSQL;
      end;
    end;

    if (chkbxEntrega.Checked) then begin
      qryEntrega.ParamByName('IDPESSOA').AsFloat     := StrToFloat(IdBeneficiario);
      qryEntrega.ParamByName('IDENDENTREGA').AsFloat := idEndereco1;
      qryEntrega.ExecSQL;
    end else begin
      if (qryPessoaIDENDENTREGA.AsFloat=IdEndereco1) then begin
        qryEntrega.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
        qryEntrega.ParamByName('IDENDENTREGA').Clear;
        qryEntrega.ExecSQL;
      end;
    end;

    if (chkbxCobranca.Checked) then begin
      qryCobranca.ParamByName('IDPESSOA').AsFloat      := StrToFloat(IdBeneficiario);
      qryCobranca.ParamByName('IDENDCOBRANCA').AsFloat := idEndereco1;
      qryCobranca.ExecSQL;
    end else begin
      if (qryPessoaIDENDCOBRANCA.AsFloat=IdEndereco1) then begin
        qryCobranca.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
        qryCobranca.ParamByName('IDENDCOBRANCA').Clear;
        qryCobranca.ExecSQL;
      end;
    end;

    if (chkbxCorrespondencia.Checked) then begin
      qryCorresp.ParamByName('IDPESSOA').AsFloat     := StrToFloat(IdBeneficiario);
      qryCorresp.ParamByName('IDENDCORRESP').AsFloat := idEndereco1;
      qryCorresp.ExecSQL;
    end else begin
      if (qryPessoaIDENDCORRESP.AsFloat=IdEndereco1) then begin
        qryCorresp.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
        qryCorresp.ParamByName('IDENDCORRESP').Clear;
        qryCorresp.ExecSQL;
      end;
    end;
  end else begin
    if (qryPessoaIDENDCOMERCIAL.AsFloat=IdEndereco1) then begin
      qryComercial.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
      qryComercial.ParamByName('IDENDCOMERCIAL').Clear;
      qryComercial.EXECSQL
    end;

    if (qryPessoaIDENDRESIDENCIAL.AsFloat=IdEndereco1) then begin
      qryResidencial.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
      qryResidencial.ParamByName('IDENDRESIDENCIAL').Clear;
      qryResidencial.ExecSQL;
    end;

    if (qryPessoaIDENDENTREGA.AsFloat=IdEndereco1) then begin
      qryEntrega.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
      qryEntrega.ParamByName('IDENDENTREGA').Clear;
      qryEntrega.ExecSQL;
    end;

    if (qryPessoaIDENDCOBRANCA.AsFloat=IdENDERECO1) then begin
      qryCobranca.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
      qryCobranca.ParamByName('IDENDCOBRANCA').Clear;
      qryCobranca.ExecSQL;
    end;

    if (qryPessoaIDENDCORRESP.AsFloat=IdEndereco1) then begin
      qryCorresp.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
      qryCorresp.ParamByName('IDENDCORRESP').CLEAR;
      qryCorresp.ExecSQL;
    end;
  end;
  //----------------------------------------------------------------------------

  Fiario.IdPessoa     := StrToInt(IdBeneficiario);
  Fiario.IdTitular    := StrToInt(IdTitular);
  Fiario.IdUsuario    := Sistema.IdUsuario;
  Fiario.IdModulo     := 19;
  Fiario.IdRubs       := 0;
  Fiario.DataInclusao := Date;

  qryGrupo.Open;
  if (qryEnderecos.State=dsInsert) then begin
    if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOENDINC.AsInteger<>0) and not (qryGrupoIDFIARIOENDINC.IsNull) then
    begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOENDINC.AsInteger;
      Fiario.Descricao := 'Inclusão do Endereço';
      Fiario.Inserir;
    end;
  end;

  if ( (qryEnderecos.State=dsEdit) and (FlgExcluir=0) ) then begin
    if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOENDALT.AsInteger<>0) and not (qryGrupoIDFIARIOENDALT.IsNull) then
    begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOENDALT.AsInteger;
      Fiario.Descricao := 'Alteração do Endereço';
      Fiario.Inserir;
    end;
  end;

  if (FlgExcluir=1) then begin
    if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOENDEXC.AsInteger<>0) and not (qryGrupoIDFIARIOENDEXC.IsNull) then
    begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOENDEXC.AsInteger;
      Fiario.Descricao := 'Exclusão de Endereço';
      Fiario.Inserir;
    end;
  end;

  with QryEnderecos do begin
    if Active then Close;
    if not Prepared then Prepare;
    ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
    Open;
  end;

  FlgExcluir := 0;
  pnlEnderecos.SendToBack;
end;

procedure TfrmAtend.tbsEnderecosShow(Sender: TObject);
begin
  inherited;

  if not Flagcheckinsere then   //Petri Nocentini SOL 251827 PPM 764141
  begin
  
       if (IdBeneficiario<>'') then begin
          with qryEnderecos do begin
          if Active then Close;
          if not Prepared then Prepare;
          ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
          Open;

// Daniel - 27845 - Início -----------------------------------------------------
          VeriricaAbaDadosParticip;
        {if (RecordCount>0) then begin
            sbtnInsereDetalhe.Enabled := True;
            sbtnAlteraDetalhe.Enabled := True;
            sbtnExcluiDetalhe.Enabled := True;
        end else begin
          sbtnInsereDetalhe.Enabled := True;
          sbtnAlteraDetalhe.Enabled := False;
          sbtnExcluiDetalhe.Enabled := False;
        end;     }

// Daniel - 27845 - Fim --------------------------------------------------------

          end;
        end;

      pnlEnderecos.SendToBack
  end;
end;

procedure TfrmAtend.btnTelOkClick(Sender: TObject);
var Tipo : string;
begin
  // inherited;

  if (dblkLogradouro.LookupValue='') then begin
    MsgDlg('Favor informar a Cidade do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);

    if (dblkLogradouro.CanFocus) then
      dblkLogradouro.SetFocus;

    Exit;
  end;

  if (edtTelDDD.Text='') then begin
    MsgDlg('Favor informar o Número do DDD!', 'Atenção',mtError,[mbOk],0);

    if (edtTelDDD.CanFocus) then
      edtTelDDD.SetFocus;

    Exit;
  end;

  if (edtTelNumeroTelefone.Text='') then begin
    MsgDlg('Favor informar o Número do Telefone!','Atenção',mtError,[mbOk],0);

    if edtTelNumeroTelefone.CanFocus then
      edtTelNumeroTelefone.SetFocus;

    Exit;
  end;

  Tipo := '';

  if (chkTelComercial.Checked=True) then
    Tipo := Tipo+'C';

  if (chkTelParticular.Checked=True) then
    Tipo := Tipo+'P';

  if (chkTelFax.Checked=True) then
    Tipo := Tipo+'F';

  if (chkTelCelular.Checked=True) then
    Tipo := Tipo+'L';

  if (chkTelRecado.Checked=True) then
    Tipo := Tipo+'R';

  if (qryTelefones.State=dsEdit) then

    if MsgDlg( 'Deseja alterar as informações do atendimento referentes ao telefone'+#13+#10+'do solicitante com base nas alterações deste registro?',
               'Atenção',mtConfirmation,[mbYes,mbNo],0)=mrYes then begin
      qry.FieldByName('DDISOLIC').AsString       := qryTelefones.FieldByName('DDI').AsString;
      qry.FieldByName('DDDSOLIC').AsString       := qryTelefones.FieldByName('DDD').AsString;
      qry.FieldByName('NUMEROTELSOLIC').AsString := qryTelefones.FieldByName('NUMERO').AsString;
    end;

  if (qryTelefones.State=dsInsert) then begin
    qryInsereTelefone.ParamByName('IDTELEFONE').AsFloat := LeUltRegistro(nil,'TELENDPESS');
    qryInsereTelefone.ParamByName('IDENDERECO').AsFloat := qryEnderecosIDENDERECO.AsFloat;
    qryInsereTelefone.ParamByName('DDI').AsString       := edtTelDDI.Text;
    qryInsereTelefone.ParamByName('DDD').AsString       := edtTelDDD.Text;
    qryInsereTelefone.ParamByName('TIPO').AsString      := Tipo;
    qryInsereTelefone.ParamByName('NUMERO').AsString    := TrimLeft(TrimRight(edtTelNumeroTelefone.Text));
    qryInsereTelefone.ExecSQL;
  end;

  if ( (qryTelefones.State=dsEdit) and (FlgExcluir=0) ) then begin
    qryAlteraTelefone.ParamByName('IDTELEFONE').AsFloat := qryTelefonesidTelefone.AsFloat;
    qryAlteraTelefone.ParamByName('IDENDERECO').AsFloat := qryTelefonesIDENDERECO.AsFloat;
    qryAlteraTelefone.ParamByName('DDI').AsString       := edtTelDDI.Text;
    qryAlteraTelefone.ParamByName('DDD').AsString       := edtTelDDD.Text;
    qryAlteraTelefone.ParamByName('TIPO').AsString      := Tipo;
    qryAlteraTelefone.ParamByName('NUMERO').AsString    := TrimLeft(TrimRight(edtTelNumeroTelefone.Text));
    qryAlteraTelefone.ExecSQL;
  end;

  if ( FlgExcluir=1 ) then begin
    qryExcTelefone.ParamByName('IDTELEFONE').AsFloat := qryTelefonesidTelefone.AsFloat;
    qryExcTelefone.ExecSQL;
  end;

  Fiario.IdPessoa     := StrToInt(IdBeneficiario);
  Fiario.IdTitular    := StrToInt(IdTitular);
  Fiario.IdUsuario    := Sistema.IdUsuario;
  Fiario.IdModulo     := 19;
  Fiario.IdRubs       := 0;
  Fiario.DataInclusao := Date;

  qryGrupo.open;

  if (qryTelefones.State=dsInsert) then begin
    if (qrygrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELINC.AsInteger<>0) and not (qryGrupoIDFIARIOTELINC.IsNull) then
    begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOTELINC.AsInteger;
      Fiario.Descricao := 'Inclusão do Telefone';
      Fiario.Inserir;
    end;
  end;

  if (qryTelefones.State=dsEdit) and (FlgExcluir=0) then begin
    if (qrygrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELALT.AsInteger<>0) and not (qryGrupoIDFIARIOTELALT.IsNull) then
    begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOTELALT.AsInteger;
      Fiario.Descricao := 'Alteração do Telefone';
      Fiario.Inserir;
    end
  end;

  if (FlgExcluir=1) then begin
    if (qrygrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELEXC.AsInteger<>0) and not (qryGrupoIDFIARIOTELEXC.IsNull) then
    begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOTELEXC.AsInteger;
      Fiario.Descricao := 'Exclusão  do Telefone';
      Fiario.Inserir;
    end;
  end;

  if (qryTelefones.Active) then

    qryTelefones.Close;
    qryTelefones.ParamByName('IDPESSOA').AsInteger := qryEnderecos.FieldByName('IDPESSOA').AsInteger;
    qryTelefones.Open;

  FlgExcluir := 0;
  pnlCadTelefones.SendToBack;
end;

procedure TfrmAtend.btnTelCancelarClick(Sender: TObject);
begin
  inherited;

  qryTelefones.Cancel;
  pnlcadtelefones.SendToBack;
end;

procedure TfrmAtend.btnTelVoltarClick(Sender: TObject);
begin
  inherited;

  qryTelefones.Cancel;
  pnlTelefones.SendToBack;
end;

procedure TfrmAtend.tbsTelefonesShow(Sender: TObject);
begin
  inherited;

  pnlCadTelefones.SendToBack;
  qryTelefones.Close;
  qryTelefones.ParamByName('IDPESSOA').AsInteger := -1;
  qryTelefones.Open;

  if (IdBeneficiario<>'') then begin
    if qryTelefones.Active then begin
      qryTelefones.Close;
      qryTelefones.ParamByName('IdPESSOA').AsFloat := StrToFloat(idbeneficiario);
      qryTelefones.Open;

// Daniel - 27845 - Início -----------------------------------------------------
      if (qryTelefones.RecordCount>0) then begin
        sbtnInsereDetalhe.Enabled := True;
        sbtnAlteraDetalhe.Enabled := True;
        sbtnExcluiDetalhe.Enabled := True;
      end else begin
        sbtnInsereDetalhe.Enabled := True;
        sbtnAlteraDetalhe.Enabled := False;
        sbtnExcluiDetalhe.Enabled := False;
      end;
// Daniel - 27845 - Fim --------------------------------------------------------

    end;
  end;
end;

procedure TfrmAtend.btnCCOkClick(Sender: TObject);
var FlgContaConj : String;
    TipoConta    : Integer;
begin
  inherited;

  if (FlgExcluir=0) then begin
    if (dblkpcmbAgencia.Text='') then begin
      MsgDlg('Favor informar a Agencia Bancaria!','Atenção',mtError,[mbOk],0);

      if (dblkpcmbAgencia.CanFocus) then
        dblkpcmbAgencia.SetFocus;

      Abort;
    end;

    if (rgrpTipoConta.ItemIndex=-1) then begin
      MsgDlg('Favor informar o Tipo de Conta!','Atenção',mtError,[mbOk],0);

      if (rgrpTipoConta.CanFocus) then
        rgrpTipoConta.SetFocus;

      Abort;
    end;

    if (dbgrpContaPref.ItemIndex=-1) then begin
      MsgDlg('Favor informar a Conta Preferencial!','Atenção',mtError,[mbOk],0);

      if (dbgrpContaPref.CanFocus) then
        dbgrpContaPref.SetFocus;

      Abort;
    end;

    if (dbgrpContaConj.ItemIndex=-1) then begin
      MsgDlg('Favor informar a Caracteristica de Conta!','Atenção',mtError,[mbOk],0);

      if (dbgrpContaConj.CanFocus) then
        dbgrpContaConj.SetFocus;

      Abort;
    end;

    if (rgrpTipoConta.ItemIndex=0) then
      TipoConta := 1;

    if (rgrpTipoConta.ItemIndex=1) then
       TipoConta := 2;

    if (rgrpTipoConta.ItemIndex=2) then
       TipoConta := 3;

    if (rgrpTipoConta.ItemIndex=3) then
       TipoConta := 4;

    if (dbgrpContaConj.ItemIndex=0) then
      FlgContaConj := 'N'
    else
      FlgContaConj := 'S';

    try
      StrToInt(qryBancoNUMBANCO.AsString);
    except
      MsgDlg('O Número do Banco não é um Número Inteiro Válido. O Número deve ser um Número '+#13+#10+'Inteiro e deve ser um Número de Agência Bancária Válido','Atenção', mtWarning, [mbOK], 0);
      Exit;
    end;

    if (rgrpTipoConta.ItemIndex<>3) then begin
      try
// Daniel - 23767 - Início -----------------------------------------------------
        CalculaDv           := TCalcDv.Create;
        CalculaDV.TipoConta := TipoConta;

        if (qryBancoFLGVALIDACC.AsString<>'N') then begin
          if not CalculaDV.ValidaConta(qryBancoNUMBANCO.AsString,
                                       qryAgenciaNUMAGENCIA.Asstring,
                                       dbedContaBancaria.Text,
                                       True) then Exit;
        end;
      finally
        CalculaDv.Free;
      end;
    end;
// Daniel - 23767 - Fim --------------------------------------------------------

    if (dbgrpContaPref.ItemIndex=1) then begin
      if (JaExistePreferencial) then begin
        MsgDlg('Já existe outra conta indicada como "Conta Preferencial". Verifique.','Erro',mtError,[mbOk],0);
        dbgrpContaPref.ItemIndex := 0;

        if (dbgrpContaPref.CanFocus) then
          dbgrpContaPref.SetFocus;

        Exit;
      end;
    end;
  end;

  if (qryContaCorrente.State=dsInsert) then begin
    qryInsContaCorrente.ParambyName('IDCBANCARIA').AsFloat       := LeUltRegistro(nil,'CONTABANCARIA');
    qryInsContaCorrente.ParambyName('CONTACORRENTE').AsString    := dbedContaBancaria.Text;
    qryInsContaCorrente.ParambyName('IDPESSOA').AsFloat          := StrToFloat(IdBeneficiario);
    qryInsContaCorrente.ParambyName('TIPOCONTA').AsString        := IntToStr(TipoConta);
    qryInsContaCorrente.ParambyName('FLGCONTAPREF').AsFloat      := dbgrpContaPref.ItemIndex;
    qryInsContaCorrente.ParambyName('IDAGENCIA').AsFloat         := qryAgenciaIDPESSOA.AsFloat;
    qryInsContaCorrente.ParambyName('FLGCONTACONJUNTA').AsString := FlgContaConj;
    qryInsContaCorrente.ExecSQL;
  end;

  if (qryContaCorrente.State=dsEdit) and (FlgExcluir=0) then begin
    qryContaCorrente.ParamByName('IDPESSOA').AsInteger := StrToInt(IdBeneficiario);
    qryContaCorrenteCONTACORRENTE.AsString             := dbedContaBancaria.Text;
    qryContaCorrenteTIPOCONTA.AsString                 := IntToStr(TipoConta);
    qryContaCorrenteFLGCONTAPREF.AsInteger             := dbgrpContaPref.ItemIndex;
    qryContaCorrenteIDAGENCIA.asInteger                := qryAgenciaIDPESSOA.AsInteger;
    qryContaCorrenteFLGCONTACONJUNTA.AsString          := FlgContaConj;
    qryContaCorrente.Post;
    qryContaCorrente.ApplyUpdates;
    qryContaCorrente.Close;
    qryContaCorrente.Open;
  end;

  if (FlgExcluir=1) then begin
    qryExcContaCorrente.ParambyName('IDCBANCARIA').AsFloat := qryContaCorrenteIDCBANCARIA.AsFloat;
    qryExcContaCorrente.ExecSQL;
  end;

  Fiario.IdPessoa     := StrToInt(IdBeneficiario);
  Fiario.IdTitular    := StrToInt(IdTitular);
  Fiario.IdUsuario    := Sistema.Idusuario;                             
  Fiario.IdModulo     := 19;
  Fiario.IdRubs       := 0;
  Fiario.DataInclusao := Date;

  qry.Open;

  if (qryContaCorrente.State=dsInsert) then begin
    if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOCCINC.AsInteger<>0) and not (qryGrupoIDFIARIOCCINC.IsNull) then begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOCCINC.AsInteger;
      Fiario.Descricao := 'Inclusão da ContaCorrente';
      Fiario.Inserir;
    end;
  end;

  if (qryContaCorrente.State=dsEdit) and (FlgExcluir=0) then begin
    if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOCCALT.AsInteger<>0) and not (qryGrupoIDFIARIOCCALT.IsNull) then begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOCCALT.AsInteger;
      Fiario.Descricao := 'Alteração da ContaCorrente';
      Fiario.Inserir;
    end;
  end;

  if (FlgExcluir=1) then begin
    if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOCCEXC.AsInteger<>0) and not (qryGrupoIDFIARIOCCEXC.IsNull) then begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOCCEXC.AsInteger;
      Fiario.Descricao :=  'Exclusão  da ContaCorrente';
      Fiario.Inserir;
    end;
  end;

  qryContaCorrente.Close;
  qryContaCorrente.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
  qryContaCorrente.Open;

  FlgExcluir := 0;
  pnlContasCorrentes.SendToBack;
end;

procedure TfrmAtend.btnCCCancelarClick(Sender: TObject);
begin
  inherited;
  qrycontacorrente.Cancel;
  pnlcontascorrentes.SendToBack;
end;

procedure TfrmAtend.btnCCVoltarClick(Sender: TObject);
begin
  inherited;
  qrycontacorrente.Cancel;
  pnlcontascorrentes.SendToBack;
end;


procedure TfrmAtend.tbsContaCorrenteShow(Sender: TObject);
begin
  inherited;

  pnlContasCorrentes.SendToBack;

  if (IdBeneficiario<>'') then begin
    qryContaCorrente.Close;
    qryContaCorrente.ParamByName('IdPESSOA').AsFloat := StrToFloat(idbeneficiario);
    qryContaCorrente.Open;

// Daniel - 27845 - Início -----------------------------------------------------
    if (qryContaCorrente.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;
// Daniel - 27845 - Fim --------------------------------------------------------

  end;
end;


procedure TfrmAtend.dblkpcmbBancoExit(Sender: TObject);
begin
  inherited;
  //Fanuel Junior SOL172517 Kintana1553783
  {if qryagencia.Active then
   qryagencia.Close;
  qryagencia.ParamByName('pIdBanco').AsFloat := qrybancoidpessoa.AsFloat;
  qryagencia.Open;   }
end;


function TfrmAtend.JaExistePreferencial:boolean;

begin
  Result := False;
  if qrycontapreferencial.Active then
    qrycontapreferencial.Close;
  qrycontapreferencial.ParamByName('IdPESSOA').AsFloat := StrToFloat(idbeneficiario);
  qrycontapreferencial.Open;
  While not qrycontapreferencial.EOF do
  begin
    if (qrycontapreferencial.FieldByName('FLGCONTAPREF').AsFloat = 1)  AND
       (qrycontacorrenteidcbancaria.AsFloat <> qrycontapreferencial.FieldByName('IdCBancaria').AsFloat) then
    begin
      Result := True;
      break;
    end;
    qrycontapreferencial.Next;
  end;
end;


procedure TfrmAtend.DBLKGrupoAssuntoChange(Sender: TObject);
begin
  inherited;
  if dblkGrupoAssunto.Text = '' then
  begin
    dblkGrupoAssunto.LookUpValue  := '';
    CkbFiltraPlanoClick(sender);
  end;
  if (dblkGrupoAssunto.Text <> '') and (dblkGrupoAssunto.LookUpValue <> '') and dblkGrupoAssunto.enabled then
  begin
    DblkAssunto.enabled := True;
    CkbFiltraPlanoClick(sender);
  end;
end;

procedure TfrmAtend.DBLKAssuntoChange(Sender: TObject);
begin
  inherited;
  if (qryAssunto.Active) and (qryGrupoAssunto.Active) and (dblkGrupoAssunto.LookupValue = '') and
     (dblkAssunto.Text <> '')then
  begin
    qryGrupoAssunto.Locate('IDGRUPOASSUNTO', QryAssunto.FieldByName('IDGRUPOASSUNTO').AsInteger,[loCaseInsensitive, loPartialKey]);
    DblkGrupoAssunto.text := QryGrupoAssunto.FieldByName('DESCGRUPOASSUNTO').AsString;
  end;
  if (DBLKAssunto.text <> '') and (DBLKGrupoAssunto.text <> '') then
    ProcuraAssuntoValidaDados(sender);

  qryRespostaPadrao.Close;
  qryRespostaPadrao.ParamByName('IDASSUNTO').asFloat := qryAssunto.FieldByName('IDASSUNTO').asFloat;
  qryRespostaPadrao.Open;

  // Andre - 14/02/2002 - Coloca a resposta padrao automaticamente
  if (Qry.State in [DsEdit,DsInsert]) and (dblkAssunto.text <> '')then
  begin

    QryAssuntoxAtend.Edit;//Petri Nocentini SOL 251827 PPM 764141
    QryAssuntoxAtendDESCRESPATEN.Clear;
    QryAssuntoxAtendIDASSUNTOXRESP.Clear;
    if (qryRespostaPadrao.IsEmpty = FALSE) then
      ReResposta.Text := qryRespostaPadrao.FieldByName('DESCRESPATEN').asString;

    if qryRespostaPadrao.IsEmpty then
      QryAssuntoxAtendDESCRESPATEN.Clear
    else
      QryAssuntoxAtendDESCRESPATEN.AsString := qryRespostaPadraoDESCRESPATEN.AsString;

    QryAssuntoxAtendIDASSUNTOXRESP.AsFloat := qryRespostaPadraoIDASSUNTOXRESP.asFloat;
    QryAssuntoxAtend.Post;//Petri Nocentini SOL 251827 PPM 764141
  end;
end;



procedure TfrmAtend.TbShtDocsXBenefShow(Sender: TObject);
begin
  inherited;
  if (idPlanoPrev <> '') and not (QryBeneficio.Active) then
  begin
    QryBeneficio.Close;
    QryBeneficio.ParamByName('IdPlanoPrev').AsFloat := strToFloat(IdPlanoPrev);
    QryBeneficio.Open;
    DblkBeneficio.Enabled := true;
    if DblkBeneficio.canFocus then
      DblkBeneficio.setFocus;
  end;
end;


procedure TfrmAtend.dblkBeneficioChange(Sender: TObject);
begin
  inherited;
  QrydocsXbenef.Close;
  if (dblkBeneficio.Text <> '') and (dblkBeneficio.Text <> '') and (IDPESSJUR <> '') and (IDPLANOPREV <> '') then
  begin
    QrySitBenef.Close;
    QrySitBenef.paramByName('idpessoa').AsFloat := strToFloat(IDPESSJUR);
    QrySitBenef.paramByName('idplanoprev').AsFloat := strToFloat(IDPLANOPREV);
    QrySitBenef.paramByName('idbeneficio').AsFloat := QryBeneficio.FieldByName('IDSERVICOS').asFloat;
    QrySitBenef.Open;
    DblkSitBenef.Enabled := true;
  end;
  BtnImprime.Enabled := QrydocsXbenef.Active;
end;



procedure TfrmAtend.dblkSitBenefChange(Sender: TObject);
begin
  inherited;
  QrydocsXbenef.Close;
  if (idpessjur <> '') and (idplanoprev <> '') and
     (DblkBeneficio.Text <> '') and (DblkSitBenef.Text <> '') then
  begin
    QryDocsXbenef.paramByName('IDPESSOA').asFloat   := strToFloat(idpessjur);
    QryDocsXbenef.paramByName('IDPLANOPREV').asFloat := strToFloat(idplanoprev);
    QryDocsXbenef.paramByName('IDBENEFICIO').asFloat := QryBeneficio.fieldByName('IDSERVICOS').AsFloat;
    QryDocsXbenef.paramByName('IDSITBENEF').asFloat  := QrySitBenef.fieldByName('IDSITBENEF').AsFloat;
    QryDocsXbenef.Open;
  end;
  BtnImprime.Enabled := QrydocsXbenef.Active;
end;

procedure TfrmAtend.TbShtDocsXBenefEnter(Sender: TObject);
begin
  inherited;
    if DblkBeneficio.canFocus then
      DblkBeneficio.setFocus;
end;

procedure TfrmAtend.BuscaCpfRG(idpessoa : string);
begin
    // PREENCHE O CAMPO CPF
    if qry.state in [dsedit, dsinsert] then
    begin
      NumCpfSolicit               := NumCpf;
      qryNUMDOCUMENTOCPF.ASsTRING := NumCPF;
      dbedCPF.enabled := qrydocpessoa.IsEmpty;
    end;
    dbedCPF.text := NumCPF;
    dbedCPF.refresh;

    // Pega o RG
    qrydocpessoa.Close;
    qrydocpessoa.ParamByName('IDPESSOA').AsFloat := StrToFloat(idpessoa);
    qrydocpessoa.ParamByName('IDDOCUMENTO').AsFloat := qryParamIDDOCRG.AsFloat; // RG padrao da fundacao
    qrydocpessoa.Open;

    // Preenche campo RG
    if qry.state in [dsedit, dsinsert] then
    begin
      qryNUMDOCUMENTORG.ASsTRING := qrydocpessoa.FieldByName('NUMDOCUMENTO').asString;
      dbedRG.enabled := qrydocpessoa.IsEmpty;
    end;
    dbedRG.text := qrydocpessoa.FieldByName('NUMDOCUMENTO').asString;
    dbedRG.refresh;
end;



procedure TfrmAtend.DBEdNomeSolChange(Sender: TObject);
var idaux : string;
begin
  inherited;
  if qry.state <> dsBrowse then
  begin
    if uppercase(ednome.text) = uppercase(dbednomesol.text) then
    begin
      idaux := idTitular;
      BuscaCpfRG(idaux);
    end
    else
    begin
      if qry.state in [dsedit, dsinsert] then
      begin
        qryNUMDOCUMENTOCPF.asString := '';
        qryNUMDOCUMENTORG.asString := '';
        dbedCPF.text := '';
        dbedRG.text := '';
        if (idbeneficiario <> '') and (idbeneficiario <> idTitular) then
          idaux := idbeneficiario
        else
          idaux := '-1';
        BuscaCpfRG(idaux);
      end;
    end;
  end;
end;


procedure TfrmAtend.TbsAssuntosEnter(Sender: TObject);
begin
  inherited;
  if DblkGrupoAssunto.canFocus then DblkGrupoAssunto.SetFocus;
end;

procedure TfrmAtend.BtnImprimeClick(Sender: TObject);
begin
  inherited;
  qryFunPatroPlan.Close;
  qryFunPatroPlan.parambyName('IDTITULAR').asFloat := strToFloat(IDTITULAR);
  qryFunPatroPlan.Open;
  TFrmPreview.CreateModalPreview(Application, ppRdocsXbenef, 'Relação de Documentos por Serviço/Benefício');
end;

procedure TfrmAtend.pgCtrlDadosParticipEnter(Sender: TObject);
begin
  inherited;

  if (not qryDocumentos.Active) and (IdTitular<>'') then begin
    qryDocumentos.Close;
    qryDocumentos.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdTitular);
    qryDocumentos.Open;
  end;

  tbsEnderecosShow(Sender); // Daniel - 21663
end;

procedure TfrmAtend.DBedRG2Change(Sender: TObject);
begin
  inherited;
  if not qryTipoDocPessoa.active then
    qryTipoDocPessoa.Open;
  if qryTipoDocPessoa.Locate('IDDOCUMENTO', qryDocumentosIDDOCUMENTO.asInteger, [loCaseInsensitive, loPartialKey]) then
  begin
    DblkTipoDocPessoa.LookupValue := qryTipoDocPessoaIDDOCUMENTO.asString;
    DblkTipoDocPessoa.Text := qryTipoDocPessoaNOMEDOCUMENTO.asString;
    DblkTipoDocPessoa.Refresh;
  end;
end;

procedure TfrmAtend.btnDocOkClick(Sender: TObject);
begin
  inherited;
  if (DblkTipoDocPessoa.LookupValue <> '') and (idtitular <> '') and (qryDocumentos.state in [dsEdit, dsInsert]) then
  begin
    qryDocumentosIDPESSOA.AsInteger    := strToInt(IdTitular);
    qryDocumentosIDDOCUMENTO.asInteger := strToInt(DblkTipoDocPessoa.LookupValue);

    if qryDocumentosIDDOCUMENTO.asInteger = 2 then  // Valida se for CPF
    begin

      if not ValidaCpf(trim(DBedRG2.Text)) then
      begin
        DBedRG2.setFocus;
        showMessage('Cpf Inválido !');
        Abort;
      end;
    end;

    qryDocumentos.Post;
    deletaDoc := false;
  end;

  if deletaDoc then
  begin
   qryDocumentos.Delete;
   deletaDoc := false;
  end;

  qryDocumentos.ApplyUpdates;
  qryDocumentos.Close;
  qryDocumentos.Open;

  pnlDocumentos.SendToBack;
end;

procedure TfrmAtend.btnDocVoltarClick(Sender: TObject);
begin
  inherited;
  qryDocumentos.CancelUpdates;
  pnlDocumentos.SendToBack;
end;

procedure TfrmAtend.tbsDocumentosShow(Sender: TObject);
begin
  inherited;
  pnlDocumentos.SendToBack;

// Daniel - 27845 - Início -----------------------------------------------------
  if (qryDocumentos.Active) then begin
    if (qryDocumentos.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
end;
end;
// Daniel - 27845 - Fim --------------------------------------------------------

end;

procedure TfrmAtend.btnDocCancelarClick(Sender: TObject);
begin
  inherited;
  qryDocumentos.CancelUpdates;
  pnlDocumentos.SendToBack;
end;

procedure TfrmAtend.PageDadosAssuntoChange(Sender: TObject);
begin
  inherited;

  sbtnExcluiDet.Enabled    := (not QryAssuntoxAtend.IsEmpty) and (qryAssuntoXAtend.State in [dsEdit,dsBrowse]) and
                              (dblkAssunto.Text<>'') and (dblkGrupoAssunto.Text<>'');
  DblkGrupoAssunto.Enabled := QryAssuntoxAtend.State in [dsEdit,dsInsert];
  DblkAssunto.Enabled      := QryAssuntoxAtend.State in [dsEdit,dsInsert];
  DblkGrupoAssunto.Text    := '';
  DblkAssunto.Text         := '';
  ReResposta.Text          := '';

  //9744 -- ALT. ENDERECO
//9748 -- EXCL. ENDERECO
//9752 -- INCL. ENDERECO
  VeriricaAbaDadosParticip;
   {if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) then
   begin
       sbtnInsereDetalhe.Enabled := VerificaAutorizacao('9752');
       sbtnAlteraDetalhe.Enabled := VerificaAutorizacao('9744');
       sbtnExcluiDetalhe.Enabled := VerificaAutorizacao('9748');
   end
   else
   begin
       sbtnInsereDetalhe.Enabled := true;
       sbtnAlteraDetalhe.Enabled := true;
       sbtnExcluiDetalhe.Enabled := true;
   end;  }
   
end;

procedure TfrmAtend.DblkNumAgenciaChange(Sender: TObject);
begin
  inherited;

  dblkpcmbAgencia.Text := qryAgenciaAGENCIA.AsString;
end;

procedure TfrmAtend.dblkpcmbAgenciaChange(Sender: TObject);
begin
  inherited;
  if qryContaCorrente.State in [dsEdit, dsInsert] then
    qryContaCorrente.fieldByName('NUMAGENCIA').asString := qryagencia.fieldByName('NUMAGENCIA').asString;
end;

procedure TfrmAtend.dblkpcmbBancoChange(Sender: TObject);
begin
  inherited;

  //Fanuel Junior SOL172517 Kintana1553783
 if pgCtrlDadosParticip.ActivePage = tbsContaCorrente then
 begin
    { if qryagencia.Active then
       qryagencia.Close;
     qryagencia.ParamByName('pIdBanco').AsFloat := qrybancoidpessoa.AsFloat;
     qryagencia.Open; }

     if qryContaCorrente.State in [dsEdit, dsInsert] then
     begin
        if qryagencia.Active then
           qryagencia.Close;
        qryagencia.ParamByName('pIdBanco').AsFloat := qrybancoidpessoa.AsFloat;
        qryagencia.Open;
        
        qryContaCorrente.fieldByName('NUMBANCO').asString := qryBanco.fieldByName('NUMBANCO').asString;
        qryContaCorrente.fieldByName('NUMAGENCIA').asString := qryagencia.fieldByName('NUMAGENCIA').asString;
        dblkpcmbAgencia.Text := qryAgencia.FieldByName('AGENCIA').AsString;
        dblkpcmbAgencia.PerformSearch;
     end;
 end;
 //Fanuel Junior SOL172517 Kintana1553783
 
end;

function TfrmAtend.ValidaCpf(Cpf: String): Boolean;
var
  dig, i: byte;
  Total: integer;
  begin
  while Length(Cpf) < 11 do
  Cpf:= '0'+Cpf;
  if Cpf <> '00000000000' then
begin
  Total:= 0;
  for i:= 10 downto 2 do
    Total:= Total + (StrToInt(cpf[11-i]) * i);
  dig:= Total mod 11;
  if dig < 2 then
    Dig:= 0
  else
    dig:= 11 - dig;
    if IntToStr(Dig) <> cpf[10] then
      Result:= False
    else
    begin
      Total:= 0;
      for i:= 10 downto 2 do
        Total:= Total + (StrToInt(cpf[12-i]) * i);
      dig:= Total mod 11;
      if dig < 2 then
        Dig:= 0
      else
        dig:= 11 - dig;
      if IntToStr(Dig) <> cpf[11] then
        Result:= False
      else
        Result := True;
    end;
  end
  else
    Result:= False;
end;


procedure TfrmAtend.InscricaoContratoClick(Sender: TObject);
var
  xQry: TwwQuery;
begin
  inherited;
  tbbEmprestimo.Down := False;
  frmCadInscricao := TfrmCadInscricao.Create(frmAtend);

  qrySitPart.Close;
  qrySitPart.ParamByName('IDSITPART').asInteger := idSitPart;
  qrySitPart.Open;

  //Renato Visoni SOL 160536 KINTANA 1349537
  try
    xQry := TwwQuery.Create(self);
    xQry.DatabaseName := 'BaseDados';

    xQry.Close;
    xQry.SQL.Clear;
    xQry.SQL.Add('SELECT * FROM DEPENTIT ');
    xQry.SQL.Add('WHERE MATRICULA = ' + QuotedStr(MatricSolicit));
    xQry.SQL.Add('AND IDTITULAR <> IDPESSOA');
    xQry.Open;

    if not (xQry.isEmpty) then begin
      //Quando for pensionista
      xQry.Close;
      xQry.SQL.Clear;
      xQry.SQL.Add('SELECT                                                                ');
      xQry.SQL.Add('SPP.DESCRICAO AS SIT_PLANO,                                           ');
      xQry.SQL.Add('NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO,                               ');
      xQry.SQL.Add('DEP.IDPESSOA,                                                         ');
      xQry.SQL.Add('DEP.IDTITULAR,                                                        ');
      xQry.SQL.Add('NVL(BFC.IDPLANOPREV, PPP.IDPLANOPREV) AS IDPLANOPREV                  ');
      xQry.SQL.Add('FROM                                                                  ');
      xQry.SQL.Add('ELEGPATRO ELP                                                         ');
      xQry.SQL.Add('JOIN PESSOA PEP ON ELP.IDPESSOA = PEP.IDPESSOA                        ');
      xQry.SQL.Add('JOIN PESSOA PPA ON ELP.IDPESSJUR = PPA.IDPESSOA                       ');
      xQry.SQL.Add('JOIN PARTPREVPLAN PPP ON ELP.IDPESSJUR = PPP.IDPESSJUR                ');
      xQry.SQL.Add('                     AND ELP.IDPESSOA = PPP.IDPESSOA                  ');
      xQry.SQL.Add('JOIN PLANPREV PLP ON PPP.IDPLANOPREV = PLP.IDPLANOPREV                ');
      xQry.SQL.Add('JOIN SITPART SIP ON PPP.IDSITPART = SIP.IDSITPART                     ');
      xQry.SQL.Add('JOIN SITPLANOPREV SPP ON PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV      ');
      xQry.SQL.Add('JOIN DEPENTIT DEP ON DEP.IDTITULAR = ELP.IDPESSOA                     ');
      xQry.SQL.Add('JOIN PESSOA PDP ON DEP.IDPESSOA = PDP.IDPESSOA                        ');
      xQry.SQL.Add('JOIN (SELECT DISTINCT BNF.IDPESSOA,                                   ');
      xQry.SQL.Add('                      BNF.IDTITULAR,                                  ');
      xQry.SQL.Add('                      BNF.IDPLANOPREV,                                ');
      xQry.SQL.Add('                      BNF.IDPLANOORIGEM,                              ');
      xQry.SQL.Add('                      BNF.IDPLANPREVCONTAB                            ');
      xQry.SQL.Add('        FROM BENEFBFCIARIO BNF                                        ');
      xQry.SQL.Add('       WHERE (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE)       ');
      xQry.SQL.Add('         AND BNF.FONTEPAGADORA = 1                                    ');
      xQry.SQL.Add('         AND BNF.IDSITBENEFICIO IN                                    ');
      xQry.SQL.Add('                  (SELECT MIN(SB1.IDSITBENEFICIO)                     ');
      xQry.SQL.Add('                     FROM BENEFBFCIARIO SB1                           ');
      xQry.SQL.Add('                    WHERE BNF.IDPESSOA = SB1.IDPESSOA                 ');
      xQry.SQL.Add('                      AND BNF.IDTITULAR = SB1.IDTITULAR               ');
      xQry.SQL.Add('                      AND SB1.IDSITBENEFICIO IN (1, 2, 7))) BFC ON BFC.IDPESSOA = ');
      xQry.SQL.Add('                                                                   DEP.IDPESSOA   ');
      xQry.SQL.Add('                                                               AND BFC.IDTITULAR = ');
      xQry.SQL.Add('                                                                   DEP.IDTITULAR   ');

      xQry.SQL.Add('   JOIN PLANPREV PLP2 ON PLP2.IDPLANOPREV = BFC.IDPLANOPREV       ');
      xQry.SQL.Add(' WHERE ((BFC.IDPLANPREVCONTAB = 28 OR                             ');
      xQry.SQL.Add('       (BFC.IDPLANPREVCONTAB <> 28) AND NOT EXISTS                ');
      xQry.SQL.Add('       (SELECT 1                                                  ');
      xQry.SQL.Add('          FROM BENEFBFCIARIO BF                                   ');
      xQry.SQL.Add('         WHERE (BF.DATAFINAL IS NULL OR BF.DATAFINAL > SYSDATE)   ');
      xQry.SQL.Add('           AND BF.IDPESSOA = BFC.IDPESSOA                         ');
      xQry.SQL.Add('           AND BF.IDTITULAR = BFC.IDTITULAR                       ');
      xQry.SQL.Add('           AND BF.FONTEPAGADORA = 1                               ');
      xQry.SQL.Add('           AND BF.IDTPPAGTOBENEFIC = 1                            ');
      xQry.SQL.Add('           AND BF.IDPLANPREVCONTAB = 28                           ');
      xQry.SQL.Add('           AND BF.IDSITBENEFICIO IN                               ');
      xQry.SQL.Add('               (SELECT MIN(SB1.IDSITBENEFICIO)                    ');
      xQry.SQL.Add('                  FROM BENEFBFCIARIO SB1                          ');
      xQry.SQL.Add('                 WHERE BF.IDPESSOA = SB1.IDPESSOA                 ');
      xQry.SQL.Add('                   AND BF.IDTITULAR = SB1.IDTITULAR               ');
      xQry.SQL.Add('                   AND SB1.IDSITBENEFICIO IN (1, 2, 7)))))        ');
      xQry.SQL.Add('  AND bfc.idpessoa <> bfc.idtitular                               ');
      xQry.SQL.Add('  AND ppp.idplanoprev = (SELECT MAX(PPP2.IDPLANOPREV)             ');
      xQry.SQL.Add('                           FROM PARTPREVPLAN PPP2                 ');
      xQry.SQL.Add('                           WHERE PPP2.IDPESSOA = PPP.IDPESSOA)AND DEP.MATRICULA = ' + QuotedStr(MatricSolicit));
      xQry.Open;

      //Otacilio Aquino SOL 161927  KINTANA 1375111
      IDPLANOPREV := sIdPlano;
      sPlano      := sPlanoPrev;

    end else begin
      //BRUNO AZEVEDO SOL 148514 KINTANA 1047194
      //Quando for Titular
      xQry.Close;
      xQry.Sql.Clear;
      xQry.Sql.Add('SELECT');
      xQry.Sql.Add('   SPP.DESCRICAO AS SIT_PLANO,');
      xQry.Sql.Add('   NVL(PLP2.NOME, PLP.NOME) AS NOME_PLANO,');
      xQry.Sql.Add('   DEP.IDPESSOA,');
      xQry.Sql.Add('   DEP.IDTITULAR,');
      xQry.Sql.Add('   NVL(BFC.IDPLANOPREV, PPP.IDPLANOPREV) AS IDPLANOPREV');
      xQry.Sql.Add('FROM');
      xQry.Sql.Add('   PESSOA       PDP,');
      xQry.Sql.Add('   PESSOA       PEP,');
      xQry.Sql.Add('   PESSOA       PPA,');
      xQry.Sql.Add('   DEPENTIT     DEP,');
      xQry.Sql.Add('   ELEGPATRO    ELP,');
      xQry.Sql.Add('   PARTPREVPLAN PPP,');
      xQry.Sql.Add('   PLANPREV     PLP,');
      xQry.Sql.Add('   PLANPREV     PLP2,');
      xQry.Sql.Add('   SITPART      SIP,');
      xQry.Sql.Add('   SITPLANOPREV SPP,');
      xQry.Sql.Add('   (');
      xQry.Sql.Add('   SELECT DISTINCT');
      xQry.Sql.Add('      BNF.IDPESSOA, BNF.IDTITULAR, BNF.IDPLANOPREV, BNF.IDPLANOORIGEM');
      xQry.Sql.Add('   FROM');
      xQry.Sql.Add('      BENEFBFCIARIO BNF,');
      xQry.Sql.Add('      PARTPREVPLAN PRV');
      xQry.Sql.Add('   WHERE');
      xQry.Sql.Add('          (BNF.DATAFINAL IS NULL OR BNF.DATAFINAL > SYSDATE)');
      xQry.Sql.Add(' AND BNF.IDSITBENEFICIO IN (SELECT MIN(SB1.IDSITBENEFICIO) FROM BENEFBFCIARIO SB1 WHERE BNF.IDPESSOA = SB1.IDPESSOA AND SB1.IDSITBENEFICIO IN (1, 2, 7))');
      xQry.Sql.Add('      AND BNF.IDTITULAR = PRV.IDPESSOA');
      xQry.Sql.Add('      AND BNF.IDPLANOORIGEM = PRV.IDPLANOPREV');
      xQry.Sql.Add('      AND PRV.FLGDESATIVADO  = 0');
      xQry.Sql.Add('   ) BFC');
      xQry.Sql.Add('WHERE');
      xQry.Sql.Add('       ELP.IDPESSOA       = PEP.IDPESSOA');
      xQry.Sql.Add('   AND ELP.IDPESSJUR      = PPA.IDPESSOA');
      xQry.Sql.Add('   AND ELP.IDPESSJUR      = PPP.IDPESSJUR');
      xQry.Sql.Add('   AND ELP.IDPESSOA       = PPP.IDPESSOA');
      xQry.Sql.Add('   AND ELP.IDPESSOA       = DEP.IDTITULAR(+)');
      xQry.Sql.Add('   AND DEP.IDPESSOA       = PDP.IDPESSOA(+)');
      xQry.Sql.Add('   AND DEP.IDPESSOA       = BFC.IDPESSOA(+)');
      xQry.Sql.Add('   AND BFC.IDPLANOPREV    = PLP2.IDPLANOPREV(+)');
      xQry.Sql.Add('   AND PPP.IDPLANOPREV    = PLP.IDPLANOPREV');
      xQry.Sql.Add('   AND PPP.IDSITPART      = SIP.IDSITPART');
      xQry.Sql.Add('   AND PPP.IDSITPLANOPREV = SPP.IDSITPLANOPREV');
      xQry.Sql.Add('   AND BFC.IDTITULAR(+)   = DEP.IDTITULAR');
      xQry.Sql.Add('   AND (ppp.idplanoprev = (SELECT MAX(ppp2.idplanoprev)');
      xQry.Sql.Add('                           FROM partprevplan ppp2');
      xQry.Sql.Add('                           WHERE ppp2.flgdesativado = 0');
      xQry.Sql.Add('                           AND   ppp2.idpessoa = ppp.idpessoa )');
      xQry.Sql.Add('     AND NOT EXISTS (SELECT 1 FROM partprevplan ppp2');
      xQry.Sql.Add('                     WHERE ppp2.idplanoprev = 2');
      xQry.Sql.Add('                     AND   ppp2.idsitplanoprev = 25');
      xQry.Sql.Add('                     AND   ppp2.idpessoa = ppp.idpessoa)');
      xQry.Sql.Add('     OR');
      xQry.Sql.Add('     ppp.idsitplanoprev = 25)');
      xQry.Sql.Add('   AND DEP.MATRICULA = :MATRICULA');
      xQry.ParamByName('MATRICULA').AsString := MatricSolicit;
      xQry.Open;
    end;

    //Otacilio Aquino SOL 161927  KINTANA 1375111 -- Inicio
    //Eraldo Silva SOL 164803 KINTANA 1419435 -- Inicio
    if Trim(xQry.FieldByName('NOME_PLANO').AsString) <> '' then
        sPlano      := xQry.FieldByName('NOME_PLANO').AsString;

    if Trim(xQry.FieldByName('IDPLANOPREV').AsString) <> '' then
         idplanoprev := Trim(xQry.FieldByName('IDPLANOPREV').AsString);
    //Otacilio Aquino SOL 161927  KINTANA 1375111 -- Fim
    //Eraldo Silva SOL 164803 KINTANA 1419435 -- Fim
  finally
    FreeAndNil(xQry);
  end;
  //BRUNO AZEVEDO SOL 148514 KINTANA 1047194
  //Renato Visoni SOL 160536 KINTANA 1349537


  frmCadInscricao.SelecionaMutuarioParaInscricao(strToIntDef(IdBeneficiario, -1), strToIntDef(idtitular, -1), iInscricao,
                                                 strToIntDef(idpessjur, -1), strToIntDef(idplanoprev, -1), idSitPart,
                                                 NomeSolicit, sPlano, sPatro, MatricSolicit, sSitPart,
                                                 qrySitPart.fieldByName('FlgInterno').asString,
                                                 NumCpfSolicit, NumCpfTit, NomeTit, MatricTit, 2);
  HabilitaMenuEmprestimo(-1);
end;

procedure TfrmAtend.ContratacaoClick(Sender: TObject);
begin
  inherited;
  tbbEmprestimo.Down := False;
  AbrirForm(frmCadInscricao,TfrmCadInscricao,False);
  HabilitaMenuEmprestimo(-1);
end;

procedure TfrmAtend.ConsultaContrato1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmRelContrato,FrmRelContrato);
  FrmRelContrato.sMatricula := EdMat.Text;

  FrmRelContrato.WindowState := wsMaximized;
  FrmRelContrato.FormStyle   := fsMDIChild;
  FrmRelContrato.Show;
  HabilitaMenuEmprestimo(-1);
end;

procedure TfrmAtend.qutacaoAntecipadaClick(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TFrmExecquitacao, FrmExecquitacao);
  FrmExecquitacao.sMatricula := EdMat.Text;
  FrmExecquitacao.WindowState := wsMaximized;
  FrmExecquitacao.FormStyle   := fsMDIChild;
  FrmExecquitacao.Show;
  HabilitaMenuEmprestimo(-1);
end;

procedure TfrmAtend.CancelamentodeQuitacaoClick(Sender: TObject);
begin
  inherited;

  Application.CreateForm(TFrmCancQuitacao, FrmCancQuitacao);
  FrmCancQuitacao.sMatricula := EdMat.Text;
  FrmCancQuitacao.WindowState := wsMaximized;
  FrmCancQuitacao.FormStyle   := fsMDIChild;
  FrmCancQuitacao.Show;
  HabilitaMenuEmprestimo(-1);
end;

procedure TfrmAtend.AmortizacaoClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TFrmExecAmortizacao, FrmExecAmortizacao);
   FrmExecAmortizacao.sMatricula := EdMat.Text;
   FrmExecAmortizacao.WindowState := wsMaximized;
   FrmExecAmortizacao.FormStyle   := fsMDIChild;
   FrmExecAmortizacao.Show;
   HabilitaMenuEmprestimo(-1);
end;



procedure TfrmAtend.CancelamentodeAmortizacaoClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TFrmCancAmortizacao, FrmCancAmortizacao);
   FrmCancAmortizacao.sMatricula := EdMat.Text;
   FrmCancAmortizacao.WindowState := wsMaximized;
   FrmCancAmortizacao.FormStyle   := fsMDIChild;
   FrmCancAmortizacao.Show;
   HabilitaMenuEmprestimo(-1);
end;



procedure TfrmAtend.TratIndivParcelas1Click(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TFrmExecTrataParcela, FrmExecTrataParcela);
   FrmExecTrataParcela.sMatricula := EdMat.Text;
   FrmExecTrataParcela.WindowState := wsMaximized;
   FrmExecTrataParcela.FormStyle   := fsMDIChild;
   FrmExecTrataParcela.Show;
   HabilitaMenuEmprestimo(-1);
end;



// Gleyber - 06/06/2003 - Início
procedure TfrmAtend.dblkCidadeChange(Sender: TObject);
begin
   inherited;
   if bPodeAlterarEstado then
     if dblkCidade.Text <> '' then
     begin
       dblkEstado.Value      := qryCidades.FieldByName('CODESTADO').AsString;
       qryUF.Locate( 'CODESTADO', qryCidades.FieldByName('CODESTADO').AsString, [] );
       if not ( Qry.State in [dsInsert, dsEdit] ) then
         Qry.Edit;
       QryIdEstado.AsInteger := qryUFIDESTADO.AsInteger;
     end;
end;


procedure TfrmAtend.rgrpTipoContaChange(Sender: TObject);
begin
   inherited;

   if (rgrptipoconta.ItemIndex = 3) then
   begin
      dbgrpContaPref.ItemIndex := 0;
      dbgrpcontaconj.ItemIndex := 0;
   end
   else
   begin
      dbgrpContaPref.ItemIndex := -1;
      dbgrpcontaconj.ItemIndex := -1;
   end;
end;



procedure TfrmAtend.DadosPessoais1Click(Sender: TObject);
begin
   inherited;
   // Marchetti - 22897
   if Qry.State in [DsEdit,DsInsert] then
   begin
     bbtnCancelarClick(bbtnCancelar);
     if bCancelaAtendimento then
       if (dtmConsPart1.Cds.Active=True) then PegaParticipanteAtend; // Daniel - 21551
   end;
   // Fim.
end;



// Andre Tavares - 15718 - 20/02/2004
procedure TfrmAtend.ContraCheque1Click(Sender: TObject);
begin
   inherited;

   if (StrToIntDef(IdBeneficiario,0)<>0) then begin
     FreeAndNil(ConsPart2);// Vinicius Ferreira SOL 175950 Kintana 1602996
     ConsPart2 := TConsPart.Create(frmAtend);
     try
       ConsPart2.sIdpessoa     := IdTitular;
       ConsPart2.sIdTitular    := IdTitular;
       ConsPart2.MostraConsultaContraCheque;
     finally
       //FreeAndNil(ConsPart2); // Vinicius Ferreira SOL 175950 Kintana 1602996
     end;
   end;
end;



// Andre Tavares - 17981 - 13/01/2005 - Início ---------------------------------
procedure TfrmAtend.edDigBancoExit(Sender: TObject);
begin
  inherited;

  if Trim(edDigBanco.Text)='' then Exit;

  if qryBanco.Locate('NUMBANCO',Trim(edDigBanco.Text),[loCaseInsensitive,loPartialKey]) then begin
    dblkpcmbBanco.Text := qryBanco.FieldByName('BANCO').AsString;
    dblkpcmbBanco.PerformSearch;

    if qryContaCorrente.State in dsEditModes then begin // Daniel - 27751
      qryContaCorrente.FieldByName('NUMBANCO').AsString   := qryBanco.FieldByName('NUMBANCO').AsString;
      qryContaCorrente.FieldByName('NUMAGENCIA').AsString := '';
    end;
  end;

  dblkpcmbBancoExit(Sender);
  dblkpcmbAgencia.Text := qryAgencia.FieldByName('AGENCIA').AsString;
  dblkpcmbAgencia.PerformSearch;
end;

procedure TfrmAtend.edDigAgenciaExit(Sender: TObject);
begin
   inherited;

   if Trim(edDigAgencia.Text) = '' then Exit;

   if qryAgencia.Locate('NUMAGENCIA',Trim(edDigAgencia.Text),[loCaseInsensitive, loPartialKey]) then
   begin
      dblkpcmbAgencia.Text := qryAgencia.FieldByName('AGENCIA').AsString;
      dblkpcmbAgencia.PerformSearch;
      if qryContaCorrente.State in dsEditModes then // Daniel - 27751
        qryContaCorrente.FieldByName('NUMAGENCIA').AsString := qryAgencia.FieldByName('NUMAGENCIA').asString;
   end;
end;
// Andre Tavares - 17981 - 13/01/2005 - Fim ------------------------------------


procedure TfrmAtend.GravaEmissaoCarta(Sender: TObject);
begin
   try
      if (Application.MessageBox('As RUBS foram impressas corretamente?','Central de Atendimento ao Público',Mb_YesNo + Mb_IConQuestion) = Id_Yes) then
      begin
        qryAux.Close;
        qryAux.SQL.Text :=
        ' update RUBS       '+
        ' set FLGSTATUS = 2 '+
        ' where IDRUBS =    '+ formatFloat('#0', RUBS.idrubs);

        qryAux.ExecSQL;

        qryAux.Close;
        qryAux.SQL.Text :=
        ' INSERT INTO HISTMOVRUBS '+
        ' (IDHISTMOVRUBS, IDRUBS, FLGSTATUS, DATAMOV, HISTORICO) '+
        ' VALUES ( '+ intToStr(LeultRegistro(nil,'HISTMOVRUBS')) + ', '+ formatFloat('#0', RUBS.idrubs) + ' , 2, '
        + 'to_date(' + quotedStr(DateTimeToStr(now)) + ',''dd/mm/yyyy hh24:mi:ss'')' +', ' + quotedStr('RUBS Emitida (impressa)') + ') ';

        qryAux.ExecSQL;
      end;
   except
      Raise;
   end;
end;



procedure TfrmAtend.mnuAssinaturaContratoClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TfrmAssinaturaContrato, frmAssinaturaContrato);
   frmAssinaturaContrato.iPessoa     := strToIntDef(IdBeneficiario, -1);
   frmAssinaturaContrato.FormStyle   := fsMDIChild;
   frmAssinaturaContrato.Show;
   HabilitaMenuEmprestimo(-1);
end;



procedure TfrmAtend.mnuHistoricoSuspensaoClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TfrmHistoricoSuspensaoCob, frmHistoricoSuspensaoCob);
   frmHistoricoSuspensaoCob.sMatricula := EdMat.Text;
   frmHistoricoSuspensaoCob.FormStyle   := fsMDIChild;
   frmHistoricoSuspensaoCob.Show;
   HabilitaMenuEmprestimo(-1);
end;



procedure TfrmAtend.btnAgendamentoClick(Sender: TObject);
var
  iIdAgendamento : integer;
  iIdPessoa      : integer;
  sNomeSolic     : string;

  Agendamento : TAgendamento;
begin
  inherited;

  Agendamento.iIdAtendeAgenda := 0;
  Agendamento.dData           := 0;
  Agendamento.sHora           := '';

  if ( CmeCadastro.Operacao = opInserir ) and ( qryIDATEND.AsInteger = 0 ) then
    qryIDATEND.AsInteger := LeultRegistro( nil, 'ATEND' );

  iIdAgendamento := AgendamentoPorAtendimento( qryIDATEND.AsInteger );
  if iIdAgendamento = 0 then
    if not SelecionaAgendamento( 0, Agendamento ) then
    begin
      WindowState := wsMaximized;
      exit;
    end;

  if trim( uppercase( qryNOMESOLICITANTE.AsString ) ) = trim( uppercase( sNomeOriginal ) ) then
  begin
    iIdPessoa  := iff( qryIDBENEFICIARIO.AsInteger <= 0, qryIDTITULAR.AsInteger, qryIDBENEFICIARIO.AsInteger );
    sNomeSolic := '';
  end
  else
  begin
    iIdPessoa  := 0;
    sNomeSolic := qryNOMESOLICITANTE.AsString;
  end;

  AgendamentoAtend( iIdAgendamento, qryIDATEND.AsInteger, iIdPessoa, sNomeSolic, Agendamento.iIdAtendeAgenda,
   Agendamento.dData, Agendamento.sHora, False );

  if CmeCadastro.Operacao = opInserir then
  begin
    if sIdAtendInsert <> '' then sIdAtendInsert := sIdAtendInsert + ', ';
    sIdAtendInsert := sIdAtendInsert + IntToStr( iIdAgendamento );
  end;

  WindowState := wsMaximized;
end;

procedure TfrmAtend.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if CmeCadastro.Operacao in [opInserir, opAlterar] then
  begin
    MsgDlg('Não é possível fechar esta janela com um atendimento em curso.', 'Erro' ,mtError, [mbOK], 0);
    CanClose := False;
  end;

  // David - 21749
  if CanClose then
    bbtnCancelarClick( nil );

  // inherited;
end;

procedure TfrmAtend.qryBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  bPodeAlterarEstado := False;
end;

procedure TfrmAtend.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  bPodeAlterarEstado := True;

  if not Qry.isEmpty then begin
    Qry.Edit;
    qryCODESTADOSOLIC.AsString  := 'DF';
    qry.Post;
  end;
end;

procedure TfrmAtend.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled := True;
end;

// Daniel Simões - 21784 - 29/08/2006 - Início ---------------------------------
procedure TfrmAtend.AvisaPreenchimentoEndereco;
begin
  with qryPessoa do begin
    if Active then Close;

    if not Prepared then Prepare;

    ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
    Open;
  end;

  if ( qryPessoaIdEndCorresp.AsFloat=qryEnderecosIDENDERECO.AsFloat ) then
    chkbxCorrespondencia.Checked := True;

  if ( qryPessoaIdEndComercial.AsFloat=qryEnderecosIDENDERECO.AsFloat ) then
    chkbxComercial.Checked := True;

  if ( qryPessoaIdEndEntrega.AsFloat=qryEnderecosIDENDERECO.AsFloat ) then
    chkbxEntrega.Checked := True;

  if ( qryPessoaIdEndResidencial.AsFloat=qryEnderecosIDENDERECO.AsFloat ) then
    chkbxResidencial.Checked := True;

  if ( qryPessoaIdEndCobranca.AsFloat=qryEnderecosIDENDERECO.AsFloat ) then
    chkbxCobranca.Checked := True;

  if ( qryEnderecos.RecordCount=0 ) or
     ( (chkbxComercial.State=cbUnchecked)   and
       (chkbxResidencial.State=cbUnchecked) and
       (chkbxEntrega.State=cbUnchecked)     and
       (chkbxCobranca.State=cbUnchecked)    and
       (chkbxCorrespondencia.State=cbUnchecked) ) then
      MsgDlg('O Endereço do participante está em branco ou não foi selecionado nenhum tipo de endereço.',
             'Atendimento',mtWarning,[mbOk],0);

  qryPessoa.Close;
end;
// Daniel Simões - 21784 - 29/08/2006 - Fim ------------------------------------


// Daniel Simões - 21551 - 12/09/2006 - Início ---------------------------------
procedure TfrmAtend.PegaParticipanteAtend;
var
   iLoopTel : Integer;
   h,m,s,ms : word;
begin
  ResetaQueries;

  // Titular inválido...
  if (dtmConsPart1.cds.FieldByName('IDTITULAR').AsString='') then begin
    MsgDlg('Elegível / Participante ou Dependente Inválido.','Erro',mtError,[mbOK],0);
    TbShtAtend.Enabled := False;
    Abort;
  end;

  iDSitPart          := StrToIntDef(dtmConsPart1.cds.FieldByName('IDSITPART').AsString,-1);
  MatricSolicit      := dtmConsPart1.cds.FieldByName('MATRICULA').AsString;
  TbShtAtend.Enabled := True;

  //BRUNO AZEVEDO SOL 157920 KINTANA 1268194
  // Carrega campos da tela...
  if (dtmConsPart1.cds.FieldByName('IDTITULAR').AsString<>dtmConsPart1.cds.FieldByName('IDPESSOA').AsString) then begin
    //qryTitular.Close;
    //qryTitular.paramByName('MATRICULA').AsString := dtmConsPart1.cds.FieldByName('MATRICULA').AsString; //Henrique Massão - 17/04/2009 - SOl 114115
    //qryTitular.Open;

    //BRUNO AZEVEDO SOL 158091 KINTANA 1274676
    qryPlanoPrevBeneficiario.Close;
    qryPlanoPrevBeneficiario.paramByName('MATRICULA').AsString := dtmConsPart1.cds.FieldByName('MATRICULA').AsString;
    qryPlanoPrevBeneficiario.Open;

    if not (qryPlanoPrevBeneficiario.IsEmpty) then begin
      IdPlanoPrev := qryPlanoPrevBeneficiario.FieldByName('IDPLANOPREV').AsString;
      sPlano      := qryPlanoPrevBeneficiario.FieldByName('PLANO').AsString;
      idPessjur   := qryPlanoPrevBeneficiarioIDPESSJUR.AsString; // Vinicius Ferreira - SOL 171141 KINTANA 1531616
    end else begin
      IdPlanoPrev := qryTitular.FieldByName('IDPLANOPREV').AsString;
      sPlano      := qryTitular.FieldByName('PLANO').AsString;
      IdPessjur   := dtmConsPart1.cds.FieldByName('IDPESSJUR').AsString; // Vinicius Ferreira - SOL 171141 KINTANA 1531616
    end;

    EdNome.Text        := qryPlanoPrevBeneficiarioNOME_TITULAR.AsString;
    NomeTit            := qryPlanoPrevBeneficiarioNOME_TITULAR.AsString;
    EdCpf.Text         := qryPlanoPrevBeneficiarioCPF_TITULAR.AsString;
    NumCpfTit          := qryPlanoPrevBeneficiarioCPF_TITULAR.AsString;
    sNomeOriginal      := dtmConsPart1.cds.FieldByName('NOME').AsString;
    NumCpf             := dtmConsPart1.cds.FieldByName('NUMDOCUMENTO').AsString;
    EdMat.Text         := dtmConsPart1.cds.FieldByName('MATRICULA').AsString;
    MatricTit          := dtmConsPart1.cds.FieldByName('MATRICULA').AsString;
    EdInsc.Text        := qryPlanoPrevBeneficiarioINSCRICAONUMERO.AsString;
    iInscricao         := qryPlanoPrevBeneficiarioINSCRICAONUMERO.AsInteger;
    EdPlano.Text       := qryPlanoPrevBeneficiarioPLANO.AsString;
    EdPatro.Text       := qryPlanoPrevBeneficiarioPATRO.AsString;
    sPatro             := qryPlanoPrevBeneficiarioPATRO.AsString;
    //idPessjur          := qryPlanoPrevBeneficiarioIDPESSJUR.AsString; // Vinicius Ferreira - SOL 171141 KINTANA 1531616
    idTitular          := dtmConsPart1.cds.FieldByName('IDTITULAR').AsString;
    EdtSitCad.Text     := qryPlanoPrevBeneficiarioDESCRICAO.AsString;
    EdSitPlano.text    := qryPlanoPrevBeneficiarioSITUACAONOPLANO.AsString; // Jessica Lana Nunes dos Santos SOL 98836 - 17/03/2009
    sSitPart           := qryPlanoPrevBeneficiarioDESCRICAO.AsString;
    IdBeneficiario     := dtmConsPart1.cds.FieldByName('IDPESSOA').AsString;
    EdidPlanoPrev.Text := qryPlanoPrevBeneficiarioPLANO.AsString;
    Sequencia          := qryPlanoPrevBeneficiarioSEQPROPOSTA.AsString;
    EmailSolicit.Text  := dtmConsPart1.cds.FieldByName('EMAIL').AsString;
  end else begin
    EdNome.Text        := dtmConsPart1.cds.FieldByName('NOME').AsString;
    NomeTit            := dtmConsPart1.cds.FieldByName('NOME').AsString;
    EdCpf.Text         := dtmConsPart1.cds.FieldByName('NUMDOCUMENTO').AsString;
    NumCpfTit          := dtmConsPart1.cds.FieldByName('NUMDOCUMENTO').AsString;
    sNomeOriginal      := dtmConsPart1.cds.FieldByName('NOME').AsString;
    NumCpf             := dtmConsPart1.cds.FieldByName('NUMDOCUMENTO').AsString;
    EdMat.Text         := dtmConsPart1.cds.FieldByName('MATRICULA').AsString;
    MatricTit          := dtmConsPart1.cds.FieldByName('MATRICULA').AsString;
    EdiNsc.Text        := dtmConsPart1.cds.FieldByName('INSCRICAONUMERO').AsString;
    iInscricao         := qryTitularINSCRICAONUMERO.AsInteger;
    EdPlano.Text       := dtmConsPart1.cds.FieldByName('PLANO').AsString;
    sPlano             := dtmConsPart1.cds.FieldByName('PLANO').AsString;
    EdPatro.Text       := dtmConsPart1.cds.FieldByName('PATRO').AsString;
    sPatro             := dtmConsPart1.cds.FieldByName('PATRO').AsString;
    IdPessjur          := dtmConsPart1.cds.FieldByName('IDPESSJUR').AsString;
    IdTitular          := dtmConsPart1.cds.FieldByName('IDTITULAR').AsString;
    EdSitPlano.text    := dtmConsPart1.cds.FieldByName('SITUACAONOPLANO').AsString; // Jéssica Lana 98836 - 17/03/2009

    // Daniel - 23992
    EdtSitCad.Text     := dtmConsPart1.cds.FieldByName('SITFUND').AsString;
    sSitPart           := dtmConsPart1.cds.FieldByName('SITFUND').AsString;
    // Fim.

    IdBeneficiario     := dtmConsPart1.cds.FieldByName('IDPESSOA').AsString;
    IdPlanoPrev        := dtmConsPart1.cds.FieldByName('IDPLANOPREV').AsString;
    EdidPlanoPrev.Text := dtmConsPart1.cds.FieldByName('IDPLANOPREV').AsString;
    Sequencia          := dtmConsPart1.cds.FieldByName('SEQPROPOSTA').AsString;
    EmailSolicit.Text  := dtmConsPart1.cds.FieldByName('EMAIL').AsString;
  end;

  qryEMAIL.AsString := EmailSolicit.text;
  DbedAtend.Text    := Sistema.NomeUsuario;

  qryPessoaFisica.Close;
  qryPessoaFisica.ParamByName('IDPESSOA').AsInteger := StrToInt(IdTitular);
  qryPessoaFisica.Open;

  EdtBloqueio.Visible := qryPessoaFisicaFLGBLOQUEIO.AsInteger=1;

  with QryEnderecos do begin
    if Active then Close;

    if not Prepared then Prepare;

    ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
    Open;
  end;

  PgAtend.ActivePage      := TbShtAtend;
  EddlgHoraInicio.Text    := TimeToStr(Time);
  EddlgHoraInicio.Enabled := False;
  Timer1.Enabled          := True;

  if ( DbedNomeSol.CanFocus ) then
    DbedNomeSol.SetFocus;

  // Insere um atendimento...
  if (CmeCadastro.Operacao=OpInserir) then begin
    if dtmAtend.QryDadosParticip.Active then dtmAtend.QryDadosParticip.Close;

    if not dtmAtend.QryDadosParticip.Prepared then dtmAtend.QryDadosParticip.Prepare;

    dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat :=
      StrToFloat(dtmConsPart1.cds.FieldByName('IDPESSOA').AsString);
    dtmAtend.QryDadosParticip.Open;

    qryNOMESOLICITANTE.AsString := dtmAtend.QryDadosParticipNOME.AsString;
    NomeSolicit                 := qryNOMESOLICITANTE.AsString;
    qryTELSOLICITANTE.AsString  := TrimLeft(TrimRight(dtmAtend.QryDadosParticipNUMTEL.AsString));
    qryLOGRADOURO.AsString      := dtmAtend.QryDadosParticipLOGRADOURO.AsString;
    qryNUMEROSOLIC.AsString     := dtmAtend.QryDadosParticipNUMERO.AsString;
    qryCOMPLEMSOLIC.AsString    := dtmAtend.QryDadosParticipCOMPLEMENTO.AsString;
    qryBAIRROSOLIC.AsString     := dtmAtend.QryDadosParticipBAIRRO.AsString;
    qryCEPSOLIC.AsString        := dtmAtend.QryDadosParticipCEP.AsString;
    qryCIDADESOLIC.AsString     := dtmAtend.QryDadosParticipCIDADE.AsString;
    qryDDISOLIC.AsString        := dtmAtend.QryDadosParticipDDI.AsString;
    qryDDDSOLIC.AsString        := dtmAtend.QryDadosParticipDDD.AsString;
    qryTIPOSOLIC.AsString       := dtmAtend.QryDadosParticipTIPO.AsString;
    qryNUMEROTELSOLIC.AsString  := TrimLeft(TrimRight(dtmAtend.QryDadosParticipNUMTEL.AsString));
    qryCONTATOTEL.AsString      := dtmAtend.QryDadosParticipNOMECONTATO.AsString; // Daniel Simões - 22898
    qryTELSOLICITANTE.AsString  := TrimLeft(TrimRight(dtmAtend.QryDadosParticipNUMTEL.AsString));
    CMDTPHoraChegada.DateTime   := Now;
    CMDTPHoraChegada.Time       := StrToTime('00:00:01');
    qryDTHORACHEGADA.AsDateTime := CMDTPHoraChegada.DateTime;
    qryDATAINICIO.asDateTime    := Now;
    qryIDUSUARIO.AsFloat        := Sistema.IdUsuario;
    qryCodEstadoSOLIC.AsString  := dtmAtend.QryDadosParticipCodEstado.AsString;

    BuscaCpfRg(IdBeneficiario);

    if ( dtmAtend.QryDadosParticipIDESTADO.IsNull ) then
      qryIDESTADO.Clear
    else
      qryIDESTADO.AsInteger := dtmAtend.QryDadosParticipIDESTADO.AsInteger;

    qryIdPessjur.AsFloat      := StrToFloat(IdPessjur);
    qryIdTitular.AsFloat      := StrToFloat(IdTitular);
    qryIdbeneficiario.AsFloat := StrToFloat(IdBeneficiario);

    if ( dtmAtend.QryDadosParticipIDtelefone.IsNull ) then
       qryidTelefone.Clear
    else
       qryidTelefone.AsFloat := dtmAtend.QryDadosParticipIDTELEFONE.AsInteger;

    SelecionarFilhas;

    qryEnderecos.ParamByName('IDPESSOA').AsInteger := StrToInt(IdBeneficiario);
    qryEnderecos.Open;

    AvisaPreenchimentoEndereco;

    qryTelefones.ParamByName('IDPESSOA').AsInteger := qryEnderecos.FieldByName('IDPESSOA').AsInteger;
    qryTelefones.Open;

    qryContaCorrente.Close;
    qryContaCorrente.ParamByName('IDPESSOA').AsInteger := StrToInt(IdBeneficiario);
    qryContaCorrente.Open;

    // Pega forma padrão de atendimento...
    EddlgHoraInicio.Text     := TimeToStr(Time);
    EddlgHora.Text           := TimeToStr(Time);
    DbDateInicio.Text        := DateToStr(Date);
    DbDateFim.Text           := DateToStr(Date);
    qryCodAtendente.AsFloat  := Sistema.IdUsuario;
    qryCIDADESOLIC.AsString  := qryEnderecosCIDADE.AsString;

     //Renato Visoni - Fanuel
    {
    dblkCidade.LookupValue   := qryCIDADESOLIC.AsString;
    dblkCidade.Text          := qryCIDADESOLIC.AsString;
    dblkEstado.LookupValue   := qryCidadesUF.AsString;
    dblkEstado.Text          := qryCidadesUF.AsString;
    }

    dblkCidade.LookupValue   := qryEnderecosIDCIDADES.AsString;
    //BRUNO AZEVEDO SOL 149870 KINTANA 1081729
    dblkCidade.Text          := qryCIDADESOLIC.AsString;
    dblkEstado.LookupValue   := qryEnderecosCODESTADO.AsString;

    //Renato Visoni - Fanuel
    
    if (qry.FieldByName('TIPOSOLIC').AsString<>'') then begin

      for iLoopTel := 1 to length(qry.FieldByName('TIPOSOLIC').AsString) do begin
        if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'C' then
           chkTipoTelefone.Checked[0] := True
      end;

      for iLoopTel := 1 to length(qry.FieldByName('TIPOSOLIC').AsString) do begin
        if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'P' then
           chkTipoTelefone.Checked[1] := True
      end;

      for iLoopTel := 1 to length(qry.FieldByName('TIPOSOLIC').AsString) do begin
        if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'F' then
           chkTipoTelefone.Checked[2] := True
      end;

      for iLoopTel := 1 to length(qry.FieldByName('TIPOSOLIC').AsString) do begin
        if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'L' then
           chkTipoTelefone.Checked[3] := True
      end;

      for iLoopTel := 1 to length(qry.FieldByName('TIPOSOLIC').asString) do begin
        if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'R' then
           chkTipoTelefone.Checked[4] := True
      end;

    end;

    dtmAtend.QryDadosParticip.Close;
  end;

  // Daniel - 27845
  sbtnInsereDetalhe.Enabled := (IdTitular <> '') and (HabilitaInclusao);
  sbtnAlteraDetalhe.Enabled := (IdTitular <> '') and (HabilitaEdicao);
  sbtnExcluiDetalhe.Enabled := (IdTitular <> '') and (HabilitaExclusao);
  // Fim.
  //Henrique Massão
  with qryalimentada do begin
   close;
   ParamByName('IDTITULAR').asString := dtmConsPart1.cds.FieldByName('IDTITULAR').AsString;
   //ParamByName('idresponsavel').asString := dtmConsPart1.cds.FieldByName('IDRESPONSAVEL').AsString;
   open;
  end;

end;

procedure TfrmAtend.MostraConsultaAtendimento;
var sInconSis, sSQL : String;
    Resultado       : Integer;
begin
  try
    Resultado := mrCancel;

    {Operação recebe OpInserir aqui para carregar os dados pessoais da pessoa que
     foi selecionada...}
    CmeCadastro.Operacao := OpInserir;
    CmeCadastro.AtualizaBotoes(Self);

    if not (ConsPart2.ExisteForm('FRMCONSPESSOAGERAL') and (StrToIntDef(ConsPart2.FsIdPessoa,0)=0)) then begin
      frmConsPessoaGeral         := TfrmConsPessoaGeral.Create(Self);
      frmConsPessoaGeral.Caption := 'Seleciona Participante / Dependente';

      if not (frmConsPessoaGeral.Visible) then
        frmConsPessoaGeral.ShowModal;

      iIdTitular := StrToIntDef(FConsPessoaGeral.cIdTitular,-1);
      iRetornou  := StrToIntDef(FConsPessoaGeral.cIdTitular,-1); //SOL124254 - Ádler Souza

      //Otacilio Aquino SOL 161927  KINTANA 1375111
      sIdPlano   := FConsPessoaGeral.cIdPlanoPrev;
      //sPlanoPrev := FConsPessoaGeral.cPlano;

      Resultado  := frmConsPessoaGeral.ModalResult;

      frmConsPessoaGeral.Close;
      frmConsPessoaGeral.Free;
    end else begin
      try
        FConsPessoaGeral.cIdPessoa  := ConsPart2.FsIdpessoa;
        FConsPessoaGeral.cIdTitular := ConsPart2.FsIdtitular;
      except end;

      iIdTitular := StrToIntDef(ConsPart2.FsIdTitular,-1);
      iRetornou  := StrToIntDef(FConsPessoaGeral.cIdTitular,-1); //SOL124254 - Ádler Souza

      //Otacilio Aquino SOL 161927  KINTANA 1375111
      sIdPlano   := FConsPessoaGeral.cIdPlanoPrev;
      //sPlanoPrev := FConsPessoaGeral.cPlano;

      if (ConsPart2.ExisteForm('FRMCONSPESSOAGERAL') and (FConsPessoaGeral.cIdpessoa='0')) then
        Exit;

      Visible := False;
    end;

    // Daniel - 23988
    if (FConsPessoaGeral.cIdPessoa<>'') then
         CmeCadastroInsert(Self)
    else begin
     bbtnCancelarClick(Self);
    // Fim.
    iRetornou := -1; //SOL124254 - Ádler Souza
    end;
  finally
    ConsPart2.FsIdPessoa  := '';
    ConsPart2.FsIdTitular := '';
    iIdTitular            := -1;
  end;
end;
// Daniel Simões - 21551 - 12/09/2006 - Fim ------------------------------------

// Daniel Simões - 21663 - Início ----------------------------------------------
procedure TfrmAtend.btnContatoOkClick(Sender: TObject);
var sIdContato : String;
begin
  inherited;

  if (dbedContatoNome.Text='') and (FlgExcluir=0) then begin
    MsgDlg('Favor informar o nome do contato!','Atenção',mtWarning,[mbOk],0);
    if (dbedContatoNome.CanFocus) then
      dbedContatoNome.SetFocus;
    Exit;
  end;

  if (dbedContatoEmail.Text='') and (FlgExcluir=0) then begin
    MsgDlg('Favor informar o e-mail do contato!','Atenção',mtWarning,[mbOk],0);
    if (dbedContatoEmail.CanFocus) then
      dbedContatoEmail.SetFocus;
    Exit;
  end;

  if (dbedDataNascimento.Text='') and (FlgExcluir=0) then begin
    MsgDlg('Favor informar a data de nascimento do contato!','Atenção',mtWarning,[mbOk],0);
    if (dbedDataNascimento.CanFocus) then
      dbedDataNascimento.SetFocus;
    Exit;
  end;

  if (dbedCargo.Text='') and (FlgExcluir=0) then begin
    MsgDlg('Favor informar o cargo do contato!','Atenção',mtWarning,[mbOk],0);
    if (dbedCargo.CanFocus) then
      dbedCargo.SetFocus;
    Exit;
  end;

  if (dbedSetor.Text='') and (FlgExcluir=0) then begin
    MsgDlg('Favor informar o setor do contato!','Atenção',mtWarning,[mbOk],0);
    if (dbedSetor.CanFocus) then
      dbedSetor.SetFocus;
    Exit;
  end;

  if (qryContato.State=dsInsert) then begin
    sIdContato                                            := IntToStr(LeUltRegistro(Nil,'CONTATOPESS'));
    qryInsereContato.ParamByName('IDCONTATO').AsFloat     := StrToFloat(sIdContato);
    qryInsereContato.ParamByName('IDENDERECO').AsFloat    := qryEnderecosIDENDERECO.AsFloat;
    qryInsereContato.ParamByName('NOME').AsString         := dbedContatoNome.Text;
    qryInsereContato.ParamByName('EMAIL').AsString        := dbedContatoEmail.Text;
    qryInsereContato.ParamByName('NASCIMENTO').AsDateTime := StrToDate(dbedDataNascimento.Text);
    qryInsereContato.ParamByName('CARGO').AsString        := dbedCargo.Text;
    qryInsereContato.ParamByName('SETOR').AsString        := dbedSetor.Text;
    qryInsereContato.ParamByName('OBS').AsString          := dbMemoObs.Text;
    qryInsereContato.ExecSQL;
  end;

  if (qryRamal.State=dsInsert) then begin
    if (qryContato.State=dsInsert) then
         qryInsereRamal.ParamByName('IDCONTATO').AsFloat := StrToFloat(sIdContato)
    else qryInsereRamal.ParamByName('IDCONTATO').AsFloat := qryContatoIDCONTATO.AsFloat;

    qryInsereRamal.ParamByName('IDTELCONTATO').AsFloat := LeUltRegistro(Nil,'TELCONTATO');
    qryInsereRamal.ParamByName('IDTELEFONE').AsFloat   := qryTelefonesIDTELEFONE.AsFloat;
    qryInsereRamal.ParamByName('RAMAL').AsString       := qryRamalRAMAL.AsString;
    qryInsereRamal.ExecSQL;
  end;

  if (qryContato.State=dsEdit) and (FlgExcluir=0) then begin
    qryAlteraContato.ParamByName('IDCONTATO').AsFloat     := qryContatoIDCONTATO.AsFloat;
    qryAlteraContato.ParamByName('IDENDERECO').AsFloat    := qryContatoIDENDERECO.AsFloat;
    qryAlteraContato.ParamByName('NOME').AsString         := dbedContatoNome.Text;
    qryAlteraContato.ParamByName('EMAIL').AsString        := dbedContatoEmail.Text;
    qryAlteraContato.ParamByName('NASCIMENTO').AsDateTime := StrToDate(dbedDataNascimento.Text);
    qryAlteraContato.ParamByName('CARGO').AsString        := dbedCargo.Text;
    qryAlteraContato.ParamByName('SETOR').AsString        := dbedSetor.Text;
    qryAlteraContato.ParamByName('OBS').AsString          := dbMemoObs.Text;
    qryAlteraContato.ExecSQL;
  end;

  if (qryRamal.State=dsEdit) and (FlgExcluir=0) then begin
    qryAlteraRamal.ParamByName('IDTELCONTATO').AsFloat := qryRamalIDTELCONTATO.AsFloat;
    qryAlteraRamal.ParamByName('IDTELEFONE').AsFloat   := qryTelefonesIDTELEFONE.AsFloat;
    qryAlteraRamal.ParamByName('RAMAL').AsString       := qryRamalRAMAL.AsString;
    qryAlteraRamal.ExecSQL;
  end;

  if (FlgExcluir=1) then begin
    if (qryRamal.RecordCount>0) then begin
      qryRamal.DisableControls;
      qryRamal.First;

      while not qryRamal.Eof do begin
        qryExcluiRamal.ParamByName('IDTELCONTATO').AsFloat := qryRamalIDTELCONTATO.AsFloat;
        qryRamal.Next;
      end;

      qryExcluiRamal.ExecSQL;
      qryRamal.EnableControls;
    end;

    qryExcluiContato.ParamByName('IDCONTATO').AsFloat := qryContatoIDCONTATO.AsFloat;
    qryExcluiContato.ExecSQL;
  end;

  Fiario.IdPessoa     := StrToInt(IdBeneficiario);
  Fiario.IdTitular    := StrToInt(IdTitular);
  Fiario.Idusuario    := Sistema.IdUsuario;
  Fiario.Idmodulo     := 19;
  Fiario.Idrubs       := 0;
  Fiario.DataInclusao := Date;

  qryGrupo.Open;

  if (qryContato.State=dsInsert) then begin
    if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELINC.AsInteger<>0) and not (qryGrupoIDFIARIOTELINC.IsNull) then
    begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOTELINC.AsInteger;
      Fiario.Descricao := 'Inclusão do Contato';
      Fiario.Inserir;
    end;
  end;

  if (qryContato.State=dsEdit) and (FlgExcluir=0) then begin
    if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELALT.AsInteger<>0) and not (qryGrupoIDFIARIOTELALT.IsNull) then
    begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOTELALT.AsInteger;
      Fiario.Descricao := 'Alteração do Contato';
      Fiario.Inserir;
    end;
  end;

  if (FlgExcluir=1) then begin
    if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELEXC.AsInteger<>0) and not (qryGrupoIDFIARIOTELEXC.IsNull) then
    begin
      Fiario.IdGrupo   := qryGrupoIDFIARIOTELEXC.AsInteger;
      Fiario.Descricao := 'Exclusão do Telefone';
      Fiario.Inserir;
    end;
  end;

  if qryContato.Active then
    qryContato.Close;
    qryContato.ParamByName('PIDPESSOA').AsInteger := qryEnderecos.FieldByName('IDPESSOA').AsInteger;
    qryContato.Open;

    qryRamal.Close;
    qryRamal.ParamByName('PIDCONTATO').AsFloat := qryContato.FieldByName('IDCONTATO').AsFloat;
    qryRamal.Open;

  FlgExcluir := 0;
  pnlContatos.SendToBack;
end;

procedure TfrmAtend.btnContatoCancelClick(Sender: TObject);
begin
  inherited;

  qryContato.Cancel;
  qryRamal.Cancel;
  pnlContatos.SendToBack;
end;

procedure TfrmAtend.btnContatoVoltarClick(Sender: TObject);
begin
  inherited;

  pnlContatos.SendToBack;
end;

procedure TfrmAtend.tbsContatosShow(Sender: TObject);
begin
  inherited;

  pnlContatos.SendToBack;

  qryContato.Close;
  qryContato.ParamByName('PIDPESSOA').AsInteger := -1;
  qryContato.Open;

  qryRamal.Close;
  qryRamal.ParamByName('PIDCONTATO').AsInteger := -1;
  qryRamal.Open;

  if (IdBeneficiario<>'') then begin
    if qryContato.Active then begin
      qryContato.Close;
      qryContato.ParamByName('PIDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
      qryContato.Open;

      qryRamal.Close;
      qryRamal.ParamByName('PIDCONTATO').AsFloat := qryContatoIDCONTATO.AsFloat;
      qryRamal.Open;

// Daniel - 27845 - Início -----------------------------------------------------
      if (qryContato.RecordCount>0) then begin
        sbtnInsereDetalhe.Enabled := True;
        sbtnAlteraDetalhe.Enabled := True;
        sbtnExcluiDetalhe.Enabled := True;
      end else begin
        sbtnInsereDetalhe.Enabled := True;
        sbtnAlteraDetalhe.Enabled := False;
        sbtnExcluiDetalhe.Enabled := False;
      end;
// Daniel - 27845 - Fim --------------------------------------------------------
    end;
  end;
end;

procedure TfrmAtend.dbgContatoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  qryRamal.Close;
  qryRamal.ParamByName('PIDCONTATO').AsFloat := qryContatoIDCONTATO.AsFloat;
  qryRamal.Open;
end;
// Daniel Simões - 21663 - Fim -------------------------------------------------

procedure TfrmAtend.dbnInsereRamalBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;

  if (Button=nbDelete) then begin
    qryExcluiRamal.ParamByName('IDTELCONTATO').AsFloat := qryRamalIDTELCONTATO.AsFloat;
    qryExcluiRamal.ExecSQL;
  end;

end;

procedure TfrmAtend.SetiContratoEmptmo(const Value: Extended);
begin
   FiContratoEmptmo := Value;
end;



procedure TfrmAtend.HabilitaMenuEmprestimo(const iEvento: Integer);
var
   iContador : Integer;
begin
   for iContador := 0 to PpMenuEmptimo.Items.Count-1 do
   begin
      PpMenuEmptimo.Items.Items[iContador].Enabled := False;

      if PpMenuEmptimo.Items.Items[iContador].Tag = iEvento then
         PpMenuEmptimo.Items.Items[iContador].Enabled := True;
   end;
end;



function TfrmAtend.GravaDadosAssuntoXEP: Boolean;
begin
   if IntegraModulo.iEvento <> -1 then
   begin
      qryAssuntoXAtend.DisableControls;
      qryAssuntoXAtend.First;
      while not qryAssuntoXAtend.eof do
      begin
         if (IntegraModulo.iAssunto = QryAssuntoxAtendIDASSUNTOXATEND.AsFloat) and
            (QryAssuntoxAtendFLGCHAMAEMPRESTIM.AsInteger = IntegraModulo.iEvento) and
            (QryAssuntoxAtendIDCONTRATOEMPTMO.IsNull) and
            (IntegraModulo.iContratoEmptmo <> -1) then
         begin
            qryAssuntoXAtend.Edit;
            QryAssuntoxAtendIDCONTRATOEMPTMO.AsFloat := IntegraModulo.iContratoEmptmo;
            QryAssuntoxAtendVLRSOLICITADO.AsCurrency := IntegraModulo.fValorSolic;
            QryAssuntoxAtendNUMPARCELAS.AsInteger    := IntegraModulo.iNumParcelas;
            qryAssuntoXAtend.Post;
         end;
         qryAssuntoXAtend.Next;
      end;
      qryAssuntoXAtend.First;
      qryAssuntoXAtend.EnableControls;
   end;
   Result := True;

   IntegraModulo.iEvento         := -1;
   IntegraModulo.iContratoEmptmo := -1;
   IntegraModulo.fValorSolic     := 0;
   IntegraModulo.iNumParcelas    := 0;
end;



procedure TfrmAtend.FormActivate(Sender: TObject);
begin
   inherited;
   GravaDadosAssuntoXEP;
end;



procedure TfrmAtend.sbtnProcurarClick(Sender: TObject);
begin
  inherited;

  HabilitaMenuEmprestimo(-1);
  IntegraModulo.iEvento         := -1;
  IntegraModulo.iContratoEmptmo := -1;
  IntegraModulo.fValorSolic     := 0;
  IntegraModulo.iNumParcelas    := 0;
 //qryalimentada.open; //SOL124254 - Ádler Souza
end;



procedure TfrmAtend.QryAssuntoxAtendAfterScroll(DataSet: TDataSet);
var iEvento : Integer;
begin
  inherited;

  iEvento := -1;

  if not QryAssuntoxAtendFLGCHAMAEMPRESTIM.IsNull then begin
    iEvento                := QryAssuntoxAtendFLGCHAMAEMPRESTIM.AsInteger;
    IntegraModulo.iAssunto := QryAssuntoxAtendIDASSUNTOXATEND.AsFloat;
  end;

  HabilitaBotaoEmprestimo(iEvento);
end;



procedure TfrmAtend.HabilitaBotaoEmprestimo(const iEvento: Integer);
var
   iContador : Integer;
begin
   btnEmprestimo.Caption := ' Empréstimo';
   btnEmprestimo.Enabled := False;
   btnEmprestimo.Tag     := iEvento;
   btnEmprestimo.Down    := False;

   case iEvento of
      0 : btnEmprestimo.Caption := ' Inscrição / Contratação de Empréstimo';
      1 : btnEmprestimo.Caption := ' Consulta de Contrato de Empréstimo';
      2 : btnEmprestimo.Caption := ' Quitação de Empréstimo';
      3 : btnEmprestimo.Caption := ' Cancela Quitação de Empréstimo';
      4 : btnEmprestimo.Caption := ' Amortização de Empréstimo';
      5 : btnEmprestimo.Caption := ' Cancela Amortização de Empréstimo';
      6 : btnEmprestimo.Caption := ' Trata Parcelas de Empréstimo';
      7 : btnEmprestimo.Caption := ' Assinatura de Contrato Padrão';
      8 : btnEmprestimo.Caption := ' Lançamento e Histórico de Suspensão de Cobrança';
   end;

   if (btnEmprestimo.Tag >= 0) and (QryAssuntoxAtendIDCONTRATOEMPTMO.IsNull) then
      btnEmprestimo.Enabled := True;
end;


procedure TfrmAtend.btnEmprestimoClick(Sender: TObject);
begin
   inherited;
   case btnEmprestimo.Tag of
      0 : InscricaoContratoClick(Self);
      1 : ConsultaContrato1Click(Self);
      2 : qutacaoAntecipadaClick(Self);
      3 : CancelamentodeQuitacaoClick(Self);
      4 : AmortizacaoClick(Self);
      5 : CancelamentodeAmortizacaoClick(Self);
      6 : TratIndivParcelas1Click(Self);
      7 : mnuAssinaturaContratoClick(Self);
      8 : mnuHistoricoSuspensaoClick(Self);
   end;
end;

// Gustavo Mendes - 26645 - Inicio ---------------------------------------------
procedure TfrmAtend.AbrirQueryAssunto;
begin
  qryGrupoAssunto.Close;
  qryGrupoAssunto.Sql.Clear;
  qryGrupoAssunto.Sql.Add('SELECT GRUPOASSUNTO.DESCGRUPOASSUNTO, GRUPOASSUNTO.IDGRUPOASSUNTO '+
                      'FROM GRUPOASSUNTO ORDER BY  GRUPOASSUNTO.DESCGRUPOASSUNTO');

  qryGrupoAssunto.Open;

  qryassunto.Close;
  qryAssunto.Sql.Clear;
  qryAssunto.Sql.Add('SELECT  A.NOME,  P.NOME AS NOMEPLANOPREV, A.IDASSUNTO, A.IDTIPOPROCESSO, A.IDCONFIGRUBS,' +
                     '        A.IDGRUPOASSUNTO, A.FLGCHAMAEMPRESTIM , C.DESCRUB, A.IDPLANOPREV '+
                    'FROM  ASSUNTO A , PLANPREV P, CONFIGRUBS C '+
                    'WHERE ' );
  if (CkbFiltraPlano.Checked) and (trim(IDPLANOPREV) <> '') then
     qryAssunto.Sql.Add( '( A.IDPLANOPREV = '+  trim(IDPLANOPREV)  +') AND ');
  if (dblkGrupoAssunto.LookUpValue <> '') and (DblkGrupoAssunto.LookUpValue <> '' )then
     qryAssunto.Sql.Add( '( A.IDGRUPOASSUNTO = '+ DblkGrupoAssunto.LookUpValue +') AND ' );

     qryAssunto.Sql.Add( '( A.IDPLANOPREV  = P.IDPLANOPREV(+))  AND '+
                         '( A.IDCONFIGRUBS = C.IDCONFIGRUBS(+)) '+
                         'ORDER BY A.NOME');
  qryAssunto.Open;
end;
// Gustavo Mendes - 26645 - Fim ------------------------------------------------

// Daniel - 27845 - Início -----------------------------------------------------
procedure TfrmAtend.sbtnInsereDetalheClick(Sender: TObject);
begin
  //inherited;

  Flagcheckinsere := True; //Petri Nocentini SOL 251827 PPM 764141
  btnOk.Enabled       := True;
  btnCancelar.Enabled := True;
  btnVoltar.Enabled   := True;

  sFlgStatusQuery     := 'I';

  // Se estiver na aba 'Endereço' ...
  if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) then begin
    pnlEndereco.Enabled          := True;
    GroupBox1.Enabled            := True;
    dbEnderecos.SendToBack;
    FlgExcluir                   := 0;
    dblkCidade1.Text             := '';
    qryEnderecos.Insert;
    flgExcluir                   := 0;
    chkbxComercial.State         := cbUnchecked;
    chkbxResidencial.State       := cbUnchecked;
    chkbxEntrega.State           := cbUnchecked;
    chkbxCobranca.State          := cbUnchecked;
    chkbxCorrespondencia.State   := cbUnchecked;
    chkbxComercial.Checked       := False;
    chkbxResidencial.Checked     := False;
    chkbxEntrega.Checked         := False;
    chkbxCobranca.Checked        := False;
    chkbxCorrespondencia.Checked := False;
  end;

  // Se estiver na aba 'Telefones' ...
  if (pgCtrlDadosParticip.ActivePage=tbsTelefones) then begin
    inherited;

    qryEnderecos.Close;
    qryEnderecos.ParamByName('IDPESSOA').AsInteger := -1;
    qryEnderecos.Open;

    DbgTelefones.SendToBack;

    qryEnderecos.Close;
    qryEnderecos.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
    qryEnderecos.Open;

    qryTelefones.Insert;

    chkTelComercial.Checked  := False;
    chkTelParticular.Checked := False;
    chkTelFax.Checked        := False;
    chkTelCelular.Checked    := False;
    chkTelRecado.Checked     := False;
  end;

  // Se estiver na aba 'Contatos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContatos) then begin
    inherited;

    qryEnderecos.Close;
    qryEnderecos.ParamByName('IDPESSOA').AsInteger := StrToInt(IdBeneficiario);
    qryEnderecos.Open;

    qryTelefones.Close;
    qryTelefones.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
    qryTelefones.Open;

    qryContato.Insert;
    pnlContatos.BringToFront;
    dbedContatoNome.SetFocus;
  end;

  // Se estiver na aba 'Conta Corrente' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContaCorrente) then begin
    inherited;

    FlgExcluir              := 0;
    dblkPCmbBanco.Enabled   := True;
    dblkpCmbAgencia.Enabled := True;

    dbgContasCorrente.SendToBack;

    rgrpTipoConta.ItemIndex  := -1;
    dbgrpContaPref.ItemIndex := -1;
    dbgrpContaConj.ItemIndex := -1;

    qryContaCorrente.Insert;
  end;

  // Se estiver na aba 'Documentos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsDocumentos) then begin
    inherited;

    qryDocumentos.Insert;
    pnlDocumentos.BringToFront;

    if DblkTipoDocPessoa.CanFocus then DblkTipoDocPessoa.SetFocus;
  end;

  sbtnInsereDetalhe.Enabled := False;
  sbtnAlteraDetalhe.Enabled := False;
  sbtnExcluiDetalhe.Enabled := False;
end;

procedure TfrmAtend.sbtnAlteraDetalheClick(Sender: TObject);
var iLoopTel : Integer;
begin
  btnOk.Enabled       := True;
  btnCancelar.Enabled := True;
  btnVoltar.Enabled   := True;

  sFlgStatusQuery     := 'E';

  // Se estiver na aba 'Endereço' ...
  if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) then begin
    inherited;

    PnlEndereco.Enabled := True;

    qryCidades.Locate('IDCIDADES',QryEnderecosIDCIDADES.AsInteger,[loCaseInsensitive,loPartialKey]);
    dblkCidade1.LookupValue := IntToStr(qryCidades.FieldByName('IDCIDADES').AsInteger);
    dblkCidade1.Text        := qryCidades.FieldByName('NOME').AsString;

    qryEnderecos.Edit;
    qryEnderecosCIDADE.AsString := dblkCidade1.Text;

    FlgExcluir        := 0;
    GroupBox1.Enabled := True;
    DbEnderecos.SendToBack;
    qryEnderecos.Edit;

    chkbxComercial.State         := cbUnchecked;
    chkbxResidencial.State       := cbUnchecked;
    chkbxEntrega.State           := cbUnchecked;
    chkbxCobranca.State          := cbUnchecked;
    chkbxCorrespondencia.State   := cbUnchecked;
    chkbxComercial.Checked       := False;
    chkbxResidencial.Checked     := False;
    chkbxEntrega.Checked         := False;
    chkbxCobranca.Checked        := False;
    chkbxCorrespondencia.Checked := False;

    with qryPessoa do begin
      if Active       then Close;
      if not Prepared then Prepare;
      ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
      Open;
    end;

    if (qryPessoaIdEndCorresp.AsFloat=qryEnderecosIDENDERECO.AsFloat)      then chkbxCorrespondencia.Checked := True;
    if (qryPessoaIdEndComercial.AsFloat=qryEnderecosIDENDERECO.AsFloat)    then chkbxComercial.Checked       := True;
    if (qryPessoaIdEndEntrega.AsFloat=qryEnderecosIDENDERECO.AsFloat)      then chkbxEntrega.Checked         := True;
    if (qryPessoaIdEndResidencial.AsFloat=qryEnderecosIDENDERECO.AsFloat ) then chkbxResidencial.Checked     := True;
    if (qryPessoaIdEndCobranca.AsFloat=qryEnderecosIDENDERECO.AsFloat )    then chkbxCobranca.Checked        := True;
  end;

  // Se estiver na aba 'Telefones' ...
  if (pgCtrlDadosParticip.ActivePage=tbsTelefones) then begin
    inherited;

    chkTelComercial.Checked  := False;
    chkTelParticular.Checked := False;
    chkTelFax.Checked        := False;
    chkTelCelular.Checked    := False;
    chkTelRecado.Checked     := False;

    if (qryTelefones.FieldByName('TIPO').AsString<>'') then begin
      for iLoopTel:=1 to Length(qryTelefones.FieldByName('TIPO').AsString) do
        if (qryTelefones.FieldByName('TIPO').AsString[iLoopTel]='C') then chkTelComercial.Checked := True;

      for iLoopTel:=1 to Length(qryTelefones.FieldByName('TIPO').AsString) do
        if (qryTelefones.FieldByName('TIPO').AsString[iLoopTel]='P') then chkTelParticular.Checked := True;

      for iLoopTel:=1 to Length(qryTelefones.FieldByName('TIPO').AsString) do
        if (qryTelefones.FieldByName('TIPO').AsString[iLoopTel]='F') then chkTelFax.Checked := True;

      for iLoopTel:=1 to length(qryTelefones.FieldByName('TIPO').AsString) do
        if (qryTelefones.FieldByName('TIPO').AsString[iLoopTel]='L') then chkTelCelular.Checked := True;

      for iLoopTel:=1 to Length(qryTelefones.FieldByName('TIPO').AsString) do
        if (qryTelefones.FieldByName('TIPO').AsString[iLoopTel]='R') then chkTelRecado.Checked := True;
    end;

    dbgTelefones.SendToBack;
    qryTelefones.Edit;
  end;

  // Se estiver na aba 'Contatos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContatos) then begin
    inherited;

    pnlContatos.BringToFront;
    qryContato.Edit;
  end;

  // Se estiver na aba 'Conta Corrente' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContaCorrente) then begin
    inherited;

    if qryAgencia1.Active then
      qryAgencia1.Close;
      qryAgencia1.ParamByName('IDPESSOA').AsFloat := qryContaCorrente.FieldByName('IDAGENCIA').AsFloat;
      qryAgencia1.Open;

      dblkPcmbAgencia.Text := QryAgencia1Nome.AsString;
      FlgExcluir           := 0;

      dbgContasCorrente.SendToBack;
      rgrpTipoConta.ItemIndex  := -1;
      dbgrpContaPref.ItemIndex := -1;
      dbgrpContaConj.ItemIndex := -1;
      qryContaCorrente.Edit;

      if qryContaCorrenteFLGCONTAPREF.AsFloat=0 then
           dbgrpContaPref.ItemIndex := 0
      else dbgrpContaPref.ItemIndex := 1;

      if qryContaCorrenteFLGCONTACONJUNTA.AsString='N' then
           dbgrpContaConj.ItemIndex := 0
      else dbgrpContaConj.ItemIndex := 1;

      if qryContaCorrenteTIPOCONTA.AsString = 'Corrente'      then rgrpTipoConta.ItemIndex := 0;
      if qryContaCorrenteTIPOCONTA.AsString = 'Salário'       then rgrpTipoConta.ItemIndex := 1;
      if qryContaCorrenteTIPOCONTA.AsString = 'Poupança'      then rgrpTipoConta.ItemIndex := 2;
      if qryContaCorrenteTIPOCONTA.AsString = 'Ordem de Pag.' then rgrpTipoConta.ItemIndex := 3;
  end;

  // Se estiver na aba 'Documentos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsDocumentos) then begin
    inherited;
    pnlDocumentos.BringToFront;
  end;

  sbtnInsereDetalhe.Enabled := False;
  sbtnAlteraDetalhe.Enabled := False;
  sbtnExcluiDetalhe.Enabled := False;
end;

procedure TfrmAtend.sbtnExcluiDetalheClick(Sender: TObject);
var iLoopTel : Integer;
begin
  {btnOk.Enabled       := True;
  btnCancelar.Enabled := True;
  btnVoltar.Enabled   := True;}

  // Se estiver na aba 'Endereço' ...
  if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) then begin
    inherited;

    pnlEndereco.Enabled := False;

    qryCidades.Locate('IDCIDADES',QryEnderecosIDCIDADES.AsInteger,[loCaseInsensitive,loPartialKey]);
    dblkCidade1.LookupValue := IntToStr(qryCidades.FieldByName('IDCIDADES').AsInteger);
    dblkCidade1.Text        := qryCidades.FieldByName('NOME').AsString;

    FlgExcluir        := 1;
    GroupBox1.Enabled := False;
    dbEnderecos.SendToBack;
    qryEnderecos.Edit;

    chkbxComercial.State         := cbUnchecked;
    chkbxResidencial.State       := cbUnchecked;
    chkbxEntrega.State           := cbUnchecked;
    chkbxCobranca.State          := cbUnchecked;
    chkbxCorrespondencia.State   := cbUnchecked;
    chkbxComercial.Checked       := False;
    chkbxResidencial.Checked     := False;
    chkbxEntrega.Checked         := False;
    chkbxCobranca.Checked        := False;
    chkbxCorrespondencia.Checked := False;

    with qryPessoa do begin
      if Active       then Close;
      if not Prepared then Prepare;
      ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
      Open;
    end;

    if (qryPessoaIdendCorresp.AsFloat=qryEnderecosIdendereco.AsFloat)     then chkbxCorrespondencia.Checked := True;
    if (qryPessoaIdendComercial.AsFloat=qryEnderecosIdendereco.AsFloat)   then chkbxComercial.Checked       := True;
    if (qryPessoaIdendEntrega.AsFloat=qryEnderecosIdendereco.AsFloat)     then chkbxEntrega.Checked         := True;
    if (qryPessoaIdendResidencial.AsFloat=qryEnderecosIdendereco.AsFloat) then chkbxResidencial.Checked     := True;
    if (qryPessoaIdendCobranca.AsFloat=qryEnderecosIdendereco.AsFloat)    then chkbxCobranca.Checked        := True;

    sbtnAlteraDetalhe.Down := False;
    sbtnExcluiDetalhe.Down := True;
  end;

  // Se estiver na aba 'Telefones' ...
  if (pgCtrlDadosParticip.ActivePage=tbsTelefones) then begin
    inherited;

    chkTelComercial.Checked  := False;
    chkTelParticular.Checked := False;
    chkTelFax.Checked        := False;
    chkTelCelular.Checked    := False;
    chkTelRecado.Checked     := False;

    if (qryTelefones.FieldByName('TIPO').AsString<>'') then begin
      for iLoopTel:=1 to Length(qryTelefones.FieldByName('TIPO').AsString) do
        if (qryTelefones.FieldByName('TIPO').AsString[iLoopTel]='C') then chkTelComercial.Checked := True;

      for iLoopTel:=1 to Length(qryTelefones.FieldByName('TIPO').AsString) do
        if (qryTelefones.FieldByName('TIPO').AsString[iLoopTel]='P') then chkTelParticular.Checked := True;

      for iLoopTel:=1 to Length(qryTelefones.FieldByName('TIPO').AsString) do
        if (qryTelefones.FieldByName('TIPO').AsString[iLoopTel]='F') then chkTelFax.Checked := True;

      for iLoopTel:=1 to Length(qryTelefones.FieldByName('TIPO').AsString) do
        if (qryTelefones.FieldByName('TIPO').AsString[iLoopTel]='L') then chkTelCelular.Checked := True;

      for iLoopTel:=1 to Length(qryTelefones.FieldByName('TIPO').AsString) do
        if (qryTelefones.FieldByName('TIPO').AsString[iLoopTel]='R') then chkTelRecado.Checked := True;
    end;

    FlgExcluir := 1;
    dbgTelefones.SendToBack;
    //qryTelefones.Edit;
  end;

  // Se estiver na aba 'Contatos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContatos) then begin
    inherited;

    FlgExcluir := 1;
    pnlContatos.BringToFront;
  end;

  // Se estiver na aba 'Conta Corrente' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContaCorrente) then begin
    inherited;

    if qryAgencia1.Active then qryAgencia1.Close;

    qryAgencia1.ParamByName('IdPESSOA').AsFloat := qrycontacorrente.FieldByName('IDAgencia').AsFloat;
    qryAgencia1.Open;
    dblkPcmbAgencia.Text := QryAgencia1Nome.AsString;
    FlgExcluir           := 1;

    dbgContasCorrente.SendToBack;

    if rgrpTipoConta.ItemIndex=3 then begin
      dbgrpContaPref.ItemIndex := 0;
      dbgrpContaConj.ItemIndex := 0;
    end else begin
      rgrpTipoConta.ItemIndex  := -1;
      dbgrpContaPref.ItemIndex := -1;
      dbgrpContaConj.ItemIndex := -1;
    end;

    qryContaCorrente.Edit;

    if qryContaCorrenteFLGCONTAPREF.AsFloat=0 then
         dbgrpContaPref.ItemIndex := 0
    else dbgrpContaPref.ItemIndex := 1;

    if qryContaCorrenteFLGCONTACONJUNTA.AsString='N' then
         dbgrpContaConj.ItemIndex := 0
    else dbgrpContaConj.ItemIndex := 1;

    if qryContaCorrenteTIPOCONTA.AsString='1' then rgrpTipoConta.ItemIndex := 0;
    if qryContaCorrenteTIPOCONTA.AsString='2' then rgrpTipoConta.ItemIndex := 1;
    if qryContaCorrenteTIPOCONTA.AsString='3' then rgrpTipoConta.ItemIndex := 2;
    if qryContaCorrenteTIPOCONTA.AsString='4' then rgrpTipoConta.ItemIndex := 3;
  end;

  // Se estiver na aba 'Documentos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsDocumentos) then begin
    inherited;
    deletaDoc := True;
    pnlDocumentos.BringToFront;
  end;

  btnOkClick(Sender); // Daniel - 27846
end;

procedure TfrmAtend.btnOkClick(Sender: TObject);
var idEndereco, idEndereco1        : Double;
    Tipo, sIdContato, FlgContaConj : String;
    TipoConta                      : Integer;

begin
  //inherited;

  // Se estiver na aba 'Endereço' ...
  if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) then begin
    if (EdLogradoro1.Text='') then begin
      PgAtend.ActivePage := TbShtAtend;
      MsgDlg('Favor informar o logradouro do Beneficiario!','Atenção',mtError,[mbOk],0);
      if EdLogradoro1.CanFocus then EdLogradoro1.SetFocus;
      VeriricaAbaDadosParticip;
      Exit;
    end;

    if (EdBairro1.Text='') then begin
      PgAtend.ActivePage := TbShtAtend;
      MsgDlg('Favor informar o bairro do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);
      if EdBairro1.CanFocus then edbairro1.SetFocus;
      VeriricaAbaDadosParticip;
      Exit;
    end;

    if (EdCep1.Text='') then begin
      PgAtend.ActivePage := TbShtAtend;
      MsgDlg('Favor informar o CEP do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);
      if EdCep1.CanFocus then EdCep1.SetFocus;
      VeriricaAbaDadosParticip;
      Exit;
    end;

    if (dblkCidade1.LookupValue='') then begin
      PgAtend.ActivePage := TbShtAtend;
      MsgDlg('Favor informar a Cidade do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);
      if dblkCidade1.CanFocus then dblkCidade1.SetFocus;
      VeriricaAbaDadosParticip;
      Exit;
    end;

    if (dblkEstado1.LookupValue='') or (Length(dblkEstado1.LookupValue)<2) or
       (not qryUF.Locate('CODESTADO',DblkEstado1.LookupValue,[loCaseInsensitive,loPartialKey])) then
    begin
      PgAtend.ActivePage := TbShtAtend;
      MsgDlg('Favor informar o Estado do endereço do solicitante!','Atenção',mtError,[mbOk],0);
      if dblkEstado1.CanFocus then dblkEstado1.SetFocus;
      VeriricaAbaDadosParticip;
      Exit;
    end;

    with QryESTADO1 do begin
      if Active       then Close;
      if not Prepared then Prepare;
      ParamByName('CODESTADO1').AsString := dblkEstado1.LookupValue;
      Open;
    end;

    if (qryEnderecos.State=dsEdit) then
      if MsgDlg( 'Deseja alterar as informações do atendimento referentes ao endereço '+#13+#10+
                 'do solicitante com base nas alterações deste registro?',
                 'Atenção',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
        qry.FieldByName('CEPSOLIC').AsString := qryEnderecos.FieldByName('CEP').AsString;

        // David - 21629
        dblkEstado.LookupValue := dblkEstado1.LookupValue;
        dblkEstado.Text        := dblkEstado1.Text;
        dblkCidade.LookupValue := dblkCidade1.Text;
        dblkCidade.Text        := dblkCidade1.Text;

        qry.FieldByName('LOGRADOURO').AsString   := qryEnderecos.FieldByName('LOGRADOURO').AsString;
        qry.FieldByName('NUMEROSOLIC').AsString  := qryEnderecos.FieldByName('NUMERO').AsString;
        qry.FieldByName('COMPLEMSOLIC').AsString := qryEnderecos.FieldByName('COMPLEMENTO').AsString;
        qry.FieldByName('BAIRROSOLIC').AsString  := qryEnderecos.FieldByName('BAIRRO').AsString;
      end;

    if (qryEnderecos.State=dsInsert) then begin
      IdEndereco                                        := LeultRegistro(NIL,'ENDPESS');
      IdEndereco1                                       := IdEndereco;
      qryINSENDERECO.ParamByName('IDENDERECO').AsFloat  := IdEndereco;
      qryINSENDERECO.ParamByName('IDPESSOA').AsFloat    := StrToFloat(idBeneficiario);
      qryINSENDERECO.ParamByName('IDCIDADES').AsFloat   := qryCidadesIdCidades.AsFloat;
      qryINSENDERECO.ParamByName('IDPAIS').AsFloat      := 1;
      qryINSENDERECO.ParamByName('LOGRADOURO').AsString :=  EdLogradoro1.Text;
      qryINSENDERECO.ParamByName('NUMERO').AsString     :=  EdNumero1.Text;

      if (Length(EdComplemento1.Text)>20) then
           qryINSENDERECO.ParamByName('COMPLEMENTO').AsString := Copy(EdComplemento1.Text,1,20)
      else qryINSENDERECO.ParamByName('COMPLEMENTO').AsString := EdComplemento1.Text;

      qryINSENDERECO.ParamByName('BAIRRO').AsString    := EdBairro1.Text;
      qryINSENDERECO.ParamByName('CODESTADO').AsString := dblkEstado1.Text;

      if (Length(dblkCidade1.Text)>20) then
           qryINSENDERECO.ParamByName('CIDADE').AsString := Copy(dblkcidade1.Text,1,20)
      else qryINSENDERECO.ParamByName('CIDADE').AsString := dblkCidade1.Text;

      qryINSENDERECO.ParamByName('CEP').AsString  := EdCep1.Text;
      qryINSENDERECO.ParamByName('NOME').AsString := DbEdLocal.Text;
      qryinsENDERECO.ExecSql
    end;

    if ((qryEnderecos.State=dsEdit) and (FlgExcluir=0)) then begin
      qryALTENDERECO.ParamByName('IDENDERECO').AsFloat  := qryEnderecosIdendereco.AsFloat;
      IdEndereco1                                       := qryEnderecosIdendereco.AsFloat;
      qryALTENDERECO.ParamByName('IDPESSOA').AsFloat    := StrToFloat(IdBeneficiario);
      qryALTENDERECO.ParamByName('IDCIDADES').AsFloat   := qryCidadesIDCIDADES.AsFloat;
      qryALTENDERECO.ParamByName('IDPAIS').AsFloat      := 1;
      qryALTENDERECO.ParamByName('LOGRADOURO').AsString := EdLogradoro1.Text;
      qryALTENDERECO.ParamByName('NUMERO').AsString     := EdNumero1.Text;

      if (Length(EdComplemento1.Text)>20) then
           qryALTENDERECO.ParamByName('COMPLEMENTO').AsString := Copy(EdComplemento1.Text,1,20)
      else qryALTENDERECO.ParamByName('COMPLEMENTO').AsString := EdComplemento1.Text;

      qryALTENDERECO.ParamByName('BAIRRO').AsString    := EdBairro1.Text;
      qryALTENDERECO.ParamByName('CODESTADO').AsString := dblkEstado1.Text;

      if (Length(dblkCidade1.Text)>20) then
           qryALTENDERECO.ParamByName('CIDADE').AsString := Copy(dblkCidade1.Text,1,20)
      else qryALTENDERECO.ParamByName('CIDADE').AsString := dblkCidade1.Text;

      qryALTENDERECO.ParamByName('CEP').AsString  := EdCep1.Text;
      qryALTENDERECO.ParamByName('NOME').AsString := DbEdLocal.Text;
      qryaltENDERECO.ExecSql;
    end;

    if (FlgExcluir=1) then begin
      if Application.MessageBox('Ao excluir o endereço, será excluído também os telefones deste. '+
                                'Exclui o endereço e seus telefoens?','Atendimento',Mb_YesNo+Mb_IConQuestion)=Id_Yes then
      begin
        // Exclui telefone do endereco pessoal por causa da constraint...
        qryExecTelEndPess.ParamByName('IDENDERECO').AsFloat := qryEnderecosIDENDERECO.AsFloat;
        qryExecTelEndPess.ExecSQL;

        // Exclui telefone de contato do endereco por causa da constraint...
        qryExecTelContato.ParamByName('IDTELEFONE').AsFloat := qryEnderecosIDENDERECO.AsFloat;
        qryExecTelContato.ExecSql ;

        IdEndereco1                                      := qryEnderecosIDENDERECO.AsFloat;
        qryExcEndereco.ParamByName('IDENDERECO').AsFloat := qryEnderecosIDENDERECO.AsFloat;
        qryExcEndereco.ExecSql;
      end;
    end;

    // David - 21629
    //----------------------------------------------------------------------------
    if  ((qryEnderecos.State=dsEdit) and (FlgExcluir=0)) or (qryEnderecos.State=dsInsert) then begin
      if (chkbxComercial.Checked) then begin
        qryComercial.ParamByName('IDPESSOA').AsFloat       := StrToFloat(IdBeneficiario);
        qryComercial.ParamByName('IDENDCOMERCIAL').AsFloat := IdEndereco1;
        qryComercial.ExecSQL;
      end else begin
        if (qryPessoaIdendComercial.AsFloat=IdEndereco1) then begin
          qryComercial.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
          qryComercial.ParamByName('IDENDCOMERCIAL').Clear;
          qryComercial.ExecSQL;
        end;
      end;

      if (chkbxResidencial.Checked) then begin
        qryResidencial.ParamByName('IDPESSOA').AsFloat         := StrToFloat(IdBeneficiario);
        qryResidencial.ParamByName('IDENDRESIDENCIAL').AsFloat := IdEndereco1;
        qryResidencial.ExecSQL;
      end else begin
        if (qryPessoaIdendResidencial.AsFloat=IdEndereco1) then begin
          qryResidencial.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
          qryResidencial.ParamByName('IDENDRESIDENCIAL').Clear;
          qryResidencial.ExecSQL;
        end;
      end;

      if (chkbxEntrega.Checked) then begin
        qryEntrega.ParamByName('IDPESSOA').AsFloat     := StrToFloat(IdBeneficiario);
        qryEntrega.ParamByName('IDENDENTREGA').AsFloat := idEndereco1;
        qryEntrega.ExecSQL;
      end else begin
        if (qryPessoaIDENDENTREGA.AsFloat=IdEndereco1) then begin
          qryEntrega.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
          qryEntrega.ParamByName('IDENDENTREGA').Clear;
          qryEntrega.ExecSQL;
        end;
      end;

      if (chkbxCobranca.Checked) then begin
        qryCobranca.ParamByName('IDPESSOA').AsFloat      := StrToFloat(IdBeneficiario);
        qryCobranca.ParamByName('IDENDCOBRANCA').AsFloat := idEndereco1;
        qryCobranca.ExecSQL;
      end else begin
        if (qryPessoaIDENDCOBRANCA.AsFloat=IdEndereco1) then begin
          qryCobranca.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
          qryCobranca.ParamByName('IDENDCOBRANCA').Clear;
          qryCobranca.ExecSQL;
        end;
      end;

      if (chkbxCorrespondencia.Checked) then begin
        qryCorresp.ParamByName('IDPESSOA').AsFloat     := StrToFloat(IdBeneficiario);
        qryCorresp.ParamByName('IDENDCORRESP').AsFloat := idEndereco1;
        qryCorresp.ExecSQL;
      end else begin
        if (qryPessoaIDENDCORRESP.AsFloat=IdEndereco1) then begin
          qryCorresp.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
          qryCorresp.ParamByName('IDENDCORRESP').Clear;
          qryCorresp.ExecSQL;
        end;
      end;
    end else begin
      if (qryPessoaIDENDCOMERCIAL.AsFloat=IdEndereco1) then begin
        qryComercial.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
        qryComercial.ParamByName('IDENDCOMERCIAL').Clear;
        qryComercial.EXECSQL
      end;

      if (qryPessoaIDENDRESIDENCIAL.AsFloat=IdEndereco1) then begin
        qryResidencial.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
        qryResidencial.ParamByName('IDENDRESIDENCIAL').Clear;
        qryResidencial.ExecSQL;
      end;

      if (qryPessoaIDENDENTREGA.AsFloat=IdEndereco1) then begin
        qryEntrega.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
        qryEntrega.ParamByName('IDENDENTREGA').Clear;
        qryEntrega.ExecSQL;
      end;

      if (qryPessoaIDENDCOBRANCA.AsFloat=IdENDERECO1) then begin
        qryCobranca.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
        qryCobranca.ParamByName('IDENDCOBRANCA').Clear;
        qryCobranca.ExecSQL;
      end;

      if (qryPessoaIDENDCORRESP.AsFloat=IdEndereco1) then begin
        qryCorresp.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
        qryCorresp.ParamByName('IDENDCORRESP').CLEAR;
        qryCorresp.ExecSQL;
      end;
    end;
    //----------------------------------------------------------------------------

    Fiario.IdPessoa     := StrToInt(IdBeneficiario);
    Fiario.IdTitular    := StrToInt(IdTitular);
    Fiario.IdUsuario    := Sistema.IdUsuario;
    Fiario.IdModulo     := 19;
    Fiario.IdRubs       := 0;
    Fiario.DataInclusao := Date;

    qryGrupo.Open;
    if (qryEnderecos.State=dsInsert) then begin
      if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOENDINC.AsInteger<>0) and not (qryGrupoIDFIARIOENDINC.IsNull) then
      begin
        Fiario.IdGrupo   := qryGrupoIDFIARIOENDINC.AsInteger;
        Fiario.Descricao := 'Inclusão do Endereço';
        Fiario.Inserir;
      end;
    end;

    if ( (qryEnderecos.State=dsEdit) and (FlgExcluir=0) ) then begin
      if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOENDALT.AsInteger<>0) and not (qryGrupoIDFIARIOENDALT.IsNull) then
      begin
        Fiario.IdGrupo   := qryGrupoIDFIARIOENDALT.AsInteger;
        Fiario.Descricao := 'Alteração do Endereço';
        Fiario.Inserir;
      end;
    end;

    if (FlgExcluir=1) then begin
      if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOENDEXC.AsInteger<>0) and not (qryGrupoIDFIARIOENDEXC.IsNull) then
      begin
        Fiario.IdGrupo   := qryGrupoIDFIARIOENDEXC.AsInteger;
        Fiario.Descricao := 'Exclusão de Endereço';
        Fiario.Inserir;
      end;
    end;

    with QryEnderecos do begin
      if Active       then Close;
      if not Prepared then Prepare;
      ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
      Open;
    end;

    FlgExcluir := 0;
    pnlEnderecos.SendToBack;

    {if (qryEnderecos.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
      VeriricaAbaEndereco;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
      VeriricaAbaEndereco;
    end;   }
    VeriricaAbaDadosParticip;

  end;

  // Se estiver na aba 'Telefones' ...
  if (pgCtrlDadosParticip.ActivePage=tbsTelefones) then begin
    if (dblkLogradouro.LookupValue='') then begin
      MsgDlg('Favor informar a Cidade do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);
      if (dblkLogradouro.CanFocus) then dblkLogradouro.SetFocus;
      Exit;
    end;

    if (edtTelDDD.Text='') then begin
      MsgDlg('Favor informar o Número do DDD!', 'Atenção',mtError,[mbOk],0);
      if (edtTelDDD.CanFocus) then edtTelDDD.SetFocus;
      Exit;
    end;

    if (edtTelNumeroTelefone.Text='') then begin
      MsgDlg('Favor informar o Número do Telefone!','Atenção',mtError,[mbOk],0);
      if edtTelNumeroTelefone.CanFocus then edtTelNumeroTelefone.SetFocus;
      Exit;
    end;

    Tipo := '';
    if (chkTelComercial.Checked=True)  then Tipo := Tipo+'C';
    if (chkTelParticular.Checked=True) then Tipo := Tipo+'P';
    if (chkTelFax.Checked=True)        then Tipo := Tipo+'F';
    if (chkTelCelular.Checked=True)    then Tipo := Tipo+'L';
    if (chkTelRecado.Checked=True)     then Tipo := Tipo+'R';

    if (qryTelefones.State=dsEdit) then
      if MsgDlg('Deseja alterar as informações do atendimento referentes ao telefone'+#13+#10+
                'do solicitante com base nas alterações deste registro?',
                'Atenção',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
        qry.FieldByName('DDISOLIC').AsString       := qryTelefones.FieldByName('DDI').AsString;
        qry.FieldByName('DDDSOLIC').AsString       := qryTelefones.FieldByName('DDD').AsString;
        qry.FieldByName('NUMEROTELSOLIC').AsString := qryTelefones.FieldByName('NUMERO').AsString;
      end;

      if (qryTelefones.State=dsInsert) then begin
        qryInsereTelefone.ParamByName('IDTELEFONE').AsFloat := LeUltRegistro(nil,'TELENDPESS');
        qryInsereTelefone.ParamByName('IDENDERECO').AsFloat := qryEnderecosIDENDERECO.AsFloat;
        qryInsereTelefone.ParamByName('DDI').AsString       := edtTelDDI.Text;
        qryInsereTelefone.ParamByName('DDD').AsString       := edtTelDDD.Text;
        qryInsereTelefone.ParamByName('TIPO').AsString      := Tipo;
        qryInsereTelefone.ParamByName('NUMERO').AsString    := TrimLeft(TrimRight(edtTelNumeroTelefone.Text));
        qryInsereTelefone.ExecSQL;
      end;

      if ( (qryTelefones.State=dsEdit) and (FlgExcluir=0) ) then begin
        qryAlteraTelefone.ParamByName('IDTELEFONE').AsFloat := qryTelefonesidTelefone.AsFloat;
        qryAlteraTelefone.ParamByName('IDENDERECO').AsFloat := qryTelefonesIDENDERECO.AsFloat;
        qryAlteraTelefone.ParamByName('DDI').AsString       := edtTelDDI.Text;
        qryAlteraTelefone.ParamByName('DDD').AsString       := edtTelDDD.Text;
        qryAlteraTelefone.ParamByName('TIPO').AsString      := Tipo;
        qryAlteraTelefone.ParamByName('NUMERO').AsString    := TrimLeft(TrimRight(edtTelNumeroTelefone.Text));
        qryAlteraTelefone.ExecSQL;
      end;

      if ( FlgExcluir=1 ) then begin
        qryExcTelefone.ParamByName('IDTELEFONE').AsFloat := qryTelefonesidTelefone.AsFloat;
        qryExcTelefone.ExecSQL;
      end;

      Fiario.IdPessoa     := StrToInt(IdBeneficiario);
      Fiario.IdTitular    := StrToInt(IdTitular);
      Fiario.IdUsuario    := Sistema.IdUsuario;
      Fiario.IdModulo     := 19;
      Fiario.IdRubs       := 0;
      Fiario.DataInclusao := Date;

      qryGrupo.open;

      if (qryTelefones.State=dsInsert) then begin
        if (qrygrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELINC.AsInteger<>0) and not
           (qryGrupoIDFIARIOTELINC.IsNull) then
        begin
          Fiario.IdGrupo   := qryGrupoIDFIARIOTELINC.AsInteger;
          Fiario.Descricao := 'Inclusão do Telefone';
          Fiario.Inserir;
        end;
      end;

      if (qryTelefones.State=dsEdit) and (FlgExcluir=0) then begin
        if (qrygrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELALT.AsInteger<>0) and not
           (qryGrupoIDFIARIOTELALT.IsNull) then
        begin
          Fiario.IdGrupo   := qryGrupoIDFIARIOTELALT.AsInteger;
          Fiario.Descricao := 'Alteração do Telefone';
          Fiario.Inserir;
        end
      end;

      if (FlgExcluir=1) then begin
        if (qrygrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELEXC.AsInteger<>0) and not
           (qryGrupoIDFIARIOTELEXC.IsNull) then
        begin
          Fiario.IdGrupo   := qryGrupoIDFIARIOTELEXC.AsInteger;
          Fiario.Descricao := 'Exclusão  do Telefone';
          Fiario.Inserir;
        end;
      end;

      if (qryTelefones.Active) then
        qryTelefones.Close;
        qryTelefones.ParamByName('IDPESSOA').AsInteger := qryEnderecos.FieldByName('IDPESSOA').AsInteger;
        qryTelefones.Open;

        FlgExcluir := 0;
        pnlCadTelefones.SendToBack;

        if (qryTelefones.RecordCount>0) then begin
          sbtnInsereDetalhe.Enabled := True;
          sbtnAlteraDetalhe.Enabled := True;
          sbtnExcluiDetalhe.Enabled := True;
        end else begin
          sbtnInsereDetalhe.Enabled := True;
          sbtnAlteraDetalhe.Enabled := False;
          sbtnExcluiDetalhe.Enabled := False;
        end;
  end;

  // Se estiver na aba 'Contatos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContatos) then begin
    inherited;

    if (dbedContatoNome.Text='') and (FlgExcluir=0) then begin
      MsgDlg('Favor informar o nome do contato!','Atenção',mtWarning,[mbOk],0);
      if (dbedContatoNome.CanFocus) then
        dbedContatoNome.SetFocus;
      Exit;
    end;

    if (dbedContatoEmail.Text='') and (FlgExcluir=0) then begin
      MsgDlg('Favor informar o e-mail do contato!','Atenção',mtWarning,[mbOk],0);
      if (dbedContatoEmail.CanFocus) then
        dbedContatoEmail.SetFocus;
      Exit;
    end;

    if (dbedDataNascimento.Text='') and (FlgExcluir=0) then begin
      MsgDlg('Favor informar a data de nascimento do contato!','Atenção',mtWarning,[mbOk],0);
      if (dbedDataNascimento.CanFocus) then
        dbedDataNascimento.SetFocus;
      Exit;
    end;

    if (dbedCargo.Text='') and (FlgExcluir=0) then begin
      MsgDlg('Favor informar o cargo do contato!','Atenção',mtWarning,[mbOk],0);
      if (dbedCargo.CanFocus) then
        dbedCargo.SetFocus;
      Exit;
    end;

    if (dbedSetor.Text='') and (FlgExcluir=0) then begin
      MsgDlg('Favor informar o setor do contato!','Atenção',mtWarning,[mbOk],0);
      if (dbedSetor.CanFocus) then
        dbedSetor.SetFocus;
      Exit;
    end;

    if (qryContato.State=dsInsert) then begin
      sIdContato                                            := IntToStr(LeUltRegistro(Nil,'CONTATOPESS'));
      qryInsereContato.ParamByName('IDCONTATO').AsFloat     := StrToFloat(sIdContato);
      qryInsereContato.ParamByName('IDENDERECO').AsFloat    := qryEnderecosIDENDERECO.AsFloat;
      qryInsereContato.ParamByName('NOME').AsString         := dbedContatoNome.Text;
      qryInsereContato.ParamByName('EMAIL').AsString        := dbedContatoEmail.Text;
      qryInsereContato.ParamByName('NASCIMENTO').AsDateTime := StrToDate(dbedDataNascimento.Text);
      qryInsereContato.ParamByName('CARGO').AsString        := dbedCargo.Text;
      qryInsereContato.ParamByName('SETOR').AsString        := dbedSetor.Text;
      qryInsereContato.ParamByName('OBS').AsString          := dbMemoObs.Text;
      qryInsereContato.ExecSQL;
    end;

    if (qryRamal.State=dsInsert) then begin
      if (qryContato.State=dsInsert) then
           qryInsereRamal.ParamByName('IDCONTATO').AsFloat := StrToFloat(sIdContato)
      else qryInsereRamal.ParamByName('IDCONTATO').AsFloat := qryContatoIDCONTATO.AsFloat;

      qryInsereRamal.ParamByName('IDTELCONTATO').AsFloat := LeUltRegistro(Nil,'TELCONTATO');
      qryInsereRamal.ParamByName('IDTELEFONE').AsFloat   := qryTelefonesIDTELEFONE.AsFloat;
      qryInsereRamal.ParamByName('RAMAL').AsString       := qryRamalRAMAL.AsString;
      qryInsereRamal.ExecSQL;
    end;

    if (qryContato.State=dsEdit) and (FlgExcluir=0) then begin
      qryAlteraContato.ParamByName('IDCONTATO').AsFloat     := qryContatoIDCONTATO.AsFloat;
      qryAlteraContato.ParamByName('IDENDERECO').AsFloat    := qryContatoIDENDERECO.AsFloat;
      qryAlteraContato.ParamByName('NOME').AsString         := dbedContatoNome.Text;
      qryAlteraContato.ParamByName('EMAIL').AsString        := dbedContatoEmail.Text;
      qryAlteraContato.ParamByName('NASCIMENTO').AsDateTime := StrToDate(dbedDataNascimento.Text);
      qryAlteraContato.ParamByName('CARGO').AsString        := dbedCargo.Text;
      qryAlteraContato.ParamByName('SETOR').AsString        := dbedSetor.Text;
      qryAlteraContato.ParamByName('OBS').AsString          := dbMemoObs.Text;
      qryAlteraContato.ExecSQL;
    end;

    if (qryRamal.State=dsEdit) and (FlgExcluir=0) then begin
      qryAlteraRamal.ParamByName('IDTELCONTATO').AsFloat := qryRamalIDTELCONTATO.AsFloat;
      qryAlteraRamal.ParamByName('IDTELEFONE').AsFloat   := qryTelefonesIDTELEFONE.AsFloat;
      qryAlteraRamal.ParamByName('RAMAL').AsString       := qryRamalRAMAL.AsString;
      qryAlteraRamal.ExecSQL;
    end;

    if (FlgExcluir=1) then begin
      if (qryRamal.RecordCount>0) then begin
        qryRamal.DisableControls;
        qryRamal.First;

        while not qryRamal.Eof do begin
          qryExcluiRamal.ParamByName('IDTELCONTATO').AsFloat := qryRamalIDTELCONTATO.AsFloat;
          qryRamal.Next;
        end;

        qryExcluiRamal.ExecSQL;
        qryRamal.EnableControls;
      end;

      qryExcluiContato.ParamByName('IDCONTATO').AsFloat := qryContatoIDCONTATO.AsFloat;
      qryExcluiContato.ExecSQL;
    end;

    Fiario.IdPessoa     := StrToInt(IdBeneficiario);
    Fiario.IdTitular    := StrToInt(IdTitular);
    Fiario.Idusuario    := Sistema.IdUsuario;
    Fiario.Idmodulo     := 19;
    Fiario.Idrubs       := 0;
    Fiario.DataInclusao := Date;

    qryGrupo.Open;

    if (qryContato.State=dsInsert) then begin
      if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELINC.AsInteger<>0) and not (qryGrupoIDFIARIOTELINC.IsNull) then
      begin
        Fiario.IdGrupo   := qryGrupoIDFIARIOTELINC.AsInteger;
        Fiario.Descricao := 'Inclusão do Contato';
        Fiario.Inserir;
      end;
    end;

    if (qryContato.State=dsEdit) and (FlgExcluir=0) then begin
      if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELALT.AsInteger<>0) and not (qryGrupoIDFIARIOTELALT.IsNull) then
      begin
        Fiario.IdGrupo   := qryGrupoIDFIARIOTELALT.AsInteger;
        Fiario.Descricao := 'Alteração do Contato';
        Fiario.Inserir;
      end;
    end;

    if (FlgExcluir=1) then begin
      if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOTELEXC.AsInteger<>0) and not (qryGrupoIDFIARIOTELEXC.IsNull) then
      begin
        Fiario.IdGrupo   := qryGrupoIDFIARIOTELEXC.AsInteger;
        Fiario.Descricao := 'Exclusão do Telefone';
        Fiario.Inserir;
      end;
    end;

    if qryContato.Active then
      qryContato.Close;
      qryContato.ParamByName('PIDPESSOA').AsInteger := qryEnderecos.FieldByName('IDPESSOA').AsInteger;
      qryContato.Open;

      qryRamal.Close;
      qryRamal.ParamByName('PIDCONTATO').AsFloat := qryContato.FieldByName('IDCONTATO').AsFloat;
      qryRamal.Open;

      FlgExcluir := 0;
      pnlContatos.SendToBack;

      if (qryContato.RecordCount>0) then begin
        sbtnInsereDetalhe.Enabled := True;
        sbtnAlteraDetalhe.Enabled := True;
        sbtnExcluiDetalhe.Enabled := True;
      end else begin
        sbtnInsereDetalhe.Enabled := True;
        sbtnAlteraDetalhe.Enabled := False;
        sbtnExcluiDetalhe.Enabled := False;
      end;
  end;

  // Se estiver na aba 'Conta Corrente' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContaCorrente) then begin
    inherited;

    if (FlgExcluir=0) then begin
      if (dblkpcmbAgencia.Text='') then begin
        MsgDlg('Favor informar a Agencia Bancaria!','Atenção',mtError,[mbOk],0);
        if (dblkpcmbAgencia.CanFocus) then dblkpcmbAgencia.SetFocus;
        Abort;
      end;

      if (rgrpTipoConta.ItemIndex=-1) then begin
        MsgDlg('Favor informar o Tipo de Conta!','Atenção',mtError,[mbOk],0);
        if (rgrpTipoConta.CanFocus) then rgrpTipoConta.SetFocus;
        Abort;
      end;

      if (dbgrpContaPref.ItemIndex=-1) then begin
        MsgDlg('Favor informar a Conta Preferencial!','Atenção',mtError,[mbOk],0);
        if (dbgrpContaPref.CanFocus) then dbgrpContaPref.SetFocus;
        Abort;
      end;

      if (dbgrpContaConj.ItemIndex=-1) then begin
        MsgDlg('Favor informar a Caracteristica de Conta!','Atenção',mtError,[mbOk],0);
        if (dbgrpContaConj.CanFocus) then dbgrpContaConj.SetFocus;
        Abort;
      end;

      if (rgrpTipoConta.ItemIndex=0) then TipoConta := 1;
      if (rgrpTipoConta.ItemIndex=1) then TipoConta := 2;
      if (rgrpTipoConta.ItemIndex=2) then TipoConta := 3;
      if (rgrpTipoConta.ItemIndex=3) then TipoConta := 4;

      if (dbgrpContaConj.ItemIndex=0) then
           FlgContaConj := 'N'
      else FlgContaConj := 'S';

      try
        StrToInt(qryBancoNUMBANCO.AsString);
      except
        MsgDlg('O Número do Banco não é um Número Inteiro Válido. O Número deve ser um Número '+#13+#10+'Inteiro e deve ser um Número de Agência Bancária Válido','Atenção', mtWarning, [mbOK], 0);
        Exit;
      end;

      if (rgrpTipoConta.ItemIndex<>3) then begin
        try
// Daniel - 23767 - Início -----------------------------------------------------
          CalculaDv           := TCalcDv.Create;
          CalculaDV.TipoConta := TipoConta;

          if (qryBancoFLGVALIDACC.AsString<>'N') then begin
            if not CalculaDV.ValidaConta(qryBancoNUMBANCO.AsString,
                                         qryAgenciaNUMAGENCIA.Asstring,
                                         dbedContaBancaria.Text,
                                         True) then Exit;
          end;
        finally
          CalculaDv.Free;
        end;
      end;
// Daniel - 23767 - Fim --------------------------------------------------------

      if (dbgrpContaPref.ItemIndex=1) then begin
        if (JaExistePreferencial) then begin
          MsgDlg('Já existe outra conta indicada como "Conta Preferencial". Verifique.','Erro',mtError,[mbOk],0);
          dbgrpContaPref.ItemIndex := 0;
          if (dbgrpContaPref.CanFocus) then dbgrpContaPref.SetFocus;
          Exit;
        end;
      end;
    end;

    if (qryContaCorrente.State=dsInsert) then begin
      qryInsContaCorrente.ParambyName('IDCBANCARIA').AsFloat       := LeUltRegistro(nil,'CONTABANCARIA');
      qryInsContaCorrente.ParambyName('CONTACORRENTE').AsString    := dbedContaBancaria.Text;
      qryInsContaCorrente.ParambyName('IDPESSOA').AsFloat          := StrToFloat(IdBeneficiario);
      qryInsContaCorrente.ParambyName('TIPOCONTA').AsString        := IntToStr(TipoConta);
      qryInsContaCorrente.ParambyName('FLGCONTAPREF').AsFloat      := dbgrpContaPref.ItemIndex;
      qryInsContaCorrente.ParambyName('IDAGENCIA').AsFloat         := qryAgenciaIDPESSOA.AsFloat;
      qryInsContaCorrente.ParambyName('FLGCONTACONJUNTA').AsString := FlgContaConj;
      qryInsContaCorrente.ExecSQL;
    end;

    if (qryContaCorrente.State=dsEdit) and (FlgExcluir=0) then begin
      qryContaCorrente.ParamByName('IDPESSOA').AsInteger := StrToInt(IdBeneficiario);
      qryContaCorrenteCONTACORRENTE.AsString             := dbedContaBancaria.Text;
      qryContaCorrenteTIPOCONTA.AsString                 := IntToStr(TipoConta);
      qryContaCorrenteFLGCONTAPREF.AsInteger             := dbgrpContaPref.ItemIndex;
      qryContaCorrenteIDAGENCIA.asInteger                := qryAgenciaIDPESSOA.AsInteger;
      qryContaCorrenteFLGCONTACONJUNTA.AsString          := FlgContaConj;
      qryContaCorrente.Post;
      qryContaCorrente.ApplyUpdates;
      qryContaCorrente.Close;
      qryContaCorrente.Open;
    end;

    if (FlgExcluir=1) then begin
      qryExcContaCorrente.ParambyName('IDCBANCARIA').AsFloat := qryContaCorrenteIDCBANCARIA.AsFloat;
      qryExcContaCorrente.ExecSQL;
    end;

    Fiario.IdPessoa     := StrToInt(IdBeneficiario);
    Fiario.IdTitular    := StrToInt(IdTitular);
    Fiario.IdUsuario    := Sistema.Idusuario;
    Fiario.IdModulo     := 19;
    Fiario.IdRubs       := 0;
    Fiario.DataInclusao := Date;

    qry.Open;

    if (qryContaCorrente.State=dsInsert) then begin
      if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOCCINC.AsInteger<>0) and not (qryGrupoIDFIARIOCCINC.IsNull) then begin
        Fiario.IdGrupo   := qryGrupoIDFIARIOCCINC.AsInteger;
        Fiario.Descricao := 'Inclusão da ContaCorrente';
        Fiario.Inserir;
      end;
    end;

    if (qryContaCorrente.State=dsEdit) and (FlgExcluir=0) then begin
      if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOCCALT.AsInteger<>0) and not (qryGrupoIDFIARIOCCALT.IsNull) then begin
        Fiario.IdGrupo   := qryGrupoIDFIARIOCCALT.AsInteger;
        Fiario.Descricao := 'Alteração da ContaCorrente';
        Fiario.Inserir;
      end;
    end;

    if (FlgExcluir=1) then begin
      if (qryGrupo.IsEmpty=False) and (qryGrupoIDFIARIOCCEXC.AsInteger<>0) and not (qryGrupoIDFIARIOCCEXC.IsNull) then begin
        Fiario.IdGrupo   := qryGrupoIDFIARIOCCEXC.AsInteger;
        Fiario.Descricao :=  'Exclusão  da ContaCorrente';
        Fiario.Inserir;
      end;
    end;

    qryContaCorrente.Close;
    qryContaCorrente.ParamByName('IDPESSOA').AsFloat := StrToFloat(IdBeneficiario);
    qryContaCorrente.Open;

    FlgExcluir := 0;
    pnlContasCorrentes.SendToBack;

    if (qryContaCorrente.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;
  end;

  // Se estiver na aba 'Documentos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsDocumentos) then begin
    inherited;

    if (DblkTipoDocPessoa.LookupValue <> '') and (idtitular <> '') and (qryDocumentos.state in [dsEdit, dsInsert]) then
    begin
      qryDocumentosIDPESSOA.AsInteger    := strToInt(IdTitular);
      qryDocumentosIDDOCUMENTO.asInteger := strToInt(DblkTipoDocPessoa.LookupValue);

      // Valida se for CPF
      if qryDocumentosIDDOCUMENTO.AsInteger=2 then begin
        if not ValidaCpf(trim(DBedRG2.Text)) then begin
          DBedRG2.setFocus;
          showMessage('Cpf Inválido !');
          Abort;
        end;
      end;

      qryDocumentos.Post;
      deletaDoc := False;
    end;

    if deletaDoc then begin
      qryDocumentos.Delete;
      deletaDoc := False;
    end;

    qryDocumentos.ApplyUpdates;
    qryDocumentos.Close;
    qryDocumentos.Open;

    pnlDocumentos.SendToBack;

    if (qryDocumentos.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;
  end;

  btnOk.Enabled       := False;
  btnCancelar.Enabled := False;
  btnVoltar.Enabled   := False;

  Flagcheckinsere := False;  //Petri Nocentini SOL 251827 PPM 764141
  if sFlgStatusQuery='I' then sbtnInsereDetalhe.Down := False; // Se tiver 'Insert'
  if sFlgStatusQuery='E' then sbtnAlteraDetalhe.Down := False; // Se tiver 'Edit'
end;

procedure TfrmAtend.btnCancelarClick(Sender: TObject);
begin
  inherited;

  // Se estiver na aba 'Endereço' ...
  if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) then begin
    qryEnderecos.Cancel;
    pnlEnderecos.SendToBack;

    {if (qryEnderecos.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
      VeriricaAbaEndereco;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
      VeriricaAbaEndereco;
    end;                   }

    VeriricaAbaDadosParticip;
  end;

  // Se estiver na aba 'Telefones' ...
  if (pgCtrlDadosParticip.ActivePage=tbsTelefones) then begin
    qryTelefones.Cancel;
    pnlcadtelefones.SendToBack;

    if (qryTelefones.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;
  end;

  // Se estiver na aba 'Contatos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContatos) then begin
    qryContato.Cancel;
    qryRamal.Cancel;
    pnlContatos.SendToBack;

    if (qryContato.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;
  end;

  // Se estiver na aba 'Conta Corrente' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContaCorrente) then begin
    qryContaCorrente.Cancel;
    pnlContasCorrentes.SendToBack;

    if (qryContaCorrente.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;
  end;

  // Se estiver na aba 'Documentos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsDocumentos) then begin
    qryDocumentos.CancelUpdates;
    pnlDocumentos.SendToBack;

    if (qryDocumentos.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;
  end;

  btnOk.Enabled       := False;
  btnCancelar.Enabled := False;
  btnVoltar.Enabled   := False;

  Flagcheckinsere := False; //Petri Nocentini SOL 251827 PPM 764141
  if sFlgStatusQuery='I' then sbtnInsereDetalhe.Down := False; // Se tiver 'Insert'
  if sFlgStatusQuery='E' then sbtnAlteraDetalhe.Down := False; // Se tiver 'Edit'
end;

procedure TfrmAtend.btnVoltarClick(Sender: TObject);
begin
  inherited;

  // Se estiver na aba 'Endereço' ...
  if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) then begin
    qryEnderecos.Cancel;
    pnlEnderecos.SendToBack;

    {if (qryEnderecos.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;  }
    VeriricaAbaDadosParticip;
  end;

  // Se estiver na aba 'Telefones' ...
  if (pgCtrlDadosParticip.ActivePage=tbsTelefones) then begin
    qryTelefones.Cancel;
    pnlcadtelefones.SendToBack;

    if (qryTelefones.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;
  end;

  // Se estiver na aba 'Contatos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContatos) then begin
    pnlContatos.SendToBack;

    if (qryContato.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;
  end;

  // Se estiver na aba 'Conta Corrente' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContaCorrente) then begin
    qryContaCorrente.Cancel;
    pnlContasCorrentes.SendToBack;

    if (qryContaCorrente.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;
  end;

  // Se estiver na aba 'Documentos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsDocumentos) then begin
    qryDocumentos.CancelUpdates;
    pnlDocumentos.SendToBack;

    if (qryDocumentos.RecordCount>0) then begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := True;
      sbtnExcluiDetalhe.Enabled := True;
    end else begin
      sbtnInsereDetalhe.Enabled := True;
      sbtnAlteraDetalhe.Enabled := False;
      sbtnExcluiDetalhe.Enabled := False;
    end;
  end;

  btnOk.Enabled       := False;
  btnCancelar.Enabled := False;
  btnVoltar.Enabled   := False;

  if sFlgStatusQuery='I' then sbtnInsereDetalhe.Down := False; // Se tiver 'Insert'
  if sFlgStatusQuery='E' then sbtnAlteraDetalhe.Down := False; // Se tiver 'Edit'
end;

procedure TfrmAtend.tbsDadosParticipShow(Sender: TObject);
begin
  inherited;
  pgCtrlDadosParticip.ActivePage := tbsEnderecos;
end;

procedure TfrmAtend.pgCtrlDadosParticipChanging(Sender:TObject; var AllowChange:Boolean);
begin
  inherited;

  // Se estiver na aba 'Endereço' ...
  if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) then begin
    if qryEnderecos.State in [dsEdit, dsInsert] then begin
      if (Application.MessageBox('Você está tentando mudar de pasta sem confirmar a gravação do endereço.'+#13+
                                 'Deseja realmente sair sem confirmar a gravação?','Atendimento',
                                 Mb_YesNo+Mb_IConQuestion)=Id_Yes) then
      begin
        btnCancelarClick(Sender);
        AllowChange := True;
      end else AllowChange := False;
    end;
  end;

  // Se estiver na aba 'Telefones' ...
  if (pgCtrlDadosParticip.ActivePage=tbsTelefones) then begin
    if qryTelefones.State in [dsEdit, dsInsert] then begin
      if (Application.MessageBox('Você está tentando mudar de pasta sem confirmar a gravação do telefone.'+#13+
                                 'Deseja realmente sair sem confirmar a gravação?','Atendimento',
                                 Mb_YesNo+Mb_IConQuestion)=Id_Yes) then
      begin
        btnCancelarClick(Sender);
        AllowChange := True;
      end else AllowChange := False;
    end;
  end;

  // Se estiver na aba 'Contatos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContatos) then begin
    if qryContato.State in [dsEdit, dsInsert] then begin
      if (Application.MessageBox('Você está tentando mudar de pasta sem confirmar a gravação do contato.'+#13+
                                 'Deseja realmente sair sem confirmar a gravação?','Atendimento',
                                 Mb_YesNo+Mb_IConQuestion)=Id_Yes) then
      begin
        btnCancelarClick(Sender);
        AllowChange := True;
      end else AllowChange := False;                                   
    end;
  end;

  // Se estiver na aba 'Conta Corrente' ...
  if (pgCtrlDadosParticip.ActivePage=tbsContaCorrente) then begin
    if qryContaCorrente.State in [dsEdit, dsInsert] then begin
      if (Application.MessageBox('Você está tentando mudar de pasta sem confirmar a gravação da conta corrente.'+#13+
                                 'Deseja realmente sair sem confirmar a gravação?','Atendimento',
                                 Mb_YesNo+Mb_IConQuestion)=Id_Yes) then
      begin
        btnCancelarClick(Sender);
        AllowChange := True;
      end else AllowChange := False;
    end;
  end;

  // Se estiver na aba 'Documentos' ...
  if (pgCtrlDadosParticip.ActivePage=tbsDocumentos) then begin
    if qryDocumentos.State in [dsEdit, dsInsert] then begin
      if (Application.MessageBox('Você está tentando mudar de pasta sem confirmar a gravação do documento.'+#13+
                                 'Deseja realmente sair sem confirmar a gravação?','Atendimento',
                                 Mb_YesNo+Mb_IConQuestion)=Id_Yes) then
      begin
        btnCancelarClick(Sender);
        AllowChange := True;
      end else AllowChange := False;
    end;
  end;
end;

procedure TfrmAtend.dblkCidade1CloseUp(Sender:TObject; LookupTable,FillTable:TDataSet; modified:Boolean);
begin
  inherited;

  if (modified) then begin
    if (dblkCidade1.Text<>'') then begin
       dblkEstado1.Value := qryCidades.FieldByName('CODESTADO').AsString;
       qryUF.Locate('CODESTADO',qryCidades.FieldByName('CODESTADO').AsString,[]);

       if not (qryEnderecos.State in [dsInsert,dsEdit]) then qryEnderecos.Edit;

       qryEnderecosCODESTADO.AsString := qryUFCODESTADO.AsString;
    end;
  end;
end;
// Daniel - 27845 - Fim --------------------------------------------------------


//Fanuel junior - SOL147993 Kintana1031104  Inicio
procedure TfrmAtend.ValidaCampoNumerico(var Key : char);
begin
  if key<>'' then
     begin
        if not (Key = #8 ) then
           begin
              If Not (Key In ['0'..'9'] )  Then
              KEY := #0;
           end;
     end;
end;

procedure TfrmAtend.ValidaCampoNumericoDDD(var Key : char);
begin
  if key<>'' then
     begin
        if not (Key = #8 ) then
           begin
              If Not (Key In ['1'..'9'] )  Then
              KEY := #0;
           end;
     end;
  end;


procedure TfrmAtend.edtDDDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidaCampoNumericoDDD(Key);
end;

procedure TfrmAtend.edtNumeroTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
   ValidaCampoNumerico(Key);
end;

procedure TfrmAtend.edtDDIKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
  ValidaCampoNumericoDDD(Key);
end;

procedure TfrmAtend.edtTelDDIKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidaCampoNumericoDDD(Key);
end;

procedure TfrmAtend.edtTelDDDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidaCampoNumericoDDD(Key);
end;

procedure TfrmAtend.edtTelNumeroTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ValidaCampoNumerico(Key);
end;


procedure TfrmAtend.edcep1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidaCampoNumerico(Key);
end;



procedure TfrmAtend.edtcepKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ValidaCampoNumerico(Key);
end;
// Fanuel junior - SOL147993 Kintana1031104  Fim


//Fanuel Marinho SOL183267 Kintana1713326 - Inicio
procedure TfrmAtend.pgCtrlDadosParticipChange(Sender: TObject);
begin
  inherited;
//9744 -- ALT. ENDERECO
//9748 -- EXCL. ENDERECO
//9752 -- INCL. ENDERECO
  VeriricaAbaDadosParticip;

   {if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) then
   begin
       sbtnInsereDetalhe.Enabled := VerificaAutorizacao('9752');
       sbtnAlteraDetalhe.Enabled := VerificaAutorizacao('9744');
       sbtnExcluiDetalhe.Enabled := VerificaAutorizacao('9748');
   end
   else
   begin
       sbtnInsereDetalhe.Enabled := true;
       sbtnAlteraDetalhe.Enabled := true;
       sbtnExcluiDetalhe.Enabled := true;
   end;  }
end;

// Verifica se o usuario tem permissão para utilizar os comandos
// de inserir, alterar e excluir na Aba de Endereço, visto que o sistema
// de permissões não tem este tipo de verificação.

procedure TfrmAtend.VeriricaAbaDadosParticip;
begin

   if (pgCtrlDadosParticip.ActivePage=tbsEnderecos) then
   begin
      qryAux.Close;
      qryAux.sql.Clear;
      qryAux.SQL.ADD(' select  (Select idOperFunc from OperFunc  where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO INCL. ENDERECO%'')) AS INC, '+
                     ' (Select idOperFunc from OperFunc   where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO ALT. ENDERECO%'')) AS ALT, '+
                     ' (Select idOperFunc from OperFunc    where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO EXCL. ENDERECO%'')) AS EXC '+
                     ' from dual ');
      qryAux.open;

      sbtnInsereDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('INC').AsString);
      sbtnAlteraDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('ALT').AsString);
      sbtnExcluiDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('EXC').AsString);
   end
   else if (pgCtrlDadosParticip.ActivePage=tbsTelefones) then
   begin
      qryAux.Close;
      qryAux.sql.Clear;
      qryAux.SQL.ADD(' select  (Select idOperFunc from OperFunc  where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO INCL. TELEFONE%'')) AS INC, '+
                     ' (Select idOperFunc from OperFunc   where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO ALT. TELEFONE%'')) AS ALT, '+
                     ' (Select idOperFunc from OperFunc    where idModulo = 19  '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO EXCL. TELEFONE%'')) AS EXC '+
                     ' from dual ');
      qryAux.open;

      sbtnInsereDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('INC').AsString);
      sbtnAlteraDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('ALT').AsString);
      sbtnExcluiDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('EXC').AsString);
   end
   else if (pgCtrlDadosParticip.ActivePage=tbsContatos) then
   begin

      qryAux.Close;
      qryAux.sql.Clear;
      qryAux.SQL.ADD(' select  (Select idOperFunc from OperFunc  where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTÃO INC. CONTATO%'')) AS INC, '+
                     ' (Select idOperFunc from OperFunc   where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTÃO ALT. CONTATO%'')) AS ALT, '+
                     ' (Select idOperFunc from OperFunc    where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTÃO EXC. CONTATO%'')) AS EXC '+
                     ' from dual ');
      qryAux.open;

      sbtnInsereDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('INC').AsString);
      sbtnAlteraDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('ALT').AsString);
      sbtnExcluiDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('EXC').AsString);
   end
   else if (pgCtrlDadosParticip.ActivePage=tbsContaCorrente) then
   begin
      qryAux.Close;
      qryAux.sql.Clear;
      qryAux.SQL.ADD(' select  (Select idOperFunc from OperFunc  where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO INCL. CONTA C.%'')) AS INC, '+
                     ' (Select idOperFunc from OperFunc   where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO ALT. CONTA C.%'')) AS ALT, '+
                     ' (Select idOperFunc from OperFunc    where idModulo = 19  '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO EXCL. CONTA C.%'')) AS EXC '+
                     ' from dual ');
      qryAux.open;

      sbtnInsereDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('INC').AsString);
      sbtnAlteraDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('ALT').AsString);
      sbtnExcluiDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('EXC').AsString);
   end
   else if (pgCtrlDadosParticip.ActivePage=tbsDocumentos) then
   begin

      qryAux.Close;
      qryAux.sql.Clear;
      qryAux.SQL.ADD(' select  (Select idOperFunc from OperFunc  where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO INCL. DOCUM.%'')) AS INC, '+
                     ' (Select idOperFunc from OperFunc   where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO ALT. DOCUM.%'')) AS ALT, '+
                     ' (Select idOperFunc from OperFunc    where idModulo = 19 '+
                     ' and idOperacao = (Select op.idoperacao  from operacao op where nomeoperacao LIKE ''%HABILITAR BOTAO EXCL. DOCUM.%'')) AS EXC '+
                     ' from dual ');
      qryAux.open;

      sbtnInsereDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('INC').AsString);
      sbtnAlteraDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('ALT').AsString);
      sbtnExcluiDetalhe.Enabled := VerificaAutorizacao(qryAux.FieldByName('EXC').AsString);
   end
   else
   begin
      sbtnInsereDetalhe.Enabled := true;
      sbtnAlteraDetalhe.Enabled := true;
      sbtnExcluiDetalhe.Enabled := true;
   end;
end;


function  TfrmAtend.VerificaAutorizacao(sIdOperFunc : String):boolean;
var
qryAutorizaEndereco : TwwQuery;
begin
                                                                                      
  qryAutorizaEndereco := TwwQuery.Create(Self);
  qryAutorizaEndereco.DataBaseName := 'BASEDADOS';
  qryAutorizaEndereco.Close;
  qryAutorizaEndereco.SQL.Clear;
  qryAutorizaEndereco.SQL.Add(' SELECT AUTORIZA.IDOPERFUNC ');
  qryAutorizaEndereco.SQL.Add('   FROM AUTORIZA            ');
  qryAutorizaEndereco.SQL.Add('  WHERE (AUTORIZA.IDPESSOA   = '+IntToStr(Sistema.IdEmpresa)  + ' )');
  qryAutorizaEndereco.SQL.Add('    AND (AUTORIZA.IDOPERFUNC = '+sIdOperFunc+' ) ');
  qryAutorizaEndereco.SQL.Add('    AND (AUTORIZA.IDESPACESSO = '+IntToStr(Sistema.IdEspAcesso) + ' ) ');
  qryAutorizaEndereco.SQL.Add('     OR (AUTORIZA.IDESPACESSO IN    ');
  qryAutorizaEndereco.SQL.Add('        (SELECT GRUPOACESSO.IDESPACESSO ');
  qryAutorizaEndereco.SQL.Add('          FROM GRUPOACESSO   ');
  qryAutorizaEndereco.SQL.Add('          where GRUPOACESSO.IDGRUPO in  ');
  qryAutorizaEndereco.SQL.Add('                (SELECT IDGRUPO FROM GRUPOUSU  ');
  qryAutorizaEndereco.SQL.Add('                 WHERE GRUPOUSU.IDUSUARIO = ' + IntToStr(Sistema.IdUsuario)+ '  ');
  qryAutorizaEndereco.SQL.Add('                 AND   GRUPOUSU.IDGRUPO = GRUPOACESSO.IDGRUPO )   ');
  qryAutorizaEndereco.SQL.Add('                 AND   AUTORIZA.IDPESSOA   = '+IntToStr(Sistema.IdEmpresa)  + ' ');
  qryAutorizaEndereco.SQL.Add('                 AND (AUTORIZA.IDOPERFUNC = '+sIdOperFunc+')))');
  qryAutorizaEndereco.Open;

  //9744 -- ALT. ENDERECO
  //9748 -- EXCL. ENDERECO
  //9752 -- INCL. ENDERECO


  if (qryEnderecos.RecordCount > 0 ) then
     result := not (qryAutorizaEndereco.IsEmpty)
  else
     // Se for insert, deve ser feita a validação, visto que sempre
     // se pode fazer essa operação
     if (sIdOperFunc = '9752') then
        result := not (qryAutorizaEndereco.IsEmpty)
     else
        result := false;

end;
//Fanuel Marinho SOL183267 Kintana1713326 - Fim

end.

