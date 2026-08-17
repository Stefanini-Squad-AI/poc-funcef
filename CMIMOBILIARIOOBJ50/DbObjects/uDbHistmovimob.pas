{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 11/12/2006                             }
{                                                       }
{*******************************************************}

unit uDbHistmovimob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHistmovimob = class(TCmDbObject)

  private
    FIdhistmovimob: TCmDbField;
    FHmidatamov: TCmDbField;
    FIdcondpagimovel: TCmDbField;
    FPlncodigo: TCmDbField;
    FHmivalor: TCmDbField;
    FHmidocumento: TCmDbField;
    FIditemcentraliza: TCmDbField;
    FIdtipocustorecimo: TCmDbField;
    FHmitipoevento: TCmDbField;
    FHmiParcela: TCmDbField;
    procedure SetHmidatamov(const Value: TCmDbField);
    procedure SetHmidocumento(const Value: TCmDbField);
    procedure SetHmivalor(const Value: TCmDbField);
    procedure SetIdcondpagimovel(const Value: TCmDbField);
    procedure SetIdhistmovimob(const Value: TCmDbField);
    procedure SetIditemcentraliza(const Value: TCmDbField);
    procedure SetIdtipocustorecimo(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetHmitipoevento(const Value: TCmDbField);
    procedure SetHmiParcela(const Value: TCmDbField);

  public

     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Idtipocustorecimo: TCmDbField read FIdtipocustorecimo write SetIdtipocustorecimo;
     Property Iditemcentraliza: TCmDbField read FIditemcentraliza write SetIditemcentraliza;
     Property Idhistmovimob: TCmDbField read FIdhistmovimob write SetIdhistmovimob;
     Property Idcondpagimovel: TCmDbField read FIdcondpagimovel write SetIdcondpagimovel;
     Property Hmivalor: TCmDbField read FHmivalor write SetHmivalor;
     Property Hmidocumento: TCmDbField read FHmidocumento write SetHmidocumento;
     Property Hmidatamov: TCmDbField read FHmidatamov write SetHmidatamov;
     property Hmitipoevento: TCmDbField read FHmitipoevento write SetHmitipoevento;
     property HmiParcela: TCmDbField read FHmiParcela write SetHmiParcela;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHistmovimob }

constructor TDbHistmovimob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTMOVIMOB';

   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fIdtipocustorecimo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'');
   fIditemcentraliza := CreateCmDbField('IDITEMCENTRALIZA',ftfloat,False,False,False,True,'');
   fIdhistmovimob := CreateCmDbField('IDHISTMOVIMOB',ftfloat,True,True,False,True,'');
   fIdcondpagimovel := CreateCmDbField('IDCONDPAGIMOVEL',ftfloat,False,False,False,True,'');
   fHmivalor := CreateCmDbField('HMIVALOR',ftfloat,False,False,False,False,'');
   fHmidocumento := CreateCmDbField('HMIDOCUMENTO',ftfloat,False,False,False,True,'');
   fHmidatamov := CreateCmDbField('HMIDATAMOV',ftDateTime,False,False,False,True,'');
   FHmitipoevento := CreateCmDbField('HMITIPOEVENTO',ftfloat,False,False,False,False,'');
   fHmiParcela := CreateCmDbField('HMIPARCELA',ftfloat,False,False,False,True,'');
end;

function TDbHistmovimob.Insert: Boolean;
begin

   fIdhistmovimob.AsFloat := GetSequence('HISTMOVIMOB');
   Result := Inherited Insert;

end;


procedure TDbHistmovimob.SetHmidatamov(const Value: TCmDbField);
begin
  FHmidatamov := Value;
end;

procedure TDbHistmovimob.SetHmidocumento(const Value: TCmDbField);
begin
  FHmidocumento := Value;
end;

procedure TDbHistmovimob.SetHmiParcela(const Value: TCmDbField);
begin
  FHmiParcela := Value;
end;

procedure TDbHistmovimob.SetHmitipoevento(const Value: TCmDbField);
begin
  FHmitipoevento := Value;
end;

procedure TDbHistmovimob.SetHmivalor(const Value: TCmDbField);
begin
  FHmivalor := Value;
end;

procedure TDbHistmovimob.SetIdcondpagimovel(const Value: TCmDbField);
begin
  FIdcondpagimovel := Value;
end;

procedure TDbHistmovimob.SetIdhistmovimob(const Value: TCmDbField);
begin
  FIdhistmovimob := Value;
end;

procedure TDbHistmovimob.SetIditemcentraliza(const Value: TCmDbField);
begin
  FIditemcentraliza := Value;
end;

procedure TDbHistmovimob.SetIdtipocustorecimo(const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

procedure TDbHistmovimob.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

end.



