unit fCadCargo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, TB97,
  TB97Tlbr, Buttons, ExtCtrls, DBCtrls, wwdblook, Mask, CmEventosCadastro, ImgList, DBClient,
  fCadastroMT, TREdit, uCMClientDataSet, uCtrlCargo, uCtrlCBO, uCtrlGrupFunc, uCtrlGrpTrein,
  uCtrlFaixaSal, uCtrlGlobalRH, uCtrlTabelaHay;

type
  TfrmCadCargo = class(TFrmCadastroMT)
    CdsGrupo: TCMClientDataSet;
    CdsFaixa: TCMClientDataSet;
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    lblPontosHay: TLabel;
    dbrePontosHay: TDBRealEdit;
    lblFaixaSal: TLabel;
    dblcFaixaSal: TwwDBLookupCombo;
    lblValorHay: TLabel;
    redValorHay: TRealEdit;
    Label2: TLabel;
    dbedTitulo: TDBEdit;
    Label4: TLabel;
    dbedCBO1994: TDBEdit;
    Label3: TLabel;
    dbedCBO2002: TDBEdit;
    lblGrupo: TLabel;
    dblcGrupo: TwwDBLookupCombo;
    lblDescricao: TLabel;
    dbmemDescr: TDBMemo;
    edCBO1994: TEdit;
    edCBO2002: TEdit;
    bbtnProcCBO1994: TBitBtn;
    bbtnProcCBO2002: TBitBtn;
    MontaSelectCBO1994: TMontaSelect;
    MontaSelectCBO2002: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure bbtnProcCBO1994Click(Sender: TObject);
    procedure bbtnProcCBO2002Click(Sender: TObject);
    procedure dbedCBO1994Exit(Sender: TObject);
    procedure dbedCBO2002Exit(Sender: TObject);
    procedure dbedCBO1994Enter(Sender: TObject);
    procedure dbedCBO2002Enter(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlCargo: TCtrlCargo;
    CtrlCBO: TCtrlCBO;
    CtrlGrupFunc: TCtrlGrupFunc;
    CtrlGrpTrein: TCtrlGrpTrein;
    CtrlFaixaSal: TCtrlFaixaSal;
    CtrlTabelaHay: TCtrlTabelaHay;

    sIdCBO_OLD: string;
    IndPolitica: integer;

    procedure Sel(IdCargo: double);
    procedure SelCBO1994(IdCBO: string; MudarID: boolean = true);
    procedure SelCBO2002(IdCBO: string; MudarID: boolean = true);
    function  GravarRegistro: boolean;
  end;

var
  frmCadCargo: TfrmCadCargo;

implementation

uses uSistema, uMensErro, uCtrlPadroes, dCds, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadCargo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlCBO := TCtrlCBO.Create;
  CtrlCBO.InitializeAs(Padroes);

  CtrlGrupFunc := TCtrlGrupFunc.Create;
  CtrlGrupFunc.InitializeAs(Padroes);

  CtrlGrpTrein := TCtrlGrpTrein.Create;
  CtrlGrpTrein.InitializeAs(Padroes);

  CtrlFaixaSal := TCtrlFaixaSal.Create(Sistema.IdEmpresa);
  CtrlFaixaSal.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);
  CtrlCargo.CdsCargo := Cds;

  CtrlTabelaHay := TCtrlTabelaHay.Create;
  CtrlTabelaHay.InitializeAs(Padroes);

  Sel(-1);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('INDPOLITICA');
  IndPolitica := dmCds.Cds.FieldByName('INDPOLITICA').asInteger;

  lblFaixaSal.Visible  := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 0);
  dblcFaixaSal.Visible := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 0);

  lblPontosHay.Visible  := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 1);
  dbrePontosHay.Visible := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 1);

  lblValorHay.Visible := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 1);
  redValorHay.Visible := (Sistema.IdModulo in [MODFOL,MODBAS, MODCES]) and (IndPolitica = 1);

  lblGrupo.Visible := (Sistema.IdModulo in [MODAVA, MODTRN, MODCES]);
  dblcGrupo.Visible := (Sistema.IdModulo in [MODAVA, MODTRN, MODCES]);

  case (Sistema.IdModulo) of
    MODAVA : HelpContext := 700002;
    MODBAS : HelpContext := 690009;
    MODCES : HelpContext := 740002;
    MODFOL : HelpContext := 210013;
    MODTRN : HelpContext := 720009;
  end;

  if (Sistema.IdModulo in [MODAVA, MODCES]) then
  begin
    lblGrupo.Caption := 'Grupo Funcional';
    dblcGrupo.DataField := 'CODGRPFUNC';
    dblcGrupo.LookupField := 'CODGRPFUNC';
    dblcGrupo.Selected.Clear;
    dblcGrupo.Selected.Add('DESCGRPFUNC'+#9+'40'+#9+'DESCGRPFUNC');
    CdsGrupo.Data := CtrlGrupFunc.ListGrupoFunc;
  end
  else
  if (Sistema.IdModulo = MODTRN) then
  begin
    lblGrupo.Caption := 'Grupo de Trein.';
    dblcGrupo.DataField := 'CODGRPTREIN';
    dblcGrupo.LookupField := 'CODGRPTREIN';
    dblcGrupo.Selected.Clear;
    dblcGrupo.Selected.Add('DESCGRPTREIN'+#9+'40'+#9+'DESCGRPTREIN');
    CdsGrupo.Data := CtrlGrpTrein.ListGrpTrein;
  end;

  if (Sistema.IdModulo in [MODAVA, MODTRN, MODCES]) then
  begin
    lblDescricao.Top := 156;
    dbmemDescr.Top := 170;
    Self.Height := 409;
  end;

  if (Sistema.IdModulo in [MODFOL, MODBAS]) then
  begin
    lblDescricao.Top := 130;
    dbmemDescr.Top := 144;
    Self.Height := 382;
  end;

  if (Sistema.IdModulo in [MODFOL, MODBAS, MODCES]) then
    CdsFaixa.Data := CtrlFaixaSal.ListFaixaSal;
end;

procedure TfrmCadCargo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlFaixaSal);
  FreeAndNil(CtrlGrpTrein);
  FreeAndNil(CtrlGrupFunc);
  FreeAndNil(CtrlCBO);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlTabelaHay);
  inherited;
end;

procedure TfrmCadCargo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadCargo.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  CmeCadastroFind(Sender);
end;

procedure TfrmCadCargo.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadCargo.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadCargo.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCargo.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadCargo.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
  if (Accept) then
  begin
    edCBO1994.Text := '';
    edCBO2002.Text := '';
  end;
end;

procedure TfrmCadCargo.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadCargo.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (IndPolitica = 1) then
    redValorHay.Value := CtrlTabelaHay.GetValorHay(Cds.FieldByName('IDCARGO').asInteger);
end;

procedure TfrmCadCargo.dbedCBO1994Enter(Sender: TObject);
begin
  sIdCBO_OLD := dbedCBO1994.Text;
end;

procedure TfrmCadCargo.dbedCBO2002Enter(Sender: TObject);
begin
  sIdCBO_OLD := dbedCBO2002.Text;
end;

procedure TfrmCadCargo.dbedCBO1994Exit(Sender: TObject);
begin
  if (sIdCBO_OLD <> dbedCBO1994.Text) then
  begin
    SelCBO1994(dbedCBO1994.Text);
    sIdCBO_OLD := dbedCBO1994.Text;
    if (edCBO1994.Text = '') then
      Cds.FieldByName('CBO').asString := '';
  end;
end;

procedure TfrmCadCargo.dbedCBO2002Exit(Sender: TObject);
begin
  if (sIdCBO_OLD <> dbedCBO2002.Text) then
  begin
    SelCBO2002(dbedCBO2002.Text);
    sIdCBO_OLD := dbedCBO2002.Text;
    if (edCBO2002.Text = '') then
      Cds.FieldByName('CBO2002').asString := '';
  end;
end;

procedure TfrmCadCargo.bbtnProcCBO1994Click(Sender: TObject);
begin
  MontaSelectCBO1994.Executar;
  if (MontaSelectCBO1994.RetornouValor) then
    SelCBO1994(MontaSelectCBO1994.ValoresChave[0]);
end;

procedure TfrmCadCargo.bbtnProcCBO2002Click(Sender: TObject);
begin
  MontaSelectCBO2002.Executar;
  if (MontaSelectCBO2002.RetornouValor) then
    SelCBO2002(MontaSelectCBO2002.ValoresChave[0]);
end;

procedure TfrmCadCargo.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbedTitulo.Text) = '') then
  begin
    MsgDlg('Preencha o Título.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedTitulo.SetFocus;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadCargo.Sel(IdCargo: double);
begin
  Cds.Data := CtrlCargo.ListCargo(IdCargo);

  SelCBO1994(Cds.FieldByName('CBO').asString);
  SelCBO2002(Cds.FieldByName('CBO2002').asString);
end;

procedure TfrmCadCargo.SelCBO1994(IdCBO: string; MudarID: boolean);
begin
  if (IdCBO <> '') then
  begin
    dmCds.Cds.Data := CtrlCBO.ListGeral(StrToFloat(IdCBO));
    edCBO1994.Text := dmCds.Cds.FieldByName('DESCRICAO').asString;
  end
  else
    edCBO1994.Text := '';

  if (MudarID) and (Cds.State in [dsInsert,dsEdit]) then
    Cds.FieldByName('CBO').asString := IdCBO;
end;

procedure TfrmCadCargo.SelCBO2002(IdCBO: string; MudarID: boolean);
begin
  if (IdCBO <> '') then
  begin
    dmCds.Cds.Data := CtrlCBO.ListGeral(StrToFloat(IdCBO));
    edCBO2002.Text := dmCds.Cds.FieldByName('DESCRICAO').asString;
  end
  else
    edCBO2002.Text := '';

  if (MudarID) and (Cds.State in [dsInsert,dsEdit]) then
    Cds.FieldByName('CBO2002').asString := IdCBO;
end;

function TfrmCadCargo.GravarRegistro: boolean;
begin
  Result := CtrlCargo.GravarCargo;
  if not(Result) then
    raise Exception.Create(CtrlCargo.MessageInfo);
end;

end.
