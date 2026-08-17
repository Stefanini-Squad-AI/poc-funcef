unit FDivergPedeNovoMesCob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin;

type
  TfrmDivergPedeNovoMesCob = class(TfrmOkCancelar)
    grpMesAnoRef: TGroupBox;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  
  private { Private declarations }


  public  { Public declarations }


  end;



var
  frmDivergPedeNovoMesCob: TfrmDivergPedeNovoMesCob;



implementation
{$R *.DFM}



procedure TfrmDivergPedeNovoMesCob.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//   inherited; // nao deixar dar o caFree
end;



end.