{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcio Motta                    }
{ Atualizado Em: 28/06/2004                             }
{                                                       }
{*******************************************************}

unit uDbImovelxprop;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbImovelxprop = class(TCmDbObject)

  private
    FIdImovel: TCmDbField;
    FidProprietarioUh: TCmDbField;
    FPercentual: TCmDbField;
    procedure SetIdImovel(const Value: TCmDbField);
    procedure SetIdProprietarioUh(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);

  public
    Property Idimovel         : TCmDbField read FIdImovel write SetIdImovel;
    Property Idproprietariouh : TCmDbField read FidProprietarioUh write SetIdProprietarioUh;
    Property Percentual       : TCmDbField read FPercentual write SetPercentual;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbImovelxprop }

constructor TDbImovelxprop.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'IMOVELXPROP';

  fIdimovel         := CreateCmDbField('IDIMOVEL',ftfloat,True,True,False,True,'IMÓVEL MESTRE');
  fIdproprietariouh := CreateCmDbField('IDPROPRIETARIOUH',ftfloat,True,True,False,True,'PROPRIETÁRIO');
  fPercentual       := CreateCmDbField('PERCENTUAL',ftfloat,False,False,False,True,'PERCENTUAL DE PARTICIPAÇÃO');
end;

function TDbImovelxprop.Insert: Boolean;
begin
  Result := Inherited Insert;
end;


procedure TDbImovelxprop.SetIdImovel(const Value: TCmDbField);
begin
  FIdImovel := Value;
end;

procedure TDbImovelxprop.SetIdProprietarioUh(const Value: TCmDbField);
begin
  FidProprietarioUh := Value;
end;

procedure TDbImovelxprop.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

end.



