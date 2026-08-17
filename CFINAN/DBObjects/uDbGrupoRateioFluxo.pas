{ --------------------------------------------------------------------------------------------------
//N. WO ..........: 13599
//Data............: 30/09/2024
//Responsável.....: Leandro Pocebon
//Descrição.......: Inclusão tipo rateio na configuração do grupo rateio
---------------------------------------------------------------------------------------------------
Nº SOL......: 128685
Nº KINTANA..: 692049
Data........: 06/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
---------------------------------------------------------------------------------------------------}
unit uDbGrupoRateioFluxo;

interface

uses
  uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbGrupoRateioFluxo = class(TCmDbObject)

  private
    FIdGrupoRateioFluxo: TCmDbField;
    FGrRFDescricao: TCmDbField;
    FTipoRateio: TCmDbField; //Leandro WO13599

    procedure SetIdGrupoRateioFluxo(const Value: TCmDbField);
    procedure SetGrRFDescricao(const Value: TCmDbField);
    procedure SetTipoRateio(const Value: TCmDbField);  //Leandro WO13599

  public

     property IdGrupoRateioFluxo: TCmDbField read FIdGrupoRateioFluxo write SetIdGrupoRateioFluxo;
     property GrRFDescricao: TCmDbField read FGrRFDescricao write SetGrRFDescricao;
     property TipoRateio: TCmDbField read FTipoRateio write SetTipoRateio; //Leandro WO13599

     constructor Create(Aowner: TCmCustomCdbObject); override;

     function Insert: Boolean; Override;
  End;

implementation

{ TDbGrupoRateioFluxo }

constructor TDbGrupoRateioFluxo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPORATEIOFLUXO';

  FIdGrupoRateioFluxo := CreateCmDbField('IDGRUPORATEIOFLUXO',ftfloat,True,True,False,False,'');
  FGrRFDescricao := CreateCmDbField('GRRFDESCRICAO',ftString,False,False,False,False,'');
  FTipoRateio := CreateCmDbField('TIPORATEIO',ftString,False,False,False,False,'');  //LEANDRO WO13599

end;

function TDbGrupoRateioFluxo.Insert: Boolean;
begin
   FIdGrupoRateioFluxo.AsFloat := GetSequence('GRUPORATEIOFLUXO');
   Result := Inherited Insert;
end;

procedure TDbGrupoRateioFluxo.SetGrRFDescricao(const Value: TCmDbField);
begin
  FGrRFDescricao := Value;
end;

procedure TDbGrupoRateioFluxo.SetIdGrupoRateioFluxo(
  const Value: TCmDbField);
begin
  FIdGrupoRateioFluxo := Value;
end;

procedure TDbGrupoRateioFluxo.SetTipoRateio(
  const Value: TCmDbField);
begin
  FTipoRateio := Value;
end;

end.



