{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbProprietariouh;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbProprietariouh = class(TCmDbObject)

  private
    FTrguserinclusao: TCmDbField;
    FIdproprietariouh: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdidioma: TCmDbField;
    procedure SetIdidioma(const Value: TCmDbField);
    procedure SetIdproprietariouh(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Idproprietariouh: TCmDbField read FIdproprietariouh write SetIdproprietariouh;
     Property Ididioma: TCmDbField read FIdidioma write SetIdidioma;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbProprietariouh }

constructor TDbProprietariouh.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PROPRIETARIOUH';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fIdproprietariouh := CreateCmDbField('IDPROPRIETARIOUH',ftfloat,True,True,False,True,'');
   fIdidioma := CreateCmDbField('IDIDIOMA',ftfloat,False,False,False,True,'');
end;

function TDbProprietariouh.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbProprietariouh.SetIdidioma(const Value: TCmDbField);
begin
  FIdidioma := Value;
end;

procedure TDbProprietariouh.SetIdproprietariouh(const Value: TCmDbField);
begin
  FIdproprietariouh := Value;
end;

procedure TDbProprietariouh.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbProprietariouh.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



