{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 19/06/2002                             }
{                                                       }
{*******************************************************}
Unit uDbReports;

Interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbReports = class(TCmDbObject)

  Private

    FTemplate          : TCmDbField;
    FPpreport          : TCmDbField;
    FOrigemcmgr        : TCmDbField;
    FOrigemcmdv        : TCmDbField;
    FOrigemcm          : TCmDbField;
    FName              : TCmDbField;
    FIdreports         : TCmDbField;
    FIdmodulo          : TCmDbField;
    FIdgruporelatorio  : TCmDbField;
    FIddataview        : TCmDbField;
    FFormparamrel      : TCmDbField;
    FFormeventos       : TCmDbField;
    FFlgtipo           : TCmDbField;
    FFlgfiltromanual   : TCmDbField;
    FFlgexibenopreview : TCmDbField;
    FFlgauditoriafront : TCmDbField;
    FDescription       : TCmDbField;

    Procedure SetTemplate          ( Const Value : TCMDbField );
    Procedure SetPpreport          ( Const Value : TCMDbField );
    Procedure SetOrigemcmgr        ( Const Value : TCMDbField );
    Procedure SetOrigemcmdv        ( Const Value : TCMDbField );
    Procedure SetOrigemcm          ( Const Value : TCMDbField );
    Procedure SetName              ( Const Value : TCMDbField );
    Procedure SetIdreports         ( Const Value : TCMDbField );
    Procedure SetIdmodulo          ( Const Value : TCMDbField );
    Procedure SetIdgruporelatorio  ( Const Value : TCMDbField );
    Procedure SetIddataview        ( Const Value : TCMDbField );
    Procedure SetFormparamrel      ( Const Value : TCMDbField );
    Procedure SetFormeventos       ( Const Value : TCMDbField );
    Procedure SetFlgtipo           ( Const Value : TCMDbField );
    Procedure SetFlgfiltromanual   ( Const Value : TCMDbField );
    Procedure SetFlgexibenopreview ( Const Value : TCMDbField );
    Procedure SetFlgauditoriafront ( Const Value : TCMDbField );
    Procedure SetDescription       ( Const Value : TCMDbField );

  Public

    Property Template          : TCmDbField Read FTemplate          Write SetTemplate;
    Property Ppreport          : TCmDbField Read FPpreport          Write SetPpreport;
    Property Origemcmgr        : TCmDbField Read FOrigemcmgr        Write SetOrigemcmgr;
    Property Origemcmdv        : TCmDbField Read FOrigemcmdv        Write SetOrigemcmdv;
    Property Origemcm          : TCmDbField Read FOrigemcm          Write SetOrigemcm;
    Property Name              : TCmDbField Read FName              Write SetName;
    Property Idreports         : TCmDbField Read FIdreports         Write SetIdreports;
    Property Idmodulo          : TCmDbField Read FIdmodulo          Write SetIdmodulo;
    Property Idgruporelatorio  : TCmDbField Read FIdgruporelatorio  Write SetIdgruporelatorio;
    Property Iddataview        : TCmDbField Read FIddataview        Write SetIddataview;
    Property Formparamrel      : TCmDbField Read FFormparamrel      Write SetFormparamrel;
    Property Formeventos       : TCmDbField Read FFormeventos       Write SetFormeventos;
    Property Flgtipo           : TCmDbField Read FFlgtipo           Write SetFlgtipo;
    Property Flgfiltromanual   : TCmDbField Read FFlgfiltromanual   Write SetFlgfiltromanual;
    Property Flgexibenopreview : TCmDbField Read FFlgexibenopreview Write SetFlgexibenopreview;
    Property Flgauditoriafront : TCmDbField Read FFlgauditoriafront Write SetFlgauditoriafront;
    Property Description       : TCmDbField Read FDescription       Write SetDescription;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbReports }

constructor TDbReports.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REPORTS';

   fTemplate          := CreateCmDbField( 'TEMPLATE',          ftBlob,   False, False, False, True, '' );
   fPpreport          := CreateCmDbField( 'PPREPORT',          ftString, False, False, False, True, '' );
   fOrigemcmgr        := CreateCmDbField( 'ORIGEMCMGR',        ftfloat,  False, False, False, True, '' );
   fOrigemcmdv        := CreateCmDbField( 'ORIGEMCMDV',        ftfloat,  False, False, False, True, '' );
   fOrigemcm          := CreateCmDbField( 'ORIGEMCM',          ftfloat,  False,  True,  False, False, '');
   fName              := CreateCmDbField( 'NAME',              ftString, True,  False, False, True, '' );
   fIdreports         := CreateCmDbField( 'IDREPORTS',         ftfloat,  True,  True,  False, True, '' );
   fIdmodulo          := CreateCmDbField( 'IDMODULO',          ftfloat,  False, False, False, True, '' );
   fIdgruporelatorio  := CreateCmDbField( 'IDGRUPORELATORIO',  ftfloat,  False, False, False, True, '' );
   fIddataview        := CreateCmDbField( 'IDDATAVIEW',        ftfloat,  False, False, False, True, '' );
   fFormparamrel      := CreateCmDbField( 'FORMPARAMREL',      ftString, False, False, False, True, '' );
   fFormeventos       := CreateCmDbField( 'FORMEVENTOS',       ftString, False, False, False, True, '' );
   fFlgtipo           := CreateCmDbField( 'FLGTIPO',           ftString, False, False, False, True, '' );
   fFlgfiltromanual   := CreateCmDbField( 'FLGFILTROMANUAL',   ftString, False, False, False, True, '' );
   fFlgexibenopreview := CreateCmDbField( 'FLGEXIBENOPREVIEW', ftString, False, False, False, True, '' );
   fFlgauditoriafront := CreateCmDbField( 'FLGAUDITORIAFRONT', ftString, False, False, False, True, '' );
   fDescription       := CreateCmDbField( 'DESCRIPTION',       ftString, False, False, False, True, '' );
end;

function TDbReports.Insert: Boolean;
begin

  If ( fIdreports.AsFloat < 1 ) Then Begin

    fIdreports.AsFloat := GetSequence('REPORTS');
  End;
  Result := Inherited Insert;

end;
//************************************************
procedure TDbReports.SetDescription( const Value: TCMDbField );
begin

  FDescription := Value;
end;
//************************************************
procedure TDbReports.SetFlgauditoriafront( const Value: TCMDbField );
begin

  FFlgauditoriafront := Value;
end;
//************************************************
procedure TDbReports.SetFlgexibenopreview( const Value: TCMDbField );
begin

  FFlgexibenopreview := Value;
end;
//************************************************
procedure TDbReports.SetFlgfiltromanual( const Value: TCMDbField );
begin

  FFlgfiltromanual := Value;
end;
//************************************************
procedure TDbReports.SetFlgtipo( const Value: TCMDbField );
begin

  FFlgtipo := Value;
end;
//************************************************
procedure TDbReports.SetFormeventos( const Value: TCMDbField );
begin

  FFormeventos := Value;
end;
//************************************************
procedure TDbReports.SetFormparamrel( const Value: TCMDbField );
begin

  FFormparamrel := Value;
end;
//************************************************
procedure TDbReports.SetIddataview( const Value: TCMDbField );
begin

  FIddataview := Value;
end;
//************************************************
procedure TDbReports.SetIdgruporelatorio( const Value: TCMDbField );
begin

  FIdgruporelatorio := Value;
end;
//************************************************
procedure TDbReports.SetIdmodulo( const Value: TCMDbField );
begin

  FIdmodulo := Value;
end;
//************************************************
procedure TDbReports.SetIdreports( const Value: TCMDbField );
begin

  FIdreports := Value;
end;
//************************************************
procedure TDbReports.SetName( const Value: TCMDbField );
begin

  FName := Value;
end;
//************************************************
procedure TDbReports.SetOrigemcm( const Value: TCMDbField );
begin

  FOrigemcm := Value;
end;
//************************************************
procedure TDbReports.SetOrigemcmdv( const Value: TCMDbField );
begin

  FOrigemcmdv := Value;
end;
//************************************************
procedure TDbReports.SetOrigemcmgr( const Value: TCMDbField );
begin

  FOrigemcmgr := Value;
end;
//************************************************
procedure TDbReports.SetPpreport( const Value: TCMDbField );
begin

  FPpreport := Value;
end;
//************************************************
procedure TDbReports.SetTemplate( const Value: TCMDbField );
begin

  FTemplate := Value;
end;
//************************************************
end.

