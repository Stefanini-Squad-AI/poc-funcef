unit FImportaDadosCadastrais;

// Alterações:
{---------------------------------------------------------------------------------------------------
Rotina........: IMPORTADADOSCADASTRAIS
N. Sol........: 107249
N. Kintana....: 482530
Data..........: 30/01/2009
Responsável...: Daniel Begnami
Descrição.....: SELECT da tabela temporária sem repetição da dados.
----------------------------------------------------------------------------------------------------

Rotina........: ImportaEvolFunc e ImportaLotacao
N. Sol........: 97530
N. Kintana....: 425336
Data..........: 06/10/2008
Responsável...: Renato Visoni
Descrição.....: Mudei o Relacionamento da query na condição WHERE EV.IDPESSJUR = '''+IntToStr(iPatro) para
                WHERE CCdaniel.IDPESSJUR = '''+IntToStr(iPatro) da rotina ImportaEvolFunc, pois essa query estava
                buscando registros errados, e na rotina ImportaLotacao mudei alguns parametros da função AtualizaDataFinal.
----------------------------------------------------------------------------------------------------
Rotina........: IMPORTADADOSCADASTRAIS
N. Sol........: 96977
N. Kintana....: 421093
Data..........: 26/09/2008
Responsável...: Denise Arruda
Descrição.....: Acerto no Flag de conta preferencial. A comparação e a atualização não estavam
                levando em conta o número da agência bancária criando inconsistência nos dados
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 19/06/2008
Pendência   : 28198
Rotina      : ImportaDadosCadastrais
Alteração   : Retirando ',' a mais do Update.
----------------------------------------------------------------------------------------------------
Autor(a)    : Hugo Luna
Data        : 19/06/2008
Pendência   : 28046
Rotina      : ImportaDadosCadastrais
Alteração   : Colocando update para marcar corretamente o flag flgcontapref.
----------------------------------------------------------------------------------------------------
Autor(a)    : Andre Pontes
Data        : 13/02/2008
Pendência   : 27282
Rotina      : ImportaDadosCadastrais IMPORTADADOSCADASTRAIS
Alteração   : Gravação das contas bancárias em caso de MP (mantido parcial) também
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 23/10/2007
Pendência   : Sem número
Rotina      : ImportaTabelaLocal
Alteração   : Coloquei um trim para casos em que o nome tenha um espaço em branco antes da string.
---------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 23/10/2007
Pendência   : 26574
Rotina      : ImportaEndereco
Alteração   : Ordenar pelo telefone para não achar primeiro o telefone em branco.
---------------------------------------------------------------------------------------------------
Autor(a)    : Augusto
Data        : 11/09/2007
Pendência   : 26251
Rotina      : ImportaTabelaLocal
Alteração   : Incluir atualização do  IDGRUPO na tabela FILIALPESSOA 
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Rotina      : Varias
Data        : 21/08/2007
Pendência   : 22108
Alteração   : Troca do DateToStr para FormatDateTime.
---------------------------------------------------------------------------------------------------
Autor(a)    : Paulo Ramos
Data        : 06/07/2007
Pendência   : 25790
Rotina      : ImportaEndereco
Alteração   : Tratar o Codestado da tabela estado, pois o Codestado e UF da tabela
              Cidades não é mais usado. Assim em registros novos de Cidades,
              inputados pelo Global, que ficam com o Codestado nulo, o endereço
              do associado não era importado.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 19/06/2007
Pendência   : 25630
Rotina      : ImportaEvolFunc
Alteração   : Passagem de parâmetro novo para a AtualizaDataInicial da uTabCriticasCcp.
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 21/05/2007
Pendência   : 25223
Rotina      : ImportaEventos (em 2 pontos)
Alteração   : Troca da verificação do FLGDESATIVADO para DATACANCELAMENTO
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 23/02/2007
Pendência   : 24560
Rotina      : ImportaEvolFunc
Alteração   : Acerto na importação de dados sobre a data inicial.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 22/02/2007
Pendência   : 24561
Rotina      : ImportaEvolFunc
Alteração   : Acerto no tratamento para tipo igual a IN.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 21/02/2007
Pendência   : 24557
Rotina      : VoltaFlgInterno
Alteração   : Acerto na query para ordenar corretamente as inscrições do
              participante.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 05/02/2007
Pendência   : 24429
Rotina      : ImportaEvolFunc
Alteração   : Quando importar o registro de AT, não pesquisar o cargo.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 18.08.2006
Pendência   : 22915
Rotina      : DefineEstruturaTabelaPDX, CarregaTabelaPDX, ImportaEvolFunc,
              ProcessaArquivo
Alteração   :
              DefineEstruturaTabelaPDX: alteração do tipo do campo DtIniCargo
                                        de String para Date;

              CarregaTabelaPDX: testa se o campo está null;
              ImportaEvolFunc: acerto para não atuzalizar a datafinal do cargo
                               atual.

              ProcessaArquivo: ordenar também pelo campo tiporeg e dtinicargo
                               quando for evolução funcional. 
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 18.07.2006
Pendência   : 22832
Rotina      : ImportaEvolFunc
Alteração   : Buscar o registro na base filtrando também pelo campo IdFuncao.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 04.07.2006
Pendência   : 22748
Rotina      : ImportaEvolFunc
Alteração   : Estava buscando o mesmo registro do arquivo, se este estivesse
              no banco, atualizando assim o datafinal.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 14.06.2006
Pendência   : 22569
Rotina      : ImportaEventos
Alteração   : Código marcado estava comentado. Então só tirei o comentário.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 14.06.2006
Pendência   : 22336
Rotina      : ImportaDadosCadastrais
Alteração   : Alteração para inserir o cargo anterior, alterar a data final
              do cargo antes do anterior caso este tenha data final maior que
              a data de início do cargo anterior que está sendo inserido. Ca_
              so já exista registro de cargo atual, inserir o cargo anterior
              com a data final um dia antes da data início do cargo atual.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 11.05.2006
Pendência   : 21722
Rotina      : ImportaDadosCadastrais
Alteração   : Gravar o campo RazaoSocial com o campo nome do arquivo.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 09.05.2006
Pendência   : 22295
Rotina      : ImportaEvolFunc
Alteração   : Coloquei o join da EvolFuncPrev e CargoExt pelo campo IdPessJur.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 25.04.2006
Pendência   : 22107 e 22109
Rotina      : ImportaEvolFunc
Alteração   : Buscar registros no banco com a data maior ou igual a data de
              início no arquivo.
              Tirei o teste da data final do cargo para inserir uma função já
              finalizada.
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 22.03.2006
Pendência   : 21506
Rotina      : ImportaEvolFunc
Alteração   : filtrar a busca de função pelo MODO
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 16.03.2006
Pendência   : 21031
Rotina      : IMPORTADADOSCADASTRAIS
Alteração   : Tratar data de readmissão zerada
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 16.03.2006
Pendência   : 20733
Rotina      : ImportaEventos
Alteração   : coloquei o EVENTOSPREV.FLGMIGRADO = 1 para inscrições para que não possa ser desfeita pelo ADMPREV
              na tela de cancelamento de evento
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 10.03.2006
Pendência   : 21713
Rotina      :
Alteração   : Inclusão do tratamento da data final de filiais EDTELDDDINI e EDTELDDDTAM
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 09.03.2006
Pendência   : 21627
Rotina      : Importaevento
Alteração   : verifica se o evento já foi gravado
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 09.03.2006
Pendência   : 21588
Rotina      : ImportaEventos
Alteração   : troca do lugar de inserção na tabela RESERVAPART no tratamento de novas inscrições
              para depois da criação da tabela CONTRIBPREVPART, já que a inserção faz referência à esta tabela
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 17.11.2005
Pendência   : 20662, 20664, 20766
Rotina      : ImportaEvolFunc
Alteração   : modificação no tratamento de percentuais ATS, AC, PERICULOSIDADE e ADICIONAL NOTURNO.
              O sistema estava sobrepondo a informação, agora cria histórico.
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 17.11.2005
Pendência   : 20785
Rotina      : bbtnImportaClick
Alteração   : gravação do logtotalprev
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 20.10.2005
Pendência   : 18996, 17307
Rotina      :
Alteração   : registro de admissão e demissão na tabela HISTFUNCPREV  
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 19.10.2005
Pendência   : 20449
Rotina      :
Alteração   : Inclusão do tratamento da data final de filiais TBLOCALDTFIMINI, TBLOCALDTFIMTAM e TBLOCALDTFIMFMT 
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : ImportaEventos, IMPORTADADOSCADASTRAIS
Pendência   : 19924
Data        : 18.10.2005
Alteração   : alteração para inclusão nas tabelas dependente e depentit
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : ImportaEvolFunc
Pendência   : 20160
Data        : 09.09.2005
Alteração   : acertos na importação de cargos e funções para impedir duplicações
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : ImportaEventos
Pendência   : 19842
Data        : 08.08.2005
Alteração   : inclusão da tabela PARTPREVPLAN para testar se já existe a inscrição
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : chamadas da função  TabCriticasCcp.Insere(
Pendência   : 19809
Data        : 01.08.2005
Alteração   : inclusão do parâmetro sidsitfunc
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : ImportaEventos
Pendência   : 19698
Data        : 21.07.2005
Alteração   : modificação na atualização do FLGCOBRA para atualizar como zero(0) apenas
              as contribuições não assocadas ao evento importado
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : chamadas da função  TabCriticasCcp.Insere(
Pendência   : 19809
Data        : 14.07.2005
Alteração   : inclusão do parâmetro sflginterno
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : ImportaDependentes
Pendência   : 17741
Data        : 13.06.2005
Alteração   : reescrevi a rotina para melhorar a procura.
              agora, ao incvés de abrir duas queries com todos os dependentes e
              fazer o balance line, a rotina se baseia no arquivo e faz uma procura preferencial por nom
              já que o sequencial tb pode mudar
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : ImportaEventos
Pendência   :
Data        : 05.05.2005
Alteração   : tratamento para reenscrição
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : ImportaEventos
Pendência   :
Data        : 05.05.2005
Alteração   : tratamento para preenchimento da primeira data de inscrição PARTPREVPLAN.DTINICIOINSC
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Rotina      : ImportaEndereco
Pendência   : 19186
Data        : 04.05.2005
Alteração   : na alteração do endereço, na parte de cidade, incluí o teste de UF para
              casos de cidades com mesmo nome em estados diferentes
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 28.07.2004
Alteração   : modificações gerais Funcef
----------------------------------------------------------------------------------------------------
Autor(a)    : Camille
Data        : 02.07.2003
Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
----------------------------------------------------------------------------------------------------
Rotina      :
Autor(a)    : Leo
Data        : 12/09/2002
Alteração   : substituí as aplaicações da função tiraplique por quotedstr
----------------------------------------------------------------------------------------------------
Augusto 09/10/2002 - Alteração no SQL da QueryDependentes, pendencia 9256
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable, Wwquery,
  wwdblook,  URegra, TREdit, Mask, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid, DBCGrids, fcButton, fcImgBtn, fcShapeBtn,
  fcClearPanel, fcButtonGroup, fcOutlookBar, fcOutlookList, checklst, uTabCriticasCcp,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, DBGrids, uCMFileUtils,
  DBClient, uCMClientDataSet;

type
  TfrmImportaDadosCadastrais = class(TfrmSairAjuda)
    bbtnImporta: TBitBtn;
    OpenDlg: TOpenDialog;
    tblTxt: TwwTable;
    bmPatro: TBatchMove;
    qryTxt: TwwQuery;
    tblDbf: TwwTable;
    qryPatro: TwwQuery;
    qryPatroCombo: TwwQuery;
    qryLayOutArquivo: TwwQuery;
    qryDadosNoBanco: TwwQuery;
    qryLotacao: TwwQuery;
    qrySituacoes: TwwQuery;
    qryTabRubricas: TwwQuery;
    qryTabCargos: TwwQuery;
    qryTabBancos: TwwQuery;
    qryTabNiveis: TwwQuery;
    qryTabOrgao: TwwQuery;
    qryTabSituacoes: TwwQuery;
    bbtnImprimir: TBitBtn;
    dsrubricas: TwwDataSource;
    qryUpdate: TwwQuery;
    tblTabEventosTXT: TwwTable;
    tblTabEventosDBF: TwwTable;
    bMoveTabEventos: TBatchMove;
    ScrollBox1: TScrollBox;
    pgctrlOpcoes: TPageControl;
    ScrollBox2: TScrollBox;
    lblPatrocinadora: TLabel;
    dblkPatrocinadora: TwwDBLookupCombo;
    deDataCob: TCMDateTimePicker;
    lblDataCobranca: TLabel;
    rgTipoChave: TRadioGroup;
    tbsEmpregado: TTabSheet;
    tbsErros: TTabSheet;
    MemoErros: TMemo;
    tbsDivergencias: TTabSheet;
    MemoDivergencias: TMemo;
    qryExisteCargo: TwwQuery;
    qryTabLocal: TwwQuery;
    bbtnCriticas: TBitBtn;
    qryExisteNivel: TwwQuery;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    qryDependentes: TwwQuery;
    sbtnMarcaTudo2: TSpeedButton;
    sbtnDesmarcaTudo2: TSpeedButton;
    GroupBox1: TGroupBox;
    chkMantidos: TCheckBox;
    chkAssistidos: TCheckBox;
    chkCancelados: TCheckBox;
    tbsTabelas: TTabSheet;
    pnlPassos: TPanel;
    lbMensagens: TMemo;
    gbStatus: TGroupBox;
    lblStatus: TLabel;
    pbStatus: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    edEntradaDadosCad: TEdit;
    sbtnDadosCad: TSpeedButton;
    Label3: TLabel;
    edEntradaDependentes: TEdit;
    sbtnDependentes: TSpeedButton;
    Label4: TLabel;
    edEntradaEnderecos: TEdit;
    sbtnEnderecos: TSpeedButton;
    Label5: TLabel;
    edEntradaEvolFunc: TEdit;
    sbtnEvolFunc: TSpeedButton;
    Label6: TLabel;
    edEntradaEventos: TEdit;
    sbtnEventos: TSpeedButton;
    Label7: TLabel;
    edEntradaLotacaoEmp: TEdit;
    sbtnLotacaoEmp: TSpeedButton;
    Label8: TLabel;
    edEntradaDocumentos: TEdit;
    sbtnDocumentos: TSpeedButton;
    Label9: TLabel;
    edEntradaTabCargos: TEdit;
    sbtnTabCargos: TSpeedButton;
    Label10: TLabel;
    edEntradaTabNiveis: TEdit;
    sbtnTabNiveis: TSpeedButton;
    Label11: TLabel;
    edEntradaTabFiliais: TEdit;
    sbtnTabFiliais: TSpeedButton;
    Label12: TLabel;
    edEntradaTabOrgaos: TEdit;
    sbtnTabOrgaos: TSpeedButton;
    Label13: TLabel;
    edEntradaTabSitFunc: TEdit;
    sbtnTabSitFunc: TSpeedButton;
    Label14: TLabel;
    edEntradaTabRubricas: TEdit;
    sbtnTabRubricas: TSpeedButton;
    pnlAtualizaAuto: TPanel;
    CkLstCampos: TCheckListBox;
    Label15: TLabel;
    sbtnMarcarTudo: TSpeedButton;
    sbtnDesmarcarTudo: TSpeedButton;
    Label16: TLabel;
    CkLstInsere: TCheckListBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel1: TPanel;
    bbtnConfirmaAtu: TBitBtn;
    bbtnCancelaAtu: TBitBtn;
    sbtnAtuDadosCad: TSpeedButton;
    sbtnAtuDependentes: TSpeedButton;
    sbtnAtuEnderecos: TSpeedButton;
    sbtnAtuDocumentos: TSpeedButton;
    sbtnAtuEvolFunc: TSpeedButton;
    sbtnAtuEventos: TSpeedButton;
    sbtnAtuLocacaoEmp: TSpeedButton;
    sbtnAtuCargos: TSpeedButton;
    sbtnAtuNiveis: TSpeedButton;
    sbtnAtuFiliais: TSpeedButton;
    sbtnAtuOrgaos: TSpeedButton;
    sbtnAtuSitFunc: TSpeedButton;
    sbtnAtuRubricas: TSpeedButton;
    sbtnAtuAgencias: TSpeedButton;
    Label17: TLabel;
    edEntradaTabAgencias: TEdit;
    sbtnTabAgencias: TSpeedButton;
    Label18: TLabel;
    edEntradaContatosEmp: TEdit;
    sbtnContatosEmp: TSpeedButton;
    sbtnAtuContatosEmp: TSpeedButton;
    qryEvolFunc: TwwQuery;
    qryaux: TwwQuery;
    cdsTxt: TCMClientDataSet;
    procedure bbtnImportaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    function  ConvMes(sMes,sFormato,sIniAno:String):String;
    function  ConvValor(sValor:String):String;
    function  ConvFormatoOracle(sFormato: String):String;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCriticasClick(Sender: TObject);
    procedure dblkPatrocinadoraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnMarcarTudoClick(Sender: TObject);
    procedure sbtnDesmarcarTudoClick(Sender: TObject);
    procedure sbtnMarcaTudo2Click(Sender: TObject);
    procedure sbtnDesmarcaTudo2Click(Sender: TObject);
    procedure bbtnConfirmaAtuClick(Sender: TObject);
    procedure bbtnCancelaAtuClick(Sender: TObject);
    procedure sbtnAtuDadosCadClick(Sender: TObject);
    procedure sbtnAtuDependentesClick(Sender: TObject);
    procedure sbtnAtuEnderecosClick(Sender: TObject);
    procedure sbtnAtuDocumentosClick(Sender: TObject);
    procedure sbtnAtuEvolFuncClick(Sender: TObject);
    procedure sbtnAtuEventosClick(Sender: TObject);
    procedure sbtnAtuLocacaoEmpClick(Sender: TObject);
    procedure sbtnAtuCargosClick(Sender: TObject);
    procedure sbtnAtuNiveisClick(Sender: TObject);
    procedure sbtnAtuFiliaisClick(Sender: TObject);
    procedure sbtnAtuOrgaosClick(Sender: TObject);
    procedure sbtnAtuSitFuncClick(Sender: TObject);
    procedure sbtnAtuRubricasClick(Sender: TObject);
    procedure sbtnAtuAgenciasClick(Sender: TObject);
    procedure sbtnDadosCadClick(Sender: TObject);
    procedure sbtnDependentesClick(Sender: TObject);
    procedure sbtnEnderecosClick(Sender: TObject);
    procedure sbtnDocumentosClick(Sender: TObject);
    procedure sbtnEvolFuncClick(Sender: TObject);
    procedure sbtnEventosClick(Sender: TObject);
    procedure sbtnLotacaoEmpClick(Sender: TObject);
    procedure sbtnTabCargosClick(Sender: TObject);
    procedure sbtnTabNiveisClick(Sender: TObject);
    procedure sbtnTabFiliaisClick(Sender: TObject);
    procedure sbtnTabOrgaosClick(Sender: TObject);
    procedure sbtnTabSitFuncClick(Sender: TObject);
    procedure sbtnTabRubricasClick(Sender: TObject);
    procedure sbtnTabAgenciasClick(Sender: TObject);
    procedure sbtnContatosEmpClick(Sender: TObject);
    procedure sbtnAtuContatosEmpClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    iGrupoCampos : word;
    tblDadosPatro : TwwTable;
  public
    { Public declarations }

    sMesCobranca, sUltMes, sSexo : string;
    cChave : TChave;
    dSeqCritica : Double;
    iDigitoBco  : integer;

    sMesCob : string ;
    iPatro, iDpdIrrfTxt, iCargoTxt, iDpdIrrfCad, iCargoCad : LongInt;
    TabCriticasCcp : TTabCriticasCcp;

    bPrimeiraVez1,
    bPrimeiraVez2 ,
    bPrimeiraVez3 ,
    bPrimeiraVez4 ,
    bPrimeiraVez5 ,
    bPrimeiraVez6 ,
    bPrimeiraVez7 ,
    bPrimeiraVez8 ,
    bPrimeiraVez9 ,
    bPrimeiraVez10,
    bPrimeiraVez11,
    bPrimeiraVez12,
    bPrimeiraVez13,
    bPrimeiraVez14,
    bPrimeiraVez15,

    //cadastro
    batuconta ,
    batunome   ,
    batudatanasc,
    batudataadm ,
    batusexo,
    batudepirrf,
    batucpf,
    batucargo,
    batunivel,
    batuident,
    batuufident,
    batudtexpident,
    batumunnat,
    batunomepai,
    batunomemae,
    batunrmatconj ,
    batutpservtot,
    batutpservnaocred,
    batuemail,

    // Acrescentados por CAMILLE
    bAtuESTCIVIL     ,
    bAtuTPSERVANTERIOR  ,
    bAtuTPSERVPUBLANT   ,
    bAtuTPSERVPRIVANT   ,
    bAtuTPSERVANTREAL   ,
    bAtuFILIAL          ,
    bAtuSITEMPREGADO    ,
    bAtuVINCULACAOFUNC  ,
    bAtuFLGDIRETOR      ,
    bAtuFUNCAO          ,
    bAtuDATADEMISSAO    ,
    bAtuDATAREADMISSAO  ,
    bAtuDATAMORTE       ,
    bAtuNUMDEPSALARIOF  ,
    bAtuNUMDEPTOTAL     ,
    bAtuVALORBASE1      ,
    bAtuVALORBASE2      ,
    bAtuVALORBASE3      ,
    bAtuVALORBASE4      ,
    bAtuVALORBASE5      ,
    bAtuVALORBASE6      ,

    //lotação
    batulocal,
    batuorgao,

    //endereço
    batulogradouro,
    batubairro,
    batucep,
    batucidade,
    batuuf,
    batutelddd,
    batutelefone,

    //evento
    batuevento,
    bInsereEvento,

    //dependentes
    batunomedep,
    batudatanascdep,
    batusexodep,
    batuestcivildep,
    batuindirdep,
    batuindsalfamdep,
    batuindinvalidezdep,
    batudatainiciodep,
    batugraudependdep ,
    binseredep ,


    //evolução funcional
    batucargoef,
    batufuncaoef,
    batuacef,
    batuatsef,
    batuadnotef,
    batupericulef,
    batuinsalubef,


    //agencias / bancos
    batunomeagencia,

    //cargos
    batucodcargo,
    batudesccargo,

    //niveis
    batucodnivel,
    batuvalornivel,
    batupontonivel,
    batuctnivel,

    //locais
    batucodlocal,
    batudesclocal,
    batutipolocal,
    batusigla,
    batucgclocal,
    batuativlocal,
    binserelocal,

    //orgãos
    batucodorgao,
    batudescorgao,
    batulocalorgao,

    //situações
    batucodsituacao,
    batudescsituacao,

    //rubricas
    batucodrubrica   ,
    batudescrubrica,
    batutipoindicador,
    batuincidesalario : boolean;


    // documentos
    bAtuCodDocumento  ,
    bAtuNumDocumento  ,
    bAtuDtExpDocumento,
    bAtuUFDocumento,

    // Contatos
    bAtuNomeContato,
    bAtuEMailContato,
    bAtuCargoContato,
    bAtuSetorContato,
    bAtuNascContato,
    bAtuObsContato,

    bInsereContato,
    bInsereDocumento : boolean;

    binserepart,
    binsereident,
    binserelotacao,
    binsereend,
    binseretelefone,
    binserebanco,
    binsereagencia,
    binserecargo,
    binserenivel,
    binsereorgao,
    binseresituacao,
    binsererubrica    : boolean;

    pProcessoAux : TProcesso;

    procedure ImportaDadosCadastrais;
    procedure ImportaDependentes;
    procedure ImportaEndereco;
    procedure ImportaDocumentos;
    procedure ImportaEvolFunc;
    procedure ImportaEventos;
    procedure ImportaLotacao;
    procedure ImportaContatos;

    procedure ImportaTabelaCargos;
    procedure ImportaTabelaNivel;
    procedure ImportaTabelaLocal;
    procedure ImportaTabelaOrgao;
    procedure ImportaTabelaSituacoes;
    procedure ImportaTabelaRubricas;
    procedure ImportaTabelaBanco;

    function  IncluiDecimal(Valor:String;TipoSeparador:String;NumDecimais:Integer):String;
    function  Troca_Plique(s : string) : string;
    function  TiraCaracteres( s : String) : String;
    function  TiraPlique( s : String) : String;
    function  VoltaFlgInterno( qry : Twwquery ; sIdPessjur , sIdPessoa : String; var sTipoSit : String) : String;
    function  IniciaTratCriticas : boolean;
    procedure MontaListaCampos ( piGrupoCampos : word ); // iGrupoCampos =
                                                        //  ( 1 = Dados Cadastrais
                                                        //    2 = Dependentes
                                                        //    3 = Enderecos
                                                        //    4 = Documentos
                                                        //    5 = Evolucao Funcional
                                                        //    6 = Eventos
                                                        //    7 = Lotacao
                                                        //    8 = Cargo
                                                        //    9 = Nivel
                                                        //   10 = Filial
                                                        //   11 = Orgao
                                                        //   12 = Situacao
                                                        //   13 = Rubricas
                                                        //   14 = Agencias
                                                        //   15 = Contatos
                                                        //  )

    procedure SetaSelecionados ( piGrupoCampos : word );
    procedure ZeraVar;
    function  CompletaString(sEnt, sComp : String; nTam : Integer ; bDireita : Boolean ) : String;
    function  FormataDataArquivo ( sData, sFormato : string ) : String;


    function AbreQryLayOutArquivo : boolean;
    function CriaTabelaPDX            (sNomeArquivo : string; const sTabela: String; var T: TwwTable) : boolean;
    function ExcluiTabelaPDX          (sNomeArquivo : string; const sTabela: String; var T : TwwTable): boolean;
    function DefineEstruturaTabelaPDX (var T: TwwTable)                        : boolean;
    function CarregaTabelaPDX         (sNomeArquivo : string; var T: TwwTable)                        : boolean;
    function ProcessaArquivo : boolean;
    function InsereDocumento  : boolean;


  end;

var
  frmImportaDadosCadastrais: TfrmImportaDadosCadastrais;

        bCad        ,
        bDependentes,
        bEnd        ,
        bDocumentos ,
        bEvolFunc   ,
        bEventos    ,
        bLotacoes   ,
        bContatos    ,

        bCargos     ,
        bNiveis     ,
        bLocais     ,
        bOrgaos     ,
        bSit        ,
        bRubricas   ,
        bAgencias     : boolean;

implementation

uses UMensErro, UAdmPrev,UDataBase, USistema, UAutorizacao,
     DBaseDados, UModulo, fAguarde, UFuncoesUteis, UCCP,Uinterface,
     UContribInterf, DContribInterf,
     FCadInterfacePatro, FConsCriticasCcp1 ;

{$R *.DFM}

function TfrmImportaDadosCadastrais.FormataDataArquivo (sData, sFormato : string ) : String;
var dData : TDateTime;
    i     : word;
    sLetra,
    sSeparador  : string;
    tmpShortDateFormat : string;
begin
   Result := '';
   if Trim(sData) = '' then Exit;

   // Verificar caracter separador
   for i := 1 to Length(sFormato) do
   begin
      sLetra := Copy(sFormato, i, 1);
      if (LowerCase(sLetra) <> 'd') and (LowerCase(sLetra) <> 'm') and (LowerCase(sLetra) <> 'y')
      then begin
         sSeparador := sLetra;
         break;
      end;
   end;

   if sSeparador <> '/'
   then begin
      for i := 1 to Length(sData) do
      begin
         sLetra := Copy(sData, i, 1);
         if sLetra = sSeparador then sFormato := Copy(sFormato,1,i-1)+'/'+Copy(sFormato,i+1, Length(sFormato));
         if sLetra = sSeparador then sData    := Copy(sData,1,i-1)   +'/'+Copy(sData   ,i+1, Length(sData));
      end;
   end;

   try
      tmpShortDateFormat := ShortDateFormat;
      ShortDateFormat    := sFormato;
      dData              := StrToDate(sData);
      Result             := FormatDateTime('dd/mm/yyyy', dData); 
   finally
      ShortDateFormat    := tmpShortDateFormat;
   end;
end;

function TfrmImportaDadosCadastrais.ExcluiTabelaPDX(sNomeArquivo : string; const sTabela: String; var T : TwwTable): Boolean;
begin
   Result := True;
   try
      if FileExists(ExtractFilePath(sNomeArquivo)+ sTabela)
      then begin
         (* exclui a tabela *)
         Result := DeleteFile(ExtractFilePath(sNomeArquivo)+sTabela);
      end;
   except
      Result := False;
   end;

end;

function TfrmImportaDadosCadastrais.CriaTabelaPDX(sNomeArquivo : string; const sTabela: String; var T: TwwTable): Boolean;
begin
   Result := False;
   try
      T := TwwTable.Create(Application);
      T.Active       := False;
      T.DataBaseName := Copy(ExtractFilePath(sNomeArquivo), 1, Length(ExtractFilePath(sNomeArquivo)) - 1);
      T.TableType    := ttParadox;
      T.TableName    := sTabela;
   except
      exit;
   end;
   Result := True;
end;

function TfrmImportaDadosCadastrais.DefineEstruturaTabelaPDX(var T: TwwTable): Boolean;
begin
   Result := True;

      try
         (* define a estrutura da tabela *)
         T.FieldDefs.Clear;

         if bCad
         then begin
            T.FieldDefs.Add('MATRICULA',          ftString,  qryLayOutArquivo.FieldByName('DCMATRICULATAM').AsInteger,    False);
            T.FieldDefs.Add('MATRICULAC',         ftString,  qryLayOutArquivo.FieldByName('DCNRMATCONJTAM').AsInteger,    False);
            T.FieldDefs.Add('BANCO',              ftString,  qryLayOutArquivo.FieldByName('DCBANCOTAM').AsInteger,        False);
            T.FieldDefs.Add('AGENCIA',            ftString,  qryLayOutArquivo.FieldByName('DCAGENCIATAM').AsInteger,      False);
            T.FieldDefs.Add('CCORRENTE',          ftString,  qryLayOutArquivo.FieldByName('DCCCTAM').AsInteger,           False);
            T.FieldDefs.Add('NOME',               ftString,  qryLayOutArquivo.FieldByName('DCEMPREGTAM').AsInteger,       False);
            T.FieldDefs.Add('ADMISSAO',           ftString,  qryLayOutArquivo.FieldByName('DCDTADMTAM').AsInteger,        False);
            T.FieldDefs.Add('NASCIMENTO',         ftString,  qryLayOutArquivo.FieldByName('DCDTNASCTAM').AsInteger,       False);
            T.FieldDefs.Add('DATAMORTE',          ftString,  qryLayOutArquivo.FieldByName('DCDTMORTETAM').AsInteger,      False);
            T.FieldDefs.Add('SEXO',               ftString,  qryLayOutArquivo.FieldByName('DCSEXOTAM').AsInteger,         False);
            T.FieldDefs.Add('ESTCIVIL',           ftString,  qryLayOutArquivo.FieldByName('DCESTCIVILTAM').AsInteger,     False);
            T.FieldDefs.Add('IRRF',               ftString,  qryLayOutArquivo.FieldByName('DCDEPENDTAM').AsInteger,       False);
            T.FieldDefs.Add('CPF',                ftString,  qryLayOutArquivo.FieldByName('DCCPFTAM').AsInteger,          False);
            T.FieldDefs.Add('NIVEL',              ftString,  qryLayOutArquivo.FieldByName('DCNIVELTAM').AsInteger,        False);
            T.FieldDefs.Add('CARGO',              ftString,  qryLayOutArquivo.FieldByName('DCCARGOTAM').AsInteger,        False);
            T.FieldDefs.Add('NOMEPAI',            ftString,  qryLayOutArquivo.FieldByName('DCNMPAITAM').AsInteger,        False);
            T.FieldDefs.Add('NOMEMAE',            ftString,  qryLayOutArquivo.FieldByName('DCNMMAETAM').AsInteger,        False);
            T.FieldDefs.Add('QTTPTOT',            ftString,  qryLayOutArquivo.FieldByName('DCTPSERVTOTTAM').AsInteger,    False);
            T.FieldDefs.Add('QTTPNCRED',          ftString,  qryLayOutArquivo.FieldByName('DCTPNAOCREDTAM').AsInteger,    False);
            T.FieldDefs.Add('TPSERVANT',          ftString,  qryLayOutArquivo.FieldByName('DCTPSERVANTTAM').AsInteger,    False);
            T.FieldDefs.Add('NUMFILIAL',          ftString,  qryLayOutArquivo.FieldByName('DCIDESTABTAM').AsInteger,      False);
            T.FieldDefs.Add('IDSITFUNC',          ftString,  qryLayOutArquivo.FieldByName('DCIDSITFUNCTAM').AsInteger,    False);
            T.FieldDefs.Add('DTDEMISSAO',         ftString,  qryLayOutArquivo.FieldByName('DCDTDEMISSAOTAM').AsInteger,   False);
            T.FieldDefs.Add('TPPUBLANT',          ftString,  qryLayOutArquivo.FieldByName('DCTPSERVPUBANTTAM').AsInteger, False);
            T.FieldDefs.Add('TPPRIVANT',          ftString,  qryLayOutArquivo.FieldByName('DCTPSERVPRVANTTAM').AsInteger, False);
            T.FieldDefs.Add('FLGDIRETOR',         ftString,  qryLayOutArquivo.FieldByName('DCFLGDIRETORTAM').AsInteger,   False);
            T.FieldDefs.Add('TPSERVREAL',         ftString,  qryLayOutArquivo.FieldByName('DCTPSRVANTREALTAM').AsInteger, False);
            T.FieldDefs.Add('FUNCAO',             ftString,  qryLayOutArquivo.FieldByName('DCIDFUNCAOTAM').AsInteger,     False);
            T.FieldDefs.Add('DTREADMIS',          ftString,  qryLayOutArquivo.FieldByName('DCDTREADMISSAOTAM').AsInteger, False);
            T.FieldDefs.Add('VINCFUNC',           ftString,  qryLayOutArquivo.FieldByName('DCCDVINCFUNCTAM').AsInteger,   False);
            T.FieldDefs.Add('NUMIDENT',           ftString,  qryLayOutArquivo.FieldByName('DCIDENTTAM').AsInteger,        False);
            T.FieldDefs.Add('UFIDENT',            ftString,  qryLayOutArquivo.FieldByName('DCUFIDENTTAM').AsInteger,      False);
            T.FieldDefs.Add('DTEXPIDENT',         ftString,  qryLayOutArquivo.FieldByName('DCDTEXPIDENTTAM').AsInteger,   False);
            T.FieldDefs.Add('CDMUNNAT',           ftString,  qryLayOutArquivo.FieldByName('DCCODMUNNATTAM').AsInteger,    False);
            T.FieldDefs.Add('INSCRICAO',          ftString,  qryLayOutArquivo.FieldByName('DCINSCRICAOTAM').AsInteger,    False);
            T.FieldDefs.Add('FATORJOIA',          ftString,  qryLayOutArquivo.FieldByName('DCFATORJOIATAM').AsInteger,    False);
            T.FieldDefs.Add('VALORBASE1',         ftString,  qryLayOutArquivo.FieldByName('DCVALORBASE1TAM').AsInteger,   False);
            T.FieldDefs.Add('VALORBASE2',         ftString,  qryLayOutArquivo.FieldByName('DCVALORBASE2TAM').AsInteger,   False);
            T.FieldDefs.Add('VALORBASE3',         ftString,  qryLayOutArquivo.FieldByName('DCVALORBASE3TAM').AsInteger,   False);
            T.FieldDefs.Add('VALORBASE4',         ftString,  qryLayOutArquivo.FieldByName('DCVALORBASE4TAM').AsInteger,   False);
            T.FieldDefs.Add('VALORBASE5',         ftString,  qryLayOutArquivo.FieldByName('DCVALORBASE5TAM').AsInteger,   False);
            T.FieldDefs.Add('VALORBASE6',         ftString,  qryLayOutArquivo.FieldByName('DCVALORBASE6TAM').AsInteger,   False);
            T.FieldDefs.Add('NDEPSALF',           ftString,  qryLayOutArquivo.FieldByName('DCNUMDEPSALFAMTAM').AsInteger, False);
            T.FieldDefs.Add('NDEPTOT',            ftString,  qryLayOutArquivo.FieldByName('DCNUMDEPTAM').AsInteger,       False);
            T.FieldDefs.Add('IDPESSOA',         ftString,  qryLayOutArquivo.FieldByName('DCIDPESSOATAM').AsInteger,     False);
            T.FieldDefs.Add('IDPLANO',        ftString,  qryLayOutArquivo.FieldByName('DCIDPLANOPREVTAM').AsInteger,     False);
            T.FieldDefs.Add('EMAIL',        ftString,  qryLayOutArquivo.FieldByName('DCEMAILTAM').AsInteger,     False);            
         end
         else if bEnd
         then begin
            T.FieldDefs.Add('MATRICULA',          ftString,  qryLayOutArquivo.FieldByName('EDMATRICULATAM').AsInteger,    False);
            T.FieldDefs.Add('INSCRICAO',          ftString,  qryLayOutArquivo.FieldByName('EDINSCRICAOTAM').AsInteger,    False);
            T.FieldDefs.Add('LOGRADOURO',         ftString,  qryLayOutArquivo.FieldByName('EDLOGRADOUROTAM').AsInteger,   False);
            T.FieldDefs.Add('BAIRRO',             ftString,  qryLayOutArquivo.FieldByName('EDBAIRROTAM').AsInteger,       False);
            T.FieldDefs.Add('CEP',                ftString,  qryLayOutArquivo.FieldByName('EDCEPTAM').AsInteger,          False);
            T.FieldDefs.Add('MUNICIPIO',          ftString,  qryLayOutArquivo.FieldByName('EDMUNICIPIOTAM').AsInteger,    False);
            T.FieldDefs.Add('UF',                 ftString,  qryLayOutArquivo.FieldByName('EDUFTAM').AsInteger,           False);
            T.FieldDefs.Add('DDD',              ftString,  qryLayOutArquivo.FieldByName('EDTELDDDTAM').AsInteger,     False);
            T.FieldDefs.Add('TELEFONE',           ftString,  qryLayOutArquivo.FieldByName('EDTELEFONETAM').AsInteger,     False);
            T.FieldDefs.Add('IDPESSOA',         ftString,  qryLayOutArquivo.FieldByName('EDIDPESSOATAM').AsInteger,     False);
            T.FieldDefs.Add('IDPLANO',        ftString,  qryLayOutArquivo.FieldByName('EDIDPLANOPREVTAM').AsInteger,     False);
         end
         else if bDocumentos
         then begin
            T.FieldDefs.Add('IDDOCUMENT',        ftString, qryLayOutArquivo.FieldByName('DOIDDOCUMENTAM').AsInteger,     False);
            T.FieldDefs.Add('MATRICULA',          ftString,  qryLayOutArquivo.FieldByName('DOMATRICULATAM').AsInteger,    False);
            T.FieldDefs.Add('NDOCUMENTO',       ftString,  qryLayOutArquivo.FieldByName('DONUMEROTAM').AsInteger,       False);
            T.FieldDefs.Add('ORGAO',              ftString,  qryLayOutArquivo.FieldByName('DOORGAOTAM').AsInteger,        False);
            T.FieldDefs.Add('UF',                 ftString,  qryLayOutArquivo.FieldByName('DOUFTAM').AsInteger,           False);
            T.FieldDefs.Add('DTEMISSAO',        ftString,  qryLayOutArquivo.FieldByName('DOEMISSAOTAM').AsInteger,      False);
            T.FieldDefs.Add('DTVALIDADE',       ftString,  qryLayOutArquivo.FieldByName('DOVALIDADETAM').AsInteger,     False);
            T.FieldDefs.Add('IDPESSOA',         ftString,  qryLayOutArquivo.FieldByName('DOIDPESSOATAM').AsInteger,     False);
            T.FieldDefs.Add('IDPLANO',        ftString,  qryLayOutArquivo.FieldByName('DOIDPLANOPREVTAM').AsInteger,     False);
         end
         else if bContatos
         then begin
            T.FieldDefs.Add('MATRICULA',          ftString,  qryLayOutArquivo.FieldByName('CTMATRICULATAM').AsInteger,    False);
            T.FieldDefs.Add('NOME',               ftString,  qryLayOutArquivo.FieldByName('CTNOMETAM').AsInteger,         False);
            T.FieldDefs.Add('EMAIL',              ftString,  qryLayOutArquivo.FieldByName('CTEMAILTAM').AsInteger,        False);
            T.FieldDefs.Add('CARGO',              ftString,  qryLayOutArquivo.FieldByName('CTCARGOTAM').AsInteger,        False);
            T.FieldDefs.Add('SETOR',              ftString,  qryLayOutArquivo.FieldByName('CTSETORTAM').AsInteger,        False);
            T.FieldDefs.Add('NASCIMENTO',         ftString,  qryLayOutArquivo.FieldByName('CTNASCTAM').AsInteger,         False);
            T.FieldDefs.Add('OBS',                ftString,  qryLayOutArquivo.FieldByName('CTOBSTAM').AsInteger,          False);
         end
         else if bDependentes
         then begin
            T.FieldDefs.Add('FLGINVALID',        ftString,  qryLayOutArquivo.FieldByName('DPINVALIDDPDTAM').AsInteger,    False);
            T.FieldDefs.Add('NOME',              ftString,  qryLayOutArquivo.FieldByName('DPNOMEDPDTAM').AsInteger,       False);
            T.FieldDefs.Add('DATANASC',          ftString,  qryLayOutArquivo.FieldByName('DPDTNASCDPDTAM').AsInteger,     False);
            T.FieldDefs.Add('SEXO',              ftString,  qryLayOutArquivo.FieldByName('DPSEXODPDTAM').AsInteger,       False);
            T.FieldDefs.Add('ESTCIVIL',          ftString,  qryLayOutArquivo.FieldByName('DPESTCIVILDPDTAM').AsInteger,   False);
            T.FieldDefs.Add('DATAINICIO',        ftString,  qryLayOutArquivo.FieldByName('DPDTDPDTAM').AsInteger,         False);
            T.FieldDefs.Add('FLGSALFAM',         ftString,  qryLayOutArquivo.FieldByName('DPSALFAMDPDTAM').AsInteger,     False);
            T.FieldDefs.Add('TPRELDPD',          ftString,  qryLayOutArquivo.FieldByName('DPRELDPDTAM').AsInteger,        False);
            T.FieldDefs.Add('SEQDEP',            ftInteger,  0,                                                           False);
            T.FieldDefs.Add('MATRICULA',         ftString,  qryLayOutArquivo.FieldByName('DPMATRICULATAM').AsInteger,     False);
            T.FieldDefs.Add('INSCRICAO',         ftString,  qryLayOutArquivo.FieldByName('DPINSCRICAOTAM').AsInteger,     False);
            T.FieldDefs.Add('FLGCONTAIR',        ftString,  qryLayOutArquivo.FieldByName('DPIRDPDTAM').AsInteger,     False);
            T.FieldDefs.Add('FLGCONTASF',        ftString,  qryLayOutArquivo.FieldByName('DPSALFAMDPDTAM').AsInteger,     False);
            T.FieldDefs.Add('IDPESSOA',         ftString,  qryLayOutArquivo.FieldByName('DPIDPESSOATAM').AsInteger,     False);
            T.FieldDefs.Add('IDPLANO',        ftString,  qryLayOutArquivo.FieldByName('DPIDPLANOPREVTAM').AsInteger,     False);
         end
         else if bEvolFunc
         then begin
            T.FieldDefs.Add('MATRICULA',        ftString,  qryLayOutArquivo.FieldByName('EFMATRICULATAM').AsInteger,    False);
            T.FieldDefs.Add('INSCRICAO',              ftString,  qryLayOutArquivo.FieldByName('EFINSCRICAOTAM').AsInteger,       False);
            T.FieldDefs.Add('CARGO',          ftString,  qryLayOutArquivo.FieldByName('EFCARGOTAM').AsInteger,     False);
            T.FieldDefs.Add('DTINICARGO',          ftDate,  0,   False); 
            T.FieldDefs.Add('DTINIFORMATO',        ftString,  length(qryLayOutArquivo.FieldByName('EFDTINIFORMATO').AsString),         False);
            T.FieldDefs.Add('DTFIMCARGO',         ftString,  qryLayOutArquivo.FieldByName('EFDTFIMCARGOTAM').AsInteger,     False);
            T.FieldDefs.Add('DTFIMFORMATO',          ftString,  length(qryLayOutArquivo.FieldByName('EFDTFIMFORMATO').AsString),        False);
            T.FieldDefs.Add('PCADIC',         ftString,  qryLayOutArquivo.FieldByName('EFPCADICTAM').AsInteger,     False);
            T.FieldDefs.Add('IDPESSOA',         ftString,  qryLayOutArquivo.FieldByName('EFIDPESSOATAM').AsInteger,     False);
            T.FieldDefs.Add('IDPLANO',        ftString,  qryLayOutArquivo.FieldByName('EFIDPLANOPREVTAM').AsInteger,     False);
            T.FieldDefs.Add('TIPOREG',        ftString,  qryLayOutArquivo.FieldByName('EFTIPOREGTAM').AsInteger,     False);
            T.FieldDefs.Add('MODO',        ftString,  qryLayOutArquivo.FieldByName('EFMODOTAM').AsInteger,     False);
            T.FieldDefs.Add('QTDEMIN',        ftString,  qryLayOutArquivo.FieldByName('EFQTDEMINTAM').AsInteger,     False);
         end
         else if bEventos
         then begin
            T.FieldDefs.Add('MATRICULA',        ftString,  qryLayOutArquivo.FieldByName('EVMATRICULATAM').AsInteger,    False);
            T.FieldDefs.Add('INSCRICAO',              ftString,  qryLayOutArquivo.FieldByName('EVINSCRICAOTAM').AsInteger,       False);
            T.FieldDefs.Add('IDPESSOA',         ftString,  qryLayOutArquivo.FieldByName('EVIDPESSOATAM').AsInteger,     False);
            T.FieldDefs.Add('IDPLANO',        ftString,  qryLayOutArquivo.FieldByName('EVIDPLANOPREVTAM').AsInteger,     False);
            T.FieldDefs.Add('EVENTO',        ftString,  qryLayOutArquivo.FieldByName('EVEVENTOTAM').AsInteger,     False);
            T.FieldDefs.Add('SITFUNC',        ftString,  qryLayOutArquivo.FieldByName('EVSITFUNCTAM').AsInteger,     False);
            T.FieldDefs.Add('SITPART',        ftString,  qryLayOutArquivo.FieldByName('EVSITPARTTAM').AsInteger,     False);
            T.FieldDefs.Add('SITPLANO',        ftString,  qryLayOutArquivo.FieldByName('EVSITPLANOTAM').AsInteger,     False);
            T.FieldDefs.Add('DATAINI',        ftString,  qryLayOutArquivo.FieldByName('EVDTINIINI').AsInteger,     False);
            T.FieldDefs.Add('TAXA',        ftString,  qryLayOutArquivo.FieldByName('EVTAXAINI').AsInteger,     False);            
         end
         else if bRubricas then
         begin
            T.FieldDefs.Add('CODIGO',        ftString,  qryLayOutArquivo.FieldByName('TBRUBCODIGOTAM').AsInteger,    False);
            T.FieldDefs.Add('DESCRICAO',              ftString,  qryLayOutArquivo.FieldByName('TBRUBDESCRICAOTAM').AsInteger,       False);
            T.FieldDefs.Add('TIPO',         ftString,  qryLayOutArquivo.FieldByName('TBRUBTIPOTAM').AsInteger,     False);
            T.FieldDefs.Add('INDICE',        ftString,  qryLayOutArquivo.FieldByName('TBRUBINCIDETAM').AsInteger,     False);
         end
         else if bAgencias then
         begin
            T.FieldDefs.Add('BANCO',        ftString,  qryLayOutArquivo.FieldByName('TBBANCOTAM').AsInteger,    False);
            T.FieldDefs.Add('DESCRBANCO',              ftString,  qryLayOutArquivo.FieldByName('TBBBDESCRICAOTAM').AsInteger,       False);
            T.FieldDefs.Add('AGENCIA',         ftString,  qryLayOutArquivo.FieldByName('TBAGENCIATAM').AsInteger,     False);
            T.FieldDefs.Add('DESCRAGENC',        ftString,  qryLayOutArquivo.FieldByName('TBAGDESCRICAOTAM').AsInteger,     False);
         end
         else if bLocais then
         begin
            T.FieldDefs.Add('LOCAL',        ftString,  qryLayOutArquivo.FieldByName('TBLOCALCODTAM').AsInteger,    False);
            T.FieldDefs.Add('NOME',              ftString,  qryLayOutArquivo.FieldByName('TBLOCALDESCTAM').AsInteger,       False);
            T.FieldDefs.Add('TIPO',        ftString,  qryLayOutArquivo.FieldByName('TBLOCALTIPOTAM').AsInteger,    False);
            T.FieldDefs.Add('SIGLA',        ftString,  qryLayOutArquivo.FieldByName('TBLOCALSIGLATAM').AsInteger,    False);
            T.FieldDefs.Add('CGC',              ftString,  qryLayOutArquivo.FieldByName('TBLOCALCGCTAM').AsInteger,       False);
            T.FieldDefs.Add('DATAFIM',              ftString,  qryLayOutArquivo.FieldByName('TBLOCALDTFIMTAM').AsInteger,       False);
         end;


         (* cria efetivamente a tabela *)
         if T.Active then T.Close;
         T.CreateTable;
         T.Open;
      except
         Result := False;
      end;(* try..except *)

end;

function TfrmImportaDadosCadastrais.CarregaTabelaPDX (sNomeArquivo : string; var T : TwwTable) : Boolean;
var Arquivo : TextFile;
    sLinha  : string;
    iTam, iInicio : word;
    sIdpessoa : string;
    scargo : string;
begin
    try
    Result := False;
    AssignFile(Arquivo, sNomeArquivo);
    Reset(Arquivo);
    while not Eof(Arquivo) do
    begin
       with qryLayOutArquivo do
       begin
          Readln(Arquivo, sLinha);
          T.Append;

          if bCad
          then begin
             T.FieldByName('MATRICULA').AsString             := Copy(sLinha, FieldByName('DCMATRICULAINI').AsInteger + 1,    FieldByName('DCMATRICULATAM').AsInteger);
             T.FieldByName('MATRICULAC').AsString            := Copy(sLinha, FieldByName('DCNRMATCONJINI').AsInteger + 1,    FieldByName('DCNRMATCONJTAM').AsInteger);
             T.FieldByName('BANCO').AsString                 := Copy(sLinha, FieldByName('DCBANCOINI').AsInteger + 1,        FieldByName('DCBANCOTAM').AsInteger);
             T.FieldByName('AGENCIA').AsString               := Copy(sLinha, FieldByName('DCAGENCIAINI').AsInteger + 1,      FieldByName('DCAGENCIATAM').AsInteger);
             T.FieldByName('CCORRENTE').AsString             := Copy(sLinha, FieldByName('DCCCINI').AsInteger + 1,           FieldByName('DCCCTAM').AsInteger);
             T.FieldByName('NOME').AsString                  := Copy(sLinha, FieldByName('DCEMPREGINI').AsInteger + 1,       FieldByName('DCEMPREGTAM').AsInteger);
             T.FieldByName('SEXO').AsString                  := Copy(sLinha, FieldByName('DCSEXOINI').AsInteger + 1,         FieldByName('DCSEXOTAM').AsInteger);
             T.FieldByName('ESTCIVIL').AsString              := Copy(sLinha, FieldByName('DCESTCIVILINI').AsInteger + 1,     FieldByName('DCESTCIVILTAM').AsInteger);
             T.FieldByName('IRRF').AsString                  := Copy(sLinha, FieldByName('DCDEPENDINI').AsInteger + 1,       FieldByName('DCDEPENDTAM').AsInteger);
             T.FieldByName('CPF').AsString                   := Copy(sLinha, FieldByName('DCCPFINI').AsInteger + 1,          FieldByName('DCCPFTAM').AsInteger);
             T.FieldByName('NIVEL').AsString                 := Copy(sLinha, FieldByName('DCNIVELINI').AsInteger + 1,        FieldByName('DCNIVELTAM').AsInteger);
             T.FieldByName('CARGO').AsString                 := Copy(sLinha, FieldByName('DCCARGOINI').AsInteger + 1,        FieldByName('DCCARGOTAM').AsInteger);
             T.FieldByName('NOMEPAI').AsString               := Copy(sLinha, FieldByName('DCNMPAIINI').AsInteger + 1,        FieldByName('DCNMPAITAM').AsInteger);
             T.FieldByName('NOMEMAE').AsString               := Copy(sLinha, FieldByName('DCNMMAEINI').AsInteger + 1,        FieldByName('DCNMMAETAM').AsInteger);
             T.FieldByName('QTTPTOT').AsString               := Copy(sLinha, FieldByName('DCTPSERVTOTINI').AsInteger + 1,    FieldByName('DCTPSERVTOTTAM').AsInteger);
             T.FieldByName('QTTPNCRED').AsString             := Copy(sLinha, FieldByName('DCTPNAOCREDINI').AsInteger + 1,    FieldByName('DCTPNAOCREDTAM').AsInteger);
             T.FieldByName('TPSERVANT').AsString             := Copy(sLinha, FieldByName('DCTPSERVANTINI').AsInteger + 1,    FieldByName('DCTPSERVANTTAM').AsInteger);
             T.FieldByName('NUMFILIAL').AsString             := Copy(sLinha, FieldByName('DCIDESTABINI').AsInteger + 1,      FieldByName('DCIDESTABTAM').AsInteger);
             T.FieldByName('IDSITFUNC').AsString             := Copy(sLinha, FieldByName('DCIDSITFUNCINI').AsInteger + 1,    FieldByName('DCIDSITFUNCTAM').AsInteger);
             T.FieldByName('TPPUBLANT').AsString             := Copy(sLinha, FieldByName('DCTPSERVPUBANTINI').AsInteger + 1, FieldByName('DCTPSERVPUBANTTAM').AsInteger);
             T.FieldByName('TPPRIVANT').AsString             := Copy(sLinha, FieldByName('DCTPSERVPRVANTINI').AsInteger + 1, FieldByName('DCTPSERVPRVANTTAM').AsInteger);
             T.FieldByName('FLGDIRETOR').AsString            := Copy(sLinha, FieldByName('DCFLGDIRETORINI').AsInteger + 1,   FieldByName('DCFLGDIRETORTAM').AsInteger);
             T.FieldByName('TPSERVREAL').AsString            := Copy(sLinha, FieldByName('DCTPSRVANTREALINI').AsInteger + 1, FieldByName('DCTPSRVANTREALTAM').AsInteger);
             T.FieldByName('FUNCAO').AsString                := Copy(sLinha, FieldByName('DCIDFUNCAOINI').AsInteger + 1,     FieldByName('DCIDFUNCAOTAM').AsInteger);
             T.FieldByName('VINCFUNC').AsString              := Copy(sLinha, FieldByName('DCCDVINCFUNCINI').AsInteger + 1,   FieldByName('DCCDVINCFUNCTAM').AsInteger);
             T.FieldByName('NUMIDENT').AsString              := Copy(sLinha, FieldByName('DCIDENTINI').AsInteger + 1,        FieldByName('DCIDENTTAM').AsInteger);
             T.FieldByName('UFIDENT').AsString               := Copy(sLinha, FieldByName('DCUFIDENTINI').AsInteger + 1,      FieldByName('DCUFIDENTTAM').AsInteger);
             T.FieldByName('CDMUNNAT').AsString              := Copy(sLinha, FieldByName('DCCODMUNNATINI').AsInteger + 1,    FieldByName('DCCODMUNNATTAM').AsInteger);
             T.FieldByName('INSCRICAO').AsString             := Copy(sLinha, FieldByName('DCINSCRICAOINI').AsInteger + 1,    FieldByName('DCINSCRICAOTAM').AsInteger);
             T.FieldByName('FATORJOIA').AsString             := Copy(sLinha, FieldByName('DCFATORJOIAINI').AsInteger + 1,    FieldByName('DCFATORJOIATAM').AsInteger);
             T.FieldByName('VALORBASE1').AsString            := Copy(sLinha, FieldByName('DCVALORBASE1INI').AsInteger + 1,   FieldByName('DCVALORBASE1TAM').AsInteger);
             T.FieldByName('VALORBASE2').AsString            := Copy(sLinha, FieldByName('DCVALORBASE2INI').AsInteger + 1,   FieldByName('DCVALORBASE2TAM').AsInteger);
             T.FieldByName('VALORBASE3').AsString            := Copy(sLinha, FieldByName('DCVALORBASE3INI').AsInteger + 1,   FieldByName('DCVALORBASE3TAM').AsInteger);
             T.FieldByName('VALORBASE4').AsString            := Copy(sLinha, FieldByName('DCVALORBASE4INI').AsInteger + 1,   FieldByName('DCVALORBASE4TAM').AsInteger);
             T.FieldByName('VALORBASE5').AsString            := Copy(sLinha, FieldByName('DCVALORBASE5INI').AsInteger + 1,   FieldByName('DCVALORBASE5TAM').AsInteger);
             T.FieldByName('VALORBASE6').AsString            := Copy(sLinha, FieldByName('DCVALORBASE6INI').AsInteger + 1,   FieldByName('DCVALORBASE6TAM').AsInteger);
             T.FieldByName('NDEPSALF').AsString              := Copy(sLinha, FieldByName('DCNUMDEPSALFAMINI').AsInteger + 1, FieldByName('DCNUMDEPSALFAMTAM').AsInteger);
             T.FieldByName('NDEPTOT').AsString               := Copy(sLinha, FieldByName('DCNUMDEPINI').AsInteger + 1,       FieldByName('DCNUMDEPTAM').AsInteger);
             T.FieldByName('DATAMORTE').AsString             := Copy(sLinha, FieldByName('DCDTMORTEINI').AsInteger + 1,      FieldByName('DCDTMORTETAM').AsInteger);
             T.FieldByName('DTEXPIDENT').AsString            := Copy(sLinha, FieldByName('DCDTEXPIDENTINI').AsInteger + 1,   FieldByName('DCDTEXPIDENTTAM').AsInteger);
             T.FieldByName('DTREADMIS').AsString             := Copy(sLinha, FieldByName('DCDTREADMISSAOINI').AsInteger + 1, FieldByName('DCDTREADMISSAOTAM').AsInteger);
             T.FieldByName('DTDEMISSAO').AsString            := Copy(sLinha, FieldByName('DCDTDEMISSAOINI').AsInteger + 1,   FieldByName('DCDTDEMISSAOTAM').AsInteger);
             T.FieldByName('ADMISSAO').AsString              := Copy(sLinha, FieldByName('DCDTADMINI').AsInteger + 1,        FieldByName('DCDTADMTAM').AsInteger);
             T.FieldByName('NASCIMENTO').AsString            := Copy(sLinha, FieldByName('DCDTNASCINI').AsInteger + 1,       FieldByName('DCDTNASCTAM').AsInteger);
             T.FieldByName('IDPESSOA').AsString              := Copy(sLinha, FieldByName('DCIDPESSOAINI').AsInteger + 1,        FieldByName('DCIDPESSOATAM').AsInteger);
             T.FieldByName('IDPLANO').AsString           := Copy(sLinha, FieldByName('DCIDPLANOPREVINI').AsInteger + 1,    FieldByName('DCIDPLANOPREVTAM').AsInteger);
             T.FieldByName('EMAIL').AsString           := Copy(sLinha, FieldByName('DCEMAILINI').AsInteger + 1,    FieldByName('DCEMAILTAM').AsInteger);             
          end
          else if bEnd
          then begin
             T.FieldByName('MATRICULA').AsString             := Copy(sLinha, FieldByName('EDMATRICULAINI').AsInteger + 1,    FieldByName('EDMATRICULATAM').AsInteger);
             T.FieldByName('INSCRICAO').AsString             := Copy(sLinha, FieldByName('EDINSCRICAOINI').AsInteger + 1,    FieldByName('EDINSCRICAOTAM').AsInteger);
             T.FieldByName('LOGRADOURO').AsString            := Copy(sLinha, FieldByName('EDLOGRADOUROINI').AsInteger + 1,   FieldByName('EDLOGRADOUROTAM').AsInteger);
             T.FieldByName('BAIRRO').AsString                := Copy(sLinha, FieldByName('EDBAIRROINI').AsInteger + 1,       FieldByName('EDBAIRROTAM').AsInteger);
             T.FieldByName('CEP').AsString                   := Copy(sLinha, FieldByName('EDCEPINI').AsInteger + 1,          FieldByName('EDCEPTAM').AsInteger);
             T.FieldByName('MUNICIPIO').AsString             := Copy(sLinha, FieldByName('EDMUNICIPIOINI').AsInteger + 1,    FieldByName('EDMUNICIPIOTAM').AsInteger);
             T.FieldByName('UF').AsString                    := Copy(sLinha, FieldByName('EDUFINI').AsInteger + 1,           FieldByName('EDUFTAM').AsInteger);
             T.FieldByName('DDD').AsString              := Copy(sLinha, FieldByName('EDTELDDDINI').AsInteger + 1,     FieldByName('EDTELDDDTAM').AsInteger);
             T.FieldByName('TELEFONE').AsString              := Copy(sLinha, FieldByName('EDTELEFONEINI').AsInteger + 1,     FieldByName('EDTELEFONETAM').AsInteger);
             T.FieldByName('IDPESSOA').AsString              := Copy(sLinha, FieldByName('EDIDPESSOAINI').AsInteger + 1,        FieldByName('EDIDPESSOATAM').AsInteger);
             T.FieldByName('IDPLANO').AsString           := Copy(sLinha, FieldByName('EDIDPLANOPREVINI').AsInteger + 1,    FieldByName('EDIDPLANOPREVTAM').AsInteger);
          end
          else if bDocumentos
          then begin
             T.FieldByName('IDDOCUMENT').AsString           := Copy(sLinha, FieldByName('DOIDDOCUMENINI').AsInteger + 1,  FieldByName('DOIDDOCUMENTAM').AsInteger);
             T.FieldByName('MATRICULA').AsString              := Copy(sLinha, FieldByName('DOMATRICULAINI').AsInteger + 1,    FieldByName('DOMATRICULATAM').AsInteger);
             T.FieldByName('NDOCUMENTO').AsString           := Copy(sLinha, FieldByName('DONUMEROINI').AsInteger + 1,       FieldByName('DONUMEROTAM').AsInteger);
             T.FieldByName('ORGAO').AsString                  := Copy(sLinha, FieldByName('DOORGAOINI').AsInteger + 1,        FieldByName('DOORGAOTAM').AsInteger);
             T.FieldByName('UF').AsString                     := Copy(sLinha, FieldByName('DOUFINI').AsInteger + 1,           FieldByName('DOUFTAM').AsInteger);
             T.FieldByName('DTEMISSAO').AsString            := Copy(sLinha, FieldByName('DOEMISSAOINI').AsInteger + 1,      FieldByName('DOEMISSAOTAM').AsInteger);
             T.FieldByName('DTVALIDADE').AsString           := Copy(sLinha, FieldByName('DOVALIDADEINI').AsInteger + 1,     FieldByName('DOVALIDADETAM').AsInteger);
             T.FieldByName('IDPESSOA').AsString              := Copy(sLinha, FieldByName('DOIDPESSOAINI').AsInteger + 1,        FieldByName('DOIDPESSOATAM').AsInteger);
             T.FieldByName('IDPLANO').AsString           := Copy(sLinha, FieldByName('DOIDPLANOPREVINI').AsInteger + 1,    FieldByName('DOIDPLANOPREVTAM').AsInteger);
          end
          else if bContatos
          then begin
             T.FieldByName('MATRICULA').AsString              := Copy(sLinha, FieldByName('CTMATRICULAINI').AsInteger + 1,    FieldByName('CTMATRICULATAM').AsInteger);
             T.FieldByName('NOME').AsString                   := Copy(sLinha, FieldByName('CTNOMEINI').AsInteger + 1,         FieldByName('CTNOMETAM').AsInteger);
             T.FieldByName('EMAIL').AsString                  := Copy(sLinha, FieldByName('CTEMAILINI').AsInteger + 1,        FieldByName('CTEMAILTAM').AsInteger);
             T.FieldByName('CARGO').AsString                  := Copy(sLinha, FieldByName('CTCARGOINI').AsInteger + 1,        FieldByName('CTCARGOTAM').AsInteger);
             T.FieldByName('SETOR').AsString                  := Copy(sLinha, FieldByName('CTSETORINI').AsInteger + 1,        FieldByName('CTSETORTAM').AsInteger);
             T.FieldByName('NASCIMENTO').AsString             := Copy(sLinha, FieldByName('CTNASCINI').AsInteger + 1,         FieldByName('CTNASCTAM').AsInteger);
             T.FieldByName('OBS').AsString                    := Copy(sLinha, FieldByName('CTOBSINI').AsInteger + 1,          FieldByName('CTOBSTAM').AsInteger);
          end
          else if bDependentes
          then begin
            T.FieldByName('FLGINVALID').AsString              := Copy(sLinha, FieldByName('DPINVALIDDPDINI').AsInteger + 1,   FieldByName('DPINVALIDDPDTAM').AsInteger);
            T.FieldByName('NOME').AsString                    := Copy(sLinha, FieldByName('DPNOMEDPDINI').AsInteger + 1,      FieldByName('DPNOMEDPDTAM').AsInteger);
            T.FieldByName('DATANASC').AsString                := Copy(sLinha, FieldByName('DPDTNASCDPDINI').AsInteger + 1,    FieldByName('DPDTNASCDPDTAM').AsInteger);
            T.FieldByName('SEXO').AsString                    := Copy(sLinha, FieldByName('DPSEXODPDINI').AsInteger + 1,      FieldByName('DPSEXODPDTAM').AsInteger);
            T.FieldByName('ESTCIVIL').AsString                := Copy(sLinha, FieldByName('DPESTCIVILDPDINI').AsInteger + 1,  FieldByName('DPESTCIVILDPDTAM').AsInteger);
            T.FieldByName('DATAINICIO').AsString              := Copy(sLinha, FieldByName('DPDTDPDINI').AsInteger  + 1,       FieldByName('DPDTDPDTAM').AsInteger);
            T.FieldByName('FLGSALFAM').AsString               := Copy(sLinha, FieldByName('DPSALFAMDPDINI').AsInteger + 1,    FieldByName('DPSALFAMDPDTAM').AsInteger);
            T.FieldByName('TPRELDPD').AsString                := Copy(sLinha, FieldByName('DPRELDPDINI').AsInteger + 1,       FieldByName('DPRELDPDTAM').AsInteger);
            T.FieldByName('SEQDEP').AsInteger                 := StrToInt(Copy(sLinha, FieldByName('DPSEQDPDINI').AsInteger + 1,       FieldByName('DPSEQDPDTAM').AsInteger));
            T.FieldByName('MATRICULA').AsString               := Copy(sLinha, FieldByName('DPMATRICULAINI').AsInteger + 1,    FieldByName('DPMATRICULATAM').AsInteger);
            T.FieldByName('FLGCONTAIR').AsString              := Copy(sLinha, FieldByName('DPIRDPDINI').AsInteger + 1,        FieldByName('DPIRDPDTAM').AsInteger);
            T.FieldByName('FLGCONTASF').AsString              := Copy(sLinha, FieldByName('DPSALFAMDPDINI').AsInteger + 1,    FieldByName('DPSALFAMDPDTAM').AsInteger);
            T.FieldByName('IDPESSOA').AsString              := Copy(sLinha, FieldByName('DPIDPESSOAINI').AsInteger + 1,        FieldByName('DPIDPESSOATAM').AsInteger);
            T.FieldByName('IDPLANO').AsString           := Copy(sLinha, FieldByName('DPIDPLANOPREVINI').AsInteger + 1,    FieldByName('DPIDPLANOPREVTAM').AsInteger);
          end
          else if bEvolFunc
          then begin
            sIdpessoa := Copy(sLinha, FieldByName('EFIDPESSOAINI').AsInteger + 1,        FieldByName('EFIDPESSOATAM').AsInteger);
            scargo    := Copy(sLinha, FieldByName('EFCARGOINI').AsInteger + 1,    FieldByName('EFCARGOTAM').AsInteger);


            T.FieldByName('MATRICULA').AsString          := Copy(sLinha, FieldByName('EFMATRICULAINI').AsInteger + 1,   FieldByName('EFMATRICULATAM').AsInteger);
            T.FieldByName('INSCRICAO').AsString          := Copy(sLinha, FieldByName('EFINSCRICAOINI').AsInteger + 1,      FieldByName('EFINSCRICAOTAM').AsInteger);
            T.FieldByName('CARGO').AsString              := Copy(sLinha, FieldByName('EFCARGOINI').AsInteger + 1,    FieldByName('EFCARGOTAM').AsInteger);
            If Trim(Copy(sLinha, FieldByName('EFDTINICARGOINI').AsInteger + 1,  FieldByName('EFDTINICARGOTAM').AsInteger)) = '' Then
              T.FieldByName('DTINICARGO').IsNull
            else
              T.FieldByName('DTINICARGO').AsDateTime         := StrToDate(Copy(sLinha, FieldByName('EFDTINICARGOINI').AsInteger + 1,  FieldByName('EFDTINICARGOTAM').AsInteger));

            T.FieldByName('DTINIFORMATO').AsString          := FieldByName('EFDTINIFORMATO').AsString;
            T.FieldByName('DTFIMCARGO').AsString         := Copy(sLinha, FieldByName('EFDTFIMCARGOINI').AsInteger + 1,    FieldByName('EFDTFIMCARGOTAM').AsInteger);
            T.FieldByName('DTFIMFORMATO').AsString          := FieldByName('EFDTFIMFORMATO').AsString;
            T.FieldByName('PCADIC').AsString             := Copy(sLinha, FieldByName('EFPCADICINI').AsInteger + 1,    FieldByName('EFPCADICTAM').AsInteger);
            T.FieldByName('IDPESSOA').AsString           := Copy(sLinha, FieldByName('EFIDPESSOAINI').AsInteger + 1,        FieldByName('EFIDPESSOATAM').AsInteger);
            T.FieldByName('IDPLANO').AsString        := Copy(sLinha, FieldByName('EFIDPLANOPREVINI').AsInteger + 1,    FieldByName('EFIDPLANOPREVTAM').AsInteger);
            T.FieldByName('TIPOREG').AsString            := Copy(sLinha, FieldByName('EFTIPOREGINI').AsInteger + 1,    FieldByName('EFTIPOREGTAM').AsInteger);
            T.FieldByName('MODO').AsString               := Copy(sLinha, FieldByName('EFMODOINI').AsInteger + 1,    FieldByName('EFMODOTAM').AsInteger);
            T.FieldByName('QTDEMIN').AsString            := Copy(sLinha, FieldByName('EFQTDEMININI').AsInteger + 1,    FieldByName('EFQTDEMINTAM').AsInteger);
          end
          else if bEventos
          then begin
            T.FieldByName('MATRICULA').AsString          := Copy(sLinha, FieldByName('EVMATRICULAINI').AsInteger + 1,   FieldByName('EVMATRICULATAM').AsInteger);
            T.FieldByName('INSCRICAO').AsString          := Copy(sLinha, FieldByName('EVINSCRICAOINI').AsInteger + 1,      FieldByName('EVINSCRICAOTAM').AsInteger);
            T.FieldByName('EVENTO').AsString              := Copy(sLinha, FieldByName('EVEVENTOINI').AsInteger + 1,    FieldByName('EVEVENTOTAM').AsInteger);
            T.FieldByName('SITFUNC').AsString              := Copy(sLinha, FieldByName('EVSITFUNCINI').AsInteger + 1,    FieldByName('EVSITFUNCTAM').AsInteger);
            T.FieldByName('SITPART').AsString              := Copy(sLinha, FieldByName('EVSITPARTINI').AsInteger + 1,    FieldByName('EVSITPARTTAM').AsInteger);
            T.FieldByName('SITPLANO').AsString         := Copy(sLinha, FieldByName('EVSITPLANOINI').AsInteger + 1,    FieldByName('EVSITPLANOTAM').AsInteger);
            T.FieldByName('DATAINI').AsString         := Copy(sLinha, FieldByName('EVDTINIINI').AsInteger + 1,      FieldByName('EVDTINITAM').AsInteger);
            T.FieldByName('TAXA').AsString         := Copy(sLinha, FieldByName('EVTAXAINI').AsInteger + 1,      FieldByName('EVTAXATAM').AsInteger);
            T.FieldByName('IDPESSOA').AsString           := Copy(sLinha, FieldByName('EVIDPESSOAINI').AsInteger + 1,        FieldByName('EVIDPESSOATAM').AsInteger);
            T.FieldByName('IDPLANO').AsString        := Copy(sLinha, FieldByName('EVIDPLANOPREVINI').AsInteger + 1,    FieldByName('EVIDPLANOPREVTAM').AsInteger);
          end
          else if bRubricas then
          begin
            T.FieldByName('CODIGO').AsString          := Copy(sLinha, FieldByName('TBRUBCODIGOINI').AsInteger + 1,   FieldByName('TBRUBCODIGOTAM').AsInteger);
            T.FieldByName('DESCRICAO').AsString          := Copy(sLinha, FieldByName('TBRUBDESCRICAOINI').AsInteger + 1,      FieldByName('TBRUBDESCRICAOTAM').AsInteger);
            T.FieldByName('TIPO').AsString              := Copy(sLinha, FieldByName('TBRUBTIPOINI').AsInteger + 1,    FieldByName('TBRUBTIPOTAM').AsInteger);
            T.FieldByName('INDICE').AsString              := Copy(sLinha, FieldByName('TBRUBINCIDEINI').AsInteger + 1,    FieldByName('TBRUBINCIDETAM').AsInteger);
          end
          else if bAgencias then
          begin
            T.FieldByName('BANCO').AsString          := Copy(sLinha, FieldByName('TBBANCOINI').AsInteger + 1,   FieldByName('TBBANCOTAM').AsInteger);
            T.FieldByName('DESCRBANCO').AsString          := Copy(sLinha, FieldByName('TBBBDESCRICAOINI').AsInteger + 1,      FieldByName('TBBBDESCRICAOTAM').AsInteger);
            T.FieldByName('AGENCIA').AsString              := Copy(sLinha, FieldByName('TBAGENCIAINI').AsInteger + 1,    FieldByName('TBAGENCIATAM').AsInteger);
            T.FieldByName('DESCRAGENC').AsString              := Copy(sLinha, FieldByName('TBAGDESCRICAOINI').AsInteger + 1,    FieldByName('TBAGDESCRICAOTAM').AsInteger);
          end
          else if bLocais then
          begin
            T.FieldByName('LOCAL').AsString          := Copy(sLinha, FieldByName('TBLOCALCODINI').AsInteger + 1,   FieldByName('TBLOCALCODTAM').AsInteger);
            T.FieldByName('NOME').AsString              := Copy(sLinha, FieldByName('TBLOCALDESCINI').AsInteger + 1,    FieldByName('TBLOCALDESCTAM').AsInteger);
            T.FieldByName('TIPO').AsString              := Copy(sLinha, FieldByName('TBLOCALTIPOINI').AsInteger + 1,    FieldByName('TBLOCALTIPOTAM').AsInteger);
            T.FieldByName('SIGLA').AsString              := Copy(sLinha, FieldByName('TBLOCALSIGLAINI').AsInteger + 1,    FieldByName('TBLOCALSIGLATAM').AsInteger);
            T.FieldByName('CGC').AsString              := Copy(sLinha, FieldByName('TBLOCALCGCINI').AsInteger + 1,    FieldByName('TBLOCALCGCTAM').AsInteger);
            T.FieldByName('DATAFIM').AsString              := Copy(sLinha, FieldByName('TBLOCALDTFIMINI').AsInteger + 1,    FieldByName('TBLOCALDTFIMTAM').AsInteger);
          end;


          T.Post;
       end; // with
    end;
    except
       exit;
    end;

    CloseFile(Arquivo);
    Result := True;
end;

function  TfrmImportaDadosCadastrais.AbreQryLayOutArquivo : boolean;
begin
   Result := False;
   if bCad
   then begin  // Dados Cadastrais
      // Abrir query com LAY-OUT
      qryLayOutArquivo.Close;
      qryLayOutArquivo.SQL.Clear;
      qryLayOutArquivo.SQL.Add( ' SELECT            DCIDENTINI,          DCIDENTTAM,          DCUFIDENTINI,        '+
                                ' DCUFIDENTTAM,     DCDTEXPIDENTINI,     DCDTEXPIDENTTAM,     DCFTDTEXPIDENT,      '+
                                ' DCIDDOCIDENT,     DCMATRICULAINI,      DCMATRICULATAM,      DCINSCRICAOINI,      '+
                                ' DCINSCRICAOTAM,   DCFATORJOIAINI,      DCFATORJOIATAM,      DCBANCOINI,          '+
                                ' DCBANCOTAM,       DCAGENCIAINI,        DCAGENCIATAM,        DCNIVELINI,          '+
                                ' DCNIVELTAM,       DCNIVELCONTEUDO,     DCDTADMINI,          DCDTADMTAM,          '+
                                ' DCDTADMFORMATO,   DCCCINI,             DCCCTAM,             DCDTNASCINI,         '+
                                ' DCDTNASCTAM,      DCDTNASCFORMATO,     DCEMPREGINI,         DCEMPREGTAM,         '+
                                ' DCSEXOINI,        DCSEXOTAM,           DCDEPENDINI,         DCDEPENDTAM,         '+
                                ' DCCPFINI,         DCCPFTAM,            DCCARGOCONTEUDO,     DCCARGOINI,          '+
                                ' DCCARGOTAM,       DCESTCIVILINI,       DCESTCIVILTAM,       DCCODMUNNATINI,      '+
                                ' DCCODMUNNATTAM,   DCNMMAEINI,          DCNMMAETAM,          DCNMPAIINI,          '+
                                ' DCNMPAITAM,       DCNRMATCONJINI,      DCNRMATCONJTAM,      DCTPSERVTOTINI,      '+
                                ' DCTPSERVTOTTAM,   DCTPNAOCREDINI,      DCTPNAOCREDTAM,      DCTPCREDINI,         '+
                                ' DCTPCREDTAM,      DCCDVINCFUNCINI,     DCCDVINCFUNCTAM,     DCDTDEMISSAOINI,     '+
                                ' DCDTDEMISSAOTAM,  DCFTDTDEMISSAO,      DCIDESTABINI,        DCIDESTABTAM,        '+
                                ' DCIDSITFUNCINI,   DCIDSITFUNCTAM,      DCTPSERVPUBANTINI,   DCTPSERVPUBANTTAM,   '+
                                ' DCTPSERVPRVANTINI,DCTPSERVPRVANTTAM,   DCFLGDIRETORINI,     DCFLGDIRETORTAM,     '+
                                ' DCTPSRVANTREALINI,DCTPSRVANTREALTAM,   DCIDFUNCAOINI,       DCIDFUNCAOTAM,       '+
                                ' DCDTREADMISSAOINI,DCDTREADMISSAOTAM,   DCFTDTREADMISSAO,    DCVALORBASE1INI,     '+
                                ' DCVALORBASE1TAM,  DCVALORBASE2INI,     DCVALORBASE2TAM,     DCVALORBASE3INI,     '+
                                ' DCVALORBASE3TAM,  IDPARTDADOS,         IDREGCADASTROINI,    IDREGCADASTROTAM,    '+
                                ' DCVALORBASE4INI,  DCVALORBASE4TAM,     DCVALORBASE5INI,     DCVALORBASE5TAM,     '+
                                ' DCVALORBASE6INI,  DCVALORBASE6TAM, '+
                                ' IDREGCADASTRO,    DCDTMORTEINI,        DCDTMORTETAM,        DCFTDTMORTE,         '+
                                ' DCNUMDEPINI,      DCNUMDEPTAM,         DCNUMDEPSALFAMINI,   DCNUMDEPSALFAMTAM,   '+
                                ' DCTPSERVANTINI,   DCTPSERVANTTAM,      IDPESSJUR ,     '+
                                ' DCIDPESSOATAM, DCIDPESSOAINI , DCIDPLANOPREVTAM, DCIDPLANOPREVINI,  '+
                                ' DCEMAILINI, DCEMAILTAM '+
                                ' FROM  PARAMINTERFFUNC                                                             '+
                                ' WHERE IDPESSJUR = '+IntToStr(iPatro));
      qryLayOutArquivo.Open;
   end
   else if bEnd
   then begin
      // Abrir query com LAY-OUT
      qryLayOutArquivo.Close;
      qryLayOutArquivo.SQL.Clear;
      qryLayOutArquivo.SQL.Add( ' SELECT  IDPESSJUR,      EDMATRICULATAM,   EDMATRICULAINI,  EDINSCRICAOTAM, '+
                                '         EDINSCRICAOINI, EDLOGRADOUROTAM , EDLOGRADOUROINI, EDBAIRROTAM,    '+
                                '         EDBAIRROINI,    EDCEPTAM,         EDCEPINI ,       EDMUNICIPIOTAM, '+
                                '         EDMUNICIPIOINI, EDUFTAM,          EDUFINI,         EDTELEFONETAM,  '+
                                '         EDTELEFONEINI ,                                                     '+
                                '         EDIDPLANOPREVINI, EDIDPLANOPREVTAM, EDIDPESSOAINI, '+
                                '         EDIDPESSOATAM , 157 EDTELDDDINI, 3 EDTELDDDTAM'+
                                ' FROM    PARAMINTERF                                                        '+
                                ' WHERE   IDPESSJUR = '+IntToStr(iPatro));
      qryLayOutArquivo.Open;
   end
   else if bDocumentos
   then begin // colocar lay-out da FUNCEF provisoriamente,até que exista a tabela de lay-out para documentos
      qryLayOutArquivo.Close;
      qryLayOutArquivo.SQL.Clear;
      qryLayOutArquivo.SQL.Add(' SELECT 15 DOIDPESSOATAM, 0 DOIDPESSOAINI, '+
                               '        5 DOIDPLANOPREVTAM,  15 DOIDPLANOPREVINI, '+
                               '        7  DOMATRICULATAM ,  20  DOMATRICULAINI, '+
                               '        5  DOIDDOCUMENTAM ,  27  DOIDDOCUMENINI, '+
                               '        18 DONUMEROTAM    ,  32 DONUMEROINI,    '+
                               '        0  DOORGAOTAM     ,  0  DOORGAOINI,     '+
                               '        5  DOUFTAM        ,  60 DOUFINI,        '+
                               '        10 DOEMISSAOTAM   ,  50 DOEMISSAOINI,  ''dd.mm.yyyy'' AS DOFTEMISSAO, '+
                               '        0  DOVALIDADETAM  ,  0  DOVALIDADEINI, ''dd.mm.yyyy'' AS DOFTVALIDADE '+
                               ' FROM DUAL ');
      qryLayOutArquivo.Open;
   end
   else if bContatos
   then begin
      qryLayOutArquivo.Close;
      qryLayOutArquivo.SQL.Clear;
      qryLayOutArquivo.SQL.Add('SELECT  IDPESSJUR,      CTMATRICULATAM, CTMATRICULAINI,              '+
                               '        CTINSCRICAOTAM, CTINSCRICAOINI, CTNOMETAM,       CTNOMEINI,  '+
                               '        CTEMAILTAM,     CTEMAILINI,     CTCARGOTAM,      CTCARGOINI, '+
                               '        CTSETORTAM,     CTSETORINI,     CTOBSTAM,        CTOBSINI,   '+
                               '        CTNASCTAM,      CTNASCINI,      CTNASCFORMA,     IDPARTCONT , '+
                               '        CTIDPLANOPREVINI, CTIDPLANOPREVTAM, CTIDPESSOAINI, CTIDPESSOATAM '+
                               ' FROM   PARAMINTERFCONT                                              '+
                               ' WHERE  IDPESSJUR = '+IntToStr(iPatro));
      qryLayOutArquivo.Open;
   end
   else if bDependentes
   then begin
      qryLayOutArquivo.Close;
      qryLayOutArquivo.SQL.Clear;
      qryLayOutArquivo.SQL.Add(' SELECT IDPESSJUR,           DPMATRICULATAM,    DPMATRICULAINI,                      '+
                               '        DPINSCRICAOTAM ,     DPINSCRICAOINI,    DPSEQDPDTAM,     DPSEQDPDINI,        '+
                               '        DPNOMEDPDTAM,        DPNOMEDPDINI,      DPDTNASCDPDTAM,  DPDTNASCDPDINI,     '+
                               '        DPDTNASCDPDFORMAT,   DPSEXODPDTAM,      DPSEXODPDINI,    DPESTCIVILDPDTAM,   '+
                               '        DPESTCIVILDPDINI,    DPIRDPDINI,        DPIRDPDTAM,      DPINVALIDDPDINI,    '+
                               '        DPINVALIDDPDTAM,     DPSALFAMDPDINI,    DPSALFAMDPDTAM,  DPDTDPDFORMATO,     '+
                               '        DPDTDPDINI,          DPDTDPDTAM,        DPRELDPDINI,     DPRELDPDTAM,        '+
                               '        IDREGDEPENDENTE,     IDREGDEPINI,       IDREGDEPTAM,     IDPARTDEPENDENTE,    '+
                               '        DPIDPLANOPREVINI , DPIDPLANOPREVTAM, DPIDPESSOAINI, DPIDPESSOATAM  '+
                               ' FROM   PARAMINTERFDEP '+
                               ' WHERE  IDPESSJUR = '+IntToStr(iPatro));
      qryLayOutArquivo.Open;
   end
   else if bEvolFunc then
   begin

      qryLayOutArquivo.Close;
      qryLayOutArquivo.SQL.Clear;
      qryLayOutArquivo.SQL.Add('   SELECT IDPESSJUR, EFMATRICULATAM, EFMATRICULAINI, EFMATRICULAINI, '+
                               '  EFINSCRICAOINI,EFINSCRICAOTAM, EFCARGOINI, EFCARGOTAM, EFCARGOCONTEUDO, EFDTINICARGOTAM, '+
                               '  EFDTINICARGOINI, EFDTINIFORMATO, EFDTFIMCARGOINI, EFDTFIMCARGOTAM, EFDTFIMFORMATO, '+
                               '  EFTPADICTAM, EFTPADICINI,EFPCADICTAM, EFPCADICINI, IDREGEVOLFUNC, IDREGEVOLFUNCINI, '+
                               '  IDREGEVOLFUNCTAM, IDPARTEVOLFUNC, EFIDPESSOATAM, EFIDPESSOAINI, EFIDPLANOPREVTAM, '+
                               '  EFIDPLANOPREVTAM, EFIDPLANOPREVINI, EFTIPOREGINI, EFMODOTAM, EFMODOINI, '+
                               '  EFQTDEMINTAM, EFQTDEMININI, EFTIPOREGTAM '+
                               '  FROM PARAMINTERFEVOL '+
                               '  WHERE  IDPESSJUR = '+IntToStr(iPatro));
      qryLayOutArquivo.Open;

   end
   else if bEventos then
   begin
      qryLayOutArquivo.Close;
      qryLayOutArquivo.SQL.Clear;
      qryLayOutArquivo.SQL.Add( ' SELECT   '+
                                ' EVIDPESSOATAM ,EVIDPESSOAINI ,  EVIDPLANOPREVTAM,  '+
                                ' EVIDPLANOPREVINI , EVSITFUNCTAM , EVSITFUNCINI , EVSITPARTTAM , '+
                                ' EVSITPARTINI , EVSITPLANOTAM , EVSITPLANOINI , EVMATRICULATAM , '+
                                ' EVMATRICULAINI ,EVINSCRICAOTAM ,EVINSCRICAOINI ,EVEVENTOTAM , EVEVENTOINI , '+
                                ' EVDTINIFMT  , EVDTFIMFMT  , EVDTINIINI  , EVDTINITAM  , '+
                                ' EVDTFIMINI  , EVDTFIMTAM, EVTAXAINI, EVTAXATAM '+
                                ' FROM PARAMINTERF '+
                                ' WHERE IDPESSJUR = '+IntToStr(iPatro));
      qryLayOutArquivo.Open;
   end
   else if bRubricas then
   begin
      qryLayOutArquivo.Close;
      qryLayOutArquivo.SQL.Clear;
      qryLayOutArquivo.SQL.Add( ' SELECT   '+
                                ' TBRUBCODIGOTAM , TBRUBCODIGOINI , TBRUBDESCRICAOTAM , '+
                                ' TBRUBIDPROVENTO  , TBRUBIDDESCONTO , TBRUBDESCRICAOINI  , '+
                                ' TBRUBTIPOTAM , TBRUBTIPOINI, TBRUBINCIDEINI , TBRUBINCIDETAM '+
                                ' FROM PARAMINTERF '+
                                ' WHERE IDPESSJUR = '+IntToStr(iPatro));
      qryLayOutArquivo.Open;
   end
   else if bAgencias then
   begin
      qryLayOutArquivo.Close;
      qryLayOutArquivo.SQL.Clear;
      qryLayOutArquivo.SQL.Add( ' SELECT   '+
                                ' TBAGENCIAINI ,  TBAGENCIATAM , TBBBDESCRICAOTAM , TBBBDESCRICAOINI , '+
                                ' TBBANCOTAM  , TBBANCOINI  ,    IDREGTBBANCOINI  , IDREGTBBANCOTAM   , '+
                                ' TBAGDESCRICAOTAM  ,  TBAGDESCRICAOINI '+
                                ' FROM PARAMINTERF '+
                                ' WHERE IDPESSJUR = '+IntToStr(iPatro));
      qryLayOutArquivo.Open;

   end
   else if bLocais then
   begin
      qryLayOutArquivo.Close;
      qryLayOutArquivo.SQL.Clear;
      qryLayOutArquivo.SQL.Add( ' SELECT   '+
                                ' TBLOCALCODTAM, TBLOCALCODINI, TBLOCALDESCTAM, TBLOCALDESCINI, '+
                                ' TBLOCALTIPOINI,  TBLOCALTIPOTAM, TBLOCALSIGLATAM,  TBLOCALSIGLAINI, '+
                                ' TBLOCALCGCTAM,  TBLOCALCGCINI, TBLOCALDTFIMINI, TBLOCALDTFIMTAM, TBLOCALDTFIMFMT '+
                                ' FROM PARAMINTERF '+
                                ' WHERE IDPESSJUR = '+IntToStr(iPatro));
      qryLayOutArquivo.Open;
   end;

   Result := True;
end;

procedure TfrmImportaDadosCadastrais.bbtnImportaClick(Sender: TObject);
var
    sDataAtu      : string;
    iTipoArquivo  : word;
    F : TextFile ;
    sLog : String;
begin
  inherited;

  try
     lbMensagens.clear;
     //
     if trim(dblkPatrocinadora.Text) = '' then begin
        MsgDlg('Obrigatório preencher a Patrocinadora','Aviso',mtWarning,[mbOk],0);
        dblkPatrocinadora.SetFocus;
        exit;
     end;

     if trim(deDataCob.Text) = '' then begin
        MsgDlg('Obrigatório preencher a Data de Cobrança','Aviso',mtWarning,[mbOk],0);
        deDataCob.SetFocus;
        exit;
     end;

     lblStatus.Caption := 'Verificando Processamentos Anteriores ... ';

     if not IniciaTratCriticas
     then begin
        MsgDlg('Processado Abortado pelo Usuário. ','Aviso',mtWarning,[mbOk],0);
        MemoErros.Lines.Add('Processo Abortado pelo Usuário');
        Exit;
     end;

     sDataAtu   := FormatDateTime('dd/mm/yyyy', date); 

     AssignFile(F,'Log'+copy(sDataAtu,1,2)+copy(sDataAtu,4,2)+copy(sDataAtu,7,4)+'.err ');
     Rewrite(F);

     WriteLn(F,'Log de Erros durante o processo iniciado em ' +
             FormatDateTime('dd/mm/yyyy', Date) + ' às ' + timetostr(time) + '... ');

     // Obtem o valor de apontamento da patrocinadora.
     iPatro       := StrToInt(dblkPatrocinadora.LookupValue);
     sMesCobranca := Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2);

     if rgTipoChave.ItemIndex = 0
     then cChave := cMatricula
     else cChave := cInscricao;

     // Processar os 14 arquivos, se forem indicados
     for iTipoArquivo := 1 to 15 do
     begin
        bCad         := False;
        bDependentes := False;
        bEnd         := False;
        bDocumentos  := False;
        bContatos    := False;
        bEvolFunc    := False;
        bEventos     := False;
        bLotacoes    := False;

        bCargos      := False;
        bNiveis      := False;
        bLocais      := False;
        bOrgaos      := False;
        bSit         := False;
        bRubricas    := False;
        bAgencias    := False;

        sLog := '';
        if       iTipoArquivo = 1  then
        begin
           bCad        := True; // Dados Cadastrais
           sLog        := 'Dados Cadastrais';
        end
        else if  iTipoArquivo = 2  then
        begin
           bDependentes:= True; // Dependentes
           sLog        := 'Dependentes';
        end
        else if  iTipoArquivo = 3  then
        begin
           bEnd        := True; // Enderecos
           sLog        := 'Endereços';
        end
        else if  iTipoArquivo = 4  then
        begin
           bDocumentos := True; // Documentos
           sLog        := 'Documentos';
        end
        else if  iTipoArquivo = 5  then
        begin
           bEvolFunc   := True; // Evolucao Funcional
           sLog        := 'Evolução funcional';
        end
        else if  iTipoArquivo = 6  then
        begin
           bEventos    := True; // Eventos
           sLog        := 'Eventos';
        end
        else if  iTipoArquivo = 7  then
        begin
           bLotacoes   := True; // Lotacao
           sLog        := 'Lotação';
        end
        else if  iTipoArquivo = 8  then
        begin
           bCargos     := True; // Cargo
           sLog        := 'Cargo';
        end
        else if  iTipoArquivo = 9  then
        begin
           bNiveis     := True; // Nivel
           sLog        := 'Niveis';
        end
        else if  iTipoArquivo = 10 then
        begin
           bLocais     := True; // Filial
           sLog        := 'Filiais';
        end
        else if  iTipoArquivo = 11 then
        begin
           bOrgaos     := True; // Orgao
           sLog        := 'Orgão';
        end
        else if  iTipoArquivo = 12 then
        begin
           bSit        := True; // Situacao
           sLog        := 'Situação';
        end
        else if  iTipoArquivo = 13 then
        begin
           bRubricas   := True; // Rubricas
           sLog        := 'Rubricas';
        end
        else if  iTipoArquivo = 14 then
        begin
           bAgencias   := True; // Agencias
           sLog        := 'Agências';
        end
        else if  iTipoArquivo = 15 then
        begin
           bContatos   := True;// Contatos
           sLog        := 'Contatos';
        end;


        if not ProcessaArquivo
        then begin
           If dtmBaseDados.dbBaseDados.InTransaction
           then dtmBaseDados.dbBaseDados.Rollback;
           MsgDlg('Processado com erros e abortado.','Aviso',mtWarning,[mbOk],0);
           pbStatus.position := 0;
           pgctrlOpcoes.activepage := tbsErros;
           Exit;
        end;

        Modulo.GravaLogTOTALPREV (sMesCobranca+' - v. '+Sistema.Versao+' - Import. Cadastral -'+sLog)
     end; // for

     lbMensagens.Lines.Add(TimeToStr(Time)+' - Término do Processamento ');
     lblStatus.caption := 'Processo';
     Application.ProcessMessages;

     lbMensagens.Lines.SaveToFile('MENS' + IntToStr(iPatro)   +
                                  Copy(FormatDateTime('dd/mm/yyyy', Date), 1, 2) +
                                  Copy(FormatDateTime('dd/mm/yyyy', Date), 4, 2) +
                                  Copy(FormatDateTime('dd/mm/yyyy', Date), 7, 4) + '.LOG ');

     try
       CloseFile(F);
     except end;

     Screen.Cursor:=crDefault;

     // Adicionando Log Padrão
     Try
       If not Sistema.GravaLogOperacoes('Recebimento da Patrocinadora Dados Cadastrais') Then
         Raise Exception.Create('Erro ao gravar Log.');
     Except
     End;


     If dtmBaseDados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.Commit;

     if trim(MemoErros.text) <> '' then
     begin
        MsgDlg('Ocorreram alguns erros durante o processo.','Aviso',mtError,[mbOk],0);
        pgctrlOpcoes.activepage := tbsErros;
     end
     else  MsgDlg('Processado com sucesso.','Aviso',mtInformation,[mbOk],0);

     pbStatus.position := 0;
  except
     raise;
     If dtmBaseDados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.Rollback;
     MsgDlg('Processado com erros e abortado.','Aviso',mtWarning,[mbOk],0);
     pbStatus.position := 0;
     pgctrlOpcoes.activepage := tbsErros;
     CloseFile(F);
  end;
end;

procedure TfrmImportaDadosCadastrais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //
  TabCriticasCcp.Free;
  action := caFREE;
end;

procedure TfrmImportaDadosCadastrais.FormActivate(Sender: TObject);
begin
  inherited;
  //
  deDataCob.Date:=Date;
  //
  qryPatroCombo.Close;
  qryPatroCombo.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatroCombo.Open;
  //
  pnlAtualizaAuto.SendToBack;

  bPrimeiraVez1     := True;  bPrimeiraVez2        := True;  bPrimeiraVez3      := True;
  bPrimeiraVez4     := True;  bPrimeiraVez5        := True;  bPrimeiraVez6      := True;
  bPrimeiraVez7     := True;  bPrimeiraVez8        := True;  bPrimeiraVez9      := True;
  bPrimeiraVez10    := True;  bPrimeiraVez11       := True;  bPrimeiraVez12     := True;
  bPrimeiraVez13    := True;  bPrimeiraVez14       := True;  bPrimeiraVez15     := True;

  batuconta         := True;  batunome             := True;  batudatanasc       := True;
  batudataadm       := True;  batusexo             := True;  batudepirrf        := True;
  batucpf           := True;  batucargo            := True;  batunivel          := True;
  batuident         := True;  batuufident          := True;  batudtexpident     := True;
  binsereend        := True;  binseretelefone := True;
  batumunnat        := True;  batunomepai          := True;  batunomemae        := True;
  batuemail := true;
  batunrmatconj     := True;  batutpservtot        := True;  batutpservnaocred  := True;
  bAtuESTCIVIL      := True;  bAtuTPSERVANTERIOR   := True;  bAtuTPSERVPUBLANT  := True;
  bAtuTPSERVPRIVANT := True;  bAtuTPSERVANTREAL    := True;  bAtuFILIAL         := True;
  bAtuSITEMPREGADO  := True;  bAtuVINCULACAOFUNC   := True;  bAtuFLGDIRETOR     := True;
  bAtuFUNCAO        := True;  bAtuDATADEMISSAO     := True;  bAtuDATAREADMISSAO := True;
  bAtuDATAMORTE     := True;  bAtuNUMDEPSALARIOF   := True;  bAtuNUMDEPTOTAL    := True;
  bAtuVALORBASE1    := True;  bAtuVALORBASE2       := True;  bAtuVALORBASE3     := True;
  bAtuVALORBASE4    := True;  bAtuVALORBASE5       := True;  bAtuVALORBASE6     := True;
  bInserePart := True;   bInsereIdent := True;

  batulocal         := True;  batuorgao            := True;
  binserelotacao    := True;

  batulogradouro    := True;  batubairro           := True;  batucep            := True;
  batucidade        := True;  batuuf               := True;  batutelefone       := True;
  batutelddd        := True;


  batunomedep       := True;  batudatanascdep      := True;  batusexodep        := True;
  batuestcivildep   := True;  batuindirdep         := True;  batuindsalfamdep   := True;
  batuindinvalidezdep := True;batudatainiciodep    := True;  batugraudependdep  := True;
  binseredep        := True;

  batucargoef := true;      batufuncaoef := true;  batuacef := true;  batuatsef := true;
  batuadnotef := true;      batupericulef := true; batuinsalubef := true;

  //agencias / bancos
  batunomeagencia := True;
  binsereagencia := True;  

  //cargos
  batucodcargo := True;
  batudesccargo := True;

  //niveis
  batucodnivel := True;
  batuvalornivel := True;
  batupontonivel := True;
  batuctnivel := True;

  //locais
  batucodlocal := True;
  batudesclocal := True;
  batutipolocal := True;
  batusigla := True;
  batucgclocal := True;
  batuativlocal := True;  
  binserelocal := True;

  //orgãos
  batucodorgao := True;
  batudescorgao := True;
  batulocalorgao := True;

  //situações
  batucodsituacao := True;
  batudescsituacao := True;

  //rubricas
  batucodrubrica    := True;
  batudescrubrica := True;
  batutipoindicador := True;
  batuincidesalario := True;
  binsererubrica := True;

  // documentos
   bAtuCodDocumento   := True;
   bAtuNumDocumento   := True;
   bAtuDtExpDocumento := True;
   bAtuUFDocumento   := True;



   //eventos
   batuevento :=  True;
   binsereevento := True;

   bInsereDocumento := True;

   pgctrlOpcoes.ActivePage := tbsEmpregado;
end;

function TfrmImportaDadosCadastrais.ConvMes(sMes,sFormato,sIniAno:String):String;
begin
   sMes:=trim(sMes);
   Result:=sMes;
   if sFormato = 'AAAA/MM' then begin
      Result:=sMes;
   end else begin
      if sFormato = 'MM/AAAA' then begin
         Result:=copy(sMes,4,4)+'/'+copy(sMes,1,2);
      end else begin
         if sFormato = 'AAAAMM' then begin
            Result:=copy(sMes,1,4)+'/'+copy(sMes,5,2);
         end else begin
            if sFormato = 'MMAAAA' then begin
               Result:=copy(sMes,3,4)+'/'+copy(sMes,1,2);
            end else begin
               if sFormato = 'DD/MM/AAAA' then begin
                  Result:=copy(sMes,7,4)+'/'+copy(sMes,4,2);
               end else begin
                  if sFormato = 'AAAAMMDD' then begin
                     Result:=copy(sMes,1,4)+'/'+copy(sMes,5,2);
                  end else begin
                     if sFormato = 'DDMMAAAA' then begin
                        Result:=copy(sMes,5,4)+'/'+copy(sMes,3,2);
                     end else begin
                        if sFormato = 'AA/MM' then begin
                           Result:=sIniAno+copy(sMes,1,2)+'/'+copy(sMes,4,2);
                        end else begin
                           if sFormato = 'MM/AA' then begin
                              Result:=sIniAno+copy(sMes,4,2)+'/'+copy(sMes,1,2);
                           end else begin
                              if sFormato = 'AAMM' then begin
                                 Result:=sIniAno+copy(sMes,1,2)+'/'+copy(sMes,3,2);
                              end else begin
                                 if sFormato = 'MMAA' then begin
                                    Result:=sIniAno+copy(sMes,3,2)+'/'+copy(sMes,1,2);
                                 end else begin
                                    if sFormato = 'DD/MM/AA' then begin
                                       Result:=sIniAno+copy(sMes,7,2)+'/'+copy(sMes,4,2);
                                    end else begin
                                       if sFormato = 'AAMMDD' then begin
                                          Result:=sIniAno+copy(sMes,1,2)+'/'+copy(sMes,3,2);
                                       end else begin
                                          if sFormato = 'DDMMAA' then begin
                                             Result:=sIniAno+copy(sMes,5,2)+'/'+copy(sMes,3,2);
                                          end;
                                       end;
                                    end;
                                 end;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
         end;
      end;
   end;
//
end;



function TfrmImportaDadosCadastrais.ConvValor(sValor:String):String;

var sSvDec:Char;
    rValor:Double;
    iValDiv,xx:Integer;
    sValDiv:String;
Begin
  sSvDec           := DecimalSeparator;
  if qryLayOutArquivo.FieldByName('FLGTIPOSEPARADEC').AsString = 'P' then begin
     Result:=sValor;
  end else begin
     if qryLayOutArquivo.FieldByName('FLGTIPOSEPARADEC').AsString = 'V' then begin
        DecimalSeparator := ',';
        rValor:=StrToFloat(trim(sValor));
        DecimalSeparator := '.';
        Result:=FloatToStr(rValor);
     end else begin
        DecimalSeparator := '.';
        sValDiv:='1';
        for xx:=1 to qryLayOutArquivo.FieldByName('NUMCASASDEC').AsInteger do begin
           sValDiv:=sValDiv+'0';
        end;
        iValDiv:=StrToInt(Trim(sValDiv));
        rValor :=StrToFloat(trim(sValor))/iValDiv;
        Result :=FloatToStr(rValor);
     end;
  end;
  Result:=Trim(Result);
  DecimalSeparator :=sSvDec;
end;

// IMPORTADADOSCADASTRAIS
// Alteracao para fazer um UPDATE por pessoa em cada tabela
procedure TfrmImportaDadosCadastrais.IMPORTADADOSCADASTRAIS;
Var
   sSqlUpdate, sDataNascTxt, sDataNascCad,
   sDataAdmTxt, sDataAdmCad, sSqlAux,
   sNumIdent, sUfIdent, sDtExpedIdent, sMatConj,
   sNome, sNumDocumento, sIdCidade, sNomePai, sNomeMae,
   sEstCivil, sDataMorte,  sIdCargo, sNivel,
   sTempoServTotal, sTempoNaocreditado, sTempoServAnterior,
   sIdEstab, sIdSitFunc, sTpPublAnt, sTpPrivAnt,
   sFlgDiretor, sTpServReal, sValorbase1, sValorbase2, sValorBase3,
   sValorBase4, sValorbase5, sValorbase6, sIdFuncaoExt, sDataReadm, sCdVincFunc      : string;
   bErro : boolean;
   iContaBancaria, iIdBanco, iIdAgencia,
   iAgenciaTxt, iAgenciaDados, iBancoTxt, iBancoDados : integer;
   iPessoa, iPessoaFisica  : integer;

   sFlgIntSitPart,
   sSQLAlterados : string;

   bJaAtualizouConta : Boolean;

   sTipoSit : String;
Begin


   If dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.Commit;
   StartTransacao;

   pbStatus.Min := 0;
   pbStatus.Max := qryTxt.RecordCount;

   // balance line  -  dados importados com os já existentes
   WHILE ( not qryTxt.EOF ) and ( not qryDadosNoBanco.EOF ) do
   BEGIN
      pbStatus.Position := qryTxt.RecNo;
      frmImportaDadosCadastrais.update;

      if (qryTxt.FieldByName('MATRICULA').AsString = qryDadosNoBanco.FieldByName('MATRICULA').AsString)
      then begin

         // Verificar situacao do participante
         sFlgIntSitPart := VoltaFlgInterno(qryAux, IntToStr(iPatro), qryDadosNoBanco.FieldByName('IDPESSOA').AsString, sTipoSit);

         if (sFlgIntSitPart = 'CA') and  ((sTipoSit = 'A') or (sTipoSit = 'F')) then sFlgIntSitPart := 'AT';

         if ((sFlgIntSitPart = 'CA') and (chkCancelados.Checked)) OR
            ((sFlgIntSitPart = 'MA') and (chkMantidos.Checked))   OR
            ((sFlgIntSitPart = 'AS') and (chkAssistidos.Checked))
         then begin
           if sFlgIntSitPart = 'CA'
           then TabCriticasCcp.Insere(qryaux,iPatro,
                                 qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                 dSeqCritica,
                                 sMesCobranca,
                                 qryTxt.FieldByName('MATRICULA').AsString ,
                                 sFlgIntSitPart,
                                 '',
                                 cChave,
                                 cePartCancelado,
                                 tdCaracter,'',
                                 gCadastro,
                                 pNProcessado,'',
                                 '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString)
           else if sFlgIntSitPart = 'MA'
                then TabCriticasCcp.Insere(qryaux,iPatro,
                                      qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                      dSeqCritica,
                                      sMesCobranca,
                                      qryTxt.FieldByName('MATRICULA').AsString ,
                                      sFlgIntSitPart,
                                      '',
                                      cChave,
                                      cePartMantido,
                                      tdCaracter,'',
                                      gCadastro,
                                      pNProcessado,'','','','','','',sFlgIntSitPart,
                                      qrytxt.fieldbyname('IDSITFUNC').AsString)
                else TabCriticasCcp.Insere(qryaux,iPatro,
                                      qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                      dSeqCritica,
                                      sMesCobranca,
                                      qryTxt.FieldByName('MATRICULA').AsString ,
                                      sFlgIntSitPart,
                                      '',
                                      cChave,
                                      cePartAssistido,
                                      tdCaracter,'',
                                      gCadastro,
                                      pNProcessado,'',
                                      '','','','','',sFlgIntSitPart,
                                      qrytxt.fieldbyname('IDSITFUNC').AsString);
           // move para o próximo registro
           if (QryTxt.FieldByName('MATRICULA').AsString = qryDadosNoBanco.FieldByName('MATRICULA').AsString)
           then begin
              qrytxt.next;
              qryDadosNoBanco.next;
              continue;
           end
           else if (QryTxt.FieldByName('MATRICULA').AsString < qryDadosNoBanco.FieldByName('MATRICULA').AsString)
           then begin
              qrytxt.next;
              continue;
           end
           else if (QryTxt.FieldByName('MATRICULA').AsString > qryDadosNoBanco.FieldByName('MATRICULA').AsString)
           then begin
              qryDadosNoBanco.next;
              continue;
           end;
         end;


         // André Pontes - pendência 27282 - 13/02/2008
         // if uppercase(sFlgIntSitPart) = 'AT' then
         if (uppercase(sFlgIntSitPart) = 'AT') or (uppercase(sFlgIntSitPart) = 'MP') then
         begin
            if qryLayOutArquivo.FieldbyName('DCBANCOTAM').AsInteger > 0
            then begin

               // Verifica se a conta que veio no arquivo já existe no banco
               sSQLAux := ' SELECT EL.IDPESSOA,  EL.MATRICULA,  B.NUMBANCO, '+
                  '        AB.NUMAGENCIA,   CB.CONTACORRENTE,  NVL(CB.FLGCONTAPREF,0) FLGCONTAPREF   '+
                  ' FROM   ELEGPATRO EL, CONTABANCARIA CB,          '+
                  '        AGENCIABANCARIA AB, BANCO B  '+
                  ' WHERE  EL.IDPESSJUR   = '+IntToStr(iPatro)+
                  ' AND    EL.IDPESSOA = '+qryDadosNoBanco.FieldByName('IDPESSOA').AsString+' '+
                  ' AND    CB.IDPESSOA = EL.IDPESSOA        '+
                  ' AND    CB.IDAGENCIA   = AB.IDPESSOA       '+

                  //Denise Arruda - 25/09/2008 - N. Sol 96977 -  N. Kintana 421093
                  ' AND    RTRIM(LTRIM(AB.NUMAGENCIA))    = ''' + Trim(qryTxt.FieldByName('AGENCIA').AsString) + ''''+

                  ' AND    RTRIM(LTRIM(CB.CONTACORRENTE)) = '''+trim(QryTxt.FieldByName('CCORRENTE').AsString)+'''  '+
                  ' AND    AB.IDBANCO     = B.IDPESSOA ';

               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.Add(sSQLAux);
               qryAux.Open;

               bJaAtualizouConta := false;

               // Se existir...
               if not(qryAux.isempty) then
               begin
                  bJaAtualizouConta := true;

                  if qryaux.fieldbyname('FLGCONTAPREF').AsInteger = 0 then
                  begin
                     sSQLAux := ' SELECT AB.IDPESSOA IDAGENCIA ' +
                                ' FROM   AGENCIABANCARIA AB, BANCO B   '+
                                ' WHERE  AB.NUMAGENCIA = ''' + Trim(qryTxt.FieldByName('AGENCIA').AsString) + ''''+
                                ' AND    B.NUMBANCO    = ''' + Trim(qryTxt.FieldByName('BANCO').AsString)   + ''''+
                                ' AND    AB.IDBANCO    = B.IDPESSOA ';

                     qryAux.Close;
                     qryAux.SQL.Clear;
                     qryAux.SQL.Add(sSQLAux);
                     qryAux.Open;

                     sSqlUpdate := ' UPDATE CONTABANCARIA SET FLGCONTAPREF = 0 '+
                                   ' WHERE IDPESSOA = ' + inttostr(qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger);
                     QryUpDate.SQL.Text := sSqlUpdate;
                     QryUpdate.ExecSQL;


                     sSqlUpdate := ' UPDATE CONTABANCARIA SET FLGCONTAPREF = 1 '+
                                   //Denise Arruda - 25/09/2008 - N. Sol 96977 -  N. Kintana 421093
                                   '  WHERE IDAGENCIA     = ''' + Trim(qryaux.FieldByName('IDAGENCIA').AsString) + ''''+

                                   '    AND CONTACORRENTE = ''' + QryTxt.FieldByName('CCORRENTE').AsString + '''';
                     sSqlUpDate := sSqlUpDate + ' AND IDPESSOA = ' + inttostr(qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger);
                     QryUpDate.SQL.Text := sSqlUpdate;
                     QryUpdate.ExecSQL;
                  end;
               end;



               // Se a pessoa não tiver os dados completos da conta corrente (banco, agencia e conta) no txt e tambem
               // nao tiver no banco de dados, não considerar isto como uma divergencia
               if (not (( (qryTxt.FieldByName('AGENCIA').AsString                = '') and
                         (qryDadosNoBanco.FieldByName('NUMAGENCIA').AsString    = '')       ) OR
                       ( (qryTxt.FieldByName('CCORRENTE').AsString              = '') and
                         (qryDadosNoBanco.FieldByName('CONTACORRENTE').AsString = '')       )))
                   and (not bJaAtualizouConta)
               then begin
                  // ATUALIZACAO DA TABELA CONTABANCARIA
                  if ((qryTxt.FieldByName('BANCO').AsString     <> qryDadosNoBanco.FieldByName('NUMBANCO').AsString)      and
                      (qryTxt.FieldByName('BANCO').AsInteger     > 0                                                                            ))  OR
                     ((qryTxt.FieldByName('AGENCIA').AsString   <> qryDadosNoBanco.FieldByName('NUMAGENCIA').AsString)    and
                      (qryTxt.FieldByName('AGENCIA').AsString   <> Replicate('0', qryLayOutArquivo.FieldByName('DCAGENCIATAM').AsInteger)) and
                      (qryTxt.FieldByName('AGENCIA').AsString   <> '')                                                                           )  OR
                     ((qryTxt.FieldByName('CCORRENTE').AsString <> qryDadosNoBanco.FieldByName('CONTACORRENTE').AsString) and
                      (qryTxt.FieldByName('CCORRENTE').AsString <> Replicate('0', qryLayOutArquivo.FieldByName('DCCCTAM').AsInteger)) and
                      (qryTxt.FieldByName('CCORRENTE').AsString <> '')
                     )
                  then begin
                     iIdAgencia := 0;
                     // Testa existência do BANCO E DA AGENCIA SEPARADAMENTE PARA SABER O TIPO DE ERRO
                     if   (Trim(qryTxt.FieldByName('AGENCIA').AsString) = '') or
                          (qryTxt.FieldByName('AGENCIA').AsString  = Replicate('0', qryLayOutArquivo.FieldByName('DCAGENCIATAM').AsInteger))
                     then begin

                        if Trim(qryTxt.FieldByName('AGENCIA').AsString) = '' then
                           TabCriticasCcp.Insere(qryaux,iPatro,
                                              qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                              dSeqCritica,
                                              sMesCobranca,
                                              qrytxt.FieldByName('MATRICULA').AsString ,
                                              qryDadosNoBanco.FieldByName('NUMAGENCIA').AsString,
                                              qryTxt.FieldByName('AGENCIA').AsString,
                                              cChave, ceAgenciaZerada, tdCaracter,'', gCadastro, pNProcessado,'',
                                              '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);

                     end
                     else begin
                        sSQLAux := ' SELECT AB.IDPESSOA IDAGENCIA ' +
                                   ' FROM   AGENCIABANCARIA AB, BANCO B   '+
                                   ' WHERE  AB.NUMAGENCIA = ''' + Trim(qryTxt.FieldByName('AGENCIA').AsString) + ''''+
                                   ' AND    B.NUMBANCO    = ''' + Trim(qryTxt.FieldByName('BANCO').AsString)   + ''''+
                                   ' AND    AB.IDBANCO    = B.IDPESSOA ';

                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.Add(sSQLAux);
                        qryAux.Open;

                        if qryAux.IsEmpty
                        then begin
                           TabCriticasCcp.Insere(qryaux,iPatro,
                                                 qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                                 dSeqCritica,
                                                 sMesCobranca,
                                                 qrytxt.FieldByName('MATRICULA').AsString ,
                                                 qryDadosNoBanco.FieldByName('NUMAGENCIA').AsString,
                                                 QryTxt.FieldByName('AGENCIA').AsString,
                                                 cChave, ceAgenciaNEcontrada, tdCaracter,'', gCadastro, pNProcessado,'',
                                                 '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);

                        end
                        else iIdAgencia := qryAux.FieldByName('IDAGENCIA').AsInteger;
                     end;

                     if (iIdAgencia > 0) and (Trim(qryTXT.FieldByName('CCORRENTE').AsString) <> '')
                     then begin
                        // Se ContaCorrente não existe então inclui uma conta bancária
                        try
                           // André Pontes - pendência 27282 - 14/02/2008
                           // if Trim(qryDadosNoBanco.FieldByName('CONTACORRENTE').AsString) <> ''
                           if Trim(qryDadosNoBanco.FieldByName('CONTACORRENTE').AsString) <> Trim(qryTXT.FieldByName('CCORRENTE').AsString)
                           then begin
                              //CPrev - 13/06/2008 - Pend. 28046
                              //desmarcar as contas preferenciais existentes no banco de dados
                              sSqlUpdate := ' UPDATE CONTABANCARIA SET FLGCONTAPREF = 0 '+
                                            ' WHERE IDPESSOA = ' + inttostr(qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger);
                              QryUpDate.SQL.Text := sSqlUpdate;
                              QryUpdate.ExecSQL;
                              //CPrev - 13/06/2008 - Pend. 28046 - fim

                              iContaBancaria := LeUltRegistro(Nil,'CONTABANCARIA ');
                              sSqlUpdate := 'INSERT INTO CONTABANCARIA (IDCBANCARIA, IDAGENCIA , CONTACORRENTE, IDPESSOA, FLGCONTAPREF ) ';
                              sSqlUpdate := sSqlUpdate + 'VALUES (' + inttostr(iContaBancaria) +', '+ inttostr(iIdAgencia); // Sequence da ContaBancaria
                              sSqlUpDate := sSqlUpDate + ', ''' + QryTxt.FieldByName('CCORRENTE').AsString + '''';
                              sSqlUpDate := sSqlUpDate + ', ' + inttostr(qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger) + ',1)';
                              QryUpDate.SQL.Text := sSqlUpdate;
                              QryUpdate.ExecSQL;
                           end
                           else if batuconta
                                then begin // Altera a Conta corrente - já existe
                                   sSqlUpdate := 'UPDATE CONTABANCARIA SET IDAGENCIA = ' + inttostr(iIdAgencia);
                                   sSqlUpDate := sSqlUpDate + ' , CONTACORRENTE = ''' + QryTxt.FieldByName('CCORRENTE').AsString + '''';
                                   sSqlUpDate := sSqlUpDate + ' WHERE IDPESSOA = ' + inttostr(qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger);
                                   QryUpDate.SQL.Text := sSqlUpdate;
                                   QryUpdate.ExecSQL;
                                end;
                           TabCriticasCcp.Insere(qryaux,iPatro,
                                                 qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                                 dSeqCritica,
                                                 sMesCobranca,
                                                 qrytxt.FieldByName('MATRICULA').AsString ,
                                                 qryDadosNoBanco.FieldByName('CONTACORRENTE').AsString,
                                                 QryTxt.FieldByName('CCORRENTE').AsString,
                                                 cChave, ceContaAlterada, tdCaracter,'', gCadastro, pNProcessado,'',
                                                 '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);
                        except
                           TabCriticasCcp.Insere(qryaux,iPatro,
                                                 qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                                 dSeqCritica,
                                                 sMesCobranca,
                                                 qrytxt.FieldByName('MATRICULA').AsString ,
                                                 qryDadosNoBanco.FieldByName('CONTACORRENTE').AsString,
                                                 qryTxt.FieldByName('CCORRENTE').AsString,
                                                 cChave, ceErroAltConta, tdCaracter,'', gCadastro, pNProcessado,'',
                                                 '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);
                        end;
                     end;
                  end;
               end;
            end;
         end;



         // ALTERACAO NA TABELA PESSOA
         sSQLAlterados := '';

         // Testa se o nome do participante alterou
         if (qryLayOutArquivo.FieldbyName('DCEMPREGTAM').AsInteger > 0) and
            (Trim(QryTxt.FieldByName('NOME').AsString) <> Trim(qryDadosNoBanco.FieldByName('NOME').AsString))
            and (Trim(QryTxt.FieldByName('NOME').AsString) <> '')
         then begin
            if batunome
            then begin
                sSQLAlterados := sSQLAlterados + ', NOME = '+Trim(QuotedStr(QryTxt.FieldByName('NOME').AsString))+'';
                sSQLAlterados := sSQLAlterados + ', RAZAOSOCIAL = '+Trim(QuotedStr(QryTxt.FieldByName('NOME').AsString))+'';

                pProcessoAux := pAceito ;
            end
            else begin
                pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere(qryaux,iPatro,
                                  qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                  dSeqCritica,
                                  sMesCobranca,
                                  qrytxt.FieldByName('MATRICULA').AsString ,
                                  qryDadosNoBanco.FieldByName('NOME').AsString,
                                  QryTxt.FieldByName('NOME').AsString,
                                  cChave, ceNomeAlterado, tdCaracter,'', gCadastro,
                                  pProcessoAux, '','','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;


         // Testa se o CPF alterou
         if (qryLayOutArquivo.FieldbyName('DCCPFTAM').AsInteger > 0) and
            (QryTxt.FieldByName('CPF').AsString <> qryDadosNoBanco.FieldByName('NUMDOCUMENTO').AsString)
            and (Trim(QryTxt.FieldByName('CPF').AsString) <> '')
         then  begin
            if batucpf then
            begin
                sSQLAlterados := sSQLAlterados + ', numdocumento = '''+QryTxt.FieldByName('CPF').AsString+'''';

                try
                   qryUpdate.Close;
                   qryUpdate.SQL.Clear;
                   qryUpdate.SQL.Add(' UPDATE DOCPESSOA SET NUMDOCUMENTO = '''+QryTxt.FieldByName('CPF').AsString+''' '+
                                     ' WHERE  IDPESSOA = '+IntToStr(qryDadosNoBanco.FieldByName('idpessoa').AsInteger)+
                                     ' AND  IDDOCUMENTO = (SELECT IDDOCUMENTO FROM TIPODOCPESSOA WHERE UPPER(NOMEDOCUMENTO ) LIKE ''%CPF%'')  ');
                   qryUpdate.ExecSQL;
                except   end;

                pProcessoAux := pAceito ;
            end
            else begin
                pProcessoAux := pNProcessado ;
            end;



            TabCriticasCcp.Insere(qryaux,iPatro,
                                  qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                  dSeqCritica,
                                  sMesCobranca,
                                  qrytxt.FieldByName('MATRICULA').AsString ,
                                  qryDadosNoBanco.FieldByName('NUMDOCUMENTO').AsString,
                                  QryTxt.FieldByName('CPF').AsString,
                                  cChave, ceNumDocumentoAlterado, tdCaracter,'', gCadastro, pProcessoAux, '',
                                  '','','','','' ,sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);
         end;


         // Testa se o email alterou
         if (qryLayOutArquivo.FieldbyName('DCEMAILTAM').AsInteger > 0) and
            (QryTxt.FieldByName('EMAIL').AsString <> qryDadosNoBanco.FieldByName('EMAIL').AsString)
            and (Trim(QryTxt.FieldByName('EMAIL').AsString) <> '')
         then  begin
            if batucpf then
            begin
                sSQLAlterados := sSQLAlterados + ', EMAIL = '''+QryTxt.FieldByName('EMAIL').AsString+'''';
                pProcessoAux := pAceito ;
            end
            else begin
                pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere(qryaux,iPatro,
                                  qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                  dSeqCritica,
                                  sMesCobranca,
                                  qrytxt.FieldByName('MATRICULA').AsString ,
                                  qryDadosNoBanco.FieldByName('EMAIL').AsString,
                                  QryTxt.FieldByName('EMAIL').AsString,
                                  cChave, ceemailAlterado, tdCaracter,'', gCadastro, pProcessoAux, '',
                                  '','','','','' ,sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);
         end;

         if Trim(sSQLAlterados) <> ''
         then begin
            try
               sSQLAlterados := Copy(Trim(sSQLAlterados), 2, Length(sSQLAlterados));
               qryUpdate.Close;
               qryUpdate.SQL.Clear;
               qryUpdate.SQL.Add(' UPDATE PESSOA SET '+ sSQLAlterados+
                                 ' WHERE  IDPESSOA = '+IntToStr(qryDadosNoBanco.FieldByName('idpessoa').AsInteger));
               qryUpdate.ExecSQL;
            except
               memoErros.Lines.Add('Erro ao atualizar dados da tabela PESSOA.');
            end;
         end;

         // ALTERACAO NA TABELA DOCPESSOA
         sSQLAlterados := '';
         // Trata número de identidade se o tipo de documento foi parametrizadao
         if (qryLayOutArquivo.FieldbyName('DCIDENTTAM').AsInteger > 0)
            and (qryLayOutArquivo.FieldByName('DCIDDOCIDENT').AsString <> '')
         then  begin
             qryaux.close;
             qryaux.SQL.clear;
             qryaux.sql.add(' SELECT D.NUMDOCUMENTO, E.CODESTADO AS UF, '+
                            '        TO_CHAR(D.DATAEMISSAO,'''+qryLayOutArquivo.FieldByName('DCFTDTEXPIDENT').AsString+''') DATAEMISSAO '+
                            ' FROM   DOCPESSOA D, ESTADO E '+
                            ' WHERE  D.IDPESSOA = '+qryDadosNoBanco.FieldByName('IDPESSOA').AsString+
                            ' AND    D.IDDOCUMENTO = '''+qryLayOutArquivo.FieldByName('DCIDDOCIDENT').AsString+''''+
                            ' AND    D.IDESTADO    = E.IDESTADO(+) ');

             qryaux.open;

             if not qryaux.isempty
             then begin

                 sNumIdent     :=  qryaux.fieldbyname('NUMDOCUMENTO').AsString;
                 sUfIdent      :=  qryaux.fieldbyname('UF').AsString;
                 sDtExpedIdent :=  qryaux.fieldbyname('DATAEMISSAO').AsString;

                 sSqlUpdate := '';

                 if (QryTxt.FieldByName('NUMIDENT').AsString <> '') and
                    (Trim(sNumIdent) <> Trim(QryTxt.FieldByName('NUMIDENT').AsString))
                    and (Trim(sNumIdent) <> '')
                 then begin
                    if batuident
                    then begin
                       sSQLAlterados := sSQLAlterados + ', NUMDOCUMENTO = '''+QryTxt.FieldByName('NUMIDENT').AsString+''' ';
                       pProcessoAux := pAceito ;
                    end
                    else begin
                        pProcessoAux := pNProcessado ;
                    end;

                    TabCriticasCcp.Insere(qryaux,iPatro,
                               qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                               dSeqCritica,
                               sMesCobranca,
                               qrytxt.FieldByName('MATRICULA').AsString ,
                               sNumIdent,
                               QryTxt.FieldByName('NUMIDENT').AsString,
                               cChave, ceNumIdentlterada, tdCaracter,'',
                               gCadastro, pProcessoAux, '',
                               '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
                 end;

                 if (QryTxt.FieldByName('UFIDENT').AsString <> '') and
                    (Trim(sUfIdent) <> Trim(QryTxt.FieldByName('UFIDENT').AsString))
                    and (Trim(sUfIdent) <> '')
                 then begin
                    if batuufident
                    then begin
                        // BUSCAR IDESTADO DA UF QUE VEIO NO TXT
                        with qryAux do
                        begin
                           Close;
                           SQL.Clear;
                           SQL.Add(' SELECT IDESTADO FROM ESTADO WHERE CODESTADO = '''+QryTxt.FieldByName('UFIDENT').AsString+'''');
                           Open;
                        end;

                        if not qryAux.IsEmpty
                        then begin
                           sSQLAlterados := sSQLAlterados+' , IDESTADO = '+qryAux.FieldByName('IDESTADO').AsString;
                           pProcessoAux := pAceito ;
                           TabCriticasCcp.Insere(qryaux,iPatro,
                                      qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                      dSeqCritica,
                                      sMesCobranca,
                                      qrytxt.FieldByName('MATRICULA').AsString ,
                                      sUfIdent,
                                      QryTxt.FieldByName('UFIDENT').AsString,
                                      cChave, ceUfIdentAltarada, tdCaracter,'',
                                      gCadastro, pProcessoAux, '',
                                      '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );


                        end
                        else begin
                           pProcessoAux := pNProcessado ;
                           TabCriticasCcp.Insere(qryaux,iPatro,
                                      qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                      dSeqCritica,
                                      sMesCobranca,
                                      qrytxt.FieldByName('MATRICULA').AsString ,
                                      '',
                                      QryTxt.FieldByName('UFIDENT').AsString,
                                      cChave, ceUFNEncontrada, tdCaracter,'',
                                      gCadastro, pNProcessado, '',
                                      '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
                        end;
                    end
                    else begin
                        pProcessoAux := pNProcessado ;
                        TabCriticasCcp.Insere(qryaux,iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   sUfIdent,
                                   QryTxt.FieldByName('UFIDENT').AsString,
                                   cChave, ceUfIdentAltarada, tdCaracter,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
                    end;

                 end;


                 if (QryTxt.FieldByName('DTEXPIDENT').AsString <> '') and
                    (Trim(sDtExpedIdent) <> Trim(QryTxt.FieldByName('DTEXPIDENT').AsString))
                    and (Trim(sDtExpedIdent) <> '')
                 then begin
                    if batudtexpident
                    then begin
                       sSQLAlterados := sSQLAlterados+' ,DATAEMISSAO = TO_DATE('''+QryTxt.FieldByName('DTEXPIDENT').AsString+''', '+
                                         ' '''+qryLayOutArquivo.FieldByName('DCFTDTEXPIDENT').AsString+''') ';
                       pProcessoAux := pAceito ;
                    end
                    else begin
                        pProcessoAux := pNProcessado ;
                    end;

                    TabCriticasCcp.Insere(qryaux,iPatro,
                               qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                               dSeqCritica,
                               sMesCobranca,
                               qrytxt.FieldByName('MATRICULA').AsString ,
                               sDtExpedIdent,
                               QryTxt.FieldByName('DTEXPIDENT').AsString,
                               cChave, ceDtExpedIdentAlterada, tdData,
                               qryLayOutArquivo.FieldByName('DCFTDTEXPIDENT').AsString,
                               gCadastro, pProcessoAux, '',
                               '','','','','',sFlgIntSitPart , qrytxt.fieldbyname('IDSITFUNC').AsString);
                 end;

                 if sSQLAlterados <> ''
                 then  begin
                    try
                       sSQLAlterados := Copy(Trim(sSQLAlterados), 2, Length(sSQLAlterados));
                       qryUpdate.Close;
                       qryUpdate.SQL.Clear;
                       qryUpdate.SQL.Add(' UPDATE DOCPESSOA SET '+ sSQLAlterados+
                                         ' WHERE  IDPESSOA    = '+IntToStr(qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger)+
                                         ' AND    IDDOCUMENTO = '''+qryLayOutArquivo.FieldByName('DCIDDOCIDENT').AsString+''' ');
                       qryUpdate.ExecSQL;

                    except
                       memoErros.Lines.Add('Erro ao atualizar dados da tabela de DOCUMENTOS.');
                    end;
                 end;
             end
             else begin
                 if   (QryTxt.FieldByName('NUMIDENT').AsString <> '') and
                      (qryLayOutArquivo.FieldByName('DCIDDOCIDENT').AsString <> '')
                 then begin
                     if binsereident then
                     begin
                         sSqlUpDate := ' INSERT INTO DOCPESSOA(IDPESSOA, IDDOCUMENTO, '+
                                       ' NUMDOCUMENTO, UF, DATAEMISSAO) '+
                                       ' VALUES ('+inttostr(qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger)+' ,'+
                                                 ' '''+qryLayOutArquivo.FieldByName('DCIDDOCIDENT').AsString+''' ,'+
                                                 ' '''+QryTxt.FieldByName('NUMIDENT').AsString+''' ,'+
                                                 ' '''+QryTxt.FieldByName('UFIDENT').AsString+'''  ,'+
                                                 ' TO_DATE('''+QryTxt.FieldByName('DTEXPIDENT').AsString+''', '+
                                                 '         '''+qryLayOutArquivo.FieldByName('DCFTDTEXPIDENT').AsString+''') ) ';
                         QryUpDate.SQL.Text := sSqlUpdate;
                         QryUpdate.ExecSQL;

                         pProcessoAux := pAceito ;
                     end
                     else begin
                         pProcessoAux := pNProcessado ;
                     end;

                     TabCriticasCcp.Insere(qryaux,iPatro,
                               qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                               dSeqCritica,
                               sMesCobranca,
                               qrytxt.FieldByName('MATRICULA').AsString ,
                               '',
                               CompletaString(QryTxt.FieldByName('NUMIDENT').AsString,' ',18,True)+' '+
                               CompletaString(QryTxt.FieldByName('UFIDENT').AsString,' ',2,True)+' '+
                               CompletaString(QryTxt.FieldByName('DTEXPIDENT').AsString,' ',10,True),
                               cChave, ceNumIdentInserido, tdCaracter,
                               '',
                               gCadastro, pProcessoAux, '',
                               '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );


                 end;

             end;
         end;
         //fim identidade


         // ALTERACAO NA TABELA PESSOAFISICA
         sSQLAlterados := '';

         // Testa se o nascimento alterou
         if (qryLayOutArquivo.FieldbyName('DCDTNASCTAM').AsInteger > 0)
         then begin
            sDataNascTxt := qryTxt.FieldByName('NASCIMENTO').AsString;
            sDataNascCad := qryDadosNoBanco.FieldByName('DATANASC').AsString;
            if (sDataNascTxt <> sDataNascCad) and (trim(sDataNascTxt) <> '')
            then begin
               if batudatanasc then
               begin
                   sSQLAlterados := sSQLAlterados+', DATANASC = TO_DATE('''+sDataNascTxt +''','+
                                    ''''+qryLayOutArquivo.FieldByName('DCDTNASCFORMATO').AsString+''')';
                   pProcessoAux := pAceito ;
               end
               else begin
                   pProcessoAux := pNProcessado ;
               end;

               TabCriticasCcp.Insere(qryaux,iPatro,
                                     qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                     dSeqCritica,
                                     sMesCobranca,
                                     qrytxt.FieldByName('MATRICULA').AsString ,
                                     sDataNascCad,
                                     sDataNascTxt,
                                     cChave, ceDataNascAlterada, tdData,
                                     qryLayOutArquivo.FieldByName('DCDTNASCFORMATO').AsString, gCadastro, pProcessoAux, '',
                                     '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
            end;
         end;

         // Testa se o sexo alterou
         if (qryLayOutArquivo.FieldbyName('DCSEXOTAM').AsInteger > 0) and
            (QryTxt.FieldByName('SEXO').AsString <> qryDadosNoBanco.FieldByName('SEXO').AsString)
            and (trim(QryTxt.FieldByName('SEXO').AsString) <> '')
         then begin
            sSexo := QryTxt.FieldByName('SEXO').AsString;

            if bAtuSexo then
            begin
                sSQLAlterados := sSQLAlterados+', SEXO = '''+sSexo+'''';
                pProcessoAux := pAceito ;
            end
            else begin
                pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere(qryaux,iPatro,
                                  qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                  dSeqCritica,
                                  sMesCobranca,
                                  qrytxt.FieldByName('MATRICULA').AsString ,
                                  qryDadosNoBanco.FieldByName('SEXO').AsString,
                                  QryTxt.FieldByName('SEXO').AsString,
                                  cChave, ceSexoAlterado, tdCaracter,'', gCadastro, pProcessoAux, '',
                                  '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;

         // Testa de o numero de dependentes do irrf alterou
         if (qryLayOutArquivo.FieldbyName('DCDEPENDTAM').AsInteger > 0)
         then begin
            try    iDpdIrrfTxt :=  strtoint(Trim(QryTxt.FieldByName('IRRF').AsString));
            except iDpdIrrfTxt :=0;  end;

            try    iDpdIrrfCad :=  strtoint(Trim(qryDadosNoBanco.FieldByName('NUMDEPIRRF').AsString));
            except iDpdIrrfCad :=0;  end;

            if ( iDpdIrrfTxt <> iDpdIrrfTxt) then
            begin
               if batudepirrf then
               begin
                   sSQLAlterados := sSQLAlterados +', NUMDEPIRRF = '+QryTxt.FieldByName('IRRF').AsString;
                   pProcessoAux := pAceito ;
               end
               else begin
                   pProcessoAux := pNProcessado ;
               end;

               TabCriticasCcp.Insere(qryaux,iPatro,
                                     qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                     dSeqCritica,
                                     sMesCobranca,
                                     qrytxt.FieldByName('MATRICULA').AsString ,
                                     qryDadosNoBanco.FieldByName('NUMDEPIRRF').AsString,
                                     QryTxt.FieldByName('IRRF').AsString,
                                     cChave, ceNDpdIrrfAlterado, tdNumerico,'', gCadastro, pProcessoAux, '',
                                     '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
            end;
         end;

         // Trata municipio de naturalidade
         if (qryLayOutArquivo.FieldbyName('DCCODMUNNATTAM').AsInteger > 0) and
            (Trim(qrytxt.FieldByName('CDMUNNAT').AsString) <> '')
         then begin
             qryaux.close;
             qryaux.SQL.clear;
             qryaux.sql.add(' SELECT IDCIDADES  FROM CIDADES '+
                            ' WHERE CODMUNICIPIO = '+quotedstr(trim(qrytxt.FieldByName('CDMUNNAT').AsString))+'  ');
             qryaux.open;

             if not qryaux.isempty
             then begin
                // Testa se é diferente do já cadastrado
                if  (qryaux.fieldbyname('IDCIDADES').AsInteger <>
                    qryDadosNoBanco.fieldbyname('IDCIDADES').AsInteger)
                then begin
                     if batumunnat then
                     begin
                         sSQLAlterados := sSQLAlterados+', IDCIDADES = '+qryaux.fieldbyname('IDCIDADES').AsString;
                         pProcessoAux := pAceito ;
                     end
                     else begin
                         pProcessoAux := pNProcessado ;
                     end;

                     TabCriticasCcp.Insere(qryaux,iPatro,
                                qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                dSeqCritica,
                                sMesCobranca,
                                qrytxt.FieldByName('MATRICULA').AsString ,
                                qryDadosNoBanco.fieldbyname('IDCIDADES').AsString,
                                QryTxt.FieldByName('IDCIDADES').AsString,
                                cChave, ceNumNatAlterado, tdNumerico,'',
                                gCadastro, pProcessoAux, '',
                                '','','','','' ,sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);
                end;
             end;
         end;
         //fim municipio de naturalidade


         sSqlUpDate := '';
         //trata nome do pai
         if (qryLayOutArquivo.FieldbyName('DCNMPAITAM').AsInteger > 0) and
            (Trim(qrytxt.fieldbyname('NOMEPAI').AsString) <> Trim(qryDadosNoBanco.fieldbyname('NOMEPAI').AsString) )
            and (Trim(qrytxt.fieldbyname('NOMEPAI').AsString) <> '')
         then begin
            if batunomepai
            then begin
                 sSQLAlterados := sSQLAlterados+', NOMEPAI = '+quotedstr(copy(trim(qrytxt.fieldbyname('NOMEPAI').AsString),1,50))+'';
                 pProcessoAux := pAceito ;
             end
             else begin
                 pProcessoAux := pNProcessado ;
             end;

             TabCriticasCcp.Insere(qryaux,iPatro,
                        qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                        dSeqCritica,
                        sMesCobranca,
                        qrytxt.FieldByName('MATRICULA').AsString ,
                        qryDadosNoBanco.fieldbyname('NOMEPAI').AsString,
                        Qrytxt.fieldbyname('NOMEPAI').AsString,
                        cChave, ceNmPaiAltarado, tdCaracter,'',
                        gCadastro, pProcessoAux, '',
                        '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;
         //fim nome pai

         //trata nome da mãe
         //testa se é diferente do já cadastrado
         if (qryLayOutArquivo.FieldbyName('DCNMMAETAM').AsInteger > 0) and
            (Trim(qrytxt.fieldbyname('NOMEMAE').AsString) <> Trim(qryDadosNoBanco.fieldbyname('NOMEMAE').AsString) )
            and (Trim(qrytxt.fieldbyname('NOMEMAE').AsString)  <> '')
         then begin
            if batunomemae
            then begin
               sSQLAlterados :=  sSQLAlterados+' ,NOMEMAE = '+quotedstr(copy(trim(qrytxt.fieldbyname('NOMEMAE').AsString),1,50))+'  ';
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere(qryaux,iPatro,
                      qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                      dSeqCritica,
                      sMesCobranca,
                      qrytxt.FieldByName('MATRICULA').AsString ,
                      qryDadosNoBanco.fieldbyname('NOMEMAE').AsString,
                      Qrytxt.fieldbyname('NOMEMAE').AsString,
                      cChave, ceNmMaeAltarado, tdCaracter,'',
                      gCadastro, pProcessoAux, '',
                      '','','','','',sFlgIntSitPart , qrytxt.fieldbyname('IDSITFUNC').AsString);
         end;

         // PESSOAFISICA
         // Testa se o ESTADO CIVIL alterou
         if (qryLayOutArquivo.FieldbyName('DCESTCIVILTAM').AsInteger > 0)                                 and
            (qryTxt.FieldByName('ESTCIVIL').AsString <> qryDadosNoBanco.FieldByName('ESTCIVIL').AsString) and
            (not ( (QryTxt.FieldByName('ESTCIVIL').AsString = '0') and
                   (Trim(qryDadosNoBanco.FieldByName('ESTCIVIL').AsString) = '') )
            )
         then begin
            if bAtuESTCIVIL then
            begin
                sSQLAlterados := sSQLAlterados+', ESTCIVIL = '''+QryTxt.FieldByName('ESTCIVIL').AsString+'''';
                pProcessoAux := pAceito ;
            end
            else begin
                pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere(qryaux,iPatro,
                                  qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                  dSeqCritica,
                                  sMesCobranca,
                                  qrytxt.FieldByName('MATRICULA').AsString ,
                                  qryDadosNoBanco.FieldByName('ESTCIVIL').AsString,
                                  QryTxt.FieldByName('ESTCIVIL').AsString,
                                  cChave, ceEstCivilAlterado, tdCaracter,'', gCadastro, pProcessoAux, '',
                                  '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;

         // Testa se a DATAMORTE alterou
         if (qryLayOutArquivo.FieldbyName('DCDTMORTETAM').AsInteger > 0) and
            (QryTxt.FieldByName('DATAMORTE').AsString <> qryDadosNoBanco.FieldByName('DATAMORTE').AsString)
            and (trim(QryTxt.FieldByName('DATAMORTE').AsString ) <> '')
         then begin
            if bAtuDATAMORTE  then
            begin
                sSQLAlterados := sSQLAlterados+', DATAMORTE = TO_DATE('''+QryTxt.FieldByName('DATAMORTE').AsString+''','+
                                                  ''''+qryLayOutArquivo.FieldByName('DCFTDTMORTE').AsString+''')';
                pProcessoAux := pAceito ;
            end
            else begin
                pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere(qryaux,iPatro,
                                  qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                  dSeqCritica,
                                  sMesCobranca,
                                  qrytxt.FieldByName('MATRICULA').AsString ,
                                  qryDadosNoBanco.FieldByName('DATAMORTE').AsString,
                                  QryTxt.FieldByName('DATAMORTE').AsString,
                                  cChave, ceDataMorteAlterada, tdData,'', gCadastro, pProcessoAux, '',
                                  '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;

         if Trim(sSQLAlterados) <> ''
         then begin
            try
               sSQLAlterados := Copy(Trim(sSQLAlterados), 2, Length(sSQLAlterados));
               qryUpdate.Close;
               qryUpdate.SQL.Clear;
               qryUpdate.SQL.Add(' UPDATE PESSOAFISICA SET '+ sSQLAlterados+
                                 ' WHERE  IDPESSOA = '+IntToStr(qryDadosNoBanco.FieldByName('idpessoa').AsInteger));
               qryUpdate.ExecSQL;
            except
               memoErros.Lines.Add('Erro ao atualizar dados da tabela Dados Pessoais.');
            end;
         end;


         // ALTERACAO NA TABELA ELEGPATRO
         sSQLAlterados := '';

         // Testa se a data de admissao alterou
         if (qryLayOutArquivo.FieldbyName('DCDTADMTAM').AsInteger > 0)
         then begin
            sDataAdmTxt := qrytxt.FieldByName('ADMISSAO').AsString;
            sDataAdmCad := qryDadosNoBanco.FieldByName('DATAADMISSAO').AsString;
            if (sDataAdmTxt <> sDataAdmCad) and (trim(sDataAdmTxt) <> '') then
            begin
               if batudataadm
               then begin
                   sSQLAlterados := sSQLAlterados + ', DATAADMISSAO = TO_DATE('''+sDataAdmTxt +''','+
                                                       ''''+qryLayOutArquivo.FieldByName('DCDTadmFORMATO').AsString+''')';
                   pProcessoAux := pAceito ;
               end
               else begin
                   pProcessoAux := pNProcessado ;
               end;

               TabCriticasCcp.Insere(qryaux,iPatro,
                                     qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                     dSeqCritica,
                                     sMesCobranca,
                                     qrytxt.FieldByName('MATRICULA').AsString ,
                                     qryDadosNoBanco.FieldByName('DATAADMISSAO').AsString,
                                     QryTxt.FieldByName('ADMISSAO').AsString,
                                     cChave, ceDataAdmAlterada, tdData,
                                     qryLayOutArquivo.FieldByName('DCDTadmFORMATO').AsString , gCadastro, pProcessoAux, '',
                                     '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
            end;
         end;

         // Testa se o CONTEUDO DO cargo É CODIGO OU DESCRICAO
         if (qryLayOutArquivo.FieldbyName('DCCARGOTAM').AsInteger > 0)
         then begin
             if (trim(QryTxt.FieldByName('CARGO').AsString) <> trim(qryDadosNoBanco.FieldByName('CODIGO').AsString))
                and (trim(QryTxt.FieldByName('CARGO').AsString) <> '')
             then begin
                // Se o cargo do TXT não existir não pode alterar
                bErro := false;
                with qryExisteCargo do begin
                   Close;
                   ParamByName('IDPESSJUR').AsInteger :=  iPatro;
                   ParamByName('CODIGO').AsString     :=  trim(QryTxt.FieldByName('CARGO').AsString);
                   try
                      Open;
                   except
                      bErro := true;
                      MemoErros.Lines.Add('Erro ao procurar cargo ' + QryTxt.FieldByName('CARGO').AsString + ' enviado para a matrícula ' + qrytxt.FieldByName('MATRICULA').AsString);
                      TabCriticasCcp.Insere(qryaux,iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   '',
                                   trim(QryTxt.FieldByName('CARGO').AsString),
                                   cChave, ceCargoNEncontrado, tdCaracter,'', gCadastro, pNProcessado,'',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);
                   end;
                   if not bErro then
                      if IsEmpty then begin
                         bErro := true;
                         MemoErros.Lines.Add('Não foi encontrado o cargo de código ' + QryTxt.FieldByName('CARGO').AsString + ' enviado para a matrícula ' + qrytxt.FieldByName('MATRICULA').AsString);
                         TabCriticasCcp.Insere(qryaux,iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   '',
                                   trim(QryTxt.FieldByName('CARGO').AsString),
                                   cChave, ceCargoNEncontrado, tdCaracter,'', gCadastro, pNProcessado,'',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);

                      end;
                end;

                if not bErro
                then begin
                   if batucargo then
                   begin
                       sSQLAlterados := sSQLAlterados + ', IDCARGOEXT = '+qryExisteCargo.FieldByName('IDCARGOEXT').AsString;
                       pProcessoAux := pAceito ;
                   end
                   else begin
                       pProcessoAux := pNProcessado ;
                   end;

                   TabCriticasCcp.Insere(qryaux,iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   trim(qryDadosNoBanco.FieldByName('CODIGO').AsString),
                                   trim(QryTxt.FieldByName('CARGO').AsString),
                                   cChave, ceCargoAlterado, tdCaracter,'', gCadastro, pProcessoAux, '',
                                   '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
                end;
             end;
         end;

         // Testa se o nivel alterou
         if (qryLayOutArquivo.FieldbyName('DCNIVELTAM').AsInteger > 0) and
            (trim(qryTxt.FieldByName('NIVEL').AsString) <> '') and
            (Trim(QryTxt.FieldByName('NIVEL').AsString) <> Trim(qryDadosNoBanco.FieldByName('NIVEL').AsString))
         then begin
            with qryExisteNivel do
            begin
               Close;
               ParamByName('IDFAIXATXT').AsInteger := QryTxt.FieldByName('NIVEL').AsInteger  ;
               try
                  Open;
               except
                  bErro := true;
                  MemoErros.Lines.Add('Erro ao procurar Nível ' + QryTxt.FieldByName('NIVEL').AsString + ' enviado para a matrícula ' + qrytxt.FieldByName('MATRICULA').AsString);
                  TabCriticasCcp.Insere(qryaux,iPatro,
                               qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                               dSeqCritica,
                               sMesCobranca,
                               qrytxt.FieldByName('MATRICULA').AsString ,
                               '',
                               trim(QryTxt.FieldByName('NIVEL').AsString),
                               cChave, ceNivelNEncontrado, tdNumerico,'', gCadastro, pNProcessado,'',
                               '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);
               end;

               if not bErro then
                  if IsEmpty
                  then begin
                     bErro := true;
                     MemoErros.Lines.Add('Não foi encontrado o Nível de código ' + QryTxt.FieldByName('NIVEL').AsString + ' enviado para a matrícula ' + qrytxt.FieldByName('MATRICULA').AsString);
                     TabCriticasCcp.Insere(qryaux,iPatro,
                               qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                               dSeqCritica,
                               sMesCobranca,
                               qrytxt.FieldByName('MATRICULA').AsString ,
                               '',
                               trim(qryTxt.FieldByName('NIVEL').AsString),
                               cChave, ceNivelNEncontrado, tdNumerico,'', gCadastro, pNProcessado,'',
                               '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);

               end;
            end;
            if not bErro
            then begin
               if batunivel then
               begin
                   sSQLAlterados := sSQLAlterados + ', NIVEL = '+ qryTxt.FieldByName('NIVEL').AsString;
                   pProcessoAux := pAceito ;
               end
               else begin
                   pProcessoAux := pNProcessado ;
               end;
               TabCriticasCcp.Insere(qryaux,iPatro,
                               qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                               dSeqCritica,
                               sMesCobranca,
                               qrytxt.FieldByName('MATRICULA').AsString ,
                               trim(qryDadosNoBanco.FieldByName('NIVEL').AsString),
                               trim(QryTxt.FieldByName('NIVEL').AsString),
                               cChave, ceNivelAlterado, tdNumerico,'', gCadastro, pProcessoAux, '',
                               '','','','','' ,sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);
             end;
         end;

         //trata tempo de serviço total
         if  (qryLayOutArquivo.FieldbyName('DCTPSERVTOTTAM').AsInteger > 0) and
             (qrytxt.fieldbyname('QTTPTOT').AsInteger <> qryDadosNoBanco.fieldbyname('TEMPOSERVTOTAL').AsInteger)
         then begin
              if batutpservtot then
              begin
                  sSQLAlterados := sSQLAlterados + ', TEMPOSERVTOTAL = '+inttostr(qrytxt.fieldbyname('QTTPTOT').AsInteger);
                  pProcessoAux := pAceito ;
              end
              else
              begin
                  pProcessoAux := pNProcessado ;
              end;

              TabCriticasCcp.Insere(qryaux,iPatro,
                        qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                        dSeqCritica,
                        sMesCobranca,
                        qrytxt.FieldByName('MATRICULA').AsString ,
                        inttostr(qryDadosNoBanco.fieldbyname('TEMPOSERVTOTAL').AsInteger),
                        inttostr(qrytxt.fieldbyname('QTTPTOT').AsInteger),
                        cChave, ceQtTpServTotAlterado, tdNumerico,'',
                        gCadastro, pProcessoAux, '',
                        '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;
         //fim  tempo serv. total

         //trata tempo de serviço não creditado
         if (qryLayOutArquivo.FieldbyName('DCTPNAOCREDTAM').AsInteger > 0) and
            (qrytxt.fieldbyname('QTTPNCRED').AsInteger  <> qryDadosNoBanco.fieldbyname('TEMPONAOCREDITADO').AsInteger) then
         begin
              if batutpservnaocred then
              begin
                  sSQLAlterados := sSQLAlterados + ', TEMPONAOCREDITADO = '+inttostr(qrytxt.fieldbyname('QTTPNCRED').AsInteger);
                  pProcessoAux := pAceito ;
              end
              else
              begin
                  pProcessoAux := pNProcessado ;
              end;

              TabCriticasCcp.Insere(qryaux,iPatro,
                        qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                        dSeqCritica,
                        sMesCobranca,
                        qrytxt.FieldByName('MATRICULA').AsString ,
                        inttostr(qryDadosNoBanco.fieldbyname('TEMPONAOCREDITADO').AsInteger),
                        inttostr(qrytxt.fieldbyname('QTTPNCRED').AsInteger),
                        cChave, ceQtTpServNaoCredAlterado, tdNumerico,'',
                        gCadastro, pProcessoAux, '',
                        '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;
         //fim tempo serv. não creditado

         // ELEGPATRO
         // Trata TEMPO DE SERVICO ANTERIOR
         if  (qryLayOutArquivo.FieldbyName('DCTPSERVANTTAM').AsInteger > 0) and
             (qrytxt.fieldbyname('TPSERVANT').AsInteger <> qryDadosNoBanco.fieldbyname('TEMPOSERVANTERIOR').AsInteger)
         then begin
            if batuTPSERVANTERIOR
            then begin
               sSQLAlterados := sSQLAlterados + ', TEMPOSERVANTERIOR = '+IntToStr(qrytxt.fieldbyname('TPSERVANT').AsInteger);
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   IntToStr(qryDadosNoBanco.fieldbyname('TEMPOSERVANTERIOR').AsInteger),
                                   IntToStr(qrytxt.fieldbyname('TPSERVANT').AsInteger),
                                   cChave, ceTempoServAnteriorAlterado, tdNumerico,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;

         // Trata FILIAL
         if  (qryLayOutArquivo.FieldbyName('DCIDESTABTAM').AsInteger > 0) and
             (qrytxt.fieldbyname('NUMFILIAL').AsString <> qryDadosNoBanco.fieldbyname('NUMFILIAL').AsString)
             and (trim(qrytxt.fieldbyname('NUMFILIAL').AsString) <> '')
         then begin
            // Buscar Filial
            with qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT IDFILIALPESSOA FROM FILIALPESSOA WHERE NUMFILIAL = '''+qrytxt.fieldbyname('NUMFILIAL').AsString+'''');
               Open;
            end;

            if qryAux.IsEmpty
            then begin
               MemoErros.Lines.Add('Erro ao procurar Filial do participante de Matricula '+qrytxt.FieldByName('MATRICULA').AsString+'.');
               TabCriticasCcp.Insere(qryaux,iPatro,
                                     qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                     dSeqCritica,
                                     sMesCobranca,
                                     qrytxt.FieldByName('MATRICULA').AsString ,
                                     '',
                                     QryTxt.FieldByName('NUMFILIAL').AsString,
                                     cChave, ceFilialNEncontrada, tdCaracter,'', gCadastro,
                                     pNProcessado,'',
                                     '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);

            end
            else begin
               if batuFILIAL
               then begin
                  sSQLAlterados := sSQLAlterados + ', IDESTAB = '+IntToStr(qryAux.fieldbyname('IDFILIALPESSOA').AsInteger);
                  pProcessoAux := pAceito ;
               end
               else begin
                  pProcessoAux := pNProcessado ;
               end;

               TabCriticasCcp.Insere( qryaux, iPatro,
                                      qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                      dSeqCritica,
                                      sMesCobranca,
                                      qrytxt.FieldByName('MATRICULA').AsString ,
                                      qryDadosNoBanco.fieldbyname('NUMFILIAL').AsString,
                                      qrytxt.fieldbyname('NUMFILIAL').AsString,
                                      cChave, ceFilialAlterada, tdCaracter,'',
                                      gCadastro, pProcessoAux, '',
                                      '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
            end;
         end;

         // Trata TEMPO DE SERVICO ANTERIOR
         if  (qryLayOutArquivo.FieldbyName('DCIDSITFUNCTAM').AsInteger > 0) and
             (Trim(qrytxt.fieldbyname('IDSITFUNC').AsString) <> '') and
             (qrytxt.fieldbyname('IDSITFUNC').AsInteger <> qryDadosNoBanco.fieldbyname('IDSITFUNC').AsInteger)
         then begin
            if batuSITEMPREGADO
            then begin
               sSQLAlterados := sSQLAlterados + ', IDSITFUNC = '+IntToStr(qrytxt.fieldbyname('IDSITFUNC').AsInteger);
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   IntToStr(qryDadosNoBanco.fieldbyname('IDSITFUNC').AsInteger),
                                   IntToStr(qrytxt.fieldbyname('IDSITFUNC').AsInteger),
                                   cChave, ceSitFuncAlterado, tdNumerico,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;

         // Trata DATADEMISSAO
         if  (qryLayOutArquivo.FieldbyName('DCDTDEMISSAOTAM').AsInteger > 0) and
             (qrytxt.fieldbyname('DTDEMISSAO').AsString <> qryDadosNoBanco.fieldbyname('DATADEMISSAO').AsString)
             and (trim(qrytxt.fieldbyname('DTDEMISSAO').AsString ) <> '')
         then begin
            if batuDATADEMISSAO
            then begin
               sSQLAlterados := sSQLAlterados + ', DATADEMISSAO = TO_DATE('''+QryTxt.FieldByName('DTDEMISSAO').AsString+''', '+
                                                   ''''+qryLayOutArquivo.FieldByName('DCFTDTDEMISSAO').AsString+''') ';
               pProcessoAux := pAceito ;


               //atualiza data de demissão no histórico funcional
               QryUpdate.close;
               QryUpdate.sql.text := '  UPDATE HISTFUNCPREV  SET DATAFINAL = TO_DATE('''+QryTxt.FieldByName('DTDEMISSAO').AsString+''', '+
                                        ''''+qryLayOutArquivo.FieldByName('DCFTDTDEMISSAO').AsString+''') '+
                                     '  WHERE IDPESSOA = '+qryDadosNoBanco.FieldByName('IDPESSOA').AsString+' '+
                                     '  AND IDPESSJUR = '+inttostr(iPatro)+' '+
                                     '  AND EMPRESA LIKE ''%'+qryPatroCombo.fieldbyname('NOME').AsString+'%'' ';
               try
                  QryUpdate.ExecSQL;
               except
               end;

            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   qryDadosNoBanco.fieldbyname('DATADEMISSAO').AsString,
                                   qrytxt.fieldbyname('DTDEMISSAO').AsString,
                                   cChave, ceDtDemissaoAlterada, tdData,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;

         // Trata TEMPOSERVPUBLANT
         if (qryLayOutArquivo.FieldbyName('DCTPSERVPUBANTTAM').AsInteger > 0) and
            (qrytxt.fieldbyname('TPPUBLANT').AsInteger <> qryDadosNoBanco.fieldbyname('TEMPOSERVPUBLANT').AsInteger)
         then begin
            if bAtuTPSERVPUBLANT
            then begin
               sSQLAlterados := sSQLAlterados + ', TEMPOSERVPUBLANT = '+QryTxt.FieldByName('TPPUBLANT').AsString;
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   IntToStr(qryDadosNoBanco.fieldbyname('TEMPOSERVPUBLANT').AsInteger),
                                   IntToStr(qrytxt.fieldbyname('TPPUBLANT').AsInteger),
                                   cChave, ceTempoServPublAlterado, tdNumerico,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;

         // Trata TEMPOSERVPRIVANT
         if  (qryLayOutArquivo.FieldbyName('DCTPSERVPRVANTTAM').AsInteger > 0) and
             (qrytxt.fieldbyname('TPPRIVANT').AsInteger <> qryDadosNoBanco.fieldbyname('TEMPOSERVPRIVANT').AsInteger)
         then begin
            if bAtuTPSERVPRIVANT
            then begin
               sSQLAlterados := sSQLAlterados + ', TEMPOSERVPRIVANT = '+QryTxt.FieldByName('TPPRIVANT').AsString;
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   IntToStr(qryDadosNoBanco.fieldbyname('TEMPOSERVPRIVANT').AsInteger),
                                   IntToStr(qrytxt.fieldbyname('TPPRIVANT').AsInteger),
                                   cChave, ceTempoServPrivAlterado, tdNumerico,'',
                                   gCadastro, pProcessoAux, '' ,
                                   '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);

         end;

         // Trata FLGDIRETOR
         if  (qryLayOutArquivo.FieldbyName('DCFLGDIRETORTAM').AsInteger > 0) and
             (qrytxt.fieldbyname('FLGDIRETOR').AsInteger <> qryDadosNoBanco.fieldbyname('FLGDIRETOR').AsInteger)
         then begin
            if bAtuFLGDIRETOR
            then begin
               sSQLAlterados := sSQLAlterados + ', FLGDIRETOR = '+QryTxt.FieldByName('FLGDIRETOR').AsString;
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   IntToStr(qryDadosNoBanco.fieldbyname('FLGDIRETOR').AsInteger),
                                   IntToStr(qrytxt.fieldbyname('FLGDIRETOR').AsInteger),
                                   cChave, ceIndDiretorAlterado, tdNumerico,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','', sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;

         // Trata TEMPOSERVANTREAL
         if  (qryLayOutArquivo.FieldbyName('DCTPSRVANTREALTAM').AsInteger > 0) and
             (qrytxt.fieldbyname('TPSERVREAL').AsInteger <> qryDadosNoBanco.fieldbyname('TEMPOSERVANTREAL').AsInteger)
         then begin
            if bAtuTPSERVANTREAL
            then begin
               sSQLAlterados := sSQLAlterados + ', TEMPOSERVANTREAL = '+QryTxt.FieldByName('TPSERVREAL').AsString;
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   IntToStr(qryDadosNoBanco.fieldbyname('TEMPOSERVANTREAL').AsInteger),
                                   IntToStr(qrytxt.fieldbyname('TPSERVREAL').AsInteger),
                                   cChave, ceTempoServRealAlterado, tdNumerico,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;


         // Trata VALORBASE1
         if  (qryLayOutArquivo.FieldbyName('DCVALORBASE1TAM').AsInteger > 0) and
             (qrytxt.fieldbyname('VALORBASE1').AsInteger <> qryDadosNoBanco.fieldbyname('VALORBASE1').AsInteger)
         then begin
            if bAtuVALORBASE1
            then begin
               sSQLAlterados := sSQLAlterados + ', VALORBASE1 = '+QryTxt.FieldByName('VALORBASE1').AsString;
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   qryDadosNoBanco.fieldbyname('VALORBASE1').AsString,
                                   qrytxt.fieldbyname('VALORBASE1').AsString,
                                   cChave, ceValorBase1Alterado, tdCaracter,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;


         // Trata VALORBASE2
         if  (qryLayOutArquivo.FieldbyName('DCVALORBASE2TAM').AsInteger > 0) and
             (qrytxt.fieldbyname('VALORBASE2').AsInteger <> qryDadosNoBanco.fieldbyname('VALORBASE2').AsInteger)
         then begin
            if bAtuVALORBASE2
            then begin
               sSQLAlterados := sSQLAlterados + ', VALORBASE2 = '+QryTxt.FieldByName('VALORBASE2').AsString;
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   qryDadosNoBanco.fieldbyname('VALORBASE2').AsString,
                                   qrytxt.fieldbyname('VALORBASE2').AsString,
                                   cChave, ceValorBase2Alterado, tdCaracter,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;


         // Trata VALORBASE3
         if  (qryLayOutArquivo.FieldbyName('DCVALORBASE3TAM').AsInteger > 0) and
             (qrytxt.fieldbyname('VALORBASE3').AsInteger <> qryDadosNoBanco.fieldbyname('VALORBASE3').AsInteger)
         then begin
            if bAtuVALORBASE3
            then begin
               sSQLAlterados := sSQLAlterados + ', VALORBASE3 = '+QryTxt.FieldByName('VALORBASE3').AsString;
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   qryDadosNoBanco.fieldbyname('VALORBASE3').AsString,
                                   qrytxt.fieldbyname('VALORBASE3').AsString,
                                   cChave, ceValorBase3Alterado, tdCaracter,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;


         // Trata VALORBASE4
         if  (qryLayOutArquivo.FieldbyName('DCVALORBASE4TAM').AsInteger > 0) and
             (qrytxt.fieldbyname('VALORBASE4').AsInteger <> qryDadosNoBanco.fieldbyname('VALORBASE4').AsInteger)
         then begin
            if bAtuVALORBASE4
            then begin
               sSQLAlterados := sSQLAlterados + ', VALORBASE4 = '+QryTxt.FieldByName('VALORBASE4').AsString;
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   qryDadosNoBanco.fieldbyname('VALORBASE4').AsString,
                                   qrytxt.fieldbyname('VALORBASE4').AsString,
                                   cChave, ceValorBase4Alterado, tdCaracter,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;


         // Trata VALORBASE5
         if  (qryLayOutArquivo.FieldbyName('DCVALORBASE5TAM').AsInteger > 0) and
             (qrytxt.fieldbyname('VALORBASE5').AsInteger <> qryDadosNoBanco.fieldbyname('VALORBASE5').AsInteger)
         then begin
            if bAtuVALORBASE5
            then begin
               sSQLAlterados := sSQLAlterados + ', VALORBASE5 = '+QryTxt.FieldByName('VALORBASE5').AsString;
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   qryDadosNoBanco.fieldbyname('VALORBASE5').AsString,
                                   qrytxt.fieldbyname('VALORBASE5').AsString,
                                   cChave, ceValorBase5Alterado, tdCaracter,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;


         // Trata VALORBASE6
         if  (qryLayOutArquivo.FieldbyName('DCVALORBASE6TAM').AsInteger > 0) and
             (qrytxt.fieldbyname('VALORBASE6').AsInteger <> qryDadosNoBanco.fieldbyname('VALORBASE6').AsInteger)
         then begin
            if bAtuVALORBASE6
            then begin
               sSQLAlterados := sSQLAlterados + ', VALORBASE6 = '+QryTxt.FieldByName('VALORBASE6').AsString;
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   qryDadosNoBanco.fieldbyname('VALORBASE6').AsString,
                                   qrytxt.fieldbyname('VALORBASE6').AsString,
                                   cChave, ceValorBase6Alterado, tdCaracter,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;


         // Trata FUNCAO
         if  (qryLayOutArquivo.FieldbyName('DCIDFUNCAOTAM').AsInteger > 0) and
             (trim(qrytxt.fieldbyname('FUNCAO').AsString) <> '') and
             (trim(qrytxt.fieldbyname('FUNCAO').AsString) <>
              trim(qryDadosNoBanco.fieldbyname('CODFUNCAO').AsString))
         then begin
            // Buscar funcao
            with qryAux do
            begin
               Close;
               SQL.Clear;
               SQL.Add(' SELECT IDCARGOEXT AS IDFUNCAO FROM CARGOEXT WHERE LTRIM(RTRIM(CODIGO)) = '''+trim(qrytxt.fieldbyname('FUNCAO').AsString)+'''');
               Open;
            end;

            if qryAux.IsEmpty
            then begin
               MemoErros.Lines.Add('Não foi encontrada a função de código '+trim(qrytxt.fieldbyname('FUNCAO').AsString)+' - Matricula '+qrytxt.FieldByName('MATRICULA').AsString+'.');
               TabCriticasCcp.Insere( qryaux, iPatro,
                                      qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                      dSeqCritica,
                                      sMesCobranca,
                                      qrytxt.FieldByName('MATRICULA').AsString ,
                                      '',
                                      trim(qrytxt.fieldbyname('FUNCAO').AsString),
                                      cChave, ceFuncaoNEncontrada, tdCaracter,'',
                                      gCadastro, pNProcessado, '',
                                      '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );

            end
            else begin
               if bAtuFUNCAO
               then begin
                  sSQLAlterados := sSQLAlterados + ', IDFUNCAOEXT = '+qryAux.FieldByName('IDFUNCAO').AsString;
                  pProcessoAux := pAceito ;
               end
               else begin
                  pProcessoAux := pNProcessado ;
               end;

               TabCriticasCcp.Insere( qryaux, iPatro,
                                      qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                      dSeqCritica,
                                      sMesCobranca,
                                      qrytxt.FieldByName('MATRICULA').AsString ,
                                      trim(qryDadosNoBanco.fieldbyname('CODFUNCAO').AsString),
                                      trim(qrytxt.fieldbyname('FUNCAO').AsString),
                                      cChave, ceFuncaoAlterada, tdCaracter,'',
                                      gCadastro, pProcessoAux, '',
                                      '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
            end;
         end;

         // Trata DATAREADMISSAO
         if  (qryLayOutArquivo.FieldbyName('DCDTREADMISSAOTAM').AsInteger > 0) and
             (
             ((qrytxt.fieldbyname('DTREADMIS').AsString <> qryDadosNoBanco.fieldbyname('DATAREADMISSAO').AsString)
             and (trim(qrytxt.fieldbyname('DTREADMIS').AsString) <> ''))
             or  //trata data de readmissão zerada que deve atualizar banco
             ((qrytxt.fieldbyname('DTREADMIS').AsString <> qryDadosNoBanco.fieldbyname('DATAREADMISSAO').AsString)
             and (qryDadosNoBanco.fieldbyname('DATAREADMISSAO').AsString <> '')
             and (trim(qrytxt.fieldbyname('DTREADMIS').AsString) = ''))
             )
         then begin
            if bAtuDATAREADMISSAO
            then begin
               sSQLAlterados := sSQLAlterados + ', DATAREADMISSAO = TO_DATE('''+QryTxt.FieldByName('DTREADMIS').AsString+''', '+
                                                   ''''+qryLayOutArquivo.FieldByName('DCFTDTREADMISSAO').AsString+''') ';
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   qryDadosNoBanco.fieldbyname('DATAREADMISSAO').AsString,
                                   qrytxt.fieldbyname('DTREADMIS').AsString,
                                   cChave, ceDtReadmissaoAlterada, tdData,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;

         // Trata VINCULACAOFUNCIONAL
         if  (qryLayOutArquivo.FieldbyName('DCCDVINCFUNCTAM').AsInteger > 0) and
             (trim(qrytxt.fieldbyname('VINCFUNC').AsString) <> trim(qryDadosNoBanco.fieldbyname('CODVINCULAFUNC').AsString))
             and (trim(qrytxt.fieldbyname('VINCFUNC').AsString) <> '')
         then begin
            if bAtuTPSERVANTREAL
            then begin
               sSQLAlterados := sSQLAlterados + ', CODVINCULAFUNC = '''+trim(QryTxt.FieldByName('VINCFUNC').AsString)+'''';
               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro,
                                   qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   qryDadosNoBanco.fieldbyname('CODVINCULAFUNC').AsString,
                                   trim(qrytxt.fieldbyname('VINCFUNC').AsString),
                                   cChave, ceVinculaFuncAlterada, tdCaracter,'',
                                   gCadastro, pProcessoAux, '',
                                   '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString );
         end;
         // Fim campos ELEGPATRO

         // Atualizar ELEGPATRO
         if Trim(sSQLAlterados) <> ''
         then begin
            try
               sSQLAlterados := Copy(Trim(sSQLAlterados), 2, Length(sSQLAlterados));
               qryUpdate.Close;
               qryUpdate.SQL.Clear;
               qryUpdate.SQL.Add(' UPDATE ELEGPATRO SET '+ sSQLAlterados+
                                 ' WHERE IDPESSJUR = '+inttostr(ipatro)+
                                 ' AND   IDPESSOA  = '+IntToStr(qryDadosNoBanco.FieldByName('idpessoa').AsInteger));
               qryUpdate.ExecSQL;
            except
               memoErros.Lines.Add('Erro ao atualizar dados da tabela Dados Funcionais.');
            end;
         end;


         // OUTROS CONTROLES
         // move para o próximo registro
         QryTxt.Next;
         qryDadosNoBanco.Next;
      end
      else begin
         if QryTxt.FieldByName('MATRICULA').AsString < qryDadosNoBanco.FieldByName('MATRICULA').AsString
         then begin


            if not binserepart
            then begin
               // mensagem de inconsistencia - Matricula nao cadastrada no sistema
               MemoErros.Lines.Add('Matricula '+QryTxt.FieldByName('MATRICULA').AsString+' não está cadastrada. ');
               TabCriticasCcp.Insere(qryaux,iPatro,
                                  0,
                                  dSeqCritica,
                                  sMesCobranca,
                                  qrytxt.FieldByName('MATRICULA').AsString ,
                                  '',
                                  QryTxt.FieldByName('NOME').AsString,
                                  cChave, cePartNEncontrado, tdCaracter,'', gCadastro,
                                  pNProcessado,'',
                                  '','','','','',sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);

            end
            else //insere participante
            begin

               try
                  // Insere os dados da matrícula do TXT no banco como elegível
                  // Inserir participante nas tabelas PESSOA, PESSOAFISICA
                  // Pessoa
                  if (qryLayOutArquivo.FieldbyName('DCEMPREGTAM').AsInteger > 0)
                     and (Trim(QryTxt.FieldByName('NOME').AsString) <> '')
                  then sNome := Trim(QryTxt.FieldByName('NOME').AsString)
                  else
                  begin
                     QryTxt.Next;
                     continue;
                  end;

                  if (qryLayOutArquivo.FieldbyName('DCCPFTAM').AsInteger > 0)
                     and (trim(QryTxt.FieldByName('CPF').AsString ) <> '')
                  then  sNumDocumento := trim(QryTxt.FieldByName('CPF').AsString )
                  else
                  begin
                     QryTxt.Next;
                     continue;
                  end;


                  iPessoa := LeUltRegistro(Nil,'PESSOA ');
                  sSqlUpdate := 'INSERT INTO PESSOA (IDPESSOA,NOME,NUMDOCUMENTO,IDDOCUMENTO, TIPO) ';
                  sSqlUpdate := sSqlUpdate + 'VALUES (' + inttostr(iPessoa);
                  sSqlUpDate := sSqlUpDate + ', '+QuotedStr(sNome)+', '+QuotedStr(sNumDocumento)+' ' ;
                  sSqlUpDate := sSqlUpDate + ', 2, ''F'') ';
                  QryUpDate.SQL.Text := sSqlUpdate;
                  QryUpdate.ExecSQL;



                  //docpessoa
                  if (trim(QryTxt.FieldByName('NUMIDENT').AsString) <> '') and
                     (trim(qryLayOutArquivo.FieldByName('DCIDDOCIDENT').AsString) <> '')
                  then begin
                     sNumIdent := trim(QryTxt.FieldByName('NUMIDENT').AsString);

                     if (trim(QryTxt.FieldByName('UFIDENT').AsString) <> '')
                     then sUfIdent := trim(QryTxt.FieldByName('UFIDENT').AsString)
                     else sUfIdent := '';

                     if (QryTxt.FieldByName('DTEXPIDENT').AsString <> '')
                     then sDtExpedIdent := trim(QryTxt.FieldByName('DTEXPIDENT').AsString)
                     else sDtExpedIdent := '';

                     sSqlUpdate := 'INSERT INTO DOCPESSOA (IDPESSOA,NUMDOCUMENTO,IDDOCUMENTO, DATAEMISSAO, UF) '+
                     ' VALUES (' + inttostr(iPessoa)+
                     ', '+QuotedStr(sNumIdent)+' '+
                     ', '+qryLayOutArquivo.FieldByName('DCIDDOCIDENT').AsString+' '+
                     ', TO_DATE('+QuotedStr(sDtExpedIdent)+','''+qryLayOutArquivo.FieldByName('DCFTDTEXPIDENT').AsString+''')  '+
                     ', '+QuotedStr(sUfIdent)+')';
                     QryUpDate.SQL.Text := sSqlUpdate;
                     QryUpdate.ExecSQL;
                  end;

                  sSqlUpdate := 'INSERT INTO DOCPESSOA (IDPESSOA,NUMDOCUMENTO,IDDOCUMENTO) ';
                  sSqlUpdate := sSqlUpdate + 'VALUES (' + inttostr(iPessoa);
                  sSqlUpDate := sSqlUpDate + ', '+QuotedStr(sNumDocumento)+' ';
                  sSqlUpDate := sSqlUpDate + ', ''' + '2' + ''' )';
                  QryUpDate.SQL.Text := sSqlUpdate;
                  QryUpdate.ExecSQL;



                  // PessoaFisica
                  if  (qryLayOutArquivo.FieldbyName('DCDTNASCTAM').AsInteger > 0) and
                      (trim(qryTxt.FieldByName('NASCIMENTO').AsString) <> '')
                  then  sDataNascTxt := qryTxt.FieldByName('NASCIMENTO').AsString
                  else sDataNascTxt := '';

                  if (qryLayOutArquivo.FieldbyName('DCSEXOTAM').AsInteger > 0)
                     and (trim(QryTxt.FieldByName('SEXO').AsString) <> '')
                  then  sSexo := QryTxt.FieldByName('SEXO').AsString
                  else sSexo := '';

                  if (qryLayOutArquivo.FieldbyName('DCDEPENDTAM').AsInteger > 0)
                  then begin
                     try    iDpdIrrfTxt :=  strtoint(Trim(QryTxt.FieldByName('IRRF').AsString));
                     except iDpdIrrfTxt :=0;  end;
                  end;

                  sIdCidade := '';
                  if (qryLayOutArquivo.FieldbyName('DCCODMUNNATTAM').AsInteger > 0) and
                     (Trim(qrytxt.FieldByName('CDMUNNAT').AsString) <> '')
                  then begin
                     qryaux.close;
                     qryaux.SQL.clear;
                     qryaux.sql.add(' SELECT IDCIDADES  FROM CIDADES '+
                                    ' WHERE CODMUNICIPIO = '+quotedstr(trim(qrytxt.FieldByName('CDMUNNAT').AsString))+'  ');
                     qryaux.open;
                     if not qryaux.isempty then sIdCidade := qryaux.fieldbyname('IDCIDADES').AsString;
                  end;

                  if (qryLayOutArquivo.FieldbyName('DCNMPAITAM').AsInteger > 0)
                     and (Trim(qrytxt.fieldbyname('NOMEPAI').AsString) <> '')
                  then sNomePai := copy(trim(qrytxt.fieldbyname('NOMEPAI').AsString),1,50)
                  else sNomePai := '';

                  if (qryLayOutArquivo.FieldbyName('DCNMMAETAM').AsInteger > 0)
                     and (Trim(qrytxt.fieldbyname('NOMEMAE').AsString)  <> '')
                  then sNomeMae := copy(trim(qrytxt.fieldbyname('NOMEMAE').AsString),1,50)
                  else sNomeMae := '';

                  if (qryLayOutArquivo.FieldbyName('DCESTCIVILTAM').AsInteger > 0)    and
                     (trim(QryTxt.FieldByName('ESTCIVIL').AsString) <> '')
                  then sEstCivil := trim(QryTxt.FieldByName('ESTCIVIL').AsString)
                  else sEstCivil := '';

                  if (qryLayOutArquivo.FieldbyName('DCDTMORTETAM').AsInteger > 0)
                     and (trim(QryTxt.FieldByName('DATAMORTE').AsString ) <> '')
                  then sDataMorte :=  trim(QryTxt.FieldByName('DATAMORTE').AsString )
                  else sDataMorte := '';

                  sSqlUpdate := 'INSERT INTO PESSOAFISICA (IDPESSOA,SEXO, DATANASC,IDPAIS, '+
                  '              ESTCIVIL, NOMEMAE, NOMEPAI, NUMDEPIRRF,  IDCIDADES) '+
                  ' VALUES ('+inttostr(iPessoa)+' , '+QuotedStr(sSexo)+' '+
                  ' , TO_DATE('''+sDataNascTxt+''', '''+qryLayOutArquivo.FieldByName('DCDTNASCFORMATO').AsString+''' ) '+
                  ' , 1, '+QuotedStr(sEstCivil)+' '+
                  ' ,'+QuotedStr(sNomeMae)+' ,'+QuotedStr(sNomePai)+' '+
                  ' ,'+IntToStr(iDpdIrrfTxt)+', '+QuotedStr(sIdCidade)+') ';
                  QryUpDate.SQL.Text := sSqlUpdate;
                  QryUpdate.ExecSQL;


                  //elegivel
                  sSqlUpdate := ' INSERT INTO ELEGIVEL ( IDPESSOA ) ';
                  sSqlUpdate := sSqlUpdate + 'VALUES ( '+ inttostr(iPessoa)+' )';
                  QryUpDate.SQL.Text := sSqlUpdate;
                  QryUpDate.ExecSql;



                  // Elegpatro
                  if (qryLayOutArquivo.FieldbyName('DCDTADMTAM').AsInteger > 0) and
                     (trim(qrytxt.FieldByName('ADMISSAO').AsString) <> '')
                  then  sDataAdmTxt := trim(qrytxt.FieldByName('ADMISSAO').AsString)
                  else  sDataAdmTxt := '';


                  if (qryLayOutArquivo.FieldbyName('DCCARGOTAM').AsInteger > 0) and
                     (trim(QryTxt.FieldByName('CARGO').AsString) <> '')
                  then
                  begin
                     qryExisteCargo.Close;
                     qryExisteCargo.ParamByName('IDPESSJUR').AsInteger :=  iPatro;
                     qryExisteCargo.ParamByName('CODIGO').AsString     :=  trim(QryTxt.FieldByName('CARGO').AsString);
                     try
                        qryExisteCargo.Open;
                     except
                     end;

                     if not qryExisteCargo.isempty
                     then sIdCargo :=  qryExisteCargo.FieldByName('IDCARGOEXT').AsString
                     else sIdCargo := '';
                  end;

                  if (qryLayOutArquivo.FieldbyName('DCNIVELTAM').AsInteger > 0) and
                     (trim(qryTxt.FieldByName('NIVEL').AsString) <> '')
                  then begin

                     qryExisteNivel.Close;
                     qryExisteNivel.ParamByName('IDFAIXATXT').AsInteger := QryTxt.FieldByName('NIVEL').AsInteger  ;
                     try
                        qryExisteNivel.Open;
                     except  end;


                     if not qryExisteNivel.isempty
                     then sNivel :=  qryTxt.FieldByName('NIVEL').AsString
                     else sNivel := '';
                  end;


                  //trata tempo de serviço total
                  if  (qryLayOutArquivo.FieldbyName('DCTPSERVTOTTAM').AsInteger > 0) and
                      (trim(qrytxt.fieldbyname('QTTPTOT').AsString) <> '')
                  then sTempoServTotal :=  inttostr(qrytxt.fieldbyname('QTTPTOT').AsInteger)
                  else sTempoServTotal := '';


                  if (qryLayOutArquivo.FieldbyName('DCTPNAOCREDTAM').AsInteger > 0) and
                     (trim(qrytxt.fieldbyname('QTTPNCRED').AsString) <> '')
                  then sTempoNaoCreditado := inttostr(qrytxt.fieldbyname('QTTPNCRED').AsInteger)
                  else sTempoNaoCreditado := '';


                  if  (qryLayOutArquivo.FieldbyName('DCTPSERVANTTAM').AsInteger > 0) and
                      (trim(qrytxt.fieldbyname('TPSERVANT').AsString) <> '')
                  then  sTempoServAnterior := IntToStr(qrytxt.fieldbyname('TPSERVANT').AsInteger)
                  else  sTempoServAnterior := '';


                  if  (qryLayOutArquivo.FieldbyName('DCIDESTABTAM').AsInteger > 0)
                      and (trim(qrytxt.fieldbyname('NUMFILIAL').AsString) <> '')
                  then begin
                     // Buscar Filial
                     with qryAux do
                     begin
                        Close;
                        SQL.Clear;
                        SQL.Add(' SELECT IDFILIALPESSOA FROM FILIALPESSOA WHERE NUMFILIAL = '''+qrytxt.fieldbyname('NUMFILIAL').AsString+'''');
                        Open;
                     end;

                     if not qryaux.isempty
                     then sIdEstab := IntToStr(qryAux.fieldbyname('IDFILIALPESSOA').AsInteger)
                     else sIdEstab := '';
                  end;


                  if  (qryLayOutArquivo.FieldbyName('DCIDSITFUNCTAM').AsInteger > 0) and
                      (Trim(qrytxt.fieldbyname('IDSITFUNC').AsString) <> '')
                  then sIdSitFunc := Trim(qrytxt.fieldbyname('IDSITFUNC').AsString)
                  else sIdSitFunc := '';


                  if  (qryLayOutArquivo.FieldbyName('DCDTDEMISSAOTAM').AsInteger > 0)
                      and (trim(qrytxt.fieldbyname('DTDEMISSAO').AsString ) <> '')
                   then sDataMorte := trim(qrytxt.fieldbyname('DTDEMISSAO').AsString )
                   else sDataMorte := '';


                  if (qryLayOutArquivo.FieldbyName('DCTPSERVPUBANTTAM').AsInteger > 0) and
                     (trim(QryTxt.FieldByName('TPPUBLANT').AsString) <> '')
                  then sTpPublAnt := Trim(QryTxt.FieldByName('TPPUBLANT').AsString)
                  else sTpPublAnt := '';


                  if  (qryLayOutArquivo.FieldbyName('DCTPSERVPRVANTTAM').AsInteger > 0) and
                      (trim(QryTxt.FieldByName('TPPRIVANT').AsString) <> '')
                  then sTpPrivAnt := trim(QryTxt.FieldByName('TPPRIVANT').AsString)
                  else sTpPrivAnt := '';


                  if  (qryLayOutArquivo.FieldbyName('DCFLGDIRETORTAM').AsInteger > 0) and
                      (trim(QryTxt.FieldByName('FLGDIRETOR').AsString) <> '')
                  then sFlgDiretor :=  trim(QryTxt.FieldByName('FLGDIRETOR').AsString)
                  else sFlgDiretor := '';


                  if  (qryLayOutArquivo.FieldbyName('DCTPSRVANTREALTAM').AsInteger > 0) and
                      (trim(QryTxt.FieldByName('TPSERVREAL').AsString) <> '')
                  then sTpServReal := trim(QryTxt.FieldByName('TPSERVREAL').AsString)
                  else sTpServReal := '';



                  if  (qryLayOutArquivo.FieldbyName('DCVALORBASE1TAM').AsInteger > 0) and
                      (trim(QryTxt.FieldByName('VALORBASE1').AsString) <> '')
                  then sValorBase1 := QryTxt.FieldByName('VALORBASE1').AsString
                  else sValorBase1 := '';

                  if  (qryLayOutArquivo.FieldbyName('DCVALORBASE2TAM').AsInteger > 0) and
                      (trim(QryTxt.FieldByName('VALORBASE2').AsString) <> '')
                  then sValorBase2 := QryTxt.FieldByName('VALORBASE2').AsString
                  else sValorBase2 := '';

                  if  (qryLayOutArquivo.FieldbyName('DCVALORBASE3TAM').AsInteger > 0) and
                      (trim(QryTxt.FieldByName('VALORBASE3').AsString) <> '')
                  then sValorBase3 := QryTxt.FieldByName('VALORBASE3').AsString
                  else sValorBase3 := '';

                  if  (qryLayOutArquivo.FieldbyName('DCVALORBASE4TAM').AsInteger > 0) and
                      (trim(QryTxt.FieldByName('VALORBASE4').AsString) <> '')
                  then sValorBase4 := QryTxt.FieldByName('VALORBASE4').AsString
                  else sValorBase4 := '';

                  if  (qryLayOutArquivo.FieldbyName('DCVALORBASE5TAM').AsInteger > 0) and
                      (trim(QryTxt.FieldByName('VALORBASE5').AsString) <> '')
                  then sValorBase5 := QryTxt.FieldByName('VALORBASE5').AsString
                  else sValorBase5 := '';

                  if  (qryLayOutArquivo.FieldbyName('DCVALORBASE6TAM').AsInteger > 0) and
                      (trim(QryTxt.FieldByName('VALORBASE6').AsString) <> '')
                  then sValorBase6 := QryTxt.FieldByName('VALORBASE6').AsString
                  else sValorBase6 := '';


                  if  (qryLayOutArquivo.FieldbyName('DCIDFUNCAOTAM').AsInteger > 0) and
                      (trim(qrytxt.fieldbyname('FUNCAO').AsString) <> '')
                  then begin
                     // Buscar funcao
                     with qryAux do
                     begin
                        Close;
                        SQL.Clear;
                        SQL.Add(' SELECT IDCARGOEXT AS IDFUNCAO FROM CARGOEXT WHERE LTRIM(RTRIM(CODIGO)) = '''+trim(qrytxt.fieldbyname('FUNCAO').AsString)+'''');
                        Open;
                     end;

                     if not qryaux.isempty
                     then sIdFuncaoExt :=  qryAux.FieldByName('IDFUNCAO').AsString
                     else sIdFuncaoExt := '';
                  end;


                  // Trata DATAREADMISSAO
                  if  (qryLayOutArquivo.FieldbyName('DCDTREADMISSAOTAM').AsInteger > 0)
                      and (trim(qrytxt.fieldbyname('DTREADMIS').AsString) <> '')
                  then sDataReadm := trim(qrytxt.fieldbyname('DTREADMIS').AsString)
                  else sDataReadm := '';


                  // Trata VINCULACAOFUNCIONAL
                  if  (qryLayOutArquivo.FieldbyName('DCCDVINCFUNCTAM').AsInteger > 0)
                      and (trim(qrytxt.fieldbyname('VINCFUNC').AsString) <> '')
                  then sCdVincFunc := trim(qrytxt.fieldbyname('VINCFUNC').AsString)
                  else sCdVincFunc := '';


                  sSqlUpdate := ' INSERT INTO ELEGPATRO (IDPESSOA,MATRICULA,IDPESSJUR, '+
                                ' IDCARGOEXT, IDFUNCAOEXT, IDESTAB,IDSITFUNC,DATAADMISSAO, '+
                                ' NIVEL,TEMPOSERVANTERIOR,TEMPONAOCREDITADO,TEMPOSERVANTREAL, '+
                                ' VALORBASE1,VALORBASE2,VALORBASE3, VALORBASE4, VALORBASE5, '+
                                ' VALORBASE6, TEMPOSERVTOTAL, TEMPOSERVPUBLANT,  TEMPOSERVPRIVANT, '+
                                ' FLGDIRETOR, DATAREADMISSAO, CODVINCULAFUNC ) ';
                  sSqlUpdate := sSqlUpdate + 'VALUES (' + inttostr(iPessoa);
                  sSqlUpDate := sSqlUpDate + ', ''' + QryTxt.FieldByName('MATRICULA').AsString + ''' ';
                  sSqlUpDate := sSqlUpDate + ', '+ IntToStr(iPatro)+', '+QuotedStr(sIdCargo)+', '+QuotedStr(sIdFuncaoExt)+' ,  '+
                                             ' '+QuotedStr(sIdEstab)+', '+QuotedStr(sIdSitFunc)+', '+
                                             ' TO_DATE('+QuotedStr(sDataAdmTxt)+', '+QuotedStr(qryLayOutArquivo.FieldByName('DCDTadmFORMATO').AsString)+'), '+
                                             ' '+QuotedStr(sNivel)+' , '+QuotedStr(sTempoServAnterior)+', '+QuotedStr(sTempoNaoCreditado)+','+
                                             ' '+QuotedStr(sTpServReal)+', '+QuotedStr(sValorbase1)+', '+QuotedStr(sValorbase2)+', '+
                                             ' '+QuotedStr(sValorbase3)+', '+QuotedStr(sValorbase4)+', '+QuotedStr(sValorbase5)+', '+
                                             ' '+QuotedStr(sValorbase6)+', '+QuotedStr(sTempoServTotal)+', '+QuotedStr(sTpPublAnt)+' , '+
                                             ' '+QuotedStr(sTpPrivAnt)+', '+QuotedStr(sFlgDiretor)+', '+QuotedStr(sDataReadm)+', '+
                                             ' '+QuotedStr(sCdVincFunc)+' )';
                  QryUpDate.SQL.Text := sSqlUpdate;
                  QryUpDate.ExecSql;



                  //registro de admissão na histfuncprev
                  qryaux.close;
                  qryaux.sql.text := ' SELECT NVL(MAX(NVL(SEQHISTFUNC,0)) + 1,1) as SEQHISTFUNC FROM HISTFUNCPREV '+
                                     ' WHERE IDPESSOA = '+inttostr(iPessoa)+''+
                                     ' AND   IDPESSJUR = '+ IntToStr(iPatro)+'';
                  qryaux.open;


                  QryUpdate.close;
                  QryUpdate.sql.text := '  insert into HISTFUNCPREV '+
                                        '    (IDPESSOA, IDPESSJUR, SEQHISTFUNC, DATAINICIO,  EMPRESA, '+
                                        '     MATRICULA, FLGCONCOMITANTE) '+
                                        '  values '+
                                        '    ('+inttostr(iPessoa)+', '+ IntToStr(iPatro)+', '+qryaux.fieldbyname('SEQHISTFUNC').AsString+', '+
                                        '    TO_DATE('+QuotedStr(sDataAdmTxt)+', '+QuotedStr(qryLayOutArquivo.FieldByName('DCDTadmFORMATO').AsString)+'), '+
                                        '    '''+qryPatroCombo.fieldbyname('NOME').AsString+''', '+
                                        '    '''+QryTxt.FieldByName('MATRICULA').AsString+''', 0)  ';
                  try
                     QryUpdate.ExecSQL;
                  except
                  end;

                  //insert dependente se não houver
                  QryUpdate.close;
                  QryUpdate.sql.text := ' INSERT INTO DEPENDENTE( IDPESSOA ) '+
                                     ' VALUES ( '''+inttostr(iPessoa)+''' )  ';
                  try
                     QryUpdate.ExecSQL;
                  except
                  end;


                  QryUpdate.close;
                  QryUpdate.sql.text := ' INSERT INTO DEPENTIT( IDTITULAR, IDPESSOA, IDDEPENDENCIA,  '+
                                     '    NUMSEQUENCIA, FLGCONTAIMPOSTOR, FLGBENEFICIARIO, MATRICULA) '+
                                     ' VALUES '+
                                     ' (  '''+inttostr(iPessoa)+''', '''+inttostr(iPessoa)+''' , ''PRP'', '+
                                     ' 0, 0, 0,'''+qrytxt.fieldbyname('MATRICULA').AsString+''' )  ';
                  try
                     QryUpdate.ExecSQL;
                  except
                  end;

                  TabCriticasCcp.Insere(qryaux,iPatro,
                            iPessoa,
                            dSeqCritica,
                            sMesCobranca,
                            qrytxt.FieldByName('MATRICULA').AsString ,
                            '',
                            QryTxt.FieldByName('MATRICULA').AsString,
                            cChave, ceElegivelInserido, tdCaracter,'',
                            gCadastro, pAceito, '', '','','','','' ,sFlgIntSitPart, qrytxt.fieldbyname('IDSITFUNC').AsString);



               except
                  //erro ao inserir participante
                  MemoErros.Lines.Add(' Erro ao inserir elegível - Matricula '+QryTxt.FieldByName('MATRICULA').AsString+'.');

                  TabCriticasCcp.Insere(qryaux,iPatro,
                            iPessoa,
                            dSeqCritica,
                            sMesCobranca,
                            qrytxt.FieldByName('MATRICULA').AsString ,
                            '',
                            QryTxt.FieldByName('MATRICULA').AsString,
                            cChave, ceErroElegivelInserido, tdCaracter,'',
                            gCadastro, pNProcessado, '', '','','','','',sFlgIntSitPart,
                            qrytxt.fieldbyname('IDSITFUNC').AsString );
               end;

            end;

            // move para o próximo registro do Txt
            QryTxt.Next;
         end
         else begin
            // move para o próximo registro do TXT
            qryDadosNoBanco.Next;
         end;
      end;
   END; // while

   dtmBaseDados.dbBaseDados.Commit;
End;

Function TfrmImportaDadosCadastrais.Troca_Plique(s : string) : string;
begin
     if Pos('''',s) > 0
     then
         Insert('''',s,Pos('''',s));
     Result := s;
end;


//importação de lotações
procedure TfrmImportaDadosCadastrais.ImportaLotacao;
Begin

End;
//fim importa lotações


//importação dos registros de evolução funcional
//cargos - datainicio - datafinal
procedure TfrmImportaDadosCadastrais.ImportaEvolFunc;
var
   bencontrou, bdiferente : Boolean;
   sIdCargoExt, sFlgIntSitPart, sTextoSql, sSeqHistFunc, sAux : String;

   icontaux : Integer;

   sDtFimCargoAnt, sUltCargo,          
   sTipoSit, sidpessoa : String;
begin


   If dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.Commit;
   StartTransacao;

   pbStatus.Min := 0;
   pbStatus.Max := qryTxt.RecordCount;


   icontaux := 0;

   while (not qryTxt.EOF) do
   begin

      inc(icontaux);
      if icontaux >= 1000 then
      begin
         if dtmBaseDados.dbBaseDados.InTransaction
         then dtmBaseDados.dbBaseDados.Commit;
         StartTransacao;

         icontaux := 0;
      end;

      pbStatus.position := qryTxt.RecNo ;
      frmImportaDadosCadastrais.Update;


      if trim(qrytxt.fieldbyname('IDPESSOA').AsString) = '' then
      begin
         //caso haja alguima inserção anteriormente feita no arquivo de empregados
         qryaux.close;
         qryaux.sql.text := ' SELECT EL.IDPESSJUR, EL.IDPESSOA , NVL(PP.IDPLANOPREV,0) IDPLANOPREV , SIT.FLGINTERNO, SIT.DESCRICAO ,  PP.INSCRICAODATA, '+
                            ' SIT.IDSITPART , EL.IDSITFUNC, PP.IDSITPLANOPREV '+
                            ' FROM PARTPREVPLAN PP, ELEGPATRO EL, SITPART SIT  '+
                            ' WHERE EL.IDPESSJUR = EL.IDPESSJUR  '+
                            ' AND EL.MATRICULA LIKE  '''+qryTxt.FieldByName('MATRICULA').AsString+'%'' '+
                            ' AND EL.IDPESSOA = EL.IDPESSOA  '+
                            ' AND PP.IDPESSJUR(+) = EL.IDPESSJUR '+
                            ' AND PP.IDPESSOA(+) = EL.IDPESSOA   '+
                            ' AND SIT.IDSITPART(+) = PP.IDSITPART '+
                            ' ORDER BY PP.INSCRICAODATA DESC  ';
         qryaux.open;

         if qryaux.isempty then
         begin
            qrytxt.next;
            continue;
         end;

         sIdPessoa := qryaux.fieldbyname('IDPESSOA').AsString;

      end
      else sIdPessoa := trim(qrytxt.fieldbyname('IDPESSOA').AsString);


      sFlgIntSitPart := VoltaFlgInterno(qryAux, IntToStr(iPatro), sIdPessoa, sTipoSit);


      //aceitar CEDIDOS e MEMBROS DE CONSELHO
      if (sFlgIntSitPart = 'CA') and  ((sTipoSit = 'A') or (sTipoSit = 'F')) then sFlgIntSitPart := 'AT';

      if ((sFlgIntSitPart = 'CA') and (chkCancelados.Checked)) OR
         ((sFlgIntSitPart = 'MA') and (chkMantidos.Checked))   OR
         ((sFlgIntSitPart = 'AS') and (chkAssistidos.Checked))
      then begin
         if sFlgIntSitPart = 'CA'
         then TabCriticasCcp.Insere(qryaux,iPatro,
                               strtoint(sidpessoa),
                               dSeqCritica,
                               sMesCobranca,
                               qryTxt.FieldByName('MATRICULA').AsString ,
                               sFlgIntSitPart,
                               '',
                               cChave,
                               cePartCancelado,
                               tdCaracter,'',
                               gEvolFunc,
                               pNProcessado,'',
                               '','','','','',sFlgIntSitPart,'')
         else if sFlgIntSitPart = 'MA'
              then TabCriticasCcp.Insere(qryaux,iPatro,
                                    strtoint(sidpessoa),
                                    dSeqCritica,
                                    sMesCobranca,
                                    qryTxt.FieldByName('MATRICULA').AsString ,
                                    sFlgIntSitPart,
                                    '',
                                    cChave,
                                    cePartMantido,
                                    tdCaracter,'',
                                    gEvolFunc,
                                    pNProcessado,'',
                                    '','','','','',sFlgIntSitPart,'')
              else TabCriticasCcp.Insere(qryaux,iPatro,
                                    strtoint(sidpessoa),
                                    dSeqCritica,
                                    sMesCobranca,
                                    qryTxt.FieldByName('MATRICULA').AsString ,
                                    sFlgIntSitPart,
                                    '',
                                    cChave,
                                    cePartAssistido,
                                    tdCaracter,'',
                                    gEvolFunc,
                                    pNProcessado,'',
                                    '','','','','',sFlgIntSitPart,'');

         // move para o próximo registro
         qrytxt.next;
         continue;

      end; // if sFlgIntSitPart



      sTextoSql :=  ' SELECT  EV.SEQHISTFUNC, '+
                    '  EV.DATAINICIO, EV.DATAFINAL, '+
                    ' DECODE(EV.MODOFUNCAO,''EF'', ''EFETIVA'' ,''AS'', ''ASSEGURADA'', '+
                    ' ''ES'', ''EVENTUAL/SUBSTITUIÇÃO'', '+
                    ' ''DP'', ''DESIGNAÇÃO POR PRAZO'',''FA'', ''FACULTATIVA'', '+
                    ' ''BF'', ''BOLSA DE FUNÇÃO'',''ET'', ''ESTRATÉGICA'') AS MODO, '+
                    ' EV.MODOFUNCAO, '+
                    ' EV.IDPESSOA, EV.IDPESSJUR, EV.IDFUNCAO, CF.TITULO FUNCAO, '+
                    ' NVL(PERCFUNCAO,0) PERCFUNCAO, '+
                    ' NVL(PERC1AC,0) PERC1AC, NVL(PERCATS,0) PERCATS, NVL(PERCINSALUB,0) PERCINSALUB, '+
                    ' NVL(PERCPERICUL,0) PERCPERICUL , '+
                    ' NVL(PERCADNOT,0) PERCADNOT, NVL(QTDEMINUTOS,0) QTDEMINUTOS, '+
                    ' EV.DATAFINAL, CF.TITULO CARGO, EV.IDCARGOEXT , CC.CODIGO CODCARGO, '+
                    ' CF.CODIGO CODFUNCAO '+
                    ' FROM evolfuncprev EV , CARGOEXT CF, CARGOEXT CC '+
                    //' WHERE EV.IDPESSJUR = '''+IntToStr(iPatro)+''' '+  Renato Visoni SOL 97530 \ Kintana 425336
                    ' WHERE CC.IDPESSJUR = '''+IntToStr(iPatro)+''' '+
                    ' AND EV.IDPESSOA = '''+sidpessoa+''' '+
                    ' AND EV.IDPESSOA = EV.IDPESSOA '+
                    ' AND EV.IDFUNCAO = CF.IDCARGOEXT(+) '+
                    ' AND EV.IDPESSJUR = CF.IDPESSJUR(+) '+ 
                    ' AND EV.IDCARGOEXT = CC.IDCARGOEXT(+)  '+
                    ' AND EV.FLGSITPART <> ''AS'' '; 
      qryDadosNoBanco.Close;



      //COMO DEFINIÇÃO DO SEPARADOR - IDENTIFICA CADA LINHA
      {(CG)CARGO  (FN)FUNÇÃO (IN)INSALUBRIDADE (PC)PERICULOSIDADE
      (AN)ADICIONAL NOTURNO (AT)ADICIONAL TEMPO DE SERVIÇO
      (AC)ADICIONAL COMPENSATÓRIO}

      sAux := qrytxt.fieldbyname('TIPOREG').AsString;


      If (qrytxt.fieldbyname('TIPOREG').AsString <> 'AT') And
         (qrytxt.fieldbyname('TIPOREG').AsString <> 'IN')  
      Then Begin
        qryaux.close;
        qryaux.sql.Text := ' SELECT IDCARGOEXT '+
                           ' FROM CARGOEXT '+
                           ' WHERE IDPESSJUR = '''+IntToStr(iPatro)+''' AND '+
                           ' rtrim(ltrim(CODIGO)) = '''+trim(qrytxt.fieldbyname('CARGO').AsString)+''' ';
        qryaux.open;

        if qryaux.isempty then
        begin
          qrytxt.Next;
          continue;
        end
        else
          sIdCargoExt    := qryaux.fieldbyname('IDCARGOEXT').AsString;

        sDtFimCargoAnt := '';
      End;

      if (qrytxt.fieldbyname('TIPOREG').AsString = 'CG') and
         (qrytxt.fieldbyname('CARGO').AsString <> '') then
      begin
         if Trim(qrytxt.fieldbyname('DTFIMCARGO').AsString) = '' then
           sTextoSql := sTextoSql + ' AND EV.DATAFINAL IS NULL ';

         sTextoSql := sTextoSql + ' AND EV.IDCARGOEXT = '+sIdCargoExt+ 
                                  '    ORDER BY EV.DATAFINAL  DESC '; 
         qryDadosNoBanco.SQL.Text := sTextoSql;
         qryDadosNoBanco.Open;


         //Busca se tem registro antes do cargo anterior
         Try
           qryaux.close;
           qryaux.sql.Text := ' SELECT * FROM EVOLFUNCPREV '+
                              ' WHERE IDPESSOA    = '+sidpessoa;

           If not qryDadosNoBanco.IsEmpty Then
             qryaux.sql.Text := qryaux.sql.Text + '   AND SEQHISTFUNC <> '+qryDadosNoBanco.FieldByName('SEQHISTFUNC').AsString;

           qryaux.sql.Text := qryaux.sql.Text + '   AND IDPESSJUR   = '+IntToStr(iPatro)+
                              '   AND IDCARGOEXT  IS NOT NULL '+
                              '   AND (DATAFINAL  >= TO_DATE('''+qrytxt.fieldbyname('DTINICARGO').AsString+''',''DD/MM/YYYY'') OR DATAFINAL IS NULL)';

           If not qryDadosNoBanco.IsEmpty Then
           Begin
             qryaux.sql.Text := qryaux.sql.Text +'  AND NOT EXISTS (SELECT MAX(DATAINICIO) '+
                                                 ' FROM EVOLFUNCPREV '+
                                                 ' WHERE IDPESSOA    = '+sidpessoa+
                                                 '   AND SEQHISTFUNC <> '+qryDadosNoBanco.FieldByName('SEQHISTFUNC').AsString+
                                                 '   AND IDPESSJUR   = '+IntToStr(iPatro)+
                                                 '   AND IDCARGOEXT  IS NOT NULL) ';
           End;

           qryaux.sql.Text := qryaux.sql.Text + ' ORDER BY SEQHISTFUNC DESC ';
           qryaux.open;
         Except
           On E:Exception Do
           Begin
             If dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
             memoErros.Lines.Add(E.Message+' Matrícula: '+qryTxt.FieldByName('MATRICULA').AsString);
             StartTransacao;
           End;
         End;

         if not qryaux.isempty Then
         Begin
           if not AtualizaDataFinal(qryupdate,
                                    sIdPessoa,
                                    IntToStr(iPatro),
                                    qryaux.fieldbyname('SEQHISTFUNC').AsString,
                                    qrytxt.fieldbyname('DTINICARGO').AsString,
                                    qrytxt.FieldByName('DTINIFORMATO').AsString, True) then
             memoErros.Lines.Add('Erro ao alterar a data final do cargo anterior ao anterior.');
         End;


         Try
           qryaux.close;
           qryaux.sql.Text := ' SELECT * FROM EVOLFUNCPREV '+
                              ' WHERE IDPESSOA    = '+sIdPessoa+
                              '   AND IDPESSJUR   = '+IntToStr(iPatro)+
                              '   AND IDCARGOEXT  IS NOT NULL '+
                              '   AND DATAINICIO  > TO_DATE('''+qrytxt.fieldbyname('DTINICARGO').AsString+''',''DD/MM/YYYY'') '+
                              ' ORDER BY SEQHISTFUNC DESC ';
           qryaux.open;
         Except
           On E:Exception Do
           Begin
             If dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
             memoErros.Lines.Add(E.Message+' Matrícula: '+qryTxt.FieldByName('MATRICULA').AsString);
             StartTransacao;
           End;
         End;

         if not qryaux.isempty Then
           sDtFimCargoAnt   := FormatDateTime('dd/mm/yyyy', qryaux.fieldbyname('DATAINICIO').AsDateTime - 1) 
         else
           if trim(qrytxt.fieldbyname('DTFIMCARGO').AsString) <> '' then
             sDtFimCargoAnt   := FormatDateTime('dd/mm/yyyy', qrytxt.fieldbyname('DTFIMCARGO').AsDateTime); 

         bEncontrou := False;
         bDiferente := false;
         qryDadosNoBanco.first;
         while not qryDadosNoBanco.eof do
         begin

            //linha de cargo encontrada
            //achou o cargo
            if qryDadosNoBanco.fieldbyname('CODCARGO').AsString <> '' then
            begin
               bEncontrou := True;

               if trim(qryDadosNoBanco.fieldbyname('CODCARGO').AsString) =
                  trim(qrytxt.fieldbyname('CARGO').AsString) then
               begin  //se achou o mesmo cargo verificar se há atualização de data fim
                  if (qrytxt.fieldbyname('DTINICARGO').AsString =
                      qryDadosNoBanco.FieldByName('DATAINICIO').AsString) And 
                     (qrytxt.fieldbyname('DTFIMCARGO').AsString <>
                      qryDadosNoBanco.FieldByName('DATAFINAL').AsString) then
                  begin
                     if batucargoef then
                     begin

                        if not AtualizaDataFinal(qryupdate, sidpessoa,
                                                 inttostr(iPatro),
                                                 qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                                 qrytxt.fieldbyname('DTFIMCARGO').AsString,
                                                 qrytxt.FieldByName('DTFIMFORMATO').AsString, false) then
                        memoErros.Lines.Add('Erro ao alterar a data final do cargo atual.');

                        pProcessoAux := pAceito ;
                     end
                     else begin
                        pProcessoAux := pNProcessado ;
                     end;

                     TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qrytxt.FieldByName('MATRICULA').AsString ,
                                            qryTxt.FieldByName('DTFIMCARGO').AsString,
                                            qrydadosnobanco.fieldbyname('DATAFINAL').AsString,
                                            cChave, ceEfDtFimCargoAlterado , tdCaracter,
                                            qrytxt.FieldByName('DTFIMFORMATO').AsString,
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','' ,sFlgIntSitPart,'');

                  end;//if dtfimcargo

                  If qrytxt.fieldbyname('DTINICARGO').AsString <> qryDadosNoBanco.FieldByName('DATAINICIO').AsString
                  Then Begin
                     If batucargoef
                     Then Begin

                        If Not AtualizaDataInicial(qryUpdate, sidpessoa,
                                                   inttostr(iPatro),
                                                   qryDadosNoBanco.FieldByName('SEQHISTFUNC').AsString,
                                                   qryTxt.FieldByName('DTINICARGO').AsString,
                                                   qryTxt.FieldByName('DTINIFORMATO').AsString, False,
                                                   qryTxt.FieldByName('MODO').AsString) 
                        Then memoErros.Lines.Add('Erro ao alterar a data inicial do cargo atual.');

                        pProcessoAux := pAceito ;
                     End
                     Else Begin
                        pProcessoAux := pNProcessado ;
                     End;

                     TabCriticasCcp.Insere( qryAux, iPatro, StrToInt(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qryTxt.FieldByName('MATRICULA').AsString ,
                                            qryTxt.FieldByName('DTINICARGO').AsString,
                                            qryDadosNobanco.fieldbyname('DATAINICIO').AsString,
                                            cChave, ceEfDtIniCargoAlterado , tdCaracter,
                                            qrytxt.FieldByName('DTINIFORMATO').AsString,
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','' ,sFlgIntSitPart,'');

                  end; // If qrytxt.fieldbyname('DTINICARGO').AsString

               end
               else if trim(qryDadosNoBanco.fieldbyname('CODCARGO').AsString) <>
                       trim(qrytxt.fieldbyname('CARGO').AsString) then
               begin


                  bDiferente := true;

                  if batucargoef then
                  begin


                     //o cargo atual é diferente do banco
                     //inserir atual e atualizar data final do anterior
                     if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                                  inttostr(iPatro),
                                  sIdCargoExt,
                                  'NULL', 'NULL', 'NULL', 'NULL',
                                  'NULL', 'NULL','NULL',
                                  qrytxt.fieldbyname('MODO').AsString,
                                  qrytxt.fieldbyname('DTINICARGO').AsString, '',
                                  'NULL' , 'NULL', 'NULL',
                                  qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
                     then  memoErros.Lines.Add('Erro ao inserir o cargo atual.');




                    if not AtualizaDataFinal(qryupdate, sidpessoa,
                                              inttostr(iPatro),
                                              sSeqHistFunc,//qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,     Renato Visoni SOL 97530 \ Kintana 425336
                                              qrytxt.fieldbyname('DTFIMCARGO').AsString,//qrytxt.fieldbyname('DTINICARGO').AsString, Renato Visoni SOL 97530 \ Kintana 425336
                                              qrytxt.FieldByName('DTFIMFORMATO').AsString,true) then//qrytxt.FieldByName('DTINIFORMATO').AsString,true) then  renato visoni SOL 97530 \ Kintana 425336
                                              memoErros.Lines.Add('Erro ao alterar a data final do cargo anterior.');

                         pProcessoAux := pAceito ;
                  end
                  else begin
                     pProcessoAux := pNProcessado ;
                  end;

                  TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                         dSeqCritica, sMesCobranca,
                                         qrytxt.FieldByName('MATRICULA').AsString ,
                                         qryDadosNoBanco.FieldByName('CODCARGO').AsString,
                                         qryTxt.FieldByName('CARGO').AsString,
                                         cChave, ceEfCargoInserido , tdNumerico,'',
                                         gEvolFunc, pProcessoAux, '',
                                         qrytxt.fieldbyname('MODO').AsString,
                                         qrytxt.fieldbyname('DTINICARGO').AsString,
                                         qrytxt.fieldbyname('DTFIMCARGO').AsString,'','' ,sFlgIntSitPart,'');
               end;
            end;

            sUltCargo := qryDadosNoBanco.FieldByName('CARGO').AsString;
            qryDadosNoBanco.next;
            if qryDadosNoBanco.FieldByName('CARGO').AsString <> sUltCargo Then
              if bencontrou then break;
         end;

         //não tem o cargo em questão cadastrado
         //inserir
         if (not bEncontrou) then
         begin

            //a informação está vindo no arquivo, porém já está finalizada.
            //Como a qrydadosbanco não traz registros já finalizados, este deve ser rejeitado

            if batucargoef then
            begin

               if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                            inttostr(iPatro),
                            sIdCargoExt,
                            'NULL', 'NULL', 'NULL', 'NULL',
                            'NULL', 'NULL', 'NULL',
                            qrytxt.fieldbyname('MODO').AsString,
                            qrytxt.fieldbyname('DTINICARGO').AsString, sDtFimCargoAnt,
                            'NULL' , 'NULL', 'NULL',
                            qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
               then  memoErros.Lines.Add('Erro ao inserir o cargo atual.');

               pProcessoAux := pAceito ;
            end
            else
            begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                   dSeqCritica, sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   '0',
                                   qryTxt.FieldByName('CARGO').AsString,
                                   cChave, ceEfCargoInserido , tdNumerico,'',
                                   gEvolFunc, pProcessoAux, '',
                                   qrytxt.fieldbyname('MODO').AsString,
                                   qrytxt.fieldbyname('DTINICARGO').AsString,
                                   qrytxt.fieldbyname('DTFIMCARGO').AsString,'','', sFlgIntSitPart ,'');

         end;
      end
      else if (qrytxt.fieldbyname('TIPOREG').AsString = 'FN') and
              (qrytxt.fieldbyname('CARGO').AsString <> '') and
              (strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString)) > 0) then 
      begin


         sTextoSql := sTextoSql + ' AND EV.IDFUNCAO IS NOT NULL '+
                                  ' AND EV.MODOFUNCAO = '''+qrytxt.fieldbyname('MODO').AsString+''' '+ 

                                  ' AND EV.DATAINICIO = TO_DATE('''+qrytxt.FieldByName('DTINICARGO').AsString+''', ''DD/MM/YYYY'') '+
                                  ' AND EV.IDFUNCAO = '+sIdcargoExt+ 
                                  ' AND  ((NVL(EV.PERCFUNCAO,0) >0 )  '+
                                  '    OR (NVL(EV.PERC1AC,0) + NVL(EV.PERC2AC,0) + '+
                                  '    NVL(EV.PERCATS,0) + NVL(EV.PERCINSALUB,0) + '+
                                  '    NVL(EV.PERCINSALUB,0) + NVL(EV.PERCPERICUL,0) + NVL(EV.PERCADNOT,0) = 0)) ';
         qryDadosNoBanco.SQL.Text := sTextoSql;
         qryDadosNoBanco.Open;

         bEncontrou := False;
         bDiferente := false;
         qryDadosNoBanco.first;
         while not qryDadosNoBanco.eof do
         begin

            //linha de cargo encontrada
            if qryDadosNoBanco.fieldbyname('CODFUNCAO').AsString <> '' then
            begin
               bEncontrou := True;



               if trim(qryDadosNoBanco.fieldbyname('CODFUNCAO').AsString) =
                  trim(qrytxt.fieldbyname('CARGO').AsString) then
               begin  //se achou o mesmo cargo verificar se há atualização de data fim
                  if qrytxt.fieldbyname('DTFIMCARGO').AsString <>
                     qrydadosnobanco.fieldbyname('DATAFINAL').AsString then
                  begin
                     if batufuncaoef then
                     begin

                        if not AtualizaDataFinal(qryupdate, sidpessoa,
                                                 inttostr(iPatro),
                                                 qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                                 qrytxt.fieldbyname('DTFIMCARGO').AsString,
                                                 qrytxt.FieldByName('DTFIMFORMATO').AsString, false) then
                        memoErros.Lines.Add('Erro ao alterar a data final da função atual.');

                        pProcessoAux := pAceito ;
                     end
                     else begin
                        pProcessoAux := pNProcessado ;
                     end;

                     TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qrytxt.FieldByName('MATRICULA').AsString ,
                                            '''''',
                                            qryTxt.FieldByName('DTFIMCARGO').AsString,
                                            cChave, ceEfDtFimFuncaoAlterado , tdData,
                                            qrytxt.FieldByName('DTFIMFORMATO').AsString,
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','', sFlgIntSitPart,'' );

                  end;//if dtfimcargo

                  If qrytxt.fieldbyname('DTINICARGO').AsString <> qryDadosNoBanco.FieldByName('DATAINICIO').AsString
                  Then Begin
                     If batucargoef
                     Then Begin

                        If Not AtualizaDataInicial(qryUpdate, sidpessoa,
                                                   inttostr(iPatro),
                                                   qryDadosNoBanco.FieldByName('SEQHISTFUNC').AsString,
                                                   qryTxt.FieldByName('DTINICARGO').AsString,
                                                   qryTxt.FieldByName('DTINIFORMATO').AsString, False,
                                                   qryTxt.FieldByName('MODO').AsString) 
                        Then memoErros.Lines.Add('Erro ao alterar a data inicial da função atual.');

                        pProcessoAux := pAceito ;
                     End
                     Else Begin
                        pProcessoAux := pNProcessado ;
                     End;

                     TabCriticasCcp.Insere( qryAux, iPatro, StrToInt(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qryTxt.FieldByName('MATRICULA').AsString ,
                                            qryTxt.FieldByName('DTINICARGO').AsString,
                                            qryDadosNobanco.fieldbyname('DATAINICIO').AsString,
                                            cChave, ceEfDtIniCargoAlterado , tdCaracter,
                                            qrytxt.FieldByName('DTINIFORMATO').AsString,
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','' ,sFlgIntSitPart,'');

                  end; // If qrytxt.fieldbyname('DTINICARGO').AsString

                  if (qrytxt.fieldbyname('MODO').AsString <>  qrydadosnobanco.fieldbyname('MODOFUNCAO').AsString) and 
                     (trim(qrytxt.fieldbyname('MODO').AsString) <> '') and
                     (qrytxt.fieldbyname('DTINICARGO').AsString = qrydadosnobanco.fieldbyname('DATAINICIO').AsString) then
                  begin
                     qryaux.Close;
                     qryaux.SQL.Clear;
                     qryaux.SQL.Add(' UPDATE evolfuncprev SET MODOFUNCAO = '''+qrytxt.fieldbyname('MODO').AsString+''' '+
                                       ' WHERE  SEQHISTFUNC   = '''+qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString+''' '+
                                       ' AND    IDPESSOA  =  '''+sidpessoa+''' '+
                                       ' AND    IDPESSJUR =  '''+qrypatro.FieldByName('IDPESSOA').AsString+''' ');
                     qryaux.ExecSQL;
                  end;
               end
               else if trim(qryDadosNoBanco.fieldbyname('CODFUNCAO').AsString) <>
                       trim(qrytxt.fieldbyname('CARGO').AsString) then
               begin

                  bDiferente := true;

                  if batufuncaoef then
                  begin

                     //o cargo atual é diferente do banco
                     //inserir atual e atualizar data final do anterior
                     if not Insereevolfuncprev(qryaux, qryupdate,sidpessoa,
                                  inttostr(iPatro),
                                  'NULL',
                                  sIdCargoExt, 'NULL',
                                  'NULL', 'NULL','NULL','NULL',
                                  qrytxt.fieldbyname('PCADIC').AsString,
                                  qrytxt.fieldbyname('MODO').AsString,
                                  qrytxt.fieldbyname('DTINICARGO').AsString, '',
                                  'NULL' , 'NULL', 'NULL',
                                  qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
                     then  memoErros.Lines.Add('Erro ao inserir o função atual.');


                     if not AtualizaDataFinal(qryupdate, sidpessoa,
                                              inttostr(iPatro),
                                              qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                              qrytxt.fieldbyname('DTINICARGO').AsString,
                                              qrytxt.FieldByName('DTINIFORMATO').AsString, True) then
                     memoErros.Lines.Add('Erro ao alterar a data final da função anterior.');

                     pProcessoAux := pAceito ;
                  end
                  else begin
                     pProcessoAux := pNProcessado ;
                  end;

                  TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                         dSeqCritica, sMesCobranca,
                                         qrytxt.FieldByName('MATRICULA').AsString ,
                                         qryDadosNoBanco.FieldByName('CODFUNCAO').AsString,
                                         qryTxt.FieldByName('CARGO').AsString,
                                         cChave, ceEfFuncaoInserido , tdNumerico,'',
                                         gEvolFunc, pProcessoAux, '',
                                         qrytxt.fieldbyname('MODO').AsString,
                                         qrytxt.fieldbyname('DTINICARGO').AsString,
                                         qrytxt.fieldbyname('DTFIMCARGO').AsString,'','', sFlgIntSitPart,'' );
               end;
            end;

            if bencontrou then break;

            qryDadosNoBanco.next;
         end;

         //não tem o cargo em questão cadastrado
         //inserir
         if (not bEncontrou) then
         begin
            if batufuncaoef then
            begin

               if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                            inttostr(iPatro),
                            'NULL',
                            sIdCargoExt, 'NULL', 'NULL', 'NULL',
                            'NULL', 'NULL',
                            qrytxt.fieldbyname('PCADIC').AsString,
                            qrytxt.fieldbyname('MODO').AsString,
                            qrytxt.fieldbyname('DTINICARGO').AsString, qrytxt.fieldbyname('DTFIMCARGO').AsString, 
                            'NULL' , 'NULL', 'NULL',
                            qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
               then  memoErros.Lines.Add('Erro ao inserir o cargo atual.');

               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                   dSeqCritica, sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   '0',
                                   qryTxt.FieldByName('CARGO').AsString,
                                   cChave, ceEfFuncaoInserido , tdNumerico,'',
                                   gEvolFunc, pProcessoAux, '',
                                   qrytxt.fieldbyname('MODO').AsString,
                                   qrytxt.fieldbyname('DTINICARGO').AsString,
                                   qrytxt.fieldbyname('DTFIMCARGO').AsString,'','', sFlgIntSitPart,'' );
         end;

      end
      else if (qrytxt.fieldbyname('TIPOREG').AsString = 'IN') and
              (strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString)) > 0) then
      begin


         sTextoSql := sTextoSql + ' AND EV.PERCINSALUB IS NOT NULL '+
                                  ' AND EV.DATAINICIO = (SELECT MAX(DATAINICIO)  '+
                                  '    FROM evolfuncprev '+
                                  '    WHERE IDPESSJUR = EV.IDPESSJUR AND '+
                                  '    IDPESSOA = EV.IDPESSOA AND '+
                                  '    NVL(PERCINSALUB,0) > 0  AND '+
                                  '    FLGSITPART <> ''AS''  )'; 
         qryDadosNoBanco.SQL.Text := sTextoSql;
         qryDadosNoBanco.Open;


         bEncontrou := False;
         bDiferente := false;
         qryDadosNoBanco.first;
         while not qryDadosNoBanco.eof do
         begin

            //linha de cargo encontrada
            if strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCINSALUB').AsString)) > 0 then
            begin
               bEncontrou := True;



               if floattostr(strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCINSALUB').AsString))) =
                  floattostr(strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString))) then
               begin  //se achou o mesmo percentualverificar se há atualização de data fim
                  if qrytxt.fieldbyname('DTFIMCARGO').AsString <>
                     qrydadosnobanco.fieldbyname('DATAFINAL').AsString then
                  begin
                     if batuinsalubef then
                     begin

                        if not AtualizaDataFinal(qryupdate, sidpessoa,
                                                 inttostr(iPatro),
                                                 qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                                 qrytxt.fieldbyname('DTFIMCARGO').AsString,
                                                 qrytxt.FieldByName('DTFIMFORMATO').AsString, false) then
                        memoErros.Lines.Add('Erro ao alterar a data final do percentual de insalubridade.');


                        pProcessoAux := pAceito ;
                     end
                     else begin
                        pProcessoAux := pNProcessado ;
                     end;


                     TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qrytxt.FieldByName('MATRICULA').AsString ,
                                            '''''',
                                            qryTxt.FieldByName('DTFIMCARGO').AsString,
                                            cChave, ceEfDtFimInsalubAlterado , tdData,
                                            qrytxt.FieldByName('DTFIMFORMATO').AsString,
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','', sFlgIntSitPart,'' );



                  end;//if dtfimcargo

                  If qrytxt.fieldbyname('DTINICARGO').AsString <> qryDadosNoBanco.FieldByName('DATAINICIO').AsString
                  Then Begin
                     If batucargoef
                     Then Begin

                        If Not AtualizaDataInicial(qryUpdate, sidpessoa,
                                                   inttostr(iPatro),
                                                   qryDadosNoBanco.FieldByName('SEQHISTFUNC').AsString,
                                                   qryTxt.FieldByName('DTINICARGO').AsString,
                                                   qryTxt.FieldByName('DTINIFORMATO').AsString, False,
                                                   qryTxt.FieldByName('MODO').AsString) 

                        Then memoErros.Lines.Add('Erro ao alterar a data inicial do percentual de insalubridade.');

                        pProcessoAux := pAceito ;
                     End
                     Else Begin
                        pProcessoAux := pNProcessado ;
                     End;

                     TabCriticasCcp.Insere( qryAux, iPatro, StrToInt(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qryTxt.FieldByName('MATRICULA').AsString ,
                                            qryTxt.FieldByName('DTINICARGO').AsString,
                                            qryDadosNobanco.fieldbyname('DATAINICIO').AsString,
                                            cChave, ceEfDtIniCargoAlterado , tdCaracter,
                                            qrytxt.FieldByName('DTINIFORMATO').AsString,
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','' ,sFlgIntSitPart,'');

                  end; // If qrytxt.fieldbyname('DTINICARGO').AsString

               end
               else if floattostr(strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCINSALUB').AsString))) <>
                      floattostr( strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString))) then
               begin

                  bDiferente := true;

                  //a informação está vindo no arquivo, porém já está finalizada.
                  //Como a qrydadosbanco não traz registros já finalizados, este deve ser rejeitado
                  if qrytxt.fieldbyname('DTFIMCARGO').AsString <> '' then
                  begin
                     qrytxt.next;
                     continue;
                  end;

                  if batuInsalubef then
                  begin

                     try
                        //o Pecentual de insalubridade atual é diferente do banco
                        //inserir atual e atualizar data final do anterior
                        if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                                     inttostr(iPatro),
                                     'NULL',
                                     'NULL', 'NULL',
                                     'NULL', 'NULL',
                                     oranumero(qrytxt.fieldbyname('PCADIC').AsString),'NULL',
                                     'NULL',
                                     qrytxt.fieldbyname('MODO').AsString,
                                     qrytxt.fieldbyname('DTINICARGO').AsString, '',
                                     'NULL' , 'NULL', 'NULL',
                                     qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
                        then  memoErros.Lines.Add('Erro ao inserir o Percentual de insalubridade.');


                        if not AtualizaDataFinal(qryupdate, sidpessoa,
                                                 inttostr(iPatro),
                                                 qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                                 qrytxt.fieldbyname('DTINICARGO').AsString,
                                                 qrytxt.FieldByName('DTINIFORMATO').AsString, True)
                        then  memoErros.Lines.Add('Erro ao alterar o percentual de insalubridade anterior.');


                     except
                        memoErros.Lines.Add('Erro ao atualizar o percentual de insalubridade.');
                     end;

                     pProcessoAux := pAceito ;
                  end
                  else begin
                     pProcessoAux := pNProcessado ;
                  end;

                  TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                         dSeqCritica, sMesCobranca,
                                         qrytxt.FieldByName('MATRICULA').AsString ,
                                         qryDadosNoBanco.FieldByName('PERCINSALUB').AsString,
                                         oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                         cChave, ceEfPercInsalubAlterado , tdNumerico,'',
                                         gEvolFunc, pProcessoAux, '',
                                         qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                         '','','','', sFlgIntSitPart,'' );
               end;
            end;

            if bencontrou then break;

            qryDadosNoBanco.next;
         end;

         //não tem o cargo em questão cadastrado
         //inserir
         if (not bEncontrou) then
         begin

            //a informação está vindo no arquivo, porém já está finalizada.
            //Como a qrydadosbanco não traz registros já finalizados, este deve ser rejeitado
            if qrytxt.fieldbyname('DTFIMCARGO').AsString <> '' then
            begin
               qrytxt.next;
               continue;
            end;

            if batuinsalubef then
            begin

               //o Pecentual de insalubridade atual é diferente do banco
               //inserir atual e atualizar data final do anterior
               if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                            inttostr(iPatro),
                            'NULL',
                            'NULL', 'NULL',
                            'NULL', 'NULL',
                            oranumero(qrytxt.fieldbyname('PCADIC').AsString),'NULL',
                            'NULL',
                            qrytxt.fieldbyname('MODO').AsString,
                            qrytxt.fieldbyname('DTINICARGO').AsString, '',
                            'NULL' , 'NULL', 'NULL',
                            qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
               then  memoErros.Lines.Add('Erro ao inserir o Percentual de insalubridade.');

               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                   dSeqCritica, sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   sSeqHistFunc,
                                   oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                   cChave, ceEfInsalubInserido , tdNumerico,'',
                                   gEvolFunc, pProcessoAux, '',
                                   qrytxt.fieldbyname('MODO').AsString,
                                   qrytxt.fieldbyname('DTINICARGO').AsString,
                                   qrytxt.fieldbyname('DTFIMCARGO').AsString,'','', sFlgIntSitPart ,'');
         end;


      end
      else if (qrytxt.fieldbyname('TIPOREG').AsString = 'PC') and
              (strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString)) > 0) then
      begin


         sTextoSql := sTextoSql + ' AND EV.PERCPERICUL IS NOT NULL '+
                                  ' AND EV.DATAINICIO = (SELECT MAX(DATAINICIO)  '+
                                  '    FROM evolfuncprev '+
                                  '    WHERE IDPESSJUR = EV.IDPESSJUR AND '+
                                  '    IDPESSOA = EV.IDPESSOA AND '+
                                  '    NVL(PERCPERICUL,0) > 0 AND  '+
                                  '    FLGSITPART <> ''AS'') '; 
         qryDadosNoBanco.SQL.Text := sTextoSql;
         qryDadosNoBanco.Open;


         bEncontrou := False;
         bDiferente := false;
         qryDadosNoBanco.first;
         while not qryDadosNoBanco.eof do
         begin

            //linha de cargo encontrada
            if strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCPERICUL').AsString)) > 0 then
            begin
               bEncontrou := True;



               if strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCPERICUL').AsString)) =
                  strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString)) then
               begin  //se achou o mesmo percentualverificar se há atualização de data fim
                  if qrytxt.fieldbyname('DTFIMCARGO').AsString <>
                     qryDadosNoBanco.FieldByName('DATAFINAL').AsString then
                  begin
                     if batupericulef then
                     begin

                        if not AtualizaDataFinal(qryupdate, sidpessoa,
                                                 inttostr(iPatro),
                                                 qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                                 qrytxt.fieldbyname('DTFIMCARGO').AsString,
                                                 qrytxt.FieldByName('DTFIMFORMATO').AsString, false) then
                        memoErros.Lines.Add('Erro ao alterar a data final do percentual de periculosidade.');


                        pProcessoAux := pAceito ;
                     end
                     else begin
                        pProcessoAux := pNProcessado ;
                     end;

                     TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qrytxt.FieldByName('MATRICULA').AsString ,
                                            qryDadosNoBanco.FieldByName('PERCINSALUB').AsString,
                                            oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                            cChave, ceEfDtFimPericulAlterado , tdNumerico,'',
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','',sFlgIntSitPart,'' );

                  end;//if dtfimcargo
               end
               else if floattostr(strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCPERICUL').AsString))) <>
                       floattostr(strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString))) then
               begin

                  bDiferente := true;

                  if batupericulef then
                  begin
                     //o Pecentual de insalubridade atual é diferente do banco
                     //inserir atual e atualizar data final do anterior
                     if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                                  inttostr(iPatro),
                                  'NULL',
                                  'NULL', 'NULL',
                                  'NULL', 'NULL',
                                  'NULL',oranumero(qrytxt.fieldbyname('PCADIC').AsString),
                                  'NULL',
                                  qrytxt.fieldbyname('MODO').AsString,
                                  qrytxt.fieldbyname('DTINICARGO').AsString, '',
                                  'NULL' , 'NULL', 'NULL',
                                  qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
                     then  memoErros.Lines.Add('Erro ao inserir o Percentual de periculosidade.');


                     if not AtualizaDataFinal(qryupdate, sidpessoa,
                                              inttostr(iPatro),
                                              qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                              qrytxt.fieldbyname('DTINICARGO').AsString,
                                              qrytxt.FieldByName('DTINIFORMATO').AsString, True)
                     then  memoErros.Lines.Add('Erro ao alterar o percentual de periculosidade anterior.');

                     pProcessoAux := pAceito ;
                  end
                  else begin
                     pProcessoAux := pNProcessado ;
                  end;

                  TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                         dSeqCritica, sMesCobranca,
                                         qrytxt.FieldByName('MATRICULA').AsString ,
                                         qryDadosNoBanco.FieldByName('PERCPERICUL').AsString,
                                         oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                         cChave, ceEfPercInsalubAlterado , tdNumerico,'',
                                         gEvolFunc, pProcessoAux, '',
                                         qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','',sFlgIntSitPart ,'');
               end;
            end;

            if bencontrou then break;

            qryDadosNoBanco.next;
         end;

         //não tem o cargo em questão cadastrado
         //inserir
         if (not bEncontrou) then
         begin

            //a informação está vindo no arquivo, porém já está finalizada.
            //Como a qrydadosbanco não traz registros já finalizados, este deve ser rejeitado
            if qrytxt.fieldbyname('DTFIMCARGO').AsString <> '' then
            begin
               qrytxt.next;
               continue;
            end;

            if batupericulef then
            begin

               //o Pecentual de insalubridade atual é diferente do banco
               //inserir atual e atualizar data final do anterior
               if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                            inttostr(iPatro),
                            'NULL',
                            'NULL', 'NULL',
                            'NULL', 'NULL',
                            'NULL',oranumero(qrytxt.fieldbyname('PCADIC').AsString),
                            'NULL',
                            qrytxt.fieldbyname('MODO').AsString,
                            qrytxt.fieldbyname('DTINICARGO').AsString, '',
                            'NULL' , 'NULL', 'NULL',
                            qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
               then  memoErros.Lines.Add('Erro ao inserir o Percentual de periculosidade.');

               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                   dSeqCritica, sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   sSeqHistFunc,
                                   oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                   cChave, ceEfPericulInserido , tdNumerico,'',
                                   gEvolFunc, pProcessoAux, '',
                                   qrytxt.fieldbyname('MODO').AsString,
                                   qrytxt.fieldbyname('DTINICARGO').AsString,
                                   qrytxt.fieldbyname('DTFIMCARGO').AsString,'','',sFlgIntSitPart,'');
         end;

      end
      else if (qrytxt.fieldbyname('TIPOREG').AsString = 'AN') and
              (strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString)) >0 ) then
      begin

         sTextoSql := sTextoSql + ' AND EV.PERCADNOT IS NOT NULL '+
                                  ' AND EV.DATAINICIO = (SELECT MAX(DATAINICIO)  '+
                                  '    FROM evolfuncprev '+
                                  '    WHERE IDPESSJUR = EV.IDPESSJUR AND '+
                                  '    IDPESSOA = EV.IDPESSOA AND '+
                                  '    FLGSITPART <> ''AS'' AND '+ 
                                  '    NVL(PERCADNOT,0) > 0 )';
         qryDadosNoBanco.SQL.Text := sTextoSql;
         qryDadosNoBanco.Open;



         bEncontrou := False;
         bDiferente := false;
         qryDadosNoBanco.first;
         while not qryDadosNoBanco.eof do
         begin

            //linha de cargo encontrada
            if strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCADNOT').AsString)) > 0 then
            begin
               bEncontrou := True;



               if floattostr(strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCADNOT').AsString))) =
                  floattostr(strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString))) then
               begin  //se achou o mesmo percentualverificar se há atualização de data fim
                  if qrytxt.fieldbyname('DTFIMCARGO').AsString <>
                     qryDadosNoBanco.FieldByName('DATAFINAL').AsString then
                  begin
                     if batuadnotef then
                     begin

                        if not AtualizaDataFinal(qryupdate, sidpessoa,
                                                 inttostr(iPatro),
                                                 qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                                 qrytxt.fieldbyname('DTFIMCARGO').AsString,
                                                 qrytxt.FieldByName('DTFIMFORMATO').AsString, false) then
                        memoErros.Lines.Add('Erro ao alterar a data final do adicional noturno.');


                        pProcessoAux := pAceito ;
                     end
                     else begin
                        pProcessoAux := pNProcessado ;
                     end;


                     TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qrytxt.FieldByName('MATRICULA').AsString ,
                                            '''''',
                                            qryTxt.FieldByName('DTFIMCARGO').AsString,
                                            cChave, ceEfDtFimAdNoturnoAlterado , tdData,
                                            qrytxt.FieldByName('DTFIMFORMATO').AsString,
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','',sFlgIntSitPart,'' );

                  end;//if dtfimcargo

                  If qrytxt.fieldbyname('DTINICARGO').AsString <> qryDadosNoBanco.FieldByName('DATAINICIO').AsString
                  Then Begin
                     If batucargoef
                     Then Begin

                        If Not AtualizaDataInicial(qryUpdate, sidpessoa,
                                                   inttostr(iPatro),
                                                   qryDadosNoBanco.FieldByName('SEQHISTFUNC').AsString,
                                                   qryTxt.FieldByName('DTINICARGO').AsString,
                                                   qryTxt.FieldByName('DTINIFORMATO').AsString, False,
                                                   qryTxt.FieldByName('MODO').AsString) 
                        Then memoErros.Lines.Add('Erro ao alterar a data inicial do adicional noturno.');

                        pProcessoAux := pAceito ;
                     End
                     Else Begin
                        pProcessoAux := pNProcessado ;
                     End;

                     TabCriticasCcp.Insere( qryAux, iPatro, StrToInt(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qryTxt.FieldByName('MATRICULA').AsString ,
                                            qryTxt.FieldByName('DTINICARGO').AsString,
                                            qryDadosNobanco.fieldbyname('DATAINICIO').AsString,
                                            cChave, ceEfDtIniCargoAlterado , tdCaracter,
                                            qrytxt.FieldByName('DTINIFORMATO').AsString,
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','' ,sFlgIntSitPart,'');

                  end; // If qrytxt.fieldbyname('DTINICARGO').AsString

               end
               else if strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCADNOT').AsString ))<>
                       strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString)) then
               begin

                  bDiferente := true;

                  if batuadnotef then
                  begin
                     //o Pecentual de adicional noturno atual é diferente do banco
                     //inserir atual e atualizar data final do anterior
                     if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                                  inttostr(iPatro),
                                  'NULL',
                                  'NULL', 'NULL',
                                  'NULL', 'NULL',
                                  'NULL','NULL',
                                  'NULL',
                                  qrytxt.fieldbyname('MODO').AsString,
                                  qrytxt.fieldbyname('DTINICARGO').AsString, '',
                                  'NULL' , oranumero(qrytxt.fieldbyname('PCADIC').AsString),
                                  qrytxt.fieldbyname('QTDEMIN').AsString,
                                  qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
                     then  memoErros.Lines.Add('Erro ao inserir o Adicional noturno.');


                     if not AtualizaDataFinal(qryupdate, sidpessoa,
                                              inttostr(iPatro),
                                              qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                              qrytxt.fieldbyname('DTINICARGO').AsString,
                                              qrytxt.FieldByName('DTINIFORMATO').AsString, True)
                     then  memoErros.Lines.Add('Erro ao alterar o percentual de adicional noturno anterior.');


                     pProcessoAux := pAceito ;
                  end
                  else begin
                     pProcessoAux := pNProcessado ;
                  end;

                  TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                         dSeqCritica, sMesCobranca,
                                         qrytxt.FieldByName('MATRICULA').AsString ,
                                         qryDadosNoBanco.FieldByName('PERCADNOT').AsString,
                                         oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                         cChave, ceEfPercAdNoturnoAlterado , tdNumerico,'',
                                         gEvolFunc, pProcessoAux, '',
                                         qryDadosNoBanco.FieldByName('SEQHISTFUNC').AsString,
                                         qrytxt.fieldbyname('QTDEMIN').AsString,'','','',sFlgIntSitPart,'' );
               end;
            end;

            if bencontrou then break;

            qryDadosNoBanco.next;
         end;

         //não tem o cargo em questão cadastrado
         //inserir
         if (not bEncontrou) then
         begin

            //a informação está vindo no arquivo, porém já está finalizada.
            //Como a qrydadosbanco não traz registros já finalizados, este deve ser rejeitado
            if qrytxt.fieldbyname('DTFIMCARGO').AsString <> '' then
            begin
               qrytxt.next;
               continue;
            end;

            if batuadnotef then
            begin

               //o Pecentual de adicional noturno atual é diferente do banco
               //inserir atual e atualizar data final do anterior
               if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                            inttostr(iPatro),
                            'NULL',
                            'NULL', 'NULL',
                            'NULL', 'NULL',
                            'NULL','NULL',
                            'NULL',
                            qrytxt.fieldbyname('MODO').AsString,
                            qrytxt.fieldbyname('DTINICARGO').AsString, '',
                            'NULL' , oranumero(qrytxt.fieldbyname('PCADIC').AsString),
                            qrytxt.fieldbyname('QTDEMIN').AsString,
                            qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
               then  memoErros.Lines.Add('Erro ao inserir o Adicional noturno.');

               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;
            TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                   dSeqCritica, sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   sSeqHistFunc,
                                   oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                   cChave, ceEfAdNoturnoInserido , tdNumerico,'',
                                   gEvolFunc, pProcessoAux, '',
                                   qrytxt.fieldbyname('MODO').AsString,
                                   qrytxt.fieldbyname('DTINICARGO').AsString,
                                   qrytxt.fieldbyname('DTFIMCARGO').AsString,'','',sFlgIntSitPart,'' );
         end;

      end
      else if (qrytxt.fieldbyname('TIPOREG').AsString = 'AT') and
              (strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString )) > 0) then
      begin


         sTextoSql := sTextoSql + ' AND EV.PERCATS IS NOT NULL '+
                                  ' AND EV.DATAINICIO = (SELECT MAX(DATAINICIO)  '+
                                  '    FROM evolfuncprev '+
                                  '    WHERE IDPESSJUR = EV.IDPESSJUR AND '+
                                  '    IDPESSOA = EV.IDPESSOA AND '+
                                  '    NVL(PERCATS,0) > 0  AND '+
                                  '    FLGSITPART <> ''AS'' ) '; 
         qryDadosNoBanco.SQL.Text := sTextoSql;
         qryDadosNoBanco.Open;


         bEncontrou := False;
         bDiferente := false;
         qryDadosNoBanco.first;
         while not qryDadosNoBanco.eof do
         begin

            //linha de cargo encontrada
            if strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCATS').AsString)) > 0 then
            begin
               bEncontrou := True;



               if strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCATS').AsString)) =
                  strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString)) then
               begin  //se achou o mesmo percentualverificar se há atualização de data fim
                  if qrytxt.fieldbyname('DTFIMCARGO').AsString <>
                     qryDadosNoBanco.FieldByName('DATAFINAL').AsString   then
                  begin
                     if batuatsef then
                     begin

                        if not AtualizaDataFinal(qryupdate, sidpessoa,
                                                 inttostr(iPatro),
                                                 qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                                 qrytxt.fieldbyname('DTFIMCARGO').AsString,
                                                 qrytxt.FieldByName('DTFIMFORMATO').AsString, false) then
                        memoErros.Lines.Add('Erro ao alterar a data final do adiconal por tempo de serviço.');


                        pProcessoAux := pAceito ;
                     end
                     else begin
                        pProcessoAux := pNProcessado ;
                     end;

                     TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qrytxt.FieldByName('MATRICULA').AsString ,
                                            qryDadosNoBanco.FieldByName('PERCATS').AsString,
                                            oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                            cChave, ceEfDtFimAtsAlterado , tdNumerico,'',
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','',sFlgIntSitPart,'' );

                  end;//if dtfimcargo

                  If qrytxt.fieldbyname('DTINICARGO').AsString <> qryDadosNoBanco.FieldByName('DATAINICIO').AsString
                  Then Begin
                     If batucargoef
                     Then Begin

                        If Not AtualizaDataInicial(qryUpdate, sidpessoa,
                                                   inttostr(iPatro),
                                                   qryDadosNoBanco.FieldByName('SEQHISTFUNC').AsString,
                                                   qryTxt.FieldByName('DTINICARGO').AsString,
                                                   qryTxt.FieldByName('DTINIFORMATO').AsString, False,
                                                   qryTxt.FieldByName('MODO').AsString) 
                        Then memoErros.Lines.Add('Erro ao alterar a data inicial do adicional por tempo de serviço.');

                        pProcessoAux := pAceito ;
                     End
                     Else Begin
                        pProcessoAux := pNProcessado ;
                     End;

                     TabCriticasCcp.Insere( qryAux, iPatro, StrToInt(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qryTxt.FieldByName('MATRICULA').AsString ,
                                            qryTxt.FieldByName('DTINICARGO').AsString,
                                            qryDadosNobanco.fieldbyname('DATAINICIO').AsString,
                                            cChave, ceEfDtIniCargoAlterado , tdCaracter,
                                            qrytxt.FieldByName('DTINIFORMATO').AsString,
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','' ,sFlgIntSitPart,'');

                  end; // If qrytxt.fieldbyname('DTINICARGO').AsString

               end
               else if floattostr(strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERCATS').AsString ))) <>
                       floattostr(strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString))) then
               begin

                  bDiferente := true;

                  if batuatsef then
                  begin
                     //o Pecentual de adicional por tempo de serviço atual é diferente do banco
                     //inserir atual e atualizar data final do anterior
                     if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                                  inttostr(iPatro),
                                  'NULL',
                                  'NULL', 'NULL',
                                  'NULL', oranumero(qrytxt.fieldbyname('PCADIC').AsString),
                                  'NULL','NULL',
                                  'NULL',
                                  qrytxt.fieldbyname('MODO').AsString,
                                  qrytxt.fieldbyname('DTINICARGO').AsString, '',
                                  'NULL' , 'NULL', 'NULL',
                                  qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
                     then  memoErros.Lines.Add('Erro ao inserir o Adicional por tempo de serviço.');

                     if not AtualizaDataFinal(qryupdate, sidpessoa,
                                              inttostr(iPatro),
                                              qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                              qrytxt.fieldbyname('DTINICARGO').AsString,
                                              qrytxt.FieldByName('DTINIFORMATO').AsString, True)
                     then  memoErros.Lines.Add('Erro ao alterar o percentual de adicional por tempo de serviço anterior.');


                     pProcessoAux := pAceito ;
                  end
                  else begin
                     pProcessoAux := pNProcessado ;
                  end;

                  TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                         dSeqCritica, sMesCobranca,
                                         qrytxt.FieldByName('MATRICULA').AsString ,
                                         qryDadosNoBanco.FieldByName('PERCATS').AsString,
                                         oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                         cChave, ceEfPercAtsAlterado , tdNumerico,'',
                                         gEvolFunc, pProcessoAux, '',
                                         qryDadosNoBanco.FieldByName('SEQHISTFUNC').AsString,'','','','',sFlgIntSitPart,'' );
               end;
            end;

            if bencontrou then break;

            qryDadosNoBanco.next;
         end;

         //não tem o cargo em questão cadastrado
         //inserir
         if (not bEncontrou) then
         begin

            //a informação está vindo no arquivo, porém já está finalizada.
            //Como a qrydadosbanco não traz registros já finalizados, este deve ser rejeitado
            if qrytxt.fieldbyname('DTFIMCARGO').AsString <> '' then
            begin
               qrytxt.next;
               continue;
            end;

            if batuatsef then
            begin

               //o Pecentual de adicional por tempo de serviço atual é diferente do banco
               //inserir atual e atualizar data final do anterior
               if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                            inttostr(iPatro),
                            'NULL',
                            'NULL', 'NULL',
                            'NULL', oranumero(qrytxt.fieldbyname('PCADIC').AsString),
                            'NULL','NULL',
                            'NULL',
                            qrytxt.fieldbyname('MODO').AsString,
                            qrytxt.fieldbyname('DTINICARGO').AsString, '',
                            'NULL' , 'NULL', 'NULL',
                            qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
               then  memoErros.Lines.Add('Erro ao inserir o Adicional por tempo de serviço.');

               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                   dSeqCritica, sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   sSeqHistFunc,
                                   oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                   cChave, ceEfAtsInserido , tdNumerico,'',
                                   gEvolFunc, pProcessoAux, '',
                                   qrytxt.fieldbyname('MODO').AsString,
                                   qrytxt.fieldbyname('DTINICARGO').AsString,
                                   qrytxt.fieldbyname('DTFIMCARGO').AsString,'','',sFlgIntSitPart ,'');
         end;

      end
      else if (qrytxt.fieldbyname('TIPOREG').AsString = 'AC') and
              (strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString)) > 0) then
      begin



         sTextoSql := sTextoSql + ' AND EV.PERC1AC IS NOT NULL '+
                                  ' AND EV.DATAINICIO = (SELECT MAX(DATAINICIO)  '+
                                  '    FROM evolfuncprev '+
                                  '    WHERE IDPESSJUR = EV.IDPESSJUR AND '+
                                  '    IDPESSOA = EV.IDPESSOA AND '+
                                  '    NVL(PERC1AC,0) > 0  AND '+
                                  '    FLGSITPART <> ''AS''  )';
         qryDadosNoBanco.SQL.Text := sTextoSql;
         qryDadosNoBanco.Open;

         bEncontrou := False;
         bDiferente := false;
         qryDadosNoBanco.first;
         while not qryDadosNoBanco.eof do
         begin


            //linha de cargo encontrada
            if strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERC1AC').AsString)) > 0 then
            begin
               bEncontrou := True;



               if strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERC1AC').AsString)) =
                  strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString)) then
               begin  //se achou o mesmo percentualverificar se há atualização de data fim
                  if qrytxt.fieldbyname('DTFIMCARGO').AsString <>
                     qryDadosNoBanco.FieldByName('DATAFINAL').AsString  then
                  begin
                     if batuAcef then
                     begin

                        if not AtualizaDataFinal(qryupdate, sidpessoa,
                                                 inttostr(iPatro),
                                                 qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                                 qrytxt.fieldbyname('DTFIMCARGO').AsString,
                                                 qrytxt.FieldByName('DTFIMFORMATO').AsString,false) then
                        memoErros.Lines.Add('Erro ao alterar a data final do adiconal compensatório.');


                        if (trim(qrytxt.fieldbyname('DTFIMCARGO').AsString) = '') and
                           (trim(qryDadosNoBanco.FieldByName('DATAFINAL').AsString) = '') then
                        begin
                           qryUpdate.Close;
                           qryUpdate.SQL.Clear;
                           qryUpdate.SQL.Add(' UPDATE evolfuncprev SET DATAFINAL = NULL '+
                                          ' WHERE  IDFUNCAO   = '''+sIdCargoExt+''' '+
                                          ' AND    IDPESSOA  =  '''+qryDadosNoBanco.FieldByName('IDPESSOA').AsString+'''  '+
                                          ' AND    IDPESSJUR =  '''+qryDadosNoBanco.FieldByName('IDPESSJUR').AsString+''' '+
                                          ' AND    TO_CHAR(DATAFINAL,''DD/MM/YYYY'') = '''+trim(qryDadosNoBanco.FieldByName('DATAFINAL').AsString)+''' ');

                           try qryUpdate.ExecSQL except end;
                        end;

                        pProcessoAux := pAceito ;
                     end
                     else begin
                        pProcessoAux := pNProcessado ;
                     end;


                     TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qrytxt.FieldByName('MATRICULA').AsString ,
                                            '',
                                            qryTxt.FieldByName('DTFIMCARGO').AsString,
                                            cChave, ceEfDtFimACAlterado , tdCaracter,
                                            qrytxt.FieldByName('DTFIMFORMATO').AsString,
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','',sFlgIntSitPart ,'');


                  end;//if dtfimcargo

                  If qrytxt.fieldbyname('DTINICARGO').AsString <> qryDadosNoBanco.FieldByName('DATAINICIO').AsString
                  Then Begin
                     If batucargoef
                     Then Begin

                        If Not AtualizaDataInicial(qryUpdate, sidpessoa,
                                                   inttostr(iPatro),
                                                   qryDadosNoBanco.FieldByName('SEQHISTFUNC').AsString,
                                                   qryTxt.FieldByName('DTINICARGO').AsString,
                                                   qryTxt.FieldByName('DTINIFORMATO').AsString, False,
                                                   qryTxt.FieldByName('MODO').AsString) 
                        Then memoErros.Lines.Add('Erro ao alterar a data inicial do adicional compensatório.');

                        pProcessoAux := pAceito ;
                     End
                     Else Begin
                        pProcessoAux := pNProcessado ;
                     End;

                     TabCriticasCcp.Insere( qryAux, iPatro, StrToInt(sidpessoa),
                                            dSeqCritica, sMesCobranca,
                                            qryTxt.FieldByName('MATRICULA').AsString ,
                                            qryTxt.FieldByName('DTINICARGO').AsString,
                                            qryDadosNobanco.fieldbyname('DATAINICIO').AsString,
                                            cChave, ceEfDtIniCargoAlterado , tdCaracter,
                                            qrytxt.FieldByName('DTINIFORMATO').AsString,
                                            gEvolFunc, pProcessoAux, '',
                                            qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','' ,sFlgIntSitPart,'');

                  end; // If qrytxt.fieldbyname('DTINICARGO').AsString

               end
               else if floattostr(strtofloat(clientenumero(qryDadosNoBanco.fieldbyname('PERC1AC').AsString))) <>
                       floattostr(strtofloat(clientenumero(qrytxt.fieldbyname('PCADIC').AsString))) then
               begin

                  bDiferente := true;

                  if batuAcef then
                  begin

                     if not AtualizaDataFinal(qryupdate, sidpessoa,
                                             inttostr(iPatro),
                                             qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,
                                             qrytxt.fieldbyname('DTINICARGO').AsString,
                                             qrytxt.FieldByName('DTINIFORMATO').AsString, True)
                     then  memoErros.Lines.Add('Erro ao alterar o percentual de adicional compensatório anterior.');


                     pProcessoAux := pAceito ;
                  end
                  else begin
                     pProcessoAux := pNProcessado ;
                  end;


                  //o Pecentual de adicional por tempo de serviço atual é diferente do banco
                  //inserir atual e atualizar data final do anterior
                  if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                               inttostr(iPatro),
                               'NULL',
                               sIdCargoExt,
                               oranumero(qrytxt.fieldbyname('PCADIC').AsString),
                               'NULL', 'NULL',
                               'NULL','NULL',
                               'NULL',
                               qrytxt.fieldbyname('MODO').AsString,
                               qrytxt.fieldbyname('DTINICARGO').AsString, '',
                               'NULL' , 'NULL', 'NULL',
                               qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
                  then  memoErros.Lines.Add('Erro ao inserir o Adicional compensatório.');


                  TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                         dSeqCritica, sMesCobranca,
                                         qrytxt.FieldByName('MATRICULA').AsString ,
                                         qryDadosNoBanco.FieldByName('PERC1AC').AsString,
                                         oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                         cChave, ceEfPercACAlterado , tdCaracter,'',
                                         gEvolFunc, pProcessoAux, '',
                                         qrydadosnobanco.fieldbyname('SEQHISTFUNC').AsString,'','','','',sFlgIntSitPart ,'');
               end;
            end;

            if bencontrou then break;

            qryDadosNoBanco.next;
         end;

         //não tem o cargo em questão cadastrado
         //inserir
         if (not bEncontrou) then
         begin

            //a informação está vindo no arquivo, porém já está finalizada.
            //Como a qrydadosbanco não traz registros já finalizados, este deve ser rejeitado
            if qrytxt.fieldbyname('DTFIMCARGO').AsString <> '' then
            begin
               qrytxt.next;
               continue;
            end;

            if batuAcef then
            begin

               //o Pecentual de adicional por tempo de serviço atual é diferente do banco
               //inserir atual e atualizar data final do anterior
               if not Insereevolfuncprev(qryaux, qryupdate, sidpessoa,
                            inttostr(iPatro),
                            'NULL',
                            sIdCargoExt,
                            oranumero(qrytxt.fieldbyname('PCADIC').AsString),
                            'NULL', 'NULL',
                            'NULL','NULL',
                            'NULL',
                            qrytxt.fieldbyname('MODO').AsString,
                            qrytxt.fieldbyname('DTINICARGO').AsString, '',
                            'NULL' , 'NULL', 'NULL',
                            qrytxt.fieldbyname('DTINIFORMATO').AsString, sSeqHistFunc )
               then  memoErros.Lines.Add('Erro ao inserir o Adicional compensatório.');

               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;

            TabCriticasCcp.Insere( qryaux, iPatro, strtoint(sidpessoa),
                                   dSeqCritica, sMesCobranca,
                                   qrytxt.FieldByName('MATRICULA').AsString ,
                                   sSeqHistFunc,
                                   oranumero(qryTxt.FieldByName('PCADIC').AsString),
                                   cChave, ceEfACInserido , tdCaracter,'',
                                   gEvolFunc, pProcessoAux, '',
                                   qrytxt.fieldbyname('MODO').AsString,
                                   qrytxt.fieldbyname('DTINICARGO').AsString,
                                   qrytxt.fieldbyname('DTFIMCARGO').AsString,'','',sFlgIntSitPart ,'');
         end;

      end
      else
      begin
         //mensagem de erro
         memoErros.Lines.Add('EV - Mat:'+qrytxt.FieldByName('MATRICULA').AsString+' - Tipo de registro inválido: '+qrytxt.fieldbyname('TIPOREG').AsString+'');
      end;

      qrytxt.next;
   end; // while


   dtmBaseDados.dbBaseDados.Commit;

end;
//fim importa evolução funcional


//mportação dos dependentes de cada titular
procedure TfrmImportaDadosCadastrais.ImportaDependentes;
Var
   sSqlUpdate, sDataNascTxt, sDataNascCad, sSqlAux,
   sDataInidpdTxt , sDataInidpdCad , sIdPessoaDepen, sIdPessoa : string;
   iPessoa, iPessoaFisica : integer;

   sMatDepAux, sCtrDepen, sTipoSit : String;


   bEncontrou : Boolean;

   sFlgIntSitPart : String;

Begin


   If dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.Commit;
   StartTransacao;

   pbStatus.Min := 0;
   pbStatus.Max := qryTxt.RecordCount;


   sSqlUpDate := ' UPDATE DEPENTIT DP SET  DP.FLGDEPLEGAL = 0 '+
                 ' WHERE DP.FLGDEPLEGAL = 1 AND '+
                 ' NOT EXISTS ( SELECT 1 FROM HSTBENEFBFCIARIO HST '+
                 '               WHERE  HST.MES           = '''+sMesCobranca+''' '+
                 '               AND    HST.MESREFERENCIA = '''+sMesCobranca+''' '+
                 '               AND    HST.IDPESSJUR     = '+IntToStr(iPatro)+' '+
                 '               AND    HST.IDTITULAR     = DP.IDTITULAR)  ';
   QryUpDate.SQL.Text := sSqlUpdate;
   QryUpdate.ExecSQL;

   sMatDepAux := '';
   sCtrDepen := '';
   sIdPessoa := '';



   // balance line  -  dados importados com os já existentes
   while ( not qryTxt.EOF )  do begin
      pbStatus.Position := qryTxt.RecNo;
      frmImportaDadosCadastrais.update;

      sIdPessoaDepen :='';


      if sMatDepAux <> qryTxt.FieldByName('MATRICULA').AsString then
      begin
         sMatDepAux := qryTxt.FieldByName('MATRICULA').AsString;

         if trim(qrytxt.fieldbyname('IDPESSOA').AsString) = '' then
         begin
            //caso haja alguima inserção anteriormente feita no arquivo de empregados
            qryaux.close;
            qryaux.sql.text := ' SELECT EL.IDPESSJUR, EL.IDPESSOA , NVL(PP.IDPLANOPREV,0) IDPLANOPREV , SIT.FLGINTERNO, SIT.DESCRICAO ,  PP.INSCRICAODATA, '+
                               ' SIT.IDSITPART , EL.IDSITFUNC, PP.IDSITPLANOPREV '+
                               ' FROM PARTPREVPLAN PP, ELEGPATRO EL, SITPART SIT  '+
                               ' WHERE EL.IDPESSJUR = EL.IDPESSJUR  '+
                               ' AND EL.MATRICULA LIKE  '''+qryTxt.FieldByName('MATRICULA').AsString+'%'' '+
                               ' AND EL.IDPESSOA = EL.IDPESSOA  '+
                               ' AND PP.IDPESSJUR(+) = EL.IDPESSJUR '+
                               ' AND PP.IDPESSOA(+) = EL.IDPESSOA   '+
                               ' AND SIT.IDSITPART(+) = PP.IDSITPART '+
                               ' ORDER BY PP.INSCRICAODATA DESC  ';
            qryaux.open;

            if qryaux.isempty then
            begin
               qrytxt.next;
               continue;
            end;

            sIdPessoa := qryaux.fieldbyname('IDPESSOA').AsString;

         end
         else sIdPessoa := trim(qrytxt.fieldbyname('IDPESSOA').AsString);

         cChave := cMatricula;



         QryDependentes.Close;
         QryDependentes.SQL.Text := ' SELECT /*+RULE*/ DISTINCT  EL.MATRICULA AS MATRICINTEIRA, SUBSTR(EL.MATRICULA,1,'+OraNumero(qryLayOutArquivo.FieldByName('DPMATRICULATAM').AsString)+' ) AS MATRICULA, ' +
                        '       TO_CHAR(DP.DATACADASTRO, '''+ ConvFormatoOracle(qryLayOutArquivo.FieldByName('DPDTDPDFORMATO').AsString) + ''') AS DATACADASTRO , ' +
                        '       TO_CHAR(DP.TRGDTINCLUSAO, '''+ ConvFormatoOracle(qryLayOutArquivo.FieldByName('DPDTDPDFORMATO').AsString) + ''') AS TRGDTINCLUSAO  , ' +
                        '       TO_CHAR(PF.DATANASC, ''' + ConvFormatoOracle(qryLayOutArquivo.FieldByName('DPDTNASCDPDFORMAT').AsString) + ''') AS DATANASC,  '+
                        '       PE.NOME,  PF.SEXO,  PF.ESTCIVIL, PE.FLGINVALIDO,  ' +
                        '       PF.NUMDEPIRRF, PE.NUMDOCUMENTO, EL.IDCARGOEXT, '+
                        '       DP.IDPESSOA , DP.IDTITULAR, DP.IDDEPENDENCIA, NVL(DP.NUMSEQUENCIA,0) AS NUMSEQUENCIA, '+
                        '       DP.FLGCONTAIMPOSTOR , DP.FLGCONTASALARIOF  '+
                        'FROM PESSOA PE, PESSOAFISICA PF, ' +
                        '     ELEGPATRO EL, DEPENTIT DP  '+
                        'WHERE EL.IDPESSJUR = ' + IntToStr(iPatro) + ' '+
                        'AND   EL.IDPESSOA = '''+sIdPessoa+''' '+
                        'AND   EL.IDPESSOA = DP.IDTITULAR(+) '+
                        'AND   DP.IDPESSOA  = PE.IDPESSOA(+)  '+
                        'AND   DP.IDPESSOA  = PF.IDPESSOA(+)  '+
                        'AND   DP.IDPESSOA <> DP.IDTITULAR    '+
                        'ORDER BY  EL.MATRICULA, NVL(DP.NUMSEQUENCIA,0) ';
         QryDependentes.Open;



         //atualiza a data de cancelamento de todas para que auqelas que não venham no arquivo fiquem canceladas
         sSqlUpDate := 'UpDate depentit set DATACANCELA = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY'') ';
         sSqlUpdate := sSqlUpDate + ' where idtitular = '+sIdPessoa;
         QryUpDate.SQL.Text := sSqlUpdate;
         QryUpdate.ExecSQL;

      end; //caso seja outra matrícula

      
      sFlgIntSitPart := VoltaFlgInterno(qryAux, IntToStr(iPatro), sIdPessoa, sTipoSit);


      if ((sFlgIntSitPart = 'CA') and (chkCancelados.Checked)) OR
         ((sFlgIntSitPart = 'MA') and (chkMantidos.Checked))   OR
         ((sFlgIntSitPart = 'AS') and (chkAssistidos.Checked))
      then begin
         if sFlgIntSitPart = 'CA'
         then TabCriticasCcp.Insere(qryaux,iPatro,
                               QryDependentes.FieldByName('IDPESSOA').AsInteger,
                               dSeqCritica,
                               sMesCobranca,
                               qryTxt.FieldByName('MATRICULA').AsString ,
                               sFlgIntSitPart,
                               '',
                               cChave,
                               cePartCancelado,
                               tdCaracter,'',
                               gEndereco,
                               pNProcessado,'', '','','','','',sFlgIntSitPart,'')
         else if sFlgIntSitPart = 'MA'
              then TabCriticasCcp.Insere(qryaux,iPatro,
                                    QryDependentes.FieldByName('IDPESSOA').AsInteger,
                                    dSeqCritica,
                                    sMesCobranca,
                                    qryTxt.FieldByName('MATRICULA').AsString ,
                                    sFlgIntSitPart,
                                    '',
                                    cChave,
                                    cePartMantido,
                                    tdCaracter,'',
                                    gEndereco,
                                    pNProcessado,'', '','','','','',sFlgIntSitPart,'')
              else TabCriticasCcp.Insere(qryaux,iPatro,
                                    QryDependentes.FieldByName('IDPESSOA').AsInteger,
                                    dSeqCritica,
                                    sMesCobranca,
                                    qryTxt.FieldByName('MATRICULA').AsString ,
                                    sFlgIntSitPart,
                                    '',
                                    cChave,
                                    cePartAssistido,
                                    tdCaracter,'',
                                    gEndereco,
                                    pNProcessado,'', '','','','','',sFlgIntSitPart,'');

         qrytxt.next;
         continue;
      end; // if sFlgIntSitPart


      bEncontrou := false;

      {Para posicinar no registro da qrydependentes}

      //procura por nome e tipo de dependência
      bEncontrou := QryDependentes.Locate('NOME',trim(QryTxt.FieldByName('NOME').AsString),[loCaseInsensitive, loPartialKey]);

      //procura pelo sequencial
      if not bEncontrou then   bEncontrou := QryDependentes.Locate('NUMSEQUENCIA',QryTxt.FieldByName('SEQDEP').AsInteger,[loCaseInsensitive, loPartialKey]);


      if bEncontrou  then
      begin

          sSqlUpDate := 'UpDate depentit set FLGDEPLEGAL = 1, NUMSEQUENCIA = '+QryTxt.FieldByName('SEQDEP').AsString+', DATACANCELA = NULL ';
          sSqlUpdate := sSqlUpDate + ' where idpessoa = '+inttostr(QryDependentes.FieldByName('idpessoa').AsInteger);
          sSqlUpdate := sSqlUpDate + ' and idtitular = '+inttostr(QryDependentes.FieldByName('idtitular').AsInteger);
          QryUpDate.SQL.Text := sSqlUpdate;
          QryUpdate.ExecSQL;

          if trim(sCtrDepen) = '' then    sCtrDepen := QryDependentes.FieldByName('idpessoa').AsString
          else sCtrDepen := sCtrDepen +' , '+ QryDependentes.FieldByName('idpessoa').AsString;


          sSqlUpDate := '';

          //-------------DADOS ATUALIZADOS NA PESSOA-------------------------//
          // Testa se o status de invalidez
          if (QryTxt.FieldByName('FLGINVALID').AsString <>
              QryDependentes.FieldByName('FLGINVALIDO').AsString) and
              (QryTxt.FieldByName('FLGINVALID').AsString <> '')                  then
          begin


             if batuindinvalidezdep then
             begin
                 sSqlUpDate := ' flginvalido  = '''+QryTxt.FieldByName('FLGINVALID').AsString+''' ';
                 pProcessoAux := pAceito ;
             end
             else
             begin
                 pProcessoAux := pNProcessado ;
             end;

             TabCriticasCcp.Insere(qryaux,iPatro,
                                   QryDependentes.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   QryDependentes.FieldByName('MATRICULA').AsString+
                                   qrytxt.FieldByName('SEQDEP').AsString ,
                                   QryDependentes.FieldByName('FLGINVALIDO').AsString,
                                   QryTxt.FieldByName('FLGINVALID').AsString,
                                   cChave,ceIndInvalidezAlterado , tdCaracter,'',
                                   gDependentes, pProcessoAux, '', '','','','','' ,sFlgIntSitPart,'');

          end;  //fim flginvalido


          // Testa se o nome do participante alterou
          if (trim(QryTxt.FieldByName('NOME').AsString) <>
              trim(QryDependentes.FieldByName('NOME').AsString)) and
              (QryTxt.FieldByName('NOME').AsString <> '')                  then
          begin
             if batunomedep then
             begin
                 if sSqlUpDate <> '' then
                    sSqlUpDate :=  sSqlUpdate+ ' , nome = '+Trim(quotedstr((QryTxt.FieldByName('NOME').AsString)))
                 else
                    sSqlUpDate :=  '  nome = '+Trim(quotedstr(QryTxt.FieldByName('NOME').AsString));

                 sSqlUpDate :=  sSqlUpdate + ', razaosocial = '+Trim(quotedstr(QryTxt.FieldByName('NOME').AsString)); 

                 pProcessoAux := pAceito ;
             end
             else
             begin
                 pProcessoAux := pNProcessado ;
             end;

             TabCriticasCcp.Insere(qryaux,iPatro,
                                   QryDependentes.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   QryDependentes.FieldByName('MATRICULA').AsString+
                                   qrytxt.FieldByName('SEQDEP').AsString  ,
                                   QryDependentes.FieldByName('NOME').AsString,
                                   QryTxt.FieldByName('NOME').AsString,
                                   cChave, ceNomeAlterado, tdCaracter,'',
                                   gDependentes ,pProcessoAux, '', '','','','','' ,sFlgIntSitPart,'');
          end; // fim nome dpd

          if sSqlUpdate <> '' then
          begin
          sSqlUpDate := 'UpDate Pessoa set '+ sSqlUpdate;
          sSqlUpDate := sSqlUpDate + ' where idpessoa = '+inttostr(QryDependentes.FieldByName('idpessoa').AsInteger);
          QryUpDate.SQL.Text := sSqlUpdate;

          try QryUpdate.ExecSQL; except end;

          end;





          sSqlUpDate := '';
          //-------------DADOS ATUALIZADOS NA PESSOAFISICA-------------------//
          // Testa se o nascimento alterou
          sDataNascTxt := qryTxt.FieldByName('DATANASC').AsString;
          sDataNascCad := QryDependentes.FieldByName('DATANASC').AsString;
          ///
          if (sDataNascTxt <> sDataNascCad)  and
             (QryTxt.FieldByName('DATANASC').AsString <> '')                  then
          begin
             if batudatanascdep then
             begin
                 sSqlUpDate := ' datanasc = to_date(''';
                 sSqlUpDate := sSqlUpDate + sDataNascTxt +''',';
                 sSqlUpDate := sSqlUpDate + ''''+qryLayOutArquivo.FieldByName('DPDTNASCDPDFORMAT').AsString+''')';
                 pProcessoAux := pAceito ;
             end
             else
             begin
                 pProcessoAux := pNProcessado ;
             end;

             TabCriticasCcp.Insere(qryaux,iPatro,
                                   QryDependentes.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   QryDependentes.FieldByName('MATRICULA').AsString+
                                   qrytxt.FieldByName('SEQDEP').AsString ,
                                   sDataNascCad,
                                   sDataNascTxt,
                                   cChave, ceDataNascAlterada, tdData,
                                   qryLayOutArquivo.FieldByName('DPDTNASCDPDFORMAT').AsString,
                                   gDependentes, pProcessoAux, '', '','','','','',sFlgIntSitPart,'' );
          end;  // fim datanasc dpd

          // Testa se o sexo alterou
          if (QryTxt.FieldByName('SEXO').AsString <>
              QryDependentes.FieldByName('SEXO').AsString)  and
              (QryTxt.FieldByName('SEXO').AsString <> '')                  then
          begin


             if batusexodep then
             begin
                 if ssqlUpdate = '' then
                    sSqlUpDate := ' sexo = '''+QryTxt.FieldByName('SEXO').AsString+''' '
                 else
                    sSqlUpDate := sSqlUpdate+' ,sexo = '''+QryTxt.FieldByName('SEXO').AsString+''' ';
                 pProcessoAux := pAceito ;
             end
             else
             begin
                 pProcessoAux := pNProcessado ;
             end;

             TabCriticasCcp.Insere(qryaux,iPatro,
                                   QryDependentes.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   QryDependentes.FieldByName('MATRICULA').AsString+
                                   qrytxt.FieldByName('SEQDEP').AsString ,
                                   QryDependentes.FieldByName('SEXO').AsString,
                                   QryTxt.FieldByName('SEXO').AsString,
                                   cChave, ceSexoAlterado, tdCaracter,'',
                                   gDependentes, pProcessoAux, '', '','','','','',sFlgIntSitPart,'');
          end; //fim sexo

          // Testa se o estad civil alterou
          if (QryTxt.FieldByName('ESTCIVIL').AsString <>
              QryDependentes.FieldByName('ESTCIVIL').AsString) and
              (QryTxt.FieldByName('ESTCIVIL').AsString <> '')                  then
          begin


             if batuestcivildep then
             begin
                 if ssqlUpdate = '' then
                    sSqlUpDate := ' estcivil = '''+QryTxt.FieldByName('ESTCIVIL').AsString+''''
                 else
                    sSqlUpDate := sSqlUpdate+' ,estcivil = '''+QryTxt.FieldByName('ESTCIVIL').AsString+'''';
                 pProcessoAux := pAceito ;
             end
             else
             begin
                 pProcessoAux := pNProcessado ;
             end;

             TabCriticasCcp.Insere(qryaux,iPatro,
                                   QryDependentes.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   QryDependentes.FieldByName('MATRICULA').AsString+
                                   qrytxt.FieldByName('SEQDEP').AsString ,
                                   QryDependentes.FieldByName('ESTCIVIL').AsString,
                                   QryTxt.FieldByName('ESTCIVIL').AsString,
                                   cChave,ceEstCivilAlterado , tdCaracter,'',
                                   gDependentes, pProcessoAux, '', '','','','','',sFlgIntSitPart ,'');
          end; //fim estado civil


          if (sSqlUpdate <> '') then
          begin
             sSqlUpDate := 'UpDate PessoaFisica set '+sSqlUpdate;
             sSqlUpdate := sSqlUpDate + ' where idpessoa = '+inttostr(QryDependentes.FieldByName('idpessoa').AsInteger);
             QryUpDate.SQL.Text := sSqlUpdate;

             try QryUpdate.ExecSQL; except end;

             //inserir pesoafisica
             if QryUpdate.rowsaffected <= 0 then
             begin

                sSqlUpDate := ' INSERT INTO PESSOAFISICA (IDPESSOA, DATANASC, SEXO, ESTCIVIL) '+
                              ' VALUES ('+inttostr(QryDependentes.FieldByName('idpessoa').AsInteger)+','+
                              ' TO_DATE('''+qryTXT.FieldByName('DATANASC').AsString+''', '''+ConvFormatoOracle(qryLayOutArquivo.FieldByName('DPDTNASCDPDFORMAT').AsString)+'''), '+
                              ' '''+qryTXT.FieldByName('SEXO').AsString+''', ';

                if Trim(qryTXT.FieldByName('ESTCIVIL').AsString) = ''
                then sSqlUpDate := sSqlUpDate +' NULL '
                else sSqlUpDate := sSqlUpDate +''''+qryTXT.FieldByName('ESTCIVIL').AsString+'''';

                sSqlUpDate := sSqlUpDate +')';

                QryUpDate.SQL.Text := sSqlUpdate;


                try QryUpdate.ExecSQL; except end;
             end;
          end;


          sSqlUpDate := '';
          //-----------------//DADOS ATUALIZADOS NA DEPENTIT//---------------//
          // Testa se a data de admissao alterou
          sDataInidpdTxt := qrytxt.FieldByName('DATAINICIO').AsString;
          sDataIniDpdCad := QryDependentes.FieldByName('DATACADASTRO').AsString;

          if (sDataInidpdTxt <> '') and (sDataInidpdTxt <> '0') and (sDataInidpdTxt <> sDataIniDpdCad)
          then begin
             if batudatainiciodep
             then begin
                 sSqlUpDate := ' DATACADASTRO = TO_DATE('''+sDataIniDpdTxt +''','''+qryLayOutArquivo.FieldByName('DPDTDPDFORMATO').AsString+''')';
                 pProcessoAux := pAceito ;
             end
             else
             begin
                 pProcessoAux := pNProcessado ;
             end;

             TabCriticasCcp.Insere(qryaux,iPatro,
                                   QryDependentes.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   QryDependentes.FieldByName('MATRICULA').AsString+
                                   qrytxt.FieldByName('SEQDEP').AsString ,
                                   QryDependentes.FieldByName('DATACADASTRO').AsString,
                                   QryTxt.FieldByName('DATAINICIO').AsString,
                                   cChave, ceDtInicioDpdAlterada, tdData,
                                   qryLayOutArquivo.FieldByName('DPDTDPDFORMATO').AsString ,
                                   gDependentes, pProcessoAux, '', '','','','','',sFlgIntSitPart ,'');
          end; //fim datainicio dpd


          // Testa se o status de conta para o ir
          if (QryTxt.FieldByName('FLGCONTAIR').AsString <>
              QryDependentes.FieldByName('FLGCONTAIMPOSTOR').AsString)  and
              (QryTxt.FieldByName('FLGCONTAIR').AsString <> '')                  then
          begin


             if batuindirdep then
             begin

                 if sSqlUpdate = '' then
                    sSqlUpDate := ' flgcontaimpostor = '''+QryTxt.FieldByName('FLGCONTAIR').AsString+''' '
                 else
                    sSqlUpDate := sSqlUpdate+' ,flgcontaimpostor = '''+QryTxt.FieldByName('FLGCONTAIR').AsString+''' ';


                 pProcessoAux := pAceito ;
             end
             else
             begin
                 pProcessoAux := pNProcessado ;
             end;

             TabCriticasCcp.Insere(qryaux,iPatro,
                                   QryDependentes.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   QryDependentes.FieldByName('MATRICULA').AsString+
                                   qrytxt.FieldByName('SEQDEP').AsString ,
                                   QryDependentes.FieldByName('FLGCONTAIMPOSTOR').AsString,
                                   QryTxt.FieldByName('FLGCONTAIR').AsString,
                                   cChave,ceIndSalIrAlterado , tdCaracter,'',
                                   gDependentes, pProcessoAux, '', '','','','','',sFlgIntSitPart,'' );
          end; //fim flgir


          // Testa se o status de conta para salário família
          if (QryTxt.FieldByName('FLGCONTASF').AsString <>
              QryDependentes.FieldByName('FLGCONTASALARIOF').AsString) and
              (QryTxt.FieldByName('FLGCONTASF').AsString <> '')                  then
          begin


             if batuindsalfamdep then
             begin

                 if sSqlUpdate = '' then
                    sSqlUpDate := ' flgcontasalariof = '''+QryTxt.FieldByName('FLGCONTASF').AsString+''' '
                 else
                    sSqlUpDate := sSqlUpdate+' ,flgcontasalariof = '''+QryTxt.FieldByName('FLGCONTASF').AsString+''' ';
                 pProcessoAux := pAceito ;
             end
             else
             begin
                 pProcessoAux := pNProcessado ;
             end;

             TabCriticasCcp.Insere(qryaux,iPatro,
                                   QryDependentes.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   QryDependentes.FieldByName('MATRICULA').AsString+
                                   qrytxt.FieldByName('SEQDEP').AsString ,
                                   QryDependentes.FieldByName('FLGCONTASALARIOF').AsString,
                                   QryTxt.FieldByName('FLGCONTASF').AsString,
                                   cChave,ceIndSalFamAlterado , tdCaracter,'',
                                   gDependentes, pProcessoAux, '', '','','','','',sFlgIntSitPart ,'');
          end;  //fim flgcontasalfam


          // Testa se o grau de dependência
          if (QryTxt.FieldByName('TPRELDPD').AsString <>
              QryDependentes.FieldByName('IDDEPENDENCIA').AsString) and
              (QryTxt.FieldByName('TPRELDPD').AsString <> '')                  then
          begin


             if batugraudependdep then
             begin

                 if ssqlUpdate = '' then
                    sSqlUpDate := ' iddependencia = '''+QryTxt.FieldByName('TPRELDPD').AsString+''' '
                 else
                    sSqlUpDate := sSqlUpdate+' ,iddependencia = '''+QryTxt.FieldByName('TPRELDPD').AsString+''' ';
                 pProcessoAux := pAceito ;
             end
             else
             begin
                 pProcessoAux := pNProcessado ;
             end;

             TabCriticasCcp.Insere(qryaux,iPatro,
                                   QryDependentes.FieldByName('IDPESSOA').AsInteger,
                                   dSeqCritica,
                                   sMesCobranca,
                                   QryDependentes.FieldByName('MATRICULA').AsString+
                                   qrytxt.FieldByName('SEQDEP').AsString ,
                                   QryDependentes.FieldByName('IDDEPENDENCIA').AsString,
                                   QryTxt.FieldByName('TPRELDPD').AsString,
                                   cChave,ceGrauDepenAlterado , tdCaracter,'',
                                   gDependentes, pProcessoAux, '', '','','','','',sFlgIntSitPart ,'');
          end;  //fim flgcontasalfam

          if sSqlUpdate <> '' then
          begin
          sSqlUpDate := sSqlUpdate+' , FLGDEPLEGAL = 1 ';


          sSqlUpDate := 'UpDate depentit set '+sSqlUpdate;
          sSqlUpdate := sSqlUpDate + ' where idpessoa = '+inttostr(QryDependentes.FieldByName('idpessoa').AsInteger);
          sSqlUpdate := sSqlUpDate + ' and idtitular = '+inttostr(QryDependentes.FieldByName('idtitular').AsInteger);
          QryUpDate.SQL.Text := sSqlUpdate;

          try
             QryUpdate.ExecSQL;
          except
          end;

          end;

      end // se for a mesma sequencia
      else
      begin

         if binseredep then
         begin
            if not InsereDependente(qryupdate, trim(qrytxt.FieldByName('IDPESSOA').AsString),
                   qrytxt.FieldByName('MATRICULA').AsString,
                   qrytxt.FieldByName('NOME').AsString,
                   qrytxt.FieldByName('FLGINVALID').AsString,
                   qrytxt.FieldByName('DATANASC').AsString,
                   qrytxt.FieldByName('SEXO').AsString,
                   qrytxt.FieldByName('ESTCIVIL').AsString,
                   qrytxt.FieldByName('TPRELDPD').AsString,
                   qrytxt.FieldByName('SEQDEP').AsString,
                   qrytxt.FieldByName('FLGCONTAIR').AsString,
                   qrytxt.FieldByName('FLGCONTASF').AsString,
                   qrytxt.FieldByName('DATAINICIO').AsString,
                   sIdPessoaDepen)
            then   pProcessoAux := pNProcessado
            else  pProcessoAux := pAceito ;
         end
         else pProcessoAux := pNProcessado ;


         if trim(sCtrDepen) = '' then    sCtrDepen := sIdPessoaDepen
         else sCtrDepen := sCtrDepen +' , '+ sIdPessoaDepen;


         TabCriticasCcp.Insere(qryaux,iPatro,iPatro,
                               dSeqCritica,
                               sMesCobranca,
                               QryDependentes.FieldByName('MATRICULA').AsString+
                               qrytxt.FieldByName('SEQDEP').AsString ,
                               '',
                               qrytxt.FieldByName('NOME').AsString,
                               cChave,ceDependenteInserido , tdCaracter,'',
                               gDependentes, pProcessoAux
                               ,trim(QryDependentes.FieldByName('MATRICULA').AsString)+
                                trim(qrytxt.FieldByName('SEQDEP').AsString)
                               ,sIdPessoaDepen
                               ,qrytxt.FieldByName('FLGINVALID').AsString+
                               qrytxt.FieldByName('TPRELDPD').AsString+
                               qrytxt.FieldByName('FLGCONTAIR').AsString+
                               qrytxt.FieldByName('FLGCONTASF').AsString+
                               qrytxt.FieldByName('ESTCIVIL').AsString
                                   ,qrytxt.FieldByName('SEXO').AsString
                                   ,qrytxt.FieldByName('DATANASC').AsString
                                   ,qrytxt.FieldByName('DATAINICIO').AsString ,sFlgIntSitPart,'');


      end;

      QryTxt.Next;
   end; //while

   dtmBaseDados.dbBaseDados.Commit;


End;
//fim importa dependentes


function TfrmImportaDadosCadastrais.InsereDocumento : boolean;
var sSQL  : string;
    iIdPessoa, iIdEstado : longint;
begin
   Result := False;

   with qryUpdate do
   begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = '''+qryTXT.FieldByName('MATRICULA').AsString+'''');
      try
         Open;
      except
         Exit;
      end;

      if IsEmpty then Exit;

      iIdPessoa := FieldByName('IDPESSOA').AsInteger;
   end;

   with qryUpdate do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT IDESTADO FROM ESTADO WHERE CODESTADO = '''+QryTxt.FieldByName('UF').AsString+'''');
      Open;

      if IsEmpty
      then iIdEstado := -1
      else iIdEstado := FieldByName('IDESTADO').AsInteger;
   end;

   // Inserir PESSOA
   sSQL := ' INSERT INTO DOCPESSOA (IDDOCUMENTO, IDPESSOA, NUMDOCUMENTO, ORGAO,        '+
           '                        DATAEMISSAO,  DATAVALIDADE, IDESTADO )             '+
           ' VALUES ('+qryTxt.FieldByName('IDDOCUMENT').AsString+','+
                       IntToStr(iIdPessoa)+','+
                       ''''+qryTxt.FieldByName('NDOCUMENTO').AsString+'''';

   if Trim(qryTXT.FieldByName('ORGAO').AsString) <> ''
   then sSQL := sSQL + ','''+qryTxt.FieldByName('ORGAO').AsString+''''
   else sSQL := sSQL + ', NULL ';

   if Trim(qryTXT.FieldByName('DTEMISSAO').AsString) <> ''
   then sSQL := sSQL + ', TO_DATE('''+QryTxt.FieldByName('DTEMISSAO').AsString+''', '''+qryLayOutArquivo.FieldByName('DOFTEMISSAO').AsString+''') '
   else sSQL := sSQL + ', NULL ';

   if Trim(qryTXT.FieldByName('DTVALIDADE').AsString) <> ''
   then sSQL := sSQL + ', TO_DATE('''+QryTxt.FieldByName('DTVALIDADE').AsString+''', '''+qryLayOutArquivo.FieldByName('DOFTVALIDADE').AsString+''') '
   else sSQL := sSQL + ', NULL ';

   if iIdEstado > 0
   then sSQL := sSQL + ', '+IntToStr(iIdEstado)
   else sSQL := sSQL + ', NULL ';

   sSQL := sSQL + ') ';

   with qryUpdate do
   begin
      Close;
      SQL.Clear;
      SQL.Add(sSQL);
      try
         ExecSQL;
      except
         Exit;
      end;
   end;


   Result := True;
end; // InsereDocumento

procedure TfrmImportaDadosCadastrais.ImportaEndereco;   // concluido
var
   iIdEndereco,  iIdTelefone : longint;
   sSQLAlterados,
   sFlgIntSitPart, sAuxMatFilal, sIdPessoa, sTipoEnd, sCampoEnd, sTipoSit : string;

Begin

     If dtmBaseDados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.Commit;
     StartTransacao;

     pbStatus.Min := 0;
     pbStatus.Max := qryTxt.RecordCount;

     while (not qryTxt.EOF)  do
     begin
        pbStatus.position := qryTxt.RecNo ;
        frmImportaDadosCadastrais.Update;


        //importação de endereços de filiais
        if trim(qrytxt.fieldbyname('IDPLANO').AsString) = 'UOPER' then
        begin
           qryaux.close;
           qryaux.sql.text := '  SELECT IDFILIALPESSOA FROM FILIALPESSOA WHERE NUMFILIAL = '''+trim(qrytxt.fieldbyname('IDPESSOA').AsString)+''' ';
           qryaux.open;
           if qryaux.isempty then
           begin
              qrytxt.next;
              continue;
           end;

           cChave := cNumFilial;

           sAuxMatFilal :=  trim(qrytxt.fieldbyname('IDPESSOA').AsString);
           sIdPessoa := qryaux.fieldbyname('IDFILIALPESSOA').AsString;

           qryDadosNoBanco.Close;
           qryDadosNoBanco.SQL.Text := 'SELECT PE.IDPESSOA,  EP.IDENDERECO,  EP.LOGRADOURO, EP.BAIRRO, '+
                                       '       EP.NUMERO, C.NOME AS MUNICIPIO, EP.CEP, ES.CODESTADO AS UF, '+
                                       '       TEL.IDTELEFONE, TEL.NUMERO AS TELEFONE, TEL.DDD  '+
                                       'FROM   PESSOA          PE,     '+
                                       '       ENDPESS         EP,     '+
                                       '       TELENDPESS      TEL,    '+
                                       '       CIDADES         C,      '+
                                       '       ESTADO          ES      '+
                                       'WHERE  PE.IDPESSOA    =  '''+sIdPessoa+''' '+
                                       ' AND   EP.IDPESSOA         = PE.IDPESSOA           '+
                                       ' AND   EP.IDENDERECO       = PE.IDENDCOMERCIAL   '+
                                       ' AND   EP.IDENDERECO       = TEL.IDENDERECO(+)     '+
                                       ' AND   EP.IDCIDADES        = C.IDCIDADES(+)        '+
                                       ' AND   C.IDESTADO          = ES.IDESTADO(+)       '+

                         ' ORDER BY TELEFONE ';

           qryDadosNoBanco.Open;

        end
        else
        begin
           if trim(qrytxt.fieldbyname('IDPESSOA').AsString) = '' then
           begin
              //caso haja alguima inserção anteriormente feita no arquivo de empregados
              qryaux.close;
              qryaux.sql.text := ' SELECT EL.IDPESSJUR, EL.IDPESSOA , NVL(PP.IDPLANOPREV,0) IDPLANOPREV , SIT.FLGINTERNO, SIT.DESCRICAO ,  PP.INSCRICAODATA, '+
                                 ' SIT.IDSITPART , EL.IDSITFUNC, PP.IDSITPLANOPREV '+
                                 ' FROM PARTPREVPLAN PP, ELEGPATRO EL, SITPART SIT  '+
                                 ' WHERE EL.IDPESSJUR = EL.IDPESSJUR  '+
                                 ' AND EL.MATRICULA LIKE  '''+qryTxt.FieldByName('MATRICULA').AsString+'%'' '+
                                 ' AND EL.IDPESSOA = EL.IDPESSOA  '+
                                 ' AND PP.IDPESSJUR(+) = EL.IDPESSJUR '+
                                 ' AND PP.IDPESSOA(+) = EL.IDPESSOA   '+
                                 ' AND SIT.IDSITPART(+) = PP.IDSITPART '+
                                 ' ORDER BY PP.INSCRICAODATA DESC  ';
              qryaux.open;

              if qryaux.isempty then
              begin
                 qrytxt.next;
                 continue;
              end;

              sIdPessoa := qryaux.fieldbyname('IDPESSOA').AsString;

           end
           else sIdPessoa := trim(qrytxt.fieldbyname('IDPESSOA').AsString);

           cChave := cMatricula;
           sAuxMatFilal :=  trim(qrytxt.fieldbyname('MATRICULA').AsString);

           qryDadosNoBanco.Close;
           qryDadosNoBanco.SQL.Text := 'SELECT  PE.IDPESSOA, EP.IDENDERECO,  EP.LOGRADOURO, EP.BAIRRO, '+
                         '       EP.NUMERO, C.NOME AS MUNICIPIO, EP.CEP, ES.CODESTADO AS UF, '+
                         '       TEL.IDTELEFONE, TEL.NUMERO AS TELEFONE, TEL.DDD  '+
                         'FROM   PESSOA          PE,     '+
                         '       ENDPESS         EP,     '+
                         '       TELENDPESS      TEL,    '+
                         '       CIDADES         C,      '+
                         '       ESTADO          ES      '+
                         'WHERE  PE.IDPESSOA    =  '''+sIdPessoa+''' '+
                         ' AND   EP.IDPESSOA         = PE.IDPESSOA           '+
                         ' AND   EP.IDENDERECO       = PE.IDENDRESIDENCIAL   '+
                         ' AND   EP.IDENDERECO       = TEL.IDENDERECO(+)     '+
                         ' AND   EP.IDCIDADES        = C.IDCIDADES(+)        '+
                         ' AND   C.IDESTADO          = ES.IDESTADO(+)        '+

                         ' ORDER BY TELEFONE ';

           qryDadosNoBanco.Open;


           sFlgIntSitPart := VoltaFlgInterno(qryAux, IntToStr(iPatro), qryDadosNoBanco.FieldByName('IDPESSOA').AsString, sTipoSit);


           if ((sFlgIntSitPart = 'CA') and (chkCancelados.Checked)) OR
              ((sFlgIntSitPart = 'MA') and (chkMantidos.Checked))   OR
              ((sFlgIntSitPart = 'AS') and (chkAssistidos.Checked))
           then begin
              if sFlgIntSitPart = 'CA'
              then TabCriticasCcp.Insere(qryaux,iPatro,
                                    qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                    dSeqCritica,
                                    sMesCobranca,
                                    qryTxt.FieldByName('MATRICULA').AsString ,
                                    sFlgIntSitPart,
                                    '',
                                    cChave,
                                    cePartCancelado,
                                    tdCaracter,'',
                                    gEndereco,
                                    pNProcessado,'', '','','','','',sFlgIntSitPart,'')
              else if sFlgIntSitPart = 'MA'
                   then TabCriticasCcp.Insere(qryaux,iPatro,
                                         qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                         dSeqCritica,
                                         sMesCobranca,
                                         qryTxt.FieldByName('MATRICULA').AsString ,
                                         sFlgIntSitPart,
                                         '',
                                         cChave,
                                         cePartMantido,
                                         tdCaracter,'',
                                         gEndereco,
                                         pNProcessado,'', '','','','','',sFlgIntSitPart,'')
                   else TabCriticasCcp.Insere(qryaux,iPatro,
                                         qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                         dSeqCritica,
                                         sMesCobranca,
                                         qryTxt.FieldByName('MATRICULA').AsString ,
                                         sFlgIntSitPart,
                                         '',
                                         cChave,
                                         cePartAssistido,
                                         tdCaracter,'',
                                         gEndereco,
                                         pNProcessado,'', '','','','','',sFlgIntSitPart,'');

              qrytxt.next;
              continue;


           end; // if sFlgIntSitPart
        end;




        //inserir endereço
        if qryDadosNoBanco.isempty then
        begin

           if bInsereEnd
           then begin

              // Localizar codigo da cidade
              with qryAux do
              begin
                 Close;
                 SQL.Clear;
                 //TRATAR O CODESTADO DA TABELA ESTADO
                 //POIS O CODESTADO DA TABELA CIDADES NÃO É MAIS USADO.
                 SQL.Add(' SELECT C.IDCIDADES '+
                         ' FROM CIDADES C, ESTADO E '+
                         ' WHERE UPPER(LTRIM(RTRIM(C.NOME))) LIKE '+quotedstr(UpperCase(Trim(QryTxt.FieldByName('MUNICIPIO').AsString))+'%')+' '+
                         ' AND C.IDESTADO = E.IDESTADO '+
                         ' AND (C.CODESTADO = '''+QryTxt.FieldByName('UF').AsString+
                           ''' OR E.CODESTADO = '''+QryTxt.FieldByName('UF').AsString+''') ');
                 Open;
              end;

              if qryAux.IsEmpty
              then begin
                 pProcessoAux := pNProcessado ;
                 TabCriticasCcp.Insere( qryaux, iPatro, -1,
                                        dSeqCritica, sMesCobranca,
                                        sAuxMatFilal ,
                                        '',
                                        qryTxt.FieldByName('MUNICIPIO').AsString+' em '+QryTxt.FieldByName('UF').AsString,
                                        cChave, ceCidadeNaoEncontrada, tdCaracter,'', gEndereco, pProcessoAux,
                                        '', '','','','','',sFlgIntSitPart ,'');
              end
              else begin
                 if cChave = cMatricula then
                 begin
                    sTipoEnd := 'R';
                    sCampoEnd := 'IDENDRESIDENCIAL';
                 end
                 else
                 begin
                    sTipoEnd := 'C';
                    sCampoEnd := 'IDENDCOMERCIAL';
                 end;

                 iIdEndereco := LeUltRegistro(Nil,'ENDPESS ');
                 sSQLAlterados := ' INSERT INTO ENDPESS (IDPESSOA, IDENDERECO , LOGRADOURO, BAIRRO, CEP,  '+
                                  ' TIPOENDERECO, IDCIDADES, IDPAIS, CODESTADO, COMPLEMENTO, NOME, CIDADE ) ';
                 sSQLAlterados := sSQLAlterados + 'VALUES (' +sIdPessoa+', '+ IntToStr(iIdEndereco);
                 sSQLAlterados := sSQLAlterados + ', ' + QuotedStr(copy(QryTxt.FieldByName('LOGRADOURO').AsString,1, 60)) + '';
                 sSQLAlterados := sSQLAlterados + ', ' + QuotedStr(copy(QryTxt.FieldByName('BAIRRO').AsString,1, 20)) + '';
                 sSQLAlterados := sSQLAlterados + ', ' + QuotedStr(copy(QryTxt.FieldByName('CEP').AsString,1, 8)) + '';
                 sSQLAlterados := sSQLAlterados + ', '''+sTipoEnd+''', '+qryAux.FieldByName('IDCIDADES').AsString+' ';
                 sSQLAlterados := sSQLAlterados + ', 1 , '+QuotedStr(QryTxt.FieldByName('UF').AsString)+', NULL, ''RESIDENCIAL'' ';
                 sSQLAlterados := sSQLAlterados + ',  '+QuotedStr(copy(qryTxt.FieldByName('MUNICIPIO').AsString,1,20))+' ) ';


                 qryUpdate.Close;
                 qryUpdate.SQL.Clear;
                 qryUpdate.SQL.Add(sSQLAlterados);
                 try
                    qryUpdate.ExecSQL;
                 except
                    memoErros.Lines.Add(sAuxMatFilal+' - Erro ao inserir novo ENDEREÇO.');
                 end;
                 pProcessoAux := pAceito ;


                 // Atualiza a indicação do endereço residencial do participante
                 sSQLAlterados := ' UPDATE PESSOA SET '+sCampoEnd+' = '+IntToStr(iIdEndereco)+
                                  ' WHERE IDPESSOA = '+sIdPessoa+' ';
                 qryUpdate.Close;
                 qryUpdate.SQL.Clear;
                 qryUpdate.SQL.Add(sSQLAlterados);
                 try
                    qryUpdate.ExecSQL;
                 except
                    memoErros.Lines.Add(sAuxMatFilal+' - Erro ao atualizar código do novo ENDEREÇO.');
                 end;

                 pProcessoAux := pAceito ;
                 TabCriticasCcp.Insere( qryaux, iPatro, -1,
                                        dSeqCritica, sMesCobranca,
                                        sAuxMatFilal ,
                                        '',
                                        Trim(QryTxt.FieldByName('LOGRADOURO').AsString),
                                        cChave, ceEnderecoInserido, tdCaracter,'', gEndereco, pProcessoAux,
                                        '', sTipoEnd,
                                        Trim(QryTxt.FieldByName('BAIRRO').AsString),
                                        Trim(QryTxt.FieldByName('CEP').AsString),
                                        Trim(QryTxt.FieldByName('UF').AsString),
                                        Trim(QryTxt.FieldByName('MUNICIPIO').AsString),sFlgIntSitPart ,'');

                 //insere telefone
                 if binseretelefone
                 then begin

                    iIdTelefone := LeUltRegistro(Nil,'TELENDPESS ');

                    sSQLAlterados := ' INSERT INTO TELENDPESS(IDENDERECO , IDTELEFONE , NUMERO, TIPO, DDD ) '+
                                     ' VALUES ('+IntToStr(iIdEndereco)+','+
                                     IntToStr(iIdTelefone)                                          +','+
                                    ''''+qryTxt.FieldByName('TELEFONE').AsString                    +''', '+
                                    '''P'', '''+QryTxt.FieldByName('DDD').AsString+''') ';
                    qryUpdate.Close;
                    qryUpdate.SQL.Clear;
                    qryUpdate.SQL.Add(sSQLAlterados);
                    try
                       qryUpdate.ExecSQL;
                    except
                       memoErros.Lines.Add(sAuxMatFilal+' - Erro ao atualizar dados da tabela de TELEFONES.');
                    end;
                    pProcessoAux := pAceito ;
                 end
                 else pProcessoAux := pNProcessado ;
                 TabCriticasCcp.Insere( qryaux, iPatro, qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                        dSeqCritica, sMesCobranca,
                                        sAuxMatFilal ,
                                        qryDadosNoBanco.FieldByName('TELEFONE').AsString,
                                        qryTxt.FieldByName('TELEFONE').AsString,
                                        cChave, ceTelInserido, tdCaracter,'', gEndereco, pProcessoAux,
                                        '',sTipoEnd,'','','','',sFlgIntSitPart,'' );
              end
           end // if bInsere
           else begin
              pProcessoAux := pNProcessado ;
              TabCriticasCcp.Insere( qryaux, iPatro, -1,
                                     dSeqCritica, sMesCobranca,
                                     sAuxMatFilal ,
                                     '',
                                     Trim(QryTxt.FieldByName('LOGRADOURO').AsString),
                                     cChave, ceEnderecoInserido, tdCaracter,'', gEndereco, pProcessoAux,
                                     '', sTipoEnd,
                                     Trim(QryTxt.FieldByName('BAIRRO').AsString),
                                     Trim(QryTxt.FieldByName('CEP').AsString),
                                     Trim(QryTxt.FieldByName('UF').AsString),
                                     Trim(QryTxt.FieldByName('MUNICIPIO').AsString),sFlgIntSitPart,'' );
           end;
           qryTXT.Next;
           continue;

        end
        else //atualizar
        begin

           sSQLAlterados := '';
           if (Trim(QuotedStr(qryTxt.FieldByName('LOGRADOURO').AsString)) <>
              Trim(QuotedStr(qryDadosNoBanco.FieldByName('LOGRADOURO').AsString)) ) and
              (QryTxt.FieldByName('LOGRADOURO').AsString <> '')                  then
           begin
              if bAtuLogradouro
              then begin
                 sSQLAlterados := sSQLAlterados + ', LOGRADOURO = '+QuotedStr(QryTxt.FieldByName('LOGRADOURO').AsString)+' ';
                 pProcessoAux := pAceito ;
              end
              else pProcessoAux := pNProcessado ;

              TabCriticasCcp.Insere( qryaux, iPatro, qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                     dSeqCritica, sMesCobranca,
                                     sAuxMatFilal ,
                                     qryDadosNoBanco.FieldByName('LOGRADOURO').AsString,
                                     qryTxt.FieldByName('LOGRADOURO').AsString,
                                     cChave, ceLogradouroAlterado, tdCaracter,'', gEndereco, pProcessoAux,
                                     '', sTipoEnd,'','','','',sFlgIntSitPart ,'');

           end;


           if (Trim(QuotedStr(QryTxt.FieldByName('BAIRRO').AsString)) <>
               Trim(QuotedStr(qryDadosNoBanco.FieldByName('BAIRRO').AsString))) and
              (QryTxt.FieldByName('BAIRRO').AsString <> '')                  then
           begin
              if bAtuBairro
              then begin
                 sSQLAlterados := sSQLAlterados +  ',BAIRRO = '+QuotedStr(QryTxt.FieldByName('BAIRRO').AsString)+'';
                 pProcessoAux := pAceito ;
              end
              else pProcessoAux := pNProcessado ;

              TabCriticasCcp.Insere( qryaux, iPatro, qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                     dSeqCritica, sMesCobranca,
                                     sAuxMatFilal,
                                     qryDadosNoBanco.FieldByName('BAIRRO').AsString,
                                     qryTxt.FieldByName('BAIRRO').AsString,
                                     cChave, ceBairroAlterado, tdCaracter,'', gEndereco, pProcessoAux, '', '','','','','',sFlgIntSitPart,'' );
           end;


           if (Trim(qryTxt.FieldByName('CEP').AsString) <>
              Trim(qryDadosNoBanco.FieldByName('CEP').AsString)) and
              (QryTxt.FieldByName('CEP').AsString <> '')                  then
           begin
              if bAtuCep
              then begin
                 sSQLAlterados := sSQLAlterados +  ', CEP = '''+QryTxt.FieldByName('CEP').AsString+'''';
                 pProcessoAux := pAceito ;
              end
              else pProcessoAux := pNProcessado ;

              TabCriticasCcp.Insere( qryaux, iPatro, qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                     dSeqCritica, sMesCobranca,
                                     sAuxMatFilal ,
                                     qryDadosNoBanco.FieldByName('CEP').AsString,
                                     qryTxt.FieldByName('CEP').AsString,
                                     cChave, ceCepAlterado, tdCaracter,'', gEndereco, pProcessoAux,
                                     '', '','','','','' ,sFlgIntSitPart,'');
           end;



           if ((Uppercase(Trim(QuotedStr(QryTxt.FieldByName('MUNICIPIO').AsString))) <>
              Uppercase(Trim(QuotedStr(qryDadosNoBanco.FieldByName('MUNICIPIO').AsString))) ) or
              (QryTxt.FieldByName('UF').AsString <> qryDadosNoBanco.FieldByName('UF').AsString)) //caso seja uma cidade de outro estado com mesmo nome
              and (QryTxt.FieldByName('UF').AsString <> '')
              and  (QryTxt.FieldByName('UF').AsString <> '') then
           begin
               if bAtuCidade
               then begin
                  // Localizar codigo da cidade
                  with qryAux do
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add(' SELECT IDCIDADES '+
                         ' FROM CIDADES '+
                         ' WHERE UPPER(LTRIM(RTRIM(NOME))) LIKE '+quotedstr(UpperCase(Trim(QryTxt.FieldByName('MUNICIPIO').AsString)))+' '+
                         ' AND CODESTADO = '''+QryTxt.FieldByName('UF').AsString+''' ');
                     Open;
                  end;

                  if not qryAux.IsEmpty
                  then begin
                      sSQLAlterados := sSQLAlterados +', IDCIDADES = '+qryAux.FieldbyName('IDCIDADES').AsString;
                      pProcessoAux  := pAceito ;
                      TabCriticasCcp.Insere( qryaux, iPatro, qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                             dSeqCritica, sMesCobranca,
                                             sAuxMatFilal ,
                                             qryDadosNoBanco.FieldByName('MUNICIPIO').AsString,
                                             qryTxt.FieldByName('MUNICIPIO').AsString,
                                             cChave, ceCidadeAlterada, tdCaracter,'', gEndereco, pProcessoAux, '', '','','','','',sFlgIntSitPart ,'');

                  end
                  else begin
                     pProcessoAux := pNProcessado ;
                     TabCriticasCcp.Insere( qryaux, iPatro, qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                            dSeqCritica, sMesCobranca,
                                            sAuxMatFilal ,
                                            qryDadosNoBanco.FieldByName('MUNICIPIO').AsString,
                                            qryTxt.FieldByName('MUNICIPIO').AsString,
                                            cChave, ceCidadeNaoEncontrada, tdCaracter,'', gEndereco, pProcessoAux, '', '','','','','',sFlgIntSitPart,'' );

                  end;
               end
               else begin
                  pProcessoAux := pNProcessado ;

                  TabCriticasCcp.Insere( qryaux, iPatro, qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                         dSeqCritica, sMesCobranca,
                                         sAuxMatFilal ,
                                         qryDadosNoBanco.FieldByName('MUNICIPIO').AsString,
                                         qryTxt.FieldByName('MUNICIPIO').AsString,
                                         cChave, ceCidadeAlterada, tdCaracter,'', gEndereco, pProcessoAux, '', '','','','','',sFlgIntSitPart,'' );
               end;
           end;

           // UF - Não tratar, pois o estado é identificado pela cidade

           // Atualizar dados
           if sSQLAlterados <> ''
           then  begin
              try
                 sSQLAlterados := Copy(Trim(sSQLAlterados), 2, Length(sSQLAlterados));
                 qryUpdate.Close;
                 qryUpdate.SQL.Clear;
                 qryUpdate.SQL.Add(' UPDATE ENDPESS SET '+ sSQLAlterados+
                                   ' WHERE  IDPESSOA    = '+IntToStr(qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger)+
                                   ' AND    IDENDERECO  = '+IntToStr(qryDadosNoBanco.FieldByName('IDENDERECO').AsInteger));
                 qryUpdate.ExecSQL;
              except
                 memoErros.Lines.Add(sAuxMatFilal+' - Erro ao atualizar dados da tabela de ENDEREÇOS.');
              end;
           end;



           // Tratamento do Número do Telefone - TELENDPESS
           sSQLAlterados := '';
           if (qryTxt.FieldByName('TELEFONE').AsString <> '') and
              (StrToInt(qryTxt.FieldByName('TELEFONE').AsString) > 0 ) and
              (QryTxt.FieldByName('TELEFONE').AsString <> '')                  then
           begin
              if (qryDadosNoBanco.FieldByName('TELEFONE').AsString <> '') then

              begin

                 if   (qryTxt.FieldByName('TELEFONE').AsString <> qryDadosNoBanco.FieldByName('TELEFONE').AsString)
                 then begin // pessoa tem telefone mas o número é diferente
                    if bAtuTelefone
                    then begin
                       sSQLAlterados := ',NUMERO = '''+qryTxt.FieldByName('TELEFONE').AsString+'''';

                       pProcessoAux := pAceito ;
                    end
                    else pProcessoAux := pNProcessado ;

                    TabCriticasCcp.Insere( qryaux, iPatro, qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                           dSeqCritica, sMesCobranca,
                                           sAuxMatFilal ,
                                           qryDadosNoBanco.FieldByName('TELEFONE').AsString,
                                           qryTxt.FieldByName('TELEFONE').AsString,
                                           cChave, ceNumeroTelAlterado, tdCaracter,'', gEndereco, pProcessoAux,
                                           qryDadosNoBanco.FieldByName('IDTELEFONE').AsString,
                                           qryDadosNoBanco.FieldByName('IDENDERECO').AsString,
                                           '','','','',sFlgIntSitPart ,'');
                 end;



                 //tratamento do ddd
                 if   (qryTxt.FieldByName('DDD').AsString <> qryDadosNoBanco.FieldByName('DDD').AsString)
                      and (qryTxt.FieldByName('DDD').AsString <> '')
                 then begin
                    if bAtuTelddd
                    then begin
                       sSQLAlterados := sSQLAlterados + ',DDD = '''+qryTxt.FieldByName('DDD').AsString+'''';

                       pProcessoAux := pAceito ;
                    end
                    else pProcessoAux := pNProcessado ;

                    TabCriticasCcp.Insere( qryaux, iPatro, qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                           dSeqCritica, sMesCobranca,
                                           sAuxMatFilal ,
                                           qryDadosNoBanco.FieldByName('DDD').AsString,
                                           qryTxt.FieldByName('DDD').AsString,
                                           cChave, ceDDDTelAlterado, tdCaracter,'', gEndereco, pProcessoAux,
                                           qryDadosNoBanco.FieldByName('IDTELEFONE').AsString,
                                           qryDadosNoBanco.FieldByName('IDENDERECO').AsString,
                                           '','','','',sFlgIntSitPart ,'');
                 end;


                 if sSQLAlterados <> ''
                 then  begin
                    sSQLAlterados := Copy(Trim(sSQLAlterados), 2, Length(sSQLAlterados));
                    qryUpdate.Close;
                    qryUpdate.SQL.Clear;
                    qryUpdate.SQL.Add(' UPDATE TELENDPESS SET '+ sSQLAlterados+
                                      ' WHERE  IDTELEFONE    = '+IntToStr(qryDadosNoBanco.FieldByName('IDTELEFONE').AsInteger)+
                                      ' AND    IDENDERECO    = '+IntToStr(qryDadosNoBanco.FieldByName('IDENDERECO').AsInteger));
                    try
                       qryUpdate.ExecSQL;
                    except
                       memoErros.Lines.Add(sAuxMatFilal+' - Erro ao atualizar dados da tabela de TELEFONES.');
                    end;
                 end;

              end
              else if (qryDadosNoBanco.FieldByName('TELEFONE').AsString = '')
              then begin // pessoa não tem telefone
                 if binseretelefone
                 then begin
                     iIdTelefone := LeUltRegistro(Nil,'TELENDPESS ');

                     sSQLAlterados := ' INSERT INTO TELENDPESS(IDENDERECO , IDTELEFONE , NUMERO, TIPO, DDD ) '+
                                      ' VALUES ('+qryDadosNoBanco.FieldByName('IDENDERECO').AsString +','+
                                      IntToStr(iIdTelefone)                                          +','+
                                     ''''+qryTxt.FieldByName('TELEFONE').AsString                    +''', '+
                                     '''P'', '''+QryTxt.FieldByName('DDD').AsString+''') ';
                    qryUpdate.Close;
                    qryUpdate.SQL.Clear;
                    qryUpdate.SQL.Add(sSQLAlterados);
                    try
                       qryUpdate.ExecSQL;
                    except
                       memoErros.Lines.Add(sAuxMatFilal+' - Erro ao atualizar dados da tabela de TELEFONES.');
                    end;
                    pProcessoAux := pAceito ;
                 end
                 else pProcessoAux := pNProcessado ;
                 TabCriticasCcp.Insere( qryaux, iPatro, qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                        dSeqCritica, sMesCobranca,
                                        sAuxMatFilal ,
                                        qryDadosNoBanco.FieldByName('TELEFONE').AsString,
                                        qryTxt.FieldByName('TELEFONE').AsString,
                                        cChave, ceTelInserido, tdCaracter,'', gEndereco, pProcessoAux, '', '','','','','',sFlgIntSitPart ,'');
              end; // pessoa nao tem telefone
           end; // tratamento do numero do telefone
           // move para o próximo registro

           qryTxt.Next;
           continue;
        end;

     end; // while

   dtmBaseDados.dbBaseDados.Commit;
end;

procedure TfrmImportaDadosCadastrais.ImportaDocumentos;
var
   iIdDocumento, iIdPessoa : longint;
   sSQLAlterados,
   sFlgIntSitPart, sTipoSit : string;
Begin

   If dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.Commit;
   StartTransacao;

   pbStatus.Min := 0;
   pbStatus.Max := qryTxt.RecordCount;

   // balance line  -  dados importados com os já existentes
   while ( not qryTxt.EOF ) and ( not qryDadosNoBanco.EOF ) do
   begin
      pbStatus.Position := qryTxt.RecNo;
      frmImportaDadosCadastrais.update;

      if qrytxt.FieldByName('MATRICULA').AsString = qryDadosNoBanco.FieldByName('MATRICULA').AsString
      then begin
         // Verificar situacao do participante
         sFlgIntSitPart := VoltaFlgInterno(qryAux, IntToStr(iPatro), qryDadosNoBanco.FieldByName('IDPESSOA').AsString, sTipoSit);

         if ((sFlgIntSitPart = 'CA') and (chkCancelados.Checked)) OR
            ((sFlgIntSitPart = 'MA') and (chkMantidos.Checked))   OR
            ((sFlgIntSitPart = 'AS') and (chkAssistidos.Checked))
         then begin
            if sFlgIntSitPart = 'CA'
            then TabCriticasCcp.Insere(qryaux,iPatro,
                                  qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                  dSeqCritica,
                                  sMesCobranca,
                                  qryTxt.FieldByName('MATRICULA').AsString ,
                                  sFlgIntSitPart,
                                  '',
                                  cChave,
                                  cePartCancelado,
                                  tdCaracter,'',
                                  gDocumentos,
                                  pNProcessado,'', '','','','','',sFlgIntSitPart,'')
            else if sFlgIntSitPart = 'MA'
                 then TabCriticasCcp.Insere(qryaux,iPatro,
                                       qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                       dSeqCritica,
                                       sMesCobranca,
                                       qryTxt.FieldByName('MATRICULA').AsString ,
                                       sFlgIntSitPart,
                                       '',
                                       cChave,
                                       cePartMantido,
                                       tdCaracter,'',
                                       gDocumentos,
                                       pNProcessado,'', '','','','','',sFlgIntSitPart,'')
                 else TabCriticasCcp.Insere(qryaux,iPatro,
                                       qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                       dSeqCritica,
                                       sMesCobranca,
                                       qryTxt.FieldByName('MATRICULA').AsString ,
                                       sFlgIntSitPart,
                                       '',
                                       cChave,
                                       cePartAssistido,
                                       tdCaracter,'',
                                       gDocumentos,
                                       pNProcessado,'','','','','','',sFlgIntSitPart,'');

            // move para o próximo registro
            if (QryTxt.FieldByName('MATRICULA').AsString = qryDadosNoBanco.FieldByName('MATRICULA').AsString)
            then begin
               qrytxt.next;
               qryDadosNoBanco.next;
               continue;
            end
            else if (QryTxt.FieldByName('MATRICULA').AsString < qryDadosNoBanco.FieldByName('MATRICULA').AsString)
            then begin
               qrytxt.next;
               continue;
            end
            else if (QryTxt.FieldByName('MATRICULA').AsString > qryDadosNoBanco.FieldByName('MATRICULA').AsString)
            then begin
               qryDadosNoBanco.next;
               continue;
            end;
         end; // if sFlgIntSitPart

          if (qryTxt.FieldByName('IDDOCUMENT').AsInteger = qryDadosNoBanco.FieldByName('IDDOCUMENTO').AsInteger)
          then begin
              sSQLAlterados := '';

              // Verificando campo NUMDOCUMENTO
              if (QryTxt.FieldByName('NDOCUMENTO').AsString <>
                  qryDadosNoBanco.FieldByName('NUMDOCUMENTO').AsString) and
                  (trim(QryTxt.FieldByName('NDOCUMENTO').AsString) <> '')
              then begin
                 if bAtuNumDocumento
                 then begin
                    if sSQLAlterados = ''
                    then sSQLAlterados := ' NUMDOCUMENTO = '''+QryTxt.FieldByName('NDOCUMENTO').AsString+''' '
                    else sSQLAlterados := sSQLAlterados+' ,NUMDOCUMENTO = '''+QryTxt.FieldByName('NDOCUMENTO').AsString+''' ';
                    pProcessoAux := pAceito ;
                 end
                 else begin
                     pProcessoAux := pNProcessado ;
                 end;

                 TabCriticasCcp.Insere(qryaux,iPatro,
                                       qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                       dSeqCritica,
                                       sMesCobranca,
                                       qryDadosNoBanco.FieldByName('MATRICULA').AsString,
                                       qryDadosNoBanco.FieldByName('NUMDOCUMENTO').AsString,
                                       QryTxt.FieldByName('NDOCUMENTO').AsString,
                                       cChave,ceNumDocumentoAlterado, tdCaracter,'',
                                       gDocumentos, pProcessoAux, '', '','','','','',sFlgIntSitPart,'' );
              end; // Fim campo NUMDOCUMENTO

              // Verificando campo ORGAO
              if (QryTxt.FieldByName('ORGAO').AsString <>
                  qryDadosNoBanco.FieldByName('ORGAO').AsString)
                  and (trim(QryTxt.FieldByName('ORGAO').AsString ) <> '')
              then begin
                 if bAtuNumDocumento
                 then begin
                    if sSQLAlterados = ''
                    then sSQLAlterados := ' ORGAO = '''+QryTxt.FieldByName('ORGAO').AsString+''' '
                    else sSQLAlterados := sSQLAlterados+' ,ORGAO = '''+QryTxt.FieldByName('ORGAO').AsString+''' ';
                    pProcessoAux := pAceito ;
                 end
                 else begin
                     pProcessoAux := pNProcessado ;
                 end;

                 TabCriticasCcp.Insere(qryaux,iPatro,
                                       qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                       dSeqCritica,
                                       sMesCobranca,
                                       qryDadosNoBanco.FieldByName('MATRICULA').AsString,
                                       qryDadosNoBanco.FieldByName('ORGAO').AsString,
                                       QryTxt.FieldByName('ORGAO').AsString,
                                       cChave,ceNumDocumentoAlterado, tdCaracter,'',
                                       gDocumentos, pProcessoAux, '' , '','','','','',sFlgIntSitPart,'');
              end; // Fim campo ORGAO

              // Verificando campo UF
              if (QryTxt.FieldByName('UF').AsString <>
                  qryDadosNoBanco.FieldByName('UF').AsString)
                  and (trim(QryTxt.FieldByName('UF').AsString ) <> '')
              then begin
                 if bAtuUFDocumento
                 then begin

                    // BUSCAR IDESTADO DA UF QUE VEIO NO TXT
                    with qryAux do
                    begin
                       Close;
                       SQL.Clear;
                       SQL.Add(' SELECT IDESTADO FROM ESTADO WHERE CODESTADO = '''+QryTxt.FieldByName('UF').AsString+'''');
                       Open;
                    end;

                    if not qryAux.IsEmpty
                    then begin
                       if sSQLAlterados = ''
                       then sSQLAlterados := ' IDESTADO  = '''+QryAux.FieldByName('IDESTADO').AsString+''' '
                       else sSQLAlterados := sSQLAlterados+' , IDESTADO  = '''+QryAux.FieldByName('IDESTADO').AsString+''' ';
                       pProcessoAux := pAceito ;
                    end
                    else begin
                       pProcessoAux := pNProcessado ;
                       TabCriticasCcp.Insere(qryaux,iPatro,
                                  qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                  dSeqCritica,
                                  sMesCobranca,
                                  qrytxt.FieldByName('MATRICULA').AsString ,
                                  '',
                                  QryTxt.FieldByName('UF').AsString,
                                  cChave, ceUFNEncontrada, tdCaracter,'',
                                  gDocumentos, pNProcessado, '' , '','','','','',sFlgIntSitPart,'');

                    end;
                 end
                 else begin
                     pProcessoAux := pNProcessado ;
                 end;

                 TabCriticasCcp.Insere(qryaux,iPatro,
                                       qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                       dSeqCritica,
                                       sMesCobranca,
                                       qryDadosNoBanco.FieldByName('MATRICULA').AsString,
                                       qryDadosNoBanco.FieldByName('UF').AsString,
                                       QryTxt.FieldByName('UF').AsString,
                                       cChave,ceNumDocumentoAlterado, tdCaracter,'',
                                       gDocumentos, pProcessoAux, '', '','','','','',sFlgIntSitPart,'' );
              end; // Fim campo UF

              // Verificando campo EMISSAO
              if (QryTxt.FieldByName('DTEMISSAO').AsString <>
                 qryDadosNoBanco.FieldByName('DATAEMISSAO').AsString)
                 and (trim(QryTxt.FieldByName('DTEMISSAO').AsString ) <> '')
              then begin
                 if bAtuDtExpDocumento
                 then begin
                    if sSQLAlterados = ''
                    then sSQLAlterados := ' DATAEMISSAO = TO_DATE('''+QryTxt.FieldByName('DTEMISSAO').AsString+''', '''+qryLayOutArquivo.FieldByName('DOFTEMISSAO').AsString+''') '
                    else sSQLAlterados := sSQLAlterados+' , DATAEMISSAO = TO_DATE('''+QryTxt.FieldByName('DTEMISSAO').AsString+''', '''+qryLayOutArquivo.FieldByName('DOFTEMISSAO').AsString+''') ';
                    pProcessoAux := pAceito ;
                 end
                 else begin
                     pProcessoAux := pNProcessado ;
                 end;

                 TabCriticasCcp.Insere(qryaux,iPatro,
                                       qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                       dSeqCritica,
                                       sMesCobranca,
                                       qryDadosNoBanco.FieldByName('MATRICULA').AsString,
                                       qryDadosNoBanco.FieldByName('DATAEMISSAO').AsString,
                                       QryTxt.FieldByName('DTEMISSAO').AsString,
                                       cChave,ceNumDocumentoAlterado, tdData,'',
                                       gDocumentos, pProcessoAux, '', '','','','','',sFlgIntSitPart,'' );
              end; // Fim campo EMISSAO

              // Verificando campo VALIDADE
              if (QryTxt.FieldByName('DTVALIDADE').AsString <>
                 qryDadosNoBanco.FieldByName('DATAVALIDADE').AsString)
                 and (trim(QryTxt.FieldByName('DTVALIDADE').AsString ) <> '')
              then begin
                 if bAtuDtExpDocumento
                 then begin
                    if sSQLAlterados = ''
                    then sSQLAlterados := ' DATAVALIDADE = TO_DATE('''+QryTxt.FieldByName('DTVALIDADE').AsString+''', '''+qryLayOutArquivo.FieldByName('DOFTVALIDADE').AsString+''') '
                    else sSQLAlterados := sSQLAlterados+' , DATAVALIDADE = TO_DATE('''+QryTxt.FieldByName('DTVALIDADE').AsString+''', '''+qryLayOutArquivo.FieldByName('DOFTVALIDADE').AsString+''') ';
                    pProcessoAux := pAceito ;
                 end
                 else begin
                     pProcessoAux := pNProcessado ;
                 end;

                 TabCriticasCcp.Insere(qryaux,iPatro,
                                       qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                       dSeqCritica,
                                       sMesCobranca,
                                       qryDadosNoBanco.FieldByName('MATRICULA').AsString,
                                       qryDadosNoBanco.FieldByName('DATAVALIDADE').AsString,
                                       QryTxt.FieldByName('DTVALIDADE').AsString,
                                       cChave,ceNumDocumentoAlterado, tdData,'',
                                       gDocumentos, pProcessoAux, '', '','','','','',sFlgIntSitPart ,'');
              end; // Fim campo VALIDADE

              if sSQLAlterados <> '' then
              begin
                 sSQLAlterados := ' UPDATE DOCPESSOA SET '+sSQLAlterados;
                 sSQLAlterados := sSQLAlterados + ' WHERE IDPESSOA  = '+inttostr(qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger);
                 sSQLAlterados := sSQLAlterados + ' AND IDDOCUMENTO = '+inttostr(qryDadosNoBanco.FieldByName('IDDOCUMENTO').AsInteger);
                 QryUpDate.SQL.Text := sSQLAlterados;
                 QryUpdate.ExecSQL;
              end;

              QryTxt.Next;
              qryDadosNoBanco.Next;
          end // se for a mesma sequencia
          else  if (qryDadosNoBanco.FieldByName('IDDOCUMENTO').AsInteger <= 0) or
                   (qrytxt.FieldByName('IDDOCUMENT').AsInteger <
                    qryDadosNoBanco.FieldByName('IDDOCUMENTO').AsInteger)
                then begin


                   QryTxt.Next;
                end
                else if (qrytxt.FieldByName('IDDOCUMENT').AsInteger > qryDadosNoBanco.FieldByName('IDDOCUMENTO').AsInteger)
                     then begin
                        qryDadosNoBanco.Next;
                     end;
      end
      else begin
         if qrytxt.FieldByName('MATRICULA').AsString < qryDadosNoBanco.FieldByName('MATRICULA').AsString
         then QryTxt.Next
         else qryDadosNoBanco.Next;
      end;
   end;

   dtmBaseDados.dbBaseDados.Commit;

End;

procedure TfrmImportaDadosCadastrais.ImportaContatos;
var
   sMatriculaAtual,
   sSQLAlterados,
   sFlgIntSitPart, sTipoSit : string;
Begin

   If dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.Commit;
   StartTransacao;

   pbStatus.Min := 0;
   pbStatus.Max := qryTxt.RecordCount;

   // balance line  -  dados importados com os já existentes
   while ( not qryTxt.EOF ) and ( not qryDadosNoBanco.EOF ) do
   begin
      pbStatus.Position := qryTxt.RecNo;
      frmImportaDadosCadastrais.update;

      if qrytxt.FieldByName('MATRICULA').AsString = qryDadosNoBanco.FieldByName('MATRICULA').AsString
      then begin
         // Verificar situacao do participante
         sFlgIntSitPart := VoltaFlgInterno(qryAux, IntToStr(iPatro), qryDadosNoBanco.FieldByName('IDPESSOA').AsString, sTipoSit);

         if ((sFlgIntSitPart = 'CA') and (chkCancelados.Checked)) OR
            ((sFlgIntSitPart = 'MA') and (chkMantidos.Checked))   OR
            ((sFlgIntSitPart = 'AS') and (chkAssistidos.Checked))
         then begin
            if sFlgIntSitPart = 'CA'
            then TabCriticasCcp.Insere(qryaux,iPatro,
                                  qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                  dSeqCritica,
                                  sMesCobranca,
                                  qryTxt.FieldByName('MATRICULA').AsString ,
                                  sFlgIntSitPart,
                                  '',
                                  cChave,
                                  cePartCancelado,
                                  tdCaracter,'',
                                  gDocumentos,
                                  pNProcessado,'', '','','','','',sFlgIntSitPart,'')
            else if sFlgIntSitPart = 'MA'
                 then TabCriticasCcp.Insere(qryaux,iPatro,
                                       qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                       dSeqCritica,
                                       sMesCobranca,
                                       qryTxt.FieldByName('MATRICULA').AsString ,
                                       sFlgIntSitPart,
                                       '',
                                       cChave,
                                       cePartMantido,
                                       tdCaracter,'',
                                       gDocumentos,
                                       pNProcessado,'', '','','','','',sFlgIntSitPart,'')
                 else TabCriticasCcp.Insere(qryaux,iPatro,
                                       qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                       dSeqCritica,
                                       sMesCobranca,
                                       qryTxt.FieldByName('MATRICULA').AsString ,
                                       sFlgIntSitPart,
                                       '',
                                       cChave,
                                       cePartAssistido,
                                       tdCaracter,'',
                                       gDocumentos,
                                       pNProcessado,'', '','','','','',sFlgIntSitPart,'');

            // move para o próximo registro
            if (QryTxt.FieldByName('MATRICULA').AsString = qryDadosNoBanco.FieldByName('MATRICULA').AsString)
            then begin
               qrytxt.next;
               qryDadosNoBanco.next;
               continue;
            end
            else if (QryTxt.FieldByName('MATRICULA').AsString < qryDadosNoBanco.FieldByName('MATRICULA').AsString)
            then begin
               qrytxt.next;
               continue;
            end
            else if (QryTxt.FieldByName('MATRICULA').AsString > qryDadosNoBanco.FieldByName('MATRICULA').AsString)
            then begin
               qryDadosNoBanco.next;
               continue;
            end;
         end; // if sFlgIntSitPart

         sMatriculaAtual := qryTXT.FieldByName('MATRICULA').AsString;

         while (sMatriculaAtual = qryTXT.FieldByName('MATRICULA').AsString) and
               (sMatriculaAtual = qryDadosNoBanco.FieldByName('MATRICULA').AsString) and
               ( not qryTxt.EOF ) and ( not qryDadosNoBanco.EOF ) do
         begin
             if (qryTxt.FieldByName('NOME').AsString = qryDadosNoBanco.FieldByName('NOME').AsString)
             then begin
                 sSQLAlterados := '';

                 // Verificando campo EMAIL
                 if (QryTxt.FieldByName('EMAIL').AsString <> qryDadosNoBanco.FieldByName('EMAIL').AsString)
                 then begin
                    if bAtuEMailContato
                    then begin
                       if sSQLAlterados = ''
                       then sSQLAlterados := ' EMAIL = '''+QryTxt.FieldByName('EMAIL').AsString+''' '
                       else sSQLAlterados := sSQLAlterados+' ,EMAIL = '''+QryTxt.FieldByName('EMAIL').AsString+''' ';
                       pProcessoAux := pAceito ;
                    end
                    else begin
                        pProcessoAux := pNProcessado ;
                    end;

                    TabCriticasCcp.Insere(qryaux,iPatro,
                                          qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                          dSeqCritica,
                                          sMesCobranca,
                                          qryDadosNoBanco.FieldByName('MATRICULA').AsString,
                                          qryDadosNoBanco.FieldByName('EMAIL').AsString,
                                          QryTxt.FieldByName('EMAIL').AsString,
                                          cChave,ceEMailContatoAlterado, tdCaracter,'',
                                          gCadastro, pProcessoAux, qryDadosNoBanco.FieldByName('NOME').AsString,
                                          '','','','','',sFlgIntSitPart,'');
                 end; // Fim campo EMAIL

                 // Verificando campo CARGO
                 if (QryTxt.FieldByName('CARGO').AsString <> qryDadosNoBanco.FieldByName('CARGO').AsString)
                 then begin
                    if bAtuCARGOContato
                    then begin
                       if sSQLAlterados = ''
                       then sSQLAlterados := ' CARGO = '''+QryTxt.FieldByName('CARGO').AsString+''' '
                       else sSQLAlterados := sSQLAlterados+' ,CARGO = '''+QryTxt.FieldByName('CARGO').AsString+''' ';
                       pProcessoAux := pAceito ;
                    end
                    else begin
                        pProcessoAux := pNProcessado ;
                    end;

                    TabCriticasCcp.Insere(qryaux,iPatro,
                                          qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                          dSeqCritica,
                                          sMesCobranca,
                                          qryDadosNoBanco.FieldByName('MATRICULA').AsString,
                                          qryDadosNoBanco.FieldByName('CARGO').AsString,
                                          QryTxt.FieldByName('CARGO').AsString,
                                          cChave,ceCARGOContatoAlterado, tdCaracter,'',
                                          gCadastro, pProcessoAux, qryDadosNoBanco.FieldByName('NOME').AsString,
                                          '','','','','',sFlgIntSitPart,'');
                 end; // Fim campo CARGO

                 // Verificando campo SETOR
                 if (QryTxt.FieldByName('SETOR').AsString <> qryDadosNoBanco.FieldByName('SETOR').AsString)
                 then begin
                    if bAtuSETORContato
                    then begin
                       if sSQLAlterados = ''
                       then sSQLAlterados := ' SETOR = '''+QryTxt.FieldByName('SETOR').AsString+''' '
                       else sSQLAlterados := sSQLAlterados+' ,SETOR = '''+QryTxt.FieldByName('SETOR').AsString+''' ';
                       pProcessoAux := pAceito ;
                    end
                    else begin
                        pProcessoAux := pNProcessado ;
                    end;

                    TabCriticasCcp.Insere(qryaux,iPatro,
                                          qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                          dSeqCritica,
                                          sMesCobranca,
                                          qryDadosNoBanco.FieldByName('MATRICULA').AsString,
                                          qryDadosNoBanco.FieldByName('SETOR').AsString,
                                          QryTxt.FieldByName('SETOR').AsString,
                                          cChave,ceSETORContatoAlterado, tdCaracter,'',
                                          gCadastro, pProcessoAux, qryDadosNoBanco.FieldByName('NOME').AsString,
                                          '','','','','',sFlgIntSitPart,'');
                 end; // Fim campo SETOR

                 // Verificando campo NASCIMENTO
                 if (QryTxt.FieldByName('NASCIMENTO').AsString <> qryDadosNoBanco.FieldByName('NASCIMENTO').AsString)
                 then begin
                    if bAtuNASCContato
                    then begin
                       if sSQLAlterados = ''
                       then sSQLAlterados := sSQLAlterados+' ,NASCIMENTO = TO_DATE('''+QryTxt.FieldByName('NASCIMENTO').AsString+''', '+
                                            ' '''+qryLayOutArquivo.FieldByName('CTNASCFORMA').AsString+''') '
                       else sSQLAlterados := sSQLAlterados+' ,NASCIMENTO = TO_DATE('''+QryTxt.FieldByName('NASCIMENTO').AsString+''', '+
                                            ' '''+qryLayOutArquivo.FieldByName('CTNASCFORMA').AsString+''') ';
                       pProcessoAux := pAceito ;
                    end
                    else begin
                        pProcessoAux := pNProcessado ;
                    end;

                    TabCriticasCcp.Insere(qryaux,iPatro,
                                          qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                          dSeqCritica,
                                          sMesCobranca,
                                          qryDadosNoBanco.FieldByName('MATRICULA').AsString,
                                          qryDadosNoBanco.FieldByName('NASCIMENTO').AsString,
                                          QryTxt.FieldByName('NASCIMENTO').AsString,
                                          cChave,ceNASCIMENTOContatoAlterado,
                                          tdData,
                                          qryLayOutArquivo.FieldByName('CTNASCFORMA').AsString,
                                          gCadastro, pProcessoAux, qryDadosNoBanco.FieldByName('NOME').AsString,
                                          '','','','','',sFlgIntSitPart,'');
                 end; // Fim campo NASCIMENTO

                 // Verificando campo OBS
                 if (QryTxt.FieldByName('OBS').AsString <> qryDadosNoBanco.FieldByName('OBS').AsString)
                 then begin
                    if bAtuOBSContato
                    then begin
                       if sSQLAlterados = ''
                       then sSQLAlterados := ' OBS = '''+QryTxt.FieldByName('OBS').AsString+''' '
                       else sSQLAlterados := sSQLAlterados+' ,OBS = '''+QryTxt.FieldByName('OBS').AsString+''' ';
                       pProcessoAux := pAceito ;
                    end
                    else begin
                        pProcessoAux := pNProcessado ;
                    end;

                    TabCriticasCcp.Insere(qryaux,iPatro,
                                          qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                          dSeqCritica,
                                          sMesCobranca,
                                          qryDadosNoBanco.FieldByName('MATRICULA').AsString,
                                          qryDadosNoBanco.FieldByName('OBS').AsString,
                                          QryTxt.FieldByName('OBS').AsString,
                                          cChave,ceOBSContatoAlterado, tdCaracter,'',
                                          gCadastro, pProcessoAux, qryDadosNoBanco.FieldByName('NOME').AsString,
                                          '','','','','',sFlgIntSitPart,'');
                 end; // Fim campo OBS

                 if sSQLAlterados <> '' then
                 begin
                    sSQLAlterados := ' UPDATE CONTATOPESS SET '+sSQLAlterados;
                    sSQLAlterados := sSQLAlterados + ' WHERE IDENDERECO = '+inttostr(qryDadosNoBanco.FieldByName('IDENDERECO').AsInteger);
                    sSQLAlterados := sSQLAlterados + ' AND   NOME       = '+quotedstr(qryDadosNoBanco.FieldByName('NOME').AsString)+' ';
                    QryUpDate.SQL.Text := sSQLAlterados;
                    QryUpdate.ExecSQL;
                 end;
                 QryTxt.Next;
                 qryDadosNoBanco.Next;
                 continue;
             end // se for a mesma sequencia
             else  if ((qryDadosNoBanco.FieldByName('NOME').AsString = '') and
                       (qryTxt.FieldByName('NOME').AsString <> '')) OR
                      ((qrytxt.FieldByName('NOME').AsString < qryDadosNoBanco.FieldByName('NOME').AsString))
                   then begin
                      if bInsereContato
                      then begin
                         sSQLAlterados := ' INSERT INTO CONTATOPESS (IDENDERECO, IDCONTATO,    '+
                                          '        NOME, EMAIL, CARGO, SETOR,OBS, NASCIMENTO ) '+
                                          ' VALUES ('+qryDadosNoBanco.FieldByName('IDENDERECO').AsString+','+
                                          IntToStr(LeUltRegistro(nil, 'CONTATOPESS'))+','+
                                          ''+quotedstr(qryTxt.FieldByName('NOME').AsString)+', '+
                                          ''''+qryTxt.FieldByName('EMAIL').AsString+''', '+
                                          ''''+qryTxt.FieldByName('CARGO').AsString+''', '+
                                          ''''+qryTxt.FieldByName('SETOR').AsString+''', '+
                                          ''''+qryTxt.FieldByName('OBS').AsString+''', ';
                         if Trim(qryTxt.FieldByName('NASCIMENTO').AsString) <> ''
                         then sSQLAlterados := sSQLAlterados + ' TO_DATE('''+qryTxt.FieldByName('NASCIMENTO').AsString+''', '''+ qryLayOutArquivo.FieldByName('CTNASCFORMA').AsString+''') '
                         else sSQLAlterados := sSQLAlterados + ' NULL ';
                         sSQLAlterados := sSQLAlterados + ' ) ';

                         QryUpDate.SQL.Text := sSQLAlterados;
                         QryUpdate.ExecSQL;
                      end;
                      QryTxt.Next;
                      continue;
                   end
                   else if (qrytxt.FieldByName('NOME').AsString > qryDadosNoBanco.FieldByName('NOME').AsString)
                        then begin
                           qryDadosNoBanco.Next;
                           continue;
                        end
                        else begin
                           qryTxt.Next;
                        end;
             qryTxt.Next;
         end; // while sMatriculaAtual = qryTXT.Matricula
      end
      else begin
         if qrytxt.FieldByName('MATRICULA').AsString < qryDadosNoBanco.FieldByName('MATRICULA').AsString
         then QryTxt.Next
         else qryDadosNoBanco.Next;
      end;
   end;
   dtmBaseDados.dbBaseDados.Commit;
End;



procedure TfrmImportaDadosCadastrais.ImportaEventos;
var sIdEventosPrev, sNomeEvento, sIdPessoaAux, sNumInsc, sDtInicioInsc, sTaxa, sFlgMigrado : String;

Begin

   If dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.Commit;
   StartTransacao;

   pbStatus.Min := 0;
   pbStatus.Max := qryTxt.RecordCount;
   while (not qryTxt.EOF)  do
   begin

     sNumInsc := '';
     sIdPessoaAux := '';

     pbStatus.position := qryTxt.Recno;
     frmImportaDadosCadastrais.update;


     //inserção automática no plano
     //só acontece se o plano veio definido pelo separador no arquivo,
     //ou seja:
     //-plano definido
     //-situações definidas
     //-contribuições relacionadas ao evento
     //-taxas de contribuição iguais para todos
     //-número de inscrição automático
     //CASO ALGUM DESSES ITENS NÃO ESTEJA ATENDIDO
     //O SEPARADOR NÃO DEVE NEM GERAR ESTE EVENTO
     qryaux.Close;
     qryaux.sql.text := ' SELECT NOME, FLGINTERNO FROM EVENTOGERADOR WHERE IDEVENTOGERADOR = '''+qrytxt.fieldbyname('EVENTO').AsString+''' ';
     qryaux.open;

     sNomeEvento := qryaux.fieldbyname('NOME').AsString;

     sFlgMigrado := '0';
     if(qryaux.fieldbyname('FLGINTERNO').AsString = 'IP') and (bInsereEvento)  then
     begin
        sFlgMigrado := '1'; //caso seja uma inscrição automática, gravar FLGMIGRADO = 1

        //neste momento já existe na elegpatro, pois foi inserido pelo processo
        //cadatral principal
        if trim(qrytxt.fieldbyname('IDPESSOA').AsString) = '' then
        begin
           qryaux.close;
           qryaux.sql.text := ' SELECT EL.IDPESSJUR, EL.IDPESSOA '+
                       ' FROM  ELEGPATRO EL'+
                       ' WHERE EL.IDPESSJUR = '''+IntToStr(iPatro)+'''  '+
                       ' AND EL.MATRICULA LIKE  '''+qrytxt.FieldByName('MATRICULA').AsString+'%'' ';
           qryaux.open;

           sIdPessoaAux :=  trim(qryaux.fieldbyname('IDPESSOA').AsString);

        end
        else sIdPessoaAux :=  trim(qrytxt.fieldbyname('IDPESSOA').AsString);


        if sIdPessoaAux = '' then
        begin
           QryTxt.Next;
           continue;
        end;


        //teste de existência do evento
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT INSCRICAONUMERO, INSCRICAODATA  '+
                       ' FROM PARTPREVPLAN '+
                       ' WHERE IDPESSJUR = '+IntToStr(iPatro)+' '+
                       ' AND   IDPLANOPREV = '''+trim(qrytxt.fieldbyname('IDPLANO').AsString)+''' '+
                       ' AND   IDPESSOA = '''+sIdPessoaAux+''''+

                       ' AND   DATACANCELAMENTO IS NULL ');

        qryAux.Open;

        if not qryaux.IsEmpty then
        begin
           QryTxt.Next;
           continue;
        end;




        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT MAX(INSCRICAONUMERO) + 1 AS PROXINSC FROM PARTPREVPLAN '+
                       ' WHERE IDPLANOPREV = '''+trim(qrytxt.fieldbyname('IDPLANO').AsString)+''' ');
        qryAux.Open;
        sNumInsc := qryaux.fieldbyname('PROXINSC').AsString;


        //pega primeira data de inscrição para jogar no campo DATAINICIOINSC
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT MIN(INSCRICAODATA) DATA FROM PARTPREVPLAN '+
                       ' WHERE IDPESSOA = '''+sIdPessoaAux+''' ');
        qryAux.Open;

        if not qryaux.isempty then
             sDtInicioInsc := qrytxt.fieldbyname('DATAINI').AsString
        else sDtInicioInsc := qryaux.fieldbyname('DATA').AsString;



        //verifica se é uma reenscrição
        //caso o part. já esteja destaivado no mesmo plano com data de inscrição diferente,
        //efetuar reenscrição
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT INSCRICAONUMERO, INSCRICAODATA  '+
                       ' FROM PARTPREVPLAN '+
                       ' WHERE IDPESSJUR = '+IntToStr(iPatro)+' '+
                       ' AND   IDPLANOPREV = '''+trim(qrytxt.fieldbyname('IDPLANO').AsString)+''' '+
                       ' AND   IDPESSOA = '''+sIdPessoaAux+''''+

                       ' AND   DATACANCELAMENTO IS NOT NULL ' +

                       ' AND   TRUNC(INSCRICAODATA) < TO_DATE('''+qrytxt.fieldbyname('DATAINI').AsString+''',''DD/MM/YYYY'') ');
        qryAux.Open;

        if qryaux.isempty then
        begin
           QryUpdate.close;
           QryUpdate.sql.text := ' INSERT INTO PARTPREVPLAN( IDPESSJUR, IDPESSOA, IDPLANOPREV, IDSITPART,  '+
                              '   SEQPROPOSTA, IDSITPLANOPREV, INSCRICAONUMERO, INSCRICAODATA, '+
                              '   DTINICIOINSC, FLGDESATIVADO) '+
                              ' VALUES '+
                              ' ( '+IntToStr(iPatro)+', '''+sIdPessoaAux+''' , '''+trim(qrytxt.fieldbyname('IDPLANO').AsString)+''', '+
                              ' '''+qrytxt.fieldbyname('SITPART').AsString+''',1,'''+qrytxt.fieldbyname('SITPLANO').AsString+''', '+
                              ' '''+sNumInsc+''', TO_DATE('''+qrytxt.fieldbyname('DATAINI').AsString+''',''DD/MM/YYYY''), '+
                              ' TO_DATE('''+sDtInicioInsc+''',''DD/MM/YYYY''), 0)  ';
           try
              QryUpdate.ExecSQL;
           except
              memoErros.Lines.Add('Matrícula: '+qrytxt.fieldbyname('MATRICULA').AsString+' - Erro ao inserir participante.')
           end;
        end
        else
        begin
           QryUpdate.close;
           QryUpdate.sql.text := ' UPDATE PARTPREVPLAN SET DATACANCELAMENTO = NULL,  '+
                              ' FLGDESATIVADO = 0 '+
                              ' WHERE IDPESSJUR =  '+IntToStr(iPatro)+' AND '+
                              ' IDPESSOA =  '''+sIdPessoaAux+''' AND '+
                              ' IDPLANOPREV = '''+trim(qrytxt.fieldbyname('IDPLANO').AsString)+''' ';
           try
              QryUpdate.ExecSQL;
           except
              memoErros.Lines.Add('Matrícula: '+qrytxt.fieldbyname('MATRICULA').AsString+' - Erro reativar plano.')
           end;


           //reativar reservas
           //não se pode apagar ou zerar os valores. Em casos de reenscrição, caso haja um valor
           //remanescente, o participante tem direito a ele
           QryUpdate.close;
           QryUpdate.sql.text := ' UPDATE RESERVAPART SET FLGATIVO = 1 '+
                              ' WHERE IDPESSJUR =  '+IntToStr(iPatro)+' AND '+
                              ' IDPESSOA =  '''+sIdPessoaAux+''' AND '+
                              ' IDPLANOPREV = '''+trim(qrytxt.fieldbyname('IDPLANO').AsString)+''' '+
                              ' AND EXISTS ( SELECT 1 FROM  RESERVAXPLANO RP '+
                              '         WHERE  RP.IDPLANOPREV = RESERVAPART.IDPLANOPREV AND '+
                              '         RP.ANALITICOSINTETI = ''A'' AND '+
                              '         NVL(RP.FLGCOLETIVA,0) = 0 ) ';
           try
              QryUpdate.ExecSQL;
           except
              memoErros.Lines.Add('Matrícula: '+qrytxt.fieldbyname('MATRICULA').AsString+' - Erro reativar plano.')
           end;

        end;

        //insert dependente se não houver
        QryUpdate.close;
        QryUpdate.sql.text := ' INSERT INTO DEPENDENTE( IDPESSOA ) '+
                           ' VALUES ( '''+sIdPessoaAux+''' )  ';
        try
           QryUpdate.ExecSQL;
        except
        end;


        QryUpdate.close;
        QryUpdate.sql.text := ' INSERT INTO DEPENTIT( IDTITULAR, IDPESSOA, IDDEPENDENCIA,  '+
                           '    NUMSEQUENCIA, FLGCONTAIMPOSTOR, FLGBENEFICIARIO, MATRICULA) '+
                           ' VALUES '+
                           ' (  '''+sIdPessoaAux+''', '''+sIdPessoaAux+''' , ''PRP'', '+
                           ' 0, 0, 0,'''+qrytxt.fieldbyname('MATRICULA').AsString+''' )  ';
        try
           QryUpdate.ExecSQL;
        except
        end;
     end
     else sIdPessoaAux :=  trim(qrytxt.fieldbyname('IDPESSOA').AsString);



     if trim(sIdPessoaAux) = '' then
     begin
        QryTxt.Next;
        continue;
     end;

     qryDadosNoBanco.close;
     qryDadosNoBanco.sql.text := ' SELECT EL.IDPESSOA, EL.IDSITFUNC, PP.IDSITPART, PP.IDSITPLANOPREV, '+
                               ' PP.INSCRICAONUMERO, EL.MATRICULA, SITPART.FLGINTERNO '+
                               ' FROM ELEGPATRO EL, PARTPREVPLAN PP, SITPART '+
                               ' WHERE EL.IDPESSJUR = '''+IntToStr(iPatro)+''' AND '+
                               ' EL.IDPESSOA = '''+sIdPessoaAux+''' AND '+
                               ' PP.IDPLANOPREV(+) = '''+trim(qrytxt.fieldbyname('IDPLANO').AsString)+''' AND '+
                               ' PP.IDPESSJUR(+) = EL.IDPESSJUR AND '+
                               ' PP.IDPESSOA(+) = EL.IDPESSOA  AND '+
                               ' SITPART.IDSITPART = PP.IDSITPART ';
     qryDadosNoBanco.open;


     if (qryTxt.FieldByName('EVENTO').AsString <> '') and
        (trim(qrytxt.fieldbyname('IDPLANO').AsString) <> '') then
     begin


        //verifica se o evento já foi gravado
        qryaux.close;
        qryaux.sql.text := ' SELECT * FROM EVENTOSPREV '+
                      ' WHERE IDPESSJUR = '''+IntToStr(iPatro)+'''  '+
                      ' AND IDPESSOA = '''+qryDadosNoBanco.fieldbyname('IDPESSOA').AsString+''' '+
                      ' AND IDPLANOPREV = '''+qrytxt.fieldbyname('IDPLANO').AsString+''' '+
                      ' AND IDEVENTOGERADOR = '''+qrytxt.fieldbyname('EVENTO').AsString+''' ';
        try qryaux.Open; except end;

        if not qryaux.IsEmpty then
        begin
           QryTxt.Next;
           continue;
        end;

        if bInsereEvento then
        begin
           //gerar evento e atualizar situações
           qryaux.close;
           qryaux.sql.text := ' SELECT SEQEVENTOSPREV.NEXTVAL VALOR FROM DUAL ';
           qryaux.open;

           sIdEventosPrev := qryaux.fieldbyname('VALOR').AsString;


           QryUpdate.close;
           QryUpdate.sql.text := ' INSERT INTO EVENTOSPREV( IDEVENTOSPREV, IDSITPLANOATUAL, '+
                              ' IDPESSOA, IDSITFUNCATUAL,IDEVENTOGERADOR, IDPESSJUR, IDSITPARTATUAL, '+
                              ' IDPLANOPREV, IDSITPLANONOVO, IDSITFUNCNOVO, IDSITPARTNOVO, '+
                              ' DATAREGISTRO, DATAEVENTO, '+
                              ' FLGEFETIVADO, SEQPROPOSTA, INSCRICAONUMERO, FLGMIGRADO) '+
                              ' VALUES '+
                              ' ( '''+sIdEventosPrev+''', '+
                              ' '''+qryDadosNoBanco.fieldbyname('IDSITPLANOPREV').AsString+''', '+
                              ' '''+qryDadosNoBanco.fieldbyname('IDPESSOA').AsString+''' , '+
                              ' '''+qryDadosNoBanco.fieldbyname('IDSITFUNC').AsString+''', '+
                              ' '''+qrytxt.fieldbyname('EVENTO').AsString+''', '+
                              ' '+IntToStr(iPatro)+', '+
                              ' '''+qryDadosNoBanco.fieldbyname('IDSITPART').AsString+''', '+
                              ' '''+qrytxt.fieldbyname('IDPLANO').AsString+''', '+
                              ' '''+qrytxt.fieldbyname('SITPLANO').AsString+''', '+
                              ' '''+qrytxt.fieldbyname('SITFUNC').AsString+''', '+
                              ' '''+qrytxt.fieldbyname('SITPART').AsString+''', '+
                              ' TO_DATE('''+qrytxt.fieldbyname('DATAINI').AsString+''',''DD/MM/YYYY''), '+
                              ' TO_DATE('''+qrytxt.fieldbyname('DATAINI').AsString+''',''DD/MM/YYYY''), '+
                              ' 0, 1, '''+qryDadosNoBanco.fieldbyname('INSCRICAONUMERO').AsString+''', '+
                              ' '+sFlgMigrado+' ) '; 
           try
              QryUpdate.ExecSQL;
           except
              memoErros.Lines.Add('Matrícula: '+qryDadosNoBanco.fieldbyname('MATRICULA').AsString+' - Erro ao inserir evento.')
           end;


           if trim(qryTxt.FieldByName('SITFUNC').AsString) <> '' then
           begin
              QryUpdate.close;
              QryUpdate.sql.text := ' UPDATE ELEGPATRO SET IDSITFUNC = '''+qryTxt.FieldByName('SITFUNC').AsString+''' '+
                                 ' WHERE IDPESSJUR = '''+IntToStr(iPatro)+''' AND '+
                                 ' IDPESSOA = '''+qryDadosNoBanco.fieldbyname('IDPESSOA').AsString+''' ';

              try
                 QryUpdate.ExecSQL;
              except
                 memoErros.Lines.Add('Matrícula: '+qryDadosNoBanco.fieldbyname('MATRICULA').AsString+' - Erro ao alterar a situação do funcionário.')
              end;
           end;

           if trim(qryTxt.FieldByName('SITPART').AsString) <> '' then
           begin
              QryUpdate.close;
              QryUpdate.sql.text := ' UPDATE PARTPREVPLAN SET IDSITPART = '''+qryTxt.FieldByName('SITPART').AsString+''', '+
                                 ' IDSITPLANOPREV = '''+qryTxt.FieldByName('SITPLANO').AsString+''' '+
                                 ' WHERE IDPESSJUR = '''+IntToStr(iPatro)+''' AND '+
                                 ' IDPESSOA = '''+qryDadosNoBanco.fieldbyname('IDPESSOA').AsString+''' AND '+
                                 ' IDPLANOPREV = '''+qrytxt.fieldbyname('IDPLANO').AsString+''' ';

              try
                 QryUpdate.ExecSQL;
              except
                 memoErros.Lines.Add('Matrícula: '+qryDadosNoBanco.fieldbyname('MATRICULA').AsString+' - Erro ao alterar a situação do participante.')
              end;
           end;

           //suspende contribuições
           QryUpdate.Close;
           QryUpdate.Sql.text := ' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0 '+
                              ' WHERE IDPESSJUR = '''+IntToStr(iPatro)+''' AND '+
                              ' IDPESSOA = '''+qryDadosNoBanco.fieldbyname('IDPESSOA').AsString+''' AND '+
                              ' IDPLANOPREV = '''+qrytxt.fieldbyname('IDPLANO').AsString+''' AND '+
                              ' NOT EXISTS (SELECT IDCONTRIBUICAO FROM CONTPREVEVENTO ' + 
                              ' WHERE IDPLANOPREV     = '''+qrytxt.fieldbyname('IDPLANO').AsString+'''  AND ' +
                              '       IDEVENTOGERADOR = '''+qrytxt.fieldbyname('EVENTO').AsString+''' AND '+
                              '       IDCONTRIBUICAO = CONTRIBPREVPARTP.IDCONTRIBUICAO AND '+
                              '       IDPLANOPREV = CONTRIBPREVPARTP.IDPLANOPREV ) ';
           QryUpdate.ExecSql;


           //associa contribuições
           qryAux.Close;
           qryAux.Sql.Clear;
           qryAux.Sql.text := ' SELECT CT.IDCONTRIBUICAO, C.IDTPPERIODICIDADE '+
                          ' FROM CONTPREVEVENTO CT, CONTRIBUICAO C ' +
                          ' WHERE CT.IDPLANOPREV     = '''+qrytxt.fieldbyname('IDPLANO').AsString+'''  AND ' +
                          '       CT.IDEVENTOGERADOR = '''+qrytxt.fieldbyname('EVENTO').AsString+'''  AND '+
                          '       C.IDCONTRIBUICAO = CT.IDCONTRIBUICAO ';
           qryAux.Open;
           qryAux.First;
           while not qryAux.EOF do
           begin

              sTaxa := '0';
              if trim(qrytxt.fieldbyname('TAXA').AsString) <> '' then
                 sTaxa := qrytxt.fieldbyname('TAXA').AsString;

              qryupdate.close;
              qryupdate.sql.text := ' INSERT INTO CONTRIBPREVPARTP(IDPESSJUR, IDPESSOA, IDPLANOPREV, IDCONTRIBUICAO, SEQPROPOSTA, ' +
                         '                                 FLGRETROATIVO, FLGCOBRA, DATAINICIO, DATAFINAL, IDTPPERIODICIDADE, ' +
                         '                                 FLGDESCFOLHA, CODPORTFORMA, VALORBASE1 ) ' +
                         ' VALUES( '''+inttostr(iPatro)+''','+
                                   ' '''+qryDadosNoBanco.fieldbyname('IDPESSOA').AsString+''','+
                                   ' '''+qrytxt.fieldbyname('IDPLANO').AsString+''','+
                                   qryAux.FieldByName('IDCONTRIBUICAO').AsString+ ',1,' +
                                   ' 0, 1 , To_Date('''+qrytxt.fieldbyname('DATAINI').AsString+''',''DD/MM/YYYY'') ' + ',' +
                                   ' NULL , '''+qryAux.FieldByName('IDTPPERIODICIDADE').AsString+''' , 0 , NULL, '+
                                   ' '+sTaxa+'/100 ) ';
              try
                 qryupdate.execsql;
              except

                 qryupdate.close;
                 qryupdate.sql.text := ' UPDATE  CONTRIBPREVPARTP SET FLGCOBRA = 1,  '+
                            ' VALORBASE1 = '+sTaxa+'/100 '+
                            ' WHERE IDPESSJUR = '''+inttostr(iPatro)+''' AND '+
                            ' IDPESSOA = '''+qryDadosNoBanco.fieldbyname('IDPESSOA').AsString+''' AND '+
                            ' IDPLANOPREV = '''+qrytxt.fieldbyname('IDPLANO').AsString+'''  AND '+
                            ' IDCONTRIBUICAO = '''+qryAux.FieldByName('IDCONTRIBUICAO').AsString+''' AND '+
                            ' SEQPROPOSTA = 1  ';
                 try
                    qryupdate.execsql;
                 except
                    memoErros.Lines.Add('Matrícula: '+qryDadosNoBanco.fieldbyname('MATRICULA').AsString+' - Erro ao associar contribuição.')
                 end;

              end;

              qryaux.next;
           end;

           pProcessoAux := pAceito ;
        end
        else begin
           pProcessoAux := pNProcessado ;
        end;


        TabCriticasCcp.Insere( qryaux, iPatro, qryDadosNoBanco.FieldByName('IDPESSOA').AsInteger,
                                dSeqCritica, sMesCobranca,
                                qrytxt.FieldByName('MATRICULA').AsString ,
                                '',
                                sNomeEvento,
                                cChave, ceEvEventoInserido , tdNumerico,
                                '', gEvento, pProcessoAux, '',
                                sIdEventosPrev,'','','','', '' ,'');



        //troquei o código abaixo de lugar
        //ele estava logo após a criação na PARTPREVPLAN, porém, faz referência à CONTRIBPREVPARTP
        //criaada apenas neste ponto
        qryaux.Close;
        qryaux.sql.text := ' SELECT NOME, FLGINTERNO FROM EVENTOGERADOR WHERE IDEVENTOGERADOR = '''+qrytxt.fieldbyname('EVENTO').AsString+''' ';
        qryaux.open;

        if(qryaux.fieldbyname('FLGINTERNO').AsString = 'IP') and (bInsereEvento)  then
        begin


           QryUpdate.close;
           QryUpdate.sql.text := ' UPDATE PARTPREVPLAN SET DATACANCELAMENTO = TO_DATE('''+qrytxt.fieldbyname('DATAINI').AsString+''',''DD/MM/YYYY'') - 1,  '+
                              ' FLGDESATIVADO = 1 '+
                              ' WHERE IDPESSJUR =  '+IntToStr(iPatro)+' AND '+
                              ' IDPESSOA =  '''+sIdPessoaAux+''' AND '+
                              ' IDPLANOPREV <>  '''+trim(qrytxt.fieldbyname('IDPLANO').AsString)+''' ';

           try
              QryUpdate.ExecSQL;
           except
              memoErros.Lines.Add('Matrícula: '+qrytxt.fieldbyname('MATRICULA').AsString+' - Erro ao reativar reservas.')
           end;



           QryUpdate.close;
           QryUpdate.sql.text := ' INSERT INTO RESERVAPART '+
                                 ' (IDTIPORESERVA, IDPLANOPREV, IDPESSOA , IDPESSJUR, DATAREFERENCIASA, '+
                                 ' SEQPROPOSTA, VALORRESERVA, FLGATIVO, FLGINCONSISTENCIA) '+
                                 ' SELECT RP.IDTIPORESERVA , RP.IDPLANOPREV, P.IDPESSOA, P.IDPESSJUR, '+
                                 ' TO_DATE('''+qrytxt.fieldbyname('DATAINI').AsString+''',''DD/MM/YYYY''), 1, 0, 1, 0 '+
                                 ' FROM PARTPREVPLAN P, RESERVAXPLANO RP, RESERVAXCONTRIB RC, CONTRIBPREVPARTP CP '+
                                 ' WHERE P.IDPESSOA = '''+sIdPessoaAux+''' AND'+
                                 ' P.IDPESSJUR = CP.IDPESSJUR AND '+
                                 ' P.IDPLANOPREV = CP.IDPLANOPREV AND '+
                                 ' P.IDPLANOPREV = '''+trim(qrytxt.fieldbyname('IDPLANO').AsString)+''' AND '+
                                 ' P.IDPESSJUR = '+IntToStr(iPatro)+' AND '+
                                 ' P.IDPESSOA = CP.IDPESSOA AND '+
                                 ' RP.IDPLANOPREV = P.IDPLANOPREV AND '+
                                 ' RP.ANALITICOSINTETI = ''A'' AND '+
                                 ' NVL(RP.FLGCOLETIVA,0) = 0 AND '+
                                 ' RC.IDPLANOPREV = RP.IDPLANOPREV  AND '+
                                 ' RC.IDTIPORESERVA = RP.IDTIPORESERVA AND '+
                                 ' CP.IDCONTRIBUICAO = RC.IDCONTRIBUICAO AND '+
                                 ' NOT EXISTS '+
                                 ' (SELECT 1 FROM RESERVAPART R '+
                                 ' WHERE R.IDPESSJUR = P.IDPESSJUR AND '+
                                 ' R.IDPLANOPREV = P.IDPLANOPREV AND '+
                                 ' R.IDPESSOA = P.IDPESSOA) ';
           try
              QryUpdate.ExecSQL;
           except
              memoErros.Lines.Add('Matrícula: '+qrytxt.fieldbyname('MATRICULA').AsString+' - Erro na inserção de reservas.')
           end;

        end;

     end
     else
     begin

        if  ((qryTxt.FieldByName('SITFUNC').AsInteger <>
            qryDadosNoBanco.FieldByName('IDSITFUNC').AsInteger) and
            (qryTxt.FieldByName('SITFUNC').AsString <> ''))   or

            //casos de afastamento - atualizar data de inicio
            ((trim(qrytxt.fieldbyname('DATAINI').AsString) <> '') and
             (strtoint(trim(qryTxt.FieldByName('SITFUNC').AsString))
              in [7,40,65,41,42,44,45,66,67,48,49,69,55,70,51,72,52]))then
        begin


           if batuevento then
           begin
               QryUpdate.close;
               QryUpdate.sql.text := ' UPDATE ELEGPATRO SET IDSITFUNC = '+quotedstr(qryTxt.FieldByName('SITFUNC').AsString)+', '+
                                  ' DATAINICIOAFAST = To_Date('''+qrytxt.fieldbyname('DATAINI').AsString+''',''DD/MM/YYYY'') '+
                                  ' WHERE IDPESSJUR = '''+IntToStr(iPatro)+''' AND '+
                                  ' IDPESSOA = '''+qrytxt.fieldbyname('IDPESSOA').AsString+''' ';

               try
                  QryUpdate.ExecSQL;
               except
                  memoErros.Lines.Add('Matrícula: '+qryDadosNoBanco.fieldbyname('MATRICULA').AsString+' - Erro ao alterar a situação do funcionário.')
               end;

               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;


            TabCriticasCcp.Insere( qryaux, iPatro, qrytxt.fieldbyname('IDPESSOA').AsInteger,
                                    dSeqCritica, sMesCobranca,
                                    qrytxt.FieldByName('MATRICULA').AsString ,
                                    qryDadosNoBanco.FieldByName('IDSITFUNC').AsString,
                                    qryTxt.FieldByName('SITFUNC').AsString,
                                    cChave, ceEvSituacaoAlterado , tdNumerico,
                                    '', gEvento, pProcessoAux, '', '','','','','',
                                    qryDadosNoBanco.fieldbyname('FLGINTERNO').AsString,'' );

        end;
     end;


     // move para o próximo registro
     QryTxt.Next;

   end; // while

   dtmBaseDados.dbBaseDados.Commit;

End;

procedure TfrmImportaDadosCadastrais.ImportaTabelaRubricas;    // Concluido
var sSqlUpdate, sTxt, sBanco : string ;
    idprovento,iTipo : integer;
Begin

    cChave := cCodRubrica;

    If dtmBaseDados.dbBaseDados.InTransaction
    then dtmBaseDados.dbBaseDados.Commit;
    StartTransacao;
    pbStatus.Min := 0;
    pbStatus.Max := qryTxt.RecordCount;
    while (not qryTxt.EOF)  do
    begin

    pbStatus.position := qryTxt.Recno;
    frmImportaDadosCadastrais.update;
      if trim(qrytxt.FieldByName('CODIGO').AsString) = '' then
      begin
         qrytxt.next;
         continue;
      end;

      if (qryTabRubricas.Locate('CODPROVDESC',qrytxt.FieldByName('CODIGO').AsString,[loCaseInsensitive,loPartialKey])) then
      begin

         sTxt := trim(tiracaracteres(qryTxt.FieldByName('DESCRICAO').AsString));
         sBanco := trim(tiracaracteres(qryTabRubricas.FieldByName('DESCRPROVDESC').AsString));
         if sTxt <> sBanco then
         begin
            if batudescrubrica then
            begin
                sSqlUpdate := '';
                sSqlUpDate := 'UpDate RUBRICAXPESS set DESCRPROVDESC = '+quotedstr(qryTxt.FieldByName('DESCRICAO').AsString)+' ';
                sSqlUpdate := sSqlUpDate + ' where CODPROVDESC = '+''''+qryTabRubricas.FieldByName('CODPROVDESC').AsString+'''';
                sSqlUpDate := sSqlUpDate + ' and idpessoa = '+inttostr(ipatro);
                QryUpDate.SQL.Text := sSqlUpdate;
                QryUpdate.ExecSQL;


                sSqlUpdate := '';
                sSqlUpDate := 'UpDate PROVDESC set DESCRICAO = '+quotedstr(qryTxt.FieldByName('DESCRICAO').AsString)+' ';
                sSqlUpdate := sSqlUpDate + ' where IDPROVENTO = '+inttostr(qryTabRubricas.FieldByName('Idprovento').AsInteger);
                QryUpDate.SQL.Text := sSqlUpdate;
                QryUpdate.ExecSQL;

                pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;


            TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                                    dSeqCritica, sMesCobranca,
                                    qrytxt.FieldByName('CODIGO').AsString,
                                    trim(qryTabRubricas.FieldByName('DESCRPROVDESC').AsString),
                                    trim(qryTxt.FieldByName('DESCRICAO').AsString),
                                    cChave, ceRubDescAlterado , tdCaracter,
                                    '', gRubrica, pProcessoAux, '',
                                    inttostr(qryTabRubricas.FieldByName('Idprovento').AsInteger),
                                    '','','','','' ,'');
         end;


         sTxt := Trim(qryTxt.FieldByName('TIPO').AsString);
         sBanco := qryTabRubricas.FieldByName('flgdesconto').AsString;
         if (strtoint(sTxt) <>   strToInt(sBanco)) and
            (sTxt <> '')        then
         begin

            if batutipoindicador then
            begin
                sSqlUpDate := 'UpDate PROVDESC set flgdesconto = '''+sTxt+''' ';
                sSqlUpdate := sSqlUpDate + ' where IDPROVENTO = '+inttostr(qryTabRubricas.FieldByName('Idprovento').AsInteger);
                QryUpDate.SQL.Text := sSqlUpdate;
                QryUpdate.ExecSQL;

                pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;


            TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                                   dSeqCritica, sMesCobranca,
                                   qrytxt.FieldByName('CODIGO').AsString,
                                   qryTabRubricas.FieldByName('flgdesconto').AsString,
                                   qryTxt.FieldByName('tipo').AsString,
                                   cChave, ceRubTipoAlterado , tdNumerico,
                                   '', gRubrica, pProcessoAux, '',
                                   inttostr(qryTabRubricas.FieldByName('Idprovento').AsInteger),
                                   '','','','' ,'','');
         end;


         sTxt := Trim(qryTxt.FieldByName('INDICE').AsString);
         sBanco := qryTabRubricas.FieldByName('FLGATRASODEVOL').AsString;
         if ( sTxt <>   sBanco ) and
            ( sTxt <> '' )       then
         begin

            if batuincidesalario then
            begin
                sSqlUpdate := '';
                sSqlUpDate := 'UpDate PROVDESC set FLGATRASODEVOL = '''+qryTxt.FieldByName('INDICE').AsString+'''';
                sSqlUpdate := sSqlUpDate + ' where IDPROVENTO = '+''''+qryTabRubricas.FieldByName('IDPROVENTO').AsString+'''';
                QryUpDate.SQL.Text := sSqlUpdate;
                QryUpdate.ExecSQL;

                pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;


            TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                                   dSeqCritica, sMesCobranca,
                                   qrytxt.FieldByName('CODIGO').AsString,
                                   qryTabRubricas.FieldByName('flgatrasodevol').AsString,
                                   qryTxt.FieldByName('indice').AsString,
                                   cChave, ceRubFlgAtrasoAlterado , tdCaracter,
                                   '', gRubrica, pProcessoAux, '',
                                   inttostr(qryTabRubricas.FieldByName('Idprovento').AsInteger),
                                   '','','','','','');

         end;
         // move para o próximo registro

         QryTxt.Next;
      end
      else
      begin

         idprovento := 0;
         if binsererubrica then
         begin
             sSqlUpdate := '';
             idprovento := LeUltRegistro(nil,'PROVDESC ');
             sSqlUpdate := sSqlUpDate + 'INSERT INTO PROVDESC (IDPROVENTO,FLGDESCONTO,DESCRICAO, FLGATRASODEVOL ,FLGTPRUBRICA) VALUES (';

             sSqlUpdate := sSqlUpdate + inttostr(idprovento) + ', '''+qryTxt.FieldByName('TIPO').AsString+''' ,';
             sSqlUpdate := sSqlUpdate + ' '+quotedstr(qryTxt.FieldByName('DESCRICAO').AsString) + ','''+ qryTxt.FieldByName('INDICE').AsString+''', ''P'')';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;

             sSqlUpdate := '';
             sSqlUpdate := sSqlUpDate + 'INSERT INTO RUBRICAXPESS (IDPESSOA,IDRUBRICA,CODPROVDESC,DESCRPROVDESC) VALUES (';
             sSqlUpdate := sSqlUpdate + inttostr(ipatro) + ',' + inttostr(idprovento) + ',' ;
             sSqlUpdate := sSqlUpdate + '''' + QryTxt.FieldByName('CODIGO').AsString +''',' ;
             sSqlUpdate := sSqlUpdate + ' '+quotedstr(qryTxt.FieldByName('DESCRICAO').AsString)+' ' +')';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;


            pProcessoAux := pAceito ;
         end
         else begin
            pProcessoAux := pNProcessado ;
         end;


         TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                                dSeqCritica, sMesCobranca,
                                qrytxt.FieldByName('CODIGO').AsString,
                                '',
                                qryTxt.FieldByName('DESCRICAO').AsString,
                                cChave, ceRubInserido , tdCaracter,
                                '', gRubrica, pProcessoAux, '',
                                inttostr(idprovento),
                                qryTxt.FieldByName('TIPO').AsString,
                                qryTxt.FieldByName('INDICE').AsString,
                                QryTxt.FieldByName('CODIGO').AsString,'','','' );


         // move para o próximo registro do TXT
         QryTxt.Next;
      end;
    end; // while

    if rgTipoChave.ItemIndex = 0
    then cChave := cMatricula
    else cChave := cInscricao;

   dtmBaseDados.dbBaseDados.Commit;

End;

procedure TfrmImportaDadosCadastrais.ImportaTabelaBanco;
var sSqlUpdate, sNumBanco, sAgencia, sTxt, sBanco : string ;
    idagencia,idbanco : integer;
Begin
   // balance line  -  dados importados com os já existentes

  cChave := cNumAgencia;

  If dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;
  StartTransacao;
  pbStatus.Min := 0;
  pbStatus.Max := qryTxt.RecordCount;

   while not qrytxt.EOF do
   begin
      idagencia := 0;


      qryaux.close;
      qryaux.sql.text := ' SELECT BB.NUMBANCO, BB.IDPESSOA  '+
                               ' FROM BANCO BB  '+
                               ' WHERE  (BB.NUMBANCO = '''+qrytxt.FieldByName('BANCO').AsString+''') ';
      qryaux.open;

      if qryaux.isempty then
      begin
         MemoErros.Lines.Add('Banco não encontrado:'+qrytxt.FieldByName('BANCO').AsString);
         qrytxt.next;
         continue;
      end;

      IdBanco := qryaux.FieldByName('IDPESSOA').AsInteger;

      qryTabBancos.close;
      qryTabBancos.sql.text := ' SELECT BB.NUMBANCO, BB.IDPESSOA AS IDPESSOABANCO, '+
                               ' AG.IDPESSOA AS IDPESSOAAGENCIA, PE.NOME AS AGENCIA, '+
                               ' AG.NUMAGENCIA '+
                               ' FROM AGENCIABANCARIA AG, BANCO BB,  PESSOA PE '+
                               ' WHERE '+
                               '  (AG.IDPESSOA = PE.IDPESSOA) '+
                               ' AND   (AG.IDBANCO = BB.IDPESSOA) '+
                               ' AND   (BB.IDPESSOA = '''+qryaux.FieldByName('IDPESSOA').AsString+''') '+
                               ' AND   (AG.NUMAGENCIA = '''+qrytxt.FieldByName('AGENCIA').AsString+''') '+
                               ' ORDER BY BB.NUMBANCO,AG.NUMAGENCIA ';
      qryTabBancos.open;


      pbStatus.Position := qryTxt.RecNo;
      frmImportaDadosCadastrais.update;

      if qrytabBancos.isempty then
      begin
         if binsereagencia then
         begin
             idagencia := LeUltRegistro(nil,'PESSOA ');
             sSqlUpDate := 'INSERT INTO PESSOA (IDPESSOA,NOME,FLGAGENCIA) VALUES (';
             sSqlUpdate := sSqlUpDate + INTTOSTR(idagencia) + ',';
             sSqlUpdate := sSqlUpDate + ''+trim(QuotedStr(qryTxt.FieldByName('DESCRAGENC').AsString))+''+',';
             sSqlUpdate := sSqlUpDate + inttostr(1) + ')';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;
             //
             sSqlUpDate := 'INSERT INTO AGENCIABANCARIA (IDPESSOA,IDBANCO,NUMAGENCIA) VALUES (';
             sSqlUpDate := sSqlUpDate + INTTOSTR(idagencia) + ' , '+IntToStr(IdBanco)+',';
             sSqlUpDate := sSqlUpDate + ''+trim(QuotedStr(QryTxt.FieldByName('AGENCIA').AsString))+' ' +')';
             QryUpDate.SQL.Text := sSqlUpdate;
             QryUpdate.ExecSQL;


            pProcessoAux := pAceito ;
         end
         else begin
            pProcessoAux := pNProcessado ;
         end;


         TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                                dSeqCritica, sMesCobranca,
                                trim(QuotedStr(QryTxt.FieldByName('AGENCIA').AsString)),
                                '',
                                trim(qryTxt.FieldByName('DESCRAGENC').AsString),
                                cChave, ceAgInserido , tdCaracter,
                                '', gAgencia, pProcessoAux, '',
                                inttostr(idagencia),
                                inttostr(qryTabBancos.FieldByName('IDPESSOABANCO').AsInteger),
                                trim(QuotedStr(QryTxt.FieldByName('AGENCIA').AsString)),
                                '','','','');

      end
      else
      begin
         // Altera a AGENCIA se necessário
         sTxt := trim(qryTxt.FieldByName('DESCRAGENC').AsString);
         sBanco := trim(qryTabBancos.FieldByName('AGENCIA').AsString);
         if ( sTxt <> sBanco) and ( sTxt <> '') then
         begin
            if batunomeagencia then
            begin
               sSqlUpDate := 'UpDate PESSOA set NOME  = '+trim(QuotedStr(qryTxt.FieldByName('DESCRAGENC').AsString))+' ';
               sSqlUpdate := sSqlUpDate + ' where IDPESSOA = '+inttostr(qryTabBancos.FieldByName('IDPESSOAAGENCIA').AsInteger);
               sSqlUpdate := sSqlUpDate + ' and FLGAGENCIA = 1';
               QryUpDate.SQL.Text := sSqlUpdate;
               QryUpdate.ExecSQL;

               pProcessoAux := pAceito ;
            end
            else begin
               pProcessoAux := pNProcessado ;
            end;


            TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                                   dSeqCritica, sMesCobranca,
                                   trim(QryTxt.FieldByName('AGENCIA').AsString),
                                   trim(qryTabBancos.FieldByName('AGENCIA').AsString),
                                   trim(qryTxt.FieldByName('DESCRAGENC').AsString),
                                   cChave, ceAgNomeAlterado , tdCaracter,
                                   '', gAgencia, pProcessoAux, '',
                                   inttostr(qryTabBancos.FieldByName('IDPESSOAAGENCIA').AsInteger),
                                   '','', '','','' ,'');

         end;

      end;

      qrytxt.next;
   end;

   if rgTipoChave.ItemIndex = 0
   then cChave := cMatricula
   else cChave := cInscricao;
   dtmBaseDados.dbBaseDados.Commit;

end;


procedure TfrmImportaDadosCadastrais.ImportaTabelaCargos;
Var iIdcargonovo : integer;
    sSqlUpDate : string ;
Begin

   If dtmBaseDados.dbBaseDados.InTransaction
   then dtmBaseDados.dbBaseDados.Commit;
   StartTransacao;

   pbStatus.Min := 0;
   pbStatus.Max := qryTxt.RecordCount;
   while not qryTxt.EOF do begin
      pbStatus.Position := qryTxt.RecNo;
      frmImportaDadosCadastrais.update;
            
      if (trim(TiraCaracteres(copy(qrytxt.FieldByName('NOME').AsString,0,30))) =
          trim(TiraCaracteres(copy(qryTabCargos.FieldByName('TITULO').AsString,0,30)))) then
      begin
         if (qryTxt.FieldByName('CARGO').AsString <> qryTabCargos.FieldByName('CODIGO').AsString) then
         begin

            sSqlUpDate := 'UpDate CARGOEXT set ';

            if batucodcargo then
               sSqlUpDate := ' CODIGO = '''+qryTxt.FieldByName('CARGO').AsString+''' , ';

            if batudesccargo then
               sSqlUpdate := sSqlUpDate + '  TITULO = '+quotedstr(qrytxt.FieldByName('NOME').AsString)+' , ';


            sSqlUpdate := sSqlUpDate + '  DESCRICAO = '+quotedstr(qrytxt.FieldByName('NOME').AsString)+' ';
            sSqlUpdate := sSqlUpDate + ' where IDCARGOEXT = '+inttostr(qryTabCargos.FieldByName('idcargoext').AsInteger);
            sSqlUpDate := sSqlUpDate + ' and idpessjur = '+inttostr(ipatro);
            QryUpDate.SQL.Text := sSqlUpdate;
            try
               QryUpdate.ExecSQL;
            except
               MemoErros.Lines.Add('Não foi alterado o cargo de código '+qrytxt.FieldByName('cargo').AsString);
            end;
         end;
         // move para o próximo registro das duas tabelas
           QryTxt.Next;
         qryTabCargos.Next;
      end
      else
      begin
         if (qrytxt.FieldByName('NOME').AsString <
             qryTabCargos.FieldByName('TITULO').AsString)  then
         begin

            if binserecargo then
            begin
                // INSERINDO NOVO CARGO
                iIdCargoNovo := LeUltRegistro(nil,'CARGOEXT ');
                sSqlUpDate := 'INSERT INTO CARGOEXT (IDPESSJUR,IDCARGOEXT,CODIGO,DESCRICAO, TITULO) VALUES (';
                sSqlUpdate := sSqlUpDate + inttostr(ipatro)+','+inttostr(iIdCargoNovo)+','''+qryTxt.FieldByName('CARGO').AsString+''''+',';
                sSqlUpDate := sSqlUpDate + ' '+quotedstr(qryTxt.FieldByName('NOME').AsString) + ', '+ quotedstr(qryTxt.FieldByName('NOME').AsString)+' )';
                QryUpDate.SQL.Text := sSqlUpdate;
                try
                   QryUpdate.ExecSQL;
                except
                   memoErros.Lines.Add('Não foi inserido o cargo de código ' + qryTxt.FieldByName('CARGO').AsString);
                end;
            end;
            // move para o próximo registro do TXT
            QryTxt.Next;
         end
         else
         begin
            // move para o próximo registro dos cargos
            qryTabCargos.Next;
            /// Se for final da consulta de cargos do banco então insere e move para o próximo do TXT
            if qryTabCargos.EOF then begin
               iIdCargoNovo := LeUltRegistro(nil,'CARGOEXT ');
               sSqlUpDate := 'INSERT INTO CARGOEXT (IDPESSJUR,IDCARGOEXT,CODIGO,DESCRICAO,TITULO) VALUES (';
               sSqlUpdate := sSqlUpDate + inttostr(ipatro)+','+inttostr(iIdCargoNovo)+','''+qryTxt.FieldByName('CARGO').AsString+''''+',';
               sSqlUpDate := sSqlUpDate + ''+quotedstr(qryTxt.FieldByName('NOME').AsString) + ',' + quotedstr(qryTxt.FieldByName('NOME').AsString) +')';
               QryUpDate.SQL.Text := sSqlUpdate;
               try
                  QryUpdate.ExecSQL;
               except
                  memoErros.Lines.Add('Não foi inserido o cargo de código ' + qryTxt.FieldByName('CARGO').AsString);
               end;
               // move para o próximo registro do TXT
               QryTxt.Next;
            end;
         end;
      end;
   end;

   dtmBaseDados.dbBaseDados.Commit;
End;

procedure TfrmImportaDadosCadastrais.ImportaTabelaNivel;  // concluido
Var sSqlUpDate : string ;
    serious : string ;
    data : Tdatetime;
Begin
  if not qryTabNiveis.Active then qryTabNiveis.Open;


  If dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;
  StartTransacao;
  
  data := STRTODATE(deDataCob.TEXT);
  pbStatus.Min := 0;
  pbStatus.Max := qryTxt.RecordCount;
  while not QryTxt.EOF do
  begin
     pbStatus.Position := qryTxt.RecNo;
     frmImportaDadosCadastrais.update;

     if (strtoint(qrytxt.FieldByName('NIVEL').AsString) =
        qryTabNiveis.FieldByName('IDFAIXASALEXT').Asinteger) then
     begin

        if batunivel then
        begin
            SERIOUS := IncluiDecimal(qrytxt.FieldByName('VALOR').AsString,'.',strtoint(qryLayOutArquivo.FieldByName('TBNIVELCASAS').AsString));

            sSqlUpDate := 'INSERT INTO  hstfaixasalext (IDFAIXASALEXT,STEP1,DATAEFETIV) VALUES (';
            sSqlUpdate := sSqlUpDate + INTTOSTR(strtoint(qrytxt.FieldByName('NIVEL').AsString));
            sSqlUpDate   := sSqlUpDate + ',' + serious +','+ 'TO_CHAR(to_date('+''''+ FormatDateTime('dd/mm/yyyy', data)+ '''' + ','+ 
            '''' + 'dd/mm/yyyy' + '''' + ')' + ',' +''''+'yyyy/mm'+''''+'))';
            QryUpDate.SQL.Text := sSqlUpdate;
            QryUpdate.ExecSQL;
        end;
        // move para o próximo registro
        QryTxt.Next;
        qryTabNiveis.Next;
     end
     else
     begin
        if (strtoint(qrytxt.FieldByName('NIVEL').AsString) > qryTabNiveis.FieldByName('IDFAIXASALEXT').Asinteger) then
        begin

           if binserenivel then
           begin
               // INSERINDO NOVO nivel
               sSqlUpDate := 'INSERT INTO FAIXASALEXT (IDPESSJUR,IDFAIXASALEXT,DESCRICAO) VALUES (';
               sSqlUpdate := sSqlUpDate + inttostr(ipatro)+','+inttostr(strtoint(qryTxt.FieldByName('NIVEL').AsString))+',';
               sSqlUpDate := sSqlUpDate + '''' + 'Faixa Salarial ' +inttostr(strtoint(qryTxt.FieldByName('NIVEL').AsString))+''''+')';
               QryUpDate.SQL.Text := sSqlUpdate;
               try
                  QryUpdate.ExecSQL;
               except
                  memoErros.Lines.Add('Não foi inserido o nível ' + qryTxt.FieldByName('NIVEL').AsString);
               end;
               //
               SERIOUS := IncluiDecimal(qrytxt.FieldByName('VALOR').AsString,'.',strtoint(qryLayOutArquivo.FieldByName('TBNIVELCASAS').AsString));
               //
               sSqlUpDate := 'INSERT INTO  hstfaixasalext (IDFAIXASALEXT,STEP1,DATAEFETIV) VALUES (';
               sSqlUpdate := sSqlUpDate + INTTOSTR(strtoint(qrytxt.FieldByName('NIVEL').AsString));
               sSqlUpDate := sSqlUpDate + ',' + serious +','+ 'TO_CHAR(to_date('+''''+ FormatDateTime('dd/mm/yyyy', data)+ '''' + ',' + '''' + 'dd/mm/yyyy' + '''' + ')' + ',' +''''+'yyyy/mm'+''''+'))'; 
               QryUpDate.SQL.Text := sSqlUpdate;
               try
                  QryUpdate.ExecSQL;
               except
                  memoErros.Lines.Add('Não foi inserido o nível ' + qryTxt.FieldByName('NIVEL').AsString + ' no histórico. ');
               end;

           end;// move para o próximo registro do TXT
           QryTxt.Next;
        end
        else
        begin
           // move para o próximo registro dos cargos
           qryTabNiveis.Next;
        end;
     end;
  end;
  dtmBaseDados.dbBaseDados.Commit;
End;

procedure TfrmImportaDadosCadastrais.ImportaTabelaSituacoes;  // concluido
Var sSqlUpDate : string ;
    iNovoIdSituacao : Integer;
Begin
  if not qryTabSituacoes.Active then qryTabSituacoes.Open;
  
  If dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;
  StartTransacao;

  pbStatus.Min := 0;
  pbStatus.Max := qryTxt.RecordCount;
  while not QryTxt.EOF do
  begin
     pbStatus.Position := qryTxt.RecNo;
     frmImportaDadosCadastrais.update;
          
     if QryTxt.FieldByName('CODIGO').AsString = '' then begin
        qryTxt.Next;
        Continue;
     end;
     if qrytxt.FieldByName('CODIGO').AsString = qryTabSituacoes.FieldByName('CODIGO').AsString then
     begin
        // Não atualiza a descrição na SITFUNC
        // move para o próximo registro
        QryTxt.Next;
        qryTabSituacoes.Next;
     end
     else
     begin
        if qrytxt.FieldByName('CODIGO').AsString >
           qryTabSituacoes.FieldByName('CODIGO').AsString then
        begin
           // INSERINDO NOVA SITUAÇÃO NA SITFUNC
           if binseresituacao then
           begin
               iNovoIdSituacao := LeUltRegistro(nil,'SITFUNC ');
               sSqlUpdate := 'INSERT INTO SITFUNC (IDSITFUNC, DESCRICAO, TIPOSIT) VALUES (';
               sSqlUpdate := sSqlUpDate + inttostr(iNovoIdSituacao)+','+quotedstr(qryTxt.FieldByName('DESCRICAO').AsString)+',''N'')';
               QryUpDate.SQL.Text := sSqlUpdate;
               try
                  QryUpdate.ExecSQL;
               except
                  memoErros.Lines.Add('Não foi inserida a situação de código ' + qryTxt.FieldByName('CODIGO').AsString);
               end;

               // INSERINDO NOVA SITUAÇÃO NA SITFUNCXPATRO
               sSqlUpDate := 'INSERT INTO SITFUNCXPATRO (IDPESSJUR,IDSITFUNC,CODIGO) VALUES (';
               sSqlUpdate := sSqlUpDate + inttostr(iPatro)+ ','+ inttostr(iNovoIdSituacao)+',''';
               sSqlUpdate := sSqlUpDate + qryTxt.FieldByName('CODIGO').AsString+''')';
               QryUpDate.SQL.Text := sSqlUpdate;
               try
                  QryUpdate.ExecSQL;
               except
                  memoErros.Lines.Add('Não foi inserida a situação de código ' + qryTxt.FieldByName('CODIGO').AsString + ' para a patrocinadora ');
               end;
           end;
           // move para o próximo registro do TXT
           QryTxt.Next;
        end
        else
        begin
           // move para o próximo registro dos cargos
           qryTabSituacoes.Next;
        end;
     end;
  end;
  dtmBaseDados.dbBaseDados.Commit;
End;

procedure TfrmImportaDadosCadastrais.ImportaTabelaLocal;
var sSqlUpdate, sIdPessoa , sAux, sValorNaFundacao, sValorNoInterface : string;
Begin
  if not qryTabLocal.Active then qryTabLocal.Open;

  cChave := cNumFilial;

  If dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;
  StartTransacao;
  
  pbStatus.Min := 0;
  pbStatus.Max := qryTxt.RecordCount;
  while not QryTxt.EOF do
  begin
     pbStatus.Position := qryTxt.RecNo;
     frmImportaDadosCadastrais.update;

     sIdPessoa := '';

     if trim(qrytxt.FieldByName('LOCAL').AsString) = '' then begin
        qrytxt.Next;
        Continue;
     end;

     qrytablocal.close;
     qrytablocal.sql.text := ' SELECT P.IDPESSOA, P.NUMDOCUMENTO , P.NOME,  F.IDFILIALPESSOA, '+
                             ' F.FLGTIPO, F.FLGATIVO, F.SIGLA '+
                             ' FROM FILIALPESSOA F, PESSOA P '+
                             ' WHERE  P.IDPESSOA = F.IDFILIALPESSOA  AND '+
                             ' NUMFILIAL = '''+qrytxt.FieldByName('LOCAL').AsString+''' ';
     qrytablocal.open;

     if qrytablocal.isempty then
     begin
        if binserelocal then
        begin
           QryUpdate.close;
           QryUpdate.sql.text := ' SELECT SEQPESSOA.NEXTVAL ID FROM DUAL';
           QryUpdate.Open;
           sIdPessoa := QryUpdate.fieldbyname('ID').AsString;

           //INSERE PESSOA
           QryUpdate.close;
           QryUpdate.SQL.text := ' INSERT INTO PESSOA(IDPESSOA , NOME ,TIPO, RAZAOSOCIAL, NUMDOCUMENTO, IDGRUPO) '+
                              ' SELECT '+sIdpessoa+','+QuotedStr(qrytxt.FieldByName('NOME').AsString)+', ''J'', '+
                              //Bruno Bastos - Ajuste para gravar nome sem espaço em branco na frente da string - 23/10/2007 - ' '+QuotedStr(qrytxt.FieldByName('NOME').AsString)+', '+
                              ' '+QuotedStr(Trim(qrytxt.FieldByName('NOME').AsString))+', '+ //Bruno Bastos - Ajuste para gravar nome sem espaço em branco na frente da string - 23/10/2007                              
                              ' '''+qrytxt.FieldByName('CGC').AsString+''' , '+
                                 IntToStr( iPatro )+
                              ' FROM DUAL';

           try
              QryUpdate.execsql;
           except
              MemoErros.Lines.Add('Erro ao incluir a filial: '+qrytxt.FieldByName('LOCAL').AsString);
           end;


           //INSERE DOCPESSOA
           QryUpdate.close;
           QryUpdate.SQL.text := ' INSERT INTO DOCPESSOA(IDDOCUMENTO, IDPESSOA , NUMDOCUMENTO) '+
                              ' SELECT  1, '+sIdpessoa+', '''+qrytxt.FieldByName('CGC').AsString+''' '+
                              ' FROM DUAL';

           try
              QryUpdate.execsql;
           except
              MemoErros.Lines.Add('Erro ao incluir o CGC da filial: '+qrytxt.FieldByName('LOCAL').AsString);
           end;


           //INSERE FILIAL
           QryUpdate.close;      
           QryUpdate.SQL.text := ' INSERT INTO FILIALPESSOA(IDFILIALPESSOA , NUMFILIAL,  '+
                                 ' FLGTIPO,  SIGLA, FLGATIVO, IDGRUPO ) '+
                              ' SELECT '+sIdpessoa+','''+qrytxt.FieldByName('LOCAL').AsString+''', '+
                              ' '''+qrytxt.FieldByName('TIPO').AsString+''', '+
                                 ' '''+qrytxt.FieldByName('SIGLA').AsString+''', ''S'', '+
                                 IntToStr( iPatro )+
                              ' FROM DUAL';
           try
              QryUpdate.execsql;
           except
              MemoErros.Lines.Add('Erro ao incluir a filial: '+qrytxt.FieldByName('LOCAL').AsString);
           end;

           pProcessoAux := pAceito ;
        end
        else begin
           pProcessoAux := pNProcessado ;
        end;


        TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                               dSeqCritica, sMesCobranca,
                               qrytxt.FieldByName('LOCAL').AsString,
                               '',
                               trim(qryTxt.FieldByName('NOME').AsString),
                               cChave, ceLocalInserido , tdCaracter,
                               '', gFilial, pProcessoAux, '',
                               sIdPessoa,
                               qrytxt.FieldByName('TIPO').AsString,
                               qrytxt.FieldByName('SIGLA').AsString,
                               qrytxt.FieldByName('CGC').AsString,
                               qrytxt.FieldByName('LOCAL').AsString,'','' );

     end
     else
     begin

        //ATUALIZA PESSOA
        sAux := '';
        if trim(qrytxt.fieldbyname('CGC').AsString) <>
           trim(qryTabLocal.FieldByName('NUMDOCUMENTO').AsString) then
        begin
           if batucgclocal then
           begin
              sAux := ' NUMDOCUMENTO = '''+trim(qrytxt.fieldbyname('CGC').AsString)+''' ';

              sSqlUpDate := 'UPDATE DOCPESSOA SET '+sAux+' ';
              sSqlUpdate := sSqlUpDate + 'WHERE IDDOCUMENTO = 1 AND IDPESSOA = '+inttostr(qryTabLocal.FieldByName('IDPESSOA').Asinteger);
              QryUpDate.SQL.Text := sSqlUpdate;
              try
                 QryUpdate.ExecSQL;
              except
                 MemoErros.Lines.Add('Erro ao atualizar o CGC da filial: '+qrytxt.FieldByName('LOCAL').AsString);
              end;

              pProcessoAux := pAceito ;
           end
           else begin
              pProcessoAux := pNProcessado ;
           end;


           TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                                  dSeqCritica, sMesCobranca,
                                  qrytxt.FieldByName('LOCAL').AsString,
                                  trim(qryTabLocal.FieldByName('NUMDOCUMENTO').AsString),
                                  Trim(qryTxt.FieldByName('CGC').AsString),
                                  cChave, ceLocalCGCAlterado , tdCaracter,
                                  '', gFilial, pProcessoAux, '',
                                  inttostr(qryTabLocal.FieldByName('IDPESSOA').Asinteger),
                                  '','','','','','');

        end;


        if trim(qrytxt.FieldByName('NOME').AsString) <>
           trim(qryTabLocal.FieldByName('NOME').AsString) then
        begin

           if batudesclocal then
           begin
               if trim(sAux) = '' then
               sAux := '  NOME = '+trim(QuotedStr(qrytxt.fieldbyname('NOME').AsString))+' '
               else sAux := ' , NOME = '+trim(QuotedStr(qrytxt.fieldbyname('NOME').AsString))+' ';

               sAux := sAux + ' , RAZAOSOCIAL = '+trim(QuotedStr(qrytxt.fieldbyname('NOME').AsString))+' ';

               pProcessoAux := pAceito ;
           end
           else begin
              pProcessoAux := pNProcessado ;
           end;


           TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                                  dSeqCritica, sMesCobranca,
                                  qrytxt.FieldByName('LOCAL').AsString,
                                  trim(qryTabLocal.FieldByName('NOME').AsString),
                                  Trim(qryTxt.FieldByName('NOME').AsString),
                                  cChave, ceLocalNomeAlterado , tdCaracter,
                                  '', gFilial, pProcessoAux, '',
                                  inttostr(qryTabLocal.FieldByName('IDPESSOA').Asinteger),
                                  '','','','','','' );

        end;

        if sAux <> ''
        then
        begin
           sSqlUpDate := 'UPDATE PESSOA SET '+sAux+' ';
           sSqlUpdate := sSqlUpDate + 'WHERE IDPESSOA = '+inttostr(qryTabLocal.FieldByName('IDPESSOA').Asinteger);
           QryUpDate.SQL.Text := sSqlUpdate;
           try
              QryUpdate.ExecSQL;
           except
                 MemoErros.Lines.Add('Erro ao atualizar o nome da filial: '+qrytxt.FieldByName('LOCAL').AsString);
           end;
        end;


        //ATUALIXA FILIALPESSOA
        sAux := '';
        if (trim(qrytxt.fieldbyname('TIPO').AsString) <>
           trim(qryTabLocal.FieldByName('FLGTIPO').AsString)) and
           (trim(qrytxt.fieldbyname('TIPO').AsString) <> '') then
        begin
           if (batutipolocal) then
           begin
              sAux := ' FLGTIPO = '''+trim(qrytxt.fieldbyname('TIPO').AsString)+''' ';

              pProcessoAux := pAceito ;
           end
           else begin
              pProcessoAux := pNProcessado ;
           end;


           TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                                  dSeqCritica, sMesCobranca,
                                  qrytxt.FieldByName('LOCAL').AsString,
                                  trim(qryTabLocal.FieldByName('FLGTIPO').AsString),
                                  Trim(qryTxt.FieldByName('TIPO').AsString),
                                  cChave, ceLocalTipoAlterado , tdCaracter,
                                  '', gFilial, pProcessoAux, '',
                                  inttostr(qryTabLocal.FieldByName('IDPESSOA').Asinteger),
                                  '','','','','' ,'');
        end;


        if (trim(qrytxt.fieldbyname('SIGLA').AsString) <>
           trim(qryTabLocal.FieldByName('SIGLA').AsString)) and
           (trim(qrytxt.fieldbyname('SIGLA').AsString) <> '') then
        begin
           if (batusigla) then
           begin
              if sAux = '' then
              sAux := ' SIGLA = '''+trim(qrytxt.fieldbyname('SIGLA').AsString)+''' '
              else  sAux := ' ,SIGLA = '''+trim(qrytxt.fieldbyname('SIGLA').AsString)+''' ';

              pProcessoAux := pAceito ;
           end
           else begin
              pProcessoAux := pNProcessado ;
           end;


           TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                                  dSeqCritica, sMesCobranca,
                                  qrytxt.FieldByName('LOCAL').AsString,
                                  trim(qryTabLocal.FieldByName('SIGLA').AsString),
                                  Trim(qryTxt.FieldByName('SIGLA').AsString),
                                  cChave, ceLocalSiglaAlterado , tdCaracter,
                                  '', gFilial, pProcessoAux, '',
                                  inttostr(qryTabLocal.FieldByName('IDPESSOA').Asinteger),
                                  '','','','','' ,'');

        end;



        if ((copy(qrytxt.fieldbyname('DATAFIM').AsString,1,2) <>'00') and (qryTabLocal.FieldByName('FLGATIVO').AsString = 'S')) OR
           ((copy(qrytxt.fieldbyname('DATAFIM').AsString,1,2) = '00') and (qryTabLocal.FieldByName('FLGATIVO').AsString = 'N')) then
        begin

           if (( (copy(qrytxt.fieldbyname('DATAFIM').AsString,1,2) <>'00'))
              and (qryTabLocal.FieldByName('FLGATIVO').AsString = 'S'))
           then  begin
              sValorNaFundacao := 'S';
              sValorNoInterface := 'N';
           end
           else if ((copy(qrytxt.fieldbyname('DATAFIM').AsString,1,2) <>'00')
               and (qryTabLocal.FieldByName('FLGATIVO').AsString = 'N'))
           then begin
              sValorNaFundacao := 'N';
              sValorNoInterface := 'S';
           end;


           if (batuativlocal) then
           begin
              sAux := ' FLGATIVO = '''+sValorNoInterface+''' ';

              pProcessoAux := pAceito ;
           end
           else begin
              pProcessoAux := pNProcessado ;
           end;


           TabCriticasCcp.Insere( qryaux, iPatro, iPatro,
                                  dSeqCritica, sMesCobranca,
                                  qrytxt.FieldByName('LOCAL').AsString,
                                  sValorNaFundacao,
                                  sValorNoInterface,
                                  cChave, ceLocalTipoAlterado , tdCaracter,
                                  '', gFilial, pProcessoAux, '',
                                  inttostr(qryTabLocal.FieldByName('IDPESSOA').Asinteger),
                                  '','','','','' ,'');
        end;



        if sAux <> ''
        then
        begin
           sSqlUpDate := 'UPDATE FILIALPESSOA SET '+sAux+' ';
           sSqlUpdate := sSqlUpDate + 'WHERE IDFILIALPESSOA = '+inttostr(qryTabLocal.FieldByName('IDPESSOA').Asinteger);
           QryUpDate.SQL.Text := sSqlUpdate;
           try
              QryUpdate.ExecSQL;
           except
              MemoErros.Lines.Add('Erro ao atualizar os dados da filial: '+qrytxt.FieldByName('LOCAL').AsString);
           end;
        end;

     end;

     qrytxt.next;
  end;

  if rgTipoChave.ItemIndex = 0
  then cChave := cMatricula
  else cChave := cInscricao;
  dtmBaseDados.dbBaseDados.Commit;
End;

procedure TfrmImportaDadosCadastrais.ImportaTabelaOrgao;
var sSqlUpdate : string;
Begin
  if not qryTabOrgao.Active then qryTabOrgao.Open;
  If dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;
  StartTransacao;
  pbStatus.Min := 0;
  pbStatus.Max := qryTxt.RecordCount;
  while not QryTxt.EOF do
  begin
     pbStatus.Position := qryTxt.RecNo;
     frmImportaDadosCadastrais.update;
          
     if qrytxt.FieldByName('SIGLA').AsString = qryTabOrgao.FieldByName('SIGLA').AsString then
     begin
        if trim(qrytxt.FieldByName('NOME').AsString) <>
           trim(qryTabOrgao.FieldByName('NOME').AsString) then
        begin
           //

           if batudescorgao then
           begin
               sSqlUpDate := 'UPDATE ORGAOPREV  SET NOME = ';
               sSqlUpdate := sSqlUpDate + ''+quotedstr(qryTxt.FieldbyName('NOME').AsString) + '';
               QryUpDate.SQL.Text := sSqlUpdate;
               try
                  QryUpdate.ExecSQL;
               except
                  memoErros.Lines.Add('Não foi atualizado o órgão de sigla ' + qryTxt.FieldByName('SIGLA').AsString);
               end;
           end;
        end;
        // move para o próximo registro
        QryTxt.Next;
        qryTabLocal.Next;
     end
     else
     begin
        if qrytxt.FieldByName('SIGLA').AsString > qryTabOrgao.FieldByName('SIGLA').AsString then
        begin

           if binsereorgao then
           begin
               sSqlUpDate := 'INSERT INTO  ORGAOPREV (SIGLA, IDPESSJUR, NOME) VALUES (''';
               sSqlUpdate := sSqlUpDate + qrytxt.FieldByName('SIGLA').AsString + ''', ';
               sSqlUpdate := sSqlUpDate + inttostr(iPatro) + ', '+quotedstr(qryTxt.FieldbyName('NOME').AsString )+ ')';
               QryUpDate.SQL.Text := sSqlUpdate;
               try
                 QryUpdate.ExecSQL;
               except
                 memoErros.Lines.Add('Não foi inserido o órgão de sigla '+qrytxt.FieldByName('SIGLA').AsString);
               end;
           end;
           // move para o próximo registro do TXT
           QryTxt.Next;
        end
        else
        begin
           // move para o próximo registro dos cargos
           qryTabOrgao.Next;
        end;
     end;
  end;
  dtmBaseDados.dbBaseDados.Commit;
End;

// Inclui posicao Decimal em um valor String
Function TfrmImportaDadosCadastrais.IncluiDecimal(Valor:String;TipoSeparador:String;NumDecimais:Integer):String;
Var
  Posicao:Integer;
Begin
// Caso Numero de Decimais maior ou igual a Valor, Retorna Vazio
  If NumDecimais >= Length(Valor) Then Begin
    Result:='';
    Exit;
  End;
// Caso Tipo de Separador Diferente de . ou , Retorna Vazio
  If (TipoSeparador <> '.') And (TipoSeparador <> ',') Then Begin
    Result:='';
    Exit;
  End;
// Busca Posicao do Decimal
  Posicao:=Length(Valor)-NumDecimais;
// Inclui Decimal na Posicao do Resultado
  Result := Copy(Valor,1,Posicao)+TipoSeparador+Copy(Valor,(Posicao+1),(Length(Valor)-(Posicao)));

end;

function TfrmImportaDadosCadastrais.ConvFormatoOracle(sFormato : string): String;
var i : integer;
    sResultado : String;
begin
   for i := 1 to Length(sFormato) do
       if UpperCase(copy(sFormato,i,1)) = 'A' then
          sResultado := sResultado + 'Y'
       else
          sResultado := sResultado + UpperCase(copy(sFormato,i,1));
   Result := sResultado;
end;

procedure TfrmImportaDadosCadastrais.FormCreate(Sender: TObject);
var dAux : double;
begin
  inherited;
  TabCriticasCcp := TTabCriticasCcp.Create;
  ZeraVar;
  bCad   := true;
end;

function TfrmImportaDadosCadastrais.TiraCaracteres( s : String) : String;
var i : Integer;
    sAux : String;
begin
   i := 1;
   sAux := s;
   while i > 0 do
   begin
      i := 0;

      if pos('.',sAux) > 0 then
      i := pos('.',sAux)
      else if pos(',',sAux) > 0 then
      i := pos(',',sAux)
      else if pos('"',sAux) > 0 then
      i := pos('"',sAux)
      else if pos('(',sAux) > 0 then
      i := pos('(',sAux)
      else if pos(')',sAux) > 0 then
      i := pos(')',sAux)
      else if pos('-',sAux) > 0 then
      i := pos('-',sAux)
      else if pos(' ',sAux) > 0 then
      i := pos(' ',sAux)
      else if pos('''',sAux) > 0 then
      i := pos('''',sAux)
      else if pos('*',sAux) > 0 then
      i := pos('*',sAux);


      sAux := Copy(sAux,0,i-1)+Copy(sAux,i+1,Length(sAux)-i);
   end;


   Result := sAux;
end;


function TfrmImportaDadosCadastrais.TiraPlique( s : String) : String;
var i : Integer;
    sAux : String;
begin

   i := 1;
   sAux := s;
   while i > 0 do
   begin
      i := 0;

      if pos('''',sAux) > 0 then
      i := pos('''',sAux);

      sAux := Copy(sAux,0,i-1)+Copy(sAux,i+1,Length(sAux)-i);
   end;


   Result := sAux;
end;

procedure TfrmImportaDadosCadastrais.bbtnCriticasClick(Sender: TObject);
begin
  inherited;


  frmConsCriticasCcp := TfrmConsCriticasCcp.Create(Application);
  frmConsCriticasCcp.ShowModal;
end;

function TfrmImportaDadosCadastrais.VoltaFlgInterno( qry : Twwquery ; sIdPessjur , sIdPessoa : String; var sTipoSit : String) : String;
begin
   Result := '';
   sTipoSit := '';

   // Se o flginterno na sitpart for cancelado, mas na patrocinadora a pessoa for ativa,
   // nao considerar a pessoa como cancelada e alterar seus dados
   qry.close;
   qry.sql.clear;
   qry.sql.add(' SELECT SIT.FLGINTERNO, SF.TIPOSIT '+
               ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, SITPART SIT, SITFUNC SF  '+
               ' WHERE  EL.IDPESSJUR  = '''+sIdPessjur+''' '+
               ' AND    EL.IDPESSOA   = '''+sIdPessoa+''' '+
               ' AND    PP.IDPESSJUR  = EL.IDPESSJUR '+
               ' AND    PP.IDPESSOA   = EL.IDPESSOA  '+
               ' AND    SF.IDSITFUNC  = EL.IDSITFUNC '+
               ' AND    SIT.IDSITPART = PP.IDSITPART '+
               ' ORDER BY PP.INSCRICAODATA DESC '); 

   try
      qry.open;

      if not qry.isempty
      then begin
         Result := qry.fieldbyname('FLGINTERNO').AsString;
         sTipoSit := qry.fieldbyname('TIPOSIT').AsString;  
      end;
   except
      exit;
   end;

end;


function TfrmImportaDadosCadastrais.IniciaTratCriticas : boolean ;
var sGrupo : String;
begin
   Result := False;

   sUltMes := TabCriticasCcp.PegaUltMes(qryaux, iPatro, '');

   if sUltMes >= Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2)
   then begin
      if MsgDlg('Os dados atuais foram atualizados no ano/mês '+
                ' '''+copy(sUltMes,1,4)+'/'+copy(sUltMes,5,2)+'''. '+
                ' A próxima atualização deve ser feita com um arquivo '+
                'referente a um mês posterior. Deseja refazer? ', 'Confirmação',
                mtConfirmation, [mbYes, mbNo], 0) = mrNo
      then   exit;
   end
   else if sUltMes = Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2)
        then  begin
              if MsgDlg('Os dados deste ano/mês '+
                        ' ('''+copy(sUltMes,1,4)+'/'+copy(sUltMes,5,2)+'''), já foram atualizados.'+
                        ' Deseja refazer a importação? '+chr(13)+
                        'Obs: As críticas anteriores serão apagadas.', 'Confirmação',
                        mtConfirmation, [mbYes, mbNo], 0) = mrNo
              then   exit;
        end;
   Result := True;
end;

// iGrupoCampos =
//  ( 1 = Dados Cadastrais
//    2 = Dependentes
//    3 = Enderecos
//    4 = Documentos
//    5 = Evolucao Funcional
//    6 = Eventos
//    7 = Lotacao
//    8 = Cargo
//    9 = Nivel
//   10 = Filial
//   11 = Orgao
//   12 = Situacao
//   13 = Rubricas
//   14 = Agencias
//   15 = Contatos
//  )
procedure TfrmImportaDadosCadastrais.MontaListaCampos ( piGrupoCampos : word );
var i : integer;
begin

  CkLstCampos.Clear;
  CkLstInsere.clear;

  case piGrupoCampos of
       1 : begin // Dados Cadastrais
              CkLstCampos.Items.Add('CONTA CORRENTE ');
              CkLstCampos.Items.Add('DATA DE NASCIMENTO ');
              CkLstCampos.Items.Add('NOME ');
              CkLstCampos.Items.Add('DATA DE ADMISSÃO ');
              CkLstCampos.Items.Add('SEXO ');
              CkLstCampos.Items.Add('N. DE DEP. IRRF ');
              CkLstCampos.Items.Add('CPF ');
              CkLstCampos.Items.Add('CARGO ');
              CkLstCampos.Items.Add('NIVEL ');
              CkLstCampos.Items.Add('NUM. IDENTIDADE ');
              CkLstCampos.Items.Add('UF IDENTIDADE ');
              CkLstCampos.Items.Add('EXPEDIÇÃO IDENTIDADE ');
              CkLstCampos.Items.Add('CIDADE DE NASCIMENTO ');
              CkLstCampos.Items.Add('NOME DO PAI ');
              CkLstCampos.Items.Add('NOME DA MÃE ');
              CkLstCampos.Items.Add('MATRÍCULA DO CONJUGE ');
              CkLstCampos.Items.Add('TPO.SERV. TOTAL ');
              CkLstCampos.Items.Add('TPO.SERV. NÃO CREDITADO ');
              CkLstCampos.Items.Add('ESTADOCIVIL ');
              CkLstCampos.Items.Add('FILIAL ');
              CkLstCampos.Items.Add('SIT. EMPREGADO ');
              CkLstCampos.Items.Add('VINCULAÇÃO FUNCIONAL ');
              CkLstCampos.Items.Add('INDICADOR DIRETOR ');
              CkLstCampos.Items.Add('FUNCAO ');
              CkLstCampos.Items.Add('DATA DE DEMISSÃO ');
              CkLstCampos.Items.Add('DATA DE READMISSÃO ');
              CkLstCampos.Items.Add('DATA DE FALECIMENTO ');
              CkLstCampos.Items.Add('N. DE DEP. SAL. FAMÍLIA ');
              CkLstCampos.Items.Add('N. DE DEP. TOTAL ');
              CkLstCampos.Items.Add('TPO.SERV. ANTERIOR   ');
              CkLstCampos.Items.Add('TPO.SERV. PUBL. ANT. ');
              CkLstCampos.Items.Add('TPO.SERV. PRIV. ANT. ');
              CkLstCampos.Items.Add('TPO.SERV. ANT. REAL  ');
              CkLstCampos.Items.Add('OPÇÃO 1 NA PATROCINADORA');
              CkLstCampos.Items.Add('OPÇÃO 2 NA PATROCINADORA');
              CkLstCampos.Items.Add('OPÇÃO 3 NA PATROCINADORA');
              CkLstCampos.Items.Add('OPÇÃO 4 NA PATROCINADORA');
              CkLstCampos.Items.Add('OPÇÃO 5 NA PATROCINADORA');
              CkLstCampos.Items.Add('OPÇÃO 6 NA PATROCINADORA');
              CkLstCampos.Items.Add('E-MAIL');

              CkLstInsere.Items.Add('ELEGÍVEL ');
              CkLstInsere.Items.Add('DOC. DE IDENTIDADE ');

              if not bPrimeiraVez1
              then begin
                 CkLstCampos.Checked[0] :=  bAtuconta        ;
                 CkLstCampos.Checked[1] :=  bAtunome         ;
                 CkLstCampos.Checked[2] :=  bAtudatanasc     ;
                 CkLstCampos.Checked[3] :=  bAtudataadm      ;
                 CkLstCampos.Checked[4] :=  bAtusexo         ;
                 CkLstCampos.Checked[5] :=  bAtudepirrf      ;
                 CkLstCampos.Checked[6] :=  bAtucpf          ;
                 CkLstCampos.Checked[7] :=  bAtucargo        ;
                 CkLstCampos.Checked[8] :=  bAtunivel        ;
                 CkLstCampos.Checked[9] :=  bAtuident        ;
                 CkLstCampos.Checked[10] := bAtuufident      ;
                 CkLstCampos.Checked[11] := bAtudtexpident   ;
                 CkLstCampos.Checked[12] := bAtumunnat       ;
                 CkLstCampos.Checked[13] := bAtunomepai      ;
                 CkLstCampos.Checked[14] := bAtunomemae      ;
                 CkLstCampos.Checked[15] := bAtunrmatconj    ;
                 CkLstCampos.Checked[16] := bAtutpservtot    ;
                 CkLstCampos.Checked[17] := bAtutpservnaocred;
                 CkLstCampos.Checked[18] := bAtuESTCIVIL       ;
                 CkLstCampos.Checked[19] := bAtuFILIAL         ;
                 CkLstCampos.Checked[20] := bAtuSITEMPREGADO   ;
                 CkLstCampos.Checked[21] := bAtuVINCULACAOFUNC ;
                 CkLstCampos.Checked[22] := bAtuFLGDIRETOR     ;
                 CkLstCampos.Checked[23] := bAtuFUNCAO         ;
                 CkLstCampos.Checked[24] := bAtuDATADEMISSAO   ;
                 CkLstCampos.Checked[25] := bAtuDATAREADMISSAO ;
                 CkLstCampos.Checked[26] := bAtuDATAMORTE      ;
                 CkLstCampos.Checked[27] := bAtuNUMDEPSALARIOF ;
                 CkLstCampos.Checked[28] := bAtuNUMDEPTOTAL    ;
                 CkLstCampos.Checked[29] := bAtuTPSERVANTERIOR ;
                 CkLstCampos.Checked[30] := bAtuTPSERVPUBLANT  ;
                 CkLstCampos.Checked[31] := bAtuTPSERVPRIVANT  ;
                 CkLstCampos.Checked[32] := bAtuTPSERVANTREAL  ;
                 CkLstCampos.Checked[33] := bAtuVALORBASE1     ;
                 CkLstCampos.Checked[34] := bAtuVALORBASE2     ;
                 CkLstCampos.Checked[35] := bAtuVALORBASE3     ;
                 CkLstCampos.Checked[36] := bAtuVALORBASE4     ;
                 CkLstCampos.Checked[37] := bAtuVALORBASE5     ;
                 CkLstCampos.Checked[38] := bAtuVALORBASE6     ;
                 CkLstCampos.Checked[39] := batuemail     ;

                 CkLstInsere.Checked[0] :=  binserepart        ;
                 CkLstInsere.Checked[1] :=  binsereident       ;
              end;
           end;
       2 : begin //Dependentes
              CkLstCampos.Items.Add('NOME ');
              CkLstCampos.Items.Add('DT. NASCIMENTO ');
              CkLstCampos.Items.Add('SEXO ');
              CkLstCampos.Items.Add('ESTADO CIVIL ');
              CkLstCampos.Items.Add('CONTA PARA IR ');
              CkLstCampos.Items.Add('CONTA PARA SAL.FAMÍLIA ');
              CkLstCampos.Items.Add('INDICADOR DE INVALIDEZ ');
              CkLstCampos.Items.Add('DATA DE INICIO ');
              CkLstCampos.Items.Add('GRAU DE DEPENDÊNCIA ');

              CkLstInsere.Items.Add('DEPENDENTE ');
              if not bPrimeiraVez2
              then begin
                  CkLstCampos.Checked[0]:=  batunomedep        ;
                  CkLstCampos.Checked[1]:=  batudatanascdep    ;
                  CkLstCampos.Checked[2]:=  batusexodep        ;
                  CkLstCampos.Checked[3]:=  batuestcivildep    ;
                  CkLstCampos.Checked[4]:=  batuindirdep       ;
                  CkLstCampos.Checked[5]:=  batuindsalfamdep   ;
                  CkLstCampos.Checked[6]:=  batuindinvalidezdep;
                  CkLstCampos.Checked[7]:=  batudatainiciodep  ;
                  CkLstCampos.Checked[8]:=  batugraudependdep  ;
                  CkLstInsere.Checked[0]:=  binseredep         ;
              end;
           end;
       3 : begin //Enderecos
              CkLstCampos.Items.Add('LOGRADOURO ');
              CkLstCampos.Items.Add('BAIRRO ');
              CkLstCampos.Items.Add('CEP ');
              CkLstCampos.Items.Add('CIDADE ');
              CkLstCampos.Items.Add('UF ');
              CkLstCampos.Items.Add('DDD ');
              CkLstCampos.Items.Add('TELEFONE ');

              CkLstInsere.Items.Add('ENDERECO ');
              CkLstInsere.Items.Add('TELEFONE ');

              if not bPrimeiraVez3
              then begin
                  CkLstCampos.Checked[0]:= batulogradouro     ;
                  CkLstCampos.Checked[1]:= batubairro         ;
                  CkLstCampos.Checked[2]:= batucep            ;
                  CkLstCampos.Checked[3]:= batucidade         ;
                  CkLstCampos.Checked[4]:= batuuf             ;
                  CkLstCampos.Checked[5]:= batutelddd       ;
                  CkLstCampos.Checked[6]:= batutelefone       ;

                  CkLstInsere.Checked[0]:= binsereend         ;
                  CkLstInsere.Checked[1]:= binseretelefone    ;
              end;
           end;
       4 : begin //Documentos
              CkLstCampos.Items.Add('COD. DOCUMENTO');
              CkLstCampos.Items.Add('NUM. DOCUMENTO');
              CkLstCampos.Items.Add('EXPEDIÇÃO DOCUMENTO');
              CkLstCampos.Items.Add('UF DOCUMENTO');

              CkLstInsere.Items.Add('DOCUMENTO');

              if not bPrimeiraVez4
              then begin
                 CkLstCampos.Checked[0]:=   bAtuCodDocumento ;
                 CkLstCampos.Checked[1]:=   bAtuNumDocumento ;
                 CkLstCampos.Checked[2]:=   bAtuDtExpDocumento;
                 CkLstCampos.Checked[3]:=   bAtuUFDocumento  ;

                 CkLstInsere.Checked[0]:=   bInsereDocumento;
              end;
           end;
       5 : begin //Evolucao Funcional
              CkLstCampos.Items.Add('CARGO ');
              CkLstCampos.Items.Add('FUNÇÃO ');
              CkLstCampos.Items.Add('ADICIONAL COMPENSATÓRIO ');
              CkLstCampos.Items.Add('ADIC. TEMPO DE SERVIÇO ');
              CkLstCampos.Items.Add('ADIC. NOTURNO ');
              CkLstCampos.Items.Add('ADIC. PERICULOSIDADE ');
              CkLstCampos.Items.Add('ADIC. INSALUBRIDADE ');


              if not bPrimeiraVez5
              then begin
                 CkLstCampos.Checked[0]:= batucargoef;
                 CkLstCampos.Checked[1]:= batufuncaoef;
                 CkLstCampos.Checked[2]:= batuacef;
                 CkLstCampos.Checked[3]:= batuatsef;
                 CkLstCampos.Checked[4]:= batuadnotef;
                 CkLstCampos.Checked[5]:= batupericulef;
                 CkLstCampos.Checked[6]:= batuinsalubef;
              end;
           end;
       6 : begin //Eventos
              CkLstCampos.Items.Add('SITUAÇÃO DO FUNCIONÁRIO ');
              CkLstInsere.Items.Add('EVENTO ');

              if not bPrimeiraVez7
              then begin
                 CkLstCampos.Checked[0]:=  batuevento      ;
                 CkLstInsere.Checked[0]:=  binsereevento ;
              end;
           end;
       7 : begin //Lotacao
              CkLstCampos.Items.Add('LOCAL ');
              CkLstCampos.Items.Add('ORGÃO ');
              CkLstInsere.Items.Add('LOTAÇÃO ');

              if not bPrimeiraVez7
              then begin
                 CkLstCampos.Checked[0]:=  batulocal      ;
                 CkLstCampos.Checked[1]:=  batuorgao      ;
                 CkLstInsere.Checked[0]:=  binserelotacao ;
              end;
           end;
       8 : begin //Cargo
              CkLstCampos.Items.Add('COD. CARGO ');
              CkLstCampos.Items.Add('DESC. CARGO ');
              CkLstInsere.Items.Add('CARGO ');

              if not bPrimeiraVez8
              then begin
                 CkLstCampos.Checked[0]:=  batucodcargo ;
                 CkLstCampos.Checked[1]:=  batudesccargo;
                 CkLstInsere.Checked[0]:=  binserecargo ;
              end;
           end;
       9 : begin //Nivel
              CkLstCampos.Items.Add('COD. NÍVEL ');
              CkLstCampos.Items.Add('VALOR ');
              CkLstCampos.Items.Add('PONTO DO NÍVEL ');
              CkLstCampos.Items.Add('CT NÍVEL ');
              CkLstInsere.Items.Add('NIVEL ');

              if not bPrimeiraVez9
              then begin
                 CkLstCampos.Checked[0]:=  batucodnivel  ;
                 CkLstCampos.Checked[1]:=  batuvalornivel;
                 CkLstCampos.Checked[2]:=  batupontonivel;
                 CkLstCampos.Checked[3]:=  batuctnivel   ;
                 CkLstInsere.Checked[0]:=  binserenivel  ;
              end;
           end;
      10 : begin //Filial
              CkLstCampos.Items.Add('COD. FILIAL ');
              CkLstCampos.Items.Add('NOME FILIAL ');
              CkLstCampos.Items.Add('TIPO (CAPITAL/INTERIOR)');
              CkLstCampos.Items.Add('SIGLA ');
              CkLstCampos.Items.Add('CGC ');
              CkLstCampos.Items.Add('ATIVA/INATIVA - DATA FINAL ');              

              CkLstInsere.Items.Add('FILIAL ');

              if not bPrimeiraVez10
              then begin
                 CkLstCampos.Checked[0]:=  batucodlocal ;
                 CkLstCampos.Checked[1]:=  batudesclocal;
                 CkLstCampos.Checked[2]:=  batutipolocal;
                 CkLstCampos.Checked[3]:=  batusigla;
                 CkLstCampos.Checked[4]:=  batucgclocal;
                 CkLstCampos.Checked[5]:=  batuativlocal;                 

                 CkLstInsere.Checked[0]:=  binserelocal ;
              end;
           end;
      11 : begin //Orgao
              CkLstCampos.Items.Add('COD. ORGÃO ');
              CkLstCampos.Items.Add('DESCRIÇÃO ');
              CkLstCampos.Items.Add('FILIAL ');
              CkLstInsere.Items.Add('ORGÃO ');

              if not bPrimeiraVez11
              then begin
                 CkLstCampos.Checked[0]:=   batucodorgao  ;
                 CkLstCampos.Checked[1]:=   batudescorgao ;
                 CkLstCampos.Checked[2]:=   batulocalorgao;
                 CkLstInsere.Checked[0]:=   binsereorgao  ;
              end;
           end;
      12 : begin //Situacao
              CkLstCampos.Items.Add('COD. SITUAÇÃO ');
              CkLstCampos.Items.Add('DESC. SITUAÇÃO ');
              CkLstInsere.Items.Add('SITUAÇÃO ');
              if not bPrimeiraVez12
              then begin
                 CkLstCampos.Checked[0]:=  batucodsituacao ;
                 CkLstCampos.Checked[1]:=  batudescsituacao;
                 CkLstInsere.Checked[0]:=  binseresituacao ;
              end;
           end;
      13 : begin //Rubricas
              CkLstCampos.Items.Add('COD. RUBRICA ');
              CkLstCampos.Items.Add('DESCRIÇÃO RUBRICA ');
              CkLstCampos.Items.Add('INDICADOR (PROVENTO/DESCONTO) ');
              CkLstCampos.Items.Add('INCIDÊNCIA NO SALÁRIO ');
              CkLstInsere.Items.Add('RUBRICA ');

              if not bPrimeiraVez13
              then begin
                 CkLstCampos.Checked[0]:= batucodrubrica   ;
                 CkLstCampos.Checked[1]:= batudescrubrica  ;
                 CkLstCampos.Checked[2]:= batutipoindicador;
                 CkLstCampos.Checked[3]:= batuincidesalario;
                 CkLstInsere.Checked[0]:= binsererubrica   ;
              end;

           end;
      14 : begin // Agencias
              CkLstCampos.Items.Add('NOME AGÊNCIA ');

              CkLstInsere.Items.Add('AGÊNCIA ');

              if not bPrimeiraVez14
              then begin
                 CkLstCampos.Checked[0]:= batunomeagencia;
                 CkLstInsere.Checked[0]:= binsereagencia ;
              end;
           end;
      15 : begin // Contatos
              CkLstCampos.Items.Add('NOME CONTATO');
              CkLstCampos.Items.Add('EMAIL CONTATO');
              CkLstCampos.Items.Add('CARGO CONTATO');
              CkLstCampos.Items.Add('SETOR CONTATO');
              CkLstCampos.Items.Add('DATA NASCIMENTO');
              CkLstCampos.Items.Add('OBSERVACAO');

              CkLstInsere.Items.Add('CONTATO');

              if not bPrimeiraVez15
              then begin
                 CkLstCampos.Checked[0]:= bAtuNomeContato;
                 CkLstCampos.Checked[1]:= bAtuEMailContato;
                 CkLstCampos.Checked[2]:= bAtuCargoContato;
                 CkLstCampos.Checked[3]:= bAtuSetorContato;
                 CkLstCampos.Checked[4]:= bAtuNascContato;
                 CkLstCampos.Checked[5]:= bAtuObsContato;

                 CkLstInsere.Checked[0]:= bInsereContato;
              end;
           end;

  end;



  if ((piGrupoCampos = 1)  and (bPrimeiraVez1))  or
     ((piGrupoCampos = 2)  and (bPrimeiraVez2))  or
     ((piGrupoCampos = 3)  and (bPrimeiraVez3))  or
     ((piGrupoCampos = 4)  and (bPrimeiraVez4))  or
     ((piGrupoCampos = 5)  and (bPrimeiraVez5))  or
     ((piGrupoCampos = 6)  and (bPrimeiraVez6))  or
     ((piGrupoCampos = 7)  and (bPrimeiraVez7))  or
     ((piGrupoCampos = 8)  and (bPrimeiraVez8))  or
     ((piGrupoCampos = 9)  and (bPrimeiraVez9))  or
     ((piGrupoCampos = 10) and (bPrimeiraVez10)) or
     ((piGrupoCampos = 11) and (bPrimeiraVez11)) or
     ((piGrupoCampos = 12) and (bPrimeiraVez12)) or
     ((piGrupoCampos = 13) and (bPrimeiraVez13)) or
     ((piGrupoCampos = 14) and (bPrimeiraVez14)) or
     ((piGrupoCampos = 15) and (bPrimeiraVez15))
  then begin
     // Se for a primeira vez, entao trazer como default NADA selecionado, senao marcar o que já estava
     for i := 0 to CkLstCampos.Items.Count -1 do
        CkLstCampos.Checked[i] := False;

     for i := 0 to CkLstInsere.Items.Count -1 do
        CkLstInsere.Checked[i] := False;
  end;

end;

// iGrupoCampos =
//  ( 1 = Dados Cadastrais
//    2 = Dependentes
//    3 = Enderecos
//    4 = Documentos
//    5 = Evolucao Funcional
//    6 = Eventos
//    7 = Lotacao
//    8 = Cargo
//    9 = Nivel
//   10 = Filial
//   11 = Orgao
//   12 = Situacao
//   13 = Rubricas
//   14 = Agencias
//  )
procedure TfrmImportaDadosCadastrais.SetaSelecionados (piGrupoCampos : word );
var i : integer;
begin

   case piGrupoCampos of
        1  : begin // Dados Cadastrais
                batuconta         :=  CkLstCampos.Checked[0];
                batunome          :=  CkLstCampos.Checked[1];
                batudatanasc      :=  CkLstCampos.Checked[2];
                batudataadm       :=  CkLstCampos.Checked[3];
                batusexo          :=  CkLstCampos.Checked[4];
                batudepirrf       :=  CkLstCampos.Checked[5];
                batucpf           :=  CkLstCampos.Checked[6];
                batucargo         :=  CkLstCampos.Checked[7];
                batunivel         :=  CkLstCampos.Checked[8];
                batuident         :=  CkLstCampos.Checked[9];
                batuufident       :=  CkLstCampos.Checked[10];
                batudtexpident    :=  CkLstCampos.Checked[11];
                batumunnat        :=  CkLstCampos.Checked[12];
                batunomepai       :=  CkLstCampos.Checked[13];
                batunomemae       :=  CkLstCampos.Checked[14];
                batunrmatconj     :=  CkLstCampos.Checked[15];
                batutpservtot     :=  CkLstCampos.Checked[16];
                batutpservnaocred :=  CkLstCampos.Checked[17];
                bAtuESTCIVIL        := CkLstCampos.Checked[18];
                bAtuFILIAL          := CkLstCampos.Checked[19];
                bAtuSITEMPREGADO    := CkLstCampos.Checked[20];
                bAtuVINCULACAOFUNC  := CkLstCampos.Checked[21];
                bAtuFLGDIRETOR      := CkLstCampos.Checked[22];
                bAtuFUNCAO          := CkLstCampos.Checked[23];
                bAtuDATADEMISSAO    := CkLstCampos.Checked[24];
                bAtuDATAREADMISSAO  := CkLstCampos.Checked[25];
                bAtuDATAMORTE       := CkLstCampos.Checked[26];
                bAtuNUMDEPSALARIOF  := CkLstCampos.Checked[27];
                bAtuNUMDEPTOTAL     := CkLstCampos.Checked[28];
                bAtuTPSERVANTERIOR  := CkLstCampos.Checked[29];
                bAtuTPSERVPUBLANT   := CkLstCampos.Checked[30];
                bAtuTPSERVPRIVANT   := CkLstCampos.Checked[31];
                bAtuTPSERVANTREAL   := CkLstCampos.Checked[32];
                bAtuVALORBASE1      := CkLstCampos.Checked[33];
                bAtuVALORBASE2      := CkLstCampos.Checked[34];
                bAtuVALORBASE3      := CkLstCampos.Checked[35];
                bAtuVALORBASE4      := CkLstCampos.Checked[36];
                bAtuVALORBASE5      := CkLstCampos.Checked[37];
                bAtuVALORBASE6      := CkLstCampos.Checked[38];
                batuemail           := CkLstCampos.Checked[39];

                binserepart         := CkLstInsere.Checked[0];
                binsereident        := CkLstInsere.Checked[1];
             end;
        2  : begin // Dependentes
                batunomedep         :=  CkLstCampos.Checked[0];
                batudatanascdep     :=  CkLstCampos.Checked[1];
                batusexodep         :=  CkLstCampos.Checked[2];
                batuestcivildep     :=  CkLstCampos.Checked[3];
                batuindirdep        :=  CkLstCampos.Checked[4];
                batuindsalfamdep    :=  CkLstCampos.Checked[5];
                batuindinvalidezdep :=  CkLstCampos.Checked[6];
                batudatainiciodep   :=  CkLstCampos.Checked[7];
                batugraudependdep   :=  CkLstCampos.Checked[8];
                binseredep          := CkLstInsere.Checked[0];
             end;
        3  : begin // Enderecos
                batulogradouro      :=  CkLstCampos.Checked[0];
                batubairro          :=  CkLstCampos.Checked[1];
                batucep             :=  CkLstCampos.Checked[2];
                batucidade          :=  CkLstCampos.Checked[3];
                batuuf              :=  CkLstCampos.Checked[4];
                batutelddd          :=  CkLstCampos.Checked[5];
                batutelefone        :=  CkLstCampos.Checked[6];
                binsereend          := CkLstInsere.Checked[0];
                binseretelefone     := CkLstInsere.Checked[1];
             end;
        4  : begin // Documentos
                bAtuCodDocumento  :=  CkLstCampos.Checked[0];
                bAtuNumDocumento  :=  CkLstCampos.Checked[1];
                bAtuDtExpDocumento:=  CkLstCampos.Checked[2];
                bAtuUFDocumento   :=  CkLstCampos.Checked[3];
                bInsereDocumento  :=  CkLstInsere.Checked[0];
             end;
        5  : begin // Evolucao Funcional
                batucargoef     :=  CkLstCampos.Checked[0];
                batufuncaoef    :=  CkLstCampos.Checked[1];
                batuacef        :=  CkLstCampos.Checked[2];
                batuatsef       :=  CkLstCampos.Checked[3];
                batuadnotef     :=  CkLstCampos.Checked[4];
                batupericulef   :=  CkLstCampos.Checked[5];
                batuinsalubef   :=  CkLstCampos.Checked[5];
             end;
        6  : begin // Eventos
                batuevento      :=  CkLstCampos.Checked[0];
                binsereevento   :=  CkLstInsere.Checked[0];
             end;
        7  : begin // Lotacao
                batulocal           :=  CkLstCampos.Checked[0];
                batuorgao           :=  CkLstCampos.Checked[1];
                binserelotacao      :=  CkLstInsere.Checked[0];
                batulocal           :=  CkLstCampos.Checked[0];
                batuorgao           :=  CkLstCampos.Checked[1];
                binserelotacao      :=  CkLstInsere.Checked[0];
             end;
        8  : begin // Cargo
                batucodcargo        :=  CkLstCampos.Checked[0];
                batudesccargo       :=  CkLstCampos.Checked[1];
                binserecargo        :=  CkLstInsere.Checked[0];
             end;
        9  : begin // Nivel
                batucodnivel        :=  CkLstCampos.Checked[0];
                batuvalornivel      :=  CkLstCampos.Checked[1];
                batupontonivel      :=  CkLstCampos.Checked[2];
                batuctnivel         :=  CkLstCampos.Checked[3];
                binserenivel        :=  CkLstInsere.Checked[0];
             end;
        10 : begin // Filial
                batucodlocal        :=  CkLstCampos.Checked[0];
                batudesclocal       :=  CkLstCampos.Checked[1];
                batutipolocal       :=  CkLstCampos.Checked[2];
                batusigla           :=  CkLstCampos.Checked[3];
                batucgclocal        :=  CkLstCampos.Checked[4];
                batuativlocal       :=  CkLstCampos.Checked[5];

                binserelocal        :=  CkLstInsere.Checked[0];
             end;
        11 : begin // Orgao
                batucodorgao        :=  CkLstCampos.Checked[0];
                batudescorgao       :=  CkLstCampos.Checked[1];
                batulocalorgao      :=  CkLstCampos.Checked[2];
                binsereorgao        :=  CkLstInsere.Checked[0];
             end;
        12 : begin // Situacao
                batucodsituacao     :=  CkLstCampos.Checked[0];
                batudescsituacao    :=  CkLstCampos.Checked[1];
                binseresituacao     :=  CkLstInsere.Checked[0];
             end;
        13 : begin // Rubricas
                batucodrubrica      :=  CkLstCampos.Checked[0];
                batudescrubrica     :=  CkLstCampos.Checked[1];
                batutipoindicador   :=  CkLstCampos.Checked[2];
                batuincidesalario   :=  CkLstCampos.Checked[3];
                binsererubrica      :=  CkLstInsere.Checked[0];
             end;
        14 : begin // Agencias
                batunomeagencia     :=  CkLstCampos.Checked[0];
                binsereagencia      :=  CkLstInsere.Checked[0];
             end;
        15 : begin // Contatos
                bAtuNomeContato    :=  CkLstCampos.Checked[0];
                bAtuEMailContato   :=  CkLstCampos.Checked[1];
                bAtuCargoContato   :=  CkLstCampos.Checked[2];
                bAtuSetorContato   :=  CkLstCampos.Checked[3];
                bAtuNascContato    :=  CkLstCampos.Checked[4];
                bAtuObsContato     :=  CkLstCampos.Checked[5];

                bInsereContato     :=  CkLstInsere.Checked[0];
             end;

   end;
end;



function TfrmImportaDadosCadastrais.CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
var sResult : String;
    i ,iDif : Integer;
begin

   if  Length(trim(sEnt)) > nTam then
       sResult := copy(trim(sEnt),1,nTam)
   else
   begin
       iDif := abs(Length(trim(sEnt)) - nTam);
       sResult := trim(sEnt);

       if bDireita   then
       begin
          for i := 1 to iDif do
          sResult := sResult + sComp;
       end
       else
       begin
          for i := 1 to iDif do
          sResult := sComp + sResult;
       end;
   end;

   Result := sResult;

end;


procedure TfrmImportaDadosCadastrais.ZeraVar;
begin

  bCad         := False;
  bLotacoes    := False;
  bEnd         := False;
  bEventos     := False;
  bDependentes := False;
  bEvolfunc    := False;
  bDocumentos  := False;
  bContatos    := False;

  // Tabelas
  bAgencias    := False;
  bCargos      := False;
  bNiveis      := False;
  bLocais      := False;
  bOrgaos      := False;
  bSit         := False;
  bRubricas    := False;
end;

procedure TfrmImportaDadosCadastrais.dblkPatrocinadoraCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
      //testa se matrícula tem digito verificador
      //tentando transformar em número
      //se não conseguir que dizer que existe um separador
      //ou uma indicação de separação
      try
        strtofloat(qryPatroCombo.FieldByName('MASCMATRICULA').AsString);
        iDigitoBco := 0;
      except
        //verifica se tem separador
        if pos(qryPatroCombo.FieldByName('MASCMATRICULA').AsString,'-') > 0 then
           iDigitoBco := 2
        else
           iDigitoBco := 1;
      end;
end;

procedure TfrmImportaDadosCadastrais.sbtnMarcarTudoClick(Sender: TObject);
var i : word;
begin
  inherited;
  for i:= 0 to CkLstCampos.Items.Count - 1 do
      ckLstCampos.Checked[i] := True;
end;

procedure TfrmImportaDadosCadastrais.sbtnDesmarcarTudoClick(
  Sender: TObject);
var i : word;
begin
  inherited;
  for i:= 0 to CkLstCampos.Items.Count - 1 do
      ckLstCampos.Checked[i] := False;

end;

procedure TfrmImportaDadosCadastrais.sbtnMarcaTudo2Click(Sender: TObject);
var i : word;
begin
  inherited;
  for i:= 0 to CkLstInsere.Items.Count - 1 do
      CkLstInsere.Checked[i] := True;

end;

procedure TfrmImportaDadosCadastrais.sbtnDesmarcaTudo2Click(
  Sender: TObject);
var i : word;
begin
  inherited;
  for i:= 0 to CkLstInsere.Items.Count - 1 do
      CkLstInsere.Checked[i] := False;
end;

procedure TfrmImportaDadosCadastrais.bbtnConfirmaAtuClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.SendToBack;
  SetaSelecionados(iGrupoCampos);
end;

procedure TfrmImportaDadosCadastrais.bbtnCancelaAtuClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.SendToBack;
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuDadosCadClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez1 := False;
  iGrupoCampos  := 1;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuDependentesClick(
  Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez2 := False;
  iGrupoCampos  := 2;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuEnderecosClick(
  Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez3 := False;
  iGrupoCampos  := 3;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuDocumentosClick(
  Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez4 := False;
  iGrupoCampos  := 4;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuEvolFuncClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez5 := False;
  iGrupoCampos  := 5;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuEventosClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez6 := False;
  iGrupoCampos  := 6;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuLocacaoEmpClick(
  Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez7 := False;
  iGrupoCampos  := 7;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuCargosClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez8 := False;
  iGrupoCampos  := 8;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuNiveisClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez9 := False;
  iGrupoCampos  := 9;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuFiliaisClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez10 := False;
  iGrupoCampos  := 10;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuOrgaosClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez11 := False;
  iGrupoCampos  := 11;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuSitFuncClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez12 := False;
  iGrupoCampos  := 12;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuRubricasClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez13 := False;
  iGrupoCampos  := 13;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnAtuAgenciasClick(Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez14 := False;
  iGrupoCampos  := 14;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnDadosCadClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaDadosCad.Text:= OpenDlg.FileName
  else edEntradaDadosCad.Text:= '*.txt';
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.sbtnDependentesClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaDependentes.Text:= OpenDlg.FileName
  else edEntradaDependentes.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnEnderecosClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaEnderecos.Text:= OpenDlg.FileName
  else edEntradaEnderecos.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnDocumentosClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaDocumentos.Text:= OpenDlg.FileName
  else edEntradaDocumentos.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnEvolFuncClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaEvolFunc.Text:= OpenDlg.FileName
  else edEntradaEvolFunc.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnEventosClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaEventos.Text:= OpenDlg.FileName
  else edEntradaEventos.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnLotacaoEmpClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaLotacaoEmp.Text:= OpenDlg.FileName
  else edEntradaLotacaoEmp.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnTabCargosClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaTabCargos.Text:= OpenDlg.FileName
  else edEntradaTabCargos.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnTabNiveisClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaTabNiveis.Text:= OpenDlg.FileName
  else edEntradaTabNiveis.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnTabFiliaisClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaTabFiliais.Text:= OpenDlg.FileName
  else edEntradaTabFiliais.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnTabOrgaosClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaTabOrgaos.Text:= OpenDlg.FileName
  else edEntradaTabOrgaos.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnTabSitFuncClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaTabSitFunc.Text:= OpenDlg.FileName
  else edEntradaTabSitFunc.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnTabRubricasClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaTabRubricas.Text:= OpenDlg.FileName
  else edEntradaTabRubricas.Text:= '*.txt';

end;

procedure TfrmImportaDadosCadastrais.sbtnTabAgenciasClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaTabAgencias.Text:= OpenDlg.FileName
  else edEntradaTabAgencias.Text:= '*.txt';

end;

function TfrmImportaDadosCadastrais.ProcessaArquivo : boolean;
var
         sTextoSQL,
         wNomeArq      : string;
begin

   Result := False;

   if      bCad          then wNomeArq := Trim(edEntradaDadosCad.Text)
   else if bDependentes  then wNomeArq := Trim(edEntradaDependentes.Text)
   else if bEnd          then wNomeArq := Trim(edEntradaEnderecos.Text)
   else if bDocumentos   then wNomeArq := Trim(edEntradaDocumentos.Text)
   else if bEvolFunc     then wNomeArq := Trim(edEntradaEvolFunc.Text)
   else if bEventos      then wNomeArq := Trim(edEntradaEventos.Text)
   else if bLotacoes     then wNomeArq := Trim(edEntradaLotacaoEmp.Text)
   else if bContatos     then wNomeArq := Trim(edEntradaContatosEmp.Text)

   else if bCargos       then wNomeArq := Trim(edEntradaTabCargos.Text)
   else if bNiveis       then wNomeArq := Trim(edEntradaTabNiveis.Text)
   else if bLocais       then wNomeArq := Trim(edEntradaTabFiliais.Text)
   else if bOrgaos       then wNomeArq := Trim(edEntradaTabOrgaos.Text)
   else if bSit          then wNomeArq := Trim(edEntradaTabSitFunc.Text)
   else if bRubricas     then wNomeArq := Trim(edEntradaTabRubricas.Text)
   else if bAgencias     then wNomeArq := Trim(edEntradaTabAgencias.Text);

   if (Trim(wNomeArq) = '') or (UpperCase(Trim(wNomeArq)) = '*.TXT')
   then begin
      Result := True;
      Exit;
   end;
   qryTXT.DataBaseName   := Copy(ExtractFilePath(wNomeArq), 1, Length(ExtractFilePath(wNomeArq)) - 1);
   //
   // Abrir o arquivo de lay-out do arquivo texto que está sendo importado.
   //
   lbMensagens.Lines.Add(TimeToStr(Time)+' - '+ExtractFileName(wNomeArq)+' - Início do processamento.         ');
   lbMensagens.Lines.Add(TimeToStr(Time)+' - '+ExtractFileName(wNomeArq)+' - Verificando Cadastro de Lay-Out. ');
   lblStatus.Caption := 'Verificando Cadastro de Lay-Out ...';

   Application.ProcessMessages;

   if not AbreQryLayOutArquivo
   then begin
      MsgDlg('Erro ao abrir cadastro de Lay-Out.','Erro',mtError,[mbOk],0);
      MemoErros.Lines.Add('Erro ao abrir cadastro de Lay-Out.');
      pbStatus.position := 0;
      pgctrlOpcoes.activepage := tbsErros;
   end;

   //
   // Monta a query
   //
   lblStatus.Caption := 'Buscando informações no banco de dados ...';
   lbMensagens.Lines.Add(TimeToStr(Time)+' - Buscando informações no banco de dados ...');
   Application.ProcessMessages;
   if bCad
   then begin  // Abrir query com os Dados Cadastrais do banco de dados
       sTextoSql :=  'SELECT /*+RULE*/ EL.IDPESSOA,                                                                           '+
                     '       EL.MATRICULA, ' +
                     '       B.NUMBANCO,  AB.NUMAGENCIA,   CB.CONTACORRENTE, '+
                     '       PE.NOME, ' +
                     '       TO_CHAR(PF.DATAMORTE,      ''' + ConvFormatoOracle(qryLayOutArquivo.FieldByName('DCFTDTMORTE').AsString)      + ''') AS DATAMORTE,      '+
                     '       TO_CHAR(EL.DATAADMISSAO,   ''' + ConvFormatoOracle(qryLayOutArquivo.FieldByName('DCDTADMFORMATO').AsString)   + ''') AS DATAADMISSAO,   '+
                     '       TO_CHAR(PF.DATANASC,       ''' + ConvFormatoOracle(qryLayOutArquivo.FieldByName('DCDTNASCFORMATO').AsString)  + ''') AS DATANASC,       '+
                     '       TO_CHAR(EL.DATADEMISSAO,   ''' + ConvFormatoOracle(qryLayOutArquivo.FieldByName('DCFTDTDEMISSAO').AsString)   + ''') AS DATADEMISSAO,   '+
                     '       TO_CHAR(EL.DATAREADMISSAO, ''' + ConvFormatoOracle(qryLayOutArquivo.FieldByName('DCFTDTREADMISSAO').AsString) + ''') AS DATAREADMISSAO, '+
                     '       PF.SEXO , '+
                     '       PF.ESTCIVIL, ' +
                     '       PF.NUMDEPIRRF, PE.NUMDOCUMENTO, EL.IDCARGOEXT, CX.TITULO, EL.NIVEL , RTRIM(CX.CODIGO) AS CODIGO, '+
                     '       PF.IDCIDADES, PF.NOMEPAI, PF.NOMEMAE, EL.TEMPOSERVTOTAL, EL.TEMPONAOCREDITADO, ' +
                     '       EL.TEMPOSERVANTERIOR, F.NUMFILIAL, EL.IDSITFUNC, EL.TEMPOSERVPUBLANT,  '+
                     '       EL.TEMPOSERVPRIVANT, EL.FLGDIRETOR, EL.TEMPOSERVANTREAL, EL.IDFUNCAOEXT, RTRIM(FUNCAO.CODIGO) AS CODFUNCAO, '+
                     '       EL.CODVINCULAFUNC , EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3, '+
                     '       EL.VALORBASE4, EL.VALORBASE5, EL.VALORBASE6, PE.EMAIL '+
                     ' FROM   PESSOA PE, PESSOAFISICA PF, ELEGPATRO EL, '+
                     '        CONTABANCARIA CB,  AGENCIABANCARIA AB, BANCO B,   '+
                     '        FILIALPESSOA F, CARGOEXT CX, CARGOEXT FUNCAO  '+
                     ' WHERE  EL.IDPESSJUR   = '+IntToStr(iPatro)+
                     ' AND    PE.IDPESSOA    = EL.IDPESSOA          '+
                     ' AND    PF.IDPESSOA    = PE.IDPESSOA          '+
                     ' AND    PE.IDPESSOA    = CB.IDPESSOA(+)       '+
                     ' AND    CB.IDAGENCIA   = AB.IDPESSOA(+)       '+
                     ' AND    AB.IDBANCO     = B.IDPESSOA(+)        '+
                     ' AND    EL.IDESTAB     = F.IDFILIALPESSOA(+)  '+
                     ' AND    EL.IDPESSJUR   = CX.IDPESSJUR(+)      '+
                     ' AND    EL.IDCARGOEXT  = CX.IDCARGOEXT(+)     '+
                     ' AND    EL.IDPESSJUR   = FUNCAO.IDPESSJUR(+)  '+
                     ' AND    EL.IDFUNCAOEXT = FUNCAO.IDCARGOEXT(+) '+
                     ' ORDER BY EL.MATRICULA                        ';
       qryDadosNoBanco.Close;
       qryDadosNoBanco.SQL.Text := sTextoSql;
       qryDadosNoBanco.Open;       // Abre a query com todos as pessoas cadastradas
    end
    else if blotacoes then
    begin  // Lotações
       /// BUSCA LOTAÇÕES DOS PARTICIPANTES
       sTextoSQL := 'SELECT ';
       qryLotacao.Close;
       qryLotacao.SQL.Text := sTextoSql;
       qryLotacao.Open;
    end
    else if bend then
    begin  // Abrir query com os Enderecos do banco de dados
        //dentro da função de importação
    end
    else if bDocumentos
    then begin
       sTextoSql :=  ' SELECT /*+RULE*/ EL.IDPESSOA,   EL.MATRICULA,    D.IDDOCUMENTO,      '+
                     '        D.IDPESSOA,    D.NUMDOCUMENTO,  D.ORGAO,            '+
                     '        D.IDIMAGEM,    D.IDPAIS,        ES.CODESTADO AS UF, '+
                     '        TO_CHAR(D.DATAEMISSAO,  ''' + ConvFormatoOracle(qryLayOutArquivo.FieldByName('DOFTEMISSAO').AsString) + ''') AS DATAEMISSAO, '+
                     '        TO_CHAR(D.DATAVALIDADE, ''' + ConvFormatoOracle(qryLayOutArquivo.FieldByName('DOFTVALIDADE').AsString) + ''') AS DATAVALIDADE, '+
                     '        D.IDESTADO  '+
                     ' FROM   PESSOA          PE,                                 '+
                     '        DOCPESSOA       D,                                  '+
                     '        ELEGPATRO       EL,                                 '+
                     '        ESTADO          ES                                  '+
                     ' WHERE  EL.IDPESSJUR        = '+IntToStr(iPatro)+
                     ' AND    PE.IDPESSOA         = EL.IDPESSOA                   '+
                     ' AND    EL.IDPESSOA         = D.IDPESSOA(+)                 '+
                     ' AND    D.IDESTADO          = ES.IDESTADO(+)                '+
                     ' ORDER BY  EL.MATRICULA, D.IDDOCUMENTO                      ';
       qryDadosNoBanco.Close;
       qryDadosNoBanco.SQL.Text := sTextoSql;
       qryDadosNoBanco.Open;
    end
    else if bContatos
    then begin
       sTextoSql :=  ' SELECT /*+RULE*/ EL.IDPESSOA,   EL.MATRICULA,                        '+
                     '        C.NOME,        C.EMAIL,         C.CARGO,            '+
                     '        C.SETOR,       C.OBS,           EP.IDENDERECO,      '+
                     '        TO_CHAR(C.NASCIMENTO,  '''+ ConvFormatoOracle(qryLayOutArquivo.FieldByName('CTNASCFORMA').AsString) + ''') AS NASCIMENTO '+
                     ' FROM   PESSOA PE,                                          '+
                     '        ENDPESS EP,                                         '+
                     '        ELEGPATRO       EL,                                 '+
                     '        CONTATOPESS     C                                   '+
                     ' WHERE  EL.IDPESSJUR        = '+IntToStr(iPatro)+
                     ' AND    PE.IDPESSOA         = EL.IDPESSOA                   '+
                     ' AND    EP.IDENDERECO       = PE.IDENDRESIDENCIAL           '+
                     ' AND    EP.IDENDERECO       = C.IDENDERECO(+)               '+
                     ' ORDER BY  EL.MATRICULA, C.NOME                             ';
       qryDadosNoBanco.Close;
       qryDadosNoBanco.SQL.Text := sTextoSql;
       qryDadosNoBanco.Open;
    end
    else if beventos then
    begin  // Eventos
    End
    else if bagencias then
    begin
      qryTabBancos.Open;  // Bancos e Agências
    end
    else if bcargos then
    begin  // Cargo
       qryTabCargos.ParamByName('IdPessjur').AsInteger := iPatro;
       qryTabCargos.Open;
    end
    else if bniveis then
    begin  // Nível
    end
    else if blocais then
    begin  // Locais
    end
    else if borgaos then
    begin  // Órgãos da Patrocinadora
       if qryTabOrgao.Active then qryTabOrgao.Close;
       qryTabOrgao.ParamByName('IDPESSJUR').AsInteger := iPatro;
       qryTabOrgao.Open;
    end
    else if bsit then
    begin  // Eventos --> Situação dos participantes
       qryTabSituacoes.ParamByName('IDPESSJUR').AsInteger := iPatro;
       qryTabSituacoes.Open;
    end
    else if brubricas then
    begin  // Rubricas
       qryTabRubricas.Close;
       qryTabRubricas.ParamByName('idpessjur').AsInteger := iPatro;
       qryTabRubricas.Open;
    end;

   Screen.Cursor:=crHourGlass;
   lbMensagens.Lines.Add(TimeToStr(Time)+' - Abrindo o TXT ');
   Application.ProcessMessages;
   lbMensagens.Lines.Add(TimeToStr(Time)+' - Iniciando a criação do arquivo temporário  ');
   lblStatus.Caption := 'Iniciando a criação do arquivo temporário  ...';
   Application.ProcessMessages;

   try
      // Criar tabela temporária de acordo com lay-out
      if not CriaTabelaPDX(wNomeArq, 'TMPPATRO.DB', tblDadosPatro)
      then begin
         MsgDlg('Criação da Tabela Temporária com Erros. Processo Abortado.','Erro',mtError,[mbOk],0);
         MemoErros.Lines.Add('Erro ao criar Tabela Temporária.');
         if tblDadosPatro <> nil then
         begin
            tblDadosPatro.Close;
            tblDadosPatro.Free;
         end;
         Exit;
      end;

      if not DefineEstruturaTabelaPDX(tblDadosPatro)
      then begin
         MsgDlg('Criação da Estrutura da Tabela Temporária com Erros. Processo Abortado.','Erro',mtError,[mbOk],0);
         MemoErros.Lines.Add('Erro ao criar Estrutura da Tabela Temporária.');
         if tblDadosPatro <> nil then
         begin
            tblDadosPatro.Close;
            tblDadosPatro.Free;
         end;
         Exit;
      end;

      // Carregar tabela temporária com conteúdo do TXT
      if not CarregaTabelaPDX(wNomeArq, tblDadosPatro)
      then begin
         MsgDlg('Preenchimento Tabela Temporária com Erros. Processo Abortado.','Erro',mtError,[mbOk],0);
         MemoErros.Lines.Add('Erro ao Preencher Tabela Temporária.');
         if tblDadosPatro <> nil then
         begin
            tblDadosPatro.Close;
            tblDadosPatro.Free;
         end;
         Exit;
      end;

      lblStatus.Caption := 'Classificando dados ...';
      lbMensagens.Lines.Add(TimeToStr(Time)+' - Iniciando a classificação dos dados ');
      Application.ProcessMessages;

      with qryTXT do
      begin
         Close;
         SQL.Clear;

         if bDependentes
            then SQL.Add(' SELECT * FROM TMPPATRO ORDER BY MATRICULA, SEQDEP ')
         else if bDocumentos
            then SQL.Add(' SELECT * FROM TMPPATRO ORDER BY MATRICULA, IDDOCUMENT ')
         else if bContatos
            then SQL.Add(' SELECT * FROM TMPPATRO ORDER BY MATRICULA, NOME ')
         else if (bLocais) or (bRubricas) or (bAgencias)
            then SQL.Add(' SELECT * FROM TMPPATRO  ')
         else if (bEvolFunc)
            then SQL.Add(' SELECT * FROM TMPPATRO ORDER BY MATRICULA, TIPOREG, DTINICARGO ')
         else if (bCad)   // SOL: 107249 Daniel Begnami
            then SQL.Add(' SELECT DISTINCT * FROM TMPPATRO ORDER BY MATRICULA ')
         else SQL.Add(' SELECT * FROM TMPPATRO ORDER BY MATRICULA ');
         // FIM

         Open;
      end;

      //
      qryPatro.Close;
      qryPatro.ParamByName('CODPATRO').AsInteger:=iPatro;
      qryPatro.Open;

      //
      lblStatus.Caption := 'Gravando alterações ...';
      lbMensagens.Lines.Add(TimeToStr(Time)+' - Inicio da gravação das alterações ');
      Application.ProcessMessages;
      //
      qryTxt.First;
      sMesCob      := copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2);

      memoErros.Lines.Clear;
      memodivergencias.Lines.Clear;


      If Not dtmBaseDados.dbBaseDados.InTransaction
      Then  dtmBaseDados.dbBaseDados.StartTransaction;

      if bcad then begin
          TabCriticasCcp.Apaga(qryaux,iPatro,Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2),gCadastro);
          TabCriticasCcp.InicializaSeq(qryaux,dSeqCritica);
          IMPORTADADOSCADASTRAIS;
      end else if bend then begin
          TabCriticasCcp.Apaga(qryaux,iPatro,Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2),gEndereco);
          TabCriticasCcp.InicializaSeq(qryaux,dSeqCritica);
          ImportaEndereco
      end else if bDocumentos then begin
          TabCriticasCcp.Apaga(qryaux,iPatro,Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2),gDocumentos);
          TabCriticasCcp.InicializaSeq(qryaux,dSeqCritica);
          ImportaDocumentos
      end else if bContatos then begin
          TabCriticasCcp.InicializaSeq(qryaux,dSeqCritica);
          ImportaContatos
      end else if blotacoes then begin
          ImportaLotacao
      end else if beventos then begin
          TabCriticasCcp.Apaga(qryaux,iPatro,Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2),gEvento);
          TabCriticasCcp.InicializaSeq(qryaux,dSeqCritica);
          ImportaEventos
      end else if bDependentes then begin
          TabCriticasCcp.Apaga(qryaux,iPatro,Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2),gDependentes);
          TabCriticasCcp.InicializaSeq(qryaux,dSeqCritica);
          ImportaDependentes
      end else if bEvolFunc then begin
          TabCriticasCcp.Apaga(qryaux,iPatro,Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2),gEvolFunc);
          TabCriticasCcp.InicializaSeq(qryaux,dSeqCritica);
          ImportaEvolFunc;
      end else if bagencias  then begin
          TabCriticasCcp.Apaga(qryaux,iPatro,Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2),gAgencia);
          TabCriticasCcp.InicializaSeq(qryaux,dSeqCritica);
          ImportaTabelaBanco
      end else if bcargos then begin
          ImportaTabelaCargos
      end else if bniveis then begin
          ImportaTabelaNivel
      end else if blocais then begin
          TabCriticasCcp.Apaga(qryaux,iPatro,Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2),gFilial);
          TabCriticasCcp.InicializaSeq(qryaux,dSeqCritica);
          ImportaTabelaLocal
      end else if borgaos then begin
          ImportaTabelaOrgao
      end else if bsit then begin
          ImportaTabelaSituacoes
      end else if brubricas then begin
          TabCriticasCcp.Apaga(qryaux,iPatro,Copy(deDataCob.Text,7,4)+Copy(deDataCob.Text,4,2),gRubrica);
          TabCriticasCcp.InicializaSeq(qryaux,dSeqCritica);
          ImportaTabelaRubricas;
      end;

   finally
      tblDadosPatro.Free;
   end;
   Result := True;
end;

procedure TfrmImportaDadosCadastrais.sbtnContatosEmpClick(Sender: TObject);
begin
  inherited;
  if OpenDlg.Execute
  then edEntradaContatosEmp.Text:= OpenDlg.FileName
  else edEntradaContatosEmp.Text:= '*.txt';
  MontaListaCampos ( iGrupoCampos );

end;

procedure TfrmImportaDadosCadastrais.sbtnAtuContatosEmpClick(
  Sender: TObject);
begin
  inherited;
  pnlAtualizaAuto.BringToFront;
  bPrimeiraVez15 := False;
  iGrupoCampos  := 15;
  MontaListaCampos ( iGrupoCampos );
end;

procedure TfrmImportaDadosCadastrais.SpeedButton2Click(Sender: TObject);
var i : Integer;
begin
  inherited;
  for i:= 0 to CkLstInsere.Items.Count - 1 do
      CkLstInsere.Checked[i] := True;
end;

procedure TfrmImportaDadosCadastrais.SpeedButton3Click(Sender: TObject);
var i : Integer;
begin
  inherited;
  for i:= 0 to CkLstInsere.Items.Count - 1 do
      CkLstInsere.Checked[i] := False;
end;

end.



