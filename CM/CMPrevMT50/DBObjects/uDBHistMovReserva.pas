{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 15/06/2007                             }
{                                                       }
{*******************************************************}

unit uDBHistMovReserva;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDBHistMovReserva = class(TCmDbObject)

  private
    FIndicecorrecao: TCmDbField;
    FDataindice: TCmDbField;
    FIdregracalculo: TCmDbField;
    FVlrreal: TCmDbField;
    FSaldoreal: TCmDbField;
    FVlrcotasir: TCmDbField;
    FPlncodigo: TCmDbField;
    FDatamov: TCmDbField;
    FDataalimentacao: TCmDbField;
    FVlrcotas: TCmDbField;
    FIdparticipante: TCmDbField;
    FMesreferencia: TCmDbField;
    FSaldocotas: TCmDbField;
    FNumrecebimento: TCmDbField;
    FIdpessoa: TCmDbField;
    FSaldocorrigido: TCmDbField;
    FIdtiporeserva: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdpessjur: TCmDbField;
    FSaldorealcont: TCmDbField;
    FFlgprocedencia: TCmDbField;
    FValorindice: TCmDbField;
    FIdhistreserva: TCmDbField;
    FIdeventogerador: TCmDbField;
    FIdbeneficio: TCmDbField;
    FIdcontribuicao: TCmDbField;
    FSeqproposta: TCmDbField;
    FVlrcotasirprevia: TCmDbField;
    FFlgentrada: TCmDbField;
    FPercentual: TCmDbField;
    procedure SetDataalimentacao(const Value: TCmDbField);
    procedure SetDataindice(const Value: TCmDbField);
    procedure SetDatamov(const Value: TCmDbField);
    procedure SetFlgentrada(const Value: TCmDbField);
    procedure SetFlgprocedencia(const Value: TCmDbField);
    procedure SetIdbeneficio(const Value: TCmDbField);
    procedure SetIdcontribuicao(const Value: TCmDbField);
    procedure SetIdeventogerador(const Value: TCmDbField);
    procedure SetIdhistreserva(const Value: TCmDbField);
    procedure SetIdparticipante(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdregracalculo(const Value: TCmDbField);
    procedure SetIdtiporeserva(const Value: TCmDbField);
    procedure SetIndicecorrecao(const Value: TCmDbField);
    procedure SetMesreferencia(const Value: TCmDbField);
    procedure SetNumrecebimento(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetSaldocorrigido(const Value: TCmDbField);
    procedure SetSaldocotas(const Value: TCmDbField);
    procedure SetSaldoreal(const Value: TCmDbField);
    procedure SetSaldorealcont(const Value: TCmDbField);
    procedure SetSeqproposta(const Value: TCmDbField);
    procedure SetValorindice(const Value: TCmDbField);
    procedure SetVlrcotas(const Value: TCmDbField);
    procedure SetVlrcotasir(const Value: TCmDbField);
    procedure SetVlrcotasirprevia(const Value: TCmDbField);
    procedure SetVlrreal(const Value: TCmDbField);

  public

     Property Vlrreal: TCmDbField read FVlrreal write SetVlrreal;
     Property Vlrcotasirprevia: TCmDbField read FVlrcotasirprevia write SetVlrcotasirprevia;
     Property Vlrcotasir: TCmDbField read FVlrcotasir write SetVlrcotasir;
     Property Vlrcotas: TCmDbField read FVlrcotas write SetVlrcotas;
     Property Valorindice: TCmDbField read FValorindice write SetValorindice;
     Property Seqproposta: TCmDbField read FSeqproposta write SetSeqproposta;
     Property Saldorealcont: TCmDbField read FSaldorealcont write SetSaldorealcont;
     Property Saldoreal: TCmDbField read FSaldoreal write SetSaldoreal;
     Property Saldocotas: TCmDbField read FSaldocotas write SetSaldocotas;
     Property Saldocorrigido: TCmDbField read FSaldocorrigido write SetSaldocorrigido;
     Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
     Property Percentual: TCmDbField read FPercentual write SetPercentual;
     Property Numrecebimento: TCmDbField read FNumrecebimento write SetNumrecebimento;
     Property Mesreferencia: TCmDbField read FMesreferencia write SetMesreferencia;
     Property Indicecorrecao: TCmDbField read FIndicecorrecao write SetIndicecorrecao;
     Property Idtiporeserva: TCmDbField read FIdtiporeserva write SetIdtiporeserva;
     Property Idregracalculo: TCmDbField read FIdregracalculo write SetIdregracalculo;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Idparticipante: TCmDbField read FIdparticipante write SetIdparticipante;
     Property Idhistreserva: TCmDbField read FIdhistreserva write SetIdhistreserva;
     Property Ideventogerador: TCmDbField read FIdeventogerador write SetIdeventogerador;
     Property Idcontribuicao: TCmDbField read FIdcontribuicao write SetIdcontribuicao;
     Property Idbeneficio: TCmDbField read FIdbeneficio write SetIdbeneficio;
     Property Flgprocedencia: TCmDbField read FFlgprocedencia write SetFlgprocedencia;
     Property Flgentrada: TCmDbField read FFlgentrada write SetFlgentrada;
     Property Datamov: TCmDbField read FDatamov write SetDatamov;
     Property Dataindice: TCmDbField read FDataindice write SetDataindice;
     Property Dataalimentacao: TCmDbField read FDataalimentacao write SetDataalimentacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBHistMovReserva }

constructor TDBHistMovReserva.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HISTMOVRESERVA';

   fVlrreal          := CreateCmDbField('VLRREAL',         ftfloat,   False,False,False,True,'');
   fVlrcotasirprevia := CreateCmDbField('VLRCOTASIRPREVIA',ftfloat,   False,False,False,True,'');
   fVlrcotasir       := CreateCmDbField('VLRCOTASIR',      ftfloat,   False,False,False,True,'');
   fVlrcotas         := CreateCmDbField('VLRCOTAS',        ftfloat,   False,False,False,True,'');
   fValorindice      := CreateCmDbField('VALORINDICE',     ftfloat,   False,False,False,True,'');
   fSeqproposta      := CreateCmDbField('SEQPROPOSTA',     ftfloat,   False,False,False,True,'');
   fSaldorealcont    := CreateCmDbField('SALDOREALCONT',   ftfloat,   False,False,False,True,'');
   fSaldoreal        := CreateCmDbField('SALDOREAL',       ftfloat,   False,False,False,True,'');
   fSaldocotas       := CreateCmDbField('SALDOCOTAS',      ftfloat,   False,False,False,True,'');
   fSaldocorrigido   := CreateCmDbField('SALDOCORRIGIDO',  ftfloat,   False,False,False,True,'');
   fPlncodigo        := CreateCmDbField('PLNCODIGO',       ftfloat,   False,False,False,True,'');
   fPercentual       := CreateCmDbField('PERCENTUAL',      ftfloat,   False,False,False,True,'');
   fNumrecebimento   := CreateCmDbField('NUMRECEBIMENTO',  ftfloat,   False,False,False,True,'');
   fMesreferencia    := CreateCmDbField('MESREFERENCIA',   ftString,  False,False,False,True,'');
   fIndicecorrecao   := CreateCmDbField('INDICECORRECAO',  ftfloat,   False,False,False,True,'');
   fIdtiporeserva    := CreateCmDbField('IDTIPORESERVA',   ftfloat,   True, False,False,True,'');
   fIdregracalculo   := CreateCmDbField('IDREGRACALCULO',  ftfloat,   False,False,False,True,'');
   fIdplanoprev      := CreateCmDbField('IDPLANOPREV',     ftfloat,   True, False,False,True,'');
   fIdpessoa         := CreateCmDbField('IDPESSOA',        ftfloat,   True, False,False,True,'');
   fIdpessjur        := CreateCmDbField('IDPESSJUR',       ftfloat,   True, False,False,True,'');
   fIdparticipante   := CreateCmDbField('IDPARTICIPANTE',  ftfloat,   False,False,False,True,'');
   fIdhistreserva    := CreateCmDbField('IDHISTRESERVA',   ftfloat,   True, True, False,True,'');
   fIdeventogerador  := CreateCmDbField('IDEVENTOGERADOR', ftfloat,   False,False,False,True,'');
   fIdcontribuicao   := CreateCmDbField('IDCONTRIBUICAO',  ftfloat,   False,False,False,True,'');
   fIdbeneficio      := CreateCmDbField('IDBENEFICIO',     ftfloat,   False,False,False,True,'');
   fFlgprocedencia   := CreateCmDbField('FLGPROCEDENCIA',  ftfloat,   False,False,False,True,'');
   fFlgentrada       := CreateCmDbField('FLGENTRADA',      ftfloat,   False,False,False,True,'');
   fDatamov          := CreateCmDbField('DATAMOV',         ftDateTime,False,False,False,True,'');
   fDataindice       := CreateCmDbField('DATAINDICE',      ftDateTime,False,False,False,True,'');
   fDataalimentacao  := CreateCmDbField('DATAALIMENTACAO', ftDateTime,False,False,False,True,'');
end;

function TDBHistMovReserva.Insert: Boolean;
begin

   fIdhistreserva.AsFloat := GetSequence('HISTMOVRESERVA');
   Result := Inherited Insert;

end;


procedure TDBHistMovReserva.SetDataalimentacao(const Value: TCmDbField);
begin
  FDataalimentacao := Value;
end;

procedure TDBHistMovReserva.SetDataindice(const Value: TCmDbField);
begin
  FDataindice := Value;
end;

procedure TDBHistMovReserva.SetDatamov(const Value: TCmDbField);
begin
  FDatamov := Value;
end;

procedure TDBHistMovReserva.SetFlgentrada(const Value: TCmDbField);
begin
  FFlgentrada := Value;
end;

procedure TDBHistMovReserva.SetFlgprocedencia(const Value: TCmDbField);
begin
  FFlgprocedencia := Value;
end;

procedure TDBHistMovReserva.SetIdbeneficio(const Value: TCmDbField);
begin
  FIdbeneficio := Value;
end;

procedure TDBHistMovReserva.SetIdcontribuicao(const Value: TCmDbField);
begin
  FIdcontribuicao := Value;
end;

procedure TDBHistMovReserva.SetIdeventogerador(const Value: TCmDbField);
begin
  FIdeventogerador := Value;
end;

procedure TDBHistMovReserva.SetIdhistreserva(const Value: TCmDbField);
begin
  FIdhistreserva := Value;
end;

procedure TDBHistMovReserva.SetIdparticipante(const Value: TCmDbField);
begin
  FIdparticipante := Value;
end;

procedure TDBHistMovReserva.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDBHistMovReserva.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBHistMovReserva.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDBHistMovReserva.SetIdregracalculo(const Value: TCmDbField);
begin
  FIdregracalculo := Value;
end;

procedure TDBHistMovReserva.SetIdtiporeserva(const Value: TCmDbField);
begin
  FIdtiporeserva := Value;
end;

procedure TDBHistMovReserva.SetIndicecorrecao(const Value: TCmDbField);
begin
  FIndicecorrecao := Value;
end;

procedure TDBHistMovReserva.SetMesreferencia(const Value: TCmDbField);
begin
  FMesreferencia := Value;
end;

procedure TDBHistMovReserva.SetNumrecebimento(const Value: TCmDbField);
begin
  FNumrecebimento := Value;
end;

procedure TDBHistMovReserva.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDBHistMovReserva.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDBHistMovReserva.SetSaldocorrigido(const Value: TCmDbField);
begin
  FSaldocorrigido := Value;
end;

procedure TDBHistMovReserva.SetSaldocotas(const Value: TCmDbField);
begin
  FSaldocotas := Value;
end;

procedure TDBHistMovReserva.SetSaldoreal(const Value: TCmDbField);
begin
  FSaldoreal := Value;
end;

procedure TDBHistMovReserva.SetSaldorealcont(const Value: TCmDbField);
begin
  FSaldorealcont := Value;
end;

procedure TDBHistMovReserva.SetSeqproposta(const Value: TCmDbField);
begin
  FSeqproposta := Value;
end;

procedure TDBHistMovReserva.SetValorindice(const Value: TCmDbField);
begin
  FValorindice := Value;
end;

procedure TDBHistMovReserva.SetVlrcotas(const Value: TCmDbField);
begin
  FVlrcotas := Value;
end;

procedure TDBHistMovReserva.SetVlrcotasir(const Value: TCmDbField);
begin
  FVlrcotasir := Value;
end;

procedure TDBHistMovReserva.SetVlrcotasirprevia(const Value: TCmDbField);
begin
  FVlrcotasirprevia := Value;
end;

procedure TDBHistMovReserva.SetVlrreal(const Value: TCmDbField);
begin
  FVlrreal := Value;
end;

end.



