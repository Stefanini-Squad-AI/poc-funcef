unit fSelSimul;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, TB97, DBClient,
  ComCtrls, TB97Tlbr, IvDictio, IvMulti, TREdit, IvEMulti, wwdbdatetimepicker, uCmSqlParams,
  CMDateTimePicker, uCMClientDataSet, CmParamReport, fSelPessoalMT, uCtrlAumentosSalariais;

type
  TfrmSelSimul = class(TfrmSelPessoalMT)
    lblFaixa3: TLabel;
    lblFaixa4: TLabel;
    lblFaixa5: TLabel;
    lblFaixa6: TLabel;
    lblFaixa7: TLabel;
    lblFaixa8: TLabel;
    lblTotail: TLabel;
    lblAcum: TLabel;
    lblAte: TLabel;
    lblPessoas: TLabel;
    lblbAtual: TLabel;
    lblCorrigido: TLabel;
    lblAumento: TLabel;
    redMax1: TRealEdit;
    redNumPessoas1: TRealEdit;
    redValAtual1: TRealEdit;
    redValCorrigido1: TRealEdit;
    redPercAumento1: TRealEdit;
    redMax2: TRealEdit;
    redNumPessoas2: TRealEdit;
    redValAtual2: TRealEdit;
    redValCorrigido2: TRealEdit;
    redPercAumento2: TRealEdit;
    redMax3: TRealEdit;
    redNumPessoas3: TRealEdit;
    redValAtual3: TRealEdit;
    redValCorrigido3: TRealEdit;
    redPercAumento3: TRealEdit;
    redMax4: TRealEdit;
    redNumPessoas4: TRealEdit;
    redValAtual4: TRealEdit;
    redValCorrigido4: TRealEdit;
    redPercAumento4: TRealEdit;
    redMax5: TRealEdit;
    redNumPessoas5: TRealEdit;
    redValAtual5: TRealEdit;
    redValCorrigido5: TRealEdit;
    redPercAumento5: TRealEdit;
    redMax6: TRealEdit;
    redNumPessoas6: TRealEdit;
    redValAtual6: TRealEdit;
    redValCorrigido6: TRealEdit;
    redPercAumento6: TRealEdit;
    redMax7: TRealEdit;
    redNumPessoas7: TRealEdit;
    redValAtual7: TRealEdit;
    redValCorrigido7: TRealEdit;
    redPercAumento7: TRealEdit;
    redMax8: TRealEdit;
    redNumPessoas8: TRealEdit;
    redValAtual8: TRealEdit;
    redValCorrigido8: TRealEdit;
    redPercAumento8: TRealEdit;
    redNumPessoas9: TRealEdit;
    redValAtual9: TRealEdit;
    redValCorrigido9: TRealEdit;
    redPercAumento9: TRealEdit;
    redNumPessoas10: TRealEdit;
    redValAtual10: TRealEdit;
    redValCorrigido10: TRealEdit;
    redPercAumento10: TRealEdit;
    lblFaixa1: TLabel;
    lblFaixa2: TLabel;
    tbshSimul: TTabSheet;
    rgTipoSimul: TRadioGroup;
    rgTipoArred: TRadioGroup;
    gbxValores: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    redFaixaMax1: TRealEdit;
    redPercentual1: TRealEdit;
    redParcela1: TRealEdit;
    redPiso1: TRealEdit;
    redFaixaMax2: TRealEdit;
    redPercentual2: TRealEdit;
    redParcela2: TRealEdit;
    redPiso2: TRealEdit;
    redFaixaMax3: TRealEdit;
    redPercentual3: TRealEdit;
    redParcela3: TRealEdit;
    redPiso3: TRealEdit;
    redFaixaMax4: TRealEdit;
    redPercentual4: TRealEdit;
    redParcela4: TRealEdit;
    redPiso4: TRealEdit;
    redFaixaMax5: TRealEdit;
    redPercentual5: TRealEdit;
    redParcela5: TRealEdit;
    redPiso5: TRealEdit;
    redFaixaMax6: TRealEdit;
    redPercentual6: TRealEdit;
    redParcela6: TRealEdit;
    redPiso6: TRealEdit;
    redFaixaMax7: TRealEdit;
    redPercentual7: TRealEdit;
    redParcela7: TRealEdit;
    redPiso7: TRealEdit;
    redFaixaMax8: TRealEdit;
    redPercentual8: TRealEdit;
    redParcela8: TRealEdit;
    redPiso8: TRealEdit;
    gbxUnico: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    redPercUn: TRealEdit;
    redParcUn: TRealEdit;
    redPisoUn: TRealEdit;
    bbtnEfetivar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnEfetivarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure redPercUnChange(Sender: TObject);
    procedure rgTipoSimulClick(Sender: TObject);
  private
    CtrlAumentosSalariais: TCtrlAumentosSalariais;

    FaixaMax, Percentual, Parcela, Piso: array [1..8] of TRealEdit;

    procedure HabilitaBtOk;
    procedure Progresso(Args: array of variant);
  end;

var
  frmSelSimul: TfrmSelSimul;

implementation

uses uSistema, uMensErro, uCtrlPadroes, fEfetivaSimul, uCtrlFuncoesRH, fAguarde,
  REtiquetaAlteracaoCTPS;

{$R *.DFM}

procedure TfrmSelSimul.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  CtrlAumentosSalariais := TCtrlAumentosSalariais.Create;
  CtrlAumentosSalariais.InitializeAs(Padroes);
  CtrlAumentosSalariais.CdsPessoal := CdsPrincipal;
  CtrlAumentosSalariais.Progresso := Progresso;

  frmEfetivaSimul := TfrmEfetivaSimul.Create(Self);

  for c:=1 to 8 do
  begin
    FaixaMax[c] := TRealEdit(Self.FindComponent('redFaixaMax'+IntToStr(c)));
    Percentual[c] := TRealEdit(Self.FindComponent('redPercentual'+IntToStr(c)));
    Parcela[c] := TRealEdit(Self.FindComponent('redParcela'+IntToStr(c)));
    Piso[c] := TRealEdit(Self.FindComponent('redPiso'+IntToStr(c)));
  end;

  CtrlAumentosSalariais.NumVez := 0;

  case (Sistema.IdModulo) of
    MODCES : Caption := 'Simulação e Implementação de Aumentos Gerais';
    MODFOL : Caption := 'Reajuste Salarial';
  end;
end;

procedure TfrmSelSimul.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlAumentosSalariais);
  FreeAndNil(frmEfetivaSimul);
  inherited;
end;

procedure TfrmSelSimul.FormShow(Sender: TObject);
begin
  inherited;
  redPercUn.SetFocus;
end;

procedure TfrmSelSimul.redPercUnChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmSelSimul.rgTipoSimulClick(Sender: TObject);
begin
  gbxValores.Visible := (rgTipoSimul.ItemIndex = 1);
  gbxUnico.Visible := (rgTipoSimul.ItemIndex = 0);

  if (rgTipoSimul.ItemIndex = 0) then
    redPercUn.SetFocus
  else
    redFaixaMax1.SetFocus;

  redPercUnChange(Sender);
end;

procedure TfrmSelSimul.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  rgSequencia.Visible := false;
  bbtnEfetivar.Visible := false;
  ToolbarSep972.Visible := false;
end;

procedure TfrmSelSimul.bbtnEfetivarClick(Sender: TObject);
begin
  if (frmEfetivaSimul.ShowModal = mrOk) then
  begin
    bbtnConfirmarClick(Sender);
    bbtnEfetivar.Visible := false;
    ToolbarSep972.Visible := false;
  end;  
end;

procedure TfrmSelSimul.bbtnConfirmarClick(Sender: TObject);
var
  c: byte;
  bOk: boolean;
begin
  CtrlAumentosSalariais.Efetivar := (Sender = bbtnEfetivar);

  try
    if not(CtrlAumentosSalariais.Efetivar) then
    begin
      frmAguarde.Mostra('Selecionando Dados...');
      frmAguarde.Update;
      inherited;
      ModalResult := mrNone;
      frmAguarde.Update;
    end
    else
      frmAguarde.Mostra('Gravando Dados...');

    frmAguarde.Min := 0;
    frmAguarde.Max := CdsPrincipal.RecordCount;
    frmAguarde.Update;

    CtrlAumentosSalariais.TipoSimul := rgTipoSimul.ItemIndex;
    CtrlAumentosSalariais.TipoArred := rgTipoArred.ItemIndex;
    CtrlAumentosSalariais.PercentualUnico := redPercUn.Value;
    CtrlAumentosSalariais.ValorASomarUnico := redParcUn.Value;
    CtrlAumentosSalariais.PisoUnico := redPisoUn.Value;

    for c:=1 to 8 do
    begin
      CtrlAumentosSalariais.Max[c] := TRealEdit(Self.FindComponent('redFaixaMax'+IntToStr(c))).Value;
      CtrlAumentosSalariais.Per[c] := TRealEdit(Self.FindComponent('redPercentual'+IntToStr(c))).Value;
      CtrlAumentosSalariais.Parc[c] := TRealEdit(Self.FindComponent('redParcela'+IntToStr(c))).Value;
      CtrlAumentosSalariais.Piso[c] := TRealEdit(Self.FindComponent('redPiso'+IntToStr(c))).Value;
    end;

    if not(CtrlAumentosSalariais.Efetivar) then
    begin
      CtrlAumentosSalariais.NumVez := CtrlAumentosSalariais.NumVez + 1;

      if (CtrlAumentosSalariais.NumVez > 1) and
         (MsgDlg('Acumula com a(s) Anterior(es)?', 'Confirmação',
          mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
        CtrlAumentosSalariais.NumVez := 1;
    end;

    CtrlAumentosSalariais.CreateThreadProgresso;
    bOk := CtrlAumentosSalariais.ImplementarAumentosSalariais(Sistema.IdEmpresa,
      frmEfetivaSimul.IdMotivo, frmEfetivaSimul.DataAlteracao);
    CtrlAumentosSalariais.FreeThreadProgresso;

    frmAguarde.Apaga;
    if (bOk) and (CtrlAumentosSalariais.Efetivar) and (frmEfetivaSimul.ImprimirEtiquetas) then
    begin
      RptEtiquetaAlteracaoCTPS := TRptEtiquetaAlteracaoCTPS.Create(Application);
      with (RptEtiquetaAlteracaoCTPS.sqlEtiquetaAlteracaoCTPS.SQL) do
      begin
        Clear;
        Add('SELECT');
        Add('  TO_CHAR(H.DATAALTERFUNC,''DD/MM/YYYY'') AS DATA,');
        Add('  DECODE(F.IDCARGO,C.IDCARGO,''A mesma'',C.TITULO) AS NOVAFUNCAO,');
        Add('  H.SALARIO AS NOVOSALARIO, F.MATRICULA,');
        Add('  (' +QuotedStr(FU.Replicate(' ',45))+ ' || MO.DESCRICAO) AS MOTIVO,');
        Add('  C.CBO2002 AS CBO');
        Add('FROM');
        Add('  EVOLFUNC H, FUNCIONARIO F, MOTIVO MO, CARGO C');
        Add('WHERE');
        Add('  (MO.GRUPOMOTIVO IN (''A'',''D'')) AND');
        Add('  (H.DATAALTERFUNC = TO_DATE(' +
          QuotedStr(DateToStr(frmEfetivaSimul.DataAlteracao))+ ',''DD/MM/YYYY'')) AND');
        Add('  (' +CtrlAumentosSalariais.ListaIdPessoa+ ') AND');
        Add('  (H.IDPESSOA      = F.IDPESSOA) AND');
        Add('  (H.IDMOTIVO      = MO.IDMOTIVO(+)) AND');
        Add('  (H.IDCARGO       = C.IDCARGO(+))');
      end;

      RptEtiquetaAlteracaoCTPS.CrmRptCMBeforePrint(Sender);
      RptEtiquetaAlteracaoCTPS.CrmRptCM.IdReports := 3674;
      RptEtiquetaAlteracaoCTPS.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
      RptEtiquetaAlteracaoCTPS.CrmRptCM.OrigemCM := 1;
      RptEtiquetaAlteracaoCTPS.CrmRptCM.IdModulo := Sistema.IdModulo;
      RptEtiquetaAlteracaoCTPS.CrmRptCM.IdUsuario := Sistema.IdUsuario;
      RptEtiquetaAlteracaoCTPS.CrmRptCM.Print;
      FreeAndNil(RptEtiquetaAlteracaoCTPS);
    end;

    if not(CtrlAumentosSalariais.Efetivar) then
    begin
      if (CtrlAumentosSalariais.TipoSimul = 0) then
        redMax1.Value := 99999999
      else
      begin
        for c:=1 to 8 do
          TRealEdit(Self.FindComponent('redMax'+IntToStr(c))).Value := CtrlAumentosSalariais.Max[c];
      end;

      for c:=1 to 10 do
      begin
        bbtnEfetivar.Visible := bbtnEfetivar.Visible or (CtrlAumentosSalariais.NumPessoas[c] > 0);
        TRealEdit(Self.FindComponent('redNumPessoas'+IntToStr(c))).Value := CtrlAumentosSalariais.NumPessoas[c];
        TRealEdit(Self.FindComponent('redValAtual'+IntToStr(c))).Value := CtrlAumentosSalariais.ValAtual[c];
        TRealEdit(Self.FindComponent('redValCorrigido'+IntToStr(c))).Value := CtrlAumentosSalariais.ValCorrigido[c];
        TRealEdit(Self.FindComponent('redPercAumento'+IntToStr(c))).Value := CtrlAumentosSalariais.PercAumento[c];
      end;

      redNumPessoas10.Visible := (CtrlAumentosSalariais.NumVez > 1);
      redValAtual10.Visible := redNumPessoas10.Visible;
      redValCorrigido10.Visible := redNumPessoas10.Visible;
      redPercAumento10.Visible := redNumPessoas10.Visible;
      lblAcum.Visible := redNumPessoas10.Visible;
      ToolbarSep972.Visible := bbtnEfetivar.Visible;
    end;

    if (CtrlAumentosSalariais.Efetivar) then
    begin
      MsgDlg(CtrlAumentosSalariais.MessageInfo, 'Aviso', mtWarning, [mbOk, mbHelp], 0);
      bbtnOutraVezClick(Sender);
    end;
  except
    on E: Exception do
    begin
      MsgDlg(E.Message, 'Aviso', mtError, [mbOk, mbHelp], 0);
    end;
  end;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmSelSimul.HabilitaBtOk;
begin
  if (gbxValores.Visible) then
  begin
    bbtnConfirmar.Enabled :=
      ((FaixaMax[1].Value <> 0) and
       ((Percentual[1].Value <> 0) or (Parcela[1].Value <> 0) or (Piso[1].Value <> 0))) or

      ((FaixaMax[2].Value <> 0) and
       ((Percentual[2].Value <> 0) or (Parcela[2].Value <> 0) or (Piso[2].Value <> 0))) or

      ((FaixaMax[3].Value <> 0) and
       ((Percentual[3].Value <> 0) or (Parcela[3].Value <> 0) or (Piso[3].Value <> 0))) or

      ((FaixaMax[4].Value <> 0) and
       ((Percentual[4].Value <> 0) or (Parcela[4].Value <> 0) or (Piso[4].Value <> 0))) or

      ((FaixaMax[5].Value <> 0) and
       ((Percentual[5].Value <> 0) or (Parcela[5].Value <> 0) or (Piso[5].Value <> 0))) or

      ((FaixaMax[6].Value <> 0) and
       ((Percentual[6].Value <> 0) or (Parcela[6].Value <> 0) or (Piso[6].Value <> 0))) or

      ((FaixaMax[7].Value <> 0) and
       ((Percentual[7].Value <> 0) or (Parcela[7].Value <> 0) or (Piso[7].Value <> 0))) or

      ((FaixaMax[8].Value <> 0) and
       ((Percentual[8].Value <> 0) or (Parcela[8].Value <> 0) or (Piso[8].Value <> 0)));
  end
  else
    bbtnConfirmar.Enabled :=
      (redPercUn.Value <> 0) or (redParcUn.Value <> 0) or (redPisoUn.Value <> 0);
end;

procedure TfrmSelSimul.Progresso(Args: array of variant);
begin
  if (Args[0] > 0) then
  begin
    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  end;
end;

end.
