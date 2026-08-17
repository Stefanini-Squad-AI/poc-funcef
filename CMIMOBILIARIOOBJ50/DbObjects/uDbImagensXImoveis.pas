{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcio Motta                    }
{ Atualizado Em: 05/05/2004                             }
{                                                       }
{*******************************************************}

unit uDbImagensXImoveis;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbImagensXImoveis = class(TCmDbObject)

  private
    FIdImovel: TCmDbField;
    FIdImagem: TCmDbField;
    procedure SetIdImagem(const Value: TCmDbField);
    procedure SetIdImovel(const Value: TCmDbField);

  public
    Property Idimovel: TCmDbField read FIdImovel write SetIdImovel;
    Property Idimagem: TCmDbField read FIdImagem write SetIdImagem;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbImagensXImoveis }

constructor TDbImagensXImoveis.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;
  _UpdateKeyFields      := True;
  
  TableName := 'IMAGENSXIMOVEIS';

  fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,True,True,False,True,'ID Imovel');
  fIdimagem := CreateCmDbField('IDIMAGEM',ftfloat,True,True,False,True,'ID Imagem');
end;


function TDbImagensXImoveis.Insert: Boolean;
begin
  Result := Inherited Insert;
end;


procedure TDbImagensXImoveis.SetIdImagem(const Value: TCmDbField);
begin
  FIdImagem := Value;
end;

procedure TDbImagensXImoveis.SetIdImovel(const Value: TCmDbField);
begin
  FIdImovel := Value;
end;


end.



