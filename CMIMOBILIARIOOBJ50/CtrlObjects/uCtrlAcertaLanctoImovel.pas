unit uCtrlAcertaLanctoImovel;
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902  (ADMIN) E 172902/8221 (ALIEN)
Nº KINTANA..: 1577381 (ADMIN) E 1577344     (ALIEN)
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------}

interface

Uses Forms, Classes, SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
     uCtrlImobLancamento, uSistema, uComunsImobiliarioDb,
     uCmMath, dialogs, uCtrlPadrLancImovel, StdCtrls, Gauges,
     // Helen - SOL: 172902 KTN: 1577381
     uCtrlContab;

Type
  tDadosLancamento = Class
    iPlanilha           : Integer;
    iNumLancto          : Integer;
    TipoOper            : String;
    sHist1              : String;
    sHist2              : String;
    sHist3              : String;
    sHist4              : String;
    sHist5              : String;
    IdPlano             : Integer;
    UnidNegoc           : Integer;
    ContaCredito        : String;
    ContaDebito         : String;
    CentroCustoCredito  : String;
    CentroCustoDebito   : String;
    dDataLancto         : TDateTime;
  end;

  TLancamentos = Class
  private
    fDados : tList;
    function GetDadosLancamento(Index: Integer): tDadosLancamento;
    procedure SetDadosLancamento(Index: Integer; const Value: tDadosLancamento);
  public
    Constructor Create;
    Destructor  Destroy; override;
    function    Add : tDadosLancamento;
    Function    Count : Integer;
    Procedure   Clear;
    Procedure   Delete(Const pIndex : Integer);
    property    Dados[Index: Integer] : tDadosLancamento read GetDadosLancamento write SetDadosLancamento; default;
  end;


  TCtrlAcertaLanctoImovel = class(TCmControlObject)
  private
    CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381
    procedure CarregarDadosFixosLancto(aDados : tDadosLancamento);
  protected
    _CdsLancamentos : TCmClientDataSet;
    _CdsDocumentos  : TCmClientDataSet;
    _CdsRateio      : TCmClientDataSet;
    CtrlLancto      : tCtrlImobLancamento;
    CtrlComumImob   : TComunsImobiliarioDB;
    CtrlPadraoImob  : TCtrlPadrLancImovel;
    procedure AfterInitialize;  Override;

    // Metodos de processamento
    function ProcessarLancamentos(const pIdContrato, pIdCodDocumento : integer) : Boolean;
    function SelecionarLancamentos(const pIdContrato, pIdCodDocumento : integer) : Variant;
    function ExcluirLancamentos(const pIdLancto,pIdPlanilha: Integer) : Boolean;
    function RefazerLancamentos(const pIdContrato,
                                      pIdCodDocumento : integer;
                                const aDados : tDadosLancamento ) : Boolean;
    function DeletaRateioDocumentos(const piDocumento: Integer): Boolean;
    function InsereRateioDocumentos(prValor          : Double;
                                    pIdCodDocumento  : Integer;
                                    pIdUnidnegoc     : Integer;
                                    pIdUsuario       : Integer;
                                    pIdPlano         : Integer;
                                    pIdPlanoPrev     : Integer;
                                    pIdPatro         : Integer;
                                    pIdPrograma      : Integer;
                                    pIdProcesso      : Integer;
                                    pCodTipRecDes    : String;
                                    pRecpag          : String;
                                    pCodCentroRespon : String;
                                    pCodCentroCusto  : String): Boolean;
    function InserirLancamentoContabil(const pIdContrato,
                                             pIdCodDocumento : Integer;
                                       const prValor         : Double;
                                       const aDados          : TDadoslancamento   ) : Boolean;
    function  ProcessarDocumentos  : Boolean;
    function  SelecionarDocumentos : Variant;
    function  CriarRateioDocumento(const pIdContrato, pIdCodDocumento : integer) : Boolean;
    procedure LocalizaCCustoContaContabil(aDados : TDadosLancamento);
  public
    DataInicial : TDateTime;
    idImovel    : Integer;
    IdContrato  : Integer;
    ProgressBar : TGauge;
    lblStatus   : tLabel;
    Constructor Create; override;
    Destructor  Destroy; override;
    Function    Processar : Boolean;
  end;


implementation

constructor TCtrlAcertaLanctoImovel.Create;
begin
  inherited;
  _CdsLancamentos := TCmClientDataSet.Create(Nil);
  _CdsDocumentos  := TCmClientDataSet.Create(Nil);
  _CdsRateio      := TCmClientDataSet.Create(Nil);
  CtrlLancto      := tCtrlImobLancamento.Create;
  CtrlComumImob   := TComunsImobiliarioDB.Create(Sistema.IdEmpresa,
                                                 Sistema.IdModulo,
                                                 Sistema.IdUsuario,
                                                 Sistema.IdEspAcesso,
                                                 True);
  CtrlPadraoImob := TCtrlPadrLancImovel.Create(Sistema.IdEmpresa,Sistema.IdModulo);
  CtrlContab     := TCtrlContab.Create; // Helen - SOL: 172902 e 172902/8221 KTN: 1577381 e 1577344
end;

destructor TCtrlAcertaLanctoImovel.Destroy;
begin
  inherited;
  FreeAndNil(CtrlLancto);
  FreeAndNil(_CdsLancamentos);
  FreeAndNil(_CdsDocumentos);
  FreeAndNil(_CdsRateio);
  FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381
end;

procedure TCtrlAcertaLanctoImovel.AfterInitialize;
begin
  inherited;
  CtrlLancto.InitializeAs(Self);
  CtrlComumImob.InitializeAs(Self);
  CtrlContab.InitializeAs(Self);// Helen - SOL: 172902 e 172902/8221 KTN: 1577381 e 1577344
end;

procedure TCtrlAcertaLanctoImovel.CarregarDadosFixosLancto(aDados : tDadosLancamento);
begin
  with aDados do
  begin
    iPlanilha   := _cdsLancamentos.FieldByName('PlnCodigo').asInteger;
    iNumLancto  := _cdsLancamentos.FieldByName('LacNumLan').asInteger;
    TipoOper    := _cdsLancamentos.FieldByName('TipCodigo').asString;
    sHist1      := _cdsLancamentos.FieldByName('LacHist1').asString;
    sHist2      := _cdsLancamentos.FieldByName('LacHist2').asString;
    sHist3      := _cdsLancamentos.FieldByName('LacHist3').asString;
    sHist4      := _cdsLancamentos.FieldByName('LacHist4').asString;
    sHist5      := _cdsLancamentos.FieldByName('LacHist5').asString;
    dDataLancto := _cdsLancamentos.FieldByName('PlnDatDia').asDateTime;
  end;
end;


function TCtrlAcertaLanctoImovel.ProcessarLancamentos(const pIdContrato,
                                                            pIdCodDocumento : integer) : Boolean;
var i : Integer;
    oLancamento : tLancamentos;
    oDados : tDadosLancamento;
begin
  Result := True;
  oLancamento := TLancamentos.Create;
  with _cdsLancamentos do
  begin
    Data := SelecionarLancamentos(pIdContrato,pIdCodDocumento);
    while not Eof do
    begin
      oDados := oLancamento.Add;
      CarregarDadosFixosLancto(oDados);
      LocalizaCCustoContaContabil(oDados);

      Result := ExcluirLancamentos(oDados.iNumLancto,oDados.iPlanilha);
      If Not Result then
        Break;
      Next;
    end;
    If Result then
    begin
      For i := 0 to oLancamento.Count-1 do
        Result := RefazerLancamentos(pIdContrato,
                                     pIdCodDocumento,
                                     oLancamento.Dados[i]);
    end;
  end;
  FreeAndNil(oLancamento)
end;

Function TCtrlAcertaLanctoImovel.SelecionarLancamentos(const pIdContrato, pIdCodDocumento : integer) : Variant;
var sSql : String;
begin
  sSql := 'Select distinct li.IdContratoImovel, li.PlnCodigo,'+#13+
          '       l.lacnumlan, p.plndatdia, P.TipCodigo,'+#13+
          '       l.lachist1, l.lachist2, l.lachist3,'+#13+
          '       l.lachist4, l.lachist5'+#13+
          'from lancamentosImovel li, planilha p, lancamento l'+#13+
          'where li.plncodigo = l.plncodigo'+#13+
          '  and li.plncodigo = p.plncodigo'+#13+
          '  and li.idContratoImovel = '+IntToStr(pIdContrato)+#13+
          '  and li.coddocumento = '+IntToStr(pIdCodDocumento);
  Result := GetDataPacket(sSql);
end;

function TCtrlAcertaLanctoImovel.ExcluirLancamentos(Const pIdLancto,pIdPlanilha : Integer) : Boolean;
begin
  Result := CtrlLancto.ExcluiLancaContab(Sistema.IdUsuario,
                                         pidPlanilha,
                                         Sistema.IdModulo,
                                         pidLancto,
                                         false,
                                         true);
  If Not Result then
    MessageInfo := CtrlLancto.MessageInfo;
end;

procedure TCtrlAcertaLanctoImovel.LocalizaCCustoContaContabil(aDados : TDadosLancamento);
Var sSql : String;
    oQry : TCmClientDataSet;
begin
  oQry := TCmClientDataSet.Create(nil);
  Try
    sSql := 'select CodCentroCusto as CodCustoDebito,'+#13+
            '       PlaConta       as ContaDebito,'+#13+
            '       UnidNegoc,'+#13+
            '       Plano'+#13+
            'from lancamento'+#13+
            'where plncodigo = '+IntToStr(aDados.iPlanilha)+#13+
            '  and LacNumLan = '+IntToStr(aDados.iNumLancto)+#13+
            '  and LACDebCre = ''D''';
    oQry.Data := GetDataPacket(sSql);
    aDados.IdPlano           := oQry.FieldByName('Plano').asInteger;
    aDados.UnidNegoc         := oQry.FieldByName('UnidNegoc').asInteger;
    aDados.CentroCustoDebito := oQry.FieldbyName('CodCustoDebito').asString;
    aDados.ContaDebito       := oQry.FieldByName('ContaDebito').asString;
    oQry.Close;
    sSql := 'select CodCentroCusto as CodCustoCredito,'+#13+
            '       PlaConta       as ContaCredito'+#13+
            'from lancamento'+#13+
            'where plncodigo = '+IntToStr(aDados.iPlanilha)+#13+
            '  and LacNumLan = '+IntToStr(aDados.iNumLancto)+#13+
            '  and LACDebCre = ''C''';
    oQry.Data := GetDataPacket(sSql);
    aDados.CentroCustoCredito := oQry.FieldbyName('CodCustoCredito').asString;
    aDados.ContaCredito       := oQry.FieldByName('ContaCredito').asString;
 Finally
   FreeAndNil(oQry);
 end;
end;

Function TCtrlAcertaLanctoImovel.RefazerLancamentos(Const pIdContrato,
                                                          pIdCodDocumento : integer;
                                                    Const aDados : TDadosLancamento) : Boolean;
var rValor, rValorTotal, rValorAcumulado : Double;
begin
  Result          := True;
  rValorTotal     := _cdsDocumentos.FieldByName('Valor').asFloat;
  rValorAcumulado := 0;
  _CdsRateio.Data := CtrlComumImob.RetornaRateioPlanoxContrato(pIdContrato);
  If _CdsRateio.IsEmpty then
    Raise Exception.Create('O Contrato '+IntToStr(pIdContrato)+' não possue rateios !');
  While Not _CdsRateio.Eof Do
  begin
    rValor := RoundCm(rValorTotal * (_CdsRateio.FieldByName('PERCENTRATEIO').asFloat / 100),2);
    If _CdsRateio.Recno = _CdsRateio.recordCount then
      rValor := rValorTotal - rValorAcumulado
    else
      rValorAcumulado := rValorAcumulado + rValor;
    Result := InserirLancamentoContabil(pIdContrato,
                                        pIdCodDocumento,
                                        rValor,
                                        aDados);
    If Not Result then
      Break;
    _CdsRateio.Next;
  end;
  _CdsRateio.Close;
end;

Function TCtrlAcertaLanctoImovel.InserirLancamentoContabil(Const pIdContrato,
                                                                 pIdCodDocumento : Integer;
                                                           Const prValor : Double;
                                                           const aDados : tDadosLancamento) : Boolean;
begin
  Try
    Result := CtrlLancto.InsereLancaContab('2',
                                           sistema.IdEmpresa,
                                           sistema.IdModulo,
                                           sistema.idusuario,
                                           aDados.idPlano,
                                           aDados.UnidNegoc,
                                           -1,
                                           -1,
                                           _CdsRateio.FieldByName('IDPLANOPREV').asInteger,  // ok
                                           _CdsRateio.FieldByName('IDPATRO').asInteger,      // ok
                                           aDados.iPlanilha,                                      // ok
                                           -1,
                                           DateToStr(aDados.dDataLancto),
                                           _cdsDocumentos.FieldByName('NoDocumento').asString,
                                           aDados.sHist1,
                                           aDados.sHist2,
                                           aDados.sHist3,
                                           aDados.sHist4,
                                           aDados.sHist5,
                                           aDados.TipoOper,
                                           aDados.CentroCustoDebito,
                                           aDados.ContaDebito,
                                           aDados.CentroCustoCredito,
                                           aDados.ContaCredito,
                                           '',
                                           prValor,         // ok
                                           false,
                                           True,
                                           -1,              // iIdSegregaCriter,
                                           0,               // dDataSegregaCriter,
                                           -1,              // iIdSegregaContr,
                                           -1,              // iIdImovel,
                                           false,           // bSegregaOrigem,
                                           piDCodDocumento, // ok
                                           false,           // bForcaGravacaoMemoCalc,
                                           prValor,         // bValorTotLacamento,
                                           pIDContrato);    // ok
  except
    MessageInfo := CtrlLancto.MessageInfo;
    Result := False;
  end;
end;

function TCtrlAcertaLanctoImovel.Processar : boolean;
begin
  Result := true;
  try
    StartTransaction;
     // Helen - SOL: 172902 e 172902/8221 KTN: 1577381 e 1577344  - Inicio
    if DateToStr(DataInicial) <> '' then
    begin
        if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,DateToStr(DataInicial)) then
           Raise Exception.Create('Período Contábil bloqueado !');
    end;
    // Helen - SOL: 172902 e 172902/8221 KTN: 1577381 e 1577344 - Fim
    If ProcessarDocumentos then
      Commit
    Else
    begin
      Result := False;//Helen - SOL: 172902 e 172902/8221 KTN: 1577381 e 1577344 - Inicio
      MessageDlg(MessageInfo,MTError,[mbOk],0);
      RollBack;
    end;
  except
    on E : Exception do begin
      Result := False;
      Rollback;
      MessageInfo := E.Message;
      MessageDlg(MessageInfo,MTError,[mbOk],0);
    end;
  end;
end;

function TCtrlAcertaLanctoImovel.ProcessarDocumentos: Boolean;
var iContrato,iDocumento : Integer;
begin
  Result := False;
  with _cdsDocumentos do
  begin
    Data := SelecionarDocumentos();
    ProgressBar.MaxValue := RecordCount;
    // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
    if ProgressBar.MaxValue = 0 then
    begin
       MessageInfo := ('Não existem Lançamentos para correção.');
       Result := False;
    end;
    // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
    While not Eof do
    begin
      // Definicão dos dados
      iContrato  := FieldByName('IdContratoImovel').asInteger;
      iDocumento := FieldByName('CodDocumento').asInteger;
      lblStatus.Caption := Format('Processando Contrato %d - Documento %d . . .',
                                  [iContrato,iDocumento]);
      application.ProcessMessages;
      // Helen - SOL: 172902/8221 KTN: 1577344 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,FieldByName('DataVencto').asString) then
      begin
          Result := False;
          Raise Exception.Create('Período Contábil bloqueado. Erro ao excluir Rateio. Para o documento : '+ IntToStr(iDocumento));
          Break;
      end;
      // Helen - SOL: 172902/8221 KTN: 1577344 - Fim
      If DeletaRateioDocumentos(iDocumento) then
        If CriarRateioDocumento(iContrato,iDocumento) then
          Result := ProcessarLancamentos(iContrato,iDocumento);
      If Not Result then
        Break;
      ProgressBar.Progress := ProgressBar.Progress + 1;
      Next;
    end;
  end;
end;

function TCtrlAcertaLanctoImovel.DeletaRateioDocumentos(const piDocumento : Integer) : Boolean;
var sSql : String;
begin
  sSql := 'Delete From RateioDocum' + #13 +
          'where coddocumento = '+IntToStr(piDocumento);
  try
    ExecSql(sSql);
    Result := True;
  Except
    on E : Exception do
    begin
      MessageInfo := E.Message;
      Raise Exception.Create(E.Message);
    end;
  End;
end;

function TCtrlAcertaLanctoImovel.SelecionarDocumentos: Variant;
var sSql : String;
begin
  sSql := 'Select distinct l.IdContratoImovel,' + #13 +
          '                l.CodDocumento,' + #13 +
          '                d.DataVencto,'+#13+
          '                d.NoDocumento,'+#13+
          '                ld.valor,' + #13 +
          '                rd.codtiprecdes,' + #13 +
          '                rd.recpag,' + #13 +
          '                rd.unidnegoc,' + #13 +
          '                rd.plano,' + #13 +
          '                rd.CodCentroCusto,' + #13 +
          '                rd.IdEmpresa,' + #13 +
          '                rd.IdProcesso,' + #13 +
          '                rd.Idprograma,' + #13 +
          '                rd.Codcentrorespon' + #13 +
          'From lancamentosimovel l,' + #13 +
          '     imovel i,' + #13 +
          '     Documento d,' + #13 +
          '     LanctoDocum ld,' + #13 +
          '     RateioDocum rd,' + #13 +
          '     PlanoPatroxImovel PPI,' + #13 +
          '     ContratoxImovel CXI' + #13 +
          'where l.idimovel = i.idimovel' + #13 +
          '  and d.coddocumento = l.coddocumento' + #13 +
          '  and d.coddocumento = ld.coddocumento' + #13 +
          '  and d.coddocumento = rd.coddocumento' + #13 +
          '  and l.IDContratoImovel = CXI.Idcontratoimovel(+)' + #13 +
          '  and CXI.idImovel = PPI.idImovel' + #13 +
          '  and d.recpag = ''R''' + #13 +
          '  and l.coddocumento is not null' + #13 +
          '  and l.IdContratoImovel is not null' + #13 +
          '  and ld.operacao = 2' + #13 +
          '  and not exists (select 1' + #13 +
          '                  From lanctodocum ldd' + #13 +
          '                  where ldd.operacao = 5' + #13 +
          '                    and ldd.coddocumento = d.coddocumento)' + #13 +
          '  and d.DataVencto >= to_date('+QuotedStr(DateToStr(DataInicial))+',''dd/mm/yyyy'')';
  If IdImovel > 0 then
    sSql :=  sSql + #13  + '  and l.idImovel = '+IntToStr(IdImovel);
  If IdContrato > 0 then
    sSql := sSql + #13 + '  and l.idContratoImovel = '+IntToStr(IdContrato);
  Result := GetDataPacket(sSql);
end;

function TCtrlAcertaLanctoImovel.CriarRateioDocumento(const pIdContrato,pIdCodDocumento: integer): Boolean;
var rValor, rValorTotal, rValorAcumulado : Double;
begin
  Result := False;
  rValorAcumulado := 0;
  rValorTotal := _cdsDocumentos.FieldByName('Valor').asFloat;

  _CdsRateio.Data := CtrlComumImob.RetornaRateioPlanoxContrato(pIdContrato);

  If _CdsRateio.IsEmpty then
  begin
    _cdsRateio.Close;
    Raise Exception.Create('O Contrato '+IntToStr(pIdContrato)+' Não possue rateios !');
  end;

  While Not _CdsRateio.Eof Do
  begin
    rValor := RoundCm(rValorTotal * (_CdsRateio.FieldByName('PERCENTRATEIO').asFloat / 100),2);
    If _CdsRateio.Recno = _CdsRateio.recordCount then
      rValor := rValorTotal - rValorAcumulado
    else
      rValorAcumulado := rValorAcumulado + rValor;
    Result := InsereRateioDocumentos(rValor,
                                     pIdCodDocumento,
                                     _cdsDocumentos.FieldByName('Unidnegoc').asInteger,
                                     Sistema.IdUsuario,
                                     _cdsDocumentos.FieldByName('Plano').AsInteger,
                                     _cdsRateio.FieldByName('IDPLANOPREV').asInteger,
                                     _cdsRateio.FieldByName('IDPATRO').asInteger,
                                     _cdsDocumentos.FieldByName('Idprograma').asInteger,
                                     _cdsDocumentos.FieldByName('Idprocesso').AsInteger,
                                     _cdsDocumentos.FieldByName('CodTipRecDes').AsString,
                                     _cdsDocumentos.FieldByName('Recpag').asString,
                                     _cdsDocumentos.FieldByName('CodCentroRespon').asString,
                                     _cdsDocumentos.FieldByName('CodCentroCusto').asString);
    If Not Result then
    begin
      _cdsRateio.Close;
      Raise Exception.Create('O Contrato '+IntToStr(pIdContrato)+' Não possue rateios !');
    end;
    _CdsRateio.Next;
  end;
  _CdsRateio.Close;
end;

function AjustaValor(Const rValor : Double) : String;
begin
 Result := FormatFloat('###.00',rValor);
 Result := StringReplace(Result,',','.',[rfReplaceAll,rfIgnoreCase]);
end;

Function TCtrlAcertaLanctoImovel.InsereRateioDocumentos(prValor          : Double;
                                                        pIdCodDocumento  : Integer;
                                                        pIdUnidnegoc     : Integer;
                                                        pIdUsuario       : Integer;
                                                        pIdPlano         : Integer;
                                                        pIdPlanoPrev     : Integer;
                                                        pIdPatro         : Integer;
                                                        pIdPrograma      : Integer;
                                                        pIdProcesso      : Integer;
                                                        pCodTipRecDes    : String;
                                                        pRecpag          : String;
                                                        pCodCentroRespon : String;
                                                        pCodCentroCusto  : String) : Boolean;
Var sSql : String;
    iSeqIdRateioDocum : Int64;
    sValor : String;
begin
  Try
    sValor := AjustaValor(prValor);
    iSeqIdRateioDocum := GetSequence('RATEIODOCUM');
    sSql := 'Insert Into RateioDocum(CODDOCUMENTO,CODTIPRECDES,'+#13+
            '                        RECPAG,IDPESSOA,'+#13+
            '                        CODCENTRORESPON,UNIDNEGOC,'+#13+
            '                        VALOR,IDUSUARIOINCLUSAO,'+#13+
            '                        IDRATEIODOCUM,IDEMPRESA,'+#13+
            '                        CODCENTROCUSTO,PLANO,'+#13+
            '                        IDPATRO,IDPROGRAMA,'+#13+
            '                        IDPLANOPREV)'+#13+
            'Values('+IntToStr(pIdCodDocumento)+','+QuotedStr(pCodTipRecDes)+','+#13+
            '       '+QuotedStr(pRecPag)+',1,'+#13+
            '       '+QuotedStr(pCodCentroRespon)+','+IntToStr(pIdUnidnegoc)+','+#13+
            '       '+sValor+','+IntToStr(pIdUsuario)+','+#13+
            '       '+IntToStr(iSeqIdRateioDocum)+',1,'+#13+
            '       '+QuotedStr(pCodCentroCusto)+','+IntToStr(pIdPlano)+','+#13+
            '       '+IntToStr(pIdPatro)+','+IntToStr(pIdPrograma)+','+#13+
            '       '+IntToStr(pIdPlanoPrev)+')';
    ExecSql(sSql);
    Result := True;
  Except
    on E : Exception do
    begin
      MessageInfo := E.Message;
      Raise Exception.Create(E.Message);
    end;
  End;
end;


{ TLancamentos }

function TLancamentos.Add: tDadosLancamento;
begin
  Result := TDadosLancamento.Create;
  fDados.Add(Result);
end;

procedure TLancamentos.Clear;
begin
  While Count > 0 do
    Delete(0);
  FDados.Clear;
end;

function TLancamentos.Count: Integer;
begin
  Result := FDados.Count;
end;

constructor TLancamentos.Create;
begin
  fDados := tList.Create;
  fDados.Clear;
end;

procedure TLancamentos.Delete(const pIndex: Integer);
begin
  tDadosLancamento(FDados[pIndex]).Free;
  FDados.Delete(pIndex);
end;

destructor TLancamentos.Destroy;
begin
  inherited;
  Clear;
  FreeAndNil(fDados);
end;

function TLancamentos.GetDadosLancamento(Index: Integer): tDadosLancamento;
begin
  Result := fDados[Index];
end;

procedure TLancamentos.SetDadosLancamento(Index: Integer;
  const Value: tDadosLancamento);
begin
  fDados[Index] := Value;
end;

end.
