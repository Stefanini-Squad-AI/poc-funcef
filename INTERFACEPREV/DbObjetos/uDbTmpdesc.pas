{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbTmpdesc;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbTmpdesc = class(TCmDbObject)

  private
    FIdregracalculo: TCmDbField;
    FValorbase1: TCmDbField;
    FIdmotivo: TCmDbField;
    FNodocumento: TCmDbField;
    FNumprioridade: TCmDbField;
    FFlgdescfolha: TCmDbField;
    FFlgexistehst: TCmDbField;
    FMesreferencia: TCmDbField;
    FDatarecebimento: TCmDbField;
    FIdpessjur: TCmDbField;
    FValorinfo: TCmDbField;
    FDatacobranca: TCmDbField;
    FIdplanoprev: TCmDbField;
    FDatareferencia: TCmDbField;
    FSistorigem: TCmDbField;
    FIddesconto: TCmDbField;
    FFlgtipodesc: TCmDbField;
    FSeqproposta: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdtitular: TCmDbField;
    FIdprovento: TCmDbField;
    FSitenvio: TCmDbField;
    FValorbase3: TCmDbField;
    FMescobranca: TCmDbField;
    FIdplanass: TCmDbField;
    FDescricao: TCmDbField;
    FValorbase2: TCmDbField;
    FIdpessoa: TCmDbField;
    FValor: TCmDbField;
    FOrdem: TCmDbField;
    FIdlote: TCmDbField;
    FFlgmanual: TCmDbField;
    FInscricaonumero: TCmDbField;
    FCodalterador: TCmDbField;
    FFlgatrasodevol: TCmDbField;
    FCodprovdesc: TCmDbField;
    FFlgalterador: TCmDbField;
    FFlgdesconto: TCmDbField;
    FCompldocumento: TCmDbField;
    FParcela: TCmDbField;
    FValorrecebido: TCmDbField;
    FReferencia: TCmDbField;
    FCodportforma: TCmDbField;
    FMatricula: TCmDbField;
    procedure SetCodalterador(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodprovdesc(const Value: TCmDbField);
    procedure SetCompldocumento(const Value: TCmDbField);
    procedure SetDatacobranca(const Value: TCmDbField);
    procedure SetDatarecebimento(const Value: TCmDbField);
    procedure SetDatareferencia(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetFlgalterador(const Value: TCmDbField);
    procedure SetFlgatrasodevol(const Value: TCmDbField);
    procedure SetFlgdescfolha(const Value: TCmDbField);
    procedure SetFlgdesconto(const Value: TCmDbField);
    procedure SetFlgexistehst(const Value: TCmDbField);
    procedure SetFlgmanual(const Value: TCmDbField);
    procedure SetFlgtipodesc(const Value: TCmDbField);
    procedure SetIddesconto(const Value: TCmDbField);
    procedure SetIdlote(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdmotivo(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanass(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdprovento(const Value: TCmDbField);
    procedure SetIdregracalculo(const Value: TCmDbField);
    procedure SetIdtitular(const Value: TCmDbField);
    procedure SetInscricaonumero(const Value: TCmDbField);
    procedure SetMatricula(const Value: TCmDbField);
    procedure SetMescobranca(const Value: TCmDbField);
    procedure SetMesreferencia(const Value: TCmDbField);
    procedure SetNodocumento(const Value: TCmDbField);
    procedure SetNumprioridade(const Value: TCmDbField);
    procedure SetOrdem(const Value: TCmDbField);
    procedure SetParcela(const Value: TCmDbField);
    procedure SetReferencia(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetSistorigem(const Value: TCmDbField);
    procedure SetSitenvio(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetValorbase1(const Value: TCmDbField);
    procedure SetValorbase2(const Value: TCmDbField);
    procedure SetValorbase3(const Value: TCmDbField);
    procedure SetValorinfo(const Value: TCmDbField);
    procedure SetValorrecebido(const Value: TCmDbField);

  public

     Property Valorrecebido: TCmDbField read FValorrecebido write SetValorrecebido;
     Property Valorinfo: TCmDbField read FValorinfo write SetValorinfo;
     Property Valorbase3: TCmDbField read FValorbase3 write SetValorbase3;
     Property Valorbase2: TCmDbField read FValorbase2 write SetValorbase2;
     Property Valorbase1: TCmDbField read FValorbase1 write SetValorbase1;
     Property Valor: TCmDbField read FValor write SetValor;
     Property Sitenvio: TCmDbField read FSitenvio write SetSitenvio;
     Property Sistorigem: TCmDbField read FSistorigem write SetSistorigem;
     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Referencia: TCmDbField read FReferencia write SetReferencia;
     Property Parcela: TCmDbField read FParcela write SetParcela;
     Property Ordem: TCmDbField read FOrdem write SetOrdem;
     Property Numprioridade: TCmDbField read FNumprioridade write SetNumprioridade;
     Property Nodocumento: TCmDbField read FNodocumento write SetNodocumento;
     Property Mesreferencia: TCmDbField read FMesreferencia write SetMesreferencia;
     Property Mescobranca: TCmDbField read FMescobranca write SetMescobranca;
     Property Matricula: TCmDbField read FMatricula write SetMatricula;
     Property Inscricaonumero: TCmDbField read FInscricaonumero write SetInscricaonumero;
     Property Idtitular: TCmDbField read FIdtitular write SetIdtitular;
     Property Idregracalculo: TCmDbField read FIdregracalculo write SetIdregracalculo;
     Property Idprovento: TCmDbField read FIdprovento write SetIdprovento;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idplanass: TCmDbField read FIdplanass write SetIdplanass;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idmotivo: TCmDbField read FIdmotivo write SetIdmotivo;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idlote: TCmDbField read FIdlote write SetIdlote;
     Property Iddesconto: TCmDbField read FIddesconto write SetIddesconto;
     Property Flgtipodesc: TCmDbField read FFlgtipodesc write SetFlgtipodesc;
     Property Flgmanual: TCmDbField read FFlgmanual write SetFlgmanual;
     Property Flgexistehst: TCmDbField read FFlgexistehst write SetFlgexistehst;
     Property Flgdesconto: TCmDbField read FFlgdesconto write SetFlgdesconto;
     Property Flgdescfolha: TCmDbField read FFlgdescfolha write SetFlgdescfolha;
     Property Flgatrasodevol: TCmDbField read FFlgatrasodevol write SetFlgatrasodevol;
     Property Flgalterador: TCmDbField read FFlgalterador write SetFlgalterador;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Datareferencia: TCmDbField read FDatareferencia write SetDatareferencia;
     Property Datarecebimento: TCmDbField read FDatarecebimento write SetDatarecebimento;
     Property Datacobranca: TCmDbField read FDatacobranca write SetDatacobranca;
     Property Compldocumento: TCmDbField read FCompldocumento write SetCompldocumento;
     Property Codprovdesc: TCmDbField read FCodprovdesc write SetCodprovdesc;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codalterador: TCmDbField read FCodalterador write SetCodalterador;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTmpdesc }

constructor TDbTmpdesc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TMPDESC';

   fValorrecebido := CreateCmDbField('VALORRECEBIDO',ftfloat,False,False,False,True,'');
   fValorinfo := CreateCmDbField('VALORINFO',ftfloat,False,False,False,True,'');
   fValorbase3 := CreateCmDbField('VALORBASE3',ftfloat,False,False,False,True,'');
   fValorbase2 := CreateCmDbField('VALORBASE2',ftfloat,False,False,False,True,'');
   fValorbase1 := CreateCmDbField('VALORBASE1',ftfloat,False,False,False,True,'');
   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   fSitenvio := CreateCmDbField('SITENVIO',ftString,False,False,False,True,'');
   fSistorigem := CreateCmDbField('SISTORIGEM',ftString,False,False,False,True,'');
   fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,False,False,False,True,'');
   fReferencia := CreateCmDbField('REFERENCIA',ftString,False,False,False,True,'');
   fParcela := CreateCmDbField('PARCELA',ftfloat,False,False,False,True,'');
   fOrdem := CreateCmDbField('ORDEM',ftfloat,False,False,False,True,'');
   fNumprioridade := CreateCmDbField('NUMPRIORIDADE',ftfloat,False,False,False,True,'');
   fNodocumento := CreateCmDbField('NODOCUMENTO',ftfloat,False,False,False,True,'');
   fMesreferencia := CreateCmDbField('MESREFERENCIA',ftString,False,False,False,True,'');
   fMescobranca := CreateCmDbField('MESCOBRANCA',ftString,False,False,False,True,'');
   fMatricula := CreateCmDbField('MATRICULA',ftString,False,False,False,True,'');
   fInscricaonumero := CreateCmDbField('INSCRICAONUMERO',ftfloat,False,False,False,True,'');
   fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,False,False,False,True,'');
   fIdregracalculo := CreateCmDbField('IDREGRACALCULO',ftfloat,False,False,False,True,'');
   fIdprovento := CreateCmDbField('IDPROVENTO',ftfloat,False,False,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fIdplanass := CreateCmDbField('IDPLANASS',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,False,False,False,True,'');
   fIdmotivo := CreateCmDbField('IDMOTIVO',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdlote := CreateCmDbField('IDLOTE',ftfloat,False,False,False,True,'');
   fIddesconto := CreateCmDbField('IDDESCONTO',ftfloat,False,False,False,True,'');
   fFlgtipodesc := CreateCmDbField('FLGTIPODESC',ftString,False,False,False,True,'');
   fFlgmanual := CreateCmDbField('FLGMANUAL',ftfloat,False,False,False,True,'');
   fFlgexistehst := CreateCmDbField('FLGEXISTEHST',ftfloat,False,False,False,True,'');
   fFlgdesconto := CreateCmDbField('FLGDESCONTO',ftfloat,False,False,False,True,'');
   fFlgdescfolha := CreateCmDbField('FLGDESCFOLHA',ftString,False,False,False,True,'');
   fFlgatrasodevol := CreateCmDbField('FLGATRASODEVOL',ftString,False,False,False,True,'');
   fFlgalterador := CreateCmDbField('FLGALTERADOR',ftString,False,False,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fDatareferencia := CreateCmDbField('DATAREFERENCIA',ftDateTime,False,False,False,True,'');
   fDatarecebimento := CreateCmDbField('DATARECEBIMENTO',ftDateTime,False,False,False,True,'');
   fDatacobranca := CreateCmDbField('DATACOBRANCA',ftDateTime,False,False,False,True,'');
   fCompldocumento := CreateCmDbField('COMPLDOCUMENTO',ftString,False,False,False,True,'');
   fCodprovdesc := CreateCmDbField('CODPROVDESC',ftString,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,False,False,False,True,'');
end;

function TDbTmpdesc.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbTmpdesc.SetCodalterador(const Value: TCmDbField);
begin
  FCodalterador := Value;
end;

procedure TDbTmpdesc.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbTmpdesc.SetCodprovdesc(const Value: TCmDbField);
begin
  FCodprovdesc := Value;
end;

procedure TDbTmpdesc.SetCompldocumento(const Value: TCmDbField);
begin
  FCompldocumento := Value;
end;

procedure TDbTmpdesc.SetDatacobranca(const Value: TCmDbField);
begin
  FDatacobranca := Value;
end;

procedure TDbTmpdesc.SetDatarecebimento(const Value: TCmDbField);
begin
  FDatarecebimento := Value;
end;

procedure TDbTmpdesc.SetDatareferencia(const Value: TCmDbField);
begin
  FDatareferencia := Value;
end;

procedure TDbTmpdesc.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbTmpdesc.SetFlgalterador(const Value: TCmDbField);
begin
  FFlgalterador := Value;
end;

procedure TDbTmpdesc.SetFlgatrasodevol(const Value: TCmDbField);
begin
  FFlgatrasodevol := Value;
end;

procedure TDbTmpdesc.SetFlgdescfolha(const Value: TCmDbField);
begin
  FFlgdescfolha := Value;
end;

procedure TDbTmpdesc.SetFlgdesconto(const Value: TCmDbField);
begin
  FFlgdesconto := Value;
end;

procedure TDbTmpdesc.SetFlgexistehst(const Value: TCmDbField);
begin
  FFlgexistehst := Value;
end;

procedure TDbTmpdesc.SetFlgmanual(const Value: TCmDbField);
begin
  FFlgmanual := Value;
end;

procedure TDbTmpdesc.SetFlgtipodesc(const Value: TCmDbField);
begin
  FFlgtipodesc := Value;
end;

procedure TDbTmpdesc.SetIddesconto(const Value: TCmDbField);
begin
  FIddesconto := Value;
end;

procedure TDbTmpdesc.SetIdlote(const Value: TCmDbField);
begin
  FIdlote := Value;
end;

procedure TDbTmpdesc.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbTmpdesc.SetIdmotivo(const Value: TCmDbField);
begin
  FIdmotivo := Value;
end;

procedure TDbTmpdesc.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbTmpdesc.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbTmpdesc.SetIdplanass(const Value: TCmDbField);
begin
  FIdplanass := Value;
end;

procedure TDbTmpdesc.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbTmpdesc.SetIdprovento(const Value: TCmDbField);
begin
  FIdprovento := Value;
end;

procedure TDbTmpdesc.SetIdregracalculo(const Value: TCmDbField);
begin
  FIdregracalculo := Value;
end;

procedure TDbTmpdesc.SetIdtitular(const Value: TCmDbField);
begin
  FIdtitular := Value;
end;

procedure TDbTmpdesc.SetInscricaonumero(const Value: TCmDbField);
begin
  FInscricaonumero := Value;
end;

procedure TDbTmpdesc.SetMatricula(const Value: TCmDbField);
begin
  FMatricula := Value;
end;

procedure TDbTmpdesc.SetMescobranca(const Value: TCmDbField);
begin
  FMescobranca := Value;
end;

procedure TDbTmpdesc.SetMesreferencia(const Value: TCmDbField);
begin
  FMesreferencia := Value;
end;

procedure TDbTmpdesc.SetNodocumento(const Value: TCmDbField);
begin
  FNodocumento := Value;
end;

procedure TDbTmpdesc.SetNumprioridade(const Value: TCmDbField);
begin
  FNumprioridade := Value;
end;

procedure TDbTmpdesc.SetOrdem(const Value: TCmDbField);
begin
  FOrdem := Value;
end;

procedure TDbTmpdesc.SetParcela(const Value: TCmDbField);
begin
  FParcela := Value;
end;

procedure TDbTmpdesc.SetReferencia(const Value: TCmDbField);
begin
  FReferencia := Value;
end;

procedure TDbTmpdesc.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDbTmpdesc.SetSistorigem(const Value: TCmDbField);
begin
  FSistorigem := Value;
end;

procedure TDbTmpdesc.SetSitenvio(const Value: TCmDbField);
begin
  FSitenvio := Value;
end;

procedure TDbTmpdesc.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

procedure TDbTmpdesc.SetValorbase1(const Value: TCmDbField);
begin
  FValorbase1 := Value;
end;

procedure TDbTmpdesc.SetValorbase2(const Value: TCmDbField);
begin
  FValorbase2 := Value;
end;

procedure TDbTmpdesc.SetValorbase3(const Value: TCmDbField);
begin
  FValorbase3 := Value;
end;

procedure TDbTmpdesc.SetValorinfo(const Value: TCmDbField);
begin
  FValorinfo := Value;
end;

procedure TDbTmpdesc.SetValorrecebido(const Value: TCmDbField);
begin
  FValorrecebido := Value;
end;

end.



