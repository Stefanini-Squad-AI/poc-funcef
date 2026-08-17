{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 02/03/2006                             }
{                                                       }
{*******************************************************}

unit uDbDocximpostoret;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDocximpostoret = class(TCmDbObject)

  private
    FCoddocumento: TCmDbField;
    FCodtipocustagreg: TCmDbField;
    FFlgtiporetenc: TCmDbField;
    FIdimpostoretido: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodtipocustagreg(const Value: TCmDbField);
    procedure SetFlgtiporetenc(const Value: TCmDbField);
    procedure SetIdimpostoretido(const Value: TCmDbField);

  public

     Property Idimpostoretido: TCmDbField read FIdimpostoretido write SetIdimpostoretido;
     Property Flgtiporetenc: TCmDbField read FFlgtiporetenc write SetFlgtiporetenc;
     Property Codtipocustagreg: TCmDbField read FCodtipocustagreg write SetCodtipocustagreg;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbDocximpostoret }

constructor TDbDocximpostoret.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DOCXIMPOSTORET';

   fIdimpostoretido := CreateCmDbField('IDIMPOSTORETIDO',ftfloat,True,True,False,True,'');
   fFlgtiporetenc := CreateCmDbField('FLGTIPORETENC',ftString,False,False,False,True,'');
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,True,True,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,True,True,False,True,'');
end;

function TDbDocximpostoret.Insert: Boolean;
begin

   fIdimpostoretido.AsFloat := GetSequence('DOCXIMPOSTORET');
   fCodtipocustagreg.AsFloat := GetSequence('DOCXIMPOSTORET');
   fCoddocumento.AsFloat := GetSequence('DOCXIMPOSTORET');
   Result := Inherited Insert;

end;


procedure TDbDocximpostoret.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbDocximpostoret.SetCodtipocustagreg(const Value: TCmDbField);
begin
  FCodtipocustagreg := Value;
end;

procedure TDbDocximpostoret.SetFlgtiporetenc(const Value: TCmDbField);
begin
  FFlgtiporetenc := Value;
end;

procedure TDbDocximpostoret.SetIdimpostoretido(const Value: TCmDbField);
begin
  FIdimpostoretido := Value;
end;

end.



