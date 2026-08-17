unit DPadroesSrvr50;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, CMPadroesSrvr50_TLB, StdVcl, Provider, Db, DBTables, Wwquery,
  uCtrlMensagemCM, uCtrlPadroes;

type
  TDtmPadroesSrvr50 = class(TRemoteDataModule, IDtmPadroesSrvr50)
    DbPadroesSrvr50: TDatabase;
    SsnPadroesSrvr50: TSession;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    _TempDir: String;
    _MessageInfo: WideString;
    _MensagemCM: TCtrlMensagemCM;
    procedure MessageServer(sMensagem: String);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function ConectaDB(const UserName, PassWord,
      ServerName: WideString): WordBool; safecall;
    function MessageInfo: WideString; safecall;
    function GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario: Double;
      const sDescOperacao: WideString): WordBool; safecall;
    function GetDataPacket(const sSql: WideString): OleVariant; safecall;
    function ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc: OleVariant): WordBool; safecall;
    function ProcessaPessoaBanco(Operacao: Integer; CdsPessoa, CdsPessoaFisica,
      CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess,
      CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc: OleVariant): WordBool; safecall;
    function ProcessaPessoaCliente(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli, CdsImAgregCli,
      CdsTiposCli: OleVariant): WordBool; safecall;
    function ProcessaPessoaForne(Operacao: Integer; CdsPessoa, CdsPessoaFisica,
      CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess,
      CdsTelContato, CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc,
      CdsImAgregForn, CdsEmpresaForn, CdsFornXDesemb,
      CdsFornXRamo: OleVariant): WordBool; safecall;
    function ExecSqlAndCommit(const sSql: WideString): WordBool; safecall;
    function ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage,
      IdMensagem: Integer): WordBool; safecall;
    function GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; safecall;
    function GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
      TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
      ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
      ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
      ovNaturalidade, ovBanco, ovDocumento,
      ovTipoDoc: OleVariant): WordBool; safecall;
    function SelDadosCli(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
      ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
      ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool; safecall;
    function SelDadosForne(rIdEmpresa, rIdForCli: Double; out ovSubTipo,
      ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
      ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
      safecall;
    function GetDataPacketTS(lSQL: OleVariant): OleVariant; safecall;
    function GetContentFile(const sFileName: WideString): WideString; safecall;
  public
    { Public declarations }
  end;

implementation

Uses uCtrlPessoaCliente, uCtrlPessoaAgencia, uCtrlPessoaBanco, uCtrlPessoaForne,
     uCtrlPessoa, uDataBase, uCMTypes, JclFileUtils, uCMFileUtils, uMidasUtil;

{$R *.DFM}

class procedure TDtmPadroesSrvr50.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

function TDtmPadroesSrvr50.ConectaDB(const UserName, PassWord,
  ServerName: WideString): WordBool;
begin
  Try
    Result := Padroes.ConectaDb(UserName, PassWord, ServerName);
    If Not Result Then _MessageInfo := Padroes.MessageInfo;
  Except
    On E:Exception Do
    Begin
       Result := False;
       _MessageInfo := E.Message;
    End;
  End;

end;

procedure TDtmPadroesSrvr50.RemoteDataModuleCreate(Sender: TObject);
begin
  _TempDir := GeraDataBaseName(self,DbPadroesSrvr50, True, SsnPadroesSrvr50);

  Try
    Padroes := TCtrlPadroes.Create;
    Padroes.Initialize(DbPadroesSrvr50, True, cntBde, CnsServer, nil, false, MessageServer, nil, True);

    _MensagemCM := TCtrlMensagemCM.Create;
    _MensagemCM.Initialize(DbPadroesSrvr50, True, cntBde, CnsServer, nil, false, MessageServer, nil, True);

  Except
    On E:Exception Do
       CMDebugToFile(E.Message);
  End;
end;

procedure TDtmPadroesSrvr50.RemoteDataModuleDestroy(Sender: TObject);
begin
  Try
    Padroes.Free;
    _MensagemCM.Free;

    If DbPadroesSrvr50.Connected Then DbPadroesSrvr50.CLose;
    If SsnPadroesSrvr50.Active Then SsnPadroesSrvr50.Close;

    If DirectoryExists(_TempDir) Then DelTree(_TempDir);
  Except

  End;
end;

function TDtmPadroesSrvr50.MessageInfo: WideString;
begin
  Result := _MessageInfo;
end;

procedure TDtmPadroesSrvr50.MessageServer(sMensagem: String);
begin
  _MessageInfo := sMensagem;
end;

function TDtmPadroesSrvr50.GravaLogOperacoes(dIdPessoa, dIdModulo,
  dIdUsuario: Double; const sDescOperacao: WideString): WordBool;
begin
  Try
    Result := Padroes.GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario, sDescOperacao);
    If Not Result Then _MessageInfo := Padroes.MessageInfo;
  Except
    On E:Exception Do
    Begin
       Result := False;
       _MessageInfo := E.Message;
    End;
  End;
end;

function TDtmPadroesSrvr50.GetDataPacket(
  const sSql: WideString): OleVariant;
begin
  Try
    Result := Padroes.GetDataPacket(sSql);
  Except
    On E:Exception Do
    Begin
       Result := False;
       _MessageInfo := E.Message + Padroes.MessageInfo;
    End;
  End;
end;

function TDtmPadroesSrvr50.ProcessaPessoaAgencia(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoaAgencia;
begin
    Pessoa := TCtrlPessoaAgencia.Create;
    Try
       Pessoa.Initialize(DbPadroesSrvr50,True,cntBde,CnsServer,nil,false,MessageServer,nil,True);

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
         _MessageInfo := E.Message;
         Pessoa.Free;
       End;
    End;
end;

function TDtmPadroesSrvr50.ProcessaPessoaBanco(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoaBanco;
begin
    Pessoa := TCtrlPessoaBanco.Create;
    Try
       Pessoa.Initialize(DbPadroesSrvr50,True,cntBde,CnsServer,nil,false,MessageServer,nil,True);

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
         _MessageInfo := E.Message;
         Pessoa.Free;
       End;
    End;
end;

function TDtmPadroesSrvr50.ProcessaPessoaCliente(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli,
  CdsImAgregCli, CdsTiposCli: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoaCliente;
begin
    Pessoa := TCtrlPessoaCliente.Create;
    Try
       Pessoa.Initialize(DbPadroesSrvr50,True,cntBde,CnsServer,nil,false,MessageServer,nil,True);

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
         _MessageInfo := E.Message;
         Pessoa.Free;
       End;
    End;
end;

function TDtmPadroesSrvr50.ProcessaPessoaForne(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn,
  CdsFornXDesemb, CdsFornXRamo: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoaForne;
begin
    Pessoa := TCtrlPessoaForne.Create;
    Try
       Pessoa.Initialize(DbPadroesSrvr50,True,cntBde,CnsServer,nil,false,MessageServer,nil,True);

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
         _MessageInfo := E.Message;
         Pessoa.Free;
       End;
    End;
end;

function TDtmPadroesSrvr50.ExecSqlAndCommit(
  const sSql: WideString): WordBool;
begin
  Try
    Result := Padroes.ExecSqlAndCommit(sSql);
    If Not Result Then _MessageInfo := Padroes.MessageInfo;
  Except
    On E:Exception Do
    Begin
       Result := False;
       _MessageInfo := E.Message;
    End;
  End;

end;

function TDtmPadroesSrvr50.ProcessaMensagem(CdsMensagem: OleVariant;
  iOperacaoMensage, IdMensagem: Integer): WordBool;
begin
  Try
    _MensagemCM.CdsMensagem.Data := CdsMensagem;
    Result := _MensagemCM.ProcessaMensagem(TOperacaoMensagem(iOperacaoMensage),IdMensagem);
    If Not Result Then _MessageInfo := _MensagemCM.MessageInfo;
  Except
    On E:Exception Do
    Begin
       Result := False;
       _MessageInfo := E.Message;
    End;
  End;
end;

function TDtmPadroesSrvr50.GravaHistSenha(
  aCdsHistSenha: OleVariant): WordBool;
begin
  Try
    Result := Padroes.GravaHistoricodeSenha(aCdsHistSenha);
    If Not Result Then _MessageInfo := Padroes.MessageInfo;
  Except
    On E:Exception Do
    Begin
       Result := False;
       _MessageInfo := E.Message;
    End;
  End;
end;

function TDtmPadroesSrvr50.GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
  TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
  ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
  ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
  ovNaturalidade, ovBanco, ovDocumento,
  ovTipoDoc: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoa;
begin
    Pessoa := TCtrlPessoa.Create;
    Try
       Pessoa.Initialize(DbPadroesSrvr50,True,cntBde,CnsServer,nil,false,MessageServer,nil,True);

       Result :=  Pessoa.GetDadosPessoa(rIdPessoa, TTipoGetPessoa(TipoGetPessoa), TTipoPessoa(TipoPessoa));

       If Result Then
          Pessoa.CdsDadosToOleVariant(ovPessoa, ovPessoaFisica, ovDocPessoa, ovEndPess,
                                      ovTelEndPess, ovContatoPess, ovTelContato, ovContaBancaria,
                                      ovImagensPessoa, ovImagensDoc, ovEstado, ovNaturalidade,
                                      ovBanco, ovDocumento, ovTipoDoc)
       Else
         Raise Exception.Create(MessageInfo);

       Pessoa.Free;
    Except
       On E:Exception Do
       Begin
         Result := False;
         _MessageInfo := E.Message;
         Pessoa.Free;
       End;
    End;
end;

function TDtmPadroesSrvr50.SelDadosCli(rIdEmpresa, rIdForcli: Double;
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
       Pessoa.Initialize(DbPadroesSrvr50,True,cntBde,CnsServer,nil,false,MessageServer,nil,True);

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
         _MessageInfo := E.Message;

         Pessoa.Free;
         FreeCds([aCdsSubTipo, aCdsEmpresaCliente, aCdsTipoReceb, aCdsTipoRecebCli, aCdsImAgreg,
                  aCdsImAgregCli, aCdsTipos, aCdsTiposCli]);
       End;
    End;
end;

function TDtmPadroesSrvr50.SelDadosForne(rIdEmpresa, rIdForCli: Double;
  out ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
  ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
Var
  Pessoa :TCtrlPessoaForne;
  aCdsSubTipo, aCdsEmpresaForne, aCdsTipoDesemb, aCdsImAgreg, aCdsRamoForne, aCdsTipoDesembForn,
  aCdsImAgregForn, aCdsRamoXForne: TClientDataSet;
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

    Try
       Pessoa.Initialize(DbPadroesSrvr50,True,cntBde,CnsServer,nil,false,MessageServer,nil,True);

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
         _MessageInfo := E.Message;
         Pessoa.Free;
         FreeCds([ aCdsSubTipo, aCdsEmpresaForne, aCdsTipoDesemb, aCdsImAgreg, aCdsRamoForne, aCdsTipoDesembForn,
                   aCdsImAgregForn, aCdsRamoXForne]);
       End;
    End;
end;

function TDtmPadroesSrvr50.GetDataPacketTS(lSQL: OleVariant): OleVariant;
begin
  Try
    VariantToStringList( lSQL, Padroes.Sql );
    Result := Padroes.GetDataPacket( Padroes.Sql );
  Finally
    _MessageInfo := Padroes.MessageInfo;
  End;
end;

function TDtmPadroesSrvr50.GetContentFile(
  const sFileName: WideString): WideString;
Var
  lFile: TextFile;
  sContent: String;
begin
  Try
    {$I-}
    Padroes.SQL.Clear;
    If FileExists(sFileName) Then
    Begin
       AssignFile(lFile, sFileName);
       reset(lFile);
       While Not Eof(lFile) Do
       Begin
          Readln(lFile, sContent);
          Padroes.SQL.Add(sContent);
       End;
       CloseFile(lFile);
    End;

    If Trim(Padroes.SQL.Text) = '' Then
      Abort
    Else
      Result := Padroes.Sql.Text;

  Except
    On E:Exception Do
    Begin
      Padroes.SQL.Clear;
      Padroes.SQL.Add('EMPTY');
      If FileExists(sFileName) Then CloseFile(lFile);
      {$I+}
      Result := Padroes.Sql.Text;
    End;
  End;
end;

initialization
  TComponentFactory.Create(ComServer, TDtmPadroesSrvr50,
    Class_DtmPadroesSrvr50, ciMultiInstance, tmApartment);
end.
