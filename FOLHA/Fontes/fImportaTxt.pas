// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor(a)   : Thiago Melo
//  Rotina     : ValidaBeneficio
//  Data       : 06/06/2013
//  Pendencia  : SOL 208649 / Kintana 2015547
//  Alteração  : Crítica incorreta na importação de arquivo para entidade convenente
// -------------------------------------------------------------------------------------------------
//  Autor(a)   : Renato Visoni
//  Rotina     : bbtnConfirmar
//  Data       : 30/09/2009
//  Pendencia  : SOL 98796 Kintana 525569
//  Alteração  : Alterar o nome do arquivo importado no final do processo e não permitir que os arquivos
//               que tenham a palavra 'PROCESSADO' seja importado novamente.
// -------------------------------------------------------------------------------------------------
//  Autor(a)   : Daniel Besgnami
//  Rotina     : InsereRubrica
//  Data       : 10/09/2009
//  Pendencia  : SOL  92576 \ Kintana  621482
//  Alteração  : Quando parcela for 999 marcar o campo FLGPERMANENTE com 1
// -------------------------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
//  Autor(a)   : Renato Visoni
//  Rotina     : ProcessaAvulso
//  Data       : 11/11/2008
//  Pendencia  : SOL 100738 \ Kintana 446709
//  Alteração  : Na hora da importação o programa estava parando e não continuava o processamento para
//               as linhas que estavam com a matricula em branco.
// -------------------------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : ConstroiQueryMatricula
//  Data       : 03/04/2007
//  Pendencia  : 24976
//  Alteração  : Obter benefícios de plano desativado, para identificar a
//    matrícula na importação, caso parâmetro "Prepara Benefícios de Plano
//    Desativado" esteja ligado.
// -------------------------------------------------------------------------------------------------
//  Autor(a)   : Claudio Faria
//  Rotina     : VerificaLote
//  Data       : 30/10/2006
//  Pendencia  : 23873
//  Alteração  : Ajuste na verificação de lote existentes para importação.
// -------------------------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : CriticaLinha
//  Data       : 09/10/2006
//  Pendencia  :
//  Alteração  : Retirando critica de sequencial em duplicidade.
// -------------------------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Processar
//  Data       : 06/10/2006
//  Pendencia  : 23133
//  Alteração  : Verificar se a rubrica normal está definida no layout e no arquivo.
//    Caso não esteja tratar exceção e exibir mensagem de alerta no Log.
// -------------------------------------------------------------------------------------------------
unit fImportaTxt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, ComCtrls, Db, DBTables, Wwquery,
  Mask, wwdbedit, Wwdotdot, Wwdbcomb, Wwdatsrc, wwdblook, Wwdbigrd, Grids,
  Wwdbgrid, JclStrings, uConstFolha, uSistema;

type
  TfrmImportaTxt = class(TfrmOkCancelar)
    OpenDialog1: TOpenDialog;
    qryTmpDesc: TwwQuery;
    qryInscricao: TwwQuery;
    qryLayoutDesconto: TwwQuery;
    qryFavorecidoXLayout: TwwQuery;
    qryLayoutXColunas: TwwQuery;
    updTmpDesc: TUpdateSQL;
    PageControl1: TPageControl;
    tbsImporta: TTabSheet;
    tbsResult: TTabSheet;
    SaveDlg: TSaveDialog;
    QryProvDesc: TwwQuery;
    QryProvDescFLGDESCONTO: TFloatField;
    qryDepentIt: TwwQuery;
    qryLote: TwwQuery;
    qryAltLayDesc: TwwQuery;
    qryMatric: TwwQuery;
    qryCtrlInterface: TwwQuery;
    qryVerificaReg: TwwQuery;
    qryRubricaXPlano: TwwQuery;
    memResult: TRichEdit;
    Panel1: TPanel;
    bbtnSalvar: TBitBtn;
    qryAux: TwwQuery;
    qryRubricaIndiv: TwwQuery;
    updRubricaIndiv: TUpdateSQL;
    qryRubExternaXInterna: TwwQuery;
    qryRubInternaXExterna: TwwQuery;
    qryEstatistica: TwwQuery;
    dsEstatistica: TDataSource;
    ProgressBar1: TProgressBar;
    lbTotalReg: TLabel;
    pnlOpcoes: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cboxMes: TComboBox;
    EditAno: TEdit;
    UpDown1: TUpDown;
    GroupBox2: TGroupBox;
    dblcmbLayout: TwwDBLookupCombo;
    gbAbono: TGroupBox;
    chkAbonoAnual: TCheckBox;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    cmbLote: TwwDBLookupCombo;
    wwDBGrid1: TwwDBGrid;
    wwDBGrid1IButton: TwwIButton;
    Panel3: TPanel;
    cbxApaga: TCheckBox;
    Panel4: TPanel;
    rgDuplicados: TRadioGroup;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    cboxDemissao: TCheckBox;
    Panel5: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    lbNomeArqImport: TLabel;
    lbNomeArqRej: TLabel;
    BevelArqRej: TBevel;
    BevelArqImport: TBevel;
    sbtnOrigem: TSpeedButton;
    qryRubExternaxInternaCont: TwwQuery;
    qryaux2: TwwQuery;
    cboxConfirma: TCheckBox;
    tbsArquivo: TTabSheet;
    mmArquivo: TMemo;
    lblRegua: TLabel;
    Bevel1: TBevel;
    bbtnProcessaCritica: TBitBtn;
    lblMensagemCritica: TLabel;
    pbarCritica: TProgressBar;
    qryDependente: TwwQuery;
    qryrubricaxcontabancaria: TQuery;
    qrybuscacodprev: TQuery;
    qrybuscacodprevCODPROVDESC: TStringField;
    cbboxAtivo: TComboBox;
    procedure bbtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbLoteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cbxApagaClick(Sender: TObject);
    procedure dblcmbLayoutChange(Sender: TObject);
    procedure chkAbonoAnualClick(Sender: TObject);
    procedure dblcmbLayoutCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnProcessaCriticaClick(Sender: TObject);
    procedure sbtnOrigemClick(Sender: TObject);
    procedure EditAnoExit(Sender: TObject);
    procedure cboxMesExit(Sender: TObject);
    procedure cboxMesClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
    sMascMatricula, //PARA TRATAMENTO DA MATRICULA NO RECEBIMENTO DAS RUBRICAS
    sMesRefInterface : String;
    sMesAnterior: string; //MES ANTERIOR PARA ULTMESPREPARO
    //Parametro p/ saber a situação da importação à saber:
    iSitImportacao,
    iidLOTE: longint;  // 0-Cria novo LOTE(1ª importação)
                       // 1-Achou LOTE referente(único, será atualizado conforme parametros.)
                       // 2-Há mais de um lote (questionar Paulo p/ saber procedimento)
    sidPessJur,
    sidRubrica,
    sidPlanoPrev : longint;
    sAbonoAnual : String;
    iIdMotivoFolha : Integer;
    nLinhasCabec: integer;
    nLinhasRodape: integer;

    slIdRubImp1 : Integer;
    rsomaValor :  Integer;
    Flag_erro : Integer;
    sChave1 : String;
    sValorTotal : integer;
    QuantRegistro : Integer;
    nRegTotal  :  longint;

    posValor,
    tamValor,
    posParc: integer;
    TamParc: integer;
    sparcelas: string;
    nparcelas: integer;
    svalor: string;
    rvalor: real;
    nValRej: real;
    nValtotal: real;

    smesref: string;

    procedure ConstroiQueryMatricula(var smatric: string);
    procedure ConstroiQueryInscricao(asinscricao: string; ainumseq: integer); 
    function ExisteMatricula(smatric: string): boolean; 
    procedure CalculaMesReferencia;
    function TiraZero(a: string):string;
    // Preenche stringlist (LISTA) com o arquivo selecionado
    procedure Ler(caminho : string);
    procedure Processar;
    // Lê a matrícula/inscrição de acordo com os parâmetros cadastrados em LAYOUTXCOLUNAS.
    function Valor_(const posicao,tamanho,linha : integer; var bProc :Boolean):string;
    // Retorna FLGDESCONTO da PROVDESC: 0 ou 1
    function TipoProvento( Tipo : LongInt) : LongInt;
    // Trata valor de acordo com as configuração cadastrada na LayoutxColunas:
    // Nº de casas decimais e decimalseparator
    function ConverteValor(svalor, scaracdec : string; ndecimal : integer) : real;
    // Insere ou atualiza(NumReg/ValorTotal) na CTRLINTERFACE
    Function GravaLote(binsert : boolean; numLote, idlayout : longint;
      sMesref : String; Valtotal : Real ; RegTotal : longint) : Boolean;
    // Verifica da LayoutDesconto a data do ULTIMPORT
    Function JahImportou : Boolean;
    // Atualiza campo ULTIMPORT na LayoutDesconto
    procedure AtualizaStatus(sParm : String);
    Function VerificaContabil: Boolean;
    procedure InsereContabil(qry : twwquery; var ssql : string);
    procedure AcertaDados;

    Function FMontamatricula : String;

    Function FRetornaDado2(const posicao,tamanho,linha : integer): String;
    procedure MontaHeaderCritica;  
    procedure MontaDetalheCritica(Mensagem : String;Cargadia : String;linha : Integer); 
    procedure MontaRodapeCritica;
    procedure ProcessaCritica;
    procedure LerlistaCritica;
    procedure CriticaLinha(Indices, aicontrole: Integer);
    procedure GravaListaTempo(indices : integer);

    procedure PegaParcela(iLinha: integer); 
    procedure PegaValorPorErro(iLinha: integer); 

    function ValidaBeneficio(aqry: twwquery; 
      var asmsg: string): boolean;
    function ValidaOperacao(aidTitular, aidPessoa, aidRubrica, aiSeq, aidFundacao: Integer; asCodOp: String): Boolean;

    procedure VerificaLote; 
  public
    { Public declarations }
    ListaCritica : TStringList; 
    ListaTemp     : TStringList;   
    ListaErro    : TStringList;
    ListaConta   : TStringList; 
    iNaoProcessa: Longint; //total de registros ignorados para processamento
    iIgnorados: Longint; //total de registros ignorados para processamento (header, trailer de arquivo e de registro)
    iSucesso: longint; //total de registros processados com sucesso
    iRejeitados: Longint; //total de registros nao processados
    sDataInicial, sMesImportacao : String;
    sMesImportacao1,sDataInicial1 : String; 
  end;

var
  frmImportaTxt: TfrmImportaTxt;

implementation

{$R *.DFM}

uses
  UMensErro, UDatabase, UIntegraBack, Dbasedados, UFuncoesUteisFB,
  UObjFolha, uAdmPrevFB;

procedure TfrmImportaTxt.FormCreate(Sender: TObject);
begin
  inherited;
  //Jéssica Lana SOL 109421 KINTANA 496332
  OpenDialog1.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  lbNomeArqRej.Caption:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  lbNomeArqImport.Caption:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  qryLayoutDesconto.open;
  PageControl1.ActivePage:=tbsImporta;
  iRejeitados:=0;
  iIgnorados:=0;
  iNaoProcessa:=0; 
  iSucesso:=0;
  iSitImportacao:=-1;

  sMascMatricula:=FMontaMatricula;
  ListaErro     :=TStringList.Create;
  ListaConta    :=TStringList.Create; 
  ListaConta.Duplicates:=dupIgnore;
  ListaTemp     :=TStringList.Create; 
  ListaCritica  :=TStringList.Create; 
end;

Function TfrmImportaTxt.FMontaMatricula : String;
 var nPos: integer;
begin
  nPos:=Pos('-',sistemafolha.Mascaramatricula);
  If nPos = 0 then
    result:=Trim(SistemaFolha.MascaraMatricula)
  else
    result:=Copy(SistemaFolha.Mascaramatricula,1,nPos-1);
end;

procedure TfrmImportaTxt.FormShow(Sender: TObject);
 var dia, mes, ano: word;
begin
  inherited;
  DecodeDate(Date, ano,mes,dia);
  sDataInicial:=(IntToStr(dia)+'/'+IntToStr(mes)+'/'+IntToStr(Ano));
  editAno.Text:=IntToStr(ano);
  cboxMes.ItemIndex:=mes-1;
  CalculaMesReferencia;
  cbxApaga.Checked:=false;
  cbxApaga.enabled:=false;
  sAbonoAnual:=EditAno.Text+'/13';
  WindowState:=wsMaximized;
end;

procedure TfrmImportaTxt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ListaErro.Free;
  ListaConta.Free; 
  ListaCritica.Free; 
  ListaTemp.Free; 
end;

function TfrmImportaTxt.ExisteMatricula(smatric: string): boolean;
 var ssql: string;
begin
  result:=true;
  if (qryLayoutDesconto.FieldByName('FLGPOSSUIDEP').AsInteger = 1) or
     (not SistemaFolha.FlgUsaMatriculaDependente) then
  begin
    ssql:=
      'SELECT 1 '+
      'FROM ELEGPATRO '+
      'WHERE MATRICULA LIKE '+QuotedStr(smatric)+' ';
  end
  else
  begin
    ssql:=
      'SELECT 1 '+
      'FROM ELEGPATRO '+
      'WHERE MATRICULA LIKE '+QuotedStr(smatric)+' '+
      'UNION '+
      'SELECT 1 '+
      'FROM  DEPENTIT D '+
      'WHERE D.MATRICULA LIKE '+QuotedStr(smatric)+' '+
      'AND D.IDTITULAR <> D.IDPESSOA ';
  end;
  try
    qryAux.close;
    qryAux.sql.clear;
    qryAux.sql.add(ssql);
    qryAux.open;
    result:=not qryAux.isempty;
  except
    result:=false;
  end;
end;

procedure TfrmImportaTxt.ConstroiQueryMatricula(var smatric: string);
 var ssql: string;
begin
  if not SistemaFolha.FlgUsaMatriculaCompleta then
    smatric:=smatric+'%';

  //TRATAMENTO DE SITUAÇÃO DO BENEFÍCIO INCLUINDO BENEFICIO PREPARADO
  if cbboxAtivo.itemindex > 0 then
  begin
    If (qryLayoutDesconto.FieldByName('FLGPOSSUIDEP').AsInteger = 0) and
       (SistemaFolha.FlgUsaMatriculaDependente) then
    Begin
      //INCLUIR A DATAMORTE DA PESSOAFISICA PARA EXIBIR MENSAGEM DE FALECIDO
      ssql:='SELECT DISTINCT P.IDPESSOA AS IDTITULAR, P.IDPESSOA AS IDPESSOA, P.IDPESSJUR, '+
                   'B.IDPLANOPREV AS PLANOBENEF, B.NUMEROPROCESSO, '+
                   'PF.DATAMORTE, '+ 
                   'P.IDPLANOPREV, E.MATRICULA, P.SEQPROPOSTA, B.IDSITBENEFICIO '+
            'FROM  ELEGPATRO E, PARTPREVPLAN P, BENEFBFCIARIO B, PESSOAFISICA PF '+
            'WHERE E.MATRICULA LIKE '+QuotedStr(smatric)+' ';

      if cboxDemissao.checked then
        ssql:=ssql+' AND E.DATADEMISSAO IS NULL ';

      ssql:=ssql+
            'AND PF.IDPESSOA(+) = B.IDPESSOA '+ 
            'AND P.IDPESSJUR = E.IDPESSJUR '+
            'AND P.IDPESSOA = E.IDPESSOA ';

      //PEGAR PLANO DESATIVADO
      if (SistemaFolha.FLGPREPARABENEFDESATIVADO=0) then
        ssql:=ssql+
           'AND P.FLGDESATIVADO = ''0'' ';

      ssql:=ssql+
            'AND P.IDPESSJUR = B.IDPESSJUR '+
            'AND P.IDPESSOA = B.IDTITULAR '+
            'AND P.IDPESSOA = B.IDPESSOA '+
            'AND P.IDPLANOPREV = B.IDPLANOPREV '+
            'AND P.SEQPROPOSTA = B.SEQPROPOSTA '+
            'UNION '+
            'SELECT DISTINCT D.IDTITULAR, D.IDPESSOA, P.IDPESSJUR, '+
                   'B.IDPLANOPREV AS PLANOBENEF, B.NUMEROPROCESSO, '+
                   'PF.DATAMORTE, '+ 
                   'P.IDPLANOPREV, D.MATRICULA, P.SEQPROPOSTA, B.IDSITBENEFICIO '+
            'FROM  DEPENTIT D, PARTPREVPLAN P, BENEFBFCIARIO B, PESSOAFISICA PF '+
            'WHERE D.MATRICULA LIKE '+QuotedStr(smatric)+' '+
            'AND PF.IDPESSOA(+) = B.IDPESSOA '+ 
            'AND D.IDTITULAR <> D.IDPESSOA '+
            'AND P.IDPESSOA = D.IDTITULAR ';

      //PEGAR PLANO DESATIVADO
      if (SistemaFolha.FLGPREPARABENEFDESATIVADO=0) then
        ssql:=ssql+
           'AND P.FLGDESATIVADO = ''0'' ';

      ssql:=ssql+
            'AND P.IDPESSJUR = B.IDPESSJUR '+
            'AND D.IDTITULAR = B.IDTITULAR '+
            'AND D.IDPESSOA = B.IDPESSOA '+
            'AND B.IDPLANOORIGEM = P.IDPLANOPREV '+
            'AND P.SEQPROPOSTA = B.SEQPROPOSTA '+
            //ORDENAÇÃO PARA PEGAR PRIMEIRO O BENEFICIO ATIVO
            'ORDER BY IDSITBENEFICIO ';
    End
    Else
    Begin
      ssql:='SELECT DISTINCT P.IDPESSOA AS IDTITULAR, P.IDPESSOA AS IDPESSOA, P.IDPESSJUR, '+
                   'B.IDPLANOPREV AS PLANOBENEF, B.NUMEROPROCESSO, '+
                   'PF.DATAMORTE, '+ 
                   'P.IDPLANOPREV, E.MATRICULA, P.SEQPROPOSTA, B.IDSITBENEFICIO '+
            'FROM  ELEGPATRO E, PARTPREVPLAN P, BENEFBFCIARIO B, PESSOAFISICA PF '+
            'WHERE E.MATRICULA LIKE '+QuotedStr(smatric)+' ';

      if cboxDemissao.checked then
        ssql:=ssql+' AND E.DATADEMISSAO IS NULL ';

      ssql:=ssql+
            'AND PF.IDPESSOA(+) = B.IDPESSOA '+ 
            'AND P.IDPESSJUR = E.IDPESSJUR '+
            'AND P.IDPESSOA = E.IDPESSOA ';

      //PEGAR PLANO DESATIVADO
      if (SistemaFolha.FLGPREPARABENEFDESATIVADO=0) then
        ssql:=ssql+
           'AND P.FLGDESATIVADO = ''0'' ';

      ssql:=ssql+
            'AND P.IDPESSJUR = B.IDPESSJUR '+
            'AND P.IDPESSOA = B.IDTITULAR '+
            'AND P.IDPESSOA = B.IDPESSOA '+
            'AND P.IDPLANOPREV = B.IDPLANOPREV '+
            'AND P.SEQPROPOSTA = B.SEQPROPOSTA '+

            'ORDER BY B.IDSITBENEFICIO '; 
    End;
  end
  else
  begin
    //Testa se tem importação para dependente
    If (qryLayoutDesconto.FieldByName('FLGPOSSUIDEP').AsInteger = 0) and
       (SistemaFolha.FlgUsaMatriculaDependente) then
    Begin
      ssql:='SELECT DISTINCT P.IDPESSOA AS IDTITULAR, P.IDPESSOA AS IDPESSOA, P.IDPESSJUR, '+
                   'P.IDPLANOPREV AS PLANOBENEF, 0 AS NUMEROPROCESSO, '+
                   'PF.DATAMORTE, '+ 
                   'P.IDPLANOPREV, E.MATRICULA, P.SEQPROPOSTA, 0 AS IDSITBENEFICIO '+
            'FROM  ELEGPATRO E, PARTPREVPLAN P, PESSOAFISICA PF '+
            'WHERE E.MATRICULA LIKE '+QuotedStr(smatric)+' ';

      if cboxDemissao.checked then
        ssql:=ssql+' AND E.DATADEMISSAO IS NULL ';

      ssql:=ssql+
            'AND PF.IDPESSOA(+) = E.IDPESSOA '+ 
            'AND P.IDPESSJUR = E.IDPESSJUR '+
            'AND P.IDPESSOA = E.IDPESSOA '+
            'AND P.FLGDESATIVADO = ''0'' '+
            'UNION '+
            'SELECT DISTINCT D.IDTITULAR, D.IDPESSOA, P.IDPESSJUR, '+
                   'P.IDPLANOPREV AS PLANOBENEF, 0 AS NUMEROPROCESSO, '+
                   'PF.DATAMORTE, '+ 
                   'P.IDPLANOPREV, D.MATRICULA, P.SEQPROPOSTA, 0 AS IDSITBENEFICIO '+
            'FROM  DEPENTIT D, PARTPREVPLAN P, PESSOAFISICA PF '+
            'WHERE D.MATRICULA LIKE '+QuotedStr(smatric)+' '+
            'AND PF.IDPESSOA(+) = D.IDPESSOA '+ 
            'AND D.IDTITULAR <> D.IDPESSOA '+
            'AND P.IDPESSOA = D.IDTITULAR '+
            'AND P.FLGDESATIVADO = ''0'' ';
    End
    Else
    Begin
      ssql:='SELECT DISTINCT P.IDPESSOA AS IDTITULAR, P.IDPESSOA AS IDPESSOA, P.IDPESSJUR, '+
                   'P.IDPLANOPREV AS PLANOBENEF, 0 AS NUMEROPROCESSO, '+
                   'PF.DATAMORTE, '+ 
                   'P.IDPLANOPREV, E.MATRICULA, P.SEQPROPOSTA, 0 AS IDSITBENEFICIO '+
            'FROM  ELEGPATRO E, PARTPREVPLAN P, PESSOAFISICA PF '+
            'WHERE E.MATRICULA LIKE '+QuotedStr(smatric)+' ';

      if cboxDemissao.checked then
        ssql:=ssql+' AND E.DATADEMISSAO IS NULL ';

      ssql:=ssql+
            'AND PF.IDPESSOA(+) = E.IDPESSOA '+ 
            'AND P.IDPESSJUR = E.IDPESSJUR '+
            'AND P.IDPESSOA = E.IDPESSOA '+
            'AND P.FLGDESATIVADO = ''0'' ';
    End;
  end;
  qryMatric.close;
  qryMatric.sql.clear;
  qryMatric.sql.add(ssql);
  qryMatric.open;
end;

procedure TfrmImportaTxt.ConstroiQueryInscricao(asinscricao: string; ainumseq: integer);
 var ssql: string;
begin
  if cbboxAtivo.itemindex > 0 then
  begin
    if ainumseq = 0 then
    begin
    //INCLUIR A DATAMORTE DA PESSOAFISICA PARA EXIBIR MENSAGEM DE FALECIDO

      ssql:=
        'SELECT DISTINCT P.IDPESSOA AS IDTITULAR, '+_clinefeed+
        '       P.IDPESSOA AS IDPESSOA, P.IDPESSJUR, '+_clinefeed+
        '       B.IDPLANOPREV AS PLANOBENEF, '+_clinefeed+
        '       PF.DATAMORTE, '+ 
        '       B.NUMEROPROCESSO, P.INSCRICAONUMERO, '+_clinefeed+
        '       P.IDPLANOPREV, E.MATRICULA, P.SEQPROPOSTA, B.IDSITBENEFICIO '+_clinefeed+
        'FROM  ELEGPATRO E, PARTPREVPLAN P, BENEFBFCIARIO B, PESSOAFISICA PF '+_clinefeed+
        'WHERE P.INSCRICAONUMERO = '+asinscricao+' '+_clinefeed+
        'AND PF.IDPESSOA(+) = E.IDPESSOA '+ 
        'AND P.IDPESSJUR = E.IDPESSJUR '+_clinefeed+
        'AND P.IDPESSOA = E.IDPESSOA '+_clinefeed+
        'AND P.FLGDESATIVADO = 0 '+_clinefeed+
        'AND P.IDPESSJUR = B.IDPESSJUR '+_clinefeed+
        'AND P.IDPESSOA = B.IDTITULAR '+_clinefeed+
        'AND P.IDPESSOA = B.IDPESSOA '+_clinefeed+
        'AND P.IDPLANOPREV = B.IDPLANOPREV '+_clinefeed+
        'AND P.SEQPROPOSTA = B.SEQPROPOSTA '+_clinefeed+
        'ORDER BY B.IDSITBENEFICIO '+_clinefeed; 
    end
    else
    begin
      ssql:=ssql+
        'SELECT DISTINCT P.IDPESSOA AS IDTITULAR, '+_clinefeed+
        '       B.IDPESSOA, P.IDPESSJUR, '+_clinefeed+
        '       B.IDPLANOPREV AS PLANOBENEF, '+_clinefeed+
        '       PF.DATAMORTE, '+ 
        '       B.NUMEROPROCESSO, P.INSCRICAONUMERO, '+_clinefeed+
        '       P.IDPLANOPREV, D.MATRICULA, P.SEQPROPOSTA, B.IDSITBENEFICIO '+_clinefeed+
        'FROM  DEPENTIT D, PARTPREVPLAN P, BENEFBFCIARIO B, PESSOAFISICA PF '+_clinefeed+
        'WHERE P.INSCRICAONUMERO = '+asinscricao+' '+_clinefeed+
        'AND PF.IDPESSOA(+) = D.IDPESSOA '+ 
        'AND P.IDPESSOA = D.IDTITULAR '+_clinefeed+
        'AND D.NUMSEQUENCIA = '+inttostr(ainumseq)+' '+_clinefeed+
        'AND P.FLGDESATIVADO = 0 '+_clinefeed+
        'AND P.IDPESSJUR = B.IDPESSJUR '+_clinefeed+
        'AND D.IDTITULAR = B.IDTITULAR '+_clinefeed+
        'AND D.IDPESSOA = B.IDPESSOA '+_clinefeed+
        'AND P.IDPLANOPREV = B.IDPLANOPREV '+_clinefeed+
        'AND P.SEQPROPOSTA = B.SEQPROPOSTA '+_clinefeed+
        'ORDER BY B.IDSITBENEFICIO '+_clinefeed; 
    end;
  end
  else
  begin
    ssql:=
      'SELECT DISTINCT P.IDPESSOA AS IDTITULAR, P.IDPESSOA AS IDPESSOA, '+_clinefeed+
      '       P.IDPESSJUR, P.IDPLANOPREV AS PLANOBENEF, 0 AS NUMEROPROCESSO, '+_clinefeed+
      '       P.IDPLANOPREV, E.MATRICULA, P.INSCRICAONUMERO, '+_clinefeed+
      '       PF.DATAMORTE, '+ 
      '       P.SEQPROPOSTA, 0 AS IDSITBENEFICIO '+_clinefeed+
      'FROM  ELEGPATRO E, PARTPREVPLAN P, PESSOAFISICA PF  '+_clinefeed+
      'WHERE P.INSCRICAONUMERO = '+asinscricao+' '+_clinefeed+
      'AND PF.IDPESSOA(+) = E.IDPESSOA '+ 
      'AND P.IDPESSJUR = E.IDPESSJUR '+_clinefeed+
      'AND P.IDPESSOA = E.IDPESSOA '+_clinefeed+
      'AND P.FLGDESATIVADO = 0 '+_clinefeed;
  end;
  qryInscricao.close;
  qryInscricao.sql.clear;
  qryInscricao.sql.add(ssql);
  qryInscricao.open;
end;

function TFrmImportaTxt.Valor_(const posicao,tamanho,linha : integer; var bProc :Boolean):string;
 var i : longint;
     temp : string;
begin
  temp  := '';
  bProc := True; 
  if mmArquivo.lines <> nil then
  begin
    If Trim(mmArquivo.lines[linha]) <> '' Then 
      for i:=0 to tamanho-1 do
      Begin
        Try
          temp  := temp+mmArquivo.lines[linha][i+posicao];
        Except
          bProc := False; 
        End;
      End;
  end;
  result:=temp;
end;

function TfrmImportaTxt.TiraZero(a: string):string;
 var i: longint;
     b: boolean;
     stemp : string;
begin
  b:=false;
  stemp:='';
  for i:=1 to length(a) do
  begin
    if a[i]<> '0' then
      b:= true;
    if not(b)and (a[i]='0') then
      a[i]:= ' ';
    stemp:=stemp + a[i];
    if i = length(a)-2 then
      stemp:=stemp + decimalseparator;
  end;
  result:=trim(stemp);
end;

function TFrmImportaTxt.ConverteValor(svalor, scaracdec : string; ndecimal : integer) : real;
var decant : char;
    lrvalor : real;
    i : longint;
begin
  if scaracdec = '' then
  begin
    try
      lrvalor:=strtofloat(svalor);
      if ndecimal <= 0 then
        ndecimal:=2;
      for i:=1 to ndecimal do
        lrvalor:=lrvalor/10;
    except
      lrvalor:=0;
    end;
  end
  else
  begin
    decant:=decimalseparator;
    lrvalor:=0;
    try
      decimalseparator:=scaracdec[1];
      lrvalor:=strtofloat(svalor);
    finally
      decimalseparator:=decant;
    end;
  end;
  result:=lrvalor;
end;

function TfrmImportaTxt.ValidaBeneficio(aqry: twwquery;
  var asmsg: string): boolean;

  // Thiago Melo SOL 208649 Kintana 2015547 Ini
  function retornaNProcessos(qry : TwwQuery) : String;
  var
    processo : String;
  begin
    qry.Filtered := False;
    qry.Filter   := ' IDSITBENEFICIO = 1 ';
    qry.Filtered := True;

    processo := chr(39);

    while not qry.Eof do begin
      processo := processo + qry.FieldByName('NUMEROPROCESSO').AsString;
      qry.Next;

      if not qry.Eof then begin
        processo := processo + chr(39) + ',' + chr(39);
      end else begin
        processo := processo + chr(39);
      end;
    end;
    Result := processo;

    qry.Filtered := False;
    qry.First;
  end;
  // Thiago Melo SOL 208649 Kintana 2015547

begin
  Result := False;
  If cbboxAtivo.itemindex = 0 Then
    Result := True; 

  //TRATAMENTO DE SITUAÇÃO DO BENEFÍCIO INCLUINDO BENEFICIO PREPARADO
  if cbboxAtivo.itemindex > 0 then
  begin
    //benefício ativo ou ativo e preparado apenas aplica mensagem de retido
    if cbboxAtivo.itemindex in [1,3] then
    begin
      if aqry.fieldbyname('IDSITBENEFICIO').asinteger = 2 then
      begin
        asmsg:='Benefício Suspenso';
        exit;
      end;
      Result := True;
    end;

    //benefício cancelado sempre aplica mensagem
    if aqry.fieldbyname('IDSITBENEFICIO').asinteger = 3 then
    begin
      //INCLUIR A DATAMORTE DA PESSOAFISICA PARA EXIBIR MENSAGEM DE FALECIDO
      if aqry.fieldbyname('DATAMORTE').isnull then
        asmsg:='Benefício Encerrado'
      else
        asmsg:='Falecido em '+formatdatetime('dd/mm/yyyy',
          aqry.fieldbyname('DATAMORTE').asdatetime);
      Result := False; 
      exit;
    end;

    if aqry.fieldbyname('IDSITBENEFICIO').asinteger = 5 then
    begin
      asmsg  := 'Benefício Encerrado por Morte do Beneficiário';
      Result := False;
      exit;
    end;

    if not (aqry.fieldbyname('IDSITBENEFICIO').asinteger in [1, 2, 6]) then 
    begin
      Result := False; 
      asmsg  := 'Benef. Pendente Concessão';
      exit;
    end;

    //verifica se benefício está preparado
    if cbboxAtivo.itemindex = 3 then
    begin
      if not FazQuery(qryAux,
               'SELECT 1 '+
               'FROM HSTBENEFBFCIARIO '+
               'WHERE IDTITULAR = '+inttostr(aqry.fieldbyname('IDTITULAR').asinteger)+' '+
               'AND IDPESSOA = '+inttostr(aqry.fieldbyname('IDPESSOA').asinteger)+' '+
               'AND IDPLANOPREV = '+inttostr(aqry.fieldbyname('PLANOBENEF').asinteger)+' '+

               // Thiago Melo SOL 208649 Kintana 2015547
               //'AND NUMEROPROCESSO = '+inttostr(aqry.fieldbyname('NUMEROPROCESSO').asinteger)+' '+
               'AND NUMEROPROCESSO IN ( ' + retornaNProcessos(aqry) + ' ) '+
               // Thiago Melo SOL 208649 Kintana 2015547

               'AND MES = '+Quotedstr(smesref)) then
      begin
        Result := False;
        asmsg:='Sem Benefício Preparado';
        exit;
      end
      else
        Result:=true;
    end;

    if cbboxAtivo.itemindex = 2 then
    begin
      Result := True;
    end;
  end;
end;

procedure TFrmImportaTxt.processar;
 var
     sChave,
     sChaveArquivo,
     sChaveCompara,
     sReferencia,
     ssqlTmpdesc,
     ssqlRubIndiv,
     sNomeExt,
     sNomeInt,
     sNatureza,
     sValorInfo,
     sCodOperacao,
     sCodControle,
     sMesReferencia,
     sValorRegra, sSQL, sIdRegraCalculo  : string;
     ret,
     liordem,
     posicaoM,
     tamanhoM,
     vPosDep,
     vTamDep,
     vPossuiDep,
     a,
     cod,
     lIdRubImp,
     lIdRubExt,
     iidtitular,
     iidpessoa,
     iidpessjur,
     iidplanoprev,
     iseqproposta  : longint;
     bRubDev,
     bSinal,
     lGravouLote   : Boolean;
     nValProc,
     rvalorinfo     : real;
     nTipoConvenio  : Integer; // 0 - Avulso  ; 1 - Continuado
     PosInfo,
     TamInfo,
     PosControle,
     TamControle,
     posOperacao,
     nSequencial,
     nIncluidos,
     nAlterados,
     nExcluidos,
     posMesref,
     iChave,
     iPosCodControle,
     iTamCodControle: Integer;
     bProcessa : Boolean;
     rpercentual: real; 

     lsmsg: string;

     liseqdep: integer; 

     Function FRetornaDado(const posicao,tamanho,linha : integer): Integer;
     var i: longint;
         temp: String;
     begin
       temp:='';
       try
         if (length(mmArquivo.lines[linha]) < posicao+tamanho-1) then
           exit;
         if mmArquivo.lines <> nil then
         begin
           for i:=0 to tamanho do
             temp:=Temp + (mmArquivo.lines[linha-1][i+posicao]);
         end;
       finally
         result:=0;
         if trim(temp) <> '' then
           try
             result:=strToInt(temp);
           except
             result:=0;
           end;
       end;
     end;

     Function FRetornaDado2(const posicao,tamanho,linha : integer): String;
     var i: longint;
         temp: String;
     begin
       temp:='';
       if (length(mmArquivo.lines[linha]) < posicao+tamanho-1) then
         exit;
       if mmArquivo.lines <> nil then
       begin
         for i:=0 to (tamanho-1) do
           temp:=Temp + (mmArquivo.lines[linha][i+posicao]);
       end;
       result:=temp;
     end;

     Function FRetornaSeqRubIndiv : String;
     begin
       with qryAux do
       begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT MAX(SEQRUBRICAINDIV) AS SEQRUBRICAINDIV '+
                 ' FROM RUBRICAINDIV '+
                 ' WHERE IDTITULAR = ' + inttoStr(iidtitular)+
                 ' AND IDEMPRESA   = ' + IntToStr(iIdpessjur)+
                 ' AND IDRUBRICA   = ' + IntToStr(lidrubimp));
         Open;
         if (not IsEmpty) and (FieldByName('SEQRUBRICAINDIV').AsInteger > 0 )
         then result:=IntToStr(FieldByName('SEQRUBRICAINDIV').AsInteger + 1)
         else result:='1';
         Close;
       end;
     end;

     procedure InsereRubricaindiv;
     var rvalrub: real;
         lidseq: integer; 
         ddtfim: tdatetime;
     begin
       //ATRIBUI PERCENTUAL DEFAULT SE EXISTIR
       if rpercentual = 0 then
         rvalrub:=rvalor
       else
         rvalrub:=rpercentual;
       ssqlRubIndiv:='INSERT INTO RUBRICAINDIV (IDPESSOA, IDEMPRESA, '+
                     'IDRUBRICA, NUMOCORRENCIAS, SEQRUBRICAINDIV, VALORRUBRICA, FLGPERMANENTE, '+
                     'PARCELAS, FLGTPRUBMANUT, ANOMESREF, IDTITULAR, IDLOTE, '+
                     'IDFAVORECIDO, FLGPERCENT, FLGPENSAOALIM, '+
                     'IDSEQINTERNOFB, '+ 
                     'RUBRICAPROVENTOPA, FLGBASEPA, IDREGRACALCULO, '+
                     'FLGUSAABONO, IDALIMENTADO, ULTMESPREPARO, DATAINICIO, '+
                     'DATAFINAL '+ 
                     ') VALUES (';

       //IDPESSOA
       ssqlRubIndiv:=ssqlRubIndiv+inttostr(iidpessoa)+', ';
       //IDEMPRESA
       ssqlRubIndiv:=ssqlRubIndiv+inttostr(iidfundacao)+', ';
       //IDRUBRICA
       ssqlRubIndiv:=ssqlRubIndiv+inttostr(lIdRubImp)+', ';
       // NUMOCORRENCIAS
       ssqlRubIndiv:=ssqlRubIndiv+'0, ';
       // SEQRUBRICAINDIV
       ssqlRubIndiv:=ssqlRubIndiv+inttostr(nSequencial)+', ';
       //VALORRUBRICA
       ssqlRubIndiv:=ssqlRubIndiv+Oranumero(formatfloat('#0.00', rvalrub))+', ';

       // FLGPERMANENTE
       If ((nParcelas = 0) or
           (nParcelas = 999))  then   // SOL:92576 - Daniel Begnami
         ssqlRubIndiv:=ssqlRubIndiv+'1, '
       else
         ssqlRubIndiv:=ssqlRubIndiv+'0, ';

       // PARCELAS
       If nParcelas = 0 Then
         ssqlRubIndiv:=ssqlRubIndiv + ' Null, '
       Else
       // SOL:92576 - Daniel Begnami
       begin
         if nParcelas = 999 then
           ssqlRubIndiv:=ssqlRubIndiv+InttoStr(0)+', '
         else
           ssqlRubIndiv:=ssqlRubIndiv+InttoStr(nParcelas)+', ';
       end;
       // FIM - SOL:92576
       // FLGTPRUBMANUT
       ssqlRubIndiv:=ssqlRubIndiv+'1, ';
       // ANOMESREF
       If sMesreferencia <> '' then
         ssqlRubIndiv:=ssqlRubIndiv+QuotedStr(smesreferencia)+', '
       else
         ssqlRubIndiv:=ssqlRubIndiv+QuotedStr(smesref)+', ';
       // IDTITULAR
       ssqlRubIndiv:=ssqlRubIndiv+inttostr(iidtitular)+', ';
       // IDLOTE
       ssqlRubIndiv:=ssqlRubIndiv+inttostr(iidLOTE)+', ';
       // IDFAVORECIDO
       ssqlRubIndiv:=ssqlRubIndiv+inttostr(qryLayoutXColunas.fieldbyname('IDFAVORECIDO').asinteger)+', ';
       // FLGPERCENT
       ssqlRubIndiv:=ssqlRubIndiv+'0, ';
       // FLGPENSAOALIM
       ssqlRubIndiv:=ssqlRubIndiv+'0, ';
       
       lidseq:=LeUltRegistro(nil,'SEQINTERNOFB');
       ssqlRubIndiv:=ssqlRubIndiv+inttostr(lidseq)+', ';
       // RUBRICAPROVENTOPA
       ssqlRubIndiv:=ssqlRubIndiv+'0, ';
       // FLGBASEPA
       ssqlRubIndiv:=ssqlRubIndiv+'0, ';
       // IDREGRACALCULO
       ssqlRubIndiv:=ssqlRubIndiv+QuotedStr(sIdRegraCalculo)+', '; 
       // FLGUSAABONO
       ssqlRubIndiv:=ssqlRubIndiv+'0, ';
       // IDALIMENTADO
       ssqlRubIndiv:=ssqlRubIndiv+'0,';
       //ULTMESPREPARO
       ssqlRubIndiv:=ssqlRubIndiv+QuotedStr(sMesAnterior)+', ';
       // DATAINICIO
       ssqlRubIndiv:=ssqlRubIndiv+' TO_DATE('+QuotedStr(sMesImportacao)+',''DD/MM/YYYY''),';
       //DATAFINAL
       if nParcelas = 0 then
         ssqlRubIndiv:=ssqlRubIndiv + ' Null)'
       else
       begin
         ddtfim:=strtodate(smesimportacao);
         ddtfim:=IncMonth(ddtfim, nParcelas)-1;
         ssqlRubIndiv:=ssqlRubIndiv+' TO_DATE('+
           QuotedStr(formatdatetime('dd/mm/yyyy',ddtfim))+
           ',''DD/MM/YYYY''))';
       end;
       sMesImportacao:='01/'+copy(sMesRefInterface,6,2)+'/'+EditAno.text;
     end;

     procedure InsereTmpDesc;
     var lidseq: integer;
     begin
       ssqlTmpdesc:='INSERT INTO TMPDESC (IDTMPDESC, IDPESSJUR, IDPLANOPREV, '+
                    'IDTITULAR, IDPESSOA, IDFAVORECIDO, IDPROVENTO, IDMOTIVO, '+
                    'MESCOBRANCA, MESREFERENCIA, CODIGOCONTROLE, ORDEM, FLGTIPODESC, VALOR, '+
                    'VALORINFO, FLGDESCFOLHA, IDFUNDACAO, SISTORIGEM, IDMODULO, IDLOTE, '+
                    'SITENVIO, SEQPROPOSTA, REFERENCIA, '+
                    'NUMPARCELAS,'+ 
                    'IDSEQINTERNOFB, '+ 
                    'CODCENTRORESPON, UNIDNEGOC, '+
                    'CODTIPRECDES, RECPAG, PLACONTAD, PLANO, PLACONTAC) VALUES (';

       //IDTMPDESC
       sSqlTmpDesc := sSqlTmpDesc + IntToStr(LeUltRegistro(Nil, 'TMPDESC')) + ', ';
       //IDPESSJUR
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(iidpessjur)+', ';
       //IDPLANOPREV
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(iidplanoprev)+', ';
       //IDTITULAR
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(iidtitular)+', ';
       //IDPESSOA
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(iidpessoa)+', ';
       //IDFAVORECIDO
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(qryLayoutXColunas.fieldbyname('IDFAVORECIDO').asinteger)+', ';
       //IDPROVENTO
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(lIdRubImp)+', ';
       //IDMOTIVO
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(iIdMotivoFolha)+', ';
       //MESCOBRANCA
       ssqlTmpdesc:=ssqlTmpdesc+QuotedStr(smesref)+', ';
       //MESREFERENCIA
       If sMesreferencia <> '' then
         ssqlTmpdesc:=ssqlTmpdesc+QuotedStr(smesreferencia)+', '
       else
         ssqlTmpdesc:=ssqlTmpdesc+QuotedStr(smesref)+', ';
       // CODCONTROLE
       ssqlTmpdesc:=ssqlTmpdesc+QuotedStr(sCodControle)+', ';
       //ORDEM
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(liordem)+', ';
       //FLGTIPODESC
       ssqlTmpdesc:=ssqlTmpdesc+QuotedStr('C')+', ';
       //VALOR
       ssqlTmpdesc:=ssqlTmpdesc+oranumero(formatfloat('#0.00', rvalor))+', ';
       //VALORINFO
       ssqlTmpdesc:=ssqlTmpdesc+oranumero(formatfloat('#0.00', rvalorinfo))+', ';
       //FLGDESCFOLHA
       ssqlTmpdesc:=ssqlTmpdesc+QuotedStr('B')+', ';
       //IDFUNDACAO
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(iidfundacao)+', ';
       //SISTORIGEM
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(Sistema.IdModulo)+', ';
       //IDMODULO
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(Sistema.IdModulo)+', ';
       //IDLOTE
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(iidLOTE)+', ';
       //SITENVIO
       ssqlTmpdesc:=ssqlTmpdesc+QuotedStr('0')+', ';
       //SEQPROPOSTA
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(iseqproposta)+', ';
       //REFERENCIA
       ssqlTmpdesc:=ssqlTmpdesc+'''***'', ';
       // VERIFICAR PARTE CONTÁBIL. ORDEM DE PROCURA:
       // 1º LAYOUTXCOLUNAS, SE EXISTIR (SERÁ DESCONTINUADO)
       // 2º RUBRICAXPLANO (IDPESSJUR, IDRUBRICA, IDPLANOPREV)
       //PARCELA
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(nParcelas)+', '; 
       
       lidseq:=LeUltRegistro(nil,'SEQINTERNOFB');
       ssqlTmpdesc:=ssqlTmpdesc+inttostr(lidseq)+', ';
       if VerificaContabil then
         InsereContabil(qryRubricaXPlano, ssqlTmpdesc);
     end;

     // Processa TMPDESC
     procedure ProcessaAvulso;
     var
        iIdCalculoGeral : Integer;
        lic             : Integer;
        lBerro          : Boolean;
        sMat            : String;
        nPosicao        : Integer;
        iCont           : Integer; 
        bAchou          : Boolean; 
        bProcessa,                 
        bProcessaLinha  : Boolean; 
     begin
       //CONTROLE HEADER E TRAILLER
       if qrylayoutdesconto.fieldbyname('FLGUSAHEADTRAI').asInteger = 0 then
       begin
         nLinhasCabec:=0;
         nLinhasRodape:=0;
       end
       else
       begin
         nLinhasCabec:=qrylayoutdesconto.fieldbyname('LINHASHEADER').asInteger;
         nLinhasRodape:=qrylayoutdesconto.fieldbyname('LINHASTRAILLER').asInteger;
       end;

       iNaoProcessa:=nLinhasCabec+nLinhasRodape; 

       for lic:=(0+nLinhasCabec) to ((mmArquivo.lines.Count-nLinhasRodape)-1) do
       begin
         progressbar1.Position:=progressbar1.Position + 1;
         lbTotalReg.caption:='  Processando registro: '+
         inttostr(progressbar1.Position)+' de '+inttostr(progressbar1.Max)+' ... ';
         lbTotalReg.update;

         bProcessa:=false;

         If Sistema.TipoCliente <> 19991 then 
           bProcessa:=true
         else
         begin
           If trim(mmArquivo.lines[lic]) = '' then
             bProcessa:=false
           else
           begin
             Tamcontrole:=qryLayoutxColunas.FieldByName('TAMCONTROLE').asinteger;
             Poscontrole:=qryLayoutxColunas.FieldByName('COLCONTROLE').asinteger;
             if (Tamcontrole <> 0) and (Poscontrole <> 0) then
             begin
               if Trim(FRetornaDado2(PosControle,TamControle,lic)) = '5' then
                 bProcessa:=true
               else
                 bProcessa:=false;
             end
             else
               bProcessa:=true;
           end;
         end;

         If bProcessa then
         begin
           qryLayoutxColunas.first;
           rvalor:=0;

           sChave:=trim(valor_(posicaoM,tamanhoM,lic, bProcessaLinha));
           If Not bProcessaLinha Then
           Begin
             memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Erro no layout.');
             Inc(iRejeitados);
             Continue;
           End;

           If Trim(sChave) = '' Then begin
             //Exit;               //Renato Visoni SOL 100738 \ Kintana 446709
             Inc(iNaoProcessa);    //Renato Visoni SOL 100738 \ Kintana 446709
             Continue;             //Renato Visoni SOL 100738 \ Kintana 446709
           end;

           if vPossuiDep = 0 then
             liseqdep:=0
           else
             liseqdep:=strtoint(trim(valor_(vPosDep, vTamDep, lic, bProcessaLinha)));

           // processa por matrícula.
           if qryLayoutDesconto.FieldByName('FLGMATRICULA').asinteger = 1 then
           begin
             try
               sChaveArquivo:=schave;
               ListaConta.Add(sChave);
             except
               sChaveArquivo:=Copy(schave,1,pos('-',schave)-1);
             end;

             //inicializa VARIAVEIS 
             iidtitular:=0;
             iidpessoa:=0;
             iidpessjur:=0;
             iidplanoprev:=0;
             iseqproposta:=0;
             sReferencia:='';

             try
               ConstroiQueryMatricula(sChave);
               sChaveCompara:=sChave;
               if pos('%',sChaveCompara)>0 then
                 sChaveCompara:=copy(sChaveCompara,1,length(sChaveCompara)-1);

               if qryMatric.IsEmpty then
               begin
                 listaerro.add(mmArquivo.lines[lic]);
                 if qryLayoutDesconto.FieldByName('FLGMATRICULA').asinteger = 1 then
                 begin
                   if ExisteMatricula(sChaveArquivo) then
                   begin
                     if cbboxAtivo.itemindex > 0 then
                     begin
                       if cboxDemissao.checked then
                       begin
                         memResult.Lines.Add('[Linha '+
                           LeftPad(inttostr(lic+nLinhasCabec+1),6)+
                           '] - Matrícula: '+sChaveArquivo+
                           ' com data de demissão');
                       end
                       else
                       begin
                         memResult.Lines.Add('[Linha '+
                           LeftPad(inttostr(lic+nLinhasCabec+1),6)+
                           '] - Matrícula: '+sChaveArquivo+
                           ' sem benefício.');
                       end;
                     end
                     else
                       memResult.Lines.Add('[Linha '+
                         LeftPad(inttostr(lic+nLinhasCabec+1),6)+
                         '] - Matrícula: '+sChaveArquivo+
                         ' sem plano previdenciário.');
                   end
                   else
                     memResult.Lines.Add('[Linha '+
                       LeftPad(inttostr(lic+nLinhasCabec+1),6)+
                       '] - Matrícula: '+sChaveArquivo+
                       ' não existe no Sistema.');
                 end;
                 PegaValorPorErro(lic);
                 inc(iRejeitados);
                 inc(nRegTotal);
                 continue;
               end;

               if not ValidaBeneficio(qryMatric, lsmsg) then
               begin
                 listaerro.add(mmArquivo.lines[lic]);
                 PegaValorPorErro(lic);
                 inc(iRejeitados);
                 inc(nRegTotal);
                 //TRATA DEPENDENTE SE PARAMETRIZADO
                 if vPossuiDep = 0 then
                   memResult.Lines.Add('[Linha '+
                     LeftPad(inttostr(lic+nLinhasCabec+1),6)+
                     '] - Matrícula: '+sChaveArquivo+' - '+lsmsg+'.')
                 else
                   memResult.Lines.Add('[Linha '+
                     LeftPad(inttostr(lic+nLinhasCabec+1),6)+
                     '] - Matrícula: '+sChaveArquivo+
                     ' Seq.Dep.: '+inttostr(liseqdep)+
                     ' - '+lsmsg+'.');
                 continue;
               end;

               while not qryMatric.eof do
               begin
                 sMat:='';
                 If Pos('-',sistemafolha.mascaramatricula) > 0 then
                 Begin
                   nposicao      := Pos('-',qryMatric.fieldbyname('MATRICULA').asstring);
                   sChaveCompara := Copy(sChave, 1, nPosicao - 1);
                 End
                 else
                 begin
                   if length(sChaveCompara) < length(qryMatric.fieldbyname('MATRICULA').asstring) then
                     nposicao:=length(sChaveCompara)
                   else
                     nposicao:=length(qryMatric.fieldbyname('MATRICULA').asstring);
                   nposicao:=nposicao + 1;
                 end;
                 sMat:=Copy(qryMatric.fieldbyname('MATRICULA').asstring,1,nposicao-1);
                 If trim(sMat) = trim(sChaveCompara) then
                 begin
                   //TRATA QUANDO IDPESSOA É BENEFICIARIO VINCULADO A UMA MATRICULA.
                   //   QRYMATRIC ALTERADA PARA CONTER IDTITULAR E IDPESSOA.
                   iidtitular:=qryMatric.fieldbyname('IDTITULAR').asinteger;
                   iidpessoa:=qryMatric.fieldbyname('IDPESSOA').asinteger;
                   iidpessjur:=qryMatric.fieldbyname('IDPESSJUR').asinteger;
                   if iidtitular <> iidpessoa then
                   begin
                     qryAux.Close;
                     qryAux.Sql.Clear;
                     qryAux.Sql.Add(
                       'SELECT IDPLANOPREV FROM BENEFBFCIARIO '+
                       'WHERE IDSITBENEFICIO = 1 '+
                       'AND IDPESSOA = '+inttostr(iidpessoa));
                     qryAux.Open;
                     if qryAux.isempty then
                       iidplanoprev:=qryMatric.fieldbyname('IDPLANOPREV').asinteger
                     else
                       iidplanoprev:=qryAux.fieldbyname('IDPLANOPREV').asinteger;
                   end
                   else
                     iidplanoprev:=qryMatric.fieldbyname('IDPLANOPREV').asinteger;
                   iseqproposta:=qryMatric.fieldbyname('SEQPROPOSTA').asinteger;
                   sReferencia:=qryMatric.fieldbyname('MATRICULA').asstring;
                   break;
                 end;
                 qryMatric.next;
               end;

               If sMat = '' then
               begin
                 memResult.Lines.Add('A Matrícula: '+sChaveArquivo+' não existe no Sistema.');
                 PegaValorPorErro(lic);
                 inc(iRejeitados);
                 inc(nRegTotal);
                 continue;
               end;

             except
               listaerro.add(mmArquivo.lines[lic]);
               if qryLayoutDesconto.FieldByName('FLGMATRICULA').asinteger = 1 then
                 memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Matrícula: '+sChave+' diverge da máscara definida na Fundação.');
               PegaValorPorErro(lic);
               inc(iRejeitados);
               inc(nRegTotal);
               continue;
             end;  // try
           end
           else
           begin // processa por inscricaonumero
             
             ConstroiQueryInscricao(schave, liseqdep);
             ListaConta.Add(sChave);

             if qryInscricao.IsEmpty then
             begin
               listaerro.add(mmArquivo.lines[lic]);
               if qryLayoutDesconto.FieldByName('FLGMATRICULA').asinteger <> 1 then
                 memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Inscrição: '+sChave+' não existe no Sistema.');
               PegaValorPorErro(lic);
               inc(iRejeitados);
               inc(nRegTotal);
               continue;
             end; // if qryInscricao.IsEmpty

             
             if not ValidaBeneficio(qryInscricao, lsmsg) then
             begin
               listaerro.add(mmArquivo.lines[lic]);
               PegaValorPorErro(lic);
               inc(iRejeitados);
               inc(nRegTotal);
               //TRATA DEPENDENTE SE PARAMETRIZADO
               if (vPossuiDep = 0) or (liseqdep = 0) then
                 memResult.Lines.Add('[Linha '+
                   LeftPad(inttostr(lic+nLinhasCabec+1),6)+
                   '] - Inscrição: '+sChave+' - '+lsmsg+'.')
               else
                 memResult.Lines.Add('[Linha '+
                   LeftPad(inttostr(lic+nLinhasCabec+1),6)+
                   '] - Inscrição: '+sChave+
                   ' Seq.Dep.: '+inttostr(liseqdep)+
                   ' - '+lsmsg+'.');
               continue;
             end;

             iidtitular:=qryInscricao.fieldbyname('IDTITULAR').asinteger;
             iidpessjur:=qryInscricao.fieldbyname('IDPESSJUR').asinteger;
             iidplanoprev:=qryInscricao.fieldbyname('IDPLANOPREV').asinteger;
             sReferencia:=inttostr(qryInscricao.fieldbyname('INSCRICAONUMERO').asinteger);
             iseqproposta:=qryInscricao.fieldbyname('SEQPROPOSTA').asinteger;
           end; // Se inscricao ou matricula
           // seleciona as rubricas por convênio.
           while not(qryLayoutxColunas.eof) do
           begin
             posparc  :=0;
             bRubDev  :=False;
             bSinal   :=False;
             posValor :=qryLayoutxColunas.fieldbyname('COLVALOR').ASinteger;
             tamValor :=qryLayoutxColunas.fieldbyname('TAMVALOR').asinteger;
             PegaParcela(lic);

	     If qryLayoutxColunas.fieldbyname('COLNATUREZA').ASInteger > 0 Then 
             Begin
               sNatureza:=Fretornadado2(qryLayoutxColunas.fieldbyname('COLNATUREZA').ASInteger,1,lic);
               If ((sNatureza = qrylayoutxcolunas.fieldbyname('CARACNATUREZA').asString) and (sNatureza <> '')) then
               begin
                 bRubDev:=True;
                 bSinal:=True;
               end;
             end;

             // Trata o valor
             svalor:=trim(valor_(posvalor,tamvalor,lic, bProcessaLinha));
             If Not bProcessaLinha Then
             Begin
               memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Erro no layout.');
               Inc(iRejeitados);
               Break;
             End;
             rvalor:=ConverteValor(svalor,
                                   qryLayoutxColunas.fieldbyname('caracdecimal').asstring,
                                   qryLayoutxColunas.fieldbyname('numdecimais').asinteger);
             nValRej:=nValRej+rValor; //PRESSUPOE QUE VAI DAR ERRO. SE CONSEGUIR PROCESSAR FAZ O INVERSO
             //----------------------------------------------------------------------
             // Trata valor informativo
             If Sistema.TipoCliente <> 19991 then {<> DE FUNCEF}
             begin
               posValor  :=qryLayoutxColunas.fieldbyname('COLVALINFO').ASinteger;
               tamValor  :=qryLayoutxColunas.fieldbyname('TAMVALINFO').asinteger;

               svalorinfo := trim(valor_(posvalor,tamvalor,lic, bProcessaLinha));
               If Not bProcessaLinha Then
               Begin
                 memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Erro no layout.');
                 Inc(iRejeitados);
                 Break;
               End;

               If trim(sValorinfo) = '' then
                 svalorinfo:='0';

               rValorinfo:=ConverteValor(svalorinfo,
                           qryLayoutxColunas.fieldbyname('caracdecimal').asstring,
                           qryLayoutxColunas.fieldbyname('numdecimais').asinteger);
             end
             else
               rValorInfo := 0;

             //-------------------------------------------------------------------
             (* Se marcado Abono Anual, atribui valor da variavel sAbonoAnual *)
             If chkAbonoAnual.Checked then
             begin
               sMesReferencia:= sAbonoAnual;
               iIdMotivoFolha:=prmIDMOTIVOABONO;
             end
             else
             begin
               iIdMotivoFolha:=prmIDMOTIVOFOLHABEN;
               // Pega o Mes de Referencia do arquivo
               posMesRef     :=qryLayoutxColunas.fieldbyname('COLMESREF').asInteger;
               If posMesref > 0 then
               begin
                 sMesreferencia:=FRetornadado2(posMesref,6,lic);
                 sMesreferencia:=Copy(sMesreferencia,1,4)+'/'+Copy(sMesreferencia,5,2);
               end
               else
                 sMesreferencia:='';
             end;
             //-------------------------------------------------------------------

             (* CODIGO DE CONTROLE *)
             (* Pega o Código de Controle no arquivo *)
             iPosCodControle:= qryLayoutxColunas.fieldbyname('COLCONTROLE').asInteger;
             iTamCodControle:= qryLayoutxColunas.fieldbyname('TAMCONTROLE').asInteger;
             If (iPosCodControle > 0) And (iTamCodControle > 0) then
               sCodControle:= FRetornadado2(iPosCodControle,iTamCodControle,lic)
             else
               sCodControle:='';
             (* ==================================== *)

             //-------------------------------------------------------------------
             // Pega o codigo da rubrica
             // O arquivo contem apenas uma rubrica
             lIdRubImp:=qryLayoutxColunas.fieldbyname('IDRUBRICA').asinteger;
             If lIdRubImp = 0 then
             begin
               // O arquivo Contem mais de uma rubrica
               posParc  :=qryLayoutxColunas.fieldbyname('COLRUBRICA').ASinteger;
               tamParc  :=qryLayoutxColunas.fieldbyname('TAMRUBRICA').asinteger;

	       If Sistema.TipoCliente <> 19991 then {<> DE FUNCEF}
                 try
                   lIdRubImp:=strtoInt(TRIM(FRetornaDado2(posParc,tamParc,lic)));
                 except
                   memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Rubrica inválida ou não definida no layout.');
                   inc(iRejeitados);
                   Break;
                 end
               else
               begin
                 PosInfo   := qryLayoutxColunas.fieldbyname('COLVALINFO').ASinteger;
                 TamInfo   := qryLayoutxColunas.fieldbyname('TAMVALINFO').ASinteger;
                 lIdRubImp := strtoInt(TRIM(FRetornaDado2(posParc,tamParc,lic))+
                                       TRIM(FRetornadado2(posInfo,tamInfo,lic)));
               end;
             end
             else
             begin
               if (bRubDev) then
                 lIdRubImp:=qryLayoutxColunas.fieldbyname('IDRUBRICADEVOL').asinteger
               else
                 if (bSinal) then
                   lIdRubImp:=qryLayoutxColunas.fieldbyname('IDRUBRICA').asinteger;
             end;

             If Sistema.TipoCliente <> 19991 then {<> DE FUNCEF}
             begin
               If SistemaFolha.FlgUsaCodRubExt = 0 then
               begin
                 qryRubExternaXInterna.close;
                 qryRubExternaXInterna.parambyname('IDPROVENTO').asinteger:=lIdRubImp;
                 qryRubExternaXInterna.Open;
                 lIdRubExt :=lIdRubImp ;
                 lIdRubImp:=qryRubExternaXInterna.fieldbyname('IDPROVENTO').asInteger;
                 sNomeExt :=qryRubExternaXInterna.fieldbyname('DESCRPROVDESC').asString;
                 sNomeInt :=qryRubExternaXInterna.fieldbyname('DESCRICAO').asString;
               end
               else
               begin
                 qryRubInternaXExterna.close;
                 qryRubInternaXExterna.parambyname('IDPROVENTO').asInteger:=lIdRubImp;
                 qryRubInternaXExterna.Open;
                 try
                   lIdRubExt :=StrToInt(qryRubInternaXExterna.fieldbyname('CODPROVDESC').asString);
                 except
                   lIdRubExt:=0;
                 end;
                 sNomeExt :=qryRubInternaXExterna.fieldbyname('DESCRPROVDESC').asString;
                 sNomeInt :=qryRubInternaXExterna.fieldbyname('DESCRICAO').asString;
               end;
             end
             else
             begin
               If (SistemaFolha.FlgUsaCodRubExt = 0) or
                   not qryLayoutxColunas.fieldbyname('IDRUBRICA').isnull then // Trabalha com o codigo externo
               begin
                 qryRubInternaXExterna.close;
                 qryRubInternaXExterna.parambyname('IDPROVENTO').asInteger:=lIdRubImp;
                 qryRubInternaXExterna.Open;
                 lIdRubExt :=StrToInt(qryRubInternaXExterna.fieldbyname('CODPROVDESC').asString);
                 sNomeExt :=qryRubInternaXExterna.fieldbyname('DESCRPROVDESC').asString;
                 sNomeInt :=qryRubInternaXExterna.fieldbyname('DESCRICAO').asString;
               end
               else
               begin
                 qryRubExternaXInternaCont.close;
                 qryRubExternaXInternaCont.parambyname('CODPROVDESC').asstring:=InttoStr(lIdRubImp);
                 qryRubExternaXInternaCont.Open;
                 lIdRubExt :=lIdRubImp ;
                 lIdRubImp:=qryRubExternaXInternacont.fieldbyname('IDPROVENTO').asInteger;
                 sNomeExt :=qryRubExternaXInternacont.fieldbyname('DESCRPROVDESC').asString;
                 sNomeInt :=qryRubExternaXInternacont.fieldbyname('DESCRICAO').asString;
               end;
             end;
             //----------------------------------------------------------------------------
             // VERIFICA OS PARAMETROS CONTABEIS NA RUBRICAXPLANO
             qryRubricaxPlano.close;
             qryrubricaxplano.ParamByName('IDPESSJUR').asInteger  :=iidpessjur;
             qryrubricaxplano.ParamByName('IDRUBRICA').asInteger  :=lIdRubImp;
             qryrubricaxplano.ParamByName('IDPLANOPREV').asInteger:=iidplanoprev;
             qryRubricaxplano.Open ;

             If not qryRubricaxPlano.IsEmpty then
             begin
               // RUBRICA DE PROVENTO
               If qryRubricaxPlano.fieldbyname('FLGDESCONTO').asInteger = 0 then
               begin
                 If ((qryRubricaxplano.fieldbyname('codtiprecdes').AsString = '') or
                     (qryRubricaxplano.fieldbyname('placontad').AsString    = '')) then
                 begin
                   listaerro.add(mmArquivo.lines[lic]);
                   If SistemaFolha.FlgUsaCodRubExt = 1 then
                     memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Rubrica '+InttoStr(lIdRubExt)+
                                         ' não está com a parametrização contábil preenchida corretamente. '+
                                         ' Favor verificar no Cadastro de Associação de Rubricas por Plano !')
                   else
                     memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Rubrica '+InttoStr(lIdRubImp)+
                                         ' não está com a parametrização contábil preenchida corretamente. '+
                                         ' Favor verificar no Cadastro de Associação de Rubricas por Plano !');
                   inc(iRejeitados);
                   inc(nRegTotal);
                   qryLayoutxColunas.next;
                   break;
                 end;
               end
               else
               // RUBRICA DE DESCONTO
               begin
                 //Trata RUBRICA DE DESCONTO
                 If qryRubricaxPlano.fieldbyname('FLGDESCONTO').asInteger = 1 then
                 begin
                   if ((qryRubricaxplano.fieldbyname('codtiprecdes').AsString = '') or
                       (qryRubricaxplano.fieldbyname('placontac').AsString    = '')) then
                   begin
                     listaerro.add(mmArquivo.lines[lic]);
                     If SistemaFolha.FlgUsaCodRubExt = 1 then
                       memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Rubrica '+InttoStr(lIdRubExt)+
                                           ' não está com a parametrização contábil preenchida corretamente. '+
                                           ' Favor verificar no Cadastro de Associação de Rubricas por Plano !')
                     else
                       memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Rubrica '+InttoStr(lIdRubImp)+
                                           ' não está com a parametrização contábil preenchida corretamente. '+
                                           ' Favor verificar no Cadastro de Associação de Rubricas por Plano !');
                     inc(iRejeitados);
                     inc(nRegTotal);
                     qryLayoutxColunas.next;
                     break;
                   end;
                 end;
               end;
             end;
             // alimenta variáveis utilizadas na função VerificaContabil.
             sIdPessjur:=iidPessjur;
             sIdRubrica:=lIdRubImp;
             sIdPlanoPrev:=iidPlanoprev;

             if vPossuiDep > 0 then
             begin
               try
                 qryDepentIt.close;
                 qryDepentIt.ParamByName('IDTITULAR').AsInteger:=iidtitular;

                 qryDepentIt.ParamByName('NUMSEQUENCIA').AsInteger:=StrToInt(trim(valor_(vPosDep,vTamDep,lic, bProcessaLinha)));
                 If Not bProcessaLinha Then
                 Begin
                   memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Erro no layout.');
                   Inc(iRejeitados);
                   Break;
                 End;

                 qryDepentIt.open;
                 if qryDepentIt.isempty then
                 begin
                   listaerro.add(mmArquivo.lines[lic]);
                   memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Titular '+ sReferencia +' não possui dependente cadastrado.');
                   inc(iRejeitados);
                   inc(nRegTotal);
                   qryLayoutxColunas.next;
                   break;
                 end;
                 iIdPessoa:=qryDepentIt.fieldbyname('IDPESSOA').AsInteger;
               except
                 listaerro.add(mmArquivo.lines[lic]);
                 memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Sequencial do dependente inválido. Titular: '+sReferencia);
                 inc(iRejeitados);
                 inc(nRegTotal);
                 qryLayoutxColunas.next;
                 break;
               end;
             end
             else
               //TRATA QUANDO IDPESSOA É BENEFICIARIO VINCULADO A UMA MATRICULA
               if iidpessoa = 0 then
                 iIdPessoa:=iidtitular;
               // verifica se ignora ou atualiza VALORES.
             with qryVerificaReg do
             begin
               ssqlTmpdesc:=' SELECT COUNT(*) AS TOTAL ' +
                            ' FROM TMPDESC '+
                            ' WHERE MESREFERENCIA = '+quotedstr(sMesref)+
                              ' AND IDTITULAR       = '+IntToStr(iidtitular)+
                              ' AND IDPESSOA        = '+IntToStr(iidpessoa)+
                              ' AND IDPROVENTO      = '+IntToStr(lIdRubImp)+
                              ' AND IDLOTE          = '+IntToStr(iidLOTE)+
                              ' AND IDPLANOPREV     = '+IntToStr(iidplanoprev)+
                              ' AND IDPESSJUR       = '+IntToStr(iidpessjur);
               close;
               sql.clear;
               sql.add(ssqlTmpdesc);
               open;
               if FieldByName('TOTAL').AsInteger > 0 Then
               begin
                 Case rgDuplicados.ItemIndex of
                   0 : begin  // ignorar
                         inc(iIgnorados);
                         qryLayoutxColunas.next;
                         Continue;
                       end;

                   1 : begin  // atualizar
                         ssqlTmpdesc:=' UPDATE TMPDESC SET VALOR = '+oranumero(formatfloat('#0.00', rvalor))+
                                      ' WHERE IDPESSJUR = '+inttostr(iidpessjur)+
                                        ' AND IDPLANOPREV = '+inttostr(iidplanoprev)+
                                        ' AND IDTITULAR = '+inttostr(iidtitular)+
                                        ' AND IDPESSOA = '+inttostr(iidpessoa)+
                                        ' AND IDPROVENTO = '+inttostr(lIdRubImp)+
                                        ' AND IDLOTE = '+inttostr(iidLOTE)+
                                        ' AND MESREFERENCIA = '+QuotedStr(smesref)+
                                        ' AND MESCOBRANCA = '+QuotedStr(smesref);
                       end;

                   2 : begin  // somar
                         ssqlTmpdesc:=' UPDATE TMPDESC SET VALOR = VALOR + '+oranumero(formatfloat('#0.00', rvalor))+
                                      ' WHERE IDPESSJUR = '+inttostr(iidpessjur)+
                                        ' AND IDPLANOPREV = '+inttostr(iidplanoprev)+
                                        ' AND IDTITULAR = '+inttostr(iidtitular)+
                                        ' AND IDPESSOA = '+inttostr(iidpessoa)+
                                        ' AND IDPROVENTO = '+inttostr(lIdRubImp)+
                                        ' AND IDLOTE = '+inttostr(iidLOTE)+
                                        ' AND MESREFERENCIA = '+QuotedStr(smesref)+
                                        ' AND MESCOBRANCA = '+QuotedStr(smesref);
                       end;

                   3 : begin // aceitar as duplicidades
                         InsereTmpDesc;
                         //COLOCAR AS RUBRICAS SEPARADAS PARA A PREVIA
                         inc(liordem);
                       end;
                 end; // Case
               end
               else
               begin
                 // não há registro na tmpdesc (1º importação)
                 InsereTmpdesc;
                 inc(liordem);
               end;
             end; // with
             try
               nValTotal:=nValtotal+rValor;
               nRegTotal:=nRegTotal+1;
               qryTmpdesc.close;
               qryTmpdesc.sql.clear;
               qryTmpdesc.sql.add(ssqlTmpdesc);
               qryTmpDesc.execsql;
               inc(iSucesso);
               nValProc:=nValProc+rValor;
               nValRej:=nValRej-rValor;
             except
               memResult.Lines.Add('[Linha '+LeftPad(inttostr(lic+nLinhasCabec+1),6)+'] - Erro na inclusão/atualização da rubrica. Matrícula/inscrição: '+ sReferencia);
               PegaValorPorErro(lic);
               inc(iRejeitados);
             end;
             if not cboxConfirma.checked then 
               if nRegTotal mod 100 = 0 then
               begin
                 dtmBaseDados.dbBaseDados.Commit;
                 dtmBaseDados.dbBaseDados.StartTransaction;
               end;
             qryLayoutxColunas.Next;
           end;
         end // bProcessa
         else
           inc(iNaoProcessa); 
         memResult.update;
         if lic mod 100 = 0 then
           application.processmessages;
       end; // for
     end;
     //-------------------------------------------------------------------------------------
     // Processa RUBRICAINDIV
     // O ARQUIVO A SER PROCESSADO para este tipo de convenio PRECISA OBRIGATORIAMENTE
     // TER O CODIGO DA OPERACAO PREENCHIDO (I- Inclusao;  A - Alteração ; E - Exclusao)
     procedure ProcessaContinuado;
     var
        lilinha,I     : Integer;
        lBerro        : Boolean;
        sMat,ssqlSeq  : String;
        nPosicao      : Integer;
        lstmatriculas : tstringlist;
        iCont         : Integer; 
        bAchou,
        bProcessaLinha : Boolean;
        inumocormax, inumrub: integer;
     begin
       Lstmatriculas:=TStringList.Create;
       Lstmatriculas.Clear;
       //CONTROLE HEADER E TRAILLER
       if qrylayoutdesconto.fieldbyname('FLGUSAHEADTRAI').asInteger = 0 then
       begin
         nLinhasCabec:=0;
         nLinhasRodape:=0;
       end
       else
       begin
         nLinhasCabec:=qrylayoutdesconto.fieldbyname('LINHASHEADER').asInteger;
         nLinhasRodape:=qrylayoutdesconto.fieldbyname('LINHASTRAILLER').asInteger;
       end;

       iNaoProcessa:=nLinhasCabec+nLinhasRodape; 

       for lilinha:=nLinhasCabec to ((mmArquivo.lines.Count-nLinhasRodape)-1) do
       begin
         try
           progressbar1.Position:=progressbar1.Position + 1;
           lbTotalReg.caption:='  Processando registro: '+
             inttostr(progressbar1.Position)+' de '+inttostr(progressbar1.Max)+' ... ';
           bProcessa:=false ;

           If Sistema.TipoCliente <> 19991 then {<> DE FUNCEF}
             bProcessa:=true
           else
           begin
             if trim(mmArquivo.lines[lilinha]) = '' then
               bProcessa:=false
             else
             begin
               Tamcontrole:=qryLayoutxColunas.fieldbyname('TAMCONTROLE').ASinteger;
               Poscontrole:=qryLayoutxColunas.fieldbyname('COLCONTROLE').ASinteger;
               If trim(FRetornaDado2(PosControle,TamControle,lilinha))  = '5' then
                 bProcessa:=true
               else
                 bProcessa:=false;
             end;
           end;

           If bProcessa then
           begin
             qryLayoutxColunas.first;
             rvalor:=0;

             sChave := trim(valor_(posicaoM, tamanhoM, lilinha, bProcessaLinha));
             If Not bProcessaLinha Then
             Begin
               memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Erro no layout.');
               Inc(iRejeitados);
               Continue;
             End;

             // processa por matrícula.
             if qryLayoutDesconto.FieldByName('FLGMATRICULA').asinteger = 1 then
             begin
               sChaveArquivo:=schave;
               ListaConta.Add(sChave);

	       try
                 ConstroiQueryMatricula(sChave);
                 sChaveCompara:=sChave;
                 if pos('%',sChaveCompara)>0 then
                   sChaveCompara:=copy(sChaveCompara,1,length(sChaveCompara)-1);
                 if qryMatric.IsEmpty then
                 begin
                   listaerro.add(mmArquivo.lines[lilinha]);
                   if qryLayoutDesconto.FieldByName('FLGMATRICULA').asinteger = 1 then
                   begin
                     if ExisteMatricula(sChaveArquivo) then
                     begin
                       if cbboxAtivo.itemindex > 0 then
                       begin
                         if cboxDemissao.checked then
                         begin
                           memResult.Lines.Add('[Linha '+
                             LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+
                             '] - Matrícula: '+sChaveArquivo+
                             ' com data de demissão');
                         end
                         else
                         begin
                           memResult.Lines.Add('[Linha '+
                             LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+
                             '] - Matrícula: '+sChaveArquivo+
                             ' sem benefício.');
                         end;
                       end
                       else
                         memResult.Lines.Add('[Linha '+
                           LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+
                           '] - Matrícula: '+sChaveArquivo+
                           ' sem plano previdenciário.');
                     end
                     else
                       memResult.Lines.Add('[Linha '+
                         LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+
                         '] - Matrícula: '+sChaveArquivo+
                         ' não existe no Sistema.');
                   end;
                   inc(iRejeitados);
                   inc(nRegTotal);
                   continue;
                 end;

                 if not ValidaBeneficio(qryMatric, lsmsg) then
                 begin
                   listaerro.add(mmArquivo.lines[lilinha]);
                   PegaValorPorErro(lilinha);
                   inc(iRejeitados);
                   inc(nRegTotal);
                   memResult.Lines.Add('[Linha '+
                     LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+
                     '] - Matrícula: '+sChaveArquivo+' - '+lsmsg+'.');
                   continue;
                 end;

                 while not qryMatric.eof do
                 begin
                   sMat:='';
                   If Pos('-',sistemafolha.mascaramatricula) > 0 then
                     nposicao:=Pos('-',qryMatric.fieldbyname('MATRICULA').asstring)
                   else
                   begin
                     nposicao:=length(qryMatric.fieldbyname('MATRICULA').asstring);
                     nposicao:=nposicao + 1;
                   end;
                   sMat:=Copy(qryMatric.fieldbyname('MATRICULA').asstring,1,nposicao-1);
                   If trim(sMat) = trim(sChaveCompara) then
                   begin
                     //TRATA QUANDO IDPESSOA É BENEFICIARIO VINCULADO A UMA MATRICULA.
                     //   QRYMATRIC ALTERADA PARA CONTER IDTITULAR E IDPESSOA.
                     iidtitular:=qryMatric.fieldbyname('IDTITULAR').asinteger;
                     iidpessoa:=qryMatric.fieldbyname('IDPESSOA').asinteger;
                     iidpessjur:=qryMatric.fieldbyname('IDPESSJUR').asinteger;
                     if iidtitular <> iidpessoa then
                     begin
                       qryAux.Close;
                       qryAux.Sql.Clear;
                       qryAux.Sql.Add(
                             'SELECT IDPLANOPREV FROM BENEFBFCIARIO '+
                             'WHERE IDSITBENEFICIO = 1 '+
                             'AND IDPESSOA = '+inttostr(iidpessoa));
                       qryAux.Open;
                       if qryAux.isempty then
                         iidplanoprev:=qryMatric.fieldbyname('IDPLANOPREV').asinteger
                       else
                         iidplanoprev:=qryAux.fieldbyname('IDPLANOPREV').asinteger;
                     end
                     else
                       iidplanoprev:=qryMatric.fieldbyname('IDPLANOPREV').asinteger;
                     iseqproposta:=qryMatric.fieldbyname('SEQPROPOSTA').asinteger;
                     sReferencia:=qryMatric.fieldbyname('MATRICULA').asstring;
                     break;
                   end;
                   qryMatric.next;
                 end;

                 If sMat = '' then
                 begin
                   memResult.Lines.Add('A Matrícula: '+sChaveArquivo+' não existe no Sistema.');
                   inc(iRejeitados);
                   inc(nRegTotal);
                   continue;
                 end;
               except
                 listaerro.add(mmArquivo.lines[lilinha]);
                 if qryLayoutDesconto.FieldByName('FLGMATRICULA').asinteger = 1 then
                   memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Matrícula: '+sChave+' diverge da máscara definida na Fundação.');
                 inc(iRejeitados);
                 inc(nRegTotal);
                 continue;
               end;  // try
             end
             else
             begin // processa por inscricaonumero
               ConstroiQueryInscricao(schave, liseqdep);
               ListaConta.Add(sChave);

	       if qryInscricao.IsEmpty then
               begin
                 listaerro.add(mmArquivo.lines[lilinha]);
                 if qryLayoutDesconto.FieldByName('FLGMATRICULA').asinteger <> 1 then
                   memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Inscrição '+sChave+' não consta no cadastro.');
                 inc(iRejeitados);
                 inc(nRegTotal);
                 continue;
               end; 

               iidtitular:=qryInscricao.fieldbyname('IDPESSOA').asinteger;
               iidpessoa:=iidtitular; 
               iidpessjur:=qryInscricao.fieldbyname('IDPESSJUR').asinteger;
               iidplanoprev:=qryInscricao.fieldbyname('IDPLANOPREV').asinteger;
               sReferencia:=inttostr(qryInscricao.fieldbyname('INSCRICAONUMERO').asinteger);
               iseqproposta:=qryInscricao.fieldbyname('SEQPROPOSTA').asinteger;
             end; // Se inscricao ou matricula

	     // seleciona as rubricas por convênio.
             while not(qryLayoutxColunas.eof) do
             begin
               posParc  :=0;
               bRubDev  :=False;
               bSinal   :=False;
               // Pega o Valor da Rubrica -----------------------------------------
               posValor :=qryLayoutxColunas.fieldbyname('COLVALOR').ASinteger;
               tamValor :=qryLayoutxColunas.fieldbyname('TAMVALOR').asinteger;

               sNatureza:=Fretornadado2(qryLayoutxColunas.fieldbyname('COLNATUREZA').ASInteger,1,lilinha);
               If ((sNatureza = qrylayoutxcolunas.fieldbyname('CARACNATUREZA').asString) and (sNatureza <> '')) then
               begin
                 bRubDev:=True;
                 bSinal:=True;
               end;

               //------------------------------------------------------------------------------
               // TRATA O VALOR
               svalor:=trim(valor_(posvalor,tamvalor,lilinha, bProcessaLinha));
               If Not bProcessaLinha Then
               Begin
                 memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Erro no layout.');
                 Inc(iRejeitados);
                 Break;
               End;

               rvalor:=ConverteValor(svalor,
                 qryLayoutxColunas.fieldbyname('caracdecimal').asstring,
                 qryLayoutxColunas.fieldbyname('numdecimais').asinteger);

               If qryLayoutxColunas.fieldbyname('IDREGRA').asinteger  = 0 then
                 sIdRegraCalculo:=''
               else
                 sIdRegraCalculo:=inttostr(qryLayoutxColunas.fieldbyname('IDREGRA').asinteger);

               //-----------------------------------------------------------------------------
               // Pega o codigo da rubrica
               lIdRubImp:=qryLayoutxColunas.fieldbyname('IDRUBRICA').asinteger;

               If lIdRubImp = 0 then
               begin
                 posParc  :=qryLayoutxColunas.fieldbyname('COLRUBRICA').ASinteger;
                 tamParc  :=qryLayoutxColunas.fieldbyname('TAMRUBRICA').asinteger;

                 If Sistema.TipoCliente <> 19991 then {<> DE FUNCEF}
                 begin
                   lIdRubImp:=strtoInt(TRIM(FRetornaDado2(posParc,tamParc,lilinha)));
                 end
                 else
                 begin
                   PosInfo  :=qryLayoutxColunas.fieldbyname('COLVALINFO').ASinteger;
                   TamInfo  :=qryLayoutxColunas.fieldbyname('TAMVALINFO').ASinteger;
                   lIdRubImp:=strtoInt(TRIM(FRetornaDado2(posParc,tamParc,lilinha))+
                                  TRIM(FRetornadado2(posInfo,tamInfo,lilinha)));
                 end;
               end
               else
               begin
                 if (bRubDev) then
                   lIdRubImp:=qryLayoutxColunas.fieldbyname('IDRUBRICADEVOL').asinteger
                 else
                   if (bSinal) then
                     lIdRubImp:=qryLayoutxColunas.fieldbyname('IDRUBRICA').asinteger;
               end;

               If (SistemaFolha.FlgUsaCodRubExt = 0) or
                  not qryLayoutxColunas.fieldbyname('IDRUBRICA').isnull then // Trabalha com o codigo externo
               begin
                 qryRubInternaXExterna.close;
                 qryRubInternaXExterna.parambyname('IDPROVENTO').asInteger:=lIdRubImp;
                 qryRubInternaXExterna.Open;
                 lIdRubExt :=StrToInt(qryRubInternaXExterna.fieldbyname('CODPROVDESC').asString);
                 sNomeExt :=qryRubInternaXExterna.fieldbyname('DESCRPROVDESC').asString;
                 sNomeInt :=qryRubInternaXExterna.fieldbyname('DESCRICAO').asString;
               end
               else
               begin
                 qryRubExternaXInternaCont.close;
                 qryRubExternaXInternaCont.parambyname('CODPROVDESC').asstring:=InttoStr(lIdRubImp);
                 qryRubExternaXInternaCont.Open;
                 lIdRubExt :=lIdRubImp ;
                 lIdRubImp:=qryRubExternaXInternacont.fieldbyname('IDPROVENTO').asInteger;
                 sNomeExt :=qryRubExternaXInternacont.fieldbyname('DESCRPROVDESC').asString;
                 sNomeInt :=qryRubExternaXInternacont.fieldbyname('DESCRICAO').asString;
               end;

               qryAux.Close;
               qryAux.Sql.Clear;
               qryAux.Sql.Add(
                 ' SELECT FLGESTADORUB, PRAZO FROM PROVDESC '+
                 ' WHERE IDPROVENTO = '+IntToStr(lIdRubImp));
               qryAux.Open;

               //Testa se existe a rubrica
               If qryAux.IsEmpty Then
               Begin
                 If SistemaFolha.FlgUsaCodRubExt = 1 Then
                 Begin
                   memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Rubrica Inválida: '+InttoStr(lIdRubExt));
                   Inc(iRejeitados);
                   Inc(nRegTotal);
                   qryLayoutxColunas.next;
                   Break;
                 End
                 Else
                 Begin
                   memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Rubrica Inválida: '+InttoStr(lIdRubImp));
                   Inc(iRejeitados);
                   Inc(nRegTotal);
                   qryLayoutxColunas.next;
                   Break;
                 End;
               End;

               // RUBRICAXPLANO
               qryRubricaxPlano.close;
               qryrubricaxplano.ParamByName('IDPESSJUR').asInteger  :=iidpessjur;
               qryrubricaxplano.ParamByName('IDRUBRICA').asInteger  :=lIdRubImp;
               qryrubricaxplano.ParamByName('IDPLANOPREV').asInteger:=iidplanoprev;
               qryRubricaxplano.Open ;

	       If not qryRubricaxPlano.IsEmpty then
               begin
                 // RUBRICA DE PROVENTO
                 If qryRubricaxPlano.fieldbyname('FLGDESCONTO').asInteger = 0 then
                 begin
                   If ((qryRubricaxplano.fieldbyname('codtiprecdes').AsString = '') or
                       (qryRubricaxplano.fieldbyname('placontad').AsString = '')) then
                   begin
                     listaerro.add(mmArquivo.lines[lilinha]);
                     If SistemaFolha.FlgUsaCodRubExt = 1 then
                       memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Rubrica '+InttoStr(lIdRubExt)+
                                           ' não está com a parametrização contábil preenchida corretamente. '+
                                           ' Favor verificar no Cadastro de Associação de Rubricas por Plano !')
                     else
                       memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Rubrica '+InttoStr(lIdRubImp)+
                                           ' não está com a parametrização contábil preenchida corretamente. '+
                                           ' Favor verificar no Cadastro de Associação de Rubricas por Plano !');
                     inc(iRejeitados);
                     inc(nRegTotal);
                     qryLayoutxColunas.next;
                     break;
                   end;
                 end
                 else
                 // RUBRICA DE DESCONTO
                 begin
                   If qryRubricaxPlano.fieldbyname('FLGDESCONTO').asInteger = 1 then
                   begin
                     if ((qryRubricaxplano.fieldbyname('codtiprecdes').AsString = '') or
                         (qryRubricaxplano.fieldbyname('placontac').AsString = '')) then
                     begin
                       listaerro.add(mmArquivo.lines[lilinha]);
                       If SistemaFolha.FlgUsaCodRubExt = 1 then
                         memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Rubrica '+InttoStr(lIdRubExt)+
                           ' não está com a parametrização contábil preenchida corretamente. '+
                           ' Favor verificar no Cadastro de Associação de Rubricas por Plano !')
                       else
                         memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Rubrica '+InttoStr(lIdRubImp)+
                           ' não está com a parametrização contábil preenchida corretamente. '+
                           ' Favor verificar no Cadastro de Associação de Rubricas por Plano !');
                       inc(iRejeitados);
                       inc(nRegTotal);
                       qryLayoutxColunas.next;
                       break;
                     end;
                   end;
                 end;
               end;
               //-------------------------------------------------------------------
               // Pega Nº de Parcelas
               posParc   :=qryLayoutxColunas.fieldbyname('COLPARCELAS').ASinteger;
               tamParc   :=qryLayoutxColunas.fieldbyname('TAMPARCELAS').asinteger;
               If posparc > 0 then
               begin
                 sParcelas :=FRetornaDado2(posParc,tamParc,lilinha);
                 If Trim(sparcelas) = '' Then
                   nparcelas:=0
                 Else
                   nParcelas:=StrToInt(Trim(sParcelas));  
               End
               Else
                 nParcelas:=1;

               If SistemaFolha.FlgEstadoRub = 1 Then
               Begin
                 If qryAux.FieldByName('FLGESTADORUB').AsString = '2' Then
                 Begin
                   If SistemaFolha.FlgUsaCodRubExt = 1 then // Trabalha com o codigo externo
                   Begin
                     memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Rubrica '+InttoStr(lIdRubExt)+
                       ' está com o estado de "bloqueada" - Matricula/Inscrição '+sReferencia+' ');
                   End
                   Else
                   Begin
                     memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Rubrica '+InttoStr(lIdRubImp)+
                       ' está com o estado de "bloqueada" - Matricula/Inscrição '+sReferencia+' ');
                   End;
                   Inc(iRejeitados);
                   Inc(nRegTotal);
                   qryLayoutxColunas.next;
                   Break;
                 End;
               End;

               // Verifica tratamento de Prazo para a rubrica
               If prmFLGUSAPRAZORUB = 1 then
               begin
                 If not qryaux.eof then
                 begin
                   If qryAux.fieldbyname('PRAZO').asInteger  = 2 then
                     nParcelas:=1;
                 End;
               end;

               //-------------------------------------------------------------------
               // Pega o Tipo de Operação
               posOperacao:=qryLayoutxColunas.fieldbyname('COLOPERACAO').asinteger;
               If posOperacao > 0 then
                 sCodOperacao:=FRetornadado2(posOperacao,1,lilinha)
               else
                 sCodOperacao:='';

	       //-------------------------------------------------------------------
               (* Se marcado Abono Anual, atribui valor da variavel sAbonoAnual *)
               If chkAbonoAnual.Checked then
               begin
                 sMesReferencia:= sAbonoAnual;
                 iIdMotivoFolha:=prmIDMOTIVOABONO;
               end
               else
               begin
                 iIdMotivoFolha:=prmIDMOTIVOFOLHABEN;
                 // Pega o Mes de Referencia do arquivo
                 posMesRef:=qryLayoutxColunas.fieldbyname('COLMESREF').asinteger;
                 If posMesref > 0 then
                 begin
                   sMesreferencia:=FRetornadado2(posMesref,6,lilinha);
                   sMesreferencia:=Copy(sMesreferencia,1,4)+'/'+Copy(sMesreferencia,5,2);
                 end
                 else
                   sMesreferencia:='';
               end;

               (* CODIGO DE CONTROLE *)
               (* Pega o Código de Controle no arquivo *)
               iPosCodControle:= qryLayoutxColunas.fieldbyname('COLCONTROLE').asInteger;
               iTamCodControle:= qryLayoutxColunas.fieldbyname('TAMCONTROLE').asInteger;
               If (iPosCodControle > 0) and (iTamCodControle > 0) then
               begin
                 sCodControle:= FRetornadado2(iPosCodControle,iTamCodControle,lilinha);
               end
               else
                 sCodControle:='';

               //CONTROLAR PERCENTUAL DEFAULT E NUMOCORMAX
               qryrubricaxcontabancaria.Close;
               qryrubricaxcontabancaria.ParamByName('IDPESSOA').AsInteger:=
                 qryLayoutXColunas.fieldbyname('IDFAVORECIDO').asinteger; 
               qryrubricaxcontabancaria.ParamByName('IDRUBRICA').AsInteger:=
                 lIdRubImp;
               qryrubricaxcontabancaria.Open;
               inumocormax:=maxint;
               if not qryrubricaxcontabancaria.isempty then
               begin
                 rpercentual:=qryrubricaxcontabancaria.fieldbyname('PERCENTUAL').asfloat;
                 if not qryrubricaxcontabancaria.fieldbyname('NUMOCORMAX').isnull then
                   inumocormax:=qryrubricaxcontabancaria.fieldbyname('NUMOCORMAX').asinteger;
               end;

               if (qryLayoutDesconto.fieldbyname('FLGTIPOCONVENIO').asinteger = 1) and
                  (sCodOperacao = 'I') then
               begin
                 ssql:='SELECT COUNT(*) AS NUM ' +
                       'FROM RUBRICAINDIV '+
                       'WHERE (IDTITULAR = '+IntToStr(iidtitular)+') '+
                       'AND (IDPESSOA = '+IntToStr(iidpessoa)+') '+
                       'AND (IDRUBRICA = '+IntToStr(lIdRubImp)+') '+
                       'AND (NVL(FLGDESATIVADO,0) = 0) '+
                       'AND ((FLGPERMANENTE = 1) '+
                       'OR (NVL(FLGPERMANENTE,0) = 0 AND NUMOCORRENCIAS < PARCELAS))';
                 qryVerificaReg.close;
                 qryVerificaReg.sql.clear;
                 qryVerificaReg.sql.add(ssql);
                 qryVerificaReg.open;
                 inumrub:=qryVerificaReg.fieldbyname('NUM').asinteger;
                 if inumrub+1 > inumocormax then
                 begin
                   memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Rubrica '+InttoStr(lIdRubImp)+
                     ' já tem o máximo de ocorrências lançadas - Matricula/Inscrição '+sReferencia+' ');
                   Inc(iRejeitados);
                   Inc(nRegTotal);
                   qryLayoutxColunas.next;
                   Break;
                 end;
               end;

               //-------------------------------------------------------------------
               If ((sCodOperacao <> 'I') and (sCodOperacao <> '')) then
               begin
                 // Pega o sequencial da rubrica, controlado pela entidade
                 posParc    :=qryLayoutxColunas.fieldbyname('COLOCORRENCIAS').ASinteger;
                 tamParc    :=qryLayoutxColunas.fieldbyname('TAMOCORRENCIAS').asinteger;
                 //TRATA EXCEÇÃO. SE SEQUENCIAL NÃO ESTÁ PREENCHIDO ASSUME IGUAL A 1.
                 try
                   nSequencial:=StrToInt(FRetornaDado2(posParc,tamParc,lilinha));
                 except
                   nSequencial:=1;
                 end;
               end
               else
               begin
                 ssqlSeq:='SELECT MAX(SEQRUBRICAINDIV) AS NOVOSEQ '+
                            'FROM RUBRICAINDIV ' +
                            'WHERE IDTITULAR = '+IntToStr(iidtitular)+' '+
                            'AND IDPESSOA    = '+IntToStr(iidpessoa)+' '+
                            'AND IDRUBRICA   = '+IntToStr(lIdRubImp);
                 qryAux2.close;
                 qryAux2.sql.clear;
                 qryAux2.sql.add(ssqlseq);
                 qryAux2.open;
                 If qryAux2.fieldbyname('NOVOSEQ').asInteger = 0 then
                   nSequencial:=1
                 else
                   nSequencial:=(qryAux2.fieldbyname('NOVOSEQ').asInteger + 1);
               end;
               //-------------------------------------------------------------------

               if vPossuiDep>0 then
               begin
                 try
                   qryDepentIt.close;
                   qryDepentIt.ParamByName('IDTITULAR').AsInteger:=iidtitular;

                   qryDepentIt.ParamByName('NUMSEQUENCIA').AsInteger:=StrToInt(trim(valor_(vPosDep,vTamDep,lilinha, bProcessaLinha)));
                   If Not bProcessaLinha Then
                   Begin
                     memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Erro no layout.');
                     Inc(iRejeitados);
                     Break;
                   End;

                   qryDepentIt.open;
                   if qryDepentIt.isempty then
                   begin
                     listaerro.add(mmArquivo.lines[lilinha]);
                     memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Titular '+sReferencia+' não possui dependente cadastrado.');
                     inc(iRejeitados);
                     inc(nRegTotal);
                     qryLayoutxColunas.next;
                     break;
                   end;
                   iIdPessoa:=qryDepentIt.fieldbyname('IDPESSOA').AsInteger;
                 except
                   listaerro.add(mmArquivo.lines[lilinha]);
                   memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Sequencial do dependente inválido. Titular '+sReferencia);
                   inc(iRejeitados);
                   inc(nRegTotal);
                   qryLayoutxColunas.next;
                   break;
                 end;
               end
               else
                 //TRATA QUANDO IDPESSOA É BENEFICIARIO VINCULADO A UMA MATRICULA
                 if iidpessoa = 0 then
                   iIdPessoa:=iidtitular;
               // Trata o tipo de Operação
               nValTotal :=nValtotal + rValor;
               if sCodOperacao = 'I' then
               begin
                 If ValidaOperacao(iidtitular, iidpessoa, lIdRubImp, 0, iIdFundacao, 'I') Then
                 begin
                   try
                     InsereRubricaindiv;
                     qryTmpdesc.close;
                     qryTmpdesc.sql.clear;
                     qryTmpdesc.sql.add(ssqlRubIndiv);
                     qryTmpDesc.execsql;
                     inc(iSucesso);
                     nIncluidos:=nIncluidos + 1;
                     nValProc:=nValProc+rValor;
                   except
                   //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
                    on e:Exception do
                    begin
                      TratarErro(e.Message);
                     nValRej:=nValRej + rValor;
                     memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Erro na inclusão. Matrícula '+sMat+' Sequencial '+Inttostr(nsequencial));
                   end;
                    //Brunno Mattos - KTN 767861 - SOL 132659 Fim
                     
                   end;
                 end
                 else
                 begin  // ignorar
                   inc(iIgnorados);
                 end;
                 nRegTotal :=nRegTotal + 1;
               end;

               if (sCodOperacao = 'A')  then
               begin
                 If ValidaOperacao(iidtitular, iidpessoa, lIdRubImp, nsequencial, 0, 'A') Then
                 begin
                   if ExecutarQuery(qryAux2,
                       'UPDATE RUBRICAINDIV SET VALORRUBRICA = '+
                       oranumero(formatfloat('#0.00', rvalor))+
                       ', ANOMESREF = ' + Quotedstr(smesref)+
                       ' WHERE IDTITULAR = '+inttostr(iidtitular)+
                       ' AND IDPESSOA = '+inttostr(iidpessoa)+
                       ' AND IDRUBRICA = '+inttostr(lIdRubImp)+
                       ' AND SEQRUBRICAINDIV = '+IntToStr(nsequencial)) then
                   begin
                     nValProc  :=nValProc + rValor;
                     nRegTotal :=nRegTotal + 1;
                     nAlterados:=nAlterados + 1;
                     inc(iSucesso);
                   end
                   else
                   begin
                     nValRej:=nValRej + rValor;
                     inc(iIgnorados);
                     memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Erro na alteração. Matrícula '+sMat+' Sequencial '+Inttostr(nsequencial));
                   end;
                 end
                 else
                 begin
                   nValRej:=nValRej + rValor;
                   inc(iIgnorados);
                   memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Não existe a rubrica para alteração. Matrícula '+sMat+' Sequencial '+Inttostr(nsequencial));
                 end;
               end;

               if sCodOperacao = 'E' then
               begin
                 If ValidaOperacao(iidtitular, iidpessoa, lIdRubImp, nsequencial, 0, 'E') Then
                 begin
                   if ExecutarQuery(qryAux2,
                        'DELETE RUBRICAINDIV '+
                        ' WHERE IDTITULAR = '+inttostr(iidtitular)+
                        ' AND IDPESSOA = '+inttostr(iidpessoa)+
                        ' AND IDRUBRICA = '+inttostr(lIdRubImp)+
                        ' AND SEQRUBRICAINDIV = '+IntToStr(nsequencial)) then
                   begin
                     nValProc  :=nValProc + rValor;
                     nRegTotal :=nRegTotal + 1;
                     nExcluidos:=nExcluidos + 1;
                     LstMatriculas.Add(sMat);
                     inc(iSucesso);
                   end
                   else
                   begin
                     inc(iIgnorados);
                     memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Erro na exclusão. Matrícula '+sMat+' Sequencial '+Inttostr(nsequencial));
                   end;
                 end
                 else
                 begin
                   inc(iIgnorados);
                   memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Não existe a rubrica para exclusão. Matrícula '+sMat+' Sequencial '+Inttostr(nsequencial));
                 end;
               end;

               if not cboxConfirma.checked then 
                 if nRegTotal mod 500 = 0 then
                 begin
                   dtmBaseDados.dbBaseDados.Commit;
                   dtmBaseDados.dbBaseDados.StartTransaction;
                 end;
               qryLayoutxColunas.Next;
             end;
           end
           else //bprocessa
           begin
             inc(iNaoProcessa); 
             continue;
           end;
           memResult.update;
           application.processmessages;
         except 
           on e:exception do
           begin
             listaerro.add(mmArquivo.lines[lilinha]);
             memResult.Lines.Add('[Linha '+LeftPad(inttostr(lilinha+nLinhasCabec+1),6)+'] - Mensagem de erro : '+E.message);
             inc(iRejeitados);
             inc(nRegTotal);
             continue;
           end;
         end;
       end; // for
       If lstmatriculas.count > 0 then
       begin
         memResult.Lines.Add(' ');
         memResult.Lines.Add('Matriculas com Processadas :');
         for I:=0 to lstmatriculas.Count-1 do
            memResult.Lines.Add(lstmatriculas[I]);
       end;
       lstmatriculas.free;
     end;
begin
  // Variaveis para estatistica
  iRejeitados:=0;
  iIgnorados:=0;
  iNaoProcessa:=0; 
  iSucesso:=0;
  nValTotal :=0;
  nRegTotal :=0;
  nIncluidos:=0;
  nAlterados:=0;
  nExcluidos:=0;
  nValRej:=0; 

  PageControl1.ActivePage:=tbsResult;
  memResult.setfocus;

  smesref:=IntToStr(cboxMes.ItemIndex+1);
  if length(smesref) = 1 then
    smesref:='0'+smesref;
  smesref:=EditAno.text+'/'+smesref;

  liordem :=1;
  posicaoM:=qryLayoutDesconto.fieldbyname('COLCODIGO').asinteger;
  tamanhoM:=qryLayoutDesconto.fieldbyname('TAMCODIGO').asinteger;
  vPosDep :=qryLayoutDesconto.fieldbyname('COLCODIGODEP').asinteger;
  vTamDep :=qryLayoutDesconto.fieldbyname('TAMCODIGODEP').asinteger;

  if not qryLayoutDesconto.fieldbyname('COLCODIGODEP').isnull and
     not qryLayoutDesconto.fieldbyname('TAMCODIGODEP').isnull then
    vPossuiDep:=1
  else
    vPossuiDep:=0;

  nTipoConvenio:=qryLayoutDesconto.fieldbyname('FLGTIPOCONVENIO').asinteger;

  memResult.Font.Color:=clWindowText;

  qryLayoutxColunas.close;
  qryLayoutxColunas.ParamByName('IDLAYOUT').asinteger:=qryLayoutDesconto.fieldbyname('IDLAYOUT').asinteger;
  qryLayoutxColunas.open;

  If not dtmBaseDados.dbBaseDados.Intransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;

  //Cria Novo Lote ou carrega um existente.
  //GRAVA CTRLINTERFACE NO INÍCIO, SE NÃO EXISTIR
  if iSitImportacao = 0 then
  begin
    iidLote:=LeUltRegistro(nil,'CTRLINTERFACE');
    GravaLote(True, iidLote, qryLayoutdesconto.fieldbyname('IDLAYOUT').asinteger,
              sMesRef, nValTotal ,nRegTotal);
  end
  else
    iidlote:=qryCtrlInterface.FieldByName('IDLOTE').AsInteger;

  qryDepentIt.prepare;

  // Avulso - TMPDESC
  If ntipoConvenio = 0 then
     ProcessaAvulso
  // continuado - rubricaindiv
  else
     ProcessaContinuado;

  memResult.Lines.Add('');
  memResult.Lines.Add('----------- RESULTADO DA IMPORTAÇÃO ------------------');
  if iSitImportacao = 0 then
    memResult.Lines.Add('Lote criado para esta importação : '+ inttostr(iidlote))
  else
    memResult.Lines.Add('Importação adicionada ao Lote : '+ inttostr(iidlote));

  memResult.Lines.Add('Mês de Referência: '+sMesRef); 
  memResult.Lines.Add('');
  memResult.Lines.Add('Total de Matrículas no Arquivo  : '+Leftpad(IntToStr(ListaConta.Count),6)); 
  memResult.Lines.Add('');
  memResult.Lines.Add('Total de linhas do arquivo      : '+Leftpad(inttostr(mmArquivo.lines.Count),6)); 
  memResult.Lines.Add('Linhas não Processadas          : '+Leftpad(inttostr(iNaoProcessa),6)); 
  if rgDuplicados.itemindex = 0 then
    memResult.Lines.Add('Linhas Ignoradas por existência : '+Leftpad(inttostr(iIgnorados),6));
  memResult.Lines.Add('Linhas Rejeitadas               : '+Leftpad(inttostr(iRejeitados),6));
  memResult.Lines.Add('Linhas Importadas com sucesso   : '+Leftpad(inttostr(iSucesso),6));

  If ntipoConvenio <> 0 then // continuado
  begin
    memResult.Lines.Add('Linhas Incluidas : '+Leftpad(inttostr(nIncluidos),6));
    memResult.Lines.Add('Linhas Alteradas : '+Leftpad(inttostr(nAlterados),6));
    memResult.Lines.Add('Linhas Excluidas : '+Leftpad(inttostr(nExcluidos),6));
  end;

  memResult.Lines.Add('');
  memResult.Lines.Add('Valor Total das rubricas processadas : '+LeftPad(FloatToStrF(nValProc, ffCurrency, 15, 2),15));
  memResult.Lines.Add('Valor Total das rubricas rejeitadas  : '+LeftPad(FloatToStrF(nValRej, ffCurrency, 15, 2),15));
  memResult.Lines.Add('Valor Total das rubricas             : '+LeftPad(FloatToStrF(nValTotal,ffCurrency,15, 2),15));
  memResult.Lines.Add('------------------------------------------------------');
  memResult.update;
  GravaLote(False, iidLote, qryLayoutdesconto.fieldbyname('IDLAYOUT').asinteger,
            sMesRef, nValTotal ,nRegTotal);
  AtualizaStatus(sMesRef);
  memResult.Lines.SaveToFile(lbNomeArqImport.caption+'.resultado');
  listaerro.savetofile(lbNomeArqRej.caption);
  
  if not cboxConfirma.checked then
  begin
    //CONFIRMAÇÃO DA IMPORTAÇÃO GRAVADA NO LOG
    try
      Sistema.GravaLogOperacoes(copy('Conf. import. arq:'+
        extractfilename(lbNomeArqImport.caption),1,60));
    except
    end;
    dtmBaseDados.dbBaseDados.Commit;
  end
  else
  begin
    if (MessageDlg('Confirma importação ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      try
        Sistema.GravaLogOperacoes(copy('Conf. import. arq:'+
          extractfilename(lbNomeArqImport.caption),1,60));
      except
      end;
      dtmBaseDados.dbBaseDados.Commit
    end
    else
      dtmBaseDados.dbBaseDados.rollback;
  end;
  
  qryMatric.close;
  qryInscricao.close;
  qryDepenTit.close;
end;

procedure TfrmImportaTxT.InsereContabil(qry : twwquery; var ssql : string);
begin
  //CODCENTRORESPON
  if not qry.fieldbyname('CODCENTRORESPON').isnull then
    ssql:=ssql+QuotedStr(qry.fieldbyname('CODCENTRORESPON').AsString)+', '
  else
    ssql:=ssql+'NULL, ';
  //UNIDNEGOC
  if not qry.fieldbyname('UNIDNEGOC').isnull then
    ssql:=ssql+inttostr(qry.fieldbyname('UNIDNEGOC').AsInteger)+', '
  else
    ssql:=ssql+'NULL, ';
  //CODTIPRECDES
  if not qry.fieldbyname('CODTIPRECDES').isnull then
    ssql:=ssql+QuotedStr(qry.fieldbyname('CODTIPRECDES').AsString)+', '
  else
    ssql:=ssql+'NULL, ';
  //RECPAG
  if not qry.fieldbyname('RECPAG').isnull then
    ssql:=ssql+QuotedStr(qry.fieldbyname('RECPAG').AsString)+', '
  else
    ssql:=ssql+'NULL, ';
  //PLACONTAD
  if not qry.fieldbyname('PLACONTAD').isnull then
    ssql:=ssql+QuotedStr(qry.fieldbyname('PLACONTAD').AsString)+', '
  else
    ssql:=ssql+'NULL, ';
  //PLANO
  if not qry.fieldbyname('PLANO').isnull then
    ssql:=ssql+inttostr(qry.fieldbyname('PLANO').AsInteger)+', '
  else
    ssql:=ssql+'NULL, ';
  //PLACONTAC
  if not qry.fieldbyname('PLACONTAC').isnull then
    ssql:=ssql+QuotedStr(qry.fieldbyname('PLACONTAC').AsString)+') '
  else
    ssql:=ssql+'NULL) ';
end;

procedure TfrmImportaTxT.AtualizaStatus(sParm : String);
begin
  qryAltLayDesc.Close;
  qryAltLayDesc.Parambyname('NovoPeriodo').asstring:=sParm;
  qryAltLayDesc.Parambyname('Numerolayout').value  :=qryLayoutDesconto.Fieldbyname('IDLAYOUT').Value;
  try
    qryAltLayDesc.execsql;
  except
  end;
end;

Function TfrmImportaTxT.GravaLote(binsert : boolean; numLote, idlayout : longint;
  sMesref : String; Valtotal : Real ; RegTotal : longint) : Boolean;
Var sDescricao, sSQLValues : String;

begin
  if binsert then
  begin
    sDescricao:='Importação de arquivo de Desconto '+
                qryLayoutDesconto.fieldbyname('DESCRICAO').asstring;

    sSQlValues:=''''+sMesref+''',';
    sSQlValues:=sSQLValues + '''B'',';
    sSQLValues:=sSQLValues +inttostr(iidFundacao)+',0,0,0,0,';
    sSQLValues:=sSQLValues + 'NULL,NULL,NULL,NULL,';
    sSQLValues:=sSQLValues + IntToStr(numLote)+',';
    sSQLValues:=sSQLValues + IntToStr(RegTotal)+',';
    sSQLValues:=sSQLValues + Oranumero(FloatToStr(ValTotal))+',';
    sSQLValues:=sSQLValues + 'NULL,NULL,0,'''+sDescricao+''',NULL,'+inttostr(idLayout);
    qryLote.Close;
    qryLote.SQL.Clear;
    qryLote.SQL.Add(' INSERT INTO CTRLINTERFACE ' +
                    ' (MESREFERENCIA,TIPO,IDPESSOA,FLGIDATMP,FLGVOLTATMP,FLGIDAINTERFACE,FLGVOLTAINTERFACE,' +
                    '  DATAIDATMP,DATAVOLTATMP,DATAIDAINTERFACE,DATAVOLTAINTERFA,IDLOTE,NUMREG,VLRTOTAL,' +
                    '  FLGEMITIUCC,DATAEMITIUCC,FLGPREPARADO,DESCRICAO,DATAPREPARO,IDREFERENCIA)' +
                    '  VALUES (' + sSQLValues + ')');
    try
      qryLote.execsql;
      result:=true;
    except
      result:=false;
    end;
  end else
  begin
    qryLote.Close;
    qryLote.SQL.Clear;
    qryLote.SQL.Add(' UPDATE CTRLINTERFACE SET ' +
                    ' NUMREG = NUMREG+'+IntToStr(RegTotal)+','+
                    ' VLRTOTAL = VLRTOTAL+'+Oranumero(FloatToStr(ValTotal))+
                    ' WHERE IDLOTE = '+IntToStr(numLote));
    try
      qryLote.execsql;
      result:=true;
    except
      result:=false;
    end;
  end;
end;

procedure TFrmImportaTxt.Ler(caminho : string);
begin
  mmArquivo.lines.Clear;
  mmArquivo.lines.LoadFromFile(caminho);
  ListaErro.Clear;
  ListaConta.Clear; 
  ListaCritica.Clear; 
  ListaTemp.Clear;
end;

Function TfrmImportatxt.JahImportou : Boolean;
Var
   cMesRef          : String ;
   nMes, nAno       : Integer;
   nMesQry, nAnoQry : Integer;
begin
  // verifica se será atualiza os registro duplicado ou ignorados.
  // opções de tratamento.
  If Length(qryLayoutDesconto.fieldbyname('ULTIMPORT').asstring) > 0 then
  begin
    cMesref:=IntToStr(cboxMes.ItemIndex+1);
    If length(cMesref) = 1 then
      cMesref:='0' + cMesref;
    cMesref:=EditAno.text + '/' + cMesref;
    nMes   :=StrToInt(Copy(cMesRef,6,2));
    nAno   :=StrToInt(Copy(cMesRef,1,4));
    nMesqry:=StrToInt(Copy(qryLayoutDesconto.fieldbyname('ULTIMPORT').asstring,6,2));
    nAnoqry:=StrToInt(Copy(qryLayoutDesconto.fieldbyname('ULTIMPORT').asstring,1,4));
    If nAnoqry <> nAno then
      result:=false
    else
    begin
      If nAno < nAnoqry then
        result:=true
      else If nAno = nAnoqry then
        If nMes <= nMesqry then
          result:=true
        else result:=false;
    end;
  end else result:=false;
end;

procedure TfrmImportaTxt.bbtnSalvarClick(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
     memResult.Lines.SaveToFile(savedlg.filename);
end;

function TfrmImportaTxt.TipoProvento( Tipo : LongInt) : LongInt;
begin
  with QryProvDesc do
  begin
    Close;
    ParambyName('Provento').AsInteger:=Tipo;
    Open;
  end;
  Result:=QryProvDesc.FieldbyName('FLGDESCONTO').AsInteger;
end;

procedure TfrmImportaTxt.CalculaMesReferencia;
begin
  sMesRefInterface:=IntToStr(cboxMes.ItemIndex+1);
  if length(sMesRefInterface) = 1 then
    sMesRefInterface:='0'+sMesRefInterface;
  sMesImportacao:=('01/'+sMesRefInterface+'/'+EditAno.text);
  sMesRefInterface:=EditAno.text+'/'+sMesRefInterface;
  sMesAnterior:=SAnoMesAnterior(sMesRefInterface); 
end;

function TfrmImportaTxt.VerificaContabil: Boolean;
begin
  with qryRubricaXPlano do
  begin
    Close;
    ParamByName('IDPESSJUR').AsInteger:=sidpessjur;
    ParamByName('IDRUBRICA').AsInteger:=sidrubrica;
    ParamByName('IDPLANOPREV').AsInteger:=sidplanoprev;
    try
       Open;
       result:=true;
    except
       result:=false;
    end;
  end;
end;

procedure TfrmImportaTxt.bbtnConfirmarClick(Sender: TObject);
var NovoNome : string;
begin
  inherited;

  //Renato Visoni SOL 98796 Kintana 525569
  NovoNome :='';
  if pos('PROCESSADO',UpperCase(lbNomeArqImport.Caption)) > 0 Then begin
    ShowMessage('Esse arquivo já foi Importado!');
    Exit;
  end;
  //Renato Visoni SOL 98796 Kintana 525569


  if (MessageDlg('Confirma início da importação ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    exit;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Importação arquivo de convênio.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  try
    memResult.Lines.Clear;
    If ((Trim(SistemaFolha.MascaraMatricula) = '') and
        (qryLayoutDesconto.FieldByName('FLGMATRICULA').asinteger = 1)) then
    begin
       ShowMessage('A Máscara para identificação da Matricula não foi definida  !!..');
       exit;
    end;
    if EditAno.text = '' then
    begin
      showmessage('Ano não preenchido ...');
      EditAno.setfocus;
      exit;
    end;
    if cboxMes.text = '' then
    begin
      showmessage('Mês não preenchido ...');
      cboxMes.setfocus;
      exit;
    end;
    if dblcmbLayout.text = '' then
    begin
      showmessage('Layout não preenchido ...');
      dblcmbLayout.setfocus;
      exit;
    end;
    if (not qryCtrlInterface.isempty) and (cmbLote.text = '') then
    begin
      showmessage('Lote não preenchido ...');
      dblcmbLayout.setfocus;
      exit;
    end;
    if ((rgDuplicados.ItemIndex = -1) and (qrylayoutdesconto.fieldbyname('FLGTIPOCONVENIO').asInteger = 0)) then
    begin
      showmessage('A opção de tratamento de registros duplicados deve ser selecionada...');
      exit;
    end;
    if (OpenDialog1.filename = '') or (lbNomeArqImport.Caption ='') then //Renato Visoni SOL 98796 Kintana 525569
    begin
      showmessage('É necessário preencher o arquivo a ser importado.');
      exit;
    end;
    If JahImportou then
    begin
      // verifica os parametros de tratamento de arquivos já importados
      // atualiza,  ignora ou soma
      case rgDuplicados.ItemIndex of
        0: begin
             Showmessage('Arquivo será Re-Importado IGNORANDO os registro duplicados. '+
                         'Permanecerão os valores anteriores.');
           end;
        1: begin
             Showmessage('Arquivo será Re-Importado ATUALIZANDO os registro duplicados.');
           end;
        2: begin
              Showmessage('Arquivo será Re-Importado SOMANDO os valores anteriores '+
                          'aos valores que estão sendo lidos.');
           end;
      end;
    end;
    bbtnConfirmar.Enabled:=false;
    enabled:=false;
    progressbar1.Position:=0;
    progressbar1.visible :=true;
    lbTotalReg.caption:='';
    lbTotalReg.visible   :=true;
    progressbar1.position:=0;
    progressbar1.Max:=mmArquivo.lines.Count;
    processar;
    progressbar1.visible:=false;
    lbTotalReg.visible:=false;

    //Renato Visoni SOL 98796 Kintana 525569
    NovoNome := 'PROCESSADO'+''+ExtractFileName(lbNomeArqImport.Caption);
    RenameFile(lbNomeArqImport.Caption, StringReplace(lbNomeArqImport.Caption,ExtractFileName(lbNomeArqImport.Caption),NovoNome,[rfReplaceAll]) );
    //Renato Visoni SOL 98796 Kintana 525569

  finally
    enabled:=true;
  end;

end;

procedure TfrmImportaTxt.cmbLoteCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //gbAbono.Enabled:=False;
  AcertaDados;
end;

procedure TfrmImportaTxt.AcertaDados;
 var ssql: string;
Begin
  //PEGAR TMPDESC DA FOLHA FLGTIPODESC = 'B' E NÃO EXECUTAR ESTE PASSO SE NENHUM LOTE SELECIONADO
  If not qryctrlinterface.isempty then
  begin
    If qryctrlinterface.Fieldbyname('FLGTIPOCONVENIO').asInteger = 0 then
    begin
      // Convenio Avulso (TMPDESC)
      sSql:=' Select TMP.IDPROVENTO, prv.codprovdesc, ';
      If SistemaFolha.FlgUsaCodRubExt = 0 then
        sSql:=sSql+'PRV.DESCRICAO, '
      else
        sSql:=sSql+' PRV.DESCRPROVDESC AS DESCRICAO, ';

      sSql:=sSql+
        ' SUM(TMP.VALOR) AS VALOR_TOTAL, Count(*) AS QTD_TOTAL '+
        ' from tmpdesc tmp, provdesc prv '+
        ' Where tmp.idlote = ' + IntToStr(qryctrlinterface.Fieldbyname('IDLOTE').asInteger)+
        ' and tmp.flgdescfolha = ''B'''+
        ' and tmp.idprovento = prv.idprovento '+
        ' group by TMP.IDPROVENTO, prv.codprovdesc, ';
      If SistemaFolha.FlgUsaCodRubExt = 0 then sSql:=sSql+' PRV.DESCRICAO'
      else sSql:=sSql+' PRV.DESCRPROVDESC';
      cbxApaga.enabled:=true;
    end
    else
    begin
      // Convenio Continuado (RUBRICAINDIV)
      sSql:=' Select RI.IDRUBRICA, prv.codprovdesc, ';
      If SistemaFolha.FlgUsaCodRubExt = 0 then
        sSql:=sSql+'PRV.DESCRICAO, '
      else sSql:=sSql+' PRV.DESCRPROVDESC AS DESCRICAO, ';

      sSql:=sSql+
        ' SUM(RI.VALORRUBRICA) AS VALOR_TOTAL, Count(*) AS QTD_TOTAL '+
        ' from rubricaindiv ri, provdesc prv '+
        ' Where ri.idlote = ' + IntToStr(qryctrlinterface.Fieldbyname('IDLOTE').asInteger) +
        ' and ri.flgtprubmanut = 1'+
        ' and ri.idrubrica = prv.idprovento '+
        ' group by ri.idrubrica, prv.codprovdesc, ';
      If SistemaFolha.FlgUsaCodRubExt = 0 then sSql:=sSql+' PRV.DESCRICAO'
      else sSql:=sSql+' PRV.DESCRPROVDESC';
      cbxApaga.enabled:=false;
    end;
    qryEstatistica.close;
    qryEstatistica.SQL.clear;
    qryEstatistica.sql.add(SSQL);
    qryEstatistica.Open;
    cbxApaga.enabled:=cbxApaga.enabled and (not qryEstatistica.isempty);
  end;
end;


procedure TfrmImportaTxt.cbxApagaClick(Sender: TObject);
 var ssql : String;
begin
  inherited;
  if MessageDlg('Você realmente deseja apagar o lote selecionado ?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with qryctrlinterface do
    begin
      If Fieldbyname('FLGTIPOCONVENIO').asInteger = 0 then
      begin
        try
          ssql:='DELETE TMPDESC WHERE IDLOTE = '+
                  IntToStr(fieldbyname('IDLOTE').asInteger);
          if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;
          qryAux.close;
          qryAux.sql.Clear;
          qryAux.SQL.add(ssql);
          qryAux.ExecSql;
          dtmBaseDados.dbBaseDados.Commit;
        except
        end;
      end;
    end;
  end;
  AcertaDados;
end;

procedure TfrmImportaTxt.dblcmbLayoutChange(Sender: TObject);
Var sSql: String;
begin
  inherited;
  // localiza na ctrlinterface o registro referente (caso exista)
  if (dblcmbLayout.Text = '') or (cboxMes.Text = '') then
    exit;

  bbtnProcessaCritica.enabled:=
    (qryLayoutDesconto.FieldByName('FLGIMPORTACAO').AsInteger = 1); 

  VerificaLote; 

  
  cboxDemissao.enabled:=qryLayoutDesconto.FieldByName('FLGMATRICULA').asinteger = 1;

  cboxDemissao.Checked:=qryLayoutDesconto.fieldbyname('FLGIGNORADEMITIDO').AsInteger = 1;
  //ATUALIZA VALOR DEFAULT DEFINIDO NO CONVÊNIO
  rgDuplicados.ItemIndex:=qryLayoutDesconto.fieldbyname('FLGTRATADUPL').AsInteger;
  cbboxAtivo.ItemIndex:=qryLayoutDesconto.fieldbyname('FLGCOMBFENEF').asinteger;
end;

procedure TfrmImportaTxt.chkAbonoAnualClick(Sender: TObject);
begin
  inherited;
  sAbonoAnual:=Trim(EditAno.text)+'/13';
  VerificaLote; 
end;

procedure TfrmImportaTxt.dblcmbLayoutCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cmbLote.Enabled:= dblcmbLayout.LookupValue<>'';
end;


procedure TfrmImportaTxt.CriticaLinha(Indices, aicontrole: Integer);
var iPos : Integer;
    iTam : Integer;
    Docto : Integer;
    sChave2 : String;
    sChave3 : String;
    lIdRubImp1 : Integer;
    PosParc1 : Integer;
    TamParc1 : Integer;
    PosInfo1 : Integer;
    TamInfo1 : Integer;
    sNatureza1 : String;
    bRubDev1 : Boolean;
    lIdRubExt1: Integer;
    iIdrubparc: integer;
    CodAlt : String;
    smesref1 : String;
    iidtitular1 : Integer;
    iidpessoa1 : Integer;
    iidLote1 : Integer;
    iidplanoprev1 : Integer;
    iidpessjur1  : Integer;
    ssql: String;
    Tiporub : String;
    Valor : Integer;
    Flag_erro_total : Integer;
    sMat : String;
    nposicao: integer;
    rpercentual: real;
    inumrub, inumocormax: integer;
    nSeq : Integer; 
    bProcessaLinha : Boolean; 
    lsmsg: string;
    liseqdep: integer; 
begin
  Flag_erro_total:=0;
  
  if (aicontrole = 9) and (Flag_erro = 0) then
  begin
    // Critica Tipo de Documento
    iPos:=3;
    iTam:=1;
    try
      Docto:=strtoInt(TRIM(FRetornaDado2(iPos,itam,Indices)));
    except
      Docto:=0;
    end;
    if Docto <> 8  then
    begin
      MontaDetalheCritica('Tipo de documento inválido',' ',Indices)  ;
      Flag_erro_total:=1;
    end;

    // Critica Matricula
    iPos:=qryLayoutDesconto.fieldbyname('COLCODIGO').asinteger;
    iTam:=qryLayoutDesconto.fieldbyname('TAMCODIGO').asinteger;

    sChave2:=trim(valor_(iPos,iTam,indices, bProcessaLinha)) ;
    If Not bProcessaLinha Then
    Begin
      memResult.Lines.Add('[Linha '+LeftPad(IntToStr(indices),6)+'] - Erro no layout.');
      Exit;
    End;

    if sChave1 <> sChave2  then
    begin
      MontaDetalheCritica('Matrícula diferente',' ',Indices);
      Flag_erro_total:=1;
    end;

    // Verificar Rubrica com diferenca
    iPos:=qryLayoutxColunas.fieldbyname('COLRUBRICA').ASinteger; 
    iTam:=qryLayoutxColunas.fieldbyname('TAMRUBRICA').asinteger;

    try
      valor:=strtoInt(TRIM(FRetornaDado2(iPos,iTam,indices)));
    except
      valor:=0;
    end;
    if valor <> slIdRubImp1 then
    begin
      MontaDetalheCritica('Soma rubrica com diferença',' ',Indices);
      Flag_erro_total:=1;
    end;

    // Verificar Valor com diferenca
    iPos:=qryLayoutxColunas.fieldbyname('COLVALOR').ASinteger; 
    iTam:=qryLayoutxColunas.fieldbyname('TAMVALOR').asinteger;

    try
      valor:=strtoInt(TRIM(FRetornaDado2(iPos,iTam,indices)));
    except
      valor:=0;
    end;
    if valor <> rsomaValor then
    begin
      MontaDetalheCritica('Soma valor com diferença',' ',Indices);
      Flag_erro_total:=1;
    end;

    ListaTemp.Clear;
    slIdRubImp1:=0;
    rsomaValor:=0;
  end;

  
  if (aicontrole = 9) then
    Flag_erro:=0;

  
  if (aicontrole < 0) or (aicontrole = 5) then
  begin
    Flag_erro:=0;

    // Critica Matricula
    iPos:=qryLayoutDesconto.fieldbyname('COLCODIGO').asinteger;
    iTam:=qryLayoutDesconto.fieldbyname('TAMCODIGO').asinteger;

    sChave1:=trim(valor_(iPos,iTam,indices, bProcessaLinha)) ;
    If Not bProcessaLinha Then
    Begin
      memResult.Lines.Add('[Linha '+LeftPad(IntToStr(indices),6)+'] - Erro no layout.');
      Exit;
    End;

    sChave3:=sChave1;

    // TRATA MATRICULA OU INSCRICAO
    if qryLayoutDesconto.fieldbyname('COLCODIGODEP').isnull or
       qryLayoutDesconto.fieldbyname('TAMCODIGODEP').isnull then
      liseqdep:=0
    else
      liseqdep:=strtoint(trim(valor_(
        qryLayoutDesconto.fieldbyname('COLCODIGODEP').asinteger,
        qryLayoutDesconto.fieldbyname('TAMCODIGODEP').asinteger,
        liseqdep, bProcessaLinha)));

    if qryLayoutDesconto.FieldByName('FLGMATRICULA').asinteger = 1 then
    begin
      try
        inc(nRegTotal);
        ConstroiQueryMatricula(sChave3);
        if qryMatric.IsEmpty then
        begin
          if ExisteMatricula(sChave3) then
          begin
            if cbboxAtivo.itemindex > 0 then
            begin
              if cboxDemissao.checked then
              begin
                MontaDetalheCritica('Matrícula com data demissão',' ',Indices);
              end
              else
              begin
                MontaDetalheCritica('Matrícula sem benefício',' ',Indices);
              end;
            end
            else
              MontaDetalheCritica('Matrícula sem plano prev',' ',Indices);
          end
          else
            MontaDetalheCritica('Matrícula não cadastrada',' ',Indices);
          Flag_erro:=1;
          iidtitular1:=0 ;
          iidpessoa1:=0 ;
          iidpessjur1:=0;
          inc(iRejeitados);
          exit; 
        end
        else
        begin
          if not ValidaBeneficio(qryMatric, lsmsg) then
          begin
            MontaDetalheCritica(lsmsg,' ',Indices);
            Flag_erro:=1;
            iidtitular1:=0 ;
            iidpessoa1:=0 ;
            iidpessjur1:=0;
            inc(iRejeitados);
            exit; //BLOQUEAR A CONTINUIDADE DA CRITICA
          end;

          if Flag_erro = 0 then
          begin
            while not qryMatric.eof do
            begin
              sMat:='';
              If Pos('-',sistemafolha.mascaramatricula) > 0 then
                nposicao:=Pos('-',qryMatric.fieldbyname('MATRICULA').asstring)
              else
              begin
                nposicao:=length(qryMatric.fieldbyname('MATRICULA').asstring);
                nposicao:=nposicao + 1;
              end;
              sMat:=Copy(qryMatric.fieldbyname('MATRICULA').asstring,1,nposicao-1);
              sChave1:= Copy(qryMatric.FieldByName('MATRICULA').AsString, 1, nposicao - 1);
              If trim(sMat) = trim(sChave1) then
              begin
                //TRATA QUANDO IDPESSOA É BENEFICIARIO VINCULADO A UMA MATRICULA.
                //   QRYMATRIC ALTERADA PARA CONTER IDTITULAR E IDPESSOA.
                iidtitular1 :=qryMatric.fieldbyname('IDTITULAR').asinteger;
                iidpessoa1 :=qryMatric.fieldbyname('IDPESSOA').asinteger;
                iidpessjur1 :=qryMatric.fieldbyname('IDPESSJUR').asinteger;
                if iidtitular1 <> iidpessoa1 then
                begin
                  qryAux.Close;
                  qryAux.Sql.Clear;
                  qryAux.Sql.Add(
                    'SELECT IDPLANOPREV FROM BENEFBFCIARIO '+
                    'WHERE IDSITBENEFICIO = 1 '+
                    'AND IDPESSOA = '+inttostr(iidpessoa1));
                  qryAux.Open;
                  if qryAux.isempty then
                    iidplanoprev1:=qryMatric.fieldbyname('IDPLANOPREV').asinteger
                  else
                    iidplanoprev1:=qryAux.fieldbyname('IDPLANOPREV').asinteger;
                end
                else
                  iidplanoprev1:=qryMatric.fieldbyname('IDPLANOPREV').asinteger;
                break;
              end;
              qryMatric.next;
            end;

            If sMat = '' then
            begin
              MontaDetalheCritica('Matrícula não cadastrada',' ',Indices);
              Flag_erro:=1;
              iidtitular1:=0 ;
              iidpessoa1:=0 ;
              iidpessjur1:=0;
              inc(iRejeitados);
              exit; //BLOQUEAR A CONTINUIDADE DA CRITICA
            end;
          end;
        end;
      except
        MontaDetalheCritica('Matrícula não cadastrada',' ',Indices);
        Flag_erro:=1;
        iidtitular1:=0 ;
        iidpessoa1:=0 ;
        iidpessjur1:=0;
        inc(iRejeitados);
        exit; 
      end;  // try
    end
    //TRATA INSCRICAO
    else
    begin // processa por inscricaonumero
      inc(nRegTotal);
      ConstroiQueryInscricao(schave3, liseqdep);
      if qryInscricao.IsEmpty then
      begin
        MontaDetalheCritica('Inscrição não cadastrada',' ',Indices);
        Flag_erro:=1;
        iidtitular1:=0;
        iidpessoa1:=0;
        iidpessjur1:=0;
        inc(iRejeitados);
        exit;
      end;

      if not ValidaBeneficio(qryInscricao, lsmsg) then
      begin
        MontaDetalheCritica(lsmsg,' ',Indices);
        Flag_erro:=1;
        iidtitular1:=0 ;
        iidpessoa1:=0 ;
        iidpessjur1:=0;
        inc(iRejeitados);
        exit;
      end;

      iidtitular1:=qryInscricao.fieldbyname('IDTITULAR').asinteger;
      iidpessjur1:=qryInscricao.fieldbyname('IDPESSJUR').asinteger;
      iidplanoprev1:=qryInscricao.fieldbyname('IDPLANOPREV').asinteger;
    end;

    qryLayoutxColunas.close;
    qryLayoutxColunas.ParamByName('IDLAYOUT').asinteger :=
      qryLayoutDesconto.fieldbyname('IDLAYOUT').asinteger;
    qryLayoutxColunas.open;
    if not qryLayoutxColunas.eof  then
    begin
      lIdRubImp1:=qryLayoutxColunas.fieldbyname('IDRUBRICA').asinteger;
      if lIdRubImp1 = 0 then
      begin
        // O arquivo Contem mais de uma rubrica
        posParc1:=qryLayoutxColunas.fieldbyname('COLRUBRICA').ASinteger;
        tamParc1:=qryLayoutxColunas.fieldbyname('TAMRUBRICA').asinteger;

	If Sistema.TipoCliente <> 19991 then {<> DE FUNCEF}
        begin
          try
            lIdRubImp1:=strtoInt(TRIM(FRetornaDado2(posParc1,tamParc1,indices)));
          except
            lIdRubImp1:=0;
          end;
        end
        else
        begin
          PosInfo1:=qryLayoutxColunas.fieldbyname('COLVALINFO').ASinteger;
          TamInfo1:=qryLayoutxColunas.fieldbyname('TAMVALINFO').ASinteger;
          try
            lIdRubImp1:=strtoInt(TRIM(FRetornaDado2(posParc1,tamParc1,indices))+
              TRIM(FRetornadado2(posInfo1,tamInfo1,indices)));
          except
            lIdRubImp1:=0;
          end;
        end;

	try
          iIdrubparc:=strtoInt(TRIM(FRetornaDado2(posParc1,tamParc1,indices)));
        except
          iIdrubparc:=0;
        end;
      end
      else
      begin
        sNatureza1:=Fretornadado2(qryLayoutxColunas.fieldbyname('COLNATUREZA').ASInteger,1,indices);
        if ((sNatureza1=qrylayoutxcolunas.fieldbyname('CARACNATUREZA').asString) and
            (sNatureza1 <> '')) then
          lIdRubImp1:=qryLayoutxColunas.fieldbyname('IDRUBRICADEVOL').asinteger;

        // Verifica se a fundação trabalha com codigo interno ou externo de rubricas
        //----------------------------------------------------------------------------
      end;

      If Sistema.TipoCliente <> 19991 then {<> DE FUNCEF}
      begin
        If SistemaFolha.FlgUsaCodRubExt = 0 then
        begin
          qryRubExternaXInterna.close;
          qryRubExternaXInterna.parambyname('IDPROVENTO').asinteger:=lIdRubImp1;
          qryRubExternaXInterna.Open;
          lIdRubExt1:=lIdRubImp1;
          lIdRubImp1:=qryRubExternaXInterna.fieldbyname('IDPROVENTO').asInteger;
        end
        else
        begin
          qryRubInternaXExterna.close;
          qryRubInternaXExterna.parambyname('IDPROVENTO').asInteger:=lIdRubImp1;
          qryRubInternaXExterna.Open;
          try
            lIdRubExt1:=StrToInt(qryRubInternaXExterna.fieldbyname('CODPROVDESC').asString);
          except
            lIdRubExt1:=0;
          end;
        end;
      end
      else
      begin
        If SistemaFolha.FlgUsaCodRubExt = 1 then // Trabalha com o codigo externo
        begin
          qryRubExternaXInternaCont.close;
          qryRubExternaXInternaCont.parambyname('CODPROVDESC').asstring:=InttoStr(lIdRubImp1);
          qryRubExternaXInternaCont.Open;
          lIdRubExt1:=lIdRubImp1;
          lIdRubImp1:=qryRubExternaXInternacont.fieldbyname('IDPROVENTO').asInteger;
        end
        else
        begin
          qryRubInternaXExterna.close;
          qryRubInternaXExterna.parambyname('IDPROVENTO').asInteger:=lIdRubImp1;
          qryRubInternaXExterna.Open;
          lIdRubExt1:=StrToInt(qryRubInternaXExterna.fieldbyname('CODPROVDESC').asString);
        end;
      end;

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(
        ' SELECT FLGESTADORUB, PRAZO FROM PROVDESC '+
        ' WHERE IDPROVENTO = '+IntToStr(lIdRubImp1));
      qryAux.Open;
      if (qryAux.eof) and
         (qryLayoutDesconto.fieldbyname('FLGCHECARUBRICA').AsInteger  = 1) then
      begin
        MontaDetalheCritica('Rubrica inválida',' ',Indices);
        Flag_erro:=1;
        inc(iRejeitados);
        exit; //BLOQUEAR A CONTINUIDADE DA CRITICA
      end;
    end
    else
    begin
      if qryLayoutDesconto.fieldbyname('FLGCHECARUBRICA').AsInteger  = 1 then
      begin
        MontaDetalheCritica('Layout Coluna não existe',' ',Indices);
        Flag_erro:=1;
        inc(iRejeitados);
        exit; 
      end;
    end;

    // Verificar código da  Movimentação
    if qryLayoutxColunas.fieldbyname('COLOPERACAO').asinteger > 0 then
    begin
      iPos:=qryLayoutxColunas.fieldbyname('COLOPERACAO').asinteger;
      iTam:=1;
      CodAlt:=FRetornaDado2(iPos,itam,Indices);
    end
    else
      CodAlt:='I';

    if (CodAlt <> 'I') and (CodAlt <> 'A') and (CodAlt <> 'E') then
    begin
      MontaDetalheCritica('Código de operação inválido',' ',Indices) ;
      Flag_erro:=1;
      inc(iRejeitados);
      exit; 
    end
    Else
    Begin
      If (CodAlt <> 'I') then
      begin
        iPos := qryLayoutxColunas.fieldbyname('COLOCORRENCIAS').AsInteger;
        iTam := qryLayoutxColunas.fieldbyname('TAMOCORRENCIAS').AsInteger;
        try
          nSeq := StrToInt(FRetornaDado2(iPos, iTam, Indices));
        except
          nSeq := 1;
        end;
      end;

      If (CodAlt = 'I') Then
      Begin
        If Not ValidaOperacao(iidtitular1, iidpessoa1, lidrubimp1, 0, iidfundacao, 'I') Then
        Begin
          MontaDetalheCritica('Não import por duplicidade',' ',Indices) ;
          Flag_Erro := 1;
          inc(iRejeitados);
          Exit;
        End;
      End;

      If (CodAlt = 'A') Then
      Begin
        If Not ValidaOperacao(iidtitular1, iidpessoa1, lidrubimp1, nseq, 0, 'A') Then
        Begin
          MontaDetalheCritica('Não existe reg. p/ alterar', ' ', Indices);
          Flag_Erro := 1;
          inc(iRejeitados);
          Exit;
        End;
      End;

      If (CodAlt = 'E') Then
      Begin
        If Not ValidaOperacao(iidtitular1, iidpessoa1, lidrubimp1, nseq, 0, 'E') Then
        Begin
          MontaDetalheCritica('Não existe reg. p/ excluir', ' ', Indices);
          Flag_Erro := 1;
          inc(iRejeitados);
          Exit;
        End;
      End;
    End;

    smesref1:=IntToStr(cboxMes.ItemIndex+1);
    if length(smesref1) = 1 then
      smesref1 :='0'+smesref1;
    smesref1 :=EditAno.text+'/'+smesref1;

    //CONTROLAR PERCENTUAL DEFAULT E NUMOCORMAX
    qryrubricaxcontabancaria.Close;
    qryrubricaxcontabancaria.ParamByName('idpessoa').AsInteger:=
      qryLayoutXColunas.fieldbyname('IDFAVORECIDO').asinteger;
    qryrubricaxcontabancaria.ParamByName('IDRUBRICA').AsInteger:=lIdRubImp1;
    qryrubricaxcontabancaria.Open;
    inumocormax:=maxint;
    if not qryrubricaxcontabancaria.isempty then
    begin
      rpercentual:=qryrubricaxcontabancaria.fieldbyname('PERCENTUAL').asfloat;
      if not qryrubricaxcontabancaria.fieldbyname('NUMOCORMAX').isnull then
        inumocormax:=qryrubricaxcontabancaria.fieldbyname('NUMOCORMAX').asinteger;
    end;

    if (qryLayoutDesconto.fieldbyname('FLGTIPOCONVENIO').asinteger = 1) and
       (CodAlt = 'I') then
    begin
      ssql:='SELECT COUNT(*) AS NUM ' +
            'FROM RUBRICAINDIV '+
            'WHERE (IDTITULAR = '+IntToStr(iidtitular1)+') '+
            'AND (IDPESSOA = '+IntToStr(iidpessoa1)+') '+
            'AND (IDRUBRICA = '+IntToStr(lIdRubImp1)+') '+
            //IDENTIFICAR APENAS REGISTROS PARA COBRANÇA
            'AND (NVL(FLGDESATIVADO,0) = 0) '+
            'AND ((FLGPERMANENTE = 1) '+
            'OR (NVL(FLGPERMANENTE,0) = 0 AND NUMOCORRENCIAS < PARCELAS))';

      qryVerificaReg.close;
      qryVerificaReg.sql.clear;
      qryVerificaReg.sql.add(ssql);
      qryVerificaReg.open;

      inumrub:=qryVerificaReg.fieldbyname('NUM').asinteger;
      if inumrub+1 > inumocormax then
      begin
        MontaDetalheCritica('Já existe rubrica',' ',Indices);
        Flag_erro:=1;
        inc(iRejeitados);
        exit;
      end;
    end;

    // Rubrica Permitida para o Movimentação
    if (qryLayoutDesconto.fieldbyname('FLGCHECARUBRICA').AsInteger = 1) and
       (qryLayoutXColunas.FieldByName('idrubrica1').AsInteger <> 0 ) then
    begin
      if qryrubricaxcontabancaria.isempty then
      begin
        MontaDetalheCritica('Rub. não permitida convenio',' ',Indices);
        Flag_erro:=1;
        inc(iRejeitados);
        exit; 
      end;
    end;

    //Verificar tipo de Rubrica
    If Sistema.TipoCliente = 19991 then {19991 = FUNCEF} 
    Begin
      iPos:=20;
      iTam:=1;
      Tiporub:=FRetornaDado2(iPos,itam,Indices);
      if (Tiporub <> '1') and (Tiporub <> '2') and (Tiporub <> '3') and
         (Tiporub <> '4')  then
      begin
        MontaDetalheCritica('Tipo rubrica inexistente',' ',Indices);
        Flag_erro:=1;
        inc(iRejeitados);
        exit; 
      end;
    End;

    // Totalizar
    if Flag_erro = 0 then
    begin
      qryLayoutxColunas.close;
      qryLayoutxColunas.ParamByName('IDLAYOUT').asinteger :=
      qryLayoutDesconto.fieldbyname('IDLAYOUT').asinteger;
      qryLayoutxColunas.open;
      if not qryLayoutxColunas.eof  then
      begin
        iPos:=qryLayoutxColunas.fieldbyname('COLVALOR').ASinteger;
        iTam:=qryLayoutxColunas.fieldbyname('TAMVALOR').asinteger;
        try
          valor:=strtoInt(TRIM(FRetornaDado2(iPos,iTam,indices)));
        except
          valor:=0;
        end;
        slIdRubImp1:=slIdRubImp1+iIdrubparc;
        rsomaValor:=rsomaValor+Valor;
        GravaListaTempo(indices);
      end;
    end;
  end;
end;

procedure TfrmImportaTxt.GravaListaTempo(indices: integer);
begin
  ListaTemp.add(mmArquivo.Lines[indices]);
end;

procedure TfrmImportaTxt.LerlistaCritica;
var itam : Integer;
    iPos : Integer;
    ll : integer;
    licontrole: integer; 
begin
  iTam:=qryLayoutxColunas.FieldByName('TAMCONTROLE').asinteger;
  iPos:=qryLayoutxColunas.FieldByName('COLCONTROLE').asinteger;

  //CONTROLE HEADER E TRAILLER
  if qrylayoutdesconto.fieldbyname('FLGUSAHEADTRAI').asInteger = 0 then
  begin
    nLinhasCabec:=0;
    nLinhasRodape:=0;
  end
  else
  begin
    nLinhasCabec:=qrylayoutdesconto.fieldbyname('LINHASHEADER').asInteger;
    nLinhasRodape:=qrylayoutdesconto.fieldbyname('LINHASTRAILLER').asInteger;
  end;

  slIdRubImp1:=0;
  rsomaValor:=0 ;
  nRegTotal:=0;
  iRejeitados:=0;

  for ll:=(0+nLinhasCabec) to ((mmArquivo.lines.Count-nLinhasRodape)-1) do
  begin
    pbarCritica.Position:=pbarCritica.Position + 1;
    lblMensagemCritica.caption:='  Processando registro: '+
      inttostr(pbarCritica.Position)+' de '+inttostr(pbarCritica.Max)+' ... ';
    lblMensagemCritica.update;
    if ll mod 100 = 0 then
       application.processmessages;
    if trim(mmArquivo.lines[ll]) <> '' then 
    begin
      If Sistema.TipoCliente = 19991 then {= DE FUNCEF}
      begin
        try
          if (iPos > 0) and (iTam > 0) then
            licontrole:=strtoInt(FRetornaDado2(iPos, itam, ll))
          else
            licontrole:=5; //código 5 significa o registro a criticar
        except
          licontrole:=-1;
        end;
      end
      else
        licontrole:=5; //código 5 significa o registro a criticar
      if (licontrole = 5) then
      begin
        CriticaLinha(ll, licontrole);
      end;
    end;
  end;
end;

procedure TfrmImportaTxt.MontaDetalheCritica(Mensagem, Cargadia: String;
  linha: Integer);
var sGereg : String;
    sLote : String;
    sMatricula : String;
    sCodReg : String;
    sCodAlt : String;
    sDc : String;
    sTRub :String;
    sSeq :String;
    sValor :String;
    sPRZ :String;
    sPERC :String;
    sCargDia : String;
    sMensagem : String;
begin
  sGereg:= copy(mmArquivo.Lines[linha],1,2)+' ';
  sLote:=copy(mmArquivo.Lines[linha],4,3)+' ';
  sMatricula:=copy(mmArquivo.Lines[linha],9,7)+' ';
  sCodReg:=copy(mmArquivo.Lines[linha],16,1)+' ';
  sCodAlt:=copy(mmArquivo.Lines[linha],17,1)+' ';
  sDc:=copy(mmArquivo.Lines[linha],18,2)+' ';
  sTRub :=copy(mmArquivo.Lines[linha],20,4)+' ';
  sSeq:=copy(mmArquivo.Lines[linha],24,2)+' ';
  sValor:=copy(mmArquivo.Lines[linha],26,12)+' ';
  sPRZ:=copy(mmArquivo.Lines[linha],38,3)+' ';
  sPERC:=copy(mmArquivo.Lines[linha],41,3)+' ';
  if Trim(Cargadia) = '' then
    Cargadia:='             *** ';
  sCargDia:= copy(Cargadia,1,10)+' ';
  sMensagem:=copy(Mensagem,1,27)+' ';
  ListaCritica.add(sGereg+sLote+sMatricula+sCodReg+sCodAlt+sDc+sTRub+sSeq+sValor+
                   sPRZ+sPERC+sCargDia+sMensagem);
  if (trim(sValor) <> '' ) and (trim(smatricula) <> '')  then
    try
      sValorTotal:=sValorTotal + strtoint(trim(sValor));
    except
    end;  
end;

procedure TfrmImportaTxt.MontaHeaderCritica;
var
  quantidadeString : String;
  posicaoM,
  tamanhoM :  longint;
  lic : Integer;
  rubrica : string[03];
  bProcessaLinha : Boolean; 

begin
  lic:=1;
  posicaoM:=18;
  TamanhoM:=2;
  try
    QuantidadeString:=trim(valor_(posicaoM,tamanhoM,lic, bProcessaLinha));
    If Not bProcessaLinha Then
    Begin
      memResult.Lines.Add('[Linha '+LeftPad(IntToStr(lic),6)+'] - Erro no layout.');
      Exit;
    End;

    If Trim(QuantidadeString) = '' Then
      QuantidadeString:='0';
  except
    QuantidadeString:='0';
  end;
  QuantRegistro:=StrToInt(quantidadeString);
  rubrica:= '000';
  if qrybuscacodprev.Active  then
    qrybuscacodprev.Close;
  qrybuscacodprev.ParamByName('idlayout').AsInteger:=
    qryLayoutDesconto.fieldbyname('IDLAYOUT').AsInteger;
  qrybuscacodprev.Open;

  if not qrybuscacodprev.Eof  then
    Rubrica:=StrPadLeft(qrybuscacodprevCODPROVDESC.AsString,3,'0');
  ListaCritica.add('0'+'042208'+sDataInicial1+sMesImportacao1+Rubrica+'01');
end;

procedure TfrmImportaTxt.MontaRodapeCritica;
var TotalLido : String[05];
    TotalMatr : String[05];
    TotalMatrAc : String[05];
    TotalMatrRej : String[05];
    ValorTot : String[12];
begin
  TotalMatr:=StrPadLeft(IntToStr(nRegTotal),5,'0');
  TotalLido:=StrPadLeft(Inttostr(nRegTotal),5,'0');
  TotalMatrAc :=StrPadLeft(Inttostr(nRegTotal-iRejeitados),5,'0');
  TotalMatrRej :=StrPadLeft(inttostr(iRejeitados),5,'0');
  ValorTot:=StrPadLeft(inttostr(sValortotal),12,'0');
  ListaCritica.add('9'+TotalLido+TotalMatr+TotalMatrAc+TotalMatrRej+ValorTot);
end;

procedure TfrmImportaTxt.ProcessaCritica;
begin
end;

procedure TfrmImportaTxt.bbtnProcessaCriticaClick(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Confirma início da crítica ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    exit;

  smesref:=IntToStr(cboxMes.ItemIndex+1);
  if length(smesref) = 1 then
    smesref:='0'+smesref;
  smesref:=EditAno.text+'/'+smesref;

  PageControl1.activepage:=tbsArquivo;
  pbarCritica.visible:=true;
  pbarCritica.position:=0;
  pbarCritica.Max:=mmArquivo.lines.Count;
  lblMensagemCritica.visible:=true;
  try
    qryLayoutxColunas.close;
    qryLayoutxColunas.ParamByName('IDLAYOUT').asinteger:=qryLayoutDesconto.fieldbyname('IDLAYOUT').asinteger;
    qryLayoutxColunas.open;

    If Sistema.TipoCliente = 19991 then {= DE FUNCEF}
      MontaHeaderCritica;
    LerlistaCritica;
    If Sistema.TipoCliente = 19991 then {= DE FUNCEF}
      MontaRodapeCritica;
    ListaCritica.SaveToFile(lbNomeArqImport.Caption+'.Critica'); 

    qryLayoutxColunas.close;

  finally
    pbarCritica.visible:=false;
    lblMensagemCritica.visible:=false;
  end;
end;

function TfrmImportaTxt.FRetornaDado2(const posicao, tamanho,
  linha: integer): String;
var i: longint;
    temp: String;
begin
  temp:='';
  if mmArquivo.lines <> nil then
  begin
    for i:=0 to (tamanho-1) do
      temp:=Temp + (mmArquivo.Lines[linha][i+posicao]);
  end;
  result:=temp;
end;

procedure TfrmImportaTxt.sbtnOrigemClick(Sender: TObject);
begin
  inherited;
        //Jéssica Lana SOL 109421 KINTANA 496332
        //opendialog1.InitialDir:='C:\';
        opendialog1.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  if opendialog1.execute then
  begin
    lbNomeArqImport.caption:=opendialog1.filename;
    lbNomeArqRej.caption:=ChangeFileExt(opendialog1.filename, '.rejeitado');
    Ler(opendialog1.filename); 
    tbsArquivo.tabvisible:=true;
  end
  else
    tbsArquivo.tabvisible:=false;
end;

procedure TfrmImportaTxt.PegaParcela(iLinha: integer);
begin
  // Pega Nº de Parcelas
  posParc:=qryLayoutxColunas.fieldbyname('COLPARCELAS').ASinteger;
  tamParc:=qryLayoutxColunas.fieldbyname('TAMPARCELAS').asinteger;
  If posparc > 0 then
  begin
    sParcelas:=FRetornaDado2(posParc,tamParc,iLinha);
    If Trim(sparcelas) = '' Then
      nparcelas:=0
    Else
      nParcelas:=StrToInt(Trim(sParcelas));  
  End
  Else
    nParcelas:=1;
end;

procedure TfrmImportaTxt.PegaValorPorErro(iLinha: integer);
Var
  bProcessaLinha : Boolean; 
begin
  posValor:=qryLayoutxColunas.fieldbyname('COLVALOR').ASinteger;
  tamValor:=qryLayoutxColunas.fieldbyname('TAMVALOR').asinteger;

  svalor:=trim(valor_(posvalor,tamvalor,iLinha, bProcessaLinha));
  If Not bProcessaLinha Then
  Begin
    memResult.Lines.Add('[Linha '+LeftPad(IntToStr(iLinha),6)+'] - Erro no layout.');
    Exit;
  End;

  rvalor:=ConverteValor(svalor,
                        qryLayoutxColunas.fieldbyname('caracdecimal').asstring,
                        qryLayoutxColunas.fieldbyname('numdecimais').asinteger);
  nValRej:=nValRej+rValor;
  nValTotal:=nValTotal+rValor;
end;

function TfrmImportaTxt.ValidaOperacao(aidTitular, aidPessoa, aidRubrica,
  aiSeq, aidFundacao: Integer; asCodOp: String): Boolean;
Var
  sMesFinal : String;
  I : Integer;
begin
  Result := False;

  //Inclusão
  If asCodOp = 'I' Then
  Begin
    qryAux.Sql.Clear;
    qryAux.Sql.Add('SELECT FLGPERMANENTE, FLGDESATIVADO, NUMOCORRENCIAS, PARCELAS, DATAFINAL ' +
                   'FROM RUBRICAINDIV '+
                   'WHERE IDTITULAR   = '+IntToStr(aidtitular)+' '+
                     'AND IDPESSOA    = '+IntToStr(aidpessoa)+' '+
                     'AND IDRUBRICA   = '+IntToStr(aIdRubrica)+' '+
                     'AND IDEMPRESA   = '+IntToStr(aIdFundacao));
    qryAux.Open;
    If Not qryAux.IsEmpty Then
    Begin
      For I := 1 To qryAux.RecordCount Do
      Begin
        sMesFinal := Copy(qryAux.FieldByName('DATAFINAL').AsString, 7, 4)+'/'+
                     Copy(qryAux.FieldByName('DATAFINAL').AsString, 4, 2);
        If (rgDuplicados.ItemIndex = 0) Then
        Begin
          If (qryAux.FieldByName('FLGDESATIVADO').AsInteger = 1) Then
            Result := True
          Else
          Begin
            If ((qryAux.FieldByName('FLGPERMANENTE').AsInteger = 0) And
                (qryAux.FieldByName('NUMOCORRENCIAS').AsInteger =
                 qryAux.FieldByName('PARCELAS').AsInteger) And
                (sMesFinal < sMesRef))  Then
              Result := True
            Else
            Begin
              Result := False;
              Exit;
            End;
          End;
        End
        Else
          Result := True;

        qryAux.Next;
      End;
    End
    Else
      Result := True;
  End;

  //Alteração ou Exclusão
  If ((asCodOp = 'A') or (asCodOp = 'E')) Then
  Begin
    qryAux.Sql.Clear;
    qryAux.Sql.Add('SELECT 1 FROM RUBRICAINDIV '+
                   ' WHERE IDTITULAR = '+inttostr(aidtitular)+
                   ' AND IDPESSOA = '+inttostr(aidpessoa)+
                   ' AND IDRUBRICA = '+inttostr(aIdRubrica)+
                   ' AND SEQRUBRICAINDIV = '+IntToStr(aiseq));
    qryAux.Open;
    If Not qryAux.IsEmpty Then
    Begin
      Result := True;
      Exit;
    End
    Else
    Begin
      Result := False;
      Exit;
    End;
  End;
end;

procedure TfrmImportaTxt.EditAnoExit(Sender: TObject);
begin
  inherited;
  CalculaMesReferencia;
end;

procedure TfrmImportaTxt.cboxMesExit(Sender: TObject);
begin
  inherited;
  CalculaMesReferencia;
end;

procedure TfrmImportaTxt.VerificaLote;
Var sSQL:String;
begin
  CalculaMesReferencia;

  with qryCtrlInterface do
  begin
    sSql:='SELECT DISTINCT CTR.IDLOTE, CTR.IDPESSOA, CTR.MESREFERENCIA, ' +
          ' CTR.DESCRICAO, LDE.FLGTIPOCONVENIO '+
          ' FROM TMPDESC TD, CTRLINTERFACE CTR, LAYOUTDESCONTO LDE '+
          ' WHERE TD.IDLOTE = CTR.IDLOTE AND '+
          ' CTR.IDREFERENCIA = '+qryLayoutDesconto.FieldByName('IDLAYOUT').AsString+' AND '+
          ' CTR.MESREFERENCIA = '+QuotedStr(sMesRefInterface)+'  AND ';
    If chkAbonoAnual.Checked then
      sSql:=sSql+' TD.MESREFERENCIA = '+QuotedStr(sAbonoAnual)+' AND '
    else sSql:=sSql+' TD.MESREFERENCIA <> '+QuotedStr(sAbonoAnual)+' AND ';
     sSql:=sSql+' LDE.IDLAYOUT = CTR.IDREFERENCIA ';
    Close;
    Sql.Clear;
    Sql.Add(sSql);
    Open;

    if IsEmpty then // cria novo LOTE
      iSitImportacao:=0
    else if RecordCount > 1 then // há mais de um LOTE
      iSitImportacao:=2
    else if RecordCount = 1 then // atualiza este LOTE
      iSitImportacao:=1;
  end;

  bbtnConfirmar.Enabled:=(dblcmbLayout.Text <> '') OR (iSitImportacao = 0);
  qryEstatistica.close;
  lbNomeArqImport.caption:='';
  lbNomeArqRej.caption:='';  
end;

procedure TfrmImportaTxt.cboxMesClick(Sender: TObject);
begin
  inherited;
  VerificaLote; 
end;

procedure TfrmImportaTxt.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  inherited;
  VerificaLote; 
end;

end.
{==============================================================================|
| UNIT: FIMPORTA                                                               |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   PROCESSA A IMPORTAÇÃO DE ARQUIVOS TEXTO PROVENIENTES DE CONVENIOS EXTERNOS |
| FUNCIONALIDADES:                                                             |
| - IMPORTA PARA A TABELA TMPDESC SE O TIPO DO CONVENIO FOR AVULSO.            |
| - IMPORTA PARA A TABELA RUBRICAINDIV SE O TIPO DE CONVENIO FOR CONTINUADO.   |
| - NA IMPORTAÇÃO PARA A TABELA TMPDESC, AS CONTAS CONTÁBEIS SÃO VERifICADAS   |
|   ATRAVÉS DA FUNÇÃO VERifICACONTABIL.                                        |
| - NA IMPORTAÇÃO PARA A TABELA RUBRICAINDIV ESTA CHECAGEM SÓ É FEITA NA       |
|   EXECUÇÃO DA PREVIA DA FOLHA .                                              |
===============================================================================|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 21/02/2002 A 21/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12C                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - VERifICAÇÃO NA TABELA RUBRICAXCONTABANCARIA SE AS RUBRICAS QUE ESTÃO SENDO |
|   IMPORTADAS PARA UM DETERMINADO FAVORECIDO ESTÃO ASSOCIADAS A ELE           |
| - VERifICAÇÃO, NO MOMENTO DA LEITURA DO ARQUIVO, DA PARAMETRIZAÇÃO           |
|   CONTÁBIL DA RUBRICA QUE ESTÁ SENDO IMPORTADA                               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25/02/2002 A 26/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12D                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO , NA PROCEDURE DE GRAVAÇÃO DA RUBRICAINDIV, DOS PARAMETROS DE    |
|   FAVORECIDO E EMPRESA                                                       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/03/2002 A 04/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DE PARAMETRIZAÇÃO PARA PERMITIR A IMPORTAÇÃO APENAS PARA          |
|   BENEFICIARIOS QUE POSSUAM BENEFICIOS ATIVOS OU RETIDOS.                    |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 13/03/2002 A 13/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DE GRID PARA TOTALIZAÇÃO DAS RUBRICAS DE UM LOTE QUE VAI SER      |
|   REIMPORTADO.                                                               |
| - INCLUSÃO DE OPÇÃO PARA APAGAR OS DADOS DE UM DETERMINADO LOTE, PARA QUE SE |
|   POSSA FAZER UMA NOVA IMPORTAÇÃO NO MESMO LOTE.                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/05/2002 A 07/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12L                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DA LEITURA DO CAMPO MESREFERENCIA  APARTIR DO ARQUIVO TEXTO       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 15/05/2002 A 15/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12Q                                              |
| CLIENTE: (CRT)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA QUERY QRYLAYOUTXCOLUNAS, COLOCANDO UM NVL NA COLUNA DO MES DE |
|   REFERENCIA.                                                                |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/05/2002 A 16/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12R                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSAO DA POSSIBILIDADE DE EXECUCAO DE REGRA NA IMPORTACAO DE DADOS      |
| - AJUSTE NO TRATAMENTO DO CAMPO COLMESREF                                    |
|==============================================================================|
| DESENVOLVEDOR: Sidnei B Marins.                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/07/2002 A 23/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF  - Pendencia 7664.                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para exibir código/descrição externa |                                                                              |
|  conforme a parametrização na tabela PARAMAPREV.                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:  FERNANDO JORGE                                               |
| PERÍODO DE IMPLEMENTAÇÃO: 05/08/2002 A 05/08/2002                            |
| VERSÃO PARA LIBERAÇÃO: 3.02.13.l                                             |
| CLIENTE:                                                                     |
|                                                                              |
| - Alterei a Função VERifICACONTABIL para só buscar os parametros contábeis   |
|   na tabela RUBRICAXPLANO.                                                   |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:  FERNANDO JORGE                                               |
| PERÍODO DE IMPLEMENTAÇÃO: 05/08/2002 A 05/08/2002                            |
| VERSÃO PARA LIBERAÇÃO: 3.02.13.l                                             |
| CLIENTE:                                                                     |
| - Alterei as Procedures PROCESSAAVULSO e PROCESSACONTINUADO                  |
|   para só buscar os parametros contábeis na tabela RUBRICAXPLANO.            |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:  FERNANDO JORGE                                               |
| PERÍODO DE IMPLEMENTAÇÃO: 06/08/2002 A 06/08/2002                            |
| VERSÃO PARA LIBERAÇÃO: 3.02.13.l                                             |
| CLIENTE:                                                                     |
| - Alterei o SQL da QRYMATRIC, para passar a utilizar a clausula LIKE na      |
|   pesquisa das matriculas.                                                   |
| - Criei a funcao FMontaMatricula.                                            |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:  FERNANDO JORGE                                               |
| PERÍODO DE IMPLEMENTAÇÃO: 16/09/2002 A 16/09/2002                            |
| VERSÃO PARA LIBERAÇÃO: 3.02.14.d                                             |
| CLIENTE: CBS                                                                 |
| - Alterei o SQL da QRYLAYOUTXCOLUNAS, para mudar o tratamento dado ao campo  |
|   CARACNATUREZA.                                                             |
| - Alterei as procedures ProcesaAvulso e ProcessaContinuado em relação ao     |
|   processamento das rubricas de devolução, sinalizadas pelo conteudo do campo|
|   CARACNATUREZA.                                                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/11/2002 A 07/11/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS) - Pendência 9727.                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Inclusão da Informação Codigo de Controle.       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/11/2002 A 20/11/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS) - Pendência 10538.                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para permitir importar informações   |
|   para folha de Abono Anual.                                                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 13/01/2003 A 13/01/2003.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Foi criada mais uma lista para testar e contar quantas matrículas       |
|    distintas tem no arquivo. Essa informação é passada no resultado da       |
|    importação assim como o mês de referência, que também foi incluído.       |
|                                                                              |
|    - Pendência 10947.                                                        |
|                                                                              |
|------------------------------------------------------------------------------}

