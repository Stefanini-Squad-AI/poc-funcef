unit fCadFaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, cmseldlg, wwidlg,
  Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, wwdbedit, DBTables, Wwtable, Wwquery, TB97, TB97Ctls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, MontaSelect, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList, FCadastroMT, DBClient, uCMClientDataSet, uCtrlFaixaSal,
  uCtrlListTerceirosRH, uCtrlIntegraPrevRH;

type
  TfrmCadFaixa = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TwwDBEdit;
    Label2: TLabel;
    dbdtedDataEfet: TCMDateTimePicker;
    lblTit9: TLabel;
    dbredVal9: TDBRealEdit;
    lblTit8: TLabel;
    dbredVal8: TDBRealEdit;
    lblTit7: TLabel;
    dbredVal7: TDBRealEdit;
    lblTit6: TLabel;
    dbredVal6: TDBRealEdit;
    lblTit5: TLabel;
    dbredVal5: TDBRealEdit;
    lblTit4: TLabel;
    dbredVal4: TDBRealEdit;
    lblTit3: TLabel;
    dbredVal3: TDBRealEdit;
    lblTit2: TLabel;
    dbredVal2: TDBRealEdit;
    lblTit1: TLabel;
    dbredVal1: TDBRealEdit;
    pnlHistFaixa: TPanel;
    lblHistFaixa: TLabel;
    dbGridHistFaixa: TwwDBGrid;
    ToolbarSep972: TToolbarSep97;
    bbtnHistFaixa: TToolbarButton97;
    CdsHistFaixa: TCMClientDataSet;
    dsHistFaixa: TwwDataSource;
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
    procedure bbtnHistFaixaClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
  private
    CtrlFaixaSal: TCtrlFaixaSal;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlIntegraPrevRH: TCtrlIntegraPrevRH;

    procedure Sel(IdFaixaSalarial: integer);
    function  GravarRegistro: boolean;
  end;

var
  frmCadFaixa: TfrmCadFaixa;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadFaixa.FormCreate(Sender: TObject);
var
  c, iNumSteps: integer;
begin
  CtrlFaixaSal := TCtrlFaixaSal.Create(Sistema.IdEmpresa);
  CtrlFaixaSal.InitializeAs(Padroes);
  CtrlFaixaSal.Cds := Cds;

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlIntegraPrevRH := TCtrlIntegraPrevRH.Create;
  CtrlIntegraPrevRH.InitializeAs(Padroes);

  bbtnHistFaixa.Visible := (CtrlFaixaSal.TipoEmpresa = 'P');
  ToolbarSep972.Visible := bbtnHistFaixa.Visible;
  Sel(-1);

  with (CtrlFaixaSal.DbParamRH) do
  begin
    LoadFromDb;
    iNumSteps := FieldByName('NUMSTEPS').asInteger;
    inherited;
    lblTit1.Visible := (iNumSteps >= 1);
    lblTit2.Visible := (iNumSteps >= 2);
    lblTit3.Visible := (iNumSteps >= 3);
    lblTit4.Visible := (iNumSteps >= 4);
    lblTit5.Visible := (iNumSteps >= 5);
    lblTit6.Visible := (iNumSteps >= 6);
    lblTit7.Visible := (iNumSteps >= 7);
    lblTit8.Visible := (iNumSteps >= 8);
    lblTit9.Visible := (iNumSteps >= 9);

    dbredVal1.Visible := (iNumSteps >= 1);
    dbredVal2.Visible := (iNumSteps >= 2);
    dbredVal3.Visible := (iNumSteps >= 3);
    dbredVal4.Visible := (iNumSteps >= 4);
    dbredVal5.Visible := (iNumSteps >= 5);
    dbredVal6.Visible := (iNumSteps >= 6);
    dbredVal7.Visible := (iNumSteps >= 7);
    dbredVal8.Visible := (iNumSteps >= 8);
    dbredVal9.Visible := (iNumSteps >= 9);

    lblTit1.Caption := FieldByName('TITSTEP1').asString;
    lblTit2.Caption := FieldByName('TITSTEP2').asString;
    lblTit3.Caption := FieldByName('TITSTEP3').asString;
    lblTit4.Caption := FieldByName('TITSTEP4').asString;
    lblTit5.Caption := FieldByName('TITSTEP5').asString;
    lblTit6.Caption := FieldByName('TITSTEP6').asString;
    lblTit7.Caption := FieldByName('TITSTEP7').asString;
    lblTit8.Caption := FieldByName('TITSTEP8').asString;
    lblTit9.Caption := FieldByName('TITSTEP9').asString;

    for c:=1 to FieldByName('NUMSTEPS').asInteger do
    begin
      MontaSelect.Colunas.Add('STEP'+IntToStr(c));
      MontaSelect.Descricao.Add(FieldByName('TITSTEP'+IntToStr(c)).asString);
      MontaSelect.Larguras.Add('10');
      MontaSelect.Mascaras.Add('');
      MontaSelect.SensivelACaixa.Add('');
      MontaSelect.TipodeDado.Add('C');
    end;
  end;

  bbtnHistFaixa.Visible := (Sistema.TipoEmpresa = 'P');

  case (Sistema.IdModulo) of
    MODCES : HelpContext := 740008;
    MODFOL : HelpContext := 210017;
  end;
end;

procedure TfrmCadFaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlFaixaSal);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlIntegraPrevRH);
  inherited;
end;

procedure TfrmCadFaixa.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadFaixa.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadFaixa.CmeCadastroConfirma(Sender: TObject);
var
  bOk: boolean;
begin
  inherited;
  // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  if (bbtnHistFaixa.Visible) then
  begin
    frmAguarde.Mostra('Atualizando o Histórico das Faixas');
    frmAguarde.Pos := 0;

    bOk := CtrlIntegraPrevRH.AtualizaFaixasSalariais(Sistema.IdEmpresa);
    frmAguarde.Apaga;
    
    if (bOk) then
      CdsHistFaixa.Data := CtrlListTerceirosRH.ListFaixaNivel(
        Cds.FieldByName('IDFAIXASALARIAL').asFloat, Sistema.IdEmpresa)
    else
      raise Exception.Create(CtrlIntegraPrevRH.MessageInfo);
  end;
end;

procedure TfrmCadFaixa.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //nherited;
end;

procedure TfrmCadFaixa.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFaixa.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFaixa.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadFaixa.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadFaixa.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (pnlHistFaixa.Visible) then
    lblHistFaixa.Caption := 'Histórico da Faixa ' + Cds.FieldByName('IDFAIXASALARIAL').asString;
end;

procedure TfrmCadFaixa.bbtnHistFaixaClick(Sender: TObject);
begin
  pnlHistFaixa.Visible := not(pnlHistFaixa.Visible);
end;

procedure TfrmCadFaixa.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
  end
  else
  if (Trim(dbdtedDataEfet.Text) = '') then
  begin
    MsgDlg('Preencha a Data de Efetivação.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbdtedDataEfet.SetFocus;
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

procedure TfrmCadFaixa.Sel(IdFaixaSalarial: integer);
begin
  Cds.Data := CtrlFaixaSal.ListFaixaSal(IdFaixaSalarial);

  if (bbtnHistFaixa.Visible) then
    CdsHistFaixa.Data := CtrlListTerceirosRH.ListFaixaNivel(
      Cds.FieldByName('IDFAIXASALARIAL').asFloat, Sistema.IdEmpresa);
end;

function TfrmCadFaixa.GravarRegistro: boolean;
begin
  Result := CtrlFaixaSal.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlFaixaSal.MessageInfo);
end;

end.
