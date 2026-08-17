{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/03/2008                             }
{                                                       }
{*******************************************************}

unit uDbEmissbancaria;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEmissbancaria = class(TCmDbObject)

  private
    FDataemissao: TCmDbField;
    FIdmodulo: TCmDbField;
    FValor: TCmDbField;
    FQtddocs: TCmDbField;
    FNumlote: TCmDbField;
    FIdemissbancaria: TCmDbField;
    FNomearq: TCmDbField;
    FIdimagem: TCmDbField;
    procedure SetDataemissao(const Value: TCmDbField);
    procedure SetIdemissbancaria(const Value: TCmDbField);
    procedure SetIdimagem(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetNomearq(const Value: TCmDbField);
    procedure SetNumlote(const Value: TCmDbField);
    procedure SetQtddocs(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Qtddocs: TCmDbField read FQtddocs write SetQtddocs;
     Property Numlote: TCmDbField read FNumlote write SetNumlote;
     Property Nomearq: TCmDbField read FNomearq write SetNomearq;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idimagem: TCmDbField read FIdimagem write SetIdimagem;
     Property Idemissbancaria: TCmDbField read FIdemissbancaria write SetIdemissbancaria;
     Property Dataemissao: TCmDbField read FDataemissao write SetDataemissao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEmissbancaria }

constructor TDbEmissbancaria.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'EMISSBANCARIA';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   fQtddocs := CreateCmDbField('QTDDOCS',ftfloat,False,False,False,True,'');
   fNumlote := CreateCmDbField('NUMLOTE',ftfloat,False,False,False,True,'');
   fNomearq := CreateCmDbField('NOMEARQ',ftString,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdimagem := CreateCmDbField('IDIMAGEM',ftfloat,False,False,False,True,'');
   fIdemissbancaria := CreateCmDbField('IDEMISSBANCARIA',ftfloat,True,True,False,True,'');
   fDataemissao := CreateCmDbField('DATAEMISSAO',ftDateTime,False,False,False,True,'');
end;

function TDbEmissbancaria.Insert: Boolean;
begin

   fIdemissbancaria.AsFloat := GetSequence('EMISSBANCARIA');
   Result := Inherited Insert;

end;


procedure TDbEmissbancaria.SetDataemissao(const Value: TCmDbField);
begin
  FDataemissao := Value;
end;

procedure TDbEmissbancaria.SetIdemissbancaria(const Value: TCmDbField);
begin
  FIdemissbancaria := Value;
end;

procedure TDbEmissbancaria.SetIdimagem(const Value: TCmDbField);
begin
  FIdimagem := Value;
end;

procedure TDbEmissbancaria.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbEmissbancaria.SetNomearq(const Value: TCmDbField);
begin
  FNomearq := Value;
end;

procedure TDbEmissbancaria.SetNumlote(const Value: TCmDbField);
begin
  FNumlote := Value;
end;

procedure TDbEmissbancaria.SetQtddocs(const Value: TCmDbField);
begin
  FQtddocs := Value;
end;

procedure TDbEmissbancaria.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



