unit FJustif;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls;

type
  TFrmJustif = class(TfrmSairAjuda)
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
  FrmJustif: TFrmJustif;

implementation

uses FSumarioCot, uMensErro;

{$R *.DFM}

procedure TFrmJustif.bbtnSairClick(Sender: TObject);
begin
  If(Tipo = 'C') Or ((Tipo = 'J') And (Trim(mem.Text) <> '')) Then
     Begin
       FrmSumarioCot.sMem   := Mem.text;
       FrmSumarioCot.iFrete := rgFrete.ItemIndex;
       inherited
     End
  Else
    Begin
       MsgDlg('Obrigatório justificar escolha do fornecedor não indicado pelo o sistema.','Erro',mtError,[mbOk],0);
       mem.SetFocus;
    End;
end;

procedure TFrmJustif.FormShow(Sender: TObject);
begin
  inherited;
  Case Tipo Of
    'J' : Begin
            FrmJustif.Caption := 'Justificativa';
            RgFrete.Visible   := False;
          End;
    'C' : Begin
            FrmJustif.Caption := 'Obs.da O.C. - Fornecedor: '+sCompl;
            RgFrete.Visible   := True;
            RgFrete.ItemIndex := 0;
          End;
  End;
end;

end.
