{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/11/2006                             }
{                                                       }
{*******************************************************}

unit uDbTranffundos;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTranffundos = class(TCmDbObject)

  private
    FCodlancfinanc: TCmDbField;
    FIdimpostoretido: TCmDbField;
    FDatatransf: TCmDbField;
    procedure SetCodlancfinanc(const Value: TCmDbField);
    procedure SetDatatransf(const Value: TCmDbField);
    procedure SetIdimpostoretido(const Value: TCmDbField);

  public

     Property Idimpostoretido: TCmDbField read FIdimpostoretido write SetIdimpostoretido;
     Property Datatransf: TCmDbField read FDatatransf write SetDatatransf;
     Property Codlancfinanc: TCmDbField read FCodlancfinanc write SetCodlancfinanc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTranffundos }

constructor TDbTranffundos.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TRANSFFUNDOS';

   fIdimpostoretido := CreateCmDbField('IDIMPOSTORETIDO',ftfloat,True,False,False,True,'');
   fDatatransf := CreateCmDbField('DATATRANSF',ftDateTime,False,False,False,True,'');
   fCodlancfinanc := CreateCmDbField('CODLANCFINANC',ftfloat,True,False,False,True,'');
end;

function TDbTranffundos.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbTranffundos.SetCodlancfinanc(const Value: TCmDbField);
begin
  FCodlancfinanc := Value;
end;

procedure TDbTranffundos.SetDatatransf(const Value: TCmDbField);
begin
  FDatatransf := Value;
end;

procedure TDbTranffundos.SetIdimpostoretido(const Value: TCmDbField);
begin
  FIdimpostoretido := Value;
end;

end.



