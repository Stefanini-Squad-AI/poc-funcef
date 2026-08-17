{-------------------------------------------------------------------------------
------------------------- ALTERAÇÕES / IMPLEMENTAÇÕES --------------------------
--------------------------------------------------------------------------------

 N. SIG........: 96275
 Dt Alteração..: 10/11/2021
 Responsável...: Everson Cunha
 Descrição.....: Criação do campo Mês/Ano Referência
--------------------------------------------------------------------------------
 Rotina             : Create
 N. SIG..........   : 115585
 Data da Alteração: : 18/05/2021
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Retirada dos campos IDTIPOSERVICO e IDPROCESSOSUSP.
--------------------------------------------------------------------------------
 Rotina             : Create
 N. SIG..........   : 23656.58469
 Data da Alteração: : 20/11/2017
 Alteração Form:    : uDbMedicao
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Inclusão dos campos IDTIPOSERVICO e IDPROCESSOSUSP.
--------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Cláudio de Silva                }
{ Atualizado Em: 03/04/2003                             }
{                                                       }
{*******************************************************}

unit uDbMedicao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbMedicao = class(TCmDbObject)

  private
    FIdatividade: TCmDbField;
    FFrequencia: TCmDbField;
    FIdprojeto: TCmDbField;
    FDataprevmedicao: TCmDbField;
    FQtdeprevista: TCmDbField;
    FIdobjeto: TCmDbField;
    FIdmedicao: TCmDbField;
    FValormedicao: TCmDbField;
    FQtdemedicao: TCmDbField;
    FMedicaoaprovada: TCmDbField;
    FDatamedicao: TCmDbField;
    FIntervalo: TCmDbField;
    FValorprevisto: TCmDbField;
    FIditem: TCmDbField;
    FIdcontrato: TCmDbField;
    FObservacao: TCmDbField;
    FIdpessoa: TCmDbField;
    FNumparcelas: TCmDbField;
    FHistoricocompl: TCmDbField;
    FIdReservaOrcamen: TCmDbField;
    FFlgEstornado: TCmDbField;
    FNumRad: TCmDbField;

    fDataLancamento: TCmDbField;
    fIDCBancaria: TCmDbField;
    fNoDocumento: TCmDbField;
    fComplDocumento: TCmDbField;
    fObs: TCmDbField;
    fNumLeitCodBarras: TCmDbField;
    fNumDigCodBarras: TCmDbField;
    fCodForma: TCmDbField;
    fAnoReferencia: TCmDbField;
    fMesReferencia: TCmDbField;

  public
     Property Valorprevisto: TCmDbField read FValorprevisto write FValorprevisto;
     Property Valormedicao: TCmDbField read FValormedicao write FValormedicao;
     Property Qtdeprevista: TCmDbField read FQtdeprevista write FQtdeprevista;
     Property Qtdemedicao: TCmDbField read FQtdemedicao write FQtdemedicao;
     Property Observacao: TCmDbField read FObservacao write FObservacao;
     Property Historicocompl: TCmDbField read FHistoricocompl write FHistoricocompl;
     Property Numparcelas: TCmDbField read FNumparcelas write FNumparcelas;
     Property Medicaoaprovada: TCmDbField read FMedicaoaprovada write FMedicaoaprovada;
     Property Intervalo: TCmDbField read FIntervalo write FIntervalo;
     Property Idprojeto: TCmDbField read FIdprojeto write FIdprojeto;
     Property Idpessoa: TCmDbField read FIdpessoa write FIdpessoa;
     Property Idobjeto: TCmDbField read FIdobjeto write FIdobjeto;
     Property Idmedicao: TCmDbField read FIdmedicao write FIdmedicao;
     Property Iditem: TCmDbField read FIditem write FIditem;
     Property Idcontrato: TCmDbField read FIdcontrato write FIdcontrato;
     Property Idatividade: TCmDbField read FIdatividade write FIdatividade;
     Property Frequencia: TCmDbField read FFrequencia write FFrequencia;
     Property Dataprevmedicao: TCmDbField read FDataprevmedicao write FDataprevmedicao;
     Property Datamedicao: TCmDbField read FDatamedicao write FDatamedicao;
     Property IdReservaOrcamen: TCmDbField read FIdReservaOrcamen write FIdReservaOrcamen;

     // Marchetti - Pendencia 16957
     Property FlgEstornado: TCmDbField read FFlgEstornado write FFlgEstornado;

     // Marchetti - Pendencia 16347
     property NumRad: TCmDbField read FNumRad write FNumRad;

     property DataLancamento: TCmDbField read fDataLancamento write fDataLancamento;
     property IDCBancaria: TCmDbField    read fIDCBancaria    write fIDCBancaria;
     property NoDocumento: TCmDbField    read fNoDocumento    write fNoDocumento;
     property ComplDocumento: TCmDbField read fComplDocumento write fComplDocumento;
     property Obs: TCmDbField            read fObs            write fObs;
     property NumLeitCodBarras: TCmDbField read fNumLeitCodBarras write fNumLeitCodBarras;
     property NumDigCodBarras: TCmDbField read fNumDigCodBarras write fNumDigCodBarras;
     property CodForma: TCmDbField read fCodForma write fCodForma;
     property MesReferencia: TCmDbField read fMesReferencia write fMesReferencia;
     property AnoReferencia: TCmDbField read fAnoReferencia write fAnoReferencia;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbMedicao }

constructor TDbMedicao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MEDICAO';

  fValorprevisto := CreateCmDbField('VALORPREVISTO',ftfloat,False,False,False,True,'');
  fValormedicao := CreateCmDbField('VALORMEDICAO',ftfloat,False,False,False,True,'');
  fQtdeprevista := CreateCmDbField('QTDEPREVISTA',ftfloat,False,False,False,True,'');
  fQtdemedicao := CreateCmDbField('QTDEMEDICAO',ftfloat,False,False,False,True,'');
  fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
  fHistoricoCompl := CreateCmDbField('HISTORICOCOMPL',ftString,False,False,False,True,'');
  fNumparcelas := CreateCmDbField('NUMPARCELAS',ftfloat,False,False,False,True,'');
  fMedicaoaprovada := CreateCmDbField('MEDICAOAPROVADA',ftString,False,False,False,True,'');
  fIntervalo := CreateCmDbField('INTERVALO',ftfloat,False,False,False,True,'');
  fIdprojeto := CreateCmDbField('IDPROJETO',ftfloat,False,False,False,True,'');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
  fIdobjeto := CreateCmDbField('IDOBJETO',ftfloat,False,False,False,True,'');
  fIdmedicao := CreateCmDbField('IDMEDICAO',ftfloat,True,True,False,True,'');
  fIditem := CreateCmDbField('IDITEM',ftfloat,False,False,False,True,'');
  fIdcontrato := CreateCmDbField('IDCONTRATO',ftfloat,False,False,False,True,'');
  fIdatividade := CreateCmDbField('IDATIVIDADE',ftfloat,False,False,False,True,'');
  fFrequencia := CreateCmDbField('FREQUENCIA',ftString,False,False,False,True,'');
  fDataprevmedicao := CreateCmDbField('DATAPREVMEDICAO',ftDateTime,False,False,False,True,'');
  fDatamedicao := CreateCmDbField('DATAMEDICAO',ftDateTime,False,False,False,True,'');
  fIdReservaOrcamen := CreateCmDbField('IDRESERVAORCAMEN',ftfloat,False,False,False,True,'');

  // Marchetti - Pendencia 16957
  fFlgEstornado := CreateCmDbField('FLGESTORNADO',ftfloat,False,False,False,True,'');

  // Marchetti - Pendencia 16347
  FNumRad := CreateCmDbField('NUMRAD',ftfloat,False,False,False,True,'');
  fDataLancamento := CreateCmDbField('DATALANCAMENTO',ftDateTime,False,False,False,True,'');
  fIDCBancaria := CreateCmDbField('IDCBANCARIA',ftfloat,False,False,False,True,'');
  fNoDocumento := CreateCmDbField('NODOCUMENTO',ftfloat,False,False,False,True,'');
  fComplDocumento := CreateCmDbField('COMPLDOCUMENTO',ftString,False,False,False,True,'');
  fObs := CreateCmDbField('OBS',ftString,False,False,False,True,'');
  fNumLeitCodBarras := CreateCmDbField('NUMLEITCODBARRAS',ftString,False,False,False,True,'');
  fNumDigCodBarras := CreateCmDbField('NUMDIGCODBARRAS',ftString,False,False,False,True,'');
  fCodForma := CreateCmDbField('CODFORMA',ftfloat,False,False,False,True,'');
  fMesReferencia := CreateCmDbField('MES_REFERENCIA',ftString,False,False,False,True,'');
  fAnoReferencia := CreateCmDbField('ANO_REFERENCIA',ftString,False,False,False,True,'');

  //Cássio Rovaroto - SIG nº 115585 - Início
  //Cássio Rovaroto - SIG nº 23656.58469 - Início
  //FIdTipoServico := CreateCmDbField('IDTIPOSERVICO', ftFloat, False, False, False, True, '');
  //FIdProcessoSusp := CreateCmDbField('IDPROCESSOSUSP', ftFloat, False, False, False, True, '');
  //Cássio Rovaroto - SIG nº 23656.58469 - Fim
  //Cássio Rovaroto - SIG nº 115585 - Fim

end;

function TDbMedicao.Insert: Boolean;
begin
  fIdmedicao.AsFloat := GetSequence('MEDICAO');
  Result := Inherited Insert;
end;

end.



