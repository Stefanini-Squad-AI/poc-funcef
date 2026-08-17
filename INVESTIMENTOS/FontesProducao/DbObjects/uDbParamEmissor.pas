{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Atualizado Em: 11/09/2007                             }
{                                                       }
{*******************************************************}

unit uDbParamEmissor;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamEmissor = class(TCmDbObject)

  private
    FIDParamEmissor: TCmDbField;
    FDescParamEmissor: TCmDbField;
    procedure SetDescParamEmissor(const Value: TCmDbField);
    procedure SetIDParamEmissor(const Value: TCmDbField);

  public

     Property IDParamEmissor: TCmDbField read FIDParamEmissor write SetIDParamEmissor;
     Property DescParamEmissor: TCmDbField read FDescParamEmissor write SetDescParamEmissor;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamEmissor }

constructor TDbParamEmissor.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMEMISSOR';

  //                                                                   |Required |Key    |Readonly |NullIfZero
  //                                            --------------------------------------------------------------
  fIDParamEmissor   := CreateCmDbField('IDPARAMEMISSOR'   ,ftfloat,     True,     True,   False,    False,    'Identificador único da ParamEmissor');
  fDescParamEmissor := CreateCmDbField('DESCPARAMEMISSOR' ,ftString,    False,    False,  False,    True,     'Tipo de Indicador');
end;

function TDbParamEmissor.Insert: Boolean;
begin

   fIDParamEmissor.AsFloat := GetSequence('PARAMEMISSOR');
   Result := Inherited Insert;

end;


procedure TDbParamEmissor.SetDescParamEmissor(const Value: TCmDbField);
begin
  FDescParamEmissor := Value;
end;

procedure TDbParamEmissor.SetIDParamEmissor(const Value: TCmDbField);
begin
  FIdParamEmissor := Value;
end;

end.



