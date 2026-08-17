unit uCtrlBiblioteca;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient;

type
   TCtrlBiblioteca = Class(TCmControlObject)

   private

   public
      constructor Create; override;
      destructor Destroy; override;

      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended; overload;
      function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime; overload;

   protected

   end;

var CtrlBiblioteca: TCtrlBiblioteca;

implementation

{ TCtrlBiblioteca }

constructor TCtrlBiblioteca.Create;
begin
   inherited;

end;

destructor TCtrlBiblioteca.Destroy;
begin
   inherited;

end;

function TCtrlBiblioteca.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TCtrlBiblioteca.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TCtrlBiblioteca.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

function TCtrlBiblioteca.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;

end.
