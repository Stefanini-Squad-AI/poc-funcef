{** *****************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBAcrescValorxDep;

interface
Uses uCmDbObject, DB, uCmCustomCdbObject;

Type
  TDBAcrescValorxDep = class(TCmDbObject)

  private
    FIdacrescimo: TCmDbField;
    FMoecodigo: TCmDbField;
    FTaxadep: TCmDbField;
    FCmdep: TCmDbField;
    FDeplanc: TCmDbField;
    FIdacrescimoxdep: TCmDbField;
    FDataUltDep: TCmDbField;
    FDataUltCM: TCmDbField;
    FFlgDeprec: TCmDbField;
    procedure SetCmdep(const Value: TCmDbField);
    procedure SetDeplanc(const Value: TCmDbField);
    procedure SetIdacrescimo(const Value: TCmDbField);
    procedure SetIdacrescimoxdep(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetTaxadep(const Value: TCmDbField);
    procedure SetDataUltDep(const Value: TCmDbField);
    procedure SetDataUltCM(const Value: TCmDbField);
    procedure SetFlgDeprec(const Value: TCmDbField);

  public
     Property Taxadep: TCmDbField read FTaxadep write SetTaxadep;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idacrescimoxdep: TCmDbField read FIdacrescimoxdep write SetIdacrescimoxdep;
     Property Idacrescimo: TCmDbField read FIdacrescimo write SetIdacrescimo;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Cmdep: TCmDbField read FCmdep write SetCmdep;
     Property DataUltDep: TCmDbField read FDataUltDep write SetDataUltDep;
     Property DataUltCM: TCmDbField read FDataUltCM write SetDataUltCM;
     Property FlgDeprec: TCmDbField read FFlgDeprec write SetFlgDeprec;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBAcrescValorxDep }

constructor TDBAcrescValorxDep.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'ACRESCVALORXDEP';

   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdacrescimoxdep := CreateCmDbField('IDACRESCIMOXDEP',ftfloat,True,True,False,False,'');
   fIdacrescimo := CreateCmDbField('IDACRESCIMO',ftfloat,True,True,False,False,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,False,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,False,'');
   fDataultdep := CreateCmDbField('DATAULTDEP',ftDateTime,False,False,False,True,'');
   fDataultcm := CreateCmDbField('DATAULTCM',ftDateTime,False,False,False,True,'');
   fFlgDeprec := CreateCmDbField('FLGDEPREC',ftfloat,False,False,False,False,'');
end;

function TDBAcrescValorxDep.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBAcrescValorxDep.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBAcrescValorxDep.SetCmdep(const Value: TCmDbField);
begin
  FCmdep := Value;
end;

procedure TDBAcrescValorxDep.SetDataUltCM(const Value: TCmDbField);
begin
  FDataUltCM := Value;
end;

procedure TDBAcrescValorxDep.SetDataUltDep(const Value: TCmDbField);
begin
  FDataUltDep := Value;
end;

procedure TDBAcrescValorxDep.SetDeplanc(const Value: TCmDbField);
begin
  FDeplanc := Value;
end;

procedure TDBAcrescValorxDep.SetFlgDeprec(const Value: TCmDbField);
begin
  FFlgDeprec := Value;
end;

procedure TDBAcrescValorxDep.SetIdacrescimo(const Value: TCmDbField);
begin
  FIdacrescimo := Value;
end;

procedure TDBAcrescValorxDep.SetIdacrescimoxdep(const Value: TCmDbField);
begin
  FIdacrescimoxdep := Value;
end;

procedure TDBAcrescValorxDep.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBAcrescValorxDep.SetTaxadep(const Value: TCmDbField);
begin
  FTaxadep := Value;
end;

end.



