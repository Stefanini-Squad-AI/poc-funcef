{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Leandro Pocebon                 }
{ Atualizado Em: 15/11/2022                             }
{                                                       }
{*******************************************************}

unit uDbImagensBem;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbImagensBem = class(TCmDbObject)

  private
    FIdbem: TCmDbField;
    FIdimagem: TCmDbField;
    FNomeArquivo: TCmDbField;
    procedure SetNomeArquivo(const Value: TCmDbField);
  public
     Property Idimagem: TCmDbField read FIdimagem write FIdimagem;
     Property Idbem: TCmDbField read FIdbem write FIdbem;
     Property NomeArquivo: TCmDbField read FNomeArquivo write SetNomeArquivo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbImagensContrato }

constructor TDbImagensBem.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'IMAGENSBEM';

   fIdimagem := CreateCmDbField('IDIMAGEM',ftfloat,True,True,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,False,False,False,True,'');
   fNomeArquivo := CreateCmDbField('NOMEARQUIVO',ftString,False,False,False,True,'');
end;

function TDbImagensBem.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDbImagensBem.SetNomeArquivo(const Value: TCmDbField);
begin
  FNomeArquivo := Value;
end;

end.



