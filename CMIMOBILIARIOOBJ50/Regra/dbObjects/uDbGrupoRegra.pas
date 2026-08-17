{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrupoRegra;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

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

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbGrupoRegra }

constructor TDbGrupoRegra.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPOREGRA';

   fIdgruporegra := CreateCmDbField('IDGRUPOREGRA',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbGrupoRegra.Insert: Boolean;
begin

   fIdgruporegra.AsFloat := GetSequence('GRUPOREGRA');
   Result := Inherited Insert;

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



