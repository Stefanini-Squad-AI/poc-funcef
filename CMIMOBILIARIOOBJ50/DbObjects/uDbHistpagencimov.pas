{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/12/2010                             }
{                                                       }
{*******************************************************}

unit uDbHistpagencimov;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistpagencimov = class(TCmDbObject)

  private
    FAno: TCmDbField;
    FIdimovel: TCmDbField;
    FIdsituacao: TCmDbField;
    FIdencargo: TCmDbField;
    procedure SetAno(const Value: TCmDbField);
    procedure SetIdencargo(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdsituacao(const Value: TCmDbField);

  public

     Property Idsituacao: TCmDbField read FIdsituacao write SetIdsituacao;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idencargo: TCmDbField read FIdencargo write SetIdencargo;
     Property Ano: TCmDbField read FAno write SetAno;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistpagencimov }

constructor TDbHistpagencimov.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTPAGENCIMOV';

   fIdsituacao := CreateCmDbField('IDSITUACAO',ftfloat,True,False,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,True,True,False,True,'');
   fIdencargo := CreateCmDbField('IDENCARGO',ftfloat,True,True,False,True,'');
   fAno := CreateCmDbField('ANO',ftfloat,True,True,False,True,'');
end;

function TDbHistpagencimov.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbHistpagencimov.SetAno(const Value: TCmDbField);
begin
  FAno := Value;
end;

procedure TDbHistpagencimov.SetIdencargo(const Value: TCmDbField);
begin
  FIdencargo := Value;
end;

procedure TDbHistpagencimov.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbHistpagencimov.SetIdsituacao(const Value: TCmDbField);
begin
  FIdsituacao := Value;
end;

end.



