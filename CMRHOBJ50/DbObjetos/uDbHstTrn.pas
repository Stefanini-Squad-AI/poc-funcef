{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 29/11/2002                                 }
{                                                       }
{*******************************************************}
{-------------------------------------------------------------------------------------------------
Nº SIG......: 82142
Data........: 15/02/2019
Responsável.: Taffarel Sevaybriker
Descrição...: Ajuste no tipo de campo de Observações.
--------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
--------------------------------------------------------------------------------------------------
Nº SOL......: 177768
Nº KINTANA..: 1635450
Data........: 19/11/2012
Responsável.: Thiago Melo
Descrição...: Alteração na forma de Registro Individual de Treinamento.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 137268
Nº KINTANA..: 829513
Data........: 30/12/2011
Responsável.: Helen V. Bianchi
Descrição...: Inserção de novos campos
-------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 116914
Nº KINTANA..: 558952
Data........: 04/04/2011
Responsável.: Thaise Amaral Martins
Descrição...: Inserir campo TERMOCURSO
--------------------------------------------------------------------------------}


unit uDbHstTrn;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbHstTrn = class(TCmDbObject)
  private
    FAvalCurso: TCmDbField;
    FDatReFim: TCmDbField;
    FAvalTeor: TCmDbField;
    FIdEntidInstr: TCmDbField;
    FFlgAvalCurs: TCmDbField;
    FLocalCurso: TCmDbField;
    FDatPlFim: TCmDbField;
    FFlgAvalPrat: TCmDbField;
    FIdCurso: TCmDbField;
    FNumSeq: TCmDbField;
    FDesp_Estad: TCmDbField;
    FDur_Teor: TCmDbField;
    FAvalPrat: TCmDbField;
    FDesp_Outr: TCmDbField;
    FIdPessoa: TCmDbField;
    FDatPlIni: TCmDbField;
    FIdInstrutor: TCmDbField;
    FDatReIni: TCmDbField;
    FFlgControle: TCmDbField;
    FFlgAvalTeor: TCmDbField;
    FValor: TCmDbField;
    FDesp_Viag: TCmDbField;
    FIdProcesso: TCmDbField;
    FDur_Prat: TCmDbField;
    FDur_Tot: TCmDbField;
    FIdModulo: TCmDbField;
    FDataHora: TCmDbField;
    FInstrutores: TCmDbField;
    FObservacao: TCmDbField;
    FTermoCurso: TCmDbField;
    FCoddocumento: TCmDbField;
    FUnidnegoc: TCmDbField;
    FCodcentrorespon: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FIdprograma: TCmDbField;
    FIdplanoprev : TCmDbField;
    FIdpessoa_patro : TCmDbField;
    FDatavencto: TCmDbField;
    FObservacao_ap : TCmDbField;
    FHist : TCmDbField;
    FIdForCli: TCmDbField;
    FIdcidades :  TCmDbField;
    fPlncodigo : TCmDbField;
    FDtEntrega: TCmDbField;
    FEntregue: TCmDbField;
    FPercentEmpregado: TCmDbField;
    FPercentEmpresa: TCmDbField;
    FQtdParcela: TCmDbField;
    Fvlr_DevolverDtAtual: TCmDbField;
    FIdTurma: TCmDbField;
    FRegistro: TCmDbField;
    FDatFid: TCmDbField;
    FDtDeslProg: TCmDbField;
    FFlgSim: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property IdInstrutor: TCmDbField read FIdInstrutor write FIdInstrutor;
    property IdEntidInstr: TCmDbField read FIdEntidInstr write FIdEntidInstr;
    property IdProcesso: TCmDbField read FIdProcesso write FIdProcesso;
    property IdCurso: TCmDbField read FIdCurso write FIdCurso;
    property LocalCurso: TCmDbField read FLocalCurso write FLocalCurso;
    property DatReIni: TCmDbField read FDatReIni write FDatReIni;
    property DatReFim: TCmDbField read FDatReFim write FDatReFim;
    property DatPlIni: TCmDbField read FDatPlIni write FDatPlIni;
    property DatPlFim: TCmDbField read FDatPlFim write FDatPlFim;
    property FlgControle: TCmDbField read FFlgControle write FFlgControle;
    property FlgAvalTeor: TCmDbField read FFlgAvalTeor write FFlgAvalTeor;
    property FlgAvalPrat: TCmDbField read FFlgAvalPrat write FFlgAvalPrat;
    property FlgAvalCurs: TCmDbField read FFlgAvalCurs write FFlgAvalCurs;
    property Dur_Tot: TCmDbField read FDur_Tot write FDur_Tot;
    property Dur_Teor: TCmDbField read FDur_Teor write FDur_Teor;
    property Dur_Prat: TCmDbField read FDur_Prat write FDur_Prat;
    property Desp_Viag: TCmDbField read FDesp_Viag write FDesp_Viag;
    property Desp_Outr: TCmDbField read FDesp_Outr write FDesp_Outr;
    property Desp_Estad: TCmDbField read FDesp_Estad write FDesp_Estad;
    property AvalTeor: TCmDbField read FAvalTeor write FAvalTeor;
    property AvalPrat: TCmDbField read FAvalPrat write FAvalPrat;
    property AvalCurso: TCmDbField read FAvalCurso write FAvalCurso;
    property Valor: TCmDbField read FValor write FValor;
    property IdModulo: TCmDbField read FIdModulo write FIdModulo;
    property DataHora: TCmDbField read FDataHora write FDataHora;
    property Instrutores: TCmDbField read FInstrutores write FInstrutores;
    //Cássio - SOL Nº116905 KINTANA Nº 558951
    property Observacao: TCmDbField read FObservacao write FObservacao;
    property TermoCurso: TCmDbField read FTermoCurso write FTermoCurso;
    //Helen - SOL Nº137268 KINTANA Nº 829513 - Inicio
    Property Coddocumento: TCmDbField read FCoddocumento write FCoddocumento ;
    Property Unidnegoc: TCmDbField read FUnidnegoc write FUnidnegoc;
    Property Codcentrorespon: TCmDbField read FCodcentrorespon write FCodcentrorespon;
    Property Codtiprecdes: TCmDbField read FCodtiprecdes write FCodtiprecdes;
    Property Codcentrocusto: TCmDbField read FCodcentrocusto write FCodcentrocusto;
    Property Idprograma: TCmDbField read FIdprograma write FIdprograma ;
    Property Idplanoprev: TCmDbField read FIdplanoprev write FIdplanoprev;
    Property Idpessoa_patro: TCmDbField read FIdpessoa_patro write FIdpessoa_patro;
    Property Datavencto: TCmDbField read FDatavencto write FDatavencto;
    Property Observacao_ap: TCmDbField read FObservacao_ap write FObservacao_ap;
    Property Hist: TCmDbField read FHist write FHist;
    Property IdForCli: TCmDbField read FIdForCli write FIdForCli ;
    Property IdCidades: TCmDbField read FIdCidades write FIdCidades;
    Property PlnCodigo: TCmDbField read FPlnCodigo write FPlnCodigo;
   //Helen - SOL Nº137268 KINTANA Nº 829513 - Fim

   //  Thiago Melo SOL 177768 Kintana 1635450 INI
    property Entregue : TCmDbField read FEntregue write FEntregue;
    property DtEntrega : TCmDbField read FDtEntrega write FDtEntrega;
    property QtdParcela       : TCmDbField read FQtdParcela write FQtdParcela;
    property PercentEmpresa   : TCmDbField read FPercentEmpresa write FPercentEmpresa;
    property PercentEmpregado : TCmDbField read FPercentEmpregado write FPercentEmpregado;
    property vlr_DevolverDtAtual : TCmDbField read Fvlr_DevolverDtAtual write Fvlr_DevolverDtAtual;
   //  Thiago Melo SOL 177768 Kintana 1635450 FIM

   // Edilaine - SOL 137268-7062 / KTN 1497173
   property  FlgSim : TCmDbField read FFlgSim write FFlgSim;
   property  DtDeslProg : TCmDbField read FDtDeslProg write FDtDeslProg;
   property  IdTurma : TCmDbField read FIdTurma write FIdTurma;
   property  Registro : TCmDbField read FRegistro write FRegistro;
   property  DatFid : TCmDbField read FDatFid write FDatFid;
   // Edilaine - SOL 137268-7062 / KTN 1497173

  end;

implementation

{ TDbHstTrn }

constructor TDbHstTrn.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTTRN';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,true,'');
  FIdCurso := CreateCmDbField('IDCURSO',ftFloat,true,true,false,true,'');
  FIdInstrutor := CreateCmDbField('IDINSTRUTOR',ftFloat,false,false,false,true,'');
  FIdEntidInstr := CreateCmDbField('IDENTIDINSTR',ftFloat,false,false,false,true,'');
  FIdProcesso := CreateCmDbField('IDPROCESSO',ftFloat,false,false,false,true,'');
  FLocalCurso := CreateCmDbField('LOCALCURSO',ftString,false,false,false,true,'');
  FDatReIni := CreateCmDbField('DATREINI',ftDateTime,false,false,false,true,'');
  FDatReFim := CreateCmDbField('DATREFIM',ftDateTime,false,false,false,true,'');
  FDatPlIni := CreateCmDbField('DATPLINI',ftDateTime,false,false,false,true,'');
  FDatPlFim := CreateCmDbField('DATPLFIM',ftDateTime,false,false,false,true,'');
  FFlgControle := CreateCmDbField('FLGCONTROLE',ftFloat,false,false,false,false,'');
  FFlgAvalTeor := CreateCmDbField('FLGAVALTEOR',ftFloat,false,false,false,false,'');
  FFlgAvalPrat := CreateCmDbField('FLGAVALPRAT',ftFloat,false,false,false,false,'');
  FFlgAvalCurs := CreateCmDbField('FLGAVALCURS',ftFloat,false,false,false,false,'');
  FDur_Tot := CreateCmDbField('DUR_TOT',ftFloat,false,false,false,false,'');
  FDur_Teor := CreateCmDbField('DUR_TEOR',ftFloat,false,false,false,false,'');
  FDur_Prat := CreateCmDbField('DUR_PRAT',ftFloat,false,false,false,false,'');
  FDesp_Viag := CreateCmDbField('DESP_VIAG',ftFloat,false,false,false,false,'');
  FDesp_Outr := CreateCmDbField('DESP_OUTR',ftFloat,false,false,false,false,'');
  FDesp_Estad := CreateCmDbField('DESP_ESTAD',ftFloat,false,false,false,false,'');
  FAvalTeor := CreateCmDbField('AVALTEOR',ftFloat,false,false,false,false,'');
  FAvalPrat := CreateCmDbField('AVALPRAT',ftFloat,false,false,false,false,'');
  FAvalCurso := CreateCmDbField('AVALCURSO',ftFloat,false,false,false,false,'');
  FValor := CreateCmDbField('VALOR',ftFloat,false,false,false,false,'');
  FIdModulo := CreateCmDbField('IDMODULO',ftFloat,false,false,false,true,'');
  FDataHora := CreateCmDbField('DATAHORA',ftString,false,false,false,true,'');
  FInstrutores := CreateCmDbField('INSTRUTORES',ftString,false,false,false,true,'');
  //Cássio - SOL Nº116905 KINTANA Nº 558951 - Início
  //Inclusão do campo OBSERVACAO no código
  FObservacao := CreateCmDbField('OBSERVACAO', ftString, false, false, false, true, ''); //Taffarel - SIG82142
  //Cássio - SOL Nº116905 KINTANA Nº 558951 - Fim

  //Thaise - SOL 116914 - Novo campo TERMOCURSO
  FTermoCurso := CreateCmDbField('TERMOCURSO', ftString, false, false, false, true, '');
  //Helen - SOL Nº137268 KINTANA Nº 829513 - Inicio
  fCoddocumento := CreateCmDbField('CODDOCUMENTO',ftfloat,False,False,False,True,'');
  fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
  fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
  fCodcentrorespon := CreateCmDbField('CODCENTRORESPON',ftfloat,False,False,False,True,'');
  fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
  fIdprograma := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
  fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
  fIdpessoa_patro := CreateCmDbField('IDPESSOA_PATRO',ftfloat,False,False,False,True,'');
  fObservacao_ap := CreateCmDbField('OBSERVACAO_AP',ftString,False,False,False,True,'');
  fHist := CreateCmDbField('HIST',ftString,False,False,False,True,'');
  fDatavencto := CreateCmDbField('DATAVENCTO',ftDateTime,False,False,False,True,'');
  fIdForCli := CreateCmDbField('IDFORCLI',ftfloat,False,False,False,True,'');
  fIdCidades := CreateCmDbField('IDCIDADES',ftfloat,False,False,False,True,'');
  fplncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
  //Helen - SOL Nº137268 KINTANA Nº 829513 - Fim

  //  Thiago Melo SOL 177768 Kintana 1635450 INI
  FDtEntrega           := CreateCmDbField('DTENTREGA', ftDateTime,False,False,False,True,'Data de Entrega');
  FEntregue            := CreateCmDbField('ENTREGUE',ftString,False,False,False,True,'');
  FQtdParcela          := CreateCmDbField('QTDPARCELA', ftInteger, False, False, False, False, 'Qtd. Parcelas');
  FPercentEmpresa      := CreateCmDbField('PARTEMPRESA',ftInteger,False,False,False, True,'Percentual Empresa');
  FPercentEmpregado    := CreateCmDbField('PARTEMPREGADO',ftInteger,False,False,False,True,'Percentual Empregado');
  Fvlr_DevolverDtAtual := CreateCmDbField('VLR_DEVOLVERDTATUAL',ftFloat,False,False,False,True,'Valor Devolver na Data Atual');
  //  Thiago Melo SOL 177768 Kintana 1635450 FIM

  // Edilaine - SOL 137268-7062 / KTN 1497173
  FFlgSim     := CreateCmDbField('FLGSIM'    , ftString,  False,False,False,True,'Desligamento do programa: 0 - não / 1 - sim');
  FDtDeslProg := CreateCmDbField('DTDESLPROG', ftDateTime,False,False,False,True,'Data desligamento do programa');
  FIdTurma    := CreateCmDbField('IDTURMA'   , ftfloat,   False,False,False,True,'Identificador da turma do curso');
  FRegistro   := CreateCmDbField('REGISTRO'  , ftString,  False,False,False,True,'Tipo de registro: T - Treinamento / I - Incentivo');
  FDatFid     := CreateCmDbField('DATFID'    , ftDateTime,False,False,False,True,'Data fim da fidelidade');
  // Edilaine - SOL 137268-7062 / KTN 1497173 - FIM

end;


end.
