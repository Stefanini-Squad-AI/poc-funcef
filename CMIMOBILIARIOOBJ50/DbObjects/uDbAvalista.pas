{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbAvalista;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbAvalista = class(TCmDbObject)

  private
    FIdavalista: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    procedure SetIdavalista(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Idavalista: TCmDbField read FIdavalista write SetIdavalista;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbAvalista }

constructor TDbAvalista.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AVALISTA';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fIdavalista := CreateCmDbField('IDAVALISTA',ftfloat,False,True,False,True,'');
end;

function TDbAvalista.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDbAvalista.SetIdavalista(const Value: TCmDbField);
begin
  FIdavalista := Value;
end;

procedure TDbAvalista.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbAvalista.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



