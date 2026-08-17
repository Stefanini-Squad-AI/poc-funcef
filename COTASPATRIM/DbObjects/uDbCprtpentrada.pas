{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/08/2006                             }
{                                                       }
{*******************************************************}

unit uDbCprtpentrada;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCprtpentrada = class(TCmDbObject)

  private
    FCodtiprecdes: TCmDbField;
    FRecpag: TCmDbField;
    FIdcptpentrada: TCmDbField;
    FIdcproteiro: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdcprtpentrada: TCmDbField;
    FFlgorigem: TCmDbField;
    FCodalterador: TCmDbField;
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetIdcproteiro(const Value: TCmDbField);
    procedure SetIdcprtpentrada(const Value: TCmDbField);
    procedure SetIdcptpentrada(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    procedure SetFlgorigem(const Value: TCmDbField);
    procedure SetCodalterador(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idcptpentrada: TCmDbField read FIdcptpentrada write SetIdcptpentrada;
     Property Idcprtpentrada: TCmDbField read FIdcprtpentrada write SetIdcprtpentrada;
     Property Idcproteiro: TCmDbField read FIdcproteiro write SetIdcproteiro;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Flgorigem: TCmDbField read FFlgorigem write SetFlgorigem;
     Property Codalterador: TCmDbField read FCodalterador write SetCodalterador;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCprtpentrada }

constructor TDbCprtpentrada.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPRTPENTRADA';

  fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
  fIdcptpentrada := CreateCmDbField('IDCPTPENTRADA',ftfloat,False,False,False,True,'');
  fIdcprtpentrada := CreateCmDbField('IDCPRTPENTRADA',ftfloat,True,True,False,True,'');
  fIdcproteiro := CreateCmDbField('IDCPROTEIRO',ftfloat,False,False,False,True,'');
  fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
  fFlgorigem := CreateCmDbField('FLGORIGEM',ftString,True,False,False,True,'');
  fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,False,False,False,True,'');
end;

function TDbCprtpentrada.Insert: Boolean;
begin
  fIdcprtpentrada.AsFloat := GetSequence('CPRTPENTRADA');
  Result := Inherited Insert;
end;


procedure TDbCprtpentrada.SetCodalterador(const Value: TCmDbField);
begin
  FCodalterador := Value;
end;

procedure TDbCprtpentrada.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbCprtpentrada.SetFlgorigem(const Value: TCmDbField);
begin
  FFlgorigem := Value;
end;

procedure TDbCprtpentrada.SetIdcproteiro(const Value: TCmDbField);
begin
  FIdcproteiro := Value;
end;

procedure TDbCprtpentrada.SetIdcprtpentrada(const Value: TCmDbField);
begin
  FIdcprtpentrada := Value;
end;

procedure TDbCprtpentrada.SetIdcptpentrada(const Value: TCmDbField);
begin
  FIdcptpentrada := Value;
end;

procedure TDbCprtpentrada.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbCprtpentrada.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



