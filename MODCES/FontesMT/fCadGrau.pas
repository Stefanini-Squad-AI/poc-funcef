//******************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 10/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
// *****************************************************************************

unit fCadGrau;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  wwdbedit, wwdblook, DBCtrls, CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio,
  IvMulti, IvEMulti, Db, Wwdatsrc, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Grids, fCadastroMestreDetMT, DBClient,
  uCMClientDataSet, uCtrlGrau, uCtrlGlobalRH, uCtrlFatorAval, uCtrlFaixaSal, uCtrlCargo;

type
  TfrmCadGrau = class(TFrmCadastroMestreDetMT)
    Label6: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dbedCodCargo: TDBEdit;
    dbedTitulo: TDBEdit;
    dblcFaixa: TwwDBLookupCombo;
    dbedGrupo: TwwDBEdit;
    edPontos: TEdit;
    Label3: TLabel;
    dblcFatorAval: TwwDBLookupCombo;
    Label5: TLabel;
    dbedGrau: TwwDBEdit;
    Label7: TLabel;
    CdsDet: TCMClientDataSet;
    CdsFaixaSal: TCMClientDataSet;
    CdsFatorAval: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    CtrlGrau: TCtrlGrau;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlFatorAval: TCtrlFatorAval;
    CtrlFaixaSal: TCtrlFaixaSal;
    CtrlCargo: TCtrlCargo;

    iTotPontosAnterior, iTotPontos: integer;

    procedure SelPrincipal(IdCargo: double);
    procedure SelDetalhe(IdCargo: double);
    procedure AtualizarTotalPontos;
    function  GravarRegistro: boolean;
  end;

var
  frmCadGrau: TfrmCadGrau;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadGrau.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  CtrlGrau := TCtrlGrau.Create;
  CtrlGrau.InitializeAs(Padroes);
  CtrlGrau.CdsCargo := Cds;
  CtrlGrau.CdsGrau := CdsDet;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlFatorAval := TCtrlFatorAval.Create;
  CtrlFatorAval.InitializeAs(Padroes);

  CtrlFaixaSal := TCtrlFaixaSal.Create(Sistema.IdEmpresa);
  CtrlFaixaSal.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  sbtnProcurarClick(Sender);
  if not(MontaSelect.RetornouValor) then
  begin
    SelPrincipal(-1);
    SelDetalhe(-1);
  end;

  CdsFatorAval.Data := CtrlFatorAval.ListFatorAval(0, '0,2');

  dblcFaixa.Selected.Clear;
  dblcFaixa.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
  dblcFaixa.Selected.Add('DATAEFETIV'      +#9+'15'+#9+ 'Data Efetivação');

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('NumSteps, TitStep1, TitStep2, TitStep3, '+
    'TitStep4, TitStep5, TitStep6, TitStep7, TitStep8, TitStep9,'+ // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    'TitStep10, TitStep11, TitStep12, TitStep13, TitStep14, TitStep15,'+ // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    'TitStep16, TitStep17, TitStep18, TitStep19, TitStep20'); // Edilaine Ferraresi - SOL 171426 / KTN 1537613

  for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
    dblcFaixa.Selected.Add('STEP' +IntToStr(c)+#9+'10'+#9+
      CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);

end;

procedure TfrmCadGrau.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlGrau);
  FreeAndNil(CtrlFatorAval);
  FreeAndNil(CtrlFaixaSal);
  FreeAndNil(CtrlCargo);
  inherited;
end;

procedure TfrmCadGrau.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    SelPrincipal(StrToFloat(MontaSelect.ValoresChave[0]));
    SelDetalhe(StrToFloat(MontaSelect.ValoresChave[0]));
  end;
end;

procedure TfrmCadGrau.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsDet.FieldByName('IDCARGO').asFloat := Cds.FieldByName('IDCARGO').asFloat;
  CdsDet.FieldByName('GRAU').asInteger := 0;
end;

procedure TfrmCadGrau.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  if (iTotPontosAnterior <> iTotPontos) then
  begin
    if (CtrlGrau.AlterarFaixaSal(Cds.FieldByName('CodGrpFunc').asString, iTotPontos)) then
      inherited
    else
      MsgDlg('Ocorreu um erro ao tentar alterar a Faixa Salarial para este cargo.'+CR_LF+
         'Erro:' +CR_LF+ CtrlGrau.MessageInfo, 'Erro', mtWarning, [mbOk,mbHelp], 0);
  end;
end;

procedure TfrmCadGrau.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  SelPrincipal(StrToFloat(MontaSelect.ValoresChave[0]));
  SelDetalhe(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadGrau.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  SelDetalhe(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadGrau.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadGrau.CmeDetalheDelete(Sender: TObject);
begin
  Dec(iTotPontos, CdsDet.FieldByName('NOTA').asInteger);
  edPontos.Text := IntToStr(iTotPontos);
  inherited;
end;

procedure TfrmCadGrau.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) and (dblcFatorAval.CanFocus) then
    dblcFatorAval.SetFocus;
end;

procedure TfrmCadGrau.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcFatorAval.Text) = '') then
  begin
    MsgDlg('Selecione um Fator de Avaliação.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblcFatorAval.SetFocus;
  end
  else
  if (StrToIntDef(Trim(dbedGrau.Text), 0) = 0) then
  begin
    MsgDlg('Indique o Grau a ser atribuído.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dbedGrau.SetFocus;
  end
  else
  begin
    CdsDet.FieldByName('DESCRFATORAVAL').asString := Trim(dblcFatorAval.Text);

    if (CdsDet.State = dsEdit) then
      iTotPontos := iTotPontos - CdsDet.FieldByName('NOTA').asInteger;

    AtualizarTotalPontos;  
    inherited;
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadGrau.AtualizarTotalPontos;
begin
  if (CtrlGrau.FazerOnCalcFields(Cds.FieldByName('CodGrpFunc').asString,
      CdsDet.FieldByName('IdFatorAval').asFloat, iTotPontos, false)) then
    edPontos.Text := IntToStr(iTotPontos)
  else
    edPontos.Text := '0';
end;

procedure TfrmCadGrau.SelPrincipal(IdCargo: double);
begin
  Cds.Data := CtrlCargo.ListCargoXGrupoFunc(IdCargo);
  if not(Cds.IsEmpty) then
    if (Cds.FieldByName('IdFaixaSalarial').asFloat = 0) then
      CdsFaixaSal.Data := CtrlFaixaSal.ListFaixaSal(-1)
    else
      CdsFaixaSal.Data := CtrlFaixaSal.ListFaixaSal(
        Cds.FieldByName('IdFaixaSalarial').asFloat);
end;

procedure TfrmCadGrau.SelDetalhe(IdCargo: double);
begin
  CdsDet.DisableControls;
  CdsDet.Data := CtrlGrau.ListGrausDoCargo(IdCargo);
  iTotPontosAnterior := iTotPontos;
  iTotPontos := 0;
  while not(CdsDet.EOF) do
  begin
    if not(CtrlGrau.FazerOnCalcFields(Cds.FieldByName('CodGrpFunc').asString,
        CdsDet.FieldByName('IdFatorAval').asFloat, iTotPontos)) then
    begin
      MsgDlg('Ocorreu um erro ao tentar calcular a Nota para o Fator:' +CR_LF+
        CdsDet.FieldByName('DescrFatorAval').asString +CR_LF+ 'Erro:' +CR_LF+
        CtrlGrau.MessageInfo, 'Erro', mtWarning, [mbOk,mbHelp], 0);
      break;
    end;
    CdsDet.Next;
  end;
  CdsDet.First;
  CdsDet.EnableControls;

  edPontos.Text := IntToStr(iTotPontos);
end;

function TfrmCadGrau.GravarRegistro: boolean;
begin
  Result := CtrlGrau.GravarGrausDoCargo;
  if not(Result) then
    raise Exception.Create(CtrlGrau.MessageInfo);
end;

end.
