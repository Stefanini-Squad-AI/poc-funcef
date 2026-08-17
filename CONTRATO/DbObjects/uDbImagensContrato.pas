{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio Beraldo da Silva        }
{ Atualizado Em: 27/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbImagensContrato;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbImagensContrato = class(TCmDbObject)

  private
    FIdcontrato: TCmDbField;
    FExtensao: TCmDbField;
    FPagina: TCmDbField;
    FIdimagem: TCmDbField;
    FFlgTipo: TCmDbField;
    FNomeArquivo: TCmDbField;
    procedure SetFlgTipo(const Value: TCmDbField);
    procedure SetNomeArquivo(const Value: TCmDbField);
    procedure SetExtensao(const Value: TCmDbField);
  public
     Property Pagina: TCmDbField read FPagina write FPagina;
     Property Idimagem: TCmDbField read FIdimagem write FIdimagem;
     Property Idcontrato: TCmDbField read FIdcontrato write FIdcontrato;
     Property Extensao: TCmDbField read FExtensao write SetExtensao;
     Property FlgTipo: TCmDbField read FFlgTipo write SetFlgTipo;
     Property NomeArquivo: TCmDbField read FNomeArquivo write SetNomeArquivo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbImagensContrato }

constructor TDbImagensContrato.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'IMAGENSCONTRATO';

   fPagina := CreateCmDbField('PAGINA',ftfloat,False,False,False,True,'');
   fIdimagem := CreateCmDbField('IDIMAGEM',ftfloat,True,True,False,True,'');
   fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,False,False,False,True,'');
   fExtensao := CreateCmDbField('EXTENSAO',ftString,False,False,False,True,'');
   fFlgTipo := CreateCmDbField('FLGTIPO',ftString,False,False,False,True,'');  // tavares
   fNomeArquivo := CreateCmDbField('NOMEARQUIVO',ftString,False,False,False,True,''); // tavares
end;

function TDbImagensContrato.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDbImagensContrato.SetExtensao(const Value: TCmDbField);
begin
  FExtensao := Value;
end;

procedure TDbImagensContrato.SetFlgTipo(const Value: TCmDbField);
begin
  FFlgTipo := Value;
end;

procedure TDbImagensContrato.SetNomeArquivo(const Value: TCmDbField);
begin
  FNomeArquivo := Value;
end;

end.



