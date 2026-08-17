{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbTiprecdesxtipagre;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTiprecdesxtipagre = class(TCmDbObject)

  private
    FCodtiprecdes: TCmDbField;
    FIdempresa: TCmDbField;
    FCodtipocustagreg: TCmDbField;
    FRecpag: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdtiprecdesxagre: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdprograma: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodtipocustagreg(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetIdtiprecdesxagre(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idtiprecdesxagre: TCmDbField read FIdtiprecdesxagre write SetIdtiprecdesxagre;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codtipocustagreg: TCmDbField read FCodtipocustagreg write SetCodtipocustagreg;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTiprecdesxtipagre }

constructor TDbTiprecdesxtipagre.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPRECDESXTIPAGRE';

   fRecpag           := CreateCmDbField('RECPAG',          ftString,False,False,False,True,'');
   fIdtiprecdesxagre := CreateCmDbField('IDTIPRECDESXAGRE',ftfloat, True,True,False,True,'');
   fIdprograma       := CreateCmDbField('IDPROGRAMA',      ftfloat, False,False,False,True,'');
   fIdpessoa         := CreateCmDbField('IDPESSOA',        ftfloat, False,False,False,True,'');
   fIdempresa        := CreateCmDbField('IDEMPRESA',       ftfloat, False,False,False,True,'');
   fCodtiprecdes     := CreateCmDbField('CODTIPRECDES',    ftString,False,False,False,True,'');
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat, False,False,False,True,'');
   fCodcentrocusto   := CreateCmDbField('CODCENTROCUSTO',  ftString,False,False,False,True,'');
end;

function TDbTiprecdesxtipagre.Insert: Boolean;
begin
   fIdtiprecdesxagre.AsFloat := GetSequence('TIPRECDESXTIPAGRE');
   Result := Inherited Insert;
end;

function TDbTiprecdesxtipagre.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbTiprecdesxtipagre.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbTiprecdesxtipagre.SetCodtipocustagreg(
  const Value: TCmDbField);
begin
  FCodtipocustagreg := Value;
end;

procedure TDbTiprecdesxtipagre.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbTiprecdesxtipagre.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbTiprecdesxtipagre.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbTiprecdesxtipagre.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbTiprecdesxtipagre.SetIdtiprecdesxagre(
  const Value: TCmDbField);
begin
  FIdtiprecdesxagre := Value;
end;

procedure TDbTiprecdesxtipagre.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



