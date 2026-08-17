{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ Analista Responsável: Igor Maffei Libonati Maia       }
{ Atualizado Em: 10/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbArtxcontaxcc;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbArtxcontaxcc = class(TCmDbObject)

  private
    FSubContaEntrada: TCmDbField;
    FCodGrupoProd: TCmDbField;
    FCodAlmoxarifado: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FUnidNegoc: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdArtxContaxCC: TCmDbField;
    FContaSaida: TCmDbField;
    FSubContaSaida: TCmDbField;
    FPlano: TCmDbField;
    FIdEmpresa: TCmDbField;
    FCodArtigo: TCmDbField;
    FContaEntrada: TCmDbField;
    procedure SetCodAlmoxarifado(const Value: TCmDbField);
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodCentroCusto(const Value: TCmDbField);
    procedure SetCodGrupoProd(const Value: TCmDbField);
    procedure SetContaEntrada(const Value: TCmDbField);
    procedure SetContaSaida(const Value: TCmDbField);
    procedure SetIdArtxContaxCC(const Value: TCmDbField);
    procedure SetIdEmpresa(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetSubContaEntrada(const Value: TCmDbField);
    procedure SetSubContaSaida(const Value: TCmDbField);
    procedure SetUnidNegoc(const Value: TCmDbField);

  public
     Property IdArtxContaxCC   : TCmDbField read FIdArtxContaxCC write SetIdArtxContaxCC;
     Property UnidNegoc        : TCmDbField read FUnidNegoc write SetUnidNegoc;
     Property SubContaSaida    : TCmDbField read FSubContaSaida write SetSubContaSaida;
     Property SubContaEntrada  : TCmDbField read FSubContaEntrada write SetSubContaEntrada;
     Property Plano            : TCmDbField read FPlano write SetPlano;
     Property IdPessoa         : TCmDbField read FIdPessoa write SetIdPessoa;
     Property IdEmpresa        : TCmDbField read FIdEmpresa write SetIdEmpresa;
     Property ContaSaida       : TCmDbField read FContaSaida write SetContaSaida;
     Property ContaEntrada     : TCmDbField read FContaEntrada write SetContaEntrada;
     Property CodGrupoProd     : TCmDbField read FCodGrupoProd write SetCodGrupoProd;
     Property CodCentroCusto   : TCmDbField read FCodCentroCusto write SetCodCentroCusto;
     Property CodArtigo        : TCmDbField read FCodArtigo write SetCodArtigo;
     Property CodAlmoxarifado  : TCmDbField read FCodAlmoxarifado write SetCodAlmoxarifado;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function Update :Boolean; Override;
     Function Delete :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbArtxcontaxcc }

constructor TDbArtxcontaxcc.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ARTXCONTAXCC';
  
 fIdartxcontaxcc   := CreateCmDbField('IDARTXCONTAXCC',ftfloat,False,True);
 fUnidnegoc        := CreateCmDbField('UNIDNEGOC',ftfloat,False,False);
 fSubcontasaida    := CreateCmDbField('SUBCONTASAIDA',ftfloat,False,False);
 fSubcontaentrada  := CreateCmDbField('SUBCONTAENTRADA',ftfloat,False,False);
 fPlano            := CreateCmDbField('PLANO',ftfloat,False,False);
 fIdpessoa         := CreateCmDbField('IDPESSOA',ftfloat,True,False);
 fIdempresa        := CreateCmDbField('IDEMPRESA',ftfloat,False,False);
 fContasaida       := CreateCmDbField('CONTASAIDA',ftString,False,False);
 fContaentrada     := CreateCmDbField('CONTAENTRADA',ftString,True,False);
 fCodgrupoprod     := CreateCmDbField('CODGRUPOPROD',ftString,False,False);
 fCodcentrocusto   := CreateCmDbField('CODCENTROCUSTO',ftString,False,False);
 fCodartigo        := CreateCmDbField('CODARTIGO',ftString,False,False);
 fCodalmoxarifado  := CreateCmDbField('CODALMOXARIFADO',ftfloat,False,False);
end;

function TDbArtxcontaxcc.Delete: Boolean;
begin
   Result := Inherited Delete;
end;

function TDbArtxcontaxcc.Insert: Boolean;
begin
   fIdartxcontaxcc.AsFloat := GetSequence('ARTXCONTAXCC');

   Result := Inherited Insert;
end;

function TDbArtxcontaxcc.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDb;

end;

procedure TDbArtxcontaxcc.SetCodAlmoxarifado(const Value: TCmDbField);
begin
  FCodAlmoxarifado := Value;
end;

procedure TDbArtxcontaxcc.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbArtxcontaxcc.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDbArtxcontaxcc.SetCodGrupoProd(const Value: TCmDbField);
begin
  FCodGrupoProd := Value;
end;

procedure TDbArtxcontaxcc.SetContaEntrada(const Value: TCmDbField);
begin
  FContaEntrada := Value;
end;

procedure TDbArtxcontaxcc.SetContaSaida(const Value: TCmDbField);
begin
  FContaSaida := Value;
end;

procedure TDbArtxcontaxcc.SetIdArtxContaxCC(const Value: TCmDbField);
begin
  FIdArtxContaxCC := Value;
end;

procedure TDbArtxcontaxcc.SetIdEmpresa(const Value: TCmDbField);
begin
  FIdEmpresa := Value;
end;

procedure TDbArtxcontaxcc.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbArtxcontaxcc.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbArtxcontaxcc.SetSubContaEntrada(const Value: TCmDbField);
begin
  FSubContaEntrada := Value;
end;

procedure TDbArtxcontaxcc.SetSubContaSaida(const Value: TCmDbField);
begin
  FSubContaSaida := Value;
end;

procedure TDbArtxcontaxcc.SetUnidNegoc(const Value: TCmDbField);
begin
  FUnidNegoc := Value;
end;

function TDbArtxcontaxcc.Update: Boolean;
begin
   Result := Inherited Update;
end;

end.



