{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBDesmembramento;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBDesmembramento = class(TCmDbObject)

  private
    FIdbemresultante: TCmDbField;
    FProporcao: TCmDbField;
    FIdmovimentacao: TCmDbField;
    procedure SetIdbemresultante(const Value: TCmDbField);
    procedure SetIdmovimentacao(const Value: TCmDbField);
    procedure SetProporcao(const Value: TCmDbField);

  public

     Property Proporcao: TCmDbField read FProporcao write SetProporcao;
     Property Idmovimentacao: TCmDbField read FIdmovimentacao write SetIdmovimentacao;
     Property Idbemresultante: TCmDbField read FIdbemresultante write SetIdbemresultante;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBDesmembramento }

constructor TDBDesmembramento.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DESMEMBRAMENTO';

   fProporcao := CreateCmDbField('PROPORCAO',ftfloat,False,False,False,False,'');
   fIdmovimentacao := CreateCmDbField('IDMOVIMENTACAO',ftfloat,True,True,False,True,'');
   fIdbemresultante := CreateCmDbField('IDBEMRESULTANTE',ftfloat,True,True,False,True,'');
end;

function TDBDesmembramento.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBDesmembramento.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBDesmembramento.SetIdbemresultante(const Value: TCmDbField);
begin
  FIdbemresultante := Value;
end;

procedure TDBDesmembramento.SetIdmovimentacao(const Value: TCmDbField);
begin
  FIdmovimentacao := Value;
end;

procedure TDBDesmembramento.SetProporcao(const Value: TCmDbField);
begin
  FProporcao := Value;
end;

end.



