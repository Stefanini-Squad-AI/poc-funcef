{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 30/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrupoxImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbGrupoxImovel = class(TCmDbObject)

  private
    FIdgruporateio: TCmDbField;
    FIdimovel: TCmDbField;
    FGxipercentrateio: TCmDbField;
    procedure SetGxipercentrateio(const Value: TCmDbField);
    procedure SetIdgruporateio(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);

  public

     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idgruporateio: TCmDbField read FIdgruporateio write SetIdgruporateio;
     Property Gxipercentrateio: TCmDbField read FGxipercentrateio write SetGxipercentrateio;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbGrupoxImovel }

constructor TDbGrupoxImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPOXIMOVEL';

   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,True,True,False,True,'ID do Imóvel');
   fIdgruporateio := CreateCmDbField('IDGRUPORATEIO',ftfloat,True,True,False,True,'ID do Grupo de Rateio');
   fGxipercentrateio := CreateCmDbField('GXIPERCENTRATEIO',ftfloat,False,False,False,True,'Percentual de Rateio');
end;

function TDbGrupoxImovel.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbGrupoxImovel.SetGxipercentrateio(const Value: TCmDbField);
begin
  FGxipercentrateio := Value;
end;

procedure TDbGrupoxImovel.SetIdgruporateio(const Value: TCmDbField);
begin
  FIdgruporateio := Value;
end;

procedure TDbGrupoxImovel.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

end.



