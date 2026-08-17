{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/10/2003                             }
{                                                       }
{*******************************************************}

{
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
//***************************************************************************************
//N. SIG........: 136888
//Dt Alteração..: 23/06/2023
//Responsável...: Cássio Florencio Rovaroto
//Descrição.....: Inclusão de opção para definição de optante pelo Simples Nacional.
--------------------------------------------------------------------------------
//Rotina             : Create
//N. SIG..........   : 133236  
//Data da Alteração: : 27/04/2023
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão do campo NFSSERVICO.
//***************************************************************************************
//Rotina             : Create
//N. SIG..........   : 115585
//Data da Alteração: : 18/05/2021 
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Retiradas dos campos IDTIPOSERVICO, IDPROCESSOSUSP.
//***************************************************************************************
//Rotina             : Create
//N. SIG..........   : 23656.59199
//Data da Alteração: : 27/11/2017
//Alteração Form:    : uDbLancamentosImovel
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão dos campos NFSNUMERO, NFSSERIE, NFSDATAEMISSAO, NFSOBS,
//                     IDTIPOSERVICO, IDPROCESSOSUSP.
//***************************************************************************************
Nº SIG......: 26054
Data........: 26/12/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Implementação no lançamento do imóvel, verifica se possui voto.
--------------------------------------------------------------------------------
}
unit uDbLancamentosImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLancamentosImovel = class(TCmDbObject)

  private
    FMesprestacao: TCmDbField;
    FFlgintegrado: TCmDbField;
    FAnoreferencia: TCmDbField;
    FVlrcomissao: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FRecpag: TCmDbField;
    FIdimovel: TCmDbField;
    FFlgerro: TCmDbField;
    FDatavencimento: TCmDbField;
    FPlncodigo: TCmDbField;
    FAnocompetencia: TCmDbField;
    FCodtipimovel: TCmDbField;
    FIdadminimovel: TCmDbField;
    FVlrlancompagar: TCmDbField;
    FAnoprestacao: TCmDbField;
    FIdforcli: TCmDbField;
    FDtfimctbdiaria: TCmDbField;
    FMoedapagar: TCmDbField;
    FIdlancimovel: TCmDbField;
    FIdtipocustorecimo: TCmDbField;
    FObs: TCmDbField;
    FVlrjuros: TCmDbField;
    FVlrmulta: TCmDbField;
    FCoddocumento: TCmDbField;
    FMsgerrointegra: TCmDbField;
    FIddocumento: TCmDbField;
    FMesreferencia: TCmDbField;
    FMescompetencia: TCmDbField;
    FIdusuariosistema: TCmDbField;
    FDatalimite: TCmDbField;
    FFlgestornado: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    FNodocumento: TCmDbField;
    FNumapalt: TCmDbField;
    FFlgconciliado: TCmDbField;
    FIdreservaorcamen: TCmDbField;
    FFlgagrupado: TCmDbField;
    FDatacorrecao: TCmDbField;
    FDatalancamento: TCmDbField;
    FDtinictbdiaria: TCmDbField;
    FReferenciaap: TCmDbField;
    FFlgorigem: TCmDbField;
    FVlrlancomreceb: TCmDbField;
    FMoedareceb: TCmDbField;
    FFlgimportado: TCmDbField;
    FIdmodulo: TCmDbField;
    FCodforma: TCmDbField;
    FFlgmultacalculada: TCmDbField;
    FIdpessoa: TCmDbField;
    FCompldocumento: TCmDbField;
    FIdlancreembdesp: TCmDbField;
    FFlgtipolancamento: TCmDbField;
    FFlgorigemlanc: TCmDbField;
    FIdrateiodocum: TCmDbField;
    FVlrlancreceb: TCmDbField;
    FIdprograma: TCmDbField;
    FFlgagrupar: TCmDbField;
    FIdempresa: TCmDbField;
    FVlrlancpagar: TCmDbField;
    FIdcbancaria: TCmDbField;
    FVlrcorrecaomon: TCmDbField;
    FCodportforma: TCmDbField;
    FDataemissao: TCmDbField;
    {Início - Michelle Mota - SIG26054}
    FIDVOTOGESTAOIMOVEL: TCmDbField;
    FFLGVOTO: TCmDbField;
    {Término - Michelle Mota - SIG26054}
    //Cassio Rovaroto - SIG nº 23656.59199 - Início
    FNfsNumero: TCmDbField;
    FNfsSerie: TCmDbField;
    FNfsObs: TCmDbField;
    FNfsDataEmissao: TCmDbField;
    FNfsServico: TCmDbField;
    //Cassio Rovaroto - SIG nº 23656.59199 - Fim
    FFlgSimples: TCmDbField; //Cassio Rovaroto - SIG nº 136888

    procedure SetAnocompetencia(const Value: TCmDbField);
    procedure SetAnoprestacao(const Value: TCmDbField);
    procedure SetAnoreferencia(const Value: TCmDbField);
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCoddocumento(const Value: TCmDbField);
    procedure SetCodforma(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodtipimovel(const Value: TCmDbField);
    procedure SetCompldocumento(const Value: TCmDbField);
    procedure SetDatacorrecao(const Value: TCmDbField);
    procedure SetDatalancamento(const Value: TCmDbField);
    procedure SetDatalimite(const Value: TCmDbField);
    procedure SetDatavencimento(const Value: TCmDbField);
    procedure SetDtfimctbdiaria(const Value: TCmDbField);
    procedure SetDtinictbdiaria(const Value: TCmDbField);
    procedure SetFlgagrupado(const Value: TCmDbField);
    procedure SetFlgagrupar(const Value: TCmDbField);
    procedure SetFlgconciliado(const Value: TCmDbField);
    procedure SetFlgerro(const Value: TCmDbField);
    procedure SetFlgestornado(const Value: TCmDbField);
    procedure SetFlgimportado(const Value: TCmDbField);
    procedure SetFlgintegrado(const Value: TCmDbField);
    procedure SetFlgmultacalculada(const Value: TCmDbField);
    procedure SetFlgorigem(const Value: TCmDbField);
    procedure SetFlgorigemlanc(const Value: TCmDbField);
    procedure SetFlgtipolancamento(const Value: TCmDbField);
    procedure SetIdadminimovel(const Value: TCmDbField);
    procedure SetIdcbancaria(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIddocumento(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdlancimovel(const Value: TCmDbField);
    procedure SetIdlancreembdesp(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetIdrateiodocum(const Value: TCmDbField);
    procedure SetIdreservaorcamen(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);
    procedure SetIdusuariosistema(const Value: TCmDbField);
    procedure SetMescompetencia(const Value: TCmDbField);
    procedure SetMesprestacao(const Value: TCmDbField);
    procedure SetMesreferencia(const Value: TCmDbField);
    procedure SetMoedapagar(const Value: TCmDbField);
    procedure SetMoedareceb(const Value: TCmDbField);
    procedure SetMsgerrointegra(const Value: TCmDbField);
    procedure SetNodocumento(const Value: TCmDbField);
    procedure SetNumapalt(const Value: TCmDbField);
    procedure SetObs(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetReferenciaap(const Value: TCmDbField);
    procedure SetVlrcomissao(const Value: TCmDbField);
    procedure SetVlrcorrecaomon(const Value: TCmDbField);
    procedure SetVlrjuros(const Value: TCmDbField);
    procedure SetVlrlancompagar(const Value: TCmDbField);
    procedure SetVlrlancomreceb(const Value: TCmDbField);
    procedure SetVlrlancpagar(const Value: TCmDbField);
    procedure SetVlrlancreceb(const Value: TCmDbField);
    procedure SetVlrmulta(const Value: TCmDbField);
    procedure SetDataemissao(const Value: TCmDbField);
    {Início - Michelle Mota - SIG26054}
    procedure SetIDVOTOGESTAOIMOVEL(const Value: TCmDbField);
    procedure SetFLGVOTO(const Value: TCmDbField);
    {Término - Michelle Mota - SIG26054}
    //Cassio Rovaroto - SIG nº 23656.59199 - Início
    procedure SetNfsDataEmissao(const Value: TCmDbField);
    procedure SetNfsNumero(const Value: TCmDbField);
    procedure SetNfsObs(const Value: TCmDbField);
    procedure SetNfsSerie(const Value: TCmDbField);
    procedure SetNfsServico(const Value: TCmDbField);
    //Cassio Rovaroto - SIG nº 23656.59199 - Fim
    procedure SetFlgSimples(const Value: TCmDbField); //Cassio Rovaroto - SIG nº 136888



  public

     Property Vlrmulta: TCmDbField read FVlrmulta write SetVlrmulta;
     Property Vlrlancreceb: TCmDbField read FVlrlancreceb write SetVlrlancreceb;
     Property Vlrlancpagar: TCmDbField read FVlrlancpagar write SetVlrlancpagar;
     Property Vlrlancomreceb: TCmDbField read FVlrlancomreceb write SetVlrlancomreceb;
     Property Vlrlancompagar: TCmDbField read FVlrlancompagar write SetVlrlancompagar;
     Property Vlrjuros: TCmDbField read FVlrjuros write SetVlrjuros;
     Property Vlrcorrecaomon: TCmDbField read FVlrcorrecaomon write SetVlrcorrecaomon;
     Property Vlrcomissao: TCmDbField read FVlrcomissao write SetVlrcomissao;
     Property Referenciaap: TCmDbField read FReferenciaap write SetReferenciaap;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Obs: TCmDbField read FObs write SetObs;
     Property Numapalt: TCmDbField read FNumapalt write SetNumapalt;
     Property Nodocumento: TCmDbField read FNodocumento write SetNodocumento;
     Property Msgerrointegra: TCmDbField read FMsgerrointegra write SetMsgerrointegra;
     Property Moedareceb: TCmDbField read FMoedareceb write SetMoedareceb;
     Property Moedapagar: TCmDbField read FMoedapagar write SetMoedapagar;
     Property Mesreferencia: TCmDbField read FMesreferencia write SetMesreferencia;
     Property Mesprestacao: TCmDbField read FMesprestacao write SetMesprestacao;
     Property Mescompetencia: TCmDbField read FMescompetencia write SetMescompetencia;
     Property Idusuariosistema: TCmDbField read FIdusuariosistema write SetIdusuariosistema;
     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idreservaorcamen: TCmDbField read FIdreservaorcamen write SetIdreservaorcamen;
     Property Idrateiodocum: TCmDbField read FIdrateiodocum write SetIdrateiodocum;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idlancreembdesp: TCmDbField read FIdlancreembdesp write SetIdlancreembdesp;
     Property Idlancimovel: TCmDbField read FIdlancimovel write SetIdlancimovel;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Iddocumento: TCmDbField read FIddocumento write SetIddocumento;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Idcbancaria: TCmDbField read FIdcbancaria write SetIdcbancaria;
     Property Idadminimovel: TCmDbField read FIdadminimovel write SetIdadminimovel;
     Property Flgtipolancamento: TCmDbField read FFlgtipolancamento write SetFlgtipolancamento;
     Property Flgorigemlanc: TCmDbField read FFlgorigemlanc write SetFlgorigemlanc;
     Property Flgorigem: TCmDbField read FFlgorigem write SetFlgorigem;
     Property Flgmultacalculada: TCmDbField read FFlgmultacalculada write SetFlgmultacalculada;
     Property Flgintegrado: TCmDbField read FFlgintegrado write SetFlgintegrado;
     Property Flgimportado: TCmDbField read FFlgimportado write SetFlgimportado;
     Property Flgestornado: TCmDbField read FFlgestornado write SetFlgestornado;
     Property Flgerro: TCmDbField read FFlgerro write SetFlgerro;
     Property Flgconciliado: TCmDbField read FFlgconciliado write SetFlgconciliado;
     Property Flgagrupar: TCmDbField read FFlgagrupar write SetFlgagrupar;
     Property Flgagrupado: TCmDbField read FFlgagrupado write SetFlgagrupado;
     Property Dtinictbdiaria: TCmDbField read FDtinictbdiaria write SetDtinictbdiaria;
     Property Dtfimctbdiaria: TCmDbField read FDtfimctbdiaria write SetDtfimctbdiaria;
     Property Datavencimento: TCmDbField read FDatavencimento write SetDatavencimento;
     Property Datalimite: TCmDbField read FDatalimite write SetDatalimite;
     Property Datalancamento: TCmDbField read FDatalancamento write SetDatalancamento;
     Property Datacorrecao: TCmDbField read FDatacorrecao write SetDatacorrecao;
     Property Compldocumento: TCmDbField read FCompldocumento write SetCompldocumento;
     Property Codtipimovel: TCmDbField read FCodtipimovel write SetCodtipimovel;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codforma: TCmDbField read FCodforma write SetCodforma;
     Property Coddocumento: TCmDbField read FCoddocumento write SetCoddocumento;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property Anoreferencia: TCmDbField read FAnoreferencia write SetAnoreferencia;
     Property Anoprestacao: TCmDbField read FAnoprestacao write SetAnoprestacao;
     Property Anocompetencia: TCmDbField read FAnocompetencia write SetAnocompetencia;
     Property Dataemissao: TCmDbField read FDataemissao write SetDataemissao;
     {Início - Michelle Mota - SIG26054}
     Property IDVOTOGESTAOIMOVEL: TCmDbField read FIDVOTOGESTAOIMOVEL write SetIDVOTOGESTAOIMOVEL;
     Property FLGVOTO: TCmDbField read FFLGVOTO write SetFLGVOTO;
     {Término - Michelle Mota - SIG26054}
     //Cássio Rovaroto - SIG nº 23656.59199 - Início
     property NfsNumero: TCmDbField read FNfsNumero write SetNfsNumero;
     property NfsSerie: TCmDbField read FNfsSerie write SetNfsSerie;
     property NfsDataEmissao: TCmDbField read FNfsDataEmissao write SetNfsDataEmissao;
     property NfsObs: TCmDbField read FNfsObs write SetNfsObs;
     //Cássio Rovaroto - SIG nº 23656.59199 - Fim
     property NfsServico: TCmDbField read FNfsServico write SetNfsServico;  //Cássio Rovaroto - SIG nº 123523
     property FlgSimples : TCmDbField read FFlgSimples write SetFlgSimples; //Cassio Rovaroto - SIG nº 136888

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLancamentosImovel }

constructor TDbLancamentosImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LANCAMENTOSIMOVEL';

   fVlrmulta := CreateCmDbField('VLRMULTA',ftfloat,False,False,False,True,'');
   fVlrlancreceb := CreateCmDbField('VLRLANCRECEB',ftfloat,False,False,False,True,'');
   fVlrlancpagar := CreateCmDbField('VLRLANCPAGAR',ftfloat,False,False,False,True,'');
   fVlrlancomreceb := CreateCmDbField('VLRLANCOMRECEB',ftfloat,False,False,False,True,'');
   fVlrlancompagar := CreateCmDbField('VLRLANCOMPAGAR',ftfloat,False,False,False,True,'');
   fVlrjuros := CreateCmDbField('VLRJUROS',ftfloat,False,False,False,True,'');
   fVlrcorrecaomon := CreateCmDbField('VLRCORRECAOMON',ftfloat,False,False,False,True,'');
   fVlrcomissao := CreateCmDbField('VLRCOMISSAO',ftfloat,False,False,False,True,'');
   fReferenciaap := CreateCmDbField('REFERENCIAAP',ftString,False,False,False,True,'');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fObs := CreateCmDbField('OBS',ftString,False,False,False,True,'');
   fNumapalt := CreateCmDbField('NUMAPALT',ftfloat,False,False,False,True,'');
   fNodocumento := CreateCmDbField('NODOCUMENTO',ftfloat,False,False,False,True,'');
   fMsgerrointegra := CreateCmDbField('MSGERROINTEGRA',ftString,False,False,False,True,'');
   fMoedareceb := CreateCmDbField('MOEDARECEB',ftfloat,False,False,False,True,'');
   fMoedapagar := CreateCmDbField('MOEDAPAGAR',ftfloat,False,False,False,True,'');
   fMesreferencia := CreateCmDbField('MESREFERENCIA',ftfloat,False,False,False,True,'');
   fMesprestacao := CreateCmDbField('MESPRESTACAO',ftfloat,False,False,False,True,'');
   fMescompetencia := CreateCmDbField('MESCOMPETENCIA',ftfloat,False,False,False,True,'');
   fIdusuariosistema := CreateCmDbField('IDUSUARIOSISTEMA',ftfloat,False,False,False,True,'');
   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIdreservaorcamen := CreateCmDbField('IDRESERVAORCAMEN',ftfloat,False,False,False,True,'');
   fIdrateiodocum := CreateCmDbField('IDRATEIODOCUM',ftfloat,False,False,False,True,'');
   fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdlancreembdesp := CreateCmDbField('IDLANCREEMBDESP',ftfloat,False,False,False,True,'');
   fIdlancimovel := CreateCmDbField('IDLANCIMOVEL',ftfloat,True,True,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fIddocumento := CreateCmDbField('IDDOCUMENTO',ftfloat,False,False,False,True,'');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,False,False,False,True,'');
   fIdcbancaria := CreateCmDbField('IDCBANCARIA',ftfloat,False,False,False,True,'');
   fIdadminimovel := CreateCmDbField('IDADMINIMOVEL',ftfloat,False,False,False,True,'');
   fFlgtipolancamento := CreateCmDbField('FLGTIPOLANCAMENTO',ftString,False,False,False,True,'');
   fFlgorigemlanc := CreateCmDbField('FLGORIGEMLANC',ftString,False,False,False,True,'');
   fFlgorigem := CreateCmDbField('FLGORIGEM',ftfloat,False,False,False,True,'');
   fFlgmultacalculada := CreateCmDbField('FLGMULTACALCULADA',ftfloat,False,False,False,True,'');
   fFlgintegrado := CreateCmDbField('FLGINTEGRADO',ftfloat,False,False,False,False,'');
   fFlgimportado := CreateCmDbField('FLGIMPORTADO',ftfloat,False,False,False,True,'');
   fFlgestornado := CreateCmDbField('FLGESTORNADO',ftfloat,False,False,False,True,'');
   fFlgerro := CreateCmDbField('FLGERRO',ftfloat,False,False,False,True,'');
   fFlgconciliado := CreateCmDbField('FLGCONCILIADO',ftfloat,False,False,False,True,'');
   fFlgagrupar := CreateCmDbField('FLGAGRUPAR',ftString,False,False,False,True,'');
   fFlgagrupado := CreateCmDbField('FLGAGRUPADO',ftfloat,False,False,False,True,'');
   fDtinictbdiaria := CreateCmDbField('DTINICTBDIARIA',ftDateTime,False,False,False,True,'');
   fDtfimctbdiaria := CreateCmDbField('DTFIMCTBDIARIA',ftDateTime,False,False,False,True,'');
   fDatavencimento := CreateCmDbField('DATAVENCIMENTO',ftDateTime,False,False,False,True,'');
   fDatalimite := CreateCmDbField('DATALIMITE',ftDateTime,False,False,False,True,'');
   fDatalancamento := CreateCmDbField('DATALANCAMENTO',ftDateTime,False,False,False,True,'');
   fDatacorrecao := CreateCmDbField('DATACORRECAO',ftDateTime,False,False,False,True,'');
   fCompldocumento := CreateCmDbField('COMPLDOCUMENTO',ftString,False,False,False,True,'');
   fCodtipimovel := CreateCmDbField('CODTIPIMOVEL',ftString,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCodforma := CreateCmDbField('CODFORMA',ftfloat,False,False,False,True,'');
   fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   fAnoreferencia := CreateCmDbField('ANOREFERENCIA',ftfloat,False,False,False,True,'');
   fAnoprestacao := CreateCmDbField('ANOPRESTACAO',ftfloat,False,False,False,True,'');
   fAnocompetencia := CreateCmDbField('ANOCOMPETENCIA',ftfloat,False,False,False,True,'');
   fDataEmissao := CreateCmDbField('DATAEMISSAO',ftDateTime,False,False,False,True,'');
   {Início - Michelle Mota - SIG26054}
   fIDVOTOGESTAOIMOVEL := CreateCmDbField('IDVOTOGESTAOIMOVEL',ftFloat,False,False,False,True,'');
   fFLGVOTO := CreateCmDbField('FLGVOTO',ftString,False,False,False,True,'');
   {Término - Michelle Mota - SIG26054}
   //Cassio Rovaroto - SIG nº 23656.59199 - Início
   FNfsNumero := CreateCmDbField('NFSNUMERO', ftString, false, false, false, false, '');
   FNfsSerie := CreateCmDbField('NFSSERIE', ftString, false, false, false, false, '');
   FNfsDataEmissao := CreateCmDbField('NFSDATAEMISSAO', ftDateTime, false, false, false, true, '');
   FNfsObs := CreateCmDbField('NFSOBS', ftString, false, false, false, false, '');
   //Cassio Rovaroto - SIG nº 23656.59199 - Fim
   FNfsServico := CreateCmDbField('NFSSERVICO', ftInteger, false, false, false, true, '');
   FFlgSimples := CreateCmDbField('FLGSIMPLES', ftString, false, false, false, false, '');
end;

function TDbLancamentosImovel.Insert: Boolean;
begin
   fIdlancimovel.AsFloat := GetSequence('LANCAMENTOSIMOVEL');
   Result := Inherited Insert;
end;


procedure TDbLancamentosImovel.SetAnocompetencia(const Value: TCmDbField);
begin
  FAnocompetencia := Value;
end;

procedure TDbLancamentosImovel.SetAnoprestacao(const Value: TCmDbField);
begin
  FAnoprestacao := Value;
end;

procedure TDbLancamentosImovel.SetAnoreferencia(const Value: TCmDbField);
begin
  FAnoreferencia := Value;
end;

procedure TDbLancamentosImovel.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbLancamentosImovel.SetCoddocumento(const Value: TCmDbField);
begin
  FCoddocumento := Value;
end;

procedure TDbLancamentosImovel.SetCodforma(const Value: TCmDbField);
begin
  FCodforma := Value;
end;

procedure TDbLancamentosImovel.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbLancamentosImovel.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

procedure TDbLancamentosImovel.SetCompldocumento(const Value: TCmDbField);
begin
  FCompldocumento := Value;
end;

procedure TDbLancamentosImovel.SetDatacorrecao(const Value: TCmDbField);
begin
  FDatacorrecao := Value;
end;

procedure TDbLancamentosImovel.SetDataemissao(const Value: TCmDbField);
begin
  FDataemissao := Value;
end;

procedure TDbLancamentosImovel.SetDatalancamento(const Value: TCmDbField);
begin
  FDatalancamento := Value;
end;

procedure TDbLancamentosImovel.SetDatalimite(const Value: TCmDbField);
begin
  FDatalimite := Value;
end;

procedure TDbLancamentosImovel.SetDatavencimento(const Value: TCmDbField);
begin
  FDatavencimento := Value;
end;

procedure TDbLancamentosImovel.SetDtfimctbdiaria(const Value: TCmDbField);
begin
  FDtfimctbdiaria := Value;
end;

procedure TDbLancamentosImovel.SetDtinictbdiaria(const Value: TCmDbField);
begin
  FDtinictbdiaria := Value;
end;

procedure TDbLancamentosImovel.SetFlgagrupado(const Value: TCmDbField);
begin
  FFlgagrupado := Value;
end;

procedure TDbLancamentosImovel.SetFlgagrupar(const Value: TCmDbField);
begin
  FFlgagrupar := Value;
end;

procedure TDbLancamentosImovel.SetFlgconciliado(const Value: TCmDbField);
begin
  FFlgconciliado := Value;
end;

procedure TDbLancamentosImovel.SetFlgerro(const Value: TCmDbField);
begin
  FFlgerro := Value;
end;

procedure TDbLancamentosImovel.SetFlgestornado(const Value: TCmDbField);
begin
  FFlgestornado := Value;
end;

procedure TDbLancamentosImovel.SetFlgimportado(const Value: TCmDbField);
begin
  FFlgimportado := Value;
end;

procedure TDbLancamentosImovel.SetFlgintegrado(const Value: TCmDbField);
begin
  FFlgintegrado := Value;
end;

procedure TDbLancamentosImovel.SetFlgmultacalculada(
  const Value: TCmDbField);
begin
  FFlgmultacalculada := Value;
end;

procedure TDbLancamentosImovel.SetFlgorigem(const Value: TCmDbField);
begin
  FFlgorigem := Value;
end;

procedure TDbLancamentosImovel.SetFlgorigemlanc(const Value: TCmDbField);
begin
  FFlgorigemlanc := Value;
end;

procedure TDbLancamentosImovel.SetFlgtipolancamento(
  const Value: TCmDbField);
begin
  FFlgtipolancamento := Value;
end;

procedure TDbLancamentosImovel.SetIdadminimovel(const Value: TCmDbField);
begin
  FIdadminimovel := Value;
end;

procedure TDbLancamentosImovel.SetIdcbancaria(const Value: TCmDbField);
begin
  FIdcbancaria := Value;
end;

procedure TDbLancamentosImovel.SetIdcontratoimovel(
  const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbLancamentosImovel.SetIddocumento(const Value: TCmDbField);
begin
  FIddocumento := Value;
end;

procedure TDbLancamentosImovel.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbLancamentosImovel.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbLancamentosImovel.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbLancamentosImovel.SetIdlancimovel(const Value: TCmDbField);
begin
  FIdlancimovel := Value;
end;

procedure TDbLancamentosImovel.SetIdlancreembdesp(const Value: TCmDbField);
begin
  FIdlancreembdesp := Value;
end;

procedure TDbLancamentosImovel.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbLancamentosImovel.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbLancamentosImovel.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbLancamentosImovel.SetIdrateiodocum(const Value: TCmDbField);
begin
  FIdrateiodocum := Value;
end;

procedure TDbLancamentosImovel.SetIdreservaorcamen(
  const Value: TCmDbField);
begin
  FIdreservaorcamen := Value;
end;

procedure TDbLancamentosImovel.SetIdtipocustorecimo(
  const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

procedure TDbLancamentosImovel.SetIdusuariosistema(
  const Value: TCmDbField);
begin
  FIdusuariosistema := Value;
end;

procedure TDbLancamentosImovel.SetMescompetencia(const Value: TCmDbField);
begin
  FMescompetencia := Value;
end;

procedure TDbLancamentosImovel.SetMesprestacao(const Value: TCmDbField);
begin
  FMesprestacao := Value;
end;

procedure TDbLancamentosImovel.SetMesreferencia(const Value: TCmDbField);
begin
  FMesreferencia := Value;
end;

procedure TDbLancamentosImovel.SetMoedapagar(const Value: TCmDbField);
begin
  FMoedapagar := Value;
end;

procedure TDbLancamentosImovel.SetMoedareceb(const Value: TCmDbField);
begin
  FMoedareceb := Value;
end;

procedure TDbLancamentosImovel.SetMsgerrointegra(const Value: TCmDbField);
begin
  FMsgerrointegra := Value;
end;

procedure TDbLancamentosImovel.SetNodocumento(const Value: TCmDbField);
begin
  FNodocumento := Value;
end;

procedure TDbLancamentosImovel.SetNumapalt(const Value: TCmDbField);
begin
  FNumapalt := Value;
end;

procedure TDbLancamentosImovel.SetObs(const Value: TCmDbField);
begin
  FObs := Value;
end;

procedure TDbLancamentosImovel.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDbLancamentosImovel.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbLancamentosImovel.SetReferenciaap(const Value: TCmDbField);
begin
  FReferenciaap := Value;
end;


procedure TDbLancamentosImovel.SetVlrcomissao(const Value: TCmDbField);
begin
  FVlrcomissao := Value;
end;

procedure TDbLancamentosImovel.SetVlrcorrecaomon(const Value: TCmDbField);
begin
  FVlrcorrecaomon := Value;
end;

procedure TDbLancamentosImovel.SetVlrjuros(const Value: TCmDbField);
begin
  FVlrjuros := Value;
end;

procedure TDbLancamentosImovel.SetVlrlancompagar(const Value: TCmDbField);
begin
  FVlrlancompagar := Value;
end;

procedure TDbLancamentosImovel.SetVlrlancomreceb(const Value: TCmDbField);
begin
  FVlrlancomreceb := Value;
end;

procedure TDbLancamentosImovel.SetVlrlancpagar(const Value: TCmDbField);
begin
  FVlrlancpagar := Value;
end;

procedure TDbLancamentosImovel.SetVlrlancreceb(const Value: TCmDbField);
begin
  FVlrlancreceb := Value;
end;

procedure TDbLancamentosImovel.SetVlrmulta(const Value: TCmDbField);
begin
  FVlrmulta := Value;
end;

{Início - Michelle Mota - SIG26054}
procedure TDbLancamentosImovel.SetIDVOTOGESTAOIMOVEL(const Value: TCmDbField);
begin
  FIDVOTOGESTAOIMOVEL := Value;
end;

procedure TDbLancamentosImovel.SetFLGVOTO(const Value: TCmDbField);
begin
  FFLGVOTO := Value;
end;
{Término - Michelle Mota - SIG26054}

procedure TDbLancamentosImovel.SetNfsDataEmissao(const Value: TCmDbField);
begin
  FNfsDataEmissao := Value;
end;

procedure TDbLancamentosImovel.SetNfsNumero(const Value: TCmDbField);
begin
  FNfsNumero := Value;
end;

procedure TDbLancamentosImovel.SetNfsObs(const Value: TCmDbField);
begin
  FNfsObs := Value;
end;

procedure TDbLancamentosImovel.SetNfsSerie(const Value: TCmDbField);
begin
  FNfsSerie := Value;
end;

procedure TDbLancamentosImovel.SetNfsServico(const Value: TCmDbField);
begin
  FNfsServico := Value;
end;

procedure TDbLancamentosImovel.SetFlgSimples(const Value: TCmDbField);
begin
  FFlgSimples := Value;
end;

end.



