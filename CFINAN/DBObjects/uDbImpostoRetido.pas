{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 21/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbImpostoRetido;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbImpostoRetido = class(TCmDbObject)

  private
    FCodtipocustagreg: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdforcli: TCmDbField;
    FNumlote: TCmDbField;
    FCodlancfinanc: TCmDbField;
    FVlrretido: TCmDbField;
    FCoddocumento: TCmDbField;
    FDataretencao: TCmDbField;
    FCoddoclancado: TCmDbField;
    FVlrbase: TCmDbField;
    FNumlotemanual: TCmDbField;
    FNumlancto: TCmDbField;
    FRecpag: TCmDbField;
    FNumlanctoorigem: TCmDbField;
    FIdimpostoretido: TCmDbField;

  public

     Property Vlrretido: TCmDbField read FVlrretido write FVlrretido;
     Property Vlrbase: TCmDbField read FVlrbase write FVlrbase;
     Property Recpag: TCmDbField read FRecpag write FRecpag;
     Property Numlotemanual: TCmDbField read FNumlotemanual write FNumlotemanual;
     Property Numlote: TCmDbField read FNumlote write FNumlote;
     Property Numlanctoorigem: TCmDbField read FNumlanctoorigem write FNumlanctoorigem;
     Property Numlancto: TCmDbField read FNumlancto write FNumlancto;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idimpostoretido: TCmDbField read FIdimpostoretido write FIdimpostoretido;
     Property Idforcli: TCmDbField read FIdforcli write FIdforcli;
     Property Dataretencao: TCmDbField read FDataretencao write FDataretencao;
     Property Codtipocustagreg: TCmDbField read FCodtipocustagreg write FCodtipocustagreg;
     Property Codlancfinanc: TCmDbField read FCodlancfinanc write FCodlancfinanc;
     Property Coddocumento: TCmDbField read FCoddocumento write FCoddocumento;
     Property Coddoclancado: TCmDbField read FCoddoclancado write FCoddoclancado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbImpostoRetido }

constructor TDbImpostoRetido.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'IMPOSTORETIDO';

   fVlrretido := CreateCmDbField('VLRRETIDO',ftfloat,False,False,False,True,'');
   fVlrbase := CreateCmDbField('VLRBASE',ftfloat,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fNumlotemanual := CreateCmDbField('NUMLOTEMANUAL',ftfloat,False,False,False,True,'');
   fNumlote := CreateCmDbField('NUMLOTE',ftfloat,False,False,False,True,'');
   fNumlanctoorigem := CreateCmDbField('NUMLANCTOORIGEM',ftfloat,False,False,False,True,'');
   fNumlancto := CreateCmDbField('NUMLANCTO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdimpostoretido := CreateCmDbField('IDIMPOSTORETIDO',ftfloat,True,True,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
   fDataretencao := CreateCmDbField('DATARETENCAO',ftDateTime,False,False,False,True,'');
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,False,False,False,True,'');
   fCodlancfinanc := CreateCmDbField('CODLANCFINANC',ftfloat,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
   fCoddoclancado := CreateCmDbField('CODDOCLANCADO',ftfloat,False,False,False,True,'');
end;

function TDbImpostoRetido.Insert: Boolean;
begin
   fIdimpostoretido.AsFloat := GetSequence('IMPOSTORETIDO');
   Result := Inherited Insert;
end;

end.



