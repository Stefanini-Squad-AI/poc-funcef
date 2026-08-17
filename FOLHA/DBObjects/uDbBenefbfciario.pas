{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit uDbBenefbfciario;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbBenefbfciario = class(TCmDbObject)

  private
    FUnidnegoc: TCmDbField;
    FIdagenciaresgate: TCmDbField;
    FValornadib: TCmDbField;
    FUltmespreparo: TCmDbField;
    FDatainicioinss: TCmDbField;
    FUltvaloratualreaj: TCmDbField;
    FFontepagadora: TCmDbField;
    FValoratual: TCmDbField;
    FVlrinfinss: TCmDbField;
    FValorbinss2: TCmDbField;
    FDatainiciofund: TCmDbField;
    FFlgtipoinss: TCmDbField;
    FDataultreajuste: TCmDbField;
    FVlrcalcinss: TCmDbField;
    FPlacontad: TCmDbField;
    FMotivocancelamen: TCmDbField;
    FCodsubconta: TCmDbField;
    FValorbinssant1: TCmDbField;
    FIdplanoorigem: TCmDbField;
    FIdpessjur: TCmDbField;
    FDataultrevisao: TCmDbField;
    FValorbinssant3: TCmDbField;
    FTipcodigo: TCmDbField;
    FDatarecebrecad: TCmDbField;
    FDatafinal: TCmDbField;
    FFlgprovisorio: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FPlacontac: TCmDbField;
    FIdsitbeneficio: TCmDbField;
    FValorbinss3: TCmDbField;
    FValorsrb: TCmDbField;
    FDatarequerimento: TCmDbField;
    FIddependencia: TCmDbField;
    FIdbenefreferen: TCmDbField;
    FDataemissaorecad: TCmDbField;
    FCodcentrocustoc: TCmDbField;
    FDataencerramento: TCmDbField;
    FCodcentrocustod: TCmDbField;
    FSeqproposta: TCmDbField;
    FPercprovisorio: TCmDbField;
    FValorcotas: TCmDbField;
    FDatafinalprevista: TCmDbField;
    FDataliberacao: TCmDbField;
    FDatainicio: TCmDbField;
    FValortotal: TCmDbField;
    FFlgpossuiacompinss: TCmDbField;
    FValorabono13: TCmDbField;
    FDibbenefant: TCmDbField;
    FBancoinss: TCmDbField;
    FFlgdataprevista: TCmDbField;
    FIdpessoa: TCmDbField;
    FMespagliberacao: TCmDbField;
    FDatalimiterecad: TCmDbField;
    FPrazoprovisorio: TCmDbField;
    FNumeroprocesso: TCmDbField;
    FFlgbenefmin: TCmDbField;
    FNumprocinss: TCmDbField;
    FFlgstatus: TCmDbField;
    FDfloatpagto: TCmDbField;
    FIdtitular: TCmDbField;
    FIdplanprevcontab: TCmDbField;
    FFlgencerraporfale: TCmDbField;
    FIdtppagtobenefic: TCmDbField;
    FFlgdescirmes: TCmDbField;
    FIdbeneficio: TCmDbField;
    FPlano: TCmDbField;
    FIdempresaprop: TCmDbField;
    FIdplanoprev: TCmDbField;
    FFlgformapagto: TCmDbField;
    FNumcartarecad: TCmDbField;
    FValorbinssant2: TCmDbField;
    FValorbinss1: TCmDbField;
    FIdempresa: TCmDbField;
    FMesreciboinss: TCmDbField;
    FCodportforma: TCmDbField;
    FDataconcessao: TCmDbField;
    FAnoreciboinss: TCmDbField;
    FValorbenefant: TCmDbField;
    FUltmesreajuste: TCmDbField;
    FValorcalculado: TCmDbField;
    FPercentual: TCmDbField;
    FUltvalorbruto: TCmDbField;
    procedure SetAnoreciboinss(const Value: TCmDbField);
    procedure SetBancoinss(const Value: TCmDbField);
    procedure SetCodcentrocustoc(const Value: TCmDbField);
    procedure SetCodcentrocustod(const Value: TCmDbField);
    procedure SetCodcentrorespon(const Value: TCmDbField);
    procedure SetCodportforma(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetDataconcessao(const Value: TCmDbField);
    procedure SetDataemissaorecad(const Value: TCmDbField);
    procedure SetDataencerramento(const Value: TCmDbField);
    procedure SetDatafinal(const Value: TCmDbField);
    procedure SetDatafinalprevista(const Value: TCmDbField);
    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetDatainiciofund(const Value: TCmDbField);
    procedure SetDatainicioinss(const Value: TCmDbField);
    procedure SetDataliberacao(const Value: TCmDbField);
    procedure SetDatalimiterecad(const Value: TCmDbField);
    procedure SetDatarecebrecad(const Value: TCmDbField);
    procedure SetDatarequerimento(const Value: TCmDbField);
    procedure SetDataultreajuste(const Value: TCmDbField);
    procedure SetDataultrevisao(const Value: TCmDbField);
    procedure SetDfloatpagto(const Value: TCmDbField);
    procedure SetDibbenefant(const Value: TCmDbField);
    procedure SetFlgbenefmin(const Value: TCmDbField);
    procedure SetFlgdataprevista(const Value: TCmDbField);
    procedure SetFlgdescirmes(const Value: TCmDbField);
    procedure SetFlgencerraporfale(const Value: TCmDbField);
    procedure SetFlgformapagto(const Value: TCmDbField);
    procedure SetFlgpossuiacompinss(const Value: TCmDbField);
    procedure SetFlgprovisorio(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetFlgtipoinss(const Value: TCmDbField);
    procedure SetFontepagadora(const Value: TCmDbField);
    procedure SetIdagenciaresgate(const Value: TCmDbField);
    procedure SetIdbeneficio(const Value: TCmDbField);
    procedure SetIdbenefreferen(const Value: TCmDbField);
    procedure SetIddependencia(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoorigem(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdplanprevcontab(const Value: TCmDbField);
    procedure SetIdsitbeneficio(const Value: TCmDbField);
    procedure SetIdtitular(const Value: TCmDbField);
    procedure SetIdtppagtobenefic(const Value: TCmDbField);
    procedure SetMespagliberacao(const Value: TCmDbField);
    procedure SetMesreciboinss(const Value: TCmDbField);
    procedure SetMotivocancelamen(const Value: TCmDbField);
    procedure SetNumcartarecad(const Value: TCmDbField);
    procedure SetNumeroprocesso(const Value: TCmDbField);
    procedure SetNumprocinss(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetPercprovisorio(const Value: TCmDbField);
    procedure SetPlacontac(const Value: TCmDbField);
    procedure SetPlacontad(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPrazoprovisorio(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetTipcodigo(const Value: TCmDbField);
    procedure SetUltmespreparo(const Value: TCmDbField);
    procedure SetUltmesreajuste(const Value: TCmDbField);
    procedure SetUltvaloratualreaj(const Value: TCmDbField);
    procedure SetUltvalorbruto(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetValorabono13(const Value: TCmDbField);
    procedure SetValoratual(const Value: TCmDbField);
    procedure SetValorbenefant(const Value: TCmDbField);
    procedure SetValorbinss1(const Value: TCmDbField);
    procedure SetValorbinss2(const Value: TCmDbField);
    procedure SetValorbinss3(const Value: TCmDbField);
    procedure SetValorbinssant1(const Value: TCmDbField);
    procedure SetValorbinssant2(const Value: TCmDbField);
    procedure SetValorbinssant3(const Value: TCmDbField);
    procedure SetValorcalculado(const Value: TCmDbField);
    procedure SetValorcotas(const Value: TCmDbField);
    procedure SetValornadib(const Value: TCmDbField);
    procedure SetValorsrb(const Value: TCmDbField);
    procedure SetValortotal(const Value: TCmDbField);
    procedure SetVlrcalcinss(const Value: TCmDbField);
    procedure SetVlrinfinss(const Value: TCmDbField);

  public

    Property Vlrinfinss: TCmDbField read FVlrinfinss write SetVlrinfinss;
    Property Vlrcalcinss: TCmDbField read FVlrcalcinss write SetVlrcalcinss;
    Property Valortotal: TCmDbField read FValortotal write SetValortotal;
    Property Valorsrb: TCmDbField read FValorsrb write SetValorsrb;
    Property Valornadib: TCmDbField read FValornadib write SetValornadib;
    Property Valorcotas: TCmDbField read FValorcotas write SetValorcotas;
    Property Valorcalculado: TCmDbField read FValorcalculado write SetValorcalculado;
    Property Valorbinss3: TCmDbField read FValorbinss3 write SetValorbinss3;
    Property Valorbinss2: TCmDbField read FValorbinss2 write SetValorbinss2;
    Property Valorbinss1: TCmDbField read FValorbinss1 write SetValorbinss1;
    Property Valorbinssant3: TCmDbField read FValorbinssant3 write SetValorbinssant3;
    Property Valorbinssant2: TCmDbField read FValorbinssant2 write SetValorbinssant2;
    Property Valorbinssant1: TCmDbField read FValorbinssant1 write SetValorbinssant1;
    Property Valorbenefant: TCmDbField read FValorbenefant write SetValorbenefant;
    Property Valoratual: TCmDbField read FValoratual write SetValoratual;
    Property Valorabono13: TCmDbField read FValorabono13 write SetValorabono13;
    Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
    Property Ultvalorbruto: TCmDbField read FUltvalorbruto write SetUltvalorbruto;
    Property Ultvaloratualreaj: TCmDbField read FUltvaloratualreaj write SetUltvaloratualreaj;
    Property Ultmesreajuste: TCmDbField read FUltmesreajuste write SetUltmesreajuste;
    Property Ultmespreparo: TCmDbField read FUltmespreparo write SetUltmespreparo;
    Property Tipcodigo: TCmDbField read FTipcodigo write SetTipcodigo;
    Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
    Property Prazoprovisorio: TCmDbField read FPrazoprovisorio write SetPrazoprovisorio;
    Property Plano: TCmDbField read FPlano write SetPlano;
    Property Placontad: TCmDbField read FPlacontad write SetPlacontad;
    Property Placontac: TCmDbField read FPlacontac write SetPlacontac;
    Property Percprovisorio: TCmDbField read FPercprovisorio write SetPercprovisorio;
    Property Percentual: TCmDbField read FPercentual write SetPercentual;
    Property Numprocinss: TCmDbField read FNumprocinss write SetNumprocinss;
    Property Numeroprocesso: TCmDbField read FNumeroprocesso write SetNumeroprocesso;
    Property Numcartarecad: TCmDbField read FNumcartarecad write SetNumcartarecad;
    Property Motivocancelamen: TCmDbField read FMotivocancelamen write SetMotivocancelamen;
    Property Mesreciboinss: TCmDbField read FMesreciboinss write SetMesreciboinss;
    Property Mespagliberacao: TCmDbField read FMespagliberacao write SetMespagliberacao;
    Property Idtppagtobenefic: TCmDbField read FIdtppagtobenefic write SetIdtppagtobenefic;
    Property Idtitular: TCmDbField read FIdtitular write SetIdtitular;
    Property Idsitbeneficio: TCmDbField read FIdsitbeneficio write SetIdsitbeneficio;
    Property Idplanprevcontab: TCmDbField read FIdplanprevcontab write SetIdplanprevcontab;
    Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
    Property Idplanoorigem: TCmDbField read FIdplanoorigem write SetIdplanoorigem;
    Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
    Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
    Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
    Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
    Property Iddependencia: TCmDbField read FIddependencia write SetIddependencia;
    Property Idbenefreferen: TCmDbField read FIdbenefreferen write SetIdbenefreferen;
    Property Idbeneficio: TCmDbField read FIdbeneficio write SetIdbeneficio;
    Property Idagenciaresgate: TCmDbField read FIdagenciaresgate write SetIdagenciaresgate;
    Property Fontepagadora: TCmDbField read FFontepagadora write SetFontepagadora;
    Property Flgtipoinss: TCmDbField read FFlgtipoinss write SetFlgtipoinss;
    Property Flgstatus: TCmDbField read FFlgstatus write SetFlgstatus;
    Property Flgprovisorio: TCmDbField read FFlgprovisorio write SetFlgprovisorio;
    Property Flgpossuiacompinss: TCmDbField read FFlgpossuiacompinss write SetFlgpossuiacompinss;
    Property Flgformapagto: TCmDbField read FFlgformapagto write SetFlgformapagto;
    Property Flgencerraporfale: TCmDbField read FFlgencerraporfale write SetFlgencerraporfale;
    Property Flgdescirmes: TCmDbField read FFlgdescirmes write SetFlgdescirmes;
    Property Flgdataprevista: TCmDbField read FFlgdataprevista write SetFlgdataprevista;
    Property Flgbenefmin: TCmDbField read FFlgbenefmin write SetFlgbenefmin;
    Property Dibbenefant: TCmDbField read FDibbenefant write SetDibbenefant;
    Property Dfloatpagto: TCmDbField read FDfloatpagto write SetDfloatpagto;
    Property Dataultrevisao: TCmDbField read FDataultrevisao write SetDataultrevisao;
    Property Dataultreajuste: TCmDbField read FDataultreajuste write SetDataultreajuste;
    Property Datarequerimento: TCmDbField read FDatarequerimento write SetDatarequerimento;
    Property Datarecebrecad: TCmDbField read FDatarecebrecad write SetDatarecebrecad;
    Property Datalimiterecad: TCmDbField read FDatalimiterecad write SetDatalimiterecad;
    Property Dataliberacao: TCmDbField read FDataliberacao write SetDataliberacao;
    Property Datainicioinss: TCmDbField read FDatainicioinss write SetDatainicioinss;
    Property Datainiciofund: TCmDbField read FDatainiciofund write SetDatainiciofund;
    Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
    Property Datafinalprevista: TCmDbField read FDatafinalprevista write SetDatafinalprevista;
    Property Datafinal: TCmDbField read FDatafinal write SetDatafinal;
    Property Dataencerramento: TCmDbField read FDataencerramento write SetDataencerramento;
    Property Dataemissaorecad: TCmDbField read FDataemissaorecad write SetDataemissaorecad;
    Property Dataconcessao: TCmDbField read FDataconcessao write SetDataconcessao;
    Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
    Property Codportforma: TCmDbField read FCodportforma write SetCodportforma;
    Property Codcentrorespon: TCmDbField read FCodcentrorespon write SetCodcentrorespon;
    Property Codcentrocustod: TCmDbField read FCodcentrocustod write SetCodcentrocustod;
    Property Codcentrocustoc: TCmDbField read FCodcentrocustoc write SetCodcentrocustoc;
    Property Bancoinss: TCmDbField read FBancoinss write SetBancoinss;
    Property Anoreciboinss: TCmDbField read FAnoreciboinss write SetAnoreciboinss;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbBenefbfciario }

constructor TDbBenefbfciario.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'BENEFBFCIARIO';

  fVlrinfinss := CreateCmDbField('VLRINFINSS',ftfloat,False,False,False,True,'');
  fVlrcalcinss := CreateCmDbField('VLRCALCINSS',ftfloat,False,False,False,True,'');
  fValortotal := CreateCmDbField('VALORTOTAL',ftfloat,False,False,False,True,'');
  fValorsrb := CreateCmDbField('VALORSRB',ftfloat,False,False,False,True,'');
  fValornadib := CreateCmDbField('VALORNADIB',ftfloat,False,False,False,True,'');
  fValorcotas := CreateCmDbField('VALORCOTAS',ftfloat,False,False,False,True,'');
  fValorcalculado := CreateCmDbField('VALORCALCULADO',ftfloat,False,False,False,True,'');
  fValorbinss3 := CreateCmDbField('VALORBINSS3',ftfloat,False,False,False,True,'');
  fValorbinss2 := CreateCmDbField('VALORBINSS2',ftfloat,False,False,False,True,'');
  fValorbinss1 := CreateCmDbField('VALORBINSS1',ftfloat,False,False,False,True,'');
  fValorbinssant3 := CreateCmDbField('VALORBINSSANT3',ftfloat,False,False,False,True,'');
  fValorbinssant2 := CreateCmDbField('VALORBINSSANT2',ftfloat,False,False,False,True,'');
  fValorbinssant1 := CreateCmDbField('VALORBINSSANT1',ftfloat,False,False,False,True,'');
  fValorbenefant := CreateCmDbField('VALORBENEFANT',ftfloat,False,False,False,True,'');
  fValoratual := CreateCmDbField('VALORATUAL',ftfloat,False,False,False,True,'');
  fValorabono13 := CreateCmDbField('VALORABONO13',ftfloat,False,False,False,True,'');
  fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
  fUltvalorbruto := CreateCmDbField('ULTVALORBRUTO',ftfloat,False,False,False,True,'');
  fUltvaloratualreaj := CreateCmDbField('ULTVALORATUALREAJ',ftfloat,False,False,False,True,'');
  fUltmesreajuste := CreateCmDbField('ULTMESREAJUSTE',ftString,False,False,False,True,'');
  fUltmespreparo := CreateCmDbField('ULTMESPREPARO',ftString,False,False,False,True,'');
  fTipcodigo := CreateCmDbField('TIPCODIGO',ftString,False,False,False,True,'');
  fSeqproposta := CreateCmDbField('SEQPROPOSTA',ftfloat,True,True,False,True,'');
  fPrazoprovisorio := CreateCmDbField('PRAZOPROVISORIO',ftfloat,False,False,False,True,'');
  fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
  fPlacontad := CreateCmDbField('PLACONTAD',ftString,False,False,False,True,'');
  fPlacontac := CreateCmDbField('PLACONTAC',ftString,False,False,False,True,'');
  fPercprovisorio := CreateCmDbField('PERCPROVISORIO',ftfloat,False,False,False,True,'');
  fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,False,False,False,True,'');
  fNumprocinss := CreateCmDbField('NUMPROCINSS',ftString,False,False,False,True,'');
  fNumeroprocesso := CreateCmDbField('NUMEROPROCESSO',ftfloat,True,True,False,True,'');
  fNumcartarecad := CreateCmDbField('NUMCARTARECAD',ftString,False,False,False,True,'');
  fMotivocancelamen := CreateCmDbField('MOTIVOCANCELAMEN',ftBlob,False,False,False,True,'');
  fMesreciboinss := CreateCmDbField('MESRECIBOINSS',ftfloat,False,False,False,True,'');
  fMespagliberacao := CreateCmDbField('MESPAGLIBERACAO',ftString,False,False,False,True,'');
  fIdtppagtobenefic := CreateCmDbField('IDTPPAGTOBENEFIC',ftfloat,False,False,False,True,'');
  fIdtitular := CreateCmDbField('IDTITULAR',ftfloat,True,True,False,True,'');
  fIdsitbeneficio := CreateCmDbField('IDSITBENEFICIO',ftfloat,True,False,False,True,'');
  fIdplanprevcontab := CreateCmDbField('IDPLANPREVCONTAB',ftfloat,False,False,False,True,'');
  fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
  fIdplanoorigem := CreateCmDbField('IDPLANOORIGEM',ftfloat,True,True,False,True,'');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
  fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
  fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
  fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
  fIddependencia := CreateCmDbField('IDDEPENDENCIA',ftString,False,False,False,True,'');
  fIdbenefreferen := CreateCmDbField('IDBENEFREFEREN',ftfloat,False,False,False,True,'');
  fIdbeneficio := CreateCmDbField('IDBENEFICIO',ftfloat,True,True,False,True,'');
  fIdagenciaresgate := CreateCmDbField('IDAGENCIARESGATE',ftfloat,False,False,False,True,'');
  fFontepagadora := CreateCmDbField('FONTEPAGADORA',ftfloat,False,False,False,True,'');
  fFlgtipoinss := CreateCmDbField('FLGTIPOINSS',ftfloat,False,False,False,True,'');
  fFlgstatus := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'');
  fFlgprovisorio := CreateCmDbField('FLGPROVISORIO',ftfloat,False,False,False,True,'');
  fFlgpossuiacompinss := CreateCmDbField('FLGPOSSUIACOMPINSS',ftfloat,False,False,False,True,'');
  fFlgformapagto := CreateCmDbField('FLGFORMAPAGTO',ftString,True,False,False,True,'');
  fFlgencerraporfale := CreateCmDbField('FLGENCERRAPORFALE',ftfloat,False,False,False,True,'');
  fFlgdescirmes := CreateCmDbField('FLGDESCIRMES',ftfloat,False,False,False,True,'');
  fFlgdataprevista := CreateCmDbField('FLGDATAPREVISTA',ftfloat,False,False,False,True,'');
  fFlgbenefmin := CreateCmDbField('FLGBENEFMIN',ftfloat,False,False,False,True,'');
  fDibbenefant := CreateCmDbField('DIBBENEFANT',ftDateTime,False,False,False,True,'');
  fDfloatpagto := CreateCmDbField('DFLOATPAGTO',ftfloat,False,False,False,True,'');
  fDataultrevisao := CreateCmDbField('DATAULTREVISAO',ftDateTime,False,False,False,True,'');
  fDataultreajuste := CreateCmDbField('DATAULTREAJUSTE',ftDateTime,False,False,False,True,'');
  fDatarequerimento := CreateCmDbField('DATAREQUERIMENTO',ftDateTime,False,False,False,True,'');
  fDatarecebrecad := CreateCmDbField('DATARECEBRECAD',ftDateTime,False,False,False,True,'');
  fDatalimiterecad := CreateCmDbField('DATALIMITERECAD',ftDateTime,False,False,False,True,'');
  fDataliberacao := CreateCmDbField('DATALIBERACAO',ftDateTime,False,False,False,True,'');
  fDatainicioinss := CreateCmDbField('DATAINICIOINSS',ftDateTime,False,False,False,True,'');
  fDatainiciofund := CreateCmDbField('DATAINICIOFUND',ftDateTime,False,False,False,True,'');
  fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,False,False,False,True,'');
  fDatafinalprevista := CreateCmDbField('DATAFINALPREVISTA',ftDateTime,False,False,False,True,'');
  fDatafinal := CreateCmDbField('DATAFINAL',ftDateTime,False,False,False,True,'');
  fDataencerramento := CreateCmDbField('DATAENCERRAMENTO',ftDateTime,False,False,False,True,'');
  fDataemissaorecad := CreateCmDbField('DATAEMISSAORECAD',ftDateTime,False,False,False,True,'');
  fDataconcessao := CreateCmDbField('DATACONCESSAO',ftDateTime,False,False,False,True,'');
  fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
  fCodportforma := CreateCmDbField('CODPORTFORMA',ftfloat,False,False,False,True,'');
  fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftString,False,False,False,True,'');
  fCodcentrocustod := CreateCmDbField('CODCENTROCUSTOD',ftString,False,False,False,True,'');
  fCodcentrocustoc := CreateCmDbField('CODCENTROCUSTOC',ftString,False,False,False,True,'');
  fBancoinss := CreateCmDbField('BANCOINSS',ftString,False,False,False,True,'');
  fAnoreciboinss := CreateCmDbField('ANORECIBOINSS',ftfloat,False,False,False,True,'');
end;

procedure TDbBenefbfciario.SetAnoreciboinss(const Value: TCmDbField);
begin
  FAnoreciboinss := Value;
end;

procedure TDbBenefbfciario.SetBancoinss(const Value: TCmDbField);
begin
  FBancoinss := Value;
end;

procedure TDbBenefbfciario.SetCodcentrocustoc(const Value: TCmDbField);
begin
  FCodcentrocustoc := Value;
end;

procedure TDbBenefbfciario.SetCodcentrocustod(const Value: TCmDbField);
begin
  FCodcentrocustod := Value;
end;

procedure TDbBenefbfciario.SetCodcentrorespon(const Value: TCmDbField);
begin
  FCodcentrorespon := Value;
end;

procedure TDbBenefbfciario.SetCodportforma(const Value: TCmDbField);
begin
  FCodportforma := Value;
end;

procedure TDbBenefbfciario.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbBenefbfciario.SetDataconcessao(const Value: TCmDbField);
begin
  FDataconcessao := Value;
end;

procedure TDbBenefbfciario.SetDataemissaorecad(const Value: TCmDbField);
begin
  FDataemissaorecad := Value;
end;

procedure TDbBenefbfciario.SetDataencerramento(const Value: TCmDbField);
begin
  FDataencerramento := Value;
end;

procedure TDbBenefbfciario.SetDatafinal(const Value: TCmDbField);
begin
  FDatafinal := Value;
end;

procedure TDbBenefbfciario.SetDatafinalprevista(const Value: TCmDbField);
begin
  FDatafinalprevista := Value;
end;

procedure TDbBenefbfciario.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDbBenefbfciario.SetDatainiciofund(const Value: TCmDbField);
begin
  FDatainiciofund := Value;
end;

procedure TDbBenefbfciario.SetDatainicioinss(const Value: TCmDbField);
begin
  FDatainicioinss := Value;
end;

procedure TDbBenefbfciario.SetDataliberacao(const Value: TCmDbField);
begin
  FDataliberacao := Value;
end;

procedure TDbBenefbfciario.SetDatalimiterecad(const Value: TCmDbField);
begin
  FDatalimiterecad := Value;
end;

procedure TDbBenefbfciario.SetDatarecebrecad(const Value: TCmDbField);
begin
  FDatarecebrecad := Value;
end;

procedure TDbBenefbfciario.SetDatarequerimento(const Value: TCmDbField);
begin
  FDatarequerimento := Value;
end;

procedure TDbBenefbfciario.SetDataultreajuste(const Value: TCmDbField);
begin
  FDataultreajuste := Value;
end;

procedure TDbBenefbfciario.SetDataultrevisao(const Value: TCmDbField);
begin
  FDataultrevisao := Value;
end;

procedure TDbBenefbfciario.SetDfloatpagto(const Value: TCmDbField);
begin
  FDfloatpagto := Value;
end;

procedure TDbBenefbfciario.SetDibbenefant(const Value: TCmDbField);
begin
  FDibbenefant := Value;
end;

procedure TDbBenefbfciario.SetFlgbenefmin(const Value: TCmDbField);
begin
  FFlgbenefmin := Value;
end;

procedure TDbBenefbfciario.SetFlgdataprevista(const Value: TCmDbField);
begin
  FFlgdataprevista := Value;
end;

procedure TDbBenefbfciario.SetFlgdescirmes(const Value: TCmDbField);
begin
  FFlgdescirmes := Value;
end;

procedure TDbBenefbfciario.SetFlgencerraporfale(const Value: TCmDbField);
begin
  FFlgencerraporfale := Value;
end;

procedure TDbBenefbfciario.SetFlgformapagto(const Value: TCmDbField);
begin
  FFlgformapagto := Value;
end;

procedure TDbBenefbfciario.SetFlgpossuiacompinss(const Value: TCmDbField);
begin
  FFlgpossuiacompinss := Value;
end;

procedure TDbBenefbfciario.SetFlgprovisorio(const Value: TCmDbField);
begin
  FFlgprovisorio := Value;
end;

procedure TDbBenefbfciario.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbBenefbfciario.SetFlgtipoinss(const Value: TCmDbField);
begin
  FFlgtipoinss := Value;
end;

procedure TDbBenefbfciario.SetFontepagadora(const Value: TCmDbField);
begin
  FFontepagadora := Value;
end;

procedure TDbBenefbfciario.SetIdagenciaresgate(const Value: TCmDbField);
begin
  FIdagenciaresgate := Value;
end;

procedure TDbBenefbfciario.SetIdbeneficio(const Value: TCmDbField);
begin
  FIdbeneficio := Value;
end;

procedure TDbBenefbfciario.SetIdbenefreferen(const Value: TCmDbField);
begin
  FIdbenefreferen := Value;
end;

procedure TDbBenefbfciario.SetIddependencia(const Value: TCmDbField);
begin
  FIddependencia := Value;
end;

procedure TDbBenefbfciario.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbBenefbfciario.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbBenefbfciario.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbBenefbfciario.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbBenefbfciario.SetIdplanoorigem(const Value: TCmDbField);
begin
  FIdplanoorigem := Value;
end;

procedure TDbBenefbfciario.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbBenefbfciario.SetIdplanprevcontab(const Value: TCmDbField);
begin
  FIdplanprevcontab := Value;
end;

procedure TDbBenefbfciario.SetIdsitbeneficio(const Value: TCmDbField);
begin
  FIdsitbeneficio := Value;
end;

procedure TDbBenefbfciario.SetIdtitular(const Value: TCmDbField);
begin
  FIdtitular := Value;
end;

procedure TDbBenefbfciario.SetIdtppagtobenefic(const Value: TCmDbField);
begin
  FIdtppagtobenefic := Value;
end;

procedure TDbBenefbfciario.SetMespagliberacao(const Value: TCmDbField);
begin
  FMespagliberacao := Value;
end;

procedure TDbBenefbfciario.SetMesreciboinss(const Value: TCmDbField);
begin
  FMesreciboinss := Value;
end;

procedure TDbBenefbfciario.SetMotivocancelamen(const Value: TCmDbField);
begin
  FMotivocancelamen := Value;
end;

procedure TDbBenefbfciario.SetNumcartarecad(const Value: TCmDbField);
begin
  FNumcartarecad := Value;
end;

procedure TDbBenefbfciario.SetNumeroprocesso(const Value: TCmDbField);
begin
  FNumeroprocesso := Value;
end;

procedure TDbBenefbfciario.SetNumprocinss(const Value: TCmDbField);
begin
  FNumprocinss := Value;
end;

procedure TDbBenefbfciario.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDbBenefbfciario.SetPercprovisorio(const Value: TCmDbField);
begin
  FPercprovisorio := Value;
end;

procedure TDbBenefbfciario.SetPlacontac(const Value: TCmDbField);
begin
  FPlacontac := Value;
end;

procedure TDbBenefbfciario.SetPlacontad(const Value: TCmDbField);
begin
  FPlacontad := Value;
end;

procedure TDbBenefbfciario.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbBenefbfciario.SetPrazoprovisorio(const Value: TCmDbField);
begin
  FPrazoprovisorio := Value;
end;

procedure TDbBenefbfciario.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDbBenefbfciario.SetTipcodigo(const Value: TCmDbField);
begin
  FTipcodigo := Value;
end;

procedure TDbBenefbfciario.SetUltmespreparo(const Value: TCmDbField);
begin
  FUltmespreparo := Value;
end;

procedure TDbBenefbfciario.SetUltmesreajuste(const Value: TCmDbField);
begin
  FUltmesreajuste := Value;
end;

procedure TDbBenefbfciario.SetUltvaloratualreaj(const Value: TCmDbField);
begin
  FUltvaloratualreaj := Value;
end;

procedure TDbBenefbfciario.SetUltvalorbruto(const Value: TCmDbField);
begin
  FUltvalorbruto := Value;
end;

procedure TDbBenefbfciario.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbBenefbfciario.SetValorabono13(const Value: TCmDbField);
begin
  FValorabono13 := Value;
end;

procedure TDbBenefbfciario.SetValoratual(const Value: TCmDbField);
begin
  FValoratual := Value;
end;

procedure TDbBenefbfciario.SetValorbenefant(const Value: TCmDbField);
begin
  FValorbenefant := Value;
end;

procedure TDbBenefbfciario.SetValorbinss1(const Value: TCmDbField);
begin
  FValorbinss1 := Value;
end;

procedure TDbBenefbfciario.SetValorbinss2(const Value: TCmDbField);
begin
  FValorbinss2 := Value;
end;

procedure TDbBenefbfciario.SetValorbinss3(const Value: TCmDbField);
begin
  FValorbinss3 := Value;
end;

procedure TDbBenefbfciario.SetValorbinssant1(const Value: TCmDbField);
begin
  FValorbinssant1 := Value;
end;

procedure TDbBenefbfciario.SetValorbinssant2(const Value: TCmDbField);
begin
  FValorbinssant2 := Value;
end;

procedure TDbBenefbfciario.SetValorbinssant3(const Value: TCmDbField);
begin
  FValorbinssant3 := Value;
end;

procedure TDbBenefbfciario.SetValorcalculado(const Value: TCmDbField);
begin
  FValorcalculado := Value;
end;

procedure TDbBenefbfciario.SetValorcotas(const Value: TCmDbField);
begin
  FValorcotas := Value;
end;

procedure TDbBenefbfciario.SetValornadib(const Value: TCmDbField);
begin
  FValornadib := Value;
end;

procedure TDbBenefbfciario.SetValorsrb(const Value: TCmDbField);
begin
  FValorsrb := Value;
end;

procedure TDbBenefbfciario.SetValortotal(const Value: TCmDbField);
begin
  FValortotal := Value;
end;

procedure TDbBenefbfciario.SetVlrcalcinss(const Value: TCmDbField);
begin
  FVlrcalcinss := Value;
end;

procedure TDbBenefbfciario.SetVlrinfinss(const Value: TCmDbField);
begin
  FVlrinfinss := Value;
end;

end.
{==============================================================================|
| UNIT: UDBBENEFBFCIARIO                                                       |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   OBJETO DE BANCO DE DADOS PARA TABELA BENEFBFCIARIO                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/10/2002 A 17/10/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONSTRUÇÃO DO OBJETO                                                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

