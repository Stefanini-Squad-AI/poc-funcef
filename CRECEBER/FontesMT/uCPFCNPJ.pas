unit uCPFCNPJ;

interface

function FormataCPFCNPJ(Value: Variant): string;

implementation

uses
  SysUtils;

function FormataCPFCNPJ(Value: Variant): string;
var
  sTmp: string;
begin
  if VarType(Value) = varString then
  begin
    sTmp := trim(VarAsType(Value, varString));
    if length(sTmp) = 11 then
    begin
      // CPF
      sTmp := copy(sTmp, 1, 3)+
              '.'+
              copy(sTmp, 4, 3)+
              '.'+
              copy(sTmp, 7, 3)+
              '-'+
              copy(sTmp, 10, 2);
    end
    else if length(sTmp) = 14 then
    begin
      // CGC = CNPJ
      sTmp := copy(sTmp, 1, 2)+
              '.'+
              copy(sTmp, 3, 3)+
              '.'+
              copy(sTmp, 6, 3)+
              '/'+
              copy(sTmp, 9, 4)+
              '-'+
              copy(sTmp, 13, 2);
    end
    else
    begin
      sTmp := '';      // '-ERR FormataCPFCNPJ: not CPF/CNPJ'
    end;
  end
  else
  begin
    sTmp := '-ERR FormataCPFCNPJ: not string';
  end;
  FormataCPFCNPJ := sTmp;
end;

end.
 
