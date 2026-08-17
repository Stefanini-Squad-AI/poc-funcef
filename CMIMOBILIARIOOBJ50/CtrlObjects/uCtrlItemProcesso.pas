{-------------------------------------------------------------------------------

      OBJETO DE CONTROLE DE ITENS POR PROCESSO  ( MT )

      Módulo               :  Comuns Imobiliário ( CMImobiliarioObj50 )
      Analista Responsável :  Daniel Simões
      Data de Término      :  25/06/2007

--------------------------------------------------------------------------------
FUNÇÕES PUBLICADAS -------------------------------------------------------------
--------------------------------------------------------------------------------

    LookupItens        - Função que retorna todos os Itens cadastrados...
    LookupRelatorio    - Função que retorna os Relatórios disponíveis por módulo...
    LookupTipoInterno  - Função que retorna os Tipos Internos do Relatório selecionado...
    LookupMovimentacao - Função que retorna os Tipos de Movimentação por Módulo...

    GravaItemProcesso  - Função que grava os Itens selecionados na tabela PROCESSOIMOB...

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlItemProcesso;

interface

uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes,
     uDbItemXProcessoImob, uComunsImobiliario, uCtrlModuloImobiliario;

type
  TCtrlItemProcesso = class(TCmControlObject)

  private
    ParamSistema          : TParamSistema;
    CtrlModuloImobiliario : TCtrlModuloImobiliario;

    FCdsItemProcesso     : TCMClientDataSet;
    FDbItemXProcessoImob : TDbItemXProcessoImob;
    FiIdItemXProcImob    : Integer;

    procedure SetCdsItemProcesso(const Value: TCMClientDataSet);
    procedure SetDbItemXProcessoImob(const Value: TDbItemXProcessoImob);
    procedure SetiIdItemXProcImob(const Value: Integer);

  protected
    procedure AfterInitialize;   Override;
    procedure OnCreateAppServer; Override;

  public
    constructor Create(const iIdModulo:Integer); reintroduce;
    destructor Destroy; override;

    property CdsItemProcesso      : TCMClientDataSet     read FCdsItemProcesso     write SetCdsItemProcesso;
    property DbItemXProcessoImob  : TDbItemXProcessoImob read FDbItemXProcessoImob write SetDbItemXProcessoImob;
    property iIdItemXProcImob     : Integer              read FiIdItemXProcImob    write SetiIdItemXProcImob;

    function LookupRelatorio(const iModulo:Integer=-1): OLEVariant;
    function LookupTipoInterno(const iReport:Integer=-1): OLEVariant;
    function LookupItens(const iModulo:Integer=-1): OLEVariant;
    function LookupMovimentacao(const iModulo:Integer=-1): OLEVariant;

    function GravaItemProcesso: Boolean;

  published

end;

implementation

{ TCtrlItemProcesso }

procedure TCtrlItemProcesso.AfterInitialize;
begin
  inherited;

  // Define o DataBase a ser utilizado...
  FDbItemXProcessoImob.DataBaseName := DataBaseName;

  CtrlModuloImobiliario.InitializeAs(Self);
end;

constructor TCtrlItemProcesso.Create(const iIdModulo:Integer);
begin
  inherited Create;

  // Cria os DBObjects...
  FDbItemXProcessoImob  := TDbItemXProcessoImob.Create( Self );

  CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;
  ParamSistema.idModulo := iIdModulo;
end;

destructor TCtrlItemProcesso.Destroy;
begin
  inherited;

  // Destrói os DBObjects criados...
  FDbItemXProcessoImob.Free;

  FreeAndNil(CtrlModuloImobiliario);
end;

procedure TCtrlItemProcesso.OnCreateAppServer;
begin
  inherited;

end;

procedure TCtrlItemProcesso.SetCdsItemProcesso(const Value: TCMClientDataSet);
begin
  FCdsItemProcesso := Value;
end;

procedure TCtrlItemProcesso.SetDbItemXProcessoImob(const Value: TDbItemXProcessoImob);
begin
  FDbItemXProcessoImob := Value;
end;

procedure TCtrlItemProcesso.SetiIdItemXProcImob(const Value: Integer);
begin
  FiIdItemXProcImob := Value;
end;

function TCtrlItemProcesso.LookupRelatorio(const iModulo:Integer): OLEVariant;
var sSql, sParam : String;
begin
  Result := True;

  sParam := '';
  sSql   := '';

  if (iModulo<>-1) then sParam := sParam+'  AND B.IDMODULO = '+QuotedStr(IntToStr(iModulo));

  sSql := 'SELECT DISTINCT B.IDREPORTS, R.NAME ' +#13+
          'FROM PROCESSOIMOB B, REPORTS R '      +#13+
          'WHERE B.IDREPORTS = R.IDREPORTS '     +#13+sParam+#13;

  sSql := sSql+'ORDER BY NAME';

  Result := GetDataPacket(sSql);
end;

function TCtrlItemProcesso.LookupTipoInterno(const iReport:Integer): OLEVariant;
var sSql, sParam : String;
begin
  Result := True;

  sParam := '';
  sSql   := '';

  if (iReport<>-1) then sParam := sParam+'  AND IDREPORTS = '+QuotedStr(IntToStr(iReport));

  sSql := 'SELECT TIPOINTERNO, DESCRICAO, IDPROCESSOIMOB ' +#13+
          'FROM PROCESSOIMOB '                             +#13+
          'WHERE 1=1 '                                     +#13+sParam+#13;

  sSql := sSql+'ORDER BY DESCRICAO ';

  Result := GetDataPacket(sSql);
end;

function TCtrlItemProcesso.LookupItens(const iModulo: Integer): OLEVariant;
var sSql, sParam : String;
begin
  Result := True;

  sParam := '';
  sSql   := '';

  if (iModulo<>-1) then sParam := sParam+'  AND P.IDMODULO  = '+QuotedStr(IntToStr(iModulo));

  sSql := 'SELECT DISTINCT P.DESCRICAO AS NOMETIPOINTERNO, T.DESCCUSTORECIMO AS MOVIMENTACAO, R.NAME AS PROCESSO, ' +#13+
          '       P.TIPOINTERNO, P.IDPROCESSOIMOB, P.IDREPORTS, I.IDITEMXPROCIMOB, T.IDTIPOCUSTORECIMO '            +#13+
          'FROM PROCESSOIMOB P, ITEMXPROCESSOIMOB I, TIPOCUSTORECIMOV T, REPORTS R '                                +#13+
          'WHERE I.IDPROCESSOIMOB    = P.IDPROCESSOIMOB '                                                           +#13+
          '  AND I.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO(+) '                                                     +#13+
          '  AND P.IDREPORTS         = R.IDREPORTS '                                                                +#13+sParam+#13;

  sSql := sSql+'ORDER BY NOMETIPOINTERNO ';

  Result := GetDataPacket(sSql);
end;

function TCtrlItemProcesso.LookupMovimentacao(const iModulo:Integer): OLEVariant;
var sSql, sParam : String;
begin
  Result := True;

  sParam := '';
  sSql   := '';

  if (iModulo<>-1) then sParam := sParam+'  AND IDMODULO  = '+QuotedStr(IntToStr(iModulo));

  sSql := 'SELECT IDTIPOCUSTORECIMO, DESCCUSTORECIMO ' +#13+
          'FROM TIPOCUSTORECIMOV '                     +#13+
          'WHERE RECCUSTO IN(''R'',''C'') '            +#13+sParam+#13;

  sSql := sSql + 'ORDER BY DESCCUSTORECIMO ';

  Result := GetDataPacket(sSql);
end;

function TCtrlItemProcesso.GravaItemProcesso: Boolean;
begin
  { Verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
    através da aplicação servidora... }
  if ConnectionSide=cnsClient then begin
    Result := Connection.AppServer.GravaItemProcesso( CdsItemProcesso.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      if OpenTransaction then StartTransaction;

      // Aplica as alterações do Cds através do DbObject...
      Result := ApplyCds( CdsItemProcesso, DbItemXProcessoImob, [], [] );
      if not Result then raise Exception.Create( DbItemXProcessoImob.MessageInfo );
      if OpenTransaction then Commit;
    except
      on E : Exception do begin
        Result := False;
        if OpenTransaction then Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
