unit uCtrlGrupoRateio;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE GRUPO DE RATEIO ( MT )
//
//      Módulo          :  Comuns Imobiliário
//      Autor           :  Vinícius Meyer Lana
//      Data de Início  :  30/09/2002
//      Data de Término :  01/10/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaGrupoRateio   - Insere, Altera e Exclui Grupo de Rateio
//      ExcluiGrupoRateio  - Exclui Grupo de Rateio
//      ReplicaGrupoRateio - Cria uma cópia de um determinado grupo
//      CalculaGrupoRateio - Calcula os percentuais baseados na area do imóvel
//      LookupGrupoRateio  - Busca um ou vários grupos de rateio
// -----------------------------------------------------------------------------

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet, uCMTypes,
     uDbGrupoRateio, uDbPadraoRateioDoc, uModulo;


type TCtrlGrupoRateio = class(TCMControlObject)

   private

      FCdsPadraoRateioDoc : TCMClientDataSet;
      FCdsGrupoRateio     : TCMClientDataSet;
      FDbGrupoRateio      : TDbGrupoRateio;
      FDbPadraoRateioDoc  : TDbPadraoRateioDoc;

      procedure SetCdsGrupoRateio(const Value: TCMClientDataSet);
      procedure SetCdsPadraoRateioDoc(const Value: TCMClientDataSet);

      procedure SetDbGrupoRateio(const Value: TDbGrupoRateio);
      procedure SetDbPadraoRateioDoc(const Value: TDbPadraoRateioDoc);

      function VerificaRateio (var sMsgErro: String): Boolean;

   protected

      procedure AfterInitialize;   override;
      procedure OnCreateAppServer; override;

   public

      constructor Create;  override;
      destructor  Destroy; override;

      property DbGrupoRateio       : TDbGrupoRateio     read FDbGrupoRateio        write SetDbGrupoRateio;
      property CdsGrupoRateio      : TCMClientDataSet   read FCdsGrupoRateio       write SetCdsGrupoRateio;
      property DbPadraoRateioDoc   : TDbPadraoRateioDoc read FDbPadraoRateioDoc    write SetDbPadraoRateioDoc;
      property CdsPadraoRateioDoc  : TCMClientDataSet   read FCdsPadraoRateioDoc   write SetCdsPadraoRateioDoc;

      function GravaGrupoRateio : Boolean;
      function ExcluiGrupoRateio: Boolean;

      function LookupGrupoRateio(const IDModulo      : Integer = -1;
                                 const IDGrupoRateio : Integer = -1
                                ): OleVariant;

      function LookupPadraoRateioDoc(const IDGrupoRateio: Extended = -1;
                                     const IDEmpresaProp: Int64 = 1
                                    ): OLEVariant;

      function LookupTipoDesembXCRespon(const IDEmpresa : Extended;
                                        const sRecPag   : String;
                                        const sCRespon  : String
                                       ): OLEVariant;

      function LookupTipoDesembXForn(const IDEmpresa   : Extended;
                                     const iFornecedor : Extended;
                                     const sRecPag     : String
                                    ): OLEVariant;

      function LookupRamoFornXDesemb(const IDEmpresa   : Extended;
                                     const iFornecedor : Extended;
                                     const sRecPag     : String
                                    ): OLEVariant;

      function LookupUsuXCRespon(const IDEmpresa : Extended;
                                 const iUsuario  : Extended;
                                 const sRecPag   : String;
                                 const sCRespon  : String
                                ): OLEVariant;

     published

end;



implementation
{ TCtrlGrupoRateio }



constructor TCtrlGrupoRateio.Create;
begin
   inherited;

   // Cria os DbOjbects
   FDBGrupoRateio       := TDBGrupoRateio.Create( Self );
   FDBPadraoRateioDoc   := TDBPadraoRateioDoc.Create( Self );
end;



destructor TCtrlGrupoRateio.Destroy;
begin
   // Destrói os DbObjects criados
   FreeAndNil (FDbGrupoRateio);
   FreeAndNil (FDbPadraoRateioDoc);

   // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
   if isAppServer then
   begin
      FreeAndNil(FCdsGrupoRateio);
      FreeAndNil(FCdsPadraoRateioDoc);
   end;

   inherited;
end;



procedure TCtrlGrupoRateio.OnCreateAppServer;
begin
   inherited;
   // Cria os Cds somente no caso de execução pela aplicação servidora,
   // pq na aplicação cliente os mesmos já foram criados.
   FCdsGrupoRateio      := TCMClientDataSet.Create( nil );
   FCdsPadraoRateioDoc  := TCMClientDataSet.Create( nil );
end;



procedure TCtrlGrupoRateio.AfterInitialize;
begin
   inherited;

   // define o DataBase a ser utilizado
   FDbGrupoRateio.DataBaseName      := DataBaseName;
   FDbPadraoRateioDoc.DataBaseName  := DataBaseName;
end;



function TCtrlGrupoRateio.GravaGrupoRateio: Boolean;
var
   sMsg : String;
begin
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.GravaGrupoRateio( CdsGrupoRateio.Data, CdsPadraoRateioDoc.Data );
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;
         if VerificaRateio( sMsg ) then
         begin
            // Grava Imóvel ( Pai )
            Result := ApplyCds( CdsGrupoRateio, DbGrupoRateio, [], [] );
            if not(Result) then raise Exception.Create( DbGrupoRateio.MessageInfo );

            // Grava PadraoRateioDoc ( Filho )
            Result := ApplyCds( CdsPadraoRateioDoc, DbPadraoRateioDoc, [DbGrupoRateio.IdGrupoRateio], [DbPadraoRateioDoc.IdGrupoRateio] );
            if not(Result) then raise Exception.Create( DbPadraoRateioDoc.MessageInfo );

            Commit;
         end
         else
         begin
            raise Exception.Create( sMsg );
         end;

      except
         on E : Exception do begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlGrupoRateio.ExcluiGrupoRateio: Boolean;
begin
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExcluiGrupoRateio( CdsGrupoRateio.Data, CdsPadraoRateioDoc.Data );
      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         // Marca todos os filhos para exclusão
         CdsPadraoRateioDoc.First;
         while not(CdsPadraoRateioDoc.EOF) do CdsPadraoRateioDoc.Delete;

         // Exclui PadraoRateioDoc ( Filho )
         Result := ApplyCds( CdsPadraoRateioDoc, DbPadraoRateioDoc, [], [] );
         if not(Result) then raise Exception.Create( DbPadraoRateioDoc.MessageInfo );

         // Exclui Imóvel ( Pai )
         Result := ApplyCds( CdsGrupoRateio, DbGrupoRateio, [], [] );
         if not Result then raise Exception.Create( DbGrupoRateio.MessageInfo );

         Commit;
      except
         on E : Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlGrupoRateio.LookupGrupoRateio(const IDModulo      : Integer = -1;
                                            const IDGrupoRateio : Integer = -1
                                           ): OleVariant;
var
   sSql, sParam: string;
begin
   // Define Parâmetros
   sParam := '';
   if IdModulo <> -1      then sParam := sParam + ' AND IDMODULO = '     + IntToStr(IDModulo);
   if IDGrupoRateio <> -1 then sParam := sParam + ' AND IDGRUPORATEIO = '+ IntToStr(IDGrupoRateio);

   // Define Sql
   sSql := 'SELECT IDGRUPORATEIO, IDMODULO, GRRDESCRICAO ' + #13 +
           '  FROM GRUPORATEIO '  + #13 +
           ' WHERE 1=1 ' + sParam + #13 +
           ' ORDER BY GRRDESCRICAO ';

   Result := GetDataPacket(sSql);
end;



function TCtrlGrupoRateio.LookupPadraoRateioDoc(const IDGrupoRateio: Extended;
                                                const IDEmpresaProp: Int64
                                               ): OLEVariant;
var
   sSql, sParam: string;
begin
   // Define Parâmetros
   sParam := '';
   if trunc(IDGrupoRateio) <> -1 then sParam := sParam + #13 + '  AND PDR.IDGRUPORATEIO = ' + FormatFloat('#0', trunc(IDGrupoRateio));

   sSQL :=
   'SELECT '                                                   + #13 +
   '  PDR.IDPADRRATEIODOC, '                                   + #13 +
   '  PDR.IDGRUPORATEIO, '                                     + #13 +
   '  PDR.IDPROGRAMA, PGR.DESCPROGRAMA, '                      + #13 +
   '  PDR.IDEMPRESAPROP, '                                     + #13 +
   '  PDR.RECPAG, '                                            + #13 +
   '  PDR.CODTIPRECDES, TRD.DESCRICAO AS TIPODESEMBOLSO, '     + #13 +
   '  PDR.CODCENTROCUSTO, CCU.NOME AS CENTROCUSTO, CCU.CODEXTERNO AS CODCCEXTERNO, '+ #13 +
   '  PDR.CODCENTRORESPON, CRE.NOME AS CENTRORESPON, '         + #13 +
   '  PDR.UNIDNEGOC, UND.NOME AS UNIDNEGOCIO, '                + #13 +
   '  PDR.IDPATRO, PTR.NOME AS PATRO, '                        + #13 +
   '  PDR.IDPLANOPREV, PLP.NOME AS PLANPREV, '                 + #13 +
   '  PDR.PERCENTRATEIO '                                      + #13 +
   'FROM '                                                     + #13 +
   '  PESSOA            PTR, '                                 + #13 +
   '  PADRAORATEIODOC   PDR, '                                 + #13 +
   '  TIPORECEBDESEMB   TRD, '                                 + #13 +
   '  CENTCUST          CCU, '                                 + #13 +
   '  CENTRESPON        CRE, '                                 + #13 +
   '  PLANPREVCONTABIL  PLP, '                                 + #13 +
   '  UNIDNEGOCIO       UND, '                                 + #13 +
   '  PROGRAMA          PGR '                                  + #13 +
   'WHERE '                                                    + #13 +
   '      PDR.IDEMPRESAPROP   = ' + IntToStr(IDEmpresaProp)    + #13 +
   '  AND PDR.RECPAG          = ''P'' '                        + #13 +
   '  AND PDR.IDPATRO         = PTR.IDPESSOA '                 + #13 +
   '  AND PDR.RECPAG          = TRD.RECPAG '                   + #13 +
   '  AND PDR.IDEMPRESAPROP   = TRD.IDPESSOA '                 + #13 +
   '  AND PDR.CODTIPRECDES    = TRD.CODTIPRECDES '             + #13 +
   '  AND PDR.IDEMPRESAPROP   = CCU.IDEMPRESA '                + #13 +
   '  AND PDR.CODCENTROCUSTO  = CCU.CODCENTROCUSTO '           + #13 +
   '  AND PDR.IDEMPRESAPROP   = CRE.IDPESSOA '                 + #13 +
   '  AND PDR.CODCENTRORESPON = CRE.CODCENTRORESPON '          + #13 +
   '  AND PDR.UNIDNEGOC       = UND.UNIDNEGOC '                + #13 +
   '  AND PDR.IDPLANOPREV     = PLP.IDPLANOPREV '              + #13 +
   '  AND PDR.IDPROGRAMA      = PGR.IDPROGRAMA ' + sParam      + #13 +
   'ORDER BY '                                                 + #13 +
   '  PDR.PERCENTRATEIO ';

   Result := GetDataPacket(sSql);
end;




//========================================================================================
// Função INTERNA para validação do grupo de rateio
// Data : 01/10/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
function TCtrlGrupoRateio.VerificaRateio(var sMsgErro: String): Boolean;
var
   bTipoOk : Boolean;
   iPerc   : Extended;
begin
   Result   := True;
   sMsgErro := '';

   with CdsPadraoRateioDoc do
   begin
      DisableControls;
      First;
      iPerc   := 0;
      bTipoOk := True;

      while not(EOF) do
      begin
         iPerc := Modulo.ArredondaParaComparar(iPerc, 4) +
                  Modulo.ArredondaParaComparar(FieldByName('PERCENTRATEIO').AsFloat, 4);
         Next;
      end;

      First;
      EnableControls;

      if iPerc > 100 then
      begin
         sMsgErro := sMsgErro + 'Percentual total de rateio ultrapassa 100%';
         Result   := False;
      end;
   end;
end;



procedure TCtrlGrupoRateio.SetCdsGrupoRateio(const Value: TCMClientDataSet);
begin
   FCdsGrupoRateio := Value;
end;



procedure TCtrlGrupoRateio.SetCdsPadraoRateioDoc(const Value: TCMClientDataSet);
begin
   FCdsPadraoRateioDoc := Value;
end;



procedure TCtrlGrupoRateio.SetDbGrupoRateio(const Value: TDbGrupoRateio);
begin
   FDbGrupoRateio := Value;
end;



procedure TCtrlGrupoRateio.SetDbPadraoRateioDoc(const Value: TDbPadraoRateioDoc);
begin
   FDbPadraoRateioDoc := Value;
end;



function TCtrlGrupoRateio.LookupTipoDesembXCRespon(const IDEmpresa : Extended;
                                                   const sRecPag   : String;
                                                   const sCRespon  : String
                                                  ): OLEVariant;
var
   sSql : String;
begin
   sSQL :=
   'SELECT '                                                      + #13 +
   '  CODCENTRORESPON, '                                          + #13 +
   '  CODTIPRECDES, '                                             + #13 +
   '  RECPAG '                                                    + #13 +
   'FROM '                                                        + #13 +
   '  TRDXCRESPON TXC '                                           + #13 +
   'WHERE '                                                       + #13 +
   '      TXC.IDPESSOA        = ' + FormatFloat('#0', IDEmpresa)  + #13 +
   '  AND TXC.RECPAG          = ' + QuotedStr(sRecPag)            + #13 +
   '  AND TXC.CODCENTRORESPON = ' + QuotedStr(sCRespon);

   Result := GetDataPacket(sSql);
end;



function TCtrlGrupoRateio.LookupTipoDesembXForn(const IDEmpresa   : Extended;
                                                const iFornecedor : Extended;
                                                const sRecPag     : String
                                               ): OLEVariant;
var
   sSql : String;
begin
   sSQL :=
   'SELECT '                                                      + #13 +
   '  FXD.CODTIPRECDES, '                                         + #13 +
   '  FXD.RECPAG '                                                + #13 +
   'FROM '                                                        + #13 +
   '  FORNXDESEMB FXD '                                           + #13 +
   'WHERE '                                                       + #13 +
   '      FXD.IDEMPRESAPROP = ' + FormatFloat('#0', IDEmpresa)    + #13 +
   '  AND FXD.IDPESSOA      = ' + FormatFloat('#0', iFornecedor)  + #13 +
   '  AND FXD.RECPAG        = ' + QuotedStr(sRecPag);

   Result := GetDataPacket(sSql);
end;



function TCtrlGrupoRateio.LookupRamoFornXDesemb(const IDEmpresa   : Extended;
                                                const iFornecedor : Extended;
                                                const sRecPag     : String
                                               ): OLEVariant;
var
   sSql : String;
begin
   sSQL :=
   'SELECT '                                                      + #13 +
   '  RXD.CODTIPRECDES, '                                         + #13 +
   '  RXD.RECPAG '                                                + #13 +
   'FROM '                                                        + #13 +
   '  RAMOXDESEMB RXD '                                           + #13 +
   'WHERE '                                                       + #13 +
   '      RXD.IDPESSOA      = ' + FormatFloat('#0', IDEmpresa)    + #13 +
   '  AND RXD.RECPAG        = ' + QuotedStr(sRecPag)              + #13 +
   '  AND RXD.IDRAMOFORNECEDOR IN '                               + #13 +
   '      ( '                                                     + #13 +
   '      SELECT '                                                + #13 +
   '         IDRAMOFORNECEDOR '                                   + #13 +
   '      FROM '                                                  + #13 +
   '         FORNXRAMO '                                          + #13 +
   '      WHERE '                                                 + #13 +
   '         IDPESSOA       = ' + FormatFloat('#0', iFornecedor)  + #13 +
   '      ) ';

   Result := GetDataPacket(sSql);
end;





function TCtrlGrupoRateio.LookupUsuXCRespon(const IDEmpresa : Extended;
                                            const iUsuario  : Extended;
                                            const sRecPag   : String;
                                            const sCRespon  : String
                                           ): OLEVariant;
var
   sSql : String;
begin
   sSQL :=
   'SELECT '                                                      + #13 +
   '  UXC.CODCENTRORESPON '                                       + #13 +
   'FROM '                                                        + #13 +
   '  PESSOAXCRESP UXC '                                          + #13 +
   'WHERE '                                                       + #13 +
   '      UXC.IDPESSOA        = ' + FormatFloat('#0', IDEmpresa)  + #13 +
   '  AND UXC.IDPESSOAACESSO  = ' + FormatFloat('#0', iUsuario)   + #13 +
   '  AND UXC.CODCENTRORESPON = ' + QuotedStr(sCRespon);

   Result := GetDataPacket(sSql);
end;



end.
