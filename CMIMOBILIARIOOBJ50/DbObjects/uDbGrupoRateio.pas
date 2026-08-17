{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 30/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrupoRateio;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbGrupoRateio = class(TCmDbObject)

  private
    FImocodigo: TCmDbField;
    FIdmodulo: TCmDbField;
    FGrrdescricao: TCmDbField;
    FIdgruporateio: TCmDbField;
    procedure SetGrrdescricao(const Value: TCmDbField);
    procedure SetIdgruporateio(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetImocodigo(const Value: TCmDbField);

  public

     Property Imocodigo: TCmDbField read FImocodigo write SetImocodigo;
     Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
     Property Idgruporateio: TCmDbField read FIdgruporateio write SetIdgruporateio;
     Property Grrdescricao: TCmDbField read FGrrdescricao write SetGrrdescricao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbGrupoRateio }

constructor TDbGrupoRateio.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPORATEIO';

   fImocodigo := CreateCmDbField('IMOCODIGO',ftString,False,False,False,True,'Código do Grupo de Rateio');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,True,False,False,True,'ID do Módulo');
   fIdgruporateio := CreateCmDbField('IDGRUPORATEIO',ftfloat,True,True,False,True,'ID do Grupo de Rateio');
   fGrrdescricao := CreateCmDbField('GRRDESCRICAO',ftString,True,False,False,True,'Descrição do Grupo de Rateio');
end;

function TDbGrupoRateio.Insert: Boolean;
begin

   fIdgruporateio.AsFloat := GetSequence('GRUPORATEIO');
   Result := Inherited Insert;

end;


procedure TDbGrupoRateio.SetGrrdescricao(const Value: TCmDbField);
begin
  FGrrdescricao := Value;
end;

procedure TDbGrupoRateio.SetIdgruporateio(const Value: TCmDbField);
begin
  FIdgruporateio := Value;
end;

procedure TDbGrupoRateio.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDbGrupoRateio.SetImocodigo(const Value: TCmDbField);
begin
  FImocodigo := Value;
end;

end.



