{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 31/05/2006                             }
{                                                       }
{*******************************************************}

unit uDbProvPerdaRV;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbProvPerdaRV = class(TCmDbObject)

  private
    FDatavigencia: TCmDbField;
    FIdprovperdarv: TCmDbField;
    FPercentual: TCmDbField;
    FIdinvestimento: TCmDbField;
    procedure SetDatavigencia(const Value: TCmDbField);
    procedure SetIdinvestimento(const Value: TCmDbField);
    procedure SetIdprovperdarv(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);

  public

     Property Percentual: TCmDbField read FPercentual write SetPercentual;
     Property Idprovperdarv: TCmDbField read FIdprovperdarv write SetIdprovperdarv;
     Property Idinvestimento: TCmDbField read FIdinvestimento write SetIdinvestimento;
     Property Datavigencia: TCmDbField read FDatavigencia write SetDatavigencia;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbProvPerdaRV }

constructor TDbProvPerdaRV.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PROVPERDARV';

   fPercentual := CreateCmDbField('PERCENTUAL',ftfloat,True,False,False,True,'Percentual da Provisão');
   fIdprovperdarv := CreateCmDbField('IDPROVPERDARV',ftfloat,True,True,False,True,'Identificador da Provisão');
   fIdinvestimento := CreateCmDbField('IDINVESTIMENTO',ftfloat,True,False,False,True,'Identificador do Investimento');
   fDatavigencia := CreateCmDbField('DATAVIGENCIA',ftDateTime,True,False,False,True,'Data da Vigência');
end;

function TDbProvPerdaRV.Insert: Boolean;
begin

   fIdprovperdarv.AsFloat := GetSequence('PROVPERDARV');
   Result := Inherited Insert;

end;


procedure TDbProvPerdaRV.SetDatavigencia(const Value: TCmDbField);
begin
  FDatavigencia := Value;
end;

procedure TDbProvPerdaRV.SetIdinvestimento(const Value: TCmDbField);
begin
  FIdinvestimento := Value;
end;

procedure TDbProvPerdaRV.SetIdprovperdarv(const Value: TCmDbField);
begin
  FIdprovperdarv := Value;
end;

procedure TDbProvPerdaRV.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

end.



