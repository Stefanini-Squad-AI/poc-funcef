{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 27/03/2007                             }
{                                                       }
{*******************************************************}

unit uDbCpRotAprMov;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCpRotAprMov = class(TCmDbObject)

  private
    FIdcptipomovim: TCmDbField;
    FIdcprotapurado: TCmDbField;
    FValor: TCmDbField;
    FIdcpconta: TCmDbField;
    FIdcprotaprent: TCmDbField;
    FIdregra: TCmDbField;
    FIdcprotaprmov: TCmDbField;
    FFlgorigem: TCmDbField;
    FFlgtpmovim: TCmDbField;
    FQtdecotas: TCmDbField;
    FFlgentsai: TCmDbField;
    procedure SetIdcpconta(const Value: TCmDbField);
    procedure SetIdcprotaprent(const Value: TCmDbField);
    procedure SetIdcprotaprmov(const Value: TCmDbField);
    procedure SetIdcprotapurado(const Value: TCmDbField);
    procedure SetIdcptipomovim(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetFlgorigem(const Value: TCmDbField);
    procedure SetFlgtpmovim(const Value: TCmDbField);
    procedure SetQtdecotas(const Value: TCmDbField);
    procedure SetFlgentsai(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Idcptipomovim: TCmDbField read FIdcptipomovim write SetIdcptipomovim;
     Property Idcprotapurado: TCmDbField read FIdcprotapurado write SetIdcprotapurado;
     Property Idcprotaprmov: TCmDbField read FIdcprotaprmov write SetIdcprotaprmov;
     Property Idcprotaprent: TCmDbField read FIdcprotaprent write SetIdcprotaprent;
     Property Idcpconta: TCmDbField read FIdcpconta write SetIdcpconta;
     Property Flgorigem: TCmDbField read FFlgorigem write SetFlgorigem;
     Property Flgtpmovim: TCmDbField read FFlgtpmovim write SetFlgtpmovim;
     Property Flgentsai: TCmDbField read FFlgentsai write SetFlgentsai;
     Property Qtdecotas: TCmDbField read FQtdecotas write SetQtdecotas;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCpRotAprMov }

constructor TDbCpRotAprMov.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPROTAPRMOV';

   fValor := CreateCmDbField('VALOR',ftfloat,True,False,False,False,'Valor');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'Id. Regra');
   fIdcptipomovim := CreateCmDbField('IDCPTIPOMOVIM',ftfloat,True,False,False,True,'Id. Tipo Movim.');
   fIdcprotapurado := CreateCmDbField('IDCPROTAPURADO',ftfloat,True,False,False,True,'Id. Apuração');
   fIdcprotaprmov := CreateCmDbField('IDCPROTAPRMOV',ftfloat,True,True,False,True,'Id. Mov. Apuração');
   fIdcprotaprent := CreateCmDbField('IDCPROTAPRENT',ftfloat,False,False,False,True,'Id. Ent. Apuração');
   fIdcpconta := CreateCmDbField('IDCPCONTA',ftfloat,False,False,False,True,'Id. Conta');
   fFlgorigem := CreateCmDbField('FLGORIGEM',ftString,True,False,False,True,'Origem');
   fFlgtpmovim := CreateCmDbField('FLGTPMOVIM',ftString,True,False,False,True,'Tipo de Movimentação');
   fFlgentsai := CreateCmDbField('FLGENTSAI',ftString,False,False,False,True,'Entrada/Saída');
   fQtdecotas := CreateCmDbField('QTDECOTAS',ftfloat,false,false,false,false,'Quantidade de Cotas');
end;

function TDbCpRotAprMov.Insert: Boolean;
begin
   fIdcprotaprmov.AsFloat := GetSequence('CPROTAPRMOV');
   Result := Inherited Insert;
end;


procedure TDbCpRotAprMov.SetFlgentsai(const Value: TCmDbField);
begin
  FFlgentsai := Value;
end;

procedure TDbCpRotAprMov.SetFlgorigem(const Value: TCmDbField);
begin
  FFlgorigem := Value;
end;

procedure TDbCpRotAprMov.SetFlgtpmovim(const Value: TCmDbField);
begin
  FFlgtpmovim := Value;
end;

procedure TDbCpRotAprMov.SetIdcpconta(const Value: TCmDbField);
begin
  FIdcpconta := Value;
end;

procedure TDbCpRotAprMov.SetIdcprotaprent(const Value: TCmDbField);
begin
  FIdcprotaprent := Value;
end;

procedure TDbCpRotAprMov.SetIdcprotaprmov(const Value: TCmDbField);
begin
  FIdcprotaprmov := Value;
end;

procedure TDbCpRotAprMov.SetIdcprotapurado(const Value: TCmDbField);
begin
  FIdcprotapurado := Value;
end;

procedure TDbCpRotAprMov.SetIdcptipomovim(const Value: TCmDbField);
begin
  FIdcptipomovim := Value;
end;

procedure TDbCpRotAprMov.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbCpRotAprMov.SetQtdecotas(const Value: TCmDbField);
begin
  FQtdecotas := Value;
end;

procedure TDbCpRotAprMov.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



