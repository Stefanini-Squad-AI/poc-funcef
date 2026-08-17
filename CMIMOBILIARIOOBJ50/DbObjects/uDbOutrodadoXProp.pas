{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbOutrodadoXProp;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbOutrodadoXProp = class(TCmDbObject)

  private
    FIdoutrodado: TCmDbField;
    FIdproposta: TCmDbField;
    FOdpvalor: TCmDbField;
    procedure SetIdoutrodado(const Value: TCmDbField);
    procedure SetIdproposta(const Value: TCmDbField);
    procedure SetOdpvalor(const Value: TCmDbField);

  public

     Property Odpvalor: TCmDbField read FOdpvalor write SetOdpvalor;
     Property Idproposta: TCmDbField read FIdproposta write SetIdproposta;
     Property Idoutrodado: TCmDbField read FIdoutrodado write SetIdoutrodado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbOutrodadoXProp }

constructor TDbOutrodadoXProp.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OUTRODADOXPROP';

   fOdpvalor := CreateCmDbField('ODPVALOR',ftString,True,False,False,True,'Valor para "outro dado"');
   fIdproposta := CreateCmDbField('IDPROPOSTA',ftfloat,True,True,False,True,'Proposta');
   fIdoutrodado := CreateCmDbField('IDOUTRODADO',ftfloat,True,True,False,True,'Outro Dado');
end;

function TDbOutrodadoXProp.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbOutrodadoXProp.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbOutrodadoXProp.SetIdoutrodado(const Value: TCmDbField);
begin
  FIdoutrodado := Value;
end;

procedure TDbOutrodadoXProp.SetIdproposta(const Value: TCmDbField);
begin
  FIdproposta := Value;
end;

procedure TDbOutrodadoXProp.SetOdpvalor(const Value: TCmDbField);
begin
  FOdpvalor := Value;
end;

end.



