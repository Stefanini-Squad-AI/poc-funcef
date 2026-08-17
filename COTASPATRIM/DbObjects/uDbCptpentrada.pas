{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/08/2006                             }
{                                                       }
{*******************************************************}

unit uDbCptpentrada;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCptpentrada = class(TCmDbObject)

  private
    FNome: TCmDbField;
    FDescricao: TCmDbField;
    FIdcptpentrada: TCmDbField;
    FTipounidade: TCmDbField;
    FNomepararegra: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdcptpentrada(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetTipounidade(const Value: TCmDbField);
    procedure SetNomepararegra(const Value: TCmDbField);

  public

     Property Tipounidade: TCmDbField read FTipounidade write SetTipounidade;
     Property Nome: TCmDbField read FNome write SetNome;
     Property Idcptpentrada: TCmDbField read FIdcptpentrada write SetIdcptpentrada;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Nomepararegra: TCmDbField read FNomepararegra write SetNomepararegra;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCptpentrada }

constructor TDbCptpentrada.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPTPENTRADA';

   fTipounidade := CreateCmDbField('TIPOUNIDADE',ftString,False,False,False,True,'');
   fNome := CreateCmDbField('NOME',ftString,True,False,False,True,'Nome');
   fIdcptpentrada := CreateCmDbField('IDCPTPENTRADA',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fNomepararegra := CreateCmDbField('NOMEPARAREGRA',ftString,True,False,False,True,'');
end;

function TDbCptpentrada.Insert: Boolean;
begin

   FIdcptpentrada.AsFloat := GetSequence('CPTPENTRADA');
   Result := Inherited Insert;

end;


procedure TDbCptpentrada.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbCptpentrada.SetIdcptpentrada(const Value: TCmDbField);
begin
  FIdcptpentrada := Value;
end;

procedure TDbCptpentrada.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

procedure TDbCptpentrada.SetNomepararegra(const Value: TCmDbField);
begin
  FNomepararegra := Value;
end;

procedure TDbCptpentrada.SetTipounidade(const Value: TCmDbField);
begin
  FTipounidade := Value;
end;

end.



