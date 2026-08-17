{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipoindicador;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipoindicador = class(TCmDbObject)

  private
    FIdtipo: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdtipo(const Value: TCmDbField);

  public

     Property Idtipo: TCmDbField read FIdtipo write SetIdtipo;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipoindicador }

constructor TDbTipoindicador.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDTIPOINDICADOR';

   fIdtipo := CreateCmDbField('IDTIPO',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
end;

function TDbTipoindicador.Insert: Boolean;
begin

   fIdtipo.AsFloat := GetSequence('INDTIPOINDICADOR');
   Result := Inherited Insert;

end;

function TDbTipoindicador.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipoindicador.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbTipoindicador.SetIdtipo(const Value: TCmDbField);
begin
  FIdtipo := Value;
end;

end.



