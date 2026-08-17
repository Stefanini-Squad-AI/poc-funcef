{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbReservaorcamen;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbReservaorcamen = class(TCmDbObject)

  private
     FVlrreserva: TCmDbField;
     FVlrdevolvido: TCmDbField;
     FVlrcompromisso: TCmDbField;
     FPeriodo: TCmDbField;
     FObsreserva: TCmDbField;
     FNumreserva: TCmDbField;
     FIdreservaorcamen: TCmDbField;
     FIdprocesso: TCmDbField;
     FIdplanoorcamen: TCmDbField;
     FIdpessoa: TCmDbField;
     FIdmodulo: TCmDbField;
     FIdcontaorcamen: TCmDbField;
     FFlgreserva: TCmDbField;
     FFlgrescomp: TCmDbField;
     FExercicio: TCmDbField;
     FDatareferencia: TCmDbField;

     Procedure SetVlrreserva(const Value: TCmDbField);
     Procedure SetVlrdevolvido(const Value: TCmDbField);
     Procedure SetVlrcompromisso(const Value: TCmDbField);
     Procedure SetPeriodo(const Value: TCmDbField);
     Procedure SetObsreserva(const Value: TCmDbField);
     Procedure SetNumreserva(const Value: TCmDbField);
     Procedure SetIdreservaorcamen(const Value: TCmDbField);
     Procedure SetIdprocesso(const Value: TCmDbField);
     Procedure SetIdplanoorcamen(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdmodulo(const Value: TCmDbField);
     Procedure SetIdcontaorcamen(const Value: TCmDbField);
     Procedure SetFlgreserva(const Value: TCmDbField);
     Procedure SetFlgrescomp(const Value: TCmDbField);
     Procedure SetExercicio(const Value: TCmDbField);
     Procedure SetDatareferencia(const Value: TCmDbField);
  public

     Property Vlrreserva: TCmDbField Read FVlrreserva Write SetVlrreserva;
     Property Vlrdevolvido: TCmDbField Read FVlrdevolvido Write SetVlrdevolvido;
     Property Vlrcompromisso: TCmDbField Read FVlrcompromisso Write SetVlrcompromisso;
     Property Periodo: TCmDbField Read FPeriodo Write SetPeriodo;
     Property Obsreserva: TCmDbField Read FObsreserva Write SetObsreserva;
     Property Numreserva: TCmDbField Read FNumreserva Write SetNumreserva;
     Property Idreservaorcamen: TCmDbField Read FIdreservaorcamen Write SetIdreservaorcamen;
     Property Idprocesso: TCmDbField Read FIdprocesso Write SetIdprocesso;
     Property Idplanoorcamen: TCmDbField Read FIdplanoorcamen Write SetIdplanoorcamen;
     Property Idpessoa: TCmDbField Read FIdpessoa Write SetIdpessoa;
     Property Idmodulo: TCmDbField Read FIdmodulo Write SetIdmodulo;
     Property Idcontaorcamen: TCmDbField Read FIdcontaorcamen Write SetIdcontaorcamen;
     Property Flgreserva: TCmDbField Read FFlgreserva Write SetFlgreserva;
     Property Flgrescomp: TCmDbField Read FFlgrescomp Write SetFlgrescomp;
     Property Exercicio: TCmDbField Read FExercicio Write SetExercicio;
     Property Datareferencia: TCmDbField Read FDatareferencia Write SetDatareferencia;

     Constructor Create(AOwner: TcmCustomcdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbReservaorcamen }

constructor TDbReservaorcamen.Create(AOwner: TcmCustomcdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName         := 'RESERVAORCAMEN';
  fVlrreserva       := CreateCmDbField(  'VLRRESERVA',       ftfloat,    False, False, False, False, '' );
  fVlrdevolvido     := CreateCmDbField(  'VLRDEVOLVIDO',     ftfloat,    False, False, False, False, '' );
  fVlrcompromisso   := CreateCmDbField(  'VLRCOMPROMISSO',   ftfloat,    False, False, False, False, '' );
  fPeriodo          := CreateCmDbField(  'PERIODO',          ftfloat,    False, False, False, True,  '' );
  fObsreserva       := CreateCmDbField(  'OBSRESERVA',       ftString,   False, False, False, True,  '' );
  fNumreserva       := CreateCmDbField(  'NUMRESERVA',       ftfloat,    False, False, False, True,  '' );
  fIdreservaorcamen := CreateCmDbField(  'IDRESERVAORCAMEN', ftfloat,    True,  True,  False, True,  '' );
  fIdprocesso       := CreateCmDbField(  'IDPROCESSO',       ftfloat,    False, False, False, True,  '' );
  fIdplanoorcamen   := CreateCmDbField(  'IDPLANOORCAMEN',   ftfloat,    False, False, False, True,  '' );
  fIdpessoa         := CreateCmDbField(  'IDPESSOA',         ftfloat,    False, False, False, True,  '' );
  fIdmodulo         := CreateCmDbField(  'IDMODULO',         ftfloat,    False, False, False, True,  '' );
  fIdcontaorcamen   := CreateCmDbField(  'IDCONTAORCAMEN',   ftString,   False, False, False, True,  '' );
  fFlgreserva       := CreateCmDbField(  'FLGRESERVA',       ftString,   False, False, False, True,  '' );
  fFlgrescomp       := CreateCmDbField(  'FLGRESCOMP',       ftString,   False, False, False, True,  '' );
  fExercicio        := CreateCmDbField(  'EXERCICIO',        ftfloat,    False, False, False, True,  '' );
  fDatareferencia   := CreateCmDbField(  'DATAREFERENCIA',   ftDateTime, False, False, False, True,  '' );
end;

function TDbReservaorcamen.Insert: Boolean;
begin

   fIdreservaorcamen.AsFloat := GetSequence('RESERVAORCAMEN');
   Result := Inherited Insert;

end;

function TDbReservaorcamen.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

Procedure TDbReservaorcamen.SetVlrreserva(const Value: TCmDbField);
begin
  FVlrreserva := Value;
end;

Procedure TDbReservaorcamen.SetVlrdevolvido(const Value: TCmDbField);
begin
  FVlrdevolvido := Value;
end;

Procedure TDbReservaorcamen.SetVlrcompromisso(const Value: TCmDbField);
begin
  FVlrcompromisso := Value;
end;

Procedure TDbReservaorcamen.SetPeriodo(const Value: TCmDbField);
begin
  FPeriodo := Value;
end;

Procedure TDbReservaorcamen.SetObsreserva(const Value: TCmDbField);
begin
  FObsreserva := Value;
end;

Procedure TDbReservaorcamen.SetNumreserva(const Value: TCmDbField);
begin
  FNumreserva := Value;
end;

Procedure TDbReservaorcamen.SetIdreservaorcamen(const Value: TCmDbField);
begin
  FIdreservaorcamen := Value;
end;

Procedure TDbReservaorcamen.SetIdprocesso(const Value: TCmDbField);
begin
  FIdprocesso := Value;
end;

Procedure TDbReservaorcamen.SetIdplanoorcamen(const Value: TCmDbField);
begin
  FIdplanoorcamen := Value;
end;

Procedure TDbReservaorcamen.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

Procedure TDbReservaorcamen.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

Procedure TDbReservaorcamen.SetIdcontaorcamen(const Value: TCmDbField);
begin
  FIdcontaorcamen := Value;
end;

Procedure TDbReservaorcamen.SetFlgreserva(const Value: TCmDbField);
begin
  FFlgreserva := Value;
end;

Procedure TDbReservaorcamen.SetFlgrescomp(const Value: TCmDbField);
begin
  FFlgrescomp := Value;
end;

Procedure TDbReservaorcamen.SetExercicio(const Value: TCmDbField);
begin
  FExercicio := Value;
end;

Procedure TDbReservaorcamen.SetDatareferencia(const Value: TCmDbField);
begin
  FDatareferencia := Value;
end;

end.



