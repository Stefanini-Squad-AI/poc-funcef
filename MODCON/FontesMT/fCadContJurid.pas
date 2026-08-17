unit fCadContJurid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MontaSelect,
  DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, CMTree, Mask, DBCtrls,
  wwdbedit, IvDictio, IvMulti, IvEMulti, CMProcuraMask, CmEventosCadastro, ImgList, DBClient,
  FCadastroMestreDetMT, uCMClientDataSet, uCtrlTipObjeto, uCtrlListTerceirosRH,
  uCtrlContabJurid, uCtrlTipProc;

type
  TfrmCadContJurid = class(TFrmCadastroMestreDetMT)
    dbedDescricao: TwwDBEdit;
    Label2: TLabel;
    CMProcuraMaskContabilCredito: TCMProcuraMaskContabil;
    CMProcuraMaskContabilDebito: TCMProcuraMaskContabil;
    dbrgIndPrincipal: TDBRadioGroup;
    dbrgMateria: TDBRadioGroup;
    CdsDet: TCMClientDataSet;
    gbxTipoProc: TGroupBox;
    CdsTipoProc: TCMClientDataSet;
    dblckTipProc: TwwDBLookupCombo;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label1: TLabel;
    Label3: TLabel;
    dbrgUsaPadrao: TDBRadioGroup;
    gbxCentroCusto: TGroupBox;
    CdsCCusto: TCMClientDataSet;
    dblckCCusto: TwwDBLookupCombo;
    dbrgTipoOper: TDBRadioGroup;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure dsDetStateChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CdsDetBeforePost(DataSet: TDataSet);
  private
    CtrlContabJurid: TCtrlContabJurid;
    CtrlTipObjeto: TCtrlTipObjeto;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlTipProc: TCtrlTipProc;

    iNumPlano: integer;

    procedure Sel(CodTipoObjeto: double);
    function  GravarRegistro: boolean;
  end;

const
  arrMateria: array[0..7] of string = ('Qualquer', 'Trabalhista', 'Previdenciária',
    'Prev./Trabalhista', 'Civil', 'Comercial', 'Tributária', 'Penal');

var
  frmCadContJurid: TfrmCadContJurid;

implementation

uses uMensErro, uSistema, uCtrlFuncoesRH, uCtrlPadroes, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadContJurid.FormCreate(Sender: TObject);
var
  sMascaraPlano: string;
begin
  inherited;
  CtrlContabJurid := TCtrlContabJurid.Create;
  CtrlContabJurid.InitializeAs(Padroes);
  CtrlContabJurid.CdsContabJurid := CdsDet;

  CtrlTipObjeto := TCtrlTipObjeto.Create;
  CtrlTipObjeto.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlTipProc := TCtrlTipProc.Create;
  CtrlTipProc.InitializeAs(Padroes);
  CdsTipoProc.Data := CtrlTipProc.ListTipProc;

  CdsCCusto.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));

  Sel(-1);

  iNumPlano := CtrlListTerceirosRH.GetPlano(Sistema.IdEmpresa);
  sMascaraPlano := CtrlListTerceirosRH.GetMascaraPlano(iNumPlano);

  CMProcuraMaskContabilDebito.Mascara := sMascaraPlano;
  CMProcuraMaskContabilCredito.Mascara := sMascaraPlano;
  CMProcuraMaskContabilDebito.Plano := iNumPlano;
  CMProcuraMaskContabilCredito.Plano := iNumPlano;

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760017;
    PROCJUD, PROCPREV : HelpContext := 1100011;
    SISTJURCONS       : HelpContext := 7190017;
  end;
end;

procedure TfrmCadContJurid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlContabJurid);
  FreeAndNil(CtrlTipObjeto);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlTipProc);
  inherited;
end;

procedure TfrmCadContJurid.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadContJurid.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('CODTIPOOBJETO').asFloat := Cds.FieldByName('CODTIPOOBJETO').asFloat;
  if (CMProcuraMaskContabilDebito.Conta <> nil) then
    CdsDet.FieldByName('IDPLANO2').asInteger := iNumPlano;
  if (CMProcuraMaskContabilCredito.Conta <> nil) then
    CdsDet.FieldByName('IDPLANO1').asInteger := iNumPlano;
end;

procedure TfrmCadContJurid.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadContJurid.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadContJurid.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (CMProcuraMaskContabilCredito.CanFocus) then
    CMProcuraMaskContabilCredito.SetFocus;
end;

procedure TfrmCadContJurid.bbtnOkDetClick(Sender: TObject);
begin
  if (dbrgIndPrincipal.ItemIndex = -1) then
  begin
    MsgDlg('Preencha em que o Critério se aplica.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dbrgIndPrincipal.SetFocus;
  end
  else
  if (dbrgMateria.ItemIndex = -1) then
  begin
    MsgDlg('Preencha a Matéria.', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
    dbrgMateria.SetFocus;
  end
  else
  begin
    CdsDet.FieldByName('MATERIA').asString := arrMateria[dbrgMateria.ItemIndex];
    inherited;
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadContJurid.Sel(CodTipoObjeto: double);
begin
  Cds.Data := CtrlTipObjeto.ListTipObjeto(CodTipoObjeto);
  CdsDet.Data := CtrlContabJurid.ListContabJurid(CodTipoObjeto);
end;

function TfrmCadContJurid.GravarRegistro: boolean;
begin
  Result := CtrlContabJurid.GravarContabJurid;
  if not(Result) then
    raise Exception.Create(CtrlContabJurid.MessageInfo);
end;

procedure TfrmCadContJurid.CdsDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dblckCCusto.Text <> '' then
    CdsDet.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa
  else
    CdsDet.FieldByName('IDEMPRESA').Clear;
end;

end.
