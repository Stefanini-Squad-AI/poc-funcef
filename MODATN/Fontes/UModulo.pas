unit uModulo;

interface

uses SysUtils, Dialogs, uCmControlObject, uCmClientDataSet, uCMTypes;

type
  TModulo = class(TCmControlObject)
  private
    FIdContraCheque: integer;
  public
    property IdContraCheque: integer read FIdContraCheque write FIdContraCheque;
  end;

var
  Modulo: TModulo;

implementation

end.
