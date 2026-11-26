{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/01/2007                             }
{                                                       }
{*******************************************************}

unit uDbParamRubrica;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamRubrica = class(TCmDbObject)

  private
    FIDRubricaDe    : TCmDbField;
    FIDAgrupamento  : TCmDbField;
    FIDRubricaPara  : TCmDbField;
    FIDParamRubrica : TCmDbField;
    FIDRegra        : TCmDbField;

    procedure SetIDAgrupamento(const Value: TCmDbField);
    procedure SetIDParamRubrica(const Value: TCmDbField);
    procedure SetIDRubricaDe(const Value: TCmDbField);
    procedure SetIDRubricaPara(const Value: TCmDbField);
    procedure SetIDRegra(const Value: TCmDbField);
  public

    Property IDRubricaPara  : TCmDbField read FIDRubricaPara  write SetIDRubricaPara;
    Property IDRubricaDe    : TCmDbField read FIDRubricaDe    write SetIDRubricaDe;
    Property IDParamRubrica : TCmDbField read FIDParamRubrica write SetIDParamRubrica;
    Property IDAgrupamento  : TCmDbField read FIDAgrupamento  write SetIDAgrupamento;
    Property IDRegra        : TCmDbField read FIDRegra        write SetIDRegra;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamRubrica }

constructor TDbParamRubrica.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMRUBRICA';

  fIDRubricaPara  := CreateCmDbField('IDRUBRICAPARA',  ftfloat, True, False, False, False, '');
  fIDRubricaDe    := CreateCmDbField('IDRUBRICADE',    ftfloat, True, False, False, False, '');
  fIDParamRubrica := CreateCmDbField('IDPARAMRUBRICA', ftfloat, True, True,  False, False, '');
  fIDAgrupamento  := CreateCmDbField('IDAGRUPAMENTO',  ftfloat, True, False, False, False, '');
  fIDRegra        := CreateCmDbField('IDREGRA',        ftfloat, True, False, False, False, '');
end;

function TDbParamRubrica.Insert: Boolean;
begin
  fIDParamRubrica.AsFloat := GetSequence('PARAMRUBRICA');
  Result := Inherited Insert;
end;

procedure TDbParamRubrica.SetIDAgrupamento(const Value: TCmDbField);
begin
  FIDAgrupamento := Value;
end;

procedure TDbParamRubrica.SetIDParamRubrica(const Value: TCmDbField);
begin
  FIDParamRubrica := Value;
end;

procedure TDbParamRubrica.SetIDRegra(const Value: TCmDbField);
begin
   FIDRegra := Value;
end;

procedure TDbParamRubrica.SetIDRubricaDe(const Value: TCmDbField);
begin
  FIDRubricaDe := Value;
end;

procedure TDbParamRubrica.SetIDRubricaPara(const Value: TCmDbField);
begin
  FIDRubricaPara := Value;
end;

end.



