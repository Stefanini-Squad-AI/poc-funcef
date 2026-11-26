// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Pendência   :  SIG 114623
//Responsável :  Ewerton Beltramini
//Data        :  29/01/2021
//Descrição   :  Implementação do comando Copy, para igualar as bases de produção.
//***************************************************************************************
//Rotina     : SelecionaDadosCabecArq
//Data       : 11/08/2020
//SIG        : 101587
//Autor      : Andre Imakawa / Cássio Florencio Rovaroto
//Descrição  : Corrigir a query  SelecionaDadosCabecArq
//***************************************************************************************
//Rotina     : AlimentaQryDocTxtLeiaute240, bbtnProcessarClick
//Data       : 11/08/2020
//SIG        : 101541
//Autor      : Andre Imakawa / Cássio Florencio Rovaroto
//Descrição  : Gravar conta corrente conforme recuperado da PREVIA.
//***************************************************************************************
//Rotina             : FormShow
//N. SIG..........   : 60540
//Data da Alteração: : 
//Alteração Form:    : fGeraArquivoRemessaPrevia
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Alterando a forma de geração do arquivo de remessa a partir da
//                     prévia da folha
//***************************************************************************************
//Rotina.............: GetDadosRec, FormClose, FormCreate, FormShow, AlimentaQryDocTxt,
//                     bbtnProcessarClick
//N. SIG.............: 78153
//Data da Alteração..: 12/11/2018
//Alteração Form.....: fGeraArquivoRemessaPrevia
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alteração dos componentes utilizados na geração dos arquivos de remessa.
//***************************************************************************************
//------------------------------------------------------------------------------
//Pendência   : SIG TIBERO
//Responsável : Everson Luiz Pereira da Cunha
//Data        : 21/02/2018
//Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------
//Pendência   : SOL 141937 KINTANA 901258
//Responsável : BRUNO AZEVEDO
//Data        : 13/08/2010
//Descrição   : Correção na busca da conta corrente.
//------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************
//Autor(a)    : Claudio Faria
// Data        : 31/05/2007
// Rotina      : Qry
// Pendência   : 21964 (ReAbertura)
// Descricao   : Novos parametros para o IntBanco.
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 31/05/2007
// Rotina      : Qry
// Pendência   : 21964 (ReAbertura)
// Descricao   : Novos parametros para o IntBanco.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 23/10/2006
// Rotina      : ProcessaArquivobanco
// Pendência   : 22675
// Descricao   : Filtrar na qryDadosRec apenas o documento referente a CPF.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/10/2006
// Rotina      : ProcessaArquivobanco
// Pendência   : 23561
// Descricao   : Não fazer quebra de valores por plano. Esta correção visa
//  suportar mais de um plano previdenciario.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : AbrePortador
//  Data       : 18.03.2006
//  Pendencia  : 21005
//  Alteração  : A geração de arquivo bancário pela Prévia deve utilizar a
//               parametrização de agrupar arquivo para portadores TED / DOC.
//------------------------------------------------------------------------------
//  Autor(a)   : Paulo Ramos
//  Rotina     : Várias
//  Data       : 07.03.2006
//  Pendencia  : 21346
//  Alteração  : Tratar tipo de conta OP, para a qual não é obrigatório
//               informar a conta corrente, na geração do arquivo bancário.
//------------------------------------------------------------------------------
//  Autor      : Bruno Bastos
//  Rotina     : bbtnProcessarClick
//  Pendência  : 20586
//  Data       : 28/10/2005
//  Descricao  : Passar para a função UltDiaUtilAnterior da DiasUteis os parâme_
//               tros da fundação.
//------------------------------------------------------------------------------


unit fGeraArquivoRemessaPrevia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
  UDiasUteis, MontaSelect, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Usistema, dbasedados, Wwdatsrc, BfDialogs, BrowseFolder,
  uProcuraDir, uDataBase, UMensErro, uCtrlIntBanco, {UBiblioteca,}
  uString, fAguarde, uConstFolha, uObjFolha, uFolhaBenef,
  DBClient, uCMClientDataSet, Provider, DBCtrls, Grids, Wwdbigrd, Wwdbgrid,
  Spin, uCtrlPadroes, uCtrlRemessaEletronica, UCtrlConjuntoRubrica,
  FileCtrl;

type
  TfrmGeraArquivoRemessaPrevia = class(TfrmOkCancelar)
    qryLote1: TwwQuery;
    qryPortador1: TwwQuery;
    qryRecebedor: TwwQuery;
    QryDocTxt: TwwQuery;
    qryPortadorForma: TwwQuery;
    qryDadosRec: TwwQuery;
    updDoc: TUpdateSQL;
    bbtnProcessar: TBitBtn;
    bbtnOutro: TBitBtn;
    msAssistido: TMontaSelect;
    qryDadosAg: TwwQuery;
    pdirdlgPasta: TProcuraDirDlg;
    pgcComponentes: TPageControl;
    tbsOpcoes: TTabSheet;
    tbsResultado: TTabSheet;
    pnlSelecao: TPanel;
    grpBanco: TGroupBox;
    grpParticip: TGroupBox;
    Label3: TLabel;
    edNomeAssist: TLabel;
    spbRecebedor: TSpeedButton;
    edMatricula: TEdit;
    edNome: TEdit;
    pnlProcesso: TPanel;
    lbProcessando: TLabel;
    mmResult: TMemo;
    pBarProcesso: TProgressBar;
    qryAux: TwwQuery;
    dspDocTxt: TDataSetProvider;
    cdsDocTxt: TCMClientDataSet;
    dsPortador: TwwDataSource;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    pnlLblDiretorio: TPanel;
    lblDiretorio: TLabel;
    btnEscolheDir: TBitBtn;
    GroupBox1: TGroupBox;
    edDataFolha: TCMDateTimePicker;
    dsLote: TwwDataSource;
    dspLote: TDataSetProvider;
    cdsLote: TCMClientDataSet;
    dspPortador: TDataSetProvider;
    cdsPortador: TCMClientDataSet;
    dbgPortadorForma: TwwDBGrid;
    cdsLoteSEL: TFloatField;
    cdsLoteIDLOTE: TFloatField;
    cdsLoteDESCRICAO: TStringField;
    cdsLoteMESREFERENCIA: TStringField;
    cdsPortadorSEL: TFloatField;
    cdsPortadorCODPORTFORMA: TFloatField;
    cdsPortadorDESCRICAO: TStringField;
    cdsPortadorSEQDOCUMENTO: TFloatField;
    cdsPortadorDFLOATPAGTO: TFloatField;
    Panel1: TPanel;
    Panel2: TPanel;
    grpMesRef: TGroupBox;
    spnedAno: TSpinEdit;
    cmbMes: TComboBox;
    grpHistorico: TGroupBox;
    dbgPrevia: TwwDBGrid;
    cdsPortadorTIPOCONTA: TStringField;
    bbtnEnviarArquivo: TBitBtn;
    dspTarifaArqPagto: TDataSetProvider;
    cdsTarifaArqPagto: TCMClientDataSet;
    qryTarifaArqPagto: TwwQuery;
    dsTarifaArqPagto: TwwDataSource;
    dspTipoFormaRecPag: TDataSetProvider;
    cdsTipoFormaRecPag: TCMClientDataSet;
    qryTipoFormaRecPag: TwwQuery;
    dsTipoFormaRecPag: TwwDataSource;
    dlgEnviarArquivo: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtnProcessarClick(Sender: TObject);
    procedure bbtnOutroClick(Sender: TObject);
    procedure spbRecebedorClick(Sender: TObject);
    procedure btnEscolheDirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CorParaColunaSelecao(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgPreviaFieldChanged(Sender: TObject; Field: TField);
    procedure dbgPortadorFormaFieldChanged(Sender: TObject; Field: TField);
    procedure cmbMesChange(Sender: TObject);
    procedure spnedAnoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnEnviarArquivoClick(Sender: TObject);
  private
    { Private declarations }
    sMesReferencia : string;
    iidRecebedor, iNumRegistro : integer;
    iseqdoctxt : longint;
    fCtrlIntBanco: TCtrlIntBanco;
    //Cássio Rovaroto - SIG nº 60540 - Início
    ArquivoEnvioCEF: TextFile;
    sNomeArquivoGerado, sNomeCompletoArquivoRemessa, sNomeCompletoBackup: String;
    IdMotivoAnt, iIdPlanoPrev: Integer;
    qryMontaArquivo: TwwQuery;
    bResumoGerado: boolean;
    ctrlRemessaEletronica: TCtrlRemessaEletronica;
    //Cássio Rovaroto - SIG nº 60540 - Fim
    //Cássio Rovaroto - SIG nº 78153 - Início
    fCtrlConjuntoRubricas: TCtrlConjuntoRubrica;
    cdsRecebedor: TCMClientDataSet;
    cdsDadosRec: TCMClientDataSet;
    //Cássio Rovaroto - SIG nº 78153 - Fim
    procedure AlimentaQryDocTxt;
    procedure MsgErro(sMsg: String);
    function TiraZerosEsquerda(stexto : string) : string;
    function GetDadosRec(pIdResponsavel: Integer): OleVariant; //Cássio Rovaroto - SIG nº 78153

    //Cássio Rovaroto - SIG nº 60540 - Início
    function MontaArquivoCNAB240: Boolean;
    function GetParametrosArquivo(iCodPortadorForma: integer): string;
    function CriaArquivo(sArquivo: String): Boolean;
    function GetNumNSA(pNumEmpresaBanco: string): integer;
    function GeraArquivoDeRemessa(pNomeCompletoArquivoRemessa, pCodPortForma: String; pIdArquivoPagto: Integer): boolean;
    procedure GravaLinha(sArquivo, sLinha: string);
    procedure SaveToCSV(DataSet: TDataSet; FileName, sHeader: string);
    function SelecionaDadosCabecArq(iCodPortForma: integer; sIdRemessa: string): string;
    function SelecionaDadosCabecLote(pCodPortForma, pSeqLote, pFormaLanc, pTipCompromisso, pTipoServico: String): string;
    function SelecionaDadosRodapeLote(pSeqLote, pQtdRegsLote, pVlrTotalLote: String): string;
    function SelecionaDadosRodapeArq(pQtdLotesArq, pQtdRegsArq: String): string;
    function MontaLinhaA(pNSR, pSeqLote, pFinalidadeDoc, pNumDoc, pSeqRemessa, pFormaLanc: string): string;
    function MontaLinhaB(pNSR, pSeqLote: string): string;
    function FormatarValor(NumCasas: integer; Valor: string): string;
    function ZeroEsquerda(TamanhoTexto : Integer; Texto : String) : String;
    function ZeroDireita(TamanhoTexto : integer; texto : String) : string;
    function AjustaTamCampo(sCampo : string; iTam : integer; sChar: string): string;
    function RemoveCaracterEspecial(pTexto: String; pRemoveExtra: boolean): String;
    function RetornaFormasPagto(pCodPortForma: string): String;
    procedure AbrirQueryDocTxtLeiaute240;
    procedure AbrirQueryDocTxtLeiaute150;
    procedure AlimentaQryDocTxtLeiaute240(aLinha: Integer);
    procedure RegistraTarifaBancaria(pIdArquivoPagto, pCodPortForma, pIdPessoa, pNumDoc: Integer; pLotes: string);
    procedure MontaTarifaArqPagto;
    function RetornaDiretorioRemessa(pConvenio: String): String;
    function InsereRemessaPrevia(pNomeArquivo: string): Integer;
    function InsereRemessaPreviaDet(pIdRemessaPrevia, pCodDocArq: Integer;
                                 pIdTitular, pIdResponsavel, pMatricula: String): Integer;
    Function AlteraNSAArquivo(pArquivo, pConvenio: String): String;
    function AtualizaNSARemessa(pIdRemessa, pNSA: string): Integer;
    //Cássio Rovaroto - SIG nº 60540 - Fim
  public
    { Public declarations }
    sPortadorSel, sclauportador, sclaulotes, sLotesSel: string;
    procedure ObtemLotes;
    procedure ObtemPortador;
    procedure AbrePortador;
    procedure AbreLote;
    procedure PegaMesReferencia;
  end;

implementation

{$R *.DFM}

procedure TfrmGeraArquivoRemessaPrevia.FormCreate(Sender: TObject);
begin
  inherited;

        //Jéssica Lana SOL 109421 KINTANA 496332
        lblDiretorio.Caption:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
        pgcComponentes.activepage:=tbsOpcoes;

  //Cássio Rovaroto - SIG nº 78153 - Início
  cdsDadosRec := TCMClientDataSet.Create(nil);
  cdsRecebedor := TCMClientDataSet.Create(nil);
  fCtrlConjuntoRubricas:= TCtrlConjuntoRubrica.Create;
  fCtrlConjuntoRubricas.Initialize(DtmBaseDados.DbBaseDados, True,
                                   Sistema.ConnectionType, Sistema.ConnectionSide,
                                   Sistema.AppRemoteServer, True, MsgErro);
  //Cássio Rovaroto - SIG nº 78153 - Fim

  qryMontaArquivo:= TwwQuery.Create(nil);
  bResumoGerado := False;
  ctrlRemessaEletronica := TCtrlRemessaEletronica.Create;
  ctrlRemessaEletronica.InitializeAs(Padroes);

end;

procedure TfrmGeraArquivoRemessaPrevia.FormShow(Sender: TObject);
 var liDia, liMes, liAno: Word;
     sMsg: string;
begin
  inherited;
  DecodeDate(date, liAno, liMes, liDia);
  if (liMes >= 1) and (liMes <= 12) then
  begin
    cmbMes.ItemIndex:=liMes-1;
    cmbMes.Text:=cmbMes.Items[cmbMes.ItemIndex];
    spnedAno.Text:=inttostr(liAno);
  end;
  AbreLote;
  //Cássio Rovaroto - SIG nº 78153 - Início
  //qryRecebedor.prepare;
  //qryDadosRec.prepare;
  //Cássio Rovaroto - SIG nº 78153 - Fim
  qryPortadorForma.Close;
  qryPortadorForma.Open;

  //Cássio Rovaroto - SIG nº 60540 - Início
  //GroupBox2.Enabled := False;
  //btnEscolheDir.Enabled := False;
  //sMsg := 'O arquivo gerado será armazenado em diretório sem acesso direto.' + #13#10 +
  //        'Será gerado um resumo da composição antes da confirmação da geração ao Arquivo de Pagamento.';
  //MsgDlg(sMsg, Sistema.NomeModulo, mtInformation, [mbOk], 0);
  //Cássio Rovaroto - SIG nº 60540 - Fim
end;

procedure TfrmGeraArquivoRemessaPrevia.cmbMesChange(Sender: TObject);
begin
  inherited;
  AbreLote;
end;

procedure TfrmGeraArquivoRemessaPrevia.spnedAnoChange(Sender: TObject);
begin
  inherited;
  if (spnedAno.value >= spnedAno.minvalue) and
     (spnedAno.value <= spnedAno.maxvalue) then
    AbreLote;
end;

procedure TfrmGeraArquivoRemessaPrevia.PegaMesReferencia;
begin
  if cmbMes.itemindex <= 8 then
    sMesReferencia:=trim(spnedAno.Text)+'/0'+inttostr(cmbMes.ItemIndex+1)
  else
    sMesReferencia:=trim(spnedAno.Text)+'/'+inttostr(cmbMes.ItemIndex+1);
end;

procedure TfrmGeraArquivoRemessaPrevia.AbreLote;
var ssql: string;
begin
  PegaMesReferencia;

  ssql:='SELECT 0 AS SEL, IDLOTE, DESCRICAO, MESREFERENCIA '+_clinefeed+
        'FROM CTRLINTERFACE '+_clinefeed+
        'WHERE (FLGIDATMP = 1) '+_clinefeed+
        'AND (MESREFERENCIA = '+quotedstr(sMesReferencia)+') '+_clinefeed+
        'AND (FLGVOLTATMP = 0) '+_clinefeed+
        'AND (TIPO = ''B'') '+_clinefeed+
        'AND (IDREFERENCIA IS NULL) '+_clinefeed+
        'ORDER BY IDLOTE DESC '+_clinefeed;

  cdsLote.close;
  qryLote1.sql.clear;
  qryLote1.sql.add(ssql);
  cdsLote.open;

  dbgPrevia.enabled:=cdsLote.recordcount > 0;
  AbrePortador;
end;

procedure TfrmGeraArquivoRemessaPrevia.AbrePortador;
var ssql: string;
begin
  if sLotesSel <> '' then
  begin
    if SistemaFolha.FlgAgrupaArqDocAlt then
//      ssql := 'SELECT /*+INDEX(PV XIE6PREVIA)*/ '                                 + _clinefeed + //Everson TIBERO
      ssql := 'SELECT                           '                                 + _clinefeed +   //Everson TIBERO
              '       0 AS SEL, P.CODPORTFORMA, P.DESCRICAO, 0 AS SEQDOCUMENTO, ' + _clinefeed +
              '       DECODE(B.TIPOCONTA,''4'',''4'',''D'') AS TIPOCONTA, '       + _clinefeed + 
              '       MIN(B.DFLOATPAGTO)                    AS DFLOATPAGTO, '     + _clinefeed +
              '       MIN(B.DFLOATPAGTOALTER)               AS DFLOATPAGTOALTER, ' + _clinefeed +
              '       NVL(P.FLGARQUIVO,''N'')               AS FLGARQUIVO       ' + _clinefeed +
              'FROM PREVIA PV, PORTADORFORMA P, BANCOPORTFORMA B '                + _clinefeed +
              'WHERE (PV.IDLOTE ' + sclaulotes + ') '                             + _clinefeed +
              '  AND (PV.CODPORTFORMA = P.CODPORTFORMA) '                         + _clinefeed +
              '  AND (B.CODPORTFORMA  = PV.CODPORTFORMA) '                        + _clinefeed +
              '  AND (B.IDMODULO      = 18) '                                     + _clinefeed +
              'GROUP BY P.CODPORTFORMA, P.DESCRICAO, '                            + _clinefeed +
              '         DECODE(B.TIPOCONTA,''4'',''4'',''D'') '                   + _clinefeed +
              '         , NVL(P.FLGARQUIVO,''N'')             '                   + _clinefeed +
              'ORDER BY NVL(P.FLGARQUIVO,''N''),  P.DESCRICAO '                                             + _clinefeed
    else
//      ssql := 'SELECT /*+INDEX(PV XIE6PREVIA)*/ '                                 + _clinefeed +  //Everson TIBERO
      ssql := 'SELECT                           '                                 + _clinefeed +    //Everson TIBERO
              '       0 AS SEL, P.CODPORTFORMA, P.DESCRICAO, PV.SEQDOCUMENTO, '   + _clinefeed +
              '       DECODE(B.TIPOCONTA,''4'',''4'',''D'') AS TIPOCONTA, '       + _clinefeed + 
              '       MIN(B.DFLOATPAGTO)                    AS DFLOATPAGTO, '     + _clinefeed +
              '       MIN(B.DFLOATPAGTOALTER)               AS DFLOATPAGTOALTER, ' + _clinefeed +
              '       NVL(P.FLGARQUIVO,''N'')               AS FLGARQUIVO       ' + _clinefeed +
              'FROM PREVIA PV, PORTADORFORMA P, BANCOPORTFORMA B '                + _clinefeed +
              'WHERE (PV.IDLOTE '+sclaulotes+') '                                 + _clinefeed +
              '  AND (PV.CODPORTFORMA = P.CODPORTFORMA) '                         + _clinefeed +
              '  AND (B.CODPORTFORMA  = PV.CODPORTFORMA) '                        + _clinefeed +
              '  AND (B.IDMODULO      = 18) '                                     + _clinefeed +
              'GROUP BY P.CODPORTFORMA, P.DESCRICAO, PV.SEQDOCUMENTO, '           + _clinefeed +
              '         DECODE(B.TIPOCONTA,''4'',''4'',''D'') '                   + _clinefeed + 
              '         , NVL(P.FLGARQUIVO,''N'')             '                   + _clinefeed +
              'ORDER BY NVL(P.FLGARQUIVO,''N''),P.DESCRICAO '                                             + _clinefeed
  end
  else
//    ssql := 'SELECT /*+INDEX(PV XIE6PREVIA)*/ '                               + _clinefeed +  //Everson TIBERO
    ssql := 'SELECT                           '                               + _clinefeed +    //Everson TIBERO
            '       0 AS SEL, P.CODPORTFORMA, P.DESCRICAO, PV.SEQDOCUMENTO, ' + _clinefeed +
            '       DECODE(B.TIPOCONTA,''4'',''4'',''D'') AS TIPOCONTA, '     + _clinefeed + 
            '       MIN(B.DFLOATPAGTO)              AS DFLOATPAGTO, '         + _clinefeed +
            '       MIN(B.DFLOATPAGTOALTER)         AS DFLOATPAGTOALTER, '     + _clinefeed + 
            '       NVL(P.FLGARQUIVO,''N'')               AS FLGARQUIVO       ' + _clinefeed +
            'FROM PREVIA PV, PORTADORFORMA P, BANCOPORTFORMA B '              + _clinefeed +
            'WHERE (1 = 2) '                                                  + _clinefeed +
            '  AND (PV.CODPORTFORMA = P.CODPORTFORMA) '                       + _clinefeed +
            '  AND (B.CODPORTFORMA  = PV.CODPORTFORMA) '                      + _clinefeed +
            '  AND (B.IDMODULO      = 18) '                                   + _clinefeed +
            'GROUP BY P.CODPORTFORMA, P.DESCRICAO, PV.SEQDOCUMENTO, '         + _clinefeed +
            '         DECODE(B.TIPOCONTA,''4'',''4'',''D'') '                 + _clinefeed + 
            '         , NVL(P.FLGARQUIVO,''N'')             '                   + _clinefeed +
            'ORDER BY NVL(P.FLGARQUIVO,''N''), P.DESCRICAO '                                           + _clinefeed;

  cdsPortador.close;
  qryPortador1.sql.clear;
  qryPortador1.sql.add(ssql);
  cdsPortador.open;

  cdsPortador.fieldbyname('SEQDOCUMENTO').visible:=not SistemaFolha.FlgAgrupaArqDocAlt; 
  dbgPortadorForma.enabled:=cdsPortador.recordcount > 0;
end;

procedure TfrmGeraArquivoRemessaPrevia.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Canclose:=bbtnSair.enabled;
end;

procedure TfrmGeraArquivoRemessaPrevia.ObtemLotes;
var iquant: integer;
    lidlote: integer;
begin
  sLotesSel:='';
  iquant:=0;
  lidlote:=cdsLote.fieldbyname('IDLOTE').asinteger;
  cdsLote.disablecontrols;
  cdsLote.first;

  while not cdsLote.eof do
  begin
    if (cdsLote.fieldbyname('SEL').asinteger = 1) then
    begin
      inc(iquant);
      sLotesSel:=sLotesSel+inttostr(cdsLote.fieldbyname('IDLOTE').asinteger)+',';
    end;
    cdsLote.next;
  end;

  cdsLote.locate('IDLOTE', vararrayof([lidlote]), []);
  cdsLote.enablecontrols;

  if sLotesSel <> '' then
  begin
    delete(sLotesSel,length(sLotesSel),1);

    if iquant = 1 then
      sclaulotes:=' = '+sLotesSel
    else
      sclaulotes:=' IN ('+sLotesSel+') ';
  end;
end;

procedure TfrmGeraArquivoRemessaPrevia.ObtemPortador;
var iquant: integer;
    lcodportforma: integer;
begin
  sPortadorSel:='';
  iquant:=0;
  lcodportforma:=cdsPortador.fieldbyname('CODPORTFORMA').asinteger;
  cdsPortador.disablecontrols;
  cdsPortador.first;
  while not cdsPortador.eof do
  begin
    if (cdsPortador.fieldbyname('SEL').asinteger = 1) then
    begin
      inc(iquant);
      sPortadorSel:=sPortadorSel+inttostr(cdsPortador.fieldbyname('CODPORTFORMA').asinteger)+',';
    end;
    cdsPortador.next;
  end;
  cdsPortador.locate('CODPORTFORMA', vararrayof([lcodportforma]), []);
  cdsPortador.enablecontrols;
  if sPortadorSel <> '' then
  begin
    delete(sPortadorSel,length(sPortadorSel),1);
    if iquant = 1 then
      sclauportador:=' = '+sportadorsel
    else
      sclauportador:=' IN ('+sportadorsel+') ';
  end;
end;

procedure TfrmGeraArquivoRemessaPrevia.dbgPreviaFieldChanged(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Field = cdsLote.fieldbyname('SEL') then
  begin
    ObtemLotes;
    AbrePortador;
  end;
end;

procedure TfrmGeraArquivoRemessaPrevia.dbgPortadorFormaFieldChanged(
  Sender: TObject; Field: TField);
begin
  inherited;
  if Field = cdsPortador.fieldbyname('SEL') then
  begin
    ObtemPortador;
  end;
end;

function TfrmGeraArquivoRemessaPrevia.TiraZerosEsquerda(stexto : string) : string;
begin
  while copy(sTexto,1,1) = '0' do
    delete(sTexto,1,1);
  result:=sTexto;
end;

procedure TfrmGeraArquivoRemessaPrevia.AlimentaQryDocTxt;
 var sLogradouro, sNumero, sComplemento, sBairro,
     sCidade, sCodestado, sCep, sNumdocumento, sNomeRecebedor,
     sMatricula, sContaCorrente, sAgencia, sBanco, sTipoConta, sNomeAgencia : string;
     cdsAux: TCMClientDataSet;
Begin
  try
    cdsAux := TCMClientDataSet.Create(nil);  //Cássio Rovaroto - SIG nº 78153
    sLOGRADOURO := '';
    sNUMERO     := '';
    sCOMPLEMENTO:= '';
    sBAIRRO     := '';
    sCIDADE     := '';
    sCODESTADO  := '';
    sCEP        := '';
    sNumdocumento:='';
    //Cássio Rovaroto - SIG nº 78153 - Início
    {
    if not qryDadosRec.isempty then
    begin
      sLOGRADOURO    := qryDadosRec.FieldByName('LOGRADOURO').AsString;
      sNUMERO        := qryDadosRec.FieldByName('NUMERO').AsString;
      sCOMPLEMENTO   := qryDadosRec.FieldByName('COMPLEMENTO').AsString;
      sBAIRRO        := qryDadosRec.FieldByName('BAIRRO').AsString;
      sCIDADE        := qryDadosRec.FieldByName('CIDADE').AsString;
      sCODESTADO     := qryDadosRec.FieldByName('CODESTADO').AsString;
      sCEP           := qryDadosRec.FieldByName('CEP').AsString;
      sNumdocumento  := qryDadosRec.FieldByName('NUMDOCUMENTO').AsString;
      while length(sNumdocumento) < 11 do
        sNumdocumento:='0'+sNumDocumento;
      sNomeRecebedor := qryDadosRec.FieldByName('NOME').AsString;
    end
    else
    begin
      mmResult.lines.add('Informações do recebedor '+
                         qryRecebedor.fieldbyname('IDRESPONSAVEL').asstring+
                         ' inexistentes (linha ignorada).');
      exit;
    end;

    qryDadosRec.Close;
    qryDadosRec.ParamByName('IDRESPONSAVEL').AsInteger:= qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
    qryDadosRec.Open;}
    cdsDadosRec.Data := GetDadosRec(cdsRecebedor.FieldByName('IDRESPONSAVEL').AsInteger);

    if not cdsDadosRec.IsEmpty then
    begin
      sLOGRADOURO    := cdsDadosRec.FieldByName('LOGRADOURO').AsString;
      sNUMERO        := cdsDadosRec.FieldByName('NUMERO').AsString;
      sCOMPLEMENTO   := cdsDadosRec.FieldByName('COMPLEMENTO').AsString;
      sBAIRRO        := cdsDadosRec.FieldByName('BAIRRO').AsString;
      sCIDADE        := cdsDadosRec.FieldByName('CIDADE').AsString;
      sCODESTADO     := cdsDadosRec.FieldByName('CODESTADO').AsString;
      sCEP           := cdsDadosRec.FieldByName('CEP').AsString;
      sNumdocumento  := cdsDadosRec.FieldByName('NUMDOCUMENTO').AsString;
      while Length(sNumdocumento) < 11 do
        sNumdocumento:='0'+sNumDocumento;
      sNomeRecebedor := cdsDadosRec.FieldByName('NOME').AsString;
    end
    else
    begin
      mmResult.Lines.Add('Informações do recebedor '+
                         cdsRecebedor.FieldByName('IDRESPONSAVEL').AsString +
                         ' inexistentes (linha ignorada).');
      Exit;
    end;
    //Cássio Rovaroto - SIG nº 78153 - Fim

    qryDadosAg.close;
    qryDadosAg.SQL.clear;
    qryDadosAg.SQL.add('SELECT 1 AS TIPOCONTA, PA.NOME AS NOMEAGENCIA ');
    qryDadosAg.SQL.add('FROM AGENCIABANCARIA AG, BANCO BA, PESSOA PA ');
    //Cássio Rovaroto - SIG nº 78153 - Início
    //qryDadosAg.SQL.add('WHERE AG.NUMAGENCIA = '''+qryRecebedor.fieldbyname('NUMAGENCIA').asstring+'''');
    //qryDadosAg.SQL.add('AND BA.NUMBANCO = '''+qryRecebedor.fieldbyname('NUMBANCO').asstring+'''');
    qryDadosAg.SQL.add('WHERE AG.NUMAGENCIA = ''' + cdsRecebedor.FieldByName('NUMAGENCIA').AsString + '''');
    qryDadosAg.SQL.add('AND BA.NUMBANCO = ''' + cdsRecebedor.FieldByName('NUMBANCO').AsString + '''');
    //Cássio Rovaroto - SIG nº 78153 - Fim
    qryDadosAg.SQL.add('AND BA.IDPESSOA = AG.IDBANCO ');
    qryDadosAg.SQL.add('AND PA.IDPESSOA = AG.IDPESSOA ');
    qryDadosAg.Open;

    if not qryDadosAg.isempty then
    begin
      sTipoConta   := qryDadosAg.FieldByName('TIPOCONTA').AsString;
      sNomeAgencia := qryDadosAg.FieldByName('NOMEAGENCIA').AsString;
    end
    else
    begin
      mmResult.lines.add('Informações de banco e agência '+
      //Cássio Rovaroto - SIG nº 78153 - Início
      //                   qryRecebedor.fieldbyname('NUMBANCO').asstring+'/'+
      //                   qryRecebedor.fieldbyname('NUMAGENCIA').asstring+
                         cdsRecebedor.FieldByName('NUMBANCO').AsString + '/' +
                         cdsRecebedor.FieldByName('NUMAGENCIA').AsString +
      //Cássio Rovaroto - SIG nº 78153 - Fim
                         ' inexistentes (linha ignorada).');
      exit;
    end;

    //Cássio Rovaroto - SIG nº 78153 - Início
    //sBanco:=qryRecebedor.FieldByName('NUMBANCO').AsString;
    //sAgencia:=qryRecebedor.FieldByName('NUMAGENCIA').AsString;
    sBanco:= cdsRecebedor.FieldByName('NUMBANCO').AsString;
    sAgencia:= cdsRecebedor.FieldByName('NUMAGENCIA').AsString;
   //Cássio Rovaroto - SIG nº 78153 - Fim

    while length(sAgencia) < 5 do
      sAgencia:=sAgencia+'&';
    //Cássio Rovaroto - SIG nº 78153 - Início
    //sContaCorrente:=qryRecebedor.FieldByName('CONTACORRENTE').AsString;
    sContaCorrente:= cdsRecebedor.FieldByName('CONTACORRENTE').AsString;
   //Cássio Rovaroto - SIG nº 78153 - Fim

    if (trim(sBanco) = '') then
    begin
      mmResult.lines.add('Banco nulo '+
                         '/ IdRecebedor:'+
    //Cássio Rovaroto - SIG nº 78153 - Início
    //                     qryRecebedor.fieldbyname('IDRESPONSAVEL').asstring+
                         cdsRecebedor.FieldByName('IDRESPONSAVEL').AsString +
    //Cássio Rovaroto - SIG nº 78153 - Fim
                         ' (linha ignorada).');
      exit;
    end;

    if (trim(sAgencia) = '') then
    begin
      mmResult.lines.add('Agência nula '+
                         '/ IdRecebedor:'+
      //Cássio Rovaroto - SIG nº 78153 - Início
      //                   qryRecebedor.fieldbyname('IDRESPONSAVEL').asstring+
                         cdsRecebedor.FieldByName('IDRESPONSAVEL').AsString +
      //Cássio Rovaroto - SIG nº 78153 - Fim
                         ' (linha ignorada).');
      exit;
    end;

    //CONSIDERA A CONTA CORRENTE IGUAL A ZERO NO CASO DE OP/RECIDO
    if (cdsPortador.fieldbyname('TIPOCONTA').asstring <> '4') then
    begin
      if (trim(sContaCorrente) = '') then
      begin
        mmResult.lines.add('Conta corrente nula '+
                           '/ IdRecebedor:'+
      //Cássio Rovaroto - SIG nº 78153 - Início
        //                   qryRecebedor.fieldbyname('IDRESPONSAVEL').asstring+
                           cdsRecebedor.FieldByName('IDRESPONSAVEL').AsString +
      //Cássio Rovaroto - SIG nº 78153 - Fim
                           ' (linha ignorada).');
        exit;
      end;
    end;

    try
      inc(iseqdoctxt);
      cdsDocTxt.Insert;
      //Cássio Rovaroto - SIG nº 78153 - Início
      {cdsDocTxt.FieldByName('CONTALIQUIDO').AsString:='';
      cdsDocTxt.FieldByName('IDPESSOA').AsInteger:=
        qryRecebedor.fieldbyname('IDRESPONSAVEL').asinteger;
      if trim(sNomeRecebedor) <> '' then
        cdsDocTxt.FieldByName('NOME').AsString:=sNomeRecebedor;
      if trim(sNomeRecebedor) <> '' then
        cdsDocTxt.FieldByName('RAZAOSOCIAL').AsString:=sNomeRecebedor;
      if trim(sNumdocumento) <> '' then
        cdsDocTxt.FieldByName('NUMDOCUMENTO').AsString:=sNumdocumento;
      if trim(sContaCorrente) <> '' then
        cdsDocTxt.FieldByName('CONTACORRENTE').AsString:=sContaCorrente;
      if trim(sBanco) <> '' then
        cdsDocTxt.FieldByName('CODBANCOFAVORECIDO').AsString:=sBanco;
      if trim(sAgencia) <> '' then
        cdsDocTxt.FieldByName('NUMAGENCIA').AsString:=sAgencia;
      cdsDocTxt.FieldByName('IDFORCLI').AsInteger:=
        qryRecebedor.fieldbyname('IDRESPONSAVEL').asinteger;
      if trim(sTipoConta) <> '' then
        cdsDocTxt.FieldByname('TIPOCONTA').AsString:=sTipoConta;
      if trim(sNomeAgencia) <> '' then
        cdsDocTxt.FieldByName('NOMEAGENCIA').AsString:=sNomeAgencia;
      if trim(sLOGRADOURO) <> '' then
        cdsDocTxt.FieldByName('LOGRADOURO').AsString:=sLOGRADOURO;
      if trim(sNUMERO) <> '' then
        cdsDocTxt.FieldByName('NUMERO').AsString:=sNUMERO;
      if trim(sCOMPLEMENTO) <> '' then
        cdsDocTxt.FieldByName('COMPLEMENTO').AsString:=sCOMPLEMENTO;
      if trim(sBAIRRO) <> '' then
        cdsDocTxt.FieldByName('BAIRRO').AsString:=sBAIRRO;
      if trim(sCIDADE) <> '' then
        cdsDocTxt.FieldByName('CIDADE').AsString:=sCIDADE;
      if trim(sCODESTADO) <> '' then
        cdsDocTxt.FieldByName('CODESTADO').AsString:=sCODESTADO;
      if trim(sCEP) <> '' then
        cdsDocTxt.FieldByName('CEP').AsString:=sCEP;
      sMatricula:=qryRecebedor.fieldbyname('MATRICULA').asstring;
      if sMatricula = '' then
      begin
        if FazQuery(qryAux, 'SELECT MATRICULA FROM ELEGPATRO WHERE IDPESSOA = '+
                    qryRecebedor.fieldbyname('IDTITULAR').asstring) then
          sMatricula:=qryAux.fieldbyname('MATRICULA').asstring;
      end;
      cdsDocTxt.FieldByName('CODDOCUMENTO').asstring:=sMatricula; // Identificador para retorno.
      cdsDocTxt.FieldByName('VALOR').AsFloat:=
        qryRecebedor.fieldbyname('VALORPROVENTO').asfloat;
      cdsDocTxt.FieldByName('VALORDESCONTO').AsFloat:= 0;
      cdsDocTxt.FieldByName('VALORJUROS').AsFloat:= 0;
      cdsDocTxt.FieldByName('DATAVENCTO').AsString:=edDataFolha.Text;
      cdsDocTxt.FieldByName('DATAPROGRAMADA').AsString:=edDataFolha.Text;
      cdsDocTxt.FieldByName('TIPOMOEDA').AsInteger:= 0;
      cdsDocTxt.FieldByName('NUMLOTE').AsInteger:= 0;
      cdsDocTxt.FieldByName('CODPORTFORMA').AsInteger:=
        cdsPortador.fieldbyname('CODPORTFORMA').asinteger;
      cdsDocTxt.FieldByName('CODPORTADOR').AsInteger:=
        cdsPortador.fieldbyname('CODPORTFORMA').asinteger;
      cdsDocTxt.FieldByName('CODFORMAPAGTO').AsInteger:=
        qryPortadorForma.FieldByName('CODFORMAPAGTO').AsInteger;
      cdsDocTxt.FieldByName('CODTIPOPAGTO').AsInteger:=
        qryPortadorForma.FieldByName('CODTIPOPAGTO').AsInteger;
      cdsDocTxt.FieldByName('FLGEMITEAVISO').AsString:=
        qryPortadorForma.FieldByName('FLGEMITEAVISO').AsString;
      cdsDocTxt.FieldByName('CODARQUIVOREMESSA').AsInteger:=
        qryPortadorForma.FieldByName('CODARQUIVOREMESSA').AsInteger;
      cdsDocTxt.FieldByName('IDBANCO').AsInteger:=
        qryPortadorForma.FieldByName('IDBANCO').AsInteger;  //Portador Forma
      cdsDocTxt.FieldByName('NOCONTACORR').AsString:=
        qryPortadorForma.FieldByName('NOCONTACORR').AsString;
      cdsDocTxt.FieldByName('DMAISALT').asinteger:=
        qryPortadorForma.FieldByName('DMAISALT').asinteger;
      cdsDocTxt.FieldByName('CODFORMAPGTOALT').asinteger:=
        qryPortadorForma.FieldByName('CODFORMAPGTOALT').asinteger;
      cdsDocTxt.FieldByName('VALORMAXIMO').asfloat:=
        qryPortadorForma.FieldByName('VALORMAXIMO').asfloat;
      cdsDocTxt.FieldByName('CODBARRA').AsString:='';
      cdsDocTxt.FieldByName('CODBARRAVALOR').AsString:='';
      cdsDocTxt.FieldByName('NODOCUMENTO').asstring:=
                    qryRecebedor.fieldbyname('IDTITULAR').asstring+'-'+
                    qryRecebedor.fieldbyname('IDRESPONSAVEL').asstring+'-';
      cdsDocTxt.FieldByName('COMPLDOCUMENTO').AsString:=
        Copy(sMesReferencia,6,2);  // Codigo que aparece no relatorio
      cdsDocTxt.FieldByName('TIPO').AsString:='F';
      cdsDocTxt.FieldByName('NUMEMPRESABANCO').AsString:=
        qryPortadorForma.FieldByName('NUMEMPRESABANCO').AsString;
      cdsDocTxt.FieldByName('DEBCRE').AsString:='';
      cdsDocTxt.FieldByName('LIVRE').AsString:=
        copy(inttostr(qryRecebedor.fieldbyname('IDRESPONSAVEL').asinteger)+
             inttostr(iseqdoctxt),1,25);
      cdsDocTxt.Post;
      inc(iNumRegistro);
    except
      mmResult.lines.add('Problema na geração da informação de pagamento do recebedor '+
                         qryRecebedor.fieldbyname('IDRESPONSAVEL').asstring+
                         ' (linha ignorada).')
    end;}
      cdsDocTxt.FieldByName('CONTALIQUIDO').AsString:= '';
      cdsDocTxt.FieldByName('IDPESSOA').AsInteger:= cdsRecebedor.fieldbyname('IDRESPONSAVEL').asinteger;
      if Trim(sNomeRecebedor) <> '' then
       cdsDocTxt.FieldByName('NOME').AsString:= sNomeRecebedor;

      if Trim(sNomeRecebedor) <> '' then
        cdsDocTxt.FieldByName('RAZAOSOCIAL').AsString:= sNomeRecebedor;

      if Trim(sNumdocumento) <> '' then
        cdsDocTxt.FieldByName('NUMDOCUMENTO').AsString:= sNumdocumento;

      if Trim(sContaCorrente) <> '' then
        cdsDocTxt.FieldByName('CONTACORRENTE').AsString:= sContaCorrente;

      if Trim(sBanco) <> '' then
        cdsDocTxt.FieldByName('CODBANCOFAVORECIDO').AsString:= sBanco;

      if Trim(sAgencia) <> '' then
        cdsDocTxt.FieldByName('NUMAGENCIA').AsString:= sAgencia;

      cdsDocTxt.FieldByName('IDFORCLI').AsInteger:= cdsRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;

      if Trim(sTipoConta) <> '' then
        cdsDocTxt.FieldByname('TIPOCONTA').AsString:= sTipoConta;

      if Trim(sNomeAgencia) <> '' then
        cdsDocTxt.FieldByName('NOMEAGENCIA').AsString:= sNomeAgencia;

      if Trim(sLOGRADOURO) <> '' then
        cdsDocTxt.FieldByName('LOGRADOURO').AsString:= sLOGRADOURO;

      if Trim(sNUMERO) <> '' then
        cdsDocTxt.FieldByName('NUMERO').AsString:= sNUMERO;

      if Trim(sCOMPLEMENTO) <> '' then
        cdsDocTxt.FieldByName('COMPLEMENTO').AsString:= sCOMPLEMENTO;

      if Trim(sBAIRRO) <> '' then
        cdsDocTxt.FieldByName('BAIRRO').AsString:= sBAIRRO;

      if Trim(sCIDADE) <> '' then
        cdsDocTxt.FieldByName('CIDADE').AsString:= sCIDADE;

      if Trim(sCODESTADO) <> '' then
        cdsDocTxt.FieldByName('CODESTADO').AsString:= sCODESTADO;

      if Trim(sCEP) <> '' then
        cdsDocTxt.FieldByName('CEP').AsString:= sCEP;

      sMatricula:= cdsRecebedor.FieldByName('MATRICULA').AsString;

      if sMatricula = '' then
      begin
        cdsAux.Data := fCtrlConjuntoRubricas.GetDataPacket('SELECT MATRICULA FROM ELEGPATRO WHERE IDPESSOA = '+ cdsRecebedor.FieldByName('IDTITULAR').AsString);
        sMatricula:= cdsAux.FieldByName('MATRICULA').AsString;
      end;

      cdsDocTxt.FieldByName('CODDOCUMENTO').AsString:= sMatricula;
      cdsDocTxt.FieldByName('VALOR').AsFloat:= cdsRecebedor.FieldByName('VALORPROVENTO').AsFloat;
      cdsDocTxt.FieldByName('VALORDESCONTO').AsFloat:= 0;
      cdsDocTxt.FieldByName('VALORJUROS').AsFloat:= 0;
      cdsDocTxt.FieldByName('DATAVENCTO').AsString:= edDataFolha.Text;
      cdsDocTxt.FieldByName('DATAPROGRAMADA').AsString:= edDataFolha.Text;
      cdsDocTxt.FieldByName('TIPOMOEDA').AsInteger:= 0;
      cdsDocTxt.FieldByName('NUMLOTE').AsInteger:= 0;
      cdsDocTxt.FieldByName('CODPORTFORMA').AsInteger:= cdsPortador.fieldbyname('CODPORTFORMA').asinteger;
      cdsDocTxt.FieldByName('CODPORTADOR').AsInteger:= cdsPortador.fieldbyname('CODPORTFORMA').asinteger;
      cdsDocTxt.FieldByName('CODFORMAPAGTO').AsInteger:= qryPortadorForma.FieldByName('CODFORMAPAGTO').AsInteger;
      cdsDocTxt.FieldByName('CODTIPOPAGTO').AsInteger:= qryPortadorForma.FieldByName('CODTIPOPAGTO').AsInteger;
      cdsDocTxt.FieldByName('FLGEMITEAVISO').AsString:= qryPortadorForma.FieldByName('FLGEMITEAVISO').AsString;
      cdsDocTxt.FieldByName('CODARQUIVOREMESSA').AsInteger:= qryPortadorForma.FieldByName('CODARQUIVOREMESSA').AsInteger;
      cdsDocTxt.FieldByName('IDBANCO').AsInteger:= qryPortadorForma.FieldByName('IDBANCO').AsInteger;
      cdsDocTxt.FieldByName('NOCONTACORR').AsString:= qryPortadorForma.FieldByName('NOCONTACORR').AsString;
      cdsDocTxt.FieldByName('DMAISALT').AsInteger:= qryPortadorForma.FieldByName('DMAISALT').AsInteger;
      cdsDocTxt.FieldByName('CODFORMAPGTOALT').AsInteger:= qryPortadorForma.FieldByName('CODFORMAPGTOALT').AsInteger;
      cdsDocTxt.FieldByName('VALORMAXIMO').AsFloat:= qryPortadorForma.FieldByName('VALORMAXIMO').AsFloat;
      cdsDocTxt.FieldByName('CODBARRA').AsString:= '';
      cdsDocTxt.FieldByName('CODBARRAVALOR').AsString:= '';
      cdsDocTxt.FieldByName('NODOCUMENTO').AsString:= cdsRecebedor.FieldByName('IDTITULAR').AsString + '-' +
                                                      cdsRecebedor.FieldByName('IDRESPONSAVEL').AsString + '-';
      cdsDocTxt.FieldByName('COMPLDOCUMENTO').AsString:= Copy(sMesReferencia,6,2);
      cdsDocTxt.FieldByName('TIPO').AsString:= 'F';
     cdsDocTxt.FieldByName('NUMEMPRESABANCO').AsString:= qryPortadorForma.FieldByName('NUMEMPRESABANCO').AsString;
     cdsDocTxt.FieldByName('DEBCRE').AsString:= '';
      cdsDocTxt.FieldByName('LIVRE').AsString:= copy(IntToStr(cdsRecebedor.fieldbyname('IDRESPONSAVEL').asinteger)+ IntToStr(iseqdoctxt),1,25);
      cdsDocTxt.Post;
      Inc(iNumRegistro);
    except
      mmResult.lines.add('Problema na geração da informação de pagamento do recebedor '+
                         cdsRecebedor.FieldByName('IDRESPONSAVEL').AsString +
                         ' (linha ignorada).')
    end;
  finally
    FreeAndNil(cdsAux);
  end;
  //Cássio Rovaroto - SIG nº 78153 - Fim
end;

procedure TfrmGeraArquivoRemessaPrevia.bbtnProcessarClick(Sender: TObject);
 var sNomeArqOri, sNomeExtOri, sNome, sPathArquivoRem : string;
     t: textfile;
     iCodArquivoRemessa, iControleRemessa : integer;
     ddatafloat : tdatetime;
     lii : integer;
     iContArq: Integer;
     ssql: string;
     sHeader: string;
     iControleSIACC, iLinhaSIACC, iControleSICOV: Integer;
begin
  IdMotivoAnt := 0;
  iControleSIACC := 0;
  iControleSICOV := 0;
  iLinhaSIACC := 0;
  ObtemLotes;
  if (sLotesSel = '') then
  begin
    MsgDlg('Selecione pelo menos um Lote de Pagamento da Folha',
      'Erro', mtError, [mbOk,mbHelp], 0);
    pgcComponentes.activepage:=tbsOpcoes;
    dbgPrevia.SetFocus;
    Exit;
  end;

  ObtemPortador;
  if (sPortadorSel = '') then
  begin
    MsgDlg('Preencha o(s) Contas Caixa x Forma de Pagamento desejados',
      'Erro', mtError, [mbOk,mbHelp], 0);
    pgcComponentes.activepage:=tbsOpcoes;
    dbgPortadorForma.SetFocus;
    Exit;
  end;

  if (Trim(edDataFolha.Text) = '') then
  begin
    MsgDlg('Preencha a Data de previsão de pagamento','Erro',mtError,[mbOk,mbHelp],0);
    pgcComponentes.activepage:=tbsOpcoes;
    edDataFolha.SetFocus;
    Exit;
  end;

  if (Trim(lblDiretorio.caption) = '') then
  begin
    MsgDlg('Indique o diretório para a gravação do arquivo.','Erro',mtError,[mbOk,mbHelp],0);
    pgcComponentes.ActivePage:= tbsOpcoes;
    btnEscolheDirClick(sender);
    Exit;
  end;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Simulação de geração de arquivo bancário.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  If not dtmBaseDados.dbBaseDados.InTransaction Then
    dtmBaseDados.dbBaseDados.StartTransaction;

  pgcComponentes.activepage:=tbsResultado;
  lbProcessando.visible:=true;
  pBarProcesso.visible:=true;
  bbtnProcessar.enabled:=false;
  bbtnSair.enabled:=false;

  mmResult.Lines.Add('---------------------------------------------------------------------');
  mmResult.Lines.Add('Simulação de Arquivos de Pagamento da Prévia ');
  mmResult.Lines.Add('Lotes de Prévia : ');
  cdsLote.disablecontrols;
  cdsLote.first;
  while not cdsLote.eof do
  begin
    if (cdsLote.fieldbyname('SEL').asinteger = 1) then
    begin
      mmResult.Lines.Add(' ' + IntToStr(cdsLote.FieldByName('idlote').AsInteger) + ' - ' +
        cdsLote.fieldbyname('descricao').AsString);
    end;
    cdsLote.next;
  end;
  cdsLote.EnableControls;

  cdsPortador.DisableControls;
  cdsPortador.First;

  
  while not cdsPortador.eof do
  begin
    if (cdsPortador.FieldByName('SEL').AsInteger = 1) then
    begin
      //try
        try
          iNumRegistro:=0;
          pBarProcesso.Position:=pBarProcesso.Min;
          self.update;

          mmResult.SetFocus;

          if (cdsPortador.FieldByName('FLGARQUIVO').AsString = 'S') and (iControleSIACC = 0) then
          begin
            if iControleSICOV <> 0 then
            begin
              mmResult.Lines.Add('Término da geração: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
              //mmResult.Lines.Add('---------------------------------------------------------------------');
              //mmResult.Lines.Add('');
            end;
            
            //André Imakawa - SIG nº 60540 - Inicio
            mmResult.Lines.Add('---------------------------------------------------------------------');
            mmResult.Lines.Add('Início do carregamento das informações para geração do arquivo SIACC: '+
                      FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
            //André Imakawa - SIG nº 60540 - Fim
          end
          else
            if (cdsPortador.FieldByName('FLGARQUIVO').AsString = 'N') and (iControleSICOV = 0) then
            begin
              //André Imakawa - SIG nº 60540 - Inicio
              mmResult.Lines.Add('---------------------------------------------------------------------');
              mmResult.Lines.Add('Início da geração de arquivo de simulação de pagamento: '+
                        FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
              //André Imakawa - SIG nº 60540 - Fim
            end;

          mmResult.Lines.Add('  Contas Caixa x Forma de Pagamento : '+
            cdsPortador.FieldByName('DESCRICAO').AsString);

          if not SistemaFolha.FlgAgrupaArqDocAlt then
            mmResult.Lines.Add('  Sequência : '+
              cdsPortador.fieldbyname('SEQDOCUMENTO').asstring);
          application.processmessages;

          //cdsDocTxt.Close;
          //if not cdsDocTxt.Active then
          //  cdsDocTxt.Open;

          qryPortadorForma.Locate('CODPORTFORMA',
            cdsPortador.fieldbyname('CODPORTFORMA').asinteger,[]);
          iCodArquivoRemessa:=
            qryPortadorForma.FieldByName('CodArquivoRemessa').AsInteger;
          iControleRemessa:=
            qryPortadorForma.FieldByName('ControleRemessa').AsInteger;

          qryRecebedor.close;
          ssql:=
            //Cássio Rovaroto - SIG nº 60450 - Início
            'SELECT IDPESSJUR, IDTITULAR, IDRESPONSAVEL, '+_clinefeed+
            '       LTRIM(NOME) AS NOME, NUMDOCUMENTO, NUMBANCO,  NVL(TIPOCONTA,2) AS TIPOCONTA, MATRICULA,  '+_clinefeed+
            '       SUM(VALORPROVENTO) AS VALORPROVENTO, '+_clinefeed ;

            // Andre Imakawa - SIG 101541 - Inicio
            if (cdsPortador.FieldByName('FLGARQUIVO').AsString = 'N') then
              ssql:=ssql+ '       NUMAGENCIA, CONTACORRENTE  '+_clinefeed
            else
              ssql:=ssql+ '       LPAD(REGEXP_REPLACE(SUBSTR(NUMAGENCIA,1, LENGTH(NUMAGENCIA) -1), ''[^[:digit:]]''), 5, ''0'') ||        ' + #13#10 +
                          '       RPAD(SUBSTR(NUMAGENCIA,LENGTH(NUMAGENCIA), 1), 1, '' '') AS NUMAGENCIA,                                 ' + #13#10 +
                          '       LPAD(REGEXP_REPLACE(SUBSTR(CONTACORRENTE,1, LENGTH(CONTACORRENTE) -1), ''[^[:digit:]]''), 12, ''0'') || ' + #13#10 +
                          '       RPAD(SUBSTR(CONTACORRENTE,LENGTH(CONTACORRENTE), 1), 1, '' '') CONTACORRENTE                            ' + #13#10;
            // Andre Imakawa - SIG 101541 - Fim
            
            ssql:=ssql+
            '  FROM ( '+_clinefeed+
            //Cássio Rovaroto - SIG nº 60450 - Fim
            'SELECT G.IDPESSJUR, G.IDTITULAR, G.IDRESPONSAVEL, G.TIPOCONTA, '+_clinefeed+
            '       G.NOME, G.NUMDOCUMENTO, G.NUMBANCO, G.NUMAGENCIA, G.MATRICULA, '+_clinefeed+
            '       REPLACE(REPLACE(G.CONTACORRENTE, ''-'', ''''), ''.'', '''') AS CONTACORRENTE, G.VALORPROVENTO '+_clinefeed+ //Cássio Rovaroto - SIG nº 60450
            'FROM ( '+_clinefeed+
//            'SELECT /*+INDEX(HS XIE6PREVIA)*/' +_clinefeed+                    //Everson TIBERO
            'SELECT                                               ' +_clinefeed+ //Everson TIBERO
            '       HS.IDPESSJUR, HS.IDTITULAR, HS.IDRESPONSAVEL, '+_clinefeed+
            '       P.NOME, P.NUMDOCUMENTO, HS.TIPOCONTA, '+_clinefeed+
            '       hs.NUMBANCO, hs.NUMAGENCIA, hs.CONTACORRENTE, D.MATRICULA, '+_clinefeed+ //BRUNO AZEVEDO SOL 141937 KINTANA 901258
            '       SUM(DECODE(PR.FLGDESCONTO,0, '+_clinefeed+
            '         DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO,0), '+_clinefeed+
            '         DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO*-1,0))) VALORPROVENTO '+_clinefeed+
            //'        , PF.IDPLANOPREV '+_clinefeed+ //Cássio Rovaroto - SIG nº 60450
            'FROM PREVIA HS, PROVDESC PR, PESSOA P, DEPENTIT D '+_clinefeed+
            'WHERE (HS.IDLOTE '+sclaulotes+') '+_clinefeed+
            'AND (HS.CODPORTFORMA = '+
              inttostr(cdsPortador.fieldbyname('CODPORTFORMA').asinteger)+') '+_clinefeed;

          if not SistemaFolha.FlgAgrupaArqDocAlt then
            ssql:=ssql+
              'AND (HS.SEQDOCUMENTO = '+
                inttostr(cdsPortador.fieldbyname('SEQDOCUMENTO').asinteger)+') '+_clinefeed;

          ssql:=ssql+
            'AND (PR.IDPROVENTO = HS.IDRUBRICA) '+_clinefeed+
            'AND (PR.FLGESPECIAL = 0) '+_clinefeed+
            'AND (HS.IDTITULAR = D.IDTITULAR(+)) '+_clinefeed+
            'AND (HS.IDRESPONSAVEL = D.IDPESSOA(+)) '+_clinefeed+
            'AND (HS.IDRESPONSAVEL = P.IDPESSOA) '+_clinefeed;
            //'AND (HS.IDRESPONSAVEL = CB.IDPESSOA) '+_clinefeed;

          if (edMatricula.text <> '') then
            ssql:=ssql+'AND (HS.IDRESPONSAVEL = '+inttostr(iidRecebedor)+')'+_clinefeed;

          ssql:=ssql+
            //BRUNO AZEVEDO SOL 141937 KINTANA 901258
            //'AND (CB.FLGCONTAPREF = 1) '+_clinefeed+
            //'AND ((hs.flgpensaoalim = 2 AND cb.flgcontapref = 1) OR CB.Tipoconta = 2)'+_clinefeed+
            //'AND (CB.IDAGENCIA = AG.IDPESSOA) '+_clinefeed+
            //'AND (AG.IDBANCO = BB.IDPESSOA) '+_clinefeed+
            'GROUP BY HS.IDPESSJUR, HS.IDTITULAR, P.NOME, '+_clinefeed+
            '         D.MATRICULA, HS.IDRESPONSAVEL, '+_clinefeed+
            '         HS.NUMBANCO, HS.NUMAGENCIA, HS.CONTACORRENTE, P.NUMDOCUMENTO, HS.TIPOCONTA '+_clinefeed+
            ') G '+_clinefeed+
            'WHERE G.VALORPROVENTO >= 0.01 '+_clinefeed+
            //Cássio Rovaroto - SIG nº 60450 - Início
            ')   '+_clinefeed+
            'GROUP BY IDPESSJUR, IDTITULAR, IDRESPONSAVEL, TIPOCONTA, '+_clinefeed+
            '         NOME, NUMDOCUMENTO, NUMBANCO, NUMAGENCIA, CONTACORRENTE, MATRICULA '+_clinefeed+//, MATRICULA, '+_clinefeed+
            'ORDER BY IDRESPONSAVEL, NOME, IDPESSJUR, IDTITULAR ';
            //Cássio Rovaroto - SIG nº 60450 - Fim
          //Cássio Rovaroto - SIG nº 78153 - Início
          //qryRecebedor.sql.clear;
          //qryRecebedor.sql.add(ssql);
          //qryRecebedor.open;
          cdsRecebedor.Data := fCtrlConjuntoRubricas.GetDataPacket(ssql);

          //pBarProcesso.Max:=qryRecebedor.recordcount;
          pBarProcesso.Max:= cdsRecebedor.RecordCount;
          iseqdoctxt:=0;



          iLinhaSIACC := 0;
          //while not qryRecebedor.eof do
          while not cdsRecebedor.Eof do
          begin
            if pBarProcesso.Position mod 100 = 0 then
              application.processmessages;
            //Cássio Rovaroto - SIG nº 60450 - Início
            if cdsPortador.FieldByName('FLGARQUIVO').AsString = 'N' then
            begin
              if iControleSICOV = 0 then
              begin
                cdsDocTxt.Close;
                AbrirQueryDocTxtLeiaute150;
                if not cdsDocTxt.Active then
                  cdsDocTxt.Open;
              end;
              Inc(iControleSICOV);
              AlimentaQryDocTxt;
            end
            else
            begin
              Inc(iLinhaSIACC);
              if iControleSIACC = 0 then
              begin
                Inc(iControleSIACC);
                cdsDocTxt.Close;
                AbrirQueryDocTxtLeiaute240;
                if not cdsDocTxt.Active then
                  cdsDocTxt.Open;
              end;

              AlimentaQryDocTxtLeiaute240(iLinhaSIACC);
            end;


            //Cássio Rovaroto - SIG nº 60450 - Fim
          //  qryRecebedor.next;
            cdsRecebedor.Next;
            pBarProcesso.Position:=pBarProcesso.Position+1;
          end;

          //Cássio Rovaroto - SIG nº 60540 - Início
          if cdsPortador.FieldByName('FLGARQUIVO').AsString = 'N' then
          begin
            fCtrlIntBanco:=TCtrlIntBanco.Create;
            fCtrlIntBanco.Initialize(DtmBaseDados.DbBaseDados, True,
              Sistema.ConnectionType, Sistema.ConnectionSide,
              Sistema.AppRemoteServer, True, MsgErro );

            fCtrlIntBanco.FechaQryTexto:=true;

            sPathArquivoRem:=lblDiretorio.caption;

            cdsDocTxt.First;

            fCtrlIntBanco.IndiceDoBanco:=iCodArquivoRemessa;
            if fCtrlIntBanco.VerficaDadosEmpresa('P',
                 cdsPortador.FieldByName('CodPortForma').AsInteger) then
              if fCtrlIntBanco.ValidaRemessa('P',cdsDocTxt.data,false) then
              begin
                FrmAguarde.Apaga;
                fCtrlIntBanco.ExibeArquivoGerado:=false;

                ddatafloat:=strtodate(edDataFolha.Text);

                fCtrlIntBanco.iFloatExterno    := cdsPortador.FieldByName('DFLOATPAGTO').AsInteger;
                fCtrlIntBanco.iFloatExternoAlt := cdsPortador.FieldByName('DFLOATPAGTOALTER').AsInteger;

                fCtrlIntBanco.IdentficaOrigem:='18';
                fCtrlIntBanco.MontaPagamentoEletronico(iCodArquivoRemessa,
                  iControleRemessa, cdsDocTxt.data, sPathArquivoRem);
                try
                  sNomeArqOri:=fCtrlIntBanco.NomeArquivoGerado;
                  assignfile(t, sNomeArqOri);

                  iContArq := 0;
                  sNomeExtOri:=ExtractFileExt(sNomeArqOri);
                  sNomeArqOri:=ExtractFileName(sNomeArqOri);
                  delete(sNomeArqOri, length(sNomeArqOri)-3, 4);
                  sNome:=IncludeTrailingBackslash(sPathArquivoRem)+'Previa_Lote_'+
                    copy(sMesReferencia,1,4)+
                    copy(sMesReferencia,6,2)+'_'+
                    MascaraAlfa(cdsPortador.fieldbyname('DESCRICAO').asstring)+'_'+
                         cdsPortador.fieldbyname('SEQDOCUMENTO').asstring+'_'+
                         sNomeArqOri+'_'+Chr(65+iContArq)+sNomeExtOri;
                  while FileExists(sNome) do
                  begin
                    Inc(iContArq);
                    sNome:=sPathArquivoRem+'Previa_Lote_'+
                      copy(sMesReferencia,1,4)+
                      copy(sMesReferencia,6,2)+'_'+
                      cdsPortador.fieldbyname('DESCRICAO').asstring+'_'+
                      cdsPortador.fieldbyname('SEQDOCUMENTO').asstring+'_'+
                      sNomeArqOri+'_'+Chr(65+iContArq)+sNomeExtOri;
                  end;
                  rename(t, sNome);
                except
                  mmResult.Lines.Add('Erro ao renomear o arquivo de remessa gerado.');
                  mmResult.Lines.Add('');
                end;
              end
              else
              begin
                mmResult.Lines.Add('Erro na geração do arquivo de remessa.');
                mmResult.Lines.Add('');
              end;
              //Cássio Rovaroto - SIG nº 60540 - Fim
          end;

          FrmAguarde.Apaga;
        except
          On E:Exception Do
          Begin
            MsgDlg('Erro no carregamento das informações do Arquivo de Remessa de Pagamento',
                   'Erro',mtError,[mbOk,mbHelp],0);
            mmResult.Lines.Add('Erro: ' + E.Message);

            cdsPortador.EnableControls;
            if dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.Rollback;

            Exit;
          end;
        end;
      //finally
      //  mmResult.Lines.Add('Término da geração: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
      //  mmResult.Lines.Add('Arquivos de resumo e esboço de remessa armazendos no diretório selecionado.')
      //  mmResult.Lines.Add('---------------------------------------------------------------------');
      //  mmResult.Lines.Add('');
      //end;
    end;
    cdsPortador.next;
  end;

  if (iControleSIACC <> 0) then
  begin
    //André Imakawa - SIG nº 60540 - Inicio
    mmResult.Lines.Add('Término do carregamento das informações para geração do arquivo de SIACC. '+
              FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    mmResult.Lines.Add('---------------------------------------------------------------------');
    mmResult.Lines.Add('');
    //André Imakawa - SIG nº 60540 - Fim
  end
  else
  begin
    mmResult.Lines.Add('Término da geração: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    mmResult.Lines.Add('---------------------------------------------------------------------');
    mmResult.Lines.Add('');
  end;

  if not MontaArquivoCNAB240 then
  begin
    mmResult.Lines.Add('---------------------------------------------------------------------');
    mmResult.Lines.Add('');
    mmResult.Lines.Add('Erro no processo de geração do Arquivo de Remessa de Pagamento.');
    mmResult.Lines.Add('Não há parametrização definida para as Formas de Pagamento selecionadas.');
    mmResult.Lines.Add('---------------------------------------------------------------------');
    mmResult.Lines.Add('');

    bbtnSair.Enabled:= True;
    lbProcessando.Visible:= False;
    pBarProcesso.Visible:= False;
    bbtnOutro.Visible:= True;
    bbtnProcessar.Enabled:= True;
    bbtnProcessar.Visible:= False;

    cdsPortador.EnableControls;
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

    Exit;                               
  end;



  if (iControleSIACC <> 0) then
  begin
    cdsDocTxt.Filtered := False;
    cdsDocTxt.Filter := '';
    cdsDocTxt.First;
    sHeader :=  'IDPESSOA;NUM_BANCO;COD_REG;SEG;TIP_MOV;COD_INST;COD_BAN_D;COD_AGE_D;DV_AGE_D;CC_D;DV_CC_D;DV_AGE_CC_D;NOME;' +
              'NUM_DOC;FILLER;TP_CONT;DT_VENC;TP_MOE;VALOR;NUM_DOC_BAN;QTD_PAR;IND_BLOQ;IND_FORMA_PAR;PER_VENC;NUM_PAR;'+
              'DT_EFET;VLR_REAL;INF;USO_FEBRABAN;EMITE_AVISO;OCORRENCIAS;TIP_INSCR;NUM_IDENT;LOGRADOURO;NUMERO;COMPL;BAIRRO;'+
              'CIDADE;CEP;COMPL_CEP;UF;VL_DOC;VL_ABAT;VL_DESC;VL_MORA;VL_MULTA;CODPORTFORMA;FORMALANC';
    SaveToCSV(cdsDocTxt, lblDiretorio.Caption + '\ResumoArquivo.csv', sHeader);
    
    mmResult.Lines.Add('---------------------------------------------------------------------');
    mmResult.Lines.Add('Geração de resumo do Arquivo de Pagamento da Prévia: '+FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    mmResult.Lines.Add('Diretório de armazenamento: ' + lblDiretorio.Caption);
    mmResult.Lines.Add('---------------------------------------------------------------------');
    mmResult.Lines.Add('');
  end;


  cdsPortador.EnableControls;
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;

  fCtrlIntBanco.Free;
  bbtnSair.enabled:=true;
  lbProcessando.visible:=false;
  pBarProcesso.visible:=false;
  bbtnOutro.visible:=true;
  bbtnProcessar.enabled:=true;
  bbtnProcessar.visible:=false;
//  bbtnEnviarArquivo.Visible := True;
end;

procedure TfrmGeraArquivoRemessaPrevia.bbtnOutroClick(Sender: TObject);
begin
  bbtnProcessar.visible:=true;
  bbtnOutro.visible:=false;
  pgcComponentes.activepage:=tbsOpcoes;
  //if not cdsDocTxt.EmptyDataSet then
  //begin
    cdsDocTxt.Filtered := False;
    cdsDocTxt.Filter := '';
  //end;
end;

procedure TfrmGeraArquivoRemessaPrevia.spbRecebedorClick(Sender: TObject);
begin
  inherited;
  ObtemLotes;
  ObtemPortador;

  if (sLotesSel = '') or (sPortadorSel = '') Then
    exit;

  msAssistido.filtro.clear;
  msAssistido.filtro.add('PREVIA.IDLOTE '+sclaulotes);
  msAssistido.filtro.add('PREVIA.CODPORTFORMA '+sclauportador);
  msAssistido.filtro.add('PREVIA.IDTITULAR = ELEGPATRO.IDPESSOA');
  msAssistido.filtro.add('PREVIA.IDTITULAR = ELEGPATRO.IDPESSOA');
  msAssistido.filtro.add('ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA');
  msAssistido.filtro.add('ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA');
  msAssistido.filtro.add('ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR');
  msAssistido.Executar;
  if msAssistido.RetornouValor Then
  Begin
    iidRecebedor:=StrtoInt(msAssistido.ValoresChave[0]);
    edMatricula.Text:=msAssistido.ValoresChave[1];
    edNome.Text:=msAssistido.ValoresChave[2];
  end;
end;

procedure TfrmGeraArquivoRemessaPrevia.btnEscolheDirClick(Sender: TObject);
begin
  inherited;
  pdirdlgPasta.Directory:=lblDiretorio.caption;
  if pdirdlgPasta.Execute then
    lblDiretorio.caption:=pdirdlgPasta.Directory;
end;

procedure TfrmGeraArquivoRemessaPrevia.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmGeraArquivoRemessaPrevia.CorParaColunaSelecao(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  if Field.fieldname = 'SEL' then
    Abrush.color:=$00BDF9F8
end;

function TfrmGeraArquivoRemessaPrevia.GetDadosRec(
  pIdResponsavel: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL :=  'SELECT E.LOGRADOURO,                                          ' +#13#10+
           '       E.NUMERO,                                              ' +#13#10+
           '       E.COMPLEMENTO,                                         ' +#13#10+
           '       E.BAIRRO,                                              ' +#13#10+
           '       C.NOME AS CIDADE,                                      ' +#13#10+
           '       S.CODESTADO,                                           ' +#13#10+
           '       E.CEP,                                                 ' +#13#10+
           '       NVL(P.NUMDOCUMENTO,D.NUMDOCUMENTO) AS NUMDOCUMENTO,    ' +#13#10+
           '       P.NOME                                                 ' +#13#10+
           '  FROM PESSOA P, ENDPESS E, DOCPESSOA D, CIDADES C, ESTADO S, ' +#13#10+
           '       PARAMGLOBAL PG                                         ' +#13#10+
           ' WHERE P.IDPESSOA = ' + IntToStr(pIdResponsavel)                +#13#10+
           '   AND E.IDPESSOA(+) = P.IDPESSOA                             ' +#13#10+
           '   AND D.IDPESSOA(+) = P.IDPESSOA                             ' +#13#10+
           '   AND E.IDCIDADES = C.IDCIDADES(+)                           ' +#13#10+
           '   AND C.IDESTADO = S.IDESTADO(+)                             ' +#13#10+
           '   AND PG.DOCPFISICA(+) = D.IDDOCUMENTO                       ';

  Result := fCtrlConjuntoRubricas.GetDataPacket(sSQL);
end;

function  TfrmGeraArquivoRemessaPrevia.MontaArquivoCNAB240: Boolean;
var sNomeArquivoGerado, sNomeCompletoArquivoRemessa, sNomeCompletoBackup, sTipCompromisso, sFinalidadeDOC: String;
    iNumArquivo: Integer;
begin
  try
    Result := False;
    qryMontaArquivo.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;
    cdsPortador.First;

    while not cdsPortador.Eof do
    begin
      if (cdsPortador.FieldByName('SEL').AsInteger = 1) AND (cdsPortador.FieldByName('FLGARQUIVO').AsString = 'S') then
      begin
      //André Imakawa - SIG nº 60540 - Inicio
        mmResult.Lines.Add('---------------------------------------------------------------------');
        mmResult.Lines.Add('Início da geração do arquivo de simulação de pagamento SIACC: '+
            FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));

        mmResult.SetFocus;

        mmResult.Lines.Add('  Contas Caixa x Forma de Pagamento : '+ cdsPortador.FieldByName('DESCRICAO').AsString);

        if not SistemaFolha.FlgAgrupaArqDocAlt then
          mmResult.Lines.Add('  Sequência : '+ cdsPortador.fieldbyname('SEQDOCUMENTO').asstring);
        application.processmessages;
      //André Imakawa - SIG nº 60540 - Fim
        if FazQuery(qryMontaArquivo, GetParametrosArquivo(cdsPortador.FieldByName('CODPORTFORMA').asInteger)) then
        begin
          if not qryMontaArquivo.IsEmpty then
          begin
            Result := True;
            
            FazQuery(qryAux, 'SELECT SEQARQUIVOPAGTO.NEXTVAL SEQ FROM DUAL');
            iNumArquivo := qryAux.FieldByName('SEQ').AsInteger;

            sNomeArquivoGerado := qryMontaArquivo.FieldByName('NOME_ARQ_REM').asString  + ZeroEsquerda(6, IntToStr(iNumArquivo)) + '.rem';
            //sNomeCompletoArquivoRemessa := qryMontaArquivo.FieldByName('PATHARQUIVOREM').asString + '\' + sNomeArquivoGerado;
            sNomeCompletoArquivoRemessa:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\' + sNomeArquivoGerado;
            //sNomeCompletoBackup := qryMontaArquivo.FieldByName('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivoGerado;
            sNomeCompletoBackup := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\' + sNomeArquivoGerado;

            if FileExists(sNomeCompletoArquivoRemessa) Then
              DeleteFile(pChar(sNomeCompletoArquivoRemessa));

            if CriaArquivo(sNomeCompletoArquivoRemessa) then
            begin
                //Gerando e gravando dados paara o arquivo de remessa
                if GeraArquivoDeRemessa(sNomeCompletoArquivoRemessa,
                                        cdsPortador.FieldByName('CODPORTFORMA').asString,
                                        iNumArquivo) then
                //André Imakawa - SIG nº 60540 - Inicio
                begin
                  // Copiando o arquivo do diretório de remessa para o de backup
                  CopyFile(pChar(sNomeCompletoArquivoRemessa), pChar(sNomeCompletoBackup), False);

                  mmResult.Lines.Add('Término da geração: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
                  mmResult.Lines.Add('Arquivos de resumo e esboço de remessa armazendos no diretório selecionado.');
                  mmResult.Lines.Add('---------------------------------------------------------------------');
                  mmResult.Lines.Add('');
                end
                else
                begin
                  mmResult.Lines.Add('Erro na geração do Arquivo de Remessa de Pagamento');
                  mmResult.Lines.Add('---------------------------------------------------------------------');
                  mmResult.Lines.Add('');
                end;
                //André Imakawa - SIG nº 60540 - Fim                
            end;   
          end;
        end
        else
        //André Imakawa - SIG nº 60540 - Inicio        
        begin
          mmResult.Lines.Add('Atenção, falta de parametrização.');
          mmResult.Lines.Add('---------------------------------------------------------------------');
          mmResult.Lines.Add('');
        end;
        //André Imakawa - SIG nº 60540 - Fim 
      end;
      cdsPortador.Next;
    end;
  finally
    qryMontaArquivo.close;
  end;
end;

function TfrmGeraArquivoRemessaPrevia.GetParametrosArquivo(
  iCodPortadorForma:  Integer): string;
var sSQL: string;
begin
  sSQL := 'SELECT ''ACC.'' || TO_CHAR(SYSDATE, ''DDMMYYYY.'') || TRIM(CONV.NUMEMPRESABANCO) || ''.'' AS NOME_ARQ_REM,  ' +#13#10 +
          '       PO.PATHARQUIVOREM, PO.PATHARQUIVOBACKUP, BA.NUMBANCO, NVL(PE.NOME, PE.RAZAOSOCIAL) NOME_BANCO, NVL(PP.VLR_OBRIGA_CPF_CNPJ, 0) VLR_OBRIGA_CPF_CNPJ, ' +#13#10 +
          '       PP.PARAM_TRANSMISSAO, PP.AMBIENTE, PP.VERSAO_LEIAUTE_ARQ, PP.VERSAO_LEIAUTE_LOTE, PP.DENSIDADE, PP.TIPO_OPERACAO, PP.COD_COMPROMISSO,              ' +#13#10 +
          '       PP.TIPO_SERVICO, PP.TIPO_SERVICO_K, PP.TIPO_COMPROMISSO, PP.TIPO_COMPROMISSO_K, PP.FINALIDADE_DOC                                                  ' +#13#10 +
          '  FROM PORTADORFORMA PO                                                                                                                                   ' +#13#10 +
          '  JOIN PORTFORMAXPARAMARQREM PP ON PP.CODPORTFORMA = PO.CODPORTFORMA                                                                                      ' +#13#10 +
          '  JOIN BANCO BA ON BA.IDPESSOA = PP.IDBANCO_PAGADOR                                                                                                       ' +#13#10 +
          '  JOIN PESSOA PE ON PE.IDPESSOA = BA.IDPESSOA                                                                                                             ' +#13#10 +
          '  LEFT JOIN SEQREMESSA CONV ON PO.NUMEMPRESABANCO = CONV.NUMEMPRESABANCO                                                                                  ' +#13#10 +
          ' WHERE PO.CODPORTFORMA = ' + IntToStr(iCodPortadorForma);

  Result := sSQL;
end;

function TfrmGeraArquivoRemessaPrevia.CriaArquivo(
  sArquivo: String): Boolean;
begin
  try
    AssignFile(ArquivoEnvioCEF, sArquivo);
    Rewrite(ArquivoEnvioCEF);
    CloseFile(ArquivoEnvioCEF);

    Result := True;
  except
    Result := False;
  end;
end;

function TfrmGeraArquivoRemessaPrevia.GetNumNSA(pNumEmpresaBanco: string): integer;
var
  sSQL: string;
begin
  Result := 1;
  //Result := 'SELECT SEQNSAARQPAG.NEXTVAL SEQ FROM DUAL';  // Andre Imakawa - SIG 60540
  sSQL:= 'SELECT SEQ_NSA_SIACC_'+ pNumEmpresaBanco +'.NEXTVAL SEQ FROM DUAL';

  qryAux.close;
  if FazQuery(qryAux, sSQL) then
    Result := qryAux.FieldByName('SEQ').AsInteger;
end;

function TfrmGeraArquivoRemessaPrevia.GeraArquivoDeRemessa(
  pNomeCompletoArquivoRemessa, pCodPortForma: String; pIdArquivoPagto: Integer): boolean;
Var sLinha, sTipFormaRecPag, sFormaLanc, sVlrTotalLote, sTipoServico, sTipoCompromisso, sFinalidadeDOC: String;
    iQtdLotesArq, iQtdRegsArq, iSeqLote, iQtdRegsLote, iContador1, iContador2: Integer;
    dVlrTotalLote: Double;
    qryRemessa: TwwQuery;
    qryGeraCabecRodapeArq: TwwQuery;
    qryGeraCabecRodapeLote: TwwQuery;
    sHeader: string;
    iRegLote: integer;
    iNumDoc: integer;
    iSeqRemessaPrevia: Integer; // Andre Imakawa - SIG 60540
    sTitularResp, sTitular, sResponsavel, sMatricula: string;       // Andre Imakawa - SIG 60540
    i,iCountLinha, iQtdRegistrosLote, iQtdLinhasLote, iQtdArquivosConvenio: Integer; // Andre Imakawa - SIG 60540
begin
  Result := true;
  iQtdLotesArq := 0;
  iQtdRegsArq := 0;
  iSeqLote := 0;
  iQtdRegsLote := 0;
  iContador1 := 0;
  sVlrTotalLote := EmptyStr;
  sTipoServico := EmptyStr;
  sTipoCompromisso := EmptyStr;
  sFinalidadeDOC := EmptyStr;
  iNumDoc := 0;

  qryRemessa := TwwQuery.Create(nil);
  qryGeraCabecRodapeArq:= TwwQuery.Create(nil);
  qryGeraCabecRodapeLote:= TwwQuery.Create(nil);

  qryRemessa.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;
  qryGeraCabecRodapeArq.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;
  qryGeraCabecRodapeLote.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;
  qryTarifaArqPagto.DatabaseName := dtmBaseDados.dbBaseDados.DatabaseName;
  MontaTarifaArqPagto;

  if not cdsTarifaArqPagto.Active then
    cdsTarifaArqPagto.Open;

  try
    try
      iSeqRemessaPrevia := InsereRemessaPrevia(pNomeCompletoArquivoRemessa); // Andre Imakawa - SIG 60540
      
      // 1.0 - Linha do Cabeçalho do Arquivo
      if FazQuery(qryGeraCabecRodapeArq, SelecionaDadosCabecArq(StrToInt(pCodPortForma), IntToStr(iSeqRemessaPrevia))) then
      begin
        sLinha := qryGeraCabecRodapeArq.FieldByName('LINHACABECARQ').asString;
        GravaLinha(pNomeCompletoArquivoRemessa, sLinha);
      end;

      // 2.0 - linhas do Movimento do Lote
      {sHeader :=  'IDPESSOA;NUM_BANCO;COD_REG;SEG;TIP_MOV;COD_INST;COD_BAN_D;COD_AGE_D;DV_AGE_D;CC_D;DV_CC_D;DV_AGE_CC_D;NOME;' +
                  'NUM_DOC;FILLER;TP_CONT;DT_VENC;TP_MOE;VALOR;NUM_DOC_BAN;QTD_PAR;IND_BLOQ;IND_FORMA_PAR;PER_VENC;NUM_PAR;'+
                  'DT_EFET;VLR_REAL;INF;USO_FEBRABAN;EMITE_AVISO;OCORRENCIAS;TIP_INSCR;NUM_IDENT;LOGRADOURO;NUMERO;COMPL;BAIRRO;'+
                  'CIDADE;CEP;COMPL_CEP;UF;VL_DOC;VL_ABAT;VL_DESC;VL_MORA;VL_MULTA;CODPORTFORMA';
      SaveToCSV(cdsDocTxt, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\ResumoArquivo.csv', sHeader);}

      qryTipoFormaRecPag.Close;
      cdsTipoFormaRecPag.Close;
      if FazQuery(qryTipoFormaRecPag, RetornaFormasPagto(pCodPortForma)) then
      begin
        cdsTipoFormaRecPag.Open;
        while not cdsTipoFormaRecPag.Eof do
        begin
          sFormaLanc :=  cdsTipoFormaRecPag.FieldByName('FORMALANC').asString;
          sTipoCompromisso := qryMontaArquivo.FieldByName('TIPO_COMPROMISSO').asString;
          sTipoServico := qryMontaArquivo.FieldByName('TIPO_SERVICO').asString;
          sFinalidadeDOC := qryMontaArquivo.FieldByName('FINALIDADE_DOC').asString;

          cdsDocTxt.First;
          cdsDocTxt.Filtered := False;
          cdsDocTxt.Filter :=  'CODPORTFORMA = ' + pCodPortForma + ' AND FORMALANC = ' + sFormaLanc;
          cdsDocTxt.Filtered := True;

          if not cdsDocTxt.IsEmpty then
          begin


            iCountLinha := 1;
            iQtdRegistrosLote := cdsDocTxt.RecordCount;
            iQtdLinhasLote:= cdsTipoFormaRecPag.FieldByName('QTDLINHASLOTE').AsInteger;
            iQtdArquivosConvenio := Trunc(iQtdRegistrosLote / iQtdLinhasLote);

            if (iQtdRegistrosLote mod iQtdLinhasLote) <> 0 then
               iQtdArquivosConvenio := iQtdArquivosConvenio + 1;

            for i := 1 to iQtdArquivosConvenio do
            begin
              dVlrTotalLote := 0;
              iQtdRegsLote := 0;
              cdsDocTxt.Filtered:= False;
              cdsDocTxt.Filter := ' (CODPORTFORMA = ' + pCodPortForma + ' ) AND ( FORMALANC = ' + sFormaLanc +
                                  ') AND (LINHA >= ' + IntToStr(iCountLinha) + ' AND LINHA <=  ' + (IntToStr(iQtdLinhasLote * i) + ')');
              cdsDocTxt.Filtered := True;
              iCountLinha := iCountLinha + (iQtdLinhasLote);

              if not cdsDocTxt.IsEmpty then
              begin

                //2.1 - Cabeçalho do Lote
                Inc(iSeqLote); // Determina o número do LOTE
                if FazQuery(qryRemessa,SelecionaDadosCabecLote(pCodPortForma, IntToStr(iSeqLote), sFormaLanc, sTipoCompromisso, sTipoServico)) then
                begin
                  sLinha := qryRemessa.FieldByName('LINHACABECLOTE').AsString;
                  GravaLinha(pNomeCompletoArquivoRemessa, sLinha);
                end;

                iContador2 := 1; //Inicializa a contagem de linha do LOTE.
                iRegLote := 0; //Inicializa contando a linha do HEADER do LOTE.
              end;
              //------------------

              while not cdsDocTxt.Eof do
              begin
                Inc(iNumDoc);

                sMatricula := cdsDocTxt.FieldByName('MATRICULA').asstring;
                //sTitularResp := cdsDocTxt.FieldByName('NODOCUMENTO').asstring;
                //sTitular := Copy(sTitularResp, 1, Pos('-',sTitularResp)-1);
                //sResponsavel := Copy(sTitularResp, Pos('-',sTitularResp)+1, Length(sTitularResp) -Pos('-',sTitularResp)-1);
                sTitular     := cdsDocTxt.FieldByName('IDTITULAR').asstring;
                sResponsavel := cdsDocTxt.FieldByName('IDPESSOA').asstring;
                InsereRemessaPreviaDet(iSeqRemessaPrevia, iNumDoc, sTitular, sResponsavel, sMatricula);

                //2.2 - Linhas A  e B
                //Grava linha A
                GravaLinha(pNomeCompletoArquivoRemessa, MontaLinhaA(IntToStr(iContador2), IntToStr(iSeqLote), sFinalidadeDOC, IntToStr(iNumDoc), IntToStr(iSeqRemessaPrevia), sFormaLanc));
                Inc(iContador2);

                //Grava linha B
                GravaLinha(pNomeCompletoArquivoRemessa, MontaLinhaB(IntToStr(iContador2), IntToStr(iSeqLote)));
                Inc(iContador2);

                dVlrTotalLote := dVlrTotalLote + cdsDocTxt.FieldByName('VALOR').asFloat;
                Inc(iRegLote,2);
                //Registra tarifa bancária da linha
                RegistraTarifaBancaria(pIdArquivoPagto, StrToInt(pCodPortForma), cdsDocTxt.FieldByName('IDPESSOA').AsInteger, iNumDoc, sclaulotes);

                cdsDocTxt.Next;
              end;
              //------------------

              if not cdsDocTxt.IsEmpty then
              begin
                //2.3 - Linha do Rodapé do Lote
                iQtdRegsLote := iRegLote + 2; // 2 = Inclusão de contagem do HEADER e do TRAILLER
                sVlrTotalLote := FormatarValor(2, FloatToStr(dVlrTotalLote));

                if FazQuery(qryGeraCabecRodapeLote, SelecionaDadosRodapeLote(IntToStr(iSeqLote), IntToStr(iQtdRegsLote), sVlrTotalLote)) then
                begin
                  sLinha := qryGeraCabecRodapeLote.FieldByName('LINHARODAPELOTE').asString;
                  GravaLinha(pNomeCompletoArquivoRemessa, sLinha);
                end;

                iQtdRegsArq := iQtdRegsArq + iQtdRegsLote;
                //------------------
              end;                  

              cdsDocTxt.Filtered := False;
              cdsDocTxt.First;

            end;
          end;
          cdsTipoFormaRecPag.Next;
        end;
      end;

      // 3.0. - Linha do Rodapé do Arquivo
      iQtdLotesArq := iSeqLote;
      iQtdRegsArq := iQtdRegsArq + 2;
      if FazQuery(qryGeraCabecRodapeArq, SelecionaDadosRodapeArq(IntToStr(iQtdLotesArq), IntToStr(iQtdRegsArq))) then
      begin
        sLinha := qryGeraCabecRodapeArq.FieldByName('LINHARODAPEARQ').asString;
        GravaLinha(pNomeCompletoArquivoRemessa, sLinha);
      end;
      //------------------
    except
      Result := False;
    end;
  finally
    FreeAndNil(qryRemessa);
    FreeAndNil(qryGeraCabecRodapeArq);
    FreeAndNil(qryGeraCabecRodapeLote);
  end;

end;

procedure TfrmGeraArquivoRemessaPrevia.GravaLinha(sArquivo,
  sLinha: string);
begin
  if sLinha <> '' Then
  begin
    AssignFile(ArquivoEnvioCEF, sArquivo);
    Append(ArquivoEnvioCEF);
    Write(ArquivoEnvioCEF, sLinha);
    WriteLn(ArquivoEnvioCEF);
    CloseFile(ArquivoEnvioCEF);
  end;
end;

procedure TfrmGeraArquivoRemessaPrevia.SaveToCSV(DataSet: TDataSet;
  FileName, sHeader: string);
var
  List: TStringList;
  S: String;
  I: Integer;
  Delimiter: Char;
  Enclosure: Char;

  function EscapeString(s: string): string;
  var
    i: Integer;
  begin
    Result := StringReplace(s,Enclosure,Enclosure+Enclosure,[rfReplaceAll]);
    if (Pos(Delimiter,s) > 0) OR (Pos(Enclosure,s) > 0) then  // Comment this line for enclosure in every fields
        Result := Enclosure+Result+Enclosure;
  end;
  function RPad(S: string; Ch: Char; Len: Integer): string;
  var   RestLen: Integer;
  begin   Result  := S;
    RestLen := Len - Length(s);
    if RestLen < 1 then Exit;
    Result := S + StringOfChar(Ch, RestLen);
  end;

  procedure AddHeader(sHeader: string);
  var
    I: Integer;
  begin
    S := sHeader;
    List.Add(S);
  end;

  procedure AddRecord;
  var
    I: Integer;
  begin
    S := '';
    for I := 0 to DataSet.FieldCount - 1 do begin
      if S > '' then
        S := S + Delimiter;

     if (I = 0) then
      S := S +'="'+EscapeString(DataSet.Fields[I].AsString)+'"'
     else
      S := S + EscapeString(DataSet.Fields[I].AsString);

    end;
    List.Add(S);
  end;
begin
  Delimiter := ';';
  Enclosure := '"';
  List := TStringList.Create;

  try
    AddHeader(sHeader);
    DataSet.DisableControls;
    DataSet.First;
    while not DataSet.Eof do begin
      AddRecord;
      DataSet.Next;
    end;
  finally
    List.SaveToFile(FileName);
    DataSet.First;
    DataSet.EnableControls;
    List.Free;
  end;

end;

function TfrmGeraArquivoRemessaPrevia.AjustaTamCampo(sCampo: string;
  iTam: integer; sChar: string): string;
begin
  while Length(sCampo) < iTam do
  begin
    sCampo := sCampo + sChar;
  end;
  Result := Copy(sCampo, 1, iTam);
end;

function TfrmGeraArquivoRemessaPrevia.FormatarValor(NumCasas: integer;
  Valor: string): string;
var
 x, y, flag : integer;
 Resultado, left, right : string;
begin
  left      := '';
  right     := '';
  Resultado := '';
  flag := 0;
  for x := 1 to length(Valor) do
    Begin
      if Valor[x] = ',' then
        Begin
          for y := x + 1 to length(valor) do
           right := right + Valor[y];
          flag  := 1;
        end
      else if flag = 0 then
        left  := Left + valor[x];
    end;

    Result := ZeroEsquerda((NumCasas - 2), left) + ZeroDireita(2, copy(right, 1, 2))
end;

function TfrmGeraArquivoRemessaPrevia.MontaLinhaA(pNSR, pSeqLote,
  pFinalidadeDoc, pNumDoc, pSeqRemessa, pFormaLanc: string): string;
var
  sLinha, sCompensacao: string;
begin

  // Andre Imakawa - SIG 101541 - Inicio
  if pFormaLanc = '41' then
    sCompensacao := '018'
  else
    sCompensacao := '000';
  // Andre Imakawa - SIG 101541 - Fim
    
  sLinha := cdsDocTxt.FieldByName('NUM_BANCO').AsString +                                  // CÓDIGO DO BANCO
            ZeroEsquerda(4, pSeqLote) +                                                     // LOTE DE SERVIÇO
            cdsDocTxt.FieldByName('COD_REG').AsString +                                    // CÓDIGO DE REGISTRO
            ZeroEsquerda(5, pNSR) +                                                         // NSR
            AjustaTamCampo(cdsDocTxt.FieldByName('SEG').AsString, 1, ' ')+                 // CÓDIGO SEGMENTO
            cdsDocTxt.FieldByName('TIP_MOV').AsString +                                    // TIPO MOVIMENTO
            cdsDocTxt.FieldByName('COD_INST').AsString +                                   // CÓD. INSTRUÇÃO MOVIMENTO
            //'700' +                                                                      // CÂMARA DE COMPENSAÇÃO // Andre Imakawa - SIG 101541
            sCompensacao +                                                                 // CÂMARA DE COMPENSAÇÃO // Andre Imakawa - SIG 101541 
            ZeroEsquerda(3, cdsDocTxt.FieldByName('COD_BAN_D').AsString) +                 // CÓD. BANCO DESTINO
            Zeroesquerda(5, cdsDocTxt.FieldByName('COD_AGE_D').AsString) +                 // CÓD AGÊNCIA DESTINO
            AjustaTamCampo(cdsDocTxt.FieldByName('DV_AGE_D').asString, 1, ' ') +           // DV AGÊNCIA DESTINO
            ZeroEsquerda(12, cdsDocTxt.FieldByName('CC_D').asString) +                     // CONTA CORRENTE DESTINO
            AjustaTamCampo(cdsDocTxt.FieldByName('DV_CC_D').asString, 1, ' ')+             // DV CONTA DESTINO
            AjustaTamCampo(cdsDocTxt.FieldByName('DV_AGE_CC_D').asString, 1, ' ') +        // DV AGÊNCIA/CONTA DESTINO
            AjustaTamCampo(Copy(cdsDocTxt.FieldByName('NOME').asString, 1, 30), 30, ' ') + // NOME DO TERCEIRO
            ZeroEsquerda(6, pNumDoc) +                                                     // NÚM. DOCUMENTO ATRIBUÍDO PELA EMPRESA
            AjustaTamCampo('P'+pSeqRemessa, 13, ' ') +                                     // FILLER
            AjustaTamCampo(cdsDocTxt.FieldByName('TP_CONT').asString, 1, ' ') +            // TIPO CONTA - FINALIDADE TED
            cdsDocTxt.FieldByName('DT_VENC').asString +                                    // DATA VENCIMENTO
            AjustaTamCampo(cdsDocTxt.FieldByName('TP_MOE').asString, 3, ' ') +             // TIPO DE MOEDA
            FormatarValor(14, '0') +                                                        // QUANTIDADE DE MOEDA
            FormatarValor(16, cdsDocTxt.FieldByName('VALOR').asString) +                   // VALOR LANÇAMENTO
            ZeroEsquerda(9, cdsDocTxt.FieldByName('NUM_DOC_BAN').asString) +               // NÚMERO DOCUMENTO BANCO
            AjustaTamCampo(cdsDocTxt.FieldByName('FILLER').asString, 3, ' ') +             // FILLER
            ZeroEsquerda(2, cdsDocTxt.FieldByName('QTD_PAR').asString) +                   // QUANTIDADE DE PARCELAS
            AjustaTamCampo(cdsDocTxt.FieldByName('IND_BLOQ').asString, 1, ' ') +           // INDICADOR DE BLOQUEIO
            cdsDocTxt.FieldByName('IND_FORMA_PAR').asString +                              // IND. FORMA PARCELAMENTO
            AjustaTamCampo(cdsDocTxt.FieldByName('PER_VENC').asString, 2, ' ') +           // PERÍODO/DIA DE VENCIMENTO
            cdsDocTxt.FieldByName('NUM_PAR').asString +                                    // NÚMERO PARCELA
            cdsDocTxt.FieldByName('DT_EFET').asString +                                    // DATA DA EFETIVAÇÃO
            FormatarValor(13, cdsDocTxt.FieldByName('VLR_REAL').asString) +                // VALOR REAL EFETIVADO
            AjustaTamCampo(cdsDocTxt.FieldByName('INF').asString, 40, ' ') +               // INFORMAÇÃO 2
            ZeroEsquerda(2, pFinalidadeDoc) +                                               // FINALIDADE DOC
            AjustaTamCampo(cdsDocTxt.FieldByName('USO_FEBRABAN').asString, 10, ' ') +      // USO FEBRABAN
            cdsDocTxt.FieldByName('EMITE_AVISO').asString +                                // AVISO AO FAVORECIDO
            AjustaTamCampo(cdsDocTxt.FieldByName('OCORRENCIAS').asString, 10, ' ');        // OCORRÊNCIAS
                              
  Result := sLinha;
end;

function TfrmGeraArquivoRemessaPrevia.MontaLinhaB(pNSR,
  pSeqLote: string): string;
var
  sLinha: string;
begin
 sLinha := ZeroEsquerda(3, cdsDocTxt.FieldByName('NUM_BANCO').AsString) +                       // CÓDIGO DO BANCO
            ZeroEsquerda(4, pSeqLote) +                                                           // LOTE DE SERVIÇO
            cdsDocTxt.FieldByName('COD_REG').AsString +                                          // CÓDIGO DO REGISTRO
            ZeroEsquerda(5, pNSR) +                                                               // NSR
            'B' +                                                                                 // CÓDIGO SEGMENTO
            AjustaTamCampo('', 3, ' ') +                                                          // USO FEBRABAN
            '1' +                                                                                 // TIPO INSCRIÇÃO
            ZeroEsquerda(14, cdsDocTxt.FieldByName('NUM_IDENT').asString) +                      // NÚMERO DE INSCRIÇÃO
            AjustaTamCampo(Copy(cdsDocTxt.FieldByName('LOGRADOURO').asString, 1, 30), 30, ' ') + // LOGRADOURO
            ZeroEsquerda(5, cdsDocTxt.FieldByName('NUMERO').asString) +                          // NÚMERO NO LOCAL
            AjustaTamCampo(Copy(cdsDocTxt.FieldByName('COMPL').asString, 1, 15), 15, ' ') +      // COMPLEMENTO
            AjustaTamCampo(Copy(cdsDocTxt.FieldByName('BAIRRO').asString, 1, 15), 15, ' ') +     // BAIRRO
            AjustaTamCampo(Copy(cdsDocTxt.FieldByName('CIDADE').asString, 1, 20), 20, ' ') +     // CIDADE
            ZeroEsquerda(5, cdsDocTxt.FieldByName('CEP').asString) +                             // CEP
            AjustaTamCampo(Copy(cdsDocTxt.FieldByName('COMPL_CEP').asString, 1, 3), 3, ' ');     // COMPLEMENTO CEP
  if (cdsDocTxt.FieldByName('UF').IsNull) or (cdsDocTxt.FieldByName('UF').asString = '') then
    sLinha := sLinha + AjustaTamCampo('', 2, ' ')
  else
    sLinha := sLinha + cdsDocTxt.FieldByName('UF').asString;                                     // UF DO ESTADO

  sLinha := sLinha + cdsDocTxt.FieldByName('DT_VENC').asString +                                 // DATA VENCIMENTO
            FormatarValor(13, cdsDocTxt.FieldByName('VL_DOC').asString) +                        // VALOR DO DOCUMENTO
            FormatarValor(13, cdsDocTxt.FieldByName('VL_ABAT').asString) +                       // VALOR DO ABATIMENTO
            FormatarValor(13, cdsDocTxt.FieldByName('VL_DESC').asString) +                       // VALOR DO DESCONTO
            FormatarValor(13, cdsDocTxt.FieldByName('VL_MORA').asString) +                       // VALOR DA MORA
            FormatarValor(13, cdsDocTxt.FieldByName('VL_MULTA').asString) +                      // VALOR DA MULTA
            AjustaTamCampo('', 15, ' ') +                                                         // CÓD. DOCUMENTO FAVORECIDO
            AjustaTamCampo('', 15, ' ');                                                          // USO DA FEBRABAN

  Result := sLinha;
end;

function TfrmGeraArquivoRemessaPrevia.SelecionaDadosCabecArq(
  iCodPortForma: integer; sIdRemessa: string): string;
var
  sSQL: string;
begin
  sSQL := 'SELECT ' + Quotedstr(qryMontaArquivo.FieldByName('NUMBANCO').asString) + '||--BANCO,                      ' + #13#10 +
          '       LPAD(''0'', 4, ''0'') ||--COD_LOTE,                                                                ' + #13#10 +
          '       ''0'' ||--REG,                                                                                     ' + #13#10 +
          '       RPAD('' '', 9) ||--FILLER,                                                                         ' + #13#10 +
          '       DECODE(LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')), 11, ''1'', 14, ''2'', ''0'') ||--TIP_INSC,  ' + #13#10 +
          '       LPAD(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 14, ''0'') ||--NUM_INSC,                              ' + #13#10 +
          '       LPAD(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), 6, ''0'') ||--COD_CONV,                           ' + #13#10 +
          '       RPAD('+ Quotedstr(qryMontaArquivo.FieldByName('PARAM_TRANSMISSAO').asString) + ', 2, ''0'') ||     ' + #13#10;
          if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then  //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
            sSql := sSql + Quotedstr(qryMontaArquivo.FieldByName('AMBIENTE').asString) + '|| --AMB_CLI,           ' + #13#10 // Andre Imakawa - SIG 101587
          else
            sSql := sSql + '''T'' || --AMB_CLI,                                                                      ' + #13#10;
          sSql := sSql + '       '' '' ||--AMB_CAIXA,                                                                ' + #13#10 +
          '       RPAD('' '', 3) ||--ORIG_APLIC,                                                                     ' + #13#10 +
          '       LPAD(''0'', 4, ''0'') ||--NUM_VERSAO,                                                              ' + #13#10 +
          '       RPAD('' '', 3) ||--FILLER,                                                                         ' + #13#10 +
          '       CASE                                                                                               ' + #13#10 +
          '         WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                    ' + #13#10 +
          '           LPAD(NVL(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), ''0''), 5, ''0'')                              ' + #13#10 +
          '         ELSE                                                                                             ' + #13#10 +
          '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(BA.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')  ' + #13#10 +
          '       END ||--AGENCIA_CLI,                                                                               ' + #13#10 +
          '       /*CASE                                                                                             ' + #13#10 +
          '         WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                    ' + #13#10 +
          '           ''0''                                                                                          ' + #13#10 +
          '         ELSE                                                                                             ' + #13#10 +
          '           NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), INSTR(TRIM(BA.MASCARAAGENCIA), ''-''), 1), ''0'')  ' + #13#10 +
          '       END ||DV_AG, */                                                                                    ' + #13#10 +
          '       ''9'' ||--DV_AG,                                                                                   ' + #13#10 +
          '       CASE                                                                                               ' + #13#10 +
          '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                         ' + #13#10 +
          '           LPAD(NVL(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), ''0''), 12, ''0'')                          ' + #13#10 +
          '         ELSE                                                                                             ' + #13#10 +
          '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(BA.MASCARACC), ''-'')-1), ''0''), 12, ''0'')  ' + #13#10 +
          '       END ||--CONTA_CLI,                                                                                 ' + #13#10 +
          '       CASE                                                                                               ' + #13#10 +
          '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                         ' + #13#10 +
          '           '' ''                                                                                          ' + #13#10 +
          '         ELSE                                                                                             ' + #13#10 +
          '           NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), INSTR(TRIM(BA.MASCARACC), ''-''), 1), '' '')  ' + #13#10 +
          '       END ||--DV_CC,                                                                                     ' + #13#10 +
          '       '' '' ||--DV_AG_CC,                                                                                ' + #13#10 +
          '       RPAD(UPPER(TRANSLATE(TRIM(P.NOME) ||'' - ''|| TRIM(P.RAZAOSOCIAL), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')), 30) ||--NOME_EMPRESA,  ' + #13#10 +
          '       RPAD(' + Quotedstr(qryMontaArquivo.FieldByName('NOME_BANCO').asString) + ', 30, ''0'') ||          ' + #13#10 +
          '       RPAD('' '', 10) ||--FILLER,                                                                        ' + #13#10 +
          '       ''1'' ||--REM_RET,                                                                                 ' + #13#10 +
          '       TO_CHAR(SYSDATE, ''DDMMYYYYHH24MISS'') ||--DT_HORA_ARQ, --CAMPOS 0.23 e 0.24                       ' + #13#10 +
          '       LPAD(' + Quotedstr(sIdRemessa) + ', 6, ''0'') ||                                                         ' + #13#10 +
          '       LPAD(' + Quotedstr(qryMontaArquivo.FieldByName('VERSAO_LEIAUTE_ARQ').asString) + ', 3, ''0'') ||   ' + #13#10 +
          '       LPAD(' + Quotedstr(qryMontaArquivo.FieldByName('DENSIDADE').asString) + ', 5, ''0'') ||            ' + #13#10 +
          '       RPAD('' '', 20) ||--RESERVADO_BANCO,                                                               ' + #13#10 +
          '       LPAD(' +Quotedstr('P'+sIdRemessa) + ', 20, ''0'') ||                                                         ' + #13#10 +            // Andre Imakawa - SIG 60540
          //          '       RPAD('' '', 20) ||--RESERVADO_EMPRESA,                                                             ' + #13#10 + // Andre Imakawa - SIG 60540
          '       RPAD('' '', 11) ||--USO_FEBRA,                                                                     ' + #13#10 +
          '       RPAD('' '', 3) ||--ID_COBRANCA,                                                                    ' + #13#10 +
          '       LPAD(''0'', 3, ''0'') ||--VANS,                                                                    ' + #13#10 +
          '       RPAD('' '', 2) ||--TIP_SERVICO,                                                                    ' + #13#10 +
          '       RPAD('' '', 10) --SEM_PAPEL                                                                        ' + #13#10 +
          '        AS LINHACABECARQ                                                                                  ' + #13#10 +
          ' FROM PESSOA P                                                                                            ' + #13#10 +
          ' JOIN PORTADORFORMA PO ON PO.IDPESSOA = P.IDPESSOA                                                        ' + #13#10 +
          ' JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                 ' + #13#10 +
          ' JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                    ' + #13#10 +
          ' JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                ' + #13#10 +
          ' JOIN CONTABANCARIA CO ON CO.IDAGENCIA = AG.IDPESSOA AND CO.IDPESSOA = P.IDPESSOA                         ' + #13#10 +
          'WHERE PO.CODPORTFORMA = ' + IntToStr(iCodPortForma)                                                         + #13#10 +
          '      AND PO.RECPAG = ''P''';                                                                               
  Result := sSQL;
end;

function TfrmGeraArquivoRemessaPrevia.SelecionaDadosCabecLote(
  pCodPortForma, pSeqLote, pFormaLanc, pTipCompromisso,
  pTipoServico: String): string;
var sSQL : string;
begin
  {
  NOTA 2: TIPO DE SERVIÇO
  '00' = Optantes                                   '60' = Pagamento Despesas Viajante em Trânsito
  '05' = Débitos/Recebimentos                       '70' = Pagamento Autorizado
  '10' = Pagamento de Dividendos                    '75' = Pagamento Credenciados
  '20' = Pagamento Fornecedor                       '80' = Pagamento Representantes/Vendedores Autorizados
  '30' = Pagamento Salários                         '90' = Pagamento Benefícios
  '50' = Pagamento Sinistros Segurados              '98' = Pagamento Diversos

  NOTA 3: FORMA DE LANÇAMENTO
  '01' = Crédito em CC                              '02' = Cheque pagamento/administrativo
  '03' = DOC                                        '05' = Crédito em Conta Poupança
  '10' = OP a disposição                            '11' = Pagamento de contas e tributos com código de barras
  '30' = Liquidação de títulos do próprio banco
  '31' = Pagamento de Títulos de outros Bancos      '41' = TED,
  '43' = TED mesma titularidade                     '50' = Débito em conta corrente - recebimento

  NOTA 4: TIPO DE COMPROMISSO
  '01' = Pagamento à Fornecedor                     '06' = Salário Ampliação de Base
  '02' = Pagamento de Salários                      '11' = Débito em Conta
  '03' = Autopagamento
  }

  sSQL := 'SELECT ' + Quotedstr(qryMontaArquivo.FieldByName('NUMBANCO').asString) + ' || --BANCO,                       ' + #13#10;
  sSQL := sSQL + 'LPAD(' + Quotedstr(pSeqLote) + ', 4, ''0'') ||                                                         ' + #13#10 +
    '       ''1'' ||--REG,                                                                                               ' + #13#10 ;
  sSQL := sSQL + Quotedstr(qryMontaArquivo.FieldByName('TIPO_OPERACAO').asString) + '||                                 ' + #13#10 +
    '       LPAD(' + Quotedstr(pTipoServico) + ', 2, ''0'') ||--NOTA2                                                    ' + #13#10 +
    '       RPAD(' + Quotedstr(pFormaLanc) + ', 2, ''0'') ||                                                             ' + #13#10 +
    '       LPAD(' + Quotedstr(qryMontaArquivo.FieldByName('VERSAO_LEIAUTE_LOTE').asString) + ', 3, ''0'') ||           ' + #13#10 +
    '       '' '' ||--FILLER,                                                                                            ' + #13#10 +
    '       DECODE(LENGTH(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D'')), 11, ''1'', 14, ''2'', ''0'') ||--TIP_INSC,            ' + #13#10 +
    '       LPAD(REGEXP_REPLACE(P.NUMDOCUMENTO, ''\D''), 14, ''0'') ||--NUM_INSC,                                        ' + #13#10 +
    '       LPAD(REGEXP_REPLACE(PO.NUMEMPRESABANCO, ''\D''), 6, ''0'') ||--COD_CONV,                                     ' + #13#10 +
    '       LPAD(' + Quotedstr(pTipCompromisso) + ', 2, ''0'') || -- NOTA 4                                              ' + #13#10 + 
    '       LPAD(' + Quotedstr(qryMontaArquivo.FieldByName('COD_COMPROMISSO').asString) + ', 4, ''0'') ||               ' + #13#10 +
    '       RPAD(' + Quotedstr(qryMontaArquivo.FieldByName('PARAM_TRANSMISSAO').asString) + ', 2, ''0'') ||             ' + #13#10 +
    '       RPAD('' '', 6) ||--FILLER,                                                                                   ' + #13#10 +
    '       CASE                                                                                                         ' + #13#10 +
    '         WHEN INSTR(BA.MASCARAAGENCIA, ''-'') = 0 THEN                                                              ' + #13#10 +
    '           LPAD(NVL(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), ''0''), 5, ''0'')                                        ' + #13#10 +
    '         ELSE                                                                                                       ' + #13#10 +
    '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(AG.NUMAGENCIA, ''\W''), 0, INSTR(TRIM(BA.MASCARAAGENCIA), ''-'')-1), 0), 5, ''0'')  ' + #13#10 +
    '       END ||--AGENCIA,                                                                                             ' + #13#10 +
    '       ''9'' ||--DV_AG,                                                                                             ' + #13#10 +
    '       CASE                                                                                                         ' + #13#10 +
    '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                                   ' + #13#10 +
    '           LPAD(NVL(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), ''0''), 12, ''0'')                                    ' + #13#10 +
    '         ELSE                                                                                                       ' + #13#10 +
    '           LPAD(NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), 0, INSTR(TRIM(BA.MASCARACC), ''-'')-1), ''0''), 12, ''0'')  ' + #13#10 +
    '       END ||--CONTA,                                                                                               ' + #13#10 +
    '       CASE                                                                                                         ' + #13#10 +
    '         WHEN INSTR(BA.MASCARACC, ''-'') = 0 THEN                                                                   ' + #13#10 +
    '           '' ''                                                                                                    ' + #13#10 +
    '         ELSE                                                                                                       ' + #13#10 +
    '           NVL(SUBSTR(REGEXP_REPLACE(CO.CONTACORRENTE, ''\W''), INSTR(TRIM(BA.MASCARACC), ''-''), 1), '' '')        ' + #13#10 +
    '       END ||--DV_CC,                                                                                               ' + #13#10 +
    '       '' '' ||--DV_AG_CC,                                                                                          ' + #13#10 +
    '       RPAD(UPPER(TRANSLATE(TRIM(P.NOME) ||'' - ''|| TRIM(P.RAZAOSOCIAL), ''ÁÇÉÍÓÚÀÈÌÒÙÂÊÎÔÛÃÕËÜáçéíóúàèìòùâêîôûãõëü'',''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')), 30) ||--NOME_EMPRESA,  ' + #13#10 +
    '       RPAD('' '', 40) ||--MSG_AVISO1,                                                                              ' + #13#10 +
    '       RPAD(NVL(TRIM(ED.LOGRADOURO), '' ''), 30) ||--LOGRADOURO,                                                    ' + #13#10 +
    '       LPAD(NVL(TRIM(ED.NUMERO), ''0''), 5, ''0'') ||--NUM_LOCAL,                                                   ' + #13#10 +
    '       RPAD(NVL(TRIM(ED.COMPLEMENTO), '' ''), 15) ||--COMPL_LOGRADOURO,                                             ' + #13#10 +
    '       RPAD(NVL(TRIM(C.NOME), '' ''), 20) ||--CIDADE,                                                               ' + #13#10 +
    '       LPAD(NVL(TRIM(ED.CEP), ''0''), 5, ''0'') ||--CEP,                                                            ' + #13#10 +
    '       RPAD(NVL(SUBSTR(TRIM(ED.CEP), 6, 3), '' ''), 3) ||--COMPL_CEP,                                               ' + #13#10 +
    '       RPAD(NVL(TRIM(C.UF), '' ''), 2) ||--UF,                                                                      ' + #13#10 +
    '       RPAD('' '', 8) ||--USO_FEBRA,                                                                                ' + #13#10 +
    '       RPAD('' '', 10) /*OCORRENCIAS*/ AS LINHACABECLOTE                                                            ' + #13#10 +
    '  FROM PESSOA P                                                                                                     ' + #13#10 +
    '  JOIN PORTADORFORMA PO ON PO.IDPESSOA = P.IDPESSOA                                                                 ' + #13#10 +
    '  JOIN PORTADORCONTA PC ON PC.CODPORTADOR = PO.CODPORTADOR                                                          ' + #13#10 +
    '  JOIN AGENCIABANCARIA AG ON AG.IDPESSOA = PC.IDAGENCIA                                                             ' + #13#10 +
    '  JOIN BANCO BA ON BA.IDPESSOA = AG.IDBANCO                                                                         ' + #13#10 +
    '  JOIN CONTABANCARIA CO ON CO.IDAGENCIA = AG.IDPESSOA AND CO.IDPESSOA = P.IDPESSOA                                  ' + #13#10 +
    '  LEFT JOIN (SELECT MAX(E.IDENDERECO) MAX_ID,                                                                       ' + #13#10 +
    '                    E.IDPESSOA                                                                                      ' + #13#10 +
    '             FROM ENDPESS E                                                                                         ' + #13#10 +
    '             GROUP BY E.IDPESSOA) MAX_END ON P.IDPESSOA = MAX_END.IDPESSOA                                          ' + #13#10 +
    '  LEFT JOIN ENDPESS ED ON ED.IDENDERECO = MAX_END.MAX_ID                                                            ' + #13#10 +
    '  LEFT JOIN CIDADES C ON C.IDCIDADES = ED.IDCIDADES                                                                 ' + #13#10 +
    ' WHERE PO.CODPORTFORMA = ' + pCodPortForma                                                                            + #13#10 +
    '   AND PO.RECPAG = ''P''                                                                                            ';

  Result := sSQL;
end;

function TfrmGeraArquivoRemessaPrevia.SelecionaDadosRodapeArq(pQtdLotesArq,
  pQtdRegsArq: String): string;
var
  sSQL: String;
begin
  sSQL := 'SELECT ' + Quotedstr(qryMontaArquivo.FieldByName('NUMBANCO').asString) + '|| /*BANCO,*/ ' + #13#10 +
    '       LPAD(''9'', 4, ''9'') ||/*LOTE,*/                                                       ' + #13#10 +
    '       ''9'' ||/*REG,*/                                                                        ' + #13#10 +
    '       RPAD('' '', 9) ||/*USO_FEBRA,*/                                                         ' + #13#10 +
    '       LPAD(' + Quotedstr(pQtdLotesArq) +', 6, ''0'') ||                                       ' + #13#10 +
    '       LPAD(' + Quotedstr(pQtdRegsArq) + ', 6, ''0'') ||                                       ' + #13#10 +
    '       LPAD(''0'', 6, ''0'') || /*QTD_CONTAS_CONCILIACAO,*/                                    ' + #13#10 +
    '       RPAD('' '', 205) /*USO_FEBRA2*/ AS LINHARODAPEARQ                                       ' + #13#10 +
    'FROM DUAL ';

  Result := sSQL;
end;

function TfrmGeraArquivoRemessaPrevia.SelecionaDadosRodapeLote(pSeqLote,
  pQtdRegsLote, pVlrTotalLote: String): string;
var
  sSQL : string;
begin
  sSQL := 'SELECT ' + Quotedstr(qryMontaArquivo.FieldByName('NUMBANCO').asString) + '|| /*BANCO,*/                  ' + #13#10 +
    '       LPAD(' + Quotedstr(pSeqLote) + ', 4, ''0'') ||                                                           ' + #13#10 +
    '       ''5'' ||/*REG,*/                                                                                         ' + #13#10 +
    '       RPAD('' '', 9) ||/*USO_FEBRA,*/                                                                          ' + #13#10 +
    '       LPAD(' + Quotedstr(pQtdRegsLote) + ', 6, ''0'') ||                                                       ' + #13#10 +
    '       LPAD(' + Quotedstr(pVlrTotalLote) + ', 18, ''0'') ||                                                     ' + #13#10 +
    '       LPAD(''0'', 18, ''0'') ||/*SUM_QTD_MOEDA,*/                                                              ' + #13#10 +
    '       LPAD(''0'', 6, ''0'') ||/*N_AVISO_DEBITO,*/                                                              ' + #13#10 +
    '       RPAD('' '', 165) ||/*USO_FEBRA2,*/                                                                       ' + #13#10 +
    '       RPAD('' '', 10) /*OCORRENCIAS*/ AS LINHARODAPELOTE                                                       ' + #13#10 +
    '  FROM DUAL ';
  Result := sSQL;
end;

function TfrmGeraArquivoRemessaPrevia.ZeroDireita(TamanhoTexto: integer;
  texto: String): string;
var
  numzeros : integer;
  f        : integer;
  zeros    : string;
begin
  zeros := '';
  numzeros := tamanhoTexto - length(texto);

  for f := 1 to numzeros do
    zeros := zeros + '0';

  result := texto + zeros;
end;

function TfrmGeraArquivoRemessaPrevia.ZeroEsquerda(TamanhoTexto: Integer;
  Texto: String): String;
var
  numzeros : integer;
  f        : integer;
  zeros    : string;
begin
  zeros := '';
  numzeros := tamanhoTexto - length(texto);

  for f := 1 to numzeros do
    zeros := zeros + '0';

  result := zeros + texto;
end;

procedure TfrmGeraArquivoRemessaPrevia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(qryMontaArquivo);
  FreeAndNil(ctrlRemessaEletronica);
  //Cássio Rovaroto - SG nº 78153 - Início
  FreeAndNil(fCtrlConjuntoRubricas);
  FreeAndNil(cdsRecebedor);
  FreeAndNil(cdsDadosRec);
  //Cássio Rovaroto - SG nº 78153 - Fim.
  inherited;
end;

function TfrmGeraArquivoRemessaPrevia.RemoveCaracterEspecial(
  pTexto: String; pRemoveExtra: boolean): String;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('á', 'à', 'ã', 'â', 'ä','Á', 'À', 'Ã', 'Â', 'Ä',
                                     'é', 'è','É', 'È','í', 'ì','Í', 'Ì',
                                     'ó', 'ò', 'ö','õ', 'ô','Ó', 'Ò', 'Ö', 'Õ', 'Ô',
                                     'ú', 'ù', 'ü','Ú','Ù', 'Ü','ç','Ç','ñ','Ñ');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','¨','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','´','`',
                                     '¨','æ','Æ','ø','£','Ø','ƒ','ª','º','¿',
                                     '®','½','¼','ß','µ','þ','ý','Ý');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := pTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
   //De acordo com o parâmetro aLimExt, elimina caracteres extras.  
   if (pRemoveExtra) then
     for i:=1 to 48 do
       xTexto := StringReplace(xTexto, xCarExt[i], ' ', [rfreplaceall]);   
   Result := xTexto;
end;

procedure TfrmGeraArquivoRemessaPrevia.AbrirQueryDocTxtLeiaute240;
var
  sSQL: string;
begin
  sSQL := 'SELECT 0 AS IDPESSOA,                                ' + #13#10 +
          '       ''   '' AS NUM_BANCO,                                 ' + #13#10 +
          '       '' '' AS COD_REG,                                     ' + #13#10 +
          '       '' '' AS SEG,                                         ' + #13#10 +
          '       '' '' AS TIP_MOV,                                     ' + #13#10 +
          '       ''  '' AS COD_INST,                                   ' + #13#10 +
          '       ''   '' AS COD_BAN_D,                                 ' + #13#10 +
          '       ''     '' AS COD_AGE_D,                               ' + #13#10 +
          '       '' ''AS DV_AGE_D,                                     ' + #13#10 +
          '       ''            '' AS CC_D,                             ' + #13#10 +
          '       '' '' AS DV_CC_D,                                     ' + #13#10 +
          '       '' '' AS DV_AGE_CC_D,                                 ' + #13#10 +
          '       ''                              '' AS NOME,           ' + #13#10 +
          '       ''      '' AS NUM_DOC,                                ' + #13#10 +
          '       ''             '' AS FILLER,                          ' + #13#10 +
          '       '' '' AS TP_CONT,                                     ' + #13#10 +
          '       ''        '' AS DT_VENC,                              ' + #13#10 +
          '       ''   '' AS TP_MOE,                                    ' + #13#10 +
          '       ''                '' AS VALOR,                        ' + #13#10 +
          '       ''         '' AS NUM_DOC_BAN,                         ' + #13#10 +
          '       ''  '' AS QTD_PAR,                                    ' + #13#10 +
          '       '' '' AS IND_BLOQ,                                    ' + #13#10 +
          '       '' '' AS IND_FORMA_PAR,                               ' + #13#10 +
          '       ''  '' AS PER_VENC,                                   ' + #13#10 +
          '       ''  '' AS NUM_PAR,                                    ' + #13#10 +
          '       ''        '' AS DT_EFET,                              ' + #13#10 +
          '       ''                '' AS VLR_REAL,                     ' + #13#10 +
          '       ''                                       '' AS INF,   ' + #13#10 +
          '       ''  '' AS USO_FEBRABAN,                               ' + #13#10 +
          '       '' '' AS EMITE_AVISO,                                 ' + #13#10 +
          '       ''          '' AS OCORRENCIAS,                        ' + #13#10 +
          '       '' '' AS TIP_INSCR,                                   ' + #13#10 +
          '       ''              '' AS NUM_IDENT,                      ' + #13#10 +
          '       ''                              '' AS LOGRADOURO,     ' + #13#10 +
          '       ''     '' AS NUMERO,                                  ' + #13#10 +
          '       ''                '' AS COMPL,                        ' + #13#10 +
          '       ''                '' AS BAIRRO,                       ' + #13#10 +
          '       ''                     '' AS CIDADE,                  ' + #13#10 +
          '       ''     '' AS CEP,                                     ' + #13#10 +
          '       ''   '' AS COMPL_CEP,                                 ' + #13#10 +
          '       ''  '' AS UF,                                         ' + #13#10 +
          '       ''                '' AS VL_DOC,                       ' + #13#10 +
          '       ''                '' AS VL_ABAT,                      ' + #13#10 +
          '       ''                '' AS VL_DESC,                      ' + #13#10 +
          '       ''                '' AS VL_MORA,                      ' + #13#10 +
          '       ''                '' AS VL_MULTA,                     ' + #13#10 +
          '       0 AS CODPORTFORMA,                                    ' + #13#10 +
          '       ''  '' AS FORMALANC,                                  ' + #13#10 +
          '       ''               '' AS MATRICULA,                     ' + #13#10 +
          '       0 AS IDTITULAR,                                       ' + #13#10 +
          '       0 AS LINHA                                            ' + #13#10 +
          '  FROM DUAL                                                  ' + #13#10 +
          ' WHERE (1 = 2)                                               ';
  QryDocTxt.Close;
  QryDocTxt.SQL.Clear;
  FazQuery(QryDocTxt, sSQL);
end;

procedure TfrmGeraArquivoRemessaPrevia.AbrirQueryDocTxtLeiaute150;
var
  sSQL: string;
begin
   sSQL := 'SELECT DISTINCT' + #13#10 +
     ' ''123456789012345678'' CONTALIQUIDO,' + #13#10 +
     ' 0 IDPESSOA,' + #13#10 +
     ' ''12345678901234567890123456789012345678901234567890'' NOME,' + #13#10 +
     ' ''12345678901234567890123456789012345678901234567890'' RAZAOSOCIAL,' + #13#10 +
     ' ''123456789012345678'' NUMDOCUMENTO,' + #13#10 +
     ' ''123456789012345'' CONTACORRENTE,' + #13#10 +
     ' ''1234567890'' CODBANCOFAVORECIDO,' + #13#10 +
     ' ''123456789012345'' NUMAGENCIA,' + #13#10 +
     ' ''12345678901234567890123456789012345678901234567890'' LOGRADOURO,' + #13#10 +
     ' ''12345678'' NUMERO,' + #13#10 +
     ' ''12345678901234567890'' COMPLEMENTO,' + #13#10 +
     ' ''12345678901234567890'' BAIRRO,' + #13#10 +
     ' ''12345678901234567890'' CIDADE,' + #13#10 +
     ' ''123'' CODESTADO,' + #13#10 +
     ' ''12345678'' CEP,' + #13#10 +
     ' 0 IDFORCLI,' + #13#10 +
     ' ''1234567890123456789012345'' CODDOCUMENTO,' + #13#10 +
     ' 0.00 VALOR,' + #13#10 +
     ' 0.00 VALORDESCONTO,' + #13#10 +
     ' 0.00 VALORJUROS,' + #13#10 +
     ' ''01/01/1990'' DATAVENCTO,' + #13#10 +
     ' ''01/01/1990'' DATAPROGRAMADA,' + #13#10 +
     ' 0 TIPOMOEDA,' + #13#10 +
     ' 0 NUMLOTE,' + #13#10 +
     ' 0 CODPORTFORMA,' + #13#10 +
     ' 0 CODPORTADOR,' + #13#10 +
     ' 0 CODFORMAPAGTO,' + #13#10 +
     ' 0 CODTIPOPAGTO,' + #13#10 +
     ' ''0'' FLGEMITEAVISO,' + #13#10 +
     ' 0 CODARQUIVOREMESSA,' + #13#10 +
     ' 0 IDBANCO,' + #13#10 +
     ' ''123456789012345'' NOCONTACORR,' + #13#10 +
     ' ''1234567890'' CODBARRA,' + #13#10 +
     ' ''1234567890'' CODBARRAVALOR,' + #13#10 +
     ' ''12345678901234567890'' NODOCUMENTO,' + #13#10 +
     ' ''123'' COMPLDOCUMENTO,' + #13#10 +
     ' ''1'' TIPO,' + #13#10 +
     ' ''12345678901234567890'' NUMEMPRESABANCO,' + #13#10 +
     ' ''1'' DEBCRE,' + #13#10 +
     ' ''1'' TIPOCONTA,' + #13#10 +
     ' ''AGENCIA'' NOMEAGENCIA,' + #13#10 +
     ' 0 AS DMAISALT,' + #13#10 +
     ' 0 AS CODFORMAPGTOALT,' + #13#10 +
     ' 0.00 AS  VALORMAXIMO,' + #13#10 +
     ' ''1234567890123456789012345'' LIVRE,' + #13#10 +
     ' 0 AS IDPLANOPREV' + #13#10 +
     'FROM DUAL' + #13#10 +
     'WHERE 1 = 2 ' ;
  QryDocTxt.Close;
  QryDocTxt.SQL.Clear;
  FazQuery(QryDocTxt, sSQL);
end;


procedure TfrmGeraArquivoRemessaPrevia.AlimentaQryDocTxtLeiaute240(aLinha: Integer);
var
  sLogradouro, sNumero, sComplemento, sBairro,
  sCidade, sCodestado, sCep, sNumdocumento, sNomeRecebedor,
  sMatricula, sContaCorrente, sAgencia, sBanco, sTipoConta, sNomeAgencia, sFormaLanc, sOperacaoConta : string;
  cdsAux: TCMClientDataSet; // Andre Imakawa - SIG 60540
begin
  sLogradouro   := '';
  sNumero       := '';
  sComplemento  := '';
  sBairro       := '';
  sCidade       := '';
  sCodestado    := '';
  sCep          := '';
  sNumdocumento := '';
  qryDadosRec.Close;
  qryDadosRec.ParamByName('IDRESPONSAVEL').AsInteger:= cdsRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
  qryDadosRec.Open;

  if not qryDadosRec.IsEmpty then
  begin
    sLOGRADOURO    := RemoveCaracterEspecial(qryDadosRec.FieldByName('LOGRADOURO').AsString, true);
    sNUMERO        := RemoveCaracterEspecial(qryDadosRec.FieldByName('NUMERO').AsString, true);
    sCOMPLEMENTO   := RemoveCaracterEspecial(qryDadosRec.FieldByName('COMPLEMENTO').AsString, true);
    sBAIRRO        := RemoveCaracterEspecial(qryDadosRec.FieldByName('BAIRRO').AsString, true);
    sCIDADE        := RemoveCaracterEspecial(qryDadosRec.FieldByName('CIDADE').AsString, true);
    sCODESTADO     := RemoveCaracterEspecial(qryDadosRec.FieldByName('CODESTADO').AsString, true);
    sCEP           := RemoveCaracterEspecial(qryDadosRec.FieldByName('CEP').AsString, true);
    sNumdocumento  := RemoveCaracterEspecial(qryDadosRec.FieldByName('NUMDOCUMENTO').AsString, true);

    while Length(sNumdocumento) < 11 do
      sNumdocumento:= '0' + sNumDocumento;
    sNomeRecebedor := qryDadosRec.FieldByName('NOME').AsString;
  end
  else
  begin
    mmResult.Lines.Add('Informações do recebedor ' + cdsRecebedor.FieldByName('IDRESPONSAVEL').AsString +' inexistentes (linha ignorada).');
    Exit;
  end;

  qryDadosAg.Close;
  qryDadosAg.SQL.Clear;
  qryDadosAg.SQL.Add('SELECT 1 AS TIPOCONTA, PA.NOME AS NOMEAGENCIA ');
  qryDadosAg.SQL.Add('FROM AGENCIABANCARIA AG, BANCO BA, PESSOA PA ');
  qryDadosAg.SQL.Add('WHERE AG.NUMAGENCIA = ''' + cdsRecebedor.FieldByName('NUMAGENCIA').AsString + '''');
  qryDadosAg.SQL.Add('AND BA.NUMBANCO = ''' + cdsRecebedor.FieldByName('NUMBANCO').AsString + '''');
  qryDadosAg.SQL.Add('AND BA.IDPESSOA = AG.IDBANCO ');
  qryDadosAg.SQL.Add('AND PA.IDPESSOA = AG.IDPESSOA ');
  qryDadosAg.Open;

  if not qryDadosAg.IsEmpty then
  begin
    sTipoConta   := qryDadosAg.FieldByName('TIPOCONTA').AsString;
    sNomeAgencia := qryDadosAg.FieldByName('NOMEAGENCIA').AsString;
  end
  else
  begin
    mmResult.Lines.Add('Informações de banco e agência '+ cdsRecebedor.FieldByName('NUMBANCO').AsString + '/'+
                       cdsRecebedor.FieldByName('NUMAGENCIA').AsString +' inexistentes (linha ignorada).');
    Exit;
  end;

  sBanco := cdsRecebedor.FieldByName('NUMBANCO').AsString;
  sAgencia := cdsRecebedor.FieldByName('NUMAGENCIA').AsString;

  // Andre Imakawa - SIG 101541 - Inicio
  {
  while Length(sAgencia) < 5 do
    sAgencia := sAgencia + '&';
  }
  // Andre Imakawa - SIG 101541 - Fim

  sContaCorrente:= cdsRecebedor.FieldByName('CONTACORRENTE').AsString;

  if (Trim(sBanco) = '') then
  begin
    mmResult.Lines.Add('Banco nulo '+'/ IdRecebedor:'+
                       cdsRecebedor.FieldByName('IDRESPONSAVEL').AsString + ' (linha ignorada).');
    Exit;
  end;

  if (Trim(sAgencia) = '') then
  begin
    mmResult.Lines.Add('Agência nula '+'/ IdRecebedor:'+
                       cdsRecebedor.FieldByName('IDRESPONSAVEL').AsString +' (linha ignorada).');
    Exit;
  end;

  //Cássio Rovaroto -  SIG nº 60450
  if sBanco = '104' then
  begin
    sOperacaoConta := copy(sContaCorrente, 0, 3);
    if (sOperacaoConta = '013') then
      sFormaLanc := '05'
    else
      sFormaLanc := '01';
  end
  else
    sFormaLanc := '41';

  //CONSIDERA A CONTA CORRENTE IGUAL A ZERO NO CASO DE OP/RECIDO
  if (cdsPortador.FieldByName('TIPOCONTA').AsString <> '4') then
  begin
    if (Trim(sContaCorrente) = '') then
    begin
      mmResult.Lines.Add('Conta corrente nula ' + '/ IdRecebedor:'+
                         cdsRecebedor.FieldByName('IDRESPONSAVEL').AsString +' (linha ignorada).');
      Exit;
    end;
  end;

  try
    cdsDocTxt.Insert;
    cdsDocTxt.FieldByName('IDPESSOA').AsInteger := cdsRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
    cdsDocTxt.FieldByName('NUM_BANCO').asString := '104';
    cdsDocTxt.FieldByName('COD_REG').asString := '3';
    cdsDocTxt.FieldByName('SEG').asString := 'A';
    cdsDocTxt.FieldByName('TIP_MOV').asString := '0';
    cdsDocTxt.FieldByName('COD_INST').asString := '00';
    cdsDocTxt.FieldByName('COD_BAN_D').asString := sBanco;
    cdsDocTxt.FieldByName('COD_AGE_D').asString := ZeroEsquerda(5, Copy(trim(sAgencia), 1, Length(trim(sAgencia)) -1));  // Andre Imakawa - SIG 101541
    cdsDocTxt.FieldByName('DV_AGE_D').asString := Copy(trim(sAgencia), Length(trim(sAgencia)), 1);      // Andre Imakawa - SIG 101541
    cdsDocTxt.FieldByName('CC_D').asString := Copy(sContaCorrente, 1, Length(sContaCorrente) -1);
    cdsDocTxt.FieldByName('DV_CC_D').asString := Copy(sContaCorrente, Length(sContaCorrente), 1);
    cdsDocTxt.FieldByName('DV_AGE_CC_D').asString := ' ';
    cdsDocTxt.FieldByName('NOME').asString := Copy(sNomeRecebedor, 1, 40);
    cdsDocTxt.FieldByName('NUM_DOC').asString := sNumdocumento;
    cdsDocTxt.FieldByName('FILLER').asString := '             ';
    cdsDocTxt.FieldByName('TP_CONT').asString := '1';
    cdsDocTxt.FieldByName('DT_VENC').asString := FormatDateTime('ddmmyyyy', StrToDateTime(edDataFolha.Text));
    cdsDocTxt.FieldByName('TP_MOE').asString :=  'BRL';
    cdsDocTxt.FieldByName('VALOR').asString := StringReplace(FloatToStr(cdsRecebedor.fieldbyname('VALORPROVENTO').AsFloat), '.', '',[rfReplaceAll, rfIgnoreCase]);
    cdsDocTxt.FieldByName('NUM_DOC_BAN').asString := '000000000';
    cdsDocTxt.FieldByName('QTD_PAR').asString := '01';
    cdsDocTxt.FieldByName('IND_BLOQ').asString := 'N';
    cdsDocTxt.FieldByName('IND_FORMA_PAR').asString := '1';
    cdsDocTxt.FieldByName('PER_VENC').asString := FormatDateTime('dd', StrToDateTime(edDataFolha.Text));
    cdsDocTxt.FieldByName('NUM_PAR').asString := '00';
    cdsDocTxt.FieldByName('DT_EFET').asString := '00000000';
    cdsDocTxt.FieldByName('VLR_REAL').asString := '0000000000000';
    cdsDocTxt.FieldByName('INF').asString := '                                        ';
    cdsDocTxt.FieldByName('USO_FEBRABAN').asString := '          ';
    cdsDocTxt.FieldByName('EMITE_AVISO').asString :=  '0';
    cdsDocTxt.FieldByName('OCORRENCIAS').asString := '          ';
    cdsDocTxt.FieldByName('TIP_INSCR').asString := '1';
    cdsDocTxt.FieldByName('NUM_IDENT').asString := sNumdocumento;
    cdsDocTxt.FieldByName('LOGRADOURO').asString := Copy(sLOGRADOURO,1,40);
    cdsDocTxt.FieldByName('NUMERO').asString := Copy(sNUMERO, 1, 9);
    cdsDocTxt.FieldByName('COMPL').asString :=  Copy(sCOMPLEMENTO, 1, 15);
    cdsDocTxt.FieldByName('BAIRRO').asString := Copy(sBAIRRO, 1, 15);
    cdsDocTxt.FieldByName('CIDADE').asString := Copy(sCIDADE, 1, 20);
    cdsDocTxt.FieldByName('CEP').asString :=  Copy(sCEP, 1, 5);
    cdsDocTxt.FieldByName('COMPL_CEP').asString := Copy(sCEP, 6, 3);
    cdsDocTxt.FieldByName('UF').asString := Copy(sCODESTADO, 1, 2);
    cdsDocTxt.FieldByName('VL_DOC').asString := '0000000000000';
    cdsDocTxt.FieldByName('VL_ABAT').asString := '0000000000000';
    cdsDocTxt.FieldByName('VL_DESC').asString := '0000000000000';
    cdsDocTxt.FieldByName('VL_MORA').asString := '0000000000000';
    cdsDocTxt.FieldByName('VL_MULTA').asString := '0000000000000';
    cdsDocTxt.FieldByName('CODPORTFORMA').AsInteger := cdsPortador.FieldByName('CODPORTFORMA').AsInteger;
    cdsDocTxt.FieldByName('FORMALANC').asString := sFormaLanc;

    // Andre Imakawa - SIG 60540 - Inicio

    sMatricula:= cdsRecebedor.FieldByName('MATRICULA').AsString;

    if sMatricula = '' then
    begin
      try
        cdsAux := TCMClientDataSet.Create(nil);
        cdsAux.Data := fCtrlConjuntoRubricas.GetDataPacket('SELECT MATRICULA FROM ELEGPATRO WHERE IDPESSOA = '+ cdsRecebedor.FieldByName('IDTITULAR').AsString);
        sMatricula:= cdsAux.FieldByName('MATRICULA').AsString;
      finally
        FreeAndNil(cdsAux);
      end;
    end;
    cdsDocTxt.FieldByName('MATRICULA').AsString := sMatricula;
    
    cdsDocTxt.FieldByName('IDTITULAR').AsInteger := cdsRecebedor.FieldByName('IDTITULAR').AsInteger;
    cdsDocTxt.FieldByName('LINHA').AsInteger := aLinha;

    // Andre Imakawa - SIG 60540 - Fim
    cdsDocTxt.Post;
  except
    mmResult.Lines.Add('Problema na geração da informação de pagamento do recebedor ' +
                       cdsRecebedor.FieldByName('IDRESPONSAVEL').AsString +' (linha ignorada).')
  end;
end;

procedure TfrmGeraArquivoRemessaPrevia.bbtnEnviarArquivoClick(
  Sender: TObject);
var
  sDiretorio, sNomeArquivo, sConvenio, sDiretorioSrv, sDiretorioBkp : string;
  iNSA: integer;
begin
  inherited;
  dlgEnviarArquivo.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  if dlgEnviarArquivo.Execute then
  begin
    if MsgDlg('Deseja realizar a importação do arquivo?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      Exit
    else
      if MsgDlg('As informações do arquivo selecionado serão consideradas para pagamento.' +#13+
                'Novo sequencial de arquivo será gerado e alterado nesse arquivo.' +#13+
                'Confirma realmente a importação?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        Exit
      else
      begin
        sDiretorio := dlgEnviarArquivo.FileName;
        sNomeArquivo := ExtractFileName(dlgEnviarArquivo.FileName);
        sConvenio := Copy(sNomeArquivo, 14, 6);


        sDiretorio := AlteraNSAArquivo(sDiretorio, sConvenio);

        if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then
        begin
          if FazQuery(qryAux, RetornaDiretorioRemessa(sConvenio)) then
          begin
            if ctrlRemessaEletronica.Impersonate then
            begin
              //Copia arquivo para o servidor
              sDiretorioSrv := qryAux.FieldByName('PATHARQUIVOREM').asString + '\' + sNomeArquivo;
              CopyFile(pChar(sDiretorio), pChar(sDiretorioSrv), False);
              //Copia versão do arquivo para backup
              sDiretorioBkp := qryAux.FieldByName('PATHARQUIVOBACKUP').asString + '\' + sNomeArquivo;
              CopyFile(pChar(sDiretorio), pChar(sDiretorioBkp), False);
              RevertToSelf;
            end;
            MsgDlg('Envio de arquivo realizado com sucesso.', 'Envio de Arquivo Remessa', mtInformation, [mbOk], 0);
          end
          else
          begin
            MsgDlg('Não existe parametrização para o convênio do arquivo selecionado.', 'Erro', mtError, [mbOk], 0);
            Exit
          end;
        end
        else
        begin
          if not DirectoryExists('C:\Planus\Temp\RemessaEletronica\Remessa\')then
            if not CreateDir('C:\Planus\Temp\RemessaEletronica\Remessa\') then
              ForceDirectories('C:\Planus\Temp\RemessaEletronica\Remessa\');

          sDiretorioSrv := 'C:\Planus\Temp\RemessaEletronica\Remessa\' +  sNomeArquivo;
          CopyFile(pChar(sDiretorio), pChar(sDiretorioSrv), False);

          if not DirectoryExists('C:\Planus\Temp\RemessaEletronica\Backup\')then
            if not CreateDir('C:\Planus\Temp\RemessaEletronica\Backup\') then
              ForceDirectories('C:\Planus\Temp\RemessaEletronica\Backup\');

          sDiretorioBkp := 'C:\Planus\Temp\RemessaEletronica\Backup\' + sNomeArquivo;
          CopyFile(pChar(sDiretorio), pChar(sDiretorioBkp), False);
        end;

        
      end;
  end;

  bbtnSair.Enabled := True;
  lbProcessando.Visible := False;
  lbProcessando.Caption :=  'Processando. Aguarde...';
  pBarProcesso.Visible := False;
  bbtnOutro.Visible := False;
  bbtnProcessar.Enabled := True;
end;

procedure TfrmGeraArquivoRemessaPrevia.RegistraTarifaBancaria(
  pIdArquivoPagto, pCodPortForma, pIdPessoa, pNumDoc : Integer; pLotes: string);
var
  sSQL: string;
begin
  sSQL := 'SELECT SEQTARIFAARQPAGTO.NEXTVAL AS ID,                                                                ' +#13#10+
                  IntToStr(pIdArquivoPagto) + ' AS IDARQUIVOPAGTO,                                                ' +#13#10+
                  IntToStr(pNumDoc) + ' AS  CODDOCARQ,                                                            ' +#13#10+
          '       PR.IDPLANOPREV,                                                                                 ' +#13#10+
          '       PR.PROVENTO                                                                                     ' +#13#10+
          '  FROM (SELECT HS.IDRESPONSAVEL,                                                                       ' +#13#10+
          '               HS.IDLOTE,                                                                              ' +#13#10+
          '               (HS.PROVENTO/ HT.PROVENTO) AS PROVENTO,                                                 ' +#13#10+
          '               HS.IDPLANOPREV                                                                          ' +#13#10+
          '          FROM (SELECT HS.IDRESPONSAVEL,                                                               ' +#13#10+
          '                       HS.IDLOTE,                                                                      ' +#13#10+
          '                       HS.IDPLANOPREV,                                                                 ' +#13#10+
          '                        SUM(DECODE(PR.FLGDESCONTO,0,                                                   ' +#13#10+
          '                                   DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO,0),                        ' +#13#10+
          '                                          DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO*-1,0))) AS PROVENTO ' +#13#10+
          '                  FROM PREVIA HS                                                                       ' +#13#10+
          '                  JOIN PROVDESC PR ON PR.IDPROVENTO = HS.IDRUBRICA                                     ' +#13#10+
          '                 WHERE HS.IDLOTE ' + pLotes                                                              +#13#10+
          '                   AND HS.CODPORTFORMA = ' + IntToStr(pCodPortForma)                                     +#13#10+
          '                   AND HS.IDRESPONSAVEL = ' + IntToStr(pIdPessoa)                                        +#13#10+
          '                 GROUP BY HS.IDRESPONSAVEL, HS.IDLOTE, HS.IDPLANOPREV) HS                              ' +#13#10+
          '          JOIN (SELECT IDRESPONSAVEL, IDLOTE, SUM(PROVENTO) AS PROVENTO                                ' +#13#10+
          '                  FROM (SELECT H.IDRESPONSAVEL, H.IDLOTE, H.IDPLANOPREV,                               ' +#13#10+
          '                               SUM(DECODE(P.FLGDESCONTO,0,                                             ' +#13#10+
          '                               DECODE(P.FLGESPECIAL,0,H.VALORPROVENTO,0),                              ' +#13#10+
          '                                      DECODE(P.FLGESPECIAL,0,H.VALORPROVENTO*-1,0))) AS PROVENTO       ' +#13#10+
          '                          FROM PREVIA H                                                                ' +#13#10+
          '                          JOIN PROVDESC P ON P.IDPROVENTO = H.IDRUBRICA                                ' +#13#10+
          '                         WHERE H.IDLOTE ' + pLotes                                                       +#13#10+
          '                           AND H.CODPORTFORMA = ' + IntToStr(pCodPortForma)                              +#13#10+
          '                           AND H.IDRESPONSAVEL = ' + IntToStr(pIdPessoa)                                 +#13#10+
          '                         GROUP BY H.IDRESPONSAVEL, H.IDLOTE, H.IDPLANOPREV)                            ' +#13#10+
          '                 WHERE PROVENTO >= 0.01                                                                ' +#13#10+
          '                 GROUP BY IDRESPONSAVEL, IDLOTE) HT                                                    ' +#13#10+
          '            ON HT.IDLOTE = HS.IDLOTE                                                                   ' +#13#10+
          '           AND HT.IDRESPONSAVEL = HS.IDRESPONSAVEL                                                     ' +#13#10+
          '         WHERE HS.PROVENTO >= 0.01) PR                                                                 ';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(sSQL);
   qryAux.Open;

   while not qryAux.Eof do
   begin
    cdsTarifaArqPagto.Insert;
    cdsTarifaArqPagto.FieldByName('IDTARIFAARQPAGTO').AsInteger := qryAux.FieldByName('ID').AsInteger;
    cdsTarifaArqPagto.FieldByName('IDARQUIVOPAGTO').AsInteger := qryAux.FieldByName('IDARQUIVOPAGTO').AsInteger;
    cdsTarifaArqPagto.FieldByName('CODDOCARQ').AsInteger := qryAux.FieldByName('CODDOCARQ').AsInteger;
    cdsTarifaArqPagto.FieldByName('IDPLANOPREV').AsInteger := qryAux.FieldByName('IDPLANOPREV').AsInteger;
    cdsTarifaArqPagto.FieldByName('PERCENTUAL').asFloat := qryAux.FieldByName('PROVENTO').asFloat;
    cdsTarifaArqPagto.Post;
    qryAux.Next;
   end;
end;

function TfrmGeraArquivoRemessaPrevia.RetornaFormasPagto(
  pCodPortForma: string): String;
begin
  Result := 'SELECT TF.FORMALANC, PF.QTDLINHASLOTE                                                        ' +#13#10+
            '  FROM PORTADORFORMA PF                                                   ' +#13#10+
            '  JOIN FORMARECPAGXTIPOFORMARECPAG FXF ON FXF.CODFORMA = PF.CODFORMA      ' +#13#10+
            '  JOIN TIPOFORMARECPAG TF ON TF.IDTIPOFORMARECPAG = FXF.IDTIPOFORMARECPAG ' +#13#10+
            ' WHERE PF.CODPORTFORMA = ' + pCodPortForma;
end;

procedure TfrmGeraArquivoRemessaPrevia.MontaTarifaArqPagto;
var
  sSQL: String;
begin
  sSQL := 'SELECT IDTARIFAARQPAGTO, ' + #13#10+
          '       IDARQUIVOPAGTO,   ' + #13#10+
          '       CODDOCARQ,        ' + #13#10+
          '       IDPLANOPREV,      ' + #13#10+
          '       PERCENTUAL        ' + #13#10+
          '  FROM TARIFAARQPAGTO    ' + #13#10+
          ' WHERE 1 = 2             ';

  qryTarifaArqPagto.Close;
  qryTarifaArqPagto.SQL.Clear;
  qryTarifaArqPagto.SQL.Add(sSQL);
  qryTarifaArqPagto.Open;
end;

function TfrmGeraArquivoRemessaPrevia.RetornaDiretorioRemessa(
  pConvenio: String): String;
begin
  Result := 'SELECT P.PATHARQUIVOREM,   ' +#13#10+
            '       P.PATHARQUIVOBACKUP ' +#13#10+
            '  FROM PORTADORFORMA P     ' +#13#10+
            ' WHERE P.NUMEMPRESABANCO = ' + QuotedStr(pConvenio);
end;

function TfrmGeraArquivoRemessaPrevia.InsereRemessaPrevia(pNomeArquivo: string): Integer;
var SeqArquivoRemessa: integer;
begin
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add( ' SELECT CM.SEQREMESSAPREVIA.NEXTVAL SEQREMESSA FROM DUAL ');
   qryAux.open;

   SeqArquivoRemessa := qryAux.FieldByName('SEQREMESSA').AsInteger;

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' INSERT INTO CM.REMESSAPREVIA' + #13#10 +
                  '  (IDREMESSAPREVIA,' + #13#10 +
                  '   NOME_ARQUIVO,' + #13#10 +
                  '   NSA)' + #13#10 +
                  ' VALUES( ' + IntToStr(SeqArquivoRemessa) + #13#10 +
                  ' , ' + Quotedstr(pNomeArquivo) + #13#10 +
                  ' , ' + IntToStr(SeqArquivoRemessa) + #13#10 +
                  ' )');


   Result := SeqArquivoRemessa;
   try
      qryAux.ExecSQL;
   except
      Result := 0;
   end;
end;

function TfrmGeraArquivoRemessaPrevia.InsereRemessaPreviaDet(pIdRemessaPrevia, pCodDocArq: Integer;
         pIdTitular, pIdResponsavel, pMatricula: String): Integer;
var SeqArquivoRemessa: integer;
begin
   
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' INSERT INTO CM.REMESSAPREVIA_DETALHE' + #13#10 +
                  '  (IDREMESSAPREVIA,' + #13#10 +
                  '   CODDOCARQ,' + #13#10 +
                  '   IDTITULAR,' + #13#10 +
                  '   IDRESPONSAVEL,' + #13#10 +
                  '   MATRICULA)' + #13#10 +
                  ' VALUES( ' + IntToStr(pIdRemessaPrevia) + #13#10 +
                  ' , ' + IntToStr(pCodDocArq) + #13#10 +
                  ' , ' + pIdTitular + #13#10 +
                  ' , ' + pIdResponsavel + #13#10 +
                  ' , ' + Quotedstr(pMatricula) + #13#10 +
                  ' )');


   Result := 1;
   try
      qryAux.ExecSQL;
   except
      Result := 0;
   end;
end;

Function TfrmGeraArquivoRemessaPrevia.AlteraNSAArquivo(pArquivo, pConvenio: String): String;
var
  arqEntrada, arqSaida: TextFile;
  sLinhaOriginal, sLinhaAlterada: string;
  sNomeArquivo, sNomeArquivoSaida: string;
  iContLinhas, iNSA, iIdRemessa: integer;
begin
  try
    Result := pArquivo;

    iContLinhas := 0;
    sNomeArquivo := ExtractFileName(pArquivo);
    if not DirectoryExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TRANSMITIDOS_SIACC\')then
      if not CreateDir(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TRANSMITIDOS_SIACC\') then
        ForceDirectories(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TRANSMITIDOS_SIACC\');

    sNomeArquivoSaida := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TRANSMITIDOS_SIACC\' + sNomeArquivo;
    AssignFile(arqEntrada, pArquivo);

    ReSet(arqEntrada);


    while not eof(arqEntrada) do
    begin
      inc(iContLinhas);
      ReadLn(arqEntrada, sLinhaOriginal);

      if ((iContLinhas = 1) and (pos('P', copy(sLinhaOriginal, 192, 20)) > 0))or
         (iContLinhas > 1) then
      begin
        if iContLinhas = 1 then
        begin
          AssignFile(arqSaida,sNomeArquivoSaida);
          Rewrite(arqSaida);
          iNSA := GetNumNSA(pConvenio);
          iIdRemessa := StrToInt(copy(copy(sLinhaOriginal, 192, 20), pos('P', copy(sLinhaOriginal, 192, 20))+1,length(copy(sLinhaOriginal, 192, 20)) -(pos('P', copy(sLinhaOriginal, 192, 20)))));
          AtualizaNSARemessa(IntToStr(iIdRemessa), IntToStr(iNSA));
          sLinhaAlterada := copy(sLinhaOriginal, 1 , 157) +  ZeroEsquerda(6, IntToStr(iNSA)) + copy(sLinhaOriginal, 164 , 77);
          Writeln(arqSaida,sLinhaAlterada);
        end
        else
        begin
          Writeln(arqSaida,sLinhaOriginal);
        end;
      end
      else
      begin
        CopyFile(pChar(pArquivo), pChar(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TRANSMITIDOS_SIACC\'), False);
        Break;
      end;
    end;
    Result := sNomeArquivoSaida;

  finally
    closefile(arqEntrada);
    closefile(arqSaida);
  end;
end;

function TfrmGeraArquivoRemessaPrevia.AtualizaNSARemessa(pIdRemessa, pNSA: string): Integer;
begin
   If not dtmBaseDados.dbBaseDados.InTransaction Then
     dtmBaseDados.dbBaseDados.StartTransaction;
     
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' UPDATE CM.REMESSAPREVIA' + #13#10 +
                  ' SET NSA = ' + pNSA + #13#10 +
                  '     , STATUS = 1 ' + #13#10 +
                  ' WHERE IDREMESSAPREVIA = ' + pIdRemessa
                  );

   try
      qryAux.ExecSQL;
      Result := 1;
      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;
   except
      Result := 0;
   end;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FGERAARQUIVOREMESSAPREVIA                                              |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   PROCESSA A GERAÇÃO DE ARQUIVOS BANCÁRIOS PARA TESTE A PARTIR DE LOTES DA   |
| PREVIA PROCESSADOS.                                                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/06/2003 A 03/06/2003                         |
| PENDÊNCIA: 14189                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05c                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| ADAPTAÇÃO PARA FILTRAR BANCOPORTFORMA PELO IDMODULO DA FOLHA (18).           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/06/2003 A 03/06/2003                         |
| PENDÊNCIA: 14017                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05c                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| CRIAR CONTROLE PARA GRAVAR SEMPRE NUMA DETERMINADA PASTA E ALTERAR O NOME DO |
| ARQUIVO GERADO PARA COLOCAR A PALAVRA "PREVIA_", NÚMERO DO LOTE E DESCRIÇÃO  |
| DO PORTADOR FORMA DE PAGAMENTO NO INICIO DO NOME.                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/08/2003 A 06/08/2003                         |
| PENDÊNCIA: 14782                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAR IDTITULAR NO CAMPO NODOCUMENTO DO ARQUIVO ELETRONICO.              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/08/2004 A 23/08/2004                         |
| PENDÊNCIA: 17439                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| PERMITIR A SELEÇÃO DE VÁRIOS LOTES DE PREVIA E DE VÁRIOS PORTADORES DE PAGA- |
| MENTO AO MESMO TEMPO.                                                        |
| INCLUSÃO DO CDSLOTE E CDSPORTADOR. CONTROLE DE GERAÇÃO DO ARQUIVO PELO       |
| CDSPORTADOR.                                                                 |
|                                                                              |
|------------------------------------------------------------------------------}
