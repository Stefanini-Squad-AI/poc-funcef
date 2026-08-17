{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipcustagregconta;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipcustagregconta = class(TCmDbObject)

  private
    FPlaconta: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodsubconta: TCmDbField;
    FUnidnegoc: TCmDbField;
    FPlano: TCmDbField;
    FCodtipocustagreg: TCmDbField;
    FIdtipcustagregcon: TCmDbField;
    FIdempresa: TCmDbField;
    FDebCre: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetCodtipocustagreg(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipcustagregcon(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetDebCre(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idtipcustagregcon: TCmDbField read FIdtipcustagregcon write SetIdtipcustagregcon;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Codtipocustagreg: TCmDbField read FCodtipocustagreg write SetCodtipocustagreg;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property DebCre: TCmDbField read FDebCre write SetDebCre;
     
     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipcustagregconta }

constructor TDbTipcustagregconta.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPCUSTAGREGCONTA';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fIdtipcustagregcon := CreateCmDbField('IDTIPCUSTAGREGCON',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,True,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   FDebCre := CreateCmDbField('DEBCRE',ftString,False,False,False,True,'');
end;

function TDbTipcustagregconta.Insert: Boolean;
begin

   fIdtipcustagregcon.AsFloat := GetSequence('TIPCUSTAGREGCONTA');
   Result := Inherited Insert;

end;

function TDbTipcustagregconta.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipcustagregconta.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbTipcustagregconta.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbTipcustagregconta.SetCodtipocustagreg(
  const Value: TCmDbField);
begin
  FCodtipocustagreg := Value;
end;

procedure TDbTipcustagregconta.SetDebCre(const Value: TCmDbField);
begin
  FDebCre := Value;
end;

procedure TDbTipcustagregconta.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbTipcustagregconta.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbTipcustagregconta.SetIdtipcustagregcon(
  const Value: TCmDbField);
begin
  FIdtipcustagregcon := Value;
end;

procedure TDbTipcustagregconta.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbTipcustagregconta.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbTipcustagregconta.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



