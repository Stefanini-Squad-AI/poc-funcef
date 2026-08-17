{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 07/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbModelonf;

interface

Uses uCmCustomCDbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbModelonf = class(TCmDbObject)

  private
    FSigla: TCmDbField;
    FNumsintegra: TCmDbField;
    FDescmodelonf: TCmDbField;
    FCodmodelo: TCmDbField;
    procedure SetSigla(const Value: TCmDbField);
    procedure SetNumsintegra(const Value: TCmDbField);
    procedure SetDescmodelonf(const Value: TCmDbField);
    procedure SetCodmodelo(const Value: TCmDbField);
  protected
    function GetSqlSelect: String; Override;
  public

     Property Sigla: TCmDbField        read FSigla        write SetSigla;
     Property Numsintegra: TCmDbField  read FNumsintegra  write SetNumsintegra;
     Property Descmodelonf: TCmDbField read FDescmodelonf write SetDescModelonf;
     Property Codmodelo: TCmDbField    read FCodmodelo    write Setcodmodelo;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbModelonf }

constructor TDbModelonf.Create (Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MODELONF';
  { quando o campo for string, tirar os dois últimos parametros
    quando o campo for integer tirar apenas o último
  }


   fSigla := CreateCmDbField('SIGLA',ftString);
   fNumsintegra := CreateCmDbField('NUMSINTEGRA',ftString);
   fDescmodelonf := CreateCmDbField('DESCMODELONF',ftString);
   fCodmodelo := CreateCmDbField('CODMODELO',ftString,True,True);

end;

function TDbModelonf.GetSqlSelect: String;
begin
  If FCodmodelo.Asstring = '' Then
    Result := 'SELECT CODMODELO,DESCMODELONF, SIGLA, NUMSINTEGRA FROM MODELONF' +
               ' ORDER BY CODMODELO'
  Else
    Result := inherited GetSqlSelect;
end;

function TDbModelonf.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbModelonf.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbModelonf.SetCodmodelo(const Value: TCmDbField);
begin
  FCodmodelo := Value;
end;

procedure TDbModelonf.SetDescmodelonf(const Value: TCmDbField);
begin
  FDescmodelonf := Value;
end;

procedure TDbModelonf.SetNumsintegra(const Value: TCmDbField);
begin
  FNumsintegra := Value;
end;

procedure TDbModelonf.SetSigla(const Value: TCmDbField);
begin
  FSigla := Value;
end;

end.




