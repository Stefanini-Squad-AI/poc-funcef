//******************************************************************************
// Data      : 12/02/2007
// Código    : AL_2
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação da Classe de Risco da Classe de Titulo
//******************************************************************************
// Data      : 27/11/2006
// Código    : AL_1
// Pendencia : 23861
// SOL       : 43516
// Desc      : Inclusão do Campo FLGUSAQTD na CLASSETITRENFIX
//******************************************************************************

unit uDbClasseRenfix;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbClasseRenfix = class(TCmDbObject)

  private
    FDescclassetit: TCmDbField;
    FFlgativa: TCmDbField;
    FCodtiptitulo: TCmDbField;
    FIdclassetit: TCmDbField;
    //AL_1
    FFlgUsaQtd: TCmDbField;
    //AL_2
    FIdClasseRisco: TCmDbField;
    procedure SetCodtiptitulo(const Value: TCmDbField);
    procedure SetDescclassetit(const Value: TCmDbField);
    procedure SetFlgativa(const Value: TCmDbField);
    procedure SetIdclassetit(const Value: TCmDbField);
    //AL_1
    procedure SetFlgUsaQtd(const Value: TCmDbField);
    //AL_2
    procedure SetIdClasseRisco(const Value: TCmDbField);

  public

     Property Idclassetit: TCmDbField read FIdclassetit write SetIdclassetit;
     Property Flgativa: TCmDbField read FFlgativa write SetFlgativa;
     Property Descclassetit: TCmDbField read FDescclassetit write SetDescclassetit;
     Property Codtiptitulo: TCmDbField read FCodtiptitulo write SetCodtiptitulo;
     //AL_1
     Property FlgUsaQtd : TCmDbField read FFlgUsaQtd write SetFlgUsaQtd;
     //AL_2
     Property IdClasseRisco : TCmDbField read FIdClasseRisco write SetIdClasseRisco;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbClasseRenfix }

constructor TDbClasseRenfix.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLASSETITRENFIX';

   fIdclassetit := CreateCmDbField('IDCLASSETIT',ftfloat,True,True,False,True,'');
   fFlgativa := CreateCmDbField('FLGATIVA',ftString,False,False,False,True,'');
   fDescclassetit := CreateCmDbField('DESCCLASSETIT',ftString,False,False,False,True,'');
   fCodtiptitulo := CreateCmDbField('CODTIPTITULO',ftString,False,False,False,True,'');
   //AL_1
   fFlgUsaQtd := CreateCmDbField('FLGUSAQTD',ftString,False,False,False,True,'');
   //AL_2
   fIdClasseRisco := CreateCmDbField('IDCLASSERISCO',ftfloat,False,False,False,True,'');
end;

function TDbClasseRenfix.Insert: Boolean;
begin

   fIdclassetit.AsFloat := GetSequence('CLASSETITRENFIX');
   Result := Inherited Insert;

end;

procedure TDbClasseRenfix.SetCodtiptitulo(const Value: TCmDbField);
begin
  FCodtiptitulo := Value;
end;

procedure TDbClasseRenfix.SetDescclassetit(const Value: TCmDbField);
begin
  FDescclassetit := Value;
end;

procedure TDbClasseRenfix.SetFlgativa(const Value: TCmDbField);
begin
  FFlgativa := Value;
end;
//AL_1
procedure TDbClasseRenfix.SetFlgUsaQtd(const Value: TCmDbField);
begin
  FFlgUsaQtd := Value;
end;

//AL_2
procedure TDbClasseRenfix.SetIdClasseRisco(const Value: TCmDbField);
begin
  FIdClasseRisco := Value;
end;

procedure TDbClasseRenfix.SetIdclassetit(const Value: TCmDbField);
begin
  FIdclassetit := Value;
end;

end.



