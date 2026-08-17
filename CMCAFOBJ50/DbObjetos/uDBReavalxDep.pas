{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 30/08/2002                             }
{                                                       }
{*******************************************************}

unit uDBReavalxDep;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

Type
  TDBReavalxDep = class(TCmDbObject)

  private
    FTaxadep: TCmDbField;
    FMoecodigo: TCmDbField;
    FDeplanc: TCmDbField;
    FCmdep: TCmDbField;
    FIdreavaliacao: TCmDbField;
    FIdreavalxdep: TCmDbField;
    FDataUltDep: TCmDbField;
    FDataUltCM: TCmDbField;
    FFlgDeprec: TCmDbField;
    procedure SetCmdep(const Value: TCmDbField);
    procedure SetDeplanc(const Value: TCmDbField);
    procedure SetIdreavaliacao(const Value: TCmDbField);
    procedure SetIdreavalxdep(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetTaxadep(const Value: TCmDbField);
    procedure SetDataUltDep(const Value: TCmDbField);
    procedure SetDataUltCM(const Value: TCmDbField);
    procedure SetFlgDeprec(const Value: TCmDbField);

  public

     Property Taxadep: TCmDbField read FTaxadep write SetTaxadep;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idreavalxdep: TCmDbField read FIdreavalxdep write SetIdreavalxdep;
     Property Idreavaliacao: TCmDbField read FIdreavaliacao write SetIdreavaliacao;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Cmdep: TCmDbField read FCmdep write SetCmdep;
     Property DataUltDep: TCmDbField read FDataUltDep write SetDataUltDep;
     Property DataUltCM: TCmDbField read FDataUltCM write SetDataUltCM;
     Property FlgDeprec: TCmDbField read FFlgDeprec write SetFlgDeprec;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBReavalxDep }

constructor TDBReavalxDep.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'REAVALXDEP';

   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,True,'');
   fIdreavalxdep := CreateCmDbField('IDREAVALXDEP',ftfloat,True,True,False,True,'');
   fIdreavaliacao := CreateCmDbField('IDREAVALIACAO',ftfloat,True,True,False,True,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,False,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,False,'');
   fDataultdep := CreateCmDbField('DATAULTDEP',ftDateTime,False,False,False,True,'');
   fDataultcm := CreateCmDbField('DATAULTCM',ftDateTime,False,False,False,True,'');
   fFlgDeprec := CreateCmDbField('FLGDEPREC',ftfloat,False,False,False,False,'');
end;

function TDBReavalxDep.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDBReavalxDep.SetCmdep(const Value: TCmDbField);
begin
  FCmdep := Value;
end;

procedure TDBReavalxDep.SetDataUltCM(const Value: TCmDbField);
begin
  FDataUltCM := Value;
end;

procedure TDBReavalxDep.SetDataUltDep(const Value: TCmDbField);
begin
  FDataUltDep := Value;
end;

procedure TDBReavalxDep.SetDeplanc(const Value: TCmDbField);
begin
  FDeplanc := Value;
end;

procedure TDBReavalxDep.SetFlgDeprec(const Value: TCmDbField);
begin
  FFlgDeprec := Value;
end;

procedure TDBReavalxDep.SetIdreavaliacao(const Value: TCmDbField);
begin
  FIdreavaliacao := Value;
end;

procedure TDBReavalxDep.SetIdreavalxdep(const Value: TCmDbField);
begin
  FIdreavalxdep := Value;
end;

procedure TDBReavalxDep.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBReavalxDep.SetTaxadep(const Value: TCmDbField);
begin
  FTaxadep := Value;
end;

end.

