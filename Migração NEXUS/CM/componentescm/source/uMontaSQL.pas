unit uMontaSQL;

interface
uses Classes, uCMTypes, SysUtils, Math;

const CrLf = #13#10;

type
  TMontaSQL = class(TObject)
  public
    class function SqlInsert(Values : Variant;
                       TableName : string;
                       ColNames : array of string;
                       NullIfZero : array of boolean;
                       aFloatPrecision :Array of Integer; aSaveDateTimeFormat: Array of Boolean) : string; overload;

    class function SqlInsert(Values : Variant;
                       TableName : string;
                       ColNames : array of string) : string; overload;
    {Monta a frase de insert como os parâmetros passados. Parâmetros do tipo TDateTime devem ser
     passados como Variant}
    class function SqlInsert(Values : Variant;
                       TableName : string) : string; overload;

    {Monta a frase de update como os parâmetros passados. Parâmetros do tipo TDateTime devem ser
     passados como Variant}
    class function SqlUpdate(Values : Variant;
                       TableName : string;
                       ColNames : array of string;
                       WhereClause : string) : string; overload;

    class function SqlUpdate(Values : Variant;
                       TableName : string;
                       ColNames : array of string;
                       WhereClause : string;
                       NullIfZero : array of boolean;
                       aFloatPrecision :Array of Integer; aSaveDateTimeFormat: Array of Boolean) : string; overload;

    class function VarIsType(V: Variant; iTipo: Integer): boolean;
  end;


implementation

class function TMontaSQL.SqlInsert(Values : Variant;
                   TableName : string;
                   ColNames : array of string) : string;
var RetVar : string;
    i : integer;
    sDecSep :Char;
begin
  sDecSep := DECIMALSEPARATOR;

  Try
     DECIMALSEPARATOR := '.';

     RetVar := 'insert into ' + TableName + CrLf +
               '(' + ColNames[0];
     for i := 1 to High(ColNames) do
        RetVar := RetVar + ',' + ColNames[i];
     RetVar := RetVar + ')' + CrLf;

     RetVar := RetVar + 'values (';

     for i := 0 to VarArrayHighBound(Values,1) do
     begin
       case VarType(Values[i]) of
         varDate: RetVar := RetVar + 'to_date(' +
                        QuotedStr(FormatdateTime('dd/mm/yyyy',VarToDateTime(Values[i]))) + ',' +
                        QuotedStr('dd/mm/yyyy') + ')';
         varInteger,
         varSmallint :  RetVar := RetVar + FloatToStr(VarAsType(Values[i],VarType(Values[i])));

         varOleStr,
         varString: RetVar := RetVar + QuotedStr(VarToStr(Values[i]));

         varSingle,
         varDouble: RetVar := RetVar + FloatToStr(VarAsType(Values[i],varDouble));
       end;
       RetVar := RetVar + ',';
     end;

     System.Delete(RetVar,length(RetVar),1);
     RetVar := RetVar + ')';
     if VarArrayHighBound(Values,1) < High(ColNames) then
        raise Exception.Create('SQL Insert - Foram passados menos valores do que colunas.');
     if VarArrayHighBound(Values,1) > High(ColNames) then
        raise Exception.Create('SQL Insert - Foram passadas mais valores do que colunas.');

     Result := RetVar;
     DECIMALSEPARATOR := sDecSep;
  Except
     DECIMALSEPARATOR := sDecSep;
     Raise;
  End;
end;


class function TMontaSQL.SqlInsert(Values : Variant;
                   TableName : string) : string;
var RetVar : string;
    i : integer;
    sDecSep :Char;
begin
  sDecSep := DECIMALSEPARATOR;

  Try
     DECIMALSEPARATOR := '.';
     RetVar := 'insert into ' + TableName + CrLf;
     RetVar := RetVar + 'values (';

     for i := 0 to VarArrayHighBound(Values,1) do
     begin
       case VarType(Values[i]) of
         varDate: RetVar := RetVar + 'to_date(' +
                        QuotedStr(FormatdateTime('dd/mm/yyyy',VarToDateTime(Values[i]))) + ',' +
                        QuotedStr('dd/mm/yyyy') + ')';
         varInteger,
         varSmallint :  RetVar := RetVar + FloatToStr(VarAsType(Values[i],VarType(Values[i])));

         varOleStr,
         varString: RetVar := RetVar + QuotedStr(VarToStr(Values[i]));

         varSingle,
         varDouble: RetVar := RetVar + FloatToStr(VarAsType(Values[i],varDouble));
       end;
       RetVar := RetVar + ',';
     end;

     System.Delete(RetVar,length(RetVar),1);
     RetVar := RetVar + ')';

     Result := RetVar;
     DECIMALSEPARATOR := sDecSep;
  Except
     DECIMALSEPARATOR := sDecSep;
     Raise;
  End;
end;

class function TMontaSQL.SqlInsert(Values: Variant; TableName: string;
  ColNames: array of string;NullIfZero : array of boolean;
  aFloatPrecision :Array of Integer; aSaveDateTimeFormat: Array of Boolean): string;
var RetVar : string;
    i : integer;
    sDecSep :Char;
begin
  sDecSep := DECIMALSEPARATOR;

  Try
     DECIMALSEPARATOR := '.';

     RetVar := 'insert into ' + TableName + CrLf + '(';

     for i := 0 to High(ColNames) do
        if ((ColNames[i] <> CMFieldBlob) And (ColNames[i] <> CMInvalidField)) then
           RetVar := RetVar + ColNames[i] + ',' ;

     RetVar := Copy(RetVar,1,Length(RetVar)-1) + ')' + CrLf;

     RetVar := RetVar + 'values (';

     for i := 0 to VarArrayHighBound(Values,1) do
     begin
       if ((ColNames[i] <> CMFieldBlob) And (ColNames[i] <> CMInvalidField)) then
       begin
         if NullIfZero[i] and (VarIsNull(Values[i]) or
         ( TMontaSQL.VarIsType(Values[i],varDouble) and (VarAsType(Values[i],varDouble) = 0)  ) or
         ( TMontaSQL.VarIsType(Values[i],varString) and (VarAsType(Values[i],varString) = ''))) then
           RetVar := RetVar + 'null'
         else
         begin
           case VarType(Values[i]) of
             varDate:
                 If NullIfZero[i] And (VarToDateTime(Values[i]) = 0) Then
                    RetVar := RetVar + 'null'
                 Else
                 begin
                    if aSaveDateTimeFormat[i] then
                      RetVar := RetVar + 'to_date(' +
                                   QuotedStr(FormatdateTime('DD/MM/YYYY HH:NN:SS',
                                   VarToDateTime(Values[i]))) + ',' +
                                   QuotedStr('DD/MM/YYYY HH24:MI:SS') + ')'
                    else
                      RetVar := RetVar + 'to_date(' +
                                   QuotedStr(FormatdateTime('dd/mm/yyyy',
                                   VarToDateTime(Values[i]))) + ',' +
                                   QuotedStr('dd/mm/yyyy') + ')';
                 end;
             varInteger,
             varSmallint :  RetVar := RetVar + FloatToStr(VarAsType(Values[i],VarType(Values[i])));

             varOleStr,
             varString: RetVar := RetVar + QuotedStr(VarToStr(Values[i]));

             varSingle,
             varDouble:
               If NullIfZero[i] And (VarAsType(Values[i],varDouble) = 0) Then
                 RetVar := RetVar + 'null'
               Else
               begin
                 if aFloatPrecision[i] > -1 then
                    RetVar := RetVar + 'ROUND(' + FloatToStr(VarAsType(Values[i],varDouble)) + ',' + IntToStr(aFloatPrecision[i]) + ')'
                 else
                    RetVar := RetVar + FloatToStr(VarAsType(Values[i],varDouble));
               end;
           end;
         end;

         RetVar := RetVar + ',';
       end;
     end;

     System.Delete(RetVar,length(RetVar),1);
     RetVar := RetVar + ')';
     if VarArrayHighBound(Values,1) < High(ColNames) then
        raise Exception.Create('SQL Insert - Foram passados menos valores do que colunas.');
     if VarArrayHighBound(Values,1) > High(ColNames) then
        raise Exception.Create('SQL Insert - Foram passadas mais valores do que colunas.');

     Result := RetVar;
     DECIMALSEPARATOR := sDecSep;
  Except
     DECIMALSEPARATOR := sDecSep;
     Raise;
  End;
end;

class function TMontaSQL.SqlUpdate(Values : Variant;
                   TableName : string;
                   ColNames : array of string;
                   WhereClause : string;
                   NullIfZero : array of boolean;
                   aFloatPrecision :Array of Integer; aSaveDateTimeFormat: Array of Boolean) : string;
var RetVar,Parm : string;
    i : integer;
    sDecSep :Char;
begin
  sDecSep := DECIMALSEPARATOR;

  Try
     DECIMALSEPARATOR := '.';

     RetVar := 'update ' + TableName + ' set' + CrLf;


     for i := 0 to VarArrayHighBound(Values,1) do
     begin
       if NullIfZero[i] and (VarIsNull(Values[i]) or
       ( TMontaSQL.VarIsType(Values[i],varDouble) and (VarAsType(Values[i],varDouble) = 0)  ) or
       ( TMontaSQL.VarIsType(Values[i],varString) and (VarAsType(Values[i],varString) = ''))) then
         parm := 'null'
       else
       begin
         case VarType(Values[i]) of
           varDate:
               If NullIfZero[i] And (VarToDateTime(Values[i]) = 0) Then
                 Parm := 'null'
               Else                                                    
               begin
                 if aSaveDateTimeFormat[i] then
                   Parm := 'to_date(' +
                                QuotedStr(FormatdateTime('DD/MM/YYYY HH:NN:SS',
                                VarToDateTime(Values[i]))) + ',' +
                                QuotedStr('DD/MM/YYYY HH24:MI:SS') + ')'
                 else
                   Parm := 'to_date(' +
                                QuotedStr(FormatdateTime('DD/MM/YYYY',
                                VarToDateTime(Values[i]))) + ',' +
                                QuotedStr('DD/MM/YYYY') + ')';
               end;
           varInteger,
           varSmallint :  parm := FloatToStr(VarAsType(Values[i],VarType(Values[i])));

           varOleStr,
           varString: If (ColNames[i] <> CMFieldBlob) And
                         (ColNames[i] <> CMInvalidField) Then
                      parm := QuotedStr(VarToStr(Values[i]));

           varSingle,
           varDouble:
               If NullIfZero[i] And (VarAsType(Values[i],varDouble) = 0) Then
                 Parm := 'null'
               Else
               begin
                 if aFloatPrecision[i] > -1 then
                    Parm := 'ROUND(' + FloatToStr(VarAsType(Values[i],varDouble)) + ',' + IntToStr(aFloatPrecision[i]) + ')'
                 else
                    Parm := FloatToStr(VarAsType(Values[i],varDouble));
               end;
         end;
       end;

       If (ColNames[i] <> CMFieldBlob) And
          (ColNames[i] <> CMInvalidField) Then
          RetVar := RetVar + ColNames[i] + '=' + Parm + ',';
     end;

     System.Delete(RetVar,length(RetVar),1);
     RetVar := RetVar + CrLf + 'where ' + WhereClause;

     if VarArrayHighBound(Values,1) < High(ColNames) then
        raise Exception.Create('SQL Update - Foram passados menos valores do que colunas.');
     if VarArrayHighBound(Values,1) > High(ColNames) then
        raise Exception.Create('SQL Update - Foram passadas mais valores do que colunas.');

     Result := RetVar;
     DECIMALSEPARATOR := sDecSep;
  Except
     DECIMALSEPARATOR := sDecSep;
     Raise;
  End;
end;

class function TMontaSQL.SqlUpdate(Values : Variant;
                   TableName : string;
                   ColNames : array of string;
                   WhereClause : string) : string;
var RetVar,Parm : string;
    i : integer;
    sDecSep :Char;
begin
  sDecSep := DECIMALSEPARATOR;

  Try
     DECIMALSEPARATOR := '.';

     RetVar := 'update ' + TableName + ' set' + CrLf;

     for i := 0 to Min(VarArrayHighBound(Values,1),High(ColNames)) do
     begin
       case VarType(Values[i]) of
         varDate: parm := 'to_date(' +
                        QuotedStr(FormatdateTime('dd/mm/yyyy',VarToDateTime(Values[i]))) + ',' +
                        QuotedStr('dd/mm/yyyy') + ')';
         varInteger,
         varSmallint (*,
         varInt64 *):  parm := FloatToStr(VarAsType(Values[i],VarType(Values[i])));

         varOleStr,
         varString: parm := QuotedStr(VarToStr(Values[i]));               

         varSingle,
         varDouble: parm := FloatToStr(VarAsType(Values[i],varDouble));
       end;

        
        RetVar := RetVar + ColNames[i] + '=' + Parm + ',';
     end;

     System.Delete(RetVar,length(RetVar),1);
     RetVar := RetVar + CrLf + 'where ' + WhereClause;

     if VarArrayHighBound(Values,1) < High(ColNames) then
        raise Exception.Create('SQL Update - Foram passados menos valores do que colunas.');
     if VarArrayHighBound(Values,1) > High(ColNames) then
        raise Exception.Create('SQL Update - Foram passadas mais valores do que colunas.');

     Result := RetVar;
     DECIMALSEPARATOR := sDecSep;
  Except
     DECIMALSEPARATOR := sDecSep;
     Raise;
  End;
end; 

class function TMontaSQL.VarIsType(V: Variant; iTipo: Integer): boolean;
begin
  Result := (VarType(V) = iTipo);
end;

end.
