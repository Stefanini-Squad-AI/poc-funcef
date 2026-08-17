unit UCtrlHistMovReserva;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDBContribuicao, uDBHistMovReserva, uFuncoesPrevMT50;

Type

  TCtrlHistMovReserva = class(TCmControlObject)
  private
    FCdsHistMovReserva: TCMClientDataSet;
    FDbHistMovReserva: TDbHistMovReserva;
    FSeqProposta: Integer;
    FIdContribuicao: Integer;
    FIdTipoReserva: Integer;
    FIdPessoa: Integer;
    FIdHistReserva: Integer;
    FIdPlanoPrev: Integer;
    FDataAlimentacao: String;
    FMesReferencia: String;
    FDataMov: String;
    FInContribuicoes: String;
    FIdParticipante: Integer;
    FNumrecebimento: Integer;
    FIdPessjur: Integer;
    procedure SetCdsHistMovReserva(const Value: TCMClientDataSet);
    procedure SetDataAlimentacao(const Value: String);
    procedure SetDataMov(const Value: String);
    procedure SetDbHistMovReserva(const Value: TDbHistMovReserva);
    procedure SetIdContribuicao(const Value: Integer);
    procedure SetIdHistReserva(const Value: Integer);
    procedure SetIdPessoa(const Value: Integer);
    procedure SetIdPlanoPrev(const Value: Integer);
    procedure SetIdTipoReserva(const Value: Integer);
    procedure SetMesReferencia(const Value: String);
    procedure SetSeqProposta(const Value: Integer);
    procedure SetInContribuicoes(const Value: String);
    procedure SetIdParticipante(const Value: Integer);
    procedure SetNumrecebimento(const Value: Integer);
    procedure SetIdpessjur(const Value: Integer);

  protected

    procedure DoChangeDataBase; Override;
    procedure AfterInitialize; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbHistMovReserva  : TDbHistMovReserva     read FDbHistMovReserva    write SetDbHistMovReserva;
    property CdsHistMovReserva : TCMClientDataSet      read FCdsHistMovReserva   write SetCdsHistMovReserva;

    Property IdHistReserva     : Integer read FIdHistReserva   write SetIdHistReserva;
    Property IdPlanoPrev       : Integer read FIdPlanoPrev     write SetIdPlanoPrev;
    Property IdTipoReserva     : Integer read FIdTipoReserva   write SetIdTipoReserva;
    Property IdPessoa          : Integer read FIdPessoa        write SetIdPessoa;
    Property SeqProposta       : Integer read FSeqProposta     write SetSeqProposta;
    Property IdContribuicao    : Integer read FIdContribuicao  write SetIdContribuicao;
    Property DataMov           : String  read FDataMov         write SetDataMov;
    Property DataAlimentacao   : String  read FDataAlimentacao write SetDataAlimentacao;
    Property MesReferencia     : String  read FMesReferencia   write SetMesReferencia;
    Property InContribuicoes   : String  read FInContribuicoes write SetInContribuicoes;
    Property IdParticipante    : Integer read FIdParticipante  write SetIdParticipante;
    Property Numrecebimento    : Integer read FNumrecebimento  write SetNumrecebimento;
    Property IdPessjur         : Integer read FIdPessjur       write SetIdpessjur;

    function SelecionaHistMovReserva  : OleVariant;
    function ExisteHistMovReserva     : Boolean;

    function GravaHistMovReserva : Boolean;


  published


end;

implementation

{ TCtrlHistMovReserva }

constructor TCtrlHistMovReserva.Create;
begin
  inherited;
  FDbHistMovReserva     := TDbHistMovReserva.Create(Self);
  FCdsHistMovReserva    := TCMClientDataSet.Create(Nil);

end;

destructor TCtrlHistMovReserva.Destroy;
begin
  FDbHistMovReserva.Free;
  FCdsHistMovReserva.Free;
  inherited;
end;

// --------------------------------------------
//               Propriedades
// --------------------------------------------
procedure TCtrlHistMovReserva.SetDataAlimentacao(const Value: String);
begin
  FDataAlimentacao := Value;
end;

procedure TCtrlHistMovReserva.SetDataMov(const Value: String);
begin
  FDataMov := Value;
end;

procedure TCtrlHistMovReserva.SetIdContribuicao(const Value: Integer);
begin
  FIdContribuicao := Value;
end;

procedure TCtrlHistMovReserva.SetIdHistReserva(const Value: Integer);
begin
  FIdHistReserva := Value;
end;

procedure TCtrlHistMovReserva.SetIdPessoa(const Value: Integer);
begin
  FIdPessoa := Value;
end;

procedure TCtrlHistMovReserva.SetIdPlanoPrev(const Value: Integer);
begin
  FIdPlanoPrev := Value;
end;

procedure TCtrlHistMovReserva.SetIdTipoReserva(const Value: Integer);
begin
  FIdTipoReserva := Value;
end;

procedure TCtrlHistMovReserva.SetMesReferencia(const Value: String);
begin
  FMesReferencia := Value;
end;

procedure TCtrlHistMovReserva.SetSeqProposta(const Value: Integer);
begin
  FSeqProposta := Value;
end;

procedure TCtrlHistMovReserva.SetInContribuicoes(const Value: String);
begin
  FInContribuicoes := Value;
end;

procedure TCtrlHistMovReserva.SetIdParticipante(const Value: Integer);
begin
  FIdParticipante := Value;
end;

procedure TCtrlHistMovReserva.SetNumrecebimento(const Value: Integer);
begin
  FNumrecebimento := Value;
end;

procedure TCtrlHistMovReserva.SetIdpessjur(const Value: Integer);
begin
  FIdPessjur := Value;
end;
// --------------------------------------------

procedure TCtrlHistMovReserva.DoChangeDataBase;
begin
  inherited;
  FDbHistMovReserva.DataBaseName := Self.DataBaseName;
end;


function TCtrlHistMovReserva.GravaHistMovReserva: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarHistMovReserva( CdsHistMovReserva.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsHistMovReserva, DbHistMovReserva, [], [] );

      Msg := DbHistMovReserva.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;


procedure TCtrlHistMovReserva.SetCdsHistMovReserva(const Value: TCMClientDataSet);
begin
  FCdsHistMovReserva := Value;
end;

procedure TCtrlHistMovReserva.SetDbHistMovReserva(const Value: TDbHistMovReserva);
begin
  FDbHistMovReserva := Value;
end;

function TCtrlHistMovReserva.SelecionaHistMovReserva : OleVariant;
Var
  sSql,
  sSql1 : String;
begin
  sSql := 'SELECT '                                                                                  + #13 +
          '   VLRREAL, VLRCOTASIRPREVIA, VLRCOTASIR, VLRCOTAS, VALORINDICE, TRGUSERINCLUSAO, '       + #13 +
          '   TRGDTINCLUSAO, SEQPROPOSTA, SALDOREALCONT, SALDOREAL, SALDOCOTAS, SALDOCORRIGIDO, '    + #13 +
          '   PLNCODIGO, PERCENTUAL, NUMRECEBIMENTO, MESREFERENCIA, INDICECORRECAO, IDTIPORESERVA, ' + #13 +
          '   IDREGRACALCULO, IDPLANOPREV, IDPESSOA, IDPESSJUR, IDPARTICIPANTE, IDHISTRESERVA,  '    + #13 +
          '   IDEVENTOGERADOR, IDCONTRIBUICAO, IDBENEFICIO, FLGPROCEDENCIA, FLGENTRADA, DATAMOV,'    + #13 +
          '   DATAINDICE, DATAALIMENTACAO '                                                          + #13 +
          'FROM HISTMOVRESERVA '                                                                     + #13;
  sSql1 := '';

  If FIdPessjur       >   0 Then sSql1 := sSql1 + ' IDPESSJUR        = '+IntToStr(FIdPessjur)       +' AND';
  If FIdPessoa        >   0 Then sSql1 := sSql1 + ' IDPESSOA         = '+IntToStr(FIdPessoa)        +' AND';
  If FIdParticipante  >   0 Then sSql1 := sSql1 + ' IDPARTICIPANTE   = '+IntToStr(FIdParticipante)  +' AND';
  If FIdPlanoPrev     >   0 Then sSql1 := sSql1 + ' IDPLANOPREV      = '+IntToStr(FIdPlanoPrev)     +' AND';
  If FSeqProposta     >   0 Then sSql1 := sSql1 + ' SEQPROPOSTA      = '+IntToStr(FSeqProposta)     +' AND';
  If FIdHistReserva   >   0 Then sSql1 := sSql1 + ' IDHISTRESERVA    = '+IntToStr(FIdHistReserva)   +' AND';
  If FIdContribuicao  >   0 Then sSql1 := sSql1 + ' IDCONTRIBUICAO   = '+IntToStr(FIdContribuicao)  +' AND';
  If FNumRecebimento  >   0 Then sSql1 := sSql1 + ' NUMRECEBIMENTO   = '+IntToStr(FNumRecebimento)  +' AND';
  If FMesReferencia   <> '' Then sSql1 := sSql1 + ' MESREFERENCIA    = '+QuotedStr(FMesReferencia)  +' AND';
  If FDataAlimentacao <> '' Then sSql1 := sSql1 + ' DATAALIMENTAÇÃO  = '+FDataAlimentacao           +' AND';
  If FDataMov         <> '' Then sSql1 := sSql1 + ' DATAMOV          = '+FDataMov                   +' AND';
  If FInContribuicoes <> '' Then sSql1 := sSql1 + ' IDCONTRIBUICAO   IN ('+FInContribuicoes        +') AND';

  If Trim(sSql1) <> '' Then
  Begin
    sSql := sSql + 'WHERE' + Copy(sSql1, 1, Length(sSql1)-4)
  End;

  Result := GetDataPacket( sSql );
end;


function TCtrlHistMovReserva.ExisteHistMovReserva : Boolean;
Var
  sSql,
  sSql1 : String;
begin
  sSql := 'SELECT '                                                                                  + #13 +
          '   VLRREAL, VLRCOTASIRPREVIA, VLRCOTASIR, VLRCOTAS, VALORINDICE, TRGUSERINCLUSAO, '       + #13 +
          '   TRGDTINCLUSAO, SEQPROPOSTA, SALDOREALCONT, SALDOREAL, SALDOCOTAS, SALDOCORRIGIDO, '    + #13 +
          '   PLNCODIGO, PERCENTUAL, NUMRECEBIMENTO, MESREFERENCIA, INDICECORRECAO, IDTIPORESERVA, ' + #13 +
          '   IDREGRACALCULO, IDPLANOPREV, IDPESSOA, IDPESSJUR, IDPARTICIPANTE, IDHISTRESERVA,  '    + #13 +
          '   IDEVENTOGERADOR, IDCONTRIBUICAO, IDBENEFICIO, FLGPROCEDENCIA, FLGENTRADA, DATAMOV,'    + #13 +
          '   DATAINDICE, DATAALIMENTACAO '                                                          + #13 +
          'FROM HISTMOVRESERVA '                                                                     + #13;
  sSql1 := '';

  If FIdPessjur       >   0 Then sSql1 := sSql1 + ' IDPESSJUR        = '+IntToStr(FIdPessjur)       +' AND';
  If FIdPessoa        >   0 Then sSql1 := sSql1 + ' IDPESSOA         = '+IntToStr(FIdPessoa)        +' AND';
  If FIdParticipante  >   0 Then sSql1 := sSql1 + ' IDPARTICIPANTE   = '+IntToStr(FIdParticipante)  +' AND';
  If FIdPlanoPrev     >   0 Then sSql1 := sSql1 + ' IDPLANOPREV      = '+IntToStr(FIdPlanoPrev)     +' AND';
  If FSeqProposta     >   0 Then sSql1 := sSql1 + ' SEQPROPOSTA      = '+IntToStr(FSeqProposta)     +' AND';
  If FIdHistReserva   >   0 Then sSql1 := sSql1 + ' IDHISTRESERVA    = '+IntToStr(FIdHistReserva)   +' AND';
  If FIdContribuicao  >   0 Then sSql1 := sSql1 + ' IDCONTRIBUICAO   = '+IntToStr(FIdContribuicao)  +' AND';
  If FNumRecebimento  >   0 Then sSql1 := sSql1 + ' NUMRECEBIMENTO   = '+IntToStr(FNumRecebimento)  +' AND';
  If FMesReferencia   <> '' Then sSql1 := sSql1 + ' MESREFERENCIA    = '+QuotedStr(FMesReferencia)  +' AND';
  If FDataAlimentacao <> '' Then sSql1 := sSql1 + ' DATAALIMENTAÇÃO  = '+FDataAlimentacao           +' AND';
  If FDataMov         <> '' Then sSql1 := sSql1 + ' DATAMOV          = '+FDataMov                   +' AND';
  If FInContribuicoes <> '' Then sSql1 := sSql1 + ' IDCONTRIBUICAO   IN ('+FInContribuicoes        +') AND';

  If Trim(sSql1) <> '' Then
  Begin
    sSql := sSql + 'WHERE' + Copy(sSql1, 1, Length(sSql1)-4)
  End;

  FCdsHistMovReserva.Data := GetDataPacket( sSql );

  Result := Not FCdsHistMovReserva.IsEmpty;
end;

procedure TCtrlHistMovReserva.AfterInitialize;
begin
  inherited;
end;

end.

