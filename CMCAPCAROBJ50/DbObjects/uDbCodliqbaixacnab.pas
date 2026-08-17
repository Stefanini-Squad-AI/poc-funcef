{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/05/2006                             }
{                                                       }
{*******************************************************}

unit uDbCodliqbaixacnab;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCodliqbaixacnab = class(TCmDbObject)

  private
    FDesccodliq: TCmDbField;
    FIdcodigoscnab: TCmDbField;
    FIdcodliqbaixacnab: TCmDbField;
    FCodigoliq: TCmDbField;
    FRecpag: TCmDbField;
    FIdmodeloscnab: TCmDbField;
    FCodPortForma: TCmDbField;
    FFloatFormaPag: TCmDbField;
    procedure SetCodigoliq(const Value: TCmDbField);
    procedure SetDesccodliq(const Value: TCmDbField);
    procedure SetIdcodigoscnab(const Value: TCmDbField);
    procedure SetIdcodliqbaixacnab(const Value: TCmDbField);
    procedure SetIdmodeloscnab(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetCodPortForma(const Value: TCmDbField);
    procedure SetFloatFormaPag(const Value: TCmDbField);

  public

     Property Recpag           : TCmDbField read FRecpag write SetRecpag;
     Property Idmodeloscnab    : TCmDbField read FIdmodeloscnab write SetIdmodeloscnab;
     Property Idcodliqbaixacnab: TCmDbField read FIdcodliqbaixacnab write SetIdcodliqbaixacnab;
     Property Idcodigoscnab    : TCmDbField read FIdcodigoscnab write SetIdcodigoscnab;
     Property Desccodliq       : TCmDbField read FDesccodliq write SetDesccodliq;
     Property Codigoliq        : TCmDbField read FCodigoliq write SetCodigoliq;
     Property CodPortForma     : TCmDbField read FCodPortForma write SetCodPortForma;
     Property FloatFormaPag    : TCmDbField read FFloatFormaPag write SetFloatFormaPag;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;                                                        

implementation

{ TDbCodliqbaixacnab }

constructor TDbCodliqbaixacnab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CODLIQBAIXACNAB';

  fRecpag            := CreateCmDbField('RECPAG',ftString,true,true,False,True,'');
  fIdmodeloscnab     := CreateCmDbField('IDMODELOSCNAB',ftfloat,True,true,False,True,'');
  fIdcodliqbaixacnab := CreateCmDbField('IDCODLIQBAIXACNAB',ftfloat,True,true,False,True,'');
  fIdcodigoscnab     := CreateCmDbField('IDCODIGOSCNAB',ftfloat,True,true,False,True,'');
  fDesccodliq        := CreateCmDbField('DESCCODLIQ',ftString,False,False,False,True,'');
  fCodigoliq         := CreateCmDbField('CODIGOLIQ',ftString,False,False,False,True,'');
  fcodPortForma      := CreateCmDbField('CODPORTFORMA',ftfloat,false,false,False,True,'');
  fFloatFormaPag     := CreateCmDbField('FLOATFORMAPAG',ftfloat,false,false,False,True,'');
end;

function TDbCodliqbaixacnab.Insert: Boolean;
begin
   fIdcodliqbaixacnab.AsFloat := GetSequence('IDCODLIQBAIXACNAB');
   Result := Inherited Insert;
end;


procedure TDbCodliqbaixacnab.SetCodigoliq(const Value: TCmDbField);
begin
  FCodigoliq := Value;
end;

procedure TDbCodliqbaixacnab.SetCodPortForma(const Value: TCmDbField);
begin
  FCodPortForma := Value;
end;

procedure TDbCodliqbaixacnab.SetDesccodliq(const Value: TCmDbField);
begin
  FDesccodliq := Value;
end;

procedure TDbCodliqbaixacnab.SetFloatFormaPag(const Value: TCmDbField);
begin
  FFloatFormaPag := Value;
end;

procedure TDbCodliqbaixacnab.SetIdcodigoscnab(const Value: TCmDbField);
begin
  FIdcodigoscnab := Value;
end;

procedure TDbCodliqbaixacnab.SetIdcodliqbaixacnab(const Value: TCmDbField);
begin
  FIdcodliqbaixacnab := Value;
end;

procedure TDbCodliqbaixacnab.SetIdmodeloscnab(const Value: TCmDbField);
begin
  FIdmodeloscnab := Value;
end;

procedure TDbCodliqbaixacnab.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



