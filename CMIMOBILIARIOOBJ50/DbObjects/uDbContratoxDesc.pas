{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/08/2004                             }
{                                                       }
{*******************************************************}

unit uDbContratoxDesc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContratoxDesc = class(TCmDbObject)

  private
    FMoecodigo: TCmDbField;
    FCodalterador: TCmDbField;
    FDatainicio: TCmDbField;
    FIdcontratoxdesc: TCmDbField;
    FDatafim: TCmDbField;
    FVlrdesconto: TCmDbField;
    FPerdesconto: TCmDbField;
    FIdcontratoimovel: TCmDbField;

    FObservacao: TCmDbField; // Daniel - 24079

    procedure SetCodalterador(const Value: TCmDbField);
    procedure SetDatafim(const Value: TCmDbField);
    procedure SetDatainicio(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdcontratoxdesc(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetPerdesconto(const Value: TCmDbField);
    procedure SetVlrdesconto(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);

  public

     Property Vlrdesconto: TCmDbField read FVlrdesconto write SetVlrdesconto;
     Property Perdesconto: TCmDbField read FPerdesconto write SetPerdesconto;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idcontratoxdesc: TCmDbField read FIdcontratoxdesc write SetIdcontratoxdesc;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Datainicio: TCmDbField read FDatainicio write SetDatainicio;
     Property Datafim: TCmDbField read FDatafim write SetDatafim;
     Property Codalterador: TCmDbField read FCodalterador write SetCodalterador;
     property Observacao: TCmDbField read FObservacao write SetObservacao; // Daniel - 24079

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContratoxDesc }

constructor TDbContratoxDesc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTRATOXDESC';

   fVlrdesconto := CreateCmDbField('VLRDESCONTO',ftfloat,False,False,False,True,'Valor do Desconto');
   fPerdesconto := CreateCmDbField('PERDESCONTO',ftfloat,False,False,False,True,'Percentual de Desconto');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,False,False,False,True,'Moeda');
   fIdcontratoxdesc := CreateCmDbField('IDCONTRATOXDESC',ftfloat,True,True,False,True,'Id. Contrato x Desconto');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,False,False,False,True,'Id. Contrato');
   fDatainicio := CreateCmDbField('DATAINICIO',ftDateTime,False,False,False,True,'Data Inicial');
   fDatafim := CreateCmDbField('DATAFIM',ftDateTime,False,False,False,True,'');
   fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,False,False,False,True,'');

   // Daniel - 24079
   FObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,False,'Observação para Descontos Programados');
end;

function TDbContratoxDesc.Insert: Boolean;
begin

   fIdcontratoxdesc.AsFloat := GetSequence('CONTRATOXDESC');
   Result := Inherited Insert;

end;


procedure TDbContratoxDesc.SetCodalterador(const Value: TCmDbField);
begin
  FCodalterador := Value;
end;

procedure TDbContratoxDesc.SetDatafim(const Value: TCmDbField);
begin
  FDatafim := Value;
end;

procedure TDbContratoxDesc.SetDatainicio(const Value: TCmDbField);
begin
  FDatainicio := Value;
end;

procedure TDbContratoxDesc.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbContratoxDesc.SetIdcontratoxdesc(const Value: TCmDbField);
begin
  FIdcontratoxdesc := Value;
end;

procedure TDbContratoxDesc.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDbContratoxDesc.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbContratoxDesc.SetPerdesconto(const Value: TCmDbField);
begin
  FPerdesconto := Value;
end;

procedure TDbContratoxDesc.SetVlrdesconto(const Value: TCmDbField);
begin
  FVlrdesconto := Value;
end;

end.



