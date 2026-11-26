{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 26/10/2017                             }
{                                                       }
{*******************************************************}
//***************************************************************************************
//Rotina             : Criação da classe
//N. SIG..........   : 23656.57136
//Data da Alteração: : 27/10/2017
//Alteração Form:    : uDbProcessos
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Criação da classe de persistência paara a tabela PROCESSOS
//***************************************************************************************
unit uDbProcessosForn;

interface
uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type TDbProcessosForn = class(TCmDbObject)
	private
    fIndicatDecisao: TCmDbField;
    fContriaAbranDecisao: TCmDbField;
    fTipo: TCmDbField;
    fIdProcesso: TCmDbField;
    fIdCidades: TCmDbField;
    fIdForCli: TCmDbField;
    fApurFAP: TCmDbField;
    fIdFilialPessoa: TCmDbField;
    fExtenDecisao: TCmDbField;
    fCodIdentVara: TCmDbField;
    fIdFuncionario: TCmDbField;
    fNumero: TCmDbField;
    fDataFim: TCmDbField;
    fDataInicio: TCmDbField;
    fProcAdmJud: TCmDbField;
    fAutorAcao: TCmDbField;

    procedure SetApurFAP(const Value: TCmDbField);
    procedure SetAutorAcao(const Value: TCmDbField);
    procedure SetCodIdentVara(const Value: TCmDbField);
    procedure SetContriaAbranDecisao(const Value: TCmDbField);
    procedure SetDataFim(const Value: TCmDbField);
    procedure SetDataInicio(const Value: TCmDbField);
    procedure SetExtenDecisao(const Value: TCmDbField);
    procedure SetIdCidades(const Value: TCmDbField);
    procedure SetIdFilialPessoa(const Value: TCmDbField);
    procedure SetIdForCli(const Value: TCmDbField);
    procedure SetIdFuncionario(const Value: TCmDbField);
    procedure SetIdProcesso(const Value: TCmDbField);
    procedure SetIndicatDecisao(const Value: TCmDbField);
    procedure SetNumero(const Value: TCmDbField);
    procedure SetProcAdmJud(const Value: TCmDbField);
    procedure SetTipo(const Value: TCmDbField);

  protected
  	function Insert : boolean; override;

  public
  	property IdProcesso: TCmDbField read fIdProcesso write SetIdProcesso;
    property IdFilialPessoa: TCmDbField read fIdFilialPessoa write SetIdFilialPessoa;
    property IdFuncionario: TCmDbField read fIdFuncionario write SetIdFuncionario;
    property IdForCli: TCmDbField read fIdForCli write SetIdForCli;
    property IdCidades: TCmDbField read fIdCidades write SetIdCidades;
    property Tipo: TCmDbField read fTipo write SetTipo;
    property Numero: TCmDbField read fNumero write SetNumero;
    property CodIdentVara: TCmDbField read fCodIdentVara write SetCodIdentVara;
    property DataInicio: TCmDbField read fDataInicio write SetDataInicio;
    property DataFim: TCmDbField read fDataFim write SetDataFim;
    property ContriaAbranDecisao: TCmDbField read fContriaAbranDecisao write SetContriaAbranDecisao;
    property ExtenDecisao: TCmDbField read fExtenDecisao write SetExtenDecisao;
    property IndicatDecisao: TCmDbField read fIndicatDecisao write SetIndicatDecisao;
    property ProcAdmJud: TCmDbField read fProcAdmJud write SetProcAdmJud;
    property AutorAcao: TCmDbField read fAutorAcao write SetAutorAcao;
    property ApurFAP:TCmDbField read fApurFAP write SetApurFAP;

    constructor Create(Aowner: TCmCustomCdbObject); Override;

  end;

implementation

{ TDbProcessosXIndicativoSusp }


{ TDbProcessos }

constructor TDbProcessosForn.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
	ErrorIfNoRowsAffected := False;

  TableName := 'PROCESSOS';

  fIdProcesso:= CreateCmDbField('IDPROCESSO', ftFloat, true, true, false, false, '');
  fIdFilialPessoa:= CreateCmDbField('IDFILIALPESSOA', ftFloat, false, false, false, true, '');
  fIdFuncionario:= CreateCmDbField('IDFUNCIONARIO', ftFloat, false, false, false, true, '');
  fIdForCli:= CreateCmDbField('IDFORCLI', ftFloat, false, false, false, true, '');
  fIdCidades:= CreateCmDbField('IDCIDADES', ftFloat, false, false, false, true, '');
  fTipo:= CreateCmDbField('TIPO', ftString, false, false, false, false, '');
  fNumero:= CreateCmDbField('NUMERO', ftString, false, false, false, false, '');
  fCodIdentVara:= CreateCmDbField('CODIDENTVARA', ftFloat, false, false, false, false, '');
  fDataInicio:= CreateCmDbField('DATAINICIO', ftDateTime, false, false, false, true, '');
  fDataFim:= CreateCmDbField('DATAFIM', ftDateTime, false, false, false, true, '');
  fContriaAbranDecisao:= CreateCmDbField('CONTRIABRANDECISAO', ftFloat, false, false, false, true, '');
  fExtenDecisao:= CreateCmDbField('EXTENDECISAO', ftFloat, false, false, false, true, '');
  fIndicatDecisao:= CreateCmDbField('INDICATDECISAO', ftFloat, false, false, false, false, '');
  fProcAdmJud:= CreateCmDbField('PROCADMJUD', ftFloat, false, false, false, true, '');
  fAutorAcao:= CreateCmDbField('AUTORACAO', ftString, false, false, false, false, '');
  fApurFAP:= CreateCmDbField('APURFAP', ftFloat, false, false, false, true, '');

end;

function TDbProcessosForn.Insert: boolean;
begin
	Result := inherited Insert;
end;

procedure TDbProcessosForn.SetApurFAP(const Value: TCmDbField);
begin
  fApurFAP := Value;
end;

procedure TDbProcessosForn.SetAutorAcao(const Value: TCmDbField);
begin
  fAutorAcao := Value;
end;

procedure TDbProcessosForn.SetCodIdentVara(const Value: TCmDbField);
begin
  fCodIdentVara := Value;
end;

procedure TDbProcessosForn.SetContriaAbranDecisao(const Value: TCmDbField);
begin
  fContriaAbranDecisao := Value;
end;

procedure TDbProcessosForn.SetDataFim(const Value: TCmDbField);
begin
  fDataFim := Value;
end;

procedure TDbProcessosForn.SetDataInicio(const Value: TCmDbField);
begin
  fDataInicio := Value;
end;

procedure TDbProcessosForn.SetExtenDecisao(const Value: TCmDbField);
begin
  fExtenDecisao := Value;
end;

procedure TDbProcessosForn.SetIdCidades(const Value: TCmDbField);
begin
  fIdCidades := Value;
end;

procedure TDbProcessosForn.SetIdFilialPessoa(const Value: TCmDbField);
begin
  fIdFilialPessoa := Value;
end;

procedure TDbProcessosForn.SetIdForCli(const Value: TCmDbField);
begin
  fIdForCli := Value;
end;

procedure TDbProcessosForn.SetIdFuncionario(const Value: TCmDbField);
begin
  fIdFuncionario := Value;
end;

procedure TDbProcessosForn.SetIdProcesso(const Value: TCmDbField);
begin
  fIdProcesso := Value;
end;

procedure TDbProcessosForn.SetIndicatDecisao(const Value: TCmDbField);
begin
  fIndicatDecisao := Value;
end;

procedure TDbProcessosForn.SetNumero(const Value: TCmDbField);
begin
  fNumero := Value;
end;

procedure TDbProcessosForn.SetProcAdmJud(const Value: TCmDbField);
begin
  fProcAdmJud := Value;
end;

procedure TDbProcessosForn.SetTipo(const Value: TCmDbField);
begin
  fTipo := Value;
end;

end.
