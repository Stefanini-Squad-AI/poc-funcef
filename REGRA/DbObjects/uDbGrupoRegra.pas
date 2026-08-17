{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Ramos                 }
{ Atualizado Em: 03/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrupoRegra;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbGrupoRegra = class(TCmDbObject)

  private
    FIdgruporegra: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdgruporegra(const Value: TCmDbField);
  public
    Property Idgruporegra: TCmDbField read FIdgruporegra write SetIdgruporegra;
    Property Descricao: TCmDbField read FDescricao write SetDescricao;

    Constructor Create(Aowner: TCmCustomCdbObject); Virtual;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbGrupoRegra }

constructor TDbGrupoRegra.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPOREGRA';

  fIdgruporegra := CreateCmDbField('IDGRUPOREGRA',ftfloat,True,True,False,False,'Identificador ');
  fDescricao    := CreateCmDbField('DESCRICAO',ftString,True,False,False,False,'Descrição do grupo de Regra');
end;

function TDbGrupoRegra.Insert: Boolean;
begin
  fIdgruporegra.AsFloat := GetSequence('GRUPOREGRA');
  Result := Inherited Insert;
end;

function TDbGrupoRegra.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbGrupoRegra.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbGrupoRegra.SetIdgruporegra(const Value: TCmDbField);
begin
  FIdgruporegra := Value;
end;

end.



