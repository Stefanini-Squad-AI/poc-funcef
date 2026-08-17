{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 13/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbAgregTotOC;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbAgregTotOC = class(TCmDbObject)

  private
    FCodTipoCustAgreg: TCmDbField;
    FNumOC: TCmDbField;
    FAliquota: TCmDbField;
    FIdAgregTotOC: TCmDbField;
    FVlrAgregtot: TCmDbField;
    FBaseCalculo: TCmDbField;
    procedure SetAliquota(const Value: TCmDbField);
    procedure SetBaseCalculo(const Value: TCmDbField);
    procedure SetCodTipoCustAgreg(const Value: TCmDbField);
    procedure SetIdAgregTotOC(const Value: TCmDbField);
    procedure SetNumOC(const Value: TCmDbField);
    procedure SetVlrAgregtot(const Value: TCmDbField);

  public

     Property VlrAgregtot      : TCmDbField read FVlrAgregtot write SetVlrAgregtot;
     Property NumOC            : TCmDbField read FNumOC write SetNumOC;
     Property IdAgregTotOC     : TCmDbField read FIdAgregTotOC write SetIdAgregTotOC;
     Property CodTipoCustAgreg : TCmDbField read FCodTipoCustAgreg write SetCodTipoCustAgreg;
     Property BaseCalculo      : TCmDbField read FBaseCalculo write SetBaseCalculo;
     Property Aliquota         : TCmDbField read FAliquota write SetAliquota;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAgregTotOC }

constructor TDbAgregTotOC.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'AGREGTOTOC';

   fVlragregtot      := CreateCmDbField('VLRAGREGTOT'     ,ftfloat,False,False,False,True,'');
   fNumoc            := CreateCmDbField('NUMOC'           ,ftfloat,False,False,False,True,'');
   fIdagregtotoc     := CreateCmDbField('IDAGREGTOTOC'    ,ftfloat,True,True,False,True,'');
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,False,False,False,True,'');
   fBasecalculo      := CreateCmDbField('BASECALCULO'     ,ftfloat,False,False,False,True,'');
   fAliquota         := CreateCmDbField('ALIQUOTA'        ,ftfloat,False,False,False,True,'');
end;

function TDbAgregTotOC.Insert: Boolean;
begin

   fIdagregtotoc.AsFloat := GetSequence('AGREGTOTOC');
   Result := Inherited Insert;

end;

function TDbAgregTotOC.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbAgregTotOC.SetAliquota(const Value: TCmDbField);
begin
  FAliquota := Value;
end;

procedure TDbAgregTotOC.SetBaseCalculo(const Value: TCmDbField);
begin
  FBaseCalculo := Value;
end;

procedure TDbAgregTotOC.SetCodTipoCustAgreg(const Value: TCmDbField);
begin
  FCodTipoCustAgreg := Value;
end;

procedure TDbAgregTotOC.SetIdAgregTotOC(const Value: TCmDbField);
begin
  FIdAgregTotOC := Value;
end;

procedure TDbAgregTotOC.SetNumOC(const Value: TCmDbField);
begin
  FNumOC := Value;
end;

procedure TDbAgregTotOC.SetVlrAgregtot(const Value: TCmDbField);
begin
  FVlrAgregtot := Value;
end;

end.



