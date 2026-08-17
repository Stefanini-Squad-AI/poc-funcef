{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamregra;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParamRegra = class(TCmDbObject)

  private
    FFlgvariavel: TCmDbField;
    FFlgcampo: TCmDbField;
    procedure SetFlgcampo(const Value: TCmDbField);
    procedure SetFlgvariavel(const Value: TCmDbField);

  public

     Property Flgvariavel: TCmDbField read FFlgvariavel write SetFlgvariavel;
     Property Flgcampo: TCmDbField read FFlgcampo write SetFlgcampo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamRegra }

constructor TDbParamRegra.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMREGRA';

   fFlgvariavel := CreateCmDbField('FLGVARIAVEL',ftfloat,False,False,False,False,'Flag Variável ');
   fFlgcampo := CreateCmDbField('FLGCAMPO',ftfloat,False,False,False,False,'Flag Campo');
end;

function TDbParamRegra.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbParamRegra.SetFlgcampo(const Value: TCmDbField);
begin
  FFlgcampo := Value;
end;

procedure TDbParamRegra.SetFlgvariavel(const Value: TCmDbField);
begin
  FFlgvariavel := Value;
end;

end.



