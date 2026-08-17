{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadtipoetapa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadtipoetapa = class(TCmDbObject)

  private
    FFlgautorizacao: TCmDbField;
    FFlgautomatica: TCmDbField;
    FNome: TCmDbField;
    FIdtipoetapa: TCmDbField;
    FFlgretoretapa: TCmDbField;
    FDescricao: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgautomatica(const Value: TCmDbField);
    procedure SetFlgautorizacao(const Value: TCmDbField);
    procedure SetFlgretoretapa(const Value: TCmDbField);
    procedure SetIdtipoetapa(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);

  public

     Property Nome: TCmDbField read FNome write SetNome;
     Property Idtipoetapa: TCmDbField read FIdtipoetapa write SetIdtipoetapa;
     Property Flgretoretapa: TCmDbField read FFlgretoretapa write SetFlgretoretapa;
     Property Flgautorizacao: TCmDbField read FFlgautorizacao write SetFlgautorizacao;
     Property Flgautomatica: TCmDbField read FFlgautomatica write SetFlgautomatica;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadtipoetapa }

constructor TDbRadtipoetapa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADTIPOETAPA';

   fNome           := CreateCmDbField('NOME',ftString,True,False,False,True,'');
   fIdtipoetapa    := CreateCmDbField('IDTIPOETAPA',ftfloat,True,True,False,True,'');
   fFlgretoretapa  := CreateCmDbField('FLGRETORETAPA',ftString,False,False,False,True,'');
   fFlgautorizacao := CreateCmDbField('FLGAUTORIZACAO',ftString,False,False,False,True,'');
   fFlgautomatica  := CreateCmDbField('FLGAUTOMATICA',ftString,False,False,False,True,'');
   fDescricao      := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
end;

function TDbRadtipoetapa.Insert: Boolean;
begin

   fIdtipoetapa.AsFloat := GetSequence('RADTIPOETAPA');
   Result := Inherited Insert;

end;


procedure TDbRadtipoetapa.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbRadtipoetapa.SetFlgautomatica(const Value: TCmDbField);
begin
  FFlgautomatica := Value;
end;

procedure TDbRadtipoetapa.SetFlgautorizacao(const Value: TCmDbField);
begin
  FFlgautorizacao := Value;
end;

procedure TDbRadtipoetapa.SetFlgretoretapa(const Value: TCmDbField);
begin
  FFlgretoretapa := Value;
end;

procedure TDbRadtipoetapa.SetIdtipoetapa(const Value: TCmDbField);
begin
  FIdtipoetapa := Value;
end;

procedure TDbRadtipoetapa.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

end.



