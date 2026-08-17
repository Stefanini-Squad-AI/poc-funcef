{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/11/2005                             }
{                                                       }
{*******************************************************}

unit uDbDeparaexterno;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDeparaexterno = class(TCmDbObject)

  private
    FVlrexterno: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FVlrcm: TCmDbField;
    FAtributo: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIddeparaexterno: TCmDbField;
    FFlgorigem: TCmDbField;
    procedure SetAtributo(const Value: TCmDbField);
    procedure SetFlgorigem(const Value: TCmDbField);
    procedure SetIddeparaexterno(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetVlrcm(const Value: TCmDbField);
    procedure SetVlrexterno(const Value: TCmDbField);

  public

     Property Vlrexterno: TCmDbField read FVlrexterno write SetVlrexterno;
     Property Vlrcm: TCmDbField read FVlrcm write SetVlrcm;
     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Iddeparaexterno: TCmDbField read FIddeparaexterno write SetIddeparaexterno;
     Property Flgorigem: TCmDbField read FFlgorigem write SetFlgorigem;
     Property Atributo: TCmDbField read FAtributo write SetAtributo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbDeparaexterno }

constructor TDbDeparaexterno.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DEPARAEXTERNO';

   fVlrexterno := CreateCmDbField('VLREXTERNO',ftString,False,False,False,True,'');
   fVlrcm := CreateCmDbField('VLRCM',ftString,False,False,False,True,'');
   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fIddeparaexterno := CreateCmDbField('IDDEPARAEXTERNO',ftfloat,True,True,False,True,'');
   fFlgorigem := CreateCmDbField('FLGORIGEM',ftString,False,False,False,True,'');
   fAtributo := CreateCmDbField('ATRIBUTO',ftString,False,False,False,True,'');
end;

function TDbDeparaexterno.Insert: Boolean;
begin

   fIddeparaexterno.AsFloat := GetSequence('DEPARAEXTERNO');
   Result := Inherited Insert;

end;


procedure TDbDeparaexterno.SetAtributo(const Value: TCmDbField);
begin
  FAtributo := Value;
end;

procedure TDbDeparaexterno.SetFlgorigem(const Value: TCmDbField);
begin
  FFlgorigem := Value;
end;

procedure TDbDeparaexterno.SetIddeparaexterno(const Value: TCmDbField);
begin
  FIddeparaexterno := Value;
end;

procedure TDbDeparaexterno.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbDeparaexterno.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

procedure TDbDeparaexterno.SetVlrcm(const Value: TCmDbField);
begin
  FVlrcm := Value;
end;

procedure TDbDeparaexterno.SetVlrexterno(const Value: TCmDbField);
begin
  FVlrexterno := Value;
end;

end.



