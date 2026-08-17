{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
N. Sol..........: 37493
Data............: 12/01/2017
Responsável.....: William Moreira da Silva
Descrição.......: Alteração para aceitar valor zero nos campos Parcela Mensal e Penalidade (ANS)
--------------------------------------------------------------------------------
N. Sol..........: 242313/17289
N. PPM..........: 828977
Data............: 19/06/2015
Responsável.....: Felipe A. Santos
Descrição.......: criação da Db.
--------------------------------------------------------------------------------}

unit uDbContratoANS;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
   TDbContratoAns = class(TCmDbObject)
   private
    FReferencia: TCmDbField;
    FNumDocumento: TCmDbField;
    FIdContrato: TCmDbField;
    FVlrAns: TCmDbField;
    FVlrMensal: TCmDbField;
    FIdMedicao: TCmDbField;
    FObs: TCmDbField;
    FIdAns: TCmDbField;
    FNumCI: TCmDbField;
    FDtLancto: TCmDbField;

   public
     function Insert : boolean; override;

     constructor Create(Aowner: TCmCustomCdbObject); override;

     property IdANS : TCmDbField read FIdAns write FIdAns;
     property IdContrato : TCmDbField read FIdContrato write FIdContrato;
     property IdMedicao : TCmDbField read FIdMedicao write FIdMedicao;
     property VlrMensal : TCmDbField read FVlrMensal write FVlrMensal;
     property VlrAns : TCmDbField read FVlrAns write FVlrAns;
     property NumCI : TCmDbField read FNumCI write FNumCI;
     property NumDocumento : TCmDbField read FNumDocumento write FNumDocumento;
     property Referencia : TCmDbField read FReferencia write FReferencia;
     property Obs : TCmDbField read FObs write FObs;
     property DtLancto : TCmDbField read FDtLancto write FDtLancto;
   end;

implementation

{ TDbContratoAns }

constructor TDbContratoAns.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  TableName := 'CONTRATOANS';

  FReferencia := CreateCmDbField('REFERENCIA', ftString, False, False, False, True, '');
  FNumDocumento := CreateCmDbField('NUMDOCUMENTO', ftString, False, False, False, True, '');
  FIdContrato := CreateCmDbField('IDCONTRATO', ftFloat, False, False, False, True, '');

  //William Moreira da Silva - SIG 37493
  //FVlrAns := CreateCmDbField('VLRANS', ftFloat, False, False, False, True, '');
  FVlrAns := CreateCmDbField('VLRANS', ftFloat, False, False, False, False, '');
  //FVlrMensal := CreateCmDbField('VLRMENSAL', ftFloat,False, False, False, True, '');
  FVlrMensal := CreateCmDbField('VLRMENSAL', ftFloat,False, False, False, False, '');
  //William Moreira da Silva - SIG 37493

  FIdMedicao := CreateCmDbField('IDMEDICAO', ftFloat, False, False, False, True, '');
  FObs := CreateCmDbField('OBS', ftString, False, False, False, False, '');
  FIdAns := CreateCmDbField('IDANS', ftFloat, True, True, False, True, '');
  FNumCI := CreateCmDbField('NUMCI', ftString, False, False, False, False, '');
  FDtLancto := CreateCmDbField('DTLANCTO', ftDateTime, False, False, False, False, '');
end;

function TDbContratoAns.Insert: boolean;
begin
  FIdAns.AsFloat := GetSequence('CONTRATOANS');
  Result := inherited Insert;
end;



end.
