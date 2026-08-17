unit uCtrlTipoCustoRecImov;
//***************************************************************************************
//Rotina             : LookupTipoCustoRecImov
//N. SIG..........   : 103856
//Data da Alteração: : 30/06/2021
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão do campo FLGRECCUSTCONTRATO na consulta que carrega os campos
//										 da tabela TIPOCUSTORECIMOV.
//***************************************************************************************
//Rotina             : LookupTipoCustoRecImov
//N. SIG..........   : 115585
//Data da Alteração: : 18/05/2021
//Alteração Form:    : uCtrlTipoCustoRecImov 
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Retirada do campo FLGMAODEOBRA na consulta que carrega os campos
//										 da tabela TIPOCUSTORECIMOV
//***************************************************************************************
//Rotina             : LookupTipoCustoRecImov
//N. SIG..........   : 23656.59194
//Data da Alteração: : 27/11/2017
//Alteração Form:    : uCtrlTipoCustoRecImov
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão do campo FLGMAODEOBRA na consulta que carrega os campos
//										 da tabela TIPOCUSTORECIMOV
//***************************************************************************************

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
     uDBTipoCustoRecImov;

Type
  TCtrlTipoCustoRecImov = class(TCmControlObject)
  private
    FCdsTipoCustoRecImov: TCMClientDataSet;
    FDBTipoCustoRecImov: TDbTipoCustoRecImov;

    procedure SetCdsTipoCustoRecImov(const Value: TCMClientDataSet);
    procedure SetDBTipoCustoRecImov(const Value: TDbTipoCustoRecImov);

  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  public
    constructor Create; override;
    destructor Destroy; override;

    property DBTipoCustoRecImov: TDbTipoCustoRecImov read FDBTipoCustoRecImov write SetDBTipoCustoRecImov;
    property CdsTipoCustoRecImov: TCMClientDataSet read FCdsTipoCustoRecImov write SetCdsTipoCustoRecImov;

    function GravaTipoCustoRecImov: Boolean;

    function LookupTipoCustoRecImov(const idModulo: Integer = -1; const sRecCusto: String = ''; const iIdTipoCustoRecImo: integer = -1; const sFlgDiario: string = ''; bMostraItemArvore : Boolean = True) : OLEVariant;

    function ReceitaPossuiBloqueioJudicial(const iReceita : Integer) : Boolean;

  published

end;


implementation


{ TCtrlTipoCustoRecImov }

procedure TCtrlTipoCustoRecImov.AfterInitialize;
begin
  inherited;
  FDBTipoCustoRecImov.DataBaseName := DataBaseName;
end;

constructor TCtrlTipoCustoRecImov.Create;
begin
  inherited;
  FDBTipoCustoRecImov := TDbTipoCustoRecImov.Create( Self );
end;

destructor TCtrlTipoCustoRecImov.Destroy;
begin
  inherited;
  FreeAndNil(FDBTipoCustoRecImov);
  if isAppServer then begin
    FreeAndNil(FCdsTipoCustoRecImov);
  end;
end;

function TCtrlTipoCustoRecImov.GravaTipoCustoRecImov: Boolean;
var
  sMsg : string;
begin
    if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.GravaTipoCustoRecImov (CdsTipoCustoRecImov.Data);
    if not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;
      Result := ApplyCds(CdsTipoCustoRecImov, DBTipoCustoRecImov, [], []);
      sMsg := DBTipoCustoRecImov.MessageInfo;

      if  not Result then raise Exception.Create(sMsg);

      Commit;
    except
      on E:Exception do begin
        Result := false;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

{ valores para sflgDiario
  ''  - pega todas as receitas/despesas independente se possui
        contabilização diária
  'S' - pega todas as receitas/despesas que possuam contabilização diária,
        independente da periodicidade
  'M' - pega todas as receitas/despesas que possuam contabilização diária,
        com periodicidade mensal
  'A' - pega todas as receitas/despesas que possuam contabilização diária,
        com periodicidade ANUAL
}
function TCtrlTipoCustoRecImov.LookupTipoCustoRecImov(const idModulo: integer; const sRecCusto: String; const iIdTipoCustoRecImo: integer; const sFlgDiario: string; bMostraItemArvore : Boolean): OLEVariant;
var
  sSql,sParam : String;
begin
  sParam := '';
  if idModulo <> -1           then sParam := sParam + ' AND ( T.IDMODULO = '          + IntToStr(idModulo)+' ) '+#13;
  if sRecCusto <> ''          then sParam := sParam + ' AND ( T.RECCUSTO = '          + QuotedStr(sRecCusto)+' ) '+#13;
  if iIdTipoCustoRecImo <> -1 then sParam := sParam + ' AND ( T.IDTIPOCUSTORECIMO = ' + IntToStr(iIdTipoCustoRecImo)+' ) '+#13;

  if sFlgDiario <> '' then begin
    if sFlgDiario = 'S' then sParam := sParam + ' AND ( T.FLGDIARIO <> ' + QuotedStr('N')+' ) '+#13
    else                     sParam := sParam + ' AND ( T.FLGDIARIO =  ' + QuotedStr(sFlgDiario)+' ) '+#13;
  end;


  if not bMostraItemArvore then
  begin
     sParam := sParam + 'AND T.IDTIPOCUSTORECIMO NOT IN (' + #13 +
                                                         'SELECT' + #13 +
                                                         '    DISTINCT FC.IDTIPOCUSTORECIMO' + #13 +
                                                         'FROM' + #13 +
                                                         '    FORMACALCIMOBXITEM FC,' + #13 +
                                                         '    TIPOCUSTORECIMOV TC' + #13 +
                                                         'WHERE' + #13 +
                                                         '    TC.RECCUSTO = ''R''' + #13 +
                                                         'AND TC.IDTIPOCUSTORECIMO = FC.IDTIPOCUSTORECIMO' + #13 +
                                                         'AND TC.IDMODULO = ' + IntToStr(idModulo) + #13 +
                                                        ')' + #13;
  end;

  sSql := 'SELECT ' +
          '   T.IDTIPOCUSTORECIMO,  T.DESCCUSTORECIMO, T.CODTIPDOC,         '+#13+
          '   T.RECCUSTO,           T.IDRECEITAREEMB,  T.FLGOBRIGAORCPREST, '+#13+
          '   T.FLGOBRIGAORC,       T.FLGREEMBOLSO,    T.IDMODULO,          '+#13+
          '   T.IDTIPODESPESA,      T.FLGDIARIO,       T.IDOPERCONTAB,      '+#13+
          '   T.FLGRENTAB,          T.FLGTIPOOPER,     T.FLGBLOQJUDICIAL,   '+#13+
          '   DECODE(T.RECCUSTO,''C'',''Despesa'',''R'',''Receita'',''O'',''Operação'',''Cálculo'') AS DSC_TIPO, '+#13+
          '   DECODE(T.FLGTIPOOPER,''A'',''Acréscimo'',''D'',''Desconto'') AS DESC_TIPOOPER '+#13+
          //Cássio Rovaroto - SIG nº 115585 - Início
          //Cássio Rovaroto - SIG nº23656.59194 - Início
          //'   , T.FLGMAODEOBRA ' +#13+
          //Cássio Rovaroto - SIG nº23656.59194 - Fim
          //Cássio Rovaroto - SIG nº 115585 - Fim
          '   , NVL(T.FLGRECCUSTCONTRATO, 0) AS FLGRECCUSTCONTRATO ' +#13+ //Cássio Rovaroto - SIG nº 103856
          ' FROM  TIPOCUSTORECIMOV T ' +#13+
          ' WHERE  1=1 ' +#13+
          sParam +
          ' ORDER BY T.RECCUSTO, T.DESCCUSTORECIMO '+#13;

  Result := GetDataPacket( sSql );
end;

procedure TCtrlTipoCustoRecImov.onCreateAppServer;
begin
  inherited;
  FCdsTipoCustoRecImov := TCMClientDataSet.Create(nil);
end;



function TCtrlTipoCustoRecImov.ReceitaPossuiBloqueioJudicial(const iReceita: Integer): Boolean;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                        + #13+
   '   NVL(FLGBLOQJUDICIAL,0) AS FLGBLOQJUDICIAL'  + #13+
   'FROM'                                          + #13+
   '   TIPOCUSTORECIMOV'                           + #13+
   'WHERE'                                         + #13+
   '   IDTIPOCUSTORECIMO = ' + IntToStr(iReceita)  + #13;
   _cds.Data := GetDataPacket(sSQL);

   Result := (_cds.FieldByName('FLGBLOQJUDICIAL').AsInteger = 1);
end;



procedure TCtrlTipoCustoRecImov.SetCdsTipoCustoRecImov(const Value: TCMClientDataSet);
begin
  FCdsTipoCustoRecImov := Value;
end;

procedure TCtrlTipoCustoRecImov.SetDBTipoCustoRecImov(const Value: TDbTipoCustoRecImov);
begin
  FDBTipoCustoRecImov := Value;
end;

end.
