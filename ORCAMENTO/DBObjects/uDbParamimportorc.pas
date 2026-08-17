{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/10/2005                             }
{                                                       }
{*******************************************************}

unit uDbParamimportorc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbParamimportorc = class(TCmDbObject)

  private
    FColoutubro: TCmDbField;
    FColmarco: TCmDbField;
    FColdezembro: TCmDbField;
    FColagosto: TCmDbField;
    FColnovembro: TCmDbField;
    FColjaneiro: TCmDbField;
    FColsetembro: TCmDbField;
    FColmaio: TCmDbField;
    FColfevereiro: TCmDbField;
    FColjunho: TCmDbField;
    FColabril: TCmDbField;
    FColjulho: TCmDbField;
    FColcodconta: TCmDbField;
    FIdParamImportOrc: TcmDbField;
    FIdModulo: TCmDbField;
    FColSaldoInicial: TCmDbField;
    procedure SetColabril(const Value: TCmDbField);
    procedure SetColagosto(const Value: TCmDbField);
    procedure SetColcodconta(const Value: TCmDbField);
    procedure SetColdezembro(const Value: TCmDbField);
    procedure SetColfevereiro(const Value: TCmDbField);
    procedure SetColjaneiro(const Value: TCmDbField);
    procedure SetColjulho(const Value: TCmDbField);
    procedure SetColjunho(const Value: TCmDbField);
    procedure SetColmaio(const Value: TCmDbField);
    procedure SetColmarco(const Value: TCmDbField);
    procedure SetColnovembro(const Value: TCmDbField);
    procedure SetColoutubro(const Value: TCmDbField);
    procedure SetColsetembro(const Value: TCmDbField);
    procedure SetIdParamImportOrc(const Value: TcmDbField);
    procedure SetIdModulo(const Value: TCmDbField);
    procedure SetColSaldoInicial(const Value: TCmDbField);

  public

     Property IdParamImportOrc: TcmDbField read FIdParamImportOrc write SetIdParamImportOrc;
     Property Colsetembro: TCmDbField read FColsetembro write SetColsetembro;
     Property Coloutubro: TCmDbField read FColoutubro write SetColoutubro;
     Property Colnovembro: TCmDbField read FColnovembro write SetColnovembro;
     Property Colmarco: TCmDbField read FColmarco write SetColmarco;
     Property Colmaio: TCmDbField read FColmaio write SetColmaio;
     Property Coljunho: TCmDbField read FColjunho write SetColjunho;
     Property Coljulho: TCmDbField read FColjulho write SetColjulho;
     Property Coljaneiro: TCmDbField read FColjaneiro write SetColjaneiro;
     Property Colfevereiro: TCmDbField read FColfevereiro write SetColfevereiro;
     Property Coldezembro: TCmDbField read FColdezembro write SetColdezembro;
     Property Colcodconta: TCmDbField read FColcodconta write SetColcodconta;
     Property Colagosto: TCmDbField read FColagosto write SetColagosto;
     Property Colabril: TCmDbField read FColabril write SetColabril;

     //amf 10.02.2006 p:21336 - inicio
     property IdModulo: TCmDbField read FIdModulo write SetIdModulo;
     property ColSaldoInicial: TCmDbField read FColSaldoInicial write SetColSaldoInicial;
     //amf 10.02.2006 p:21336 - fim

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamimportorc }

constructor TDbParamimportorc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMIMPORTORC';

   fIdParamImportOrc := CreateCmDbField('IDPARAMIMPORTORC',ftFloat,True,True,False,True,'');
   fColsetembro := CreateCmDbField('COLSETEMBRO',ftString,False,False,False,True,'');
   fColoutubro := CreateCmDbField('COLOUTUBRO',ftString,False,False,False,True,'');
   fColnovembro := CreateCmDbField('COLNOVEMBRO',ftString,False,False,False,True,'');
   fColmarco := CreateCmDbField('COLMARCO',ftString,False,False,False,True,'');
   fColmaio := CreateCmDbField('COLMAIO',ftString,False,False,False,True,'');
   fColjunho := CreateCmDbField('COLJUNHO',ftString,False,False,False,True,'');
   fColjulho := CreateCmDbField('COLJULHO',ftString,False,False,False,True,'');
   fColjaneiro := CreateCmDbField('COLJANEIRO',ftString,False,False,False,True,'');
   fColfevereiro := CreateCmDbField('COLFEVEREIRO',ftString,False,False,False,True,'');
   fColdezembro := CreateCmDbField('COLDEZEMBRO',ftString,False,False,False,True,'');
   fColcodconta := CreateCmDbField('COLCODCONTA',ftString,False,False,False,True,'');
   fColagosto := CreateCmDbField('COLAGOSTO',ftString,False,False,False,True,'');
   fColabril := CreateCmDbField('COLABRIL',ftString,False,False,False,True,'');

   //amf 10.02.2006 p:21336 - inicio
   FIdModulo := CreateCmDbField('IDMODULO',ftFloat,True,False,False,True,'');
   FColSaldoInicial := CreateCmDbField('COLSALDOINICIAL',ftString,False,False,False,True,'');
   //amf 10.02.2006 p:21336 - fim

end;

function TDbParamimportorc.Insert: Boolean;
begin
   FIdParamImportOrc.AsFloat := GetSequence('PARAMIMPORTORC');
   Result := Inherited Insert;
end;


procedure TDbParamimportorc.SetColabril(const Value: TCmDbField);
begin
  FColabril := Value;
end;

procedure TDbParamimportorc.SetColagosto(const Value: TCmDbField);
begin
  FColagosto := Value;
end;

procedure TDbParamimportorc.SetColcodconta(const Value: TCmDbField);
begin
  FColcodconta := Value;
end;

procedure TDbParamimportorc.SetColdezembro(const Value: TCmDbField);
begin
  FColdezembro := Value;
end;

procedure TDbParamimportorc.SetColfevereiro(const Value: TCmDbField);
begin
  FColfevereiro := Value;
end;

procedure TDbParamimportorc.SetColjaneiro(const Value: TCmDbField);
begin
  FColjaneiro := Value;
end;

procedure TDbParamimportorc.SetColjulho(const Value: TCmDbField);
begin
  FColjulho := Value;
end;

procedure TDbParamimportorc.SetColjunho(const Value: TCmDbField);
begin
  FColjunho := Value;
end;

procedure TDbParamimportorc.SetColmaio(const Value: TCmDbField);
begin
  FColmaio := Value;
end;

procedure TDbParamimportorc.SetColmarco(const Value: TCmDbField);
begin
  FColmarco := Value;
end;

procedure TDbParamimportorc.SetColnovembro(const Value: TCmDbField);
begin
  FColnovembro := Value;
end;

procedure TDbParamimportorc.SetColoutubro(const Value: TCmDbField);
begin
  FColoutubro := Value;
end;

procedure TDbParamimportorc.SetColSaldoInicial(const Value: TCmDbField);
begin
  FColSaldoInicial := Value;
end;

procedure TDbParamimportorc.SetColsetembro(const Value: TCmDbField);
begin
  FColsetembro := Value;
end;

procedure TDbParamimportorc.SetIdModulo(const Value: TCmDbField);
begin
  FIdModulo := Value;
end;

procedure TDbParamimportorc.SetIdParamImportOrc(const Value: TcmDbField);
begin
  FIdParamImportOrc := Value;
end;

end.



