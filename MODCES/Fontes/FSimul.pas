unit fSimul;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoal, Db,
  DBTables, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  Wwquery, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, TREdit, uImprimeRelatorio, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSimul = class(TfrmSelPessoal)
    tblHstces: TwwTable;
    bbtnEfetivar: TBitBtn;
    tblFunci2: TwwTable;
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
    rednMax1: TRealEdit;
    rednPer1: TRealEdit;
    rednSalat1: TRealEdit;
    rednSalcr1: TRealEdit;
    rednRes1: TRealEdit;
    rednMax2: TRealEdit;
    rednPer2: TRealEdit;
    rednSalat2: TRealEdit;
    rednSalcr2: TRealEdit;
    rednRes2: TRealEdit;
    rednMax3: TRealEdit;
    rednPer3: TRealEdit;
    rednSalat3: TRealEdit;
    rednSalcr3: TRealEdit;
    rednRes3: TRealEdit;
    rednMax4: TRealEdit;
    rednPer4: TRealEdit;
    rednSalat4: TRealEdit;
    rednSalcr4: TRealEdit;
    rednRes4: TRealEdit;
    rednMax5: TRealEdit;
    rednPer5: TRealEdit;
    rednSalat5: TRealEdit;
    rednSalcr5: TRealEdit;
    rednRes5: TRealEdit;
    rednMax6: TRealEdit;
    rednPer6: TRealEdit;
    rednSalat6: TRealEdit;
    rednSalcr6: TRealEdit;
    rednRes6: TRealEdit;
    rednMax7: TRealEdit;
    rednPer7: TRealEdit;
    rednSalat7: TRealEdit;
    rednSalcr7: TRealEdit;
    rednRes7: TRealEdit;
    rednMax8: TRealEdit;
    rednPer8: TRealEdit;
    rednSalat8: TRealEdit;
    rednSalcr8: TRealEdit;
    rednRes8: TRealEdit;
    rednPer9: TRealEdit;
    rednSalat9: TRealEdit;
    rednSalcr9: TRealEdit;
    rednRes9: TRealEdit;
    rednPer10: TRealEdit;
    rednSalat10: TRealEdit;
    rednSalcr10: TRealEdit;
    rednRes10: TRealEdit;
    lblFaixa1: TLabel;
    lblFaixa2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnEfetivarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    bImprimeEtiqueta: boolean;
    procedure ImplementaSolicitacao;
  public
    idMotivo: integer;
    sDataAlteracao: string;
    ImprimeRelatorio: TImprimeRelatorio;
  end;

var
  frmSimul: TfrmSimul;
  LimSalario, ValParcela, ValorPiso: array[1..8] of real;
  TotPessoas: array[1..10] of integer;
  PerAumento: array[1..8]  of real;
  TotSalario, TotSimula, ResAumento: array[1..10] of real;
  BasSalario, Parcela: real;

implementation

uses uMensErro, fSelSimul, fEfetiva, fTelaAut, uFuncoesUteis, dRelatorioEtiqAltCTPS;

{$R *.DFM}

procedure TfrmSimul.FormCreate(Sender: TObject);
begin
  inherited;
  ImprimeRelatorio := TImprimeRelatorio.Create;

  // Registro o Form de visualização das Etiquetas e Carrego a configuração destas
  with (dtmRelatorioEtiqAltCTPS) do
    ImprimeRelatorio.Iniciar(dsgnEtiquetasAltCTPS, rpEtiquetasAltCTPS, ppEtiquetasAltCTPS,
      qryEtiquetasAltCTPS, GetLayoutPadrao, 'Etiquetas para Atualização de CTPS',
      'rpEtiquetasAltCTPS', 'Etiquetas.tmp', 21);

  tblHstces.Open;
  tblFunci2.Open;
end;

procedure TfrmSimul.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ImprimeRelatorio);
  inherited;
end;

procedure TfrmSimul.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  rgSequencia.Visible := false;
  bbtnEfetivar.Visible := false;
end;

procedure TfrmSimul.bbtnEfetivarClick(Sender: TObject);
begin
  if (AbrirFormModal(frmEfetiva, TfrmEfetiva) <> mrCancel) then
  begin
    // Rotina de Efetivação
    bImprimeEtiqueta := (MsgDlg('Deseja imprimir Etiquetas de Atualização?', 'Aviso',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes);
    bbtnConfirmarClick(bbtnEfetivar);
    bbtnEfetivar.Visible := false;
  end;
end;

procedure TfrmSimul.bbtnConfirmarClick(Sender: TObject);
var
  IND: Integer;
  sListaPessoas: string;
  Fator, Ajuste, VlParc: real;
begin
  inherited;
  ModalResult := mrNone;
  Ajuste := 0.49;
  Fator := 100;

  case (frmSelSimul.rgTipoArre.ItemIndex) of
    1 : Fator := 10;
    2 : Fator := 1;
    3 : Fator := 0.10;
    4 : Fator := 0.01;
  end;

  if (frmSelSimul.rgTipoArre.ItemIndex = 0) then
    Ajuste := 0;

  if (Sender <> bbtnEfetivar) then
  begin
    Inc(frmSelSimul.NumVez);

    if (frmSelSimul.NumVez > 1) then
      if (MsgDlg('Acumula com a(s) Anterior(es) ?', LerMensagem(4),
        mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
      begin
        TotSalario[10] := 0;
        ResAumento[10] := 0;
        TotPessoas[10] := 0;
        TotSimula[10]  := 0;
        frmSelSimul.NumVez := 1;
      end;

    for IND:=1 to 8 do
    begin
      LimSalario[IND] := 0;
      PerAumento[IND] := 0;
      ValParcela[IND] := 0;
      ValorPiso[IND] := 0;
    end;

    for IND:=1 to 9 do
    begin
      TotSalario[IND] := 0;
      ResAumento[IND] := 0;
      TotPessoas[IND] := 0;
      TotSimula[IND] := 0;
    end;
  end;

  if (frmSelSimul.rgTipoSimul.ItemIndex = 0) then
  begin
    LimSalario[1] := 99999999;

    if (frmSelSimul.rednPercUn.Value <> 0) then
      PerAumento[1] := frmSelSimul.rednPercUn.Value;

    if (frmSelSimul.rednParcUn.Value <> 0) then
      ValParcela[1] := frmSelSimul.rednParcUn.Value;

    if (frmSelSimul.rednPisoUn.Value <> 0) then
      ValorPiso[1] := frmSelSimul.rednPisoUn.Value;
  end
  else
  begin
    if (frmSelSimul.rednMax1.Value <> 0) then
      LimSalario[1] := frmSelSimul.rednMax1.Value;
    if (frmSelSimul.rednPer1.Value <> 0) then
      PerAumento[1] := frmSelSimul.rednPer1.Value;
    if (frmSelSimul.rednParc1.Value <> 0) then
      ValParcela[1] := frmSelSimul.rednParc1.Value;
    if (frmSelSimul.rednPiso1.Value <> 0) then
      ValorPiso[1]  := frmSelSimul.rednPiso1.Value;

    if (frmSelSimul.rednMax2.Value <> 0) then
      LimSalario[2] := frmSelSimul.rednMax2.Value;
    if (frmSelSimul.rednPer2.Value <> 0) then
      PerAumento[2] := frmSelSimul.rednPer2.Value;
    if (frmSelSimul.rednParc2.Value <> 0) then
      ValParcela[2] := frmSelSimul.rednParc2.Value;
    if (frmSelSimul.rednPiso2.Value <> 0) then
      ValorPiso[2]  := frmSelSimul.rednPiso2.Value;

     if (frmSelSimul.rednMax3.Value <> 0) then
       LimSalario[3] := frmSelSimul.rednMax3.Value;
     if (frmSelSimul.rednPer3.Value <> 0) then
       PerAumento[3] := frmSelSimul.rednPer3.Value;
     if (frmSelSimul.rednParc3.Value <> 0) then
       ValParcela[3] := frmSelSimul.rednParc3.Value;
     if (frmSelSimul.rednPiso3.Value <> 0) then
       ValorPiso[3]  := frmSelSimul.rednPiso3.Value;

     if (frmSelSimul.rednMax4.Value <> 0) then
       LimSalario[4] := frmSelSimul.rednMax4.Value;
     if (frmSelSimul.rednPer4.Value <> 0) then
       PerAumento[4] := frmSelSimul.rednPer4.Value;
     if (frmSelSimul.rednParc4.Value <> 0) then
       ValParcela[4] := frmSelSimul.rednParc4.Value;
     if (frmSelSimul.rednPiso4.Value <> 0) then
       ValorPiso[4]  := frmSelSimul.rednPiso4.Value;

     if (frmSelSimul.rednMax5.Value <> 0) then
       LimSalario[5] := frmSelSimul.rednMax5.Value;
     if (frmSelSimul.rednPer5.Value <> 0) then
       PerAumento[5] := frmSelSimul.rednPer5.Value;
     if (frmSelSimul.rednParc5.Value <> 0) then
       ValParcela[5] := frmSelSimul.rednParc5.Value;
     if (frmSelSimul.rednPiso5.Value <> 0) then
       ValorPiso[5]  := frmSelSimul.rednPiso5.Value;

     if (frmSelSimul.rednMax6.Value <> 0) then
       LimSalario[6] := frmSelSimul.rednMax6.Value;
     if (frmSelSimul.rednPer6.Value <> 0) then
       PerAumento[6] := frmSelSimul.rednPer6.Value;
     if (frmSelSimul.rednParc6.Value <> 0) then
       ValParcela[6] := frmSelSimul.rednParc6.Value;
     if (frmSelSimul.rednPiso6.Value <> 0) then
       ValorPiso[6]  := frmSelSimul.rednPiso6.Value;

     if (frmSelSimul.rednMax7.Value <> 0) then
       LimSalario[7] := frmSelSimul.rednMax7.Value;
     if (frmSelSimul.rednPer7.Value <> 0) then
       PerAumento[7] := frmSelSimul.rednPer7.Value;
     if (frmSelSimul.rednParc7.Value <> 0) then
       ValParcela[7] := frmSelSimul.rednParc7.Value;
     if (frmSelSimul.rednPiso7.Value <> 0) then
       ValorPiso[7]  := frmSelSimul.rednPiso7.Value;

     if (frmSelSimul.rednMax8.Value <> 0) then
       LimSalario[8] := frmSelSimul.rednMax8.Value;
     if (frmSelSimul.rednPer8.Value <> 0) then
       PerAumento[8] := frmSelSimul.rednPer8.Value;
     if (frmSelSimul.rednParc8.Value <> 0) then
       ValParcela[8] := frmSelSimul.rednParc8.Value;
     if (frmSelSimul.rednPiso8.Value <> 0) then
       ValorPiso[8]  := frmSelSimul.rednPiso8.Value;
  end;

  sListaPessoas := '';
  while not(ds.Dataset.EOF) do
  begin
    VALOR := ds.Dataset.FieldByName('SALARIOATUAL').Value;

    if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'D') then
      VALOR := VALOR * 30
    else
    if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'H') then
      VALOR := VALOR * ds.Dataset.FieldByName('JORNADAMENSAL').asInteger;

    for IND:=1 to 8 do
    begin
      if (LimSalario[IND] = 0) then
        break;
                
      if (IND = 1) then
        BasSalario := 0
      else
        BasSalario := LimSalario[IND-1];

      if (VALOR >= BasSalario) and (VALOR <= LimSalario[IND]) then
      begin
        VlParc := ValParcela[IND];

        if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'D') then
          VlParc := VlParc / 30
        else
        if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'H') then
          VlParc := VlParc / ds.Dataset.FieldByName('JORNADAMENSAL').asInteger;

        Parcela := Round((ds.Dataset.FieldByName('SALARIOATUAL').Value *
                     (100 + PerAumento[IND])/ 100 + VlParc) * Fator + Ajuste) / Fator;

        if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'D') then
          Parcela := Parcela * 30
        else
        if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'H') then
          Parcela := Parcela * ds.Dataset.FieldByName('JORNADAMENSAL').asInteger;

        if (ValorPiso[IND] > Parcela) then
          Parcela := ValorPiso[IND];

        if (Sender <> bbtnEfetivar) then
        begin
          TotPessoas[IND] := TotPessoas[IND] + 1;
          TotSalario[IND] := TotSalario[IND] + VALOR;
          TotSimula[IND]  := TotSimula[IND]  + Parcela;
        end
        else
        begin
          if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'D') then
            Parcela := Parcela / 30
          else
          if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'H') then
            Parcela := Parcela / ds.Dataset.FieldByName('JORNADAMENSAL').asInteger;

          ImplementaSolicitacao;
        end;
        break;
      end;
    end;

    sListaPessoas := sListaPessoas +IFF(sListaPessoas <> '',' OR ','')+
      '(H.IDPESSOA = '+ds.Dataset.FieldByName('IDPESSOA').asString +')';
    ds.Dataset.Next;
  end;

  if (Sender = bbtnEfetivar) then
  begin
    if (bImprimeEtiqueta) then
    begin
      with (ImprimeRelatorio.QueryDados) do
      begin
        Clear;
        Add('SELECT');
        Add('  TO_CHAR(H.DATAALTERFUNC,''DD/MM/YYYY'') AS DATA,');
        Add('  DECODE(F.IDCARGO,C.IDCARGO,''A mesma'',C.TITULO) AS NOVAFUNCAO,');
        Add('  H.SALARIO    AS NOVOSALARIO,');
        Add('  ('+QuotedStr(Replicate(' ',45))+' || MO.DESCRICAO) AS MOTIVO,');
        Add('  C.CBO');
        Add('FROM');
        Add('  EVOLFUNC H, FUNCIONARIO F, MOTIVO MO, CARGO C');
        Add('WHERE');
        Add('  (MO.GRUPOMOTIVO IN (''A'',''D''))  AND');
        Add('  (H.DATAALTERFUNC = TO_DATE(' +QuotedStr(sDataAlteracao)+ ',''DD/MM/YYYY'')) AND');
        Add('  (' +sListaPessoas+ ') AND');
        Add('  (H.IDPESSOA      = F.IDPESSOA)     AND');
        Add('  (H.IDMOTIVO      = MO.IDMOTIVO(+)) AND');
        Add('  (H.IDCARGO       = C.IDCARGO(+))');
      end;

      frmSimul.ImprimeRelatorio.Imprimir ([NULL]);
    end;
    exit;
  end;

  for IND:=1 to 8 do
  begin
    TotSalario[9]  := TotSalario[9]  + TotSalario[IND];
    TotSimula[9]   := TotSimula[9]   + TotSimula[IND];
    TotPessoas[9]  := TotPessoas[9]  + TotPessoas[IND];
    TotSalario[10] := TotSalario[10] + TotSalario[IND];
    TotSimula[10]  := TotSimula[10]  + TotSimula[IND];
    TotPessoas[10] := TotPessoas[10] + TotPessoas[IND];
  end;

  for IND:=1 to 10 do
    if (TotSalario[IND] > 0) then
      ResAumento[IND] := (TotSimula[IND] - TotSalario[IND]) * 100 / TotSalario[IND];

  if (frmSelSimul.rgTipoSimul.ItemIndex = 0) then
    rednMax1.Value := 99999999
  else
  begin
    rednMax1.Value := frmSelSimul.rednMax1.Value;
    rednMax2.Value := frmSelSimul.rednMax2.Value;
    rednMax3.Value := frmSelSimul.rednMax3.Value;
    rednMax4.Value := frmSelSimul.rednMax4.Value;
    rednMax5.Value := frmSelSimul.rednMax5.Value;
    rednMax6.Value := frmSelSimul.rednMax6.Value;
    rednMax7.Value := frmSelSimul.rednMax7.Value;
    rednMax8.Value := frmSelSimul.rednMax8.Value;
  end;

  rednPer1.Value    := TotPessoas[1];
  rednPer2.Value    := TotPessoas[2];
  rednPer3.Value    := TotPessoas[3];
  rednPer4.Value    := TotPessoas[4];
  rednPer5.Value    := TotPessoas[5];
  rednPer6.Value    := TotPessoas[6];
  rednPer7.Value    := TotPessoas[7];
  rednPer8.Value    := TotPessoas[8];
  rednPer9.Value    := TotPessoas[9];
  rednPer10.Value   := TotPessoas[10];
  rednSalat1.Value  := TotSalario[1];
  rednSalat2.Value  := TotSalario[2];
  rednSalat3.Value  := TotSalario[3];
  rednSalat4.Value  := TotSalario[4];
  rednSalat5.Value  := TotSalario[5];
  rednSalat6.Value  := TotSalario[6];
  rednSalat7.Value  := TotSalario[7];
  rednSalat8.Value  := TotSalario[8];
  rednSalat9.Value  := TotSalario[9];
  rednSalat10.Value := TotSalario[10];
  rednSalcr1.Value  := TotSimula[1];
  rednSalcr2.Value  := TotSimula[2];
  rednSalcr3.Value  := TotSimula[3];
  rednSalcr4.Value  := TotSimula[4];
  rednSalcr5.Value  := TotSimula[5];
  rednSalcr6.Value  := TotSimula[6];
  rednSalcr7.Value  := TotSimula[7];
  rednSalcr8.Value  := TotSimula[8];
  rednSalcr9.Value  := TotSimula[9];
  rednSalcr10.Value := TotSimula[10];
  rednRes1.Value    := ResAumento[1];
  rednRes2.Value    := ResAumento[2];
  rednRes3.Value    := ResAumento[3];
  rednRes4.Value    := ResAumento[4];
  rednRes5.Value    := ResAumento[5];
  rednRes6.Value    := ResAumento[6];
  rednRes7.Value    := ResAumento[7];
  rednRes8.Value    := ResAumento[8];
  rednRes9.Value    := ResAumento[9];
  rednRes10.Value   := ResAumento[10];

  rednPer10.Visible    := (frmSelSimul.NumVez > 1);
  rednSalat10.Visible  := (frmSelSimul.NumVez > 1);
  rednSalcr10.Visible  := (frmSelSimul.NumVez > 1);
  rednRes10.Visible    := (frmSelSimul.NumVez > 1);
  lblAcum.Visible      := (frmSelSimul.NumVez > 1);
  bbtnEfetivar.Visible := true;
end;

procedure TfrmSimul.ImplementaSolicitacao;
begin
  //Cria Histórico
  with (tblHstces) do
  begin
    Insert;
    FieldByName('IDPESSOA').asInteger      := tblPessoal.FieldByName('IDPESSOA').asInteger;
    FieldByName('DATAALTERFUNC').asString  := sDataAlteracao;
    FieldByName('CODCENTROCUSTO').asString := tblPessoal.FieldByName('CODCENTROCUSTO').asString;
    FieldByName('IDCARGO').asInteger       := tblPessoal.FieldByName('IDCARGO').asInteger;
    FieldByName('SALARIO').asFloat         := Parcela;
    FieldByName('IDMOTIVO').asInteger      := idMotivo;
    FieldByName('PERC_REAJ').asFloat :=
      (Parcela - tblPessoal.FieldByName('SALARIOATUAL').asFloat) * 100 /
       tblPessoal.FieldByName('SALARIOATUAL').asFloat;
    FieldByName('TIPOPAGAMENTO').asString := tblPessoal.FieldByName('TIPOPAGAMENTO').asString;
    Post;
  end;

  //Atualiza Cadastro
  if (tblHstces.FieldByName('DATAALTERFUNC').Value >= tblPessoal.FieldByName('DATASALARIO').Value) and
     (tblHstces.FieldByName('SALARIO').Value <> tblPessoal.FieldByName('SALARIOATUAL').Value) then
  begin
    tblFunci2.Edit;
    tblFunci2.FieldByName('DATASALARIO').Value :=
                tblHstces.FieldByName('DATAALTERFUNC').Value;
    tblFunci2.FieldByName('SALARIOATUAL').Value :=
                tblHstces.FieldByName('SALARIO').Value;
    tblFunci2.FieldByName('TIPOPAGAMENTO').Value :=
                tblHstces.FieldByName('TIPOPAGAMENTO').Value;
  end;

  if (tblHstces.FieldByName('DATAALTERFUNC').Value >= tblPessoal.FieldByName('DATACARGO').Value) and
     (tblHstces.FieldByName('IDCARGO').Value <> tblPessoal.FieldByName('IDCARGO').Value) then
  begin
    tblFunci2.Edit;
    tblFunci2.FieldByName('DATACARGO').Value := tblHstces.FieldByName('DATAALTERFUNC').Value;
    tblFunci2.FieldByName('IDCARGO').Value   := tblHstces.FieldByName('IDCARGO').Value;
  end;

  if (tblHstces.FieldByName('DATAALTERFUNC').Value >= tblPessoal.FieldByName('DATALOTACAO').Value) and
     (tblHstces.FieldByName('CODCENTROCUSTO').Value <> tblPessoal.FieldByName('CODCENTROCUSTO').Value) then
  begin
    tblFunci2.Edit;
    tblFunci2.FieldByName('DATALOTACAO').Value := tblHstces.FieldByName('DATAALTERFUNC').Value;
    tblFunci2.FieldByName('CODCENTROCUSTO').Value := tblHstces.FieldByName('CODCENTROCUSTO').Value;
  end;

  if (tblFunci2.State = dsEdit) then
    tblFunci2.Post;
end;

end.
