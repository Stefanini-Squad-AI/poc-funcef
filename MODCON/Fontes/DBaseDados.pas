unit DBaseDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwquery;

type
  TdtmBaseDados = class(TDataModule)
    dbBaseDados: TDatabase;
    qry: TwwQuery;
    procedure DataModule1Create(Sender: TObject);
  private
    { Private declarations }
    function AddServerName(db : TDataBase; sServerNameReg : string) : boolean;
  public
    { Public declarations }
  end;

var
  dtmBaseDados: TdtmBaseDados;

implementation

uses USistema;

{$R *.DFM}

procedure TdtmBaseDados.DataModule1Create(Sender: TObject);
begin
  try
     dbBaseDados.Connected := False;

     if not AddServerName(dbBaseDados,Sistema.LocalDados)
     then begin
       Application.MessageBox('Não foi possivel fazer conexão com o servidor '
                              ,'Erro',mb_Ok + mb_IconStop);
       Halt;
     end;

     dbBaseDados.Connected := True;
  except
     Application.MessageBox('Não foi possivel fazer conexão com o servidor '
                            ,'Erro',mb_Ok + mb_IconStop);
     Halt;
  end;

end;

function TdtmBaseDados.AddServerName(db : TDataBase;sServerNameReg : string) : boolean;
var i               : integer;
    achouServerName : boolean;
    sParams         : string;
begin
   Result := False;
   achouServerName := False;
   for i := 0 to db.Params.Count - 1 do
   begin
      if db.DriverName = 'ORACLE'
      then begin
         { Se encontrar linha SERVER NAME = XXXX, substituir pelo LocalDados do reg }
         sParams := UpperCase(Copy(db.Params[i],1,11));
         if ('SERVERNAME ' = sParams) or ('SERVER NAME' = sParams)
         then begin
            db.Params[i] := 'SERVER NAME='+sServerNameReg;
            achouServerName := True;
         end;
      end
     else if db.DriverName = 'STANDARD'
     then begin
        { Se encontrar linha PATH = XXXX, substituir pelo LocalDados do reg }
         sParams := UpperCase(Copy(db.Params[i],1,4));
         if ('PATH' = sParams)
         then begin
            db.Params[i] := 'PATH='+sServerNameReg;
            achouServerName := True;
         end;
     end;
   end;
   if not achouServerName
   then begin
      if db.DriverName = 'ORACLE' then db.Params.Add('SERVER NAME='+sServerNameReg)
      else if db.DriverName = 'STANDARD' then db.Params.Add('PATH='+sServerNameReg);
   end;

   Result := True;
end;

end.
