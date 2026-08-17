{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 25/06/2007                             }
{                                                       }
{*******************************************************}

unit uDbReldinamico;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbReldinamico = class(TCmDbObject)

  private
    FHtmldemonstra: TCmDbField;
    FDescreldinamico: TCmDbField;
    FFlgrollback: TCmDbField;
    FFlgtipodemonstra: TCmDbField;
    FOrigemcm: TCmDbField;
    FQueryinicial: TCmDbField;
    FIdreldinamico: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FIdreports: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FFlgativo: TCmDbField;
    procedure SetDescreldinamico(const Value: TCmDbField);
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetFlgrollback(const Value: TCmDbField);
    procedure SetFlgtipodemonstra(const Value: TCmDbField);
    procedure SetHtmldemonstra(const Value: TCmDbField);
    procedure SetIdreldinamico(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);
    procedure SetQueryinicial(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Queryinicial: TCmDbField read FQueryinicial write SetQueryinicial;
     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property Idreldinamico: TCmDbField read FIdreldinamico write SetIdreldinamico;
     Property Htmldemonstra: TCmDbField read FHtmldemonstra write SetHtmldemonstra;
     Property Flgtipodemonstra: TCmDbField read FFlgtipodemonstra write SetFlgtipodemonstra;
     Property Flgrollback: TCmDbField read FFlgrollback write SetFlgrollback;
     Property Flgativo: TCmDbField read FFlgativo write SetFlgativo;
     Property Descreldinamico: TCmDbField read FDescreldinamico write SetDescreldinamico;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbReldinamico }

constructor TDbReldinamico.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RELDINAMICO';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fQueryinicial := CreateCmDbField('QUERYINICIAL',ftString,False,False,False,True,'');
   fOrigemcm := CreateCmDbField('ORIGEMCM',ftfloat,False,False,False,True,'');
   fIdreports := CreateCmDbField('IDREPORTS',ftfloat,False,False,False,True,'');
   fIdreldinamico := CreateCmDbField('IDRELDINAMICO',ftfloat,True,True,False,True,'');
   fHtmldemonstra := CreateCmDbField('HTMLDEMONSTRA',ftString,False,False,False,True,'');
   fFlgtipodemonstra := CreateCmDbField('FLGTIPODEMONSTRA',ftString,False,False,False,True,'');
   fFlgrollback := CreateCmDbField('FLGROLLBACK',ftfloat,False,False,False,True,'');
   fFlgativo := CreateCmDbField('FLGATIVO',ftfloat,True,False,False,True,'');
   fDescreldinamico := CreateCmDbField('DESCRELDINAMICO',ftString,False,False,False,True,'');
end;

function TDbReldinamico.Insert: Boolean;
begin

   fIdreldinamico.AsFloat := GetSequence('RELDINAMICO');
   Result := Inherited Insert;

end;


procedure TDbReldinamico.SetDescreldinamico(const Value: TCmDbField);
begin
  FDescreldinamico := Value;
end;

procedure TDbReldinamico.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbReldinamico.SetFlgrollback(const Value: TCmDbField);
begin
  FFlgrollback := Value;
end;

procedure TDbReldinamico.SetFlgtipodemonstra(const Value: TCmDbField);
begin
  FFlgtipodemonstra := Value;
end;

procedure TDbReldinamico.SetHtmldemonstra(const Value: TCmDbField);
begin
  FHtmldemonstra := Value;
end;

procedure TDbReldinamico.SetIdreldinamico(const Value: TCmDbField);
begin
  FIdreldinamico := Value;
end;

procedure TDbReldinamico.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbReldinamico.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

procedure TDbReldinamico.SetQueryinicial(const Value: TCmDbField);
begin
  FQueryinicial := Value;
end;

procedure TDbReldinamico.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbReldinamico.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



