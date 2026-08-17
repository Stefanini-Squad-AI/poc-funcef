{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 05/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbSaldo;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbSaldo = class(TCmDbObject)

  private
    FEstMaximo: TCmDbField;
    FCodArtigo: TCmDbField;
    FSaldoQtde: TCmDbField;
    FConMedusacalc: TCmDbField;
    FLocalizacao: TCmDbField;
    FPtoresusado: TCmDbField;
    FPtorescalc: TCmDbField;
    FIdPessoa: TCmDbField;
    FPtoresdatacalc: TCmDbField;
    FEstMinusacalc: TCmDbField;
    FTemrescalc: TCmDbField;
    FConMeddatacalc: TCmDbField;
    FEstMincalc: TCmDbField;
    FCodAlmoxarifado: TCmDbField;
    FEstMindatacalc: TCmDbField;
    FConMedcalc: TCmDbField;
    FTemresdatacalc: TCmDbField;
    FTemresusacalc: TCmDbField;
    FEstMinusado: TCmDbField;
    FDataUltlanc: TCmDbField;
    FPeriodoCompra: TCmDbField;
    FConMedusado: TCmDbField;
    FLoteCompra: TCmDbField;
    FTemresusado: TCmDbField;
    FPtoresusacalc: TCmDbField;
    procedure SetCodAlmoxarifado(const Value: TCmDbField);
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetConMedcalc(const Value: TCmDbField);
    procedure SetConMeddatacalc(const Value: TCmDbField);
    procedure SetConMedusacalc(const Value: TCmDbField);
    procedure SetConMedusado(const Value: TCmDbField);
    procedure SetDataUltlanc(const Value: TCmDbField);
    procedure SetEstMaximo(const Value: TCmDbField);
    procedure SetEstMincalc(const Value: TCmDbField);
    procedure SetEstMindatacalc(const Value: TCmDbField);
    procedure SetEstMinusacalc(const Value: TCmDbField);
    procedure SetEstMinusado(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetLocalizacao(const Value: TCmDbField);
    procedure SetLoteCompra(const Value: TCmDbField);
    procedure SetPeriodoCompra(const Value: TCmDbField);
    procedure SetPtorescalc(const Value: TCmDbField);
    procedure SetPtoresdatacalc(const Value: TCmDbField);
    procedure SetPtoresusacalc(const Value: TCmDbField);
    procedure SetPtoresusado(const Value: TCmDbField);
    procedure SetSaldoQtde(const Value: TCmDbField);
    procedure SetTemrescalc(const Value: TCmDbField);
    procedure SetTemresdatacalc(const Value: TCmDbField);
    procedure SetTemresusacalc(const Value: TCmDbField);
    procedure SetTemresusado(const Value: TCmDbField);

  public

     Property Temresusado      : TCmDbField read FTemresusado write SetTemresusado;
     Property Temresusacalc    : TCmDbField read FTemresusacalc write SetTemresusacalc;
     Property Temresdatacalc   : TCmDbField read FTemresdatacalc write SetTemresdatacalc;
     Property Temrescalc       : TCmDbField read FTemrescalc write SetTemrescalc;
     Property SaldoQtde        : TCmDbField read FSaldoQtde write SetSaldoQtde;
     Property Ptoresusado      : TCmDbField read FPtoresusado write SetPtoresusado;
     Property Ptoresusacalc    : TCmDbField read FPtoresusacalc write SetPtoresusacalc;
     Property Ptoresdatacalc   : TCmDbField read FPtoresdatacalc write SetPtoresdatacalc;
     Property Ptorescalc       : TCmDbField read FPtorescalc write SetPtorescalc;
     Property PeriodoCompra    : TCmDbField read FPeriodoCompra write SetPeriodoCompra;
     Property LoteCompra       : TCmDbField read FLoteCompra write SetLoteCompra;
     Property Localizacao      : TCmDbField read FLocalizacao write SetLocalizacao;
     Property IdPessoa         : TCmDbField read FIdPessoa write SetIdPessoa;
     Property EstMinusado      : TCmDbField read FEstMinusado write SetEstMinusado;
     Property EstMinusacalc    : TCmDbField read FEstMinusacalc write SetEstMinusacalc;
     Property EstMindatacalc   : TCmDbField read FEstMindatacalc write SetEstMindatacalc;
     Property EstMincalc       : TCmDbField read FEstMincalc write SetEstMincalc;
     Property EstMaximo        : TCmDbField read FEstMaximo write SetEstMaximo;
     Property DataUltlanc      : TCmDbField read FDataUltlanc write SetDataUltlanc;
     Property ConMedusado      : TCmDbField read FConMedusado write SetConMedusado;
     Property ConMedusacalc    : TCmDbField read FConMedusacalc write SetConMedusacalc;
     Property ConMeddatacalc   : TCmDbField read FConMeddatacalc write SetConMeddatacalc;
     Property ConMedcalc       : TCmDbField read FConMedcalc write SetConMedcalc;
     Property CodArtigo        : TCmDbField read FCodArtigo write SetCodArtigo;
     Property CodAlmoxarifado  : TCmDbField read FCodAlmoxarifado write SetCodAlmoxarifado;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSaldo }

constructor TDbSaldo.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SALDO';

   fTemresusado := CreateCmDbField('TEMRESUSADO',ftfloat,False,False,False,True,'');
   fTemresusacalc := CreateCmDbField('TEMRESUSACALC',ftString,False,False,False,True,'');
   fTemresdatacalc := CreateCmDbField('TEMRESDATACALC',ftDateTime,False,False,False,True,'');
   fTemrescalc := CreateCmDbField('TEMRESCALC',ftfloat,False,False,False,True,'');
   fSaldoqtde := CreateCmDbField('SALDOQTDE',ftfloat,False,False,False,False,'');
   fPtoresusado := CreateCmDbField('PTORESUSADO',ftfloat,False,False,False,True,'');
   fPtoresusacalc := CreateCmDbField('PTORESUSACALC',ftString,False,False,False,True,'');
   fPtoresdatacalc := CreateCmDbField('PTORESDATACALC',ftString,False,False,False,True,'');
   fPtorescalc := CreateCmDbField('PTORESCALC',ftfloat,False,False,False,True,'');
   fPeriodocompra := CreateCmDbField('PERIODOCOMPRA',ftfloat,False,False,False,True,'');
   fLotecompra := CreateCmDbField('LOTECOMPRA',ftfloat,False,False,False,True,'');
   fLocalizacao := CreateCmDbField('LOCALIZACAO',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fEstminusado := CreateCmDbField('ESTMINUSADO',ftfloat,False,False,False,True,'');
   fEstminusacalc := CreateCmDbField('ESTMINUSACALC',ftString,False,False,False,True,'');
   fEstmindatacalc := CreateCmDbField('ESTMINDATACALC',ftDateTime,False,False,False,True,'');
   fEstmincalc := CreateCmDbField('ESTMINCALC',ftfloat,False,False,False,True,'');
   fEstmaximo := CreateCmDbField('ESTMAXIMO',ftfloat,False,False,False,True,'');
   fDataultlanc := CreateCmDbField('DATAULTLANC',ftDateTime,False,False,False,True,'');
   fConmedusado := CreateCmDbField('CONMEDUSADO',ftfloat,False,False,False,True,'');
   fConmedusacalc := CreateCmDbField('CONMEDUSACALC',ftString,False,False,False,True,'');
   fConmeddatacalc := CreateCmDbField('CONMEDDATACALC',ftDateTime,False,False,False,True,'');
   fConmedcalc := CreateCmDbField('CONMEDCALC',ftfloat,False,False,False,True,'');
   fCodartigo := CreateCmDbField('CODARTIGO',ftString,True,True,False,True,'');
   fCodalmoxarifado := CreateCmDbField('CODALMOXARIFADO',ftfloat,True,True,False,True,'');
end;

function TDbSaldo.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbSaldo.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbSaldo.SetCodAlmoxarifado(const Value: TCmDbField);
begin
  FCodAlmoxarifado := Value;
end;

procedure TDbSaldo.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbSaldo.SetConMedcalc(const Value: TCmDbField);
begin
  FConMedcalc := Value;
end;

procedure TDbSaldo.SetConMeddatacalc(const Value: TCmDbField);
begin
  FConMeddatacalc := Value;
end;

procedure TDbSaldo.SetConMedusacalc(const Value: TCmDbField);
begin
  FConMedusacalc := Value;
end;

procedure TDbSaldo.SetConMedusado(const Value: TCmDbField);
begin
  FConMedusado := Value;
end;

procedure TDbSaldo.SetDataUltlanc(const Value: TCmDbField);
begin
  FDataUltlanc := Value;
end;

procedure TDbSaldo.SetEstMaximo(const Value: TCmDbField);
begin
  FEstMaximo := Value;
end;

procedure TDbSaldo.SetEstMincalc(const Value: TCmDbField);
begin
  FEstMincalc := Value;
end;

procedure TDbSaldo.SetEstMindatacalc(const Value: TCmDbField);
begin
  FEstMindatacalc := Value;
end;

procedure TDbSaldo.SetEstMinusacalc(const Value: TCmDbField);
begin
  FEstMinusacalc := Value;
end;

procedure TDbSaldo.SetEstMinusado(const Value: TCmDbField);
begin
  FEstMinusado := Value;
end;

procedure TDbSaldo.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbSaldo.SetLocalizacao(const Value: TCmDbField);
begin
  FLocalizacao := Value;
end;

procedure TDbSaldo.SetLoteCompra(const Value: TCmDbField);
begin
  FLoteCompra := Value;
end;

procedure TDbSaldo.SetPeriodoCompra(const Value: TCmDbField);
begin
  FPeriodoCompra := Value;
end;

procedure TDbSaldo.SetPtorescalc(const Value: TCmDbField);
begin
  FPtorescalc := Value;
end;

procedure TDbSaldo.SetPtoresdatacalc(const Value: TCmDbField);
begin
  FPtoresdatacalc := Value;
end;

procedure TDbSaldo.SetPtoresusacalc(const Value: TCmDbField);
begin
  FPtoresusacalc := Value;
end;

procedure TDbSaldo.SetPtoresusado(const Value: TCmDbField);
begin
  FPtoresusado := Value;
end;

procedure TDbSaldo.SetSaldoQtde(const Value: TCmDbField);
begin
  FSaldoQtde := Value;
end;

procedure TDbSaldo.SetTemrescalc(const Value: TCmDbField);
begin
  FTemrescalc := Value;
end;

procedure TDbSaldo.SetTemresdatacalc(const Value: TCmDbField);
begin
  FTemresdatacalc := Value;
end;

procedure TDbSaldo.SetTemresusacalc(const Value: TCmDbField);
begin
  FTemresusacalc := Value;
end;

procedure TDbSaldo.SetTemresusado(const Value: TCmDbField);
begin
  FTemresusado := Value;
end;

end.



