unit FCadRequerResgCompLote;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//-----------------------------------------------------------------------------
//Solicitãção : SIG93442
//Responsável : Rafael Vasconcelos
//Data        : 23/10/2019
//Descrição   : Inserir o Plano Contábil na estrutura Benefbfciario.
//--------------------------------------------------------------------------------
//Alteracao   : (.dfm)  qry_rel
//Pendência   : SIG86660
//Responsável : Edilaine
//Data        : 23/05/2019
//Form        : qry_rel
//Descrição   : alteração no tipo de campo > memo para blob
//--------------------------------------------------------------------------------
// Form        : mk_ini, mk_fin
// Eventos     : buscarequerimentos, FormCreate e FormActivate
// Autor(a)    : André Imakawa
// SIG         : 63920
// Data        : 26/02/2018
// Descricao   : Alteração na QRYDET. Alteração
//-----------------------------------------------------------------------------
// Autor(a)    : William Santana
// SIG         : 38101
// Data        : 20/01/2017
// Descricao   : Manutenção na funcionalidade do Resgate Complementar
//-----------------------------------------------------------------------------
// Autor(a)    : Marcio Sanches Spinosa SOL 228908 PPM 346104
// Data        : 16/04/2014
// Pendência   : SOL 228908 PPM 346104
// Descricao   : Ajuste no registro de evento na tabela eventoprev
//-----------------------------------------------------------------------------

//--------------------------------------------------------------------------------



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdbedit, Wwdotdot, Wwdbcomb, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, QExport3, QExport3PDF,
  QuickRpt, Qrctrls, ppPrnabl, ppClass, ppStrtch, ppRichTx, ppDB, ppDBPipe,
  ppDBBDE, ppParameter, ppModule, raCodMod, ppBands, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, CmParamReport, uCmRptManager, TXComp, TXRB,
  ppCtrls, ppMemo;

type
  TFrmCadRequerResgCompLote = class(TfrmCadMestreDetalheCS)
    ToolbarButton971: TToolbarButton97;
    sbtnRequerer: TToolbarButton97;
    bbtnDesfazer: TBitBtn;
    lbl_matri: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbedNumProcINSS: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    dtDataInicio: TCMDateTimePicker;
    dtEvento: TCMDateTimePicker;
    Label9: TLabel;
    Label10: TLabel;
    bbtnOpcoes: TBitBtn;
    CMDateTimePicker2: TCMDateTimePicker;
    Label11: TLabel;
    CMDateTimePicker3: TCMDateTimePicker;
    Label12: TLabel;
    wwDBEdit9: TwwDBEdit;
    Label13: TLabel;
    GroupBox1: TGroupBox;
    cb_tipo_recebedor: TComboBox;
    pnl_impressao: TPanel;
    rg_opcao_impressao: TRadioGroup;
    bt_imprimir: TButton;
    sbtnConcedeUm: TToolbarButton97;
    qry2: TwwQuery;
    qryaux: TwwQuery;
    qryaux2: TwwQuery;
    qryDet: TwwQuery;
    rg_molestia: TDBRadioGroup;
    updDet: TUpdateSQL;
    wwDBEdit10: TwwDBEdit;
    dtDataFinal: TCMDateTimePicker;
    qrySitPart: TwwQuery;
    qrySitFunc: TwwQuery;
    qrySitPlanoPrev: TwwQuery;
    cb_grava_indiv: TCheckBox;
    IdHTTP1: TIdHTTP;
    cb_validado: TCheckBox;
    param: TwwQuery;
    pnl1: TPanel;
    grid_log: TwwDBGrid;
    SpeedButton1: TSpeedButton;
    db_grid_irrf: TDBRadioGroup;
    lbl_listados: TLabel;
    bbtnSelTudo: TBitBtn;
    bbtnInverte: TBitBtn;
    DevRptCM: TExtraOptions;
    CrmRptCM: TCmRptManager;
    CmpRptCM: TCmParamReport;
    rpReciboCedidos: TppReport;
    ppDetailBand1: TppDetailBand;
    raCodeModule1: TraCodeModule;
    ppParameterList1: TppParameterList;
    ppReciboCedidos: TppBDEPipeline;
    dsReciboCedidos: TwwDataSource;
    qryDETCONCINSS: TwwQuery;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    qryDetMATRICULA: TStringField;
    qryDetPLANO: TStringField;
    qryDetDATA_ULTIMO_RESGATE: TDateTimeField;
    qryDetSUBCONTA_EMPREGADO: TFloatField;
    qryDetSUBCONTA_PATROCINADOR: TFloatField;
    qryDetSALDO_CONTA_TOTAL: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetSELECIONADO: TStringField;
    ed_min: TEdit;
    ed_max: TEdit;
    rd_benefreq: TRadioGroup;
    mk_data_re: TMaskEdit;
    mk_data_pag: TMaskEdit;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetTIPO_OPCAO_IR: TStringField;
    qryDetIDSITFUNC: TFloatField;
    qryDetIDSITPART: TFloatField;
    qryDetIDSITPLANOPREV: TFloatField;
    qryDetIDEVENTOSPREV: TFloatField;
    qry_rel: TwwQuery;
    upd_rel: TUpdateSQL;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBMemo1: TppDBMemo;
    qryDetINSCRICAONUMERO: TFloatField;
    mk_ini: TCMDateTimePicker;
    mk_fin: TCMDateTimePicker;
    wwQuery1: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;//Marcio Sanches Spinosa SOL 228908 PPM 346104

    procedure sbtnProcurarClick(Sender: TObject);
    procedure buscarequerimentos(_selecao,_ordem:string);
    procedure buscarlog();
    procedure configuralog();
    procedure tbcDetalheChange(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure gera_impressao_log;
    procedure gera_impressao_requerimento;
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnRequererClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnDesfazerClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    function  GravarEventoPrev(_query:TwwQuery;_EventoGerador:string):Integer;
    procedure GravarBfciarioTitPlan(_query:TwwQuery;_NUMEROPROCESSO,_EventoGerador:string);
    procedure DeletarBfciarioTitPlan(_query:TwwQuery);
    procedure DeletarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
    procedure DeletarEventoPrev(_query:TwwQuery;_EventoGerador:string);
    procedure DeletarProcessoBenef(_query:TwwQuery;_NUMEROPROCESSO:string);

    procedure DeletarHSTBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
    procedure DeletarMovbenef(_query:TwwQuery;_NUMEROPROCESSO:string);

    procedure DeletarRubricaIndiv(_query:TwwQuery);     

    procedure GravarProcessoBenef(_query:TwwQuery;_EventoGerador,_NUMEROPROCESSO:string);
    procedure GravarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string;_ideventosprev:Integer);
    procedure AtualizaBenefHabilita(_query:TwwQuery;_flgrequerimento,_NUMEROPROCESSO,_EVENTOGERADOR:string);


    procedure Criar_temp(_query:TwwQuery);
    procedure Gravar_temp_log(_query:TwwQuery;_msgerro,_msgoracle:string);
    procedure Deletar_temp_log(_query:TwwQuery);
    procedure FormShow(Sender: TObject);
    procedure wwDBEdit10Change(Sender: TObject);
    procedure dtDataFinalChange(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure qryDetAfterOpen(DataSet: TDataSet);
    procedure bbtnSelTudoClick(Sender: TObject);
    procedure bbtnInverteClick(Sender: TObject);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure RemoveDuplicates(var stringList : TStringList) ;
    procedure FormCreate(Sender: TObject);
    procedure dbgrdDetTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure cb_validadoClick(Sender: TObject);
    Function GetNumeroProcesso():string;
    procedure ed_minKeyPress(Sender: TObject; var Key: Char);
    procedure ed_maxKeyPress(Sender: TObject; var Key: Char);
    procedure ed_minExit(Sender: TObject);
    procedure ed_maxExit(Sender: TObject);
    procedure mk_dataExit(Sender: TObject);





  private
    wHora, wMin, wSeg, wMSeg : word;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadRequerResgCompLote: TFrmCadRequerResgCompLote;
  FIdbenefh  : TStringList;
  RegProc:integer;
  iIdEventoPrevG:integer;
  pIsValidado : string;
 _query_dados:TwwQuery;
implementation

uses
  FMostraAux,UFuncoesUteis,USistema,uCMTypes,UMensErro,ubeneficio,UDataBase,UAdmPrev,DBaseDados,FPreview;
{$R *.DFM}


function IsDate(str: string): Boolean; 
var 
  dt: TDateTime; 
begin 
  Result := True; 
  try 
    dt := StrToDate(str); 
  except
    Result := False; 
  end; 
end; 

procedure TFrmCadRequerResgCompLote.buscarequerimentos(_selecao,_ordem:string);
var
  sql:string;
  v1:string;
  v2:string;
begin
sql:='';
/////RN004

v1:=StringReplace(ed_min.text, ',', '.', [rfReplaceAll]);
v2:=StringReplace(ed_max.text, ',', '.', [rfReplaceAll]);

qry.Active:=true;


{

qryDet.Close;
qryDet.sql.Clear;
QRYDET.SQL.ADD('SELECT * FROM (SELECT '+#39+_selecao+#39+' AS SELECIONADO,');
QRYDET.SQL.Add('       EL.MATRICULA,');
QRYDET.SQL.Add('       pp.nome PLANO,');
QRYDET.SQL.Add('       MAX(HS1.DATAALIMENTACAO) DATA_ULTIMO_RESGATE,');
//QRYDET.SQL.Add('------------------------------------------------------------------------------------------------');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (100,110,111))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS1.FLGENTRADA,1,HS1.VLRCOTAS,-HS1.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS1');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS1.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS1.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS1.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS1.IDTIPORESERVA IN (51,52,53,55,79,117,134))');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_EMPREGADO,');
//QRYDET.SQL.Add('------------------------------------------------------------------------------------------------');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (101))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (59,60,61,62,167,170))');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_PATROCINADOR,');
//QRYDET.SQL.Add('------------------------------------------------------------------------------------------------');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (100,101,110,111))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (51,52,53,55,59,60,61,62,79,117,134,167,170))');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SALDO_CONTA_TOTAL,');
QRYDET.SQL.Add('EL.IDPESSOA ,');
QRYDET.SQL.Add('RS.IDPLANOPREV,EL.IDPESSJUR ');
//QRYDET.SQL.Add('------------------------------------------------------------------------------------------------');
QRYDET.SQL.Add('FROM ELEGPATRO EL');
QRYDET.SQL.Add('     JOIN RESERVAPART RS ON EL.IDPESSOA = RS.IDPESSOA');
QRYDET.SQL.Add('                        AND EL.IDPESSJUR = RS.IDPESSJUR');
QRYDET.SQL.Add('     JOIN Planprev pp ON rs.idplanoprev = pp.idplanoprev');
QRYDET.SQL.Add('     JOIN HISTMOVRESERVA HS1 ON EL.IDPESSOA = HS1.IDPESSOA');
QRYDET.SQL.Add('                            AND EL.IDPESSJUR = HS1.IDPESSJUR');
QRYDET.SQL.Add('                            AND RS.IDPLANOPREV = HS1.IDPLANOPREV');
QRYDET.SQL.Add('                            AND RS.IDTIPORESERVA = HS1.IDTIPORESERVA');
QRYDET.SQL.Add('WHERE ');
QRYDET.SQL.Add('   RS.IDTIPORESERVA IN (100,101,110,111,--NOVO PLANO');
QRYDET.SQL.Add('                           51,52,53,55,59,60,61,62,79,117,134,167,170)--REB');

if cb_tipo_recebedor.ItemIndex = 1 then
  QRYDET.SQL.Add(' AND RS.IDPLANOPREV IN (66)')
else if cb_tipo_recebedor.ItemIndex = 2 then
  QRYDET.SQL.Add(' AND RS.IDPLANOPREV IN (74)')
  ELSE
    QRYDET.SQL.Add(' AND RS.IDPLANOPREV IN (66,74)');
//QRYDET.SQL.Add('  AND el.matricula = ''0000023''');
QRYDET.SQL.Add('  AND EXISTS (SELECT 1');
QRYDET.SQL.Add('              FROM benefbfciario bf');
QRYDET.SQL.Add('              WHERE bf.idbeneficio IN (231,323,526,277,418,458,523,378,524,478,510,528,516,493)');
QRYDET.SQL.Add('                AND el.idpessoa = bf.idpessoa');
if rd_benefreq.ItemIndex = 0 then
   begin
 //  QRYDET.SQL.Add('             AND IDSITBENEFICIO=4');

    QRYDET.SQL.Add('  AND EXISTS (SELECT NUMEROPROCESSO');
    QRYDET.SQL.Add('  FROM BENEFBFCIARIO');
    QRYDET.SQL.Add(' WHERE IDPESSJUR =  EL.IDPESSJUR');
    QRYDET.SQL.Add('   AND IDTITULAR =  EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDPLANOORIGEM = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPLANOPREV = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPESSOA = EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDBENEFICIO = ''418''');
    QRYDET.SQL.Add('   AND SEQPROPOSTA = 1)     ');
   end
else
   begin 

    QRYDET.SQL.Add('  AND NOT EXISTS (SELECT NUMEROPROCESSO');
    QRYDET.SQL.Add('  FROM BENEFBFCIARIO');
    QRYDET.SQL.Add(' WHERE IDPESSJUR =  EL.IDPESSJUR');
    QRYDET.SQL.Add('   AND IDTITULAR =  EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDPLANOORIGEM = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPLANOPREV = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPESSOA = EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDBENEFICIO = ''418''');
    QRYDET.SQL.Add('   AND SEQPROPOSTA = 1)     ');

   end;


//IF mk_data_re.text<>'' then
//   QRYDET.SQL.Add('             AND datarequerimento='+mk_data_re.text);


QRYDET.SQL.Add('                AND bf.idpessoa = bf.idtitular)');
QRYDET.SQL.Add('  AND HS1.IDBENEFICIO IN (231,323,526,277,418,458,523,378,524,478,510,528,516,493) ');
QRYDET.SQL.Add('  AND HS1.DATAALIMENTACAO >= ''01/01/2011'' ');
QRYDET.SQL.Add('  AND HS1.DATAALIMENTACAO <= ''31/12/2011''');

if strtofloat(ed_min.text)<>0 then
  QRYDET.SQL.Add(' AND SALDO_CONTA_TOTAL>='+ed_min.text);

if strtofloat(ed_max.text)<>0 then
  QRYDET.SQL.Add(' AND SALDO_CONTA_TOTAL<='+ed_max.text);


IF mk_ini.text<>'' then
  QRYDET.SQL.Add(' AND DATA_ULTIMO_RESGATE>='+mk_ini.text);

IF mk_fin.text<>'' then
  QRYDET.SQL.Add(' AND DATA_ULTIMO_RESGATE<='+mk_fin.text);





QRYDET.SQL.Add('GROUP BY EL.MATRICULA, pp.nome, RS.IDPLANOPREV, EL.IDPESSJUR, EL.IDPESSOA');
QRYDET.SQL.Add('ORDER BY EL.MATRICULA,EL.IDPESSOA) temp');

}


///hebio
qryDet.Close;
qryDet.sql.Clear;
{QRYDET.SQL.Add('SELECT * FROM (SELECT ''S'' AS SELECIONADO,');
QRYDET.SQL.Add('       EL.MATRICULA,');
QRYDET.SQL.Add('       pp.nome PLANO,');
QRYDET.SQL.Add('       MAX(HS1.DATAALIMENTACAO) DATA_ULTIMO_RESGATE,');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (100,110,111))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS1.FLGENTRADA,1,HS1.VLRCOTAS,-HS1.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS1');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS1.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS1.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS1.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS1.IDTIPORESERVA IN (51,52,53,55,79,117,134))');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_EMPREGADO,');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (101))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (59,60,61,62,167,170))');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_PATROCINADOR,');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (100,101,110,111))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (51,52,53,55,59,60,61,62,79,117,134,167,170))');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SALDO_CONTA_TOTAL,');
QRYDET.SQL.Add('EL.IDPESSOA ,');
QRYDET.SQL.Add('RS.IDPLANOPREV,EL.IDPESSJUR ');
QRYDET.SQL.Add(', DECODE(NVL(PPP.TIPOOPCAOIR,0),0,''Sem Opção'',1,''Progressiva'',2,''Regressiva'') TIPO_OPCAO_IR'); }

{QRYDET.SQL.Add('SELECT * FROM (SELECT ''S'' AS SELECIONADO,');
QRYDET.SQL.Add('       EL.MATRICULA,');
QRYDET.SQL.Add('       pp.nome PLANO,');
QRYDET.SQL.Add('       MAX(HS1.DATAALIMENTACAO) DATA_ULTIMO_RESGATE,');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (100,110,111))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -H1.VLRCOTAS)) * CC.COTVALOR) *');
QRYDET.SQL.Add('                     (CASE');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            5');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            10');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            15');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            20');
QRYDET.SQL.Add('                       ELSE');
QRYDET.SQL.Add('                            100 END/100)) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA H1');
QRYDET.SQL.Add('                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                          AND H1.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.IDPESSOA');
QRYDET.SQL.Add('                                         AND H1.IDPESSJUR = PP.IDPESSJUR');
QRYDET.SQL.Add('                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.INDICEREAJUSTE');
QRYDET.SQL.Add('              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND');
QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) <> 1 AND');
QRYDET.SQL.Add('                    NOT EXISTS (SELECT 1');
QRYDET.SQL.Add('                                FROM PARTPREVPLAN PPP');
QRYDET.SQL.Add('                                WHERE PPP.IDPESSOA = H1.IDPESSOA AND');
QRYDET.SQL.Add('                                      PPP.IDPLANOPREV = 2 AND');
QRYDET.SQL.Add('                                      PPP.IDSITPLANOPREV = 1) AND');
QRYDET.SQL.Add('                    H1.SEQPROPOSTA = 1 AND');
QRYDET.SQL.Add('                    TP.ANALITICOSINTETI = ''A'' AND');
QRYDET.SQL.Add('                    TP.FLGCONTROLE = 0 AND');
QRYDET.SQL.Add('                    TP.FLGCOLETIVA = 0 AND');
QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND');
QRYDET.SQL.Add('                    H1.IDTIPORESERVA NOT IN (62,33,59,60,61,170) AND');
QRYDET.SQL.Add('                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') AND');
QRYDET.SQL.Add('                    CC.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                  FROM COTACAOMOEDA CM');
QRYDET.SQL.Add('                                  WHERE CM.MOECODIGO = CC.MOECODIGO) AND');
QRYDET.SQL.Add('                    H1.IDPESSOA = EL.IDPESSOA)');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_EMPREGADO,');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (101))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -H1.VLRCOTAS)) * CC.COTVALOR) *');
QRYDET.SQL.Add('                     (CASE');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            5');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            10');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            15');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            20');
QRYDET.SQL.Add('                       ELSE');
QRYDET.SQL.Add('                            100 END/100)) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA H1');
QRYDET.SQL.Add('                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                          AND H1.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.IDPESSOA');
QRYDET.SQL.Add('                                         AND H1.IDPESSJUR = PP.IDPESSJUR');
QRYDET.SQL.Add('                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.INDICEREAJUSTE');
QRYDET.SQL.Add('              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND');
QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) <> 1 AND');
QRYDET.SQL.Add('                    NOT EXISTS (SELECT 1');
QRYDET.SQL.Add('                                FROM PARTPREVPLAN PPP');
QRYDET.SQL.Add('                                WHERE PPP.IDPESSOA = H1.IDPESSOA AND');
QRYDET.SQL.Add('                                      PPP.IDPLANOPREV = 2 AND');
QRYDET.SQL.Add('                                      PPP.IDSITPLANOPREV = 1) AND');
QRYDET.SQL.Add('                    H1.SEQPROPOSTA = 1 AND');
QRYDET.SQL.Add('                    TP.ANALITICOSINTETI = ''A'' AND');
QRYDET.SQL.Add('                    TP.FLGCONTROLE = 0 AND');
QRYDET.SQL.Add('                    TP.FLGCOLETIVA = 0 AND');
QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND');
QRYDET.SQL.Add('                    H1.IDTIPORESERVA IN (62,33,59,60,61,170) AND');
QRYDET.SQL.Add('                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') AND');
QRYDET.SQL.Add('                    CC.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                  FROM COTACAOMOEDA CM');
QRYDET.SQL.Add('                                  WHERE CM.MOECODIGO = CC.MOECODIGO) AND');
QRYDET.SQL.Add('                    H1.IDPESSOA = EL.IDPESSOA)');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_PATROCINADOR,');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (100,101,110,111))');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('           (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -H1.VLRCOTAS)) * CC.COTVALOR) *');
QRYDET.SQL.Add('                     (CASE');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            5');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            10');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            15');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            20');
QRYDET.SQL.Add('                       ELSE');
QRYDET.SQL.Add('                            100 END/100)) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA H1');
QRYDET.SQL.Add('                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                          AND H1.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.IDPESSOA');
QRYDET.SQL.Add('                                         AND H1.IDPESSJUR = PP.IDPESSJUR');
QRYDET.SQL.Add('                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.INDICEREAJUSTE');
QRYDET.SQL.Add('              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND');
QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) <> 1 AND');
QRYDET.SQL.Add('                    NOT EXISTS (SELECT 1');
QRYDET.SQL.Add('                                FROM PARTPREVPLAN PPP');
QRYDET.SQL.Add('                                WHERE PPP.IDPESSOA = H1.IDPESSOA AND');
QRYDET.SQL.Add('                                      PPP.IDPLANOPREV = 2 AND');
QRYDET.SQL.Add('                                      PPP.IDSITPLANOPREV = 1) AND');
QRYDET.SQL.Add('                    H1.SEQPROPOSTA = 1 AND');
QRYDET.SQL.Add('                    TP.ANALITICOSINTETI = ''A'' AND');
QRYDET.SQL.Add('                    TP.FLGCONTROLE = 0 AND');
QRYDET.SQL.Add('                    TP.FLGCOLETIVA = 0 AND');
QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND');
QRYDET.SQL.Add('                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') AND');
QRYDET.SQL.Add('                    CC.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                  FROM COTACAOMOEDA CM');
QRYDET.SQL.Add('                                  WHERE CM.MOECODIGO = CC.MOECODIGO) AND');
QRYDET.SQL.Add('                    H1.IDPESSOA = EL.IDPESSOA)');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SALDO_CONTA_TOTAL,');
QRYDET.SQL.Add('       EL.IDPESSOA,');
QRYDET.SQL.Add('       RS.IDPLANOPREV,');
QRYDET.SQL.Add('       EL.IDPESSJUR,');
QRYDET.SQL.Add('       DECODE(NVL(PPP.TIPOOPCAOIR,0),0,''Sem Opção'',1,''Progressiva'',2,''Regressiva'') TIPO_OPCAO_IR');

QRYDET.SQL.Add('FROM ELEGPATRO EL');
QRYDET.SQL.Add('     JOIN RESERVAPART RS ON EL.IDPESSOA = RS.IDPESSOA');
QRYDET.SQL.Add('                        AND EL.IDPESSJUR = RS.IDPESSJUR');
QRYDET.SQL.Add('  JOIN PARTPREVPLAN PPP ON EL.IDPESSOA = PPP.IDPESSOA AND');
QRYDET.SQL.Add('                              RS.IDPLANOPREV = PPP.IDPLANOPREV');
QRYDET.SQL.Add('     JOIN Planprev pp ON rs.idplanoprev = pp.idplanoprev');
QRYDET.SQL.Add('     JOIN HISTMOVRESERVA HS1 ON EL.IDPESSOA = HS1.IDPESSOA');
QRYDET.SQL.Add('                            AND EL.IDPESSJUR = HS1.IDPESSJUR');
QRYDET.SQL.Add('                            AND RS.IDPLANOPREV = HS1.IDPLANOPREV');
QRYDET.SQL.Add('                            AND RS.IDTIPORESERVA = HS1.IDTIPORESERVA');
QRYDET.SQL.Add('WHERE ');
//QRYDET.SQL.Add('   RS.IDTIPORESERVA IN (100,101,110,111,--NOVO PLANO');
//QRYDET.SQL.Add('                        51,52,53,55,59,60,61,62,79,117,134,167,170)--REB');
//QRYDET.SQL.Add('AND RS.IDPLANOPREV IN (66,74)');

if cb_tipo_recebedor.ItemIndex = 1 then
  QRYDET.SQL.Add('  RS.IDPLANOPREV = (66)')
else if cb_tipo_recebedor.ItemIndex = 2 then
  QRYDET.SQL.Add('  RS.IDPLANOPREV = (74)')
  ELSE
    QRYDET.SQL.Add('  RS.IDPLANOPREV IN (66,74)');



if rd_benefreq.ItemIndex = 0 then
   begin

    QRYDET.SQL.Add('  AND EXISTS (SELECT NUMEROPROCESSO');
    QRYDET.SQL.Add('  FROM BENEFBFCIARIO');
    QRYDET.SQL.Add(' WHERE IDPESSJUR =  EL.IDPESSJUR');
    QRYDET.SQL.Add('   AND IDTITULAR =  EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDPLANOORIGEM = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPLANOPREV = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPESSOA = EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDSITBENEFICIO = 4');
    QRYDET.SQL.Add('   AND IDBENEFICIO = ''418''');
    QRYDET.SQL.Add('   AND SEQPROPOSTA = 1)     ');
   end
else
   begin 
    QRYDET.SQL.Add('  AND NOT EXISTS (SELECT NUMEROPROCESSO');
    QRYDET.SQL.Add('  FROM BENEFBFCIARIO');
    QRYDET.SQL.Add(' WHERE IDPESSJUR =  EL.IDPESSJUR');
    QRYDET.SQL.Add('   AND IDTITULAR =  EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDPLANOORIGEM = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPLANOPREV = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPESSOA = EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDBENEFICIO = ''418''');
    QRYDET.SQL.Add('   AND SEQPROPOSTA = 1)     ');

   end;


QRYDET.SQL.Add(' AND HS1.IDBENEFICIO IN (231,323,526,277,418,458,523,378,524,478,510,528,516,493) ');
//QRYDET.SQL.Add('  AND HS1.DATAALIMENTACAO >= ''01/01/2013''--FILTRO DE DATA');
//QRYDET.SQL.Add('  AND HS1.DATAALIMENTACAO  <= ''31/01/2013''--FILTRO DE DATA');

IF mk_ini.Date<>null then
   QRYDET.SQL.Add('                AND HS1.DATAALIMENTACAO >= '+#39+(FormatDateTime('dd/mm/yyyy', mk_ini.Date))+#39);
iF mk_fin.Date<>null then
   QRYDET.SQL.Add('                AND HS1.DATAALIMENTACAO  <= '+#39+(FormatDateTime('dd/mm/yyyy', mk_fin.Date))+#39);

if (ed_min.Text<>'0,00')  and (ed_max.Text<>'0,00') then
    begin
    QRYDET.SQL.Add('  AND (CASE');
    QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
    QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
    QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
    QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
    QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
    QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
    QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (100,101,110,111))');
    QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
    QRYDET.SQL.Add('           (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -H1.VLRCOTAS)) * CC.COTVALOR) *');
    QRYDET.SQL.Add('                     (CASE');
    QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
    QRYDET.SQL.Add('                            5');
    QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
    QRYDET.SQL.Add('                            10');
    QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
    QRYDET.SQL.Add('                            15');
    QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
    QRYDET.SQL.Add('                            20');
    QRYDET.SQL.Add('                       ELSE');
    QRYDET.SQL.Add('                            100 END/100)) AS VALOR_RESGATAVEL');
    QRYDET.SQL.Add('                FROM HISTMOVRESERVA H1');
    QRYDET.SQL.Add('                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = TP.IDPLANOPREV');
    QRYDET.SQL.Add('                                          AND H1.IDTIPORESERVA = TP.IDTIPORESERVA');
    QRYDET.SQL.Add('                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.IDPESSOA');
    QRYDET.SQL.Add('                                         AND H1.IDPESSJUR = PP.IDPESSJUR');
    QRYDET.SQL.Add('                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.INDICEREAJUSTE');
    QRYDET.SQL.Add('              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND');
    QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) <> 1 AND');
    QRYDET.SQL.Add('                    NOT EXISTS (SELECT 1');
    QRYDET.SQL.Add('                                FROM PARTPREVPLAN PPP');
    QRYDET.SQL.Add('                                WHERE PPP.IDPESSOA = H1.IDPESSOA AND');
    QRYDET.SQL.Add('                                      PPP.IDPLANOPREV = 2 AND');
    QRYDET.SQL.Add('                                      PPP.IDSITPLANOPREV = 1) AND');
    QRYDET.SQL.Add('                    H1.SEQPROPOSTA = 1 AND');
    QRYDET.SQL.Add('                    TP.ANALITICOSINTETI = ''A'' AND');
    QRYDET.SQL.Add('                    TP.FLGCONTROLE = 0 AND');
    QRYDET.SQL.Add('                    TP.FLGCOLETIVA = 0 AND');
    QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND');
    QRYDET.SQL.Add('                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') AND');
    QRYDET.SQL.Add('                    CC.COTDATA = (SELECT MAX(COTDATA)');
    QRYDET.SQL.Add('                                  FROM COTACAOMOEDA CM');
    QRYDET.SQL.Add('                                  WHERE CM.MOECODIGO = CC.MOECODIGO) AND');
    QRYDET.SQL.Add('                    H1.IDPESSOA = EL.IDPESSOA)');
    QRYDET.SQL.Add('         ELSE');
    QRYDET.SQL.Add('               0');
//QRYDET.SQL.Add('       END) BETWEEN 0.01 AND 200 --FILTRO DE VALOR');

    QRYDET.SQL.Add('       END) BETWEEN ');
    QRYDET.SQL.Add('   '+ed_min.Text+' AND '+ed_max.Text);

   end;

QRYDET.SQL.Add('GROUP BY EL.MATRICULA, pp.nome, RS.IDPLANOPREV, EL.IDPESSJUR,');
QRYDET.SQL.Add('         EL.IDPESSOA,DECODE(NVL(PPP.TIPOOPCAOIR,0),0,''Sem Opção'',1,''Progressiva'',2,''Regressiva'')');
//QRYDET.SQL.Add('ORDER BY EL.MATRICULA,EL.IDPESSOA');


if  trim(_ordem)='' then
    QRYDET.SQL.Add('ORDER BY EL.MATRICULA,EL.IDPESSOA) temp')
else
    qryDet.SQL.Add(' order by '+_ordem+' ) temp');



//QRYDET.SQL.Add('  AND EXISTS (SELECT DISTINCT IDPESSOA ');
//QRYDET.SQL.Add('              FROM HISTMOVRESERVA HS2');
//QRYDET.SQL.Add('              WHERE HS2.IDBENEFICIO IN (231,323,526,277,418,458,523,378,524,478,510,528,516,493) ');
//QRYDET.SQL.Add('                AND HS2.IDPLANOPREV = RS.IDPLANOPREV');
//QRYDET.SQL.Add('                AND HS2.IDPESSOA = EL.IDPESSOA');
//QRYDET.SQL.Add('                AND HS2.IDPESSJUR = EL.IDPESSJUR');


//IF mk_ini.Date<>null then
//   QRYDET.SQL.Add('                AND HS2.DATAALIMENTACAO >= '+#39+(FormatDateTime('dd/mm/yyyy', mk_ini.Date))+#39);
//iF mk_fin.Date<>null then
//   QRYDET.SQL.Add('                AND HS2.DATAALIMENTACAO  <= '+#39+(FormatDateTime('dd/mm/yyyy', mk_fin.Date))+#39);
//QRYDET.SQL.Add('             )');
//QRYDET.SQL.Add('  AND HS1.IDBENEFICIO IN (231,323,526,277,418,458,523,378,524,478,510,528,516,493) ');
//
//if (ed_min.Text<>'0.00')  and (ed_max.Text<>'0.00') then
//    begin
//
//    QRYDET.SQL.Add('  AND (CASE');
//    QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
//    QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
//    QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
//    QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
//    QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
//    QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
//    QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (100,101,110,111))');
//    QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
//    QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
//    QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
//    QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
//    QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
//    QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
//    QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (51,52,53,55,59,60,61,62,79,117,134,167,170))');
//    QRYDET.SQL.Add('         ELSE');
//    QRYDET.SQL.Add('               0');
//    QRYDET.SQL.Add('       END) BETWEEN ');

//    QRYDET.SQL.Add('   '+ed_min.Text+' AND '+ed_max.Text);
//
//   end;
////QRYDET.SQL.Add('  AND EL.MATRICULA IN (''2824828'',''0349659'')');
//QRYDET.SQL.Add('GROUP BY EL.MATRICULA, pp.nome, RS.IDPLANOPREV, EL.IDPESSJUR, EL.IDPESSOA,PPP.TIPOOPCAOIR');

//
//if  trim(_ordem)='' then
//    QRYDET.SQL.Add('ORDER BY EL.MATRICULA,EL.IDPESSOA) temp')
//else
//    qryDet.SQL.Add(' order by '+_ordem+' ) temp');

//QRYDET.SQL.Add('ORDER BY EL.MATRICULA,EL.IDPESSOA) temp');  }

///hebio
QRYDET.Close;
QRYDET.sql.Clear;
QRYDET.SQL.Add('SELECT * FROM (SELECT ''S'' AS SELECIONADO,');
QRYDET.SQL.Add('       EL.MATRICULA,');
QRYDET.SQL.Add('       pp.nome PLANO,');
QRYDET.SQL.Add('       EL.IDSITFUNC,');
QRYDET.SQL.Add('       PPP.IDSITPART,');
QRYDET.SQL.Add('       PPP.INSCRICAONUMERO,');//Marcio Sanches Spinosa SOL 228908 PPM 346104
QRYDET.SQL.Add('       PPP.IDSITPLANOPREV,');
QRYDET.SQL.Add('       B.IDEVENTOSPREV,');
QRYDET.SQL.Add('       MAX(HS1.DATAALIMENTACAO) DATA_ULTIMO_RESGATE,');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
{QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (100,110,111))'); }

QRYDET.SQL.Add('    (SELECT SUM((DECODE(H.FLGENTRADA,1,(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)),');
QRYDET.SQL.Add('                                                          -(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)))) *');
QRYDET.SQL.Add('                                                          (SELECT DECODE(TP.FLGCONTROLE,1, 0, COTVALOR)');
QRYDET.SQL.Add('                                                           FROM COTACAOMOEDA M1');
QRYDET.SQL.Add('                                                           WHERE M1.MOECODIGO = TP.INDICEREAJUSTE AND');
QRYDET.SQL.Add('                                                                 M1.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                                           FROM COTACAOMOEDA M2 ');
QRYDET.SQL.Add('                                                           WHERE M2.MOECODIGO = TP.INDICEREAJUSTE))) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                              FROM HISTMOVRESERVA H');
QRYDET.SQL.Add('                                   JOIN RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                                                        AND H.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                              WHERE H.SEQPROPOSTA = 1');
QRYDET.SQL.Add('                                AND h.idtiporeserva IN (100,110,111)');
QRYDET.SQL.Add('                                AND TP.ANALITICOSINTETI = ''A''');
QRYDET.SQL.Add('                                AND TP.FLGCOLETIVA = 0');
QRYDET.SQL.Add('                                AND H.IDPLANOPREV = RS.IDPLANOPREV');
QRYDET.SQL.Add('                                AND H.IDPESSJUR = EL.IDPESSJUR'); // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                                and H.IDPESSOA = EL.IDPESSOA)');

QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -H1.VLRCOTAS)) * CC.COTVALOR) *');
QRYDET.SQL.Add('                     (CASE');
//QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN'); // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) <= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');   // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                            5');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            10');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            15');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            20');
QRYDET.SQL.Add('                       ELSE');
QRYDET.SQL.Add('                            100 END/100)) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA H1');
QRYDET.SQL.Add('                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                          AND H1.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.IDPESSOA');
QRYDET.SQL.Add('                                         AND H1.IDPESSJUR = PP.IDPESSJUR');
QRYDET.SQL.Add('                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.INDICEREAJUSTE');
QRYDET.SQL.Add('              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND');
QRYDET.SQL.Add('                    PP.IDPESSOA = H1.IDPESSOA AND');       // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    PP.IDPESSJUR = H1.IDPESSJUR AND');     // Andre Imakawa - SIG 63920
//QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) <> 1 AND');   // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) = 0 AND');      // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    NOT EXISTS (SELECT 1');
QRYDET.SQL.Add('                                FROM PARTPREVPLAN PPP');
QRYDET.SQL.Add('                                WHERE PPP.IDPESSOA = H1.IDPESSOA AND');
QRYDET.SQL.Add('                                      PPP.IDPESSJUR = H1.IDPESSJUR AND');   // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                                      PPP.IDPLANOPREV = 2 AND');
QRYDET.SQL.Add('                                      PPP.IDSITPLANOPREV = 1) AND');
QRYDET.SQL.Add('                    H1.SEQPROPOSTA = 1 AND');
QRYDET.SQL.Add('                    TP.ANALITICOSINTETI = ''A'' AND');
//QRYDET.SQL.Add('                    TP.FLGCONTROLE = 0 AND');                            // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    TP.FLGCOLETIVA = 0 AND');
QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND');
QRYDET.SQL.Add('                    H1.IDTIPORESERVA NOT IN (62,33,59,60,61,170) AND');
QRYDET.SQL.Add('                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') AND');
QRYDET.SQL.Add('                    CC.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                  FROM COTACAOMOEDA CM');
QRYDET.SQL.Add('                                  WHERE CM.MOECODIGO = CC.MOECODIGO) AND');
QRYDET.SQL.Add('                    H1.IDPESSJUR = EL.IDPESSJUR AND');          // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND');      // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    H1.IDPESSOA = EL.IDPESSOA)');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_EMPREGADO,');
QRYDET.SQL.Add('       CASE');
QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
{QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('               (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('                WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                      EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                      EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                      HS.IDTIPORESERVA IN (101))');   }

QRYDET.SQL.Add(' (SELECT SUM((DECODE(H.FLGENTRADA,1,(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)),');
QRYDET.SQL.Add('                                                                -(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)))) *');
QRYDET.SQL.Add('                                                                (SELECT DECODE(TP.FLGCONTROLE,1, 0, COTVALOR)');
QRYDET.SQL.Add('                                                                 FROM COTACAOMOEDA M1');
QRYDET.SQL.Add('                                                                 WHERE M1.MOECODIGO = TP.INDICEREAJUSTE AND');
QRYDET.SQL.Add('                                                                       M1.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                                                 FROM COTACAOMOEDA M2 ');
QRYDET.SQL.Add('                                                                 WHERE M2.MOECODIGO = TP.INDICEREAJUSTE))) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                                    FROM HISTMOVRESERVA H');
QRYDET.SQL.Add('                                         JOIN RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                                                              AND H.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                    WHERE H.SEQPROPOSTA = 1');
QRYDET.SQL.Add('                                      AND h.idtiporeserva IN (101)');
QRYDET.SQL.Add('                                      AND TP.ANALITICOSINTETI = ''A''');
QRYDET.SQL.Add('                                      AND TP.FLGCOLETIVA = 0');
QRYDET.SQL.Add('                                      AND H.IDPLANOPREV = RS.IDPLANOPREV');
QRYDET.SQL.Add('                                      AND H.IDPESSJUR = EL.IDPESSJUR');     // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                                      and H.IDPESSOA = EL.IDPESSOA)            ');

QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('               (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -H1.VLRCOTAS)) * CC.COTVALOR) *');
QRYDET.SQL.Add('                     (CASE');
//QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN'); // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) <= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');   // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                            5');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            10');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            15');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            20');
QRYDET.SQL.Add('                       ELSE');
QRYDET.SQL.Add('                            100 END/100)) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA H1');
QRYDET.SQL.Add('                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                          AND H1.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.IDPESSOA');
QRYDET.SQL.Add('                                         AND H1.IDPESSJUR = PP.IDPESSJUR');
QRYDET.SQL.Add('                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.INDICEREAJUSTE');
QRYDET.SQL.Add('              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND');
QRYDET.SQL.Add('                    PP.IDPESSOA = H1.IDPESSOA AND');        // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    PP.IDPESSJUR = H1.IDPESSJUR AND');      // Andre Imakawa - SIG 63920
//QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) <> 1 AND');    // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) = 0 AND');       // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    NOT EXISTS (SELECT 1');
QRYDET.SQL.Add('                                FROM PARTPREVPLAN PPP');
QRYDET.SQL.Add('                                WHERE PPP.IDPESSOA = H1.IDPESSOA AND');
QRYDET.SQL.Add('                                      PPP.IDPESSJUR = H1.IDPESSJUR AND');  // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                                      PPP.IDPLANOPREV = 2 AND');
QRYDET.SQL.Add('                                      PPP.IDSITPLANOPREV = 1) AND');
QRYDET.SQL.Add('                    H1.SEQPROPOSTA = 1 AND');
QRYDET.SQL.Add('                    TP.ANALITICOSINTETI = ''A'' AND');
//QRYDET.SQL.Add('                    TP.FLGCONTROLE = 0 AND');                 // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    TP.FLGCOLETIVA = 0 AND');
QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND');
QRYDET.SQL.Add('                    H1.IDTIPORESERVA IN (62,33,59,60,61,170) AND');
QRYDET.SQL.Add('                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') AND');
QRYDET.SQL.Add('                    CC.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                  FROM COTACAOMOEDA CM');
QRYDET.SQL.Add('                                  WHERE CM.MOECODIGO = CC.MOECODIGO) AND');
QRYDET.SQL.Add('                    H1.IDPESSJUR = EL.IDPESSJUR AND ');         // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND ');     // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    H1.IDPESSOA = EL.IDPESSOA)');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SUBCONTA_PATROCINADOR,');
QRYDET.SQL.Add('       CASE');
{QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (100,101,110,111))'); }

QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
QRYDET.SQL.Add('    (SELECT SUM((DECODE(H.FLGENTRADA,1,(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)),');
QRYDET.SQL.Add('                                                                -(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)))) *');
QRYDET.SQL.Add('                                                                (SELECT DECODE(TP.FLGCONTROLE,1, 0, COTVALOR)');
QRYDET.SQL.Add('                                                                 FROM COTACAOMOEDA M1');
QRYDET.SQL.Add('                                                                 WHERE M1.MOECODIGO = TP.INDICEREAJUSTE AND');
QRYDET.SQL.Add('                                                                       M1.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                                                 FROM COTACAOMOEDA M2 ');
QRYDET.SQL.Add('                                                                 WHERE M2.MOECODIGO = TP.INDICEREAJUSTE))) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                                    FROM HISTMOVRESERVA H');
QRYDET.SQL.Add('                                         JOIN RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                                                              AND H.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                    WHERE H.SEQPROPOSTA = 1');
QRYDET.SQL.Add('                                      AND h.idtiporeserva IN (100,110,111,101)');
QRYDET.SQL.Add('                                      AND TP.ANALITICOSINTETI = ''A''');
QRYDET.SQL.Add('                                      AND TP.FLGCOLETIVA = 0');
QRYDET.SQL.Add('                                      AND H.IDPLANOPREV = RS.IDPLANOPREV');
QRYDET.SQL.Add('                                      AND H.IDPESSJUR = EL.IDPESSJUR'); // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                                      and H.IDPESSOA = EL.IDPESSOA) ');

QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
QRYDET.SQL.Add('           (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -H1.VLRCOTAS)) * CC.COTVALOR) *');
QRYDET.SQL.Add('                     (CASE');
//QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');  // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) <= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');    // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                            5');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            10');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            15');
QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
QRYDET.SQL.Add('                            20');
QRYDET.SQL.Add('                       ELSE');
QRYDET.SQL.Add('                            100 END/100)) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                FROM HISTMOVRESERVA H1');
QRYDET.SQL.Add('                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                          AND H1.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.IDPESSOA');
QRYDET.SQL.Add('                                         AND H1.IDPESSJUR = PP.IDPESSJUR');
QRYDET.SQL.Add('                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.INDICEREAJUSTE');
QRYDET.SQL.Add('              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND');
QRYDET.SQL.Add('                    PP.IDPESSOA = H1.IDPESSOA AND');          // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    PP.IDPESSJUR = H1.IDPESSJUR AND');        // Andre Imakawa - SIG 63920
//QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) <> 1 AND');      // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) = 0 AND');         // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    NOT EXISTS (SELECT 1');
QRYDET.SQL.Add('                                FROM PARTPREVPLAN PPP');
QRYDET.SQL.Add('                                WHERE PPP.IDPESSOA = H1.IDPESSOA AND');
QRYDET.SQL.Add('                                      PPP.IDPESSJUR = H1.IDPESSJUR AND'); // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                                      PPP.IDPLANOPREV = 2 AND');
QRYDET.SQL.Add('                                      PPP.IDSITPLANOPREV = 1) AND');
QRYDET.SQL.Add('                    H1.SEQPROPOSTA = 1 AND');
QRYDET.SQL.Add('                    TP.ANALITICOSINTETI = ''A'' AND');
//QRYDET.SQL.Add('                    TP.FLGCONTROLE = 0 AND');                 // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    TP.FLGCOLETIVA = 0 AND');
QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND');
QRYDET.SQL.Add('                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') AND');
QRYDET.SQL.Add('                    CC.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                  FROM COTACAOMOEDA CM');
QRYDET.SQL.Add('                                  WHERE CM.MOECODIGO = CC.MOECODIGO) AND');
QRYDET.SQL.Add('                    H1.IDPESSJUR = EL.IDPESSJUR AND');          // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND');      // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                    H1.IDPESSOA = EL.IDPESSOA)');
QRYDET.SQL.Add('         ELSE');
QRYDET.SQL.Add('               0');
QRYDET.SQL.Add('       END AS SALDO_CONTA_TOTAL,');
QRYDET.SQL.Add('       EL.IDPESSOA,');
QRYDET.SQL.Add('       RS.IDPLANOPREV,');
QRYDET.SQL.Add('       EL.IDPESSJUR,');
QRYDET.SQL.Add('       DECODE(NVL(PPP.TIPOOPCAOIR,0),0,''Sem Opção'',1,''Progressiva'',2,''Regressiva'') TIPO_OPCAO_IR');
QRYDET.SQL.Add('FROM ELEGPATRO EL');
QRYDET.SQL.Add('     JOIN RESERVAPART RS ON EL.IDPESSOA = RS.IDPESSOA');
QRYDET.SQL.Add('                        AND EL.IDPESSJUR = RS.IDPESSJUR');
QRYDET.SQL.Add('     JOIN PARTPREVPLAN PPP ON EL.IDPESSOA = PPP.IDPESSOA AND');
QRYDET.SQL.Add('                              RS.IDPLANOPREV = PPP.IDPLANOPREV AND');
QRYDET.SQL.Add('                              RS.IDPESSJUR = PPP.IDPESSJUR');
QRYDET.SQL.Add('     JOIN Planprev pp ON rs.idplanoprev = pp.idplanoprev');
QRYDET.SQL.Add('     JOIN HISTMOVRESERVA HS1 ON EL.IDPESSOA = HS1.IDPESSOA');
QRYDET.SQL.Add('                            AND EL.IDPESSJUR = HS1.IDPESSJUR');
QRYDET.SQL.Add('                            AND RS.IDPLANOPREV = HS1.IDPLANOPREV');
QRYDET.SQL.Add('                            AND RS.IDTIPORESERVA = HS1.IDTIPORESERVA');

QRYDET.SQL.Add('     JOIN BENEFBFCIARIO B ON EL.IDPESSOA = B.IDPESSOA AND');
QRYDET.SQL.Add('                             RS.IDPESSJUR = B.IDPESSJUR AND');
QRYDET.SQL.Add('                             RS.IDPLANOPREV = B.IDPLANOPREV  ');

QRYDET.SQL.Add('WHERE ');

if cb_tipo_recebedor.ItemIndex = 1 then
  QRYDET.SQL.Add('  RS.IDPLANOPREV = (66)')
else if cb_tipo_recebedor.ItemIndex = 2 then
  QRYDET.SQL.Add('  RS.IDPLANOPREV = (74)')
  ELSE
    QRYDET.SQL.Add('  RS.IDPLANOPREV IN (66,74)');



if rd_benefreq.ItemIndex = 0 then
   begin

    QRYDET.SQL.Add('  AND EXISTS (SELECT NUMEROPROCESSO');
    QRYDET.SQL.Add('  FROM BENEFBFCIARIO');
    QRYDET.SQL.Add(' WHERE IDPESSJUR =  EL.IDPESSJUR');
    QRYDET.SQL.Add('   AND IDTITULAR =  EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDPLANOORIGEM = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPLANOPREV = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPESSOA = EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDSITBENEFICIO = 4');
    QRYDET.SQL.Add('   AND IDBENEFICIO = ''418''');
    QRYDET.SQL.Add('   AND SEQPROPOSTA = 1)     ');
   end
else
   begin 
    QRYDET.SQL.Add('  AND NOT EXISTS (SELECT NUMEROPROCESSO');
    QRYDET.SQL.Add('  FROM BENEFBFCIARIO');
    QRYDET.SQL.Add(' WHERE IDPESSJUR =  EL.IDPESSJUR');
    //QRYDET.SQL.Add('   AND IDTITULAR =  EL.IDPESSOA');      // Andre Imakawa - SIG 63920
    QRYDET.SQL.Add('   AND IDPLANOORIGEM = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPLANOPREV = RS.IDPLANOPREV');
    QRYDET.SQL.Add('   AND IDPESSOA = EL.IDPESSOA');
    QRYDET.SQL.Add('   AND IDBENEFICIO = ''418''');
    QRYDET.SQL.Add('   AND SEQPROPOSTA = 1)     ');

   end;


QRYDET.SQL.Add('  AND HS1.IDBENEFICIO IN (231,323,526,277,418,458,523,378,524,478,510,528,516,493) ');
//QRYDET.SQL.Add('  AND HS1.DATAALIMENTACAO >= ''01/01/2013''--FILTRO DE DATA');
//QRYDET.SQL.Add('  AND HS1.DATAALIMENTACAO  <= ''31/01/2013''--FILTRO DE DATA');

IF mk_ini.Date<>null then
   QRYDET.SQL.Add('                AND HS1.DATAALIMENTACAO >= '+#39+(FormatDateTime('dd/mm/yyyy', mk_ini.Date))+#39);
iF mk_fin.Date<>null then
   QRYDET.SQL.Add('                AND HS1.DATAALIMENTACAO  <= '+#39+(FormatDateTime('dd/mm/yyyy', mk_fin.Date))+#39);

if (ed_min.Text<>'0,00')  and (ed_max.Text<>'0,00') then
    begin
    QRYDET.SQL.Add('  AND (CASE');
    QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 74 THEN');
{    QRYDET.SQL.Add('           (SELECT SUM(DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS))');
    QRYDET.SQL.Add('            FROM HISTMOVRESERVA HS');
    QRYDET.SQL.Add('            WHERE RS.IDPLANOPREV = HS.IDPLANOPREV AND');
    QRYDET.SQL.Add('                  EL.IDPESSOA = HS.IDPESSOA AND');
    QRYDET.SQL.Add('                  EL.IDPESSJUR = HS.IDPESSJUR AND');
    QRYDET.SQL.Add('                  HS.IDTIPORESERVA IN (100,101,110,111))');   }

QRYDET.SQL.Add('');
QRYDET.SQL.Add('    (SELECT SUM((DECODE(H.FLGENTRADA,1,(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)),');
QRYDET.SQL.Add('                                                                -(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)))) *');
QRYDET.SQL.Add('                                                                (SELECT DECODE(TP.FLGCONTROLE,1, 0, COTVALOR)');
QRYDET.SQL.Add('                                                                 FROM COTACAOMOEDA M1');
QRYDET.SQL.Add('                                                                 WHERE M1.MOECODIGO = TP.INDICEREAJUSTE AND');
QRYDET.SQL.Add('                                                                       M1.COTDATA = (SELECT MAX(COTDATA)');
QRYDET.SQL.Add('                                                                 FROM COTACAOMOEDA M2 ');
QRYDET.SQL.Add('                                                                 WHERE M2.MOECODIGO = TP.INDICEREAJUSTE))) AS VALOR_RESGATAVEL');
QRYDET.SQL.Add('                                    FROM HISTMOVRESERVA H');
QRYDET.SQL.Add('                                         JOIN RESERVAXPLANO TP ON H.IDTIPORESERVA = TP.IDTIPORESERVA');
QRYDET.SQL.Add('                                                              AND H.IDPLANOPREV = TP.IDPLANOPREV');
QRYDET.SQL.Add('                                    WHERE H.SEQPROPOSTA = 1');
QRYDET.SQL.Add('                                      AND h.idtiporeserva IN (100,110,111,101)');
QRYDET.SQL.Add('                                      AND TP.ANALITICOSINTETI = ''A''');
QRYDET.SQL.Add('                                      AND TP.FLGCOLETIVA = 0');
QRYDET.SQL.Add('                                      AND H.IDPLANOPREV = RS.IDPLANOPREV');
QRYDET.SQL.Add('                                      AND H.IDPESSJUR = EL.IDPESSJUR');   // Andre Imakawa - SIG 63920
QRYDET.SQL.Add('                                      and H.IDPESSOA = EL.IDPESSOA) ');

    QRYDET.SQL.Add('         WHEN RS.IDPLANOPREV = 66 THEN');
    QRYDET.SQL.Add('           (SELECT SUM(((DECODE(H1.FLGENTRADA, 1, H1.VLRCOTAS, -H1.VLRCOTAS)) * CC.COTVALOR) *');
    QRYDET.SQL.Add('                     (CASE');
//    QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');  // Andre Imakawa - SIG 63920
    QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) <= 10 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');    // Andre Imakawa - SIG 63920
    QRYDET.SQL.Add('                            5');
    QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 11 AND 15 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
    QRYDET.SQL.Add('                            10');
    QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) BETWEEN 16 AND 20 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
    QRYDET.SQL.Add('                            15');
    QRYDET.SQL.Add('                       WHEN TRUNC(((SYSDATE-PP.DTINICIOINSC)/365.25), 0) >= 21 AND H1.IDTIPORESERVA IN (62,33,59,60,61,170) THEN');
    QRYDET.SQL.Add('                            20');
    QRYDET.SQL.Add('                       ELSE');
    QRYDET.SQL.Add('                            100 END/100)) AS VALOR_RESGATAVEL');
    QRYDET.SQL.Add('                FROM HISTMOVRESERVA H1');
    QRYDET.SQL.Add('                     JOIN RESERVAXPLANO TP ON H1.IDPLANOPREV = TP.IDPLANOPREV');
    QRYDET.SQL.Add('                                          AND H1.IDTIPORESERVA = TP.IDTIPORESERVA');
    QRYDET.SQL.Add('                     JOIN PARTPREVPLAN PP ON H1.IDPESSOA = PP.IDPESSOA');
    QRYDET.SQL.Add('                                         AND H1.IDPESSJUR = PP.IDPESSJUR');
    QRYDET.SQL.Add('                     JOIN COTACAOMOEDA CC ON CC.MOECODIGO = TP.INDICEREAJUSTE');
    QRYDET.SQL.Add('              WHERE PP.IDPLANOPREV = H1.IDPLANOPREV AND');
    QRYDET.SQL.Add('                    PP.IDPESSOA = H1.IDPESSOA AND');        // Andre Imakawa - SIG 63920
    QRYDET.SQL.Add('                    PP.IDPESSJUR = H1.IDPESSJUR AND');      // Andre Imakawa - SIG 63920
//    QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) <> 1 AND');    // Andre Imakawa - SIG 63920
    QRYDET.SQL.Add('                    NVL(TP.FLGCONTROLE, 0) = 0 AND');       // Andre Imakawa - SIG 63920
    QRYDET.SQL.Add('                    NOT EXISTS (SELECT 1');
    QRYDET.SQL.Add('                                FROM PARTPREVPLAN PPP');
    QRYDET.SQL.Add('                                WHERE PPP.IDPESSOA = H1.IDPESSOA AND');
    QRYDET.SQL.Add('                                      PPP.IDPESSJUR = H1.IDPESSJUR AND');   // Andre Imakawa - SIG 63920
    QRYDET.SQL.Add('                                      PPP.IDPLANOPREV = 2 AND');
    QRYDET.SQL.Add('                                      PPP.IDSITPLANOPREV = 1) AND');
    QRYDET.SQL.Add('                    H1.SEQPROPOSTA = 1 AND');
    QRYDET.SQL.Add('                    TP.ANALITICOSINTETI = ''A'' AND');
//    QRYDET.SQL.Add('                    TP.FLGCONTROLE = 0 AND');             // Andre Imakawa - SIG 63920
    QRYDET.SQL.Add('                    TP.FLGCOLETIVA = 0 AND');
    QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND');
    QRYDET.SQL.Add('                    SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'') AND');
    QRYDET.SQL.Add('                    CC.COTDATA = (SELECT MAX(COTDATA)');
    QRYDET.SQL.Add('                                  FROM COTACAOMOEDA CM');
    QRYDET.SQL.Add('                                  WHERE CM.MOECODIGO = CC.MOECODIGO) AND');
    QRYDET.SQL.Add('                    H1.IDPESSJUR = EL.IDPESSJUR AND ');     // Andre Imakawa - SIG 63920
    QRYDET.SQL.Add('                    H1.IDPLANOPREV = RS.IDPLANOPREV AND '); // Andre Imakawa - SIG 63920
    QRYDET.SQL.Add('                    H1.IDPESSOA = EL.IDPESSOA)');
    QRYDET.SQL.Add('         ELSE');
    QRYDET.SQL.Add('               0');
    QRYDET.SQL.Add('       END) BETWEEN ');

    QRYDET.SQL.Add('   '+v1+' AND '+v2);

 end;
if rd_benefreq.ItemIndex = 0 then
   QRYDET.SQL.Add(' AND IDEVENTOSPREV>0 ');

QRYDET.SQL.Add('GROUP BY EL.MATRICULA, pp.nome, RS.IDPLANOPREV, EL.IDPESSJUR,');
QRYDET.SQL.Add('         EL.IDPESSOA,DECODE(NVL(PPP.TIPOOPCAOIR,0),0,''Sem Opção'',1,''Progressiva'',2,''Regressiva''),');
QRYDET.SQL.Add(' EL.IDSITFUNC,');
QRYDET.SQL.Add(' PPP.IDSITPART,');
QRYDET.SQL.Add(' PPP.IDSITPLANOPREV,');
QRYDET.SQL.Add(' PPP.INSCRICAONUMERO,');//Marcio Sanches Spinosa SOL 228908 PPM 346104
QRYDET.SQL.Add(' B.IDEVENTOSPREV');
QRYDET.SQL.Add('ORDER BY EL.MATRICULA,EL.IDPESSOA) TEMP');


qryDet.Active:=true;

if qryDet.IsEmpty then
  tbcDetalhe.Enabled:=false
else
  tbcDetalhe.Enabled:=true;


//qry.edit;
end;

procedure TFrmCadRequerResgCompLote.sbtnProcurarClick(Sender: TObject);
var
   ConfirmaVisible : Boolean;        

begin
//  inherited;

 //Início - William Santana - SIG 38101

//if Trim(cb_tipo_recebedor.Text) = '' then
//   begin
//   MsgDlg( ' É necessário selecionar um dos planos previdenciários disponíveis para requerimento do resgate complementar.','Erro',mtError,[mbOk],0);
//   cb_tipo_recebedor.SetFocus;
//   exit;
//   end;//msg01

  if ((mk_data_re.Text) = '  /  /    ') and ((mk_data_pag.Text) = '  /  /    ') then
   begin
   MsgDlg('É necessário preencher a Data Requerimento e a Data Pagamento para filtrar o(s) requerimento(s) de resgate complementar.','Erro',mtError,[mbOk],0);
   mk_data_re.SetFocus;
   sbtnProcurar.down := False;
   exit;
   end;//msg05

   if mk_data_re.Text = '  /  /    ' then
   begin
   MsgDlg('É necessário preencher a Data de Requerimento  para filtrar o(s) requerimento(s) do resgate complementar.','Erro',mtError,[mbOk],0);
   mk_data_re.SetFocus;
   sbtnProcurar.down := False;
   exit;
   end;//msg02

   if mk_data_pag.Text = '  /  /    ' then
   begin
   MsgDlg('É necessário preencher a Data de Pagamento para filtrar o(s) requerimento(s) de resgate complementar.','Erro',mtError,[mbOk],0);
   mk_data_pag.SetFocus;
   sbtnProcurar.down := False;
   exit;
   end;//msg03
 //Término - William Santana - SIG 38101

//sbtnAlterar.Enabled   := True;
buscarequerimentos('S','');

if not qryDet.IsEmpty then
   begin
    if rd_benefreq.ItemIndex =0 then
       begin
       sbtnRequerer.Enabled:=false;
       sbtnConcedeUm.Enabled:=false;
       bbtnDesfazer.Enabled:=true;
       end
    else
       begin
       sbtnRequerer.Enabled:=true;
//       sbtnConcedeUm.Enabled:=true;
       bbtnDesfazer.Enabled:=false;
       end;
   end
else
   begin
   sbtnRequerer.Enabled:=false;
   sbtnConcedeUm.Enabled:=false;
   bbtnDesfazer.Enabled:=false;
   end;




   sbtnInserir.Enabled := false;
   sbtnAlterar.Enabled := false;
   sbtnApagar.Enabled := false;
   sbtnProcurar.Enabled := True;
//
//    if qryDet.IsEmpty then
//      CmeCadastro.Operacao := opVazio
//   else
//      CmeCadastro.Operacao := opIdle;
//
//   case CmeCadastro.Operacao of
//   opVazio :
//          begin
//               sbtnInserir.Down := false;
//               sbtnAlterar.Down := false;
//               sbtnApagar.Down  := false;
//               sbtnProcurar.Down := false;
//               sbtnInserir.Enabled := true;
//               sbtnAlterar.Enabled := false;
//               sbtnApagar.Enabled := false;
//               sbtnProcurar.Enabled := true;
//
//               ConfirmaVisible := false;
//          end;
//   opIdle :
//          begin
//               sbtnInserir.Down := false;
//               sbtnAlterar.Down := false;
//               sbtnApagar.Down  := false;
//               sbtnProcurar.Down := false;
//               sbtnInserir.Enabled := true;
//               sbtnProcurar.Enabled := true;
//
//               if (qryDet.Active) and (not qryDet.IsEmpty) then
//               begin
//                  sbtnAlterar.Enabled := true;
//                  sbtnApagar.Enabled := true;
//               end
//               else begin
//                    sbtnAlterar.Enabled := false;
//                    sbtnApagar.Enabled := false;
//               end;
//               ConfirmaVisible := false;
//          end;
//   opInserir :
//             begin
//                  sbtnInserir.Down := true;
//                  sbtnInserir.Enabled := true;
//                  ConfirmaVisible := true;
//             end;
//   opAlterar :
//          begin
////               sbtnAlterar.Down := true;
//               sbtnAlterar.Enabled := true;
//               ConfirmaVisible := true;
//          end;
//   opProcurar :
//               begin
////                    sbtnProcurar.Down := true;
//                    sbtnProcurar.Enabled := true;
//                    ConfirmaVisible := false;
//               end;
//   opApagar :
//            begin
//                 sbtnApagar.Down  := false;
//                 sbtnApagar.Enabled := true;
//                 ConfirmaVisible := false;
//            end;
//   else
//       ConfirmaVisible := false;
//   end;

   sbtnProcurar.Down := false;
   sbtnRequerer.Down := false;
   bbtnConfirmar.Enabled := ConfirmaVisible;
   bbtnCancelar.Enabled := ConfirmaVisible;   

end;

procedure TFrmCadRequerResgCompLote.tbcDetalheChange(Sender: TObject);
begin
//  inherited;
case tbcDetalhe.tabindex of
0:begin
  bbtnSelTudo.Visible:=True;
  bbtnInverte.Visible:=True;
  pnl_impressao.SendToBack;
  pnl1.SendToBack;

if not qryDet.IsEmpty then
   begin
    if rd_benefreq.ItemIndex =0 then
       begin
       sbtnRequerer.Enabled:=false;
       sbtnConcedeUm.Enabled:=false;
       bbtnDesfazer.Enabled:=true;
       end
    else
       begin
       sbtnRequerer.Enabled:=true;
//       sbtnConcedeUm.Enabled:=true;
       bbtnDesfazer.Enabled:=false;
       end;
   end
else
   begin
   sbtnRequerer.Enabled:=false;
   sbtnConcedeUm.Enabled:=false;
   bbtnDesfazer.Enabled:=false;
   end;




//  sbtnProcurarClick(sender);
  end;
1:begin
  bbtnSelTudo.Visible:=false;
  bbtnInverte.Visible:=false;

  pnl1.BringToFront;
  pnl_impressao.SendToBack;

//  buscarlog;
  sbtnRequerer.Enabled:=false;
  sbtnConcedeUm.Enabled:=false;
  bbtnDesfazer.Enabled:=false;
  end;
2:begin
  bbtnSelTudo.Visible:=false;
  bbtnInverte.Visible:=false;
  configuralog;
  sbtnRequerer.Enabled:=false;
  sbtnConcedeUm.Enabled:=false;
  bbtnDesfazer.Enabled:=false;
  end;
end;
end;

procedure TFrmCadRequerResgCompLote.bt_imprimirClick(Sender: TObject);
begin
//  inherited;

case rg_opcao_impressao.itemindex of
0:gera_impressao_log;
1:begin
//  FIdbenefh.clear;
  gera_impressao_requerimento;
  end;
//1:=
end;



end;

procedure TFrmCadRequerResgCompLote.gera_impressao_log;
var
     iInicio, iFim, nProcessados : integer;
begin

//   If frmMostraAux = Nil Then
//     Application.CreateForm(TfrmMostraAux, frmMostraAux);


     DecodeTime(Time, wHora, wMin, wSeg, wMSeg);

     iInicio           := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;
     buscarlog;


  If frmMostraAux = Nil Then
     Application.CreateForm(TfrmMostraAux, frmMostraAux);


      with frmMostraAux.memResult.Lines do
        begin
        Clear;


        Add('-----------------------------------------------------------------------------------------------------');
        Add(PreparaStr('LOG DO PROCESSAMENTO DE REQUERIMENTO DE RESGATE COMPLEMENTAR EM LOTE',99));
        Add('-----------------------------------------------------------------------------------------------------');
        Add('Início do Processamento: '+FormatDateTime('dd/mm/yyyy', date)+' '+FormatDateTime('hh:mm:ss', time));


        while not qry.eof do
            begin
            Add('-----------------------------------------------------------------------------------------------------');

            Add(PreparaStr('Matrícula  : '+qry.FieldByName('Matrícula').AsString,30)+
             //  PreparaStr('Inscrição : '+qry.FieldByName('inscricao').AsString,20)+
               PreparaStr('Nome  : '+qry.FieldByName('Nome').AsString,49));

            Add('Mensagem de Erro: '+qry.FieldByName('Mensagem de Erro').AsString);
            Add(qry.FieldByName('Mensagem Oracle').AsString);

            qry.next;
            end;


        Add('-----------------------------------------------------------------------------------------------------');
            Add(PreparaStr('Quantidade total de registros : '+inttostr(qryDet.recordcount),50)+
               PreparaStr('Quantidade de registros processados :  '+inttostr(RegProc),50));


         iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

            Add(PreparaStr('Tempo de Processamento : '+TempoDecorrido(iFim - iInicio),50)+
               PreparaStr('Log gerado em : '+FormatDateTime('dd/mm/yyyy', date)+' às '+FormatDateTime('hh:mm', time)+' horas',50));



        Add('-----------------------------------------------------------------------------------------------------');
        Add(PreparaStr('Fim do Processamento: '+FormatDateTime('dd/mm/yyyy', date)+' '+FormatDateTime('hh:mm:ss', time),99));
        Add('-----------------------------------------------------------------------------------------------------');

//      frmMostraAux.memResult.Lines

      end;

//frmMostraAux.ShowModal;
//ppMemo1.Lines.Clear;
//ppMemo1.Lines.Text:=frmMostraAux.memResult.Lines.Text;
TFrmPreview.CreateModalPreview(Application, rpReciboCedidos,'LOG DO PROCESSAMENTO DE REQUERIMENTO DE RESGATE COMPLEMENTAR EM LOTE');
end;

procedure TFrmCadRequerResgCompLote.buscarlog;
begin
//pnl1.BringToFront;
//pnl_impressao.SendToBack;
qry.Close;
qry.Active:=false;
qry.sql.clear;
qry.sql.Add('SELECT matricula AS Matrícula,nome as Nome,msgerro as "Mensagem de Erro",msgerrooracle as "Mensagem Oracle" FROM CM.LOGRESGLOTE');
//qry.sql.Add(' WHERE IDBENEFHABILITA IN ('+FIdbenefh.COMMATEXT+')');
qry.Active:=true; 

end;

procedure TFrmCadRequerResgCompLote.configuralog;
begin
pnl_impressao.BringToFront;
pnl1.SendToBack;

end;

procedure TFrmCadRequerResgCompLote.gera_impressao_requerimento;
  var
  query:TwwQuery;
begin


query:=TwwQuery.Create(Self);
query.DataBaseName := 'BaseDados';

qry_rel.Active:=false;

qry_rel.open;

qry_rel.Delete;



//buscarequerimentos('S','');

  If frmMostraAux = Nil Then
     Application.CreateForm(TfrmMostraAux, frmMostraAux);
//     frmMostraAux.Caption:='DEMONSTRATIVO DE REQUERIMENTOE BENEFÍCIOS DO INSS EM LOTE';

      with frmMostraAux.memResult.Lines do
        begin




        qrydet.First;
        while not qrydet.eof do
            begin

            query.close;
            query.sql.clear;
            query.SQL.Add('SELECT NOME, DATANASC');
            query.SQL.Add('  FROM PESSOA P, PESSOAFISICA PF');
            query.SQL.Add(' WHERE P.IDPESSOA ='+qrydet.FieldByName('IDPESSOA').TEXT);
            query.SQL.Add('   AND PF.IDPESSOA = P.IDPESSOA');
            query.open;

             clear;
             Add('------------------------------------------------------------------------------------------------------');
             Add('DEMONSTRATIVO DE REQUERIMENTO DE RESGATE COMPLEMENTAR EM LOTE');
             Add('                                                               VERSÃO : ' + Sistema.Versao);
    //         Add('                                                                           LOTE   : ' + IntToStr(iIdLoteConcessao)); não fazer
             Add('USUÁRIO : ' + Sistema.NomeUsuario + '            DATA DO REQUERIMENTO : ' + FormatDateTime('dd/mm/yyyy', Date));
             Add('------------------------------------------------------------------------------------------------------');



            Add('-----------------------------------------------------------------------------------------------------');

            Add(PreparaStr('Matrícula  : '+qrydet.FieldByName('matricula').AsString,99));   


             Add(PreparaStr('Nome do Participante : '+query.FieldByName('NOME').text,50)+
               PreparaStr('Data de Nascimento : '+query.FieldByName('DATANASC').text,50));


            Add(PreparaStr('Saldo Residual : '+formatfloat('#,##0.00',qrydet.FieldByName('SALDO_CONTA_TOTAL').value),50)+
               PreparaStr('Plano Previdenciário : '+qrydet.FieldByName('plano').AsString,50));

            qryaux.Active:=false;
            qryaux.SQL.Clear;
            qryaux.sql.Add('SELECT msgerro FROM CM.LOGRESGLOTE');
            qryaux.sql.Add(' WHERE matricula='+#39+qrydet.FieldByName('matricula').AsString+#39);
            qryaux.OPEN;




            Add('Mensagem de Impedimento: '+qryaux.FieldByName('msgerro').AsString); ///FEITO



            Add('-----------------------------------------------------------------------------------------------------');
            Add(PreparaStr('APENAS PARA CONFERÊNCIA',99));
            Add('-----------------------------------------------------------------------------------------------------');

            qry_rel.Insert;
            qry_rel.FieldByName('matricula').text:=qrydet.FieldByName('matricula').AsString;
            qry_rel.FieldByName('memo').AsString :=frmMostraAux.memResult.Lines.Text;        //edilaine - SIG86660
            qry_rel.Post;



            qrydet.next;
            end;



        end;

query.close;
query.destroy;
qryaux.CLOSE;

//ppMemo1.Lines.Clear;
//ppMemo1.Lines.Text:=frmMostraAux.memResult.Lines.Text;

TFrmPreview.CreateModalPreview(Application, rpReciboCedidos,'DEMONSTRATIVO DE REQUERIMENTO DE RESGATE COMPLEMENTAR EM LOTE');

end;

procedure TFrmCadRequerResgCompLote.sbtnAlterarClick(Sender: TObject);
begin
////showmessage
qryDet.edit;
qryDet.post;
  inherited;

end;

procedure TFrmCadRequerResgCompLote.sbtnInserirClick(Sender: TObject);
begin

////
  inherited;

end;

procedure TFrmCadRequerResgCompLote.sbtnRequererClick(Sender: TObject);
var
achou:Boolean;
Fidpessoa,Ferro,Fmatricula  : TStringList;
idevento:string;
iNumeroProcesso,ideventosprev:integer;

begin
 Fidpessoa := TStringList.Create;
 Fidpessoa.Clear;

 Ferro:= TStringList.Create;
 Ferro.Clear;

 Fmatricula:= TStringList.Create;
 Fmatricula.clear;         

 FIdbenefh.clear;

_query_dados:=TwwQuery.Create(Self);
_query_dados.DataBaseName := 'BaseDados';
 
///
  inherited;

RegProc:=0;  

//Criar_temp(qrydet);
Deletar_temp_log(qry2);

if Trim(cb_tipo_recebedor.Text) = '' then
   begin
   MsgDlg( ' É necessário selecionar um dos planos previdenciários disponíveis para requerimento do resgate complementar.','Erro',mtError,[mbOk],0);
   cb_tipo_recebedor.SetFocus;
   exit;
   end;//msg02

   //Início - William Santana - SIG 38101
   if ((mk_data_re.Text) = '  /  /    ') and ((mk_data_pag.Text) = '  /  /    ') then
   begin
   MsgDlg('É necessário preencher a Data Requerimento e a Data Pagamento para requerimento do resgate complementar.','Erro',mtError,[mbOk],0);
   mk_data_re.SetFocus;
   sbtnRequerer.Down := false;
   exit;
   end;//msg05

   if mk_data_re.Text = '  /  /    ' then
   begin
   MsgDlg('É necessário preencher a Data de Requerimento para requerimento do resgate complementar.','Erro',mtError,[mbOk],0);
   mk_data_re.SetFocus;
   sbtnRequerer.Down := false;
   exit;
   end;//msg02

   if mk_data_pag.Text = '  /  /    ' then
   begin
   MsgDlg('É necessário preencher a Data de Pagamento para requerimento do resgate complementar.','Erro',mtError,[mbOk],0);
   mk_data_pag.SetFocus;
   sbtnRequerer.Down := false;
   exit;
   end;//msg03
 //Término - William Santana - SIG 38101

if  not qrydet.IsEmpty then
   begin


   qrydet.Filter:='SELECIONADO ='+#39+'S'+#39;
   qrydet.Filtered:=True;
   qrydet.Active:=True;
   qrydet.First;


   if qrydet.IsEmpty then
      begin
      MsgDlg( ' É necessário selecionar qual(is) registro(s) para o processamento do(s) requerimento(s) do resgate complementar','Erro',mtError,[mbOk],0);
      qrydet.Filtered:=FALSE;          
      Exit;
      end;

     ///verificar se matricula existe se não criar.
   qrydet.First;
   while not qrydet.eof do
      begin
      if qrydet.FieldByName('matricula').Text='' then
         begin
         qrydet.edit;
         qrydet.FieldByName('matricula').Text:=GeraMatricula( qryaux ,0);
         qrydet.post;
         end;

      qrydet.Next;
      end;


   qrydet.First;
   Ferro.Clear;



///RN014


   achou:=false;



    qrydet.First;
    while not qrydet.eof do
       begin

       Fidpessoa.Add(qrydet.FieldByName('IDPESSOA').Text);
       Fmatricula.Add(#39+qrydet.FieldByName('MATRICULA').Text+#39);
  //     FIdbenefh.Add(#39+qrydet.FieldByName('IDBENEFHABILITA').Text+#39);
         
       qrydet.Next;
       end;

    achou:=True;
   RemoveDuplicates(Fidpessoa);
   RemoveDuplicates(Fmatricula);
  //  RemoveDuplicates(FIdbenefh);












    qrydet.First;
    Ferro.Clear;
    while not qrydet.Eof do
     begin

//      _query_dados.close;
//      _query_dados.sql.clear;
//      _query_dados.SQL.Add('SELECT');
//      _query_dados.SQL.Add(' BF.NUMEROPROCESSO,');
////      _query_dados.SQL.Add(' --BH.EVENTOGERADOR,');
////      _query_dados.SQL.Add(' --BH.FLGREQUERIMENTO,');
//      _query_dados.SQL.Add(' BF.IDBENEFICIO,');
////      _query_dados.SQL.Add('-- BH.NUMBENEFICIO,NAO PRECISA');
//      _query_dados.SQL.Add(' BF.IDPESSOA,');
//      _query_dados.SQL.Add(' BF.IDTITULAR,');
//      _query_dados.SQL.Add('');
//      _query_dados.SQL.Add(' BF.IDPLANOPREV,');
////      _query_dados.SQL.Add(' --BH.IDSITPART,');
//      _query_dados.SQL.Add(' BF.IDPESSJUR,');
////      _query_dados.SQL.Add(' --BH.IDSITPLANOPREV,');
//      _query_dados.SQL.Add(' BF.SEQPROPOSTA');
////      _query_dados.SQL.Add(' --BH.INSCRICAONUMERO');
//      _query_dados.SQL.Add('FROM BENEFBFCIARIO BF');
//      _query_dados.SQL.Add(' WHERE BF.IDBENEFICIO IN (231,323,526,277,418,458,523,378,524,478,510,528,516,493)');
//      _query_dados.SQL.Add('                AND BF.IDPESSOA ='+qrydet.FieldByName('IDPESSOA').Text);
//      _query_dados.SQL.Add('                AND BF.IDTITULAR ='+qrydet.FieldByName('IDPESSOA').Text);
//      _query_dados.OPEN;
     idevento:='337';

     qrySitFunc.Close;
     qrysitFunc.parambyname('IDEVENTO').AsString := idevento;
     qrySitFunc.Open;
     qrySitPlanoPrev.Close;
     qrysitPlanoPrev.parambyname('IDEVENTO').AsString := idevento;
     qrySitPlanoPrev.Open;
     qrySitPart.Close;
     qrysitPart.parambyname('IDEVENTO').AsString := idevento;
     qrySitPart.Open;

     ///1 processo para cada registro
     iNumeroProcesso := LeUltRegistro(qry2,'PROCESSOBENEF');

     ideventosprev:=GravarEventoPrev(qryaux,idevento);
     GravarBfciarioTitPlan(qry2,IntToStr(iNumeroProcesso),idevento);
     GravarProcessoBenef(qry2,idevento,IntToStr(iNumeroProcesso));
     GravarBENEFBFCIARIO(qry2,IntToStr(iNumeroProcesso),ideventosprev);

 

       if cb_grava_indiv.Checked then
            begin
             If not dtmBaseDados.dbBaseDados.InTransaction Then
                 dtmBaseDados.dbBaseDados.StartTransaction;
            dtmBaseDados.dbBaseDados.Commit;
            end;

     RegProc:=RegProc+1;

     qrydet.Next;
     end;



   end;





gera_impressao_requerimento;
qrydet.Filtered:=false;

//If not dtmBaseDados.dbBaseDados.InTransaction Then
//   dtmBaseDados.dbBaseDados.StartTransaction;

///verificar erro para mostrar uma das mensagens
if Ferro.Count>0 then
   begin



         If not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;
                     
   //      if MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível efetuar o requerimento do benefício. Verifique. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
//            begin
//            dtmBaseDados.dbBaseDados.Commit;
//
//
//            buscarlog;
//            end
//          else
//             begin
////             tbcDetalhe.tabindex:=1;
//             buscarlog;
//
//
//
//             If dtmBaseDados.dbBaseDados.InTransaction   Then
//                dtmBaseDados.dbBaseDados.Rollback;
//             end;



           if not cb_grava_indiv.Checked then
                 begin
                 if MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível efetuar o requerimento do benefício. Verifique. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                    begin
                    dtmBaseDados.dbBaseDados.Commit;

                    end
                  else
                     begin

                     buscarlog;



                     If dtmBaseDados.dbBaseDados.InTransaction   Then
                        dtmBaseDados.dbBaseDados.Rollback;


                     end;
                  end
              else
                 MsgDlg( 'Requerimento efetuado com sucesso para as matrículas selecionadas.','Informação',mtInformation,[mbOk],0);





   end
else
   begin


         If not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

          if not cb_grava_indiv.Checked then
                 begin
                   if MsgDlg( ' Requerimento efetuado com sucesso para as matrículas selecionadas.Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                    begin
                    dtmBaseDados.dbBaseDados.Commit;

                    end
                  else
                     begin

                     buscarlog;



                     If dtmBaseDados.dbBaseDados.InTransaction   Then
                        dtmBaseDados.dbBaseDados.Rollback;


                     end;
                  end
              else
                 MsgDlg( 'Requerimento efetuado com sucesso para as matrículas selecionadas.','Informação',mtInformation,[mbOk],0);





     //    if MsgDlg( ' Requerimento efetuado com sucesso para as matrículas selecionadas.Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
//            begin
//            dtmBaseDados.dbBaseDados.Commit;
//
//
//
//            buscarlog;
//            end
//          else
//             begin
//
//
//             buscarlog;
//
//
//
//             If dtmBaseDados.dbBaseDados.InTransaction   Then
//                dtmBaseDados.dbBaseDados.Rollback;
//             end;




   end;

Fidpessoa.clear;
Fmatricula.clear;
FIdbenefh.clear;

   
sbtnProcurarClick(sender);
sbtnRequerer.Down:=false;
sbtnProcurar.Down:=false;
sbtnAlterar.Down:=false;

end;

procedure TFrmCadRequerResgCompLote.sbtnApagarClick(Sender: TObject);
begin

//
  inherited;

end;

procedure TFrmCadRequerResgCompLote.sbtnAltDetClick(Sender: TObject);
begin

  inherited;



  if qryDet.IsEmpty then
  begin
     sbtnAltDet.Down := false;
     exit;
  end;


end;

procedure TFrmCadRequerResgCompLote.bbtnDesfazerClick(Sender: TObject);
var
Fidpessoa,Ferro,Fmatricula,Fidbeneficio  : TStringList;
  achou,parada:Boolean;
  NumeroProc:string;
var
  _query_X :TwwQuery;
begin





_query_X := TwwQuery.Create(Application);
_query_X.DataBaseName := 'BaseDados';


Deletar_temp_log(qry2);
RegProc:=0;


 Fidpessoa := TStringList.Create;
 Fidpessoa.Clear;

 Ferro:= TStringList.Create;
 Ferro.Clear;

 Fmatricula:= TStringList.Create;
 Fmatricula.clear;

Fidbeneficio:= TStringList.Create;
Fidbeneficio.clear;
///

  inherited;

if Trim(cb_tipo_recebedor.Text) = '' then
   begin
   MsgDlg( ' É necessário selecionar um dos planos previdenciários disponíveis para desfazer o requerimento do resgate complementar.','Erro',mtError,[mbOk],0);
   cb_tipo_recebedor.SetFocus;
   exit;
   end;//msg07


   qrydet.Filter:='SELECIONADO ='+#39+'S'+#39;
   qrydet.Filtered:=True;
   qrydet.Active:=True;
   qrydet.First;


   if qrydet.IsEmpty then
      begin
      MsgDlg( ' É necessário selecionar qual(is) registro(s) para o processamento do(s) desfazimento do requerimento(s) do resgate complementar','Erro',mtError,[mbOk],0);
      qrydet.Filtered:=FALSE;
      Exit;
      end; //msg08



if  not qrydet.IsEmpty then
   begin


   achou:=true;


      qrydet.First;
      while not qrydet.eof do
         begin

         Fidpessoa.Add(qrydet.FieldByName('idpessoa').Text);
         Fmatricula.Add(#39+qrydet.FieldByName('matricula').Text+#39);
   //      Fidbeneficio.Add(#39+qrydet.FieldByName('idbeneficio').Text+#39);


         qrydet.Next;
         end;


         RemoveDuplicates(Fidpessoa);
         RemoveDuplicates(Fmatricula);
         RemoveDuplicates(Fidbeneficio);



//
//   qryaux.close;
//   qryaux.SQL.Clear;
//   QRYAUX.SQL.APPEND(' SELECT FLGREQUERIMENTO FROM BENEFHABILITA');
//   QRYAUX.SQL.APPEND(' WHERE');
//   QRYAUX.SQL.APPEND(' FLGREQUERIMENTO = 1');
//   QRYAUX.SQL.APPEND(' AND IDPESSOA IN ('+Fidpessoa.COMMATEXT+')');
//   qryaux.Open;
//   qryaux.First;         
//
//
//   if qryaux.IsEmpty then
//     begin
//     MsgDlg( ' A(S) matrículas selecionada(s) não possui(em) benefício requererido','Erro',mtError,[mbOk],0);
//     qrydet.Filtered:=FALSE;
//     Exit;
//     end; //msg16


   qryaux.close;
   qryaux.SQL.Clear;


   QRYAUX.SQL.APPEND(' SELECT MATRICULA FROM HISTRUBSAL H ');
   QRYAUX.SQL.APPEND('   JOIN DEPENTIT D ON H.IDPESSOA = D.IDPESSOA');
   QRYAUX.SQL.APPEND('   AND H.IDTITULAR = D.IDTITULAR');
   QRYAUX.SQL.APPEND(' WHERE h.IDPESSOA IN('+FIDPESSOA.COMMATEXT+')');
   QRYAUX.SQL.APPEND('                AND h.IDBENEFICIO IN ('+'418'+')');

   qryaux.Open;
   qryaux.First;
   Ferro.Clear;

   if not qryaux.IsEmpty then
     begin
     while not qryaux.Eof do
        begin

        Ferro.Add(qryaux.fieldbyname('matricula').text);

        qryaux.Next;
        end;

      MsgDlg( ' A(S) matrículas '+trocaCaracter(Ferro.CommaText,',','e')+' já teve (tiveram) o benefício processado pela folha de benefícios','Erro',mtError,[mbOk],0);///msg11
      Exit;
     end;



   qrydet.First;  
   while not qrydet.Eof do
      begin
       NumeroProc:=GetNumeroProcesso;
       DeletarHSTBENEFBFCIARIO(_query_X,'337');//0
       DeletarBENEFBFCIARIO(_query_X,NumeroProc);//1 TESTE
       DeletarBfciarioTitPlan(_query_X);//2
       DeletarProcessoBenef(_query_X,NumeroProc);
       DeletarEventoPrev(_query_X,qrydet.fieldbyname('IDEVENTOSPREV').text);

      RegProc:=RegProc+1;


      qrydet.Next;
      end;


   end;




qrydet.Filtered:=FALSE;


///verificar erro para mostrar uma das mensagens
if Ferro.Count>0 then
   begin

   If not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

  // if MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível desfazer o requerimento do resgate complementar. Verifique. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
//      begin
//      dtmBaseDados.dbBaseDados.Commit;
//      buscarlog;
//      end
//    else
//       begin
//
//
//       buscarlog;
//
//
//
//       If dtmBaseDados.dbBaseDados.InTransaction   Then
//          dtmBaseDados.dbBaseDados.Rollback;
//       end;


       if not cb_grava_indiv.Checked then
                 begin
                 if MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível desfazer o requerimento do resgate complementar. Verifique. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                    begin
                    dtmBaseDados.dbBaseDados.Commit;

                    end
                  else
                     begin

                     buscarlog;



                     If dtmBaseDados.dbBaseDados.InTransaction   Then
                        dtmBaseDados.dbBaseDados.Rollback;


                     end;
                  end
              else
                 MsgDlg( 'Requerimento(s) defeito(s) com sucesso para as matrículas selecionadas.','Informação',mtInformation,[mbOk],0);





   end
else
   begin


   If not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

      if not cb_grava_indiv.Checked then
                     begin
                     if MsgDlg( 'Para pelo menos uma matrícula selecionada não foi possível desfazer o requerimento do resgate complementar. Verifique. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                        begin
                        dtmBaseDados.dbBaseDados.Commit;

                        end
                      else
                         begin

                         buscarlog;



                         If dtmBaseDados.dbBaseDados.InTransaction   Then
                            dtmBaseDados.dbBaseDados.Rollback;


                         end;
                      end
                  else
                     MsgDlg( 'Requerimento(s) defeito(s) com sucesso para as matrículas selecionadas.','Informação',mtInformation,[mbOk],0);





   //if MsgDlg( 'Requerimento(s) defeito(s) com sucesso para as matrículas selecionadas. Deseja gravar as alterações ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
//      begin
//      dtmBaseDados.dbBaseDados.Commit;
//      buscarlog;
//      end
//    else
//       begin
//
//       buscarlog;
//       sbtnRequerer.Enabled:=false;
//       bbtnDesfazer.Enabled:=false;
//
//
//       If dtmBaseDados.dbBaseDados.InTransaction   Then
//          dtmBaseDados.dbBaseDados.Rollback;
//       end;


   end;
sbtnProcurarClick(sender);

sbtnRequerer.Down:=false;
sbtnProcurar.Down:=false;
sbtnAlterar.Down:=false;

_query_X.close;
_query_X.Destroy;

end;

procedure TFrmCadRequerResgCompLote.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
//
end;

function TFrmCadRequerResgCompLote.GravarEventoPrev(_query: TwwQuery;_EventoGerador:string):integer; ///RN015

var
iIdEventoPrev: integer;
sIdEventoGerador: string;
sFlgEfetivado,sDataEfetivado ,sFlgSitFuncImed,sFlgSitPartImed,sFlgSitPlanoImed: string;
sIDSITFUNC,sIDSITPART ,sIDSITPLANOPREV: string;

begin
 iIdEventoPrev := LeUltRegistro(_query,'EVENTOSPREV');
 iIdEventoPrevG:=iIdEventoPrev;
 sIdEventoGerador:= _EventoGerador;  //129 0u 130 regra 015

//  sIdEventoGerador:= '131';  //teste


  _query.Close;
  _query.Sql.Clear;
  _query.Sql.Add(' SELECT FLGSITFUNCIMEDIA, FLGSITPARTIMEDIA, FLGSITPLANOIMEDI FROM EVENTOGERADOR ' +
                 ' WHERE IDEVENTOGERADOR = ' + sIdEventoGerador);
  try
     _query.Open;
  except

  end;

  if (_query.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1') and
     (_query.FieldByName('FLGSITPARTIMEDIA').AsString  = '1') and
     (_query.FieldByName('FLGSITPLANOIMEDI').AsString = '1')
  then begin
     sFlgEfetivado  := '1';

     sDataEfetivado := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')';
  end
  else begin
     sFlgEfetivado  := '0';
     sDataEfetivado := 'NULL';
  end;

    sFlgSitFuncImed :=_query.FieldByName('FLGSITFUNCIMEDIA').AsString ;
    sFlgSitPartImed := _query.FieldByName('FLGSITPARTIMEDIA').AsString;
    sFlgSitPlanoImed  := _query.FieldByName('FLGSITPLANOIMEDI').AsString ;


if Trim(qrySitFunc.FieldbyName('IDSITFUNC').AsString)='' then
    sIDSITFUNC:='0'
else
    sIDSITFUNC:=qrySitFunc.FieldbyName('IDSITFUNC').AsString;



if Trim(qrySitPart.FieldbyName('IDSITPART').AsString)='' then
    sIDSITPART:='0'
else
    sIDSITPART:=qrySitPart.FieldbyName('IDSITPART').AsString;



if Trim(qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString)='' then
    sIDSITPLANOPREV:='0'
else
    sIDSITPLANOPREV:=qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString;
//Marcio Sanches Spinosa SOL 228908 PPM 346104 - Inicio
IF mk_data_pag.Text <> '  /  /    ' THEN
 sDataEfetivado := mk_data_pag.Text
else
 sDataEfetivado := EmptyStr;
//Marcio Sanches Spinosa SOL 228908 PPM 346104 - Fim

          _query.Close;
          _query.SQL.Clear;
          _query.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                         '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                         '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                         '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                         '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                         '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO, DATAREQUERIMENTO,MATRICULA,FLGCOBROUPATRO,FLGTPDEMISSAO,IDBENEFICIO) ' +
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' +
                         ' TO_DATE(''' + FormatDateTime('DD/MM/YYYY', date) + ''',''DD/MM/RRRR''),' +  //William Santana - SIG 38101
                         //' To_Date(''' + Trim(sDataEfetivado) + ''',''dd/MM/yyyy'')' + ',' + //Marcio Sanches Spinosa SOL 228908 PPM 346104 //William Santana - SIG 38101
                         ' To_Date(''' + Trim(sDataEfetivado) + ''',''dd/MM/yyyy'')' + ',' +//Marcio Sanches Spinosa SOL 228908 PPM 346104  //William Santana - SIG 38101
                                      qryDet.fieldbyname('idpessoa').text  + ',' + qryDet.fieldbyname('IDPESSJUR').text + ',' + qryDet.fieldbyname('IDPLANOPREV').text + ',' + '1' + ',' +
                                      qryDet.fieldbyname('IDSITFUNC').text +  ',' + qryDet.fieldbyname('IDSITPART').text + ',' + qryDet.fieldbyname('IDSITPLANOPREV').text + ','
                                       +  qryDet.fieldbyname('IDSITFUNC').text +  ',' + //ok
                                      qryDet.fieldbyname('IDSITPART').text + ',' +   //ok
                                      qryDet.fieldbyname('IDSITPLANOPREV').text  + ',' + //ok
                                      sIdEventoGerador + ',' + '0' + ',' + '0' + ',' + '0' + ',' +  //sIdEventoGerador 129 0u 130 regra 015
                                      //'TO_DATE(''' + mk_data_re.text +''', ''DD/MM/YYYY'')' + //Marcio Sanches Spinosa SOL 228908 PPM 346104  //William Santana - SIG 38101
                                      'TO_DATE(''' + FormatDateTime('DD/MM/YYYY', date) + ''',''DD/MM/RRRR''),' +  //William Santana - SIG 38101
                                      '0' +','+OraNumero(qryDet.fieldbyname('INSCRICAONUMERO').text){'0'} + ', ' +//Marcio Sanches Spinosa SOL 228908 PPM 346104
//                                      'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtDataInicio.Date) + ''',''DD/MM/YYYY''),'+
                                      'TO_DATE(''' + mk_data_re.text + ''',''DD/MM/YYYY''),'+ //Marcio Sanches Spinosa SOL 228908 PPM 346104
                                       qryDet.fieldbyname('MATRICULA').text+', '+
                                       '1'+', '+
                                       '0'+', '+
                                       {_query_dados.fieldbyname('IDBENEFICIO').text}'418'+')');
          try
             _query.ExecSQL;
              result:=iIdEventoPrev;
          except





             on E:EDBEngineError do
               begin

               If not dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.StartTransaction;

                If dtmBaseDados.dbBaseDados.InTransaction   Then
                   dtmBaseDados.dbBaseDados.Rollback;

 //                   MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;



end;

procedure TFrmCadRequerResgCompLote.AtualizaBenefHabilita(
  _query: TwwQuery;_flgrequerimento,_NUMEROPROCESSO,_EVENTOGERADOR:string);
begin

if trim(_NUMEROPROCESSO)='' then
_NUMEROPROCESSO:='0';

if trim(_EVENTOGERADOR)='' then
_EVENTOGERADOR:='0';        


          _query.Close;
          _query.SQL.Clear;
          _query.SQL.Add(' UPDATE BENEFHABILITA set FLGCONCESSAO=0 , FLGREQUERIMENTO ='+#39+_flgrequerimento+#39+' , NUMEROPROCESSO ='+_NUMEROPROCESSO+', eventogerador='+_EVENTOGERADOR+' where IDBENEFHABILITA ='+#39+qryDet.fieldbyname('IDBENEFHABILITA').text+#39);
          _query.ExecSQL;

end;

procedure TFrmCadRequerResgCompLote.GravarBfciarioTitPlan(
  _query: TwwQuery;_NUMEROPROCESSO,_EventoGerador:STRING);

  var
    sSeqProposta: String;  //William Santana - SIG 38101
begin

     //Início - William Santana - SIG 38101
       _query.Close;
       _query.SQL.Clear;
       _query.SQL.Add(' SELECT COUNT(1) + 1 AS NUMREG FROM BFCIARIOTITPLAN ');
       _query.SQL.Add(' WHERE IDPESSJUR = '+ qryDet.FieldByName('IDPESSJUR').AsString);
       _query.SQL.Add(' AND IDTITULAR = '+ qryDet.FieldByName('IDPESSOA').AsString);
       _query.SQL.Add(' AND IDPLANOORIGEM = '+ qryDet.FieldByName('IDPLANOPREV').AsString);
       _query.SQL.Add(' AND IDPLANOPREV = '+ qryDet.FieldByName('IDPLANOPREV').AsString);
       _query.SQL.Add(' AND IDPESSOA = '+ qryDet.FieldByName('IDPESSOA').AsString);
       _query.SQL.Add(' AND IDBENEFICIO = 418');
       _query.Open;

       sSeqProposta := intToStr(_query.FieldByName('NUMREG').AsInteger);

     //Término - William Santana - SIG 38101

          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('INSERT INTO BFCIARIOTITPLAN  ' +
                         '(IDPESSJUR, ' +
                         'IDTITULAR,  ' +
                         'IDPLANOORIGEM, ' +
                         'IDPLANOPREV, ' +
                         'IDPESSOA, ' +
                         'IDBENEFICIO, ' +
                         'SEQPROPOSTA, ' +
                         'PRIORIDADE, ' +
                         'PERCENTUAL, ' +
                ///         'IDEVENTOGERADOR, ' +

                   //      'FLGACIDENTAL, ' +
                    //     'DTEVENTO, ' +
                    //     'DTDIREITO, ' +
                    //     'DTREGISTRO, ' +
                     //    'IDSITPROCESSO, ' +


                         'IDRESPONSAVEL) ' +
                      'VALUES  ' +
                        '('+#39+ qryDet.FIELDBYNAME('IDPESSJUR').TEXT+#39+', '+
                            #39+qryDet.FIELDBYNAME('IDPESSOA').TEXT+#39+',  ' +
                            #39+qryDet.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
                            #39+qryDet.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
                            #39+qryDet.FIELDBYNAME('IDPESSOA').TEXT+#39+',  ' +
                            #39+{_query_dados.FIELDBYNAME('IDBENEFICIO').TEXT}'418'+#39+',  ' +
                            //#39+'1'+#39+',  ' +       //William Santana - SIG 38101
                            #39+ sSeqProposta+#39+',  ' +                            //William Santana - SIG 38101
                         '0, ' +
                         '100, ' +
                    //     #39+_EventoGerador+#39+',  ' +
                     //    #39+'0'+#39+',  ' +
                     //    'TO_DATE(''' + QRYDET.FIELDBYNAME('DIB').TEXT + ''',''DD/MM/YYYY''),'+
                     //    'TO_DATE(''' + QRYDET.FIELDBYNAME('DIB').TEXT + ''',''DD/MM/YYYY''),'+
                       //  'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''DD/MM/YYYY''),'+
                       ///  #39+'1'+#39+',  ' +

                         #39+qryDet.FIELDBYNAME('IDPESSOA').TEXT+#39+') ');


          try
             _query.ExecSQL;
          except


                        
             on E:EDBEngineError do
               begin

               If not dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.StartTransaction;

                If dtmBaseDados.dbBaseDados.InTransaction   Then
                   dtmBaseDados.dbBaseDados.Rollback;
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;
end;

procedure TFrmCadRequerResgCompLote.GravarProcessoBenef(_query: TwwQuery;_EventoGerador,_NUMEROPROCESSO:string);


begin



          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('INSERT INTO PROCESSOBENEF  ' +
          '(NUMEROPROCESSO,'+
          'IDEVENTOGERADOR,'+
          ' DTEVENTO,      '+
          ' DTDIREITO,     '+
          ' DTREGISTRO,    '+
          ' IDSITPROCESSO) '+
          ' values         '+
         '('+#39+ _NUMEROPROCESSO+#39+', '+
           #39+_EventoGerador+#39+',  ' +
//           ' To_Date(''' + FormatDateTime('dd/mm/yyyy', date) + ''',''dd/MM/yyyy'')' +',  ' +
//           ' To_Date(''' + FormatDateTime('dd/mm/yyyy', date) + ''',''dd/MM/yyyy'')' +',  ' +
//             ' To_Date(''' + FormatDateTime('dd/mm/yyyy', date) + ''',''dd/MM/yyyy'')' +',  ' +
           ' To_Date(''' +  mk_data_pag.text + ''',''dd/MM/yyyy'')' +',  ' + //Marcio Sanches Spinosa SOL 228908 PPM 346104
           ' To_Date(''' +  mk_data_pag.text + ''',''dd/MM/yyyy'')' +',  ' + //Marcio Sanches Spinosa SOL 228908 PPM 346104
           //' To_Date(''' +  mk_data_pag.text + ''',''dd/MM/yyyy'')' +',  ' + //Marcio Sanches Spinosa SOL 228908 PPM 346104  /William Santana - SIG 38101
           'TO_DATE(''' + FormatDateTime('DD/MM/YYYY', date) + ''',''DD/MM/RRRR'')' +',  ' +  //William Santana - SIG 38101
//             ' To_Date(''' + FormatDateTime('dd/mm/yyyy', date) + ''',''dd/MM/yyyy'')' +',  ' +
          ''+'4'+')');  ////pendente de concessao.

          try
             _query.ExecSQL;
          except


             on E:EDBEngineError do
               begin

               If not dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.StartTransaction;

               If dtmBaseDados.dbBaseDados.InTransaction   Then
                   dtmBaseDados.dbBaseDados.Rollback;
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadRequerResgCompLote.GravarBENEFBFCIARIO(_query: TwwQuery;
  _NUMEROPROCESSO: string;_ideventosPrev:Integer);
var dataant:string;
var idplanoprevcontab:string; //Rafael SIG93442
begin

   //Rafael SIG93442  Inicio

       _query.Close;
       _query.SQL.Clear;
       
       _query.SQL.Add(' SELECT IDPLANPREVCONTAB  FROM benefplanpatro');
       _query.SQL.Add(' WHERE IDPLANOPREV = '+ qryDet.FIELDBYNAME('IDPLANOPREV').TEXT);
       _query.SQL.Add(' AND IDPESSJUR = '+  qryDet.FIELDBYNAME('IDPESSJUR').TEXT);
       _query.SQL.Add(' AND IDBENEFICIO = 418');
       _query.Open;

       idplanoprevcontab := intToStr(_query.FieldByName('IDPLANPREVCONTAB').AsInteger);


//Rafael SIG93442  Fim


//if QRYDET.FIELDBYNAME('DIBANT').TEXT<>'' then
//   dataant:=' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIBANT').TEXT)) + ''',''dd/MM/yyyy'')' +',  '
//else
   dataant:='null'+',  ' ;
          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('INSERT INTO BENEFBFCIARIO ' +
          '(NUMEROPROCESSO,  ' +
          'IDPESSJUR,        ' +
          ' IDPLANOPREV,     ' +
          ' IDTITULAR,        ' +
          ' IDPESSOA,         ' +
          ' SEQPROPOSTA,      ' +
          ' IDBENEFICIO,      ' +
//          ' CODPORTFORMA,     ' +
          ' IDSITBENEFICIO,   ' +
//          ' IDDEPENDENCIA,    ' +
          ' IDTPPAGTOBENEFIC, ' +
          ' VALORATUAL,       ' +
          ' DATAREQUERIMENTO, ' +
          ' DATAINICIO,       ' +
          ' DATAFINAL,        ' + //Marcio Sanches Spinosa SOL 228908 PPM 346104
          ' FLGFORMAPAGTO,    ' +
          ' VALORCALCULADO,   ' +
//          ' DATAULTREAJUSTE,  ' +
          ' ULTMESPREPARO,      ' +
          ' VLRCALCINSS,      ' +
          ' VLRINFINSS,       ' +
          ' DATAINICIOINSS,   ' +
          ' NUMPROCINSS,     ' +
          ' DATAINICIOFUND,   ' +
//          ' VALORCOTAS,       ' +
          ' VALORTOTAL,       ' +
          ' FLGDATAPREVISTA,       ' +
          ' DFLOATPAGTO,       ' +
          ' PERCENTUAL,       ' +
          ' VALORNADIB,       ' +
          //' DATACONCESSAO,    ' +
//          ' FLGPROVISORIO,    ' +
//          ' PERCPROVISORIO,   ' +
//          ' PRAZOPROVISORIO,  ' +
//          ' ULTMESREAJUSTE,   ' +
//          ' ULTVALORATUALREAJ,' +
          ' DIBBENEFANT,      ' +
//          ' VALORBENEFANT,    ' +
//          ' VALORBINSSANT1,   ' +
//          ' VALORBINSSANT2,   ' +
//          ' VALORBINSSANT3,   ' +
//          ' FLGBENEFMIN,      ' +
//          ' VALORSRB,         ' +
          ' IDPLANOORIGEM,    ' +
          ' IDTITBENEF,    ' +
//          ' VALORNADIB,        ' +
          ' IDPLANPREVCONTAB,  ' +
          ' FONTEPAGADORA,     ' +
          ' QTDEPARCELAS,     ' +
          ' RESGATEPARCELADO,     ' +
//          ' PLACONTAD,         ' +
//          ' PLACONTAC,         ' +
          ' FLGPAGAINSS,IDEVENTOSPREV)       ' +
///          ' VALORBASE1,        ' +
//          ' VALORBASE2,        ' +
//          ' VALORBASE3)        ' +
        'values                ' +
          '('+#39+ _NUMEROPROCESSO+#39+', '+
           #39+qryDet.FIELDBYNAME('IDPESSJUR').TEXT+#39+',  ' +
           #39+qryDet.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  ' +
           #39+qryDet.FIELDBYNAME('IDPESSOA').TEXT+#39+',  ' +
           #39+qryDet.FIELDBYNAME('IDPESSOA').TEXT+#39+',  ' +
           #39+'1'+#39+',  ' +
           #39+{_query_dados.FIELDBYNAME('IDBENEFICIO').TEXT}'418'+#39+',  ' +
  //         ':CODPORTFORMA,     ' +
           '4,   ' + ///IDSITBENEFICIO
//           '1,   ' + //          ':IDDEPENDENCIA,    ' +
           '1,   ' +//           ':IDTPPAGTOBENEFIC, ' +
          #39+QRYDET.FIELDBYNAME('SALDO_CONTA_TOTAL').TEXT+#39+',  ' +
           ' To_Date(''' +  mk_data_re.Text + ''',''dd/MM/yyyy'')' +',  ' + //Marcio Sanches Spinosa SOL 228908 PPM 346104
           ' To_Date('''  + mk_data_pag.text + ''',''dd/MM/yyyy'')' +',  ' +  //          ':DATAINICIO,       ' + //Marcio Sanches Spinosa SOL 228908 PPM 346104
           ' To_Date('''  + mk_data_pag.text + ''',''dd/MM/yyyy'')' +',  ' +  //          ':DATAFINAL,       ' +    //Marcio Sanches Spinosa SOL 228908 PPM 346104
//           ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIB').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +  //          ':DATAINICIO,       ' +
 //          ':DATAFINAL,        ' +
          #39+'F'+#39+',  ' + //          ':FLGFORMAPAGTO,    ' +
          #39+QRYDET.FIELDBYNAME('SALDO_CONTA_TOTAL').TEXT+#39+',  ' + //          ':VALORCALCULADO,   ' +
          #39+'0000/00'+#39+',  ' + //ULTTMESPREPARO
 //          ':DATAULTREAJUSTE,  ' +
           #39+QRYDET.FIELDBYNAME('SALDO_CONTA_TOTAL').TEXT+#39+',  ' +//          ':VLRCALCINSS,      ' +
           #39+QRYDET.FIELDBYNAME('SALDO_CONTA_TOTAL').TEXT+#39+',  ' + //          ':VLRINFINSS,       ' +
           ' To_Date(''' + FormatDateTime('dd/mm/yyyy', date) + ''',''dd/MM/yyyy'')' +',  ' + //          ':DATAINICIOINSS,   ' +
           #39+''+#39+',  ' +
//           #39+QRYDET.FIELDBYNAME('NUMBENEFICIO').TEXT+#39+',  ' +
          ' To_Date(''' + mk_data_pag.TEXT + ''',''dd/MM/yyyy'')' +',  ' +   //         ':DATAINICIOFUND,   ' +    //Marcio Sanches Spinosa SOL 228908 PPM 346104
  //         ':VALORCOTAS,       ' +
           #39+QRYDET.FIELDBYNAME('SALDO_CONTA_TOTAL').TEXT+#39+',  ' + //         ':VALORTOTAL,       ' +
           #39+'0'+#39+',  ' +//FLG/DATA PREVISTA
           #39+'0'+#39+',  ' +//DFLOATPAGTO
          #39+'100'+#39+',  ' +//PERCENTUAL VER
  //         ':VALORCOTAS,       ' +
           #39+QRYDET.FIELDBYNAME('SALDO_CONTA_TOTAL').TEXT+#39+',  ' + //         ':VALORNADIB,       ' +
 //          ':DATACONCESSAO,    ' +
 //          ':FLGPROVISORIO,    ' +
 //          ':PERCPROVISORIO,   ' +
 //          ':PRAZOPROVISORIO,  ' +
//           ':ULTMESREAJUSTE,   ' +
//           ':ULTVALORATUALREAJ,' +

            dataant+
//          ' To_Date(''' + FormatDateTime('dd/mm/yyyy', StrToDate(QRYDET.FIELDBYNAME('DIBANT').TEXT)) + ''',''dd/MM/yyyy'')' +',  ' +
  ///         ':VALORBENEFANT,    ' +
 //          ':VALORBINSSANT1,   ' +
//           ':VALORBINSSANT2,   ' +
//           ':VALORBINSSANT3,   ' +
//           ':FLGBENEFMIN,      ' +
//           ':VALORSRB,         ' +
             #39+qryDet.FIELDBYNAME('IDPLANOPREV').TEXT+#39+',  '+
             #39+qryDet.FIELDBYNAME('IDPESSOA').TEXT+#39+',  ' +//IDTITBENEF
//           ':VALORNADIB,       ' +
             #39+idplanoprevcontab+#39+',  '+//           ':IDPLANPREVCONTAB, ' +    //Rafael SIG93442
             #39+'1'+#39+', '+
             #39+'0'+#39+', '+ //QTDEPARCELAS
             #39+'0'+#39+', '+ //RESGATEPARCELADO
//           ':PLACONTAD,        ' +
//           ':PLACONTAC,        ' +
             #39+'0'+#39+' , '+//           ':FLGPAGAINSS') ');
             #39+inttostr(_ideventosprev)+#39+' )  ' );//IDTITBENEF
//           ':VALORBASE1,       ' +
//           ':VALORBASE2,       ' +
//           ':VALORBASE3)       ' );

          try
             _query.ExecSQL;
          except



             on E:EDBEngineError do
               begin

               If not dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.StartTransaction;

               If dtmBaseDados.dbBaseDados.InTransaction   Then
                   dtmBaseDados.dbBaseDados.Rollback;               
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

end;


procedure TFrmCadRequerResgCompLote.DeletarBfciarioTitPlan(
  _query: TwwQuery);
begin


          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('DELETE FROM BFCIARIOTITPLAN WHERE ' +
                         'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
                         'IDBENEFICIO = ' +  #39+'418'+#39+'AND  ' +
                         'SEQPROPOSTA = ' +  #39+'1'+#39+'AND  ' +
                         'PRIORIDADE = 0 AND ' +
                         'PERCENTUAL = 100 AND ' +
                         'IDRESPONSAVEL = '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);


          try
             _query.ExecSQL;
          except



             on E:EDBEngineError do
               begin
               If not dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.StartTransaction;

               If dtmBaseDados.dbBaseDados.InTransaction   Then
                   dtmBaseDados.dbBaseDados.Rollback;               
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

end;

procedure TFrmCadRequerResgCompLote.DeletarBENEFBFCIARIO(_query:TwwQuery;_NUMEROPROCESSO:string);
begin

          _query.Close;
          _query.SQL.Clear;
          _QUERY.SQL.ADD('DELETE FROM BENEFBFCIARIO WHERE ' +
                        // 'NUMEROPROCESSO = '+#39+ _NUMEROPROCESSO+#39+' AND '+
                         'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
                         'IDBENEFICIO = ' +  #39+'418'+#39+'AND  ' +
                         'IDEVENTOSPREV = ' +  #39+ QRYDET.FIELDBYNAME('IDEVENTOSPREV').TEXT+#39+'AND  ' +
                         'SEQPROPOSTA = ' +  #39+'1'+#39);

          try
             _query.ExecSQL;
          except

             on E:EDBEngineError do
               begin

               If not dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.StartTransaction;

               If dtmBaseDados.dbBaseDados.InTransaction   Then
                   dtmBaseDados.dbBaseDados.Rollback;               
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

end;

procedure TFrmCadRequerResgCompLote.DeletarEventoPrev(_query: TwwQuery;
  _EventoGerador: string);
var
  _query2 :TwwQuery;
begin





   _query2 := TwwQuery.Create(Application);
   _query2.DataBaseName := 'BaseDados';
   _query2.close;
   _query2.SQL.Clear;
   _query2.SQL.ADD('DELETE FROM EVENTOSPREV WHERE IDEVENTOSPREV='+_EventoGerador);
    try
             _query2.ExecSQL;
          except


             on E:EDBEngineError do
               begin

               If not dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.StartTransaction;

               If dtmBaseDados.dbBaseDados.InTransaction   Then
                   dtmBaseDados.dbBaseDados.Rollback;               
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

_query2.close;
_query2.destroy;
end;

procedure TFrmCadRequerResgCompLote.DeletarProcessoBenef(_query: TwwQuery;
  _NUMEROPROCESSO: string);
begin

   _query.Close;
   _query.SQL.Clear;
   _QUERY.SQL.ADD('DELETE FROM PROCESSOBENEF WHERE NUMEROPROCESSO='+_NUMEROPROCESSO);
    try
             _query.ExecSQL;
          except

             on E:EDBEngineError do
               begin

               If not dtmBaseDados.dbBaseDados.InTransaction Then
                dtmBaseDados.dbBaseDados.StartTransaction;

               If dtmBaseDados.dbBaseDados.InTransaction   Then
                   dtmBaseDados.dbBaseDados.Rollback;               
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadRequerResgCompLote.Criar_temp(_query: TwwQuery);
begin

      If not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;


TRY
_query.Close;
_query.RequestLive:=true;
_query.sql.Clear;
_query.sql.Add(' create global temporary table TEMPLOG ');
_query.sql.Add('  (matricula varchar2(15), ');
_query.sql.Add('  nome varchar2(60), ');
_query.sql.Add('  msgerro varchar2(150), ');
_query.sql.Add('  msgerrooracle varchar2(150))on commit preserve rows ');
_query.ExecSQL;
EXCEPT
_query.Close;
_query.sql.Clear;
_query.sql.Add(' delete global temporary table TEMP_LOG ');
_query.ExecSQL;  
Criar_temp(qryaux2);
end;

end;

procedure TFrmCadRequerResgCompLote.Gravar_temp_log(_query: TwwQuery;_msgerro,_msgoracle:string);
begin      
_query.Close;
_query.sql.Clear;
_query.sql.Add('insert into CM.LOGRESGLOTE ');
_query.sql.Add('  (  ');
//_query.sql.Add('  IDBENEFHABILITA, ');
_query.sql.Add('  matricula, ');
_query.sql.Add('  nome, ');
_query.sql.Add('  msgerro , ');
_query.sql.Add('  msgerrooracle ');
_query.sql.Add('  )  ');
_query.sql.Add(' values');
_query.sql.Add('  (  ');
//_query.sql.Add(' '+#39+qryDet.fieldbyname('IDBENEFHABILITA').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('MATRICULA').text+#39+',');
_query.sql.Add(' '+#39+qryDet.fieldbyname('PLANO').text+#39+',');
_query.sql.Add(' '+#39+_msgerro+#39+',');
_query.sql.Add(' '+#39+_msgoracle+#39);

_query.sql.Add('  )  ');
TRY
_query.ExecSQL;
EXCEPT
END;

_query.Destroy;
end;

procedure TFrmCadRequerResgCompLote.FormShow(Sender: TObject);
begin
  inherited;
pnl_impressao.SendToBack;
pnl1.SendToBack;
end;

procedure TFrmCadRequerResgCompLote.DeletarHSTBENEFBFCIARIO(
  _query: TwwQuery; _NUMEROPROCESSO: string);
begin

   _query.Close;
   _query.SQL.Clear;
//   _QUERY.SQL.ADD('DELETE FROM HSTBENEFBFCIARIO WHERE NUMEROPROCESSO='+_NUMEROPROCESSO);

          _QUERY.SQL.ADD('DELETE FROM HSTBENEFBFCIARIO WHERE ' +
                        // 'NUMEROPROCESSO = '+#39+ _NUMEROPROCESSO+#39+' AND '+
                         'IDPESSJUR = '+#39+ QRYDET.FIELDBYNAME('IDPESSJUR').TEXT+#39+' AND '+
                         'IDTITULAR =  '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+' AND  ' +
                         'IDPLANOORIGEM = '+#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPLANOPREV = ' +#39+QRYDET.FIELDBYNAME('IDPLANOPREV').TEXT+#39+'AND  ' +
                         'IDPESSOA = ' +   #39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+'AND  ' +
                         'IDBENEFICIO = ' +  #39+'418'+#39+'AND  ' +
                         'SEQPROPOSTA = ' +  #39+'1'+#39);


    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;


end;

procedure TFrmCadRequerResgCompLote.DeletarMovbenef(_query: TwwQuery;
  _NUMEROPROCESSO: string);
begin


   _QUERY.CLOSE;
   _QUERY.SQL.CLEAR;
   _QUERY.SQL.ADD('DELETE FROM  MOVBENEF WHERE IDMOVBENEF IN (SELECT IDMOVBENEF FROM HSTBENEFBFCIARIO WHERE NUMEROPROCESSO='+_NUMEROPROCESSO+')');
    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;
end;

procedure TFrmCadRequerResgCompLote.wwDBEdit10Change(Sender: TObject);
begin
  inherited;
cb_validado.Checked:=false;
end;

procedure TFrmCadRequerResgCompLote.dtDataFinalChange(Sender: TObject);
begin
  inherited;
cb_validado.Checked:=false;
end;

procedure TFrmCadRequerResgCompLote.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
 // qryDetDIBANT.AsString := qryDetDIBANT.AsString;

end;

procedure TFrmCadRequerResgCompLote.bbtnConfirmarClick(Sender: TObject);
begin
If not dtmBaseDados.dbBaseDados.InTransaction Then
        dtmBaseDados.dbBaseDados.StartTransaction;

QRYAUX2.CLOSE;
QRYAUX2.SQL.CLEAR;
QRYAUX2.SQL.ADD('UPDATE BENEFBFCIARIO');
QRYAUX2.SQL.ADD('SET');
QRYAUX2.SQL.ADD('  DIBBENEFANT = '+#39+DTDATAFINAL.TEXT+#39);
QRYAUX2.SQL.ADD('WHERE');
QRYAUX2.SQL.ADD('  IDTITULAR = '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39+' AND');
QRYAUX2.SQL.ADD('  IDBENEFICIO = '+#39+'418'+#39+' AND');
QRYAUX2.SQL.ADD('  IDPESSOA = '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);
QRYAUX2.SQL.ADD('  AND  ROWNUM = 1');
   try
             qryaux2.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

 qryaux2.CLOSE;

 //Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081 - INICIO
//qryaux.close;
//qryaux.SQL.Clear;
//qryaux.SQL.Add('SELECT MAX(DC.RMREAJ) RMREAJ,'); //Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081
//qryaux.SQL.Add('       NUMPROCINSS,');
//qryaux.SQL.Add('       IDRUBRICA,');
//qryaux.SQL.Add('       MESREFERENCIA,');
//qryaux.SQL.Add('       SEQUENCIAL,');
//qryaux.SQL.Add('       MESCOBRANCA,');
//qryaux.SQL.Add('       RUBRICAINSS,');
//qryaux.SQL.Add('       IDPESSOA,');
//qryaux.SQL.Add('       IDBENEFICIO');
//qryaux.SQL.Add('  FROM DETCONCINSS DC');
//qryaux.SQL.Add(' WHERE DC.IDPESSOA = '+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
//qryaux.SQL.Add('   AND DC.NUMPROCINSS = '+#39+qryDet.fieldbyname('NUMBENEFICIO').text+#39);
//qryaux.SQL.Add('   AND DC.DTINICIOCRED =');
//qryaux.SQL.Add('       (SELECT MIN(DC1.DTINICIOCRED)');
//qryaux.SQL.Add('          FROM DETCONCINSS DC1');
//qryaux.SQL.Add('         WHERE DC.IDPESSOA = DC1.IDPESSOA');
//qryaux.SQL.Add('           AND DC.NUMPROCINSS = DC1.NUMPROCINSS)');
////Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081 - Inicio
//qryaux.sql.add(' group by  NUMPROCINSS, ' +
//               ' IDRUBRICA, MESREFERENCIA, SEQUENCIAL, MESCOBRANCA, RUBRICAINSS, '+
//               ' IDPESSOA, IDBENEFICIO ORDER BY RMREAJ    DESC ');
////Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081 - Fim
//   try
//             qryaux.open;
//          except
//             on E:EDBEngineError do
//               begin
////                    MostrarErro(E);
//                    Gravar_temp_log(param,'',string(E.message));
//                    Exit;
//               end;
//          end;
//
//
//
//
//qryaux2.close;
//qryaux2.SQL.Clear;
//qryaux2.SQL.Add('UPDATE DETCONCINSS SET RMREAJ ='+#39+wwDBEdit10.text+#39);
//qryaux2.SQL.Add('  WHERE');
//qryaux2.SQL.Add('  NUMPROCINSS ='+#39+qryaux.FieldByName('NUMPROCINSS').text+#39);
//qryaux2.SQL.Add('AND IDRUBRICA='+#39+qryaux.FieldByName('IDRUBRICA').text+#39);
//qryaux2.SQL.Add('AND MESREFERENCIA='+#39+qryaux.FieldByName('MESREFERENCIA').text+#39);
//qryaux2.SQL.Add('AND SEQUENCIAL='+#39+qryaux.FieldByName('SEQUENCIAL').text+#39);
//qryaux2.SQL.Add('AND MESCOBRANCA='+#39+qryaux.FieldByName('MESCOBRANCA').text+#39);
//qryaux2.SQL.Add('AND RMREAJ ='+#39+qryaux.FieldByName('RMREAJ').text+#39);
//qryaux2.SQL.Add('AND RUBRICAINSS='+#39+qryaux.FieldByName('RUBRICAINSS').text+#39);
//   try
//             qryaux2.ExecSQL;
//          except
//             on E:EDBEngineError do
//               begin
////                    MostrarErro(E);
//                    Gravar_temp_log(param,'',string(E.message));
//                    Exit;
//               end;
//          end;
//
// qryaux2.CLOSE;
// qryaux.CLOSE;
//Marcio Sanches Spinosa/ Douglas.Siqueira SOL 203788 Kintana 1969081 - FIM

qryaux.close;
qryaux.sql.clear;
qryaux.sql.add('update benefhabilita set rmi = '  + wwDBEdit10.text + ', ' +
               ' validado = ' + QuotedStr(pIsValidado) +
               ' where idbenefhabilita = ' + qryDet.fieldbyname('IDBENEFHABILITA').AsString);
qryaux.execsql;


QRYAUX2.CLOSE;
QRYAUX2.SQL.CLEAR;
QRYAUX2.SQL.ADD('UPDATE PESSOAFISICA');
QRYAUX2.SQL.ADD('SET');
IF DB_GRID_IRRF.ITEMINDEX = 0 THEN
   QRYAUX2.SQL.ADD('  FLGISENTOIRRF = 1')///ISENTO
ELSE
   QRYAUX2.SQL.ADD('  FLGISENTOIRRF = 0');
QRYAUX2.SQL.ADD('WHERE');
QRYAUX2.SQL.ADD('  IDPESSOA = '+#39+QRYDET.FIELDBYNAME('IDPESSOA').TEXT+#39);

   try
             qryaux2.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

 qryaux2.CLOSE;


     if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Commit;

  qry.Close;
  qry.Open;
  inherited;   
end;

procedure TFrmCadRequerResgCompLote.Button1Click(Sender: TObject);
begin
//  inherited;
buscarequerimentos('S','');
end;

procedure TFrmCadRequerResgCompLote.Button2Click(Sender: TObject);
begin
//  inherited;
buscarequerimentos('N','');
end;

procedure TFrmCadRequerResgCompLote.qryDetAfterOpen(DataSet: TDataSet);
begin
//  inherited;
lbl_listados.caption:=inttostr(qryDet.recordcount)+' Listados';
end;

procedure TFrmCadRequerResgCompLote.bbtnSelTudoClick(Sender: TObject);
begin
  inherited;
//buscarequerimentos('S');

if not qryDet.isempty then
   begin
   qryDet.First;
   while not qryDet.eof do
     begin
     qryDet.edit;
     qryDetSELECIONADO.text:='S';
     qryDet.post;
     qryDet.Next;
     end;
    end;

end;

procedure TFrmCadRequerResgCompLote.bbtnInverteClick(Sender: TObject);
begin
  inherited;
//buscarequerimentos('N');

if not qryDet.isempty then
   begin
   qryDet.First;
   while not qryDet.eof do
     begin
     qryDet.edit;
     qryDetSELECIONADO.text:='N';
     qryDet.post;
     qryDet.Next;
     end;
    end;
end;

procedure TFrmCadRequerResgCompLote.DeletarRubricaIndiv(_query: TwwQuery);
begin


   _QUERY.CLOSE;
   _QUERY.SQL.CLEAR;
   _QUERY.SQL.ADD('DELETE RUBRICAINDIV WHERE IDPESSOA='+#39+qryDet.fieldbyname('IDPESSOA').text+#39);
    try
             _query.ExecSQL;
          except
             on E:EDBEngineError do
               begin
//                    MostrarErro(E);
                    Gravar_temp_log(param,'',string(E.message));
                    Exit;
               end;
          end;

end;

procedure TFrmCadRequerResgCompLote.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 // inherited;

end;

procedure TFrmCadRequerResgCompLote.Deletar_temp_log(_query: TwwQuery);
begin

_query.Close;
_query.sql.Clear;
_QUERY.SQL.ADD('DELETE FROM CM.LOGRESGLOTE ');
_query.ExecSQL;

end;

procedure TFrmCadRequerResgCompLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
Deletar_temp_log(qry2);
end;

procedure TFrmCadRequerResgCompLote.FormActivate(Sender: TObject);
begin
  inherited;
//Deletar_temp_log(qry2);
//cb_tipo_recebedor.ItemIndex:=0;  // Andre Imakawa - SIG 63920
sbtnApagar.Enabled:=False;
end;

procedure TFrmCadRequerResgCompLote.RemoveDuplicates(
  var stringList: TStringList);
var  
  buffer: TStringList;  
  cnt: Integer;  
begin  
  stringList.Sort;  
  buffer := TStringList.Create;  
  try  
    buffer.Sorted := True;  
    buffer.Duplicates := dupIgnore;  
    buffer.BeginUpdate;  
    for cnt := 0 to stringList.Count - 1 do  
      buffer.Add(stringList[cnt]) ;  
    buffer.EndUpdate;  
    stringList.Assign(buffer) ;  
  finally  
    FreeandNil(buffer) ;  
  end;  
end;

procedure TFrmCadRequerResgCompLote.FormCreate(Sender: TObject);
begin
  inherited;
 FIdbenefh:= TStringList.Create;
 pIsValidado := 'N';
 cb_tipo_recebedor.ItemIndex:=0;                       // Andre Imakawa - SIG 63920
 mk_ini.text := FormatDateTime('dd/mm/yyyy', date);    // Andre Imakawa - SIG 63920
 mk_fin.text := FormatDateTime('dd/mm/yyyy', date);    // Andre Imakawa - SIG 63920
end;

procedure TFrmCadRequerResgCompLote.dbgrdDetTitleButtonClick(
  Sender: TObject; AFieldName: String);
var  
    campo:string;
begin
  inherited;                  

campo:=AFieldName;
//application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure

//buscarequerimentos('S',campo);
end;

procedure TFrmCadRequerResgCompLote.cb_validadoClick(Sender: TObject);
begin
  inherited;
  if (cb_validado.checked) then
    pIsValidado := 'S'
  else
    pIsValidado := 'N';
end;

function TFrmCadRequerResgCompLote.GetNumeroProcesso: string;
var
  query: TwwQuery;
begin 
query := TwwQuery.Create(Application);
query.DataBaseName := 'BaseDados';

query.close;
query.sql.clear;
query.SQL.Add('SELECT NUMEROPROCESSO');
query.SQL.Add('  FROM BENEFBFCIARIO');
query.SQL.Add(' WHERE IDPESSJUR ='+qrydet.fieldbyname('IDPESSJUR').text);
query.SQL.Add('   AND IDTITULAR ='+qrydet.fieldbyname('IDPESSOA').text);
query.SQL.Add('   AND IDPLANOORIGEM ='+qrydet.fieldbyname('IDPLANOPREV').text);
query.SQL.Add('   AND IDPLANOPREV ='+qrydet.fieldbyname('IDPLANOPREV').text);
query.SQL.Add('   AND IDPESSOA = '+qrydet.fieldbyname('IDPESSOA').text);
query.SQL.Add('   AND IDBENEFICIO = ''418''');
query.SQL.Add('   AND SEQPROPOSTA = 1');
query.open;
if not query.IsEmpty then 
  result:=query.fieldbyname('NUMEROPROCESSO').text
else
  Result:='0';
query.open;
query.Destroy;   
end;

procedure TFrmCadRequerResgCompLote.ed_minKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if not(key in ['0'..'9','.',',',#8,#13]) then

  key := #0;

if key in [',','.'] then

  key := DecimalSeparator;

end;

procedure TFrmCadRequerResgCompLote.ed_maxKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if not(key in ['0'..'9','.',',',#8,#13]) then

  key := #0;

if key in [',','.'] then

  key := DecimalSeparator;
end;

procedure TFrmCadRequerResgCompLote.ed_minExit(Sender: TObject);
begin
  inherited;
if ed_min.Text<>'' then
   begin
    if StrToFloat(ed_min.Text)=0 then
       ed_min.Text:='0,01';
   end
 else
ed_min.Text:='0,01';
end;

procedure TFrmCadRequerResgCompLote.ed_maxExit(Sender: TObject);
begin
  inherited;
if ed_max.Text<>'' then
   begin
    if StrToFloat(ed_max.Text)=0 then
       ed_max.Text:='0,01';
   end
 else
ed_max.Text:='0,01';
end;

//Início - William Santana - SIG 38101
procedure TFrmCadRequerResgCompLote.mk_dataExit(Sender: TObject);
var d_Data : TDateTime;
begin
  inherited;
  if (Sender as TMaskEdit).Text <> '  /  /    ' then
  begin
    try
       d_Data := StrToDateTime( (Sender as TMaskEdit).Text );
      (Sender as TMaskEdit).Text := FormatDateTime('dd/mm/yyyy',d_Data);
    except
      MsgDlg('Data Inválida','Data Inválida',mtWarning,[mbOk],0);
      //(Sender as TMaskEdit).Text := '  /  /    ';
      (Sender as TMaskEdit).SetFocus;
    end;
  end;
end;
//Término - William Santana - SIG 38101

end.

