{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2003                                 }
{                                                       }
{*******************************************************}

unit uCtrlImportaCandidato;

interface

uses SysUtils, Classes, Db, Controls, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, uValidaDoc, uCtrlCustomRH, uCtrlListTerceirosRH, uCtrlDocOfic,
  uCtrlReqPessoal;

type
  TCtrlImportaCandidato = class(TCtrlCustomRH)
  protected
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlDocOfic: TCtrlDocOfic;
    FCtrlReqPessoal: TCtrlReqPessoal;

    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
  private
    FLinhasArq: TStringList;

    FIdCidades: double;
    FNomeCidade, FSiglaUF: string;
    
    procedure BuscarCidade;
    function  ValorLinha(const Posicao, Tamanho, Linha: integer): string;
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function Processar(const IAppCliente: OleVariant; AtualizaDados: boolean;
      IdFonteRecrutamento: double; NomeFonteRecrutamento: string): boolean;

    property LinhasArq: TStringList read FLinhasArq write FLinhasArq;
  end;

implementation

uses uCMTypes, uMidasUtil, uCtrlFuncoesRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_ERRO_IDENTIFIC = ' Erro   [linha :1] Identificação Incompleta: ';
  MSG_ERRO_REQUISICAO = ' Erro   [linha :1] Número da Requisição Inválido: ';
  MSG_ERRO_CPF = ' Erro   [linha :1] Número do CPF Inválido: ';
  MSG_ERRO_DUPLICIDADE = ' Aviso   [linha :1] Pessoa Já Cadastrada: ';
  MSG_ERRO_ATUALIZACAO = ' Erro   [linha :1] Atualização Não Efetuada: ';
  MSG_NUM_ERROS = 'Processo executado com :1 erros.';

  // Número da Requisição
  POS_NUM_REQ = 1;
  TAM_NUM_REQ = 8;
  // CPF
  POS_NUM_CPF = 9;
  TAM_NUM_CPF = 11;
  // Nome
  POS_NOME = 20;
  TAM_NOME = 60;
  // E-mail
  POS_EMAIL = 80;
  TAM_EMAIL = 100;
  // -------- Endereço --------
  // Logradouro
  POS_LOGRADOURO = 180;
  TAM_LOGRADOURO = 60;
  // Número
  POS_NUMERO = 240;
  TAM_NUMERO = 8;
  // Complemento
  POS_COMPLEMENTO = 248;
  TAM_COMPLEMENTO = 20;
  // Bairro
  POS_BAIRRO = 268;
  TAM_BAIRRO = 20;
  // CEP
  POS_CEP = 288;
  TAM_CEP = 8;
  // Cidade
  POS_CIDADE = 296;
  TAM_CIDADE = 20;
  // UF
  POS_CODESTADO = 316;
  TAM_CODESTADO = 2;
  // -------- Telefones --------
  // DDD do 1º Número
  POS_DDD1 = 318;
  TAM_DDD1 = 5;
  // 1º Número
  POS_TEL1 = 323;
  TAM_TEL1 = 10;
  // DDD do 2º Número
  POS_DDD2 = 333;
  TAM_DDD2 = 5;
  // 2º Número
  POS_TEL2 = 338;
  TAM_TEL2 = 10;
  // -------- Dados Pessoais --------
  // Data de Nascimento
  POS_DATANASC = 348;
  TAM_DATANASC = 10;
  // Estado Civil
  POS_ESTCIVIL = 358;
  TAM_ESTCIVIL = 1;
  // Sexo
  POS_SEXO = 359;
  TAM_SEXO = 1;
  // Código do Grau de Instrução
  POS_GRAUINSTR = 360;
  TAM_GRAUINSTR = 2;
  // -------- Histórico de Emprego --------
  // Nome da Empresa da 1º ocorrência
  POS_HST1_EMPRESA = 362;
  TAM_HST1_EMPRESA = 40;
  // Cargo da 1º ocorrência
  POS_HST1_CARGO = 402;
  TAM_HST1_CARGO = 30;
  // Data de Admissão da 1º ocorrência
  POS_HST1_DATAADM = 432;
  TAM_HST1_DATAADM = 10;
  // Data de Demissão da 1º ocorrência
  POS_HST1_DATADEM = 442;
  TAM_HST1_DATADEM = 10;
  // Nome da Empresa da 2º ocorrência
  POS_HST2_EMPRESA = 452;
  TAM_HST2_EMPRESA = 40;
  // Cargo da 2º ocorrência
  POS_HST2_CARGO = 492;
  TAM_HST2_CARGO = 30;
  // Data de Admissão da 2º ocorrência
  POS_HST2_DATAADM = 522;
  TAM_HST2_DATAADM = 10;
  // Data de Demissão da 2º ocorrência
  POS_HST2_DATADEM = 532;
  TAM_HST2_DATADEM = 10;
  // Nome da Empresa da 3º ocorrência
  POS_HST3_EMPRESA = 542;
  TAM_HST3_EMPRESA = 40;
  // Cargo da 3º ocorrência
  POS_HST3_CARGO = 582;
  TAM_HST3_CARGO = 30;
  // Data de Admissão da 3º ocorrência
  POS_HST3_DATAADM = 612;
  TAM_HST3_DATAADM = 10;
  // Data de Demissão da 3º ocorrência
  POS_HST3_DATADEM = 622;
  TAM_HST3_DATADEM = 10;
  // -------- Cursos de Formação --------
  // Código da 1º ocorrência
  POS_HST1_TRN_IDCURSO = 632;
  TAM_HST1_TRN_IDCURSO = 4;
  // Ano da 1º ocorrência
  POS_HST1_TRN_DATA = 636;
  TAM_HST1_TRN_DATA = 4;
  // Código da 2º ocorrência
  POS_HST2_TRN_IDCURSO = 640;
  TAM_HST2_TRN_IDCURSO = 4;
  // Ano da 2º ocorrência
  POS_HST2_TRN_DATA = 644;
  TAM_HST2_TRN_DATA = 4;
  // -------- Avaliação do Curso --------
  // Código da Avaliação
  POS_CODAVAL = 648;
  TAM_CODAVAL = 4;
  // Valor da Avaliação
  POS_VALAVAL = 652;
  TAM_VALAVAL = 3;
  // Comentário da Avaliação
  POS_COMENTAVAL = 655;
  TAM_COMENTAVAL = 200;

{ TCtrlImportaCandidato }

constructor TCtrlImportaCandidato.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  
  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlDocOfic := TCtrlDocOfic.Create;
  FCtrlReqPessoal := TCtrlReqPessoal.Create(false, 0);

  FLinhasArq := TStringList.Create;
end;

destructor TCtrlImportaCandidato.Destroy;
begin
  FCtrlReqPessoal.Free;
  FCtrlDocOfic.Free;
  FCtrlListTerceirosRH.Free;
  FLinhasArq.Free;
  inherited;
end;

procedure TCtrlImportaCandidato.DoChangeDataBase;
begin
  inherited;
end;

procedure TCtrlImportaCandidato.AfterInitialize;
begin
  inherited;
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlDocOfic.InitializeAs(Self);
  FCtrlReqPessoal.InitializeAs(Self);
end;

function TCtrlImportaCandidato.ValorLinha(const Posicao,Tamanho,Linha: integer): string;
begin
  try
    Result := Copy(FLinhasArq[Linha-1], Posicao, Tamanho);
  except
    Result := '';
  end;
end;

procedure TCtrlImportaCandidato.BuscarCidade;
begin
  FNomeCidade := UpperCase(ConverteCar(FNomeCidade));
  FSiglaUF := UpperCase(FSiglaUF);
  _Cds.Data := FCtrlListTerceirosRH.ListCidadeNasc(0, FSiglaUF, FNomeCidade);
  FIdCidades := _Cds.FieldByName('IDCIDADES').asFloat;
  FNomeCidade := _Cds.FieldByName('NOME').asString;
end;

function TCtrlImportaCandidato.Processar(const IAppCliente: OleVariant; AtualizaDados: boolean;
  IdFonteRecrutamento: double; NomeFonteRecrutamento: string): boolean;
var
  _CMValidaDoc: TCMValidaDoc;

  bErroDado: boolean;
  dIdDocCPF, dIdCargo: double;
  sNumReq, sCPF, sNome, sDataNasc, sEmail, sEstCivil, sSexo, sIdGrauInstr, sLogradouro,
  sNumero, sComplemento, sBairro, sCEP, sCidade, sCodEstado, sMsg, sIdPessoa, sIdPesFis,
  sIdPesCan, sIdPesEnd, sIdPesTel, sTipoCon, sCodAvaliacao, sAvaliacao, sComentAval: string;
  sIdPesTl, sDDD, sTel, sHstTrnIdCurso, sHstTrnData: array[1..2] of string;
  sIdPesUe, sHstEmpresa, sHstCargo, sHstDataAdm, sHstDataDem: array[1..3] of string;
  c, I, iNumErros, ProxSeq: integer;
  Inicio: TTime; 
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ProcessarImportacaoCand(IAppCliente, FUsuXFilial,
      FUsuXCCusto, FIdUsuarioGeral, StringListToVariant(FLinhasArq), AtualizaDados,
      IdFonteRecrutamento, NomeFonteRecrutamento);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := false;
    _CMValidaDoc := TCMValidaDoc.Create(nil);
    try
      iNumErros := 0;
      sMsg := '';
      dIdCargo := 0;
      sTipoCon := '';
      Inicio := Time;

      // Determina o Tipo Doc do CPF
      dIdDocCPF := FCtrlDocOfic.GetIdDocumento('CPF');

      // LOOP para cada linha no arquivo
      for c:=1 to FLinhasArq.Count do
      begin
        sNumReq := Trim(ValorLinha(POS_NUM_REQ, TAM_NUM_REQ, c));
        sCPF := Trim(ValorLinha(POS_NUM_CPF, TAM_NUM_CPF, c));
        sNome := Trim(ValorLinha(POS_NOME, TAM_NOME, c));
        sDataNasc := Trim(ValorLinha(POS_DATANASC, TAM_DATANASC, c));
        sEmail := Trim(ValorLinha(POS_EMAIL, TAM_EMAIL, c));
        sEstCivil := Trim(ValorLinha(POS_ESTCIVIL, TAM_ESTCIVIL, c));
        sSexo := Trim(ValorLinha(POS_SEXO, TAM_SEXO, c));
        sIdGrauInstr := Trim(ValorLinha(POS_GRAUINSTR, TAM_GRAUINSTR, c));
        sLogradouro := Trim(ValorLinha(POS_LOGRADOURO, TAM_LOGRADOURO, c));
        sNumero := Trim(ValorLinha(POS_NUMERO, TAM_NUMERO, c));
        sComplemento := Trim(ValorLinha(POS_COMPLEMENTO, TAM_COMPLEMENTO, c));
        sBairro := Trim(ValorLinha(POS_BAIRRO, TAM_BAIRRO, c));
        sCEP := Trim(ValorLinha(POS_CEP, TAM_CEP, c));
        sCidade := Trim(ValorLinha(POS_CIDADE, TAM_CIDADE, c));
        sCodEstado := Trim(ValorLinha(POS_CODESTADO, TAM_CODESTADO, c));
        sDDD[1] := Trim(ValorLinha(POS_DDD1, TAM_DDD1, c));
        sTel[1] := Trim(ValorLinha(POS_TEL1, TAM_TEL1, c));
        sDDD[2] := Trim(ValorLinha(POS_DDD2, TAM_DDD2, c));
        sTel[2] := Trim(ValorLinha(POS_TEL2, TAM_TEL2, c));
        sHstEmpresa[1] := Trim(ValorLinha(POS_HST1_EMPRESA, TAM_HST1_EMPRESA, c));
        sHstCargo[1] := Trim(ValorLinha(POS_HST1_CARGO, TAM_HST1_CARGO, c));
        sHstDataAdm[1] := Trim(ValorLinha(POS_HST1_DATAADM, TAM_HST1_DATAADM, c));
        sHstDataDem[1] := Trim(ValorLinha(POS_HST1_DATADEM, TAM_HST1_DATADEM, c));
        sHstEmpresa[2] := Trim(ValorLinha(POS_HST2_EMPRESA, TAM_HST2_EMPRESA, c));
        sHstCargo[2] := Trim(ValorLinha(POS_HST2_CARGO, TAM_HST2_CARGO, c));
        sHstDataAdm[2] := Trim(ValorLinha(POS_HST2_DATAADM, TAM_HST2_DATAADM, c));
        sHstDataDem[2] := Trim(ValorLinha(POS_HST2_DATADEM, TAM_HST2_DATADEM, c));
        sHstEmpresa[3] := Trim(ValorLinha(POS_HST3_EMPRESA, TAM_HST3_EMPRESA, c));
        sHstCargo[3] := Trim(ValorLinha(POS_HST3_CARGO, TAM_HST3_CARGO, c));
        sHstDataAdm[3] := Trim(ValorLinha(POS_HST3_DATAADM, TAM_HST3_DATAADM, c));
        sHstDataDem[3] := Trim(ValorLinha(POS_HST3_DATADEM, TAM_HST3_DATADEM, c));
        sHstTrnIdCurso[1] := Trim(ValorLinha(POS_HST1_TRN_IDCURSO, TAM_HST1_TRN_IDCURSO, c));
        sHstTrnData[1] := Trim(ValorLinha(POS_HST1_TRN_DATA, TAM_HST1_TRN_DATA, c));
        sHstTrnIdCurso[2] := Trim(ValorLinha(POS_HST2_TRN_IDCURSO, TAM_HST2_TRN_IDCURSO, c));
        sHstTrnData[2] := Trim(ValorLinha(POS_HST2_TRN_DATA, TAM_HST2_TRN_DATA, c));
        sCodAvaliacao := Trim(ValorLinha(POS_CODAVAL, TAM_CODAVAL, c));
        sAvaliacao := Trim(ValorLinha(POS_VALAVAL, TAM_VALAVAL, c));
        sComentAval := Trim(ValorLinha(POS_COMENTAVAL, TAM_COMENTAVAL, c));

        // Procura o Empregado especificado na Linha Atual do Layout
        // Verifica se as colunas obrigatórias estão preenchidas
        if (sNumReq = '') or (sCPF = '') or (sNome = '') then
        begin
          sMsg := CMTranslateMsg(MSG_ERRO_IDENTIFIC, [IntToStr(c)])+
            Trim(ValorLinha(1,79,c)) +CR_LF+ Replicate('-',100);

          // Enviar mensagem ao cliente
          try
            IAppCliente.ProcessarImportacaoCand_CB(sMsg, '');
          except
          end;
          
          Inc(iNumErros);
          Continue;
        end;

        // Procurar a Requisição e Apanha alguns dados dela
        try
          _Cds.Data := FCtrlReqPessoal.ListDadosEssenciaisReqPessoa(StrToFloat(sNumReq));
          bErroDado := false;
        except
          bErroDado := true;
        end;

        // Emitir uma mensagem de erro se a Requisição não existir
        if (bErroDado) or (_Cds.IsEmpty) then
        begin
          sMsg := CMTranslateMsg(MSG_ERRO_REQUISICAO, [IntToStr(c)])+
            sNumReq +CR_LF+ Replicate('-',100);

          // Enviar mensagem ao cliente
          try
            IAppCliente.ProcessarImportacaoCand_CB(sMsg, '');
          except
          end;

          Inc(iNumErros);
          Continue;
        end
        else
        begin
          dIdCargo := _Cds.FieldByName('IDCARGO').asFloat;
          sTipoCon := _Cds.FieldByName('TIPOCONTRATO').asString;
        end;

        // Processo a linha de Layout para o Candidato
        // -----------------------------------------------------------------------
        // Rotina para Validar o CPF
        _CMValidaDoc.NumDocumento := sCPF;
        if not(_CMValidaDoc.DocumentoValido) then
        begin
          sMsg := CMTranslateMsg(MSG_ERRO_CPF, [IntToStr(c)]) +sCPF +' '+
            sNome +CR_LF+ Replicate('-',100);

          // Enviar mensagem ao cliente
          try
            IAppCliente.ProcessarImportacaoCand_CB(sMsg, '');
          except
          end;

          Inc(iNumErros);
          Continue;
        end;

        try
          StartTransaction;

          sIdPessoa := '';
          sIdPesFis := '';
          sIdPesCan := '';
          sIdPesEnd := '';
          sIdPesTel := '';
          sIdPesTl[1] := '';
          sIdPesTl[2] := '';
          for I:=1 to 3 do
            sIdPesUe[I] := '';

          // Verifico, pelo CPF, se a Pessoa já existe
          _Cds.Data := GetDataPacket(
            'SELECT'+CR_LF+
            '  IDPESSOA, IDENDRESIDENCIAL'+CR_LF+
            'FROM'+CR_LF+
            '  PESSOA'+CR_LF+
            'WHERE'+CR_LF+
            '  (NUMDOCUMENTO = ' +QuotedStr(sCPF)+ ')');

          if not(_Cds.IsEmpty) then
          begin
            sMsg := CMTranslateMsg(MSG_ERRO_DUPLICIDADE, [IntToStr(c)]) +sCPF +' '+
              sNome +CR_LF+ Replicate('-',100);
            sIdPessoa := _Cds.FieldByName('IDPESSOA').asString;
            sIdPesEnd := _Cds.FieldByName('IDENDRESIDENCIAL').asString;

            // Atualizar Pessoa
            if (AtualizaDados) then
              ExecSQL(
                'UPDATE PESSOA SET'+CR_LF+
                '  NOME        = ' +QuotedStr(sNome)+ ','+CR_LF+
                '  RAZAOSOCIAL = ' +QuotedStr(sNome)+ ','+CR_LF+
                '  TIPO        = ''F'','+CR_LF+
                '  EMAIL       = ' +QuotedStr(sEmail)+CR_LF+
                'WHERE'+CR_LF+
                '  (IDPESSOA = ' +sIdPessoa+ ')');

            // Atualizar Pessoa Física
            _Cds.Data := GetDataPacket(
              'SELECT'+CR_LF+
              '  IDPESSOA'+CR_LF+
              'FROM'+CR_LF+
              '  PESSOAFISICA'+CR_LF+
              'WHERE'+CR_LF+
              '  (IDPESSOA = ' +sIdPessoa+ ')');

            if (_Cds.IsEmpty) then
              sIdPesFis := ''
            else
            begin
              sIdPesFis := sIdPessoa;
              if (AtualizaDados) then
                ExecSQL('UPDATE PESSOAFISICA SET'+CR_LF+
                  '  DATANASC   = ' +IFF(sDataNasc='', 'NULL,',
                    'TO_DATE(' +QuotedStr(sDataNasc)+ ',''DD/MM/YYYY''),')+CR_LF+
                  '  ESTCIVIL   = ' +QuotedStr(sEstCivil)+ ','+CR_LF+
                  '  SEXO       = ' +QuotedStr(sSexo)+ ','+CR_LF+
                  '  IDFONTRECR = ' +FloatToStr(IdFonteRecrutamento)+ ','+CR_LF+
                  '  IDGRINSTR  = ' +IFF(sIdGrauInstr='', 'NULL', sIdGrauInstr)+CR_LF+
                  'WHERE'+CR_LF+
                  '  (IDPESSOA = ' +sIdPessoa+ ')');
            end;

            // Atualizar Candidato
            _Cds.Data := GetDataPacket(
              'SELECT'+CR_LF+
              '  IDPESSOA'+CR_LF+
              'FROM'+CR_LF+
              '  CANDIDAT'+CR_LF+
              'WHERE'+CR_LF+
              '  (IDPESSOA = ' +sIdPessoa+ ')');

            if (_Cds.IsEmpty) then
              sIdPesCan := ''
            else
            begin
              sIdPesCan := sIdPessoa;
              if (AtualizaDados) then
                ExecSQL(
                  'UPDATE CANDIDAT SET'+CR_LF+
                  '  IDCARGO      = ' +FloatToStr(dIdCargo)+ ','+CR_LF+
                  '  TIPOCONTRATO = ' +QuotedStr(sTipoCon)+ ','+CR_LF+
                  '  DATULTATU    = TO_CHAR(TO_DATE(SYSDATE),''DD/MM/YYYY'')'+CR_LF+
                  'WHERE'+CR_LF+
                  '  (IDPESSOA = ' +sIdPessoa+ ')');
            end;

            // Atualizar Endereço
            if (sIdPesEnd <> '') then
            begin
              if (AtualizaDados) then
              begin
                FIdCidades := 0;
                FNomeCidade := sCidade;
                FSiglaUF := sCodEstado;
                BuscarCidade;
                ExecSQL(
                  'UPDATE ENDPESS SET'+CR_LF+
                  '  LOGRADOURO  = ' +QuotedStr(sLogradouro)+ ','+CR_LF+
                  '  CODESTADO   = ' +QuotedStr(sCodEstado)+ ','+CR_LF+
                  '  NUMERO      = ' +QuotedStr(sNumero)+ ','+CR_LF+
                  '  COMPLEMENTO = ' +QuotedStr(sComplemento)+ ','+CR_LF+
                  '  BAIRRO      = ' +QuotedStr(sBairro)+ ','+CR_LF+
                  '  CIDADE      = ' +QuotedStr(sCidade)+ ','+CR_LF+
                  IFF(FIdCidades<>0, '  IDCIDADES   = ' +FloatToStr(FIdCidades)+ ','+CR_LF, '')+
                  '  CEP         = ' +QuotedStr(sCEP)+CR_LF+
                  'WHERE'+CR_LF+
                  '  (IDPESSOA   = ' +sIdPessoa+ ') AND'+CR_LF+
                  '  (IDENDERECO = ' +sIdPesEnd+ ')');
              end;

              // Atualizar Telefone Particular (Tipo P) e Celular (Tipo L)
              for I:=1 to 2 do
              begin
                _Cds.Data := GetDataPacket(
                  'SELECT'+CR_LF+
                  '  IDTELEFONE'+CR_LF+
                  'FROM'+CR_LF+
                  '  TELENDPESS'+CR_LF+
                  'WHERE'+CR_LF+
                  '  (IDENDERECO = ' +sIdPesEnd+ ') AND'+CR_LF+
                  '  (TIPO       = ' +IFF(I=1,QuotedStr('P'),QuotedStr('L'))+ ')');

                if (_Cds.IsEmpty) then
                  sIdPesTl[I] := ''
                else
                begin
                  sIdPesTl[I] := _Cds.FieldByName('IDTELEFONE').asString;
                  if (AtualizaDados) then
                    ExecSQL(
                      'UPDATE TELENDPESS SET'+CR_LF+
                      '  DDD    = ' +QuotedStr(sDDD[I])+ ','+CR_LF+
                      '  NUMERO = ' +QuotedStr(sTel[I])+CR_LF+
                      'WHERE'+CR_LF+
                      '  (IDTELEFONE = ' +sIdPesTl[I]+ ')');
                end;
              end;
            end;

            // Empregos Anteriores (até três ocorrências)
            for I:=1 to 3 do
            begin
              _Cds.Data := GetDataPacket(
                'SELECT'+CR_LF+
                '  IDPESSOA'+CR_LF+
                'FROM'+CR_LF+
                '  ULTEMPR'+CR_LF+
                'WHERE'+CR_LF+
                '  (IDPESSOA = ' +sIdPessoa+ ') AND'+CR_LF+
                '  (NUMSEQ   = ' +IntToStr(I)+ ')');

              if (_Cds.IsEmpty) then
                sIdPesUe[I] := ''
              else
              begin
                sIdPesUe[I] := sIdPessoa;
                if (AtualizaDados) then
                  ExecSQL(
                    'UPDATE ULTEMPR SET'+CR_LF+
                    '  EMPRESA   = ' +QuotedStr(sHstEmpresa[I])+ ','+CR_LF+
                    '  CARGO     = ' +QuotedStr(sHstCargo[I])+ ','+CR_LF+
                    '  DAT_ADMIS = ' +IFF(sHstDataAdm[I]='', 'NULL,',
                      'TO_DATE(' +QuotedStr(sHstDataAdm[I])+ ',''DD/MM/YYYY''),')+CR_LF+
                    '  DATADEM   = ' +IFF(sHstDataDem[I]='', 'NULL)',
                      'TO_DATE(' +QuotedStr(sHstDataDem[I])+ ',''DD/MM/YYYY'')')+CR_LF+
                    'WHERE'+CR_LF+
                    '  (IDPESSOA = ' +sIdPessoa+ ') AND'+CR_LF+
                    '  (NUMSEQ   = ' +IntToStr(I)+ ')');
              end;
            end;

            // Enviar mensagem ao cliente
            try
              IAppCliente.ProcessarImportacaoCand_CB(sMsg, '');
            except
            end;
          end;

          if (sIdPessoa = '') then // Pessoa não existe
          begin
            sIdPessoa := FloatToStr(GetSequence('PESSOA'));
            ExecSQL(
              'INSERT INTO PESSOA ('+CR_LF+
              '  IDPESSOA, NOME, RAZAOSOCIAL, TIPO, NUMDOCUMENTO, EMAIL)'+CR_LF+
              'VALUES ('+CR_LF+
              '  '+ sIdPessoa+ ','+CR_LF+
              '  '+ QuotedStr(sNome)+ ','+CR_LF+
              '  '+ QuotedStr(sNome)+ ','+CR_LF+
              '  ''F'','+CR_LF+
              '  '+ QuotedStr(sCPF) + ','+CR_LF+
              '  '+ QuotedStr(sEmail) + ')');

            // DocPessoa
            if (dIdDocCPF <> 0) then
              ExecSQL(
                'INSERT INTO DOCPESSOA (IDPESSOA, IDDOCUMENTO, NUMDOCUMENTO) VALUES ('+
                sIdPessoa +', '+ FloatToStr(dIdDocCPF) +', '+
                QuotedStr(sCPF) +')');

            sMsg := (' Aviso   [linha ') +IntToStr(c)+
              ('] Candidato Inserido: ') +sCPF +' '+
              sNome +CR_LF+ Replicate('-',100);

            // Enviar mensagem ao cliente
            try
              IAppCliente.ProcessarImportacaoCand_CB(sMsg, '');
            except
            end;
          end;

          // Pessoa Física não existe
          if (sIdPesFis = '') then
            ExecSQL(
              'INSERT INTO PESSOAFISICA (IDPESSOA, DATANASC, ESTCIVIL, SEXO,'+
              'IDFONTRECR, IDGRINSTR)'+CR_LF+
              'VALUES ('+CR_LF+
              '  '+ sIdPessoa + ','+CR_LF+
              '  '+ IFF(sDataNasc='', 'NULL,',
                'TO_DATE(' +QuotedStr(sDataNasc)+ ',''DD/MM/YYYY''),')+CR_LF+
              '  '+ QuotedStr(sEstCivil)+ ','+CR_LF+
              '  '+ QuotedStr(sSexo)+ ','+CR_LF+
              '  '+ FloatToStr(IdFonteRecrutamento) + ','+CR_LF+
              '  '+ IFF(sIdGrauInstr='', 'NULL)', sIdGrauInstr+ ')'));

          // Candidato não existe
          if (sIdPesCan = '') then
            ExecSQL(
              'INSERT INTO CANDIDAT (IDPESSOA, IDCARGO, TIPOCONTRATO, DATINCLU, DATULTATU)'+CR_LF+
              'VALUES ('+sIdPessoa +', '+ FloatToStr(dIdCargo)+ ', ' +QuotedStr(sTipoCon)+
              ', TO_CHAR(SYSDATE,''DD/MM/YYYY''), TO_CHAR(SYSDATE,''DD/MM/YYYY''))');

          // Endereço da Pessoa não existe
          if (sIdPesEnd = '') then
          begin
            FIdCidades := 0;
            FNomeCidade := sCidade;
            FSiglaUF := sCodEstado;
            BuscarCidade;
            sIdPesEnd := FloatToStr(GetSequence('ENDPESS'));
            ExecSQL(
              'INSERT INTO ENDPESS (IDPESSOA, IDENDERECO, LOGRADOURO, CODESTADO, NUMERO, '+
              'COMPLEMENTO, BAIRRO, CIDADE, IDCIDADES, CEP)'+
              'VALUES ('+CR_LF+
              '  '+ sIdPessoa+ ', ' +sIdPesEnd+ ','+CR_LF+
              '  '+ QuotedStr(sLogradouro)+ ','+CR_LF+
              '  '+ QuotedStr(sCodEstado)+ ','+CR_LF+
              '  '+ QuotedStr(sNumero)+ ','+CR_LF+
              '  '+ QuotedStr(sComplemento)+ ','+CR_LF+
              '  '+ QuotedStr(sBairro)+ ','+CR_LF+
              '  '+ QuotedStr(sCidade)+ ','+CR_LF+
              '  '+ IFF(FIdCidades<>0, FloatToStr(FIdCidades)+ ',', 'NULL,')+CR_LF+
              '  '+ QuotedStr(sCEP)+ ')');

            ExecSQL(
              'UPDATE PESSOA SET IDENDRESIDENCIAL = ' +sIdPesEnd+CR_LF+
              'WHERE IDPESSOA = ' +sIdPessoa);
          end;

          for I:=1 to 2 do
          begin
            // Telefone Fixo e Celular da Pessoa não existe
            if (sIdPesTl[I] = '') then
            begin
              if (sTel[I] <> '') then
              begin
                sIdPesTel := FloatToStr(GetSequence('TELENDPESS'));
                ExecSQL(
                'INSERT INTO TELENDPESS (IDTELEFONE, IDENDERECO, DDD, TIPO, NUMERO)'+CR_LF+
                'VALUES ('+CR_LF+
                '  '+ sIdPesTel+ ', ' +sIdPesEnd+ ', '+CR_LF+
                '  '+ QuotedStr(sDDD[I])+ ', ''L'','+CR_LF+
                '  '+ QuotedStr(sTel[I])+ ')');
              end;
            end;
          end;

          // Empregos Anteriores (até três ocorrências)
          for I:=1 to 3 do
          begin
            if (sIdPesUe[I] = '') then
            begin
              if (sHstEmpresa[I] <> '') then
                ExecSQL(
                  'INSERT INTO ULTEMPR (IDPESSOA, NUMSEQ, EMPRESA, CARGO, DAT_ADMIS, DATADEM)'+CR_LF+
                  'VALUES ('+CR_LF+
                  '  '+ sIdPessoa+ ', ' +IntToStr(I)+ ','+CR_LF+
                  '  '+ QuotedStr(sHstEmpresa[I])+ ','+CR_LF+
                  '  '+ QuotedStr(sHstCargo[I])+ ','+CR_LF+
                  '  '+ IFF(sHstDataAdm[I]='', 'NULL,',
                    'TO_DATE(' +QuotedStr(sHstDataAdm[I])+ ',''DD/MM/YYYY''),')+CR_LF+
                  '  '+ IFF(sHstDataDem[I]='', 'NULL)',
                    'TO_DATE(' +QuotedStr(sHstDataDem[I])+ ',''DD/MM/YYYY''))'));
            end;
          end;

          // Curso de Formação (até duas ocorrências)
          for I:=1 to 2 do
          begin
            if (sHstTrnIdCurso[I] <> '') then
            begin
              _Cds.Data := GetDataPacket(
                'SELECT *'+CR_LF+
                'FROM'+CR_LF+
                '  HSTTRN'+CR_LF+
                'WHERE'+CR_LF+
                '  (IDPESSOA = ' +sIdPessoa+ ') AND'+CR_LF+
                '  (IDCURSO  = ' +sHstTrnIdCurso[I]+ ')');

              if (_Cds.IsEmpty) then
                ExecSQL(
                  'INSERT INTO HSTTRN (IDPESSOA, IDCURSO, NUMSEQ, FLGCONTROLE, DATREFIM)'+CR_LF+
                  'VALUES ('+CR_LF+
                  '  '+ sIdPessoa+ ','+CR_LF+
                  '  '+ sHstTrnIdCurso[I]+ ', 1, 0,'+CR_LF+
                  '  '+ IFF(sHstTrnData[I]='', 'NULL)',
                    'TO_DATE(' +QuotedStr('31/12/'+sHstTrnData[I])+ ',''DD/MM/YYYY''))'));
            end;
          end;

          // Parecer da Consultoria
          if (sCodAvaliacao <> '') then
          begin
            _Cds.Data := GetDataPacket(
              'SELECT'+CR_LF+
              '  NVL(MAX(NUMSEQ),0) AS NUMSEQ'+CR_LF+
              'FROM'+CR_LF+
              '  HSTAVAL'+CR_LF+
              'WHERE'+CR_LF+
              '  (IDPESSOA    = ' +sIdPessoa+ ') AND'+CR_LF+
              '  (CODTIPOAVAL = ' +sCodAvaliacao+ ')');
            ProxSeq := _Cds.FieldByName('NUMSEQ').asInteger + 1;

            ExecSQL(
              'INSERT INTO HSTAVAL (IDPESSOA, CODTIPOAVAL, NUMSEQ, DATAREAL, AVALIACAO, '+
              'COMENT, AVALIADOR)'+CR_LF+
              'VALUES ('+CR_LF+
              '  '+ sIdPessoa+ ','+CR_LF+
              '  '+ sCodAvaliacao + ','+CR_LF+
              '  '+ IntToStr(ProxSeq)+ ','+CR_LF+
              '  TO_CHAR(TO_DATE(SYSDATE),''DD/MM/YYYY''),'+CR_LF+
              '  '+ IFF(sAvaliacao='', 'NULL,', sAvaliacao+ ',')+CR_LF+
              '  '+ QuotedStr(sComentAval)+ ','+CR_LF+
              '  '+ QuotedStr(Trim(NomeFonteRecrutamento))+ ')');
          end;

          // Associa Candidato com Requisição
          _Cds.Data := GetDataPacket(
            'SELECT *'+CR_LF+
            'FROM'+CR_LF+
            '  REQUICAND'+CR_LF+
            'WHERE'+CR_LF+
            '  (IDPESSOA = ' +sIdPessoa+ ') AND'+CR_LF+
            '  (NUMREQ   = ' +sNumReq+ ')');

          if (_Cds.IsEmpty) then
            ExecSQL(
              'INSERT INTO REQUICAND (IDPESSOA, NUMREQ)'+CR_LF+
              'VALUES ('+CR_LF+
              '  '+ sIdPessoa + ','+CR_LF+
              '  '+ sNumReq+ ')');

          Commit;
        except
          on E: Exception do
          begin
            Rollback;
            sMsg := CMTranslateMsg(MSG_ERRO_ATUALIZACAO, [IntToStr(c)])+
              Trim(ValorLinha(1,79,c)) +CR_LF+ Replicate('-',100) +CR_LF+
             ('Erro:') +CR_LF+ E.Message;

            // Enviar mensagem ao cliente
            try
              IAppCliente.ProcessarImportacaoCand_CB(sMsg, '');
            except
            end;
          end;
        end;

        // Enviar mensagem ao cliente
        try
          IAppCliente.ProcessarImportacaoCand_CB('', '');
        except
        end;
      end;

      // Enviar mensagem ao cliente
      try
        IAppCliente.ProcessarImportacaoCand_CB('',
          ('Tempo de Processamento: ') +HoraPorExtenso(Time - Inicio));
      except
      end;

      if (iNumErros > 0) then
      begin
        if (iNumErros = FLinhasArq.Count) then
          MessageInfo := ('Nenhuma linha foi executada.')
        else
          MessageInfo := CMTranslateMsg(MSG_NUM_ERROS, [IntToStr(iNumErros)]);
      end
      else
        MessageInfo := ('Processo executado com sucesso.');
    finally
      FreeObject(_CMValidaDoc);
    end;
  end;
end;

end.
