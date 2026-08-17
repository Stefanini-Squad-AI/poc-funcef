{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 24/08/2006                             }
{                                                       }
{*******************************************************}

unit uDbCprtpmovim;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCprtpmovim = class(TCmDbObject)

  private
    FIdcproteiro: TCmDbField;
    FIdcprtpmovim: TCmDbField;
    FIdcptipomovim: TCmDbField;
    FIdregra: TCmDbField;
    FIdcpconta: TCmDbField;
    FFlgorigem: TCmDbField;
    FIdcptpentrada: TCmDbField;
    procedure SetIdcpconta(const Value: TCmDbField);
    procedure SetIdcproteiro(const Value: TCmDbField);
    procedure SetIdcprtpmovim(const Value: TCmDbField);
    procedure SetIdcptipomovim(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetFlgorigem(const Value: TCmDbField);
    procedure SetIdcptpentrada(const Value: TCmDbField);

  public

     Property Idcptipomovim: TCmDbField read FIdcptipomovim write SetIdcptipomovim;
     Property Idcprtpmovim: TCmDbField read FIdcprtpmovim write SetIdcprtpmovim;
     Property Idcproteiro: TCmDbField read FIdcproteiro write SetIdcproteiro;
     Property Idcpconta: TCmDbField read FIdcpconta write SetIdcpconta;
     Property Flgorigem: TCmDbField read FFlgorigem write SetFlgorigem;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Idcptpentrada: TCmDbField read FIdcptpentrada write SetIdcptpentrada;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCprtpmovim }

constructor TDbCprtpmovim.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPRTPMOVIM';

   fIdcptipomovim := CreateCmDbField('IDCPTIPOMOVIM',ftfloat,False,False,False,True,'');
   fIdcprtpmovim := CreateCmDbField('IDCPRTPMOVIM',ftfloat,True,True,False,True,'');
   fIdcproteiro := CreateCmDbField('IDCPROTEIRO',ftfloat,False,False,False,True,'');
   fIdcpconta := CreateCmDbField('IDCPCONTA',ftfloat,False,False,False,True,'');
   fFlgorigem := CreateCmDbField('FLGORIGEM',ftString,True,False,False,True,'');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'');
   fIdcptpentrada := CreateCmDbField('IDCPTPENTRADA',ftfloat,False,False,False,True,'');
end;

function TDbCprtpmovim.Insert: Boolean;
begin

   fIdcprtpmovim.AsFloat := GetSequence('CPRTPMOVIM');
   Result := Inherited Insert;

end;


procedure TDbCprtpmovim.SetFlgorigem(const Value: TCmDbField);
begin
  FFlgorigem := Value;
end;

procedure TDbCprtpmovim.SetIdcpconta(const Value: TCmDbField);
begin
  FIdcpconta := Value;
end;

procedure TDbCprtpmovim.SetIdcproteiro(const Value: TCmDbField);
begin
  FIdcproteiro := Value;
end;

procedure TDbCprtpmovim.SetIdcprtpmovim(const Value: TCmDbField);
begin
  FIdcprtpmovim := Value;
end;

procedure TDbCprtpmovim.SetIdcptipomovim(const Value: TCmDbField);
begin
  FIdcptipomovim := Value;
end;

procedure TDbCprtpmovim.SetIdcptpentrada(const Value: TCmDbField);
begin
  FIdcptpentrada := Value;
end;

procedure TDbCprtpmovim.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

end.



