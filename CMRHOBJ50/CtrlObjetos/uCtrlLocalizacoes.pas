unit uCtrlLocalizacoes;

interface

uses DB, uCmDbObject, uCmControlObject, uCMTypes, SysUtils, dbclient, Provider, uSistema,
  uDBLocalizacao;

type
  TCtrlLocalizacoes = class(TCmControlObject)
  protected
     procedure DoChangeDataBase; override;
  private
    _dbLocalizacao : TDbLocalizacao;

    Fcds: TClientDataSet;

    procedure Setcds(const Value: TClientDataSet);
  public
    constructor Create; override;
    destructor  Destroy; override;

    function AplicaOperacao : Boolean;
    function Procurar(nIdLocalizacao, nIdPessoa : Extended) : OleVariant;
    function ListaLocalizacao(fIdPessoa : Extended; fIdLocalizacao : Extended = -1): OleVariant;
    function ListaNomeLocalizacao(fIdPessoa: Extended; fIdLocalizacao: Extended = -1): OleVariant;

    property Cds: TClientDataSet read Fcds write Setcds;
  end;

implementation

{ TCtrlLocalizacoes }

function TCtrlLocalizacoes.AplicaOperacao: Boolean;
Var
   sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoLOCALIZACAO( Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         Result := ApplyCds(Fcds,_dbLocalizacao,[],[]);
         sMensagem := _dbLocalizacao.MessageInfo;

         if not Result then
            Raise Exception.Create(sMensagem);

         Commit;
      except
         On E : Exception Do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

constructor TCtrlLocalizacoes.Create;
begin
   inherited;
   _dbLocalizacao := TDbLocalizacao.Create(Self);
   fCds           := TClientDataSet.Create(nil);
end;

destructor TCtrlLocalizacoes.Destroy;
begin
   if fCds.Active then
      fCds.Close;

   fCds := nil;
   fCds.Free;

   _dbLocalizacao.Free;

   inherited;
end;

procedure TCtrlLocalizacoes.DoChangeDataBase;
begin
   inherited;
   _dbLocalizacao.DataBaseName := DataBaseName;
end;

function TCtrlLocalizacoes.Procurar(nIdLocalizacao, nIdPessoa: Extended): OleVariant;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcurarLOCALIZACAO( nIdLocalizacao, nIdPessoa ); // Aplicação Servidora
      MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      _dbLocalizacao.IDLocalizacao.AsFloat := nIdLocalizacao;
      _dbLocalizacao.IDPessoa.AsFloat      := nIdPessoa;
      Result := GetDataPacket(_dbLocalizacao.sSQLSelect);
   end;
end;

function TCtrlLocalizacoes.ListaLocalizacao(fIdPessoa, fIdLocalizacao : Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT L.IDLOCALIZACAO, L.IDPESSOA, L.IDRESPONSAVEL, L.IDEMPRESA, ' + #13 +
           '        L.CODCENTROCUSTO, L.IDTIPOAREA, L.NOME, L.ENDERECO, L.FLGLOCSAITEMP, ' + #13 +
           '        P.NOME AS NOMERESP, CC.NOME AS DESCCCUSTO ' + #13 +
           ' FROM LOCALIZACAO L, ' + #13 +
           '      PESSOA P, ' + #13 +
           '      CENTCUST CC ' + #13 +
           ' WHERE (L.IDPESSOA = ' + floattostr(fIdPessoa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if fIdLocalizacao <> -1 then
      sSql := sSql + '   AND (L.IDLOCALIZACAO = ' + floattostr(fIdLocalizacao) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (L.IDRESPONSAVEL = P.IDPESSOA) ' + #13 +
                  '   AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO) ' + #13 +
                  '   AND (L.IDEMPRESA = CC.IDEMPRESA) ' + #13 +
                  ' ORDER BY L.NOME ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

function TCtrlLocalizacoes.ListaNomeLocalizacao(fIdPessoa, fIdLocalizacao: Extended): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT IDLOCALIZACAO, NOME ' + #13 +
           ' FROM LOCALIZACAO ' + #13 +
           ' WHERE (IDPESSOA = ' + floattostr(fIdPessoa) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if fIdLocalizacao <> -1 then
      sSql := sSql + '   AND (IDLOCALIZACAO = ' + floattostr(fIdLocalizacao) + ') ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + ' ORDER BY UPPER(NOME)';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

procedure TCtrlLocalizacoes.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

end.
