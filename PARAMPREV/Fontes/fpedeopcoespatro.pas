// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------
unit FPedeOpcoesPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, Spin, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Db, DBTables, Wwquery, IvDictio, IvMulti, IvEMulti;

type
  TFrmPedeOpcoesPatro = class(TfrmOkCancelar)
    pnlTitulo: TPanel;
    lblPlano: TLabel;
    edPatro: TEdit;
    ScrollBox1: TScrollBox;
    qryRegra: TwwQuery;
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
    lblOp4: TLabel;
    lblOp5: TLabel;
    lblOp6: TLabel;
    dblkpcmbRegraValidaOp4: TwwDBLookupCombo;
    dblkpcmbRegraValidaOp5: TwwDBLookupCombo;
    dblkpcmbRegraValidaOp6: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblkpcmbRegraCalcOp4: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp5: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp6: TwwDBLookupCombo;
    ScrollBox2: TScrollBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edNomeValorBase1: TEdit;
    edNomeValorBase2: TEdit;
    edNomeValorBase3: TEdit;
    ckFlgObrigaOp1: TCheckBox;
    ckFlgObrigaOp2: TCheckBox;
    ckFlgObrigaOp3: TCheckBox;
    ckAlteraOp1: TCheckBox;
    ckAlteraOp2: TCheckBox;
    ckAlteraOp3: TCheckBox;
    Label10: TLabel;
    edNomeValorBase4: TEdit;
    ckFlgObrigaOp4: TCheckBox;
    ckAlteraOp4: TCheckBox;
    Label11: TLabel;
    edNomeValorBase5: TEdit;
    ckFlgObrigaOp5: TCheckBox;
    ckAlteraOp5: TCheckBox;
    Label12: TLabel;
    edNomeValorBase6: TEdit;
    ckFlgObrigaOp6: TCheckBox;
    ckAlteraOp6: TCheckBox;
    lblnumopcoes: TLabel;
    spedNumOpcoes: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure spedNumOpcoesChange(Sender: TObject);
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
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkpcmbRegraValidaOp1Exit(Sender: TObject);
    procedure dblkpcmbRegraValidaOp2Exit(Sender: TObject);
    procedure dblkpcmbRegraValidaOp3Exit(Sender: TObject);
    procedure dblkpcmbRegraCalcOp1Exit(Sender: TObject);
    procedure dblkpcmbRegraCalcOp2Exit(Sender: TObject);
    procedure dblkpcmbRegraCalcOp3Exit(Sender: TObject);
    procedure dblkpcmbRegraValidaOp4CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraValidaOp4Exit(Sender: TObject);
    procedure dblkpcmbRegraValidaOp5CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraValidaOp5Exit(Sender: TObject);
    procedure dblkpcmbRegraValidaOp6CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraValidaOp6Exit(Sender: TObject);
    procedure dblkpcmbRegraCalcOp4CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraCalcOp5CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraCalcOp5Exit(Sender: TObject);
    procedure dblkpcmbRegraCalcOp6CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkpcmbRegraCalcOp6Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    lcRegraOp1, lcRegraOp2, lcRegraOp3, lcRegraOp4, lcRegraOp5, lcRegraOp6 : integer;
    lcsRegraOp1, lcsRegraOp2, lcsRegraOp3, lcsRegraOp4, lcsRegraOp5, lcsRegraOp6 : string;
    iRegraCalcOp1,  iRegraCalcOp2, iRegraCalcOp3,
    iRegraCalcOp4,  iRegraCalcOp5, iRegraCalcOp6   : integer;
    stRegraCalcOp1, stRegraCalcOp2, stRegraCalcOp3,
    stRegraCalcOp4, stRegraCalcOp5, stRegraCalcOp6: string;
    iFlgObrigaOp1,  iFlgObrigaOp2, iFlgObrigaOp3,
    iFlgAlteraOp1,  iFlgAlteraOp2, iFlgAlteraOp3,
    iFlgObrigaOp4,  iFlgObrigaOp5, iFlgObrigaOp6,
    iFlgAlteraOp4,  iFlgAlteraOp5, iFlgAlteraOp6       : integer;
    sTipoPlano : string;    
  end;

var
  FrmPedeOpcoesPatro: TFrmPedeOpcoesPatro;

implementation

{$R *.DFM}

procedure TFrmPedeOpcoesPatro.FormShow(Sender: TObject);
begin
  inherited;
  qryRegra.Close; qryRegra.Open;

  dblkpcmbRegraValidaOp1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraValidaOp2.Enabled := (spedNumOpcoes.Value >= 2);
  dblkpcmbRegraValidaOp3.Enabled := (spedNumOpcoes.Value >= 3);
  dblkpcmbRegraValidaOp4.Enabled := (spedNumOpcoes.Value >= 4);
  dblkpcmbRegraValidaOp5.Enabled := (spedNumOpcoes.Value >= 5);
  dblkpcmbRegraValidaOp6.Enabled := (spedNumOpcoes.Value >= 6);


  dblkpcmbRegraCalcOp1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraCalcOp2.Enabled := (spedNumOpcoes.Value >= 2);
  dblkpcmbRegraCalcOp3.Enabled := (spedNumOpcoes.Value >= 3);
  dblkpcmbRegraCalcOp4.Enabled := (spedNumOpcoes.Value >= 4);
  dblkpcmbRegraCalcOp5.Enabled := (spedNumOpcoes.Value >= 5);
  dblkpcmbRegraCalcOp6.Enabled := (spedNumOpcoes.Value >= 6);

  edNomeValorBase1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  edNomeValorBase2.Enabled := (spedNumOpcoes.Value >= 2);
  edNomeValorBase3.Enabled := (spedNumOpcoes.Value >= 3);
  edNomeValorBase4.Enabled := (spedNumOpcoes.Value >= 4);
  edNomeValorBase5.Enabled := (spedNumOpcoes.Value >= 5);
  edNomeValorBase6.Enabled := (spedNumOpcoes.Value >= 6);

  ckFlgObrigaOp1.Enabled   :=((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  ckFlgObrigaOp2.Enabled   := (spedNumOpcoes.Value >= 2);
  ckFlgObrigaOp3.Enabled   := (spedNumOpcoes.Value >= 3);
  ckFlgObrigaOp4.Enabled   := (spedNumOpcoes.Value >= 4);
  ckFlgObrigaOp5.Enabled   := (spedNumOpcoes.Value >= 5);
  ckFlgObrigaOp6.Enabled   := (spedNumOpcoes.Value >= 6);

  ckAlteraOp1.Enabled      :=((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  ckAlteraOp2.Enabled      := (spedNumOpcoes.Value >= 2);
  ckAlteraOp3.Enabled      := (spedNumOpcoes.Value >= 3);
  ckAlteraOp4.Enabled      := (spedNumOpcoes.Value >= 4);
  ckAlteraOp5.Enabled      := (spedNumOpcoes.Value >= 5);
  ckAlteraOp6.Enabled      := (spedNumOpcoes.Value >= 6);

  ckFlgObrigaOp1.Checked   := (iFlgObrigaOp1 = 1);
  ckFlgObrigaOp2.Checked   := (iFlgObrigaOp2 = 1);
  ckFlgObrigaOp3.Checked   := (iFlgObrigaOp3 = 1);
  ckFlgObrigaOp4.Checked   := (iFlgObrigaOp4 = 1);
  ckFlgObrigaOp5.Checked   := (iFlgObrigaOp5 = 1);
  ckFlgObrigaOp6.Checked   := (iFlgObrigaOp6 = 1);

  ckAlteraOp1.Checked      := (iFlgAlteraOp1 = 1);
  ckAlteraOp2.Checked      := (iFlgAlteraOp2 = 1);
  ckAlteraOp3.Checked      := (iFlgAlteraOp3 = 1);
  ckAlteraOp4.Checked      := (iFlgAlteraOp4 = 1);
  ckAlteraOp5.Checked      := (iFlgAlteraOp5 = 1);
  ckAlteraOp6.Checked      := (iFlgAlteraOp6 = 1);


  if qryRegra.Locate('NOMEREGRA',lcsRegraOp1,[loCaseInsensitive, loPartialKey]) then
     begin
          lcRegraOp1 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraValidaOp1.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraValidaOp1.Text := '';

  if qryRegra.Locate('NOMEREGRA',lcsRegraOp2,[loCaseInsensitive, loPartialKey]) then
     begin
          lcRegraOp2 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraValidaOp2.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraValidaOp2.Text := '';

  if qryRegra.Locate('NOMEREGRA',lcsRegraOp3,[loCaseInsensitive, loPartialKey]) then
     begin
          lcRegraOp3 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraValidaOp3.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraValidaOp3.Text := '';


  if qryRegra.Locate('NOMEREGRA',lcsRegraOp4,[loCaseInsensitive, loPartialKey]) then
     begin
          lcRegraOp4 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraValidaOp4.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraValidaOp4.Text := '';

  if qryRegra.Locate('NOMEREGRA',lcsRegraOp5,[loCaseInsensitive, loPartialKey]) then
     begin
          lcRegraOp5 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraValidaOp5.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraValidaOp5.Text := '';

  if qryRegra.Locate('NOMEREGRA',lcsRegraOp6,[loCaseInsensitive, loPartialKey]) then
     begin
          lcRegraOp6 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraValidaOp6.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraValidaOp6.Text := '';





  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp1,[loCaseInsensitive, loPartialKey]) then
     begin
          iRegraCalcOp1 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraCalcOp1.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraCalcOp1.Text := '';

  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp2,[loCaseInsensitive, loPartialKey]) then
     begin
          iRegraCalcOp2 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraCalcOp2.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraCalcOp2.Text := '';

  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp3,[loCaseInsensitive, loPartialKey]) then
     begin
          iRegraCalcOp3 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraCalcOp3.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraCalcOp3.Text := '';

  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp4,[loCaseInsensitive, loPartialKey]) then
     begin
          iRegraCalcOp4 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraCalcOp4.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraCalcOp4.Text := '';

  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp5,[loCaseInsensitive, loPartialKey]) then
     begin
          iRegraCalcOp5 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraCalcOp5.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraCalcOp5.Text := '';

  if qryRegra.Locate('NOMEREGRA', stRegraCalcOp6,[loCaseInsensitive, loPartialKey]) then
     begin
          iRegraCalcOp6 := qryRegra.FieldByName('IDREGRA').AsInteger;
          dblkpcmbRegraCalcOp6.Text := qryRegra.FieldByname('NOMEREGRA').AsString;
     end
  else
     dblkpcmbRegraCalcOp6.Text := '';
end;

procedure TFrmPedeOpcoesPatro.spedNumOpcoesChange(Sender: TObject);
begin
  inherited;
  if Trim(spedNumOpcoes.Text) = '' then Exit;
  dblkpcmbRegraValidaOp1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraValidaOp2.Enabled :=  (spedNumOpcoes.Value >= 2);
  dblkpcmbRegraValidaOp3.Enabled :=  (spedNumOpcoes.Value >= 3);
  dblkpcmbRegraValidaOp4.Enabled :=  (spedNumOpcoes.Value >= 4);
  dblkpcmbRegraValidaOp5.Enabled :=  (spedNumOpcoes.Value >= 5);
  dblkpcmbRegraValidaOp6.Enabled :=  (spedNumOpcoes.Value >= 6);

  dblkpcmbRegraCalcOp1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  dblkpcmbRegraCalcOp2.Enabled :=  (spedNumOpcoes.Value >= 2);
  dblkpcmbRegraCalcOp3.Enabled :=  (spedNumOpcoes.Value >= 3);
  dblkpcmbRegraCalcOp4.Enabled :=  (spedNumOpcoes.Value >= 4);
  dblkpcmbRegraCalcOp5.Enabled :=  (spedNumOpcoes.Value >= 5);
  dblkpcmbRegraCalcOp6.Enabled :=  (spedNumOpcoes.Value >= 6);

  edNomeValorBase1.Enabled := ((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  edNomeValorBase2.Enabled :=  (spedNumOpcoes.Value >= 2);
  edNomeValorBase3.Enabled :=  (spedNumOpcoes.Value >= 3);
  edNomeValorBase4.Enabled :=  (spedNumOpcoes.Value >= 4);
  edNomeValorBase5.Enabled :=  (spedNumOpcoes.Value >= 5);
  edNomeValorBase6.Enabled :=  (spedNumOpcoes.Value >= 6);

  ckFlgObrigaOp1.Enabled   :=((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  ckFlgObrigaOp2.Enabled   := (spedNumOpcoes.Value >= 2);
  ckFlgObrigaOp3.Enabled   := (spedNumOpcoes.Value >= 3);
  ckFlgObrigaOp4.Enabled   := (spedNumOpcoes.Value >= 4);
  ckFlgObrigaOp5.Enabled   := (spedNumOpcoes.Value >= 5);
  ckFlgObrigaOp6.Enabled   := (spedNumOpcoes.Value >= 6);

  ckAlteraOp1.Enabled      :=((spedNumOpcoes.Value >= 1) and (sTipoPlano <> 'C'));
  ckAlteraOp2.Enabled      := (spedNumOpcoes.Value >= 2);
  ckAlteraOp3.Enabled      := (spedNumOpcoes.Value >= 3);
  ckAlteraOp4.Enabled      := (spedNumOpcoes.Value >= 4);
  ckAlteraOp5.Enabled      := (spedNumOpcoes.Value >= 5);
  ckAlteraOp6.Enabled      := (spedNumOpcoes.Value >= 6);

  if not edNomeValorBase1.Enabled then
     edNomeValorBase1.Text := '';

  if not edNomeValorBase2.Enabled then
     edNomeValorBase2.Text := '';

  if not edNomeValorBase3.Enabled then
     edNomeValorBase3.Text := '';

  if not edNomeValorBase4.Enabled then
     edNomeValorBase4.Text := '';

  if not edNomeValorBase5.Enabled then
     edNomeValorBase5.Text := '';

  if not edNomeValorBase6.Enabled then
     edNomeValorBase6.Text := '';
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp1CloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp1.text <> '' then
     lcRegraOp1 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp1 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp2CloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp2.text <> '' then
     lcRegraOp2 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp2 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp3CloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp3.Text <> '' then
     lcRegraOp3 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp3 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraCalcOp1CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp1.Text <> '' then
     iRegraCalcOp1 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp1 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraCalcOp2CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp2.Text <> '' then
     iRegraCalcOp2 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp2 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraCalcOp3CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp3.Text <> '' then
     iRegraCalcOp3 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp3 := -1;
end;

procedure TFrmPedeOpcoesPatro.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  lcRegraOp1 := -1;
  lcRegraOp2 := -1;
  lcRegraOp3 := -1;
  lcRegraOp4 := -1;
  lcRegraOp5 := -1;
  lcRegraOp6 := -1;

  iRegraCalcOp1 := -1;
  iRegraCalcOp2 := -1;
  iRegraCalcOp3 := -1;
  iRegraCalcOp4 := -1;
  iRegraCalcOp5 := -1;
  iRegraCalcOp6 := -1;
  Close;
end;

procedure TFrmPedeOpcoesPatro.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if spedNumOpcoes.Value = 0 then
     begin
          edNomeValorBase1.Text := '';
          edNomeValorBase2.Text := '';
          edNomeValorBase3.Text := '';
          edNomeValorBase4.Text := '';
          edNomeValorBase5.Text := '';
          edNomeValorBase6.Text := '';
     end
  else if spedNumOpcoes.Value = 1 then
     begin
          edNomeValorBase2.Text := '';
          edNomeValorBase3.Text := '';
          edNomeValorBase4.Text := '';
          edNomeValorBase5.Text := '';
          edNomeValorBase6.Text := '';
     end
  else if spedNumOpcoes.Value = 2 then
     begin
          edNomeValorBase3.Text := '';
          edNomeValorBase4.Text := '';
          edNomeValorBase5.Text := '';
          edNomeValorBase6.Text := '';
     end
  else if spedNumOpcoes.Value = 3 then
     begin
          edNomeValorBase4.Text := '';
          edNomeValorBase5.Text := '';
          edNomeValorBase6.Text := '';
     end
  else if spedNumOpcoes.Value = 4 then
     begin
          edNomeValorBase5.Text := '';
          edNomeValorBase6.Text := '';
     end
  else  if spedNumOpcoes.Value = 5 then
     edNomeValorBase6.Text := '';

  iFlgObrigaOp1 := 0;
  iFlgObrigaOp2 := 0;
  iFlgObrigaOp3 := 0;
  iFlgObrigaOp4 := 0;
  iFlgObrigaOp5 := 0;
  iFlgObrigaOp6 := 0;

  iFlgAlteraOp1 := 0;
  iFlgAlteraOp2 := 0;
  iFlgAlteraOp3 := 0;
  iFlgAlteraOp4 := 0;
  iFlgAlteraOp5 := 0;
  iFlgAlteraOp6 := 0;

  if ckFlgObrigaOp1.Checked then
     iFlgObrigaOp1 := 1;

  if ckFlgObrigaOp2.Checked then
     iFlgObrigaOp2 := 1;

  if ckFlgObrigaOp3.Checked then
     iFlgObrigaOp3 := 1;

  if ckFlgObrigaOp4.Checked then
     iFlgObrigaOp4 := 1;

  if ckFlgObrigaOp5.Checked then
     iFlgObrigaOp5 := 1;

  if ckFlgObrigaOp6.Checked then
     iFlgObrigaOp6 := 1;

  if ckAlteraOp1.Checked then
     iFlgAlteraOp1 := 1;

  if ckAlteraOp2.Checked then
     iFlgAlteraOp2 := 1;

  if ckAlteraOp3.Checked then
     iFlgAlteraOp3 := 1;

  if ckAlteraOp4.Checked then
     iFlgAlteraOp4 := 1;

  if ckAlteraOp5.Checked then
     iFlgAlteraOp5 := 1;

  if ckAlteraOp6.Checked then
     iFlgAlteraOp6 := 1;

  Close;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp1Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraValidaOp1.text <> '' then
     lcRegraOp1 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp1 := -1;

end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp2Exit(Sender: TObject);
begin
  inherited;

  if dblkpcmbRegraValidaOp2.text <> '' then
     lcRegraOp2 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp2 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp3Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraValidaOp3.Text <> '' then
     lcRegraOp3 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp3 := -1;

end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraCalcOp1Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraCalcOp1.Text <> '' then
     iRegraCalcOp1 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp1 := -1;

end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraCalcOp2Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraCalcOp2.Text <> '' then
     iRegraCalcOp2 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp2 := -1;

end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraCalcOp3Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraCalcOp3.Text <> '' then
     iRegraCalcOp3 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp3 := -1;

end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp4CloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp4.text <> '' then
     lcRegraOp4 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp4 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp4Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraValidaOp4.text <> '' then
     lcRegraOp4 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp4 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp5CloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp5.text <> '' then
     lcRegraOp5 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp5 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp5Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraValidaOp5.text <> '' then
     lcRegraOp5 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp5 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp6CloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraValidaOp6.Text <> '' then
     lcRegraOp6 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp6 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraValidaOp6Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraValidaOp6.Text <> '' then
     lcRegraOp6 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     lcRegraOp6 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraCalcOp4CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp4.Text <> '' then
     iRegraCalcOp4 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp4 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraCalcOp5CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp5.Text <> '' then
     iRegraCalcOp5 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp5 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraCalcOp5Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraCalcOp5.Text <> '' then
     iRegraCalcOp5 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp5 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraCalcOp6CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkpcmbRegraCalcOp6.Text <> '' then
     iRegraCalcOp6 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp6 := -1;
end;

procedure TFrmPedeOpcoesPatro.dblkpcmbRegraCalcOp6Exit(Sender: TObject);
begin
  inherited;
  if dblkpcmbRegraCalcOp6.Text <> '' then
     iRegraCalcOp6 := qryRegra.FieldByName('IDREGRA').AsInteger
  else
     iRegraCalcOp6 := -1;
end;

end.
