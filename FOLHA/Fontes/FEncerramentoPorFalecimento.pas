// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------
//Nº SIG.....: SIG23673
//Data.......: 29/04/2019
//Responsável: Osni Cavalcante, André Imakawa, Fernando Xavier
//Descrição..: Melhoria na funcionalidade
//--------------------------------------------------------------------------------
//Alteração  : consultarRubricasTratadas, processarAcertorRubricasMensais
//             consultarRubricasAbonoTaxaAdm, processarAcertoAbonoAnualTaxaAdm
//Nº SIG.....: 70668
//Data.......: 18/07/2018
//Responsável: Andre Imakawa
//Descrição..: Erro para identificar o Idcontribuição.
//--------------------------------------------------------------------------------
//Nº SIG.....: SIG TIBERO
//Data.......: 21/02/2018
//Responsável: Everson Luiz Pereira da Cunha
//Descrição..: Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//             Retirada de INDEX, +rule etc.
//             Melhoria realizada para adaptação ao TIBERO.
//--------------------------------------------------------------------------------
//Alteração  : processarAcertoAbonoAnualFuncef
//Nº SIG.....: 34692
//Data.......: 06/12/2016
//Responsável: Andre Imakawa
//Descrição..: Erro "is not a valid floating point value"
//--------------------------------------------------------------------------------
//Pendência   : SOL 229906 PPM 345184
//Responsável : Fernando Xavier - BSB
//Data        : 08/04/2014
//Descrição   : Sistema não grava a identificação do lote ao gerar o encerramento
//              do benefício por falecimento
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748/14312 KINTANA 1988667
//Responsável : Fernando Xavier - BSB
//Data        : 10/03/2013
//Descrição   : Alteração solicitada pelo Gestor Leandro - DataInicio da tabela
//              Rubrica individual deve ser o primeiro dia do ano e mes de pagamento
//              do lote.
//              A Flag FLGCONTROLASALDO da rubricaindiv deve ser sempre (0)zero
//              O campo VLRSALDOINICIAL da rubricaindiv deve ser null
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748/14312 KINTANA 1988667
//Responsável : FELIPE AZEVEDO DOS SANTOS
//Data        : 08/05/2013
//Descrição   : Correção de erro de constraint, quando efetuava o insert na tabela
//              HSTBENEFBFCIARIO estava passando o IDPLANOORIGEM errado.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 31/08/2012
//Descrição   : Alteração das rotinas de lançamento de registros na HSTBENEFBFCIARIO.
// O campo IDPLANOORIGEM estava sendo gravado com o mesmo valor do campo IDPLANOPREV.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 21/06/2012
//Descrição   : Alteração da rotina de programação de rubricas individuais para gravar
//      no campo FLGPENSAOALIM o mesmo valor encontrado na HISTRUBSAL
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 06/05/2011
//Descrição   : Alteração da rotina de programação de rubricas individuais para gravar
//      no campo IDMOTIVO com valor = 30151 para que os registros gerados na rotina
//      de encerramento possam ser identificados no processamento da prévia
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 27/04/2011
//Descrição   : Alteração da rotina de programação de rubricas individuais para inserir
//      no campo ANOMESREF o mesmo mês inserido no campo MESREFERENCIA da HSTBENEFBFCIARIO
//              Alteração da rotina de busca da rubrica de desconto para nao buscar
//      rubricas com estato = Bloqueada (FLGESTADORUB=2)
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 14/02/2012
//Descrição   : Correção solicitada pela GEPAB:
//    -Alterar valor do campo HSTBENEFBFCIARIO.FLGDEVOLUCAO para zero quando o
//      valor lançado for igual a 0,001
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 26/01/2012
//Descrição   : Novo merge com código da versão de produção da fábrica
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 13/06/2011
//Descrição   : Alteração da rotina de pagamento da taxa administrativa sobre
//              o abono anual.
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 06/05/2011
//Descrição   : Alteração da rotina de programação de rubricas individuais para gravar
//      no campo IDMOTIVO com valor = 30151 para que os registros gerados na rotina
//      de encerramento possam ser identificados no processamento da prévia
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 27/04/2011
//Descrição   : Alteração da rotina de programação de rubricas individuais para inserir
//      no campo ANOMESREF o mesmo mês inserido no campo MESREFERENCIA da HSTBENEFBFCIARIO
//              Alteração da rotina de busca da rubrica de desconto para nao buscar
//      rubricas com estato = Bloqueada (FLGESTADORUB=2)
//--------------------------------------------------------------------------------
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 14/04/2011
//Descrição   : Alteração rotina de tratamento do Abono Funcef - busca do valor
//      atualizado do provento considerando data de falecimento do beneficiário
//--------------------------------------------------------------------------------
//Pendência   : SOL 136748 KINTANA 821023
//Responsável : MARCIO DENILSON
//Data        : 25/01/2011
//Descrição   : Desenvolvimento inicial da tela
//--------------------------------------------------------------------------------

unit FEncerramentoPorFalecimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, wwdbdatetimepicker,
  CMDateTimePicker, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, uCMMath,
  Wwdbgrid, usistema, wwstorep, DBCtrls, wwdblook, ComCtrls;

type
  TfrmEncerramentoPorFalecimento = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label1: TLabel;
    MSBenef: TMontaSelect;
    Panel3: TPanel;
    dbgrdLista: TwwDBGrid;
    dsLista: TwwDataSource;
    qryLista: TwwQuery;
    updLista: TUpdateSQL;
    qryAux: TwwQuery;
    qryRub: TwwQuery;
    qryRubAcaoJud: TwwQuery;
    SP_PROC: TwwStoredProc;
    qryLista_CTRL: TwwQuery;
    DsLista_CTRL: TwwDataSource;
    BtnDesfazer: TBitBtn;
    qryListaPROCESSAR: TFloatField;
    qryListaIDPESSOA: TFloatField;
    qryListaMATRICULA: TStringField;
    qryListaNOME: TStringField;
    qryListaDATAFALECIMENTO: TDateTimeField;
    qryListaDATAINCLUSAOEVENTO: TDateTimeField;
    qryListaUSUARIOINCLUSAOEVENTO: TStringField;
    qryListaFLGSITUACAO: TStringField;
    qryListaDATAEVENTO: TDateTimeField;
    qryListaDATADESFAZIMENTO: TDateTimeField;
    qryListaDATAPROCESSAMENTO: TDateTimeField;
    SP_DESFAZPROC: TwwStoredProc;
    qryListaIFLGSITUACAO: TFloatField;
    Panel4: TPanel;
    Label3: TLabel;
    pnlgrid: TPanel;
    btnSelTudo: TBitBtn;
    PageControlFiltro: TPageControl;
    TabPessoa: TTabSheet;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    edtMatricula: TEdit;
    edtTitular: TEdit;
    btnProcurar: TBitBtn;
    edtPlanoPrevidenciario: TEdit;
    edtPatrocinadora: TEdit;
    TabData: TTabSheet;
    TabLista: TTabSheet;
    GroupBoxData: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    dtInicio: TCMDateTimePicker;
    lbl2: TLabel;
    dtFim: TCMDateTimePicker;
    lbl3: TLabel;
    btnFiltrar: TBitBtn;
    GroupBoxLista: TGroupBox;
    wdblkpcmb1: TwwDBLookupCombo;
    lbl1: TLabel;
    rbNaoProcessadas: TRadioButton;
    rbprocessadas: TRadioButton;
    rbtodas: TRadioButton;
    rbParcialmente: TRadioButton;
    SP_AJUSTASITUACAOLISTA: TwwStoredProc;
    btnDesMarcarTudo: TBitBtn;
    lblFiltroGrid: TLabel;
    chkProcessados: TCheckBox;
    chkNaoProcessados: TCheckBox;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryListaAfterScroll(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure wdblkpcmb1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BtnReprocClick(Sender: TObject);
    procedure BtnDesfazerClick(Sender: TObject);
    procedure dbgrdListaFieldChanged(Sender: TObject; Field: TField);
    procedure wdblkpcmb1Enter(Sender: TObject);
    procedure btnSelTudoClick(Sender: TObject);
    procedure btnDesMarcarTudoClick(Sender: TObject);
    procedure chkProcessadosClick(Sender: TObject);
    procedure chkNaoProcessadosClick(Sender: TObject);

  private
    { Private declarations }

    iTipoConsulta : Integer;
    iIdLista : Real;
    iValidaGrid: Boolean;

    sDataPagLoteRubIndiv : string; // SOL 136748/14312 KINTANA 1988667 Fernando Xavier 10/03/2013 - BSB

    procedure consultar(sIdPessoa: String = ''; sIdPlanoPrev: String = '');
    procedure consultarLista(sIdLista: String = '');
    procedure consultarPessoa(sIdPessoa: String);
    function retornaPatrocinadora(sIdPessoaJuridica: String): String;

    procedure marcarHistoricoBeneficiosEfetivado(sIdPessoa, sSeqOriginal: String);
    procedure lancarHistoricoBeneficiosEfetivado(sIdLote,sMesAnoLote,sDataPagLote,sIdPessoa,sIdTitular,sIdPessoaJuridica,sIdPlanoPrevidenciario,sIdBeneficio,sIdNumProcesso,sMesReferencia,sFlgDevolucao,sFontePagadora,sIdPlanoOrigem,smes: String; fValorAcerto:real);

    function  retornaValorAtualProvento(): real;
    function  retornaValorProventoMesMorte(var fPercTxAdm: real; var fSomaRubAdic: real; var sRubricaTxAdm: String): real;
    function  retornaValorRubAcaoJudicialMesMorte(sRubrica: String): real;

    function  retornaIdentificadorPlanoContabil(): String;
    function  retornaPeriodoAutal(): String;
    function  retornaPeriodoDescontoAbono(): String;
    function  retornaDataAutal(): String;
    function  retornaAnoAutal(): Integer;
    function  retornaRubricaDesconto(sRubricaOrigem: String): String;

    procedure processarAcerto(sIdLote,sMesAnoLote,sDataPagLote: String);

    procedure InsereListaFalecido(qry : TwwQuery; sIdLote: String; sFlgNome: Integer); //SIG23673
    procedure InsereListaDetFalecido(qry, qryResultado : TwwQuery); //SIG23673
    function PROC_CancelaFalecido(sIdLote: String): Integer; //SIG23673
    procedure PROC_DesfazCancelaFalecido(); //SIG23673
    procedure PROC_AjustaSituacaoLista(pIdLista: real); //SIG23673

    procedure processarAcertorRubricasMensais(sIdLote: String);
    procedure processarAcertoAbonoAnualFuncef(sAnoReferencia, sIdLote: String); // SOL 229906 PPM 345184 Fernando Xavier
    procedure processarAcertoAbonoAnualINSS(sAnoReferencia, sIdLote: String); // SOL 229906 PPM 345184 Fernando Xavier
    procedure processarAcertoAbonoAnualAcaoJudicial(sAnoReferencia, sIdLote: String); // SOL 229906 PPM 345184 Fernando Xavier
    function retornaTotalRubricasAbonoAnualAcaoJudicial(sAnoReferencia: String): real;
    procedure processarAcertoAbonoAnualTaxaAdm();

    procedure consultarRubricasTratadas(sIdPessoa, sIdBeneficio, sDataMorte: String);
    procedure consultarRubricasAbono(sIdPessoa, sIdBeneficio, sDataMorte, sFontePagadora, sAnoReferencia: String);

    procedure consultarRubricasPossuemAbonoAcaoJudicial(sIdPessoa, sAnoReferencia: String);
    procedure consultarRubricasAbonoAcaoJudicial(sIdPessoa, sIdBeneficio, sIdRubrica, sDataMorte, sFontePagadora, sAnoReferencia: String);
    procedure consultarRubricasAbonoAcaoJudicialNaoProcessadas(sIdPessoa, sIdBeneficio, sAnoReferencia: String);
    procedure consultarRubricasAbonoTaxaAdm(sIdPessoa, sIdBeneficio, sDataMorte: String);


    procedure InsereOuAlteraHistoricoBeneficioProcessado(sIdPessoa,sIdPessoaJuridica,sIdPlanoPrevidenciario,sIdBeneficio,sIdNumProcesso,sMesReferencia,sFlgDevolucao,sFontePagadora,sIdPlanoOrigem,sIdTitBenef,sIdLote,smes: String; fValorAcerto:real); // // SOL 229906 PPM 345184 Fernando Xavier
    function  verificaHistoricoBeneficioJaProcessado(sIdPessoa, sIdPessoaJuridica, sIdPlanoPrevidenciario, sIdBeneficio,sIdNumProcesso, sMesReferencia, sIdPlanoOrigem, sIdTitBenef: String; var flgDevolucao: String; var fValor: real): boolean;
    procedure lancarHistoricoBeneficioProcessado(sIdPessoa,sIdPessoaJuridica,sIdPlanoPrevidenciario,sIdBeneficio,sIdNumProcesso,sMesReferencia,sFlgDevolucao,sFontePagadora,sIdPlanoOrigem,sIdTitBenef,sIdLote,smes: String; fValorAcerto:real); // SOL 229906 PPM 345184 Fernando Xavier
    procedure AlterarHistoricoBeneficioProcessado(sIdPessoa, sIdPessoaJuridica, sIdPlanoPrevidenciario, sIdBeneficio, sIdNumProcesso, sMesReferencia, sIdPlanoOrigem, sIdTitBenef, flgDevolucao: String; fValorAcerto: real);

    procedure lancarHistoricoContribuicaoProcessado(sIdPessoa,sIdPessoaJuridica,sIdPlanoPrevidenciario,sMesReferencia,sFlgDevolucao: String; fValorAcerto:real; pIdContribuicao:Integer = 0);

    procedure programarRubricaIndividual(sIdEmpresa,sIdPessoa,sIdFavorecido,sIdRubrica,sIdTitular,sPlanocontabil,sFlgPensaAlim,sMesReferencia: String; fValorAcerto:Real);
    procedure marcarBeneficioComoProcessado(sIdPessoa, sIdBeneficio: String);
    procedure HabilitaBotoes(iTipo: Integer);
    Function AtualizaLoteLista(qry: TwwQuery;sIdLote: String): Boolean;
    procedure SetFiltroGrid(pTipo: Integer; pCheck, pLimpa: Boolean);

//    Function ObtemMesCompReem(): String;
  public
    { Public declarations }
  end;

var
  frmEncerramentoPorFalecimento: TfrmEncerramentoPorFalecimento;
  iFlgSituacao: Integer;

implementation

uses DFolha,UDatabase,UMensErro, DAPrev, FSelecionaLoteEF, DBaseDados;

{$R *.DFM}

procedure TfrmEncerramentoPorFalecimento.bbtnProcurarClick(
  Sender: TObject);
begin
  inherited;
  dtInicio.Text := '';
  dtFim.Text := '';

  qryLista.Close;
  iTipoConsulta := 1;

  MSBenef.Executar;
  if (MSBenef.ValoresChave.Count > 0) and
     (MSBenef.ValoresChave[0] <> '') then
  begin
    edtTitular.Text             := MSBenef.ValoresChave[1];
    edtMatricula.Text           := MSBenef.ValoresChave[2];
    edtPlanoPrevidenciario.Text := MSBenef.ValoresChave[5];
    edtPatrocinadora.Text       := retornaPatrocinadora( MSBenef.ValoresChave[6] );
    consultar( MSBenef.ValoresChave[0],MSBenef.ValoresChave[7] );

    if not(qryLista.IsEmpty) then
    begin
      qryAux.close;
      qryAux.sql.clear;
      qryAux.sql.add(' SELECT LD.IDLISTA IDLISTA FROM CM.ENCERRAFALECIDO_LISTADET LD, '+ #13#10 +
                     ' CM.ENCERRAFALECIDO_LISTA L WHERE L.IDLISTA = LD.IDLISTA '+ #13#10 +
                     ' AND L.FLGLISTADESFAZ = 0 '+ #13#10 +
                     ' AND LD.IDPESSOA = '+ MSBenef.ValoresChave[0] + #13#10 +
                     ' ORDER BY LD.IDLISTA DESC ');
      qryAux.Open;

      if (qryAux.RecordCount > 0) then
        iIdLista := qryAux.fieldbyname('IDLISTA').AsInteger
      else
        iIdLista := 0;
    end;
  end;
end;

procedure TfrmEncerramentoPorFalecimento.btnFiltrarClick(Sender: TObject);
begin
  inherited;

  edtTitular.Text             := '';
  edtMatricula.Text           := '';
  edtPlanoPrevidenciario.Text := '';
  edtPatrocinadora.Text       := '';

  qryLista.Close;
  iTipoConsulta := 2;

  if Trim(dtInicio.Text) = '' then
   begin
      MsgDlg('Data de início do período não informada.','erro', mtInformation, [mbOk, mbHelp], 0);
      dtInicio.SetFocus;
      Exit;
   end;

  if Trim(dtFim.Text) = '' then
   begin
      MsgDlg('Data final do período não informada.','erro', mtInformation, [mbOk, mbHelp], 0);
      dtFim.SetFocus;
      Exit;
   end;

  if strToDate(dtInicio.Text) > strToDate(dtFim.Text) then
   begin
      MsgDlg('A data fim deve ser maior ou igual a data início.','erro', mtInformation, [mbOk, mbHelp], 0);
      dtFim.SetFocus;
      Exit;
   end;

   Consultar();


   if not(qryLista.IsEmpty) then
   begin
      //bbtnConfirmar.Enabled       := true;
      //bbtnCancelar.Enabled        := true;
      iIdLista := 0;
      //HabilitaBotoes(0);
   end;

end;

procedure TfrmEncerramentoPorFalecimento.consultar(sIdPessoa, sIdPlanoPrev: String);
var ssql : String;
begin

{    ssQl :=  ' SELECT DISTINCT 0 as PROCESSAR                           '
           + '      , BBF.IDPESSOA                                      '
           + '      , BBF.IDTITULAR                                     '
           + '      , BBF.IDPESSJUR                                     '
           + '      , BBF.IDBENEFICIO                                   '
           + '      , BBF.IDPLANOPREV                                   '
           + '      , BBF.IDPLANOORIGEM                                 '
           + '      , BBF.FONTEPAGADORA                                 '
           + '      , P.NOME                                            '
           + '      , PP.NOME AS NOME_PLANO                             '
           + '      , B.NOME AS NOME_BENEFICIO                          '
           + '      , D.MATRICULA                                       '
           + '      , BBF.DATAINICIO DIB                                '
           + '      , BBF.VALORATUAL                                    '
           + '      , BBF.IDSITBENEFICIO                                '
           + '      , SB.DESCRICAO as SITBENEFICIO                      '
           + '      , ( SELECT MAX(HBF.DATAPAGAMENTO)                   '
           + '         FROM HSTBENEFBFCIARIO HBF                        '
           + '         WHERE HBF.IDBENEFICIO = BBF.IDBENEFICIO          '
           + '         AND HBF.IDTITULAR = BBF.IDTITULAR                '
           + '         AND HBF.IDPLANOPREV = BBF.IDPLANOPREV            '
           + '         AND HBF.FLGDEVOLUCAO = 0                         '
           + '        ) AS ULTIMO_PAGAMENTO                             '
           + '      , BBF.NUMEROPROCESSO                                '
           + '      , BBF.NUMPROCINSS                                   '
           + '      , PF.DATAMORTE                                      '
           + '      , TO_CHAR(PF.DATAMORTE,''YYYY/MM'') MESANOMORTE     '
           + '      , TO_CHAR(PF.DATAMORTE,''DD'') DIAMORTE             '
           + '      , TO_CHAR(PF.DATAMORTE,''MM'') MESMORTE             '
           + '      , TO_CHAR(PF.DATAMORTE,''YYYY'') ANOMORTE           '
           + ' FROM BENEFBFCIARIO BBF                                   '
           + '    , BENEFICIO B                                         '
           + '    , SITBENEFICIO SB                                     '
           + '    , DEPENTIT D                                          '
           + '    , PESSOAFISICA PF                                     '
           + '    , PESSOA P                                            '
           + '    , PLANPREV PP                                         '
           + ' WHERE BBF.IDPESSOA   = D.IDPESSOA                        '
           + '  AND BBF.IDTITULAR   = D.IDTITULAR                       '
           + '  AND BBF.IDPESSOA    = PF.IDPESSOA                       '
           + '  AND PF.IDPESSOA     = P.IDPESSOA                        '
           + '  AND BBF.IDBENEFICIO = B.IDBENEFICIO                     '
           + '  AND BBF.IDSITBENEFICIO = SB.IDSITBENEFICIO(+)           '
           + '  AND BBF.IDPLANOPREV = PP.IDPLANOPREV                    '
           + '  AND BBF.DATAFINAL IS NOT NULL                           '
           + '  AND BBF.FLGACERTO = 0                                   ';

    if Trim(dtInicio.Text) <> '' then
           ssQl :=  ssQl + '  AND PF.DATAMORTE >= TO_DATE(' + QuotedStr(Trim(dtInicio.Text)) + ',''DD/MM/YYYY'')  ';

    if Trim(dtFim.Text) <> '' then
           ssQl :=  ssQl + '  AND PF.DATAMORTE <= TO_DATE(' + QuotedStr(Trim(dtFim.Text)) + ',''DD/MM/YYYY'')  ';

    if sIdPessoa <> '' then
           ssQl :=  ssQl + '  AND P.IDPESSOA     = ' + sIdPessoa;

    if sIdPlanoPrev <> '' then
           ssQl :=  ssQl + '  AND BBF.IDPLANOPREV = ' + sIdPlanoPrev;

    ssQl :=  ssQl + '  ORDER BY D.MATRICULA, PP.NOME, BBF.FONTEPAGADORA,  B.NOME ';

    qryLista.Sql.Text := ssql;
    qryLista.Active := true; }

   ssQl :=  'with Eventos_HistMov as (select distinct idPessoa,' + #13#10 +
            '                                first_value(DataEvento) over (partition by idpessoa order by trgDtInclusao) DataEvento,' + #13#10 +
            '                                first_value(trgDtInclusao) over (partition by idpessoa order by trgDtInclusao) trgDtInclusao,' + #13#10 +
            '                                first_value(trgUserInclusao) over (partition by idpessoa order by trgUserInclusao) trgUserInclusao' + #13#10 +
            '                         from (select e.idPessoa,' + #13#10 +
            '                                      e.DataEvento,' + #13#10 +
            '                                      e.trgDtInclusao,' + #13#10 +
            '                                      e.trgUserInclusao' + #13#10 +
            '                               from Eventosprev e' + #13#10 +
            '                               where e.ideventogerador in (4, 130)' + #13#10 +
            '                               union' + #13#10 +
            '                               select m.idPessoa,' + #13#10 +
            '                                      m.DataMov,' + #13#10 +
            '                                      m.trgDtInclusao,' + #13#10 +
            '                                      m.trgUserInclusao' + #13#10 +
            '                               from Movbenef m' + #13#10 +
            '                               where tipomov = 9)';
            if sIdPessoa = '' then
            begin
              // Filtro por Data Evento
              if RadioButton2.Checked then
                begin
                  ssQl := ssQl + ' where dataevento between TO_DATE(' + QuotedStr(Trim(dtInicio.Text)) + ',''DD/MM/YYYY'')   and TO_DATE(' + QuotedStr(Trim(dtFim.Text)) + ',''DD/MM/YYYY'')  '+ #13#10 ;
                end;
              // Filtro por Data Inclusão do Evento
              if RadioButton1.Checked then
                begin
                  ssQl := ssQl + ' where  trunc(trgdtinclusao) between TO_DATE(' + QuotedStr(Trim(dtInicio.Text)) + ',''DD/MM/YYYY'')   and TO_DATE(' + QuotedStr(Trim(dtFim.Text)) + ',''DD/MM/YYYY'')  '+ #13#10 ;
                end;
            end;

    ssQl := ssQl + '                        )' + #13#10 +
            ' select 0 as Processar,' + #13#10 +
            '       pf.idPessoa,' + #13#10 +
            '       d.Matricula,' + #13#10 +
            '       p.Nome ,' + #13#10 +
            '       Pf.Datamorte DataFalecimento,' + #13#10 +
            '       ev.DataEvento ,' + #13#10 +
            '       ev.trgDtInclusao DataInclusaoEvento,' + #13#10 +
            '       Substr(Fn_NomeusuarioSistema(ev.trgUserInclusao), 1, 40) UsuarioInclusaoEvento,' + #13#10 +
            '      lista.FlgSituacao as iflgSituacao,' + #13#10 +
            ' decode(lista.FlgSituacao,0,''Não Processado'', 1,''Processado'', 3, ''Falha ao processar'') as FlgSituacao,' + #13#10 +
            '       Lista.Dataprocessamento ,' + #13#10 +
            '       Lista.DataDesfazimento ' + #13#10 +   
            ' from Pessoafisica Pf' + #13#10 +
            ' inner join Pessoa p on p.Idpessoa = Pf.Idpessoa' + #13#10 +
            ' inner join Depentit d on d.Idpessoa = Pf.Idpessoa' + #13#10 +
            ' inner join Eventos_HistMov Ev on ev.idPessoa = p.idPessoa' + #13#10 +
            ' left join (select distinct Lst.Idpessoa Idpessoa,' + #13#10 +
            '                  Lst.Flgsituacao Flgsituacao,' + #13#10 +
            '                  Lst.DataProcessamento DataProcessamento,' + #13#10 +
            '                  Lst.DataDesfazimento DataDesfazimento' + #13#10 +
            '           from Encerrafalecido_Lista l' + #13#10 +
            '           inner join Encerrafalecido_Listadet Lst on Lst.Idlista = l.Idlista' + #13#10 +
            '           where l.FlgListaDesfaz = 0) Lista on Lista.Idpessoa = pf.Idpessoa' + #13#10 +
            ' where exists (select 1' + #13#10 +
            '              from BenefBfciario bf' + #13#10 +
            '              inner join beneficio b on bf.idBeneficio = b.Idbeneficio' + #13#10 +
            '              where bf.idPessoa = d.idPessoa and' + #13#10 +
            '                    bf.idTitular = d.idTitular and' + #13#10 +
            '                    bf.DataFinal is not null and' + #13#10 +
            '                    bf.flgAcerto = 0 and' + #13#10 +
            '                    b.flgPeculio = 0 and' + #13#10 +
            '                    b.flgResgate = 0) ';



            if sIdPessoa <> '' then
            begin
               ssQl := ssQl + '  and p.idpessoa = '+sIdPessoa;
            end
            else
            begin
               // Filtro por Data Morte
               if RadioButton3.Checked then
                 begin
                   ssQl := ssQl + '   and  pf.datamorte between TO_DATE(' + QuotedStr(Trim(dtInicio.Text)) + ',''DD/MM/YYYY'')   and TO_DATE(' + QuotedStr(Trim(dtFim.Text)) + ',''DD/MM/YYYY'')  '+ #13#10 ;

                 end;
            end;

            ssQl := ssQl + ' order by 5, 6, 7 ';
    qryLista.Sql.Text := ssql;
    qryLista.Active := true;


   { qryLista.fieldbyname('PROCESSAR').visible          := True;
    qryLista.fieldbyname('IDPESSOA').visible           := False;
    qryLista.fieldbyname('IDTITULAR').visible          := False;
    qryLista.fieldbyname('IDPESSJUR').visible          := False;
    qryLista.fieldbyname('IDBENEFICIO').visible        := False;
    qryLista.fieldbyname('IDPLANOPREV').visible        := False;
    qryLista.fieldbyname('FONTEPAGADORA').visible      := False;
    qryLista.fieldbyname('MATRICULA').visible          := True;
    qryLista.fieldbyname('NOME').visible               := True;
    qryLista.fieldbyname('NOME_PLANO').visible         := True;
    qryLista.fieldbyname('NOME_BENEFICIO').visible     := True;
    qryLista.fieldbyname('DIB').visible                := True;
    qryLista.fieldbyname('VALORATUAL').visible         := True;
    qryLista.fieldbyname('IDSITBENEFICIO').visible     := False;
    qryLista.fieldbyname('SITBENEFICIO').visible       := True;
    qryLista.fieldbyname('ULTIMO_PAGAMENTO').visible   := True;
    qryLista.fieldbyname('NUMEROPROCESSO').visible     := True;
    qryLista.fieldbyname('NUMPROCINSS').visible        := False;
    qryLista.fieldbyname('DATAMORTE').visible          := True;
    qryLista.fieldbyname('MESANOMORTE').visible        := False;
    qryLista.fieldbyname('DIAMORTE').visible           := False;


    qryLista.fieldbyname('PROCESSAR').readonly          := (qryLista.RecordCount = 0);
    qryLista.fieldbyname('MATRICULA').readonly          := True;
    qryLista.fieldbyname('NOME').readonly               := True;
    qryLista.fieldbyname('NOME_PLANO').readonly         := True;
    qryLista.fieldbyname('NOME_BENEFICIO').readonly     := True;
    qryLista.fieldbyname('DIB').readonly                := True;
    qryLista.fieldbyname('VALORATUAL').readonly         := True;
    qryLista.fieldbyname('SITBENEFICIO').readonly       := True;
    qryLista.fieldbyname('ULTIMO_PAGAMENTO').readonly   := True;
    qryLista.fieldbyname('NUMEROPROCESSO').readonly     := True;
    qryLista.fieldbyname('NUMPROCINSS').readonly        := True;
    qryLista.fieldbyname('DATAMORTE').readonly          := True;
    qryLista.fieldbyname('MESANOMORTE').readonly        := True;
    qryLista.fieldbyname('DIAMORTE').readonly           := True; }


    {qryLista.fieldbyname('PROCESSAR').displaylabel         := 'PROCESSAR';
    qryLista.fieldbyname('PROCESSAR').Index                := 0;
    qryLista.fieldbyname('PROCESSAR').DisplayWidth         := 5;

    qryLista.fieldbyname('MATRICULA').displaylabel         := 'Matrícula';
    qryLista.fieldbyname('MATRICULA').Index                := 1;
    qryLista.fieldbyname('MATRICULA').DisplayWidth         := 7;

    qryLista.fieldbyname('NOME').displaylabel              := 'Nome do Beneficiário';
    qryLista.fieldbyname('NOME').Index                     := 2;
    qryLista.fieldbyname('NOME').DisplayWidth              := 40;

    qryLista.fieldbyname('NOME_PLANO').displaylabel        := 'Plano';
    qryLista.fieldbyname('NOME_PLANO').Index               := 3;
    qryLista.fieldbyname('NOME_PLANO').DisplayWidth        := 15;

    qryLista.fieldbyname('NOME_BENEFICIO').displaylabel    := 'Benefício';
    qryLista.fieldbyname('NOME_BENEFICIO').Index           := 4;
    qryLista.fieldbyname('NOME_BENEFICIO').DisplayWidth    := 40;


    qryLista.fieldbyname('DIB').displaylabel               := 'DIB';
    qryLista.fieldbyname('DIB').Index                      := 5;
    qryLista.fieldbyname('DIB').DisplayWidth               := 10;

    qryLista.fieldbyname('VALORATUAL').displaylabel        := 'Valor Atual';
    qryLista.fieldbyname('VALORATUAL').Index               := 6;
    qryLista.fieldbyname('VALORATUAL').DisplayWidth        := 10;


    qryLista.fieldbyname('SITBENEFICIO').displaylabel      := 'Situacao';
    qryLista.fieldbyname('SITBENEFICIO').Index             := 7;
    qryLista.fieldbyname('SITBENEFICIO').DisplayWidth      := 7;

    qryLista.fieldbyname('ULTIMO_PAGAMENTO').displaylabel  := 'Ult. Pagamento';
    qryLista.fieldbyname('ULTIMO_PAGAMENTO').Index         := 8;
    qryLista.fieldbyname('ULTIMO_PAGAMENTO').DisplayWidth  := 10;

    qryLista.fieldbyname('NUMEROPROCESSO').displaylabel    := 'Nº Processo';
    qryLista.fieldbyname('NUMEROPROCESSO').Index           := 9;
    qryLista.fieldbyname('NUMEROPROCESSO').DisplayWidth    := 5;

    qryLista.fieldbyname('DATAMORTE').displaylabel         := 'Falecimento';
    qryLista.fieldbyname('DATAMORTE').Index                := 10;
    qryLista.fieldbyname('DATAMORTE').DisplayWidth         := 5; }


             qryLista.fieldbyname('PROCESSAR').displaylabel              := 'Processar';
             qryLista.fieldbyname('PROCESSAR').Index                     := 0;
             qryLista.fieldbyname('PROCESSAR').DisplayWidth              := 7;

             qryLista.fieldbyname('MATRICULA').displaylabel              := 'Matrícula';
             qryLista.fieldbyname('MATRICULA').Index                     := 1;
             qryLista.fieldbyname('MATRICULA').DisplayWidth              := 7;

             qryLista.fieldbyname('NOME').displaylabel                   := 'Nome do Beneficiário';
             qryLista.fieldbyname('NOME').Index                          := 2;
             qryLista.fieldbyname('NOME').DisplayWidth                   := 40;

             qryLista.fieldbyname('DataFalecimento').displaylabel        := 'Data Morte';
             qryLista.fieldbyname('DataFalecimento').Index               := 3;
             qryLista.fieldbyname('DataFalecimento').DisplayWidth        := 10;

             qryLista.fieldbyname('DataEvento').displaylabel             := 'Data Evento';
             qryLista.fieldbyname('DataEvento').Index                    := 4;
             qryLista.fieldbyname('DataEvento').DisplayWidth             := 10;

             qryLista.fieldbyname('DataInclusaoEvento').displaylabel     := 'Data Inc. Evento';
             qryLista.fieldbyname('DataInclusaoEvento').Index            := 5;
             qryLista.fieldbyname('DataInclusaoEvento').DisplayWidth     := 10;

             qryLista.fieldbyname('UsuarioInclusaoEvento').displaylabel  := 'Usuário Evento';
             qryLista.fieldbyname('UsuarioInclusaoEvento').Index         := 6;
             qryLista.fieldbyname('UsuarioInclusaoEvento').DisplayWidth  := 30;

             qryLista.fieldbyname('DataProcessamento').displaylabel       := 'Data Proc.';
             qryLista.fieldbyname('DataProcessamento').Index              := 7;
             qryLista.fieldbyname('DataProcessamento').DisplayWidth       := 10;

             qryLista.fieldbyname('DataDesfazimento').displaylabel       := 'Data Desfaz.';
             qryLista.fieldbyname('DataDesfazimento').Index              := 8;
             qryLista.fieldbyname('DataDesfazimento').DisplayWidth       := 10;

             qryLista.fieldbyname('FlgSituacao').displaylabel       := 'Situação';
             qryLista.fieldbyname('FlgSituacao').Index              := 9;
             qryLista.fieldbyname('FlgSituacao').DisplayWidth       := 20;



    dbgrdLista.Selected.clear;
    {dbgrdLista.Selected.add('PROCESSAR'#9'10'#9'Processar');
    dbgrdLista.Selected.add('MATRICULA'#9'10'#9'Matrícula');
    dbgrdLista.Selected.add('NOME'#9'25'#9'Nome do Beneficiário');
    dbgrdLista.Selected.add('DIB'#9'35'#9'DIB');
    dbgrdLista.Selected.add('VALORATUAL'#9'10'#9'Valor Atual');
    dbgrdLista.Selected.add('SITBENEFICIO'#9'10'#9'Situacao');
    dbgrdLista.Selected.add('ULTIMO_PAGAMENTO'#9'10'#9'Ultimo Pagamento');
    dbgrdLista.Selected.add('NUMEROPROCESSO'#9'10'#9'N Processo');
    dbgrdLista.Selected.add('DATAMORTE'#9'10'#9'Data Falecimento');}

    dbgrdLista.Selected.add('PROCESSAR'#9'10'#9'Processar');
    dbgrdLista.Selected.add('MATRICULA'#9'10'#9'Matrícula');
    dbgrdLista.Selected.add('NOME'#9'25'#9'Nome do Beneficiário');
    dbgrdLista.Selected.add('DataFalecimento'#9'35'#9'Data Morte');
    dbgrdLista.Selected.add('DataEvento'#9'35'#9'Data Evento');
    dbgrdLista.Selected.add('DataInclusaoEvento'#9'35'#9'Data Inc. Evento');
    dbgrdLista.Selected.add('UsuarioInclusaoEvento'#9'10'#9'Usuário Evento');
    dbgrdLista.Selected.add('DataProcessamento'#9'35'#9'Data Proc.');
    dbgrdLista.Selected.add('DataDesfazimento'#9'35'#9'Data Desfaz.');
    dbgrdLista.Selected.add('FlgSituacao'#9'35'#9'Situação');


end;

procedure TfrmEncerramentoPorFalecimento.consultarPessoa( sIdPessoa: String);
var sSql : String;
begin
  sSql :=  ' SELECT NOME, MATRICULA, PLANO, PATRO '
        +  ' FROM CM.VWPARTICIPDEPEN '
        +  ' WHERE IDPESSOA = ' + sIdPessoa;

  if FazQuery(qryAux, ssql) then
   begin
    edtTitular.Text             := qryAux.FieldByName('NOME').AsString;
    edtMatricula.Text           := qryAux.FieldByName('MATRICULA').AsString;
    edtPlanoPrevidenciario.Text := qryAux.FieldByName('PLANO').AsString;
    edtPatrocinadora.Text       := qryAux.FieldByName('PATRO').AsString;
    consultar( sIdPessoa );
   end;
end;

{Function TfrmEncerramentoPorFalecimento.obtemMesCompReem(): String;
var sSql : String;
begin
  sSql :=  ' select  MESCOMPREEM from hstbenefbfciario '
        +  ' where   idpessoa  =  '+ qryLista.fieldbyname('IDPESSOA').Asstring
        +  ' and     mesreferencia  =  '+ QuotedStr(qryRub.FieldByName('MES').AsString)
        +  ' and     mes            =  '+ QuotedStr(qryRub.FieldByName('MESCOBRANCA').AsString)
        +  ' and     idbeneficio    =  '+ qryLista.fieldbyname('IDBENEFICIO').Asstring;


  if FazQuery(qryAux, ssql) then
  begin
      Result :=  qryAux.FieldByName('MESCOMPREEM').AsString;
  end
  else
  begin
     Result :=  '';
  end;

end;    }

procedure TfrmEncerramentoPorFalecimento.bbtnConfirmarClick(
  Sender: TObject);
var sSql: String;
    iTotal: Integer;
    iLote: Integer;
    sMesAnoLote, sDataPagLote: String;
begin
  inherited;

  qryLista.filter:='PROCESSAR = 1 ';
  qryLista.filtered:=true;

  iTotal := 0;

  with qryLista do
   begin
     if qryLista.active then
      begin
        qryLista.disableControls;
        First;
        while not qryLista.EOF do
         begin
           //if FieldByName('PROCESSAR').AsString = '1' then
             Inc(iTotal);

           Next;
         end;
        qryLista.enableControls;
      end;
   end;

  if ( iTotal = 0 ) then
   begin
     MsgDlg('Selecione a(s) pessoa(s) que deve(m) ser processada(s).','Informação', mtInformation, [mbOk, mbHelp], 0);
     qryLista.filter:='';
     qryLista.filtered:=true;
     Exit;
   end;

  if MsgDlg('Deseja encerrar o(s) benefício(s) dos participantes selecionados?','Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo Then
  begin
    qryLista.filter:='';
    qryLista.filtered:=true;
    Exit;
  end;

  if iIdLista = 0 then
  begin
    iLote := TfrmSelecionaLoteEF.SelecionaLoteFolhaBeneficio(sMesAnoLote, sDataPagLote);

    if iLote = -1 then
    begin
      qryLista.filtered:=false;
      Exit;
    end;
      HabilitaBotoes(3);

    sDataPagLoteRubIndiv := sDataPagLote; // SOL 136748/14312 KINTANA 1988667 Fernando Xavier 10/03/2013 - BSB

    //Try  //SIG23673

    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    InsereListaFalecido(qryAux, IntToStr(iLote),0);//SIG23673

    with qryLista do
     begin
       if qryLista.active then
        begin
          qryLista.disableControls;
          Try
            First;
            while not qryLista.EOF do
             begin
               //if FieldByName('PROCESSAR').AsString = '1' then
                begin
                 //processarAcerto( IntToStr(iLote) , sMesAnoLote, sDataPagLote);//SIG23673
                 InsereListaDetFalecido(qryAux,qryLista); //SIG23673
                end;
               Next;
           end;
          Finally
            qryLista.enableControls;
            qryLista.First;
          end;
        end;
     end;

     if dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Commit;
     if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

     PROC_CancelaFalecido(IntToStr(iLote)); //SIG23673

     if dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Commit;
    
    qryLista.filtered:=false;

    consultarLista(FloatToStr(iIdLista));

    HabilitaBotoes(3);
  end
  else
  begin

    sSql := ' SELECT LC.IDLOTE FROM CM.ENCERRAFALECIDO_LISTA LC WHERE LC.IDLISTA = '+FloatToStr(iIdLista);

    if FazQuery(qryAux, ssql) then
      iLote  := qryAux.FieldByName('IDLOTE').AsInteger
    Else
      begin
        MsgDlg('Erro ao recuperar Lote.', 'Aviso', mtError, [mbOk], 0);
        qryLista.EnableControls;
        Exit;
      end;

    qryAux.Close;

    if (PROC_CancelaFalecido(IntToStr(iLote)))>=0 then //SIG23673
    begin
      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

      qryLista.filtered:=false;

      consultarLista(FloatToStr(iIdLista));

      HabilitaBotoes(3);

    end;
  end;


end;

procedure TfrmEncerramentoPorFalecimento.consultarRubricasTratadas(sIdPessoa, sIdBeneficio, sDataMorte: String);
var sSql : String;
begin
  sSql :=  ' SELECT H.MES                                 '
        +  '    ,H.MESCOBRANCA                            '
        // Andre Imakawa - SIG 70668 - Inicio
        +  '    ,DECODE( H.FLGTIPODESC, ''P'',                      '
        +  '             (SELECT IDDESCONTO                         '
        +  '                FROM   TMPDESC T                        '
        +  '               WHERE  T.IDPESSOA = H.IDPESSOA           '
        +  '                 AND    T.IDTITULAR = H.IDTITULAR       '
        +  '                 AND    T.IDPESSJUR = H.IDPATRO         '
        +  '                 AND    T.IDPLANOPREV = H.IDPLANOPREV   '
        +  '                 AND    T.MESREFERENCIA = H.MES         '
        +  '                 AND    T.MESCOBRANCA = H.MESCOBRANCA   '
        +  '                 AND    T.IDPROVENTO = H.IDRUBRICA      '
        +  '                 AND ROWNUM = 1),0) AS IDCONTRIBUICAO   '
        // Andre Imakawa - SIG 70668 - Fim
        +  '    ,CASE WHEN SUBSTR(H.MES,6,7) = ''13''     '
        +  '      THEN ''SIM''                            '
        +  '      ELSE ''NAO''                            '
        +  '     END AS ABONOANUAL                        '
        +  '    ,H.IDPESSJUR                              '
        +  '    ,H.IDRUBRICA                              '
        +  '    ,H.IDMOTIVO                               '
        +  '    ,H.REFERENCIA                             '
        +  '    ,H.IDPESSOA                               '
        +  '    ,H.SEQRUBRICA                             '
        +  '    ,H.CODIRRFDARF                            '
        +  '    ,H.IDHSTFOLHABENEF                        '
        +  '    ,H.CODDOCUMENTO                           '
        +  '    ,H.IDLANCIRRF                             '
        +  '    ,H.IDRESPONSAVEL                          '
        +  '    ,H.IDPATRO                                '
        +  '    ,H.IDRETROATIVO                           '
        +  '    ,H.CODMOEDA                               '
        +  '    ,H.IDREGRACALCULO                         '
        +  '    ,H.CODPROVDESC                            '
        +  '    ,H.VALORPROVENTO                          '
        +  '    ,H.FLGCOMPOESALPART                       '
        +  '    ,H.FLGCOMPOESALBENEF                      '
        +  '    ,H.FLGIRRF                                '
        +  '    ,H.VALORCOTAS                             '
        +  '    ,H.VLRANTRETROATIVO                       '
        +  '    ,H.FLGCOMPOEREMTOTAL                      '
        +  '    ,H.FLGPREVIA                              '
        +  '    ,H.FLGSRB                                 '
        +  '    ,H.FLGCONCESSAO                           '
        +  '    ,H.FONTEPAGADORA                          '
        +  '    ,H.DATAPAGAMENTO                          '
        +  '    ,H.FLGSALPARTRETRO                        '
        +  '    ,H.FLGSALPARTATUARIA                      '
        +  '    ,H.FLGSALBENEFRETRO                       '
        +  '    ,H.IDMODULO                               '
        +  '    ,H.VALORINFO                              '
        +  '    ,H.VALORNADIB                             '
        +  '    ,H.TIPOITEMPCS                            '
        +  '    ,H.SEQHISTFUNC                            '
        +  '    ,H.FLGEQUIPARACAO                         '
        +  '    ,H.PERCENTUALNADIB                        '
        +  '    ,H.VALORRECEBIDO                          '
        +  '    ,H.IDTITULAR                              '
        +  '    ,H.IDPLANOPREV                            '
        +  '    ,H.IDFAVORECIDO                           '
        +  '    ,H.CODPORTFORMA                           '
        +  '    ,H.FLGPENSAOALIM                          '
        +  '    ,H.IDINFORME                              '
        +  '    ,H.IDCBANCARIA                            '
        +  '    ,H.NUMBANCO                               '
        +  '    ,H.NUMAGENCIA                             '
        +  '    ,H.CONTACORRENTE                          '
        +  '    ,H.FLGESTORNO                             '
        +  '    ,H.IDVERSAOPAGTO                          '
        +  '    ,H.VALORINTEGRAL                          '
        +  '    ,H.IDLANCIRRFESTORNO                      '
        +  '    ,H.FLGTIPODESC                            '
        +  '    ,H.LOTEORIGINAL                           '
        +  '    ,H.SEQORIGINAL                            '
        +  '    ,H.PERCENTUAL                             '
        +  '    ,H.NUMEROPROCESSO                         '
        +  '    ,H.NUMPROCINSS                            '
        +  '    ,H.TRGDTINCLUSAO                          '
        +  '    ,H.TRGUSERINCLUSAO                        '
        +  '    ,H.FLGSALFAM                              '
        +  '    ,H.FLGIRRFTOTAL                           '
        +  '    ,H.FLGMOLESTIAGRAVE                       '
        +  '    ,H.NUMDEPIRRF                             '
        +  '    ,H.NUMDEPSF                               '
        +  '    ,H.FLGISENTOIRRF                          '
        +  '    ,H.IDPLANOORIGEM                          '
        +  '    ,H.IDRESPONNAOREC                         '
        +  '    ,H.PARCELAS                               '
        +  '    ,H.ORDEM                                  '
        +  '    ,H.CODCENTROCUSTOD                        '
        +  '    ,H.PLANO                                  '
        +  '    ,H.UNIDNEGOC                              '
        +  '    ,H.CODSUBCONTA                            '
        +  '    ,H.CODCENTRORESPON                        '
        +  '    ,H.RECPAG                                 '
        +  '    ,H.CODTIPRECDES                           '
        +  '    ,H.PLACONTAC                              '
        +  '    ,H.PLACONTAD                              '
        +  '    ,H.IDPLANOCONTABIL                        '
        +  '    ,H.CODCENTROCUSTOC                        '
        +  '    ,H.FLGESPECIAL                            '
        +  '    ,H.FLGDESCONTO                            '
        +  '    ,H.IDRECEBEPGTO                           '
        +  '    ,H.IDPROCJUD                              '
        +  '    ,H.IDBENEFICIO                            '
        +  '    ,H.NUMDOCUMENTO                           '
        +  '    ,H.CODDOCUMENTOPGAPAGAR                   '
        +  '    ,H.CODDOCUMENTOPGARECEBER                 '
        +  '    ,P.FLGPROPORCIONAL                        '
        +  '    ,P.FLGACAOJUDICIAL                        '
        +  ' FROM HISTRUBSAL H                            '
        +  '     ,PROVDESC P                              '
        +  ' WHERE  P.IDPROVENTO = H.IDRUBRICA            '
        +  '  AND H.IDRESPONSAVEL = ' + sIdPessoa
        +  '  AND H.IDBENEFICIO = ' + sIdBeneficio
        +  '  AND TO_DATE(H.MESCOBRANCA||''/01'',''YYYY/MM/DD'') >=                                                                   '
        +  '      TO_DATE(  ''01/'' || TO_CHAR(TO_DATE('+ QuotedStr( sDataMorte )  +',''DD/MM/YYYY''),''MM/YYYY'') ,''DD/MM/YYYY'')   '
        +  '  AND SUBSTR(H.MES,6,7) <> ''13''                                                                                         '
        +  '  AND TO_DATE(H.MES||''/01'',''YYYY/MM/DD'') >=                                                                           '
        +  '      TO_DATE(  ''01/'' || TO_CHAR(TO_DATE('+ QuotedStr( sDataMorte )  +',''DD/MM/YYYY''),''MM/YYYY'') ,''DD/MM/YYYY'')   '
        +  '  AND (   ( (H.FLGTIPODESC = ''B'') AND ( H.FLGDESCONTO IN (0,1) ) ) '  //-- BENEFICIO
        +  '       OR ( (H.FLGTIPODESC = ''P'') AND (H.FLGDESCONTO = 1) )        '  //-- TAXA ADMINISTRATIVA
        +  '       OR ( (H.FLGTIPODESC = ''C'') AND (H.FLGDESCONTO = 1) )        '  //-- MENSALIDADES
        +  '       OR ( (H.FLGTIPODESC = ''I'') AND (P.FLGENCERRAMENTO = 1) AND ( SUBSTR(H.MES,1,4) = TO_CHAR(SYSDATE,''YYYY'')  ) )   '  //-- IMPOSTO DE RENDA
        +  '       OR ( (H.FLGTIPODESC = ''Y'') AND (P.FLGENCERRAMENTO = 1) )   '  // -- AÇÃO JUDICIAL
        +  '       OR ( (H.FLGTIPODESC = ''Y'') AND (P.FLGENCERRAMENTO = 1) )   '  // -- AÇÃO JUDICIAL
        +  '       OR ( P.FLGACAOJUDICIAL = 1 )                                 '  // -- AÇÃO JUDICIAL
        +  '       )                                                            '
//        +  ' ORDER BY FLGTIPODESC, MES                                          ';   //Everson TIBERO
        +  ' ORDER BY H.FLGTIPODESC, H.MES                                          '; //Everson TIBERO

  FazQuery(qryRub, ssql);

end;

procedure TfrmEncerramentoPorFalecimento.processarAcerto(sIdLote,sMesAnoLote,sDataPagLote: String);
var iAnoMorte, iAnoAtual, iAno: Integer;
begin
    iAnoAtual := retornaAnoAutal();
//    iAnoMorte := qryLista.FieldByName('ANOMORTE').AsInteger;

    processarAcertorRubricasMensais(sIdLote); // SOL 229906 PPM 345184 Fernando Xavier

    for iAno:=iAnoMorte to iAnoAtual do
       processarAcertoAbonoAnualFuncef( IntToStr(iAno), sIdLote ); // SOL 229906 PPM 345184 Fernando Xavier

    for iAno:=iAnoMorte to iAnoAtual do
       processarAcertoAbonoAnualINSS( IntToStr(iAno), sIdLote ); // SOL 229906 PPM 345184 Fernando Xavier

    processarAcertoAbonoAnualTaxaAdm();

    for iAno:=iAnoMorte to iAnoAtual do
       processarAcertoAbonoAnualAcaoJudicial( IntToStr(iAno), sIdLote ); // SOL 229906 PPM 345184 Fernando Xavier

    {marcarBeneficioComoProcessado(qryLista.FieldByName('IDPESSOA').AsString
                                 ,qryLista.FieldByName('IDBENEFICIO').AsString); }

    {lancarHistoricoBeneficiosEfetivado(sIdLote
                                      ,sMesAnoLote
                                      ,sDataPagLote
                                      ,qryLista.FieldByName('IDPESSOA').AsString
                                      ,qryLista.FieldByName('IDTITULAR').AsString
                                      ,qryLista.FieldByName('IDPESSJUR').AsString
                                      ,qryLista.FieldByName('IDPLANOPREV').AsString
                                      ,qryLista.FieldByName('IDBENEFICIO').AsString
                                      ,qryLista.FieldByName('NUMEROPROCESSO').AsString
                                      ,sMesAnoLote
                                      ,'0' // qryRub.FieldByName('FLGDESCONTO').AsString
                                      ,qryLista.FieldByName('FONTEPAGADORA').AsString
                                      ,qryLista.FieldByName('IDPLANOORIGEM').AsString
                                      ,sMesAnoLote // SOL 229906 PPM 345184 Fernando Xavier
                                      ,0.001 ); }

end;

procedure TfrmEncerramentoPorFalecimento.marcarHistoricoBeneficiosEfetivado(sIdPessoa, sSeqOriginal: String);
var sSql : String;
begin

  sSql :=  '    UPDATE HSTBENEFBFCIARIO H                               '
        +  '    SET H.VLBENEFPGTO = VALORPREV                           '
        +  '       ,H.DATAPAGAMENTO = TO_DATE(SYSDATE,''DD/MM/YYYY'')   '
        +  '       ,H.FLGENVIADO = 1                                    '
        +  '    WHERE H.IDPESSOA = ' + sIdPessoa
        +  '      AND H.IDSEQINTERNOFB = ' + sSeqOriginal;

  FazQuery(qryAux, ssql);

end;

procedure TfrmEncerramentoPorFalecimento.lancarHistoricoBeneficioProcessado(sIdPessoa,sIdPessoaJuridica,sIdPlanoPrevidenciario,sIdBeneficio,sIdNumProcesso,sMesReferencia,sFlgDevolucao,sFontePagadora,sIdPlanoOrigem,sIdTitBenef,sIdLote, smes : String; fValorAcerto:real); // SOL 229906 PPM 345184 Fernando Xavier
var sSql, smescompreem : String;
begin

  Try

  // SOL 229906 PPM 345184 Fernando Xavier
  sSql :=  ' select  MESCOMPREEM from hstbenefbfciario '
        +  ' where   idpessoa  =  '+ qryLista.fieldbyname('IDPESSOA').Asstring
        +  ' and     mesreferencia  =  '+ QuotedStr(sMesReferencia)
        +  ' and     mes            =  '+ QuotedStr(smes)
        +  ' and     idbeneficio    =  '+ qryLista.fieldbyname('IDBENEFICIO').Asstring;


  if FazQuery(qryAux, ssql) then
  begin
      smescompreem :=  qryAux.FieldByName('MESCOMPREEM').AsString;
  end
  else
  begin
     smescompreem :=  '';
  end;


    fValorAcerto := RoundCM(fValorAcerto,2);
    sSql :=  ' INSERT INTO HSTBENEFBFCIARIO           '
          +  '      (IDTITULAR                        '
          +  '      ,IDPESSJUR                        '
          +  '      ,IDPLANOPREV                      '
          +  '      ,IDBENEFICIO                      '
          +  '      ,IDMOTIVO                         '
          +  '      ,IDPESSOA                         '
          +  '      ,NUMEROPROCESSO                   '
          +  '      ,MES                              '
          +  '      ,VLBENEFPGTO                      '
          +  '      ,SEQBENEFICIO                     '
          +  '      ,SEQPROPOSTA                      '
          +  '      ,DTEFETPGTO                       '
          +  '      ,VALORPREV                        '
          +  '      ,DATAPAGAMENTO                    '
          +  '      ,VALORCALCULADO                   '
          +  '      ,FLGACERTODESFEITO                '
          +  '      ,FLGENVIADO                       '
          +  '      ,MESREFERENCIA                    '
          +  '      ,FLGCONCESSAO                     '
          +  '      ,FLGDEVOLUCAO                     '
          +  '      ,FLGFORMAPAGTO                    '
          +  '      ,VALORTOTAL                       '
          +  '      ,FONTEPAGADORA                    '
          +  '      ,VALORINTEGRAL                    '
          +  '      ,VALORPREVMIN                     '
          +  '      ,FLGDESCIRMES                     '
          +  '      ,VALORSRB                         '
          +  '      ,FLGMANUAL                        '
          +  '      ,IDPLANOORIGEM                    '
          +  '      ,FLGPROVISORIO                    '
          +  '      ,IDTITBENEF                       '
          +  '      ,VALORACERTO                      '
          +  '      ,PERCENTUAL                       '
          +  '      ,FLGTIPOREGISTRO                  '
          +  '      ,FLGALIMRESERVA                   '
          +  '      ,IDLOTE                           ' // SOL 229906 PPM 345184 Fernando Xavier
          +  '      ,MESCOMPREEM            )         ' // SOL 229906 PPM 345184 Fernando Xavier
          +  'VALUES                                  '
          +  '     ( :IDTITULAR                       '      //     IDTITULAR
          +  '      ,:IDPESSJUR                       '      //     IDPESSJUR
          +  '      ,:IDPLANOPREV                     '      //     IDPLANOPREV
          +  '      ,:IDBENEFICIO                     '      //     IDBENEFICIO
          +  '      ,3051                             '      //     IDMOTIVO
          +  '      ,:IDPESSOA                        '      //     IDPESSOA
          +  '      ,:NUMEROPROCESSO                  '      //     NUMEROPROCESSO
          +  '      ,TO_CHAR(SYSDATE,''YYYY/MM'')     '      //     MES
          +  '      ,:VLBENEFPGTO                     '      //     VLBENEFPGTO
          +  '      ,9                                '      //     SEQBENEFICIO
          +  '      ,1                                '      //     SEQPROPOSTA
          +  '      ,TO_CHAR(SYSDATE,''DD/MM/YYYY'')  '      //     DTEFETPGTO
          +  '      ,:VALORPREV                       '      //     VALORPREV
          +  '      ,TO_CHAR(SYSDATE,''DD/MM/YYYY'')  '      //     DATAPAGAMENTO
          +  '      ,:VALORCALCULADO                  '      //     VALORCALCULADO
          +  '      ,0                                '      //     FLGACERTODESFEITO
          +  '      ,1                                '      //     FLGENVIADO
          +  '      ,:MESREFERENCIA                   '      //     MESREFERENCIA
          +  '      ,0                                '      //     FLGCONCESSAO
          +  '      ,:FLGDEVOLUCAO                    '      //     FLGDEVOLUCAO
          +  '      ,''F''                            '      //     FLGFORMAPAGTO
          +  '      ,:VALORTOTAL                      '      //     VALORTOTAL
          +  '      ,:FONTEPAGADORA                   '      //     FONTEPAGADORA
          +  '      ,:VALORINTEGRAL                   '      //     VALORINTEGRAL
          +  '      ,:VALORPREVMIN                    '      //     VALORPREVMIN
          +  '      ,0                                '      //     FLGDESCIRMES
          +  '      ,0                                '      //     VALORSRB
          +  '      ,0                                '      //     FLGMANUAL
          +  '      ,:IDPLANOORIGEM                   '      //     IDPLANOORIGEM
          +  '      ,0                                '      //     FLGPROVISORIO
          +  '      ,:IDTITBENEF                      '      //     IDTITBENEF
          +  '      ,:VALORACERTO                     '      //     VALORACERTO
          +  '      ,0                                '      //     PERCENTUAL
          +  '      ,0                                '      //     FLGTIPOREGISTRO
          +  '      ,0                                '      //     FLGALIMRESERVA
          +  '      ,:IDLOTE                          ';     //     IDLOTE // SOL 229906 PPM 345184 Fernando Xavier

          if  trim(smescompreem) <> '' then
              sSql := sSql + '  ,:MESCOMPREEM          '     //  MESCOMPREEM
          else
              sSql := sSql + '  ,null                  ';     //  MESCOMPREEM

          sSql := sSql +  '  )  ';     //SOL 229906 PPM 345184 Fernando Xavier

    qryAux.sql.Text := ssql;

    qryAux.ParamByName('IDTITULAR').AsString      := sIdTitBenef;
    qryAux.ParamByName('IDPESSJUR').AsString      := sIdPessoaJuridica;
    qryAux.ParamByName('IDPLANOPREV').AsString    := sIdPlanoPrevidenciario;
    qryAux.ParamByName('IDBENEFICIO').AsString    := sIdBeneficio;
    qryAux.ParamByName('IDPESSOA').AsString       := sIdPessoa;
    qryAux.ParamByName('NUMEROPROCESSO').AsString := sIdNumProcesso;
    qryAux.ParamByName('VLBENEFPGTO').AsFloat     := fValorAcerto;
    qryAux.ParamByName('VALORPREV').AsFloat       := fValorAcerto;
    qryAux.ParamByName('VALORCALCULADO').AsFloat  := fValorAcerto;
    qryAux.ParamByName('MESREFERENCIA').AsString  := sMesReferencia;
    qryAux.ParamByName('FLGDEVOLUCAO').AsString   := sFlgDevolucao;
    qryAux.ParamByName('VALORTOTAL').AsFloat      := fValorAcerto;
    qryAux.ParamByName('FONTEPAGADORA').AsString  := sFontePagadora;
    qryAux.ParamByName('VALORINTEGRAL').AsFloat   := fValorAcerto;
    qryAux.ParamByName('VALORPREVMIN').AsFloat    := fValorAcerto;
    qryAux.ParamByName('IDPLANOORIGEM').AsString  := sIdPlanoOrigem;
    qryAux.ParamByName('IDTITBENEF').AsString     := sIdTitBenef;
    qryAux.ParamByName('VALORACERTO').AsFloat     := fValorAcerto;
    qryAux.ParamByName('IDLOTE').AsString         := sIdLote; // SOL 229906 PPM 345184 Fernando Xavier

    if  trim(smescompreem) <> '' then //SOL 229906 PPM 345184 Fernando Xavier
       qryAux.ParamByName('MESCOMPREEM').AsString         := smescompreem;  //SOL 229906 PPM 345184 Fernando Xavier


    qryAux.ExecSQL;

  Except
    on e:Exception do
     begin
//       showmessage(e.Message);
       raise;
     end;
  end;
end;


procedure TfrmEncerramentoPorFalecimento.programarRubricaIndividual(sIdEmpresa,sIdPessoa,sIdFavorecido,sIdRubrica,sIdTitular,sPlanocontabil,sFlgPensaAlim,sMesReferencia: String; fValorAcerto:Real);
var sSql, smescompreem : String;
    iSeqRubricaIndiv: Integer;
begin

  sIdEmpresa := '1';
//  smescompreem := obtemMesCompReem();


  sSql :=  ' SELECT NVL(MAX(SEQRUBRICAINDIV),0) + 1 AS SEQRUBRICAINDIV  '
        +  ' FROM RUBRICAINDIV                                          '
        +  ' WHERE IDPESSOA =   ' + sIdPessoa
        +  '   AND IDEMPRESA =  ' + sIdEmpresa
        +  '   AND IDRUBRICA =  ' + sIdRubrica;

  if FazQuery(qryAux, ssql) then
    iSeqRubricaIndiv  := qryAux.FieldByName('SEQRUBRICAINDIV').AsInteger
  Else
    iSeqRubricaIndiv  := 0;

  qryAux.Close;
  fValorAcerto := RoundCM(fValorAcerto,2);

  sSql :=  ' INSERT INTO CM.RUBRICAINDIV '
         + ' ( IDPESSOA               '
         + '  ,IDEMPRESA              '
         + '  ,IDRUBRICA              '
         + '  ,NUMOCORRENCIAS         '
         + '  ,SEQRUBRICAINDIV        '
         + '  ,IDFAVORECIDO           '
         + '  ,IDREGRACALCULO         '
         + '  ,VALORRUBRICA           '
         + '  ,ANOMESINICIO           '
         + '  ,FLGPERMANENTE          '
         + '  ,PARCELAS               '
         + '  ,FLGPERCENT             '
         + '  ,FLGTPRUBMANUT          '
         + '  ,FLGPENSAOALIM          '
         + '  ,RUBRICAPROVENTOPA      '
         + '  ,DATAFINAL              '
         + '  ,ANOMESREF              '
         + '  ,CODPORTFORMA           '
         + '  ,IDTITULAR              '
         + '  ,DATAINICIO             '
         + '  ,FLGBASEPA              '
         + '  ,FLGUSAABONO            '
         + '  ,IDALIMENTADO           '
         + '  ,IDLOTE                 '
         + '  ,FLGDESATIVADO          '
         + '  ,FLGUSADO               '
         + '  ,FLGCALCULACPMF         '
         + '  ,ULTMESPREPARO          '
         + '  ,VALORANTERIOR          '
         + '  ,IDPROCESSO             '
         + '  ,IDRUBRICA13            '
         + '  ,IDRUBRICAPROVENTO13    '
         + '  ,IDMOTIVO               '
         + '  ,IDLOTEREVISAO          '
         + '  ,FLGANTECIPABONO        '
         + '  ,IDSEQINTERNOFB         '
         + '  ,NUMPROCINSS            '
         + '  ,IDMOVBENEF             '
         + '  ,FLGCONTROLASALDO       '
         + '  ,VLRSALDOINICIAL        '
         + '  ,VLRTOTALPROC           '
         + '  ,IDPLANOCONTABIL        '
         + '  ,FLGRETROACAO           '
         + '  ,FLGANTECIPAABONOINSS   '
         + '  ,SITUACAOAJ             '
         + '  ,OBSERVACAO             '
         + '  ,MESCOMPREEM )          '
         + ' VALUES                   '
         + ' ( :IDPESSOA   '      //  IDPESSOA
         + '  ,:IDEMPRESA  '      //  IDEMPRESA
         + '  ,:IDRUBRICA  '      //  IDRUBRICA
         + '  ,0           '      //  NUMOCORRENCIAS  // SOL 136748/14312 KINTANA 1988667 Fernando Xavier 10/03/2013 - BSB
         + '  ,:SEQRUBRICAINDIV                            ';      //  SEQRUBRICAINDIV
         if  trim(sIdFavorecido) <> '' then
           sSql := sSql + '  ,:IDFAVORECIDO                '     //  IDFAVORECIDO
         else
           sSql := sSql + '  ,null                        ';     //  IDFAVORECIDO

         sSql := sSql + '  '
         + '  ,26128     '     //+ '  ,null                                        '      //  IDREGRACALCULO
         + '  ,:VALORRUBRICA                               '      //  VALORRUBRICA
         + '  ,TO_CHAR(SYSDATE,''YYYY/MM'')                '      //  ANOMESINICIO
         + '  ,0   ' //+ '  ,1               '      //  FLGPERMANENTE
         + '  ,1               '      //  PARCELAS
         + '  ,null            '      //  FLGPERCENT
         + '  ,1               '      //  FLGTPRUBMANUT
         + '  ,:FLGPENSAOALIM  '      //  FLGPENSAOALIM
         + '  ,null            '      //  RUBRICAPROVENTOPA
         + '  ,null            '      //  DATAFINAL
         + '  ,:ANOMESREF      '      //  ANOMESREF
         + '  ,null            '      //  CODPORTFORMA
         + '  ,:IDTITULAR      '      //  IDTITULAR
         + '  ,to_date(''01/'+(trim(copy(sDataPagLoteRubIndiv,4,7)))+''', ''dd/mm/yyyy'' )    '      //  DATAINICIO // SOL 136748/14312 KINTANA 1988667 Fernando Xavier 10/03/2013 - BSB
         + '  ,null           '      //  FLGBASEPA
         + '  ,0  '// + '  ,1 '      //  FLGUSAABONO
         + '  ,null           '      //  IDALIMENTADO
         + '  ,null           '      //  IDLOTE
         + '  ,0              '      //  FLGDESATIVADO
         + '  ,1              '      //  FLGUSADO
         + '  ,0              '      //  FLGCALCULACPMF
         + '  ,TO_CHAR(ADD_MONTHS(SYSDATE,-1),''YYYY/MM'') '      //  ULTMESPREPARO
         + '  ,0     '      //  VALORANTERIOR
         + '  ,null  '      //  IDPROCESSO
         + '  ,null  '      //  IDRUBRICA13
         + '  ,null  '      //  IDRUBRICAPROVENTO13
         + '  ,3051  '      //  IDMOTIVO
         + '  ,null  '      //  IDLOTEREVISAO
         + '  ,0     '      //  FLGANTECIPABONO
         + '  ,null  '      //  IDSEQINTERNOFB
         + '  ,null  '      //  NUMPROCINSS
         + '  ,null  '      //  IDMOVBENEF
         + '  ,0     '      //  FLGCONTROLASALDO // SOL 136748/14312 KINTANA 1988667 Fernando Xavier 10/03/2013 - BSB
         + '  ,null  '      //  VLRSALDOINICIAL  // SOL 136748/14312 KINTANA 1988667 Fernando Xavier 10/03/2013 - BSB
         + '  ,0     '      //  VLRTOTALPROC
         + '  ,:IDPLANOCONTABIL '      //  IDPLANOCONTABIL
         + '  ,null  '      //  FLGRETROACAO
         + '  ,null  '      //  FLGANTECIPAABONOINSS
         + '  ,null  '      //  SITUACAOAJ
         + '  ,null  ' ;    //  OBSERVACAO
         if  trim(smescompreem) <> '' then
           sSql := sSql + '  ,:MESCOMPREEM ) '     //  MESCOMPREEM
         else
           sSql := sSql + '  ,null ) ';     //  MESCOMPREEM


  qryAux.Sql.Text := sSql;

  qryAux.ParamByName('IDPESSOA').AsString         := sIdPessoa;
  if  trim(sIdFavorecido) <> '' then
      qryAux.ParamByName('IDFAVORECIDO').AsString     := sIdFavorecido;
  qryAux.ParamByName('IDEMPRESA').AsString        := sIdEmpresa;
  qryAux.ParamByName('IDRUBRICA').AsString        := sIdRubrica;
  qryAux.ParamByName('SEQRUBRICAINDIV').AsInteger := iSeqRubricaIndiv;
  qryAux.ParamByName('VALORRUBRICA').AsFloat      := fValorAcerto;
  qryAux.ParamByName('FLGPENSAOALIM').AsString    := sFlgPensaAlim;
  qryAux.ParamByName('ANOMESREF').AsString        := sMesReferencia;
  qryAux.ParamByName('IDTITULAR').AsString        := sIdTitular;
  //qryAux.ParamByName('VLRSALDOINICIAL').AsFloat   := fValorAcerto;     // SOL 136748/14312 KINTANA 1988667 Fernando Xavier 10/03/2013 - BSB
  qryAux.ParamByName('IDPLANOCONTABIL').AsString  := sPlanocontabil;
  if  smescompreem <> '' then
      qryAux.ParamByName('MESCOMPREEM').AsString      := smescompreem;

  qryAux.SQL.savetofile('c:\planus\temp\qryAux.sql');
  qryAux.ExecSQL;


  qryAux.SQL.savetofile('c:\planus\temp\qryAux1.sql');

end;

function TfrmEncerramentoPorFalecimento.retornaIdentificadorPlanoContabil: String;
var sSql : String;
begin
  sSql :=  ' SELECT IDPLANPREVCONTAB   '
        +  ' FROM BENEFBFCIARIO        '
        +  ' WHERE IDPESSOA   = ' + qryLista.FieldByName('IDPESSOA').AsString
        +  '  AND IDTITULAR   = ' + qryLista.FieldByName('IDTITULAR').AsString
        +  '  AND IDBENEFICIO = ' + qryLista.FieldByName('IDBENEFICIO').AsString
        +  '  AND IDPLANOPREV = ' + qryLista.FieldByName('IDPLANOPREV').AsString
        +  '  AND FONTEPAGADORA = ' + qryLista.FieldByName('FONTEPAGADORA').AsString;

  if FazQuery(qryAux, ssql) then
    Result := qryAux.FieldByName('IDPLANPREVCONTAB').AsString
  Else
    Result := '';

end;


procedure TfrmEncerramentoPorFalecimento.marcarBeneficioComoProcessado( sIdPessoa, sIdBeneficio: String);
var sSql:String;
begin
    sSql :=  ' UPDATE BENEFBFCIARIO                    '
           + ' SET FLGACERTO = 1                       '
           + ' WHERE IDPESSOA = ' + sIdPessoa
           + '  AND IDBENEFICIO = ' + sIdBeneficio;

    qryAux.SQL.Text := sSql;
    qryAux.ExecSQL;
    qryAux.Close;

end;

function TfrmEncerramentoPorFalecimento.retornaPeriodoAutal: String;
var sSql : String;
begin
  sSql :=  ' SELECT TO_CHAR(SYSDATE,''YYYY/MM'') AS MESANO FROM DUAL   ';

  if FazQuery(qryAux, ssql) then
    Result := qryAux.FieldByName('MESANO').AsString
  Else
    Result := '';

end;

function TfrmEncerramentoPorFalecimento.retornaDataAutal: String;
var sSql : String;
begin
  sSql :=  ' SELECT TO_CHAR(SYSDATE,''DD/MM/YYYY'') AS DATA FROM DUAL   ';

  if FazQuery(qryAux, ssql) then
    Result := qryAux.FieldByName('DATA').AsString
  Else
    Result := '';

end;

function TfrmEncerramentoPorFalecimento.retornaPatrocinadora(sIdPessoaJuridica: String): String;
var sSql : String;
begin
  sSql :=  ' SELECT PE.NOME '
        +  ' FROM PATRO PA, '
        +  ' PESSOA PE '
        +  ' WHERE PA.IDPESSOA = PE.IDPESSOA '
        +  ' AND PA.IDPESSOA = ' + sIdPessoaJuridica;

  if FazQuery(qryAux, ssql) then
   result := qryAux.FieldByName('NOME').AsString
  else
   result := '';

end;

function TfrmEncerramentoPorFalecimento.verificaHistoricoBeneficioJaProcessado( sIdPessoa, sIdPessoaJuridica, sIdPlanoPrevidenciario, sIdBeneficio,
  sIdNumProcesso, sMesReferencia, sIdPlanoOrigem, sIdTitBenef: String; var flgDevolucao: String; var fValor: real): boolean;
var sSql : String;
begin

    sSql :=  ' SELECT FLGDEVOLUCAO,VLBENEFPGTO            '
          +  ' FROM HSTBENEFBFCIARIO                      '
          +  ' WHERE  IDPLANOPREV = :IDPLANOPREV          '
          +  '    AND IDBENEFICIO = :IDBENEFICIO          '
          +  '    AND MES = TO_CHAR(SYSDATE,''YYYY/MM'')  '
          +  '    AND IDMOTIVO = 3051                     '
          +  '    AND NUMEROPROCESSO = :NUMEROPROCESSO    '
          +  '    AND MESREFERENCIA = :MESREFERENCIA      '
          +  '    AND SEQBENEFICIO = 9                    '
          +  '    AND IDPESSJUR = :IDPESSJUR              '
          +  '    AND IDTITULAR = :IDTITULAR              '
          +  '    AND IDPLANOORIGEM = :IDPLANOORIGEM      '
          +  '    AND IDPESSOA = :IDPESSOA                '
          +  '    AND SEQPROPOSTA = 1                     ';

    qryAux.sql.Text := ssql;

    qryAux.ParamByName('IDPLANOPREV').AsString    := sIdPlanoPrevidenciario;
    qryAux.ParamByName('IDBENEFICIO').AsString    := sIdBeneficio;
    qryAux.ParamByName('NUMEROPROCESSO').AsString := sIdNumProcesso;
    qryAux.ParamByName('MESREFERENCIA').AsString  := sMesReferencia;
    qryAux.ParamByName('IDPESSJUR').AsString      := sIdPessoaJuridica;
    qryAux.ParamByName('IDTITULAR').AsString      := sIdTitBenef;
    qryAux.ParamByName('IDPLANOORIGEM').AsString  := sIdPlanoOrigem;
    qryAux.ParamByName('IDPESSOA').AsString       := sIdPessoa;


    qryAux.Open;

    result := not qryAux.isEmpty;

    if not qryAux.isEmpty then
     begin
        flgDevolucao := qryAux.FieldByname('FLGDEVOLUCAO').AsString;
        fValor       := qryAux.FieldByname('VLBENEFPGTO').AsFloat;
     end;

    qryAux.Close;

end;

procedure TfrmEncerramentoPorFalecimento.AlterarHistoricoBeneficioProcessado( sIdPessoa, sIdPessoaJuridica, sIdPlanoPrevidenciario, sIdBeneficio,
 sIdNumProcesso, sMesReferencia, sIdPlanoOrigem, sIdTitBenef, flgDevolucao: String; fValorAcerto: real);
var sSql : String;
begin
  Try
    fValorAcerto := RoundCM(fValorAcerto,2);
    sSql :=  ' UPDATE HSTBENEFBFCIARIO                                '
          +  ' SET VLBENEFPGTO = ABS(:VLBENEFPGTO)                    '
          +  '    ,VALORPREV = ABS(:VALORPREV)                        '
          +  '    ,VALORCALCULADO = ABS(:VALORCALCULADO)              '
          +  '    ,VALORTOTAL = ABS(:VALORTOTAL)                      '
          +  '    ,VALORINTEGRAL = ABS(:VALORINTEGRAL)                '
          +  '    ,VALORPREVMIN = ABS(:VALORPREVMIN)                  '
          +  '    ,VALORACERTO = ABS(:VALORACERTO)                    '
          +  '    ,FLGDEVOLUCAO = :FLGDEVOLUCAO                       '
          +  ' WHERE  IDPLANOPREV = :IDPLANOPREV                      '
          +  '    AND IDBENEFICIO = :IDBENEFICIO                      '
          +  '    AND MES = TO_CHAR(SYSDATE,''YYYY/MM'')              '
          +  '    AND IDMOTIVO = 3051                                 '
          +  '    AND NUMEROPROCESSO = :NUMEROPROCESSO                '
          +  '    AND MESREFERENCIA = :MESREFERENCIA                  '
          +  '    AND SEQBENEFICIO = 9                                '
          +  '    AND IDPESSJUR = :IDPESSJUR                          '
          +  '    AND IDTITULAR = :IDTITULAR                          '
          +  '    AND IDPLANOORIGEM = :IDPLANOORIGEM                  '
          +  '    AND IDPESSOA = :IDPESSOA                            '
          +  '    AND SEQPROPOSTA = 1                                 ';
    qryAux.sql.Text := ssql;

    qryAux.ParamByName('VLBENEFPGTO').AsFloat     := fValorAcerto;
    qryAux.ParamByName('VALORPREV').AsFloat       := fValorAcerto;
    qryAux.ParamByName('VALORCALCULADO').AsFloat  := fValorAcerto;
    qryAux.ParamByName('VALORTOTAL').AsFloat      := fValorAcerto;
    qryAux.ParamByName('VALORINTEGRAL').AsFloat   := fValorAcerto;
    qryAux.ParamByName('VALORPREVMIN').AsFloat    := fValorAcerto;
    qryAux.ParamByName('VALORACERTO').AsFloat     := fValorAcerto;
    qryAux.ParamByName('FLGDEVOLUCAO').AsString   := flgDevolucao;

    qryAux.ParamByName('IDPLANOPREV').AsString    := sIdPlanoPrevidenciario;
    qryAux.ParamByName('IDBENEFICIO').AsString    := sIdBeneficio;
    qryAux.ParamByName('NUMEROPROCESSO').AsString := sIdNumProcesso;
    qryAux.ParamByName('MESREFERENCIA').AsString  := sMesReferencia;
    qryAux.ParamByName('IDPESSJUR').AsString      := sIdPessoaJuridica;
    qryAux.ParamByName('IDTITULAR').AsString      := sIdTitBenef;
    qryAux.ParamByName('IDPLANOORIGEM').AsString  := sIdPlanoOrigem;
    qryAux.ParamByName('IDPESSOA').AsString       := sIdPessoa;

    qryAux.ExecSQL;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

procedure TfrmEncerramentoPorFalecimento.lancarHistoricoContribuicaoProcessado( sIdPessoa, sIdPessoaJuridica, sIdPlanoPrevidenciario,
  sMesReferencia,sFlgDevolucao: String; fValorAcerto: real; pIdContribuicao: Integer = 0);
var sSql : String;
    sIdContribuicao,sDataInicioContribuicao : String;
    iNumRecebimento: Integer;
begin

  Try
   if pIdContribuicao = 0 then
    begin
      sSql :=  ' SELECT IDCONTRIBUICAO, DATAINICIO                  '
            +  ' FROM CM.HSTCONTRIBPREV                             '
            +  ' WHERE IDPESSOA = :IDPESSOA                         '
            +  ' AND MESREFERENCIA = :MESREFERENCIA                 '
            +  ' AND IDPLANOPREV = :IDPLANOPREV                     '
            +  ' AND IDPESSJUR = :IDPESSJUR                         ';


      qryAux.sql.Text := ssql;
      qryAux.ParamByName('IDPESSOA').AsString       := sIdPessoa;
      qryAux.ParamByName('MESREFERENCIA').AsString  := sMesReferencia;
      qryAux.ParamByName('IDPLANOPREV').AsString    := sIdPlanoPrevidenciario;
      qryAux.ParamByName('IDPESSJUR').AsString      := sIdPessoaJuridica;
      qryAux.Open;
    end
    else
    begin
      sSql :=  ' SELECT IDCONTRIBUICAO, DATAINICIO                  '
            +  ' FROM CM.HSTCONTRIBPREV                             '
            +  ' WHERE IDPESSOA = :IDPESSOA                         '
            +  ' AND MESREFERENCIA = :MESREFERENCIA                 '
            +  ' AND IDPLANOPREV = :IDPLANOPREV                     '
            +  ' AND IDPESSJUR = :IDPESSJUR                         '
            +  ' AND IDCONTRIBUICAO = :IDCONTRIBUICAO               ';


      qryAux.sql.Text := ssql;
      qryAux.ParamByName('IDPESSOA').AsString       := sIdPessoa;
      qryAux.ParamByName('MESREFERENCIA').AsString  := sMesReferencia;
      qryAux.ParamByName('IDPLANOPREV').AsString    := sIdPlanoPrevidenciario;
      qryAux.ParamByName('IDPESSJUR').AsString      := sIdPessoaJuridica;
      qryAux.ParamByName('IDCONTRIBUICAO').AsInteger     := pIdContribuicao;
      qryAux.Open;
    end;


    if not qryAux.IsEmpty then
     begin
        sIdContribuicao          := qryAux.FieldByname('IDCONTRIBUICAO').AsString;
        sDataInicioContribuicao  := qryAux.FieldByname('DATAINICIO').AsString;
        qryAux.close;
     end
    Else
     begin
        qryAux.close;
        Exit;
     end;

    iNumRecebimento := LeUltRegistro(dtmAPrev.qry, 'HSTCONTRIBPREV');


    sSql :=  ' INSERT INTO CM.HSTCONTRIBPREV     '
          +  '  (MESREFERENCIA                   '     // mesreferencia --Mês referência da contriubição hstrubsal
          +  '  ,MESCOBRANCA                     '     // mescobranca -- Mês de processamento do encerramento
          +  '  ,NUMRECEBIMENTO                  '     // numrecebimento -- Identificador dos registros
          +  '  ,IDMOTIVO                        '     // idmotivo -- 3009 (Devolução de Benefícios)
          +  '  ,IDPESSOA                        '     // idpessoa -- Identificador da Pessoa
          +  '  ,VALORESPERADO                   '     // valoresperado -- Valor da contribuição
          +  '  ,IDPLANOPREV                     '     // idplanoprev -- plano previdenciário
          +  '  ,DATARECEBIMENTO                 '     // datarecebimento -- Data do encerramento
          +  '  ,IDCONTRIBUICAO                  '     // idcontribuicao -- Identificador da contribuição associada ao participante
          +  '  ,VALORRECEBIDO                   '     // valorrecebido -- Valor da contribuição
          +  '  ,DATAPREVISAORECE                '     // dataprevisaorece -- Data do encerramento
          +  '  ,FLGCALCRESERVA                  '     // flgcalcreserva -- 0
          +  '  ,VALORCALCULADO                  '     // valorcalculado -- Valor da Contribuição
          +  '  ,VALOROP1                        '     // valorop1 -- 0
          +  '  ,VALOROP2                        '     // valorop2 -- 0
          +  '  ,VALOROP3                        '     // valorop3 -- 0
          +  '  ,FLGDESCFOLHA                    '     // flgdescfolha -- 1
          +  '  ,DATAINICIO                      '     // datainicio -- Data Início da contribuição
          +  '  ,FLGSITFUNDACAO                  '     // flgsitfundacao -- AS (assistido)
          +  '  ,SITRECEBIMENTO                  '     // sitrecebimento -- 2
          +  '  ,TIPO                            '     // tipo -- F
          +  '  ,PARCELA                         '     // parcela -- 0
          +  '  ,SEQPROPOSTA                     '     // seqproposta -- 1
          +  '  ,FLGDEVOLUCAO                    '     // flgdevolucao -- 1
          +  '  ,FLGDIVERGENTE                   '     // flgdivergente -- 0
          +  '  ,FLGCONCESSAO                    '     // flgconcessao -- 0
          +  '  ,FLGEVENTO                       '     // flgevento -- 0
          +  '  ,FONTEPAGADORA                   '     // fontepagadora -- 1
          +  '  ,IDPESSJUR                       '     // idpessjur -- identificador da pessoa juídica
          +  '  ,FOLHAORIGEM )                   '     // folhaorigem -- B fixo
          +  ' VALUES                            '
          +  '  (:MESREFERENCIA                  '     // mesreferencia --Mês referência da contriubição hstrubsal
          +  '  ,TO_CHAR(SYSDATE,''YYYY/MM'')    '     // mescobranca -- Mês de processamento do encerramento
          +  '  ,:NUMRECEBIMENTO                 '     // numrecebimento -- Identificador dos registros
          +  '  ,3009                            '     // idmotivo -- 3009 (Devolução de Benefícios)
          +  '  ,:IDPESSOA                       '     // idpessoa -- Identificador da Pessoa
          +  '  ,:VALORESPERADO                  '     // valoresperado -- Valor da contribuição
          +  '  ,:IDPLANOPREV                    '     // idplanoprev -- plano previdenciário
          +  '  ,TO_CHAR(SYSDATE,''DD/MM/YYYY'') '  // datarecebimento -- Data do encerramento
          +  '  ,:IDCONTRIBUICAO                 '     // idcontribuicao -- Identificador da contribuição associada ao participante
          +  '  ,:VALORRECEBIDO                  '     // valorrecebido -- Valor da contribuição
          +  '  ,TO_CHAR(SYSDATE,''DD/MM/YYYY'') ' // dataprevisaorece -- Data do encerramento
          +  '  ,0                               '     // flgcalcreserva -- 0
          +  '  ,:VALORCALCULADO                 '     // valorcalculado -- Valor da Contribuição
          +  '  ,0                               '     // valorop1 -- 0
          +  '  ,0                               '     // valorop2 -- 0
          +  '  ,0                               '     // valorop3 -- 0
          +  '  ,:FLGDESCFOLHA                   '     // FLGDESCFOLHA -- 1
          +  '  ,:DATAINICIO                     '     // datainicio -- Data Início da contribuição
          +  '  ,''AS''                          '     // flgsitfundacao -- AS (assistido)
          +  '  ,2                               '     // sitrecebimento -- 2
          +  '  ,''F''                           '     // tipo -- F
          +  '  ,0                               '     // parcela -- 0
          +  '  ,1                               '     // seqproposta -- 1
          +  '  ,1                               '     // flgdevolucao -- 1
          +  '  ,0                               '     // flgdivergente -- 0
          +  '  ,0                               '     // flgconcessao -- 0
          +  '  ,0                               '     // flgevento -- 0
          +  '  ,1                               '     // fontepagadora -- 1
          +  '  ,:IDPESSJUR                      '     // idpessjur -- identificador da pessoa juídica
          +  '  ,''B''  )                        ';    // folhaorigem -- B fixo

    qryAux.sql.Text := ssql;

    qryAux.ParamByName('MESREFERENCIA').AsString   := sMesReferencia;
    qryAux.ParamByName('NUMRECEBIMENTO').AsInteger := iNumRecebimento;
    qryAux.ParamByName('IDPESSOA').AsString       := sIdPessoa;
    qryAux.ParamByName('VALORESPERADO').AsFloat   := fValorAcerto;
    qryAux.ParamByName('IDPLANOPREV').AsString    := sIdPlanoPrevidenciario;
    qryAux.ParamByName('IDCONTRIBUICAO').AsString := sIdContribuicao;
    qryAux.ParamByName('VALORRECEBIDO').AsFloat   := fValorAcerto;
    qryAux.ParamByName('VALORCALCULADO').AsFloat  := fValorAcerto;
    qryAux.ParamByName('FLGDESCFOLHA').AsString   := sFlgDevolucao;
    qryAux.ParamByName('DATAINICIO').AsString     := sDataInicioContribuicao;
    qryAux.ParamByName('IDPESSJUR').AsString      := sIdPessoaJuridica;

    qryAux.ExecSQL;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;
end;

function TfrmEncerramentoPorFalecimento.retornaValorAtualProvento: real;
var sSql : String;
begin
  sSql :=  ' SELECT VALORATUAL    '
        +  ' FROM  BENEFBFCIARIO  '
        +  ' WHERE IDPESSOA     = ' + qryLista.FieldByName('IDPESSOA').AsString
        +  '  AND IDBENEFICIO   = ' + qryLista.FieldByName('IDBENEFICIO').AsString
        +  '  AND FONTEPAGADORA = ' + qryLista.FieldByName('FONTEPAGADORA').AsString;

  if FazQuery(qryAux, ssql) then
    Result := qryAux.FieldByName('VALORATUAL').AsFloat
  Else
    Result := 0;
end;

procedure TfrmEncerramentoPorFalecimento.InsereOuAlteraHistoricoBeneficioProcessado(sIdPessoa, sIdPessoaJuridica, sIdPlanoPrevidenciario, sIdBeneficio,
  sIdNumProcesso, sMesReferencia, sFlgDevolucao, sFontePagadora,sIdPlanoOrigem, sIdTitBenef,sIdLote, smes : String; fValorAcerto: real);  // SOL 229906 PPM 345184 Fernando Xavier
var flgDevolucaoAnt: String;
    fValorAnt: Real;
begin
   fValorAnt       := 0;
   flgDevolucaoAnt := '';


   if not verificaHistoricoBeneficioJaProcessado(  sIdPessoa
                                                  ,sIdPessoaJuridica
                                                  ,sIdPlanoPrevidenciario
                                                  ,sIdBeneficio
                                                  ,sIdNumProcesso
                                                  ,sMesReferencia
                                                  ,sIdPlanoOrigem
                                                  ,sIdTitBenef
                                                  ,flgDevolucaoAnt
                                                  ,fValorAnt) then
       Begin
            lancarHistoricoBeneficioProcessado(sIdPessoa
                                              ,sIdPessoaJuridica
                                              ,sIdPlanoPrevidenciario
                                              ,sIdBeneficio
                                              ,sIdNumProcesso
                                              ,sMesReferencia
                                              ,sFlgDevolucao
                                              ,sFontePagadora
                                              ,sIdPlanoOrigem
                                              ,sIdTitBenef
                                              ,sIdLote // SOL 229906 PPM 345184 Fernando Xavier
                                              ,smes // SOL 229906 PPM 345184 Fernando Xavier
                                              ,fValorAcerto);
       end
   else
       begin
            if (flgDevolucaoAnt <> sFlgDevolucao) then
             begin
                 if fValorAnt >= fValorAcerto then
                   sFlgDevolucao := flgDevolucaoAnt;

                 fValorAcerto := fValorAcerto*-1;
             end;

            fValorAcerto := abs(fValorAnt + fValorAcerto);

            AlterarHistoricoBeneficioProcessado(sIdPessoa
                                                ,sIdPessoaJuridica
                                                ,sIdPlanoPrevidenciario
                                                ,sIdBeneficio
                                                ,sIdNumProcesso
                                                ,sMesReferencia
                                                ,sIdPlanoOrigem
                                                ,sIdTitBenef
                                                ,sFlgDevolucao
                                                ,fValorAcerto );

       end;

end;

procedure TfrmEncerramentoPorFalecimento.consultarRubricasAbono(
  sIdPessoa, sIdBeneficio, sDataMorte, sFontePagadora, sAnoReferencia: String);
var sSql : String;
begin
  sSql :=  ' SELECT H.MES                                 '
        +  '    ,H.MESCOBRANCA                            '
        +  '    ,CASE WHEN SUBSTR(H.MES,6,7) = ''13''     '
        +  '      THEN ''SIM''                            '
        +  '      ELSE ''NAO''                            '
        +  '     END AS ABONOANUAL                        '
        +  '    ,H.IDPESSJUR                              '
        +  '    ,H.IDRUBRICA                              '
        +  '    ,H.IDMOTIVO                               '
        +  '    ,H.REFERENCIA                             '
        +  '    ,H.IDPESSOA                               '
        +  '    ,H.SEQRUBRICA                             '
        +  '    ,H.CODIRRFDARF                            '
        +  '    ,H.IDHSTFOLHABENEF                        '
        +  '    ,H.CODDOCUMENTO                           '
        +  '    ,H.IDLANCIRRF                             '
        +  '    ,H.IDRESPONSAVEL                          '
        +  '    ,H.IDPATRO                                '
        +  '    ,H.IDRETROATIVO                           '
        +  '    ,H.CODMOEDA                               '
        +  '    ,H.IDREGRACALCULO                         '
        +  '    ,H.CODPROVDESC                            '
        +  '    ,H.VALORPROVENTO                          '
        +  '    ,H.FLGCOMPOESALPART                       '
        +  '    ,H.FLGCOMPOESALBENEF                      '
        +  '    ,H.FLGIRRF                                '
        +  '    ,H.VALORCOTAS                             '
        +  '    ,H.VLRANTRETROATIVO                       '
        +  '    ,H.FLGCOMPOEREMTOTAL                      '
        +  '    ,H.FLGPREVIA                              '
        +  '    ,H.FLGSRB                                 '
        +  '    ,H.FLGCONCESSAO                           '
        +  '    ,H.FONTEPAGADORA                          '
        +  '    ,H.DATAPAGAMENTO                          '
        +  '    ,H.FLGSALPARTRETRO                        '
        +  '    ,H.FLGSALPARTATUARIA                      '
        +  '    ,H.FLGSALBENEFRETRO                       '
        +  '    ,H.IDMODULO                               '
        +  '    ,H.VALORINFO                              '
        +  '    ,H.VALORNADIB                             '
        +  '    ,H.TIPOITEMPCS                            '
        +  '    ,H.SEQHISTFUNC                            '
        +  '    ,H.FLGEQUIPARACAO                         '
        +  '    ,H.PERCENTUALNADIB                        '
        +  '    ,H.VALORRECEBIDO                          '
        +  '    ,H.IDTITULAR                              '
        +  '    ,H.IDPLANOPREV                            '
        +  '    ,H.IDFAVORECIDO                           '
        +  '    ,H.CODPORTFORMA                           '
        +  '    ,H.FLGPENSAOALIM                          '
        +  '    ,H.IDINFORME                              '
        +  '    ,H.IDCBANCARIA                            '
        +  '    ,H.NUMBANCO                               '
        +  '    ,H.NUMAGENCIA                             '
        +  '    ,H.CONTACORRENTE                          '
        +  '    ,H.FLGESTORNO                             '
        +  '    ,H.IDVERSAOPAGTO                          '
        +  '    ,H.VALORINTEGRAL                          '
        +  '    ,H.IDLANCIRRFESTORNO                      '
        +  '    ,H.FLGTIPODESC                            '
        +  '    ,H.LOTEORIGINAL                           '
        +  '    ,H.SEQORIGINAL                            '
        +  '    ,H.PERCENTUAL                             '
        +  '    ,H.NUMEROPROCESSO                         '
        +  '    ,H.NUMPROCINSS                            '
        +  '    ,H.TRGDTINCLUSAO                          '
        +  '    ,H.TRGUSERINCLUSAO                        '
        +  '    ,H.FLGSALFAM                              '
        +  '    ,H.FLGIRRFTOTAL                           '
        +  '    ,H.FLGMOLESTIAGRAVE                       '
        +  '    ,H.NUMDEPIRRF                             '
        +  '    ,H.NUMDEPSF                               '
        +  '    ,H.FLGISENTOIRRF                          '
        +  '    ,H.IDPLANOORIGEM                          '
        +  '    ,H.IDRESPONNAOREC                         '
        +  '    ,H.PARCELAS                               '
        +  '    ,H.ORDEM                                  '
        +  '    ,H.CODCENTROCUSTOD                        '
        +  '    ,H.PLANO                                  '
        +  '    ,H.UNIDNEGOC                              '
        +  '    ,H.CODSUBCONTA                            '
        +  '    ,H.CODCENTRORESPON                        '
        +  '    ,H.RECPAG                                 '
        +  '    ,H.CODTIPRECDES                           '
        +  '    ,H.PLACONTAC                              '
        +  '    ,H.PLACONTAD                              '
        +  '    ,H.IDPLANOCONTABIL                        '
        +  '    ,H.CODCENTROCUSTOC                        '
        +  '    ,H.FLGESPECIAL                            '
        +  '    ,H.FLGDESCONTO                            '
        +  '    ,H.IDRECEBEPGTO                           '
        +  '    ,H.IDPROCJUD                              '
        +  '    ,H.IDBENEFICIO                            '
        +  '    ,H.NUMDOCUMENTO                           '
        +  '    ,H.CODDOCUMENTOPGAPAGAR                   '
        +  '    ,H.CODDOCUMENTOPGARECEBER                 '
        +  ' FROM HISTRUBSAL H                            '
        +  '     ,PROVDESC P                              '
        +  ' WHERE  P.IDPROVENTO = H.IDRUBRICA            '
        +  '  AND H.IDRESPONSAVEL = ' + sIdPessoa
        +  '  AND H.IDBENEFICIO = ' + sIdBeneficio
        +  '  AND SUBSTR(H.MES,6,7) = ''13''                                                                                          '
        +  '  AND SUBSTR(H.MES,1,4) >= TO_CHAR(TO_DATE('+ QuotedStr( sDataMorte )  +',''DD/MM/YYYY''),''YYYY'')                       '
        +  '  AND (H.FLGTIPODESC = ''B'')  '  //-- BENEFICIO
        +  '  AND (H.FONTEPAGADORA = '+sFontePagadora+')    '  //-- BENEFICIO
        +  '  AND (SUBSTR(H.MES,1,4) = '+sAnoReferencia+')  '  //-- ANO REFERENCIA
//        +  ' ORDER BY FLGTIPODESC          '; //Everson TIBERO
        +  ' ORDER BY H.FLGTIPODESC          '; //Everson TIBERO

  FazQuery(qryRub, ssql);
end;

procedure TfrmEncerramentoPorFalecimento.processarAcertoAbonoAnualFuncef(sAnoReferencia, sIdLote: String); // SOL 229906 PPM 345184 Fernando Xavier
var sRubrica,FlagDevolucao,sPlanoContabil, sRubricaAbono, sRubricaTxAdm, sPeriodoDesconto, sFlgDesconto, sIdFavorecido: String;
    fValorAcerto,fValorProvento, fValorTxAdm, fSomaAbono, fPercTxAdm, fSomaRubAdicTaxa: REAL;
    bInserirRI :boolean;
begin

    consultarRubricasAbono( qryLista.FieldByName('IDPESSOA').AsString
                          , qryLista.FieldByName('IDBENEFICIO').AsString
                          , qryLista.FieldByName('DATAMORTE').AsString
                          ,'1'
                          , sAnoReferencia);

    fSomaAbono := 0;

    While not qryRub.Eof do
     begin

       sIdFavorecido  := qryRub.FieldByName('IDFAVORECIDO').AsString;
       fValorAcerto   := 0;
       bInserirRI     := True;
       fValorProvento := qryRub.FieldByName('VALORPROVENTO').AsFloat;

       // Benefício FUNCEF - ABONO ANUAL
       if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
         and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
         and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 0 )   then
          begin
           fValorAcerto := fValorProvento;
           fSomaAbono   := fSomaAbono + fValorProvento
          end

       // Benefício FUNCEF - ABONO ANUAL - DESCONTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
         and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
         and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )   then
          begin
           fValorAcerto := fValorProvento;
           fSomaAbono   := fSomaAbono - fValorProvento
          end;

       qryRub.Next;

     end;

    if fSomaAbono > 0 then
       sFlgDesconto :='1'
    Else
     begin
       sFlgDesconto :='0';
       fSomaAbono   := fSomaAbono*-1;
     end;

    if fSomaAbono <> 0 then
     begin
           sPlanoContabil := retornaIdentificadorPlanoContabil();

           sRubricaAbono := '34188';

           sRubrica := sRubricaAbono;
           sRubrica := retornaRubricaDesconto(sRubrica);

           sPeriodoDesconto :=  sAnoReferencia + '/13';

           programarRubricaIndividual(qryLista.FieldByName('IDPESSJUR').AsString
                                     ,qryLista.FieldByName('IDPESSOA').AsString
                                     ,sIdFavorecido
                                     ,sRubrica
                                     ,qryLista.FieldByName('IDTITULAR').AsString
                                     ,sPlanoContabil
                                     ,qryRub.FieldByName('FLGPENSAOALIM').AsString
                                     ,sPeriodoDesconto
                                     ,fSomaAbono  );

           sPeriodoDesconto :=  sAnoReferencia + '/13';

           InsereOuAlteraHistoricoBeneficioProcessado(qryLista.FieldByName('IDPESSOA').AsString
                                                     ,qryLista.FieldByName('IDPESSJUR').AsString
                                                     ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                     ,qryLista.FieldByName('IDBENEFICIO').AsString
                                                     ,qryLista.FieldByName('NUMEROPROCESSO').AsString
                                                     ,sPeriodoDesconto
                                                     ,sFlgDesconto
                                                     ,qryLista.FieldByName('FONTEPAGADORA').AsString
                                                     ,qryLista.FieldByName('IDPLANOORIGEM').AsString
//                                                     ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                     ,qryLista.FieldByName('IDTITULAR').AsString
                                                     ,sIdLote// SOL 229906 PPM 345184 Fernando Xavier
                                                     ,qryRub.FieldByName('MESCOBRANCA').AsString // SOL 229906 PPM 345184 Fernando Xavier
                                                     ,fSomaAbono);

           fPercTxAdm     := 0;
           sRubricaTxAdm  := '';
           fSomaRubAdicTaxa := 0;
           fValorProvento :=  retornaValorProventoMesMorte(fPercTxAdm,fSomaRubAdicTaxa,sRubricaTxAdm);

           if fValorProvento = 0 then
                fValorProvento :=  retornaValorAtualProvento();

           if qryLista.FieldByName('ANOMORTE').AsString <>  sAnoReferencia then
              fValorAcerto := 0
           Else if ( qryLista.FieldByName('DIAMORTE').AsInteger >= 15 ) then
              fValorAcerto := fValorProvento * (qryLista.FieldByName('MESMORTE').AsInteger)/12
           Else
              fValorAcerto := fValorProvento * (qryLista.FieldByName('MESMORTE').AsInteger -1 )/12;

            If fValorAcerto <> 0 then
            begin
                  programarRubricaIndividual( qryLista.FieldByName('IDPESSJUR').AsString
                                             ,qryLista.FieldByName('IDPESSOA').AsString
                                             ,sIdFavorecido
                                             ,sRubricaAbono
                                             ,qryLista.FieldByName('IDTITULAR').AsString
                                             ,sPlanoContabil
                                             ,qryRub.FieldByName('FLGPENSAOALIM').AsString
                                             ,sPeriodoDesconto
                                             ,fValorAcerto  );

                  //Lança histórico do abono proporcional
                  InsereOuAlteraHistoricoBeneficioProcessado(qryLista.FieldByName('IDPESSOA').AsString
                                                            ,qryLista.FieldByName('IDPESSJUR').AsString
                                                            ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                            ,qryLista.FieldByName('IDBENEFICIO').AsString
                                                            ,qryLista.FieldByName('NUMEROPROCESSO').AsString
                                                            ,sPeriodoDesconto
                                                            ,'0'
                                                            ,qryLista.FieldByName('FONTEPAGADORA').AsString
                                                            ,qryLista.FieldByName('IDPLANOORIGEM').AsString
//                                                            ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                            ,qryLista.FieldByName('IDTITULAR').AsString
                                                            ,sIdLote // SOL 229906 PPM 345184 Fernando Xavier
                                                            ,qryRub.FieldByName('MESCOBRANCA').AsString // SOL 229906 PPM 345184 Fernando Xavier
                                                            ,fValorAcerto);
           end;

           If (fValorAcerto <> 0) and (fPercTxAdm <> 0) and (sRubricaTxAdm<>'')  then
           begin
                  fSomaRubAdicTaxa := retornaTotalRubricasAbonoAnualAcaoJudicial(sAnoReferencia);

                  if qryLista.FieldByName('ANOMORTE').AsString <>  sAnoReferencia then
                      fSomaRubAdicTaxa := 0
                  Else if ( qryLista.FieldByName('DIAMORTE').AsInteger > 15 ) then
                      fSomaRubAdicTaxa := fSomaRubAdicTaxa * (qryLista.FieldByName('MESMORTE').AsInteger)/12
                  Else
                      fSomaRubAdicTaxa := fSomaRubAdicTaxa * (qryLista.FieldByName('MESMORTE').AsInteger -1 )/12;

                  fValorTxAdm := (fValorAcerto + fSomaRubAdicTaxa)* fPercTxAdm;
                  fValorTxAdm :=  StrToFloat( FormatFloat('#0.00',fValorTxAdm) ); // Andre Imakawa - SIG 34692


                  programarRubricaIndividual( qryLista.FieldByName('IDPESSJUR').AsString
                                             ,qryLista.FieldByName('IDPESSOA').AsString
                                             ,sIdFavorecido
                                             ,sRubricaTxAdm
                                             ,qryLista.FieldByName('IDTITULAR').AsString
                                             ,sPlanoContabil
                                             ,qryRub.FieldByName('FLGPENSAOALIM').AsString
                                             ,sPeriodoDesconto
                                             ,fValorTxAdm  );


           end;

     end;
    qryRub.Close();

end;

procedure TfrmEncerramentoPorFalecimento.processarAcertorRubricasMensais(sIdLote: String);
var sRubrica,sPlanoContabil,sFlgDesconto: String;
    fValorAcerto,fValorProvento,fValorLancamento: REAL;
begin

    consultarRubricasTratadas(qryLista.FieldByName('IDPESSOA').AsString
                            , qryLista.FieldByName('IDBENEFICIO').AsString
                            , qryLista.FieldByName('DATAMORTE').AsString);


    While not qryRub.Eof do
     begin

       fValorAcerto   := 0;
       fValorProvento := qryRub.FieldByName('VALORPROVENTO').AsFloat;

       // Benefício FUNCEF - FLGACAOJUDICIAL - MES FALECIMENTO
       if    ( qryRub.FieldByName('FLGACAOJUDICIAL').AsInteger = 1 )
         and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' )
         and ( qryRub.FieldByName('MES').AsString = qryLista.FieldByName('MESANOMORTE').AsString ) then
         fValorAcerto := fValorProvento * (30 - qryLista.FieldByName('DIAMORTE').AsInteger + 1  )/30

       // Benefício FUNCEF - FLGACAOJUDICIAL - MES <> FALECIMENTO
       Else if ( qryRub.FieldByName('FLGACAOJUDICIAL').AsInteger = 1 )
           and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
           and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' )
           and ( qryRub.FieldByName('MES').AsString <> qryLista.FieldByName('MESANOMORTE').AsString ) then
        fValorAcerto := fValorProvento

       // Benefício FUNCEF - MES FALECIMENTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
         and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' )
         and ( qryRub.FieldByName('MES').AsString = qryLista.FieldByName('MESANOMORTE').AsString ) then
         fValorAcerto := fValorProvento * (30 - qryLista.FieldByName('DIAMORTE').AsInteger + 1  )/30

       // Benefício FUNCEF - MES <> FALECIMENTO
       Else if ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
         and (  qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' )
         and ( qryRub.FieldByName('MES').AsString <> qryLista.FieldByName('MESANOMORTE').AsString ) then
        fValorAcerto := fValorProvento

       // TAXAS ADMINISTRATIVAS - MES FALECIMENTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'P' )
         and ( qryRub.FieldByName('MES').AsString = qryLista.FieldByName('MESANOMORTE').AsString )
         and ( qryLista.FieldByName('DIAMORTE').AsInteger < 30 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' ) then
        fValorAcerto := fValorProvento * (30 - qryLista.FieldByName('DIAMORTE').AsInteger + 1  )/30

       // TAXAS ADMINISTRATIVAS - MES <> FALECIMENTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'P' )
         and ( qryRub.FieldByName('MES').AsString <> qryLista.FieldByName('MESANOMORTE').AsString )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' ) then
        fValorAcerto := fValorProvento

       // MENSALIDADES - MES <> FALECIMENTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'C' )
         and ( qryRub.FieldByName('MES').AsString <> qryLista.FieldByName('MESANOMORTE').AsString )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' ) then
        fValorAcerto := fValorProvento

       // IMPOSTO DE RENDA -- DEVOLUCAO -- DESCONTOS -- MES FALECIMENTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'I' )
         and ( qryRub.FieldByName('MES').AsString = qryLista.FieldByName('MESANOMORTE').AsString )
         and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' ) then
        fValorAcerto := fValorProvento * (30 - qryLista.FieldByName('DIAMORTE').AsInteger + 1  )/30

       // IMPOSTO DE RENDA -- DEVOLUCAO -- DESCONTOS  -- MES <> FALECIMENTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'I' )
         and ( qryRub.FieldByName('MES').AsString <> qryLista.FieldByName('MESANOMORTE').AsString )
         and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' ) then
        fValorAcerto := fValorProvento

       // IMPOSTO DE RENDA -- COBRANÇA -- PAGOS -- MES FALECIMENTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'I' )
         and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 2 )
         and ( qryRub.FieldByName('MES').AsString = qryLista.FieldByName('MESANOMORTE').AsString )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' ) then
        fValorAcerto := fValorProvento * (30 - qryLista.FieldByName('DIAMORTE').AsInteger + 1  )/30

       // IMPOSTO DE RENDA -- COBRANÇA -- PAGOS -- MES <> FALECIMENTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'I' )
         and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 2 )
         and ( qryRub.FieldByName('MES').AsString <> qryLista.FieldByName('MESANOMORTE').AsString )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' ) then
        fValorAcerto := fValorProvento

       // ENTIDADES -- MES <> FALECIMENTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'Y' )
         and ( qryRub.FieldByName('MES').AsString <> qryLista.FieldByName('MESANOMORTE').AsString )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' ) then
        fValorAcerto := fValorProvento

       // ENTIDADES -- MES  FALECIMENTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'Y' )
         and ( not qryRub.FieldByName('FLGPROPORCIONAL').IsNull )
         and ( not qryRub.FieldByName('FLGPROPORCIONAL').AsInteger = 1 )
         and ( qryRub.FieldByName('MES').AsString = qryLista.FieldByName('MESANOMORTE').AsString )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' ) then
        fValorAcerto := fValorProvento * (30 - qryLista.FieldByName('DIAMORTE').AsInteger +1  )/30

       //Benefício INSS
       Else  if ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
         and (  qryRub.FieldByName('FONTEPAGADORA').AsInteger = 2 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'NAO' ) then
        fValorAcerto := fValorProvento

       Else
        fValorAcerto := 0;


       if ( fValorAcerto > 0 ) then
        begin
           sPlanoContabil := retornaIdentificadorPlanoContabil();

           if ( qryRub.FieldByName('FLGDESCONTO').AsString = '0' ) then
             sFlgDesconto     := '1'
           Else
             sFlgDesconto     := '0';

           fValorLancamento := fValorAcerto;

           if  ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' ) then
            begin
               InsereOuAlteraHistoricoBeneficioProcessado(qryLista.FieldByName('IDPESSOA').AsString
                                                         ,qryLista.FieldByName('IDPESSJUR').AsString
                                                         ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                         ,qryLista.FieldByName('IDBENEFICIO').AsString
                                                         ,qryLista.FieldByName('NUMEROPROCESSO').AsString
                                                         ,qryRub.FieldByName('MES').AsString
                                                         ,sFlgDesconto
                                                         ,qryRub.FieldByName('FONTEPAGADORA').AsString
                                                         ,qryLista.FieldByName('IDPLANOORIGEM').AsString // Felipe A. Santos SOL 136748/14312 KINTANA 1988667
                                                         //,qryRub.FieldByName('IDPLANOORIGEM').AsString // Felipe A. Santos SOL 136748/14312 KINTANA 1988667 -- comentado
                                                         ,qryRub.FieldByName('IDTITULAR').AsString
                                                         ,sIdLote // SOL 229906 PPM 345184 Fernando Xavier
                                                         ,qryRub.FieldByName('MESCOBRANCA').AsString // SOL 229906 PPM 345184 Fernando Xavier
                                                         ,fValorLancamento);
            end;

           if  ( qryRub.FieldByName('FLGTIPODESC').AsString = 'P' ) then
            begin

               lancarHistoricoContribuicaoProcessado(qryLista.FieldByName('IDPESSOA').AsString
                                                    ,qryLista.FieldByName('IDPESSJUR').AsString
                                                    ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                    ,qryRub.FieldByName('MES').AsString
                                                    ,'1'
                                                    ,fValorAcerto
                                                    ,qryRub.FieldByName('IDCONTRIBUICAO').AsInteger )  // Andre Imakawa - SIG 70668

            end;

           sRubrica := qryRub.FieldByName('IDRUBRICA').AsString;
           sRubrica := retornaRubricaDesconto(sRubrica);

           programarRubricaIndividual(qryLista.FieldByName('IDPESSJUR').AsString
                                     ,qryLista.FieldByName('IDPESSOA').AsString
                                     ,qryRub.FieldByName('IDFAVORECIDO').AsString
                                     ,sRubrica
                                     ,qryLista.FieldByName('IDTITULAR').AsString
                                     ,sPlanoContabil
                                     ,qryRub.FieldByName('FLGPENSAOALIM').AsString
                                     ,qryRub.FieldByName('MES').AsString
                                     ,fValorAcerto  );
        end;

        qryRub.Next;

     end;

    qryRub.Close();
end;

function TfrmEncerramentoPorFalecimento.retornaRubricaDesconto(sRubricaOrigem: String): String;
var sSql,sRubrica : String;
begin
  sSql :=  ' SELECT CODPROVDESC '
        +  ' FROM PROVDESC      '
        +  ' WHERE IDPROVENTO = ' + QuotedStr(sRubricaOrigem);

  if FazQuery(qryAux, ssql) then
    sRubrica := qryAux.FieldByName('CODPROVDESC').AsString;

  qryAux.Close;

  if copy(sRubrica,1,1) = '1' then
     sRubrica := '3' + copy(sRubrica,2,length(sRubrica))
  Else if copy(sRubrica,1,1) = '2' then
     sRubrica := '3' + copy(sRubrica,2,length(sRubrica))
  Else if copy(sRubrica,1,1) = '3' then
     sRubrica := '1' + copy(sRubrica,2,length(sRubrica))
  Else if copy(sRubrica,1,1) = '4' then
     sRubrica := '1' + copy(sRubrica,2,length(sRubrica));

  sSql :=  ' SELECT IDPROVENTO   '
        +  ' FROM PROVDESC       '
        +  ' WHERE ( (FLGESTADORUB IS NULL) OR (FLGESTADORUB<>2) )  '
        +  '  AND CODPROVDESC = ' + QuotedStr(sRubrica);

  if FazQuery(qryAux, ssql) then
    sRubrica := qryAux.FieldByName('IDPROVENTO').AsString;

  qryAux.Close;

  Result := sRubrica;

end;

function TfrmEncerramentoPorFalecimento.retornaPeriodoDescontoAbono: String;
begin

 result := qryLista.FieldByName('ANOMORTE').AsString + '/' + '13';

end;

procedure TfrmEncerramentoPorFalecimento.processarAcertoAbonoAnualINSS(sAnoReferencia, sIdLote: String);
var sRubrica,FlagDevolucao,sPlanoContabil, sRubricaAbono, sPeriodoDesconto, sFlgDesconto, sIdFavorecido: String;
    fValorAcerto,fValorProvento, fSomaAbono: REAL;
    bInserirRI :boolean;
begin
    ConsultarRubricasAbono( qryLista.FieldByName('IDPESSOA').AsString
                                , qryLista.FieldByName('IDBENEFICIO').AsString
                                , qryLista.FieldByName('DATAMORTE').AsString
                                , '2'
                                , sAnoReferencia);

    fSomaAbono := 0;

    While not qryRub.Eof do
     begin
       sIdFavorecido  := qryRub.FieldByName('IDFAVORECIDO').AsString;

       fValorAcerto   := 0;
       bInserirRI     := True;
       fValorProvento := qryRub.FieldByName('VALORPROVENTO').AsFloat;

       // Benefício FUNCEF - ABONO ANUAL
       if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
         and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 2 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
         and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 0 )   then
          begin
           fValorAcerto := fValorProvento;
           fSomaAbono   := fSomaAbono + fValorProvento
          end

       // Benefício FUNCEF - ABONO ANUAL - DESCONTO
       Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
         and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 2 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
         and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )   then
          begin
           fValorAcerto      := fValorProvento;
           fSomaAbono  := fSomaAbono - fValorProvento
          end;

       qryRub.Next;

     end;


    if fSomaAbono > 0 then
       sFlgDesconto :='1'
    Else
     begin
       sFlgDesconto :='0';
       fSomaAbono   := fSomaAbono*-1;
     end;

    if fSomaAbono <> 0 then
     begin
           sPlanoContabil := retornaIdentificadorPlanoContabil();

           sRubricaAbono := '36192';

           sRubrica := sRubricaAbono;
           sRubrica := retornaRubricaDesconto(sRubrica);

           sPeriodoDesconto :=  sAnoReferencia + '/13';

           programarRubricaIndividual(qryLista.FieldByName('IDPESSJUR').AsString
                                     ,qryLista.FieldByName('IDPESSOA').AsString
                                     ,sIdFavorecido
                                     ,sRubrica
                                     ,qryLista.FieldByName('IDTITULAR').AsString
                                     ,sPlanoContabil
                                     ,qryRub.FieldByName('FLGPENSAOALIM').AsString
                                     ,sPeriodoDesconto
                                     ,fSomaAbono  );


           InsereOuAlteraHistoricoBeneficioProcessado(qryLista.FieldByName('IDPESSOA').AsString
                                                     ,qryLista.FieldByName('IDPESSJUR').AsString
                                                     ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                     ,qryLista.FieldByName('IDBENEFICIO').AsString
                                                     ,qryLista.FieldByName('NUMEROPROCESSO').AsString
                                                     ,sPeriodoDesconto
                                                     ,sFlgDesconto
                                                     ,qryLista.FieldByName('FONTEPAGADORA').AsString
                                                     ,qryLista.FieldByName('IDPLANOORIGEM').AsString
//                                                     ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                     ,qryLista.FieldByName('IDTITULAR').AsString
                                                     ,sIdLote // SOL 229906 PPM 345184 Fernando Xavier
                                                     ,qryRub.FieldByName('MESCOBRANCA').AsString // SOL 229906 PPM 345184 Fernando Xavier
                                                     ,fSomaAbono);


     end;

    qryRub.Close();

end;

procedure TfrmEncerramentoPorFalecimento.lancarHistoricoBeneficiosEfetivado(sIdLote,sMesAnoLote,sDataPagLote,
  sIdPessoa,sIdTitular,sIdPessoaJuridica, sIdPlanoPrevidenciario, sIdBeneficio,
  sIdNumProcesso, sMesReferencia, sFlgDevolucao, sFontePagadora,
  sIdPlanoOrigem, smes: String; fValorAcerto: real);
var sSql, smescompreem : String;
begin

(*
  if sFlgDevolucao = '0' then
     sFlgDevolucao := '1'
  Else
     sFlgDevolucao := '0';

  if FloatToStr(fValorAcerto) <> '0,001' then
     fValorAcerto := RoundCM(fValorAcerto,2);
*)

  Try

    // SOL 229906 PPM 345184 Fernando Xavier
    sSql :=  ' select  MESCOMPREEM from hstbenefbfciario '
          +  ' where   idpessoa  =  '+ qryLista.fieldbyname('IDPESSOA').Asstring
          +  ' and     mesreferencia  =  '+ QuotedStr(sMesReferencia)
          +  ' and     mes            =  '+ QuotedStr(smes)
          +  ' and     idbeneficio    =  '+ qryLista.fieldbyname('IDBENEFICIO').Asstring;


    if FazQuery(qryAux, ssql) then
    begin
        smescompreem :=  qryAux.FieldByName('MESCOMPREEM').AsString;
    end
    else
    begin
       smescompreem :=  '';
    end;

    sSql :=  ' INSERT INTO HSTBENEFBFCIARIO           '
          +  '      (IDTITULAR                        '
          +  '      ,IDPESSJUR                        '
          +  '      ,IDPLANOPREV                      '
          +  '      ,IDBENEFICIO                      '
          +  '      ,IDMOTIVO                         '
          +  '      ,IDPESSOA                         '
          +  '      ,NUMEROPROCESSO                   '
          +  '      ,MES                              '
          +  '      ,VLBENEFPGTO                      '
          +  '      ,SEQBENEFICIO                     '
          +  '      ,SEQPROPOSTA                      '
          +  '      ,DTEFETPGTO                       '
          +  '      ,VALORPREV                        '
          +  '      ,DATAPAGAMENTO                    '
          +  '      ,VALORCALCULADO                   '
          +  '      ,FLGACERTODESFEITO                '
          +  '      ,FLGENVIADO                       '
          +  '      ,MESREFERENCIA                    '
          +  '      ,FLGCONCESSAO                     '
          +  '      ,FLGDEVOLUCAO                     '
          +  '      ,FLGFORMAPAGTO                    '
          +  '      ,VALORTOTAL                       '
          +  '      ,FONTEPAGADORA                    '
          +  '      ,VALORINTEGRAL                    '
          +  '      ,VALORPREVMIN                     '
          +  '      ,FLGDESCIRMES                     '
          +  '      ,VALORSRB                         '
          +  '      ,FLGMANUAL                        '
          +  '      ,IDPLANOORIGEM                    '
          +  '      ,FLGPROVISORIO                    '
          +  '      ,IDTITBENEF                       '
          +  '      ,VALORACERTO                      '
          +  '      ,PERCENTUAL                       '
          +  '      ,FLGTIPOREGISTRO                  '
          +  '      ,FLGALIMRESERVA                   '
          +  '      ,IDLOTE                           '
          +  '      ,MESCOMPREEM            )         ' //SOL 229906 PPM 345184 Fernando Xavier
          +  'VALUES                                  '
          +  '     ( :IDTITULAR                       '      //     IDTITULAR
          +  '      ,:IDPESSJUR                       '      //     IDPESSJUR
          +  '      ,:IDPLANOPREV                     '      //     IDPLANOPREV
          +  '      ,:IDBENEFICIO                     '      //     IDBENEFICIO
          +  '      ,3007                             '      //     IDMOTIVO
          +  '      ,:IDPESSOA                        '      //     IDPESSOA
          +  '      ,:NUMEROPROCESSO                  '      //     NUMEROPROCESSO
          +  '      ,:MES                             '      //     MES
          +  '      ,NULL                             '      //     VLBENEFPGTO
          +  '      ,9                                '      //     SEQBENEFICIO
          +  '      ,1                                '      //     SEQPROPOSTA
          +  '      ,NULL                             '      //     DTEFETPGTO
          +  '      ,:VALORPREV                       '      //     VALORPREV
          +  '      ,:DATAPAGAMENTO                   '      //     DATAPAGAMENTO
          +  '      ,:VALORCALCULADO                  '      //     VALORCALCULADO
          +  '      ,0                                '      //     FLGACERTODESFEITO
          +  '      ,0                                '      //     FLGENVIADO
          +  '      ,:MESREFERENCIA                   '      //     MESREFERENCIA
          +  '      ,0                                '      //     FLGCONCESSAO
          +  '      ,:FLGDEVOLUCAO                    '      //     FLGDEVOLUCAO
          +  '      ,''F''                            '      //     FLGFORMAPAGTO
          +  '      ,:VALORTOTAL                      '      //     VALORTOTAL
          +  '      ,:FONTEPAGADORA                   '      //     FONTEPAGADORA
          +  '      ,:VALORINTEGRAL                   '      //     VALORINTEGRAL
          +  '      ,:VALORPREVMIN                    '      //     VALORPREVMIN
          +  '      ,0                                '      //     FLGDESCIRMES
          +  '      ,0                                '      //     VALORSRB
          +  '      ,0                                '      //     FLGMANUAL
          +  '      ,:IDPLANOORIGEM                   '      //     IDPLANOORIGEM
          +  '      ,0                                '      //     FLGPROVISORIO
          +  '      ,NULL                             '      //     IDTITBENEF
          +  '      ,:VALORACERTO                     '      //     VALORACERTO
          +  '      ,0                                '      //     PERCENTUAL
          +  '      ,0                                '      //     FLGTIPOREGISTRO
          +  '      ,0                                '      //     FLGALIMRESERVA
          +  '      ,:IDLOTE                          ';     //     IDLOTE

          if  trim(smescompreem) <> '' then
              sSql := sSql + '  ,:MESCOMPREEM          '     // SOL 229906 PPM 345184 Fernando Xavier
          else
              sSql := sSql + '  ,null                  ';     // SOL 229906 PPM 345184 Fernando Xavier

          sSql := sSql +  '  )  ';     //SOL 229906 PPM 345184 Fernando Xavier


    qryAux.sql.Text := ssql;

    qryAux.ParamByName('IDTITULAR').AsString      := sIdTitular;
    qryAux.ParamByName('IDPESSJUR').AsString      := sIdPessoaJuridica;
    qryAux.ParamByName('IDPLANOPREV').AsString    := sIdPlanoPrevidenciario;
    qryAux.ParamByName('IDBENEFICIO').AsString    := sIdBeneficio;
    qryAux.ParamByName('IDPESSOA').AsString       := sIdPessoa;
    qryAux.ParamByName('NUMEROPROCESSO').AsString := sIdNumProcesso;
    qryAux.ParamByName('MES').AsString            := sMesAnoLote;
    qryAux.ParamByName('VALORPREV').AsFloat       := fValorAcerto;
    qryAux.ParamByName('DATAPAGAMENTO').AsString  := sDataPagLote;
    qryAux.ParamByName('VALORCALCULADO').AsFloat  := fValorAcerto;
    qryAux.ParamByName('MESREFERENCIA').AsString  := sMesReferencia;
    qryAux.ParamByName('FLGDEVOLUCAO').AsString   := sFlgDevolucao;
    qryAux.ParamByName('VALORTOTAL').AsFloat      := fValorAcerto;
    qryAux.ParamByName('FONTEPAGADORA').AsString  := sFontePagadora;
    qryAux.ParamByName('VALORINTEGRAL').AsFloat   := fValorAcerto;
    qryAux.ParamByName('VALORPREVMIN').AsFloat    := fValorAcerto;
    qryAux.ParamByName('IDPLANOORIGEM').AsString  := sIdPlanoOrigem;
    qryAux.ParamByName('VALORACERTO').AsFloat     := fValorAcerto;
    qryAux.ParamByName('IDLOTE').AsString         := sIdLote;

    if  trim(smescompreem) <> '' then //SOL 229906 PPM 345184 Fernando Xavier
       qryAux.ParamByName('MESCOMPREEM').AsString         := smescompreem;  //SOL 229906 PPM 345184 Fernando Xavier

    qryAux.ExecSQL;

  Except
    on e:Exception do
     begin
       raise;
     end;
  end;

end;

procedure TfrmEncerramentoPorFalecimento.consultarRubricasAbonoTaxaAdm(sIdPessoa, sIdBeneficio, sDataMorte: String);
var sSql : String;
begin
  sSql :=  ' SELECT H.MES                                 '
        +  '    ,H.MESCOBRANCA                            '
        // Andre Imakawa - SIG 70668 - Inicio
        +  '    ,DECODE( H.FLGTIPODESC, ''P'',                      '
        +  '             (SELECT IDDESCONTO                         '
        +  '                FROM   TMPDESC T                        '
        +  '               WHERE  T.IDPESSOA = H.IDPESSOA           '
        +  '                 AND    T.IDTITULAR = H.IDTITULAR       '
        +  '                 AND    T.IDPESSJUR = H.IDPATRO         '
        +  '                 AND    T.IDPLANOPREV = H.IDPLANOPREV   '
        +  '                 AND    T.MESREFERENCIA = H.MES         '
        +  '                 AND    T.MESCOBRANCA = H.MESCOBRANCA   '
        +  '                 AND    T.IDPROVENTO = H.IDRUBRICA      '
        +  '                 AND ROWNUM = 1),0) AS IDCONTRIBUICAO   '
        // Andre Imakawa - SIG 70668 - Fim
        +  '    ,CASE WHEN SUBSTR(H.MES,6,7) = ''13''     '
        +  '      THEN ''SIM''                            '
        +  '      ELSE ''NAO''                            '
        +  '     END AS ABONOANUAL                        '
        +  '    ,H.IDPESSJUR                              '
        +  '    ,H.IDRUBRICA                              '
        +  '    ,H.IDMOTIVO                               '
        +  '    ,H.REFERENCIA                             '
        +  '    ,H.IDPESSOA                               '
        +  '    ,H.SEQRUBRICA                             '
        +  '    ,H.CODIRRFDARF                            '
        +  '    ,H.IDHSTFOLHABENEF                        '
        +  '    ,H.CODDOCUMENTO                           '
        +  '    ,H.IDLANCIRRF                             '
        +  '    ,H.IDRESPONSAVEL                          '
        +  '    ,H.IDPATRO                                '
        +  '    ,H.IDRETROATIVO                           '
        +  '    ,H.CODMOEDA                               '
        +  '    ,H.IDREGRACALCULO                         '
        +  '    ,H.CODPROVDESC                            '
        +  '    ,H.VALORPROVENTO                          '
        +  '    ,H.FLGCOMPOESALPART                       '
        +  '    ,H.FLGCOMPOESALBENEF                      '
        +  '    ,H.FLGIRRF                                '
        +  '    ,H.VALORCOTAS                             '
        +  '    ,H.VLRANTRETROATIVO                       '
        +  '    ,H.FLGCOMPOEREMTOTAL                      '
        +  '    ,H.FLGPREVIA                              '
        +  '    ,H.FLGSRB                                 '
        +  '    ,H.FLGCONCESSAO                           '
        +  '    ,H.FONTEPAGADORA                          '
        +  '    ,H.DATAPAGAMENTO                          '
        +  '    ,H.FLGSALPARTRETRO                        '
        +  '    ,H.FLGSALPARTATUARIA                      '
        +  '    ,H.FLGSALBENEFRETRO                       '
        +  '    ,H.IDMODULO                               '
        +  '    ,H.VALORINFO                              '
        +  '    ,H.VALORNADIB                             '
        +  '    ,H.TIPOITEMPCS                            '
        +  '    ,H.SEQHISTFUNC                            '
        +  '    ,H.FLGEQUIPARACAO                         '
        +  '    ,H.PERCENTUALNADIB                        '
        +  '    ,H.VALORRECEBIDO                          '
        +  '    ,H.IDTITULAR                              '
        +  '    ,H.IDPLANOPREV                            '
        +  '    ,H.IDFAVORECIDO                           '
        +  '    ,H.CODPORTFORMA                           '
        +  '    ,H.FLGPENSAOALIM                          '
        +  '    ,H.IDINFORME                              '
        +  '    ,H.IDCBANCARIA                            '
        +  '    ,H.NUMBANCO                               '
        +  '    ,H.NUMAGENCIA                             '
        +  '    ,H.CONTACORRENTE                          '
        +  '    ,H.FLGESTORNO                             '
        +  '    ,H.IDVERSAOPAGTO                          '
        +  '    ,H.VALORINTEGRAL                          '
        +  '    ,H.IDLANCIRRFESTORNO                      '
        +  '    ,H.FLGTIPODESC                            '
        +  '    ,H.LOTEORIGINAL                           '
        +  '    ,H.SEQORIGINAL                            '
        +  '    ,H.PERCENTUAL                             '
        +  '    ,H.NUMEROPROCESSO                         '
        +  '    ,H.NUMPROCINSS                            '
        +  '    ,H.TRGDTINCLUSAO                          '
        +  '    ,H.TRGUSERINCLUSAO                        '
        +  '    ,H.FLGSALFAM                              '
        +  '    ,H.FLGIRRFTOTAL                           '
        +  '    ,H.FLGMOLESTIAGRAVE                       '
        +  '    ,H.NUMDEPIRRF                             '
        +  '    ,H.NUMDEPSF                               '
        +  '    ,H.FLGISENTOIRRF                          '
        +  '    ,H.IDPLANOORIGEM                          '
        +  '    ,H.IDRESPONNAOREC                         '
        +  '    ,H.PARCELAS                               '
        +  '    ,H.ORDEM                                  '
        +  '    ,H.CODCENTROCUSTOD                        '
        +  '    ,H.PLANO                                  '
        +  '    ,H.UNIDNEGOC                              '
        +  '    ,H.CODSUBCONTA                            '
        +  '    ,H.CODCENTRORESPON                        '
        +  '    ,H.RECPAG                                 '
        +  '    ,H.CODTIPRECDES                           '
        +  '    ,H.PLACONTAC                              '
        +  '    ,H.PLACONTAD                              '
        +  '    ,H.IDPLANOCONTABIL                        '
        +  '    ,H.CODCENTROCUSTOC                        '
        +  '    ,H.FLGESPECIAL                            '
        +  '    ,H.FLGDESCONTO                            '
        +  '    ,H.IDRECEBEPGTO                           '
        +  '    ,H.IDPROCJUD                              '
        +  '    ,H.IDBENEFICIO                            '
        +  '    ,H.NUMDOCUMENTO                           '
        +  '    ,H.CODDOCUMENTOPGAPAGAR                   '
        +  '    ,H.CODDOCUMENTOPGARECEBER                 '
        +  ' FROM HISTRUBSAL H                            '
        +  '     ,PROVDESC P                              '
        +  ' WHERE  P.IDPROVENTO = H.IDRUBRICA            '
        +  '  AND H.IDRESPONSAVEL = ' + sIdPessoa
        +  '  AND H.IDBENEFICIO = ' + sIdBeneficio
        +  '  AND SUBSTR(H.MES,6,7) = ''13''                                                                                          '
        +  '  AND SUBSTR(H.MES,1,4) >= TO_CHAR(TO_DATE('+ QuotedStr( sDataMorte )  +',''DD/MM/YYYY''),''YYYY'')                       '
        +  '  AND (H.FLGTIPODESC = ''P'')  '  //-- TAXA ADMINISTRATIVA
        +  '  AND H.FONTEPAGADORA = ' + qryLista.FieldByName('FONTEPAGADORA').AsString
//        +  '  AND (H.FONTEPAGADORA = 1)    '
//        +  ' ORDER BY MESCOBRANCA          '; //Everson TIBERO
        +  ' ORDER BY H.MESCOBRANCA          '; //Everson TIBERO

  FazQuery(qryRub, ssql);
end;

procedure TfrmEncerramentoPorFalecimento.processarAcertoAbonoAnualTaxaAdm;
var sRubrica,FlagDevolucao,sPlanoContabil, sRubricaAbono, sPeriodoDesconto, sFlgDesconto,sIdFavorecido: String;
    fValorAcerto,fValorProvento, fSomaAbono: REAL;
    bInserirRI :boolean;
begin

    consultarRubricasAbonoTaxaAdm( qryLista.FieldByName('IDPESSOA').AsString
                                 , qryLista.FieldByName('IDBENEFICIO').AsString
                                 , qryLista.FieldByName('DATAMORTE').AsString );

    While not qryRub.Eof do
     begin

       sIdFavorecido  := qryRub.FieldByName('IDFAVORECIDO').AsString;

       fValorAcerto   := 0;
       fValorProvento := qryRub.FieldByName('VALORPROVENTO').AsFloat;

       // TAXA ADMINISTRATIVA - ABONO ANUAL - DESCONTO
       if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'P' )
         and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
         and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )   then
          begin
           fValorAcerto := fValorProvento;
           sFlgDesconto :='0';
          end;

       // TAXA ADMINISTRATIVA - ABONO ANUAL - DESCONTO
       if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'P' )
         and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
         and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 0  ) then
          begin
           fValorAcerto := fValorProvento;
           sFlgDesconto :='1';
          end;

       if fValorAcerto <> 0 then
        begin
           sPlanoContabil := retornaIdentificadorPlanoContabil();

           sRubrica := qryRub.FieldByName('IDRUBRICA').AsString;
           sRubrica := retornaRubricaDesconto(sRubrica);

           programarRubricaIndividual(qryLista.FieldByName('IDPESSJUR').AsString
                                     ,qryLista.FieldByName('IDPESSOA').AsString
                                     ,qryRub.FieldByName('IDFAVORECIDO').AsString
                                     ,sRubrica
                                     ,qryLista.FieldByName('IDTITULAR').AsString
                                     ,sPlanoContabil
                                     ,qryRub.FieldByName('FLGPENSAOALIM').AsString
                                     ,qryRub.FieldByName('MES').AsString
                                     ,fValorAcerto  );

           lancarHistoricoContribuicaoProcessado(qryLista.FieldByName('IDPESSOA').AsString
                                                ,qryLista.FieldByName('IDPESSJUR').AsString
                                                ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                ,qryRub.FieldByName('MES').AsString
                                                ,sFlgDesconto
                                                ,fValorAcerto
                                                ,qryRub.FieldByName('IDCONTRIBUICAO').AsInteger )  // Andre Imakawa - SIG 70668

        end;

       qryRub.Next;


     end;    

(*
    if not qryRub.IsEmpty then
     begin

       fValorAcerto   := 0;
       fValorProvento := qryRub.FieldByName('VALORPROVENTO').AsFloat;

       // TAXA ADMINISTRATIVA - ABONO ANUAL - DESCONTO
       if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'P' )
         and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
         and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
         and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )   then
           fValorAcerto := fValorProvento;

       if fValorProvento <> 0 then
        begin

           sRubricaAbono := '34273';

           if ( qryLista.FieldByName('DIAMORTE').AsInteger >= 15 ) then
              fValorAcerto := fValorAcerto * (qryLista.FieldByName('MESMORTE').AsInteger)/12
           Else
              fValorAcerto := fValorAcerto * (qryLista.FieldByName('MESMORTE').AsInteger -1 )/12;

            If fValorAcerto <> 0 then
            begin
                  programarRubricaIndividual( qryLista.FieldByName('IDPESSJUR').AsString
                                             ,qryLista.FieldByName('IDPESSOA').AsString
                                             ,qryRub.FieldByName('IDFAVORECIDO').AsString
                                             ,sRubricaAbono
                                             ,qryLista.FieldByName('IDTITULAR').AsString
                                             ,sPlanoContabil
                                             ,qryRub.FieldByName('MES').AsString
                                             ,fValorAcerto  );

                  //Lança histórico do abono proporcional
                  lancarHistoricoContribuicaoProcessado( qryLista.FieldByName('IDPESSOA').AsString
                                                        ,qryLista.FieldByName('IDPESSJUR').AsString
                                                        ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                        ,qryRub.FieldByName('MES').AsString
                                                        ,'1'
                                                        ,fValorAcerto );
           end;

        end;

     end;
*)
    qryRub.Close();
end;

procedure TfrmEncerramentoPorFalecimento.qryListaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

//  lbBeneficio.Caption := qryLista.FieldByname('NOME_BENEFICIO').asString;

end;

function TfrmEncerramentoPorFalecimento.retornaAnoAutal: Integer;
var sSql : String;
begin
  sSql :=  ' SELECT TO_NUMBER(TO_CHAR(SYSDATE,''YYYY'')) AS ANO FROM DUAL   ';

  if FazQuery(qryAux, ssql) then
    Result := qryAux.FieldByName('ANO').AsInteger
  Else
    Result := 0;

end;

function TfrmEncerramentoPorFalecimento.retornaValorProventoMesMorte(var fPercTxAdm: real; var fSomaRubAdic: real; var sRubricaTxAdm: String): real;
var sSql,sMesDesc,sRubrica : String;
    fValorBenef, fValorBenefTotal,  vValorTaxaAdm: real;
begin

  fValorBenef   := 0;
  fValorBenefTotal := 0;
  vValorTaxaAdm := 0;
  fSomaRubAdic  := 0;
  fPercTxAdm    := 0;
  sMesDesc      := '';
  sRubricaTxAdm := '';

  sSql :=  ' SELECT  MES, VLBENEFPGTO FROM    '
        +  ' (                                '
        +  ' SELECT MES, VLBENEFPGTO          '
        +  ' FROM HSTBENEFBFCIARIO HST        '
        +  '  WHERE HST.IDPESSOA = ' + qryLista.FieldByName('IDPESSOA').AsString
        +  '    AND IDBENEFICIO  = ' + qryLista.FieldByName('IDBENEFICIO').AsString
        +  '    AND IDPLANOPREV  = ' + qryLista.FieldByName('IDPLANOPREV').AsString
        +  '    AND MES         <= ' + QuotedStr(qryLista.FieldByName('MESANOMORTE').AsString)
        +  '    AND IDMOTIVO = 3007           '
        +  '    AND SEQBENEFICIO = 1          '
        +  ' ORDER BY MES  DESC               '
        +  ' ) WHERE ROWNUM =1                ';

  if FazQuery(qryAux, ssql) then
   begin
    fValorBenef := qryAux.FieldByName('VLBENEFPGTO').AsFloat;
    sMesDesc    := qryAux.FieldByName('MES').AsString;
   end;


  fValorBenefTotal := fValorBenef;

  // CONSIDERA RUBRICA "CESTA ALIMENTAÇÃO - JUDICIAL"  IDPROVENTO=38695  E CODPROVDESC=223104
  if fValorBenef > 0 then
   begin
      sSql :=  ' SELECT NVL(VALORPROVENTO,0) as VALORPROVENTO   '
            +  ' FROM HISTRUBSAL          '
            +  ' WHERE IDPESSOA = ' + qryLista.FieldByName('IDPESSOA').AsString
            +  '   AND IDRESPONSAVEL = ' + qryLista.FieldByName('IDPESSOA').AsString
            +  '   AND IDBENEFICIO   = ' + qryLista.FieldByName('IDBENEFICIO').AsString
            +  '   AND MES          = ' + QuotedStr(sMesDesc)
            +  '   AND IDRUBRICA   =  38695 ';

      if FazQuery(qryAux, ssql) then
       begin
        fValorBenefTotal := fValorBenefTotal + qryAux.FieldByName('VALORPROVENTO').AsFloat;
        fSomaRubAdic     := fSomaRubAdic + qryAux.FieldByName('VALORPROVENTO').AsFloat;
       end;
   end;

  // CONSIDERA RUBRICA "FUNÇÃO CONF. - JUDICIAL"  IDPROVENTO=38696  E CODPROVDESC=223204
  if fValorBenef > 0 then
   begin
      sSql :=  ' SELECT NVL(VALORPROVENTO,0) as VALORPROVENTO   '
            +  ' FROM HISTRUBSAL          '
            +  ' WHERE IDPESSOA = ' + qryLista.FieldByName('IDPESSOA').AsString
            +  '   AND IDRESPONSAVEL = ' + qryLista.FieldByName('IDPESSOA').AsString
            +  '   AND IDBENEFICIO   = ' + qryLista.FieldByName('IDBENEFICIO').AsString
            +  '   AND MES          = ' + QuotedStr(sMesDesc)
            +  '   AND IDRUBRICA   =  38696 ';

      if FazQuery(qryAux, ssql) then
       begin
        fValorBenefTotal := fValorBenefTotal + qryAux.FieldByName('VALORPROVENTO').AsFloat;
        fSomaRubAdic     := fSomaRubAdic + qryAux.FieldByName('VALORPROVENTO').AsFloat;
       end;
   end;


  // CONSIDERA RUBRICA "VP. AUX. ALIMENTAÇÃO - JUDICIAL"  IDPROVENTO=39630  E CODPROVDESC=224904
  if fValorBenef > 0 then
   begin
      sSql :=  ' SELECT NVL(VALORPROVENTO,0) as VALORPROVENTO   '
            +  ' FROM HISTRUBSAL          '
            +  ' WHERE IDPESSOA = ' + qryLista.FieldByName('IDPESSOA').AsString
            +  '   AND IDRESPONSAVEL = ' + qryLista.FieldByName('IDPESSOA').AsString
            +  '   AND IDBENEFICIO   = ' + qryLista.FieldByName('IDBENEFICIO').AsString
            +  '   AND MES          = ' + QuotedStr(sMesDesc)
            +  '   AND IDRUBRICA   =  39630 ';

      if FazQuery(qryAux, ssql) then
       begin
        fValorBenefTotal := fValorBenefTotal + qryAux.FieldByName('VALORPROVENTO').AsFloat;
        fSomaRubAdic     := fSomaRubAdic + qryAux.FieldByName('VALORPROVENTO').AsFloat;
       end;
   end;


  if fValorBenefTotal > 0 then
   begin
      sSql :=  ' SELECT NVL(VALORPROVENTO,0) as VALORPROVENTO, IDRUBRICA   '
            +  ' FROM HISTRUBSAL          '
            +  ' WHERE IDPESSOA = ' + qryLista.FieldByName('IDPESSOA').AsString
            +  '   AND IDRESPONSAVEL = ' + qryLista.FieldByName('IDPESSOA').AsString
            +  '   AND IDBENEFICIO   = ' + qryLista.FieldByName('IDBENEFICIO').AsString
            +  '   AND FLGTIPODESC   = ''P'' '
            +  '   AND FLGDESCONTO  = 1'
            +  '   AND MES          = ' + QuotedStr(sMesDesc);

      if FazQuery(qryAux, ssql) then
       begin
        vValorTaxaAdm := qryAux.FieldByName('VALORPROVENTO').AsFloat;
        sRubricaTxAdm := qryAux.FieldByName('IDRUBRICA').AsString;
       end;
   end;


  if (fValorBenefTotal > 0) and (vValorTaxaAdm > 0) then
   begin
    fPercTxAdm :=  vValorTaxaAdm/fValorBenefTotal;
    fPercTxAdm :=  StrToFloat( FormatFloat('0.0',fPercTxAdm*100) ) / 100 ;
   end;

  Result := fValorBenef;

end;

procedure TfrmEncerramentoPorFalecimento.processarAcertoAbonoAnualAcaoJudicial( sAnoReferencia, sIdLote: String); // SOL 229906 PPM 345184 Fernando Xavier
var sRubrica,FlagDevolucao,sPlanoContabil, sRubricaAbono, sRubricaTxAdm, sPeriodoDesconto, sFlgDesconto, sIdFavorecido: String;
    fValorAcerto,fValorProvento, fValorTxAdm, fSomaAbono, fPercTxAdm: REAL;
    bInserirRI :boolean;
begin
    consultarRubricasPossuemAbonoAcaoJudicial ( qryLista.FieldByName('IDPESSOA').AsString
                                              , sAnoReferencia);

    sPlanoContabil := retornaIdentificadorPlanoContabil();

    While not qryRubAcaoJud.Eof do
     begin
       fSomaAbono := 0;

//       sRubricaAbono  := qryRubAcaoJud.FieldByName('IDRUBRICA').AsString;
       sRubricaAbono  := qryRubAcaoJud.FieldByName('IDRUBRICA13').AsString;
       sRubrica       := sRubricaAbono;
       sRubrica       := retornaRubricaDesconto(sRubrica);

       sPeriodoDesconto :=  sAnoReferencia + '/13';

       consultarRubricasAbonoAcaoJudicial( qryLista.FieldByName('IDPESSOA').AsString
                                         , qryLista.FieldByName('IDBENEFICIO').AsString
                                         , qryRubAcaoJud.FieldByName('IDRUBRICA').AsString
                                         , qryLista.FieldByName('DATAMORTE').AsString
                                         , '1'
                                         , sAnoReferencia);


       While not qryRub.Eof do
        begin
              sIdFavorecido  := qryRub.FieldByName('IDFAVORECIDO').AsString;
              fValorAcerto   := 0;
              bInserirRI     := True;
              fValorProvento := qryRub.FieldByName('VALORPROVENTO').AsFloat;

              // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL
              if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
                and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
                and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
                and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 0 )   then
                 begin
                  fValorAcerto := fValorProvento;
                  fSomaAbono   := fSomaAbono + fValorProvento
                 end

              // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL - DESCONTO
              Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
                and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
                and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
                and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )   then
                 begin
                  fValorAcerto := fValorProvento;
                  fSomaAbono   := fSomaAbono - fValorProvento
                 end

              // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL
              Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'Y' )
                and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
                and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
                and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 0 )   then
                 begin
                  fValorAcerto := fValorProvento;
                  fSomaAbono   := fSomaAbono + fValorProvento
                 end

              // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL - DESCONTO
              Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'Y' )
                and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
                and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
                and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )   then
                 begin
                  fValorAcerto := fValorProvento;
                  fSomaAbono   := fSomaAbono - fValorProvento
                 end;

              if fSomaAbono > 0 then
                 sFlgDesconto :='1'
              Else
               begin
                 sFlgDesconto :='0';
                 fSomaAbono   := fSomaAbono*-1;
               end;

              if fSomaAbono <> 0 then
               begin

                     programarRubricaIndividual(qryLista.FieldByName('IDPESSJUR').AsString
                                               ,qryLista.FieldByName('IDPESSOA').AsString
                                               ,sIdFavorecido
                                               ,sRubrica
                                               ,qryLista.FieldByName('IDTITULAR').AsString
                                               ,sPlanoContabil
                                               ,qryRub.FieldByName('FLGPENSAOALIM').AsString
                                               ,sPeriodoDesconto
                                               ,fSomaAbono  );


                     InsereOuAlteraHistoricoBeneficioProcessado(qryLista.FieldByName('IDPESSOA').AsString
                                                               ,qryLista.FieldByName('IDPESSJUR').AsString
                                                               ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                               ,qryLista.FieldByName('IDBENEFICIO').AsString
                                                               ,qryLista.FieldByName('NUMEROPROCESSO').AsString
                                                               ,sPeriodoDesconto
                                                               ,sFlgDesconto
                                                               ,qryLista.FieldByName('FONTEPAGADORA').AsString
                                                               ,qryLista.FieldByName('IDPLANOORIGEM').AsString
//                                                               ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                               ,qryLista.FieldByName('IDTITULAR').AsString
                                                               ,sIdLote // SOL 229906 PPM 345184 Fernando Xavier
                                                               ,qryRub.FieldByName('MESCOBRANCA').AsString // SOL 229906 PPM 345184 Fernando Xavier
                                                               ,fSomaAbono);

               end;


              qryRub.Next;
        end;

       fValorAcerto := 0;
       fValorProvento :=  retornaValorRubAcaoJudicialMesMorte(sRubricaAbono);

       if qryLista.FieldByName('ANOMORTE').AsString <>  sAnoReferencia then
         fValorAcerto := 0
       Else if ( qryLista.FieldByName('DIAMORTE').AsInteger > 15 ) then
         fValorAcerto := fValorProvento * (qryLista.FieldByName('MESMORTE').AsInteger)/12
       Else
         fValorAcerto := fValorProvento * (qryLista.FieldByName('MESMORTE').AsInteger -1 )/12;

       If fValorAcerto <> 0 then
        begin
             programarRubricaIndividual( qryLista.FieldByName('IDPESSJUR').AsString
                                        ,qryLista.FieldByName('IDPESSOA').AsString
                                        ,sIdFavorecido
                                        ,sRubricaAbono
                                        ,qryLista.FieldByName('IDTITULAR').AsString
                                        ,sPlanoContabil
                                        ,qryRub.FieldByName('FLGPENSAOALIM').AsString
                                        ,sPeriodoDesconto
                                        ,fValorAcerto  );

             //Lança histórico do abono proporcional
             InsereOuAlteraHistoricoBeneficioProcessado(qryLista.FieldByName('IDPESSOA').AsString
                                                       ,qryLista.FieldByName('IDPESSJUR').AsString
                                                       ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                       ,qryLista.FieldByName('IDBENEFICIO').AsString
                                                       ,qryLista.FieldByName('NUMEROPROCESSO').AsString
                                                       ,sPeriodoDesconto
                                                       ,'0'
                                                       ,qryLista.FieldByName('FONTEPAGADORA').AsString
                                                       ,qryLista.FieldByName('IDPLANOORIGEM').AsString
//                                                       ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                       ,qryLista.FieldByName('IDTITULAR').AsString
                                                       ,sIdLote // SOL 229906 PPM 345184 Fernando Xavier
                                                       ,qryRub.FieldByName('MESCOBRANCA').AsString // SOL 229906 PPM 345184 Fernando Xavier
                                                       ,fValorAcerto);
        end;

       qryRub.Close;

       qryRubAcaoJud.Next;
     end;

    qryRubAcaoJud.Close;
    qryRub.Close;

    consultarRubricasAbonoAcaoJudicialNaoProcessadas ( qryLista.FieldByName('IDPESSOA').AsString
                                                     , qryLista.FieldByName('IDBENEFICIO').AsString
                                                     , sAnoReferencia);



    While not qryRub.Eof do
     begin
           fSomaAbono := 0;

           sRubricaAbono    := qryRub.FieldByName('IDRUBRICA').AsString;
           sRubrica         := sRubricaAbono;
           sRubrica         := retornaRubricaDesconto(sRubrica);
           sPeriodoDesconto := sAnoReferencia + '/13';

           sIdFavorecido    := qryRub.FieldByName('IDFAVORECIDO').AsString;
           fValorAcerto     := 0;
           bInserirRI       := True;
           fValorProvento   := qryRub.FieldByName('VALORPROVENTO').AsFloat;

           // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL
           if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
             and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
             and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
             and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 0 )   then
              begin
               fValorAcerto := fValorProvento;
               fSomaAbono   := fSomaAbono + fValorProvento
              end

           // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL - DESCONTO
           Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
             and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
             and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
             and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )   then
              begin
               fValorAcerto := fValorProvento;
               fSomaAbono   := fSomaAbono - fValorProvento
              end

           // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL
           Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'Y' )
             and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
             and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
             and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 0 )   then
              begin
               fValorAcerto := fValorProvento;
               fSomaAbono   := fSomaAbono + fValorProvento
              end

           // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL - DESCONTO
           Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'Y' )
             and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
             and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
             and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )   then
              begin
               fValorAcerto := fValorProvento;
               fSomaAbono   := fSomaAbono - fValorProvento
              end;

           if fSomaAbono > 0 then
              sFlgDesconto :='1'
           Else
            begin
              sFlgDesconto :='0';
              fSomaAbono   := fSomaAbono*-1;
            end;

           if fSomaAbono <> 0 then
            begin

                  programarRubricaIndividual(qryLista.FieldByName('IDPESSJUR').AsString
                                            ,qryLista.FieldByName('IDPESSOA').AsString
                                            ,sIdFavorecido
                                            ,sRubrica
                                            ,qryLista.FieldByName('IDTITULAR').AsString
                                            ,sPlanoContabil
                                            ,qryRub.FieldByName('FLGPENSAOALIM').AsString
                                            ,sPeriodoDesconto
                                            ,fSomaAbono  );


                  InsereOuAlteraHistoricoBeneficioProcessado(qryLista.FieldByName('IDPESSOA').AsString
                                                            ,qryLista.FieldByName('IDPESSJUR').AsString
                                                            ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                            ,qryLista.FieldByName('IDBENEFICIO').AsString
                                                            ,qryLista.FieldByName('NUMEROPROCESSO').AsString
                                                            ,sPeriodoDesconto
                                                            ,sFlgDesconto
                                                            ,qryLista.FieldByName('FONTEPAGADORA').AsString
                                                            ,qryLista.FieldByName('IDPLANOORIGEM').AsString
//                                                            ,qryLista.FieldByName('IDPLANOPREV').AsString
                                                            ,qryLista.FieldByName('IDTITULAR').AsString
                                                            ,sIdLote // SOL 229906 PPM 345184 Fernando Xavier
                                                            ,qryRub.FieldByName('MESCOBRANCA').AsString // SOL 229906 PPM 345184 Fernando Xavier
                                                            ,fSomaAbono);

            end;


           qryRub.Next;
     end;

    qryRub.Close;
end;

procedure TfrmEncerramentoPorFalecimento.consultarRubricasAbonoAcaoJudicial( sIdPessoa, sIdBeneficio, sIdRubrica, sDataMorte, sFontePagadora,
  sAnoReferencia: String);
var sSql : String;
begin
  sSql :=  ' SELECT H.MES                                 '
        +  '    ,H.MESCOBRANCA                            '
        +  '    ,CASE WHEN SUBSTR(H.MES,6,7) = ''13''     '
        +  '      THEN ''SIM''                            '
        +  '      ELSE ''NAO''                            '
        +  '     END AS ABONOANUAL                        '
        +  '    ,H.IDPESSJUR                              '
        +  '    ,H.IDRUBRICA                              '
        +  '    ,H.IDMOTIVO                               '
        +  '    ,H.REFERENCIA                             '
        +  '    ,H.IDPESSOA                               '
        +  '    ,H.SEQRUBRICA                             '
        +  '    ,H.CODIRRFDARF                            '
        +  '    ,H.IDHSTFOLHABENEF                        '
        +  '    ,H.CODDOCUMENTO                           '
        +  '    ,H.IDLANCIRRF                             '
        +  '    ,H.IDRESPONSAVEL                          '
        +  '    ,H.IDPATRO                                '
        +  '    ,H.IDRETROATIVO                           '
        +  '    ,H.CODMOEDA                               '
        +  '    ,H.IDREGRACALCULO                         '
        +  '    ,H.CODPROVDESC                            '
        +  '    ,H.VALORPROVENTO                          '
        +  '    ,H.FLGCOMPOESALPART                       '
        +  '    ,H.FLGCOMPOESALBENEF                      '
        +  '    ,H.FLGIRRF                                '
        +  '    ,H.VALORCOTAS                             '
        +  '    ,H.VLRANTRETROATIVO                       '
        +  '    ,H.FLGCOMPOEREMTOTAL                      '
        +  '    ,H.FLGPREVIA                              '
        +  '    ,H.FLGSRB                                 '
        +  '    ,H.FLGCONCESSAO                           '
        +  '    ,H.FONTEPAGADORA                          '
        +  '    ,H.DATAPAGAMENTO                          '
        +  '    ,H.FLGSALPARTRETRO                        '
        +  '    ,H.FLGSALPARTATUARIA                      '
        +  '    ,H.FLGSALBENEFRETRO                       '
        +  '    ,H.IDMODULO                               '
        +  '    ,H.VALORINFO                              '
        +  '    ,H.VALORNADIB                             '
        +  '    ,H.TIPOITEMPCS                            '
        +  '    ,H.SEQHISTFUNC                            '
        +  '    ,H.FLGEQUIPARACAO                         '
        +  '    ,H.PERCENTUALNADIB                        '
        +  '    ,H.VALORRECEBIDO                          '
        +  '    ,H.IDTITULAR                              '
        +  '    ,H.IDPLANOPREV                            '
        +  '    ,H.IDFAVORECIDO                           '
        +  '    ,H.CODPORTFORMA                           '
        +  '    ,H.FLGPENSAOALIM                          '
        +  '    ,H.IDINFORME                              '
        +  '    ,H.IDCBANCARIA                            '
        +  '    ,H.NUMBANCO                               '
        +  '    ,H.NUMAGENCIA                             '
        +  '    ,H.CONTACORRENTE                          '
        +  '    ,H.FLGESTORNO                             '
        +  '    ,H.IDVERSAOPAGTO                          '
        +  '    ,H.VALORINTEGRAL                          '
        +  '    ,H.IDLANCIRRFESTORNO                      '
        +  '    ,H.FLGTIPODESC                            '
        +  '    ,H.LOTEORIGINAL                           '
        +  '    ,H.SEQORIGINAL                            '
        +  '    ,H.PERCENTUAL                             '
        +  '    ,H.NUMEROPROCESSO                         '
        +  '    ,H.NUMPROCINSS                            '
        +  '    ,H.TRGDTINCLUSAO                          '
        +  '    ,H.TRGUSERINCLUSAO                        '
        +  '    ,H.FLGSALFAM                              '
        +  '    ,H.FLGIRRFTOTAL                           '
        +  '    ,H.FLGMOLESTIAGRAVE                       '
        +  '    ,H.NUMDEPIRRF                             '
        +  '    ,H.NUMDEPSF                               '
        +  '    ,H.FLGISENTOIRRF                          '
        +  '    ,H.IDPLANOORIGEM                          '
        +  '    ,H.IDRESPONNAOREC                         '
        +  '    ,H.PARCELAS                               '
        +  '    ,H.ORDEM                                  '
        +  '    ,H.CODCENTROCUSTOD                        '
        +  '    ,H.PLANO                                  '
        +  '    ,H.UNIDNEGOC                              '
        +  '    ,H.CODSUBCONTA                            '
        +  '    ,H.CODCENTRORESPON                        '
        +  '    ,H.RECPAG                                 '
        +  '    ,H.CODTIPRECDES                           '
        +  '    ,H.PLACONTAC                              '
        +  '    ,H.PLACONTAD                              '
        +  '    ,H.IDPLANOCONTABIL                        '
        +  '    ,H.CODCENTROCUSTOC                        '
        +  '    ,H.FLGESPECIAL                            '
        +  '    ,H.FLGDESCONTO                            '
        +  '    ,H.IDRECEBEPGTO                           '
        +  '    ,H.IDPROCJUD                              '
        +  '    ,H.IDBENEFICIO                            '
        +  '    ,H.NUMDOCUMENTO                           '
        +  '    ,H.CODDOCUMENTOPGAPAGAR                   '
        +  '    ,H.CODDOCUMENTOPGARECEBER                 '
        +  ' FROM HISTRUBSAL H                            '
        +  '     ,PROVDESC P                              '
        +  ' WHERE  P.IDPROVENTO = H.IDRUBRICA            '
        +  '  AND SUBSTR(H.MES,6,7) = ''13''              '
        +  '  AND H.IDRESPONSAVEL = ' + sIdPessoa
        +  '  AND H.IDBENEFICIO = ' + sIdBeneficio
        +  '  AND H.IDRUBRICA = ' + sIdRubrica
        +  '  AND SUBSTR(H.MES,1,4) >= TO_CHAR(TO_DATE('+ QuotedStr( sDataMorte )  +',''DD/MM/YYYY''),''YYYY'')  '
        +  '  AND (SUBSTR(H.MES,1,4) = '+sAnoReferencia+')  '  //-- ANO REFERENCIA
        +  '  AND H.FONTEPAGADORA = ' + qryLista.FieldByName('FONTEPAGADORA').AsString
//        +  ' ORDER BY FLGTIPODESC          '; //Everson TIBERO
        +  ' ORDER BY H.FLGTIPODESC          '; //Everson TIBERO

  FazQuery(qryRub, ssql);
end;


function TfrmEncerramentoPorFalecimento.retornaValorRubAcaoJudicialMesMorte(sRubrica: String): real;
var sSql : String;
    fValorBenef: real;
begin
  fValorBenef   := 0;

(*
  sSql :=  ' SELECT VALORRUBRICA FROM         '
        +  ' (                                '
        +  ' SELECT RI.VALORRUBRICA           '
        +  ' FROM CM.RUBRICAINDIV RI          '
        +  ' WHERE RI.IDPESSOA = ' + qryLista.FieldByName('IDPESSOA').AsString
        +  '   AND RI.IDRUBRICA = ' + sRubrica
        +  '   AND RI.FLGUSAABONO = 1         '
        +  '   AND RI.ANOMESREF <= ' + QuotedStr(qryLista.FieldByName('MESANOMORTE').AsString)
        +  ' ORDER BY RI.ANOMESREF DESC       '
        +  ' ) WHERE ROWNUM =1                ';
*)

  sSql :=  '  SELECT VALORPROVENTO AS VALORRUBRICA FROM  '
        +  ' (                                '
        +  ' SELECT VALORPROVENTO             '
        +  ' FROM HISTRUBSAL H                '
        +  ' WHERE  H.IDRESPONSAVEL = ' + qryLista.FieldByName('IDPESSOA').AsString
        +  ' AND H.IDRUBRICA = ' + sRubrica
        +  ' AND H.MESCOBRANCA <= ' + QuotedStr(qryLista.FieldByName('MESANOMORTE').AsString)
        +  ' AND SUBSTR(H.MESCOBRANCA,1,4) >= ' + QuotedStr(qryLista.FieldByName('ANOMORTE').AsString)
        +  ' AND H.FONTEPAGADORA = ' + qryLista.FieldByName('FONTEPAGADORA').AsString
        +  ' ORDER BY H.MESCOBRANCA DESC      '
        +  ' )                                '
        +  ' WHERE ROWNUM =1                  ';

  if FazQuery(qryAux, ssql) then
    fValorBenef := qryAux.FieldByName('VALORRUBRICA').AsFloat;

  Result := fValorBenef;
end;

procedure TfrmEncerramentoPorFalecimento.consultarRubricasAbonoAcaoJudicialNaoProcessadas(  sIdPessoa, sIdBeneficio, sAnoReferencia: String);
var sSql : String;
begin
  sSql :=  ' SELECT H.MES                                 '
        +  '    ,H.MESCOBRANCA                            '
        +  '    ,CASE WHEN SUBSTR(H.MES,6,7) = ''13''     '
        +  '      THEN ''SIM''                            '
        +  '      ELSE ''NAO''                            '
        +  '     END AS ABONOANUAL                        '
        +  '    ,H.IDPESSJUR                              '
        +  '    ,H.IDRUBRICA                              '
        +  '    ,H.IDMOTIVO                               '
        +  '    ,H.REFERENCIA                             '
        +  '    ,H.IDPESSOA                               '
        +  '    ,H.SEQRUBRICA                             '
        +  '    ,H.CODIRRFDARF                            '
        +  '    ,H.IDHSTFOLHABENEF                        '
        +  '    ,H.CODDOCUMENTO                           '
        +  '    ,H.IDLANCIRRF                             '
        +  '    ,H.IDRESPONSAVEL                          '
        +  '    ,H.IDPATRO                                '
        +  '    ,H.IDRETROATIVO                           '
        +  '    ,H.CODMOEDA                               '
        +  '    ,H.IDREGRACALCULO                         '
        +  '    ,H.CODPROVDESC                            '
        +  '    ,H.VALORPROVENTO                          '
        +  '    ,H.FLGCOMPOESALPART                       '
        +  '    ,H.FLGCOMPOESALBENEF                      '
        +  '    ,H.FLGIRRF                                '
        +  '    ,H.VALORCOTAS                             '
        +  '    ,H.VLRANTRETROATIVO                       '
        +  '    ,H.FLGCOMPOEREMTOTAL                      '
        +  '    ,H.FLGPREVIA                              '
        +  '    ,H.FLGSRB                                 '
        +  '    ,H.FLGCONCESSAO                           '
        +  '    ,H.FONTEPAGADORA                          '
        +  '    ,H.DATAPAGAMENTO                          '
        +  '    ,H.FLGSALPARTRETRO                        '
        +  '    ,H.FLGSALPARTATUARIA                      '
        +  '    ,H.FLGSALBENEFRETRO                       '
        +  '    ,H.IDMODULO                               '
        +  '    ,H.VALORINFO                              '
        +  '    ,H.VALORNADIB                             '
        +  '    ,H.TIPOITEMPCS                            '
        +  '    ,H.SEQHISTFUNC                            '
        +  '    ,H.FLGEQUIPARACAO                         '
        +  '    ,H.PERCENTUALNADIB                        '
        +  '    ,H.VALORRECEBIDO                          '
        +  '    ,H.IDTITULAR                              '
        +  '    ,H.IDPLANOPREV                            '
        +  '    ,H.IDFAVORECIDO                           '
        +  '    ,H.CODPORTFORMA                           '
        +  '    ,H.FLGPENSAOALIM                          '
        +  '    ,H.IDINFORME                              '
        +  '    ,H.IDCBANCARIA                            '
        +  '    ,H.NUMBANCO                               '
        +  '    ,H.NUMAGENCIA                             '
        +  '    ,H.CONTACORRENTE                          '
        +  '    ,H.FLGESTORNO                             '
        +  '    ,H.IDVERSAOPAGTO                          '
        +  '    ,H.VALORINTEGRAL                          '
        +  '    ,H.IDLANCIRRFESTORNO                      '
        +  '    ,H.FLGTIPODESC                            '
        +  '    ,H.LOTEORIGINAL                           '
        +  '    ,H.SEQORIGINAL                            '
        +  '    ,H.PERCENTUAL                             '
        +  '    ,H.NUMEROPROCESSO                         '
        +  '    ,H.NUMPROCINSS                            '
        +  '    ,H.TRGDTINCLUSAO                          '
        +  '    ,H.TRGUSERINCLUSAO                        '
        +  '    ,H.FLGSALFAM                              '
        +  '    ,H.FLGIRRFTOTAL                           '
        +  '    ,H.FLGMOLESTIAGRAVE                       '
        +  '    ,H.NUMDEPIRRF                             '
        +  '    ,H.NUMDEPSF                               '
        +  '    ,H.FLGISENTOIRRF                          '
        +  '    ,H.IDPLANOORIGEM                          '
        +  '    ,H.IDRESPONNAOREC                         '
        +  '    ,H.PARCELAS                               '
        +  '    ,H.ORDEM                                  '
        +  '    ,H.CODCENTROCUSTOD                        '
        +  '    ,H.PLANO                                  '
        +  '    ,H.UNIDNEGOC                              '
        +  '    ,H.CODSUBCONTA                            '
        +  '    ,H.CODCENTRORESPON                        '
        +  '    ,H.RECPAG                                 '
        +  '    ,H.CODTIPRECDES                           '
        +  '    ,H.PLACONTAC                              '
        +  '    ,H.PLACONTAD                              '
        +  '    ,H.IDPLANOCONTABIL                        '
        +  '    ,H.CODCENTROCUSTOC                        '
        +  '    ,H.FLGESPECIAL                            '
        +  '    ,H.FLGDESCONTO                            '
        +  '    ,H.IDRECEBEPGTO                           '
        +  '    ,H.IDPROCJUD                              '
        +  '    ,H.IDBENEFICIO                            '
        +  '    ,H.NUMDOCUMENTO                           '
        +  '    ,H.CODDOCUMENTOPGAPAGAR                   '
        +  '    ,H.CODDOCUMENTOPGARECEBER                 '
        +  ' FROM HISTRUBSAL H                            '
        +  '     ,PROVDESC P                              '
        +  ' WHERE P.IDPROVENTO = H.IDRUBRICA             '
        +  '  AND SUBSTR(H.MES,6,7) = ''13''              '
        +  '  AND H.IDRESPONSAVEL = ' + sIdPessoa
        +  '  AND H.IDBENEFICIO = ' + sIdBeneficio
        +  '  AND (SUBSTR(H.MES,1,4) = '+sAnoReferencia+') '  //-- ANO REFERENCIA
        +  '  AND H.FONTEPAGADORA = ' + qryLista.FieldByName('FONTEPAGADORA').AsString
        +  '  AND (P.FLGACAOJUDICIAL = 1 )                '
        +  '  AND (P.CODFONTEPAGADORA = 1 )               '
        +  '  AND NOT EXISTS                              '
        +  '   (                                          '
        +  '  SELECT 1                                    '
        +  '  FROM CM.RUBRICAINDIV RI2                    '
        +  '  WHERE (RI2.IDPESSOA = ' + sIdPessoa + ' )   '
        +  '    AND (RI2.FLGUSAABONO = 1  )               '
//        +  '    AND (NVL(RI2.FLGDESATIVADO,0) = 0)        '
        +  '    AND ( (RI2.FLGPERMANENTE = 1) OR          '
        +  '          (SUBSTR(RI2.ANOMESREF,1,4) = '+sAnoReferencia+') '
        +  '        )                                     '
        +  '    AND NVL(RI2.IDMOTIVO,0) <> 3051           '
        +  '    AND RI2.IDRUBRICA = P.IDPROVENTO          '
        +  '   )                                          '
//        +  ' ORDER BY FLGTIPODESC                         '; //Everson TIBERO
        +  ' ORDER BY H.FLGTIPODESC                         '; //Everson TIBERO

  FazQuery(qryRub, ssql);
  
end;

procedure TfrmEncerramentoPorFalecimento.consultarRubricasPossuemAbonoAcaoJudicial(sIdPessoa, sAnoReferencia: String);
var sSql : String;
begin

  sSql :=  ' SELECT DISTINCT RI.IDRUBRICA, NVL(RI.IDRUBRICA13,RI.IDRUBRICA) AS IDRUBRICA13 '
        +  ' FROM CM.RUBRICAINDIV RI                      '
        +  '     ,CM.PROVDESC P                           '
        +  ' WHERE RI.IDRUBRICA = P.IDPROVENTO            '
        +  '   AND (RI.IDPESSOA = ' + sIdPessoa + ' )     '
        +  '   AND (RI.FLGUSAABONO = 1  )                 '
//        +  '   AND (NVL(RI.FLGDESATIVADO,0) = 0)          '
        +  '   AND (P.FLGACAOJUDICIAL = 1 )               '
        +  '   AND (P.CODFONTEPAGADORA = 1 )              '
        +  '   AND ( (RI.FLGPERMANENTE = 1) OR (SUBSTR(RI.ANOMESREF,1,4) = '+sAnoReferencia+') ) '
        +  '   AND NVL(RI.IDMOTIVO,0) <> 3051             '
        +  ' ORDER BY RI.IDRUBRICA                        ';

  qryRubAcaoJud.Close;
  qryRubAcaoJud.SQL.Text := sSql;
  qryRubAcaoJud.Open;

end;

function TfrmEncerramentoPorFalecimento.retornaTotalRubricasAbonoAnualAcaoJudicial(sAnoReferencia: String): real;
var sPeriodoDesconto,sRubricaAbono: String;
    fValorAcerto,fValorProvento,fSomaAbono : REAL;
begin
    consultarRubricasPossuemAbonoAcaoJudicial ( qryLista.FieldByName('IDPESSOA').AsString
                                              , sAnoReferencia);

    fSomaAbono := 0;

    While not qryRubAcaoJud.Eof do
     begin

       sRubricaAbono    := qryRubAcaoJud.FieldByName('IDRUBRICA13').AsString;
       sPeriodoDesconto :=  sAnoReferencia + '/13';

(*
       consultarRubricasAbonoAcaoJudicial( qryLista.FieldByName('IDPESSOA').AsString
                                         , qryLista.FieldByName('IDBENEFICIO').AsString
                                         , qryRubAcaoJud.FieldByName('IDRUBRICA').AsString
                                         , qryLista.FieldByName('DATAMORTE').AsString
                                         , '1'
                                         , sAnoReferencia);


       While not qryRub.Eof do
        begin
              fValorAcerto   := 0;
              fValorProvento := qryRub.FieldByName('VALORPROVENTO').AsFloat;

              // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL
              if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
                and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
                and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
                and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 0 )   then
                 begin
                  fValorAcerto := fValorProvento;
                  fSomaAbono   := fSomaAbono + fValorProvento
                 end

              // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL - DESCONTO
              Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'B' )
                and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
                and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
                and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )   then
                 begin
                  fValorAcerto := fValorProvento;
                  fSomaAbono   := fSomaAbono - fValorProvento
                 end

              // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL
              Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'Y' )
                and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
                and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
                and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 0 )   then
                 begin
                  fValorAcerto := fValorProvento;
                  fSomaAbono   := fSomaAbono + fValorProvento
                 end

              // Benefício FUNCEF - ABONO ANUAL - ACAO JUDICIAL - DESCONTO
              Else if    ( qryRub.FieldByName('FLGTIPODESC').AsString = 'Y' )
                and ( qryRub.FieldByName('FONTEPAGADORA').AsInteger = 1 )
                and ( qryRub.FieldByName('ABONOANUAL').AsString =  'SIM')
                and ( qryRub.FieldByName('FLGDESCONTO').AsInteger = 1 )   then
                 begin
                  fValorAcerto := fValorProvento;
                  fSomaAbono   := fSomaAbono - fValorProvento
                 end;

              qryRub.Next;
        end;


       qryRub.Close;
*)
       fValorProvento :=  retornaValorRubAcaoJudicialMesMorte(sRubricaAbono);

       if qryLista.FieldByName('ANOMORTE').AsString <>  sAnoReferencia then
         fValorAcerto := 0
       Else if ( qryLista.FieldByName('DIAMORTE').AsInteger > 15 ) then
         fValorAcerto := fValorProvento * (qryLista.FieldByName('MESMORTE').AsInteger)/12
       Else
         fValorAcerto := fValorProvento * (qryLista.FieldByName('MESMORTE').AsInteger -1 )/12;

       fSomaAbono := fSomaAbono + fValorAcerto;

       qryRubAcaoJud.Next;
     end;

     result := fSomaAbono;
end;

procedure TfrmEncerramentoPorFalecimento.bbtnCancelarClick(
  Sender: TObject);
begin
  inherited;
   edtTitular.Text             := '';
   edtMatricula.Text           := '';
   edtPlanoPrevidenciario.Text := '';
   edtPatrocinadora.Text       := '';
   dtInicio.Text               := '';
   dtFim.Text                  := '';
   consultar( '0','0');
   //bbtnConfirmar.Enabled       := false;
   //bbtnCancelar.Enabled        := false;
   HabilitaBotoes(3);
end;

//SIG23673
procedure TfrmEncerramentoPorFalecimento.InsereListaFalecido(
  qry: TwwQuery; sIdLote: String; sFlgNome: Integer);

Var sSql, snomeLista : String;
    IdListaOriginal: Real;
begin
   IdListaOriginal := 0;
   sSql := 'SELECT cm.seq_EncerraFalecido_Lista.NEXTVAL SEQ FROM DUAL ';
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(sSql);
   qry.Open;
   if iIdLista <> 0 then
     IdListaOriginal := iIdLista;

   iIdLista := qry.FieldByName('SEQ').Asfloat;

   if sFlgNome = 0 then
     snomeLista := InputBox('Informe o nome da lista', 'Nome','' )
   else
     snomeLista := 'LISTA DESFAZIMENTO - ' + FloatToStr(iIdLista);

   if sIdLote <> '0' then
   begin
      qry.close;
      qry.SQL.clear;
      qry.SQL.add(' insert into CM.ENCERRAFALECIDO_LISTA' + #13#10 +
              '  (IDLISTA, NOME, IDLOTE, TRGDTINCLUSAO, TRGUSERINCLUSAO, FLGSITUACAO)' + #13#10 +
              'values' + #13#10 +
              '  (:IDLISTA, :NOME, :IDLOTE, sysdate, :TRGUSERINCLUSAO, :FLGSITUACAO )');

      qry.ParamByName('IDLISTA').AsFloat          := iIdLista;
      qry.ParamByName('NOME').AsString            := snomeLista;
      qry.ParamByName('IDLOTE').AsInteger         := StrToInt(sIdLote);
      qry.ParamByName('TRGUSERINCLUSAO').AsString := Sistema.NomeUsuario;
      qry.ParamByName('FLGSITUACAO').AsFloat := 0;
   end
   else
   begin
      qry.close;
      qry.SQL.clear;
      qry.SQL.add(' insert into CM.ENCERRAFALECIDO_LISTA' + #13#10 +
              '  (IDLISTA, NOME, TRGDTINCLUSAO, TRGUSERINCLUSAO, FLGSITUACAO, FLGLISTADESFAZ, IDLISTAORIGINAL)' + #13#10 +
              'values' + #13#10 +
              '  (:IDLISTA, :NOME, sysdate, :TRGUSERINCLUSAO, :FLGSITUACAO, 1, :IDLISTAORIGINAL)');

      qry.ParamByName('IDLISTA').AsFloat          := iIdLista;
      qry.ParamByName('NOME').AsString            := snomeLista;
      qry.ParamByName('TRGUSERINCLUSAO').AsString := Sistema.NomeUsuario;
      qry.ParamByName('FLGSITUACAO').AsFloat := 0;
      qry.ParamByName('IDLISTAORIGINAL').AsFloat := IdListaOriginal;
   end;
   try
      qry.ExecSQL;
   except
      MsgDlg('Erro ao inserir o controle da Lista.','Informação', mtError, [mbOk], 0);
   end;
end;
//SIG23673


//SIG23673
procedure TfrmEncerramentoPorFalecimento.InsereListaDetFalecido(
  qry, qryResultado: TwwQuery);
Var sSql : String;
begin
  qry.close;
  qry.SQL.clear;
  qry.SQL.add('insert into CM.ENCERRAFALECIDO_LISTADET' + #13#10 +
              '( ' + #13#10 +
              'IDLISTA,' + #13#10 +
              'IDPESSOA,' + #13#10 +
              'MATRICULA,' + #13#10 +
              'NOME,' + #13#10 +
              'DATAMORTE,' + #13#10 +
              'DATAEVENTOFALECIMENTO,' + #13#10 +
              'DATAINCLUSAOEVENTO,' + #13#10 +
              'USUARIOINCLUSAOEVENTO,' + #13#10 +
              'FLGSITUACAO,' + #13#10 +
              //'IDLISTADESFAZIMENTO,' + #13#10 +
              // 'DATADESFAZIMENTO,' + #13#10 +
              'TRGDTINCLUSAO,' + #13#10 +
              'TRGUSERINCLUSAO' + #13#10 +
              ')' + #13#10 +
              'values' + #13#10 +
              '  ( ' + #13#10 +
              ':IDLISTA,' + #13#10 +
              ':IDPESSOA,' + #13#10 +
              ':MATRICULA,' + #13#10 +
              ':NOME,' + #13#10 +
              'to_date(:DATAMORTE,''dd/mm/yyyy hh24:mi:ss''),' + #13#10 +
              'to_date(:DATAEVENTOFALECIMENTO,''dd/mm/yyyy hh24:mi:ss''),' + #13#10 +
              'to_date(:DATAINCLUSAOEVENTO,''dd/mm/yyyy hh24:mi:ss''),' + #13#10 +
              ':USUARIOINCLUSAOEVENTO,' + #13#10 +
              ':FLGSITUACAO,' + #13#10 +
             // ':IDLISTADESFAZIMENTO,' + #13#10 +
             // 'to_date(:DATADESFAZIMENTO,''dd/mm/yyyy hh24:mi:ss''),' + #13#10 +
              ' sysdate,' + #13#10 +
              ':TRGUSERINCLUSAO' + #13#10 +
              ' )');

  qry.ParamByName('IDLISTA').AsFloat                       := iIdLista;
  qry.ParamByName('IDPESSOA').AsString                     := qryResultado.FieldByName('IDPESSOA').AsString;
  qry.ParamByName('MATRICULA').AsString                    := qryResultado.FieldByName('MATRICULA').AsString;
  qry.ParamByName('NOME').AsString                         := qryResultado.FieldByName('NOME').AsString;
  qry.ParamByName('DATAMORTE').AsString                    := qryResultado.FieldByName('DataFalecimento').AsString;
  qry.ParamByName('DATAEVENTOFALECIMENTO').AsString      := qryResultado.FieldByName('DataEvento').AsString;
  qry.ParamByName('DATAINCLUSAOEVENTO').AsString         := qryResultado.FieldByName('DataInclusaoEvento').AsString;
  qry.ParamByName('USUARIOINCLUSAOEVENTO').AsString        := qryResultado.FieldByName('UsuarioInclusaoEvento').AsString;

  //qry.ParamByName('IDLISTADESFAZIMENTO').AsString          := qryResultado.FieldByName('ListaCancelamento').AsString;
  //qry.ParamByName('DATADESFAZIMENTO').AsString             := qryResultado.FieldByName('DataCancelamento').AsString;


  qry.ParamByName('TRGUSERINCLUSAO').AsString := Sistema.NomeUsuario;
  qry.ParamByName('FLGSITUACAO').AsString := '0';


   try
      qry.ExecSQL;
   except
      MsgDlg('Erro ao inserir o detalhe da Lista.','Informação', mtError, [mbOk], 0);
   end;

end;
//SIG23673

//SIG23673
Function TfrmEncerramentoPorFalecimento.AtualizaLoteLista(qry: TwwQuery; sIdLote: String): Boolean;
Var sSql : String;
begin
  qry.close;
  qry.SQL.clear;
  qry.SQL.add( 'UPDATE CM.ENCERRAFALECIDO_LISTA' + #13#10 +
               'SET IDLOTE = :IDLOTE' + #13#10 +
               'WHERE IDLISTA = :IDLISTA' );

  qry.ParamByName('IDLISTA').AsFloat  := iIdLista;
  qry.ParamByName('IDLOTE').AsFloat   := StrToInt(sIdLote);

  try
    qry.ExecSQL;
    qry.Close;
  except
    MsgDlg('Erro ao atualizar lote na Lista.','Informação', mtError, [mbOk], 0);
    result := False;
    Exit;
  end;

  result := True;

end;
//SIG23673


//SIG23673
function TfrmEncerramentoPorFalecimento.PROC_CancelaFalecido(sIdLote: String):Integer;
begin

  try

    if (iIdLista <> 0) then begin
      SP_PROC.parambyName('PLISTA').AsFloat   := iIdLista;
    end
    else
    begin
      SP_PROC.parambyName('PLISTA').asInteger   := 0;
    end;

    if StrToInt(sIdLote) <> 0 then begin
      SP_PROC.parambyName('PLOTE').asInteger    := StrToInt(sIdLote);
    end
    else
    begin
      SP_PROC.parambyName('PLOTE').asInteger    := 0;
    end;

    SP_PROC.Prepare;
    SP_PROC.ExecProc;

    if SP_PROC.parambyName('PCODRESULT').AsInteger < 0 then
    begin
      MsgDlg(SP_PROC.parambyName('PMSGRESULT').AsString, 'Aviso', mtError, [mbOk], 0);
      Result := -1;
    end
    Else
    if SP_PROC.parambyName('PCODRESULT').AsInteger = 0 then
    begin
       MsgDlg(SP_PROC.parambyName('PMSGRESULT').AsString, 'Aviso', mtInformation, [mbOk], 0);
       if iTipoConsulta = 1 then
         consultar( MSBenef.ValoresChave[0],MSBenef.ValoresChave[7] );
       if iTipoConsulta = 2 then
         btnFiltrar.Click();
       if iTipoConsulta = 3 then
         consultarLista(qryLista_CTRL.FieldByName('idlista').AsString);
       Result := 0;
    end
    else
    if SP_PROC.parambyName('PCODRESULT').AsInteger = 1 then
    begin
       MsgDlg(SP_PROC.parambyName('PMSGRESULT').AsString, 'Aviso', mtInformation, [mbOk], 0);
       if iTipoConsulta = 1 then
         consultar( MSBenef.ValoresChave[0],MSBenef.ValoresChave[7] );
       if iTipoConsulta = 2 then
         btnFiltrar.Click();
       if iTipoConsulta = 3 then
         consultarLista(qryLista_CTRL.FieldByName('idlista').AsString);
       Result := 1;
    end
    else
    begin
       MsgDlg(SP_PROC.parambyName('PMSGRESULT').AsString, 'Aviso', mtInformation, [mbOk], 0);
       Result := -1;
    end;

  except
    MsgDlg('houve um erro na execução da rotina', 'Aviso', mtError, [mbOk], 0);
    Result := -1;
  end;
end;
//SIG23673

procedure TfrmEncerramentoPorFalecimento.wdblkpcmb1CloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Var sSql : String;
begin
  inherited;
  if trim(qryLista_CTRL.FieldByName('idlista').AsString) <> '' then
  begin
     iTipoConsulta := 3;
     iIdLista := qryLista_CTRL.FieldByName('idlista').AsInteger;

     if (qryLista_CTRL.FieldByName('flgsituacao').AsString = '0') or
        (qryLista_CTRL.FieldByName('flgsituacao').AsString = '4')
     then
     begin
         //BtnReproc.Enabled := true;
         //bbtnCancelar.Enabled  := true;
         //bbtnConfirmar.Enabled := false;
         //BtnDesfazer.Enabled := false;
         HabilitaBotoes(0);
     end
     else
     if (qryLista_CTRL.FieldByName('flgsituacao').AsString = '1')
     then
     begin
         //BtnReproc.Enabled := false;
         //bbtnConfirmar.Enabled := false;
         //BtnDesfazer.Enabled := true;
         //bbtnCancelar.Enabled  := true;
         HabilitaBotoes(2);
     end;
     consultarLista(qryLista_CTRL.FieldByName('idlista').AsString);
    { sSql := ' '+ #13#10 +
             '   select 0 as PROCESSAR, ' + #13#10 +
             '      lst.idpessoa idPessoa,' + #13#10 +
             '      lst.matricula Matricula,' + #13#10 +
             '      lst.nome Nome,' + #13#10 +
             '      lst.datamorte DataFalecimento,' + #13#10 +
             '      lst.dataeventofalecimento DataEvento,' + #13#10 +
             '      lst.datainclusaoevento DataInclusaoEvento,' + #13#10 +
             '      lst.usuarioinclusaoevento UsuarioInclusaoEvento,' + #13#10 +
             //'      lst.flgsituacao FlgSituacao,' + #13#10 +
             'decode(lst.FlgSituacao,0,''Não Processado'', 1,''Cancelada'', 2,''Cancelada Parcialmente'', 3, ''Desfeito'',4,''Desfeita Parcialmente'') as FlgSituacao,' + #13#10 +
             '      lst.datadesfazimento DataCancelamento,' + #13#10 +
             '      lst.idlistadesfazimento ListaCancelamento' + #13#10 +
             '   from ListaCancelaFalecido lst' + #13#10 +
             'where lst.idlista = '+qryLista_CTRL.FieldByName('idlista').AsString;

             qryLista.Sql.Text := ssql;
             qryLista.Active := true;

             qryLista.fieldbyname('PROCESSAR').displaylabel              := 'Processar';
             qryLista.fieldbyname('PROCESSAR').Index                     := 0;
             qryLista.fieldbyname('PROCESSAR').DisplayWidth              := 7;

             qryLista.fieldbyname('MATRICULA').displaylabel              := 'Matrícula';
             qryLista.fieldbyname('MATRICULA').Index                     := 1;
             qryLista.fieldbyname('MATRICULA').DisplayWidth              := 7;

             qryLista.fieldbyname('NOME').displaylabel                   := 'Nome do Beneficiário';
             qryLista.fieldbyname('NOME').Index                          := 2;
             qryLista.fieldbyname('NOME').DisplayWidth                   := 40;

             qryLista.fieldbyname('DataFalecimento').displaylabel        := 'Data Falecimento';
             qryLista.fieldbyname('DataFalecimento').Index               := 3;
             qryLista.fieldbyname('DataFalecimento').DisplayWidth        := 10;

             qryLista.fieldbyname('DataEvento').displaylabel             := 'Data Evento';
             qryLista.fieldbyname('DataEvento').Index                    := 4;
             qryLista.fieldbyname('DataEvento').DisplayWidth             := 10;

             qryLista.fieldbyname('DataInclusaoEvento').displaylabel     := 'Data Inclusão Evento';
             qryLista.fieldbyname('DataInclusaoEvento').Index            := 5;
             qryLista.fieldbyname('DataInclusaoEvento').DisplayWidth     := 10;

             qryLista.fieldbyname('UsuarioInclusaoEvento').displaylabel  := 'Usuário Inclusão Evento';
             qryLista.fieldbyname('UsuarioInclusaoEvento').Index         := 6;
             qryLista.fieldbyname('UsuarioInclusaoEvento').DisplayWidth  := 30;

             qryLista.fieldbyname('DataCancelamento').displaylabel       := 'Data Desfazimento';
             qryLista.fieldbyname('DataCancelamento').Index              := 7;
             qryLista.fieldbyname('DataCancelamento').DisplayWidth       := 10;

             qryLista.fieldbyname('ListaCancelamento').displaylabel       := 'Lista Desfazimento';
             qryLista.fieldbyname('ListaCancelamento').Index              := 8;
             qryLista.fieldbyname('ListaCancelamento').DisplayWidth       := 10;

             qryLista.fieldbyname('FlgSituacao').displaylabel       := 'Situação';
             qryLista.fieldbyname('FlgSituacao').Index              := 9;
             qryLista.fieldbyname('FlgSituacao').DisplayWidth       := 20;

             dbgrdLista.Selected.clear;

             dbgrdLista.Selected.add('PROCESSAR'#9'10'#9'Processar');
             dbgrdLista.Selected.add('MATRICULA'#9'10'#9'Matrícula');
             dbgrdLista.Selected.add('NOME'#9'25'#9'Nome do Beneficiário');
             dbgrdLista.Selected.add('DataFalecimento'#9'35'#9'Data Falecimento');
             dbgrdLista.Selected.add('DataEvento'#9'35'#9'Data Evento');
             dbgrdLista.Selected.add('DataInclusaoEvento'#9'35'#9'Data Inclusão Evento');
             dbgrdLista.Selected.add('UsuarioInclusaoEvento'#9'10'#9'Usuário Inclusão Evento');
             dbgrdLista.Selected.add('DataCancelamento'#9'35'#9'Data Desfazimento');
             dbgrdLista.Selected.add('ListaCancelamento'#9'35'#9'Lista Desfazimento');
             dbgrdLista.Selected.add('FlgSituacao'#9'35'#9'Situação');  }

             if qryLista.RecordCount <= 0 then
             begin
                MsgDlg('Não existe(m) pessoa(s) a ser(em) processada(s).','Informação', mtInformation, [mbOk, mbHelp], 0);
                //btnProcurar.Enabled   := true;
                //btnFiltrar.Enabled    := true;
                //BtnReproc.Enabled     := false;
                //bbtnConfirmar.Enabled := false;
                //BtnDesfazer.Enabled   := false;
                HabilitaBotoes(3);
             end;
  end
  else
  begin
     //btnProcurar.Enabled   := true;
     //btnFiltrar.Enabled    := true;
     //BtnReproc.Enabled     := false;
     //bbtnConfirmar.Enabled := false;
     //BtnDesfazer.Enabled   := false;
     HabilitaBotoes(3);
     consultarLista(qryLista_CTRL.FieldByName('idlista').AsString);

     {sSql := ' '+ #13#10 +
             '   select 0 as PROCESSAR, ' + #13#10 +
             '      lst.idpessoa idPessoa,' + #13#10 +
             '      lst.matricula Matricula,' + #13#10 +
             '      lst.nome Nome,' + #13#10 +
             '      lst.datamorte DataFalecimento,' + #13#10 +
             '      lst.dataeventofalecimento DataEvento,' + #13#10 +
             '      lst.datainclusaoevento DataInclusaoEvento,' + #13#10 +
             '      lst.usuarioinclusaoevento UsuarioInclusaoEvento,' + #13#10 +
             //'      lst.flgsituacao FlgSituacao,' + #13#10 +
             'decode(lst.FlgSituacao,0,''Não Processado'', 1,''Cancelada'', 2,''Cancelada Parcialmente'', 3, ''Desfeito'',4,''Desfeita Parcialmente'') as FlgSituacao,' + #13#10 +
             '      lst.datadesfazimento DataCancelamento,' + #13#10 +
             '      lst.idlistadesfazimento ListaCancelamento' + #13#10 +
             '   from ListaCancelaFalecido lst' + #13#10 +
             'where lst.idlista = 0';

             qryLista.Sql.Text := ssql;
             qryLista.Active := true; }

  end;
  if not qryLista_CTRL.isEmpty then
     wdblkpcmb1.Text := qryLista_CTRL.FieldByName('Nome').AsString;
end;

procedure TfrmEncerramentoPorFalecimento.FormCreate(Sender: TObject);
begin
  inherited;
  qryLista_CTRL.open;
  if not qryLista_CTRL.IsEmpty then
  begin
    qryLista_CTRL.First;
    wdblkpcmb1.Text := qryLista_CTRL.FieldByName('Nome').AsString;
  end;

  PageControlFiltro.ActivePage := TabData;

  iValidaGrid := True;
end;

procedure TfrmEncerramentoPorFalecimento.BtnReprocClick(Sender: TObject);
var iLote, iTotal : integer;
    sMesAnoLote, sDataPagLote, sSql: String;
begin
  inherited;

  if not qryLista.IsEmpty then
  begin
    qryLista.disableControls;
    qryLista.First;
    while not qryLista.Eof do
    begin
      if (qryLista.fieldbyname('PROCESSAR').Asinteger = 0) then
      begin
        if MsgDlg(' Será feito o reprocessamento de toda à lista, deseja continuar?','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
          begin
            qryLista.EnableControls;
            Exit;
          end
        else
          Break;
      end;
      qryLista.Next;
    end;

    while not qryLista.Eof do
    begin
      if (qryLista.fieldbyname('PROCESSAR').Asinteger = 0) then
      begin
        qryLista.edit;
        qryLista.fieldbyname('PROCESSAR').Asinteger := 1;
        qryLista.post;
        qryLista.Next;
        end;
    end;

    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    if MsgDlg(' Deseja alterar o lote?','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      begin 
        iLote := TfrmSelecionaLoteEF.SelecionaLoteFolhaBeneficio(sMesAnoLote, sDataPagLote);

        if iLote = -1 then
        begin
          qryLista.EnableControls;
          Exit;
        end;

        if not(AtualizaLoteLista(qryAux, IntToStr(iLote))) then
        begin
          qryLista.EnableControls;
          Exit;
        end;
      end
    else
      begin

        sSql := ' SELECT LC.IDLOTE FROM CM.ENCERRAFALECIDO_LISTA LC WHERE LC.IDLISTA = '+FloatToStr(iIdLista);

        if FazQuery(qryAux, ssql) then
          iLote  := qryAux.FieldByName('IDLOTE').AsInteger
        Else
          begin
            MsgDlg('Erro ao recuperar Lote.', 'Aviso', mtError, [mbOk], 0);
            qryLista.EnableControls;
            Exit;
          end;

        qryAux.Close;

      end;

    if (PROC_CancelaFalecido(IntToStr(iLote)))>=0 then //SIG23673
    begin
      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

      consultarLista(FloatToStr(iIdLista));

      HabilitaBotoes(3);

    end;
    
    qryLista.enableControls;
  end;

end;

procedure TfrmEncerramentoPorFalecimento.BtnDesfazerClick(Sender: TObject);
var iTotal : integer;
    iIdListaInicio: Real;
begin
  inherited;

  qryLista.filter:='PROCESSAR = 1 ';
  qryLista.filtered:=true;

  iTotal := 0;

  with qryLista do
   begin
     if qryLista.active then
      begin
        qryLista.disableControls;
        First;
        while not qryLista.EOF do
         begin
           if FieldByName('PROCESSAR').AsString = '1' then
             Inc(iTotal);

           Next;
         end;
        qryLista.enableControls;
      end;
   end;

  if ( iTotal = 0 ) then
    begin
      MsgDlg('Selecione a(s) pessoa(s) que deve(m) ser processada(s).','Informação', mtInformation, [mbOk, mbHelp], 0);
      qryLista.filter:='';
      qryLista.filtered:=true;
      Exit;
    end;

  if MsgDlg(' Esta ação excluirá todos os lançamentos feitos para estes beneficiários através desta rotina de encerramento. '+
            ' Deseja continuar ?','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    begin
      Exit;
    end;

  if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
      
  iIdListaInicio := iIdLista;
  InsereListaFalecido(qryAux, IntToStr(0),1 );//SIG23673

  with qryLista do
   begin
     if qryLista.active then
      begin
        qryLista.disableControls;
        Try
          First;
          while not qryLista.EOF do
           begin
             //if FieldByName('PROCESSAR').AsString = '1' then
              begin
               //processarAcerto( IntToStr(iLote) , sMesAnoLote, sDataPagLote);//SIG23673
               InsereListaDetFalecido(qryAux,qryLista); //SIG23673
              end;
             Next;
         end;
        Finally
          qryLista.enableControls;
          qryLista.First;
        end;
      end;
   end;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  PROC_DesfazCancelaFalecido(); //SIG23673

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
  qryLista.filtered:=false;

  consultarLista(FloatToStr(iIdListaInicio));
  iIdLista:= iIdListaInicio
end;

procedure TfrmEncerramentoPorFalecimento.PROC_DesfazCancelaFalecido();
begin
try

    if (iIdLista <> 0) then begin
      SP_DESFAZPROC.parambyName('PLISTA').AsFloat   := iIdLista;
    end
    else
    begin
      SP_DESFAZPROC.parambyName('PLISTA').asInteger   := 0;
    end;


    SP_DESFAZPROC.Prepare;
    SP_DESFAZPROC.ExecProc;

    if SP_DESFAZPROC.parambyName('PCODRESULT').AsInteger < 0 then
    begin
      MsgDlg(SP_DESFAZPROC.parambyName('PMSGRESULT').AsString, 'Aviso', mtError, [mbOk], 0);
    end
    Else
    if SP_DESFAZPROC.parambyName('PCODRESULT').AsInteger = 0 then
    begin
       MsgDlg(SP_DESFAZPROC.parambyName('PMSGRESULT').AsString, 'Aviso', mtInformation, [mbOk], 0);
       consultarLista(FloatToStr(iIdLista));
    end
    else
    if SP_DESFAZPROC.parambyName('PCODRESULT').AsInteger = 1 then
    begin
       MsgDlg(SP_DESFAZPROC.parambyName('PMSGRESULT').AsString, 'Aviso', mtInformation, [mbOk], 0);
       consultarLista(FloatToStr(iIdLista));
    end
    else
    begin
       MsgDlg(SP_DESFAZPROC.parambyName('PMSGRESULT').AsString, 'Aviso', mtInformation, [mbOk], 0);
    end;

  except
    MsgDlg('houve um erro na execução da rotina', 'Aviso', mtError, [mbOk], 0);
  end;
end;

procedure TfrmEncerramentoPorFalecimento.PROC_AjustaSituacaoLista(pIdLista: Real);
begin
  try

    if (pIdLista <> 0) then
    begin
      SP_AJUSTASITUACAOLISTA.parambyName('PLISTA').asfloat   := pIdLista;
    end
    else
    begin
      SP_AJUSTASITUACAOLISTA.parambyName('PLISTA').asfloat   := 0;
    end;


    SP_AJUSTASITUACAOLISTA.Prepare;
    SP_AJUSTASITUACAOLISTA.ExecProc;


  except
    MsgDlg('houve um erro na execução da rotina ''SP_AJUSTASITUACAOLISTA''.', 'Aviso', mtError, [mbOk], 0);
  end;
end;

procedure TfrmEncerramentoPorFalecimento.consultarLista(sIdLista: String);
var sSql : string;
begin
    if sIdLista = '' then
       sIdLista := '0';

     sSql := ' '+ #13#10 +
             '   select 0 as PROCESSAR, ' + #13#10 +
             '      lst.idpessoa idPessoa,' + #13#10 +
             '      lst.matricula Matricula,' + #13#10 +
             '      lst.nome Nome,' + #13#10 +
             '      lst.datamorte DataFalecimento,' + #13#10 +
             '      lst.dataeventofalecimento DataEvento,' + #13#10 +
             '      lst.datainclusaoevento DataInclusaoEvento,' + #13#10 +
             '      lst.usuarioinclusaoevento UsuarioInclusaoEvento,' + #13#10 +
             '      lst.flgsituacao as  iFlgSituacao, ' + #13#10 +
             'decode(lst.FlgSituacao,0,''Não Processado'', 1,''Processado'', 2, ''Proc. Parcialmente'') as FlgSituacao,' + #13#10 +
             '      lst.DataDesfazimento DataDesfazimento,' + #13#10 +
             '      lst.dataprocessamento Dataprocessamento' + #13#10 +
             '   from CM.ENCERRAFALECIDO_LISTADET lst, ' + #13#10 +
             '        CM.ENCERRAFALECIDO_LISTA L ' + #13#10 +
             'where lst.idlista = l.idlista and l.flgListaDesfaz = 0 '+ #13#10 +
             '  and lst.idlista = '+sIdLista;

             qryLista.close;
             qryLista.Sql.clear;
             qryLista.Sql.Add(ssql);
             qryLista.open;

             qryLista.fieldbyname('PROCESSAR').displaylabel              := 'Processar';
             qryLista.fieldbyname('PROCESSAR').Index                     := 0;
             qryLista.fieldbyname('PROCESSAR').DisplayWidth              := 7;

             qryLista.fieldbyname('MATRICULA').displaylabel              := 'Matrícula';
             qryLista.fieldbyname('MATRICULA').Index                     := 1;
             qryLista.fieldbyname('MATRICULA').DisplayWidth              := 7;

             qryLista.fieldbyname('NOME').displaylabel                   := 'Nome do Beneficiário';
             qryLista.fieldbyname('NOME').Index                          := 2;
             qryLista.fieldbyname('NOME').DisplayWidth                   := 40;

             qryLista.fieldbyname('DataFalecimento').displaylabel        := 'Data Morte';
             qryLista.fieldbyname('DataFalecimento').Index               := 3;
             qryLista.fieldbyname('DataFalecimento').DisplayWidth        := 10;

             qryLista.fieldbyname('DataEvento').displaylabel             := 'Data Evento';
             qryLista.fieldbyname('DataEvento').Index                    := 4;
             qryLista.fieldbyname('DataEvento').DisplayWidth             := 10;

             qryLista.fieldbyname('DataInclusaoEvento').displaylabel     := 'Data Inc. Evento';
             qryLista.fieldbyname('DataInclusaoEvento').Index            := 5;
             qryLista.fieldbyname('DataInclusaoEvento').DisplayWidth     := 10;

             qryLista.fieldbyname('UsuarioInclusaoEvento').displaylabel  := 'Usuário Evento';
             qryLista.fieldbyname('UsuarioInclusaoEvento').Index         := 6;
             qryLista.fieldbyname('UsuarioInclusaoEvento').DisplayWidth  := 30;

             qryLista.fieldbyname('Dataprocessamento').displaylabel       := 'Data Proc.';
             qryLista.fieldbyname('Dataprocessamento').Index              := 7;
             qryLista.fieldbyname('Dataprocessamento').DisplayWidth       := 10;

             qryLista.fieldbyname('DataDesfazimento').displaylabel       := 'Data Desfaz.';
             qryLista.fieldbyname('DataDesfazimento').Index              := 8;
             qryLista.fieldbyname('DataDesfazimento').DisplayWidth       := 10;

             qryLista.fieldbyname('FlgSituacao').displaylabel       := 'Situação';
             qryLista.fieldbyname('FlgSituacao').Index              := 9;
             qryLista.fieldbyname('FlgSituacao').DisplayWidth       := 20;

             dbgrdLista.Selected.clear;

             dbgrdLista.Selected.add('PROCESSAR'#9'10'#9'Processar');
             dbgrdLista.Selected.add('MATRICULA'#9'10'#9'Matrícula');
             dbgrdLista.Selected.add('NOME'#9'25'#9'Nome do Beneficiário');
             dbgrdLista.Selected.add('DataFalecimento'#9'35'#9'Data Morte');
             dbgrdLista.Selected.add('DataEvento'#9'35'#9'Data Evento');
             dbgrdLista.Selected.add('DataInclusaoEvento'#9'35'#9'Data Inc. Evento');
             dbgrdLista.Selected.add('UsuarioInclusaoEvento'#9'10'#9'Usuário Evento');
             dbgrdLista.Selected.add('Dataprocessamento'#9'35'#9'Data Proc.');
             dbgrdLista.Selected.add('DataDesfazimento'#9'35'#9'Data Desfaz.');
             dbgrdLista.Selected.add('FlgSituacao'#9'35'#9'Situação');
end;

procedure TfrmEncerramentoPorFalecimento.dbgrdListaFieldChanged(
  Sender: TObject; Field: TField);
var iIdListaApagar, iFlgSituacaoAux : Integer;
    ilinha: tbookmark;
begin
  inherited;
  if iValidaGrid then
  begin

    if qryLista.recordcount = 0 then
      Exit;

    // Tratamento para não selecionar pessoas com situações diferentes
    if dbgrdLista.Columns[0].FieldName = 'PROCESSAR' then
    begin
      if qryLista.fieldbyname('PROCESSAR').Asinteger = 1 then
      begin
        ilinha       := qryLista.getbookmark;
        iFlgSituacaoAux:= qryLista.fieldbyname('IFLGSITUACAO').Asinteger;
        if iFlgSituacaoAux <> 1 then iFlgSituacaoAux:= 0;
        qryLista.Filter := ' PROCESSAR = 1 and idPessoa <> ' + qryLista.fieldbyname('idPessoa').AsString ;
        qryLista.Filtered := True;
        qryLista.Active:=True;

        if qryLista.IsEmpty then
          begin
            qryLista.Filter := '';
            qryLista.Filtered := True;
            qryLista.Active:=True;
            qryLista.GotoBookMark(ilinha);
            iFlgSituacao := iFlgSituacaoAux;
            if iFlgSituacaoAux = 1 then
              HabilitaBotoes(2)
            else
              HabilitaBotoes(0);

          end
        else
          begin
            qryLista.Filter := '';
            qryLista.Filtered := True;
            qryLista.Active:=True;
            qryLista.GotoBookMark(ilinha);
            if iFlgSituacaoAux <> iFlgSituacao then
            begin
              MsgDlg(' Beneficiários com situações diferentes não podem ser incluídos em uma mesma lista.','erro', mtInformation, [mbOk], 0);
              qryLista.edit;
              qryLista.fieldbyname('PROCESSAR').Asinteger := 0;
              qryLista.post;

              ilinha       := qryLista.getbookmark;
              iFlgSituacaoAux:= qryLista.fieldbyname('IFLGSITUACAO').Asinteger;
              qryLista.Filter := ' PROCESSAR = 1 and idPessoa <> ' + qryLista.fieldbyname('idPessoa').AsString ;
              qryLista.Filtered := True;
              qryLista.Active:=True;

              if qryLista.IsEmpty then
                HabilitaBotoes(3);

              qryLista.Filter := '';
              qryLista.Filtered := True;
              qryLista.Active:=True;
              qryLista.GotoBookMark(ilinha);

              Exit;
            end;
          end;

        if (iIdLista = 0) and (iFlgSituacaoAux = 1) then
        begin
          MsgDlg('Beneficiário processados só podem ser desfeitos pela aba: Pessoa ou Lista.','Informação', mtInformation, [mbOk, mbHelp], 0);
          qryLista.edit;
          qryLista.fieldbyname('PROCESSAR').Asinteger := 0;
          qryLista.post;
          Exit;

        end;

      end;
    end;

    iIdListaApagar := 0;
    if dbgrdLista.Columns[0].FieldName = 'PROCESSAR' then
    begin
      if  qryLista.fieldbyname('PROCESSAR').Asinteger = 1 then
      begin

        qryAux.close;
        qryAux.sql.clear;
        qryAux.sql.add(' SELECT LD.IDLISTA IDLISTA FROM CM.ENCERRAFALECIDO_LISTADET LD, '+ #13#10 +
                       ' CM.ENCERRAFALECIDO_LISTA L WHERE L.IDLISTA = LD.IDLISTA '+ #13#10 +
                       ' AND L.FLGLISTADESFAZ = 0 '+ #13#10 +
                       ' AND LD.IDPESSOA = '+qryLista.fieldByName('IDPESSOA').asstring + #13#10 +
                       ' ORDER BY LD.IDLISTA DESC ');
        qryAux.Open;

        if (qryAux.RecordCount > 0) then
        begin
          iIdListaApagar := qryAux.fieldbyname('IDLISTA').AsInteger;
          IF (iIdListaApagar <> iIdLista) then
          begin
             if MsgDlg('O beneficiário foi encontrado em uma outra lista de processamento. Deseja removê-lo da outra lista ?','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
             begin
                qryLista.edit;
                qryLista.fieldbyname('PROCESSAR').Asinteger := 0;
                qryLista.post;
                Exit;
             end;

             qryAux.close;
             qryAux.sql.clear;
             qryAux.sql.add(' DELETE FROM CM.ENCERRAFALECIDO_LISTADET L WHERE L.IDPESSOA = '+qryLista.fieldByName('IDPESSOA').asstring);
             qryAux.execSql;

             PROC_AjustaSituacaoLista(iIdListaApagar);

             qryAux.close;
             qryAux.sql.clear;
             qryAux.sql.add(' SELECT LC.IDLISTA, L.IDLISTA LISTADETALHE' + #13#10 +
                            '  FROM CM.ENCERRAFALECIDO_LISTA LC' + #13#10 +
                            ' Left outer join CM.ENCERRAFALECIDO_LISTADET L' + #13#10 +
                            '    ON LC.IDLISTA = L.IDLISTA' + #13#10 +
                            ' WHERE LC.idlista = '+  IntToStr(iIdListaApagar));

             qryAux.Open;

             if (qryAux.IsEmpty) then
             begin

                qryAux.close;
                qryAux.sql.clear;
                qryAux.sql.add(' DELETE FROM CM.ENCERRAFALECIDO_LISTA LC WHERE LC.IDLISTA = '+IntToStr(iIdListaApagar));
                qryAux.execSql;
             end;


          end;
        end;
      end;
    end;

    if chkNaoProcessados.checked then
    begin
      SetFiltroGrid(1, chkNaoProcessados.checked, False );
    end
    else if chkProcessados.checked then
    begin
      SetFiltroGrid(1, chkProcessados.checked, False );
    end;
  end;
end;

procedure TfrmEncerramentoPorFalecimento.wdblkpcmb1Enter(
  Sender: TObject);
begin
  inherited;
  qryLista_CTRL.close;
  qryLista_CTRL.open;
  if not qryLista_CTRL.isEmpty then
  begin
    if rbtodas.Checked then
      begin
        qryLista_CTRL.Filter := '';
        qryLista_CTRL.Filtered := True;
      end;
    if rbprocessadas.Checked then
      begin
        qryLista_CTRL.Filter := 'flgsituacao = 1 or flgsituacao is null';
        qryLista_CTRL.Filtered := True;
      end;
    if rbNaoProcessadas.Checked then
      begin
        qryLista_CTRL.Filter := 'flgsituacao = 0 or flgsituacao is null';
        qryLista_CTRL.Filtered := True;
      end;
    if rbParcialmente.Checked then
      begin
        qryLista_CTRL.Filter := 'flgsituacao = 4 or flgsituacao is null';
        qryLista_CTRL.Filtered := True;
      end;
      qryLista_CTRL.First;
      wdblkpcmb1.Text := qryLista_CTRL.FieldByName('Nome').AsString;
  end;

end;

procedure TfrmEncerramentoPorFalecimento.btnSelTudoClick(Sender: TObject);
var bLista: Boolean;
    iIdListaApagar, iTotalSelecionado, iFlgSituacaoAux : Integer;
    ilinha: tbookmark;
begin
  inherited;
  if qryLista.IsEmpty then
    Exit;

  iIdListaApagar := 0;
  bLista         := False;
  iTotalSelecionado := 0;
  ilinha       := qryLista.getbookmark;
  iFlgSituacaoAux := 0;

  if (chkProcessados.Checked) then
  begin
    qryLista.Filter := ' PROCESSAR = 1 AND IFLGSITUACAO = 1';
    qryLista.filtered:= true;
    qryLista.Active:=True;

    if qryLista.IsEmpty then
    begin
      qryLista.Filter := ' PROCESSAR = 0 AND IFLGSITUACAO = 1';
      qryLista.filtered:= true;
      qryLista.Active:=True;

      qryLista.first;
      iFlgSituacaoAux:= qryLista.fieldbyname('IFLGSITUACAO').Asinteger;
      if iFlgSituacaoAux <> 1 then iFlgSituacaoAux:= 0;
      iFlgSituacao := iFlgSituacaoAux;

    end
    else
    begin
      qryLista.first;
      iFlgSituacaoAux:= qryLista.fieldbyname('IFLGSITUACAO').Asinteger;
      if iFlgSituacaoAux <> 1 then iFlgSituacaoAux:= 0;
      iFlgSituacao := iFlgSituacaoAux;
    end;
  end
  else if (chkNaoProcessados.Checked) then
  begin
    qryLista.Filter := ' PROCESSAR = 1 AND IFLGSITUACAO <> 1';
    qryLista.filtered:= true;
    qryLista.Active:=True;

    if qryLista.IsEmpty then
    begin
      qryLista.Filter := ' PROCESSAR = 0 AND IFLGSITUACAO <> 1';
      qryLista.filtered:= true;
      qryLista.Active:=True;

      qryLista.first;
      iFlgSituacaoAux:= qryLista.fieldbyname('IFLGSITUACAO').Asinteger;
      if iFlgSituacaoAux <> 1 then iFlgSituacaoAux:= 0;
      iFlgSituacao := iFlgSituacaoAux;

    end
    else
    begin
      qryLista.first;
      iFlgSituacaoAux:= qryLista.fieldbyname('IFLGSITUACAO').Asinteger;
      if iFlgSituacaoAux <> 1 then iFlgSituacaoAux:= 0;
      iFlgSituacao := iFlgSituacaoAux;
    end;
  end
  else
  begin
    qryLista.Filter := ' PROCESSAR = 1 ';
    qryLista.filtered:= true;
    qryLista.Active:=True;

    if qryLista.IsEmpty then
    begin
      qryLista.Filter := ' PROCESSAR = 0 AND IFLGSITUACAO <> 1';
      qryLista.filtered:= true;
      qryLista.Active:=True;

      if qryLista.IsEmpty then
      begin
        qryLista.Filter := ' PROCESSAR = 0 AND IFLGSITUACAO = 1';
        qryLista.filtered:= true;
        qryLista.Active:=True;

        qryLista.first;
        iFlgSituacaoAux:= qryLista.fieldbyname('IFLGSITUACAO').Asinteger;
        if iFlgSituacaoAux <> 1 then iFlgSituacaoAux:= 0;
        iFlgSituacao := iFlgSituacaoAux;
      end
      else
      begin
        qryLista.first;
        iFlgSituacaoAux:= qryLista.fieldbyname('IFLGSITUACAO').Asinteger;
        if iFlgSituacaoAux <> 1 then iFlgSituacaoAux:= 0;
        iFlgSituacao := iFlgSituacaoAux;
      end;
    end
    else
    begin
      qryLista.first;
      iFlgSituacaoAux:= qryLista.fieldbyname('IFLGSITUACAO').Asinteger;
      if iFlgSituacaoAux <> 1 then iFlgSituacaoAux:= 0;
      iFlgSituacao := iFlgSituacaoAux;
    end;
  end;



  qryLista.Filter := '';
  qryLista.filtered:= True;
  qryLista.filtered:= False;

  qryLista.disableControls;
  qryLista.First;
  while not qryLista.Eof do
  begin
    iFlgSituacaoAux:= qryLista.fieldbyname('IFLGSITUACAO').Asinteger;
    if iFlgSituacaoAux <> 1 then iFlgSituacaoAux:= 0;
    if (qryLista.fieldbyname('PROCESSAR').Asinteger = 0) and (iFlgSituacaoAux = iFlgSituacao) then
      begin
        qryAux.close;
        qryAux.sql.clear;
        qryAux.sql.add(' SELECT LD.IDLISTA IDLISTA FROM CM.ENCERRAFALECIDO_LISTADET LD, '+ #13#10 +
                     ' CM.ENCERRAFALECIDO_LISTA L WHERE L.IDLISTA = LD.IDLISTA '+ #13#10 +
                     ' AND L.FLGLISTADESFAZ = 0 '+ #13#10 +
                     ' AND LD.IDPESSOA = '+qryLista.fieldByName('IDPESSOA').asstring + #13#10 +
                     ' ORDER BY LD.IDLISTA ' );
        qryAux.Open;

        if (qryAux.recordcount > 0) then
        begin
          iIdListaApagar := qryAux.fieldbyname('IDLISTA').AsInteger;
          IF (iIdListaApagar <> iIdLista) then
          begin
            bLista := True;
            Break;
          end;
        end;
      end
    else
      iTotalSelecionado := iTotalSelecionado + 1;


    qryLista.Next; 
  end;

  if bLista then
  begin
    if MsgDlg('O beneficiário foi encontrado em uma outra lista de processamento. Deseja removê-lo da outra lista ?','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    begin
      qryLista.enableControls;
      Exit;
    end;
  end;

  qryLista.First;

  while not qryLista.Eof do
  begin
    iFlgSituacaoAux:= qryLista.fieldbyname('IFLGSITUACAO').Asinteger;
    if iFlgSituacaoAux <> 1 then iFlgSituacaoAux:= 0;
    if (qryLista.fieldbyname('PROCESSAR').Asinteger = 0) and (iFlgSituacaoAux = iFlgSituacao) then
    begin
      if (qryLista.fieldbyname('PROCESSAR').Asinteger = 0) and (bLista) then
      begin

        qryAux.close;
        qryAux.sql.clear;
        qryAux.sql.add(' SELECT  LD.IDLISTA FROM CM.ENCERRAFALECIDO_LISTADET LD, '+ #13#10 +
                       ' CM.ENCERRAFALECIDO_LISTA L WHERE L.IDLISTA = LD.IDLISTA '+ #13#10 +
                       ' AND LD.IDPESSOA = '+qryLista.fieldByName('IDPESSOA').asstring + #13#10 +
                       ' ORDER BY LD.IDLISTA DESC ');
        qryAux.open;

        if (qryAux.recordcount > 0) then
        begin
          iIdListaApagar := qryAux.FieldByName('IDLISTA').AsInteger;

          qryAux.close;
          qryAux.sql.clear;
          qryAux.sql.add(' DELETE FROM CM.ENCERRAFALECIDO_LISTADET L WHERE L.IDPESSOA = '+qryLista.fieldByName('IDPESSOA').asstring);
          qryAux.execSql;

          PROC_AjustaSituacaoLista(iIdListaApagar);

          qryAux.close;
          qryAux.sql.clear;
          qryAux.sql.add(' SELECT COUNT(1) QTD ' + #13#10 +
                         '   FROM CM.ENCERRAFALECIDO_LISTADET LD ' + #13#10 +
                         '  WHERE LD.idlista = '+  IntToStr(iIdListaApagar));

          qryAux.Open;

          if (qryAux.FieldByName('QTD').AsInteger = 0) then
          begin

            qryAux.close;
            qryAux.sql.clear;
            qryAux.sql.add(' DELETE FROM CM.ENCERRAFALECIDO_LISTA LC WHERE LC.IDLISTA = '+IntToStr(iIdListaApagar));
            qryAux.execSql;

          end;
        end;

      end;
      iValidaGrid := False;
      Try
        qryLista.edit;
        qryLista.fieldbyname('PROCESSAR').Asinteger := 1;
        qryLista.post;
        iValidaGrid := True;
      Except
        on e:Exception do
         begin
           iValidaGrid := True;
         end;
      end;
    end;
    qryLista.Next;
  end;
  if iFlgSituacaoAux <> 1 then
    HabilitaBotoes(0)
  else
    HabilitaBotoes(2);

  if chkNaoProcessados.checked then
    begin
      SetFiltroGrid(1, chkNaoProcessados.checked, False );
    end
  else if chkProcessados.checked then
    begin
      SetFiltroGrid(1, chkProcessados.checked, False );
    end
  else
  begin
    qryLista.Filter := '';
    qryLista.filtered:= True;
    qryLista.filtered:= False;
  end;


  qryLista.enableControls;
  qryLista.First;
end;

procedure TfrmEncerramentoPorFalecimento.HabilitaBotoes(iTipo: Integer);
begin
  case iTipo of
  0: // Processar
    begin
      bbtnConfirmar.Enabled       := True;
      bbtnCancelar.Enabled        := True;
      BtnDesfazer.Enabled         := False;
      //btnProcurar.Enabled         := False;
      //btnFiltrar.Enabled          := False;
    end;
  1: // Reprocessar
    begin
      bbtnConfirmar.Enabled       := False;
      bbtnCancelar.Enabled        := True;
      BtnDesfazer.Enabled         := False;
      //btnProcurar.Enabled         := False;
      //btnFiltrar.Enabled          := False;
    end;
  2: // Desfazimento
    begin
      bbtnConfirmar.Enabled       := False;
      bbtnCancelar.Enabled        := True;
      BtnDesfazer.Enabled         := True;
      //btnProcurar.Enabled         := False;
      //btnFiltrar.Enabled          := False;
    end;
  3: // Cancelar
    begin
      bbtnConfirmar.Enabled       := False;
      bbtnCancelar.Enabled        := False;
      BtnDesfazer.Enabled         := False;
      btnProcurar.Enabled         := True;
      btnFiltrar.Enabled          := True;
    end;
  end;
end;

procedure TfrmEncerramentoPorFalecimento.btnDesMarcarTudoClick(Sender: TObject);
begin
  inherited;

  if qryLista.IsEmpty then
    Exit;

  if not (qryLista.IsEmpty) then
  begin
    qryLista.disableControls;
    qryLista.first;
    while not qryLista.Eof do
    begin

      iValidaGrid := False;
      Try
        qryLista.edit;
        qryLista.fieldbyname('PROCESSAR').Asinteger := 0;
        qryLista.post;
        iValidaGrid := True;
      Except
        on e:Exception do
         begin
           iValidaGrid := True;
         end;
      end;
      qryLista.Next; 
    end;
  end;

  qryLista.Filter := '';
  qryLista.filtered:= True;
  qryLista.filtered:= False;

  qryLista.enableControls;
  qryLista.First;
end;

procedure TfrmEncerramentoPorFalecimento.chkProcessadosClick(
  Sender: TObject);
begin
  inherited;
  if chkProcessados.checked then
  begin
    chkNaoProcessados.Checked := False;
    SetFiltroGrid(1, chkProcessados.checked, True );
  end
  else
  begin
    SetFiltroGrid(2, chkProcessados.checked, True  );
  end;
end;

procedure TfrmEncerramentoPorFalecimento.SetFiltroGrid(pTipo: Integer; pCheck, pLimpa: Boolean);
begin
  if not(qryLista.isempty) then
  begin
    if pCheck then
    begin
      if pLimpa then btnDesMarcarTudo.OnClick(NIL);

      if pTipo = 1 then // Processados
      begin
        qryLista.Filter := ' IFLGSITUACAO = 1 ';
        qryLista.Filtered := True;
        qryLista.Active:=True;
      end
      else // Não Processados
      begin
        qryLista.Filter := ' IFLGSITUACAO <> 1 ';
        qryLista.Filtered := True;
        qryLista.Active:=True;
      end;
    end
    else
    begin
      qryLista.Filter := '';
      qryLista.filtered:= True;
      qryLista.filtered:= False;
    end;
  end
  else
  begin
    qryLista.Filter := '';
    qryLista.filtered:= True;
    qryLista.filtered:= False;
  end;
end;

procedure TfrmEncerramentoPorFalecimento.chkNaoProcessadosClick(
  Sender: TObject);
begin
  inherited;
  if chkNaoProcessados.checked then
  begin
    chkProcessados.Checked := False;
    SetFiltroGrid(2, chkNaoProcessados.checked, True  );
  end
  else
  begin
    SetFiltroGrid(1, chkNaoProcessados.checked, True  );
  end;
end;

end.
