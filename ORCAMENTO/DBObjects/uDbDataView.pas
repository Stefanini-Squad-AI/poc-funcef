{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: 22/04/2002                             }
{                                                       }
{*******************************************************}
Unit uDbDataView;

Interface
Uses
  uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDataView = class(TCmDbObject)

  Private

    FTemplate         : TCmDbField;
    FOrigemCmdv       : TCmDbField;
    FName             : TCmDbField;
    FIddataview       : TCmDbField;
    FDescription      : TCmDbField;
    FClassename       : TCmDbField;
    FClassdescription : TCmDbField;

    Procedure SetTemplate( Const Value : TCmDbField );
    Procedure SetOrigemcmdv( Const Value : TCmDbField );
    Procedure SetName( Const Value : TCmDbField );
    Procedure SetIddataview( Const Value : TCmDbField );
    Procedure SetDescription( Const Value : TCmDbField );
    Procedure SetClassename( Const Value : TCmDbField );
    Procedure SetClassdescription( Const Value : TCmDbField );

  Public

    Property Template         : TCmDbField Read FTemplate         Write SetTemplate;
    Property Origemcmdv       : TCmDbField Read FOrigemCmdv       Write SetOrigemcmdv;
    Property Name             : TCmDbField Read FName             Write SetName;
    Property Iddataview       : TCmDbField Read FIddataview       Write SetIddataview;
    Property Description      : TCmDbField Read FDescription      Write SetDescription;
    Property Classename       : TCmDbField Read FClassename       Write SetClassename;
    Property Classdescription : TCmDbField Read FClassdescription Write SetClassdescription;

    Constructor Create( Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

Implementation

{ TDbDataView }

Constructor TDbDataView.Create( Aowner: TCmCustomCdbObject);
Begin
  Inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DATAVIEW';

  FIddataview       := CreateCmDbField( 'IDDATAVIEW',       ftfloat,  True,  True,  False, False, '' );
  FOrigemCmdv       := CreateCmDbField( 'ORIGEMCMDV',       ftfloat,  True,  True,  False, False, '' );
  FTemplate         := CreateCmDbField( 'TEMPLATE',         ftBlob,   False, False, False, False, '' );
  FName             := CreateCmDbField( 'NAME',             ftString, True,  False, False, False, '' );
  FDescription      := CreateCmDbField( 'DESCRIPTION',      ftString, False, False, False, True,  '' );
  FClassename       := CreateCmDbField( 'CLASSNAME',        ftString, False, False, False, True,  '' );
  FClassdescription := CreateCmDbField( 'CLASSDESCRIPTION', ftString, False, False, False, True,  '' );
End;
//************************************************
function TDbDataView.Insert: Boolean;
Begin

   Result := Inherited Insert;
End;
//************************************************
function TDbDataView.LoadFromDB: Boolean;
Begin

   Result := Inherited LoadFromDB;
End;
//************************************************
Procedure TDbDataView.SetClassdescription(const Value: TCmDbField);
Begin

  FClassdescription := Value;
End;
//************************************************
Procedure TDbDataView.SetClassename(const Value: TCmDbField);
Begin

  FClassename := Value;
End;
//************************************************
Procedure TDbDataView.SetDescription(const Value: TCmDbField);
Begin

  FDescription := Value;
End;
//************************************************
Procedure TDbDataView.SetIddataview(const Value: TCmDbField);
Begin

  FIddataview := Value;
End;
//************************************************
Procedure TDbDataView.SetName(const Value: TCmDbField);
Begin

  FName := Value;
End;
//************************************************
Procedure TDbDataView.SetOrigemcmdv(const Value: TCmDbField);
Begin

  FOrigemCmdv := Value;
End;
//************************************************
Procedure TDbDataView.SetTemplate(const Value: TCmDbField);
Begin

  FTemplate := Value;
End;
//************************************************
End.
