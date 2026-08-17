{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 18/04/2002                             }
{                                                       }
{*******************************************************}
Unit uDbCriterioRatOrc;

Interface

Uses
  uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCriterioRatOrc = class(TCmDbObject)

  Private

    FTiporateio       : TCmDbField;
    FPernumero        : TCmDbField;
    FPerexercicio     : TCmDbField;
    FOrigemcmdv       : TCmDbField;
    FIdpessoa         : TCmDbField;
    FIddataview       : TCmDbField;
    FIdcriterioratorc : TCmDbField;
    FDescricao        : TCmDbField;

    Procedure SeTTiporateio( Const Value : TCmDbField );
    Procedure SeTPernumero( Const Value : TCmDbField );
    Procedure SeTPerexercicio( Const Value : TCmDbField );
    Procedure SeTOrigemcmdv( Const Value : TCmDbField );
    Procedure SeTIdpessoa( Const Value : TCmDbField );
    Procedure SeTIddataview( Const Value : TCmDbField );
    Procedure SeTIdcriterioratorc( Const Value : TCmDbField );
    Procedure SeTDescricao( Const Value : TCmDbField );

  Public

     Property Tiporateio       : TCmDbField Read FTiporateio       Write SeTTiporateio;
     Property Pernumero        : TCmDbField Read FPernumero        Write SeTPernumero;
     Property Perexercicio     : TCmDbField Read FPerexercicio     Write SeTPerexercicio;
     Property Origemcmdv       : TCmDbField Read FOrigemcmdv       Write SeTOrigemcmdv;
     Property Idpessoa         : TCmDbField Read FIdpessoa         Write SeTIdpessoa;
     Property Iddataview       : TCmDbField Read FIddataview       Write SeTIddataview;
     Property Idcriterioratorc : TCmDbField Read FIdcriterioratorc Write SeTIdcriterioratorc;
     Property Descricao        : TCmDbField Read FDescricao        Write SeTDescricao;

     Constructor Create( Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

Implementation

{ TDbCriterioRatOrc }

Constructor TDbCriterioRatOrc.Create( Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CRITERIORATORC';

   fTiporateio       := CreateCmDbField( 'TIPORATEIO',      ftString, False, False, False, True,  '' );
   fPernumero        := CreateCmDbField( 'PERNUMERO',       ftfloat,  False, False, False, True,  '' );
   fPerexercicio     := CreateCmDbField( 'PEREXERCICIO',    ftfloat,  False, False, False, True,  '' );
   fOrigemcmdv       := CreateCmDbField( 'ORIGEMCMDV',      ftfloat,  False, False, False, False, '' );
   fIdpessoa         := CreateCmDbField( 'IDPESSOA',        ftfloat,  False, False, False, True,  '' );
   fIddataview       := CreateCmDbField( 'IDDATAVIEW',      ftfloat,  False, False, False, True,  '' );
   fIdcriterioratorc := CreateCmDbField( 'IDCRITERIORATORC',ftfloat,  True,  True,  False, True,  '' );
   fDescricao        := CreateCmDbField( 'DESCRICAO',       ftString, False, False, False, True,  '' );
end;
//************************************************
function TDbCriterioRatOrc.Insert: Boolean;
begin

  fIdcriterioratorc.AsFloat := GetSequence('IDCRITERIORATORC');
  Result := Inherited Insert;

end;
//************************************************
function TDbCriterioRatOrc.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;
//************************************************
procedure TDbCriterioRatOrc.SeTDescricao(const Value: TCmDbField);
begin

  FDescricao := Value;
end;
//************************************************
procedure TDbCriterioRatOrc.SeTIdcriterioratorc(const Value: TCmDbField);
begin

  FIdcriterioratorc := Value;
end;
//************************************************
procedure TDbCriterioRatOrc.SeTIddataview(const Value: TCmDbField);
begin

  FIddataview := Value;
end;
//************************************************
procedure TDbCriterioRatOrc.SeTIdpessoa(const Value: TCmDbField);
begin

  FIdpessoa := Value;
end;
//************************************************
procedure TDbCriterioRatOrc.SeTOrigemcmdv(const Value: TCmDbField);
begin

  FOrigemcmdv := Value;
end;
//************************************************
procedure TDbCriterioRatOrc.SeTPerexercicio(const Value: TCmDbField);
begin

  FPerexercicio := Value;
end;
//************************************************
procedure TDbCriterioRatOrc.SeTPernumero(const Value: TCmDbField);
begin

  FPernumero := Value;
end;
//************************************************
procedure TDbCriterioRatOrc.SeTTiporateio(const Value: TCmDbField);
begin

  FTiporateio := Value;
end;
//************************************************
end.

