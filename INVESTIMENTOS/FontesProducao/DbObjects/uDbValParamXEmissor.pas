{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 19/09/2007                             }
{                                                       }
{*******************************************************}

unit uDbValParamXEmissor;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbValParamXEmissor = class(TCmDbObject)

  private
    FIdparamemissor: TCmDbField;
    FIdemissor: TCmDbField;
    FIdregrausoemissor: TCmDbField;
    FVlrparamemissor: TCmDbField;
    FDatarefpremissor: TCmDbField;
    procedure SetDatarefpremissor(const Value: TCmDbField);
    procedure SetIdemissor(const Value: TCmDbField);
    procedure SetIdparamemissor(const Value: TCmDbField);
    procedure SetIdregrausoemissor(const Value: TCmDbField);
    procedure SetVlrparamemissor(const Value: TCmDbField);

  public

     Property Vlrparamemissor: TCmDbField read FVlrparamemissor write SetVlrparamemissor;
     Property Idregrausoemissor: TCmDbField read FIdregrausoemissor write SetIdregrausoemissor;
     Property Idparamemissor: TCmDbField read FIdparamemissor write SetIdparamemissor;
     Property Idemissor: TCmDbField read FIdemissor write SetIdemissor;
     Property Datarefpremissor: TCmDbField read FDatarefpremissor write SetDatarefpremissor;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbValParamXEmissor }

constructor TDbValParamXEmissor.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'VALPARAMXEMISSOR';

  //                                                                   |Required |Key    |Readonly |NullIfZero
  //                                            --------------------------------------------------------------
  fVlrparamemissor := CreateCmDbField('VLRPARAMEMISSOR',    ftfloat,    False,    False,   False,   True,'');
  fIdregrausoemissor := CreateCmDbField('IDREGRAUSOEMISSOR',ftfloat,    False,    False,   False,   True,'');
  fIdparamemissor := CreateCmDbField('IDPARAMEMISSOR',      ftfloat,    True,     True,    False,   True,'');
  fIdemissor := CreateCmDbField('IDEMISSOR',                ftfloat,    True,     True,    False,   True,'');
  fDatarefpremissor := CreateCmDbField('DATAREFPREMISSOR',  ftDateTime, True,     True,    False,   True,'');
end;

function TDbValParamXEmissor.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbValParamXEmissor.SetDatarefpremissor(const Value: TCmDbField);
begin
  FDatarefpremissor := Value;
end;

procedure TDbValParamXEmissor.SetIdemissor(const Value: TCmDbField);
begin
  FIdemissor := Value;
end;

procedure TDbValParamXEmissor.SetIdparamemissor(const Value: TCmDbField);
begin
  FIdparamemissor := Value;
end;

procedure TDbValParamXEmissor.SetIdregrausoemissor(
  const Value: TCmDbField);
begin
  FIdregrausoemissor := Value;
end;

procedure TDbValParamXEmissor.SetVlrparamemissor(const Value: TCmDbField);
begin
  FVlrparamemissor := Value;
end;

end.



