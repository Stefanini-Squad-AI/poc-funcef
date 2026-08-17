unit FMTJustif;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TFrmMTJustif = class(TfrmSairAjuda)
    mem: TMemo;
    RgFrete: TRadioGroup;
    procedure bbtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tipo   : Char;
    sCompl : String;
  end;

var
  FrmMTJustif: TFrmMTJustif;

implementation

uses FMTSumarioCot,uMensErro;

{$R *.DFM}

procedure TFrmMTJustif.bbtnSairClick(Sender: TObject);
begin
  If(Tipo = 'C') Or ((Tipo = 'J') And (Trim(mem.Text) <> '')) Then
     Begin
       FrmMTSumarioCot.sMem   := Mem.text;
       FrmMTSumarioCot.iFrete := rgFrete.ItemIndex;
       inherited
     End
  Else
    Begin
       MsgDlg('Obrigatório justificar escolha do fornecedor não indicado pelo o sistema.','Erro',mtError,[mbOk],0);
       mem.SetFocus;
    End;

end;

procedure TFrmMTJustif.FormShow(Sender: TObject);
begin
  inherited;
  Case Tipo Of
    'J' : Begin
            FrmMTJustif.Caption := 'Justificativa';
            RgFrete.Visible     := False;
          End;
    'C' : Begin
            FrmMTJustif.Caption := 'Obs.da O.C. - Fornecedor: '+sCompl;
            RgFrete.Visible     := True;
            RgFrete.ItemIndex   := 0;
          End;
  End;
end;

end.
