{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/12/2002                             }
{                                                       }
{*******************************************************}

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
//Pendência   : SOL 183027 KINTANA 1720547
//Responsável : RODRIGO DE BRITO FIGUEREDO
//Data        : 25/09/2012
//Descrição   : 
//
//------------------------------------------------------------------------------

unit uDbRequiPes;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbRequiPes = class(TCmDbObject)
  private
    FIdNovoOcup: TCmDbField;
    FSituacao: TCmDbField;
    FIdSubstituido: TCmDbField;
    FIdGrinstr: TCmDbField;
    FIdEstab: TCmDbField;
    FObserv3: TCmDbField;
    FObserv2: TCmDbField;
    FObserv4: TCmDbField;
    FObserv5: TCmDbField;
    FTipoAmpl: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FDataPlan: TCmDbField;
    FTipoContrato: TCmDbField;
    FNumReq: TCmDbField;
    FIdProcesso: TCmDbField;
    FIdCargo: TCmDbField;
    FTipoReq: TCmDbField;
    FDataReq: TCmDbField;
    FIdEmpresa: TCmDbField;
    FObserv: TCmDbField;
    FSexo: TCmDbField;
    FIdAnalista: TCmDbField;
    FIdMotivo: TCmDbField;
    FSalario: TCmDbField;
    // Rodrigo de Brito Figueredo Sol 183027 Kintana 1720547 - Inicio
    FDataAdmissao   : TCmDbField;
    FMotivoAmpliacao: TCmDbField;
    FCurso          : TCmDbField;
    FNumVagas       : TCmDbField;
    FTempoExp       : TCmDbField;
    FFormaSelecao   : TCmDbField;
    FIdHorario      : TCmDbField;
    // Rodrigo de Brito Figueredo Sol 183027 Kintana 1720547 - Fim
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property NumReq: TCmDbField read FNumReq write FNumReq;    
    property TipoReq: TCmDbField read FTipoReq write FTipoReq;
    property TipoContrato: TCmDbField read FTipoContrato write FTipoContrato;
    property TipoAmpl: TCmDbField read FTipoAmpl write FTipoAmpl;
    property Situacao: TCmDbField read FSituacao write FSituacao;
    property Sexo: TCmDbField read FSexo write FSexo;
    property IdSubstituido: TCmDbField read FIdSubstituido write FIdSubstituido;
    property IdProcesso: TCmDbField read FIdProcesso write FIdProcesso;
    property IdNovoOcup: TCmDbField read FIdNovoOcup write FIdNovoOcup;
    property IdGrinstr: TCmDbField read FIdGrinstr write FIdGrinstr;
    property IdEstab: TCmDbField read FIdEstab write FIdEstab;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property DataReq: TCmDbField read FDataReq write FDataReq;
    property DataPlan: TCmDbField read FDataPlan write FDataPlan;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
    property Observ: TCmDbField read FObserv write FObserv;
    property Observ2: TCmDbField read FObserv2 write FObserv2;
    property Observ3: TCmDbField read FObserv3 write FObserv3;
    property Observ4: TCmDbField read FObserv2 write FObserv2;
    property Observ5: TCmDbField read FObserv3 write FObserv3;
    property IdAnalista: TCmDbField read FIdAnalista write FIdAnalista;
    property IdMotivo: TCmDbField read FIdMotivo write FIdMotivo;
    property Salario: TCmDbField read FSalario write FSalario;
    // Rodrigo de Brito Figueredo Sol 183027 Kintana 1720547 - Inicio
    property DataAdmissao     : TCmDbField read FDataAdmissao    write FDataAdmissao ;
    property MotivoAmpliacao  : TCmDbField read FMotivoAmpliacao write FMotivoAmpliacao ;
    property Curso            : TCmDbField read FCurso           write FCurso ;
    property NumVagas         : TCmDbField read FNumVagas        write FNumVagas ;
    property TempoExp         : TCmDbField read FTempoExp        write FTempoExp ;
    property FormaSelecao     : TCmDbField read FFormaSelecao    write FFormaSelecao ;
    property IdHorario        : TCmDbField read FIdHorario       write FIdHorario ;
    // Rodrigo de Brito Figueredo Sol 183027 Kintana 1720547 - Fim
  end;

implementation

{ TDbRequiPes }

constructor TDbRequiPes.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'REQUIPES';

  FNumReq := CreateCmDbField('NUMREQ',ftFloat,true,true,false,true,'');
  FTipoReq := CreateCmDbField('TIPOREQ',ftFloat,true,false,false,false,'');
  FTipoContrato := CreateCmDbField('TIPOCONTRATO',ftString,false,false,false,false,'');
  FTipoAmpl := CreateCmDbField('TIPOAMPL',ftFloat,false,false,false,false,'');
  FSituacao := CreateCmDbField('SITUACAO',ftString,true,false,false,false,'');
  FSexo := CreateCmDbField('SEXO',ftString,false,false,false,false,'');
  FIdSubstituido := CreateCmDbField('IDSUBSTITUIDO',ftFloat,false,false,false,true,'');
  FIdProcesso := CreateCmDbField('IDPROCESSO',ftFloat,false,false,false,true,'');
  FIdNovoOcup := CreateCmDbField('IDNOVOOCUP',ftFloat,false,false,false,true,'');
  FIdGrInstr := CreateCmDbField('IDGRINSTR',ftFloat,false,false,false,true,'');
  FIdEstab := CreateCmDbField('IDESTAB',ftFloat,false,false,false,true,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,false,false,false,true,'');
  FDataReq := CreateCmDbField('DATAREQ',ftDateTime,true,false,false,true,'');
  FDataPlan := CreateCmDbField('DATAPLAN',ftDateTime,false,false,false,true,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,true,'');
  FObserv := CreateCmDbField('OBSERV',ftString,false,false,false,true,'');
  FObserv2 := CreateCmDbField('OBSERV2',ftString,false,false,false,true,'');
  FObserv3 := CreateCmDbField('OBSERV3',ftString,false,false,false,true,'');
  FObserv4 := CreateCmDbField('OBSERV4',ftString,false,false,false,true,'');
  FObserv5 := CreateCmDbField('OBSERV5',ftString,false,false,false,true,'');
  FIdAnalista := CreateCmDbField('IDANALISTA',ftFloat,false,false,false,true,'');
  FIdMotivo := CreateCmDbField('IDMOTIVO',ftFloat,false,false,false,true,'');
  FSalario := CreateCmDbField('SALARIO',ftFloat,false,false,false,true,'');
  // Rodrigo de Brito Figueredo Sol 183027 Kintana 1720547 - Inicio
  FDataAdmissao      :=CreateCmDbField('DATAADMISSAO',ftDateTime,false,false,false,true,'');
  FMotivoAmpliacao   :=CreateCmDbField('MOTIVOAMPLIACAO',ftString,false,false,false,false,'');
  FCurso             :=CreateCmDbField('CURSO',ftString,false,false,false,false,'');
  FNumVagas          :=CreateCmDbField('NUMVAGAS',ftFloat,false,false,false,true,'');
  FTempoExp          :=CreateCmDbField('TEMPOEXP',ftFloat,false,false,false,false,'');
  FFormaSelecao      :=CreateCmDbField('FORMASELECAO',ftFloat,false,false,false,false,'');
  FIdHorario         :=CreateCmDbField('IDHORARIO',ftFloat,false,false,false,true,'');
  // Rodrigo de Brito Figueredo Sol 183027 Kintana 1720547 - Fim
end;

function TDbRequiPes.Insert: boolean;
begin
  NumReq.asFloat := GetSequence('REQUIPES');
  Result := inherited Insert;
end;

end.
