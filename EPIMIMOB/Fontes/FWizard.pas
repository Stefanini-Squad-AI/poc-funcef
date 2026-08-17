unit FWizard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, ExtCtrls, fcLabel, ComCtrls, StdCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97;

type
  TfrmWizard = class(TfrmSairAjudaImob)
    Panel2: TPanel;
    lblProgress: TLabel;
    lblContador: TLabel;
    ProgressBar: TProgressBar;
    lblTitulo: TfcLabel;
    procedure ntbPrincipalPageChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWizard: TfrmWizard;

implementation

{$R *.DFM}

procedure TfrmWizard.ntbPrincipalPageChanged(Sender: TObject);
begin
   inherited;

   Repaint;
   Application.ProcessMessages;
end;



end.
