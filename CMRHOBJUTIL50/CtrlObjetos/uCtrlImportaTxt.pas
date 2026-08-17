{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/02/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlImportaTxt;

interface

uses SysUtils, Classes, Db, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uCtrlCustomRH, uDbRubricaIndiv;

type
  TCtrlImportaTxt = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
  private
    FDb: TDbRubricaIndiv;

    function TiraZero(a: string): string;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function Processar(const IAppCliente: OleVariant; DadosArquivo, MesRef: string;
      IdEmpresa: integer; IdRubrica: double; ColCodigo, TamCodigo, ColCodFavorecido,
      TamCodFavorecido, ColValor, TamValor, NumDecimais: integer; ColOcorrencias,
      TamOcorrencias, ColParcelas, TamParcelas: string; ColCodigoDep: integer;
      CaracDecimal: string; IgnoraValZero: boolean; SubtrairOcorrencias, TipoImportacao,
      NumParcelas, Permanente: integer; OcorrenciasVisivel: boolean): boolean;
  end;

implementation

uses Controls, uCMTypes, uCtrlFuncoesRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_ERRO_IDENTIF = ' Erro   [linha :1] Matrícula/Identificação: ';
  MSG_ERRO_RUBRICA = ' Erro   [linha :1] Rubrica: ';
  MSG_DESCR_ERRO_RUBRICA_01 =
    ' Descrição: Não existe um Número Real no Campo Valor ou as definições'+
    ':1 do Layout não estão de acordo com o Valor encontrado (:2)';
  MSG_DESCR_ERRO_RUBRICA_02 = ' Descrição: Rubrica já existe para o Mês :1.';  
  MSG_AVISO_RUBRICA = ' Aviso  [linha :1] Rubrica: ';
  MSG_OK_RUBRICA = ' Ok   [linha :1] Rubrica: ';
  MSG_NUM_ERROS = 'Processo executado com :1 erros.';

{ TCtrlImportaTxt }

constructor TCtrlImportaTxt.Create;
begin
  inherited;
  FDb := TDbRubricaIndiv.Create(Self);
end;

destructor TCtrlImportaTxt.Destroy;
begin
  FDb.Free;
  inherited;
end;

procedure TCtrlImportaTxt.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
end;

function TCtrlImportaTxt.TiraZero(a: string): string;
var
  c: integer;
  b: boolean;
  sTemp: string;
begin
  b:=false; sTemp:='';
  for c:=1 to length(a) do
  begin
    if (a[c] <> '0') then
      b:= true;

    if not(b) and (a[c] = '0') then
      a[c]:= ' ';

    if (c > length(a)-3)  and (a[c] = ' ') then
      a[c]:= '0';

    sTemp := sTemp + a[c];

    if ((Pos(',',a) = 0) and (c = length(a)-2)) then
      sTemp := sTemp + DecimalSeparator;
  end;

  Result := Trim(sTemp);
end;

function TCtrlImportaTxt.Processar(const IAppCliente: OleVariant; DadosArquivo,
  MesRef: string; IdEmpresa: integer; IdRubrica: double; ColCodigo, TamCodigo,
  ColCodFavorecido, TamCodFavorecido, ColValor, TamValor, NumDecimais: integer;
  ColOcorrencias, TamOcorrencias, ColParcelas, TamParcelas: string; ColCodigoDep: integer;
  CaracDecimal: string; IgnoraValZero: boolean; SubtrairOcorrencias, TipoImportacao,
  NumParcelas, Permanente: integer; OcorrenciasVisivel: boolean): boolean;
var
  _CdsRubrica, _CdsRubIndiv, _CdsFunc, _Cds: TCMClientDataSet;

  lstArquivo: TStringList;
  sMsg, sMatricula, sCodProvDesc, sCodProvDescAtual: string;
  sParcelas, sNumOcorr, sAnoMesInicio, sValor: string;
  iNumDecimais, iSeqRubIndiv, iPosVal, iTamVal, iPosRub, iTamRub, c, iNumErros,
  iPosicaoM, iTamanhoM, iPosOcor, iTamOcor, iPosParc, iTamParc: integer;
  Inicio: TTime; 

{->}function ValorLinha(const Posicao, Tamanho, Linha: integer): string;
    begin
      try
        Result := Copy(lstArquivo[Linha-1], Posicao, Tamanho);
      except
        Result := '';
      end;
{->}end;

begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ProcessarImportaTxt(IAppCliente, 
      DadosArquivo, MesRef, IdEmpresa, IdRubrica, ColCodigo, TamCodigo, ColCodFavorecido,
      TamCodFavorecido, ColValor, TamValor, NumDecimais, ColOcorrencias, TamOcorrencias,
      ColParcelas, TamParcelas, ColCodigoDep, CaracDecimal, IgnoraValZero,
      SubtrairOcorrencias, TipoImportacao, NumParcelas, Permanente, OcorrenciasVisivel);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := false;
    iNumErros := 0;
    sMsg := '';

    _CdsRubrica := TCMClientDataSet.Create(nil);
    _CdsFunc := TCMClientDataSet.Create(nil);
    _CdsRubIndiv := TCMClientDataSet.Create(nil);
    _Cds := TCMClientDataSet.Create(nil);
    lstArquivo := TStringList.Create;

    if (IdRubrica <> 0) then
    begin
      _Cds.Data := GetDataPacket(
        'SELECT CODPROVDESC'+CR_LF+
        'FROM   RUBRICAXPESS'+CR_LF+
        'WHERE (IDPESSOA  = '+IntToStr(IdEmpresa)+') AND'+CR_LF+
        '      (IDRUBRICA = '+FloatToStr(IdRubrica)+')');
      sCodProvDesc := _Cds.FieldByName('CODPROVDESC').asString;
    end
    else
      sCodProvDesc := '';

    Inicio := Time;

    // Pego a posição dos campos no Layout selecionado
    iPosicaoM := ColCodigo;
    iTamanhoM := TamCodigo;
    iPosRub := ColCodFavorecido;
    iTamRub := TamCodFavorecido;
    iPosVal := ColValor;
    iTamVal := TamValor;
    iPosOcor := StrInt(ColOcorrencias);
    iTamOcor := StrInt(TamOcorrencias);
    iPosParc := StrInt(ColParcelas);
    iTamParc := StrInt(TamParcelas);

    // Número de Casas decimais Padrão é dois
    iNumDecimais := NumDecimais;

    // LOOP para cada linha no arquivo
    lstArquivo.Text := DadosArquivo;
    for c:=1 to lstArquivo.Count do
    begin
      // Código da Rubrica Atual
      if (iPosRub = 0) or (iTamRub = 0) then
        sCodProvDescAtual := sCodProvDesc
      else
        sCodProvDescAtual := Trim(ValorLinha(iPosRub,iTamRub, c));

      sValor := '0';
      // Procura o Empregado especificado na Linha Atual do Layout
      if (Trim(ValorLinha(iPosicaoM, iTamanhoM, c)) <> '') then
      begin
        if (ColCodigoDep = 0) then
          sMatricula := Trim(ValorLinha(iPosicaoM, iTamanhoM, c))
        else
        begin
          try
            _Cds.Data := GetDataPacket(
              'SELECT'+CR_LF+
              '  F.MATRICULA'+CR_LF+
              'FROM'+CR_LF+
              '  DOCPESSOA D, FUNCIONARIO F'+CR_LF+
              'WHERE'+CR_LF+
              '  (D.IDDOCUMENTO  = ' +IntToStr(ColCodigoDep)+ ') AND'+CR_LF+
              '  (D.NUMDOCUMENTO = ' +QuotedStr(Trim(ValorLinha(iPosicaoM, iTamanhoM, c)))+ ') AND'+CR_LF+
              '  (D.IDPESSOA     = F.IDPESSOA)');

            sMatricula := _Cds.FieldByName('MATRICULA').asString;
          except
            sMatricula := '-1';
          end;
        end;
      end
      else
        sMatricula := '-1';

      _CdsFunc.Data := GetDataPacket(
        'SELECT'+CR_LF+
        '  IDPESSOA, MATRICULA'+CR_LF+
        'FROM'+CR_LF+
        '  FUNCIONARIO'+CR_LF+
        'WHERE'+CR_LF+
        '  (MATRICULA = '+QuotedStr(sMatricula)+') AND'+CR_LF+
        '  (IDEMPRESA = '+IntToStr(IdEmpresa)+')');

      // Emito uma mensagem de erro se o Empregado não existir
      if (_CdsFunc.IsEmpty) then
      begin
        sMsg :=
          CMTranslateMsg(MSG_ERRO_IDENTIF, [IntToStr(c)])+
          Trim(ValorLinha(iPosicaoM, iTamanhoM, c))+CR_LF+
          (' Descrição: Matrícula/Identificação não existe no Sistema CM') +CR_LF+
          Replicate('-', 100)+CR_LF;

        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarImportaTxt_CB(sMsg, '');
        except
        end;

        Inc(iNumErros);
        Continue;
      end;

      // Processo a linha de Layout para o Empregado
      // -----------------------------------------------------------------------
      // Pego o campo sValor e faço os devidos ajustes
      // -----------------------------------------------------------------------
      sValor := ValorLinha(iPosVal, iTamVal, c);

      // Caso seja informado no Layout que existe um Caracter Decimal (CaracDecimal),
      // converto-o para o DecimalSeparator atual
      if (Trim(CaracDecimal) <> '') and (CaracDecimal[1] <> DecimalSeparator) then
        sValor := TrocaCaracter(sValor, CaracDecimal[1], DecimalSeparator);

      // Se não, insiro o separador decimal na posição Decimal especificada no Layout
      if (Pos(DecimalSeparator, sValor) <= 0) and (iNumDecimais > 0) then
        Insert(DecimalSeparator, sValor, Length(sValor) - iNumDecimais + 1);

      if (iNumDecimais = 0) then
      begin
        iNumDecimais := 2;
        sValor := sValor + ',00';
      end;

      // Ajusto o número de casas decimais que está no arquivo com o informado no Layout
      sValor := Copy(sValor, 1, Pos(DecimalSeparator, sValor))+
        Copy(sValor, Pos(DecimalSeparator, sValor)+1, iNumDecimais);

      try
        StrToFloat(sValor);
      except
        sMsg :=
          CMTranslateMsg(MSG_ERRO_RUBRICA, [IntToStr(c)]) +sCodProvDescAtual +CR_LF+
          (' Empregado: ') +_CdsFunc.FieldByName('Matricula').asString+CR_LF+
          CMTranslateMsg(MSG_DESCR_ERRO_RUBRICA_01, [CR_LF, sValor]) +CR_LF+
          Replicate('-',100)+CR_LF;

        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarImportaTxt_CB(sMsg, '');
        except
        end;

        Inc(iNumErros);
        Continue;
      end;

      // -----------------------------------------------------------------------
      // Pego o campo de Ocorrências e Parcelas e faço os devidos testes
      // -----------------------------------------------------------------------
      sParcelas := TiraZero(Trim(ValorLinha(iPosParc, iTamParc, c)));
      sNumOcorr := TiraZero(Trim(ValorLinha(iPosOcor, iTamOcor, c)));

      // Procura a Rubrica especificada no Layout
      _CdsRubrica.Data := GetDataPacket(
        'SELECT'+CR_LF+
        '  RP.IDRUBRICA, PD.IDREGRA'+CR_LF+
        'FROM'+CR_LF+
        '  RUBRICAXPESS RP, PROVDESC PD'+CR_LF+
        'WHERE'+CR_LF+
        '  (RP.CODPROVDESC     = '+QuotedStr(sCodProvDescAtual)+') AND'+CR_LF+
        '  (RP.IDPESSOA        = '+IntToStr(IdEmpresa)+') AND'+CR_LF+
        '  (PD.FLGTPRUBRICA LIKE ''%F%'') AND'+CR_LF+
        '  (RP.IDRUBRICA       = PD.IDPROVENTO)');

      // Se a linha vai ser gerada com valo zerado ou não
      if (IgnoraValZero) and (StrToFloat(sValor) = 0) then
      begin
        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarImportaTxt_CB(sMsg, '');
        except
        end;

        Continue;
      end;

      // Número de Ocorrências ou Parcelas não informado
      if (OcorrenciasVisivel) and ((StrInt(sParcelas) = 0) or (StrInt(sNumOcorr) = 0)) then
      begin
        sMsg := CR_LF +
          CMTranslateMsg(MSG_AVISO_RUBRICA, [IntToStr(c)]) +sCodProvDescAtual+CR_LF+
          (' Empregado: ') +_CdsFunc.FieldByName('MATRICULA').asString +CR_LF+
          (' Descrição: Linha ignorada. Número de Parcelas e/ou Número de Ocorrências zerados.') +CR_LF+
          Replicate('-',100)+CR_LF;

        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarImportaTxt_CB(sMsg, '');
        except
        end;

        Continue;
      end;

      // Se a Rubrica não foi encontrada no Banco, acrescento a mensagem de erro ao LOG
      if (_CdsRubrica.IsEmpty) then
      begin
        if (iPosRub = 0) or (iTamRub = 0) then
          sMsg := CMTranslateMsg(MSG_ERRO_RUBRICA, [IntToStr(c)]) +sCodProvDescAtual
        else
          sMsg := CMTranslateMsg(MSG_ERRO_RUBRICA, [IntToStr(c)]) +Trim(ValorLinha(iPosRub, iTamRub, c));

        sMsg := sMsg +
          (' Empresa: ') +IntToStr(IdEmpresa) +CR_LF+
          (' Descrição: Rubrica não existente ou não associada para a Empresa.') +
          CR_LF+ Replicate('-',100) +CR_LF;

        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarImportaTxt_CB(sMsg, '');
        except
        end;

        Inc(iNumErros);
        Continue;
      end;

      // Procuro pela Rubrica em qualquer mês
      try
        _Cds.Data := GetDataPacket(
          'SELECT'+CR_LF+
          '  NVL(MAX(SEQRUBRICAINDIV),0) AS SEQRUBRICAINDIV,'+CR_LF+
          '  MAX(ANOMESINICIO) AS ANOMESINICIO'+CR_LF+
          'FROM'+CR_LF+
          '  RUBRICAINDIV'+CR_LF+
          'WHERE'+CR_LF+
          '  (IDPESSOA  = ' +_CdsFunc.FieldByName('IDPESSOA').asString+ ') AND'+CR_LF+
          '  (IDRUBRICA = ' +_CdsRubrica.FieldByName('IDRUBRICA').asString+ ') AND'+CR_LF+
          '  (IDEMPRESA = ' +IntToStr(IdEmpresa)+ ')');

        iSeqRubIndiv := _Cds.FieldByName('SEQRUBRICAINDIV').asInteger;
        sAnoMesInicio := _Cds.FieldByName('ANOMESINICIO').asString;
      except
        iSeqRubIndiv := 0;
        sAnoMesInicio := '';
      end;

      // Vejo se já existe uma Rubrica Lançada para o mês
      _CdsRubIndiv.Close;
      _CdsRubIndiv.Data := GetDataPacket(
        'SELECT'+CR_LF+
        '  IDPESSOA, IDEMPRESA, IDRUBRICA, IDFAVORECIDO, IDREGRACALCULO,'+CR_LF+
        '  NUMOCORRENCIAS, VALORRUBRICA, ANOMESINICIO, FLGPERMANENTE, PARCELAS,'+CR_LF+
        '  SEQRUBRICAINDIV, FLGTPRUBMANUT'+CR_LF+
        'FROM'+CR_LF+
        '  RUBRICAINDIV'+CR_LF+
        'WHERE'+CR_LF+
        '  (IDPESSOA  = ' +_CdsFunc.FieldByName('IDPESSOA').asString+ ') AND'+CR_LF+
        '  (IDRUBRICA = ' +_CdsRubrica.FieldByName('IDRUBRICA').asString+ ') AND'+CR_LF+
        IFF(TipoImportacao > 0, '  (ANOMESINICIO = ' +QuotedStr(MesRef)+ ') AND'+CR_LF, '')+
        '  (IDEMPRESA    = ' +IntToStr(IdEmpresa)+ ')');

      if (TipoImportacao = 0) or (_CdsRubIndiv.IsEmpty) then
        _CdsRubIndiv.Insert
      else
      begin
        case (TipoImportacao) of
          0 :
          begin
            sMsg :=
              CMTranslateMsg(MSG_ERRO_RUBRICA, [IntToStr(c)]) +sCodProvDescAtual +CR_LF+
              (' Empregado: ') +_CdsFunc.FieldByName('MATRICULA').asString+CR_LF+
              CMTranslateMsg(MSG_DESCR_ERRO_RUBRICA_02, [MesRef]) +CR_LF+
              Replicate('-',100)+CR_LF;

            // Enviar mensagem ao cliente
            try
              IAppCliente.ProcessarImportaTxt_CB(sMsg, '');
            except
            end;

            Inc(iNumErros);
            Continue;
          end;
          1,2 :
          begin
            _CdsRubIndiv.Edit;
            if (TipoImportacao = 2) then
              sValor := FloatToStr(StrToFloat(sValor) +
                _CdsRubIndiv.FieldByName('VALORRUBRICA').asFloat);
          end;
        end;
      end;

      _CdsRubIndiv.FieldByName('IDPESSOA').asFloat := _CdsFunc.FieldByName('IDPESSOA').asFloat;
      _CdsRubIndiv.FieldByName('IDREGRACALCULO').asFloat := _CdsRubrica.FieldByName('IDREGRA').asFloat;

      if (TipoImportacao = 2) then
        _CdsRubIndiv.FieldByName('VALORRUBRICA').asString := sValor
      else
        _CdsRubIndiv.FieldByName('VALORRUBRICA').asString := TiraZero(sValor);

      _CdsRubIndiv.FieldByName('IDEMPRESA').asInteger := IdEmpresa;
      _CdsRubIndiv.FieldByName('IDRUBRICA').asFloat := _CdsRubrica.FieldByName('IDRUBRICA').asFloat;
      _CdsRubIndiv.FieldByName('FLGTPRUBMANUT').asString := '2';

      if (_CdsRubIndiv.State = dsInsert) then
      begin
        _CdsRubIndiv.FieldByName('ANOMESINICIO').asString := MesRef;
        _CdsRubIndiv.FieldByName('SEQRUBRICAINDIV').asInteger := iSeqRubIndiv + 1;
      end;

      if (_CdsRubIndiv.State = dsInsert) or (TipoImportacao < 2) then
      begin
        if (Trim(ColOcorrencias) = '') then
          _CdsRubIndiv.FieldByName('NUMOCORRENCIAS').asInteger := 0
        else
          _CdsRubIndiv.FieldByName('NUMOCORRENCIAS').asInteger :=
            StrInt(sNumOcorr) - 1 + SubtrairOcorrencias;

        if (Trim(ColParcelas) = '') then
        begin
          _CdsRubIndiv.FieldByName('PARCELAS').asInteger := NumParcelas;
          _CdsRubIndiv.FieldByName('FLGPERMANENTE').asInteger := 1 - Permanente;
        end
        else
        begin
          _CdsRubIndiv.FieldByName('FLGPERMANENTE').asInteger := 0;
          _CdsRubIndiv.FieldByName('PARCELAS').asString := sParcelas;
        end;
      end;

      // Gravar no BD a Rubrica
      try
        Result := ApplyCds(_CdsRubIndiv, FDb, [], []);
        if not(Result) then
        begin
          MessageInfo := FDb.MessageInfo;
          StrToDate(('Erro ao tentar gravar a Rubrica: ') +sCodProvDesc);
        end;

        if (iPosRub = 0) or (iTamRub = 0) then
          sMsg := CMTranslateMsg(MSG_OK_RUBRICA, [IntToStr(c)]) +sCodProvDesc+
            (' Empregado: ') +_CdsFunc.FieldByName('MATRICULA').asString +CR_LF
        else
          sMsg := CMTranslateMsg(MSG_OK_RUBRICA, [IntToStr(c)]) +Trim(ValorLinha(iPosRub, iTamRub, c))+
            (' Empregado: ') +_CdsFunc.FieldByName('MATRICULA').asString +CR_LF;
      except
        on E: Exception do
        begin
          if (iPosRub = 0) or (iTamRub = 0) then
            sMsg := CMTranslateMsg(MSG_ERRO_RUBRICA, [IntToStr(c)]) +sCodProvDesc+
              (' Empregado: ') +_CdsFunc.FieldByName('IDPESSOA').asString
          else
            sMsg := CMTranslateMsg(MSG_ERRO_RUBRICA, [IntToStr(c)]) +Trim(ValorLinha(iPosRub, iTamRub, c))+
              (' Empregado: ') +_CdsFunc.FieldByName('IDPESSOA').asString;

          sMsg := sMsg +CR_LF+ (' Descrição: ')+ E.Message +CR_LF;
          Inc(iNumErros);
        end;
      end;

      // Enviar mensagem ao cliente
      try
        IAppCliente.ProcessarImportaTxt_CB(sMsg+ Replicate('-', 100) +CR_LF, '');
      except
      end;

      if (NumDecimais = 0) then
        iNumDecimais := 0;
    end;

    // Enviar mensagem ao cliente
    try
      IAppCliente.ProcessarImportaTxt_CB('',
       ('Tempo de Processamento: ') +HoraPorExtenso(Time - Inicio));
    except
    end;

    if (iNumErros > 0) then
    begin
      if (iNumErros = lstArquivo.Count) then
        MessageInfo := ('Nenhuma linha foi executada.')
      else
        MessageInfo :=
          CMTranslateMsg(MSG_ERRO_RUBRICA, [IntToStr(iNumErros)]) +CR_LF+
          ('Veja o Log do processo para obter maiores informações.');
    end
    else
      MessageInfo := ('Processo executado com sucesso.');

    lstArquivo.Free;
    _CdsRubIndiv.Free;
    _CdsRubrica.Free;
    _CdsFunc.Free;
    _Cds.Free;
  end;
end;

end.
