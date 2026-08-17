{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 19/04/2002                             }
{                                                       }
{*******************************************************}

unit uDBVlrHistMovBem;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBVlrHistMovBem = class(TCmDbObject)

  private
    FIdmovimentacao: TCmDbField;
    FValor: TCmDbField;
    FMoecodigo: TCmDbField;
    procedure SetIdmovimentacao(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idmovimentacao: TCmDbField read FIdmovimentacao write SetIdmovimentacao;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBVlrHistMovBem }

constructor TDBVlrHistMovBem.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'VLRHISTMOVBEM';

   fValor := CreateCmDbField('VALOR',ftfloat,True,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdmovimentacao := CreateCmDbField('IDMOVIMENTACAO',ftfloat,True,True,False,False,'');
end;

function TDBVlrHistMovBem.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBVlrHistMovBem.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBVlrHistMovBem.SetIdmovimentacao(const Value: TCmDbField);
begin
  FIdmovimentacao := Value;
end;

procedure TDBVlrHistMovBem.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBVlrHistMovBem.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



