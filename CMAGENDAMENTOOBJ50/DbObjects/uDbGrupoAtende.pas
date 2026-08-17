{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/11/2005                             }
{                                                       }
{*******************************************************}

unit uDbGrupoAtende;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbGrupoAtende = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FObservacao: TCmDbField;
    FIdgrupoatende: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdgrupoatende(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);

  public

     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Idgrupoatende: TCmDbField read FIdgrupoatende write SetIdgrupoatende;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbGrupoAtende }

constructor TDbGrupoAtende.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPOATENDE';

   fIdgrupoatende := CreateCmDbField('IDGRUPOATENDE',ftfloat,True,True,False,True,'Id. Grupo de Atendentes');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'Observação');   
end;

function TDbGrupoAtende.Insert: Boolean;
begin

   fIdgrupoatende.AsFloat := GetSequence('GRUPOATENDE');
   Result := Inherited Insert;

end;


procedure TDbGrupoAtende.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbGrupoAtende.SetIdgrupoatende(const Value: TCmDbField);
begin
  FIdgrupoatende := Value;
end;

procedure TDbGrupoAtende.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

end.



