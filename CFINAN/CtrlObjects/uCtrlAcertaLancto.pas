unit uCtrlAcertaLancto;

interface

Uses Forms, Classes, SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
     uCtrlLancamento, uSistema, uCmMath, dialogs, StdCtrls, Gauges, dbClient,
     uCtrlImobLancamento;

Type
  tRateio = Class
    CODTIPRECDES,
    RECPAG,
    CODCENTRORESPON,
    UNIDNEGOC,
    IDPESSOA,
    IDEMPRESA,
    CODCENTROCUSTO,
    PLANO,
    IDPROGRAMA,
    IDPATROORIGEM,
    IDPLANOORIGEM : String;
  end;

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
    idModulo            : Integer;
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


  TCtrlAcertaLancto = class(TCmControlObject)
  private
    lstPlanilha : TStringList;
    function SelecionaCCBaixasXDocum(const oQryRateio: TCMClientDataSet;
                                     Const pIdCodDocumento : Integer): Boolean;
  protected
    CtrlLancto     : tCtrlLancamento;
    CtrlImobLancto : tCtrlImobLancamento;
    procedure AfterInitialize;  Override;

    // Metodos de processamento
    function ProcessarLancamentos(const pIdCodDocumento : integer;
                                  const pIdPlnCodigo    : Integer;
                                  const pNumDocumento   : String;
                                  const pValorDocumento,
                                        pValorLiquido   : Double) : Boolean;
    function SelecionarLancamentos(const pIdCodDocumento : integer;
                                   const pIDPlnCodigo : integer) : Variant;
    function SelecionarLancamentosApropriacao(const pIdCodDocumento : integer;
                                              const pIDPlnCodigo : integer) : Variant;
    function ExcluirLancamentos(const pIdLancto,pIdPlanilha: Integer) : Boolean;
    function RefazerLancamentos(const pIdCodDocumento : integer;
                                const pNumDocumento   : String;
                                const aDados          : tDadosLancamento;
                                Const pValorDocumento,
                                      pValorLiquido   : Double ) : Boolean;
    function InserirLancamentoContabil(const pIdCodDocumento : Integer;
                                       const pNumDocumento   : String;
                                       const prValor         : Double;
                                       const aDados          : TDadoslancamento;
                                       Const pIdPlanoPrev,
                                             pIdPatro        : Integer   ) : Boolean;
    function  ProcessarDocumentos  : Boolean;  // Ok
    function  SelecionarDocumentos : OleVariant;
    procedure LocalizaCCustoContaContabil(aDados : TDadosLancamento);
    procedure CarregarDadosFixosLancto(const oQryLanc : TCmClientDataSet;
                                       const aDados : tDadosLancamento);

    function  AcertaLancamentosFinanceiros(const pIdCodDocumento,
                                                 pTipoDocumento  : Integer;
                                           Const pCodTipRecDes   : String;
                                           const pValor          : Double;
                                           const pValorDocumento : Double;
                                           const pValorLiquido   : Double): Boolean;
    function  SelecionarLancamentosFinanceiros(const pIdCodDocumento,
                                                     pTipoDocumento  : Integer;
                                               const pCodTipRecDes   : String   ): Variant;
    function  DesfazValorRateioFinanc(Const pCodLancFinanc,
                                            pIdRateioFinanc : integer;
                                      Const pValor          : Double): Boolean;
    function  AtualizaLancamentosFinanceiros(Const pCodLancFinanc,
                                                   pIdCodDocumento,
                                                   pTipoDocumento  : Integer;
                                             Const pValorDocumento,
                                                   pValorLiquido     : Double) : Boolean;
    function  SelecionaPlanoPGA(var pIdPlano, pIdPatro: Double): Boolean;
    function  RetornaRateioDocumento(const pIdCodDocumento: Integer): Variant;

    function  ProcessarDocumentos2010  : Boolean;
    function  SelecionarDocumentos2010 : OleVariant;
    function  AjustaTabelaRateioDocum(const pIdCodDocumento,
                                            pIdPlnCodigo,
                                            pIdRateioDocum,
                                            pIdModulo        : Integer;
                                      const pCodTipRecDes    : String;
                                      const pValor,
                                            pValorDocumento  : Double;
                                      Const pNumDocumento    : String): Boolean;
    function TemFinanciamentoHabitacional(const pCodTipRecDes: String): Boolean;
    function AcertaRateioNormal(const pIdCodDocumento,
                                      pIdRateioDocum: Integer): Boolean;
    function AcertaRateioFinanciamento(Const pIdCodDocumento,
                                             pIdRateioDocum: Integer;
                                       Const pValor        : Double): Boolean;
    function RefazerRateioDocumentoImob(const pIdCodDocumento,
                                              pIdRateioDocum   : Integer;
                                        const pValor: Double): Boolean;
    function RetornaRateioPlanoPatro(const pIDCodDocumento: Integer): OleVariant;
    function AtualizaPlanilha(Const pIdPlnCodigo: Integer;
                              Const pDataLancto : TDateTime) : Boolean;
    function ExcluiLancamentosFinanceirosZerados(const pCodLancFinanc : Integer): Boolean;
    function ProcessarLancamentosImobiliario(const pIdCodDocumento,
                                                   pIdPlnCodigo: Integer;
                                             const pNumDocumento: String;
                                             const pValorDocumento,
                                                   pValorLiquido : Double;
                                             const pApropriacao  : boolean): Boolean;
    function RefazerLancamentosImobiliario(const pIdCodDocumento : integer;
                                           const pNumDocumento   : String;
                                           const aDados          : tDadosLancamento;
                                           Const pValorDocumento,
                                                 pValorLiquido   : Double ) : Boolean;
    function RefazerLancamentosImobiliarioApropriacao(const pIdCodDocumento: integer;
                                                      const pNumDocumento: String;
                                                      const aDados: tDadosLancamento;
                                                      const pValorDocumento,
                                                            pValorLiquido: Double): Boolean;
    function InserirLancamentoContabilImobiliario(const pIdCodDocumento : Integer;
                                                  const pNumDocumento   : String;
                                                  const prValor         : Double;
                                                  const aDados          : TDadoslancamento;
                                                  Const pIdPlanoPrev,
                                                        pIdPatro        : Integer   ) : Boolean;
    Function AcertaCCBaixasXDocum(Const pIdCodDocumento: Integer) : Boolean;
  public
    DataInicial : TDateTime;
    idImovel    : Integer;
    IdContrato  : Integer;
    ProgressBar : TGauge;
    lblStatus   : tLabel;
    bProcessaDocumentos     : Boolean;
    bProcessaDocumentos2010 : Boolean;
    bAcertaFinanc : Boolean;
    bAcertaContab : Boolean;
    Constructor Create; override;
    Destructor  Destroy; override;
    Function    Processar : Boolean;
  end;


implementation

function AjustaValor(Const rValor : Double) : String;
begin
  Result := StringReplace(FormatFloat('##0.00',rValor),',','.',[rfReplaceAll,rfIgnoreCase]);
end;

constructor TCtrlAcertaLancto.Create;
begin
  inherited;
  CtrlLancto     := tCtrlLancamento.Create;
  CtrlImobLancto := tCtrlImobLancamento.Create;
  lstPlanilha := TStringList.Create;
end;

destructor TCtrlAcertaLancto.Destroy;
begin
  inherited;
  lstPlanilha.Clear;
  FreeAndNil(lstPlanilha);
  FreeAndNil(CtrlLancto);
  FreeAndNil(CtrlImobLancto);
end;

procedure TCtrlAcertaLancto.AfterInitialize;
begin
  inherited;
  CtrlLancto.InitializeAs(Self);
  CtrlImobLancto.InitializeAs(Self);
end;

procedure TCtrlAcertaLancto.CarregarDadosFixosLancto(const oQryLanc : TCmClientDataSet;
                                                     const aDados : tDadosLancamento);
begin
  aDados.iPlanilha   := oQryLanc.FieldByName('PlnCodigo').asInteger;
  aDados.iNumLancto  := oQryLanc.FieldByName('LacNumLan').asInteger;
  aDados.TipoOper    := oQryLanc.FieldByName('TipCodigo').asString;
  aDados.sHist1      := oQryLanc.FieldByName('LacHist1').asString;
  aDados.sHist2      := oQryLanc.FieldByName('LacHist2').asString;
  aDados.sHist3      := oQryLanc.FieldByName('LacHist3').asString;
  aDados.sHist4      := oQryLanc.FieldByName('LacHist4').asString;
  aDados.sHist5      := oQryLanc.FieldByName('LacHist5').asString;
  aDados.dDataLancto := oQryLanc.FieldByName('PlnDatDia').asDateTime;
  aDados.IdModulo    := oQryLanc.FieldByName('IDModulo').asInteger;
end;

Function TCtrlAcertaLancto.AtualizaPlanilha(Const pIdPlnCodigo : Integer;
                                            Const pDataLancto  : TDateTime) : Boolean;
var sSql : String;
    sLinha : String;
begin
  sLinha := 'Planilha: ' + IntToStr(pIdPlnCodigo) + ' - Data :' + DateToStr(pDataLancto);
  If lstPlanilha.IndexOf(sLinha) = -1 then
    lstPlanilha.Add(sLinha);

  sSql := 'Update Planilha'+#13#10+
          'Set plnEfetivado = ''N'''+#13#10+
          'where plncodigo = '+IntToStr(pIdPlnCodigo);
  Result := ExecSQL(sSql);
end;

function TCtrlAcertaLancto.ProcessarLancamentos(const pIdCodDocumento : integer;
                                                const pIdPlnCodigo    : Integer;
                                                const pNumDocumento   : String;
                                                const pValorDocumento,
                                                      pValorLiquido   : Double) : Boolean;
var i           : Integer;
    oLancamento : tLancamentos;
    oDados      : tDadosLancamento;
    oQryLanc    : TCmClientDataSet;
begin
  Result := True;
  oLancamento := TLancamentos.Create;
  oQryLanc := TCmClientDataSet.Create(Nil);
  Try
    oQryLanc.Data := SelecionarLancamentos(pIdCodDocumento,pIdPlnCodigo);
    If oQryLanc.FieldbyName('plnEfetivado').asString = 'S' then
      AtualizaPlanilha(pIdPlnCodigo,oQryLanc.FieldByName('PlnDatDia').asDateTime);
    while not oQryLanc.Eof do
    begin
      oDados := oLancamento.Add;
      CarregarDadosFixosLancto(oQryLanc,oDados);
      LocalizaCCustoContaContabil(oDados);
      Result := ExcluirLancamentos(oDados.iNumLancto,oDados.iPlanilha);
      If Not Result then
        Break;
      oQryLanc.Next;
    end;
    If Result then
      For i := 0 to oLancamento.Count-1 do
        Result := RefazerLancamentos(pIdCodDocumento,
                                     pNumDocumento,
                                     oLancamento.Dados[i],
                                     pValorDocumento,
                                     pValorLiquido);
    oQryLanc.Close;
  Finally
    FreeAndNil(oLancamento);
    FreeAndNil(oQryLanc);
  End;
end;

function TCtrlAcertaLancto.ProcessarLancamentosImobiliario(const pIdCodDocumento : integer;
                                                           const pIdPlnCodigo    : Integer;
                                                           const pNumDocumento   : String;
                                                           const pValorDocumento,
                                                                 pValorLiquido   : Double;
                                                           Const pApropriacao    : Boolean) : Boolean;
var i           : Integer;
    oLancamento : tLancamentos;
    oDados      : tDadosLancamento;
    oQryLanc    : TCmClientDataSet;
begin
  Result := True;
  oLancamento := TLancamentos.Create;
  oQryLanc := TCmClientDataSet.Create(Nil);
  Try
    If pApropriacao then
      oQryLanc.Data := SelecionarLancamentosApropriacao(pIdCodDocumento,pIdPlnCodigo)
    else
      oQryLanc.Data := SelecionarLancamentos(pIdCodDocumento,pIdPlnCodigo);
    If oQryLanc.FieldbyName('plnEfetivado').asString = 'S' then
      AtualizaPlanilha(pIdPlnCodigo,oQryLanc.FieldByName('PlnDatDia').asDateTime);
    while not oQryLanc.Eof do
    begin
      oDados := oLancamento.Add;
      CarregarDadosFixosLancto(oQryLanc,oDados);
      LocalizaCCustoContaContabil(oDados);
      Result := ExcluirLancamentos(oDados.iNumLancto,oDados.iPlanilha);
      If Not Result then
        Break;
      oQryLanc.Next;
    end;
    If Result then
    begin
      For i := 0 to oLancamento.Count-1 do
      begin
        If pApropriacao then
          Result := RefazerLancamentosImobiliarioApropriacao(pIdCodDocumento,
                                                             pNumDocumento,
                                                             oLancamento.Dados[i],
                                                             pValorDocumento,
                                                             pValorLiquido)
        else
          Result := RefazerLancamentosImobiliario(pIdCodDocumento,
                                                  pNumDocumento,
                                                  oLancamento.Dados[i],
                                                  pValorDocumento,
                                                  pValorLiquido);
      end;
    end;
    oQryLanc.Close;
  Finally
    FreeAndNil(oLancamento);
    FreeAndNil(oQryLanc);
  End;
end;

Function TCtrlAcertaLancto.SelecionarLancamentos(const pIdCodDocumento : integer;
                                                 const pIdPlnCodigo    : Integer) : Variant;
var sSql : String;
begin
  sSql := 'Select distinct l.PlnCodigo,'+#13#10+
          '       l.idmodulo,l.lacnumlan, p.plndatdia,'+#13#10+
          '       p.PlnEfetivado,P.TipCodigo,'+#13#10+
          '       l.lachist1, l.lachist2, l.lachist3,'+#13#10+
          '       l.lachist4, l.lachist5'+#13#10+
          'from planilha p, lancamento l'+#13#10+
          'where l.plncodigo = p.plncodigo'+#13#10+
          '  and l.coddocumento = '+IntToStr(pIdCodDocumento)+#13#10+
          '  and p.plncodigo = '+IntToStr(pIdPlnCodigo);
  Result := GetDataPacket(sSql);
end;

function TCtrlAcertaLancto.ExcluirLancamentos(Const pIdLancto,pIdPlanilha : Integer) : Boolean;
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

procedure TCtrlAcertaLancto.LocalizaCCustoContaContabil(aDados : TDadosLancamento);
Var sSql : String;
    oQry : TCmClientDataSet;
begin
  oQry := TCmClientDataSet.Create(nil);
  Try
    sSql := 'Select CodCentroCusto as CodCustoDebito,'+#13#10+
            '       PlaConta       as ContaDebito,'+#13#10+
            '       UnidNegoc,'+#13#10+
            '       Plano'+#13#10+
            'from lancamento'+#13#10+
            'where plncodigo = '+IntToStr(aDados.iPlanilha)+#13#10+
            '  and LacNumLan = '+IntToStr(aDados.iNumLancto)+#13#10+
            '  and LACDebCre = ''D''';
    oQry.Data := GetDataPacket(sSql);
    aDados.IdPlano           := oQry.FieldByName('Plano').asInteger;
    aDados.UnidNegoc         := oQry.FieldByName('UnidNegoc').asInteger;
    aDados.CentroCustoDebito := oQry.FieldbyName('CodCustoDebito').asString;
    aDados.ContaDebito       := oQry.FieldByName('ContaDebito').asString;
    oQry.Close;
    sSql := 'Select CodCentroCusto as CodCustoCredito,'+#13#10+
            '       PlaConta       as ContaCredito'+#13#10+
            'from lancamento'+#13#10+
            'where plncodigo = '+IntToStr(aDados.iPlanilha)+#13#10+
            '  and LacNumLan = '+IntToStr(aDados.iNumLancto)+#13#10+
            '  and LACDebCre = ''C''';
    oQry.Data := GetDataPacket(sSql);
    aDados.CentroCustoCredito := oQry.FieldbyName('CodCustoCredito').asString;
    aDados.ContaCredito       := oQry.FieldByName('ContaCredito').asString;
    oQry.Close;
 Finally
   FreeAndNil(oQry);
 end;
end;

Function TCtrlAcertaLancto.RefazerLancamentos(Const pIdCodDocumento : integer;
                                              Const pNumDocumento   : String;
                                              Const aDados          : TDadosLancamento;
                                              Const pValorDocumento,
                                                    pValorLiquido   : Double) : Boolean;
var rValorAjustado,
    rCorrigeArredondamento : Double;
    oQryRateio : TCMClientDataSet;
    iIdPlanoPrev,
    iIdPatro : Integer;
begin
  Result := True;
  oQryRateio := TCmClientDataSet.Create(Nil);
  Try
    oQryRateio.Data := RetornaRateioDocumento(pIdCodDocumento);
    If oQryRateio.IsEmpty then
      Raise Exception.Create('O Documento '+IntToStr(pIdCodDocumento)+' não possue rateios !');
    While Not oQryRateio.Eof Do
    begin
      iIdPlanoPrev   := oQryRateio.FieldByName('IdPlanoPrev').asInteger;
      iIdPatro       := oQryRateio.FieldByName('IDPatro').asInteger;
      rValorAjustado := oQryRateio.FieldByName('Valor').asFloat;

      If pValorLiquido <> pValorDocumento then
      begin
        rValorAjustado := RoundCM(( rValorAjustado / pValorDocumento) * pValorLiquido,2);
        rCorrigeArredondamento := rCorrigeArredondamento + rValorAjustado;
        If oQryRateio.Recno = oQryRateio.RecordCount then
          rValorAjustado := pValorLiquido - rCorrigeArredondamento;
      end;
      Result := InserirLancamentoContabil(pIdCodDocumento,
                                          pNumDocumento,
                                          rValorAjustado,
                                          aDados,
                                          oQryRateio.FieldByName('IdPlanoPrev').asInteger,
                                          oQryRateio.FieldByName('IDPatro').asInteger);
      If Not Result then
        Break;
      oQryRateio.Next;
    end;
    oQryRateio.Close;
  finally
    FreeAndNil(oQryRateio);
  end;
end;

Function TCtrlAcertaLancto.RetornaRateioDocumento(const pIdCodDocumento : Integer) : Variant;
var sSql : String;
begin
  sSql := 'Select CODDOCUMENTO,'      + #13#10 +
          '       RECPAG,'            + #13#10 +
          '       IDPESSOA,'          + #13#10 +
          '       CODCENTRORESPON,'   + #13#10 +
          '       UNIDNEGOC,'         + #13#10 +
          '       VALOR,'             + #13#10 +
          '       CODCENTROCUSTO,'    + #13#10 +
          '       PLANO,'             + #13#10 +
          '       IDPATRO,'           + #13#10 +
          '       IDPROGRAMA,'        + #13#10 +
          '       IDPLANOPREV'        + #13#10 +
          'from VW_RATEIODOCUM R' + #13#10 +
          'WHERE R.CODDOCUMENTO = '   + IntToStr(pIdCodDocumento)         + #13#10 +
          '  AND R.EXERCICIO = '+QuotedStr(FormatDateTime('YYYY',DataInicial));
  Result := GetDataPacket(sSql);
end;

Function TCtrlAcertaLancto.InserirLancamentoContabil(Const pIdCodDocumento : Integer;
                                                     Const pNumDocumento   : String;
                                                     Const prValor         : Double;
                                                     const aDados          : tDadosLancamento;
                                                     Const pIdPlanoPrev,
                                                           pIdPatro        : Integer) : Boolean;
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
                                           pIdPlanoPrev,  // ok
                                           pIdPatro,      // ok
                                           aDados.iPlanilha,                                      // ok
                                           -1,
                                           DateToStr(aDados.dDataLancto),
                                           pNumDocumento,
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
                                           prValor,
                                           false,
                                           True,
                                           -1,
                                           0,
                                           -1,
                                           false,
                                           piDCodDocumento,
                                           false);
  except
    MessageInfo := CtrlLancto.MessageInfo;
    Result := False;
  end;
end;

function TCtrlAcertaLancto.Processar : boolean;
begin
  Result := True;
  try
    StartTransaction;
    If bProcessaDocumentos then
      Result := ProcessarDocumentos;  // Acertos Corretos

    If bProcessaDocumentos2010 and Result then
      Result := ProcessarDocumentos2010;  // Fazer acertos

    If Result then
    begin
      If lstPlanilha.Count > 0 then
      begin
        lstPlanilha.SaveToFile('c:\Planus\Temp\ListaPlanilhasAlteradas'+FormatDateTime('YYYYMMDD',DataInicial)+'.txt');
        lstPlanilha.Clear;
      end;
      Commit
    end
    Else
    begin
      MessageDlg(MessageInfo,MTError,[mbOk],0);
      RollBack;
      Result := False;
    end;
  except
    on E : Exception do
    begin
      Result := False;
      Rollback;
      MessageInfo := E.Message;
      MessageDlg(MessageInfo,MTError,[mbOk],0);
    end;
  end;
end;

function TCtrlAcertaLancto.ProcessarDocumentos : Boolean;
var iDocumento,
    iOldDocumento,
    iPlnCodigo,
    iTipoDocumento  : Integer;
    NumDocumento,
    sCodTipRecDes   : String;
    rValor          : Double;
    rValorLiquido   : Double;
    rValorDocumento : Double;
    oQryDocumentos  : TCmClientDataSet;

begin
  Result := False;
  oQryDocumentos := TCmClientDataSet.Create(nil);
  Try
    oQryDocumentos.Data := SelecionarDocumentos();
    ProgressBar.MaxValue := oQryDocumentos.RecordCount;
    While not oQryDocumentos.Eof do
    begin
      lblStatus.Caption := '';
      iDocumento      := oQryDocumentos.FieldByName('CodDocumento').asInteger;
      NumDocumento    := oQryDocumentos.FieldbyName('NoDocumento').asString;
      sCodTipRecDes   := oQryDocumentos.FieldByName('CodTipRecDes').asString;
      iPlnCodigo      := oQryDocumentos.FieldByName('PlnCodigo').asInteger;
      rValor          := oQryDocumentos.FieldByName('Valor').asFloat;
      rValorLiquido   := oQryDocumentos.fieldbyName('ValorLiquido').asFloat;
      rValorDocumento := oQryDocumentos.fieldbyName('ValorDocumento').asFloat;
      iTipoDocumento  := oQryDocumentos.FieldByName('CodTipDoc').asInteger;
      lblStatus.Caption := 'Processando Documento ' + IntToStr(iDocumento) + ' - Exercício: 2009 - Baixa: 2010 . . .';
      Application.ProcessMessages;
      If bAcertaFinanc then
        Result := AcertaLancamentosFinanceiros(iDocumento,
                                               iTipoDocumento,
                                               sCodTipRecDes,
                                               rValor,
                                               rValorDocumento,
                                               rValorLiquido);
      If Result and (iDocumento <> iOldDocumento) then
      begin
        If bAcertaContab then
          Result := ProcessarLancamentos(iDocumento,
                                         iPlnCodigo,
                                         NumDocumento,
                                         rValorDocumento,
                                         rValorLiquido);
        iOldDocumento := iDocumento;
      end;
      If Not Result then
        Break;
      ProgressBar.Progress := ProgressBar.Progress + 1;
      oQryDocumentos.Next;
    end;
    oQryDocumentos.Close;
  Finally
    FreeAndNil(oQryDocumentos);
  End;
end;

function TCtrlAcertaLancto.ProcessarDocumentos2010 : Boolean;
var iDocumento,
    iOldDocumento,
    iPlnCodigo,
    iPlnCodAprop,
    iTipoDocumento,
    iIdRateio,
    iIdModulo       : Integer;
    NumDocumento,
    sCodTipRecDes   : String;
    rValor          : Double;
    rValorDocumento : Double;
    rValorLiquido   : Double;
    oQryDocumentos  : TCmClientDataSet;
begin
  Result := True;
  oQryDocumentos := TCmClientDataSet.Create(Nil);
  Try
    oQryDocumentos.Data := SelecionarDocumentos2010();
    ProgressBar.MaxValue := oQryDocumentos.RecordCount;
    ProgressBar.Progress := 0;
    While not oQryDocumentos.Eof do
    begin
      lblStatus.Caption := '';
      iDocumento      := oQryDocumentos.FieldByName('CodDocumento').asInteger;
      iPlnCodigo      := oQryDocumentos.FieldByName('PlnCodigo').asInteger;
      iPlnCodAprop    := oQryDocumentos.FieldByname('PlnCodAprop').asInteger;
      NumDocumento    := oQryDocumentos.FieldbyName('NoDocumento').asString;
      sCodTipRecDes   := oQryDocumentos.FieldByName('CodTipRecDes').asString;
      rValor          := oQryDocumentos.FieldByName('Valor').asFloat;
      rValorDocumento := oQryDocumentos.FieldByName('ValorDocumento').asFloat;
      rValorLiquido   := oQryDocumentos.FieldByName('ValorLiquido').asFloat;
      iTipoDocumento  := oQryDocumentos.FieldByName('CodTipDoc').asInteger;
      iIdRateio       := oQryDocumentos.FieldByName('IDRateioDocum').asInteger;
      iIdModulo       := oQryDocumentos.FieldByName('IdModulo').asInteger;
      lblStatus.Caption := 'Processando Documento ' + IntToStr(iDocumento) + ' - Exercício: 2010 - Baixa: 2010 . . .';
      Application.ProcessMessages;
      AjustaTabelaRateioDocum(iDocumento,
                              iPlnCodigo,
                              iIdRateio,
                              iIdModulo,
                              sCodTipRecDes,
                              rValor,
                              rValorDocumento,
                              NumDocumento);
      If bAcertaFinanc then
        Result := AcertaLancamentosFinanceiros(iDocumento,
                                               iTipoDocumento,
                                               sCodTipRecDes,
                                               rValor,
                                               rValorDocumento,
                                               rValorLiquido);
      If Result and (iDocumento <> iOldDocumento) then
      begin
        If bAcertaContab then
        begin
          If iIdModulo in [ 54,64,135 ] then
          begin
            If iPlnCodAprop <> 0 then
              Result := ProcessarLancamentosImobiliario(iDocumento,
                                                        iPlnCodAprop,
                                                        NumDocumento,
                                                        rValorDocumento,
                                                        rValorLiquido,
                                                        True);
            If Result then
              Result := ProcessarLancamentosImobiliario(iDocumento,
                                                        iPlnCodigo,
                                                        NumDocumento,
                                                        rValorDocumento,
                                                        rValorLiquido,
                                                        False);
          end;
        end
        else
        begin
          Result := ProcessarLancamentos(iDocumento,
                                         iPlnCodigo,
                                         NumDocumento,
                                         rValorDocumento,
                                         rValorLiquido);
        end;
        iOldDocumento := iDocumento;
      end;
      If Not Result then
        Break;
      ProgressBar.Progress := ProgressBar.Progress + 1;
      oQryDocumentos.Next;
    end;
    oQryDocumentos.Close;
  finally
    FreeAndNil(oQryDocumentos);
  End;
end;

Function TCtrlAcertaLancto.AjustaTabelaRateioDocum(Const pIdCodDocumento,
                                                         pIdPlnCodigo,
                                                         pIdRateioDocum,
                                                         pIdModulo       : Integer;
                                                   Const pCodTipRecDes   : String;
                                                   Const pValor,
                                                         pValorDocumento : Double;
                                                   Const pNumDocumento   : String) : Boolean;
begin
  Result := False;
  If pIdModulo in [54,64,135] then
    Result := RefazerRateioDocumentoImob(pIdCodDocumento,
                                         pIdRateioDocum,
                                         pValorDocumento)
  else If TemFinanciamentoHabitacional(pCodTipRecDes) then
    Result := AcertaRateioFinanciamento(pIdCodDocumento,
                                        pIdRateioDocum,
                                        pValor)
  else
    Result := AcertaRateioNormal(pIdCodDocumento,pIdRateioDocum);
end;

Function TCtrlAcertaLancto.RetornaRateioPlanoPatro(const pIDCodDocumento : Integer) : OleVariant;
var sSql : String;
begin
//  sSql := 'SELECT PPI.IDPLANOPREV,' + #13#10 +
//          '       PPI.IDPATRO,' + #13#10 +
//          '       SUM((PPI.PPIPERCENTRATEIO * 100) / PT.PPIPERCENTRATEIO) AS PERCENTRATEIO' + #13#10 +
//          '  FROM PLANOPATROXIMOVEL PPI,' + #13#10 +
//          '       CONTRATOXIMOVEL CXI,' + #13#10 +
//          '       CONTRATOIMOVEL CTI,' + #13#10 +
//          '       LANCAMENTOSIMOVEL LIM,' + #13#10 +
//          '       (SELECT SUM(PPI.PPIPERCENTRATEIO) AS PPIPERCENTRATEIO' + #13#10 +
//          '          FROM PLANOPATROXIMOVEL PPI,' + #13#10 +
//          '               CONTRATOXIMOVEL   CXI,' + #13#10 +
//          '               CONTRATOIMOVEL    CTI,' + #13#10 +
//          '               LANCAMENTOSIMOVEL LIM' + #13#10 +
//          '         WHERE LIM.CODDOCUMENTO = '  + InttoStr(pIdCodDocumento) + #13#10 +
//          '           AND LIM.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL' + #13#10 +
//          '           AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL' + #13#10 +
//          '           AND PPI.IDIMOVEL = CXI.IDIMOVEL) PT' + #13#10 +
//          ' WHERE LIM.CODDOCUMENTO = ' + InttoStr(pIdCodDocumento) + #13#10 +
//          '   AND LIM.IDCONTRATOIMOVEL = CTI.IDCONTRATOIMOVEL' + #13#10 +
//          '   AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL' + #13#10 +
//          '   AND PPI.IDIMOVEL = CXI.IDIMOVEL' + #13#10 +
//          ' GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO, PT.PPIPERCENTRATEIO' + #13#10 +
//          'UNION' + #13#10 +
//          'SELECT PPI.IDPLANOPREV,' + #13#10 +
//          '       PPI.IDPATRO,' + #13#10 +
//          '       SUM((PPI.PPIPERCENTRATEIO * 100) / PT.PPIPERCENTRATEIO) AS PERCENTRATEIO' + #13#10 +
//          '  FROM PLANOPATROXIMOVEL PPI,' + #13#10 +
//          '       IMOVEL I,' + #13#10 +
//          '       LANCAMENTOSIMOVEL LIM,' + #13#10 +
//          '       (SELECT SUM(PPI.PPIPERCENTRATEIO) AS PPIPERCENTRATEIO' + #13#10 +
//          '          FROM PLANOPATROXIMOVEL PPI, IMOVEL I, LANCAMENTOSIMOVEL LIM' + #13#10 +
//          '         WHERE LIM.CODDOCUMENTO = ' + InttoStr(pIdCodDocumento) + #13#10 +
//          '           AND I.IDIMOVEL = LIM.IDIMOVEL' + #13#10 +
//          '           AND PPI.IDIMOVEL = I.IDIMOVEL) PT' + #13#10 +
//          ' WHERE LIM.CODDOCUMENTO = ' + InttoStr(pIdCodDocumento) + #13#10 +
//          '   AND I.IDIMOVEL = LIM.IDIMOVEL' + #13#10 +
//          '   AND PPI.IDIMOVEL = I.IDIMOVEL' + #13#10 +
//          '   AND LIM.IDCONTRATOIMOVEL IS NULL' + #13#10 +
//          ' GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO, PT.PPIPERCENTRATEIO' + #13#10 +
//          'UNION' + #13#10 +
//          'SELECT PPI.IDPLANOPREV,' + #13#10 +
//          '       PPI.IDPATRO,' + #13#10 +
//          '       SUM((PPI.PPIPERCENTRATEIO * 100) / PT.PPIPERCENTRATEIO) AS PERCENTRATEIO' + #13#10 +
//          '  FROM PLANOPATROXIMOVEL PPI,' + #13#10 +
//          '       CONTRATOXIMOVEL CXI,' + #13#10 +
//          '       CONDPAGIMOVEL CPI,' + #13#10 +
//          '       PARCFINANCIMOV PFI,' + #13#10 +
//          '       (SELECT SUM(PPI.PPIPERCENTRATEIO) AS PPIPERCENTRATEIO' + #13#10 +
//          '          FROM PLANOPATROXIMOVEL PPI,' + #13#10 +
//          '               CONTRATOXIMOVEL   CXI,' + #13#10 +
//          '               CONDPAGIMOVEL     CPI,' + #13#10 +
//          '               PARCFINANCIMOV    PFI' + #13#10 +
//          '         WHERE PFI.CODDOCUMENTO = ' + InttoStr(pIdCodDocumento) + #13#10 +
//          '           AND CPI.IDCONDPAGIMOVEL = PFI.IDCONDPAGIMOVEL' + #13#10 +
//          '           AND CXI.IDCONTRATOIMOVEL = CPI.IDCONTRATOIMOVEL' + #13#10 +
//          '           AND PPI.IDIMOVEL = CXI.IDIMOVEL) PT' + #13#10 +
//          ' WHERE PFI.CODDOCUMENTO = ' + InttoStr(pIdCodDocumento) + #13#10 +
//          '   AND CPI.IDCONDPAGIMOVEL = PFI.IDCONDPAGIMOVEL' + #13#10 +
//          '   AND CXI.IDCONTRATOIMOVEL = CPI.IDCONTRATOIMOVEL' + #13#10 +
//          '   AND PPI.IDIMOVEL = CXI.IDIMOVEL' + #13#10 +
//          ' GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO, PT.PPIPERCENTRATEIO' + #13#10 +
//          ' ORDER BY PERCENTRATEIO DESC';

  sSql := 'SELECT PPI.IDPLANOPREV,' + #13#10 +
          '       PPI.IDPATRO,' + #13#10 +
          '       SUM((PPI.PPIPERCENTRATEIO * 100) / PT.PPIPERCENTRATEIO) AS PERCENTRATEIO' + #13#10 +
          '  FROM PLANOPATROXIMOVEL PPI,' + #13#10 +
          '       IMOVEL I,' + #13#10 +
          '       LANCAMENTOSIMOVEL LIM,' + #13#10 +
          '       (SELECT SUM(PPI.PPIPERCENTRATEIO) AS PPIPERCENTRATEIO' + #13#10 +
          '          FROM PLANOPATROXIMOVEL PPI, IMOVEL I, LANCAMENTOSIMOVEL LIM' + #13#10 +
          '         WHERE LIM.CODDOCUMENTO = '  + InttoStr(pIdCodDocumento) + #13#10 +
          '           AND I.IDIMOVEL = LIM.IDIMOVEL' + #13#10 +
          '           AND PPI.IDIMOVEL = I.IDIMOVEL) PT' + #13#10 +
          ' WHERE LIM.CODDOCUMENTO = '  + InttoStr(pIdCodDocumento) + #13#10 +
          '   AND I.IDIMOVEL = LIM.IDIMOVEL' + #13#10 +
          '   AND PPI.IDIMOVEL = I.IDIMOVEL' + #13#10 +
          ' GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO, PT.PPIPERCENTRATEIO' + #13#10 +
          'UNION all' + #13#10 +
          'SELECT PPI.IDPLANOPREV,' + #13#10 +
          '       PPI.IDPATRO,' + #13#10 +
          '       SUM((PPI.PPIPERCENTRATEIO * 100) / PT.PPIPERCENTRATEIO) AS PERCENTRATEIO' + #13#10 +
          '  FROM PLANOPATROXIMOVEL PPI,' + #13#10 +
          '       CONTRATOXIMOVEL CXI,' + #13#10 +
          '       CONDPAGIMOVEL CPI,' + #13#10 +
          '       PARCFINANCIMOV PFI,' + #13#10 +
          '       (SELECT SUM(PPI.PPIPERCENTRATEIO) AS PPIPERCENTRATEIO' + #13#10 +
          '          FROM PLANOPATROXIMOVEL PPI,' + #13#10 +
          '               CONTRATOXIMOVEL   CXI,' + #13#10 +
          '               CONDPAGIMOVEL     CPI,' + #13#10 +
          '               PARCFINANCIMOV    PFI' + #13#10 +
          '         WHERE PFI.CODDOCUMENTO = ' + InttoStr(pIdCodDocumento) + #13#10 +
          '           AND CPI.IDCONDPAGIMOVEL = PFI.IDCONDPAGIMOVEL' + #13#10 +
          '           AND CXI.IDCONTRATOIMOVEL = CPI.IDCONTRATOIMOVEL' + #13#10 +
          '           AND PPI.IDIMOVEL = CXI.IDIMOVEL) PT' + #13#10 +
          ' WHERE PFI.CODDOCUMENTO = ' + InttoStr(pIdCodDocumento) + #13#10 +
          '   AND CPI.IDCONDPAGIMOVEL = PFI.IDCONDPAGIMOVEL' + #13#10 +
          '   AND CXI.IDCONTRATOIMOVEL = CPI.IDCONTRATOIMOVEL' + #13#10 +
          '   AND PPI.IDIMOVEL = CXI.IDIMOVEL' + #13#10 +
          ' GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO, PT.PPIPERCENTRATEIO' + #13#10 +
          ' ORDER BY PERCENTRATEIO DESC';
  Result := GetDataPacket(sSql);
end;

Function TCtrlAcertaLancto.RefazerRateioDocumentoImob(Const pIdCodDocumento,
                                                            pIdRateioDocum  : Integer;
                                                      Const pValor          : Double) : Boolean;

//---------------------------------------------------------//
     Procedure CarregaDadosRateio(Const pRateio : TRateio);
     var oQry : TCmClientDataSet;
     begin
       oQry := TCmClientDataSet.Create(Nil);
       Try
         oQry.Data := GetDataPacket('Select * from RateioDocum'+#13#10+
                                    'where IdRateioDocum = '+IntToStr(pIdRateioDocum));
         pRateio.Idpessoa        := oQry.FieldByName('IDPESSOA').asString;
         pRateio.CODTIPRECDES    := oQry.FieldByName('CODTIPRECDES').asString;
         pRateio.RECPAG          := oQry.FieldByName('RECPAG').asString;
         pRateio.CODCENTRORESPON := oQry.FieldByName('CODCENTRORESPON').AsString;
         pRateio.UNIDNEGOC       := oQry.FieldByName('UNIDNEGOC').asString;
         pRateio.IDEMPRESA       := oQry.FieldByName('IDEMPRESA').asString;
         pRateio.CODCENTROCUSTO  := oQry.FieldByName('CODCENTROCUSTO').asString;
         pRateio.PLANO           := oQry.FieldByName('PLANO').asString;
         pRateio.IDPROGRAMA      := oQry.FieldByName('IDPROGRAMA').asString;
         pRateio.IDPATROORIGEM   := oQry.FieldByName('IDPATROORIGEM').asString;
         pRateio.IDPLANOORIGEM   := oQry.FieldByName('IDPLANOORIGEM').asString;
         oQry.Close;
       Finally
         FreeAndNil(oQry);
       end;
     end;
//---------------------------------------------------------//
var rValor, rValorTotal : Double;
    oQryRateio : TCmClientDataSet;
    iQteRegistros : integer;
    Rateio : tRateio;
    iSeqRateioDocum : Double;
    sSql : String;

begin
  Rateio := tRateio.Create;
  CarregaDadosRateio(Rateio);

  Result := ExecSQL('Delete From RateioDocum'+#13#10+
                    'where CodDocumento = '+IntToStr(pIdCodDocumento));

  oQryRateio := TCmClientDataSet.Create(Nil);
  try
    rValorTotal := 0;
    oQryRateio.Data := RetornaRateioPlanoPatro(pIdCodDocumento);
    iQteRegistros := oQryRateio.recordCount;
    While Not oQryRateio.Eof Do
    begin
      rValor := RoundCm(pValor * (oQryRateio.FieldByName('PERCENTRATEIO').asFloat / 100),2);
      If oQryRateio.Recno = iQteRegistros then
        rValor := pValor - rValorTotal;
      rValorTotal := rValorTotal  + rValor;
      iSeqRateioDocum := GetSequence('RATEIODOCUM');
      sSql := 'Insert Into RateioDocum(CODDOCUMENTO,'+#13#10+
              '                        CODTIPRECDES,'+#13#10+
              '                        RECPAG,'+#13#10+
              '                        IDPESSOA,'+#13#10+
              '                        CODCENTRORESPON,'+#13#10+
              '                        UNIDNEGOC,'+#13#10+
              '                        VALOR,'+#13#10+
              '                        IDUSUARIOINCLUSAO,'+#13#10+
              '                        IDRATEIODOCUM,'+#13#10+
              '                        IDEMPRESA,'+#13#10+
              '                        CODCENTROCUSTO,'+#13#10+
              '                        PLANO,'+#13#10+
              '                        IDPROGRAMA,'+#13#10+
              '                        IDPATRO,'+#13#10+
              '                        IDPLANOPREV,'+#13#10+
              '                        IDPATROORIGEM,'+#13#10+
              '                        IDPLANOORIGEM)'+#13#10+
              'Values('+IntToStr(pIdCodDocumento)+','+#13#10+
              '       '+QuotedStr(Rateio.CODTIPRECDES)+','+#13#10+
              '       '+QuotedStr(Rateio.RECPAG)+','+#13#10+
              '       '+Rateio.IDPESSOA+','+#13#10+
              '       '+Rateio.CODCENTRORESPON+','+#13#10+
              '       '+Rateio.UNIDNEGOC+','+#13#10+
              '       '+AjustaValor(rValor)+','+#13#10+
              '       '+IntToStr(Sistema.IdUsuario)+','+#13#10+
              '       '+FloatToStr(iSeqRateioDocum)+','+#13#10+
              '       '+Rateio.IDEMPRESA+','+#13#10+
              '       '+QuotedStr(Rateio.CODCENTROCUSTO)+','+#13#10+
              '       '+Rateio.PLANO+','+#13#10+
              '       '+Rateio.IDPROGRAMA+','+#13#10+
              '       '+oQryRateio.FieldByName('IDPATRO').asString+','+#13#10+
              '       '+oQryRateio.FieldByName('IDPLANOPREV').asString+','+#13#10+
              '       '+Rateio.IDPATROORIGEM+','+#13#10+
              '       '+Rateio.IDPLANOORIGEM+')';
      Result := ExecSQL(sSql);
      oQryRateio.Next;
    end;
    oQryRateio.Close;
    If Result then
      Result := AcertaCCBaixasXDocum(pIdCodDocumento);
  finally
    FreeAndNil(Rateio);
    FreeAndNil(oQryRateio);
  end;
end;

Function TCtrlAcertaLancto.AcertaCCBaixasXDocum(Const pIdCodDocumento: Integer) : Boolean;
var oQry,
    oQryAux : TCMClientDataSet;
    rValorTotal,
    rValor,
    iSeqRateioDocum,
    iQteRegistros : Double;
    sSql : String;
begin
  Result := True;
  oQry    := TCmClientDAtaSet.Create(Nil);
  oQryAux := TCmClientDAtaSet.Create(Nil);
  Try
    oQry.Data := GetDataPacket('select IdCCBaixasXDocum,' + #13#10 +
                               '       idpatro,' + #13#10 +
                               '       unidnegoc,' + #13#10 +
                               '       idplanoprev,' + #13#10 +
                               '       idsegregacriter,' + #13#10 +
                               '       plano,' + #13#10 +
                               '       placonta,' + #13#10 +
                               '       valor' + #13#10 +
                               '  from ccbaixasxdocum' + #13#10 +
                               ' where coddocumento = '+IntToStr(pIdCodDocumento));
    oQryAux.Data := RetornaRateioPlanoPatro(pIdCodDocumento);
    while Not oQry.Eof do
    begin
      rValorTotal := 0;
      iQteRegistros := oQryAux.recordCount;
      While Not oQryAux.Eof Do
      begin
        rValor := RoundCm(oQry.FieldByName('Valor').Asfloat * (oQryAux.FieldByName('PERCENTRATEIO').asFloat / 100),2);
        If oQryAux.Recno = iQteRegistros then
          rValor := oQry.FieldByName('Valor').Asfloat - rValorTotal;
        rValorTotal := rValorTotal  + rValor;
        iSeqRateioDocum := GetSequence('CCBAIXASXDOCUM');
        sSql := 'Insert Into CCBAIXASXDOCUM(CODDOCUMENTO,'+#13#10+
                '                           IdCCBaixasXDocum,' + #13#10 +
                '                           unidnegoc,' + #13#10 +
                '                           idsegregacriter,' + #13#10 +
                '                           plano,' + #13#10 +
                '                           placonta,' + #13#10 +
                '                           valor,' + #13#10 +
                '                           IDPATRO,'+#13#10+
                '                           IDPLANOPREV)'+#13#10+
                'Values('+IntToStr(pIdCodDocumento)+','+#13#10+
                '       '+FloatToStr(iSeqRateioDocum)+','+#13#10+
                '       '+oQry.FieldByname('UnidNegoc').asString+','+#13#10+
                '       '+oQry.FieldByName('idSegregaCriter').asstring+','+#13#10+
                '       '+oQry.FieldByName('PLANO').asString+','+#13#10+
                '       '+QuotedStr(oQry.FieldByName('PLAconta').asString)+','+#13#10+
                '       '+AjustaValor(rValor)+','+#13#10+
                '       '+oQryAux.FieldByName('IDPATRO').asString+','+#13#10+
                '       '+oQryAux.FieldByName('IDPLANOPREV').asString+')';
        Result := ExecSQL(sSql);
        oQryAux.Next;
      End;
      If Result then
        Result := ExecSql('Delete From CCBaixasXDocum'+#13#10+
                          'where IdCCBaixasXDocum = '+
                           oQry.FieldByName('IdCCBaixasXDocum').asString);
      oQry.Next;
    end;
    oQry.Close;
  Finally
    FreeAndNil(oQry);
    FreeAndNil(oQryAux);
  End;
end;


Function TCtrlAcertaLancto.AcertaRateioFinanciamento(Const pIdCodDocumento,
                                                           pIdRateioDocum  : Integer;
                                                     Const pValor          : Double) : Boolean;
var oQry,
    oQryAux : TCMClientDataSet;
    rValorTotal,
    rVal,
    iSeqRateioDocum,
    iQteRegistros : Double;
    sSql : String;
begin
  oQry := TCmClientDataSet.Create(Nil);
  oQryAux := TCmClientDataSet.Create(Nil);
  Try
    oQry.Data := GetDataPacket('SELECT C.IDSEGREGACRITER,'+#13#10+
                               '       C.DESCRICAO,'+#13#10+
                               '       D.DATAINI,'+#13#10+
                               '       D.DATAFIM,'+#13#10+
                               '       CC.IDPATRO,'+#13#10+
                               '       CC.IDPLANOPREV,'+#13#10+
                               '       CC.COTACAO'+#13#10+
                               'FROM SEGREGACRITER C, SEGREGADATA D, SEGREGACOTACAO CC'+#13#10+
                               'WHERE c.idsegregacriter = d.idsegregacriter'+#13#10+
                               '  AND D.IDSEGREGADATA = CC.IDSEGREGADATA'+#13#10+
                               '  and Upper(descricao) = ''FINANCIAMENTO HABITACIONAL'''+#13#10+
                               '  AND dataini <= To_Date('+QuotedStr(DateToStr(DataInicial))+',''dd/mm/yyyy'')'+#13#10+
                               '  and (datafim >= To_Date('+QuotedStr(DateToStr(DataInicial))+',''dd/mm/yyyy'') OR DATAFIM is Null)'+#13#10+
                               'ORDER BY DATAFIM DESC');
    rValorTotal := 0;
    oQryAux.Data := GetDataPacket('Select * from RateioDocum'+#13#10+
                                  'where IdRateioDocum = '+IntToStr(pIdRateioDocum));
    iQteRegistros := oQry.RecordCount;
    While Not oQry.Eof do
    begin
      iSeqRateioDocum := GetSequence('RATEIODOCUM');
      rVal        := RoundCm(pValor * (oQry.FieldByName('Cotacao').AsFloat / 100),2);
      rValorTotal := rValorTotal + rVal;
      If oQry.Recno = iQteRegistros then
        rVal := pValor - rValorTotal;
      sSql := 'Insert Into RateioDocum(CODDOCUMENTO,'+#13#10+
              '                        CODTIPRECDES,'+#13#10+
              '                        RECPAG,'+#13#10+
              '                        IDPESSOA,'+#13#10+
              '                        CODCENTRORESPON,'+#13#10+
              '                        UNIDNEGOC,'+#13#10+
              '                        VALOR,'+#13#10+
              '                        IDUSUARIOINCLUSAO,'+#13#10+
              '                        IDRATEIODOCUM,'+#13#10+
              '                        IDEMPRESA,'+#13#10+
              '                        CODCENTROCUSTO,'+#13#10+
              '                        PLANO,'+#13#10+
              '                        IDPROGRAMA,'+#13#10+
              '                        IDPATRO,'+#13#10+
              '                        IDPLANOPREV,'+#13#10+
              '                        IDPATROORIGEM,'+#13#10+
              '                        IDPLANOORIGEM)'+#13#10+
              'Values('+IntToStr(pIdCodDocumento)+','+#13#10+
              '       '+QuotedStr(oQryAux.FieldByName('CODTIPRECDES').asString)+','+#13#10+
              '       '+QuotedStr(oQryAux.FieldByName('RECPAG').asString)+','+#13#10+
              '       '+oQryAux.FieldByName('IDPESSOA').asString+','+#13#10+
              '       '+oQryAux.FieldByName('CODCENTRORESPON').AsString+','+#13#10+
              '       '+oQryAux.FieldByName('UNIDNEGOC').asString+','+#13#10+
              '       '+AjustaValor(rVal)+','+#13#10+
              '       '+IntToStr(Sistema.IdUsuario)+','+#13#10+
              '       '+FloatToStr(iSeqRateioDocum)+','+#13#10+
              '       '+oQryAux.FieldByName('IDEMPRESA').asString+','+#13#10+
              '       '+oQryAux.FieldByName('CODCENTROCUSTO').asString+','+#13#10+
              '       '+oQryAux.FieldByName('PLANO').asString+','+#13#10+
              '       '+oQryAux.FieldByName('IDPROGRAMA').asString+','+#13#10+
              '       '+oQry.FieldByName('IDPATRO').asString+','+#13#10+
              '       '+oQry.FieldByName('IDPLANOPREV').asString+','+#13#10+
              '       '+oQryAux.FieldByName('IDPATROORIGEM').asString+','+#13#10+
              '       '+oQryAux.FieldByName('IDPLANOORIGEM').asString+')';
      Result := ExecSQL(sSql);
      oQry.Next;
    end;
    If Result then
      Result := ExecSql('Delete From RateioDocum'+#13#10+
                        'where IdRateioDocum = '+InttoStr(pIdRateioDocum));
    oQry.Close;
    oQryAux.Close;
  Finally
    FreeAndNil(oQry);
    FreeAndNil(oQryAux);
  end;
end;

function TCtrlAcertaLancto.AcertaRateioNormal(Const pIdCodDocumento,
                                                    pIdRateioDocum : Integer) : Boolean;
var iIdPlanoPrev, iIdPatro : Double;
    sSql : String;
begin
  SelecionaPlanoPGA(iIdPlanoPrev,iIdPatro);
  sSql := 'Update RateioDocum'+#13#10+
          'set IdPlanoPrev = '+FloatToStr(iIDPlanoPrev)+#13#10+
          '    IdPatro     = '+FloatToStr(iIdPatro)+#13#10+
          'Where CodDocumento = '+IntToStr(pIdCodDocumento)+#13#10+
          '  and IdRateioDocum = '+IntToStr(pIdRateioDocum);
  Result := ExecSQL(sSql);
end;

Function TCtrlAcertaLancto.TemFinanciamentoHabitacional(const pCodTipRecDes : String) : Boolean;
var oQry : TCMClientDataSet;
begin
  Result := False;
  oQry := TCmClientDataSet.Create(nil);
  Try
    oQry.Data := GetDataPacket('Select CodTipRecDes,FLGFinancHabitacional'+#13#10+
                               'From TipoRecebDesemb'+#13#10+
                               'Where CodTipRecDes = '+QuotedStr(pCodTipRecDes)+#13#10+
                               '  and Ativo = ''S''');
    Result := Not oQry.IsEmpty;
    oQry.Close;
  finally
    FreeAndNil(oQry);
  end;
end;

function TCtrlAcertaLancto.DesfazValorRateioFinanc(Const pCodLancFinanc,
                                                         pIdRateioFinanc : integer;
                                                   Const pValor          : Double) : Boolean;
var sSql : String;
begin
  sSql := 'Update RateioFinanc'+#13#10+
          'Set Valor = Valor - ' + AjustaValor(pValor)+#13#10+
          'Where CodLancFinanc  = ' + IntToStr(pCodLancFinanc)+#13#10+
          '  and IdRateioFinanc = ' + IntToStr(pIDRateioFinanc);
  Result := ExecSQL(sSql);
end;

function TCtrlAcertaLancto.AtualizaLancamentosFinanceiros(Const pCodLancFinanc,
                                                                pIdCodDocumento,
                                                                pTipoDocumento  : Integer;
                                                          Const pValorDocumento,
                                                                pValorLiquido     : Double) : Boolean;
var sSql : String;
    oQryRateio : TCmClientDataSet;
    oQryAux    : TCmClientDataSet;
    rValorAjustado   : Double;
    iSeqRateioFinanc : Double;
    rCorrigeArredondamento : Double;
begin
  oQryRateio := TCmClientDataSet.Create(Nil);
  oQryAux    := TCmClientDataSet.Create(Nil);
  Try
    sSql := 'Select CODDOCUMENTO,'      + #13#10 +
            '       RECPAG,'            + #13#10 +
            '       IDPESSOA,'          + #13#10 +
            '       CODCENTRORESPON,'   + #13#10 +
            '       UNIDNEGOC,'         + #13#10 +
            '       VALOR,'             + #13#10 +
            '       CODCENTROCUSTO,'    + #13#10 +
            '       PLANO,'             + #13#10 +
            '       IDPATRO,'           + #13#10 +
            '       IDPROGRAMA,'        + #13#10 +
            '       IDPLANOPREV,'       + #13#10 +
            '       CODTIPRECDES'       + #13#10 +
            'from VW_RATEIODOCUM R'     + #13#10 +
            'WHERE R.CODDOCUMENTO = '   + IntToStr(pIdCodDocumento) + #13#10 +
            '  AND R.EXERCICIO = '+QuotedStr(FormatDateTime('yyyy',DataInicial));
    oQryRateio.Data := GetDataPacket(sSql);

    rCorrigeArredondamento := 0;
    While Not oQryRateio.Eof do
    begin
      rValorAjustado := oQryRateio.FieldByName('Valor').asFloat;
      If pValorLiquido <> pValorDocumento then
      begin
        rValorAjustado := RoundCM(( rValorAjustado / pValorDocumento) * pValorLiquido,2);
        rCorrigeArredondamento := rCorrigeArredondamento + rValorAjustado;
        If oQryRateio.Recno = oQryRateio.RecordCount then
          rValorAjustado := pValorLiquido - rCorrigeArredondamento;
      end;

      sSql := 'Select rf.CodLancFinanc,' + #13#10 +
              '       rf.IdRateioFinanc' + #13#10 +
              'from rateiofinanc rf' + #13#10 +
              'join recbtopagto rp on (rp.codlancfinanc = rf.codlancfinanc)' + #13#10 +
              'join lanctodocum ld on (ld.coddocumento  = rp.coddocumento)' + #13#10 +
              'join documento   d  on (ld.coddocumento  = d.coddocumento)' + #13#10 +
              'where ld.operacao = 5' + #13#10 +
              '  and rf.codtipdoc = d.codtipdoc' + #13#10 +
              '  and rf.idplanoprev = '  + oQryRateio.FieldByName('IdPlanoPrev').asString+ #13#10 +
              '  and rf.IdPatro = '      + oQryRateio.FieldByName('IdPatro').asString+
              '  and rf.CodLancFinanc = '+ IntToStr(pCodLancFinanc) + #13#10 +
              '  and ld.coddocumento =  '+ oQryRateio.FieldByName('CodDocumento').asString + #13#10 +
              '  and rf.codtiprecdes =  '+ oQryRateio.FieldByName('CodTipRecDes').asString;

      oQryAux.Data := GetDataPacket(sSql);
      If Not oQryAux.IsEmpty then
        sSql := 'Update RateioFinanc'+#13#10+
                'Set Valor = Valor + '+AjustaValor(rValorAjustado)+#13#10+
                'Where CodLancFinanc  = ' + oQryAux.FieldByName('CodLancFinanc').asString+#13#10+
                '  and IdRateioFinanc = ' + oQryAux.FieldByName('IDRateioFinanc').asString
      Else
      begin
        iSeqRateioFinanc := GetSequence('RATEIOFINANC');
        sSql := 'Insert Into RateioFinanc(IDPESSOA,'+#13#10+
                '                         CODLANCFINANC,'+#13#10+
                '                         UNIDNEGOC,'+#13#10+
                '                         CODTIPRECDES,'+#13#10+
                '                         RECPAG,'+#13#10+
                '                         CODCENTRORESPON,'+#13#10+
                '                         VALOR,'+#13#10+
                '                         IDEMPRESA,'+#13#10+
                '                         CODCENTROCUSTO,'+#13#10+
                '                         IDRATEIOFINANC,'+#13#10+
                '                         IDPROGRAMA,'+#13#10+
                '                         IDPLANOPREV,'+#13#10+
                '                         IDPATRO,'+#13#10+
                '                         CODTIPDOC)'+#13#10+
                'Values(' + oQryRateio.FieldByName('IDPessoa').asString+','+#13#10+
                '       ' + IntToStr(pCodLancFinanc)+','+#13#10+
                '       ' + oQryRateio.FieldByName('UNIDNEGOC').asString+','+#13#10+
                '       ' + QuotedStr(oQryRateio.FieldByName('CODTIPRECDES').asString)+','+#13#10+
                '       ' + QuotedStr(oQryRateio.FieldByName('RECPAG').asString)+','+#13#10+
                '       ' + oQryRateio.FieldByName('CODCENTRORESPON').asString+','+#13#10+
                '       ' + AjustaValor(rValorAjustado)+','+#13#10+
                '       ' + IntToStr(sistema.IdEmpresa) + ',' + #13#10+
                '       ' + QuotedStr(oQryRateio.FieldByName('CodCentroCusto').asString)+','+#13#10+
                '       ' + FloatToStr(iSeqRateioFinanc) +','+#13#10+
                '       ' + oQryRateio.FieldByName('IDPrograma').asString+','+#13#10+
                '       ' + oQryRateio.FieldByName('IDPlanoPrev').asString+','+#13#10+
                '       ' + oQryRateio.FieldByName('IDPatro').asString+','+#13#10+
                '       ' + IntToStr(pTipoDocumento)+')';
      end;
      Result := ExecSQL(sSql);
      oQryRateio.Next;
    end;
    oQryRateio.Close;
    oQryAux.Close;
  Finally
    FreeAndNil(oQryRateio);
    FreeAndNil(oQryAux);
  End;
end;

Function TCtrlAcertaLancto.SelecionaPlanoPGA(var pIdPlano, pIdPatro : Double) : Boolean;
var oQry : TClientDataSet;
begin
  pIdPlano := -1;
  pIdPatro := -1;
  oQry := TClientDataSet.Create(Nil);
  Try
    oQry.Data := GetDataPacket('select ppc.idplanoprev,' + #13#10 +
                               '       ppcp.idpatro' + #13#10 +
                               'from PlanPrevContabil ppc,' + #13#10 +
                               '     PlanPrevContabPatro ppcp' + #13#10 +
                               'where ppc.idplanoprev = ppcp.idplanoprev' + #13#10 +
                               '  and ppc.flgusopga = ''S''' + #13#10 +
                               '  and ppc.ativo = ''S''');
    oQry.Open;
    Result := Not oQry.IsEmpty;
    If Result then
    begin
      pIdPlano := oQry.FieldByName('IdPlanoPrev').asFloat;
      pIdPatro := oQry.FieldByName('IdPatro').asFloat;
    end;
    oQry.Close;
  finally
    FreeAndNil(oQry);
  end;
end;


function TCtrlAcertaLancto.ExcluiLancamentosFinanceirosZerados(const pCodLancFinanc : Integer): Boolean;
var sSql : String;
begin
  sSql := 'Delete from RateioFinanc'+#13#10+
          'Where CodLancFinanc  = ' + IntToStr(pCodLancFinanc)+#13#10+
          '  and Valor = 0';
  Result := ExecSQL(sSql);
end;


function TCtrlAcertaLancto.AcertaLancamentosFinanceiros(const pIdCodDocumento,
                                                              pTipoDocumento  : Integer;
                                                        const pCodTipRecDes   : String;
                                                        const pValor          : Double;
                                                        const pValorDocumento : Double;
                                                        const pValorLiquido   : Double ) : Boolean;
var iCodLancFinanc, iIdRateioFinanc : Integer;
var oQryRateio : TCMClientDataSet;
    rValorComp : Double;
begin
  Result := True;
  rValorComp := pValor;
  oQryRateio := TCMClientDataSet.Create(Nil);
  Try
    oQryRateio.Data := SelecionarLancamentosFinanceiros(pIdCodDocumento,pTipoDocumento,pCodTipRecDes);
    oQryRateio.First;
    While Not oQryRateio.Eof do
    begin
      iCodLancFinanc  := oQryRateio.FieldByName('CodLancFinanc').asInteger;
      iIdRateioFinanc := oQryRateio.FieldByName('IdRateioFinanc').asInteger;
      If RoundCM(oQryRateio.FieldByName('Valor').AsFloat,2) <= RoundCM(rValorComp,2) then
      begin
        Result := DesfazValorRateioFinanc(iCodLancFinanc, iIDRateioFinanc, oQryRateio.FieldByName('Valor').AsFloat);
        rValorComp := rValorComp - RoundCM(oQryRateio.FieldByName('Valor').AsFloat,2);
      end
      else
      begin
        Result := DesfazValorRateioFinanc(iCodLancFinanc, iIDRateioFinanc, rValorComp);
        rValorComp := 0;
      end;
      If RoundCm(rValorComp,2) = 0 then
        Break;
      oQryRateio.Next;
    end;
    If Not oQryRateio.IsEmpty then
    begin
      If Result then
        Result := ExcluiLancamentosFinanceirosZerados(iCodLancFinanc);
      If Result then
        Result := AtualizaLancamentosFinanceiros(iCodLancFinanc,
                                                 pIdCodDocumento,
                                                 pTipoDocumento,
                                                 pValorDocumento,
                                                 pValorLiquido);
    end;
    oQryRateio.Close;
  Finally
    FreeAndNil(oQryRateio);
  end;
end;

function TCtrlAcertaLancto.SelecionarDocumentos: OleVariant;
var sSql : String;
begin
  sSql := 'Select distinct d.CodDocumento,' + #13#10 +
          '                d.NoDocumento,' + #13#10 +
          '                rd.codtiprecdes,' + #13#10 +
          '                ld.plnCodigo,'+ #13#10 +
          '                d.CodTipDoc,' + #13#10 +
          '                Sum(rd.valor) as Valor,' + #13#10 +
          '                (Select Sum(ld.Valor) from LanctoDocum ld'+ #13#10 +
          '                 Where ld.CodDocumento = d.CodDocumento'+ #13#10 +
          '                   and ld.Operacao = 2'+#13#10+
          '                 Group by ld.Coddocumento) as ValorDocumento,'+#13#10+
          '                (Select Sum(ld.Valor) from LanctoDocum ld'+ #13#10 +
          '                 Where ld.CodDocumento = d.CodDocumento'+ #13#10 +
          '                   and ld.Operacao = 5'+#13#10+
          '                 Group by ld.Coddocumento) as ValorLiquido'+#13#10+
          'From Documento d' + #13#10 +
          'Join LanctoDocum ld on (d.coddocumento = ld.coddocumento)' + #13#10 +
          'Join RateioDocum rd on (d.coddocumento = rd.coddocumento)' + #13#10 +
          'where ld.operacao = 5' + #13#10 +
          '  and nvl(d.datadisponib,d.dataprogramada) = to_date('+QuotedStr(DateToStr(DataInicial))+',''dd/mm/yyyy'')'+ #13#10 +
          '  and rd.IdPlanoPrev = 29'+ #13#10 +
          '  and To_Char(d.dataemissao,''yyyy'') < to_Char(ld.datalancto,''yyyy'')'+#13#10+
          'Group By d.CodDocumento,' + #13#10 +
          '         d.NoDocumento,' + #13#10 +
          '         rd.codtiprecdes,' + #13#10 +
          '         ld.plnCodigo,'+ #13#10 +
          '         d.CodTipDoc';
  Result := GetDataPacket(sSql);
end;

function TCtrlAcertaLancto.SelecionarDocumentos2010 : OleVariant;
var sSql : String;
begin
  sSql := 'select CodDocumento,'+#13#10+
          '       NoDocumento,'+#13#10+
          '       codtiprecdes,'+#13#10+
          '       idrateiodocum,'+#13#10+
          '       plncodigo,'+#13#10+
          '       CodTipDoc,'+#13#10+
          '       idModulo,'+#13#10+
          '       Valor,'+#13#10+
          '       (Select Valor'+#13#10+
          '          From LanctoDocum'+#13#10+
          '         Where codDocumento = m.CodDocumento'+#13#10+
          '           and Operacao = 2) as ValorDocumento,'+#13#10+
          '       (Select Sum(ld.Valor) from LanctoDocum ld'+ #13#10 +
          '        Where ld.CodDocumento = m.CodDocumento'+ #13#10 +
          '          and ld.Operacao = 5'+#13#10+
          '        Group by ld.Coddocumento) as ValorLiquido,'+#13#10+
          '       (Select plnCodigo'+#13#10+
          '          From LanctoDocum'+#13#10+
          '         Where codDocumento = m.CodDocumento'+#13#10+
          '           and Operacao = 2) as PlnCodAprop'+#13#10+
          '  from (Select distinct d.CodDocumento,'+#13#10+
          '                        d.NoDocumento,'+#13#10+
          '                        rd.codtiprecdes,'+#13#10+
          '                        rd.idrateiodocum,'+#13#10+
          '                        ld.plncodigo,'+#13#10+
          '                        d.CodTipDoc,'+#13#10+
          '                        d.idModulo,'+#13#10+
          '                        sum(rd.valor) as Valor'+#13#10+
          '          From Documento d'+#13#10+
          '          Join LanctoDocum ld on (d.coddocumento = ld.coddocumento)'+#13#10+
          '          Join RateioDocum rd on (d.coddocumento = rd.coddocumento)'+#13#10+
          '         where ld.operacao = 5'+#13#10+
          '           and nvl(d.datadisponib, d.dataprogramada) = to_date('+QuotedStr(DateToStr(DataInicial))+', ''dd/mm/yyyy'')'+#13#10+
          '           and rd.IdPlanoPrev = 29'+#13#10+
          '           and To_Char(d.dataemissao, ''yyyy'') = to_Char(ld.datalancto, ''yyyy'')'+#13#10+
          '         group by d.CodDocumento,'+#13#10+
          '                  d.NoDocumento,'+#13#10+
          '                  rd.codtiprecdes,'+#13#10+
          '                  rd.idrateiodocum,'+#13#10+
          '                  ld.plncodigo,'+#13#10+
          '                  d.CodTipDoc,'+#13#10+
          '                  d.idModulo) m'+#13#10;
  Result := GetDataPacket(sSql);
end;

Function TCtrlAcertaLancto.SelecionarLancamentosFinanceiros(Const pIdCodDocumento,
                                                                  pTipoDocumento  : Integer;
                                                            Const pCodTipRecDes   : String): Variant;
var sSql : String;
begin
  sSql := 'Select rf.CodLancFinanc,'  + #13#10 +
          '       rf.IdRateioFinanc,' + #13#10 +
          '       rf.Valor'           + #13#10 +
          'from rateiofinanc rf'      + #13#10 +
          'join recbtopagto rp on (rp.codlancfinanc = rf.codlancfinanc)' + #13#10 +
          'join lanctodocum ld on (ld.coddocumento  = rp.coddocumento)'  + #13#10 +
          'where ld.operacao = 5'            + #13#10 +
          '  and rf.idplanoprev = 29'        + #13#10 +
          '  and ld.coddocumento = '+InttoStr(pIdCodDocumento) + #13#10 +
          '  and rf.codtipdoc    = '+IntToStr(pTipoDocumento)  + #13#10 +
          '  and rf.codtiprecdes = '+QuotedStr(pCodTipRecDes);
  Result := GetDataPacket(sSql);
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

procedure TLancamentos.SetDadosLancamento(Index: Integer;const Value: tDadosLancamento);
begin
  fDados[Index] := Value;
end;

function TCtrlAcertaLancto.SelecionaCCBaixasXDocum(Const oQryRateio : TCMClientDataSet;
                                                   Const pIdCodDocumento : Integer) : Boolean;
var sSql : String;
begin
  sSql := 'Select CODDOCUMENTO,'      + #13#10 +
          '       VALOR,'             + #13#10 +
          '       IDPATRO,'           + #13#10 +
          '       IDPLANOPREV'        + #13#10 +
          'from CCBAIXASXDOCUM' + #13#10 +
          'WHERE CODDOCUMENTO = '   + IntToStr(pIdCodDocumento);
  oQryRateio.Data := GetDataPacket(sSql);
  Result := Not oQryRateio.IsEmpty;
end;

function TCtrlAcertaLancto.RefazerLancamentosImobiliarioApropriacao(const pIdCodDocumento: integer;
                                                                    const pNumDocumento: String;
                                                                    const aDados: tDadosLancamento;
                                                                    const pValorDocumento,
                                                                          pValorLiquido: Double): Boolean;
var rValorAjustado,
    rCorrigeArredondamento : Double;
    oQryRateio : TCMClientDataSet;
    iIdPlanoPrev,
    iIdPatro : Integer;
begin
  Result := True;
  oQryRateio := TCmClientDataSet.Create(Nil);
  Try
    If Not SelecionaCCBaixasXDocum(oQryRateio,pIdCodDocumento) then
      oQryRateio.Data := RetornaRateioDocumento(pIdCodDocumento);
    If oQryRateio.IsEmpty then
      Raise Exception.Create('O Documento '+IntToStr(pIdCodDocumento)+' não possue rateios !');
    While Not oQryRateio.Eof Do
    begin
      iIdPlanoPrev   := oQryRateio.FieldByName('IdPlanoPrev').asInteger;
      iIdPatro       := oQryRateio.FieldByName('IDPatro').asInteger;
      rValorAjustado := oQryRateio.FieldByName('Valor').asFloat;
//      If pValorLiquido <> pValorDocumento then
//      begin
//        rValorAjustado := RoundCM(( rValorAjustado / pValorDocumento) * pValorLiquido,2);
//        rCorrigeArredondamento := rCorrigeArredondamento + rValorAjustado;
//        If oQryRateio.Recno = oQryRateio.RecordCount then
//          rValorAjustado := pValorLiquido - rCorrigeArredondamento;
//      end;

      Result := InserirLancamentoContabilImobiliario(pIdCodDocumento,
                                                     pNumDocumento,
                                                     rValorAjustado,
                                                     aDados,
                                                     iIdPlanoPrev,
                                                     iIdPatro);
      If Not Result then
        Break;
      oQryRateio.Next;
    end;
    oQryRateio.Close;
  finally
    FreeAndNil(oQryRateio);
  end;
end;

function TCtrlAcertaLancto.RefazerLancamentosImobiliario(const pIdCodDocumento: integer;
                                                         const pNumDocumento: String;
                                                         const aDados: tDadosLancamento;
                                                         const pValorDocumento,
                                                               pValorLiquido: Double): Boolean;
var rValorAjustado,
    rCorrigeArredondamento : Double;
    oQryRateio : TCMClientDataSet;
    iIdPlanoPrev,
    iIdPatro : Integer;
begin
  Result := True;
  oQryRateio := TCmClientDataSet.Create(Nil);
  Try
    If Not SelecionaCCBaixasXDocum(oQryRateio,pIdCodDocumento) then
      oQryRateio.Data := RetornaRateioDocumento(pIdCodDocumento);
    If oQryRateio.IsEmpty then
      Raise Exception.Create('O Documento '+IntToStr(pIdCodDocumento)+' não possue rateios !');
    While Not oQryRateio.Eof Do
    begin
      iIdPlanoPrev   := oQryRateio.FieldByName('IdPlanoPrev').asInteger;
      iIdPatro       := oQryRateio.FieldByName('IDPatro').asInteger;
      rValorAjustado := oQryRateio.FieldByName('Valor').asFloat;
      If pValorLiquido <> pValorDocumento then
      begin
        rValorAjustado := RoundCM(( rValorAjustado / pValorDocumento) * pValorLiquido,2);
        rCorrigeArredondamento := rCorrigeArredondamento + rValorAjustado;
        If oQryRateio.Recno = oQryRateio.RecordCount then
          rValorAjustado := pValorLiquido - rCorrigeArredondamento;
      end;
      Result := InserirLancamentoContabilImobiliario(pIdCodDocumento,
                                                     pNumDocumento,
                                                     rValorAjustado,
                                                     aDados,
                                                     iIdPlanoPrev,
                                                     iIdPatro);
      If Not Result then
        Break;
      oQryRateio.Next;
    end;
    oQryRateio.Close;
  finally
    FreeAndNil(oQryRateio);
  end;
end;

function TCtrlAcertaLancto.InserirLancamentoContabilImobiliario(const pIdCodDocumento: Integer;
                                                                const pNumDocumento: String;
                                                                const prValor: Double;
                                                                const aDados: TDadoslancamento;
                                                                const pIdPlanoPrev,
                                                                      pIdPatro: Integer): Boolean;
begin
  Try
    Result := CtrlImobLancto.InsereLancaContab('2',
                                               sistema.IdEmpresa,
                                               aDados.idModulo,
                                               sistema.idusuario,
                                               aDados.idPlano,
                                               aDados.UnidNegoc,
                                               -1,
                                               -1,
                                               pIdPlanoPrev,  // ok
                                               pIdPatro,      // ok
                                               aDados.iPlanilha, // ok
                                               -1,
                                               DateToStr(aDados.dDataLancto),
                                               pNumDocumento,
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
                                               prValor,
                                               false,
                                               True,
                                               -1,
                                               0,
                                               -1,
                                               -1,
                                               True,
                                               pIdCodDocumento)

  except
    MessageInfo := CtrlLancto.MessageInfo;
    Result := False;
  end;
end;

function TCtrlAcertaLancto.SelecionarLancamentosApropriacao(const pIdCodDocumento,
                                                                  pIDPlnCodigo: integer): Variant;
var sSql : String;
begin
  sSql := 'Select distinct l.PlnCodigo,'+#13#10+
          '       l.idmodulo,l.lacnumlan, p.plndatdia,'+#13#10+
          '       p.PlnEfetivado,P.TipCodigo,'+#13#10+
          '       l.lachist1, l.lachist2, l.lachist3,'+#13#10+
          '       l.lachist4, l.lachist5'+#13#10+
          'from planilha p, lancamento l'+#13#10+
          'where l.plncodigo = p.plncodigo'+#13#10+
          '  and l.lacnumdoc = '+IntToStr(pIdCodDocumento)+#13#10+
          '  and p.plncodigo = '+IntToStr(pIdPlnCodigo);
  Result := GetDataPacket(sSql);
end;

end.
