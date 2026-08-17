{-------------------------------------------------------------------------------
Criação   : Thiago Melo
Pendência : 174920
Data      : 25/10/2012
Descrição : Manter histórico de renovação de contratos.
-------------------------------------------------------------------------------}

unit uDbHstRenovacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbHstRenovacao = class(TCmDbObject)

  private
    FDescAndamento: TCmDbField;
    FIdContrato: TCmDbField;
    FIdHstRenovaContrato: TCmDbField;
    FDtAndamento: TCmDbField;

  public
    property IdHstRenovaContrato : TCmDbField read FIdHstRenovaContrato write FIdHstRenovaContrato;
    property IdContrato          : TCmDbField read FIdContrato          write FIdContrato;
    property DtAndamento         : TCmDbField read FDtAndamento         write FDtAndamento;
    property DescAndamento       : TCmDbField read FDescAndamento       write FDescAndamento;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;


implementation

{ TDbHstRenovacao }

constructor TDbHstRenovacao.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'HSTRENOVACONTRATO';

  IdHstRenovaContrato := CreateCmDbField('IDHSTRENOVACONTRATO',ftfloat,False,True,False,True,'');
  IdContrato          := CreateCmDbField('IDCONTRATO',ftfloat,False,False,False,True,'');
  DtAndamento         := CreateCmDbField('DTANDAMENTO',ftDate,False,False,False,True,'');
  DescAndamento       := CreateCmDbField('DESCANDAMENTO',ftString,False,False,False,True,'');
end;

function TDbHstRenovacao.Insert: Boolean;
begin
  IdHstRenovaContrato.AsFloat := GetSequence('HSTRENOVACAOCONTRATO');
  Result := Inherited Insert;
end;

end.
