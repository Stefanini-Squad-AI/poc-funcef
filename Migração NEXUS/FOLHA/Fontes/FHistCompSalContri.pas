// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************
//--------------------------------------------------------------------------------
// Autor(a)    : Denis Horongoso
// Pendência   : SIG 27748
// Data        : 18/05/2018
// Descricao   : Ajustar a ordenação dos relatórios.
//--------------------------------------------------------------------------------
// Autor(a)    : Everson Luiz Pereira da Cunha
// Pendência   : SIG TIBERO
// Data        : 22/02/2018
// Descricao   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//               Retirada de INDEX, +rule etc.
//               Melhoria realizada para adaptação ao TIBERO.
//--------------------------------------------------------------------------------
// Autor(a)    : Andre Imakawa
// Pendência   : SIG 30775
// Data        : 04/10/2016
// Descricao   : Relatorio apresenta divirgencia com a tela.
//--------------------------------------------------------------------------------
// Autor(a)    : William Santana
// Pendência   : SIG 22962
// Data        : 16/06/2016
// Descricao   : pois não está sendo mostrado em tela a informação do saldo
//               total inicial para compensação para pensionistas
//--------------------------------------------------------------------------------
// Autor(a)    : André Imakawa
// Pendência   : SIG 21958
// Data        : 02/06/2016
// Descricao   : Somatorio do campo Total ja compensado deve ser exibido conforme
//               pessoa selecionada.
//--------------------------------------------------------------------------------
// ROTINA      : (.dfm  align do tbcDetalhe), MontaSelectBeforeOpenCds
// Autor(a)    : edilaine
// Pendência   : SIG 20464
// Data        : 10/05/2016
// Descricao   : para dependente, apresenta critica que não existe valores para
//               compensacao quando deveria verificar pelo titular na bitributacao
//--------------------------------------------------------------------------------
// ROTINA      : (dfm: retirada de edtnome, add cbxnome  bt_atualizarSaldo invisivel)
// Autor(a)    : Higor Nayde
// Pendência   : SOL 242624/17054 Kintana 715180
// Data        : 20/04/2015
// Descricao   : Ajuste para passar a aceitar dependente.
//--------------------------------------------------------------------------------
// Autor(a)    : Douglas.Siqueira
// Pendência   : SOL 219957 Kintana 2052249
// Data        : 21/11/2013
// Descricao   : Controle de acesso para o botão atualizar Saldo da tela Histórico de Compensação de Saldo de Contribuição.
//---------------------------------------------------------


unit FHistCompSalContri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda,
  FTelaAut, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, uMenserro,
  ToolWin, TB97,TB97Tlbr, IvDictio, IvMulti, IvEMulti, ZipDir,wwstorep,
  ppModule, raCodMod, ppVar, ppBands, ppCtrls, jpeg, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db,
  DBTables, Wwquery, Wwdatsrc, MontaSelect, Grids, Wwdbigrd, Wwdbgrid,
  TB97Ctls, DBClient, wwclient, TXComp, TXRB, ppParameter,Pptypes,
  QExport3Dialog, DBCtrls;

type
  TFrmHistCompSalContri = class(TfrmSairAjuda)
//  TFrmHistCompSalContri = class(TfrmOkCancelar)
    MontaSelect: TMontaSelect;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnProcurar: TToolbarButton97;
//    SpeedButton1: TSpeedButton;
    dsDet: TwwDataSource;
    qryDet: TwwQuery;
    qryDetMsReferncia: TStringField;
    qryDetMsCobrana: TStringField;
    qryDetContribuio: TStringField;
    qryDetValorRecebido: TFloatField;
    qryDetndice: TFloatField;
    qryDetValorAtualizado: TFloatField;
    dsDet2: TwwDataSource;
    qryDet2: TwwQuery;
    qryDet2SaldoAnterior: TFloatField;
    qryDet2Valor: TFloatField;
    qryDet2ndice: TFloatField;
    qryDet2Operao: TStringField;
    ppBDEHistComp: TppBDEPipeline;
    ppHistComp: TppReport;
    ppBDEHistContr: TppBDEPipeline;
    ppHistContri: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel19: TppLabel;
    ppImage2: TppImage;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppShape5: TppShape;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppShape8: TppShape;
    pplbl_nomeHisCont: TppLabel;
    pplbl_matriHistCont: TppLabel;
    pplbl_cpfHistCont: TppLabel;
    ppLabel27: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel26: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    raCodeModule1: TraCodeModule;
    ppExtrato: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel68: TppLabel;
    ppImage1: TppImage;
    ppLabel41: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppHeaderBand3: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    pplbl_nomeextrato: TppLabel;
    pplbl_matriculaextrato: TppLabel;
    pplbl_dataadmExtrato: TppLabel;
    pplbl_dataprimExtrato: TppLabel;
    pplbl_sitfunExtrato: TppLabel;
    pplbl_planoExtrato: TppLabel;
    ppShape2: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppShape3: TppShape;
    pplbl_procExtrato: TppLabel;
    pplbl_codvaraExtrato: TppLabel;
    pplbl_nomevaraExtrato: TppLabel;
    pplbl_sitacaoExtrato: TppLabel;
    pplbl_datainiExtrato: TppLabel;
    pplbl_datafinExtrato: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppShape4: TppShape;
    ppDetailBand3: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel18: TppLabel;
    ppBDEExtrato: TppBDEPipeline;
    pnlMestre: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
//    bt_ImprimirExtrato: TSpeedButton;
    bt_atualizarSaldo: TSpeedButton;
    ed_matricula: TEdit;
    ed_cpf: TEdit;
    ed_situacao: TEdit;
    gb_Pg: TGroupBox;
    ed_data_inicio: TEdit;
    gb_Comp: TGroupBox;
    Label6: TLabel;
    Label10: TLabel;
    ed_inicio: TEdit;
    ed_fim: TEdit;
    gb_Valores: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ed_saldoini: TEdit;
    ed_saldocom: TEdit;
    ed_saldo_atu: TEdit;
    gb_Process: TGroupBox;
    ed_processo: TEdit;
    gb_Status: TGroupBox;
    ed_Status: TEdit;
    gb_Data: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    ed_DataIni: TEdit;
    ed_DataFin: TEdit;
    gb_Vara: TGroupBox;
    Label3: TLabel;
    Label11: TLabel;
    ed_CodVar: TEdit;
    ed_NomeVar: TEdit;
    tbcDetalhe: TTabControl;
    wwDBGrid2: TwwDBGrid;
    wwDBGrid1: TwwDBGrid;
    SpeedButton1: TSpeedButton;
    bt_ImprimirExtrato: TSpeedButton;
    chk_AcaoJud: TCheckBox;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    wwClientDataSet1: TwwClientDataSet;
    qryDetOperao: TStringField;
    lbl_saldo: TLabel;
    qryDet2MsPagamento: TStringField;
    qryDet2SaldoAtual: TFloatField;
    ppLabel42: TppLabel;
    ppShape9: TppShape;
    ppLabel46: TppLabel;
    ppDBText20: TppDBText;
    ppParameterList1: TppParameterList;
    ppTitleBand3: TppTitleBand;
    ppLabel28: TppLabel;
    ppImage3: TppImage;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppShape6: TppShape;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppShape7: TppShape;
    plbl_nomeHisComp: TppLabel;
    pplbl_matriHistComp: TppLabel;
    pplbl_cpfHistComp: TppLabel;
    ppLabel44: TppLabel;
    ppLabel40: TppLabel;
    ppLabel43: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabel45: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSystemVariable7: TppSystemVariable;
    ExtraOptions1: TExtraOptions;
    QExport3Dialog1: TQExport3Dialog;
    ppShape10: TppShape;
    ppShape11: TppShape;
    qryExtrato: TwwQuery;
    dsExtrato: TwwDataSource;
    ppLabel47: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lbl_fontepaga: TppLabel;
    ppLabel59: TppLabel;
    lbl_cnpf: TppLabel;
    ppLabel58: TppLabel;
    lbl_cpf: TppLabel;
    qryDet2Refernciandice: TStringField;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppBDEExtratoppField7: TppField;
    ppBDEExtratoppField8: TppField;
    ppBDEExtratoppField9: TppField;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    qryExtratoSaldoAnterior: TFloatField;
    qryExtratoValor: TFloatField;
    qryExtratoSaldoAtual: TFloatField;
    qryExtratoIndice: TFloatField;
    qryExtratoOperao: TStringField;
    qryExtratoReferenciaIndice: TStringField;
    qryExtratoMesdePagamento: TStringField;
    qryExtratoMesReferencia: TStringField;
    cbxNome: TComboBox;
    ppDBText24: TppDBText;
    qryExtratoMatricula: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    qryDet2MsReferncia: TStringField;
    qryDet2Matrcula: TStringField;
    qryNome: TwwQuery;




   procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    function getSitucaoParticipante(_idpessoa:string):string;
    function getTotalCompensado(_idpessoa, _idtitular:string):string; // André Imakawa - SIG 21958
    function getSaldoAtualizadoaCompensar(_idpessoa:string):string;
    function getTotalInicial(_idpessoa:string):string;
    procedure getDadosParticipante(var _matricula,_cpf:TEdit;_idpessoa:string);
    procedure getDadosCompen(var _inicio,_fim:TEdit;_idpessoa:string);
    procedure getDadosAcaoJudicial(var _nprocesso,_status,_codvar,_nmvara,_dataini,_datafim:TEdit;_idpessoa:string);
    function getPrimeiroPagamento(_idpessoa:string):string;
    procedure execConsultaHistoricoContribuicoes(var _query:TwwQuery;_idpessoa:string);
    procedure execConsultaExtratoContribuicoes(var _query:TwwQuery;_matricula:string);
    procedure execConsultaExtratoContribuicoes2(var _query:TwwQuery;_idpessoa:string);
    procedure execConsultaHistoricoCompensacao(var _query:TwwQuery;_idpessoa:string);
    procedure setStatusBotaoAtualizarSaldo(_botao:TSpeedButton;_idpessoa:string);
    procedure execProcedureAtualizaSaldo(_idpessoa:string);
    procedure tbcDetalheChange(Sender: TObject);
    procedure bt_atualizarSaldoClick(Sender: TObject);
    procedure ppHeaderBand3BeforePrint(Sender: TObject);
    procedure bt_ImprimirExtratoClick(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
//    procedure SpeedButton1Click(Sender: TObject);
    procedure ppHeaderBand2BeforePrint(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure chk_AcaoJudClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MontaSelectAfterOpenCds(oCds: TClientDataSet);
    Procedure LimpaEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure setStatusAcaoJudicial(var _check:TCheckBox;_idpessoa:string);
    function getStatusAcaoJudicial(_idpessoa:string):Boolean;
    function AlinhaEdit(var Edt: TEdit): TEdit;
    procedure ExecSaveRel(var Rpt:TppReport);


  private
    { Private declarations }
  public
    { Public declarations }
      procedure setPadraoGrid();
  end;

var
  FrmHistCompSalContri: TFrmHistCompSalContri;

  idpessoa, idtitular:string;//André Imakawa - SIG 21958
  planoNome,DataInsc:string;
  padrao:Boolean;

implementation
   uses
   FPreview,DBaseDados,USistema,fMostraRelat;

{$R *.DFM}

procedure TFrmHistCompSalContri.MontaSelectBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
const
 //edilaine - SIG 20464 - inicio
 //sFiltro = ' B.IDPESSOA = D.IDPESSOA  AND  P.IDPESSOA = D.IDPESSOA ';       //higor nayde SOL 242624/17054
 sFiltro = ' B.IDTITULAR = D.IDTITULAR  AND  P.IDPESSOA = D.IDPESSOA ';
 //edilaine - SIG 20464 - fim

// sFiltro = ' B.IDPESSOA = D.IDPESSOA  AND  P.IDPESSOA = D.IDPESSOA AND D.IDPESSOA = D.IDTITULAR ';
//
//' EXISTS '+
//' (SELECT 1 '+
//'    FROM PARTPREVPLAN PPP '+
//'   WHERE PPP.IDPESSOA = D.IDPESSOA '+
//'     AND ((PPP.FLGDESATIVADO = 0 AND PPP.IDSITPLANOPREV NOT IN (3, 26)) OR '+
//'         (PPP.IDSITPLANOPREV IN (25, 27, 28, 29) AND EXISTS '+
//'          (SELECT 1 '+
//'              FROM PARTPREVPLAN PPP1 '+
//'             WHERE PPP1.IDPESSOA = D.IDPESSOA '+
//'               AND PPP1.IDPESSOA = D.IDTITULAR '+
//'               AND PPP1.IDPLANOPREV IN (74, 75) '+
//'               AND PPP1.FLGDESATIVADO = 0 '+
//'               AND PPP1.IDSITPLANOPREV NOT IN (3, 26))))) '+
//' AND '+
//
//' ((''2008/01'' <= '+
//' (SELECT MIN(HR.MESCOBRANCA) '+
//'      FROM HISTRUBSAL HR, PROVDESC PD '+
////'     WHERE HR.IDRESPONSAVEL = D.IDPESSOA '+
//'     WHERE HR.IDPESSOA = D.IDPESSOA '+
//'       AND HR.IDTITULAR  = D.IDTITULAR  '+
//'       AND HR.IDRUBRICA = PD.IDPROVENTO '+
//'       AND HR.FONTEPAGADORA = 1 '+
//'       AND (PD.FLGEXIBEHIST = ''B'' OR '+
//'           (HR.FLGTIPODESC = ''B'' AND EXISTS '+
//'            (SELECT 1 '+
//'                FROM BENEFPLANPREV BP '+
//'               WHERE HR.IDBENEFICIO = BP.IDBENEFICIO '+
//'                 AND HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO, '+
//'                                      BP.IDRUBRICAATRASO, '+
//'                                      BP.IDRUBRICA, '+
//'                                      BP.IDRUBABONO, '+
//'                                      BP.IDRUBANTECABONO, '+
//'                                      BP.IDRUBDESCANTECAB, '+
//'                                      BP.IDRUBDEVOLUCAO, '+
//'                                      BP.IDRUBRICADIF, '+
//'                                      BP.IDRUBRICACORRECAO, '+
//'                                      BP.IDRUBDEVOLABONO, '+
//'                                      BP.IDRUBADIANT, '+
//'                                      BP.IDRUBDEVOLADIANT, '+
//'                                      BP.IDRUBADIANT13, '+
//'                                      BP.IDRUBDEVADIANT13, '+
//'                                      BP.IDRUBACERTOABONO, '+
//'                                      BP.IDRUBDEVANTABONO, '+
//'                                      BP.IDRUBATRASOABONO, '+
//'                                      BP.IDRUBATR13ACJUD, '+
//'                                      BP.IDRUBDEV13ACJUD, '+
//'                                      BP.IDRUBATRREVACJUD, '+
//'                                      BP.IDRUBDEVREVACJUD, '+
//'                                      BP.IDRUBATRREVISAO, '+
//'                                      BP.IDRUBDEVREVISAO, '+
//'                                      BP.IDRUBRICAQUITANT, '+
//'                                      BP.IDRUBNORADICJUD, '+
//'                                      BP.IDRUBATRADICJUD, '+
//'                                      BP.IDRUBDEVADICJUD, '+
//'                                      BP.IDRUBABONOFIM)))))) OR '+
//
//' NOT EXISTS '+
//'  (SELECT 1 '+
//'     FROM HISTRUBSAL HR, PROVDESC PD '+
//'    WHERE HR.IDPESSOA = D.IDPESSOA '+
//'       AND HR.IDTITULAR  = D.IDTITULAR  '+
////'    WHERE HR.IDRESPONSAVEL = D.IDPESSOA '+
//'      AND HR.IDRUBRICA = PD.IDPROVENTO '+
//'      AND HR.FONTEPAGADORA = 1 '+
//'      AND (PD.FLGEXIBEHIST = ''B'' OR '+
//'          (HR.FLGTIPODESC = ''B'' AND EXISTS '+
//'           (SELECT 1 '+
//'               FROM BENEFPLANPREV BP '+
//'              WHERE HR.IDBENEFICIO = BP.IDBENEFICIO '+
//'                AND HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO, '+
//'                                     BP.IDRUBRICAATRASO, '+
//'                                     BP.IDRUBRICA, '+
//'                                     BP.IDRUBABONO, '+
//'                                     BP.IDRUBANTECABONO, '+
//'                                     BP.IDRUBDESCANTECAB, '+
//'                                     BP.IDRUBDEVOLUCAO, '+
//'                                     BP.IDRUBRICADIF, '+
//'                                     BP.IDRUBRICACORRECAO, '+
//'                                     BP.IDRUBDEVOLABONO, '+
//'                                     BP.IDRUBADIANT, '+
//'                                     BP.IDRUBDEVOLADIANT, '+
//'                                     BP.IDRUBADIANT13, '+
//'                                     BP.IDRUBDEVADIANT13, '+
//'                                     BP.IDRUBACERTOABONO, '+
//'                                     BP.IDRUBDEVANTABONO, '+
//'                                     BP.IDRUBATRASOABONO, '+
//'                                     BP.IDRUBATR13ACJUD, '+
//'                                     BP.IDRUBDEV13ACJUD, '+
//'                                     BP.IDRUBATRREVACJUD, '+
//'                                     BP.IDRUBDEVREVACJUD, '+
//'                                     BP.IDRUBATRREVISAO, '+
//'                                     BP.IDRUBDEVREVISAO, '+
//'                                     BP.IDRUBRICAQUITANT, '+
//'                                     BP.IDRUBNORADICJUD, '+
//'                                     BP.IDRUBATRADICJUD, '+
//'                                     BP.IDRUBDEVADICJUD, '+
//'                                     BP.IDRUBABONOFIM)))))) '+
//' AND '+
//
//' EXISTS '+
//' (SELECT 1 '+
//'    FROM HSTCONTRIBPREV HC '+
//'    JOIN CONTPREV C '+
//'      ON C.IDCONTRIBUICAO = HC.IDCONTRIBUICAO '+
//'   WHERE HC.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND ''31/12/1995'' '+
//'     AND HC.SITRECEBIMENTO IN (2, 3) '+
//'     AND HC.IDPESSOA = D.IDPESSOA '+
//'     AND C.FLGPAGADOR = ''C'' HAVING SUM(DECODE(HC.FLGDEVOLUCAO, '+
//'                    0, '+
//'                    (CASE '+
//'                      WHEN HC.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND ''15/01/1989'' THEN '+
//'                       HC.VALORRECEBIDO / 2750000000 '+
//'                      WHEN HC.DATARECEBIMENTO BETWEEN ''16/01/1989'' AND ''31/07/1993'' THEN '+
//'                       HC.VALORRECEBIDO / 2750000 '+
//'                      WHEN HC.DATARECEBIMENTO BETWEEN ''01/08/1993'' AND ''30/06/1994'' THEN '+
//'                       HC.VALORRECEBIDO / 2750 '+
//'                      ELSE '+
//'                       HC.VALORRECEBIDO '+
//'                    END), '+
//'                    - (CASE '+
//'                        WHEN HC.DATARECEBIMENTO BETWEEN ''01/01/1989'' AND ''15/01/1989'' THEN '+
//'                         HC.VALORRECEBIDO / 2750000000 '+
//'                        WHEN HC.DATARECEBIMENTO BETWEEN ''16/01/1989'' AND ''31/07/1993'' THEN '+
//'                         HC.VALORRECEBIDO / 2750000 '+
//'                        WHEN HC.DATARECEBIMENTO BETWEEN ''01/08/1993'' AND ''30/06/1994'' THEN '+
//'                         HC.VALORRECEBIDO / 2750 '+
//'                        ELSE '+
//'                         HC.VALORRECEBIDO '+
//'                      END))) > 0) ';

begin
//  inherited;

if pos('WHERE',sqlText)>0 then
   Begin
    sqlText := sqlText + sFiltro;
    sqlText := StringREplace(sqlText,'ORDER BY C0 ASC','AND',[rfReplaceall]);
   end
else
    begin

    sqlText := sqlText + sFiltro;
    sqlText := StringREplace(sqlText,'ORDER BY C0 ASC','WHERE',[rfReplaceall]);

    end;

///sqlText :=   StringREplace(sqlText,'ORDER BY C0 ASC ',' AND ',[rfReplaceall]);

end;

procedure TFrmHistCompSalContri.sbtnProcurarClick(Sender: TObject);
var
  query:TwwQuery;
begin
sbtnProcurar.Down:=False;

MontaSelect.Executar;
if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '') then
   begin
   bt_ImprimirExtrato.Enabled:=false;
   bt_atualizarSaldo.Enabled:=false;
   setPadraoGrid;
   LimpaEdit;
   idpessoa:=MontaSelect.ValoresChave[0];
   idtitular:=MontaSelect.ValoresChave[1]; // André Imakawa - SIG 21958
   end
else
  begin
  bt_ImprimirExtrato.Enabled:=false;
  bt_atualizarSaldo.Enabled:=false;
  LimpaEdit;
  setPadraoGrid;
  exit;
  end;



planoNome:='';
DataInsc:='';

getDadosParticipante(ed_matricula,ed_cpf,idpessoa);//higor nayde SOL 242624/17054
ed_situacao.Text:=getSitucaoParticipante(idpessoa);
ed_data_inicio.Text:=getPrimeiroPagamento(idpessoa);
getDadosCompen(ed_inicio,ed_fim,idpessoa);

//ed_saldoini.Text:=getTotalInicial(idpessoa); //William Santana - SIG 22962
  ed_saldoini.Text:=getTotalInicial(idtitular); //William Santana - SIG 22962
IF ed_saldoini.Text<>'' then
   ed_saldoini.Text:=FormatFloat('#,##0.00',strtofloat(ed_saldoini.Text));

ed_saldocom.text:=getTotalCompensado(idpessoa, idtitular);  // André Imakawa - SIG 21958
IF ed_saldocom.Text<>'' then
   ed_saldocom.Text:=FormatFloat('#,##0.00',strtofloat(ed_saldocom.Text));

//ed_saldo_atu.Text:=getSaldoAtualizadoaCompensar(idpessoa); //William Santana - SIG 22962
ed_saldo_atu.Text:=getSaldoAtualizadoaCompensar(idtitular);  //William Santana - SIG 22962
IF ed_saldo_atu.Text<>'' then
   ed_saldo_atu.Text:=FormatFloat('#,##0.00',strtofloat(ed_saldo_atu.Text));

if ed_data_inicio.Text<>'' then
    if (Int(StrToDate(ed_data_inicio.Text))>=Int(StrToDate('31/01/2008'))) and (Int(StrToDate(ed_data_inicio.Text))<=Int(StrToDate('31/12/2012'))) then
        ed_saldo_atu.Text:='0.00';




getDadosAcaoJudicial(ed_processo,ed_Status,ed_CodVar,ed_NomeVar,ed_DataIni,ed_DataFin,idpessoa);

tbcDetalhe.TabIndex:=0;
execConsultaHistoricoCompensacao (qryDet2,idpessoa);


wwDBGrid1.Visible:=True;
wwDBGrid2.Visible:=False;

setStatusBotaoAtualizarSaldo(bt_atualizarSaldo,idpessoa);

bt_ImprimirExtrato.Enabled:=True;

if (ed_saldo_atu.text <> '0') and (ed_saldo_atu.text <> '') and (ed_saldo_atu.text <> '0.00') then
    ed_fim.Text:='';
//if (ed_saldo_atu.Text<>'0') and (ed_saldo_atu.Text<>'') then
//   bt_ImprimirExtrato.Enabled:=True
//else
//   begin
//   bt_ImprimirExtrato.Enabled:=False;
// //  MsgDlg( 'A matrícula selecionada não possui saldo de contribuições calculado.','Informação',mtInformation,[mbOk],0)
//   end;



chk_AcaoJud.Enabled:=False;
query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';
query.Close;
query.SQL.Clear;

//query.SQL.Add('SELECT *');
//query.SQL.Add('  FROM AUTORIZA');
//query.SQL.Add(' WHERE IDOPERFUNC = (SELECT IDOPERFUNC');
//query.SQL.Add('  FROM OPERFUNC');
//query.SQL.Add(' WHERE IDMODULO = 18');
//query.SQL.Add('   AND IDOPERACAO <> 1');
//query.SQL.Add('   AND IDFUNCAO =');
//query.SQL.Add('       (SELECT IDFUNCAO');
//query.SQL.Add('          FROM FUNCAO');
//query.SQL.Add('         WHERE UPPER(NOMEFUNCAO) =');
//query.SQL.Add('               UPPER(''HISTÓRICO DE COMPENSAÇÃO DE SALDO DE CONTRIBUIÇÕES'')))');
//query.SQL.Add(' WHERE IDOPERFUNC = 19475');
//query.SQL.Add('   AND IDESPACESSO ='+inttostr(Sistema.IdEspAcesso));


query.SQL.Add('SELECT *');
query.SQL.Add('  FROM AUTORIZA');
query.SQL.Add(' WHERE IDOPERFUNC IN');
query.SQL.Add('       (SELECT IDOPERFUNC');
query.SQL.Add('          FROM OPERFUNC');
query.SQL.Add('         WHERE IDMODULO = 18');
query.SQL.Add('           AND IDOPERACAO <> 1 AND IDOPERACAO <>121');
query.SQL.Add('           AND IDFUNCAO =');
query.SQL.Add('               (SELECT IDFUNCAO');
query.SQL.Add('                  FROM FUNCAO');
query.SQL.Add('                 WHERE UPPER(NOMEFUNCAO) =');
query.SQL.Add('                       UPPER(''HISTÓRICO DE COMPENSAÇÃO DE SALDO DE CONTRIBUIÇÕES'')))');
query.SQL.Add('   AND IDESPACESSO IN');
query.SQL.Add('       (SELECT IDESPACESSO');
query.SQL.Add('          FROM GRUPOACESSO');
query.SQL.Add('         WHERE IDGRUPO IN');
query.SQL.Add('               (SELECT IDGRUPO');
query.SQL.Add('                  FROM GRUPOUSU');
query.SQL.Add('                 WHERE IDUSUARIO = (SELECT IDUSUARIO');
query.SQL.Add('                                      FROM USUARIOSISTEMA');
query.SQL.Add('                                     WHERE IDESPACESSO ='+inttostr(Sistema.IdEspAcesso)+')))');




query.Active:=true;
if not query.IsEmpty then
   begin
   chk_AcaoJud.Enabled:=True;
   bbtnConfirmar.Enabled:=True;
   bbtnCancelar.Enabled:=True;
   end
else
   begin


   query.Close;
   query.SQL.Clear;

    query.SQL.Add('SELECT *');
    query.SQL.Add('  FROM AUTORIZA');
    query.SQL.Add(' WHERE IDOPERFUNC IN (SELECT IDOPERFUNC');
    query.SQL.Add('  FROM OPERFUNC');
    query.SQL.Add(' WHERE IDMODULO = 18');
    query.SQL.Add('   AND IDOPERACAO <> 1 AND IDOPERACAO <>121 ');
    query.SQL.Add('   AND IDFUNCAO =');
    query.SQL.Add('       (SELECT IDFUNCAO');
    query.SQL.Add('          FROM FUNCAO');
    query.SQL.Add('         WHERE UPPER(NOMEFUNCAO) =');
    query.SQL.Add('               UPPER(''HISTÓRICO DE COMPENSAÇÃO DE SALDO DE CONTRIBUIÇÕES'')))');
    query.SQL.Add('   AND IDESPACESSO ='+inttostr(Sistema.IdEspAcesso));
    query.Active:=true;
    if not query.IsEmpty then
       begin
       chk_AcaoJud.Enabled:=True;
       bbtnConfirmar.Enabled:=True;
       bbtnCancelar.Enabled:=True;

       end
    else
       begin


       chk_AcaoJud.Enabled:=false;
       bbtnConfirmar.Enabled:=false;
       bbtnCancelar.Enabled:=false;

       end;


   end;

query.Active:=false;
query.destroy;

AlinhaEdit(ed_saldoini);
AlinhaEdit(ed_saldocom);
AlinhaEdit(ed_saldo_atu);
//setStatusAcaoJudicial(chk_AcaoJud,idpessoa);
padrao:=True;
chk_AcaoJud.Checked:= getStatusAcaoJudicial(idpessoa);

end;

procedure TFrmHistCompSalContri.bbtnSairClick(Sender: TObject);
begin
 // inherited;
FrmHistCompSalContri.Close;
end;

function TFrmHistCompSalContri.getSitucaoParticipante(
  _idpessoa: string): string;
var
  query:TwwQuery;
begin

query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';

query.SQL.Add('SELECT PA.IDPLANOPREV,');
query.SQL.Add('       PA.SEQPROPOSTA,');
query.SQL.Add('       PA.IDPESSJUR,       ');
query.SQL.Add('       PL.NOME,');
query.SQL.Add('       DECODE(PA.FLGDESATIVADO, 1, ''DESATIVADO'', 0, ''ATIVO'', NULL, ''ATIVO'') AS STATUS,       ');
query.SQL.Add('       SIT.DESCRICAO    AS SIT,');
query.SQL.Add('       PL.IDRGELEGBENEF,');
query.SQL.Add('       SITPP.DESCRICAO  AS SITPLANO,       ');
query.SQL.Add('       PA.INSCRICAODATA,');
query.SQL.Add('       PA.INSCRICAONUMERO,');
query.SQL.Add('       PA.DATACANCELAMENTO,');
query.SQL.Add('       EVENT.DATAMIGRACAO');
query.SQL.Add('  FROM PARTPREVPLAN PA,');
query.SQL.Add('       PLANPREV     PL,');
query.SQL.Add('       SITPART      SIT,');
query.SQL.Add('       SITPLANOPREV SITPP,       ');
query.SQL.Add('       (SELECT EP.IDPESSOA,');
query.SQL.Add('               EP.IDPLANOPREV,');
query.SQL.Add('               EP.IDPESSJUR,               ');
query.SQL.Add('               TO_CHAR(EP.DATAEVENTO, ''DD/MM/YYYY'') AS DATAMIGRACAO        ');
query.SQL.Add('          FROM EVENTOGERADOR EG, EVENTOSPREV EP, PARTPREVPLAN PP        ');
query.SQL.Add('         WHERE EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR');
query.SQL.Add('           AND EG.FLGINTERNO = ''TP''');
query.SQL.Add('           AND PP.IDPESSOA ='+_idpessoa);
query.SQL.Add('           AND PP.IDPESSOA = EP.IDPESSOA');
query.SQL.Add('           AND PP.IDPLANOPREV = EP.IDPLANOPREV');
query.SQL.Add('           AND PP.IDPESSJUR = EP.IDPESSJUR) EVENT,');
query.SQL.Add('       ELEGPATRO EL');
query.SQL.Add(' WHERE (EL.IDPESSOA = '+_idpessoa+' )');
query.SQL.Add('   AND (EL.IDPESSOA = PA.IDPESSOA(+))      ');
query.SQL.Add('   AND (EL.IDPESSJUR = PA.IDPESSJUR(+))      ');
query.SQL.Add('   AND (PL.IDPLANOPREV = PA.IDPLANOPREV)      ');
query.SQL.Add('   AND (PA.IDSITPART = SIT.IDSITPART(+))      ');
//query.SQL.Add('   AND (PA.IDPESSJUR = <IDPESSJUR>)      ');
query.SQL.Add('   AND (PA.IDSITPLANOPREV = SITPP.IDSITPLANOPREV)      ');
query.SQL.Add('   AND (EVENT.IDPESSOA(+) = PA.IDPESSOA)      ');
query.SQL.Add('   AND (EVENT.IDPLANOPREV(+) = PA.IDPLANOPREV)      ');
query.SQL.Add('   AND (PA.DATACANCELAMENTO = EVENT.DATAMIGRACAO(+))');
query.SQL.Add(' ORDER BY PA.FLGDESATIVADO');
query.Active:=True;

if not query.IsEmpty then
   begin
     Result:= query.fieldbyname('SIT').AsString;
     planoNome:=query.fieldbyname('NOME').AsString;
     DataInsc:=query.fieldbyname('INSCRICAODATA').AsString ;
   end;

query.Close;
query.Destroy;


end;

function TFrmHistCompSalContri.getTotalCompensado(
  _idpessoa, _idtitular: string): string;
var
  query:TwwQuery;
begin

query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';


query.Close;
query.SQL.Clear;
//query.SQL.Add('SELECT SALDO');
//query.SQL.Add('  from HSTBITRIBUTACAO');
//query.SQL.Add(' WHERE IDPESSOA = '+_idpessoa);
//query.SQL.Add(' AND OPERACAO = '+#39+'S'+#39);

query.SQL.Add(' SELECT nvl(SUM(VALOR),0)VALOR');
query.SQL.Add('   FROM HSTBITRIBUTACAO');
query.SQL.Add('  WHERE OPERACAO = ''S''');
// Andre Imakawa - SIG 21958 - Inicio
if _idpessoa <> _idtitular then
   query.SQL.Add('    AND IDPESSOA = '+_idpessoa);
query.SQL.Add('    AND IDTITULAR = '+_idtitular);
// Andre Imakawa - SIG 21958 - Fim

query.Active:=True;
query.last;

if not query.IsEmpty then
   Result:= query.fieldbyname('VALOR').AsString ;

query.Close;
query.Destroy;

end;

function TFrmHistCompSalContri.getSaldoAtualizadoaCompensar(
  _idpessoa: string): string;
var
  query:TwwQuery;
begin

query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';


query.Close;
query.SQL.Clear;
query.SQL.Add(' SELECT SALDO ');
query.SQL.Add('  FROM BITRIBUTACAO');
query.SQL.Add(' WHERE IDPESSOA = '+_idpessoa);
query.Open;
if not query.IsEmpty then
   Result:=query.fieldbyname('SALDO').AsString
else
   Result:='0';

query.Close;
query.Destroy;



end;

procedure TFrmHistCompSalContri.getDadosParticipante(var _matricula,
  _cpf: TEdit;_idpessoa:string);
var
  query:TwwQuery;//higor nayde SOL 242624/17054
  vIdTitular:Boolean;   //higor nayde SOL 242624/17054
begin

  query := TwwQuery.Create(Application);
  query.DataBaseName := 'BaseDados';


  query.Close;
  query.SQL.Clear;
//  QUERY.SQL.Add('SELECT MATRICULA, NOME, NUMDOCUMENTO,IDTITULAR ');  //higor nayde SOL 242624/17054             //Everson TIBERO
  QUERY.SQL.Add('SELECT DP.MATRICULA, P.NOME, P.NUMDOCUMENTO, DP.IDTITULAR ');  //higor nayde SOL 242624/17054    //Everson TIBERO
  QUERY.SQL.Add('  FROM DEPENTIT DP');
  QUERY.SQL.Add('  JOIN PESSOA P');
  QUERY.SQL.Add('    ON P.IDPESSOA = DP.IDPESSOA');
  QUERY.SQL.Add(' WHERE DP.IDPESSOA = '+_idpessoa);
  QUERY.open;

  if not query.IsEmpty then
  begin
      //_nome.Text:=QUERY.fieldbyname('NOME').Text;   //higor nayde SOL 242624/17054
      _matricula.Text:=QUERY.fieldbyname('MATRICULA').Text;
      _cpf.Text:=QUERY.fieldbyname('NUMDOCUMENTO').Text;
      //idpessoa:=QUERY.fieldbyname('IDTITULAR').Text;  //higor nayde SOL 242624/17054
  end;

  query.Close;
  query.Destroy;
  //higor nayde SOL 242624/17054
  qryNome.Close;
  qryNome.SQL.Clear;
  qryNome.SQL.Add('Select NOME,IDPESSOA                           ');
  qryNome.SQL.Add('    FROM pessoa                      ');
  qryNome.SQL.Add('   where idpessoa in                 ');
  qryNome.SQL.Add('    (Select IDPESSOA                 ');
  qryNome.SQL.Add('      from depentit                  ');
  qryNome.SQL.Add('   where idPESSOA = '+_idpessoa);
  qryNome.SQL.Add('    and IDTITULAR <> idpessoa)       ');
  qryNome.open;
  vIdTitular := qryNome.IsEmpty;
  //higor nayde SOL 242624/17054
  if  vIdTitular then begin
    qryNome.Close;
    qryNome.SQL.Clear;
    qryNome.SQL.Add(' Select NOME, IDPESSOA                   ');
    qryNome.SQL.Add('  FROM pessoa                  ');
    qryNome.SQL.Add(' where idpessoa in             ');
    qryNome.SQL.Add('  (Select IDPESSOA             ');
    qryNome.SQL.Add('    from depentit              ');
    qryNome.SQL.Add(' where idtitular =  '+MontaSelect.ValoresChave[1]+')');
    qryNome.open;
  end;

  qryNome.First;
  cbxNome.Items.Clear;
  if not qryNome.IsEmpty then begin
     while not qryNome.Eof do
      begin
       cbxNome.Items.Add(qryNome.fieldbyname('NOME').Text);
       qryNome.Next;
      end;
  end;

  cbxNome.ItemIndex := 0;
  //DBComboBox1.Items.Clear;

end;

function TFrmHistCompSalContri.getTotalInicial(_idpessoa: string): string;
var
  query:TwwQuery;
  query2:TwwQuery;
begin

query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';

query2 := TwwQuery.Create(Application);
query2.DataBaseName := 'BaseDados';

query2.Close;
query2.SQL.Clear;
query2.SQL.Add('SELECT MIN(MESREFERENCIA)MESREFERENCIA');
query2.SQL.Add('  from HSTBITRIBUTACAO');
query2.SQL.Add(' WHERE IDPESSOA = '+_idpessoa);
query2.SQL.Add(' AND OPERACAO = '+#39+'S'+#39);
query2.Open;


query.Close;
query.SQL.Clear;

query.SQL.Add('SELECT SALDO');
query.SQL.Add('  FROM HSTBITRIBUTACAO');
query.SQL.Add(' WHERE IDPESSOA = '+_idpessoa);
query.SQL.Add(' AND OPERACAO = ''A''');
if (query2.fieldbyname('MESREFERENCIA').Text<>'') and (query2.fieldbyname('MESREFERENCIA').Text<>null) then
   query.SQL.Add('  AND MESREFERENCIA<='+#39+query2.fieldbyname('MESREFERENCIA').Text+#39);
query.SQL.Add('ORDER BY  MESREFERENCIA DESC');
query.Open;
query.First;


if not query.IsEmpty then
   Result:=query.fieldbyname('SALDO').AsString;



query.Close;
query.Destroy;


query2.Close;
query2.Destroy;




end;

procedure TFrmHistCompSalContri.getDadosCompen(var _inicio, _fim: TEdit;_idpessoa:string);
var
  query:TwwQuery;
 begin

query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';

query.Close;
query.SQL.Clear;
query.SQL.Add(' SELECT MIN(MESCOBRANCA)MESCOBRANCA ');
query.SQL.Add('  from HSTBITRIBUTACAO');
query.SQL.Add(' WHERE IDPESSOA = '+_idpessoa);
query.SQL.Add(' AND OPERACAO = '+#39+'S'+#39);
query.Open;
if not query.IsEmpty then
   _inicio.Text:=query.fieldbyname('MESCOBRANCA').Text;
query.Close;

query.Close;
query.SQL.Clear;
query.SQL.Add(' SELECT MAX(MESCOBRANCA)MESCOBRANCA ');
query.SQL.Add('  from HSTBITRIBUTACAO');
query.SQL.Add(' WHERE IDPESSOA = '+_idpessoa);
query.SQL.Add(' AND OPERACAO = '+#39+'S'+#39);
query.Open;
if not query.IsEmpty then
   _fim.Text:=query.fieldbyname('MESCOBRANCA').Text;
query.Close;

query.Close;
query.Destroy;

end;

function TFrmHistCompSalContri.getPrimeiroPagamento(
  _idpessoa: string): string;
var
  query:TwwQuery;
 begin

query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';

query.Close;
query.SQL.Clear;
query.SQL.Add('SELECT PRIMPAGTO FROM BITRIBUTACAO');
query.SQL.Add('WHERE IDPESSOA = '+_idpessoa);
query.Active:=True;
if not query.IsEmpty then
   begin
    if (query.FieldByName('PRIMPAGTO').AsString <> null) and (query.FieldByName('PRIMPAGTO').AsString <> '') then
        begin
        Result:=query.FieldByName('PRIMPAGTO').AsString;
        end
    else
        begin  
        query.Close;
        query.SQL.Clear;
        query.SQL.Add('SELECT MIN(HR.DATAPAGAMENTO)DATAPAGAMENTO, HR.IDPESSOA');
        query.SQL.Add('  FROM HISTRUBSAL HR, PROVDESC PD, PLANPREVCONTABIL PPC, PLANPREV PP');
        query.SQL.Add(' WHERE HR.IDRESPONSAVEL = '+_idpessoa);
        query.SQL.Add('   AND HR.IDRUBRICA = PD.IDPROVENTO');
        query.SQL.Add('   AND HR.FONTEPAGADORA = 1');
        query.SQL.Add('   AND PP.IDPLANOPREV = HR.IDPLANOPREV');
        query.SQL.Add('   AND PPC.IDPLANOPREV = HR.IDPLANOCONTABIL');
        query.SQL.Add('   AND (PD.FLGEXIBEHIST = ''B'' OR');
        query.SQL.Add('       (HR.FLGTIPODESC = ''B'' AND EXISTS');
        query.SQL.Add('        (SELECT 1');
        query.SQL.Add('            FROM BENEFPLANPREV BP');
        query.SQL.Add('            JOIN BENEFICIO B');
        query.SQL.Add('              ON BP.IDBENEFICIO = B.IDBENEFICIO');
        query.SQL.Add('           WHERE HR.IDBENEFICIO = BP.IDBENEFICIO');
        query.SQL.Add('             AND B.IDTPPAGTOBENEFIC = 1');
        query.SQL.Add('             AND HR.IDRUBRICA IN (BP.IDRUBRICAREVISAO,');
        query.SQL.Add('                                  BP.IDRUBRICAATRASO,');
        query.SQL.Add('                                  BP.IDRUBRICA,');
        query.SQL.Add('                                  BP.IDRUBABONO,');
        query.SQL.Add('                                  BP.IDRUBANTECABONO,');
        query.SQL.Add('                                  BP.IDRUBDESCANTECAB,');
        query.SQL.Add('                                  BP.IDRUBDEVOLUCAO,');
        query.SQL.Add('                                  BP.IDRUBRICADIF,');
        query.SQL.Add('                                  BP.IDRUBRICACORRECAO,');
        query.SQL.Add('                                  BP.IDRUBDEVOLABONO,');
        query.SQL.Add('                                  BP.IDRUBADIANT,');
        query.SQL.Add('                                  BP.IDRUBDEVOLADIANT,');
        query.SQL.Add('                                  BP.IDRUBADIANT13,');
        query.SQL.Add('                                  BP.IDRUBDEVADIANT13,');
        query.SQL.Add('                                  BP.IDRUBACERTOABONO,');
        query.SQL.Add('                                  BP.IDRUBDEVANTABONO,');
        query.SQL.Add('                                  BP.IDRUBATRASOABONO,');
        query.SQL.Add('                                  BP.IDRUBATR13ACJUD,');
        query.SQL.Add('                                  BP.IDRUBDEV13ACJUD,');
        query.SQL.Add('                                  BP.IDRUBATRREVACJUD,');
        query.SQL.Add('                                  BP.IDRUBDEVREVACJUD,');
        query.SQL.Add('                                  BP.IDRUBATRREVISAO,');
        query.SQL.Add('                                  BP.IDRUBDEVREVISAO,');
        query.SQL.Add('                                  BP.IDRUBRICAQUITANT,');
        query.SQL.Add('                                  BP.IDRUBNORADICJUD,');
        query.SQL.Add('                                  BP.IDRUBATRADICJUD,');
        query.SQL.Add('                                  BP.IDRUBDEVADICJUD,');
        query.SQL.Add('                                  BP.IDRUBABONOFIM))))');
        query.SQL.Add(' GROUP BY HR.IDPESSOA');
        query.Active:=True;
        if not query.IsEmpty then
           Result:= query.fieldbyname('DATAPAGAMENTO').AsString;


        end;
   end;
query.Close;
query.Destroy;

end;

procedure TFrmHistCompSalContri.getDadosAcaoJudicial(var _nprocesso,
  _status, _codvar, _nmvara, _dataini, _datafim: TEdit; _idpessoa: string);
var
  query:TwwQuery;
 begin

query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';

query.close;
query.SQL.Clear;
query.SQL.Add('SELECT DISTINCT P.NUMEROPROCESSO AS NUMEROPROCESSO,');
query.SQL.Add('                P.CODVARA,');
query.SQL.Add('                P.NOMEVARA,');
query.SQL.Add('                P.DATAINICIO,');
query.SQL.Add('                P.DATAFINAL,');
query.SQL.Add('                P.SITPROCESSO,');
query.SQL.Add('                DECODE(P.SITPROCESSO,');
query.SQL.Add('                       0,');
query.SQL.Add('                       ''Ação Judicial em Liminar'',');
query.SQL.Add('                       1,');
query.SQL.Add('                       ''Ação Judicial Julgada Ganha'',');
query.SQL.Add('                       ''2'',');
query.SQL.Add('                       ''Ação Judicial Julgada Perdida'')SITUACAO');
query.SQL.Add('  FROM VWPARTICIPDEPEN V, PROCJUD P, DETPROCJUD D, REGRA R');
query.SQL.Add(' WHERE ((P.IDPROCJUD = D.IDPROCJUD(+)))');
query.SQL.Add('   AND ((V.IDPESSOA = P.IDPESSOA))');
query.SQL.Add('   AND ((D.IDREGRA = R.IDREGRA(+)))');
query.SQL.Add('   AND (V.IDPESSOA = '+_idpessoa+')');
query.Active:=True;
IF query.RecordCount=1 then
   begin


   IF not query.IsEmpty then
     begin
     _nprocesso.Text:= query.FieldByName('NUMEROPROCESSO').AsString;
     _codvar.Text:=    query.FieldByName('CODVARA').AsString;
     _nmvara.Text:=    query.FieldByName('NOMEVARA').AsString;
     _dataini.Text:=   query.FieldByName('DATAINICIO').AsString;
     _datafim.Text:=   query.FieldByName('DATAFINAL').AsString;
     _status.Text:=    query.FieldByName('SITUACAO').AsString;
     end;

   end
else
   begin

    query.close;
    query.SQL.Clear;
    query.SQL.Add('SELECT DISTINCT P.NUMEROPROCESSO AS NUMEROPROCESSO,');
    query.SQL.Add('                P.CODVARA,');
    query.SQL.Add('                P.NOMEVARA,');
    query.SQL.Add('                P.DATAINICIO,');
    query.SQL.Add('                P.DATAFINAL,');
    query.SQL.Add('                P.SITPROCESSO,');
    query.SQL.Add('                DECODE(P.SITPROCESSO,');
    query.SQL.Add('                       0,');
    query.SQL.Add('                       ''Ação Judicial em Liminar'',');
    query.SQL.Add('                       1,');
    query.SQL.Add('                       ''Ação Judicial Julgada Ganha'',');
    query.SQL.Add('                       ''2'',');
    query.SQL.Add('                       ''Ação Judicial Julgada Perdida'')SITUACAO');
    query.SQL.Add('  FROM VWPARTICIPDEPEN V, PROCJUD P, DETPROCJUD D, REGRA R');
    query.SQL.Add(' WHERE ((P.IDPROCJUD = D.IDPROCJUD(+)))');
    query.SQL.Add('   AND ((V.IDPESSOA = P.IDPESSOA))');
    query.SQL.Add('   AND ((D.IDREGRA = R.IDREGRA(+)))');
    query.SQL.Add('   AND (V.IDPESSOA = '+_idpessoa+')');
    query.SQL.Add('   AND P.SITPROCESSO = 0');
    query.Active:=TRUE;

   IF not query.IsEmpty then
     begin
     _nprocesso.Text:= query.FieldByName('NUMEROPROCESSO').AsString;
     _codvar.Text:=    query.FieldByName('CODVARA').AsString;
     _nmvara.Text:=    query.FieldByName('NOMEVARA').AsString;
     _dataini.Text:=   query.FieldByName('DATAINICIO').AsString;
     _datafim.Text:=   query.FieldByName('DATAFINAL').AsString;
     _status.Text:=    query.FieldByName('SITUACAO').AsString;
     end
   else
       begin


        query.close;
        query.SQL.Clear;
        query.SQL.Add('SELECT DISTINCT P.NUMEROPROCESSO AS NUMEROPROCESSO,');
        query.SQL.Add('                P.CODVARA,');
        query.SQL.Add('                P.NOMEVARA,');
        query.SQL.Add('                P.DATAINICIO,');
        query.SQL.Add('                P.DATAFINAL,');
        query.SQL.Add('                P.SITPROCESSO,');
        query.SQL.Add('                DECODE(P.SITPROCESSO,');
        query.SQL.Add('                       0,');
        query.SQL.Add('                       ''Ação Judicial em Liminar'',');
        query.SQL.Add('                       1,');
        query.SQL.Add('                       ''Ação Judicial Julgada Ganha'',');
        query.SQL.Add('                       ''2'',');
        query.SQL.Add('                       ''Ação Judicial Julgada Perdida'')SITUACAO');
        query.SQL.Add('  FROM VWPARTICIPDEPEN V, PROCJUD P, DETPROCJUD D, REGRA R');
        query.SQL.Add(' WHERE ((P.IDPROCJUD = D.IDPROCJUD(+)))');
        query.SQL.Add('   AND ((V.IDPESSOA = P.IDPESSOA))');
        query.SQL.Add('   AND ((D.IDREGRA = R.IDREGRA(+)))');
        query.SQL.Add('   AND (V.IDPESSOA = '+_idpessoa+')');
//        query.SQL.Add('   ORDER BY DATAINICIO DESC ');  //Everson TIBERO
        query.SQL.Add('   ORDER BY P.DATAINICIO DESC ');  //Everson TIBERO
        query.Active:=True;

        IF not query.IsEmpty then
           begin
           _nprocesso.Text:= query.FieldByName('NUMEROPROCESSO').AsString;
           _codvar.Text:=    query.FieldByName('CODVARA').AsString;
           _nmvara.Text:=    query.FieldByName('NOMEVARA').AsString;
           _dataini.Text:=   query.FieldByName('DATAINICIO').AsString;
           _datafim.Text:=   query.FieldByName('DATAFINAL').AsString;
           _status.Text:=    query.FieldByName('SITUACAO').AsString;
           end


       end;

   end;




query.Close;
query.Destroy;
end;

procedure TFrmHistCompSalContri.execConsultaHistoricoContribuicoes(var _query:TwwQuery;_idpessoa:string);
var queryMatricula :TwwQuery;//higor nayde SOL 242624/17054
begin
  //higor nayde SOL 242624/17054
  queryMatricula := TwwQuery.Create(Application);
  queryMatricula.DataBaseName := 'BaseDados';

  queryMatricula.Close;
  queryMatricula.SQL.Clear;
  queryMatricula.SQL.Add('select 1 from depentit where idpessoa = idtitular and idpessoa = '+_idpessoa);
  queryMatricula.open;

  if queryMatricula.IsEmpty then
     _idpessoa := '0';


      _query.Active:=False ;
      _query.SQL.Clear;
      _query.SQL.Add('SELECT H.MESREFERENCIA as "Mês Referência",');
      _query.SQL.Add('       H.MESCOBRANCA as "Mês Cobrança",');
      _query.SQL.Add('       C.NOME as "Contribuição",');
      _query.SQL.Add('       DECODE(HST.FLGDEVOLUCAO, 1, -HST.VALORRECEBIDO, HST.VALORRECEBIDO) AS "Valor Recebido",');
      _query.SQL.Add('       (COTVALOR/100)"Índice %",');
      _query.SQL.Add('       H.VALOR "Valor Atualizado", ');
      _query.SQL.Add('       OPERACAO "Operação"');
      _query.SQL.Add('  FROM HSTBITRIBUTACAO H,');
      _query.SQL.Add('       HSTCONTRIBPREV HST,');
      _query.SQL.Add('       CONTRIBUICAO C,');
      _query.SQL.Add('       PESSOA PES,');
      _query.SQL.Add('       BITRIBUTACAO B,');
      _query.SQL.Add('       PESSOAFISICA PF,');
      _query.SQL.Add('       PARTPREVPLAN PP,');
      _query.SQL.Add('       ELEGPATRO E,');
      _query.SQL.Add('       PLANPREV PPR,');
      _query.SQL.Add('       SITPART SP,');
      _query.SQL.Add('       (SELECT P.SITPROCESSO,');
      _query.SQL.Add('               P.IDPESSOA,');
      _query.SQL.Add('               P.NUMEROPROCESSO,');
      _query.SQL.Add('               P.CODVARA,');
      _query.SQL.Add('               P.NOMEVARA,');
      _query.SQL.Add('               P.DATAINICIO,');
      _query.SQL.Add('               P.DATAFINAL');
      _query.SQL.Add('          FROM PROCJUD P');
      _query.SQL.Add('         WHERE P.SITPROCESSO = (SELECT MIN(P.SITPROCESSO) FROM PROCJUD P)) PROC,');
      _query.SQL.Add('       COTACAOMOEDA CM');
      _query.SQL.Add('');
      _query.SQL.Add(' WHERE H.IDPESSOA ='+_idpessoa);
      _query.SQL.Add('   AND H.OPERACAO = ''E''');
      _query.SQL.Add('   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
      _query.SQL.Add('   AND H.IDPESSOA = HST.IDPESSOA');
      _query.SQL.Add('   AND H.IDMOTIVO = HST.IDMOTIVO');
      _query.SQL.Add('   AND H.NUMRECEBIMENTO = HST.NUMRECEBIMENTO');
      _query.SQL.Add('   AND H.MESREFERENCIA = HST.MESREFERENCIA');
      _query.SQL.Add('   AND H.MESCOBRANCA = HST.MESCOBRANCA');
      _query.SQL.Add('   AND B.IDPESSOA = PES.IDPESSOA');
      _query.SQL.Add('   AND PF.IDPESSOA = PES.IDPESSOA');
      _query.SQL.Add('   AND PROC.IDPESSOA(+) = PES.IDPESSOA');
      _query.SQL.Add('   AND PP.IDPESSOA = E.IDPESSOA');
      _query.SQL.Add('   AND PP.IDPESSJUR = E.IDPESSJUR');
      _query.SQL.Add('   AND PP.IDSITPART = SP.IDSITPART');
      _query.SQL.Add('   AND PP.IDPESSOA ='+_idpessoa);
      _query.SQL.Add('   AND PP.IDPLANOPREV = 2');
      _query.SQL.Add('   AND PPR.IDPLANOPREV = PP.IDPLANOPREV');
      _query.SQL.Add('   AND E.IDPESSOA = PES.IDPESSOA');
      _query.SQL.Add('   AND H.IDPESSOA = B.IDPESSOA');
      _query.SQL.Add('   AND H.IDPESSOA = PES.IDPESSOA');
      _query.SQL.Add('   AND H.IDPESSOA = PP.IDPESSOA');
      _query.SQL.Add('   AND H.IDPESSOA = E.IDPESSOA');
      _query.SQL.Add('   AND CM.MOECODIGO = H.MOECODIGO');
      _query.SQL.Add('   AND (SUBSTR((TO_CHAR((CM.COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
      _query.SQL.Add('       SUBSTR((TO_CHAR((CM.COTDATA), ''DD/MM/YYYY'')), 4, 2)) =');
      _query.SQL.Add('       H.MESCOBRANCA(+)');
      //_query.SQL.Add('      ORDER BY H.MESREFERENCIA,H.MESCOBRANCA DESC ');          // Denis Horongoso - SIG 27748
      _query.SQL.Add('      ORDER BY H.MESCOBRANCA, H.MESREFERENCIA, OPERACAO DESC '); // Denis Horongoso - SIG 27748
      _query.Active:=True;

  queryMatricula.Destroy;//higor nayde SOL 242624/17054
end;

procedure TFrmHistCompSalContri.tbcDetalheChange(Sender: TObject);
begin
  inherited;

lbl_saldo.Caption:='';
if Trim(idpessoa)<>'' then
   begin

   // André Imakawa - SIG 21958 - Inicio
   qryNome.Locate('NOME',cbxNome.Text,[]);
   ed_saldocom.text:=getTotalCompensado(qryNome.fieldByName('idpessoa').AsString, idtitular);
   IF ed_saldocom.Text<>'' then
      ed_saldocom.Text:=FormatFloat('#,##0.00',strtofloat(ed_saldocom.Text));
   AlinhaEdit(ed_saldocom);
   // André Imakawa - SIG 21958 - Fim
  case tbcDetalhe.tabindex of
  0:begin

   //higor nayde SOL 242624/17054
  qryNome.Locate('NOME',cbxNome.Text,[]);
  execConsultaHistoricoCompensacao (qryDet2,qryNome.fieldByName('idpessoa').AsString);
  //higor nayde SOL 242624/17054
  wwDBGrid1.Visible:=True;
  wwDBGrid2.Visible:=False;
  end;

  1:begin
  //higor nayde SOL 242624/17054
  //execConsultaHistoricoContribuicoes (qryDet,idpessoa);
  qryNome.Locate('NOME',cbxNome.Text,[]);
  execConsultaHistoricoContribuicoes (qryDet,qryNome.fieldByName('idpessoa').AsString);
  //higor nayde SOL 242624/17054
  wwDBGrid1.Visible:=false;
  wwDBGrid2.Visible:=true;
  if ed_saldoini.Text<>'' then
      lbl_saldo.Caption:='Saldo de Contribuições R$ '+ed_saldoini.Text
  else
      lbl_saldo.Caption:='Saldo de Contribuições R$ '+'0.00';
  end;
  end;

end;


end;

procedure TFrmHistCompSalContri.execConsultaHistoricoCompensacao(
  var _query: TwwQuery; _idpessoa: string);
  var sIdTitular:String;
  //queryTitular : TwwQuery;
begin
  sIdTitular := inttostr(StrToIntDef(MontaSelect.ValoresChave[1],-1)) ;

  //Hist Compensação
  _query.Active:=False ;
  _query.SQL.Clear;
  //_query.SQL.Add('SELECT MESREFERENCIA "Mês Referência",');
  _query.SQL.Add('SELECT MATRICULA"Matrícula", MESREFERENCIA"Mês Referência",');
  _query.SQL.Add('       MESCOBRANCA "Mês Pagamento",       ');
  //_query.SQL.Add('       LAG(SALDO, 1, 0) OVER(ORDER BY MESREFERENCIA, MESCOBRANCA, OPERACAO) "Saldo Anterior",'); // Denis Horongoso - SIG 27748
  _query.SQL.Add('       LAG(SALDO, 1, 0) OVER(ORDER BY MESCOBRANCA, MESREFERENCIA, OPERACAO) "Saldo Anterior",');   // Denis Horongoso - SIG 27748
  _query.SQL.Add('       VALOR "Valor",');
  _query.SQL.Add('       SALDO "Saldo Atual",');
//  _query.SQL.Add('       (COTVALOR / 100) "Índice %",'); // Andre Imakawa - SIG 30775
  _query.SQL.Add('       ROUND((COTVALOR),2) "Índice %",'); // Andre Imakawa - SIG 30775
  _query.SQL.Add('       to_char(MOECODIGO) "Referência Índice",');
  _query.SQL.Add('       OPERACAO "Operação", ordem');
  _query.SQL.Add('  FROM (SELECT rownum ordem,H.VALOR,');
  _query.SQL.Add('               H.IDHSTBITRIBUTACAO,');
  _query.SQL.Add('               H.OPERACAO,');
  _query.SQL.Add('               CASE');
  _query.SQL.Add('                 WHEN H.OPERACAO = ''S'' AND H.IDLOTE = 0 THEN');
  _query.SQL.Add('                  DECODE(SUBSTR(H.MESREFERENCIA, 6, 2),');
  _query.SQL.Add('                         ''13'',');
  _query.SQL.Add('                         H.MESCOBRANCA,');
  _query.SQL.Add('                         H.MESREFERENCIA)');
  _query.SQL.Add('                 ELSE');
  _query.SQL.Add('                  H.MESCOBRANCA');
  _query.SQL.Add('               END AS MESREF,');
  _query.SQL.Add('               CASE');
  _query.SQL.Add('                 WHEN H.OPERACAO = ''S'' AND H.IDLOTE = 0 THEN');
  _query.SQL.Add('                  H.MESREFERENCIA');
  _query.SQL.Add('                 ELSE');
  _query.SQL.Add('                  H.MESCOBRANCA');
  _query.SQL.Add('               END AS MESCOBR,');
  _query.SQL.Add('               H.MESREFERENCIA,');
  _query.SQL.Add('               H.MESCOBRANCA,');
  _query.SQL.Add('               H.SALDO,');
  _query.SQL.Add('               H.IDLOTE,');
  _query.SQL.Add('               H.IDHSTFOLHABENEF,');
  _query.SQL.Add('               H.TRGDTINCLUSAO,');
  _query.SQL.Add('               H.TRGUSERINCLUSAO,');
  _query.SQL.Add('               H.MOECODIGO,');
  _query.SQL.Add('               CM.COTVALOR, D.Matricula ');
  _query.SQL.Add('          FROM DEPENTIT D, HSTBITRIBUTACAO H');
  _query.SQL.Add('          LEFT JOIN COTACAOMOEDA CM');
  _query.SQL.Add('            ON CM.MOECODIGO = H.MOECODIGO');
  _query.SQL.Add('           AND (SUBSTR((TO_CHAR((CM.COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||');
  _query.SQL.Add('               SUBSTR((TO_CHAR((CM.COTDATA), ''DD/MM/YYYY'')), 4, 2)) =');
  _query.SQL.Add('               H.MESCOBRANCA');
  _query.SQL.Add('         WHERE     D.IDPESSOA  = H.IDPESSOA ');
  _query.SQL.Add('               AND D.IDTITULAR = H.IDTITULAR ');
  if sIdTitular <> _idpessoa then     //SOL 242624/17054 Kintana 715180
     _query.SQL.Add('               AND H.IDPESSOA  = '+_idpessoa);  // SOL 242624/17054 Kintana 715180
  _query.SQL.Add('               AND H.IDTITULAR ='+ sIdTitular); // SOL 242624/17054 Kintana 715180
  _query.SQL.Add('               AND H.MESREFERENCIA >=');
  _query.SQL.Add('               (SELECT MIN(H.MESREFERENCIA)');
  _query.SQL.Add('                  FROM HSTBITRIBUTACAO H, BITRIBUTACAO B');
  _query.SQL.Add('                 WHERE H.OPERACAO = ''S''');
  _query.SQL.Add('                   AND B.IDTITULAR = H.IDTITULAR');
  if sIdTitular <> _idpessoa then   //SOL 242624/17054 Kintana 715180
     _query.SQL.Add('                   AND H.IDPESSOA = '+_idpessoa);     // SOL 242624/17054 Kintana 715180
  _query.SQL.Add('                   AND H.IDTITULAR = '+ sIdTitular +' )        )'); // SOL 242624/17054 Kintana 715180
  //_query.SQL.Add('         ORDER BY H.MESREFERENCIA, H.MESCOBRANCA, H.OPERACAO)');
  //_query.SQL.Add('         ORDER BY MESREFERENCIA,MESCOBRANCA,OPERACAO    ');
  //_query.SQL.Add('ORDER BY MESCOBRANCA,OPERACAO,MESREFERENCIA,IDHSTBITRIBUTACAO   '); // Denis Horongoso - SIG 27748
  _query.SQL.Add('ORDER BY MESCOBRANCA, MESREFERENCIA, OPERACAO   ');                   // Denis Horongoso - SIG 27748
  _query.Active:=True;

end;

procedure TFrmHistCompSalContri.execProcedureAtualizaSaldo(
  _idpessoa: string);
var
SP1:TwwStoredProc;
begin

SP1 := TwwStoredProc.Create(Application);
SP1.DataBaseName := 'BaseDados';
SP1.StoredProcName:='CM.SP_FB_ATUALIZA_SALDO_BITRIB';
SP1.Params.CreateParam(ftFloat,    'pIdPessoa',           ptInput);
SP1.ParamByName('pIdPessoa').asfloat := strtofloat(_idpessoa);
try
SP1.Prepare;
SP1.ExecProc;
except

end;

SP1.close;
SP1.Destroy;

end;

procedure TFrmHistCompSalContri.bt_atualizarSaldoClick(Sender: TObject);
begin
  inherited;
if MsgDlg( 'Confirma a atualização do Saldo de Contribuições ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
     try
     If not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;
        
     execProcedureAtualizaSaldo(idpessoa);

      if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;

     MsgDlg( 'Atualização realizada com Sucesso!','Informação',mtInformation,[mbOk],0)
     except
     end;
     //higor nayde SOL 242624/17054
     //execConsultaHistoricoCompensacao (qryDet2,idpessoa);
     qryNome.Locate('NOME',cbxNome.Text,[]);
     execConsultaHistoricoCompensacao(qryDet2,qryNome.fieldByName('idpessoa').AsString);
     //higor nayde SOL 242624/17054
   end;
end;

procedure TFrmHistCompSalContri.setStatusBotaoAtualizarSaldo(
  _botao: TSpeedButton;_idpessoa:string);
var
  query:TwwQuery;
function getCompFolha(_idpessoa:string):Boolean;
   var
      query:TwwQuery;
   begin
   query := TwwQuery.Create(Application);
   query.DataBaseName := 'BaseDados';
   query.Close;
   query.SQL.Clear;

   query.SQL.Add('SELECT 1');
   query.SQL.Add('  FROM HSTBITRIBUTACAO');
   query.SQL.Add(' WHERE IDPESSOA = 443106');
   query.SQL.Add('   AND OPERACAO = ''S''');
   query.SQL.Add('   AND ROWNUM = 1');
   query.Active:=True;
   if not query.IsEmpty then
      Result:=True
   else
      result:=False;

   end;
begin

query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';


query.Close;
query.SQL.Clear;
query.SQL.Add(' SELECT nvl(SALDO,0)SALDO,FLGATIVO ');
query.SQL.Add('  FROM BITRIBUTACAO');
query.SQL.Add(' WHERE IDPESSOA = '+_idpessoa);
query.Open;
if not query.IsEmpty then
   begin
   if (query.fieldbyname('SALDO').AsFloat > 0) and
      (query.fieldbyname('FLGATIVO').AsFloat =1) and (getCompFolha(_idpessoa)=True) then
      _botao.Enabled:=True
   else
        _botao.Enabled:=False;

   end
else
     _botao.Enabled:=False;




////


query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';
query.Close;
query.SQL.Clear;


query.SQL.Add('SELECT *');
query.SQL.Add('  FROM AUTORIZA');
query.SQL.Add(' WHERE IDOPERFUNC IN');
query.SQL.Add('       (SELECT IDOPERFUNC');
query.SQL.Add('          FROM OPERFUNC');
query.SQL.Add('         WHERE IDMODULO = 18');
query.SQL.Add('           AND IDOPERACAO =121');
query.SQL.Add('           AND IDFUNCAO =');
query.SQL.Add('               (SELECT IDFUNCAO');
query.SQL.Add('                  FROM FUNCAO');
query.SQL.Add('                 WHERE UPPER(NOMEFUNCAO) =');
query.SQL.Add('                       UPPER(''HISTÓRICO DE COMPENSAÇÃO DE SALDO DE CONTRIBUIÇÕES'')))');
query.SQL.Add('   AND IDESPACESSO IN');
query.SQL.Add('       (SELECT IDESPACESSO');
query.SQL.Add('          FROM GRUPOACESSO');
query.SQL.Add('         WHERE IDGRUPO IN');
query.SQL.Add('               (SELECT IDGRUPO');
query.SQL.Add('                  FROM GRUPOUSU');
query.SQL.Add('                 WHERE IDUSUARIO = (SELECT IDUSUARIO');
query.SQL.Add('                                      FROM USUARIOSISTEMA');
query.SQL.Add('                                     WHERE IDESPACESSO ='+inttostr(Sistema.IdEspAcesso)+')))');




query.Active:=true;
if not query.IsEmpty then
   begin
   _botao.Enabled:=true;
   end
else
   begin


   query.Close;
   query.SQL.Clear;

    query.SQL.Add('SELECT *');
    query.SQL.Add('  FROM AUTORIZA');
    query.SQL.Add(' WHERE IDOPERFUNC IN (SELECT IDOPERFUNC');
    query.SQL.Add('  FROM OPERFUNC');
    query.SQL.Add(' WHERE IDMODULO = 18');
    query.SQL.Add('   AND IDOPERACAO =121');
    query.SQL.Add('   AND IDFUNCAO =');
    query.SQL.Add('       (SELECT IDFUNCAO');
    query.SQL.Add('          FROM FUNCAO');
    query.SQL.Add('         WHERE UPPER(NOMEFUNCAO) =');
    query.SQL.Add('               UPPER(''HISTÓRICO DE COMPENSAÇÃO DE SALDO DE CONTRIBUIÇÕES'')))');
    query.SQL.Add('   AND IDESPACESSO ='+inttostr(Sistema.IdEspAcesso));
    query.Active:=true;
    if not query.IsEmpty then
       begin
      _botao.Enabled:=true;

       end
    else
       begin


       _botao.Enabled:=false;

       end;


   end;

query.Active:=false;
query.destroy;

////



end;





procedure TFrmHistCompSalContri.ppHeaderBand3BeforePrint(Sender: TObject);
begin
  inherited;
pplbl_nomeextrato.Caption:=': '+cbxNome.text;   //higor nayde SOL 242624/17054
pplbl_matriculaextrato.Caption:=': '+ed_matricula.Text;
pplbl_dataprimExtrato.Caption:=': '+ed_data_inicio.Text;
pplbl_sitfunExtrato.Caption:=': '+ed_situacao.Text;
pplbl_planoExtrato.Caption:=': '+planoNome;
pplbl_dataadmExtrato.Caption:=': '+DataInsc;
lbl_cpf.Caption:=': '+ed_cpf.Text;
lbl_fontepaga.Caption:=': '+'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS - FUNCEF';
lbl_cnpf.Caption:=': '+'00.436.923/0001-90';

pplbl_procExtrato.Caption:=ed_processo.Text;
pplbl_codvaraExtrato.Caption:=ed_CodVar.Text;
pplbl_nomevaraExtrato.Caption:=ed_NomeVar.Text;
pplbl_sitacaoExtrato.Caption:=ed_Status.Text;
pplbl_datainiExtrato.Caption:=ed_DataIni.Text;
pplbl_datafinExtrato.Caption:=ed_DataFin.Text;
end;

procedure TFrmHistCompSalContri.bt_ImprimirExtratoClick(Sender: TObject);
begin
  inherited;
  //higor nayde SOL 242624/17054
  //execConsultaHistoricoContribuicoes (qryDet,idpessoa);//higor nayde SOL 242624/17054
  //execConsultaExtratoContribuicoes (qryExtrato,ed_matricula.Text);//higor nayde SOL 242624/17054
  //execConsultaExtratoContribuicoes2 (qryExtrato,idpessoa);

  qryNome.Locate('NOME',cbxNome.Text,[]);
  execConsultaExtratoContribuicoes2(qryExtrato,qryNome.fieldByName('idpessoa').AsString);
  //higor nayde SOL 242624/17054
TFrmPreview.CreatemodalPreview(Application, ppExtrato,'Extrato de Contribuições');
ExecSaveRel(ppExtrato);
end;

procedure TFrmHistCompSalContri.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;

pplbl_nomeHisCont.Caption:=cbxNome.text;//higor nayde SOL 242624/17054
pplbl_matriHistCont.Caption:=ed_matricula.Text;
pplbl_cpfHistCont.Caption:=ed_cpf.Text;

end;

procedure TFrmHistCompSalContri.SpeedButton1Click(Sender: TObject);
begin
  inherited;
case tbcDetalhe.tabindex of
0:begin
  TFrmPreview.CreatemodalPreview(Application, ppHistComp,'Histórico de Compensação');
//  ExecSaveRel(ppHistComp);
  end;

1:begin

  TFrmPreview.CreatemodalPreview(Application, ppHistContri,'Histórico de Contribuições');
//  ExecSaveRel(ppHistContri);

  end;
end;
end;

procedure TFrmHistCompSalContri.ppHeaderBand2BeforePrint(Sender: TObject);
begin
  inherited;
plbl_nomeHisComp.Caption:=cbxNome.text;//higor nayde SOL 242624/17054
pplbl_matriHistComp.Caption:=ed_matricula.Text;
pplbl_cpfHistComp.Caption:=ed_cpf.Text;

end;

//procedure TFrmHistCompSalContri.SpeedButton1Click(Sender: TObject);
//begin
//  inherited;
//case tbcDetalhe.tabindex of
//0:begin
//  TFrmPreview.CreatemodalPreview(Application, ppHistComp,'Histórico de Compensação');
//  end;
//
//1:begin
//
//  TFrmPreview.CreatemodalPreview(Application, ppHistContri,'Histórico de Contribuições');
//
//  end;
//end;



procedure TFrmHistCompSalContri.chk_AcaoJudClick(Sender: TObject);
var
  query:TwwQuery;
begin
//  inherited;
if padrao<>True then
   begin
   padrao:=False;
    If not dtmBaseDados.dbBaseDados.InTransaction Then
       dtmBaseDados.dbBaseDados.StartTransaction;


    query := TwwQuery.Create(Application);
    query.DataBaseName := 'BaseDados';
    query.Close;
    query.SQL.Clear;

    query.SQL.Add('UPDATE BITRIBUTACAO ');


    if chk_AcaoJud.Checked then
      begin
      query.SQL.Add(' SET FLGACAOJUD = 1');
      end
    else
      begin
      query.SQL.Add(' SET FLGACAOJUD = 0');
      end;

    query.SQL.Add('  WHERE IDPESSOA ='+idpessoa);
    query.ExecSQL;
    query.close;
    query.Destroy;

    //if dtmBaseDados.dbBaseDados.InTransaction then
    //  dtmBaseDados.dbBaseDados.Commit;
   end
   else
    padrao:=False; 

end;

procedure TFrmHistCompSalContri.FormCreate(Sender: TObject);
//var
//  query:TwwQuery;
begin
  inherited;

//query := TwwQuery.Create(Application);
//query.DataBaseName := 'BaseDados';
//query.Close;
//query.SQL.Clear;
//
//query.SQL.Add('SELECT *');
//query.SQL.Add('  FROM AUTORIZA');
//query.SQL.Add(' WHERE IDOPERFUNC = 19475');
//query.SQL.Add('   AND IDESPACESSO ='+inttostr(Sistema.IdEspAcesso));
//query.Active:=true;
//if not query.IsEmpty then
//   chk_AcaoJud.Enabled:=True
//else
//   chk_AcaoJud.Enabled:=false;
//
//query.Active:=false;
//query.destroy;

setPadraoGrid;



AlinhaEdit(ed_saldoini);
AlinhaEdit(ed_saldocom);
AlinhaEdit(ed_saldo_atu);

end;



procedure TFrmHistCompSalContri.MontaSelectAfterOpenCds(
  oCds: TClientDataSet);
begin
  //inherited;
  if oCds.IsEmpty then
     begin
     MsgDlg( 'A matrícula selecionada não possui saldo de contribuições calculado.','Informação',mtInformation,[mbOk],0);
     end;
end;

procedure TFrmHistCompSalContri.LimpaEdit;
var
i : Integer; 
begin
for i := 0 to ComponentCount -1 do
  if Components[i] is TEdit then
  begin
  TEdit(Components[i]).Text := '';
  end;
end;

procedure TFrmHistCompSalContri.bbtnConfirmarClick(Sender: TObject);
begin
 // inherited;
//If not dtmBaseDados.dbBaseDados.InTransaction Then
//   dtmBaseDados.dbBaseDados.StartTransaction;

if dtmBaseDados.dbBaseDados.InTransaction then
  dtmBaseDados.dbBaseDados.Commit;

setStatusAcaoJudicial(chk_AcaoJud,idpessoa);

end;

procedure TFrmHistCompSalContri.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
if dtmBaseDados.dbBaseDados.InTransaction then
  dtmBaseDados.dbBaseDados.Rollback;

setStatusAcaoJudicial(chk_AcaoJud,idpessoa);  
end;

procedure TFrmHistCompSalContri.setStatusAcaoJudicial(
  var _check: TCheckBox; _idpessoa: string);
var
  query:TwwQuery;
begin


query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';
query.Close;
query.SQL.Clear;
query.SQL.Add('SELECT NVL(FLGACAOJUD,0)FLGACAOJUD FROM BITRIBUTACAO WHERE IDPESSOA ='+_idpessoa);
query.Active:=True;
IF query.FieldByName('FLGACAOJUD').AsString = '0' then
   _check.Checked:=False
ELSE
   _check.Checked:=True;

query.Active:=false;
query.Destroy;

end;

procedure TFrmHistCompSalContri.setPadraoGrid;
begin

qryDet2.SQL.Clear;
qryDet2.SQL.Add('SELECT ''0000000000'' "Matrícula" , ''0000/00'' "MÊS REFERÊNCIA",');//higor nayde SOL 242624/17054
qryDet2.SQL.Add('       ''0000/00'' "MÊS PAGAMENTO",       ');
qryDet2.SQL.Add('       0 "SALDO ANTERIOR",');
qryDet2.SQL.Add('       0 "VALOR",');
qryDet2.SQL.Add('       0 "SALDO ATUAL",');
qryDet2.SQL.Add('       0 "ÍNDICE %",');
qryDet2.SQL.Add('       ''0'' "REFERÊNCIA ÍNDICE",');
qryDet2.SQL.Add('       '' '' "OPERAÇÃO" FROM DUAL');
qryDet2.open;

qryDet.SQL.Clear;
qryDet.SQL.Add('SELECT ''0000/00'' AS "MÊS REFERÊNCIA",');
qryDet.SQL.Add('       ''0000/00'' AS "MÊS COBRANÇA",');
qryDet.SQL.Add('       '' '' AS "CONTRIBUIÇÃO",');
qryDet.SQL.Add('       0 AS "VALOR RECEBIDO",');
qryDet.SQL.Add('       0 "ÍNDICE %",');
qryDet.SQL.Add('       0 "VALOR ATUALIZADO" ,');
qryDet.SQL.Add('      '' '' "OPERAÇÃO" FROM DUAL      ');
qryDet.open;

ed_saldoini.text:='0,00';
ed_saldocom.text:='0,00';
idpessoa:='';


end;

function TFrmHistCompSalContri.AlinhaEdit(var Edt: TEdit): TEdit;
var
  n: Integer;
  c: TCanvas;
  h: HWND;

begin

    c := TCanvas.Create;
    c.Handle := GetDeviceContext(h);
    c.Font := Edt.Font;
    n := round((Edt.Width - c.TextWidth(Edt.Text) - 8) / c.TextWidth( ' '));
    Edt.Text := stringofchar(' ', n) + Edt.Text;
    Result := Edt;
end;

procedure TFrmHistCompSalContri.ExecSaveRel(var Rpt: TppReport);
begin

Rpt.DeviceType       := 'ExcelFile';
Rpt.AllowPrintToFile := True;
Rpt.ShowPrintDialog  := True;
//rpReversaoCotas.TextFileName     := local+'\DEMONSTRATIVO DE REVERSÃO DE COTA-'+qryRelatorio.FIELDBYNAME('MATBEN').TEXT+'-'+FormatDateTime('DDMMYYYY', date)+'-'+FormatDateTime('HHMMSS', time)+'.XLS';
Rpt.Print;

end;

function TFrmHistCompSalContri.getStatusAcaoJudicial(_idpessoa: string):Boolean;
var
  query:TwwQuery;
begin


query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';
query.Close;
query.SQL.Clear;
query.SQL.Add('SELECT NVL(FLGACAOJUD,0)FLGACAOJUD FROM BITRIBUTACAO WHERE IDPESSOA ='+_idpessoa);
query.Active:=True;
IF query.FieldByName('FLGACAOJUD').AsString = '0' then
   result:=False
ELSE
   result:=True;

query.Active:=false;
query.Destroy;


end;

procedure TFrmHistCompSalContri.execConsultaExtratoContribuicoes(
  var _query: TwwQuery; _matricula: string);
begin

    _query.Active:=False ;
    _query.SQL.Clear;
    _query.SQL.Add('SELECT * FROM (');
    _query.SQL.Add('SELECT ''1'' GRUPO,');
    _query.SQL.Add('       H.MESREFERENCIA as "Mês Referência",');
    _query.SQL.Add('       H.MESCOBRANCA as "Mês Cobrança",');
    _query.SQL.Add('       C.NOME as "Contribuição",');
    _query.SQL.Add('       DECODE(HST.FLGDEVOLUCAO, 1,-HST.VALORRECEBIDO, HST.VALORRECEBIDO) AS "Valor Recebido",');
    _query.SQL.Add('       H.VALOR "Valor Atualizado",');
    _query.SQL.Add('       H.IDPESSOA,');
    _query.SQL.Add('       H.OPERACAO "Operação" ,');
    _query.SQL.Add('       PES.NOME, ');
    _query.SQL.Add('       PES.NUMDOCUMENTO,');
    _query.SQL.Add('       E.MATRICULA,');
    _query.SQL.Add('       E.DATAADMISSAO,');
    _query.SQL.Add('       B.PRIMPAGTO,');
    _query.SQL.Add('       SP.CODPORTFORMA,');
    _query.SQL.Add('       SP.DESCRICAO,');
    _query.SQL.Add('       PPR.NOME PLANO,');
    _query.SQL.Add('       PROC.NUMEROPROCESSO,');
    _query.SQL.Add('       PROC.DATAINICIO,');
    _query.SQL.Add('       PROC.DATAFINAL,');
    _query.SQL.Add('       DECODE(PROC.SITPROCESSO,0, ''Ação Judicial em Liminar'',1,''Ação Judicial Julgada Ganha'',2,''Ação Judicial Julgada Perdida'') acao,');
    _query.SQL.Add('       PROC.CODVARA,');
    _query.SQL.Add('       PROC.NOMEVARA');
    _query.SQL.Add('  FROM HSTBITRIBUTACAO H,');
    _query.SQL.Add('       HSTCONTRIBPREV  HST,');
    _query.SQL.Add('       CONTRIBUICAO    C,');
    _query.SQL.Add('       PESSOA          PES,       ');
    _query.SQL.Add('       BITRIBUTACAO    B,');
    _query.SQL.Add('       PESSOAFISICA    PF,');
    _query.SQL.Add('       PARTPREVPLAN    PP,');
    _query.SQL.Add('       ELEGPATRO       E,');
    _query.SQL.Add('       PLANPREV        PPR,');
    _query.SQL.Add('       SITPART         SP,');
    _query.SQL.Add('             (SELECT  P.SITPROCESSO,');
    _query.SQL.Add('             P.IDPESSOA,');
    _query.SQL.Add('             P.NUMEROPROCESSO,');
    _query.SQL.Add('             P.CODVARA,');
    _query.SQL.Add('             P.NOMEVARA,');
    _query.SQL.Add('             P.DATAINICIO,');
    _query.SQL.Add('             P.DATAFINAL');
    _query.SQL.Add('        FROM PROCJUD P');
    _query.SQL.Add('       WHERE P.SITPROCESSO = (SELECT MIN(P.SITPROCESSO)FROM PROCJUD P)) PROC       ');
    _query.SQL.Add(' WHERE H.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND H.OPERACAO = ''E''');
    _query.SQL.Add('   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
    _query.SQL.Add('   AND H.IDPESSOA = HST.IDPESSOA');
    _query.SQL.Add('   AND H.IDMOTIVO = HST.IDMOTIVO');
    _query.SQL.Add('   AND H.NUMRECEBIMENTO = HST.NUMRECEBIMENTO');
    _query.SQL.Add('   AND H.MESREFERENCIA = HST.MESREFERENCIA');
    _query.SQL.Add('   AND H.MESCOBRANCA = HST.MESCOBRANCA');
    _query.SQL.Add('   AND B.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PF.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PROC.IDPESSOA (+) = PES.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSJUR = E.IDPESSJUR');
    _query.SQL.Add('   AND PP.IDSITPART = SP.IDSITPART');
    _query.SQL.Add('   AND PP.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND PP.IDPLANOPREV = 2');
    _query.SQL.Add('   AND PPR.IDPLANOPREV = PP.IDPLANOPREV');
    _query.SQL.Add('   AND E.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = B.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PP.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND SUBSTR(H.MESREFERENCIA,6,2) <>  ''13''');
    _query.SQL.Add('');
    _query.SQL.Add('UNION ALL');
    _query.SQL.Add('');
    _query.SQL.Add('SELECT ''2'' GRUPO,');
    _query.SQL.Add('       NULL AS MESREFERENCIA,');
    _query.SQL.Add('       NULL AS MESCOBRANCA,');
    _query.SQL.Add('       ''Subtotal Atualizado até 2008/01'' AS CONTRIBUIÇÃO,');
    _query.SQL.Add('       NULL AS VALORRECEBIDO,');
    _query.SQL.Add('       ROUND(SUM(H.VALOR), 2) AS VALOR,');
    _query.SQL.Add('       H.IDPESSOA,');
    _query.SQL.Add('       H.OPERACAO,');
    _query.SQL.Add('       PES.NOME, ');
    _query.SQL.Add('       PES.NUMDOCUMENTO,');
    _query.SQL.Add('       E.MATRICULA,');
    _query.SQL.Add('       E.DATAADMISSAO,');
    _query.SQL.Add('       B.PRIMPAGTO,');
    _query.SQL.Add('       NULL AS CODPORTFORMA,');
    _query.SQL.Add('       SP.DESCRICAO,');
    _query.SQL.Add('       PPR.NOME PLANO,');
    _query.SQL.Add('       PROC.NUMEROPROCESSO,');
    _query.SQL.Add('       PROC.DATAINICIO,');
    _query.SQL.Add('       PROC.DATAFINAL,');
    _query.SQL.Add('       DECODE(PROC.SITPROCESSO,0,''Ação Judicial em Liminar'',1,''Ação Judicial Julgada Ganha'',2,''Ação Judicial Julgada Perdida'') ACAO,');
    _query.SQL.Add('       PROC.CODVARA,');
    _query.SQL.Add('       PROC.NOMEVARA');
    _query.SQL.Add('  FROM HSTBITRIBUTACAO H,');
    _query.SQL.Add('       HSTCONTRIBPREV HST,');
    _query.SQL.Add('       CONTRIBUICAO C,');
    _query.SQL.Add('       PESSOA PES,');
    _query.SQL.Add('       BITRIBUTACAO B,');
    _query.SQL.Add('       PESSOAFISICA PF,');
    _query.SQL.Add('      PARTPREVPLAN PP,');
    _query.SQL.Add('       ELEGPATRO E,');
    _query.SQL.Add('       PLANPREV PPR,');
    _query.SQL.Add('       SITPART SP,');
    _query.SQL.Add('       (SELECT P.SITPROCESSO,');
    _query.SQL.Add('               P.IDPESSOA,');
    _query.SQL.Add('               P.NUMEROPROCESSO,');
    _query.SQL.Add('               P.CODVARA,');
    _query.SQL.Add('               P.NOMEVARA,');
    _query.SQL.Add('               P.DATAINICIO,');
    _query.SQL.Add('              P.DATAFINAL');
    _query.SQL.Add('          FROM PROCJUD P');
    _query.SQL.Add('         WHERE P.SITPROCESSO = (SELECT MIN(P.SITPROCESSO) FROM PROCJUD P)) PROC');
    _query.SQL.Add('WHERE H.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND H.OPERACAO = ''E''');
    _query.SQL.Add('   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
    _query.SQL.Add('   AND H.IDPESSOA = HST.IDPESSOA');
    _query.SQL.Add('   AND H.IDMOTIVO = HST.IDMOTIVO');
    _query.SQL.Add('   AND H.NUMRECEBIMENTO = HST.NUMRECEBIMENTO');
    _query.SQL.Add('   AND H.MESREFERENCIA = HST.MESREFERENCIA');
    _query.SQL.Add('   AND H.MESCOBRANCA = HST.MESCOBRANCA');
    _query.SQL.Add('   AND B.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PF.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PROC.IDPESSOA(+) = PES.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSJUR = E.IDPESSJUR');
    _query.SQL.Add('   AND PP.IDSITPART = SP.IDSITPART');
    _query.SQL.Add('   AND PP.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND PP.IDPLANOPREV = 2');
    _query.SQL.Add('   AND PPR.IDPLANOPREV = PP.IDPLANOPREV');
    _query.SQL.Add('   AND E.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = B.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PP.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND SUBSTR(H.MESREFERENCIA, 6, 2) <> ''13''');
    _query.SQL.Add('GROUP BY H.IDPESSOA,');
    _query.SQL.Add('          H.OPERACAO,');
    _query.SQL.Add('          PES.NOME, ');
    _query.SQL.Add('          PES.NUMDOCUMENTO,');
    _query.SQL.Add('          E.MATRICULA,');
    _query.SQL.Add('          E.DATAADMISSAO,');
    _query.SQL.Add('          B.PRIMPAGTO,');
    _query.SQL.Add('          SP.DESCRICAO,');
    _query.SQL.Add('          PPR.NOME,');
    _query.SQL.Add('          PROC.NUMEROPROCESSO,');
    _query.SQL.Add('          PROC.DATAINICIO,');
    _query.SQL.Add('          PROC.DATAFINAL,');
    _query.SQL.Add('          PROC.SITPROCESSO,');
    _query.SQL.Add('          PROC.CODVARA,');
    _query.SQL.Add('          PROC.NOMEVARA');
    _query.SQL.Add('');
    _query.SQL.Add('');
    _query.SQL.Add('UNION ALL ');
    _query.SQL.Add('');
    _query.SQL.Add('SELECT ''3'' GRUPO,');
    _query.SQL.Add('       NULL AS MESREFERENCIA,');
    _query.SQL.Add('       NULL AS MESCOBRANCA,');
    _query.SQL.Add('       (''Subtotal Atualizado até '' ||');
    _query.SQL.Add('       (SELECT HST.MESCOBRANCA');
    _query.SQL.Add('           FROM HSTBITRIBUTACAO HST');
    _query.SQL.Add('          WHERE HST.IDPESSOA = (SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = '''+_matricula+''')');
    _query.SQL.Add('            AND HST.OPERACAO = ''A''');
    _query.SQL.Add('            AND HST.MESCOBRANCA =');
    _query.SQL.Add('                (SELECT DATA');
    _query.SQL.Add('                   FROM ((SELECT MIN(H.MESCOBRANCA) AS DATA');
    _query.SQL.Add('                            FROM HSTBITRIBUTACAO H, BITRIBUTACAO B');
    _query.SQL.Add('                           WHERE H.OPERACAO = ''S''');
    _query.SQL.Add('                             AND B.IDPESSOA = H.IDPESSOA');
    _query.SQL.Add('                             AND H.IDPESSOA IN');
    _query.SQL.Add('                                 (SELECT IDPESSOA');
    _query.SQL.Add('                                    FROM ELEGPATRO E');
    _query.SQL.Add('                                   WHERE E.MATRICULA IN ('''+_matricula+'''))) UNION');
    _query.SQL.Add('                         (SELECT MAX(H.MESREFERENCIA) AS DATA');
    _query.SQL.Add('                            FROM HSTBITRIBUTACAO H');
    _query.SQL.Add('                           WHERE H.OPERACAO = ''A''');
    _query.SQL.Add('                             AND H.IDPESSOA IN');
    _query.SQL.Add('                                 (SELECT IDPESSOA');
    _query.SQL.Add('                                    FROM ELEGPATRO E');
    _query.SQL.Add('                                   WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('                             AND NOT EXISTS');
    _query.SQL.Add('                           (SELECT 1');
    _query.SQL.Add('                                    FROM HSTBITRIBUTACAO H1');
    _query.SQL.Add('                                   WHERE H1.OPERACAO = ''S''');
    _query.SQL.Add('                                     AND H1.IDPESSOA = H.IDPESSOA)))');
    _query.SQL.Add('                  WHERE DATA IS NOT NULL))) AS CONTRIBUIÇÃO,');
    _query.SQL.Add('       NULL AS VALORRECEBIDO,');
    _query.SQL.Add('       ROUND(SUM(H.VALOR) *');
    _query.SQL.Add('             (SELECT NVL(EXP(SUM(LN(COT.COTVALOR / 100 + 1))), 1) AS IND_VLR_ACUMULADO');
    _query.SQL.Add('                FROM COTACAOMOEDA COT');
    _query.SQL.Add('                JOIN (SELECT DTINI.VALOR  AS DATAINICIO,');
    _query.SQL.Add('                            DTFIM.VALOR  AS DATAFIM,');
    _query.SQL.Add('                            INDICE.VALOR AS INDICE');
    _query.SQL.Add('                       FROM (SELECT V.NUMLINHA,');
    _query.SQL.Add('                                    SUBSTR(V.VALOR, 7, 4) ||');
    _query.SQL.Add('                                    SUBSTR(V.VALOR, 3, 3) AS VALOR');
    _query.SQL.Add('                               FROM VALTABGENER V');
    _query.SQL.Add('                              WHERE V.CODTABELA = ''IN 1343''');
    _query.SQL.Add('                                AND V.CODCAMPO = ''DATA INI '') DTINI');
    _query.SQL.Add('                       JOIN (SELECT V.NUMLINHA,');
    _query.SQL.Add('                                   SUBSTR(V.VALOR, 7, 4) ||');
    _query.SQL.Add('                                   SUBSTR(V.VALOR, 3, 3) AS VALOR');
    _query.SQL.Add('                              FROM VALTABGENER V');
    _query.SQL.Add('                             WHERE V.CODTABELA = ''IN 1343''');
    _query.SQL.Add('                               AND V.CODCAMPO = ''DATA FIM'') DTFIM');
    _query.SQL.Add('                         ON DTFIM.NUMLINHA = DTINI.NUMLINHA');
    _query.SQL.Add('                       JOIN (SELECT V.NUMLINHA, V.VALOR');
    _query.SQL.Add('                              FROM VALTABGENER V');
    _query.SQL.Add('                             WHERE V.CODTABELA = ''IN 1343''');
    _query.SQL.Add('                               AND V.CODCAMPO = ''INDICE'') INDICE');
    _query.SQL.Add('                         ON INDICE.NUMLINHA = DTINI.NUMLINHA');
    _query.SQL.Add('                     WHERE DTINI.VALOR >= ''2007/12'') BI_INDICES');
    _query.SQL.Add('                  ON COT.MOECODIGO = BI_INDICES.INDICE');
    _query.SQL.Add('                 AND TO_CHAR(COT.COTDATA, ''YYYY/MM'') >=');
    _query.SQL.Add('                     BI_INDICES.DATAINICIO');
    _query.SQL.Add('                 AND TO_CHAR(COT.COTDATA, ''YYYY/MM'') <= BI_INDICES.DATAFIM');
    _query.SQL.Add('               WHERE TO_CHAR(COT.COTDATA, ''YYYY/MM'') <=');
    _query.SQL.Add('                     (SELECT HST.MESCOBRANCA');
    _query.SQL.Add('                        FROM HSTBITRIBUTACAO HST');
    _query.SQL.Add('                       WHERE HST.IDPESSOA =');
    _query.SQL.Add('                             (SELECT IDPESSOA');
    _query.SQL.Add('                                FROM ELEGPATRO');
    _query.SQL.Add('                               WHERE MATRICULA = '''+_matricula+''')');
    _query.SQL.Add('                         AND HST.OPERACAO = ''A''');
    _query.SQL.Add('                        AND HST.MESCOBRANCA =');
    _query.SQL.Add('                             (SELECT DATA');
    _query.SQL.Add('                                FROM ((SELECT MIN(H.MESCOBRANCA) AS DATA');
    _query.SQL.Add('                                         FROM HSTBITRIBUTACAO H, BITRIBUTACAO B');
    _query.SQL.Add('                                        WHERE H.OPERACAO = ''S''');
    _query.SQL.Add('                                          AND B.IDPESSOA = H.IDPESSOA');
    _query.SQL.Add('                                          AND H.IDPESSOA IN');
    _query.SQL.Add('                                              (SELECT IDPESSOA');
    _query.SQL.Add('                                                 FROM ELEGPATRO E');
    _query.SQL.Add('                                                WHERE E.MATRICULA IN');
    _query.SQL.Add('                                                      ('''+_matricula+'''))) UNION');
    _query.SQL.Add('                                      (SELECT MAX(H.MESREFERENCIA) AS DATA');
    _query.SQL.Add('                                         FROM HSTBITRIBUTACAO H');
    _query.SQL.Add('                                        WHERE H.OPERACAO = ''A''');
    _query.SQL.Add('                                          AND H.IDPESSOA IN');
    _query.SQL.Add('                                              (SELECT IDPESSOA');
    _query.SQL.Add('                                                 FROM ELEGPATRO E');
    _query.SQL.Add('                                                WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('                                          AND NOT EXISTS');
    _query.SQL.Add('                                        (SELECT 1');
    _query.SQL.Add('                                                 FROM HSTBITRIBUTACAO H1');
    _query.SQL.Add('                                                WHERE H1.OPERACAO = ''S''');
    _query.SQL.Add('                                                  AND H1.IDPESSOA = H.IDPESSOA)))');
    _query.SQL.Add('                               WHERE DATA IS NOT NULL))),');
    _query.SQL.Add('             2) AS VALOR,');
    _query.SQL.Add('       H.IDPESSOA,');
    _query.SQL.Add('       H.OPERACAO,');
    _query.SQL.Add('       PES.NOME, ');
    _query.SQL.Add('       PES.NUMDOCUMENTO,');
    _query.SQL.Add('       E.MATRICULA,');
    _query.SQL.Add('       E.DATAADMISSAO,');
    _query.SQL.Add('       B.PRIMPAGTO,');
    _query.SQL.Add('       NULL AS CODPORTFORMA,');
    _query.SQL.Add('       SP.DESCRICAO,');
    _query.SQL.Add('       PPR.NOME PLANO,');
    _query.SQL.Add('       PROC.NUMEROPROCESSO,');
    _query.SQL.Add('       PROC.DATAINICIO,');
    _query.SQL.Add('       PROC.DATAFINAL,');
    _query.SQL.Add('       DECODE(PROC.SITPROCESSO,0,''Ação Judicial em Liminar'',1,''Ação Judicial Julgada Ganha'',2,''Ação Judicial Julgada Perdida'') ACAO,');
    _query.SQL.Add('       PROC.CODVARA,');
    _query.SQL.Add('       PROC.NOMEVARA');
    _query.SQL.Add('  FROM HSTBITRIBUTACAO H,');
    _query.SQL.Add('       HSTCONTRIBPREV HST,');
    _query.SQL.Add('       CONTRIBUICAO C,');
    _query.SQL.Add('       PESSOA PES,');
    _query.SQL.Add('       BITRIBUTACAO B,');
    _query.SQL.Add('       PESSOAFISICA PF,');
    _query.SQL.Add('       PARTPREVPLAN PP,');
    _query.SQL.Add('       ELEGPATRO E,');
    _query.SQL.Add('       PLANPREV PPR,');
    _query.SQL.Add('       SITPART SP,');
    _query.SQL.Add('       (SELECT P.SITPROCESSO,');
    _query.SQL.Add('               P.IDPESSOA,');
    _query.SQL.Add('               P.NUMEROPROCESSO,');
    _query.SQL.Add('               P.CODVARA,');
    _query.SQL.Add('               P.NOMEVARA,');
    _query.SQL.Add('               P.DATAINICIO,');
    _query.SQL.Add('               P.DATAFINAL');
    _query.SQL.Add('          FROM PROCJUD P');
    _query.SQL.Add('         WHERE P.SITPROCESSO = (SELECT MIN(P.SITPROCESSO) FROM PROCJUD P)) PROC');
    _query.SQL.Add('WHERE H.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND H.OPERACAO = ''E''');
    _query.SQL.Add('   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
    _query.SQL.Add('   AND H.IDPESSOA = HST.IDPESSOA');
    _query.SQL.Add('   AND H.IDMOTIVO = HST.IDMOTIVO');
    _query.SQL.Add('   AND H.NUMRECEBIMENTO = HST.NUMRECEBIMENTO');
    _query.SQL.Add('   AND H.MESREFERENCIA = HST.MESREFERENCIA');
    _query.SQL.Add('   AND H.MESCOBRANCA = HST.MESCOBRANCA');
    _query.SQL.Add('   AND B.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PF.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PROC.IDPESSOA(+) = PES.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSJUR = E.IDPESSJUR');
    _query.SQL.Add('   AND PP.IDSITPART = SP.IDSITPART');
    _query.SQL.Add('   AND PP.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_Matricula+'''))');
    _query.SQL.Add('   AND PP.IDPLANOPREV = 2');
    _query.SQL.Add('   AND PPR.IDPLANOPREV = PP.IDPLANOPREV');
    _query.SQL.Add('   AND E.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = B.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PP.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND SUBSTR(H.MESREFERENCIA, 6, 2) <> ''13''');
    _query.SQL.Add('GROUP BY H.IDPESSOA,');
    _query.SQL.Add('          H.OPERACAO,');
    _query.SQL.Add('          PES.NOME, ');
    _query.SQL.Add('          PES.NUMDOCUMENTO,');
    _query.SQL.Add('          E.MATRICULA,');
    _query.SQL.Add('          E.DATAADMISSAO,');
    _query.SQL.Add('          B.PRIMPAGTO,');
    _query.SQL.Add('          SP.DESCRICAO,');
    _query.SQL.Add('          PPR.NOME,');
    _query.SQL.Add('          PROC.NUMEROPROCESSO,');
    _query.SQL.Add('          PROC.DATAINICIO,');
    _query.SQL.Add('          PROC.DATAFINAL,');
    _query.SQL.Add('          PROC.SITPROCESSO,');
    _query.SQL.Add('          PROC.CODVARA,');
    _query.SQL.Add('          PROC.NOMEVARA');
    _query.SQL.Add('');
    _query.SQL.Add('UNION ALL');
    _query.SQL.Add('');
    _query.SQL.Add('SELECT ''4'' GRUPO,');
    _query.SQL.Add('       H.MESREFERENCIA,');
    _query.SQL.Add('       H.MESCOBRANCA,');
    _query.SQL.Add('       C.NOME CONTRIBUIÇÃO,');
    _query.SQL.Add('       DECODE(HST.FLGDEVOLUCAO, 1,-HST.VALORRECEBIDO, HST.VALORRECEBIDO) AS VALORRECEBIDO,');
    _query.SQL.Add('       H.VALOR,');
    _query.SQL.Add('       H.IDPESSOA,');
    _query.SQL.Add('       H.OPERACAO,');
    _query.SQL.Add('       PES.NOME, ');
    _query.SQL.Add('       PES.NUMDOCUMENTO,');
    _query.SQL.Add('       E.MATRICULA,');
    _query.SQL.Add('       E.DATAADMISSAO,');
    _query.SQL.Add('       B.PRIMPAGTO,');
    _query.SQL.Add('       SP.CODPORTFORMA,');
    _query.SQL.Add('       SP.DESCRICAO,');
    _query.SQL.Add('       PPR.NOME PLANO,');
    _query.SQL.Add('       PROC.NUMEROPROCESSO,');
    _query.SQL.Add('       PROC.DATAINICIO,');
    _query.SQL.Add('       PROC.DATAFINAL,');
    _query.SQL.Add('       DECODE(PROC.SITPROCESSO,0, ''Ação Judicial em Liminar'',1,''Ação Judicial Julgada Ganha'',2,''Ação Judicial Julgada Perdida'') acao,');
    _query.SQL.Add('       PROC.CODVARA,');
    _query.SQL.Add('       PROC.NOMEVARA');
    _query.SQL.Add('  FROM HSTBITRIBUTACAO H,');
    _query.SQL.Add('       HSTCONTRIBPREV  HST,');
    _query.SQL.Add('       CONTRIBUICAO    C,');
    _query.SQL.Add('       PESSOA          PES,       ');
    _query.SQL.Add('       BITRIBUTACAO    B,');
    _query.SQL.Add('       PESSOAFISICA    PF,');
    _query.SQL.Add('       PARTPREVPLAN    PP,');
    _query.SQL.Add('       ELEGPATRO       E,');
    _query.SQL.Add('       PLANPREV        PPR,');
    _query.SQL.Add('       SITPART         SP,');
    _query.SQL.Add('             (SELECT  P.SITPROCESSO,');
    _query.SQL.Add('             P.IDPESSOA,');
    _query.SQL.Add('             P.NUMEROPROCESSO,');
    _query.SQL.Add('            P.CODVARA,');
    _query.SQL.Add('             P.NOMEVARA,');
    _query.SQL.Add('             P.DATAINICIO,');
    _query.SQL.Add('             P.DATAFINAL');
    _query.SQL.Add('        FROM PROCJUD P');
    _query.SQL.Add('       WHERE P.SITPROCESSO = (SELECT MIN(P.SITPROCESSO)FROM PROCJUD P)) PROC       ');
    _query.SQL.Add(' WHERE H.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND H.OPERACAO = ''E''');
    _query.SQL.Add('   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
    _query.SQL.Add('   AND H.IDPESSOA = HST.IDPESSOA');
    _query.SQL.Add('   AND H.IDMOTIVO = HST.IDMOTIVO');
    _query.SQL.Add('   AND H.NUMRECEBIMENTO = HST.NUMRECEBIMENTO');
    _query.SQL.Add('   AND H.MESREFERENCIA = HST.MESREFERENCIA');
    _query.SQL.Add('   AND H.MESCOBRANCA = HST.MESCOBRANCA');
    _query.SQL.Add('   AND B.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PF.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PROC.IDPESSOA (+) = PES.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSJUR = E.IDPESSJUR');
    _query.SQL.Add('   AND PP.IDSITPART = SP.IDSITPART');
    _query.SQL.Add('   AND PP.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND PP.IDPLANOPREV = 2');
    _query.SQL.Add('   AND PPR.IDPLANOPREV = PP.IDPLANOPREV');
    _query.SQL.Add('   AND E.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = B.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PP.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND SUBSTR(H.MESREFERENCIA,6,2) =  ''13''');
    _query.SQL.Add('');
    _query.SQL.Add('UNION ALL');
    _query.SQL.Add('');
    _query.SQL.Add('SELECT ''5'' GRUPO,');
    _query.SQL.Add('       NULL AS MESREFERENCIA,');
    _query.SQL.Add('       NULL AS MESCOBRANCA,');
    _query.SQL.Add('       ''Subtotal de Abono Atualizado até 2008/01'' AS CONTRIBUIÇÃO,');
    _query.SQL.Add('       NULL AS VALORRECEBIDO,');
    _query.SQL.Add('       ROUND(SUM(H.VALOR), 2) AS VALOR,');
    _query.SQL.Add('       H.IDPESSOA,');
    _query.SQL.Add('       H.OPERACAO,');
    _query.SQL.Add('       PES.NOME, ');
    _query.SQL.Add('       PES.NUMDOCUMENTO,');
    _query.SQL.Add('       E.MATRICULA,');
    _query.SQL.Add('       E.DATAADMISSAO,');
    _query.SQL.Add('       B.PRIMPAGTO,');
    _query.SQL.Add('       NULL AS CODPORTFORMA,');
    _query.SQL.Add('       SP.DESCRICAO,');
    _query.SQL.Add('       PPR.NOME PLANO,');
    _query.SQL.Add('       PROC.NUMEROPROCESSO,');
    _query.SQL.Add('       PROC.DATAINICIO,');
    _query.SQL.Add('       PROC.DATAFINAL,');
    _query.SQL.Add('       DECODE(PROC.SITPROCESSO,0,''Ação Judicial em Liminar'',1,''Ação Judicial Julgada Ganha'',2,''Ação Judicial Julgada Perdida'') ACAO,');
    _query.SQL.Add('       PROC.CODVARA,');
    _query.SQL.Add('       PROC.NOMEVARA');
    _query.SQL.Add('  FROM HSTBITRIBUTACAO H,');
    _query.SQL.Add('       HSTCONTRIBPREV HST,');
    _query.SQL.Add('       CONTRIBUICAO C,');
    _query.SQL.Add('       PESSOA PES,');
    _query.SQL.Add('       BITRIBUTACAO B,');
    _query.SQL.Add('       PESSOAFISICA PF,');
    _query.SQL.Add('       PARTPREVPLAN PP,');
    _query.SQL.Add('       ELEGPATRO E,');
    _query.SQL.Add('       PLANPREV PPR,');
    _query.SQL.Add('       SITPART SP,');
    _query.SQL.Add('       (SELECT P.SITPROCESSO,');
    _query.SQL.Add('               P.IDPESSOA,');
    _query.SQL.Add('               P.NUMEROPROCESSO,');
    _query.SQL.Add('               P.CODVARA,');
    _query.SQL.Add('               P.NOMEVARA,');
    _query.SQL.Add('               P.DATAINICIO,');
    _query.SQL.Add('               P.DATAFINAL');
    _query.SQL.Add('          FROM PROCJUD P');
    _query.SQL.Add('         WHERE P.SITPROCESSO = (SELECT MIN(P.SITPROCESSO) FROM PROCJUD P)) PROC');
    _query.SQL.Add('WHERE H.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND H.OPERACAO = ''E''');
    _query.SQL.Add('   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
    _query.SQL.Add('   AND H.IDPESSOA = HST.IDPESSOA');
    _query.SQL.Add('   AND H.IDMOTIVO = HST.IDMOTIVO');
    _query.SQL.Add('   AND H.NUMRECEBIMENTO = HST.NUMRECEBIMENTO');
    _query.SQL.Add('   AND H.MESREFERENCIA = HST.MESREFERENCIA');
    _query.SQL.Add('   AND H.MESCOBRANCA = HST.MESCOBRANCA');
    _query.SQL.Add('   AND B.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PF.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PROC.IDPESSOA(+) = PES.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSJUR = E.IDPESSJUR');
    _query.SQL.Add('   AND PP.IDSITPART = SP.IDSITPART');
    _query.SQL.Add('   AND PP.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND PP.IDPLANOPREV = 2');
    _query.SQL.Add('   AND PPR.IDPLANOPREV = PP.IDPLANOPREV');
    _query.SQL.Add('   AND E.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = B.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PP.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND SUBSTR(H.MESREFERENCIA, 6, 2) = ''13''');
    _query.SQL.Add('GROUP BY H.IDPESSOA,');
    _query.SQL.Add('          H.OPERACAO,');
    _query.SQL.Add('          PES.NOME, ');
    _query.SQL.Add('          PES.NUMDOCUMENTO,');
    _query.SQL.Add('          E.MATRICULA,');
    _query.SQL.Add('          E.DATAADMISSAO,');
    _query.SQL.Add('          B.PRIMPAGTO,');
    _query.SQL.Add('          SP.DESCRICAO,');
    _query.SQL.Add('          PPR.NOME,');
    _query.SQL.Add('          PROC.NUMEROPROCESSO,');
    _query.SQL.Add('          PROC.DATAINICIO,');
    _query.SQL.Add('          PROC.DATAFINAL,');
    _query.SQL.Add('          PROC.SITPROCESSO,');
    _query.SQL.Add('          PROC.CODVARA,');
    _query.SQL.Add('          PROC.NOMEVARA');
    _query.SQL.Add('          ');
    _query.SQL.Add('UNION ALL          ');
    _query.SQL.Add('');
    _query.SQL.Add('SELECT ''6'' GRUPO,');
    _query.SQL.Add('       NULL AS MESREFERENCIA,');
    _query.SQL.Add('       NULL AS MESCOBRANCA,');
    _query.SQL.Add('       (''Subtotal de Abono Atualizado até '' ||');
    _query.SQL.Add('       (SELECT HST.MESCOBRANCA');
    _query.SQL.Add('           FROM HSTBITRIBUTACAO HST');
    _query.SQL.Add('          WHERE HST.IDPESSOA = (SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = '''+_matricula+''')');
    _query.SQL.Add('            AND HST.OPERACAO = ''A''');
    _query.SQL.Add('           AND HST.MESCOBRANCA =');
    _query.SQL.Add('                (SELECT DATA');
    _query.SQL.Add('                   FROM ((SELECT MIN(H.MESCOBRANCA) AS DATA');
    _query.SQL.Add('                            FROM HSTBITRIBUTACAO H, BITRIBUTACAO B');
    _query.SQL.Add('                           WHERE H.OPERACAO = ''S''');
    _query.SQL.Add('                             AND B.IDPESSOA = H.IDPESSOA');
    _query.SQL.Add('                             AND H.IDPESSOA IN');
    _query.SQL.Add('                                 (SELECT IDPESSOA');
    _query.SQL.Add('                                    FROM ELEGPATRO E');
    _query.SQL.Add('                                   WHERE E.MATRICULA IN ('''+_matricula+'''))) UNION');
    _query.SQL.Add('                         (SELECT MAX(H.MESREFERENCIA) AS DATA');
    _query.SQL.Add('                            FROM HSTBITRIBUTACAO H');
    _query.SQL.Add('                           WHERE H.OPERACAO = ''A''');
    _query.SQL.Add('                             AND H.IDPESSOA IN');
    _query.SQL.Add('                                 (SELECT IDPESSOA');
    _query.SQL.Add('                                    FROM ELEGPATRO E');
    _query.SQL.Add('                                   WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('                             AND NOT EXISTS');
    _query.SQL.Add('                           (SELECT 1');
    _query.SQL.Add('                                    FROM HSTBITRIBUTACAO H1');
    _query.SQL.Add('                                   WHERE H1.OPERACAO = ''S''');
    _query.SQL.Add('                                     AND H1.IDPESSOA = H.IDPESSOA)))');
    _query.SQL.Add('                  WHERE DATA IS NOT NULL))) AS CONTRIBUIÇÃO,');
    _query.SQL.Add('       NULL AS VALORRECEBIDO,');
    _query.SQL.Add('       ROUND(SUM(H.VALOR) *');
    _query.SQL.Add('             (SELECT NVL(EXP(SUM(LN(COT.COTVALOR / 100 + 1))), 1) AS IND_VLR_ACUMULADO');
    _query.SQL.Add('                FROM COTACAOMOEDA COT');
    _query.SQL.Add('                JOIN (SELECT DTINI.VALOR  AS DATAINICIO,');
    _query.SQL.Add('                            DTFIM.VALOR  AS DATAFIM,');
    _query.SQL.Add('                            INDICE.VALOR AS INDICE');
    _query.SQL.Add('                       FROM (SELECT V.NUMLINHA,');
    _query.SQL.Add('                                    SUBSTR(V.VALOR, 7, 4) ||');
    _query.SQL.Add('                                    SUBSTR(V.VALOR, 3, 3) AS VALOR');
    _query.SQL.Add('                               FROM VALTABGENER V');
    _query.SQL.Add('                              WHERE V.CODTABELA = ''IN 1343''');
    _query.SQL.Add('                                AND V.CODCAMPO = ''DATA INI '') DTINI');
    _query.SQL.Add('                       JOIN (SELECT V.NUMLINHA,');
    _query.SQL.Add('                                   SUBSTR(V.VALOR, 7, 4) ||');
    _query.SQL.Add('                                   SUBSTR(V.VALOR, 3, 3) AS VALOR');
    _query.SQL.Add('                              FROM VALTABGENER V');
    _query.SQL.Add('                             WHERE V.CODTABELA = ''IN 1343''');
    _query.SQL.Add('                               AND V.CODCAMPO = ''DATA FIM'') DTFIM');
    _query.SQL.Add('                         ON DTFIM.NUMLINHA = DTINI.NUMLINHA');
    _query.SQL.Add('                       JOIN (SELECT V.NUMLINHA, V.VALOR');
    _query.SQL.Add('                              FROM VALTABGENER V');
    _query.SQL.Add('                             WHERE V.CODTABELA = ''IN 1343''');
    _query.SQL.Add('                               AND V.CODCAMPO = ''INDICE'') INDICE');
    _query.SQL.Add('                         ON INDICE.NUMLINHA = DTINI.NUMLINHA');
    _query.SQL.Add('                      WHERE DTINI.VALOR >= ''2007/12'') BI_INDICES');
    _query.SQL.Add('                  ON COT.MOECODIGO = BI_INDICES.INDICE');
    _query.SQL.Add('                 AND TO_CHAR(COT.COTDATA, ''YYYY/MM'') >=');
    _query.SQL.Add('                     BI_INDICES.DATAINICIO');
    _query.SQL.Add('                 AND TO_CHAR(COT.COTDATA, ''YYYY/MM'') <= BI_INDICES.DATAFIM');
    _query.SQL.Add('               WHERE TO_CHAR(COT.COTDATA, ''YYYY/MM'') <=');
    _query.SQL.Add('                     (SELECT HST.MESCOBRANCA');
    _query.SQL.Add('                       FROM HSTBITRIBUTACAO HST');
    _query.SQL.Add('                       WHERE HST.IDPESSOA =');
    _query.SQL.Add('                             (SELECT IDPESSOA');
    _query.SQL.Add('                                FROM ELEGPATRO');
    _query.SQL.Add('                               WHERE MATRICULA = '''+_matricula+''')');
    _query.SQL.Add('                         AND HST.OPERACAO = ''A''');
    _query.SQL.Add('                         AND HST.MESCOBRANCA =');
    _query.SQL.Add('                             (SELECT DATA');
    _query.SQL.Add('                                FROM ((SELECT MIN(H.MESCOBRANCA) AS DATA');
    _query.SQL.Add('                                         FROM HSTBITRIBUTACAO H, BITRIBUTACAO B');
    _query.SQL.Add('                                        WHERE H.OPERACAO = ''S''');
    _query.SQL.Add('                                          AND B.IDPESSOA = H.IDPESSOA');
    _query.SQL.Add('                                          AND H.IDPESSOA IN');
    _query.SQL.Add('                                              (SELECT IDPESSOA');
    _query.SQL.Add('                                                 FROM ELEGPATRO E');
    _query.SQL.Add('                                                WHERE E.MATRICULA IN');
    _query.SQL.Add('                                                      ('''+_matricula+'''))) UNION');
    _query.SQL.Add('                                      (SELECT MAX(H.MESREFERENCIA) AS DATA');
    _query.SQL.Add('                                         FROM HSTBITRIBUTACAO H');
    _query.SQL.Add('                                        WHERE H.OPERACAO = ''A''');
    _query.SQL.Add('                                          AND H.IDPESSOA IN');
    _query.SQL.Add('                                              (SELECT IDPESSOA');
    _query.SQL.Add('                                                 FROM ELEGPATRO E');
    _query.SQL.Add('                                                WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('                                          AND NOT EXISTS');
    _query.SQL.Add('                                        (SELECT 1');
    _query.SQL.Add('                                                 FROM HSTBITRIBUTACAO H1');
    _query.SQL.Add('                                                WHERE H1.OPERACAO = ''S''');
    _query.SQL.Add('                                                  AND H1.IDPESSOA = H.IDPESSOA)))');
    _query.SQL.Add('                               WHERE DATA IS NOT NULL))),');
    _query.SQL.Add('             2) AS VALOR,');
    _query.SQL.Add('       H.IDPESSOA,');
    _query.SQL.Add('       H.OPERACAO,');
    _query.SQL.Add('       PES.NOME, ');
    _query.SQL.Add('       PES.NUMDOCUMENTO,');
    _query.SQL.Add('       E.MATRICULA,');
    _query.SQL.Add('       E.DATAADMISSAO,');
    _query.SQL.Add('       B.PRIMPAGTO,');
    _query.SQL.Add('       NULL AS CODPORTFORMA,');
    _query.SQL.Add('       SP.DESCRICAO,');
    _query.SQL.Add('       PPR.NOME PLANO,');
    _query.SQL.Add('       PROC.NUMEROPROCESSO,');
    _query.SQL.Add('       PROC.DATAINICIO,');
    _query.SQL.Add('       PROC.DATAFINAL,');
    _query.SQL.Add('       DECODE(PROC.SITPROCESSO,0,''Ação Judicial em Liminar'',1,''Ação Judicial Julgada Ganha'',2,''Ação Judicial Julgada Perdida'') ACAO,');
    _query.SQL.Add('       PROC.CODVARA,');
    _query.SQL.Add('       PROC.NOMEVARA');
    _query.SQL.Add('  FROM HSTBITRIBUTACAO H,');
    _query.SQL.Add('       HSTCONTRIBPREV HST,');
    _query.SQL.Add('       CONTRIBUICAO C,');
    _query.SQL.Add('       PESSOA PES,');
    _query.SQL.Add('       BITRIBUTACAO B,');
    _query.SQL.Add('       PESSOAFISICA PF,');
    _query.SQL.Add('       PARTPREVPLAN PP,');
    _query.SQL.Add('       ELEGPATRO E,');
    _query.SQL.Add('       PLANPREV PPR,');
    _query.SQL.Add('       SITPART SP,');
    _query.SQL.Add('       (SELECT P.SITPROCESSO,');
    _query.SQL.Add('               P.IDPESSOA,');
    _query.SQL.Add('               P.NUMEROPROCESSO,');
    _query.SQL.Add('               P.CODVARA,');
    _query.SQL.Add('               P.NOMEVARA,');
    _query.SQL.Add('               P.DATAINICIO,');
    _query.SQL.Add('               P.DATAFINAL');
    _query.SQL.Add('          FROM PROCJUD P');
    _query.SQL.Add('         WHERE P.SITPROCESSO = (SELECT MIN(P.SITPROCESSO) FROM PROCJUD P)) PROC');
    _query.SQL.Add('WHERE H.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND H.OPERACAO = ''E''');
    _query.SQL.Add('   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
    _query.SQL.Add('   AND H.IDPESSOA = HST.IDPESSOA');
    _query.SQL.Add('   AND H.IDMOTIVO = HST.IDMOTIVO');
    _query.SQL.Add('   AND H.NUMRECEBIMENTO = HST.NUMRECEBIMENTO');
    _query.SQL.Add('   AND H.MESREFERENCIA = HST.MESREFERENCIA');
    _query.SQL.Add('   AND H.MESCOBRANCA = HST.MESCOBRANCA');
    _query.SQL.Add('   AND B.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PF.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PROC.IDPESSOA(+) = PES.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSJUR = E.IDPESSJUR');
    _query.SQL.Add('   AND PP.IDSITPART = SP.IDSITPART');
    _query.SQL.Add('   AND PP.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND PP.IDPLANOPREV = 2');
    _query.SQL.Add('   AND PPR.IDPLANOPREV = PP.IDPLANOPREV');
    _query.SQL.Add('   AND E.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = B.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PP.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND SUBSTR(H.MESREFERENCIA, 6, 2) = ''13''');
    _query.SQL.Add('GROUP BY H.IDPESSOA,');
    _query.SQL.Add('          H.OPERACAO,');
    _query.SQL.Add('          PES.NOME, ');
    _query.SQL.Add('          PES.NUMDOCUMENTO,');
    _query.SQL.Add('          E.MATRICULA,');
    _query.SQL.Add('          E.DATAADMISSAO,');
    _query.SQL.Add('          B.PRIMPAGTO,');
    _query.SQL.Add('          SP.DESCRICAO,');
    _query.SQL.Add('          PPR.NOME,');
    _query.SQL.Add('          PROC.NUMEROPROCESSO,');
    _query.SQL.Add('          PROC.DATAINICIO,');
    _query.SQL.Add('          PROC.DATAFINAL,');
    _query.SQL.Add('         PROC.SITPROCESSO,');
    _query.SQL.Add('          PROC.CODVARA,');
    _query.SQL.Add('          PROC.NOMEVARA');
    _query.SQL.Add('');
    _query.SQL.Add('UNION');
    _query.SQL.Add('');
    _query.SQL.Add('SELECT ''7'' GRUPO,');
    _query.SQL.Add('       NULL AS MESREFERENCIA,');
    _query.SQL.Add('       NULL AS MESCOBRANCA,');
    //_query.SQL.Add('       (''SALDO TOTAL A COMPE. ATUALIZADO ATÉ '' ||');
    _query.SQL.Add('       (''SALDO TOTAL A COMPENSAR ATUALIZADO ATÉ '' ||');
    _query.SQL.Add('       (SELECT HST.MESCOBRANCA');
    _query.SQL.Add('           FROM HSTBITRIBUTACAO HST');
    _query.SQL.Add('          WHERE HST.IDPESSOA = (SELECT IDPESSOA FROM ELEGPATRO WHERE MATRICULA = '''+_matricula+''')');
    _query.SQL.Add('            AND HST.OPERACAO = ''A''');
    _query.SQL.Add('            AND HST.MESCOBRANCA =');
    _query.SQL.Add('                (SELECT DATA');
    _query.SQL.Add('                   FROM ((SELECT MIN(H.MESCOBRANCA) AS DATA');
    _query.SQL.Add('                            FROM HSTBITRIBUTACAO H, BITRIBUTACAO B');
    _query.SQL.Add('                           WHERE H.OPERACAO = ''S''');
    _query.SQL.Add('                             AND B.IDPESSOA = H.IDPESSOA');
    _query.SQL.Add('                             AND H.IDPESSOA IN');
    _query.SQL.Add('                                 (SELECT IDPESSOA');
    _query.SQL.Add('                                    FROM ELEGPATRO E');
    _query.SQL.Add('                                   WHERE E.MATRICULA IN ('''+_matricula+'''))) UNION');
    _query.SQL.Add('                         (SELECT MAX(H.MESREFERENCIA) AS DATA');
    _query.SQL.Add('                            FROM HSTBITRIBUTACAO H');
    _query.SQL.Add('                           WHERE H.OPERACAO = ''A''');
    _query.SQL.Add('                             AND H.IDPESSOA IN');
    _query.SQL.Add('                                 (SELECT IDPESSOA');
    _query.SQL.Add('                                    FROM ELEGPATRO E');
    _query.SQL.Add('                                   WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('                             AND NOT EXISTS');
    _query.SQL.Add('                           (SELECT 1');
    _query.SQL.Add('                                    FROM HSTBITRIBUTACAO H1');
    _query.SQL.Add('                                   WHERE H1.OPERACAO = ''S''');
    _query.SQL.Add('                                     AND H1.IDPESSOA = H.IDPESSOA)))');
    _query.SQL.Add('                  WHERE DATA IS NOT NULL))) AS CONTRIBUIÇÃO,');
    _query.SQL.Add('       NULL AS VALORRECEBIDO,');
    _query.SQL.Add('       ROUND(SUM(H.VALOR) *');
    _query.SQL.Add('             (SELECT NVL(EXP(SUM(LN(COT.COTVALOR / 100 + 1))), 1) AS IND_VLR_ACUMULADO');
    _query.SQL.Add('                FROM COTACAOMOEDA COT');
    _query.SQL.Add('                JOIN (SELECT DTINI.VALOR  AS DATAINICIO,');
    _query.SQL.Add('                            DTFIM.VALOR  AS DATAFIM,');
    _query.SQL.Add('                            INDICE.VALOR AS INDICE');
    _query.SQL.Add('                       FROM (SELECT V.NUMLINHA,');
    _query.SQL.Add('                                    SUBSTR(V.VALOR, 7, 4) ||');
    _query.SQL.Add('                                    SUBSTR(V.VALOR, 3, 3) AS VALOR');
    _query.SQL.Add('                               FROM VALTABGENER V');
    _query.SQL.Add('                              WHERE V.CODTABELA = ''IN 1343''');
    _query.SQL.Add('                                AND V.CODCAMPO = ''DATA INI '') DTINI');
    _query.SQL.Add('                       JOIN (SELECT V.NUMLINHA,');
    _query.SQL.Add('                                   SUBSTR(V.VALOR, 7, 4) ||');
    _query.SQL.Add('                                   SUBSTR(V.VALOR, 3, 3) AS VALOR');
    _query.SQL.Add('                              FROM VALTABGENER V');
    _query.SQL.Add('                             WHERE V.CODTABELA = ''IN 1343''');
    _query.SQL.Add('                               AND V.CODCAMPO = ''DATA FIM'') DTFIM');
    _query.SQL.Add('                         ON DTFIM.NUMLINHA = DTINI.NUMLINHA');
    _query.SQL.Add('                       JOIN (SELECT V.NUMLINHA, V.VALOR');
    _query.SQL.Add('                              FROM VALTABGENER V');
    _query.SQL.Add('                             WHERE V.CODTABELA = ''IN 1343''');
    _query.SQL.Add('                               AND V.CODCAMPO = ''INDICE'') INDICE');
    _query.SQL.Add('                         ON INDICE.NUMLINHA = DTINI.NUMLINHA');
    _query.SQL.Add('                      WHERE DTINI.VALOR >= ''2007/12'') BI_INDICES');
    _query.SQL.Add('                  ON COT.MOECODIGO = BI_INDICES.INDICE');
    _query.SQL.Add('                 AND TO_CHAR(COT.COTDATA, ''YYYY/MM'') >=');
    _query.SQL.Add('                     BI_INDICES.DATAINICIO');
    _query.SQL.Add('                 AND TO_CHAR(COT.COTDATA, ''YYYY/MM'') <= BI_INDICES.DATAFIM');
    _query.SQL.Add('               WHERE TO_CHAR(COT.COTDATA, ''YYYY/MM'') <=');
    _query.SQL.Add('                     (SELECT HST.MESCOBRANCA');
    _query.SQL.Add('                        FROM HSTBITRIBUTACAO HST');
    _query.SQL.Add('                       WHERE HST.IDPESSOA =');
    _query.SQL.Add('                             (SELECT IDPESSOA');
    _query.SQL.Add('                                FROM ELEGPATRO');
    _query.SQL.Add('                               WHERE MATRICULA = '''+_matricula+''')');
    _query.SQL.Add('                         AND HST.OPERACAO = ''A''');
    _query.SQL.Add('                         AND HST.MESCOBRANCA =');
    _query.SQL.Add('                             (SELECT DATA');
    _query.SQL.Add('                                FROM ((SELECT MIN(H.MESCOBRANCA) AS DATA');
    _query.SQL.Add('                                         FROM HSTBITRIBUTACAO H, BITRIBUTACAO B');
    _query.SQL.Add('                                        WHERE H.OPERACAO = ''S''');
    _query.SQL.Add('                                          AND B.IDPESSOA = H.IDPESSOA');
    _query.SQL.Add('                                          AND H.IDPESSOA IN');
    _query.SQL.Add('                                              (SELECT IDPESSOA');
    _query.SQL.Add('                                                 FROM ELEGPATRO E');
    _query.SQL.Add('                                                WHERE E.MATRICULA IN');
    _query.SQL.Add('                                                      ('''+_matricula+'''))) UNION');
    _query.SQL.Add('                                      (SELECT MAX(H.MESREFERENCIA) AS DATA');
    _query.SQL.Add('                                         FROM HSTBITRIBUTACAO H');
    _query.SQL.Add('                                        WHERE H.OPERACAO = ''A''');
    _query.SQL.Add('                                          AND H.IDPESSOA IN');
    _query.SQL.Add('                                              (SELECT IDPESSOA');
    _query.SQL.Add('                                                 FROM ELEGPATRO E');
    _query.SQL.Add('                                                WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('                                          AND NOT EXISTS');
    _query.SQL.Add('                                        (SELECT 1');
    _query.SQL.Add('                                                 FROM HSTBITRIBUTACAO H1');
    _query.SQL.Add('                                                WHERE H1.OPERACAO = ''S''');
    _query.SQL.Add('                                                  AND H1.IDPESSOA = H.IDPESSOA)))');
    _query.SQL.Add('                               WHERE DATA IS NOT NULL))),');
    _query.SQL.Add('             2) AS VALOR,');
    _query.SQL.Add('       H.IDPESSOA,');
    _query.SQL.Add('       H.OPERACAO,');
    _query.SQL.Add('       PES.NOME, ');
    _query.SQL.Add('       PES.NUMDOCUMENTO,');
    _query.SQL.Add('       E.MATRICULA,');
    _query.SQL.Add('       E.DATAADMISSAO,');
    _query.SQL.Add('       B.PRIMPAGTO,');
    _query.SQL.Add('       NULL AS CODPORTFORMA,');
    _query.SQL.Add('       SP.DESCRICAO,');
    _query.SQL.Add('       PPR.NOME PLANO,');
    _query.SQL.Add('       PROC.NUMEROPROCESSO,');
    _query.SQL.Add('       PROC.DATAINICIO,');
    _query.SQL.Add('       PROC.DATAFINAL,');
    _query.SQL.Add('       DECODE(PROC.SITPROCESSO,0,''Ação Judicial em Liminar'',1,''Ação Judicial Julgada Ganha'',2,''Ação Judicial Julgada Perdida'') ACAO,');
    _query.SQL.Add('       PROC.CODVARA,');
    _query.SQL.Add('       PROC.NOMEVARA');
    _query.SQL.Add('  FROM HSTBITRIBUTACAO H,');
    _query.SQL.Add('       HSTCONTRIBPREV HST,');
    _query.SQL.Add('       CONTRIBUICAO C,');
    _query.SQL.Add('       PESSOA PES,');
    _query.SQL.Add('       BITRIBUTACAO B,');
    _query.SQL.Add('       PESSOAFISICA PF,');
    _query.SQL.Add('       PARTPREVPLAN PP,');
    _query.SQL.Add('       ELEGPATRO E,');
    _query.SQL.Add('       PLANPREV PPR,');
    _query.SQL.Add('       SITPART SP,');
    _query.SQL.Add('       (SELECT P.SITPROCESSO,');
    _query.SQL.Add('               P.IDPESSOA,');
    _query.SQL.Add('               P.NUMEROPROCESSO,');
    _query.SQL.Add('               P.CODVARA,');
    _query.SQL.Add('               P.NOMEVARA,');
    _query.SQL.Add('               P.DATAINICIO,');
    _query.SQL.Add('               P.DATAFINAL');
    _query.SQL.Add('          FROM PROCJUD P');
    _query.SQL.Add('         WHERE P.SITPROCESSO = (SELECT MIN(P.SITPROCESSO) FROM PROCJUD P)) PROC');
    _query.SQL.Add('WHERE H.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND H.OPERACAO = ''E''');
    _query.SQL.Add('   AND C.IDCONTRIBUICAO = HST.IDCONTRIBUICAO');
    _query.SQL.Add('   AND H.IDPESSOA = HST.IDPESSOA');
    _query.SQL.Add('   AND H.IDMOTIVO = HST.IDMOTIVO');
    _query.SQL.Add('   AND H.NUMRECEBIMENTO = HST.NUMRECEBIMENTO');
    _query.SQL.Add('   AND H.MESREFERENCIA = HST.MESREFERENCIA');
    _query.SQL.Add('   AND H.MESCOBRANCA = HST.MESCOBRANCA');
    _query.SQL.Add('   AND B.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PF.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND PROC.IDPESSOA(+) = PES.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('   AND PP.IDPESSJUR = E.IDPESSJUR');
    _query.SQL.Add('   AND PP.IDSITPART = SP.IDSITPART');
    _query.SQL.Add('   AND PP.IDPESSOA IN (SELECT IDPESSOA FROM ELEGPATRO E WHERE E.MATRICULA IN ('''+_matricula+'''))');
    _query.SQL.Add('   AND PP.IDPLANOPREV = 2');
    _query.SQL.Add('   AND PPR.IDPLANOPREV = PP.IDPLANOPREV');
    _query.SQL.Add('   AND E.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = B.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PES.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = PP.IDPESSOA');
    _query.SQL.Add('   AND H.IDPESSOA = E.IDPESSOA');
    _query.SQL.Add('GROUP BY H.IDPESSOA,');
    _query.SQL.Add('          H.OPERACAO,');
    _query.SQL.Add('          PES.NOME, ');
    _query.SQL.Add('          PES.NUMDOCUMENTO,');
    _query.SQL.Add('          E.MATRICULA,');
    _query.SQL.Add('          E.DATAADMISSAO,');
    _query.SQL.Add('          B.PRIMPAGTO,');
    _query.SQL.Add('          SP.DESCRICAO,');
    _query.SQL.Add('          PPR.NOME,');
    _query.SQL.Add('          PROC.NUMEROPROCESSO,');
    _query.SQL.Add('          PROC.DATAINICIO,');
    _query.SQL.Add('          PROC.DATAFINAL,');
    _query.SQL.Add('          PROC.SITPROCESSO,');
    _query.SQL.Add('          PROC.CODVARA,');
    _query.SQL.Add('          PROC.NOMEVARA');
    _query.SQL.Add('');
    _query.SQL.Add(') WHERE nvl("Mês Referência",''1989/01'') >= ''1989/01''');
    _query.SQL.Add('');
    _query.SQL.Add('ORDER BY 1,3,2');
    _query.Active:=True;

end;

procedure TFrmHistCompSalContri.execConsultaExtratoContribuicoes2(
  var _query: TwwQuery; _idpessoa: string);
  var sIdTitular:String;

begin
  //higor nayde SOL 242624/17054

  sIdTitular := inttostr(StrToIntDef(MontaSelect.ValoresChave[1],-1)) ;
  //begin

    _query.Active:=False ;
    _query.SQL.Clear;
    _query.SQL.Add('      SELECT MATRICULA "Matricula",MESREFERENCIA"Mes Referencia",                                                                  ');
    _query.SQL.Add('MESCOBRANCA"Mes Pagamento",                                                                                  ');
    // Andre Imakawa - 30775 - Inicio
    //_query.SQL.Add('      LAG(SALDO, 1, 0) OVER(ORDER BY MESCOBRANCA,OPERACAO,MESREFERENCIA,IDHSTBITRIBUTACAO) AS "Saldo Anterior", '); // Denis Horongoso - SIG 27748
    _query.SQL.Add('      LAG(SALDO, 1, 0) OVER(ORDER BY MESCOBRANCA,MESREFERENCIA, OPERACAO) AS "Saldo Anterior", ');                    // Denis Horongoso - SIG 27748
    //_query.SQL.Add('           WHEN ''A'' THEN (NVL( TEMP.SALDO,0)-NVL( TEMP.VALOR,0))                                             ');
   // _query.SQL.Add('           WHEN ''S'' THEN (NVL( TEMP.SALDO,0)+NVL( TEMP.VALOR,0))                                             ');
   // _query.SQL.Add('         END) AS "Saldo Anterior",                                                                           ');
    // Andre Imakawa - 30775 - Fim
    _query.SQL.Add('        VALOR"Valor",                                                                                        ');
    _query.SQL.Add('       SALDO"Saldo Atual",                                                                                   ');
    //_query.SQL.Add('      ( COTVALOR / 100) "Indice",                                                                          '); // Andre Imakawa - SIG 30775
    _query.SQL.Add('      ROUND(( COTVALOR),2) "Indice",                                                                          ');// Andre Imakawa - SIG 30775
    _query.SQL.Add('  MOEDESC "Referencia Indice",                                                                               ');
    _query.SQL.Add('        OPERACAO"Operacao"                                                                                   ');
    _query.SQL.Add('  FROM (SELECT D.MATRICULA, H.VALOR,                                                                                      ');
    _query.SQL.Add('               H.IDHSTBITRIBUTACAO,                                                                          ');
    _query.SQL.Add('               H.OPERACAO,                                                                                   ');
    _query.SQL.Add('               CASE                                                                                          ');
    _query.SQL.Add('                 WHEN H.OPERACAO = ''S'' AND H.IDLOTE = 0 THEN                                                 ');
    _query.SQL.Add('                  DECODE(SUBSTR(H.MESREFERENCIA, 6, 2), ''13'', H.MESCOBRANCA, H.MESREFERENCIA)                ');
    _query.SQL.Add('                 ELSE                                                                                        ');
    _query.SQL.Add('                  H.MESCOBRANCA                                                                              ');
    _query.SQL.Add('               END AS MESREF,                                                                                ');
    _query.SQL.Add('               CASE                                                                                          ');
    _query.SQL.Add('                 WHEN H.OPERACAO = ''S'' AND H.IDLOTE = 0 THEN                                                 ');
    _query.SQL.Add('                  H.MESREFERENCIA                                                                            ');
    _query.SQL.Add('                 ELSE                                                                                        ');
    _query.SQL.Add('                  H.MESCOBRANCA                                                                              ');
    _query.SQL.Add('               END AS MESCOBR,                                                                               ');
    _query.SQL.Add('               H.MESREFERENCIA,                                                                              ');
    _query.SQL.Add('               H.MESCOBRANCA,                                                                                ');
    _query.SQL.Add('               H.SALDO,                                                                                      ');
    _query.SQL.Add('               H.IDLOTE,                                                                                     ');
    _query.SQL.Add('               H.IDHSTFOLHABENEF,                                                                            ');
    _query.SQL.Add('               H.TRGDTINCLUSAO,                                                                              ');
    _query.SQL.Add('               H.TRGUSERINCLUSAO,                                                                            ');
    _query.SQL.Add('               H.MOECODIGO,                                                                                  ');
    _query.SQL.Add('               CM.COTVALOR,                                                                                  ');
    _query.SQL.Add('               M.MOEDESC                                                                                     ');
    _query.SQL.Add('          FROM DEPENTIT D,HSTBITRIBUTACAO H                                                                             ');
    _query.SQL.Add('           JOIN MOEDA M ON M.MOECODIGO = H.MOECODIGO                                                         ');
    _query.SQL.Add('         LEFT JOIN COTACAOMOEDA CM                                                                           ');
    _query.SQL.Add('            ON CM.MOECODIGO = H.MOECODIGO                                                                    ');
    _query.SQL.Add('           AND (SUBSTR((TO_CHAR((CM.COTDATA), ''DD/MM/YYYY'')), 7, 4) || ''/'' ||                                ');
    _query.SQL.Add('               SUBSTR((TO_CHAR((CM.COTDATA), ''DD/MM/YYYY'')), 4, 2)) =                                        ');
    _query.SQL.Add('               H.MESCOBRANCA                                                                                 ');
    _query.SQL.Add('         WHERE H.IDTITULAR = '+sIdTitular); // SOL 242624/17054 Kintana 715180
    if sIdTitular <> _idpessoa then // SOL 242624/17054 Kintana 715180
       _query.SQL.Add('           AND H.IDPESSOA  = '+_Idpessoa); // SOL 242624/17054 Kintana 715180
    //    _query.SQL.Add('         WHERE H.IDPESSOA IN XXXX --SUBSTITUITIR PELO(S) IDPESSOA´S DE ACORDO COM A CONSULTA FEITA           ');
    //    _query.SQL.Add('         AND   H.IDTITULAR = XXXXX --SUBSTITUITIR PELO IDTITULAR                                             ');
    _query.SQL.Add('        AND D.IDPESSOA = H.IDPESSOA   AND H.MESREFERENCIA >=                                                                            ');
    _query.SQL.Add('               (SELECT MIN(H.MESREFERENCIA)                                                                  ');
    _query.SQL.Add('                  FROM HSTBITRIBUTACAO H, BITRIBUTACAO B                                                     ');
    _query.SQL.Add('                 WHERE H.OPERACAO = ''S''                                                                      ');
    _query.SQL.Add('                   AND B.IDTITULAR = H.IDTITULAR                                                               ');
    //    _query.SQL.Add('                   AND B.IDPESSOA = H.IDTITULAR                                                              ');

    if sIdTitular <> _idpessoa then   // SOL 242624/17054 Kintana 715180
       _query.SQL.Add('           AND H.IDPESSOA  = '+_Idpessoa); // SOL 242624/17054 Kintana 715180
    _query.SQL.Add('                   AND H.IDTITULAR = '+sIdTitular+' )'); // SOL 242624/17054 Kintana 715180

    _query.SQL.Add('         ORDER BY 4, 5, H.OPERACAO  ) TEMP                                                      ');
    //_query.SQL.Add('ORDER BY MESCOBRANCA,OPERACAO,MESREFERENCIA,IDHSTBITRIBUTACAO                                                '); // Denis Horongoso - SIG 27748
    _query.SQL.Add('ORDER BY MESCOBRANCA,MESREFERENCIA, OPERACAO                                                     ');               // Denis Horongoso - SIG 27748
    _query.Active:=True;
    //end;
  //higor nayde SOL 242624/17054
end;

end.
