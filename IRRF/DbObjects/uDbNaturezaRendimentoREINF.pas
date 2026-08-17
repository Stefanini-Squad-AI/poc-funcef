{*******************************************************}
{                                                       }
{ FUNCEF                                                }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "Bussines Object Builder"                 }
{ Analista Responsável: Cássio Florencio Rovaroto       }
{ Atualizado Em: 03/11/2022                             }
{                                                       }
{*******************************************************}

unit uDbNaturezaRendimentoREINF;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbNaturezaRendimentoREINF = class(TCmDbObject)
  private
    FCodgruponatureza: TCmDbField;
    FDescricao: TCmDbField;
    FTipodeclarante: TCmDbField;
    FIndnatureza13: TCmDbField;
    FIndnaturezarra: TCmDbField;
    FCodnaturezareinf: TCmDbField;
    FTributacaoexterior: TCmDbField;
    FCoddirf: TCmDbField;
    FTitulo: TCmDbField;
    procedure SetCoddirf(const Value: TCmDbField);
    procedure SetCodgruponatureza(const Value: TCmDbField);
    procedure SetCodnaturezareinf(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIndnatureza13(const Value: TCmDbField);
    procedure SetIndnaturezarra(const Value: TCmDbField);
    procedure SetTipodeclarante(const Value: TCmDbField);
    procedure SetTitulo(const Value: TCmDbField);
    procedure SetTributacaoexterior(const Value: TCmDbField);
  public
     Property Tributacaoexterior: TCmDbField read FTributacaoexterior write SetTributacaoexterior;
     Property Titulo: TCmDbField read FTitulo write SetTitulo;
     Property Tipodeclarante: TCmDbField read FTipodeclarante write SetTipodeclarante;
     Property Indnaturezarra: TCmDbField read FIndnaturezarra write SetIndnaturezarra;
     Property Indnatureza13: TCmDbField read FIndnatureza13 write SetIndnatureza13;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Codnaturezareinf: TCmDbField read FCodnaturezareinf write SetCodnaturezareinf;
     Property Codgruponatureza: TCmDbField read FCodgruponatureza write SetCodgruponatureza;
     Property Coddirf: TCmDbField read FCoddirf write SetCoddirf;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
     Function Delete :Boolean; Override;
     Function Update :Boolean; Override;
  End;

implementation

{ TDbNaturezaRendimentoREINF }

constructor TDbNaturezaRendimentoREINF.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'NATUREZA_RENDIMENTO_REINF';

   fCodnaturezareinf := CreateCmDbField('CODNATUREZAREINF',ftfloat,True,True,False,True,'');
   fCodgruponatureza := CreateCmDbField('CODGRUPONATUREZA',ftfloat,False,False,False,True,'');
   fTitulo := CreateCmDbField('TITULO',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fTributacaoexterior := CreateCmDbField('TRIBUTACAOEXTERIOR',ftString,False,False,False,True,'');
   fTipodeclarante := CreateCmDbField('TIPODECLARANTE',ftString,False,False,False,True,'');
   fIndnaturezarra := CreateCmDbField('INDNATUREZARRA',ftString,False,False,False,True,'');
   fIndnatureza13 := CreateCmDbField('INDNATUREZA13',ftString,False,False,False,True,'');          
   fCoddirf := CreateCmDbField('CODDIRF',ftString,False,False,False,True,'');
end;

function TDbNaturezaRendimentoREINF.Delete: Boolean;
begin
  Result := Inherited Delete;
end;

function TDbNaturezaRendimentoREINF.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


function TDbNaturezaRendimentoREINF.LoadFromDb: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbNaturezaRendimentoREINF.SetCoddirf(const Value: TCmDbField);
begin
  FCoddirf := Value;
end;

procedure TDbNaturezaRendimentoREINF.SetCodgruponatureza(
  const Value: TCmDbField);
begin
  FCodgruponatureza := Value;
end;

procedure TDbNaturezaRendimentoREINF.SetCodnaturezareinf(
  const Value: TCmDbField);
begin
  FCodnaturezareinf := Value;
end;

procedure TDbNaturezaRendimentoREINF.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbNaturezaRendimentoREINF.SetIndnatureza13(
  const Value: TCmDbField);
begin
  FIndnatureza13 := Value;
end;

procedure TDbNaturezaRendimentoREINF.SetIndnaturezarra(
  const Value: TCmDbField);
begin
  FIndnaturezarra := Value;
end;

procedure TDbNaturezaRendimentoREINF.SetTipodeclarante(
  const Value: TCmDbField);
begin
  FTipodeclarante := Value;
end;

procedure TDbNaturezaRendimentoREINF.SetTitulo(const Value: TCmDbField);
begin
  FTitulo := Value;
end;

procedure TDbNaturezaRendimentoREINF.SetTributacaoexterior(
  const Value: TCmDbField);
begin
  FTributacaoexterior := Value;
end;

function TDbNaturezaRendimentoREINF.Update: Boolean;
begin
  Result := Inherited Update;
end;

end.



