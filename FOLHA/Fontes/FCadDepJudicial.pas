unit FCadDepJudicial;


//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA


// Alterações:
{
--------------------------------------------------------------------------------
Alteração  : (.dfm )
Data       : 22/06/2023
SIG        : 136844
Autor      : Andre Imakawa
Descrição  : Refazer SIG 99651
--------------------------------------------------------------------------------
Alteração  : (.dfm )
Data       : 10/05/2023
SIG        : 135653
Autor      : Andre Imakawa
Descrição  : Desfazer SIG 99651
--------------------------------------------------------------------------------
Alteração  : (.dfm )
Data MERGE : 24/02/2023
Data       : 24/02/2023
SIG        : 99651
Autor      : Andre Imakawa / edilaine
Descrição  : Alteração dos itens cmbTipoOAcao
--------------------------------------------------------------------------------
Alteração  : (.dfm   dbedtOrdem, lblOrdem, udpDet)
Data MERGE : 13/02/2023
Data       : 08/11/2019
SIG        : 70584/125782
Autor      : Andre Imakawa / edilaine
Descrição  : ordem de cálculo no IR judicial
--------------------------------------------------------------------------------
Data       : 26/01/2022
SIG        : 122561
Autor      : Ewerton Beltramini
Descrição  : Correção de erro SQL ao salvar inclusões e liberação de campo para demais usuarios.
--------------------------------------------------------------------------------
Data       : 29/12/2021
SIG        : 120780
Autor      : Ewerton Beltramini
Descrição  : Implementar novo campo para armazenar a cidade.
--------------------------------------------------------------------------------
Data       : 03/08/2021
SIG        : 101620
Autor      : André Imakawa
Descrição  : Parametrizar CODDARF para Rubricas de ações judiciais.
--------------------------------------------------------------------------------
Data       : 17/11/2020
SIG        : 103667
Autor      : André Imakawa
Descrição  : Correção para recuperar a Conta Corrente.
--------------------------------------------------------------------------------
Data       : 19/08/2019
SIG        : 70004
Autor      : Taffarel Sevaybriker
Descrição  : Alteração para cadastro de ação em lote.
--------------------------------------------------------------------------------
Alteração  : bbtnConfirmarClick, bbtnCancelarClick e FormClose
Data       : 06/02/2019
SIG        : 81835
Autor      : Andre Imakawa
Descrição  : Inserido transação na funcionalidade
--------------------------------------------------------------------------------
Pendência   : SOL 184597 KINTANA 1727689
Responsável : BRUNO AZEVEDO
Data        : 10/07/2012
Descrição   : Ajustes no cadastro de ação judicial com o mesmo número de processo.
--------------------------------------------------------------------------------
Pendência   : SOL 149068 KINTANA 1063344
Responsável : José Roberto Marque - JRM6
Data        : 01/06/2012
Descrição   : permitir cadastrar mais de uma ação judicial por matrícula
--------------------------------------------------------------------------------
Pendência   : SOL 151333/3563 KINTANA 1107585
Responsável : BRUNO AZEVEDO
Data        : 20/01/2010
Descrição   : Alteração no tamanho do campo "NumeroProcesso" para 30 caracteres.
--------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick
Data      : 22/10/2007
Autor     : Hugo Luna
Pendência : 24446
Descrição : Inserindo Validação, para não deixar gravar Nº de processos iguais.
----------------------------------------------------------------------------------------------------
Rotina    : várias
Data      : 30/07/2007 até 03/08/2007
Autor     : André Pontes
Pendência : 25374
Descrição : Gravação do novo campo CLASSEACAO, para posterior impressão no DARF de depósito judicial 
----------------------------------------------------------------------------------------------------
Rotina    : - (dblkRubAbono)
Data      : 03/07/2007
Autor     : André Pontes
Pendência : 24195 (reabertura)
Descrição : Corrigida propriedade LookupTable (qryRubricaAbono) da combo
----------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarClick(...)
Data      : 23/01/2007
Autor     : André Pontes
Pendência : 24195
Descrição : 1) verificação de preenchimento da DataFinal em caso de acão ganha ou perdida
            2) percentual limitado em 100%
----------------------------------------------------------------------------------------------------
Rotina    : CmeCadastroBeforeConfirma
Data      : 15/01/2007
Autor     : Paulo Ramos
Pendência : 24195
Descrição : Colocar crítica para que percentual <= 100 e de preenchimento da data final quando ação
            ganha ou perdida.
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, wwdblook, Mask, DBCtrls, CmEventosCadastro,
  ImgList, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Db,
  Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, Spin, uAdmPrevFB, ComObj,uCMTypes;

type
  TTipoPessoa = (TId, TConta, TAgencia, TOperacao, TBanco);
  TPessoa = Class
  private
    fIdPessoa: Integer;
    fContaPessoa: String;
    fAgenciaPessoa: String;
    fOperacaoPessoa: String;
    fBancoPessoa: String;
  public
    procedure LimparPessoa;
  published
     property Id: Integer read fIdPessoa write FIdPessoa;
     property Conta: String read fContaPessoa write fContaPessoa;
     property Agencia: String read fAgenciaPessoa write fAgenciaPessoa;
     property Operacao: String read fOperacaoPessoa write fOperacaoPessoa;
     property Banco: String read fBancoPessoa write fBancoPessoa;
  end;

  TFrmCadDepJudicial = class(TfrmCadMestreDetalheCS)
    pnlInfPessoa: TPanel;
    lbNome: TLabel;
    dbedNome: TDBEdit;
    lbMatricula: TLabel;
    dbedMatricula: TDBEdit;
    lbCpf: TLabel;
    dbedCPF: TDBEdit;
    lbSitNaFund: TLabel;
    edSitNaFund: TEdit;
    qryEstado: TwwQuery;
    qryEstadoCODESTADO: TStringField;
    dsEstado: TwwDataSource;
    qryAux: TwwQuery;
    qryMestre: TwwQuery;
    dsMestre: TwwDataSource;
    updMestre: TUpdateSQL;
    qryMestreIDPESSOA: TFloatField;
    qryMestreIDPROCJUD: TFloatField;
    qryMestreIDBANCO: TFloatField;
    qryMestreIDAGENCIABANCARIA: TFloatField;
    qryMestreIDCBANCARIA: TFloatField;
    qryMestreCODOPERACAO: TStringField;
    qryMestreCODVARA: TStringField;
    qryMestreNOMEVARA: TStringField;
    qryMestreCODSECAO: TStringField;
    qryMestreUFSECAO: TStringField;
    qryMestreAUTORACAO: TStringField;
    qryMestreDATAINICIO: TDateTimeField;
    qryMestreDATAFINAL: TDateTimeField;
    qryMestreSITPROCESSO: TFloatField;
    qryDet: TwwQuery;
    qryBanco: TwwQuery;
    qryAgencia: TwwQuery;
    qryConta: TwwQuery;
    dblkRegra: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    lbRegra: TLabel;
    updDet: TUpdateSQL;
    qryAuxDet: TwwQuery;
    lbRubricas: TLabel;
    dblkRubricas: TwwDBLookupCombo;
    qryRubricas: TwwQuery;
    qryMestreNUMEROPROCESSO: TStringField;
    PnlAcaoJudicial: TPanel;
    pnlRestoMestre: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    gbNumProc: TGroupBox;
    edNumProc: TEdit;
    Panel4: TPanel;
    gbxbanco: TGroupBox;
    lbBanco: TLabel;
    lbAgencia: TLabel;
    lbConta: TLabel;
    lbOperacao: TLabel;
    dblkBanco: TwwDBLookupCombo;
    dblkAgencia: TwwDBLookupCombo;
    dblkConta: TwwDBLookupCombo;
    cmbOperacao: TComboBox;
    Panel5: TPanel;
    gbInfVara: TGroupBox;
    lbCodVara: TLabel;
    lbNomeVara: TLabel;
    edCodVara: TEdit;
    edNomeVara: TEdit;
    gbInfSecao: TGroupBox;
    lbCodSecao: TLabel;
    lbUfSecao: TLabel;
    lbNomeSecao: TLabel;
    edCodSecao: TEdit;
    edNomeSecao: TEdit;
    cmbUF: TDBLookupComboBox;
    gbDatas: TGroupBox;
    lbDataInicio: TLabel;
    lbDataFim: TLabel;
    dbdtInicio: TCMDateTimePicker;
    DBedtDataFinal: TCMDateTimePicker;
    Panel7: TPanel;
    Label1: TLabel;
    cmbTipoOAcao: TComboBox;
    lblAutorAcao: TLabel;
    edAutorAcao: TEdit;
    gbStatus: TGroupBox;
    cboStatusAcao: TComboBox;
    gbxPercentual: TGroupBox;
    Label3: TLabel;
    edtPercAcao: TRealEdit;
    qryMestreTIPOACAO: TFloatField;
    qryMestrePERCACAO: TFloatField;
    cbxFazdeposito: TCheckBox;
    qryMestreFLGFAZDEPOSITO: TFloatField;
    DBCheckBox1: TDBCheckBox;
    qryAux2: TwwQuery;
    qryMestreNOMESECAO: TStringField;
    MS1: TMontaSelect;
    dblkRubAbono: TwwDBLookupCombo;
    lblRubAbono: TLabel;
    qryRubricaAbono: TwwQuery;
    Label2: TLabel;
    edtClasse: TEdit;
    qryMestreCLASSEACAO: TStringField;
    qryMestreCODIRRFDARF: TStringField;
    gbxAcaoLote: TGroupBox;
    dialog: TOpenDialog;
    qryClone: TwwQuery;
    qryAuxConta: TwwQuery;
    pnlProcessoLote: TPanel;
    lblAcaoLote: TLabel;
    gbxNumProc: TGroupBox;
    edtNumProc: TEdit;
    gbxArquivo: TGroupBox;
    edtArquivo: TEdit;
    bbtnBuscaArquivo: TBitBtn;
    chkProcessoLote: TCheckBox;
    qryIRRFDARF: TwwQuery;
    pnlDARF: TPanel;
    GroupBox1: TGroupBox;
    dblkDARF: TwwDBLookupCombo;
    DsCidade: TwwDataSource;
    fltfldEstadoIDESTADO: TFloatField;
    //Ewerton Beltramini - 29/12/2021 - SIG120780 - Inicio
    QryCidade: TwwQuery;
    QryCidadeNOME: TStringField;
    QryCidadeCODESTADO: TStringField;
    QryCidadeCODMUNICIPIO: TStringField;
    QryCidadeCODMUNICIPIOIBGE: TStringField;
    fltfldQryCidadeIDCIDADES: TFloatField;
    qryMestreIIDCIDADES: TFloatField;
    cmbCidade: TDBLookupComboBox;
    Label4: TLabel;
    lblOrdem: TLabel;
    dbedtOrdem: TDBEdit;
    //Ewerton Beltramini - 29/12/2021 - SIG120780 - fim.
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure dblkBancoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblkAgenciaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryMestreBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure dblkRegraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure cmbTipoOAcaoChange(Sender: TObject);
    procedure qryMestreAfterOpen(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure cbxFazdepositoClick(Sender: TObject);
    Function  FCriticaRegra : Boolean ;
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dblkBancoExit(Sender: TObject);
    procedure dblkAgenciaExit(Sender: TObject);
    procedure edtPercAcaoExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnBuscaArquivoClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure edtNumProcExit(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure chkProcessoLoteClick(Sender: TObject);
    function DeParaOperacao(pOperacao :string):Integer;
    procedure dblkDARFExit(Sender: TObject);
    procedure dblkDARFCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkDARFChange(Sender: TObject);
    procedure cmbUFExit(Sender: TObject); // Andre Imakawa - SIG 103667

  private // Private declarations

    sMesInicio      : String;
    sMesFim         : String;
    sAnoInicio      : String;
    sAnoFim         : String;
    sTipo           : String;

    GuardaIdPessoa  : Integer;
    GuardaIdProcJud : Integer;
    t1, t2          : Integer;

    cMasterButton   : Char;

    Year, Month, Day: Word;

    //SIG70004 - TAES - início
    bInlcuiDetalhe  : Boolean;
    NomeArquivo     : String;
    mmResultado     : TStringList;
    CadLote,
    AlteraLote,
    ExcluiLote      : Boolean;
    ListPessoas,
    ListaDetalhe,
    ListaComandos   : TStringList;
    cont            : Integer;
    ListCampos      : Array[1..2, 1..7] of String;
    opCadDet        : TDataSetState;

    procedure LimpaCampos;
    procedure MontaQueries;
    procedure BuscaAgencia;
    procedure BuscaConta;
    procedure MostraDadosBancarios;
    procedure GravarDetalhe;
    procedure HabilitaCampos(Habilita : Boolean);
    function UltimaLinha(Excel : OleVariant; var linha: Integer) : Boolean;
    function SelecionaConta(Pessoa, Agencia, Operacao, Banco, NumConta : String; qryAuxConta : TwwQuery) : String;
    function BuscarItensPessoa(IdItem : TTipoPessoa; strLinha : String) : String;
    function BuscarItensDetalhe(iItem: Integer; strLinha : String) : String;
    function ExisteProcesso(NumProc : String) : Boolean;
    procedure MontaArquivo;
    procedure MontaTela;
    procedure MontaMestre(iTipo : Integer);
    procedure AtualizarDetalheLista;
    procedure AtualizaGridDetalhe(iIdPessoa, iIdProcJud: Integer);
    function ExecutaComandosPendentes :Boolean;
    procedure HabilitaProcessoLote(bHabilita : Boolean);
    procedure CarregaCidade(CODESTADO: String);  //Ewerton Beltramini - 29/12/2021 - SIG120780
    //SIG70004 - TAES - fim


  public  // Public declarations

  end;



var
  FrmCadDepJudicial: TFrmCadDepJudicial;



implementation
{$R *.DFM}
uses
  uSistema, uDataBase, DBaseDados, uObjFolha, uMensErro;



procedure TFrmCadDepJudicial.CmeCadastroFind(Sender: TObject);
var
  lAchou : Boolean;
begin
  inherited;

  HabilitaProcessoLote(False); //TAES - SIG70004

  lAchou := False;
  if (MontaSelect.ValoresChave.Count  >  0) and
     (MontaSelect.ValoresChave[0]    <> '') then
  begin
    GuardaIdPessoa   := StrToInt(MontaSelect.ValoresChave[0]);
    edSitNaFund.Text := '';

    qry.Close;
    qry.ParamByName('IDPESSOA').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;

    qryMestre.Close;
    qryMestre.ParamByName('IDPROCJUD').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
    qryMestre.Open;

    GuardaIdProcJud := qryMestre.FieldByName('IDPROCJUD').AsInteger;

    AtualizaGridDetalhe(GuardaIdPessoa, GuardaIdProcJud);

    edNumProc.Text         := qryMestre.FieldByName('NUMEROPROCESSO').AsString;
    edtClasse.Text         := qryMestre.FieldByName('CLASSEACAO').AsString;
    edAutorAcao.Text       := qryMestre.FieldByName('AUTORACAO').AsString;

    cbxfazdeposito.Visible := True;

    if ((qryMestre.Fieldbyname('FLGFAZDEPOSITO').asInteger = 0) or
        (qryMestre.Fieldbyname('FLGFAZDEPOSITO').isNull)) then
    begin
      cbxFazDeposito.Checked  := False;
      gbxBanco.Visible        := False;
    end
    else
    begin
      cbxFazDeposito.Checked := True;
      gbxBanco.Visible       := True;
    end;
    //qryIRRFDARF.Locate('CODNATUREZA', qryMestre.FieldByName('CODIRRFDARF').AsString, []);
    dblkDARF.LookUpValue  := qryMestre.FieldByName('CODIRRFDARF').AsString; // Andre Imakawa - SIG 101620

    if qryMestre.fieldbyname('FLGFAZDEPOSITO').asInteger = 1 then
      MostraDadosBancarios;

    qryEstado.Locate('CODESTADO', qryMestre.FieldByName('UFSECAO').AsString, []);
    //Ewerton Beltramini - 29/12/2021 - SIG120780 - Inicio
    CarregaCidade(qryEstado.FieldByName('CODESTADO').AsString);
    if qryMestre.FieldByName('IDCIDADES').AsString <> '' then
       qryCidade.Locate('IDCIDADES', qryMestre.FieldByName('IDCIDADES').AsString, []);
    //Ewerton Beltramini - 29/12/2021 - SIG120780 - Fim

  end;

  opCadDet:= dsBrowse;
end;

procedure TFrmCadDepJudicial.FormShow(Sender: TObject);
begin
  inherited;
  sMesInicio              := '';
  sMesFim                 := '';
  DecodeDate(Now,Year,Month,Day);
  dblkConta.Enabled       := False;
  qryEstado.Open;
  CarregaCidade(qryEstado.FieldByName('CODESTADO').AsString);   //Ewerton Beltramini - 29/12/2021 - SIG120780
  qryMestre.Open;
  qryRegra.Close;
  bInlcuiDetalhe           := False;
  dblkRubricas.Enabled     := False;
  lbRubricas.Enabled       := False;
  dblkRubAbono.Enabled     := False;
  lblRubAbono.Enabled      := False;

  qryRegra.SQL.Clear;

  if SistemaFolha.FlgUsaRegraxRub = 1 then
  begin
    qryRegra.SQL.Add(
    ' SELECT R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA FROM REGRA R, TIPOREGRA TR, '+
    ' GRUPOREGRA GR, TIPOACAOXREGRA T WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA AND '+
    ' TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND GR.IDGRUPOREGRA = '+
    IntToStr(SistemaFolha.IdGrupoRegraFolha)+
    ' AND R.IDREGRA = T.IDREGRA AND T.TIPOACAO = :PTIPOACAO '+
    ' ORDER BY UPPER(R.NOMEREGRA) ');

    qryRegra.ParamByName('PTIPOACAO').DataType  := ftInteger;
    qryRegra.ParamByName('PTIPOACAO').AsInteger := -1;


  end else
  begin
     qryRegra.SQL.Add(
     ' SELECT R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA FROM '+
     ' REGRA R ORDER BY UPPER(R.NOMEREGRA)');
  end;

  qryRegra.Open;

  qryDet.Close;
  qryDet.SQL.Clear;
  qryDet.SQL.Add(' SELECT                                                   '+
                 '   D.IDPESSOA,  D.IDPROCJUD, D.IDREGRA, D.FLGATIVA,       '+
                 '   R.NOMEREGRA, D.IDRUBRICA, P.DESCRPROVDESC AS DESCRICAO, '+
                 '   D.IDRUBRICAABONO, P1.DESCRICAO  '+
                 '   ,D.ORDEMCALCULO                 '+                                  //Itiro - SIG70584/125782
                 ' FROM                                                     '+
                 '   REGRA R, DETPROCJUD D, PROVDESC P, PROVDESC P1      '+

                 ' WHERE                                                    '+
                 '   D.IDPROCJUD = :IDPROCJUD AND                           '+
                 '   D.IDPESSOA  = :IDPESSOA  AND                           '+
                 '   R.IDREGRA   = D.IDREGRA  AND                           '+
                 '   D.IDRUBRICA = P.IDPROVENTO AND                         '+
                 '   D.IDRUBRICAABONO = P1.IDPROVENTO(+) ');
  // põe o tipo do parâmetro
  qryDet.ParamByName('IDPROCJUD').DataType := ftInteger;
  qryDet.ParamByName('IDPESSOA').DataType  := ftInteger;

  // põe o valor do parâmetro
  qryDet.ParamByName('IDPROCJUD').asInteger := -1;
  qryDet.ParamByName('IDPESSOA').asInteger  := -1;

  qryDet.Open;

  cboStatusAcao.ItemIndex := -1;

  opCadDet:= dsBrowse;
  chkProcessoLote.Enabled := gbxAcaoLote.Enabled; //TAES - SIG70004
  HabilitaProcessoLote(False); //TAES - SIG70004
end;



procedure TFrmCadDepJudicial.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;

  FazQuery(qryAux,
     ' SELECT * FROM PROCJUD WHERE '+
     ' (IDPESSOA = '+IntToStr(GuardaIdPessoa)+')');

  if not(qryAux.IsEmpty) then
  begin
    if qryAux.FieldByName('SITPROCESSO').AsInteger = 2 then
    begin
      sbtnInserir.Enabled    := True;
      sbtnApagar.Enabled     := True;
      sbtnAlterar.Enabled    := True;
    end
    else
    begin
      pnlRestoMestre.BringToFront;
      //if not(AlteraLote) then cmbTipoOAcao.ItemIndex := qryAux.FieldByName('TIPOACAO').AsInteger; // Andre Imakawa - SIG 99651
      // Sol : 149068 Ktn : 1063344 - JRM6
      //sbtnInserir.Enabled    := false;
      sbtnInserir.Enabled    := true;
      // Sol : 149068 Ktn : 1063344 - JRM6
      sbtnApagar.Enabled     := True;
      sbtnAlterar.Enabled    := True;
    end;
  end;
end;



procedure TFrmCadDepJudicial.sbtnInserirClick(Sender: TObject);
var
  //SIG70004 - TAES - início
  sSQL : String;
  {Matricula, CPF, Operacao, NumConta, Agencia, IdcConta, Banco: String;
  Excel       : OleVariant;
  linha, i    : Integer;
  Pessoa      : Tpessoa;}

begin
  if (Trim(edtNumProc.Text) = EmptyStr) and (edtArquivo.Text = EmptyStr) then
  begin
    MS1.Executar;
    Repaint;

    if (MS1.ValoresChave.Count > 0) and (MS1.ValoresChave[0] <> '') then
    begin
      GuardaIdpessoa   := StrToInt(MS1.ValoresChave[0]);

      qry.Close;
      qry.ParamByName('IDPESSOA').Value := StrToInt(MS1.ValoresChave[0]);
      qry.Open;

      if FazQuery(qryAux, ' SELECT * FROM PROCJUD WHERE IDPESSOA = '+IntToStr(GuardaIdPessoa)) then
      begin
        // Sol : 149068 Ktn : 1063344 - JRM6
        {
        if qryAux.FieldByName('SITPROCESSO').AsInteger <> 2 then
        begin
          MsgDlg(' Essa pessoa já tem um cadastrado com status de "Ação Judicial Em Liminar" '+#13+
                 ' ou "Ação Judicial Ganha", impossibilitando outra inserção. ', 'Informação', mtInformation,
                 [mbOk], 0);
          LimpaCampos;
          Exit;
        end;
        {}
        // Sol : 149068 Ktn : 1063344 - JRM6
      end;
      inherited;
      LimpaCampos;
      CadLote := False; //SIG70004 - TAES
      qryMestre.Insert;
      GuardaIdProcJud:=LeUltRegistro(Nil,'PROCJUD');

      AtualizaGridDetalhe(GuardaIdPessoa, GuardaIdProcJud);

      qryEstado.Open;
      CarregaCidade(qryEstado.FieldByName('CODESTADO').AsString);    //Ewerton Beltramini - 29/12/2021 - SIG120780
      qryBanco.Open;
      qry.Close;
      qry.ParamByName('IDPESSOA').Value    := StrToInt(MS1.ValoresChave[0]);
      qry.Open;

      qryIRRFDARF.Open; // Andre Imakawa - SIG 101620

      edAutorAcao.Enabled := True;
      sbtnInsDet.Enabled := False;
      dblkConta.Enabled:=False;
      cMasterButton := 'I';
    end
    else
      sbtnInsDet.down:=False;
  end
  else
    begin
      //SIG71004 - TAES - início
      ListPessoas.clear;
      ListaComandos.clear;
      opCadDet:= dsBrowse;

      if Trim(edtNumProc.Text) = EmptyStr then
      begin
        MsgDlg('Número do Processo deve ser informado.', 'Informação', mtInformation, [mbOk], 0);
        if edtNumProc.CanFocus then
          edtNumProc.SetFocus;
          sbtnInserir.down := False;
          exit;
      end
      else if Trim(edtArquivo.Text) = EmptyStr then
      begin
        MsgDlg('Nome do arquivo deve ser informado.', 'Informação', mtInformation, [mbOk], 0);
        if bbtnBuscaArquivo.CanFocus then
          bbtnBuscaArquivo.SetFocus;
          sbtnInserir.down := False;
          exit;
      end;

      if (ExisteProcesso(edtNumProc.Text)) then
      begin
        MsgDlg('Processo já cadastrado. Verifique!' , 'Informação', mtInformation, [mbOk], 0);
        if edtNumProc.CanFocus then
           edtNumProc.SetFocus;
           sbtnInserir.down := False;
           exit;
      end;

      LimpaCampos;
      HabilitaCampos(True);
      edNumProc.Text := edtNumProc.Text;
      CadLote := True;
      qryMestre.Insert;
      qry.Close;
      qry.ParamByName('IDPESSOA').AsInteger := -1;
      qry.Open;
      GuardaIdProcJud := LeUltRegistro(Nil,'PROCJUD');
      sbtnInsDet.Enabled := True;
      cMasterButton := 'I';

      MontaArquivo;

      AtualizaGridDetalhe(-1, -1);

      inherited;

      cmbTipoOAcao.Text := '';
      gbxPercentual.Visible := False;
      edtPercAcao.Text:= '';
    end;
//SIG70004 - TAES - fim
end;

procedure TFrmCadDepJudicial.dblkBancoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  BuscaAgencia; 
end;

procedure TFrmCadDepJudicial.dblkAgenciaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  BuscaConta; 
end;

procedure TFrmCadDepJudicial.bbtnConfirmarClick(Sender: TObject);
var
  qryUpd     : twwQuery;
  iIdComp    : Integer;
  bJaTemTipo, bJaTemProcesso : Boolean;
  //SIG70004 - TAES - início
  i                     : Integer;
  sSql                  : String;
  PessoaDet, ProcJudDet,
  PessoaConta           : Integer;

  function ValidaEntradas(iParte: Integer) : Boolean;
  begin
    result:= true;

    case iParte of
     1: begin
         if Trim(cmbTipoOAcao.Text) = '' then
          begin
            MsgDlg('O campo Tipo da Ação Judicial é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
            cmbTipoOAcao.SetFocus;
            result:= false;
          end;
        end;

      2: begin
           if Trim(edNumProc.Text) = '' then
            begin
              MsgDlg('O campo Numero do Processo é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
              edNumProc.SetFocus;
              result:= false;
            end;

            //if (cmbTipoOAcao.ItemIndex = 0) Or (cmbTipoOAcao.ItemIndex = 1) then  // Andre Imakawa - SIG 99651
            if (cmbTipoOAcao.ItemIndex = 0) Or (cmbTipoOAcao.ItemIndex = 1)         // Andre Imakawa - SIG 99651
                 Or (cmbTipoOAcao.ItemIndex = 2) then                               // Andre Imakawa - SIG 99651
            begin
              if Trim(edAutorAcao.Text) = '' then
              begin
                MsgDlg('O campo Autor da Ação é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
                edAutorAcao.SetFocus;
                result:= false;
              end;
            end;

            //if cmbtipoOAcao.ItemIndex = 1 then                                 // Andre Imakawa - SIG 99651
            if (cmbtipoOAcao.ItemIndex = 1) or (cmbtipoOAcao.ItemIndex = 2) then // Andre Imakawa - SIG 99651
              if edtPercAcao.Value <= 0 then
              begin
                MsgDlg('O campo Percentual tem que ser maior que 0 (zero).', 'Informação', mtInformation, [mbOk], 0);
                edtPercAcao.SetFocus;
                result:= false;
              end;

            if dbdtInicio.Text = '' then
            begin
              MsgDlg('O campo data início é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
              dbdtInicio.SetFocus;
              result:= false;
            end;

            if cboStatusAcao.ItemIndex < 0 then
            begin
              MsgDlg('O campo Status da Ação é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
              cboStatusAcao.SetFocus;
              result:= false;
            end;

            if Trim(edCodVara.Text) = '' then
            begin
              MsgDlg('O campo Código da Vara é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
              edCodVara.SetFocus;
              result:= false;
            end;

            if Trim(edNomeVara.Text) = '' then
            begin
              MsgDlg('O campo Nome da Vara é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
              edNomeVara.SetFocus;
              result:= false;
            end;

            {if Trim(edCodSecao.Text) = '' then
            begin
              MsgDlg('O campo Código da Seção é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
              edCodSecao.SetFocus;
              Exit;
            end;

            if Trim(edNomeSecao.Text) = '' then
            begin
              MsgDlg('O campo Nome da Seção é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
              edNomeSecao.SetFocus;
              Exit;
            end;
      }
            if (Trim(cmbUF.Text) = '') then
            begin
              MsgDlg('O campo UF é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
              cmbUF.SetFocus;
              result:= false;
            end;

            if (Trim(cmbCidade.Text) = '') then
            begin
              MsgDlg('O campo Cidade é de preenchimento obrigatório.', 'Informação', mtInformation, [mbOk], 0);
              cmbCidade.SetFocus;
              result:= false;
            end;



            // -------------------------------------------------------------------------------------------

            // 1) verificação de preenchimento da DataFinal em caso de acão ganha ou perdida

            if cboStatusAcao.ItemIndex > 0 then
            begin
              if length(trim(DBedtDataFinal.Text)) = 0 then
              begin
                MsgDlg('É necessário indicar a Data Final em caso de causa ganha ou perdida!', Sistema.NomeModulo, mtWarning, [mbOk], 0);
                Repaint;
                DBedtDataFinal.SetFocus;
                result:= false;
              end;
            end;

            // 2) percentual limitado a 100%

            if edtPercAcao.Value > 100 then
            begin
              MsgDlg('O percentual não pode ultrapassar 100%!', Sistema.NomeModulo, mtWarning, [mbOk], 0);
              Repaint;
              edtPercAcao.SetFocus;
              result:= false;
            end;
         end;
    end;
  end;

begin
    ListaDetalhe.clear;
    
    if (cMasterButton = 'I') then
    begin
      bJaTemTipo := False;

      sSql := ' SELECT IDPESSOA, IDPROCJUD FROM PROCJUD WHERE IDPESSOA = '+IntToStr(GuardaIdPessoa)+
              ' AND SITPROCESSO <> 2 ';

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.Open;

      if not qryAux.IsEmpty then
        bJaTemTipo := True;

      sSql := ' SELECT IDPESSOA, IDCOMPIRRF FROM COMPENSAIRRF WHERE IDPESSOA = '+IntToStr(GuardaIdPessoa);
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.Open;

      if not qryAux.IsEmpty then
        bJaTemTipo := True;

      // Sol : 149068 Ktn : 1063344 - JRM6
      {
      if bJaTemTipo then
      begin
        MsgDlg('Já existe ação judicial cadastrada para essa pessoa.', 'Informação', mtInformation, [mbOk], 0);
        Exit;
      end;
      {}
      // Sol : 149068 Ktn : 1063344 - JRM6

     //Hugo Luna - Pendência 24446 - 2/10/2007 - Início
     //BRUNO AZEVEDO SOL 184597 KINTANA 1727689
     {sSQL := ' SELECT IDPESSOA, IDPROCJUD FROM PROCJUD WHERE NUMEROPROCESSO = ' + QuotedStr(edNumProc.Text);

     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(sSql);
     qryAux.Open;

     if not qryAux.IsEmpty then
     begin
       MsgDlg('Já existe o Nº de Processo "' + edNumProc.Text + '" cadastrado no sistema.' , 'Informação', mtInformation, [mbOk], 0);
       if edNumProc.CanFocus then
         edNumProc.SetFocus;

       Exit;
     end;
     //Hugo Luna - Pendência 24446 - 2/10/2007 - Fim  }
     //BRUNO AZEVEDO SOL 184597 KINTANA 1727689
    end;

    if (cbxFazdeposito.Checked) and (not(CadLote)) then //SIG74000 - TAES
    begin
      if ((Trim(dblkBanco.Text) = '') or (Trim(dblkAgencia.Text) = '') or
          (Trim(dblkConta.Text) = '') or (cmbOperacao.ItemIndex < 0)) then
      begin
        MsgDlg('Se usar a opção "efetua depósito", favor cadastrar os dados bancários.', 'Informação', mtInformation, [mbOk], 0);
        Exit;
      end;
    end;

    if not ValidaEntradas(1) then exit;

    //if cmbTipoOAcao.ItemIndex In [0, 1] then  // Andre Imakawa - SIG 99651
    if cmbTipoOAcao.ItemIndex In [0, 1, 2] then // Andre Imakawa - SIG 99651
    begin
      ///if (qryMestre.State in [dsInsert, dsEdit]) and (cmbTipoOAcao.ItemIndex <> 2) then
      //if ((sbtnInserir.down = True) OR (sbtnAlterar.down = True)) and (cmbTipoOAcao.ItemIndex <> 2) then // Andre Imakawa - SIG 99651
      if ((sbtnInserir.down = True) OR (sbtnAlterar.down = True)) and (cmbTipoOAcao.ItemIndex <> 3) then   // Andre Imakawa - SIG 99651
       begin
          if not ValidaEntradas(2) then exit;

          //SIG70004 - TAES - início
          if (CadLote) then
            begin
              ListCampos[1][1] := dbdtInicio.Text;
              ListCampos[1][2] := DBedtDataFinal.Text;
              ListCampos[1][3] := cmbUF.KeyValue;

              for i:= 0 to ListPessoas.Count-1 do
              begin
                cont := i;

                if not(qryMestre.State in [dsInsert, dsEdit]) then
                begin
                  if (sbtnInserir.down = True) then
                  begin
                    qryMestre.Insert;
                    qryMestre.FieldByName('DATAINICIO').AsString := ListCampos[1][1];
                    qryMestre.FieldByName('DATAFINAL').AsString := ListCampos[1][2];
                    qryMestre.FieldByName('UFSECAO').AsString := ListCampos[1][3];
                    dbdtInicio.Text := qryMestre.FieldByName('DATAINICIO').AsString;
                    DBedtDataFinal.Text := qryMestre.FieldByName('DATAFINAL').AsString;
                    cmbUF.KeyValue := qryMestre.FieldByName('UFSECAO').AsString;
                    GuardaIdProcJud:=LeUltRegistro(Nil,'PROCJUD');

                    if (i = 1) then
                    begin
                      PessoaDet := StrtoInt(BuscarItensPessoa(TId, ListPessoas[cont]));
                      ProcJudDet := GuardaIdProcJud;
                    end;
                  end
                  else if (sbtnAlterar.down = True) then
                    qryMestre.Edit;
                end;

                qryMestre.Post;
              end;
            end
          else
          if (AlteraLote) then
            begin
              if(MsgDlg('As alterações serão replicada para os demais participantes cadastrados pelo mesmo processo!'+#13#10+'Confirma? ','Atenção',mtConfirmation,[mbYes, mbNo],0)) = mrNo then
                begin
                  If dtmBaseDados.dbBaseDados.InTransaction then
                    dtmBaseDados.dbBaseDados.RollBack;
                    exit;
                end;
                
              ListCampos[1][1] := dbdtInicio.Text;
              ListCampos[1][2] := DBedtDataFinal.Text;
              ListCampos[1][3] := cmbUF.KeyValue;
              ListCampos[2][1] := qryDet.FieldByName('IDREGRA').AsString;
              ListCampos[2][2] := qryDet.FieldByName('IDRUBRICA').AsString;
              ListCampos[2][3] := qryDet.FieldByName('IDRUBRICAABONO').AsString;

              If Not dtmBaseDados.dbBaseDados.InTransaction then
                dtmBaseDados.dbBaseDados.StartTransaction;

              if (edtArquivo.Text <> EmptyStr) then
                begin
                  MontaArquivo;

                  for i:= 0 to ListPessoas.Count-1 do
                  begin
                    cont := i;

                    PessoaDet   := StrtoInt(BuscarItensPessoa(TId, ListPessoas[cont]));
                    PessoaConta := StrtoIntDef(BuscarItensPessoa(TConta, ListPessoas[cont]), 0);

                    if (qryMestre.Locate('IDPESSOA', PessoaDet,[])) then
                      begin
                        qryMestre.Filtered := False;
                        qryMestre.Filter := 'IDPESSOA = ' + InttoStr(PessoaDet);
                        qryMestre.Filtered := True;

                        while not(qryMestre.EOF) do
                          begin
                            if (PessoaConta <> 0) then
                            begin
                              qryMestre.Edit;
                              qryMestre.FieldByName('IDBANCO').AsInteger := StrtoInt(BuscarItensPessoa(TBanco, ListPessoas[cont]));
                              qryMestre.FieldByName('IDAGENCIABANCARIA').AsInteger := StrtoInt(BuscarItensPessoa(TAgencia, ListPessoas[cont]));
                              qryMestre.FieldByName('IDCBANCARIA').AsInteger := StrtoInt(BuscarItensPessoa(TConta, ListPessoas[cont]));
                              qryMestre.FieldByName('CODOPERACAO').AsInteger := DeParaOperacao(BuscarItensPessoa(TOperacao, ListPessoas[cont])); // Andre Imakawa - SIG 103667
                              qryMestre.Post;
                            end;
                              qryMestre.Next;
                          end;

                        qryMestre.Filtered := False;
                      end;
                  end;
                end;

             qryMestre.First;
             MontaMestre(2);

              while not(qryMestre.EOF) do
                begin
                  MontaMestre(1);

                  case opCadDet of
                    dsEdit:
                      begin
                          if not ExecutaComandosPendentes then
                             raise exception.create('INSERT: Ocorreu um erro ao executar SQL em lote.');
                      end;
                     dsInsert:
                       begin
                         while not(qryDet.IsEmpty) do
                           qryDet.Delete;

                         AtualizarDetalheLista;
                         qryDet.ApplyUpdates;
                       end;
                  else
                    begin
                      if(ExcluiLote) then
                        begin
                          if not ExecutaComandosPendentes then
                             raise exception.create('DELETE: Ocorreu um erro ao executar SQL em lote.');
                        end;
                    end;
                  end;

                  qryMestre.Next;

                  AtualizaGridDetalhe(qryMestre.FieldByName('IDPESSOA').AsInteger, qryMestre.FieldByName('IDPROCJUD').AsInteger);
                end;
                qry.cancel;
            end;
          //SIG70004 - TAES - fim

          // -------------------------------------------------------------------------------------------
          // Andre Imakawa - SIG 81835 - Inicio
          If Not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;
          // Andre Imakawa - SIG 81835 - Fim

          CmeCadastro.RepetirInsert := False;

          qryMestre.ApplyUpdates;

          //SIG70004 - TAES - início
          if (CadLote) then
            begin
              qryDet.First;
              
              while not(qryDet.EOF) do
                begin
                  qryDet.Edit;
                  qryDet.FieldByName('IDPESSOA').AsInteger  := PessoaDet;
                  qryDet.FieldByName('IDPROCJUD').AsInteger := ProcJudDet;
                  qryDet.Post;

                  qryDet.Next;
                end;

              qryDet.ApplyUpdates;

              sSql := ' INSERT INTO DETPROCJUD (IDPESSOA, IDPROCJUD, IDREGRA, IDRUBRICA, FLGATIVA, IDRUBRICAABONO) ' +
                      ' (SELECT PJ.IDPESSOA, PJ.IDPROCJUD, DT.IDREGRA, DT.IDRUBRICA, DT.FLGATIVA, DT.IDRUBRICAABONO ' +
                      ' FROM PROCJUD PJ, ' +
                      ' (SELECT D.* ' +
                      ' FROM DETPROCJUD D, PROCJUD P ' +
                      ' WHERE D.IDPROCJUD = P.IDPROCJUD ' +
                      ' AND P.NUMEROPROCESSO = ' + QuotedStr(edNumProc.Text) + ') DT ' +
                      ' WHERE PJ.NUMEROPROCESSO = ' + QuotedStr(edNumProc.Text) +
                      ' AND PJ.IDPESSOA <> ' + InttoStr(PessoaDet) + ')';

              ExecutarQuery(qryAux,sSQL);

              qry.cancel;
            end
          else
          begin
            if not(AlteraLote) then
               qryDet.ApplyUpdates;
          end;
       end;
       //SIG70004 - TAES - fim
    
      cmbTipoOAcao.Enabled := True;

      if bInlcuiDetalhe then
        if FcriticaRegra then
        begin
          MsgDlg('Ainda faltam regras a serem cadastradas para este tipo de Ação Judicial. Operação não será efetivada.', 'Informação', mtInformation, [mbOk], 0);
          // Andre Imakawa - SIG 81835 - Inicio
          If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
          // Andre Imakawa - SIG 81835 - Fim
          Exit;
        end;

      // Andre Imakawa - SIG 81835 - Inicio
      If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;
      // Andre Imakawa - SIG 81835 - Fim

    end;


   inherited;

   opCadDet:= dsBrowse; //SIG74000 - TAES
   ListaComandos.Clear;
   LimpaCampos;
   chkProcessoLote.Checked := False;
   qryDet.Close;
end;

procedure TFrmCadDepJudicial.qryMestreBeforePost(DataSet: TDataSet);
begin
  if(not(AlteraLote)) then
    begin
      inherited;
      qryMestre.FieldByName('IDPROCJUD').AsInteger     := GuardaIdProcJud;

      //SIG74000 - TAES - início
      if(CadLote) then
      begin
        qryMestre.FieldByName('IDPESSOA').AsInteger := StrtoInt(BuscarItensPessoa(TId, ListPessoas[cont]));
      end
      else
        qryMestre.FieldByName('IDPESSOA').AsInteger    := GuardaIdPessoa;
      //SIG74000 - TAES - fim

      qryMestre.FieldByName('NUMEROPROCESSO').AsString := edNumProc.Text;

      //SIG74000 - TAES - início
      if (CadLote) then
      begin
        if not(BuscarItensPessoa(TConta, ListPessoas[cont]) = EmptyStr) then
        begin
          qryMestre.FieldByName('IDBANCO').AsInteger := StrtoInt(BuscarItensPessoa(TBanco, ListPessoas[cont]));
          qryMestre.FieldByName('IDAGENCIABANCARIA').AsInteger := StrtoInt(BuscarItensPessoa(TAgencia, ListPessoas[cont]));
          qryMestre.FieldByName('IDCBANCARIA').AsInteger := StrtoInt(BuscarItensPessoa(TConta, ListPessoas[cont]));
          qryMestre.FieldByName('CODOPERACAO').AsInteger := DeParaOperacao(BuscarItensPessoa(TOperacao, ListPessoas[cont])); // Andre Imakawa - SIG 103667
        end
        else
        begin
          qryMestre.FieldByName('IDBANCO').Clear;
          qryMestre.FieldByName('IDAGENCIABANCARIA').Clear;
          qryMestre.FieldByName('IDCBANCARIA').Clear;
          qryMestre.FieldByName('CODOPERACAO').Clear;
        end;
      end
      //SIG74000 - TAES - fim
      else if cbxfazdeposito.Checked then //SIG74000 - TAES
      begin
        if trim(dblkBanco.LookUpValue) <> '' then
          qryMestre.FieldByName('IDBANCO').AsInteger:=StrToInt(dblkBanco.LookUpValue);
        if trim(dblkAgencia.LookUpValue) <> '' then
          qryMestre.FieldByName('IDAGENCIABANCARIA').AsInteger:=StrToInt(dblkAgencia.LookUpValue);
        if trim(dblkConta.LookUpValue) <> '' then
          qryMestre.FieldByName('IDCBANCARIA').AsInteger:=StrToInt(dblkConta.LookUpValue); // Alteraçao de LookUpValue para Text (marcia.refer 16.10.02)

        qryMestre.FieldByName('CODOPERACAO').AsString:=IntToStr(cmbOperacao.ItemIndex);
      end
      else
      begin
        qryMestre.FieldByName('IDBANCO').Clear;
        qryMestre.FieldByName('IDAGENCIABANCARIA').Clear;
        qryMestre.FieldByName('IDCBANCARIA').Clear;
        qryMestre.FieldByName('CODOPERACAO').Clear;
      end;

      qryMestre.FieldByName('CODVARA').AsString  := edCodVara.Text;
      qryMestre.FieldByName('NOMEVARA').AsString := edNomeVara.Text;

      if trim(edCodSecao.Text) = '' then
         edcodsecao.text := edCodVara.Text;

      qryMestre.FieldByName('CODSECAO').AsString   := edCodSecao.Text;
      qryMestre.FieldByName('NOMESECAO').AsString  := edNomesecao.Text;
      qryMestre.FieldByName('AUTORACAO').AsString  := edAutorAcao.Text;
      qryMestre.FieldByName('CLASSEACAO').AsString := edtClasse.Text;

      qryMestre.FieldByName('CODIRRFDARF').AsString := dblkDARF.LookUpValue ; // Andre Imakawa - SIG 101620

      //SIG74000 - TAES - início
      if (CadLote) then
      begin
        if not(BuscarItensPessoa(TConta, ListPessoas[cont]) = EmptyStr) then
        begin
          qryMestre.FieldByName('FLGFAZDEPOSITO').AsInteger := 1
        end
        else
          qryMestre.FieldByName('FLGFAZDEPOSITO').AsInteger := 0;
      end
      //SIG74000 - TAES - fim
      else if cbxFazdeposito.Checked then
         qryMestre.FieldByName('FLGFAZDEPOSITO').AsInteger := 1
      else
         qryMestre.FieldByName('FLGFAZDEPOSITO').AsInteger := 0;

      qryMestre.FieldByName('SITPROCESSO').AsInteger := cboStatusAcao.ItemIndex;
      qryMestre.FieldByName('TIPOACAO').AsInteger    := cmbTipoOAcao.ItemIndex;

      //if cmbTipoOacao.ItemIndex = 1 then                                 // Andre Imakawa - SIG 99651
      if (cmbTipoOacao.ItemIndex = 1) or (cmbTipoOacao.ItemIndex = 2) then // Andre Imakawa - SIG 99651
        qryMestre.FieldByName('PERCACAO').AsFloat := edtPercAcao.Value
      else
        qryMestre.FieldByName('PERCACAO').AsFloat := 100;
    end;

end;

procedure TFrmCadDepJudicial.bbtnOkDetClick(Sender: TObject);
begin
  if Trim(dblkRegra.Text) = '' then
  begin
    MsgDlg('O preenchimento da Regra é obrigatório.', 'Informação', mtInformation, [mbOk], 0);
    Exit;
  end;

  if Trim(dblkRubricas.Text) = '' then
  begin
    MsgDlg('O preenchimento da Rubrica Normal é obrigatório.', 'Informação', mtInformation, [mbOk], 0);
    Exit;
  end;

  if Trim(dblkRubAbono.Text) = '' then
  begin
    MsgDlg('O preenchimento da Rubrica de Abono é obrigatório.', 'Informação', mtInformation, [mbOk], 0);
    Exit;
  end;

  //SIG74000 - TAES - início
  if(CadLote) then
    begin
      ListCampos[2][4] := dblkRegra.Text;
      ListCampos[2][5] := dblkRubricas.Text;
      ListCampos[2][6] := dblkRubAbono.Text;

      qryDet.FieldByName('NOMEREGRA').AsString := ListCampos[2][4];
      qryDet.FieldByName('DESCRICAO').ASString := ListCampos[2][5];
      qryDet.FieldByName('DESCRICAO_1').ASString := ListCampos[2][6];

      CmeDetalhe.RepetirInsert := False;
      

      inherited;
    end
  else
  if (AlteraLote) then
    begin
      ListCampos[2][4] := dblkRegra.Text;
      ListCampos[2][5] := dblkRubricas.Text;
      ListCampos[2][6] := dblkRubAbono.Text;

      qryDet.FieldByName('NOMEREGRA').AsString := ListCampos[2][4];
      qryDet.FieldByName('DESCRICAO').ASString := ListCampos[2][5];
      qryDet.FieldByName('DESCRICAO_1').ASString := ListCampos[2][6];

      ListaComandos.Add('UPDATE DETPROCJUD '+
                        ' SET IDREGRA   = '+ qryDet.FieldByName('IDREGRA').AsString +
                        '    ,IDRUBRICA = '+ qryDet.FieldByName('IDRUBRICA').AsString +
                        '    ,IDRUBRICAABONO = '+ qryDet.FieldByName('IDRUBRICAABONO').AsString +
                        ' WHERE IDPESSOA = IDPESSOA_P '+
                        '  AND IDPROCJUD = IDPROCJUD_P'+
                        '  AND IDREGRA = ' + ListCampos[2][7] + ';');

      CmeDetalhe.RepetirInsert := False;
      inherited;
    end
  else
  //SIG74000 - TAES - fim
    begin
      CmeDetalhe.RepetirInsert := False;
      qryDet.ApplyUpdates;
      inherited;
      
      AtualizaGridDetalhe(GuardaIdPessoa, GuardaIdProcJud);
    end;

  bbtnVoltarDetClick(Self);
end;

Function  TFrmCadDepJudicial.FCriticaRegra : Boolean ;
begin
    if SistemaFolha.FlgControleTipoRegra = 0 then
       result := False
    else
    begin
        if (SistemaFolha.TiporegraPadrao = qryRegra.fieldbyname('IDTIPOREGRA').asInteger) then
           result := False
        else
        begin
             qryAux2.Close;
             qryAux2.ParamByName('TIPO').asInteger := qryRegra.fieldbyname('IDTIPOREGRA').asInteger;
             qryAux2.open;
             if qryAux2.FieldByName('QTDREGRA').asInteger = (qrydet.recordcount) then
                result := False
             else
                result := True;
        end;
    end;
end;

procedure TFrmCadDepJudicial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qry.Close;
  qryAux.Close;
  qryAgencia.Close;
  qryBanco.Close;
  qryConta.Close;
  qryDet.Close;
  qryEstado.Close;
  QryCidade.Close;   //Ewerton Beltramini - 29/12/2021 - SIG120780
  qryMestre.Close;
  qryRegra.Close;
  qryIRRFDARF.Close; // Andre Imakawa - SIG 101620
  // Andre Imakawa - SIG 81835 - Inicio
  If dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Rollback;
  // Andre Imakawa - SIG 81835 - Fim

  FreeAndNil(ListaDetalhe);
  FreeAndNil(ListPessoas);
  FreeAndNil(ListaComandos);
end;

procedure TFrmCadDepJudicial.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  qryBanco.Open;
  qryEstado.Open;
  CarregaCidade(qryEstado.FieldByName('CODESTADO').AsString);  //Ewerton Beltramini - 29/12/2021 - SIG120780
  qryIRRFDARF.Open; // Andre Imakawa - SIG 101620
end;

procedure TFrmCadDepJudicial.sbtnAlterarClick(Sender: TObject);
begin
  //SIG74000 - TAES - início
  if(chkProcessoLote.Checked) then
  begin
    AlteraLote := False;

    if((edtNumProc.Text = EmptyStr)) then
    begin
      MsgDlg('Necessário informar o número de processo!','Informação',mtInformation,[mbOk],0);
      sbtnAlterar.down := False;
      exit;
    end
    else if(not(ExisteProcesso(edtNumProc.Text))) then
    begin
      MsgDlg('O número de processo informado não existe!','Informação',mtInformation,[mbOk],0);
      sbtnAlterar.down := False;
      exit;
    end;

    AlteraLote := True;
    ExcluiLote := True;
    CadLote    := False;
  end;

  if (AlteraLote) then
    begin
      FazQuery(qryMestre, 'SELECT * FROM PROCJUD WHERE NUMEROPROCESSO = ' + QuotedStr(edtNumProc.Text));

      AtualizaGridDetalhe(qryMestre.FieldByName('IDPESSOA').AsInteger, qryMestre.FieldByName('IDPROCJUD').AsInteger);

      MontaTela;
      HabilitaCampos(True);

      opCadDet := dsBrowse;

      ListPessoas.clear;
      ListaComandos.clear;

      qry.Close;
      qry.ParamByName('IDPESSOA').AsInteger := -1;
      qry.Open;

      gbxbanco.Visible := False;
      inherited;
    end
  else
  //SIG74000 - TAES - fim
    begin
      inherited;
      qryEstado.Open;
      CarregaCidade(qryEstado.FieldByName('CODESTADO').AsString);  //Ewerton Beltramini - 29/12/2021 - SIG120780

      AtualizaGridDetalhe(GuardaIdPessoa, GuardaIdProcJud);
    end;

    qryMestre.Edit;
    pnlRestoMestre.BringToFront;
    pnlRestoMestre.Enabled := True;
    dbgrdDet.Enabled       := True;
    edAutorAcao.Enabled    := True;
    dblkConta.Enabled      := False;
    cmbTipoOAcaoChange(Self);
    cmbTipoOAcao.Enabled   := False;
    cMasterButton          := 'A';
end;

procedure TFrmCadDepJudicial.CmeCadastroDelete(Sender: TObject);
var
  sSql : String;
begin
  sSql := 'DELETE PROCJUD '+
          'WHERE IDPESSOA = '  + IntToStr(GuardaIdPessoa) +
          // Sol : 149068 Ktn : 1063344 - JRM6
          '  AND IDPROCJUD = ' + IntToStr(GuardaIdProcJud);
          // Sol : 149068 Ktn : 1063344 - JRM6

  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);

  qryAuxDet.SQL.Clear;
  qryAuxDet.SQL.Add(' DELETE DETPROCJUD WHERE IDPROCJUD = '+IntToStr(GuardaIdProcJud));
  Try
    qryAuxDet.ExecSQL;
    qryAux.ExecSQL;
  Except
    MsgDlg('Ocorreu um Erro Durante a Exclusão!!!',
            'Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;

  qryDet.Close;

  edNumProc.Clear;
  edAutorAcao.Clear;
  edtClasse.Clear;
  edCodVara.Clear;
  edNomeVara.Clear;
  edCodSecao.Clear;
  edNomeSecao.Clear;
  cmbTipoOAcao.ItemIndex:=-1;
  edtPercAcao.Text:='';
  cboStatusAcao.Text := '';
  dblkBanco.Text     := '';
  dblkAgencia.Text   := '';
  dblkConta.Text     := '';
  cmbOperacao.Text   := '';
  qryEstado.Close;
  QryCidade.Close;     //Ewerton Beltramini - 29/12/2021 - SIG120780
  dbdtInicio.Clear;
  DBedtDataFinal.Clear;
  dblkDARF.Text     := ''; // Andre Imakawa - SIG 101620
end;



procedure TFrmCadDepJudicial.dblkRegraCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  MontaQueries;
end;

procedure TFrmCadDepJudicial.cmbTipoOAcaoChange(Sender: TObject);
begin
  inherited;
  qryRegra.Close;
  if SistemaFolha.FlgUsaRegraxRub = 1 then
     qryRegra.ParamByName('PTIPOACAO').AsInteger := cmbTipoOAcao.ItemIndex;
  qryRegra.Open;
  pnlRestoMestre.Enabled:=False;
  dbgrdDet.Enabled:=False;
  tbcDetalhe.Visible:=True;
  Case cmbTipoOAcao.ItemIndex Of
     0: begin
           pnlRestoMestre.BringToFront;
           pnlRestoMestre.Enabled := True;
           dbgrdDet.Enabled       := True;
           lblAutorAcao.Visible   := True;
           edAutorAcao.Visible    := True;
           cbxFazdeposito.Visible := True;
           tbcDetalhe.Visible     := True;
           pgctrlDetalhe.Visible  := True;
           gbxPercentual.Visible  := False;
         end;
     1 : begin
           pnlRestoMestre.BringToFront;
           pnlRestoMestre.Enabled := True;
           dbgrdDet.Enabled       := True;
           lblAutorAcao.Visible   := True;
           edAutorAcao.Visible    := True;
           cbxFazdeposito.Visible := True;
           tbcDetalhe.Visible     := True;
           pgctrlDetalhe.Visible  := True;
           gbxPercentual.Visible  := True;
         end;
      // Andre Imakawa - SIG 99651 - Inicio
      2 : begin
           pnlRestoMestre.BringToFront;
           pnlRestoMestre.Enabled := True;
           dbgrdDet.Enabled       := True;
           lblAutorAcao.Visible   := True;
           edAutorAcao.Visible    := True;
           cbxFazdeposito.Visible := True;
           tbcDetalhe.Visible     := True;
           pgctrlDetalhe.Visible  := True;
           gbxPercentual.Visible  := True;
         end;
      // Andre Imakawa - SIG 99651 - Fim
  end; {Case}
end;

procedure TFrmCadDepJudicial.qryMestreAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cmbOperacao.ItemIndex := StrToIntDef(qryMestre.FieldByName('CODOPERACAO').AsString,-1);
  cmbTipoOAcao.ItemIndex:=StrToIntDef(qryMestre.FieldByName('TIPOACAO').AsString,-1);
  edCodVara.Text   := qryMestre.FieldByName('CODVARA').AsString;
  edNomeVara.Text  := qryMestre.FieldByName('NOMEVARA').AsString;
  edCodSecao.Text  := qryMestre.FieldByName('CODSECAO').AsString;
  edNomesecao.Text := qryMestre.FieldByName('NOMESECAO').AsString;
  edAutorAcao.Text := qryMestre.FieldByName('AUTORACAO').AsString;

  edtClasse.Text   := qryMestre.FieldByName('CLASSEACAO').AsString;

  cboStatusAcao.ItemIndex := qryMestre.FieldByName('SITPROCESSO').AsInteger;
  //if cmbTipoOacao.ItemIndex  = 1 then                                     // Andre Imakawa - SIG 99651
  if (cmbTipoOacao.ItemIndex  = 1) or (cmbTipoOacao.ItemIndex  = 2) then    // Andre Imakawa - SIG 99651
  begin
        gbxPercentual.Visible := True;
        edtPercAcao.Text:= FormatFloat('#,##0.00',qryMestre.FieldByName('PERCACAO').AsFloat);
  end else
  begin
        gbxPercentual.Visible := False;
        edtPercAcao.Text:= '';
  end;
end;

procedure TFrmCadDepJudicial.sbtnApagarClick(Sender: TObject);
var qryUpd: twwQuery;
begin
  if(chkProcessoLote.Checked) then
  begin
    ExcluiLote := False;

    if((edtNumProc.Text = EmptyStr)) then
    begin
      MsgDlg('Necessário informar o número de processo!','Informação',mtInformation,[mbOk],0);
      sbtnApagar.down := False;
      exit;
    end
    else if(not(ExisteProcesso(edtNumProc.Text))) then
    begin
      MsgDlg('O número de processo informado não existe!','Informação',mtInformation,[mbOk],0);
      sbtnApagar.down := False;
      exit;
    end;

    ExcluiLote := True;
  end;

  if(ExcluiLote) then
    begin
      if(MsgDlg('A exclusão será replicada para todos os demais participantes cadastrados pelo mesmo processo!'+#13#10+'Confirma?','Atenção',mtConfirmation,[mbYes, mbNo],0)) = mrYes then
      begin
        try
          If not(dtmBaseDados.dbBaseDados.InTransaction) then
            dtmBaseDados.dbBaseDados.StartTransaction;

            ExecutarQuery(qryAux, 'DELETE FROM DETPROCJUD WHERE IDPROCJUD IN (SELECT IDPROCJUD FROM PROCJUD WHERE NUMEROPROCESSO = ' + QuotedStr(edtNumProc.Text) + ')');
            ExecutarQuery(qryAux, 'DELETE FROM PROCJUD WHERE NUMEROPROCESSO = ' + QuotedStr(edtNumProc.Text));

            dtmBaseDados.dbBaseDados.Commit;

            sbtnApagar.Down := False;
            sbtnApagar.Enabled := False;
            sbtnAlterar.Enabled := sbtnApagar.Enabled;
            LimpaCampos;

            MsgDlg('Exclusão efetuada com sucesso!','Informação',mtInformation,[mbOk],0);
            CmeDetalheAtualizaBotoes(self);
            edtNumProc.Text := '';
            edtArquivo.Text := '';
            chkProcessoLote.Checked := False;
        except
          dtmBaseDados.dbBaseDados.RollBack;
        end;
      end;
    end
  else
  //if (cmbTipoOAcao.ItemIndex <> 2) then  // Andre Imakawa - SIG 99651
  if (cmbTipoOAcao.ItemIndex <> 3) then    // Andre Imakawa - SIG 99651
    inherited;

  pnlRestoMestre.Enabled := False;
  //tbcDetalhe.Visible     := False;
  pnlRestoMestre.BringToFront;
end;

procedure TFrmCadDepJudicial.cbxFazdepositoClick(Sender: TObject);
begin
  inherited;
  if (cbxfazdeposito.Checked) and (not(CadLote)) and (not(AlteraLote)) then
  begin
    gbxbanco.Visible := True;
    MostraDadosBancarios; 
  end
  else
    gbxbanco.Visible := False;
end;

procedure TFrmCadDepJudicial.sbtnInsDetClick(Sender: TObject);
begin
  opCadDet:= dsInsert;

  inherited;

  bInlcuiDetalhe := True;
  DBCheckBox1.Checked := True;
end;

procedure TFrmCadDepJudicial.sbtnAltDetClick(Sender: TObject);
begin
  opCadDet:= dsEdit; //SIG74000 - TAES

  ListCampos[2][7] := qryDet.FieldByName('IDREGRA').AsString;

  inherited;
  MontaQueries;
end;

procedure TFrmCadDepJudicial.LimpaCampos;
begin
  edNumProc.Clear;
  edAutorAcao.Clear;
  edtClasse.Clear;  
  edCodVara.Clear;
  edNomeVara.Clear;
  edCodSecao.Clear;
  edNomeSecao.Clear;
  dbdtInicio.Clear;
  DBedtDataFinal.Clear;

  cboStatusAcao.ItemIndex := -1;
  cboStatusAcao.Text := '';
  dblkBanco.Text     := '';
  dblkAgencia.Text   := '';
  dblkConta.Text     := '';
  cmbOperacao.Text   := '';
  dblkDARF.Text      := ''; // Andre Imakawa - SIG 101620 

  cbxFazdeposito.Checked := False;
  gbxbanco.Visible       := False;
  edtPercAcao.value      := 0;
  cmbTipoOAcao.ItemIndex := -1;
  cmbTipoOAcao.Text := '';
  cmbUF.KeyValue := '';
  cmbCidade.KeyValue := '';
end;

procedure TFrmCadDepJudicial.MontaQueries;
var
  sSql : String;

begin
  if SistemaFolha.FlgUsaCodRubExt = 0 then
  begin
    sSql := ' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, ' +
            ' P.IDPROVENTO||'+ CHR(39)+ ' - '+ CHR(39)+ '||P.DESCRICAO AS DESCRICAO '+
            ' FROM PROVDESC P ';

    if SistemaFolha.FlgUsaRegraxRub = 1 then
      sSql := sSql + ' , REGRAXRUBRICA RR ';

    sSql := sSql + ' WHERE P.FLGTPRUBRICA LIKE '+ CHR(39)+CHR(37) +'B'+ CHR(37)+CHR(39);

    if SistemaFolha.FlgEstadoRub = 1 then
      sSql := sSql + ' AND NVL(P.FLGESTADORUB,0) <> 2 ';

    if SistemaFolha.FlgUsaRegraxRub = 1 then
      sSql := sSql + ' AND P.IDPROVENTO = RR.IDRUBRICA ';

    if SistemaFolha.FlgUsaRegraxRub = 1 then
    begin
      if Trim(dblkRegra.Text) <> '' then
        sSql := sSql + ' AND RR.IDREGRA = '+dblkRegra.LookupValue
      else
        sSql := sSql + ' AND RR.IDREGRA = 0 ';
    end;

    sSql := sSql + ' ORDER BY P.IDPROVENTO ';
    qryRubricas.Sql.Clear;
    qryRubricas.Sql.Add(sSql);
    qryRubricas.Open;
    qryRubricaAbono.Sql.Clear;
    qryRubricaAbono.Sql.Add(sSql);
    qryRubricaAbono.Open;
    dblkRubricas.Enabled := True;
    lbRubricas.Enabled   := True;
    dblkRubAbono.Enabled := True;
    lblRubAbono.Enabled  := True;

    if SistemaFolha.FlgUsaRegraxRub = 1 then
    begin
      if qryRubricas.RecordCount = 1 then
      begin
        dblkRubricas.Text := qryRubricas.FieldByName('DESCRICAO').AsString;
        qryDet.FieldByName('IDRUBRICA').AsInteger := qryRubricas.FieldByName('IDPROVENTO').AsInteger;
      end;
      if qryRubricaAbono.RecordCount = 1 then
      begin
        dblkRubAbono.Text := qryRubricaAbono.FieldByName('DESCRICAO').AsString;
        qryDet.FieldByName('IDRUBRICAABONO').AsInteger := qryRubricaAbono.FieldByName('IDPROVENTO').AsInteger;
      end;
    end;
  end
  else
  begin
    sSql := ' SELECT P.IDPROVENTO, P.FLGOBRIGAFAVOREC, ' +
            ' P.CODPROVDESC||'+ CHR(39)+' - '+CHR(39)+'||P.DESCRPROVDESC AS DESCRICAO '+
            ' FROM PROVDESC P';

    if SistemaFolha.FlgUsaRegraxRub = 1 then
      sSql := sSql + ' , REGRAXRUBRICA RR ';

    sSql := sSql + ' WHERE P.FLGTPRUBRICA LIKE '+ CHR(39)+ CHR(37) +'B'+ CHR(37)+ CHR(39);

    if SistemaFolha.FlgEstadoRub = 1 then
      sSql := sSql + ' AND NVL(P.FLGESTADORUB,0) <> 2 ';

    if SistemaFolha.FlgUsaRegraxRub = 1 then
      sSql := sSql + ' AND P.IDPROVENTO = RR.IDRUBRICA ';

    if SistemaFolha.FlgUsaRegraxRub = 1 then
    begin
      if Trim(dblkRegra.Text) <> '' then
        sSql := sSql + ' AND RR.IDREGRA = '+dblkRegra.LookupValue
      else
        sSql := sSql + ' AND RR.IDREGRA = 0 ';
    end;

    sSql := sSql + ' ORDER BY P.CODPROVDESC ';

    qryRubricas.Sql.Clear;
    qryRubricas.Sql.Add(sSql);
    qryRubricas.Open;
    qryRubricaAbono.Sql.Clear;
    qryRubricaAbono.Sql.Add(sSql);
    qryRubricaAbono.Open;

    dblkRubricas.Enabled := True;
    lbRubricas.Enabled   := True;
    dblkRubAbono.Enabled := True;
    lblRubAbono.Enabled  := True;

    if SistemaFolha.FlgUsaRegraxRub = 1 then
    begin
      if qryRubricas.RecordCount = 1 then
      begin
        dblkRubricas.Text := qryRubricas.FieldByName('DESCRICAO').AsString;
        qryDet.FieldByName('IDRUBRICA').AsInteger := qryRubricas.FieldByName('IDPROVENTO').AsInteger;
      end;
      if qryRubricaAbono.RecordCount = 1 then
      begin
        dblkRubAbono.Text := qryRubricaAbono.FieldByName('DESCRICAO').AsString;
        qryDet.FieldByName('IDRUBRICAABONO').AsInteger := qryRubricaAbono.FieldByName('IDPROVENTO').AsInteger;
      end;
    end;
  end;
end;

procedure TFrmCadDepJudicial.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('IDPESSOA').AsInteger  := GuardaIdPessoa;
  qryDet.FieldByName('IDPROCJUD').AsInteger := GuardaIdProcJud;
  qryDet.fieldbyname('FLGATIVA').asInteger  := 0;
end;

procedure TFrmCadDepJudicial.BuscaAgencia;
begin
  qryAgencia.Close;
  qryAgencia.ParamByName('IDBANCO').AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
  qryAgencia.Open;
end;

procedure TFrmCadDepJudicial.BuscaConta;
begin
  qryConta.Close;
  qryConta.ParamByName('IDAGENCIA').AsInteger := qryAgencia.FieldByName('IDPESSOA').AsInteger;
  qryConta.Open;
  dblkConta.Enabled := not(qryConta.IsEmpty);
end;

procedure TFrmCadDepJudicial.dblkBancoExit(Sender: TObject);
begin
  inherited;
  BuscaAgencia; 
end;

procedure TFrmCadDepJudicial.dblkAgenciaExit(Sender: TObject);
begin
  inherited;
  BuscaConta; 
end;

procedure TFrmCadDepJudicial.MostraDadosBancarios;
begin
  //Busca Banco
  qryBanco.Open;
  qryBanco.Locate('IDPESSOA', qryMestre.FieldByName('IDBANCO').AsInteger, []);
  dblkBanco.LookUpValue := qryBanco.FieldByName('IDPESSOA').AsString;

  //Busca Agência
  qryAgencia.Close;
  qryAgencia.ParamByName('IDBANCO').AsInteger := qryMestre.FieldByName('IDBANCO').AsInteger;
  qryAgencia.Open;
  qryAgencia.Locate('IDPESSOA', qryMestre.FieldByName('IDAGENCIABANCARIA').AsInteger, []);
  dblkAgencia.LookUpValue := qryAgencia.FieldByName('IDPESSOA').AsString;

  //Busca Conta Corrente
  qryConta.Close;
  qryConta.ParamByName('IDAGENCIA').AsInteger := qryMestre.FieldByName('IDAGENCIABANCARIA').AsInteger;
  qryConta.Open;
  qryConta.Locate('IDCBANCARIA', qryMestre.FieldByName('IDCBANCARIA').AsInteger, []);
  dblkConta.LookUpValue := qryConta.FieldByName('IDCBANCARIA').AsString;

  if qryMestre.FieldByName('IDBANCO').IsNull then           dblkBanco.Clear;
  if qryMestre.FieldByName('IDAGENCIABANCARIA').IsNull then dblkAgencia.Clear;
  if qryMestre.FieldByName('IDCBANCARIA').IsNull then       dblkConta.Clear;
end;

procedure TFrmCadDepJudicial.edtPercAcaoExit(Sender: TObject);
begin
  inherited;
  if edtPercAcao.Value > 100 then edtPercAcao.Value := 100;
end;

procedure TFrmCadDepJudicial.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  // Andre Imakawa - SIG 81835 - Inicio
  If dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Rollback;
  // Andre Imakawa - SIG 81835 - Fim

  opCadDet:= dsBrowse;
  ListaComandos.clear;
  chkProcessoLote.Checked := False;
  LimpaCampos; ///TAES - SIG70004
  qryDet.close;
end;

//SIG70004 - TAES - início
procedure TFrmCadDepJudicial.bbtnBuscaArquivoClick(Sender: TObject);
begin
  inherited;

  if dialog.Execute then
    begin
      edtArquivo.Text := ExtractFileName(dialog.FileName);
      NomeArquivo := ExtractFileName(dialog.FileName);
    end;
end;

function TFrmCadDepJudicial.UltimaLinha(Excel : OleVariant; var linha: Integer) : Boolean;
var
  cont : integer;
begin
  result := False;
  if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value)) = '') and
    (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value)) = '') and
    (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)) = '') then
  result := True;

  if result then
  for cont := 0 to 2 do
  begin
    inc(linha);
    if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value)) = '') and
      (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value)) = '') and
      (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value)) = '') then
     result := True
    else
    begin
      result := false;
      break;
    end;
  end;

end;

function TFrmCadDepJudicial.SelecionaConta(Pessoa, Agencia, Operacao,
  Banco, NumConta : String; qryAuxConta : TwwQuery): String;
begin
  qryAuxConta.Close;
  qryAuxConta.SQL.Clear;
  qryAuxConta.SQL.Add('SELECT IDCBANCARIA FROM CONTABANCARIA CB');
  qryAuxConta.SQL.Add('JOIN AGENCIABANCARIA AG ON AG.IDPESSOA  = CB.IDAGENCIA');
  qryAuxConta.SQL.Add('JOIN BANCO BC           ON BC.IDPESSOA  = AG.IDBANCO');
  qryAuxConta.SQL.Add('WHERE BC.IDPESSOA = ' + QuotedStr(Banco));
  qryAuxConta.SQL.Add('AND AG.IDPESSOA =  ' + QuotedStr(Agencia));
  qryAuxConta.SQL.Add('AND CB.IDPESSOA =  ' + QuotedStr(Pessoa));
  qryAuxConta.SQL.Add('AND SUBSTR(CB.CONTACORRENTE,0,3) = ' + QuotedStr(Operacao));     // Andre Imakawa - SIG 103667
  //qryAuxConta.SQL.Add('AND SUBSTR(CB.CONTACORRENTE,3,10) =  ' + QuotedStr(NumConta)); // Andre Imakawa - SIG 103667
  qryAuxConta.SQL.Add('AND SUBSTR(CB.CONTACORRENTE, LENGTH(CB.CONTACORRENTE) - ' + IntToStr(length(trim(NumConta))-1) +', '+ IntToStr(length(trim(NumConta)))+') =  ' + QuotedStr(NumConta)); // Andre Imakawa - SIG 103667
  qryAuxConta.Open;

  if not(qryAuxConta.IsEmpty) then
    result := qryAuxConta.FieldByName('IDCBANCARIA').AsString
  else
    result := EmptyStr;
end;

{ TPessoa }

procedure TPessoa.LimparPessoa;
begin
  id      := 0;
  conta   := EmptyStr;
  agencia := EmptyStr;
  operacao:= EmptyStr;
  banco   := EmptyStr;
end;

procedure TFrmCadDepJudicial.HabilitaCampos(Habilita : Boolean);
begin
  pnlFundo.Enabled := Habilita;
  pnlMestre.Enabled := Habilita;
  Panel5.Enabled := Habilita;
  Panel4.Enabled := Habilita;
  Panel1.Enabled := Habilita;
  Panel2.Enabled := Habilita;
  PnlAcaoJudicial. Enabled := Habilita;
  gbDatas.Enabled := Habilita;
  gbxPercentual.Enabled := Habilita;
  gbInfVara.Enabled := Habilita;
  gbInfSecao.Enabled := Habilita;
  bbtnConfirmar.Enabled := Habilita;
  bbtnCancelar.Enabled := Habilita;
  bbtnSair.Enabled := Habilita;
  bbtnAjuda.Enabled := Habilita;
  cmbTipoOAcao.Enabled := Habilita;
  edtClasse.Enabled := Habilita;
  edAutorAcao.Enabled := Habilita;
  cbxFazdeposito.Enabled := Habilita;
  edtPercAcao.Enabled := Habilita;
  cboStatusAcao.Enabled := Habilita;
  dbdtInicio.Enabled := Habilita;
  DBedtDataFinal.Enabled := Habilita;
  edCodVara.Enabled := Habilita;
  edNomeVara.Enabled := Habilita;
  edCodSecao.Enabled := Habilita;
  cmbUF.Enabled := Habilita;
  cmbCidade.Enabled := Habilita;
  edNomeSecao.Enabled := Habilita;
  edNumProc.Enabled := not(Habilita);
  dblkBanco.Enabled := not(Habilita);
  dblkAgencia.Enabled := not(Habilita);
  dblkConta.Enabled := not(Habilita);
  cmbOperacao.Enabled := not(Habilita);

  //cbxFazdeposito.Enabled := not(Habilita);  // Andre Imakawa - SIG 103667
end;

function TFrmCadDepJudicial.BuscarItensPessoa(IdItem: TTipopessoa ; strLinha : String): String;
var
  Parte : TStringList;
  Index : Integer;
begin
  try
    Parte := TStringList.Create;

    case IdItem of
     TId       : Index := 0;
     TConta    : Index := 1;
     TAgencia  : Index := 2;
     TOperacao : Index := 3;
     TBanco    : Index := 4;
    end;

    ExtractStrings(['|'],[], PChar(strLinha), Parte);
    try
      result := (Parte[Index]);
    except
      result := EmptyStr;
    end;
  finally
    FreeAndNil(Parte);
  end;
end;

function TFrmCadDepJudicial.ExisteProcesso(NumProc: String): Boolean;
begin

  if (NumProc <> EmptyStr)then
    begin
      FazQuery(qryAux, 'SELECT IDPROCJUD FROM PROCJUD WHERE NUMEROPROCESSO = ' + QuotedStr(NumProc));
      result := not (qryAux.IsEmpty)
    end
  else
      result := false;
end;

procedure TFrmCadDepJudicial.MontaArquivo;
var
  Matricula, CPF, Operacao, NumConta, Agencia, IdcConta, Banco: String;
  Excel       : OleVariant;
  linha, i    : Integer;
  Pessoa      : Tpessoa;

  procedure PreencheConta();
    begin
      qryAuxConta.Close;
      qryAuxConta.SQL.Clear;
      //qryAuxConta.SQL.Add('SELECT IDPESSOA FROM AGENCIABANCARIA WHERE NUMAGENCIA = ' + QuotedStr(Agencia));
      qryAuxConta.SQL.Add('SELECT DISTINCT A.IDPESSOA FROM AGENCIABANCARIA A ');
      qryAuxConta.SQL.Add('JOIN CONTABANCARIA C ON A.IDPESSOA = C.IDAGENCIA ');
      qryAuxConta.SQL.Add('WHERE A.NUMAGENCIA = ' + QuotedStr(Agencia) + ' AND C.IDPESSOA = ' + QuotedStr(InttoStr(Pessoa.id)));
      qryAuxConta.Open;

      Agencia := qryAuxConta.FieldByName('IDPESSOA').AsString;

      qryAuxConta.Close;
      qryAuxConta.SQL.Clear;
      qryAuxConta.SQL.Add('SELECT IDBANCO FROM AGENCIABANCARIA WHERE IDPESSOA = ' + QuotedStr(Agencia));
      qryAuxConta.Open;

      Banco := qryAuxConta.FieldByName('IDBANCO').AsString;

      IdcConta := SelecionaConta(InttoStr(Pessoa.id), Agencia, Operacao, Banco, NumConta, qryAuxConta);

      if not(IdcConta = EmptyStr) then
        begin
          Pessoa.Conta    := IdcConta;
          Pessoa.Agencia  := Agencia;
          Pessoa.Operacao := Operacao;
          Pessoa.Banco    := Banco;
        end
      else
        begin
          mmResultado.Add('LINHA ' + IntToStr(linha) + ': Não foi localizada conta corrente.');
        end;

      qryAuxConta.Close;
      qryAuxConta.SQL.Clear;
      qryAuxConta.SQL.Add('SELECT NUMEROPROCESSO FROM PROCJUD WHERE IDPESSOA = ' + InttoStr(Pessoa.id) + ' AND SITPROCESSO <> 2'); // Andre Imakawa - SIG 103667
      qryAuxConta.Open;

      if (CadLote) then
        begin
          if (qryAuxConta.IsEmpty) then
            begin
              ListPessoas.Add(InttoStr(Pessoa.Id) + '|' + Pessoa.Conta + '|' + Pessoa.Agencia + '|' + Pessoa.Operacao + '|' + Pessoa.Banco + '|');
            end
          else
            // Andre Imakawa - SIG 103667 - Inicio
            if (cMasterButton = 'I') then
            begin
              if qryAuxConta.FieldByName('NUMEROPROCESSO').AsString <> edtNumProc.Text then
                ListPessoas.Add(InttoStr(Pessoa.Id) + '|' + Pessoa.Conta + '|' + Pessoa.Agencia + '|' + Pessoa.Operacao + '|' + Pessoa.Banco + '|')
              else
                mmResultado.Add('LINHA ' + IntToStr(linha) + ': Assistido com ação judicial já cadastrada.');
            end
            else
            begin
              ListPessoas.Add(InttoStr(Pessoa.Id) + '|' + Pessoa.Conta + '|' + Pessoa.Agencia + '|' + Pessoa.Operacao + '|' + Pessoa.Banco + '|')
            end;
            // Andre Imakawa - SIG 103667 - Fim
        end
      else
        begin
          ListPessoas.Add(InttoStr(Pessoa.Id) + '|' + Pessoa.Conta + '|' + Pessoa.Agencia + '|' + Pessoa.Operacao + '|' + Pessoa.Banco + '|');
        end;
    end;
begin
  try
    Excel := CreateOleObject('Excel.application');
    Excel.Visible := False;
    Excel.WorkBooks.Open(dialog.FileName);
    linha := 2;
    mmResultado := TStringList.Create;
    Pessoa      := Tpessoa.create;
    mmResultado.Clear;
    mmResultado.Add('Resultado de Validação do Arquivo ' + ExtractFileName(dialog.FileName));

    if UltimaLinha(Excel, linha) then
      begin
        MsgDlg('O arquivo selecionado não possui informações.','Atenção', mtInformation, [mbOk], 0);
        Exit;
      end
    else
    begin
      while not UltimaLinha(Excel, linha) do
        begin
          Matricula := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value));
          CPF := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value));
          Agencia := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value));
          Operacao := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value));
          if(Operacao <> EmptyStr) then
            Operacao := FormatFloat('00', StrtoFloat(Operacao));
          NumConta := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 5].Value));
          //if(NumConta <> EmptyStr) then
          //  NumConta := FormatFloat('0000000000', StrtoFloat(NumConta));
          IdcConta := EmptyStr;

          Pessoa.LimparPessoa;

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add('SELECT DISTINCT VW.IDPESSOA AS IDPESSOA'); // Andre Imakawa - SIG 103667
          qryAux.SQL.Add('FROM VWPARTICIPDEPEN VW');
          qryAux.SQL.Add('WHERE (VW.MATRICULA = ' + QuotedStr(Matricula) + ')');
          qryAux.SQL.Add('AND VW.IDPESSOA = VW.IDTITULAR');
          qryAux.SQL.Add('ORDER BY IDPESSOA ASC');
          qryAux.Open;

          if (qryAux.IsEmpty) then
            begin
              if not(Matricula = EmptyStr) then
                begin
                  mmResultado.Add('LINHA ' + IntToStr(linha) + ': Matricula ' + Matricula + ' inexistente.');
                end;

              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add('SELECT DISTINCT VW.IDPESSOA AS IDPESSOA'); // Andre Imakawa - SIG 103667
              qryAux.SQL.Add('FROM VWPARTICIPDEPEN VW');
              qryAux.SQL.Add('WHERE (VW.NUMDOCUMENTO = ' + QuotedStr(CPF) + ')');
              qryAux.SQL.Add('ORDER BY IDPESSOA ASC');
              qryAux.Open;

              if (qryAux.IsEmpty) then
                begin
                  if not(CPF = EmptyStr) then
                    begin
                      mmResultado.Add('LINHA ' + IntToStr(linha) + ': CPF ' + CPF + ' inexistente.');
                    end;
                end
              else
                begin
                  while not(qryAux.EOF) do
                    begin
                      Pessoa.Id := qryAux.FieldByName('IDPESSOA').AsInteger;

                      if(IdcConta = EmptyStr) then
                        begin
                          PreencheConta;
                        end
                      else
                        begin
                          Pessoa.Conta    := IdcConta;
                          Pessoa.Agencia  := Agencia;
                          Pessoa.Operacao := Operacao;
                          Pessoa.Banco    := Banco;

                          qryAuxConta.Close;
                          qryAuxConta.SQL.Clear;
                          qryAuxConta.SQL.Add('SELECT NUMEROPROCESSO FROM PROCJUD WHERE IDPESSOA = ' + InttoStr(Pessoa.id) + ' AND SITPROCESSO <> 2'); // Andre Imakawa - SIG 103667
                          qryAuxConta.Open;

                          if (CadLote) then
                            begin
                              if (qryAuxConta.IsEmpty) then
                                begin
                                  ListPessoas.Add(InttoStr(Pessoa.Id) + '|' + Pessoa.Conta + '|' + Pessoa.Agencia + '|' + Pessoa.Operacao + '|' + Pessoa.Banco + '|');
                                end
                              else
                                // Andre Imakawa - SIG 103667 - Inicio
                                if (cMasterButton = 'I') then
                                begin
                                  if qryAuxConta.FieldByName('NUMEROPROCESSO').AsString <> edtNumProc.Text then
                                    ListPessoas.Add(InttoStr(Pessoa.Id) + '|' + Pessoa.Conta + '|' + Pessoa.Agencia + '|' + Pessoa.Operacao + '|' + Pessoa.Banco + '|')
                                  else
                                    mmResultado.Add('LINHA ' + IntToStr(linha) + ': Assistido com ação judicial já cadastrada.');
                                end
                                else
                                begin
                                  ListPessoas.Add(InttoStr(Pessoa.Id) + '|' + Pessoa.Conta + '|' + Pessoa.Agencia + '|' + Pessoa.Operacao + '|' + Pessoa.Banco + '|')
                                end;
                                // Andre Imakawa - SIG 103667 - Fim
                            end
                          else
                            begin
                              ListPessoas.Add(InttoStr(Pessoa.Id) + '|' + Pessoa.Conta + '|' + Pessoa.Agencia + '|' + Pessoa.Operacao + '|' + Pessoa.Banco + '|');
                            end;
                        end;

                      Pessoa.LimparPessoa;

                      qryAux.Next;
                    end;
                end;
            end
          else
            begin
              Pessoa.Id := qryAux.FieldByName('IDPESSOA').AsInteger;

              PreencheConta;
            end;

          linha := linha + 1;
        end;

        MsgDlg('Importação do arquivo realizado com sucesso!','Informação',mtInformation,[mbOk],0);
    end;

    mmResultado.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\INCONSISTENCIASACAOJUDICIAL_' + FormatDateTime('DDMMYYYY', Now)  + '.txt');
  finally
    FreeAndNil(mmResultado);

    FreeAndNil(Pessoa);

    Excel.Workbooks.Close;
    Excel.Quit;
    Excel := Unassigned;
  end;
end;

procedure TFrmCadDepJudicial.MontaTela;
begin
  cmbOperacao.ItemIndex  := StrToIntDef(qryMestre.FieldByName('CODOPERACAO').AsString,-1);
  cmbTipoOAcao.ItemIndex := StrToIntDef(qryMestre.FieldByName('TIPOACAO').AsString,-1);
  edCodVara.Text         := qryMestre.FieldByName('CODVARA').AsString;
  edNomeVara.Text        := qryMestre.FieldByName('NOMEVARA').AsString;
  edCodSecao.Text        := qryMestre.FieldByName('CODSECAO').AsString;
  edNomesecao.Text       := qryMestre.FieldByName('NOMESECAO').AsString;
  edAutorAcao.Text       := qryMestre.FieldByName('AUTORACAO').AsString;
  edNumProc.Text         := qryMestre.FieldByName('NUMEROPROCESSO').AsString;
  edtClasse.Text         := qryMestre.FieldByName('CLASSEACAO').AsString;
  dbdtInicio.Text        := qryMestre.FieldByName('DATAINICIO').AsString;
  DBedtDataFinal.Text    := qryMestre.FieldByName('DATAFINAL').AsString;
  cmbUF.KeyValue         := qryMestre.FieldByName('UFSECAO').AsString;
  cmbCidade.KeyValue     := qryMestre.FieldByName('UFSECAO').AsString;

end;

procedure TFrmCadDepJudicial.MontaMestre(iTipo : Integer);
begin
  if(iTipo = 1) then
  begin
    qryMestre.Edit;

    qryMestre.FieldByName('TIPOACAO').AsInteger := cmbTipoOAcao.ItemIndex;
    qryMestre.FieldByName('CLASSEACAO').AsString := edtClasse.Text;
    qryMestre.FieldByName('AUTORACAO').AsString := edAutorAcao.Text;

    qryMestre.FieldByName('NUMEROPROCESSO').AsString := edNumProc.Text;
    //if cmbTipoOacao.ItemIndex = 1 then                                  // Andre Imakawa - SIG 99651
    if (cmbTipoOacao.ItemIndex = 1) or (cmbTipoOacao.ItemIndex = 2) then  // Andre Imakawa - SIG 99651
      qryMestre.FieldByName('PERCACAO').AsFloat := edtPercAcao.Value
    else
      qryMestre.FieldByName('PERCACAO').AsFloat := 100;

    qryMestre.FieldByName('SITPROCESSO').AsInteger := cboStatusAcao.ItemIndex;

    qryMestre.FieldByName('DATAINICIO').AsString := dbdtInicio.Text;
    qryMestre.FieldByName('DATAFINAL').AsString := DBedtDataFinal.Text;

    qryMestre.FieldByName('CODVARA').AsString := edCodVara.Text;
    qryMestre.FieldByName('NOMEVARA').AsString := edNomeVara.Text;
    qryMestre.FieldByName('CODSECAO').AsString := edCodSecao.Text;
    qryMestre.FieldByName('UFSECAO').AsString := cmbUF.KeyValue;
    qryMestre.FieldByName('NOMESECAO').AsString := edNomesecao.Text;

    if(qryMestre.FieldByName('IDCBANCARIA').AsInteger <> 0) then
      begin
        qryMestre.FieldByName('IDBANCO').AsInteger := qryMestre.FieldByName('IDBANCO').AsInteger;
        qryMestre.FieldByName('IDAGENCIABANCARIA').AsInteger := qryMestre.FieldByName('IDAGENCIABANCARIA').AsInteger;
        qryMestre.FieldByName('IDCBANCARIA').AsInteger := qryMestre.FieldByName('IDCBANCARIA').AsInteger;
        qryMestre.FieldByName('CODOPERACAO').AsString := qryMestre.FieldByName('CODOPERACAO').AsString;
      end;

    if(AlteraLote) then
    begin
      qryMestre.FieldByName('DATAINICIO').AsString := ListCampos[1][1];
      qryMestre.FieldByName('DATAFINAL').AsString := ListCampos[1][2];
      qryMestre.FieldByName('UFSECAO').AsString := ListCampos[1][3];
    end;

    qryMestre.Post;
  end
  else
    begin
      if (opCadDet in[dsInsert,dsEdit]) then
          GravarDetalhe;
    end;
end;

procedure TFrmCadDepJudicial.sbtnExcluiDetClick(Sender: TObject);
begin
  if (ExcluiLote) then
   begin
     ListaComandos.Add(' DELETE FROM DETPROCJUD '+
                       ' WHERE IDPESSOA = IDPESSOA_P '+
                       '  AND IDPROCJUD = IDPROCJUD_P '+
                       '  AND IDREGRA = ' + qryDet.FieldByName('IDREGRA').AsString + ';');
   end;

  opCadDet:= dsOldValue;
  inherited;
end;

procedure TFrmCadDepJudicial.FormCreate(Sender: TObject);
begin
  inherited;
  ListaDetalhe := TStringlist.Create;
  ListPessoas  := TStringList.Create;
  ListaComandos:= Tstringlist.create;
end;

procedure TFrmCadDepJudicial.GravarDetalhe;
var
  i: Integer;
  slinha: String;
begin
 qryDet.First;
 while not(qryDet.eof) do
  begin
    slinha:= EmptyStr;

    for i:= 0 to qryDet.fieldcount -1 do
     begin
       if (slinha = EmptyStr) then
          slinha:= qryDet.Fields[i].AsString
       else
          slinha:= slinha + '|' + qryDet.fields[i].AsString;
     end;
    ListaDetalhe.Add(slinha);
    qryDet.next;
  end;
end;

function TFrmCadDepJudicial.BuscarItensDetalhe(iItem: Integer; strLinha: String): String;
var
  Parte : TStringList;
begin
  try
    Parte := TStringList.Create;
    ExtractStrings(['|'],[], PChar(strLinha), Parte);
    try
      result := (Parte[iItem]);
    except
      result := EmptyStr;
    end;
  finally
    FreeAndNil(Parte);
  end;
end;

procedure TFrmCadDepJudicial.AtualizarDetalheLista;
var i, x: Integer;
begin
  for i:= 0 to ListaDetalhe.count -1 do
    begin
       qryDet.Insert;

       for x:= 0 to qryDet.fieldcount-1 do
          qryDet.Fields[x].AsString := BuscarItensDetalhe(x, ListaDetalhe[i]);

       qryDet.FieldByname('IDPROCJUD').AsInteger := qryMestre.FieldByName('IDPROCJUD').AsInteger;
       qryDet.FieldByname('IDPESSOA').AsInteger  := qryMestre.FieldByName('IDPESSOA').AsInteger;
       qryDet.Post;
    end;
end;

{procedure TFrmCadDepJudicial.edtNumProcExit(Sender: TObject);
begin
  inherited;
  sbtnApagar.Enabled  := ExisteProcesso(edtNumProc.Text);
  sbtnAlterar.Enabled := sbtnApagar.Enabled;
  ExcluiLote          := sbtnAlterar.Enabled;
  AlteraLote          := ExcluiLote;
end;}

procedure TFrmCadDepJudicial.CmeDetalheAtualizaBotoes(Sender: TObject);
begin
  if (AlteraLote) or(CadLote)or (ExcluiLote) then
    begin
      case opCadDet of
        dsEdit   : CmeDetalhe.Operacao := opAlterar;
        dsInsert : CmeDetalhe.Operacao := opInserir;
        dsBrowse,
        dsOldValue : CmeDetalhe.Operacao := opIdle;
      end;
    end;

  inherited;

  if (AlteraLote) or (CadLote) or (ExcluiLote) then
    begin
      case opCadDet of
        dsEdit   :
          begin
             sbtnInsDet.Enabled   := false;
             sbtnExcluiDet.Enabled:= false;
          end;
        dsInsert:
          begin
             sbtnAltDet.Enabled   := false;
             sbtnExcluiDet.Enabled:= false;
          end;
        dsOldValue : //delete
          begin
             sbtnAltDet.Enabled:= false;
             sbtnInsDet.Enabled:= false;
          end;
      end;
    end;
end;

procedure TFrmCadDepJudicial.AtualizaGridDetalhe(iIdPessoa,iIdProcJud: Integer);
begin
  qryDet.Close;
  qryDet.ParamByName('IDPESSOA').AsInteger  := iIdPessoa;
  qryDet.ParamByName('IDPROCJUD').AsInteger := iIdProcJud;
  qryDet.Open;
end;

function TFrmCadDepJudicial.ExecutaComandosPendentes: Boolean;
var
  sSQL: String;
begin
  sSQL:= sSQL + ListaComandos.gettext;
  sSQL:= StringReplace(sSQL, 'IDPESSOA_P', qryMestre.FieldByName('IDPESSOA').AsString, []);
  sSQL:= StringReplace(sSQL, 'IDPROCJUD_P', qryMestre.FieldByName('IDPROCJUD').AsString, []);

  if(sSQL = '') then
    Result := True
  else
    Result := ExecutarQuery(qryAux, 'begin '+ sSQL +' end;');
end;   
//Ewerton Beltramini - 29/12/2021 - SIG120780 - Inicio
procedure TFrmCadDepJudicial.CarregaCidade(CODESTADO:String);
begin
     QryCidade.Close;
     QryCidade.ParamByName('CODESTADO').AsString := CODESTADO;
     QryCidade.Open;
end;
//Ewerton Beltramini - 29/12/2021 - SIG120780 - Fim


procedure TFrmCadDepJudicial.HabilitaProcessoLote(bHabilita: Boolean);
begin

  pnlProcessoLote.Enabled := bHabilita;

  if(bHabilita) then
    begin
      edtNumProc.Color := ClWhite;
      edtArquivo.Color := ClWhite;
      sbtnProcurar.Enabled := False;
      sbtnInserir.Enabled := True;
      sbtnAlterar.Enabled := True;
      sbtnApagar.Enabled := True;
    end
  else
    begin
      edtNumProc.Color := ClGray;
      edtArquivo.Color := ClGray;
      edtNumProc.Text  := '';
      edtArquivo.Text  := '';
      sbtnProcurar.Enabled := True;
      CmeCadastroAtualizaBotoes(Self);
    end;
end;

procedure TFrmCadDepJudicial.chkProcessoLoteClick(Sender: TObject);
begin
  inherited;
  HabilitaProcessoLote(chkProcessoLote.Checked);
end;
//SIG74000 - TAES - fim
// Andre Imakawa - SIG 103667 - Inicio
function TFrmCadDepJudicial.DeParaOperacao(pOperacao: string):Integer;
var
  iOperacao: Integer;
begin
  {
  001 - Conta Corrente
  002 - Conta Corrente Pessoa Física
  003 - Conta Corrente Pessoa Jurídica
  004 - Depósito Judicial
  013 - Conta de Poupança
  022 - Conta Caderneta Pessoa Jurídica
  635 - Dépósito Judicial IR
  }
  if pOperacao = '001' then
    iOperacao := 0
  else
    if pOperacao = '002' then
      iOperacao := 1
    else
      if pOperacao = '003' then
        iOperacao := 2
      else
        if pOperacao = '004' then
          iOperacao := 3
        else
          if pOperacao = '013' then
            iOperacao := 4
          else
            if pOperacao = '022' then
              iOperacao := 5
            else
              if pOperacao = '635' then
                iOperacao := 6
              else
                iOperacao := 6;
  Result := iOperacao;
end;
// Andre Imakawa - SIG 103667 - Fim
procedure TFrmCadDepJudicial.dblkDARFExit(Sender: TObject);
begin
  inherited;
  if dblkDARF.Text = '' then
    dblkDARF.LookUpValue := '';
end;

procedure TFrmCadDepJudicial.dblkDARFCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkDARF.Text = '' then
    dblkDARF.LookUpValue := '';         
end;

procedure TFrmCadDepJudicial.dblkDARFChange(Sender: TObject);
begin
  inherited;
  if dblkDARF.Text = '' then
    dblkDARF.LookUpValue := '';
end;

procedure TFrmCadDepJudicial.cmbUFExit(Sender: TObject);
begin
  inherited;
  CarregaCidade(qryEstado.fieldbyname('CODESTADO').AsString);  //Ewerton Beltramini - 29/12/2021 - SIG120780
end;

end.
