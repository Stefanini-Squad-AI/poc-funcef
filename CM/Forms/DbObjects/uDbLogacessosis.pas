{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Rodolpho da Silva               }
{ Atualizado Em: 17/11/2005                             }
{                                                       }
{*******************************************************}

unit uDbLogacessosis;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbLogacessosis = class(TCmDbObject)

  private
    FIdusuario: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdlogacessosis: TCmDbField;
    FFlgoperacao: TCmDbField;
    FMaquina: TCmDbField;
    procedure SetFlgoperacao(const Value: TCmDbField);
    procedure SetIdlogacessosis(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetMaquina(const Value: TCmDbField);

  public

     Property Idusuario      : TCmDbField read FIdusuario      write SetIdusuario;
     Property Idmodulo       : TCmDbField read FIdmodulo       write SetIdmodulo;
     Property Idlogacessosis : TCmDbField read FIdlogacessosis write SetIdlogacessosis;
     Property Flgoperacao    : TCmDbField read FFlgoperacao    write SetFlgoperacao;
     Property Maquina        : TCmDbField read FMaquina        write SetMaquina;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLogacessosis }

constructor TDbLogacessosis.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LOGACESSOSIS';

  fIdusuario      := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'');
  fIdmodulo       := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
  fIdlogacessosis := CreateCmDbField('IDLOGACESSOSIS',ftfloat,True,True,False,True,'');
  fFlgoperacao    := CreateCmDbField('FLGOPERACAO',ftString,False,False,False,True,'');
  FMaquina        := CreateCmDbField('MAQUINA',ftString,False,False,False,True,'');
end;




function TDbLogacessosis.Insert: Boolean;
begin
  fIdlogacessosis.AsFloat := GetSequence('LOGACESSOSIS');
  Result := Inherited Insert;
end;




procedure TDbLogacessosis.SetFlgoperacao(const Value: TCmDbField);
begin
  FFlgoperacao := Value;
end;




procedure TDbLogacessosis.SetIdlogacessosis(const Value: TCmDbField);
begin
  FIdlogacessosis := Value;
end;




procedure TDbLogacessosis.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;




procedure TDbLogacessosis.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;




procedure TDbLogacessosis.SetMaquina(const Value: TCmDbField);
begin
  FMaquina := Value;
end;




end.



