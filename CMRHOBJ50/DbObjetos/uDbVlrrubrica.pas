{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Mose Cornetta           }
{ Atualizado Em: 21/01/2013                             }
{                                                       }
{*******************************************************}

unit uDbVlrrubrica;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase, Wwquery;

Type
  TDbVlrrubrica = class(TCmDbObject)

  private
    FQry : TwwQuery;
    FIdprovento: TCmDbField;
    FMes: TCmDbField;
    FIdvlrrubrica: TCmDbField;
    FAno: TCmDbField;
    FValor: TCmDbField;
    procedure SetAno(const Value: TCmDbField);
    procedure SetIdprovento(const Value: TCmDbField);
    procedure SetIdvlrrubrica(const Value: TCmDbField);
    procedure SetMes(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Mes: TCmDbField read FMes write SetMes;
     Property Idvlrrubrica: TCmDbField read FIdvlrrubrica write SetIdvlrrubrica;
     Property Idprovento: TCmDbField read FIdprovento write SetIdprovento;
     Property Ano: TCmDbField read FAno write SetAno;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbVlrrubrica }

constructor TDbVlrrubrica.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  FQry := TwwQuery.create(nil);
  FQry.DatabaseName := 'BASEDADOS';

  TableName := 'VLRRUBRICA';

   fValor := CreateCmDbField('VALOR',ftfloat,True,False,False,True,'');
   fMes := CreateCmDbField('MES',ftString,True,False,False,True,'');
   fIdvlrrubrica := CreateCmDbField('IDVLRRUBRICA',ftfloat,True,True,False,True,'');
   fIdprovento := CreateCmDbField('IDPROVENTO',ftfloat,True,False,False,True,'');
   fAno := CreateCmDbField('ANO',ftString,True,False,False,True,'');
end;

function TDbVlrrubrica.Insert: Boolean;
begin

   fIdvlrrubrica.AsFloat := RetUltRegQry(FQry,'IDVLRRUBRICA', 'VLRRUBRICA', 'ULTIMO', '') +1;
   Result := Inherited Insert;

end;


procedure TDbVlrrubrica.SetAno(const Value: TCmDbField);
begin
  FAno := Value;
end;

procedure TDbVlrrubrica.SetIdprovento(const Value: TCmDbField);
begin
  FIdprovento := Value;
end;

procedure TDbVlrrubrica.SetIdvlrrubrica(const Value: TCmDbField);
begin
  FIdvlrrubrica := Value;
end;

procedure TDbVlrrubrica.SetMes(const Value: TCmDbField);
begin
  FMes := Value;
end;

procedure TDbVlrrubrica.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



