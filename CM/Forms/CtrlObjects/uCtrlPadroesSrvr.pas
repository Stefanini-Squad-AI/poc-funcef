{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
Nº SIG......: 22093
Data........: 22/08/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Criar campo para NIF no Consulta geral de pessoas e na tela elegível participante
Alterações..: Alteração na Function GetDadosPessoa - Inclusão de campo novo PAIS
--------------------------------------------------------------------------------------------------
Rotina......: GetDadosPessoa
Nº SOL......: 138283
Nº KINTANA..: 840489
Data........: 30/06/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Rotina GetDadosPessoa para se adequar a chamada na Ctrl uCtrlPessoa.
-------------------------------------------------------------------------------------------------- }
unit uCtrlPadroesSrvr;

interface

Uses uCtrlPadroes, uCmControlObject, classes, Sysutils, Provider, uDbLogopcao,
     uDbHistsenha, uCtrlMensagemCM;

Type
  TCtrlPadroesSrvr = class(TCmControlObject)

  protected
    procedure AfterInitialize; Override;
  private
    _Padroes: TCtrlPadroes;
    _MensagemCM: TCtrlMensagemCM;
  public
    Constructor Create; Override;
    Destructor Destroy; Override;

    function GetDataPacket(const sSql: WideString): OleVariant;
    function GetDataPacketTS(lSQL: OleVariant): OleVariant;
    function ExecSqlAndCommit(const sSql: WideString): WordBool;
    function GetContentFile(const sFileName: WideString): WideString;
    function GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
      TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
      ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
      ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
//Vinicius Maciel SOL138283 Kintana 840489
      ovTipoDocumento,
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
      ovNaturalidade, ovBanco, ovDocumento,
      ovTipoDoc{Início Michelle Mota SIG 22093}, ovPais{Término Michelle Mota SIG 22093}: OleVariant): WordBool;
    function GravaHistSenha(aCdsHistSenha: OleVariant): WordBool;
    function GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario: Double;
      const sDescOperacao: WideString): WordBool;
    function ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage,
      IdMensagem: Integer): WordBool;
    function ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc: OleVariant): WordBool;
    function ProcessaPessoaBanco(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc: OleVariant): WordBool;
    function ProcessaPessoaCliente(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli, CdsImAgregCli,
      CdsTiposCli: OleVariant): WordBool;
    function ProcessaPessoaForne(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn, CdsFornXDesemb,
      CdsFornXRamo: OleVariant): WordBool;
    function SelDadosCli(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
      ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
      ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool;
    function SelDadosForne(rIdEmpresa, rIdForCli: Double; out ovSubTipo,
      ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
      ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;

    function ProcessaWorkFlow( ovWorkflowusuario, ovWorkflow, ovPassoworkflow: OleVariant; Operacao: Integer): Boolean;
    function ProcessaGrupoUsu(OvDataviewAcesso, OvTabelaAcesso,
                   OvColunaAcesso, OvGrupo, OvUsuario, OvPessoa, OvGrupoXUsu,
                   OvAutoriza, OvAutorizaRpt, OvAutorizaMs: OleVariant; OperacaoProcessa: Integer): Boolean;
    function GravarReports( ovCds: OleVariant ): Boolean;
    function ProcurarReports( IdReports, OrigemCm: Integer): Boolean;
    function ProcessaConfig(ovCds, ovCdsReport: OleVariant; Operacao: Integer): Boolean;
    function ProcessaConfigModelo(ovReports: OleVariant): Boolean;
  End;

implementation

Uses uCtrlPessoaCliente, uCtrlPessoaAgencia, uCtrlPessoaBanco, uCtrlPessoaForne,
     uCtrlPessoa, uDataBase, uCMTypes, JclFileUtils, uCMFileUtils, uMidasUtil, DbClient,
     uCtrlWorkFlow, uCtrlGrupoUsu, uCtrlReportsRelCM, uCtrlConfigRelatorio, uCtrlConfigreportscm;

{ TCtrlPadroesSrvr }

procedure TCtrlPadroesSrvr.AfterInitialize;
begin
  inherited;
  _Padroes.InitializeAs(Self);
  _MensagemCM.InitializeAs(Self);
end;

constructor TCtrlPadroesSrvr.Create;
begin
  inherited;
  _Padroes := TCtrlPadroes.Create;
  _MensagemCM := TCtrlMensagemCM.Create;
end;

destructor TCtrlPadroesSrvr.Destroy;
begin
  _MensagemCM.Free;
  _Padroes.Free;
  inherited;
end;

function TCtrlPadroesSrvr.GravaLogOperacoes(dIdPessoa, dIdModulo,
  dIdUsuario: Double; const sDescOperacao: WideString): WordBool;
begin
  Try
    Result := _Padroes.GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario, sDescOperacao);
    If Not Result Then MessageInfo := _Padroes.MessageInfo;
  Except
    On E:Exception Do
    Begin
       Result := False;
       MessageInfo := E.Message;
    End;
  End;
end;

function TCtrlPadroesSrvr.ProcessaPessoaAgencia(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoaAgencia;
begin
    Pessoa := TCtrlPessoaAgencia.Create;
    Try
       Pessoa.InitializeAs(Self);

       Pessoa.CdsContatopess.Data := CdsContatoPess;
       Pessoa.CdsDocpessoa.Data := CdsDocPessoa;
       Pessoa.CdsEndpess.Data := CdsEndPess;
       Pessoa.CdsImagensPessoa.Data := CdsImagensPessoa;
       Pessoa.CdsImagensDOC.Data := CdsImagensDoc;
       Pessoa.CdsPessoa.Data := CdsPessoa;
       Pessoa.CdsPessoafisica.Data := CdsPessoaFisica;
       Pessoa.CdsTelcontato.Data := CdsTelContato;
       Pessoa.CdsTelendpess.Data := CdsTelEndPess;
       Pessoa.CdsContaBancaria.Data := CdsContaBancaria;
       Pessoa.CdsSubTipo.Data := CdsSubTipo;

       Result := Pessoa.ProcessaPessoa(TOperacao(Operacao));
       Pessoa.Free;
    Except
       On E:Exception Do
       Begin
         Result := False;
         MessageInfo := E.Message;
         Pessoa.Free;
       End;
    End;
end;

function TCtrlPadroesSrvr.ProcessaPessoaBanco(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoaBanco;
begin
    Pessoa := TCtrlPessoaBanco.Create;
    Try
       Pessoa.InitializeAs(Self);

       Pessoa.CdsContatopess.Data := CdsContatoPess;
       Pessoa.CdsDocpessoa.Data := CdsDocPessoa;
       Pessoa.CdsEndpess.Data := CdsEndPess;
       Pessoa.CdsImagensPessoa.Data := CdsImagensPessoa;
       Pessoa.CdsImagensDOC.Data := CdsImagensDoc;
       Pessoa.CdsPessoa.Data := CdsPessoa;
       Pessoa.CdsPessoafisica.Data := CdsPessoaFisica;
       Pessoa.CdsTelcontato.Data := CdsTelContato;
       Pessoa.CdsTelendpess.Data := CdsTelEndPess;
       Pessoa.CdsContaBancaria.Data := CdsContaBancaria;
       Pessoa.CdsSubTipo.Data := CdsSubTipo;

       Result := Pessoa.ProcessaPessoa(TOperacao(Operacao));
       Pessoa.Free;
    Except
       On E:Exception Do
       Begin
         Result := False;
         MessageInfo := E.Message;
         Pessoa.Free;
       End;
    End;
end;

function TCtrlPadroesSrvr.ProcessaPessoaCliente(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli,
  CdsImAgregCli, CdsTiposCli: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoaCliente;
begin
    Pessoa := TCtrlPessoaCliente.Create;
    Try
       Pessoa.InitializeAs(Self);

       Pessoa.CdsEmpresaCliente.Data := CdsEmpresaCliente;
       Pessoa.CdsTipoRecebCli.Data := CdsTipoRecebCli;
       Pessoa.CdsImAgregCli.Data := CdsImAgregCli;
       Pessoa.CdsTiposCli.Data := CdsTiposCli;

       Pessoa.CdsContatopess.Data := CdsContatoPess;
       Pessoa.CdsDocpessoa.Data := CdsDocPessoa;
       Pessoa.CdsEndpess.Data := CdsEndPess;
       Pessoa.CdsImagensPessoa.Data := CdsImagensPessoa;
       Pessoa.CdsImagensDOC.Data := CdsImagensDoc;
       Pessoa.CdsPessoa.Data := CdsPessoa;
       Pessoa.CdsPessoafisica.Data := CdsPessoaFisica;
       Pessoa.CdsTelcontato.Data := CdsTelContato;
       Pessoa.CdsTelendpess.Data := CdsTelEndPess;
       Pessoa.CdsContaBancaria.Data := CdsContaBancaria;
       Pessoa.CdsSubTipo.Data := CdsSubTipo;

       Result := Pessoa.ProcessaPessoa(TOperacao(Operacao));
       Pessoa.Free;
    Except
       On E:Exception Do
       Begin
         Result := False;
         MessageInfo := E.Message;
         Pessoa.Free;
       End;
    End;
end;

function TCtrlPadroesSrvr.ProcessaPessoaForne(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn,
  CdsFornXDesemb, CdsFornXRamo: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoaForne;
begin
    Pessoa := TCtrlPessoaForne.Create;
    Try
       Pessoa.InitializeAs(Self);

       Pessoa.CdsImAgregForn.Data := CdsImAgregForn;
       Pessoa.CdsEmpresaForn.Data := CdsEmpresaForn;
       Pessoa.CdsFornXDesemb.Data := CdsFornXDesemb;
       Pessoa.CdsFornXRamo.Data := CdsFornXRamo;
       Pessoa.CdsContatopess.Data := CdsContatoPess;
       Pessoa.CdsDocpessoa.Data := CdsDocPessoa;
       Pessoa.CdsEndpess.Data := CdsEndPess;
       Pessoa.CdsImagensPessoa.Data := CdsImagensPessoa;
       Pessoa.CdsImagensDOC.Data := CdsImagensDoc;
       Pessoa.CdsPessoa.Data := CdsPessoa;
       Pessoa.CdsPessoafisica.Data := CdsPessoaFisica;
       Pessoa.CdsTelcontato.Data := CdsTelContato;
       Pessoa.CdsTelendpess.Data := CdsTelEndPess;
       Pessoa.CdsContaBancaria.Data := CdsContaBancaria;
       Pessoa.CdsSubTipo.Data := CdsSubTipo;

       Result := Pessoa.ProcessaPessoa(TOperacao(Operacao));
       Pessoa.Free;
    Except
       On E:Exception Do
       Begin
         Result := False;
         MessageInfo := E.Message;
         Pessoa.Free;
       End;
    End;
end;

function TCtrlPadroesSrvr.ExecSqlAndCommit(
  const sSql: WideString): WordBool;
begin
  Try
    Result := _Padroes.ExecSqlAndCommit(sSql);
    If Not Result Then MessageInfo := _Padroes.MessageInfo;
  Except
    On E:Exception Do
    Begin
       Result := False;
       MessageInfo := E.Message;
    End;
  End;
end;

function TCtrlPadroesSrvr.ProcessaMensagem(CdsMensagem: OleVariant;
  iOperacaoMensage, IdMensagem: Integer): WordBool;
begin
  Try
    _MensagemCM.CdsMensagem.Data := CdsMensagem;
    Result := _MensagemCM.ProcessaMensagem(TOperacaoMensagem(iOperacaoMensage),IdMensagem);
    If Not Result Then MessageInfo := _MensagemCM.MessageInfo;
  Except
    On E:Exception Do
    Begin
       Result := False;
       MessageInfo := E.Message;
    End;
  End;
end;

function TCtrlPadroesSrvr.GravaHistSenha(
  aCdsHistSenha: OleVariant): WordBool;
begin
    Try
      Result := _Padroes.GravaHistoricodeSenha(aCdsHistSenha);
      If Not Result Then MessageInfo := _Padroes.MessageInfo;
    Except
      On E:Exception Do
      Begin
         Result := False;
         MessageInfo := E.Message;
      End;
    End;
end;

function TCtrlPadroesSrvr.GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
  TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
  ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
  ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
//Vinicius Maciel SOL138283 Kintana 840489
  ovTipoDocumento,
//Vinicius Maciel SOL138283 Kintana 840489 - Fim
  ovNaturalidade, ovBanco, ovDocumento,
  ovTipoDoc{Início Michelle Mota SIG 22093}, ovPais{Término Michelle Mota SIG 22093}: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoa;
begin
    Pessoa := TCtrlPessoa.Create;
    Try
       Pessoa.InitializeAs(Self);

       Result :=  Pessoa.GetDadosPessoa(rIdPessoa, TTipoGetPessoa(TipoGetPessoa), TTipoPessoa(TipoPessoa));

       If Result Then
          Pessoa.CdsDadosToOleVariant(ovPessoa, ovPessoaFisica, ovDocPessoa, ovEndPess,
                                      ovTelEndPess, ovContatoPess, ovTelContato, ovContaBancaria,
                                      ovImagensPessoa, ovImagensDoc, ovEstado,
//Vinicius Maciel SOL138283 Kintana 840489
                                      ovTipoDocumento,
//Vinicius Maciel SOL138283 Kintana 840489 - Fim

                                      ovNaturalidade,
                                      ovBanco, ovDocumento, ovTipoDoc{Início Michelle Mota SIG 22093}, ovPais{Término Michelle Mota SIG 22093})
       Else
         Raise Exception.Create(MessageInfo);

       Pessoa.Free;
    Except
       On E:Exception Do
       Begin
         Result := False;
         MessageInfo := E.Message;
         Pessoa.Free;
       End;
    End;
end;

function TCtrlPadroesSrvr.SelDadosCli(rIdEmpresa, rIdForcli: Double;
  out ovSubTipo, ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
  ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoaCliente;
  aCdsSubTipo, aCdsEmpresaCliente, aCdsTipoReceb, aCdsTipoRecebCli, aCdsImAgreg,
  aCdsImAgregCli, aCdsTipos, aCdsTiposCli: TClientDataSet;
begin
    Pessoa := TCtrlPessoaCliente.Create;
    
    aCdsSubTipo := TClientDataSet.Create(nil);
    aCdsEmpresaCliente := TClientDataSet.Create(nil);
    aCdsTipoReceb := TClientDataSet.Create(nil);
    aCdsTipoRecebCli := TClientDataSet.Create(nil);
    aCdsImAgreg := TClientDataSet.Create(nil);
    aCdsImAgregCli := TClientDataSet.Create(nil);
    aCdsTipos := TClientDataSet.Create(nil);
    aCdsTiposCli := TClientDataSet.Create(nil);

    Try
       Pessoa.InitializeAs(Self);

       Result :=  Pessoa.SelDadosCliente(rIdEmpresa, rIdForcli, aCdsSubTipo, aCdsEmpresaCliente,
                  aCdsTipoReceb, aCdsTipoRecebCli, aCdsImAgreg, aCdsImAgregCli, aCdsTipos, aCdsTiposCli);

       If Result Then
       Begin
          ovSubTipo := aCdsSubTipo.Data;
          ovEmpresaCliente := aCdsEmpresaCliente.Data;
          ovTipoReceb := aCdsTipoReceb.Data;
          ovTipoRecebCli := aCdsTipoRecebCli.Data;
          ovImAgreg := aCdsImAgreg.Data;
          ovImAgregCli := aCdsImAgregCli.Data;
          ovTipos := aCdsTipos.Data;
          ovTiposCli := aCdsTiposCli.Data;
       End
       Else
         Raise Exception.Create(MessageInfo);

       Pessoa.Free;

       FreeCds([aCdsSubTipo, aCdsEmpresaCliente, aCdsTipoReceb, aCdsTipoRecebCli, aCdsImAgreg,
                aCdsImAgregCli, aCdsTipos, aCdsTiposCli]);
    Except
       On E:Exception Do
       Begin
         Result := False;
         MessageInfo := E.Message;

         Pessoa.Free;
         FreeCds([aCdsSubTipo, aCdsEmpresaCliente, aCdsTipoReceb, aCdsTipoRecebCli, aCdsImAgreg,
                  aCdsImAgregCli, aCdsTipos, aCdsTiposCli]);
       End;
    End;
end;

function TCtrlPadroesSrvr.SelDadosForne(rIdEmpresa, rIdForCli: Double;
  out ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
  ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoaForne;
  aCdsSubTipo, aCdsEmpresaForne, aCdsTipoDesemb, aCdsImAgreg, aCdsRamoForne, aCdsTipoDesembForn,
  aCdsImAgregForn, aCdsRamoXForne, aCdsProcesos, aCdsProcessoXInidcativoSusp: TClientDataSet;
begin
    Pessoa := TCtrlPessoaForne.Create;
    aCdsSubTipo := TClientDataSet.Create(nil);
    aCdsEmpresaForne := TClientDataSet.Create(nil);
    aCdsTipoDesemb := TClientDataSet.Create(nil);
    aCdsImAgreg := TClientDataSet.Create(nil);
    aCdsRamoForne := TClientDataSet.Create(nil);
    aCdsTipoDesembForn := TClientDataSet.Create(nil);
    aCdsImAgregForn := TClientDataSet.Create(nil);
    aCdsRamoXForne := TClientDataSet.Create(nil);
    aCdsProcesos := TClientDataSet.Create(nil);
    aCdsProcessoXInidcativoSusp := TClientDataSet.Create(nil);

    Try
       Pessoa.InitializeAs(Self);

       Result :=  Pessoa.SelDadosForne(rIdEmpresa, rIdForCli, aCdsSubTipo, aCdsEmpresaForne,
       aCdsTipoDesemb, aCdsImAgreg, aCdsRamoForne, aCdsTipoDesembForn, aCdsImAgregForn, aCdsRamoXForne);

       If Result Then
       Begin
         ovSubTipo := aCdsSubTipo.Data;
         ovEmpresaForne := aCdsEmpresaForne.Data;
         ovTipoDesemb := aCdsTipoDesemb.Data;
         ovImAgreg := aCdsImAgreg.Data;
         ovRamoForne := aCdsRamoForne.Data;
         ovTipoDesembForn := aCdsTipoDesembForn.Data;
         ovImAgregForn := aCdsImAgregForn.Data;
         ovRamoXForne := aCdsRamoXForne.Data;
       End
       Else
         Raise Exception.Create(MessageInfo);

       Pessoa.Free;
       FreeCds([ aCdsSubTipo, aCdsEmpresaForne, aCdsTipoDesemb, aCdsImAgreg, aCdsRamoForne, aCdsTipoDesembForn,
                 aCdsImAgregForn, aCdsRamoXForne]);
    Except
       On E:Exception Do
       Begin
         Result := False;
         MessageInfo := E.Message;
         Pessoa.Free;
         FreeCds([ aCdsSubTipo, aCdsEmpresaForne, aCdsTipoDesemb, aCdsImAgreg, aCdsRamoForne, aCdsTipoDesembForn,
                   aCdsImAgregForn, aCdsRamoXForne]);
       End;
    End;
end;

function TCtrlPadroesSrvr.GetDataPacketTS(lSQL: OleVariant): OleVariant;
Var
  lAuxSql: TStrings;
begin
  lAuxSql := TStringList.Create;
  Try
    VariantToStringList( lSQL, lAuxSql );
    Result := _Padroes.GetDataPacket( lAuxSql );
    lAuxSql.Free;
  Except
    Result := null;
    lAuxSql.Free;
    MessageInfo := _Padroes.MessageInfo;
  End;
end;

function TCtrlPadroesSrvr.GetContentFile(
  const sFileName: WideString): WideString;
Var
  lFile: TextFile;
  sContent: String;
  lAuxSql: TStrings;
begin
  lAuxSql := TStringList.Create;
  Try
    {$I-}
    If FileExists(sFileName) Then
    Begin
       AssignFile(lFile, sFileName);
       reset(lFile);
       While Not Eof(lFile) Do
       Begin
          Readln(lFile, sContent);
          lAuxSql.Add(sContent);
       End;
       CloseFile(lFile);
    End;

    If Trim(lAuxSql.Text) = '' Then
      Abort
    Else
      Result := lAuxSql.Text;

    lAuxSql.Free;
  Except
    On E:Exception Do
    Begin
      lAuxSql.Clear;
      lAuxSql.Add('EMPTY');
      If FileExists(sFileName) Then CloseFile(lFile);
      {$I+}
      Result := lAuxSql.Text;
      lAuxSql.Free;
    End;
  End;
end;

function TCtrlPadroesSrvr.GetDataPacket(
  const sSql: WideString): OleVariant;
begin
  Try
    Result := _Padroes.GetDataPacket(sSql);
  Except
    On E:Exception Do
    Begin
       MessageInfo := E.Message + _Padroes.MessageInfo;
       Result := null;
    End;
  End;
end;


function TCtrlPadroesSrvr.ProcessaWorkFlow(ovWorkflowusuario, ovWorkflow,
  ovPassoworkflow: OleVariant; Operacao: Integer): Boolean;
Var
  WorkFlow: TCtrlWorkFlow;
begin
  WorkFlow := TCtrlWorkFlow.Create;
  Try
     WorkFlow.InitializeAs(Self);
     WorkFlow.CdsPassoworkflow.Data := ovPassoworkflow;
     WorkFlow.CdsWorkflow.Data := ovWorkflow;
     WorkFlow.CdsWorkflowusuario.Data := ovWorkflowusuario;

     Result := WorkFlow.ProcessaWorkFlow(TOperacao(Operacao));

     If Not Result Then Raise Exception.Create(WorkFlow.MessageInfo);
  Except
     On E:Exception Do
     Begin
       Result := False;
       MessageInfo := E.Message;
     End;
  End;
  WorkFlow.Free;
end;

function TCtrlPadroesSrvr.ProcessaGrupoUsu(OvDataviewAcesso,
  OvTabelaAcesso, OvColunaAcesso, OvGrupo, OvUsuario, OvPessoa,
  OvGrupoXUsu, OvAutoriza, OvAutorizaRpt, OvAutorizaMs: OleVariant;
  OperacaoProcessa: Integer): Boolean;
Var
  GrupoUsu: TCtrlGrupoUsu;
begin
  GrupoUsu := TCtrlGrupoUsu.Create;
  Try
     GrupoUsu.InitializeAs(Self);
     Result := GrupoUsu.ProcessaGrupoUsu(OvDataviewAcesso,
               OvTabelaAcesso, OvColunaAcesso, OvGrupo, OvUsuario, OvPessoa,
               OvGrupoXUsu, OvAutoriza, OvAutorizaRpt, OvAutorizaMs,
               TOperacaoProcessa(OperacaoProcessa));

     If Not Result Then Raise Exception.Create(GrupoUsu.MessageInfo);
  Except
     On E:Exception Do
     Begin
       Result := False;
       MessageInfo := E.Message;
     End;
  End;
  GrupoUsu.Free;
end;

function TCtrlPadroesSrvr.GravarReports(ovCds: OleVariant): Boolean;
Var
  ReportsRelCM: TCtrlReportsRelCM;
begin
  ReportsRelCM := TCtrlReportsRelCM.Create;
  Try
     ReportsRelCM.InitializeAs(Self);
     ReportsRelCM.cds.Data := ovCds;

     Result := ReportsRelCM.Gravar;

     If Not Result Then Raise Exception.Create(ReportsRelCM.MessageInfo);
  Except
     On E:Exception Do
     Begin
       Result := False;
       MessageInfo := E.Message;
     End;
  End;
  ReportsRelCM.Free;
end;

function TCtrlPadroesSrvr.ProcurarReports(IdReports,
  OrigemCm: Integer): Boolean;
Var
  ReportsRelCM: TCtrlReportsRelCM;
begin
  ReportsRelCM := TCtrlReportsRelCM.Create;
  Try
     ReportsRelCM.Procurar(IdReports, OrigemCm);
     Result := True;

     If Not Result Then Raise Exception.Create(ReportsRelCM.MessageInfo);
  Except
     On E:Exception Do
     Begin
       Result := False;
       MessageInfo := E.Message;
     End;
  End;
  ReportsRelCM.Free;
end;

function TCtrlPadroesSrvr.ProcessaConfig(ovCds, ovCdsReport: OleVariant;
  Operacao: Integer): Boolean;
Var
  ConfigRelatorio: TCtrlConfigRelatorio;
begin
  ConfigRelatorio := TCtrlConfigRelatorio.Create;
  Try
     ConfigRelatorio.InitializeAs(Self);
     Result := ConfigRelatorio.ProcessaConfig(ovCds, ovCdsReport, TOperacao(Operacao));

     If Not Result Then Raise Exception.Create(ConfigRelatorio.MessageInfo);
  Except
     On E:Exception Do
     Begin
       Result := False;
       MessageInfo := E.Message;
     End;
  End;
  ConfigRelatorio.Free;
end;

function TCtrlPadroesSrvr.ProcessaConfigModelo(
  ovReports: OleVariant): Boolean;
Var
  Configreportscm: TCtrlConfigreportscm;
begin
  Configreportscm := TCtrlConfigreportscm.Create;
  Try
     Configreportscm.InitializeAs(Self);
     Configreportscm.CdsReports.Data := ovReports;
     Result := Configreportscm.ProcessaConfigModelo;

     If Not Result Then Raise Exception.Create(Configreportscm.MessageInfo);
  Except
     On E:Exception Do
     Begin
       Result := False;
       MessageInfo := E.Message;
     End;
  End;
  Configreportscm.Free;
end;

end.
