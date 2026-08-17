
// *************************************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ********************************************
// *************************************************************************************************
{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  27/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
// Autor(a)    : Claudio Faria
// Data        : 18/01/2008
// Pendencia   : 27251
// Rotina      : bbtnCalculaClick
// Alteração   : Durante a importação pegar o Mês Referencia correto quando for abono.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 10/09/2007
// Pendencia   : 26316
// Rotina      : bbtnCalculaClick
// Alteração   : Correção na consideração da formatação da variavel MES apenas como 'MM'.
//----------------------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 21/08/2007
// Pendência   : 22108
// Alteração   : Troca do DateToStr para FormatDateTime.
// ---------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 09/08/2007
// Pendencia   : 25253
// Rotina      : bbtnCalculaClick
// Alteração   : Alteração na consulta que busca o participante a ser importando retirando a
//               crítica que proibia de importar participantes demitidos.
//----------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 02/03/2007
// Pendencia   : 24421
// Rotina      : bbtnCalculaClick
// Alteração   : Alteração na gravação da tabela da CLASSERUBRICAS buscando primeiro o registro
//               existente na TMPDESC.
//----------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 14/12/2006
// Pendencia   : 24503
// Rotina      : bbtnCalculaClick
// Alteração   : Correção na qryMesCob13 para não fazer referência ao campo MESREFERENCIA.
//----------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 14/12/2006
// Pendencia   : 23996
// Rotina      : bbtnCalculaClick
// Alteração   : Correção na rotina de cálculo de salário de participação de 13º.
//----------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 26/06/2006
// Pendencia   : 22064
// Rotina      : SpeedButton1Click e odTxtCanClose
// Alteração   : Criação de rotina para aceitar apenas a pasta parametrizada nos parametros do sistema.
//----------------------------------------------------------------------------------------------------
// Rotina      : GeraArquivoSchema
// Autor(a)    : Leo
// Pendência   : 18983
// Data        : 21/03/2006
// Alteração   : ordenação dos campos na montagem do schema
//------------------------------------------------------------------------------
// Rotina      : BitBtn2Click , bbtnCalculaClick
// Autor(a)    : Leo
// Pendência   : 20785
// Data        : 22/11/2005
// Alteração   : gravação do logtotalprev
//------------------------------------------------------------------------------
// Rotina      : bbtnRelClick
// Autor(a)    : Gleyber
// Pendência   : 19396
// Data        : 09/11/2005
// Alteração   : Correção de erro na hora da segunda chamada do relatório.
//------------------------------------------------------------------------------
// Rotina      : bbtnCalculaClick
// Autor(a)    : Leo
// Pendência   : 18982
// Data        : 18/08/2005
// Alteração   : modificação para recomeçar a importação da rubrica em que parou
//------------------------------------------------------------------------------
// Rotina      : VerificaImportAnterior
// Autor(a)    : Leo
// Pendência   : 18982
// Data        : 18/08/2005
// Alteração   : crtiação da função VerificaImportAnterior para buscar última rubrica
//               importada em um mês
//------------------------------------------------------------------------------
// Rotina      : BitBtn2Click
// Autor(a)    : Leo
// Pendência   : 19931
// Data        : 16/08/2005
// Alteração   : criticar o recebimento de descontos por módulos de origem antes de desfazer
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 08/06/2005
// Pendencia   : 19375
// Rotina      : bbtnCalculaClick
// Alteração   : Abrindo a qryLoop para o caso de encontrar apenas uma rubrica de empréstimo.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 02/06/2005
// Pendencia   : 18419              
// Rotina      : bbtnCalculaClick
// Alteração   : Melhorada a crítica para ao invés de aparecer a mensagem "Contribuição não lida.
//               Possível duplicação.", para "Rubrica não associada". 
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 04/03/2005
// Pendencia   : 17506 (Reaberta)
// Rotina      : bbtnCalculaClick
// Alteração   : Receber contribuicao de demitidos até o mes anterior ao que está sendo processado
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 10/02/2005
// Pendencia   : 18642
// Rotina      : qryMotivo
// Alteração   : Inclusão do campo IDMOTIVOCONTRIBA na query
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 01.10.2004
// Pendencia   : 17818
// Rotina      : ----
// Alteração   : A rubrica externa 526, que tem varias rubricas internas associadas
//               nao estava sendo atualizada na tmpdesc pelo desmembramento 
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/08/2004
// Pendencia   : 17442
// Rotina      : bbtnCalculaClick
// Alteração   : Alteração na query que busca a pessoa para diferenciar dois inscrições.
//               Inserida uma rotina de gravação na tmpdesc para o Assistencial.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 02/03/2004
// Pendencia   : 16159
// Rotina      : bbtnCalculaClick
// Alteração   : Incluido rotina para criticar o sLinha caso retorne da função MontaLinhaArqBad
//               retorne nulo.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 29/01/2004
// Pendencia   : 16016
// Rotina      : bbtnCalculaClick
// Alteração   : Alteração na query qrybuscapessoa para evitar que busque o mesmo participante em
//               duas patrocinadoras - evento de transferência de patro mantendo a mesma matrícula.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 16/12/2003
// Pendencia   : 15814
// Rotina      : bbtnCalculaClick
// Alteração   : Acrescentado o IDCAMPO 40 (campo em branco) na query de criação do arquivo externo
//               tmptxt.DBF
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 27/11/2003
// Pendencia   : 15157
// Rotina      : GravaErrosCCP
// Alteração   : Acerto para passar apenas 30 caracteres no nome da patrocinadora na gravação
//               da tabela TABERROSCCP
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 19.11.2003
// Pendencia   : 15655
// Alteração   : Chamada da rotina LimpaVariaveis para não deixar lixo nas variaveis de uma pessoa
//               para outra
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 13.11.2003
// Pendencia   : ?????
// Alteração   : Acerto na leitura do lay-out novo (para mais de um tipo de lay-out)
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 08.10.2003
// Pendencia   : 14952
// Alteração   : Permitir apenas exibição/inserção de lay-out do tipo RECEBIMENTO
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 07.10.2003
// Pendencia   :
// Rotina      : bbtnCalculaClick
// Alteração   : Estava inserindo salário errado para quem tem salario em coluna
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 09/09/2003
// Pendencia   : 14997
// Rotina      : bbtnCalculaClick
// Alteração   : Alteração na insercao na CLASSERUBRICAS para tratar o flgatrasodevol
//               caso tenha mais de uma rubrica com o mesmo codprovdesc
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 05.08.2003
// Pendencia   : 11707
// Alteração   : A soma das rubricas de salario de participacao não coincide com o
//               valor inserido na hstrubricaxpess
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 22.07.2003
// Pendencia   : 14612
// Alteração   : Alteração na insercao na CLASSERUBRICAS para tratar o flgatrasodevol
//               caso tenha mais de uma rubrica com o mesmo codprovdesc
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 18.07.2003
// Pendencia   : 14612
// Alteração   : Alteração da atualização na TMPDESC para o caso do tipo de envio
//               ser "Não Envia". Quando for este tipo de envio, se for atraso/devolucao
//               o sistema deve tentar atualizar o recebido. Se não conseguir, inserir
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 09.07.2003
// Alteração   : Alteração da atualização na TMPDESC para o caso do tipo de envio
//               ser "Envia Valor". Quando for este tipo de envio o sistema
//               não deve atualizar o esperado com o valor que foi recebido pois
//               se fizer assim, nunca ocorrerá divergência.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 02.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnCalculaClick
// Autor(a)    : Gleyber
// Data        : 23/06/2003
// Alteração   : Tratamento para baixar registros do assistencial.
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnCalculaClick
// Autor(a)    : Gleyber
// Data        : 18/06/2003
// Alteração   : Mudanças para tratar mês de referencia anterior.
//--------------------------------------------------------------------------------------------------
// Rotina      : ---
// Autor(a)    : Camille
// Data        : 19.05.2003
// Alteração   : Tratamento no recebimento de rubricas de férias
//--------------------------------------------------------------------------------------------------
// Rotina      : ExisteSalPart
// Autor(a)    : Augusto
// Data        : 08/05/2003
// Alteração   : Acerto no uso das variaveis de mes inclusão de Plics
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnCalculaClick
// Autor(a)    : Augusto
// Data        : 07/05/2003
// Alteração   : Recebimento das rubricas Assistenciais (igual ao Emprestimo)
//--------------------------------------------------------------------------------------------------
// Rotina      : ExisteSalPart
// Autor(a)    : Gleyber
// Data        : 17/04/2003
// Alteração   : Criação da função para verificar existência de salario de participação
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnCalculaClick
// Autor(a)    : Gleyber
// Data        : 13/03/2003
// Alteração   : Gravação das rubricas de Empréstimo na HistRubSal;
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnCalculaClick
// Autor(a)    : Gleyber
// Data        : 13/03/2003
// Alteração   : Alteração para verificar se existe o registro de salário de
//               participação na histrubsal. Existindo dá um Update senão Insert
//--------------------------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Gleyber
// Data        : 02/10/2002
// Alteração   : Alteração para gravar histórico caso o tipo da rubrica seja Geral
//--------------------------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 19/09/2002
// Alteração   : inclusão do FLGSRB em todos Inserts na HISTRUBSAL
//--------------------------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 04/07/2002
// Alteração   : inclusão do IDPATRO nos inserts na HISTRUBSAL
//--------------------------------------------------------------------------------------------------
// Rotina      : importação, segunda fase
// Autor(a)    : Leo
// Data        : 05/06/2002
// Alteração   : mudanças drásticas na inserção/atualização das contribuições
//               que são enviadas com valor ou não enviadas (FLGTPVLR)
//--------------------------------------------------------------------------------------------------
// Rotina      : importação, primeira fase
// Autor(a)    : Leo
// Data        : 05/06/2002
// Alteração   : acrescentei  OR (qryaux.fieldbyname('CONT').AsInteger <= 0 ) na
//               condição para inserir registro de empréstimo na TMPDESC
//--------------------------------------------------------------------------------------------------
// Rotina      : DESFAZER
// Autor(a)    : Leo
// Data        : 05/06/2002
// Alteração   : alteri o update da tmpdesc dos registros não gerados
//               pelo interface acrescentando IDMODULO  IN (16,452,454,456,487)
//--------------------------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 05/06/2002
// Alteração   : alterei todos os updates na tmpdesc, atualizanbdo a
//               datarecebimento = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY'')
//--------------------------------------------------------------------------------------------------
// Rotina      : BOTÃO TEMPORÁRIO
// Autor(a)    : Leo
// Data        : 05/06/2002
// Alteração   : tratamento para buscar diferenças entre o arquivo e a tmpdesc
//               este processo será modificado e incluído em utilitários
//--------------------------------------------------------------------------------------------------


unit FGravaTxt;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwtable, Wwquery,
  wwdblook,  URegra, wwriched, Grids, Wwdbigrd, Wwdbgrid,
  TB97Tlwn, DBGrids, checklst, wwdbdatetimepicker, CMDateTimePicker,
  ComCtrls, TreeWzd;

type
  TfrmGravaTxt = class(TfrmSairAjuda)
    bbtnCalcula: TBitBtn;
    sbTxt: TSpeedButton;
    odTxt: TOpenDialog;
    tblTxt: TwwTable;
    bmPatro: TBatchMove;
    qryTxt: TwwQuery;
    tblDbf: TwwTable;

    qryBuscaIdpessoa: TwwQuery;
      qryBuscaIdpessoaIDPESSOA: TFloatField;
      qryBuscaIdpessoaIDPESSJUR: TFloatField;
      qryBuscaIdpessoaMATRICULA: TStringField;
      qryBuscaIdpessoaIDPLANOPREV: TFloatField;

    qryRubricasPatro: TwwQuery;
      qryRubricasPatroIDRUBSALBENEFICIO: TFloatField;
      qryRubricasPatroIDREGRASALBENEFI: TFloatField;
      qryRubricasPatroIDRUBREMTOTAL: TFloatField;
      qryRubricasPatroIDREGRAREMTOTAL: TFloatField;
      qryRubricasPatroIDREGRACALCSALPA: TFloatField;
      qryRubricasPatroIDRUBSALPARTICIP: TFloatField;
      qryRubricasPatroIDRUBSALMANUT: TFloatField;
      qryRubricasPatroIDRUBSALMANUTPARC: TFloatField;
      qryRubricasPatroIDRUBSALAUXDOENCA: TFloatField;

    qryPlanPatro: TwwQuery;
      qryPlanPatroIDPESSJUR: TFloatField;
      qryPlanPatroIDPLANOPREV: TFloatField;
      qryPlanPatroFLGTPVLR: TStringField;

    qryMaxOrdem: TwwQuery;
      qryMaxOrdemMAXORDEMCALCULO: TFloatField;

    qryCodProvDesc: TwwQuery;

    qryPlano: TwwQuery;
      qryPlanoCOTVALOR: TFloatField;

    qryMotivo: TwwQuery;
      qryMotivoIDMOTIVOCONTRIBP: TFloatField;

    qryPatro: TwwQuery;
    qryAux: TwwQuery;
    qrySalPart: TwwQuery;
    qryPatroCombo: TwwQuery;
    qryDadosArquivo: TwwQuery;
    qryBuscaPlanoPess: TwwQuery;
    qryContribNaoRecebidas: TwwQuery;
    qryPlanPrev: TwwQuery;
    qryDesmembraRubrica: TwwQuery;
    qryUpdOp1: TwwQuery;
    qryUpdOp2: TwwQuery;
    qryCalcContrib: TwwQuery;
    qryUpdOp3: TwwQuery;
    qryAtualizaPartPrevPlan: TwwQuery;
    qryCalcContribPatrocinadora: TwwQuery;
    qryPlanoXMoeda: TwwQuery;
    qryCodProvDescExistentes: TwwQuery;
    qryCodprovDescNaoExistentes: TwwQuery;
    qrydesfazHistrubSal: TwwQuery;
    qrydesfazTmpDesc: TwwQuery;
    qryDesfazClasseRubricas: TwwQuery;
    qryAtualizaPartPrevPlan2: TwwQuery;
    qryAtualizaPartPrevPlan3: TwwQuery;
    qryCompoeSalarios: TwwQuery;
    qryContribuicoesRecebidasNaoEsperadas: TwwQuery;
    qryAtualizaPartPrevPlan4: TwwQuery;
    qryContribRecebidaORIGINAL: TwwQuery;
    Regra: TRegra;
    Panel1: TPanel;
    Splitter2: TSplitter;
    Panel2: TPanel;
    edTxt: TEdit;
    lblArquivoPatro: TLabel;
    deDataRef: TCMDateTimePicker;
    deDataCob: TCMDateTimePicker;
    lblDataCobranca: TLabel;
    lblDataRef: TLabel;
    dblkPatrocinadora: TwwDBLookupCombo;
    lblPatrocinadora: TLabel;
    SpeedButton1: TSpeedButton;
    bmoveCodProvDesc: TBatchMove;
    tblCodProvDescExistentes: TTable;
    dsCodProvDescNaoExistentes: TwwDataSource;
    SaveDialog1: TSaveDialog;
    dsBuscaRubrica: TwwDataSource;
    GroupBox1: TGroupBox;
    lblHoraIni: TLabel;
    ToolWindow971: TToolWindow97;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    dblkPlanoPrev: TwwDBLookupCombo;
    qryDbf: TwwQuery;
    qryErrosCCP: TwwQuery;
    qryPlanoMatr: TwwQuery;
    qryCriteriosContrib: TwwQuery;
    Panel3: TPanel;
    PageControl1: TPageControl;
    tbDescricao: TTabSheet;
    tbErros: TTabSheet;
    Memo1: TwwDBRichEdit;
    tbDiverg: TTabSheet;
    mmDivergencias: TMemo;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    clbEtapas: TCheckListBox;
    qryDesfazTmpDesc2: TwwQuery;
    qrydesfazHRubxPess: TwwQuery;
    qryBuscaSalPart: TwwQuery;
    qrySalRef: TwwQuery;
    qryAtualizaElegpatro: TwwQuery;
    qryProcuraClasseRubricas: TwwQuery;
    qryProcExisteClasseRubricas: TwwQuery;
    qryMesCob13: TwwQuery;
    qryPlanPatroIDCONTRIBUICAO: TFloatField;
    qryPlanPatroORDEMCALCULO: TFloatField;
    qryBuscaRubrica: TwwQuery;
    lbMensagens: TMemo;
    memBuscaRubricas: TMemo;
    memBuscaRubricasDuplo: TMemo;
    ToolbarSep972: TToolbarSep97;
    qryPlanPatroNOME: TStringField;
    qrybuscapessoa: TwwQuery;
    qryLoop: TwwQuery;
    TwCons: TTreeWzd;
    bbtnRel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    bbtnBaca: TBitBtn;
    chkbad: TCheckBox;
    qryConfCont: TwwQuery;
    qryLayOut: TwwQuery;
    lblLayOut: TLabel;
    dblkpcmbLayOut: TwwDBLookupCombo;
    Label3: TLabel;
    qryMotivoIDMOTIVOCONTRIBA: TFloatField;
    qryAux1: TwwQuery;

    procedure sbTxtClick(Sender: TObject);
    procedure bbtnCalculaClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  RetornaCodProvDesc(piIdPessJur,piIdRubrica : Integer) : string;
    procedure FormActivate(Sender: TObject);
    function  ConvMes(sMes,sFormato,sIniAno:String):String;
    procedure ImportaRubricas;
    procedure GravaTmpDescContribuicoesNaoRecebidas(pMesCob : String; pIdMotivo, pIdPessjur : Integer);
    procedure GravaTmpDescContribuicoesNaoEsperadas;
    procedure RegraGetResult(sender: TObject);
    function  ConvValor(sValor:String):String;
    procedure SpeedButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edTxtChange(Sender: TObject);
    function  MontaQueryBuscaIdPessoa: Boolean;
    function  BuscaIdPessoa(const sValorChave: string; const lIdPessoa: LongInt): Boolean;
    procedure GravaErrosCCP(iIdControle, iIdPessjur: integer;
                            sMsgExplicativa, sMatricula, sCodProvento, sDataRef: string;
                            fValor: Real ; sIdContribuicao, sMesCobranca, sLinhaCrit :String);
    procedure deDataRefChange(Sender: TObject);
    procedure bbtnRelClick(Sender: TObject);
    procedure bbtnBacaClick(Sender: TObject);
    procedure deDataRefExit(Sender: TObject);
    procedure deDataCobExit(Sender: TObject);
    procedure odTxtCanClose(Sender: TObject; var CanClose: Boolean);
    procedure od(Sender: TObject);
  private
    { Private declarations }
    liIdLote : Longint;
    iTstRubrica : Integer; 

    function TiraZerosEsquerda(stexto : string) : string;
    function CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
    function MontaLinhaArqBad(qryTxt : TwwQuery) : String;
    function ExisteSalPart(iRubrica: Integer; sMes, sMesCobranca, sIdPessjur, sIdRubrica, sIdMotivo, sReferencia,
                       sIdPessoa, sSeqRubrica, sValor, sSql : String) : String;
    function DecMesReferencia(sMesReferencia : String) : String; 


    function VerificaImportAnterior(sIdPessjur,sMesCob : String ; var sUltRubrica : String) : Boolean;
  public
    { Public declarations }
  end;


var
  frmGravaTxt: TfrmGravaTxt;
  sMesRef,sMesCob,sMesCobGr, sCamposDBF, sMesRefAux : string ;
  F , bad: TextFile ;
  bCobra13, bAtualizaContribpai, bAtualizaContribPai2,  bAtualizaContribpai3 : Boolean;
  iContadorCommit : Integer;

const
  NumMaxRegSemCommit = 300;

implementation

uses UMensErro, UAdmPrev,UDataBase, USistema, UAutorizacao,
     ULancContab, DBaseDados, UModulo, fAguarde, UFuncoesUteis, UCCP,Uinterface,
     UContribInterf, DContribInterf,
     FCadInterfacePatro, FImportaDadosCadastrais, dRelatorios;

{$R *.DFM}

procedure TfrmGravaTxt.sbTxtClick(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edTxt.Text:=odTxt.FileName;
end;


procedure TfrmGravaTxt.bbtnCalculaClick(Sender: TObject);
   function GeraArquivoSchema(sArquivo: string): Boolean;
   var i, iInicio, x, j : integer; lista, listaFim :TStringList;
   begin
     Result := True;
     i := 1;
     try
      lista := TStringList.Create;
      listaFim := TStringList.Create;

      with lista do
      begin
        Add('[' + Copy(ExtractFileName(Trim(sArquivo)), 1, Length(ExtractFileName(Trim(sArquivo))) - 4) + ']');

        Add('Filetype=Fixed');
        Add('CharSet=ascii');

        ///
        /// Gerar Schema de acesso ao arquivo
        /// Só insiro o registro no schema se o mesmo não possuir inicio = 1000
        ///

        //Campo especial para especificar qual o Tipo de Lançamento que está vindo no Txt;
        if qryDadosArquivo.FieldByName('FLGLANCAMENTO').AsString = 'S' then begin
           if Trim(qryDadosArquivo.FieldByName('POSLANCAMENTO').AsString) <> '1000' then begin
              Add('Field'+inttostr(i)+'=LANCAMENTO,Char, 1, 00, ' + Trim(qryDadosArquivo.FieldByName('POSLANCAMENTO').AsString));
              sCamposDBF := sCamposDBF + 'DBF.LANCAMENTO, ';
              inc(i);
           end;
        end;



        if Trim(qryDadosArquivo.FieldByName('INICIOSEQINTERFA').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=SEQINTERFA,Char,' + Trim(qryDadosArquivo.FieldByName('SEQINTERFA').AsString) + ',00,' +
                                           Trim(qryDadosArquivo.FieldByName('INICIOSEQINTERFA').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.SEQINTERFA, ';
           inc(i);
        end;

        if Trim(qryDadosArquivo.FieldByName('INIPATRO').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=PATRO,Char,' + Trim(qryDadosArquivo.FieldByName('PATRO').AsString) + ',00,' +
                                      Trim(qryDadosArquivo.FieldByName('INIPATRO').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.PATRO, ';
           inc(i);
        end;

        if Trim(qryDadosArquivo.FieldByName('INIPLANO').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=PLANO,Char,' + Trim(qryDadosArquivo.FieldByName('PLANO').AsString) + ',00,' +
                                      Trim(qryDadosArquivo.FieldByName('INIPLANO').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.PLANO, ';
           inc(i);
        end;

        if Trim(qryDadosArquivo.FieldByName('INIMESREF').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=MESREF,Char,' + Trim(qryDadosArquivo.FieldByName('MESREF').AsString) + ',00,' +
                                       Trim(qryDadosArquivo.FieldByName('INIMESREF').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.MESREF, ';
           inc(i);
        end;

        if Trim(qryDadosArquivo.FieldByName('INIDATAREF').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=DATAREF,Char,' + Trim(qryDadosArquivo.FieldByName('DATAREF').AsString) + ',00,' +
                                        Trim(qryDadosArquivo.FieldByName('INIDATAREF').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.DATAREF, ';
           inc(i);
        end;

        if Trim(qryDadosArquivo.FieldByName('INIPROVENTO').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=PROVENTO,Char,' + Trim(qryDadosArquivo.FieldByName('PROVENTO').AsString) + ',00,' +
                                         Trim(qryDadosArquivo.FieldByName('INIPROVENTO').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.PROVENTO, ';
           inc(i);
        end;

        if  Trim(qryDadosArquivo.FieldByName('INITIPOCHAVE').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=TIPOCHAVE,Char,' + Trim(qryDadosArquivo.FieldByName('TIPOCHAVE').AsString) + ',00,' +
                                          Trim(qryDadosArquivo.FieldByName('INITIPOCHAVE').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.TIPOCHAVE, ';
           inc(i);
        end;

        if  Trim(qryDadosArquivo.FieldByName('INIVALORCHAVE').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=VALORCHAVE,Char,' + Trim(qryDadosArquivo.FieldByName('VALORCHAVE').AsString) + ',00,' +
                                            Trim(qryDadosArquivo.FieldByName('INIVALORCHAVE').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.VALORCHAVE, ';
           inc(i);
        end;


        if Trim(qryDadosArquivo.FieldByName('INIVALORPROVE').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=VALORPROVE,Char,' + Trim(qryDadosArquivo.FieldByName('VALORPROVE').AsString) + ',00,' +
                                           Trim(qryDadosArquivo.FieldByName('INIVALORPROVE').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.VALORPROVE, ';
           inc(i);
        end;

        if  Trim(qryDadosArquivo.FieldByName('INIVALORPART').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=VALORPART,Char,'+ Trim(qryDadosArquivo.FieldByName('VALORPART').AsString) + ',00,' +
                                          Trim(qryDadosArquivo.FieldByName('INIVALORPART').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.VALORPART, ';
        end;


        //Salvando o arquivo de Schema(*.sch);
        //caso o usuário cadastre os campos(inicio, tamanho) diferente da ordem acima, o arquivo de esquema vai
        //ficar errado pois terá "fields" posteriores com inicio anterior.
        listafim.add(lista[0]); //cabeçalho 1, igual
        listafim.add(lista[1]); //cabeçalho 2, igual
        listafim.add(lista[2]); //cabeçalho 3, igual
        x := 1;

        for j := 0 to 999 do
        begin
           for i := 3 to lista.Count - 1 do //começo das linhas de campos
           begin
              if j = strtoint(copy(lista[i],pos('00,',lista[i])+3,5)) then
              begin
                 listafim.add('Field'+inttostr(x)+copy(lista[i],pos('=',lista[i]),length(lista[i])));
                 inc(x);
              end;
           end;
        end;

        //Salvando o arquivo de Schema(*.sch);
        listafim.SaveToFile(Copy(edTxt.Text, 1, Length(edTxt.Text) - 4) + '.sch');


        lista.Free;
        listafim.free;
      end;
      except
        Result := False;
     end;
   end;

var sTaxa,sIniAnoRef,sIniAnoCob,sFlgAtrasoDev,sFlgRemTotal,sErro,sChave,sSql,sProvento,sValorProve:String;
    kx,ky,kk,iPatro,iPlano,iRubrica,iContribuicao,x:LongInt;
    wNomeArq,sDataRef,sDataRefGr,sMesCot,sMesRefGr,sMesRef13,sCodRef,sCodRefC,sCodRefH,sFlgSalPart,sFlgSalBenef,sFlgIrrf:String;
    iIdRubSalBenef,iIdRubRemTotal,iIdRubSalPart, iIdRubSal13 ,iSeqTabela:LongInt;
    sOrdemCalculo,sCodProvDescSalBenef,sCodProvDescRemTotal,
    sCodProvDescSalPart,sCodProvDescSal13 ,sUltProvento,sUltValorChave,sProventoTela,
    sValorChave, sDigitoVer,sDigitoVerificador, sCodRubSalRef, sMatriculaAtual,
    sUltIdpessoa, sProxProvento,  sMatriculaAux, sValorAtu, sCodRub, sDigito, sSeqRubrica: String;
    bTracoMatricula : Boolean;
    AuxDec:Char;
    rPerc,rTaxa, dValorSobra, dTotalRub  :Double;
    rValor : Real;
    vetFields : array [0..20] of TField;
    I, iIniDigito, iCont:Integer;
    bAbreBuscaRubrica  : Boolean;

    slinha, sUltRubrica : String;

begin
  inherited;

  // adicionando log padrãop
  Modulo.GravaLogTOTALPREV (copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2)+' - v. '+Sistema.Versao+' - Import. Financeira - arq. '+edTxt.Text);

  TwCons.Etapa.Pos       := -1;
  liIdLote               := -1;

  try
     CloseFile(F);
     CloseFile(bad);
  except
  end;

  lblHoraIni.Caption:=TimeToStr(Time);
  bbtnCalcula.Enabled := false;
  lbMensagens.Lines.Clear;
  lbMensagens.Lines.Add(TimeToStr(Time)+' - Iniciando o processo');
  Application.ProcessMessages;
  //
  if trim(edTxt.Text) = '' then begin
     MsgDlg('Obrigatório preencher o Arquivo da Patrocinadora','Aviso',mtWarning,[mbOk],0);
     bbtnCalcula.Enabled := true;

     exit;
  end;
  //
  if trim(dblkPatrocinadora.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Patrocinadora','Aviso',mtWarning,[mbOk],0);
     dblkPatrocinadora.SetFocus;
     bbtnCalcula.Enabled := true;
     exit;
  end;
  //
  if trim(dblkPlanoPrev.Text) = '' then begin
     if MsgDlg('O plano não foi selecionado, deseja processar todos os planos ?', 'Confirmação', 
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     begin
        dblkPlanoPrev.SetFocus;
        bbtnCalcula.Enabled := true;
        exit;
     end;
  end;
  //
  if trim(deDataRef.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Data de Referencia','Aviso',mtWarning,[mbOk],0);
     deDataRef.SetFocus;
     bbtnCalcula.Enabled := true;
     exit;
  end;
  //
  if trim(deDataCob.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Data de Cobrança','Aviso',mtWarning,[mbOk],0);
     deDataCob.SetFocus;
     bbtnCalcula.Enabled := true;
     exit;
  end;



  if VerificaImportAnterior(qryPatroCombo.FieldByName('IdPessoa').AsString,
                            copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2),
                            sUltRubrica) then
    begin
     if MsgDlg('Já existem rubricas importadas neste mês. Deseja refazer a importação?','Confirmação',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     begin
        bbtnCalcula.Enabled := true;
        lbMensagens.Lines.Add(TimeToStr(Time)+' - Importação interrompida pelo usuário.');
        exit;
     end
     else
     begin
        if MsgDlg('A última rubrica importada foi a '+sUltRubrica+'. Deseja recomeçar desta rubrica? (respondendo NÃO, a importação será refeita integralmente)','Confirmação',
           mtConfirmation, [mbYes, mbNo], 0) = mrNo
        then sUltRubrica := '';
     end;
  end;


  if liIdLote < 0
  then liIdLote := CriaLOTE(qryPatroCombo.FieldByName('IdPessoa').AsInteger,
                     sMesRef,
                     'P',
                     Copy('Contribuições descontadas em folha - '+qryPatroCombo.FieldByName('Nome').AsString,1,200),
                     'N', // insercoes serao apenas para Normais, pois A/D estarao sempre na TmpDesc
                     1, // flgPreparado
                     1, // flgIdaTmp
                     1, // flgVoltaTmp
                     1, // FlgIdaInterface
                     1, // FlgVoltaInterface
                     date,  // DataPreparo
                     date,  // DataIdaTmp
                     date,  // DataVoltaTmp
                     date,  // DataIdaInterface
                     date); // DATAVOLTAINTERFA



  //verifica tabela de críticas
  qryaux.close;
  qryaux.sql.text := ' SELECT 1 FROM TABERROSCCP '+
                     ' WHERE IDPESSJUR = '''+qrypatrocombo.fieldbyname('idpessoa').AsString+''' AND '+
                     ' MESCOBRANCA = '''+copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2)+''' ';
  qryaux.open;

  if not qryaux.isempty then
  begin
    if MsgDlg('Foi verificado a existência de uma importação para esta Patrocinadora/Mês. '+
              'Deseja que o LOG DE CRÍTICAS seja apagado?', 'Confirmação', 
              mtConfirmation, [mbYes, mbNo], 0) = mrYes     then
    begin
       qryaux.close;
       qryaux.sql.text := ' DELETE TABERROSCCP '+
                          ' WHERE IDPESSJUR = '''+qrypatrocombo.fieldbyname('idpessoa').AsString+''' AND '+
                          ' MESCOBRANCA = '''+copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2)+''' ';
       qryaux.ExecSql;
    end;

  end;

  AssignFile(F,'Log' + copy(FormatDateTime('dd/mm/yyyy', date),1,2) +
                       copy(FormatDateTime('dd/mm/yyyy', date),4,2) +
                       copy(FormatDateTime('dd/mm/yyyy', date),7,4)+'.err');

  Rewrite(F);

  WriteLn(F,'Log de Erros durante o processo iniciado em ' + FormatDateTime('dd/mm/yyyy', date) +
            ' as ' + timetostr(time) + '...');

  iPatro       :=StrToInt(qrypatrocombo.fieldbyname('idpessoa').AsString);

  if dblkPlanoPrev.text <> '' then
     iPlano       :=StrToInt(dblkPlanoPrev.LookupValue);

  sIniAnoCob   :=Copy(deDataCob.Text,7,2);
  sIniAnoRef   :=Copy(deDataRef.Text,7,2);

  if not prmLayOutMultiploRecebimento 
  then begin
     with qryDadosArquivo do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT FLGLANCAMENTO, POSLANCAMENTO, INICIOSEQINTERFA, SEQINTERFA,                   '+
                '        INIPATRO,      PATRO,         INIPLANO,         PLANO,                        '+
                '        INIMESREF,     MESREF,        INIMESCOB,        MESCOB,                       '+
                '        INIDATAREF,    DATAREF,       INIVALORPROVE,    VALORPROVE,                   '+
                '        INIPROVENTO,   PROVENTO,      INITIPOCHAVE,     TIPOCHAVE,                    '+
                '        INIVALORCHAVE, VALORCHAVE,    INIVALORPART,     VALORPART,                    '+
                '        FLGHEADER,     FLGFOOTER,     CODPROVDUPLO,     IDPARTRUBRICA,                '+
                '        FMTMESREF,     FLGCALCSALPART, FLGTIPOSEPARADEC, NUMCASASDEC, FLGGRAVAHIST,   '+
                '        FLGMATCOMPLETA                                                                '+
                ' FROM   PARAMINTERF                                                                   '+
                ' WHERE  IDPESSJUR = '+IntToStr(iPatro));
        Open;
     end;
  end
  else begin
     with qryDadosArquivo do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT ''N''   AS FLGLANCAMENTO,                                                     '+
                '        0    AS POSLANCAMENTO,                                                        '+
                '        1000 AS INICIOSEQINTERFA,                                                     '+
                '        1    AS SEQINTERFA,                                                           '+ 
                '        L.TIPO,                                                                       '+
                '        L.CODPROVDUPLO,                                                               '+
                '        L.FLGCALCSALPART,                                                             '+
                '	       L.FLGTIPOSEPARADEC,                                                           '+
                '	       L.NUMCASASDEC,                                                                '+
                '	       L.FLGGRAVAHIST,                                                               '+
                '	       L.FLGRUBATMANT,                                                               '+
                '  	    L.FLGHEADER,                                                                  '+
                '        L.FLGFOOTER,                                                                  '+
                '        L.FLGMATCOMPLETA,                                                             '+
                '	       L.IDPARTRUBRICA,                                                              '+
                '        MIN(DECODE(P.IDCAMPO, 29, P.INICIO, 1000))         AS INIPATRO,               '+ 
                '        MAX(DECODE(P.IDCAMPO, 29, P.TAMANHO, 0))           AS PATRO,                  '+ 
                '        MIN(DECODE(P.IDCAMPO, 30, P.INICIO, 1000))         AS INIPLANO,               '+ 
                '        MAX(DECODE(P.IDCAMPO, 30, P.TAMANHO, 0))           AS PLANO,                  '+ 
                '        MIN(DECODE(P.IDCAMPO, 34, P.INICIO, 1000))         AS INIMESREF,              '+ 
                '        MAX(DECODE(P.IDCAMPO, 34, P.TAMANHO, 0))           AS MESREF,                 '+ 
                '        MIN(DECODE(P.IDCAMPO, 38, P.INICIO, 1000))         AS INIMESCOB,              '+ 
                '        MAX(DECODE(P.IDCAMPO, 38, P.TAMANHO, 0))           AS MESCOB,                 '+ 
                '        MIN(DECODE(P.IDCAMPO, 33, P.INICIO, 1000))         AS INIDATAREF,             '+ 
                '        MAX(DECODE(P.IDCAMPO, 33, P.TAMANHO, 0))           AS DATAREF,                '+ 
                '        MIN(DECODE(P.IDCAMPO, 36, P.INICIO, 1000))         AS INIVALORPROVE,          '+ 
                '        MAX(DECODE(P.IDCAMPO, 36, P.TAMANHO, 0))           AS VALORPROVE,             '+ 
                '        MIN(DECODE(P.IDCAMPO, 35, P.INICIO, 1000))         AS INIPROVENTO,            '+ 
                '        MAX(DECODE(P.IDCAMPO, 35, P.TAMANHO, 0))           AS PROVENTO,               '+ 
                '        MIN(DECODE(P.IDCAMPO, 39, P.INICIO, 1000))         AS INITIPOCHAVE,           '+ 
                '        MAX(DECODE(P.IDCAMPO, 39, P.TAMANHO, 0))           AS TIPOCHAVE,              '+ 
                '        MIN(DECODE(P.IDCAMPO, 32, P.INICIO, 1000))         AS INIVALORCHAVE,          '+ 
                '        MAX(DECODE(P.IDCAMPO, 32, P.TAMANHO, 0))           AS VALORCHAVE,             '+ 
                '        MIN(DECODE(P.IDCAMPO, 37, P.INICIO, 1000))         AS INIVALORPART,           '+ 
                '        MAX(DECODE(P.IDCAMPO, 37, P.TAMANHO, 0))           AS VALORPART,              '+ 
                '        MAX(DECODE(P.IDCAMPO, 34, P.FORMATO, ''AAAA/AA'')) AS FMTMESREF               '+ 
                ' FROM   LAYOUTENVIO L,                                                                '+
                '        (SELECT P.IDLAYOUTENVIO, P.IDENTIFICADOR, P.ORDEM, P.TAMANHO, P.DESCRICAO,    '+
                '                P.IDCAMPO, C.NOME AS NOMEINTERNO, P.FORMATO,                          '+
                '                NVL(SUM(PANT.TAMANHO),0) AS INICIO                                    '+
                '        FROM   PARAMENVIO P, PARAMENVIO PANT, CAMPOINTERFENVIO C                      '+
                '        WHERE  P.IDLAYOUTENVIO = '+qryLayOut.FieldbyName('IDLAYOUTENVIO').AsString     +
                '        AND    PANT.IDLAYOUTENVIO(+) = P.IDLAYOUTENVIO                                '+
                '        AND    PANT.IDENTIFICADOR(+) = P.IDENTIFICADOR                                '+
                '        AND    PANT.ORDEM(+)         <= P.ORDEM -1                                    '+
                '        AND    P.IDCAMPO <> 40                                                        '+ 
                '        AND    C.IDCAMPO             = P.IDCAMPO                                      '+
                '        GROUP BY P.IDLAYOUTENVIO, P.IDENTIFICADOR, P.ORDEM, P.TAMANHO, P.DESCRICAO,   '+
                '        P.IDCAMPO,C.NOME, P.FORMATO                                                   '+
                '        ) P                                                                           '+
                ' WHERE  L.IDLAYOUTENVIO = '+qryLayOut.FieldbyName('IDLAYOUTENVIO').AsString            +
                ' AND    P.IDLAYOUTENVIO = L.IDLAYOUTENVIO                                             '+
                ' GROUP BY L.TIPO, L.CODPROVDUPLO, L.FLGCALCSALPART, L.FLGTIPOSEPARADEC,               '+
                '	         L.NUMCASASDEC, L.FLGGRAVAHIST, L.FLGRUBATMANT, L.FLGHEADER,                 '+
                '          L.FLGFOOTER, L.FLGMATCOMPLETA, L.IDPARTRUBRICA                              ');
        Open;
     end; // with
  end;

  if chkbad.checked then
  begin
     AssignFile(bad,ChangeFileExt(ExtractFileName(edTxt.Text),'.BAD'));
     rewrite(bad);
  end;


  qryTxt.DatabaseName := ExtractFilePath(edTxt.Text);
  tblCodProvDescExistentes.DatabaseName := ExtractFilePath(edTxt.Text);
  qryCodProvDescNaoExistentes.DatabaseName := ExtractFilePath(edTxt.Text);
  tblTxt.DatabaseName := ExtractFilePath(edTxt.Text);
  tblTxt.TableName    := ExtractFileName(edTxt.Text);
  //
  tblDbf.DatabaseName := ExtractFilePath(edTxt.Text);
  tblDbf.TableName    := 'tmptxt.DBF';
  tblCodProvDescExistentes.TableName := 'tmpProvDesc';
  //
  wNomeArq := ExtractFileName(edTxt.Text);


  //
  // Criar o arquivo de lay-out do arquivo texto que está sendo importado.
  //
  if not GeraArquivoSchema(edTxt.Text) then begin;
     MsgDlg('Erro ao criar o arquivo esquema de recebimento!','Erro',mtError,[mbOk],0);
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
     CloseFile(F);
     if chkbad.checked then   CloseFile(bad);
     bbtnCalcula.Enabled := true;
     exit;
  end;

  Screen.Cursor:=crHourGlass;
  //
  // Apaga a CLASSERUBRICAS se a opção Histórico de Rubricas for escolhido
  //

  TwCons.Etapa.Pos       := 1;
  iContadorCommit := 0;
  if clbEtapas.Checked[0] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Esvaziando tabela temporária do banco de dados ');
     Application.ProcessMessages;
     if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;
     qryDesfazClasseRubricas.Close;
     qryDesfazClasseRubricas.ExecSQL;
     CommitTransacao;
  end;


  // Testa máscaras que têm dígito, mas não tem separador, exemplo FUNCEF
  sDigito := '';
  iIniDigito := pos('D',uppercase(qryPatroCombo.FieldByName('MASCMATRICULA').AsString)) - 1;
  if iIniDigito <= 0 then
     begin
        iIniDigito := pos('-',uppercase(qryPatroCombo.FieldByName('MASCMATRICULA').AsString)) -1;
        sDigito := '-';
     end;

  lbMensagens.Lines.Add(TimeToStr(Time)+' - Abrindo Arquivo TXT');
  Application.ProcessMessages;
  try
     /// Abro o dbf para alterar o tipo de campo
     tblTxt.Open;

     lbMensagens.Lines.Add(TimeToStr(Time)+' - Iniciando a criação do arquivo temporário');
     Application.ProcessMessages;
     bmPatro.RecordCount := 0;
     try
        bmPatro.Execute;
     except
        MsgDlg('Erro ao abrir arquivo texto causado por inconsistência no'+#13+
               ' cadastro de lay-out. Verifique arquivo de Esquema(sch) gerado'+#13+
               ' no mesmo diretório do arquivo texto.','Erro',mtError,[mbOk],0);
        lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
        bbtnCalcula.Enabled := true;
        CloseFile(F);
        exit;
     end;


     /// Se necessário retirar os registros de cabeçalho e rodapé
     if qryDadosArquivo.FieldByName('FLGHEADER').AsString = 'S' then begin
        with tblDbf do begin
           Open;
           First;
           Delete;
           Close;
        end;

     end;
     if qryDadosArquivo.FieldByName('FLGFOOTER').AsString = 'S' then begin
        with tblDbf do begin
           Open;
           Last;
           Delete;
           Close;
        end;
     end;
  finally
     tblTxt.Close;
  end;

  //
  // Verificar os proventos existentes para a patrocinadora
  //
  lbMensagens.Lines.Add(TimeToStr(Time)+' - Iniciando teste de Rubricas ');
  Application.ProcessMessages;

  with qryTxt do begin
     SQL.Clear;
     SQL.Add('SELECT DISTINCT DBF.PROVENTO ');
     SQL.Add('FROM  TMPTXT DBF ');

     //caso o mesmo provento use o mesmo código
     //este pode estar com alguma letra
     //então não pode ser tratado como numérico
     //como no caso do Serpros
     //no entanto, num caso como o da CBS em que o código vem com seroz a esquerda
     //no arquivo e é cadastrado sem zeros, esse tratamento é necessário
     if qryDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
     begin
        SQL.Add('WHERE DBF.PROVENTO NOT IN ( ');
        SQL.Add('SELECT DISTINCT RP.CODPROVDESC FROM ":BASEDADOS:RUBRICAXPESS" RP WHERE RP.IDPESSOA = '+IntToStr(iPatro)+'   ) ');
     end
     else
     begin
        SQL.Add('WHERE TRIM(DBF.PROVENTO) NOT IN ( ');
        SQL.Add('SELECT DISTINCT TRIM(RP.CODPROVDESC) FROM ":BASEDADOS:RUBRICAXPESS" RP WHERE RP.IDPESSOA = '+IntToStr(iPatro)+'    ) ');
     end;

     Open;

     if not IsEmpty
     then begin
        First;
        while not EOF do
        begin
           mmDivergencias.Lines.Add('Código da rubrica da Patrocinadora não associada no Sistema - ' + FieldByName('PROVENTO').AsString);
           lbMensagens.Lines.Add('Código da rubrica da Patrocinadora não associada no Sistema - ' + FieldByName('PROVENTO').AsString);

           GravaErrosCCP(1, iPatro, 'Rubrica não associada.',
                         ' ', FieldByName('PROVENTO').AsString,
                         sMesCob, rValor,'', sMesCob,'');
           Next;
        end;
        Application.ProcessMessages;

        mmDivergencias.Lines.SaveToFile(ExtractFilePath(edTxt.Text) + '\Div' +
                                        copy(FormatDateTime('dd/mm/yyyy', date),1,2) +
                                        copy(FormatDateTime('dd/mm/yyyy', date),4,2) +
                                        copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '.err');

        if MsgDlg('Existe(m) '+ inttostr(recordcount)+' rubrica(s) não associada(s) a patrocinadora, continua sem consertar ?','Confirmação', 
           mtConfirmation, [mbYes, mbNo], 0) = mrYes
        then begin
          if MsgDlg('Poderá ser calculado o salário participação com erro, quer realmente continuar?','Confirmação', 
          mtConfirmation, [mbYes, mbNo], 0) <> mrYes
          then begin
            lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
            bbtnCalcula.Enabled := true;
            CloseFile(F);
            if chkbad.checked then    CloseFile(bad);
            exit;
          end
        end
        else begin
           lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
           bbtnCalcula.Enabled := true;
           CloseFile(F);
           if chkbad.checked then   CloseFile(bad);
           bbtnCalcula.Enabled := true;
           exit;
        end;
     end;
     Close;
  end;


  sProvento      :='-10';
  sChave         :='';
  sFlgSalPart    :='0';
  sFlgSalBenef   :='0';
  sFlgIrrf       :='0';
  sFlgRemTotal   :='0';
  sOrdemCalculo  :='0';
  sFlgAtrasoDev  :='N';
  sErro          :='';
  sCodRefH       :='';
  sCodRefC       :='';
  sCodRef        :='';
  sUltValorChave := '';


  sMesRef      := copy(deDataRef.Text,7,4)+'/'+copy(deDataRef.Text,4,2);
  sMesCob      := copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2);
  sMesRefGr    := copy(deDataRef.Text,7,4)+'/'+copy(deDataRef.Text,4,2);
  sMesCobGr    := copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2);
  sMesCot      := copy(deDataRef.Text,4,2)+copy(deDataRef.Text,7,4);
  sDataRef     := deDataRef.Text;
  sMatriculaAtual := '';

  /// Inicia a variável de mês de referência do 13º de acordo com a parametrização
  sMesRef13  := copy(deDataRef.Text,7,4)+'/13';

  lbMensagens.Lines.Add(TimeToStr(Time)+' - Verificando se já foi gravado algum dado de contribuição');
  Application.ProcessMessages;
  sCodRef:= '';


  if qryDadosArquivo.FieldByName('IDPartRubrica').AsInteger = 1
  then begin
     qryBuscaIdpessoa.Close;
     qryBuscaIdpessoa.Sql.Text:='SELECT EP.IDPESSOA,EP.IDPESSJUR,EP.MATRICULA,P.IDPLANOPREV,P.INSCRICAONUMERO '+
                                'FROM   ELEGPATRO EP,PARTPREVPLAN P     '+
                                'WHERE (P.INSCRICAONUMERO = :VALORCHAVE) AND '+
                                '      (EP.IDPESSJUR = :CODPATRO) AND   '+
                                '      (P.IDPESSJUR = EP.IDPESSJUR) AND '+
                                '      (P.IDPESSOA  = EP.IDPESSOA) AND  '+
                                '      (P.FLGDESATIVADO = 0) ';
     qryBuscaIdpessoa.Prepare;
  end
  else begin
     qryBuscaIdpessoa.Close;
     qryBuscaIdpessoa.sql.clear;
     qryBuscaIdpessoa.Sql.Text:='SELECT EP.IDPESSOA,EP.IDPESSJUR,EP.MATRICULA,NVL(P.IDPLANOPREV,0) AS IDPLANOPREV,P.INSCRICAONUMERO '+
                                'FROM   ELEGPATRO EP,PARTPREVPLAN P     '+
                                'WHERE (EP.MATRICULA = :VALORCHAVE) AND '+
                                '      (EP.IDPESSJUR = :CODPATRO)   AND '+
                                '      (P.IDPESSJUR(+) = EP.IDPESSJUR) AND '+
                                '      (P.IDPESSOA(+)  = EP.IDPESSOA)  AND '+
                                '      (P.FLGDESATIVADO(+) = 0) ';
     qryBuscaIdpessoa.Prepare;
  end;
  //
  qryBuscaPlanoPess.Close;
  qryBuscaPlanoPess.Prepare;
  //

  qryRubricasPatro.Close;
  qryRubricasPatro.ParamByName('IdPessJur').Value := iPatro;
  qryRubricasPatro.Open;
  //

  iIdRubSalBenef       := qryRubricasPatro.FieldByName('IdRubSalBeneficio').AsInteger;
  sCodProvDescSalBenef := RetornaCodProvDesc(iPatro,iIdRubSalBenef);
  //
  iIdRubRemTotal       := qryRubricasPatro.FieldByName('IdRubRemTotal').AsInteger;
  sCodProvDescRemTotal := RetornaCodProvDesc(iPatro,iIdRubRemTotal);
  //
  iIdRubSalPart        := qryRubricasPatro.FieldByName('IDRUBSALPARTICIP').AsInteger;
  sCodProvDescSalPart  := RetornaCodProvDesc(iPatro,iIdRubSalPart);
  //

  //novo tratamento de 13, pela tabela PARAMSAL13
  qryMesCob13.Close;
  qryMesCob13.ParamByName('IdPessjur').AsInteger := iPatro;
  qryMesCob13.ParamByName('exercicio').AsInteger := strtoint(copy(sMesCob,1,4)) ;
  qryMesCob13.Open;

  iIdRubSal13        := 0;
  sCodProvDescSal13  := '';

  bCobra13 := not qryMesCob13.isempty;

  If (bCobra13)Then
  Begin
     If (qryRubricasPatro.FieldByName('IDRUBSALPARTICIP').AsInteger <> qryMesCob13.FieldByName('IDRUBRICA').AsInteger) Or
        ((qryRubricasPatro.FieldByName('IDRUBSALPARTICIP').AsInteger = qryMesCob13.FieldByName('IDRUBRICA').AsInteger) And
         (MsgDlg('O mês '+QuotedStr(sMesCob)+' está parametrizado como recebimento de 13º salário.'+#13+
                 'Deseja calcular o Salário de Participação APENAS PARA O 13º salário?' , 'Confirmação',
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes)) Then
     Begin
     iIdRubSal13        := qryMesCob13.FieldByName('IDRUBRICA').AsInteger;
     sCodProvDescSal13  := RetornaCodProvDesc(iPatro,iIdRubSal13);
     End;
  End;

  with qryBuscaSalPart do
  begin
    Close;
    ParamByName('IDPESSJUR').AsInteger   := iPatro;
    ParamByName('IDRUBRICA').AsInteger   := iIdRubSalPArt;
    ParamByName('MESCOBRANCA').AsString := sAnoMesAnterior(sMesCob);
  end;

  // ***********************************************************************************************
  // ETAPA 1 - INSERÇÃO NO HISTORICO DE RUBRICAS
  // ***********************************************************************************************
  /// Se a opção Histórico de Rubricas estiver marcada
  /// processa a gravação de rubricas
  TwCons.Etapa.Pos       := 2;
  iContadorCommit := 0;
  if clbEtapas.Checked[0]
  then begin
      lbMensagens.Lines.Add(TimeToStr(Time)+' - Filtrando e classificando informações do arquivo temporário');
      Application.ProcessMessages;

      ///
      ///  MONTO A STRING DA QUERY HETEROGÊNEA ACESSANDO O
      ///  ORACLE ATRAVÉS DA TABELA LOCAL

      with qryTxt do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT '+Copy(sCamposDBF, 1, Length(sCamposDBF) - 2) );
         SQL.Add('FROM  TMPTXT DBF  ');
         SQL.Add('ORDER BY DBF.PROVENTO, DBF.VALORCHAVE');

         Open;
         if isEmpty then begin
            lbMensagens.Lines.Add(TimeToStr(Time)+' - Não há contribuições a serem calculadas. Processo abortado!');
            CloseFile(F);
            if chkbad.checked then   CloseFile(bad);
            Exit;
         end;
      end;

      //
      lbMensagens.Lines.Add(TimeToStr(Time)+' - Inicio da gravação das rubricas e contribuições');
      Application.ProcessMessages;
      //
      qryPatro.Close;
      qryPatro.ParamByName('CODPATRO').AsInteger:=iPatro;
      try
         qryPatro.Open;
      except
         MsgDlg('Erro ao acessar dados da patrocinadora!','Erro',mtError,[mbOk],0);
         lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
         CloseFile(F);
         if chkbad.checked then  CloseFile(bad);
         exit;
      end;

      //seta data de referência
      if (trim(qryDadosArquivo.FieldByName('INIDATAREF').AsString) = '1000')
      then begin
         sDataRefGr:=sDataRef;
      end else begin
         sDataRefGr:= deDataRef.text;
      end;
      //

      iSeqTabela := 0;
      sMatriculaAux := '';

      while not qryTxt.EOF do
      begin
         sLinha := MontaLinhaArqBad(qrytxt);

         If Trim(sLinha) = ''
          Then Begin
            qryTxt.Next;
            Continue;
          End;

         if (trim(qryDadosArquivo.FieldByName('INIMESREF').AsString) = '1000')
         then sMesRefGr := sMesRef
         else
           If UpperCase(qryDadosArquivo.FieldByName('FMTMESREF').AsString) = 'MM'
           Then sMesRefGr := copy(deDataRef.Text,7,4)+'/'+
                             ConvMes(trim(qryTxt.FieldByName('MESREF').AsString),qryDadosArquivo.FieldByName('FMTMESREF').AsString,sIniAnoRef)
           Else sMesRefGr := ConvMes(trim(qryTxt.FieldByName('MESREF').AsString),qryDadosArquivo.FieldByName('FMTMESREF').AsString,sIniAnoRef);

         //lê sequêncial de rubrica do arquivo texto
         if (trim(qryDadosArquivo.FieldByName('INICIOSEQINTERFA').AsString) = '1000')
         then sSeqRubrica := '01'
         else sSeqRubrica:= IntToStr(qryTxt.FieldByName('SEQINTERFA').AsInteger);
         //

         sProxProvento := sProvento;


         if (sUltRubrica <> '')
         and (trim(sProvento) < sUltRubrica ) then
         begin
            QryTxT.Next;
            Continue;
         end;


         inc(icontadorcommit);

         qrybuscapessoa.close;
         qrybuscapessoa.sql.text := ' SELECT PP.IDPESSOA , PP.IDPLANOPREV            '+
                                    ' FROM   PARTPREVPLAN PP, ELEGPATRO EL           '+
                                    ' WHERE  PP.IDPESSJUR = '+IntToStr(iPatro)        +
                                    ' AND    PP.IDPLANOPREV = PP.IDPLANOPREV         '+
                                    ' AND    PP.IDPESSOA = PP.IDPESSOA               '+
                                    ' AND    EL.IDPESSJUR = PP.IDPESSJUR             '+
                                    ' AND    EL.IDPESSOA = PP.IDPESSOA               '+
                                    '  AND PP.INSCRICAODATA = (SELECT MAX(P.INSCRICAODATA) '+
                                    '                          FROM PARTPREVPLAN P '+
                                    '                          WHERE P.IDPESSOA = PP.IDPESSOA '+
                                    '                            AND P.IDPESSJUR = PP.IDPESSJUR '+
                                    '                            AND TO_CHAR(P.INSCRICAODATA, ''YYYY/MM'') <= '+QuotedStr(sMesRefGr)+')';

                                    //se matrícula vem exatamente no arquivo como está cadastrada no banco
                                    //ex: 0000341 --> 0000341
                                    if qryDadosArquivo.FieldByName('FLGMATCOMPLETA').AsInteger = 1
                                    then begin
                                       if iIniDigito > 0
                                       then qrybuscapessoa.sql.text := qrybuscapessoa.sql.text +
                                                                     ' AND EL.MATRICULA LIKE  '''+qryTXT.FieldByName('VALORCHAVE').AsString+sDigito+'%'' '
                                       else qrybuscapessoa.sql.text := qrybuscapessoa.sql.text + ' AND EL.MATRICULA = '''+IntToStr(qryTXT.FieldByName('VALORCHAVE').AsInteger)+''' ';
                                    end
                                    //quando a matrícula não vem no arquivo exatamente como cadastrado no banco
                                    //ex: 000341 --> 341 -  então deve ser transformada em numérico
                                    else begin
                                       if iIniDigito > 0
                                       then qrybuscapessoa.sql.text := qrybuscapessoa.sql.text +
                                                                     ' AND SUBSTR(RTRIM(LTRIM(EL.MATRICULA)),1,'+inttostr(length(IntToStr(qryTXT.FieldByName('VALORCHAVE').AsInteger)))+') = '+
                                                                     ' '''+IntToStr(qryTXT.FieldByName('VALORCHAVE').AsInteger)+''' '
                                       else qrybuscapessoa.sql.text := qrybuscapessoa.sql.text + ' AND EL.MATRICULA = '''+IntToStr(qryTXT.FieldByName('VALORCHAVE').AsInteger)+''' ';
                                    end;

         qrybuscapessoa.sql.text := qrybuscapessoa.sql.text +  ' ORDER BY PP.INSCRICAODATA DESC  ';
         qrybuscapessoa.open;

         if qrybuscapessoa.isempty then
         begin
            WriteLn(F,qryTXT.FieldByName('VALORCHAVE').AsString+'Participante não encontrado no sistema.');
            mmDivergencias.Lines.Add(qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Participante não encontrado.'+
                                     ' Rubrica '+sProvento+' Valor '+ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString))+'.');

            if qryTxt.FieldByName('VALORPROVE').AsString = '' then
               rValor := 0
            else
               rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));


            GravaErrosCCP(2, iPatro, 'Participante não encontrado no sistema.',
                          qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                          sMesRefGr, rValor,'', sMesCobGr, sLinha );



            qryTxt.Next;
            Continue;
         end;


         //testa se o código da rubrica está sendo selecionada
         //no arquivo
         if qryDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0'
         then sProvento:=qryTxt.FieldByName('PROVENTO').AsString
         else
         begin
               sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);
         end;
         //
         if sProvento = '' then
         begin
            mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Código da rubrica em branco.');
            QryTxT.Next;
            Continue;
         end;



         //atualiza o salreferência em ELEGPATRO
         //caso a rubrica seja específica de salário de referência
         //leo - 08/04/2001
         if   trim(sCodRubSalRef) =  trim(sProvento) then
         begin
            qryAtualizaElegpatro.ParamByName('SalPart').AsFloat     := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));
            qryAtualizaElegpatro.ParamByName('idpessjur').AsInteger := iPatro;
            qryAtualizaElegpatro.ParamByName('idpessoa').AsInteger  := qrybuscapessoa.FieldByName('IDPESSOA').AsInteger;
            try
               qryAtualizaElegpatro.ExecSql;
            except
               WriteLn(F,'Não atualizou o Salário de referência do Arquivo Texto');
               mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Não gravou o Salário de referência no Histórico...');

               if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                  rValor := 0
               else
                  rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

               GravaErrosCCP(3, iPatro, 'Erro ao atualizar salário de referência.',
                             qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                             sMesRefGr, rValor,'',sMesCobGr, sLinha);

               qryTxt.Next;
               Continue;
            end;
         end;
         //fim do tratamento de salário de referência


         //
         if ((sCodRef = '') or (trim(sProvento) > sCodRef)) and
            (trim(qryTxt.FieldByName('VALORCHAVE').AsString) <> '000000') then begin

            try
               if not dtmbasedados.dbBaseDados.InTransaction       then StartTransacao;


               if sProvento <> sProventoTela then begin
                  lbMensagens.Lines.Add(TimeToStr(Time)+' - Processando a Rubrica '+sProvento);
                  sProventoTela := sProvento;
                  Application.ProcessMessages;
               end;


               bAbreBuscaRubrica := true;
               try
                  if (qryBuscaRubrica.ParamByName('CODPROVDESC').AsString = trim(sProvento)) and
                     (qrybuscapessoa.fieldbyname('IDPLANOPREV').AsString =
                      qryBuscaRubrica.ParamByName('IDPLANOPREV').AsString  ) then
                  bAbreBuscaRubrica := false;
               except
               end;

               if bAbreBuscaRubrica then
               begin
                  qryBuscaRubrica.Close;
                  //busca rubrica
                  //criticando se usa código duplo
                  if qryDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
                     qryBuscaRubrica.sql.text := memBuscaRubricasDuplo.Text
                  else
                     qryBuscaRubrica.sql.text := memBuscaRubricas.Text;

                  qryBuscaRubrica.ParamByName('CODPROVDESC').AsString:= trim(sProvento);
                  qryBuscaRubrica.ParamByName('CODPATRO').AsInteger  :=iPatro;
                  qryBuscaRubrica.ParamByName('IDPLANOPREV').AsInteger := qrybuscapessoa.FieldByName('IDPLANOPREV').AsInteger;

                  try
                     qryBuscaRubrica.Open;
                     //
                  except
                     MsgDlg('Erro acessar dados da rubrica '+trim(sProvento)+'!','Erro',mtError,[mbOk],0);
                     lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
                     CloseFile(F);
                     if chkbad.checked then     CloseFile(bad);
                     exit;
                  end;
               end;




               if not qryBuscaRubrica.IsEmpty then begin

                  //se trouxe apenas um registro quer dizer que o
                  //código é próprio de algum deconto
                  if qryBuscaRubrica.Recordcount = 1 then
                  begin

                     iRubrica      := qryBuscaRubrica.FieldByName('IDRUBRICA').AsInteger;
                     sFlgAtrasoDev := 'N';

                     if qryBuscaRubrica.FieldByName('IDCONTRIBUICAO').AsInteger > 0
                     then begin
                        sChave := 'P';
                        iContribuicao:= qryBuscaRubrica.FieldByName('IDCONTRIBUICAO').AsInteger;
                     end else if qryBuscaRubrica.FieldByName('IDCONTRIBATRASO').AsInteger > 0
                     then begin
                        iContribuicao:= qryBuscaRubrica.FieldByName('IDCONTRIBATRASO').AsInteger;
                        sFlgAtrasoDev:='A';
                        sChave       := 'P';
                     end else if qryBuscaRubrica.FieldByName('IDCONTRIBDEVOL').AsInteger > 0
                     then begin
                        iContribuicao:= qryBuscaRubrica.FieldByName('IDCONTRIBDEVOL').AsInteger;
                        sFlgAtrasoDev:='D';
                        sChave       := 'P';
                     end
                     else begin
                        if qryBuscaRubrica.FieldByName('IDCONTASS').AsInteger > 0 then
                        begin
                           sChave := 'A';
                           iContribuicao:= qryBuscaRubrica.FieldByName('IDCONTASS').AsInteger;
                        end else
                        begin
                           sChave := qryBuscaRubrica.FieldByName('FLGTPRUBRICA').AsString;
                           iContribuicao:= 0;
                        end;
                     end;

                     sFlgSalPart:='0';
                     If not qryBuscaRubrica.FieldByName('FLGCOMPOESALPART').isNull then
                        sFlgSalPart:=trim(qryBuscaRubrica.FieldByName('FLGCOMPOESALPART').AsString);
                     sFlgSalBenef:='0';
                     If not qryBuscaRubrica.FieldByName('FLGCOMPOESALBENEF').isNull then
                        sFlgSalBenef:=trim(qryBuscaRubrica.FieldByName('FLGCOMPOESALBENEF').AsString);
                     sFlgIrrf:='0';
                     If not qryBuscaRubrica.FieldByName('FLGIRRF').isNull then
                        sFlgIrrf:=trim(qryBuscaRubrica.FieldByName('FLGIRRF').AsString);
                     sFlgRemTotal:='0';
                     If not qryBuscaRubrica.FieldByName('FLGCOMPOEREMTOTAL').isNull then
                        sFlgRemTotal:=trim(qryBuscaRubrica.FieldByName('FLGCOMPOEREMTOTAL').AsString);
                     sOrdemCalculo:='0';
                     If not qryBuscaRubrica.FieldByName('ORDEMCALCULO').isNull then
                        sOrdemCalculo:=trim(qryBuscaRubrica.FieldByName('ORDEMCALCULO').AsString);

                  end
                  else //se voltou mais de um código então
                       //deve-se verificar possíveis descontos esperados
                       //e então desmembrar o valor entre eles
                       //ex: rubricas de atraso, que podem ser de contribuições diferente
                       //para situações diferentes
                  begin

// CODPROVDESC com MAIS DE UM REGISTRO NA RUBRICAXPESS
                     qryLoop.close;
                     qryLoop.SQL.Text := ' SELECT T.FLGATRASODEVOL, T.MESREFERENCIA, T.IDDESCONTO IDCONTRIBUICAO, T.IDPROVENTO, T.VALOR  '+
                                ' FROM  TMPDESC T, PROVDESC P  '+
                                ' WHERE T.IDPESSOA = '+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+' AND '+
                                ' T.IDPESSJUR = '+IntToStr(iPatro)+' AND '+
                                ' T.MESCOBRANCA   = '+ ''''+sMesCobGr+''''+' AND ';


                     qryLoop.SQL.Text := qryLoop.SQL.Text + ' LTRIM(RTRIM(T.CODPROVDESC))   = '''+sProvento+''' AND '+
                                ' P.IDPROVENTO = T.IDPROVENTO AND '+
                                ' T.FLGDESCFOLHA = ''P'' '+
                                ' ORDER BY T.MESREFERENCIA, P.NUMPRIORIDADE ';
                     qryLoop.Open;


                     //fazer controle dos pagamentos a maior
                     if not qryLoop.isempty then
                     begin

                        sFlgAtrasoDev := qryLoop.FieldByName('FLGATRASODEVOL').AsString; 
                        
                        //se insere todas as rubricas na histrubsal
                        if (Pos('G',sChave) > 0) Or
                        (qryDadosArquivo.FieldByName('FLGGRAVAHIST').AsInteger = 1) then
                        begin

                           sSql:='INSERT INTO HISTRUBSAL(IDPESSOA,MESCOBRANCA,IDMOTIVO,MES,IDPESSJUR, IDPATRO, '+
                                 'REFERENCIA,IDRUBRICA,CODPROVDESC,CODMOEDA,VALORPROVENTO,IDREGRACALCULO,'+
                                 'FLGCOMPOESALPART,FLGCOMPOESALBENEF,FLGCOMPOEREMTOTAL,FLGIRRF,SEQRUBRICA,'+
                                 'VALORCOTAS,FLGSRB, IDMODULO,IDPLANOPREV, IDTITULAR, LOTEORIGINAL   ) VALUES ('; 
                           sSql := sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';
                           sSql := sSql+''''+sMesCobGr+''',';
                           sSql := sSql+trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString)+',';
                           If (sFlgAtrasoDev = 'A') And (sChave = 'P') And
                              (qryPatroCombo.FieldByName('FLGRUBATMANT').AsInteger=1)
                            Then sSql := sSql+''''+DecMesReferencia(sMesRefGr)+''','
                            Else sSql := sSql+''''+sMesRefGr+''',';
                           sSql := sSql+IntToStr(iPatro)+',';
                           sSql := sSql+IntToStr(iPatro)+',';
                           sSql := sSql+'''***'',';
                           sSql := sSql+IntToStr(iRubrica)+',';
                           sSql := sSql+''''+trim(sProvento)+''',';
                           sSql := sSql+'NULL,';
                           sSql := sSql+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)+',';
                           sSql := sSql+'NULL,';
                           sSql := sSql+sFlgSalPart+',';
                           sSql := sSql+sFlgSalBenef+',';
                           sSql := sSql+sFlgRemTotal+',';
                           sSql := sSql+sFlgIrrf+',';
                           sSql := sSql+sSeqRubrica+',';
                           sSql := sSql+'0,';
                           sSql := sSql+'1,';
                           sSql := sSql+inttostr(Sistema.IdModulo)+',';
                           //sSql:=sSql+inttostr(iPlano)+',';
                           sSql:=sSql+inttostr(qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger)+',';
                           sSql:=sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';
                           sSql:=sSql+IntToStr(liIdLote)+')'; 

                          sSql := ExisteSalPart(iRubrica, sMesRefGr,  sMesCobGr, IntToStr(iPatro), IntToStr(iRubrica),
                                  trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString),
                                  '***', trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString),
                                  sSeqRubrica, ConvValor(qryTxt.FieldByName('VALORPROVE').AsString), sSql);

                           If not ExecutarQuery(qryAux,sSql) then begin
                              if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                 rValor := 0
                              else
                                 rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                              GravaErrosCCP(8, iPatro, 'Rubrica não gravada. Possível duplicação.',
                                            qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                            sMesRefGr, rValor,'',sMesCobGr,sLinha);

                              sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                              sUltProvento := sProvento;
                              

                              sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);


                           end;
                        end;


                        iCont := qryLoop.recordcount;

                        dValorSobra := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));
                        while (not qryLoop.eof) and
                              (dValorSobra >0 ) do
                        begin

                           dec(iCont);

                           //se é o último registro e o pagamento é maior
                           //do que o esperado, então atualizar com o recebido
                           if (dValorSobra > qryLoop.fieldbyname('VALOR').AsFloat) and
                              (iCont = 0) then
                           begin
                              sValorAtu := oranumero(FloatToStr(dValorSobra));
                              dValorSobra := 0;
                           end
                           else
                           begin

                              if (qryLoop.fieldbyname('VALOR').AsFloat > dValorSobra)  then
                              begin
                                 //se o esparado é maior que a sobra , então receber a sobra e parar
                                 sValorAtu := oranumero(FloatToStr(dValorSobra));
                                 dValorSobra := 0;
                              end
                              else
                              begin
                                 //se ainda há sobra, atualizar com o esperado e cotinuar
                                 sValorAtu := oranumero(qryLoop.fieldbyname('VALOR').AsString);
                                 dValorSobra := dValorSobra -  qryLoop.fieldbyname('VALOR').AsFloat;
                              end;
                           end;


                           //insere na classerubricas com os códigos esperados na tmpdesc
                           //e já desmembrado
                           inc(iSeqTabela);
                           sSql:='INSERT INTO CLASSERUBRICAS(CODPATRO,IDPESSOA,CODPLANO,MESREFERENCIA,'+
                                 'MESCOBRANCA,DATAREFERENCIA,VALORRECEBIDO,CODPROVDESC,CHAVE,VALORCHAVE,'+
                                 'IDRUBRICA,IDCONTRIBUICAO,FLGATRASODEVOL,ORDEMCALCULO,SEQINTERFACE,FLG13) VALUES (';
                           sSql:=sSql+IntToStr(iPatro)+',';
                           sSql:=sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';           
                           sSql:=sSql+trim(inttostr(qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger))+',';

                           If (sFlgAtrasoDev = 'A') And (sChave = 'P') And
                              (qryPatroCombo.FieldByName('FLGRUBATMANT').AsInteger=1)
                            Then sSql := sSql+''''+DecMesReferencia(qryLoop.fieldbyname('MESREFERENCIA').AsString)+''','
                            Else sSql := sSql+''''+qryLoop.fieldbyname('MESREFERENCIA').AsString+''',';

                           sSql:=sSql+''''+sMesCobGr+''',';
                           sSql:=sSql+'TO_DATE('''+sDataRef+''',''DD/MM/YYYY''),';
                           sSql:=sSql+sValorAtu+',';
                           sSql:=sSql+''''+trim(sProvento)+''',';
                           sSql:=sSql+''''+sChave+''',';
                           sSql:=sSql+''''+trim(qryTxt.FieldByName('VALORCHAVE').AsString)+''',';
                           sSql:=sSql+qryLoop.fieldbyname('IDPROVENTO').AsString+',';
                           sSql:=sSql+qryLoop.fieldbyname('IDCONTRIBUICAO').AsString+',';
                           sSql:=sSql+''''+qryLoop.fieldbyname('FLGATRASODEVOL').AsString+''',';
                           sSql:=sSql+'0,'; //ORDEMCALCULO
                           sSql:=sSql+IntToStr(iSeqTabela)+',';
                           sSql:=sSql+'0'+')'; //CONTRIBSOBRE13

                           if not ExecutarQuery(qryAux,sSql) then begin
                              if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                 rValor := 0
                              else
                                 rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                              GravaErrosCCP(7, iPatro, 'Erro na gravação da Contribuição.',
                                            qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                            sMesRefGr, rValor,
                                            qryLoop.fieldbyname('IDCONTRIBUICAO').AsString,
                                            sMesCobGr, sLinha);

                              sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                              sUltProvento := sProvento;
                              qryTxt.Next;

                              sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);

                              Continue;
                           end;

                           If pos('A', qryBuscaRubrica.FieldByName('FLGTPRUBRICA').AsString) > 0
                            Then Begin
                              sSql := ' UPDATE TMPDESC '+
                                      'SET VALORRECEBIDO = '+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)+' , '+
                                      ' SITENVIO = DECODE(VALOR,'+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)+','+''''+'2'+''''+','+''''+'1'+''''+') , '+
                                      ' DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY'')   '+
                                      ' WHERE IDPESSOA = '+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+' AND '+
                                      ' IDPESSJUR = '+IntToStr(iPatro)+' AND '+
                                      ' MESCOBRANCA   = '+ ''''+sMesCobGr+''''+' AND '+
                                      ' LTRIM(RTRIM(CODPROVDESC))   = '''+sProvento+''' ';

                              If Not ExecutarQuery(qryAux,sSql)
                               Then Begin
                                 If qryTxt.FieldByName('VALORPROVE').AsString = ''
                                  Then rValor := 0
                                  Else rValor := qryTxt.FieldByName('VALORPROVE').AsFloat;

                                  GravaErrosCCP(8, iPatro, 'Rubrica não recebida. Erro no recebimento da Rubrica.',
                                                qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                                sMesRefGr, rValor,'',sMesCobGr, sLinha);

                                  memo1.Lines.Add('Erro no recebimento da Rubrica '+sProvento+', Matrícula '+qryTxt.FieldByName('VALORCHAVE').AsString+' ');

                                  sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                                  sUltProvento := sProvento;
                                  sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);
                                 End;
                            End
                           // AS RUBRICAS DESMEMBRADAS, DE ATRASO NÃO ESTAVAM SENDO ATUALIZADAS NA TMPDESC
                           else begin
                              sSql := ' UPDATE TMPDESC '+
                                      ' SET    VALORRECEBIDO = '+sValorAtu+' , '+
                                      '        SITENVIO = DECODE(VALOR,'+sValorAtu+','+''''+'2'+''''+','+''''+'1'+''''+') , '+
                                      '        DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY'')   '+
                                      ' WHERE  IDPESSOA = '+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+
                                      ' AND    IDPESSJUR = '+IntToStr(iPatro)+
                                      ' AND    MESCOBRANCA   = '+ ''''+sMesCobGr+''''+
                                      ' AND    LTRIM(RTRIM(CODPROVDESC))   = '''+sProvento+''' '+
                                      ' AND    IDPROVENTO = '+OraNumero(qryLoop.fieldbyname('IDPROVENTO').AsString)+
                                      ' AND    IDDESCONTO = '+OraNumero(qryLoop.fieldbyname('IDCONTRIBUICAO').AsString);

                              If Not ExecutarQuery(qryAux,sSql)
                              Then Begin
                                 If qryTxt.FieldByName('VALORPROVE').AsString = ''
                                 Then rValor := 0
                                 Else rValor := qryTxt.FieldByName('VALORPROVE').AsFloat;

                                 GravaErrosCCP(8, iPatro, 'Rubrica não recebida. Erro no recebimento da Rubrica.',
                                               qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                               sMesRefGr, rValor,'',sMesCobGr, sLinha);

                                 memo1.Lines.Add('Erro no recebimento da Rubrica '+sProvento+', Matrícula '+qryTxt.FieldByName('VALORCHAVE').AsString+' ');

                                 sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                                 sUltProvento := sProvento;
                                 sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);
                              End;
                           end;

                           qryLoop.Next;
                        end; //while qryloop

                        qrytxt.next;
                        continue;
                     end
                     else // se não encontrou algo esperado na tmpdesc
                          //então inserir com código da folha da patrocinadora
                          //que tem 90% de chances de estar correta
                          //caso não estaja cairá nas divergências ao final
                          //do processamento
                     begin


                        iRubrica:=qryBuscaRubrica.FieldByName('IDRUBRICA').AsInteger;
                        sFlgAtrasoDev:='N';

                        if qryBuscaRubrica.FieldByName('IDCONTRIBUICAO').AsInteger > 0 then begin
                           sChave := 'P';
                           iContribuicao:= qryBuscaRubrica.FieldByName('IDCONTRIBUICAO').AsInteger;
                        end else if qryBuscaRubrica.FieldByName('IDCONTRIBATRASO').AsInteger > 0 then
                        begin
                           iContribuicao:= qryBuscaRubrica.FieldByName('IDCONTRIBATRASO').AsInteger;
                           sFlgAtrasoDev:='A';
                           sChave := 'P';
                        end else if qryBuscaRubrica.FieldByName('IDCONTRIBDEVOL').AsInteger > 0 then
                        begin
                           iContribuicao:= qryBuscaRubrica.FieldByName('IDCONTRIBDEVOL').AsInteger;
                           sFlgAtrasoDev:='D';
                           sChave := 'P';
                        end
                        else
                        begin
                           if qryBuscaRubrica.FieldByName('IDCONTASS').AsInteger > 0 then
                           begin
                              sChave := 'A';
                              iContribuicao:= qryBuscaRubrica.FieldByName('IDCONTASS').AsInteger;
                           end else
                           begin
                              sChave := qryBuscaRubrica.FieldByName('FLGTPRUBRICA').AsString;
                              iContribuicao:= 0;
                           end;
                        end;



                        sFlgSalPart:='0';
                        If not qryBuscaRubrica.FieldByName('FLGCOMPOESALPART').isNull then
                           sFlgSalPart:=trim(qryBuscaRubrica.FieldByName('FLGCOMPOESALPART').AsString);
                        sFlgSalBenef:='0';
                        If not qryBuscaRubrica.FieldByName('FLGCOMPOESALBENEF').isNull then
                           sFlgSalBenef:=trim(qryBuscaRubrica.FieldByName('FLGCOMPOESALBENEF').AsString);
                        sFlgIrrf:='0';
                        If not qryBuscaRubrica.FieldByName('FLGIRRF').isNull then
                           sFlgIrrf:=trim(qryBuscaRubrica.FieldByName('FLGIRRF').AsString);
                        sFlgRemTotal:='0';
                        If not qryBuscaRubrica.FieldByName('FLGCOMPOEREMTOTAL').isNull then
                           sFlgRemTotal:=trim(qryBuscaRubrica.FieldByName('FLGCOMPOEREMTOTAL').AsString);
                        sOrdemCalculo:='0';
                        If not qryBuscaRubrica.FieldByName('ORDEMCALCULO').isNull then
                           sOrdemCalculo:=trim(qryBuscaRubrica.FieldByName('ORDEMCALCULO').AsString);


                        //se a rubrica não foi identificada
                        //como salário e também não foi identificada
                        //como contribuição
                        if not ((trim(sCodProvDescSalPart) = sProvento )
                           or (trim(sCodProvDescSal13) = sProvento )
                           or (sFlgSalPart='1')
                           or (sFlgSalBenef='1')
                           or (sFlgRemTotal='1')
                           or (iContribuicao > 0)) then
                         begin
                            GravaErrosCCP(12, iPatro, 'Rubrica não identificada.',
                                     qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                     sMesRefGr, rValor,'',sMesCobGr, sLinha);
                            mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Rubrica '+sProvento+' não identificada no sistema.');
                            qryTxt.Next;
                            Continue;
                         end;
                     end; //if  not qryLoop.isempty then
                  end; //qryBuscaRubrica.Recordcount = 1
               end  //if not qryBuscaRubrica.IsEmpty then
               else
               begin
                  if  (ConvValor(qryTxt.FieldByName('VALORPROVE').AsString) <> '0.00')
                      and (qryDadosArquivo.FieldByName('FLGCALCSALPART').AsString = 'N')
                      and ((trim(sCodProvDescSalPart) = sProvento ) or
                           (trim(sCodProvDescSal13) = sProvento )) then
                  begin

                     sSql:='INSERT INTO HISTRUBSAL(IDPESSOA,MESCOBRANCA,IDMOTIVO,MES,IDPESSJUR, IDPATRO, '+
                           'REFERENCIA,IDRUBRICA,CODPROVDESC,CODMOEDA,VALORPROVENTO,IDREGRACALCULO,'+
                           'FLGCOMPOESALPART,FLGCOMPOESALBENEF,FLGCOMPOEREMTOTAL,FLGIRRF,SEQRUBRICA,'+
                           'VALORCOTAS,FLGSRB,IDMODULO,IDPLANOPREV, IDTITULAR, LOTEORIGINAL) VALUES ('; 
                     sSql:=sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';  
                     sSql:=sSql+''''+sMesCobGr+''',';
                     sSql:=sSql+trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString)+',';

                     //tratamento mês 13
                     if sCodProvDescSal13 = sProvento then
                        sSql:=sSql+''''+sMesRef13+''','
                     else
                        If (sFlgAtrasoDev = 'A') And (sChave = 'P') And
                           (qryPatroCombo.FieldByName('FLGRUBATMANT').AsInteger=1)
                         Then sSql := sSql+''''+DecMesReferencia(sMesRefGr)+''','
                         Else sSql := sSql+''''+sMesRefGr+''',';

                     sSql:=sSql+IntToStr(iPatro)+',';
                     sSql:=sSql+IntToStr(iPatro)+',';
                     sSql:=sSql+'''***'',';

                     //tratamento mês 13
                     if sCodProvDescSal13 = sProvento then
                     begin
                        iTstRubrica := iIdRubSal13;
                        sSql:=sSql+IntToStr(iIdRubSal13)+',';
                        sSql:=sSql+''''+trim(sCodProvDescSal13)+''',';
                     end
                     else
                     begin
                        iTstRubrica := iIdRubSalPart;
                        sSql:=sSql+IntToStr(iIdRubSalPart)+',';
                        sSql:=sSql+''''+trim(sCodProvDescSalPart)+''',';
                     end;


                     sSql:=sSql+'NULL,';
                     sSql:=sSql+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)+',';
                     sSql:=sSql+'NULL,';
                     sSql:=sSql+sFlgSalPart+',';
                     sSql:=sSql+sFlgSalBenef+',';
                     sSql:=sSql+sFlgRemTotal+',';
                     sSql:=sSql+sFlgIrrf+',';
                     sSql:=sSql+sSeqRubrica+',';
                     sSql:=sSql+'0,';
                     sSql:=sSql+'1,';
                     sSql:=sSql+inttostr(Sistema.IdModulo)+',';
                     sSql:=sSql+inttostr(qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger)+',';
                     sSql:=sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';
                     sSql:=sSql+IntToStr(liIdLote)+')'; 

                      if sCodProvDescSal13 <> sProvento
                      Then sSql := ExisteSalPart(iTstRubrica, sMesRefGr,  sMesCobGr, IntToStr(iPatro), IntToStr(iIdRubSalPart),
                                  trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString),
                                  '***', trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString),
                                  sSeqRubrica, ConvValor(qryTxt.FieldByName('VALORPROVE').AsString), sSql);

                     If not ExecutarQuery(qryAux,sSql)then begin
                        if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                           rValor := 0
                        else
                           rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                        sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                        sUltProvento := sProvento;

                        sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);
                     end;

                     //tratamento de 13
                     if sCodProvDescSal13 = sProvento then
                     begin

                        qryAtualizaPartPrevPlan4.ParamByName('SalPart').AsFloat     := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPART').AsString)));
                        qryAtualizaPartPrevPlan4.ParamByName('idpessjur').AsInteger := iPatro;
                        qryAtualizaPartPrevPlan4.ParamByName('idpessoa').AsInteger  := qrybuscapessoa.FieldByName('IDPESSOA').AsInteger;
                        qryAtualizaPartPrevPlan4.ParamByName('idplanoprev').AsInteger  := qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger;
                        try
                           qryAtualizaPartPrevPlan4.ExecSql;
                        except
                           WriteLn(F,'Não atualizou o Salário Participação 13 do Arquivo Texto');
                           mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Não gravou o Salário Participação 13 no Histórico...');

                           if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                              rValor := 0
                           else
                              rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                           GravaErrosCCP(5, iPatro, 'Erro ao atualizar salário décimo terceiro.',
                                     qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                     sMesRefGr, rValor,'',sMesCobGr, sLinha);
                        end;
                     end
                     else
                     begin
                        qryAtualizaPartPrevPlan.ParamByName('SalPart').AsFloat     := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));
                        qryAtualizaPartPrevPlan.ParamByName('idpessjur').AsInteger := iPatro;
                        qryAtualizaPartPrevPlan.ParamByName('idpessoa').AsInteger  := qrybuscapessoa.FieldByName('IDPESSOA').AsInteger;
                        qryAtualizaPartPrevPlan.ParamByName('idplanoprev').AsInteger  := qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger;
                        try
                           qryAtualizaPartPrevPlan.ExecSql;
                        except
                           WriteLn(F,'Não atualizou o Salário Participação do Arquivo Texto');
                           mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Não gravou o Salário Participação no Histórico...');

                           if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                              rValor := 0
                           else
                              rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                           GravaErrosCCP(4, iPatro, 'Erro ao atualizar salário de participação.',
                                qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                sMesRefGr, rValor,'',sMesCobGr, sLinha);

                        end;
                     end;


                     qryTxt.Next;
                     Continue;
                  end;

                  //verifica se é uma rubrica de empréstimo
                  qryaux.close;
                  qryaux.sql.text := ' SELECT 1 FROM PROVDESC P , RUBRICAXPESS R '+
                                     ' WHERE R.IDPESSOA = '+IntToStr(iPatro)+' '+
                                     ' AND R.CODPROVDESC = '''+sProvento+''' '+
                                     ' AND P.IDPROVENTO = R.IDRUBRICA  '+
                                     ' AND P.FLGTPRUBRICA LIKE ''%E%'' ';
                  qryaux.open;

                  if qryaux.isempty then
                  begin

                     if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                        rValor := 0
                     else
                        rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                     GravaErrosCCP(12, iPatro, 'Rubrica não identificada.',
                           qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                           sMesRefGr, rValor,'', sMesCobGr, sLinha);

                     mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Rubrica '+sProvento+' não identificada no sistema.');
                     qryTxt.Next;
                     Continue;
                  end;


                  sChave := 'E';
                  iContribuicao:= 0;
                  sFlgSalPart:='0';
                  sFlgSalBenef:='0';
                  sFlgIrrf:='0';
                  sFlgRemTotal:='0';
                  sOrdemCalculo:='0';
                  sFlgAtrasoDev:='N';

               end; //if  not qryBuscaRubrica.IsEmpty then

               //tratamento para salário base que vem em coluna separada
               //e não em uma rubrica
               //como vem vários registros para cada participante,
               //é feita uma crítica para verificar a já existência no mês informado
               if (qryDadosArquivo.FieldByName('FLGCALCSALPART').AsString = 'I') and
                 (qryDadosArquivo.FieldByName('INIVALORPART').AsString <> '1000') then
               begin

                  if sMatriculaAtual <> qryTXT.FieldByName('VALORCHAVE').AsString then
                  begin

                      if StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPART').AsString))) > 0 then
                      begin


                          sSql :='INSERT INTO HISTRUBSAL(IDPESSOA,MESCOBRANCA,IDMOTIVO,MES,IDPESSJUR, IDPATRO,'+
                                'REFERENCIA,IDRUBRICA,CODPROVDESC,CODMOEDA,VALORPROVENTO,IDREGRACALCULO,'+
                                'FLGCOMPOESALPART,FLGCOMPOESALBENEF,FLGCOMPOEREMTOTAL,FLGIRRF,SEQRUBRICA,'+
                                'VALORCOTAS,FLGSRB,IDMODULO, IDPLANOPREV, IDTITULAR, LOTEORIGINAL) VALUES ('; 
                          sSql:=sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';
                          sSql:=sSql+''''+sMesCobGr+''',';
                          sSql:=sSql+trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString)+',';

                          If (sFlgAtrasoDev = 'A') And (sChave = 'P') And
                             (qryPatroCombo.FieldByName('FLGRUBATMANT').AsInteger=1)
                           Then sSql := sSql+''''+DecMesReferencia(sMesRefGr)+''','
                           Else sSql := sSql+''''+sMesRefGr+''',';

                          sSql:=sSql+IntToStr(iPatro)+',';
                          sSql:=sSql+IntToStr(iPatro)+',';
                          sSql:=sSql+'''***'',';
                          sSql:=sSql+IntToStr(iIdRubSalPart)+',';
                          sSql:=sSql+''''+sCodProvDescSalPart+''',';
                          sSql:=sSql+'NULL,';

                          // testa se o valor é negativo, se for grava o valor zero
                          if StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPART').AsString))) > 0 then
                             sSql:=sSql+ConvValor(qryTxt.FieldByName('VALORPART').AsString)+','
                          else
                             sSql:=sSql+'0'+',';

                          sSql:=sSql+'NULL,';
                          sSql:=sSql+'0,';
                          sSql:=sSql+'0,';
                          sSql:=sSql+'0,';
                          sSql:=sSql+'0,';
                          sSql:=sSql+sSeqRubrica+',';
                          sSql:=sSql+'0,';
                          sSql:=sSql+'1,';
                          sSql:=sSql+inttostr(Sistema.IdModulo)+',';
                          sSql:=sSql+inttostr(qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger)+',';
                          sSql:=sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';
                          sSql:=sSql+IntToStr(liIdLote)+')'; 

                          qryAux.SQL.Clear;
                          qryAux.SQL.Add(ssql);
                          try
                             qryAux.ExecSQL;
                          except

                             if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                rValor := 0
                             else
                                rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));
                             sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                             sUltProvento := sProvento;
                             sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);

                          end;

                          //tratado no processo 1
                          if copy(sMesRefGr,6,2) = '13' then
                          begin

                              qryAtualizaPartPrevPlan4.ParamByName('SalPart').AsFloat     := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPART').AsString)));
                              qryAtualizaPartPrevPlan4.ParamByName('idpessjur').AsInteger := iPatro;
                              qryAtualizaPartPrevPlan4.ParamByName('idpessoa').AsInteger  := qrybuscapessoa.FieldByName('IDPESSOA').AsInteger;
                              qryAtualizaPartPrevPlan4.ParamByName('idplanoprev').AsInteger  := qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger;
                              try
                                 qryAtualizaPartPrevPlan4.ExecSql;
                              except
                                 WriteLn(F,'Não atualizou o Salário Participação 13 do Arquivo Texto');
                                 mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Não gravou o Salário Participação 13 no Histórico...');

                                 if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                    rValor := 0
                                 else
                                    rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                                 GravaErrosCCP(5, iPatro, 'Erro ao atualizar salário décimo terceiro.',
                                           qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                           sMesRefGr, rValor,'',sMesCobGr, sLinha);

                              end;
                          end
                          else
                          begin
                              qryAtualizaPartPrevPlan.ParamByName('SalPart').AsFloat     := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPART').AsString)));
                              qryAtualizaPartPrevPlan.ParamByName('idpessjur').AsInteger := iPatro;
                              qryAtualizaPartPrevPlan.ParamByName('idpessoa').AsInteger  := qrybuscapessoa.FieldByName('IDPESSOA').AsInteger;
                              qryAtualizaPartPrevPlan.ParamByName('idplanoprev').AsInteger  := qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger;
                              try
                                 qryAtualizaPartPrevPlan.ExecSql;
                              except
                                 WriteLn(F,'Não atualizou o Salário Participação do Arquivo Texto');
                                 mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Não gravou o Salário Participação no Histórico...');

                                 if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                    rValor := 0
                                 else
                                    rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                                 GravaErrosCCP(4, iPatro, 'Erro ao atualizar salário de participação.',
                                               qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                               sMesRefGr, rValor,'',sMesCobGr, sLinha);

                              end;
                          end;

                          sMatriculaAtual := qryTXT.FieldByName('VALORCHAVE').AsString;

                      end;

                  end;

               end;
               //fim  do tratamento FLGCALCSALPART = 'I'



               if not (qrybuscapessoa.FieldByName('IDPESSOA').AsInteger = NULL) then
               begin

                   //  Tipo de Rubrica NÃO É GERAL
                   if (qryBuscaRubrica.FieldByName('FLGTPRUBRICA').AsString <> 'G') then
                   begin

                      qryProcuraClasseRubricas.Close;
                      if qryDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
                      begin
                          //VERIFICA SE A RUBRICA DE CONTRA-PARTIDA JÁ EXITE
                          //E ATUALIZA SÓ O VALOR

                          qryProcuraClasseRubricas.ParamByName('MES').AsString:= sMesRefGr;
                          qryProcuraClasseRubricas.ParamByName('CODPROVDESC').AsString:= copy(trim(sProvento),1,4);
                          qryProcuraClasseRubricas.ParamByName('CODPATRO').AsInteger  :=iPatro;
                          qryProcuraClasseRubricas.ParamByName('CODPLANO').AsInteger := qrybuscapessoa.FieldByName('IDPLANOPREV').AsInteger;
                          qryProcuraClasseRubricas.ParamByName('IDPESSOA').AsInteger := qrybuscapessoa.FieldByName('IDPESSOA').AsInteger;
                          qryProcuraClasseRubricas.Open;
                      end;

                      if not qryProcuraClasseRubricas.IsEmpty then
                      begin
                         if qryDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
                         begin


                            //verifica se a mesma rubrica já foi inserida
                            // no caso de duplicação no arquivo
                            qryProcExisteClasseRubricas.Close;
                            qryProcExisteClasseRubricas.ParamByName('MES').AsString:= sMesRefGr;
                            qryProcExisteClasseRubricas.ParamByName('CODPROVDESC').AsString:= trim(sProvento);
                            qryProcExisteClasseRubricas.ParamByName('CODPATRO').AsInteger  :=iPatro;
                            qryProcExisteClasseRubricas.ParamByName('CODPLANO').AsInteger := qrybuscapessoa.FieldByName('IDPLANOPREV').AsInteger;
                            qryProcExisteClasseRubricas.ParamByName('IDPESSOA').AsInteger := qrybuscapessoa.FieldByName('IDPESSOA').AsInteger;
                            qryProcExisteClasseRubricas.Open;

                            if not qryProcExisteClasseRubricas.IsEmpty then
                            begin

                               qryTxt.Next;
                               sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);

                               Continue;
                            end;


                            sSql:='UPDATE CLASSERUBRICAS SET VALORRECEBIDO = (VALORRECEBIDO + ';

                            if pos('P',sProvento) > 0 then
                            begin
                               sSql:=sSql+' ('+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)+' *-1)' ;
                            end
                            else
                            begin
                               sSql:=sSql+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString);
                            end;

                            sSql:=sSql+') WHERE (IDPESSOA = '+trim(inttostr(qrybuscapessoa.FieldByName('IDPESSOA').AsInteger));               

                            if (qryBuscaRubrica.FieldByName('CONTRIBSOBRE13').AsInteger = 0) then
                            begin
                               sSql:=sSql+') AND   (MESREFERENCIA = '''+sMesRefGr+'''';
                            end
                            else
                            begin
                               sSql:=sSql+') AND   (MESREFERENCIA = '''+sMesRef13+'''';
                            end;
                            sSql:=sSql+') AND   ( SUBSTR(CODPROVDESC,0,4) = '+copy(trim(sProvento),1,4);
                            sSql:=sSql+') AND   (CODPATRO     = '+IntToStr(iPatro)+')';
                            if not ExecutarQuery(qryAux,sSql) then begin
                               if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                  rValor := 0
                               else
                                  rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                               GravaErrosCCP(6, iPatro, 'Erro na atualização da contribuição.',
                                             qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                             sMesRefGr,rValor,'',sMesCobGr, sLinha);

                               sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                               sUltProvento := sProvento;
                               qryTxt.Next;

                               sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);

                               Continue;
                            end;
                         end
                         else
                         begin
                            WriteLn(F,'Codigo do Provento '+sProvento+' está Duplicado. Registro '+trim(qryTxt.FieldByName('VALORCHAVE').AsString));
                         end;
                      end
                      else
                      begin
                            //verificar se a rubrica é de empréstimo
                            //se for apenas alterar a tmpdesc
                            { Assistencial trata recebimento igual ao emprestimo }
                            if (sChave = 'E') or (sChave = 'A') then begin
                               qryaux.Close;
                               qryaux.SQL.text := ' SELECT COUNT(1) CONT, SUM(VALOR) VALOR  FROM TMPDESC '+
                                       ' WHERE IDPESSOA = '+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+' AND '+
                                       ' IDPESSJUR = '+IntToStr(iPatro)+' AND '+
                                       ' MESCOBRANCA   = '+ ''''+sMesCobGr+''''+' AND '+
                                       ' LTRIM(RTRIM(CODPROVDESC))   = '''+sProvento+''' ';
                               qryaux.open;

                               //se não há registro então insere
                               if (qryaux.isempty) or
                                  (qryaux.fieldbyname('CONT').AsInteger <= 0 ) then 
                               begin
                                  InsereTmpDescEmprestimo( iPatro ,
                                                           qrybuscapessoa.FieldByName('IDPLANOPREV').AsInteger,
                                                           qrybuscapessoa.FieldByName('IDPESSOA').AsInteger ,
                                                           0,//idrubrica
                                                           sProvento,
                                                           qryTxt.FieldByName('VALORCHAVE').AsString ,
                                                           0,
                                                           StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString))) ,
                                                           sMesRefGR,
                                                           sMesCobGr,
                                                           StrToDateTime(deDataRef.Text) ) ;
                               end
                               //se tem apenas um registro
                               else if qryaux.fieldbyname('CONT').AsInteger = 1 then
                               begin

                                  ssql := ' UPDATE TMPDESC SET VALORRECEBIDO = '+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)+' , '+
                                          ' SITENVIO = DECODE(VALOR,'+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)+','+''''+'2'+''''+','+''''+'1'+''''+') , '+
                                          ' DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY'')   '+
                                          ' WHERE IDPESSOA = '+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+' AND '+
                                          ' IDPESSJUR = '+IntToStr(iPatro)+' AND '+
                                          ' MESCOBRANCA   = '+ ''''+sMesCobGr+''''+' AND '+
                                          ' LTRIM(RTRIM(CODPROVDESC))   = '''+sProvento+''' ';

                                  If not ExecutarQuery(qryAux,sSql)then begin
                                     if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                        rValor := 0
                                     else
                                        rValor := qryTxt.FieldByName('VALORPROVE').AsFloat;

                                     GravaErrosCCP(8, iPatro, 'Rubrica não gravada. Possível duplicação.',
                                            qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                            sMesRefGr, rValor,'',sMesCobGr, sLinha);

                                     memo1.Lines.Add('Erro no recebimento da Rubrica '+sProvento+', Matrícula '+qryTxt.FieldByName('VALORCHAVE').AsString+' ');

                                     sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                                     sUltProvento := sProvento;
                                     qryTxt.Next;

                                     sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);

                                     Continue;
                                  end;
                                  qryLoop.close;
                                  qryLoop.SQL.Text := ' SELECT T.MESREFERENCIA, T.IDPROVENTO, T.VALOR FROM  TMPDESC T, PROVDESC P  '+
                                             ' WHERE T.IDPESSOA = '+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+' AND '+
                                             ' T.IDPESSJUR = '+IntToStr(iPatro)+' AND '+
                                             ' T.MESCOBRANCA   = '+ ''''+sMesCobGr+''''+' AND '+
                                             ' LTRIM(RTRIM(T.CODPROVDESC))   = '''+sProvento+''' AND '+
                                             ' P.IDPROVENTO = T.IDPROVENTO '+
                                             ' ORDER BY T.MESREFERENCIA, P.NUMPRIORIDADE ';
                                  qryLoop.Open;
                               end
                               // Se há mais de um registro mais o total do recebido bate com o
                               // somatório dos registros esperados
                               // atualizar o valorrecebido = valor
                               else if (qryaux.fieldbyname('CONT').AsInteger > 1) and
                                       (qryaux.fieldbyname('VALOR').AsFloat =
                                        StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString))) ) then
                               begin

                                  ssql := ' UPDATE TMPDESC SET VALORRECEBIDO = VALOR , '+
                                          ' SITENVIO = ''2'' , '+
                                          ' DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY'')   '+
                                          ' WHERE IDPESSOA = '+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+' AND '+
                                          ' IDPESSJUR = '+IntToStr(iPatro)+' AND '+
                                          ' MESCOBRANCA   = '+ ''''+sMesCobGr+''''+' AND '+
                                          ' LTRIM(RTRIM(CODPROVDESC))   = '''+sProvento+''' ';

                                  If not ExecutarQuery(qryAux,sSql)then begin
                                     if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                        rValor := 0
                                     else
                                        rValor := qryTxt.FieldByName('VALORPROVE').AsFloat;


                                     GravaErrosCCP(8, iPatro, 'Rubrica não gravada. Possível duplicação.',
                                            qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                            sMesRefGr, rValor,'',sMesCobGr, sLinha);

                                     memo1.Lines.Add('Erro no recebimento da Rubrica '+sProvento+', Matrícula '+qryTxt.FieldByName('VALORCHAVE').AsString+' ');

                                     sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                                     sUltProvento := sProvento;
                                     qryTxt.Next;

                                     sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);

                                     Continue;
                                  end;


                               end
                               // se há mais de um registro mais o total do recebido
                               //                 NÃO BATE COM O
                               //        somatório dos registros esparados
                               else
                               begin
                                  qryLoop.close;
                                  qryLoop.SQL.Text := ' SELECT T.MESREFERENCIA, T.IDPROVENTO, T.VALOR FROM  TMPDESC T, PROVDESC P  '+
                                             ' WHERE T.IDPESSOA = '+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+' AND '+
                                             ' T.IDPESSJUR = '+IntToStr(iPatro)+' AND '+
                                             ' T.MESCOBRANCA   = '+ ''''+sMesCobGr+''''+' AND '+
                                             ' LTRIM(RTRIM(T.CODPROVDESC))   = '''+sProvento+''' AND '+
                                             ' P.IDPROVENTO = T.IDPROVENTO '+
                                             ' ORDER BY T.MESREFERENCIA, P.NUMPRIORIDADE ';
                                  qryLoop.Open;

                                  //fazer controle dos pagamentos a maior
                                  if not qryLoop.isempty then
                                  iCont := qryLoop.recordcount;


                                  dValorSobra := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));
                                  while (not qryLoop.eof) and
                                        (dValorSobra >0 ) do
                                  begin

                                     dec(iCont);

                                     //se é o último registro e o pagamento é maior
                                     //do que o esperado, então atualizar com o recebido
                                     if (dValorSobra > qryLoop.fieldbyname('VALOR').AsFloat) and
                                        (iCont = 0) then
                                     begin
                                        sValorAtu := oranumero(FloatToStr(dValorSobra));
                                        dValorSobra := 0;
                                     end
                                     else
                                     begin

                                        if (qryLoop.fieldbyname('VALOR').AsFloat > dValorSobra)  then
                                        begin
                                           //se o esparado é maior que a sobra , então receber a sobra e parar
                                           sValorAtu := oranumero(FloatToStr(dValorSobra));
                                           dValorSobra := 0;
                                        end
                                        else
                                        begin
                                           //se ainda há sobra, atualizar com o esperado e cotinuar
                                           sValorAtu := oranumero(qryLoop.fieldbyname('VALOR').AsString);
                                           dValorSobra := dValorSobra -  qryLoop.fieldbyname('VALOR').AsFloat;
                                        end;
                                     end;

                                     ssql := ' UPDATE TMPDESC SET VALORRECEBIDO = '+sValorAtu+' , '+
                                             ' SITENVIO = DECODE(VALOR,'+sValorAtu+','+''''+'2'+''''+','+''''+'1'+''''+') , '+
                                             ' DATARECEBIMENTO =  TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY''),   '+
                                             ' FLGDESCFOLHA = ''P'' '+
                                             ' WHERE IDPESSOA = '+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+' AND '+
                                             ' IDPESSJUR = '+IntToStr(iPatro)+' AND '+
                                             ' MESREFERENCIA = '+ ''''+qryLoop.fieldbyname('MESREFERENCIA').AsString+'''' +' AND '+
                                             ' MESCOBRANCA   = '+ ''''+sMesCobGr+''''+' AND '+
                                             ' IDPROVENTO = '+qryLoop.fieldbyname('IDPROVENTO').AsString+' AND '+
                                             ' LTRIM(RTRIM(CODPROVDESC))   = '''+sProvento+''' AND '+
                                             ' VALOR = '+oranumero(qryLoop.fieldbyname('VALOR').AsString)+' '; //se acontercer do mesmo provento no mesmo mês

                                     If not ExecutarQuery(qryAux,sSql)then begin
                                        if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                           rValor := 0
                                        else
                                           rValor := qryTxt.FieldByName('VALORPROVE').AsFloat;

                                        GravaErrosCCP(8, iPatro, 'Rubrica não gravada. Possível duplicação.',
                                            qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                            sMesRefGr, rValor,'',sMesCobGr, sLinha);

                                        memo1.Lines.Add('Erro no recebimento da Rubrica '+sProvento+', Matrícula '+qryTxt.FieldByName('VALORCHAVE').AsString+' ');

                                        sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                                        sUltProvento := sProvento;
                                        qryTxt.Next;
                                        sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);
                                        Continue;
                                     end;



                                     qryLoop.Next;
                                  end; //while qryloop

                               end;//if qryaux

                               // Insere as rubricas na histrubsal
                               if qryDadosArquivo.FieldByName('FLGGRAVAHIST').AsInteger = 1 then
                               begin

                                  sSql:='INSERT INTO HISTRUBSAL(IDPESSOA,MESCOBRANCA,IDMOTIVO,MES,IDPESSJUR, IDPATRO, '+
                                        'REFERENCIA,IDRUBRICA,CODPROVDESC,CODMOEDA,VALORPROVENTO,IDREGRACALCULO,'+
                                        'FLGCOMPOESALPART,FLGCOMPOESALBENEF,FLGCOMPOEREMTOTAL,FLGIRRF,SEQRUBRICA,'+
                                        'VALORCOTAS,FLGSRB, IDMODULO,IDPLANOPREV, IDTITULAR, LOTEORIGINAL   ) VALUES ('; 
                                  sSql := sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';
                                  sSql := sSql+''''+sMesCobGr+''',';
                                  sSql := sSql+trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString)+',';
                                  sSql := sSql+''''+sMesRefGr+''',';
                                  sSql := sSql+IntToStr(iPatro)+',';
                                  sSql := sSql+IntToStr(iPatro)+',';
                                  sSql := sSql+'''***'',';
                                  sSql := sSql+qryLoop.fieldbyname('IDPROVENTO').AsString+',';
                                  sSql := sSql+''''+trim(sProvento)+''',';
                                  sSql := sSql+'NULL,';
                                  sSql := sSql+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)+',';
                                  sSql := sSql+'NULL,';
                                  sSql := sSql+sFlgSalPart+',';
                                  sSql := sSql+sFlgSalBenef+',';
                                  sSql := sSql+sFlgRemTotal+',';
                                  sSql := sSql+sFlgIrrf+',';
                                  sSql := sSql+sSeqRubrica+',';
                                  sSql := sSql+'0,';
                                  sSql := sSql+'1,';
                                  sSql := sSql+inttostr(Sistema.IdModulo)+',';
                                  sSql:=sSql+inttostr(qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger)+',';
                                  sSql:=sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';
                                  sSql:=sSql+IntToStr(liIdLote)+')';

                                  sSql := ExisteSalPart(qryLoop.fieldbyname('IDPROVENTO').AsInteger, sMesRefGr,  sMesCobGr, IntToStr(iPatro),
                                          qryLoop.fieldbyname('IDPROVENTO').AsString,
                                          trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString),
                                          '***', trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString),
                                          sSeqRubrica, ConvValor(qryTxt.FieldByName('VALORPROVE').AsString), sSql);

                                  If not ExecutarQuery(qryAux,sSql)
				    Then begin
                                         GravaErrosCCP(8, iPatro, 'Rubrica de Empréstimo não gravada. Possível duplicação.',
                                             qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                            sMesRefGr, rValor,'',sMesCobGr, sLinha);

                                         memo1.Lines.Add('Erro no recebimento da Rubrica de Empréstimo '+sProvento+', Matrícula '+qryTxt.FieldByName('VALORCHAVE').AsString+' ');
				    End;
                               End;

                            end
                            else
                            begin

                               //se insere todas as rubricas na histrubsal
                               if (Pos('G',sChave) > 0) Or
                                  (qryDadosArquivo.FieldByName('FLGGRAVAHIST').AsInteger = 1)
                                  or (trim(sCodProvDescSalPart) = sProvento )
                                  or (trim(sCodProvDescSal13) = sProvento )
                                  or (sFlgSalPart='1')
                                  or (sFlgSalBenef='1')
                                  or (sFlgRemTotal='1') then
                               begin

                                  sSql:='INSERT INTO HISTRUBSAL(IDPESSOA,MESCOBRANCA,IDMOTIVO,MES,IDPESSJUR, IDPATRO, '+
                                        'REFERENCIA,IDRUBRICA,CODPROVDESC,CODMOEDA,VALORPROVENTO,IDREGRACALCULO,'+
                                        'FLGCOMPOESALPART,FLGCOMPOESALBENEF,FLGCOMPOEREMTOTAL,FLGIRRF,SEQRUBRICA,'+
                                        'VALORCOTAS,FLGSRB, IDMODULO,IDPLANOPREV, IDTITULAR, LOTEORIGINAL) VALUES ('; 
                                  sSql := sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';
                                  sSql := sSql+''''+sMesCobGr+''',';
                                  sSql := sSql+trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString)+',';

                                  //tratamento mês 13
                                  if trim(sCodProvDescSal13) = sProvento then
                                     sSql:=sSql+''''+sMesRef13+''','
                                  else
                                     sSql:=sSql+''''+sMesRefGr+''',';


                                  sSql := sSql+IntToStr(iPatro)+',';
                                  sSql := sSql+IntToStr(iPatro)+',';
                                  sSql := sSql+'''***'',';


                                  //tratamento mês 13
                                  if sCodProvDescSal13 = sProvento then
                                  begin
                                     iTstRubrica := iIdRubSal13;
                                     sSql:=sSql+IntToStr(iIdRubSal13)+',';
                                     sSql:=sSql+''''+trim(sCodProvDescSal13)+''',';
                                  end
                                  else if sCodProvDescSalPart = sProvento then
                                  begin
                                     iTstRubrica := iIdRubSalPart;
                                     sSql:=sSql+IntToStr(iIdRubSalPart)+',';
                                     sSql:=sSql+''''+trim(sCodProvDescSalPart)+''',';
                                  end
                                  else
                                  begin
                                     iTstRubrica := iRubrica;
                                     sSql:=sSql+IntToStr(iRubrica)+',';
                                     sSql:=sSql+''''+trim(sProvento)+''',';
                                  end;

                                  sSql := sSql+'NULL,';
                                  sSql := sSql+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)+',';
                                  sSql := sSql+'NULL,';
                                  sSql := sSql+sFlgSalPart+',';
                                  sSql := sSql+sFlgSalBenef+',';
                                  sSql := sSql+sFlgRemTotal+',';
                                  sSql := sSql+sFlgIrrf+',';
                                  sSql := sSql+sSeqRubrica+',';
                                  sSql := sSql+'0,';
                                  sSql := sSql+'1,';
                                  sSql := sSql+inttostr(Sistema.IdModulo)+',';
                                  sSql:=sSql+inttostr(qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger)+',';
                                  sSql:=sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';
                                  sSql:=sSql+IntToStr(liIdLote)+')'; 

                                  if sCodProvDescSal13 <> sProvento
                                  Then sSql := ExisteSalPart(iTstRubrica, sMesRefGr,  sMesCobGr, IntToStr(iPatro), IntToStr(iIdRubSalPart),
                                              trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString),
                                              '***', trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString),
                                              sSeqRubrica, ConvValor(qryTxt.FieldByName('VALORPROVE').AsString), sSql);

                                  If not ExecutarQuery(qryAux,sSql) then begin
                                     if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                        rValor := 0
                                     else
                                        rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                                     GravaErrosCCP(8, iPatro, 'Rubrica não gravada. Possível duplicação.',
                                                   qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                                   sMesRefGr, rValor,'',sMesCobGr, sLinha);

                                     sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                                     sUltProvento := sProvento;
                                     sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);

                                  end;


                                  //tratamento de 13
                                  if (sCodProvDescSal13 = sProvento) and
                                     (qryDadosArquivo.FieldByName('FLGCALCSALPART').AsString = 'N') then
                                  begin

                                     qryAtualizaPartPrevPlan4.ParamByName('SalPart').AsFloat     := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPART').AsString)));
                                     qryAtualizaPartPrevPlan4.ParamByName('idpessjur').AsInteger := iPatro;
                                     qryAtualizaPartPrevPlan4.ParamByName('idpessoa').AsInteger  := qrybuscapessoa.FieldByName('IDPESSOA').AsInteger;
                                     qryAtualizaPartPrevPlan4.ParamByName('idplanoprev').AsInteger  := qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger;
                                     try
                                        qryAtualizaPartPrevPlan4.ExecSql;
                                     except
                                        WriteLn(F,'Não atualizou o Salário Participação 13 do Arquivo Texto');
                                        mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Não gravou o Salário Participação 13 no Histórico...');

                                        if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                           rValor := 0
                                        else
                                           rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                                        GravaErrosCCP(5, iPatro, 'Erro ao atualizar salário décimo terceiro.',
                                                  qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                                  sMesRefGr, rValor,'',sMesCobGr, sLinha);
                                     end;
                                  end
                                  else if (sCodProvDescSalPart = sProvento) and
                                     (qryDadosArquivo.FieldByName('FLGCALCSALPART').AsString = 'N') then
                                  begin
                                     qryAtualizaPartPrevPlan.ParamByName('SalPart').AsFloat     := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));
                                     qryAtualizaPartPrevPlan.ParamByName('idpessjur').AsInteger := iPatro;
                                     qryAtualizaPartPrevPlan.ParamByName('idpessoa').AsInteger  := qrybuscapessoa.FieldByName('IDPESSOA').AsInteger;
                                     qryAtualizaPartPrevPlan.ParamByName('idplanoprev').AsInteger  := qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger;
                                     try
                                        qryAtualizaPartPrevPlan.ExecSql;
                                     except
                                        WriteLn(F,'Não atualizou o Salário Participação do Arquivo Texto');
                                        mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Não gravou o Salário Participação no Histórico...');

                                        if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                           rValor := 0
                                        else
                                           rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                                        GravaErrosCCP(4, iPatro, 'Erro ao atualizar salário de participação.',
                                             qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                             sMesRefGr, rValor,'',sMesCobGr, sLinha);

                                     end;
                                  end;




                               end;



                               if iContribuicao > 0 then
                               begin

                                 qryLoop.close;
                                 qryLoop.SQL.Text := ' SELECT T.FLGATRASODEVOL, T.MESREFERENCIA, T.IDDESCONTO IDCONTRIBUICAO, T.IDPROVENTO, T.VALOR  '+
                                            ' FROM  TMPDESC T, PROVDESC P  '+
                                            ' WHERE T.IDPESSOA = '+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+' AND '+
                                            ' T.IDPESSJUR = '+IntToStr(iPatro)+' AND '+
                                            ' T.MESCOBRANCA   = '+ ''''+sMesCobGr+''''+' AND '+
                                            ' LTRIM(RTRIM(T.CODPROVDESC))   = '''+sProvento+''' AND '+
                                            ' P.IDPROVENTO = T.IDPROVENTO AND '+
                                            ' T.FLGDESCFOLHA = ''P'' '+
                                            ' ORDER BY T.MESREFERENCIA, P.NUMPRIORIDADE ';
                                 qryLoop.Open;

                                  inc(iSeqTabela);
                                  sSql:='INSERT INTO CLASSERUBRICAS(CODPATRO,IDPESSOA,CODPLANO,MESREFERENCIA,'+
                                        'MESCOBRANCA,DATAREFERENCIA,VALORRECEBIDO,CODPROVDESC,CHAVE,VALORCHAVE,'+
                                        'IDRUBRICA,IDCONTRIBUICAO,FLGATRASODEVOL,ORDEMCALCULO,SEQINTERFACE,FLG13) VALUES (';
                                  sSql:=sSql+IntToStr(iPatro)+',';
                                  sSql:=sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';           
                                  sSql:=sSql+trim(inttostr(qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger))+',';

                                  if (qryBuscaRubrica.FieldByName('CONTRIBSOBRE13').AsInteger = 0)
                                  then begin
                                     //CPrev - 27251 - Inicio
                                     If Copy(sMesRefGr, 6, 2) = '13' Then
                                     begin
                                       sSql:=sSql+''''+sMesRef13+''',';
                                     end
                                     Else
                                     Begin
                                       // Gleyber - 18/06/2003 - Início
                                       If (sFlgAtrasoDev = 'A') And (sChave = 'P') And
                                          (qryPatroCombo.FieldByName('FLGRUBATMANT').AsInteger=1)
                                       Then
                                         If qryLoop.IsEmpty                                                                             
                                         Then sSql := sSql+''''+DecMesReferencia(sMesRefGr)+''','
                                         Else sSql := sSql+''''+DecMesReferencia(qryLoop.fieldbyname('MESREFERENCIA').AsString)+''','   
                                       Else
                                         If qryLoop.IsEmpty                                                                             
                                         Then sSql := sSql+''''+sMesRefGr+''','
                                         Else sSql := sSql+''''+qryLoop.fieldbyname('MESREFERENCIA').AsString+''',';                  
                                      End;
                                      //CPrev - 27251 - Fim
                                  end
                                  else
                                  begin
                                     sSql:=sSql+''''+sMesRef13+''',';
                                  end;

                                  sSql:=sSql+''''+sMesCobGr+''',';
                                  sSql:=sSql+'TO_DATE('''+sDataRef+''',''DD/MM/YYYY''),';
                                  sSql:=sSql+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)+',';
                                  sSql:=sSql+''''+trim(sProvento)+''',';
                                  sSql:=sSql+''''+sChave+''',';
                                  sSql:=sSql+''''+trim(qryTxt.FieldByName('VALORCHAVE').AsString)+''',';
                                  sSql:=sSql+IntToStr(iRubrica)+',';
                                  sSql:=sSql+IntToStr(iContribuicao)+',';
                                  sSql:=sSql+''''+sFlgAtrasoDev+''',';
                                  sSql:=sSql+sOrdemCalculo+',';
                                  sSql:=sSql+IntToStr(iSeqTabela)+',';
                                  sSql:=sSql+INTTOSTR(qryBuscaRubrica.FieldByName('CONTRIBSOBRE13').AsInteger)+')';

                                  if not ExecutarQuery(qryAux,sSql) then begin
                                     if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                                        rValor := 0
                                     else
                                        rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                                     GravaErrosCCP(7, iPatro, 'Erro na gravação da Contribuição.',
                                                   qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                                   sMesRefGr, rValor,IntToStr(iContribuicao),sMesCobGr, sLinha);

                                     sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                                     sUltProvento := sProvento;
                                     qryTxt.Next;
                                     sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);
                                     Continue;
                                  end;
                               end;//if idcontribuicao > 0



                               //se a rubrica não foi identificada
                               //como salário e também não foi identificada
                               //como contribuição
                               if not (
                                 (Pos('G',sChave) > 0) Or
                                 (qryDadosArquivo.FieldByName('FLGGRAVAHIST').AsInteger = 1)
                                 or (trim(sCodProvDescSalPart) = sProvento )
                                 or (trim(sCodProvDescSal13) = sProvento )
                                 or (sFlgSalPart='1')
                                 or (sFlgSalBenef='1')
                                 or (sFlgRemTotal='1')
                                 or (iContribuicao > 0)) then
                               begin
                                  GravaErrosCCP(12, iPatro, 'Rubrica não identificada.',
                                           qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                           sMesRefGr, rValor,'',sMesCobGr, sLinha);
                                  mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Rubrica '+sProvento+' não identificada no sistema.');
                               end;


                            end;//fim testa se é rubrica de empréstimo

                      end;
                   end
                   else     // Tipo de Rubrica é GERAL !
                   begin


                        sSql:='INSERT INTO HISTRUBSAL(IDPESSOA,MESCOBRANCA,IDMOTIVO,MES,IDPESSJUR, IDPATRO,'+
                              'REFERENCIA,IDRUBRICA,CODPROVDESC,CODMOEDA,VALORPROVENTO,IDREGRACALCULO,'+
                              'FLGCOMPOESALPART,FLGCOMPOESALBENEF,FLGCOMPOEREMTOTAL,FLGIRRF,SEQRUBRICA,'+
                              'VALORCOTAS, FLGSRB, IDMODULO,IDPLANOPREV, IDTITULAR,LOTEORIGINAL) VALUES ('; 
                        sSql := sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';
                        sSql := sSql+''''+sMesCobGr+''',';
                        sSql := sSql+trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString)+',';

                        If (sFlgAtrasoDev = 'A') And (sChave = 'P') And
                           (qryPatroCombo.FieldByName('FLGRUBATMANT').AsInteger=1)
                         Then sSql := sSql+''''+DecMesReferencia(sMesRefGr)+''','
                         Else sSql := sSql+''''+sMesRefGr+''',';

                        sSql := sSql+IntToStr(iPatro)+',';
                        sSql := sSql+IntToStr(iPatro)+',';
                        sSql := sSql+'''***'',';
                        sSql := sSql+IntToStr(iRubrica)+',';
                        sSql := sSql+''''+trim(sProvento)+''',';
                        sSql := sSql+'NULL,';
                        sSql := sSql+ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)+',';
                        sSql := sSql+'NULL,';
                        sSql := sSql+sFlgSalPart+',';
                        sSql := sSql+sFlgSalBenef+',';
                        sSql := sSql+sFlgRemTotal+',';
                        sSql := sSql+sFlgIrrf+',';
                        sSql := sSql+sSeqRubrica+',';
                        sSql := sSql+'0,';
                        sSql := sSql+'1,';
                        sSql := sSql+inttostr(Sistema.IdModulo)+',';
                        sSql:=sSql+inttostr(qrybuscapessoa.fieldbyname('IDPLANOPREV').AsInteger)+',';
                        sSql:=sSql+trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString)+',';
                        sSql:=sSql+IntToStr(liIdLote)+')'; 

                        sSql := ExisteSalPart(iRubrica, sMesRefGr,  sMesCobGr, IntToStr(iPatro), IntToStr(iRubrica),
                                trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString),
                                '***', trim(qrybuscapessoa.FieldByName('IDPESSOA').AsString),
                                sSeqRubrica, ConvValor(qryTxt.FieldByName('VALORPROVE').AsString), sSql);

                        If not ExecutarQuery(qryAux,sSql) then begin
                           if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                              rValor := 0
                           else
                              rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                           GravaErrosCCP(8, iPatro, 'Rubrica não gravada. Possível duplicação.',
                                         qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                                         sMesRefGr, rValor,'',sMesCobGr, sLinha);

                           sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                           sUltProvento := sProvento;
                           sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);
                           Continue;
                        end;

                     end;
               end
               else  /// qryBuscaIdPessoa is Empty
               begin
                  if qryTxt.FieldByName('VALORCHAVE').AsString <> '' then
                  begin

                     mmDivergencias.Lines.Add(qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Participante não encontrado.'+
                                              ' Rubrica '+sProvento+' Valor '+ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString))+'.');

                     if qryTxt.FieldByName('VALORPROVE').AsString = '' then
                        rValor := 0
                     else
                        rValor := StrtoFloat(ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString)));

                     GravaErrosCCP(2, iPatro, 'Participante não encontrado no sistema.',
                     qryTxt.FieldByName('VALORCHAVE').AsString,
                     qryTxt.FieldByName('PROVENTO').AsString,
                     sMesRefGr,rValor,'',sMesCobGr, sLinha);

                  end;
               end;

               sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
               sUltProvento := sProvento;
               qryTxt.Next;
               sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);

               if icontadorcommit > NumMaxRegSemCommit then
               begin
                  if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
                  if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;
                  iContadorCommit := 0;
               end;

            except
               on E: Exception do
                Begin
                 WriteLn(F,'Retorno de erro do sistema: '+E.Message);
                 mmDivergencias.Lines.Add(TimeToStr(Time)+' '+qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Retorno de erro do sistema: '+E.Message);

                 GravaErrosCCP(5, iPatro, 'Retorno de erro do sistema: '+E.Message,
                           qryTxt.FieldByName('VALORCHAVE').AsString, sProvento,
                           sMesRefGr, rValor,'',sMesCobGr, sLinha);

                 sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                 sUltProvento := sProvento;
                 qryTxt.Next;

                 WriteLn(F,'Não Consegui processar a chave de número '+qryTxt.FieldByName('VALORCHAVE').AsString+' do Arquivo de Interface. Erro: '+sErro);
                 if sErro = 'Não Gravei o Arquivo'
                 then begin
                    WriteLn(F,sSql);
                 end;

                 continue;

                End;
            end;
         end else begin
            While (not qryTxt.EOF) and
                  (trim(qryTxt.FieldByName('VALORCHAVE').AsString) = '000000')
            do begin
                 sUltValorChave := qryTXT.FieldByName('ValorChave').AsString ;
                 sultprovento := sProvento;

                 WriteLn(F,'Registro não procesado. Matrícula: '+qryTxt.FieldByName('VALORCHAVE').AsString+'.');
                 qryTxt.Next;

                 sProvento:= trim(qryTxt.FieldByName('PROVENTO').AsString);
               end;
         end; // if = sprovento -
      end;
  end;   // clbEtapas
  //



  ///
  /// Se a opção de Atualização de Salário de Participação estiver marcada
  /// então executa esta etapa
  ///
  sCodRubSalRef := '';
  qrySalRef.close;
  qrySalRef.parambyname('IDPESSJUR').AsInteger := iPatro;
  QrySalRef.open;
  if not qrySalRef.isempty then sCodRubSalRef := qrySalRef.fieldbyname('CODPROVDESC').AsString;

  if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
  iContadorCommit := 0;

  if clbEtapas.Checked[1]
  then begin
      lbMensagens.Lines.Add(TimeToStr(Time)+' - Gravando o Salário de Participação');
      Application.ProcessMessages;

      AuxDec           := DecimalSeparator;
      DecimalSeparator := '.';

      if (qryDadosArquivo.FieldByName('FLGCALCSALPART').AsString = 'C') then begin
         //
         qryPlano.Close;
         qryPlano.Prepare;
         //
         for x:=1 to 4 do begin
            if x=4 then begin
               sErro:='Participação do 13o.';
               lbMensagens.Lines.Add(TimeToStr(Time)+' - Gravando o Salário Participação do 13o. salário');

               sSql:=' SELECT H.IDPESSOA,0 as PARTICIPANTE, H.IDPLANOPREV,                                      '+
                     '        SUM(DECODE(NVL(P.FLGDESCONTO,0),1,(H.VALORPROVENTO*-1),H.VALORPROVENTO)) AS VALOR '+
                     ' FROM   HISTRUBSAL H,PROVDESC P, RUBRICAXPESS RP                                          '+
                     ' WHERE  (H.MES = '''+sMesRef+''')                                                         '+
                     ' AND    (H.IDPESSJUR = '+IntToStr(iPatro)+')                                              ';

               if dblkPlanoPrev.text <> ''
               then sSql:=  sSql+' AND (H.IDPLANOPREV = '+IntToStr(iPlano)+')                                   '
               else sSql:=  sSql+' AND (H.IDPLANOPREV = H.IDPLANOPREV)                                          ';

               sSql:=  sSql+
                     ' AND    (P.IDPROVENTO = H.IDRUBRICA)                                                      '+
                     ' AND    (NVL(P.FLGDECIMOTERCEIRO,0) = 1)                                                  '+
                     ' AND    (LOTEORIGINAL               = '+IntToStr(liIdLote)+')                             '+
                     ' GROUP BY H.IDPESSOA, H.IDPLANOPREV                                                       ';
               iRubrica  := iIdRubSal13;
               sProvento := sCodProvDescSal13;
            end else begin
               if x = 1
               then begin
                  sErro:='Participação';
                  sSql:= ' SELECT H.IDPESSOA,NVL(PPP.IDPESSOA,0) AS PARTICIPANTE, H.IDPLANOPREV,                     '+
                         '        SUM(DECODE(NVL(P.FLGDESCONTO,0),1,(H.VALORPROVENTO*-1),H.VALORPROVENTO)) AS VALOR  '+
                         ' FROM   HISTRUBSAL H, PARTPREVPLAN PPP, PROVDESC P                                         '+
                         ' WHERE  (H.MES = '''+sMesRef+''')                                                           '+
                         ' AND    (H.IDPESSJUR = '+IntToStr(iPatro)+')                                                ';

                  if dblkPlanoPrev.text <> ''
                  then sSql:=  sSql+' AND (H.IDPLANOPREV = '+IntToStr(iPlano)+')                                      '
                  else sSql:=  sSql+' AND (H.IDPLANOPREV = H.IDPLANOPREV)                                             ';

                  sSql:=  sSql+
                         ' AND (H.FLGCOMPOESALPART = 1)                                                               '+
                         ' AND (PPP.IDPESSJUR(+) = H.IDPESSJUR)                                                       '+
                         ' AND (PPP.IDPESSOA(+) = H.IDPESSOA)                                                         '+
                         ' AND (PPP.IDPLANOPREV = H.IDPLANOPREV)                                                      '+
                         ' AND (P.IDPROVENTO = H.IDRUBRICA)                                                           '+
                         ' AND (NVL(P.FLGDECIMOTERCEIRO,0) = 0)                                                       '+
                         ' AND (LOTEORIGINAL               = '+IntToStr(liIdLote)+')                                  '+
                         ' GROUP BY H.IDPESSOA,NVL(PPP.IDPESSOA,0), H.IDPLANOPREV                                     ';
                  iRubrica :=iIdRubSalPart;
                  sProvento:=sCodProvDescSalPart;
               end else begin
                  if x = 2
                  then begin
                     sErro:='Benefício';
                     lbMensagens.Lines.Add(TimeToStr(Time)+' - Gravando o Salário Benefício                           ');
                     sSql:=' SELECT H.IDPESSOA,0 PARTICIPANTE,  H.IDPLANOPREV ,                                       '+
                           '        SUM(DECODE(NVL(P.FLGDESCONTO,0),1,(H.VALORPROVENTO*-1),H.VALORPROVENTO)) AS VALOR '+
                           ' FROM   HISTRUBSAL H,PROVDESC P                                                           '+
                           ' WHERE  (H.MES = '''+sMesRef+''')                                                         '+
                           ' AND    (H.IDPESSJUR = '+IntToStr(iPatro)+')                                              ';

                     if dblkPlanoPrev.text <> ''
                     then sSql:=  sSql+' AND (H.IDPLANOPREV = '+IntToStr(iPlano)+')                                   '
                     else sSql:=  sSql+' AND (H.IDPLANOPREV = H.IDPLANOPREV)                                          ';

                     sSql:=  sSql+
                           ' AND (H.FLGCOMPOESALBENEF = 1) AND (P.IDPROVENTO = H.IDRUBRICA)                           '+
                           ' AND (LOTEORIGINAL               = '+IntToStr(liIdLote)+')                                  '+
                           ' GROUP BY H.IDPESSOA, H.IDPLANOPREV                                                       ';
                     iRubrica :=iIdRubSalBenef;
                     sProvento:=sCodProvDescSalBenef;
                  end else begin
                     sErro:='Remuneração Total';
                     lbMensagens.Lines.Add(TimeToStr(Time)+' - Gravando o Salário Remuneração Total');
                     sSql:=' SELECT H.IDPESSOA,NVL(0,0) as PARTICIPANTE, H.IDPLANOPREV,                               '+
                           '        SUM(DECODE(NVL(P.FLGDESCONTO,0),1,(H.VALORPROVENTO*-1),H.VALORPROVENTO)) AS VALOR '+
                           ' FROM   HISTRUBSAL H,PROVDESC P                                                           '+
                           ' WHERE  (H.MES = '''+sMesRef+''')                                                         '+
                           ' AND    (H.IDPESSJUR = '+IntToStr(iPatro)+')                                              ';

                     if dblkPlanoPrev.text <> ''
                     then sSql:=  sSql+' AND (H.IDPLANOPREV = '+IntToStr(iPlano)+')                                   '
                     else sSql:=  sSql+' AND (H.IDPLANOPREV = H.IDPLANOPREV)                                          ';

                     sSql:=  sSql+
                           ' AND (H.FLGCOMPOEREMTOTAL = 1) AND (P.IDPROVENTO = H.IDRUBRICA)                           '+
                           ' GROUP BY H.IDPESSOA,NVL(0,0), H.IDPLANOPREV                                              ';
                     iRubrica :=iIdRubRemTotal;
                     sProvento:=sCodProvDescRemTotal;
                  end;
               end;
            end;
            lbMensagens.Lines.Add(TimeToStr(Time)+' - Calculando Salário '+sErro);
            Application.ProcessMessages;
            FazQuery(qrySalPart,sSql);
            try
               if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;
               qrySalPart.First;
               qryPlanoXMoeda.Close;
               qryPlanoXMoeda.ParamByName('MESREF').AsString   := sMesCot;
               qryPlanoXMoeda.Open;
               While not qrySalPart.EOF do begin
                  if x = 1 then begin
                     qryBuscaPlanoPess.Close;
                     qryBuscaPlanoPess.ParamByName('IDPESSOA').AsInteger  :=qrySalPart.FieldByName('IDPESSOA').AsInteger;
                     qryBuscaPlanoPess.ParamByName('CODPATRO').AsInteger  :=iPatro;
                     qryBuscaPlanoPess.Open;
                     //
                     if not (qryPlanoXMoeda.Locate('IdPlanoPrev',qryBuscaPlanoPess.FieldByName('IDPLANOPREV').AsInteger,[loCaseInsensitive]))
                     then begin
                        sValorProve      :=FloatToStr(qrySalPart.FieldByName('VALOR').AsFloat);
                     end
                     else begin
                        if qrySalPart.FieldByName('VALOR').AsFloat > qryPlanoXMoeda.FieldByName('COTVALOR').AsFloat then begin
                           sValorProve      :=FloatToStr(qryPlanoXMoeda.FieldByName('COTVALOR').AsFloat)
                        end else begin
                           sValorProve      :=FloatToStr(qrySalPart.FieldByName('VALOR').AsFloat);
                        end;
                     end;
                     /// O Salário de Participação NÃO pode ser zero
                     /// Se o cálculo do salário retornar zero então deve ser
                     /// gravado o salário calculado para o mês anterior
                     if strtofloat(sValorProve) <= 0.00
                     then begin
                        qryBuscaSalPart.Close;
                        qryBuscaSalPart.ParamByName('IDPESSOA').AsInteger := qrySalPart.FieldByName('IDPESSOA').AsInteger;
                        qryBuscaSalPart.Open;
                        if qryBuscaSalPart.IsEmpty
                        then WriteLn(F,'Não encontrou o Salário de Participação para o mês anterior - IdPessoa: '+trim(qrySalPart.FieldByName('IDPESSOA').AsString)+'.')
                        else sValorProve := FloatToStr(qryBuscaSalPart.fieldByName('SALPARTICIPMESANT').AsFloat);
                     end
                  end
                  else begin
                     sValorProve      :=FloatToStr(qrySalPart.FieldByName('VALOR').AsFloat);
                  end;

                  if  (x <> 2) and (iRubrica > 0)
                  then begin
                     // Verifica se já existe salário de participação no mês na HISTRUBSAL
                     sSql := 'SELECT 1 FROM HISTRUBSAL '+
                             'WHERE IDPESSOA = '+trim(qrySalPart.FieldByName('IDPESSOA').AsString)+
                             '  AND IDPESSJUR = '+IntToStr(iPatro)+
                             '  AND IDRUBRICA = '+IntToStr(iRubrica)+
                             '  AND IDMOTIVO = '+trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString)+
                             '  AND REFERENCIA = '+QuotedStr('***')+
                             '  AND SEQRUBRICA = '+sSeqRubrica+
                             '  AND MESCOBRANCA = '+QuotedStr(sMesCobGr);

                     qryAux.SQL.Clear;
                     qryAux.SQL.Add(sSql);
                     qryAux.Open;

                     If qryAux.RecordCount = 0
                      Then Begin
                      // Não existe ==> Insere um novo
                          sSql := 'INSERT INTO HISTRUBSAL(IDPESSOA,MESCOBRANCA,IDMOTIVO,MES,IDPESSJUR, IDPATRO, '+
                                  'REFERENCIA,IDRUBRICA,CODPROVDESC,CODMOEDA,VALORPROVENTO,IDREGRACALCULO,' +
                                  'FLGCOMPOESALPART,FLGCOMPOESALBENEF,FLGCOMPOEREMTOTAL,FLGIRRF,SEQRUBRICA,'+
                                  'VALORCOTAS,FLGSRB, IDMODULO, IDPLANOPREV, IDTITULAR,LOTEORIGINAL) VALUES ('; 

                          sSql := sSql+trim(qrySalPart.FieldByName('IDPESSOA').AsString)+',';
                          sSql := sSql+''''+sMesCobGr+''',';
                          sSql := sSql+trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString)+',';
                          if x = 4 then
                             sSql := sSql+''''+sMesRef13+''','
                          else
                             sSql := sSql+''''+sMesRef+''',';
                          sSql := sSql+IntToStr(iPatro)+',';
                          sSql := sSql+IntToStr(iPatro)+',';
                          sSql := sSql+'''***'',';
                          sSql := sSql+IntToStr(iRubrica)+',';
                          sSql := sSql+''''+sProvento+''',';
                          sSql := sSql+'NULL,';
                          sSql := sSql+sValorProve+',';
                          sSql := sSql+'NULL,';
                          sSql := sSql+'0,';
                          sSql := sSql+'0,';
                          sSql := sSql+'0,';
                          sSql := sSql+'0,';
                          sSql := sSql+sSeqRubrica+',';
                          sSql := sSql+'0,';
                          if qrySalPart.FieldByName('PARTICIPANTE').AsInteger = 0 then
                             sSql:=sSql+'0,'
                          else
                             sSql := sSql+'1,';
                          sSql := sSql + inttostr(Sistema.IdModulo)+',';
                          sSql:=sSql+inttostr(qrySalPart.FieldByName('IDPLANOPREV').AsInteger)+',';
                          sSql:=sSql+trim(qrySalPart.FieldByName('IDPESSOA').AsString)+',';
                          sSql:=sSql+IntToStr(liIdLote)+')'; 
                      End
                      Else Begin
                      // Existe ==> Altera o existente
                          sSql := 'UPDATE HISTRUBSAL SET '+
                                  ' IDPATRO = '+IntToStr(iPatro)+','+
                                  ' CODPROVDESC = '+QuotedStr(sProvento)+','+
                                  ' CODMOEDA = NULL,'+
                                  ' VALORPROVENTO = '+sValorProve+','+
                                  ' IDREGRACALCULO = NULL,'+
                                  ' FLGCOMPOESALPART = 0,'+
                                  ' FLGCOMPOESALBENEF = 0,'+
                                  ' FLGCOMPOEREMTOTAL = 0,'+
                                  ' FLGIRRF = 0,'+
                                  ' VALORCOTAS = 0,';
                          If qrySalPart.FieldByName('PARTICIPANTE').AsInteger = 0
                            Then sSql:=sSql+' FLGSRB = 0,'
                            Else sSql:=sSql+' FLGSRB = 1,';

                          sSql := sSql + ' IDMODULO = '+inttostr(Sistema.IdModulo)+',' +
                                         ' IDPLANOPREV = '+inttostr(qrySalPart.FieldByName('IDPLANOPREV').AsInteger)+','+
                                         ' IDTITULAR = '+trim(qrySalPart.FieldByName('IDPESSOA').AsString)+','+
                                         ' LOTEORIGINAL = '+IntToStr(liIdLote)+' '+
                                         'WHERE IDPESSOA = '+trim(qrySalPart.FieldByName('IDPESSOA').AsString)+
                                         '  AND IDPESSJUR = '+IntToStr(iPatro)+
                                         '  AND IDRUBRICA = '+IntToStr(iRubrica)+
                                         '  AND IDMOTIVO = '+trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString)+
                                         '  AND REFERENCIA = '+QuotedStr('***')+
                                         '  AND SEQRUBRICA = '+sSeqRubrica+
                                         '  AND MESCOBRANCA = '+QuotedStr(sMesCobGr);
                          if x = 4
                            Then sSql:= sSql+'  AND MES = '+QuotedStr(sMesRef13)
                            Else sSql:= sSql+'  AND MES = '+QuotedStr(sMesRef);
                      End;

                     If not ExecutarQuery(qryAux,sSql) then begin
                        WriteLn(F,'Não gravou o Cálculo do Salário Participação do Participante '+trim(qrySalPart.FieldByName('IDPESSOA').AsString)+' no Histórico.');
                     end;

                  end;

                  if x = 1 then begin // atualiza o salário participação
                     if strtofloat(sValorProve) > 0.00 then begin
                        qryAtualizaPartPrevPlan.ParamByName('SalPart').AsFloat := StrtoFloat(sValorProve);
                        qryAtualizaPartPrevPlan.ParamByName('idpessjur').AsInteger := iPatro;
                        qryAtualizaPartPrevPlan.ParamByName('idpessoa').AsInteger := qrySalPart.FieldByName('IDPESSOA').AsInteger;
                        qryAtualizaPartPrevPlan.ParamByName('idplanoprev').AsInteger := qrySalPart.FieldByName('IDPLANOPREV').AsInteger;
                        try
                        qryAtualizaPartPrevPlan.ExecSql;
                        except
                          lbMensagens.Lines.Add(TimeToStr(Time)+' - Erro atualização do Salário Participação - Processo abortado...');
                           memo1.Lines.Add('Erro atualização do Salário Participação - ... ');
                           CloseFile(F);
                           if chkbad.checked then    CloseFile(bad);
                           RollBackTransacao;
                           exit;
                           WriteLn(F,'Não atualizou o Salário Participação '+sErro);
                        end;
                     end;
                  end;

		  if x=4 then begin // atualiza o salário participação do 13o. salário

                     if strtofloat(sValorProve) > 0.00 then begin

                        qryAtualizaPartPrevPlan4.ParamByName('SalPart').AsFloat     := StrtoFloat(sValorProve);
                        qryAtualizaPartPrevPlan4.ParamByName('idpessjur').AsInteger := iPatro;
                        qryAtualizaPartPrevPlan4.ParamByName('idpessoa').AsInteger  := qrySalPart.FieldByName('IDPESSOA').AsInteger;
                        qryAtualizaPartPrevPlan4.ParamByName('idplanoprev').AsInteger := qrySalPart.FieldByName('IDPLANOPREV').AsInteger;
                        try
                           qryAtualizaPartPrevPlan4.ExecSql;
                        except
                           lbMensagens.Lines.Add(TimeToStr(Time)+' - Erro atualização do Salário Participação do Abono - Processo abortado...');
                           memo1.Lines.Add('Erro atualização da Salário Participação do Abono');
                           CloseFile(F);
                           if chkbad.checked then      CloseFile(bad);
                           RollBackTransacao;
                           exit;
                           WriteLn(F,'Não atualizou o Salário Participação do Abono '+sErro);
                        end;
                     end;
                  end;
                  qrySalPart.Next;
               end;
               CommitTransacao;
            except

               if MsgDlg('Há problemas na Gravação do Calculo do Salário Participação, continua sem consertar ?','Confirmação', 
                  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
               begin
                  if MsgDlg('Poderá ser calculado o salário participação com erro, quer realmente continuar?','Confirmação', 
                     mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
                  begin
                    lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
                    CloseFile(F);
                    if chkbad.checked then     CloseFile(bad);
                    RollBackTransacao;
                    exit;
                  end
                  else
                  begin
                     CommitTransacao;
                  end;
               end
               else
               begin
                 lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
                 CloseFile(F);
                 if chkbad.checked then        CloseFile(bad);
                 RollBackTransacao;
                 exit;
               end;
               WriteLn(F,'Não gravou o Cálculo do Salário Participação '+sErro);
            end;
         end;
      end;
      //
      qryBuscaPlanoPess.Close;
      qryBuscaPlanoPess.UnPrepare;
  end;

  TwCons.Etapa.Pos     := 3;
  iContadorCommit := 0;
  if clbEtapas.Checked[2] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Calculando as Contribuições dos Participantes');
     Application.ProcessMessages;

     if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;
     ImportaRubricas;
     CommitTransacao;
  end;


  iContadorCommit := 0;
  if clbEtapas.Checked[3] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Inserindo as Contribuições Não Recebidas');
     Application.ProcessMessages;
  end;

  //
  iContadorCommit := 0;
  if clbEtapas.Checked[4] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Inserindo as Contribuições Não Associadas dos Participantes descontadas na patrocinadora');
     Application.ProcessMessages;
  end;
  //
  DecimalSeparator := '.';
  //

  //
  TwCons.Etapa.Pos       := 4;
  iContadorCommit := 0;
  if clbEtapas.Checked[0] then begin

      //apaga os somatórios de salários
      //deve ser processado toda vez por que pode mudar
      //dependendo dos passos que já fora processados
      // se forem processados separadamente
      sSql := ' DELETE HSTRUBRICAXPESS  WHERE ' +
              ' MESREFERENCIA = '''+sMesRef+''' AND  '+
              ' IDPESSOA =  '''+IntToStr(iPatro)+'''  ';
              if dblkPlanoPrev.text <> '' then
              sSql := sSql+' AND IDPLANOPREV =  '''+IntToStr(iPlano)+''' ';

      try
         ExecutarQuery(qryAux,sSql)
      except
         WriteLn(F,'Não Apagou o Cálculo Total de Salário Participação por plano no Histórico.');
         raise;
      end;



      lbMensagens.Lines.Add(TimeToStr(Time)+' - Calculando o Valor Total do Salário Participação');
      Application.ProcessMessages;
      sSql:= ' SELECT SUM(H.VALORPROVENTO) VALORTOTPART , PP.IDPLANOPREV  '+
             ' FROM   PARTPREVPLAN PP, HISTRUBSAL H, PATRO PT             '+
             ' WHERE  H.IDPESSJUR   = '''+IntToStr(iPatro)+'''            '+
             ' AND    H.MESCOBRANCA = '''+sMesRef+'''                     '+
             ' AND    H.IDPESSJUR   = PT.IDPESSOA                         '+
             ' AND    H.IDRUBRICA   = PT.IDRUBSALPARTICIP                 '+
             ' AND    PP.IDPESSJUR  = H.IDPESSJUR                         '+
             ' AND    PP.IDPESSOA   = H.IDPESSOA                          ';

      if dblkPlanoPrev.text <> ''
      then sSql := sSql+' AND PP.IDPLANOPREV =  '''+IntToStr(iPlano)+'''  ';

      sSql := sSql+
             ' AND EXISTS ( SELECT 1 FROM TMPDESC                             '+
             '              WHERE  MESCOBRANCA = '''+sMesRef+'''              '+
             '              AND    IDPESSJUR   = PP.IDPESSJUR       '+
             '              AND    IDPLANOPREV = PP.IDPLANOPREV     '+
             '              AND    IDPESSOA    = PP.IDPESSOA        '+
             '              AND    SEQPROPOSTA = PP.SEQPROPOSTA     '+ 
             '              AND    NVL(SITENVIO,0) > 0 ) GROUP BY PP.IDPLANOPREV ';


      try
        FazQuery(qrySalPart,sSql);
      except
        Memo1.Lines.Add('Erro no acumulado de salários participação');
      end;

      qrySalPart.First;
      while not qrySalPart.eof do
      begin
         sSql := 'INSERT INTO HSTRUBRICAXPESS (' +
                 'MESREFERENCIA,IDRUBRICA,VALORACUMULADO,IDPESSOA,IDPLANOPREV) ' +
                 'VALUES ( ' + '''' + sMesRef + '''' + ',' + IntToStr(iIdRubSalPart) +
                 ' ,' + floattostr(qrySalPart.FieldByName('VALORTOTPART').AsFloat) + ',' + IntToStr(iPatro) + ' '+
                 ' ,' +IntToStr(qrySalPart.fieldbyname('IDPLANOPREV').AsInteger) + ')';

         try
            ExecutarQuery(qryAux,sSql)
         except
            WriteLn(F,'Não gravou o Cálculo Total de Salário Participação por plano no Histórico.');
            raise;
         end;
         qrySalPart.Next;
      end;

      if bCobra13
      then begin
         lbMensagens.Lines.Add(TimeToStr(Time)+' - Calculando o Valor Total do Salário Participação do 13o. ');
         Application.ProcessMessages;
         //
         sSql:= ' SELECT SUM(SALPARTICIPACAO) VALORTOTPART, IDPLANOPREV   '+
                ' FROM   PARTPREVPLAN                                     '+
                ' WHERE  IDPESSJUR = '''+IntToStr(iPatro)+'''             ';

         if dblkPlanoPrev.text <> ''
         then sSql := sSql+' AND IDPLANOPREV =  '''+IntToStr(iPlano)+'''  ';

         sSql := sSql+
                ' AND EXISTS ( SELECT 1 FROM TMPDESC                      '+
                '              WHERE  MESCOBRANCA = '''+copy(sMesRef,1,5) + '13' +'''  '+
                '              AND    IDPESSJUR   = PARTPREVPLAN.IDPESSJUR       '+
                '              AND    IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV     '+
                '              AND    IDPESSOA    = PARTPREVPLAN.IDPESSOA        '+
                '              AND    SEQPROPOSTA = PARTPREVPLAN.SEQPROPOSTA     '+ 
                '              AND    NVL(SITENVIO,0) > 0 ) GROUP BY IDPLANOPREV ';

         try
           FazQuery(qrySalPart,sSql);
         except
           Memo1.Lines.Add('Erro no acumulado de salários participação do 13o.');
         end;

         qrySalPart.First;
         while not qrySalPart.eof do
         begin
            sSql := 'INSERT INTO HSTRUBRICAXPESS (' +
                    'MESREFERENCIA,IDRUBRICA,VALORACUMULADO,IDPESSOA,IDPLANOPREV) ' +
                    'VALUES ( ' + '''' + sMesRef + '''' + ',' + IntToStr(iIdRubSal13) +
                    ' ,' + floattostr(qrySalPart.FieldByName('VALORTOTPART').AsFloat) + ',' + IntToStr(iPatro) + ' '+
                    ' ,' +IntToStr(qrySalPart.fieldbyname('IDPLANOPREV').AsInteger) + ')';

            try
               ExecutarQuery(qryAux,sSql)
            except
               WriteLn(F,'Não gravou o Cálculo Total de Salário Participação do 13o. por plano no Histórico.');
               raise;
            end;
            qrySalPart.Next;
         end;
      end;
  end; //if [0]

  if clbEtapas.Checked[2] then
  begin
     frmaguarde.Mostra('Montando Demonstrativo de divergências');
     //demonstrativo de rubricas que entraram na CLASSERUBRICAS mas
     //não foram incluídas na TMPDESC por algum problema, como:
     //-as contribuições recebidas não estarem associadas ao participante
     //-código de rubricas diversas não esperadas pela tmpdesc
     qryaux.Close;
     qryaux.sql.text := ' SELECT C.VALORCHAVE MATRICULA, C.IDPESSOA,                   '+
                        '        C.IDCONTRIBUICAO , C.IDRUBRICA , C.CODPROVDESC,       '+
                        '        C.VALORRECEBIDO, P.NOME,                              '+
                        '        C.CODPATRO, C.CODPLANO                                '+ 
                        ' FROM   PESSOA P, CLASSERUBRICAS C                            '+
                        ' WHERE  C.IDPESSOA = P.IDPESSOA                               '+
                        ' AND    C.CODPATRO = '+IntToStr(iPatro)                        +
                        ' AND    C.MESCOBRANCA = '''+sMesCob+'''                       '+
                        ' AND    C.IDPESSOA = C.IDPESSOA                               '+
                        ' AND    NOT EXISTS (SELECT 1 FROM TMPDESC T                   '+
                        '                    WHERE  T.IDPESSJUR     = C.CODPATRO       '+
                        '                    AND    T.IDPLANOPREV   = C.CODPLANO       '+
                        '                    AND    T.IDPESSOA      = C.IDPESSOA       '+
                        '                    AND    T.IDDESCONTO    = C.IDCONTRIBUICAO '+
                        '                    AND    T.MESCOBRANCA   = C.MESCOBRANCA    '+
                        '                    AND    T.MESREFERENCIA = C.MESREFERENCIA  '+
                        '                    AND    T.IDPROVENTO    = C.IDRUBRICA      '+
                        '                    AND    T.VALORRECEBIDO = C.VALORRECEBIDO) '+
                        'ORDER BY C.CODPROVDESC, C.VALORCHAVE                          ';
     qryaux.Open;

     frmaguarde.Max:= qryaux.RecordCount;
     frmaguarde.Pos := 1;

     if not qryaux.eof then
     begin
        mmDivergencias.Lines.Add('');
        mmDivergencias.Lines.Add('');
        mmDivergencias.Lines.Add('----Demonstrativo de Rubricas não Recebidas---');
        mmDivergencias.Lines.Add('MATRÍCULA       NOME                                                RUBRICA           VALOR');
        mmDivergencias.Lines.Add('-------------------------------------------------------------------------------------------');


     end;


     sCodRub := trim(qryaux.fieldbyname('CODPROVDESC').AsString);
     dTotalRub :=0;
     while not qryaux.eof do
     begin


        if qryaux.fieldbyname('VALORRECEBIDO').AsString = '' then
           rValor := 0
        else
           rValor := qryaux.fieldbyname('VALORRECEBIDO').AsFloat;

        If qryAux.FieldByName('NOME').IsNull
         Then GravaErrosCCP(9, iPatro, 'Participante não cadastrado.',
                            qryaux.fieldbyname('MATRICULA').AsString,
                            qryaux.fieldbyname('CODPROVDESC').AsString,
                            sMesRefGr, rValor,'',sMesCobGr,'')
         Else
          With qryAux1 do
           Begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT 1 FROM CONTRIBPREVPARTP');
            SQL.Add('WHERE IDPESSJUR      = '+qryaux.fieldbyname('CODPATRO').AsString);
            SQL.Add('  AND IDPLANOPREV    = '+qryaux.fieldbyname('CODPLANO').AsString);
            SQL.Add('  AND IDPESSOA       = '+qryaux.fieldbyname('IDPESSOA').AsString);
            SQL.Add('  AND SEQPROPOSTA    = 1');
            SQL.Add('  AND IDCONTRIBUICAO = '+qryaux.fieldbyname('IDCONTRIBUICAO').AsString);
            Open;

            If IsEmpty
             Then GravaErrosCCP(9, iPatro, 'Contribuição não associada ao participante.',
                                qryaux.fieldbyname('MATRICULA').AsString,
                                qryaux.fieldbyname('CODPROVDESC').AsString,
                                sMesRefGr, rValor,'',sMesCobGr,'')
             Else GravaErrosCCP(10, iPatro, 'Contribuição não lida. Possível duplicação no arquivo.',
                                qryaux.fieldbyname('MATRICULA').AsString,
                                qryaux.fieldbyname('CODPROVDESC').AsString,
                                sMesRefGr, rValor,qryaux.fieldbyname('IDCONTRIBUICAO').AsString,sMesCobGr,'');
           End;

        mmDivergencias.Lines.Add(completastring(qryaux.fieldbyname('MATRICULA').AsString,' ',15,True)+' '+
                                 completastring(qryaux.fieldbyname('NOME').AsString,' ',50,True)+' '+
                                 completastring(qryaux.fieldbyname('CODPROVDESC').AsString,' ',7,False)+' '+
                                 completastring(qryaux.fieldbyname('VALORRECEBIDO').AsString,' ',15,False));

        frmaguarde.Pos :=   frmaguarde.Pos + 1;
        dTotalRub := dTotalRub + qryaux.fieldbyname('VALORRECEBIDO').AsFloat;

        qryaux.next;

        if qryaux.eof then
        begin
           mmDivergencias.Lines.Add('                                                                SUBTOTAL:  '+completastring(FloatToStr(dTotalRub),' ',15,False));
           mmDivergencias.Lines.Add('');
           dTotalRub :=0;
           sCodRub := qryaux.fieldbyname('CODPROVDESC').AsString;
        end
        else if (trim(qryaux.fieldbyname('CODPROVDESC').AsString) <> sCodRub) then
        begin
           mmDivergencias.Lines.Add('                                                                SUBTOTAL:  '+completastring(FloatToStr(dTotalRub),' ',15,False));
           mmDivergencias.Lines.Add('');
           dTotalRub :=0;
           sCodRub := qryaux.fieldbyname('CODPROVDESC').AsString;
        end;
     end;//while qryaux

     frmaguarde.Apaga;

     //fim do demonmstrativo de divergências
  end; // if clbEtapas.Checked[2]


  //
  TwCons.Etapa.Pos       := 5;
  lbMensagens.Lines.Add(TimeToStr(Time)+' - Término do Processamento');
  Application.ProcessMessages;
  bbtnCalcula.Enabled := True;

  WriteLn(F, 'ERRO' +
          Copy(FormatDateTime('dd/mm/yyyy', Date),1,2) +
          Copy(FormatDateTime('dd/mm/yyyy', Date),4,2) +
          Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '.LOG');

  lbMensagens.Lines.SaveToFile('MENS' +
                               Copy(FormatDateTime('dd/mm/yyyy', Date),1,2) +
                               Copy(FormatDateTime('dd/mm/yyyy', Date),4,2) +
                               Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '.LOG');

  mmDivergencias.Lines.SaveToFile(copy(trim(edTxt.Text),1,kx) + 'Div' +
                                  copy(FormatDateTime('dd/mm/yyyy', Date),1,2) +
                                  copy(FormatDateTime('dd/mm/yyyy', Date),4,2) +
                                  copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '.err');

  CloseFile(F);
  if chkbad.checked then  CloseFile(bad);

  DecimalSeparator:=AuxDec;
  Screen.Cursor:=crDefault;
  //

  if clbEtapas.Checked[2] then
  begin
     if MsgDlg('Deseja visualizar o relatório de críticas ?', 'Confirmação', 
               mtConfirmation, [mbYes, mbNo], 0) = mrYes     then
        bbtnRelClick(self);
  end;
            



end;


procedure TfrmGravaTxt.FormCreate(Sender: TObject);
begin
  inherited;
  //Henrique Massão
  odtxt.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //
  qryBuscaRubrica.Close;
  qryBuscaRubrica.Prepare;
  //
  qryMotivo.Close;
  qryMotivo.Open;
  //
  qryPatroCombo.Close;
  qryPatroCombo.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatroCombo.Open;
  //
  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPlanPrev.Open;
  //
  qryUpdOp1.Prepare;
  qryUpdOp2.Prepare;
  qryUpdOp3.Prepare;
  qryCalcContrib.Prepare;
  dtmContribInterf.qryInsTmpDesc.Prepare;
  qryMaxOrdem.Prepare;

  
  qryLayOut.Close;
  qryLayOut.Open;
  
  deDataCob.Date:=Date;
  deDataRef.Date:=Date;
end;

procedure TfrmGravaTxt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //
  qryBuscaRubrica.Close;
  qryBuscaRubrica.UnPrepare;
  //
  qryUpdOp1.Close;
  qryUpdOp1.UnPrepare;
  qryUpdOp2.Close;
  qryUpdOp2.UnPrepare;
  qryUpdOp3.Close;
  qryUpdOp3.UnPrepare;
  qryCalcContrib.Close;
  qryCalcContrib.UnPrepare;
  dtmContribInterf.qryInsTmpDesc.Close;
  dtmContribInterf.qryInsTmpDesc.UnPrepare;
  qryMaxOrdem.Close;
  qryMaxOrdem.UnPrepare;
end;

function TfrmGravaTxt.RetornaCodProvDesc(piIdPessJur,piIdRubrica : Integer) : string;
begin
  with qryCodProvDesc do
  begin
    Close;
    ParamByName('pIdPessJur').Value := piIdPessJur;
    ParamByName('pIdRubrica').Value := piIdRubrica;
    Open;
    if not IsEmpty
    then Result := FieldByName('CodProvDesc').AsString;
    Close;
  end;
end;  // RetornaCodProvDesc

procedure TfrmGravaTxt.FormActivate(Sender: TObject);
var i : integer;
begin
  inherited;

  /// Checar todas as etapas
  for i := 0 to (clbEtapas.Items.Count - 1) do clbEtapas.Checked[i] := true;
end;

function TfrmGravaTxt.ConvMes(sMes,sFormato,sIniAno:String):String;
var i : word;
begin

   // Trocar YYYY por AAAA caso o usuario tenha usado YYYY
   sFormato := UpperCase(sFormato);
   for i := 1 to Length(sFormato) do
   begin
      if Copy(sFormato,i,1) = 'Y'
      then sFormato := Copy(sFormato, 1, i - 1)+'A'+Copy(sFormato, i+1, Length(sFormato) - i);
   end;
   sMes:=trim(sMes);
   Result:=sMes;
   if (sFormato = 'AAAA/MM')  then begin
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

procedure TfrmGravaTxt.ImportaRubricas;
var
  bErro : boolean;
  ssqlAtualiza : string;
begin
  qryPlanPatro.Close;
  qryPlanPatro.sql.text := ' SELECT P.IDPESSJUR,P.IDPLANOPREV, '+
            '  C.FLGTPVLR,C.IDCONTRIBUICAO, CT.ORDEMCALCULO,  CO.NOME '+
            '  FROM   PLANPREVPATRO P, CONTPLANPATRO C, '+
            '  CONTPREV CT, CONTRIBUICAO CO '+
            '  WHERE  (C.IDPESSJUR = '''+qryPatroCombo.FieldByName('IdPessoa').AsString+''') ';
            if    dblkPlanoPrev.text  <> '' then
               qryPlanPatro.sql.text :=  qryPlanPatro.sql.text +'  AND (C.IDPLANOPREV = '''+qryPlanPrev.fieldByName('IdPlanoPrev').AsString+''') ';
            qryPlanPatro.sql.text :=  qryPlanPatro.sql.text +'  AND (P.IDPLANOPREV = C.IDPLANOPREV ) '+
            '  AND (P.IDPESSJUR = C.IDPESSJUR) '+
            '  AND (P.IDPLANOPREV = C.IDPLANOPREV) '+
            '  AND (CT.IDPLANOPREV = C.IDPLANOPREV) '+
            '  AND (CT.IDCONTRIBUICAO = C.IDCONTRIBUICAO) '+
            '  AND EXISTS (SELECT 1 FROM CONTRIBPREVPARTP '+
            '                WHERE IDPESSJUR = C.IDPESSJUR AND '+
            '                  IDPLANOPREV = C.IDPLANOPREV AND '+
            '                  IDCONTRIBUICAO = C.IDCONTRIBUICAO ) '+
            '  AND EXISTS (SELECT 1 FROM CLASSERUBRICAS CL '+
            '              WHERE CL.CODPATRO = P.IDPESSJUR AND '+
            '              CL.CODPLANO = P.IDPLANOPREV AND '+
            '              CL.IDCONTRIBUICAO = CO.IDCONTRIBUICAO )   '+
            '  AND CO.IDCONTRIBUICAO = CT.IDCONTRIBUICAO  '+
            '  ORDER BY P.IDPLANOPREV, CT.ORDEMCALCULO ';
  qryPlanPatro.Open;
  //

  if liIdLote < 0
  then liIdLote := CriaLOTE(qryPatroCombo.FieldByName('IdPessoa').AsInteger,
                     sMesRef,
                     'P',
                     Copy('Contribuições descontadas em folha - '+qryPatroCombo.FieldByName('Nome').AsString,1,200),
                     'N', // insercoes serao apenas para Normais, pois A/D estarao sempre na TmpDesc
                     1, // flgPreparado
                     1, // flgIdaTmp
                     1, // flgVoltaTmp
                     1, // FlgIdaInterface
                     1, // FlgVoltaInterface
                     date,  // DataPreparo
                     date,  // DataIdaTmp
                     date,  // DataVoltaTmp
                     date,  // DataIdaInterface
                     date); // DATAVOLTAINTERFA

  qryPlanPatro.First;
  while not qryPlanPatro.EOF do
  begin


    lbMensagens.Lines.Add(TimeToStr(Time)+' - Calculando '+qryPlanPatro.fieldbyname('NOME').AsString+'');
    Application.ProcessMessages;



    //verifica se atualiza a contribuição associada 1
    qryaux.close;
    qryaux.sql.clear;
    qryaux.sql.add(' SELECT CP.IDCONTRIBUICAO    FROM   CONTPREV CP '+
                   ' WHERE CP.IDCONTRIBPAI = '''+qryPlanPatro.FieldByName('IdContribuicao').AsString+'''  '+
                   ' AND CP.IDPLANOPREV = '''+qryPlanPatro.FieldByName('IdPlanoPrev').AsString+'''  ');
    qryaux.open;
    bAtualizaContribPai := not qryaux.isempty;


    //verifica se atualiza a contribuição associada 2
    qryaux.close;
    qryaux.sql.clear;
    qryaux.sql.add(' SELECT CP.IDCONTRIBUICAO    FROM   CONTPREV CP '+
                   ' WHERE CP.IDCONTRIBPAI2 = '''+qryPlanPatro.FieldByName('IdContribuicao').AsString+'''  '+
                   ' AND CP.IDPLANOPREV = '''+qryPlanPatro.FieldByName('IdPlanoPrev').AsString+'''  ');
    qryaux.open;
    bAtualizaContribPai2 := not qryaux.isempty;


    //verifica se atualiza a contribuição associada 3
    qryaux.close;
    qryaux.sql.clear;
    qryaux.sql.add(' SELECT CP.IDCONTRIBUICAO    FROM   CONTPREV CP '+
                   ' WHERE CP.IDCONTRIBPAI3 = '''+qryPlanPatro.FieldByName('IdContribuicao').AsString+'''  '+
                   ' AND CP.IDPLANOPREV = '''+qryPlanPatro.FieldByName('IdPlanoPrev').AsString+'''  ');
    qryaux.open;
    bAtualizaContribPai3 := not qryaux.isempty;




      qryCalcContrib.Close;
      qryCalcContrib.ParamByName('pDataRef').AsString     := deDataRef.Text;
      qryCalcContrib.ParamByName('pMesCob').AsString     :=  sMesCob;
      qryCalcContrib.ParamByName('pIdPessJur').Value      := qryPatroCombo.FieldByName('IdPessoa').AsInteger;
      qryCalcContrib.ParamByName('pIdPlanoPrev').Value    := qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger;
      qryCalcContrib.ParamByName('pIdContribuicao').Value  := qryPlanPatro.FieldByName('IdContribuicao').AsInteger;
      qryCalcContrib.ParamByName('pSeqProposta').Value    := 1;
      qryCalcContrib.Open;


      if qryCalcContrib.IsEmpty then
      begin
         qryPlanPatro.next;
         continue; 
      end;


      //se for enviado a bse , então recalcular as contribuições na volta
      if  (qryPlanPatro.FieldByName('flgtpvlr').AsString = 'B') 
      then begin
             Regra.QueryIn  := qryCalcContrib;
             if qryCalcContrib.FieldByName('IDREGRACALCULO').AsString <> '' then
             begin
                Regra.RuleName := qryCalcContrib.FieldByName('IDREGRACALCULO').AsString;
                Regra.LimpaVariaveis; 
                Regra.Execute;
                bErro := Regra.Error;
                if bErro
                then WriteLn(F,'Erro na execução da regra ' + qryCalcContrib.FieldByName('IDREGRACALCULO').AsString +
                            ' - Participante: ' + qryCalcContrib.FieldByName('MATRICULA').AsString);
             end;

      end
      else//não é feito o envio, ou há envio de valor
          //atualizar valor recebido
      begin
          QRYCALCCONTRIB.First;
          while not QRYCALCCONTRIB.EOF do
          begin

             
             if  (qryPlanPatro.FieldByName('flgtpvlr').AsString = 'V')
             then begin
               try
                   ssqlAtualiza := ' UPDATE TMPDESC SET VALORRECEBIDO = '+ORANUMERO(floattostr(QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').AsFloat))+' , '+
                                   ' DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY''),  '+
                                   ' SITENVIO = DECODE(VALOR,'+ORANUMERO(floattostr(QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').AsFloat))+',''2'',''1'') , '+ 
                                   ' FLGDESCFOLHA = ''P'' ';
                   ssqlAtualiza := ssqlAtualiza + ' WHERE IDPESSOA = '+inttostr(QRYCALCCONTRIB.FieldByName('IDPESSOA').AsInteger)+' AND ';
                   ssqlAtualiza := ssqlAtualiza + ' IDPESSJUR = '+ inttostr(QRYCALCCONTRIB.FieldByName('IDPESSJUR').AsInteger)+' AND ';
                   ssqlAtualiza := ssqlAtualiza + ' MESREFERENCIA = '+ '''' + QRYCALCCONTRIB.FieldByName('MESREFERENCIA').AsString + '''' +' AND ';
                   ssqlAtualiza := ssqlAtualiza + ' MESCOBRANCA   = '+ '''' + QRYCALCCONTRIB.FieldByName('MESCOBRANCA').AsString + '''' +' AND ';
                   ssqlAtualiza := ssqlAtualiza + ' IDDESCONTO   = '+ '''' + QRYCALCCONTRIB.FieldByName('IDCONTRIBUICAO').AsString + '''' +' AND ';
                   ssqlAtualiza := ssqlAtualiza + ' IDPROVENTO   = '+ inttostr(QRYCALCCONTRIB.FieldByName('IDRUBRICA').AsInteger);
                   qryAux.Close;
                   qryAux.SQL.Clear;
                   qryAux.SQL.Add(ssqlAtualiza);
                   qryAux.ExecSQL;
                   if qryAux.RowsAffected <= 0
                   then begin
                      if not InsereTmpDesc(QRYCALCCONTRIB,
                              0, 
                              QRYCALCCONTRIB.FieldByName('ValorRecebido').AsFloat,
                              QRYCALCCONTRIB.FieldByName('MESREFERENCIA').AsString,
                              QRYCALCCONTRIB.FieldByName('MESCOBRANCA').AsString,
                              liIdLote,qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsInteger,
                              StrToDateTime(deDataRef.Text))
                      then begin
                        GravaErrosCCP(7, QRYCALCCONTRIB.FieldByName('IDPESSJUR').AsInteger,
                                      'Erro na gravação da Contribuição.',
                                      QRYCALCCONTRIB.FieldByName('MATRICULA').AsString,
                                      QRYCALCCONTRIB.FieldByName('CODPROVDESC').AsString,
                                      QRYCALCCONTRIB.FieldByName('MESREFERENCIA').AsString,
                                      QRYCALCCONTRIB.FieldByName('ValorRecebido').AsFloat,
                                      QRYCALCCONTRIB.fieldbyname('IDCONTRIBUICAO').AsString,
                                      QRYCALCCONTRIB.FieldByName('MESCOBRANCA').AsString,'');
                      end;
                   end;

               except
                  GravaErrosCCP(7, QRYCALCCONTRIB.FieldByName('IDPESSJUR').AsInteger,
                                'Erro na gravação da Contribuição.',
                                QRYCALCCONTRIB.FieldByName('MATRICULA').AsString,
                                QRYCALCCONTRIB.FieldByName('CODPROVDESC').AsString,
                                QRYCALCCONTRIB.FieldByName('MESREFERENCIA').AsString,
                                QRYCALCCONTRIB.FieldByName('ValorRecebido').AsFloat,
                                QRYCALCCONTRIB.fieldbyname('IDCONTRIBUICAO').AsString,
                                QRYCALCCONTRIB.FieldByName('MESCOBRANCA').AsString,'');
               end;
             end
             else begin
                   try
                      
                      if QRYCALCCONTRIB.FieldByName('FLGATRASODEVOL').AsString = 'N'
                      then begin
                         if not InsereTmpDesc(QRYCALCCONTRIB,
                                 QRYCALCCONTRIB.FieldByName('ValorRecebido').AsFloat,
                                 QRYCALCCONTRIB.FieldByName('ValorRecebido').AsFloat,
                                 QRYCALCCONTRIB.FieldByName('MESREFERENCIA').AsString,
                                 QRYCALCCONTRIB.FieldByName('MESCOBRANCA').AsString,
                                 liIdLote,qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsInteger,
                                 StrToDateTime(deDataRef.Text))
                         then begin
                            ssqlAtualiza := ' UPDATE TMPDESC SET VALORRECEBIDO = '+ORANUMERO(floattostr(QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').AsFloat))+' , '+
                                            ' DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY''),  '+
                                            ' VALOR = '+ORANUMERO(floattostr(QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').AsFloat))+' ,'+
                                            ' SITENVIO = ''2'' , '+
                                            ' FLGDESCFOLHA = ''P'' ';
                            ssqlAtualiza := ssqlAtualiza + ' WHERE IDPESSOA = '+inttostr(QRYCALCCONTRIB.FieldByName('IDPESSOA').AsInteger)+' AND ';
                            ssqlAtualiza := ssqlAtualiza + ' IDPESSJUR = '+ inttostr(QRYCALCCONTRIB.FieldByName('IDPESSJUR').AsInteger)+' AND ';
                            ssqlAtualiza := ssqlAtualiza + ' MESREFERENCIA = '+ '''' + QRYCALCCONTRIB.FieldByName('MESREFERENCIA').AsString + '''' +' AND ';
                            ssqlAtualiza := ssqlAtualiza + ' MESCOBRANCA   = '+ '''' + QRYCALCCONTRIB.FieldByName('MESCOBRANCA').AsString + '''' +' AND ';
                            ssqlAtualiza := ssqlAtualiza + ' IDDESCONTO   = '+ '''' + QRYCALCCONTRIB.FieldByName('IDCONTRIBUICAO').AsString + '''' +' AND ';
                            ssqlAtualiza := ssqlAtualiza + ' IDPROVENTO   = '+ inttostr(QRYCALCCONTRIB.FieldByName('IDRUBRICA').AsInteger);
                            qryAux.Close;
                            qryAux.SQL.Clear;
                            qryAux.SQL.Add(ssqlAtualiza);
                            qryAux.ExecSQL;
                         end
                      end
                      else begin
                         ssqlAtualiza := ' UPDATE TMPDESC SET VALORRECEBIDO = '+ORANUMERO(floattostr(QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').AsFloat))+' , '+
                                         ' DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY''),  '+
                                         ' VALOR = '+ORANUMERO(floattostr(QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').AsFloat))+' ,'+
                                         ' SITENVIO = ''2'' , '+
                                         ' FLGDESCFOLHA = ''P'' ';
                         ssqlAtualiza := ssqlAtualiza + ' WHERE IDPESSOA = '+inttostr(QRYCALCCONTRIB.FieldByName('IDPESSOA').AsInteger)+' AND ';
                         ssqlAtualiza := ssqlAtualiza + ' IDPESSJUR = '+ inttostr(QRYCALCCONTRIB.FieldByName('IDPESSJUR').AsInteger)+' AND ';
                         ssqlAtualiza := ssqlAtualiza + ' MESREFERENCIA = '+ '''' + QRYCALCCONTRIB.FieldByName('MESREFERENCIA').AsString + '''' +' AND ';
                         ssqlAtualiza := ssqlAtualiza + ' MESCOBRANCA   = '+ '''' + QRYCALCCONTRIB.FieldByName('MESCOBRANCA').AsString + '''' +' AND ';
                         ssqlAtualiza := ssqlAtualiza + ' IDDESCONTO   = '+ '''' + QRYCALCCONTRIB.FieldByName('IDCONTRIBUICAO').AsString + '''' +' AND ';
                         ssqlAtualiza := ssqlAtualiza + ' IDPROVENTO   = '+ inttostr(QRYCALCCONTRIB.FieldByName('IDRUBRICA').AsInteger);
                         qryAux.Close;
                         qryAux.SQL.Clear;
                         qryAux.SQL.Add(ssqlAtualiza);
                         qryAux.ExecSQL;
                         if qryAux.RowsAffected <= 0
                         then begin
                            if not InsereTmpDesc(QRYCALCCONTRIB,
                                    QRYCALCCONTRIB.FieldByName('ValorRecebido').AsFloat,
                                    QRYCALCCONTRIB.FieldByName('ValorRecebido').AsFloat,
                                    QRYCALCCONTRIB.FieldByName('MESREFERENCIA').AsString,
                                    QRYCALCCONTRIB.FieldByName('MESCOBRANCA').AsString,
                                    liIdLote,qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsInteger,
                                    StrToDateTime(deDataRef.Text))
                            then begin
                               GravaErrosCCP(7, QRYCALCCONTRIB.FieldByName('IDPESSJUR').AsInteger,
                                             'Erro na gravação da Contribuição.',
                                             QRYCALCCONTRIB.FieldByName('MATRICULA').AsString,
                                             QRYCALCCONTRIB.FieldByName('CODPROVDESC').AsString,
                                             QRYCALCCONTRIB.FieldByName('MESREFERENCIA').AsString,
                                             QRYCALCCONTRIB.FieldByName('ValorRecebido').AsFloat,
                                             QRYCALCCONTRIB.fieldbyname('IDCONTRIBUICAO').AsString,
                                             QRYCALCCONTRIB.FieldByName('MESCOBRANCA').AsString,'');
                            end;
                         end;
                      end;
                   except
                      GravaErrosCCP(7, QRYCALCCONTRIB.FieldByName('IDPESSJUR').AsInteger,
                                    'Erro na gravação da Contribuição.',
                                    QRYCALCCONTRIB.FieldByName('MATRICULA').AsString,
                                    QRYCALCCONTRIB.FieldByName('CODPROVDESC').AsString,
                                    QRYCALCCONTRIB.FieldByName('MESREFERENCIA').AsString,
                                    QRYCALCCONTRIB.FieldByName('ValorRecebido').AsFloat,
                                    QRYCALCCONTRIB.fieldbyname('IDCONTRIBUICAO').AsString,
                                    QRYCALCCONTRIB.FieldByName('MESCOBRANCA').AsString,'');
                   end;
             end;

             QRYCALCCONTRIB.Next;
          end;
          If clbEtapas.Checked[5]
           Then Begin
              With qryConfCont do
               Begin
                 Close;
                 ParamByName('CODPROVDESC').AsString := qryCalcContrib.FieldByName('CODPROVDESC').AsString;
                 ParamByName('IDPATRO').AsInteger := qryCalcContrib.FieldByName('IDPESSJUR').AsInteger;
                 ParamByName('MESCOBRANCA').AsString := qryCalcContrib.FieldByName('MESCOBRANCA').AsString;
                 ParamByName('IDPLANOCONT').AsInteger := qryCalcContrib.FieldByName('IDPLANOCONT').AsInteger;
                 Open;
                 If not IsEmpty
                  Then Begin
                     First;
                     While Not Eof do
                      Begin
                        mmDivergencias.Lines.Add('Rubrica '+FieldByName('RUBRICA').AsString+
                          ' plano '+FieldByName('PLANOCONT').AsString+' não gravada como contribuição'+
                          ' para a matrícula '+FieldByName('MATRICULA').AsString+
                          ' plano '+FieldByName('PLANOPART').AsString+' - '+
                          'Valor '+ClienteNumero(ConvValor(FieldByName('VALOR_CONTRIBUICAO').AsString)));
                        Next;
                      End;
                  End;
               End;
           End;

      end;

    qryPlanPatro.Next;
  end;
  qryPlanPatro.close;
  QRYCALCCONTRIB.Close;
end; // ImportaRubricas

procedure TfrmGravaTxt.RegraGetResult(sender: TObject); 
var
  sSqlAtualiza  : string;
  rFaltaAbater  : real;
begin
  inherited;
  inc(icontadorcommit);


  if Regra.QueryIn = QryCalcContrib then begin
     if Regra.queryIn.FieldByName('FLGATRASODEVOL').AsString <> 'N'
     then begin
        sSQLAtualiza := ' UPDATE TMPDESC SET   '+
                        ' IDPROVENTO = '+IntToStr(QRYCALCCONTRIB.FieldByName('IDRUBRICA').AsInteger)+', '+
                        ' CODPROVDESC= '''+qryCalcContrib.FieldByName('CodProvDesc').AsString+''', '+
                        ' FLGDESCFOLHA = ''P'' , '+
                        ' SITENVIO = DECODE(VALOR,'+oranumero(QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').AsString)+','+''''+'2'+''''+','+''''+'1'+''''+') , '+
                        ' DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY'') , VALORRECEBIDO = ' + oranumero(floattostr(QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').Value))  +
                        ' WHERE IDPESSJUR    = '+ inttostr(qryPlanPatro.FieldByName('IdPessjur').AsInteger)+
                        ' AND   IDPLANOPREV  = '+ inttostr(qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger)+
                        ' AND   IDPESSOA     = '+ inttostr(QRYCALCCONTRIB.FieldByName('IdPessoa').AsInteger)+
                        ' AND   IDDESCONTO   = '+ inttostr(QRYCALCCONTRIB.FieldByName('IdContribuicao').AsInteger)+
                        ' AND   MESCOBRANCA  = '+ '''' + sMesCob + ''''+
                        ' AND   MESREFERENCIA= '''+Regra.queryIn.FieldByName('MESREFERENCIA').AsString+''' '+
                        ' AND   VALOR        = ' + oranumero(floattostr(QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').Value)+
                        ' AND   FLGATRASODEVOL = '''+Regra.queryIn.FieldByName('FLGATRASODEVOL').AsString+''' ');
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSQLAtualiza);
        qryAux.ExecSQL;

        // Se não encontrou valor igual ao recebido então
        // Sendo uma rubrica de atraso/devolucao, fazer o DESMEMBRAMENTO DA RUBRICA, pois pode
        // ter vindo em uma única rubrica a cobranca de um atraso/devolucao de vários meses
        if qryAux.RowsAffected <= 0
        then begin
           qryDesmembraRubrica.Close;
           qryDesmembraRubrica.ParamByName('IdPessJur').AsInteger     := qryPlanPatro.FieldByName('IdPessjur').AsInteger;
           qryDesmembraRubrica.ParamByName('IdPlanoPrev').AsInteger   := qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger;
           qryDesmembraRubrica.ParamByName('IdPessoa').AsInteger      := qryCalcContrib.FieldByName('IdPessoa').AsInteger;
           qryDesmembraRubrica.ParamByName('MesCobranca').AsString    := sMesCob;
           qryDesmembraRubrica.ParamByName('FlgAtrasoDevol').AsString := qryCalcContrib.FieldByName('FlgAtrasoDevol').AsString;
           qryDesmembraRubrica.ParamByName('CodProvDesc').AsString    := qryCalcContrib.FieldByName('CodProvDesc').AsString;
           qryDesmembraRubrica.ParamByName('IdContribuicao').AsInteger   := QRYCALCCONTRIB.FieldByName('IdContribuicao').AsInteger; 
           qryDesmembraRubrica.Open;

           if qryDesmembraRubrica.IsEmpty
           then begin //  Se não encontrou na TMPDESC então insere com valor esperado = 0

              //se o atraso/devolução não é esperado
              //então gera crítica e não mais insere na tmpdesc

              GravaErrosCCP(11, qryPlanPatro.FieldByName('IdPessjur').AsInteger,
                               'Atraso/Devolução. Mês de cob. igual ao de referência.',
                               qryCalcContrib.FieldByName('MATRICULA').AsString,
                               qryCalcContrib.FieldByName('CodProvDesc').AsString,
                               Regra.queryIn.FieldByName('MESREFERENCIA').AsString,
                               qryCalcContrib.FieldByName('ValorRecebido').AsFloat,
                               '', sMesCob,'');


           end
           else begin
              qryDesmembraRubrica.First;
              rFaltaAbater := qryCalcContrib.FieldByName('ValorRecebido').AsFloat;
              while not qryDesmembraRubrica.Eof do
              begin
                if rFaltaAbater <= 0
                then sSQLAtualiza := ' UPDATE TMPDESC SET SITENVIO = 1,   '+
                                     '                VALORRECEBIDO  = 0  '+
                                     ' WHERE IDPESSJUR      = '+ inttostr(qryPlanPatro.FieldByName('IdPessjur').AsInteger)+
                                     ' AND   IDPLANOPREV    = '+ inttostr(qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger)+
                                     ' AND   IDPESSOA       = '+ inttostr(qryCalcContrib.FieldByName('IdPessoa').AsInteger)+
                                     ' AND   IDDESCONTO     = '+ inttostr(qryCalcContrib.FieldByName('IdContribuicao').AsInteger)+
                                     ' AND   CODPROVDESC    = '''+qryCalcContrib.FieldByName('CodProvDesc').AsString+''''+
                                     ' AND   MESCOBRANCA    = '+ '''' + sMesCob + ''''+
                                     ' AND   MESREFERENCIA  = '''+qryDesmembraRubrica.FieldByName('MESREFERENCIA').AsString+''''+
                                     ' AND   FLGATRASODEVOL = '''+qryCalcContrib.FieldByName('FLGATRASODEVOL').AsString+''''
                else begin
                   if (qryDesmembraRubrica.FieldByName('Valor').AsFloat <= rFaltaAbater) and
                      (qryDesmembraRubrica.recordcount > 1)
                   then begin
                      sSQLAtualiza := ' UPDATE TMPDESC SET SITENVIO  = 2,     '+
                                      ' DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY'')  ,  VALORRECEBIDO = VALOR ,   FLGDESCFOLHA = ''P''  '+
                                      ' WHERE IDPESSJUR      = '+ inttostr(qryPlanPatro.FieldByName('IdPessjur').AsInteger)+
                                      ' AND   IDPLANOPREV    = '+ inttostr(qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger)+
                                      ' AND   IDPESSOA       = '+ inttostr(qryCalcContrib.FieldByName('IdPessoa').AsInteger)+
                                      ' AND   IDDESCONTO     = '+ inttostr(qryCalcContrib.FieldByName('IdContribuicao').AsInteger)+
                                      ' AND   CODPROVDESC    = '''+qryCalcContrib.FieldByName('CodProvDesc').AsString+''''+
                                      ' AND   MESCOBRANCA    = '+ '''' + sMesCob + ''''+
                                      ' AND   MESREFERENCIA  = '''+qryDesmembraRubrica.FieldByName('MESREFERENCIA').AsString+''''+
                                      ' AND   FLGATRASODEVOL = '''+qryCalcContrib.FieldByName('FLGATRASODEVOL').AsString+''' ';
                      rFaltaAbater := rFaltaAbater - qryDesmembraRubrica.FieldByName('Valor').AsFloat;
                   end
                   else begin
                      sSQLAtualiza := ' UPDATE TMPDESC SET SITENVIO  = 1,     '+
                                      ' DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY'')  ,  FLGDESCFOLHA = ''P'' , VALORRECEBIDO = '+OraNumero(FloatToStr(rFaltaAbater))+
                                      ' WHERE IDPESSJUR      = '+ inttostr(qryPlanPatro.FieldByName('IdPessjur').AsInteger)+
                                      ' AND   IDPLANOPREV    = '+ inttostr(qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger)+
                                      ' AND   IDPESSOA       = '+ inttostr(qryCalcContrib.FieldByName('IdPessoa').AsInteger)+
                                      ' AND   IDDESCONTO     = '+ inttostr(qryCalcContrib.FieldByName('IdContribuicao').AsInteger)+
                                      ' AND   CODPROVDESC    = '''+qryCalcContrib.FieldByName('CodProvDesc').AsString+''''+
                                      ' AND   MESCOBRANCA    = '+ '''' + sMesCob + ''''+
                                      ' AND   MESREFERENCIA  = '''+qryDesmembraRubrica.FieldByName('MESREFERENCIA').AsString+''''+
                                      ' AND   FLGATRASODEVOL = '''+qryCalcContrib.FieldByName('FLGATRASODEVOL').AsString+'''';
                      rFaltaAbater := 0;
                   end;
                end;

                qryAux.Close;
                qryAux.SQL.Clear;
                qryAux.SQL.Add(sSQLAtualiza);
                qryAux.ExecSQL;

                qryDesmembraRubrica.Next;
              end; // while
           end;
           qryDesmembraRubrica.Close;
        end
     end
     else begin


        try
           strtofloat(clientenumero(Regra.Result));
        except
           WriteLn(F,'Erro na execução da regra ' + regra.queryin.FieldByName('IDREGRACALCULO').AsString +
                  ' - Participante: ' + regra.queryin.FieldByName('MATRICULA').AsString+' - Voltou o valor: '+
                  ' '+Regra.Result+'');
           regra.error := true;
           exit;
        end;


        // Verificar se a contribuição existe na tmpdesc (tentando atualiza-la)
        // Se a atualizacao nao for feita, significa que nao existe a linha na tmpdesc
        // Entao inseri-la
        if OraNumero(formatfloat('0.00',strtofloat(clientenumero(Regra.Result)))) = OraNumero(FormatFloat('0.00',QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').AsFloat))
        then sSQLAtualiza := ' UPDATE TMPDESC SET SITENVIO = 2, DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY'')  ,  FLGDESCFOLHA = ''P'' ,  '+
                             '                    VALOR    = '+OraNumero(formatfloat('0.00',strtofloat(clientenumero(Regra.Result))))+','+
                             '                    VALORRECEBIDO = ' + oranumero(floattostr(QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').Value))+
                             ' WHERE IDPESSJUR     = '+ inttostr(qryPlanPatro.FieldByName('IdPessjur').AsInteger)+
                             ' AND   IDPLANOPREV   = '+ inttostr(qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger)+
                             ' AND   IDPESSOA      = '+ inttostr(QRYCALCCONTRIB.FieldByName('IdPessoa').AsInteger)+
                             ' AND   IDDESCONTO    = '+ inttostr(QRYCALCCONTRIB.FieldByName('IdContribuicao').AsInteger)+
                             ' AND   MESREFERENCIA = '''+ QRYCALCCONTRIB.FieldByName('MesReferencia').AsString+''''+
                             ' AND   MESCOBRANCA   = '+ '''' + sMesCob + ''' '+
                             ' AND   CODPROVDESC    = '''+qryCalcContrib.FieldByName('CodProvDesc').AsString+'''' 
        else sSQLAtualiza := 'UPDATE TMPDESC SET SITENVIO = 1, DATARECEBIMENTO = TO_DATE('''+deDataCob.text+''',''DD/MM/YYYY'') ,  FLGDESCFOLHA = ''P'' ,  '+
                             '                   VALOR = '+OraNumero(Regra.Result)+','+
                             '                   VALORRECEBIDO = ' + oranumero(floattostr(QRYCALCCONTRIB.FieldByName('VALORRECEBIDO').Value))+
                             ' WHERE IDPESSJUR   = '+ inttostr(qryPlanPatro.FieldByName('IdPessjur').AsInteger)+
                             ' AND   IDPLANOPREV   = '+ inttostr(qryPlanPatro.FieldByName('IdPlanoPrev').AsInteger)+
                             ' AND   IDPESSOA      = '+ inttostr(QRYCALCCONTRIB.FieldByName('IdPessoa').AsInteger)+
                             ' AND   IDDESCONTO    = '+ inttostr(QRYCALCCONTRIB.FieldByName('IdContribuicao').AsInteger)+
                             ' AND   MESREFERENCIA = '''+ QRYCALCCONTRIB.FieldByName('MesReferencia').AsString+''''+
                             ' AND   MESCOBRANCA   = '+ '''' + sMesCob + ''' '+
                             ' AND   CODPROVDESC    = '''+qryCalcContrib.FieldByName('CodProvDesc').AsString+''' '; 
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSQLAtualiza);
        qryAux.ExecSQL;
        if qryAux.RowsAffected <= 0
        then InsereTmpDesc(Regra.QueryIn,StrToFloat(ClienteNumero(Regra.Result)),
                           QRYCALCCONTRIB.FieldByName('ValorRecebido').AsFloat,
                           QRYCALCCONTRIB.FieldByName('MESREFERENCIA').AsString,
                           QRYCALCCONTRIB.FieldByName('MESCOBRANCA').AsString,
                           liIdLote,qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsInteger,
                           StrToDateTime(deDataRef.Text));
     end;


     if bAtualizaContribPai then
     begin
         // Atualizar os campos das contribuicoes associadas
         qryUpdOp1.Close;
         if Trim(Regra.QueryIn.FieldByName('ValorBase1').AsString) <> ''
         then qryUpdOp1.ParamByName('pOp1').Value := Regra.QueryIn.FieldByName('ValorBase1').AsFloat
         else qryUpdOp1.ParamByName('pOp1').Clear;
         if Trim(Regra.QueryIn.FieldByName('ValorBase2').AsString) <> ''
         then qryUpdOp1.ParamByName('pOp2').Value := Regra.QueryIn.FieldByName('ValorBase2').AsFloat
         else qryUpdOp1.ParamByName('pOp2').Clear;
         if Trim(Regra.QueryIn.FieldByName('ValorBase3').AsString) <> ''
         then qryUpdOp1.ParamByName('pOp3').Value := Regra.QueryIn.FieldByName('ValorBase3').AsFloat
         else qryUpdOp1.ParamByName('pOp3').Clear;
         if Trim(Regra.Result) <> ''
         then qryUpdOp1.ParamByName('pValor').Value := StrToFloat(ClienteNumero(Regra.Result))
         else qryUpdOp1.ParamByName('pValor').Value := 0;
         qryUpdOp1.ParamByName('pIdPessJur').Value := Regra.QueryIn.FieldByName('IdPessJur').AsInteger;
         qryUpdOp1.ParamByName('pIdPlanoPrev').Value := Regra.QueryIn.FieldByName('IdPlanoPrev').AsInteger;
         qryUpdOp1.ParamByName('pIdPessoa').Value := Regra.QueryIn.FieldByName('IdPessoa').AsInteger;
         qryUpdOp1.ParamByName('pSeqProposta').Value := Regra.QueryIn.FieldByName('SeqProposta').AsInteger;
         qryUpdOp1.ParamByName('pIdContribuicao').Value := Regra.QueryIn.FieldByName('IdContribuicao').AsInteger;
         qryUpdOp1.ExecSQL;
         qryUpdOp1.Close;
         qryUpdOp2.Close;
     end;




     if bAtualizaContribPai2 then
     begin
         if Trim(Regra.QueryIn.FieldByName('ValorBase1').AsString) <> ''
         then qryUpdOp2.ParamByName('pOp1').Value := Regra.QueryIn.FieldByName('ValorBase1').AsFloat
         else qryUpdOp2.ParamByName('pOp1').Clear;
         if Trim(Regra.QueryIn.FieldByName('ValorBase2').AsString) <> ''
         then qryUpdOp2.ParamByName('pOp2').Value := Regra.QueryIn.FieldByName('ValorBase2').AsFloat
         else qryUpdOp2.ParamByName('pOp2').Clear;
         if Trim(Regra.QueryIn.FieldByName('ValorBase3').AsString) <> ''
         then qryUpdOp2.ParamByName('pOp3').Value := Regra.QueryIn.FieldByName('ValorBase3').AsFloat
         else qryUpdOp2.ParamByName('pOp3').Clear;
         if Trim(Regra.Result) <> ''
         then qryUpdOp2.ParamByName('pValor').Value := StrToFloat(ClienteNumero(Regra.Result))
         else qryUpdOp2.ParamByName('pValor').Value := 0;
         qryUpdOp2.ParamByName('pIdPessJur').Value := Regra.QueryIn.FieldByName('IdPessJur').AsInteger;
         qryUpdOp2.ParamByName('pIdPlanoPrev').Value := Regra.QueryIn.FieldByName('IdPlanoPrev').AsInteger;
         qryUpdOp2.ParamByName('pIdPessoa').Value := Regra.QueryIn.FieldByName('IdPessoa').AsInteger;
         qryUpdOp2.ParamByName('pSeqProposta').Value := Regra.QueryIn.FieldByName('SeqProposta').AsInteger;
         qryUpdOp2.ParamByName('pIdContribuicao').Value := Regra.QueryIn.FieldByName('IdContribuicao').AsInteger;
         qryUpdOp2.ExecSQL;
         qryUpdOp2.Close;
         qryUpdOp3.Close;
     end;



     if bAtualizaContribPai3 then
     begin
         if Trim(Regra.QueryIn.FieldByName('ValorBase1').AsString) <> ''
         then qryUpdOp3.ParamByName('pOp1').Value := Regra.QueryIn.FieldByName('ValorBase1').AsFloat
         else qryUpdOp3.ParamByName('pOp1').Clear;
         if Trim(Regra.QueryIn.FieldByName('ValorBase2').AsString) <> ''
         then qryUpdOp3.ParamByName('pOp2').Value := Regra.QueryIn.FieldByName('ValorBase2').AsFloat
         else qryUpdOp3.ParamByName('pOp2').Clear;
         if Trim(Regra.QueryIn.FieldByName('ValorBase3').AsString) <> ''
         then qryUpdOp3.ParamByName('pOp3').Value := Regra.QueryIn.FieldByName('ValorBase3').AsFloat
         else qryUpdOp3.ParamByName('pOp3').Clear;
         if Trim(Regra.Result) <> ''
         then qryUpdOp3.ParamByName('pValor').Value := StrToFloat(ClienteNumero(Regra.Result))
         else qryUpdOp3.ParamByName('pValor').Value := 0;
         qryUpdOp3.ParamByName('pIdPessJur').Value := Regra.QueryIn.FieldByName('IdPessJur').AsInteger;
         qryUpdOp3.ParamByName('pIdPlanoPrev').Value := Regra.QueryIn.FieldByName('IdPlanoPrev').AsInteger;
         qryUpdOp3.ParamByName('pIdPessoa').Value := Regra.QueryIn.FieldByName('IdPessoa').AsInteger;
         qryUpdOp3.ParamByName('pSeqProposta').Value := Regra.QueryIn.FieldByName('SeqProposta').AsInteger;
         qryUpdOp3.ParamByName('pIdContribuicao').Value := Regra.QueryIn.FieldByName('IdContribuicao').AsInteger;
         qryUpdOp3.ExecSQL;
         qryUpdOp3.Close;
     end;
  end
  else begin  
      try
         strtofloat(clientenumero(Regra.Result));
      except
         WriteLn(F,'Erro na execução da regra ' + regra.queryin.FieldByName('IDREGRACALCULO').AsString +
                ' - Participante: ' + regra.queryin.FieldByName('MATRICULA').AsString+' - Voltou o valor: '+
                ' '+Regra.Result+'');
         regra.error := true;
         exit;
      end;


      InsereTmpDesc(qryContribNaoRecebidas,strtofloat(clientenumero(Regra.Result)),
                   0, sMesRefAux,
                   sMesCob,
                   liIdLote,
                   qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsInteger,
                   StrToDateTime(deDataRef.Text));

  end;  /// REGRA.QUERYIN

  if icontadorcommit > NumMaxRegSemCommit then
  begin
     if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
     if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;
     iContadorCommit := 0;
  end;

end;


function TfrmGravaTxt.ConvValor(sValor:String):String;

var sSvDec:Char;
    rValor:Double;
    iValDiv,xx:Integer;
    sValDiv:String;
Begin
  sSvDec           := DecimalSeparator;
  if qryDadosArquivo.FieldByName('FLGTIPOSEPARADEC').AsString = 'P' then begin
     Result:=sValor;
  end else begin
     if qryDadosArquivo.FieldByName('FLGTIPOSEPARADEC').AsString = 'V' then begin
        DecimalSeparator := ',';
        rValor:=StrToFloat(trim(sValor));
        DecimalSeparator := '.';
        Result:=FloatToStr(rValor);
     end else begin
        DecimalSeparator := '.';
        sValDiv:='1';
        for xx:=1 to qryDadosArquivo.FieldByName('NUMCASASDEC').AsInteger do begin
           sValDiv := sValDiv + '0';
        end;
        iValDiv := StrToInt(sValDiv);
        rValor := StrToFloat(trim(sValor))/iValDiv;
        Result :=FloatToStr(rValor);
     end;
  end;
  Result:=Trim(Result);
  DecimalSeparator :=sSvDec;
end;

procedure TfrmGravaTxt.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If Not odTxt.Execute
   Then Exit;

  If CriticaPath(odTxt.FileName)
   Then Begin
     MsgDlg('O local do arquivo escolhido possui caracteres inválidos.'+#13+
            'Por favor, mude a localização do arquivo para outra pasta.','Aviso',mtWarning,[mbOk],0);
     Exit;
   End;
  edTxt.Text := odTxt.FileName;
  edTxt.Hint := edTxt.Text;
  if (edtxt.Font.Size * length(edtxt.text)) > edtxt.Width then
     edTxt.ShowHint := true
  else
  edTxt.ShowHint := false;
end;

procedure TfrmGravaTxt.PageControl1Change(Sender: TObject);
begin
  inherited;
  if ( pageControl1.ActivePage.TabIndex = 1 ) AND ( Memo1.Lines.Text = '' ) then
  begin
     If FileExists('Log' +
                   copy(FormatDateTime('dd/mm/yyyy', date), 1, 2) +
                   copy(FormatDateTime('dd/mm/yyyy', date), 4, 2) +
                   copy(FormatDateTime('dd/mm/yyyy', date), 7, 4) + '.err') then
     Begin
       Memo1.Lines.LoadFromFile('Log' +
                                copy(FormatDateTime('dd/mm/yyyy', date), 1, 2) +
                                copy(FormatDateTime('dd/mm/yyyy', date), 4, 2) +
                                copy(FormatDateTime('dd/mm/yyyy', date), 7, 4) + '.err');
     End;
  end;
end;

procedure TfrmGravaTxt.Memo1DblClick(Sender: TObject);
begin
  inherited;
  memo1.execute;
end;

procedure TfrmGravaTxt.BitBtn2Click(Sender: TObject);
var sMesCob, sMesRef, sPlano : string;
ra : integer;
begin
  inherited;

  if trim(edTxt.Text) = '' then begin
     MsgDlg('Obrigatório preencher o Arquivo da Patrocinadora','Aviso',mtWarning,[mbOk],0);
     exit;
  end;
  //
  if trim(dblkPatrocinadora.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Patrocinadora','Aviso',mtWarning,[mbOk],0);
     dblkPatrocinadora.SetFocus;
     exit;
  end;
  //
  if trim(dblkPlanoPrev.Text) = '' then begin
     if MsgDlg('O plano não foi selecionado, deseja processar todos os planos ?','Confirmação', 
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     begin
        dblkPlanoPrev.SetFocus;
        exit;
     end;
  end;
  //
  if trim(deDataRef.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Data de Referencia','Aviso',mtWarning,[mbOk],0);
     deDataRef.SetFocus;
     exit;
  end;
  //
  if trim(deDataCob.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Data de Cobrança','Aviso',mtWarning,[mbOk],0);
     deDataCob.SetFocus;
     exit;
  end;

  lbMensagens.Lines.Clear;
  lbMensagens.Lines.Add(TimeToStr(Time)+' - Iniciando o processo');
  Application.ProcessMessages;

  sMesCob  := copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2);
  sMesRef  := copy(deDataRef.Text,7,4)+'/'+copy(deDataRef.Text,4,2);



  //testar se já houve recebimento feito por algum módulo de origem, caso sim,
  //não deixar que o desfazimento continue
  if  dblkPlanoPrev.text <> '' then
     sPlano  := dblkPlanoPrev.LookupValue
  else
     sPlano  := ' IDPLANOPREV ';



  qrydesfazTmpDesc.Close;
  qrydesfazTmpDesc.sql.text := ' SELECT 1 FROM  TMPDESC '+
                               ' WHERE MESCOBRANCA = '''+sMesCob+''' '+
                               ' AND IDPESSJUR = '''+qryPatroCombo.FieldByName('IDPESSOA').AsString+''' '+
                               ' AND IDPLANOPREV = '+sPlano+' '+
                               ' AND FLGDESCFOLHA    =  ''P'' '+
                               ' AND SITENVIO = 9 ';
  try
     qrydesfazTmpDesc.Open;
  except
  end;

  if not qryaux.isempty then
  begin
     MsgDlg('Não é possível desfazer pois algum módulo de origem(AdmPrev, Empréstimo, Assistencial) '+
            'já faz o seu recebimento.','Informação',mtInformation, [MbOk,MbHelp],0);
     Exit;
  end;

  if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;


  Modulo.GravaLogTOTALPREV (copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2)+' - v. '+Sistema.Versao+' - Desfazer Import. Financeira');

  // desfaz a gravação na Histrubsal do CCP
  if clbEtapas.Checked[0] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Desfazendo histórico de rubricas');
     Application.ProcessMessages;


     ra := 1;
     while ra > 0 do
     begin
        if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

        qrydesfazHistrubSal.Close;
        qrydesfazHistrubSal.sql.text := '  DELETE HISTRUBSAL  '+
                                        '  WHERE  MESCOBRANCA = '''+sMesCob+''' '+
                                        '  AND    IDPESSJUR = '''+qryPatroCombo.FieldByName('IDPESSOA').AsString+''' '+
                                        '  AND    IDPLANOPREV = '+sPlano+' '+
                                        '  AND    IDMODULO  = '+IntToStr(Sistema.IdModulo)+' '+
                                        '  AND    ROWNUM <= 10000   ';
        try
           qrydesfazHistrubSal.ExecSQL;
           ra := qrydesfazHistrubSal.RowsAffected;
           CommitTransacao;
        except
           MsgDlg('Erro ao desfazer registros do histórico de rubricas!','Erro!',mtError,[MbOk,MbHelp],0);
           RollBackTransacao;
           Exit;
        end;
     end;  //while

  end;


  if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

  if clbEtapas.Checked[2] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Desfazendo tabela de importação de rubricas');
     Application.ProcessMessages;
     // desfaz a gravação na TmpDesc
     qrydesfazTmpDesc.Close;
     qrydesfazTmpDesc.sql.text := 'DELETE TMPDESC '+
                                  ' WHERE MESCOBRANCA = '''+sMesCob+''' '+
                                  ' AND IDPESSJUR = '''+qryPatroCombo.FieldByName('IDPESSOA').AsString+''' '+
                                  ' AND IDPLANOPREV = '+sPlano+' '+
                                  ' AND IDMODULO  = '+IntToStr(Sistema.IdModulo)+' '+
                                  ' AND IDMOTIVO        =  '''+qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString+'''    '+
                                  ' AND FLGDESCFOLHA    =  ''P'' ';
     try
        qrydesfazTmpDesc.ExecSQL;
     except
        MsgDlg('Erro ao desfazer registros da tabela de importação!','Erro!',mtError,[MbOk,MbHelp],0);
        RollBackTransacao;
        Exit;
     end;

     // desfaz a gravação na TmpDesc de atualização do CCP - AdmPrev
     qrydesfazTmpDesc2.Close;
     qrydesfazTmpDesc2.sql.text := 'UPDATE TMPDESC' +
                                   ' SET   SITENVIO = 0, VALORRECEBIDO = NULL, DATARECEBIMENTO = NULL   '+
                                   ' WHERE MESCOBRANCA = '''+sMesCob+''' '+
                                   ' AND IDPESSJUR = '''+qryPatroCombo.FieldByName('IDPESSOA').AsString+''' '+
                                   ' AND IDPLANOPREV = '+sPlano+' '+
                                   ' AND IDMODULO  IN (16,17,452,454,456,487) '+
                                   ' AND IDMOTIVO  IN ( '+qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsString;
      If Trim(qryMotivo.FieldByName('IDMOTIVOCONTRIBA').AsString) <> ''
       Then qrydesfazTmpDesc2.sql.text := qrydesfazTmpDesc2.sql.text +
                                   ','+qryMotivo.FieldByName('IDMOTIVOCONTRIBA').AsString+')'
       Else qrydesfazTmpDesc2.sql.text := qrydesfazTmpDesc2.sql.text +
                                   ') AND FLGDESCFOLHA   =  ''P'' ';
     try
        qrydesfazTmpDesc2.ExecSQL;
     except
        MsgDlg('Erro ao desfazer registros da tabela de importação!','Erro!',mtError,[MbOk,MbHelp],0);
        RollBackTransacao;
        Exit;
     end;
  end;

  lbMensagens.Lines.Add(TimeToStr(Time)+' - Desfazendo o histórico de rubricas da patrocinadora');
  Application.ProcessMessages;

  // desfaz a gravação na HstRubricaxPess
  qrydesfazHRubxPess.Close;
  qrydesfazHRubxPess.sql.text :=  'DELETE HSTRUBRICAXPESS' +
                                   ' WHERE MESREFERENCIA = '''+sMesCob+''' '+
                                   ' AND IDPESSOA = '''+qryPatroCombo.FieldByName('IDPESSOA').AsString+''' '+
                                   ' AND IDPLANOPREV = '+sPlano+' ';
  try
     qrydesfazHRubxPess.ExecSQL;
  except
     MsgDlg('Erro ao desfazer registros do Histórico de Rubricas da Patrocinadora!','Erro!',mtError,[MbOk,MbHelp],0);
     RollBackTransacao;
     Exit;
  end;

  CommitTransacao;

  lbMensagens.Lines.Add(TimeToStr(Time)+' - Término do processamento');

end;

procedure TfrmGravaTxt.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
  TwCons.Etapa.Pos       := -1;

  if prmLayOutMultiploRecebimento 
  then begin
     dblkpcmbLayOut.Visible := True;
     lblLayOut.Visible      := True;
  end
  else begin
     dblkpcmbLayOut.Visible := False;
     lblLayOut.Visible      := False;
  end;

  If Trim(prmPathAutorRec) <> ''
   Then odTxt.InitialDir := prmPathAutorRec
   Else odTxt.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) ;
end;

procedure TfrmGravaTxt.GravaTmpDescContribuicoesNaoRecebidas(pMesCob : String; pIdMotivo, pIdPessjur : Integer);
var sMesRef, splano : String;

begin


   /// Selecionar campos que indicam não recebimento na tabela CONTPREV
   /// para montar as condições da query  QRYCONTRIBNAORECEBIDAS

   sMesRef  := pMescob;
   sMesRefAux := pMesCob;


   if  dblkPlanoPrev.text <> '' then
       sPlano  := dblkPlanoPrev.LookupValue
   else
       sPlano  := ' C.IDPLANOPREV ';


   qryCriteriosContrib.Close;
   qryCriteriosContrib.sql.text := '  SELECT CO.NOME,C.FLGACEITAOPCAO,  C.IDCONTRIBUICAO,  C.CRITVALORBASE1 '+
                   '        ,C.CRITVALORBASE2, C.CRITVALORBASE3 , C.IDPLANOPREV '+
                   '        ,C.CRITSALARIO ,  C.ORDEMCALCULO '+
                   '        FROM   CONTPREV C, CONTRIBUICAO CO, PATRO '+
                   ' WHERE  C.IDPLANOPREV = '''+splano+''' '+
                   ' AND  ( (C.CRITVALORBASE1 IS NOT NULL)    OR (C.CRITVALORBASE2 IS NOT NULL) '+
                   '        OR (C.CRITVALORBASE3 IS NOT NULL) OR (C.CRITSALARIO IS NOT NULL)   ) AND '+
                   ' CO.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                   ' PATRO.IDPESSOA = '''+IntToStr(pIdPessjur)+''' '+
                   ' UNION '+
                   '  SELECT CO.NOME,C.FLGACEITAOPCAO, C.IDCONTRIBUICAO,  C.CRITVALORBASE1 '+
                   '        ,C.CRITVALORBASE2, C.CRITVALORBASE3, C.IDPLANOPREV '+
                   '        ,C.CRITSALARIO ,   C.ORDEMCALCULO '+
                   ' FROM   CONTPREV C, CONTRIBUICAO CO, PATRO '+
                   ' WHERE  C.IDPLANOPREV = '''+splano+''' '+
                   ' AND  C.FLGPAGADOR = ''C'' AND '+
                   '  CO.FLGOBRIGATORIA = ''O'' AND '+
                   ' C.FLGINTERNO = ''AT'' AND '+
                   ' CO.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND '+
                   ' PATRO.IDPESSOA = '''+IntToStr(pIdPessjur)+''' AND '+
                   ' EXISTS ( SELECT 1 FROM '+
                   ' CONTRIBPREVPARTP WHERE '+
                   ' IDPESSJUR = PATRO.IDPESSOA '+
                   ' AND IDPLANOPREV = C.IDPLANOPREV AND FLGCOBRA = 1 AND '+
                   ' IDCONTRIBUICAO = CO.IDCONTRIBUICAO) '+
                   ' ORDER BY ORDEMCALCULO  ';
   qryCriteriosContrib.Open;



    while not qryCriteriosContrib.EOF do begin


       qryContribNaoRecebidas.Close;
       qryContribNaoRecebidas.Sql.Clear;
       qryContribNaoRecebidas.Sql.add('  SELECT                '+
             '  PP.IDPESSOA, EL.MATRICULA, PP.INSCRICAONUMERO, PP.INSCRICAODATA,  '+
             '  PP.DATACANCELAMENTO, C.IDCONTRIBUICAO, C.NOME,                       '+
             '  DECODE(SUBSTR('''+sMesRef+''' ,6,2),''13'',DECODE(NVL(PP.SALPARTIC13,0),0,NVL(PP.SALPARTICIPACAO,0),NVL(PP.SALPARTIC13,0)),NVL(PP.SALPARTICIPACAO,0)) VALORPROVENTO,  '+ 
             '  CP.IDREGRACALCULO,                                                  '+
             '  CP.IDRUBRICA,CP.FLGACEITAOPCAO,                                   '+
             '  CP.IDREGRACALCULO,                                                          '+
             '  CP.IDREGRAPRIMPAGTO,CP.IDREGRAULTPAGTO,                                       '+
             '  CP.NUMOPCOES,                                                                    '+
             '  CPP.DTPRIMPAGAMENTO,CPP.FLGCOBRA,CPP.FLGDESCFOLHA,            '+
             '  CPP.FLGRECALCULA,CPP.FLGRETROATIVO, CPP.IDADEINGREAL,   '+
             '  CPP.IDCONTRIBUICAO,CPP.IDPESSJUR,CPP.IDPESSOA,CPP.IDPLANOPREV, '+
             '  CPP.QTDEPARCELAS,CPP.SEQPROPOSTA,    '+
             '  NVL(CPP.VALORBASE1,0) AS VALORBASE1,                '+
             '  NVL(CPP.VALORBASE2,0) AS VALORBASE2,             '+
             '  NVL(CPP.VALORBASE3,0) AS VALORBASE3,               '+
             '  NVL(CPP.ASSOC1OP1,0) AS ASSOC1OP1,                '+
             '  NVL(CPP.ASSOC1OP2,0) AS ASSOC1OP2,                 '+
             '  NVL(CPP.ASSOC1OP3,0) AS ASSOC1OP3,                  '+
             '  NVL(CPP.ASSOC2OP1,0) AS ASSOC2OP1,                '+
             '  NVL(CPP.ASSOC2OP2,0) AS ASSOC2OP2,                 '+
             '  NVL(CPP.ASSOC2OP3,0) AS ASSOC2OP3,                 '+
             '  NVL(CPP.ASSOC3OP1,0) AS ASSOC3OP1,                 '+
             '  NVL(CPP.ASSOC3OP2,0) AS ASSOC3OP2,                  '+
             '  NVL(CPP.ASSOC3OP3,0) AS ASSOC3OP3,                 '+
             '  NVL(CPP.VALORASSOCIADO,0) AS VALORASSOCIADO,   '+
             '  NVL(CPP.VALORASSOCIADO,0) AS VALORASSOCIADO1, '+
             '  NVL(CPP.VALORASSOCIADO2,0) AS VALORASSOCIADO2, '+
             '  NVL(CPP.VALORASSOCIADO3,0) AS VALORASSOCIADO3,  '+
             '  EL.DATAADMISSAO,EL.IDSITFUNC,EL.MATRICULA,                                  '+
             '  EL.SALTOTAL,EL.TEMPONAOCREDITADO,EL.TEMPOSERVANTERIOR,                     '+
             '  PP.DTINICIOINSC,PP.INSCRICAODATA,PP.ULTSALMANUT AS RUBMANTIDO,           '+
             '  PP.ULTSALMANUTPARC AS RUBPARCIAL,                                       '+
             '  ST.FLGINTERNO,ST.IDSITPART ,  PF.DATAMORTE, PF.DATANASC,  PF.SEXO, '''+deDataRef.Text+''' DATAREF ,   '+
             '  ''P'' CHAVE , RP.CODPROVDESC  ,   '+
             '  DECODE(TRUNC(PP.DTINICIOINSC) - TRUNC(PP.INSCRICAODATA),0,0,1) AS PARTREINSC '+             
             ' FROM   CONTRIBPREVPARTP CPP,  PARTPREVPLAN PP, ELEGPATRO EL, PESSOAFISICA PF ,     '+
             ' CONTPREV CP, RUBRICAXPESS RP, CONTRIBUICAO C,  SITPART ST                                    '+
             ' WHERE   CPP.IDPESSJUR = '''+IntToStr(pIdPessjur)+''' AND                     '+
             ' CPP.IDPLANOPREV = '''+qryCriteriosContrib.fieldbyname('IDPLANOPREV').AsString+''' AND                      '+
             ' CPP.IDPESSOA = CPP.IDPESSOA AND                                        '+
             ' CPP.IDCONTRIBUICAO = '''+qryCriteriosContrib.fieldbyname('IDCONTRIBUICAO').AsString+'''  '+
             ' AND    TO_CHAR(CPP.DATAINICIO, ''YYYY/MM'')   <= '''+pMesCob+'''                '+
             ' AND    ((TO_CHAR(CPP.DATAFINAL , ''YYYY/MM'')    > '''+pMesCob+''' )           '+
             '        OR (CPP.DATAFINAL IS NULL) )                                   '+
             ' AND    CPP.FLGCOBRA = 1                                                 '+
             ' AND NOT EXISTS (SELECT 1 FROM  TMPDESC HS                      '+
             '    WHERE HS.MESCOBRANCA = '''+pMesCob+''' AND                               '+
             '          HS.MESREFERENCIA = '''+sMesRef+''' AND                           '+
             '          HS.IDPESSJUR = CPP.IDPESSJUR AND                       '+
             '          HS.IDPLANOPREV = CPP.IDPLANOPREV AND                 '+
             '          HS.IDPESSOA = CPP.IDPESSOA AND                       '+
             '          HS.IDDESCONTO = CPP.IDCONTRIBUICAO )           '+
             ' AND NOT EXISTS (SELECT 1 FROM  HSTCONTRIBPREV HS                      '+
             '    WHERE HS.MESCOBRANCA = '''+pMesCob+''' AND                               '+
             '          HS.MESREFERENCIA = '''+sMesRef+''' AND                           '+
             '          HS.IDPESSJUR = CPP.IDPESSJUR AND                       '+
             '          HS.IDPLANOPREV = CPP.IDPLANOPREV AND                 '+
             '          HS.IDPESSOA = CPP.IDPESSOA AND                       '+
             '          HS.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO )           '+
             ' AND    PP.IDPESSJUR       = CPP.IDPESSJUR                     '+
             ' AND    PP.IDPLANOPREV     = CPP.IDPLANOPREV                      '+
             ' AND    PP.IDPESSOA        = CPP.IDPESSOA                         '+
             ' AND    PP.SEQPROPOSTA     = CPP.SEQPROPOSTA                       '+
             ' AND    TO_CHAR(PP.INSCRICAODATA, ''YYYY/MM'')   <= '''+pMesCob+'''       '+
             ' AND    ( (TO_CHAR(PP.DATACANCELAMENTO, ''YYYY/MM'') > '''+pMesCob+''' )      '+
             '           OR (PP.DATACANCELAMENTO IS NULL ) )                   '+
             ' AND NOT EXISTS (SELECT 1 FROM BENEFBFCIARIO                   '+
             '        WHERE IDPLANOPREV = '''+qryCriteriosContrib.fieldbyname('IDPLANOPREV').AsString+''' AND                               '+
             '        IDTITULAR = CPP.IDPESSOA AND                             '+
             '        IDPESSJUR = '''+IntToStr(pIdPessjur)+''' AND                                             '+
             '        IDPESSOA = CPP.IDPESSOA AND                                   '+
             '        SEQPROPOSTA = 1 AND                                           '+
             '        ((TO_CHAR(DATAFINAL,''YYYY/MM'') >= '''+pMesCob+''' OR                 '+
             '        DATAFINAL IS NULL ) AND TO_CHAR(DATAINICIO,''YYYY/MM'') <= '''+pMesCob+''' )  '+
             '         )                                               '+
             ' AND    EL.IDPESSJUR       = PP.IDPESSJUR              '+
             ' AND    EL.IDPESSOA        = PP.IDPESSOA             '+
             ' AND    PF.IDPESSOA       = PP.IDPESSOA        '+
             ' AND    C.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO       '+
             ' AND    CP.IDPLANOPREV     = '''+qryCriteriosContrib.fieldbyname('IDPLANOPREV').AsString+'''         '+
             ' AND    CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO    '+
             ' AND    RP.IDRUBRICA =  CP.IDRUBRICA  '+
             ' AND    RP.IDPESSOA =  EL.IDPESSJUR  '+
             ' AND    ST.IDSITPART = PP.IDSITPART   ');

             //VERIFICA SE DEVE FAZER CRÍTICA DE OPÇÕES


             if trim(qryCriteriosContrib.FieldByName('CRITVALORBASE1').AsString) <> '' then begin
                qryContribNaoRecebidas.Sql.add(' AND (CPP.' +qryCriteriosContrib.FieldByName('CRITVALORBASE1').AsString+') ');
             end;
             if trim(qryCriteriosContrib.FieldByName('CRITVALORBASE2').AsString) <> '' then begin
                qryContribNaoRecebidas.Sql.add(' AND (CPP.' +qryCriteriosContrib.FieldByName('CRITVALORBASE2').AsString+') ');
             end;
             if trim(qryCriteriosContrib.FieldByName('CRITVALORBASE3').AsString) <> '' then begin
                qryContribNaoRecebidas.Sql.add(' AND (CPP.' +qryCriteriosContrib.FieldByName('CRITVALORBASE3').AsString+') ');
             end;
             if trim(qryCriteriosContrib.FieldByName('CRITSALARIO').AsString) <> '' then begin
                qryContribNaoRecebidas.Sql.add(' AND (DECODE(SUBSTR('''+sMesRef+''' ,6,2),''13'',PP.SALPARTIC13,PP.SALPARTICIPACAO) '+
                                                ' ' +qryCriteriosContrib.FieldByName('CRITSALARIO').AsString+') ');
             end;

       qryContribNaoRecebidas.Open;


       if not   qryContribNaoRecebidas.isempty then
       begin

          /// Inserir os participantes que estão na QRYCONTRIBNAORECEBIDAS
          /// com VALORESPERADO calculado na regra e VALORRECEBIDO = ZERO
          Regra.QueryIn := qryContribNaoRecebidas;
          Regra.RuleName := qryContribNaoRecebidas.FieldByName('IDREGRACALCULO').AsString;
          //Regra.PassoaPasso;
          Regra.LimpaVariaveis; 
          Regra.Execute;
       end;


       qryCriteriosContrib.Next;

       //verifica se é o mês de cobrança do décimo terceiro
       if (bCobra13) and (qryCriteriosContrib.eof)  then
       begin
          qryCriteriosContrib.first;
          sMesRef := copy(pMesCob,0,5)+'13';
          sMesRefAux := copy(pMesCob,0,5)+'13';
          bCobra13 := False;
       end;


    end;


end;




procedure TfrmGravaTxt.GravaTmpDescContribuicoesNaoEsperadas;
begin
    qrycontribuicoesRecebidasNaoEsperadas.ParamByName('PDATAREF').AsString   := deDataRef.Text;
    qrycontribuicoesRecebidasNaoEsperadas.ParamByName('IDPESSJUR').AsInteger := qryPatroCombo.FieldByName('IDPESSOA').AsInteger;
    qrycontribuicoesRecebidasNaoEsperadas.ParamByName('MESCOB').AsString     := Copy(deDataRef.Text,7,4)+'/'+Copy(deDataRef.Text,4,2);
    qryContribuicoesRecebidasNaoEsperadas.Open;
    qryContribuicoesRecebidasNaoEsperadas.First;
    while not qryContribuicoesRecebidasNaoEsperadas.EOF do
    begin
        InsereTmpDesc(qryContribuicoesRecebidasNaoEsperadas,
                      0,
                      qryContribuicoesRecebidasNaoEsperadas.FieldByName('ValorRecebido').AsFloat,
                      qryContribuicoesRecebidasNaoEsperadas.FieldByName('MESREFERENCIA').AsString,
                      qryContribuicoesRecebidasNaoEsperadas.FieldByName('MESCOBRANCA').AsString,
                      liIdLote,
                      qryMotivo.FieldByName('IDMOTIVOCONTRIBP').AsInteger,
                      StrToDateTime(deDataRef.Text));
        qryContribuicoesRecebidasNaoEsperadas.Next;
    end;
end;

procedure TfrmGravaTxt.edTxtChange(Sender: TObject);
begin
  inherited;
  edTxt.Hint := edTxt.Text;
  if (edtxt.Font.Size * length(edtxt.text)) > edtxt.Width then
     edTxt.ShowHint := true
  else
  edTxt.ShowHint := false;
end;

procedure TfrmGravaTxt.GravaErrosCCP(iIdControle, iIdPessjur: integer;
                                     sMsgExplicativa, sMatricula, sCodProvento, sDataRef: string;
                                     fValor: Real; sIdContribuicao, sMesCobranca, sLinhaCrit :String);
begin
   with qryErrosCCP do begin
      ParamByName('pIdControle').AsInteger := iIdControle;
      ParamByName('pMatricula').AsString := sMatricula;
      ParamByName('pCodProvento').AsString := sCodProvento;
      ParamByName('pDataRef').AsString := sDataRef;
      ParamByName('pValor').AsFloat := fValor;
      ParamByName('pMsgExplicativa').AsString := copy(sMsgExplicativa,0,54);
      ParamByName('pNomePatroc').AsString := Copy(qryPatroCombo.FieldByName('NOME').AsString,1,30); 
      ParamByName('pIdPessjur').AsInteger := iIdPessjur;
      ParamByName('pIdContribuicao').AsString := sIdContribuicao;
      ParamByName('pMesCobranca').AsString := sMesCobranca;
      try
        execsql;
      except
      end;
   end;

   if (chkbad.checked) and (trim(sLinhaCrit) <> '')
   then  WriteLn(bad,sLinhaCrit);
end;

function TfrmGravaTxt.MontaQueryBuscaIdPessoa: Boolean;
begin
  Result := True;

  if qryDadosArquivo.FieldByName('IDPARTRUBRICA').AsInteger = 1 then
  begin
    with qryBuscaIdPessoa do
    begin
      Close;
      SQL.Clear;

      SQL.Add('SELECT EP.IDPESSOA, EP.IDPESSJUR, EP.MATRICULA, P.IDPLANOPREV, P.INSCRICAONUMERO');
      SQL.Add('FROM   ELEGPATRO EP, PARTPREVPLAN P');
      SQL.Add('WHERE (P.INSCRICAONUMERO LIKE ''@%'')');
      SQL.Add('AND   (EP.IDPESSJUR      = :CODPATRO)');
      SQL.Add('AND   (P.IDPESSJUR       = EP.IDPESSJUR)');
      SQL.Add('AND   (P.IDPESSOA        = EP.IDPESSOA)');
      SQL.Add('AND   (P.FLGDESATIVADO   = 0)');
    end;
  end
  else
  begin
    with qryBuscaIdPessoa do
    begin
      Close;
      SQL.Clear;

      SQL.Add('SELECT EP.IDPESSOA, EP.IDPESSJUR, EP.MATRICULA, NVL(P.IDPLANOPREV, 0) AS IDPLANOPREV, P.INSCRICAONUMERO');
      SQL.Add('FROM   ELEGPATRO EP, PARTPREVPLAN P');
      SQL.Add('WHERE (EP.MATRICULA       LIKE ''@%'')');
      SQL.Add('AND   (EP.IDPESSJUR       = :CODPATRO)');
      SQL.Add('AND   (P.IDPESSJUR(+)     = EP.IDPESSJUR)');
      SQL.Add('AND   (P.IDPESSOA(+)      = EP.IDPESSOA)');
      SQL.Add('AND   (P.FLGDESATIVADO(+) = 0)');
    end;
  end;

  //Criando o(s) Parâmetro(s);
  with qryBuscaIdPessoa do
  begin
    Params.Clear;
    Params.CreateParam(ftInteger, 'CODPATRO', ptInput);
  end;

  try
   qryBuscaIdPessoa.Prepare;
   except
    Result := False;
  end;
end;

function TfrmGravaTxt.BuscaIdPessoa(const sValorChave: string; const lIdPessoa: LongInt): Boolean;
var
 i: Integer;
begin
  Result := True;

  with qryBuscaIdPessoa do
  begin
    Close;

    for i := 0 to SQL.Count - 1 do
     if Pos('WHERE', SQL[i]) > 0 then
     begin
       if qryDadosArquivo.FieldByName('IDPARTRUBRICA').AsInteger = 1 then
        SQL[i] := 'WHERE (P.INSCRICAONUMERO LIKE ''' + sValorChave + '%'')'
       else
        SQL[i] := 'WHERE (EP.MATRICULA      LIKE ''' + sValorChave + '%'')';
       Break;
     end;

    ParamByName('CODPATRO').AsInteger  := lIdPessoa;
    try
     Open;
     except
      Result := False;
    end;
  end;
end;

procedure TfrmGravaTxt.deDataRefChange(Sender: TObject);
begin
  inherited;
  deDataCob.Date := deDataRef.Date;
end;


function TfrmGravaTxt.TiraZerosEsquerda(stexto : string) : string;
begin
  while copy(sTexto,1,1) = '0' do
    delete(sTexto,1,1);
  result:=sTexto;
end;


function TfrmGravaTxt.CompletaString(sEnt, sComp : String ; nTam : Integer ; bDireita : Boolean ) : String;
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




procedure TfrmGravaTxt.bbtnRelClick(Sender: TObject);
begin

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

  with dtmRelatorios do
  begin
     lbltitulocriticas.caption := 'Críticas do Interface - Mês: '+copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2)+' ';

     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
     qryFundacao.Open;

     qryErrosInterface.Close;
     qryErrosInterface.SQL.Clear;
     qryErrosInterface.SQL.Add(' SELECT T.IDCONTROLE, T.CODPROVENTO , T.VALOR, T.NOMEPATROC, T.DESCSITFUNC, '+
                               ' T.MATRICULA,T.DATAREF, T.MSGEXPLICATIVA, C.NOME '+
                               ' FROM TABERROSCCP T, CONTRIBUICAO C '+
                               ' WHERE T.IDPESSJUR = '''+qrypatrocombo.fieldbyname('idpessoa').AsString+''' AND '+
                               ' T.MESCOBRANCA = '''+copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2)+''' AND '+
                               ' T.IDCONTRIBUICAO = C.IDCONTRIBUICAO(+) '+
                               ' ORDER BY T.IDCONTROLE,T.CODPROVENTO, T.MATRICULA ');
     qryErrosInterface.Open;
     rpErrosInterface.ModalPreview := False;
     rpErrosInterface.ModalCancelDialog := False;
     rpErrosInterface.Print;
  end;

end;

procedure TfrmGravaTxt.bbtnBacaClick(Sender: TObject);
var iPatro : Integer;
begin
  inherited;
  PageControl1.ActivePage := tbDiverg;
  qryTxt.DatabaseName := ExtractFilePath(edTxt.Text);
  iPatro       :=StrToInt(qrypatrocombo.fieldbyname('idpessoa').AsString);
  qryDadosArquivo.Close;
  qryDadosArquivo.ParamByName('CODPATRO').AsInteger := iPatro;
  qryDadosArquivo.Open;

  with qryTxt do begin
     SQL.Clear;
     SQL.Add(' SELECT DBF.VALORCHAVE, DBF.VALORPROVE , DBF.PROVENTO ');
     SQL.Add(' FROM  TMPTXT DBF '+
             ' WHERE DBF.PROVENTO LIKE ''%780%''  ');
     SQL.Add('ORDER BY DBF.VALORCHAVE');

     Open;
     if isEmpty then begin
        showmessage('nenhum registro selecionado!');
        Exit;
     end;
  end;


  while not qrytxt.eof do

  begin
     qrybuscapessoa.close;
     qrybuscapessoa.sql.text := ' SELECT PP.IDPESSOA , PP.IDPLANOPREV '+
                                ' FROM PARTPREVPLAN PP, ELEGPATRO EL  '+
                                ' WHERE PP.IDPESSJUR = '+IntToStr(iPatro)+' AND  '+
                                ' PP.IDPLANOPREV = PP.IDPLANOPREV AND   '+
                                ' PP.IDPESSOA = PP.IDPESSOA AND  '+
                                ' EL.IDPESSJUR = PP.IDPESSJUR AND  '+
                                ' EL.IDPESSOA = PP.IDPESSOA AND  '+
                                ' EL.MATRICULA = '''+IntToStr(qryTXT.FieldByName('VALORCHAVE').AsInteger)+''' ';
     qrybuscapessoa.sql.text := qrybuscapessoa.sql.text +  ' ORDER BY PP.INSCRICAODATA DESC  ';
     qrybuscapessoa.open;

     if qrybuscapessoa.isempty then
     begin
        mmDivergencias.Lines.Add(qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Participante não encontrado.'+
                                 ' Valor '+ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString))+'.');
     end
     else
     begin
        qryaux.close;
        qryaux.sql.Text := ' SELECT 1 FROM TMPDESC WHERE '+
                           ' IDPESSJUR = '''+IntToStr(iPatro)+''' '+
                           ' AND IDPLANOPREV = '''+qrybuscapessoa.fieldbyname('IDPLANOPREV').AsString+''' '+
                           ' AND IDPESSOA = '''+qrybuscapessoa.fieldbyname('IDPESSOA').AsString+''' '+
                           ' AND MESCOBRANCA = '''+copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2)+''' '+
                           ' AND RTRIM(LTRIM(CODPROVDESC)) = ''780'' ';
        qryaux.open;

        if qryaux.isempty then
        begin
           mmDivergencias.Lines.Add(qryTXT.FieldByName('VALORCHAVE').AsString+ ' - Não encontrado na TMPDESC.'+
                                    ' Valor '+ClienteNumero(ConvValor(qryTxt.FieldByName('VALORPROVE').AsString))+'.');
        end;
     end;


     qrytxt.next;
  end;

  showmessage('terminou!');
end;


function TfrmGravaTxt.MontaLinhaArqBad(qryTxt : TwwQuery) : String;
var sLinha : String;
begin
   Result := '';
   sLinha := '';

   //linha em branco com tamanho de 200
   //para substituir com os valores em seus respectivos lugares
   sLinha := completastring(' ',' ',200,True);


   if qryDadosArquivo.FieldByName('FLGLANCAMENTO').AsString = 'S' then begin
      if Trim(qryDadosArquivo.FieldByName('POSLANCAMENTO').AsString) <> '1000' then begin
         sLinha := copy(sLinha,1,qryDadosArquivo.FieldByName('POSLANCAMENTO').AsInteger) +
                   completastring(qrytxt.fieldbyname('LANCAMENTO').AsString,' ',1,True) +
                   copy(sLinha,qryDadosArquivo.FieldByName('POSLANCAMENTO').AsInteger + 1 + 1,
                        length(sLinha) - qryDadosArquivo.FieldByName('POSLANCAMENTO').AsInteger );
      end;
   end;


   if Trim(qryDadosArquivo.FieldByName('INICIOSEQINTERFA').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,qryDadosArquivo.FieldByName('INICIOSEQINTERFA').AsInteger) +
                completastring(qrytxt.fieldbyname('SEQINTERFA').AsString,' ',qryDadosArquivo.FieldByName('SEQINTERFA').AsInteger,True) +
                copy(sLinha,qryDadosArquivo.FieldByName('INICIOSEQINTERFA').AsInteger + qryDadosArquivo.FieldByName('SEQINTERFA').AsInteger + 1,
                     length(sLinha) - qryDadosArquivo.FieldByName('INICIOSEQINTERFA').AsInteger );
   end;


   if Trim(qryDadosArquivo.FieldByName('INIPATRO').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,qryDadosArquivo.FieldByName('INIPATRO').AsInteger) +
                completastring(qrytxt.fieldbyname('PATRO').AsString,' ',qryDadosArquivo.FieldByName('PATRO').AsInteger,True) +
                copy(sLinha,qryDadosArquivo.FieldByName('INIPATRO').AsInteger + qryDadosArquivo.FieldByName('PATRO').AsInteger + 1,
                     length(sLinha) - qryDadosArquivo.FieldByName('INIPATRO').AsInteger );
   end;


   if Trim(qryDadosArquivo.FieldByName('INIPLANO').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,qryDadosArquivo.FieldByName('INIPLANO').AsInteger) +
                completastring(qrytxt.fieldbyname('PLANO').AsString,' ',qryDadosArquivo.FieldByName('PLANO').AsInteger,True) +
                copy(sLinha,qryDadosArquivo.FieldByName('INIPLANO').AsInteger + qryDadosArquivo.FieldByName('PLANO').AsInteger + 1,
                     length(sLinha) - qryDadosArquivo.FieldByName('INIPLANO').AsInteger );
   end;


   if Trim(qryDadosArquivo.FieldByName('INIMESREF').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,qryDadosArquivo.FieldByName('INIMESREF').AsInteger) +
                completastring(qrytxt.fieldbyname('MESREF').AsString,' ',qryDadosArquivo.FieldByName('MESREF').AsInteger,True) +
                copy(sLinha,qryDadosArquivo.FieldByName('INIMESREF').AsInteger +  qryDadosArquivo.FieldByName('MESREF').AsInteger + 1,
                     length(sLinha) - qryDadosArquivo.FieldByName('INIMESREF').AsInteger );
   end;


   if Trim(qryDadosArquivo.FieldByName('INIDATAREF').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,qryDadosArquivo.FieldByName('INIDATAREF').AsInteger) +
                completastring(qrytxt.fieldbyname('DATAREF').AsString,' ',qryDadosArquivo.FieldByName('DATAREF').AsInteger,True) +
                copy(sLinha,qryDadosArquivo.FieldByName('INIDATAREF').AsInteger + qryDadosArquivo.FieldByName('DATAREF').AsInteger + 1,
                     length(sLinha) - qryDadosArquivo.FieldByName('INIDATAREF').AsInteger );
   end;


   if Trim(qryDadosArquivo.FieldByName('INIPROVENTO').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,qryDadosArquivo.FieldByName('INIPROVENTO').AsInteger) +
                completastring(qrytxt.fieldbyname('PROVENTO').AsString,' ',qryDadosArquivo.FieldByName('PROVENTO').AsInteger,True) +
                copy(sLinha,qryDadosArquivo.FieldByName('INIPROVENTO').AsInteger + qryDadosArquivo.FieldByName('PROVENTO').AsInteger + 1,
                     length(sLinha) - qryDadosArquivo.FieldByName('INIPROVENTO').AsInteger );
   end;


   if Trim(qryDadosArquivo.FieldByName('INITIPOCHAVE').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,qryDadosArquivo.FieldByName('INITIPOCHAVE').AsInteger) +
                completastring(qrytxt.fieldbyname('TIPOCHAVE').AsString,' ',qryDadosArquivo.FieldByName('TIPOCHAVE').AsInteger,True) +
                copy(sLinha,qryDadosArquivo.FieldByName('INITIPOCHAVE').AsInteger + qryDadosArquivo.FieldByName('TIPOCHAVE').AsInteger + 1,
                     length(sLinha) - qryDadosArquivo.FieldByName('INITIPOCHAVE').AsInteger );
   end;


   if Trim(qryDadosArquivo.FieldByName('INIVALORCHAVE').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,qryDadosArquivo.FieldByName('INIVALORCHAVE').AsInteger) +
                completastring(qrytxt.fieldbyname('VALORCHAVE').AsString,' ',qryDadosArquivo.FieldByName('VALORCHAVE').AsInteger,True) +
                copy(sLinha,qryDadosArquivo.FieldByName('INIVALORCHAVE').AsInteger + qryDadosArquivo.FieldByName('VALORCHAVE').AsInteger + 1,
                     length(sLinha) - qryDadosArquivo.FieldByName('INIVALORCHAVE').AsInteger );
   end;


   if Trim(qryDadosArquivo.FieldByName('INIVALORPART').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,qryDadosArquivo.FieldByName('INIVALORPART').AsInteger) +
                completastring(qrytxt.fieldbyname('VALORPART').AsString,' ',qryDadosArquivo.FieldByName('VALORPART').AsInteger,True) +
                copy(sLinha,qryDadosArquivo.FieldByName('INIVALORPART').AsInteger + qryDadosArquivo.FieldByName('VALORPART').AsInteger + 1,
                     length(sLinha) - qryDadosArquivo.FieldByName('INIVALORPART').AsInteger );
   end;


   if Trim(qryDadosArquivo.FieldByName('INIVALORPROVE').AsString) <> '1000' then begin
      sLinha := copy(sLinha,1,qryDadosArquivo.FieldByName('INIVALORPROVE').AsInteger) +
                completastring(qrytxt.fieldbyname('VALORPROVE').AsString,' ',qryDadosArquivo.FieldByName('VALORPROVE').AsInteger,True) +
                copy(sLinha,qryDadosArquivo.FieldByName('INIVALORPROVE').AsInteger + qryDadosArquivo.FieldByName('VALORPROVE').AsInteger+ 1,
                     length(sLinha) - qryDadosArquivo.FieldByName('INIVALORPROVE').AsInteger );
   end;


   Result := sLinha;


end;

function TfrmGravaTxt.ExisteSalPart(iRubrica: Integer; sMes, sMesCobranca, sIdPessjur,
  sIdRubrica, sIdMotivo, sReferencia, sIdPessoa, sSeqRubrica, sValor,
  sSql: String): String;
begin
 Result := sSql;

 If iRubrica = qryRubricasPatro.FieldByName('IDRUBSALPARTICIP').AsInteger
  Then Begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT 1 FROM HISTRUBSAL '+
                   ' WHERE IDPESSJUR   = '+sIdPessjur+
                   ' AND   IDPESSOA    = '+sIdPessoa+
                   ' AND   IDRUBRICA   = '+sIdRubrica+
                   ' AND   MESCOBRANCA = '+QuotedStr(sMesCobranca));
    qryAux.Open;

    If not qryAux.IsEmpty
     Then Begin
          Result := 'UPDATE HISTRUBSAL '+
                    'SET VALORPROVENTO = '+sValor+
                    ' WHERE MES  = '+QuotedStr(sMes)+
                    '   AND MESCOBRANCA = '+QuotedStr(sMesCobranca)+
                    '   AND IDPESSJUR = '+sIdPessjur+
                    '   AND IDRUBRICA = '+sIdRubrica+
                    '   AND IDMOTIVO = '+sIdMotivo+
                    '   AND REFERENCIA = '+QuotedStr(sReferencia)+
                    '   AND IDPESSOA = '+sIdPessoa+
                    '   AND SEQRUBRICA = '+sSeqRubrica;
     End;
  End;
end;

procedure TfrmGravaTxt.deDataRefExit(Sender: TObject);
var
  vHoje: TDateTime;
  vAno, vMes, vdia : Word;
begin
  inherited;
  vHoje := Now;
  DecodeDate(vHoje, vAno, vMes, vDia);

  If Trim(deDataRef.Text) = ''
   Then Exit;

  If ((vAno - StrToInt(Copy(deDataRef.Text,7,4)) > 4) and
      (vAno - StrToInt(Copy(deDataRef.Text,7,4)) < -2))
  Then Begin
     ShowMessage('Atenção!! Ano Inválido!!');
     deDataRef.SetFocus;
  End;
end;

procedure TfrmGravaTxt.deDataCobExit(Sender: TObject);
var
  vHoje: TDateTime;
  vAno, vMes, vdia : Word;
begin
  inherited;
  vHoje := Now;
  DecodeDate(vHoje, vAno, vMes, vDia);

  If Trim(deDataCob.Text) = ''
   Then Exit;

  If ((vAno - StrToInt(Copy(deDataCob.Text,7,4)) > 4) and
      (vAno - StrToInt(Copy(deDataCob.Text,7,4)) < -2))
  Then Begin
     ShowMessage('Atenção!! Ano Inválido!!');
     deDataCob.SetFocus;
  End;
end;

function TfrmGravaTxt.DecMesReferencia(sMesReferencia: String): String;
Var
  dMes : Double;
  dAno : Double;
begin
  dAno := StrToInt(copy(sMesReferencia, 1, 4));
  dMes := StrToInt(copy(sMesReferencia, 6, 2));

  If (dMes-1) > 0
   Then dMes := dMes-1
   Else Begin
     dMes := 12;
     dAno := dAno - 1;
   End;

  Result := FormatFloat('0000',dano)+'/'+FormatFloat('00',dMes)
end;

function TfrmGravaTxt.VerificaImportAnterior(sIdPessjur,sMesCob : String ; var sUltRubrica : String) : Boolean;
begin

   with qryaux do begin
      SQL.Clear;
      SQL.Add(' SELECT MAX(CODPROVDESC) CODPROVDESC '+
              ' FROM  TMPDESC '+
              ' WHERE MESCOBRANCA = '''+sMesCob+''' '+
              ' AND IDPESSJUR = '''+sIdpessjur+''' '+
              ' AND IDMODULO = 32 ');
      Open;
   end;

   if trim(qryaux.fieldbyname('CODPROVDESC').AsString) <> '' then
   begin
      result := true;
      sUltRubrica := qryaux.fieldbyname('CODPROVDESC').AsString;
   end
   else
   begin
      result := false;
      sUltRubrica := '';
   end;
end;

procedure TfrmGravaTxt.odTxtCanClose(Sender: TObject;
  var CanClose: Boolean);
Var
 sPath : String;
begin
  inherited;
  If odTxt.InitialDir = odTxt.FileName
   Then sPath := prmPathAutorRec
   Else sPath := Copy(ExtractFilePath(odTxt.FileName),1, Length(ExtractFilePath(odTxt.FileName))-1) ;

  CanClose := True;

  If (Trim(prmPathAutorRec) <> '') And (sPath <> prmPathAutorRec )
   Then Begin
     MsgDlg('O local do arquivo escolhido não é autorizado.'+#13+
            'Escolha arquivos somente do endereço: '+prmPathAutorRec+'.','Aviso',mtWarning,[mbOk],0);
     CanClose := False;
   End;
end;

procedure TfrmGravaTxt.od(Sender: TObject);
begin
  inherited;
  //Henrique Massão
  odTxt.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

end.
