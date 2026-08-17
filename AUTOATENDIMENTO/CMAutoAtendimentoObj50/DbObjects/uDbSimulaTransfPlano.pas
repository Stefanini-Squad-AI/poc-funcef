{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbSimulaTransfPlano;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbSimulaTransfPlano = class(TCmDbObject)

  private
    FDtsimula: TCmDbField;
    FIdconfig: TCmDbField;
    FIdeventogerador: TCmDbField;
    FIdtipotransf: TCmDbField;
    FIdsimulatransf: TCmDbField;
    FIdpessoa: TCmDbField;
    FValor: TCmDbField;
    procedure SetDtsimula(const Value: TCmDbField);
    procedure SetIdconfig(const Value: TCmDbField);
    procedure SetIdeventogerador(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdsimulatransf(const Value: TCmDbField);
    procedure SetIdtipotransf(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Idtipotransf: TCmDbField read FIdtipotransf write SetIdtipotransf;
     Property Idsimulatransf: TCmDbField read FIdsimulatransf write SetIdsimulatransf;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Ideventogerador: TCmDbField read FIdeventogerador write SetIdeventogerador;
     Property Idconfig: TCmDbField read FIdconfig write SetIdconfig;
     Property Dtsimula: TCmDbField read FDtsimula write SetDtsimula;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSimulaTransfPlano }

constructor TDbSimulaTransfPlano.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SIMULATRANSFPLANO';

   fValor := CreateCmDbField('VALOR',ftString,False,False,False,True,'Valor');
   fIdtipotransf := CreateCmDbField('IDTIPOTRANSF',ftfloat,True,False,False,True,'Id. Tipo Transf.');
   fIdsimulatransf := CreateCmDbField('IDSIMULATRANSF',ftfloat,True,True,False,True,'Id. Simulação');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'Id. Pessoa');
   fIdeventogerador := CreateCmDbField('IDEVENTOGERADOR',ftfloat,True,False,False,True,'Id. Evento Gerador');
   fIdconfig := CreateCmDbField('IDCONFIG',ftfloat,True,False,False,True,'Id. Config.');
   fDtsimula := CreateCmDbField('DTSIMULA',ftDateTime,True,False,False,True,'Data da Simulação');
end;

function TDbSimulaTransfPlano.Insert: Boolean;
begin

   fIdsimulatransf.AsFloat := GetSequence('SIMULATRANSFPLANO');
   Result := Inherited Insert;

end;

procedure TDbSimulaTransfPlano.SetDtsimula(const Value: TCmDbField);
begin
  FDtsimula := Value;
end;

procedure TDbSimulaTransfPlano.SetIdconfig(const Value: TCmDbField);
begin
  FIdconfig := Value;
end;

procedure TDbSimulaTransfPlano.SetIdeventogerador(const Value: TCmDbField);
begin
  FIdeventogerador := Value;
end;

procedure TDbSimulaTransfPlano.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbSimulaTransfPlano.SetIdsimulatransf(
  const Value: TCmDbField);
begin
  FIdsimulatransf := Value;
end;

procedure TDbSimulaTransfPlano.SetIdtipotransf(const Value: TCmDbField);
begin
  FIdtipotransf := Value;
end;

procedure TDbSimulaTransfPlano.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



