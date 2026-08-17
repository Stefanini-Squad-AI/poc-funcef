unit FCliente;

interface

uses Registry, SysUtils, Classes, WinTypes, Forms, Dialogs,Qrctrls,Windows;


procedure GetRegNomeCliente( var Nome : TQRLABEL ; Sistema : string);
procedure GetRegLogo(var Logo :TQRImage);


var

Registr : TRegistry;
mCliente : string ;


implementation



procedure GetRegNomeCliente(var Nome : TQRLABEL ;  Sistema : string);
begin

   Registr := TRegistry.Create;
   Registr.RootKey := HKEY_LOCAL_MACHINE ;
   if not Registr.OpenKey('Software\CM\'+Sistema+'\Cliente', False)
   then begin
     ShowMessage('Chave '+ 'Software\CM\'+Sistema+'\Cliente' +' não encontrada');
     Exit;
   end;
   mCliente := Registr.ReadString('Nome');
   Nome.caption := mCliente;
   Registr.CloseKey;
end;


procedure GetRegLogo(var Logo :TQRImage);
begin
     Logo.Picture.Bitmap.LoadFromResourceName(HInstance, 'LOGO');
end;

end.
