{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 05/09/2005                             }
{                                                       }
{*******************************************************}

unit uDbItemRenfix;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbItemRenfix = class(TCmDbObject)

  private
    FCoditemrenfix: TCmDbField;
    FFlgregra: TCmDbField;
    FTipoitem: TCmDbField;
    FIditemrenfix: TCmDbField;
    FDescitemrenfix: TCmDbField;
    procedure SetCoditemrenfix(const Value: TCmDbField);
    procedure SetDescitemrenfix(const Value: TCmDbField);
    procedure SetFlgregra(const Value: TCmDbField);
    procedure SetIditemrenfix(const Value: TCmDbField);
    procedure SetTipoitem(const Value: TCmDbField);

  public

     Property Tipoitem: TCmDbField read FTipoitem write SetTipoitem;
     Property Iditemrenfix: TCmDbField read FIditemrenfix write SetIditemrenfix;
     Property Flgregra: TCmDbField read FFlgregra write SetFlgregra;
     Property Descitemrenfix: TCmDbField read FDescitemrenfix write SetDescitemrenfix;
     Property Coditemrenfix: TCmDbField read FCoditemrenfix write SetCoditemrenfix;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbItemRenfix }

constructor TDbItemRenfix.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ITEMRENFIX';

   fTipoitem := CreateCmDbField('TIPOITEM',ftString,False,False,False,True,'');
   fIditemrenfix := CreateCmDbField('IDITEMRENFIX',ftfloat,True,True,False,True,'');
   fFlgregra := CreateCmDbField('FLGREGRA',ftString,False,False,False,True,'');
   fDescitemrenfix := CreateCmDbField('DESCITEMRENFIX',ftString,False,False,False,True,'');
   fCoditemrenfix := CreateCmDbField('CODITEMRENFIX',ftString,False,False,False,True,'');
end;

function TDbItemRenfix.Insert: Boolean;
begin

   fIditemrenfix.AsFloat := GetSequence('ITEMRENFIX');
   Result := Inherited Insert;

end;


procedure TDbItemRenfix.SetCoditemrenfix(const Value: TCmDbField);
begin
  FCoditemrenfix := Value;
end;

procedure TDbItemRenfix.SetDescitemrenfix(const Value: TCmDbField);
begin
  FDescitemrenfix := Value;
end;

procedure TDbItemRenfix.SetFlgregra(const Value: TCmDbField);
begin
  FFlgregra := Value;
end;

procedure TDbItemRenfix.SetIditemrenfix(const Value: TCmDbField);
begin
  FIditemrenfix := Value;
end;

procedure TDbItemRenfix.SetTipoitem(const Value: TCmDbField);
begin
  FTipoitem := Value;
end;

end.



