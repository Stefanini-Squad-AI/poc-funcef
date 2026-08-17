unit FDemPag;

// Alterações:
{
--------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 21/02/2018
Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
              Retirada de INDEX, +rule etc.
              Melhoria realizada para adaptação ao TIBERO.
--------------------------------------------------------------------------------
Pendência   : SIG 21241
Responsável : Fernando Xavier
Data        : 18/05/2016
Descrição   : Ajustar a rotina de geração dos contracheques, pois a rotina esta
              lançando valor de rubrica de base de déficit para quem não devia.
--------------------------------------------------------------------------------
Pendência   : SOL 265312 PPM 1169756
Responsável : Fernando Xavier
Data        : 18/11/2015
Descrição   : ERRO GERAÇÃO DEMONSTRATIVOS DE PROVENTOS** Solicito verificar e
              regularizar pois os demonstrativos de proventos do mês 11/2015 para
              alguns alimentados não saíram a rubrica de pensão alimentícia sobre abono.
--------------------------------------------------------------------------------
Pendência   : SOL 253577/17651 PPM 1015006
Responsável : Fernando Xavier
Data        : 10/08/2015
Descrição   : Valor da Base do Déficit no arquivo de contracheque
--------------------------------------------------------------------------------
Pendência   : SOL 247292 PPM 650030
Responsável : Helio Lima Custódio
Data        : 28/01/2015
Descrição   : Ajuste Contracheque que nao sao de pensao alimenticia, estavam
              sendo gerados em pensao alimenticia
--------------------------------------------------------------------------------
Pendência   : SOL 206183 KINTANA 1996389
Responsável : Helio Lima Custódio
Data        : 16/06/2014
Descrição   : Especificar o estado para gerar o contracheck para o estado selecionado
--------------------------------------------------------------------------------
Pendência   : SOL 224217 KINTANA 2057741
Responsável : Fernando Xavier
Data        : 23/01/2014
Descrição   : Ajuste no contracheque
--------------------------------------------------------------------------------
Pendência   : SOL 222663 KINTANA 2055984
Responsável : Marcio Sanches Spinosa SOL 222679 KINTANA 2055968
Data        : 20/12/2013
Descrição   : Ajuste no contracheque
--------------------------------------------------------------------------------
Pendência   : SOL 222679 KINTANA 2055968
Responsável : Marcio Sanches Spinosa SOL 222679 KINTANA 2055968
Data        : 20/12/2013
Descrição   : Ajuste no contracheque
--------------------------------------------------------------------------------
Pendência   : SOL 218835 KTN  2051764
Responsável : Fernando Xavier
Data        : 31/10/2013
Descrição   : ERRO GERAÇÃO DEMONSTRATIVOS DE PROVENTOS
--------------------------------------------------------------------------------
Pendência   : SOL 179587 KINTANA 1659235
Responsável : Douglas.Siqueira
Data        : 03/07/2012
Descrição   : Gravar o campo IR informativo no arquivo do contracheque
--------------------------------------------------------------------------------
Pendência   : SOL 163202 KINTANA 1392070
Responsável : BRUNO AZEVEDO
Data        : 15/08/2011
Descrição   : Ajuste na query para pensão alimentícia.
--------------------------------------------------------------------------------
Pendência   : SOL 158705/5441 KINTANA 1345367
Responsável : ALINE FREIRE
Data        : 28/06/2011
Descrição   : Aumentei o campo Logradouro para 80 posições.
--------------------------------------------------------------------------------
Pendência   : SOL 154801 KINTANA 1189702
Responsável : FERNANDO XAVIER
Data        : 25/03/2011
Descrição   : Erro de Contracheques
--------------------------------------------------------------------------------
Pendência   : SOL 149566 KINTANA 1095608
Responsável : FERNANDO XAVIER
Data        : 13/01/2011
Descrição   : Erro na duplicação das informações de Pensão Alimentícia
--------------------------------------------------------------------------------
Pendência   : SOL 138794 KINTANA 849596
Responsável : BRUNO AZEVEDO
Data        : 30/06/2010
Descrição   : Ajuste na query que busca a matricula do assistido.
--------------------------------------------------------------------------------
Pendência   : SOL 136947 KINTANA 822336
Responsável : Fernando Santana
Data        : 02/06/2010
Descrição   : Para os assitidos que possuem duas matriculas (CAIXA e FUNCEF)
              o demonstrativo deve ser gerado na matricula CAIXA.
              Quando campo marcado flgdestcc não gerar demonstrativo
-------------------------------------------------------------------------
Pendência   : SOL 135612 KINTANA 808409
Responsável : BRUNO AZEVEDO
Data        : 13/05/2010
Descrição   : Alteração para buscar o nome da agência corretamente " AND TIPOCONTA = 2".
--------------------------------------------------------------------------------
Pendência   : SOL 133261 KINTANA 776460
Responsável : BRUNO AZEVEDO
Data        : 01/04/2010
Descrição   : Alteração para buscar a conta Salário Preferencial.
--------------------------------------------------------------------------------
Pendência   : SOL 133088 KINTANA 775056
Responsável : BRUNO AZEVEDO
Data        : 31/03/2010
Descrição   : Buscar a conta não preferencial caso a conta seja = "".
--------------------------------------------------------------------------------
Pendência   : SOL 131339 KINTANA 754741
Responsável : BRUNO AZEVEDO
Data        : 04/03/2010
Descrição   : Retirado o relacionamento AND BF.IDPLANOPREV = PPP.IDPLANOPREV da qry.
------------------------------------------------------------------------------
Autor(a)    :  Daniel Begnami
Data        :  14/09/2009
Pendência   :  SOL 124384 Kintana 631157
Descricao   :  Erro na Data do LayOut IBM.
--------------------------------------------------------------------------------
Autor(a)    :  Daniel Begnami
Data        :  14/09/2009
Pendência   :  SOL 124345 Kintana 630670
Descricao   :  Erro de Query: "Single-row subquery returns more than one row".
--------------------------------------------------------------------------------
Autor(a)    :  Renato Visoni
Data        :  31/08/2009
Pendência   :  SOL 123557 Kintana 620123
Descricao   :  Os campos número de beneficio INSS e Tipo de Beneficio INSS
               estam sendo carregados incorretamente para alguns assistidos.
--------------------------------------------------------------------------------
Autor(a)    :  Renato Visoni
Data        :  02/09/2009
Pendência   :  SOL 123556 Kintana 622470
Descricao   :  Ajuste no leiaute para geração do contra-cheque.
--------------------------------------------------------------------------------
Autor(a)    :  Jéssica Lana
Data        :  20/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
--------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 29/08/2007
Rotina      : Processa
Pendência   : 22537 (ReAbertura)
Descricao   : Disparar a geração automaticamente a geração do arquivo dos
              demonstrativos no modulo FUNCEF (Contra-Cheque)
---------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 03/08/2007
Rotina      : MontaQuery, MontaQueryP2 e MontaQueryPensAlim
Pendência   : 25959
Descricao   : Buscar o campo NUMDEPIRRF e NUMDEPSALF da HistRubSal e não mais da tabela PessoaFisica.
              Ao invés de aumentar o número do idpessoa para 2.000.000 coloquei o valor maior que
              460.000.
              Obs.: Isso é provisório.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 26/07/2007
Rotina      : MontaQuery, MontaQueryP2 e MontaQueryPensAlim
Pendência   : 25950
Descricao   : Buscar o campo NUMDEPIRRF e NUMDEPSALF da HistRubSal e não mais da tabela PessoaFisica.
              Aumentei para 2.000.0000 o número do idpessoa buscado na 2ª query.  
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 08/06/2007
Rotina      : bbtnConfirmarClick(...), Monta(...), nova RetornaVlrCompensaIR(...)
Pendência   : 23867
Descricao   : Busca e gravação, no contra-cheque, do valor de IR compensado
----------------------------------------------------------------------------------------------------
Autor(a)    : Paulo Ramos
Data        : 05/04/2006
Rotina      : Monta
Pendência   : 24944
Descricao   : Correção na query que busca dados do benefícios funcef de forma a selecionar dados do
              benefício ativo preferencialmente.
----------------------------------------------------------------------------------------------------
Autor(a)    : Paulo Ramos
Data        : 19/09/2006
Rotina      : MontaQuery
Pendência   : 23339
Descricao   : Correção do ordey by na query principal para tratar casos em que a pessoa é aposentada
              e pensionista e recebe os 2 pagamentos simultaneamente.
              Nesta situação gerava vários contracheques, e não apenas 2 como previsto.
----------------------------------------------------------------------------------------------------
Autor(a)    : André Pontes
Data        : 18/08/2006
Rotina      : MontaQuery e Monta
Pendência   : 22587
Descricao   : Join das queries com o plano ativo (flgdesativado = 0)
----------------------------------------------------------------------------------------------------
Autor(a)    : Paulo Ramos
Data        : 02/06/2006
Rotina      : Monta
Pendência   : 22498
Descricao   : Exibir a NB do benefício de INSS ativo se existir, senão exibir o cancelado.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 06/04/2006
Rotina      : Monta
Pendência   : 21990
Descricao   : Alteração na query que busca o benefício de referência para buscar o número do processo
              do inss na benefbfciario. Logo foi necessário colocar a tabela benefbfciario na query.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 31/03/2006
Rotina      : Monta
Pendência   : 20369
Descricao   : Não permitir gerar contracheque para quem tiver CEP nulo ou '00000000'.
----------------------------------------------------------------------------------------------------
Autor(a)    : Bruno Bastos
Data        : 06/12/2005
Rotina      : MontaPensAlim
Pendência   : 20744
Descricao   : Testar cep '00000000' e não '00000-000'.
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Spin, Db, DBTables, Wwquery, JclStrings,
  MontaSelect, Wwdatsrc, uGImp, UDatabase, CheckLst, {UObjFolha,}
  fcButton, fcImgBtn, fcShapeBtn, fFrameLista, Provider, DBClient,
  uCMClientDataSet, uCmSqlParams;

type
    TFrmDemPag = class(TfrmOkCancelar)
    grpMesRef: TGroupBox;
    dblcHistorico: TwwDBLookupCombo;
    LblPortForma: TLabel;
    CBoxPortForma: TCheckBox;
    ChkLstPortForma: TCheckListBox;
    gbSalva: TGroupBox;
    Bevel1: TBevel;
    LblSalvar: TLabel;
    SpdBtnSalvar: TSpeedButton;
    PnlPatroePlano: TPanel;
    Splitter2: TSplitter;
    PnlPatro: TPanel;
    PnlPlano: TPanel;
    LblPatro: TLabel;
    ChkLstPatro: TCheckListBox;
    CBoxPlano: TCheckBox;
    LblPlano: TLabel;
    ChkLstPlano: TCheckListBox;
    CBoxPatro: TCheckBox;
    qryAux: TwwQuery;
    qry: TwwQuery;
    DlgArquivo: TSaveDialog;
    qryHistorico: TwwQuery;
    LblDesc: TLabel;
    MmoDesc: TMemo;
    qryEstrutCalc: TwwQuery;
    qryPensaoAlim: TwwQuery;
    pnlIndiv: TPanel;
    frameBenef: TfrmFrameListaBenef;
    pnlGeraWeb: TPanel;
    lblNumLinhas: TLabel;
    chkGeraWeb: TCheckBox;
    edtNumLinhas: TEdit;
    qryP2: TwwQuery;
    sqlCompensaIR: TCMSqlParams;
    cdsCompensaIR: TCMClientDataSet;
    chkEstados: TCheckBox;
    qryCodEstado: TwwQuery;
    qryCodEstadoCODESTADO: TStringField;

    procedure FormCreate(Sender: TObject);
    procedure dblcHistoricoChange(Sender: TObject);
    procedure CBoxPatroClick(Sender: TObject);
    procedure CBoxPlanoClick(Sender: TObject);
    procedure CBoxPortFormaClick(Sender: TObject);
    procedure ChkLstPatroClickCheck(Sender: TObject);
    procedure ChkLstPlanoClickCheck(Sender: TObject);
    procedure ChkLstPortFormaClickCheck(Sender: TObject);
    procedure ChkLstPatroClick(Sender: TObject);
    procedure ChkLstPlanoClick(Sender: TObject);
    procedure ChkLstPortFormaClick(Sender: TObject);
    procedure SpdBtnSalvarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkGeraWebClick(Sender: TObject);
    procedure fcsbtnLimpaClick(Sender: TObject);
    procedure fcsbtnProcurarClick(Sender: TObject);
    procedure edNomeChange(Sender: TObject);
    procedure frameBenefbbtnIncluiBenefClick(Sender: TObject);
    procedure frameBenefqryListaAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure chkEstadosClick(Sender: TObject);

  private // Private declarations

    sMesRef,
    sNomeResponNaoRec      : string;

    iContraChequeP1eP2, 
    iTotLinha,
    iTotBenef,
    iNumLinhasxCCheque,
    GuardaIdRubExibicao30,
    GuardaIdRubExibicao70,
    iCodTpRecebedor,
    lidTitular,
    lidRecebedor,
    lidResponNaoRec,
    lidPatro,
    lidPlanoPrev           : Integer;
    lidrubcpmfpainssdesc: integer;

    ListaPatro     : TStringList;
    ListaPlano     : TStringList;
    ListaPortForma : TStringList;
    sPatroSel, sPlanoSel, sPortFormaSel : string;

    ListaEstados   : TStringList;//Helio - SOL Nº 206183 KINTANA Nº 1996389

    function  MontaQuery(Qry: TwwQuery; ExecutaSQL : Boolean) : boolean; //Helio - SOL Nº 206183 KINTANA Nº 1996389 adicionar ExecutaSQL
    function  MontaQueryP2(Qry: TwwQuery; ExecutaSQL : Boolean): boolean; //Helio - SOL Nº 206183 KINTANA Nº 1996389 adicionar ExecutaSQL
    function  MontaQueryPensAlim(qryPensaoAlim: TwwQuery; ExecutaSQL : Boolean): boolean; //Helio - SOL Nº 206183 KINTANA Nº 1996389 adicionar ExecutaSQL

    procedure MontaListaPatro;
    procedure MontaListaPlano;
    procedure MontaListaPortForma;

    procedure VerificaProcessa;

    procedure DeterminaPatroSel;
    procedure DeterminaPlanoSel;

    procedure DeterminaPortForma;

    procedure GuardaEstruturas;

    procedure BuscaCEP(pIdPessoa : Integer; var sCEP_Corresp, sCEP_Resid : string);

    function  RetornaVlrCompensaIR(const pIDPessoa: Integer): Currency;

    //Helio - SOL Nº 206183 KINTANA Nº 1996389
    function ObtemListaCodEstadosSemDepedentes : TStringList;
    function ObtemEstadosSeparadosPorVirgula: String;
    //FIM Helio - SOL Nº 206183 KINTANA Nº 1996389

  public  // Public declarations

    FSaida: text;
    bDemonstrativoAutomatico : Boolean; //CPrev - 22537

    function Monta(qry, QryAux: TwwQuery; iParte: Integer): Boolean;
    function EspacoAEsq(Texto: string; Tam: Integer):string;
    function MontaPensAlim(qryPensaoAlim, qryAux: TwwQuery): Boolean;
    procedure Cria(aNomeArquivo: string);
    procedure Encerra;


  end;



var
  FrmDemPag : TFrmDemPag;
  ExecutandoBuscaEstados : Boolean;



implementation
{$R *.DFM}
uses
  uMensErro, uFuncoesFolha, uSistema, fAguarde,

  //Helio - SOL Nº 206183 KINTANA Nº 1996389
  FDemPagSelEstado;



function LeftPad(Texto:string;Tam:byte):string;  {margeia o texto pela esqueda}
begin
  Texto   := trim(Copy(Texto, 1, Tam));
  Texto   := Texto + Replicate(' ', Tam - Length(Texto));
  LeftPad := Texto;
end;



function RightPad(Texto:string;Tam:byte):string;  {margeia o texto pela direita}
begin
  Texto     := trim(Copy(Texto, 1, Tam));
  Texto     := Replicate('0', Tam - Length(Texto)) + Texto;
  RightPad  := Texto;
end;



procedure TFrmDemPag.FormCreate(Sender: TObject);
begin
  inherited;

  //Jéssica Lana Nunes dos Santos SOL 109421 KINTANA 496332
  DlgArquivo.Initialdir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\ArqCheque.dat';
  LblSalvar.Caption := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\ArqCheque.dat';

  ListaPatro     := TStringList.Create;
  ListaPlano     := TStringList.Create;
  ListaPortForma := TStringList.Create;

  qryHistorico.Open;

  bDemonstrativoAutomatico := False; //CPrev - 22537
end;



procedure TFrmDemPag.MontaListaPatro;
begin
  ChkLstPatro.Items.Clear;
  ListaPatro.Clear;
  If FazQuery(qryAux, 'SELECT DISTINCT PP.IDPESSOA, P.NOME '+
                      'FROM HISTRUBSAL H, PATRO PP, PESSOA P '+
                      'WHERE (H.IDHSTFOLHABENEF = '+
                       IntToStr(qryHistorico.FieldByName('IDHSTFOLHABENEF').AsInteger)+') '+
                      'AND (H.IDPATRO = PP.IDPESSOA) '+
                      'AND (PP.IDPESSOA = P.IDPESSOA) '+
                      'ORDER BY P.NOME') Then
    While Not qryAux.EOF Do
    Begin
      ChkLstPatro.Items.Add(qryAux.FieldByName('NOME').AsString);
      ListaPatro.Add(qryAux.FieldByName('IDPESSOA').AsString);
      qryAux.Next;
    End;
end;



procedure TFrmDemPag.MontaListaPlano;
begin
  ChkLstPlano.Items.Clear;
  ListaPlano.Clear;
  If FazQuery(qryAux, 'SELECT DISTINCT PP.IDPLANOPREV, PP.NOME '+
                      'FROM HISTRUBSAL H, PLANPREV PP '+
                      'WHERE (H.IDHSTFOLHABENEF = '+
                      IntToStr(qryHistorico.FieldByName('IDHSTFOLHABENEF').AsInteger)+') '+
                      'AND (H.IDPLANOPREV = PP.IDPLANOPREV) '+
                      'ORDER BY PP.NOME') Then
    While Not qryAux.EOF Do
    Begin
      ChkLstPlano.Items.Add(qryAux.FieldByName('NOME').AsString);
      ListaPlano.Add(qryAux.FieldByName('IDPLANOPREV').AsString);
      qryAux.Next;
    End;
end;



procedure TFrmDemPag.MontaListaPortForma;
begin
  ChkLstPortForma.Items.Clear;
  ListaPortForma.Clear;
  If FazQuery(qryAux, 'SELECT DISTINCT P.CODPORTFORMA, P.DESCRICAO '+
                      'FROM HISTRUBSAL H, PORTADORFORMA P '+
                      'WHERE (H.IDHSTFOLHABENEF = '+
                      IntToStr(qryHistorico.FieldByName('IDHSTFOLHABENEF').AsInteger)+') '+
                      'AND (H.CODPORTFORMA = P.CODPORTFORMA) '+
                      'ORDER BY P.DESCRICAO') then
    While Not qryAux.EOF Do
    Begin
      ChkLstPortForma.Items.Add(qryAux.FieldByName('DESCRICAO').AsString);
      ListaPortforma.Add(qryAux.FieldByName('CODPORTFORMA').AsString);
      qryAux.next;
    End;
end;

procedure TFrmDemPag.dblcHistoricoChange(Sender: TObject);
begin
  inherited;
  MontaListaPatro;
  MontaListaPlano;
  MontaListaPortforma;
  VerificaProcessa;
end;

procedure TFrmDemPag.VerificaProcessa;
begin
  DeterminaPatroSel;
  DeterminaPlanoSel;
  DeterminaPortforma;
  bbtnConfirmar.enabled:=((dblcHistorico.text <> '') and
                         ((sPatroSel <> '') or (cboxPatro.checked)) and
                         ((sPlanoSel <> '') or (cboxPlano.checked)) and
                         ((sPortformaSel <> '') or (cboxPortforma.checked)) or
                         (dblcHistorico.text <> '') and
                         (lidPatro > 0) and (lidPlanoPrev > 0)) or
                         (Not frameBenef.qryLista.EOF);
  chkEstados.Enabled := bbtnConfirmar.enabled; //Helio - SOL Nº 206183 KINTANA Nº 1996389
end;

procedure TFrmDemPag.DeterminaPatroSel;
begin
  If Not CBoxPatro.Checked then
    MontaFiltro(ChkLstPatro, ListaPatro, sPatroSel);
end;

procedure TFrmDemPag.DeterminaPlanoSel;
begin
  If Not CBoxPatro.Checked then
    MontaFiltro(ChkLstPlano, ListaPlano, sPlanoSel);
end;

procedure TFrmDemPag.DeterminaPortForma;
begin
  If Not CBoxPatro.Checked then
    MontaFiltro(ChkLstPortForma, ListaPortForma, sPortFormaSel);
end;


//Helio - SOL Nº 206183 KINTANA Nº 1996389
//adicionar ExecutaSQL
function TFrmDemPag.MontaQuery(Qry: TwwQuery; ExecutaSQL : Boolean): boolean;
var
  sSql : string;
  estadosSepVirgula : String; //Helio - SOL Nº 206183 KINTANA Nº 1996389
begin
  Result := True;
  DeterminaPatroSel;
  DeterminaPlanoSel;
  DeterminaPortforma;

  sSql :=
    ' SELECT G.FLGESPECIAL, G.IDTITULAR, G.IDPESSOA, '+
    ' G.IDPATRO AS IDPESSJUR, '+
    ' G.IDRESPONSAVEL, G.NOMERECEBEDOR, G.NOMEBENEFICIARIO, G.NOMETITULAR, G.PRAZO, '+
    ' G.CONTACORRENTE, G.NUMAGENCIA, G.NUMBANCO, '+
    ' G.SEQRUBRICA, G.IDHSTFOLHABENEF, G.DATAPAGAMENTO, G.MESREFERENCIA, G.MATRICULA, ' +
    ' G.DATANASC, G.NUMDEPIRRF, G.NUMDEPSALF, G.POSTAGEM, G.ISENTOIRRF, G.FORMAPAGTO, G.CODPROVDESC, '+
    ' G.DESCRPROVDESC, G.TPRUBRICA, G.FLGDESCONTO,G.FLGIRRFINFORMATIVO, SUM(G.INFORMATIVO)INFORMATIVO, G.IDPROVENTO, G.NUMPROCINSS, SUM(G.VALORINFO) '+///douglas.siqueira SOL179587
    ' VALORINFO, SUM(G.VALORRECEBIDO) VALORRECEBIDO, SUM(G.VALORPROVENTO) VALORPROVENTO '+

    //Helio - SOL Nº 206183 KINTANA Nº 1996389
    ', G.CODESTADO ' +
    ', G.UF ' +
    ', DECODE(G.DEFICIT,43,1,0) AS DEFICIT ' +
    'FROM (SELECT DISTINCT H.IDHSTFOLHABENEF, PD.FLGESPECIAL, H.DATAPAGAMENTO, '+
    ' H.SEQRUBRICA, '+
    ' H.MES AS MESREFERENCIA, H.IDRESPONSAVEL, '+
    ' NREC.NOME AS NOMERECEBEDOR, D.MATRICULA, H.IDTITULAR, H.IDPESSOA, '+
    ' H.IDPATRO, '+
    ' H.CONTACORRENTE, H.NUMAGENCIA, H.NUMBANCO, '+
    ' H.IDPLANOPREV, BENEF.NOME AS NOMEBENEFICIARIO, TIT.NOME AS NOMETITULAR, PF.DATANASC, '+
    ' TO_CHAR(NVL(H.NUMDEPIRRF, 00), ''09'') AS NUMDEPIRRF, TO_CHAR(NVL(H.NUMDEPSF, 00), ''09'') '+
    ' AS NUMDEPSALF, 1 AS POSTAGEM, DECODE(PF.FLGISENTOIRRF, 1, ''SIM'', ''NÃO'') ISENTOIRRF, '+
    ' POF.DESCRICAO AS FORMAPAGTO, ';

    sSql := sSql +
      ' PD.DESCRPROVDESC AS DESCRPROVDESC, '+
      ' PD.CODPROVDESC AS CODPROVDESC, ';

  sSql := sSql +
    '       TO_CHAR(H.VALORINFO, ''0000000000D00'') AS VALORINFO, '+
    '       TO_CHAR(H.VALORRECEBIDO, ''0000000000D00'') AS VALORRECEBIDO, '+

    ' DECODE(PD.FLGESPECIAL, 0, DECODE(PD.FLGDESCONTO, 1, ''D'', 0, ''P'', ''I''), ''I'') AS TPRUBRICA, '+
    ' H.PARCELAS AS PRAZO, PD.FLGDESCONTO,PD.FLGIRRFINFORMATIVO,DECODE(H.VALORPROVENTO,0,H.VALORINFO,NVL(H.VALORPROVENTO,H.VALORINFO)) AS INFORMATIVO, TO_CHAR(H.VALORPROVENTO, ''0000000000D00'') AS VALORPROVENTO, '+///douglas.siqueira SOL179587
    ' PD.IDPROVENTO, H.NUMPROCINSS '+

    //Helio - SOL Nº 206183 KINTANA Nº 1996389
    ', CASE WHEN ENDP.IDENDERECO IS NULL THEN ENDP1.CODESTADO ' +
    '  ELSE ENDP.CODESTADO END AS CODESTADO, ' +
    '  CASE WHEN ENDP.IDENDERECO IS NULL THEN CID1.UF ' +
    '  ELSE CID.UF END AS UF' +
    '  , EST.IDESTRUTURA AS DEFICIT ' +  // SOL 253577/17651 PPM 1015006
    ' FROM ESTRUTURACALCULO EST, '+  // SOL 253577/17651 PPM 1015006
    ' HISTRUBSAL H, DEPENTIT D, PROVDESC PD, PORTADORFORMA POF, PESSOAFISICA PF, PESSOA BENEF, '+
    ' PESSOA TIT, PESSOA NREC ';

    //Helio - SOL Nº 206183 KINTANA Nº 1996389
    sSql := sSql + ',ENDPESS ENDP, ENDPESS ENDP1, CIDADES CID, CIDADES CID1 ';

  sSql := sSql +
    ' WHERE H.IDRUBRICA   =  EST.IDRUBRICAEXIBICAO(+) '+ // SOL 253577/17651 PPM 1015006
    ' AND H.IDHSTFOLHABENEF = '+IntToStr(qryHistorico.FieldByName('IDHSTFOLHABENEF').AsInteger)+' '+
    ' AND H.IDRESPONSAVEL BETWEEN 1 AND 460000 '+

    //BRUNO AZEVEDO SOL 138794 KINTANA 849596
    ' AND H.IDPATRO = 91008 ';

  //Helio - SOL Nº 206183 KINTANA Nº 1996389
  sSql := sSql + ' AND BENEF.IDENDCORRESP     = ENDP.IDENDERECO(+) ' +
                   ' AND BENEF.IDENDRESIDENCIAL = ENDP1.IDENDERECO(+) ' +
                   ' AND ENDP.IDCIDADES  = CID.IDCIDADES(+) ' +
                   ' AND ENDP1.IDCIDADES = CID1.IDCIDADES(+) ';


  If (Not frameBenef.qryLista.IsEmpty) And
     (Not bDemonstrativoAutomatico) Then //CPrev - 22537
    ssql:=ssql+'AND EXISTS (SELECT 1 '+
                           'FROM LISTAFOLHABENEFDET LD '+
                           'WHERE H.IDTITULAR = LD.IDTITULAR '+
                           'AND LD.IDLISTA = '+IntToStr(framebenef.ListaUsuario)+') '
  Else
  Begin
    If sPatroSel <> '' Then
    Begin
      If Pos(',', sPatroSel) = 0 Then
        sSql := sSql+' AND H.IDPATRO = '+sPatroSel+' '
      Else
        sSql := sSql+' AND H.IDPATRO in ('+sPatroSel+') ';
    End;
    If sPlanoSel <> '' Then
    Begin
      If Pos(',', sPlanoSel) = 0 Then
        sSql := sSql+' AND H.IDPLANOPREV = '+sPlanoSel+' '
      Else
        sSql := sSql+' AND H.IDPLANOPREV in ('+sPlanoSel+') ';
    End;
    If sPortformaSel <> '' Then
    Begin
      If Pos(',', sPortformaSel) = 0 Then
        sSql := sSql+' AND H.CODPORTFORMA = '+sPortformaSel+' '
      Else
        sSql := sSql+' AND H.CODPORTFORMA in ('+sPortformaSel+') ';
    End;
  End;

  sSql := sSql +
  ' AND (H.FLGESTORNO IS NULL OR H.FLGESTORNO = 0) '+
  ' AND H.FLGPENSAOALIM   <> 2 '+
  ' AND H.IDRESPONSAVEL    = NREC.IDPESSOA '+
  ' AND D.IDTITULAR        = H.IDTITULAR '+
  ' AND D.IDPESSOA(+)      = H.IDRESPONSAVEL '+
  ' AND PD.IDPROVENTO      = H.IDRUBRICA '+
  ' AND POF.CODPORTFORMA   = H.CODPORTFORMA '+
  ' AND BENEF.IDPESSOA     = H.IDRESPONSAVEL '+
  ' AND TIT.IDPESSOA       = H.IDTITULAR '+
  ' AND PF.IDPESSOA        = H.IDRESPONSAVEL'+
  ' AND nvl(PF.flgdestcc,0)<> 1) G ';

  //Helio - SOL Nº 206183 KINTANA Nº 1996389
  if (chkEstados.Checked) and (not ExecutandoBuscaEstados) then
  begin
    estadosSepVirgula := ObtemEstadosSeparadosPorVirgula;

    sSql := sSql + ' WHERE (((G.CODESTADO IS NOT NULL) AND '+
      '(G.CODESTADO IN (' + estadosSepVirgula + '))) ' +
      ' OR ' +
      ' ((G.CODESTADO IS NULL) AND ' +
      '(G.UF IN (' + estadosSepVirgula +')) )) ';
  end;
  //FIM Helio - SOL Nº 206183 KINTANA Nº 1996389

  sSql := sSql + ' GROUP BY G.PRAZO, G.IDRESPONSAVEL, G.IDHSTFOLHABENEF, G.SEQRUBRICA, G.DATAPAGAMENTO, G.MESREFERENCIA, '+
  ' G.MATRICULA, G.IDTITULAR, '+
  ' + G.NOMEBENEFICIARIO, G.NOMETITULAR, G.DATANASC, G.NUMDEPIRRF, '+
  ' G.NUMDEPSALF, G.POSTAGEM, G.ISENTOIRRF, G.FORMAPAGTO, G.CODPROVDESC, G.DESCRPROVDESC, G.TPRUBRICA, '+
  ' G.FLGDESCONTO,G.FLGIRRFINFORMATIVO,G.INFORMATIVO, G.IDPROVENTO, G.NUMPROCINSS, G.NOMERECEBEDOR, '+///douglas.siqueira SOL179587
  ' G.CONTACORRENTE, G.NUMAGENCIA, G.NUMBANCO, '+
  ' G.IDPESSOA, G.IDPATRO, G.FLGESPECIAL '+

  //Helio - SOL Nº 206183 KINTANA Nº 1996389
  ', G.CODESTADO ' +
  ', G.UF ' +
  ', G.DEFICIT ' +  // SOL 253577/17651 PPM 1015006
//  ' ORDER BY IDTITULAR, ' + // ORDENAÇÃO DEVE CONSIDERAR O TITULAR PARA QUEBRAR CONTRACHEQUE DAS              //Everson TIBERO
                            // PESSOAS QUE SÃO APOSENTADA E PENSIONISTA NUM MESMO MOMENTO.
  ' ORDER BY G.IDTITULAR, ' + // ORDENAÇÃO DEVE CONSIDERAR O TITULAR PARA QUEBRAR CONTRACHEQUE DAS
                            // PESSOAS QUE SÃO APOSENTADA E PENSIONISTA NUM MESMO MOMENTO.                      //Everson TIBERO
//  '   IDRESPONSAVEL, SEQRUBRICA ';   //Everson TIBERO
  '   G.IDRESPONSAVEL, G.SEQRUBRICA '; //Everson TIBERO

  qry.Sql.Clear;
  qry.Sql.Add(sSql);

  if ExecutaSQL then //Helio - SOL Nº 206183 KINTANA Nº 1996389
      qry.Open;
end;

procedure TFrmDemPag.CBoxPatroClick(Sender: TObject);
begin
  inherited;
  MarcaLista(ChkLstPatro, CBoxPatro.Checked);
  VerificaProcessa;
end;

procedure TFrmDemPag.CBoxPlanoClick(Sender: TObject);
begin
  inherited;
  MarcaLista(ChkLstPlano, CBoxPlano.Checked);
  VerificaProcessa;
end;

procedure TFrmDemPag.CBoxPortFormaClick(Sender: TObject);
begin
  inherited;
  MarcaLista(ChkLstPortForma, CBoxPortForma.Checked);
  VerificaProcessa;
end;

procedure TFrmDemPag.ChkLstPatroClickCheck(Sender: TObject);
begin
  inherited;
  CBoxPatro.Checked := VerificaLista(ChkLstPatro);
end;

procedure TFrmDemPag.ChkLstPlanoClickCheck(Sender: TObject);
begin
  inherited;
  CBoxPlano.Checked := VerificaLista(ChkLstPlano);
end;

procedure TFrmDemPag.ChkLstPortFormaClickCheck(Sender: TObject);
begin
  inherited;
  CBoxPortForma.Checked := VerificaLista(ChkLstPortForma);
end;

procedure TFrmDemPag.ChkLstPatroClick(Sender: TObject);
begin
  inherited;
  VerificaProcessa;
end;

procedure TFrmDemPag.ChkLstPlanoClick(Sender: TObject);
begin
  inherited;
  VerificaProcessa;
end;

procedure TFrmDemPag.ChkLstPortFormaClick(Sender: TObject);
begin
  inherited;
  VerificaProcessa;
end;

procedure TFrmDemPag.SpdBtnSalvarClick(Sender: TObject);
begin
  inherited;
  DlgArquivo.FileName   := LblSalvar.Caption;
  DlgArquivo.InitialDir := ExtractFilePath(LblSalvar.Caption);
  If DlgArquivo.Execute Then LblSalvar.Caption := DlgArquivo.FileName;
end;

procedure TFrmDemPag.bbtnConfirmarClick(Sender: TObject);
var bTemRegistro : boolean; //P.RAMOS-15/08/2007-PEND.26110-TRATAR MENSAGEM
begin
  inherited;
  If Not chkGeraWeb.Checked  Then
  Begin
    If Trim(edtNumLinhas.Text) = '' Then
    Begin
      MsgDlg('Digite o número de linhas por contra cheque.', 'Informação', mtInformation, [mbOk], 0);
      Exit;
    End;
    iNumLinhasxCCheque := StrToIntDef(Trim(edtNumLinhas.Text), 0);
  End
  Else
    iNumLinhasxCCheque := 1000;

  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT MESREFERENCIA FROM HSTFOLHABENEF WHERE IDHSTFOLHABENEF = '+dblcHistorico.LookupValue);
  qryAux.Open;

  sMesRef := copy(qryAux.FieldByName('MESREFERENCIA').AsString, 6, 2);
  sMesRef := sMesRef + copy(qryAux.FieldByName('MESREFERENCIA').AsString, 1, 4);

  GuardaEstruturas;
  Cria(lblSalvar.caption);

  cdsCompensaIR.Close;
  sqlCompensaIR.Prepare;
  sqlCompensaIR.ParamByName('IDHSTFOLHABENEF').AsInteger := qryHistorico.FieldByName('IDHSTFOLHABENEF').AsInteger;
  sqlCompensaIR.Open;

  bTemRegistro := false;

  MontaQuery(Qry, True);
  bTemRegistro := bTemRegistro or not qry.isempty;
  MontaQueryPensAlim(qryPensaoAlim, True);
  bTemRegistro := bTemRegistro or not qryPensaoAlim.isempty;

  iTotBenef     := 0;
  iTotLinha     := 0;
  //if not qry.isempty then
    Monta(qry, qryAux, 1);

  MontaQueryP2(QryP2, True);
  bTemRegistro := bTemRegistro or not qryP2.isempty;
  if not qryP2.isempty then
    Monta(qryP2, qryAux, 2);

  if not qryPensaoAlim.isempty then
    MontaPensAlim(qryPensaoAlim, qryAux);

  if not bTemRegistro then
  Begin
    MsgDlg('Não existem pessoas para Emissão do Contra Cheque com as opções '+
           'selecionadas','Erro',mtError,[mbOk,mbHelp],0);
  End;

  Encerra;
  frmAguarde.Apaga;

  cdsCompensaIR.Close;

  ShowMessage('Geração concluída.');
end;


//Helio - SOL Nº 206183 KINTANA Nº 1996389
//adicionar ExecutaSQL
function TFrmDemPag.MontaQueryPensAlim(qryPensaoAlim: TwwQuery; ExecutaSQL : Boolean): boolean;
var
  sSql : string;
  estadosSepVirgula : String; //Helio - SOL Nº 206183 KINTANA Nº 1996389
begin
  sSql :=
  ' SELECT MIN(R.SEQRUBRICAINDIV) AS SEQ, G.FLGESPECIAL, G.CODTIPORECEBEDOR, '+
  ' G.IDTITULAR, G.IDPESSOA, G.IDRESPONSAVEL, G.IDFAVORECIDO, G.NOMERECEBEDOR, '+
  ' G.NOMEBENEFICIARIO, G.NOMETITULAR, G.PRAZO, G.SEQRUBRICA, G.IDHSTFOLHABENEF, '+
  ' G.DATAPAGAMENTO, G.MESREFERENCIA, G.MATRICULA, G.INSCRICAONUMERO, G.PATRO, '+
  ' G.IDPATRO, G.IDPLANOPREV, G.PLANO, G.DATANASC, G.NUMDEPIRRF, G.NUMDEPSALF, '+
  ' G.POSTAGEM, G.ISENTOIRRF, G.FORMAPAGTO, G.NUMBANCO, G.NUMAGENCIA, '+
  ' G.CONTACORRENTE, G.IDESTAB, G.CODPROVDESC, G.DESCRPROVDESC, G.TPRUBRICA, '+
  ' G.FLGDESCONTO, G.FLGIRRFINFORMATIVO, SUM(G.INFORMATIVO)INFORMATIVO, G.IDPROVENTO, G.NUMPROCINSS, G.NOMEAGENCIA, G.CONSIGNATARIO, '+///douglas.siqueira SOL179587
  ' G.IDBENEFICIO, G.FLGREFERENCIA, G.NOMETPBENEF, G.IDRECEBEDOR, '+
  ' G.CONTACORRENTE, G.NUMAGENCIA, G.NUMBANCO, '+
  ' TO_NUMBER(G.VALORINFO) AS VALORINFO, TO_NUMBER(G.VALORRECEBIDO) AS VALORRECEBIDO, '+
  ' TO_NUMBER(G.VALORPROVENTO) AS VALORPROVENTO '+

  //Helio - SOL Nº 206183 KINTANA Nº 1996389
  ', G.CODESTADO ' +
  ', G.UF ' +

  (* FROM *)
  ' FROM RUBRICAINDIV R, (SELECT DISTINCT H.IDHSTFOLHABENEF, H.DATAPAGAMENTO, '+
  ' H.SEQRUBRICA, H.MES AS MESREFERENCIA, '+
  ' H.IDRESPONSAVEL, BFC.IDRESPONSAVEL AS IDRECEBEDOR, NREC.NOME AS NOMERECEBEDOR, '+
  ' TPREC.CODTIPORECEBEDOR, E.MATRICULA, PP.INSCRICAONUMERO, H.IDTITULAR, '+
  ' H.IDPESSOA, PAT.NOME AS PATRO, H.IDPATRO, H.IDPLANOPREV, PL.NOME AS PLANO, '+
  ' BENEF.NOME AS NOMEBENEFICIARIO, TIT.NOME AS NOMETITULAR, PF.DATANASC, '+
  ' TO_CHAR(NVL(H.NUMDEPIRRF, 00), ''09'') AS NUMDEPIRRF, '+
  ' TO_CHAR(NVL(H.NUMDEPSF, 00), ''09'') AS NUMDEPSALF, '+
  ' 1 AS POSTAGEM, '+
  ' DECODE(PF.FLGISENTOIRRF, 1, ''SIM'', ''NÃO'') ISENTOIRRF, '+
  ' POF.DESCRICAO AS FORMAPAGTO, H.NUMBANCO, H.NUMAGENCIA, H.CONTACORRENTE, '+
  ' E.IDESTAB, ';

    sSql := sSql +
            ' PD.DESCRPROVDESC AS DESCRPROVDESC, '+
            ' PD.CODPROVDESC AS CODPROVDESC, ';

  sSql := sSql +
  ' TO_CHAR(H.VALORINFO, ''0000000000D00'') AS VALORINFO, '+
  ' TO_CHAR(H.VALORRECEBIDO, ''0000000000D00'') AS VALORRECEBIDO, '+

  'DECODE(PD.FLGESPECIAL,0,DECODE(PD.FLGDESCONTO,1,''D'',0,''P'',''I''),''I'') AS TPRUBRICA, '+
  ' H.PARCELAS AS PRAZO, PD.FLGESPECIAL, '+
  ' PD.FLGDESCONTO,PD.FLGIRRFINFORMATIVO,DECODE(H.VALORPROVENTO,0,H.VALORINFO,NVL(H.VALORPROVENTO,H.VALORINFO)) AS INFORMATIVO, TO_CHAR(H.VALORPROVENTO, ''0000000000D00'') AS VALORPROVENTO, '+///douglas.siqueira SOL179587
  ' PD.IDPROVENTO, H.NUMPROCINSS, AGN.NOME AS NOMEAGENCIA, CONS.NOME AS CONSIGNATARIO, '+
  ' BBC.IDBENEFICIO, BPP.FLGREFERENCIA, BEN.NOME AS NOMETPBENEF, H.IDFAVORECIDO '+

  //Helio - SOL Nº 206183 KINTANA Nº 1996389
  ', CASE WHEN ENDP.IDENDERECO IS NULL THEN ENDP1.CODESTADO ' +
  '  ELSE ENDP.CODESTADO END AS CODESTADO, ' +
  '  CASE WHEN ENDP.IDENDERECO IS NULL THEN CID1.UF ' +
  '  ELSE CID.UF END AS UF' +

  ' FROM HISTRUBSAL H, PARTPREVPLAN PP, ELEGPATRO E, PROVDESC PD, PLANPREV PL, '+
  ' PORTADORFORMA POF, PESSOAFISICA PF, PESSOA BENEF, PESSOA TIT, PESSOA PAT, '+
  ' AGENCIABANCARIA AB, PESSOA AGN, BANCO BAN, PESSOA CONS, '+
  ' BENEFBFCIARIO BBC, BENEFPLANPREV BPP, BENEFICIO BEN, BFCIARIOTITPLAN BFC, '+
	'	PESSOA REC, PESSOA NREC, TIPORECEBEDOR TPREC ';

  //Helio - SOL Nº 206183 KINTANA Nº 1996389
  sSql := sSql + ',ENDPESS ENDP, ENDPESS ENDP1, CIDADES CID, CIDADES CID1';

  sSql := sSql + ' WHERE H.IDHSTFOLHABENEF = '+IntToStr(qryHistorico.FieldByName('IDHSTFOLHABENEF').AsInteger)+' ';

  //Helio - SOL Nº 206183 KINTANA Nº 1996389
  sSql := sSql + ' AND TIT.IDENDCORRESP     = ENDP.IDENDERECO(+) ' +
                   ' AND TIT.IDENDRESIDENCIAL = ENDP1.IDENDERECO(+) ' +
                   ' AND ENDP.IDCIDADES  = CID.IDCIDADES(+) ' +
                   ' AND ENDP1.IDCIDADES = CID1.IDCIDADES(+) ';
             
  //If Not frameBenef.qryLista.IsEmpty Then
  If (Not frameBenef.qryLista.IsEmpty) And
     (Not bDemonstrativoAutomatico) Then //CPrev - 22537
    ssql:=ssql+'AND EXISTS (SELECT 1 '+
                           'FROM LISTAFOLHABENEFDET LD '+
                           'WHERE H.IDTITULAR = LD.IDTITULAR '+
                           'AND LD.IDLISTA = '+IntToStr(framebenef.ListaUsuario)+') '
  Else
  Begin
    If sPatroSel <> '' Then
    Begin
      If Pos(',', sPatroSel) = 0 Then
        sSql := sSql+' AND H.IDPATRO = '+sPatroSel+' '
      Else
        sSql := sSql+' AND H.IDPATRO in ('+sPatroSel+') ';
    End;
    If sPlanoSel <> '' Then
    Begin
      If Pos(',', sPlanoSel) = 0 Then
        sSql := sSql+' AND H.IDPLANOPREV = '+sPlanoSel+' '
      Else
        sSql := sSql+' AND H.IDPLANOPREV in ('+sPlanoSel+') ';
    End;
    If sPortformaSel <> '' Then
    Begin
      If Pos(',', sPortformaSel) = 0 Then
        sSql := sSql+' AND H.CODPORTFORMA = '+sPortformaSel+' '
      Else
        sSql := sSql+' AND H.CODPORTFORMA in ('+sPortformaSel+') ';
    End;
  End;

  sSql := sSql +
          ' AND (H.FLGESTORNO IS NULL OR H.FLGESTORNO = 0) '+
          ' AND BBC.IDPLANOPREV      = BFC.IDPLANOPREV(+) '+
          ' AND BBC.IDBENEFICIO      = BFC.IDBENEFICIO(+) '+
          ' AND BBC.IDPESSJUR        = BFC.IDPESSJUR(+) '+
          ' AND BBC.IDTITULAR        = BFC.IDTITULAR(+) '+
          ' AND BBC.IDPLANOORIGEM    = BFC.IDPLANOORIGEM(+) '+
          ' AND BBC.IDPESSOA         = BFC.IDPESSOA(+) '+
          ' AND BBC.SEQPROPOSTA      = BFC.SEQPROPOSTA(+) '+
          ' AND H.IDRESPONSAVEL      = NREC.IDPESSOA '+
          ' AND BFC.IDPESSOA         = REC.IDPESSOA(+) '+
          ' AND BFC.CODTIPORECEBEDOR = TPREC.CODTIPORECEBEDOR(+) '+
          ' AND PP.IDPESSOA          = H.IDTITULAR '+

          'AND ((PP.IDPLANOPREV = H.IDPLANOPREV AND H.IDTITULAR = H.IDPESSOA) '+
          '  OR (PP.IDPLANOPREV = H.IDPLANOORIGEM AND H.IDTITULAR <> H.IDPESSOA)) '+

          ' AND PP.IDPESSJUR         = H.IDPATRO '+
          ' AND E.IDPESSOA           = H.IDTITULAR '+
          ' AND E.IDPESSJUR          = H.IDPATRO '+
          ' AND PD.IDPROVENTO        = H.IDRUBRICA '+
          ' AND PL.IDPLANOPREV       = H.IDPLANOPREV '+
          ' AND POF.CODPORTFORMA     = H.CODPORTFORMA '+
          ' AND BENEF.IDPESSOA       = H.IDRESPONSAVEL '+
          ' AND TIT.IDPESSOA         = H.IDTITULAR '+
          ' AND nvl(PF.flgdestcc,0)  <> 1'+
          ' AND PF.IDPESSOA          = H.IDRESPONSAVEL '+
          ' AND PAT.IDPESSOA         = H.IDPATRO '+
          ' AND H.NUMBANCO           = BAN.NUMBANCO '+
          ' AND BAN.IDPESSOA         = AB.IDBANCO '+
          ' AND H.NUMAGENCIA         = AB.NUMAGENCIA '+
//          ' AND ab.idpessoa = (SELECT /* /*+INDEX(AG XPKAGENCIABANCARIA)*/ '+  //INICIO SOL 149566 KINTANA 1095608   //Everson TIBERO
          ' AND ab.idpessoa = (SELECT  '+  //INICIO SOL 149566 KINTANA 1095608                                         //Everson TIBERO
          '                       MAX(idpessoa)                            '+
          '                      FROM agenciabancaria ag                   '+
          '                     WHERE ag.numagencia = ab.numagencia        '+
          '                       AND ag.numagencia = H.NUMAGENCIA         '+ // FIM SOL 149566 KINTANA 1095608
          '                       AND AG.IDBANCO = BAN.IDPESSOA)  '+ //BRUNO AZEVEDO SOL 163202 KINTANA 1392070
          ' AND AGN.IDPESSOA         = AB.IDPESSOA '+
          ' AND CONS.IDPESSOA(+)     = H.IDRESPONSAVEL '+
          ' AND H.IDPLANOPREV        = BBC.IDPLANOPREV(+) '+
          ' AND H.IDPESSJUR          = BBC.IDPESSJUR(+) '+
          ' AND H.IDPESSOA           = BBC.IDTITULAR(+) '+
          ' AND BBC.IDBENEFICIO      = BPP.IDBENEFICIO(+) '+
          ' AND BBC.IDPLANOPREV      = BPP.IDPLANOPREV(+) '+
          ' AND BBC.IDBENEFICIO      = BEN.IDBENEFICIO(+) '+
          ' AND H.VALORPROVENTO      > 0) G '+

          ' WHERE '+
          ' 	R.FLGTPRUBMANUT = 1 AND '+
          ' 	R.FLGPENSAOALIM = 1 AND '+
          '     R.IDTITULAR     = G.IDTITULAR AND '+
          '     R.IDFAVORECIDO  = G.IDRESPONSAVEL '+
          '     AND ((R.RUBRICAPROVENTOPA = G.IDPROVENTO)  OR (R.IDRUBRICAPROVENTO13 = G.IDPROVENTO) )'; //Helio - SOL Nº 247292 PPM Nº 650030 //SOL 265312 PPM 1169756

          //Helio - SOL Nº 206183 KINTANA Nº 1996389
          if (chkEstados.Checked) and (not ExecutandoBuscaEstados) then
          begin
             estadosSepVirgula := ObtemEstadosSeparadosPorVirgula;

             sSql := sSql + ' AND (((G.CODESTADO IS NOT NULL) AND '+
                    '(G.CODESTADO IN (' + estadosSepVirgula + '))) ' +
                    ' OR ' +
                    ' ((G.CODESTADO IS NULL) AND ' +
                    '(G.UF IN (' + estadosSepVirgula +')) )) ';
          end;
          //FIM Helio - SOL Nº 206183 KINTANA Nº 1996389

          sSql := sSql + '  GROUP BY '+
          '    G.PRAZO, G.IDRESPONSAVEL, G.IDHSTFOLHABENEF, G.SEQRUBRICA, '+
          '    G.DATAPAGAMENTO, G.MESREFERENCIA, G.MATRICULA, G.INSCRICAONUMERO, '+
          '    G.IDTITULAR, G.PATRO, G.IDPATRO, G.IDPLANOPREV, G.PLANO, '+
          '    G.NOMEBENEFICIARIO, G.NOMETITULAR, G.DATANASC, G.NUMDEPIRRF, '+
          '    G.NUMDEPSALF, G.POSTAGEM, G.ISENTOIRRF, G.FORMAPAGTO, G.NUMBANCO, '+
          '    G.NUMAGENCIA, G.CONTACORRENTE, G.CODPROVDESC, G.IDESTAB, '+
          '    G.DESCRPROVDESC, G.TPRUBRICA, G.FLGDESCONTO, G.FLGIRRFINFORMATIVO,G.INFORMATIVO,G.IDPROVENTO, G.NUMPROCINSS, '+///douglas.siqueira SOL179587
          '    G.NOMEAGENCIA, G.CONSIGNATARIO, G.IDBENEFICIO, G.FLGREFERENCIA, G.FLGESPECIAL, '+
          '    G.NOMETPBENEF, G.IDRECEBEDOR, G.NOMERECEBEDOR, G.IDFAVORECIDO, G.CODTIPORECEBEDOR, G.IDPESSOA, '+
          '    G.VALORINFO, G.VALORRECEBIDO, G.VALORPROVENTO '+

          //Helio - SOL Nº 206183 KINTANA Nº 1996389
          ', G.CODESTADO ' +
          ', G.UF ' +

//          '  ORDER BY INSCRICAONUMERO, IDRESPONSAVEL, SEQRUBRICA ';     //Everson TIBERO
          '  ORDER BY G.INSCRICAONUMERO, G.IDRESPONSAVEL, G.SEQRUBRICA '; //Everson TIBERO

  qryPensaoAlim.Sql.Clear;
  qryPensaoAlim.Sql.Add(sSql);

  if ExecutaSQL then //Helio - SOL Nº 206183 KINTANA Nº 1996389
     qryPensaoAlim.Open;
end;

procedure TFrmDemPag.GuardaEstruturas;
var
  sSql : string;
begin
  GuardaIdRubExibicao30 := 35812;
  GuardaIdRubExibicao70 := 35811;

  qryAux.SQL.Clear;
  qryAux.sql.add('SELECT VALORPARAM');
  qryAux.sql.add('FROM PARAMFOLHA');
  qryAux.sql.add('WHERE IDFUNDACAO = 1');
  qryAux.sql.add('AND NOMEPARAM = ''IDRUBCPMFPAINSSDESC''');
  qryAux.Open;
  lidrubcpmfpainssdesc := qryAux.FieldByName('VALORPARAM').AsInteger;
end;

procedure TFrmDemPag.Cria(aNomeArquivo: string);
begin
  AssignFile(FSaida, aNomeArquivo);
  rewrite(FSaida);
end;

procedure TFrmDemPag.Encerra;
begin
  closefile(FSaida);
end;

function TFrmDemPag.EspacoAEsq(Texto: string; Tam: Integer): string;
 var sAux: string;
begin
  sAux := Texto;
  While Length(sAux) < Tam Do sAux := sAux+' ';
  Result := sAux;
end;

function TFrmDemPag.Monta(qry, QryAux: TwwQuery; iParte: Integer): Boolean;
var
  sTexto, sInfo, sSql, sNomeBanco,
  sNumProcInss, sTipoBenefFuncef,
  sCPF, sNumIdent, sDiaEmiss,
  sMesEmiss, sAnoEmiss, sUF,
  sRestoString, sEndE1,  sEndE2,
  sEndE3, sEndE4, sEndD1, sEndD2,
  sEndD3, sEndD4, sIdBeneficio, sBenefInss: string;

  iUltTitular, iUltRecebedor, iLinha,
  iPageAtual, iTotPage, iLadoPagina,
  iContraCheque, PosVirg,

  PosTotProv, PosTotDesc, PosLiq,
  PosMargem30, PosMargem70, PosBarra,
  PosExcesso, PosRendaBase, iSeq,
  GuardaIdProvento: Integer;

  rTotProvento, rTotDesconto,
  rTotLiquido, rMargem30,
  rMargem70, rExcessoDeb, rRendaBase : Real;

  rTotIRInformativo  : Real;     ///douglas.siqueira SOL179587
  PosIRInformativo   : Integer;  ///douglas.siqueira SOL179587
  fVlrIRInformativo  : Currency; ///douglas.siqueira SOL179587

  fVlrDeficit        : Real; // SOL 253577/17651 PPM 1015006
  PosDeficit         : Integer; // SOL 253577/17651 PPM 1015006

  PosCompensa     : Integer;
  fVlrCompensaIR  : Currency;

  i, iDif,
  TesteGuardaIdProvento : Integer;
  sCEPC, sCEPR : string;
  iSeqRubrica : Integer;

  TbmRub: tbookmark;
  iAtualPage  : Integer;
  wAno, wMes, wDia : Word;

  sMes, sDia : string;

  rNovaMargem   : Real;   // Renato Visoni SOL 123556 Kintana 622470
  PosNovaMargem : Integer;// Renato Visoni SOL 123556 Kintana 622470
  sCPFrecebedor : String; // Renato Visoni SOL 123556 Kintana 622470

  sNovaDataIBM : String; // SOL124384 - Daniel Begnami

begin
  rTotIRInformativo:=0;///douglas.siqueira SOL179587
  PosIRInformativo:=0;///douglas.siqueira  SOL179587
  fVlrIRInformativo:=0;///douglas.siqueira SOL179587

  fVlrDeficit := 0; // SOL 253577/17651 PPM 1015006
  PosDeficit  := 0; // SOL 253577/17651 PPM 1015006
  
  If iParte = 1 Then
    iContraChequeP1eP2 := 1;

  DecodeDate(Date, wAno, wMes, wDia);

  If wMes < 10 Then sMes := '0'+IntToStr(wMes)
  Else sMes := IntToStr(wMes);

  If wDia < 10 Then sDia := '0'+IntToStr(wDia)
  Else sDia := IntToStr(wDia);

  //  Prepara o Loop
  Result := True;
  FrmAguarde.Mostra('Gerando Arquivo...');
  FrmAguarde.Repaint;

  // Controla a Qry
  qry.First;
  iUltTitular   := qry.FieldByName('IDTITULAR').AsInteger;
  iUltRecebedor := qry.FieldByName('IDRESPONSAVEL').AsInteger;
  iLadoPagina   := 0;

  // 1ª linha layout:
  If iParte = 1 Then
  begin
    sTexto := '1'+'FUNCEF'+'142130'+sDia+sMes+IntToStr(wAno)+sMesRef+
              StrPadRight(FrmDemPag.MmoDesc.Text, 80, ' ');

    if trim(sTexto) <> '' then
    begin
       writeln(FSaida, sTexto);
       Inc(iTotLinha);
       iAtualPage := 0;
    end;
  end;
  While Not qry.EOF Do
  Begin
    Inc(iAtualPage);
    iLinha       := 0;
    tbmRub       := qry.getbookmark;
    iSeq         := 1;

    BuscaCep(qry.FieldByName('IDRESPONSAVEL').AsInteger, sCEPC, sCEPR);

    If ((Trim(sCEPC) = '') or (Trim(sCEPC) = '00000000')) And
       ((Trim(sCEPR) = '') or (Trim(sCEPR) = '00000000')) Then
    Begin
      While (qry.FieldByName('IDRESPONSAVEL').AsInteger = iUltRecebedor) And
            (Not qry.EOF) Do
      Begin
        iUltTitular   := qry.FieldByName('IDTITULAR').AsInteger;
        iUltRecebedor := qry.FieldByName('IDRESPONSAVEL').AsInteger;
        qry.Next;
      End;
      iUltTitular   := qry.FieldByName('IDTITULAR').AsInteger;
      iUltRecebedor := qry.FieldByName('IDRESPONSAVEL').AsInteger;
      Continue;
    End;

{    If (qry.FieldByName('FLGDESCONTO').AsInteger = 2) and
       (qry.FieldByName('FLGIRRFINFORMATIVO').AsInteger = 1) Then///douglas.siqueira
       begin
       rTotIRInformativo  := rTotIRInformativo + qry.FieldByName('VALORPROVENTO').AsFloat;///douglas.siqueira
       end;          } //tirei teste




    If qry.FieldByName('FLGDESCONTO').AsInteger <> 2 Then
    Begin
      If iTotLinha <= iNumLinhasxCCheque Then
      Begin
        rMargem30    := 0;
        rMargem70    := 0;
        rRendaBase   := 0;
        rExcessoDeb  := 0;
        rTotProvento := 0;
        rTotDesconto := 0;
        rNovaMargem  := 0; // Renato Visoni SOL 123556 Kintana 622470
      End;

      While Not (qry.EOF) And
            (iUltTitular = qry.FieldByName('IDTITULAR').AsInteger) And
            (iUltRecebedor = qry.FieldByName('IDRESPONSAVEL').AsInteger) Do
      Begin



        {Só totalizar os valores das rubricas de proventos e de descontos}
        If (qry.FieldByName('FLGESPECIAL').AsInteger <> 2) And
           (qry.FieldByName('VALORPROVENTO').AsFloat > 0) Then
//           (qry.FieldByName('INFORMATIVO').AsFloat > 0) Then///douglas.siqueira
        Begin
          If iTotLinha <= iNumLinhasxCCheque Then
          Begin
            If qry.FieldByName('TPRUBRICA').AsString = 'P' Then
//              rTotProvento := rTotProvento+qry.FieldByName('INFORMATIVO').AsFloat///douglas.siqueira
              rTotProvento := rTotProvento+qry.FieldByName('VALORPROVENTO').AsFloat///douglas.siqueira
            Else
            Begin
              If qry.FieldByName('TPRUBRICA').AsString = 'D' Then
//                rTotDesconto := rTotDesconto+qry.FieldByName('INFORMATIVO').AsFloat;//douglas.siqueira
                rTotDesconto := rTotDesconto+qry.FieldByName('VALORPROVENTO').AsFloat;//douglas.siqueira
            End;
          End;
          Inc(iLinha);
        End;
        qry.Next;
      End;

      If rTotProvento = 0 Then
      begin
        //Bruno Bastos - Pend. 19355 - 07/07/2005 - qry.Next;
        iUltTitular   := qry.FieldByName('IDTITULAR').AsInteger;
        iUltRecebedor := qry.FieldByName('IDRESPONSAVEL').AsInteger;
        Continue;
      end;

      If iTotLinha <= iNumLinhasxCCheque Then
      Begin
        rTotLiquido := rTotProvento - rTotDesconto;
        rRendaBase  := rTotProvento;
        iTotPage    := iLinha Div iNumLinhasxCCheque;
        If iLinha Mod iNumLinhasxCCheque <> 0 Then
          Inc(iTotPage);

      End;
      qry.GotoBookMark(TbmRub);

      sBenefInss := '';
      sNumProcINSS := '';
      sTipoBenefFuncef := '';

      sSql := ' SELECT DISTINCT BFB.NUMPROCINSS, B.IDBENEFICIO, UPPER(B.NOME) AS NOME, '+#13#10+
              '        BFB.IDSITBENEFICIO, BFB.DATAINICIO '+#13#10+

              ' FROM '                       + #13 +
              '    BFCIARIOTITPLAN  BF, '    + #13 +
              '    BENEFPLANPREV    BPP, '   + #13 +
              '    BENEFICIO        B, '     + #13 +
              '    BENEFBFCIARIO    BFB, '   + #13 +
              '    PARTPREVPLAN     PPP '    + #13 +

              ' WHERE '                      + #13 +
                '     BF.IDTITULAR      = '+IntToStr(qry.FieldByName('IDTITULAR').AsInteger)+#13#10+
                ' AND BF.IDRESPONSAVEL  = '+IntToStr(qry.FieldByName('IDRESPONSAVEL').AsInteger)+#13#10+
                ' AND BF.IDPESSJUR      = '+IntToStr(qry.FieldByName('IDPESSJUR').AsInteger)+#13#10+

                //BRUNO AZEVEDO SOL 131339 KINTANA 754741
                //' AND BF.IDPLANOPREV    = PPP.IDPLANOPREV '    + #13 +
                //BRUNO AZEVEDO SOL 131339 KINTANA 754741

                ' AND BF.IDPESSJUR      = PPP.IDPESSJUR '      + #13 +
                ' AND BF.IDTITULAR      = PPP.IDPESSOA '       + #13 +
                ' AND BF.IDPLANOPREV    = BPP.IDPLANOPREV '+#13#10+
                ' AND BF.IDBENEFICIO    = BPP.IDBENEFICIO '+#13#10+
                ' AND BPP.FLGREFERENCIA = 1 '+#13#10+
                ' AND BFB.IDSITBENEFICIO = 1 '+#13#10+ //Renato Visoni SOL 123557 Kintana 620123
                ' AND BPP.IDBENEFICIO   = B.IDBENEFICIO '+#13#10+
                ' AND BFB.IDPLANOPREV   = BF.IDPLANOPREV '+#13#10+
                ' AND BFB.IDBENEFICIO   = BF.IDBENEFICIO '+#13#10+
                ' AND BFB.IDPESSJUR     = BF.IDPESSJUR '+#13#10+
                ' AND BFB.IDTITULAR     = BF.IDTITULAR '+#13#10+
                ' AND BFB.IDPLANOORIGEM = BF.IDPLANOORIGEM '+#13#10+
                ' AND BFB.IDPESSOA      = BF.IDPESSOA '+#13#10+
                ' AND BFB.SEQPROPOSTA   = BF.SEQPROPOSTA '+#13#10+

                ' ORDER BY BFB.IDSITBENEFICIO, BFB.DATAINICIO';

      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.Open;

      if not qryAux.IsEmpty then
      begin
        sBenefInss   := qryAux.FieldByName('NOME').AsString;
        sNumProcINSS := qryAux.FieldByName('NUMPROCINSS').AsString;
      end;

      sSql := 'SELECT DISTINCT '+#13#10+
              '  BF.IDBENEFICIO, '+#13#10+
              '  UPPER(B.NOME) AS NOME, '+#13#10+
              '  BFB.IDSITBENEFICIO, '+#13#10+
              '  PPP.FLGDESATIVADO '+#13#10+

              'FROM '+#13#10+
              '  BFCIARIOTITPLAN BF, '+#13#10+
              '  BENEFPLANPREV BPP, '+#13#10+
              '  BENEFICIO B, '+#13#10+
              '  BENEFBFCIARIO BFB, '+#13#10+
              '  PARTPREVPLAN PPP, '+#13#10+
              '  TPPAGTOBENEFICIO T '+#13#10+

              'WHERE '+#13#10+
              '    BF.IDTITULAR = '+IntToStr(qry.FieldByName('IDTITULAR').AsInteger)+#13#10+
              'AND BF.IDRESPONSAVEL = '+IntToStr(qry.FieldByName('IDRESPONSAVEL').AsInteger)+#13#10+
              'AND BF.IDPESSJUR = '+IntToStr(qry.FieldByName('IDPESSJUR').AsInteger)+#13#10+
              'AND BF.IDPLANOORIGEM = PPP.IDPLANOPREV '+#13#10+
              'AND BF.IDPESSJUR = PPP.IDPESSJUR '+#13#10+
              'AND BF.IDTITULAR = PPP.IDPESSOA '+#13#10+
              'AND BFB.IDPLANOPREV = BF.IDPLANOPREV '+#13#10+
              'AND BFB.IDBENEFICIO = BF.IDBENEFICIO '+#13#10+
              'AND BFB.IDPESSJUR = BF.IDPESSJUR '+#13#10+
              'AND BFB.IDTITULAR = BF.IDTITULAR '+#13#10+
              'AND BFB.IDPLANOORIGEM = BF.IDPLANOORIGEM '+#13#10+
              'AND BFB.IDPESSOA = BF.IDPESSOA '+#13#10+
              'AND BFB.SEQPROPOSTA = BF.SEQPROPOSTA '+#13#10+
              'AND BF.IDPLANOPREV = BPP.IDPLANOPREV '+#13#10+
              'AND BF.IDBENEFICIO = BPP.IDBENEFICIO '+#13#10+
              'AND BPP.FLGREFERENCIA = 0 '+#13#10+
              'AND BPP.IDBENEFICIO = B.IDBENEFICIO '+#13#10+
              'AND T.IDTPPAGTOBENEFIC = B.IDTPPAGTOBENEFIC '+#13#10+
              'AND T.FLGFREQUENCIA <> ''U'' '+#13#10+

              'ORDER BY '+#13#10+
              '  PPP.FLGDESATIVADO,'+#13#10+
              '  BFB.IDSITBENEFICIO'+#13#10;

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.Open;


      If Not qryAux.IsEmpty Then
        sTipoBenefFuncef := qryAux.FieldByName('NOME').AsString;

      //Renato Visoni SOL 123556 Kintana 622470
      {
      sSql :=
      ' SELECT '+
        ' C.CONTACORRENTE,    E.CODESTADO,    E.LOGRADOURO,  CD.NOME AS CIDADE, '+
        ' E.CEP,              A.NUMAGENCIA,   NA.NOME AS NOMEAGENCIA, CD.UF '+

      ' FROM '+
        ' CONTABANCARIA C, '+
        ' ENDPESS E, '+
        ' AGENCIABANCARIA A, '+
        ' PESSOA NA, '+
        ' CIDADES CD '+

      ' WHERE '+
        ' C.IDPESSOA  = '+qry.FieldByName('IDRESPONSAVEL').AsString+' AND '+
        ' C.IDAGENCIA = E.IDPESSOA(+)   AND '+
        ' C.IDAGENCIA = A.IDPESSOA      AND '+
        ' A.IDPESSOA  = NA.IDPESSOA     AND '+
        ' E.IDCIDADES = CD.IDCIDADES(+) AND '+
        ' C.FLGCONTAPREF = 1 ';

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.Open;

      If ((qryAux.IsEmpty) Or (qryAux.FieldByName('CONTACORRENTE').AsString = '')) Then
      Begin
        sSql :=
        ' SELECT '+
          ' C.CONTACORRENTE,    E.CODESTADO,    E.LOGRADOURO,  CD.NOME AS CIDADE, '+
          ' E.CEP,              A.NUMAGENCIA,   NA.NOME AS NOMEAGENCIA, CD.UF '+

        ' FROM '+
          ' CONTABANCARIA C, '+
          ' ENDPESS E, '+
          ' AGENCIABANCARIA A, '+
          ' PESSOA NA, '+
          ' CIDADES CD '+

        ' WHERE '+
          ' C.IDPESSOA  = '+qry.FieldByName('IDRESPONSAVEL').AsString+' AND '+
          ' C.IDAGENCIA = E.IDPESSOA(+)  AND '+
          ' C.IDAGENCIA = A.IDPESSOA     AND '+
          ' A.IDPESSOA  = NA.IDPESSOA    AND '+
          ' E.IDCIDADES = CD.IDCIDADES(+) ';

        qryAux.Close;
        qryAux.Sql.Clear;
        qryAux.Sql.Add(sSql);
        qryAux.Open;
      End;
      }

      sSql :=
      ' SELECT '+
        ' C.CONTACORRENTE,    E.CODESTADO,    E.LOGRADOURO,  CD.NOME AS CIDADE, '+
        ' E.CEP,              A.NUMAGENCIA,   NA.NOME AS NOMEAGENCIA, CD.UF '+

      ' FROM '+
        ' CONTABANCARIA C, '+
        ' ENDPESS E, '+
        ' AGENCIABANCARIA A, '+
        ' PESSOA NA, '+
        ' CIDADES CD '+

      ' WHERE '+
        ' C.IDPESSOA  = '+qry.FieldByName('IDRESPONSAVEL').AsString+' AND '+
        ' C.CONTACORRENTE = (SELECT DISTINCT(CONTACORRENTE)  '+
        '                    FROM HISTRUBSAL WHERE IDPESSOA= '+qry.FieldByName('IDPESSOA').AsString+
        '                     AND CONTACORRENTE IS NOT NULL  '+                                // SOL:124345 - Daniel Begnami
        '                     AND IDHSTFOLHABENEF = '+dblcHistorico.LookupValue +              // SOL:124345 - Daniel Begnami
        '                     AND ROWNUM = 1 ) AND'+                                           // SOL:124345 - Daniel Begnami

        ' C.IDAGENCIA = E.IDPESSOA(+)  AND '+
        ' C.IDAGENCIA = A.IDPESSOA     AND '+
        ' A.IDPESSOA  = NA.IDPESSOA    AND '+
        ' E.IDCIDADES = CD.IDCIDADES(+) AND '+
        ' C.TIPOCONTA = 2 '; //BRUNO AZEVEDO SOL 135612 KINTANA 808409

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.Open;
      //Renato Visoni SOL 123556 Kintana 622470

      // 2ª linha layout:
      sTexto := '2'+IntToStr(qry.FieldByName('POSTAGEM').AsInteger)+'1'+'04'+
                StrPadLeft(IntToStr(iContraChequeP1eP2),5,'0')+
                StrPadRight(Copy(qry.FieldByName('NOMEBENEFICIARIO').AsString,1,40),40,' ')+
                StrPadLeft(Copy(qry.FieldByName('MATRICULA').AsString,1,7),7,'0');

      sTexto := sTexto + StrPadRight(Copy(sTipoBenefFuncef, 1, 40), 40, ' ');

      If sBenefInss <> 'PENSAO' Then
        sTexto := sTexto + StrPadRight(Copy(Trim(sBenefInss), 1, 40),40, ' ')
      Else
        sTexto := sTexto + StrPadRight(Copy(sBenefInss, 1, 40),40, ' ');

      If qryAux.FieldByName('CODESTADO').AsString <> '' Then
        sUF := qryAux.FieldByName('CODESTADO').AsString
      Else
        sUF := qryAux.FieldByName('UF').AsString;


      sTexto := sTexto + StrPadRight(Trim(qry.FieldByName('NUMDEPSALF').AsString),2,' ')+
                StrPadRight(Trim(qry.FieldByName('NUMDEPIRRF').AsString),2,' ')+
                StrPadRight(Copy(sUF,1,2),2,' ')+
                StrPadLeft(Copy(qry.FieldByName('NUMAGENCIA').AsString,1,4),4,'0')+
                StrPadRight(Copy(qryAux.FieldByName('NOMEAGENCIA').AsString,1,40),40,' ')+
                StrPadLeft(Copy(qry.FieldByName('CONTACORRENTE').AsString,1,3), 3, ' ')+
                StrPadLeft(Copy(qry.FieldByName('CONTACORRENTE').AsString,4,13),10,'0');
      //Marcio Sanches Spinosa SOL 222679 KINTANA 2055968 - Inicio
  {    sSql := ' SELECT B.CODTIPORECEBEDOR, B.IDRESPONNAOREC, P.NOME '+
              ' FROM BFCIARIOTITPLAN B, PESSOA P '+
              ' WHERE B.IDRESPONSAVEL   = '+qry.FieldByName('IDRESPONSAVEL').AsString+
              '   AND B.IDTITULAR       = '+qry.FieldByName('IDTITULAR').AsString+
              '   AND B.IDRESPONNAOREC  = P.IDPESSOA ';  }

      sSql :=   ' SELECT DISTINCT HST.IDRECEBEPGTO, FAV.NUMDOCUMENTO AS CPFRECEBEDOR '+
                '  FROM PREVIA HST,        '+
                '       PARTPREVPLAN PPP,  '+
                '       ELEGPATRO ELG,     '+
                '       PESSOAFISICA PSF,  '+
                '       PESSOA PJR,        '+
                '       PESSOA TIT,        '+
                '       PESSOA BEN,        '+
                '       PESSOA FAV         '+
                ' WHERE (HST.IDPESSOA  = ' + qry.FieldByName('IDPESSOA').AsString + ')   '+
                '   AND (PJR.IDPESSOA = HST.IDPATRO) '+
                '   AND (PPP.IDPESSJUR = HST.IDPATRO)  '+
                '   AND (PPP.IDPESSOA = HST.IDTITULAR)   '+
                '   AND (TIT.IDPESSOA = HST.IDTITULAR)   '+
                '   AND (BEN.IDPESSOA = HST.IDRESPONSAVEL)  '+
                '   AND (((HST.IDTITULAR = HST.IDPESSOA) AND '+
                '       (PPP.IDPLANOPREV = HST.IDPLANOPREV)) OR  '+
                '       ((HST.IDTITULAR <> HST.IDPESSOA) AND     '+
                '       (PPP.IDPLANOPREV = HST.IDPLANOORIGEM)))  '+
                '   AND (ELG.IDPESSOA = HST.IDTITULAR)           '+
                '   AND (ELG.IDPESSJUR = HST.IDPATRO)             '+
                '   AND (PSF.IDPESSOA = BEN.IDPESSOA)             '+
                '   AND (NVL(HST.IDRECEBEPGTO, HST.IDRESPONSAVEL) = FAV.IDPESSOA(+)) ';



      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSql);
      qryAux.Open;

      if qryAux.IsEmpty then
      begin
          sSql := 'SELECT DISTINCT nvl(h.numdocumento,REC.numdocumento) AS CPFRECEBEDOR '+
                  ' FROM HISTRUBSAL H, ELEGPATRO E, '+
                  ' PESSOA TIT, PESSOA REC, PESSOA PA, DEPENTIT DP '+
                  ' WHERE ( TIT.IDPESSOA = E.IDPESSOA ) AND '+
                  ' ( DP.IDTITULAR = E.IDPESSOA ) AND '+
                  ' ( DP.IDPESSOA  = REC.IDPESSOA ) AND '+
                  ' ( E.IDPESSOA   = H.IDTITULAR ) AND '+
                  ' ( TIT.IDPESSOA = H.IDTITULAR ) AND '+
                  ' ( REC.IDPESSOA = H.IDPESSOA ) AND '+
                  ' ( PA.IDPESSOA  = H.IDPATRO ) AND '+
                  ' ( DP.IDTITULAR = H.IDTITULAR ) AND '+
                  ' ( DP.IDPESSOA  = H.IDPESSOA ) AND '+
                  ' ( H.IDPESSJUR  = 1 ) AND ' +
                  '  H.IDPESSOA = ' + qry.FieldByName('IDPESSOA').AsString +
                  ' ORDER BY 1 ASC ';

          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSql);
          qryAux.Open;
      end;
      // SOL 224217 KINTANA 2057741
      //Marcio Sanches Spinosa SOL 222679 KINTANA 2055968 - fim
      //lidResponNaoRec   := StrToIntDef(qryAux.FieldByName('IDTITULAR').AsString, 0);
     // iCodTpRecebedor   := StrToIntDef(qryAux.FieldByName('CODTIPORECEBEDOR').AsString, 0);
     // sNomeResponNaoRec := qryAux.FieldByName('TITULAR').AsString;
     // SOL 224217 KINTANA 2057741

      sCpfRecebedor :=  qryAux.FieldByName('CPFRECEBEDOR').asString; // SOL 224217 KINTANA 2057741
      //if (lidResponNaoRec > 0) then // SOL 218835 KTN  2051764
      //begin // SOL 218835 KTN  2051764
      //sSql := ' SELECT NUMDOCUMENTO FROM PESSOA '+
      //        ' WHERE IDPESSOA = '+IntToStr(lidResponNaoRec);
      //end // SOL 218835 KTN  2051764
      //else // SOL 218835 KTN  2051764
      //begin // SOL 218835 KTN  2051764
      //Renato Visoni SOL 123556 Kintana 622470
      {sSql := ' SELECT NUMDOCUMENTO FROM PESSOA '+
              ' WHERE IDPESSOA = '+ Qry.FieldByname('IDPESSOA').Asstring;

      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSql);
      qryAux.Open;

      If qryAux.FieldByName('NUMDOCUMENTO').AsString <> '' then begin
        sCpfRecebedor :=  qryAux.FieldByName('NUMDOCUMENTO').asString;
      end else begin
        sCpfRecebedor := '00000000000';
      end; }
      //Renato Visoni SOL 123556 Kintana 622470


      sSql := ' SELECT B.CODTIPORECEBEDOR, B.IDRESPONNAOREC, P.NOME '+
              ' FROM BFCIARIOTITPLAN B, PESSOA P '+
              ' WHERE B.IDRESPONSAVEL   = '+qry.FieldByName('IDRESPONSAVEL').AsString+
              '   AND B.IDTITULAR       = '+qry.FieldByName('IDTITULAR').AsString+
              '   AND B.IDRESPONNAOREC  = P.IDPESSOA ';


      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSql);
      qryAux.Open;

      lidResponNaoRec   := StrToIntDef(qryAux.FieldByName('IDRESPONNAOREC').AsString, 0);
      iCodTpRecebedor   := StrToIntDef(qryAux.FieldByName('CODTIPORECEBEDOR').AsString, 0);
      sNomeResponNaoRec := qryAux.FieldByName('NOME').AsString;

      If lidResponNaoRec > 0 Then
      Begin
        sSql := ' SELECT NUMDOCUMENTO FROM PESSOA '+
        ' WHERE IDPESSOA = '+IntToStr(lidResponNaoRec);

        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSql);
        qryAux.Open;

        sCPF := qryAux.FieldByName('NUMDOCUMENTO').AsString;

        sSql := ' SELECT * FROM DOCPESSOA D, TIPODOCOFICIAL TDOC, ESTADO E    '+
                ' WHERE D.IDPESSOA = '+IntToStr(lidResponNaoRec)+
                ' AND TDOC.SIGLADOCUMENTO = ''RG:''                           '+
                ' AND D.IDDOCUMENTO       = TDOC.IDDOCUMENTO                  '+
                ' AND D.IDESTADO          = E.IDESTADO';

        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSql);
        qryAux.Open;

        sNumIdent    := qryAux.FieldByName('NUMDOCUMENTO').AsString;

        PosBarra     := Pos('/',qryAux.FieldByName('DATAEMISSAO').AsString);
        sDiaEmiss    := Copy(qryAux.FieldByName('DATAEMISSAO').AsString,1,PosBarra-1);

        sRestoString := Copy(qryAux.FieldByName('DATAEMISSAO').AsString,PosBarra+1,Length(qryAux.FieldByName('DATAEMISSAO').AsString));
        PosBarra     := Pos('/', sRestoString);

        sMesEmiss    := Copy(sRestoString,1,PosBarra-1);
        sAnoEmiss    := Copy(sRestoString,PosBarra+1,Length(sRestoString));
        sUF          := qryAux.FieldByName('CODESTADO').AsString;
      End
      Else
      Begin
        sCPF         := '00000000000';
        sNumIdent    := '           ';
        sDiaEmiss    := '00';
        sMesEmiss    := '00';
        sAnoEmiss    := '0000';
        sUF          := ' ';
      End;

      BuscaCep(qry.FieldByName('IDRESPONSAVEL').AsInteger, sCEPC,sCEPR);

      If Trim(sCEPC) <> '' Then
      Begin
        If qryAux.FieldByName('CODESTADO').AsString <> '' Then
          sUF := qryAux.FieldByName('CODESTADO').AsString
        Else
          sUF := qryAux.FieldByName('UF').AsString;

        sTexto := sTexto +
                  StrPadRight(Copy(qryAux.FieldByName('LOGRADOURO').AsString,1,80),80,' ')+ // Aline Freire SOL 158705/5441 KINTANA 1345367
                  StrPadRight(Copy(qryAux.FieldByName('CIDADE').AsString,1,25),25,' ')+
                  StrPadRight(Copy(sUF,1,2),2,' ')+
                  StrPadRight(Copy(qryAux.FieldByName('CEP').AsString,1,8),8,' ');
      End
      Else
      Begin
        If qryAux.FieldByName('CODESTADO_RES').AsString <> '' Then
          sUF := qryAux.FieldByName('CODESTADO_RES').AsString
        Else
          sUF := qryAux.FieldByName('UF_RES').AsString;

        sTexto := sTexto +
                  StrPadRight(Copy(qryAux.FieldByName('LOGRADOURO_RES').AsString,1,80),80,' ')+// Aline Freire SOL 158705/5441 KINTANA 1345367
                  StrPadRight(Copy(qryAux.FieldByName('CIDADE_RES').AsString,1,25),25,' ')+
                  StrPadRight(Copy(sUF,1,2),2,' ')+
                  StrPadRight(Copy(qryAux.FieldByName('CEP_RES').AsString,1,8),8,' ');
      End;

      If iCodTpRecebedor > 0 Then
        sTexto := sTexto + StrPadRight(Copy(sNomeResponNaoRec,1,40),40,' ')
      Else
        sTexto := sTexto + StrPadRight(' ' ,40,' ');

      sNumProcINSS := Copy(sNumProcINSS, 1, 10);
      If Length(Copy(sNumProcINSS, 1, 10)) < 10 Then
      Begin
        iDif := 10 - Length(sNumProcINSS);
        For i := 1 to iDif do
          sNumProcINSS := '0' + sNumProcINSS;
      End;
      sNumProcINSS := Copy(sNumProcINSS, 1, 9) + '-' + Copy(sNumProcINSS, 10, 1);

      If lidResponNaoRec > 0 Then
        If (Trim(sNumIdent) = '') or (Trim(sNumIdent) = '00') Then
          sTexto := sTexto + StrPadLeft(Copy(sCPF,1,11),11,'0')+
                    StrPadLeft(' ',11,' ')+
                    StrPadLeft(Copy(sDiaEmiss,1,2),2,'0')+
                    StrPadLeft(Copy(sMesEmiss,1,2),2,'0')+
                    StrPadRight(Copy(sAnoEmiss,1,4),4,'0')+
                    StrPadRight(' ', 2, ' ')+
                    StrPadRight(IntToStr(iCodTpRecebedor), 1, '0')+
                    StringOfChar(' ', 36)+
                    StrPadLeft(Copy(sNumProcINSS, 1, 11), 11, '0')+
                    StrPadLeft(Copy(sCpfRecebedor,1,11),11,'0') + // Renato Visoni SOL 123556 Kintana 622470
                    '00'
        Else
          sTexto := sTexto + StrPadLeft(Copy(sCPF,1,11),11,'0')+
                    StrPadLeft(Copy(sNumIdent,1,11),11,' ')+
                    StrPadLeft(Copy(sDiaEmiss,1,2),2,'0')+
                    StrPadLeft(Copy(sMesEmiss,1,2),2,'0')+
                    StrPadRight(Copy(sAnoEmiss,1,4),4,'0')+
                    StrPadRight(sUF, 2, ' ')+
                    StrPadRight(IntToStr(iCodTpRecebedor), 1, '0')+
                    StringOfChar(' ', 36)+
                    StrPadLeft(Copy(sNumProcINSS, 1, 11), 11, '0')+
                    StrPadLeft(Copy(sCpfRecebedor,1,11),11,'0') + // Renato Visoni SOL 123556 Kintana 622470
                    '00'
      Else
        If (Trim(sNumIdent) = '') or (Trim(sNumIdent) = '00') Then
          sTexto := sTexto + StrPadLeft(Copy(sCPF,1,11),11,'0')+
                    StrPadLeft(' ',11,' ')+
                    StrPadLeft(Copy(sDiaEmiss,1,2),2,'0')+
                    StrPadLeft(Copy(sMesEmiss,1,2),2,'0')+
                    StrPadRight(Copy(sAnoEmiss,1,4),4,'0')+
                    StrPadRight(' ', 2, ' ')+
                    StrPadRight(IntToStr(iCodTpRecebedor), 1, '0')+
                    StringOfChar(' ', 36)+
                    StrPadLeft(Copy(sNumProcINSS, 1, 11), 11, '0')+
                    StrPadLeft(Copy(sCpfRecebedor,1,11),11,'0') + // Renato Visoni SOL 123556 Kintana 622470
                    '00'
        Else
          sTexto := sTexto + StrPadLeft(Copy(sCPF,1,11),11,'0')+
                    StrPadLeft(Copy(sNumIdent,1,11),11,' ')+
                    StrPadLeft(Copy(sDiaEmiss,1,2),2,'0')+
                    StrPadLeft(Copy(sMesEmiss,1,2),2,'0')+
                    StrPadRight(Copy(sAnoEmiss,1,4),4,'0')+
                    StrPadRight(sUF, 2, ' ')+
                    StrPadRight(IntToStr(iCodTpRecebedor), 1, '0')+
                    StringOfChar(' ', 36)+
                    StrPadLeft(Copy(sNumProcINSS, 1, 11), 11, '0')+
                    StrPadLeft(Copy(sCpfRecebedor,1,11),11,'0') + // Renato Visoni SOL 123556 Kintana 622470
                    '00';


      writeln(FSaida, sTexto);
      Inc(iTotLinha);
      Inc(iTotBenef);
      Inc(iContraChequeP1eP2);
    End;

    iLinha:=0;
    
    rTotIRInformativo:=0;///douglas.siqueira. SOL179587
    PosIRInformativo:=0;///douglas.siqueira. SOL179587
    while (not (qry.EOF) and
          (iUltTitular = qry.FieldByName('IDTITULAR').AsInteger) and
          (iUltRecebedor = qry.FieldByName('IDRESPONSAVEL').AsInteger) and
          (iLinha < iNumLinhasxCCheque)) do
    begin
//      PosVirg     := Pos(',',qry.FieldByName('INFORMATIVO').AsString);///douglas.siqueira
      PosVirg     := Pos(',',qry.FieldByName('VALORPROVENTO').AsString);///douglas.siqueira
      iSeqRubrica := ((qry.FieldByName('SEQRUBRICA').AsInteger - 1) Mod 99) + 1;

      If (qry.FieldByName('DEFICIT').AsInteger = 1) then //SOL 253577/17651 PPM 1015006
      begin
         fVlrDeficit := qry.FieldByName('INFORMATIVO').AsFloat; //SOL 253577/17651 PPM 1015006
      end;//SOL 253577/17651 PPM 1015006


      // 3ª linha layout:
      If (qry.FieldByName('FLGESPECIAL').AsInteger <> 2) And
         (qry.FieldByName('VALORPROVENTO').AsFloat > 0) Then///douglas.siqueira
//         (qry.FieldByName('INFORMATIVO').AsFloat > 0) Then///douglas.siqueira
      Begin
        inc(iLinha);

     { If (qry.FieldByName('FLGDESCONTO').AsInteger = 2) and teste silvana.
         (qry.FieldByName('FLGIRRFINFORMATIVO').AsInteger = 1) Then///douglas.siqueira
         begin
//         rTotIRInformativo  := rTotIRInformativo + qry.FieldByName('VALORPROVENTO').AsFloat;///douglas.siqueira
         rTotIRInformativo  := rTotIRInformativo + qry.FieldByName('INFORMATIVO').AsFloat;///douglas.siqueira
         PosIRInformativo := Pos(',', FormatFloat('#0.00',rTotIRInformativo));//douglas.siqueira
         end;  }


        //SOL:124384 - Daniel Begnami
        sNovaDataIBM := copy(Qry.FieldByname('MESREFERENCIA').asString,6,2) +
                        '/' +
                        copy(Qry.FieldByname('MESREFERENCIA').asString,1,4);
        //FIM

        If chkGeraWeb.Checked Then
          sTexto := '3'+StrPadRight(Copy(qry.FieldByName('CODPROVDESC').AsString,1,4), 4, ' ')+
                    StrPadLeft(IntToStr(iSeqRubrica), 2, '0')+
                    sNovaDataIBM + // Renato Visoni SOL 123556 Kintana 622470 / SOL:124384 - Daniel Begnami
                    StrPadRight(Copy(qry.FieldByName('DESCRPROVDESC').AsString,1,40),40,' ')
        Else
          sTexto := '3'+StrPadRight(Copy(qry.FieldByName('CODPROVDESC').AsString,1,4), 4, ' ')+
                    StrPadLeft(IntToStr(iSeqRubrica), 2, '0')+
                    sNovaDataIBM + // Renato Visoni SOL 123556 Kintana 622470  / SOL:124384 - Daniel Begnami
                    StrPadRight(Copy(qry.FieldByName('DESCRPROVDESC').AsString,1,40),40,' ');

        //Testa o campo prazo, se mostra valorprovento ou valorinfo e se tem as duas casas decimais
        If qry.FieldByName('PRAZO').AsInteger = 0 Then
        Begin
          If qry.FieldByName('TPRUBRICA').AsString = 'I' Then
          Begin
//            PosVirg := Pos(',' ,qry.FieldByName('INFORMATIVO').AsString);//douglas.siqueira
            PosVirg := Pos(',' ,qry.FieldByName('VALORINFO').AsString);
            If PosVirg = 0 Then
//            sTexto := sTexto +'   '+ StrPadLeft(qry.FieldByName('INFORMATIVO').AsString,8,'0') + '00'//douglas.siqueira
              sTexto := sTexto +'   '+ StrPadLeft(qry.FieldByName('VALORINFO').AsString,8,'0') + '00'
            Else
              sTexto := sTexto +'   '+
//                        StrPadLeft(Copy(qry.FieldByName('INFORMATIVO').AsString,1,(PosVirg-1)),8,'0')+//douglas.siqueira
//                        StrPadRight(Copy(qry.FieldByName('INFORMATIVO').AsString,PosVirg+1,2),2,'0');//douglas.siqueira

                        StrPadLeft(Copy(qry.FieldByName('VALORINFO').AsString,1,(PosVirg-1)),8,'0')+
                        StrPadRight(Copy(qry.FieldByName('VALORINFO').AsString,PosVirg+1,2),2,'0');
          End
          Else
          Begin
//            PosVirg := Pos(',' ,qry.FieldByName('INFORMATIVO').AsString);///douglas.siqueira
            PosVirg := Pos(',' ,qry.FieldByName('VALORPROVENTO').AsString);///douglas.siqueira
            If PosVirg = 0 Then
//              sTexto := sTexto +'   '+ StrPadLeft(qry.FieldByName('INFORMATIVO').AsString,8,'0') + '00'//douglas.siqueira
              sTexto := sTexto +'   '+ StrPadLeft(qry.FieldByName('VALORPROVENTO').AsString,8,'0') + '00'//douglas.siqueira
            Else
              sTexto := sTexto +'   '+
//                        StrPadLeft(Copy(qry.FieldByName('INFORMATIVO').AsString,1,(PosVirg-1)),8,'0')+ ///douglas.siqueira
//                        StrPadRight(Copy(qry.FieldByName('INFORMATIVO').AsString,PosVirg+1,2),2,'0');///douglas.siqueira
                        StrPadLeft(Copy(qry.FieldByName('VALORPROVENTO').AsString,1,(PosVirg-1)),8,'0')+///douglas.siqueira
                        StrPadRight(Copy(qry.FieldByName('VALORPROVENTO').AsString,PosVirg+1,2),2,'0');///douglas.siqueira

          End;
        End
        Else
        Begin
          If qry.FieldByName('TPRUBRICA').AsString = 'I' Then
          Begin
//            PosVirg := Pos(',' ,qry.FieldByName('INFORMATIVO').AsString);//douglas.siqueira
            PosVirg := Pos(',' ,qry.FieldByName('VALORINFO').AsString);
            If PosVirg = 0 Then
              sTexto := sTexto +
                        StrPadLeft(qry.FieldByName('PRAZO').AsString,3,'0')+
                        StrPadLeft(qry.FieldByName('VALORINFO').AsString,8,'0')+'00'
//                        StrPadLeft(qry.FieldByName('INFORMATIVO').AsString,8,'0')+'00'//douglas.siqueira
            Else
              sTexto := sTexto +
                        StrPadLeft(qry.FieldByName('PRAZO').AsString,3,'0')+
                        StrPadLeft(Copy(qry.FieldByName('VALORINFO').AsString,1,(PosVirg-1)),8,'0')+
                        StrPadRight(Copy(qry.FieldByName('VALORINFO').AsString,PosVirg+1,2),2,'0');
//                        StrPadLeft(Copy(qry.FieldByName('INFORMATIVO').AsString,1,(PosVirg-1)),8,'0')+//douglas.siqueira
//                        StrPadRight(Copy(qry.FieldByName('INFORMATIVO').AsString,PosVirg+1,2),2,'0');//douglas.siqueira

          End
          Else
          Begin
//            PosVirg := Pos(',' ,qry.FieldByName('INFORMATIVO').AsString);//douglas.siqueira
            PosVirg := Pos(',' ,qry.FieldByName('VALORPROVENTO').AsString);//douglas.siqueira
            If PosVirg = 0 Then
              sTexto := sTexto +
                        StrPadLeft(qry.FieldByName('PRAZO').AsString,3,'0')+
//                        StrPadLeft(qry.FieldByName('INFORMATIVO').AsString,8,'0')+'00'//douglas.siqueira
                        StrPadLeft(qry.FieldByName('VALORPROVENTO').AsString,8,'0')+'00'//douglas.siqueira
            Else
              sTexto := sTexto +
                        StrPadLeft(qry.FieldByName('PRAZO').AsString,3,'0')+
//                        StrPadLeft(Copy(qry.FieldByName('INFORMATIVO').AsString,1,(PosVirg-1)),8,'0')+ //douglas.siqueira
//                        StrPadRight(Copy(qry.FieldByName('INFORMATIVO').AsString,PosVirg+1,2),2,'0');//douglas.siqueira
                        StrPadLeft(Copy(qry.FieldByName('VALORPROVENTO').AsString,1,(PosVirg-1)),8,'0')+ //douglas.siqueira
                        StrPadRight(Copy(qry.FieldByName('VALORPROVENTO').AsString,PosVirg+1,2),2,'0');//douglas.siqueira
          End
        End;

        writeln(FSaida, sTexto);
        Inc(iTotLinha);
      End;

      If (qry.FieldByName('FLGDESCONTO').AsInteger = 2)  and
         (qry.FieldByName('FLGIRRFINFORMATIVO').AsInteger = 1) Then///douglas.siqueira  SOL179587
         begin
//         rTotIRInformativo  := rTotIRInformativo + qry.FieldByName('VALORPROVENTO').AsFloat;///douglas.siqueira
         rTotIRInformativo  := rTotIRInformativo + qry.FieldByName('INFORMATIVO').AsFloat;///douglas.siqueira
         if rTotIRInformativo > 0 then
            PosIRInformativo := Pos(',', FormatFloat('#0.00',rTotIRInformativo));//douglas.siqueira
         end;

      //Rubricas de Desconto
      If qry.FieldByName('TPRUBRICA').AsString = 'D' Then
      Begin
        //Bruno Bastos - Pend. 20496 - 19/10/2005 - Início
        {Se for uma rubrica de desconto, testa se tem excesso de débito}
        If qry.FieldByName('VALORPROVENTO').AsFloat < qry.FieldByName('VALORRECEBIDO').AsFloat Then
          rExcessoDeb := rExcessoDeb + (qry.FieldByName('VALORRECEBIDO').AsFloat - qry.FieldByName('VALORPROVENTO').AsFloat);//douglas.siqueira
//        If qry.FieldByName('INFORMATIVO').AsFloat < qry.FieldByName('VALORRECEBIDO').AsFloat Then//douglas.siqueira
//          rExcessoDeb := rExcessoDeb + (qry.FieldByName('VALORRECEBIDO').AsFloat - qry.FieldByName('INFORMATIVO').AsFloat);//douglas.siqueira

        //Bruno Bastos - Pend. 20496 - 19/10/2005 - Fim

        If qry.FieldByName('IDPROVENTO').AsInteger = lidrubcpmfpainssdesc {P.RAMOS-02/06/2006-SistemaFolha.IDRUBCPMFPAINSSDESC} Then
//          rRendaBase := rTotProvento - qry.FieldByName('INFORMATIVO').AsFloat;//douglas.siqueira
          rRendaBase := rTotProvento - qry.FieldByName('VALORPROVENTO').AsFloat;
      End;


      GuardaIdProvento    := qry.FieldByName('IDPROVENTO').AsInteger;

      If GuardaIdProvento = GuardaIdRubExibicao30 Then
//        rMargem30 := qry.FieldByName('INFORMATIVO').AsFloat;//douglas.siqueira
        rMargem30 := qry.FieldByName('VALORINFO').AsFloat;

      If GuardaIdProvento = GuardaIdRubExibicao70 Then
//        rMargem70 := qry.FieldByName('INFORMATIVO').AsFloat;//douglas.siqueira
        rMargem70 := qry.FieldByName('VALORINFO').AsFloat;

      //Renato Visoni SOL 123556 Kintana 622470
      If GuardaIdProvento = 39648 then
//        rNovaMargem := qry.FieldByName('INFORMATIVO').AsFloat;//douglas.siqueira
        rNovaMargem := qry.FieldByName('VALORINFO').AsFloat;
      //Renato Visoni SOL 123556 Kintana 622470

      If GuardaIdProvento = 35813 Then
//        rRendaBase := qry.FieldByName('INFORMATIVO').AsFloat;//douglas.siqueira
        rRendaBase := qry.FieldByName('VALORINFO').AsFloat;

      qry.Next;
      inc(iSeq);

      {if ((iUltTitular   <> qry.FieldByName('IDTITULAR').AsInteger)     or
          (iUltRecebedor <> qry.FieldByName('IDRESPONSAVEL').AsInteger) or
          (qry.EOF)                                                     or
          ((iLinha = iNumLinhasxCCheque))) then
          begin

          If (qry.FieldByName('FLGDESCONTO').AsInteger = 2) and
             (qry.FieldByName('FLGIRRFINFORMATIVO').AsInteger = 1) Then//douglas.siqueira
            begin
           PosIRInformativo := Pos(',', FormatFloat('#0.00',rTotIRInformativo));//douglas.siqueira
           end;

          end;       }

      // Insere última linha do titular
      if ((iUltTitular   <> qry.FieldByName('IDTITULAR').AsInteger)     or
          (iUltRecebedor <> qry.FieldByName('IDRESPONSAVEL').AsInteger) or
          (qry.EOF)                                                     or
          ((iLinha = iNumLinhasxCCheque) And (qry.FieldByName('FLGDESCONTO').AsInteger <> 2))) Then
      begin
        PosTotProv   := Pos(',', FormatFloat('#0.00', rTotProvento));
        PosTotDesc   := Pos(',', FormatFloat('#0.00', rTotDesconto));
        PosLiq       := Pos(',', FormatFloat('#0.00', rTotLiquido));
        PosMargem30  := Pos(',', FormatFloat('#0.00', rMargem30));
        PosMargem70  := Pos(',', FormatFloat('#0.00', rMargem70));
        PosExcesso   := Pos(',', FormatFloat('#0.00', rExcessoDeb));
        PosRendaBase := Pos(',', FormatFloat('#0.00', rRendaBase));
        PosNovaMargem := Pos(',', FormatFloat('#0.00',rNovaMargem));//Renato Visoni SOL 123556 Kintana 622470



        fVlrCompensaIR  := RetornaVlrCompensaIR(iUltRecebedor);
        PosCompensa     := Pos(',', FormatFloat('#0.00', fVlrCompensaIR));



        //4ª Linha Layout
        If iTotPage > iAtualPage Then
          sTexto := '4' + StrPadLeft ('0', 8, '0') +
                          StrPadRight('0', 2, '0') +
                          StrPadLeft ('0', 8, '0') +
                          StrPadRight('0', 2, '0') +
                          StrPadLeft ('0', 8, '0') +
                          StrPadRight('0', 2, '0')
        Else
          sTexto := '4' + StrPadLeft (Copy(FormatFloat('#0.00', rTotProvento),   1, (PosTotProv - 1)), 8, '0')      +
                          StrPadRight(Copy(FormatFloat('#0.00', rTotProvento),      (PosTotProv + 1), 2), 2, '0')   +
                          StrPadLeft (Copy(FormatFloat('#0.00', rTotDesconto),   1, (PosTotDesc - 1)), 8, '0')      +
                          StrPadRight(Copy(FormatFloat('#0.00', rTotDesconto),      (PosTotDesc + 1), 2), 2, '0')   +
                          StrPadLeft (Copy(FormatFloat('#0.00', rTotLiquido),    1, (PosLiq - 1)), 8, '0')          +
                          StrPadRight(Copy(FormatFloat('#0.00', rTotLiquido),       (PosLiq + 1),2), 2, '0');

      //Renato Visoni SOL 123556 Kintana 622470
      {
        If iTotPage > iAtualPage Then
        Begin
          If PosMargem30 > 0 Then
            sTexto := sTexto +
                      StrPadLeft('0',8,'0')+
                      StrPadRight('0',2,'0')
          Else
            sTexto := sTexto + '0000000000';
        End
        Else
        Begin
          If PosMargem30 > 0 Then
            sTexto := sTexto +
                      StrPadLeft(Copy(FormatFloat('#0.00',rMargem30),1,(PosMargem30-1)),8,'0')+
                      StrPadRight(Copy(FormatFloat('#0.00',rMargem30),(PosMargem30+1),2),2,'0')
          Else
            sTexto := sTexto + '0000000000';
        End;

        If iTotPage > iAtualPage Then
        Begin
          If PosMargem70 > 0 Then
            sTexto := sTexto +
                      StrPadLeft('0',8,'0')+
                      StrPadRight('0',2,'0')
          Else
            sTexto := sTexto + '0000000000';
        End
        Else
        Begin
          If PosMargem70 > 0 Then
            sTexto := sTexto +
                      StrPadLeft(Copy(FormatFloat('#0.00',rMargem70),1,(PosMargem70-1)),8,'0')+
                      StrPadRight(Copy(FormatFloat('#0.00',rMargem70),(PosMargem70+1),2),2,'0')
          Else
            sTexto := sTexto + '0000000000';
        End;
        }

        If iTotPage > iAtualPage Then
        Begin
          If PosNovaMargem > 0 Then
            sTexto := sTexto +
                      StrPadLeft('0',8,'0')+
                      StrPadRight('0',2,'0')
          Else
            sTexto := sTexto + '0000000000';
        End
        Else
        Begin
          If PosNovaMargem > 0 Then
            sTexto := sTexto +
                      StrPadLeft(Copy(FormatFloat('#0.00',rNovaMargem),1,(PosNovaMargem-1)),8,'0')+
                      StrPadRight(Copy(FormatFloat('#0.00',rNovaMargem),(PosNovaMargem+1),2),2,'0')
          Else
            sTexto := sTexto + '0000000000';
        End;
        //Renato Visoni SOL 123556 Kintana 622470



        If iTotPage > iAtualPage Then
          sTexto := sTexto+
                    StrPadLeft('0',8,'0')+
                    StrPadRight('0',2,'0')+
                    StrPadLeft('0',8,'0')+
                    StrPadRight('0',2,'0')
        Else
          sTexto := sTexto+
                    StrPadLeft(Copy(FormatFloat('#0.00',rExcessoDeb),1,(PosExcesso-1)),8,'0')+
                    StrPadRight(Copy(FormatFloat('#0.00',rExcessoDeb),(PosExcesso+1),2),2,'0')+
                    StrPadLeft(Copy(FormatFloat('#0.00',rRendaBase),1,(PosRendaBase-1)),8,'0')+
                    StrPadRight(Copy(FormatFloat('#0.00',rRendaBase),(PosRendaBase+1),2),2,'0');

        If iTotPage > iAtualPage Then
          sTexto := sTexto + StrPadLeft ('0', 8, '0') +
                             StrPadRight('0', 2, '0')
        else
          sTexto := sTexto + StrPadLeft (Copy(FormatFloat('#0.00', fVlrCompensaIR), 1, (PosCompensa - 1)), 8, '0')     +
                             StrPadRight(Copy(FormatFloat('#0.00', fVlrCompensaIR),    (PosCompensa + 1),2), 2, '0');


///douglas.siqueira SOL179587 Inicio

        If iTotPage > iAtualPage Then
          sTexto := sTexto + StrPadLeft ('0', 8, '0') +
                             StrPadRight('0', 2, '0')
        else
        if PosIRInformativo>0 then
           begin
           sTexto := sTexto + StrPadLeft (Copy(FormatFloat('#0.00', rTotIRInformativo), 1, (PosIRInformativo - 1)), 8, '0')     +
                             StrPadRight(Copy(FormatFloat('#0.00', rTotIRInformativo),    (PosIRInformativo + 1),2), 2, '0');
           end
        else
          sTexto := sTexto + StrPadLeft ('0', 8, '0') +
                             StrPadRight('0', 2, '0');
///douglas.siqueira SOL179587 FIM

        // SOL 253577/17651 PPM 1015006
        If (fVlrDeficit > 0) then
        begin
           PosDeficit := Pos(',', FormatFloat('#0.00',fVlrDeficit)); //SOL 253577/17651 PPM 1015006
           sTexto := sTexto + StrPadLeft(Copy(FormatFloat('#0.00', fVlrDeficit), 1, (PosDeficit-1)), 8, '0') +
                              StrPadRight(Copy(FormatFloat('#0.00', fVlrDeficit), (PosDeficit+1),2), 2, '0'); //SOL 253577/17651 PPM 1015006
        end
        else
        begin
           sTexto := sTexto + StrPadLeft ('0', 8, '0') +
                              StrPadRight('0', 2, '0'); //SOL 253577/17651 PPM 1015006
        end;
        fVlrDeficit := 0;   //SIG 21241
        // SOL 253577/17651 PPM 1015006

        writeln(FSaida, sTexto);
        Inc(iTotLinha);
        if (iUltTitular <> qry.FieldByName('IDTITULAR').AsInteger) OR (qry.EOF) OR
           (iUltRecebedor <> qry.FieldByName('IDRESPONSAVEL').AsInteger) Then
        begin
          iAtualPage:=0;
          iTotLinha:=0;
        end;
      end;
    end;

    iUltTitular   := qry.FieldByName('IDTITULAR').AsInteger;
    iUltRecebedor := qry.FieldByName('IDRESPONSAVEL').AsInteger;

  end; // while not EOF
  qry.close;

  
end;



function TFrmDemPag.MontaPensAlim(qryPensaoAlim, qryAux: TwwQuery): Boolean;
var
  sTexto, sInfo, sSql, sNomeBanco, sNumProcInss,
  sCPF, sNumIdent, sDiaEmiss, sMesEmiss, sAnoEmiss,
  sUF, sRestoString, sEndE1, sEndE2, sEndE3, sEndE4,
  sEndD1, sEndD2, sEndD3, sEndD4, sBenefInss, sIdBeneficio : string;

  iUltTitular, iUltRecebedor, iLinha,
  iPageAtual, iTotPage, iLadoPagina,
  iContraCheque, PosVirg,
  PosTotProv, PosTotDesc, PosLiq,
  PosBarra, iSeq: Integer;

  rTotProvento, rTotDesconto,
  rTotLiquido, rMargem30,
  rMargem70, rExcessoDeb, rRendaBase : Real;

  sCEPC, sCEPR : string;

  iSeqRubrica : Integer; 

  TbmRub: tbookmark;

  wAno, wMes, wDia : Word;

  sMes, sDia : string;
  iTesteTit, iTesteRec : Integer;

begin
  iContraCheque := 1;

  DecodeDate(Date, wAno, wMes, wDia);

  If wMes < 10 Then sMes := '0'+IntToStr(wMes)
  Else sMes := IntToStr(wMes);

  If wDia < 10 Then sDia := '0'+IntToStr(wDia)
  Else sDia := IntToStr(wDia);

  //  Prepara o Loop
  Result := True;

  // Controla a Qry
  qryPensaoAlim.First;
  iUltTitular   := qryPensaoAlim.FieldByName('IDTITULAR').AsInteger;
  iUltRecebedor := qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsInteger;
  iLadoPagina   := 0;

  While Not qryPensaoAlim.EOF Do
  Begin
    iLinha       := 0;
    tbmRub       := qryPensaoAlim.getbookmark;

    rRendaBase   := 0;
    rExcessoDeb  := 0;
    rMargem30    := 0;
    rMargem70    := 0;
    rTotProvento := 0;
    rTotDesconto := 0;

    BuscaCep(qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsInteger, sCEPC, sCEPR);

    If ((Trim(sCEPC) = '') or (Trim(sCEPC) = '00000000')) And
       ((Trim(sCEPR) = '') or (Trim(sCEPR) = '00000000')) Then
    Begin
      While (qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsInteger = iUltRecebedor) And
            (Not qryPensaoAlim.EOF) Do
      Begin
        iUltTitular   := qryPensaoAlim.FieldByName('IDTITULAR').AsInteger;
        iUltRecebedor := qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsInteger;
        qryPensaoAlim.Next;
      End;

      iUltTitular   := qryPensaoAlim.FieldByName('IDTITULAR').AsInteger;
      iUltRecebedor := qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsInteger;
      Continue;
    End;
    //Bruno Bastos - 12/07/2004 - Fim

    While Not (qryPensaoAlim.EOF) And
          (iUltTitular = qryPensaoAlim.FieldByName('IDTITULAR').AsInteger) And
          (iUltRecebedor = qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsInteger) Do
    Begin
      If qryPensaoAlim.FieldByName('TPRUBRICA').AsString = 'P' Then
//        rTotProvento := rTotProvento+qryPensaoAlim.FieldByName('INFORMATIVO').AsFloat//douglas.siqueira
        rTotProvento := rTotProvento+qryPensaoAlim.FieldByName('VALORPROVENTO').AsFloat
      Else
      Begin
        If qryPensaoAlim.FieldByName('TPRUBRICA').AsString = 'D' Then
//          rTotDesconto := rTotDesconto+qryPensaoAlim.FieldByName('INFORMATIVO').AsFloat;//douglas.siqueira
          rTotDesconto := rTotDesconto+qryPensaoAlim.FieldByName('VALORPROVENTO').AsFloat;
      End;

      Inc(iLinha);
      qryPensaoAlim.Next;
    End;
    rTotLiquido := rTotProvento - rTotDesconto;
    iTotPage    := iLinha Div iNumLinhasxCCheque;
    If iLinha Mod iNumLinhasxCCheque <> 0 Then
      Inc(iTotPage);
    qryPensaoAlim.GotoBookMark(TbmRub);

    sSql :=
    ' SELECT '+
      ' C.CONTACORRENTE,    E.CODESTADO,    E.LOGRADOURO,  CD.NOME AS CIDADE, '+
      ' E.CEP,              A.NUMAGENCIA,   NA.NOME AS NOMEAGENCIA, CD.UF '+

    ' FROM '+
      ' CONTABANCARIA C, '+
      ' ENDPESS E, '+
      ' AGENCIABANCARIA A, '+
      ' PESSOA NA, '+
      ' CIDADES CD '+

    ' WHERE '+
      ' C.IDPESSOA  = '+qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsString+' AND '+
      ' C.IDAGENCIA = E.IDPESSOA(+)   AND '+
      ' C.IDAGENCIA = A.IDPESSOA      AND '+
      ' A.IDPESSOA  = NA.IDPESSOA     AND '+
      ' E.IDCIDADES = CD.IDCIDADES(+) AND '+
      //BRUNO AZEVEDO SOL 133261 KINTANA 776460
      //' C.FLGCONTAPREF = 1 ';
      ' C.TIPOCONTA = 2 ';

    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(sSql);
    qryAux.Open;

    //BRUNO AZEVEDO SOL 133088 KINTANA 775056
    //If qryAux.IsEmpty Or (qryAux.FieldByName('CONTACORRENTE').AsString <> '') Then
    If qryAux.IsEmpty Or (qryAux.FieldByName('CONTACORRENTE').AsString = '') Then
    //BRUNO AZEVEDO SOL 133088 KINTANA 775056
    Begin
      sSql :=
      ' SELECT '+
        ' C.CONTACORRENTE,    E.CODESTADO,    E.LOGRADOURO,  CD.NOME AS CIDADE, '+
        ' E.CEP,              A.NUMAGENCIA,   NA.NOME AS NOMEAGENCIA, CD.UF '+

      ' FROM '+
        ' CONTABANCARIA C, '+
        ' ENDPESS E, '+
        ' AGENCIABANCARIA A, '+
        ' PESSOA NA, '+
        ' CIDADES CD '+

      ' WHERE '+
        ' C.IDPESSOA     = '+qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsString+' AND '+
        ' C.FLGCONTAPREF = 1  AND '+
        ' C.IDAGENCIA    = E.IDPESSOA(+)  AND '+
        ' C.IDAGENCIA    = A.IDPESSOA     AND '+
        ' A.IDPESSOA     = NA.IDPESSOA    AND '+
        ' E.IDCIDADES = CD.IDCIDADES(+) ';

      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(sSql);
      qryAux.Open;
    End;

    // 2ª linha layout:
    sTexto := '2'+IntToStr(qryPensaoAlim.FieldByName('POSTAGEM').AsInteger)+'2'+'04'+
              StrPadLeft(IntToStr(iContraCheque),5,'0')+
              StrPadRight(Copy(qryPensaoAlim.FieldByName('NOMETITULAR').AsString,1,40),40,' ')+
              StrPadLeft(Copy(qryPensaoAlim.FieldByName('MATRICULA').AsString,1,7),7,'0');

    sTexto := sTexto + StringOfChar(' ',40) + StringOfChar(' ',40);

    If qryAux.FieldByName('CODESTADO').AsString <> '' Then
      sUF := qryAux.FieldByName('CODESTADO').AsString
    Else
      sUF := qryAux.FieldByName('UF').AsString;

    sTexto := sTexto + StrPadRight(Trim(qryPensaoAlim.FieldByName('NUMDEPIRRF').AsString),2,' ')+
              StrPadRight(Trim(qryPensaoAlim.FieldByName('NUMDEPSALF').AsString),2,' ')+
              StrPadRight(Copy(sUF,1,2),2,' ')+
              StrPadLeft(Copy(qryAux.FieldByName('NUMAGENCIA').AsString,1,4),4,'0')+
              StrPadRight(Copy(qryAux.FieldByName('NOMEAGENCIA').AsString,1,40),40,' ')+
              StrPadLeft(Copy(qryAux.FieldByName('CONTACORRENTE').AsString,1,3), 3, ' ')+
              StrPadLeft(Copy(qryAux.FieldByName('CONTACORRENTE').AsString,4,13),10,'0');

    sCPF         := '00000000000';
    sNumIdent    := '           ';
    sDiaEmiss    := '00';
    sMesEmiss    := '00';
    sAnoEmiss    := '0000';
    sUF          := ' ';

    BuscaCep(qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsInteger, sCEPC,sCEPR); //Bruno Bastos - 12/07/2004

    If Trim(sCEPC) <> '' Then
    Begin
      If qryAux.FieldByName('CODESTADO').AsString <> '' Then
        sUF := qryAux.FieldByName('CODESTADO').AsString
      Else
        sUF := qryAux.FieldByName('UF').AsString;

      sTexto := sTexto +
                StrPadRight(Copy(qryAux.FieldByName('LOGRADOURO').AsString,1,80),80,' ')+ // Aline Freire SOL 158705/5441 KINTANA 1345367
                StrPadRight(Copy(qryAux.FieldByName('CIDADE').AsString,1,25),25,' ')+
                StrPadRight(Copy(sUF,1,2),2,' ')+
                StrPadRight(Copy(qryAux.FieldByName('CEP').AsString,1,8),8,' ')+
                StringOfChar(' ', 40);
    End
    Else
    Begin
      If qryAux.FieldByName('CODESTADO_RES').AsString <> '' Then
        sUF := qryAux.FieldByName('CODESTADO_RES').AsString
      Else
        sUF := qryAux.FieldByName('UF_RES').AsString;


      sTexto := sTexto +
                StrPadRight(Copy(qryAux.FieldByName('LOGRADOURO_RES').AsString,1,80),80,' ')+ // Aline Freire SOL 158705/5441 KINTANA 1345367
                StrPadRight(Copy(qryAux.FieldByName('CIDADE_RES').AsString,1,25),25,' ')+
                StrPadRight(Copy(sUF,1,2),2,' ')+
                StrPadRight(Copy(qryAux.FieldByName('CEP_RES').AsString,1,8),8,' ')+
                StringOfChar(' ', 40);
    End;

    If qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsString <> '' Then
      sTexto := sTexto + StrPadLeft(Copy(sCPF,1,11),11,'0')+
                StrPadLeft(Copy(sNumIdent,1,11),11,' ')+
                StrPadLeft(Copy(sDiaEmiss,1,2),2,'0')+
                StrPadLeft(Copy(sMesEmiss,1,2),2,'0')+
                StrPadRight(Copy(sAnoEmiss,1,4),4,'0')+
                StrPadRight(' ', 2, ' ') + '0' +
                StrPadRight(Copy(qryPensaoAlim.FieldByName('CONSIGNATARIO').AsString,1,36),36,' ')
    Else
      sTexto := sTexto + StrPadLeft(Copy(sCPF,1,11),11,'0')+
                StrPadLeft(Copy(sNumIdent,1,11),11,' ')+
                StrPadLeft(Copy(sDiaEmiss,1,2),2,'0')+
                StrPadLeft(Copy(sMesEmiss,1,2),2,'0')+
                StrPadRight(Copy(sAnoEmiss,1,4),4,'0')+
                StrPadRight(' ', 2, ' ')+ '0' +
                StrPadRight(Copy(qryPensaoAlim.FieldByName('CONSIGNATARIO').AsString,1,36),36,' ');

    If qryPensaoAlim.FieldByName('CONSIGNATARIO').AsString = '' Then
      sTexto := sTexto + '00'
    Else
      sTexto := sTexto + StrPadLeft(qryPensaoAlim.FieldByName('SEQ').AsString, 2, '0');

    writeln(FSaida, sTexto);
    Inc(iTotLinha);
    Inc(iTotBenef);
    Inc(iContraCheque);

    iLinha:=0;

    while not (qryPensaoAlim.EOF) and
          (iUltTitular = qryPensaoAlim.FieldByName('IDTITULAR').AsInteger) and
          (iUltRecebedor = qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsInteger) and
          (iLinha < iNumLinhasxCCheque) do
    begin
//      PosVirg     := Pos(',',qryPensaoAlim.FieldByName('INFORMATIVO').AsString);//douglas.siqueira
      PosVirg     := Pos(',',qryPensaoAlim.FieldByName('VALORPROVENTO').AsString);
      iSeqRubrica := ((qryPensaoAlim.FieldByName('SEQRUBRICA').AsInteger - 1) Mod 99) + 1;//Bruno Bastos - 16/11/2004-PEND.18280

      // 3ª linha layout:
      If qryPensaoAlim.FieldByName('FLGESPECIAL').AsInteger <> 2 Then
      Begin
        inc(iLinha); 
        If chkGeraWeb.Checked Then
          sTexto := '3'+StrPadRight(Copy(qryPensaoAlim.FieldByName('CODPROVDESC').AsString,1, 4), 4, ' ')+
                    StrPadLeft(IntToStr(iSeqRubrica), 2, '0')+
                    StrPadRight(Copy(qryPensaoAlim.FieldByName('DESCRPROVDESC').AsString,1,40),40,' ')
        Else
          sTexto := '3'+StrPadRight(Copy(qryPensaoAlim.FieldByName('CODPROVDESC').AsString,1, 4), 4, ' ')+
                    StrPadLeft(IntToStr(iSeqRubrica), 2, '0')+
                    StrPadRight(Copy(qryPensaoAlim.FieldByName('DESCRPROVDESC').AsString,1,40),40,' ');

        If qryPensaoAlim.FieldByName('PRAZO').AsInteger = 0 Then
        Begin
          If PosVirg = 0 Then
          Begin
            sTexto := sTexto + '   '+
//                      StrPadLeft(qryPensaoAlim.FieldByName('INFORMATIVO').AsString,8,'0')+'00';//douglas.siqueira
                      StrPadLeft(qryPensaoAlim.FieldByName('VALORPROVENTO').AsString,8,'0')+'00';
          End
          Else
          Begin
            sTexto := sTexto + '   '+
                      StrPadLeft(Copy(qryPensaoAlim.FieldByName('VALORPROVENTO').AsString,1,(PosVirg-1)),8,'0')+
                      StrPadRight(Copy(qryPensaoAlim.FieldByName('VALORPROVENTO').AsString,PosVirg+1,2),2,'0');
//                      StrPadLeft(Copy(qryPensaoAlim.FieldByName('INFORMATIVO').AsString,1,(PosVirg-1)),8,'0')+//douglas.siqueira
//                      StrPadRight(Copy(qryPensaoAlim.FieldByName('INFORMATIVO').AsString,PosVirg+1,2),2,'0');//douglas.siqueira

          End;
        End
        Else
        Begin
          If PosVirg = 0 Then
          Begin
            sTexto := sTexto +
                      StrPadLeft(qryPensaoAlim.FieldByName('PRAZO').AsString,3,'0')+
//                      StrPadLeft(qryPensaoAlim.FieldByName('INFORMATIVO').AsString,8,'0')+'00';//douglas.siqueira
                      StrPadLeft(qryPensaoAlim.FieldByName('VALORPROVENTO').AsString,8,'0')+'00';
          End
          Else
          Begin
            sTexto := sTexto +
                      StrPadLeft(qryPensaoAlim.FieldByName('PRAZO').AsString,3,'0')+
//                      StrPadLeft(Copy(qryPensaoAlim.FieldByName('INFORMATIVO').AsString,1,(PosVirg-1)),8,'0')+//douglas.siqueira
//                      StrPadRight(Copy(qryPensaoAlim.FieldByName('INFORMATIVO').AsString,PosVirg+1,2),2,'0');//douglas.siqueira
                      StrPadLeft(Copy(qryPensaoAlim.FieldByName('VALORPROVENTO').AsString,1,(PosVirg-1)),8,'0')+
                      StrPadRight(Copy(qryPensaoAlim.FieldByName('VALORPROVENTO').AsString,PosVirg+1,2),2,'0');
          End
        End;

        writeln(FSaida, sTexto);
        Inc(iTotLinha);
      End;
      qryPensaoAlim.Next;

      // Insere última linha do titular
      if (iUltTitular <> qryPensaoAlim.FieldByName('IDTITULAR').AsInteger) OR (qryPensaoAlim.EOF) OR
         (iUltRecebedor <> qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsInteger) or
         (iLinha = iNumLinhasxCCheque) then
      begin

        PosTotProv   := Pos(',',FormatFloat('#0.00', rTotProvento));
        PosTotDesc   := Pos(',',FormatFloat('#0.00', rTotDesconto));
        PosLiq       := Pos(',',FormatFloat('#0.00', rTotLiquido));


        //4ª Linha Layout
        sTexto := '4'+StrPadLeft(Copy(FormatFloat('#0.00',rTotProvento),1,(PosTotProv-1)),8,'0')+
                      StrPadRight(Copy(FormatFloat('#0.00',rTotProvento),(PosTotProv+1),2),2,'0')+
                      StrPadLeft(Copy(FormatFloat('#0.00',rTotDesconto),1,(PosTotDesc-1)),8,'0')+
                      StrPadRight(Copy(FormatFloat('#0.00',rTotDesconto),(PosTotDesc+1),2),2,'0')+
                      StrPadLeft(Copy(FormatFloat('#0.00',rTotLiquido),1,(PosLiq-1)),8,'0')+
                      StrPadRight(Copy(FormatFloat('#0.00',rTotLiquido),(PosLiq+1),2),2,'0')+
                      '0000000000000000000000000000000000000000';

        writeln(FSaida, sTexto);
        Inc(iTotLinha);
      end;
    end;

    iUltTitular   := qryPensaoAlim.FieldByName('IDTITULAR').AsInteger;
    iUltRecebedor := qryPensaoAlim.FieldByName('IDRESPONSAVEL').AsInteger;
  end; // while not EOF

  sTexto := '9'+StrPadLeft(IntToStr(iTotLinha),9,'0')+StrPadLeft(IntToStr(iTotBenef),9,'0');
  //ContraCheque.Add(sTexto);
  writeln(FSaida, sTexto);
end;


procedure TFrmDemPag.chkGeraWebClick(Sender: TObject);
begin
  inherited;
  If chkGeraWeb.Checked Then
  Begin
    lblNumLinhas.Enabled := False;
    edtnumlinhas.Enabled := False;
  End
  Else
  Begin
    lblNumLinhas.Enabled := True;
    edtnumlinhas.Enabled := True;
  End;
end;

procedure TFrmDemPag.fcsbtnLimpaClick(Sender: TObject);
begin
  inherited;
  lidTitular        := 0;
  lidRecebedor      := 0;
  lidPatro          := 0;
  lidPlanoPrev      := 0;
end;

procedure TFrmDemPag.fcsbtnProcurarClick(Sender: TObject);
var
  lst : TStringList;
begin
  inherited;
end;

procedure TFrmDemPag.edNomeChange(Sender: TObject);
begin
  inherited;
  VerificaProcessa;
end;

procedure TFrmDemPag.BuscaCEP(pIdPessoa : Integer; var sCEP_Corresp, sCEP_Resid : string);
var
  sSql : string;

begin
  sSql := ' SELECT P.IDPESSOA, P.IDENDCORRESP, P.IDENDCOMERCIAL, P.IDENDENTREGA, '+
          ' P.IDENDRESIDENCIAL, P.IDENDCOBRANCA, E.CODESTADO, C.NOME AS CIDADE,  '+
          ' E.CEP, C.UF, TRIM(E.LOGRADOURO)||'' ''||TRIM(E.NUMERO)||'' ''||TRIM(E'+
          '.COMPLEMENTO)||'' ''||TRIM(E.BAIRRO) AS LOGRADOURO, '+
          ' E1.CODESTADO AS CODESTADO_RES, C1.NOME AS CIDADE_RES, E1.CEP AS CEP_RES, '+
          ' C1.UF AS UF_RES, '+
          ' TRIM(E1.LOGRADOURO)||'' ''||TRIM(E1.NUMERO)||'' ''||TRIM(E1.COMPLEMENTO)'+
          '||'' ''||TRIM(E1.BAIRRO) AS LOGRADOURO_RES '+
          ' FROM PESSOA P, ENDPESS E, ENDPESS E1, CIDADES C, CIDADES C1 '+
          ' WHERE P.IDPESSOA         = '+IntToStr(pIdPessoa)+
            ' AND P.IDENDRESIDENCIAL = E1.IDENDERECO(+) '+
            ' AND P.IDENDCORRESP     = E.IDENDERECO(+) '+
            ' AND E.IDCIDADES        = C.IDCIDADES(+) '+
            ' AND E1.IDCIDADES       = C1.IDCIDADES(+) ';
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(sSql);
  qryAux.Open;
  sCEP_Corresp := qryAux.FieldByName('CEP').AsString;
  sCEP_Resid   := qryAux.FieldByName('CEP_RES').AsString;
end;



procedure TFrmDemPag.frameBenefbbtnIncluiBenefClick(Sender: TObject);
begin
  inherited;
  frameBenef.bbtnIncluiBenefClick(Sender);
end;



procedure TFrmDemPag.frameBenefqryListaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VerificaProcessa;
end;



procedure TFrmDemPag.FormShow(Sender: TObject);
begin
  inherited;
  frameBenef.DefineLista(0);
end;


//Helio - SOL Nº 206183 KINTANA Nº 1996389
//adicionar ExecutaSQL
function TFrmDemPag.MontaQueryP2(Qry: TwwQuery; ExecutaSQL : Boolean): boolean;
var
  sSql : string;
  estadosSepVirgula : String; //Helio - SOL Nº 206183 KINTANA Nº 1996389
begin
  Result := True;
  DeterminaPatroSel;
  DeterminaPlanoSel;
  DeterminaPortforma;

  sSql :=
    ' SELECT G.FLGESPECIAL, G.IDTITULAR, G.IDPESSOA, '+
    ' G.IDPATRO AS IDPESSJUR, '+
    ' G.IDRESPONSAVEL, G.NOMERECEBEDOR, G.NOMEBENEFICIARIO, G.NOMETITULAR, G.PRAZO, '+
    ' G.CONTACORRENTE, G.NUMAGENCIA, G.NUMBANCO, '+
    ' G.SEQRUBRICA, G.IDHSTFOLHABENEF, G.DATAPAGAMENTO, G.MESREFERENCIA, G.MATRICULA, ' +
    ' G.DATANASC, G.NUMDEPIRRF, G.NUMDEPSALF, G.POSTAGEM, G.ISENTOIRRF, G.FORMAPAGTO, G.CODPROVDESC, '+
    ' G.DESCRPROVDESC, G.TPRUBRICA, G.FLGDESCONTO,G.FLGIRRFINFORMATIVO, SUM(G.INFORMATIVO)INFORMATIVO,G.IDPROVENTO, G.NUMPROCINSS, SUM(G.VALORINFO) '+///douglas.siqueira SOL179587
    ' VALORINFO, SUM(G.VALORRECEBIDO) VALORRECEBIDO, SUM(G.VALORPROVENTO) VALORPROVENTO '+

    //Helio - SOL Nº 206183 KINTANA Nº 1996389
    ', G.CODESTADO ' +
    ', G.UF ' +
    ', DECODE(G.DEFICIT,43,1,0) AS DEFICIT ' +
    'FROM (SELECT DISTINCT H.IDHSTFOLHABENEF, PD.FLGESPECIAL, H.DATAPAGAMENTO, '+
    ' H.SEQRUBRICA, '+
    ' H.MES AS MESREFERENCIA, H.IDRESPONSAVEL, '+
    ' NREC.NOME AS NOMERECEBEDOR, D.MATRICULA, H.IDTITULAR, H.IDPESSOA, '+
    ' H.IDPATRO, '+
    ' H.CONTACORRENTE, H.NUMAGENCIA, H.NUMBANCO, '+
    ' H.IDPLANOPREV, BENEF.NOME AS NOMEBENEFICIARIO, TIT.NOME AS NOMETITULAR, PF.DATANASC, '+
    ' TO_CHAR(NVL(H.NUMDEPIRRF, 00), ''09'') AS NUMDEPIRRF, TO_CHAR(NVL(H.NUMDEPSF, 00), ''09'') '+
    ' AS NUMDEPSALF, 1 AS POSTAGEM, DECODE(PF.FLGISENTOIRRF, 1, ''SIM'', ''NÃO'') ISENTOIRRF, '+
    ' POF.DESCRICAO AS FORMAPAGTO, ';

    sSql := sSql +
      ' PD.DESCRPROVDESC AS DESCRPROVDESC, '+
      ' PD.CODPROVDESC AS CODPROVDESC, ';

  sSql := sSql +
    '       TO_CHAR(H.VALORINFO, ''0000000000D00'') AS VALORINFO, '+
    '       TO_CHAR(H.VALORRECEBIDO, ''0000000000D00'') AS VALORRECEBIDO, '+

    ' DECODE(PD.FLGESPECIAL, 0, DECODE(PD.FLGDESCONTO, 1, ''D'', 0, ''P'', ''I''), ''I'') AS TPRUBRICA, '+
    ' H.PARCELAS AS PRAZO, PD.FLGDESCONTO, PD.FLGIRRFINFORMATIVO,DECODE(H.VALORPROVENTO,0,H.VALORINFO,NVL(H.VALORPROVENTO,H.VALORINFO)) AS INFORMATIVO, TO_CHAR(H.VALORPROVENTO, ''0000000000D00'') AS VALORPROVENTO, '+///douglas.siqueira SOL179587 
    ' PD.IDPROVENTO, H.NUMPROCINSS '+

    //Helio - SOL Nº 206183 KINTANA Nº 1996389
    ', CASE WHEN ENDP.IDENDERECO IS NULL THEN ENDP1.CODESTADO ' +
    '  ELSE ENDP.CODESTADO END AS CODESTADO, ' +
    '  CASE WHEN ENDP.IDENDERECO IS NULL THEN CID1.UF ' +
    '  ELSE CID.UF END AS UF' +
    '  , EST.IDESTRUTURA AS DEFICIT ' +  // SOL 253577/17651 PPM 1015006
    ' FROM ESTRUTURACALCULO EST, '+  // SOL 253577/17651 PPM 1015006
    ' HISTRUBSAL H, DEPENTIT D, PROVDESC PD, PORTADORFORMA POF, PESSOAFISICA PF, PESSOA BENEF, '+
    ' PESSOA TIT, PESSOA NREC ';

    //Helio - SOL Nº 206183 KINTANA Nº 1996389
    sSql := sSql + ',ENDPESS ENDP, ENDPESS ENDP1, CIDADES CID, CIDADES CID1 ';

    sSql := sSql + ' WHERE H.IDRUBRICA   =  EST.IDRUBRICAEXIBICAO(+) '+ // SOL 253577/17651 PPM 1015006
    ' AND H.IDHSTFOLHABENEF = '+IntToStr(qryHistorico.FieldByName('IDHSTFOLHABENEF').AsInteger)+' '+
    ' AND H.IDRESPONSAVEL BETWEEN 460001 AND 2000000 ' +
    //BRUNO AZEVEDO SOL 138794 KINTANA 849596
    ' AND H.IDPATRO = 91008 ';

    //Helio - SOL Nº 206183 KINTANA Nº 1996389
    sSql := sSql + ' AND BENEF.IDENDCORRESP     = ENDP.IDENDERECO(+) ' +
                   ' AND BENEF.IDENDRESIDENCIAL = ENDP1.IDENDERECO(+) ' +
                   ' AND ENDP.IDCIDADES  = CID.IDCIDADES(+) ' +
                   ' AND ENDP1.IDCIDADES = CID1.IDCIDADES(+) ';



  //If Not frameBenef.qryLista.IsEmpty Then
  If (Not frameBenef.qryLista.IsEmpty) And
     (Not bDemonstrativoAutomatico) Then //CPrev - 22537
    ssql:=ssql+'AND EXISTS (SELECT 1 '+
                           'FROM LISTAFOLHABENEFDET LD '+
                           'WHERE H.IDTITULAR = LD.IDTITULAR '+
                           'AND LD.IDLISTA = '+IntToStr(framebenef.ListaUsuario)+') '
  Else
  Begin
    If sPatroSel <> '' Then
    Begin
      If Pos(',', sPatroSel) = 0 Then
        sSql := sSql+' AND H.IDPATRO = '+sPatroSel+' '
      Else
        sSql := sSql+' AND H.IDPATRO in ('+sPatroSel+') ';
    End;
    If sPlanoSel <> '' Then
    Begin
      If Pos(',', sPlanoSel) = 0 Then
        sSql := sSql+' AND H.IDPLANOPREV = '+sPlanoSel+' '
      Else
        sSql := sSql+' AND H.IDPLANOPREV in ('+sPlanoSel+') ';
    End;
    If sPortformaSel <> '' Then
    Begin
      If Pos(',', sPortformaSel) = 0 Then
        sSql := sSql+' AND H.CODPORTFORMA = '+sPortformaSel+' '
      Else
        sSql := sSql+' AND H.CODPORTFORMA in ('+sPortformaSel+') ';
    End;
  End;

  sSql := sSql +
  ' AND (H.FLGESTORNO IS NULL OR H.FLGESTORNO = 0) '+
  ' AND H.FLGPENSAOALIM   <> 2 '+
  ' AND H.IDRESPONSAVEL    = NREC.IDPESSOA '+
  ' AND D.IDTITULAR        = H.IDTITULAR '+
  ' AND D.IDPESSOA(+)      = H.IDRESPONSAVEL '+
  ' AND PD.IDPROVENTO      = H.IDRUBRICA '+
  ' AND POF.CODPORTFORMA   = H.CODPORTFORMA '+
  ' AND BENEF.IDPESSOA     = H.IDRESPONSAVEL '+
  ' AND TIT.IDPESSOA       = H.IDTITULAR '+
  ' AND nvl(PF.flgdestcc,0)<> 1'+
  ' AND PF.IDPESSOA        = H.IDRESPONSAVEL) G ';

  //Helio - SOL Nº 206183 KINTANA Nº 1996389
  if (chkEstados.Checked) and (not ExecutandoBuscaEstados) then
  begin
    estadosSepVirgula := ObtemEstadosSeparadosPorVirgula;

    sSql := sSql + ' WHERE (((G.CODESTADO IS NOT NULL) AND '+
       '(G.CODESTADO IN (' + estadosSepVirgula + '))) ' +
       ' OR ' +
       ' ((G.CODESTADO IS NULL) AND ' +
       '(G.UF IN (' + estadosSepVirgula +')) )) ';
  end;
  //FIM Helio - SOL Nº 206183 KINTANA Nº 1996389

  sSql := sSql + ' GROUP BY G.PRAZO, G.IDRESPONSAVEL, G.IDHSTFOLHABENEF, G.SEQRUBRICA, G.DATAPAGAMENTO, G.MESREFERENCIA, '+
  ' G.MATRICULA, G.IDTITULAR, '+
  ' + G.NOMEBENEFICIARIO, G.NOMETITULAR, G.DATANASC, G.NUMDEPIRRF, '+
  ' G.NUMDEPSALF, G.POSTAGEM, G.ISENTOIRRF, G.FORMAPAGTO, G.CODPROVDESC, G.DESCRPROVDESC, G.TPRUBRICA, '+
  ' G.FLGDESCONTO,G.FLGIRRFINFORMATIVO,G.INFORMATIVO,G.IDPROVENTO, G.NUMPROCINSS, G.NOMERECEBEDOR, '+///douglas.siqueira SOL179587
  ' G.CONTACORRENTE, G.NUMAGENCIA, G.NUMBANCO, '+
  ' G.IDPESSOA, G.IDPATRO, G.FLGESPECIAL '+

  //Helio - SOL Nº 206183 KINTANA Nº 1996389
  ', G.CODESTADO ' +
  ', G.UF ' +
  ', G.DEFICIT ' +  // SOL 253577/17651 PPM 1015006
{  ' ORDER BY IDTITULAR, ' + // ORDENAÇÃO DEVE CONSIDERAR O TITULAR PARA QUEBRAR CONTRACHEQUE DAS     //Everson TIBERO
                             // PESSOAS QUE SÃO APOSENTADA E PENSIONISTA NUM MESMO MOMENTO.           //Everson TIBERO
  '   IDRESPONSAVEL, SEQRUBRICA ';}                                                                   //Everson TIBERO

  ' ORDER BY G.IDTITULAR, ' + // ORDENAÇÃO DEVE CONSIDERAR O TITULAR PARA QUEBRAR CONTRACHEQUE DAS    //Everson TIBERO
                              // PESSOAS QUE SÃO APOSENTADA E PENSIONISTA NUM MESMO MOMENTO.          //Everson TIBERO
  '   G.IDRESPONSAVEL, G.SEQRUBRICA ';                                                                //Everson TIBERO

  qry.Sql.Clear;
  qry.Sql.Add(sSql);

  if ExecutaSQL then //Helio - SOL Nº 206183 KINTANA Nº 1996389
     qry.Open;
end;



function TFrmDemPag.RetornaVlrCompensaIR(const pIDPessoa: Integer): Currency;
begin
  Result := 0;

  cdsCompensaIR.First;
  while not(cdsCompensaIR.EOF) do
  begin
    if pIDPessoa = cdsCompensaIR.FieldByName('IDPESSOA').AsInteger then
    begin
      Result := cdsCompensaIR.FieldByName('VLRCOMPMES').AsCurrency;
      Exit;
    end;

    cdsCompensaIR.Next;
  end;
end;


//Helio - SOL Nº 206183 KINTANA Nº 1996389
function TFrmDemPag.ObtemEstadosSeparadosPorVirgula: String;
var
    i       : Integer;
    estados : String;
begin

     estados := '';

     for i := 0 to ListaEstados.Count -1 do
     begin
        estados := estados + QuotedStr(ListaEstados[i]);

        if i < (ListaEstados.Count -1) then
           estados := estados + ',';
     end;

     Result := estados;
end;

//Helio - SOL Nº 206183 KINTANA Nº 1996389
procedure TFrmDemPag.chkEstadosClick(Sender: TObject);
var listaCodEstado : TStringList;
    i : Integer;
begin
  inherited;
  if chkEstados.Checked then
  begin
     if FrmDemPagSelEstado = nil then
        FrmDemPagSelEstado := TFrmDemPagSelEstado.Create(Self);

     qryAux.close;
     qryAux.SQL.Clear;
     qryAux.SQL.Text := frameBenef.qryLista.SQL.GetText;
     qryAux.Prepare;
     qryAux.ParamByName('IDLISTA').AsString := frameBenef.qryLista.parambyname('idlista').asstring;
     qryAux.Open;

     if frameBenef.qryLista.RecordCount > 0 then
     begin

       qryAux.First;
       while not qryAux.Eof do
       begin
           FrmDemPagSelEstado.ListaIDPessoasPermitidas.Add(
               qryAux.FieldByName('IDPESSOA').AsString
           );

           qryAux.Next;
       end;

     end
     else
     begin
         listaCodEstado := ObtemListaCodEstadosSemDepedentes;

         for i := 0 to listaCodEstado.Count - 1 do
         begin
            FrmDemPagSelEstado.ListaCodEstadosPermitidos.Add(
               listaCodEstado[i]
            );
         end;
     end;

     qryAux.Close;

     FrmDemPagSelEstado.ShowModal;

     if ListaEstados <> nil then
          FreeAndNil(ListaEstados);

     if FrmDemPagSelEstado.RetornouValor then
     begin
        ListaEstados := TStringList.Create;

        ListaEstados.Text := FrmDemPagSelEstado.ListaCodEstadosSelecionados.Text;
     end
     else
     begin
         chkEstados.Checked := False;
     end;

     FreeAndNil(FrmDemPagSelEstado);
  end;
end;

//Helio - SOL Nº 206183 KINTANA Nº 1996389
function TFrmDemPag.ObtemListaCodEstadosSemDepedentes : TStringList;
var
   sql : String;
   lista : TStringList;
   Qry   : TwwQuery;
begin
   ExecutandoBuscaEstados := True;
   lista := TStringList.Create;
   qry   := TwwQuery.Create(nil);
   qry.DataBaseName := 'BaseDados';

   MontaQuery(Qry, False);
   sql := ' SELECT DISTINCT CODESTADO FROM ( ' + Qry.SQL.Text + ' ) ';

   qry.SQL.Clear;
   qry.SQL.Add(sql);
   qry.Open;


   qry.First;
   while not qry.Eof do
   begin
       if lista.IndexOf( qry.FieldByName('CODESTADO').AsString ) = -1 then
       lista.Add(
           qry.FieldByName('CODESTADO').AsString
           );

       qry.Next;
   end;


   MontaQueryP2(Qry, False);
   sql := ' SELECT DISTINCT CODESTADO FROM ( ' + Qry.SQL.Text + ' ) ';

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(sql);
   qry.Open;

   qry.First;
   while not qry.Eof do
   begin
       if lista.IndexOf( qry.FieldByName('CODESTADO').AsString ) = -1 then
       lista.Add(
           qry.FieldByName('CODESTADO').AsString
           );

       qry.Next;
   end;


   MontaQueryPensAlim(Qry, False);
   sql := ' SELECT DISTINCT CODESTADO FROM ( ' + Qry.SQL.Text + ' ) ';

   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add(sql);
   qry.Open;

   qry.First;
   while not qry.Eof do
   begin
       if lista.IndexOf( qry.FieldByName('CODESTADO').AsString ) = -1 then
       lista.Add(
           qry.FieldByName('CODESTADO').AsString
           );

       qry.Next;
   end;

   qry.Close;
   FreeAndNil(qry);

   lista.Sort;
   Result := lista;

   ExecutandoBuscaEstados := False;
end;

end.



{==============================================================================|
| UNIT: FPRELDEMPAG                                                            |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   GERA ARQUIVO TEXTO PARA EMISSÃO DE CONTRA CHEQUE COM INFORMAÇÕES DAS       |
| RUBRICAS DE PAGAMENTO DOS RECEBEDORES DE DETERMINADA VERSÃO DE PAGAMENTO,    |
| PODENDO UTILIZAR FILTRO POR PATROCINADORA, PLANO E PORTADOR FORMA.           |
| PODE-SE TAMBÉM DEFINIR UMA MENSAGEM A SER IMPRESSA NO CONTRA CHEQUE.         |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uBiblioteca    |
| pela uString.                                                                |
|------------------------------------------------------------------------------}
