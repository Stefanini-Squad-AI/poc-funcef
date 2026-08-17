{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/11/2008                             }
{                                                       }
{*******************************************************}

unit uDbImobObra;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbImobObra = class(TCmDbObject)

  private
    FIdcafobra: TCmDbField;
    FDtainicioobra: TCmDbField;
    FDtaencerraobra: TCmDbField;
    FDesccafobra: TCmDbField;
    FFlgobra: TCmDbField;
    FIdgrupo: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdimovel: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdtipocustorecimo: TCmDbField;
    procedure SetDesccafobra(const Value: TCmDbField);
    procedure SetDtaencerraobra(const Value: TCmDbField);
    procedure SetDtainicioobra(const Value: TCmDbField);
    procedure SetFlgobra(const Value: TCmDbField);
    procedure SetIdcafobra(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);

  public
     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idcafobra: TCmDbField read FIdcafobra write SetIdcafobra;
     Property Flgobra: TCmDbField read FFlgobra write SetFlgobra;
     Property Dtainicioobra: TCmDbField read FDtainicioobra write SetDtainicioobra;
     Property Dtaencerraobra: TCmDbField read FDtaencerraobra write SetDtaencerraobra;
     Property Desccafobra: TCmDbField read FDesccafobra write SetDesccafobra;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbImobObra }

constructor TDbImobObra.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CAFOBRA';

   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,True,'');
   fIdcafobra := CreateCmDbField('IDCAFOBRA',ftfloat,True,True,False,True,'');
   fFlgobra := CreateCmDbField('FLGOBRA',ftfloat,False,False,False,True,'');
   fDtainicioobra := CreateCmDbField('DTAINICIOOBRA',ftDateTime,False,False,False,True,'');
   fDtaencerraobra := CreateCmDbField('DTAENCERRAOBRA',ftDateTime,False,False,False,True,'');
   fDesccafobra := CreateCmDbField('DESCCAFOBRA',ftString,False,False,False,True,'');
end;

function TDbImobObra.Insert: Boolean;
begin

   fIdpessoa.AsFloat := GetSequence('CAFOBRA');
   fIdcafobra.AsFloat := GetSequence('CAFOBRA');
   Result := Inherited Insert;

end;

procedure TDbImobObra.SetDesccafobra(const Value: TCmDbField);
begin
  FDesccafobra := Value;
end;

procedure TDbImobObra.SetDtaencerraobra(const Value: TCmDbField);
begin
  FDtaencerraobra := Value;
end;

procedure TDbImobObra.SetDtainicioobra(const Value: TCmDbField);
begin
  FDtainicioobra := Value;
end;

procedure TDbImobObra.SetFlgobra(const Value: TCmDbField);
begin
  FFlgobra := Value;
end;

procedure TDbImobObra.SetIdcafobra(const Value: TCmDbField);
begin
  FIdcafobra := Value;
end;

procedure TDbImobObra.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDbImobObra.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbImobObra.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbImobObra.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbImobObra.SetIdtipocustorecimo(const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

end.



