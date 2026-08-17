{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/12/2002                             }
{                15/08/2003 - André Tavares - pendência 14595 }
{*******************************************************}

unit uDbRadfluxo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadfluxo = class(TCmDbObject)

  private
    FIdandamento: TCmDbField;
    FIdtipoprocesso: TCmDbField;
    FIdtipoetapa: TCmDbField;
    FIdetapaant: TCmDbField;
    procedure SetIdandamento(const Value: TCmDbField);
    procedure SetIdetapaant(const Value: TCmDbField);
    procedure SetIdtipoetapa(const Value: TCmDbField);
    procedure SetIdtipoprocesso(const Value: TCmDbField);

  public

     Property Idtipoprocesso: TCmDbField read FIdtipoprocesso write SetIdtipoprocesso;
     Property Idtipoetapa: TCmDbField read FIdtipoetapa write SetIdtipoetapa;
     Property Idetapaant: TCmDbField read FIdetapaant write SetIdetapaant;
     Property Idandamento: TCmDbField read FIdandamento write SetIdandamento;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadfluxo }

constructor TDbRadfluxo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADFLUXO';
  fIdtipoprocesso := CreateCmDbField('IDTIPOPROCESSO',ftfloat,True,True,False,True,'');
  fIdtipoetapa := CreateCmDbField('IDTIPOETAPA',ftfloat,True,True,False,True,'');
  fIdetapaant := CreateCmDbField('IDETAPAANT',ftfloat,True,True,False,True,'');
  fIdandamento := CreateCmDbField('IDANDAMENTO',ftfloat,True,True,False,True,'');
// início - André Tavares -15/08/2003 - pendência 14595
//  esta propriedade tem que ser true pois todos os campos são chave primária
  _UpdateKeyFields := True;
// fim - André Tavares -15/08/2003 - pendência 14595
end;

function TDbRadfluxo.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbRadfluxo.SetIdandamento(const Value: TCmDbField);
begin
  FIdandamento := Value;
end;

procedure TDbRadfluxo.SetIdetapaant(const Value: TCmDbField);
begin
  FIdetapaant := Value;
end;

procedure TDbRadfluxo.SetIdtipoetapa(const Value: TCmDbField);
begin
  FIdtipoetapa := Value;
end;

procedure TDbRadfluxo.SetIdtipoprocesso(const Value: TCmDbField);
begin
  FIdtipoprocesso := Value;
end;

end.



