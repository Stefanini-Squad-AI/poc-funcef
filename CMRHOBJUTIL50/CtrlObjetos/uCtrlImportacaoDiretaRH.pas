unit uCtrlImportacaoDiretaRH;

interface

uses SysUtils, Classes, DB, uCmControlObject, uCmDbObject, IvDictio,
  uCmClientDataSet, uCMTypes, uCtrlCustomRH;

type
  TCtrlImportacaoDiretaRH = class(TCtrlCustomRH)
  private
    procedure EnviarMensagemCliente(const Msg: WideString;
      IncrementaProgresso: WordBool = false; AtualizaItens: WordBool = false);
  protected
    FCdsColunas: TCMClientDataSet;
    FDadosArquivo: TStringList;
    FValorCampoSeq,FIndice, FLinhaAtual: LongInt;
    FListaCampos, FListaTamCampos, FCampoSeq, FNomeArq, FNomeTabela: string;
    FIAppCliente: OleVariant; // Armazena o procedimento de atualização do progresso no cliente

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    function  GetCampoFormatado(TipoCampo: TFieldType; Valor: string): string;
    function  ExcluirDadosTabela: boolean;
    function  GetUltimoCampoSeq(ApagarDados: boolean): boolean;
    function  InserirLinhaAtual(Linha: string; ListaCampos, ListaTamCampos: string): boolean;

  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListTabela(NomeTabela: string): OleVariant;
    function  ImportarLinhaAtual(Linha: string): boolean;
    function ImportarDadosTabela(const IAppCliente: OleVariant; DadosArquivo, ListaCampos,
      ListaTamCampos: string; ApagarDados, PararComErro: boolean): boolean;
    function IniciarImportacao(DadosArquivo, ListaCampos, ListaTamCampos: string;
      ApagarDados: boolean): boolean;
    property CdsColunas: TCMClientDataSet read FCdsColunas write FCdsColunas;
    property CampoSeq: string read FCampoSeq write FCampoSeq;
    property NomeArq: string read FNomeArq write FNomeArq;
    property NomeTabela: string read FNomeTabela write FNomeTabela;
    property LinhaAtual: LongInt read FLinhaAtual;
  end;

implementation

uses uCtrlFuncoesRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SEM_CAMPO = 'O campo ":1" não existe na tabela indicada.';
  MSG_OK_LINHA = 'OK   [Linha :1]: ';
  MSG_ERRO_LINHA = 'Erro [Linha :1]: ';
  MSG_NUM_ERROS = 'Importação executada com :1 erros.';

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

procedure TCtrlImportacaoDiretaRH.EnviarMensagemCliente(const Msg: WideString;
  IncrementaProgresso, AtualizaItens: WordBool);
begin
  try
    FIAppCliente.ProcessarImportacaoDiretaRH_CB(Msg, IncrementaProgresso, AtualizaItens);
  except
  end;
end;

function TCtrlImportacaoDiretaRH.ListTabela(NomeTabela: string): OleVariant;
begin
  Result := GetDataPacket('SELECT * FROM ' +NomeTabela+ ' WHERE (1 = 2)');
end;

function TCtrlImportacaoDiretaRH.GetCampoFormatado(TipoCampo: TFieldType; Valor: string): string;
begin
  if (Trim(Valor) = '') then
  begin
    Result := 'NULL';
    exit;
  end;

  Valor := Trim(Valor);
  case (TipoCampo) of
    ftString : Result := QuotedStr(Valor);
    ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency : Result := Valor;
    ftDate, ftDateTime : Result := 'TO_DATE(' +QuotedStr(Valor)+ ',''DD/MM/YYYY'')';
  end;
end;

function TCtrlImportacaoDiretaRH.InserirLinhaAtual(Linha: string; ListaCampos,
  ListaTamCampos: string): boolean;
var
  c, iCampoAtual, iTamConteudo, iUltPosicao: integer;
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
    Inc(FValorCampoSeq);
    sSQLValues := IntToStr(FValorCampoSeq);
  end;

  repeat
    // Adicionar o campo atual
    ExtraiString(ListaCampos, sCampoAtual, ',');

    if (sSQLFields = '') then
      sSQLFields := sCampoAtual
    else
      sSQLFields := sSQLFields +','+ sCampoAtual;

    // Verificar se o campo atual está na lista de campos da tabela indicada pelo usuário
    iCampoAtual := -1;
    for c:=0 to FCdsColunas.FieldCount-1 do
      if (FCdsColunas.Fields[c].FieldName = sCampoAtual) then
      begin
        iCampoAtual := c;
        break;
      end;

    if (iCampoAtual = -1) then
    begin
      MessageInfo := CMTranslateMsg(MSG_SEM_CAMPO, [sCampoAtual]);
      exit;
    end;

    // Adicionar o conteúdo do campo atual
    ExtraiString(ListaTamCampos, sTamCampoAtual, ',');
    iTamConteudo := StrToInt(sTamCampoAtual);

    sConteudo := GetCampoFormatado(FCdsColunas.Fields[iCampoAtual].DataType,
      Copy(Linha, iUltPosicao, iTamConteudo));
    iUltPosicao := iUltPosicao + iTamConteudo;

    if (sSQLValues = '') then
      sSQLValues := sConteudo
    else
      sSQLValues := sSQLValues +', '+ sConteudo;
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

function TCtrlImportacaoDiretaRH.ExcluirDadosTabela: boolean;
begin
  try
    Result := ExecSQL('DELETE FROM ' +FNomeTabela);
    if not(Result) then
    begin
      MessageInfo := ('Não foi possível excluir os dados da tabela: ') +
        FNomeTabela+ '.' +CR_LF+CR_LF+ ('Erro:') +CR_LF+ MessageInfo;

      EnviarMensagemCliente(MessageInfo, false, false);
      raise Exception.Create(MessageInfo);
    end;
    EnviarMensagemCliente('', false, true);
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlImportacaoDiretaRH.GetUltimoCampoSeq(ApagarDados: boolean): boolean;
var
  c, iSequence: LongInt;
begin
  try
    Result := true; 
    if (FCampoSeq <> '') then
    begin
      if (ApagarDados) then
        FValorCampoSeq := 0
      else
      begin
        iSequence := GetSequence(FNomeTabela);
        _Cds.Data := GetDataPacket('SELECT NVL(MAX(' +FCampoSeq+ '),0) AS ULTIMO FROM ' +
          FNomeTabela);
        FValorCampoSeq := Trunc(_Cds.FieldByName('ULTIMO').asFloat);

        if (FValorCampoSeq > iSequence) then
        begin
          for c:=iSequence to FValorCampoSeq do
            GetSequence(FNomeTabela);
        end
        else
          FValorCampoSeq := GetSequence(FNomeTabela);

        Dec(FValorCampoSeq);
      end;
    end;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlImportacaoDiretaRH.ImportarLinhaAtual(Linha: string): boolean;
begin
  try
    Result := InserirLinhaAtual(Linha, FListaCampos, FListaTamCampos);
    if (Result) then
      EnviarMensagemCliente(
        CMTranslateMsg(MSG_OK_LINHA, [IntToStr(FLinhaAtual)]) +Linha, true)
    else
      EnviarMensagemCliente(
        CMTranslateMsg(MSG_ERRO_LINHA, [IntToStr(FLinhaAtual)]) +Linha+ CR_LF+
        '     ----------------------------------------------------------' +CR_LF+
        ('     Mensagem de Erro do Banco de Dados para a linha anterior :') +CR_LF+
        ('     Erro: ')+ MessageInfo +CR_LF+
        '     ----------------------------------------------------------' +CR+LF, true);

    Inc(FLinhaAtual);
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlImportacaoDiretaRH.ImportarDadosTabela(const IAppCliente: OleVariant;
  DadosArquivo, ListaCampos, ListaTamCampos: string; ApagarDados, PararComErro: boolean): boolean;
var
  _Cds: TCMClientDataSet;
  c, iNumErros: integer;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ImportarDadosTabela(IAppCliente, FCdsColunas.Data,
      CampoSeq, NomeArq, NomeTabela, DadosArquivo, ListaCampos, ListaTamCampos,
      ApagarDados, PararComErro);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    _Cds := TCMClientDataSet.Create(nil);
    try
      FIAppCliente := IAppCliente;
      FDadosArquivo.Text := DadosArquivo;
      FListaCampos := ListaCampos;
      FListaTamCampos := ListaTamCampos;

      StartTransaction;

      if (ApagarDados) then
        if not(ExcluirDadosTabela) then
          raise Exception.Create(MessageInfo);

      if not(GetUltimoCampoSeq(ApagarDados)) then
        raise Exception.Create(MessageInfo);

      // Processar cada registro
      iNumErros := 0;
      FLinhaAtual := 1;
      for c:=0 to FDadosArquivo.Count-1 do
      begin
        if not(ImportarLinhaAtual(FDadosArquivo[c])) then
        begin
          Inc(iNumErros);
          if (PararComErro) then
            raise Exception.Create(MessageInfo);
        end;
      end;

      Commit;
      Result := true;
      if (iNumErros > 0) then
        MessageInfo := CMTranslateMsg(MSG_NUM_ERROS, [IntToStr(iNumErros)])
      else
        MessageInfo := ('Importação executada com sucesso.');
   except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    _Cds.Free;
  end;
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
end.
