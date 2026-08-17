{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/02/2002                                 }
{                                                       }
{*******************************************************}
//***************************************************************************************
//Nº SOL...........: 202484
//Nº KINTANA.......: 1957060
//Data da Alteração: 13/03/2013
//Responsável......: Marcio Sanches Spinosa SOL 202484 Kintana 1957060
//Descrição........: Verifica se existe uma transação aberta e commit caso esteja correta
//**************************************************************************************


unit uCtrlImportaTxt;

interface

uses SysUtils, classes, Db, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  UCtrlCustomRH, uDbRubricaIndiv, UDataBase, dBaseDados;

type
  TCtrlImportaTxt = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
  private
    FDb: TDbRubricaIndiv;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function TiraZero(a: string):string;

    function Processar(DadosArquivo: string; MesRef: string; IdEmpresa: integer;
      IdRubrica: real; ColCodigo, TamCodigo, ColCodFavorecido, TamCodFavorecido, ColValor,
      TamValor, NumDecimais: integer; ColOcorrencias, TamOcorrencias, ColParcelas,
      TamParcelas: string; ColCodigoDep: integer; CaracDecimal: string; IgnoraValZero: boolean;
      SubtrairOcorrencias, TipoImportacao, NumParcelas, Permanente: integer;
      OcorrenciasVisivel: boolean): boolean;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

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

function TCtrlImportaTxt.Processar(DadosArquivo: string; MesRef: string; IdEmpresa: integer;
  IdRubrica: real; ColCodigo, TamCodigo, ColCodFavorecido, TamCodFavorecido, ColValor,
  TamValor, NumDecimais: integer; ColOcorrencias, TamOcorrencias, ColParcelas,
  TamParcelas: string; ColCodigoDep: integer; CaracDecimal: string; IgnoraValZero: boolean;
  SubtrairOcorrencias, TipoImportacao, NumParcelas, Permanente: integer;
  OcorrenciasVisivel: boolean): boolean;
var
  _CdsRubrica, _CdsRubIndiv, _CdsFunc, _Cds: TCMClientDataSet;

  lstArquivo: TStringList;
  wHora, wMin, wSeg, wMSeg: word;
  sMsg, sMatricula, sCodProvDesc, sCodProvDescAtual: string;
  sParcelas, sNumOcorr, sAnoMesInicio, sValor: string;
  iNumDecimais, iSeqRubIndiv, iInicio, iFim, iPosVal, iTamVal, iPosRub, iTamRub, c, iNumErros,
  iPosicaoM, iTamanhoM, iPosOcor, iTamOcor, iPosParc, iTamParc: integer;

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
    Result := Connection.AppServer.Processar(DadosArquivo, MesRef, IdEmpresa, IdRubrica,
      ColCodigo, TamCodigo, ColCodFavorecido, TamCodFavorecido, ColValor, TamValor,
      NumDecimais, ColOcorrencias, TamOcorrencias, ColParcelas, TamParcelas, ColCodigoDep);
    if not(Result) then
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
        'SELECT CodProvDesc'+CR_LF+
        'FROM   RubricaXPess'+CR_LF+
        'WHERE (IdPessoa  = '+IntToStr(IdEmpresa)+') and'+CR_LF+
        '      (IdRubrica = '+FloatToStr(IdRubrica)+')');
      sCodProvDesc := _Cds.FieldByName('CodProvDesc').asString;
    end
    else
      sCodProvDesc := '';

    DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
    iInicio := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

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
              '  F.Matricula'+CR_LF+
              'FROM'+CR_LF+
              '  DocPessoa D, Funcionario F'+CR_LF+
              'WHERE'+CR_LF+
              '  (D.IdDocumento  = ' +IntToStr(ColCodigoDep)+ ') AND'+CR_LF+
              '  (D.NumDocumento = ' +QuotedStr(Trim(ValorLinha(iPosicaoM, iTamanhoM, c)))+ ') AND'+CR_LF+
              '  (D.IdPessoa     = F.IdPessoa)');

            sMatricula := _Cds.FieldByName('Matricula').asString;
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
          ' Erro   [linha '+IntToStr(c)+'] Matrícula/Identificação: '+
            Trim(ValorLinha(iPosicaoM, iTamanhoM, c))+CR_LF+
          ' Descrição: Matrícula/Identificação não existe no Sistema CM'+CR_LF+
          Replicate('-', 100)+CR_LF;
        DoProgresso([sMsg, '']);
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

      if iNumDecimais = 0 then
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
          ' Erro   [linha '+IntToStr(c)+'] Rubrica: '+sCodProvDescAtual+CR_LF+
          ' Empregado: ' + _CdsFunc.FieldByName('Matricula').asString+CR_LF+
          ' Descrição: Não existe um Número Real no Campo Valor ou as definições'+CR_LF+
          ' do Layout não estão de acordo com o Valor encontrado ('+sValor+')'+CR_LF+
          Replicate('-',100)+CR_LF;
        DoProgresso([sMsg, '']);
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
        '  RP.IdRubrica, PD.IdRegra'+CR_LF+
        'FROM'+CR_LF+
        '  RubricaXPess RP, ProvDesc PD'+CR_LF+
        'WHERE'+CR_LF+
        '  (RP.CodProvDesc     = '+QuotedStr(sCodProvDescAtual)+') AND'+CR_LF+
        '  (RP.IdPessoa        = '+IntToStr(IdEmpresa)+') AND'+CR_LF+
        '  (PD.FlgTpRubrica LIKE ''%F%'') AND'+CR_LF+
        '  (RP.IdRubrica       = PD.IdProvento)');

      // Se a linha vai ser gerada com valo zerado ou não
      if (IgnoraValZero) and (StrToFloat(sValor) = 0) then
      begin
        {sMsg := CR_LF +
          ' Aviso  [linha '+IntToStr(c)+'] Rubrica: '+sCodProvDescAtual+CR_LF+
          ' Empregado: ' + _CdsFunc.FieldByName('Matricula').asString+CR_LF+
          ' Descrição: Linha ignorada. Valor está zerado.'+CR_LF+
          Replicate('-',100)+CR_LF;
        DoProgresso([sMsg, '']);
        Inc(iNumErros);}
        Continue;
      end;

      // Número de Ocorrências ou Parcelas não informado
      if (OcorrenciasVisivel) and ((StrInt(sParcelas) = 0) or (StrInt(sNumOcorr) = 0)) then
      begin
        sMsg := CR_LF +
          ' Aviso  [linha '+IntToStr(c)+'] Rubrica: '+sCodProvDescAtual+CR_LF+
          ' Empregado: ' + _CdsFunc.FieldByName('Matricula').asString+CR_LF+
          ' Descrição: Linha ignorada. Número de Parcelas e/ou Número de Ocorrências zerados.'+CR_LF+
          Replicate('-',100)+CR_LF;
        DoProgresso([sMsg, '']);
        //Inc(iNumErros);
        Continue;
      end;

      // Se a Rubrica não foi encontrada no Banco, acrescento a mensagem de erro ao LOG
      if (_CdsRubrica.IsEmpty) then
      begin
        if (iPosRub = 0) or (iTamRub = 0) then
          sMsg := ' Erro   [linha '+IntToStr(c)+'] Rubrica: ' +sCodProvDescAtual
        else
          sMsg := ' Erro   [linha '+IntToStr(c)+'] Rubrica: '+
            Trim(ValorLinha(iPosRub, iTamRub, c));

        sMsg := sMsg +
          ' Empresa: ' +IntToStr(IdEmpresa) +CR_LF+
          ' Descrição: Rubrica não existente ou não associada para a Empresa.'+CR_LF+
          Replicate('-',100)+CR_LF;
        DoProgresso([sMsg, '']);
        Inc(iNumErros);
        Continue;
      end;

      // Procuro pela Rubrica em qualquer mês
      try
        _Cds.Data := GetDataPacket(
          'SELECT'+CR_LF+
          '  NVL(MAX(SeqRubricaIndiv),0) AS SeqRubricaIndiv,'+CR_LF+
          '  MAX(AnoMesInicio) AS AnoMesInicio'+CR_LF+
          'FROM'+CR_LF+
          '  RubricaIndiv'+CR_LF+
          'WHERE'+CR_LF+
          '  (IdPessoa  = ' +_CdsFunc.FieldByName('IdPessoa').asString+ ') AND'+CR_LF+
          '  (IdRubrica = ' +_CdsRubrica.FieldByName('IdRubrica').asString+ ') AND'+CR_LF+
          '  (IdEmpresa = ' +IntToStr(IdEmpresa)+ ')');

        iSeqRubIndiv := _Cds.FieldByName('SeqRubricaIndiv').asInteger;
        sAnoMesInicio := _Cds.FieldByName('AnoMesInicio').asString;
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
              ' Erro   [linha '+IntToStr(c)+'] Rubrica: ' +sCodProvDescAtual+CR_LF+
              ' Empregado: ' + _CdsFunc.FieldByName('Matricula').asString+CR_LF+
              ' Descrição: Rubrica já existe para o Mês '+MesRef+'.'+CR_LF+
              Replicate('-',100)+CR_LF;
            DoProgresso([sMsg, '']);
            Inc(iNumErros);
            Continue;
          end;
          1,2 :
          begin
            _CdsRubIndiv.Edit;
            if (TipoImportacao = 2) then
              sValor := FloatToStr(StrToFloat(sValor) +
                _CdsRubIndiv.FieldByName('ValorRubrica').asFloat);
          end;
        end;
      end;

      _CdsRubIndiv.FieldByName('IdPessoa').asFloat := _CdsFunc.FieldByName('IdPessoa').asFloat;
      _CdsRubIndiv.FieldByName('IdRegraCalculo').asFloat := _CdsRubrica.FieldByName('IdRegra').asFloat;

      if (TipoImportacao = 2) then
        _CdsRubIndiv.FieldByName('ValorRubrica').asString := sValor
      else
        _CdsRubIndiv.FieldByName('ValorRubrica').asString := TiraZero(sValor);

      _CdsRubIndiv.FieldByName('IdEmpresa').asInteger := IdEmpresa;
      _CdsRubIndiv.FieldByName('IdRubrica').asFloat := _CdsRubrica.FieldByName('IdRubrica').asFloat;
      _CdsRubIndiv.FieldByName('FlgTpRubManut').asString := '2';

      if (_CdsRubIndiv.State = dsInsert) then
      begin
        _CdsRubIndiv.FieldByName('AnoMesInicio').asString := MesRef;
        _CdsRubIndiv.FieldByName('SeqRubricaIndiv').asInteger := iSeqRubIndiv + 1;
      end;

      if (_CdsRubIndiv.State = dsInsert) or (TipoImportacao < 2) then
      begin
        if (Trim(ColOcorrencias) = '') then
          _CdsRubIndiv.FieldByName('NumOcorrencias').asInteger := 0
        else
          _CdsRubIndiv.FieldByName('NumOcorrencias').asInteger :=
            StrInt(sNumOcorr) - 1 + SubtrairOcorrencias;

        if (Trim(ColParcelas) = '') then
        begin
          _CdsRubIndiv.FieldByName('Parcelas').asInteger := NumParcelas;
          _CdsRubIndiv.FieldByName('FlgPermanente').asInteger := 1 - Permanente;
        end
        else
        begin
          _CdsRubIndiv.FieldByName('FlgPermanente').asInteger := 0;
          _CdsRubIndiv.FieldByName('Parcelas').asString := sParcelas;
        end;
      end;

      // Gravar no BD a Rubrica
      try
        Result := ApplyCds(_CdsRubIndiv, FDb, [], []);

        if not(Result) then
        begin
          MessageInfo := FDb.MessageInfo;
          StrToDate('Erro ao tentar gravar a Rubrica: '+sCodProvDesc);
          dtmBaseDados.dbBaseDados.Rollback;//Marcio Sanches Spinosa SOL 202484 Kintana 1957060
        end;

        //Marcio Sanches Spinosa SOL 202484 Kintana 1957060 - Inicio
        if (dtmBaseDados.dbBaseDados.InTransaction) then
          dtmBaseDados.dbBaseDados.Commit;
        //Marcio Sanches Spinosa SOL 202484 Kintana 1957060 - Fim  

        if (iPosRub = 0) or (iTamRub = 0) then
          sMsg := ' Ok   [linha '+IntToStr(c)+'] Rubrica: '+
            sCodProvDesc+
            ' Empregado: ' + _CdsFunc.FieldByName('Matricula').asString +CR_LF
        else
          sMsg := ' Ok   [linha '+IntToStr(c)+'] Rubrica: '+
            Trim(ValorLinha(iPosRub, iTamRub, c))+
            ' Empregado: ' + _CdsFunc.FieldByName('Matricula').asString +CR_LF;
      except
        on E: Exception do
        begin
          if (iPosRub = 0) or (iTamRub = 0) then
            sMsg := ' Erro   [linha '+IntToStr(c)+'] Rubrica: '+
              sCodProvDesc+
              ' Empregado: ' + _CdsFunc.FieldByName('IdPessoa').asString
          else
            sMsg := ' Erro   [linha '+IntToStr(c)+'] Rubrica: '+
              Trim(ValorLinha(iPosRub, iTamRub, c))+
              ' Empregado: ' + _CdsFunc.FieldByName('IdPessoa').asString;

          sMsg := sMsg +CR_LF+' Descrição: '+ E.Message +CR_LF;
          Inc(iNumErros);
        end;
      end;
      DoProgresso([sMsg+ Replicate('-', 100) +CR_LF, '']);
      if NumDecimais = 0 then
        iNumDecimais := 0;
    end;

    DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
    iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

    DoProgresso(['', 'Tempo de Processamento: ' +TempoDecorrido(iFim - iInicio)]);

    if (iNumErros > 0) then
    begin
      if (iNumErros = lstArquivo.Count) then
        MessageInfo := 'Nenhuma linha foi executada.'
      else
        MessageInfo := 'Processo executado com '+IntToStr(iNumErros)+' erros.';
    end
    else
      MessageInfo := 'Processo executado com sucesso.';



    lstArquivo.Free;
    _CdsRubIndiv.Free;
    _CdsRubrica.Free;
    _CdsFunc.Free;
    _Cds.Free;
  end;
end;

end.
