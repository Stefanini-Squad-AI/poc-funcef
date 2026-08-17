unit uCtrlGeraFolPagResc;

interface

uses SysUtils, Controls, Classes, Forms, uCmControlObject, uCmDbObject, IvDictio, 
  uCMTranslate, uCmClientDataSet, uCMTypes, uCtrlGeraFolPag;

type
  TCtrlGeraFolPagResc = class(TCtrlGeraFolPag)
  protected
    FCdsPessoa: TCMClientDataSet;
    FCdsRubPendente: TCMClientDataSet;

    FNormalIni: TDate;
    FDataInicial: TDate;
    FDataFinal: TDate;
    FDataDeslig: TDate;

    FIdMotivoRescisaoCompl: integer;
    FTipoSelMotivo: integer;

    FIdHotel: double;

    FProcLancPrev: boolean;
    FFazRescisaoCompl: boolean;
    FSelTodosNoPeriodo: boolean;

    FReferenciaSal: string;
    FReferenciaGener: string;
    FListaIdRubrica: string;
    FListaTipoContrato: string;

    function AbrirSQLFunc: boolean; override;
    function ListHistRubSalPessoaMes(IdRubrica: double; IdMotivo, SeqRubricaIndiv: integer): OleVariant;
    function ListFlgDescontoRubPrinc(IdRubrica: double): OleVariant;

    procedure SelDadosEmpresaAtual;

    function GetIdMotivoAtual: integer;
    function GetValorBaseComplementar(MesRef: string; IdPessoa,
      IdRubrica, IdMotivo: double): double;
    procedure SetMesRef;

    function  AlterarValorHstRubSal(IdMotivo: integer; IdRubrica: double; Valor: string): boolean;
    procedure SomarRubEspeciais(IdRubrica: double; ValProvento, ValBase: double);
    procedure SubtrairRubricaComplementar(var ValorRubrica: double; DataBase: TDate;
      IdPessoa, IdRubrica: double; IdMotivoBase: integer);
    procedure CalcEspecialRefRub(CodRubCLT: string; Valor: double);

    function PrepararLancPendentes: boolean;
    function PrepararRubEspeciais: boolean; override;

    function ApagarPrevia: boolean; override;
    function GerarFolhaRescisao: boolean;

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  public
    constructor Create(IdEmpresa: integer; IdHotel: double;
      UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); override;
    destructor  Destroy; override;

    function Processar(const IAppCliente: OleVariant;
      TipoCliente: integer; // Indicação do Cliente
      TipoEmpresa: string; // Tipo da Empresa Proprietátia
      SelTodosNoPeriodo: boolean; // Indica se deve gerar Rescisão para cada pessoa no Período indicado
      DataInicial, // Data Inicial do Período a procurar Demitidos
      DataFinal: TDateTime; // Data Final do Período a procurar Demitidos
      ListaTipoContrato: string; // Lista de Tipos de Contrato quando for indicado um Período
      IdUsuario: integer; // Identificação do Usuário que está gerando a Rescisão
      NormalIni, // Data Inicial da Folha
      NormalFim: TDateTime; // Data Final da Folha
      Processo, // Indica se será gerada uma Prévia (0) ou Final (1)
      OpcaoPrevia, // Indica como será tratada a prévia anterior
      TipoSelMotivo, // Tipo do Motivo a selecionar
      IdMotivo: integer; // Motivo selecionado
      // Referente à Rescisão Complementar
      FazRescisaoCompl: boolean; // Indica se irá gerar uma Rescisão Complementar
      IdMotivoRescisaoCompl: integer; // Motivo selecionado para a Rescisão Complementar
      ListaIdRubrica: string; // Lista das Rubricas a serem geradas
      // Referente à integração CAP / Geração do Arquivo de Pagamento Eletrônico
      Integra_PagEletronico, // Indica se deve integrar com o CAP
      Integra_CAP: boolean; // Indica se deve gerar o Arquivo de Pagamento Eletrônico
      DataEmissao, // Data da Emissão do Documento CAP / Pagamento Eletrônico
      DataPagamento: TDateTime; // Data de Pagamento do Documento CAP / Pagamento Eletrônico
                                // e Mês de Referência das Rubricas
      CriarDocIndividual: boolean; // Indica se deve criar um Documento por Pessoa para cada lançamento CAP
      RateioCC, // Indica se deve fazer o Rateio por Centro de Custo nos Documentos CAP
      ObrigaAbc, // Indica se usa Atividade / Projeto
      ObrigaCRespon: boolean; // Centro de Responsabilidade
      CodTipDoc, // Código do Tipo de Documento a ser gerado para o CAP
      CodPortForma: integer; // Código do Portador forma a ser gerado para o CAP
      ListaTipoDesemb, // Lista dos Tipos de Desembolso
      DiretorioArqPag, // Pasta que o Arquivo de Pagamento Eletrônico será gravado
      ContaPadrao_Favorecido: string; // Conta Contábil usada para criar um Favorecido
      IdPlano_ContaPadrao_Favorecido: integer; // IdPlano Conta Contábil usada para criar um Favorecido
      UsaPlanoPatro: boolean; // Indica se deve usar Plano da Patrocinadora
      PlanoPrevGlobal, // Plano da Patrocinadora
      PatroGlobal: integer; // Patrocinadora
      ProcLancPrev: boolean; // Indica se deve processar os Lançamentos Previdenciários (TMPDESC)
      UsaLOG: boolean = false
    ): boolean;

    property CdsPessoa: TCMClientDataSet read FCdsPessoa write FCdsPessoa;
  end;

implementation

uses Variants, Db, fAguarde, uCtrlCalcRub, uCtrlFuncoesRH;

{ TCtrlGeraFolPagResc }

constructor TCtrlGeraFolPagResc.Create(IdEmpresa: integer; IdHotel: double;
  UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create(IdEmpresa, IdHotel, UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCdsRubPendente := TCMClientDataSet.Create(nil);

  FIdHotel := IdHotel;
  FFazRescisaoCompl := false;
  FIdMotivoRescisaoCompl := 0;
  FSelTodosNoPeriodo := false;

  if not(IsAppServer) then
    GetTempDir;
end;

destructor TCtrlGeraFolPagResc.Destroy;
begin
  FCdsRubPendente.Free;
  if (IsAppServer) then
    FCdsPessoa.Free;
  inherited;
end;

procedure TCtrlGeraFolPagResc.OnCreateAppServer;
begin
  inherited;
  FCdsPessoa := TCMClientDataSet.Create(nil);
end;

procedure TCtrlGeraFolPagResc.AfterInitialize;
begin
  inherited;
end;

procedure TCtrlGeraFolPagResc.DoChangeDataBase;
begin
  inherited;
end;

function TCtrlGeraFolPagResc.AbrirSQLFunc: boolean;
var
  _SQL: TStringList;
begin
  try
    if (FSelTodosNoPeriodo) then
    begin
      _SQL := TStringList.Create;
      with (_SQL) do
      begin
        Clear;
        Add('SELECT');
        Add('  F.IDPESSOA, F.IDEMPRESA, F.CODCENTROCUSTO, F.MATRICULA,');
        Add('  F.IDMOTIVODESLIGRAIS, F.IDMOTIVODESLIGGERENCIAL, P.NOME,');
        Add('  F.DATAADMISSAO, F.DATADESLIGAMENTO');
        Add('FROM');
        Add('  PESSOA P, FUNCIONARIO F, SITFUNC SF');
        Add('WHERE');
        Add('  (SF.TIPOSIT          = ''D'') AND');
        Add('  (SF.IDSITFUNC        = F.IDSITFUNC) AND');
        Add('  (F.DATADESLIGAMENTO >= TO_DATE(' +
          QuotedStr(DateToStr(FDataInicial))+ ',''DD/MM/YYYY'')) AND');
        Add('  (F.DATADESLIGAMENTO <= TO_DATE(' +
          QuotedStr(DateToStr(FDataFinal))+',''DD/MM/YYYY'')) AND');
        Add(MontaLinhaSelSQL('  (F.TIPOCONTRATO',QuotedListaString(FListaTipoContrato,','),5));
        Add('  (F.IDPESSOA          = P.IDPESSOA)');
        Add('ORDER BY');
        Add('  MATRICULA');
        if not(IsAppServer) then
          SaveToFile(DirTempLog + '\qry.txt');
      end;
      EnviarMensagem(CMTranslate('Selecionando dados das Pessoas...'));
      FCdsFunc.Data := GetDataPacket(_SQL.Text);
      //OpenDataSet(_SQL.Text);
      EnviarMensagem('', GetTempoDecorrido, 0, '', FCdsFunc.RecordCount);

      Result := not(FCdsFunc.IsEmpty);
      if not(Result) then
        MessageInfo := CMTranslate('* Não Há Demitidos no Período Indicado.');

      _SQL.Free;
    end
    else
    begin
      FCdsFunc.Data := FCdsPessoa.Data;
      EnviarMensagem('', GetTempoDecorrido, 0, '', 1);
      Result := true;
    end;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

function TCtrlGeraFolPagResc.ListHistRubSalPessoaMes(IdRubrica: double; IdMotivo,
  SeqRubricaIndiv: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  VALORPROVENTO' +CR_LF+
    'FROM' +CR_LF+
    '  HISTRUBSAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA    = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
    '  (MES         = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
    '  (IDRUBRICA   = ' +FloatToStr(IdRubrica)+ ') AND' +CR_LF+
    '  (IDMOTIVO    = ' +IntToStr(IdMotivo)+ ') AND' +CR_LF+
    '  (MESCOBRANCA = ' +QuotedStr(FMesPagto)+ ') AND' +CR_LF+
    '  (IDPESSJUR   = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
    '  (SEQRUBRICA  = ' +IntToStr(SeqRubricaIndiv)+ ')');
end;

function TCtrlGeraFolPagResc.ListFlgDescontoRubPrinc(IdRubrica: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT' +CR_LF+
    '  PD.FLGDESCONTO' +CR_LF+
    'FROM' +CR_LF+
    '  RUBXRUB RR, PROVDESC PD' +CR_LF+
    'WHERE' +CR_LF+
    '  (RR.IDRUBSECUND = ' +FloatToStr(IdRubrica)+ ') AND' +CR_LF+
    '  (RR.IDRUBPRINC  = PD.IDPROVENTO)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  FLGDESCONTO DESC');
end;

procedure TCtrlGeraFolPagResc.SelDadosEmpresaAtual;
begin
  if (FCdsFunc.FieldByName('IDEMPRESA').asInteger <> FIdEmpresa) then
  begin
    FIdEmpresa := FCdsFunc.FieldByName('IDEMPRESA').asInteger;
    SelDadosIntegracaoEmpresa;
  end;
end;

function TCtrlGeraFolPagResc.GetIdMotivoAtual: integer;
begin
  case (FTipoSelMotivo) of
    1 :  Result := FCdsFunc.FieldByName('IDMOTIVODESLIGGERENCIAL').asInteger;
    2 :  Result := FIdMotivo;
    else Result := FCdsFunc.FieldByName('IDMOTIVODESLIGRAIS').asInteger;
  end;
end;

function TCtrlGeraFolPagResc.GetValorBaseComplementar(MesRef: string; IdPessoa, IdRubrica,
  IdMotivo: double): double;
begin
  _Cds.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  NVL(VALORPROVENTO,0) AS VALOR' +CR_LF+
    'FROM' +CR_LF+
    '  HISTRUBSAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA  = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (MES       = ' +QuotedStr(MesRef)+ ') AND' +CR_LF+
    '  (IDRUBRICA = ' +FloatToStr(IdRubrica)+ ') AND' +CR_LF+
    '  (IDMODULO  = 21) AND' +CR_LF+
    '  (IDMOTIVO  = ' +FloatToStr(IdMotivo)+ ')');

  Result := _Cds.FieldByName('VALOR').asFloat;
end;

procedure TCtrlGeraFolPagResc.SetMesRef;
begin
  FDataDeslig := FCdsFunc.FieldByName('DATADESLIGAMENTO').asDateTime;
  
  if (FDataPagamento > 0) then                        
    FMesPagto := IntToStr(ExtraiAno(FDataPagamento)) +'/'+ PoeZero(ExtraiMes(FDataPagamento))
  else
    FMesPagto := IntToStr(ExtraiAno(FDataDeslig)) +'/'+ PoeZero(ExtraiMes(FDataDeslig));

  if (FFazRescisaoCompl) then
    FMesRef := IntToStr(ExtraiAno(FNormalIni)) +'/'+ PoeZero(ExtraiMes(FNormalIni))
  else
    FMesRef := IntToStr(ExtraiAno(FDataDeslig)) +'/'+ PoeZero(ExtraiMes(FDataDeslig));
end;

procedure TCtrlGeraFolPagResc.SomarRubEspeciais(IdRubrica: double; ValProvento,
  ValBase: double);
begin
  FCdsRubXRub.Filter := 'IDRUBPRINC = ' +FloatToStr(IdRubrica);
  FCdsRubXRub.First;
  while not(FCdsRubXRub.EOF) do
  begin
    if (FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
        VarArrayOf([FCdsRubXRub.FieldByName('IDRUBSECUND').asFloat,
                    FCdsRubXRub.FieldByName('FLGTIPOFOLHA').asInteger,
                    FCdsRubXRub.FieldByName('INDPERIODO').asInteger]), [])) then
    begin
      SomarValorRubEspecial(ValProvento, ValBase, true);
    end;
    FCdsRubXRub.Next;
  end;
end;

function TCtrlGeraFolPagResc.AlterarValorHstRubSal(IdMotivo: integer; IdRubrica: double;
  Valor: string): boolean;
begin
  try
    ExecSQL(
      'UPDATE HISTRUBSAL' +CR_LF+
      'SET    VALORPROVENTO = ' +OraNumero(Valor) +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA    = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
      '  (MES         = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
      '  (IDRUBRICA   = ' +FloatToStr(IdRubrica)+ ') AND' +CR_LF+
      '  (IDMOTIVO    = ' +IntToStr(IdMotivo)+ ') AND' +CR_LF+
      '  (MESCOBRANCA = ' +QuotedStr(FMesPagto)+ ') AND' +CR_LF+
      '  (IDPESSJUR   = ' +IntToStr(FIdEmpresa)+ ')');
    Result := true;
  except
    Result := false;
    MessageInfo := CMTranslate('* Não foi possível alterar a Rubrica Nº ')+
      FloatToStr(IdRubrica);
  end;
end;

procedure TCtrlGeraFolPagResc.SubtrairRubricaComplementar(var ValorRubrica: double;
  DataBase: TDate; IdPessoa, IdRubrica: double; IdMotivoBase: integer);
var
  dValBaseCompl: double;
begin
  dValBaseCompl := GetValorBaseComplementar(RetornaAnoMes(DataBase),
    IdPessoa, IdRubrica, IdMotivoBase);

  ValorRubrica := ValorRubrica - dValBaseCompl;
  if (ValorRubrica < 0) then
    ValorRubrica := 0;
end;

procedure TCtrlGeraFolPagResc.CalcEspecialRefRub(CodRubCLT: string; Valor: double);
var
  sCodRubAux: string;
begin
  if (CodRubCLT = '') then
    exit;

  // Valor da CLT 90006 = Referência CLT 40001 (específica para salário)
  // Valor da CLT 90008 = Referência CLT 90009 (para qualquer rubrica)

  // CLT 90006 -> Referência para Salário
  if (CodRubCLT = '90006') then
    FReferenciaSal := FloatToStr(Valor)
  else
  // CLT 40001 -> Valor do Salário Pago
  if (CodRubCLT = '40001') and (FReferenciaSal <> '') then
    FReferencia := FReferenciaSal
  else
  // CLT 90008 -> Rubrica Base para Referência
  if (CodRubCLT = '90008') then
    FReferenciaGener := FloatToStr(Valor)
  else
  // CLT 90009 -> Rubrica que recebe a 90008 como Referência
  if (CodRubCLT = '90009') and (FReferenciaGener <> '') then
    FReferencia := FReferenciaGener
  else
  // CLT 90013 -> Avos para 13º
  if (CodRubCLT = '90013') then
    FReferencia := IntToStr(FCtrlCalcRub.Avos13) + '/12'
  else
  // CLT 90014 -> Avos Integrais para Férias
  if (CodRubCLT = '90014') then
    FReferencia := IntToStr(FCtrlCalcRub.AvosFerias) + '/12'
  else
  // CLT 90015 -> Avos para Férias (mod 12)
  if (CodRubCLT = '90015') then
    FReferencia := IntToStr(FCtrlCalcRub.AvosFerias mod 12 + IFF(StrFloat(
      FCtrlCalcRub.ValorRubrica(FCtrlCalcRub.TrazCodProvDescCLT('43691'))) > 0, 1,0)) + '/12'
  else
  // CLT 99xxx -> Referência com Valor da Rubrica indicada na CLT 99xxx
  if (Copy(CodRubCLT,1,2) = '99') then
  begin
    sCodRubAux := FCtrlCalcRub.TrazCodProvDescCLT(CodRubCLT);

    FReferencia :=
      IFF(Pos('+', sCodRubAux) = 1, '', FCtrlCalcRub.ValorRubrica(
        IFF(Pos('+', sCodRubAux) > 0,
          copy(sCodRubAux, 1,
            Pos('+', sCodRubAux)-1),
          sCodRubAux))) +
      IFF(Pos('+', sCodRubAux) > 0,
        trim(copy(sCodRubAux,Pos('+', sCodRubAux)+1,20)),
        '');
  end;
end;

function TCtrlGeraFolPagResc.PrepararLancPendentes: boolean;
begin
  FSQL :=
    'SELECT' +CR_LF+
    '  RI.IDRUBRICA, RI.SEQRUBRICAINDIV, RI.IDPESSOA, RI.VALORRUBRICA,' +CR_LF+
    '  RI.PARCELAS, RI.NUMOCORRENCIAS, RI.IDREGRACALCULO, PD.IDREGRARESCISAO,' +CR_LF+
    '  PD.CODRUBCLT, PD.FLGRESCISAO, PD.FLGDESCONTO, RP.CODPROVDESC' +CR_LF+
    'FROM' +CR_LF+
    '  RUBRICAINDIV RI, RUBRICAXPESS RP, PROVDESC PD, FUNCIONARIO F' +CR_LF+
    'WHERE' +CR_LF+
    '  (F.IDPESSOA          =  ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
    '  (F.IDPESSOA          = RI.IDPESSOA) AND' +CR_LF+
    '  (RI.ANOMESINICIO    <= ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
    '  ((RI.NUMOCORRENCIAS <> RI.PARCELAS) OR' +CR_LF+
    '   (RI.FLGPERMANENTE   = 1)) AND' +CR_LF+
    '  (RI.IDEMPRESA        = ' +FloatToStr(FIdEmpresa)+ ') AND' +CR_LF+
    '  (PD.FLGCONSTAFOLHA   = 1) AND' +CR_LF+
    '  (PD.FLGESPECIAL      = 0) AND' +CR_LF+
    '  (PD.IDPROVENTO       = RP.IDRUBRICA) AND' +CR_LF+
    '  (RP.IDPESSOA         = ' +FloatToStr(FIdEmpresa)+ ') AND' +CR_LF;

  if (Trim(FListaIdRubPrincipal) = '') then
    FSQL := FSQL +
      '  (PD.FLGRESCISAO      = 1) AND' +CR_LF
  else
    FSQL := FSQL +
      '  ((PD.FLGRESCISAO     = 1) OR' +CR_LF+
      '   (RI.IDRUBRICA      IN (' +FListaIdRubPrincipal+ '))) AND' +CR_LF;

  FSQL := FSQL +
    '  (RI.IDRUBRICA        = PD.IDPROVENTO)';

  try
    FCdsRubPendente.Data := GetDataPacket(FSQL);
    Result := true;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := CMTranslate('* Na leitura dos Lançamentos Pendentes no mês da rescisão.') +
        MSG_ERRO+ E.Message;
    end;
  end;
end;

function TCtrlGeraFolPagResc.PrepararRubEspeciais: boolean;
begin
  Result := inherited PrepararRubEspeciais;
  try
    _Cds.Data := GetDataPacket(
      'SELECT DISTINCT RR.IDRUBPRINC' +CR_LF+
      'FROM   PROVDESC PD, RUBXRUB RR' +CR_LF+
      'WHERE  (RR.IDRUBSECUND = PD.IDPROVENTO) AND' +CR_LF+
      '       (NVL(PD.FLGESPECIAL,0) * NVL(PD.FLGRESCISAO,0) > 0)');

    FListaIdRubPrincipal := '';
    while not(_Cds.EOF) do
    begin
      if (FListaIdRubPrincipal = '') then
        FListaIdRubPrincipal := _Cds.FieldbyName('IDRUBPRINC').asString
      else
        FListaIdRubPrincipal := FListaIdRubPrincipal +','+ _Cds.FieldbyName('IDRUBPRINC').asString;
      _Cds.Next;
    end;

    FCdsRubEsp.Data := GetDataPacket(
      'SELECT DISTINCT' +CR_LF+
      '  PD.IDPROVENTO, PD.NUMPRIORIDADE, RP.CODPROVDESC, PD.CODRUBCLT,' +CR_LF+
      '  PD.FLGESPECIAL, PD.FLGCONSTAFOLHA, PD.FLGDECIMOTERCEIRO, PD.FLGFERIAS,' +CR_LF+
      '  PD.FLGSALFAMILIA, PD.FLGRESCISAO, PD.FLGDESCONTO, PD.IDREGRA, PD.IDREGRA13,' +CR_LF+
      '  PD.IDREGRAFERIAS, PD.IDREGRARESCISAO, RR.INDPERIODO, RR.FLGTIPOFOLHA,' +CR_LF+
      '  0.00 AS VALESPECIAIS' +CR_LF+
      'FROM' +CR_LF+
      '  PROVDESC PD, RUBXRUB RR, RUBRICAXPESS RP' +CR_LF+
      'WHERE' +CR_LF+
      '  (EXISTS (SELECT R1.IDRUBSECUND' +CR_LF+
      '           FROM   RUBXRUB R1' +CR_LF+
      '           WHERE  (NVL(PD.FLGESPECIAL,0) + NVL(PD.FLGRESCISAO,0) > 0) AND' +CR_LF+
      '                  (R1.IDRUBSECUND = PD.IDPROVENTO)' +CR_LF+
      '          ) OR' +CR_LF+
      '   PD.IDPROVENTO IN (SELECT R2.IDRUBPRINC' +CR_LF+
      '                     FROM   RUBXRUB R2, PROVDESC P2, PROVDESC P3' +CR_LF+
      '                     WHERE  (P2.FLGRESCISAO = 1) AND' +CR_LF+
      '                            (P3.FLGESPECIAL = 1) AND' +CR_LF+
      '                            (P2.IDPROVENTO  = R2.IDRUBSECUND) AND' +CR_LF+
      '                            (P3.IDPROVENTO  = R2.IDRUBPRINC)' +CR_LF+
      '                    ) OR' +CR_LF+
      '   ((PD.FLGRESCISAO = 1) AND' +CR_LF+
      '    (PD.FLGESPECIAL = 1))' +CR_LF+
      '  ) AND' +CR_LF+
      '  (PD.IDPROVENTO     = RP.IDRUBRICA) AND' +CR_LF+
      '  (RP.IDPESSOA       = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
      '  (PD.NUMPRIORIDADE IS NOT NULL) AND' +CR_LF+
      '  (PD.IDPROVENTO     = RR.IDRUBSECUND(+))' +CR_LF+
      'ORDER BY' +CR_LF+
      '  NUMPRIORIDADE, IDPROVENTO');

    Result := true;
  except
    on E: Exception do
      MessageInfo := CMTranslate('* Ao carregar a lista das Rubricas Especiais.') +
        MSG_ERRO+ E.Message;
  end;
end;

function TCtrlGeraFolPagResc.ApagarPrevia: boolean;
var
  sTiposFolha, sListaIdFunc: string;
begin
  Result := inherited ApagarPrevia;
  try
    // Criação da Lista de Empregados Selecionados
    if (FFazRescisaoCompl) then
      sTiposFolha := IntToStr(FIdMotivoRescisaoCompl)
    else
      sTiposFolha := IntToStr(FIdMotivo);

    if not(FSelTodosNoPeriodo) then
    begin
      sListaIdFunc := FCdsFunc.FieldByName('IDPESSOA').asString;
      if not(FFazRescisaoCompl) then
      begin
        case (FTipoSelMotivo) of
          0 :  sTiposFolha := FCdsFunc.FieldByName('IDMOTIVODESLIGRAIS').asString;
          1 :  sTiposFolha := FCdsFunc.FieldByName('IDMOTIVODESLIGGERENCIAL').asString;
        end;
      end;
    end
    else
    begin
      sListaIdFunc := '';
      sTiposFolha := '';
      FCdsFunc.First;
      while not(FCdsFunc.EOF) do
      begin
        if (sListaIdFunc = '') then
          sListaIdFunc := FCdsFunc.FieldByName('IDPESSOA').asString
        else
          sListaIdFunc := sListaIdFunc +','+ FCdsFunc.FieldByName('IDPESSOA').asString;

        if not(FFazRescisaoCompl) then
        begin
          case (FTipoSelMotivo) of
            0 :
            begin
              if (sTiposFolha = '') then
                sTiposFolha := FCdsFunc.FieldByName('IDMOTIVODESLIGRAIS').asString
              else
                sTiposFolha := sTiposFolha +','+ FCdsFunc.FieldByName('IDMOTIVODESLIGRAIS').asString;
            end;
            1 :
            begin
              if (sTiposFolha = '') then
                sTiposFolha := FCdsFunc.FieldByName('IDMOTIVODESLIGGERENCIAL').asString
              else
                sTiposFolha := sTiposFolha +','+ FCdsFunc.FieldByName('IDMOTIVODESLIGGERENCIAL').asString;
            end;
          end;
        end;
        FCdsFunc.Next;
      end;
      FCdsFunc.First;
    end;

    FSQL := '';
    if (FOpcaoPrevia in [1,3]) or ((FOpcaoPrevia = 2) and (sListaIdFunc <> '')) then
    begin
      FSQL := 'WHERE ';

      if (FOpcaoPrevia in [1,3]) and (sTiposFolha <> '') then
        if (Pos(',', sTiposFolha) = 0) then
          FSQL := FSQL + '(IDMOTIVO = ' +sTiposFolha+ ')'
        else
          FSQL := FSQL + '(IDMOTIVO IN (' +sTiposFolha+ '))';

      if (FOpcaoPrevia = 3) and (sListaIdFunc <> '') and (sTiposFolha <> '') then
        FSQL := FSQL + ' AND ';

      if (FOpcaoPrevia in [2,3]) and (sListaIdFunc <> '') then
        if (Pos(',', sListaIdFunc) = 0) then
          FSQL := FSQL + '(IDPESSOA = ' +sListaIdFunc+ ')'
        else
          FSQL := FSQL + '(IDPESSOA IN (' +sListaIdFunc+ '))';
    end;

    ExecSQL('DELETE FROM PREVIAFOLPAG ' + FSQL);
    Result := true;
  except
    on E: Exception do
      MessageInfo := CMTranslate('* Na eliminação da Prévia anterior.') +MSG_ERRO+ E.Message;
  end;
end;

function TCtrlGeraFolPagResc.GerarFolhaRescisao: boolean;
var
  bmMarca: TBookMark;
  _CdsAux: TCMClientDataSet;
  bAchouBase, bBookMark: boolean;
  sValor, sCodRubricaXPess: string;
  dIdRegraCalculo, dValProv, dValBase, dTotDesc: double;
  iSeqRubrica, iIdMotivo, iIdMotivoBase, iTemLanc, QtdParc, QtdOcor,
  iNumRegProcessados: integer;

{-->}procedure SetIdMotivo;
     begin
       if (FFazRescisaoCompl) then
         iIdMotivo := FIdMotivoRescisaoCompl
       else
         iIdMotivo := GetIdMotivoAtual;
{-->}end;
begin
  EnviarMensagem(CMTranslate('Processando Rescisão...'));

  _CdsAux := TCMClientDataSet.Create(nil);
  try
    Result := true;
    FIdPlano := 0;
    dIdRegraCalculo := 0;
    iNumRegProcessados := 1;
    FIdEmpresa := -1;
    try
      while ((FSelTodosNoPeriodo) and not(FCdsFunc.EOF)) or not(FSelTodosNoPeriodo) do
      begin
        SetMesRef;
        FCtrlCalcRub.MesRef := FMesRef;

        // Verificar se há lançamentos na TMPDESC para a(s) pessoa(s) envolvida(s) no processo
        if (FProcLancPrev) then
          FProcTmpDesc := ExisteRegistro_TmpDesc(FCdsFunc.FieldByName('IDPESSOA').asString)
        else
          FProcTmpDesc := false;  

        EnviarMensagem('', GetTempoDecorrido, iNumRegProcessados,
          CMTranslate('Matr: ') +Trim(FCdsFunc.FieldByName('MATRICULA').asString) +
          CMTranslate('  Nome: ') +Trim(FCdsFunc.FieldByName('NOME').asString));

        FIdPessoa := FCdsFunc.FieldByName('IDPESSOA').asInteger;
        dTotDesc := 0;
        FUltValorLiquido := 0;
        FTotalGeral_Prov := 0;
        FTotalGeral_Desc := 0;

        iIdMotivoBase := GetIdMotivoAtual;
        SetIdMotivo;

        // Selecionar dados da Empresa do empregado atual se esta for diferente dos demais
        SelDadosEmpresaAtual;

        // Selecionar dados para a Integração CAP e geração do Arquivo de Pagamento Eletrônico
        SelDadosIntegracaoPessoa;

        FCdsRubEsp.CancelUpdates;

        // Preparar lançamentos pendentes no mes de rescisão
        if not(PrepararLancPendentes) then
          raise Exception.Create(MessageInfo);

        // Geração do Histórico de Rubricas Salariais
        while not(FCdsRubPendente.EOF) do
        begin
          sValor := FCdsRubPendente.FieldByName('VALORRUBRICA').asString;
          if  (sValor = '') then
            FValorRubrica := 0
          else
            FValorRubrica := StrFloat(sValor);

          // Valor deve ser recalculado
          if (Trim(FCdsRubPendente.FieldByName('IDREGRACALCULO').asString) <> '') or
             (Trim(FCdsRubPendente.FieldByName('IDREGRARESCISAO').asString) <> '') then
          begin
            if (Trim(FCdsRubPendente.FieldByName('IDREGRARESCISAO').asString) <> '') then
              dIdRegraCalculo := FCdsRubPendente.FieldByName('IDREGRARESCISAO').asFloat
            else
              dIdRegraCalculo := FCdsRubPendente.FieldByName('IDREGRACALCULO').asFloat;

            dValBase := 0;
            iTemLanc := 1;
            QtdParc := FCdsRubPendente.FieldByName('PARCELAS').asInteger;
            QtdOcor := FCdsRubPendente.FieldByName('NUMOCORRENCIAS').asInteger;
            FCtrlCalcRub.CalcBeneficio(iIdMotivo, FloatToStr(dIdRegraCalculo),
              FCdsRubPendente.FieldByName('IDPESSOA').asString, FValorRubrica, dValBase,
              iTemLanc, QtdParc, QtdOcor, FTotalGeral_Prov, FTotalGeral_Desc);

            if (FValorRubrica <> 0) and not(FCtrlCalcRub.ErroExecucao) then
              sValor := FloatToStr(FValorRubrica)
            else
            begin
              FCdsRubPendente.Next;
              continue;
            end;
          end;

          // Rubricas com cálculo especial (o valor de uma será a referência da outra)
          FReferencia := 'Rescisão';
          CalcEspecialRefRub(FCdsRubPendente.FieldByName('CODRUBCLT').asString, StrFloat(sValor));

          // Selecionar Histórico de Rubricas do Mês
          _CdsAux.Data := ListHistRubSalPessoaMes(
            FCdsRubPendente.FieldByName('IDRUBRICA').asFloat, iIdMotivo,
            FCdsRubPendente.FieldByName('SEQRUBRICAINDIV').asInteger);

          // Se, mesmo após todos os testes, o valor estiver vazio, gravar ZERO
          if (sValor = '') then
            sValor := '0';

          SetIdMotivo;

          // Não existe no Histórico -> primeiro preparo
          if (_CdsAux.RecordCount = 0) and
             (FCdsRubPendente.FieldByName('FLGRESCISAO').asInteger = 1) then
          begin
            sCodRubricaXPess := FCdsRubPendente.FieldByName('CODPROVDESC').asString;

            if (FFazRescisaoCompl) and
               (FCdsRubPendente.FieldByName('FLGDESCONTO').asInteger < 2) then
            begin
              SubtrairRubricaComplementar(FValorRubrica, FDataDeslig,
                FCdsFunc.FieldByName('IDPESSOA').asFloat,
                FCdsRubPendente.FieldByName('IDRUBRICA').asFloat, iIdMotivoBase);
            end;

            if (FValorRubrica <> 0) and
               ((FListaIdRubrica = '') or
                (VerificaCodigoEm(FListaIdRubrica,
                   FCdsRubPendente.FieldByName('IDRUBRICA').asString,',') <> 0)) then
            begin
              if not(GravarRubrica(FCdsRubPendente.FieldByName('IDRUBRICA').asFloat,
                sCodRubricaXPess, iIdMotivo, FMesRef, FMesPagto,
                IFF(FReferencia='', 'Rescisão', FReferencia),
                dIdRegraCalculo, 0, 0, 0, 0, FValorRubrica)) then
              begin
                raise Exception.Create(MessageInfo);
              end;

              // Somar valor ao Total Geral
              SomarTotalGeral(FCdsRubPendente.FieldByName('FLGDESCONTO').asInteger, FValorRubrica);

              if (FIntegra_PagEletronico) then
                SetUltValorLiquido(
                  FCdsRubPendente.FieldByName('CODRUBCLT').asString, FValorRubrica);

              if (FIntegra_CAP) then
                if not(GerarLinhaCAP(
                       FCdsRubPendente.FieldByName('IDRUBRICA').asFloat, FValorRubrica)) then
                  raise Exception.Create(MessageInfo);
            end;
          end
          else
          if (FProcesso = FINAL) then // Já existe no Histórico
          begin
            // Se for 2a. previsão deste mês atualizo o valor
            if (sValor <> _CdsAux.FieldByName('VALORPROVENTO').asString) then
              AlterarValorHstRubSal(iIdMotivo,
                FCdsRubPendente.FieldByName('IDRUBRICA').asFloat, sValor);
          end;
          FCdsRubPendente.Next;
        end;

        SetIdMotivo;

        // Cálculo dos Descontos Previdenciários(FLGATRASODEVOL <> N), Assistenciais e
        // Empréstimos. Tem que ser de algum plano existente
        if (FProcTmpDesc) then
        begin
          FCdsDescFolha.Close;
          FCdsDescFolha.Data := ListDescFolha(FLimDem, 'V');
          ProcDescFolha(iIdMotivo, 0, 'V', dTotDesc, dValBase);
          FCdsDescFolha.Close;
          FCdsDescFolha.Data := ListDescFolha(FLimDem, 'T');
        end;

        // Processamento do que foi preparado em HISTRUBSAL   
        _CdsAux.Data := ListHistoricoPessoaMes(iIdMotivo);

        if (_CdsAux.RecordCount > 0) then
        begin
          while not(_CdsAux.EOF) do
          begin
            dValProv := _CdsAux.FieldByName('VALORPROVENTO').asFloat;

            // Armazenar o Valor Informado
            bAchouBase := (FCdsRubIndiv.Locate('IDPESSOA;IDRUBRICA;SEQRUBRICAINDIV',
                           VarArrayOf([_CdsAux.FieldByName('IDPESSOA').asFloat,
                                       _CdsAux.FieldByName('IDRUBRICA').asFloat,
                                       _CdsAux.FieldByName('SEQRUBRICA').asInteger]), []));

            if (bAchouBase) then
              dValBase := FCdsRubIndiv.FieldByName('VALORRUBRICA').asFloat
            else
              dValBase := 0;

            // Somar valor ao Total Geral
            SomarTotalGeral(_CdsAux.FieldByName('FLGDESCONTO').asInteger, dValProv);

            // Somar esta Rubrica nas Bases que ela Compõe
            SomarRubEspeciais(_CdsAux.FieldByName('IDRUBRICA').asFloat, dValProv, dValBase);

            // Atualizar Número de Ocorrências
            if (bAchouBase) and (FProcesso = FINAL) then
            begin
              if not(SetRubricaIndiv_JaProcessada(iIdMotivo,
                   FCdsRubIndiv.FieldByName('IDRUBRICA').asFloat,
                   FCdsRubIndiv.FieldByName('SEQRUBRICAINDIV').asInteger)) then
              begin
                raise Exception.Create(MessageInfo);
              end;
            end;
            _CdsAux.Next;
          end;
        end;

        // Calcula Valor das Rubricas "Secundárias"
        FCdsRubEsp.First;
        while not(FCdsRubEsp.EOF) do
        begin
          if (FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat <> 0) or
             (FCdsRubEsp.FieldByName('FLGESPECIAL').asInteger = 1) or
             (FCdsRubEsp.FieldByName('FLGCONSTAFOLHA').asInteger = 0) then
          begin
            FCodProvDescFGTS := FCdsRubEsp.FieldByName('CODPROVDESC').asString;
            bAchouBase := false;
            iSeqRubrica := 1;
            FReferencia := 'Rescisão';

            FCdsRubXRub.Filter := 'IDRUBPRINC = '+FCdsRubEsp.FieldByName('IDPROVENTO').asString;
            FCdsRubXRub.First;

            // Calculo dos Descontos Previdenciários(FLGATRASODEVOL = N)
            // Tem que ser de qualquer plano que haja
            if (FProcTmpDesc) then
            begin
              dTotDesc := FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat;

              // Rotina para verificar se esta secundária entra em outras
              if (ProcDescFolha(iIdMotivo, FCdsRubEsp.FieldByName('IDPROVENTO').asFloat,
                  'T', dTotDesc, dValBase)) then
              begin
                if (dTotDesc <> 0) then
                begin
                  bmMarca := FCdsRubEsp.GetBookmark;
                  bBookMark := false;

                  // Arredonda valor da Rubrica
                  dValProv := Round(dTotDesc * 100) / 100;

                  while not(FCdsRubXRub.EOF) and
                       (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90001') do
                  begin
                    if FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
                         VarArrayOf([FCdsRubXRub.FieldByName('IDRUBSECUND').asInteger,
                                     FCdsRubXRub.FieldByName('FLGTIPOFOLHA').asInteger,
                                     FCdsRubXRub.FieldByName('INDPERIODO').asInteger]), []) then
                    begin
                      bBookMark := true;
                      SomarValorRubEspecial(dValProv, dValBase, true);
                    end;
                    FCdsRubXRub.Next;
                  end;

                  if (bBookMark) then
                    FCdsRubEsp.GotoBookmark(bmMarca);
                  FCdsRubEsp.FreeBookmark(bmMarca);
                end;
                FCdsRubEsp.Next;
                continue;
              end;
            end;

            // CLT 90004 -> Anos Completos de Casa (Anuênio)
            if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90004') then
            begin
              FReferencia := IntToStr(Round(Int((FNormalFim -
                FCdsFunc.FieldByName('DATAADMISSAO').asDateTime) / 365.25)));

              // Para a REFER estes anos não são calculados para a Referência mas
              // vêm de uma Tabela Genérica
              if (FTipoCliente = REFER) then
                CalcAnuenioREFER(FCdsFunc.FieldByName('MATRICULA').asString, FReferencia);
            end;

            if (FCdsRubIndiv.Locate('IDPESSOA;IDRUBRICA',
                VarArrayOf([FCdsFunc.FieldByName('IDPESSOA').asFloat,
                            FCdsRubEsp.FieldByName('IDPROVENTO').asFloat]), [])) then
            begin
              while (FCdsRubIndiv.FieldByName('IDPESSOA').asFloat =
                     FCdsFunc.FieldByName('IDPESSOA').asFloat) and
                    (FCdsRubIndiv.FieldByName('IDRUBRICA').asFloat =
                     FCdsRubEsp.FieldByName('IDPROVENTO').asFloat) and
                    not(FCdsRubIndiv.EOF) do
              begin
                if (FCdsRubIndiv.FieldByName('ANOMESINICIO').asString <= FMesRef) then
                begin
                  bAchouBase := true;
                  iSeqRubrica := FCdsRubIndiv.FieldByName('SEQRUBRICAINDIV').asInteger;
                  FIdRegra := FCdsRubIndiv.FieldByName('IDREGRACALCULO').asString;

                  // CLT 90005  -> Não Exibe Referência
                  // Referência -> Número de Ocorrências / Número de Parcelas
                  if (FCdsRubIndiv.FieldByName('FLGPERMANENTE').asInteger = 0) and
                     (FCdsRubIndiv.FieldByName('PARCELAS').asInteger > 1)and
                     (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90005') then
                  begin
                    FReferencia := Trim(IntToStr(
                      FCdsRubIndiv.FieldByName('NUMOCORRENCIAS').asInteger + 1)) + '/' +
                      Trim(FCdsRubIndiv.FieldByName('PARCELAS').asString);
                  end;
                  break;
                end;
                FCdsRubIndiv.Next;
              end;
            end;

            // Calcular só se for especial ou se tiver lançamento em RubricaIndiv
            // Ou se vai entrar nos cálculos de rescisão
            if not(bAchouBase) and (FCdsRubEsp.FieldByName('FLGESPECIAL').asInteger = 0) and
              (FCdsRubEsp.FieldByName('FLGRESCISAO').asInteger = 0) then
            begin
              continue;
            end;
            
            if (FCdsRubEsp.FieldByName('IDREGRA').IsNull) and
               (FCdsRubEsp.FieldByName('IDREGRARESCISAO').IsNull) then
            begin
              dValProv := FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat;
            end
            else
            begin
              dValProv := 0;
              iTemLanc := 0;
              QtdParc := 0;
              QtdOcor := 0;
              if (bAchouBase) then
              begin
                dValProv := FCdsRubIndiv.FieldByName('VALORRUBRICA').asFloat;
                if (dValProv <> 0) then
                begin
                  if (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90005') then
                    FReferencia := FloatToStr(dValProv);

                  if (StringEm(FCdsRubEsp.FieldByName('CODRUBCLT').asString,
                      ['90002','40520','40530','40540']) <> -1) then
                  begin
                    FReferencia := IntToStr(Trunc(dValProv/60)) + 'h:' +
                      IntToStr(Trunc((dValProv/60 - Trunc(dValProv/60))*60)) + 'm';
                  end;
                end;
                iTemLanc := 1;
                QtdParc := FCdsRubIndiv.FieldByName('PARCELAS').asInteger;
                QtdOcor := FCdsRubIndiv.FieldByName('NUMOCORRENCIAS').asInteger;
              end;

              FIdRegra := FCdsRubEsp.FieldByName('IDREGRA').asString;
              if not(FCdsRubEsp.FieldByName('IDREGRARESCISAO').IsNull) then
                FIdRegra := FCdsRubEsp.FieldByName('IDREGRARESCISAO').asString;

              dValBase := FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat;

              FCtrlCalcRub.CalcBeneficio(iIdMotivo, FIdRegra, FloatToStr(FIdPessoa), dValProv,
                dValBase, iTemLanc, QtdParc, QtdOcor, FTotalGeral_Prov, FTotalGeral_Desc);
            end;

            // Gravar o valor em HISTRUBSAL
            if ((dValProv <> 0) or (bAchouBase)) and (FCdsRubEsp.FieldByName('FLGRESCISAO').asInteger = 1) then
            begin

              iIdMotivo := GetIdMotivoAtual;
              iIdMotivoBase := iIdMotivo;

              if (dValProv <> 0) then
              begin
                // CLT 90030 -> Desconto Ferias Automatico (Devolução de Férias)
                // Referência = Diferença em meses entre a última férias e o mês de referência
                // da geração "/" Quantidade de Parcelas de Devolução das Férias
                if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90030') then
                  FReferencia := IntToStr(DifDataAnoMes(FMesRef, RetornaAnoMes(
                    StrToDate(FCtrlCalcRub.sDataFer2)))) +'/'+ IntToStr(FCtrlCalcRub.QtdParcFer);

                // Arredondar valor
                dValProv := Round(dValProv * 100) / 100;

                // Rubricas com cálculo especial (o valor de uma será a referência da outra)
                CalcEspecialRefRub(FCdsRubEsp.FieldByName('CODRUBCLT').asString, dValProv);

                if (FFazRescisaoCompl) then
                begin
                  iIdMotivo := FIdMotivoRescisaoCompl;
                  _CdsAux.Data := ListFlgDescontoRubPrinc(FCdsRubEsp.FieldByName('IDPROVENTO').asFloat);

                  // 50025 -> valor do inss
                  // 50026 -> valor do irrf
                  if (FCdsRubEsp.FieldByName('FLGDESCONTO').asInteger < 2) and
                     (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '50025') and
                     (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '50026') and
                     ((_CdsAux.IsEmpty) or (_CdsAux.FieldByName('FLGDESCONTO').asInteger = 2)) then
                  begin
                    SubtrairRubricaComplementar(dValProv, FDataDeslig,
                      FCdsFunc.FieldByName('IDPESSOA').asFloat,
                      FCdsRubEsp.FieldByName('IDPROVENTO').asFloat, iIdMotivoBase);
                  end;
                end;

                // Gravar a Rubrica no Histórico
                if (dValProv <> 0) and
                   ((FListaIdRubrica = '') or
                    (VerificaCodigoEm(FListaIdRubrica,
                       FCdsRubEsp.FieldByName('IDPROVENTO').asString,',') <> 0)) then
                begin
                  if not(GravarRubrica(FCdsRubEsp.FieldByName('IDPROVENTO').asFloat,
                    FCodProvDescFGTS, iIdMotivo, FMesRef, FMesPagto,
                    IFF(FReferencia='', 'Rescisão', FReferencia), StrFloat(FIdRegra),
                    0, 0, 0, 0, dValProv)) then
                  begin
                    raise Exception.Create(MessageInfo);
                  end;

                  // Somar valor ao Total Geral
                  SomarTotalGeral(FCdsRubEsp.FieldByName('FLGDESCONTO').asInteger, dValProv);

                  if (FIntegra_PagEletronico) then
                    SetUltValorLiquido(
                      FCdsRubEsp.FieldByName('CODRUBCLT').asString, dValProv);

                  if (FIntegra_CAP) then
                    if not(GerarLinhaCAP(
                           FCdsRubEsp.FieldByName('IDPROVENTO').asFloat, dValProv)) then
                      raise Exception.Create(MessageInfo);
                end;
              end;

              // Atualizar Número de Ocorrências
              if (bAchouBase) and (FProcesso = FINAL) then
              begin
                if not(SetRubricaIndiv_JaProcessada(iIdMotivo,
                       FCdsRubIndiv.FieldByName('IDRUBRICA').asFloat, iSeqRubrica)) then
                begin
                  raise Exception.Create(MessageInfo);
                end;
              end;
            end;

            if (dValProv <> 0) then
            begin
              // Rotina para verificar se esta secundária entra em outras
              bmMarca := FCdsRubEsp.GetBookmark;
              bBookMark := false;

              while not(FCdsRubXRub.EOF) and
                   (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90001') do
              begin
                if (FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
                    VarArrayOf([FCdsRubXRub.FieldByName('IDRUBSECUND').asFloat,
                                FCdsRubXRub.FieldByName('FLGTIPOFOLHA').asInteger,
                                FCdsRubXRub.FieldByName('INDPERIODO').asInteger]), [])) then
                begin
                  bBookMark := true;
                  SomarValorRubEspecial(dValProv,
                    FCdsRubIndiv.FieldByName('VALORRUBRICA').asFloat, bAchouBase);
                end;
                FCdsRubXRub.Next;
              end;

              if (bBookMark) then
                FCdsRubEsp.GotoBookmark(bmMarca);
            end;
          end;
          FCdsRubEsp.Next;
        end;

        // adicionar contaliquido na query apenas para forma de pagto eletronico
        if (FIntegra_PagEletronico) then
          SetDadosPagEletronico;

        Inc(iNumRegProcessados);
        EnviarMensagem('', GetTempoDecorrido, 0, '', 0, 1);

        if (FSelTodosNoPeriodo) then
          FCdsFunc.Next
        else
          break;
      end;

      // Gravar CAP
      FNumDocGerados := '';
      if (FIntegra_CAP) then
        if not(GerarIntegracaoCAP) then
          raise Exception.Create(MessageInfo);

      // Gravar no Banco o Pagamento Eletrônico
      if (FIntegra_PagEletronico) then
        if not(GerarPagEletronico) then
          raise Exception.Create(MessageInfo);
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlGeraFolPagResc.Processar(const IAppCliente: OleVariant; TipoCliente: integer;
  TipoEmpresa: string; SelTodosNoPeriodo: boolean; DataInicial, DataFinal: TDateTime;
  ListaTipoContrato: string; IdUsuario: integer; NormalIni, NormalFim: TDateTime;
  Processo, OpcaoPrevia, TipoSelMotivo, IdMotivo: integer; FazRescisaoCompl: boolean;
  IdMotivoRescisaoCompl: integer; ListaIdRubrica: string; Integra_PagEletronico,
  Integra_CAP: boolean; DataEmissao, DataPagamento: TDateTime; CriarDocIndividual: boolean;
  RateioCC, ObrigaAbc, ObrigaCRespon: boolean; CodTipDoc, CodPortForma: integer;
  ListaTipoDesemb, DiretorioArqPag, ContaPadrao_Favorecido: string;
  IdPlano_ContaPadrao_Favorecido: integer; UsaPlanoPatro: boolean; PlanoPrevGlobal,
  PatroGlobal: integer; ProcLancPrev, UsaLOG: boolean): boolean;
var
  bTransacaoAberta: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ProcessarRescisaoContrato(IAppCliente, FCdsPessoa.Data,
      FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, TipoCliente, FIdEmpresa, TipoEmpresa,
      FIdHotel, SelTodosNoPeriodo, DataInicial, DataFinal, ListaTipoContrato, IdUsuario,
      NormalIni, NormalFim, Processo, OpcaoPrevia, TipoSelMotivo, IdMotivo, FazRescisaoCompl,
      IdMotivoRescisaoCompl, ListaIdRubrica, Integra_PagEletronico, Integra_CAP, DataEmissao,
      DataPagamento, CriarDocIndividual, RateioCC, ObrigaAbc, ObrigaCRespon, CodTipDoc,
      CodPortForma, ListaTipoDesemb, DiretorioArqPag, ContaPadrao_Favorecido,
      IdPlano_ContaPadrao_Favorecido, UsaPlanoPatro, PlanoPrevGlobal,
      PatroGlobal, ProcLancPrev, UsaLOG, FLOG);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := false;
    bTransacaoAberta := false;
    MessageInfo := '';

    FHoraInicial := Time;
    try
      // Atribuir variáveis
      FGeracaoFolhaNormal := false;
      FIAppCliente := IAppCliente;
      FIntegra_CAP := Integra_CAP;
      FIntegra_PagEletronico := Integra_PagEletronico;
      FTipoCliente := TipoCliente;
      FTipoEmpresa := TipoEmpresa;
      FDataInicial := DataInicial;
      FDataFinal := DataFinal;
      FListaTipoContrato := ListaTipoContrato;
      FDataPagamento := DataPagamento;
      FDataProcessamento := DataPagamento;
      FDataEmissao := DataEmissao;
      FRateioCC := RateioCC;
      FSelTodosNoPeriodo := SelTodosNoPeriodo;
      FProcesso := Processo;
      FOpcaoPrevia := OpcaoPrevia;
      FFazRescisaoCompl := FazRescisaoCompl;
      FTipoSelMotivo := TipoSelMotivo;
      FIdMotivo := IdMotivo;
      FIdMotivoRescisaoCompl := IdMotivoRescisaoCompl;
      FListaIdRubrica := ListaIdRubrica;
      FCodPortForma := CodPortForma;
      FListaTipoDesemb := ListaTipoDesemb;
      FUsaPlanoPatro := UsaPlanoPatro;
      FPatroGlobal := PatroGlobal;
      FPlanoPrevGlobal := PlanoPrevGlobal;
      FDiretorioArqPag := DiretorioArqPag;
      FNormalIni := NormalIni;
      FNormalFim := NormalFim;
      FProcLancPrev := (ProcLancPrev) and (FTipoEmpresa = 'P');
      FContaPadrao_Favorecido := ContaPadrao_Favorecido;
      FIdPlano_ContaPadrao_Favorecido := IdPlano_ContaPadrao_Favorecido;

      FCriarDocIndividual := CriarDocIndividual;

      // Criação dos objetos de armazenamento
      if not(CriarObjetos_Geracao) then
        raise Exception.Create(MessageInfo);

      FCtrlIntegraCAPCAR_RH.CdsDocumentos := FCdsDocumentos;
      FCtrlIntegraCAPCAR_RH.ObrigaAbc := ObrigaAbc;
      FCtrlIntegraCAPCAR_RH.ObrigaCRespon := ObrigaCRespon;
      FCtrlIntegraCAPCAR_RH.IdEmpresa := FIdEmpresa;
      FCtrlIntegraCAPCAR_RH.IdModulo := MODFOL;
      FCtrlIntegraCAPCAR_RH.IdUsuario := IdUsuario;
      FCtrlIntegraCAPCAR_RH.CodTipDoc := CodTipDoc;

      if (UsaLOG) then
        FCtrlCalcRub.LOG := '';

      FCtrlCalcRub.IdEmpresa := FIdEmpresa;
      FCtrlCalcRub.TipoEmpresa := TipoEmpresa;
      FCtrlCalcRub.MostrarPassosExecucao := false;
      FCtrlCalcRub.UsaLOG := UsaLOG;
      FCtrlCalcRub.IniFormaCalc(GERACAO_RESCISAO);

      EnviarMensagem(CMTranslate('Iniciando Processo...'));

      // Montar SQLs
      FCdsRubIndiv.Data := ListRubricaIndiv;

      FCdsRubXRub.Filter := '';
      FCdsRubXRub.Data := ListRubXRub;
      FCdsRubXRub.Filtered := true;

      EnviarMensagem('', GetTempoDecorrido);

      if not(Init_Integracao) or not(AbrirSQLFunc) then
        raise Exception.Create(MessageInfo);

      EnviarMensagem('', GetTempoDecorrido);

      // Verificar se há lançamentos na TMPDESC para a(s) pessoa(s) envolvida(s) no processo
      FCdsFunc.First;

      // Início da Transação
      StartTransaction;
      bTransacaoAberta := true;

      if (FProcesso = PREVIA) then
      begin
        FNomeTabela := 'PREVIAFOLPAG';
        if (OpcaoPrevia < 4) then
          if (ApagarPrevia) then
            EnviarMensagem('', GetTempoDecorrido)
          else
            raise Exception.Create(MessageInfo);
      end
      else
        FNomeTabela := 'HISTRUBSAL';

      FCtrlCalcRub.NomeTabela := FNomeTabela;

      if (PrepararRubEspeciais) then
        EnviarMensagem('', GetTempoDecorrido)
      else
        raise Exception.Create(MessageInfo);

      if not(GerarFolhaRescisao) then
        raise Exception.Create(MessageInfo);

      Commit;

      MessageInfo := CMTranslate('Geração da Rescisão efetuada com sucesso.');

      if (FNumDocGerados <> '') then
        MessageInfo := MessageInfo +CR_LF+CR_LF+
          Replicate('*',40) +CR_LF+
          CMTranslate('AP(s) gerada(s):') +CR_LF+CR_LF+
          FNumDocGerados;

      FCtrlCalcRub.FinishFormaCalc;
      Result := true;
    except
      on E: Exception do
      begin
        if (bTransacaoAberta) then
          Rollback;

        if (FTipoRetorno = RETORNO_AVISO) then
          MessageInfo := CMTranslate('A Geração da Rescisão foi interrompida devido a uma inconsistência nos dados.') +
            CR_LF+CR_LF+ MessageInfo
        else
          MessageInfo := CMTranslate('Ocorreu um erro na Geração da Rescisão.') +
            CR_LF+CR_LF+ MessageInfo;
      end;
    end;
    // Destruição dos objetos de armazenamento
    DestruirObjetos_Geracao;

    if (UsaLOG) then
      FLOG := FCtrlCalcRub.LOG;
  end;
end;

end.
