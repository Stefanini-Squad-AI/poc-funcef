// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Fanuel Junior
// Pendência   : SOL148463 Kintana
// Data        : 10/02/2012
// Descricao   : Busca Automática %PBE, %FUNCEF e Benefício Mínimo.
// *****************************************************************************
unit FPedeOpcoesBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Spin, StdCtrls, wwdblook, MAHlpBtn, Buttons, TB97, ExtCtrls,
  Db, DBTables, Wwquery, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmPedeOpcoesBenef = class(TfrmOkCancelar)
    pnlTitulo: TPanel;
    lblBeneficio: TLabel;
    lblPlano: TLabel;
    qryRegra: TwwQuery;
    edPlano: TEdit;
    edBeneficio: TEdit;
    Panel1: TPanel;
    lblnumopcoes: TLabel;
    spedNumOpcoesBenef: TSpinEdit;
    pnlRegras: TPanel;
    grpRegraValida: TGroupBox;
    lblOp1: TLabel;
    lblOp2: TLabel;
    lblOp3: TLabel;
    dblkpcmbRegraValidaOp1: TwwDBLookupCombo;
    dblkpcmbRegraValidaOp2: TwwDBLookupCombo;
    dblkpcmbRegraValidaOp3: TwwDBLookupCombo;
    grpRegraCalculo: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dblkpcmbRegraCalcOp1: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp2: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp3: TwwDBLookupCombo;
    pnlDescricoes: TPanel;
    Label1: TLabel;
    edNomeValorBase1: TEdit;
    Label2: TLabel;
    edNomeValorBase2: TEdit;
    Label3: TLabel;
    edNomeValorBase3: TEdit;
    ckFlgObrigaOp3: TCheckBox;
    ckAlteraOp3: TCheckBox;
    ckFlgObrigaOp2: TCheckBox;
    ckAlteraOp2: TCheckBox;
    ckAlteraOp1: TCheckBox;
    ckFlgObrigaOp1: TCheckBox;
    ckBuscarValor1: TCheckBox;
    ckBuscarValor2: TCheckBox;
    ckBuscarValor3: TCheckBox;
    procedure spedNumOpcoesBenefChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkpcmbRegraValidaOp1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraValidaOp2CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraValidaOp3CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraCalcOp1CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraCalcOp2CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraCalcOp3CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

    iFlgObrigaOp1,  iFlgObrigaOp2, iFlgObrigaOp3,
    iFlgAlteraOp1,  iFlgAlteraOp2, iFlgAlteraOp3 : integer;
    iFlgValorTitular1, iFlgValorTitular2, iFlgValorTitular3 : integer; // Marcos Merola Sol 148463
    lcRegraOp1, lcRegraOp2, lcRegraOp3 : integer;
    lcsRegraOp1, lcsRegraOp2, lcsRegraOp3 : string;
    iRegraCalcOp1,  iRegraCalcOp2, iRegraCalcOp3  : integer;
    stRegraCalcOp1, stRegraCalcOp2, stRegraCalcOp3: string;
    sTipoPlano : string;

  end;

var
  frmPedeOpcoesBenef: TfrmPedeOpcoesBenef;

implementation

{$R *.DFM}

procedure TfrmPedeOpcoesBenef.spedNumOpcoesBenefChange(Sender: TObject);
begin
  inherited;
  if Trim(spedNumOpcoesBenef.Text) = '' then Exit;
  dblkpcmbRegraValidaOp1.Enabled := ((spedNumOpcoesBenef.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraValidaOp2.Enabled :=  (spedNumOpcoesBenef.Value >= 2);
  dblkpcmbRegraValidaOp3.Enabled :=  (spedNumOpcoesBenef.Value >= 3);

  dblkpcmbRegraCalcOp1.Enabled := ((spedNumOpcoesBenef.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraCalcOp2.Enabled :=  (spedNumOpcoesBenef.Value >= 2);
  dblkpcmbRegraCalcOp3.Enabled :=  (spedNumOpcoesBenef.Value >= 3);

  edNomeValorBase1.Enabled := ((spedNumOpcoesBenef.Value >= 1) and (sTipoPlano <> 'C'));
  edNomeValorBase2.Enabled :=  (spedNumOpcoesBenef.Value >= 2);
  edNomeValorBase3.Enabled :=  (spedNumOpcoesBenef.Value >= 3);

  ckFlgObrigaOp1.Enabled   :=((spedNumOpcoesBenef.Value >= 1) and (sTipoPlano <> 'C'));
  ckFlgObrigaOp2.Enabled   := (spedNumOpcoesBenef.Value >= 2);
  ckFlgObrigaOp3.Enabled   := (spedNumOpcoesBenef.Value >= 3);

  ckAlteraOp1.Enabled      :=((spedNumOpcoesBenef.Value >= 1) and (sTipoPlano <> 'C'));
  ckAlteraOp2.Enabled      := (spedNumOpcoesBenef.Value >= 2);
  ckAlteraOp3.Enabled      := (spedNumOpcoesBenef.Value >= 3);

  if not edNomeValorBase1.Enabled then
     edNomeValorBase1.Text := '';

  if not edNomeValorBase2.Enabled then
     edNomeValorBase2.Text := '';

  if not edNomeValorBase3.Enabled then
     edNomeValorBase3.Text := '';
end;

procedure TfrmPedeOpcoesBenef.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  lcRegraOp1 := -1;
  lcRegraOp2 := -1;
  lcRegraOp3 := -1;

  iRegraCalcOp1 := -1;
  iRegraCalcOp2 := -1;
  iRegraCalcOp3 := -1;

  Close;
end;

procedure TfrmPedeOpcoesBenef.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if spedNumOpcoesBenef.Value = 0 then
     begin
          edNomeValorBase1.Text := '';
          edNomeValorBase2.Text := '';
          edNomeValorBase3.Text := '';
     end
  else
  if spedNumOpcoesBenef.Value = 1 then
     begin
          edNomeValorBase2.Text := '';
          edNomeValorBase3.Text := '';
     end
  else
  if spedNumOpcoesBenef.Value = 2 then
     edNomeValorBase3.Text := '';

  iFlgObrigaOp1 := 0;
  iFlgObrigaOp2 := 0;
  iFlgObrigaOp3 := 0;

  iFlgAlteraOp1 := 0;
  iFlgAlteraOp2 := 0;
  iFlgAlteraOp3 := 0;

  iFlgValorTitular1  := 0; // Marcos Merola Sol 148463
  iFlgValorTitular2  := 0; // Marcos Merola Sol 148463
  iFlgValorTitular3  := 0; // Marcos Merola Sol 148463

  // merola

  if ckFlgObrigaOp1.Checked then
     iFlgObrigaOp1 := 1;

  if ckFlgObrigaOp2.Checked then
     iFlgObrigaOp2 := 1;

  if ckFlgObrigaOp3.Checked then
     iFlgObrigaOp3 := 1;

  if ckAlteraOp1.Checked then
     iFlgAlteraOp1 := 1;

  if ckAlteraOp2.Checked then
     iFlgAlteraOp2 := 1;

  if ckAlteraOp3.Checked then
     iFlgAlteraOp3 := 1;

  if ckBuscarValor1.Checked then  // Marcos Merola Sol 148463
     iFlgValorTitular1 := 1;      // Marcos Merola Sol 148463

  if ckBuscarValor2.Checked then  // Marcos Merola Sol 148463
     iFlgValorTitular2 := 1;      // Marcos Merola Sol 148463

  if ckBuscarValor3.Checked then  // Marcos Merola Sol 148463
     iFlgValorTitular3 := 1;      // Marcos Merola Sol 148463


  Close;
end;

procedure TfrmPedeOpcoesBenef.FormShow(Sender: TObject);
begin
  inherited;
  edNomeValorBase1.Enabled := ((spedNumOpcoesBenef.Value >= 1) and (sTipoPlano <> 'C'));
  edNomeValorBase2.Enabled := (spedNumOpcoesBenef.Value >= 2);
  edNomeValorBase3.Enabled := (spedNumOpcoesBenef.Value >= 3);

  ckFlgObrigaOp1.Enabled   :=((spedNumOpcoesBenef.Value >= 1) and (sTipoPlano <> 'C'));
  ckFlgObrigaOp2.Enabled   := (spedNumOpcoesBenef.Value >= 2);
  ckFlgObrigaOp3.Enabled   := (spedNumOpcoesBenef.Value >= 3);

  ckAlteraOp1.Enabled      :=((spedNumOpcoesBenef.Value >= 1) and (sTipoPlano <> 'C'));
  ckAlteraOp2.Enabled      := (spedNumOpcoesBenef.Value >= 2);
  ckAlteraOp3.Enabled      := (spedNumOpcoesBenef.Value >= 3);

  ckFlgObrigaOp1.Checked   := (iFlgObrigaOp1 = 1);
  ckFlgObrigaOp2.Checked   := (iFlgObrigaOp2 = 1);
  ckFlgObrigaOp3.Checked   := (iFlgObrigaOp3 = 1);

  ckAlteraOp1.Checked      := (iFlgAlteraOp1 = 1);
  ckAlteraOp2.Checked      := (iFlgAlteraOp2 = 1);
  ckAlteraOp3.Checked      := (iFlgAlteraOp3 = 1);

  ckBuscarValor1.Checked   := (iFlgValorTitular1 = 1); // Marcos Merola Sol 148463
  ckBuscarValor2.Checked   := (iFlgValorTitular2 = 1); // Marcos Merola Sol 148463
  ckBuscarValor3.Checked   := (iFlgValorTitular3 = 1); // Marcos Merola Sol 148463

  // ************
  qryRegra.Close; qryRegra.Open;

  dblkpcmbRegraValidaOp1.Enabled := ((spedNumOpcoesBenef.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraValidaOp2.Enabled := (spedNumOpcoesBenef.Value >= 2);
  dblkpcmbRegraValidaOp3.Enabled := (spedNumOpcoesBenef.Value >= 3);

  dblkpcmbRegraCalcOp1.Enabled := ((spedNumOpcoesBenef.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraCalcOp2.Enabled := (spedNumOpcoesBenef.Value >= 2);
  dblkpcmbRegraCalcOp3.Enabled := (spedNumOpcoesBenef.Value >= 3);

  if qryRegra.Locate('NOMEREGRA',lcsRegraOp1,[loCaseInsensitive, loPartialKey])
  then begin
     lcRegraOp1 := qryRegra.FieldByName('IDREGRA').AsInteger;
      dblkpcmbRegraValidaOp1.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
  end
  else dblkpcmbRegraValidaOp1.Text := '';

  if qryRegra.Locate('NOMEREGRA',lcsRegraOp2,[loCaseInsensitive, loPartialKey])
  then begin
     lcRegraOp2 := qryRegra.FieldByName('IDREGRA').AsInteger;
     dblkpcmbRegraValidaOp2.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
  end
  else dblkpcmbRegraValidaOp2.Text := '';

  if qryRegra.Locate('NOMEREGRA',lcsRegraOp3,[loCaseInsensitive, loPartialKey])
  then begin
     lcRegraOp3 := qryRegra.FieldByName('IDREGRA').AsInteger;
     dblkpcmbRegraValidaOp3.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
  end
  else dblkpcmbRegraValidaOp3.Text := '';

  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp1,[loCaseInsensitive, loPartialKey])
  then begin
     iRegraCalcOp1 := qryRegra.FieldByName('IDREGRA').AsInteger;
     dblkpcmbRegraCalcOp1.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
  end
  else dblkpcmbRegraCalcOp1.Text := '';

  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp2,[loCaseInsensitive, loPartialKey])
  then begin
     iRegraCalcOp2 := qryRegra.FieldByName('IDREGRA').AsInteger;
     dblkpcmbRegraCalcOp2.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
  end
  else dblkpcmbRegraCalcOp2.Text := '';

  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp3,[loCaseInsensitive, loPartialKey])
  then begin
     iRegraCalcOp3 := qryRegra.FieldByName('IDREGRA').AsInteger;
     dblkpcmbRegraCalcOp3.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
  end
  else dblkpcmbRegraCalcOp3.Text := '';
end;

procedure TfrmPedeOpcoesBenef.dblkpcmbRegraValidaOp1CloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp1.text <> '' then
     lcRegraOp1 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp1 := -1;

end;

procedure TfrmPedeOpcoesBenef.dblkpcmbRegraValidaOp2CloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp2.text <> '' then
     lcRegraOp2 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp2 := -1;

end;

procedure TfrmPedeOpcoesBenef.dblkpcmbRegraValidaOp3CloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp3.Text <> '' then
     lcRegraOp3 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp3 := -1;

end;

procedure TfrmPedeOpcoesBenef.dblkpcmbRegraCalcOp1CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp1.Text <> '' then
     iRegraCalcOp1 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp1 := -1;

end;

procedure TfrmPedeOpcoesBenef.dblkpcmbRegraCalcOp2CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp2.Text <> '' then
     iRegraCalcOp2 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp2 := -1;

end;

procedure TfrmPedeOpcoesBenef.dblkpcmbRegraCalcOp3CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp3.Text <> '' then
     iRegraCalcOp3 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp3 := -1;

end;

end.
