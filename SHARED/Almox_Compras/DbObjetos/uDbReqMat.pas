{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 03/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbReqMat;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbReqMat = class(TCmDbObject)

  private
    FDataEmissao: TCmDbField;
    FReqAtendida: TCmDbField;
    FDataNecessidade: TCmDbField;
    FNumRequisicao: TCmDbField;
    FIdPessoa: TCmDbField;
    FObs: TCmDbField;
    FIdEmpresa: TCmDbField;
    FCodalmoxaDestino: TCmDbField;
    FImpresso: TCmDbField;
    FIdUsuarioInclusao: TCmDbField;
    FCodalmoxaOrigem: TCmDbField;
    FUnidNegoc: TCmDbField;
    FIdProcesso: TCmDbField;
    FCustoTransf: TCmDbField;
    FCodCentroCusto: TCmDbField;
    procedure SetCodalmoxaDestino(const Value: TCmDbField);
    procedure SetCodalmoxaOrigem(const Value: TCmDbField);
    procedure SetCodCentroCusto(const Value: TCmDbField);
    procedure SetCustoTransf(const Value: TCmDbField);
    procedure SetDataEmissao(const Value: TCmDbField);
    procedure SetDataNecessidade(const Value: TCmDbField);
    procedure SetIdEmpresa(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetIdProcesso(const Value: TCmDbField);
    procedure SetIdUsuarioInclusao(const Value: TCmDbField);
    procedure SetImpresso(const Value: TCmDbField);
    procedure SetNumRequisicao(const Value: TCmDbField);
    procedure SetObs(const Value: TCmDbField);
    procedure SetReqAtendida(const Value: TCmDbField);
    procedure SetUnidNegoc(const Value: TCmDbField);

  public

     Property UnidNegoc         : TCmDbField read FUnidNegoc write SetUnidNegoc;
     Property ReqAtendida       : TCmDbField read FReqAtendida write SetReqAtendida;
     Property Obs               : TCmDbField read FObs write SetObs;
     Property NumRequisicao     : TCmDbField read FNumRequisicao write SetNumRequisicao;
     Property Impresso          : TCmDbField read FImpresso write SetImpresso;
     Property IdUsuarioInclusao : TCmDbField read FIdUsuarioInclusao write SetIdUsuarioInclusao;
     Property IdProcesso        : TCmDbField read FIdProcesso write SetIdProcesso;
     Property IdPessoa          : TCmDbField read FIdPessoa write SetIdPessoa;
     Property IdEmpresa         : TCmDbField read FIdEmpresa write SetIdEmpresa;
     Property DataNecessidade   : TCmDbField read FDataNecessidade write SetDataNecessidade;
     Property DataEmissao       : TCmDbField read FDataEmissao write SetDataEmissao;
     Property CustoTransf       : TCmDbField read FCustoTransf write SetCustoTransf;
     Property CodCentroCusto    : TCmDbField read FCodCentroCusto write SetCodCentroCusto;
     Property CodalmoxaOrigem   : TCmDbField read FCodalmoxaOrigem write SetCodalmoxaOrigem;
     Property CodalmoxaDestino  : TCmDbField read FCodalmoxaDestino write SetCodalmoxaDestino;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbReqMat }

constructor TDbReqMat.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REQMAT';

  fUnidnegoc         := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'Atividade/Projeto');
  fReqatendida       := CreateCmDbField('REQATENDIDA',ftString,False,False,False,True,'');
  fObs               := CreateCmDbField('OBS',ftString,False,False,False,True,'Observação');
  fNumrequisicao     := CreateCmDbField('NUMREQUISICAO',ftfloat,True,True,False,True,'Nº da Requesição');
  fImpresso          := CreateCmDbField('IMPRESSO',ftString,False,False,False,True,'');
  fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'Usuario solicitante');
  fIdprocesso        := CreateCmDbField('IDPROCESSO',ftfloat,False,False,False,True,'');
  fIdpessoa          := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
  fIdempresa         := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
  fDatanecessidade   := CreateCmDbField('DATANECESSIDADE',ftDateTime,False,False,False,True,'Data de Necessidade');
  fDataemissao       := CreateCmDbField('DATAEMISSAO',ftDateTime,True,False,False,True,'Data de Emissão');
  fCustotransf       := CreateCmDbField('CUSTOTRANSF',ftString,True,False,False,True,'');
  fCodcentrocusto    := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
  fCodalmoxaorigem   := CreateCmDbField('CODALMOXAORIGEM',ftfloat,False,False,False,True,'');
  fCodalmoxadestino  := CreateCmDbField('CODALMOXADESTINO',ftfloat,False,False,False,True,'');
end;

function TDbReqMat.Insert: Boolean;
begin

   fNumrequisicao.AsFloat := GetSequence('REQMAT');
   Result := Inherited Insert;

end;

function TDbReqMat.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbReqMat.SetCodalmoxaDestino(const Value: TCmDbField);
begin
  FCodalmoxaDestino := Value;
end;

procedure TDbReqMat.SetCodalmoxaOrigem(const Value: TCmDbField);
begin
  FCodalmoxaOrigem := Value;
end;

procedure TDbReqMat.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDbReqMat.SetCustoTransf(const Value: TCmDbField);
begin
  FCustoTransf := Value;
end;

procedure TDbReqMat.SetDataEmissao(const Value: TCmDbField);
begin
  FDataEmissao := Value;
end;

procedure TDbReqMat.SetDataNecessidade(const Value: TCmDbField);
begin
  FDataNecessidade := Value;
end;

procedure TDbReqMat.SetIdEmpresa(const Value: TCmDbField);
begin
  FIdEmpresa := Value;
end;

procedure TDbReqMat.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbReqMat.SetIdProcesso(const Value: TCmDbField);
begin
  FIdProcesso := Value;
end;

procedure TDbReqMat.SetIdUsuarioInclusao(const Value: TCmDbField);
begin
  FIdUsuarioInclusao := Value;
end;

procedure TDbReqMat.SetImpresso(const Value: TCmDbField);
begin
  FImpresso := Value;
end;

procedure TDbReqMat.SetNumRequisicao(const Value: TCmDbField);
begin
  FNumRequisicao := Value;
end;

procedure TDbReqMat.SetObs(const Value: TCmDbField);
begin
  FObs := Value;
end;

procedure TDbReqMat.SetReqAtendida(const Value: TCmDbField);
begin
  FReqAtendida := Value;
end;

procedure TDbReqMat.SetUnidNegoc(const Value: TCmDbField);
begin
  FUnidNegoc := Value;
end;

end.



