{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 18/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBContasTiposMovimentoGrupos;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBContasTiposMovimentoGrupos = class(TCmDbObject)

  private
    FTipolancamento: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdtipomovimentacao: TCmDbField;
    FIdgrupo: TCmDbField;
    FIdcontastiposmov: TCmDbField;
    FIdempresa: TCmDbField;
    FPlano: TCmDbField;
    FPlaconta: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetIdcontastiposmov(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipomovimentacao(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetTipolancamento(const Value: TCmDbField);

  public

     Property Tipolancamento: TCmDbField read FTipolancamento write SetTipolancamento;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idtipomovimentacao: TCmDbField read FIdtipomovimentacao write SetIdtipomovimentacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idcontastiposmov: TCmDbField read FIdcontastiposmov write SetIdcontastiposmov;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBContasTiposMovimentoGrupos }

constructor TDBContasTiposMovimentoGrupos.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CONTASTIPOSMOVIMENTOGRUPOS';

   fTipolancamento := CreateCmDbField('TIPOLANCAMENTO',ftString,False,False,False,False,'');
   fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,False,'');
   fPlaconta := CreateCmDbField('PLACONTA',ftString,False,False,False,False,'');
   fIdtipomovimentacao := CreateCmDbField('IDTIPOMOVIMENTACAO',ftfloat,False,False,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,False,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,False,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,False,'');
   fIdcontastiposmov := CreateCmDbField('IDCONTASTIPOSMOV',ftfloat,True,True,False,False,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,False,'');
end;

function TDBContasTiposMovimentoGrupos.Insert: Boolean;
begin
   fIdcontastiposmov.AsFloat := GetSequence('CONTASTIPOSMOVIMENTOGRUPOS');
   Result := Inherited Insert;
end;

function TDBContasTiposMovimentoGrupos.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBContasTiposMovimentoGrupos.SetCodcentrocusto(const Value: TCmDbField);
begin
   FCodcentrocusto := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetIdcontastiposmov(const Value: TCmDbField);
begin
   FIdcontastiposmov := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetIdempresa(const Value: TCmDbField);
begin
   FIdempresa := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetIdgrupo(const Value: TCmDbField);
begin
   FIdgrupo := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetIdpessoa(const Value: TCmDbField);
begin
   FIdpessoa := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetIdtipomovimentacao(const Value: TCmDbField);
begin
   FIdtipomovimentacao := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetPlaconta(const Value: TCmDbField);
begin
   FPlaconta := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetPlano(const Value: TCmDbField);
begin
   FPlano := Value;
end;

procedure TDBContasTiposMovimentoGrupos.SetTipolancamento(const Value: TCmDbField);
begin
   FTipolancamento := Value;
end;

end.



