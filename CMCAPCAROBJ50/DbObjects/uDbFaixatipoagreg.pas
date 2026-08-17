{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/07/2003                             }
{                                                       }
{*******************************************************}

unit uDbFaixatipoagreg;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbFaixatipoagreg = class(TCmDbObject)

  private
    FVlrabatvalor: TCmDbField;
    FVlrfinalfaixa: TCmDbField;
    FCodtipocustagreg: TCmDbField;
    FPercbase: TCmDbField;
    FVlrabatcalc: TCmDbField;
    FDatafim: TCmDbField;
    FVlrinicialfaixa: TCmDbField;
    FPerccustagreg: TCmDbField;
    FNumfaixa: TCmDbField;
    FDataini: TCmDbField;
    FVlrfixo: TCmDbField;
    FNumDiasApura: TCmDbField;
    FNumDiasVenc: TCmDbField;
    procedure SetCodtipocustagreg(const Value: TCmDbField);
    procedure SetDatafim(const Value: TCmDbField);
    procedure SetDataini(const Value: TCmDbField);
    procedure SetNumfaixa(const Value: TCmDbField);
    procedure SetPercbase(const Value: TCmDbField);
    procedure SetPerccustagreg(const Value: TCmDbField);
    procedure SetVlrabatcalc(const Value: TCmDbField);
    procedure SetVlrabatvalor(const Value: TCmDbField);
    procedure SetVlrfinalfaixa(const Value: TCmDbField);
    procedure SetVlrfixo(const Value: TCmDbField);
    procedure SetVlrinicialfaixa(const Value: TCmDbField);
    procedure SetNumDiasApura(const Value: TCmDbField);
    procedure SetNumDiasVenc(const Value: TCmDbField);

  public

     Property Vlrinicialfaixa: TCmDbField read FVlrinicialfaixa write SetVlrinicialfaixa;
     Property Vlrfixo: TCmDbField read FVlrfixo write SetVlrfixo;
     Property Vlrfinalfaixa: TCmDbField read FVlrfinalfaixa write SetVlrfinalfaixa;
     Property Vlrabatvalor: TCmDbField read FVlrabatvalor write SetVlrabatvalor;
     Property Vlrabatcalc: TCmDbField read FVlrabatcalc write SetVlrabatcalc;
     Property Perccustagreg: TCmDbField read FPerccustagreg write SetPerccustagreg;
     Property Percbase: TCmDbField read FPercbase write SetPercbase;
     Property Numfaixa: TCmDbField read FNumfaixa write SetNumfaixa;
     Property Dataini: TCmDbField read FDataini write SetDataini;
     Property Datafim: TCmDbField read FDatafim write SetDatafim;
     Property Codtipocustagreg: TCmDbField read FCodtipocustagreg write SetCodtipocustagreg;

     //andre tavares - pendência 21219 - 06/02/2006
     Property NumDiasApura: TCmDbField read FNumDiasApura write SetNumDiasApura;
     //andre tavares - pendência 21219 - 06/02/2006
     Property NumDiasVenc: TCmDbField read FNumDiasVenc write SetNumDiasVenc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbFaixatipoagreg }

constructor TDbFaixatipoagreg.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FAIXATIPOAGREG';

   fVlrinicialfaixa := CreateCmDbField('VLRINICIALFAIXA',ftfloat,False,False,False,True,'');
   fVlrfixo := CreateCmDbField('VLRFIXO',ftfloat,False,False,False,True,'');
   fVlrfinalfaixa := CreateCmDbField('VLRFINALFAIXA',ftfloat,False,False,False,True,'');
   fVlrabatvalor := CreateCmDbField('VLRABATVALOR',ftfloat,False,False,False,True,'');
   fVlrabatcalc := CreateCmDbField('VLRABATCALC',ftfloat,False,False,False,True,'');
   fPerccustagreg := CreateCmDbField('PERCCUSTAGREG',ftfloat,False,False,False,True,'');
   fPercbase := CreateCmDbField('PERCBASE',ftfloat,False,False,False,True,'');
   fNumfaixa := CreateCmDbField('NUMFAIXA',ftfloat,True,True,False,True,'');
   fDataini := CreateCmDbField('DATAINI',ftDateTime,False,False,False,True,'');
   fDatafim := CreateCmDbField('DATAFIM',ftDateTime,False,False,False,True,'');
   fCodtipocustagreg := CreateCmDbField('CODTIPOCUSTAGREG',ftfloat,True,True,False,True,'');

   //andre tavares - pendência 21219 - 06/02/2006
   fNumDiasApura := CreateCmDbField('NUMDIASAPURA',ftInteger,false,false,False,True,'');
   //andre tavares - pendência 21219 - 06/02/2006
   fNumDiasVenc := CreateCmDbField('NUMDIASVENC',ftInteger,false,false,False,True,'');


end;

function TDbFaixatipoagreg.Insert: Boolean;
begin

   fNumfaixa.AsFloat := GetSequence('FAIXATIPOAGREG');
   Result := Inherited Insert;

end;


procedure TDbFaixatipoagreg.SetCodtipocustagreg(const Value: TCmDbField);
begin
  FCodtipocustagreg := Value;
end;

procedure TDbFaixatipoagreg.SetDatafim(const Value: TCmDbField);
begin
  FDatafim := Value;
end;

procedure TDbFaixatipoagreg.SetDataini(const Value: TCmDbField);
begin
  FDataini := Value;
end;

procedure TDbFaixatipoagreg.SetNumDiasApura(const Value: TCmDbField);
begin
  FNumDiasApura := Value;
end;

procedure TDbFaixatipoagreg.SetNumDiasVenc(const Value: TCmDbField);
begin
  FNumDiasVenc := Value;
end;

procedure TDbFaixatipoagreg.SetNumfaixa(const Value: TCmDbField);
begin
  FNumfaixa := Value;
end;

procedure TDbFaixatipoagreg.SetPercbase(const Value: TCmDbField);
begin
  FPercbase := Value;
end;

procedure TDbFaixatipoagreg.SetPerccustagreg(const Value: TCmDbField);
begin
  FPerccustagreg := Value;
end;

procedure TDbFaixatipoagreg.SetVlrabatcalc(const Value: TCmDbField);
begin
  FVlrabatcalc := Value;
end;

procedure TDbFaixatipoagreg.SetVlrabatvalor(const Value: TCmDbField);
begin
  FVlrabatvalor := Value;
end;

procedure TDbFaixatipoagreg.SetVlrfinalfaixa(const Value: TCmDbField);
begin
  FVlrfinalfaixa := Value;
end;

procedure TDbFaixatipoagreg.SetVlrfixo(const Value: TCmDbField);
begin
  FVlrfixo := Value;
end;

procedure TDbFaixatipoagreg.SetVlrinicialfaixa(const Value: TCmDbField);
begin
  FVlrinicialfaixa := Value;
end;

end.



