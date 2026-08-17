{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbRegra;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbRegra = class(TCmDbObject)

  private
    FDescricaoregra: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FIdtiporegra: TCmDbField;
    FIdregra: TCmDbField;
    FPublicada: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FNomeregra: TCmDbField;
    procedure SetDescricaoregra(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetIdtiporegra(const Value: TCmDbField);
    procedure SetNomeregra(const Value: TCmDbField);
    procedure SetPublicada(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Publicada: TCmDbField read FPublicada write SetPublicada;
     Property Nomeregra: TCmDbField read FNomeregra write SetNomeregra;
     Property Idtiporegra: TCmDbField read FIdtiporegra write SetIdtiporegra;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Descricaoregra: TCmDbField read FDescricaoregra write SetDescricaoregra;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRegra }

constructor TDbRegra.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REGRA';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fPublicada := CreateCmDbField('PUBLICADA',ftfloat,False,False,False,True,'');
   fNomeregra := CreateCmDbField('NOMEREGRA',ftString,False,False,False,True,'');
   fIdtiporegra := CreateCmDbField('IDTIPOREGRA',ftfloat,True,False,False,True,'');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,True,True,False,True,'');
   fDescricaoregra := CreateCmDbField('DESCRICAOREGRA',ftString,False,False,False,True,'');
end;

function TDbRegra.Insert: Boolean;
begin

   fIdregra.AsFloat := GetSequence('REGRA');
   Result := Inherited Insert;

end;


procedure TDbRegra.SetDescricaoregra(const Value: TCmDbField);
begin
  FDescricaoregra := Value;
end;

procedure TDbRegra.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbRegra.SetIdtiporegra(const Value: TCmDbField);
begin
  FIdtiporegra := Value;
end;

procedure TDbRegra.SetNomeregra(const Value: TCmDbField);
begin
  FNomeregra := Value;
end;

procedure TDbRegra.SetPublicada(const Value: TCmDbField);
begin
  FPublicada := Value;
end;

procedure TDbRegra.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbRegra.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



