{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio Frioli                  }
{ Atualizado Em: 14/08/2006                             }
{                                                       }
{*******************************************************}

unit uDbAcessoMorador;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbAcessoMorador = class(TCmDbObject)
  private
    FIdEstacaoAcesso: TCmDbField;
    FIdAcessoMorador: TCmDbField;
    FIdMorador: TCmDbField;
    FIndFuncao: TCmDbField;
    FSaida: TCmDbField;
    FEntrada: TCmDbField;
    FQtdeVezes: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdAcessoMorador: TCmDbField read FIdAcessoMorador write FIdAcessoMorador;
    property IdMorador: TCmDbField read FIdMorador write FIdMorador;
    property IdEstacaoAcesso: TCmDbField read FIdEstacaoAcesso write FIdEstacaoAcesso;
    property IndFuncao: TCmDbField read FIndFuncao write FIndFuncao;
    property Entrada: TCmDbField read FEntrada write FEntrada;
    property Saida: TCmDbField read FSaida write FSaida;
    property QtdeVezes: TCmDbField read FQtdeVezes write FQtdeVezes;
  end;

implementation

{ TDbAcessoMorador }

constructor TDbAcessoMorador.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ACESSOMORADOR';

  FIdAcessoMorador := CreateCmDbField('IDACESSOMORADOR',ftFloat,true,true,false,true,'');
  FIdMorador := CreateCmDbField('IDMORADOR',ftFloat,false,false,false,true,'');
  FIdEstacaoAcesso := CreateCmDbField('IDESTACAOACESSO',ftFloat,false,false,false,true,'');
  FIndFuncao := CreateCmDbField('INDFUNCAO',ftString,false,false,false,true,'');
  FEntrada := CreateCmDbField('ENTRADA',ftDateTime,false,false,false,true,'',-1,true);
  FSaida := CreateCmDbField('SAIDA',ftDateTime,false,false,false,true,'',-1,true);
  FQtdeVezes := CreateCmDbField('QTDEVEZES',ftFloat,false,false,false,false,'');
end;

function TDbAcessoMorador.Insert: boolean;
begin
  FIdAcessoMorador.asFloat := GetSequence('ACESSOMORADOR');
  Result := inherited Insert;
end;

end.
