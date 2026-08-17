{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 30/08/2006                             }
{                                                       }
{*******************************************************}

unit uDbCpdesvio;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCpdesvio = class(TCmDbObject)

  private
    FFlgvalperc: TCmDbField;
    FIdcpdesvio: TCmDbField;
    FValordesvio: TCmDbField;
    FMedialanctos: TCmDbField;
    FIdcptipomovim: TCmDbField;
    FFlgtpverific: TCmDbField;
    procedure SetFlgtpverific(const Value: TCmDbField);
    procedure SetFlgvalperc(const Value: TCmDbField);
    procedure SetIdcpdesvio(const Value: TCmDbField);
    procedure SetIdcptipomovim(const Value: TCmDbField);
    procedure SetMedialanctos(const Value: TCmDbField);
    procedure SetValordesvio(const Value: TCmDbField);

  public

     Property Valordesvio: TCmDbField read FValordesvio write SetValordesvio;
     Property Medialanctos: TCmDbField read FMedialanctos write SetMedialanctos;
     Property Idcptipomovim: TCmDbField read FIdcptipomovim write SetIdcptipomovim;
     Property Idcpdesvio: TCmDbField read FIdcpdesvio write SetIdcpdesvio;
     Property Flgvalperc: TCmDbField read FFlgvalperc write SetFlgvalperc;
     Property Flgtpverific: TCmDbField read FFlgtpverific write SetFlgtpverific;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCpdesvio }

constructor TDbCpdesvio.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPDESVIO';

   fValordesvio := CreateCmDbField('VALORDESVIO',ftfloat,False,False,False,True,'');
   fMedialanctos := CreateCmDbField('MEDIALANCTOS',ftfloat,False,False,False,True,'');
   fIdcptipomovim := CreateCmDbField('IDCPTIPOMOVIM',ftfloat,True,False,False,True,'Tipo de movimento');
   fIdcpdesvio := CreateCmDbField('IDCPDESVIO',ftfloat,True,True,False,True,'');
   fFlgvalperc := CreateCmDbField('FLGVALPERC',ftString,False,False,False,True,'');
   fFlgtpverific := CreateCmDbField('FLGTPVERIFIC',ftString,False,False,False,True,'');
end;

function TDbCpdesvio.Insert: Boolean;
begin
   FIdcpdesvio.AsFloat := GetSequence('CPDESVIO');
   Result := Inherited Insert;

end;


procedure TDbCpdesvio.SetFlgtpverific(const Value: TCmDbField);
begin
  FFlgtpverific := Value;
end;

procedure TDbCpdesvio.SetFlgvalperc(const Value: TCmDbField);
begin
  FFlgvalperc := Value;
end;

procedure TDbCpdesvio.SetIdcpdesvio(const Value: TCmDbField);
begin
  FIdcpdesvio := Value;
end;

procedure TDbCpdesvio.SetIdcptipomovim(const Value: TCmDbField);
begin
  FIdcptipomovim := Value;
end;

procedure TDbCpdesvio.SetMedialanctos(const Value: TCmDbField);
begin
  FMedialanctos := Value;
end;

procedure TDbCpdesvio.SetValordesvio(const Value: TCmDbField);
begin
  FValordesvio := Value;
end;

end.



