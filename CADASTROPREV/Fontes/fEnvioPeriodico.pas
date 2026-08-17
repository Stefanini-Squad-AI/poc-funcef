unit fEnvioPeriodico;

//Alterações
//--------------------------------------------------------------------------------------------------
//SIG         : 33967
//Responsável : William Santana
//Data        : 05/12/2016
//Descrição   : ajustes na consutas para buscar endereço da tabela CIDADES (*somente DFM*)
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 160640 KINTANA 1357740
//Responsável : André Felipe
//Data        : 18/06/2011
//Descrição   : retrabalho Criação do dos Campos Número do Último Sequencial, Última Inserção, INSERT na LOGENVPERIODICO
//--------------------------------------------------------------------------------------------------

// Autor(a)    : Ricardo de Freitas Araújo
// Data        : 06/04/2011
// Pendência   : SOL 148338 Kintana 1050257
// Rotina      : Atualizar_Endereco()
// Alteração   : Ao atualizar um endereço de Informações Incositentes deirtamente
//               no grid, deverá também atualizar no Banco de Dados. - POR ENQUANTO DESATIVADA
//Rotina       : Formulário
//Alteração    : Alterado o dataset de consulta de inconsistentes de um Tquery para
//               tClientDataset.
//Rotina       : BtnImprimirClick
//Alteração    : Ao imprimir gerar relatórios de informações consistentes e incossitentes
//Rotina       : QRYInconc.SQL.Text
//Alteração    : Adicionado campo "IDPESSOA".
//Rotina       : pr_prepara
//Alteração    : No botão "OK", não deverá atualizar dados no bando de dados.
//Rotina       : Sincronizar_Endereco
//Alteração    : Verifica nas informações incosistentes se há informações consistentes e
//               insere no dataset de consistentes correpondente.(Transfere de Incosistente
//               para Consistente se todos os campos estão preenchidos)
//Rotina       : Sincronizar_Endereco, Consulta de Incosistente
//Alteração    : Retirada a crítica de bairro
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Santana
// Data        : 10/09/2010
// Pendência   : SOL  Kintana
// Alteração   : Criação da funcionalidade "Envio de Periódico"
//------------------------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ComCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  Grids,zLib, Wwdbigrd, Wwdbgrid,USistema,Wwquery, Db, DBTables, Wwdatsrc,
  ZipDir, ZipMstr, Wwkeycb, ppParameter, ppBands, ppClass, ppMemo,
  ppStrtch, ppRegion, jpeg, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, ShellApi, QExport3, QExport3PDF, DBGrids, ppDB,
  ppDBPipe, wwstorep, DBCtrls, DBClient, Provider, wwdbdatetimepicker,
  ppModule, raCodMod;

type
  TfrmEnvioPeriodico = class(TfrmOkCancelar)
    Panel1: TPanel;
    RGFormato: TRadioGroup;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEAltura: TwwDBEdit;
    DBELargura: TwwDBEdit;
    DBEComprimento: TwwDBEdit;
    DBEPeso: TwwDBEdit;
    Label6: TLabel;
    DBCOpcaoVis: TwwDBComboBox;
    btnSelecionar: TBitBtn;
    ds: TwwDataSource;
    qryDS: TwwQuery;
    Label7: TLabel;
    DBEEdicao: TwwDBEdit;
    Zip1: TZipMaster;
    updds: TUpdateSQL;
    QRYTMP: TwwQuery;
    UPDTMP: TUpdateSQL;
    QRYTMPUF: TStringField;
    QRYTMPQTD: TFloatField;
    GroupBox1: TGroupBox;
    ChkAtivo: TCheckBox;
    ChkAssis: TCheckBox;
    ChkCed: TCheckBox;
    ChkFacul: TCheckBox;
    ChkLicenc: TCheckBox;
    ChkNaoAssis: TCheckBox;
    Panel2: TPanel;
    wwIncrementalSearch1: TwwIncrementalSearch;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    GroupBox3: TGroupBox;
    DSInconc: TwwDataSource;
    UPDInconc: TUpdateSQL;
    qrydsaux: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    FloatField1: TFloatField;
    QRYInconcaux: TwwQuery;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    FloatField2: TFloatField;
    StringField30: TStringField;
    FloatField3: TFloatField;
    StringField32: TStringField;
    FloatField4: TFloatField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    rptDemonstrativo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppShape51: TppShape;
    ppShape54: TppShape;
    ppShape55: TppShape;
    ppShape56: TppShape;
    ppShape57: TppShape;
    ppLabel10: TppLabel;
    ppLabel15: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppShape36: TppShape;
    ppShape37: TppShape;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel56: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape4: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppParameterList1: TppParameterList;
    ppDemonstrativo: TppDBPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape3: TppShape;
    ppShape5: TppShape;
    ppLabel1: TppLabel;
    ppDBText6: TppDBText;
    BtnImprimir: TBitBtn;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    wwDBGrid2: TwwDBGrid;
    qryAux: TwwQuery;
    StringField31: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    StringField45: TStringField;
    StringField46: TStringField;
    StringField47: TStringField;
    StringField48: TStringField;
    StringField49: TStringField;
    StringField50: TStringField;
    StringField51: TStringField;
    FloatField5: TFloatField;
    rptDemonstrativo_Consistente: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppImage2: TppImage;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppShape15: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppShape25: TppShape;
    ppDBText16: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppParameterList2: TppParameterList;
    ppDemonstrativo_Consistente: TppDBPipeline;
    pnlAguarde: TPanel;
    lblTot_consistente: TLabel;
    lblTotal_incosistente: TLabel;
    Sp_Atualiza_Endereco: TStoredProc;
	ChkApose: TCheckBox;
    ChkPensi: TCheckBox;

    DBELote: TwwDBEdit;
    DBESeqCorreio: TwwDBEdit;
    QRYInconc: TwwQuery;
    StringField52: TStringField;
    StringField53: TStringField;
    StringField54: TStringField;
    StringField55: TStringField;
    StringField56: TStringField;
    StringField57: TStringField;
    StringField58: TStringField;
    StringField59: TStringField;
    StringField60: TStringField;
    StringField61: TStringField;
    StringField62: TStringField;
    StringField63: TStringField;
    FloatField6: TFloatField;
    StringField64: TStringField;
    FloatField7: TFloatField;
    StringField65: TStringField;
    FloatField8: TFloatField;
    StringField66: TStringField;
    StringField67: TStringField;
    StringField68: TStringField;
    DspInconc: TDataSetProvider;
    cdsIncons: TClientDataSet;
    pnl1: TPanel;
    btnAtualiza: TBitBtn;
    strngfldDSMATRICULA: TStringField;
    strngfldDSNOME: TStringField;
    strngfldDSLOGRADOURO: TStringField;
    strngfldDSNUMERO: TStringField;
    strngfldDSCOMERCIAL: TStringField;
    strngfldDSCOMPLEMENTO: TStringField;
    strngfldDSBAIRRO: TStringField;
    strngfldDSCEP: TStringField;
    strngfldDSCIDADE: TStringField;
    strngfldDSUF: TStringField;
    strngfldDSNUMDOCUMENTO: TStringField;
    qryDSIDPESSOA: TFloatField;
    strngfldDSVALOR: TStringField;
    strngfldDSNOME_LOTACAO: TStringField;
    strngfldDSEND_LOTACAO: TStringField;
    strngfldDSCIDADE_LOTACAO: TStringField;
    strngfldDSUF_LOTACAO: TStringField;
    qryDSCOD_LOTACAO: TStringField;
    strngfldInconsMATRICULA: TStringField;
    strngfldInconsNOME: TStringField;
    strngfldInconsLOGRADOURO: TStringField;
    strngfldInconsBAIRRO: TStringField;
    strngfldInconsCIDADE: TStringField;
    strngfldInconsCEP: TStringField;
    strngfldInconsUF: TStringField;
    strngfldInconsNOME_LOTACAO: TStringField;
    strngfldInconsEND_LOTACAO: TStringField;
    strngfldInconsCIDADE_LOTACAO: TStringField;
    strngfldInconsUF_LOTACAO: TStringField;
    strngfldInconsOBS: TStringField;
    cdsInconsATUALIZAR: TFloatField;
    strngfldInconsNUMDOCUMENTO: TStringField;
    cdsInconsIDPESSOA: TFloatField;
    strngfldInconsCOD_LOTACAO: TStringField;
    cdsInconsIDENDERECO: TFloatField;
    strngfldInconsNUMERO: TStringField;
    strngfldInconsCOMERCIAL: TStringField;
    strngfldInconsCOMPLEMENTO: TStringField;
lbl1: TLabel;
    DBEDUltimoSequencial: TwwDBEdit;
    lbl2: TLabel;
    DBEDUltimoInsercao: TwwDBEdit;
    medtDataInsercao: TwwDBDateTimePicker;
    raCodeModule1: TraCodeModule;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBCSitPartChange(Sender: TObject);
    procedure DBCOpcaoVisChange(Sender: TObject);
    procedure RGFormatoClick(Sender: TObject);
    procedure DBEAlturaChange(Sender: TObject);
    procedure DBELarguraChange(Sender: TObject);
    procedure DBEComprimentoChange(Sender: TObject);
    procedure DBEPesoChange(Sender: TObject);
    procedure DBEEdicaoChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryDSBeforeEdit(DataSet: TDataSet);
    procedure qryDSBeforePost(DataSet: TDataSet);
    procedure qryDSNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ChkAtivoClick(Sender: TObject);
    procedure ChkAssisClick(Sender: TObject);
    procedure ChkCedClick(Sender: TObject);
    procedure ChkFaculClick(Sender: TObject);
    procedure ChkLicencClick(Sender: TObject);
    procedure ChkNaoAssisClick(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure wwDBGrid2TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure BtnImprimirClick(Sender: TObject);
    procedure wwDBGrid2DblClick(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
    procedure ChkAposeClick(Sender: TObject);
    procedure ChkPensiClick(Sender: TObject);
  private
    { Private declarations }
    ordem,tipo_ordem,ordeminc,tipo_ordeminc : string;

    function fn_nomearq   : string;
    function fn_DataServidor(Formatacao : string;dias : integer) : string;
    function fn_HeaderArq : string;
    function fn_GerarSeq : integer;
    Function pr_Validacampos(documento : string) : string;

    procedure pr_MostrarLote_e_SeqCorreio;
    procedure pr_MostrarUltimaSequencia_e_UltimaInsercao;
    procedure pr_AtualizaSeq(sequencia : integer);
    procedure pr_liberarBTNconfirmar;
    procedure pr_tipo2;
    procedure pr_tipo3;
    procedure pr_tipo6;
    procedure pr_prepara;
    procedure pr_Footer;
    procedure pr_zip;

  public
    { Public declarations }
    //Ricardo SOL 148338 Kintana 1050257
    function Atualizar_Endereco():Boolean;
    Function Sincronizar_Endereco():Boolean; 


  end;

var
  frmEnvioPeriodico: TfrmEnvioPeriodico;
  Caminho : TextFile;
  tTexto  : TStringList;
  QRY     : TwwQuery;
  sLinha,sNomeArquivo,sNomeArqNew,vSql: String;
  sTipo,sOpcao,dDataServ,sValor       : string;
  iSequencia,nCont : integer;


implementation

uses UModulo,fAguarde,UFuncoesUteis,UDataBase,UDiasUteis,
  FCadEndereco_EnvioPeriodico;
{$R *.DFM}
function TfrmEnvioPeriodico.pr_Validacampos(documento : string) : string;
var sMsg : string;
begin

  sMsg := '';

  if trim(qryDS.fieldbyname('uf').AsString) = '' then
     sMsg := sMsg +', UF';

  if trim(qryDS.fieldbyname('CIDADE').AsString) = '' then
     sMsg := sMsg +', Cidade';

  if trim(qryDS.fieldbyname('LOGRADOURO').AsString) = '' then
     sMsg := sMsg +', Logradouro';

  if trim(qryDS.fieldbyname('CEP').AsString) = '' then
     sMsg := sMsg +', CEP';



  IF trim(sMsg) <> '' then
  begin

    sMsg :='Valores a serem alterados '+#13+ copy(sMsg,3,length(sMsg));
    result := sMsg;
  end
  else result := ' ';

end;

procedure TfrmEnvioPeriodico.pr_zip;
begin
  try
    sNomeArqNew := (copy(sNomeArquivo,1,length(sNomeArquivo)-4))+'.zip';
    Zip1.ZipFileName := sNomeArqNew;
    Zip1.FSpecArgs.Add(sNomeArquivo);
    Zip1.Add();
    DeleteFile(sNomeArquivo);
  except
    MessageDlg('Erro ao converter arquivo para .ZIP.', mtError, [mbOK], 0);
  end;
end;


function TfrmEnvioPeriodico.fn_GerarSeq : integer;
var sql : TwwQuery;
begin
  try
    qry := TwwQuery.Create(Nil);
    qry.DatabaseName := 'BASEDADOS';
    qry.sql.Text := ' select (nvl(max(SEQENVIOPERIODICO),0) + 1) as SEQ' +#13+
                    ' from LOGENVIOPERIODICO '                           +#13+
                    ' where to_char(DATAGERACAO,''RRRR'') = (select to_char(sysdate,''RRRR'') from dual)';
    qry.open;
    result := qry.fieldbyname('SEQ').asinteger;
  finally
    qry.close;
    qry.free;
  end;
end;


procedure TfrmEnvioPeriodico.pr_MostrarLote_e_SeqCorreio;
var sql : TwwQuery;
begin
  try
    qry := TwwQuery.Create(Nil);
    qry.DatabaseName := 'BASEDADOS';
    qry.sql.Text := 'SELECT * from LOGENVIOPERIODICO WHERE SEQENVIOPERIODICO = (SELECT MAX(SEQENVIOPERIODICO) FROM LOGENVIOPERIODICO)';
    qry.open;

    DBEEdicao.Text       := qry.FieldByName('EDICAO').AsString;
    DBELote.Text         := qry.FieldByName('numlote').AsString;
    DBESeqCorreio.Text   := qry.FieldByName('seqcorreios').AsString;
    medtDataInsercao.Date := StrToDate(FormatDateTime('dd/mm/yyyy',qry.FieldByName('DATAGERACAO').AsDateTime));//André Oliveira SOL 160640 KINTANA 1357740

    qry.Close;

  finally
    qry.close;
    qry.free;
  end;
end;


procedure TfrmEnvioPeriodico.pr_AtualizaSeq(sequencia : integer);
var sql : TwwQuery;
begin
  try
    qry := TwwQuery.Create(Nil);
    qry.DatabaseName := 'BASEDADOS';

    qry.sql.Text := 'insert into LOGENVIOPERIODICO( SEQENVIOPERIODICO, '        +#13+
                                                  ' DATAGERACAO, '              +#13+
                                                  ' NOMEARQUIVO, '              +#13+
                                                  ' TRGUSERINCLUSAO, '          +#13+
                                                  ' TRGDTINCLUSAO , '           +#13+
                                                  ' numlote , '              +#13+
                                                  ' seqcorreios , '              +#13+
                                                  ' EDICAO )'                   +#13+
                                          'values('+inttostr(sequencia)+','     +#13+
                                                  'to_date('+#39+DateToStr(medtDataInsercao.date)+#39+',''dd/mm/rrrr hh24:mi:ss''),'+#13+
                                                   #39+ (sNomeArqNew)    +#39+',' +#13+
                                                   'user ,'                     +#13+
                                                   'sysdate ,'                  +#13+
                                                   QuotedStr(DBELote.Text) + ',' +#13+
                                                   QuotedStr(DBESeqCorreio.Text) + ',' +#13+
                                                   #39+ DBEEdicao.Text +#39+')';


    qry.ExecSQL;
  finally
    qry.free;
  end;
end;

function TfrmEnvioPeriodico.fn_nomearq : string;
var
 sAux : string;
 sEdicao :string;//André Oliveira SOL 160640 KINTANA 1357740
 i : Integer;//André Oliveira SOL 160640 KINTANA 1357740
begin
  Try
    //inicio - André Oliveira SOL 160640 KINTANA 1357740
    sEdicao := Trim(DBEEdicao.Text);
    for i:=0 to 9 do
    begin
         if(i >= Length(sEdicao))then
              sEdicao := '0'+sEdicao;
    end;
    //fim - André Oliveira SOL 160640 KINTANA 1357740
    dDataServ := fn_DataServidor('dd/mm/rrrr hh24:mi:ss',0);
    sAux := '\PTG_0000002194_FUN_'+sEdicao+'_'+FormatDateTime('YYYYMMDD',StrToDateTime(dDataServ)); //André Oliveira SOL 160640 KINTANA 1357740
    Result := sistema.RetornaCaminhoArquivos(sistema.IdEmpresa)+sAux+'.PER';
  except
    MessageDlg('Erro ao gerar caminho do arquivo',mterror,[mbok],0);
    abort;
  End;
end;

function TfrmEnvioPeriodico.fn_DataServidor(Formatacao : string;dias : integer) : string;
begin
  Try
    qry := TwwQuery.Create(Nil);
    qry.DatabaseName := 'BASEDADOS';
    qry.sql.Text := 'select to_char(sysdate + '+IntToStr(dias)+','+#39+Formatacao+#39+') data from dual';
    qry.Open;
    Result := qry.fieldbyname('data').Asstring;
  Finally
    qry.Free;
  End;
end;

function TfrmEnvioPeriodico.fn_HeaderArq : string;
var sHeader : string;
    dDataPrev : tdatetime;
begin
   try
     iSequencia := fn_GerarSeq;
     sHeader := '';
{1}  sHeader := '1';
{2}  sHeader := sHeader + 'P';
{3}  sHeader := sHeader + CompletaString('2194','0',10,false);
{4}  sHeader := sHeader + CompletaString('10025936','0',10,false);
//{5}  sHeader := sHeader + CompletaString('0','0',10,false);
{5}  sHeader := sHeader + CompletaString(IntToStr(nCont),'0',10,false);  //Andre OlvieiraSOL 160640 KINTANA 1357740
{6}  sHeader := sHeader + CompletaString('60057165','0',10,false);

// SOL 160640 - Kintana 13357740 - DENNIS CARLOS
//{7}  sHeader := sHeader + CompletaString(IntToStr(iSequencia),'0',6,false);
{7}  sHeader := sHeader + CompletaString(DBELote.Text,'0',6,false);

{8}  sHeader := sHeader + PreparaStr('72900954',12);
{9}  sHeader := sHeader + CompletaString('9912249780','0',12,false);
{10} sHeader := sHeader + '00031';
{11} sHeader := sHeader + '31100';
{12} sHeader := sHeader + FormatDateTime('dd-mm-YYYY hh:nn:ss',strtodatetime(dDataServ));

     if StrToInt(FormatDateTime('HH',StrToDateTime(dDataServ))) <= 17 then
        dDataPrev := strtodatetime(dDataServ) + 3
     else
        dDataPrev := strtodatetime(dDataServ) + 4;

     if not DiasUteis.DiaUtil(Sistema.IdEmpresa,dDataPrev, false,false,false) then
        dDataPrev := DiasUteis.PrimeiroDiaUtilPosterior(Sistema.IdEmpresa, dDataPrev, false,false,false);

{13} sHeader := sHeader + FormatDateTime('dd-mm-YYYY hh:NN',dDataPrev);
{14} sHeader := sHeader + '01.00.21';
     result  := sHeader;
  except
    If fileexists(sNomeArquivo) then
    begin
      CloseFile(Caminho);
      DeleteFile(sNomeArquivo);
    end;
    frmAguarde.Apaga;
    MessageDlg('Erro ao gerar arquivo.', mtError, [mbOK], 0);
    abort;
  end;
end;

procedure TfrmEnvioPeriodico.pr_tipo2 ;
var sTipo2 : string;
begin
  try

    sTipo2 := '';

    QRYTMP.First;

    while not QRYTMP.Eof do
    begin
    {1}sTipo2 := '2';
    {2}sTipo2 := sTipo2 + PreparaStr(QRYTMPUF.AsString,2);
    {3}sTipo2 := sTipo2 + CompletaString(QRYTMPQTD.AsString,'0',10,false);
       WriteLn(Caminho,sTipo2);
       QRYTMP.Next;
    end;
    QRYTMP.CLOSE;
  except
    if QRYTMP.active then
       QRYTMP.CLOSE;

    If fileexists(sNomeArquivo) then
    begin
       CloseFile(Caminho);
       DeleteFile(sNomeArquivo);
    end;
    frmAguarde.Apaga;
    MessageDlg('Erro ao gerar arquivo.', mtError, [mbOK], 0);
    abort;
  end;
end;

procedure TfrmEnvioPeriodico.pr_tipo3;
var sTipo3,sAux: string;
begin
  try
    sAux   := '';
    sTipo3 := '';
{ 1}sTipo3 := '3';
{ 2}sTipo3 := sTipo3 +  CompletaString('17056','0',10 ,false);
{ 3}sTipo3 := sTipo3 + 'FUN  ';
{ 4}sTipo3 := sTipo3 +  CompletaString(DBEEdicao.text,'0',10 ,false);
{ 5}sTipo3 := sTipo3 + '0000';

    sAux   := StringReplace(DBEPeso.Text,',','.',[]);
{ 6}sTipo3 := sTipo3 +  CompletaString(sAux,'0',8 ,false);

{ 7}sTipo3 := sTipo3 + '1';

    sAux   := StringReplace(DBELargura.Text,',','.',[]);
{ 8}sTipo3 := sTipo3 + CompletaString(sAux,'0',8 ,false);

    sAux   := StringReplace(DBEAltura.Text,',','.',[]);
{ 9}sTipo3 := sTipo3 + CompletaString(sAux,'0',8 ,false);

    sAux   := StringReplace(DBEComprimento.Text,',','.',[]);
{10}sTipo3 := sTipo3 + CompletaString(sAux,'0',8 ,false);

{11}sTipo3 := sTipo3 + '5';
{12}sTipo3 := sTipo3 + '0000';
{13}sTipo3 := sTipo3 +  CompletaString(IntToStr(qryDS.recordcount),'0',10 ,false);
{14}sTipo3 := sTipo3 +  CompletaString('0','0',10 ,false);
{15}sTipo3 := sTipo3 + PreparaStr('',12);
    WriteLn(Caminho,sTipo3);
  except
    If fileexists(sNomeArquivo) then
    begin
      CloseFile(Caminho);
      DeleteFile(sNomeArquivo);
    end;
    frmAguarde.Apaga;
    MessageDlg('Erro ao gerar arquivo.', mtError, [mbOK], 0);
    abort;
  end;

end;

procedure TfrmEnvioPeriodico.pr_prepara;
var sTipo6 : string;
    qryaux    :TwwQuery;
begin

  try

     qryaux := TwwQuery.Create(Nil);
     qryaux.DatabaseName := 'BASEDADOS';

     //QRYInconc.first;
     cdsIncons.first;
     while not cdsIncons.eof do
     begin
        IF (TRIM(cdsIncons.fieldbyname('LOGRADOURO').AsString) <> '') AND  (TRIM(cdsIncons.fieldbyname('CIDADE').AsString) <> '') AND
           //Ricardo SOL 148338 Kintana 1050257 - comentado
           {(TRIM(cdsIncons.fieldbyname('BAIRRO').AsString) <> '') AND}
           (TRIM(cdsIncons.fieldbyname('CEP').AsString) <> '')  AND
           (TRIM(cdsIncons.fieldbyname('UF').AsString) <> '')     THEN
        BEGIN
          {try
             //Ricardo SOL 148338 Kintana 1050257 - comentado
             //Segundo analista da GETIF (Marimar), a área responsável não permite que
             //esta interface altere registros.
             StartTransacao;
             qryaux.sql.Text := 'update cm.ENDPESS' +#13+
                                'set logradouro = '+#39+cdsIncons.fieldbyname('LOGRADOURO').AsString +#39+#13+
                                '  , cidade     = '+#39+cdsIncons.fieldbyname('CIDADE').AsString     +#39+#13+
                                '  , bairro     = '+#39+cdsIncons.fieldbyname('BAIRRO').AsString     +#39+#13+
                                '  , cep        = '+#39+cdsIncons.fieldbyname('CEP').AsString        +#39+#13+
                                '  , CODESTADO  = '+#39+cdsIncons.fieldbyname('UF').AsString         +#39+#13+
                                'where IdENDERECO = '+ cdsIncons.fieldbyname('IDENDERECO').AsString ;
             qryaux.ExecSQL;
          finally
             CommitTransacao;
          end;}

          cdsIncons.Edit;
          cdsIncons.FieldByName('ATUALIZAR').Value := 0;
          cdsIncons.Post;
        END;
        cdsIncons.Next
     end;

    //Consistentes
    qryDS.DisableControls;
    qryDS.First;
    nCont := 0;
    tTexto := TStringList.Create;

    QRYTMP.OPEN;

    if not QRYTMP.IsEmpty then
      QRYTMP.Delete;

    while not qryDS.eof do
    begin


      if qryDS.fieldbyname('VALOR').AsString = 'S' then
      begin
          inc(nCont);
          sTipo6 := '';
      {1 }sTipo6 := '6';
      {2 }sTipo6 := sTipo6 + CompletaString(IntToStr(nCont),'0',10 ,false);
      {3 }sTipo6 := sTipo6 + CompletaString('17056','0',10 ,false);
      {4 }sTipo6 := sTipo6 + CompletaString(DBEEdicao.text,'0',10 ,false);
      {5 }sTipo6 := sTipo6 + '0000';
      {6 }sTipo6 := sTipo6 + PreparaStr('',20);
      {7 }sTipo6 := sTipo6 + PreparaStr('',20);
      {8 }sTipo6 := sTipo6 + PreparaStr('',20);


      {9 }sTipo6 := sTipo6 + copy(CompletaString(qryDS.fieldbyname('MATRICULA').AsString,'0',20,false),1,20);
      {10}sTipo6 := sTipo6 + copy(CompletaString(qryDS.fieldbyname('MATRICULA').AsString,'0',20,false),1,20);

      {11}sTipo6 := sTipo6 + copy(PreparaStr(qryDS.fieldbyname('NOME').AsString,60),1,60);
      {12}sTipo6 := sTipo6 + PreparaStr('',60);
      {13}sTipo6 := sTipo6 + copy(PreparaStr(qryDS.fieldbyname('LOGRADOURO').AsString,60),1,60);
      {14}sTipo6 := sTipo6 + copy(PreparaStr(' ',15),1,15);
      //{15}sTipo6 := sTipo6 + copy(PreparaStr(qryDS.fieldbyname('COMPLEMENTO').AsString,40),1,40);
      if(qryDS.fieldbyname('COMPLEMENTO').AsString <>'')then   //Andre OlvieiraSOL 160640 KINTANA 1357740
      {15}sTipo6 := sTipo6 + copy(PreparaStr(qryDS.fieldbyname('COMPLEMENTO').AsString,40),1,40)
      else
      {15}sTipo6 := sTipo6 + copy(PreparaStr('.',40),1,40);   //Andre OlvieiraSOL 160640 KINTANA 1357740

      {16}sTipo6 := sTipo6 + copy(PreparaStr(qryDS.fieldbyname('NUMERO').AsString,10),1,10);
      {17}sTipo6 := sTipo6 + copy(PreparaStr(qryDS.fieldbyname('BAIRRO').AsString,60),1,60);
      {18}sTipo6 := sTipo6 + PreparaStr(qryDS.fieldbyname('CEP').AsString,8);
      {19}sTipo6 := sTipo6 + copy(PreparaStr(qryDS.fieldbyname('CIDADE').AsString,70),1,70);
      {20}sTipo6 := sTipo6 + PreparaStr(qryDS.fieldbyname('uf').AsString,2);
      {21}sTipo6 := sTipo6 + PreparaStr('',40);
      {22}sTipo6 := sTipo6 + qryDS.fieldbyname('COMERCIAL').AsString;
      {23}sTipo6 := sTipo6 + '00000';
      {24}sTipo6 := sTipo6 + 'N';
      {25}sTipo6 := sTipo6 + '00';
      {26}sTipo6 := sTipo6 + 'N';

      {27}sTipo6 := sTipo6 + 'N';

      {28}sTipo6 := sTipo6 + PreparaStr('',60);

      {29}sTipo6 := sTipo6 + PreparaStr('',4);
      {30}sTipo6 := sTipo6 + PreparaStr('',4);
      {31}sTipo6 := sTipo6 + PreparaStr('',12);

      {32}sTipo6 := sTipo6 + '0000001';
      {33}sTipo6 := sTipo6 + ' ';

          IF NOT QRYTMP.Locate('UF',qryDS.fieldbyname('UF').AsString,[]) THEN
          BEGIN
             QRYTMP.Insert;
             QRYTMP.FieldByName('UF').AsString   := qryDS.fieldbyname('UF').AsString;
             QRYTMP.FieldByName('QTD').AsInteger := 1;
             QRYTMP.Post;
          end
          ELSE
          BEGIN
             QRYTMP.Edit;
             QRYTMP.FieldByName('QTD').AsInteger := QRYTMP.FieldByName('QTD').AsInteger + 1;
             QRYTMP.POST;
          END;
          tTexto.Add(sTipo6);
      end;
      qryDS.Next;
    end;

    qryaux.free;

    qryDS.EnableControls;
  except
    If fileexists(sNomeArquivo) then
    begin
      CloseFile(Caminho);
      DeleteFile(sNomeArquivo);
    end;
    frmAguarde.Apaga;
    qryDS.EnableControls;
    MessageDlg('Erro ao gerar arquivo.', mtError, [mbOK], 0);
    abort;
  end;


  if nCont = 0 then
  begin
     If fileexists(sNomeArquivo) then
     begin
       CloseFile(Caminho);
       DeleteFile(sNomeArquivo);
     end;
     frmAguarde.Apaga;
     MessageDlg('Não foi encontrado registro para gerar o arquivo.', mtWarning, [mbOK], 0);
     btnSelecionar.Click;
     abort;
  end;
end;

procedure TfrmEnvioPeriodico.pr_tipo6;
var iCont : integer;
begin
  try
    for iCont := 0 to tTexto.count -1 do
      WriteLn(Caminho,tTexto[iCont]);
  except
    If fileexists(sNomeArquivo) then
    begin
      CloseFile(Caminho);
      DeleteFile(sNomeArquivo);
    end;
    frmAguarde.Apaga;
    MessageDlg('Erro ao gerar arquivo.', mtError, [mbOK], 0);
    abort;
  end;
end;

procedure TfrmEnvioPeriodico.pr_Footer;
var sFooter,sAux : string;
    rPeso_Total,rValor_Aux  : real;

begin
  try
    sFooter := '';
{1} sFooter := '7';
{2} sFooter := sFooter + CompletaString(IntToStr(nCont),'0',10 ,false);
    rValor_Aux := StrToFloat(StringReplace(DBEPeso.Text,'.',',',[]));
    rPeso_Total := round( rValor_Aux * qryDS.recordcount);
    sAux := StringReplace(floattostr(rPeso_Total),',','.',[]);
{3} sFooter := sFooter + CompletaString(sAux,'0',8 ,false);
{4} sFooter := sFooter + '2';
    WriteLn(Caminho,sFooter);
  except
    If fileexists(sNomeArquivo) then
    begin
       CloseFile(Caminho);
       DeleteFile(sNomeArquivo);
    end;
    frmAguarde.Apaga;
    MessageDlg('Erro ao gerar arquivo.', mtError, [mbOK], 0);
    abort;
  end;
end;


procedure TfrmEnvioPeriodico.pr_liberarBTNconfirmar;
begin

  if (trim(DBEAltura.Text)   <> '') and (trim(DBEComprimento.text) <> '') and
     (trim(DBELargura.text)  <> '') and (trim(DBEPeso.text)        <> '') and
     (RGFormato.ItemIndex     > -1) and (trim(DBCOpcaoVis.Text) <> '')    and
     (trim(DBEEdicao.Text)   <> '') and (not qryDS.IsEmpty)               and
//     (ChkAtivo.Checked or ChkAssis.Checked or ChkCed.Checked or ChkFacul.Checked or ChkLicenc.Checked or ChkNaoAssis.Checked)  then
     (ChkAtivo.Checked or ChkApose.Checked or ChkPensi.Checked or ChkCed.Checked or ChkFacul.Checked or ChkLicenc.Checked or ChkNaoAssis.Checked)  then
      bbtnConfirmar.enabled := true
  else
      bbtnConfirmar.enabled := false;

//  if (ChkAtivo.Checked or ChkAssis.Checked or ChkCed.Checked or ChkFacul.Checked or ChkLicenc.Checked or ChkNaoAssis.Checked) and
  if (ChkAtivo.Checked or ChkApose.Checked or ChkPensi.Checked or ChkCed.Checked or ChkFacul.Checked or ChkLicenc.Checked or ChkNaoAssis.Checked) and
     (trim(DBCOpcaoVis.Text) <> '') then
     btnSelecionar.Enabled := true
  else
     btnSelecionar.Enabled := false;

  //Ricardo SOL 148338 Kintana 1050257 - comentado
  {if not QRYInconc.Eof then}
  if not (cdsIncons.Eof) or not (qryDS.Eof) then
     BtnImprimir.Enabled := true
  else
     BtnImprimir.Enabled := false;

  btnAtualiza.Enabled := ((cdsIncons.Active) and (cdsIncons.RecordCount > 0))

  //Ricardo SOL 148338 Kintana 1050257
end;

procedure TfrmEnvioPeriodico.bbtnConfirmarClick(Sender: TObject);

  function ConsisteCampo(nome,arg:String;tam:Integer):Boolean;
  begin
    Result := False;
    try
      if arg = EmptyStr then begin
        ShowMessage('Campo <' + nome + '> de preenchimento OBRIGATÓRIO');
        Exit;
      end;

      StrToInt(arg);

      if tam > 0 then begin
        if length(arg) < tam then begin
          ShowMessage('Tamanho do campo <' + nome + '> INSUFICIENTE');
          Exit;
        end;
      end;

      Result := True;
    except
      ShowMessage('Campo <' + nome + '> de preenchimento NÚMERICO');
    end;
  end;
var
  QryAux : TwwQuery;
begin
  inherited;
  if not ConsisteCampo('Número do Lote',DBELote.Text,DBELote.MaxLength) then begin
    DBELote.SetFocus;
    exit;
  end;

  if not ConsisteCampo('Sequencial Correios',DBESeqCorreio.Text,DBESeqCorreio.MaxLength) then begin
    DBESeqCorreio.SetFocus;
    exit;
  end;
 //inicio -  André Oliveira SOL 160640 KINTANA 1357740
 try
    StrToDate(medtDataInsercao.Text);
 except
    on EConvertError do
    begin
         ShowMessage ('Campo <Data de Inserção> de preenchimento NÚMERICO');
         Exit;
    end;
 end;
 //fim -  André Oliveira SOL 160640 KINTANA 1357740
  sNomeArquivo := fn_nomearq;

  // SOL 160640 - Kintana 13357740 - DENNIS CARLOS - performance
  cdsIncons.DisableControls;

  frmAguarde.Mostra('Gerando arquivo - ' + sNomeArquivo);
  If fileexists(sNomeArquivo) then
     DeleteFile(sNomeArquivo);

  AssignFile(Caminho,sNomeArquivo);
  ReWrite(Caminho);

  pr_prepara;

  sLinha := fn_HeaderArq;
  WriteLn(Caminho,sLinha);

  pr_tipo2;
  pr_tipo3;
  pr_tipo6;
  pr_Footer;

  CloseFile(Caminho);

  if RGFormato.ItemIndex = 0 then
     pr_zip
  else
     sNomeArqNew := sNomeArquivo;
  pr_AtualizaSeq(iSequencia);
  frmAguarde.Apaga;

  cdsIncons.EnableControls;
  Application.ProcessMessages;

  pr_MostrarUltimaSequencia_e_UltimaInsercao; //André Oliveira SOL 160640 KINTANA 1357740

  MessageDlg('Arquivo gerado em ' + sistema.RetornaCaminhoArquivos(sistema.IdEmpresa),mtInformation,[mbOK,mbhelp],0);
  MessageDlg('Arquivo gerado com sucesso.', mtInformation, [mbOK,mbhelp],0);

  btnSelecionar.Click;
end;

procedure TfrmEnvioPeriodico.btnSelecionarClick(Sender: TObject);
begin
  inherited;

  TRY

     pr_MostrarLote_e_SeqCorreio;
     pr_MostrarUltimaSequencia_e_UltimaInsercao;//André Oliveira SOL 160640 KINTANA 1357740

     qryDS.CLOSE;
     cdsIncons.CLOSE;

     //Ricardo SOL 148338 Kintana 1050257
     pnlAguarde.Visible := True;
     Application.ProcessMessages;
     //Ricardo SOL 148338 Kintana 1050257 - Fim

     if ordem = '' then
        ordem := 'matricula';
     if tipo_ordem = '' then
        tipo_ordem := 'asc';

     if ordeminc = '' then
        ordeminc := 'matricula';
     if tipo_ordeminc = '' then
        tipo_ordeminc := 'asc';


     QRYInconc.SQL.Text := QRYInconcaux.SQL.Text + ' order by ' + ordemInc +' '+ tipo_ordeminc;
     qryDS.SQL.Text := qrydsaux.SQL.Text + ' order by ' + ordem +' '+ tipo_ordem;

     wwDBgrid1.DataSource.DataSet.FieldByName('Numdocumento').Visible := false;

     CASE DBCOpcaoVis.ItemIndex OF
       0 : sOpcao := 'S';
       1 : sOpcao := 'N';
       2 : sOpcao := 'T';
     END;

     qryDS.ParamByName('ATIVOS').Value := 'N';
     qryDS.ParamByName('FACULT').Value := 'N';
     qryDS.ParamByName('LICENC').Value := 'N';
     qryDS.ParamByName('ASSIS').Value  := 'N';
     qryDS.ParamByName('APOSE').Value  := 'N';
     qryDS.ParamByName('PENSI').Value  := 'N';
     qryDS.ParamByName('CED').Value    := 'N';
     qryDS.ParamByName('NAOASSOC').Value := 'N';

     {QRYInconc.ParamByName('ATIVOS').Value := 'N';
     QRYInconc.ParamByName('FACULT').Value := 'N';
     QRYInconc.ParamByName('LICENC').Value := 'N';
     QRYInconc.ParamByName('ASSIS').Value  := 'N';
     QRYInconc.ParamByName('CED').Value    := 'N';
     QRYInconc.ParamByName('NAOASSOC').Value := 'N';}

     cdsIncons.Params.ParamByName('ATIVOS').Value := 'N';
     cdsIncons.Params.ParamByName('FACULT').Value := 'N';
     cdsIncons.Params.ParamByName('LICENC').Value := 'N';
     cdsIncons.Params.ParamByName('ASSIS').Value  := 'N';
     cdsIncons.Params.ParamByName('APOSE').Value  := 'N';
     cdsIncons.Params.ParamByName('PENSI').Value  := 'N';
     cdsIncons.Params.ParamByName('CED').Value    := 'N';
     cdsIncons.Params.ParamByName('NAOASSOC').Value := 'N';


     if ChkAtivo.Checked then
     begin
        qryDS.ParamByName('ATIVOS').Value := 'S';
        //QRYInconc.ParamByName('ATIVOS').Value := 'S';
        cdsIncons.Params.ParamByName('ATIVOS').Value := 'S';
     end
     else
     begin
        qryDS.ParamByName('ATIVOS').Value := 'N';
        //QRYInconc.ParamByName('ATIVOS').Value := 'N';
        cdsIncons.Params.ParamByName('ATIVOS').Value := 'N';
     end;

     if ChkFacul.Checked then
     begin
        qryDS.ParamByName('FACULT').Value := 'S';
        //QRYInconc.ParamByName('FACULT').Value := 'S';
        cdsIncons.Params.ParamByName('FACULT').Value := 'S';
     end
     else
     begin
        qryDS.ParamByName('FACULT').Value := 'N';
        //QRYInconc.ParamByName('FACULT').Value := 'N';
        cdsIncons.Params.ParamByName('FACULT').Value := 'N';
     end;

     if ChkLicenc.Checked then
     begin
        qryDS.ParamByName('LICENC').Value := 'S';
        //QRYInconc.ParamByName('LICENC').Value := 'S';
        cdsIncons.Params.ParamByName('LICENC').Value := 'S';
     end
     else
     begin
        qryDS.ParamByName('LICENC').Value := 'N';
        //QRYInconc.ParamByName('LICENC').Value := 'N';
        cdsIncons.Params.ParamByName('LICENC').Value := 'N';
     end;

     if ChkAssis.Checked then
     begin
        qryDS.ParamByName('ASSIS').Value := 'S';
        //QRYInconc.ParamByName('ASSIS').Value := 'S';
        cdsIncons.Params.ParamByName('ASSIS').Value := 'S';
     end
     else
     begin
        qryDS.ParamByName('ASSIS').Value := 'N';
        //QRYInconc.ParamByName('ASSIS').Value := 'N';
        cdsIncons.Params.ParamByName('ASSIS').Value := 'N';
     end;

     if ChkApose.Checked then
     begin
        qryDS.ParamByName('APOSE').Value := 'S';
        cdsIncons.Params.ParamByName('APOSE').Value := 'S';
     end
     else
     begin
        qryDS.ParamByName('APOSE').Value := 'N';
        cdsIncons.Params.ParamByName('APOSE').Value := 'N';
     end;

     if ChkPensi.Checked then
     begin
        qryDS.ParamByName('PENSI').Value := 'S';
        cdsIncons.Params.ParamByName('PENSI').Value := 'S';
     end
     else
     begin
        qryDS.ParamByName('PENSI').Value := 'N';
        cdsIncons.Params.ParamByName('PENSI').Value := 'N';
     end;

     if ChkCed.Checked then
     begin
        qryDS.ParamByName('CED').Value := 'S';
        //QRYInconc.ParamByName('CED').Value := 'S';
        cdsIncons.Params.ParamByName('CED').Value := 'S';
     end
     else
     begin
        qryDS.ParamByName('CED').Value := 'N';
        //QRYInconc.ParamByName('CED').Value := 'N';
        cdsIncons.Params.ParamByName('CED').Value := 'N';
     end;

     if ChkNaoAssis.Checked then
     begin
        qryDS.ParamByName('NAOASSOC').Value := 'S';
        //QRYInconc.ParamByName('NAOASSOC').Value := 'S';
        cdsIncons.Params.ParamByName('NAOASSOC').Value := 'S';
     end
     else
     begin
        qryDS.ParamByName('NAOASSOC').Value := 'N';
        //QRYInconc.ParamByName('NAOASSOC').Value := 'N';
        cdsIncons.Params.ParamByName('NAOASSOC').Value := 'N';
     end;

     qryDS.ParamByName('TIPO').Value     := sOpcao;
     pnlAguarde.Caption := 'Buscando informações Inconsistentes...';
     Application.ProcessMessages;
     //QRYInconc.open;
     cdsIncons.open;

     //Ricardo SOL 148338 Kintana 1050257
     if cdsIncons.Active then
        lblTotal_incosistente.Caption := 'Total de inconsistentes: ' + IntToStr(cdsIncons.RecordCount)
     else
        lblTotal_incosistente.Caption := 'Total de inconsistentes: 0';
     //Ricardo SOL 148338 Kintana 1050257 - fim

     pnlAguarde.Caption := 'Buscando informações consistentes...';
     Application.ProcessMessages;
     qryDS.Open;

     //Ricardo SOL 148338 Kintana 1050257
     if qryDS.Active then
        lblTot_consistente.Caption := 'Total de consistentes: ' + IntToStr(qryDS.RecordCount)
     else
        lblTot_consistente.Caption := 'Total de consistentes: 0';
     //Ricardo SOL 148338 Kintana 1050257 - fim

     if (ChkAtivo.Checked or ChkNaoAssis.Checked) and
//        ((ChkFacul.Checked = false) and (ChkLicenc.Checked = false) and (ChkAssis.Checked = false ) and (ChkCed.Checked = false) ) then
        ((ChkFacul.Checked = false) and (ChkLicenc.Checked = false) and (ChkApose.Checked = false ) and (ChkPensi.Checked = false ) and (ChkCed.Checked = false) ) then
     begin
        //Ricardo SOL 148338 Kintana 1050257
        wwDBgrid1.DataSource.DataSet.FieldByName('COD_LOTACAO').Visible   := true;
        wwDBgrid1.DataSource.DataSet.FieldByName('NOME_LOTACAO').Visible   := true;
        wwDBgrid1.DataSource.DataSet.FieldByName('END_LOTACAO').Visible    := true;
        wwDBgrid1.DataSource.DataSet.FieldByName('CIDADE_LOTACAO').Visible := true;
        wwDBgrid1.DataSource.DataSet.FieldByName('UF_LOTACAO').Visible     := true;

        //Ricardo SOL 148338 Kintana 1050257
        wwDBgrid2.DataSource.DataSet.FieldByName('COD_LOTACAO').Visible   := true;
        wwDBgrid2.DataSource.DataSet.FieldByName('NOME_LOTACAO').Visible   := true;
        wwDBgrid2.DataSource.DataSet.FieldByName('END_LOTACAO').Visible    := true;
        wwDBgrid2.DataSource.DataSet.FieldByName('CIDADE_LOTACAO').Visible := true;
        wwDBgrid2.DataSource.DataSet.FieldByName('UF_LOTACAO').Visible     := true;
     end
     else
     begin
        //Ricardo SOL 148338 Kintana 1050257
        wwDBgrid2.DataSource.DataSet.FieldByName('COD_LOTACAO').Visible    := false;
        wwDBgrid2.DataSource.DataSet.FieldByName('NOME_LOTACAO').Visible   := false;
        wwDBgrid2.DataSource.DataSet.FieldByName('END_LOTACAO').Visible    := false;
        wwDBgrid2.DataSource.DataSet.FieldByName('CIDADE_LOTACAO').Visible := false;
        wwDBgrid2.DataSource.DataSet.FieldByName('UF_LOTACAO').Visible     := false;

        //Ricardo SOL 148338 Kintana 1050257
        wwDBgrid1.DataSource.DataSet.FieldByName('COD_LOTACAO').Visible    := false;
        wwDBgrid1.DataSource.DataSet.FieldByName('NOME_LOTACAO').Visible   := false;
        wwDBgrid1.DataSource.DataSet.FieldByName('END_LOTACAO').Visible    := false;
        wwDBgrid1.DataSource.DataSet.FieldByName('CIDADE_LOTACAO').Visible := false;
        wwDBgrid1.DataSource.DataSet.FieldByName('UF_LOTACAO').Visible     := false;

     end;

     pr_liberarBTNconfirmar;

  finally
     //Ricardo SOL 148338 Kintana 1050257
     pnlAguarde.Visible := false;
     Application.ProcessMessages;
     //Ricardo SOL 148338 Kintana 1050257 - Fim
  end;
end;

procedure TfrmEnvioPeriodico.DBCSitPartChange(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.DBCOpcaoVisChange(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.RGFormatoClick(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.DBEAlturaChange(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.DBELarguraChange(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.DBEComprimentoChange(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.DBEPesoChange(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.DBEEdicaoChange(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DBEAltura.Clear;
  DBELargura.Clear;
  DBEComprimento.Clear;
  DBEPeso.Clear;
  DBEEdicao.Clear;
  DBELote.Clear;
  DBESeqCorreio.Clear;
  medtDataInsercao.Clear;

  ChkAtivo.Checked    := false;
  ChkAssis.Checked    := false;
  ChkApose.Checked    := false;
  ChkPensi.Checked    := false;
  ChkCed.Checked      := false;
  ChkFacul.Checked    := false;
  ChkLicenc.Checked   := false;
  ChkNaoAssis.Checked := false;

  DBCOpcaoVis.Clear;
  RGFormato.ItemIndex := -1;
  qryDS.close;
  cdsIncons.Close;
end;

procedure TfrmEnvioPeriodico.qryDSBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  StartTransacao;
  sValor := wwDBgrid1.Selectedfield.text;
end;

procedure TfrmEnvioPeriodico.qryDSBeforePost(DataSet: TDataSet);
begin
  inherited;
 if (sValor = 'S') and (wwDBgrid1.DataSource.DataSet.FieldByName('valor').Text = 'N') then
     MessageDlg('O participante não receberá periódico.',mtinformation,[mbok,mbhelp],0);
  sValor := '';
  RollBackTransacao;
end;

procedure TfrmEnvioPeriodico.qryDSNewRecord(DataSet: TDataSet);
begin
  inherited;
  //Ricardo SOL 148338 Kintana 1050257 - comentado
  //abort;
end;

procedure TfrmEnvioPeriodico.FormCreate(Sender: TObject);
begin
  inherited;
  DBEAltura.Text      := '0,2';
  DBELargura.Text     := '20,5';
  DBEComprimento.Text := '27,6';
end;

procedure TfrmEnvioPeriodico.ChkAtivoClick(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.ChkAssisClick(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.ChkCedClick(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.ChkFaculClick(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.ChkLicencClick(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.ChkNaoAssisClick(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.wwDBGrid1TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;

  if AFieldName <> 'VALOR' Then
  begin
     if ordem = AFieldName then
     begin
        if tipo_ordem = 'desc' then
          tipo_ordem := 'asc'
        else
           tipo_ordem := 'desc';
     end
     else
       tipo_ordem := 'asc';

     ordem := AFieldName;
     btnSelecionar.Click;
  end;
end;

procedure TfrmEnvioPeriodico.wwDBGrid2TitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  if ordeminc = AFieldName then
  begin
     if tipo_ordeminc = 'desc' then
        tipo_ordeminc := 'asc'
     else
        tipo_ordeminc := 'desc';
     end
  else
     tipo_ordeminc := 'asc';

     ordeminc := AFieldName;
     btnSelecionar.Click;

end;

procedure TfrmEnvioPeriodico.BtnImprimirClick(Sender: TObject);
var  vBuffer : String;
begin
  inherited;

  TRY

     Screen.Cursor := crHourGlass;
     pnlAguarde.Visible := True;

     //inconsistentes------------------------------------------------------------
     //TXT
     pnlAguarde.Caption := 'Gerando arquivo TXT para informações inconsistentes...';
     Application.ProcessMessages;
     cdsIncons.First;
     rptDemonstrativo.DeviceType       := 'ReportTextFile';
     rptDemonstrativo.AllowPrintToFile := True;
     rptDemonstrativo.ShowPrintDialog  := False;
     rptDemonstrativo.TextFileName     := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+'Periodico_Info_Incosistente'+'.TXT';
     rptDemonstrativo.Print;

     //PDF
     pnlAguarde.Caption := 'Gerando arquivo PDF para informações inconsistentes...';
     Application.ProcessMessages;
     cdsIncons.First;
     rptDemonstrativo.DeviceType       := 'PDFFile';
     rptDemonstrativo.AllowPrintToFile := True;
     rptDemonstrativo.ShowPrintDialog  := False;
     rptDemonstrativo.TextFileName     := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+'Periodico_Info_Incosistente'+'.PDF';
     rptDemonstrativo.Print;

     //XLS
     pnlAguarde.Caption := 'Gerando arquivo XLS para informações inconsistentes...';
     Application.ProcessMessages;
     cdsIncons.First;
     rptDemonstrativo.DeviceType       := 'ExcelFile';
     rptDemonstrativo.AllowPrintToFile := True;
     rptDemonstrativo.ShowPrintDialog  := False;
     rptDemonstrativo.TextFileName     := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+'Periodico_Info_Incosistente'+'.XLS';
     rptDemonstrativo.Print;  

     //Consistentes-------------------------------------------------------------
     //TXT
     pnlAguarde.Caption := 'Gerando arquivo TXT para informações consistentes...';
     Application.ProcessMessages;
     qryDS.First;
     rptDemonstrativo_Consistente.DeviceType       := 'ReportTextFile';
     rptDemonstrativo_Consistente.AllowPrintToFile := True;
     rptDemonstrativo_Consistente.ShowPrintDialog  := False;
     rptDemonstrativo_Consistente.TextFileName     := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+'Periodico_Info_Cosistente'+'.TXT';
     rptDemonstrativo_Consistente.Print;

     //PDF
     pnlAguarde.Caption := 'Gerando arquivo PDF para informações consistentes...';
     Application.ProcessMessages;
     qryDS.First;
     rptDemonstrativo_Consistente.DeviceType       := 'PDFFile';
     rptDemonstrativo_Consistente.AllowPrintToFile := True;
     rptDemonstrativo_Consistente.ShowPrintDialog  := False;
     rptDemonstrativo_Consistente.TextFileName     := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+'Periodico_Info_Cosistente'+'.PDF';
     rptDemonstrativo_Consistente.Print;

     //XLS
     pnlAguarde.Caption := 'Gerando arquivo XLS para informações consistentes...';
     Application.ProcessMessages;
     qryDS.First;
     rptDemonstrativo_Consistente.DeviceType       := 'ExcelFile';
     rptDemonstrativo_Consistente.AllowPrintToFile := True;
     rptDemonstrativo_Consistente.ShowPrintDialog  := False;
     rptDemonstrativo_Consistente.TextFileName     := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+'Periodico_Info_Cosistente'+'.XLS';
     rptDemonstrativo_Consistente.Print;   

     vBuffer := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+'Periodico_Info_Incosistente'+'.PDF';

  FINALLY
     pnlAguarde.Visible := false;
     Screen.Cursor := crDefault;
  END;

  ShellExecute(Application.Handle, nil, PChar(vBuffer), nil, nil, SW_SHOWNORMAL);


end;

function TfrmEnvioPeriodico.Atualizar_Endereco: Boolean;
begin

     Result := false;

     if cdsIncons.IsEmpty then
        Exit;

     TRY
        Screen.Cursor := crHourGlass;
        TRY
           with Sp_Atualiza_Endereco Do
           begin
                Params.ParamByName('pIDPESSOA').AsInteger     := cdsIncons.fieldbyname('IDPESSOA').AsInteger;
                Params.ParamByName('pIDENDERECO').AsInteger   := cdsIncons.fieldbyname('IDENDERECO').AsInteger;
                Params.ParamByName('pLOGRADOURO').AsString    := Trim(cdsIncons.fieldbyname('LOGRADOURO').AsString);
                Params.ParamByName('pCODESTADO').AsString     := Trim(cdsIncons.fieldbyname('UF').AsString);
                Params.ParamByName('pNUMERO').AsString        := Trim(cdsIncons.fieldbyname('NUMERO').AsString);
                Params.ParamByName('pCOMPLEMENTO').AsString   := Trim(cdsIncons.fieldbyname('COMPLEMENTO').AsString);
                Params.ParamByName('pBAIRRO').AsString        := Trim(cdsIncons.fieldbyname('BAIRRO').AsString);
                Params.ParamByName('pCIDADE').AsString        := Trim(cdsIncons.fieldbyname('CIDADE').AsString);
                Params.ParamByName('pCEP').AsString           := Trim(cdsIncons.fieldbyname('CEP').AsString);
                //Params.ParamByName('pTIPOENDERECO').AsString  := Trim(QRYInconc.fieldbyname('TIPOENDERECO').AsString);
                ExecProc;

                //Avalia Retorno
                if Trim(Params.ParamByName('pRESULTADO').AsString) <> 'OK' then
                begin
                   Application.MessageBox(PChar('Erro ao atualizar endereço.' + #13 +
                                          Params.ParamByName('pRESULTADO').AsString),'Erro ao atualizar endereço.',48);
                end;
                
                Result := (Trim(Params.ParamByName('pRESULTADO').AsString) = 'OK');
           end;
        EXCEPT
           on E:Exception Do
           begin
              Application.MessageBox(PChar('Ocorreu um erro ao atualizar endereço.' + #13 +
                                           'A alteração realizada será cancelada.' + #13 +
                                           'Tipo: ' + E.ClassName + ' - Msg: ' + E.Message),'Atenção',48);
           end;
           end;
     FINALLY
        Screen.Cursor := crDefault;
     END;
end;

procedure TfrmEnvioPeriodico.wwDBGrid2DblClick(Sender: TObject);
begin
  inherited;
  //Ricardo SOL 148338 Kintana 1050257
  //Segundo analista da GETIF (Marimar), a área responsável não permite que
  //esta interface altere registros.
  {if cdsIncons.Active then
  begin
      if not cdsIncons.IsEmpty then
      begin
           cdsIncons.Edit;
           TRY
              Frm_CadEndereco_EnvioPeriodico := TFrm_CadEndereco_EnvioPeriodico.Create(Application);
              Frm_CadEndereco_EnvioPeriodico.ShowModal();
           FINALLY
              FreeAndNil(Frm_CadEndereco_EnvioPeriodico);
           END;
      end;
  end;

  Application.ProcessMessages;}
  //Ricardo SOL 148338 Kintana 1050257 - Fim
end;

function TfrmEnvioPeriodico.Sincronizar_Endereco: Boolean;
begin

     //COnsistências
     if cdsIncons.IsEmpty then
     begin
         Application.MessageBox('Não há informações inconsistentes.','Atenção',48);
         exit;
     end;
     TRY

        Screen.Cursor := crHourGlass;
        TRY
           cdsIncons.First;
           while not cdsIncons.eof Do
           begin
                IF (TRIM(cdsIncons.fieldbyname('LOGRADOURO').AsString) <> '') AND  (TRIM(cdsIncons.fieldbyname('CIDADE').AsString) <> '') AND
                   //Ricardo SOL 148338 Kintana 1050257 - comentado
                   {(TRIM(cdsIncons.fieldbyname('BAIRRO').AsString) <> '') AND}
                   (TRIM(cdsIncons.fieldbyname('CEP').AsString) <> '')  AND
                   (TRIM(cdsIncons.fieldbyname('UF').AsString) <> '')     THEN
                begin
                     //Atualiza nos Consistentes
                     qryDS.Insert;
                     qryDS.FieldByName('IDPESSOA').AsString := cdsIncons.Fieldbyname('IDPESSOA').AsString;
                     //qryDS.FieldByName('VALOR').AsString := cdsIncons.Fieldbyname('VALOR').AsString;
                     qryDS.FieldByName('MATRICULA').AsString := cdsIncons.Fieldbyname('MATRICULA').AsString;
                     qryDS.FieldByName('LOGRADOURO').AsString := cdsIncons.Fieldbyname('LOGRADOURO').AsString;
                     qryDS.FieldByName('COMPLEMENTO').AsString := cdsIncons.Fieldbyname('COMPLEMENTO').AsString;
                     qryDS.FieldByName('BAIRRO').AsString := cdsIncons.Fieldbyname('BAIRRO').AsString;
                     qryDS.FieldByName('CEP').AsString := cdsIncons.Fieldbyname('CEP').AsString;
                     qryDS.FieldByName('UF').AsString := cdsIncons.Fieldbyname('UF').AsString;
                     qryDS.FieldByName('CIDADE').AsString := cdsIncons.Fieldbyname('CIDADE').AsString;
                     qryDS.FieldByName('COMERCIAL').AsString := cdsIncons.Fieldbyname('COMERCIAL').AsString;
                     qryDS.FieldByName('NUMERO').AsString := cdsIncons.Fieldbyname('NUMERO').AsString;
                     qryDS.FieldByName('NOME').AsString := cdsIncons.Fieldbyname('NOME').AsString;
                     qryDS.FieldByName('nome_lotacao').AsString := cdsIncons.Fieldbyname('nome_lotacao').AsString;
                     qryDS.FieldByName('uf_lotacao').AsString := cdsIncons.Fieldbyname('uf_lotacao').AsString;
                     qryDS.FieldByName('cidade_lotacao').AsString := cdsIncons.Fieldbyname('cidade_lotacao').AsString;
                     qryDS.FieldByName('end_lotacao').AsString := cdsIncons.Fieldbyname('end_lotacao').AsString;
                     qryDS.FieldByName('cod_lotacao').AsString := cdsIncons.Fieldbyname('cod_lotacao').AsString;
                     qryDS.FieldByName('Numdocumento').AsString := cdsIncons.Fieldbyname('Numdocumento').AsString;
                     qryDS.Post;

                     //Delete no Inconsistente
                     cdsIncons.Delete;
                end
                else
                begin
                     //Próximo
                     cdsIncons.Next;
                end;

           end;
        EXCEPT
           on E:Exception do
           begin
              Application.MessageBox(PChar('Erro ao atualizar registros!' + #13 + E.Message),'Erro',48);
           end;
        end;
     finally

        if qryDS.State = dsEdit then
           qryDS.Cancel;

        cdsIncons.First;
        qryDS.First;
        Screen.CUrsor := crDefault;

        if cdsIncons.Active then
           lblTotal_incosistente.Caption := 'Total de inconsistentes: ' + IntToStr(cdsIncons.RecordCount)
        else
           lblTotal_incosistente.Caption := 'Total de inconsistentes: 0';

        if qryDS.Active then
           lblTot_consistente.Caption := 'Total de consistentes: ' + IntToStr(qryDS.RecordCount)
        else
           lblTot_consistente.Caption := 'Total de consistentes: 0';

        Application.ProcessMessages;
     end;



end;

procedure TfrmEnvioPeriodico.btnAtualizaClick(Sender: TObject);
begin
  inherited;
  Sincronizar_Endereco();
end;

procedure TfrmEnvioPeriodico.ChkAposeClick(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;

procedure TfrmEnvioPeriodico.ChkPensiClick(Sender: TObject);
begin
  inherited;
  pr_liberarBTNconfirmar;
end;
// inicio -  André Oliveira SOL 160640 KINTANA 1357740
procedure TfrmEnvioPeriodico.pr_MostrarUltimaSequencia_e_UltimaInsercao;
var QryAux : TwwQuery;
begin
  try
    QryAux := TwwQuery.Create(Nil);
    QryAux.DatabaseName := 'BASEDADOS';
    QryAux.SQL.Add('SELECT L.SEQENVIOPERIODICO, P.DATAGERACAO');
    QryAux.SQL.Add('');
    QryAux.SQL.Add('  FROM (SELECT MAX(l.SEQENVIOPERIODICO ) SEQENVIOPERIODICO FROM LOGENVIOPERIODICO l) L,');
    QryAux.SQL.Add('       (SELECT DATAGERACAO');
    QryAux.SQL.Add('          FROM LOGENVIOPERIODICO');
    QryAux.SQL.Add('         WHERE ');
    QryAux.SQL.Add('               TRGDTINCLUSAO = (SELECT MAX(TRGDTINCLUSAO) SEQCORREIOS FROM LOGENVIOPERIODICO)) P');
    QryAux.open;
    if(QryAux.FieldByName('DATAGERACAO').AsString <>'')then
       DBEDUltimoInsercao.Text    := FormatDateTime('DD/MM/YYYY',QryAux.FieldByName('DATAGERACAO').AsDateTime);
    DBEDUltimoSequencial.Text  := QryAux.FieldByName('SEQENVIOPERIODICO').AsString;


    QryAux.Close;

  finally
    QryAux.close;
    QryAux.free;
  end;
end;
// fim -  André Oliveira SOL 160640 KINTANA 1357740
end.
