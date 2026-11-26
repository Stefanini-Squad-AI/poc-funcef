{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbRecbtopagto;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbRecbtopagto = class(TCmDbObject)

  private
    FCodlancnaoident: TCmDbField;
    FDatabaixa: TCmDbField;
    FCoddocumento: TCmDbField;
    FDatacfloat: TCmDbField;
    FNumchqbordero: TCmDbField;
    FNumlancto: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FCodlancfinanc: TCmDbField;
    FNumlote: TCmDbField;
    FCodportforma: TCmDbField;
    FNumbaixa: TCmDbField;
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodlancfinanc(const Value: TCmDbField);
    procedure SetCodlancnaoident(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetDatabaixa(const Value: TCmDbField);
    procedure SetDatacfloat(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetNumbaixa(const Value: TCmDbField);
    procedure SetNumchqbordero(const Value: TCmDbField);
    procedure SetNumlancto(const Value: TCmDbField);
    procedure SetNumlote(const Value: TCmDbField);

  public

     Property Numlote: TCmDbField read FNumlote write SetNumlote;
     Property Numlancto: TCmDbField read FNumlancto write SetNumlancto;
     Property Numchqbordero: TCmDbField read FNumchqbordero write SetNumchqbordero;
     Property Numbaixa: TCmDbField read FNumbaixa write SetNumbaixa;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Datacfloat: TCmDbField read FDatacfloat write SetDatacfloat;
     Property Databaixa: TCmDbField read FDatabaixa write SetDatabaixa;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codlancnaoident: TCmDbField read FCodlancnaoident write SetCodlancnaoident;
     Property Codlancfinanc: TCmDbField read FCodlancfinanc write SetCodlancfinanc;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRecbtopagto }

constructor TDbRecbtopagto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RECBTOPAGTO';

   fNumlote := CreateCmDbField('NUMLOTE',ftfloat,False,False,False,True,'');
   fNumlancto := CreateCmDbField('NUMLANCTO',ftfloat,True,True,False,True,'');
   fNumchqbordero := CreateCmDbField('NUMCHQBORDERO',ftString,False,False,False,True,'');
   fNumbaixa := CreateCmDbField('NUMBAIXA',ftfloat,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
   fDatacfloat := CreateCmDbField('DATACFLOAT',ftDateTime,False,False,False,True,'');
   fDatabaixa := CreateCmDbField('DATABAIXA',ftDateTime,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCodlancnaoident := CreateCmDbField('CODLANCNAOIDENT',ftfloat,False,False,False,True,'');
   fCodlancfinanc := CreateCmDbField('CODLANCFINANC',ftfloat,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,True,True,False,True,'');
end;

function TDbRecbtopagto.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

procedure TDbRecbtopagto.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbRecbtopagto.SetCodlancfinanc(const Value: TCmDbField);
begin
  FCodlancfinanc := Value;
end;

procedure TDbRecbtopagto.SetCodlancnaoident(const Value: TCmDbField);
begin
  FCodlancnaoident := Value;
end;

procedure TDbRecbtopagto.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbRecbtopagto.SetDatabaixa(const Value: TCmDbField);
begin
  FDatabaixa := Value;
end;

procedure TDbRecbtopagto.SetDatacfloat(const Value: TCmDbField);
begin
  FDatacfloat := Value;
end;

procedure TDbRecbtopagto.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbRecbtopagto.SetNumbaixa(const Value: TCmDbField);
begin
  FNumbaixa := Value;
end;

procedure TDbRecbtopagto.SetNumchqbordero(const Value: TCmDbField);
begin
  FNumchqbordero := Value;
end;

procedure TDbRecbtopagto.SetNumlancto(const Value: TCmDbField);
begin
  FNumlancto := Value;
end;

procedure TDbRecbtopagto.SetNumlote(const Value: TCmDbField);
begin
  FNumlote := Value;
end;

end.



