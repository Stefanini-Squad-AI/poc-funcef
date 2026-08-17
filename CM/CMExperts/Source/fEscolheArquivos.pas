unit fEscolheArquivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, TB97Tlbr, TB97, FileCtrl;

type
  TfrmEscolheArquivos = class(Tform)
    Dock971: TDock97;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    pnlFundo: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    lblArquivos: TLabel;
    lstBoxDir: TDirectoryListBox;
    edArquivos: TEdit;
    DriveComboBox1: TDriveComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolheArquivos: TfrmEscolheArquivos;

implementation

{$R *.DFM}

end.
