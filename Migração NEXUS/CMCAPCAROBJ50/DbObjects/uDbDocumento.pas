{-------------------------------------------------------------------------------
---------------------------- ALTERAÇÕES ----------------------------------------
--------------------------------------------------------------------------------
 N. Solicitação: WO14157/WO14159
 Dt Alteração..: 10/10/2024
 Responsável...: Luis Ferrari
 Descrição.....: Nova Aba de Informações Judiciais. Novos campos
--------------------------------------------------------------------------------
 N. SIG.............: 133236
 Data da Alteração..: 27/04/2023
 Responsável........: Cássio Florencio Rovaroto
 Descrição..........: Inclusão do campo NfsServico.
--------------------------------------------------------------------------------
 N. SIG.............: 118992 e 118993
 Data da Alteração..: 17/09/2021
 Responsável........: Everson Cunha
 Descrição..........: Inclusão do campo Cod. Dossiê
--------------------------------------------------------------------------------
 Rotina             : Create
 N. SIG..........   : 23656.57673
 Data da Alteração: : 01/11/2017
 Alteração Form:    : uDbDocumento
 Responsável:       : Cássio Rovaroto
 Descrição.......   : Inclusão dos campos NFSNUMERO, NFSSERIE, NFSDATAEMISSAO e
                      NFSOBS
--------------------------------------------------------------------------------
 N. Sol..........: 136242
 N. Kintana......: 813941
 Data............: 16/12/2011
 Responsável.....: Fábio Henrique Beccaria Sampaio
 Descrição.......: Implementação das FLAGs FLGSimples e FLGEspecial
--------------------------------------------------------------------------------
 andré tavares - pendência 20316 - 24/01/2006
--------------------------------------------------------------------------------
 Data      : 12/01/2004
 Autor     : André Tavares
 Pendência : 20316 - Criação da coluna PlacontaAnt - para contabilização da
             baixa anterior à data de Vencimento do documento.
--------------------------------------------------------------------------------
Data      : 12/01/2004
Autor     : Alex Pereira
Pendência : 14451 - Nova segregação de recursos
Descrição : Inserir os atributo IDSEGREGACRITER
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 04/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbDocumento;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbDocumento = class(TCmDbObject)
  private
    FNumleitcodbarras: TCmDbField;
    FIdpessoa: TCmDbField;
    FIndicecorrecao: TCmDbField;
    FValordesconto: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FDatavencto: TCmDbField;
    FCoddocumento: TCmDbField;
    FGrupodoc: TCmDbField;
    FDatalimite: TCmDbField;
    FNumcpbaixa: TCmDbField;
    FValorjuros: TCmDbField;
    FNodocumento: TCmDbField;
    FFlgnaoconciliado: TCmDbField;
    FNumapgr: TCmDbField;
    FDataremessa: TCmDbField;
    FIdmodulo: TCmDbField;
    FCodgeradorinss: TCmDbField;
    FCodforma: TCmDbField;
    FPercjurosatuarial: TCmDbField;
    FPlano: TCmDbField;
    FNossonumero: TCmDbField;
    FCodgrupocnab: TCmDbField;
    FCodtipdoc: TCmDbField;
    FStatus: TCmDbField;
    FControleremessa: TCmDbField;
    FDataemissao: TCmDbField;
    FCodsubconta: TCmDbField;
    FIdempresa: TCmDbField;
    FNumslip: TCmDbField;
    FNumdigcodbarras: TCmDbField;
    FMoecodigo: TCmDbField;
    FFlgemitelancbaix: TCmDbField;
    FDatacorrecao: TCmDbField;
    FPlaconta: TCmDbField;
    FCompldocumento: TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FIdcbancaria: TCmDbField;
    FOperacao: TCmDbField;
    FRecpag: TCmDbField;
    FFlgconfirmarecpag: TCmDbField;
    FEmisbloq: TCmDbField;
    FNumfatura: TCmDbField;
    FIdforcli: TCmDbField;
    FVlrmulta: TCmDbField;
    FCodportforma: TCmDbField;
    FDataprogramada: TCmDbField;
    FUnidnegoc: TCmDbField;
    FReferencia: TCmDbField;
    FObs: TCmDbField;
    FPercjurossimples: TCmDbField;
    FDataDisponib: TCmDbField;
    FIdsegregacriter: TCmDbField;
    FPlacontaAnt: TCmDbField;
    FQtdeCotas: TCmDbField;
    FFlgSimples: TCmDbField;
    FFlgEspecial: TCmDbField;
    FNfsSerie: TCmDbField;
    FNfsNumero: TCmDbField;
    FNfsDataEmissao: TCmDbField;
    FNfsObs: TCmDbField;
    FCodDossie: TCmDbField;
    FNfsServico: TCmDbField;
    FNumProcesso: TCmDbField;
    FParteFuncef: TCmDbField;
    FParteContraria: TCmDbField;

    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodforma(const Value: TCmDbField);
    procedure SetCodgeradorinss(const Value: TCmDbField);
    procedure SetCodgrupocnab(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetCodtipdoc(const Value: TCmDbField);
    procedure SetCompldocumento(const Value: TCmDbField);
    procedure SetControleremessa(const Value: TCmDbField);
    procedure SetDatacorrecao(const Value: TCmDbField);
    procedure SetDataemissao(const Value: TCmDbField);
    procedure SetDatalimite(const Value: TCmDbField);
    procedure SetDataprogramada(const Value: TCmDbField);
    procedure SetDataremessa(const Value: TCmDbField);
    procedure SetDatavencto(const Value: TCmDbField);
    procedure SetEmisbloq(const Value: TCmDbField);
    procedure SetFlgconfirmarecpag(const Value: TCmDbField);
    procedure SetFlgemitelancbaix(const Value: TCmDbField);
    procedure SetFlgnaoconciliado(const Value: TCmDbField);
    procedure SetGrupodoc(const Value: TCmDbField);
    procedure SetIdcbancaria(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetIndicecorrecao(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetNodocumento(const Value: TCmDbField);
    procedure SetNossonumero(const Value: TCmDbField);
    procedure SetNumapgr(const Value: TCmDbField);
    procedure SetNumcpbaixa(const Value: TCmDbField);
    procedure SetNumdigcodbarras(const Value: TCmDbField);
    procedure SetNumfatura(const Value: TCmDbField);
    procedure SetNumleitcodbarras(const Value: TCmDbField);
    procedure SetNumslip(const Value: TCmDbField);
    procedure SetObs(const Value: TCmDbField);
    procedure SetOperacao(const Value: TCmDbField);
    procedure SetPercjurosatuarial(const Value: TCmDbField);
    procedure SetPercjurossimples(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetReferencia(const Value: TCmDbField);
    procedure SetStatus(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetValordesconto(const Value: TCmDbField);
    procedure SetValorjuros(const Value: TCmDbField);
    procedure SetVlrmulta(const Value: TCmDbField);
    procedure SetDataDisponib(const Value: TCmDbField);
    procedure SetIdsegregacriter(const Value: TCmDbField);
    procedure SetPlacontaAnt(const Value: TCmDbField);
    procedure SetQtdeCotas(const Value: TCmDbField);
    procedure SetFlgSimples(const Value: TCmDbField);
    procedure SetFlgEspecial(const Value: TCmDbField);
    procedure SetNfsDataEmissao(const Value: TCmDbField);
    procedure SetNfsNumero(const Value: TCmDbField);
    procedure SetNfsObs(const Value: TCmDbField);
    procedure SetNfsSerie(const Value: TCmDbField);
    procedure SetCodDossie(const Value: TCmDbField);
    procedure SetNfsServico(const Value: TCmDbField);

    procedure SetNumProcesso(const Value: TCmDbField);
    procedure SetParteFuncef(const Value: TCmDbField);
    procedure SetParteContraria(const Value: TCmDbField);

  public

     Property Vlrmulta: TCmDbField read FVlrmulta write SetVlrmulta;
     Property Valorjuros: TCmDbField read FValorjuros write SetValorjuros;
     Property Valordesconto: TCmDbField read FValordesconto write SetValordesconto;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Status: TCmDbField read FStatus write SetStatus;
     Property Referencia: TCmDbField read FReferencia write SetReferencia;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Percjurossimples: TCmDbField read FPercjurossimples write SetPercjurossimples;
     Property Percjurosatuarial: TCmDbField read FPercjurosatuarial write SetPercjurosatuarial;
     Property Operacao: TCmDbField read FOperacao write SetOperacao;
     Property Obs: TCmDbField read FObs write SetObs;
     Property Numslip: TCmDbField read FNumslip write SetNumslip;
     Property Numleitcodbarras: TCmDbField read FNumleitcodbarras write SetNumleitcodbarras;
     Property Numfatura: TCmDbField read FNumfatura write SetNumfatura;
     Property Numdigcodbarras: TCmDbField read FNumdigcodbarras write SetNumdigcodbarras;
     Property Numcpbaixa: TCmDbField read FNumcpbaixa write SetNumcpbaixa;
     Property Numapgr: TCmDbField read FNumapgr write SetNumapgr;
     Property Nossonumero: TCmDbField read FNossonumero write SetNossonumero;
     Property Nodocumento: TCmDbField read FNodocumento write SetNodocumento;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Indicecorrecao: TCmDbField read FIndicecorrecao write SetIndicecorrecao;
     Property Idusuarioinclusao: TCmDbField read FIdusuarioinclusao write SetIdusuarioinclusao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idcbancaria: TCmDbField read FIdcbancaria write SetIdcbancaria;
     Property Grupodoc: TCmDbField read FGrupodoc write SetGrupodoc;
     Property Flgnaoconciliado: TCmDbField read FFlgnaoconciliado write SetFlgnaoconciliado;
     Property Flgemitelancbaix: TCmDbField read FFlgemitelancbaix write SetFlgemitelancbaix;
     Property Flgconfirmarecpag: TCmDbField read FFlgconfirmarecpag write SetFlgconfirmarecpag;
     Property Emisbloq: TCmDbField read FEmisbloq write SetEmisbloq;
     Property Datavencto: TCmDbField read FDatavencto write SetDatavencto;
     Property Dataremessa: TCmDbField read FDataremessa write SetDataremessa;
     Property Dataprogramada: TCmDbField read FDataprogramada write SetDataprogramada;
     Property Datalimite: TCmDbField read FDatalimite write SetDatalimite;
     Property Dataemissao: TCmDbField read FDataemissao write SetDataemissao;
     Property Datacorrecao: TCmDbField read FDatacorrecao write SetDatacorrecao;
     Property Controleremessa: TCmDbField read FControleremessa write SetControleremessa;
     Property Compldocumento: TCmDbField read FCompldocumento write SetCompldocumento;
     Property Codtipdoc: TCmDbField read FCodtipdoc write SetCodtipdoc;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codgrupocnab: TCmDbField read FCodgrupocnab write SetCodgrupocnab;
     Property Codgeradorinss: TCmDbField read FCodgeradorinss write SetCodgeradorinss;
     Property Codforma: TCmDbField read FCodforma write SetCodforma;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property DataDisponib: TCmDbField read FDataDisponib write SetDataDisponib;
     // 12/01/04 Alex 14451
     Property Idsegregacriter: TCmDbField read FIdsegregacriter write SetIdsegregacriter;
     // fim 12/01/04 Alex 14451

     // andré tavares - pendência 20316 - 24/01/2006 - para contabilização da baixa anterior à data de Vencimento do documento.
     Property PlacontaAnt: TCmDbField read FPlacontaAnt write SetPlacontaAnt;

     //amf 12.04.2007 22592
     property QtdeCotas: TCmDbField read FQtdeCotas write SetQtdeCotas;

     // Início Sol: 136242 Ktn: 813941 - FHBS
     property FlgSimples: TCmDbField read FFlgSimples write SetFlgSimples;
     property FlgEspecial: TCmDbField read FFlgEspecial write SetFlgEspecial;
     // Fim Sol: 136242 Ktn: 813941 - FHBS

     //Cássio Rovaroto - SIG nº 23656.57673 - Início
     property NfsNumero: TCmDbField read FNfsNumero write SetNfsNumero;
     property NfsSerie: TCmDbField read FNfsSerie write SetNfsSerie;
     property NfsDataEmissao: TCmDbField read FNfsDataEmissao write SetNfsDataEmissao;
     PROPERTY NfsObs: TCmDbField read FNfsObs write SetNfsObs;
     //Cássio Rovaroto - SIG nº 23656.57673 - Fim

     property NfsServico: TCmDbField read FNfsServico write SetNfsServico;

     property CodDossie: TCmDbField read FCodDossie write SetCodDossie; //Everson Cunha - SIG118992 e 118993

     property NumProcesso: TCmDbField read FNumProcesso write SetNumProcesso; // WO14157/159 Ferrari
     property ParteFuncef: TCmDbField read FParteFuncef write SetParteFuncef; // WO14157/159 Ferrari
     property ParteContraria: TCmDbField read FParteContraria write SetParteContraria; // WO14157/159 Ferrari

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     function Insert: Boolean; Override;
  End;

implementation

{ TDbDocumento }

constructor TDbDocumento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DOCUMENTO';

  fVlrmulta := CreateCmDbField('VLRMULTA',ftfloat,False,False,False,True,'');
  fValorjuros := CreateCmDbField('VALORJUROS',ftfloat,False,False,False,True,'');
  fValordesconto := CreateCmDbField('VALORDESCONTO',ftfloat,False,False,False,True,'');
  fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
  fStatus := CreateCmDbField('STATUS',ftString,True,False,False,True,'');
  fReferencia := CreateCmDbField('REFERENCIA',ftString,False,False,False,True,'');
  fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
  fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
  fPlaconta := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
  fPercjurossimples := CreateCmDbField('PERCJUROSSIMPLES',ftfloat,False,False,False,True,'');
  fPercjurosatuarial := CreateCmDbField('PERCJUROSATUARIAL',ftfloat,False,False,False,True,'');
  fOperacao := CreateCmDbField('OPERACAO',ftString,True,False,False,True,'');
  fObs := CreateCmDbField('OBS',ftString,False,False,False,True,'');
  fNumslip := CreateCmDbField('NUMSLIP',ftString,False,False,False,True,'');
  fNumleitcodbarras := CreateCmDbField('NUMLEITCODBARRAS',ftString,False,False,False,True,'');
  fNumfatura := CreateCmDbField('NUMFATURA',ftfloat,False,False,False,True,'');
  fNumdigcodbarras := CreateCmDbField('NUMDIGCODBARRAS',ftString,False,False,False,True,'');
  fNumcpbaixa := CreateCmDbField('NUMCPBAIXA',ftfloat,False,False,False,True,'');
  fNumapgr := CreateCmDbField('NUMAPGR',ftfloat,False,False,False,True,'');
  fNossonumero := CreateCmDbField('NOSSONUMERO',ftString,False,False,False,True,'');
  fNodocumento := CreateCmDbField('NODOCUMENTO',ftfloat,False,False,False,True,'');
  fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
  fIndicecorrecao := CreateCmDbField('INDICECORRECAO',ftfloat,False,False,False,True,'');
  fIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True,'');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
  fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
  fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
  fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
  fIdcbancaria := CreateCmDbField('IDCBANCARIA',ftfloat,False,False,False,True,'');
  fGrupodoc := CreateCmDbField('GRUPODOC',ftString,False,False,False,True,'');
  fFlgnaoconciliado := CreateCmDbField('FLGNAOCONCILIADO',ftfloat,False,False,False,True,'');
  fFlgemitelancbaix := CreateCmDbField('FLGEMITELANCBAIX',ftString,False,False,False,True,'');
  fFlgconfirmarecpag := CreateCmDbField('FLGCONFIRMARECPAG',ftString,False,False,False,True,'');
  fEmisbloq := CreateCmDbField('EMISBLOQ',ftString,False,False,False,True,'');
  fDatavencto := CreateCmDbField('DATAVENCTO',ftDateTime,False,False,False,True,'');
  fDataremessa := CreateCmDbField('DATAREMESSA',ftDateTime,False,False,False,True,'');
  fDataprogramada := CreateCmDbField('DATAPROGRAMADA',ftDateTime,False,False,False,True,'');
  fDatalimite := CreateCmDbField('DATALIMITE',ftDateTime,False,False,False,True,'');
  fDataemissao := CreateCmDbField('DATAEMISSAO',ftDateTime,False,False,False,True,'');
  fDatacorrecao := CreateCmDbField('DATACORRECAO',ftDateTime,False,False,False,True,'');
  fControleremessa := CreateCmDbField('CONTROLEREMESSA',ftfloat,False,False,False,True,'');
  fCompldocumento := CreateCmDbField('COMPLDOCUMENTO',ftString,False,False,False,True,'');
  fCodtipdoc := CreateCmDbField('CODTIPDOC',ftfloat,True,False,False,True,'');
  fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
  fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
  fCodgrupocnab := CreateCmDbField('CODGRUPOCNAB',ftfloat,False,False,False,True,'');
  fCodgeradorinss := CreateCmDbField('CODGERADORINSS',ftfloat,False,False,False,True,'');
  fCodforma := CreateCmDbField('CODFORMA',ftfloat,False,False,False,True,'');
  fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,True,True,False,True,'');
  fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
  FDataDisponib := CreateCmDbField('DATADISPONIB',ftDateTime,False,False,False,True,'');
  // 12/01/04 Alex 14451
  FIdsegregacriter := CreateCmDbField('IDSEGREGACRITER',ftfloat,False,False,False,True,'');
  // FIM 12/01/04 Alex 14451

  // andré tavares - pendência 20316 - 24/01/2006
  FPlacontaAnt := CreateCmDbField('PLACONTAANT',ftString,False,False,False,True,'');

  //amf 12.04.2007 22592
  FQtdeCotas   := CreateCmDbField('QTDECOTAS', ftfloat,False,False,False,False,'');

  // Início Sol: 136242 Ktn: 813941 - FHBS
  FlgSimples   := CreateCmDbField('FLGSIMPLES', ftString,False,False,False,False,'');
  FlgEspecial  := CreateCmDbField('FLGESPECIAL', ftString,False,False,False,False,'');

  //Cássio Rovaroto - SIG nº 23656.57673 - Início
  NfsNumero := CreateCmDbField('NFSNUMERO', ftString, false, false, false, True, '');
  NfsSerie := CreateCmDbField('NFSSERIE', ftString, False, False, False, True, '');
  NfsDataEmissao := CreateCmDbField('NFSDATAEMISSAO', ftDateTime, False, False, False, True, '');
  NfsObs := CreateCmDbField('NFSOBS', ftString, False, False, False, True, '');
  //Cássio Rovaroto - SIG nº 23656.57673 - Fim

  CodDossie := CreateCmDbField('CODDOSSIE', ftString, False, False, False, True, ''); //Everson Cunha - SIG118992 e 118993
  NfsServico := CreateCmDbField('NFSSERVICO', ftInteger, False, False, False, True, '');

  NumProcesso := CreateCmDbField('NUMPROCESSO', ftString, False, False, False, True, ''); // WO14157/159 Ferrari
  ParteFuncef := CreateCmDbField('PARTEFUNCEF', ftString, False, False, False, True, ''); // WO14157/159 Ferrari
  ParteContraria := CreateCmDbField('PARTECONTRARIA', ftString, False, False, False, True, ''); // WO14157/159 Ferrari

end;

function TDbDocumento.Insert: Boolean;
begin
   // 31/10/2003 - Vinícius
   // Mantém o CodDocumento passado na função da CtrlDocumento.SetValues
   if fCoddocumento.AsFloat = 0 then
     fCoddocumento.AsFloat := GetSequence('DOCUMENTO');

   Result := Inherited Insert;
end;

procedure TDbDocumento.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbDocumento.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbDocumento.SetCodforma(const Value: TCmDbField);
begin
  FCodforma := Value;
end;

procedure TDbDocumento.SetCodgeradorinss(const Value: TCmDbField);
begin
  FCodgeradorinss := Value;
end;

procedure TDbDocumento.SetCodgrupocnab(const Value: TCmDbField);
begin
  FCodgrupocnab := Value;
end;

procedure TDbDocumento.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbDocumento.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbDocumento.SetCodtipdoc(const Value: TCmDbField);
begin
  FCodtipdoc := Value;
end;

procedure TDbDocumento.SetCompldocumento(const Value: TCmDbField);
begin
  FCompldocumento := Value;
end;

procedure TDbDocumento.SetControleremessa(const Value: TCmDbField);
begin
  FControleremessa := Value;
end;

procedure TDbDocumento.SetDatacorrecao(const Value: TCmDbField);
begin
  FDatacorrecao := Value;
end;

procedure TDbDocumento.SetDataDisponib(const Value: TCmDbField);
begin
  FDataDisponib := Value;
end;

procedure TDbDocumento.SetDataemissao(const Value: TCmDbField);
begin
  FDataemissao := Value;
end;

procedure TDbDocumento.SetDatalimite(const Value: TCmDbField);
begin
  FDatalimite := Value;
end;

procedure TDbDocumento.SetDataprogramada(const Value: TCmDbField);
begin
  FDataprogramada := Value;
end;

procedure TDbDocumento.SetDataremessa(const Value: TCmDbField);
begin
  FDataremessa := Value;
end;

procedure TDbDocumento.SetDatavencto(const Value: TCmDbField);
begin
  FDatavencto := Value;
end;

procedure TDbDocumento.SetEmisbloq(const Value: TCmDbField);
begin
  FEmisbloq := Value;
end;

procedure TDbDocumento.SetFlgconfirmarecpag(const Value: TCmDbField);
begin
  FFlgconfirmarecpag := Value;
end;

procedure TDbDocumento.SetFlgemitelancbaix(const Value: TCmDbField);
begin
  FFlgemitelancbaix := Value;
end;

procedure TDbDocumento.SetFlgnaoconciliado(const Value: TCmDbField);
begin
  FFlgnaoconciliado := Value;
end;

procedure TDbDocumento.SetGrupodoc(const Value: TCmDbField);
begin
  FGrupodoc := Value;
end;

procedure TDbDocumento.SetIdcbancaria(const Value: TCmDbField);
begin
  FIdcbancaria := Value;
end;

procedure TDbDocumento.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbDocumento.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbDocumento.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbDocumento.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbDocumento.SetIdsegregacriter(const Value: TCmDbField);
begin
  FIdsegregacriter := Value;
end;

procedure TDbDocumento.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbDocumento.SetIndicecorrecao(const Value: TCmDbField);
begin
  FIndicecorrecao := Value;
end;

procedure TDbDocumento.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbDocumento.SetNodocumento(const Value: TCmDbField);
begin
  FNodocumento := Value;
end;

procedure TDbDocumento.SetNossonumero(const Value: TCmDbField);
begin
  FNossonumero := Value;
end;

procedure TDbDocumento.SetNumapgr(const Value: TCmDbField);
begin
  FNumapgr := Value;
end;

procedure TDbDocumento.SetNumcpbaixa(const Value: TCmDbField);
begin
  FNumcpbaixa := Value;
end;

procedure TDbDocumento.SetNumdigcodbarras(const Value: TCmDbField);
begin
  FNumdigcodbarras := Value;
end;

procedure TDbDocumento.SetNumfatura(const Value: TCmDbField);
begin
  FNumfatura := Value;
end;

procedure TDbDocumento.SetNumleitcodbarras(const Value: TCmDbField);
begin
  FNumleitcodbarras := Value;
end;

procedure TDbDocumento.SetNumslip(const Value: TCmDbField);
begin
  FNumslip := Value;
end;

procedure TDbDocumento.SetObs(const Value: TCmDbField);
begin
  FObs := Value;
end;

procedure TDbDocumento.SetOperacao(const Value: TCmDbField);
begin
  FOperacao := Value;
end;

procedure TDbDocumento.SetPercjurosatuarial(const Value: TCmDbField);
begin
  FPercjurosatuarial := Value;
end;

procedure TDbDocumento.SetPercjurossimples(const Value: TCmDbField);
begin
  FPercjurossimples := Value;
end;

procedure TDbDocumento.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbDocumento.SetPlacontaAnt(const Value: TCmDbField);
begin
  FPlacontaAnt := Value;
end;

procedure TDbDocumento.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbDocumento.SetQtdeCotas(const Value: TCmDbField);
begin
  FQtdeCotas := Value;
end;

procedure TDbDocumento.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbDocumento.SetReferencia(const Value: TCmDbField);
begin
  FReferencia := Value;
end;

procedure TDbDocumento.SetStatus(const Value: TCmDbField);
begin
  FStatus := Value;
end;

procedure TDbDocumento.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbDocumento.SetValordesconto(const Value: TCmDbField);
begin
  FValordesconto := Value;
end;

procedure TDbDocumento.SetValorjuros(const Value: TCmDbField);
begin
  FValorjuros := Value;
end;

procedure TDbDocumento.SetVlrmulta(const Value: TCmDbField);
begin
  FVlrmulta := Value;
end;

procedure TDbDocumento.SetFlgSimples(const Value: TCmDbField);
begin
  FFlgSimples := Value;
end;

procedure TDbDocumento.SetFlgEspecial(const Value: TCmDbField);
begin
  FFlgEspecial := Value;
end;

procedure TDbDocumento.SetNfsDataEmissao(const Value: TCmDbField);
begin
  FNfsDataEmissao := Value;
end;

procedure TDbDocumento.SetNfsNumero(const Value: TCmDbField);
begin
  FNfsNumero := Value;
end;

procedure TDbDocumento.SetNfsObs(const Value: TCmDbField);
begin
  FNfsObs := Value;
end;

procedure TDbDocumento.SetNfsSerie(const Value: TCmDbField);
begin
  FNfsSerie := Value;
end;

procedure TDbDocumento.SetCodDossie(const Value: TCmDbField);
begin
  FCodDossie := Value;
end;

procedure TDbDocumento.SetNfsServico(const Value: TCmDbField);
begin
  FNfsServico := Value;
end;

procedure TDbDocumento.SetNumProcesso(const Value: TCmDbField);
begin
  FNumProcesso := Value;
end;

procedure TDbDocumento.SetParteContraria(const Value: TCmDbField);
begin
  FParteContraria := Value;
end;

procedure TDbDocumento.SetParteFuncef(const Value: TCmDbField);
begin
  FParteFuncef := Value;
end;

end.



