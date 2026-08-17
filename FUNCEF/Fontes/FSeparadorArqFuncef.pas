unit FSeparadorArqFuncef;

// Alterações:
{ ------------------------------------------------------------------------------
Pendencia   : Sol 127323 Kintana 674396
Responsável : Ádler Souza
Data        : 10/05/2010
Descrição   : Incluir os campos DATA DE NOMEAÇÃO e DATA DE EXONERAÇÃO.
--------------------------------------------------------------------------------
Rotina........: IMPORTADADOSCADASTRAIS
N. Sol........: 128443
N. Kintana....: 689369
Data..........: 14/12/2009
Responsável...: Renato Visoni
Descrição.....: Verificar o flag IGNORAR Cancelados Descartar Cancelados e Analisar a SQL que
faz as devidas marcações das contas preferenciais.
----------------------------------------------------------------------------------------------------
Autor(a)    :  Jéssica Lana
Data        :  20/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
--------------------------------------------------------------------------------
Rotina    : GravaModulosCadastrais e GravaEvolFunc
Data      : 22/10/2009
Autor     : Renato Visoni
Pendencia : SOL 99238 / Kintana 435001
Descrição : Foi colocado um If para trocar o cargo do funcionario quando for TBSN para TSN
            else if (COPY(CD_CARGO,1,4) = 'TBSN') then CD_CARGO := 'TSN'  + Trim(NR_REF_SALL)
--------------------------------------------------------------------------------------------------
Rotina    : BuscaPessoa
Data      : 22/09/2009
Autor     : Renato Visoni
Pendencia : SOL 96527 / Kintana 418285
Descrição : Coloquei o If (trim(LRegEmpregado.CD_TIP_ASSOC_PPREV) <> '') pois estava dando um erro
            ao tentar converter Branco '' para integer.
--------------------------------------------------------------------------------------------------
Rotina    : BuscaPessoa
Data      : 18/09/2009
Autor     : Renato Visoni
Pendencia : SOL 96325 / Kintana 417110
Descrição : Coloquei a condição  'AND(strToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) = 8)'.
--------------------------------------------------------------------------------------------------
Rotina    : BuscaPessoa
Data      : 16/09/2009
Autor     : Renato Visoni
Pendencia : SOL 96039 / Kintana 415375
Descrição : Quando o evento for de Cancelamento de Plano, filtrar o plano que nao está ativo. 
--------------------------------------------------------------------------------------------------
Rotina    : ConversaoEmpregados
Data      : 23/10/2007
Autor     : Bruno Bastos
Pendencia : 26479
Descrição : Inicializar a variável bRetorno antes da função que atualiza a mesma.
----------------------------------------------------------------------------------------------------
Rotina    : GravaModulosCadastrais(...) e GravaEvolFunc
Data      : 22/10/2007
Autor     : Bruno Bastos
Pendencia : 26478
Descrição : Inclusão de nova função conforme EBM.
----------------------------------------------------------------------------------------------------
Rotina    : GravaModulosCadastrais
Data      : 09/07/2007
Autor     : Hugo e Gustavo
Pendencia : 24157
Descrição : implementando a validação do CPF, passando '' se estiver inválido. 
----------------------------------------------------------------------------------------------------
Rotina    : GravaModulosCadastrais(...) e GravaEvolFunc
Data      : 09/07/2007
Autor     : André Pontes
Pendencia : 25654
Descrição : Novo cargo: 'CONTR2'
----------------------------------------------------------------------------------------------------
Autor(a)  : Paulo Ramos
Data      : 28/05/2007
Pendência : 25465
Rotina    : bbtnConfirmarClick
Alteração : Ajuste no controle de hora para tratar virada do dia.
----------------------------------------------------------------------------------------------------
Autor(a)  : Paulo Ramos
Data      : 16/05/2007
Pendência : 25243
Rotina    : BuscaPessoa e GravaModulosCadastrais
Alteração : Implementa atualização cadastral segundo as novas condições:
            - apenas para associados ativos (flginterno = 'AT').
            - caso o associado tenha apenas INSS atualizar todas as informações
              exceto conta bancária. Neste caso colocar, no arquivo, os dados bancários como brancos.
            - caso o associado tenha benefício fundação não efetuar atualização cadastral.
----------------------------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 19/04/2007
Pendência : 25064
Rotina    : GravaModulosCadastrais e GravaEvolFunc
Alteração : Inclusão de várias novas funçoes conforme EBM.
----------------------------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 19/04/2007
Pendência : 25105
Rotina    : GravaModulosCadastrais e GravaEvolFunc
Alteração : Inclusão de vários novos cargos conforme EBM.
----------------------------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 23/03/2007
Pendência : 24832
Rotina    : GravaModulosCadastrais e GravaEvolFunc
Alteração : Correção no de-para de cargos.
----------------------------------------------------------------------------------------------------
Autor(a)  : Gleyber
Data      : 21/03/2007
Pendência : 24508
Rotina    : GravaModulosCadastrais e GravaEvolFunc
Alteração : Inclusão de vários cargos conforme EBM.
----------------------------------------------------------------------------------------------------
Autor(a)  : Claudio Faria
Data      : 19.09.2006
Pendência : 23222
Rotina    : GravaModulosCadastrais
Alteração : Inclusão de cargos conforme EBM, criados pela CAIXA
----------------------------------------------------------------------------------------------------
Autor(a)  : Bruno Bastos
Data      : 21.08.2006
Pendência : 22811
Rotina    : ConversaoConsigEspeciais
Alteração : Aumentar o tamanho dos campos conta corrente, de 8 para 11, e
            do dígito verificador de 1 para 2.
----------------------------------------------------------------------------------------------------
Autor(a)  : André Pontes
Data      : 26.07.2006
Pendência : 22846
Rotina    : Várias (novas) + GravaEventos
Alteração : Tratamento de gravação de evento de inscrição no novo plano +
            gravação de arquivo de log com as inconsistências
----------------------------------------------------------------------------------------------------
Autor(a)  : Bruno Bastos
Data      : 04.07.2006
Pendência : 22748
Rotina    : GravaEvolFunc
Alteração : Gravar no arquivo a data final do cargo anterior com um dia
            antes da data de início do cargo atual.
----------------------------------------------------------------------------------------------------
Autor(a)  : Bruno Bastos
Data      : 19.06.2006
Pendência : 22540
Rotina    : GravaEvolFunc
Alteração : Gravar no arquivo para o campo CD_FUNCAO_TB30_5 o modo função
            como NE.
----------------------------------------------------------------------------------------------------
Autor(a)  : Bruno Bastos
Data      : 14.06.2006
Pendência : 22336
Rotina    : GravaEvolFunc
Alteração : Gravar no arquivo, o registro do cargo anterior ao atual.
----------------------------------------------------------------------------------------------------
Autor(a)  : Paulo Ramos
Data      : 01.06.2006
Pendência : 22454
Rotina    : ConversaoEmpregados
Alteração : Como o arquivo SRH11 vem apenas com os 4 primeiros dígitos do
            número da agência, deve-se filtrar na consulta que obtém as
            agências bancárias cadastradas apenas as "ativas".
----------------------------------------------------------------------------------------------------
Autor(a)  : Bruno Bastos
Data      : 25.04.2006
Pendência : 22105
Rotina    : GravaEvolFunc
Alteração : Gravar no arquivo, o registro da função anterior ao atual.
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 22.03.2006
Pendência : 21506
Rotina    : GravaEvolFunc
Alteração : alteração conforme EBM, inclusão da função CD_FUNCAO_TB30_7, modo 'DP' de Prazo Determinado
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 16.03.2006
Pendência : 21323
Rotina    : GravaModulosCadastrais
Alteração : alteração conforme EBM, linha (CD_CARGO = 'ARQTSP') or (CD_CARGO = 'ARQTJS') or (CD_CARGO = 'ARQS6H')
----------------------------------------------------------------------------------------------------
Autor(a)  : Augusto
Data      : 03.03.2006
Pendência : 21536
Rotina    : GravaEvolFunc
Alteração : acerto na modificação imediatemente abaixo
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 24.02.2006
Pendência : 21536
Rotina    : GravaEvolFunc
Alteração : caso exista DT_IN_EXER_FUNCAO_TB30_2, colocar, ao contrário da crítica anterior onde o CD_FUNCAO
            CD_FUNCAO_TB30_2
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 23.11.2005
Pendência : 19842
Rotina    : GravaEventos
Alteração : verifica se o evento que será gravado já existe
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 16.11.2005
Pendência : 20763
Rotina    : GravaEvolFunc
Alteração : caso a variável sidpessoa não esteja preenchida, busca pela matrícula. Isso acontece com novas inscrições.
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 19.10.2005
Pendência : 20408
Rotina    : ConversaoAgenciasEFiliais
Alteração : acrescentei o campo de data fim da filial, W01_DT_FM_UNID, ao arquivo de sáida
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 27.09.2005
Pendência : 20027
Rotina    : ConversaoConsigEspeciais
Alteração : estava pegando o campo IDFILIALPESSOA da qryaux, que não existia mais
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 28.07.2005
Pendência : 19836
Rotina    : ConversaoConsigEspeciais
Alteração : inclusão do banco NU_BANCO em LRegConsigEspecial , e modificação no tratamento para busca da agência
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 14.07.2005
Pendência : 19696
Rotina    : ConversaoEmpregados
Alteração : inclusão da cláusula FLGATIVO na query de busca da Filial
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 02.06.2005
Pendência : 19402
Rotina    : DE/PARA DE CARGOS E FUNÇÕES
Alteração : acrescentei a seguinte linha
            else if (CD_CARGO = 'ENGSTJ') or (CD_CARGO = 'ENGSTP') or (CD_CARGO = 'ENGSTS')  then CD_CARGO := 'ER'+Trim(NR_REF_SALL)  //leofuncef - 02062005
----------------------------------------------------------------------------------------------------
Autor(a)  : Leo
Data      : 05.05.2005
Rotina    : GravaEventos
Alteração : modificações para gerar linha de inscrição para participantes cancelados em outros planos
            e para reenscrições
---------------------------------------------------------------------------------------------------}



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, BfDialogs, BrowseFolder, uProcuraDir,
  Db, DBTables, Wwquery, Wwtable, DBClient, uCMClientDataSet, uCmSqlParams,
  uCMFileUtils, shellapi, uFuncoesFuncef, uValidaDoc, uSistema;

type

//------------------------------------------------------------------------------
// Tipos Declarados para Manipular as Linhas do Arquivo Saída

     TEmpregado = Record
                      NR_MATR_EMP             : String[6];
                      DV_MATR_EMP             : String[1];
                      NO_EMP                  : String[40];

                      CD_CPF_EMP              : String[11];
                      CD_VINCULACAO_FUN          : String[2];

                      UNID_LOT                : String[4];
                      UNID_CC                 : String[4];
                      OPR_CC                  : String[3];
                      NR_CC                   : String[8];
                      DV_CC                   : String[1];
                      DT_ADMISSAO             : String[10];
                      DT_PRV_DESL             : String[10];
                      CD_CARGO                : String[6];
                      NR_REF_SALL             : String[6];

                      CD_ORIG_EMP             : String[2];
                      CD_FUNCAO               : String[4];
                      CD_TIP_ASSOC_PPREV      : String[2];
                      DT_ASSOC_PPREV          : String[10];

                      NO_LOGR                 : String[50];
                      NO_BAI                  : String[20];
                      NO_CIDADE               : String[22];
                      SI_UF                   : String[2];
                      CD_CEP                  : String[8];
                      NR_TEL                  : String[7];

                      CD_SEXO                 : String[1];
                      DT_NASC                 : String[10];
                      NR_CI                   : String[12];

                      SI_UF_EXP_CI            : String[2];
                      DT_EXPD_CI              : String[10];
                      CD_MUN_NAT              : String[6];
                      NO_PAI                  : String[40];
                      NO_MAE                  : String[40];
                      CD_EST_CIV              : String[1];

                      NR_MATR_CONJ            : String[6];
                      QT_TPO_SERV_CEF         : String[6];
                      QT_TPO_SERV_PUB         : String[6];
                      QT_TPO_SERV_PRIV        : String[6];

                      DT_ADMISSAO_SASSE       : String[10];
                      CD_SUREG_LOT            : String[3];
                      DT_IN_ABONO_PERM        : String[10];
                      ID_AUX_PECULIO          : String[1];

                      DT_DESL_PPREV           : String[10];
                      TP_ADIC                 : String[1];
                      PC_ADIC                 : String[4];
                      DT_IN_EMP_CARGO_AT      : String[10];
                      ID_CLUBE_IMOB           : String[1];
                      CD_PIS_PASEP            : String[11];
                      CD_CARGO_ANT            : String[10];
                      NR_REF_SALL_ANT         : String[6];
                      DT_CARGO_ANT            : String[10];
                      CD_CARGO_TB74           : String[6];
                      NR_REF_SALL_TB74        : String[6];

                      DT_IN_BOLSA_CG_TB74     : String[10];
                      DT_FM_BOLSA_CG_TB74     : String[10];

                      QT_DIAS_ESTAGIO_TB74    : String[10];

                      CD_FUNCAO_TB30          : String[4];
                      DT_IN_EXER_FUNCAO_TB30  : String[10];
                      DT_FM_EXER_FUNCAO_TB30  : String[10];
                      QT_DIAS_EXER_FUNCAO_TB30: String[4];

                      CD_FUNCAO_TB30_2        : String[4];
                      DT_IN_EXER_FUNCAO_TB30_2: String[10];
                      DT_FM_EXER_FUNCAO_TB30_2 : String[10];

                      CD_FUNCAO_TB30_3         : String[4];
                      DT_IN_EXER_FUNCAO_TB30_3 : String[10];
                      DT_FM_EXER_FUNCAO_TB30_3 : String[10];

                      DT_IN_OCOR_TB28         : String[10];

                      CD_FUNCAO_TB30_4        : String[4];
                      DT_IN_EXER_FUNCAO_TB30_4: String[10];
                      DT_FM_EXER_FUNCAO_TB30_4: String[10];

                      CD_FUNCAO_TB28_2        : String[4];
                      PC_ADIC_TB28_2          : String[6];
                      DT_IN_OCOR_TB28_2       : String[10];
                      CD_OCOR_TB23            : String[2];

                      FLG_DIRETOR             : String[1];
                      DT_IN_CARG_DIR_TB29     : String[10];
                      DT_FM_CARG_DIR_TB29     : String[10];

                      PC_ADIC_TB28_3          : String[6];
                      DT_IN_OCOR_TB28_3       : String[10];

                      PC_ADIC_TB28_4          : String[6];
                      DT_IN_OCOR_TB28_4       : String[10];

                      CD_FUNCAO_TB60          : String[4];
                      DT_IN_OCOR_TB60         : String[10];
                      DT_IN_AD_NOT_TB60       : String[10];
                      PC_ADIC_TB60            : String[6];
                      QT_MIN_OCOR_TB60        : String[5];

                      CD_FUNCAO_TB30_5        : String[4];
                      DT_IN_EXER_FUNCAO_TB30_5 : String[10];
                      DT_FM_EXER_FUNCAO_TB30_5 : String[10];

                      CD_FUNCAO_TB30_6         : String[4];
                      DT_IN_EXER_FUNCAO_TB30_6 : String[10];
                      DT_FM_EXER_FUNCAO_TB30_6 : String[10];

                      CD_FUNCAO_TB30_7         : String[4];
                      DT_IN_EXER_FUNCAO_TB30_7 : String[10];
                      DT_FM_EXER_FUNCAO_TB30_7 : String[10];

                      PC_LER_TB_TB30_4         : String[6];
                      PC_PPREV_TB9A            : String[6];
                      DT_READMISSAO            : String[10];
                      NO_EMAIL1                : String[60];
                      NO_EMAIL2                : String[60];

                      NUMDEPIRRF               : String[6];
                      NUMDEPSALF               : String[6];
                      NUMDEPTOTAL              : String[6];
                  End;

     TDependente = Record
                      NR_MATR_EMP   : String[6];
                      SQ_DEP        : String[2];
                      NO_DEP        : string[40];
                      DT_NASC_DEP   : String[10];
                      CD_SEXO       : String[1];
                      CD_EST_CIV    : String[1];
                      CD_REL_DEPND  : String[1];
                      ID_IR         : String[1];
                      ID_INVALIDEZ  : String[1];
                      ID_SF_CEF     : String[1];
                      ID_SF_INSS    : String[1];
                      DT_IN_DEP     : String[10];
                      ID_RECB_PECULIO : String [1];
                      CD_TIP_DEP_PAMS : String[1];
                      DT_FM_CATR_PAMS : String[10];
                End;


     TConsigEspecial = Record
                      NR_MATR_EMP          : String[6];
                      SQ_COSIG_ESP         : String[2];
                      CD_TIP_COSIG_ESP     : String[1];
                      NO_COSI_ESP          : String[40];
                      CD_CPF_COSIG_ESP     : String[11];
                      CD_UNID_CC           : String[4];
                      CD_OPR_CC            : String[3];
                      //Bruno Bastos - Pend. 22811 - NR_CC                : String[8];
                      //Bruno Bastos - Pend. 22811 - DV_CC                : String[1];
                      NR_CC                : String[11]; //Bruno Bastos - Pend. 22811
                      DV_CC                : String[2];  //Bruno Bastos - Pend. 22811
                      PC_INC               : String[9];
                      QT_DEP_SF            : String[2];
                      NU_BANCO             : String[3];                      
                  End;

     THistOcorFunc = Record
                      NR_MATR_EMP          : String[6];
                      CD_OCOR              : String[4];
                      DT_IN_LICA           : String[10];
                  End;


     TRubricas = Record
                      CD_RUB               : String[3];
                      NO_RUB               : String[50];
                      CD_TIP_RUB           : String[1];
                  End;


     TUnidOper = Record
                      W01_CD_SUREG         : String[3];
                      W01_CD_UNID          : String[4];
                      W01_DV_UNID          : String[1];
                      W01_DT_IN_UNID       : String[10];
                      W01_NO_UNID          : String[40];
                      W01_SI_UNID          : String[8];
                      W01_NO_LOGR          : String[50];
                      W01_NO_BAI           : String[20];
                      W01_NO_CIDADE        : String[22];
                      W01_SI_UF            : String[2];
                      W01_CD_CEP           : String[8];
                      W01_CD_CLAS_UNID     : String[2];
                      W01_DT_FM_UNID       : String[10];
                      W01_ID_CAP_INT       : String[1];
                      W01_CD_CGC           : String[14];
                      W01_CD_TIP_UNID      : String[2];
                      W01_CD_DDD           : String[4];
                      W01_NR_TEL_1         : String[8];
                      W01_NR_RAMAL_1       : String[4];
                      W01_NR_RAMAL_2       : String[4];
                      W01_NR_TEL_2         : String[8];
                      W01_NR_RAMAL_3       : String[4];
                      W01_CD_CEADM         : String[3];
                  End;




//------------------------------------------------------------------------------

  TfrmSeparadorArqFuncef = class(TfrmOkCancelar)
    ProcuraDirDlg1: TProcuraDirDlg;
    GroupBox1: TGroupBox;
    lblPathArqProc: TLabel;
    btnArqProcessar: TSpeedButton;
    edCaminhoEntrada: TEdit;
    grpArquivos: TGroupBox;
    lblArqGravar: TLabel;
    spedArqGravar: TSpeedButton;
    edArqGravar: TEdit;
    qryFilial: TwwQuery;
    Label1: TLabel;
    qryAgencia: TwwQuery;
    tblDepen: TwwTable;
    qryDBFDepen: TwwQuery;
    qryAux: TwwQuery;
    tblOcorr: TwwTable;
    GroupBox2: TGroupBox;
    ScrollBox1: TScrollBox;
    Label3: TLabel;
    Label4: TLabel;
    chkEmpregados: TCheckBox;
    chkConsigEsp: TCheckBox;
    chkHistOcorFunc: TCheckBox;
    chkRubricas: TCheckBox;
    chkUnidOper: TCheckBox;
    chkDependentes: TCheckBox;
    GroupBox3: TGroupBox;
    lblBarraProgresso: TLabel;
    pBar: TProgressBar;
    sqlParam: TCMSqlParams;
    cdsBuscaPessoa: TCMClientDataSet;
    GroupBox4: TGroupBox;
    chkAssistidos: TCheckBox;
    chkCancelados: TCheckBox;
    chkMantidos: TCheckBox;
    cdsAux: TCMClientDataSet;
    Panel1: TPanel;
    memresult: TRichEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SaveDlg: TSaveDialog;
    chkAtivos: TCheckBox;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    edarqmat: TEdit;
    odTxt: TOpenDialog;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnArqProcessarClick(Sender: TObject);
    procedure spedArqGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    LRegEmpregado                   : TEmpregado;
    LRegDependente                  : TDependente;
    tIni, tFim                      : TDateTime;
    Contador                        : Integer;
    LRegConsigEspecial              : TConsigEspecial;
    LRegHistOcorFunc                : THistOcorFunc;
    LRegRubricas                    : TRubricas;
    LRegUnidOper                    : TUnidOper;


    wArquivoImportacao,
    wArquivoImportacaoAux,
    wArquivoImpDepen,
    wArquivoImpEvolFunc,
    wArquivoGravacaoModCad,
    wArquivoGravacaoEnd,
    wArquivoGravacaoDocPessoa,
    wArquivoGravacaoContatoPess,
    wArquivoGravacaoEvento,
    wArquivoGravacaoDepen,
    wArquivoConsigEspeciais,
    wArquivoHistOcorFunc,
    wArquivoRubricas,
    wArquivoMat  : TextFile;

    wLinha,
    wLinhaGrava , wLinhaMat       : String;

    function  VerificaArquivo       ( Arquivo    : String )             : boolean;
    function  VerificaTamArquivo                                        : longint;

    Procedure ConversaoEmpregados;
    Procedure ConversaoDependentes;
    Procedure ConversaoAgenciasEFiliais;
    Procedure ConversaoConsigEspeciais;
    Procedure ConversaoHistOcorFunc;
    Procedure ConversaoRubricas;

    Function BuscaPessoa(
      sMat : String;
      var sIdPessjur,
          sIdPessoa,
          sIdPlanoPrev,
          sFlgInterno,
          sIdSitPart,
          sIdSitFunc,
          sIdSitPlanoPrev,
          sIdPessjurCedido,
          sInscricaoData : String;
      var pbRetorno : integer) : Boolean;
    //VALORES POSSÍVEIS SÃO:
    // 0 - NÃO TEM BENEFÍCIO
    // 1 - PESSOA TEM BENEFÍCIO FUNCEF
    // 2 - PESSOA TEM APENAS BENEFÍCIO INSS

    Procedure GravaModulosCadastrais(
      pbGravaConta : boolean 
      );

    Procedure GravaEnderecos;
    Procedure GravaDepend;
    Procedure GravaEventos;
    Procedure GravaDocPessoa;
    Procedure GravaContatoPess;
    Procedure GravaEvolFunc;


   // gravação de arquivo de log -------------------------------------------------------------------
    function LogToFile(const sLog     : String;
                       const sArq     : String;
                             sPasta   : String;
                       const bHora    : Boolean = True;
                       const bNovoArq : Boolean = False
                      ): Boolean;

   // manipulação de Strings -----------------------------------------------------------------------
    function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
    function CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
   // ----------------------------------------------------------------------------------------------


  public
    function TrataData(var sEntrada : String) : String;
    function TrataNumero(var sEntrada : String; nDec : Integer) : String;
    { Public declarations }
  end;

var
  frmSeparadorArqFuncef: TfrmSeparadorArqFuncef;

  CMValidaDoc: TCMValidaDoc;
  sIdPessjur, sMatriculaAnt, sIdPessoa , sIdPlanoPrev,
  sFlgInterno, sQtdeMinutos, sAux ,
  sIdSitPart, sIdSitFunc , sIdSitPlanoPrev, sIdPessjurCedido,
  sInscricaoData : String;
  iTamArquivo : Integer;



implementation

Uses uDataBAse, UMensErro,  DBaseDados, UModuloFuncef, uCmControlObject,
  FSeparadorArqFinanc;


{$R *.DFM}


Function TfrmSeparadorArqFuncef.VerificaArquivo(Arquivo : String):Boolean;
begin
  Result := True;
   // Testa se Arquivo Especificado Existe
  If (Not (FileExists(Arquivo)))
  Then Begin
    MsgDlg('O arquivo '+Arquivo+ ' não foi encontrado no caminho especificado. Verifique. ', 'Erro', mtError, [mbOk],0);
    edCaminhoEntrada.SetFocus;
    Result := False;
  End;
end;

procedure TfrmSeparadorArqFuncef.bbtnConfirmarClick(Sender: TObject);
var bFaltaArq : Boolean;
begin
  inherited;
  memResult.Lines.Clear;


  bFaltaArq := false;

  if chkConsigEsp.Checked then
  begin
     if not VerificaArquivo(edCaminhoEntrada.text+'\SRH2.txt')
     then begin
        memResult.Lines.Add('Arquivo de Consignatários Especiais (SRH2.TXT) não encontrado.');
        bFaltaArq := true;
     end;
  end;

  if chkHistOcorFunc.Checked then
  begin
     if not VerificaArquivo(edCaminhoEntrada.text+'\SRH5.txt')
     then begin
        memResult.Lines.Add('Arquivo de Histórico de Ocorrências Funcionais (SRH5.TXT) não encontrado.');
        bFaltaArq := true;
     end;

     if not VerificaArquivo(edCaminhoEntrada.text+'\SRH19.txt')
     then begin
        memResult.Lines.Add('Arquivo de PADV (SRH19.TXT) não encontrado.');
        bFaltaArq := true;
     end;
  end;

  if chkRubricas.Checked then
  begin
     if not VerificaArquivo(edCaminhoEntrada.text+'\SRH8.txt')
     then begin
        memResult.Lines.Add('Arquivo de Rubricas (SRH8.TXT) não encontrado.');
        bFaltaArq := true;
     end;

     if not VerificaArquivo(edCaminhoEntrada.text+'\SRH9.txt')
     then begin
        memResult.Lines.Add('Arquivo de Rubrica - Tipo Rubricas (SRH9.TXT) não encontrado.');
        bFaltaArq := true;
     end;

  end;

  if chkDependentes.Checked then
  begin
     if not VerificaArquivo(edCaminhoEntrada.text+'\SRH13.txt')
     then begin
        memResult.Lines.Add('Arquivo de Dependentes (SRH13.TXT) não encontrado.');
        bFaltaArq := true;
     end;
  end;

  if chkEmpregados.Checked then
  begin
     if not VerificaArquivo(edCaminhoEntrada.text+'\SRH16.txt')
     then begin
        memResult.Lines.Add('Arquivo de Empregados (SRH16.TXT) não encontrado.');
        bFaltaArq := true;
     end;
  end;

  if chkUnidOper.Checked then
  begin
     if not VerificaArquivo(edCaminhoEntrada.text+'\SRH11.txt')
     then begin
        memResult.Lines.Add('Arquivo de Unidades Operacionais (SRH11.TXT) não encontrado.');
        bFaltaArq := true;
     end;
  end;

  if bFaltaArq then
  begin
     MsgDlg('Alguns arquivos não foram encontrados. Verifique descrição.','Importação OK',mtInformation,[MbOk],0);
     exit;
  end;

  Contador:= 0;
  tIni := Now;

  if chkConsigEsp.Checked then
  begin
     lblBarraProgresso.Visible := True;
     lblBarraProgresso.Caption := 'Separando arquivo: Consignatários Especiais - SRH2';
     Application.ProcessMessages;

     ConversaoConsigEspeciais;
  end;

  if chkHistOcorFunc.Checked then
  begin
     lblBarraProgresso.Visible := True;
     lblBarraProgresso.Caption := 'Separando arquivo: Histórico de Ocorrências Funcionais - SRH5';
     Application.ProcessMessages;

     ConversaoHistOcorFunc;
  end;

  if chkRubricas.Checked then
  begin
     lblBarraProgresso.Visible := True;
     lblBarraProgresso.Caption := 'Separando os arquivos de rubricas - SRH8 e SRH9';
     Application.ProcessMessages;

     ConversaoRubricas;
  end;

  if chkDependentes.Checked then
  begin
     lblBarraProgresso.Visible := True;
     lblBarraProgresso.Caption := 'Separando o arquivo: Dependentes - SRH13';
     Application.ProcessMessages;

     ConversaoDependentes;

     qryDBFDepen.Close;
  end;

  if chkEmpregados.Checked then
  begin
     lblBarraProgresso.Visible := True;
     lblBarraProgresso.Caption := 'Separando o arquivo: Empregados - SRH16';
     Application.ProcessMessages;

     ConversaoEmpregados;
  end;

  if chkUnidOper.Checked then
  begin
     lblBarraProgresso.Visible := True;
     lblBarraProgresso.Caption := 'Separando o arquivo: Unidades Operacionais - SRH11';
     Application.ProcessMessages;

     ConversaoAgenciasEFiliais
  end;

  // Mostra Tempo da Importação
  Application.ProcessMessages;
  tFim := Now;
  MsgDlg('Início :   '+formatdatetime('dd/mm/yyyy hh:nn:ss', tIni)+#13+
         ' Final :   '+formatdatetime('dd/mm/yyyy hh:nn:ss', tFim)+#13+
         '             ---------------'+#13+
         ' Tempo : '+TempoDecorrido(tIni, tFim)+#13#13+
         'Número de Registros : '+IntToStr(Contador)+#13#13,
         'Importação OK',mtInformation,[MbOk],0);
end;



function  TfrmSeparadorArqFuncef.VerificaTamArquivo  : longint;
var iTam : longint;
    sAux : string;
begin
   Result := 0;
   iTam   := 0;
   while not Eof(wArquivoImportacao) do
   begin
      Readln(wArquivoImportacao, sAux);
      inc(iTam);
   end;

   // Voltar arquivo para o inicio
   CloseFile(wArquivoImportacao);
   Reset(wArquivoImportacao);

   Result := iTam;
end;

Procedure TfrmSeparadorArqFuncef.GravaModulosCadastrais(
  pbGravaConta : boolean 
  );
Var
  iTempoServAnt,
  iTempoServTotal : Integer;
  DataAtual       : String ;
  slNUMFILIAL,
  slNUMAGENCIA,
  slIDSITFUNC,
  slFLGDIRETOR,
  slDATAMORTE,
  sEmail     : string;
begin

   // Gravar Novo Registro no Arquivo Texto de Saída de Dados Cadastrais do Empregado

  // Lay-Out do Arquivo de Modulos Cadastrais
  // CAMPO                  INICIO            TAM
  // MATRICULA              0                 7
  // NOME                   7                 40
  // CPF                    47                11
  // CONTACORRENTE          58                12
  // DATA ADMISSAO          70                10
  // CARGO                  80                12
  // SEXO                   92                1
  // DATA NASCIMENTO        93                10
  // NUM. CART. IDENT       103               12
  // UF. CART. IDENT        115               2
  // DATA CART. IDENT       117               10
  // NATURALIDADE - MUNIC.  127               6
  // NOME PAI               133               40
  // NOME MAE               173               40
  // ESTADO CIVIL           213               1
  // MATRICULA CONJUGE      214               6
  // TEMPO SERV. ANTERIOR   220               6
  // TEMPO SERV. TOTAL      226               6
  // NUMFILIAL              232               15
  // IDSITFUNC              247               10
  // SALTOTAL               257               15
  // DATADEMISSAO           272               10
  // DATAINICIOAFAST        282               10
  // DATAFIMAFAST           292               10
  // TEMPOSERVPUBLANT       302               6
  // TEMPOSERVPRIVANT       308               6
  // FLGDIRETOR             314               1
  // TEMPOSERVANTREAL       315               6
  // FUNCAO                 321               6
  // DATAREADMISSAO         327               10
  // VINCULACAO FUNCIONAL   337               5
  // DATAMORTE              342               10
  // BANCO                  352               3
  // AGENCIA                355               5
  // NUMDEPIRRF             360               2
  // NUMDEPSALAROF          362               2
  // NUMDEPTOT              364               2

  // FALTA GRAVAR **********************************************************************************
  // VALORBASE1             ???               10
  // VALORBASE2             ???               10
  // VALORBASE3             ???               10

   // Tratar campos que precisam de manipulação para serem gravados
   with LRegEmpregado do
   begin
      // ELEGPATRO.TEMPOSERVANTERIOR
      iTempoServAnt   := 0;
      if trim(QT_TPO_SERV_PUB) = '' then QT_TPO_SERV_PUB := '0';
      if trim(QT_TPO_SERV_PRIV) = '' then QT_TPO_SERV_PRIV := '0';
      iTempoServAnt   :=  (StrToInt(QT_TPO_SERV_PUB) + StrToInt(QT_TPO_SERV_PRIV)) ;

      // ELEGPATRO.TEMPOSERVTOTAL
      iTempoServTotal := 0;
      if trim(QT_TPO_SERV_PUB) = '' then QT_TPO_SERV_PUB := '0';
      if trim(QT_TPO_SERV_PRIV) = '' then QT_TPO_SERV_PRIV := '0';
      if trim(QT_TPO_SERV_CEF) = '' then QT_TPO_SERV_CEF := '0';
      iTempoServTotal :=  (StrToInt(QT_TPO_SERV_PUB) + StrToInt(QT_TPO_SERV_PRIV) + StrToInt(QT_TPO_SERV_CEF));

      // hugo - pedência 24157 - 01/10/2007
      //PESSOAFISICA.CPF
      CMValidaDoc.TipoDocumento := tdCPF;
      CMValidaDoc.NumDocumento := CD_CPF_EMP;

      if Trim(CD_CPF_EMP) <> '' then
        if (not CMValidaDoc.DocumentoValido) or
        {Caso o CPF for zerado, passar vazio ('')}
           (CD_CPF_EMP = '00000000000') then
          CD_CPF_EMP := '';

      // PESSOAFISICA.DATAMORTE
      if CD_OCOR_TB23 = '25'
      then slDataMorte := DT_PRV_DESL
      else slDataMorte := '';

      // PESSOAFISICA.ESTCIVIL
      if Trim(CD_EST_CIV) <> ''
      then begin
         if CD_EST_CIV = '1' then CD_EST_CIV := 'S' else
         if CD_EST_CIV = '2' then CD_EST_CIV := 'C' else
         if CD_EST_CIV = '3' then CD_EST_CIV := 'V' else
         if CD_EST_CIV = '4' then CD_EST_CIV := 'E' else
         if CD_EST_CIV = '5' then CD_EST_CIV := 'D' else
         if CD_EST_CIV = '6' then CD_EST_CIV := 'J'
         else  CD_EST_CIV := 'S';
      end;

      // ELEGPATRO.IDCARGOEXT
           if (CD_CARGO = 'ADRECJ') or (CD_CARGO = 'ADRECP') or (CD_CARGO = 'ADRECS')  then CD_CARGO := 'AR'+Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ADV0GJ') or (CD_CARGO = 'ADV0GP') or (CD_CARGO = 'ADV0GS')
           or (CD_CARGO = 'ADV08J') or (CD_CARGO = 'ADV08P') or (CD_CARGO = 'ADV08P')
           or (CD_CARGO = 'ADV08S')                                                    then CD_CARGO := 'AD'+Trim(NR_REF_SALL) 
      else if (COPY(CD_CARGO,1,4) = 'ADV8')                                            then CD_CARGO := 'ADV'+Trim(NR_REF_SALL)+'8'
      else if (CD_CARGO = 'ARQTJR') or (CD_CARGO = 'ARQTPL') or (CD_CARGO = 'ARQTSR')
           or (CD_CARGO = 'ARQTSP') or (CD_CARGO = 'ARQTJS') or (CD_CARGO = 'ARQS6H')  then CD_CARGO := 'AQ'+Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ENGCVJ') or (CD_CARGO = 'ENGCVP') or (CD_CARGO = 'ENGCVS')  then CD_CARGO := 'EV'+Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ENGTLJ') or (CD_CARGO = 'ENGTLP') or (CD_CARGO = 'ENGTLS')  then CD_CARGO := 'ET'+Trim(NR_REF_SALL)
      else if (CD_CARGO = 'MEDTBJ') or (CD_CARGO = 'MEDTBP') or (CD_CARGO = 'MEDTBS')  then CD_CARGO := 'MT'+Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ENGSTJ') or (CD_CARGO = 'ENGSTP') or (CD_CARGO = 'ENGSTS')  then CD_CARGO := 'ER'+Trim(NR_REF_SALL)

      else if (COPY(CD_CARGO,1,4) = 'TBSN')                                            then CD_CARGO := 'TSN'  + Trim(NR_REF_SALL) //Renato Visoni SOL 99238 / Kintana 435001
      else if (COPY(CD_CARGO,1,3) = 'TBS')                                             then CD_CARGO := Trim(CD_CARGO) + Trim(NR_REF_SALL)
      else if (COPY(CD_CARGO,1,2) = 'TB')                                              then CD_CARGO := Trim(CD_CARGO) + COPY(NR_REF_SALL ,1,3)+'6'
      else if (CD_CARGO = 'ENGAGJ') or (CD_CARGO = 'ENGAGP') or (CD_CARGO = 'ENGAGS')  then CD_CARGO := 'EA'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ENGSNJ') or (CD_CARGO = 'ENGSNP') or (CD_CARGO = 'ENGSNS')  then CD_CARGO := 'ST'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ENGMCJ') or (CD_CARGO = 'ENGMCP') or (CD_CARGO = 'ENGMCS')  then CD_CARGO := 'EM'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ENGFLJ') or (CD_CARGO = 'ENGFLP') or (CD_CARGO = 'ENGFLS')  then CD_CARGO := 'EF'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ENGELJ') or (CD_CARGO = 'ENGELP') or (CD_CARGO = 'ENGELS')  then CD_CARGO := 'EE'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ENGAMJ') or (CD_CARGO = 'ENGAMP') or (CD_CARGO = 'ENGAMS')  then CD_CARGO := 'AB'  + Trim(NR_REF_SALL)

      else if (CD_CARGO = 'ARQUI6') or (CD_CARGO = 'ARQUI8')                           then CD_CARGO := 'ART'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ADMIN6') or (CD_CARGO = 'ADMIN8')                           then CD_CARGO := 'ADT'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ADMRC6') or (CD_CARGO = 'ADMRC8')                           then CD_CARGO := 'ADR'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ADVOG6') or (CD_CARGO = 'ADVOG8')                           then CD_CARGO := 'ADO'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ASSOC6') or (CD_CARGO = 'ASSOC8')                           then CD_CARGO := 'ATS'  + Trim(NR_REF_SALL)
      else if (COPY(CD_CARGO,1,5) = 'DENT6') or (COPY(CD_CARGO,1,5) = 'DENT8')         then CD_CARGO := 'DET'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ENGEN6') or (CD_CARGO = 'ENGEN8')                           then CD_CARGO := 'EGH'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'PSICO6') or (CD_CARGO = 'PSICO8')                           then CD_CARGO := 'PSC'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'COMSO6') or (CD_CARGO = 'COMSO8')                           then CD_CARGO := 'CMS'  + Trim(NR_REF_SALL)
      else if (COPY(CD_CARGO,1,5) = 'CONT6') or (COPY(CD_CARGO,1,5) = 'CONT8')         then CD_CARGO := 'COT'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ECONO6') or (CD_CARGO = 'ECONO8')                           then CD_CARGO := 'ECN'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ENSET6') or (CD_CARGO = 'ENSET8')                           then CD_CARGO := 'EGT'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ENTEL6') or (CD_CARGO = 'ENTEL8')                           then CD_CARGO := 'ETC'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ESTAT6') or (CD_CARGO = 'ESTAT8')                           then CD_CARGO := 'ETT'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'SOCIO6') or (CD_CARGO = 'SOCIO8')                           then CD_CARGO := 'SCI'  + Trim(NR_REF_SALL)
      else if (COPY(CD_CARGO,1,5) = 'VPRES')                                           then CD_CARGO := 'VCP001'
      else if (CD_CARGO = 'MEDIC6') or (CD_CARGO = 'MEDIC8')                           then CD_CARGO := 'MEO'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ANSIS6') or (CD_CARGO = 'ANSIS8')                           then CD_CARGO := 'ANL'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'MEDTR6') or (CD_CARGO = 'MEDTR8')                           then CD_CARGO := 'MDT'  + Trim(NR_REF_SALL)

      else if (CD_CARGO = 'ENGAG6')                                                    then CD_CARGO := 'EG'  + Trim(NR_REF_SALL) + '6'
      else if (CD_CARGO = 'ENGAM6')                                                    then CD_CARGO := 'EB'  + Trim(NR_REF_SALL) + '6'
      else if (CD_CARGO = 'ENGCV6')                                                    then CD_CARGO := 'EI'  + Trim(NR_REF_SALL) + '6'
      else if (CD_CARGO = 'ENGEL6')                                                    then CD_CARGO := 'EL'  + Trim(NR_REF_SALL) + '6'
      else if (CD_CARGO = 'ENGFL6')                                                    then CD_CARGO := 'EN'  + Trim(NR_REF_SALL) + '6'
      else if (CD_CARGO = 'ENGMC6')                                                    then CD_CARGO := 'EC'  + Trim(NR_REF_SALL) + '6'
      else if (CD_CARGO = 'ENGSN6')                                                    then CD_CARGO := 'ES'  + Trim(NR_REF_SALL) + '6'
      else if (CD_CARGO = 'ENGAG8')                                                    then CD_CARGO := 'EG'  + Trim(NR_REF_SALL) + '8'
      else if (CD_CARGO = 'ENGAM8')                                                    then CD_CARGO := 'EB'  + Trim(NR_REF_SALL) + '8'
      else if (CD_CARGO = 'ENGCV8')                                                    then CD_CARGO := 'EI'  + Trim(NR_REF_SALL) + '8'
      else if (CD_CARGO = 'ENGEL8')                                                    then CD_CARGO := 'EL'  + Trim(NR_REF_SALL) + '8'
      else if (CD_CARGO = 'ENGFL8')                                                    then CD_CARGO := 'EN'  + Trim(NR_REF_SALL) + '8'
      else if (CD_CARGO = 'ENGMC8')                                                    then CD_CARGO := 'EC'  + Trim(NR_REF_SALL) + '8'
      else if (CD_CARGO = 'ENGSN8')                                                    then CD_CARGO := 'ES'  + Trim(NR_REF_SALL) + '8'

      else if (CD_CARGO = 'CONTR2')                                                    then CD_CARGO := 'CT'  + '0002'

      else if (COPY(CD_CARGO,1,3) = 'MED') or (COPY(CD_CARGO,1,3) = 'DEN')             then CD_CARGO := Trim(CD_CARGO) + COPY(NR_REF_SALL ,1,2)+'6'
      else if Trim(Copy(NR_REF_SALL ,3,1)) = ''                                        then CD_CARGO := Trim(CD_CARGO) + COPY(NR_REF_SALL ,1,2)+'8'
      else if (Trim(Copy(NR_REF_SALL ,3,1)) <> '') and (Copy(NR_REF_SALL ,1,1)  = '8') then CD_CARGO := Trim(CD_CARGO) + COPY(NR_REF_SALL ,1,3)+'4'
      else if Trim(COPY(CD_CARGO, 4,1)) <> ''                                          then CD_CARGO := CD_CARGO
      else CD_CARGO := Trim(CD_CARGO) + COPY(NR_REF_SALL ,1,3) + '8';

      // ELEGPATRO.IDESTAB
      with qryFilial do
      begin
         if Locate('FILIALARQ', UNID_LOT, [loCaseInsensitive])
         then slNUMFILIAL := FieldByName('NUMFILIAL').AsString
         else slNUMFILIAL := '';
      end;

      // ELEGPATRO.AGENCIA
      // OBS : Se nao encontrar agencia, gravar valor original do arquivo para
      // o programa dar a mensagem de erro
      with qryAgencia do
      begin
         if UNID_CC = '0000'
         then slNumAgencia := ''
         else if Locate('AGENCIAARQ', UNID_CC, [loCaseInsensitive])
              then slNUMAGENCIA := FieldByName('NUMAGENCIA').AsString
              else slNUMAGENCIA := UNID_CC;
      end;

      if (NR_CC = '00000000') or not pbGravaConta then 
      begin
        OPR_CC := '';
        NR_CC  := '';
        DV_CC  := '';
      end;

      // ELEGPATRO.IDSITFUNC
      slIDSITFUNC := '';

      if      CD_OCOR_TB23 = '16' then slIDSITFUNC := '18'
      else if CD_OCOR_TB23 = '19' then slIDSITFUNC := '32'
      else if CD_OCOR_TB23 = '17' then slIDSITFUNC := '24'
      else if CD_OCOR_TB23 = '18' then slIDSITFUNC := '33'
      else if CD_OCOR_TB23 = '20' then slIDSITFUNC := '34'
      else if CD_OCOR_TB23 = '21' then slIDSITFUNC := '35'
      else if CD_OCOR_TB23 = '22' then slIDSITFUNC := '36'
      else if CD_OCOR_TB23 = '23' then slIDSITFUNC := '37'
      else if CD_OCOR_TB23 = '25' then slIDSITFUNC := '39'
      else if CD_OCOR_TB23 = '26' then slIDSITFUNC := '54'
      else if CD_OCOR_TB23 = '27' then slIDSITFUNC := '38'
      else if CD_OCOR_TB23 = '51' then slIDSITFUNC := '73';

      if slIDSITFUNC = '' then slIDSITFUNC := '8'; //ativo

      // ELEGPATRO.DATADEMISSAO
      if not ((CD_OCOR_TB23 = '16') or
              (CD_OCOR_TB23 = '17') or
              (CD_OCOR_TB23 = '18') or
              (CD_OCOR_TB23 = '19') or
              (CD_OCOR_TB23 = '20') or
              (CD_OCOR_TB23 = '21') or
              (CD_OCOR_TB23 = '22') or
              (CD_OCOR_TB23 = '23') or
              (CD_OCOR_TB23 = '26') or
              (CD_OCOR_TB23 = '25') or
              (CD_OCOR_TB23 = '27'))
      then DT_PRV_DESL := ' ';

      // ELEGPATRO.FLGDIRETOR
      //Ádler Souza - Sol 134214  Kintana 787470
{      if (Trim(DT_IN_CARG_DIR_TB29) <> '') and (Trim(DT_IN_CARG_DIR_TB29) <> '01.01.0001')
      then slFLGDIRETOR := '1'
      else slFLGDIRETOR := '0';}

      if (Trim(DT_IN_CARG_DIR_TB29) <> '01.01.0001') and
         (Trim(DT_FM_CARG_DIR_TB29) <> '01.01.0001') and
         (Trim(DT_IN_CARG_DIR_TB29) <> '') and
         (Trim(DT_FM_CARG_DIR_TB29) <> '')
      then slFLGDIRETOR := '1'
      else slFLGDIRETOR := '0';
      //Fim - Ádler Souza - Sol 134214  Kintana 787470

      // ELEGPATRO.IDFUNCAO
      if      Trim(CD_FUNCAO) =  '113' then CD_FUNCAO :=  '203'
      else if Trim(CD_FUNCAO) =  '115' then CD_FUNCAO :=  '204'
      else if Trim(CD_FUNCAO) =  '116' then CD_FUNCAO :=  '205'
      else if Trim(CD_FUNCAO) =  '118' then CD_FUNCAO :=  '206'
      else if Trim(CD_FUNCAO) =  '119' then CD_FUNCAO :=  '207'
      else if Trim(CD_FUNCAO) =  '142' then CD_FUNCAO :=  '208'
      else if Trim(CD_FUNCAO) =  '145' then CD_FUNCAO :=  '209'
      else if Trim(CD_FUNCAO) =  '191' then CD_FUNCAO :=  '210'
      else if Trim(CD_FUNCAO) =  '192' then CD_FUNCAO :=  '211'
      else if Trim(CD_FUNCAO) =  '193' then CD_FUNCAO :=  '212'
      else if Trim(CD_FUNCAO) =  '194' then CD_FUNCAO :=  '213'
      else if Trim(CD_FUNCAO) =  '195' then CD_FUNCAO :=  '214'
      else if Trim(CD_FUNCAO) =  '198' then CD_FUNCAO :=  '215'
      else if Trim(CD_FUNCAO) =  '199' then CD_FUNCAO :=  '216'
      else if Trim(CD_FUNCAO) =  '122' then CD_FUNCAO :=  '176'

      else if Trim(CD_FUNCAO) =  '624' then CD_FUNCAO :=  '217'
      else if Trim(CD_FUNCAO) =  '621' then CD_FUNCAO :=  '218'
      else if Trim(CD_FUNCAO) =  '586' then CD_FUNCAO :=  '219'
      else if Trim(CD_FUNCAO) = '1007' then CD_FUNCAO := '1999'
      else if Trim(CD_FUNCAO) = '1008' then CD_FUNCAO := '1998'
      else if Trim(CD_FUNCAO) = '1009' then CD_FUNCAO := '1997'

      else if Trim(CD_FUNCAO) =  '740' then CD_FUNCAO := '220'

      else if Trim(CD_FUNCAO) = '000'  then CD_FUNCAO := '';

      // Datas
      if Trim(DT_ADMISSAO             	) = '01.01.0001' then DT_ADMISSAO             	:= '';
      if Trim(DT_PRV_DESL             	) = '01.01.0001' then DT_PRV_DESL             	:= '';
      if Trim(DT_ASSOC_PPREV          	) = '01.01.0001' then DT_ASSOC_PPREV          	:= '';
      if Trim(DT_NASC                 	) = '01.01.0001' then DT_NASC                 	:= '';
      if Trim(DT_EXPD_CI              	) = '01.01.0001' then DT_EXPD_CI              	:= '';
      if Trim(DT_ADMISSAO_SASSE       	) = '01.01.0001' then DT_ADMISSAO_SASSE       	:= '';
      if Trim(DT_IN_ABONO_PERM        	) = '01.01.0001' then DT_IN_ABONO_PERM        	:= '';
      if Trim(DT_DESL_PPREV           	) = '01.01.0001' then DT_DESL_PPREV           	:= '';
      if Trim(DT_IN_EMP_CARGO_AT      	) = '01.01.0001' then DT_IN_EMP_CARGO_AT      	:= '';
      if Trim(DT_CARGO_ANT            	) = '01.01.0001' then DT_CARGO_ANT            	:= '';
      if Trim(DT_IN_BOLSA_CG_TB74     	) = '01.01.0001' then DT_IN_BOLSA_CG_TB74     	:= '';
      if Trim(DT_FM_BOLSA_CG_TB74     	) = '01.01.0001' then DT_FM_BOLSA_CG_TB74     	:= '';
      if Trim(DT_IN_EXER_FUNCAO_TB30  	) = '01.01.0001' then DT_IN_EXER_FUNCAO_TB30  	:= '';
      if Trim(DT_FM_EXER_FUNCAO_TB30  	) = '01.01.0001' then DT_FM_EXER_FUNCAO_TB30  	:= '';
      if Trim(DT_IN_EXER_FUNCAO_TB30_2	) = '01.01.0001' then DT_IN_EXER_FUNCAO_TB30_2	:= '';
      if Trim(DT_FM_EXER_FUNCAO_TB30_2	) = '01.01.0001' then DT_FM_EXER_FUNCAO_TB30_2	:= '';
      if Trim(DT_IN_EXER_FUNCAO_TB30_3	) = '01.01.0001' then DT_IN_EXER_FUNCAO_TB30_3	:= '';
      if Trim(DT_FM_EXER_FUNCAO_TB30_3	) = '01.01.0001' then DT_FM_EXER_FUNCAO_TB30_3	:= '';
      if Trim(DT_IN_OCOR_TB28         	) = '01.01.0001' then DT_IN_OCOR_TB28         	:= '';
      if Trim(DT_IN_EXER_FUNCAO_TB30_4	) = '01.01.0001' then DT_IN_EXER_FUNCAO_TB30_4	:= '';
      if Trim(DT_FM_EXER_FUNCAO_TB30_4	) = '01.01.0001' then DT_FM_EXER_FUNCAO_TB30_4	:= '';
      if Trim(DT_IN_OCOR_TB28_2       	) = '01.01.0001' then DT_IN_OCOR_TB28_2       	:= '';
      if Trim(DT_IN_CARG_DIR_TB29     	) = '01.01.0001' then DT_IN_CARG_DIR_TB29     	:= '';
      if Trim(DT_FM_CARG_DIR_TB29     	) = '01.01.0001' then DT_FM_CARG_DIR_TB29     	:= '';
      if Trim(DT_IN_OCOR_TB28_3       	) = '01.01.0001' then DT_IN_OCOR_TB28_3       	:= '';
      if Trim(DT_IN_OCOR_TB28_4       	) = '01.01.0001' then DT_IN_OCOR_TB28_4       	:= '';
      if Trim(DT_IN_OCOR_TB60         	) = '01.01.0001' then DT_IN_OCOR_TB60         	:= '';
      if Trim(DT_IN_AD_NOT_TB60       	) = '01.01.0001' then DT_IN_AD_NOT_TB60       	:= '';
      if Trim(DT_IN_EXER_FUNCAO_TB30_5	) = '01.01.0001' then DT_IN_EXER_FUNCAO_TB30_5	:= '';
      if Trim(DT_FM_EXER_FUNCAO_TB30_5	) = '01.01.0001' then DT_FM_EXER_FUNCAO_TB30_5	:= '';
      if Trim(DT_IN_EXER_FUNCAO_TB30_6	) = '01.01.0001' then DT_IN_EXER_FUNCAO_TB30_6	:= '';
      if Trim(DT_FM_EXER_FUNCAO_TB30_6	) = '01.01.0001' then DT_FM_EXER_FUNCAO_TB30_6	:= '';
      if Trim(DT_IN_EXER_FUNCAO_TB30_7	) = '01.01.0001' then DT_IN_EXER_FUNCAO_TB30_7	:= '';
      if Trim(DT_FM_EXER_FUNCAO_TB30_7	) = '01.01.0001' then DT_FM_EXER_FUNCAO_TB30_7	:= '';
      if Trim(DT_READMISSAO           	) = '01.01.0001' then DT_READMISSAO           	:= '';

      // DOCPESSOA.IDESTADO
      if Trim(SI_UF             ) = 'GB'         then SI_UF              := 'RJ';

      //As cidades com Empregado(UNLD20) SI-UF X(02) = DF gravar no campo cidade = BRASÍLIA
      if Trim(SI_UF             ) = 'DF'         then NO_CIDADE              := 'Brasilia';


      // Montar linha ser gravada
      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False);
      wLinhaGrava := wLinhaGrava +  PreparaStr(NR_MATR_EMP + DV_MATR_EMP, 7);
      wLinhaGrava := wLinhaGrava +  PreparaStr(NO_EMP                   ,40);
      wLinhaGrava := wLinhaGrava +  PreparaStr(CD_CPF_EMP               ,11);
      wLinhaGrava := wLinhaGrava +  PreparaStr(OPR_CC+ NR_CC+ DV_CC     ,12);
      wLinhaGrava := wLinhaGrava +  PreparaStr(DT_ADMISSAO              ,10);
      wLinhaGrava := wLinhaGrava +  PreparaStr(CD_CARGO                 ,12 );
      wLinhaGrava := wLinhaGrava +  PreparaStr(CD_SEXO                  ,1 );
      wLinhaGrava := wLinhaGrava +  PreparaStr(DT_NASC                  ,10);
      wLinhaGrava := wLinhaGrava +  PreparaStr(NR_CI                    ,12);
      wLinhaGrava := wLinhaGrava +  PreparaStr(SI_UF_EXP_CI             ,2 );
      wLinhaGrava := wLinhaGrava +  PreparaStr(DT_EXPD_CI               ,10);
      wLinhaGrava := wLinhaGrava +  PreparaStr(CD_MUN_NAT               ,6 );

      if trim(NO_PAI) = 'NAO INFORMADO' then NO_PAI := '';
      wLinhaGrava := wLinhaGrava +  PreparaStr(NO_PAI                   ,40);

      if trim(NO_MAE) = 'NAO INFORMADO' then NO_MAE := '';
      wLinhaGrava := wLinhaGrava +  PreparaStr(NO_MAE                   ,40);

      wLinhaGrava := wLinhaGrava +  PreparaStr(CD_EST_CIV               ,1 );

      if trim(NR_MATR_CONJ) = '000000' then NR_MATR_CONJ := '';
      wLinhaGrava := wLinhaGrava +  PreparaStr(NR_MATR_CONJ             ,6 );

      wLinhaGrava := wLinhaGrava +  PreparaStr(IntToStr(iTempoServAnt  ),6 );
      wLinhaGrava := wLinhaGrava +  PreparaStr(IntToStr(iTempoServTotal),6 );
      wLinhaGrava := wLinhaGrava +  PreparaStr(slNUMFILIAL              ,15);
      wLinhaGrava := wLinhaGrava +  PreparaStr(slIDSITFUNC              ,10);
      wLinhaGrava := wLinhaGrava +  PreparaStr(' '                      ,15); // vr_rem_base
      wLinhaGrava := wLinhaGrava +  PreparaStr(DT_PRV_DESL              ,10);
      wLinhaGrava := wLinhaGrava +  PreparaStr(' '                      ,10); // dt_in_linca
      wLinhaGrava := wLinhaGrava +  PreparaStr(' '                      ,10);
      wLinhaGrava := wLinhaGrava +  PreparaStr(QT_TPO_SERV_PUB          ,6 );
      wLinhaGrava := wLinhaGrava +  PreparaStr(QT_TPO_SERV_PRIV         ,6 );
      wLinhaGrava := wLinhaGrava +  PreparaStr(slFLGDIRETOR             ,1 );
      wLinhaGrava := wLinhaGrava +  PreparaStr(IntToStr(iTempoServAnt  ),6 );
      wLinhaGrava := wLinhaGrava +  PreparaStr(CD_FUNCAO                ,6 );
      wLinhaGrava := wLinhaGrava +  PreparaStr(DT_READMISSAO            ,10);
      wLinhaGrava := wLinhaGrava +  PreparaStr(CD_VINCULACAO_FUN        ,5 );
      wLinhaGrava := wLinhaGrava +  PreparaStr(slDATAMORTE              ,10);

      if not pbGravaConta then
      begin
        wLinhaGrava := wLinhaGrava +  PreparaStr('000' ,3);
        wLinhaGrava := wLinhaGrava +  PreparaStr(''    ,5);
      end
      else
      begin
        wLinhaGrava := wLinhaGrava +  PreparaStr('104' ,3);
        wLinhaGrava := wLinhaGrava +  PreparaStr(slNUMAGENCIA ,5);
      end;

      wLinhaGrava := wLinhaGrava +  PreparaStr(NUMDEPIRRF               ,2);
      wLinhaGrava := wLinhaGrava +  PreparaStr(NUMDEPSALF               ,2);
      wLinhaGrava := wLinhaGrava +  PreparaStr(NUMDEPTOTAL              ,2);

      //VALORBASE4
      if ID_AUX_PECULIO = 'S' then ID_AUX_PECULIO := '1'
      else ID_AUX_PECULIO := '0';
      wLinhaGrava := wLinhaGrava +  ID_AUX_PECULIO;

      
      //email
      sEmail := '';
      if length( trim(NO_EMAIL1)) > 1 then
      sEmail :=  trim(NO_EMAIL1);

      if length( trim(NO_EMAIL2)) > 1 then
      begin
         if trim(sEmail) <> '' then
         sEmail :=  sEmail + ' ; '+trim(NO_EMAIL2)
         else  sEmail :=  trim(NO_EMAIL2);
      end;
      wLinhaGrava := wLinhaGrava +  PreparaStr(sEmail              ,120);



   end;


   WriteLn(wArquivoGravacaoModCad,wLinhaGrava);
end;

Procedure TfrmSeparadorArqFuncef.GravaEnderecos;
begin


  { Gravar Novo Registro Endereços}
  if trim(sIdPlanoPrev) = 'UNIDOPER' then
  begin

     if lRegUnidOper.W01_NR_TEL_1 = '00000000' then
        lRegUnidOper.W01_NR_TEL_1 := '        ';

     if (lRegUnidOper.W01_NR_TEL_2 <> '00000000') and
        (lRegUnidOper.W01_NR_TEL_2 <> '        ') then
        lRegUnidOper.W01_NR_TEL_1 := lRegUnidOper.W01_NR_TEL_2;

     wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+  //sidpessoa preenchido com o NUMFILIAL
                    'UOPER       '+
                    CompletaString(lRegUnidOper.W01_NO_LOGR,' ',50, True)+
                    CompletaString(lRegUnidOper.W01_NO_BAI,' ',20,True)+
                    CompletaString(lRegUnidOper.W01_NO_CIDADE,' ',22,True)+
                    CompletaString(lRegUnidOper.W01_CD_CEP,' ',8,True)+
                    CompletaString(lRegUnidOper.W01_SI_UF,' ',2,True)+
                    CompletaString(lRegUnidOper.W01_NR_TEL_1,' ',8,True);
  end
  else
  begin
     if LRegEmpregado.NR_TEL = '0000000' then
        LRegEmpregado.NR_TEL := '        ';

     wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                    CompletaString(sIdPlanoprev,' ',5,False)+
                    LRegEmpregado.NR_MATR_EMP+
                    LRegEmpregado.DV_MATR_EMP+
                    CompletaString(LRegEmpregado.NO_LOGR,' ',50,True)+
                    CompletaString(LRegEmpregado.NO_BAI,' ',20, True)+
                    CompletaString(LRegEmpregado.NO_CIDADE,' ', 22, True)+
                    CompletaString(LRegEmpregado.CD_CEP, ' ',8,True)+
                    CompletaString(LRegEmpregado.SI_UF, ' ', 2, True)+
                    CompletaString(LRegEmpregado.NR_TEL, ' ', 8, True);
  end;

  try
     WriteLn(wArquivoGravacaoEnd,wLinhaGrava);
  except
     AssignFile(wArquivoGravacaoEnd,edArqGravar.Text+'\Endereco.txt');
     try Append(wArquivoGravacaoEnd) except  Rewrite(wArquivoGravacaoEnd) end;
     WriteLn(wArquivoGravacaoEnd,wLinhaGrava);
  end;

end;


Procedure TfrmSeparadorArqFuncef.GravaEvolFunc;
   procedure DeParaFuncao(var sCodFuncao : String);
   begin
      // ELEGPATRO.IDFUNCAO
      if      Trim(sCodFuncao) =  '113' then sCodFuncao :=  '203'
      else if Trim(sCodFuncao) =  '115' then sCodFuncao :=  '204'
      else if Trim(sCodFuncao) =  '116' then sCodFuncao :=  '205'
      else if Trim(sCodFuncao) =  '118' then sCodFuncao :=  '206'
      else if Trim(sCodFuncao) =  '119' then sCodFuncao :=  '207'
      else if Trim(sCodFuncao) =  '142' then sCodFuncao :=  '208'
      else if Trim(sCodFuncao) =  '145' then sCodFuncao :=  '209'
      else if Trim(sCodFuncao) =  '191' then sCodFuncao :=  '210'
      else if Trim(sCodFuncao) =  '192' then sCodFuncao :=  '211'
      else if Trim(sCodFuncao) =  '193' then sCodFuncao :=  '212'
      else if Trim(sCodFuncao) =  '194' then sCodFuncao :=  '213'
      else if Trim(sCodFuncao) =  '195' then sCodFuncao :=  '214'
      else if Trim(sCodFuncao) =  '198' then sCodFuncao :=  '215'
      else if Trim(sCodFuncao) =  '199' then sCodFuncao :=  '216'
      else if Trim(sCodFuncao) =  '122' then sCodFuncao :=  '176'
      else if Trim(sCodFuncao) =  '624' then sCodFuncao :=  '217'
      else if Trim(sCodFuncao) =  '621' then sCodFuncao :=  '218'
      else if Trim(sCodFuncao) =  '586' then sCodFuncao :=  '219'
      else if Trim(sCodFuncao) = '1007' then sCodFuncao := '1999'
      else if Trim(sCodFuncao) = '1008' then sCodFuncao := '1998'
      else if Trim(sCodFuncao) = '1009' then sCodFuncao := '1997'
      else if Trim(sCodFuncao) =  '740' then sCodFuncao :=  '220'
      else if Trim(sCodFuncao) = '000' then sCodFuncao := '';
   end;
var
   sTipoReg, sModo, sCdCargoFuncao, sDataInicio, sDataFim, sPercentual : String;
begin
{
TIPO_REGISTRO    (2) - (CG)CARGO  (FN)FUNÇÃO (IN)INSALUBRIDADE (PC)PERICULOSIDADE
                       (AN)ADICIONAL NOTURNO (AT)ADICIONAL TEMPO DE SERVIÇO
                       (AC)ADICIONAL COMPENSATÓRIO
IDPESSOA      (15)
IDPLANOPREV    (5)
MATRICULA      (6)
DV_MATRICULA    (1)
CD_CARGO / CD_FUNCAO  (6)

MODOFUNCAO  (2)  -
         Se estiver inserindo Cargo então:
		EF = Efetivo
		BC = Bolsa de Cargo (Estágio Supervisionado)

	 Se estiver inserindo Função então:
		EF = Efetiva
		AS = Assegurada
		ES = Eventual/Substituição
		BF = Bolsa de Função
                NE - Não Efetivo

	 Se estiver inserindo Adicional Noturno (Estágio Supervisionado) então:
		NO = Adicional Noturno Normal
		FA = Adicional Noturno Facultativo

DT_INICIO   (10) - converter para barras
PERCENTUAL   (6) - no caso do percentual da função, adicionar dois zeros a direita
DATA_FIM     (10) - converter para barras
QT_MINUTOS   (5)
}



{CAMPOS COM INFORMAÇÕES DE CARGOS ANTIGOS,
QUE JÁ FORAM IMPORTADOS NA CARGA INICIAL.
A EVOLUÇÃO SERÁ FEITA ATRAVÉS DA ATUALIZAÇÃO DOS DADOS ATUAIS...}
//função de estágio supervisionado
{LRegEmpregado.CD_FUNCAO_TB30          : String[3];
LRegEmpregado.DT_IN_EXER_FUNCAO_TB30  : String[10];
LRegEmpregado.DT_FM_EXER_FUNCAO_TB30  : String[10];
LRegEmpregado.QT_DIAS_EXER_FUNCAO_TB30: String[4];}

//função efetiva atual (ACIMA)
{LRegEmpregado.CD_FUNCAO_TB30_2        : String[3];
LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_2: String[10];
LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_2 : String[10];}

//função efetiva anterior
{LRegEmpregado.CD_FUNCAO_TB30_3         : String[3];
LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_3 : String[10];
LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_3 : String[10];}

//função assegurada
{LRegEmpregado.CD_FUNCAO_TB30_4        : String[3];
LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_4: String[10];
LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_4: String[10];
LRegEmpregado.PC_LER_TB_TB30_4         : String[6];}

//adicional por tempo de serviço anterior
{LRegEmpregado.DT_IN_OCOR_TB28_3+
LRegEmpregado.PC_ADIC_TB28_3+}

//funão não efetiva
{LRegEmpregado.CD_FUNCAO_TB30_5        : String[3];
LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_5 : String[10];
LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_5 : String[10];}

//função de instrutoria e consultoria
{LRegEmpregado.CD_FUNCAO_TB30_6         : String[3];
LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_6 : String[10];
LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_6 : String[10];}

//função com prazo determinado
{LRegEmpregado.CD_FUNCAO_TB30_7         : String[3];
LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_7 : String[10];
LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_7 : String[10];}

   //if trim(sIdPessoa) = '' then exit; //leofuncef - 16112005


   // EVOLFUNCPREV.IDCARGOEXT - CARGO ATUAL
   with LRegEmpregado do
   begin
        if (CD_CARGO = 'ADRECJ') or (CD_CARGO = 'ADRECP') or (CD_CARGO = 'ADRECS')  then CD_CARGO := 'AR'  + Trim(NR_REF_SALL)
      else if (CD_CARGO = 'ADV0GJ') or (CD_CARGO = 'ADV0GP') or (CD_CARGO = 'ADV0GS')
           or (CD_CARGO = 'ADV08J') or (CD_CARGO = 'ADV08P') or (CD_CARGO = 'ADV08P')  then CD_CARGO := 'AD'+Trim(NR_REF_SALL)
      else if (COPY(CD_CARGO,1,4) = 'ADV8')                                            then CD_CARGO := 'ADV'+Trim(NR_REF_SALL)+'8'
   else if (CD_CARGO = 'ARQTJR') or (CD_CARGO = 'ARQTPL') or (CD_CARGO = 'ARQTSR')
        or (CD_CARGO = 'ARQTSP') or (CD_CARGO = 'ARQTJS') or (CD_CARGO = 'ARQS6H')  then CD_CARGO := 'AQ'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENGCVJ') or (CD_CARGO = 'ENGCVP') or (CD_CARGO = 'ENGCVS')  then CD_CARGO := 'EV'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENGTLJ') or (CD_CARGO = 'ENGTLP') or (CD_CARGO = 'ENGTLS')  then CD_CARGO := 'ET'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'MEDTBJ') or (CD_CARGO = 'MEDTBP') or (CD_CARGO = 'MEDTBS')  then CD_CARGO := 'MT'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENGSTJ') or (CD_CARGO = 'ENGSTP') or (CD_CARGO = 'ENGSTS')  then CD_CARGO := 'ER'  + Trim(NR_REF_SALL)
   else if (COPY(CD_CARGO,1,4) = 'TBSN')                                            then CD_CARGO := 'TSN'  + Trim(NR_REF_SALL) //Renato Visoni SOL 99238 / Kintana 435001

     else if (COPY(CD_CARGO,1,3) = 'TBS')                                             then CD_CARGO := Trim(CD_CARGO) + Trim(NR_REF_SALL)
     else if (COPY(CD_CARGO,1,2) = 'TB')                                              then CD_CARGO := Trim(CD_CARGO) + COPY(NR_REF_SALL ,1,3)+'6'
   else if (CD_CARGO = 'ENGAGJ') or (CD_CARGO = 'ENGAGP') or (CD_CARGO = 'ENGAGS')  then CD_CARGO := 'EA'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENGSNJ') or (CD_CARGO = 'ENGSNP') or (CD_CARGO = 'ENGSNS')  then CD_CARGO := 'ST'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENGMCJ') or (CD_CARGO = 'ENGMCP') or (CD_CARGO = 'ENGMCS')  then CD_CARGO := 'EM'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENGFLJ') or (CD_CARGO = 'ENGFLP') or (CD_CARGO = 'ENGFLS')  then CD_CARGO := 'EF'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENGELJ') or (CD_CARGO = 'ENGELP') or (CD_CARGO = 'ENGELS')  then CD_CARGO := 'EE'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENGAMJ') or (CD_CARGO = 'ENGAMP') or (CD_CARGO = 'ENGAMS')  then CD_CARGO := 'AB'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ARQUI6') or (CD_CARGO = 'ARQUI8')                           then CD_CARGO := 'ART'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ADMIN6') or (CD_CARGO = 'ADMIN8')                           then CD_CARGO := 'ADT'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ADMRC6') or (CD_CARGO = 'ADMRC8')                           then CD_CARGO := 'ADR'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ADVOG6') or (CD_CARGO = 'ADVOG8')                           then CD_CARGO := 'ADO'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ASSOC6') or (CD_CARGO = 'ASSOC8')                           then CD_CARGO := 'ATS'  + Trim(NR_REF_SALL)
   else if (COPY(CD_CARGO,1,5) = 'DENT6') or (COPY(CD_CARGO,1,5) = 'DENT8')         then CD_CARGO := 'DET'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENGEN6') or (CD_CARGO = 'ENGEN8')                           then CD_CARGO := 'EGH'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'PSICO6') or (CD_CARGO = 'PSICO8')                           then CD_CARGO := 'PSC'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'COMSO6') or (CD_CARGO = 'COMSO8')                           then CD_CARGO := 'CMS'  + Trim(NR_REF_SALL)
   else if (COPY(CD_CARGO,1,5) = 'CONT6') or (COPY(CD_CARGO,1,5) = 'CONT8')         then CD_CARGO := 'COT'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ECONO6') or (CD_CARGO = 'ECONO8')                           then CD_CARGO := 'ECN'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENSET6') or (CD_CARGO = 'ENSET8')                           then CD_CARGO := 'EGT'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENTEL6') or (CD_CARGO = 'ENTEL8')                           then CD_CARGO := 'ETC'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ESTAT6') or (CD_CARGO = 'ESTAT8')                           then CD_CARGO := 'ETT'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'SOCIO6') or (CD_CARGO = 'SOCIO8')                           then CD_CARGO := 'SCI'  + Trim(NR_REF_SALL)
   else if (COPY(CD_CARGO,1,5) = 'VPRES')                                           then CD_CARGO := 'VCP001'
   else if (CD_CARGO = 'MEDIC6') or (CD_CARGO = 'MEDIC8')                           then CD_CARGO := 'MEO'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ANSIS6') or (CD_CARGO = 'ANSIS8')                           then CD_CARGO := 'ANL'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'MEDTR6') or (CD_CARGO = 'MEDTR8')                           then CD_CARGO := 'MDT'  + Trim(NR_REF_SALL)
   else if (CD_CARGO = 'ENGAG6')                                                    then CD_CARGO := 'EG'  + Trim(NR_REF_SALL) + '6'
   else if (CD_CARGO = 'ENGAM6')                                                    then CD_CARGO := 'EB'  + Trim(NR_REF_SALL) + '6'
   else if (CD_CARGO = 'ENGCV6')                                                    then CD_CARGO := 'EI'  + Trim(NR_REF_SALL) + '6'
   else if (CD_CARGO = 'ENGEL6')                                                    then CD_CARGO := 'EL'  + Trim(NR_REF_SALL) + '6'
   else if (CD_CARGO = 'ENGFL6')                                                    then CD_CARGO := 'EN'  + Trim(NR_REF_SALL) + '6'
   else if (CD_CARGO = 'ENGMC6')                                                    then CD_CARGO := 'EC'  + Trim(NR_REF_SALL) + '6'
   else if (CD_CARGO = 'ENGSN6')                                                    then CD_CARGO := 'ES'  + Trim(NR_REF_SALL) + '6'
   else if (CD_CARGO = 'ENGAG8')                                                    then CD_CARGO := 'EG'  + Trim(NR_REF_SALL) + '8'
   else if (CD_CARGO = 'ENGAM8')                                                    then CD_CARGO := 'EB'  + Trim(NR_REF_SALL) + '8'
   else if (CD_CARGO = 'ENGCV8')                                                    then CD_CARGO := 'EI'  + Trim(NR_REF_SALL) + '8'
   else if (CD_CARGO = 'ENGEL8')                                                    then CD_CARGO := 'EL'  + Trim(NR_REF_SALL) + '8'
   else if (CD_CARGO = 'ENGFL8')                                                    then CD_CARGO := 'EN'  + Trim(NR_REF_SALL) + '8'
   else if (CD_CARGO = 'ENGMC8')                                                    then CD_CARGO := 'EC'  + Trim(NR_REF_SALL) + '8'
   else if (CD_CARGO = 'ENGSN8')                                                    then CD_CARGO := 'ES'  + Trim(NR_REF_SALL) + '8'
   else if (CD_CARGO = 'CONTR2')                                                    then CD_CARGO := 'CT'  + '0002'

   else if (COPY(CD_CARGO,1,3) = 'MED') or (COPY(CD_CARGO,1,3) = 'DEN')             then CD_CARGO := Trim(CD_CARGO) + COPY(NR_REF_SALL ,1,2)+'6'
   else if Trim(Copy(NR_REF_SALL ,3,1)) = ''                                        then CD_CARGO := Trim(CD_CARGO) + COPY(NR_REF_SALL ,1,2)+'8'
   else if (Trim(Copy(NR_REF_SALL ,3,1)) <> '') and (Copy(NR_REF_SALL ,1,1)  = '8') then CD_CARGO := Trim(CD_CARGO) + COPY(NR_REF_SALL ,1,3)+'4'
      else if Trim(COPY(CD_CARGO, 4,1)) <> ''                                          then CD_CARGO := CD_CARGO
   else CD_CARGO := Trim(CD_CARGO) + COPY(NR_REF_SALL ,1,3) + '8';
   end;

   // EVOLFUNCPREV.IDCARGOEXT - CARGO ANTERIOR
   with LRegEmpregado do
   begin
          if (CD_CARGO_ANT = 'ADRECJ') or (CD_CARGO_ANT = 'ADRECP') or (CD_CARGO_ANT = 'ADRECS') then CD_CARGO_ANT := 'AR'  + Trim(NR_REF_SALL_ANT)
      else if (CD_CARGO_ANT = 'ADV0GJ') or (CD_CARGO_ANT = 'ADV0GP') or (CD_CARGO_ANT = 'ADV0GS')
           or (CD_CARGO_ANT = 'ADV08J') or (CD_CARGO_ANT = 'ADV08P') or (CD_CARGO_ANT = 'ADV08P')  then CD_CARGO_ANT := 'AD'+Trim(NR_REF_SALL_ANT)
      else if (COPY(CD_CARGO_ANT,1,4) = 'ADV8')                                                    then CD_CARGO_ANT := 'ADV'+Trim(NR_REF_SALL_ANT)+'8'
     else if (CD_CARGO_ANT = 'ARQTJR') or (CD_CARGO_ANT = 'ARQTPL') or (CD_CARGO_ANT = 'ARQTSR')
          or (CD_CARGO_ANT = 'ARQTSP') or (CD_CARGO_ANT = 'ARQTJS') or (CD_CARGO_ANT = 'ARQS6H') then CD_CARGO_ANT := 'AQ'  + Trim(NR_REF_SALL_ANT)
      else if (CD_CARGO_ANT = 'ENGCVJ') or (CD_CARGO_ANT = 'ENGCVP') or (CD_CARGO_ANT = 'ENGCVS')  then CD_CARGO_ANT := 'EV'+Trim(NR_REF_SALL_ANT)
      else if (CD_CARGO_ANT = 'ENGTLJ') or (CD_CARGO_ANT = 'ENGTLP') or (CD_CARGO_ANT = 'ENGTLS')  then CD_CARGO_ANT := 'ET'+Trim(NR_REF_SALL_ANT)
      else if (CD_CARGO_ANT = 'MEDTBJ') or (CD_CARGO_ANT = 'MEDTBP') or (CD_CARGO_ANT = 'MEDTBS')  then CD_CARGO_ANT := 'MT'+Trim(NR_REF_SALL_ANT)
      else if (CD_CARGO_ANT = 'ENGSTJ') or (CD_CARGO_ANT = 'ENGSTP') or (CD_CARGO_ANT = 'ENGSTS')  then CD_CARGO_ANT := 'ER'+Trim(NR_REF_SALL_ANT)
      else if (COPY(CD_CARGO_ANT,1,4) = 'TBSN')                                                    then CD_CARGO_ANT := 'TSN'  + Trim(NR_REF_SALL_ANT) //Renato Visoni SOL 99238 / Kintana 435001
      else if (COPY(CD_CARGO_ANT,1,3) = 'TBS')                                                     then CD_CARGO_ANT := Trim(CD_CARGO_ANT) + Trim(NR_REF_SALL_ANT)
      else if (COPY(CD_CARGO_ANT,1,2) = 'TB')                                                      then CD_CARGO_ANT := Trim(CD_CARGO_ANT) + COPY(NR_REF_SALL_ANT ,1,3)+'6'
     else if (CD_CARGO_ANT = 'ENGAGJ') or (CD_CARGO_ANT = 'ENGAGP') or (CD_CARGO_ANT = 'ENGAGS') then CD_CARGO_ANT := 'EA'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ENGSNJ') or (CD_CARGO_ANT = 'ENGSNP') or (CD_CARGO_ANT = 'ENGSNS') then CD_CARGO_ANT := 'ST'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ENGMCJ') or (CD_CARGO_ANT = 'ENGMCP') or (CD_CARGO_ANT = 'ENGMCS') then CD_CARGO_ANT := 'EM'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ENGFLJ') or (CD_CARGO_ANT = 'ENGFLP') or (CD_CARGO_ANT = 'ENGFLS') then CD_CARGO_ANT := 'EF'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ENGELJ') or (CD_CARGO_ANT = 'ENGELP') or (CD_CARGO_ANT = 'ENGELS') then CD_CARGO_ANT := 'EE'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ENGAMJ') or (CD_CARGO_ANT = 'ENGAMP') or (CD_CARGO_ANT = 'ENGAMS') then CD_CARGO_ANT := 'AB'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ARQUI6') or (CD_CARGO_ANT = 'ARQUI8')                               then CD_CARGO_ANT := 'ART'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ADMIN6') or (CD_CARGO_ANT = 'ADMIN8')                               then CD_CARGO_ANT := 'ADT'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ADMRC6') or (CD_CARGO_ANT = 'ADMRC8')                               then CD_CARGO_ANT := 'ADR'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ADVOG6') or (CD_CARGO_ANT = 'ADVOG8')                               then CD_CARGO_ANT := 'ADO'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ASSOC6') or (CD_CARGO_ANT = 'ASSOC8')                               then CD_CARGO_ANT := 'ATS'  + Trim(NR_REF_SALL_ANT)
     else if (COPY(CD_CARGO_ANT,1,5) = 'DENT6') or (COPY(CD_CARGO_ANT,1,5) = 'DENT8')             then CD_CARGO_ANT := 'DET'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ENGEN6') or (CD_CARGO_ANT = 'ENGEN8')                               then CD_CARGO_ANT := 'EGH'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'PSICO6') or (CD_CARGO_ANT = 'PSICO8')                               then CD_CARGO_ANT := 'PSC'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'COMSO6') or (CD_CARGO_ANT = 'COMSO8')                               then CD_CARGO_ANT := 'CMS'  + Trim(NR_REF_SALL_ANT)
     else if (COPY(CD_CARGO_ANT,1,5) = 'CONT6') or (COPY(CD_CARGO_ANT,1,5) = 'CONT8')             then CD_CARGO_ANT := 'COT'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ECONO6') or (CD_CARGO_ANT = 'ECONO8')                               then CD_CARGO_ANT := 'ECN'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ENSET6') or (CD_CARGO_ANT = 'ENSET8')                               then CD_CARGO_ANT := 'EGT'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ENTEL6') or (CD_CARGO_ANT = 'ENTEL8')                               then CD_CARGO_ANT := 'ETC'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ESTAT6') or (CD_CARGO_ANT = 'ESTAT8')                               then CD_CARGO_ANT := 'ETT'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'SOCIO6') or (CD_CARGO_ANT = 'SOCIO8')                               then CD_CARGO_ANT := 'SCI'  + Trim(NR_REF_SALL_ANT)
     else if (COPY(CD_CARGO_ANT,1,5) = 'VPRES')                                                   then CD_CARGO_ANT := 'VCP001'
     else if (CD_CARGO_ANT = 'MEDIC6') or (CD_CARGO_ANT = 'MEDIC8')                               then CD_CARGO_ANT := 'MEO'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'ANSIS6') or (CD_CARGO_ANT = 'ANSIS8')                               then CD_CARGO_ANT := 'ANL'  + Trim(NR_REF_SALL_ANT)
     else if (CD_CARGO_ANT = 'MEDTR6') or (CD_CARGO_ANT = 'MEDTR8')                               then CD_CARGO_ANT := 'MDT'  + Trim(NR_REF_SALL_ANT)

     else if (CD_CARGO = 'ENGAG6')                                                                then CD_CARGO := 'EG'  + Trim(NR_REF_SALL) + '6'
     else if (CD_CARGO = 'ENGAM6')                                                                then CD_CARGO := 'EB'  + Trim(NR_REF_SALL) + '6'
     else if (CD_CARGO = 'ENGCV6')                                                                then CD_CARGO := 'EI'  + Trim(NR_REF_SALL) + '6'
     else if (CD_CARGO = 'ENGEL6')                                                                then CD_CARGO := 'EL'  + Trim(NR_REF_SALL) + '6'
     else if (CD_CARGO = 'ENGFL6')                                                                then CD_CARGO := 'EN'  + Trim(NR_REF_SALL) + '6'
     else if (CD_CARGO = 'ENGMC6')                                                                then CD_CARGO := 'EC'  + Trim(NR_REF_SALL) + '6'
     else if (CD_CARGO = 'ENGSN6')                                                                then CD_CARGO := 'ES'  + Trim(NR_REF_SALL) + '6'
     else if (CD_CARGO = 'ENGAG8')                                                                then CD_CARGO := 'EG'  + Trim(NR_REF_SALL) + '8'
     else if (CD_CARGO = 'ENGAM8')                                                                then CD_CARGO := 'EB'  + Trim(NR_REF_SALL) + '8'
     else if (CD_CARGO = 'ENGCV8')                                                                then CD_CARGO := 'EI'  + Trim(NR_REF_SALL) + '8'
     else if (CD_CARGO = 'ENGEL8')                                                                then CD_CARGO := 'EL'  + Trim(NR_REF_SALL) + '8'
     else if (CD_CARGO = 'ENGFL8')                                                                then CD_CARGO := 'EN'  + Trim(NR_REF_SALL) + '8'
     else if (CD_CARGO = 'ENGMC8')                                                                then CD_CARGO := 'EC'  + Trim(NR_REF_SALL) + '8'
     else if (CD_CARGO = 'ENGSN8')                                                                then CD_CARGO := 'ES'  + Trim(NR_REF_SALL) + '8'
     else if (CD_CARGO = 'CONTR2')                                                                then CD_CARGO := 'CT'  + '0002'
     else if (COPY(CD_CARGO_ANT,1,3) = 'MED') or (COPY(CD_CARGO_ANT,1,3) = 'DEN')                then CD_CARGO_ANT := Trim(CD_CARGO_ANT) + COPY(NR_REF_SALL_ANT ,1,2)+'6'
     else if Trim(Copy(NR_REF_SALL_ANT ,3,1)) = ''                                               then CD_CARGO_ANT := Trim(CD_CARGO_ANT) + COPY(NR_REF_SALL_ANT ,1,2)+'8'
     else if (Trim(Copy(NR_REF_SALL_ANT ,3,1)) <> '') and (Copy(NR_REF_SALL_ANT ,1,1)  = '8')    then CD_CARGO_ANT := Trim(CD_CARGO_ANT) + COPY(NR_REF_SALL_ANT ,1,3)+'4'
      else if Trim(COPY(CD_CARGO_ANT, 4,1)) <> ''                                                  then CD_CARGO_ANT := CD_CARGO_ANT
     else CD_CARGO_ANT := Trim(CD_CARGO_ANT) + COPY(NR_REF_SALL_ANT ,1,3) + '8';
   end;

   //Bruno Bastos - Pend. 22336 - Início
   //LINHA DO CARGO ANTERIOR
   if (LRegEmpregado.CD_CARGO_ANT <> '000000' ) and (trim(LRegEmpregado.CD_CARGO_ANT) <> '' ) and
      (LRegEmpregado.DT_CARGO_ANT <> '') then
   begin

      sTipoReg := 'CG';

      if LRegEmpregado.CD_CARGO = LRegEmpregado.CD_CARGO_ANT
      then sModo := 'BC'
      else sModo := 'EF';

      sCdCargoFuncao :=  LRegEmpregado.CD_CARGO_ANT;

      sAux := LRegEmpregado.DT_CARGO_ANT;
      sDataInicio := TrataData(sAux);
      LRegEmpregado.DT_CARGO_ANT := sAux;

      sPercentual := '';

      if (LRegEmpregado.DT_IN_EMP_CARGO_AT <> '') And  (LRegEmpregado.DT_IN_EMP_CARGO_AT <> '01.01.0001') Then
      Begin
        sAux := LRegEmpregado.DT_IN_EMP_CARGO_AT;
        sAux := DateTostr(StrToDate(TrataData(sAux)) - 1);
        sDataFim := sAux;
      End
      Else
        sDataFim := '';

      
      sQtdeMinutos := '';

      If Trim(sDataInicio) <> '' Then
      Begin
        wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                       CompletaString(sIdPlanoprev,' ',5,False)+
                       sTipoReg+
                       LRegEmpregado.NR_MATR_EMP+
                       LRegEmpregado.DV_MATR_EMP+
                       CompletaString(sCdCargoFuncao,' ',6,False)+
                       sModo+
                       CompletaString(sDataInicio,' ',10,False)+
                       CompletaString(sPercentual,'0',6,False)+
                       CompletaString(sDataFim,' ',10,False)+
                       CompletaString(sQtdeMinutos,'0',5,False);

        WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
      End;
   end;

   //LINHA DO CARGO
   if (LRegEmpregado.CD_CARGO <> '000000' ) and (trim(LRegEmpregado.CD_CARGO) <> '' ) and
      (LRegEmpregado.DT_IN_EMP_CARGO_AT <> '') then
   begin

      sTipoReg := 'CG';

      if LRegEmpregado.CD_CARGO = LRegEmpregado.CD_CARGO_TB74
      then sModo := 'BC'
      else sModo := 'EF';

      sCdCargoFuncao :=  LRegEmpregado.CD_CARGO;

      sAux := LRegEmpregado.DT_IN_EMP_CARGO_AT;
      sDataInicio := TrataData(sAux);
      LRegEmpregado.DT_IN_EMP_CARGO_AT := sAux;

      sPercentual := '';
      sDataFim := '';
      sQtdeMinutos := '';


      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;

   //LINHA DA FUNÇÃO

   //comparar CD-FUNCAO para saber que data inicio pegar
   sDataFim := '';
   if LRegEmpregado.CD_FUNCAO = LRegEmpregado.CD_FUNCAO_TB30 then
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30
   else if LRegEmpregado.CD_FUNCAO = LRegEmpregado.CD_FUNCAO_TB30_2 then
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_2
   else if LRegEmpregado.CD_FUNCAO = LRegEmpregado.CD_FUNCAO_TB30_3 then
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_3
   else if LRegEmpregado.CD_FUNCAO = LRegEmpregado.CD_FUNCAO_TB30_4 then
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_4
   else if LRegEmpregado.CD_FUNCAO = LRegEmpregado.CD_FUNCAO_TB30_5 then
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_5
   else if LRegEmpregado.CD_FUNCAO = LRegEmpregado.CD_FUNCAO_TB30_6 then
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_6
   else if LRegEmpregado.CD_FUNCAO = LRegEmpregado.CD_FUNCAO_TB30_7 then
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_7
   else if ((trim(sDataFim) = '') and
            (LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_2 <> '') and
            (copy(LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_2,1,2) <> '00')) then
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_2;

   if (LRegEmpregado.CD_FUNCAO_TB30_3 <> '000') and (trim(LRegEmpregado.CD_FUNCAO_TB30_3) <> '') and
      (LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_3 <> '') then
   begin
      sTipoReg := 'FN';
      sModo := 'EF';

      sCdCargoFuncao :=  LRegEmpregado.CD_FUNCAO_TB30_3;
      DeParaFuncao(sCdCargoFuncao);

      sAux := LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_3;
      sDataInicio := TrataData(sAux);
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_3;

      sPercentual := '0100';
      sDataFim := TrataData(sDataFim);
      sQtdeMinutos := '';


      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;

   if (LRegEmpregado.CD_FUNCAO_TB30_4 <> '000') and (trim(LRegEmpregado.CD_FUNCAO_TB30_4) <> '') and
      (LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_4 <> '') then
   begin
      sTipoReg := 'FN';
      sModo := 'AS';

      sCdCargoFuncao :=  LRegEmpregado.CD_FUNCAO_TB30_4;
      DeParaFuncao(sCdCargoFuncao);

      sAux := LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_4;
      sDataInicio := TrataData(sAux);
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_4;

      sPercentual := '0100';
      sDataFim := TrataData(sDataFim);
      sQtdeMinutos := '';


      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;

   if (LRegEmpregado.CD_FUNCAO_TB30_5 <> '000') and (trim(LRegEmpregado.CD_FUNCAO_TB30_5) <> '') and
      (LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_5 <> '') then
   begin
      sTipoReg := 'FN';
      sModo    := 'NE'; 

      sCdCargoFuncao :=  LRegEmpregado.CD_FUNCAO_TB30_5;
      DeParaFuncao(sCdCargoFuncao);

      sAux := LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_5;
      sDataInicio := TrataData(sAux);
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_5;

      sPercentual := '0100';
      sDataFim := TrataData(sDataFim);
      sQtdeMinutos := '';

      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;

   if (LRegEmpregado.CD_FUNCAO_TB30_6 <> '000') and (trim(LRegEmpregado.CD_FUNCAO_TB30_6) <> '') and
      (LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_6 <> '') then
   begin
      sTipoReg := 'FN';
      sModo := 'ES';

      sCdCargoFuncao :=  LRegEmpregado.CD_FUNCAO_TB30_6;
      DeParaFuncao(sCdCargoFuncao);

      sAux := LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_6;
      sDataInicio := TrataData(sAux);
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_6;

      sPercentual := '0100';
      sDataFim := TrataData(sDataFim);
      sQtdeMinutos := '';

      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;



   if ((LRegEmpregado.CD_FUNCAO <> '000') and (trim(LRegEmpregado.CD_FUNCAO) <> ''))
      or ((((LRegEmpregado.CD_FUNCAO_TB30_2 <> '000') and (trim(LRegEmpregado.CD_FUNCAO_TB30_2) <> '')))
          and  (LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_2 <> '')) then
   begin
      sTipoReg := 'FN';
      sModo := 'EF';

      sCdCargoFuncao :=  LRegEmpregado.CD_FUNCAO;

      If Trim( sCdCargoFuncao ) = '' Then sCdCargoFuncao := LRegEmpregado.CD_FUNCAO_TB30_2 ;

      DeParaFuncao(sCdCargoFuncao);

      sAux := LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_2;
      sDataInicio := TrataData(sAux);
      LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_2 := sAux;
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_2; 

      sPercentual := '0100';
      sDataFim := TrataData(sDataFim);
      sQtdeMinutos := '';


      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;


   if (LRegEmpregado.CD_FUNCAO_TB30_7 <> '000') and (trim(LRegEmpregado.CD_FUNCAO_TB30_7) <> '') and
      (LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_7 <> '') then
   begin
      sTipoReg := 'FN';
      sModo := 'DP';

      sCdCargoFuncao :=  LRegEmpregado.CD_FUNCAO_TB30_7;
      DeParaFuncao(sCdCargoFuncao);

      sAux := LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_7;
      sDataInicio := TrataData(sAux);
      sDataFim := LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_7;

      sPercentual := '0100';
      sDataFim := TrataData(sDataFim);
      sQtdeMinutos := '';


      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;


   //LINHA DE PERICULOSIDADE
   if (LRegEmpregado.TP_ADIC = 'P') and
      (LRegEmpregado.PC_ADIC <> '0000') then
   begin
      sTipoReg := 'PC';

      sModo := '  ';

      sCdCargoFuncao :=  '';

      sAux := LRegEmpregado.DT_IN_OCOR_TB28;
      sDataInicio := TrataData(sAux);
      LRegEmpregado.DT_IN_OCOR_TB28 := saux;

      sPercentual := LRegEmpregado.PC_ADIC+'.00'; //o formato é pic(4)
      //e a dos outros percentuais tem 2 casas decimais
      //então coloca as duas casas para padronizar
      sDataFim := '';
      sQtdeMinutos := '';


      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;


   //LINHA DE INSALUBRIDADE
   if (LRegEmpregado.TP_ADIC = 'I') and
      (LRegEmpregado.PC_ADIC <> '0000') then
   begin
      sTipoReg := 'IN';

      sModo := '  ';

      sCdCargoFuncao :=  '';

      sAux := LRegEmpregado.DT_IN_OCOR_TB28;
      sDataInicio := TrataData(sAux);
      LRegEmpregado.DT_IN_OCOR_TB28 := sAux;

      sPercentual := LRegEmpregado.PC_ADIC+'.00'; //o formato é pic(4)
      //e a dos outros percentuais tem 2 casas decimais
      //então coloca as duas casas para padronizar
      sDataFim := '';
      sQtdeMinutos := '';


      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;


   //LINHA DO ADICIONAL POR TEMPO DE SERVIÇO
   if (LRegEmpregado.PC_ADIC_TB28_4 <> '0000') and (trim(LRegEmpregado.PC_ADIC_TB28_4) <> '') and
      (LRegEmpregado.DT_IN_OCOR_TB28_4 <> '') then
   begin
      sTipoReg := 'AT';
      sModo := '  ';

      sCdCargoFuncao :=  '';

      sAux := LRegEmpregado.DT_IN_OCOR_TB28_4;
      sDataInicio := TrataData(sAux);
      LRegEmpregado.DT_IN_OCOR_TB28_4 := sAux;

      sPercentual := copy(LRegEmpregado.PC_ADIC_TB28_4,1,length(LRegEmpregado.PC_ADIC_TB28_4) -2)+'.'+
                     copy(LRegEmpregado.PC_ADIC_TB28_4,length(LRegEmpregado.PC_ADIC_TB28_4) -1,2);
      sDataFim := '';
      sQtdeMinutos := '';


      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;




   //LINHA DO ADICIONAL NOTURNO
   if (LRegEmpregado.CD_FUNCAO_TB60 <> '000') and (trim(LRegEmpregado.CD_FUNCAO_TB60) <> '') and
      (LRegEmpregado.DT_IN_OCOR_TB60 <> '' ) and
      (LRegEmpregado.PC_ADIC_TB60 <> '000.00') and
      (LRegEmpregado.PC_ADIC_TB60 <> '00000')  then
   begin
      sTipoReg := 'AN';
      sModo := '  ';

      sCdCargoFuncao :=  LRegEmpregado.CD_FUNCAO_TB60;
      DeParaFuncao(sCdCargoFuncao);

      sAux := LRegEmpregado.DT_IN_OCOR_TB60;
      sDataInicio := TrataData(sAux);
      LRegEmpregado.DT_IN_OCOR_TB60 := sAux;


      sPercentual := copy(LRegEmpregado.PC_ADIC_TB60,1,length(LRegEmpregado.PC_ADIC_TB60) -2)+'.'+
                     copy(LRegEmpregado.PC_ADIC_TB60,length(LRegEmpregado.PC_ADIC_TB60) -1,2);
      sDataFim := '';
      sQtdeMinutos := LRegEmpregado.QT_MIN_OCOR_TB60;


      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;



   if (LRegEmpregado.CD_FUNCAO_TB60 <> '000') and (trim(LRegEmpregado.CD_FUNCAO_TB60) <> '') and
      (LRegEmpregado.DT_IN_OCOR_TB60 <> '' ) and
      ( (LRegEmpregado.PC_ADIC_TB60 = '000.00') or
        (LRegEmpregado.PC_ADIC_TB60 = '00000')
      ) then
   begin
      sTipoReg := 'FN';
      sModo := 'FA'; 

      sCdCargoFuncao :=  LRegEmpregado.CD_FUNCAO_TB60;
      DeParaFuncao(sCdCargoFuncao);

      sAux := LRegEmpregado.DT_IN_OCOR_TB60;
      sDataInicio := TrataData(sAux);
      LRegEmpregado.DT_IN_OCOR_TB60 := sAux;


      sPercentual := '0100'; 
      sDataFim := '';
      sQtdeMinutos := LRegEmpregado.QT_MIN_OCOR_TB60;


      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;



   //LINHA DO ADICIONA COMPENSATÓRIO
   if (LRegEmpregado.CD_FUNCAO_TB28_2 <> '000') and (trim(LRegEmpregado.CD_FUNCAO_TB28_2) <> '') and
      (LRegEmpregado.DT_IN_OCOR_TB28_2 <> '') then
   begin
      sTipoReg := 'AC';
      sModo := '  ';

      sCdCargoFuncao :=  LRegEmpregado.CD_FUNCAO_TB28_2;
      DeParaFuncao(sCdCargoFuncao);

      sAux := LRegEmpregado.DT_IN_OCOR_TB28_2;
      sDataInicio := TrataData(sAux);
      LRegEmpregado.DT_IN_OCOR_TB28_2 := sAux;


      sPercentual := copy(LRegEmpregado.PC_ADIC_TB28_2,1,length(LRegEmpregado.PC_ADIC_TB28_2) -2)+'.'+
                     copy(LRegEmpregado.PC_ADIC_TB28_2,length(LRegEmpregado.PC_ADIC_TB28_2) -1,2);
      sDataFim := '';
      sQtdeMinutos := '';


      wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                     CompletaString(sIdPlanoprev,' ',5,False)+
                     sTipoReg+
                     LRegEmpregado.NR_MATR_EMP+
                     LRegEmpregado.DV_MATR_EMP+
                     CompletaString(sCdCargoFuncao,' ',6,False)+
                     sModo+
                     CompletaString(sDataInicio,' ',10,False)+
                     CompletaString(sPercentual,'0',6,False)+
                     CompletaString(sDataFim,' ',10,False)+
                     CompletaString(sQtdeMinutos,'0',5,False);

      WriteLn(wArquivoImpEvolFunc,wLinhaGrava);
   end;




end;



Procedure TfrmSeparadorArqFuncef.GravaDocPessoa;
begin

  { Gravar Novo Registro de Documentos }

  if (Trim(LRegEmpregado.CD_PIS_PASEP) <> '') and (LRegEmpregado.CD_PIS_PASEP <> '00000000000')
  then begin
     // Gravar PISPASEP
     wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                    CompletaString(sIdPlanoprev,' ',5,False);
     wLinhaGrava := wLinhaGrava + PreparaStr(LRegEmpregado.NR_MATR_EMP+LRegEmpregado.DV_MATR_EMP, 7);
     wLinhaGrava := wLinhaGrava + PreparaStr('6'                                                , 5);  // IDDOCUMENTO -> 6 = PISPASEP
     wLinhaGrava := wLinhaGrava + PreparaStr(LRegEmpregado.CD_PIS_PASEP                         , 18);
     wLinhaGrava := wLinhaGrava + PreparaStr(' '                                                , 10 );// DATA EXPEDICAO
     wLinhaGrava := wLinhaGrava + PreparaStr(' '                                                , 5 ); // IDESTADO
     wLinhaGrava := wLinhaGrava + PreparaStr('1'                                                , 5);  // IDPAIS      -> 1 = BRASIL
     WriteLn(wArquivoGravacaoDocPessoa,wLinhaGrava);
  end;

  // Gravar IDENTIDADE
  if (Trim(LRegEmpregado.NR_CI) <> '') and (LRegEmpregado.NR_CI <> '0000000000')
  then begin
     wLinhaGrava := '';
     wLinhaGrava := CompletaString(sIdPessoa,' ',15,False)+
                    CompletaString(sIdPlanoprev,' ',5,False);
     wLinhaGrava := wLinhaGrava + PreparaStr(LRegEmpregado.NR_MATR_EMP+LRegEmpregado.DV_MATR_EMP, 7);
     wLinhaGrava := wLinhaGrava + PreparaStr('11'                                               , 5);  // IDDOCUMENTO -> 11 = PISPASEP
     wLinhaGrava := wLinhaGrava + PreparaStr(LRegEmpregado.NR_CI                                , 18);
     wLinhaGrava := wLinhaGrava + PreparaStr(LRegEmpregado.DT_EXPD_CI                           , 10 );// DATA EXPEDICAO
     wLinhaGrava := wLinhaGrava + PreparaStr(LRegEmpregado.SI_UF_EXP_CI                         , 5 ); // IDESTADO
     wLinhaGrava := wLinhaGrava + PreparaStr('1'                                                , 5);  // IDPAIS      -> 1 = BRASIL
     WriteLn(wArquivoGravacaoDocPessoa,wLinhaGrava);
  end;
end;

Procedure TfrmSeparadorArqFuncef.GravaContatoPess;
begin

end;




Procedure TfrmSeparadorArqFuncef.GravaEventos;
var
   bAchouEvento   : Boolean;
   sIdEvento      : String;
   sData          : String;
   sTaxa          : String;
   sLogErro       : String;
begin
  // LAY-OUT DO ARQUIVO DE EVENTOS
  // CAMPO                  INICIO            TAM
  // MATRICULA              0                 7
  // IDEVENTOGERADOR        7                 3
  // IDPLANOPREV            10                2
  // DATAREGISTRO           12                10
  // DATAEFETIVADO          22                10
  // DATAEVENTO             32                10
  // DATAVOLTA              42                10
  // FLGCOBROUPATRO         52                1
  // FLGEFETIVADO           53                1
  // FLGSITFUNCIMED         54                1
  // FLGSITPARTIMED         55                1
  // FLGSITPLANOIMED        56                1
  // IDSITFUNCATUAL         57                5
  // IDSITFUNCNOVO          62                5
  // IDSITPARTATUAL         67                5
  // IDSITPARTNOVO          72                5
  // IDSITPLANOATUAL        77                5
  // IDSITPLANONOVO         82                5

  // Evento a gravar automaticamente
  // 1. Inscricao do Participante
  // 2. Reinscricao do Participante
  // 3. PADV Total
  // 4. Facultativo Parcial
  // 5. Falecimento
  // 6. Cancelamento a Pedido
  // 7. Cancelamento por Inadimplencia
  // 8. Migração de Plano
  // 9. Retorno de Facultativo para Ativo

  // Identificando a ocorrência de algum dos eventos especificados
  wLinhaGrava  := '';
  bAchouEvento := False;

  if      LRegEmpregado.CD_OCOR_TB23 = '16' then sIDSITFUNC := '18'
  else if LRegEmpregado.CD_OCOR_TB23 = '19' then sIDSITFUNC := '32'
  else if LRegEmpregado.CD_OCOR_TB23 = '17' then sIDSITFUNC := '24'
  else if LRegEmpregado.CD_OCOR_TB23 = '18' then sIDSITFUNC := '33'
  else if LRegEmpregado.CD_OCOR_TB23 = '20' then sIDSITFUNC := '34'
  else if LRegEmpregado.CD_OCOR_TB23 = '21' then sIDSITFUNC := '35'
  else if LRegEmpregado.CD_OCOR_TB23 = '22' then sIDSITFUNC := '36'
  else if LRegEmpregado.CD_OCOR_TB23 = '23' then sIDSITFUNC := '37'
  else if LRegEmpregado.CD_OCOR_TB23 = '25' then sIDSITFUNC := '39'
  else if LRegEmpregado.CD_OCOR_TB23 = '26' then sIDSITFUNC := '54'
  else if LRegEmpregado.CD_OCOR_TB23 = '27' then sIDSITFUNC := '38';

  sTaxa := '';

  if (sIdPlanoprev       <> '2') and
     (trim(sIdPlanoprev) <> '' ) then  
  begin
    sTaxa := LRegEmpregado.PC_PPREV_TB9A;

    qryaux.close;
    qryaux.sql.text := ' UPDATE CONTRIBPREVPARTP SET VALORBASE1 = ('+sTaxa+'/100)  '+
                       ' WHERE IDPESSJUR = 91008 AND IDPESSOA = '''+sIdPessoa+''' '+
                       ' AND IDPLANOPREV = '+sIdPlanoprev+' '+
                       ' AND IDCONTRIBUICAO IN (1,21) ';
    try
      qryaux.execsql;
    except
    end;
  end;

   if sIdSitPart = '' then
     sIdSitPart := '0';

   try
     if (StrToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) = 15) then
     begin                               // IDSITPLANOPREV DESCRICAO  FLGINTERNO
       if (sIdSitPlanoPrev = '1') or    // 1              ATIVO      NO
          (sIdSitPlanoPrev = '25') then // 25             SALDADO    NO
       begin
         // Grava crítica de inconsistência
         sLogErro   := 'Matr: ' + LRegEmpregado.NR_MATR_EMP + LRegEmpregado.DV_MATR_EMP + ' --> ' +
                        CompletaFim('Plano atual: ' + CompletaInicio(sIdPlanoPrev,    ' ', 2), ' ', 20) + ' ' +
                        CompletaFim('Situação: '    + CompletaInicio(sIdSitPlanoPrev, ' ', 2), ' ', 20);

         LogToFile(sLogErro, 'SRH16_Critica.txt', edArqGravar.Text);

         Exit;
       end
       else
       begin
         sIdPlanoPrev      := '74';
         sIdEvento         := '1';
         sIdSitPart        := '1';
         sIdSitPlanoPrev   := '1';
         sData             := LRegEmpregado.DT_ASSOC_PPREV;
         sTaxa             := LRegEmpregado.PC_PPREV_TB9A;
       end;
     end
     else
     begin
       //inscrição REB2002, que antes eram REPLAN e REB98
       if ((((sIdPlanoPrev <> '66') and (LRegEmpregado.DT_ASSOC_PPREV  <> '' )) or
            ((sIdPlanoPrev  = '66') and (LRegEmpregado.DT_ASSOC_PPREV  <> sinscricaodata ) and (trim(sinscricaodata) <> ''))) //leofuncef - 05052005 - reenscrição
         and ((LRegEmpregado.DT_PRV_DESL  = ' ') or (LRegEmpregado.DT_PRV_DESL  = '01.01.0001'))
         and (StrToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) = 13))
       then
       begin
         sIdPlanoPrev    := '66';
         sIdEvento       := '1';
         sIdSitPart      := '1';
         sIdSitPlanoPrev := '1';
         sData           := LRegEmpregado.DT_ASSOC_PPREV;
         sTaxa           := LRegEmpregado.PC_PPREV_TB9A;
       end
       else
       begin
         if (StrToInt(sIdSitPart) in [1, 16, 23, 154]) and
            (StrToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) = 7) then
         begin
           sIdEvento       := '14';
           sIdSitPart      := '7';
           sIdSitPlanoPrev := '3';
           sData           := LRegEmpregado.DT_ASSOC_PPREV;
         end
         else
           if (StrToInt(sIdSitPart) in [1, 16, 23, 154]) and
              (StrToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) = 8) then
           begin
             sIdEvento       := '13';
             sIdSitPart      := '7';
             sIdSitPlanoPrev := '3';
             sData           := LRegEmpregado.DT_ASSOC_PPREV;
           end
           else
             if (StrToInt(sIdSitPart) in [1, 16, 23, 154]) and
                (StrToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) in [1, 5, 9, 13]) and
                (StrToInt(LRegEmpregado.CD_OCOR_TB23) = 25 ) then
             begin
               sIdEvento       := '4';
               sIdSitPart      := '10';
               sIdSitPlanoPrev := '3';
               sData           := LRegEmpregado.DT_PRV_DESL;
             end
             else
               if (StrToInt(sIdSitPart) = 3) and
                  (StrToInt(LRegEmpregado.CD_OCOR_TB23) = 25) then
               begin
                 sIdEvento       := '4';
                 sIdSitPart      := '10';
                 sIdSitPlanoPrev := '3';
                 sData           := LRegEmpregado.DT_PRV_DESL;
               end
               else
                 if (StrToInt(sIdSitPart) = 17)and
                    (StrToInt(LRegEmpregado.CD_OCOR_TB23) = 25) then
                 begin
                   sIdEvento       := '4';
                   sIdSitPart      := '10';
                   sIdSitPlanoPrev := '3';
                   sData           := LRegEmpregado.DT_PRV_DESL;
                 end
                 else
                   if (StrToInt(sIdSitPart) in [1, 16, 23, 154]) and
                      (StrToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) in [3, 6, 14]) and
                      (StrToInt(LRegEmpregado.CD_OCOR_TB23) = 22) then
                   begin
                     sIdEvento       := '20';
                     sIdSitPart      := '2';
                     sIdSitPlanoPrev := '1';
                     sData           := LRegEmpregado.DT_PRV_DESL;
                   end
                   else
                     if (StrToInt(sIdSitPart) = 3) and
                        (StrToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) in [3, 6, 14]) and
                        (StrToInt(LRegEmpregado.CD_OCOR_TB23) = 22) then
                     begin
                       sIdEvento       := '20';
                       sIdSitPart      := '2';
                       sIdSitPlanoPrev := '1';
                       sData           := LRegEmpregado.DT_PRV_DESL;
                     end
                     else
                       if (StrToInt(sIdSitPart) = 17) and
                          (StrToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) in [3, 6, 14]) and
                          (StrToInt(LRegEmpregado.CD_OCOR_TB23) = 22) then
                       begin
                         sIdEvento       := '20';
                         sIdSitPart      := '2';
                         sIdSitPlanoPrev := '3';
                       end
                       else
                         if (StrToInt(sIdSitPart) = 9) and
                            (StrToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) in [1, 5, 9, 13]) then
                         begin
                           sIdEvento       := '154';
                           sIdSitPart      := '1';
                           sIdSitPlanoPrev := '1';
                           sData           := LRegEmpregado.DT_READMISSAO;
                         end
                         else
                           if (StrToInt(sIdSitPart) = 5) and
                              (StrToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) = 10) then
                           begin
                             sIdEvento       := '154';
                             sIdSitPart      := '1';
                             sIdSitPlanoPrev := '1';
                             sData           := LRegEmpregado.DT_READMISSAO;
                           end
                           else
                           begin
                             Exit;
                           end;
       end;
       //FIM - CRÍTICAS gesis
     end;
  except
    exit;
  end;


  qryaux.close;
  qryaux.sql.text := ' SELECT * FROM EVENTOSPREV '+
                     ' WHERE IDPESSJUR = 91008 AND IDPESSOA = '''+sIdPessoa+''' '+
                     ' AND IDPLANOPREV = '+sIdPlanoprev+' '+
                     ' AND IDEVENTOGERADOR = '+sIdEvento+' ';
  try
    qryaux.Open;
  except
  end;

  if not qryaux.IsEmpty then
    exit;


  TrataData(sData);


  wLinha := CompletaString(sIdPessoa,' ',15,False)+
            CompletaString(sIdPlanoprev,' ',5,False)+
            LRegEmpregado.NR_MATR_EMP+
            CompletaString(sIdEvento,' ',5,False)+
            CompletaString(sIdSitFunc,' ',5,False)+
            CompletaString(sIdSitPart,' ',5,False)+
            CompletaString(sIdSitPlanoPrev,' ',5,False)+
            sData+
            sTaxa;

  WriteLn(wArquivoHistOcorFunc,wLinha);
end;



Procedure TfrmSeparadorArqFuncef.ConversaoAgenciasEFiliais;
Var
  iTamArquivo                     : longint;
  wArquivoFiliais,
  wArquivoAgencias                : TextFile;


  sNumAgencia,
  sNumFilial,
  sSaidaAgencia1,
  sSaidaAgencia2,
  sSaidaFilial1,
  sSaidaFilial2                   : string;

  bGravaAgencia                   : boolean;

begin

   memResult.Lines.Add('');
   memResult.Lines.Add('Arquivo de Unidades Operacionais');
   memResult.Lines.Add('');


   lblBarraProgresso.Visible  :=True;
   lblBarraProgresso.Update;

   //lblBarraProgresso.Caption := 'Abrindo Arquivos ...';
   Application.ProcessMessages;

   Try
     AssignFile(wArquivoImportacao, edCaminhoEntrada.Text+'\SRH11.TXT');
     Reset(wArquivoImportacao);
   Except
     memResult.Lines.Add('   Erro ao abrir o arquivo de empregados (SRH16.TXT)');
     Exit;
   End;

   Try
     AssignFile(wArquivoFiliais,edArqGravar.Text+'\CadastroFiliais.txt');
     Rewrite(wArquivoFiliais);
   Except
      CloseFile(wArquivoImportacao);
      memResult.Lines.Add('   Erro criar arquivo de saída de Filiais.');
      Exit;
   End;

   Try
      AssignFile(wArquivoAgencias,edArqGravar.Text+'\CadastroAgencias.txt');
      Rewrite(wArquivoAgencias);
   Except
      CloseFile(wArquivoImportacao);
      CloseFile(wArquivoFiliais);
      memResult.Lines.Add('   Erro criar arquivo de saída de Agências.');
      Exit;
   End;

   //lblBarraProgresso.Caption := 'Processando Arquivo de Unidades Operacionais ...';
   Application.ProcessMessages;

   iTamArquivo := VerificaTamArquivo;
   pBar.Min    := 0;
   pBar.Max    := iTamArquivo;

   sIdPlanoPrev := 'UNIDOPER';

   while not Eof(wArquivoImportacao) do
   begin
      Readln(wArquivoImportacao,wLinha);
      pBar.Position := pBar.Position + 1;
      Inc(Contador);
      Application.ProcessMessages;

      with LRegUnidOper do
      begin
         W01_CD_SUREG         := Copy(wLinha,      1     ,        3);
         W01_CD_UNID          := Copy(wLinha,      4     ,        4);
         W01_DV_UNID          := Copy(wLinha,      8     ,        1);
         W01_DT_IN_UNID       := Copy(wLinha,      9     ,        10);
         W01_NO_UNID          := Copy(wLinha,      19     ,        40);
         W01_SI_UNID          := Copy(wLinha,      59     ,        8);
         W01_NO_LOGR          := Copy(wLinha,      67     ,        50);
         W01_NO_BAI           := Copy(wLinha,      117     ,        20);
         W01_NO_CIDADE        := Copy(wLinha,      137     ,        22);
         W01_SI_UF            := Copy(wLinha,      159     ,        2);
         W01_CD_CEP           := Copy(wLinha,      161     ,        8);
         W01_CD_CLAS_UNID     := Copy(wLinha,      169     ,        2);
         W01_DT_FM_UNID       := Copy(wLinha,      171     ,        10);
         W01_ID_CAP_INT       := Copy(wLinha,      181     ,        1);
         W01_CD_CGC           := Copy(wLinha,      182     ,        14);
         W01_CD_TIP_UNID      := Copy(wLinha,      196     ,        2);
         W01_CD_DDD           := Copy(wLinha,      198     ,        4);
         W01_NR_TEL_1         := Copy(wLinha,      202     ,        8);
         W01_NR_RAMAL_1       := Copy(wLinha,      210     ,        4);
         W01_NR_RAMAL_2       := Copy(wLinha,      214     ,        4);
         W01_NR_TEL_2         := Copy(wLinha,      218     ,        8);
         W01_NR_RAMAL_3       := Copy(wLinha,      226     ,        4);
         W01_CD_CEADM         := Copy(wLinha,      230     ,        3);
      end;


      //caso a filial não esteja ativa, não importar
      if lRegUnidOper.W01_DT_FM_UNID = '01.01.0001' then  lRegUnidOper.W01_DT_FM_UNID := '00.00.0000';

      if Copy(wLinha,4,4) = '0000' then continue;

      // Se a sigla da agencia estiver preenchida, entao gravar APENAS na tabela FILIAL
      // Senao, entao gravar na tabela FILIAL e na tabela AGENCIA
      if Trim(Copy(wLinha,59,8)) = ''
      then bGravaAgencia := True
      else bGravaAgencia := False;

      // Gerar 2 linhas para filial, uma com o telefone 1 e uma com o telefone2
      // NUMFILIAL = CODIGO C.A. + / + CODIGO SUREG + / COD UNIDADE + DV
      sNumFilial    := Copy(wLinha, 230,3)+'/'+Copy(wLinha,1,3)+'/'+Copy(wLinha,4,4)+'-'+Copy(wLinha,8,1);
      sIdPessoa     := sNumFilial;
      GravaEnderecos;


      sSaidaFilial1 := sNumFilial+
                       CompletaString(lRegUnidOper.W01_NO_UNID,' ',50,True) +
                       lRegUnidOper.W01_ID_CAP_INT+ //(C- CAPITAL / I - INTERIOR)
                       CompletaString(lRegUnidOper.W01_SI_UNID,' ',15,True) + //SIGLA
                       lRegUnidOper.W01_CD_CGC+ //NUMDOCUMENTO
                       lRegUnidOper.W01_DT_FM_UNID;
      writeln(wArquivoFiliais, sSaidaFilial1);

      if bGravaAgencia
      then begin
         sNumAgencia    := Copy(wLinha,4,4)+Copy(wLinha,8,1);

         //NUMFILIAL + NUMBANCO(CAIXA)
         sSaidaAgencia1 := sNumAgencia+
                           CompletaString(lRegUnidOper.W01_NO_UNID,' ',50,True)+
                           '104';
         writeln(wArquivoAgencias, sSaidaAgencia1);

      end;
  end; // while

  //  Fecha Arquivos
  CloseFile(wArquivoImportacao);
  CloseFile(wArquivoFiliais);
  CloseFile(wArquivoAgencias);

  lblBarraProgresso.Visible  := False;
end; // ConversaoAgenciasEFiliais



Procedure TfrmSeparadorArqFuncef.ConversaoEmpregados;
Var
  iTamArquivo                     : longint;
  bSeleciona : Boolean;
  sMatAux : String;
  bRetorno : integer;
begin
   memResult.Lines.Add('');
   memResult.Lines.Add('Arquivo de Empregados');
   memResult.Lines.Add('');

   lblBarraProgresso.Visible  :=True;
   lblBarraProgresso.Update;

   Application.ProcessMessages;

   Try
     AssignFile(wArquivoImportacao, edCaminhoEntrada.Text+'\SRH16.TXT');
     Reset(wArquivoImportacao);
   Except
     memResult.Lines.Add('   Erro ao abrir o arquivo de empregados (SRH16.TXT)');
     Exit;
   End;

   Try
     AssignFile(wArquivoGravacaoModCad,edArqGravar.Text+'\EmpregadoCadastro.txt');
     Rewrite(wArquivoGravacaoModCad);
   Except
      CloseFile(wArquivoImportacao);
      memResult.Lines.Add('   Erro criar arquivo de saída de Dados Cadastrais.');
      Exit;
   End;

   Try
      AssignFile(wArquivoGravacaoEnd,edArqGravar.Text+'\Endereco.txt');
      Rewrite(wArquivoGravacaoEnd);
   Except
      CloseFile(wArquivoImportacao);
      CloseFile(wArquivoGravacaoModCad);
      memResult.Lines.Add('   Erro criar arquivo de saída de Endereços.');
      Exit;
   End;


   Try
      AssignFile(wArquivoImpEvolFunc,edArqGravar.Text+'\EvolFuncional.txt');
      Rewrite(wArquivoImpEvolFunc);
   Except
      CloseFile(wArquivoImportacao);
      CloseFile(wArquivoGravacaoModCad);
      memResult.Lines.Add('   Erro criar arquivo de saída de Evolução Funcional.');
      Exit;
   End;

   Try
     AssignFile(wArquivoGravacaoDocPessoa,edArqGravar.Text+'\EmpregadoDocumentos.txt');
     Rewrite(wArquivoGravacaoDocPessoa);
   Except
      CloseFile(wArquivoImportacao);
      CloseFile(wArquivoGravacaoModCad);
      CloseFile(wArquivoGravacaoEnd);
      memResult.Lines.Add('   Erro criar arquivo de saída de Lotações.');
      Exit;
   End;


   Try
     if trim(edarqmat.Text) <> '' then
     begin
        AssignFile(wArquivoMat,edarqmat.Text);
     end;
   Except
      CloseFile(wArquivoImportacao);
      CloseFile(wArquivoGravacaoModCad);
      CloseFile(wArquivoGravacaoEnd);
      CloseFile(wArquivoGravacaoDocPessoa);
      memResult.Lines.Add('   Erro criar arquivo de Matrículas.');
      Exit;
   End;

   Try
    AssignFile(wArquivoHistOcorFunc, edArqGravar.Text+'\Eventos.txt');
    try Append(wArquivoHistOcorFunc) except  Rewrite(wArquivoHistOcorFunc) end;
   Except
     CloseFile(wArquivoImportacao);
     CloseFile(wArquivoGravacaoModCad);
     CloseFile(wArquivoGravacaoEnd);
     CloseFile(wArquivoGravacaoDocPessoa);
     CloseFile(wArquivoImpEvolFunc);
     CloseFile(wArquivoGravacaoEvento);
     memResult.Lines.Add('   Erro ao criar arquivo de Histórico de Ocorrências Funcionais.');
     Exit;
   End;

   //lblBarraProgresso.Caption := 'Abrindo Tabela de Filiais ...';
   Application.ProcessMessages;
   with qryFilial do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT NUMFILIAL , SUBSTR(NUMFILIAL, 9,4) AS FILIALARQ FROM FILIALPESSOA WHERE FLGATIVO = ''S'' ORDER BY SUBSTR(NUMFILIAL,9,4) '); //leofuncef - 14072005 - inclusão da cláusula FLGATIVO
      Open;
   end;

   //lblBarraProgresso.Caption := 'Abrindo Tabela de Agências  ...';
   Application.ProcessMessages;
   with qryAgencia do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT A.NUMAGENCIA , SUBSTR(A.NUMAGENCIA, 1,4) AS AGENCIAARQ FROM AGENCIABANCARIA A '+
              ' WHERE  A.IDBANCO = 91008 '+
              ' AND NVL(FLGATIVO,''S'') = ''S'' '+
              ' ORDER BY SUBSTR(A.NUMAGENCIA,1,4) ');
      Open;
   end;

   //lblBarraProgresso.Caption := 'Processando Arquivo de Empregados ...';
   Application.ProcessMessages;

   iTamArquivo := VerificaTamArquivo; // conta o nº de linhas do arquivo
   pBar.Min    := 0;
   pBar.Max    := iTamArquivo;

   while not Eof(wArquivoImportacao) do
   begin
      Readln(wArquivoImportacao,wLinha);
      pBar.Position := pBar.Position + 1;
      Inc(Contador);
      Application.ProcessMessages;

      with LRegEmpregado do
      begin
         NR_MATR_EMP                 := Copy(wLinha,      1     ,        6);


         //se seleciona apenas algumas matrículas
         bSeleciona := true;
         if trim(edarqmat.Text) <> '' then
         begin
            reset( wArquivoMat);
            bSeleciona := false;
            while not Eof(wArquivoMat) do
            begin
               Readln(wArquivoMat,wLinhaMat);
               sMatAux := Trim(wLinhaMat);
               if trim(NR_MATR_EMP) = sMatAux then
                  bSeleciona := True;
            end;
         end;

         if not  bSeleciona then
         begin
            continue;
         end;



         LRegEmpregado.DV_MATR_EMP                 := Copy(wLinha,      7     ,        1);
         LRegEmpregado.NO_EMP                      := Copy(wLinha,      8     ,       40);
         LRegEmpregado.CD_CPF_EMP                  := Copy(wLinha,     48     ,       11);
         LRegEmpregado.CD_VINCULACAO_FUN           := Copy(wLinha,     59     ,        2);
         LRegEmpregado.UNID_LOT                    := Copy(wLinha,     61     ,        4);
         LRegEmpregado.UNID_CC                     := Copy(wLinha,     65     ,        4);
         LRegEmpregado.OPR_CC                      := Copy(wLinha,     69     ,        3);
         LRegEmpregado.NR_CC                       := Copy(wLinha,     72     ,        8);
         LRegEmpregado.DV_CC                       := Copy(wLinha,     80     ,        1);
         LRegEmpregado.DT_ADMISSAO                 := Copy(wLinha,     81     ,       10);
         LRegEmpregado.DT_PRV_DESL                 := Copy(wLinha,     91     ,       10);
         LRegEmpregado.CD_CARGO                    := Copy(wLinha,    101     ,        6);
         LRegEmpregado.NR_REF_SALL                 := Copy(wLinha,    107     ,        6);
         LRegEmpregado.CD_ORIG_EMP                 := Copy(wLinha,    113     ,        2);
         LRegEmpregado.CD_FUNCAO                   := Copy(wLinha,    115     ,        4);
         LRegEmpregado.CD_TIP_ASSOC_PPREV          := Copy(wLinha,    119     ,        2);
         LRegEmpregado.DT_ASSOC_PPREV              := Copy(wLinha,    121     ,       10);
         LRegEmpregado.NO_LOGR                     := Copy(wLinha,    131     ,       50);
         LRegEmpregado.NO_BAI                      := Copy(wLinha,    181     ,       20);
         LRegEmpregado.NO_CIDADE                   := Copy(wLinha,    201     ,       22);
         LRegEmpregado.SI_UF                       := Copy(wLinha,    223     ,        2);
         LRegEmpregado.CD_CEP                      := Copy(wLinha,    225     ,        8);
         LRegEmpregado.NR_TEL                      := Copy(wLinha,    233     ,        7);
         LRegEmpregado.CD_SEXO                     := Copy(wLinha,    240     ,        1);
         LRegEmpregado.DT_NASC                     := Copy(wLinha,    241     ,       10);
         LRegEmpregado.NR_CI                       := Copy(wLinha,    251     ,       12);
         LRegEmpregado.SI_UF_EXP_CI                := Copy(wLinha,    263     ,        2);
         LRegEmpregado.DT_EXPD_CI                  := Copy(wLinha,    265     ,       10);
         LRegEmpregado.CD_MUN_NAT                  := Copy(wLinha,    275     ,        6);
         LRegEmpregado.NO_PAI                      := Copy(wLinha,    281     ,       40);
         LRegEmpregado.NO_MAE                      := Copy(wLinha,    321     ,       40);
         LRegEmpregado.CD_EST_CIV                  := Copy(wLinha,    361     ,        1);
         LRegEmpregado.NR_MATR_CONJ                := Copy(wLinha,    362     ,        6);
         LRegEmpregado.QT_TPO_SERV_CEF             := Copy(wLinha,    368     ,        6);
         LRegEmpregado.QT_TPO_SERV_PUB             := Copy(wLinha,    374     ,        6);
         LRegEmpregado.QT_TPO_SERV_PRIV            := Copy(wLinha,    380     ,        6);
         LRegEmpregado.DT_ADMISSAO_SASSE           := Copy(wLinha,    386     ,       10);
         LRegEmpregado.CD_SUREG_LOT                := Copy(wLinha,    396     ,        3);
         LRegEmpregado.DT_IN_ABONO_PERM            := Copy(wLinha,    399     ,       10);
         LRegEmpregado.ID_AUX_PECULIO              := Copy(wLinha,    409     ,        1);
         LRegEmpregado.DT_DESL_PPREV               := Copy(wLinha,    410     ,       10);
         LRegEmpregado.TP_ADIC                     := Copy(wLinha,    420     ,        1);
         LRegEmpregado.PC_ADIC                     := Copy(wLinha,    421     ,        4);
         LRegEmpregado.DT_IN_EMP_CARGO_AT          := Copy(wLinha,    425     ,       10);
         LRegEmpregado.ID_CLUBE_IMOB               := Copy(wLinha,    435     ,        1);
         LRegEmpregado.CD_PIS_PASEP                := Copy(wLinha,    436     ,       11);
         LRegEmpregado.CD_CARGO_ANT                := Copy(wLinha,    447     ,        6);
         LRegEmpregado.NR_REF_SALL_ANT             := Copy(wLinha,    453     ,        6);
         LRegEmpregado.DT_CARGO_ANT                := Copy(wLinha,    459     ,       10);
         LRegEmpregado.CD_CARGO_TB74               := Copy(wLinha,    469     ,        6);
         LRegEmpregado.NR_REF_SALL_TB74            := Copy(wLinha,    475     ,        6);
         LRegEmpregado.DT_IN_BOLSA_CG_TB74         := Copy(wLinha,    481     ,       10);
         LRegEmpregado.DT_FM_BOLSA_CG_TB74         := Copy(wLinha,    491     ,       10);
         LRegEmpregado.QT_DIAS_ESTAGIO_TB74        := Copy(wLinha,    501     ,        4);
         LRegEmpregado.CD_FUNCAO_TB30              := Copy(wLinha,    505     ,        4);
         LRegEmpregado.DT_IN_EXER_FUNCAO_TB30      := Copy(wLinha,    509     ,       10);
         LRegEmpregado.DT_FM_EXER_FUNCAO_TB30      := Copy(wLinha,    519     ,       10);
         LRegEmpregado.QT_DIAS_EXER_FUNCAO_TB30    := Copy(wLinha,    529     ,        4);
         LRegEmpregado.CD_FUNCAO_TB30_2            := Copy(wLinha,    533     ,        4);
         LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_2    := Copy(wLinha,    537     ,       10);
         LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_2    := Copy(wLinha,    547     ,       10);
         LRegEmpregado.CD_FUNCAO_TB30_3            := Copy(wLinha,    557     ,        4);
         LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_3    := Copy(wLinha,    561     ,       10);
         LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_3    := Copy(wLinha,    571     ,       10);
         LRegEmpregado.DT_IN_OCOR_TB28             := Copy(wLinha,    581     ,       10);
         LRegEmpregado.CD_FUNCAO_TB30_4            := Copy(wLinha,    591     ,        4);
         LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_4    := Copy(wLinha,    595     ,       10);
         LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_4    := Copy(wLinha,    605     ,       10);
         LRegEmpregado.CD_FUNCAO_TB28_2            := Copy(wLinha,    615     ,        4);
         LRegEmpregado.PC_ADIC_TB28_2              := Copy(wLinha,    619     ,        5);
         LRegEmpregado.DT_IN_OCOR_TB28_2           := Copy(wLinha,    624     ,       10);
         LRegEmpregado.CD_OCOR_TB23                := Copy(wLinha,    634     ,        2);
         LRegEmpregado.DT_IN_CARG_DIR_TB29         := Copy(wLinha,    636     ,       10);
         LRegEmpregado.DT_FM_CARG_DIR_TB29         := Copy(wLinha,    646     ,       10);
         LRegEmpregado.PC_ADIC_TB28_3              := Copy(wLinha,    656     ,        5);
         LRegEmpregado.DT_IN_OCOR_TB28_3           := Copy(wLinha,    661     ,       10);
         LRegEmpregado.PC_ADIC_TB28_4              := Copy(wLinha,    671     ,        5);
         LRegEmpregado.DT_IN_OCOR_TB28_4           := Copy(wLinha,    676     ,       10);
         LRegEmpregado.CD_FUNCAO_TB60              := Copy(wLinha,    686     ,        4);
         LRegEmpregado.DT_IN_OCOR_TB60             := Copy(wLinha,    690     ,       10);
         LRegEmpregado.DT_IN_AD_NOT_TB60           := Copy(wLinha,    700     ,       10);
         LRegEmpregado.PC_ADIC_TB60                := Copy(wLinha,    710     ,        5);
         LRegEmpregado.QT_MIN_OCOR_TB60            := Copy(wLinha,    715     ,        5);
         LRegEmpregado.CD_FUNCAO_TB30_5            := Copy(wLinha,    720     ,        4);
         LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_5    := Copy(wLinha,    724     ,       10);
         LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_5    := Copy(wLinha,    734     ,       10);
         LRegEmpregado.CD_FUNCAO_TB30_6            := Copy(wLinha,    744     ,        4);
         LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_6    := Copy(wLinha,    748     ,       10);
         LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_6    := Copy(wLinha,    758     ,       10);
         LRegEmpregado.CD_FUNCAO_TB30_7            := Copy(wLinha,    768     ,        4);
         LRegEmpregado.DT_IN_EXER_FUNCAO_TB30_7    := Copy(wLinha,    772     ,       10);
         LRegEmpregado.DT_FM_EXER_FUNCAO_TB30_7    := Copy(wLinha,    782     ,       10);
         LRegEmpregado.PC_LER_TB_TB30_4            := Copy(wLinha,    792     ,        5);
         LRegEmpregado.PC_PPREV_TB9A               := Copy(wLinha,    797     ,        5);
         LRegEmpregado.DT_READMISSAO               := Copy(wLinha,    802     ,       10);
         LRegEmpregado.NO_EMAIL1                   := Copy(wLinha,    812     ,       60);
         LRegEmpregado.NO_EMAIL2                   := Copy(wLinha,    872     ,       60);

         If copy(CD_FUNCAO       ,1,1) = '0' Then CD_FUNCAO           :=  copy(CD_FUNCAO       ,2,3);
         If copy(CD_FUNCAO_TB30  ,1,1) = '0' Then CD_FUNCAO_TB30      :=  copy(CD_FUNCAO_TB30  ,2,3);
         If copy(CD_FUNCAO_TB30_2,1,1) = '0' Then CD_FUNCAO_TB30_2    :=  copy(CD_FUNCAO_TB30_2,2,3);
         If copy(CD_FUNCAO_TB30_3,1,1) = '0' Then CD_FUNCAO_TB30_3    :=  copy(CD_FUNCAO_TB30_3,2,3);
         If copy(CD_FUNCAO_TB30_4,1,1) = '0' Then CD_FUNCAO_TB30_4    :=  copy(CD_FUNCAO_TB30_4,2,3);
         If copy(CD_FUNCAO_TB30_5,1,1) = '0' Then CD_FUNCAO_TB30_5    :=  copy(CD_FUNCAO_TB30_5,2,3);
         If copy(CD_FUNCAO_TB30_6,1,1) = '0' Then CD_FUNCAO_TB30_6    :=  copy(CD_FUNCAO_TB30_6,2,3);
         If copy(CD_FUNCAO_TB30_7,1,1) = '0' Then CD_FUNCAO_TB30_7    :=  copy(CD_FUNCAO_TB30_7,2,3);
         If copy(CD_FUNCAO_TB28_2,1,1) = '0' Then CD_FUNCAO_TB28_2    :=  copy(CD_FUNCAO_TB28_2,2,3);
         If copy(CD_FUNCAO_TB60  ,1,1) = '0' Then CD_FUNCAO_TB60      :=  copy(CD_FUNCAO_TB60  ,2,3);

         NUMDEPIRRF                  := '0';
         NUMDEPSALF                  := '0';
         NUMDEPTOTAL                 := '0';
      end; // with

      bRetorno := 0; 
      if (not BuscaPessoa(LRegEmpregado.NR_MATR_EMP, sIdPessjur, sIdPessoa,
                sIdPlanoPrev, sFlgInterno, sIdSitPart, sIdSitFunc,
                sIdSitPlanoPrev, sIdPessjurCedido, sInscricaoData,
                bRetorno)) and (sFlgInterno <> 'AT') then
      begin
         if uppercase(sFlgInterno) <> 'AS' then  GravaEvolFunc;  //evolução funcional
         continue;
      end;

//VALORES POSSÍVEIS SÃO:
// 0 - NÃO TEM BENEFÍCIO
// 1 - PESSOA TEM BENEFÍCIO FUNCEF
// 2 - PESSOA TEM APENAS BENEFÍCIO INSS
      if bRetorno = 1 then
      begin
        continue;
      end;

       GravaModulosCadastrais(bRetorno = 0);  // Moduloscadastrais
       GravaEnderecos;          // Enderecos
       GravaDocPessoa;          // Documentos
       GravaEventos;            // Eventos
       GravaEvolFunc;  //evolução funcional
  end; // while

  //  Fecha Arquivos
  CloseFile(wArquivoGravacaoModcad);      // Moduloscadastrais
  CloseFile(wArquivoGravacaoEnd);         // Enderecos
  CloseFile(wArquivoImpEvolFunc);         // Evolução funcional
  CloseFile(wArquivoGravacaoDocPessoa);   // Documentos
  closeFile(wArquivoHistOcorFunc);


  CloseFile(wArquivoImportacao);
  if trim(edarqmat.Text) <> '' then  CloseFile(wArquivoMat);
  lblBarraProgresso.Visible  := False;
end;



Procedure TfrmSeparadorArqFuncef.ConversaoDependentes;
Var
  Aux, sMatAux : string;
  bSeleciona : Boolean;
  bRetorno : integer;
begin
  Try
    AssignFile(wArquivoImportacao, edCaminhoEntrada.Text+'\SRH13.TXT');
    Reset(wArquivoImportacao);
  Except
    ShowMessage('Erro ao abrir Arquivo de Dependentes...');
    Exit;
  End;

  Try
    if trim(edarqmat.Text) <> '' then
    begin
       AssignFile(wArquivoMat,edarqmat.Text);
    end;
  Except
     memResult.Lines.Add('   Erro criar arquivo de Matrículas.');
     Exit;
  End;


  Try
   AssignFile(wArquivoGravacaoDepen, edArqGravar.Text+'\Dependentes.txt');
   Rewrite(wArquivoGravacaoDepen);
  Except
    ShowMessage('Erro ao abrir Arquivo de Dependentes...');
    Exit;
  End;

  lblBarraProgresso.Visible  :=True;
  lblBarraProgresso.Update;

  iTamArquivo := VerificaTamArquivo;
  pBar.Min    := 0;
  pBar.Max    := iTamArquivo;

  while not Eof(wArquivoImportacao)  do
  begin
     Readln(wArquivoImportacao,wLinha);
     pBar.Position := pBar.Position + 1;
     Inc(Contador);
     Application.ProcessMessages;


     LRegDependente.NR_MATR_EMP   := CompletaString(Copy(wLinha,1,6),' ',6,False);


     //se seleciona apenas algumas matrículas
     bSeleciona := true;
     if trim(edarqmat.Text) <> '' then
     begin
        reset( wArquivoMat);
        bSeleciona := false;
        while not Eof(wArquivoMat) do
        begin
           Readln(wArquivoMat,wLinhaMat);
           sMatAux := Trim(wLinhaMat);
           if trim(LRegDependente.NR_MATR_EMP) = sMatAux then
              bSeleciona := True;
        end;
     end;

     if not  bSeleciona then
     begin
        continue;
     end;



     LRegDependente.SQ_DEP        := CompletaString(Copy(wLinha,7,2),' ',2,False);
     LRegDependente.NO_DEP        := CompletaString(Copy(wLinha,9,40),' ',40,False);
     LRegDependente.DT_NASC_DEP   := CompletaString(Copy(wLinha,49,10),' ',10,False);
     LRegDependente.CD_SEXO       := CompletaString(Copy(wLinha,59,1),' ',1,False);
     LRegDependente.CD_EST_CIV    := CompletaString(Copy(wLinha,60,1),' ',1,False);
     LRegDependente.CD_REL_DEPND  := CompletaString(Copy(wLinha,61,1),' ',1,False);
     LRegDependente.ID_IR         := CompletaString(Copy(wLinha,62,1),' ',1,False);
     LRegDependente.ID_INVALIDEZ  := CompletaString(Copy(wLinha,63,1),' ',1,False);
     LRegDependente.ID_SF_INSS    := CompletaString(Copy(wLinha,65,1),' ',1,False);
     LRegDependente.DT_IN_DEP     := CompletaString(Copy(wLinha,66,10),' ',10,False);


     if (not BuscaPessoa(LRegDependente.NR_MATR_EMP, sIdPessjur, sIdPessoa,
               sIdPlanoPrev, sFlgInterno, sIdSitPart, sIdSitFunc,
               sIdSitPlanoPrev, sIdPessjurCedido, sInscricaoData,
               bRetorno)) and (sFlgInterno <> 'AT') then
       continue;

     if trim(sIdPessjurCedido) <> '' then continue; //participantes LEF

     if (trim(sIdSitFunc) = '58') or (trim(sIdSitFunc) = '59') then continue; //conselheiros

     GravaDepend;
  end;

  { Fecha Arquivos}
  closeFile(wArquivoGravacaoDepen);
  closeFile(wArquivoImportacao);

  lblBarraProgresso.Visible  :=False;

end;

procedure TfrmSeparadorArqFuncef.btnArqProcessarClick(Sender: TObject);
begin
  inherited;
  // Abre a Gravação e Testa Retorno
  if (ProcuraDirDlg1.Execute)
  then begin
     edCaminhoEntrada.Text := UpperCase(ProcuraDirDlg1.Directory);
     if Trim(edArqGravar.Text) = ''
     then
     begin
        edArqGravar.Text := edCaminhoEntrada.Text;
     end;
  end;
end;

procedure TfrmSeparadorArqFuncef.spedArqGravarClick(Sender: TObject);
begin
  inherited;
  // Abre a Gravação e Testa Retorno
  if (ProcuraDirDlg1.Execute)
  then edArqGravar.Text := UpperCase(ProcuraDirDlg1.Directory);
end;

Procedure TfrmSeparadorArqFuncef.GravaDepend;
begin

  { Gravar Novo Registro Dependentes}

  sAux := LRegDependente.DT_NASC_DEP;
  TrataData(sAux);
  LRegDependente.DT_NASC_DEP := sAux;

  wLinha :=     CompletaString(sIdPessoa,' ',15,False)+
                CompletaString(sIdPlanoprev,' ',5,False)+
                LRegDependente.NR_MATR_EMP+
                LRegDependente.SQ_DEP+
                LRegDependente.NO_DEP+
                sAux+
                LRegDependente.CD_SEXO;

  if LRegDependente.CD_EST_CIV  = '1' then wLinha := wLinha + 'S' else
  if LRegDependente.CD_EST_CIV  = '2' then wLinha := wLinha + 'C'else
  if LRegDependente.CD_EST_CIV  = '3' then wLinha := wLinha + 'V'else
  if LRegDependente.CD_EST_CIV  = '4' then wLinha := wLinha + 'E'else
  if LRegDependente.CD_EST_CIV  = '5' then wLinha := wLinha + 'D'else
  if LRegDependente.CD_EST_CIV  = '6' then wLinha := wLinha + 'J'
  else wLinha := wLinha + 'S';

  If LRegDependente.CD_REL_DEPND = 'B'
  Then wLinha := wLinha + 'OUT'
  Else If LRegDependente.CD_REL_DEPND = 'C'
  Then wLinha := wLinha + 'COM'
  Else If LRegDependente.CD_REL_DEPND = 'E'
  Then wLinha := wLinha + 'EXC'
  Else If LRegDependente.CD_REL_DEPND = 'F'
  Then wLinha := wLinha + 'FIL'
  Else If LRegDependente.CD_REL_DEPND = 'I'
  Then wLinha := wLinha + 'IRM'
  Else If LRegDependente.CD_REL_DEPND = 'O'
  Then wLinha := wLinha + 'OUT'
  Else If LRegDependente.CD_REL_DEPND = 'P'
  Then wLinha := wLinha + 'PAI'
  Else If LRegDependente.CD_REL_DEPND = 'T'
  Then wLinha := wLinha + 'OUT' ;


  If LRegDependente.ID_IR = 'S'
  Then wLinha := wLinha + '1'
  Else wLinha := wLinha + '0' ;

  If LRegDependente.ID_INVALIDEZ = 'S'
  Then wLinha := wLinha + '1'
  Else wLinha := wLinha + '0' ;

  If LRegDependente.ID_SF_CEF = 'S'
  Then wLinha := wLinha + '1'
  Else wLinha := wLinha + '0' ;

  If LRegDependente.ID_SF_INSS = 'S'
  Then wLinha := wLinha + '1'
  Else wLinha := wLinha + '0' ;

  sAux := LRegDependente.DT_IN_DEP;
  TrataData(sAux);
  LRegDependente.DT_IN_DEP := sAux;

  wLinha := wLinha + sAux;

  WriteLn(wArquivoGravacaoDepen,wLinha);
end;

procedure TfrmSeparadorArqFuncef.FormCreate(Sender: TObject);
begin
  inherited;

  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  odTxt.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  ProcuraDirDlg1.Directory := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  memResult.Lines.Clear;

  CMValidaDoc := TCMValidaDoc.Create(nil);
end;



Procedure TfrmSeparadorArqFuncef.ConversaoConsigEspeciais;
Var
  Aux,
  sNumdepSalF,
  sIdessoaFisica,
  sNumDcoumento,
  sNome,
  sIdCBancaria,
  sContaCorrente,
  sIdAgencia,
  sFlgContaPref,
  sTipoConta,
  sPercPensao,
  sSeqConsig,
  sIdTitular,
  sIdPessoaFisica,
  sIdParamSeqConsig,
  sIdParamPensao : String;
  bRetorno : integer;
begin
  memResult.Lines.Add('');
  memResult.Lines.Add('Arquivo de Consignatários Especiais');
  memResult.Lines.Add('');

  Try
    AssignFile(wArquivoImportacao, edCaminhoEntrada.Text+'\SRH2.TXT');
    Reset(wArquivoImportacao);
  Except
    memResult.Lines.Add('   Erro ao abrir Arquivo Consignatários Especiais.');
    Exit;
  End;

  iTamArquivo := VerificaTamArquivo;
  pBar.Min    := 0;
  pBar.Max    := iTamArquivo;

  lblBarraProgresso.Visible  :=True;
  lblBarraProgresso.Update;


  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;


  while not Eof(wArquivoImportacao)  do
  begin
     pBar.Position := pBar.Position + 1;
     Inc(Contador);
     Readln(wArquivoImportacao,wLinha);
     Application.ProcessMessages;


     sNumDcoumento := '';
     sNome :=  '';
     sNumdepSalF := '';
     sIdPessoaFisica := '';
     sIdPessoa := '';

     sIdCBancaria := '';
     sContaCorrente := '';
     sIdAgencia := '';
     sFlgContaPref := '';
     sTipoConta := '';

     sPercPensao := '';
     sSeqConsig := '';
     sIdParamSeqConsig := '';
     sIdParamPensao := '';


     LRegConsigEspecial.NR_MATR_EMP       := Copy(wLinha,1,6);
     LRegConsigEspecial.SQ_COSIG_ESP      := Copy(wLinha,7,2);
     LRegConsigEspecial.CD_TIP_COSIG_ESP  := Copy(wLinha,9,1);
     LRegConsigEspecial.NO_COSI_ESP       := Copy(wLinha,10,40);
     LRegConsigEspecial.CD_CPF_COSIG_ESP  := Copy(wLinha,50,11);
     LRegConsigEspecial.CD_UNID_CC        := Copy(wLinha,61,4);
     LRegConsigEspecial.CD_OPR_CC         := Copy(wLinha,65,3);

     LRegConsigEspecial.NR_CC             := Copy(wLinha,68,11);
     LRegConsigEspecial.DV_CC             := Copy(wLinha,79,2);
     LRegConsigEspecial.PC_INC            := Copy(wLinha,81,8);
     LRegConsigEspecial.QT_DEP_SF         := Copy(wLinha,91,2);
     LRegConsigEspecial.NU_BANCO          := trim(Copy(wLinha,96,3));

     if trim(LRegConsigEspecial.NR_MATR_EMP)  <> trim(sMatriculaAnt) then
     begin
       sMatriculaAnt := LRegConsigEspecial.NR_MATR_EMP;

       if not BuscaPessoa(LRegConsigEspecial.NR_MATR_EMP, sIdPessjur,
                sIdTitular, sIdPlanoPrev,sFlgInterno, sIdSitPart, sIdSitFunc,
                sIdSitPlanoPrev, sIdPessjurCedido, sInscricaoData,
                bRetorno) then
         continue;

       if trim(sIdTitular) = '' then
       begin
         memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - não encontrada no sistema.');
         continue;
       end;
     end
     else
       if ((trim(LRegConsigEspecial.NR_MATR_EMP) = trim(sMatriculaAnt)) and
          (cdsBuscaPessoa.isempty)) then
       begin
         continue;
       end;

     //PARÂMETROS DA PESSOA
     {PARAMFLAGPESSOA (IDPARAM   TIPO    VALIDACAO   DESCRICAO
                       4          V         NULO     PERCENTUAL DE PENSÃO
                       5          V         NULO     SEQ. DO CONSIGNATÁRIO ESPECIAL
                       6          V         NULO     IDPESSOA DO TITULAR }
     qryaux.Close;
     qryaux.sql.text := ' SELECT  '+
                        ' PF.NUMDEPSALF, PF.IDPESSOA IDPESSOAFISICA, '+
                        ' P.NUMDOCUMENTO , P.NOME, P.IDPESSOA, '+
                        ' C.IDCBANCARIA, C.CONTACORRENTE, C.IDAGENCIA, '+
                        ' C.FLGCONTAPREF, C.TIPOCONTA, '+
                        ' PP.IDPARAM IDPARAMPENSAO, PP.VALOR PERCPENSAO, '+
                        ' PS.VALOR SEQCONSIG, PS.IDPARAM IDPARAMSEQCONSIG '+
                        ' FROM PESSOA P , PESSOAFISICA PF , CONTABANCARIA C,  '+
                        ' PESSOAPARAM PP, PESSOAPARAM PS, PESSOAPARAM PID '+
                        ' WHERE PID.IDPARAM = 6 '+
                        ' AND LTRIM(RTRIM(PID.VALOR)) = '''+Trim(sIdTitular)+''' '+
                        ' AND P.IDPESSOA = PID.IDPESSOA '+
                        ' AND PF.IDPESSOA(+) = P.IDPESSOA '+
                        ' AND C.IDPESSOA(+) = P.IDPESSOA'+
                        ' AND C.FLGCONTAPREF(+) = 1 '+
                        ' AND PP.IDPESSOA(+) = P.IDPESSOA '+
                        ' AND PP.IDPARAM(+) = 4 '+
                        ' AND PS.IDPESSOA(+) = P.IDPESSOA '+
                        ' AND PS.IDPARAM(+) = 5 ';
     qryaux.open;

     if not qryaux.isempty then
     begin
       sNumDcoumento := qryaux.fieldbyname('NUMDOCUMENTO').AsString;
       sNome :=  qryaux.fieldbyname('NOME').AsString;
       sNumdepSalF :=  qryaux.fieldbyname('NUMDEPSALF').AsString;
       sIdPessoaFisica := qryaux.fieldbyname('IDPESSOAFISICA').AsString;
       sIdPessoa := qryaux.fieldbyname('IDPESSOA').AsString;

       sIdCBancaria := qryaux.fieldbyname('IDCBANCARIA').AsString;
       sContaCorrente := qryaux.fieldbyname('CONTACORRENTE').AsString;
       sIdAgencia := qryaux.fieldbyname('IDAGENCIA').AsString;
       sFlgContaPref := qryaux.fieldbyname('FLGCONTAPREF').AsString;
       sTipoConta := qryaux.fieldbyname('TIPOCONTA').AsString;

       sPercPensao := qryaux.fieldbyname('PERCPENSAO').AsString;
       sSeqConsig := qryaux.fieldbyname('SEQCONSIG').AsString;
       sIdParamSeqConsig := qryaux.fieldbyname('IDPARAMSEQCONSIG').AsString;
       sIdParamPensao := qryaux.fieldbyname('IDPARAMPENSAO').AsString;
     end;

     if trim(sIdAgencia) = '' then  sIdAgencia := LRegConsigEspecial.CD_UNID_CC;

     //ainda não exite nem como pessoa
     //inserir
     if qryaux.isempty then
     begin
        try

        qryaux.close;
        qryaux.sql.text := ' SELECT SEQPESSOA.NEXTVAL ID FROM DUAL';
        qryaux.Open;
        sIdPessoa := qryaux.fieldbyname('ID').AsString;

        qryaux.close;
        qryaux.SQL.text := ' INSERT INTO PESSOA(IDPESSOA , NOME , TIPO, FLGFORNSERV, NUMDOCUMENTO) '+
                           ' SELECT '+sIdpessoa+','+QuotedStr(LRegConsigEspecial.NO_COSI_ESP)+', ''F'', '+
                           ' 1, '''+LRegConsigEspecial.CD_CPF_COSIG_ESP+''' '+
                           ' FROM DUAL';

           qryaux.execsql;
        except
           memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Sequencial: '+LRegConsigEspecial.SQ_COSIG_ESP+' - Erro na inclusão da pessoa.');
        end;


        //FORNSERV
        try
           qryaux.close;
           qryaux.SQL.text := ' INSERT INTO FORNSERV(IDPESSOA) '+
                           ' VALUES('+sIdpessoa+') ';

           qryaux.execsql;
        except
           memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Sequencial: '+LRegConsigEspecial.SQ_COSIG_ESP+' - Erro na inclusão em FORNSERV.');
        end;


        //IDTITULAR
        try
           qryaux.close;
           qryaux.SQL.text := ' INSERT INTO PESSOAPARAM(IDPESSOA, IDPARAM, VALOR, DATAINICIO ) '+
                           ' SELECT '''+sIdpessoa+''', 6, '''+sIdTitular+''', TRUNC(SYSDATE) '+
                           ' FROM DUAL';

           qryaux.execsql;
        except
           memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Erro na inclusão do Identificador do Titular.');
        end;
     end
     else
     begin
        try
           qryaux.close;
           qryaux.SQL.text := ' UPDATE PESSOA SET '+
                           ' NOME = '+QuotedStr(LRegConsigEspecial.NO_COSI_ESP)+', '+
                           ' TIPO = ''F'', '+
                           ' FLGFORNSERV = 1 , '+
                           ' NUMDOCUMENTO = '''+LRegConsigEspecial.CD_CPF_COSIG_ESP+''' '+
                           ' WHERE IDPESSOA =  '+sIdpessoa+' ';

           qryaux.execsql;
        except
           memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Sequencial: '+LRegConsigEspecial.SQ_COSIG_ESP+' - Erro na alteração da pessoa.');
        end;
     end;

     //atualiza pessoa

     //não existe em pessoafisica
     if sIdPessoaFisica = '' then
     begin
        try
           qryaux.close;
           qryaux.SQL.text := ' INSERT INTO PESSOAFISICA(IDPESSOA , NUMDEPSALF) '+
                           ' SELECT '+sIdpessoa+',nvl('''+sNumdepSalF+''',0) '+
                           ' FROM DUAL';

           qryaux.execsql;
        except
           memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Sequencial: '+LRegConsigEspecial.SQ_COSIG_ESP+' - Erro na inclusão da pessoa.');
        end;
     end
     else
     begin
        try
           qryaux.close;
           qryaux.SQL.text := ' UPDATE PESSOAFISICA SET '+
                           ' NUMDEPSALF = '''+sNumdepSalF+''' '+
                           ' WHERE IDPESSOA =  '+sIdpessoa+' ';

           qryaux.execsql;
        except
           memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Sequencial: '+LRegConsigEspecial.SQ_COSIG_ESP+' - Erro na alteração da pessoa.');
        end;
     end;


     //CONTABANCARIA
     if LRegConsigEspecial.CD_UNID_CC <> '0000' then
     begin
        if sIdCBancaria = '' then
        begin
           if trim(sIdAgencia) = '' then
           begin
              memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Agência não informada no arquivo texto.');
           end
           else
           begin
              qryaux.close;
              qryaux.sql.text := ' SELECT IDPESSOA FROM AGENCIABANCARIA WHERE NUMAGENCIA LIKE ''%'+LRegConsigEspecial.CD_UNID_CC+'%'' '+
                                 ' AND IDBANCO = (SELECT IDPESSOA FROM BANCO WHERE NUMBANCO = '''+LRegConsigEspecial.NU_BANCO+''' ) ';
              qryaux.Open;


              if qryaux.isempty then
              begin
                 sIdAgencia := '';
                 memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Agência: '+sIdAgencia+' não encontrada no sistema.');
              end
              else
              begin
                 sIdAgencia := qryaux.fieldbyname('IDPESSOA').AsString; 

                 //inserir dados bancários
                 qryaux.close;
                 qryaux.sql.text := ' SELECT SEQCONTABANCARIA.NEXTVAL ID FROM DUAL ';
                 qryaux.Open;
                 sIdCBancaria := qryaux.fieldbyname('ID').AsString;

                 try
                    qryaux.close;
                    qryaux.SQL.text := ' INSERT INTO CONTABANCARIA(IDCBANCARIA, CONTACORRENTE, IDAGENCIA, FLGCONTAPREF, IDPESSOA, TIPOCONTA) '+
                                    ' SELECT '+sIdCBancaria+','''+sContaCorrente+''', '''+sIdAgencia+''', '+
                                    ' 1,'''+sIdpessoa+''', ''1'' '+
                                    ' FROM DUAL';

                    qryaux.execsql;
                 except
                    memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Sequencial: '+LRegConsigEspecial.SQ_COSIG_ESP+' - Erro na inclusão da conta bancária.');
                 end;
              end;
           end;
        end
        else
        begin
           qryaux.close;
           qryaux.sql.text := ' SELECT IDPESSOA FROM AGENCIABANCARIA WHERE NUMAGENCIA LIKE ''%'+LRegConsigEspecial.CD_UNID_CC+'%'' '+
                              ' AND IDBANCO = (SELECT IDPESSOA FROM BANCO WHERE NUMBANCO = '''+LRegConsigEspecial.NU_BANCO+''' ) ';
           qryaux.Open;


           if qryaux.isempty then
           begin
              memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Agência: '+LRegConsigEspecial.CD_UNID_CC+' não encontrada no sistema.');
              sIdAgencia := '';
           end
           else
           begin
              sIdAgencia := qryaux.fieldbyname('IDPESSOA').AsString; //leofuncef - 27092005

              //Renato Visoni SOL 128443 KINTANA 689369
              {try
                 qryaux.close;
                 qryaux.SQL.text := ' UPDATE CONTABANCARIA SET '+
                                 ' CONTACORRENTE = '''+sContaCorrente+''', '+
                                 ' IDAGENCIA = '''+sIdAgencia+''', '+
                                 ' FLGCONTAPREF = 1, '+
                                 ' TIPOCONTA = 1 '+
                                 ' WHERE IDCBANCARIA =  '+sIdCBancaria+' ';
                 qryaux.execsql;
              except
                 memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Sequencial: '+LRegConsigEspecial.SQ_COSIG_ESP+' - Erro na atualização da conta bancária.');
              end;
              }
              //Renato Visoni SOL 128443 KINTANA 689369
              
           end;
        end;
     end;


     //PESSOAPARAM
     //percentual de pensão
     if LRegConsigEspecial.PC_INC <> '000000000' then
     begin

        if sIdParamPensao = '' then
        begin
           //inserir parâmetro
           sAux := LRegConsigEspecial.PC_INC;
           try
              qryaux.close;
              qryaux.SQL.text := ' INSERT INTO PESSOAPARAM(IDPESSOA, IDPARAM, VALOR, DATAINICIO) '+
                              ' SELECT '''+sIdpessoa+''', 4, '''+TrataNumero(sAux,4)+''', TRUNC(SYSDATE) '+
                              ' FROM DUAL';

              qryaux.execsql;
           except
              memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Erro na inclusão do percentual de pensão.');
           end;
        end
        else
        begin
           //atualizar parâmetro
           sAux := LRegConsigEspecial.PC_INC;
           try
              qryaux.close;
              qryaux.SQL.text := ' UPDATE PESSOAPARAM SET VALOR = '''+TrataNumero(sAux,4)+''' '+
                              ' WHERE IDPESSOA = '''+sIdpessoa+''' '+
                              ' AND IDPARAM =  4 ';
              qryaux.execsql;
           except
              memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Erro na alteração do percentual de pensão.');
           end;
        end;
     end;


     //qtde dep. sal família
     if LRegConsigEspecial.QT_DEP_SF <> '00' then
     begin

        if sIdParamSeqConsig = '' then
        begin
           //inserir parâmetro
           try
              qryaux.close;
              qryaux.SQL.text := ' INSERT INTO PESSOAPARAM(IDPESSOA, IDPARAM, VALOR, DATAINICIO) '+
                              ' SELECT '''+sIdpessoa+''', 5, '''+LRegConsigEspecial.QT_DEP_SF+''', TRUNC(SYSDATE) '+
                              ' FROM DUAL';

              qryaux.execsql;
           except
              memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Erro na inclusão N. de Dep. Salário família.');
           end;
        end
        else
        begin
           //atualizar parâmetro
           try
              qryaux.close;
              qryaux.SQL.text := ' UPDATE PESSOAPARAM SET VALOR = '''+LRegConsigEspecial.QT_DEP_SF+''' '+
                              ' WHERE IDPESSOA = '''+sIdpessoa+''' '+
                              ' AND IDPARAM =  5 ';
              qryaux.execsql;
           except
              memResult.Lines.Add('   Matrícula: '+LRegConsigEspecial.NR_MATR_EMP+' - Erro na alteração do N. de Dep. Salário família.');
           end;
        end;
     end;


  end;

  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.Commit;

  closeFile(wArquivoImportacao);

  lblBarraProgresso.Visible  :=False;
end;




Procedure TfrmSeparadorArqFuncef.ConversaoHistOcorFunc;
Var
  Aux, sMatAux, wLinhaPADV : string;
  wArquivoPADV  : TextFile;
  bRetorno : integer;
begin
  memResult.Lines.Add('');
  memResult.Lines.Add('Arquivo de Histórico de Ocorrências Funcionais');
  memResult.Lines.Add('');

  Try
    AssignFile(wArquivoImportacao, edCaminhoEntrada.Text+'\SRH5.TXT');
    Reset(wArquivoImportacao);
  Except
    memResult.Lines.Add('   Erro ao abrir Arquivo de Histórico de Ocorrências Funcionais.');
    Exit;
  End;


  Try
    AssignFile(wArquivoPADV, edCaminhoEntrada.Text+'\SRH19.TXT');
    Reset(wArquivoPADV);
  Except
    memResult.Lines.Add('   Erro ao abrir Arquivo de PADV.');
    Exit;
  End;



  Try
   AssignFile(wArquivoHistOcorFunc, edArqGravar.Text+'\Eventos.txt');
   Rewrite(wArquivoHistOcorFunc);
  Except
    memResult.Lines.Add('   Erro ao criar arquivo de Histórico de Ocorrências Funcionais.');
    Exit;
  End;

  lblBarraProgresso.Visible  :=True;
  lblBarraProgresso.Update;


  iTamArquivo := VerificaTamArquivo;
  pBar.Min    := 0;
  pBar.Max    := iTamArquivo;


  while not Eof(wArquivoImportacao)  do
  begin
     Readln(wArquivoImportacao,wLinha);
     pBar.Position := pBar.Position + 1;
     Inc(Contador);
     Application.ProcessMessages;


     LRegHistOcorFunc.NR_MATR_EMP   := Copy(wLinha,1,6);

     if not BuscaPessoa(LRegHistOcorFunc.NR_MATR_EMP, sIdPessjur, sIdPessoa,
              sIdPlanoPrev, sFlgInterno, sIdSitPart, sIdSitFunc,
              sIdSitPlanoPrev, sIdPessjurCedido, sInscricaoData,
              bRetorno) then
       continue;

     if trim(sIdpessoa) = '' then
     begin
       memResult.Lines.Add('   Matrícula: '+LRegHistOcorFunc.NR_MATR_EMP+' - não encontrada no sistema.');
       continue;
     end;

     LRegHistOcorFunc.CD_OCOR       := Copy(wLinha,7,4);
     LRegHistOcorFunc.DT_IN_LICA    := Copy(wLinha,11,10);

     {TOTALPREV	                   SRH-UNLD37 (CD-OCOR)
     47-Juiz Classista s/ ônus	              67-Juiz Classista s/ ônus
     40-Cessão sem ônus	                     41-Cessão sem ônus
     65-Cessão com TS ressarcimento	         43-Cessão com TS ressarcimento
     41-Cessão c/ Tempo Serviço s/ ônus	     44-Cessão c/ Tempo Serviço s/ ônus
     42-Licença p/ Acompanhar cônjuge	       50-Licença p/ Acompanhar cônjuge
     44-Suspensão art. 494 CLT	              52-Suspensão art. 494 CLT
     45-Suspensão outros motivos	            53-Suspensão outros motivos
     66-Disp. Exer. Cargo Sind./Fed. s/ ônus	58-Disp. Exer. Cargo Sind./Fed. s/ ônus
     67-Suspensão Disciplinar	               60-Suspensão Disciplinar
     48-Prisão	                              80-Prisão Trânsito Julgado
     49-Prisão Preventiva	                   81-Prisão Preventiva
     69-Lic. Campanha Eleitoral	             92-Lic. Campanha Eleitoral
     55-Aposentadoria Temporária	            93-Aposentadoria Temporária
     70-Exerc. Cargo APCEF/FENAE	            94-Exerc. Cargo APCEF/FENAE
     51-Lic. Desempenho Mandato Efetivo s/ ônus	97-Lic. Desempenho Mandato Efetivo s/ ônus
     72-Afastamento s/ efetivo exercício/readmissão	107-Afastamento s/ efetivo exercício/ readmissão
     52-Afastamento outros motivos	                 99-Afastamento outros motivos


     OBS1)  Se surgir no arquivo UNLD37 (CD-OCOR 9 (04) ) códigos diferentes
     do mencionado acima , gerar relatório de critica constando a
     matricula e o número do código.}

     if LRegHistOcorFunc.CD_OCOR = '0047' then LRegHistOcorFunc.CD_OCOR := '47'
     else if LRegHistOcorFunc.CD_OCOR = '0041' then LRegHistOcorFunc.CD_OCOR := '40'
     else if LRegHistOcorFunc.CD_OCOR = '0043' then LRegHistOcorFunc.CD_OCOR := '65'
     else if LRegHistOcorFunc.CD_OCOR = '0044' then LRegHistOcorFunc.CD_OCOR := '41'
     else if LRegHistOcorFunc.CD_OCOR = '0050' then LRegHistOcorFunc.CD_OCOR := '42'
     else if LRegHistOcorFunc.CD_OCOR = '0052' then LRegHistOcorFunc.CD_OCOR := '44'
     else if LRegHistOcorFunc.CD_OCOR = '0053' then LRegHistOcorFunc.CD_OCOR := '45'
     else if LRegHistOcorFunc.CD_OCOR = '0058' then LRegHistOcorFunc.CD_OCOR := '66'
     else if LRegHistOcorFunc.CD_OCOR = '0070' then LRegHistOcorFunc.CD_OCOR := '67'
     else if LRegHistOcorFunc.CD_OCOR = '0080' then LRegHistOcorFunc.CD_OCOR := '48'
     else if LRegHistOcorFunc.CD_OCOR = '0081' then LRegHistOcorFunc.CD_OCOR := '49'
     else if LRegHistOcorFunc.CD_OCOR = '0092' then LRegHistOcorFunc.CD_OCOR := '69'
     else if LRegHistOcorFunc.CD_OCOR = '0093' then LRegHistOcorFunc.CD_OCOR := '55'
     else if LRegHistOcorFunc.CD_OCOR = '0094' then LRegHistOcorFunc.CD_OCOR := '70'
     else if LRegHistOcorFunc.CD_OCOR = '0097' then LRegHistOcorFunc.CD_OCOR := '51'
     else if LRegHistOcorFunc.CD_OCOR = '0107' then LRegHistOcorFunc.CD_OCOR := '72'
     else if LRegHistOcorFunc.CD_OCOR = '0080' then LRegHistOcorFunc.CD_OCOR := '48'
     else if LRegHistOcorFunc.CD_OCOR = '0099' then LRegHistOcorFunc.CD_OCOR := '52'
     else if LRegHistOcorFunc.CD_OCOR = '0051' then
     begin
       LRegHistOcorFunc.CD_OCOR := '43';

       reset( wArquivoPADV);
       while not Eof(wArquivoPADV) do
       begin
         Readln(wArquivoPADV,wLinhaPADV);
         sMatAux := Copy(wLinhaPADV,1,6);
         if trim(LRegHistOcorFunc.NR_MATR_EMP) = sMatAux then
         begin
           if Copy(wLinhaPADV,      50    ,        1) <> '1' then
             LRegHistOcorFunc.CD_OCOR := '43'
           else
             LRegHistOcorFunc.CD_OCOR := '73';
         end;
       end;
     end
     else
     begin
       memResult.Lines.Add('   Matrícula: '+LRegHistOcorFunc.NR_MATR_EMP+' - Código criticado: '+LRegHistOcorFunc.CD_OCOR+'.');
       continue;
     end;

     //troca pontos por barras
     sAux := LRegHistOcorFunc.DT_IN_LICA;
     TrataData(sAux);
     LRegHistOcorFunc.DT_IN_LICA := sAux;


     if (trim(LRegHistOcorFunc.CD_OCOR) = sIdSitFunc) and
        not (strtoint(sIdSitFunc) in [7,40,65,41,42,44,45,66,67,48,49,69,55,70,51,72,52]) //casos de afastamento que tem sua data de inicio atualizada
        then
       continue;

     wLinha := CompletaString(sIdPessoa,' ',15,False)+
               CompletaString(sIdPlanoprev,' ',5,False)+
               LRegHistOcorFunc.NR_MATR_EMP+
               '     '+ //idevento
               CompletaString(LRegHistOcorFunc.CD_OCOR,' ',5,False)+ //idsitfunc
               '     '+//idsitpart
               '     '+//idsitplanoprev
               LRegHistOcorFunc.DT_IN_LICA;

     WriteLn(wArquivoHistOcorFunc,wLinha);
  end;

  { Fecha Arquivos}
  closeFile(wArquivoHistOcorFunc);
  closeFile(wArquivoImportacao);
  closeFile(wArquivoPADV);

  lblBarraProgresso.Visible  :=False;
end;

Procedure TfrmSeparadorArqFuncef.ConversaoRubricas;
Var
  Aux, sFlgDesconto , sFlgTpRubrica, sFlgAtrasoDevol : string;
begin
  memResult.Lines.Add('');
  memResult.Lines.Add('Arquivo de Rubricas');
  memResult.Lines.Add('');

  Try
    AssignFile(wArquivoImportacaoAux, edCaminhoEntrada.Text+'\SRH8.TXT');
    Reset(wArquivoImportacaoAux);
    AssignFile(wArquivoImportacao, edCaminhoEntrada.Text+'\SRH9.TXT');
    Reset(wArquivoImportacao);
  Except
    memResult.Lines.Add('   Erro ao abrir Arquivos de Rubricas - SRH8/SRH9.');
    Exit;
  End;

  Try
    AssignFile(wArquivoRubricas, edArqGravar.Text+'\Rubricas.txt');
    Rewrite(wArquivoRubricas);
  Except
    memResult.Lines.Add('   Erro ao criar arquivo de Rubricas.');
    Exit;
  End;

  lblBarraProgresso.Visible  :=True;
  lblBarraProgresso.Update;

  iTamArquivo := VerificaTamArquivo;
  pBar.Min    := 0;
  pBar.Max    := iTamArquivo;

  //lembrar de fazer o loop procurando o mesmo código nos dois arquivos
  while not Eof(wArquivoImportacao)  do
  begin
     Readln(wArquivoImportacao,wLinha);
     pBar.Position := pBar.Position + 1;
     Inc(Contador);
     Application.ProcessMessages;

     LRegRubricas.CD_TIP_RUB := Copy(wLinha,1,1);
     LRegRubricas.CD_RUB   := Copy(wLinha,2,3);

     reset(wArquivoImportacaoAux);
     while not Eof(wArquivoImportacaoAux) do
     begin
       Readln(wArquivoImportacaoAux,wLinha);

       if LRegRubricas.CD_RUB   = Copy(wLinha,1,3) then
       begin
         LRegRubricas.NO_RUB     := Copy(wLinha,4,40);
         break;
       end;
     end;

     if StrToInt(LRegRubricas.CD_RUB) < 300 then
       sFlgDesconto := '0'
     else
       sFlgDesconto := '1';

     if trim(LRegRubricas.CD_TIP_RUB) <> '' then
     begin
        case strtoint(LRegRubricas.CD_TIP_RUB) of
           1:
           begin
              LRegRubricas.NO_RUB := 'AC. '+LRegRubricas.NO_RUB;
              sFlgAtrasoDevol := 'A';
           end; //acerto
           2:
           begin
              sFlgAtrasoDevol := 'N';
           end ; //proventos
           3:
           begin
              LRegRubricas.NO_RUB := 'REP. '+LRegRubricas.NO_RUB;
              sFlgAtrasoDevol := 'D';
           end;//reposição
           4:
           begin
              sFlgAtrasoDevol := 'N';
           end; //normal
        end;
     end;

     sFlgTpRubrica := 'P';

     wLinha := LRegRubricas.CD_TIP_RUB+
               LRegRubricas.CD_RUB+
               CompletaString(LRegRubricas.NO_RUB,' ',50,True)+
               sFlgDesconto+
               sFlgTpRubrica+
               sFlgAtrasoDevol;

     WriteLn(wArquivoRubricas,wLinha);
  end;

  { Fecha Arquivos}
  closeFile(wArquivoRubricas);
  closeFile(wArquivoImportacao);
  closeFile(wArquivoImportacaoAux);

  lblBarraProgresso.Visible  :=False;

end;

Function TfrmSeparadorArqFuncef.BuscaPessoa(sMat : String;
                                            var sIdPessjur,
                                            sIdPessoa,
                                            sIdPlanoPrev,
                                            sFlgInterno,
                                            sIdSitPart,
                                            sIdSitFunc,
                                            sIdSitPlanoPrev,
                                            sIdPessjurCedido,
                                            sInscricaoData : String;
                                            var pbRetorno : integer) : Boolean;
//VALORES POSSÍVEIS SÃO:
// 0 - NÃO TEM BENEFÍCIO
// 1 - PESSOA TEM BENEFÍCIO FUNCEF
// 2 - PESSOA TEM APENAS BENEFÍCIO INSS
var bTemINSS, bTemFund, bTemPensao : boolean;
    sSql : String;
begin
  Result           := false;

  sIdPessjur       := '';
  sIdPessoa        := '';
  sIdPlanoPrev     := '';
  sFlgInterno      := '';
  sIdSitPart       := '';
  sIdSitFunc       := '';
  sIdSitPlanoPrev  := '';
  sIdPessjurCedido := '';
  sInscricaoData   := '';

  sSql :=
  ' SELECT EL.IDPESSJUR, EL.IDPESSOA , NVL(PP.IDPLANOPREV,0) IDPLANOPREV , '+
         ' SIT.FLGINTERNO, SIT.DESCRICAO ,  PP.INSCRICAODATA, '+
         ' SIT.IDSITPART , EL.IDSITFUNC, PP.IDSITPLANOPREV, EL.IDPESSJURCEDIDO, '+
         ' F.IDPESSOA IDFUNCIONARIO, F.DATADESLIGAMENTO, SIT.FLGINTERNO '+
  ' FROM PARTPREVPLAN PP, ELEGPATRO EL, SITPART SIT, FUNCIONARIO F  '+
  ' WHERE EL.IDPESSJUR = EL.IDPESSJUR  '+
  ' AND EL.MATRICULA LIKE  '''+sMat+'%'' '+
  ' AND EL.IDPESSOA = EL.IDPESSOA  '+
  ' AND PP.IDPESSJUR(+) = EL.IDPESSJUR '+
  ' AND PP.IDPESSOA(+) = EL.IDPESSOA   '+
  ' AND SIT.IDSITPART(+) = PP.IDSITPART '+
  ' AND F.IDPESSOA(+) = EL.IDPESSOA ';

  //Renato Visoni SOL 96039 / Kintana 415375  E  SOL 96325 / Kintana 417110 E SOL 96527 / Kintana 418285
  if trim(LRegEmpregado.CD_TIP_ASSOC_PPREV) <> '' then begin
    if (strToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) = 7) or (strToInt(LRegEmpregado.CD_TIP_ASSOC_PPREV) = 8) then begin
      sSql := sSql + 'AND PP.INSCRICAODATA <' + QuotedStr(LRegEmpregado.DT_ASSOC_PPREV);
      sSql := sSql + 'AND PP.FLGDESATIVADO = 0';
    end;
  end;
  //Fim Renato Visoni SOL 96039 / Kintana 415375   E  SOL 96325 / Kintana 417110 E SOL 96527 / Kintana 418285
  sSql := sSql + ' ORDER BY PP.INSCRICAODATA DESC  ';

  sqlParam.sql.text   := sSql;
  cdsBuscaPessoa.data := sqlParam.data;

  if cdsBuscaPessoa.isempty then
  begin
    result    := true;
    exit;
  end;

  sIdPessoa  := cdsBuscaPessoa.fieldbyname('idpessoa').AsString;
  sIdPessjur := cdsBuscaPessoa.fieldbyname('idpessjur').AsString;

  if trim(cdsBuscaPessoa.fieldbyname('idplanoprev').AsString) = '0' then
  begin
    result := true;
    exit;
  end;

  sIdPlanoPrev     := cdsBuscaPessoa.fieldbyname('idplanoprev').AsString;
  sIdSitPart       := trim(cdsBuscaPessoa.fieldbyname('idsitpart').AsString);
  sIdSitFunc       := trim(cdsBuscaPessoa.fieldbyname('idsitfunc').AsString);
  sIdSitPlanoPrev  := trim(cdsBuscaPessoa.fieldbyname('idsitplanoprev').AsString);
  sFlgInterno      := trim(cdsBuscaPessoa.fieldbyname('flginterno').AsString);
  sInscricaoData   := trim(cdsBuscaPessoa.fieldbyname('inscricaodata').AsString); 
  sIdPessjurCedido := cdsBuscaPessoa.fieldbyname('IDPESSJURCEDIDO').AsString;

  if ( (chkAssistidos.Checked) and
       (cdsBuscaPessoa.fieldbyname('FLGINTERNO').AsString = 'AS') ) or
     ( (chkCancelados.Checked) and
       (cdsBuscaPessoa.fieldbyname('FLGINTERNO').AsString = 'CA') ) or
     ( (chkMantidos.Checked)   and
       (cdsBuscaPessoa.fieldbyname('FLGINTERNO').AsString = 'MA') ) or
     ( (chkAtivos.Checked)     and
       (cdsBuscaPessoa.fieldbyname('FLGINTERNO').AsString = 'AT') ) then
  begin
    memResult.Lines.Add('   Matrícula: '+sMat+' - ( '+cdsBuscaPessoa.fieldbyname('descricao').AsString+' )');
    exit;
  end;

  if (trim(cdsBuscaPessoa.fieldbyname('IDFUNCIONARIO').AsString) <> '') and
     (trim(cdsBuscaPessoa.fieldbyname('DATADESLIGAMENTO').AsString) = '') then
  begin
    memResult.Lines.Add('   Matrícula: '+sMat+' - Funcionário Funcef.');
    exit;
  end;

  sqlParam.sql.text :=
    'SELECT COUNT(*) AS CONT, IDPESSOA, IDTITULAR, FONTEPAGADORA '+
    'FROM BENEFBFCIARIO '+
    'WHERE IDPESSJUR = '+sIdPessjur+' '+
    'AND IDTITULAR = '+sIdPessoa+' '+
    'GROUP BY IDPESSOA, IDTITULAR, FONTEPAGADORA';
  cdsBuscaPessoa.data := sqlParam.data;

  // 0 - NÃO TEM BENEFÍCIO
  // 1 - PESSOA TEM BENEFÍCIO FUNCEF
  // 2 - PESSOA TEM APENAS BENEFÍCIO INSS
  if cdsBuscaPessoa.isempty then
    pbRetorno := 0
  else
  begin
    bTemINSS   := false;
    bTemFund   := false;
    bTemPensao := false;

    while not cdsBuscaPessoa.eof do
    begin
      If cdsBuscaPessoa.fieldbyname('CONT').asinteger > 0 Then
      begin
        bTemINSS   := bTemINSS   or (cdsBuscaPessoa.FieldByName('FONTEPAGADORA').AsInteger = 2);
        bTemFund   := bTemFund   or (cdsBuscaPessoa.FieldByName('FONTEPAGADORA').AsInteger = 1);
        bTemPensao := bTemPensao or (cdsBuscaPessoa.FieldByName('IDTITULAR').AsInteger <>
                                     cdsBuscaPessoa.FieldByName('IDPESSOA').AsInteger);
      end;
      cdsBuscaPessoa.next;
    end;

    if (chkAssistidos.Checked) then
    begin
      if bTemPensao then
        memResult.Lines.Add('   Matrícula: '+sMat+' - Titular de dependentes assistidos.')
      else
      begin
        if bTemFUND then
          memResult.Lines.Add('   Matrícula: '+sMat+' - Titular aposentado na FUNCEF.')
        else
          memResult.Lines.Add('   Matrícula: '+sMat+' - Titular apenas com benefício do INSS.');
      end;
    end;

    if bTemFund then
      pbRetorno := 1
    else
    begin
      if bTemINSS then
        pbRetorno := 2
      else
        pbRetorno := 0;
    end;
    exit;
  end;

  result := true;
end;

function TfrmSeparadorArqFuncef.TrataData(var sEntrada : String) : String;
begin


   if sEntrada = '01.01.0001' then
   begin
      sEntrada := '          ';
      result := sEntrada;
      exit;
   end;

   while pos('.',sEntrada) > 0 do
   begin
      sEntrada[pos('.',sEntrada)] := '/';
   end;
   result := sEntrada;
end;

function TfrmSeparadorArqFuncef.TrataNumero(var sEntrada : String; nDec : Integer) : String;
begin

   try
      if  StrToFloat(sEntrada) <= 0
      then
      begin
         Result := '0';
         exit;
      end;

   except
      result := '0';
      exit;
   end;

   Result := copy(sEntrada,1,length(sEntrada) - nDec) + '.' + copy(sEntrada,nDec + 1,4);

end;



procedure TfrmSeparadorArqFuncef.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if savedlg.Execute
  then memResult.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmSeparadorArqFuncef.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  memresult.Print('Demonstrativo');
end;

procedure TfrmSeparadorArqFuncef.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edarqmat.Text := odTxt.FileName;
  edarqmat.Hint := edarqmat.Text;
  if (edarqmat.Font.Size * length(edarqmat.text)) > edarqmat.Width then
     edarqmat.ShowHint := true
  else
  edarqmat.ShowHint := false;
end;





function TfrmSeparadorArqFuncef.LogToFile(const sLog     : String;
                                          const sArq     : String;
                                                sPasta   : String;
                                          const bHora    : Boolean = True;
                                          const bNovoArq : Boolean = False
                                         ): Boolean;
var
   mem      : TMemoryStatus;
   Arquivo  : TextFile;
   sArquivo : String;
   sLinha   : String;
begin
   // ----------------------------------------------------------------------------------------------

   if sArq = '' then
   begin
      Result := True;
      Exit;
   end;

   // ----------------------------------------------------------------------------------------------

   sPasta   := sPasta + '\';
   sArquivo := sPasta + sArq;

   // ----------------------------------------------------------------------------------------------

   try
      {$I-}

      // The $I switch directive enables or disables the automatic code generation that checks the
      // result of a call to an I/O procedure. I/O procedures are described in the Object Pascal
      // Language Guide. If an I/O procedure returns a nonzero I/O result when this switch is on,
      // an EInOutError exception is raised (or the program is terminated if exception handling is
      // not enabled). When this switch is off, you must check for I/O errors by calling IOResult.

      CriaDiretorio(sPasta);
      AssignFile(Arquivo, sArquivo);

      if FileExists(sArquivo) and not(bNovoArq) then
      begin
         Append(Arquivo);
      end
      else
      begin
         ReWrite(Arquivo);
      end;

      // -------------------------------------------------------------------------------------------

      sLinha := '';
      if bHora then sLinha := FormatDateTime('hh:nn:ss', Now) + ' - ';
      sLinha := sLinha + sLog;

      Writeln(Arquivo, sLinha);

      // -------------------------------------------------------------------------------------------

      CloseFile(Arquivo);

      Result := True;

      {$I+}
      Application.ProcessMessages;

   except
      Result := False;
   end;
end;


function TfrmSeparadorArqFuncef.CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sAux + sOriginal), (length((sAux + sOriginal)) - (iLimiteTamanho - 1)), iLimiteTamanho);
end;



function TfrmSeparadorArqFuncef.CompletaFim(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sOriginal + sAux), 1, iLimiteTamanho);
end;

procedure TfrmSeparadorArqFuncef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CMValidaDoc.Free;

  inherited;

end;



end.