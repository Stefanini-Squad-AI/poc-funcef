unit FHstDivBenefAltProvisao;

{
***************************** REGISTRO DE ALTERAÇÕES **********************************
***************************************************************************************
---------------------------------------------------------------------------------------
Alterações  : criacao da funcionalidade
Pendência   : SIG 115304
Responsável : edilaine
Data MERGE  : 25/01/2023
Data        : 20/09/2021
Descrição   : Contabilização dos tipos de dividas e provisao de perdas
--------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, UMensErro, uFuncoesUteis, Mask;

type
  TFrmHstDivBenefAltProvisao = class(TfrmOkCancelar)
    Label3: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtsaldoinici: TEdit;
    edtSaldoAtu: TEdit;
    Label1: TLabel;
    edtSldProvisao: TEdit;
    Label2: TLabel;
    edtSldBaixa: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edProvPerda: TEdit;
    Label5: TLabel;
    edRevProvisao: TEdit;
    Label6: TLabel;
    edBaixaDef: TEdit;
    Label7: TLabel;
    edRevBaixa: TEdit;
    Label9: TLabel;
    lblSitParcela: TLabel;
    lblMesCobranca: TLabel;
    Bevel1: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    lblSaldoProv: TLabel;
    lblSaldoBaixa: TLabel;
    Label12: TLabel;
    lblSaldoDev: TLabel;
    medtanomescob: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure edProvPerdaKeyPress(Sender: TObject; var Key: Char);
    procedure edRevProvisaoKeyPress(Sender: TObject; var Key: Char);
    procedure edRevBaixaKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edBaixaDefKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edProvPerdaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRevProvisaoChange(Sender: TObject);
    procedure edBaixaDefKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRevBaixaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure  preencheValores;
    
  public
    { Public declarations }
    rSldProvisao,
    rSldBaixaDef,
    rSldDevedor,
    rVlrProvPerda,
    rVlrRevProvisao,
    rVlrBaixaDef,
    rVlrRevBaixa,
    rSaldoCalc  : double;
    lFlgStatus    : integer;
  end;

var
  FrmHstDivBenefAltProvisao: TFrmHstDivBenefAltProvisao;

implementation

{$R *.DFM}

{ TFrmHstDivBenefAltProvisao }

function StrToFloatDef(fValor : string; fDefault : double) : double;
begin
  if fValor = '' then
     result := fDefault
  else
     result := StrToFloat(fValor);
end;

procedure TFrmHstDivBenefAltProvisao.preencheValores;
begin
   edProvPerda.text   := FormatFloat('#,##0.00', rVlrProvPerda);
   edRevProvisao.text := FormatFloat('#,##0.00', rVlrRevProvisao);
   edBaixaDef.text    := FormatFloat('#,##0.00', rVlrBaixaDef);
   edRevBaixa.text    := FormatFloat('#,##0.00', rVlrRevBaixa);

   rSldProvisao := Str2Float(edtSldProvisao.text);
   rSldBaixaDef := Str2Float(edtSldBaixa.text);
   rSldDevedor  := Str2Float(edtSaldoAtu.text);

  // preenche labels
  if (rVlrProvPerda+rVlrRevProvisao+rVlrBaixaDef+rVlrRevBaixa) = 0 then
  begin
    lblSaldoProv.Caption  := FormatFloat('#,##0.00', rSldProvisao );
    lblSaldoBaixa.Caption := FormatFloat('#,##0.00', rSldBaixaDef );
    lblSaldoDev.Caption   := FormatFloat('#,##0.00', rSldDevedor );
  end
  else
  begin
    rSaldoCalc := rSldProvisao + Str2Float(edProvPerda.text) - Str2Float(edRevProvisao.text) ;
    lblSaldoProv.Caption := FormatFloat('#,##0.00', rSaldoCalc );

    rSaldoCalc := rSldBaixaDef + Str2Float(edBaixaDef.text) - Str2Float(edRevBaixa.text);
    lblSaldoBaixa.Caption := FormatFloat('#,##0.00', rSaldoCalc );

    rSaldoCalc  := rSldDevedor - Str2Float(edBaixaDef.text) + Str2Float(edRevBaixa.text);
    lblSaldoDev.Caption   := FormatFloat('#,##0.00', rSaldoCalc );
  end;
end;


procedure TFrmHstDivBenefAltProvisao.FormShow(Sender: TObject);
begin
  inherited;

  //edRevBaixa.enabled := (lFlgStatus = 3) and (rVlrBaixaDef > 0);

  medtanomescob.visible  := (lFlgStatus = 2);
  lblMesCobranca.visible := (lFlgStatus <> 2);

  if lFlgStatus = 2 then
  begin
     medtanomescob.left := lblMesCobranca.left;
     medtanomescob.top  := lblMesCobranca.top-3;
  end;

  preencheValores();

end;

procedure TFrmHstDivBenefAltProvisao.edProvPerdaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
end;

procedure TFrmHstDivBenefAltProvisao.edRevProvisaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
end;

procedure TFrmHstDivBenefAltProvisao.edBaixaDefKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
end;

procedure TFrmHstDivBenefAltProvisao.edRevBaixaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if NOT (key IN ['0'..'9',#13,#44,#46,#08]) then
     Abort;
end;

procedure TFrmHstDivBenefAltProvisao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  preencheValores();
end;


procedure TFrmHstDivBenefAltProvisao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (rSldProvisao > Str2Float(edtSaldoAtu.text) ) then
  begin
    MsgDlg('Saldo simulado de Provisão maior que Saldo Devedor Atual. Verifique!.', 'Aviso', mtWarning, [mbOK], 0);
    abort;
  end;

  rVlrProvPerda   := Str2Float(edProvPerda.text);
  rVlrRevProvisao := Str2Float(edRevProvisao.text);
  rVlrBaixaDef    := Str2Float(edBaixaDef.text);
  rVlrRevBaixa    := Str2Float(edRevBaixa.text);

  ModalResult := mrOk;
end;

procedure TFrmHstDivBenefAltProvisao.edProvPerdaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  rSaldoCalc := rSldProvisao + Str2Float(edProvPerda.text) - Str2Float(edRevProvisao.text) ;
  lblSaldoProv.Caption := FormatFloat('#,##0.00', rSaldoCalc );
end;

procedure TFrmHstDivBenefAltProvisao.edRevProvisaoChange(Sender: TObject);
begin
  inherited;

  rSaldoCalc := rSldProvisao + Str2Float(edProvPerda.text) - Str2Float(edRevProvisao.text) ;
  lblSaldoProv.Caption := FormatFloat('#,##0.00', rSaldoCalc );
end;

procedure TFrmHstDivBenefAltProvisao.edBaixaDefKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  rSaldoCalc := rSldBaixaDef + Str2Float(edBaixaDef.text) - Str2Float(edRevBaixa.text);
  lblSaldoBaixa.Caption := FormatFloat('#,##0.00', rSaldoCalc );

  rSaldoCalc  := rSldDevedor - Str2Float(edBaixaDef.text) + Str2Float(edRevBaixa.text);
  lblSaldoDev.Caption   := FormatFloat('#,##0.00', rSaldoCalc );
end;

procedure TFrmHstDivBenefAltProvisao.edRevBaixaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  rSaldoCalc := rSldBaixaDef + Str2Float(edBaixaDef.text) - Str2Float(edRevBaixa.text);
  lblSaldoBaixa.Caption := FormatFloat('#,##0.00', rSaldoCalc );

  rSaldoCalc  := rSldDevedor - Str2Float(edBaixaDef.text) + Str2Float(edRevBaixa.text);
  lblSaldoDev.Caption   := FormatFloat('#,##0.00', rSaldoCalc );
end;

end.
