//******************************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 08/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
//******************************************************************************************

unit fCadClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, TB97, MAHlpBtn, TB97Tlbr, StdCtrls,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls, Mask, TabControlDetalhe, DBCtrls,
  wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, ImgList, FCadastroMestreDetMT, DBClient,
  uCMClientDataSet, uCtrlClasseSal, uCtrlGlobalRH, uCtrlFaixaSal, uCtrlGrupFunc;

type
  TfrmCadClasse = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    Label10: TLabel;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    sbtnFaixas: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    Label2: TLabel;
    dbedMinimo: TDBEdit;
    Label3: TLabel;
    dbedMaximo: TDBEdit;
    Label4: TLabel;
    dblcFaixa: TwwDBLookupCombo;
    CdsDet: TCMClientDataSet;
    CdsFaixa: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnFaixasClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlClasseSal: TCtrlClasseSal;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlFaixaSal: TCtrlFaixaSal;
    CtrlGrupFunc: TCtrlGrupFunc;

    procedure Sel(CodGrpFunc: string);
    procedure HabilitaBtAtualizarFaixas;
    function  GravarRegistro: boolean;
  end;

var
  frmCadClasse: TfrmCadClasse;

implementation

uses uSistema, uMensErro, uCtrlPadroes, fAguarde;

{$R *.DFM}

procedure TfrmCadClasse.FormCreate(Sender: TObject);
var
  c: integer;
begin
  inherited;
  CtrlClasseSal := TCtrlClasseSal.Create;
  CtrlClasseSal.InitializeAs(Padroes);
  CtrlClasseSal.CdsDet := CdsDet;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlFaixaSal := TCtrlFaixaSal.Create(Sistema.IdEmpresa);
  CtrlFaixaSal.InitializeAs(Padroes);

  CtrlGrupFunc := TCtrlGrupFunc.Create;
  CtrlGrupFunc.InitializeAs(Padroes);

  sbtnProcurarClick(Sender);
  if not(MontaSelect.RetornouValor) then
    Sel('-1');

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('NUMSTEPS, TITSTEP1, TITSTEP2, TITSTEP3, '+
    'TITSTEP4, TITSTEP5, TITSTEP6, TITSTEP7, TITSTEP8, TITSTEP9, '+
    'TITSTEP10, TITSTEP11, TITSTEP12, TITSTEP13, TITSTEP14, TITSTEP15, '+ // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    'TITSTEP16, TITSTEP17, TITSTEP18, TITSTEP19, TITSTEP20'); // Edilaine Ferraresi - SOL 171426 / KTN 1537613
  CdsFaixa.Data := CtrlFaixaSal.ListFaixaSal;

  dblcFaixa.Selected.Clear;
  dblcFaixa.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
  dblcFaixa.Selected.Add('DATAEFETIV'      +#9+'15'+#9+ 'Data Efetivação');
  for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
    dblcFaixa.Selected.Add('STEP' +IntToStr(c)+#9+'15'+#9+
      CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);
end;

procedure TfrmCadClasse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlClasseSal);
  FreeAndNil(CtrlFaixaSal);
  FreeAndNil(CtrlGrupFunc);
  inherited;
end;

procedure TfrmCadClasse.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    Sel(MontaSelect.ValoresChave[0]);

  HabilitaBtAtualizarFaixas;
end;

procedure TfrmCadClasse.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('CODGRPFUNC').asString := Cds.FieldByName('CODGRPFUNC').asString;
  CdsDet.FieldByName('MINIMO').asInteger := 0;
  CdsDet.FieldByName('MAXIMO').asInteger := 0;
end;

procedure TfrmCadClasse.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  HabilitaBtAtualizarFaixas;
end;

procedure TfrmCadClasse.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  HabilitaBtAtualizarFaixas;
end;

procedure TfrmCadClasse.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadClasse.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadClasse.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dbedMinimo.CanFocus) then
    dbedMinimo.SetFocus;
end;

procedure TfrmCadClasse.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  sbtnFaixas.Enabled := false;
end;

procedure TfrmCadClasse.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dbedMinimo.Text) = '') then
  begin
    MsgDlg('Indique a Pontuação Mínima.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedMinimo.SetFocus;
  end
  else
  if (Trim(dbedMaximo.Text) = '') then
  begin
    MsgDlg('Indique a Pontuação Máxima.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedMaximo.SetFocus;
  end
  else
  if (Trim(dblcFaixa.Text) = '') then
  begin
    MsgDlg('Selecione uma Faixa Salarial.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblcFaixa.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadClasse.sbtnFaixasClick(Sender: TObject);
begin
  if (MsgDlg('Confirma Atualização das Faixas?', 'Confirmação', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
  begin
    frmAguarde.Mostra('Atualizando Faixas...');
    if (CtrlClasseSal.AtualizarFaixas(Cds.FieldByName('CODGRPFUNC').asString)) then
    begin
      frmAguarde.Apaga;
      MsgDlg(CtrlClasseSal.MessageInfo, 'Informação', mtInformation, [mbOk, mbHelp], 0);
    end
    else
    begin
      frmAguarde.Apaga;
      raise Exception.Create(CtrlClasseSal.MessageInfo);
    end;
  end;
end;

procedure TfrmCadClasse.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  CmeCadastroFind(Sender);
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadClasse.Sel(CodGrpFunc: string);
begin
  Cds.Data := CtrlGrupFunc.ListGrupoFunc(CodGrpFunc);
  CdsDet.Data := CtrlClasseSal.ListClasseSal(CodGrpFunc);
end;

function TfrmCadClasse.GravarRegistro: boolean;
begin
  Result := CtrlClasseSal.GravarClasseSal;
  if not(Result) then
    raise Exception.Create(CtrlClasseSal.MessageInfo);
end;

procedure TfrmCadClasse.HabilitaBtAtualizarFaixas;
begin
  sbtnFaixas.Enabled := (CdsDet.Active) and (CdsDet.State = dsBrowse) and not(CdsDet.IsEmpty);
end;

end.
