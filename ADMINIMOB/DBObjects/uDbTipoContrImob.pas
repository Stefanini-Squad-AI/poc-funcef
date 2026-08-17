{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/03/2007                             }
{                                                       }
{*******************************************************}

unit uDbTipoContrImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipoContrImob = class(TCmDbObject)

  private
    FNome: TCmDbField;
    FSigla: TCmDbField;
    FIdtipocontrimob: TCmDbField;
    procedure SetIdtipocontrimob(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetSigla(const Value: TCmDbField);

  public

     Property Sigla: TCmDbField read FSigla write SetSigla;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Idtipocontrimob: TCmDbField read FIdtipocontrimob write SetIdtipocontrimob;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTipoContrImob }

constructor TDbTipoContrImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOCONTRIMOB';

   fSigla := CreateCmDbField('SIGLA',ftString,False,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fIdtipocontrimob := CreateCmDbField('IDTIPOCONTRIMOB',ftfloat,False,True,False,True,'');
end;

function TDbTipoContrImob.Insert: Boolean;
begin

   fIdtipocontrimob.AsFloat := GetSequence('TIPOCONTRIMOB');
   Result := Inherited Insert;

end;


procedure TDbTipoContrImob.SetIdtipocontrimob(const Value: TCmDbField);
begin
  FIdtipocontrimob := Value;
end;

procedure TDbTipoContrImob.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbTipoContrImob.SetSigla(const Value: TCmDbField);
begin
  FSigla := Value;
end;

end.



