unit FCadDepenBenef;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Hugo Luna
// Data        : 25/10/2007
// Rotina      : bbtnInscrever e bbtnCancInscr
// Pendência   : 25507 - reabertura
// Descricao   : Retirando check para inscrição e cancelamento de Beneficiário no Plano Assistencial e
//               acrescentando botão de Inscrição e Cancelamento.
//------------------------------------------------------------------------------
// Autor(a)    : Hugo Luna
// Data        : 24/10/2007
// Rotina      : bbtnConfirmar
// Pendência   : 25507 - reabertura
// Descricao   : Acrescentando filtro na Query qry para pegar o plano correto.
//               Acrescentando a criação do form frmCancBenefAss na função CancelaBenefPlanAss
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 05/06/2007
// Rotina      : InscreveBenefPlanAss e Interface
// Pendência   : 25507
// Descricao   : Ao incluir um dependente como beneficiário de seguro aparece
//   mensagem de erro QryEndPess inválida.
//   Ajustar botão "Procurar" de pessoa para mostrar plano assistencial. (DFM)
//   Ajuste em alguns updatesql que continham update em campos chave. (DFM)
//------------------------------------------------------------------------------
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
//   27/10/2003 - Fernando
//                P. 15241
//                P. 15501
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdbedit, Mask, checklst, wwdblook, CMDBLookupCombo,
  DBGrids, CMProcuraSubTipo, CMProcura, TEdNum, Wwdbspin,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList,
  Wwdotdot, Wwdbcomb, URegra, uCMTypes;

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
    grpDataNasc: TGroupBox;
    lblDtNascimento: TLabel;
    lblTpSang: TLabel;
    lblDataMorte: TLabel;
    lblNumSequencia: TLabel;
    dbeNumSequencia: TDBEdit;
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
    dblkpcmbTipoDependencia: TCMDBLookupCombo;
    lblTipoDepen: TLabel;
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
    dsCBanco: TwwDataSource;
    qryCBanco: TwwQuery;
    updCBanco: TUpdateSQL;
    dsBenef: TwwDataSource;
    qryBenef: TwwQuery;
    updBenef: TUpdateSQL;
    MSResp: TMontaSelect;
    qryBeneficio: TwwQuery;
    qryBanco: TwwQuery;
    qryAgencia: TwwQuery;
    chkbxComercial: TCheckBox;
    chkbxEntrega: TCheckBox;
    chkbxCobranca: TCheckBox;
    chkbxCorrespondencia: TCheckBox;
    chkbxResidencial: TCheckBox;
    lblSitDependente: TLabel;
    dblkpcmbSitDependente: TwwDBLookupCombo;
    qrySitDependente: TwwQuery;
    DsNucleoFam: TwwDataSource;
    QryNucleoFam: TwwQuery;
    UpdNucleoFam: TUpdateSQL;
    QryResponsavel: TwwQuery;
    QryNucleoFamIDNUCLEOFAMILIAR: TFloatField;
    QryNucleoFamIDRESPNUCLEO: TFloatField;
    QryNucleoFamResponsavel: TStringField;
    QryBuscaNucleo: TwwQuery;
    QryNucleoFamIDTITULAR: TFloatField;
    QryAux: TwwQuery;
    qryInsResponsavel: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    dbTPlanassist: TDBText;
    dsInsResp: TwwDataSource;
    UpdInsResp: TUpdateSQL;
    Label3: TLabel;
    dbcEstCivil: TwwDBComboBox;
    dtpDataCadastro: TwwDBDateTimePicker;
    dtpDataNasc: TwwDBDateTimePicker;
    dtpDataMorte: TwwDBDateTimePicker;
    tbsBeneficios: TTabSheet;
    RegraInscBenef: TRegra;
    qryRegraInscBenef: TwwQuery;
    RegraCancBenef: TRegra;
    qryRegraCancBenef: TwwQuery;
    updBenefAss: TUpdateSQL;
    dsBenefAss: TwwDataSource;
    qryBenefAss: TwwQuery;
    qryContAss: TwwQuery;
    dsContAss: TwwDataSource;
    updContAss: TUpdateSQL;
    qryNucleo: TwwQuery;
    pnlControleBfciarioTitAss: TPanel;
    dbgrdBfciarioTitAss: TwwDBGrid;
    Label4: TLabel;
    edtTotalBenef: TEdit;
    Label5: TLabel;
    edtPercJaDist: TEdit;
    Label6: TLabel;
    dbePercentual: TwwDBEdit;
    qryBfciario: TwwQuery;
    dsBfciario: TwwDataSource;
    updBfciario: TUpdateSQL;
    GroupBox3: TGroupBox;
    bbtnInscrever: TButton;
    bbtnCancInscr: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblSituacao: TLabel;
    lblDtInscricao: TLabel;
    lblDtCanc: TLabel;
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
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lkpcmbbxBancoChange(Sender: TObject);
    procedure qryCBancoBeforePost(DataSet: TDataSet);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbsBeneficiarioExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure dbePercentualExit(Sender: TObject);
    procedure bbtnInscreverClick(Sender: TObject);
    procedure bbtnCancInscrClick(Sender: TObject);
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

    OperacaoDetalhe   : TOperacao;

    Function InscreveBenefPlanAss : Boolean;
    Function CancelaBenefPlanAss : Boolean;
    Procedure AtualizaContAssDep(piFlgAtivo : Integer);  // 0 - Desassocia contribuições  1 - Associa contribuições

(*====================================================================================================
  FIM    - Alterações feitas pelo Diniz
 ===================================================================================================== *)
   // Function ExcedeCemPorCento: boolean;  // by Alexandre - 31/08/2000

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

uses FPrincipal, UAdmPrev, UAdmAss, UMensErro, UDataBase, UCalcDV, FTelaAut,
     DBaseDados, fCancBenefAss, fInscBenefAss, fAguarde;

{$R *.DFM}

procedure TfrmCadDepenBenef.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then
     if dbeNome.CanFocus then dbeNome.SetFocus
  else if pgctrlDetalhe.ActivePage = tbsEndereco then
     if dbeLogradouro.CanFocus then dbeLogradouro.SetFocus;

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
    qry.ParamByName('IDPESSOA').Value    := StrToIntDef(MontaSelect.ValoresChave[0],0);
    qry.ParamByName('IDPESSJUR').Value   := StrToIntDef(MontaSelect.ValoresChave[1],0);
    qry.ParamByName('IDPLANOPREV').Value := StrToIntDef(MontaSelect.ValoresChave[2],0);
    qry.ParamByName('SEQPROPOSTA').Value := StrToIntDef(MontaSelect.ValoresChave[3],0);
    qry.Open;
// Alexandre - 27/10/2000 - Inicio
    qryDet.Close;
    if not qryDet.Prepared then qryDet.prepare;
    qryDet.ParamByName('IDPESSJUR').AsInteger   := qry.FieldByName('IDPESSJUR').AsInteger;
    qryDet.ParamByName('IDTITULAR').AsInteger   := qry.FieldByName('IDPESSOA').AsInteger;
    qryDet.ParamByName('IDPLANOPREV').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;
    qryDet.ParamByName('SEQPROPOSTA').AsInteger := qry.FieldByName('SEQPROPOSTA').AsInteger;
    qryDet.ParamByName('IDPLANASS').AsInteger   := qry.FieldByName('IDPLANASS').AsInteger;
    qryDet.Open;

    qryPessoa.Close;
    if not qryPessoa.Prepared then qryPessoa.prepare;
    qryPessoa.ParamByName('IDPESSOA').Value := StrToIntDef(MontaSelect.ValoresChave[0],0);
    qryPessoa.Open;

    qryPF.Close;
    if not qryPF.Prepared then qryPF.prepare;
    qryPF.ParamByName('IDPESSOA').Value := StrToIntDef(MontaSelect.ValoresChave[0],0);
    qryPF.Open;

    qryDepen.Close;
    if not qryDepen.Prepared then qryDepen.prepare;
    qryDepen.ParamByName('IDPESSOA').Value := StrToIntDef(MontaSelect.ValoresChave[0],0);
    qryDepen.Open;
// Alexandre - 27/10/2000 - Fim

    qryEndPess.Close;
    if not qryEndPess.Prepared then qryEndPess.prepare;
    qryEndPess.ParamByName('IDTITULAR').Value := StrToIntDef(MontaSelect.ValoresChave[0],0);
    qryEndPess.Open;

    qryCBanco.Close;
    if not qryCBanco.Prepared then qryCBanco.prepare;
    qryCBanco.ParamByName('IDTITULAR').Value := StrToIntDef(MontaSelect.ValoresChave[0],0);
    qryCBanco.Open;

    qryBenef.Close;
    if not qryBenef.Prepared then qryBenef.prepare;
    qryBenef.ParamByName('IDTITULAR').Value   := StrToIntDef(MontaSelect.ValoresChave[0],0);
    qryBenef.Open;

    qryBeneficio.Close;
    if not qryBeneficio.Prepared then qryBeneficio.prepare;
    qryBeneficio.ParamByName('IDPLANOPREV').Value := StrToIntDef(MontaSelect.ValoresChave[2],0);
    qryBeneficio.Open;

    qrySeq.Close;
    if not qrySeq.Prepared then qrySeq.prepare;
    qrySeq.ParamByName('IDTITULAR').Value := StrToIntDef(MontaSelect.ValoresChave[0],0);
    qrySeq.Open;
    iSeq := qrySeq.FieldByName('PROXNUMSEQ').AsInteger;
    qrySeq.Close;

// Augusto  11/09/00
// Abre Tabela de Nucleo Familiar, Buscando pelo Titular.
    QryNucleoFam.Close;
    if not QryNucleoFam.Prepared then QryNucleoFam.prepare;
    QryNucleoFam.ParamByName('IDTITULAR').AsInteger:= StrToIntDef(MontaSelect.ValoresChave[0],0);
    QryNucleoFam.Open;
//--*
    qryBenefAss.Close;
    qryBenefAss.ParamByName('IDPESSJUR').AsInteger    := qry.FieldByName('IDPESSJUR').AsInteger;
    qryBenefAss.ParamByName('IDTITULAR').AsInteger    := qry.FieldByName('IDPESSOA').AsInteger;
    qryBenefAss.ParamByName('IDPLANOPREV').AsInteger  := qry.FieldByName('IDPLANOPREV').AsInteger;
    qryBenefAss.ParamByName('IDPLANASS').AsInteger    := qry.FieldByName('IDPLANASS').AsInteger;
    qryBenefAss.ParamByName('SEQPROPOSTA').AsInteger  := qry.FieldByName('SEQPROPOSTA').AsInteger;
    qryBenefAss.Open;

    qryContAss.Close;
    qryContAss.ParamByName('IDPLANASS').AsInteger    := qry.FieldByName('IDPLANASS').AsInteger;
    qryContAss.ParamByName('IDPLANOPREV').AsInteger  := qry.FieldByName('IDPLANOPREV').AsInteger;
    qryContAss.ParamByName('IDPESSJUR').AsInteger    := qry.FieldByName('IDPESSJUR').AsInteger;
    qryContAss.ParamByName('IDTITULAR').AsInteger    := qry.FieldByName('IDPESSOA').AsInteger;
    qryContAss.ParamByName('SEQPROPOSTA').AsInteger  := qry.FieldByName('SEQPROPOSTA').AsInteger;
    qryContAss.Open;

    qryBfciario.Close;
    qryBfciario.ParamByName('IDTITULAR').AsInteger    := qry.FieldByName('IDPESSOA').AsInteger;
    qryBfciario.ParamByName('IDPESSJUR').AsInteger    := qry.FieldByName('IDPESSJUR').AsInteger;
    qryBfciario.ParamByName('IDPLANOPREV').AsInteger  := qry.FieldByName('IDPLANOPREV').AsInteger;
    qryBfciario.ParamByName('IDPLANASS').AsInteger    := qry.FieldByName('IDPLANASS').AsInteger;
    qryBfciario.ParamByName('SEQPROPOSTA').AsInteger  := qry.FieldByName('SEQPROPOSTA').AsInteger;
    qryBfciario.Open;

    OperacaoDetalhe := opIdle;

    edPaiDetalhe.Text := qryDet.FieldByName('NOME').AsString;
  end;
end;

procedure TfrmCadDepenBenef.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
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

  If pgctrlDetalhe.ActivePage = tbsBeneficios
   Then Begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT COUNT(B1.IDTITULAR) TOTALBENEF,');
     qryAux.SQL.Add('       NVL(SUM(B1.PERCENTUAL),0) TOTALPERCENT,');
     qryAux.SQL.Add('       (100-NVL(SUM(B1.PERCENTUAL),0)) PERCENTRESTA');
     qryAux.SQL.Add('FROM BFCIARIOTITASS B1');
     qryAux.SQL.Add('WHERE B1.IDTITULAR    = '+qry.FieldByName('IDPESSOA').AsString);
     qryAux.SQL.Add('  AND B1.IDPESSJUR    = '+qry.FieldByName('IDPESSJUR').AsString);
     qryAux.SQL.Add('  AND B1.IDPLANOPREV  = '+qry.FieldByName('IDPLANOPREV').AsString);
     qryAux.SQL.Add('  AND B1.IDPLANASS    = '+qry.FieldByName('IDPLANASS').AsString);
     qryAux.SQL.Add('  AND B1.SEQPROPOSTA  = '+qry.FieldByName('SEQPROPOSTA').AsString);
     qryAux.Open;

     edtTotalBenef.Text        := qryAux.FieldByName('TOTALBENEF').AsString;
     edtPercJaDist.Text        := qryAux.FieldByName('TOTALPERCENT').AsString;
     dbePercentual.Field.Value := qryAux.FieldByName('PERCENTRESTA').AsString;
   End;

  OperacaoDetalhe := opInserir;
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

    //Hugo Luna - Pendência 25507 - 25/10/2007 - Início
    if (qryDet.FieldByName('FLGBENEFASS').AsInteger = 0) then
      begin
        bbtnInscrever.Visible:= True;
        bbtnCancInscr.Visible:= False;
        lblSituacao.Caption:= 'Não Associado.';
        lblDtCanc.Caption:= '--------';
        lblDtInscricao.Caption:= '--------';
      end;

    if (qryDet.FieldByName('FLGBENEFASS').AsInteger = 1) and (qryDet.FieldByName('FLGATIVO').AsInteger = 1) then
      begin
        bbtnInscrever.Visible:= False;
        bbtnCancInscr.Visible:= True;
        lblSituacao.Caption:= 'Associado Ativo.';
        lblDtCanc.Caption:= '--------';
        lblDtInscricao.Caption:= DateToStr(qryDet.FieldByName('DATAENTRADA').AsDateTime);
      end;

    if (qryDet.FieldByName('FLGBENEFASS').AsInteger = 1) and (qryDet.FieldByName('FLGATIVO').AsInteger = 0) then
      begin
        bbtnInscrever.Visible:= False;
        bbtnCancInscr.Visible:= False;
        lblSituacao.Caption:= 'Associado Cancelado.';
        lblDtCanc.Caption:= DateToStr(qryDet.FieldByName('DTCANCELAMENTO').AsDateTime);
        lblDtInscricao.Caption:= '--------';
      end;
    //Hugo Luna - Pendência 25507 - 25/10/2007 - Fim
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

  If pgctrlDetalhe.ActivePage = tbsBeneficios
   Then Begin
     edtTotalBenef.Text  := qryBfciario.FieldByName('TOTALBENEF').AsString;
     edtPercJaDist.Text  := qryBfciario.FieldByName('TOTALPERCENT').AsString;
   End;

  OperacaoDetalhe := opAlterar;
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
    //qryPessoa.Delete;
    While Not qryPF.Eof Do
          if qryPF.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryPF.Delete
          else
              qryPF.Next;

    //qryPF.Delete;
    While Not qryDepen.Eof Do
          if qryDepen.Fieldbyname('IDPESSOA').AsInteger  = qryDet.FieldbyName('IDPESSOA').AsInteger then
             qryDepen.Delete
          else
              qryDepen.Next;
    //qryDepen.Delete;
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
    then AplicaAlteracoes([qryPessoa,qryPF,qryDepen,qryDet,qryEndPess,qryCBanco,qryBenef, QryNucleoFam, qryInsResponsavel, qryBenefAss, qryContAss, qryBfciario])
    else AplicaAlteracoes([qryBfciario, qryContAss, qryBenefAss, QryNucleoFam, qryBenef,qryCBanco,qryEndPess,qryDet, qryDepen, qryPF, qryPessoa]);
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
   OperacaoDetalhe := opIdle;
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
       qryDet.FieldByName('NUMSEQUENCIA').AsInteger   := StrToIntDef(dbeNumSequencia.Text,0);
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
begin
  if pgctrlDetalhe.ActivePage = tbsDet then begin
    if dbeNome.Text = '' then begin
      MsgDlg('Nome não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      dbeNome.SetFocus;
      Abort;
    end;

    if dbrdgrpSexo.ItemIndex = -1 then begin
      MsgDlg('Sexo não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      dbrdgrpSexo.ItemIndex := 0;
      Abort;
    end;
    if dblkpcmbTipoDependencia.Text = '' then begin
      MsgDlg('Tipo de Dependência não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
      dblkpcmbTipoDependencia.SetFocus;
      Abort;
    end;

  end;

  If pgctrlDetalhe.ActivePage = tbsBeneficios
   Then Begin
     If Trim(dbePercentual.Text) = ''
      Then Begin
        MsgDlg('Percentual não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
        dbePercentual.SetFocus;
        Abort;
      End;

     qryBfciario.FieldByName('IDTITULAR').AsInteger    := qry.FieldByName('IDPESSOA').AsInteger;
     qryBfciario.FieldByName('IDPESSJUR').AsInteger    := qry.FieldByName('IDPESSJUR').AsInteger;
     qryBfciario.FieldByName('IDPLANOPREV').AsInteger  := qry.FieldByName('IDPLANOPREV').AsInteger;
     qryBfciario.FieldByName('IDDEPENDENTE').AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;
     qryBfciario.FieldByName('SEQPROPOSTA').AsInteger  := qry.FieldByName('SEQPROPOSTA').AsInteger;
     qryBfciario.FieldByName('IDPLANASS').AsInteger    := qry.FieldByName('IDPLANASS').AsInteger;
   End;

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
//P.RAMOS-05/06/2007-PEND.25507
//  qryEndPess.FieldByname('IDPAIS').AsInteger    := qryCidade.FieldByName('IDPAIS').AsInteger;
//  qryEndPess.FieldByname('NOMECIDADE').AsString := cmbCidade.Text;
//P.RAMOS-05/06/2007-PEND.25507-FIM

  if qryEndPess.State in [dsInsert,dsEdit] then
  begin
    //P.RAMOS-05/06/2007-PEND.25507
    qryEndPess.FieldByname('IDPAIS').AsInteger    := qryCidade.FieldByName('IDPAIS').AsInteger;
    qryEndPess.FieldByname('NOMECIDADE').AsString := cmbCidade.Text;
    //P.RAMOS-05/06/2007-PEND.25507-FIM

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

procedure TfrmCadDepenBenef.FormDestroy(Sender: TObject);
begin
  inherited;
  CalculaDV.Free;
end;

procedure TfrmCadDepenBenef.FormCreate(Sender: TObject);
begin
  inherited;
  CalculaDV := TCalcDV.Create;
  DataHoje := Date;
end;

procedure TfrmCadDepenBenef.lkpcmbbxBancoChange(Sender: TObject);
begin
  inherited;
  qryAgencia.Close;
  if not qryAgencia.Prepared then qryAgencia.prepare;
  qryAgencia.ParamByName('IDBANCO').AsInteger := qryBanco.FieldByName('IDPESSOA').AsInteger;
  qryAgencia.Open;

end;

procedure TfrmCadDepenBenef.qryCBancoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryCBanco.State = dsInsert then
  begin
    qryCBanco.FieldByName('IdCBANCARIA').AsInteger := LeultRegistro(nil,'CONTABANCARIA');
  end;

  qryCBanco.FieldByName('IDPESSOA').AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;
  qryCBanco.FieldByName('BANCO').AsString     := qryBanco.FieldByName('BANCO').AsString;;
  qryCBanco.FieldByName('AGENCIA').AsString   := qryAgencia.FieldByName('AGENCIA').AsString;;

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
//  sFiltroBenef := sFiltroBenef + ' AND IDPLANOPREV = ' + IntToStr(qry.FieldByName('IDPLANOPREV').AsInteger);
//  sFiltroBenef := sFiltroBenef + ' AND IDPESSJUR = ' + IntToStr(qry.FieldByName('IDPESSJUR').AsInteger);
//  sFiltroBenef := sFiltroBenef + ' AND SEQPROPOSTA = ' + IntToStr(qry.FieldByName('SEQPROPOSTA').AsInteger);
  qryBenef.Filter := sFiltroBenef;
  qryBenef.Filtered := True;

  // --------------------

  qryBenefAss.Filtered := False;
  qryBenefAss.Filter   := 'IDDEPENDENTE = '+qryDet.FieldByName('IDPESSOA').AsString;
  qryBenefAss.Filtered := True;
  qryBenefAss.First;

  qryContAss.Filtered := False;
  qryContAss.Filter   := 'IDDEPENDENTE = '+qryDet.FieldByName('IDPESSOA').AsString;
  qryContAss.Filtered := True;
  qryContAss.First;

  qryBfciario.Filtered := False;
  qryBfciario.Filter   := 'IDDEPENDENTE = '+qryDet.FieldByName('IDPESSOA').AsString;
  qryBfciario.Filtered := True;
  qryBfciario.First;
end;

procedure TfrmCadDepenBenef.bbtnCancelarDetClick(Sender: TObject);
begin

// Caso Inserindo e Tenha dado Erro Exclui Registro
  If (OpDetalhe = 'I') And (QryBenef.State in [DsEdit]) then begin
    QryBenef.Delete;
  End;

  inherited;

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

end;

procedure TfrmCadDepenBenef.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  bbtnCancelarDet.Click;
end;

procedure TfrmCadDepenBenef.FormShow(Sender: TObject);
begin
  inherited;
// Augusto - 11/09/00
// Abre Tabela
  QryResponsavel.Open;
  sbtnAlterar.Enabled := false;  // - Fernando - 24/10/03
  sbtnAlterar.Visible := True;
//-*
end;

procedure TfrmCadDepenBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// Augusto - 11/09/00
// Fecha Tabela
  QryNucleoFam.Close;
  QryResponsavel.Close;
//-*
end;

procedure TfrmCadDepenBenef.tbsBeneficiarioExit(Sender: TObject);
begin
  inherited;
// Caso Edtando/Inserindo Pede Confirmacao antes de Sair
//  If QryBenef.State in [DsInsert, DsEdit] Then Begin
//    If MsgDlg('Os Dados não foram confirmados, deseja cancelar','Mensagem do Sistema ',
//              mtConfirmation,[mbYes,mbNo],0) = MrYes
//    Then Begin
//      bbtnCancelarDetClick(Self);
//    End Else Begin
//      bbtnOkDetClick(Self)
//    End;
//  End;
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

procedure TfrmCadDepenBenef.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := True;
  sbtnAlterar.Visible := True;
end;

Function TfrmCadDepenBenef.InscreveBenefPlanAss : Boolean;
Var
 bConfirmaDados  : Boolean;
 dtInscricao     : TDateTime;
 iFlgAtivo       : Integer;
begin
  Result := False;
  frmInscBenefAss := TfrmInscBenefAss.Create(self);

  bConfirmaDados := frmInscBenefAss.PedeDadosInscBenefAss
                                   (qry.FieldbyName('NOME').AsString,
                                    qryDet.FieldbyName('NOME').AsString,
                                    qry.FieldByName('PLANASSIST').AsString,
                                    qry.FieldByName('INSCRICAONUMERO').AsString,
                                    qry.FieldByName('MATRICULA').AsString,
                                    qryDet.FieldbyName('IDDEPENDENCIA').AsString,
                                    qryDet.FieldbyName('TIPODEPENDENCIA').AsString,
                                    qry.FieldbyName('IDPESSOA').AsInteger,
                                    qryDet.FieldbyName('IDPESSOA').AsInteger,
                                    dtInscricao,
                                    iFlgAtivo);

  If (Not bConfirmaDados)
   Then Exit;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDREGRABENEFICIA');
  qryAux.SQL.Add('FROM PLANASS');
  qryAux.SQL.Add('WHERE IDPLANASS = '+qry.FieldByName('IDPLANASS').AsString);
  qryAux.SQL.Add('  AND NVL(IDREGRABENEFICIA,0) > 0');
  qryAux.Open;

  If Not qryAux.IsEmpty
   Then Begin  // Possui regra de admissão de beneficiário

     RegraInscBenef.rulename := qryAux.FieldByName('IDREGRABENEFICIA').AsString;

     qryRegraInscBenef.Close;
     qryRegraInscBenef.ParamByName('IDDEPENDENTE').AsInteger := qryDet.FieldbyName('IDPESSOA').AsInteger;
     qryRegraInscBenef.ParamByName('IDTITULAR').AsInteger    := qry.FieldbyName('IDPESSOA').AsInteger;
     qryRegraInscBenef.ParamByName('IDPLANASS').AsInteger    := qry.FieldByName('IDPLANASS').AsInteger;
     qryRegraInscBenef.ParamByName('IDPESSJUR').AsInteger    := qry.FieldbyName('IDPESSJUR').AsInteger;
     qryRegraInscBenef.ParamByName('IDPLANOPREV').AsInteger  := qry.FieldbyName('IDPLANOPREV').AsInteger;
     qryRegraInscBenef.ParamByName('DTINSCRICAO').AsString   := DateToStr(dtInscricao);
     qryRegraInscBenef.Open;

     Try
       RegraInscBenef.execute;
     Except
       frmAguarde.Apaga;
       MsgDlg('Erro na execução da regra de admissão do beneficiário! Processo Interrompido!',
              'Erro', mtError, [mbOk], 0);
       qryRegraInscBenef.Close;
       Exit;
     End;

     qryRegraInscBenef.Close;

     If (RegraInscBenef.result = 'False')
      Then Begin
         frmAguarde.Apaga;
         MsgDlg('Este Dependente não satisfaz a Regra de Admissão do Beneficiário do Plano !',
                'Informação', mtInformation, [mbOk], 0);
         TiraSQL(qryAux);
         exit;
      End;

   End; // If Not qryAux.IsEmpty

  // Verifica se o dependente já é cadastrado como beneficiário participante do plano
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT DATAENTRADA, DTCANCELAMENTO');
  qryAux.SQL.Add('FROM BENEFASS');
  qryAux.SQL.Add('WHERE IDTITULAR    = '+qry.FieldbyName('IDPESSOA').AsString);
  qryAux.SQL.Add('  AND IDDEPENDENTE = '+qryDet.FieldbyName('IDPESSOA').AsString);
  qryAux.SQL.Add('  AND IDPESSJUR    = '+qry.FieldbyName('IDPESSJUR').AsString);
  qryAux.SQL.Add('  AND IDPLANOPREV  = '+qry.FieldbyName('IDPLANOPREV').AsString);
  qryAux.SQL.Add('  AND IDPLANASS    = '+qry.FieldbyName('IDPLANASS').AsString);
  qryAux.SQL.Add('  AND SEQPROPOSTA  = '+qry.FieldbyName('SEQPROPOSTA').AsString);
  qryAux.SQL.Add('  AND DTCANCELAMENTO IS NOT NULL');
  qryAux.Open;

  If Not qryAux.IsEmpty
   Then Begin // O dependente JÁ É cadastrado como beneficiário participante do plano
     frmAguarde.Apaga;
     If MsgDlg('Este Beneficiário já esteve neste Plano no período de '+
               qryAux.FieldByName('DATAENTRADA').AsString+' a '+
               qryAux.FieldByName('DTCANCELAMENTO').AsString+'.'+#13+#10+
               'Deseja Reinscrivê-lo ?','Confirmação',mtConfirmation,[mbyes,mbno],0) = mrYes
      Then Begin
        qryBenefAss.Edit;
        qryBenefAss.FieldByName('DTCANCELAMENTO').AsString := Null;
        qryBenefAss.FieldByName('DATAENTRADA').AsDateTime  := dtInscricao;
        qryBenefAss.FieldByName('FLGATIVO').AsInteger      := iFlgAtivo;
        qryBenefAss.Post;

        AtualizaContAssDep(iFlgAtivo);

        Result := True;
      End
      Else Begin
        MsgDlg('Operação Cancelada!!',
               'Informação', mtInformation, [mbOk], 0);
        Exit;
      End; // If MsgDlg
   End // If Not qryAux.IsEmpty
   Else Begin // O dependente NÃO É cadastrado como beneficiário participante do plano
     qryBenefAss.Insert;
     qryBenefAss.FieldByName('IDTITULAR').AsInteger    := qry.FieldbyName('IDPESSOA').AsInteger;
     qryBenefAss.FieldByName('IDDEPENDENTE').AsInteger := qryDet.FieldbyName('IDPESSOA').AsInteger;
     qryBenefAss.FieldByName('IDPLANASS').AsInteger    := qry.FieldbyName('IDPLANASS').AsInteger;
     qryBenefAss.FieldByName('IDPLANOPREV').AsInteger  := qry.FieldbyName('IDPLANOPREV').AsInteger;
     qryBenefAss.FieldByName('IDPESSJUR').AsInteger    := qry.FieldbyName('IDPESSJUR').AsInteger;
     qryBenefAss.FieldByName('SEQPROPOSTA').AsInteger  := qry.FieldbyName('SEQPROPOSTA').AsInteger;
     qryBenefAss.FieldByName('DATAENTRADA').AsDateTime := dtInscricao;
     qryBenefAss.FieldByName('FLGATIVO').AsInteger     := iFlgAtivo;
     qryBenefAss.FieldByName('RESPONSAVELPAG').AsInteger := 1; //P.RAMOS-05/06/2007-PEND.25507
     qryBenefAss.Post;

     AtualizaContAssDep(iFlgAtivo);

     Result := True;
   End;
end;

Function TfrmCadDepenBenef.CancelaBenefPlanAss : Boolean;
Var
 bConfirmaDados    : Boolean;
 dtCancelamento    : TDateTime;
 iNumContribAtraso : Integer;
 sObsCancel        : String;
begin
  iNumContribAtraso:= 0;
  
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT DATAENTRADA, DTCANCELAMENTO');
  qryAux.SQL.Add('FROM BENEFASS');
  qryAux.SQL.Add('WHERE IDTITULAR    = '+qry.FieldbyName('IDPESSOA').AsString);
  qryAux.SQL.Add('  AND IDDEPENDENTE = '+qryDet.FieldbyName('IDPESSOA').AsString);
  qryAux.SQL.Add('  AND IDPESSJUR    = '+qry.FieldbyName('IDPESSJUR').AsString);
  qryAux.SQL.Add('  AND IDPLANOPREV  = '+qry.FieldbyName('IDPLANOPREV').AsString);
  qryAux.SQL.Add('  AND IDPLANASS    = '+qry.FieldbyName('IDPLANASS').AsString);
  qryAux.SQL.Add('  AND SEQPROPOSTA  = '+qry.FieldbyName('SEQPROPOSTA').AsString);
  qryAux.SQL.Add('  AND DTCANCELAMENTO IS NOT NULL');
  qryAux.Open;

  frmCancBenefAss := TfrmCancBenefAss.Create(self); // Hugo Luna - pendência 25507 - 24/10/2007

  bConfirmaDados := frmCancBenefAss.PedeDadosCancBenefAss
                                   (qry.FieldbyName('NOME').AsString,
                                    qryDet.FieldbyName('NOME').AsString,
                                    qry.FieldByName('PLANASSIST').AsString,
                                    qry.FieldByName('INSCRICAONUMERO').AsString,
                                    qry.FieldByName('MATRICULA').AsString,
                                    qryDet.FieldbyName('IDDEPENDENCIA').AsString,
                                    qryDet.FieldbyName('TIPODEPENDENCIA').AsString,
                                    qryAux.FieldByName('DATAENTRADA').AsString,
                                    qry.FieldbyName('IDPESSOA').AsInteger,
                                    qryDet.FieldbyName('IDPESSOA').AsInteger,
                                    dtCancelamento,
                                    sObsCancel);

  If (Not bConfirmaDados)
   Then Exit;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDREGRADESISTENC');
  qryAux.SQL.Add('FROM PLANASS');
  qryAux.SQL.Add('WHERE IDPLANASS = '+qry.FieldByName('IDPLANASS').AsString);
  qryAux.SQL.Add('  AND NVL(IDREGRADESISTENC,0) > 0');
  qryAux.Open;

  If Not qryAux.IsEmpty
   Then Begin  // Possui regra de cancelamento de beneficiário
      RegraCancBenef.rulename := qryAux.FieldByName('IDREGRADESISTENC').AsString;

      qryRegraCancBenef.ParamByName('CONTATRASO').AsInteger   := iNumContribAtraso;
      qryRegraCancBenef.ParamByName('IDDEPENDENTE').AsInteger := qryDet.FieldbyName('IDPESSOA').AsInteger;
      qryRegraCancBenef.ParamByName('IDTITULAR').AsInteger    := qry.FieldbyName('IDPESSOA').AsInteger;
      qryRegraCancBenef.ParamByName('IDPLANASS').AsInteger    := qry.fieldbyname('IDPLANASS').AsInteger;
      qryRegraCancBenef.ParamByName('IDPESSJUR').AsInteger    := qry.FieldbyName('IDPESSJUR').AsInteger;
      qryRegraCancBenef.ParamByName('IDPLANOPREV').AsInteger  := qry.FieldbyName('IDPLANOPREV').AsInteger;
      qryRegraCancBenef.Open;

      RegraCancBenef.Execute;

      If (RegraCancBenef.result = 'False')
       Then Begin
        frmAguarde.Apaga;
        MsgDlg('Este Dependente não pode ser cancelado por não satisfazer a Regra de Cancelamento por Desistência do Plano !',
               'Informação', mtInformation, [mbOk], 0);
        qryRegraCancBenef.Close;
        TiraSQL(qryAux);
        exit;
       End;

      qryRegraCancBenef.Close;

   End;
  qryBenefAss.Edit;
  qryBenefAss.FieldByName('DTCANCELAMENTO').AsDateTime := dtCancelamento;
  qryBenefAss.FieldByName('FLGATIVO').AsInteger        := 0;
  qryBenefAss.FieldByName('OBSCANCEL').AsString        := sObsCancel;
  qryBenefAss.Post;

  AtualizaContAssDep(0);

  Result := True;
end;

procedure TfrmCadDepenBenef.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
   OperacaoDetalhe := opIdle;
end;

procedure TfrmCadDepenBenef.AtualizaContAssDep(piFlgAtivo : Integer);
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT CT.IDPLANASS, CT.IDTITULAR, CT.IDDEPENDENTE, CT.IDPLANOPREV, CT.IDPESSJUR,');
  qryAux.SQL.Add('       CT.IDCONTASS, CT.FLGATIVO, CT.RECPAG, CT.CODPORTFORMA, CT.FLGCOBCARNE,');
  qryAux.SQL.Add('       CT.IDPAGADOR, CT.SEQPROPOSTA');
  qryAux.SQL.Add('FROM CONTASS CT');
  qryAux.SQL.Add('WHERE CT.IDPLANASS    = '+qry.FieldByName('IDPLANASS').AsString);
  qryAux.SQL.Add('  AND CT.IDPLANOPREV  = '+qry.FieldByName('IDPLANOPREV').AsString);
  qryAux.SQL.Add('  AND CT.IDPESSJUR    = '+qry.FieldByName('IDPESSJUR').AsString);
  qryAux.SQL.Add('  AND CT.IDTITULAR    = '+qry.FieldByName('IDPESSOA').AsString);
  qryAux.SQL.Add('  AND CT.IDDEPENDENTE = '+qryDet.FieldByName('IDPESSOA').AsString);
  qryAux.SQL.Add('  AND CT.SEQPROPOSTA  = '+qry.FieldByName('SEQPROPOSTA').AsString);
  qryAux.SQL.Add('  AND CT.IDCONTASS   IN (SELECT C1.IDCONTASS');
  qryAux.SQL.Add('                         FROM CONTASS C1');
  qryAux.SQL.Add('                         WHERE C1.IDPLANASS    = CT.IDPLANASS');
  qryAux.SQL.Add('                           AND C1.IDPLANOPREV  = CT.IDPLANOPREV');
  qryAux.SQL.Add('                           AND C1.IDPESSJUR    = CT.IDPESSJUR');
  qryAux.SQL.Add('                           AND C1.IDTITULAR    = CT.IDTITULAR');
  qryAux.SQL.Add('                           AND C1.IDDEPENDENTE = CT.IDTITULAR   ');
  qryAux.SQL.Add('                           AND C1.SEQPROPOSTA  = CT.SEQPROPOSTA');
  qryAux.SQL.Add('                           AND C1.FLGATIVO     = 1)');
  qryAux.Open;

  If Not qryAux.IsEmpty // Registro já existe
   Then
     While not qryAux.Eof do
      Begin
       If qryContAss.Locate('IDCONTASS', qryAux.FieldByName('IDCONTASS').AsInteger, [])
        Then Begin
          qryContAss.Edit;
          qryContAss.FieldByName('FLGATIVO').AsInteger := piFlgAtivo;
          qryContAss.Post;
        End;
       qryAux.Next;
      End
   Else Begin           // Registro não existe
     If piFlgAtivo <> 1
      Then Exit;

     qryNucleo.Close;
     qryNucleo.ParamByName('IDTITULAR').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
     qryNucleo.ParamByName('IDPLANASS').AsInteger := qry.FieldByName('IDPLANASS').AsInteger;
     qryNucleo.Open;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT CT.IDPLANASS, CT.IDTITULAR, CT.IDDEPENDENTE, CT.IDPLANOPREV, CT.IDPESSJUR,');
     qryAux.SQL.Add('       CT.IDCONTASS, CT.FLGATIVO, CT.RECPAG, CT.CODPORTFORMA, CT.FLGCOBCARNE,');
     qryAux.SQL.Add('       CT.IDPAGADOR, CT.SEQPROPOSTA, CB.PAGADOR');
     qryAux.SQL.Add('FROM CONTASS CT, CONTRIBASS CB');
     qryAux.SQL.Add('WHERE CT.IDPLANASS    = '+qry.FieldByName('IDPLANASS').AsString);
     qryAux.SQL.Add('  AND CT.IDPLANOPREV  = '+qry.FieldByName('IDPLANOPREV').AsString);
     qryAux.SQL.Add('  AND CT.IDPESSJUR    = '+qry.FieldByName('IDPESSJUR').AsString);
     qryAux.SQL.Add('  AND CT.IDTITULAR    = '+qry.FieldByName('IDPESSOA').AsString);
     qryAux.SQL.Add('  AND CT.IDDEPENDENTE = '+qry.FieldByName('IDPESSOA').AsString);
     qryAux.SQL.Add('  AND CT.SEQPROPOSTA  = '+qry.FieldByName('SEQPROPOSTA').AsString);
     qryAux.SQL.Add('  AND CT.FLGATIVO     = 1');
     qryAux.SQL.Add('  AND CB.IDPLANASS    = CT.IDPLANASS');
     qryAux.SQL.Add('  AND CB.IDCONTASS    = CT.IDCONTASS');
     qryAux.Open;

     While Not QryAux.Eof do
      Begin
        qryContAss.Insert;
        qryContAss.FieldByName('IDPLANASS').AsInteger    := qry.FieldByName('IDPLANASS').AsInteger;
        qryContAss.FieldByName('IDTITULAR').AsInteger    := qry.FieldByName('IDPESSOA').AsInteger;
        qryContAss.FieldByName('IDDEPENDENTE').AsInteger := qryDet.FieldByName('IDPESSOA').AsInteger;
        qryContAss.FieldByName('IDPLANOPREV').AsInteger  := qry.FieldByName('IDPLANOPREV').AsInteger;
        qryContAss.FieldByName('IDPESSJUR').AsInteger    := qry.FieldByName('IDPESSJUR').AsInteger;
        qryContAss.FieldByName('IDCONTASS').AsInteger    := qryAux.FieldByName('IDCONTASS').AsInteger;
        qryContAss.FieldByName('FLGATIVO').AsInteger     := piFlgAtivo;
        qryContAss.FieldByName('RECPAG').AsString        := 'R';
        qryContAss.FieldByName('FLGCOBCARNE').AsInteger  := qryAux.FieldByName('FLGCOBCARNE').AsInteger;
        qryContAss.FieldByName('SEQPROPOSTA').AsInteger  := qry.FieldByName('SEQPROPOSTA').AsInteger;

        If qryAux.FieldByName('CODPORTFORMA').AsInteger > 0
         Then qryContAss.FieldByName('CODPORTFORMA').AsInteger := qryAux.FieldByName('CODPORTFORMA').AsInteger;

        If qryAux.FieldByName('PAGADOR').AsString = 'C'
         Then If qryNucleo.IsEmpty
               Then qryContAss.FieldByName('IDPAGADOR').AsInteger := qry.FieldByName('IDPESSOA').AsInteger
               Else qryContAss.FieldByName('IDPAGADOR').AsInteger := qryAux.FieldByName('IDRESPONSAVEL').AsInteger
         Else qryContAss.FieldByName('IDPAGADOR').AsInteger       := qry.FieldByName('IDPESSJUR').AsInteger;
        qryContAss.Post;

        qryAux.Next;
      End;

   End;

end;

procedure TfrmCadDepenBenef.dbePercentualExit(Sender: TObject);
begin
  inherited;
  If (OperacaoDetalhe = OpInserir)
   Then  // Inserindo registro
     If (Trim(dbePercentual.Text) <> '') And
        ((qryBfciario.FieldByName('TOTALPERCENT').AsFloat + StrToFloat(dbePercentual.Text)) > 100)
      Then Begin
        MsgDlg('A soma do total do percentual já distribuido e percentual do'+#13+#10+
               'beneficiário não pode ultrapassar a 100%! Refaça os valores',
               'Informação', mtInformation, [mbOk], 0);
        dbePercentual.Text := '';
        Exit;
      End
   Else // Alterando registro
     If (Trim(dbePercentual.Text) <> '') And
        (((qryBfciario.FieldByName('TOTALPERCENT').AsFloat - qryBfciario.FieldByName('PERCENTUAL').AsFloat)+
           StrToFloat(dbePercentual.Text)) > 100)
      Then Begin
        MsgDlg('A soma do total do percentual já distribuido e percentual do'+#13+#10+
               'beneficiário não pode ultrapassar a 100%! Refaça os valores',
               'Informação', mtInformation, [mbOk], 0);
        dbePercentual.Text := '';
        Exit;
      End;
end;

//Hugo Luna - Pendência 25507 - 25/10/2007 - Início
procedure TfrmCadDepenBenef.bbtnInscreverClick(Sender: TObject);
begin
  inherited;

  If OperacaoDetalhe = opIdle
   Then Exit;

  frmAguarde.Mostra('Executando operações de admissão de beneficiário no plano assistencial... ');
  InscreveBenefPlanAss;

  frmAguarde.Apaga;
end;

procedure TfrmCadDepenBenef.bbtnCancInscrClick(Sender: TObject);
begin
  inherited;

  If OperacaoDetalhe = opIdle
   Then Exit;

  frmAguarde.Mostra('Executando operações de cancelamento beneficiário no plano assistencial... ');
  CancelaBenefPlanAss;

  frmAguarde.Apaga;
end;
//Hugo Luna - Pendência 25507 - 25/10/2007 - Fim

end.
