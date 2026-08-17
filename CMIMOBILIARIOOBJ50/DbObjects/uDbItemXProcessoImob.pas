{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 14/06/2007                             }
{                                                       }
{*******************************************************}

unit uDbItemXProcessoImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbItemXProcessoImob = class(TCmDbObject)

  private

    FIdItemXProcImob   : TCmDbField;
    FIdTipoCustoRecImo : TCmDbField;
    FIdProcessoImob    : TCmDbField;

    procedure SetIdItemXProcImob(const Value: TCmDbField);
    procedure SetIdProcessoImob(const Value: TCmDbField);
    procedure SetIdTipoCustoRecImo(const Value: TCmDbField);

  public

    Property IdTipoCustoRecImo : TCmDbField read FIdTipoCustoRecImo write SetIdTipoCustoRecImo;
    Property IdProcessoImob    : TCmDbField read FIdProcessoImob    write SetIdProcessoImob;
    Property IdItemXProcImob   : TCmDbField read FIdItemXProcImob   write SetIdItemXProcImob;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;

  End;

implementation

{ TDbItemXProcessoImob }

constructor TDbItemXProcessoImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ITEMXPROCESSOIMOB';

  fIdItemXProcImob   := CreateCmDbField('IDITEMXPROCIMOB',ftfloat,True,True,False,True,'ID do Item por Processo');
  fIdProcessoImob    := CreateCmDbField('IDPROCESSOIMOB',ftfloat,False,False,False,True,'ID do Processo');
  fIdTipoCustoRecImo := CreateCmDbField('IDTIPOCUSTORECIMO',ftfloat,False,False,False,True,'ID do tipo de Movimentação');
end;

function TDbItemXProcessoImob.Insert: Boolean;
begin
  fIdItemXProcImob.AsFloat := GetSequence('ITEMXPROCESSOIMOB');
  Result                   := Inherited Insert;
end;


procedure TDbItemXProcessoImob.SetIditemxprocimob(const Value: TCmDbField);
begin
  FIditemxprocimob := Value;
end;

procedure TDbItemXProcessoImob.SetIdprocessoimob(const Value: TCmDbField);
begin
  FIdprocessoimob := Value;
end;

procedure TDbItemXProcessoImob.SetIdtipocustorecimo(const Value: TCmDbField);
begin
  FIdtipocustorecimo := Value;
end;

end.



