{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/12/2001                             }
{                                                       }
{*******************************************************}

unit uDbContabancaria;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbContabancaria = class(TCmDbObject)

  private
    FContacorrente: TCmDbField;
    FFlgcontaconjunta: TCmDbField;
    FIdagencia: TCmDbField;
    FFlgcontapref: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdcbancaria: TCmDbField;
    FTipoconta: TCmDbField;
    procedure SetContacorrente(const Value: TCmDbField);
    procedure SetFlgcontaconjunta(const Value: TCmDbField);
    procedure SetFlgcontapref(const Value: TCmDbField);
    procedure SetIdagencia(const Value: TCmDbField);
    procedure SetIdcbancaria(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetTipoconta(const Value: TCmDbField);
  public
    Property Tipoconta: TCmDbField  read FTipoconta write SetTipoconta;
    Property Idpessoa: TCmDbField  read FIdpessoa write SetIdpessoa;
    Property Idcbancaria: TCmDbField  read FIdcbancaria write SetIdcbancaria;
    Property Idagencia: TCmDbField  read FIdagencia write SetIdagencia;
    Property Flgcontapref: TCmDbField  read FFlgcontapref write SetFlgcontapref;
    Property Flgcontaconjunta: TCmDbField  read FFlgcontaconjunta write SetFlgcontaconjunta;
    Property Contacorrente: TCmDbField  read FContacorrente write SetContacorrente;
    Constructor Create; Override;
    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbContabancaria }

constructor TDbContabancaria.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTABANCARIA';

  fTipoconta := CreateCmDbField('TIPOCONTA',ftString,True,False,False,True);
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True);
  fIdcbancaria := CreateCmDbField('IDCBANCARIA',ftfloat,False,True,False,True);
  fIdagencia := CreateCmDbField('IDAGENCIA',ftfloat,True,False,False,True);
  fFlgcontapref := CreateCmDbField('FLGCONTAPREF',ftfloat,True,False,False,True);
  fFlgcontaconjunta := CreateCmDbField('FLGCONTACONJUNTA',ftString,True,False,False,True);
  fContacorrente := CreateCmDbField('CONTACORRENTE',ftString,True,False,False,True);
end;

function TDbContabancaria.Insert: Boolean;
begin
  fIdcbancaria.AsFloat := GetSequence('CONTABANCARIA');
  Result := Inherited Insert;
end;

function TDbContabancaria.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbContabancaria.SetContacorrente(const Value: TCmDbField);
begin
  FContacorrente := Value;
end;

procedure TDbContabancaria.SetFlgcontaconjunta(const Value: TCmDbField);
begin
  FFlgcontaconjunta := Value;
end;

procedure TDbContabancaria.SetFlgcontapref(const Value: TCmDbField);
begin
  FFlgcontapref := Value;
end;

procedure TDbContabancaria.SetIdagencia(const Value: TCmDbField);
begin
  FIdagencia := Value;
end;

procedure TDbContabancaria.SetIdcbancaria(const Value: TCmDbField);
begin
  FIdcbancaria := Value;
end;

procedure TDbContabancaria.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbContabancaria.SetTipoconta(const Value: TCmDbField);
begin
  FTipoconta := Value;
end;

end.

