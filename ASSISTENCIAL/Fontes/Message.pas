unit Message;

interface

uses Registry, SysUtils, Classes, WinTypes, Forms, Dialogs,Qrctrls,Windows;

Procedure ShowMessageCm(text : string ; escolha : boolean );

implementation

Procedure ShowMessageCm(text : string ; escolha : boolean );
begin
if escolha then
begin
   showmessage(''+text+'');
end;
end;

end.
