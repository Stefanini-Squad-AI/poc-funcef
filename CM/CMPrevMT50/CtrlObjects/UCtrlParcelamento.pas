unit UCtrlParcelamento;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbParcelamento, uFuncoesPrevMT50, uCtrlRegra;

Type

  TCtrlParcelamento = class(TCmControlObject)
  private
    CtrlRegra : TCtrlRegra;
    FcdsAux :TCMClientDataSet;
    FCdsParcelamento: TCMClientDataSet;
    FDbParcelamento: TDbParcelamento;
    FIdParcelamento: Integer;
    FIdPessoa: Integer;
    FSalBaseAtual: String;
    FNumProxParc : Integer;
    FIdPlanoPrev: Integer;
    FIdPessjur: Integer;
    FVlrDividaPart: String;
    FVlrDividaPatro: String;
    FsVlrPrestacao: String;
    FPercentual: String;
    FVlrSdoDevedor: String;
    FIdRegraSalParcela: Integer;
    FSeqProposta: Integer;
    FErro: Boolean;
    FMsgErro: String;
    FParcelasAPagar: Integer;
    FIdRegraSdoDevedor: Integer;
    FNumParcelas: Integer;
    procedure SetCdsParcelamento(const Value: TCMClientDataSet);
    procedure SetDbParcelamento(const Value: TDbParcelamento);
    procedure SetIdParcelamento(const Value: Integer);
    procedure SetIdPessjur(const Value: Integer);
    procedure SetIdPessoa(const Value: Integer);
    procedure SetIdPlanoPrev(const Value: Integer);
    procedure SetPercentual(const Value: String);
    procedure SetSalBaseAtual(const Value: String);
    procedure SetNumProxParc(const Value: Integer);
    procedure SetsVlrPrestacao(const Value: String);
    procedure SetVlrDividaPart(const Value: String);
    procedure SetVlrDividaPatro(const Value: String);
    procedure SetVlrSdoDevedor(const Value: String);
    procedure SetCdsAux(const Value: TCMClientDataSet);
    procedure SetIdRegraSalParcela(const Value: Integer);
    procedure SetSeqProposta(const Value: Integer);
    procedure SetErro(const Value: Boolean);
    procedure SetMsgErro(const Value: String);
    procedure SetParcelasAPagar(const Value: Integer);
    procedure SetIdRegraSdoDevedor(const Value: Integer);
    procedure SetNumParcelas(const Value: Integer);

  protected

    procedure DoChangeDataBase; Override;
    procedure AfterInitialize; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    Property DbParcelamento    : TDbParcelamento   Read FDbParcelamento     Write SetDbParcelamento;
    Property CdsParcelamento   : TCMClientDataSet  Read FCdsParcelamento    Write SetCdsParcelamento;
    Property CdsAux            : TCMClientDataSet  Read FCdsAux             Write SetCdsAux;
    Property IdParcelamento    : Integer           Read FIdParcelamento     Write SetIdParcelamento;
    Property IdPessjur         : Integer           Read FIdPessjur          Write SetIdPessjur;
    Property IdPlanoPrev       : Integer           Read FIdPlanoPrev        Write SetIdPlanoPrev;
    Property IdPessoa          : Integer           Read FIdPessoa           Write SetIdPessoa;
    Property SeqProposta       : Integer           Read FSeqProposta        Write SetSeqProposta;
    Property Percentual        : String            Read FPercentual         Write SetPercentual;
    Property VlrDividaPart     : String            Read FVlrDividaPart      Write SetVlrDividaPart;
    Property VlrDividaPatro    : String            Read FVlrDividaPatro     Write SetVlrDividaPatro;
    Property VlrPrestacao      : String            Read FsVlrPrestacao      Write SetsVlrPrestacao;
    Property VlrSdoDevedor     : String            Read FVlrSdoDevedor      Write SetVlrSdoDevedor;
    Property SalBaseAtual      : String            Read FSalBaseAtual       Write SetSalBaseAtual;
    Property NumProxParc       : Integer           Read FNumProxParc        Write SetNumProxParc;
    Property IdRegraSalParcela : Integer           Read FIdRegraSalParcela  Write SetIdRegraSalParcela;
    Property Erro              : Boolean           Read FErro               Write SetErro;
    Property MsgErro           : String            Read FMsgErro            Write SetMsgErro;
    Property ParcelasAPagar    : Integer           Read FParcelasAPagar     Write SetParcelasAPagar;
    Property IdRegraSdoDevedor : Integer           Read FIdRegraSdoDevedor  Write SetIdRegraSdoDevedor;
    Property NumParcelas       : Integer           Read FNumParcelas        Write SetNumParcelas;

    function SelecionaParcelamento  : OleVariant;
    function ExisteParcelamento     : Boolean;
    function GravaParcelamento      : Boolean;

    function TrazDadosParcela       : Boolean;
    function CalculaSalario         : Double;
    function CalculaSdoDevedor      : Double;
    function VoltaNumParcelasAPagar : String;

  published

end;

implementation

{ TCtrlParcelamento }

procedure TCtrlParcelamento.SetCdsParcelamento(const Value: TCMClientDataSet);
begin
  FCdsParcelamento := Value;
end;

procedure TCtrlParcelamento.SetDbParcelamento(const Value: TDbParcelamento);
begin
  FDbParcelamento := Value;
end;

procedure TCtrlParcelamento.SetIdParcelamento(const Value: Integer);
begin
  FIdParcelamento := Value;
end;

procedure TCtrlParcelamento.SetIdPessjur(const Value: Integer);
begin
  FIdPessjur := Value;
end;

procedure TCtrlParcelamento.SetIdPessoa(const Value: Integer);
begin
  FIdPessoa := Value;
end;

procedure TCtrlParcelamento.SetSeqProposta(const Value: Integer);
begin
  FSeqProposta := Value;
end;

procedure TCtrlParcelamento.SetIdPlanoPrev(const Value: Integer);
begin
  FIdPlanoPrev := Value;
end;

procedure TCtrlParcelamento.SetPercentual(const Value: String);
begin
  FPercentual := Value;
end;

procedure TCtrlParcelamento.SetNumProxParc(const Value: Integer);
begin
  FNumProxParc := Value;
end;

procedure TCtrlParcelamento.SetSalBaseAtual(const Value: String);
begin
  FSalBaseAtual := Value;
end;

procedure TCtrlParcelamento.SetsVlrPrestacao(const Value: String);
begin
  FsVlrPrestacao := Value;
end;

procedure TCtrlParcelamento.SetVlrDividaPart(const Value: String);
begin
  FVlrDividaPart := Value;
end;

procedure TCtrlParcelamento.SetVlrDividaPatro(const Value: String);
begin
  FVlrDividaPatro := Value;
end;

procedure TCtrlParcelamento.SetVlrSdoDevedor(const Value: String);
begin
  FVlrSdoDevedor := Value;
end;

procedure TCtrlParcelamento.SetCdsAux(const Value: TCMClientDataSet);
begin
  FCdsAux := Value;
end;

procedure TCtrlParcelamento.SetIdRegraSalParcela(const Value: Integer);
begin
  FIdRegraSalParcela := Value;
end;

procedure TCtrlParcelamento.SetErro(const Value: Boolean);
begin
  FErro := Value;
end;

procedure TCtrlParcelamento.SetMsgErro(const Value: String);
begin
  FMsgErro := Value;
end;

procedure TCtrlParcelamento.SetParcelasAPagar(const Value: Integer);
begin
  FParcelasAPagar := Value;
end;

procedure TCtrlParcelamento.SetIdRegraSdoDevedor(const Value: Integer);
begin
  FIdRegraSdoDevedor := Value;
end;

procedure TCtrlParcelamento.SetNumParcelas(const Value: Integer);
begin
  FNumParcelas := Value;
end;

constructor TCtrlParcelamento.Create;
begin
  inherited;
  CtrlRegra        := TCtrlRegra.Create;

  FDbParcelamento  := TDbParcelamento.Create(Self);
  FCdsParcelamento := TCMClientDataSet.Create(Nil);
  FCdsAux          := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlParcelamento.Destroy;
begin
  FDbParcelamento.Free;
  FCdsParcelamento.Free;
  FCdsAux.Free;

  FreeAndNil ( CtrlRegra );
  inherited;
end;

procedure TCtrlParcelamento.DoChangeDataBase;
begin
  inherited;
  FDbParcelamento.DataBaseName := Self.DataBaseName;
end;

procedure TCtrlParcelamento.AfterInitialize;
begin
  inherited;
  CtrlRegra.InitializeAs(Self);
end;

function TCtrlParcelamento.GravaParcelamento: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarParcelamento( CdsParcelamento.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsParcelamento, DbParcelamento, [], [] );

      Msg := DbParcelamento.MessageInfo;

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

function TCtrlParcelamento.SelecionaParcelamento : OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaParcelamento( IdParcelamento );
  end else begin
    FDbParcelamento.IdParcelamento.AsInteger := IdParcelamento;
    Result := GetDataPacket( FDbParcelamento.SSqlSelect );
  end;
end;


function TCtrlParcelamento.ExisteParcelamento : Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbParcelamento.IdParcelamento.AsInteger := IdParcelamento;
    CdsParcelamento.Data := GetDataPacket( FDbParcelamento.SSqlSelect );
    Result := Not CdsParcelamento.IsEmpty;
  end;
end;

function TCtrlParcelamento.TrazDadosParcela: Boolean;
Var
  sSql         : String;
begin
   Result := false;

   sSql := 'SELECT '                                                                     + #13 +
           '  PAR.IDPARCELAMENTO, PAR.NUMPARCELAS, PAR.PARCPAGAS, PAR.PARCGERADAS, '     + #13 +
           '  PAR.VLRPRIMPRESTACAO, PAR.PERCENTUAL, PAR.VLRSALBASE, PAR.VLRDIVIDAPART, ' + #13 +
           '  PAR.VLRDIVIDAPATRO, PAR.SDODEVEDOR, PAR.PERCSEGURO, PAR.IDPESSOA, '        + #13 +
           '  PAR.IDPESSJUR, PAR.IDPLANOPREV , PAR.SEQPROPOSTA, '                        + #13 +
           '  PLPAR.IDREGRASDODEVEDOR, PLPAR.IDREGRASALPARCELA '                         + #13 +
           'FROM  '                                                                      + #13 +
           '  PARCELAMENTO PAR, PLANPREV PLP '                                           + #13 +
           'WHERE '                                                                      + #13 +
           '      PAR.IDPESSJUR       = '+IntToStr(IdPessjur)                            + #13 +
           '  AND PAR.IDPLANOPREV     = '+IntToStr(IdPlanoPrev)                          + #13 +
           '  AND PAR.IDPESSOA        = '+IntToStr(IdPessoa)                             + #13 +
           '  AND PAR.SITPARCELAMENTO = 1  '                                             + #13 +
           '  AND PLPAR.IDPLANOPREV   = PAR.IDPLANOPREV '                                + #13 +
           'ORDER BY PAR.DATAINICIO DESC ';
   Try
     FcdsAux.Data := GetDataPacket(sSql);
   Except
     Exit;
   End;

   If Not FcdsAux.IsEmpty Then
   Begin
     IdParcelamento    := FcdsAux.FieldByName('IDPARCELAMENTO').AsInteger;
     Percentual        := OraNumero(FcdsAux.FieldByName('PERCENTUAL').AsString);
     VlrDividaPart     := OraNumero(FcdsAux.FieldByName('VLRDIVIDAPART').AsString);
     VlrDividaPatro    := OraNumero(FcdsAux.FieldByName('VLRDIVIDAPATRO').AsString);
     VlrPrestacao      := OraNumero(FcdsAux.FieldByName('VLRPRIMPRESTACAO').AsString);
     VlrSdoDevedor     := OraNumero(FcdsAux.FieldByName('SDODEVEDOR').AsString);
     NumParcelas       := FcdsAux.FieldByName('NUMPARCELAS').AsInteger;


     SeqProposta       := FcdsAux.fieldbyname('SEQPROPOSTA').AsInteger;
     IdRegraSalParcela := FcdsAux.fieldbyname('IDREGRASALPARCELA').AsInteger;
     ParcelasAPagar    := FcdsAux.fieldbyname('NUMPARCELAS').AsInteger - FcdsAux.fieldbyname('PARCPAGAS').AsInteger;

     // Recalcula Salário Base
     SalBaseAtual      := OraNumero(FloatToStr(CalculaSalario)) ;

     // Recalcula Saldo Devedor
     VlrSdoDevedor     := OraNumero(FloatToStr(CalculaSdoDevedor));

     // Volta Número de Parcelas a Pagar
     NumProxParc       := StrToInt(VoltaNumParcelasAPagar);
   End
   Else
   Begin
     IdParcelamento := 0;
     Percentual     := '0';
     VlrDividaPart  := '0';
     VlrDividaPatro := '0';
     VlrPrestacao   := '0';
     VlrSdoDevedor  := '0';
     SalBaseAtual   := '0';
   end;

   Result := not FcdsAux.IsEmpty;
end;

function TCtrlParcelamento.CalculaSalario: Double;
Var
  rValorRegra  : Double;
  sSQL         : String;
begin
   Result := 0;

   sSQL := 'SELECT                                                            ' + #13 +
           '  DISTINCT PPP.IDPESSOA, PPP.IDPESSJUR, PPP.IDPLANOPREV,          ' + #13 +
           '  PPP.INSCRICAODATA, PPP.INSCRICAOTIPO, ELP.IDSITFUNC,            ' + #13 +
           '  PPP.IDSITPLANOPREV, PPP.IDSITPART, FIS.DATANASC,                ' + #13 +
           '  FIS.SEXO, FIS.DATAMORTE, STP.FLGINTERNO, ELP.SALTOTAL,          ' + #13 +
           '  ELP.DATAADMISSAO, ELP.TEMPOSERVANTERIOR, ELP.TEMPONAOCREDITADO, ' + #13 +
           '  ELP.TEMPOSERVTOTAL, ELP.DATADEMISSAO, ELP.TEMPOSERVTOTMES,      ' + #13 +
           '  ELP.TEMPOSERVTOTDIA, ELP.FLGDIRETOR,                            ' + #13 +
           ' '+QuotedStr(DateToStr(date))+' AS DATAREF ROWNUM NUMLINHA        ' + #13 +
           ' FROM  '                                                            + #13 +
           '   PESSOAFISICA FIS, ELEGPATRO ELP, PARTPREVPLAN PPP, SITPART STP ' + #13 +
           ' WHERE '                                                            + #13 +
           '      PPP.IDPESSJUR   = '+IntToStr(IdPessJur)                       + #13 +
           '  AND PPP.IDPLANOPREV = '+IntToStr(IdPlanoPrev)                     + #13 +
           '  AND PPP.IDPESSOA    = '+IntToStr(IdPessoa)                        + #13 +
           '  AND PPP.SEQPROPOSTA = '+IntToStr(SeqProposta)                     + #13 +
           '  AND ELP.IDPESSJUR   = PPP.IDPESSJUR     '                         + #13 +
           '  AND ELP.IDPESSOA    = PPP.IDPESSOA      '                         + #13 +
           '  AND FIS.IDPESSOA    = ELP.IDPESSOA      '                         + #13 +
           '  AND STP.IDSITPART   = PPP.IDSITPART     ';

   CtrlRegra.CopiaData(GetDataPacket(sSql));
   CtrlRegra.GravaCalculo := False;
   CtrlRegra.ReloadRule   := False;

   CtrlRegra.RuleNumber   := IntToStr(IdRegraSalParcela);
   CtrlRegra.Execute;

   If (CtrlRegra.Error) or (CtrlRegra.bFinalizarRegra) Then
   Begin
     MessageInfo := 'Erro na execução da regra ' + IntToStr(IdRegraSalParcela) +
                    ' - Parcelamento.';
     Exit;
   End;

   rValorRegra := StrToFloat(CtrlRegra.Result);

   Result := rValorRegra;
end;

function TCtrlParcelamento.CalculaSdoDevedor: Double;
Var
  sSql        : String;
  rValorRegra : Double;
  bErro       : Boolean;
begin
   Result :=0;

   sSQL := 'SELECT DISTINCT '                                 + #13 +
           '  '+oranumero(SalBaseAtual)+' SALBASE, '          + #13 +
           '  '+oranumero(Percentual)+' PERCENTUAL, '         + #13 +
           '  '+IntToStr(ParcelasAPagar)+' NUMPARCAVENCER ,  '+ #13 +
           '   PPP.IDPESSOA,                                 '+ #13 +
           '   PPP.IDPESSJUR,                                '+ #13 +
           '   PPP.IDPLANOPREV,                              '+ #13 +
           '   PPP.INSCRICAODATA,                            '+ #13 +
           '   PPP.INSCRICAOTIPO,                            '+ #13 +
           '   ELP.IDSITFUNC,                                '+ #13 +
           '   PPP.IDSITPLANOPREV,                           '+ #13 +
           '   PPP.IDSITPART,                                '+ #13 +
           '   FIS.DATANASC,                                 '+ #13 +
           '   FIS.SEXO,                                     '+ #13 +
           '   FIS.DATAMORTE,                                '+ #13 +
           '   STP.FLGINTERNO,                               '+ #13 +
           '   ELP.SALTOTAL,                                 '+ #13 +
           '   ELP.DATAADMISSAO,                             '+ #13 +
           '   ELP.TEMPOSERVANTERIOR,                        '+ #13 +
           '   ELP.TEMPONAOCREDITADO,                        '+ #13 +
           '   ELP.TEMPOSERVTOTAL,                           '+ #13 +
           '   ELP.DATADEMISSAO,                             '+ #13 +
           '   ELP.TEMPOSERVTOTMES,                          '+ #13 +
           '   ELP.TEMPOSERVTOTDIA,                          '+ #13 +
           '   ELP.FLGDIRETOR,                               '+ #13 +
           '  '+QuotedStr(DateToStr(date))+' AS DATAREF ,    '+ #13 +
           '   ROWNUM NUMLINHA     '                          + #13 +
           'FROM  '                                           + #13 +
           '  PESSOAFISICA FIS, ELEGPATRO ELP, '              + #13 +
           '  PARTPREVPLAN PPP, SITPART STP '                 + #13 +
           'WHERE '                                           + #13 +
           '      PPP.IDPESSJUR   = '+IntToStr(IdPessJur)     + #13 +
           '  AND PPP.IDPLANOPREV = '+IntToStr(IdPlanoPrev)   + #13 +
           '  AND PPP.IDPESSOA    = '+IntToStr(IdPessoa)      + #13 +
           '  AND PPP.SEQPROPOSTA = '+IntToStr(SeqProposta)   + #13 +
           '  AND ELP.IDPESSJUR   = PPP.IDPESSJUR     '       + #13 +
           '  AND ELP.IDPESSOA    = PPP.IDPESSOA      '       + #13 +
           '  AND FIS.IDPESSOA    = ELP.IDPESSOA      '       + #13 +
           '  AND STP.IDSITPART   = PPP.IDSITPART     ';

  CtrlRegra.CopiaData(GetDataPacket(sSql));

  CtrlRegra.GravaCalculo := False;
  CtrlRegra.ReloadRule   := False;

  CtrlRegra.RuleNumber  := IntToStr(IdRegraSdoDevedor);
  CtrlRegra.Execute;

  If (CtrlRegra.Error) or (CtrlRegra.bFinalizarRegra) Then
  Begin
    MessageInfo := 'Erro na execução da regra ' + IntToStr(IdRegraSdoDevedor) +
                   ' - Saldo Devedor.';
    Exit;
  End;

  rValorRegra := StrToFloat(CtrlRegra.Result);

  Result := rValorRegra;
end;

function TCtrlParcelamento.VoltaNumParcelasAPagar: String;
Var
  sSql : String;
begin
  result := '0';

  sSql := 'SELECT '                                         + #13 +
          '  COUNT(1) NUM, IDCONTRIBUICAO '                 + #13 +
          'FROM '                                           + #13 +
          '  HSTCONTRIBPREV '                               + #13 +
          'WHERE '                                          + #13 +
          '      IDPESSJUR        = '+IntToStr(IdPessJur)   + #13 +
          '  AND IDPLANOPREV      = '+IntToStr(IdPlanoPrev) + #13 +
          '  AND IDPESSOA         = '+IntToStr(IdPessoa)    + #13 +
          '  AND SEQPROPOSTA      = '+IntToStr(SeqProposta) + #13 +
          '  AND IDPARCELAMENTO   = '+IntToStr(NumParcelas) + #13 +
          '  AND SITRECEBIMENTO   <> ''7'' '                + #13 +
          '  AND NVL(VALORRECEBIDO,0) > 0  '                + #13 +
          '  AND NVL(FLGDEVOLUCAO,0) = 0 '                  + #13 +
          'GROUP BY '                                       + #13 +
          '  IDCONTRIBUICAO '                               + #13 +
          'ORDER BY '                                       + #13 +
          '  NUM DESC ';

  FcdsAux.Data := GetDataPacket(sSql);

  If Not FcdsAux.IsEmpty Then Result := IntToStr(NumParcelas -
                                       FcdsAux.fieldbyname('NUM').AsInteger)
  Else Result := IntToStr(NumParcelas);
end;

end.

