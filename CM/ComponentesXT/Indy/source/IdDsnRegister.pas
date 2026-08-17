unit IdDsnRegister;

interface

uses
  {$IFDEF VER140}DesignIntf, DesignEditors;{$ELSE}Dsgnintf;{$ENDIF}

// Procs
  procedure Register;

implementation

uses
  IdDsnBaseCmpEdt,
  IdBaseComponent,
  IdDsnPropEdBinding, IdGlobal,
  IdComponent,
  IdMessage,
  {Since we are removing New Design-Time part, we remove the "New Message Part Editor"}
  {IdDsnNewMessagePart, }
  IdResourceStrings,
  IdSocketHandle, IdTCPServer,
  SysUtils;

const
  MessagePartsType : array[0..1] of String = ('TIdAttachment', 'TIdText');

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TIdSocketHandles), TIdTCPServer, '', TIdPropEdBinding);
  RegisterComponentEditor(TIdBaseComponent, TIdBaseComponentEditor);
  //  RegisterComponentEditor ( TIdMessage, TIdMessageComponentEdit);  }
end;

end.