{*******************************************************}
{                                                       }
{ Softtek do Brasil                                     }
{ Analista Responsável: Thaise Amaral Martins           }
{                                                       }
{*******************************************************}

unit uDbNaturezacontr;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbNaturezacontr = class(TCmDbObject)

  private
    FIdnatureza: TCmDbField;
    FFlgativo: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetIdnatureza(const Value: TCmDbField);
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
  public
    Property Idnatureza: TCmDbField read FIdNatureza write SetIdNatureza;
    Property Flgativo: TCmDbField read FFlgativo write SetFlgAtivo;
    Property Descricao: TCmDbField read FDescricao write SetDescricao;
    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbNaturezacontr }

constructor TDbNaturezacontr.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'NATUREZACONTR';

  fIdnatureza := CreateCmDbField('IDNATUREZA',ftfloat,True,True,False,True,'');
  fFlgativo   := CreateCmDbField('FLGATIVO',ftString,False,False,False,True,'');
  fDescricao  := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbNaturezacontr.Insert: Boolean;
begin

   fIdnatureza.AsFloat := GetSequence('NATUREZACONTR');
   Result := Inherited Insert;

end;


procedure TDbNaturezacontr.SetDescricao(const Value: TCmDbField);
begin
  FDescricao:= Value;
end;

procedure TDbNaturezacontr.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo:= Value;
end;

procedure TDbNaturezacontr.SetIdnatureza(const Value: TCmDbField);
begin
  FIdnatureza:= Value;
end;

end.



