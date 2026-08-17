{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbResponsavel;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbResponsavel = class(TCmDbObject)

  private
    FFlgtpresponsavel: TCmDbField;
    FFlgadmprev: TCmDbField;
    FIdresponsavel: TCmDbField;
    FFlgativofixo: TCmDbField;
    FFlgcontrato: TCmDbField;
    FFlgimobiliario: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FFlgprojeto: TCmDbField;
    FTrguserinclusao: TCmDbField;
    procedure SetFlgadmprev(const Value: TCmDbField);
    procedure SetFlgativofixo(const Value: TCmDbField);
    procedure SetFlgcontrato(const Value: TCmDbField);
    procedure SetFlgimobiliario(const Value: TCmDbField);
    procedure SetFlgprojeto(const Value: TCmDbField);
    procedure SetFlgtpresponsavel(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Flgtpresponsavel: TCmDbField read FFlgtpresponsavel write SetFlgtpresponsavel;
     Property Flgprojeto: TCmDbField read FFlgprojeto write SetFlgprojeto;
     Property Flgimobiliario: TCmDbField read FFlgimobiliario write SetFlgimobiliario;
     Property Flgcontrato: TCmDbField read FFlgcontrato write SetFlgcontrato;
     Property Flgativofixo: TCmDbField read FFlgativofixo write SetFlgativofixo;
     Property Flgadmprev: TCmDbField read FFlgadmprev write SetFlgadmprev;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbResponsavel }

constructor TDbResponsavel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESPONSAVEL';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,True,True,False,True,'');
   fFlgtpresponsavel := CreateCmDbField('FLGTPRESPONSAVEL',ftfloat,False,False,False,False,'');
   fFlgprojeto := CreateCmDbField('FLGPROJETO',ftfloat,False,False,False,False,'');
   fFlgimobiliario := CreateCmDbField('FLGIMOBILIARIO',ftfloat,False,False,False,False,'');
   fFlgcontrato := CreateCmDbField('FLGCONTRATO',ftfloat,False,False,False,False,'');
   fFlgativofixo := CreateCmDbField('FLGATIVOFIXO',ftfloat,False,False,False,False,'');
   fFlgadmprev := CreateCmDbField('FLGADMPREV',ftfloat,False,False,False,False,'');
end;

function TDbResponsavel.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbResponsavel.SetFlgadmprev(const Value: TCmDbField);
begin
  FFlgadmprev := Value;
end;

procedure TDbResponsavel.SetFlgativofixo(const Value: TCmDbField);
begin
  FFlgativofixo := Value;
end;

procedure TDbResponsavel.SetFlgcontrato(const Value: TCmDbField);
begin
  FFlgcontrato := Value;
end;

procedure TDbResponsavel.SetFlgimobiliario(const Value: TCmDbField);
begin
  FFlgimobiliario := Value;
end;

procedure TDbResponsavel.SetFlgprojeto(const Value: TCmDbField);
begin
  FFlgprojeto := Value;
end;

procedure TDbResponsavel.SetFlgtpresponsavel(const Value: TCmDbField);
begin
  FFlgtpresponsavel := Value;
end;

procedure TDbResponsavel.SetIdresponsavel(const Value: TCmDbField);
begin
  FIdresponsavel := Value;
end;

procedure TDbResponsavel.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbResponsavel.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



