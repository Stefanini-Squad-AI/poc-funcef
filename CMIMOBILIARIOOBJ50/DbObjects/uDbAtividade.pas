{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbAtividade;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbAtividade = class(TCmDbObject)

  private
    FAtvdescricao: TCmDbField;
    FIdatividade: TCmDbField;
    procedure SetAtvdescricao(const Value: TCmDbField);
    procedure SetIdatividade(const Value: TCmDbField);

  public

     Property Idatividade: TCmDbField read FIdatividade write SetIdatividade;
     Property Atvdescricao: TCmDbField read FAtvdescricao write SetAtvdescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAtividade }

constructor TDbAtividade.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ATIVIDADE';

   fIdatividade := CreateCmDbField('IDATIVIDADE',ftfloat,True,True,False,True,'ID da Atividade');
   fAtvdescricao := CreateCmDbField('ATVDESCRICAO',ftString,True,False,False,True,'Descrição');
end;

function TDbAtividade.Insert: Boolean;
begin

   fIdatividade.AsFloat := GetSequence('ATIVIDADE');
   Result := Inherited Insert;

end;

function TDbAtividade.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbAtividade.SetAtvdescricao(const Value: TCmDbField);
begin
  FAtvdescricao := Value;
end;

procedure TDbAtividade.SetIdatividade(const Value: TCmDbField);
begin
  FIdatividade := Value;
end;

end.



