unit uCtrlSintetizaContabil;

interface

Uses Classes, SysUtils, uSistema, wwQuery, db;

type
  TSingleLancamento = Class
  private
    FPlano: Integer;
    FPatro: Integer;
    FAtividadeProjeto: Integer;
    FUnidadeNegocio: Integer;
    FContaDebito: String;
    FCCustoDebito: String;
    FCCustoCredito: String;
    FContaCredito: String;
    FValor: Double;
    FHistorico : String;
    FNumDocumento : Integer;
    FSubContaCredito: Double;
    FSubContaDebito: Double;
    FIdSegregacao : Integer;
  public
    //-- Propriedades
    Property ContaCredito     : String  read FContaCredito     write FContaCredito;
    Property ContaDebito      : String  read FContaDebito      write FContaDebito;
    Property CCustoCredito    : String  read FCCustoCredito    write FCCustoCredito;
    Property CCustoDebito     : String  read FCCustoDebito     write FCCustoDebito;
    Property Plano            : Integer read FPlano            write FPlano;
    Property Patro            : Integer read FPatro            write FPatro;
    Property AtividadeProjeto : Integer read FAtividadeProjeto write FAtividadeProjeto;
    Property UnidadeNegocio   : Integer read FUnidadeNegocio   write FUnidadeNegocio;
    Property Valor            : Double  read FValor            write FValor;
    Property SubContaCredito  : Double  read FSubContaCredito  write FSubContaCredito;
    Property SubContaDebito   : Double  read FSubContaDebito   write FSubContaDebito;
    Property Historico        : String  read FHistorico        write FHistorico;
    Property NumDocumento     : Integer read FNumDocumento     write FNumDocumento;
    Property IdSegregacao     : Integer read FIdSegregacao     write FIdSegregacao;

    //-- Metodos
    Constructor Create;
    Function Linha : String;
    Function LinhaLog : String;
  end;

  TSingleGrupo = Class
  private
    fLancamentos : Tlist;
    FTipoLancto  : Char;
    FIdSegregacao: Integer;
    FHistorico1  : String;
    FHistorico2  : String;
    FHistorico3  : String;
    FHistorico4  : String;
    FHistorico5  : String;
    FNumDocumento: String;
    function GetSingleLancamento(Index: Integer): tSingleLancamento;
  public
    Constructor Create;
    Destructor  Destroy; override;
    Function    Add : tSingleLancamento;
    Function    Count : Integer;
    Procedure   Clear;
    Procedure   Delete(Const pIndex : Integer);
    Function    Integrar : TSingleLancamento;
    Function    DadosContabeis : String;
    Function    SalvarLog(const pPlanilha : Integer;
                          const pDataPlanilha : TDateTime;
                          const oArquivoLog: TStringList) : Boolean;
    Function UltimoLancamento : TSingleLancamento;
    function ValorTotalLancamentos: Double;
    // Propriedade
    property    Lancamentos[Index: Integer] : tSingleLancamento read GetSingleLancamento; default;

    Property TipoLancto   : Char    read FTipoLancto   write FTipoLancto;
  end;

  TSinglePlanilha = Class
  protected
    Function Add : tSingleGrupo;
    Function CriarGrupo(Const pContaCredito,
                              pContaDebito,
                              pCCustoCredito,
                              pCCustoDebito : String;
                        Const pPlano,
                              pPatro,
                              pAtividadeProjeto,
                              pUnidadeNegocio : Integer;
                        Const pSubContaCredito,
                              pSubContaDebito : Double;
                        Const pValor : Double) : Boolean;
    Function AtualizarGrupo(Const pPonteiroGrupo : Integer;
                            Const pContaCredito,
                                  pContaDebito,
                                  pCCustoCredito,
                                  pCCustoDebito : String;
                            Const pPlano,
                                  pPatro,
                                  pAtividadeProjeto,
                                  pUnidadeNegocio : Integer;
                            Const pSubContaCredito,
                                  pSubContaDebito : Double;
                            Const pValor : Double) : Boolean;
    Function AdicionarDados(Const oGrupo : TSingleGrupo;
                            Const pContaCredito,
                                  pContaDebito,
                                  pCCustoCredito,
                                  pCCustoDebito : String;
                            Const pPlano,
                                  pPatro,
                                  pAtividadeProjeto,
                                  pUnidadeNegocio : Integer;
                            Const pSubContaCredito,
                                  pSubContaDebito : Double;
                            Const pValor : Double) : Boolean;
    Procedure AtualizaDadosGrupo(Const pIndex : Integer;
                                 Const pTipoLancto : Char;
                                 Const pNumDocumento : Integer;
                                 Const pHistorico : String;
                                 Const pIdSegregacao : Integer;
                                 Const pValor : Double);
  private
    fGrupos : Tlist;
    fPlanilha : Integer;
    fDataPlanilha : TDateTime;
    function GetSingleGrupo(Index: Integer): tSingleGrupo;
  public
    Constructor Create;
    Destructor  Destroy; override;
    Function    Count : Integer;
    Procedure   Clear;
    Procedure   Delete(Const pIndex : Integer);

    Function    LocalizaGrupo(Const pContaCredito,
                                    pContaDebito,
                                    pCCustoCredito,
                                    pCCustoDebito : String;
                              Const pPlano,
                                    pPatro,
                                    pAtividadeProjeto,
                                    pUnidadeNegocio : Integer) : Integer;
    Function    AdicionaOuAtualizaGrupo(Const pContaCredito,
                                              pContaDebito,
                                              pCCustoCredito,
                                              pCCustoDebito : String;
                                        Const pPlano,
                                              pPatro,
                                              pAtividadeProjeto,
                                              pUnidadeNegocio : Integer;
                                        Const pTipoLancto : Char;
                                        Const pNumDocumento : Integer;
                                        Const pHistorico : String;
                                        Const pSubContaCredito,
                                              pSubContaDebito : Double;
                                        Const pIdSegregacao : Integer;
                                        Const pValor : Double) : Boolean;
    Function    GravarLog : Boolean;
    Function    AjustaCodigoPlanilha : Boolean;
    property    Grupos[Index: Integer] : tSingleGrupo read GetSingleGrupo; default;
    property    Planilha : Integer read FPlanilha write FPlanilha;
    property    DataPlanilha : TDateTime read FDataPlanilha write fDataPlanilha;
  end;



implementation

{ TSingleLancamento }

constructor TSingleLancamento.Create;
begin
  inherited;
  FPlano            := -1;
  FPatro            := -1;
  FAtividadeProjeto := -1;
  FUnidadeNegocio   := -1;
  FContaDebito      := '';
  FCCustoDebito     := '';
  FCCustoCredito    := '';
  FContaCredito     := '';
end;

function TSingleLancamento.Linha: String;
begin
  Result := Format('%s - %s - %s - %s - %d - %d - %d - %d',
                   [ FContaCredito,
                     FContaDebito,
                     FCCustoCredito,
                     FCCustoDebito,
                     FPlano,
                     FPatro,
                     FAtividadeProjeto,
                     FUnidadeNegocio]);
end;


function TSingleLancamento.LinhaLog: String;
begin
  Result := Format('%s;%s;%s;%s;%d;%d;%d;%d;%s;%.10d;%s',
                   [ FContaCredito,
                     FContaDebito,
                     FCCustoCredito,
                     FCCustoDebito,
                     FPlano,
                     FPatro,
                     FAtividadeProjeto,
                     FUnidadeNegocio,
                     FloatToStr(fValor),
                     FNumDocumento,
                     FHistorico
                     ]);
end;

{ TSingleGrupo }

function TSingleGrupo.Add: tSingleLancamento;
begin
  Result := TSingleLancamento.Create;
  fLancamentos.Add(Result);
end;

procedure TSingleGrupo.Clear;
begin
  While Count > 0 do
    Delete(0);
  fLancamentos.Clear;
end;

function TSingleGrupo.Count: Integer;
begin
  Result := fLancamentos.Count;
end;

constructor TSingleGrupo.Create;
begin
  fLancamentos := Tlist.Create;
end;

procedure TSingleGrupo.Delete(const pIndex: Integer);
begin
  TSingleLancamento(fLancamentos[pIndex]).Free;
  fLancamentos.Delete(pIndex);
end;

destructor TSingleGrupo.Destroy;
begin
  inherited;
  Clear;
  FreeAndNil(fLancamentos);
end;

function TSingleGrupo.GetSingleLancamento(Index: Integer): tSingleLancamento;
begin
  Result := fLancamentos[Index];
end;

function TSingleGrupo.DadosContabeis : String;
begin
  Result := '';
  If Count > 0 then
    Result := Lancamentos[0].Linha;
end;

function TSingleGrupo.SalvarLog(const pPlanilha : Integer;
                                const pDataPlanilha : TDateTime;
                                const oArquivoLog: TStringList): Boolean;
var iCount : Integer;
begin
  Result := True;
  For iCount := 0 to Count-1 do
    oArquivoLog.Add(IntToStr(pPlanilha)+';'+
                    FormatDateTime('dd/mm/yyyy',pDataPlanilha)+';'+
                    Lancamentos[iCount].LinhaLog);
end;

function TSingleGrupo.ValorTotalLancamentos: Double;
var iCount : Integer;
begin
  Result := 0;
  For iCount := 0 To Count-1 do
    Result := Result + Lancamentos[iCount].Valor;
end;


function TSingleGrupo.Integrar: TSingleLancamento;
begin
  Result := Lancamentos[0];
end;


function TSingleGrupo.UltimoLancamento: TSingleLancamento;
begin
  Result := Lancamentos[Count-1];
end;

{ TSinglePlanilha }

function TSinglePlanilha.Add: tSingleGrupo;
begin
  Result := TSingleGrupo.Create;
  fGrupos.Add(Result);
end;

function TSinglePlanilha.AdicionaOuAtualizaGrupo(const pContaCredito,
                                                       pContaDebito,
                                                       pCCustoCredito,
                                                       pCCustoDebito: String;
                                                 const pPlano,
                                                       pPatro,
                                                       pAtividadeProjeto,
                                                       pUnidadeNegocio: Integer;
                                                 Const pTipoLancto : Char;
                                                 Const pNumDocumento : Integer;
                                                 Const pHistorico : String;
                                                 Const pSubContaCredito,
                                                       pSubContaDebito : Double;
                                                 Const pIdSegregacao : Integer;
                                                 Const pValor : Double): Boolean;
Var iPont : Integer;
    iPlano, iPatro : Integer;
begin
   iPlano := pPlano;
   iPatro := pPatro;
    If iPatro = 1  then iPatro := 91008;
    If iPlano = 79 then
    begin
      iPlano := 66;
      iPatro := 91008;
    end;

  iPont := LocalizaGrupo(pContaCredito,
                         pContaDebito,
                         pCCustoCredito,
                         pCCustoDebito,
                         iPlano,
                         iPatro,
                         pAtividadeProjeto,
                         pUnidadeNegocio);
  If iPont = -1 then
  begin
    Result := CriarGrupo(pContaCredito,
                         pContaDebito,
                         pCCustoCredito,
                         pCCustoDebito,
                         iPlano,
                         iPatro,
                         pAtividadeProjeto,
                         pUnidadeNegocio,
                         pValor,
                         pSubContaCredito,
                         pSubContaDebito);
    iPont := Count-1;
  end
  else
    Result := AtualizarGrupo(iPont,
                             pContaCredito,
                             pContaDebito,
                             pCCustoCredito,
                             pCCustoDebito,
                             iPlano,
                             iPatro,
                             pAtividadeProjeto,
                             pUnidadeNegocio,
                             pValor,
                             pSubContaCredito,
                             pSubContaDebito);
  If Result then
    AtualizaDadosGrupo(iPont,
                       pTipoLancto,
                       pNumDocumento,
                       pHistorico,
                       pIdSegregacao,
                       pValor);

end;

function TSinglePlanilha.AdicionarDados(const oGrupo: TSingleGrupo;
                                        const pContaCredito,
                                              pContaDebito,
                                              pCCustoCredito,
                                              pCCustoDebito: String;
                                        const pPlano,
                                              pPatro,
                                              pAtividadeProjeto,
                                              pUnidadeNegocio: Integer;
                                        Const pSubContaCredito,
                                              pSubContaDebito : Double;
                                        const pValor: Double): Boolean;
begin
  with oGrupo.Add do
  begin
    ContaCredito     := pContaCredito;
    ContaDebito      := pContaDebito;
    CCustoCredito    := pCCustoCredito;
    CCustoDebito     := pCCustoDebito;
    Plano            := pPlano;
    Patro            := pPatro;
    AtividadeProjeto := pAtividadeProjeto;
    UnidadeNegocio   := pUnidadeNegocio;
    Valor            := pValor;
    SubContaCredito  := pSubContaCredito;
    SubContaDebito   := pSubContaDebito;
    If Patro = 1  then Patro := 91008;
    If Plano = 79 then
    begin
      Plano := 66;
      Patro := 91008;
    end;
  end;
  result := True;
end;

function TSinglePlanilha.AjustaCodigoPlanilha: Boolean;
var oQry : TwwQuery;
    iCount,
    iCountGrupo : Integer;
    oGrupo : TSingleGrupo;
    oLancamento : TSingleLancamento;
begin
  oQry := TwwQuery.Create(Nil);
  oQry.DataBaseName := 'BaseDados';
  oQry.Sql.Text := 'Update LanctoDocum Set plncodigo = :Planilha where coddocumento = :Documento and operacao = 5';
  oQry.prepare;
  Try
    Try
      For iCount := 0 to Count-1 do
      begin
        oGrupo := Grupos[iCount];
        For iCountGrupo := 0 to oGrupo.Count-1 do
        begin
          oLancamento := oGrupo.Lancamentos[iCountGrupo];
          oQry.ParamByName('Planilha').asInteger := Planilha;
          oQry.ParamByName('Documento').asInteger := oLancamento.NumDocumento;
          oQry.ExecSQL;
        end;
      end;
      Result := True;
    except
      Result := False;
    end;
  Finally
    FreeAndNil(oQry);
  End;
end;

Procedure TSinglePlanilha.AtualizaDadosGrupo(const pIndex: Integer;
                                             const pTipoLancto: Char;
                                             const pNumDocumento : Integer;
                                             const pHistorico : String;
                                             const pIdSegregacao: Integer;
                                             const pValor : Double);
begin
  With Grupos[pIndex] do
  begin
    TipoLancto   := pTipoLancto;
    with UltimoLancamento do
    begin
      NumDocumento := pNumDocumento;
      Historico    := pHistorico;
      IdSegregacao := pIdSegregacao;
      Valor        := pValor;
    end;
  end;
end;

function TSinglePlanilha.AtualizarGrupo(Const pPonteiroGrupo : Integer;
                                        const pContaCredito,
                                              pContaDebito,
                                              pCCustoCredito,
                                              pCCustoDebito: String;
                                        const pPlano,
                                              pPatro,
                                              pAtividadeProjeto,
                                              pUnidadeNegocio: Integer;
                                        Const pSubContaCredito,
                                              pSubContaDebito : Double;
                                        const pValor : Double): Boolean;
var oGrupo : TSingleGrupo;
begin
  oGrupo := Grupos[pPonteiroGrupo];
  result := AdicionarDados(oGrupo,
                           pContaCredito,
                           pContaDebito,
                           pCCustoCredito,
                           pCCustoDebito,
                           pPlano,
                           pPatro,
                           pAtividadeProjeto,
                           pUnidadeNegocio,
                           pSubContaCredito,
                           pSubContaDebito,
                           pValor);
end;

procedure TSinglePlanilha.Clear;
begin
  While Count > 0 do
    Delete(0);
  FGrupos.Clear;
end;

function TSinglePlanilha.Count: Integer;
begin
  Result := fGrupos.Count;
end;

constructor TSinglePlanilha.Create;
begin
  FGrupos := TList.Create;
end;

function TSinglePlanilha.CriarGrupo(const pContaCredito,
                                          pContaDebito,
                                          pCCustoCredito,
                                          pCCustoDebito: String;
                                    const pPlano,
                                          pPatro,
                                          pAtividadeProjeto,
                                          pUnidadeNegocio: Integer;
                                    Const pSubContaCredito,
                                          pSubContaDebito : Double;
                                    Const pValor : Double): Boolean;
Var oGrupo : TSingleGrupo;
begin
  oGrupo := Add;
  Result := AdicionarDados(oGrupo,
                           pContaCredito,
                           pContaDebito,
                           pCCustoCredito,
                           pCCustoDebito,
                           pPlano,
                           pPatro,
                           pAtividadeProjeto,
                           pUnidadeNegocio,
                           pSubContaCredito,
                           pSubContaDebito,
                           pValor);
end;

procedure TSinglePlanilha.Delete(const pIndex: Integer);
begin
  TSingleGrupo(fGrupos[pIndex]).Free;
  fGrupos.Delete(pIndex);
end;

destructor TSinglePlanilha.Destroy;
begin
  Clear;
  FreeAndNil(fGrupos);
  inherited;
end;

function TSinglePlanilha.GetSingleGrupo(Index: Integer): tSingleGrupo;
begin
  Result := fGrupos[Index];
end;

function TSinglePlanilha.GravarLog: Boolean;
var iContGrupos : Integer;
    oGrupo : TSingleGrupo;
    oArquivoLog : TStringList;
    sNomeArquivo : String;
begin
  Result := True;
  sNomeArquivo := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +
                  Format('\BAIXA_%d_%s.TXT',[Planilha,FormatDateTime('YYYYMMDD',date)]);
  oArquivoLog := TStringList.Create;
  If FileExists(sNomeArquivo) then
    oArquivoLog.LoadFromFile(sNomeArquivo)
  else
    oArquivoLog.Add('Planilha;Data;ContaCredito;ContaDebito;CCustoCredito;'+
                    'CCustoDebito;Plano;Patro;AtividadeProjeto;UnidadeNegocio;'+
                    'Valor;Documento;Historico');
  For iContGrupos := 0 to Count -1 do
  begin
    oGrupo := Grupos[iContGrupos];
    oGrupo.SalvarLog(Planilha,DataPlanilha,oArquivoLog);
  end;
  oArquivoLog.SaveToFile(sNomeArquivo);
  oArquivoLog.Clear;
  FreeAndNil(oArquivoLog);
end;

function TSinglePlanilha.LocalizaGrupo(const pContaCredito,
                                             pContaDebito,
                                             pCCustoCredito,
                                             pCCustoDebito: String;
                                       const pPlano,
                                             pPatro,
                                             pAtividadeProjeto,
                                             pUnidadeNegocio: Integer): Integer;
var iCount : Integer;
    oGrupo : TSingleGrupo;
    sDadosContabeis : String;
    sLinhaDados     : String;
begin
  Result := -1;
  sLinhaDados := Format('%s - %s - %s - %s - %d - %d - %d - %d',
                        [ pContaCredito,
                          pContaDebito,
                          pCCustoCredito,
                          pCCustoDebito,
                          pPlano,
                          pPatro,
                          pAtividadeProjeto,
                          pUnidadeNegocio]);
  For iCount := 0 to Count -1 do
  begin
    oGrupo := Grupos[iCount];
    sDadosContabeis := oGrupo.DadosContabeis;
    If sLinhaDados = sDadosContabeis then
    begin
      Result := iCount;
      break;
    end;
  end;
end;


end.
