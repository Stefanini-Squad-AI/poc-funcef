{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbEventoMkg;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbEventoMkg = class(TCmDbObject)

  private
    FIdevento: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdevento(const Value: TCmDbField);

  public

     Property Idevento: TCmDbField read FIdevento write SetIdevento;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbEventoMkg }

constructor TDbEventoMkg.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDEVENTO';

   fIdevento := CreateCmDbField('IDEVENTO',ftfloat,True,True,False,True,'ID do Evento');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
end;

function TDbEventoMkg.Insert: Boolean;
begin

   fIdevento.AsFloat := GetSequence('INDEVENTO');
   Result := Inherited Insert;

end;

function TDbEventoMkg.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbEventoMkg.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbEventoMkg.SetIdevento(const Value: TCmDbField);
begin
  FIdevento := Value;
end;

end.



