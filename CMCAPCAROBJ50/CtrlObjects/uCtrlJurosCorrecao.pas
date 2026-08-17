unit uCtrlJurosCorrecao;

interface

Uses classes, sysUtils, dbclient, uCmDbObject, uCmControlObject,
     uFuncaoGeral, uDiasUteis, uCtrlDocumento;

Type
  TCtrlJurosCorrecao = class(TCmControlObject)
  private
    _FuncaoGeral: TFuncaoGeral;
    _DiasUteis: TDiasUteis;

    _AltJurosSimples, _AltJurosComposto, _AltCorrecao, _AltMulta, _indicecorrecao: LongInt;
    _Prepared, _LancaCorrecao: Boolean;
    _percCorrecao, _percjurosatuarial, _percjurossimples, _vlrmulta: Double;
    _Documento: TCtrlDocumento;
    _RecPag: String;

    FIntegraContab: Boolean;
    FIdUsuario: LongInt;
    FIdEmpresa: LongInt;
    FCodDocumento: LongInt;
    FDataCorrecao: TDateTime;
    FUsaPlanoPatro: Boolean;
    FIdPlanoConta: LongInt;
    FidModulo: LongInt;
    procedure SetCodDocumento(const Value: LongInt);
    procedure SetDataCorrecao(const Value: TDateTime);
    procedure SetIdEmpresa(const Value: LongInt);
    procedure SetIdUsuario(const Value: LongInt);
    procedure SetIntegraContab(const Value: Boolean);

    Procedure GetValoresCorrecao;
    function LancaAlteradores(rValor: Double; liCodAlterador: LongInt): Boolean;
    function GetSaldoDoc: Double;
    function GetDataUltCorrecao: TDateTime;
    procedure SetidModulo(const Value: LongInt);
    procedure SetIdPlanoConta(const Value: LongInt);
    procedure SetUsaPlanoPatro(const Value: Boolean);

    function UltimoDiaMes(dData: TDateTime): TDateTime; 
  Protected
    procedure DoChangeDataBase; Override;
    procedure AfterInitialize; Override;

  public
     Constructor Create; Override;
     Destructor Destroy; Override;

     function CorrigeDocumento: Boolean;

     property CodDocumento: LongInt read FCodDocumento write SetCodDocumento;
     property DataCorrecao: TDateTime read FDataCorrecao write SetDataCorrecao;
     property IdEmpresa: LongInt read FIdEmpresa write SetIdEmpresa;
     property IdUsuario: LongInt read FIdUsuario write SetIdUsuario;
     property IntegraContab: Boolean read FIntegraContab write SetIntegraContab;
     property idModulo: LongInt read FidModulo write SetidModulo;
     property IdPlanoConta: LongInt read FIdPlanoConta write SetIdPlanoConta;
     property UsaPlanoPatro: Boolean read FUsaPlanoPatro write SetUsaPlanoPatro;
  End;


implementation

Uses Math;

{ TCtrlJurosCorrecao }

procedure TCtrlJurosCorrecao.AfterInitialize;
begin
  inherited;
  _Documento.InitializeAs(Self);
  _FuncaoGeral.InitializeAs(Self);
  _DiasUteis.InitializeAs(Self);
end;

function TCtrlJurosCorrecao.CorrigeDocumento: Boolean;
Var
   DataultCorrecao, dUltimaCorrecao, dDataFinal: TDateTime;
   iAnoCor, iMesCor, iDiaCor, iAnoUltCor, iMesUltCor, iDiaUltCor,
   iAno, iMes, iDia: Word;
   iNumDias, iNumDiasMes, iNumCorrecoes, X: Integer;
   rValorCorrecao, rValorJurosAtuarial, rValorJurosSimples, rSaldoDoc, rvlrmulta, rvalor: Double;
   bLancaCorrecao: Boolean;

   Procedure Prepare;
   Begin
      If Not _Prepared Then
      Begin
         _Cds.Close; // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
         _Cds.Data := GetDataPacket('SELECT FLGCORRIGEDOCAUTO, CODALTJUROSSIMPLES, CODALTJUROSCOMPOSTO, CODALTCORRECAO, CODALTMULTA FROM PARAMCAP WHERE IDPESSOA = ' + IntToStr(FIdEmpresa) + ' AND RECPAG = ''' + _RecPag + '''');

         If Not _Cds.IsEmpty Then
         Begin
           _AltJurosSimples   := _Cds.FieldByName('CODALTJUROSSIMPLES').AsInteger;
           _AltJurosComposto  := _Cds.FieldByName('CODALTJUROSCOMPOSTO').AsInteger;
           _AltCorrecao       := _Cds.FieldByName('CODALTCORRECAO').AsInteger;
           _AltMulta          := _Cds.FieldByName('CODALTMULTA').AsInteger;
           _LancaCorrecao     := (_Cds.FieldByName('FLGCORRIGEDOCAUTO').AsString = 'S');

           _Prepared := True;
         End
         Else
         Begin
           _AltJurosSimples   := 0;
           _AltJurosComposto  := 0;
           _AltCorrecao       := 0;
           _AltMulta          := 0;
           _LancaCorrecao     := false;

           _Prepared := False;
         End;

         If _Cds.Active Then _Cds.Close;
      End;
   End;
begin
  Result := True;
  DataultCorrecao := GetDataUltCorrecao;

  Prepare;

  DecodeDate(fDataCorrecao,iAnoCor, iMesCor, iDiaCor);
  DecodeDate(DataultCorrecao,iAnoUltCor, iMesUltCor, iDiaUltCor);

  rValorCorrecao      := 0;
  rValorJurosAtuarial := 0;
  rValorJurosSimples  := 0;
  rvlrmulta           := 0;
  rSaldoDoc           := GetSaldoDoc;

  bLancaCorrecao := (_LancaCorrecao And  (fDataCorrecao > DataultCorrecao));

  If bLancaCorrecao then
  Begin
     If (iAnoCor = iAnoUltCor) And (iMesCor = iMesUltCor)  Then
     Begin
        DecodeDate(UltimoDiaMes(fDataCorrecao),iAno, iMes, iDia);
        iNumDiasMes := iDia;
        iNumDias    := Round(fDataCorrecao - GetDataUltCorrecao) + 1;

        GetValoresCorrecao;

        If _percCorrecao <> 0 Then
           rValorCorrecao      := rSaldoDoc * Power(( 1 + (_percCorrecao/100)),(iNumDias/iNumDiasMes)) - rSaldoDoc;

        rSaldoDoc := rSaldoDoc + rValorCorrecao;

        If _percjurosatuarial <> 0 Then
           rValorJurosAtuarial := rSaldoDoc * Power(( 1 + (_percjurosatuarial/100)),(iNumDias/iNumDiasMes)) - rSaldoDoc;

        rSaldoDoc := rSaldoDoc + rValorJurosAtuarial;

        If _percjurossimples <> 0 Then
           rValorJurosSimples  := (rSaldoDoc * ((iNumDias/iNumDiasMes) * (_percjurossimples/100)));

        If _vlrmulta <> 0 Then
           LancaAlteradores(_VlrMulta, _AltMulta);

        If rValorCorrecao <> 0 Then
           LancaAlteradores(rValorCorrecao, _AltCorrecao);

        If rValorJurosAtuarial <> 0 Then
           LancaAlteradores(rValorJurosAtuarial, _AltJurosComposto);

        If rValorJurosSimples <> 0 Then
           LancaAlteradores(rValorJurosSimples, _AltJurosSimples);
     End
     Else
     Begin
        iNumCorrecoes   := iMesCor - iMesUltCor + ((iAnoCor - iAnoUltCor)*12);
        dUltimaCorrecao := GetDataUltCorrecao;
        dDataFinal      := fDataCorrecao;

        For X:=0 To iNumCorrecoes Do
        Begin
           If X = iNumCorrecoes Then
             fDataCorrecao := dDataFinal
           Else
             fDataCorrecao := UltimoDiaMes(dUltimaCorrecao);

           DecodeDate(UltimoDiaMes(fDataCorrecao),iAno, iMes, iDia);
           iNumDiasMes := iDia;
           iNumDias    := Round(fDataCorrecao - dUltimaCorrecao) + 1;

           GetValoresCorrecao;

           dUltimaCorrecao := fDataCorrecao + 1;

           rValor := 0;
           If _percCorrecao <> 0 Then
           Begin
              rValor         := rSaldoDoc * Power(( 1 + ( _percCorrecao/100)),(iNumDias/iNumDiasMes)) - rSaldoDoc;
              rValorCorrecao := rValorCorrecao + rValor;
           End;

           rSaldoDoc := rSaldoDoc + rValor;

           rValor := 0;
           If _percjurosatuarial <> 0 Then
           Begin
              rValor              := rSaldoDoc * Power(( 1 + (_percjurosatuarial/100)),(iNumDias/iNumDiasMes)) - rSaldoDoc;
              rValorJurosAtuarial := rValorJurosAtuarial + rvalor;
           End;

           rSaldoDoc := rSaldoDoc + rValor;

           If _percjurossimples <> 0 Then
              rValorJurosSimples  := rValorJurosSimples + (rSaldoDoc * ((iNumDias/iNumDiasMes) * (_percjurossimples/100)));

           rvlrmulta := rvlrmulta +  _vlrmulta;
        End;

        If rvlrmulta <> 0 Then
           LancaAlteradores(rvlrmulta, _AltMulta);

        If rValorCorrecao <> 0 Then
           LancaAlteradores(rValorCorrecao, _AltCorrecao);

        If rValorJurosAtuarial <> 0 Then
           LancaAlteradores(rValorJurosAtuarial, _AltJurosComposto);

        If rValorJurosSimples <> 0 Then
           LancaAlteradores(rValorJurosSimples, _AltJurosSimples);
     End;

     Result := ExecSQL('UPDATE DOCUMENTO SET DATACORRECAO = TO_DATE(''' + DateToStr(fDataCorrecao) + ''',''DD/MM/YYYY'') WHERE CODDOCUMENTO = ' + IntToStr(fCodDocumento));
  End;
end;

constructor TCtrlJurosCorrecao.Create;
begin
  inherited;
  FIntegraContab := False;
  FUsaPlanoPatro := False;
  FIdUsuario := 0;
  FIdEmpresa := 0;
  FCodDocumento := 0;
  FIdPlanoConta := 0;
  FidModulo := 0;

  FDataCorrecao := Date;

  _RecPag := 'R';
  _AltJurosSimples := 0;
  _AltJurosComposto := 0;
  _AltCorrecao := 0;
  _AltMulta := 0;
  _percjurosatuarial := 0;
  _percjurossimples := 0;
  _percCorrecao := 0;
  _vlrmulta := 0;
  _indicecorrecao := 0;
  _LancaCorrecao := false;
  _Prepared := True;

  _Documento := TCtrlDocumento.Create;
  _FuncaoGeral := TFuncaoGeral.Create;
  _DiasUteis := TDiasUteis.Create;
end;

destructor TCtrlJurosCorrecao.Destroy;
begin
//  _Documento.Free;
//  _FuncaoGeral.Free;
//  _DiasUteis.Free;
  FreeAndNil(_Documento);
  FreeAndNil(_FuncaoGeral);
  FreeAndNil(_DiasUteis);
  inherited; // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
end;

procedure TCtrlJurosCorrecao.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlJurosCorrecao.GetDataUltCorrecao: TDateTime;
begin
   _Cds.Close; // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   try
     _Cds.Data := GetDataPacket('SELECT ' +
                ' DATACORRECAO, DATAPROGRAMADA, RECPAG ' +
                'FROM ' +
                ' DOCUMENTO ' +
                'WHERE ' +
                ' (CODDOCUMENTO = ' + IntToStr(fCodDocumento) + ')');

     If Not _Cds.IsEmpty Then
     Begin
       If _Cds.FieldByName('DATACORRECAO').IsNull Then
          Result := _Cds.FieldByName('DATAPROGRAMADA').AsDateTime + 1
       Else
          Result := _Cds.FieldByName('DATACORRECAO').AsDateTime + 1;

       _RecPag := _Cds.FieldByName('RECPAG').AsString;
     End
     Else
       Raise Exception.Create('Erro ao selecionar data da ultima correção');

   finally
     _Cds.Close; // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   end;
end;

function TCtrlJurosCorrecao.GetSaldoDoc: Double;
begin
   _Cds.Close; // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   _Cds.Data := GetDataPacket('SELECT ' +
                              ' D.CODDOCUMENTO, ' +
                              ' SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOR*-1,L.VALOR),DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))) AS SALDO ' +
                              'FROM ' +
                              ' DOCUMENTO D, LANCTODOCUM L ' +
                              'WHERE ' +
                              ' (D.CODDOCUMENTO =  ' + IntToStr(fCodDocumento) + ') AND ' +
                              ' (((L.CODALTERADOR <> ' + IntToStr(_AltJurosSimples) + ') AND ' +
                              ' (L.CODALTERADOR <> ' + IntToStr(_AltMulta) + ')) OR ' +
                              ' (L.CODALTERADOR IS NULL)) AND ' +
                              ' (D.CODDOCUMENTO = L.CODDOCUMENTO) ' +
                              'GROUP BY ' +
                              ' D.CODDOCUMENTO');

   If Not _Cds.IsEmpty Then
     result := _Cds.FieldByName('SALDO').AsFloat
   Else
     result := 0;

   If _Cds.Active Then _Cds.Close;
end;

procedure TCtrlJurosCorrecao.GetValoresCorrecao;
Var
   sPercValor: String;
   rpercUltCorrecao: Double;
   dDataRef:TDateTime;
Begin
   _Cds.Close; // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   try
     _Cds.Data := GetDataPacket(' SELECT ' +
                                '  PERCJUROSATUARIAL, PERCJUROSSIMPLES, VLRMULTA, INDICECORRECAO ' +
                                ' FROM ' +
                                '  DOCUMENTO ' +
                                ' WHERE ' +
                                '  CODDOCUMENTO = ' + IntToStr(fCodDocumento));
     If Not _Cds.IsEmpty Then
     Begin
        _percjurosatuarial := _Cds.FieldByName('PERCJUROSATUARIAL').AsFloat;
        _percjurossimples  := _Cds.FieldByName('PERCJUROSSIMPLES').AsFloat;
        _vlrmulta          := _Cds.FieldByName('VLRMULTA').AsFloat;
        _indicecorrecao    := _Cds.FieldByName('INDICECORRECAO').AsInteger;
     End
     Else
     Begin
        _percjurosatuarial := 0;
        _percjurossimples  := 0;
        _vlrmulta          := 0;
        _indicecorrecao    := 0;
     End;

     If (_indicecorrecao <> 0) Then
     Begin
       _Cds.Close; // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
       _Cds.Data := GetDataPacket('SELECT FLGPERCVALOR FROM MOEDA WHERE MOECODIGO = ' + intToStr(_indicecorrecao));

       sPercValor    := _Cds.FieldByName('FLGPERCVALOR').AsString;
       _percCorrecao := _FuncaoGeral.TestaCotacaoMoeda(_IndiceCorrecao,DateToStr(fDataCorrecao),'N');

       If sPercValor = 'V' Then
       Begin
          dDataRef := StrToDate('01'+Copy(DateToStr(fDataCorrecao),3,8))-15;
          dDataRef := UltimoDiaMes(dDataRef);
          rpercUltCorrecao := _FuncaoGeral.TestaCotacaoMoeda(_IndiceCorrecao,DateToStr(dDataRef),'N');
          _percCorrecao    := ((_percCorrecao/rpercUltCorrecao) - 1)*100;
       End;
     End
     Else
       _percCorrecao := 0;

   finally
     _Cds.Close; // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   end;
end;

function TCtrlJurosCorrecao.LancaAlteradores(rValor: Double;
  liCodAlterador: Integer): Boolean;
Var
 sDebCre: String;
Begin
  Result := False;

  If liCodAlterador <> 0 Then
  Begin
     sDebCre    := _FuncaoGeral.Decode(_RecPag ,'P','C','D');

     If rValor < 0 Then
     Begin
        rvalor := Abs(rvalor);
        If sDebCre = 'D' Then
           sDebCre := 'C'
        Else
           sDebCre := 'D';
     End;

     _Documento.Prepare(OpLanctoDocum, odlAlterador);
     _Documento.Lanctodocum.SetValues(FDataCorrecao, FCodDocumento, 0, rValor,
     0, rValor, 0, 0, 0, FIdUsuario, FIdEmpresa, 0, 0, 0, 0, liCodAlterador,
     '4', '', '', '', '', '', '', '', sDebCre, idModulo, IdPlanoConta, UsaPlanoPatro,
     FIntegraContab);

     Result := _Documento.Insert;

     If Not Result Then MessageInfo := _Documento.MessageInfo;
  End
  Else
    MessageInfo := 'Código do alterador não informado';
end;

procedure TCtrlJurosCorrecao.SetCodDocumento(const Value: LongInt);
begin
  FCodDocumento := Value;
end;

procedure TCtrlJurosCorrecao.SetDataCorrecao(const Value: TDateTime);
begin
  FDataCorrecao := Value;
end;

procedure TCtrlJurosCorrecao.SetidModulo(const Value: LongInt);
begin
  FidModulo := Value;
end;

procedure TCtrlJurosCorrecao.SetIdPlanoConta(const Value: LongInt);
begin
  FIdPlanoConta := Value;
end;

procedure TCtrlJurosCorrecao.SetUsaPlanoPatro(const Value: Boolean);
begin
  FUsaPlanoPatro := Value;
end;

procedure TCtrlJurosCorrecao.SetIdEmpresa(const Value: LongInt);
begin
  If FIdEmpresa <> Value Then _Prepared := False;
  FIdEmpresa := Value;
end;

procedure TCtrlJurosCorrecao.SetIdUsuario(const Value: LongInt);
begin
  FIdUsuario := Value;
end;

procedure TCtrlJurosCorrecao.SetIntegraContab(const Value: Boolean);
begin
  FIntegraContab := Value;
end;

function TCtrlJurosCorrecao.UltimoDiaMes(dData: TDateTime): TDateTime;
Var
  wAno, wMes, wDia: Word;
begin
  DecodeDate(dData, wAno, wMes, wDia);
  Result := _DiasUteis.UltDiaMes(wAno, wMes);
end;

end.
