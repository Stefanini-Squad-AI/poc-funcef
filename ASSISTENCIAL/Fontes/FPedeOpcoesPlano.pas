unit FPedeOpcoesPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Spin, StdCtrls, wwdblook, MAHlpBtn, Buttons, TB97, ExtCtrls,
  Db, DBTables, Wwquery, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TFrmPedeOpcoesPlano = class(TfrmOkCancelar)
    qryRegra: TwwQuery;
    pnlRegras: TPanel;
    grpRegraValida: TGroupBox;
    lblOp1: TLabel;
    lblOp2: TLabel;
    lblOp3: TLabel;
    dblkpcmbRegraValidaOp1: TwwDBLookupCombo;
    dblkpcmbRegraValidaOp2: TwwDBLookupCombo;
    dblkpcmbRegraValidaOp3: TwwDBLookupCombo;
    grpRegraCalculo: TGroupBox;
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
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dblkpcmbRegraValidaOp4: TwwDBLookupCombo;
    dblkpcmbRegraValidaOp5: TwwDBLookupCombo;
    dblkpcmbRegraValidaOp6: TwwDBLookupCombo;
    Label10: TLabel;
    Label11: TLabel;
    dblkpcmbRegraValidaOp7: TwwDBLookupCombo;
    dblkpcmbRegraValidaOp8: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp1: TwwDBLookupCombo;
    Label12: TLabel;
    dblkpcmbRegraCalcOp2: TwwDBLookupCombo;
    Label13: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dblkpcmbRegraCalcOp3: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp4: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp5: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp6: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp7: TwwDBLookupCombo;
    dblkpcmbRegraCalcOp8: TwwDBLookupCombo;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edNomeValorBase4: TEdit;
    edNomeValorBase5: TEdit;
    edNomeValorBase6: TEdit;
    ckFlgObrigaOp6: TCheckBox;
    ckAlteraOp6: TCheckBox;
    ckFlgObrigaOp5: TCheckBox;
    ckAlteraOp5: TCheckBox;
    ckAlteraOp4: TCheckBox;
    ckFlgObrigaOp4: TCheckBox;
    Label20: TLabel;
    Label21: TLabel;
    edNomeValorBase7: TEdit;
    edNomeValorBase8: TEdit;
    ckFlgObrigaOp8: TCheckBox;
    ckAlteraOp8: TCheckBox;
    ckFlgObrigaOp7: TCheckBox;
    ckAlteraOp7: TCheckBox;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedeOpcoesPlano: TFrmPedeOpcoesPlano;

implementation

{$R *.DFM}

procedure TFrmPedeOpcoesPlano.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmPedeOpcoesPlano.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmPedeOpcoesPlano.FormCreate(Sender: TObject);
begin
  inherited;
  qryRegra.Close;
  qryRegra.Open;
end;

end.
