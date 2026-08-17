{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/04/2003                             }
{                                                       }
{*******************************************************}

unit uDbParamInvestimob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamInvestimob = class(TCmDbObject)

  private
    FIdsituacao: TCmDbField;
    FFlgdiario: TCmDbField;
    FIdprograma: TCmDbField;
    FIdclassebem: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdrecalienacao: TCmDbField;
    FFlgintegracapcar: TCmDbField;
    FIddespaquisicao: TCmDbField;
    FIdempresa: TCmDbField;
    FFlgintegraativo: TCmDbField;
    FIdpessoaloc: TCmDbField;
    FUnidnegoc: TCmDbField;
    FCodtipimovelobra: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FIdlocalizacao: TCmDbField;
    FFlgintegracontab: TCmDbField;
    FCodportforma: TCmDbField;
    FFlgintcafcont: TCmDbField;
    FFlgReavBaixaBem: TCmDbField;
    FFlgReavCriaBem: TCmDbField;
    FFlgLogoRelat: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodtipimovelobra(const Value: TCmDbField);
    procedure SetFlgdiario(const Value: TCmDbField);
    procedure SetFlgintcafcont(const Value: TCmDbField);
    procedure SetFlgintegraativo(const Value: TCmDbField);
    procedure SetFlgintegracapcar(const Value: TCmDbField);
    procedure SetFlgintegracontab(const Value: TCmDbField);
    procedure SetIdclassebem(const Value: TCmDbField);
    procedure SetIddespaquisicao(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdlocalizacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdpessoaloc(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetIdrecalienacao(const Value: TCmDbField);
    procedure SetIdsituacao(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetFlgReavBaixaBem(const Value: TCmDbField);
    procedure SetFlgReavCriaBem(const Value: TCmDbField);
    procedure SetFlgLogoRelat(const Value: TCmDbField);

  public

     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Idsituacao: TCmDbField read FIdsituacao write SetIdsituacao;
     Property Idrecalienacao: TCmDbField read FIdrecalienacao write SetIdrecalienacao;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idpessoaloc: TCmDbField read FIdpessoaloc write SetIdpessoaloc;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idlocalizacao: TCmDbField read FIdlocalizacao write SetIdlocalizacao;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Iddespaquisicao: TCmDbField read FIddespaquisicao write SetIddespaquisicao;
     Property Idclassebem: TCmDbField read FIdclassebem write SetIdclassebem;
     Property Flgintegracontab: TCmDbField read FFlgintegracontab write SetFlgintegracontab;
     Property Flgintegracapcar: TCmDbField read FFlgintegracapcar write SetFlgintegracapcar;
     Property Flgintegraativo: TCmDbField read FFlgintegraativo write SetFlgintegraativo;
     Property Flgintcafcont: TCmDbField read FFlgintcafcont write SetFlgintcafcont;
     Property Flgdiario: TCmDbField read FFlgdiario write SetFlgdiario;
     Property Codtipimovelobra: TCmDbField read FCodtipimovelobra write SetCodtipimovelobra;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property FlgReavCriaBem: TCmDbField read FFlgReavCriaBem write SetFlgReavCriaBem;
     Property FlgReavBaixaBem: TCmDbField read FFlgReavBaixaBem write SetFlgReavBaixaBem;
     Property FlgLogoRelat: TCmDbField read FFlgLogoRelat write SetFlgLogoRelat;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamInvestimob }

constructor TDbParamInvestimob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMINVESTIMOB';

   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fIdsituacao := CreateCmDbField('IDSITUACAO',ftfloat,False,False,False,True,'');
   fIdrecalienacao := CreateCmDbField('IDRECALIENACAO',ftfloat,False,False,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdpessoaloc := CreateCmDbField('IDPESSOALOC',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdlocalizacao := CreateCmDbField('IDLOCALIZACAO',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIddespaquisicao := CreateCmDbField('IDDESPAQUISICAO',ftfloat,False,False,False,True,'');
   fIdclassebem := CreateCmDbField('IDCLASSEBEM',ftfloat,False,False,False,True,'');
   fFlgintegracontab := CreateCmDbField('FLGINTEGRACONTAB',ftString,False,False,False,True,'');
   fFlgintegracapcar := CreateCmDbField('FLGINTEGRACAPCAR',ftString,False,False,False,True,'');
   fFlgintegraativo := CreateCmDbField('FLGINTEGRAATIVO',ftString,False,False,False,True,'');
   fFlgintcafcont := CreateCmDbField('FLGINTCAFCONT',ftString,False,False,False,True,'');
   fFlgdiario := CreateCmDbField('FLGDIARIO',ftString,False,False,False,True,'');
   fCodtipimovelobra := CreateCmDbField('CODTIPIMOVELOBRA',ftString,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   fFlgreavcriabem := CreateCmDbField('FLGREAVCRIABEM',ftString,False,False,False,True,'');
   fFlgreavbaixabem := CreateCmDbField('FLGREAVBAIXABEM',ftString,False,False,False,True,'');
   fFlgLogoRelat := CreateCmDbField('FLGLOGORELAT',ftString,False,False,False,True,'');

end;

function TDbParamInvestimob.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbParamInvestimob.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbParamInvestimob.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbParamInvestimob.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbParamInvestimob.SetCodtipimovelobra(const Value: TCmDbField);
begin
  FCodtipimovelobra := Value;
end;

procedure TDbParamInvestimob.SetFlgdiario(const Value: TCmDbField);
begin
  FFlgdiario := Value;
end;

procedure TDbParamInvestimob.SetFlgintcafcont(const Value: TCmDbField);
begin
  FFlgintcafcont := Value;
end;

procedure TDbParamInvestimob.SetFlgintegraativo(const Value: TCmDbField);
begin
  FFlgintegraativo := Value;
end;

procedure TDbParamInvestimob.SetFlgintegracapcar(const Value: TCmDbField);
begin
  FFlgintegracapcar := Value;
end;

procedure TDbParamInvestimob.SetFlgintegracontab(const Value: TCmDbField);
begin
  FFlgintegracontab := Value;
end;

procedure TDbParamInvestimob.SetFlgLogoRelat(const Value: TCmDbField);
begin
  FFlgLogoRelat := Value;
end;

procedure TDbParamInvestimob.SetFlgReavBaixaBem(const Value: TCmDbField);
begin
  FFlgReavBaixaBem := Value;
end;

procedure TDbParamInvestimob.SetFlgReavCriaBem(const Value: TCmDbField);
begin
  FFlgReavCriaBem := Value;
end;

procedure TDbParamInvestimob.SetIdclassebem(const Value: TCmDbField);
begin
  FIdclassebem := Value;
end;

procedure TDbParamInvestimob.SetIddespaquisicao(const Value: TCmDbField);
begin
  FIddespaquisicao := Value;
end;

procedure TDbParamInvestimob.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbParamInvestimob.SetIdlocalizacao(const Value: TCmDbField);
begin
  FIdlocalizacao := Value;
end;

procedure TDbParamInvestimob.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbParamInvestimob.SetIdpessoaloc(const Value: TCmDbField);
begin
  FIdpessoaloc := Value;
end;

procedure TDbParamInvestimob.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbParamInvestimob.SetIdrecalienacao(const Value: TCmDbField);
begin
  FIdrecalienacao := Value;
end;

procedure TDbParamInvestimob.SetIdsituacao(const Value: TCmDbField);
begin
  FIdsituacao := Value;
end;

procedure TDbParamInvestimob.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.



