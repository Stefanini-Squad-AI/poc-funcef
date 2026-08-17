{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 06/09/2005                             }
{                                                       }
{*******************************************************}

unit uDbContrRateioOrc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContrRateioOrc = class(TCmDbObject)

  private
    FValor: TCmDbField;
    FQtde: TCmDbField;
    FIdContrato: TCmDbField;
    FIdObjeto: TCmDbField;
    FAno: TCmDbField;
    FMes: TCmDbField;
    FIdItem: TCmDbField;
    procedure SetAno(const Value: TCmDbField);
    procedure SetIdContrato(const Value: TCmDbField);
    procedure SetIdItem(const Value: TCmDbField);
    procedure SetIdObjeto(const Value: TCmDbField);
    procedure SetMes(const Value: TCmDbField);
    procedure SetQtde(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
  public

     property IdContrato : TCmDbField read FIdContrato write SetIdContrato;
     property IdObjeto   : TCmDbField read FIdObjeto write SetIdObjeto;
     property IdItem     : TCmDbField read FIdItem write SetIdItem;
     property Ano        : TCmDbField read FAno write SetAno;
     property Mes        : TCmDbField read FMes write SetMes;
     property Valor      : TCmDbField read FValor write SetValor;
     property Qtde       : TCmDbField read FQtde write SetQtde;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContrRateioOrc }

constructor TDbContrRateioOrc.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CM.CONTRATOXORCAMEN';

   fIdContrato     := CreateCmDbField('IDCONTRATO',ftfloat,True,True,False,True,'');
   fIdObjeto       := CreateCmDbField('IDOBJETO'  ,ftfloat,True,True,False,True,'');
   fIdItem         := CreateCmDbField('IDITEM',    ftfloat,True,True,False,True,'');
   fAno            := CreateCmDbField('ANO',       ftfloat,True,True,False,True,'');
   fMes            := CreateCmDbField('MES',       ftfloat,True,True,False,True,'');
   fValor          := CreateCmDbField('VALOR',     ftfloat,False,False,False,False,'');
   fQtde           := CreateCmDbField('QTDE',      ftfloat,False,False,False,False,'');
end;

function TDbContrRateioOrc.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbContrRateioOrc.SetAno(const Value: TCmDbField);
begin
  FAno := Value;
end;

procedure TDbContrRateioOrc.SetIdContrato(const Value: TCmDbField);
begin
  FIdContrato := Value;
end;

procedure TDbContrRateioOrc.SetIdItem(const Value: TCmDbField);
begin
  FIdItem := Value;
end;

procedure TDbContrRateioOrc.SetIdObjeto(const Value: TCmDbField);
begin
  FIdObjeto := Value;
end;

procedure TDbContrRateioOrc.SetMes(const Value: TCmDbField);
begin
  FMes := Value;
end;

procedure TDbContrRateioOrc.SetQtde(const Value: TCmDbField);
begin
  FQtde := Value;
end;

procedure TDbContrRateioOrc.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



