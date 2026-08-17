{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadobjetoxetapa;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadobjetoxetapa = class(TCmDbObject)

  private
    FIdtipoprocesso: TCmDbField;
    FIdobjeto: TCmDbField;
    FOrdem: TCmDbField;
    FIdtipoetapa: TCmDbField;
    procedure SetIdobjeto(const Value: TCmDbField);
    procedure SetIdtipoetapa(const Value: TCmDbField);
    procedure SetIdtipoprocesso(const Value: TCmDbField);
    procedure SetOrdem(const Value: TCmDbField);

  public

     Property Ordem: TCmDbField read FOrdem write SetOrdem;
     Property Idtipoprocesso: TCmDbField read FIdtipoprocesso write SetIdtipoprocesso;
     Property Idtipoetapa: TCmDbField read FIdtipoetapa write SetIdtipoetapa;
     Property Idobjeto: TCmDbField read FIdobjeto write SetIdobjeto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadobjetoxetapa }

constructor TDbRadobjetoxetapa.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADOBJETOXETAPA';

   fOrdem := CreateCmDbField('ORDEM',ftfloat,False,False,False,False,'');
   fIdtipoprocesso := CreateCmDbField('IDTIPOPROCESSO',ftfloat,True,True,False,True,'');
   fIdtipoetapa := CreateCmDbField('IDTIPOETAPA',ftfloat,True,True,False,True,'');
   fIdobjeto := CreateCmDbField('IDOBJETO',ftfloat,True,True,False,True,'');
end;

function TDbRadobjetoxetapa.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbRadobjetoxetapa.SetIdobjeto(const Value: TCmDbField);
begin
  FIdobjeto := Value;
end;

procedure TDbRadobjetoxetapa.SetIdtipoetapa(const Value: TCmDbField);
begin
  FIdtipoetapa := Value;
end;

procedure TDbRadobjetoxetapa.SetIdtipoprocesso(const Value: TCmDbField);
begin
  FIdtipoprocesso := Value;
end;

procedure TDbRadobjetoxetapa.SetOrdem(const Value: TCmDbField);
begin
  FOrdem := Value;
end;

end.



