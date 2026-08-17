{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/04/2003                             }
{                                                       }
{*******************************************************}

unit uDbParcelaMedicao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParcelaMedicao = class(TCmDbObject)

  private
    FValorprevisto: TCmDbField;
    FIdmedicao: TCmDbField;
    FCoddocumento: TCmDbField;
    FDataprevistavenc: TCmDbField;
    FIdparcelamedicao: TCmDbField;
    FIdpessoa: TCmDbField;
    FNumRad: TCmDbField;
  public
     Property Valorprevisto: TCmDbField read FValorprevisto write FValorprevisto;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idparcelamedicao: TCmDbField read FIdparcelamedicao write FIdparcelamedicao;
     Property Idmedicao: TCmDbField read FIdmedicao write FIdmedicao;
     Property Dataprevistavenc: TCmDbField read FDataprevistavenc write FDataprevistavenc;
     Property Coddocumento: TCmDbField read FCoddocumento write FCoddocumento;
     property NumRad :TCmDbField read FNumRad write FNumRad;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParcelaMedicao }

constructor TDbParcelaMedicao.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'PARCELAMEDICAO';

   fValorprevisto := CreateCmDbField('VALORPREVISTO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdparcelamedicao := CreateCmDbField('IDPARCELAMEDICAO',ftfloat,True,True,False,True,'');
   fIdmedicao := CreateCmDbField('IDMEDICAO',ftfloat,True,True,False,True,'');
   fDataprevistavenc := CreateCmDbField('DATAPREVISTAVENC',ftDateTime,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
   fNumRad := CreateCmDbField('NUMRAD',ftfloat,False,False,False,True,'');
end;

function TDbParcelaMedicao.Insert: Boolean;
begin
   fIdparcelamedicao.AsFloat := GetSequence('PARCELAMEDICAO');
   Result := Inherited Insert;
end;

end.



