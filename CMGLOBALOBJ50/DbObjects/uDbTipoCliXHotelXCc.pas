{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 18/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipoCliXHotelXCc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipoCliXHotelXCc = class(TCmDbObject)

  private
    FIdPessoa: TCmDbField;
    FIdTipoCliente: TCmDbField;
    FPlano: TCmDbField;
    FPlaConta: TCmDbField;
    FPlaContaCre: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FIdEmpresa: TCmDbField;
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetIdTipoCliente(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlaConta(const Value: TCmDbField);
    procedure SetPlaContaCre(const Value: TCmDbField);
    procedure SetCodCentroCusto(const Value: TCmDbField);
    procedure SetIdEmpresa(const Value: TCmDbField);

  public
    Property IdPessoa: TCmDbField read FIdPessoa write SetIdPessoa;
    Property IdTipoCliente: TCmDbField read FIdTipoCliente write SetIdTipoCliente;
    Property Plano: TCmDbField read FPlano write SetPlano;
    Property PlaConta: TCmDbField read FPlaConta write SetPlaConta;
    Property PlaContaCre: TCmDbField read FPlaContaCre write SetPlaContaCre;
    Property CodCentroCusto: TCmDbField read FCodCentroCusto write SetCodCentroCusto;
    Property IdEmpresa: TCmDbField read FIdEmpresa write SetIdEmpresa;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbTipoClixHotelxCC }

constructor TDbTipoCliXHotelXCc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOCLIXHOTELXCC ';

  FIdPessoa       := CreateCmDbField('IDPESSOA',ftFloat,True,True,False,True,'');
  FIdTipoCliente  := CreateCmDbField('IDTIPOCLIENTE',ftfloat,True,True,False,True,'');
  FPlano          := CreateCmDbField('PLANO',ftfloat,True,False,False,True,'');
  FPlaConta       := CreateCmDbField('PLACONTA',ftString,True,False,False,True,'');
  FPlaContaCre    := CreateCmDbField('PLACONTACRE',ftString,True,False,False,True,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
  FIdEmpresa      := CreateCmDbField('IDEMPRESA',ftFloat,False,False,False,True,'');
end;

function TDbTipoCliXHotelXCc.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

function TDbTipoCliXHotelXCc.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbTipoCliXHotelXCc.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbTipoCliXHotelXCc.SetIdTipoCliente(const Value: TCmDbField);
begin
  FIdTipoCliente := Value;
end;

procedure TDbTipoCliXHotelXCc.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbTipoCliXHotelXCc.SetPlaConta(const Value: TCmDbField);
begin
  FPlaConta := Value;
end;

procedure TDbTipoCliXHotelXCc.SetPlaContaCre(const Value: TCmDbField);
begin
  FPlaContaCre := Value;
end;

procedure TDbTipoCliXHotelXCc.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDbTipoCliXHotelXCc.SetIdEmpresa(const Value: TCmDbField);
begin
  FIdEmpresa := Value;
end;

end.

