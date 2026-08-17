{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/12/2002                             }
{                                                       }
{*******************************************************}

unit uDbRadtipoetapaxproc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadtipoetapaxproc = class(TCmDbObject)

  private
    FIdtipoprocesso: TCmDbField;
    FIdmodulo: TCmDbField;
    FNumdiasprevisto: TCmDbField;
    FFlgfinal: TCmDbField;
    FFlginicial: TCmDbField;
    FIdtipoetapa: TCmDbField;
    procedure SetFlgfinal(const Value: TCmDbField);
    procedure SetFlginicial(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdtipoetapa(const Value: TCmDbField);
    procedure SetIdtipoprocesso(const Value: TCmDbField);
    procedure SetNumdiasprevisto(const Value: TCmDbField);

  public

     Property Numdiasprevisto: TCmDbField read FNumdiasprevisto write SetNumdiasprevisto;
     Property Idtipoprocesso: TCmDbField read FIdtipoprocesso write SetIdtipoprocesso;
     Property Idtipoetapa: TCmDbField read FIdtipoetapa write SetIdtipoetapa;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Flginicial: TCmDbField read FFlginicial write SetFlginicial;
     Property Flgfinal: TCmDbField read FFlgfinal write SetFlgfinal;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadtipoetapaxproc }

constructor TDbRadtipoetapaxproc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADTIPOETAPAXPROC';

   fNumdiasprevisto := CreateCmDbField('NUMDIASPREVISTO',ftfloat,False,False,False,False,'');
   fIdtipoprocesso := CreateCmDbField('IDTIPOPROCESSO',ftfloat,True,True,False,True,'');
   fIdtipoetapa := CreateCmDbField('IDTIPOETAPA',ftfloat,True,True,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fFlginicial := CreateCmDbField('FLGINICIAL',ftString,False,False,False,True,'');
   fFlgfinal := CreateCmDbField('FLGFINAL',ftString,False,False,False,True,'');
end;

function TDbRadtipoetapaxproc.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbRadtipoetapaxproc.SetFlgfinal(const Value: TCmDbField);
begin
  FFlgfinal := Value;
end;

procedure TDbRadtipoetapaxproc.SetFlginicial(const Value: TCmDbField);
begin
  FFlginicial := Value;
end;

procedure TDbRadtipoetapaxproc.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbRadtipoetapaxproc.SetIdtipoetapa(const Value: TCmDbField);
begin
  FIdtipoetapa := Value;
end;

procedure TDbRadtipoetapaxproc.SetIdtipoprocesso(const Value: TCmDbField);
begin
  FIdtipoprocesso := Value;
end;

procedure TDbRadtipoetapaxproc.SetNumdiasprevisto(const Value: TCmDbField);
begin
  FNumdiasprevisto := Value;
end;

end.



