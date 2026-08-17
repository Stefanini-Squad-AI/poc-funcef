unit fCadGrupoFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fcLabel, wwdblook,
  StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc,
  Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  CmEventosCadastro, ImgList, fCadastroMT, DBClient, uCMClientDataSet, uCtrlGrupFunc,
  uCtrlCargo, uCtrlGrInstr, uCtrlGlobalRH, TREdit;

type
  TfrmCadGrupoFunc = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbedCodigo: TDBEdit;
    dbedDescr: TDBEdit;
    dbedInterv: TDBEdit;
    dblkcGrauInstr: TwwDBLookupCombo;
    bbtnCargos: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    dsCargo: TwwDataSource;
    pnlCargos: TPanel;
    Label5: TLabel;
    dbGridCargos: TwwDBGrid;
    CdsGrauInstr: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    lblFatorHay: TLabel;
    dbreFatorHay: TDBRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCargosClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    CtrlGrupFunc: TCtrlGrupFunc;
    CtrlCargo: TCtrlCargo;
    CtrlGrInstr: TCtrlGrInstr;
    CtrlGlobalRH: TCtrlGlobalRH;
    
    procedure Sel(CodGrpFunc: string);
    function  GravarRegistro: boolean;
  end;

var
  frmCadGrupoFunc: TfrmCadGrupoFunc;

implementation

uses uMensErro, uCtrlPadroes, uSistema, dCds, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadGrupoFunc.FormCreate(Sender: TObject);
var
  IndPolitica: integer;
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlGrupFunc := TCtrlGrupFunc.Create;
  CtrlGrupFunc.InitializeAs(Padroes);
  CtrlGrupFunc.Cds := Cds;

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlGrInstr := TCtrlGrInstr.Create;
  CtrlGrInstr.InitializeAs(Padroes);

  Sel('-1');
  CdsGrauInstr.Data := CtrlGrInstr.ListGrauInstrucao;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('INDPOLITICA');
  IndPolitica := dmCds.Cds.FieldByName('INDPOLITICA').asInteger;
  lblFatorHay.Visible  := (IndPolitica = 1) and (Sistema.IdModulo = MODCES);
  dbreFatorHay.Visible := (IndPolitica = 1) and (Sistema.IdModulo = MODCES);

  case (Sistema.IdModulo) of
    MODAVA : HelpContext := 700003;
    MODCES : HelpContext := 740003;
  end;
end;

procedure TfrmCadGrupoFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGrupFunc);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlGrInstr);
  inherited;
end;

procedure TfrmCadGrupoFunc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(MontaSelect.ValoresChave[0]);
end;

procedure TfrmCadGrupoFunc.CmeCadastroInsert(Sender: TObject);
begin
  Sel('-1');
  inherited;
end;

procedure TfrmCadGrupoFunc.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadGrupoFunc.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrupoFunc.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrupoFunc.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrupoFunc.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadGrupoFunc.bbtnCargosClick(Sender: TObject);
begin
  pnlCargos.Visible := not(pnlCargos.Visible);
  if (pnlCargos.Visible) then
    pnlCargos.Top := 46
  else
    pnlCargos.Top := 222;
end;

procedure TfrmCadGrupoFunc.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
  end
  else
  if (Trim(dbedInterv.Text) = '') then
  begin
    MsgDlg('Preencha o Intervalo entre Avaliações.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedInterv.SetFocus;
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

procedure TfrmCadGrupoFunc.Sel(CodGrpFunc: string);
begin
  Cds.Data := CtrlGrupFunc.ListGrupoFunc(CodGrpFunc);
  if (Trim(Cds.FieldByName('CodGrpFunc').asString) <> '') then
    CdsCargo.Data := CtrlCargo.ListCargo(0, 0, 0, 0, '', Cds.FieldByName('CodGrpFunc').asString)
  else
    CdsCargo.Data := CtrlCargo.ListCargo(-1);
end;

function TfrmCadGrupoFunc.GravarRegistro: boolean;
begin
  Result := CtrlGrupFunc.GravarGrupoFunc;
  if not(Result) then
    raise Exception.Create(CtrlGrupFunc.MessageInfo);
end;

end.
