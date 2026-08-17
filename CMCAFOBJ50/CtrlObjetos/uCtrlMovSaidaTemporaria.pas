unit uCtrlMovSaidaTemporaria;

interface

Uses DB, uCmDbObject, uCmControlObject, uCMTypes,  
     SysUtils, dbclient, Provider, uMidasUtil,  
     dMTBem, uDBSaidaTemporaria, uDBSaidaTempBens;

Type
   TCtrlMovSaidaTemporaria = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dbSaidaTemporaria : TDbSaidaTemporaria;
      _dbSaidaTempBens   : TDbSaidaTempBens;

      _dMTBem            : tdtmMTBem;

      Fcds: TClientDataSet;
      FcdsSaidaTempBens: TClientDataSet;

      procedure Setcds(const Value: TClientDataSet);
      procedure SetcdsSaidaTempBens(const Value: TClientDataSet);

      function CMTranslate(sIgor : String) : String;
      
   Public
      Property cds              : TClientDataSet read Fcds write Setcds;
      Property cdsSaidaTempBens : TClientDataSet read FcdsSaidaTempBens write SetcdsSaidaTempBens;

      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      // Metodos de Persistencia
      //----------------------------------------------------------------------------------
      function ProcurarSaidaTemporaria(nEmpresaProp, nIdSaidaTemporaria : Extended) : OleVariant;
      function ProcurarSaidaTempBens(nEmpresaProp, nIdSaidaTemporaria : Extended) : OleVariant;
      function ListaSaidaTemporaria(nEmpresaProp : Extended; nIdSaidaTemporaria : Extended = -1) : OleVariant;
      function ListaSaidaTempBens(nEmpresaProp, nIdSaidaTemporaria : Extended) : OleVariant;
      function ListaSaidaTempBensRet(nEmpresaProp, nIdSaidaTemporaria : Extended): OleVariant;
      function AplicaOperacao(sTipoOperacao : String) : Boolean;
      function ExecutaTermoSaidaTemporaria(nEmpresaProp, nSaidaTemporaria : Extended;
                                           dDataMov : TDateTime) : Boolean;
      function SetaFlgSaidaTempBem(nEmpresaProp, nBem : Extended; iFlg : Integer) : Boolean;
      function PesquisaTermoSaidaTempxBem(nEmpresaProp, nBem : Extended) : Extended;
      function ProcessaRetornoTermoSaidaTemp(nEmpresaProp, nBem : Extended;
                                             nSaidaTemporaria : Extended;
                                             dDataRetorno : TDateTime) : Boolean;
   end;

implementation

{ TCtrlMovSaidaTemporaria }

constructor TCtrlMovSaidaTemporaria.Create;
begin
   inherited;
   _dbSaidaTemporaria := TDbSaidaTemporaria.Create(Self);
   _dbSaidaTempBens   := TDbSaidaTempBens.Create(Self);

   Fcds              := TClientDataSet.Create(nil);
   FcdsSaidaTempBens := TClientDataSet.Create(nil);

   _dMTBem               := tdtmMTBem.Create(Self);
end;

destructor TCtrlMovSaidaTemporaria.Destroy;
begin
   if IsAppServer then
      FreeCDS([Fcds,FcdsSaidaTempBens]);

   _dbSaidaTemporaria.Free;
   _dbSaidaTempBens.Free;

   _dMTBem.Free;
   inherited;
end;

procedure TCtrlMovSaidaTemporaria.DoChangeDataBase;
begin
   inherited;
   _dbSaidaTemporaria.DataBaseName := DataBaseName;
   _dbSaidaTempBens.DataBaseName   := DataBaseName;
end;

procedure TCtrlMovSaidaTemporaria.OnCreateAppServer;
begin
   inherited;
   Fcds              := TClientDataSet.Create(nil);
   FcdsSaidaTempBens := TClientDataSet.Create(nil);
end;

procedure TCtrlMovSaidaTemporaria.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlMovSaidaTemporaria.SetcdsSaidaTempBens(const Value: TClientDataSet);
begin
  FcdsSaidaTempBens := Value;
end;

function TCtrlMovSaidaTemporaria.ProcurarSaidaTemporaria(nEmpresaProp, nIdSaidaTemporaria: Extended): OleVariant;
begin
   _dbSaidaTemporaria.IDSAIDATEMPORARIA.AsFloat := nIdSaidaTemporaria;
   _dbSaidaTemporaria.IDPESSOA.AsFloat := nEmpresaProp;
   Result := GetDataPacket(_dbSaidaTemporaria.sSQLSelect);
end;

function TCtrlMovSaidaTemporaria.ProcurarSaidaTempBens(nEmpresaProp, nIdSaidaTemporaria: Extended): OleVariant;
begin
   _dbSaidaTempBens.IDSAIDATEMPORARIA.AsFloat := nIdSaidaTemporaria;
   _dbSaidaTempBens.IDPESSOA.AsFloat := nEmpresaProp;
   Result := GetDataPacket(_dbSaidaTempBens.sSQLSelect);
end;

function TCtrlMovSaidaTemporaria.ListaSaidaTemporaria(nEmpresaProp, nIdSaidaTemporaria: Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT ST.IDSAIDATEMPORARIA, ST.IDPESSOA, ST.STPTERMO, ST.STPDATA, ' + #13 +
           '        ST.IDTIPOSAIDATEMP, TST.DESCTIPSAITEMP,                     ' + #13 +
           '        ST.IDLOCALIZACAO, LST.NOME AS NOMELOCALIZACAO,              ' + #13 +
           '        ST.IDRESPONSAVEL, RST.NOME AS NOMERESPONSAVEL,              ' + #13 +
           '        ST.STPOBSERVACOES, ST.STPFLGEXEC, ST.STPDATARETORNO         ' + #13 +
           ' FROM SAIDATEMPORARIA ST, ' + #13 +
           '      TIPOSAIDATEMP TST, ' + #13 +
           '      LOCALIZACAO LST, ' + #13 +
           '      PESSOA RST ' + #13 +
           ' WHERE (ST.IDPESSOA = ' + floattostr(nEmpresaProp)  + ') ' + #13;
   //-------------------------------------------------------------------------------------
   if nIdSaidaTemporaria <> -1 then
      sSql := sSql + '   AND (ST.IDSAIDATEMPORARIA = ' + floattostr(nIdSaidaTemporaria) + ' ) ' + #13;
   //-------------------------------------------------------------------------------------
   sSql := sSql + '   AND (ST.IDTIPOSAIDATEMP = TST.IDTIPOSAIDATEMP) ' + #13 +
                  '   AND (ST.IDLOCALIZACAO = LST.IDLOCALIZACAO) ' + #13 +
                  '   AND (ST.IDPESSOA = LST.IDPESSOA) ' + #13 +
                  '   AND (ST.IDRESPONSAVEL = RST.IDPESSOA) ' + #13 +
                  ' ORDER BY ST.IDSAIDATEMPORARIA ';
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlMovSaidaTemporaria.ListaSaidaTempBens(nEmpresaProp, nIdSaidaTemporaria : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT STB.IDSAIDATEMPORARIA, STB.IDPESSOA, STB.IDBEM, ' + #13 +
           '        B.PLACA, B.DESBEM, ' + #13 +
           '        STB.STBCUSTO, STB.STBDATARETORNO ' + #13 +
           ' FROM SAIDATEMPBENS STB, ' + #13 +
           '      BEM B ' + #13 +
           ' WHERE (STB.IDSAIDATEMPORARIA = ' + floattostr(nIdSaidaTemporaria) + ') ' + #13 +
           '   AND (STB.IDPESSOA = ' + floattostr(nEmpresaProp)  + ') ' + #13 +
           '   AND (STB.IDBEM = B.IDBEM) ' + #13 +
           '   AND (STB.IDPESSOA = B.IDPESSOA) ' + #13+
           ' ORDER BY STB.IDSAIDATEMPORARIA, STB.IDBEM ' + #13;
   //-------------------------------------------------------------------------------------
   Result := GetDataPacket(sSql);
end;

function TCtrlMovSaidaTemporaria.ListaSaidaTempBensRet(nEmpresaProp, nIdSaidaTemporaria : Extended): OleVariant;
var
   sSql : String;

begin
   sSql := ' SELECT STB.IDSAIDATEMPORARIA,                                           ' + #13 +
           '        B.IDPESSOA,                                                      ' + #13 +
           '        B.IDBEM,                                                         ' + #13 +
           '        B.PLACA,                                                         ' + #13 +
           '        B.DESBEM,                                                        ' + #13 +
           '        DECODE(STB.STBDATARETORNO,NULL,0,1) AS MARCADO,                  ' + #13 +
           '        STB.STBDATARETORNO                                               ' + #13 +
           ' FROM SAIDATEMPBENS STB,                                                 ' + #13 +
           '      BEM B                                                              ' + #13 +
           ' WHERE (STB.IDSAIDATEMPORARIA = ' + floattostr(nIdSaidaTemporaria) + ' ) ' + #13 +
           '   AND (STB.IDPESSOA = ' + floattostr(nEmpresaProp) + ')                 ' + #13 +
           '   AND (STB.IDBEM = B.IDBEM)                                             ' + #13 +
           '   AND (STB.IDPESSOA = B.IDPESSOA)                                       ' + #13 +
           ' ORDER BY B.PLACA                                                        ' + #13 ;
   Result := GetDataPacket(sSql);
end;

function TCtrlMovSaidaTemporaria.AplicaOperacao(sTipoOperacao: String): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaOperacaoSAIDATEMPORARIA(sTipoOperacao,
                                                                   Fcds.Data,
                                                                   FcdsSaidaTempBens.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         if sTipoOperacao = 'E' then // Inclusão e Alteração
         begin
            if not ApplyCds(Fcds,_dbSaidaTemporaria,[],[]) then
               Raise Exception.Create(_dbSaidaTemporaria.MessageInfo);

            if not ApplyCds(FcdsSaidaTempBens,_dbSaidaTempBens,[_dbSaidaTemporaria.IdSaidaTemporaria],[_dbSaidaTempBens.IdSaidaTemporaria]) then
               Raise Exception.Create(_dbSaidaTempBens.MessageInfo);
         end else // Remoção
         begin
            if not ApplyCds(FcdsSaidaTempBens,_dbSaidaTempBens,[_dbSaidaTemporaria.IdSaidaTemporaria],[_dbSaidaTempBens.IdSaidaTemporaria]) then
               Raise Exception.Create(_dbSaidaTempBens.MessageInfo);

            if not ApplyCds(Fcds,_dbSaidaTemporaria,[],[]) then
               Raise Exception.Create(_dbSaidaTemporaria.MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception Do
         begin
            Rollback;
            MessageInfo := E.Message;
            Result := False;
         end;
      end;
   end;
end;

function TCtrlMovSaidaTemporaria.ExecutaTermoSaidaTemporaria(nEmpresaProp, nSaidaTemporaria : Extended;
                                                             dDataMov : TDateTime) : Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ExecutaTermoSaidaTemporaria(nEmpresaProp,
                                                                 nSaidaTemporaria,
                                                                 dDataMov,
                                                                 Fcds.Data,
                                                                 FcdsSaidaTempBens.Data);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         if nEmpresaProp <= 0 then
            Raise Exception.Create(CMTranslate('É obrigatório fornecer a EMPRESA PROPRIETÁRIA do Bem!'))
         else
            if nEmpresaProp <> Fcds.FieldByName('IDPESSOA').AsFloat then
               Raise Exception.Create(CMTranslate('Somente a empresa proprietária que cadastrou o termo pode manipulá-lo'));
         //-------------------------------------------------------------------------------
         // Marca os bens do termo em saída temporária
         //-------------------------------------------------------------------------------
         FcdsSaidaTempBens.First;
         while not FcdsSaidaTempBens.Eof do
         begin
            if not SetaFlgSaidaTempBem(FcdsSaidaTempBens.FieldByName('IDPESSOA').AsFloat,
                                       FcdsSaidaTempBens.FieldByName('IDBEM').AsFloat, 1) then
               raise Exception.Create(MessageInfo);
            FcdsSaidaTempBens.Next;
         end;
         //-------------------------------------------------------------------------------
         // Seta o Flag de Saída Temporária como executado
         //-------------------------------------------------------------------------------
         _dMTBem.sqlExecutaTermoSaidaTemp.Prepare;
         _dMTBem.sqlExecutaTermoSaidaTemp.ParamByName('STPFLGEXEC').AsInteger := 1;
         _dMTBem.sqlExecutaTermoSaidaTemp.ParamByName('STPDATA').AsDateTime := dDataMov;
         _dMTBem.sqlExecutaTermoSaidaTemp.ParamByName('IDPESSOA').AsFloat := nEmpresaProp;
         _dMTBem.sqlExecutaTermoSaidaTemp.ParamByName('IDSAIDATEMPORARIA').AsFloat := nSaidaTemporaria;
         if not ExecSQL(_dMTBem.sqlExecutaTermoSaidaTemp.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception do
         begin
            RollBack;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TCtrlMovSaidaTemporaria.ProcessaRetornoTermoSaidaTemp(nEmpresaProp, nBem : Extended;
                                                               nSaidaTemporaria : Extended;
                                                               dDataRetorno : TDateTime) : Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.ProcessaRetornoTermoSaidaTemp(nEmpresaProp, nBem, 
                                                                   nSaidaTemporaria, dDataRetorno);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Marca o retorno do bem da Saída Temporária no Termo
         //-------------------------------------------------------------------------------
         _dMTBem.sqlRegDataRetSaidaTemp.Prepare;
         _dMTBem.sqlRegDataRetSaidaTemp.ParamByName('IDPESSOA').AsFloat          := nEmpresaProp;
         _dMTBem.sqlRegDataRetSaidaTemp.ParamByName('IDSAIDATEMPORARIA').AsFloat := nSaidaTemporaria;
         _dMTBem.sqlRegDataRetSaidaTemp.ParamByName('IDBEM').AsFloat             := nBem;
         if dDataRetorno > 0 then
            _dMTBem.sqlRegDataRetSaidaTemp.ParamByName('STBDATARETORNO').AsDateTime := dDataRetorno
         else
            _dMTBem.sqlRegDataRetSaidaTemp.ParamByName('STBDATARETORNO').Clear;
         if not ExecSQL(_dMTBem.sqlRegDataRetSaidaTemp.SQLChanged, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         // Marca o bem
         //-------------------------------------------------------------------------------
         if dDataRetorno > 0 then
         begin
            if not SetaFlgSaidaTempBem(nEmpresaProp, nBem, 0) then
               raise Exception.Create(MessageInfo)
         end else
         begin
            if not SetaFlgSaidaTempBem(nEmpresaProp, nBem, 1) then
               raise Exception.Create(MessageInfo);
         end;      
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception do
         begin
            RollBack;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TCtrlMovSaidaTemporaria.SetaFlgSaidaTempBem(nEmpresaProp, nBem : Extended; iFlg : Integer) : Boolean;
begin
   try
      _dMTBem.sqlSetaFlgSaidaTempBem.Prepare;
      _dMTBem.sqlSetaFlgSaidaTempBem.ParamByName('IDPESSOA').AsFloat       := nEmpresaProp;
      _dMTBem.sqlSetaFlgSaidaTempBem.ParamByName('IDBEM').AsFloat          := nBem;
      _dMTBem.sqlSetaFlgSaidaTempBem.ParamByName('FLGSAIDATEMP').AsInteger := iFlg;
      if not ExecSQL(_dMTBem.sqlSetaFlgSaidaTempBem.SQLChanged, True) then
         Raise Exception.Create(MessageInfo);
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MessageInfo := E.Message;
      end;
   end;
end;

function TCtrlMovSaidaTemporaria.PesquisaTermoSaidaTempxBem(nEmpresaProp, nBem : Extended) : Extended;
var
   sSql : String;

begin
   sSql := ' SELECT IDSAIDATEMPORARIA       ' + #13 +
           ' FROM SAIDATEMPBENS             ' + #13 +
           ' WHERE (IDBEM    = ' + floattostr(nBem) + ')      ' + #13 +
           '   AND (IDPESSOA = ' + floattostr(nEmpresaProp) + ')   ' + #13 +
           '   AND (STBDATARETORNO IS NULL) ' + #13 +
           ' ORDER BY IDSAIDATEMPORARIA DESC ';
   _cds.Data := GetDataPacket(sSql);
   //-------------------------------------------------------------------------------------
   if _cds.IsEmpty then
      Result := -1
   else
      Result := _cds.FieldByName('IDSAIDATEMPORARIA').AsFloat;
end;

function TCtrlMovSaidaTemporaria.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.
