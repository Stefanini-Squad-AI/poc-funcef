{-------------------------------------------------------------------------------

Padrão      : 3.02.14
Pendência   : 24037 / 24038
Responsável : Daniel Simões
Data        : 26/12/2006
Descrição   : Acerto na query Centro de Custo ( ListaLocalizacao ).
              Substituição do campo CODCENTCUSTO pelo campo CODEXTERNO na
              sua exibição na tela Cadastro de Localizações
              ( frmMTCadLocalizacao )...
-------------------------------------------------------------------------------}

unit uCtrlLocalizacoes;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,  
     SysUtils, dbclient, Provider,   
     uDBLocalizacao;

Type
   TCtrlLocalizacoes = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbLocalizacao : TDbLocalizacao;

      Fcds: TClientDataSet;
      procedure Setcds(const Value: TClientDataSet);

      function CMTranslate(sIgor : String) : String;
      
   Public
      property cds : TClientDataSet read Fcds write Setcds;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function AplicaOperacao(sMov : String) : Boolean;
      function Procurar(nIdLocalizacao, nIdPessoa : Extended) : OleVariant;
      function ListaLocalizacao(fIdPessoa : Extended; fIdLocalizacao : Extended = -1; iInativo : Integer = -1): OleVariant;
      function TransfOK(nIdPessoa : Extended; nIdLocalizacao : Extended) : Boolean;
      function ConjuntosnaLocalizacao(nIdPessoa, nIdLocalizacao : Extended) : Boolean;

   end;

implementation

{ TCtrlLocalizacoes }

function TCtrlLocalizacoes.ConjuntosnaLocalizacao(nIdPessoa, nIdLocalizacao : Extended) : Boolean;
var
   sSql : String;

begin
   Result := False;
   sSql := ' SELECT COUNT(IDLOCALIZACAO) AS QTD ' +
           ' FROM CONJUNTO ' +
           ' WHERE (IDLOCALIZACAO = ' + floattostr(nIdLocalizacao) + ') ' +
           '   AND (IDPESSOA = ' + floattostr(nIdPessoa) + ') ' ;
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   if _cds.FieldByName('QTD').AsInteger <> 0 then
   begin
      MessageInfo := CMTranslate('Existem conjuntos cadastrados nesta localização!');
      Result := True;
   end;
   //-------------------------------------------------------------------------------------
   _cds.Close;
end;

function TCtrlLocalizacoes.TransfOK(nIdPessoa, nIdLocalizacao : Extended) : boolean;
var
   sSql : String;
begin
   sSql := ' SELECT /*+ RULE */ IDMOVIMENTACAO ' +
           ' FROM HISTORICOMOVIMENTACAO '+
           ' WHERE (IDPESSOA = ' + floattostr(nIdPessoa) + ')' +
           '   AND (IDLOCALANT = ' + floattostr(nIdLocalizacao) + ')' +
           '   AND ((IDTIPOMOVIMENTACAO = 05) OR ' +
           '        (IDTIPOMOVIMENTACAO = 11) OR ' +
           '        (IDTIPOMOVIMENTACAO = 12)) ';
   _cds.Data := GetDataPacket( sSql );
   //-------------------------------------------------------------------------------------
   Result := _cds.RecordCount = 0;
end;

function TCtrlLocalizacoes.AplicaOperacao(sMov : String) : Boolean;
var
   sMensagem : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoLOCALIZACAO( sMov, Fcds.Data );
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;

         if sMov = 'R' then
            if not Fcds.FieldByName('IDLOCALIZACAO').IsNull then
               if not TransfOK(Fcds.FieldByName('IDPESSOA').AsFloat,
                               Fcds.FieldByName('IDLOCALIZACAO').AsFloat) then
                  Raise Exception.Create(CMTranslate('Localização registrada em Transferencias. Exclusão Negada!'));

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
   _dbLocalizacao.IDLocalizacao.AsFloat := nIdLocalizacao;
   _dbLocalizacao.IDPessoa.AsFloat      := nIdPessoa;
   Result := GetDataPacket(_dbLocalizacao.sSQLSelect);
end;

function TCtrlLocalizacoes.ListaLocalizacao(fIdPessoa, fIdLocalizacao : Extended; iInativo : Integer): OleVariant;
var
   sSql : String;
begin
   sSql := ' SELECT L.IDLOCALIZACAO, L.IDPESSOA, L.IDRESPONSAVEL, L.IDEMPRESA, '           +#13+
           '        L.CODCENTROCUSTO, L.IDTIPOAREA, L.NOME, L.ENDERECO, L.FLGLOCSAITEMP, ' +#13+
           '        L.INATIVO, P.NOME AS NOMERESP, '                                       +#13+

           // Daniel - 24037 - 24038 [ Adicionado CODEXTERNO na query... ]
           '        CC.NOME AS DESCCCUSTO, CC.CODEXTERNO '                                 +#13+

           ' FROM LOCALIZACAO L, '                                                         +#13+
           '      PESSOA P, '                                                              +#13+
           '      CENTCUST CC '                                                            +#13+
           ' WHERE L.IDPESSOA = '+FloatToStr(fIdPessoa)                                    +#13;

   //---------------------------------------------------------------------------
   if fIdLocalizacao <> -1 then
     sSql := sSql + '  AND L.IDLOCALIZACAO = ' + FloatToStr(fIdLocalizacao)                +#13;

   //---------------------------------------------------------------------------
   if iInativo <> -1 then
     sSql := sSql + '  AND L.INATIVO = ' + IntToStr(iInativo)                              +#13;

   //---------------------------------------------------------------------------
   sSql := sSql + '  AND L.IDRESPONSAVEL  = P.IDPESSOA '                                   +#13+
                  '  AND L.CODCENTROCUSTO = CC.CODCENTROCUSTO '                            +#13+
                  '  AND L.IDEMPRESA      = CC.IDEMPRESA '                                 +#13+
                  'ORDER BY L.NOME ';

   //---------------------------------------------------------------------------
   Result := GetDataPacket( sSql );
end;

procedure TCtrlLocalizacoes.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

function TCtrlLocalizacoes.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.
