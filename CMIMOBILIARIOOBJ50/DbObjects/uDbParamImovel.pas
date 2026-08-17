{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamImovel;

interface

uses
   uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
   TDbParamImovel = class(TCmDbObject)

   private
      FFlgconcatenaano: TCmDbField;
      FIdclassebem: TCmDbField;
      FFlgreembolsoaut: TCmDbField;
      FFlgcomissaoalt: TCmDbField;
      FFlgparcon: TCmDbField;
      FIdpessoaloc: TCmDbField;
      FFlgdiautilap: TCmDbField;
      FFlggeratxadmin: TCmDbField;
      FFlgconsideraresp: TCmDbField;
      FFlgintcafcont: TCmDbField;
      FCodtipimovelobra: TCmDbField;
      FCodcentrorespon: TCmDbField;
      FNomevlraquisicao: TCmDbField;
      FFlgintegrafolha: TCmDbField;
      FUnidnegoc: TCmDbField;
      FIdempresa: TCmDbField;
      FFlgreavalmercado: TCmDbField;
      FFlgusasclocatario: TCmDbField;
      FFlglancpagencerra: TCmDbField;
      FFlghistcontdifap: TCmDbField;
      FCodaltcorrecao: TCmDbField;
      FFlgalimentaalter: TCmDbField;
      FFlgmesposterior: TCmDbField;
      FIdsituacao: TCmDbField;
      FProxnumcontrato: TCmDbField;
      FFlgsugerecontrato: TCmDbField;
      FFlgexibelabelcobr: TCmDbField;
      FFlgintegrareceb: TCmDbField;
      FFlgobrigacontrato: TCmDbField;
      FFlgobrigatividade: TCmDbField;
      FFlgfiltrareajuste: TCmDbField;
      FQtdemesprevfolha: TCmDbField;
      FFlgpartdcon: TCmDbField;
      FIdpessoa: TCmDbField;
      FFlgpartpim: TCmDbField;
      FFlgalimentadeprec: TCmDbField;
      FCodaltjuros: TCmDbField;
      FFlgintegracapcar: TCmDbField;
      FFlgnumproposta: TCmDbField;
      FFlgautorescisao: TCmDbField;
      FFlgdiario: TCmDbField;
      FFlgeventousuario: TCmDbField;
      FFlgusaap: TCmDbField;
      FPrazoaviso: TCmDbField;
      FFlgalteraevento: TCmDbField;
      FCodcentrocusto: TCmDbField;
      FFlgusascimovel: TCmDbField;
      FFlgalimentadata: TCmDbField;
      FFlgintegrapag: TCmDbField;
      FMescompetencia: TCmDbField;
      FIdtcustorecimocom: TCmDbField;
      FFlgpartdim: TCmDbField;
      FAnocompetencia: TCmDbField;
      FFlgvencdiautil: TCmDbField;
      FCodaltmulta: TCmDbField;
      FFlgintegracontab: TCmDbField;
      FFlgintegragestao: TCmDbField;
      FFlgfiltraencerra: TCmDbField;
      FFlgintegraorcamen: TCmDbField;
      FFlglancrescindido: TCmDbField;
      FFlgaluguelzero: TCmDbField;
      FFlgpartpdes: TCmDbField;
      FFlgmultitipo: TCmDbField;
      FFlglancrecencerra: TCmDbField;
      FFlgobrigaalttipo: TCmDbField;
      FIdprograma: TCmDbField;
      FFlgpartdtpim: TCmDbField;
      FCodportforma: TCmDbField;
      FFlgintegraativo: TCmDbField;
      FIdlocalizacao: TCmDbField;
      FFlgparim: TCmDbField;
      FFlgtoleracompl: TCmDbField;
      FFlgusainvestimob: TCmDbField;
      FFlglancrecinativo: TCmDbField;
      FMesBloqLancto: TCmDbField;
      FIdTCustoRecImoAlu: TCmDbField;
      FFlglancpaginativo: TCmDbField;
      FFlgAviso: TCmDbField;
      FTipoImovelPatro: TCmDbField;
      FIdOperAtualMulta: TCmDbField;
      FIdOperAtualJuros: TCmDbField;
      FIdOperAtualCM: TCmDbField;
      FIdOperProvPer: TCmDbField;
      FIdOperProvRec: TCmDbField;
      FFlgLogoRelat: TCmDbField;

      // Marcio Motta - 25/06/2004
      FFlgcalcinadimp: TCmDbField;

      // André Pontes - 15/08/2005 - pendência 19875
      FFlgBloqRecAluguel: TCmDbField;
    FFLGTIPODATAPROG: TCmDbField;

      procedure SetAnocompetencia(const Value: TCmDbField);
      procedure SetCodaltcorrecao(const Value: TCmDbField);
      procedure SetCodaltjuros(const Value: TCmDbField);
      procedure SetCodaltmulta(const Value: TCmDbField);
      procedure SetCodcentrocusto(const Value: TCmDbField);
      procedure SetCodcentrorespon(const Value: TCmDbField);
      procedure SetCodportforma(const Value: TCmDbField);
      procedure SetCodtipimovelobra(const Value: TCmDbField);
      procedure SetFlgalimentaalter(const Value: TCmDbField);
      procedure SetFlgalimentadata(const Value: TCmDbField);
      procedure SetFlgalimentadeprec(const Value: TCmDbField);
      procedure SetFlgalteraevento(const Value: TCmDbField);
      procedure SetFlgaluguelzero(const Value: TCmDbField);
      procedure SetFlgautorescisao(const Value: TCmDbField);
      procedure SetFlgcomissaoalt(const Value: TCmDbField);
      procedure SetFlgconcatenaano(const Value: TCmDbField);
      procedure SetFlgconsideraresp(const Value: TCmDbField);
      procedure SetFlgdiario(const Value: TCmDbField);
      procedure SetFlgdiautilap(const Value: TCmDbField);
      procedure SetFlgeventousuario(const Value: TCmDbField);
      procedure SetFlgexibelabelcobr(const Value: TCmDbField);
      procedure SetFlgfiltraencerra(const Value: TCmDbField);
      procedure SetFlgfiltrareajuste(const Value: TCmDbField);
      procedure SetFlggeratxadmin(const Value: TCmDbField);
      procedure SetFlghistcontdifap(const Value: TCmDbField);
      procedure SetFlgintcafcont(const Value: TCmDbField);
      procedure SetFlgintegraativo(const Value: TCmDbField);
      procedure SetFlgintegracapcar(const Value: TCmDbField);
      procedure SetFlgintegracontab(const Value: TCmDbField);
      procedure SetFlgintegrafolha(const Value: TCmDbField);
      procedure SetFlgintegragestao(const Value: TCmDbField);
      procedure SetFlgintegraorcamen(const Value: TCmDbField);
      procedure SetFlgintegrapag(const Value: TCmDbField);
      procedure SetFlgintegrareceb(const Value: TCmDbField);
      procedure SetFlglancpagencerra(const Value: TCmDbField);
      procedure SetFlglancrecencerra(const Value: TCmDbField);
      procedure SetFlglancrescindido(const Value: TCmDbField);
      procedure SetFlgmesposterior(const Value: TCmDbField);
      procedure SetFlgmultitipo(const Value: TCmDbField);
      procedure SetFlgnumproposta(const Value: TCmDbField);
      procedure SetFlgobrigaalttipo(const Value: TCmDbField);
      procedure SetFlgobrigacontrato(const Value: TCmDbField);
      procedure SetFlgobrigatividade(const Value: TCmDbField);
      procedure SetFlgparcon(const Value: TCmDbField);
      procedure SetFlgparim(const Value: TCmDbField);
      procedure SetFlgpartdcon(const Value: TCmDbField);
      procedure SetFlgpartdim(const Value: TCmDbField);
      procedure SetFlgpartdtpim(const Value: TCmDbField);
      procedure SetFlgpartpdes(const Value: TCmDbField);
      procedure SetFlgpartpim(const Value: TCmDbField);
      procedure SetFlgreavalmercado(const Value: TCmDbField);
      procedure SetFlgreembolsoaut(const Value: TCmDbField);
      procedure SetFlgsugerecontrato(const Value: TCmDbField);
      procedure SetFlgtoleracompl(const Value: TCmDbField);
      procedure SetFlgusaap(const Value: TCmDbField);
      procedure SetFlgusascimovel(const Value: TCmDbField);
      procedure SetFlgusasclocatario(const Value: TCmDbField);
      procedure SetFlgvencdiautil(const Value: TCmDbField);
      procedure SetIdclassebem(const Value: TCmDbField);
      procedure SetIdempresa(const Value: TCmDbField);
      procedure SetIdlocalizacao(const Value: TCmDbField);
      procedure SetIdpessoa(const Value: TCmDbField);
      procedure SetIdpessoaloc(const Value: TCmDbField);
      procedure SetIdprograma(const Value: TCmDbField);
      procedure SetIdsituacao(const Value: TCmDbField);
      procedure SetIdtcustorecimocom(const Value: TCmDbField);
      procedure SetMescompetencia(const Value: TCmDbField);
      procedure SetNomevlraquisicao(const Value: TCmDbField);
      procedure SetPrazoaviso(const Value: TCmDbField);
      procedure SetProxnumcontrato(const Value: TCmDbField);
      procedure SetQtdemesprevfolha(const Value: TCmDbField);
      procedure SetUnidnegoc(const Value: TCmDbField);
      procedure SetFlgusainvestimob(const Value: TCmDbField);
      procedure SetFlglancrecinativo(const Value: TCmDbField);
      procedure SetMesBloqLancto(const Value: TCmDbField);
      procedure SetIdTCustoRecImoAlu(const Value: TCmDbField);
      procedure SetFlglancpaginativo(const Value: TCmDbField);
      procedure SetFlgAviso(const Value: TCmDbField);
      procedure SetTipoImovelPatro(const Value: TCmDbField);
      procedure SetIdOperAtualCM(const Value: TCmDbField);
      procedure SetIdOperAtualJuros(const Value: TCmDbField);
      procedure SetIdOperAtualMulta(const Value: TCmDbField);
      procedure SetIdOperProvPer(const Value: TCmDbField);
      procedure SetIdOperProvRec(const Value: TCmDbField);
      procedure SetFlgLogoRelat(const Value: TCmDbField);
      procedure SetFlgcalcinadimp(const Value: TCmDbField);
      procedure SetFlgBloqRecAluguel(const Value: TCmDbField);
    procedure SetFLGTIPODATAPROG(const Value: TCmDbField);

   public

      property Unidnegoc         : TCmDbField   read FUnidnegoc            write SetUnidnegoc;
      property Qtdemesprevfolha  : TCmDbField   read FQtdemesprevfolha     write SetQtdemesprevfolha;
      property Proxnumcontrato   : TCmDbField   read FProxnumcontrato      write SetProxnumcontrato;
      property Prazoaviso        : TCmDbField   read FPrazoaviso           write SetPrazoaviso;
      property Nomevlraquisicao  : TCmDbField   read FNomevlraquisicao     write SetNomevlraquisicao;
      property Mescompetencia    : TCmDbField   read FMescompetencia       write SetMescompetencia;
      property Idtcustorecimocom : TCmDbField   read FIdtcustorecimocom    write SetIdtcustorecimocom;
      property Idsituacao        : TCmDbField   read FIdsituacao           write SetIdsituacao;
      property Idprograma        : TCmDbField   read FIdprograma           write SetIdprograma;
      property Idpessoaloc       : TCmDbField   read FIdpessoaloc          write SetIdpessoaloc;
      property Idpessoa          : TCmDbField   read FIdpessoa             write SetIdpessoa;
      property Idlocalizacao     : TCmDbField   read FIdlocalizacao        write SetIdlocalizacao;
      property Idempresa         : TCmDbField   read FIdempresa            write SetIdempresa;
      property Idclassebem       : TCmDbField   read FIdclassebem          write SetIdclassebem;
      property Flgvencdiautil    : TCmDbField   read FFlgvencdiautil       write SetFlgvencdiautil;
      property Flgusasclocatario : TCmDbField   read FFlgusasclocatario    write SetFlgusasclocatario;
      property Flgusascimovel    : TCmDbField   read FFlgusascimovel       write SetFlgusascimovel;
      property Flgusainvestimob  : TCmDbField   read FFlgusainvestimob     write SetFlgusainvestimob;
      property Flgusaap          : TCmDbField   read FFlgusaap             write SetFlgusaap;
      property Flgtoleracompl    : TCmDbField   read FFlgtoleracompl       write SetFlgtoleracompl;
      property Flgsugerecontrato : TCmDbField   read FFlgsugerecontrato    write SetFlgsugerecontrato;
      property Flgreembolsoaut   : TCmDbField   read FFlgreembolsoaut      write SetFlgreembolsoaut;
      property Flgreavalmercado  : TCmDbField   read FFlgreavalmercado     write SetFlgreavalmercado;
      property Flgpartpim        : TCmDbField   read FFlgpartpim           write SetFlgpartpim;
      property Flgpartpdes       : TCmDbField   read FFlgpartpdes          write SetFlgpartpdes;
      property Flgpartdtpim      : TCmDbField   read FFlgpartdtpim         write SetFlgpartdtpim;
      property Flgpartdim        : TCmDbField   read FFlgpartdim           write SetFlgpartdim;
      property Flgpartdcon       : TCmDbField   read FFlgpartdcon          write SetFlgpartdcon;
      property Flgparim          : TCmDbField   read FFlgparim             write SetFlgparim;
      property Flgparcon         : TCmDbField   read FFlgparcon            write SetFlgparcon;
      property Flgobrigatividade : TCmDbField   read FFlgobrigatividade    write SetFlgobrigatividade;
      property Flgobrigacontrato : TCmDbField   read FFlgobrigacontrato    write SetFlgobrigacontrato;
      property Flgobrigaalttipo  : TCmDbField   read FFlgobrigaalttipo     write SetFlgobrigaalttipo;
      property Flgnumproposta    : TCmDbField   read FFlgnumproposta       write SetFlgnumproposta;
      property Flgmultitipo      : TCmDbField   read FFlgmultitipo         write SetFlgmultitipo;
      property Flgmesposterior   : TCmDbField   read FFlgmesposterior      write SetFlgmesposterior;
      property Flglancrescindido : TCmDbField   read FFlglancrescindido    write SetFlglancrescindido;
      property Flglancrecinativo : TCmDbField   read FFlglancrecinativo    write SetFlglancrecinativo;
      property Flglancrecencerra : TCmDbField   read FFlglancrecencerra    write SetFlglancrecencerra;
      property Flglancpagencerra : TCmDbField   read FFlglancpagencerra    write SetFlglancpagencerra;
      property Flglancpaginativo : TCmDbField   read FFlglancpaginativo    write SetFlglancpaginativo;
      property Flgintegrareceb   : TCmDbField   read FFlgintegrareceb      write SetFlgintegrareceb;
      property Flgintegrapag     : TCmDbField   read FFlgintegrapag        write SetFlgintegrapag;
      property Flgintegraorcamen : TCmDbField   read FFlgintegraorcamen    write SetFlgintegraorcamen;
      property Flgintegragestao  : TCmDbField   read FFlgintegragestao     write SetFlgintegragestao;
      property Flgintegrafolha   : TCmDbField   read FFlgintegrafolha      write SetFlgintegrafolha;
      property Flgintegracontab  : TCmDbField   read FFlgintegracontab     write SetFlgintegracontab;
      property Flgintegracapcar  : TCmDbField   read FFlgintegracapcar     write SetFlgintegracapcar;
      property Flgintegraativo   : TCmDbField   read FFlgintegraativo      write SetFlgintegraativo;
      property Flgintcafcont     : TCmDbField   read FFlgintcafcont        write SetFlgintcafcont;
      property Flghistcontdifap  : TCmDbField   read FFlghistcontdifap     write SetFlghistcontdifap;
      property Flggeratxadmin    : TCmDbField   read FFlggeratxadmin       write SetFlggeratxadmin;
      property Flgfiltrareajuste : TCmDbField   read FFlgfiltrareajuste    write SetFlgfiltrareajuste;
      property Flgfiltraencerra  : TCmDbField   read FFlgfiltraencerra     write SetFlgfiltraencerra;
      property Flgexibelabelcobr : TCmDbField   read FFlgexibelabelcobr    write SetFlgexibelabelcobr;
      property Flgeventousuario  : TCmDbField   read FFlgeventousuario     write SetFlgeventousuario;
      property Flgdiautilap      : TCmDbField   read FFlgdiautilap         write SetFlgdiautilap;
      property Flgdiario         : TCmDbField   read FFlgdiario            write SetFlgdiario;
      property IdOperAtualMulta  : TCmDbField   read FIdOperAtualMulta     write SetIdOperAtualMulta;
      property IdOperAtualJuros  : TCmDbField   read FIdOperAtualJuros     write SetIdOperAtualJuros;
      property IdOperAtualCM     : TCmDbField   read FIdOperAtualCM        write SetIdOperAtualCM;
      property IdOperProvPer     : TCmDbField   read FIdOperProvPer        write SetIdOperProvPer;
      property IdOperProvRec     : TCmDbField   read FIdOperProvRec        write SetIdOperProvRec;
      property Flgconsideraresp  : TCmDbField   read FFlgconsideraresp     write SetFlgconsideraresp;
      property Flgconcatenaano   : TCmDbField   read FFlgconcatenaano      write SetFlgconcatenaano;
      property Flgcomissaoalt    : TCmDbField   read FFlgcomissaoalt       write SetFlgcomissaoalt;
      property Flgautorescisao   : TCmDbField   read FFlgautorescisao      write SetFlgautorescisao;
      property Flgaluguelzero    : TCmDbField   read FFlgaluguelzero       write SetFlgaluguelzero;
      property Flgalteraevento   : TCmDbField   read FFlgalteraevento      write SetFlgalteraevento;
      property Flgalimentadeprec : TCmDbField   read FFlgalimentadeprec    write SetFlgalimentadeprec;
      property Flgalimentadata   : TCmDbField   read FFlgalimentadata      write SetFlgalimentadata;
      property Flgalimentaalter  : TCmDbField   read FFlgalimentaalter     write SetFlgalimentaalter;
      property Codtipimovelobra  : TCmDbField   read FCodtipimovelobra     write SetCodtipimovelobra;
      property Codportforma      : TCmDbField   read FCodportforma         write SetCodportforma;
      property Codcentrorespon   : TCmDbField   read FCodcentrorespon      write SetCodcentrorespon;
      property Codcentrocusto    : TCmDbField   read FCodcentrocusto       write SetCodcentrocusto;
      property Codaltmulta       : TCmDbField   read FCodaltmulta          write SetCodaltmulta;
      property Codaltjuros       : TCmDbField   read FCodaltjuros          write SetCodaltjuros;
      property Codaltcorrecao    : TCmDbField   read FCodaltcorrecao       write SetCodaltcorrecao;
      property Anocompetencia    : TCmDbField   read FAnocompetencia       write SetAnocompetencia;
      property MesBloqLancto     : TCmDbField   read FMesBloqLancto        write SetMesBloqLancto;
      property IdTCustoRecImoAlu : TCmDbField   read FIdTCustoRecImoAlu    write SetIdTCustoRecImoAlu;
      property TipoImovelPatro   : TCmDbField   read FTipoImovelPatro      write SetTipoImovelPatro;
      property FlgAviso          : TCmDbField   read FFlgAviso             write SetFlgAviso;
      property FlgLogoRelat      : TCmDbField   read FFlgLogoRelat         write SetFlgLogoRelat;
      property Flgcalcinadimp    : TCmDbField   read FFlgcalcinadimp       write SetFlgcalcinadimp;

      // André Pontes - 15/08/2005 - pendência 19875
      property FlgBloqRecAluguel : TCmDbField   read FFlgBloqRecAluguel    write SetFlgBloqRecAluguel;
      // FIM André Pontes - 15/08/2005 - pendência 19875

      property FLGTIPODATAPROG: TCmDbField read FFLGTIPODATAPROG write SetFLGTIPODATAPROG;
      constructor Create(Aowner: TCmCustomCdbObject); override;

      function Insert :Boolean; override;

  end;



implementation
{ TDbParamImovel }



constructor TDbParamImovel.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName   := 'PARAMIMOVEL';

   fUnidnegoc           := CreateCmDbField('UNIDNEGOC',           ftfloat,  False, False, False, True,  '');
   fQtdemesprevfolha    := CreateCmDbField('QTDEMESPREVFOLHA',    ftfloat,  False, False, False, True,  '');
   fProxnumcontrato     := CreateCmDbField('PROXNUMCONTRATO',     ftfloat,  False, False, False, True,  '');
   fPrazoaviso          := CreateCmDbField('PRAZOAVISO',          ftfloat,  False, False, False, True,  '');
   fNomevlraquisicao    := CreateCmDbField('NOMEVLRAQUISICAO',    ftString, False, False, False, True,  '');
   fMescompetencia      := CreateCmDbField('MESCOMPETENCIA',      ftfloat,  False, False, False, True,  '');
   fIdtcustorecimocom   := CreateCmDbField('IDTCUSTORECIMOCOM',   ftfloat,  False, False, False, True,  '');
   fIdsituacao          := CreateCmDbField('IDSITUACAO',          ftfloat,  False, False, False, True,  '');
   fIdprograma          := CreateCmDbField('IDPROGRAMA',          ftfloat,  False, False, False, True,  '');
   fIdpessoaloc         := CreateCmDbField('IDPESSOALOC',         ftfloat,  False, False, False, True,  '');
   fIdpessoa            := CreateCmDbField('IDPESSOA',            ftfloat,  True,  True,  False, True,  '');
   fIdlocalizacao       := CreateCmDbField('IDLOCALIZACAO',       ftfloat,  False, False, False, True,  '');
   fIdempresa           := CreateCmDbField('IDEMPRESA',           ftfloat,  False, False, False, True,  '');
   fIdclassebem         := CreateCmDbField('IDCLASSEBEM',         ftfloat,  False, False, False, True,  '');
   fFlgvencdiautil      := CreateCmDbField('FLGVENCDIAUTIL',      ftfloat,  False, False, False, True,  '');
   fFlgusasclocatario   := CreateCmDbField('FLGUSASCLOCATARIO',   ftfloat,  False, False, False, False, '');
   fFlgusascimovel      := CreateCmDbField('FLGUSASCIMOVEL',      ftfloat,  False, False, False, False, '');
   fFlgusascimovel      := CreateCmDbField('FLGUSAINVESTIMOB',    ftString, False, False, False, True,  '');
   fFlgusaap            := CreateCmDbField('FLGUSAAP',            ftfloat,  False, False, False, True,  '');
   fFlgtoleracompl      := CreateCmDbField('FLGTOLERACOMPL',      ftfloat,  False, False, False, True,  '');
   fFlgsugerecontrato   := CreateCmDbField('FLGSUGERECONTRATO',   ftfloat,  False, False, False, True,  '');
   fFlgreembolsoaut     := CreateCmDbField('FLGREEMBOLSOAUT',     ftfloat,  False, False, False, True,  '');
   fFlgreavalmercado    := CreateCmDbField('FLGREAVALMERCADO',    ftfloat,  False, False, False, True,  '');
   fFlgpartpim          := CreateCmDbField('FLGPARTPIM',          ftfloat,  False, False, False, True,  '');
   fFlgpartpdes         := CreateCmDbField('FLGPARTPDES',         ftfloat,  False, False, False, True,  '');
   fFlgpartdtpim        := CreateCmDbField('FLGPARTDTPIM',        ftfloat,  False, False, False, True,  '');
   fFlgpartdim          := CreateCmDbField('FLGPARTDIM',          ftfloat,  False, False, False, True,  '');
   fFlgpartdcon         := CreateCmDbField('FLGPARTDCON',         ftfloat,  False, False, False, True,  '');
   fFlgparim            := CreateCmDbField('FLGPARIM',            ftfloat,  False, False, False, True,  '');
   fFlgparcon           := CreateCmDbField('FLGPARCON',           ftfloat,  False, False, False, True,  '');
   fFlgobrigatividade   := CreateCmDbField('FLGOBRIGATIVIDADE',   ftfloat,  False, False, False, True,  '');
   fFlgobrigacontrato   := CreateCmDbField('FLGOBRIGACONTRATO',   ftfloat,  False, False, False, True,  '');
   fFlgobrigaalttipo    := CreateCmDbField('FLGOBRIGAALTTIPO',    ftfloat,  False, False, False, True,  '');
   fFlgnumproposta      := CreateCmDbField('FLGNUMPROPOSTA',      ftfloat,  False, False, False, True,  '');
   fFlgmultitipo        := CreateCmDbField('FLGMULTITIPO',        ftfloat,  False, False, False, True,  '');
   fFlgmesposterior     := CreateCmDbField('FLGMESPOSTERIOR',     ftfloat,  False, False, False, True,  '');
   fFlglancrescindido   := CreateCmDbField('FLGLANCRESCINDIDO',   ftfloat,  False, False, False, True,  '');
   fFlglancrecinativo   := CreateCmDbField('FLGLANCRECINATIVO',   ftfloat,  False, False, False, False, '');
   fFlglancrecencerra   := CreateCmDbField('FLGLANCRECENCERRA',   ftfloat,  False, False, False, False, '');
   fFlglancpagencerra   := CreateCmDbField('FLGLANCPAGENCERRA',   ftfloat,  False, False, False, False, '');
   fFlglancpaginativo   := CreateCmDbField('FLGLANCPAGINATIVO',   ftString, False, False, False, False, '');
   fFlgintegrareceb     := CreateCmDbField('FLGINTEGRARECEB',     ftfloat,  False, False, False, True,  '');
   fFlgintegrapag       := CreateCmDbField('FLGINTEGRAPAG',       ftfloat,  False, False, False, True,  '');
   fFlgintegraorcamen   := CreateCmDbField('FLGINTEGRAORCAMEN',   ftfloat,  False, False, False, True,  '');
   fFlgintegragestao    := CreateCmDbField('FLGINTEGRAGESTAO',    ftfloat,  False, False, False, True,  '');
   fFlgintegrafolha     := CreateCmDbField('FLGINTEGRAFOLHA',     ftfloat,  False, False, False, True,  '');
   fFlgintegracontab    := CreateCmDbField('FLGINTEGRACONTAB',    ftfloat,  False, False, False, True,  '');
   fFlgintegracapcar    := CreateCmDbField('FLGINTEGRACAPCAR',    ftfloat,  False, False, False, True,  '');
   fFlgintegraativo     := CreateCmDbField('FLGINTEGRAATIVO',     ftfloat,  False, False, False, True,  '');
   fFlgintcafcont       := CreateCmDbField('FLGINTCAFCONT',       ftfloat,  False, False, False, True,  '');
   fFlghistcontdifap    := CreateCmDbField('FLGHISTCONTDIFAP',    ftfloat,  False, False, False, True,  '');
   fFlggeratxadmin      := CreateCmDbField('FLGGERATXADMIN',      ftfloat,  False, False, False, True,  '');
   fFlgfiltrareajuste   := CreateCmDbField('FLGFILTRAREAJUSTE',   ftfloat,  False, False, False, True,  '');
   fFlgfiltraencerra    := CreateCmDbField('FLGFILTRAENCERRA',    ftfloat,  False, False, False, True,  '');
   fFlgexibelabelcobr   := CreateCmDbField('FLGEXIBELABELCOBR',   ftfloat,  False, False, False, True,  '');
   fFlgeventousuario    := CreateCmDbField('FLGEVENTOUSUARIO',    ftfloat,  False, False, False, True,  '');
   fFlgdiautilap        := CreateCmDbField('FLGDIAUTILAP',        ftString, False, False, False, True,  '');
   fFlgdiario           := CreateCmDbField('FLGDIARIO',           ftString, False, False, False, True,  '');
   fIdOperAtualMulta    := CreateCmDbField('IDOPERATUALMULTA',    ftfloat,  False, False, False, True,  '');
   fIdOperAtualJuros    := CreateCmDbField('IDOPERATUALJUROS',    ftfloat,  False, False, False, True,  '');
   fIdOperAtualCM       := CreateCmDbField('IDOPERATUALCM',       ftfloat,  False, False, False, True,  '');
   fIdOperProvPer       := CreateCmDbField('IDOPERPROVPER',       ftfloat,  False, False, False, True,  '');
   fIdOperProvRec       := CreateCmDbField('IDOPERPROVREC',       ftfloat,  False, False, False, True,  '');
   fFlgconsideraresp    := CreateCmDbField('FLGCONSIDERARESP',    ftfloat,  True,  False, False, True,  '');
   fFlgconcatenaano     := CreateCmDbField('FLGCONCATENAANO',     ftfloat,  False, False, False, True,  '');
   fFlgcomissaoalt      := CreateCmDbField('FLGCOMISSAOALT',      ftfloat,  False, False, False, True,  '');
   fFlgautorescisao     := CreateCmDbField('FLGAUTORESCISAO',     ftfloat,  False, False, False, True,  '');
   fFlgaluguelzero      := CreateCmDbField('FLGALUGUELZERO',      ftfloat,  False, False, False, True,  '');
   fFlgalteraevento     := CreateCmDbField('FLGALTERAEVENTO',     ftfloat,  False, False, False, True,  '');
   fFlgalimentadeprec   := CreateCmDbField('FLGALIMENTADEPREC',   ftfloat,  False, False, False, True,  '');
   fFlgalimentadata     := CreateCmDbField('FLGALIMENTADATA',     ftString, False, False, False, True,  '');
   fFlgalimentaalter    := CreateCmDbField('FLGALIMENTAALTER',    ftfloat,  False, False, False, True,  '');
   fCodtipimovelobra    := CreateCmDbField('CODTIPIMOVELOBRA',    ftString, False, False, False, True,  '');
   fCodportforma        := CreateCmDbField('CODPORTFORMA',        ftfloat,  False, False, False, True,  '');
   fCodcentrorespon     := CreateCmDbField('CODCENTRORESPON',     ftString, False, False, False, True,  '');
   fCodcentrocusto      := CreateCmDbField('CODCENTROCUSTO',      ftString, False, False, False, True,  '');
   fCodaltmulta         := CreateCmDbField('CODALTMULTA',         ftfloat,  False, False, False, True,  '');
   fCodaltjuros         := CreateCmDbField('CODALTJUROS',         ftfloat,  False, False, False, True,  '');
   fCodaltcorrecao      := CreateCmDbField('CODALTCORRECAO',      ftfloat,  False, False, False, True,  '');
   fAnocompetencia      := CreateCmDbField('ANOCOMPETENCIA',      ftfloat,  False, False, False, True,  '');
   fMesBloqLancto       := CreateCmDbField('MESBLOQLANCTO',       ftfloat,  False, False, False, False, '');
   fIdTCustoRecImoAlu   := CreateCmDbField('IDTCUSTORECIMOALU',   ftfloat,  False, False, False, True,  '');
   fTipoImovelPatro     := CreateCmDbField('TIPOIMOVELPATRO',     ftString, False, False, False, True,  '');
   fFlgAviso            := CreateCmDbField('FLGAVISO',            ftString, False, False, False, True,  '');
   fFlgLogoRelat        := CreateCmDbField('FLGLOGORELAT',        ftString, False, False, False, True,  '');
   fFlgcalcinadimp      := CreateCmDbField('FLGCALCINADIMP',      ftString, False, False, False, False, '');
   fFLGTIPODATAPROG     := CreateCmDbField('FLGTIPODATAPROG',     ftString, False, False, False, True, '');
end;



function TDbParamImovel.Insert: Boolean;
begin
   fIdpessoa.AsFloat := GetSequence('PARAMIMOVEL');
   Result := Inherited Insert;
end;

procedure TDbParamImovel.SetAnocompetencia(const Value: TCmDbField);
begin
  FAnocompetencia := Value;
end;

procedure TDbParamImovel.SetCodaltcorrecao(const Value: TCmDbField);
begin
  FCodaltcorrecao := Value;
end;

procedure TDbParamImovel.SetCodaltjuros(const Value: TCmDbField);
begin
  FCodaltjuros := Value;
end;

procedure TDbParamImovel.SetCodaltmulta(const Value: TCmDbField);
begin
  FCodaltmulta := Value;
end;

procedure TDbParamImovel.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbParamImovel.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbParamImovel.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbParamImovel.SetCodtipimovelobra(const Value: TCmDbField);
begin
  FCodtipimovelobra := Value;
end;

procedure TDbParamImovel.SetFlgalimentaalter(const Value: TCmDbField);
begin
  FFlgalimentaalter := Value;
end;

procedure TDbParamImovel.SetFlgalimentadata(const Value: TCmDbField);
begin
  FFlgalimentadata := Value;
end;

procedure TDbParamImovel.SetFlgalimentadeprec(const Value: TCmDbField);
begin
  FFlgalimentadeprec := Value;
end;

procedure TDbParamImovel.SetFlgalteraevento(const Value: TCmDbField);
begin
  FFlgalteraevento := Value;
end;

procedure TDbParamImovel.SetFlgaluguelzero(const Value: TCmDbField);
begin
  FFlgaluguelzero := Value;
end;

procedure TDbParamImovel.SetFlgautorescisao(const Value: TCmDbField);
begin
  FFlgautorescisao := Value;
end;

procedure TDbParamImovel.SetFlgAviso(const Value: TCmDbField);
begin
  FFlgAviso := Value;
end;

procedure TDbParamImovel.SetFlgBloqRecAluguel(const Value: TCmDbField);
begin
  FFlgBloqRecAluguel := Value;
end;

procedure TDbParamImovel.SetFlgcalcinadimp(const Value: TCmDbField);
begin
  FFlgcalcinadimp := Value;
end;

procedure TDbParamImovel.SetFlgcomissaoalt(const Value: TCmDbField);
begin
  FFlgcomissaoalt := Value;
end;

procedure TDbParamImovel.SetFlgconcatenaano(const Value: TCmDbField);
begin
  FFlgconcatenaano := Value;
end;

procedure TDbParamImovel.SetFlgconsideraresp(const Value: TCmDbField);
begin
  FFlgconsideraresp := Value;
end;

procedure TDbParamImovel.SetFlgdiario(const Value: TCmDbField);
begin
  FFlgdiario := Value;
end;

procedure TDbParamImovel.SetFlgdiautilap(const Value: TCmDbField);
begin
  FFlgdiautilap := Value;
end;

procedure TDbParamImovel.SetFlgeventousuario(const Value: TCmDbField);
begin
  FFlgeventousuario := Value;
end;

procedure TDbParamImovel.SetFlgexibelabelcobr(const Value: TCmDbField);
begin
  FFlgexibelabelcobr := Value;
end;

procedure TDbParamImovel.SetFlgfiltraencerra(const Value: TCmDbField);
begin
  FFlgfiltraencerra := Value;
end;

procedure TDbParamImovel.SetFlgfiltrareajuste(const Value: TCmDbField);
begin
  FFlgfiltrareajuste := Value;
end;

procedure TDbParamImovel.SetFlggeratxadmin(const Value: TCmDbField);
begin
  FFlggeratxadmin := Value;
end;

procedure TDbParamImovel.SetFlghistcontdifap(const Value: TCmDbField);
begin
  FFlghistcontdifap := Value;
end;

procedure TDbParamImovel.SetFlgintcafcont(const Value: TCmDbField);
begin
  FFlgintcafcont := Value;
end;

procedure TDbParamImovel.SetFlgintegraativo(const Value: TCmDbField);
begin
  FFlgintegraativo := Value;
end;

procedure TDbParamImovel.SetFlgintegracapcar(const Value: TCmDbField);
begin
  FFlgintegracapcar := Value;
end;

procedure TDbParamImovel.SetFlgintegracontab(const Value: TCmDbField);
begin
  FFlgintegracontab := Value;
end;

procedure TDbParamImovel.SetFlgintegrafolha(const Value: TCmDbField);
begin
  FFlgintegrafolha := Value;
end;

procedure TDbParamImovel.SetFlgintegragestao(const Value: TCmDbField);
begin
  FFlgintegragestao := Value;
end;

procedure TDbParamImovel.SetFlgintegraorcamen(const Value: TCmDbField);
begin
  FFlgintegraorcamen := Value;
end;

procedure TDbParamImovel.SetFlgintegrapag(const Value: TCmDbField);
begin
  FFlgintegrapag := Value;
end;

procedure TDbParamImovel.SetFlgintegrareceb(const Value: TCmDbField);
begin
  FFlgintegrareceb := Value;
end;

procedure TDbParamImovel.SetFlglancpagencerra(const Value: TCmDbField);
begin
  FFlglancpagencerra := Value;
end;

procedure TDbParamImovel.SetFlglancpaginativo(const Value: TCmDbField);
begin
  FFlglancpaginativo := Value;
end;

procedure TDbParamImovel.SetFlglancrecencerra(const Value: TCmDbField);
begin
  FFlglancrecencerra := Value;
end;

procedure TDbParamImovel.SetFlglancrecinativo(const Value: TCmDbField);
begin
  FFlglancrecinativo := Value;
end;

procedure TDbParamImovel.SetFlglancrescindido(const Value: TCmDbField);
begin
  FFlglancrescindido := Value;
end;

procedure TDbParamImovel.SetFlgLogoRelat(const Value: TCmDbField);
begin
  FFlgLogoRelat := Value;
end;

procedure TDbParamImovel.SetFlgmesposterior(const Value: TCmDbField);
begin
  FFlgmesposterior := Value;
end;

procedure TDbParamImovel.SetFlgmultitipo(const Value: TCmDbField);
begin
  FFlgmultitipo := Value;
end;

procedure TDbParamImovel.SetFlgnumproposta(const Value: TCmDbField);
begin
  FFlgnumproposta := Value;
end;

procedure TDbParamImovel.SetFlgobrigaalttipo(const Value: TCmDbField);
begin
  FFlgobrigaalttipo := Value;
end;

procedure TDbParamImovel.SetFlgobrigacontrato(const Value: TCmDbField);
begin
  FFlgobrigacontrato := Value;
end;

procedure TDbParamImovel.SetFlgobrigatividade(const Value: TCmDbField);
begin
  FFlgobrigatividade := Value;
end;

procedure TDbParamImovel.SetFlgparcon(const Value: TCmDbField);
begin
  FFlgparcon := Value;
end;

procedure TDbParamImovel.SetFlgparim(const Value: TCmDbField);
begin
  FFlgparim := Value;
end;

procedure TDbParamImovel.SetFlgpartdcon(const Value: TCmDbField);
begin
  FFlgpartdcon := Value;
end;

procedure TDbParamImovel.SetFlgpartdim(const Value: TCmDbField);
begin
  FFlgpartdim := Value;
end;

procedure TDbParamImovel.SetFlgpartdtpim(const Value: TCmDbField);
begin
  FFlgpartdtpim := Value;
end;

procedure TDbParamImovel.SetFlgpartpdes(const Value: TCmDbField);
begin
  FFlgpartpdes := Value;
end;

procedure TDbParamImovel.SetFlgpartpim(const Value: TCmDbField);
begin
  FFlgpartpim := Value;
end;

procedure TDbParamImovel.SetFlgreavalmercado(const Value: TCmDbField);
begin
  FFlgreavalmercado := Value;
end;

procedure TDbParamImovel.SetFlgreembolsoaut(const Value: TCmDbField);
begin
  FFlgreembolsoaut := Value;
end;

procedure TDbParamImovel.SetFlgsugerecontrato(const Value: TCmDbField);
begin
  FFlgsugerecontrato := Value;
end;

procedure TDbParamImovel.SetFLGTIPODATAPROG(const Value: TCmDbField);
begin
  FFLGTIPODATAPROG := Value;
end;

procedure TDbParamImovel.SetFlgtoleracompl(const Value: TCmDbField);
begin
  FFlgtoleracompl := Value;
end;

procedure TDbParamImovel.SetFlgusaap(const Value: TCmDbField);
begin
  FFlgusaap := Value;
end;

procedure TDbParamImovel.SetFlgusainvestimob(const Value: TCmDbField);
begin
  FFlgusainvestimob := Value;
end;

procedure TDbParamImovel.SetFlgusascimovel(const Value: TCmDbField);
begin
  FFlgusascimovel := Value;
end;

procedure TDbParamImovel.SetFlgusasclocatario(const Value: TCmDbField);
begin
  FFlgusasclocatario := Value;
end;

procedure TDbParamImovel.SetFlgvencdiautil(const Value: TCmDbField);
begin
  FFlgvencdiautil := Value;
end;

procedure TDbParamImovel.SetIdclassebem(const Value: TCmDbField);
begin
  FIdclassebem := Value;
end;

procedure TDbParamImovel.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbParamImovel.SetIdlocalizacao(const Value: TCmDbField);
begin
  FIdlocalizacao := Value;
end;

procedure TDbParamImovel.SetIdOperAtualCM(const Value: TCmDbField);
begin
  FIdOperAtualCM := Value;
end;

procedure TDbParamImovel.SetIdOperAtualJuros(const Value: TCmDbField);
begin
  FIdOperAtualJuros := Value;
end;

procedure TDbParamImovel.SetIdOperAtualMulta(const Value: TCmDbField);
begin
  FIdOperAtualMulta := Value;
end;

procedure TDbParamImovel.SetIdOperProvPer(const Value: TCmDbField);
begin
  FIdOperProvPer := Value;
end;

procedure TDbParamImovel.SetIdOperProvRec(const Value: TCmDbField);
begin
  FIdOperProvRec := Value;
end;

procedure TDbParamImovel.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbParamImovel.SetIdpessoaloc(const Value: TCmDbField);
begin
  FIdpessoaloc := Value;
end;

procedure TDbParamImovel.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbParamImovel.SetIdsituacao(const Value: TCmDbField);
begin
  FIdsituacao := Value;
end;

procedure TDbParamImovel.SetIdTCustoRecImoAlu(const Value: TCmDbField);
begin
  FIdTCustoRecImoAlu := Value;
end;

procedure TDbParamImovel.SetIdtcustorecimocom(const Value: TCmDbField);
begin
  FIdtcustorecimocom := Value;
end;

procedure TDbParamImovel.SetMesBloqLancto(const Value: TCmDbField);
begin
  FMesBloqLancto := Value;
end;

procedure TDbParamImovel.SetMescompetencia(const Value: TCmDbField);
begin
  FMescompetencia := Value;
end;

procedure TDbParamImovel.SetNomevlraquisicao(const Value: TCmDbField);
begin
  FNomevlraquisicao := Value;
end;

procedure TDbParamImovel.SetPrazoaviso(const Value: TCmDbField);
begin
  FPrazoaviso := Value;
end;

procedure TDbParamImovel.SetProxnumcontrato(const Value: TCmDbField);
begin
  FProxnumcontrato := Value;
end;

procedure TDbParamImovel.SetQtdemesprevfolha(const Value: TCmDbField);
begin
  FQtdemesprevfolha := Value;
end;

procedure TDbParamImovel.SetTipoImovelPatro(const Value: TCmDbField);
begin
  FTipoImovelPatro := Value;
end;

procedure TDbParamImovel.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

end.
