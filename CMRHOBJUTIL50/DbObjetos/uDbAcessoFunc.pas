{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 24/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbAcessoFunc;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbAcessoFunc = class(TCmDbObject)
  private
    FFlgAbonado: TCmDbField;
    FIdEstacaoAcesso: TCmDbField;
    FIdAcessoFunc: TCmDbField;
    FIdPessoa: TCmDbField;
    FIndFuncao: TCmDbField;
    FSaida: TCmDbField;
    FEntrada: TCmDbField;
    FQtdeVezes: TCmDbField;
    FIndPassagem: TCmDbField;
    FSaidaIntervalo: TCmDbField;
    FRetornoIntervalo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdAcessoFunc: TCmDbField read FIdAcessoFunc write FIdAcessoFunc;
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdEstacaoAcesso: TCmDbField read FIdEstacaoAcesso write FIdEstacaoAcesso;
    property IndFuncao: TCmDbField read FIndFuncao write FIndFuncao;
    property FlgAbonado: TCmDbField read FFlgAbonado write FFlgAbonado;
    property Entrada: TCmDbField read FEntrada write FEntrada;
    property Saida: TCmDbField read FSaida write FSaida;
    property QtdeVezes: TCmDbField read FQtdeVezes write FQtdeVezes;
    property IndPassagem: TCmDbField read FIndPassagem write FIndPassagem;
    property SaidaIntervalo: TCmDbField read FSaidaIntervalo write FSaidaIntervalo;
    property RetornoIntervalo: TCmDbField read FRetornoIntervalo write FRetornoIntervalo;
  end;

implementation

{ TDbAcessoFunc }

constructor TDbAcessoFunc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ACESSOFUNC';

  FIdAcessoFunc := CreateCmDbField('IDACESSOFUNC',ftFloat,true,true,false,true,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,false,false,false,true,'');
  FIdEstacaoAcesso := CreateCmDbField('IDESTACAOACESSO',ftFloat,false,false,false,true,'');
  FIndFuncao := CreateCmDbField('INDFUNCAO',ftString,false,false,false,true,'');
  FFlgAbonado := CreateCmDbField('FLGABONADO',ftFloat,false,false,false,false,'');
  FEntrada := CreateCmDbField('ENTRADA',ftDateTime,false,false,false,true,'',-1,true);
  FSaida := CreateCmDbField('SAIDA',ftDateTime,false,false,false,true,'',-1,true);
  FQtdeVezes := CreateCmDbField('QTDEVEZES',ftFloat,false,false,false,false,'');
  FIndPassagem := CreateCmDbField('INDPASSAGEM',ftString,false,false,false,true,'');
  FSaidaIntervalo := CreateCmDbField('SAIDAINTERVALO',ftDateTime,false,false,false,true,'',-1,true);
  FRetornoIntervalo := CreateCmDbField('RETORNOINTERVALO',ftDateTime,false,false,false,true,'',-1,true);
end;

function TDbAcessoFunc.Insert: boolean;
begin
  FIdAcessoFunc.asFloat := GetSequence('ACESSOFUNC');
  Result := inherited Insert;
end;

end.
