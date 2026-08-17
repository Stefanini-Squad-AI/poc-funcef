{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 15/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbContratoImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbContratoImovel = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FConpercentremuner: TCmDbField;
    FVlrproposta: TCmDbField;
    FConproxreajuste: TCmDbField;
    FFlgstatus: TCmDbField;
    FConpercentinst: TCmDbField;
    FConmoedamulta: TCmDbField;
    FIdtipocustorecimo: TCmDbField;
    FFlgjurosremunera: TCmDbField;
    FIdmsgboleto: TCmDbField;
    FConpercentterr: TCmDbField;
    FIdcidades: TCmDbField;
    FIdatividade: TCmDbField;
    FCondatareajuste: TCmDbField;
    FConmoedamora: TCmDbField;
    FIdmarca: TCmDbField;
    FFlgfianca: TCmDbField;
    FCondatainicaren: TCmDbField;
    FCondatarenegoc: TCmDbField;
    FFlgtipodiacompl: TCmDbField;
    FPerctxjurmerc: TCmDbField;
    FFlgtipoaluguel: TCmDbField;
    FIdlocatario: TCmDbField;
    FConpermora: TCmDbField;
    FConindicereajuste: TCmDbField;
    FConvlrajustado: TCmDbField;
    FCondatainicio: TCmDbField;
    FVlrcontabil: TCmDbField;
    FConvlrtotal: TCmDbField;
    FContaxaadmin: TCmDbField;
    FCondataavdenuncia: TCmDbField;
    FConquantvagas: TCmDbField;
    FIdresponsavel: TCmDbField;
    FFlgcompetaluguel: TCmDbField;
    FConpercentmulta: TCmDbField;
    FFlgcobrancaauto: TCmDbField;
    FFlgmesposterior: TCmDbField;
    FIdforcli: TCmDbField;
    FIdtipoinvest: TCmDbField;
    FFlgindeterminado: TCmDbField;
    FFlgmoraproporc: TCmDbField;
    FConindicemora: TCmDbField;
    FMoecodigo: TCmDbField;
    FFlgremuneraalug: TCmDbField;
    FFlgtipocontrato: TCmDbField;
    FConpercentmora: TCmDbField;
    FCondescricao: TCmDbField;
    FIdtipooperacao: TCmDbField;
    FFlgtipodiatolera: TCmDbField;
    FConpercentjuros: TCmDbField;
    FIdsitcontimob: TCmDbField;
    FFlgtipodiavenc: TCmDbField;
    FCondiasrepasse: TCmDbField;
    FConvlrfianca: TCmDbField;
    FConperreajuste: TCmDbField;
    FVlroperacaoom: TCmDbField;
    FCondatacarencia: TCmDbField;
    FCondatafim: TCmDbField;
    FCondiavencimento: TCmDbField;
    FConperaluguel: TCmDbField;
    FConvlrmora: TCmDbField;
    FCodestado: TCmDbField;
    FConnumero: TCmDbField;
    FCondiacomplemento: TCmDbField;
    FCondatafiancaav: TCmDbField;
    FIdconanterior: TCmDbField;
    FConpercentedif: TCmDbField;
    FConobsfianca: TCmDbField;
    FCondiastoleracomp: TCmDbField;
    FCondatafiancaini: TCmDbField;
    FCondiastolerancia: TCmDbField;
    FCondataavrenegoc: TCmDbField;
    FIdopercontrato: TCmDbField;
    FCodportforma: TCmDbField;
    FIdpais: TCmDbField;
    FIdtipoopersinal: TCmDbField;
    FCondatadenuncia: TCmDbField;
    FIdindcorrecao: TCmDbField;
    FConvlrmulta: TCmDbField;
    FVlroperacao: TCmDbField;
    FCondatafiancafim: TCmDbField;
    FIdadminimovel: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FPeritxjurmerc: TCmDbField;
    FCondataassinatura: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    FFlgtipocobranca: TCmDbField;
    FPeraluguelideal: TCmDbField;
    FConpercentelet: TCmDbField;
    FConnome: TCmDbField;
    FDataoperacao: TCmDbField;
    FConmesrefreajuste: TCmDbField;
    FVlrpresente: TCmDbField;
    FConbancofianca: TCmDbField;
    FConDataSolResc: TCmDbField;
    FIdRegraRes: TCmDbField;
    FPerMultaResc: TCmDbField;
    FQtdeMultaResc: TCmDbField;
    FConPercReajuste: TCmDbField;
    FIdTipoContrImob: TCmDbField;
    procedure SetCodestado(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetConbancofianca(const Value: TCmDbField);
    procedure SetCondataassinatura(const Value: TCmDbField);
    procedure SetCondataavdenuncia(const Value: TCmDbField);
    procedure SetCondataavrenegoc(const Value: TCmDbField);
    procedure SetCondatacarencia(const Value: TCmDbField);
    procedure SetCondatadenuncia(const Value: TCmDbField);
    procedure SetCondatafiancaav(const Value: TCmDbField);
    procedure SetCondatafiancafim(const Value: TCmDbField);
    procedure SetCondatafiancaini(const Value: TCmDbField);
    procedure SetCondatafim(const Value: TCmDbField);
    procedure SetCondatainicaren(const Value: TCmDbField);
    procedure SetCondatainicio(const Value: TCmDbField);
    procedure SetCondatareajuste(const Value: TCmDbField);
    procedure SetCondatarenegoc(const Value: TCmDbField);
    procedure SetCondescricao(const Value: TCmDbField);
    procedure SetCondiacomplemento(const Value: TCmDbField);
    procedure SetCondiasrepasse(const Value: TCmDbField);
    procedure SetCondiastoleracomp(const Value: TCmDbField);
    procedure SetCondiastolerancia(const Value: TCmDbField);
    procedure SetCondiavencimento(const Value: TCmDbField);
    procedure SetConindicemora(const Value: TCmDbField);
    procedure SetConindicereajuste(const Value: TCmDbField);
    procedure SetConmesrefreajuste(const Value: TCmDbField);
    procedure SetConmoedamora(const Value: TCmDbField);
    procedure SetConmoedamulta(const Value: TCmDbField);
    procedure SetConnome(const Value: TCmDbField);
    procedure SetConnumero(const Value: TCmDbField);
    procedure SetConobsfianca(const Value: TCmDbField);
    procedure SetConperaluguel(const Value: TCmDbField);
    procedure SetConpercentedif(const Value: TCmDbField);
    procedure SetConpercentelet(const Value: TCmDbField);
    procedure SetConpercentinst(const Value: TCmDbField);
    procedure SetConpercentjuros(const Value: TCmDbField);
    procedure SetConpercentmora(const Value: TCmDbField);
    procedure SetConpercentmulta(const Value: TCmDbField);
    procedure SetConpercentremuner(const Value: TCmDbField);
    procedure SetConpercentterr(const Value: TCmDbField);
    procedure SetConpermora(const Value: TCmDbField);
    procedure SetConperreajuste(const Value: TCmDbField);
    procedure SetConproxreajuste(const Value: TCmDbField);
    procedure SetConquantvagas(const Value: TCmDbField);
    procedure SetContaxaadmin(const Value: TCmDbField);
    procedure SetConvlrajustado(const Value: TCmDbField);
    procedure SetConvlrfianca(const Value: TCmDbField);
    procedure SetConvlrmora(const Value: TCmDbField);
    procedure SetConvlrmulta(const Value: TCmDbField);
    procedure SetConvlrtotal(const Value: TCmDbField);
    procedure SetDataoperacao(const Value: TCmDbField);
    procedure SetFlgcobrancaauto(const Value: TCmDbField);
    procedure SetFlgcompetaluguel(const Value: TCmDbField);
    procedure SetFlgfianca(const Value: TCmDbField);
    procedure SetFlgindeterminado(const Value: TCmDbField);
    procedure SetFlgjurosremunera(const Value: TCmDbField);
    procedure SetFlgmesposterior(const Value: TCmDbField);
    procedure SetFlgmoraproporc(const Value: TCmDbField);
    procedure SetFlgremuneraalug(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetFlgtipoaluguel(const Value: TCmDbField);
    procedure SetFlgtipocobranca(const Value: TCmDbField);
    procedure SetFlgtipocontrato(const Value: TCmDbField);
    procedure SetFlgtipodiacompl(const Value: TCmDbField);
    procedure SetFlgtipodiatolera(const Value: TCmDbField);
    procedure SetFlgtipodiavenc(const Value: TCmDbField);
    procedure SetIdadminimovel(const Value: TCmDbField);
    procedure SetIdatividade(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcidades(const Value: TCmDbField);
    procedure SetIdconanterior(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdindcorrecao(const Value: TCmDbField);
    procedure SetIdlocatario(const Value: TCmDbField);
    procedure SetIdmarca(const Value: TCmDbField);
    procedure SetIdmsgboleto(const Value: TCmDbField);
    procedure SetIdopercontrato(const Value: TCmDbField);
    procedure SetIdpais(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);
    procedure SetIdsitcontimob(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);
    procedure SetIdtipoinvest(const Value: TCmDbField);
    procedure SetIdtipooperacao(const Value: TCmDbField);
    procedure SetIdtipoopersinal(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetPeraluguelideal(const Value: TCmDbField);
    procedure SetPerctxjurmerc(const Value: TCmDbField);
    procedure SetPeritxjurmerc(const Value: TCmDbField);
    procedure SetVlrcontabil(const Value: TCmDbField);
    procedure SetVlroperacao(const Value: TCmDbField);
    procedure SetVlroperacaoom(const Value: TCmDbField);
    procedure SetVlrpresente(const Value: TCmDbField);
    procedure SetVlrproposta(const Value: TCmDbField);
    procedure SetConDataSolResc(const Value: TCmDbField);
    procedure SetIdRegraRes(const Value: TCmDbField);
    procedure SetPerMultaResc(const Value: TCmDbField);
    procedure SetQtdeMultaResc(const Value: TCmDbField);
    procedure SetConPercReajuste(const Value: TCmDbField);
    procedure SetIdTipoContrImob(const Value: TCmDbField);

  public

     Property Vlrproposta: TCmDbField read FVlrproposta write SetVlrproposta;
     Property Vlrpresente: TCmDbField read FVlrpresente write SetVlrpresente;
     Property Vlroperacaoom: TCmDbField read FVlroperacaoom write SetVlroperacaoom;
     Property Vlroperacao: TCmDbField read FVlroperacao write SetVlroperacao;
     Property Vlrcontabil: TCmDbField read FVlrcontabil write SetVlrcontabil;
     Property Peritxjurmerc: TCmDbField read FPeritxjurmerc write SetPeritxjurmerc;
     Property Perctxjurmerc: TCmDbField read FPerctxjurmerc write SetPerctxjurmerc;
     Property Peraluguelideal: TCmDbField read FPeraluguelideal write SetPeraluguelideal;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idtipoopersinal: TCmDbField read FIdtipoopersinal write SetIdtipoopersinal;
     Property Idtipooperacao: TCmDbField read FIdtipooperacao write SetIdtipooperacao;
     Property Idtipoinvest: TCmDbField read FIdtipoinvest write SetIdtipoinvest;
     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Idsitcontimob: TCmDbField read FIdsitcontimob write SetIdsitcontimob;
     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpais: TCmDbField read FIdpais write SetIdpais;
     Property Idopercontrato: TCmDbField read FIdopercontrato write SetIdopercontrato;
     Property Idmsgboleto: TCmDbField read FIdmsgboleto write SetIdmsgboleto;
     Property Idmarca: TCmDbField read FIdmarca write SetIdmarca;
     Property Idlocatario: TCmDbField read FIdlocatario write SetIdlocatario;
     Property Idindcorrecao: TCmDbField read FIdindcorrecao write SetIdindcorrecao;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Idconanterior: TCmDbField read FIdconanterior write SetIdconanterior;
     Property Idcidades: TCmDbField read FIdcidades write SetIdcidades;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Idatividade: TCmDbField read FIdatividade write SetIdatividade;
     Property Idadminimovel: TCmDbField read FIdadminimovel write SetIdadminimovel;
     Property Flgtipodiavenc: TCmDbField read FFlgtipodiavenc write SetFlgtipodiavenc;
     Property Flgtipodiatolera: TCmDbField read FFlgtipodiatolera write SetFlgtipodiatolera;
     Property Flgtipodiacompl: TCmDbField read FFlgtipodiacompl write SetFlgtipodiacompl;
     Property Flgtipocontrato: TCmDbField read FFlgtipocontrato write SetFlgtipocontrato;
     Property Flgtipocobranca: TCmDbField read FFlgtipocobranca write SetFlgtipocobranca;
     Property Flgtipoaluguel: TCmDbField read FFlgtipoaluguel write SetFlgtipoaluguel;
     Property Flgstatus: TCmDbField read FFlgstatus write SetFlgstatus;
     Property Flgremuneraalug: TCmDbField read FFlgremuneraalug write SetFlgremuneraalug;
     Property Flgmoraproporc: TCmDbField read FFlgmoraproporc write SetFlgmoraproporc;
     Property Flgmesposterior: TCmDbField read FFlgmesposterior write SetFlgmesposterior;
     Property Flgjurosremunera: TCmDbField read FFlgjurosremunera write SetFlgjurosremunera;
     Property Flgindeterminado: TCmDbField read FFlgindeterminado write SetFlgindeterminado;
     Property Flgfianca: TCmDbField read FFlgfianca write SetFlgfianca;
     Property Flgcompetaluguel: TCmDbField read FFlgcompetaluguel write SetFlgcompetaluguel;
     Property Flgcobrancaauto: TCmDbField read FFlgcobrancaauto write SetFlgcobrancaauto;
     Property Dataoperacao: TCmDbField read FDataoperacao write SetDataoperacao;
     Property Convlrtotal: TCmDbField read FConvlrtotal write SetConvlrtotal;
     Property Convlrmulta: TCmDbField read FConvlrmulta write SetConvlrmulta;
     Property Convlrmora: TCmDbField read FConvlrmora write SetConvlrmora;
     Property Convlrfianca: TCmDbField read FConvlrfianca write SetConvlrfianca;
     Property Convlrajustado: TCmDbField read FConvlrajustado write SetConvlrajustado;
     Property Contaxaadmin: TCmDbField read FContaxaadmin write SetContaxaadmin;
     Property Conquantvagas: TCmDbField read FConquantvagas write SetConquantvagas;
     Property Conproxreajuste: TCmDbField read FConproxreajuste write SetConproxreajuste;
     Property Conperreajuste: TCmDbField read FConperreajuste write SetConperreajuste;
     Property Conpermora: TCmDbField read FConpermora write SetConpermora;
     Property Conpercentterr: TCmDbField read FConpercentterr write SetConpercentterr;
     Property Conpercentremuner: TCmDbField read FConpercentremuner write SetConpercentremuner;
     Property Conpercentmulta: TCmDbField read FConpercentmulta write SetConpercentmulta;
     Property Conpercentmora: TCmDbField read FConpercentmora write SetConpercentmora;
     Property Conpercentjuros: TCmDbField read FConpercentjuros write SetConpercentjuros;
     Property Conpercentinst: TCmDbField read FConpercentinst write SetConpercentinst;
     Property Conpercentelet: TCmDbField read FConpercentelet write SetConpercentelet;
     Property Conpercentedif: TCmDbField read FConpercentedif write SetConpercentedif;
     Property Conperaluguel: TCmDbField read FConperaluguel write SetConperaluguel;
     Property Conobsfianca: TCmDbField read FConobsfianca write SetConobsfianca;
     Property Connumero: TCmDbField read FConnumero write SetConnumero;
     Property Connome: TCmDbField read FConnome write SetConnome;
     Property Conmoedamulta: TCmDbField read FConmoedamulta write SetConmoedamulta;
     Property Conmoedamora: TCmDbField read FConmoedamora write SetConmoedamora;
     Property Conmesrefreajuste: TCmDbField read FConmesrefreajuste write SetConmesrefreajuste;
     Property Conindicereajuste: TCmDbField read FConindicereajuste write SetConindicereajuste;
     Property Conindicemora: TCmDbField read FConindicemora write SetConindicemora;
     Property Condiavencimento: TCmDbField read FCondiavencimento write SetCondiavencimento;
     Property Condiastolerancia: TCmDbField read FCondiastolerancia write SetCondiastolerancia;
     Property Condiastoleracomp: TCmDbField read FCondiastoleracomp write SetCondiastoleracomp;
     Property Condiasrepasse: TCmDbField read FCondiasrepasse write SetCondiasrepasse;
     Property Condiacomplemento: TCmDbField read FCondiacomplemento write SetCondiacomplemento;
     Property Condescricao: TCmDbField read FCondescricao write SetCondescricao;
     Property Condatarenegoc: TCmDbField read FCondatarenegoc write SetCondatarenegoc;
     Property Condatareajuste: TCmDbField read FCondatareajuste write SetCondatareajuste;
     Property Condatainicio: TCmDbField read FCondatainicio write SetCondatainicio;
     Property Condatainicaren: TCmDbField read FCondatainicaren write SetCondatainicaren;
     Property Condatafim: TCmDbField read FCondatafim write SetCondatafim;
     Property Condatafiancaini: TCmDbField read FCondatafiancaini write SetCondatafiancaini;
     Property Condatafiancafim: TCmDbField read FCondatafiancafim write SetCondatafiancafim;
     Property Condatafiancaav: TCmDbField read FCondatafiancaav write SetCondatafiancaav;
     Property Condatadenuncia: TCmDbField read FCondatadenuncia write SetCondatadenuncia;
     Property Condatacarencia: TCmDbField read FCondatacarencia write SetCondatacarencia;
     Property Condataavrenegoc: TCmDbField read FCondataavrenegoc write SetCondataavrenegoc;
     Property Condataavdenuncia: TCmDbField read FCondataavdenuncia write SetCondataavdenuncia;
     Property Condataassinatura: TCmDbField read FCondataassinatura write SetCondataassinatura;
     Property Conbancofianca: TCmDbField read FConbancofianca write SetConbancofianca;
     Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
     Property Codestado: TCmDbField read FCodestado write SetCodestado;
     Property ConDataSolResc : TCmDbField read FConDataSolResc write SetConDataSolResc;
     Property IdRegraRes : TCmDbField read FIdRegraRes write SetIdRegraRes;
     Property PerMultaResc : TCmDbField read FPerMultaResc write SetPerMultaResc;
     Property QtdeMultaResc : TCmDbField read FQtdeMultaResc write SetQtdeMultaResc;
     Property ConPercReajuste: TCmDbField read FConPercReajuste write SetConPercReajuste;
     Property IdTipoContrImob: TCmDbField read FIdTipoContrImob write SetIdTipoContrImob;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContratoImovel }

constructor TDbContratoImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRATOIMOVEL';

   fVlrproposta := CreateCmDbField('VLRPROPOSTA',ftfloat,False,False,False,True,'');
   fVlrpresente := CreateCmDbField('VLRPRESENTE',ftfloat,False,False,False,True,'');
   fVlroperacaoom := CreateCmDbField('VLROPERACAOOM',ftfloat,False,False,False,True,'');
   fVlroperacao := CreateCmDbField('VLROPERACAO',ftfloat,False,False,False,True,'');
   fVlrcontabil := CreateCmDbField('VLRCONTABIL',ftfloat,False,False,False,True,'');
   fPeritxjurmerc := CreateCmDbField('PERITXJURMERC',ftString,False,False,False,True,'');
   fPerctxjurmerc := CreateCmDbField('PERCTXJURMERC',ftfloat,False,False,False,True,'');
   fPeraluguelideal := CreateCmDbField('PERALUGUELIDEAL',ftfloat,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'');
   fIdtipoopersinal := CreateCmDbField('IDTIPOOPERSINAL',ftfloat,False,False,False,True,'');
   fIdtipooperacao := CreateCmDbField('IDTIPOOPERACAO',ftfloat,False,False,False,True,'');
   fIdtipoinvest := CreateCmDbField('IDTIPOINVEST',ftfloat,False,False,False,True,'');
   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIdsitcontimob := CreateCmDbField('IDSITCONTIMOB',ftfloat,False,False,False,True,'');
   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdpais := CreateCmDbField('IDPAIS',ftfloat,False,False,False,True,'');
   fIdopercontrato := CreateCmDbField('IDOPERCONTRATO',ftfloat,False,False,False,True,'');
   fIdmsgboleto := CreateCmDbField('IDMSGBOLETO',ftfloat,False,False,False,True,'');
   fIdmarca := CreateCmDbField('IDMARCA',ftfloat,False,False,False,True,'');
   fIdlocatario := CreateCmDbField('IDLOCATARIO',ftfloat,False,False,False,True,'');
   fIdindcorrecao := CreateCmDbField('IDINDCORRECAO',ftfloat,False,False,False,True,'');
   fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,True,True,False,True,'');
   fIdconanterior := CreateCmDbField('IDCONANTERIOR',ftfloat,False,False,False,True,'');
   fIdcidades := CreateCmDbField('IDCIDADES',ftfloat,False,False,False,True,'');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'');
   fIdatividade := CreateCmDbField('IDATIVIDADE',ftfloat,False,False,False,True,'');
   fIdadminimovel := CreateCmDbField('IDADMINIMOVEL',ftfloat,False,False,False,True,'');
   fFlgtipodiavenc := CreateCmDbField('FLGTIPODIAVENC',ftString,False,False,False,True,'');
   fFlgtipodiatolera := CreateCmDbField('FLGTIPODIATOLERA',ftString,False,False,False,True,'');
   fFlgtipodiacompl := CreateCmDbField('FLGTIPODIACOMPL',ftString,False,False,False,True,'');
   fFlgtipocontrato := CreateCmDbField('FLGTIPOCONTRATO',ftString,False,False,False,True,'');
   fFlgtipocobranca := CreateCmDbField('FLGTIPOCOBRANCA',ftString,False,False,False,True,'');
   fFlgtipoaluguel := CreateCmDbField('FLGTIPOALUGUEL',ftString,False,False,False,True,'');
   fFlgstatus := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'');
   fFlgremuneraalug := CreateCmDbField('FLGREMUNERAALUG',ftfloat,False,False,False,True,'');
   fFlgmoraproporc := CreateCmDbField('FLGMORAPROPORC',ftfloat,False,False,False,False,'');
   fFlgmesposterior := CreateCmDbField('FLGMESPOSTERIOR',ftfloat,False,False,False,True,'');
   fFlgjurosremunera := CreateCmDbField('FLGJUROSREMUNERA',ftfloat,False,False,False,True,'');
   fFlgindeterminado := CreateCmDbField('FLGINDETERMINADO',ftString,False,False,False,True,'');
   fFlgfianca := CreateCmDbField('FLGFIANCA',ftString,False,False,False,True,'');
   fFlgcompetaluguel := CreateCmDbField('FLGCOMPETALUGUEL',ftString,False,False,False,True,'');
   fFlgcobrancaauto := CreateCmDbField('FLGCOBRANCAAUTO',ftfloat,False,False,False,False,'');
   fDataoperacao := CreateCmDbField('DATAOPERACAO',ftDateTime,False,False,False,True,'');
   fConvlrtotal := CreateCmDbField('CONVLRTOTAL',ftfloat,False,False,False,True,'');
   fConvlrmulta := CreateCmDbField('CONVLRMULTA',ftfloat,False,False,False,True,'');
   fConvlrmora := CreateCmDbField('CONVLRMORA',ftfloat,False,False,False,True,'');
   fConvlrfianca := CreateCmDbField('CONVLRFIANCA',ftfloat,False,False,False,True,'');
   fConvlrajustado := CreateCmDbField('CONVLRAJUSTADO',ftfloat,False,False,False,True,'');
   fContaxaadmin := CreateCmDbField('CONTAXAADMIN',ftfloat,False,False,False,False,'');
   fConquantvagas := CreateCmDbField('CONQUANTVAGAS',ftfloat,False,False,False,False,'');
   fConproxreajuste := CreateCmDbField('CONPROXREAJUSTE',ftDateTime,False,False,False,True,'');
   fConperreajuste := CreateCmDbField('CONPERREAJUSTE',ftfloat,False,False,False,True,'');
   fConpermora := CreateCmDbField('CONPERMORA',ftString,False,False,False,True,'');
   fConpercentterr := CreateCmDbField('CONPERCENTTERR',ftfloat,False,False,False,True,'');
   fConpercentremuner := CreateCmDbField('CONPERCENTREMUNER',ftfloat,False,False,False,True,'');
   fConpercentmulta := CreateCmDbField('CONPERCENTMULTA',ftfloat,False,False,False,True,'');
   fConpercentmora := CreateCmDbField('CONPERCENTMORA',ftfloat,False,False,False,True,'');
   fConpercentjuros := CreateCmDbField('CONPERCENTJUROS',ftfloat,False,False,False,True,'');
   fConpercentinst := CreateCmDbField('CONPERCENTINST',ftfloat,False,False,False,True,'');
   fConpercentelet := CreateCmDbField('CONPERCENTELET',ftfloat,False,False,False,True,'');
   fConpercentedif := CreateCmDbField('CONPERCENTEDIF',ftfloat,False,False,False,True,'');
   fConperaluguel := CreateCmDbField('CONPERALUGUEL',ftfloat,False,False,False,True,'');
   fConobsfianca := CreateCmDbField('CONOBSFIANCA',ftString,False,False,False,True,'');
   fConnumero := CreateCmDbField('CONNUMERO',ftString,False,False,False,True,'');
   fConnome := CreateCmDbField('CONNOME',ftString,False,False,False,True,'');
   fConmoedamulta := CreateCmDbField('CONMOEDAMULTA',ftfloat,False,False,False,True,'');
   fConmoedamora := CreateCmDbField('CONMOEDAMORA',ftfloat,False,False,False,True,'');
   fConmesrefreajuste := CreateCmDbField('CONMESREFREAJUSTE',ftString,False,False,False,True,'');
   fConindicereajuste := CreateCmDbField('CONINDICEREAJUSTE',ftfloat,False,False,False,True,'');
   fConindicemora := CreateCmDbField('CONINDICEMORA',ftfloat,False,False,False,True,'');
   fCondiavencimento := CreateCmDbField('CONDIAVENCIMENTO',ftfloat,False,False,False,True,'');
   fCondiastolerancia := CreateCmDbField('CONDIASTOLERANCIA',ftfloat,False,False,False,False,'');
   fCondiastoleracomp := CreateCmDbField('CONDIASTOLERACOMP',ftfloat,False,False,False,True,'');
   fCondiasrepasse := CreateCmDbField('CONDIASREPASSE',ftfloat,False,False,False,False,'');
   fCondiacomplemento := CreateCmDbField('CONDIACOMPLEMENTO',ftfloat,False,False,False,True,'');
   fCondescricao := CreateCmDbField('CONDESCRICAO',ftString,False,False,False,True,'');
   fCondatarenegoc := CreateCmDbField('CONDATARENEGOC',ftDateTime,False,False,False,True,'');
   fCondatareajuste := CreateCmDbField('CONDATAREAJUSTE',ftDateTime,False,False,False,True,'');
   fCondatainicio := CreateCmDbField('CONDATAINICIO',ftDateTime,False,False,False,True,'');
   fCondatainicaren := CreateCmDbField('CONDATAINICAREN',ftDateTime,False,False,False,True,'');
   fCondatafim := CreateCmDbField('CONDATAFIM',ftDateTime,False,False,False,True,'');
   fCondatafiancaini := CreateCmDbField('CONDATAFIANCAINI',ftDateTime,False,False,False,True,'');
   fCondatafiancafim := CreateCmDbField('CONDATAFIANCAFIM',ftDateTime,False,False,False,True,'');
   fCondatafiancaav := CreateCmDbField('CONDATAFIANCAAV',ftDateTime,False,False,False,True,'');
   fCondatadenuncia := CreateCmDbField('CONDATADENUNCIA',ftDateTime,False,False,False,True,'');
   fCondatacarencia := CreateCmDbField('CONDATACARENCIA',ftDateTime,False,False,False,True,'');
   fCondataavrenegoc := CreateCmDbField('CONDATAAVRENEGOC',ftDateTime,False,False,False,True,'');
   fCondataavdenuncia := CreateCmDbField('CONDATAAVDENUNCIA',ftDateTime,False,False,False,True,'');
   fCondataassinatura := CreateCmDbField('CONDATAASSINATURA',ftDateTime,False,False,False,True,'');
   fConbancofianca := CreateCmDbField('CONBANCOFIANCA',ftfloat,False,False,False,True,'');
   fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
   fCodestado := CreateCmDbField('CODESTADO',ftString,False,False,False,True,'');
   fCondatasolresc := CreateCmDbField('CONDATASOLRESC',ftDateTime,False,False,False,True,'');
   fIdregrares := CreateCmDbField('IDREGRARES',ftfloat,False,False,False,True,'');
   fPerMultaResc := CreateCmDbField('PERMULTARESC',ftfloat,False,False,False,True,'');
   fQtdeMultaResc := CreateCmDbField('QTDEMULTARESC',ftfloat,False,False,False,True,'');
   fConPercReajuste := CreateCmDbField('CONPERCREAJUSTE',ftfloat,False,False,False,True,'');
   fIdTipoContrImob := CreateCmDbField('IDTIPOCONTRIMOB',ftFloat,False,False,False,True,'');   
end;

function TDbContratoImovel.Insert: Boolean;
begin
   fIdcontratoimovel.AsFloat := GetSequence('CONTRATOIMOVEL');
   Result := Inherited Insert;
end;


procedure TDbContratoImovel.SetCodestado(const Value: TCmDbField);
begin
  FCodestado := Value;
end;

procedure TDbContratoImovel.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbContratoImovel.SetConbancofianca(const Value: TCmDbField);
begin
  FConbancofianca := Value;
end;

procedure TDbContratoImovel.SetCondataassinatura(const Value: TCmDbField);
begin
  FCondataassinatura := Value;
end;

procedure TDbContratoImovel.SetCondataavdenuncia(const Value: TCmDbField);
begin
  FCondataavdenuncia := Value;
end;

procedure TDbContratoImovel.SetCondataavrenegoc(const Value: TCmDbField);
begin
  FCondataavrenegoc := Value;
end;

procedure TDbContratoImovel.SetCondatacarencia(const Value: TCmDbField);
begin
  FCondatacarencia := Value;
end;

procedure TDbContratoImovel.SetCondatadenuncia(const Value: TCmDbField);
begin
  FCondatadenuncia := Value;
end;

procedure TDbContratoImovel.SetCondatafiancaav(const Value: TCmDbField);
begin
  FCondatafiancaav := Value;
end;

procedure TDbContratoImovel.SetCondatafiancafim(const Value: TCmDbField);
begin
  FCondatafiancafim := Value;
end;

procedure TDbContratoImovel.SetCondatafiancaini(const Value: TCmDbField);
begin
  FCondatafiancaini := Value;
end;

procedure TDbContratoImovel.SetCondatafim(const Value: TCmDbField);
begin
  FCondatafim := Value;
end;

procedure TDbContratoImovel.SetCondatainicaren(const Value: TCmDbField);
begin
  FCondatainicaren := Value;
end;

procedure TDbContratoImovel.SetCondatainicio(const Value: TCmDbField);
begin
  FCondatainicio := Value;
end;

procedure TDbContratoImovel.SetCondatareajuste(const Value: TCmDbField);
begin
  FCondatareajuste := Value;
end;

procedure TDbContratoImovel.SetCondatarenegoc(const Value: TCmDbField);
begin
  FCondatarenegoc := Value;
end;

procedure TDbContratoImovel.SetConDataSolResc(const Value: TCmDbField);
begin
  FConDataSolResc := Value;
end;

procedure TDbContratoImovel.SetCondescricao(const Value: TCmDbField);
begin
  FCondescricao := Value;
end;

procedure TDbContratoImovel.SetCondiacomplemento(const Value: TCmDbField);
begin
  FCondiacomplemento := Value;
end;

procedure TDbContratoImovel.SetCondiasrepasse(const Value: TCmDbField);
begin
  FCondiasrepasse := Value;
end;

procedure TDbContratoImovel.SetCondiastoleracomp(const Value: TCmDbField);
begin
  FCondiastoleracomp := Value;
end;

procedure TDbContratoImovel.SetCondiastolerancia(const Value: TCmDbField);
begin
  FCondiastolerancia := Value;
end;

procedure TDbContratoImovel.SetCondiavencimento(const Value: TCmDbField);
begin
  FCondiavencimento := Value;
end;

procedure TDbContratoImovel.SetConindicemora(const Value: TCmDbField);
begin
  FConindicemora := Value;
end;

procedure TDbContratoImovel.SetConindicereajuste(const Value: TCmDbField);
begin
  FConindicereajuste := Value;
end;

procedure TDbContratoImovel.SetConmesrefreajuste(const Value: TCmDbField);
begin
  FConmesrefreajuste := Value;
end;

procedure TDbContratoImovel.SetConmoedamora(const Value: TCmDbField);
begin
  FConmoedamora := Value;
end;

procedure TDbContratoImovel.SetConmoedamulta(const Value: TCmDbField);
begin
  FConmoedamulta := Value;
end;

procedure TDbContratoImovel.SetConnome(const Value: TCmDbField);
begin
  FConnome := Value;
end;

procedure TDbContratoImovel.SetConnumero(const Value: TCmDbField);
begin
  FConnumero := Value;
end;

procedure TDbContratoImovel.SetConobsfianca(const Value: TCmDbField);
begin
  FConobsfianca := Value;
end;

procedure TDbContratoImovel.SetConperaluguel(const Value: TCmDbField);
begin
  FConperaluguel := Value;
end;

procedure TDbContratoImovel.SetConpercentedif(const Value: TCmDbField);
begin
  FConpercentedif := Value;
end;

procedure TDbContratoImovel.SetConpercentelet(const Value: TCmDbField);
begin
  FConpercentelet := Value;
end;

procedure TDbContratoImovel.SetConpercentinst(const Value: TCmDbField);
begin
  FConpercentinst := Value;
end;

procedure TDbContratoImovel.SetConpercentjuros(const Value: TCmDbField);
begin
  FConpercentjuros := Value;
end;

procedure TDbContratoImovel.SetConpercentmora(const Value: TCmDbField);
begin
  FConpercentmora := Value;
end;

procedure TDbContratoImovel.SetConpercentmulta(const Value: TCmDbField);
begin
  FConpercentmulta := Value;
end;

procedure TDbContratoImovel.SetConpercentremuner(const Value: TCmDbField);
begin
  FConpercentremuner := Value;
end;

procedure TDbContratoImovel.SetConpercentterr(const Value: TCmDbField);
begin
  FConpercentterr := Value;
end;

procedure TDbContratoImovel.SetConPercReajuste(const Value: TCmDbField);
begin
  FConPercReajuste := Value;
end;

procedure TDbContratoImovel.SetConpermora(const Value: TCmDbField);
begin
  FConpermora := Value;
end;

procedure TDbContratoImovel.SetConperreajuste(const Value: TCmDbField);
begin
  FConperreajuste := Value;
end;

procedure TDbContratoImovel.SetConproxreajuste(const Value: TCmDbField);
begin
  FConproxreajuste := Value;
end;

procedure TDbContratoImovel.SetConquantvagas(const Value: TCmDbField);
begin
  FConquantvagas := Value;
end;

procedure TDbContratoImovel.SetContaxaadmin(const Value: TCmDbField);
begin
  FContaxaadmin := Value;
end;

procedure TDbContratoImovel.SetConvlrajustado(const Value: TCmDbField);
begin
  FConvlrajustado := Value;
end;

procedure TDbContratoImovel.SetConvlrfianca(const Value: TCmDbField);
begin
  FConvlrfianca := Value;
end;

procedure TDbContratoImovel.SetConvlrmora(const Value: TCmDbField);
begin
  FConvlrmora := Value;
end;

procedure TDbContratoImovel.SetConvlrmulta(const Value: TCmDbField);
begin
  FConvlrmulta := Value;
end;

procedure TDbContratoImovel.SetConvlrtotal(const Value: TCmDbField);
begin
  FConvlrtotal := Value;
end;

procedure TDbContratoImovel.SetDataoperacao(const Value: TCmDbField);
begin
  FDataoperacao := Value;
end;

procedure TDbContratoImovel.SetFlgcobrancaauto(const Value: TCmDbField);
begin
  FFlgcobrancaauto := Value;
end;

procedure TDbContratoImovel.SetFlgcompetaluguel(const Value: TCmDbField);
begin
  FFlgcompetaluguel := Value;
end;

procedure TDbContratoImovel.SetFlgfianca(const Value: TCmDbField);
begin
  FFlgfianca := Value;
end;

procedure TDbContratoImovel.SetFlgindeterminado(const Value: TCmDbField);
begin
  FFlgindeterminado := Value;
end;

procedure TDbContratoImovel.SetFlgjurosremunera(const Value: TCmDbField);
begin
  FFlgjurosremunera := Value;
end;

procedure TDbContratoImovel.SetFlgmesposterior(const Value: TCmDbField);
begin
  FFlgmesposterior := Value;
end;

procedure TDbContratoImovel.SetFlgmoraproporc(const Value: TCmDbField);
begin
  FFlgmoraproporc := Value;
end;

procedure TDbContratoImovel.SetFlgremuneraalug(const Value: TCmDbField);
begin
  FFlgremuneraalug := Value;
end;

procedure TDbContratoImovel.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbContratoImovel.SetFlgtipoaluguel(const Value: TCmDbField);
begin
  FFlgtipoaluguel := Value;
end;

procedure TDbContratoImovel.SetFlgtipocobranca(const Value: TCmDbField);
begin
  FFlgtipocobranca := Value;
end;

procedure TDbContratoImovel.SetFlgtipocontrato(const Value: TCmDbField);
begin
  FFlgtipocontrato := Value;
end;

procedure TDbContratoImovel.SetFlgtipodiacompl(const Value: TCmDbField);
begin
  FFlgtipodiacompl := Value;
end;

procedure TDbContratoImovel.SetFlgtipodiatolera(const Value: TCmDbField);
begin
  FFlgtipodiatolera := Value;
end;

procedure TDbContratoImovel.SetFlgtipodiavenc(const Value: TCmDbField);
begin
  FFlgtipodiavenc := Value;
end;

procedure TDbContratoImovel.SetIdadminimovel(const Value: TCmDbField);
begin
  FIdadminimovel := Value;
end;

procedure TDbContratoImovel.SetIdatividade(const Value: TCmDbField);
begin
  FIdatividade := Value;
end;

procedure TDbContratoImovel.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbContratoImovel.SetIdcidades(const Value: TCmDbField);
begin
  FIdcidades := Value;
end;

procedure TDbContratoImovel.SetIdconanterior(const Value: TCmDbField);
begin
  FIdconanterior := Value;
end;

procedure TDbContratoImovel.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbContratoImovel.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbContratoImovel.SetIdindcorrecao(const Value: TCmDbField);
begin
  FIdindcorrecao := Value;
end;

procedure TDbContratoImovel.SetIdlocatario(const Value: TCmDbField);
begin
  FIdlocatario := Value;
end;

procedure TDbContratoImovel.SetIdmarca(const Value: TCmDbField);
begin
  FIdmarca := Value;
end;

procedure TDbContratoImovel.SetIdmsgboleto(const Value: TCmDbField);
begin
  FIdmsgboleto := Value;
end;

procedure TDbContratoImovel.SetIdopercontrato(const Value: TCmDbField);
begin
  FIdopercontrato := Value;
end;

procedure TDbContratoImovel.SetIdpais(const Value: TCmDbField);
begin
  FIdpais := Value;
end;

procedure TDbContratoImovel.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbContratoImovel.SetIdRegraRes(const Value: TCmDbField);
begin
  FIdRegraRes := Value;
end;

procedure TDbContratoImovel.SetIdresponsavel(const Value: TCmDbField);
begin
  FIdresponsavel := Value;
end;

procedure TDbContratoImovel.SetIdsitcontimob(const Value: TCmDbField);
begin
  FIdsitcontimob := Value;
end;

procedure TDbContratoImovel.SetIdTipoContrImob(const Value: TCmDbField);
begin
  FIdTipoContrImob := Value;
end;

procedure TDbContratoImovel.SetIdtipocustorecimo(const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

procedure TDbContratoImovel.SetIdtipoinvest(const Value: TCmDbField);
begin
  FIdtipoinvest := Value;
end;

procedure TDbContratoImovel.SetIdtipooperacao(const Value: TCmDbField);
begin
  FIdtipooperacao := Value;
end;

procedure TDbContratoImovel.SetIdtipoopersinal(const Value: TCmDbField);
begin
  FIdtipoopersinal := Value;
end;

procedure TDbContratoImovel.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbContratoImovel.SetPeraluguelideal(const Value: TCmDbField);
begin
  FPeraluguelideal := Value;
end;

procedure TDbContratoImovel.SetPerctxjurmerc(const Value: TCmDbField);
begin
  FPerctxjurmerc := Value;
end;

procedure TDbContratoImovel.SetPeritxjurmerc(const Value: TCmDbField);
begin
  FPeritxjurmerc := Value;
end;

procedure TDbContratoImovel.SetPerMultaResc(const Value: TCmDbField);
begin
  FPerMultaResc := Value;
end;

procedure TDbContratoImovel.SetQtdeMultaResc(const Value: TCmDbField);
begin
  FQtdeMultaResc := Value;
end;

procedure TDbContratoImovel.SetVlrcontabil(const Value: TCmDbField);
begin
  FVlrcontabil := Value;
end;

procedure TDbContratoImovel.SetVlroperacao(const Value: TCmDbField);
begin
  FVlroperacao := Value;
end;

procedure TDbContratoImovel.SetVlroperacaoom(const Value: TCmDbField);
begin
  FVlroperacaoom := Value;
end;

procedure TDbContratoImovel.SetVlrpresente(const Value: TCmDbField);
begin
  FVlrpresente := Value;
end;

procedure TDbContratoImovel.SetVlrproposta(const Value: TCmDbField);
begin
  FVlrproposta := Value;
end;

end.



