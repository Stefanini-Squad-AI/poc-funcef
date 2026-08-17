{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 28/08/2003                             }
{                                                       }
{*******************************************************}

unit uDBCafObraDesmemb;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBCafObraDesmemb = class(TCmDbObject)

  private
    FTipoproporcao: TCmDbField;
    FIdobraresult: TCmDbField;
    FIdcafobra: TCmDbField;
    FIdpessoa: TCmDbField;
    FProporcao: TCmDbField;
    procedure SetIdcafobra(const Value: TCmDbField);
    procedure SetIdobraresult(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetProporcao(const Value: TCmDbField);
    procedure SetTipoproporcao(const Value: TCmDbField);

  public

     Property Tipoproporcao: TCmDbField read FTipoproporcao write SetTipoproporcao;
     Property Proporcao: TCmDbField read FProporcao write SetProporcao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idobraresult: TCmDbField read FIdobraresult write SetIdobraresult;
     Property Idcafobra: TCmDbField read FIdcafobra write SetIdcafobra;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBCafObraDesmemb }

constructor TDBCafObraDesmemb.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CAFOBRADESMEMB';

   fTipoproporcao := CreateCmDbField('TIPOPROPORCAO',ftfloat,True,False,False,False,'');
   fProporcao := CreateCmDbField('PROPORCAO',ftfloat,True,False,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdobraresult := CreateCmDbField('IDOBRARESULT',ftfloat,True,True,False,True,'');
   fIdcafobra := CreateCmDbField('IDCAFOBRA',ftfloat,True,True,False,True,'');
end;

function TDBCafObraDesmemb.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

procedure TDBCafObraDesmemb.SetIdcafobra(const Value: TCmDbField);
begin
  FIdcafobra := Value;
end;

procedure TDBCafObraDesmemb.SetIdobraresult(const Value: TCmDbField);
begin
  FIdobraresult := Value;
end;

procedure TDBCafObraDesmemb.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBCafObraDesmemb.SetProporcao(const Value: TCmDbField);
begin
  FProporcao := Value;
end;

procedure TDBCafObraDesmemb.SetTipoproporcao(const Value: TCmDbField);
begin
  FTipoproporcao := Value;
end;

end.



