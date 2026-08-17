{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 28/08/2003                             }
{                                                       }
{*******************************************************}

unit uDBCafObra;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBCafObra = class(TCmDbObject)

  private
    FDtainicioobra: TCmDbField;
    FIdcafobra: TCmDbField;
    FDtaencerraobra: TCmDbField;
    FFlgobra: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdimovel: TCmDbField;
    FDesccafobra: TCmDbField;
    FIdtipocustorecimo: TCmDbField;
    procedure SetDesccafobra(const Value: TCmDbField);
    procedure SetDtaencerraobra(const Value: TCmDbField);
    procedure SetDtainicioobra(const Value: TCmDbField);
    procedure SetFlgobra(const Value: TCmDbField);
    procedure SetIdcafobra(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);

  public

     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idcafobra: TCmDbField read FIdcafobra write SetIdcafobra;
     Property Flgobra: TCmDbField read FFlgobra write SetFlgobra;
     Property Dtainicioobra: TCmDbField read FDtainicioobra write SetDtainicioobra;
     Property Dtaencerraobra: TCmDbField read FDtaencerraobra write SetDtaencerraobra;
     Property Desccafobra: TCmDbField read FDesccafobra write SetDesccafobra;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBCafObra }

constructor TDBCafObra.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CAFOBRA';

   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'');
   fIdcafobra := CreateCmDbField('IDCAFOBRA',ftfloat,True,True,False,True,'');
   fFlgobra := CreateCmDbField('FLGOBRA',ftfloat,False,False,False,False,'');
   fDtainicioobra := CreateCmDbField('DTAINICIOOBRA',ftDateTime,False,False,False,True,'');
   fDtaencerraobra := CreateCmDbField('DTAENCERRAOBRA',ftDateTime,False,False,False,True,'');
   fDesccafobra := CreateCmDbField('DESCCAFOBRA',ftString,False,False,False,True,'');
end;

function TDBCafObra.Insert: Boolean;
begin
   fIdcafobra.AsFloat := GetSequence('CAFOBRA');
   Result := Inherited Insert;
end;

procedure TDBCafObra.SetDesccafobra(const Value: TCmDbField);
begin
  FDesccafobra := Value;
end;

procedure TDBCafObra.SetDtaencerraobra(const Value: TCmDbField);
begin
  FDtaencerraobra := Value;
end;

procedure TDBCafObra.SetDtainicioobra(const Value: TCmDbField);
begin
  FDtainicioobra := Value;
end;

procedure TDBCafObra.SetFlgobra(const Value: TCmDbField);
begin
  FFlgobra := Value;
end;

procedure TDBCafObra.SetIdcafobra(const Value: TCmDbField);
begin
  FIdcafobra := Value;
end;

procedure TDBCafObra.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDBCafObra.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDBCafObra.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBCafObra.SetIdtipocustorecimo(const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

end.



