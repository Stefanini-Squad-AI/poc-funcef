unit uCtrlImportacaoDiretaRH;
                                                              
interface

uses SysUtils, classes, DB, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
  uCtrlCustomRH;

type
  TCtrlImportacaoDiretaRH = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  protected
    FCdsColunas: TCMClientDataSet;
    FDadosArquivo: TStringList;
    FIndice, FLinhaAtual: LongInt;
    FListaCampos, FListaTamCampos, FCampoSeq, FNomeArq, FNomeTabela: string;

    function InListTiposString(Valor: string): boolean;
    function TratarDadosLinha(Linha: string; ListaCampos, ListaTamCampos: string): boolean;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListTabela(NomeTabela: string): OleVariant;

    function IniciarImportacao(DadosArquivo, ListaCampos, ListaTamCampos: string;
      ApagarDados: boolean): boolean;
    function ImportacaoLinha(Linha: string): boolean;

    property CdsColunas: TCMClientDataSet read FCdsColunas write FCdsColunas;
    property CampoSeq: string read FCampoSeq write FCampoSeq;
    property NomeArq: string read FNomeArq write FNomeArq;
    property NomeTabela: string read FNomeTabela write FNomeTabela;
    property LinhaAtual: LongInt read FLinhaAtual;
  end;

implementation

uses uCtrlFuncoesRH;

const
  MAX_TIPO_DADO = 4;
  TiposDeDado: array[1..MAX_TIPO_DADO] of string = ('VARCHAR2', 'CHAR', 'VARCHAR', 'LONG');

{ TCtrlImportacaoDiretaRH }

constructor TCtrlImportacaoDiretaRH.Create;
begin
  inherited;
  FDadosArquivo := TStringList.Create;
end;

destructor TCtrlImportacaoDiretaRH.Destroy;
begin
  FDadosArquivo.Free;
  if (IsAppServer) then
    FCdsColunas.Free;
  inherited;
end;

procedure TCtrlImportacaoDiretaRH.OnCreateAppServer;
begin
  inherited;
  FCdsColunas := TCMClientDataSet.Create(nil);
end;

procedure TCtrlImportacaoDiretaRH.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlImportacaoDiretaRH.ListTabela(NomeTabela: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  COLUMN_NAME, DATA_TYPE ,NULLABLE'+CR_LF+
    'FROM'+CR_LF+
    '  ALL_TAB_COLUMNS'+CR_LF+
    'WHERE'+CR_LF+
    '  (TABLE_NAME = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF+
    '  (OWNER      = ''CM'')'+CR_LF+
    'ORDER BY'+CR_LF+
    '  COLUMN_NAME');
end;

function TCtrlImportacaoDiretaRH.IniciarImportacao(DadosArquivo, ListaCampos,
  ListaTamCampos: string; ApagarDados: boolean): boolean;
var
  _Cds: TCMClientDataSet;
  c: integer;
  iSequence: LongInt;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.IniciarImportacao(FCdsColunas.Data, DadosArquivo,
      ListaCampos, ListaTamCampos, ApagarDados);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    _Cds := TCMClientDataSet.Create(nil);
    try
      FDadosArquivo.Text := DadosArquivo;
      FListaCampos := ListaCampos;
      FListaTamCampos := ListaTamCampos;

      if (ApagarDados) and not(ExecSQL('DELETE FROM ' +FNomeTabela)) then
      begin
        MessageInfo := 'Não pude excluir os dados da tabela: ' +FNomeTabela+ '.' +
          CR_LF+CR_LF+ 'Erro:' +CR_LF+ MessageInfo;
        DoProgresso([MessageInfo]);
        raise Exception.Create(MessageInfo);
      end;

      if (FCampoSeq <> '') then
      begin
        if (ApagarDados) then
          FIndice := 0
        else
        begin
          iSequence := GetSequence(FNomeTabela);
          _Cds.Data := GetDataPacket('SELECT NVL(MAX(' +FCampoSeq+ '),0) AS ULTIMO FROM ' +
            FNomeTabela);
          FIndice := Trunc(_Cds.FieldByName('ULTIMO').asFloat);

          if (FIndice > iSequence) then
          begin
            for c:=iSequence to FIndice do
              GetSequence(FNomeTabela);
          end
          else
            FIndice := GetSequence(FNomeTabela);

          Dec(FIndice);
        end;
      end;

      FLinhaAtual := 1;
      Result := true;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    _Cds.Free;
  end;
end;

function TCtrlImportacaoDiretaRH.ImportacaoLinha(Linha: string): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ImportacaoLinha(Linha);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := TratarDadosLinha(Linha, FListaCampos, FListaTamCampos);
      if (Result) then
        DoProgresso([
          'OK   [linha ' +IntToStr(FLinhaAtual)+ ']: ' +Linha])
      else
        DoProgresso([
          'Erro [linha ' +IntToStr(FLinhaAtual)+ ']: ' +Linha+ CR_LF+
          '     ----------------------------------------------------------' +CR_LF+
          '     Mensagem de Erro do Banco de Dados para a linha anterior :' +CR_LF+
          '     Erro: '+ MessageInfo +CR_LF+
          '     ----------------------------------------------------------' +CR+LF]);

      Inc(FLinhaAtual);
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlImportacaoDiretaRH.TratarDadosLinha(Linha: string; ListaCampos,
  ListaTamCampos: string): boolean;
var
  iTamConteudo, iUltPosicao: integer;
  sCampoAtual, sTamCampoAtual, sConteudo, sSQLFields, sSQLValues: string;
begin
  Result := false;
  if (Trim(ListaCampos) = '') or (Trim(ListaTamCampos) = '') then
    exit;

  // ler campo a campo da linha formando a string a inserir
  sSQLFields := '';
  sSQLValues := '';
  iUltPosicao := 1;

  if (FCampoSeq <> '') then
  begin
    sSQLFields := FCampoSeq;

    Inc(FIndice);

    sSQLValues := IntToStr(FIndice);
  end;

  repeat
    ExtraiString(ListaCampos, sCampoAtual, ',');
    ExtraiString(ListaTamCampos, sTamCampoAtual, ',');

    if (sSQLFields = '') then
      sSQLFields := sCampoAtual
    else
      sSQLFields := sSQLFields +','+ sCampoAtual;

    iTamConteudo := StrToInt(sTamCampoAtual);
    sConteudo := Copy(Linha, iUltPosicao, iTamConteudo);
    iUltPosicao := iUltPosicao + iTamConteudo;

    // Adicionar o conteudo a string de conteudos de acordo com o seu tipo
    if not(FCdsColunas.Locate('COLUMN_NAME', sCampoAtual, [loCaseInsensitive])) then
      exit;

    if (Trim(sConteudo) = '') then
    begin
      sConteudo := 'NULL';
      if (sSQLValues = '') then
        sSQLValues := sConteudo
      else
        sSQLValues := sSQLValues +', '+ sConteudo;
    end
    else
    begin
      if (InlistTiposString(FCdsColunas.FieldByName('DATA_TYPE').asString)) then
      begin //conteudo é do tipo String
        if (sSQLValues = '') then
          sSQLValues := QuotedStr(sConteudo)
        else
          sSQLValues := sSQLValues +', '+ QuotedStr(sConteudo);
      end
      else
      begin
        if (FCdsColunas.FieldByName('DATA_TYPE').asString = 'DATE') then
        begin // conteudo é do tipo Data
          if (sSQLValues = '') then
            sSQLValues := 'TO_DATE(' +QuotedStr(sConteudo)+ ',''DD/MM/YYYY'')'
          else
            sSQLValues := sSQLValues + ', TO_DATE('+QuotedStr(sConteudo)+ ',''DD/MM/YYYY'')';
        end
        else
        begin // conteudo é do tipo Numerico
          if (sSQLValues = '') then
            sSQLValues := sConteudo
          else
            sSQLValues := sSQLValues +', '+ sConteudo
        end;
      end;
    end;
  until (ListaCampos = '');

  // Gravar a linha
  try
    Result := ExecSQL('INSERT INTO ' +FNomeTabela+ '(' +sSQLFields+ ') VALUES (' +sSQLValues+ ')');
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlImportacaoDiretaRH.InListTiposString(Valor: string): boolean;
var
  c: integer;
begin
  Result := false;
  for c:=1 to MAX_TIPO_DADO do
    if (TiposDeDado[c] = Valor) then
    begin
      Result := true;
      break;
    end;
end;

end.
