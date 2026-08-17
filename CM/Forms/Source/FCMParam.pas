unit FCMParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, ComCtrls, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ToolWin, ExtCtrls, TB97, TB97Ctls, TB97Tlbr, IvDictio,
  IvMulti, IvEMulti, wwDialog, CmDock, ActnList, ImgList, CmEventosCadastro;

type
  TfrmCMParam = class(TfrmCadastro)
    pgctrlParametros: TPageControl;
    tbshtParametros1: TTabSheet;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCMParam: TfrmCMParam;

implementation

{$R *.DFM}

procedure TfrmCMParam.FormShow(Sender: TObject);
begin
  inherited;
  sbtnInserir.Visible  := false;
  sbtnProcurar.Visible := false;
  sbtnApagar.Visible   := false;
  dbnav.Visible        := false;

end;


end.
