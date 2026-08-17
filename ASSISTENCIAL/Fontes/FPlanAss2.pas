// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 14.10.2003
// Alteração   : Alteração na qryFornServAss para tirar o FLGASS = 1 pois em
//               nenhum lugar no totalprev inteiro grava esse flag e para
//               gravar no assistencial teria que ter um cadastro de fornecedor
//               no assistencial
//------------------------------------------------------------------------------
unit FPlanAss2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDet, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, DBCtrls, MAHlpBtn,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ComCtrls, ExtCtrls, Mask,
  DBTables, Wwquery, wwdbedit, wwdblook, Wwtable, Wwdbspin, Menus,
  TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, wwDialog, ImgList, MontaSelect;

type
  TfrmPlanAss = class(TfrmCadMestreDetalhe)
    qryPrinc: TwwQuery;
    qryContribAss: TwwQuery;
    tbRegra: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    cmbregra4: TwwDBLookupCombo;
    cmbregra5: TwwDBLookupCombo;
    cmbregra6: TwwDBLookupCombo;
    btnRegra1: TBitBtn;
    qryRegra: TwwQuery;
    dsregra: TwwDataSource;
    Label10: TLabel;
    Label17: TLabel;
    lblperiod: TLabel;
    Label14: TLabel;
    Rgpsel: TRadioGroup;
    cmbFormaPag: TwwDBLookupCombo;
    cmbRubNormal: TwwDBLookupCombo;
    qryContrib: TwwQuery;
    dscontribuicao: TwwDataSource;
    qryPortForm: TwwQuery;
    dsportform: TwwDataSource;
    qryProvento: TwwQuery;
    dsprovento: TwwDataSource;
    qryAux: TwwQuery;
    qryServCmb: TwwQuery;
    dsservcmb: TwwDataSource;
    qryTpServAss: TwwQuery;
    dstpservass: TwwDataSource;
    cmbContrib: TwwDBLookupCombo;
    qryFornServAss: TwwQuery;
    Label22: TLabel;
    spinpri: TwwDBSpinEdit;
    listAux: TListBox;
    DBCkboxevento: TDBCheckBox;
    btnCons: TSpeedButton;
    qryProdAss: TwwQuery;
    cmbRubAtraso: TwwDBLookupCombo;
    cmbRubDevolucao: TwwDBLookupCombo;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    SpeedButton1: TSpeedButton;
    spbLimpa6: TSpeedButton;
    spbLimpa5: TSpeedButton;
    spbLimpa7: TSpeedButton;
    rgFlgCobCarne: TRadioGroup;
    Label21: TLabel;
    GroupBox3: TGroupBox;
    cmbRegraContrib: TwwDBLookupCombo;
    cmbTipoRegraContrib: TwwDBLookupCombo;
    qryTipoRegra: TwwQuery;
    qryTipoRegraAux: TwwQuery;
    qryRegra1: TwwQuery;
    qryTiporegra1: TwwQuery;
    qryTipoRegra2: TwwQuery;
    qryTipoRegra3: TwwQuery;
    qryTipoRegra7: TwwQuery;
    qryRegra2: TwwQuery;
    qryRegra3: TwwQuery;
    qryRegra7: TwwQuery;
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    spbLimpa1: TSpeedButton;
    cmbTipoRegra1: TwwDBLookupCombo;
    cmbRegra1: TwwDBLookupCombo;
    GroupBox7: TGroupBox;
    spbLimpa2: TSpeedButton;
    cmbTipoRegra2: TwwDBLookupCombo;
    cmbregra2: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    GroupBox6: TGroupBox;
    spbLimpa4: TSpeedButton;
    cmbTipoRegra7: TwwDBLookupCombo;
    cmbregra7: TwwDBLookupCombo;
    GroupBox5: TGroupBox;
    spbLimpa3: TSpeedButton;
    cmbTipoRegra3: TwwDBLookupCombo;
    cmbregra3: TwwDBLookupCombo;
    MontaSelect: TMontaSelect;
    qryIns: TwwQuery;
    qryFornServAssNOME: TStringField;
    qryFornServAssIDPESSOA: TFloatField;
    qryProdAssDESCRICAO: TStringField;
    qryProdAssIDPRODASS: TFloatField;
    qryProdAssNOME: TStringField;
    EdNumVezes: TEdit;
    qryMostraContrib: TwwQuery;
    qryMostraContribIDPLANASS: TFloatField;
    qryMostraContribIDCONTASS: TFloatField;
    qryMostraContribNOME: TStringField;
    qryMostraContribNOMEREGRA: TStringField;
    qryMostraContribPORTFORMA: TStringField;
    qryMostraContribPRIORIDADE: TFloatField;
    qryMostraContribRUBRICANORMAL: TStringField;
    qryMostraContribRUBRICAATRASO: TStringField;
    qryMostraContribRUBRICADEVOLUCAO: TStringField;
    qryMostraContribTEMPOCOBR: TFloatField;
    qryMostraContribPAGADOR: TStringField;
    qryMostraContribFLGCOBEVENTO: TFloatField;
    qryContribNOME: TStringField;
    qryContribIDCONTRIBUICAO: TFloatField;
    qryContribIDTPPERIODICIDADE: TFloatField;
    qryMostraContribFLGCOBCARNE: TFloatField;
    qryMostraContribIDREGRA: TFloatField;
    qryMostraContribCODPORTFORMA: TFloatField;
    qryMostraContribIDPROVNORMAL: TFloatField;
    qryMostraContribIDPROVATRASO: TFloatField;
    qryMostraContribIDPROVDEVOL: TFloatField;
    qryRegra1NOMEREGRA: TStringField;
    qryRegra1IDREGRA: TFloatField;
    qryRegra2NOMEREGRA: TStringField;
    qryRegra2IDREGRA: TFloatField;
    qryRegra3NOMEREGRA: TStringField;
    qryRegra3IDREGRA: TFloatField;
    qryRegra7NOMEREGRA: TStringField;
    qryRegra7IDREGRA: TFloatField;
    qryTipoRegraAuxNOMEREGRA: TStringField;
    qryTipoRegraAuxIDTIPOREGRA: TFloatField;
    qryTipoRegraAuxIDREGRA: TFloatField;
    qryRegra1IDTIPOREGRA: TFloatField;
    qryRegra2IDTIPOREGRA: TFloatField;
    qryRegra3IDTIPOREGRA: TFloatField;
    qryRegra7IDTIPOREGRA: TFloatField;
    qryRegraForn: TwwQuery;
    qryRegraFornNOMEREGRA: TStringField;
    qryRegraFornIDREGRA: TFloatField;
    qryRegraPatro: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    qryTipoRegraIDTIPOREGRA: TFloatField;
    qryTipoRegraDESCREGRA: TStringField;
    qryRegraNOMEREGRA: TStringField;
    qryRegraIDREGRA: TFloatField;
    qryMostraContribIDTIPOREGRA: TFloatField;
    qryContribAssIDPLANASS: TFloatField;
    qryContribAssIDCONTASS: TFloatField;
    qryContribAssFLGCOBEVENTO: TFloatField;
    qryContribAssIDREGRA: TFloatField;
    qryContribAssIDEMPRESA: TFloatField;
    qryContribAssIDPROVENTO: TFloatField;
    qryContribAssIDPESSOA: TFloatField;
    qryContribAssCODPORTFORMA: TFloatField;
    qryContribAssIDTPPERIODICIDADE: TFloatField;
    qryContribAssPAGADOR: TStringField;
    qryContribAssTEMPOCOBR: TFloatField;
    qryContribAssIDPROVENTOATRASO: TFloatField;
    qryContribAssIDPROVENTODEVOL: TFloatField;
    qryContribAssPRIORIDADE: TFloatField;
    qryContribAssNOMEREGRA: TStringField;
    qryContribAssNOMETP: TStringField;
    qryContribAssDESCRICAO: TStringField;
    qryContribAssNOME: TStringField;
    qryContribAssFLGCOBCARNE: TFloatField;
    qryPrincIDPLANASS: TFloatField;
    qryPrincIDPESSOA: TFloatField;
    qryPrincIDREGRAATRASOJUR: TFloatField;
    qryPrincIDFORNSERV: TFloatField;
    qryPrincCODPORTFORMA: TFloatField;
    qryPrincCODTIPODOCHISTPAG: TFloatField;
    qryPrincIDPRODASS: TFloatField;
    qryPrincRECPAGHISTPAG: TStringField;
    qryPrincNOME: TStringField;
    qryPrincCODTIPORECHISTREC: TStringField;
    qryPrincIDREGRAADMINISTR: TFloatField;
    qryPrincRECPAGHISTREC: TStringField;
    qryPrincFLGFECHADO: TFloatField;
    qryPrincIDREGRACOBRANCA: TFloatField;
    qryPrincIDREGRAGERAL: TFloatField;
    qryPrincIDREGRAADMISSAO: TFloatField;
    qryPrincIDREGRAPAGAMENTO: TFloatField;
    qryPrincIDREGRABENEFICIA: TFloatField;
    qryPrincIDREGRACANCELAME: TFloatField;
    qryPrincIDREGRADESISTENC: TFloatField;
    qryPrincIDREGRACOMISSAO: TFloatField;
    qryPrincNUMCONTRATO: TFloatField;
    qryPrincDATAINICIOVIGENC: TDateTimeField;
    qryPrincDATAINICIOCOM: TDateTimeField;
    qryPrincCODTIPRECHISTPAG: TStringField;
    qryPrincCODTIPODOCHISTREC: TFloatField;
    qryPrincIDREGRAATRASOCOR: TFloatField;
    qryPrincIDREGRADEVOLJUROS: TFloatField;
    qryPrincIDREGRADEVOLCORR: TFloatField;
    qryPrincFLGATIVO: TFloatField;
    qryPrincOPCAOAIDENT: TStringField;
    qryPrincOPCAOBDIF: TStringField;
    qryPortFormCODARQUIVOREMESSA: TFloatField;
    qryPortFormCODBLOQCHE: TFloatField;
    qryPortFormCODCENTROCUSTO: TStringField;
    qryPortFormCODFORMA: TFloatField;
    qryPortFormCODFORMAPAGTO: TFloatField;
    qryPortFormCODPORTADOR: TFloatField;
    qryPortFormCODPORTFORMA: TFloatField;
    qryPortFormCODTIPOPAGTO: TFloatField;
    qryPortFormCONTROLEREMESSA: TFloatField;
    qryPortFormDATACONTRREMESSA: TDateTimeField;
    qryPortFormDESCFINAN: TStringField;
    qryPortFormDESCRICAO: TStringField;
    qryPortFormDMAIS: TFloatField;
    qryPortFormFLGEMITEAVISO: TStringField;
    qryPortFormIDEMPRESA: TFloatField;
    qryPortFormIDPESSOA: TFloatField;
    qryPortFormIDTEMPLCHEQUE: TFloatField;
    qryPortFormIDUSUARIOINCLUSAO: TFloatField;
    qryPortFormJUROSPORDIA: TFloatField;
    qryPortFormLANCAFINANC: TStringField;
    qryPortFormLOTETRANSMISSAO: TFloatField;
    qryPortFormNOSSONUMERO: TStringField;
    qryPortFormNUMEMPRESABANCO: TStringField;
    qryPortFormNUMRAZAOCC: TStringField;
    qryPortFormPATHARQUIVOREM: TStringField;
    qryPortFormPATHARQUIVORET: TStringField;
    qryPortFormPLACONTA: TStringField;
    qryPortFormPLANO: TFloatField;
    qryPortFormPRAZOPROTESTO: TFloatField;
    qryPortFormRECPAG: TStringField;
    qryMostraContribPORTFORMABOLETO: TFloatField;
    qryRegraComiss: TwwQuery;
    StringField2: TStringField;
    FloatField2: TFloatField;
    Panel1: TPanel;
    GroupBox8: TGroupBox;
    Label20: TLabel;
    EdNumContrato: TEdit;
    Label19: TLabel;
    DtInicVigencia: TDateTimePicker;
    Label18: TLabel;
    DtInicCom: TDateTimePicker;
    GroupBox9: TGroupBox;
    Label1: TLabel;
    EdNome: TEdit;
    Label2: TLabel;
    dblkIdFornecedor: TwwDBLookupCombo;
    Label3: TLabel;
    dblkIdProdass: TwwDBLookupCombo;
    GroupBox10: TGroupBox;
    Label5: TLabel;
    dblkCodPortForma: TwwDBLookupCombo;
    CheckBoxCobDif: TCheckBox;
    CheckBoxAtivo: TCheckBox;
    EdOpcaoAident: TEdit;
    Label4: TLabel;
    chkbOpcoes: TCheckBox;
    sbtnOpcoes: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnApagDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryServCmbBeforeOpen(DataSet: TDataSet);
    procedure qryTpServAssBeforeOpen(DataSet: TDataSet);
    procedure qryPrincAfterScroll(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsClick(Sender: TObject);
    procedure cmbTipoRegraContribCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
              modified: Boolean);
    procedure cmbTipoRegra1CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
              modified: Boolean);
    procedure cmbTipoRegra7CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
              modified: Boolean);
    procedure cmbTipoRegra2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
              modified: Boolean);
    procedure cmbTipoRegra3CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
              modified: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure spbLimpa1Click(Sender: TObject);
    procedure spbLimpa4Click(Sender: TObject);
    procedure spbLimpa2Click(Sender: TObject);
    procedure spbLimpa3Click(Sender: TObject);
    procedure spbLimpa5Click(Sender: TObject);
    procedure spbLimpa6Click(Sender: TObject);
    procedure spbLimpa7Click(Sender: TObject);

  private
    { Private declarations }
    Function AcNum(St:String;Md:Char): String;
    Procedure LimpaVar;
    Procedure ModSbtn(Ins,Alt,Exc,Pr,Dw:Boolean);
    Procedure ModBbtn(Cf,Cn:Boolean);
    Procedure ModSDet(Ins,Alt,Exc,Dw:Boolean);
    Procedure AbreQryRegra;
    procedure MostraCampos;
    procedure AtualizaPlanass;
    procedure AtualizaContribuicao;
    Procedure LocalizaContrib;
    Procedure AtualizaProvContribass(LinSql:String);
    procedure DeletaRubricaXPess;
    procedure DeletaProvento;
    Procedure InsereProvento;
    procedure InsereContrib(sIdplanass: String);
    procedure deletaServContribAss;
    procedure VoltaGrid;
    procedure PreencheRegra;

  public
    { Public declarations }

  end;

var
  frmPlanAss: TfrmPlanAss;
  pag, comiss, reemb: integer;
  Consulta, inseriuCont: boolean;
  idServAss, nome, nomePlano, idProvento, idProventoN, idProventoA, idProventoD,
  Descricao, Tipo, prioridade, idCont: string;
  mens: TModalResult;
  iIdPlanass: Integer;
  sNomePlano,
  sIdFornecedor,
  sIdProdass,
  sNumContrato,
  sCodPortForma,
  sDtInicVig,
  sOpcaoAident,
  sRegraAdm,
  sRegraBenef,
  sRegraCancel,
  sRegraDesist,
  sRegraPagto,
  sRegraComissao,
  sRegraGeral,
  sIdPlanass     : String;
  sDtInicCom     : String[10];
  sOpcaoBDif,
  sFlgAtivo      : String[1];
  iIdFornecedor,
  iIdContrib,
  iIdProdass     : Integer;

  (* Contribass *)
  sPagador     : String[1];
  sFlgCobCarne : String[4];
  sIdContass,
  sIdRegra,
  sIdProvento,
  sIdProventoAtraso,
  sIdProventoDevol,
  sTempoCobr,
  sPrioridade,
  sFlgCobEvento,
  sIdEmpresa,
  sIdPeriod    : String;
  IncluiPlano,
  AlteraPlano,
  ExcluiPlano,
  IncluiContrib,
  AlteraContrib : Boolean;


implementation

uses
  UDataBase, UMensErro, UAutorizacao,{ FPrecoServPlan,} FTelaAut, USistema,
  UAdmAss, FCadServContribass, UModulo, UIntegraBack, DBaseDados;

{$R *.DFM}

Function TfrmPlanass.AcNum(St:String;Md:Char): String;
Var Ch   : Char;
    A    : Integer;
    StAux: String;
begin
  StAux:='';
  For A:=1 to Length(St) do
  begin
    Ch:=St[A];
    If Ch In ['0'..'9'] then StAux:=StAux+Ch;
  end;
  If (StAux='')And(Md='1') then Result:='NULL'
  else If (StAux='')And(Md='2') then Result:='0'
  else Result:=StAux;
end;

Procedure TfrmPlanass.LimpaVar;
begin
  IncluiPlano:=False;
  AlteraPlano:=False;
  IncluiContrib:=False;
  AlteraContrib:=False;
  cmbRubNormal.Enabled:=False;
  cmbRubAtraso.Enabled:=False;
  cmbRubDevolucao.Enabled:=False;
end;

Procedure TfrmPlanass.ModSbtn(Ins,Alt,Exc,Pr,Dw:Boolean);
begin
  sbtnInserir.Enabled:=Ins;
  sbtnAlterar.Enabled:=Alt;
  sbtnApagar.Enabled:=Exc;
  sbtnProcurar.Enabled:=Pr;
  sbtnInserir.Down:=Dw;
  sbtnAlterar.Down:=Dw;
  sbtnApagar.Down:=Dw;
  sbtnProcurar.Down:=Dw;
end;

Procedure TfrmPlanass.ModBbtn(Cf,Cn:Boolean);
begin
  bbtnConfirmar.Enabled:=Cf;
  bbtnCancelar.Enabled:=Cn;
end;

Procedure TfrmPlanass.ModSDet(Ins,Alt,Exc,Dw:Boolean);
begin
  sbtnInsDet.Enabled:=Ins;
  sbtnAltDet.Enabled:=Alt;
  sbtnApagDet.Enabled:=Exc;
  sbtnInsDet.Down:=Dw;
  sbtnAltDet.Down:=Dw;
  sbtnApagDet.Down:=Dw;
end;

Procedure TfrmPlanass.AbreQryRegra;
begin
  inherited;
  With qryRegraForn do
   begin
     Close;
     Open;
   end; {With}
   With qryRegraPatro do
   begin
     Close;
     Open;
   end; {With}
   With qryRegraComiss do
   begin
     Close;
     Open;
   end; {With}
end;

Procedure TfrmPlanAss.LocalizaContrib;
Var sId, sIdTipoRegra: String;
begin
  cmbRegraContrib.Text:='';
  cmbRegraContrib.LookupValue:='';

  With qryMostraContrib do
  begin
    Close;
    ParamByName('IDPLANASS').Value:=qryContribass.FieldByName('IDPLANASS').AsString;
    ParamByName('IDCONTASS').Value:=qryContribass.FieldByName('IDCONTASS').AsString;
    Open;
    sId:=FieldByName('IDCONTASS').AsString;
    If qryContrib.Locate('IDCONTRIBUICAO',StrToIntDef(sId,0),[loCaseInsensitive,loPartialKey]) then
    begin
      cmbContrib.Text:=qryContrib.FieldByName('NOME').AsString;
      cmbContrib.LookupValue:=qryContrib.FieldByName('IDCONTRIBUICAO').AsString;
    end;
    cmbFormaPag.Text:=FieldByName('PORTFORMA').AsString;
    cmbFormaPag.LookupValue:=FieldByName('CODPORTFORMA').AsString;
    cmbRubNormal.Text:=FieldByName('RUBRICANORMAL').AsString;
    cmbRubNormal.LookupValue:=FieldByName('IDPROVNORMAL').AsString;
    cmbRubAtraso.Text:=FieldByName('RUBRICAATRASO').AsString;
    cmbRubAtraso.LookupValue:=FieldByName('IDPROVATRASO').AsString;
    cmbRubDevolucao.Text:=FieldByName('RUBRICADEVOLUCAO').AsString;
    cmbRubDevolucao.LookupValue:=FieldByName('IDPROVDEVOL').AsString;
    EdNumVezes.Text:=FieldByName('TEMPOCOBR').AsString;
    sPagador:=FieldByName('PAGADOR').AsString;
    If sPagador='P' then Rgpsel.ItemIndex:=0
    else Rgpsel.ItemIndex:=1;
    sFlgCobCarne:=FieldByName('FLGCOBCARNE').AsString;
    If sFlgCobCarne='0' then rgFlgCobCarne.ItemIndex:=0
    else rgFlgCobCarne.ItemIndex:=1;
    spinpri.Text:=FieldByName('PRIORIDADE').AsString;
  end; {With}

  (* REGRA DE CONTRIBUIÇÃO*)
  sIdTipoRegra:= qryMostraContrib.FieldByName('IDTIPOREGRA').AsString;
  sIdTipoRegra:=AcNum(sIdTipoRegra,'2');
  sId:=qryMostraContrib.FieldByName('IDREGRA').AsString;
  sId:=AcNum(sId,'2');
  CmbRegraContrib.Text:='';
  CmbRegraContrib.LookupValue:='';
  With qryRegra do
  begin
    Close;
    ParamByName('IDTIPOREGRA').asInteger:=StrToIntDef(sIdTipoRegra,0);
    Open;
    If FieldByName('IDREGRA').AsString<>sId then
    Repeat
      Next;
    Until(FieldByName('IDREGRA').AsString=sId)Or(Eof);
    If qryTipoRegra.Locate('IDTIPOREGRA',StrToIntDef(sIdTipoRegra,0),[loCaseInsensitive,loPartialKey]) then
     begin
       CmbTipoRegraContrib.Text:=qryTipoRegra.FieldByName('DESCREGRA').AsString;
       CmbTipoRegraContrib.LookupValue:=qryTipoRegra.FieldByName('IDTIPOREGRA').AsString;
       CmbRegraContrib.Text:=qrymostracontrib.FieldByName('NOMEREGRA').AsString;
       CmbRegraContrib.LookupValue:=qrymostracontrib.FieldByName('IDREGRA').AsString;
     end;
  end; {with}
end;

procedure TfrmPlanAss.MostraCampos;
begin
  dblkIdFornecedor.Text:='';
  dblkIdFornecedor.LookupValue:='';
  sIdFornecedor:=qryPrinc.FieldByName('IDFORNSERV').AsString;
  If AcNum(sIdFornecedor,'0')<>'' then
   If qryFornServAss.Locate('IDPESSOA',StrToIntDef(sIdFornecedor,0),[loCaseInsensitive,loPartialKey]) then
   begin
     dblkIdFornecedor.Text:=qryFornServAss.FieldByName('NOME').AsString;
     dblkIdFornecedor.LookupValue:=qryFornServAss.FieldByName('IDPESSOA').AsString;
   end;
  dblkIdProdass.Text:='';
  dblkIdProdass.LookupValue:='';
  sIdProdass:=qryPrinc.FieldByName('IDPRODASS').AsString;
  If AcNum(sIdProdass,'0')<>'' then
   If qryProdass.Locate('IDPRODASS',StrToIntDef(sIdProdass,0),[loCaseInsensitive,loPartialKey]) then
   begin
     dblkIdProdass.Text:=qryProdass.FieldByName('NOME').AsString;
     dblkIdProdass.LookupValue:=qryProdass.FieldByName('IDPRODASS').AsString;
   end;
  dblkCodPortForma.Text:='';
  dblkCodPortForma.LookupValue:='';
  sCodPortForma:=qryPrinc.FieldByName('CODPORTFORMA').AsString;
  If AcNum(sCodPortForma,'0')<>'' then
   If qryPortForm.Locate('CODPORTFORMA',StrToIntDef(sCodPortForma,0),[loCaseInsensitive,loPartialKey]) then
   begin
     dblkCodPortForma.Text:=qryPortForm.FieldByName('DESCRICAO').AsString;
     dblkCodPortForma.LookupValue:=qryPortForm.FieldByName('CODPORTFORMA').AsString;
   end;

  iIdPlanass:=qryPrinc.FieldByName('IDPLANASS').AsInteger;

  EdNome.Text:=qryPrinc.FieldByName('NOME').AsString;
  EdNumContrato.Text:=qryPrinc.FieldByName('NUMCONTRATO').AsString;

  sDtInicVig:=qryPrinc.FieldByName('DATAINICIOVIGENC').AsString;
  If DataValida(sDtInicVig,False) then DtInicVigencia.Date:=StrToDate(sDtInicVig);

  sDtInicCom:=qryPrinc.FieldByName('DATAINICIOCOM').AsString;
  If DataValida(sDtInicCom,False) then DtInicCom.Date:=StrToDate(sDtInicCom);

  CheckBoxCobDif.Checked:=qryPrinc.FieldByName('OPCAOBDIF').AsString='1';
  CheckBoxAtivo.Checked:=qryPrinc.FieldByName('FLGATIVO').AsString='1';
  EdOpcaoAident.Text:=qryPrinc.FieldByName('OPCAOAIDENT').AsString;

  VoltaGrid;
  ModSbtn(True,True,True,True,False);
  ModBbtn(False,False);
end;

procedure TfrmPlanAss.DeletaServContribAss;
begin
  If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;
  qryaux.close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
    ('DELETE SERVCONTRIBASS  '+
      'WHERE (IDPLANASS = '+qryprinc.FieldByName('IDPLANASS').AsString+') '+
        'AND (IDCONTASS = '+inttostr(iidcontrib)+') ');
  try
    qryAux.Execsql;
  except
    dtmBaseDados.dbBaseDados.RollBack;
    Exit;
  end;
  dtmBaseDados.dbBaseDados.Commit;
end;

procedure TfrmPlanAss.DeletaProvento;
begin
  (* Tenta deletar deletar em provdesc *)
  If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;
  qryaux.close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
    ('DELETE PROVDESC'+
     ' WHERE (IDPROVENTO IN ('+idproventon+','+idproventoa+','+idproventod+'))AND'+
     '(SUBSTR(FLGTPRUBRICA,1,1) = ''A'')');
  try
    qryAux.Execsql;
  except
    dtmBaseDados.dbBaseDados.RollBack;
    Exit;
  end;
  dtmBaseDados.dbBaseDados.Commit;
end;

procedure TfrmPlanAss.DeletaRubricaXPess;
begin
  (* Tenta deletar em rubricaxpess *)
  If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;
  qryaux.close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('DELETE RUBRICAXPESS'+
                 ' WHERE (IDRUBRICA IN ('+idproventon+','+idproventoa+','+idproventod+'))');
  try
    qryAux.Execsql;
  except
    dtmBaseDados.dbBaseDados.RollBack;
    Exit;
  end;
  dtmBaseDados.dbBaseDados.Commit;
end;

procedure TfrmPlanAss.AtualizaContribuicao;
Var sSql: String;
begin
  If (IncluiPlano)Or(AlteraPlano) then
  begin
    If not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

    sIdContass:=cmbContrib.LookupValue;
    If sIdContass='' then Exit;

    sIdRegra:=CmbRegraContrib.LookupValue;
    sCodPortForma:=CmbFormaPag.LookupValue;
    sIdProvento:=CmbRubNormal.LookupValue;

    sIdProventoAtraso:=CmbRubAtraso.LookupValue;
    sIdProventoDevol:=CmbRubDevolucao.LookupValue;
    sTempoCobr:=EdNumVezes.Text;
    sPrioridade:=spInpri.Text;
    If dbckBoxEvento.Checked then sFlgCobEvento:='1'
    else SFlgCobEvento:='0';

    sIdPeriod:=qryContrib.FieldByName('IDTPPERIODICIDADE').AsString;

    sIdEmpresa:=IntToStr(Sistema.IdEmpresa);

    sIdContass:=AcNum(sIdContass,'1');
    sIdRegra:=AcNum(sIdRegra,'1');
    sCodPortForma:=AcNum(sCodPortForma,'1');
    sFlgCobCarne:=AcNum(sFlgCobCarne,'1');
    sIdProvento:=AcNum(sIdProvento,'1');
    sIdProventoAtraso:=AcNum(sIdProventoAtraso,'1');
    sIdProventoDevol:=AcNum(sIdProventoDevol,'1');
    sTempoCobr:=AcNum(sTempoCobr,'1');
    sPrioridade:=AcNum(sPrioridade,'1');
    sFlgCobEvento:=AcNum(sFlgCobEvento,'1');
    sIdPeriod:=AcNum(sIdPeriod,'1');

    If IncluiContrib then
    begin
      sSql:='INSERT INTO CONTRIBASS'+
            ' (IDPLANASS,IDCONTASS,IDREGRA,CODPORTFORMA,FLGCOBCARNE,'+
            ' IDPROVENTO,IDPROVENTOATRASO,IDPROVENTODEVOL,TEMPOCOBR,'+
            ' PAGADOR,PRIORIDADE,FLGCOBEVENTO,IDEMPRESA,IDTPPERIODICIDADE) VALUES'+
            ' ('+IntToStr(iIdPlanass)+','+sIdContass+','+sIdRegra+','+sCodPortForma+','+
              sFlgCobCarne+','+sIdProvento+','+sIdProventoAtraso+','+sIdProventoDevol+','+
              sTempoCobr+','+QuotedStr(sPagador)+','+sPrioridade+','+sFlgCobEvento+','+
              sIdEmpresa+','+sIdPeriod+')';
    end
     else
       If AlteraContrib then
       begin
          sSql:='UPDATE CONTRIBASS'+
            ' SET IDREGRA = '+sIdRegra+','+
            ' CODPORTFORMA = '+sCodPortForma+','+
            ' FLGCOBCARNE = '+sFlgCobCarne+','+
            ' IDPROVENTO = '+sIdProvento+','+
            ' IDPROVENTOATRASO = '+sIdProventoAtraso+','+
            ' IDPROVENTODEVOL = '+sIdProventoDevol+','+
            ' TEMPOCOBR = '+sTempoCobr+','+
            ' PAGADOR = '+Quotedstr(sPagador)+','+
            ' PRIORIDADE = '+sPrioridade+','+
            ' FLGCOBEVENTO = '+sFlgCobEvento+','+
            ' IDEMPRESA = '+sIdEmpresa+','+
            ' IDTPPERIODICIDADE = '+sIdPeriod+
            ' WHERE (IDPLANASS = '+IntToStr(iIdPlanass)+') AND'+
            ' (IDCONTASS = '+sIdContass+')';
       end;
    With qryIns do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sSqL);
      try
        ExecSQL;
      except
        dtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
                'Erro',mtError,[mbOk,mbHelp],0);
        Abort;
      end;
      dtmBaseDados.dbBaseDados.Commit;
    end; {With}
  end;
  inherited;
end;

procedure TfrmPlanAss.AtualizaPlanass;
Var sSql: String;
begin
  If (IncluiPlano)Or(AlteraPlano)Or
      (ExcluiPlano) then
  begin
    If not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    iIdPlanass:=qryPrinc.FieldByName('IDPLANASS').AsInteger;

    sNomePlano:= EdNome.Text;
    sIdFornecedor:= dblkIdFornecedor.LookupValue;
    sIdProdass:=dblkIdProdass.LookupValue;
    sNumContrato:=EdNumContrato.Text;
    sCodPortForma:=dblkCodPortForma.LookupValue;
    sDtInicVig:=DateToStr(DtInicVigencia.Date);
    sDtInicCom:=DateToStr(DtInicCom.Date);
    If CheckBoxCobDif.Checked then sOpcaoBDif:='1'
    else sOpcaoBDif:='0';
    If CheckBoxAtivo.Checked then sFlgAtivo:='1'
    else sFlgAtivo:='0';
    sOpcaoAident  :=EdOpcaoAident.Text;
    sRegraAdm     :=CmbRegra1.LookupValue;
    sRegraBenef   :=CmbRegra2.LookupValue;
    sRegraCancel  :=CmbRegra3.LookupValue;
    sRegraPagto   :=CmbRegra4.LookupValue;
    sRegraComissao:=CmbRegra5.LookupValue;
    sRegraGeral   :=CmbRegra6.LookupValue;
    sRegraDesist  :=CmbRegra7.LookupValue;

    sIdFornecedor:=AcNum(sIdFornecedor,'1');
    sIdProdass:=AcNum(sIdProdass,'1');
    sNumContrato:=AcNum(sNumContrato,'1');
    sCodPortForma:=AcNum(sCodPortForma,'1');
    sRegraAdm:=AcNum(sRegraAdm,'1');
    sRegraBenef:=AcNum(sRegraBenef,'1');
    sRegraCancel:=AcNum(sRegraCancel,'1');
    sRegraDesist:=AcNum(sRegraDesist,'1');
    sRegraPagto:=AcNum(sRegraPagto,'1');
    sRegraComissao:=AcNum(sRegraComissao,'1');
    sRegraGeral:=AcNum(sRegraGeral,'1');

    If IncluiPlano then
    begin
      iIdPlanass:= LeUltRegistro(nil,'PLANASS');
      sSql:='INSERT INTO PLANASS'+
            ' (IDPLANASS,NOME,IDFORNSERV,IDPRODASS,NUMCONTRATO,'+
            ' CODPORTFORMA,DATAINICIOVIGENC,DATAINICIOCOM,OPCAOBDIF,'+
            ' FLGATIVO, OPCAOAIDENT, IDREGRAADMISSAO, IDREGRABENEFICIA,'+
            ' IDREGRACANCELAME,IDREGRADESISTENC,IDREGRAPAGAMENTO,'+
            ' IDREGRACOMISSAO,IDREGRAGERAL) VALUES'+
            ' ('+IntToStr(iIdPlanass)+','+QuotedStr(sNomePlano)+','+sIdFornecedor+','+
              sIdProdass+','+sNumContrato+','+sCodPortForma+','+
            '  TO_DATE('+QuotedStr(sDtInicVig)+','+QuotedStr('DD/MM/YYYY')+'),'+
            '  TO_DATE('+QuotedStr(sDtInicCom)+','+QuotedStr('DD/MM/YYYY')+'),'+
              QuotedStr(sOpcaoBDif)+','+sFlgAtivo+','+QuotedStr(sOpcaoAident)+','+
               sRegraAdm+','+sRegraBenef+','+sRegraCancel+','+sRegraDesist+','+
               sRegraPagto+','+sRegraComissao+','+sRegraGeral+')';
    end
     else
       If AlteraPlano then
       begin
          sSql:='UPDATE PLANASS'+
            ' SET NOME = '+QuotedStr(sNomePlano)+','+
            ' IDFORNSERV = '+sIdFornecedor+','+
            ' IDPRODASS = '+sIdProdass+','+
            ' NUMCONTRATO = '+sNumContrato+','+
            ' CODPORTFORMA = '+sCodPortForma+','+
            ' DATAINICIOVIGENC = TO_DATE('+QuotedStr(sDtInicVig)+','+QuotedStr('DD/MM/YYYY')+'),'+
            ' DATAINICIOCOM = TO_DATE('+QuotedStr(sDtInicCom)+','+QuotedStr('DD/MM/YYYY')+'),'+
            ' OPCAOBDIF = '+QuotedStr(sOpcaoBDif)+','+
            ' FLGATIVO = '+sFlgAtivo+','+
            ' OPCAOAIDENT = '+QuotedStr(sOpcaoAident)+','+
            ' IDREGRAADMISSAO = '+sRegraAdm+','+
            ' IDREGRABENEFICIA = '+sRegraBenef+','+
            ' IDREGRACANCELAME = '+sRegraCancel+','+
            ' IDREGRADESISTENC = '+sRegraDesist+','+
            ' IDREGRAPAGAMENTO = '+sRegraPagto+','+
            ' IDREGRACOMISSAO = '+sRegraComissao+','+
            ' IDREGRAGERAL = '+sRegraGeral+
            ' WHERE IDPLANASS = '+IntToStr(iIdPlanass);
       end
        else
          If ExcluiPlano then
          begin
            sSql:='DELETE FROM PLANASS'+
                  ' WHERE IDPLANASS = '+IntToStr(iIdPlanass);
          end;

    With qryIns do
    begin
      Close;
      SQL.Clear;
      SQL.Add(sSqL);
      try
        ExecSQL;
      except
        dtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
                'Erro',mtError,[mbOk,mbHelp],0);
        Abort;
      end;
      dtmBaseDados.dbBaseDados.Commit;
    end; {With}
    (* Faz Atualização na Contribass *)
    If (AlteraContrib)Or(IncluiContrib) then AtualizaContribuicao;
    qryPrinc.Close;
    qryPrinc.Open;
    qryPrinc.Locate('IDPLANASS',iIdPlanass,[loCaseInsensitive,loPartialKey]);
    MostraCampos;
    PreencheRegra;
    VoltaGrid;
    sIdPlanass:=IntToStr(iIdPlanass);
    qryContribass.First;
    Repeat                       
      qryContribass.Next;            (* sIdContass - Pega valor em AtualizaContribuicao *)
    Until(qryContribass.FieldByName('IDPLANASS').AsString=sIdPlanass)And
          (qryContribass.FieldByName('IDCONTASS').AsString=sIdContass)Or(qryContribass.Eof);
  end;
  inherited;
end;

procedure TfrmPlanAss.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
  ModSDet(False,False,False,False);
  LimpaVar;
  try
    qryPrinc.close;
    qryPrinc.sql.clear;
    qryPrinc.sql.add
      ('SELECT IDPLANASS,IDPESSOA,IDREGRAATRASOJUR,IDFORNSERV,CODPORTFORMA,'+
              'CODTIPODOCHISTPAG,IDPRODASS,RECPAGHISTPAG,NOME,CODTIPORECHISTREC,'+
              'IDREGRAADMINISTR,RECPAGHISTREC,FLGFECHADO,IDREGRACOBRANCA,'+
              'IDREGRAGERAL,IDREGRAADMISSAO,IDREGRAPAGAMENTO,IDREGRABENEFICIA,'+
              'IDREGRACANCELAME,IDREGRADESISTENC,IDREGRACOMISSAO,NUMCONTRATO,'+
              'DATAINICIOVIGENC,DATAINICIOCOM,CODTIPRECHISTPAG,CODTIPODOCHISTREC,'+
              'IDREGRAATRASOCOR,IDREGRADEVOLJUROS,IDREGRADEVOLCORR,'+
              'FLGATIVO,OPCAOAIDENT,OPCAOBDIF '+
         'FROM PLANASS');
    qryPrinc.open;

    qryTipoRegra.open;

    qryTipoRegra1.open;
    qryTipoRegra2.open;
    qryTipoRegra3.open;
    qryTipoRegra7.open;

    qryContrib.open;
    qryPortForm.open;
    qryProvento.open;
    qryProdAss.open;
    qryFornServAss.open;
    AbreQryRegra;
    cmbRegraContrib.text := '';
  except
    raise;
  end;
  pgctrlDetalhe.ActivePage := tbshDetalhe;
  MostraCampos;
  PreencheRegra;
  inherited;
end;

(* Insere em CONTRIBPLANPREVA as contribuições inseridas após a associação de planos *)
procedure TfrmPlanAss.InsereContrib(sIdPlanAss: string);
begin
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add
    ('SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPLANASS, PP.CODCENTROCUSTOC, '+
           ' PP.CODALTERADORJUROS, PP.CODCENTRORESPON, PP.IDPESSOA, PP.TIPCODIGO,'+
           ' PP.UNIDNEGOC, PP.CODSUBCONTA, PP.PLACONTAD, PP.PLANO, PP.PLACONTAC,'+
           ' PP.FLGATIVO, PP.CODCENTROCUSTOD, PP.FLGAUTONUMINSC, PP.NUMINSCINICIAL,'+
           ' PP.IDEMPRESA, PP.CODALTERADORCORR, CT.IDCONTASS '+
      ' FROM PLANPREVASS PP, CONTRIBASS CT '+
     ' WHERE (PP.IDPLANASS = '+sIdPlanAss+')'+
       ' AND (PP.IDPLANASS = CT.IDPLANASS)'+
       ' AND (CT.IDCONTASS NOT IN (SELECT CPA.IDCONTASS'+
                                   ' FROM CONTRIBPLANPREVA CPA'+
                                  ' WHERE (CPA.IDPLANASS = '+sIdPlanAss+'))) ');
  qryAux.open;
  qryAux.first;

  if not qryAux.isEmpty then
  begin
     while not qryAux.eof do
     begin
       If not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;
        qryIns.close;
        qryIns.sql.clear;
        qryIns.sql.add
          ('INSERT INTO CONTRIBPLANPREVA(IDPLANASS,IDCONTASS,IDPESSJUR, '+
                 ' IDPLANOPREV,CODCENTROCUSTOC,CODCENTROCUSTOD,PLANO,PLACONTAD, '+
                 ' PLACONTAC,IDEMPRESA ,IDPESSOA, CODCENTRORESPON,CODSUBCONTA, '+
                 ' CODALTERADORJUROS, CODALTERADORCORR, TIPCODIGO, UNIDNEGOC) '+
          ' VALUES ('+qryAux.FieldByName('IDPLANASS').AsString+','+
                    ''+qryAux.FieldByName('IDCONTASS').AsString+','+
                    ''+qryAux.FieldByName('IDPESSJUR').AsString+','+
                    ''+qryAux.FieldByName('IDPLANOPREV').AsString+','+
                    ' :CODCENTROCUSTOC,'+
                    ' :CODCENTROCUSTOD,'+
                    ' :PLANO,'+
                    ' :PLACONTAD,'+
                    ' :PLACONTAC,'+
                    ' :IDEMPRESA,'+
                    ' :IDPESSOA,'+
                    ' :CODCENTRORESPON,'+
                    ' :CODSUBCONTA,'+
                    ' :CODALTERADORJUROS,'+
                    ' :CODALTERADORCORR,'+
                    ' :TIPCODIGO,'+
                    ' :UNIDNEGOC)');
        try
           qryIns.ParamByName('CODCENTROCUSTOC').AsString := '';
           qryIns.ParamByName('CODCENTROCUSTOD').AsString :=  '';
           qryIns.ParamByName('PLANO').AsString := '';
           qryIns.ParamByName('PLACONTAD').AsString := '';
           qryIns.ParamByName('PLACONTAC').AsString := '';
           qryIns.ParamByName('IDEMPRESA').AsString := '';
           qryIns.ParamByName('IDPESSOA').AsString  := '';
           qryIns.ParamByName('CODCENTRORESPON').AsString := '';
           qryIns.ParamByName('CODSUBCONTA').AsString := '';
           qryIns.ParamByName('CODALTERADORJUROS').AsString := '';
           qryIns.ParamByName('CODALTERADORCORR').AsString := '';
           qryIns.ParamByName('TIPCODIGO').AsString  := '';
           qryIns.ParamByName('UNIDNEGOC').AsString  := '';
           qryIns.execsql;
        except
           dtmBaseDados.dbBaseDados.Rollback;
           MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
                   'Erro',mtError,[mbOk,mbHelp],0);
           Abort;
        end;
        qryAux.next;
     end;
  end;
end;

procedure TfrmPlanAss.bbtnConfirmarClick(Sender: TObject);

{sub} (* Verifica se campos estão preenchidos *)
Function ExisteErro: Boolean;
Var cCh: Char;
begin
  cCh:=#0;
  If EdNome.text = '' then cCh:='1'
  {} {INIBIDO ATÉ QUE SEJA INCLUIDO NO SISTEMA O CADASTRO DE FORNECEDORES}
  {else If wwDBLookupCombo1.text = '' then cCh:='2'}
  else If dblkIdFornecedor.text = '' then cCh:='3';
  Case cCh of
    '1' : MsgDlg('É preciso digitar o nome do plano!','Erro',mtError,[mbOk,mbHelp],0);
    '2' : MsgDlg('É preciso selecionar o fornecedor!','Erro',mtError,[mbOk,mbHelp],0);
    '3' : MsgDlg('É preciso selecionar o produto !','Erro',mtError,[mbOk,mbHelp],0);
  end;
  ExisteErro:=cCh<>#0;
end;

begin
  (* Verifica se os campos estão preenchidos *)
  If ExisteErro then Exit;

  sIdPlanass:='';
  (* Faz Atualização na Tabela Planass *)
  AtualizaPlanass;

  If sIdPlanass<>'' then
  begin
  (* Insere Contribuição na Tabela ContribPlanPreva *)
    InsereContrib(sIdPlanass);
  (* Insere proventos na ProvDesc *)
    If inseriuCont then InsereProvento;
  end;

  If AlteraPlano then VoltaGrid;

  dbgrdDet.applySelected;

  tbRegra.enabled := true;
  rgpSel.enabled := true;
  rgpSel.visible := true;
  rgpSel.itemIndex := 1;

  tbRegra.enabled := true;
  tbshDetalhe.enabled := true;

  inseriuCont := false;
  ListAux.Items.clear;

  ModSDet(False,False,False,False);
  ModSbtn(True,True,True,True,False);
  LimpaVar;
end;

Procedure TFrmPlanass.AtualizaProvContribass(LinSql:String);
begin
  With qryAux do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT IDPLANASS'+
            ' FROM CONTRIBASS'+
            ' WHERE ('+LinSql+') AND'+
            ' (IDCONTASS = '+idCont+') AND'+
            ' (IDPLANASS = '+qryPrinc.FieldByName('IDPLANASS').AsString+')');
    Open;

    (* Insere em contribass *)
    If IsEmpty then
    begin
      If not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;
      Close;
      Sql.Clear;
      Sql.add('UPDATE CONTRIBASS'+
              ' SET '+LinSql+
              ' WHERE (IDCONTASS = '+idCont+') AND'+
              ' (IDPLANASS = '+qryPrinc.FieldByName('IDPLANASS').AsString+')');
      try
        ExecSQL;
      except
        dtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
                'Erro',mtError,[mbOk,mbHelp],0);
        Abort;
      end;
      dtmBaseDados.dbBaseDados.Commit;
    end else Close; {IsEmpty}
  end; {With}
end;

procedure TfrmPlanAss.InsereProvento;
var ind, j, idposicao: integer;
    sAux: string;
    IncProvDesc: Boolean;
    cFlgDesconto, cFlgAtrasoDevol: char;
begin
  cFlgDesconto:=High(cFlgDesconto);
  ListAux.Itemindex:= 0;
  cFlgAtrasoDevol:=#0;
  For ind:=0 to ListAux.Items.Count-1 do
  begin
    ListAux.ItemIndex:= ind;

    idPosicao := pos(';', ListAux.Items[ind]);
    Descricao := Copy(ListAux.Items[ind], 1, idPosicao-1);
    sAux := Copy(ListAux.Items[ind], idPosicao+1, length(ListAux.Items[ind]));

    idPosicao := pos(';', sAux);
    idProventoN := Copy(sAux, 1, idPosicao-1);
    sAux := Copy(sAux, idPosicao+1, length(sAux));

    idPosicao := pos(';', sAux);
    idProventoA := Copy(sAux, 1, idPosicao-1);
    sAux := Copy(sAux, idPosicao+1, length(sAux));

    idPosicao := pos(';', sAux);
    idProventoD := Copy(sAux, 1, idPosicao-1);
    sAux := Copy(sAux, idPosicao+1, length(sAux));

    idPosicao := pos(';', sAux);
    Prioridade := Copy(sAux, 1, idPosicao-1);
    sAux := Copy(sAux, idPosicao+1, length(sAux));

    idPosicao := pos(';', sAux);
    if idPosicao <> 0 then
    begin
      IdCont := Copy(sAux, 1, idPosicao-1);
      sAux := Copy(sAux, idPosicao+1, length(sAux));
    end
    else
    begin
      Idcont := sAux;
    end;

    For J:=1 to 3 do
    begin
       case J of
         1: begin
              Tipo := 'Normal';
              idProvento := idProventoN;
              cFlgAtrasoDevol := 'N';
              cFlgDesconto := '1';
            end;
         2: begin
              Tipo := 'Atraso';
              idProvento := idProventoA;
              cFlgAtrasoDevol := 'A';
              cFlgDesconto := '1';
            end;
         3: begin
              Tipo := 'Devolucao';
              idProvento := idProventoD;
              cFlgAtrasoDevol := 'D';
              cFlgDesconto := '0';
            end;
       end;

       (* Insere em provdesc *)
       sAux := descricao+'-['+Tipo+']';
       qryAux.close;
       qryAux.sql.clear;
       qryAux.SQL.add
         ('SELECT COUNT(*) TOT FROM PROVDESC'+
          ' WHERE (DESCRICAO = '''+sAux+''')');
       IncProvDesc:=False;
       try
          qryAux.open;
          if qryAux.FieldByName('TOT').asInteger > 0 then
          begin
            ShowMessage('ATENÇÃO: a rubrica "'+sAux+'" já está cadastrada.');
          end else IncProvDesc:=True;
       except
         exit;
       end;

       If not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       If IncProvDesc then
       begin
         qryAux.close;
         qryAux.sql.clear;
         qryAux.SQL.add
           ('INSERT INTO PROVDESC(IDPROVENTO,FLGDESCONTO,DESCRICAO,FLGIRRF,'+
                  ' FLGFGTS, FLGINSS,FLGINTERNO,FLGCONSOLIDA,FLGCONSTAFOLHA,'+
                  ' FLGOBRIGAFAVOREC,FLGRAIS, FLGSALFAMILIA,FLGDECIMOTERCEIRO,'+
                  ' FLGFERIAS,FLGRESCISAO,FLGUSO,FLGTPRUBRICA,FLGATRASODEVOL,NUMPRIORIDADE,'+
                  ' IDMODULO)'+
           ' VALUES ('+idProvento+','+cFlgDesconto+','''+sAux+''','+
                     '0,0,0,1,0,0,0,0,0,0,0,0,''A'',''AB'','''+cFlgAtrasoDevol+''','+
                     prioridade+','+intToStr(Sistema.IdModulo)+')');
         try
            qryAux.ExecSQL;
         except
            dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
                    'Erro',mtError,[mbOk,mbHelp],0);
            Abort;
         end;
         dtmBaseDados.dbBaseDados.Commit;
         Case J Of
           1: AtualizaProvContribass('IDPROVENTO = '+idProventoN);
           2: AtualizaProvContribass('IDPROVENTOATRASO = '+idProventoA);
           3: AtualizaProvContribass('IDPROVENTODEVOL = '+idProventoD);
         end; {Case}
       end; {If IncProvDesc}
    end; {For}
  end; {For principal}
  qryProvento.close;
  qryProvento.open;
end;

procedure TfrmPlanAss.VoltaGrid;
begin
  HabilitaPainel(pnlControlesDet, False);
  qrycontribass.close;
  qrycontribass.SQL.clear;
  qrycontribass.sql.add
  ('SELECT C.IDPLANASS,C.IDCONTASS,C.IDREGRA,C.IDEMPRESA,C.IDPROVENTO,'+
            'C.IDPESSOA,C.CODPORTFORMA,C.IDTPPERIODICIDADE,C.PAGADOR,C.TEMPOCOBR,'+
            'C.IDPROVENTOATRASO,C.IDPROVENTODEVOL,C.PRIORIDADE,'+
            'C.FLGCOBEVENTO,REGRA.NOMEREGRA,TP.NOME NOMETP,PT.DESCRICAO,CT.NOME,'+
            'C.FLGCOBCARNE '+
      ' FROM CONTRIBASS C,REGRA,TPPERIODICIDADE TP,PORTADORFORMA PT,CONTRIBUICAO CT'+
     ' WHERE (C.IDPLANASS = :IDPLANASS)'+
       ' AND (C.IDREGRA = REGRA.IDREGRA)'+
       ' AND (TP.IDTPPERIODICIDADE = C.IDTPPERIODICIDADE)'+
       ' AND (PT.CODPORTFORMA(+) = C.CODPORTFORMA)'+
       ' AND (CT.IDCONTRIBUICAO = C.IDCONTASS)');
  qrycontribass.requestlive := false;
  with dbgrdDet  do
  begin
    Selected.Clear;
    Selected.Add('NOME'       +#9+'25'+#9+'Contribuição');
    Selected.Add('FLGCOBCARNE'+#9+'10'+#9+'Carnê?');
    Selected.Add('NOMETP'     +#9+'25'+#9+'Forma de Pagamento');
    Selected.Add('PAGADOR'    +#9+'15'+#9+'Pagador');
    Selected.Add('DESCRICAO'  +#9+'25'+#9+'Rubrica');
    Selected.Add('PRIORIDADE' +#9+'10'+#9+'Prioridade');
    Selected.Add('NOMEREGRA'  +#9+'25'+#9+'Regra');
  end;
  qrycontribass.open;
  dbgrdDet.applyselected;
  dbgrdDet.BringToFront;
  IncluiContrib:=False;
  AlteraContrib:=False;
end;

procedure TfrmPlanAss.bbtnOkDetClick(Sender: TObject);
Var idContAss, j: integer;

{sub} (* Verifica se campos estão preenchidos *)
Function ExisteErro: Boolean;
Var cCh: Char;
begin
  cCh:=#0;
  If cmbcontrib.text = '' then cCh:='1'
  else If cmbRegraContrib.Text = '' then cCh:='2'
  else If spinPri.Text = '' then cCh:='3'
  else If RgpSel.itemIndex = -1 then cCh:='4'
  else If cmbFormaPag.text = '' then cCh:='5';
  Case cCh of
    '1' : MsgDlg('É preciso selecionar o tipo de contribuição !','Erro',mtError,[mbOk,mbHelp],0);
    '2' : MsgDlg('É preciso associar uma regra a esta contribuição !','Erro',mtError,[mbOk,mbHelp],0);
    '3' : MsgDlg('É preciso selecionar uma prioridade!','Erro',mtError,[mbOk,mbHelp],0);
    '4' : MsgDlg('É preciso selecionar o responsável pelo pagamento!','Erro',mtError,[mbOk,mbHelp],0);
    '5' : MsgDlg('É preciso selecionar o local pagamento padrão da contribuição!','Erro',mtError,[mbOk,mbHelp],0);
  end;
  Case cCh Of
    '1' : If (cmbContrib.Visible) and (cmbContrib.Enabled) then cmbContrib.setFocus;
    '2' : If (cmbRegraContrib.Visible) and (cmbRegraContrib.Enabled) then cmbRegraContrib.setFocus;
    '3' : If (spinPri.Visible) and (spinPri.Enabled) then spinPri.setFocus;
    '4' : If (rgpSel.Visible) and (RgpSel.Enabled) then RgpSel.setFocus;
    '5' : If (cmbFormaPag.Visible) and (cmbFormaPag.Enabled) then cmbFormaPag.setFocus;
  end;
  ExisteErro:=cCh<>#0;
end;

begin
   Idcontass := StrToIntDef(cmbContrib.LookupValue,0);

   (* Verifica se os campos estão preenchidos *)
   If ExisteErro then Exit;

   If (AlteraPlano)And(IncluiContrib) then
   begin
      inseriuCont := true;
      qryAux.close;
      qryAux.sql.clear;
      qryAux.sql.add
        ('SELECT IDCONTASS'+
          ' FROM CONTRIBASS'+
         ' WHERE (IDCONTASS = '+qrycontrib.FieldByName('IDCONTRIBUICAO').AsString+')'+
           ' AND (IDPLANASS = '+qryprinc.FieldByName('IDPLANASS').AsString+')');
      qryAux.open;

      if not qryAux.isEmpty then
      begin
         showMessage('Este tipo de contribuição já foi associado ao plano em questão !');
         If (cmbContrib.Visible) and (cmbContrib.Enabled)  then cmbContrib.setFocus;
         exit;
      end;
   end;
   sPagador:='';
   sFlgCobCarne:='';
   begin
     case rgpSel.itemIndex of
       0: sPagador:= 'P';
       1: sPagador:= 'C';
     end;
     case rgFlgCobCarne.itemIndex of
       0: sFlgCobCarne:= '0';
       1: sFlgCobCarne:= '1';
     end;
   end;
   if sPagador = 'C' then
   begin
     for j:=1 to 3 do
     begin
       qryAux.close;
       qryAux.sql.clear;
       idProvento := intToStr(LeUltRegistro(qryAux,'PROVDESC'));
       case j of
         1: idProventoN := idProvento;
         2: idProventoA := idProvento;
         3: idProventoD := idProvento;
       end;
     end;
     Descricao := qryContrib.FieldByName('NOME').AsString+'-'+qryPrinc.FieldByName('NOME').AsString+'';
     ListAux.items.Add(''+Descricao+';'+idProventoN+';'+idProventoA+';'+idProventoD+';'+
                        trim(spinPri.Text)+';'+intToStr(idContAss)+'');
   end; {If}

   iIdContrib := StrToIntDef(cmbContrib.LookupValue,0);

   bbtnConfirmar.Enabled:=True;
   bbtnConfirmar.Click; 

   inherited;
end;

procedure TfrmPlanAss.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  dbgrdDet.applyselected;
  tbRegra.enabled := true;
  VoltaGrid;
  cmbRubNormal.Enabled:=False;
  cmbRubAtraso.Enabled:=False;
  cmbRubDevolucao.Enabled:=False;
end;

procedure TfrmPlanAss.sbtnInsDetClick(Sender: TObject);
begin
  If (IncluiPlano)Or(AlteraPlano) then
  begin
    If (EdNome.text = '')Or(dblkIdFornecedor.Text = '')Or
        (dblkIdProdass.text = '') then Exit;

     IncluiContrib:=True;

     btncons.enabled := false;
     DBCkboxevento.enabled := false;
     DBCkboxevento.checked := false;
     bbtnOkDet.Enabled:=True;
     bbtnCancelarDet.Enabled:=True;
     ModBbtn(False,True);
     sbtnAltDet.Enabled:=False;
     sbtnApagDet.Enabled:=False;
     Rgpsel.Enabled := true;
     Rgpsel.Visible := true;
     Rgpsel.itemindex := 1;
     cmbcontrib.enabled := true;
     cmbTipoRegraContrib.text := '';
     cmbRegraContrib.text := '';
     cmbRegraContrib.enabled := true;
     EdNumVezes.enabled := true;
     qryProvento.Close;
     qryProvento.Open;
     qryPortForm.Close;
     qryPortForm.Open;
     With qryRegra do
     begin
       close;
       paramByName('IDTIPOREGRA').asinteger := -1;
       open;
     end; {With}
     dbGrdDet.SendToBack;
     HabilitaPainel(pnlControlesDet, true);
     pgctrlDetalhe.activepage := tbshDetalhe;
     tbRegra.enabled := false;
     If (cmbContrib.Visible) and (cmbContrib.Enabled) then cmbContrib.SetFocus;
  end else ModSDet(False,False,False,False);
end;

procedure TfrmPlanAss.sbtnAltDetClick(Sender: TObject);
begin
  If AlteraPlano then
  begin
    If qryContribAss.isempty then
    begin
       AlteraContrib:= False;
       Exit;
    end;
    AlteraContrib:=True;
    sbtnInsDet.Enabled:=False;
    sbtnApagDet.Enabled:=False;
    ModBbtn(False,True);
    bbtnOkDet.Enabled:=True;
    bbtnCancelarDet.Enabled:=True;
    cmbRubNormal.Enabled:=True;
    cmbRubAtraso.Enabled:=True;
    cmbRubDevolucao.Enabled:=True;

    (* Localiza os dados conforme Contribass *)
    (* Exibe na Tela *)
    LocalizaContrib;

    qryAux.close;
    qryAux.sql.clear;
    qryAux.sql.Add
      ('SELECT IDSERVASS'+
        ' FROM SERVCONTRIBASS '+
       ' WHERE (IDPLANASS = '+qryPrinc.FieldByName('IDPLANASS').AsString+') '+
         ' AND (IDCONTASS = '+qryContribAss.FieldByName('IDCONTASS').AsString+')');
    qryaux.open;
    if qryAux.IsEmpty then
      btnCons.enabled := false
    else
      btnCons.enabled := true;

    if qryContribAss.FieldByName('FLGCOBEVENTO').AsInteger = 0 then
      btnCons.enabled := false;

    if qryTpServAss.isEmpty then
    begin
       DBCkboxEvento.enabled := false;
       DBCkboxEvento.checked := false;
    end;

    rgpSel.Enabled := false;
    cmbContrib.enabled := false;
    EdNumVezes.enabled := false;

    Case qryContribAss.FieldByName('FLGCOBCARNE').AsInteger of
      0: rgFlgCobCarne.itemindex := 0;
      1: rgFlgCobCarne.itemindex := 1;
    end;

    if (qryContribAss.FieldByName('PAGADOR').AsString = 'P') then rgpSel.Visible := true;

    pgctrlDetalhe.ActivePage := tbshDetalhe;

    With qryContribAss do
    begin
      if FieldByName('PAGADOR').AsString = 'C' then
      begin
        rgpSel.itemindex := 1;
      end
      else
      begin
        rgpSel.itemindex := 0;
      end;
    end; {With}
    dbgrdDet.SendToBack;
    HabilitaPainel(pnlControlesDet, True);
    pnlControlesDet.BringToFront;
    pgctrlDetalhe.activepage := tbshDetalhe;
  end;
end;

procedure TfrmPlanAss.sbtnApagDetClick(Sender: TObject);
begin
  sbtnApagDet.Down:=False;
  If qryContribass.IsEmpty then Exit;

  sIdContass:= qryContribass.FieldByName('IDCONTASS').AsString;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add
     ('SELECT IDPLANASS,IDCONTASS,IDREGRA,IDPROVENTO,IDPESSOA,CODPORTFORMA,'+
             'IDTPPERIODICIDADE,PAGADOR,TEMPOCOBR,IDPROVENTOATRASO,'+
             'IDPROVENTODEVOL,PRIORIDADE,FLGCOBEVENTO,IDEMPRESA'+
       ' FROM CONTRIBASS'+
      ' WHERE (IDPLANASS ='+qryprinc.FieldByName('idplanass').AsString+')'+
        ' AND (IDCONTASS ='+sIdcontass+')');
  try
     qryAux.open;
  except
     raise;
  end;

  If qryAux.IsEmpty then Exit;

  iIdContrib := qryAux.FieldByName('IDCONTASS').AsInteger;

  idproventon:= qryAux.FieldByName('IDPROVENTO').AsString;
  idproventoa:= qryAux.FieldByName('IDPROVENTOATRASO').AsString;
  idproventod:= qryAux.FieldByName('IDPROVENTODEVOL').AsString;

  qryaux.close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDCONTASS'+
                 ' FROM CONTASS'+
                 ' WHERE (IDPLANASS ='+qryprinc.FieldByName('IDPLANASS').AsString+')'+
                 ' AND (IDCONTASS ='+sIdContass+')');
  try
     qryAux.open;
  except
     raise;
  end;

  If Not qryAux.IsEmpty then
  begin
    ShowMessage('A contribuição não pode ser apagada, por ter contribuintes relacionados a ela !');
    Exit;
  end;
  try
   If MsgDlg('Deseja realmente apagar a Contribuição?','Confirmação',
                 mtConfirmation,[mbYes, mbNo], 0) = mrYes then
   begin
     If not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;
     qryaux.close;
     qryaux.SQL.clear;
     qryaux.sql.add('DELETE CONTRIBPLANPREVA '+
                    'WHERE (IDPLANASS = '+qryprinc.FieldByName('IDPLANASS').AsString+
                    ') AND (IDCONTASS = '+sIdcontass+')');
     try
       qryAux.ExecSql;
     except
        dtmBaseDados.dbBaseDados.Rollback;
        MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
                'Erro',mtError,[mbOk,mbHelp],0);
        Abort;
     end;
     dtmBaseDados.dbBaseDados.Commit;

     With qryAux do
     begin
       If not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
       Close;
       Sql.clear;
       Sql.add('DELETE PLANASSTIPOPART '+
               'WHERE (IDPLANASS = '+qryprinc.FieldByName('IDPLANASS').AsString+
               ') AND (IDCONTASS = '+sIdcontass+')');
       try
         ExecSql;
       except
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
                 'Erro',mtError,[mbOk,mbHelp],0);
         Abort;
       end;
       dtmBaseDados.dbBaseDados.Commit;
     end; {With}

     With qryAux do
     begin
       If not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
       Close;
       Sql.clear;
       Sql.add('DELETE CONTRIBASS '+
                      'WHERE (IDPLANASS = '+qryprinc.FieldByName('IDPLANASS').AsString+
                      ') AND (IDCONTASS = '+sIdcontass+')');
       try
         ExecSql;
       except
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
                 'Erro',mtError,[mbOk,mbHelp],0);
         Abort;
       end;
       dtmBaseDados.dbBaseDados.Commit;
     end; {With}

     DeletaServContribAss;

     DeletaProvento;

     DeletaRubricaXPess;

     VoltaGrid;
     pgctrlDetalhe.ActivePage := tbshDetalhe;
  end;
  except
    raise;
  end;
end;

procedure TfrmPlanAss.sbtnApagarClick(Sender: TObject);
begin
   LimpaVar;
   ExcluiPlano:=True;
   qryAux.close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add
     ('SELECT IDPLANASS '+
       ' FROM PLANASS'+
      ' WHERE (IDPLANASS='+qryprinc.FieldByName('IDPLANASS').AsString+')'+
        ' AND (IDPLANASS IN (SELECT IDPLANASS '+
                              'FROM PLANPREVASS'+
                            ' WHERE (IDPLANASS='+qryprinc.FieldByName('IDPLANASS').AsString+')))'+
         ' OR (IDPLANASS IN (SELECT IDPLANASS'+
                             ' FROM CONTRIBASS '+
                             'WHERE (IDPLANASS='+qryprinc.FieldByName('IDPLANASS').AsString+')))'+
         ' OR (IDPLANASS IN (SELECT IDPLANASS'+
                             ' FROM SERVPLANASS'+
                            ' WHERE (IDPLANASS='+qryprinc.FieldByName('IDPLANASS').AsString+')))'+
         ' OR (IDPLANASS IN (SELECT IDPLANOASSIST'+
                          ' FROM HISTPATR'+
                         ' WHERE (IDPLANOASSIST='+qryprinc.FieldByName('IDPLANASS').AsString+')))'+
         ' OR (IDPLANASS IN (SELECT IDPLANASS'+
                             ' FROM PARTASS'+
                            ' WHERE (IDPLANASS='+qryprinc.FieldByName('IDPLANASS').AsString+')))');
   try
     qryAux.open;
   except
     raise;
   end;
   if not qryAux.isempty then
   begin
     Showmessage('O plano não pode ser apagado por estar relacionado com um plano previdenciário e / ou uma contribuição e /ou serviços !!!');
     ExcluiPlano:= false;
     ModSbtn(True,True,True,True,False);
     exit;
   end;

   sbtnApagar.Down := True;

   If ds.DataSet.isempty then
   begin
     ExcluiPlano:= False;
     Exit;
   end;
   If MsgDlg('Deseja realmente apagar o Plano Assistencial?','Confirmação',mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
   begin
     bbtnConfirmar.Click;
   end;
   ExcluiPlano:= false;
   dbgrdDet.applyselected;
end;

procedure TfrmPlanAss.qryServCmbBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if qryprinc.active then
  begin
    qryservcmb.ParamByName('IDPLANASS').AsInteger := qryprinc.FieldByName('IDPLANASS').AsInteger;
  end;
end;

procedure TfrmPlanAss.qryTpServAssBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  if qryprinc.active then
  begin
     qrytpservass.ParamByName('IDPLANASS').AsInteger := qryprinc.FieldByName('IDPLANASS').AsInteger;
  end;
end;

procedure TfrmPlanAss.qryPrincAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qryprinc.active then
  begin
    qryservcmb.close;
    qrytpservass.close;
    qrytpservass.open;
    qryservcmb.open;
    VoltaGrid;
  end;
end;

procedure TfrmPlanAss.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   listaux.Items.Clear;
   inseriuCont:= false;
   qryprinc.close;
   qryprinc.open;
   qryPrinc.Locate('IDPLANASS',iIdPlanass,[loCaseInsensitive,loPartialKey]);
   tbRegra.enabled := true;
   ListAux.Items.clear;
   LimpaVar;
   PreencheRegra;
   MostraCampos;
end;

procedure TfrmPlanAss.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryPrinc.Close;
  qryRegra.Close;
  qryContrib.Close;
  qryPortForm.Close;
  qryProvento.Close;
  qryProdAss.Close;
  qryFornServAss.Close;
end;

procedure TfrmPlanAss.btnConsClick(Sender: TObject);
begin
  inherited;
  if AlteraPlano then
  begin
     AbrirFormModal(frmCadSevContribass, TfrmCadSevContribass);
     if not frmcadsevcontribass.selecionou then
     begin
       DBCkboxevento.Checked := false;
     end;
  end;
end;

procedure TfrmPlanAss.cmbTipoRegraContribCloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryRegra do
  begin
    close;
    ParamByName('IDTIPOREGRA').asInteger := qryTipoRegra.FieldByname('IDTIPOREGRA').asInteger;
    open;
  end; {With}
  cmbRegraContrib.enabled := true;
end;

procedure TfrmPlanAss.cmbTipoRegra1CloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryRegra1 do
  begin
    close;
    ParamByName('IDTIPOREGRA').asInteger := qryTipoRegra1.FieldByname('IDTIPOREGRA').asInteger;
    open;
  end; {With}
  cmbRegra1.enabled := true;
end;

procedure TfrmPlanAss.cmbTipoRegra7CloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryRegra7 do
  begin
    close;
    ParamByName('IDTIPOREGRA').asInteger := qryTipoRegra7.FieldByname('IDTIPOREGRA').asInteger;
    open;
  end; {With}
  cmbRegra7.enabled := true;
end;

procedure TfrmPlanAss.cmbTipoRegra2CloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryRegra2 do
  begin
    close;
    ParamByName('IDTIPOREGRA').asInteger := qryTipoRegra2.FieldByname('IDTIPOREGRA').asInteger;
    open;
  end; {With}
  cmbRegra2.enabled := true;
end;

procedure TfrmPlanAss.cmbTipoRegra3CloseUp(Sender: TObject;
          LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  with qryRegra3 do
  begin
    close;
    ParamByName('IDTIPOREGRA').asInteger := qryTipoRegra3.FieldByname('IDTIPOREGRA').asInteger;
    open;
  end; {With}
  cmbRegra3.enabled := true;
end;

procedure TfrmPlanAss.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  LimpaVar;
  IncluiPlano:=True;
  with qryContribass do
  begin
    close;
    paramByName('IDPLANASS').asinteger := -1;
    open;
  end; {With}
  ModBbtn(True,True);
  sbtnInsDet.Enabled:=False;
  sbtnAltDet.Enabled:=False;
  sbtnApagDet.Enabled:=False;
  EdNome.Text:='';
  EdNumContrato.Text:='';
  EdOpcaoAident.Text:='';
  DblkIdFornecedor.Text:='';
  DblkIdProdass.Text:='';
  DblkCodPortForma.Text:='';
  CheckBoxCobDif.Checked:=False;
  CheckBoxAtivo.Checked:=False;
  DtInicVigencia.Date:=Date;
  DtInicCom.Date:=Date;
  cmbTipoRegra1.text := '';
  cmbRegra1.text := '';
  cmbRegra1.LookupValue:= '';
  cmbRegra1.enabled := true;

  cmbTipoRegra2.text := '';
  cmbRegra2.text := '';
  cmbRegra2.LookupValue:= '';
  cmbRegra2.enabled := true;

  cmbTipoRegra3.text := '';
  cmbRegra3.text := '';
  cmbRegra3.LookupValue:= '';
  cmbRegra3.enabled := true;

  cmbRegra4.text := '';
  cmbRegra4.LookupValue:= '';
  cmbRegra4.enabled := true;

  cmbRegra5.text := '';
  cmbRegra5.LookupValue:= '';
  cmbRegra5.enabled := true;

  cmbRegra6.text := '';
  cmbRegra6.LookupValue:= '';
  cmbRegra6.enabled := true;

  cmbTipoRegra7.text := '';
  cmbRegra7.text := '';
  cmbRegra7.LookupValue:= '';
  cmbRegra7.enabled := true;
  If (EdNome.Visible) and (EdNome.Enabled) then EdNome.SetFocus;
  AbreQryRegra;
end;

(* PREENCHE REGRAS *)
procedure TfrmPlanAss.PreencheRegra;
var iIdRegra: integer;
    sIdRegra, sIdTipoRegra: String;
{Sub}
Procedure BuscaRegra;
begin
  sIdTipoRegra:='0';
  sIdRegra:=AcNum(sIdRegra,'2');
  With qryTipoRegraAux do
  begin
    Close;
    ParamByName('IDREGRA').asInteger:=StrToIntDef(sIdRegra,0);
    Open;
    sIdTipoRegra:= FieldByName('IDTIPOREGRA').AsString;
    sIdRegra   := FieldByName('IDREGRA').AsString;
    sIdTipoRegra:=AcNum(sIdTipoRegra,'2');
    sIdRegra:=AcNum(sIdRegra,'2');
    iIdRegra:=StrToIntDef(sIdRegra,0);
  end; {with}
end; {Sub}

begin
  CmbTipoRegra1.LookupValue:='';
  CmbRegra1.LookupValue:='';
  CmbRegra1.Text:='';
  CmbTipoRegra2.LookupValue:='';
  CmbRegra2.LookupValue:='';
  CmbRegra2.Text:='';
  CmbTipoRegra3.LookupValue:='';
  CmbRegra3.LookupValue:='';
  CmbRegra3.Text:='';
  CmbRegra4.LookupValue:='';
  CmbRegra4.Text:='';
  CmbRegra5.LookupValue:='';
  CmbRegra5.Text:='';
  CmbRegra6.LookupValue:='';
  CmbRegra6.Text:='';
  CmbTipoRegra7.LookupValue:='';
  CmbRegra7.LookupValue:='';
  CmbRegra7.Text:='';

  (* REGRA ADMISSAO *)
  sIdRegra:=qryPrinc.FieldByName('IDREGRAADMISSAO').AsString;
  (* Busca Regra *)
  BuscaRegra;
  With qryRegra1 do
  begin
    Close;
    ParamByName('IDTIPOREGRA').asInteger:= StrToIntDef(sIdTipoRegra,0);
    Open;
    If Locate('IDREGRA',iIdRegra,[loCaseInsensitive,loPartialKey]) then
    begin
      CmbTipoRegra1.LookupValue:= FieldByName('IDTIPOREGRA').asString;
      CmbRegra1.LookupValue:= FieldByName('IDREGRA').asString;
      CmbRegra1.Text:=FieldByName('NOMEREGRA').AsString;
    end;
  end; {With}

  (* REGRA DE BENEFICIÁRIO *)
  sIdRegra:=qryPrinc.FieldByName('IDREGRABENEFICIA').AsString;
  (* Busca Regra *)
  BuscaRegra;
  With qryRegra2 do
  begin
    Close;
    ParamByName('IDTIPOREGRA').asInteger:= StrToIntDef(sIdTipoRegra,0);
    Open;
    If Locate('IDREGRA',iIdRegra,[loCaseInsensitive,loPartialKey]) then
    begin
      CmbTipoRegra2.LookupValue:= FieldByName('IDTIPOREGRA').asString;
      CmbRegra2.LookupValue:= FieldByName('IDREGRA').asString;
      CmbRegra2.Text:=FieldByName('NOMEREGRA').AsString;
    end;
  end; {With}

  (* REGRA DE CANCELAMENTO *)
  sIdRegra:=qryPrinc.FieldByName('IDREGRACANCELAME').AsString;
  (* Busca Regra *)
  BuscaRegra;
  With qryRegra3 do
  begin
    Close;
    ParamByName('IDTIPOREGRA').asInteger:= StrToIntDef(sIdTipoRegra,0);
    Open;
    If Locate('IDREGRA',iIdRegra,[loCaseInsensitive,loPartialKey]) then
    begin
      CmbTipoRegra3.LookupValue:= FieldByName('IDTIPOREGRA').asString;
      CmbRegra3.LookupValue:= FieldByName('IDREGRA').asString;
      CmbRegra3.Text:=FieldByName('NOMEREGRA').AsString;
    end;
  end; {With}

  (* REGRA DE DESISTENCIA *)
  sIdRegra:=qryPrinc.FieldByName('IDREGRADESISTENC').AsString;
  (* Busca Regra *)
  BuscaRegra;
  With qryRegra7 do
  begin
    Close;
    ParamByName('IDTIPOREGRA').asInteger:= StrToIntDef(sIdTipoRegra,0);
    Open;
    If Locate('IDREGRA',iIdRegra,[loCaseInsensitive,loPartialKey]) then
    begin
      CmbTipoRegra7.LookupValue:= FieldByName('IDTIPOREGRA').asString;
      CmbRegra7.LookupValue:= FieldByName('IDREGRA').asString;
      CmbRegra7.Text:=FieldByName('NOMEREGRA').AsString;
    end;
  end; {With}

  (* REGRA PAGAMENTO *)
  sIdRegra:=qryPrinc.FieldByName('IDREGRAPAGAMENTO').AsString;
  (* Busca Regra *)
  BuscaRegra;
  With qryRegra do
  begin
    Close;
    ParamByName('IDTIPOREGRA').asInteger:= StrToIntDef(sIdTipoRegra,0);
    Open;
    If Locate('IDREGRA',iIdRegra,[loCaseInsensitive,loPartialKey]) then
    begin
      CmbRegra4.LookupValue:= FieldByName('IDREGRA').asString;
      CmbRegra4.Text:=FieldByName('NOMEREGRA').AsString;
    end;
  end; {With}

  (* REGRA COMISSAO *)
  sIdRegra:=qryPrinc.FieldByName('IDREGRACOMISSAO').AsString;
  (* Busca Regra *)
  BuscaRegra;
  With qryRegra do
  begin
    Close;
    ParamByName('IDTIPOREGRA').asInteger:= StrToIntDef(sIdTipoRegra,0);
    Open;
    If Locate('IDREGRA',iIdRegra,[loCaseInsensitive,loPartialKey]) then
    begin
      CmbRegra5.LookupValue:= FieldByName('IDREGRA').asString;
      CmbRegra5.Text:=FieldByName('NOMEREGRA').AsString;
    end;
  end; {With}

  (* REGRA GERAL *)
  sIdRegra:=qryPrinc.FieldByName('IDREGRAGERAL').AsString;
  (* Busca Regra *)
  BuscaRegra;
  With qryRegra do
  begin
    Close;
    ParamByName('IDTIPOREGRA').asInteger:= StrToIntDef(sIdTipoRegra,0);
    Open;
    If Locate('IDREGRA',iIdRegra,[loCaseInsensitive,loPartialKey]) then
    begin
      CmbRegra6.LookupValue:= FieldByName('IDREGRA').asString;
      CmbRegra6.Text:=FieldByName('NOMEREGRA').AsString;
    end;
  end; {With}
end;

procedure TfrmPlanAss.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  LimpaVar;
  AlteraPlano:=True;
  ModSDet(True,True,True,False);
  cmbRegra1.enabled := true;
  cmbRegra2.enabled := true;
  cmbRegra3.enabled := true;
  cmbRegra4.enabled := true;
  cmbRegra5.enabled := true;
  cmbRegra6.enabled := true;
  cmbRegra7.enabled := true;
  ModBbtn(True,True);
end;

procedure TfrmPlanAss.sbtnProcurarClick(Sender: TObject);
begin
  { inherited; }
  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
  begin
     qryPrinc.Close;
     qryPrinc.Open;
     qryPrinc.Locate('IDPLANASS',MontaSelect.ValoresChave[0],
                                [loCaseInsensitive, loPartialKey]);
  end;
  MostraCampos;
  PreencheRegra;
end;

procedure TfrmPlanAss.spbLimpa1Click(Sender: TObject);
begin
  inherited;
  If (IncluiPlano)Or(AlteraPlano) then
  begin
    cmbTipoRegra1.Text:='';
    cmbTipoRegra1.LookupField:='';
    cmbRegra1.Text:='';
    cmbRegra1.LookupField:='';
  end;
end;

procedure TfrmPlanAss.spbLimpa4Click(Sender: TObject);
begin
  inherited;
  If (IncluiPlano)Or(AlteraPlano) then
  begin
    cmbTipoRegra7.Text:='';
    cmbTipoRegra7.LookupField:='';
    cmbRegra7.Text:='';
    cmbRegra7.LookupField:='';
  end;
end;

procedure TfrmPlanAss.spbLimpa2Click(Sender: TObject);
begin
  inherited;
  If (IncluiPlano)Or(AlteraPlano) then
  begin
    cmbTipoRegra2.Text:='';
    cmbTipoRegra2.LookupField:='';
    cmbRegra2.Text:='';
    cmbRegra2.LookupField:='';
  end;
end;

procedure TfrmPlanAss.spbLimpa3Click(Sender: TObject);
begin
  inherited;
  If (IncluiPlano)Or(AlteraPlano) then
  begin
    cmbTipoRegra3.Text:='';
    cmbTipoRegra3.LookupField:='';
    cmbRegra3.Text:='';
    cmbRegra3.LookupField:='';
  end;
end;

procedure TfrmPlanAss.spbLimpa5Click(Sender: TObject);
begin
  inherited;
  If (IncluiPlano)Or(AlteraPlano) then
  begin
    cmbRegra4.Text:='';
    cmbRegra4.LookupField:='';
  end;
end;

procedure TfrmPlanAss.spbLimpa6Click(Sender: TObject);
begin
  inherited;
  If (IncluiPlano)Or(AlteraPlano) then
  begin
    cmbRegra5.Text:='';
    cmbRegra5.LookupField:='';
  end;
end;

procedure TfrmPlanAss.spbLimpa7Click(Sender: TObject);
begin
  inherited;
  If (IncluiPlano)Or(AlteraPlano) then
  begin
    cmbRegra6.Text:='';
    cmbRegra6.LookupField:='';
  end;
end;

end.
