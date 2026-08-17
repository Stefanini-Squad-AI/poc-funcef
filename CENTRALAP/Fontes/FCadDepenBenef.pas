//------------------------------------------------------------------
// Sistema  .: ADMPREV
//------------------------------------------------------------------
// Alterações :
//   11/09/2000 - Alexandre Ramos
//                Inclusão do Casdastro de Nucleos Familiares
//   11/09/2000 - Alexandre Ramos
//                Acerto no Controle de Participacao dos dependentes no Beneficio
//   17/10/2000 - Alexandre Ramos
//                Caso o Dependente seja designado não obrida Data de Nascimento
//   18/10/2000 - Alexandre Ramos
//                Diversas Pedidas pela Camille
//   04/01/2001 - Marco Diniz
//                Facilidades para alterações na Conta Bancária de Dependente
//------------------------------------------------------------------------------
unit FCadDepenBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdbedit,  Mask, checklst, wwdblook, CMDBLookupCombo,
  DBGrids, CMProcuraSubTipo, CMProcura, TEdNum, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadDepenBenef = class(TfrmCadMestreDetalheCS)
    lblParticipante: TLabel;
    lblMatricula: TLabel;
    lblPatro: TLabel;
    lblInscricao: TLabel;
    lblPlanoPrev: TLabel;
    dbTNome: TDBText;
    dbTPatro: TDBText;
    dbTPlano: TDBText;
    dbTMatricula: TDBText;
    dbTInscricao: TDBText;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dsDepen: TwwDataSource;
    qryDepen: TwwQuery;
    updDepen: TUpdateSQL;
    tbsEndereco: TTabSheet;
    dsPF: TwwDataSource;
    qryPF: TwwQuery;
    updPF: TUpdateSQL;
    grpFiliacao: TGroupBox;
    lblNomePai: TLabel;
    dbeNomePai: TDBEdit;
    lblNomeMae: TLabel;
    dbeNomeMae: TDBEdit;
    dsPessoa: TwwDataSource;
    qryPessoa: TwwQuery;
    updPessoa: TUpdateSQL;
    lblNome: TLabel;
    dbeNome: TDBEdit;
    dbrgrpEstCivil: TDBRadioGroup;
    grpDataNasc: TGroupBox;
    lblDtNascimento: TLabel;
    lblTpSang: TLabel;
    dbdeDataNasc: TCMDateTimePicker;
    lblDataMorte: TLabel;
    dbdeDataMorte: TCMDateTimePicker;
    grpDependentes: TGroupBox;
    lblnDepIRRF: TLabel;
    lblNDepSalFam: TLabel;
    lblNTotalDep: TLabel;
    dbseNumDepIRRF: TwwDBSpinEdit;
    dbseNumDepSalF: TwwDBSpinEdit;
    dbseNumDepTot: TwwDBSpinEdit;
    dbeTipoSang: TDBEdit;
    dsEndPess: TwwDataSource;
    qryEndPess: TwwQuery;
    updEndPess: TUpdateSQL;
    lblPdCEP: TLabel;
    dbgrdEndPess: TwwDBGrid;
    pnlControlesEndPess: TPanel;
    lblNumero: TLabel;
    dbeNumero: TDBEdit;
    lblCEP: TLabel;
    lblPais: TLabel;
    lblEstado: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    cmbCidade: TCMDBLookupCombo;
    lblComplemento: TLabel;
    lblLogradouro: TLabel;
    dbeLogradouro: TDBEdit;
    qryDependencia: TwwQuery;
    dbrdgrpSexo: TDBRadioGroup;
    qrySeq: TwwQuery;
    edPaiDetalhe: TEdit;
    dbeComplemento: TDBEdit;
    dbeBairro: TDBEdit;
    dbeCEP: TDBEdit;
    qryCidade: TwwQuery;
    qryCidadeNOMECIDADE: TStringField;
    qryCidadeCODESTADO: TStringField;
    qryCidadeIDCIDADES: TFloatField;
    qryCidadeNOMEESTADO: TStringField;
    qryCidadeIDPAIS: TFloatField;
    qryCidadeNOMEPAIS: TStringField;
    GroupBox1: TGroupBox;
    dbeEstado: TDBEdit;
    dbePais: TDBEdit;
    dsCidade: TDataSource;
    tbsContaBanco: TTabSheet;
    dsCBanco: TwwDataSource;
    qryCBanco: TwwQuery;
    updCBanco: TUpdateSQL;
    dbgrdContaBanco: TwwDBGrid;
    tbsBeneficiario: TTabSheet;
    dbgrdBeneficiario: TwwDBGrid;
    pnlBeneficiario: TPanel;
    dsBenef: TwwDataSource;
    qryBenef: TwwQuery;
    updBenef: TUpdateSQL;
    grpbxResp: TGroupBox;
    grpbxRespDepen: TGroupBox;
    lkpcmbRespDepen: TCMDBLookupCombo;
    grpbxBeneficio: TGroupBox;
    grpbxPrioridade: TGroupBox;
    dbePrioridade: TDBEdit;
    grpbxPercentual: TGroupBox;
    dbePercentual: TDBEdit;
    MSResp: TMontaSelect;
    sbResponsavel: TSpeedButton;
    dbeResponsavel: TDBEdit;
    lkpcmbBeneficio: TCMDBLookupCombo;
    qryBeneficio: TwwQuery;
    qryBanco: TwwQuery;
    qryAgencia: TwwQuery;
    chkbxComercial: TCheckBox;
    chkbxEntrega: TCheckBox;
    chkbxCobranca: TCheckBox;
    chkbxCorrespondencia: TCheckBox;
    chkbxResidencial: TCheckBox;
    qrySitDependente: TwwQuery;
    TbNucleoFamiliar: TTabSheet;
    PnlNucleoFamiliar: TPanel;
    DbGrdNucleoFamiliar: TwwDBGrid;
    DsNucleoFam: TwwDataSource;
    QryNucleoFam: TwwQuery;
    UpdNucleoFam: TUpdateSQL;
    DbLkcRespNucleo: TwwDBLookupCombo;
    Lable1: TLabel;
    QryResponsavel: TwwQuery;
    QryNucleoFamIDNUCLEOFAMILIAR: TFloatField;
    QryNucleoFamIDRESPNUCLEO: TFloatField;
    QryNucleoFamResponsavel: TStringField;
    GroupBox2: TGroupBox;
    DbLkcBuscaNucleo: TCMDBLookupCombo;
    QryBuscaNucleo: TwwQuery;
    QryNucleoFamIDTITULAR: TFloatField;
    QryAux: TwwQuery;
    pnlControlesContaBanco: TPanel;
    rgrpTipoConta: TDBRadioGroup;
    dbgrpContaPref: TDBRadioGroup;
    dbgrpContaConj: TDBRadioGroup;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbeContaCorrente: TDBEdit;
    lkpcmbbxBanco: TwwDBLookupCombo;
    lkpcmbbxAgencia: TwwDBLookupCombo;
    edDigBanco: TEditNum;
    edDigAgencia: TEditNum;
    rdbProprio: TRadioButton;
    rdbOutro: TRadioButton;
    sbNovoResponsavel: TSpeedButton;
    qryInsResponsavel: TwwQuery;
    UpdInsResp: TUpdateSQL;
    UpdateSQL1: TUpdateSQL;
    wwQuery1: TwwQuery;
    UpdateSQL2: TUpdateSQL;
    wwQuery2: TwwQuery;
    UpdateSQL3: TUpdateSQL;
    wwQuery3: TwwQuery;
    GroupBox4: TGroupBox;
    lblSitDependente: TLabel;
    dblkpcmbSitDependente: TwwDBLookupCombo;
    lblNumSequencia: TLabel;
    dbeNumSequencia: TDBEdit;
    lblTipoDepen: TLabel;
    dblkpcmbTipoDependencia: TCMDBLookupCombo;
    GroupBox5: TGroupBox;
    dbchkbxDesignado: TDBCheckBox;
    dbchkbxFlgDepLegal: TDBCheckBox;
    dbchkbxFlgContaImpostoR: TDBCheckBox;
    dbchkbxContaSalarioF: TDBCheckBox;
    dbchkbxBeneficiario: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    Label1: TLabel;
    dbeMatricula: TDBEdit;
    dbedNomeEndereco: TDBEdit;
    lblPdLocal: TLabel;
(*====================================================================================================
  FIM    - Alterações feitas pelo Diniz
 ===================================================================================================== *)
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure qryPessoaBeforePost(DataSet: TDataSet);
    procedure qryDepenBeforePost(DataSet: TDataSet);
    procedure qryPFBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure qryEndPessBeforePost(DataSet: TDataSet);
    procedure tbcDetalheChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbResponsavelClick(Sender: TObject);
    procedure lkpcmbbxBancoChange(Sender: TObject);
    procedure qryBenefBeforePost(DataSet: TDataSet);
    procedure qryCBancoBeforePost(DataSet: TDataSet);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbchkbxDesignadoClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
(*====================================================================================================
  INÍCIO - Alterações feitas pelo Diniz
 ===================================================================================================== *)
    procedure edDigBancoExit(Sender: TObject);
    procedure lkpcmbbxBancoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure edDigAgenciaExit(Sender: TObject);
    procedure lkpcmbbxAgenciaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure rdbProprioClick(Sender: TObject);
    procedure sbNovoResponsavelClick(Sender: TObject);
(*====================================================================================================
  FIM    - Alterações feitas pelo Diniz
 ===================================================================================================== *)
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure qryCBancoAfterEdit(DataSet: TDataSet);
    procedure qryCBancoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    iSeq : integer;
    OpDetalhe : String;
    DataHoje  : TDateTime;
    sFiltroBenef : string;
    EstadoAnt : TDataSetState;
(*====================================================================================================
  INÍCIO - Alterações feitas pelo Diniz
 ===================================================================================================== *)
    FIDPESSOA     : String;

    FNOME         : String;
    FRAZAOSOCIAL  : String;
    FNUMDOCUMENTO : String;
    FTIPO         : String;

    FDATANASC : String;
    FSEXO     : String;
    FESTCIVIL : String;

    FRESPONSAVEL : String;

    FIDCBANCARIA      : String;
    FCONTACORRENTE    : String;
    FIDAGENCIA        : String;
    FFLGCONTAPREF     : String;
    FTIPOCONTA        : String;
    FFLGCONTACONJUNTA : String;

(*====================================================================================================
  FIM    - Alterações feitas pelo Diniz
 ===================================================================================================== *)
    Function ExcedeCemPorCento: boolean;  // by Alexandre - 31/08/2000

  public
    { Public declarations }
(*====================================================================================================
  INÍCIO - Alterações feitas pelo Diniz
 ===================================================================================================== *)
    property PIDPESSOA      : String read FIDPESSOA        write FIDPESSOA;
    property P1NOME         : String read FNOME            write FNOME;
    property P1RAZAOSOCIAL  : String read FRAZAOSOCIAL     write FRAZAOSOCIAL;
    property P1NUMDOCUMENTO : String read FNUMDOCUMENTO    write FNUMDOCUMENTO;
    property P1TIPO         : String read FTIPO            write FTIPO;

    property P2DATANASC : string read FDATANASC  write FDATANASC;
    property P2SEXO     : string read FSEXO      write FSEXO;
    property P2ESTCIVIL : string read FESTCIVIL  write FESTCIVIL;

    property SqlResponsavel : string read FResponsavel  write FResponsavel;

    property P3IDCBANCARIA      : string read FIDCBANCARIA      write FIDCBANCARIA;
    property P3CONTACORRENTE    : string read FCONTACORRENTE    write FCONTACORRENTE;
    property P3IDAGENCIA        : string read FIDAGENCIA        write FIDAGENCIA;
    property P3FLGCONTAPREF     : string read FFLGCONTAPREF     write FFLGCONTAPREF;
    property P3TIPOCONTA        : string read FTIPOCONTA        write FTIPOCONTA;
    property P3FLGCONTACONJUNTA : string read FFLGCONTACONJUNTA write FFLGCONTACONJUNTA;
 (*====================================================================================================
  FIM    - Alterações feitas pelo Diniz
 ===================================================================================================== *)

  end;

var
  frmCadDepenBenef: TfrmCadDepenBenef;

implementation

uses FPrincipal, UAdmPrev, UMensErro, UDataBase, UCalcDV, FTelaAut,
  FCadRespBenef, DBaseDados, FCadResponsa;

{$R *.DFM}

procedure TfrmCadDepenBenef.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then
     if dbeNome.CanFocus then dbeNome.SetFocus
  else if pgctrlDetalhe.ActivePage = tbsEndereco then
     if dbeLogradouro.CanFocus then dbeLogradouro.SetFocus
  else if pgctrlDetalhe.ActivePage = tbsContaBanco then
     if lkpcmbbxBanco.CanFocus then lkpcmbbxBanco.SetFocus
  else if pgctrlDetalhe.ActivePage = tbsBeneficiario then
     if dbeResponsavel.CanFocus then dbeResponsavel.SetFocus;

  OpDetalhe := '';
end;

procedure TfrmCadDepenBenef.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  edPaiDetalhe.Text := '';

  if MontaSelect.RetornouValor then
  begin
    qry.Close;
    if not qry.Prepared then qry.prepare;
    qry.ParamByName('IDPESSOA').Value    := StrToInt(MontaSelect.ValoresChave[0]);
    qry.ParamByName('IDPESSJUR').Value   := StrToInt(MontaSelect.ValoresChave[1]);
    qry.ParamByName('IDPLANOPREV').Value := StrToInt(MontaSelect.ValoresChave[2]);
    qry.ParamByName('SEQPROPOSTA').Value := StrToInt(MontaSelect.ValoresChave[3]);
    qry.Open;
// Alexandre - 27/10/2000 - Inicio
    qryDet.Close;
    if not qryDet.Prepared then qryDet.prepare;
    qryDet.ParamByName('IDTITULAR').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qryDet.Open;

    qryPessoa.Close;
    if not qryPessoa.Prepared then qryPessoa.prepare;
    qryPessoa.ParamByName('IDPESSOA').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qryPessoa.Open;

    qryPF.Close;
    if not qryPF.Prepared then qryPF.prepare;
    qryPF.ParamByName('IDPESSOA').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qryPF.Open;

    qryDepen.Close;
    if not qryDepen.Prepared then qryDepen.prepare;
    qryDepen.ParamByName('IDPESSOA').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qryDepen.Open;
// Alexandre - 27/10/2000 - Fim

    qryEndPess.Close;
    if not qryEndPess.Prepared then qryEndPess.prepare;
    qryEndPess.ParamByName('IDTITULAR').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qryEndPess.Open;

    qryCBanco.Close;
    if not qryCBanco.Prepared then qryCBanco.prepare;
    qryCBanco.ParamByName('IDTITULAR').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qryCBanco.Open;

    qryBenef.Close;
    if not qryBenef.Prepared then qryBenef.prepare;
    qryBenef.ParamByName('IDTITULAR').Value   := StrToInt(MontaSelect.ValoresChave[0]);
    qryBenef.Open;

    qryBeneficio.Close;
    if not qryBeneficio.Prepared then qryBeneficio.prepare;
    qryBeneficio.ParamByName('IDPLANOPREV').Value := StrToInt(MontaSelect.ValoresChave[2]);
    qryBeneficio.Open;

    qrySeq.Close;
    if not qrySeq.Prepared then qrySeq.prepare;
    qrySeq.ParamByName('IDTITULAR').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qrySeq.Open;
    iSeq := qrySeq.FieldByName('PROXNUMSEQ').AsInteger;
    qrySeq.Close;

// Augusto  11/09/00
// Abre Tabela de Nucleo Familiar, Buscando pelo Titular.
    QryNucleoFam.Close;
    if not QryNucleoFam.Prepared then QryNucleoFam.prepare;
    QryNucleoFam.ParamByName('IDTITULAR').AsInteger         := StrToInt(MontaSelect.ValoresChave[0]);
    QryNucleoFam.Open;
//--*
    edPaiDetalhe.Text := qryDet.FieldByName('NOME').AsString;
  end;
end;

procedure TfrmCadDepenBenef.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  edDigBanco.Text := '';
  edDigAgencia.Text := '';

  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
     inc (iSeq);
     dbeNumSequencia.Text := IntToStr(iSeq);

     qryDepen.Insert;
     qryPF.Insert;
     qryPessoa.Insert;
     EstadoAnt := qryDet.State;

     qryPF.FieldByName('FLGISENTOIRRF').AsInteger     := 1;
     qryPF.FieldByName('SEXO').AsString               := 'M';
     qryPF.FieldByName('ESTCIVIL').AsString           := 'S';
     qryPF.FieldByName('NUMDEPIRRF').AsInteger        := 0;
     qryPF.FieldByName('NUMDEPSALF').AsInteger        := 0;
     qryPF.FieldByName('NUMDEPTOT').AsInteger         := 0;
     qryDet.FieldByName('FLGDESIGNADO').AsInteger     := 0;
     qryDet.FieldByName('FLGDEPLEGAL').AsInteger      := 1;
     qryDet.FieldByName('FLGCONTAIMPOSTOR').AsInteger := 1;
     qryDet.FieldByName('FLGCONTASALARIOF').AsInteger := 1;
     qryDet.FieldByName('FLGBENEFICIARIO').AsInteger  := 1;
     qryDet.FieldByName('NUMSEQUENCIA').AsInteger     := iSeq;
     dbeNome.SetFocus;
  end;

  if pgctrlDetalhe.ActivePage = tbsEndereco then
  begin
     if qryEndPess.State <> dsInsert then qryEndPess.Insert;
     chkbxComercial.State       := cbUnchecked;
     chkbxResidencial.State     := cbUnchecked;
     chkbxEntrega.State         := cbUnchecked;
     chkbxCobranca.State        := cbUnchecked;
     chkbxCorrespondencia.State := cbUnchecked;
     dbeLogradouro.SetFocus;
  end;

  if pgctrlDetalhe.ActivePage = tbsContaBanco then
  begin
    lkpcmbbxBanco.Text := '';

    qryCBanco.FieldByName('TIPOCONTA').AsInteger        := 1;
    qryCBanco.FieldByName('FLGCONTAPREF').AsInteger     := 0;
    qryCBanco.FieldByName('FLGCONTACONJUNTA').AsString  := 'N';

    qryCBanco.FieldByName('FLGCONTAPREF').AsInteger     := 1; // Augusto 18/10/00

    lkpcmbbxBanco.SetFocus;
  end;

  if pgctrlDetalhe.ActivePage = tbsBeneficiario then
  begin
    qryBenef.FieldByName('PRIORIDADE').AsInteger := 0;
    qryBenef.FieldByName('PERCENTUAL').AsInteger := 100;
// Augusto 11/09/00
    QryBuscaNucleo.Close;
    QryBuscaNucleo.ParamByName('IDTITULAR').Value:=Qry.FieldByName('IDPESSOA').AsInteger;
    QryBuscaNucleo.Open;

(*====================================================================================================
  INÍCIO das Alterações feitas pelo Diniz
 ===================================================================================================== *)
    rdbProprio.Checked := True;
    rdbProprioClick(rdbProprio);
    qryBenef.FieldByname('IDRESPONSAVEL').AsString := qryDet.FieldByName('IDPESSOA').AsString;
    dbeResponsavel.Text := qryDet.FieldByName('NOME').AsString;
(*====================================================================================================
  FIM    das Alterações feitas pelo Diniz
 ===================================================================================================== *)
  end
end;

procedure TfrmCadDepenBenef.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    qryPessoa.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
    qryPessoa.Filtered := True;

    qryPF.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
    qryPF.Filtered := True;

    qryDepen.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
    qryDepen.Filtered := True;

    qryPessoa.Edit;
    qryPF.Edit;
    qryDepen.Edit;
  end;

  if pgctrlDetalhe.ActivePage = tbsEndereco then
  begin
    qryPessoa.Filter := 'IDPESSOA = ' + IntToStr(qryEndPess.FieldByName('IDPESSOA').AsInteger);
    qrypessoa.Filtered := True ;

    if (qryEndPess.FieldByName('IdEndereco').IsNull) then
    begin
       chkbxComercial.Checked       := false;
       chkbxResidencial.Checked     := false;
       chkbxEntrega.Checked         := false;
       chkbxCobranca.Checked        := false;
       chkbxCorrespondencia.Checked := false;
    end
    else
    begin
       chkbxComercial.Checked       := (qryPessoa.FieldByName('IdEndComercial').Value   = qryEndPess.FieldByName('IdEndereco').Value);
       chkbxResidencial.Checked     := (qryPessoa.FieldByName('IdEndResidencial').Value = qryEndPess.FieldByName('IdEndereco').Value);
       chkbxEntrega.Checked         := (qryPessoa.FieldByName('IdEndEntrega').Value     = qryEndPess.FieldByName('IdEndereco').Value) ;
       chkbxCobranca.Checked        := (qryPessoa.FieldByName('IdEndCobranca').Value    = qryEndPess.FieldByName('IdEndereco').Value);
       chkbxCorrespondencia.Checked := (qryPessoa.FieldByName('IdEndCorresp').Value     = qryEndPess.FieldByName('IdEndereco').Value);
    end;
  end;

  if pgctrlDetalhe.ActivePage = tbsContaBanco then
  begin

  if not qryCBanco.IsEmpty
      then begin
         edDigBanco.Text      := qryCBanco.FieldByName('NumBanco').AsString;
         edDigAgencia.Text    := qryCBanco.FieldByName('NumAgencia').AsString;
      end;
  end;

  if pgctrlDetalhe.ActivePage = tbsBeneficiario then
  begin
// Augusto 11/09/00
    QryBuscaNucleo.Close;
    QryBuscaNucleo.ParamByName('IDTITULAR').Value:=Qry.FieldByName('IDPESSOA').AsInteger;
    QryBuscaNucleo.Open;
    (*====================================================================================================
      INÍCIO das Alterações feitas pelo Diniz
     ===================================================================================================== *)
    if (dbeResponsavel.Text = qryDet.FieldByName('NOME').AsString) then begin
      (* O Responsável do Dependente É o próprio dependente *)
      rdbProprio.Checked := True;
      rdbOutro.Checked   := False;
      dbeResponsavel.Enabled  := False;
      dbeResponsavel.ReadOnly := True;
      dbeResponsavel.Color    := clBtnFace;
      sbResponsavel.Enabled   := False;
      sbNovoResponsavel.Enabled := False;
    end
    else begin
      (* O Responsável do Dependente É outra pessoa *)
      rdbProprio.Checked := False;
      rdbOutro.Checked   := True;
      dbeResponsavel.Enabled  := True;
      dbeResponsavel.ReadOnly := False;
      dbeResponsavel.Color    := clWindow;
      sbResponsavel.Enabled     := True;
      sbNovoResponsavel.Enabled := True;
      dbeResponsavel.Text := qryBenef.FieldbyName('RESPONSAVEL').AsString;
    end;
   (*====================================================================================================
     FIM    das Alterações feitas pelo Diniz
    ===================================================================================================== *)
  end;
// Caso já possua registros no histórico não
// deixa alterar o Nucleo
// Busca as Contribuicoes do Nucleo Familiar
  If FazQuery(QryAux,'SELECT IDCONTRIBUICAO FROM CM.CONTRIBPREVNUCLEO '+
                     'WHERE IDNUCLEOFAMILIAR = '+
                     IntToStr(QryBenef.FieldByName('IDNUCLEOFAMILIAR').AsInteger) )
  Then Begin
    DbLkcBuscaNucleo.Enabled:=False;
  End Else Begin
    DbLkcBuscaNucleo.Enabled:=True;
  End;
end;

procedure TfrmCadDepenBenef.CmeDetalheDelete(Sender: TObject);
begin
  if pgctrlDetalhe.ActivePage = tbsDet  then
  begin
    qryBenef.Filtered := False;
    qryBenef.Filter := '';
    qryBenef.First;
    While Not qryBenef.Eof Do
          if qryBenef.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryBenef.Delete
          else
              qryBenef.Next;

    qryCBanco.Filtered := False;
    qryCBanco.Filter := '';
    qryCBanco.First;
    While Not qryCBanco.Eof Do
          if qryCBanco.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryCBanco.Delete
          else
              qryCBanco.Next;

    qryEndPess.Filtered := False;
    qryEndPess.Filter := '';
    qryEndPess.First;
    While Not qryEndPess.Eof Do
          if qryEndPess.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryEndPess.Delete
          else
              qryEndPess.Next;

    While Not qryPessoa.Eof Do
          if qryPessoa.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryPessoa.Delete
          else
              qryPessoa.Next;

    While Not qryPF.Eof Do
          if qryPF.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryPF.Delete
          else
              qryPF.Next;

    While Not qryDepen.Eof Do
          if qryDepen.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryDepen.Delete
          else
              qryDepen.Next;
  end;

  inherited;
end;

procedure TfrmCadDepenBenef.CmeCadastroConfirma(Sender: TObject);
begin
  try
     //Replicar para as Qry's do dependente / menos a QryDet
    qryPessoa.Filtered := False;
    qryPessoa.Filter := '';

    qryPF.Filtered := False;
    qryPF.Filter := '';

    qryDepen.Filtered := False;
    qryDepen.Filter := '';

    qryEndPess.Filtered := False;
    qryEndPess.Filter := '';

    qryCBanco.Filtered := False;
    qryCBanco.Filter := '';

    qryBenef.Filtered := False;
    qryBenef.Filter := '';

// Augusto  11/09/00
// Incluisao do Nucleo Familair
    if OpDetalhe <> 'E'
    then AplicaAlteracoes([qryPessoa,qryPF,qryDepen,qryDet,qryEndPess,qryCBanco,qryBenef, QryNucleoFam, qryInsResponsavel])
    else AplicaAlteracoes([QryNucleoFam, qryBenef,qryCBanco,qryEndPess,qryDet, qryDepen, qryPF, qryPessoa]);
//-*
  except
    raise;
  end;
  OpDetalhe := '';

  qryEndPess.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryEndPess.Filtered := True ;

  qryCBanco.Filter   := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryCBanco.Filtered := True;

  sFiltroBenef := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
  sFiltroBenef := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);

  qryBenef.Filter   := sFiltroBenef;
  qryBenef.Filtered := True;

  inherited;
end; // CmeCadastro.Confirma(Self)

procedure TfrmCadDepenBenef.CmeDetalheConfirma(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if qryPessoa.State in [dsEdit, dsInsert] then qryPessoa.Post;
      if qryPF.State     in [dsEdit, dsInsert] then qryPF.Post;
      if qryDepen.State  in [dsEdit, dsInsert] then qryDepen.Post;
   end;
   inherited;
end; // CmeDetalhe.Confirma(Self)

procedure TfrmCadDepenBenef.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then
  Begin
     if qryDet.State in [dsEdit, dsInsert] then
     begin
       qryDet.FieldByName('IDPESSOA').AsInteger       := QryDepen.FieldByName('IDPESSOA').AsInteger;
       qryDet.FieldByName('IDTITULAR').AsInteger      := Qry.FieldByName('IDPESSOA').AsInteger;
       qryDet.FieldByName('NUMSEQUENCIA').AsInteger   := StrToInt(dbeNumSequencia.Text);
       qryDet.FieldByName('NOME').AsString            := dbeNome.Text;
       qryDet.FieldByName('TIPODEPENDENCIA').AsString := dblkpcmbTipoDependencia.Text;
     end
  end;
end;

procedure TfrmCadDepenBenef.qryPessoaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryPessoa.State = dsInsert
  then qryPessoa.FieldByName('IDPESSOA').AsInteger   := LeUltRegistro(nil,'PESSOA');

  qryPessoa.FieldByName('RAZAOSOCIAL').AsString := dbeNome.Text;
  qryPessoa.FieldByName('TIPO').AsString        := 'F';
end;

procedure TfrmCadDepenBenef.qryDepenBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryDepen.FieldByName('IDPESSOA').AsInteger     := qryPessoa.FieldByName('IDPESSOA').AsInteger;
  qryDepen.FieldByName('FLGDESIGNADO').AsInteger := qryDet.FieldByName('FLGDESIGNADO').AsInteger;
end;

procedure TfrmCadDepenBenef.qryPFBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryPF.FieldByName('IDPESSOA').AsInteger := qryPessoa.FieldByName('IDPESSOA').AsInteger;
end;

procedure TfrmCadDepenBenef.bbtnOkDetClick(Sender: TObject);
var
  i : integer;
begin

  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    if dbeNome.Text = '' then
    begin
      MsgDlg('Nome não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      dbeNome.SetFocus;
      Abort;
    end;

    if dbrdgrpSexo.ItemIndex = -1 then
    begin
      MsgDlg('Sexo não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      dbrdgrpSexo.ItemIndex := 0;
      Abort;
    end;
// Caso Dependente seja Designado não obriga Datas de Nascimento
// Augusto 17/10/00
    If dbchkbxDesignado.Checked = False Then Begin
      if dbdeDataNasc.Text = '' then
      begin
        MsgDlg('Data de Nascimento não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
        dbrdgrpSexo.SetFocus;
        Abort;
      end;

      if dbdeDataNasc.Date > DataHoje then
      begin
        MsgDlg('Data de Nascimento maior que a data de hoje.','Erro',mtError,[mbOk,mbHelp],0);
        dbrdgrpSexo.SetFocus;
        Abort;
      end;
    End;

    if dblkpcmbTipoDependencia.Text = '' then
    begin
      MsgDlg('Tipo de Dependência não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbTipoDependencia.SetFocus;
      Abort;
    end;

  end
  else if pgctrlDetalhe.ActivePage = tbsEndereco then
  begin

  end
  else if pgctrlDetalhe.ActivePage = tbsContaBanco then
  begin
    if Trim(lkpcmbbxBanco.Text) = '' then
    begin
     MsgDlg('Banco da Conta Bancária não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     lkpcmbbxBanco.SetFocus;
     Abort;
    end;

    if Trim(lkpcmbbxAgencia.Text) = '' then
    begin
      MsgDlg('Agência da Conta Bancária não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
      lkpcmbbxAgencia.SetFocus;
      Abort;
    end;

    if Trim(dbeContaCorrente.Text) = '' then
    begin
      MsgDlg('Conta Corrente não preenchida. ','Erro',mtError,[mbOk,mbHelp],0);
      dbeContaCorrente.SetFocus;
      Abort;
    end;

    CalculaDV.TipoConta  := qryCBanco.FieldByName('TIPOCONTA').AsInteger;
    if not CalculaDV.ValidaConta(Trim(qryBanco.FieldByName('NumBanco').AsString),
                            Trim(qryAgencia.FieldByName('numagencia').AsString),
                            Trim(dbeContaCorrente.Text),
                            True)
    then Abort;

  end
  else if pgctrlDetalhe.ActivePage = tbsBeneficiario then
  begin
    if Trim(lkpcmbBeneficio.Text) = '' then
    begin
     MsgDlg('Benefício não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     lkpcmbBeneficio.SetFocus;
     Abort;
    end;

    if Trim(dbePrioridade.Text) = '' then
    begin
      MsgDlg('Prioridade não preenchida. ','Erro',mtError,[mbOk,mbHelp],0);
      dbePrioridade.SetFocus;
      Abort;
    end;

    if Trim(dbePercentual.Text) = '' then
    begin
      MsgDlg('Percentual não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
      dbePercentual.SetFocus;
      Abort;
    end;

    If ExcedeCemPorCento then begin
      MsgDlg('Valor excede o percentual máximo para esse benefício', 'Erro',mtError,[mbOk],0);
      QryBenef.FieldByName('PERCENTUAL').AsInteger :=
        QryBenef.FieldByName('PERCENTUAL').OldValue;
// Volta o Valor, Confirma e Reedita
      qryBenef.Post;
      qryBenef.Edit;
      dbePercentual.SetFocus;
      Exit;
    end;
  end

// Augusto 11/09/00
// Controle da pasta de Nucleo Familiar
  else if pgctrlDetalhe.ActivePage = TbNucleoFamiliar then begin
// Testa Campos
    If Trim(DbLkcRespNucleo.Text) = '' Then Begin
      MsgDlg('Responsável não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      DbLkcRespNucleo.SetFocus;
      Exit;
    End;
// Caso Incluindo Gera Sequencial e Guarda o Titular
    If QryNucleoFam.State in [DsInsert] Then Begin
      QryNucleoFam.FieldByName('IDNUCLEOFAMILIAR').AsInteger:= LeUltRegistro(Nil,'NUCLEOFAMILIAR');
      QryNucleoFam.FieldByName('IDTITULAR').AsInteger       := Qry.FieldByName('IDPESSOA').AsInteger;
    End;
  end;
//-*
  inherited;
end;

procedure TfrmCadDepenBenef.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  if OpDetalhe = 'E'
  then begin
     MsgDlg('As operações de exclusão devem ser confirmadas antes desta operação. Verifique. ','Erro',mtError,[mbOk],0);
     Abort;
  end;
  OpDetalhe := 'I';
end;

procedure TfrmCadDepenBenef.sbtnAltDetClick(Sender: TObject);
begin
   If qryCBanco.Active = True Then Begin
    qryAgencia.Close;
    qryAgencia.ParamByName('pIdBanco').AsString :=
      qryCBanco.FieldbyName('IDBANCO').AsString;
    qryAgencia.Open;
  End;
  
  inherited;
  if OpDetalhe = 'E'
  then begin
     MsgDlg('As operações de exclusão devem ser confirmadas antes desta operação. Verifique. ','Erro',mtError,[mbOk],0);
     Abort;
  end;
  OpDetalhe := 'A';
end;

procedure TfrmCadDepenBenef.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  if (OpDetalhe <> 'E') and (qryDet.State in [dsInsert, dsEdit])
  then begin
     MsgDlg('As operações de inclusão/alteração devem ser confirmadas antes desta operação. Verifique. ','Erro',mtError,[mbOk],0);
     Abort;
  end;
  OpDetalhe := 'E';
end;

procedure TfrmCadDepenBenef.qryEndPessBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryEndPess.FieldByname('IDPAIS').AsInteger    := qryCidade.FieldByName('IDPAIS').AsInteger;
  qryEndPess.FieldByname('NOMECIDADE').AsString := cmbCidade.Text;

  if qryEndPess.State in [dsInsert,dsEdit] then
  begin
    qryEndPess.FieldByName('IdENDERECO').AsInteger := LeultRegistro(nil,'ENDPESS');
    qryEndPess.FieldByName('IDPESSOA').AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;

    With qryPessoa do
    begin
     Filter := 'IDPESSOA = ' + IntToStr(qryEndPess.FieldByName('IDPESSOA').AsInteger);
     Filtered := True ;
     Edit;
     if chkbxComercial.Checked then
        FieldByName('IDENDCOMERCIAL').AsInteger := qryEndPess.FieldByName('IdENDERECO').AsInteger;

     if chkbxResidencial.Checked then
        FieldByName('IDENDRESIDENCIAL').AsInteger := qryEndPess.FieldByName('IdENDERECO').AsInteger;

     if chkbxEntrega.Checked then
        FieldByName('IDENDENTREGA').AsInteger := qryEndPess.FieldByName('IdENDERECO').AsInteger;

     if chkbxCobranca.Checked then
        FieldByName('IDENDCOBRANCA').AsInteger := qryEndPess.FieldByName('IdENDERECO').AsInteger;

     if chkbxCorrespondencia.Checked then
        FieldByName('IDENDCORRESP').AsInteger := qryEndPess.FieldByName('IdENDERECO').AsInteger;
     Post;
    end;
  end;

end;

procedure TfrmCadDepenBenef.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  if not qryDet.Active then
     Exit;

  edPaiDetalhe.Text := qryDet.FieldByName('NOME').AsString;

  //Filtra os endereços do dependente selecionado, a query de endereços traz todos os
  //dependentes.
  //Na hora de gravar tirar o filtro.

  qryEndPess.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryEndPess.Filtered := True ;

  qryCBanco.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryCBanco.Filtered := True;

  sFiltroBenef := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
  sFiltroBenef := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryBenef.Filter := sFiltroBenef;
  qryBenef.Filtered := True;

// Augusto  18/09/00
// Abre Tabela de Nucleo Familiar, Buscando pelo Titular.
  QryNucleoFam.Close;
  if not QryNucleoFam.Prepared then QryNucleoFam.prepare;
  QryNucleoFam.ParamByName('IDTITULAR').AsInteger := Qry.FieldByName('IDPESSOA').AsInteger;
  QryNucleoFam.Open;
//--*

end;

procedure TfrmCadDepenBenef.FormCreate(Sender: TObject);
begin
  inherited;
  CalculaDV := TCalcDV.Create;
  DataHoje := Date;
end;

procedure TfrmCadDepenBenef.sbResponsavelClick(Sender: TObject);
begin
  inherited;
  MSResp.Executar;
  if MSResp.RetornouValor then
  begin
     qryBenef.FieldByname('IDRESPONSAVEL').AsString := MSResp.ValoresChave[0];
     dbeResponsavel.Text := MSResp.ValoresChave[2];
  end;
end;

procedure TfrmCadDepenBenef.lkpcmbbxBancoChange(Sender: TObject);
begin
  inherited;
  qryAgencia.Close;
  if not qryAgencia.Prepared then qryAgencia.prepare;
  qryAgencia.ParamByName('pIDBANCO').AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
  qryAgencia.Open;
end;

procedure TfrmCadDepenBenef.qryBenefBeforePost(DataSet: TDataSet);
begin
  inherited;
  qryBenef.FieldByName('IDTITULAR').AsInteger   := StrToInt(MontaSelect.ValoresChave[0]);
  qryBenef.FieldByName('IDPESSOA').AsInteger    := qryDet.FieldByName('IDPESSOA').AsInteger;
  qryBenef.FieldByName('IDPLANOPREV').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;
  qryBenef.FieldByName('IDPESSJUR').AsInteger   := qry.FieldByName('IDPESSJUR').AsInteger;
  qryBenef.FieldByName('IDBENEFICIO').AsInteger := qryBeneficio.FieldByName('IDBENEFICIO').AsInteger;
  qryBenef.FieldByName('SEQPROPOSTA').AsInteger := 1;

  qryBenef.FieldByName('RESPONSAVEL').AsString  := dbeResponsavel.Text;
  qryBenef.FieldByName('BENEFICIO').AsString    := qryBeneficio.FieldByName('NOME').AsString;
  qryBenef.FieldByName('DESCRICAO').AsString    := lkpcmbRespDepen.Text;

end;

procedure TfrmCadDepenBenef.qryCBancoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryCBanco.State = dsInsert then
  begin
    qryCBanco.FieldByName('IdCBANCARIA').AsInteger := LeultRegistro(nil,'CONTABANCARIA');
  end;

  qryCBanco.FieldByName('IDPESSOA').AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;
  qryCBanco.FieldByName('BANCO').AsString     := qryBanco.FieldByName('BANCO').AsString;
  qryCBanco.FieldByName('AGENCIA').AsString   := qryAgencia.FieldByName('AGENCIA').AsString;
end;

procedure TfrmCadDepenBenef.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryDet.Active then
     Exit;

  edPaiDetalhe.Text := qryDet.FieldByName('NOME').AsString;

  //Filtra os endereços do dependente selecionado, a query de endereços traz todos os
  //dependentes.
  //Na hora de gravar tirar o filtro.
  qryEndPess.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryEndPess.Filtered := True ;

  qryCBanco.Filter := 'IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryCBanco.Filtered := True;

  sFiltroBenef := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
  sFiltroBenef := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);
  qryBenef.Filter := sFiltroBenef;
  qryBenef.Filtered := True;
end;

procedure TfrmCadDepenBenef.bbtnCancelarDetClick(Sender: TObject);
begin

// Caso Inserindo e Tenha dado Erro Exclui Registro
  If (OpDetalhe = 'I') And (QryBenef.State in [DsEdit]) then begin
    QryBenef.Delete;
  End;

  inherited;

  If pgctrlDetalhe.ActivePage = tbsContaBanco Then
  begin

    If qryCBanco.UpdatesPending Then Begin
      qryCBanco.ApplyUpdates;
      qryCBanco.CommitUpdates;
    End;
  end;

  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    if EstadoAnt = dsInsert then
    begin
      dec(iseq);
      EstadoAnt := qryDet.State;
    end;
    qryPessoa.Cancel;
    qryPF.Cancel;
    qryDepen.Cancel;
  end;

  if pgctrlDetalhe.ActivePage = tbsBeneficiario then
  begin

    qryBenef.Filtered := False;
    qryBenef.Filter := '';

    sFiltroBenef    := 'IDTITULAR = ' + IntToStr(qryDet.FieldByName('IDTITULAR').AsInteger);
    sFiltroBenef    := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(qryDet.FieldByName('IDPESSOA').AsInteger);

    qryBenef.Filter := sFiltroBenef;
    qryBenef.Filtered := True;
  end;
end;

procedure TfrmCadDepenBenef.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  bbtnCancelarDet.Click;
end;

//******************************************************************************
// Testa se Total de Participacao dos Dependentes no Beneficio passou de 100%
Function TfrmCadDepenBenef.ExcedeCemPorCento:boolean;
Var
  iIDTitular, iIDBeneficiario,
  iIDBeneficio, iBeneficio, TotPercent : integer;
begin
  Result          := False;
// Guarda Dados
  iIDTitular      := qryDet.FieldByName('IdTitular').AsInteger;
  iIDBeneficiario := qryDet.FieldByName('IdPessoa').AsInteger;
  iIDBeneficio    := qryBenef.FieldByName('IdBeneficio').AsInteger;
  iBeneficio      := qryBenef.FieldByName('IdBeneficio').AsInteger;
  TotPercent      := 0;

// Cancela e Altera Filtro da Consulta
  qryBenef.Filtered := False;
  qryBenef.Filter   := '';

// Monta novo Filtro por Beneficio
  sFiltroBenef := 'IDTITULAR = ' + IntToStr(iIDTitular);
  sFiltroBenef := sFiltroBenef + ' AND IDBENEFICIO = ' + IntToStr(iIDBeneficio);

  qryBenef.Filter   := sFiltroBenef;
  qryBenef.Filtered := True;

// Vare a Consulta somando os percentuais de participacao
  qryBenef.First;
  While not qryBenef.EOF do begin
    if (qryBenef.FieldByName('IdBeneficio').AsInteger = iBeneficio) then begin
// Soma Percentuais
      TotPercent := TotPercent + qryBenef.FieldByName('Percentual').AsInteger;
// Caso Ultrapasse 100% sai Fora
      if TotPercent > 100 then begin
        Result := True;
        Break;
      end;
    end;
// Proximo Registro
    qryBenef.Next;
  end;

// Cancela e Altera Filtro da Consulta
  qryBenef.Filtered := False;
  qryBenef.Filter   := '';

// Volta Filtro Antigo
  sFiltroBenef := 'IDTITULAR = ' + IntToStr(iIDTitular);
  sFiltroBenef := sFiltroBenef + ' AND IDPESSOA = ' + IntToStr(iIDBeneficiario);

  qryBenef.Filter := sFiltroBenef;
  qryBenef.Filtered := True;

// Volta ao Registro Antigo
  qryBenef.Locate('IDPESSOA; IDBENEFICIO',
                  VarArrayOf([iIDBeneficiario, IBeneficio]),[]);
// Reedita a Consulta e Altera o Valor
  qryBenef.Edit;
end;

procedure TfrmCadDepenBenef.FormShow(Sender: TObject);
begin
  inherited;
// Augusto - 11/09/00
// Abre Tabela
  QryResponsavel.Open;
   sbtnAlterar.Enabled := false;
   sbtnAlterar.Visible := True;


    // Limpa os campos da Conta Bancária
  if qryCBanco.State in [dsInsert]
  then begin
     edDigBanco.Text := '';
     edDigAgencia.Text := '';
     end;
//-*
end;

procedure TfrmCadDepenBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 // Augusto - 11/09/00
// Fecha Tabela
  QryNucleoFam.Close;
  QryResponsavel.Close;
  Try
    CalculaDV.Free;
  Except
  End;

  inherited;
//-*
end;

procedure TfrmCadDepenBenef.bbtnConfirmarClick(Sender: TObject);
begin
// Caso Editando/Inserindo Pede Confirmacao antes de Sair
  If QryBenef.State in [DsInsert, DsEdit] Then Begin
    MsgDlg('Detalhes não foram confirmados.','Mensagem do Sistema ',
            mtConfirmation,[mbOk],0);
    Exit;
  End;

  inherited;
end;

procedure TfrmCadDepenBenef.dbchkbxDesignadoClick(Sender: TObject);
begin
  inherited;
// Caso Designado tipo dependencia = Outros
// Augusto 17/10/00
  If dbchkbxDesignado.Checked = True Then Begin
    dblkpcmbTipoDependencia.Text := 'Outros';
    dblkpcmbTipoDependencia.PerformSearch; 
  End Else Begin
    dblkpcmbTipoDependencia.LookupValue:='';
  End; 
end;

procedure TfrmCadDepenBenef.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := True;
  sbtnAlterar.Visible := True;
end;

(*====================================================================================================
  INÍCIO das Alterações feitas pelo Diniz

  1. Alterações no TabSheet - tbsContaBanco
     Inclusões de TEditNum para Banco Nº e Agência Nº
 ===================================================================================================== *)

procedure TfrmCadDepenBenef.edDigBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigBanco.Text) = '' then Exit;
  if qryBanco.Locate('NumBanco',Trim(edDigBanco.Text),[loCaseInsensitive, loPartialKey])
  then begin
     lkpcmbbxBanco.Text := qryBanco.FieldByName('Banco').AsString;
     lkpcmbbxBanco.PerformSearch;
     qryAgencia.Close;
     qryAgencia.ParamByName('pIDBANCO').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
     qryAgencia.Open;
     lkpcmbbxAgencia.OnCloseUp(self,qryBanco,nil,false)
  end;
end;

procedure TfrmCadDepenBenef.edDigAgenciaExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigAgencia.Text) = '' then Exit;
  if qryAgencia.Locate('NumAgencia',Trim(edDigAgencia.Text),[loCaseInsensitive, loPartialKey])
  then begin
     lkpcmbbxAgencia.Text := qryAgencia.FieldByName('Agencia').AsString;
     lkpcmbbxAgencia.PerformSearch;
     lkpcmbbxAgencia.OnCloseUp(self,qryAgencia,nil,false);  //Lise
  end;
end;

procedure TfrmCadDepenBenef.lkpcmbbxAgenciaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  edDigAgencia.Text := qryAgencia.FieldByName('NUMAGENCIA').AsString;
end;

procedure TfrmCadDepenBenef.lkpcmbbxBancoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  
  inherited;
  qryCBanco.FieldbyName('BANCO').AsString := qryBanco.FieldByName('BANCO').AsString;
  edDigAgencia.Text := '';
  lkpcmbbxAgencia.Text := '';

  qryAgencia.Close;   //Lise
  qryAgencia.ParamByName('pIDBANCO').AsString := qryBanco.FieldbyName('IDPESSOA').AsString;
  qryAgencia.Open;

  edDigBanco.Text := IntToStr(qryBanco.FieldbyName('NUMBANCO').AsInteger);
end;

procedure TfrmCadDepenBenef.rdbProprioClick(Sender: TObject);
begin
  inherited;
  if rdbProprio.Checked then begin
    (* O Responsável do Dependente É o próprio dependente *)
    rdbOutro.Checked := False;
    dbeResponsavel.Enabled  := False;
    dbeResponsavel.ReadOnly := True;
    dbeResponsavel.Color    := clBtnFace;
    sbResponsavel.Enabled   := False;
    sbNovoResponsavel.Enabled := False;
    qryBenef.FieldByname('IDRESPONSAVEL').AsString := qryDet.FieldByName('IDPESSOA').AsString;
    dbeResponsavel.Text := qryDet.FieldByName('NOME').AsString;
  end
  else begin
    (* O Responsável do Dependente É outra pessoa *)
    rdbProprio.Checked := False;
    dbeResponsavel.Enabled  := True;
    dbeResponsavel.ReadOnly := False;
    dbeResponsavel.Color    := clWindow;
    sbResponsavel.Enabled   := True;
    sbNovoResponsavel.Enabled := True;
    qryBenef.FieldByname('IDRESPONSAVEL').AsString := '';
    dbeResponsavel.Text := '';
  end;
end;

procedure TfrmCadDepenBenef.sbNovoResponsavelClick(Sender: TObject);
begin
  inherited;
  // Camille - REFEr - 12.02.2001
  iIdResponsavelGeral := -1;

  AbrirFormModal(frmCadResponsa,TfrmCadResponsa);

  if iIdResponsavelGeral > 0
  then begin
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT NOME FROM PESSOA WHERE IDPESSOA = '+IntToStr(iIdResponsavelGeral));
        Open;
        qryBenef.FieldByname('IDRESPONSAVEL').AsInteger := iIdResponsavelGeral;
        dbeResponsavel.Text                             := FieldByName('Nome').AsString;
        Close;
        iIdResponsavelGeral                             := -1;
     end;
  end;
end;

(*====================================================================================================
  FIM das Alterações feitas pelo Diniz
 ===================================================================================================== *)


procedure TfrmCadDepenBenef.qryCBancoAfterEdit(DataSet: TDataSet);
begin
  inherited;
   edDigBanco.Text   := qryBanco.FieldByName('NumBanco').AsString;
  edDigAgencia.Text := qryAgencia.FieldByName('NumAgencia').AsString;
end;


procedure TfrmCadDepenBenef.qryCBancoAfterScroll(DataSet: TDataSet);
begin
   inherited;
  if not qryAgencia.Active then Exit;
  if (Trim(lkpcmbbxAgencia.Text) = '') or (edDigAgencia.Text <> '') then Exit;

  edDigAgencia.Text := qryAgencia.FieldByName('NumAgencia').AsString;

end;

end.

