{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/08/2006                             }
{                                                       }
{*******************************************************}

unit uDbCptipomovim;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCptipomovim = class(TCmDbObject)

  private
    FNome: TCmDbField;
    FIdcptipomovim: TCmDbField;
    FDescricao: TCmDbField;
    FFlgentsai: TCmDbField;
    FFlgtpmovim: TCmDbField;
    FNomepararegra: TCmDbField;
    FTipounidade: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgtpmovim(const Value: TCmDbField);
    procedure SetFlgentsai(const Value: TCmDbField);
    procedure SetIdcptipomovim(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetNomepararegra(const Value: TCmDbField);
    procedure SetTipounidade(const Value: TCmDbField);

  public

     Property Nome: TCmDbField read FNome write SetNome;
     Property Idcptipomovim: TCmDbField read FIdcptipomovim write SetIdcptipomovim;
     Property Flgentsai: TCmDbField read FFlgentsai write SetFlgentsai;
     Property Flgtpmovim: TCmDbField read FFlgtpmovim write SetFlgtpmovim;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Nomepararegra: TCmDbField read FNomepararegra write SetNomepararegra;
     Property Tipounidade: TCmDbField read FTipounidade write SetTipounidade;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCptipomovim }

constructor TDbCptipomovim.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPTIPOMOVIM';

   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fIdcptipomovim := CreateCmDbField('IDCPTIPOMOVIM',ftfloat,True,True,False,True,'');
   fFlgentsai := CreateCmDbField('FLGENTSAI',ftString,False,False,False,True,'');
   fFlgtpmovim := CreateCmDbField('FLGTPMOVIM',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fNomepararegra := CreateCmDbField('NOMEPARAREGRA',ftString,False,False,False,True,'');
   fTipounidade := CreateCmDbField('TIPOUNIDADE',ftString,True,False,False,True,'');
end;

function TDbCptipomovim.Insert: Boolean;
begin

   FIdcptipomovim.AsFloat := GetSequence('CPTIPOMOVIM');
   Result := Inherited Insert;

end;


procedure TDbCptipomovim.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbCptipomovim.SetFlgtpmovim(const Value: TCmDbField);
begin
  FFlgtpmovim := Value;
end;

procedure TDbCptipomovim.SetFlgentsai(const Value: TCmDbField);
begin
  FFlgentsai := Value;
end;

procedure TDbCptipomovim.SetIdcptipomovim(const Value: TCmDbField);
begin
  FIdcptipomovim := Value;
end;

procedure TDbCptipomovim.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbCptipomovim.SetNomepararegra(const Value: TCmDbField);
begin
  FNomepararegra := Value;
end;

procedure TDbCptipomovim.SetTipounidade(const Value: TCmDbField);
begin
  FTipounidade := Value;
end;

end.



