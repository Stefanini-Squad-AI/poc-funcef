{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 21/08/2003                             }
{                                                       }
{*******************************************************}

unit uDBSaidaTemporaria;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBSaidaTemporaria = class(TCmDbObject)

  private
    FIdresponsavel: TCmDbField;
    FStpdata: TCmDbField;
    FIdsaidatemporaria: TCmDbField;
    FStpobservacoes: TCmDbField;
    FIdtiposaidatemp: TCmDbField;
    FStpdataretorno: TCmDbField;
    FIdpessoa: TCmDbField;
    FStptermo: TCmDbField;
    FIdlocalizacao: TCmDbField;
    FStpflgexec: TCmDbField;
    procedure SetIdlocalizacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);
    procedure SetIdsaidatemporaria(const Value: TCmDbField);
    procedure SetIdtiposaidatemp(const Value: TCmDbField);
    procedure SetStpdata(const Value: TCmDbField);
    procedure SetStpdataretorno(const Value: TCmDbField);
    procedure SetStpflgexec(const Value: TCmDbField);
    procedure SetStpobservacoes(const Value: TCmDbField);
    procedure SetStptermo(const Value: TCmDbField);

  public

     Property Stptermo: TCmDbField read FStptermo write SetStptermo;
     Property Stpobservacoes: TCmDbField read FStpobservacoes write SetStpobservacoes;
     Property Stpflgexec: TCmDbField read FStpflgexec write SetStpflgexec;
     Property Stpdataretorno: TCmDbField read FStpdataretorno write SetStpdataretorno;
     Property Stpdata: TCmDbField read FStpdata write SetStpdata;
     Property Idtiposaidatemp: TCmDbField read FIdtiposaidatemp write SetIdtiposaidatemp;
     Property Idsaidatemporaria: TCmDbField read FIdsaidatemporaria write SetIdsaidatemporaria;
     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idlocalizacao: TCmDbField read FIdlocalizacao write SetIdlocalizacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBSaidaTemporaria }

constructor TDBSaidaTemporaria.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'SAIDATEMPORARIA';

   fStptermo := CreateCmDbField('STPTERMO',ftfloat,False,False,False,True,'');
   fStpobservacoes := CreateCmDbField('STPOBSERVACOES',ftString,False,False,False,True,'');
   fStpflgexec := CreateCmDbField('STPFLGEXEC',ftfloat,True,False,False,False,'');
   fStpdataretorno := CreateCmDbField('STPDATARETORNO',ftDateTime,False,False,False,True,'');
   fStpdata := CreateCmDbField('STPDATA',ftDateTime,False,False,False,True,'');
   fIdtiposaidatemp := CreateCmDbField('IDTIPOSAIDATEMP',ftfloat,False,False,False,True,'');
   fIdsaidatemporaria := CreateCmDbField('IDSAIDATEMPORARIA',ftfloat,True,True,False,True,'');
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdlocalizacao := CreateCmDbField('IDLOCALIZACAO',ftfloat,False,False,False,True,'');
end;

function TDBSaidaTemporaria.Insert: Boolean;
begin
   fIdsaidatemporaria.AsFloat := GetSequence('SAIDATEMPORARIA');
   Result := Inherited Insert;
end;

procedure TDBSaidaTemporaria.SetIdlocalizacao(const Value: TCmDbField);
begin
  FIdlocalizacao := Value;
end;

procedure TDBSaidaTemporaria.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBSaidaTemporaria.SetIdresponsavel(const Value: TCmDbField);
begin
  FIdresponsavel := Value;
end;

procedure TDBSaidaTemporaria.SetIdsaidatemporaria(const Value: TCmDbField);
begin
  FIdsaidatemporaria := Value;
end;

procedure TDBSaidaTemporaria.SetIdtiposaidatemp(const Value: TCmDbField);
begin
  FIdtiposaidatemp := Value;
end;

procedure TDBSaidaTemporaria.SetStpdata(const Value: TCmDbField);
begin
  FStpdata := Value;
end;

procedure TDBSaidaTemporaria.SetStpdataretorno(const Value: TCmDbField);
begin
  FStpdataretorno := Value;
end;

procedure TDBSaidaTemporaria.SetStpflgexec(const Value: TCmDbField);
begin
  FStpflgexec := Value;
end;

procedure TDBSaidaTemporaria.SetStpobservacoes(const Value: TCmDbField);
begin
  FStpobservacoes := Value;
end;

procedure TDBSaidaTemporaria.SetStptermo(const Value: TCmDbField);
begin
  FStptermo := Value;
end;

end.

