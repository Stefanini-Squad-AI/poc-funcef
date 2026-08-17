{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbSoliComp;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbSoliComp = class(TCmDbObject)

  private
    FIdProcesso: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FSoliciAceita: TCmDbField;
    FDataEntrega: TCmDbField;
    FNumSolCompra: TCmDbField;
    FAlgumParaEstoque: TCmDbField;
    FImpresso: TCmDbField;
    FNumRequisicao: TCmDbField;
    FCodAlmoxarifado: TCmDbField;
    FIdReservaOrcamen: TCmDbField;
    FSoliciAtendida: TCmDbField;
    FCustoEstoque: TCmDbField;
    FCodCentroRespon: TCmDbField;
    FUnidNegoc: TCmDbField;
    FDataEmissao: TCmDbField;
    FIdPessoa: TCmDbField;
    FFlgPrePronta: TCmDbField;
    FIdEmpresa: TCmDbField;
    procedure SetAlgumParaEstoque(const Value: TCmDbField);
    procedure SetCodAlmoxarifado(const Value: TCmDbField);
    procedure SetCodCentroCusto(const Value: TCmDbField);
    procedure SetCodCentroRespon(const Value: TCmDbField);
    procedure SetCustoEstoque(const Value: TCmDbField);
    procedure SetDataEmissao(const Value: TCmDbField);
    procedure SetDataEntrega(const Value: TCmDbField);
    procedure SetFlgPrePronta(const Value: TCmDbField);
    procedure SetIdEmpresa(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetIdProcesso(const Value: TCmDbField);
    procedure SetIdReservaOrcamen(const Value: TCmDbField);
    procedure SetImpresso(const Value: TCmDbField);
    procedure SetNumRequisicao(const Value: TCmDbField);
    procedure SetNumSolCompra(const Value: TCmDbField);
    procedure SetSoliciAceita(const Value: TCmDbField);
    procedure SetSoliciAtendida(const Value: TCmDbField);
    procedure SetUnidNegoc(const Value: TCmDbField);

  public

     Property UnidNegoc         : TCmDbField read FUnidNegoc write SetUnidNegoc;
     Property SoliciAtendida    : TCmDbField read FSoliciAtendida write SetSoliciAtendida;
     Property SoliciAceita      : TCmDbField read FSoliciAceita write SetSoliciAceita;
     Property NumSolCompra      : TCmDbField read FNumSolCompra write SetNumSolCompra;
     Property NumRequisicao     : TCmDbField read FNumRequisicao write SetNumRequisicao;
     Property Impresso          : TCmDbField read FImpresso write SetImpresso;
     Property IdReservaOrcamen  : TCmDbField read FIdReservaOrcamen write SetIdReservaOrcamen;
     Property IdProcesso        : TCmDbField read FIdProcesso write SetIdProcesso;
     Property IdPessoa          : TCmDbField read FIdPessoa write SetIdPessoa;
     Property IdEmpresa         : TCmDbField read FIdEmpresa write SetIdEmpresa;
     Property FlgPrePronta      : TCmDbField read FFlgPrePronta write SetFlgPrePronta;
     Property DataEntrega       : TCmDbField read FDataEntrega write SetDataEntrega;
     Property DataEmissao       : TCmDbField read FDataEmissao write SetDataEmissao;
     Property CustoEstoque      : TCmDbField read FCustoEstoque write SetCustoEstoque;
     Property CodCentroRespon   : TCmDbField read FCodCentroRespon write SetCodCentroRespon;
     Property CodCentroCusto    : TCmDbField read FCodCentroCusto write SetCodCentroCusto;
     Property CodAlmoxarifado   : TCmDbField read FCodAlmoxarifado write SetCodAlmoxarifado;
     Property AlgumParaEstoque  : TCmDbField read FAlgumParaEstoque write SetAlgumParaEstoque;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSoliComp }

constructor TDbSoliComp.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SOLICOMP';

   fUnidnegoc        := CreateCmDbField('UNIDNEGOC'        ,ftfloat,False,False,False,True,'');
   fSoliciatendida   := CreateCmDbField('SOLICIATENDIDA'   ,ftString,False,False,False,True,'');
   fSoliciaceita     := CreateCmDbField('SOLICIACEITA'     ,ftString,False,False,False,True,'');
   fNumsolcompra     := CreateCmDbField('NUMSOLCOMPRA'     ,ftfloat,True,True,False,True,'');
   fNumrequisicao    := CreateCmDbField('NUMREQUISICAO'    ,ftfloat,False,False,False,True,'');
   fImpresso         := CreateCmDbField('IMPRESSO'         ,ftString,False,False,False,True,'');
   fIdreservaorcamen := CreateCmDbField('IDRESERVAORCAMEN' ,ftfloat,False,False,False,True,'');
   fIdprocesso       := CreateCmDbField('IDPROCESSO'       ,ftfloat,False,False,False,True,'');
   fIdpessoa         := CreateCmDbField('IDPESSOA'         ,ftfloat,False,False,False,True,'');
   fIdempresa        := CreateCmDbField('IDEMPRESA'        ,ftfloat,False,False,False,True,'');
   fFlgprepronta     := CreateCmDbField('FLGPREPRONTA'     ,ftString,False,False,False,True,'');
   fDataentrega      := CreateCmDbField('DATAENTREGA'      ,ftDateTime,False,False,False,True,'');
   fDataemissao      := CreateCmDbField('DATAEMISSAO'      ,ftDateTime,False,False,False,True,'');
   fCustoestoque     := CreateCmDbField('CUSTOESTOQUE'     ,ftString,False,False,False,True,'');
   fCodcentrorespon  := CreateCmDbField('CODCENTRORESPON'  ,ftString,False,False,False,True,'');
   fCodcentrocusto   := CreateCmDbField('CODCENTROCUSTO'   ,ftString,False,False,False,True,'');
   fCodalmoxarifado  := CreateCmDbField('CODALMOXARIFADO'  ,ftfloat,False,False,False,True,'');
   fAlgumparaestoque := CreateCmDbField('ALGUMPARAESTOQUE' ,ftString,False,False,False,True,'');
end;

function TDbSoliComp.Insert: Boolean;
begin

   fNumsolcompra.AsFloat := GetSequence('SOLICOMP');
   Result := Inherited Insert;

end;

function TDbSoliComp.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbSoliComp.SetAlgumParaEstoque(const Value: TCmDbField);
begin
  FAlgumParaEstoque := Value;
end;

procedure TDbSoliComp.SetCodAlmoxarifado(const Value: TCmDbField);
begin
  FCodAlmoxarifado := Value;
end;

procedure TDbSoliComp.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDbSoliComp.SetCodCentroRespon(const Value: TCmDbField);
begin
  FCodCentroRespon := Value;
end;

procedure TDbSoliComp.SetCustoEstoque(const Value: TCmDbField);
begin
  FCustoEstoque := Value;
end;

procedure TDbSoliComp.SetDataEmissao(const Value: TCmDbField);
begin
  FDataEmissao := Value;
end;

procedure TDbSoliComp.SetDataEntrega(const Value: TCmDbField);
begin
  FDataEntrega := Value;
end;

procedure TDbSoliComp.SetFlgPrePronta(const Value: TCmDbField);
begin
  FFlgPrePronta := Value;
end;

procedure TDbSoliComp.SetIdEmpresa(const Value: TCmDbField);
begin
  FIdEmpresa := Value;
end;

procedure TDbSoliComp.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbSoliComp.SetIdProcesso(const Value: TCmDbField);
begin
  FIdProcesso := Value;
end;

procedure TDbSoliComp.SetIdReservaOrcamen(const Value: TCmDbField);
begin
  FIdReservaOrcamen := Value;
end;

procedure TDbSoliComp.SetImpresso(const Value: TCmDbField);
begin
  FImpresso := Value;
end;

procedure TDbSoliComp.SetNumRequisicao(const Value: TCmDbField);
begin
  FNumRequisicao := Value;
end;

procedure TDbSoliComp.SetNumSolCompra(const Value: TCmDbField);
begin
  FNumSolCompra := Value;
end;

procedure TDbSoliComp.SetSoliciAceita(const Value: TCmDbField);
begin
  FSoliciAceita := Value;
end;

procedure TDbSoliComp.SetSoliciAtendida(const Value: TCmDbField);
begin
  FSoliciAtendida := Value;
end;

procedure TDbSoliComp.SetUnidNegoc(const Value: TCmDbField);
begin
  FUnidNegoc := Value;
end;

end.



