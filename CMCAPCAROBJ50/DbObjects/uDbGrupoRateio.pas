{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 21/05/2003                             }
{                                                       }
{*******************************************************}

unit uDbGruporateio;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbGruporateio = class(TCmDbObject)

  private
    FIdgruporateio: TCmDbField;
    FIdmodulo: TCmDbField;
    FGrrdescricao: TCmDbField;
    procedure SetGrrdescricao(const Value: TCmDbField);
    procedure SetIdgruporateio(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);

  public

     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idgruporateio: TCmDbField read FIdgruporateio write SetIdgruporateio;
     Property Grrdescricao: TCmDbField read FGrrdescricao write SetGrrdescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbGruporateio }

constructor TDbGruporateio.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPORATEIO';

   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,False,'');
   fIdgruporateio := CreateCmDbField('IDGRUPORATEIO',ftfloat,True,True,False,False,'');
   fGrrdescricao := CreateCmDbField('GRRDESCRICAO',ftString,False,False,False,False,'');
end;



function TDbGruporateio.Insert: Boolean;
begin
   fIdgruporateio.AsFloat := GetSequence('GRUPORATEIO');
   Result := Inherited Insert;
end;


procedure TDbGruporateio.SetGrrdescricao(const Value: TCmDbField);
begin
  FGrrdescricao := Value;
end;

procedure TDbGruporateio.SetIdgruporateio(const Value: TCmDbField);
begin
  FIdgruporateio := Value;
end;

procedure TDbGruporateio.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

end.



