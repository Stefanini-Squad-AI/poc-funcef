unit uCtrlListaServicos; 

interface  

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, uCMTypes,
     DbClient, Classes, uDbListaServicos, uDbTributacaoListaServico,
     uCtrlPadroes;

type

  TCtrlListaServicos = class(TCmControlObject)
  Protected
  private
    Fcds: TClientDataSet;
    FcdsDet: TClientDataSet;
    dbListaServicos: TDbListaServicos;
    dbTributacaoListaServico: TDbTributacaoListaServico;
    CtrlPadroes: TCtrlPadroes;
    procedure Setcds(const Value: TClientDataSet);
    procedure SetcdsDet(const Value: TClientDataSet);

  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;

  Public
    constructor Create;  Override;
    destructor  Destroy; Override;
    function ListServicos(IdServico: Double) : OLEVariant;
    function ListTributacaoServico(IdServico: Double): OleVariant;
    function ListNaturezaRendimentoREINF(CodNatureza: Double): OleVariant;
    function GetTipoTributacaoServico(iIdServico: Integer): OleVariant;
    function GetAlteradorTributacaoServico(iIdServico, iTipoTributo: Integer): OleVariant;
    function GravarServico: Boolean;
    function ExcluirServico: Boolean;
    function VerificaServicoExistente(sCodigo: string): Boolean;
    function ExisteTributacaoServico(IdServico: Double): Boolean;

    property cds: TClientDataSet read Fcds write Setcds;
    property cdsDet: TClientDataSet read FcdsDet write SetcdsDet;
 end;

implementation

{ TCtrlListaServicos }

constructor TCtrlListaServicos.Create;
begin
  inherited;
  dbListaServicos := TDbListaServicos.Create(Self);
  dbTributacaoListaServico := TDbTributacaoListaServico.Create(Self);
  CtrlPadroes := TCtrlPadroes.Create;
end;

destructor TCtrlListaServicos.Destroy;
begin
  inherited;
  FreeAndNil(dbListaServicos);
  FreeAndNil(dbTributacaoListaServico);
  FreeAndNil(CtrlPadroes);
  FreeAndNil(Fcds);
  FreeAndNil(FcdsDet);
end;

procedure TCtrlListaServicos.DoChangeDataBase;
begin
  inherited;
  dbListaServicos.DataBaseName := DataBaseName;
  dbTributacaoListaServico.DataBaseName := DataBaseName;
end;

function TCtrlListaServicos.ExcluirServico: Boolean;
var
  sMsg: String;
begin
  Result := True;

  try
    StartTransaction;

    cdsDet.First;
    while not cdsDet.Eof do
    begin
      cdsDet.Delete;
      cdsDet.Next;
    end;

    Result := ApplyCds(FcdsDet, dbTributacaoListaServico, [dbListaServicos.IdServico],
                                                              [dbTributacaoListaServico.IdServico]);
    sMsg := dbTributacaoListaServico.MessageInfo;

    Result := ApplyCds(FCds, dbListaServicos, [], []);
    sMsg := dbListaServicos.MessageInfo;

    Commit;
  except
    on e: Exception do
    begin
      Result := False;
      Rollback;
      MessageInfo := e.Message;
    end;
  end;
end;

function TCtrlListaServicos.ExisteTributacaoServico(
  IdServico: Double): Boolean;
var
  cdsAux: TClientDataSet;
begin
  Result := False;
  cdsAux := TClientDataSet.Create(nil);
  try
    cdsAux.Data := ListTributacaoServico(IdServico);

    Result := not(cdsAux.IsEmpty) or (cdsAux.RecordCount > 0);
  finally
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlListaServicos.GetAlteradorTributacaoServico(iIdServico,
  iTipoTributo: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT ''N'' AS SEL,                                  '+#13#10+
          '       TS.CODALTERADOR,                               '+#13#10+
          '			  TA.DESCRICAO,                                  '+#13#10+
          '			  TS.TIPOTRIBUTO,                                '+#13#10+
          '       CASE WHEN TS.TIPOTRIBUTO = 0 THEN ''IRRF''     '+#13#10+
          '            WHEN TS.TIPOTRIBUTO = 1 THEN ''PIS''      '+#13#10+
          '            WHEN TS.TIPOTRIBUTO = 2 THEN ''COFINS''   '+#13#10+
          '            WHEN TS.TIPOTRIBUTO = 3 THEN ''CSLL''     '+#13#10+
          '            WHEN TS.TIPOTRIBUTO = 4 THEN ''Agregado'' '+#13#10+
          '        END AS DESC_TIPOTRIBUTO,                      '+#13#10+
          '			  TS.ALIQUOTA,                                   '+#13#10+
          '       TS.PERTRIBUTO,                                 '+#13#10+
          '  CASE WHEN TS.PERTRIBUTO = 0 THEN ''No lançamento''  '+#13#10+
          '       WHEN TS.PERTRIBUTO = 1 THEN ''Na liquidação''  '+#13#10+
          '       ELSE ''Não definido'' END AS DESC_PERTRIBUTO,  '+#13#10+
          '			  TA.ACRESDECRES                                 '+#13#10+
          '  FROM CM.TRIBUTACAO_LISTA_SERVICOS TS                '+#13#10+
          '  JOIN CM.TIPOALTERADOR TA                            '+#13#10+
          '    ON TA.CODALTERADOR  = TS.CODALTERADOR             '+#13#10+
          ' WHERE IDSERVICO = ' + IntToStr(iIdServico)            +#13#10+
          '   AND TIPOTRIBUTO =  ' + IntToStr(iTipoTributo)       +#13#10+
          ' ORDER BY TS.TIPOTRIBUTO, CODALTERADOR                ';

  Result := GetDataPacket(sSQL);
end;

function TCtrlListaServicos.GetTipoTributacaoServico(iIdServico: Integer): OleVariant;
var
  sSQL: string;
begin
  sSQL := 'SELECT TS.TIPOTRIBUTO                       ' +#13#10+
          '  FROM CM.TRIBUTACAO_LISTA_SERVICOS TS      ' +#13#10+
          ' WHERE IDSERVICO = ' + IntToStr(iIdServico)   +#13#10+
          ' GROUP BY TS.TIPOTRIBUTO                    ';

  Result := GetDataPacket(sSQL);

end;

function TCtrlListaServicos.GravarServico: Boolean;
var
  sMsg: String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarServico;
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCds, dbListaServicos, [], []);
      sMsg := dbListaServicos.MessageInfo;

      Result := ApplyCds(FcdsDet, dbTributacaoListaServico, [dbListaServicos.IdServico],
                                                              [dbTributacaoListaServico.IdServico]);
      sMsg := dbTributacaoListaServico.MessageInfo;


      Commit;
    except
      on e: Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := e.Message;
      end;
    end;
  end;
end;

function TCtrlListaServicos.ListNaturezaRendimentoREINF(
  CodNatureza: Double): OleVariant;
var
  sSQL: String;
begin
  sSQL := 'SELECT N.CODNATUREZAREINF,                                  ' +#13#10+
  	      '  		 N.CODNATUREZAREINF || '' - '' || N.TITULO AS DESCR ' +#13#10+
          '  FROM NATUREZA_RENDIMENTO_REINF N                          ';

  if CodNatureza > -1 then
    sSql := sSQL + ' WHERE CODNATUREZAREINF = ' + FloatToStr(CodNatureza);

  Result := GetDataPacket(sSQL);
end;

function TCtrlListaServicos.ListServicos(IdServico: Double): OLEVariant;
var sSQL : String;
begin
  sSQL := 'SELECT              '#13#10+
          '  IDSERVICO,        '#13#10+
          '  CODIGO,           '#13#10+
          '  NOME,             '#13#10+
          '  DESCRICAO,        '#13#10+
          '  CODNATUREZAREINF  '#13#10+
          'FROM LISTA_SERVICOS '#13#10+
          ' WHERE IDSERVICO = ' + FloatToStr(IdServico);
             
  Result := GetDataPacket(sSQL);
end;
function TCtrlListaServicos.ListTributacaoServico(
  IdServico: Double): OleVariant;
var
  sSQL: String;
begin
  sSQL := 'SELECT                      '+#13#10+
          '  TS.IDTRIBLISTSERVICO,        '+#13#10+
          '  TS.IDSERVICO,                '+#13#10+
          '  TS.CODALTERADOR,             '+#13#10+
          '  TA.DESCRICAO AS DESC_ALTERADOR, '+#13#10+
          '  TS.TIPOTRIBUTO,              '+#13#10+
          '  CASE WHEN TS.TIPOTRIBUTO = 0 THEN ''IRRF'''+#13#10+
          '       WHEN TS.TIPOTRIBUTO = 1 THEN ''PIS'''+#13#10+
          '       WHEN TS.TIPOTRIBUTO = 2 THEN ''COFINS'''+#13#10+
          '       WHEN TS.TIPOTRIBUTO = 3 THEN ''CSLL'''+#13#10+
          '       WHEN TS.TIPOTRIBUTO = 4 THEN ''Agregado'''+#13#10+
          '  END AS DESC_TIPOTRIBUTO,   '+#13#10+
          '  TS.ALIQUOTA,              '+#13#10+
          '  TS.PERTRIBUTO,             '+#13#10+
          '  CASE WHEN TS.PERTRIBUTO = 0 THEN ''No lançamento'''+#13#10+
          '       WHEN TS.PERTRIBUTO = 1 THEN ''Na liquidação'''+#13#10+
          '       ELSE ''Não definido'' END AS DESC_PERTRIBUTO '+#13#10+
          'FROM                        '+#13#10+
          '  TRIBUTACAO_LISTA_SERVICOS TS '+#13#10+
          'LEFT JOIN                   '+#13#10+
          '  TIPOALTERADOR TA          '+#13#10+
          '  ON TA.CODALTERADOR = TS.CODALTERADOR '+#13#10+
          ' WHERE IDSERVICO = ' + FloatToStr(IdServico) +#13#10+
          ' ORDER BY TS.TIPOTRIBUTO, TS.CODALTERADOR ';

  Result := GetDataPacket(sSQL);
end;

procedure TCtrlListaServicos.OnCreateAppServer;
begin
  inherited;
  Fcds := TClientDataSet.Create(nil);
  FcdsDet := TClientDataSet.Create(nil);
end;

procedure TCtrlListaServicos.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlListaServicos.SetcdsDet(const Value: TClientDataSet);
begin
  FcdsDet := Value;
end;

function TCtrlListaServicos.VerificaServicoExistente(
  sCodigo: string): Boolean;
var
  sSQL: String;
  cdsAux : TClientDataSet;
begin
  Result := False;
  try
    cdsAux := TClientDataSet.Create(nil);
    sSQL :=  'SELECT IDSERVICO      ' +#13#10+
             '  FROM LISTA_SERVICOS ' +#13#10+
             ' WHERE CODIGO = ' + QuotedStr(sCodigo);
    cdsAux.Data := GetDataPacket(sSQL);

    if not cdsAux.IsEmpty then
      Result := True;
  finally
    FreeAndNil(cdsAux);
  end;
end;

end.
