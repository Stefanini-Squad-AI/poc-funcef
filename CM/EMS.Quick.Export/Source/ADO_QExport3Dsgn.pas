unit ADO_QExport3Dsgn;

{$I VerCtrl.inc}

interface

uses QExport3Dsgn;

type

 TQDatabaseNameProperty = class(TQFileNameProperty)
   protected
     function GetFilter: string; override;
     function GetDefaultExt: string; override;
 end;

implementation

function TQDatabaseNameProperty.GetFilter: string;
begin
  Result := 'MS Access files (*.mdb)|*.mdb';
end;

function TQDatabaseNameProperty.GetDefaultExt: string;
begin
  Result := 'mdb';
end;

end.
