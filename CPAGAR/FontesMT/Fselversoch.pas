{******************************************************************************}
{  Sistema - Contas a Pagar                                                    }
{  Unit    - Fselversoch                                                       }
{------------------------------------------------------------------------------}
{  Alterações:                                                                 }
{ -----------------------------------------------------------------------------}
// Rotina    : várias
// Data      : 19/04/2004
// Autor     : David Ayrolla
// Pendência : 15618
// Descrição : Impedir seleção concomitante do campo "Destina-se" e outros para
//             impressão no verso do cheque.
//------------------------------------------------------------------------------
unit Fselversoch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TFrmselversoch = class(TfrmOkCancelar)
    grpOutros: TGroupBox;
    chkdocto: TCheckBox;
    chkdtprog: TCheckBox;
    chkvalor: TCheckBox;
    chkforn: TCheckBox;
    chkhist: TCheckBox;
    chklocal: TCheckBox;
    rbdestinase: TRadioButton;
    rbOutros: TRadioButton;
    procedure rbdestinaseClick(Sender: TObject);
    procedure rbOutrosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Atualiza;
  public
    { Public declarations }
  end;

var
  Frmselversoch: TFrmselversoch;

implementation

{$R *.DFM}

procedure TFrmselversoch.rbdestinaseClick(Sender: TObject);
begin
  inherited;
  Atualiza;
end;

procedure TFrmselversoch.rbOutrosClick(Sender: TObject);
begin
  inherited;
  Atualiza;
end;

procedure TFrmselversoch.FormShow(Sender: TObject);
begin
  inherited;
  Atualiza;
end;

procedure TFrmselversoch.Atualiza;
begin
  grpOutros.Enabled := rbOutros.Checked;
  if rbdestinase.Checked then
  begin
    chkdocto.Checked  := False;
    chkdtprog.Checked := False;
    chkvalor.Checked  := False;
    chkforn.Checked   := False;
    chkhist.Checked   := False;
    chklocal.Checked  := False;
  end;
end;

end.
