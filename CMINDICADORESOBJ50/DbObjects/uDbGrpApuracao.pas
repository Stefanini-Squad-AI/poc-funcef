{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrpApuracao;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbGrpApuracao = class(TCmDbObject)

  private
    FDescricao: TCmDbField;
    FTipogrupo: TCmDbField;
    FIdgrpapuracao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdgrpapuracao(const Value: TCmDbField);
    procedure SetTipogrupo(const Value: TCmDbField);

  public

     Property Tipogrupo: TCmDbField read FTipogrupo write SetTipogrupo;
     Property Idgrpapuracao: TCmDbField read FIdgrpapuracao write SetIdgrpapuracao;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbGrpApuracao }

constructor TDbGrpApuracao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDGRPAPURACAO';

   fTipogrupo := CreateCmDbField('TIPOGRUPO',ftString,True,False,False,True,'Tipo de Grupo de Apuração');
   fIdgrpapuracao := CreateCmDbField('IDGRPAPURACAO',ftfloat,True,True,False,True,'ID do Grupo de Apuração');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
end;

function TDbGrpApuracao.Insert: Boolean;
begin

   fIdgrpapuracao.AsFloat := GetSequence('INDGRPAPURACAO');
   Result := Inherited Insert;

end;

function TDbGrpApuracao.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbGrpApuracao.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbGrpApuracao.SetIdgrpapuracao(const Value: TCmDbField);
begin
  FIdgrpapuracao := Value;
end;

procedure TDbGrpApuracao.SetTipogrupo(const Value: TCmDbField);
begin
  FTipogrupo := Value;
end;

end.



