{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/03/2004                             }
{                                                       }
{*******************************************************}

{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina.............: IDFDO
N. SIG.............: 115595
Data da Alteração..: 20/05/2021
Responsável........: Edilaine
Descrição..........: Integração com FDO Digital para rateio de lançamentos
-------------------------------------------------------------------------------}

unit uDbMedicaoxRateio;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbMedicaoxRateio = class(TCmDbObject)

  private
    FIdmedicao: TCmDbField;
    FDivisor: TCmDbField;
    FIdplanoprev: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FUnidnegoc: TCmDbField;
    FVlrrateio: TCmDbField;
    FIdprograma: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdmedicaoxrateio: TCmDbField;
    FIdpatro: TCmDbField;
    FIdempresa: TCmDbField;
    FIdFDO: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetDivisor(const Value: TCmDbField);
    procedure SetIdmedicao(const Value: TCmDbField);
    procedure SetIdmedicaoxrateio(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetVlrrateio(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdFDO(const Value: TCmDbField);

  public

     Property Vlrrateio: TCmDbField read FVlrrateio write SetVlrrateio;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idmedicaoxrateio: TCmDbField read FIdmedicaoxrateio write SetIdmedicaoxrateio;
     Property Idmedicao: TCmDbField read FIdmedicao write SetIdmedicao;
     Property Divisor: TCmDbField read FDivisor write SetDivisor;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property IdFDO : TCmDbField read FIdFDO write SetIdFDO;             //edilaine SIG115595

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbMedicaoxRateio }

constructor TDbMedicaoxRateio.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'MEDICAOXRATEIO';

   fVlrrateio := CreateCmDbField('VLRRATEIO',ftfloat,False,False,False,True,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,False,False,False,True,'');
   fIdmedicaoxrateio := CreateCmDbField('IDMEDICAOXRATEIO',ftfloat,True,True,False,True,'');
   fIdmedicao := CreateCmDbField('IDMEDICAO',ftfloat,False,False,False,True,'');
   fDivisor := CreateCmDbField('DIVISOR',ftString,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   fIdFDO := CreateCmDbField('ID_FDO',ftfloat,False,False,False,True,'');   //edilaine SIG115595
end;

function TDbMedicaoxRateio.Insert: Boolean;
begin

   fIdmedicaoxrateio.AsFloat := GetSequence('MEDICAOXRATEIO');
   Result := Inherited Insert;

end;


procedure TDbMedicaoxRateio.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbMedicaoxRateio.SetDivisor(const Value: TCmDbField);
begin
  FDivisor := Value;
end;

procedure TDbMedicaoxRateio.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbMedicaoxRateio.SetIdFDO(const Value: TCmDbField);
begin
  FIdFDO := Value;
end;

procedure TDbMedicaoxRateio.SetIdmedicao(const Value: TCmDbField);
begin
  FIdmedicao := Value;
end;

procedure TDbMedicaoxRateio.SetIdmedicaoxrateio(const Value: TCmDbField);
begin
  FIdmedicaoxrateio := Value;
end;

procedure TDbMedicaoxRateio.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDbMedicaoxRateio.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbMedicaoxRateio.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbMedicaoxRateio.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbMedicaoxRateio.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbMedicaoxRateio.SetVlrrateio(const Value: TCmDbField);
begin
  FVlrrateio := Value;
end;

end.



