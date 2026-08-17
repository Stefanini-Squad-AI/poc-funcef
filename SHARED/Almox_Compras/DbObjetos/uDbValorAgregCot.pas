{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 29/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbValorAgregCot;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbValorAgregCot = class(TCmDbObject)

  private
    FValor: TCmDbField;
    FCodTipoCustAgreg: TCmDbField;
    FCodProcesso: TCmDbField;
    FProposta: TCmDbField;
    FPercent: TCmDbField;
    FIdProcxArt: TCmDbField;
    FIdForCli: TCmDbField;
    FBaseCalculo: TCmDbField;
    procedure SetBaseCalculo(const Value: TCmDbField);
    procedure SetCodProcesso(const Value: TCmDbField);
    procedure SetCodTipoCustAgreg(const Value: TCmDbField);
    procedure SetIdForCli(const Value: TCmDbField);
    procedure SetIdProcxArt(const Value: TCmDbField);
    procedure SetPercent(const Value: TCmDbField);
    procedure SetProposta(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);

  public

     Property Valor             : TCmDbField read FValor write SetValor;
     Property Proposta          : TCmDbField read FProposta write SetProposta;
     Property Percent           : TCmDbField read FPercent write SetPercent;
     Property IdProcxArt        : TCmDbField read FIdProcxArt write SetIdProcxArt;
     Property IdForCli          : TCmDbField read FIdForCli write SetIdForCli;
     Property CodTipoCustAgreg  : TCmDbField read FCodTipoCustAgreg write SetCodTipoCustAgreg;
     Property CodProcesso       : TCmDbField read FCodProcesso write SetCodProcesso;
     Property BaseCalculo       : TCmDbField read FBaseCalculo write SetBaseCalculo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbValorAgregCot }

constructor TDbValorAgregCot.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'VALORAGREGCOT';

   fValor             := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   fProposta          := CreateCmDbField('PROPOSTA',ftfloat,True,True,False,True,'');
   fPercent           := CreateCmDbField('PERCENT',ftfloat,False,False,False,True,'');
   fIdprocxart        := CreateCmDbField('IDPROCXART',ftfloat,True,True,False,True,'');
   fIdforcli          := CreateCmDbField('IDFORCLI',ftfloat,True,True,False,True,'');
   fCodtipocustagreg  := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,True,True,False,True,'');
   fCodprocesso       := CreateCmDbField('CODPROCESSO',ftfloat,True,True,False,True,'');
   fBasecalculo       := CreateCmDbField('BASECALCULO',ftfloat,False,False,False,True,'');
end;

function TDbValorAgregCot.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbValorAgregCot.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbValorAgregCot.SetBaseCalculo(const Value: TCmDbField);
begin
  FBaseCalculo := Value;
end;

procedure TDbValorAgregCot.SetCodProcesso(const Value: TCmDbField);
begin
  FCodProcesso := Value;
end;

procedure TDbValorAgregCot.SetCodTipoCustAgreg(const Value: TCmDbField);
begin
  FCodTipoCustAgreg := Value;
end;

procedure TDbValorAgregCot.SetIdForCli(const Value: TCmDbField);
begin
  FIdForCli := Value;
end;

procedure TDbValorAgregCot.SetIdProcxArt(const Value: TCmDbField);
begin
  FIdProcxArt := Value;
end;

procedure TDbValorAgregCot.SetPercent(const Value: TCmDbField);
begin
  FPercent := Value;
end;

procedure TDbValorAgregCot.SetProposta(const Value: TCmDbField);
begin
  FProposta := Value;
end;

procedure TDbValorAgregCot.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



