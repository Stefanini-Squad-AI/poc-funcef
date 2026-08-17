{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbSeguradora;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbSeguradora = class(TCmDbObject)

  private
    FIdseguradora: TCmDbField;
    procedure SetIdseguradora(const Value: TCmDbField);

  public

     Property Idseguradora: TCmDbField read FIdseguradora write SetIdseguradora;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSeguradora }

constructor TDbSeguradora.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SEGURADORA';

   fIdseguradora := CreateCmDbField('IDSEGURADORA',ftfloat,True,True,False,True,'');
end;

function TDbSeguradora.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbSeguradora.SetIdseguradora(const Value: TCmDbField);
begin
  FIdseguradora := Value;
end;

end.



