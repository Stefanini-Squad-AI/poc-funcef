{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/09/2007                             }
{                                                       }
{*******************************************************}

unit uDbCarteiraXEvento;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCarteiraXEvento = class(TCmDbObject)

  private
    FIdcarteiragerenc: TCmDbField;
    FIdcarteirainvest: TCmDbField;
    FIdeventocaixacota: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdcarteiraxevento: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FIDREGRA: TCmDbField;
    procedure SetIdcarteiragerenc(const Value: TCmDbField);
    procedure SetIdcarteirainvest(const Value: TCmDbField);
    procedure SetIdcarteiraxevento(const Value: TCmDbField);
    procedure SetIdeventocaixacota(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetIDREGRA(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Ideventocaixacota: TCmDbField read FIdeventocaixacota write SetIdeventocaixacota;
     Property Idcarteiraxevento: TCmDbField read FIdcarteiraxevento write SetIdcarteiraxevento;
     Property Idcarteirainvest: TCmDbField read FIdcarteirainvest write SetIdcarteirainvest;
     Property Idcarteiragerenc: TCmDbField read FIdcarteiragerenc write SetIdcarteiragerenc;
     Property IDREGRA: TCmDbField read FIDREGRA write SetIDREGRA;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCarteiraXEvento }

constructor TDbCarteiraXEvento.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CARTEIRAXEVENTO';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fIdeventocaixacota := CreateCmDbField('IDEVENTOCAIXACOTA',ftfloat,False,False,False,True,'Identificador Evento');
   fIdcarteiraxevento := CreateCmDbField('IDCARTEIRAXEVENTO',ftfloat,True,True,False,True,'Identificador da Tabela');
   fIdcarteirainvest := CreateCmDbField('IDCARTEIRAINVEST',ftfloat,False,False,False,True,'Identificador Carteira Invest');
   fIdcarteiragerenc := CreateCmDbField('IDCARTEIRAGERENC',ftfloat,False,False,False,True,'Identifcador Carteira Gerencia');
   FIDREGRA := CreateCmDbField('IDREGRA',ftFloat, False, False, False, True, 'Identificador da Regra');
end;

function TDbCarteiraXEvento.Insert: Boolean;
begin
   fIdcarteiraxevento.AsFloat := GetSequence('CARTEIRAXEVENTO');
   Result := Inherited Insert;
end;


procedure TDbCarteiraXEvento.SetIdcarteiragerenc(const Value: TCmDbField);
begin
  FIdcarteiragerenc := Value;
end;

procedure TDbCarteiraXEvento.SetIdcarteirainvest(const Value: TCmDbField);
begin
  FIdcarteirainvest := Value;
end;

procedure TDbCarteiraXEvento.SetIdcarteiraxevento(const Value: TCmDbField);
begin
  FIdcarteiraxevento := Value;
end;

procedure TDbCarteiraXEvento.SetIdeventocaixacota(const Value: TCmDbField);
begin
  FIdeventocaixacota := Value;
end;

procedure TDbCarteiraXEvento.SetIDREGRA(const Value: TCmDbField);
begin
  FIDREGRA := Value;
end;

procedure TDbCarteiraXEvento.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbCarteiraXEvento.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



