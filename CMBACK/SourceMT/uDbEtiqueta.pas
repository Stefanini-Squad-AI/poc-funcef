{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/02/2003                             }
{                                                       }
{*******************************************************}

unit uDbEtiqueta;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbEtiqueta = class(TCmDbObject)

  private
    FNumlinhas: TCmDbField;
    FModeloetiq: TCmDbField;
    FIdetiqueta: TCmDbField;
    FNumcharentreetiq: TCmDbField;
    FOrigemcm: TCmDbField;
    FNumlinhasespaco: TCmDbField;
    FNumcolunas: TCmDbField;
    FNumcharlargura: TCmDbField;
    FIdreports: TCmDbField;
    procedure SetIdetiqueta(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetModeloetiq(const Value: TCmDbField);
    procedure SetNumcharentreetiq(const Value: TCmDbField);
    procedure SetNumcharlargura(const Value: TCmDbField);
    procedure SetNumcolunas(const Value: TCmDbField);
    procedure SetNumlinhas(const Value: TCmDbField);
    procedure SetNumlinhasespaco(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);

  public

     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Numlinhasespaco: TCmDbField read FNumlinhasespaco write SetNumlinhasespaco;
     Property Numlinhas: TCmDbField read FNumlinhas write SetNumlinhas;
     Property Numcolunas: TCmDbField read FNumcolunas write SetNumcolunas;
     Property Numcharlargura: TCmDbField read FNumcharlargura write SetNumcharlargura;
     Property Numcharentreetiq: TCmDbField read FNumcharentreetiq write SetNumcharentreetiq;
     Property Modeloetiq: TCmDbField read FModeloetiq write SetModeloetiq;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property Idetiqueta: TCmDbField read FIdetiqueta write SetIdetiqueta;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbEtiqueta }

constructor TDbEtiqueta.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ETIQUETA';

   fOrigemcm := CreateCmDbField('ORIGEMCM',ftfloat,False,False,False,True,'');
   fNumlinhasespaco := CreateCmDbField('NUMLINHASESPACO',ftfloat,False,False,False,True,'');
   fNumlinhas := CreateCmDbField('NUMLINHAS',ftfloat,False,False,False,True,'');
   fNumcolunas := CreateCmDbField('NUMCOLUNAS',ftfloat,False,False,False,True,'');
   fNumcharlargura := CreateCmDbField('NUMCHARLARGURA',ftfloat,False,False,False,True,'');
   fNumcharentreetiq := CreateCmDbField('NUMCHARENTREETIQ',ftfloat,False,False,False,True,'');
   fModeloetiq := CreateCmDbField('MODELOETIQ',ftString,False,False,False,True,'');
   fIdreports := CreateCmDbField('IDREPORTS',ftfloat,False,False,False,True,'');
   fIdetiqueta := CreateCmDbField('IDETIQUETA',ftfloat,True,True,False,True,'');
end;

function TDbEtiqueta.Insert: Boolean;
begin

   fIdetiqueta.AsFloat := GetSequence('ETIQUETA');
   Result := Inherited Insert;

end;


procedure TDbEtiqueta.SetIdetiqueta(const Value: TCmDbField);
begin
  FIdetiqueta := Value;
end;

procedure TDbEtiqueta.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbEtiqueta.SetModeloetiq(const Value: TCmDbField);
begin
  FModeloetiq := Value;
end;

procedure TDbEtiqueta.SetNumcharentreetiq(const Value: TCmDbField);
begin
  FNumcharentreetiq := Value;
end;

procedure TDbEtiqueta.SetNumcharlargura(const Value: TCmDbField);
begin
  FNumcharlargura := Value;
end;

procedure TDbEtiqueta.SetNumcolunas(const Value: TCmDbField);
begin
  FNumcolunas := Value;
end;

procedure TDbEtiqueta.SetNumlinhas(const Value: TCmDbField);
begin
  FNumlinhas := Value;
end;

procedure TDbEtiqueta.SetNumlinhasespaco(const Value: TCmDbField);
begin
  FNumlinhasespaco := Value;
end;

procedure TDbEtiqueta.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

end.



