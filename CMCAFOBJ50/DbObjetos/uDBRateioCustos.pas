{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 21/03/2002                             }
{                                                       }
{*******************************************************}
{
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
SOL         : 200681
Kintana     : 1939514
Responsável : Marcio Sanches Spinosa
Data        : 15/02/2013
Descrição   : Ajuste para quando for alterar ou inserir, o field dtafim aceite nulo
--------------------------------------------------------------------------------
}

unit uDBRateioCustos;

interface
Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBRateioCustos = class(TCmDbObject)

  private
    FDtainicio: TCmDbField;
    FIdconjunto: TCmDbField;
    FDtafim: TCmDbField;
    FIdempresa: TCmDbField;
    FParticipacao: TCmDbField;
    FCodcentrocusto: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetDtafim(const Value: TCmDbField);
    procedure SetDtainicio(const Value: TCmDbField);
    procedure SetIdconjunto(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetParticipacao(const Value: TCmDbField);

  public

    Property Participacao: TCmDbField read FParticipacao write SetParticipacao;
    Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
    Property Idconjunto: TCmDbField read FIdconjunto write SetIdconjunto;
    Property Dtainicio: TCmDbField read FDtainicio write SetDtainicio;
    Property Dtafim: TCmDbField read FDtafim write SetDtafim;
    Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBRateioCustos }

constructor TDBRateioCustos.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'RATEIODEPRECIACAO';

   fParticipacao := CreateCmDbField('PARTICIPACAO',ftfloat,True,False,False,False,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,False,'');
   fIdconjunto := CreateCmDbField('IDCONJUNTO',ftfloat,True,True,False,False,'');
   fDtainicio := CreateCmDbField('DTAINICIO',ftDateTime,True,True,False,False,'');
 //fDtafim := CreateCmDbField('DTAFIM',ftDateTime,False,False,False,False,'');
   fDtafim := CreateCmDbField('DTAFIM',ftDateTime,False,False,False,True,'');//Marcio Sanches Spinosa SOL 200681 Kintana 1939514 
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,True,True,False,False,'');
end;

function TDBRateioCustos.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBRateioCustos.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBRateioCustos.SetCodcentrocusto(const Value: TCmDbField);
begin
   FCodcentrocusto := Value;
end;

procedure TDBRateioCustos.SetDtafim(const Value: TCmDbField);
begin
   FDtafim := Value;
end;

procedure TDBRateioCustos.SetDtainicio(const Value: TCmDbField);
begin
   FDtainicio := Value;
end;

procedure TDBRateioCustos.SetIdconjunto(const Value: TCmDbField);
begin
   FIdconjunto := Value;
end;

procedure TDBRateioCustos.SetIdempresa(const Value: TCmDbField);
begin
   FIdempresa := Value;
end;

procedure TDBRateioCustos.SetParticipacao(const Value: TCmDbField);
begin
   FParticipacao := Value;
end;

end.



