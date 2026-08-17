{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbPortadorconta;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbPortadorconta = class(TCmDbObject)

  private
    FUnidnegoc: TCmDbField;
    FIdagencia: TCmDbField;
    FCodsubconta: TCmDbField;
    FDescricao: TCmDbField;
    FMoecodigo: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FCodportador: TCmDbField;
    FPlano: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlggravafluxo: TCmDbField;
    FPlaconta: TCmDbField;
    FNocontacorr: TCmDbField;
    FFlgstatus: TCmDbField;
    FIdbanco: TCmDbField;
    FIdempresa: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FControleRemessa: TCmDbField;
    FFlgContaInvest: TCmDbField;
    FnDiasApuraCpmf: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodportador(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlggravafluxo(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetIdagencia(const Value: TCmDbField);
    procedure SetIdbanco(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetNocontacorr(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetControleRemessa(const Value: TCmDbField);
    procedure SetnDiasApuraCpmf(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Nocontacorr: TCmDbField read FNocontacorr write SetNocontacorr;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idbanco: TCmDbField read FIdbanco write SetIdbanco;
     Property Idagencia: TCmDbField read FIdagencia write SetIdagencia;
     Property Flgstatus: TCmDbField read FFlgstatus write SetFlgstatus;
     Property Flggravafluxo: TCmDbField read FFlggravafluxo write SetFlggravafluxo;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codportador: TCmDbField read FCodportador write SetCodportador;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property ControleRemessa: TCmDbField read FControleRemessa write SetControleRemessa;
     property FlgContaInvest: TCmDbField read FFlgContaInvest write FFlgContaInvest;
     property nDiasApuraCpmf: TCmDbField read FnDiasApuraCpmf write SetnDiasApuraCpmf; //andré tavares - pendência 22316 - 17/05/2006

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPortadorconta }

constructor TDbPortadorconta.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PORTADORCONTA';

   fUnidnegoc         := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fPlano             := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlaconta          := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fNocontacorr       := CreateCmDbField('NOCONTACORR',ftString,False,False,False,True,'');
   fMoecodigo         := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
   fIdpessoa          := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdempresa         := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIdbanco           := CreateCmDbField('IDBANCO',ftfloat,False,False,False,True,'');
   fIdagencia         := CreateCmDbField('IDAGENCIA',ftfloat,False,False,False,True,'');
   fFlgstatus         := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'');
   fFlggravafluxo     := CreateCmDbField('FLGGRAVAFLUXO',ftString,False,False,False,True,'');
   fDescricao         := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fCodsubconta       := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
   fCodportador       := CreateCmDbField('CODPORTADOR',ftfloat,True,True,False,True,'');
   fCodcentrocusto    := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   fControleRemessa   := CreateCmDbField('CONTROLEREMESSA',ftFloat,False,False,False,True,'');
   FFlgContaInvest    := CreateCmDbField('FLGCONTAINVEST',ftFloat,False,False,False,True,'');
   FnDiasApuraCpmf    := CreateCmDbField('NDIASAPURACPMF',ftFloat,False,False,False,True,''); //andré tavares - pendência 22316 - 17/05/2006

end;

function TDbPortadorconta.Insert: Boolean;
begin

   fCodportador.AsFloat := GetSequence('PORTADORCONTA');
   Result := Inherited Insert;

end;

function TDbPortadorconta.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbPortadorconta.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbPortadorconta.SetCodportador(const Value: TCmDbField);
begin
  FCodportador := Value;
end;

procedure TDbPortadorconta.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbPortadorconta.SetControleRemessa(const Value: TCmDbField);
begin
  FControleRemessa := Value;
end;

procedure TDbPortadorconta.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbPortadorconta.SetFlggravafluxo(const Value: TCmDbField);
begin
  FFlggravafluxo := Value;
end;

procedure TDbPortadorconta.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbPortadorconta.SetIdagencia(const Value: TCmDbField);
begin
  FIdagencia := Value;
end;

procedure TDbPortadorconta.SetIdbanco(const Value: TCmDbField);
begin
  FIdbanco := Value;
end;

procedure TDbPortadorconta.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbPortadorconta.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbPortadorconta.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbPortadorconta.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbPortadorconta.SetnDiasApuraCpmf(const Value: TCmDbField);
begin
  FnDiasApuraCpmf := Value;
end;

procedure TDbPortadorconta.SetNocontacorr(const Value: TCmDbField);
begin
  FNocontacorr := Value;
end;

procedure TDbPortadorconta.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbPortadorconta.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbPortadorconta.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



