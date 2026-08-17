{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcio Motta                    }
{ Atualizado Em: 24/06/2005                             }
{                                                       }
{*******************************************************}

unit uDbFormasApuraOrc;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbFormorcadodet = class(TCmDbObject)

  private
    FPeriodoIni      : TCmDbField;
    FPeriodoFim      : TCmDbField;
    FPercentual      : TCmDbField;
    FMoeCodigo         : TCmDbField;
    FIdFormOrcadoDet : TCmDbField;
    FIdFormOrcado    : TCmDbField;
    FIdFormaApuracao : TCmDbField;
    FFlgAcumulaMoeda : TCmDbField;
    FFlgAcumPerc     : TCmDbField;
    FData            : TCmDbField;

    procedure SetPeriodoIni(const Value: TCmDbField);
    procedure SetPeriodoFim(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetMoeCodigo(const Value: TCmDbField);
    procedure SetIdFormOrcadoDet(const Value: TCmDbField);
    procedure SetIdFormOrcado(const Value: TCmDbField);
    procedure SetIdFormaApuracao(const Value: TCmDbField);
    procedure SetFlgAcumulaMoeda(const Value: TCmDbField);
    procedure SetFlgAcumPerc(const Value: TCmDbField);
    procedure SetData(const Value: TCmDbField);


  public
    property PeriodoIni: TCmDbField      read FPeriodoIni      write SetPeriodoIni;
    property PeriodoFim: TCmDbField      read FPeriodoFim      write SetPeriodoFim;
    property Percentual: TCmDbField      read FPercentual      write SetPercentual;
    property MoeCodigo: TCmDbField         read FMoeCodigo         write SetMoeCodigo;
    property IdFormOrcadoDet: TCmDbField read FIdFormOrcadoDet write SetIdFormOrcadoDet;
    property IdFormOrcado: TCmDbField    read FIdFormOrcado    write SetIdFormOrcado;
    property IdFormaApuracao: TCmDbField read FIdFormaApuracao write SetIdFormaApuracao;
    property FlgAcumulaMoeda: TCmDbField read FFlgAcumulaMoeda write SetFlgAcumulaMoeda;
    property FlgAcumPerc: TCmDbField     read FFLgAcumPerc     write SetFlgAcumPerc;
    property Data: TCmDbField            read FData            write SetData;

    constructor Create(Aowner: TCmCustomCdbObject); override;

    function Insert :Boolean; override;
  end;

implementation

{ TDbFormorcadodet }

constructor TDbFormorcadodet.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORMORCADODET';

  fPeriodoIni      := CreateCmDbField('PERIODOINI',      ftfloat,    False, False, False, True, 'Período Inicial');
  fPeriodoFim      := CreateCmDbField('PERIODOFIM',      ftfloat,    False, False, False, True, 'Período Final');
  fPercentual      := CreateCmDbField('PERCENTUAL',      ftfloat,    False, False, False, True, 'Percentual');
  fMoeCodigo         := CreateCmDbField('MoeCodigo',         ftfloat,    False, False, False, True, 'ID Moeda');
  fIdFormOrcadoDet := CreateCmDbField('IDFORMORCADODET', ftfloat,    True,  True,  False, True, 'ID FormOrcadoDet');
  fIdFormOrcado    := CreateCmDbField('IDFORMORCADO',    ftfloat,    True,  False, False, True, 'ID FormOrcado');
  fIdFormaApuracao := CreateCmDbField('IDFORMAAPURACAO', ftfloat,    False, False, False, True, 'ID Forma Apuração');
  fFlgAcumulaMoeda := CreateCmDbField('FLGACUMULAMOEDA', ftString,   False, False, False, True, 'Acumula Moeda');
  fFlgAcumPerc     := CreateCmDbField('FLGACUMPERC',     ftString,   False, False, False, True, 'Acumula Percentual');
  fData            := CreateCmDbField('DATA',            ftDateTime, False, False, False, True, 'Data de Cadastro');

  // Marcio Motta: **************************************************************//
  // DESCRIÇÃO DOS VALORES GRAVADOS NOS CAMPOS:                                  //
  // ============================================================================//
  // FLGACUMULAMOEDA: 'T' = True     'F' = False                                 //
  // ============================================================================//
  // FLGACUMULAPERC:  'T' = True     'F' = False                                 //
  // ============================================================================//
  // IDFORMAAPURACAO: (ATENÇÃO: Se não virar uma tabela!!!)                      //
  // 1 = Movimentação do último mês apurado                                      //
  // 2 = Média da movimentação dos meses                                         //
  // 3 = Somatório da movimentação dos meses                                     //
  // 4 = Período a Período                                                       //
  // ****************************************************************************//


end;

function TDbFormorcadodet.Insert: Boolean;
begin
  fIdformorcadodet.AsFloat := GetSequence('FORMORCADODET');
  Result := Inherited Insert;
end;


procedure TDbFormorcadodet.SetFlgAcumPerc(const Value: TCmDbField);
begin
  FFlgAcumPerc := Value;
end;

procedure TDbFormorcadodet.SetData(const Value: TCmDbField);
begin
  FData := Value;
end;

procedure TDbFormorcadodet.SetFlgAcumulaMoeda(const Value: TCmDbField);
begin
  FFlgAcumulaMoeda := Value;
end;

procedure TDbFormorcadodet.SetIdFormaApuracao(const Value: TCmDbField);
begin
  FIdFormaApuracao := Value;
end;

procedure TDbFormorcadodet.SetIdFormOrcado(const Value: TCmDbField);
begin
  FIdFormOrcado := Value;
end;

procedure TDbFormorcadodet.SetIdFormOrcadoDet(const Value: TCmDbField);
begin
  FIdFormOrcadoDet := Value;
end;

procedure TDbFormorcadodet.SetMoeCodigo(const Value: TCmDbField);
begin
  FMoeCodigo := Value;
end;

procedure TDbFormorcadodet.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDbFormorcadodet.SetPeriodoFim(const Value: TCmDbField);
begin
  FPeriodoFim := Value;
end;

procedure TDbFormorcadodet.SetPeriodoIni(const Value: TCmDbField);
begin
  FPeriodoIni := Value;
end;

end.



