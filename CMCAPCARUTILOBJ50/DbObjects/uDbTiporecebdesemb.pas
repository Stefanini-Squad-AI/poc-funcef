{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 31/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTiporecebdesemb;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTiporecebdesemb = class(TCmDbObject)

  private
    FCodsubconta: TCmDbField;
    FFlgindicarecdes: TCmDbField;
    FCodcorresp: TCmDbField;
    FPlaconta: TCmDbField;
    FCodsubcontacre: TCmDbField;
    FFlgcalculaimposto: TCmDbField;
    FIdpessoa: TCmDbField;
    FPlacontacredito: TCmDbField;
    FDescricao: TCmDbField;
    FPlano: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FHitcodhist: TCmDbField;
    FRecpag: TCmDbField;
    FIdtipoavaliacao: TCmDbField;
    FAnasint: TCmDbField;
    FFlgobrigareserva: TCmDbField;
    FAtivo: TCmDbField;
    procedure SetAnasint(const Value: TCmDbField);
    procedure SetCodcorresp(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetCodsubcontacre(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgcalculaimposto(const Value: TCmDbField);
    procedure SetFlgindicarecdes(const Value: TCmDbField);
    procedure SetFlgobrigareserva(const Value: TCmDbField);
    procedure SetHitcodhist(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipoavaliacao(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlacontacredito(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetAtivo(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placontacredito: TCmDbField read FPlacontacredito write SetPlacontacredito;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idtipoavaliacao: TCmDbField read FIdtipoavaliacao write SetIdtipoavaliacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Hitcodhist: TCmDbField read FHitcodhist write SetHitcodhist;
     Property Flgobrigareserva: TCmDbField read FFlgobrigareserva write SetFlgobrigareserva;
     Property Flgindicarecdes: TCmDbField read FFlgindicarecdes write SetFlgindicarecdes;
     Property Flgcalculaimposto: TCmDbField read FFlgcalculaimposto write SetFlgcalculaimposto;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codsubcontacre: TCmDbField read FCodsubcontacre write SetCodsubcontacre;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codcorresp: TCmDbField read FCodcorresp write SetCodcorresp;
     Property Anasint: TCmDbField read FAnasint write SetAnasint;
     Property Ativo: TCmDbField read FAtivo write SetAtivo;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTiporecebdesemb }

constructor TDbTiporecebdesemb.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPORECEBDESEMB';

   fRecpag            := CreateCmDbField('RECPAG',ftString,True,True,False,True,'');
   fPlano             := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlacontacredito   := CreateCmDbField('PLACONTACREDITO',ftString,False,False,False,True,'');
   fPlaconta          := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
   fIdtipoavaliacao   := CreateCmDbField('IDTIPOAVALIACAO',ftfloat,False,False,False,True,'');
   fIdpessoa          := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fHitcodhist        := CreateCmDbField('HITCODHIST',ftString,False,False,False,True,'');
   fFlgobrigareserva  := CreateCmDbField('FLGOBRIGARESERVA',ftString,False,False,False,True,'');
   fFlgindicarecdes   := CreateCmDbField('FLGINDICARECDES',ftString,False,False,False,True,'');
   fFlgcalculaimposto := CreateCmDbField('FLGCALCULAIMPOSTO',ftString,False,False,False,True,'');
   fDescricao         := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fCodtiprecdes      := CreateCmDbField('CODTIPRECDES',ftString,True,True,False,True,'');
   fCodsubcontacre    := CreateCmDbField('CODSUBCONTACRE',ftfloat,False,False,False,True,'');
   fCodsubconta       := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodcorresp        := CreateCmDbField('CODCORRESP',ftString,False,False,False,True,'');
   fAnasint           := CreateCmDbField('ANASINT',ftString,False,False,False,True,'');
   fAtivo             := CreateCmDbField('ATIVO',ftString,False,False,False,True,'');
end;

function TDbTiporecebdesemb.Insert: Boolean;
begin
    Result := Inherited Insert;
end;

function TDbTiporecebdesemb.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbTiporecebdesemb.SetAnasint(const Value: TCmDbField);
begin
  FAnasint := Value;
end;

procedure TDbTiporecebdesemb.SetAtivo(const Value: TCmDbField);
begin
  FAtivo := Value;
end;

procedure TDbTiporecebdesemb.SetCodcorresp(const Value: TCmDbField);
begin
  FCodcorresp := Value;
end;

procedure TDbTiporecebdesemb.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbTiporecebdesemb.SetCodsubcontacre(const Value: TCmDbField);
begin
  FCodsubcontacre := Value;
end;

procedure TDbTiporecebdesemb.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbTiporecebdesemb.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbTiporecebdesemb.SetFlgcalculaimposto(const Value: TCmDbField);
begin
  FFlgcalculaimposto := Value;
end;

procedure TDbTiporecebdesemb.SetFlgindicarecdes(const Value: TCmDbField);
begin
  FFlgindicarecdes := Value;
end;

procedure TDbTiporecebdesemb.SetFlgobrigareserva(const Value: TCmDbField);
begin
  FFlgobrigareserva := Value;
end;

procedure TDbTiporecebdesemb.SetHitcodhist(const Value: TCmDbField);
begin
  FHitcodhist := Value;
end;

procedure TDbTiporecebdesemb.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbTiporecebdesemb.SetIdtipoavaliacao(const Value: TCmDbField);
begin
  FIdtipoavaliacao := Value;
end;

procedure TDbTiporecebdesemb.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbTiporecebdesemb.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbTiporecebdesemb.SetPlacontacredito(const Value: TCmDbField);
begin
  FPlacontacredito := Value;
end;

procedure TDbTiporecebdesemb.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbTiporecebdesemb.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



