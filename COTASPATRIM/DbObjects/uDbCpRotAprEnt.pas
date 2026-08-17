{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/03/2007                             }
{                                                       }
{*******************************************************}

unit uDbCpRotAprEnt;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCpRotAprEnt = class(TCmDbObject)

  private
    FIdcptpentrada: TCmDbField;
    FIdcprotapurado: TCmDbField;
    FValor: TCmDbField;
    FIdcprotaprent: TCmDbField;
    FFlgorigem: TCmDbField;
    FCodalterador: TCmDbField;
    FRecpag: TCmDbField;
    FIdpessoa: TCmDbField;
    FCodtiprecdes: TCmDbField;
    procedure SetIdcprotaprent(const Value: TCmDbField);
    procedure SetIdcprotapurado(const Value: TCmDbField);
    procedure SetIdcptpentrada(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetFlgorigem(const Value: TCmDbField);
    procedure SetCodalterador(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     //Indica se o sequence será alimentado no insert
     bUsaSequence : boolean;

     Property Idcprotaprent: TCmDbField read FIdcprotaprent write SetIdcprotaprent;
     Property Valor: TCmDbField read FValor write SetValor;
     Property Idcptpentrada: TCmDbField read FIdcptpentrada write SetIdcptpentrada;
     Property Idcprotapurado: TCmDbField read FIdcprotapurado write SetIdcprotapurado;
     Property Flgorigem: TCmDbField read FFlgorigem write SetFlgorigem;
     Property Codalterador: TCmDbField read FCodalterador write SetCodalterador;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCpRotAprEnt }

constructor TDbCpRotAprEnt.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  bUsaSequence := True;
  
  ErrorIfNoRowsAffected := False;

  TableName := 'CPROTAPRENT';

   fValor := CreateCmDbField('VALOR',ftfloat,True,False,False,False,'Valor');
   fIdcptpentrada := CreateCmDbField('IDCPTPENTRADA',ftfloat,False,False,False,True,'Id. Entrada');
   fIdcprotapurado := CreateCmDbField('IDCPROTAPURADO',ftfloat,False,False,False,True,'Id. Apuração');
   fIdcprotaprent := CreateCmDbField('IDCPROTAPRENT',ftfloat,True,True,False,True,'Id. Ent. Apuração');
   fFlgorigem := CreateCmDbField('FLGORIGEM',ftString,True,False,False,True,'Origem');
   fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,False,False,False,True,'Cod. Alterador.');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'Id. Pessoa');
   fRecpag := CreateCmDbField('RECPAG',ftString,False,False,False,True,'Rec/Pag');
   fCodtiprecdes := CreateCmDbField('CODTIPRECDES',ftfloat,False,False,False,True,'Id. Tipo de Desembolso/Recebimento');
end;

function TDbCpRotAprEnt.Insert: Boolean;
begin
  if bUsaSequence then
    fIdcprotaprent.AsFloat := GetSequence('CPROTAPRENT');
  Result := Inherited Insert;
end;

procedure TDbCpRotAprEnt.SetCodalterador(const Value: TCmDbField);
begin
  FCodalterador := Value;
end;

procedure TDbCpRotAprEnt.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbCpRotAprEnt.SetFlgorigem(const Value: TCmDbField);
begin
  FFlgorigem := Value;
end;

procedure TDbCpRotAprEnt.SetIdcprotaprent(const Value: TCmDbField);
begin
  FIdcprotaprent := Value;
end;

procedure TDbCpRotAprEnt.SetIdcprotapurado(const Value: TCmDbField);
begin
  FIdcprotapurado := Value;
end;

procedure TDbCpRotAprEnt.SetIdcptpentrada(const Value: TCmDbField);
begin
  FIdcptpentrada := Value;
end;

procedure TDbCpRotAprEnt.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbCpRotAprEnt.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

procedure TDbCpRotAprEnt.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.
