unit CMConversor;

interface

uses                
  Windows, SysUtils, Classes, Forms, Menus, Controls,
  ToolIntf, ExptIntf, DsgnIntf, TypInfo, CMExpert, Dialogs;

type
  TCMConversor = class(TCMExpert)
  private
    _ConversorMenuItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TCMDbObjExpert = class(TCMExpert)
  private
    _ConversorMenuItem: TIMenuItemIntf;
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;



procedure Register;


implementation

uses fConversorWiz, fObjExpert;


procedure Register;
begin
  RegisterLibraryExpert(TCMDbObjExpert.Create);
end;


{ TCMConversor }

constructor TCMConversor.Create;
begin
  inherited Create;
  _ConversorMenuItem := CreateCmMenuItem('Conversor de Projetos', 3);
end;

destructor TCMConversor.Destroy;
begin
  _ConversorMenuItem.Free;
  inherited Destroy;
end;

procedure TCMConversor.DoClick(Sender: TIMenuItemIntf);
begin
  TfrmConversorWiz.Execute;
end;

{ TCMDbObjExpert }

constructor TCMDbObjExpert.Create;
begin
  inherited Create;
  _ConversorMenuItem := CreateCmMenuItem('Bussines Object Builder', 3);
end;

destructor TCMDbObjExpert.Destroy;
begin
  inherited;
  _ConversorMenuItem.Free;
end;

procedure TCMDbObjExpert.DoClick(Sender: TIMenuItemIntf);
begin
  TFrmObjExpert.Execute;
end;

end.
