{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 13/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbAgregItemOC;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbAgregItemOC = class(TCmDbObject)

  private
    FBaseCalculo: TCmDbField;
    FVlrAgregItem: TCmDbField;
    FAliquota: TCmDbField;
    FIdItemOC: TCmDbField;
    FCodTipoCustAgreg: TCmDbField;
    FIdAgregItemOC: TCmDbField;
    procedure SetAliquota(const Value: TCmDbField);
    procedure SetBaseCalculo(const Value: TCmDbField);
    procedure SetCodTipoCustAgreg(const Value: TCmDbField);
    procedure SetIdAgregItemOC(const Value: TCmDbField);
    procedure SetIdItemOC(const Value: TCmDbField);
    procedure SetVlrAgregItem(const Value: TCmDbField);

  public

     Property VlrAgregItem     : TCmDbField read FVlrAgregItem write SetVlrAgregItem;
     Property IdItemOC         : TCmDbField read FIdItemOC write SetIdItemOC;
     Property IdAgregItemOC    : TCmDbField read FIdAgregItemOC write SetIdAgregItemOC;
     Property CodTipoCustAgreg : TCmDbField read FCodTipoCustAgreg write SetCodTipoCustAgreg;
     Property BaseCalculo      : TCmDbField read FBaseCalculo write SetBaseCalculo;
     Property Aliquota         : TCmDbField read FAliquota write SetAliquota;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAgregItemOC }

constructor TDbAgregItemOC.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AGREGITEMOC';

  fVlragregitem     := CreateCmDbField('VLRAGREGITEM'    ,ftfloat,False,False,False,True,'');
  fIditemoc         := CreateCmDbField('IDITEMOC'        ,ftfloat,False,False,False,True,'');
  fIdagregitemoc    := CreateCmDbField('IDAGREGITEMOC'   ,ftfloat,True,True,False,True,'');
  fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,False,False,False,True,'');
  fBasecalculo      := CreateCmDbField('BASECALCULO'     ,ftfloat,False,False,False,True,'');
  fAliquota         := CreateCmDbField('ALIQUOTA'        ,ftfloat,False,False,False,True,'');
end;

function TDbAgregItemOC.Insert: Boolean;
begin

   fIdagregitemoc.AsFloat := GetSequence('AGREGITEMOC');
   Result := Inherited Insert;

end;

function TDbAgregItemOC.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbAgregItemOC.SetAliquota(const Value: TCmDbField);
begin
  FAliquota := Value;
end;

procedure TDbAgregItemOC.SetBaseCalculo(const Value: TCmDbField);
begin
  FBaseCalculo := Value;
end;

procedure TDbAgregItemOC.SetCodTipoCustAgreg(const Value: TCmDbField);
begin
  FCodTipoCustAgreg := Value;
end;

procedure TDbAgregItemOC.SetIdAgregItemOC(const Value: TCmDbField);
begin
  FIdAgregItemOC := Value;
end;

procedure TDbAgregItemOC.SetIdItemOC(const Value: TCmDbField);
begin
  FIdItemOC := Value;
end;

procedure TDbAgregItemOC.SetVlrAgregItem(const Value: TCmDbField);
begin
  FVlrAgregItem := Value;
end;

end.



