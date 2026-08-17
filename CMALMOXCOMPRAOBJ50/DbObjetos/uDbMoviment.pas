{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 05/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbMoviment;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbMoviment = class(TCmDbObject)

  private
    FCodAlmoxTransf: TCmDbField;
    FQtdeMov: TCmDbField;
    FDataMov: TCmDbField;
    FCodTipoMov: TCmDbField;
    FCodAlmoxarifado: TCmDbField;
    FCustoMedioMov: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FDataLancMov: TCmDbField;
    FIdEmpresa: TCmDbField;
    FValorMov: TCmDbField;
    FUnidNegoc: TCmDbField;
    FIdMov: TCmDbField;
    FCodArtigo: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdtipoPerda: TCmDbField;
    FNumDocumento: TCmDbField;
    FSaldoQtdeMov: TCmDbField;
    FPlnCodigo: TCmDbField;
    FFlgEntradaCusto: TCmDbField;
    FIdMovEntrada: TCmDbField;
    procedure SetCodAlmoxarifado(const Value: TCmDbField);
    procedure SetCodAlmoxTransf(const Value: TCmDbField);
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetCodCentroCusto(const Value: TCmDbField);
    procedure SetCodTipoMov(const Value: TCmDbField);
    procedure SetCustoMedioMov(const Value: TCmDbField);
    procedure SetDataLancMov(const Value: TCmDbField);
    procedure SetDataMov(const Value: TCmDbField);
    procedure SetFlgEntradaCusto(const Value: TCmDbField);
    procedure SetIdEmpresa(const Value: TCmDbField);
    procedure SetIdMov(const Value: TCmDbField);
    procedure SetIdMovEntrada(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetIdtipoPerda(const Value: TCmDbField);
    procedure SetNumDocumento(const Value: TCmDbField);
    procedure SetPlnCodigo(const Value: TCmDbField);
    procedure SetQtdeMov(const Value: TCmDbField);
    procedure SetSaldoQtdeMov(const Value: TCmDbField);
    procedure SetUnidNegoc(const Value: TCmDbField);
    procedure SetValorMov(const Value: TCmDbField);

  public

     Property ValorMov        : TCmDbField read FValorMov write SetValorMov;
     Property UnidNegoc       : TCmDbField read FUnidNegoc write SetUnidNegoc;
     Property SaldoQtdeMov    : TCmDbField read FSaldoQtdeMov write SetSaldoQtdeMov;
     Property QtdeMov         : TCmDbField read FQtdeMov write SetQtdeMov;
     Property PlnCodigo       : TCmDbField read FPlnCodigo write SetPlnCodigo;
     Property NumDocumento    : TCmDbField read FNumDocumento write SetNumDocumento;
     Property IdtipoPerda     : TCmDbField read FIdtipoPerda write SetIdtipoPerda;
     Property IdPessoa        : TCmDbField read FIdPessoa write SetIdPessoa;
     Property IdMovEntrada    : TCmDbField read FIdMovEntrada write SetIdMovEntrada;
     Property IdMov           : TCmDbField read FIdMov write SetIdMov;
     Property IdEmpresa       : TCmDbField read FIdEmpresa write SetIdEmpresa;
     Property FlgEntradaCusto : TCmDbField read FFlgEntradaCusto write SetFlgEntradaCusto;
     Property DataMov         : TCmDbField read FDataMov write SetDataMov;
     Property DataLancMov     : TCmDbField read FDataLancMov write SetDataLancMov;
     Property CustoMedioMov   : TCmDbField read FCustoMedioMov write SetCustoMedioMov;
     Property CodTipoMov      : TCmDbField read FCodTipoMov write SetCodTipoMov;
     Property CodCentroCusto  : TCmDbField read FCodCentroCusto write SetCodCentroCusto;
     Property CodArtigo       : TCmDbField read FCodArtigo write SetCodArtigo;
     Property CodAlmoxTransf  : TCmDbField read FCodAlmoxTransf write SetCodAlmoxTransf;
     Property CodAlmoxarifado : TCmDbField read FCodAlmoxarifado write SetCodAlmoxarifado;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbMoviment }

constructor TDbMoviment.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MOVIMENT';

   fValormov        := CreateCmDbField('VALORMOV',ftfloat,False,False,False,False,'Valor Movimentado');
   fUnidnegoc       := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'Atividade/Projeto');
   fSaldoqtdemov    := CreateCmDbField('SALDOQTDEMOV',ftfloat,False,False,False,False,'Saldo em Quantidade');
   fQtdemov         := CreateCmDbField('QTDEMOV',ftfloat,False,False,False,False,'Quantidade Movimentada');
   fPlncodigo       := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'Planilha');
   fNumdocumento    := CreateCmDbField('NUMDOCUMENTO',ftString,False,False,False,True,'Nº do Documento');
   fIdtipoperda     := CreateCmDbField('IDTIPOPERDA',ftfloat,False,False,False,True,'');
   fIdpessoa        := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'Empresa');
   fIdmoventrada    := CreateCmDbField('IDMOVENTRADA',ftfloat,False,False,False,True,'');
   fIdmov           := CreateCmDbField('IDMOV',ftfloat,True,True,False,True,'Id do movimento');
   fIdempresa       := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fFlgentradacusto := CreateCmDbField('FLGENTRADACUSTO',ftString,True,False,False,True,'Entrada/Custo');
   fDatamov         := CreateCmDbField('DATAMOV',ftDateTime,False,False,False,True,'Data da Movimentação');
   fDatalancmov     := CreateCmDbField('DATALANCMOV',ftDateTime,False,False,False,True,'Data do Lancamento');
   fCustomediomov   := CreateCmDbField('CUSTOMEDIOMOV',ftfloat,False,False,False,False,'Custo médio');
   fCodtipomov      := CreateCmDbField('CODTIPOMOV',ftString,False,False,False,True,'Tipo da Movimentação');
   fCodcentrocusto  := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'Centro de Custo');
   fCodartigo       := CreateCmDbField('CODARTIGO',ftString,False,False,False,True,'Código do Artigo');
   fCodalmoxtransf  := CreateCmDbField('CODALMOXTRANSF',ftfloat,False,False,False,True,'Almoxarifado de Transferência');
   fCodalmoxarifado := CreateCmDbField('CODALMOXARIFADO',ftfloat,False,False,False,True,'Almoxarifado de Origem');
end;

function TDbMoviment.Insert: Boolean;
begin

   fIdmov.AsFloat := GetSequence('MOVIMENT');

   Result := Inherited Insert;

end;

function TDbMoviment.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbMoviment.SetCodAlmoxarifado(const Value: TCmDbField);
begin
  FCodAlmoxarifado := Value;
end;

procedure TDbMoviment.SetCodAlmoxTransf(const Value: TCmDbField);
begin
  FCodAlmoxTransf := Value;
end;

procedure TDbMoviment.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbMoviment.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDbMoviment.SetCodTipoMov(const Value: TCmDbField);
begin
  FCodTipoMov := Value;
end;

procedure TDbMoviment.SetCustoMedioMov(const Value: TCmDbField);
begin
  FCustoMedioMov := Value;
end;

procedure TDbMoviment.SetDataLancMov(const Value: TCmDbField);
begin
  FDataLancMov := Value;
end;

procedure TDbMoviment.SetDataMov(const Value: TCmDbField);
begin
  FDataMov := Value;
end;

procedure TDbMoviment.SetFlgEntradaCusto(const Value: TCmDbField);
begin
  FFlgEntradaCusto := Value;
end;

procedure TDbMoviment.SetIdEmpresa(const Value: TCmDbField);
begin
  FIdEmpresa := Value;
end;

procedure TDbMoviment.SetIdMov(const Value: TCmDbField);
begin
  FIdMov := Value;
end;

procedure TDbMoviment.SetIdMovEntrada(const Value: TCmDbField);
begin
  FIdMovEntrada := Value;
end;

procedure TDbMoviment.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbMoviment.SetIdtipoPerda(const Value: TCmDbField);
begin
  FIdtipoPerda := Value;
end;

procedure TDbMoviment.SetNumDocumento(const Value: TCmDbField);
begin
  FNumDocumento := Value;
end;

procedure TDbMoviment.SetPlnCodigo(const Value: TCmDbField);
begin
  FPlnCodigo := Value;
end;

procedure TDbMoviment.SetQtdeMov(const Value: TCmDbField);
begin
  FQtdeMov := Value;
end;

procedure TDbMoviment.SetSaldoQtdeMov(const Value: TCmDbField);
begin
  FSaldoQtdeMov := Value;
end;

procedure TDbMoviment.SetUnidNegoc(const Value: TCmDbField);
begin
  FUnidNegoc := Value;
end;

procedure TDbMoviment.SetValorMov(const Value: TCmDbField);
begin
  FValorMov := Value;
end;

end.



