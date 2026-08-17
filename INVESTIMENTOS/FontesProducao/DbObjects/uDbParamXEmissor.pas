{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 24/09/2007                             }
{                                                       }
{*******************************************************}

unit uDbParamXEmissor;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamXEmissor = class(TCmDbObject)

  private
    FIdparamemissor: TCmDbField;
    FIdemissor: TCmDbField;
    procedure SetIdemissor(const Value: TCmDbField);
    procedure SetIdparamemissor(const Value: TCmDbField);

  public

    Property Idparamemissor: TCmDbField read FIdparamemissor write SetIdparamemissor;
    Property Idemissor: TCmDbField read FIdemissor write SetIdemissor;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamXEmissor }

constructor TDbParamXEmissor.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMXEMISSOR';

  //                                                                   |Required |Key    |Readonly |NullIfZero
  //                                            --------------------------------------------------------------
  fIdparamemissor := CreateCmDbField('IDPARAMEMISSOR',ftfloat,          True,     True,    False,   True,       'Indicador');
  fIdemissor := CreateCmDbField('IDEMISSOR',ftfloat,                    True,     True,    False,   True,       'Emissor');
end;

function TDbParamXEmissor.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbParamXEmissor.SetIdemissor(const Value: TCmDbField);
begin
  FIdemissor := Value;
end;

procedure TDbParamXEmissor.SetIdparamemissor(const Value: TCmDbField);
begin
  FIdparamemissor := Value;
end;

end.



