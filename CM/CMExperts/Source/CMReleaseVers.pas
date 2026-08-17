unit CMReleaseVers;

interface

uses
  Windows, SysUtils, Classes, Forms, Menus, Controls,
  ToolIntf, ExptIntf, DsgnIntf, TypInfo, CMExpert, Dialogs;

type
  TCMReleaseVers = class(TCMExpert)
  private
    _ReleaseVersMenuItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

procedure Register;

implementation

uses
  fAchaTroca;

procedure Register;
begin
  RegisterLibraryExpert(TCMReleaseVers.Create);
end;

{ TCMReleaseVers }

constructor TCMReleaseVers.Create;
begin
  inherited Create;
  _ReleaseVersMenuItem := CreateCmMenuItem('&Acha e Troca', 4);
end;

destructor TCMReleaseVers.Destroy;
begin
  _ReleaseVersMenuItem.Free;
  inherited Destroy;
end;

procedure TCMReleaseVers.DoClick(Sender: TIMenuItemIntf);
begin
  If (Application.MessageBox('É aconselhável fechar todas as units e forms que estejam abertos. Deseja executar o acha e troca?','Atenção',Mb_IconQuestion + Mb_YesNo) = Id_Yes) Then
     With TfrmAchaTroca.Create(Application) Do
       Try
         ShowModal;
       finally
         Free;
       End;
end;

end.
