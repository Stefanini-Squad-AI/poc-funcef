{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbSituacaotribtaba;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSituacaotribtaba = class(TCmDbObject)

  private
    FSituacaotriba: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetSituacaotriba(const Value: TCmDbField);

  public

     Property Situacaotriba: TCmDbField read FSituacaotriba write SetSituacaotriba;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSituacaotribtaba }

constructor TDbSituacaotribtaba.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SITUACAOTRIBTABA';

   fSituacaotriba := CreateCmDbField('SITUACAOTRIBA',ftString,True,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbSituacaotribtaba.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbSituacaotribtaba.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbSituacaotribtaba.SetSituacaotriba(const Value: TCmDbField);
begin
  FSituacaotriba := Value;
end;

end.



