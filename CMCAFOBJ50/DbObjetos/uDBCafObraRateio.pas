{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 28/08/2003                             }
{                                                       }
{*******************************************************}

unit uDBCafObraRateio;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBCafObraRateio = class(TCmDbObject)

  private
    FParticipacao: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdcafobra: TCmDbField;
    FIdempresa: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetIdcafobra(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetParticipacao(const Value: TCmDbField);

  public

     Property Participacao: TCmDbField read FParticipacao write SetParticipacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idcafobra: TCmDbField read FIdcafobra write SetIdcafobra;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBCafObraRateio }

constructor TDBCafObraRateio.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CAFOBRARATEIO';

   fParticipacao := CreateCmDbField('PARTICIPACAO',ftfloat,False,False,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'');
   fIdcafobra := CreateCmDbField('IDCAFOBRA',ftfloat,True,True,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,True,True,False,True,'');
end;

function TDBCafObraRateio.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDBCafObraRateio.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDBCafObraRateio.SetIdcafobra(const Value: TCmDbField);
begin
  FIdcafobra := Value;
end;

procedure TDBCafObraRateio.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDBCafObraRateio.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBCafObraRateio.SetParticipacao(const Value: TCmDbField);
begin
  FParticipacao := Value;
end;

end.



