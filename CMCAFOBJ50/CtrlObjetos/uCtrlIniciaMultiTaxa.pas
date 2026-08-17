unit uCtrlIniciaMultiTaxa;

interface

Uses DB, uCmDbObject, uCmControlObject, wwStoreP,
     SysUtils, dbclient, Provider, uMidasUtil, uCMTypes,
     uDBGrupoTaxaDep, dMTBem,
     uCtrlBem, uCtrlGrupoContab;

Type
   TCtrlIniciaMultiTaxa = class(TCmControlObject)

   Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer; Override;
      procedure AfterInitialize; Override;

   Private
      //----------------------------------------------------------------------------------
      // Classes de Persistência
      //----------------------------------------------------------------------------------
      _dMTBem : tdtmMTBem;

      _dbGrupoTaxaDep : TDBGrupoTaxaDep;

      FcdsGrupoTaxaDep: TClientDataSet;
      FcdsAcrescimoValor: TClientDataSet;
      FcdsReavaliacao: TClientDataSet;
      FcdsPais: TClientDataSet;

      //----------------------------------------------------------------------------------
      // Barra de Progresso
      //----------------------------------------------------------------------------------
      iPrgBarPos: Integer;
      iPrgBarMax: Integer;
      sPrgBarMsg: String;

      Bem : TCtrlBem;
      GrupoContab : TCtrlGrupoContab;

      //----------------------------------------------------------------------------------
      procedure SetcdsGrupoTaxaDep(const Value: TClientDataSet);
      procedure SetcdsAcrescimoValor(const Value: TClientDataSet);
      procedure SetcdsReavaliacao(const Value: TClientDataSet);
      procedure SetcdsPais(const Value: TClientDataSet);

      function CMTranslate(sIgor : String) : String;

   Public
      property cdsGrupoTaxaDep   : TClientDataSet read FcdsGrupoTaxaDep write SetCdsGrupoTaxaDep;
      property cdsReavaliacao    : TClientDataSet read FcdsReavaliacao write SetcdsReavaliacao;
      property cdsAcrescimoValor : TClientDataSet read FcdsAcrescimoValor write SetcdsAcrescimoValor;
      property cdsPais           : TClientDataSet read FcdsPais write SetcdsPais;
      //----------------------------------------------------------------------------------
      // Métodos
      //----------------------------------------------------------------------------------
      constructor Create;  Override;
      destructor  Destroy; Override;
      //----------------------------------------------------------------------------------
      function Executar(nEmpresaProp, nMoedaO, nMoedaF, nMoedaG : Extended;
                        sBilhete : String) : Boolean;
      function MultiTaxaBeta2Plena(nEmpresaProp : Extended) : Boolean;
   end;

implementation

{ TCtrlIniciaMultiTaxa }

constructor TCtrlIniciaMultiTaxa.Create;
begin
   inherited;
   _dMTBem := TdtmMTBem.Create(Self);

   _dbGrupoTaxaDep := TDBGrupoTaxaDep.Create(Self);

   FcdsGrupoTaxaDep := TClientDataSet.Create(nil);
   FcdsPais := TClientDataSet.Create(nil);

   Bem := TCtrlBem.Create;
   GrupoContab := TcTrlGrupoContab.Create;
end;

destructor TCtrlIniciaMultiTaxa.Destroy;
begin
   if IsAppServer then
      FreeCDS([FcdsGrupoTaxaDep]);

   FcdsPais.Free;

   _dMTBem.Free;

   _dbGrupoTaxaDep.Free;

   Bem.Free;
   GrupoContab.Free;

   inherited;
end;

procedure TCtrlIniciaMultiTaxa.AfterInitialize;
begin
   inherited;
   Bem.InitializeAs(Self);
   GrupoContab.InitializeAs(Self);
end;

procedure TCtrlIniciaMultiTaxa.DoChangeDataBase;
begin
   inherited;
   _dbGrupoTaxaDep.DataBaseName := DataBaseName;
end;

procedure TCtrlIniciaMultiTaxa.OnCreateAppServer;
begin
   inherited;
   FcdsGrupoTaxaDep := TClientDataSet.Create(nil);
   FcdsPais := TClientDataSet.Create(nil);
end;
//========================================================================================
// Transfere os dados dos clientes já implantados da versão MultiTaxa Beta para a Plena
//----------------------------------------------------------------------------------------
function TCtrlIniciaMultiTaxa.MultiTaxaBeta2Plena(nEmpresaProp: Extended): Boolean;
var
   iMoedaOficial, iGrupo : Integer;
   sSql : String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.MultiTaxaBeta2Plena(nEmpresaProp);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Processar as Moedas
         //-------------------------------------------------------------------------------
         iMoedaOficial := -1;
         _cds.Data := GetDataPacket(' SELECT MOEDAOFICIAL, MOEDAFISCAL, MOEDAGERENCIAL ' +
                                    ' FROM PARAMETROSCAFMANUT ' +
                                    ' WHERE IDPESSOA = ' + floattostr(nEmpresaProp) );
         if not _cds.IsEmpty then
         begin
            if _cds.FieldByName('MOEDAOFICIAL').AsInteger > 0 then
            begin
               sSql := ' INSERT INTO CAFMOEDAS ' +
                       ' (MOECODIGO, IDPESSOA, IDTIPOMOEDA) ' +
                       ' VALUES (' + _cds.FieldByName('MOEDAOFICIAL').AsString + ',' +
                                 floattostr(nEmpresaProp) + ', 1)';
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
               //-------------------------------------------------------------------------
               iMoedaOficial := _cds.FieldByName('MOEDAOFICIAL').AsInteger;
            end;
            if _cds.FieldByName('MOEDAFISCAL').AsInteger > 0 then
            begin
               sSql := ' INSERT INTO CAFMOEDAS ' +
                       ' (MOECODIGO, IDPESSOA, IDTIPOMOEDA) ' +
                       ' VALUES (' + _cds.FieldByName('MOEDAFISCAL').AsString + ',' +
                                 floattostr(nEmpresaProp) + ', 2)';
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            if _cds.FieldByName('MOEDAGERENCIAL').AsInteger > 0 then
            begin
               sSql := ' INSERT INTO CAFMOEDAS ' +
                       ' (MOECODIGO, IDPESSOA, IDTIPOMOEDA) ' +
                       ' VALUES (' + _cds.FieldByName('MOEDAGERENCIAL').AsString + ',' +
                                 floattostr(nEmpresaProp) + ', 3)';
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
         end;
         //-------------------------------------------------------------------------------
         // Processar os Paises
         //-------------------------------------------------------------------------------
         _cds.Data := GetDataPacket(' SELECT GT.IDGRUPO, GT.IDTAXADEP, GT.DESCTAXADEP ' +
                                    ' FROM GRUPOTAXADEP GT, ' +
                                    '      GRUPO G ' +
                                    ' WHERE GT.IDPESSOA = ' + floattostr(nEmpresaProp) +
                                    '   AND G.TIPO = ' + #39 + 'A' + #39 +
                                    '   AND GT.IDGRUPO = G.IDGRUPO ' +
                                    ' ORDER BY IDGRUPO, IDTAXADEP ');
         if not _cds.IsEmpty then
         begin
            iGrupo := _cds.FieldByName('IDGRUPO').AsInteger;
            while (not _cds.eof) and (_cds.FieldByName('IDGRUPO').AsInteger = iGrupo) do
            begin
               FcdsPais.Data := GetDataPacket(' SELECT IDPAIS, NOMEPAIS ' +
                                              ' FROM PAIS ' +
                                              ' WHERE UPPER(NOMEPAIS) LIKE ' + #39 + '%' + UpperCase(Trim(_cds.FieldByName('DESCTAXADEP').AsString)) + '%' + #39 +
                                              ' ORDER BY NOMEPAIS ');
               if not FcdsPais.IsEmpty then
               begin
                  if _cds.FieldByName('IDTAXADEP').AsInteger = 1 then
                  begin
                     sSql := ' INSERT INTO CAFPAISES ' +
                             ' (IDCAFPAISES, IDPESSOA, IDPAIS, MOECODIGO, FLGCONTABIL) ' +
                             ' VALUES (' + _cds.FieldByName('IDTAXADEP').AsString + ',' +
                                       floattostr(nEmpresaProp) + ',' +
                                       FcdsPais.FieldByName('IDPAIS').AsString + ',' +
                                       inttostr(iMoedaOficial) + ', 1)';
                     if not ExecSQL(sSql, True) then
                        Raise Exception.Create(MessageInfo);
                  end else
                  begin
                     sSql := ' INSERT INTO CAFPAISES ' +
                             ' (IDCAFPAISES, IDPESSOA, IDPAIS, MOECODIGO, FLGCONTABIL) ' +
                             ' VALUES (' + _cds.FieldByName('IDTAXADEP').AsString + ',' +
                                       floattostr(nEmpresaProp) + ',' +
                                       FcdsPais.FieldByName('IDPAIS').AsString + ', 0, 1)';
                     if not ExecSQL(sSql, True) then
                        Raise Exception.Create(MessageInfo);
                  end;
               end;
               _cds.Next;
            end;
         end;
         //-------------------------------------------------------------------------------
         Commit;
         Result := True;
      except
         On E : Exception Do
         begin
            RollBack;
            Result := False;
         end;
      end;
   end;
end;
//========================================================================================
// Executa a conversão da modelagem
//----------------------------------------------------------------------------------------
function TCtrlIniciaMultiTaxa.Executar(nEmpresaProp, nMoedaO, nMoedaF, nMoedaG : Extended;
                                       sBilhete : String) : Boolean;
var
   nMoedaOficial, nMoedaFiscal, nMoedaGerencial : Extended;
   sSql : String;

begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.IniciaMultiTaxa(nEmpresaProp, nMoedaO, nMoedaF, nMoedaG);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
   end else
   begin
      //----------------------------------------------------------------------------------
      // Não executar se for implantação
      //----------------------------------------------------------------------------------
      OpenDataSet(' SELECT IDBEM, IDPESSOA, VALORG, CMBEM, VALFIS, VALGER, ' +
                  '        TAXADEP, DEPLANC, CMDEP, DEPFIS, DEPGER, DATAULTDEP, FLGDEPREC ' +
                  ' FROM BEM ' +
                  ' WHERE (IDPESSOA = ' + floattostr(nEmpresaProp) + ' )');
      if _lDataSet.IsEmpty then
      begin
         //-------------------------------------------------------------------------------
         // Atualiza os parametros do sistema, informando que os dados estão convertidos
         //-------------------------------------------------------------------------------
         sSql := ' UPDATE PARAMETROSCAFMANUT ' + #13 +
                 ' SET DTAINICAFMT = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',date) + #39 + ' , ' + #39 + 'DD/MM/YYYY' + #39 + ')' + #13 +
                 ' WHERE (IDPESSOA = ' + floattostr(nEmpresaProp) + ') ';
         if not ExecSQL(sSql, False) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         Result := True;
         Exit;
      end;
      //----------------------------------------------------------------------------------
      nMoedaOficial   := nMoedaO;
      nMoedaFiscal    := nMoedaF;
      nMoedaGerencial := nMoedaG;
      //----------------------------------------------------------------------------------
      try
         StartTransaction;
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := CMTranslate('Iniciando Base...');
            iPrgBarMax  := 1;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Se a Moeda Oficial estiver indefinida, alterar para o codigo da moeda 'REAL'
         // que estiver na tabela MOEDAS
         //-------------------------------------------------------------------------------
         if nMoedaOficial = 0 then
         begin
            _cds.Data := GetDataPacket(' SELECT G.MOEDACORRENTE, M.MOEDESC, ' +
                                       '        M.NUMDECIMAIS, ' +
                                       '        DECODE(M.FLGARREDONDA,''S'',1,0) AS FLGARREDONDA ' +
                                       ' FROM PARAMGLOBAL G, ' +
                                       '      MOEDA M ' +
                                       ' WHERE G.IDPESSOA = ' + floattostr(nEmpresaProp) +
                                       '   AND G.MOEDACORRENTE = M.MOECODIGO ');
            if not _cds.IsEmpty then
               nMoedaOficial := _cds.FieldByName('MOEDACORRENTE').AsFloat
            else
               Raise Exception.Create(CMTranslate('A moeda oficial não está cadastrada nos Parâmetros do GlobalCM !'));
            //----------------------------------------------------------------------------
            sSql := ' UPDATE PARAMETROSCAFMANUT ' + #13 +
                    ' SET MOEDAOFICIAL = ' + floattostr(nMoedaOficial) +
                    ' WHERE (IDPESSOA = ' + floattostr(nEmpresaProp) + ' ) ';
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Se a Moeda Oficial estiver definida como Moeda Fiscal e/ou Gerencial, definir
         // a moeda como nula
         //-------------------------------------------------------------------------------
         if nMoedaFiscal = nMoedaOficial then
         begin
            nMoedaFiscal := -1;
            sSql := ' UPDATE PARAMETROSCAFMANUT ' + #13 +
                    ' SET MOEDAFISCAL = NULL ' +
                    ' WHERE (IDPESSOA = ' + floattostr(nEmpresaProp) + ' ) ';
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         if nMoedaGerencial = nMoedaOficial then
         begin
            nMoedaGerencial := -1;
            sSql := ' UPDATE PARAMETROSCAFMANUT ' + #13 +
                    ' SET MOEDAGERENCIAL = NULL ' +
                    ' WHERE (IDPESSOA = ' + floattostr(nEmpresaProp) + ' ) ';
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
         end;
         //-------------------------------------------------------------------------------
         // Alimenta a tabela GRUPOTAXADEP
         //-------------------------------------------------------------------------------
         FcdsGrupoTaxaDep.Data := GrupoContab.ListaGrupoTaxaDep(0,0);
         _cds.Data := GetDataPacket(' SELECT G.IDGRUPO, PG.IDPESSOA, G.DEPRECIACAO ' +
                                    ' FROM GRUPO G, ' +
                                    '      PLANOGRUPO PG ' +
                                    ' WHERE PG.IDPESSOA = ' + floattostr(nEmpresaProp) +
                                    '   AND PG.IDGRUPO = G.IDGRUPO');
         while not _cds.EOF do
         begin
            FcdsGrupoTaxaDep.Append;
            FcdsGrupoTaxaDep.FieldByName('IDGRUPO').asFloat      := _cds.FieldByName('IDGRUPO').AsFloat;
            FcdsGrupoTaxaDep.FieldByName('IDPESSOA').asFloat     := _cds.FieldByName('IDPESSOA').AsFloat;
            FcdsGrupoTaxaDep.FieldByName('IDTAXADEP').asInteger  := 1;
            FcdsGrupoTaxaDep.FieldByName('TAXADEP').asFloat      := _cds.FieldByName('DEPRECIACAO').AsFloat;
            FcdsGrupoTaxaDep.FieldByName('DESCTAXADEP').asString := 'Brasil';
            FcdsGrupoTaxaDep.Post;
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         if not ApplyCds(FcdsGrupoTaxaDep,_dbGrupoTaxaDep,[],[]) then
            Raise Exception.Create(_dbGrupoTaxaDep.MessageInfo);
         //-------------------------------------------------------------------------------
         // Alimenta a tabela HISTORICOMOVIMENTACAO com dados do subtipo BAIXABEM
         //-------------------------------------------------------------------------------
         sSql := ' SELECT BB.IDMOVIMENTACAO, BB.IDMOTIVOBAIXA, BB.PROPBAIXAR, BB.OBS ' +
                 ' FROM BAIXABEM BB, ' +
                 '      HISTORICOMOVIMENTACAO HM ' +
                 ' WHERE (HM.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' +
                 '   AND (BB.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ' ;
         _cds.Data := GetDataPacket(sSql);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := CMTranslate('Processando SubTipos (1)...');
            iPrgBarMax  := _cds.RecordCount;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         DecimalSeparator := '.';
         while not _cds.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Processando SubTipos (1)... (') + inttostr(iPrgBarPos) + '/' + inttostr(iPrgBarMax)+')';
               iPrgBarPos  := iPrgBarPos + 1;
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            sSql := ' UPDATE HISTORICOMOVIMENTACAO ' + #13  +
                    ' SET IDMOTIVOBAIXA = ' + _cds.FieldByName('IDMOTIVOBAIXA').AsString + ' , ' + #13 +
                    '     PROPBAIXA     = ' + _cds.FieldByName('PROPBAIXAR').AsString + ' , ' + #13 +
                    '     OBSBAIXA      = ' + #39 + _cds.FieldByName('OBS').AsString + #39 + #13 +
                    ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ') ';
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         DecimalSeparator := ',';
         //-------------------------------------------------------------------------------
         // Alimenta a tabela HISTORICOMOVIMENTACAO com dados do subtipo ACRESCVALOR
         //-------------------------------------------------------------------------------
         sSql := ' SELECT AV.IDMOVIMENTACAO, AV.IDTIPODESPESA, AV.OBS ' +
                 ' FROM ACRESCVALOR AV, ' +
                 '      HISTORICOMOVIMENTACAO HM ' +
                 ' WHERE (HM.IDPESSOA = ' + floattostr(nEmpresaProp) + ') ' +
                 '   AND (AV.IDMOVIMENTACAO = HM.IDMOVIMENTACAO) ';
         _cds.Data := GetDataPacket(sSql);
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := CMTranslate('Processando SubTipos (2)...');
            iPrgBarMax  := _cds.RecordCount;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         while not _cds.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Processando SubTipos (2)... (')+inttostr(iPrgBarPos)+'/'+inttostr(iPrgBarMax)+')';
               iPrgBarPos  := iPrgBarPos + 1;
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            sSql := ' UPDATE HISTORICOMOVIMENTACAO ' + #13  +
                    ' SET IDTIPODESPESA = ' + _cds.FieldByName('IDTIPODESPESA').AsString + ' , ' + #13 +
                    '     OBSACRESCIMO  = ' + #39 + _cds.FieldByName('OBS').AsString + #39 + #13 +
                    ' WHERE (IDMOVIMENTACAO = ' + _cds.FieldByName('IDMOVIMENTACAO').AsString + ') ';
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            _cds.Next;
         end;
         //-------------------------------------------------------------------------------
         // Alimenta as tabelas BEMXMOEDA e BEMXDEP
         //-------------------------------------------------------------------------------
         OpenDataSet(' SELECT IDBEM, IDPESSOA, VALORG, CMBEM, VALFIS, VALGER, ' +
                     '        TAXADEP, DEPLANC, CMDEP, DEPFIS, DEPGER, DATAULTDEP, FLGDEPREC ' +
                     ' FROM BEM ' +
                     ' WHERE (IDPESSOA = ' + floattostr(nEmpresaProp) + ' )');
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := CMTranslate('Processando Bens...');
            iPrgBarMax  := _lDataSet.RecordCount;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Inicializar os SQLParams
         //-------------------------------------------------------------------------------
         _dMTBem.sqlIniciaMTMoeda.SQL.Text := ' INSERT INTO BEMXMOEDA (IDBEM, IDPESSOA,          ' +
                                              '                        MOECODIGO, VALORG,        ' +
                                              '                        CMBEM, DATAULTCM)         ' +
                                              '                VALUES (:IDBEM, :IDPESSOA,        ' +
                                              '                        :MOECODIGO, :VALORG,      ' +
                                              '                        :CMBEM, :DATAULTCM)       ';
         _dMTBem.sqlIniciaMTDep.SQL.Text :=   ' INSERT INTO BEMXDEP (IDBEM, IDPESSOA,            ' +
                                              '                      MOECODIGO, IDBEMXDEP,       ' +
                                              '                      TAXADEP, DEPLANC, CMDEP,    ' +
                                              '                      DATAULTDEP, DATAULTCM,      ' +
                                              '                      FLGDEPREC)                  ' +
                                              '              VALUES (:IDBEM, :IDPESSOA,          ' +
                                              '                      :MOECODIGO, :IDBEMXDEP,     ' +
                                              '                      :TAXADEP, :DEPLANC, :CMDEP, ' +
                                              '                      :DATAULTDEP, :DATAULTCM,    ' +
                                              '                      :FLGDEPREC)                 ';
         //-------------------------------------------------------------------------------
         while not _lDataSet.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Processando Bens... (')+inttostr(iPrgBarPos)+'/'+inttostr(iPrgBarMax)+')';
               iPrgBarPos  := iPrgBarPos + 1;
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            // Processa a Moeda Oficial
            //----------------------------------------------------------------------------
            _dMTBem.sqlIniciaMTMoeda.Prepare;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('IDBEM').asFloat        := _lDataSet.FieldByName('IDBEM').AsFloat;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('IDPESSOA').asFloat     := _lDataSet.FieldByName('IDPESSOA').AsFloat;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('MOECODIGO').asFloat    := nMoedaOficial;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('VALORG').asFloat       := _lDataSet.FieldByName('VALORG').AsFloat;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('CMBEM').asFloat        := _lDataSet.FieldByName('CMBEM').AsFloat;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('DATAULTCM').asDateTime := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
            if not ExecSQL(_dMTBem.sqlIniciaMTMoeda.SQLChanged,False) then
               Raise Exception.Create(CMTranslate('Registrando BemxMoeda') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            _dMTBem.sqlIniciaMTDep.Prepare;
            _dMTBem.sqlIniciaMTDep.ParamByName('IDBEM').asFloat         := _lDataSet.FieldByName('IDBEM').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('IDPESSOA').asFloat      := _lDataSet.FieldByName('IDPESSOA').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('MOECODIGO').asFloat     := nMoedaOficial;
            _dMTBem.sqlIniciaMTDep.ParamByName('IDBEMXDEP').asInteger   := 1;
            _dMTBem.sqlIniciaMTDep.ParamByName('TAXADEP').asFloat       := _lDataSet.FieldByName('TAXADEP').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('DEPLANC').asFloat       := _lDataSet.FieldByName('DEPLANC').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('CMDEP').asFloat         := _lDataSet.FieldByName('CMDEP').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTDEP').asDateTime := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
            _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
            _dMTBem.sqlIniciaMTDep.ParamByName('FLGDEPREC').asInteger   := _lDataSet.FieldByName('FLGDEPREC').AsInteger;
            if not ExecSQL(_dMTBem.sqlIniciaMTDep.SQLChanged,False) then
               Raise Exception.Create(CMTranslate('Registrando BemxDep') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            // Processa a Moeda Fiscal, se for definida
            //----------------------------------------------------------------------------
            if nMoedaFiscal > 0 then
            begin
               _dMTBem.sqlIniciaMTMoeda.Prepare;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('IDBEM').asFloat     := _lDataSet.FieldByName('IDBEM').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('IDPESSOA').asFloat  := _lDataSet.FieldByName('IDPESSOA').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('MOECODIGO').asFloat := nMoedaFiscal;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('VALORG').asFloat    := _lDataSet.FieldByName('VALFIS').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('CMBEM').asFloat     := 0;
               if not ExecSQL(_dMTBem.sqlIniciaMTMoeda.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando BemxMoeda') + #13 + MessageInfo);
               //-------------------------------------------------------------------------
               _dMTBem.sqlIniciaMTDep.Prepare;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDBEM').asFloat         := _lDataSet.FieldByName('IDBEM').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDPESSOA').asFloat      := _lDataSet.FieldByName('IDPESSOA').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('MOECODIGO').asFloat     := nMoedaFiscal;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDBEMXDEP').asInteger   := 1;
               _dMTBem.sqlIniciaMTDep.ParamByName('TAXADEP').asFloat       := _lDataSet.FieldByName('TAXADEP').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('DEPLANC').asFloat       := _lDataSet.FieldByName('DEPFIS').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('CMDEP').asFloat         := 0;
               _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTDEP').asDateTime := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               _dMTBem.sqlIniciaMTDep.ParamByName('FLGDEPREC').asInteger   := _lDataSet.FieldByName('FLGDEPREC').AsInteger;
               if not ExecSQL(_dMTBem.sqlIniciaMTDep.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando BemxDep') + #13 + MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Processa a Moeda Gerencial, se for definida
            //----------------------------------------------------------------------------
            if nMoedaGerencial > 0 then
            begin
               _dMTBem.sqlIniciaMTMoeda.Prepare;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('IDBEM').asFloat      := _lDataSet.FieldByName('IDBEM').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('IDPESSOA').asFloat   := _lDataSet.FieldByName('IDPESSOA').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('MOECODIGO').asFloat  := nMoedaGerencial;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('VALORG').asFloat     := _lDataSet.FieldByName('VALGER').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('CMBEM').asFloat      := 0;
               if not ExecSQL(_dMTBem.sqlIniciaMTMoeda.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando BemxMoeda') + #13 + MessageInfo);
               //-------------------------------------------------------------------------
               _dMTBem.sqlIniciaMTDep.Prepare;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDBEM').asFloat         := _lDataSet.FieldByName('IDBEM').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDPESSOA').asFloat      := _lDataSet.FieldByName('IDPESSOA').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('MOECODIGO').asFloat     := nMoedaGerencial;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDBEMXDEP').asInteger   := 1;
               _dMTBem.sqlIniciaMTDep.ParamByName('TAXADEP').asFloat       := _lDataSet.FieldByName('TAXADEP').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('DEPLANC').asFloat       := _lDataSet.FieldByName('DEPGER').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('CMDEP').asFloat         := 0;
               _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTDEP').asDateTime := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               _dMTBem.sqlIniciaMTDep.ParamByName('FLGDEPREC').asInteger   := _lDataSet.FieldByName('FLGDEPREC').AsInteger;
               if not ExecSQL(_dMTBem.sqlIniciaMTDep.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando BemxDep') + #13 + MessageInfo);
            end;
            //----------------------------------------------------------------------------
            _lDataSet.Next;
         end;
         //-------------------------------------------------------------------------------
         // Alimenta as tabelas REAVALXMOEDA e REAVALXDEP
         //-------------------------------------------------------------------------------
         _lDataSet.Close;
         OpenDataSet(' SELECT IDREAVALIACAO, IDMOVIMENTACAO, VALORG, CMBEM, VALFIS, VALGER, ' +
                     '        TAXADEP, DEPLANC, CMDEP, DEPFIS, DEPGER, DATAULTDEP, FLGDEPREC ' +
                     ' FROM REAVALIACAO ' +
                     ' WHERE (IDPESSOA = ' + floattostr(nEmpresaProp) + ' )' +
                     ' ORDER BY IDREAVALIACAO' );
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := CMTranslate('Processando Reavaliações...');
            iPrgBarMax  := _lDataSet.RecordCount;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Inicializar os SQLParams
         //-------------------------------------------------------------------------------
         _dMTBem.sqlIniciaMTMoeda.SQL.Text := ' INSERT INTO REAVALXMOEDA (IDREAVALIACAO,            ' +
                                              '                           MOECODIGO, VALORG,        ' +
                                              '                           CMBEM, DATAULTCM)         ' +
                                              '                   VALUES (:IDREAVALIACAO,           ' +
                                              '                           :MOECODIGO, :VALORG,      ' +
                                              '                           :CMBEM, :DATAULTCM)       ';
         _dMTBem.sqlIniciaMTDep.SQL.Text :=   ' INSERT INTO REAVALXDEP (IDREAVALIACAO,              ' +
                                              '                         MOECODIGO, IDREAVALXDEP,    ' +
                                              '                         TAXADEP, DEPLANC, CMDEP,    ' +
                                              '                         DATAULTDEP, DATAULTCM,      ' +
                                              '                         FLGDEPREC)                  ' +
                                              '                 VALUES (:IDREAVALIACAO,             ' +
                                              '                         :MOECODIGO, :IDREAVALXDEP,  ' +
                                              '                         :TAXADEP, :DEPLANC, :CMDEP, ' +
                                              '                         :DATAULTDEP, :DATAULTCM,    ' +
                                              '                         :FLGDEPREC)                 ';
         //-------------------------------------------------------------------------------
         while not _lDataSet.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Processando Reavaliações... (')+inttostr(iPrgBarPos)+'/'+inttostr(iPrgBarMax)+')';
               iPrgBarPos  := iPrgBarPos + 1;
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            // Processa a Moeda Oficial
            //----------------------------------------------------------------------------
            _dMTBem.sqlIniciaMTMoeda.Prepare;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('IDREAVALIACAO').asFloat := _lDataSet.FieldByName('IDREAVALIACAO').AsFloat;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('MOECODIGO').asFloat     := nMoedaOficial;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('VALORG').asFloat        := _lDataSet.FieldByName('VALORG').AsFloat;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('CMBEM').asFloat         := _lDataSet.FieldByName('CMBEM').AsFloat;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
            if not ExecSQL(_dMTBem.sqlIniciaMTMoeda.SQLChanged,False) then
               Raise Exception.Create(CMTranslate('Registrando ReavalxMoeda') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            _dMTBem.sqlIniciaMTDep.Prepare;
            _dMTBem.sqlIniciaMTDep.ParamByName('IDREAVALIACAO').asFloat := _lDataSet.FieldByName('IDREAVALIACAO').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('MOECODIGO').asFloat     := nMoedaOficial;
            _dMTBem.sqlIniciaMTDep.ParamByName('IDREAVALXDEP').asInteger   := 1;
            _dMTBem.sqlIniciaMTDep.ParamByName('TAXADEP').asFloat       := _lDataSet.FieldByName('TAXADEP').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('DEPLANC').asFloat       := _lDataSet.FieldByName('DEPLANC').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('CMDEP').asFloat         := _lDataSet.FieldByName('CMDEP').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTDEP').asDateTime := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
            _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
            _dMTBem.sqlIniciaMTDep.ParamByName('FLGDEPREC').asInteger   := _lDataSet.FieldByName('FLGDEPREC').AsInteger;
            if not ExecSQL(_dMTBem.sqlIniciaMTDep.SQLChanged,False) then
               Raise Exception.Create(CMTranslate('Registrando ReavalxDep') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            // Processa a Moeda Fiscal, se for definida
            //----------------------------------------------------------------------------
            if nMoedaFiscal > 0 then
            begin
               _dMTBem.sqlIniciaMTMoeda.Prepare;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('IDREAVALIACAO').asFloat := _lDataSet.FieldByName('IDREAVALIACAO').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('MOECODIGO').asFloat     := nMoedaFiscal;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('VALORG').asFloat        := _lDataSet.FieldByName('VALFIS').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('CMBEM').asFloat         := _lDataSet.FieldByName('CMBEM').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               if not ExecSQL(_dMTBem.sqlIniciaMTMoeda.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando ReavalxMoeda') + #13 + MessageInfo);
               //-------------------------------------------------------------------------
               _dMTBem.sqlIniciaMTDep.Prepare;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDREAVALIACAO').asFloat := _lDataSet.FieldByName('IDREAVALIACAO').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('MOECODIGO').asFloat     := nMoedaFiscal;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDREAVALXDEP').asInteger   := 1;
               _dMTBem.sqlIniciaMTDep.ParamByName('TAXADEP').asFloat       := _lDataSet.FieldByName('TAXADEP').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('DEPLANC').asFloat       := _lDataSet.FieldByName('DEPFIS').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('CMDEP').asFloat         := _lDataSet.FieldByName('CMDEP').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTDEP').asDateTime := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               _dMTBem.sqlIniciaMTDep.ParamByName('FLGDEPREC').asInteger   := _lDataSet.FieldByName('FLGDEPREC').AsInteger;
               if not ExecSQL(_dMTBem.sqlIniciaMTDep.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando ReavalxDep') + #13 + MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Processa a Moeda Gerencial, se for definida
            //----------------------------------------------------------------------------
            if nMoedaGerencial > 0 then
            begin
               _dMTBem.sqlIniciaMTMoeda.Prepare;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('IDREAVALIACAO').asFloat := _lDataSet.FieldByName('IDREAVALIACAO').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('MOECODIGO').asFloat     := nMoedaGerencial;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('VALORG').asFloat        := _lDataSet.FieldByName('VALGER').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('CMBEM').asFloat         := _lDataSet.FieldByName('CMBEM').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               if not ExecSQL(_dMTBem.sqlIniciaMTMoeda.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando ReavalxMoeda') + #13 + MessageInfo);
               //-------------------------------------------------------------------------
               _dMTBem.sqlIniciaMTDep.Prepare;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDREAVALIACAO').asFloat := _lDataSet.FieldByName('IDREAVALIACAO').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('MOECODIGO').asFloat     := nMoedaGerencial;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDREAVALXDEP').asInteger   := 1;
               _dMTBem.sqlIniciaMTDep.ParamByName('TAXADEP').asFloat       := _lDataSet.FieldByName('TAXADEP').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('DEPLANC').asFloat       := _lDataSet.FieldByName('DEPGER').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('CMDEP').asFloat         := _lDataSet.FieldByName('CMDEP').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTDEP').asDateTime := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               _dMTBem.sqlIniciaMTDep.ParamByName('FLGDEPREC').asInteger   := _lDataSet.FieldByName('FLGDEPREC').AsInteger;
               if not ExecSQL(_dMTBem.sqlIniciaMTDep.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando ReavalxDep') + #13 + MessageInfo);
            end;
            //----------------------------------------------------------------------------
            sSql := ' UPDATE HISTORICOMOVIMENTACAO ' + #13  +
                    ' SET IDREAVALACRESC = ' + _lDataSet.FieldByName('IDREAVALIACAO').AsString + #13 +
                    ' WHERE (IDMOVIMENTACAO = ' + _lDataSet.FieldByName('IDMOVIMENTACAO').AsString + ') ';
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            _lDataSet.Next;
         end;
         //-------------------------------------------------------------------------------
         // Alimenta as tabelas AcrescValorxMoeda e AcrescValorxDep
         //-------------------------------------------------------------------------------
         _lDataSet.Close;
         OpenDataSet(' SELECT IDACRESCIMO, IDMOVIMENTACAO, VALORG, CMBEM, VALFIS, VALGER, ' +
                     '        TAXADEP, DEPLANC, CMDEP, DEPFIS, DEPGER, DATAULTDEP, FLGDEPREC ' +
                     ' FROM ACRESCIMOVALOR ' +
                     ' WHERE (IDPESSOA = ' + floattostr(nEmpresaProp) + ' )' +
                     ' ORDER BY IDACRESCIMO ');
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := CMTranslate('Processando Acréscimos...');
            iPrgBarMax  := _lDataSet.RecordCount;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         // Inicializar os SQLParams
         //-------------------------------------------------------------------------------
         _dMTBem.sqlIniciaMTMoeda.SQL.Text := ' INSERT INTO ACRESCVALORXMOEDA (IDACRESCIMO,              ' +
                                              '                                MOECODIGO, VALORG,        ' +
                                              '                                CMBEM, DATAULTCM)         ' +
                                              '                        VALUES (:IDACRESCIMO,             ' +
                                              '                                :MOECODIGO, :VALORG,      ' +
                                              '                                :CMBEM, :DATAULTCM)       ';
         _dMTBem.sqlIniciaMTDep.SQL.Text :=   ' INSERT INTO ACRESCVALORXDEP (IDACRESCIMO,                ' +
                                              '                              MOECODIGO, IDACRESCIMOXDEP,       ' +
                                              '                              TAXADEP, DEPLANC, CMDEP,    ' +
                                              '                              DATAULTDEP, DATAULTCM,      ' +
                                              '                              FLGDEPREC)                  ' +
                                              '                      VALUES (:IDACRESCIMO,               ' +
                                              '                              :MOECODIGO, :IDACRESCIMOXDEP,     ' +
                                              '                              :TAXADEP, :DEPLANC, :CMDEP, ' +
                                              '                              :DATAULTDEP, :DATAULTCM,    ' +
                                              '                              :FLGDEPREC)                 ';
         //-------------------------------------------------------------------------------
         while not _lDataSet.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Processando Acréscimos... (')+inttostr(iPrgBarPos)+'/'+inttostr(iPrgBarMax)+')';
               iPrgBarPos := iPrgBarPos + 1;
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            // Processa a Moeda Oficial
            //----------------------------------------------------------------------------
            _dMTBem.sqlIniciaMTMoeda.Prepare;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('IDACRESCIMO').asFloat   := _lDataSet.FieldByName('IDACRESCIMO').AsFloat;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('MOECODIGO').asFloat     := nMoedaOficial;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('VALORG').asFloat        := _lDataSet.FieldByName('VALORG').AsFloat;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('CMBEM').asFloat         := _lDataSet.FieldByName('CMBEM').AsFloat;
            _dMTBem.sqlIniciaMTMoeda.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
            if not ExecSQL(_dMTBem.sqlIniciaMTMoeda.SQLChanged,False) then
               Raise Exception.Create(CMTranslate('Registrando AcrescValorxMoeda') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            _dMTBem.sqlIniciaMTDep.Prepare;
            _dMTBem.sqlIniciaMTDep.ParamByName('IDACRESCIMO').asFloat := _lDataSet.FieldByName('IDACRESCIMO').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('MOECODIGO').asFloat     := nMoedaOficial;
            _dMTBem.sqlIniciaMTDep.ParamByName('IDACRESCIMOXDEP').asInteger := 1;
            _dMTBem.sqlIniciaMTDep.ParamByName('TAXADEP').asFloat       := _lDataSet.FieldByName('TAXADEP').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('DEPLANC').asFloat       := _lDataSet.FieldByName('DEPLANC').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('CMDEP').asFloat         := _lDataSet.FieldByName('CMDEP').AsFloat;
            _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTDEP').asDateTime := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
            _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
            _dMTBem.sqlIniciaMTDep.ParamByName('FLGDEPREC').asInteger   := _lDataSet.FieldByName('FLGDEPREC').AsInteger;
            if not ExecSQL(_dMTBem.sqlIniciaMTDep.SQLChanged,False) then
               Raise Exception.Create(CMTranslate('Registrando AcrescValorxDep') + #13 + MessageInfo);
            //----------------------------------------------------------------------------
            // Processa a Moeda Fiscal, se for definida
            //----------------------------------------------------------------------------
            if nMoedaFiscal > 0 then
            begin
               _dMTBem.sqlIniciaMTMoeda.Prepare;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('IDACRESCIMO').asFloat   := _lDataSet.FieldByName('IDACRESCIMO').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('MOECODIGO').asFloat     := nMoedaFiscal;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('VALORG').asFloat        := _lDataSet.FieldByName('VALFIS').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('CMBEM').asFloat         := _lDataSet.FieldByName('CMBEM').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               if not ExecSQL(_dMTBem.sqlIniciaMTMoeda.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando AcrescValorxMoeda') + #13 + MessageInfo);
               //-------------------------------------------------------------------------
               _dMTBem.sqlIniciaMTDep.Prepare;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDACRESCIMO').asFloat := _lDataSet.FieldByName('IDACRESCIMO').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('MOECODIGO').asFloat     := nMoedaFiscal;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDACRESCIMOXDEP').asInteger := 1;
               _dMTBem.sqlIniciaMTDep.ParamByName('TAXADEP').asFloat       := _lDataSet.FieldByName('TAXADEP').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('DEPLANC').asFloat       := _lDataSet.FieldByName('DEPFIS').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('CMDEP').asFloat         := _lDataSet.FieldByName('CMDEP').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTDEP').asDateTime := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               _dMTBem.sqlIniciaMTDep.ParamByName('FLGDEPREC').asInteger   := _lDataSet.FieldByName('FLGDEPREC').AsInteger;
               if not ExecSQL(_dMTBem.sqlIniciaMTDep.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando AcrescValorxDep') + #13 + MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Processa a Moeda Gerencial, se for definida
            //----------------------------------------------------------------------------
            if nMoedaGerencial > 0 then
            begin
               _dMTBem.sqlIniciaMTMoeda.Prepare;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('IDACRESCIMO').asFloat   := _lDataSet.FieldByName('IDACRESCIMO').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('MOECODIGO').asFloat     := nMoedaGerencial;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('VALORG').asFloat        := _lDataSet.FieldByName('VALGER').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('CMBEM').asFloat         := _lDataSet.FieldByName('CMBEM').AsFloat;
               _dMTBem.sqlIniciaMTMoeda.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               if not ExecSQL(_dMTBem.sqlIniciaMTMoeda.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando AcrescValorxMoeda') + #13 + MessageInfo);
               //-------------------------------------------------------------------------
               _dMTBem.sqlIniciaMTDep.Prepare;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDACRESCIMO').asFloat := _lDataSet.FieldByName('IDACRESCIMO').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('MOECODIGO').asFloat     := nMoedaGerencial;
               _dMTBem.sqlIniciaMTDep.ParamByName('IDACRESCIMOXDEP').asInteger := 1;
               _dMTBem.sqlIniciaMTDep.ParamByName('TAXADEP').asFloat       := _lDataSet.FieldByName('TAXADEP').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('DEPLANC').asFloat       := _lDataSet.FieldByName('DEPGER').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('CMDEP').asFloat         := _lDataSet.FieldByName('CMDEP').AsFloat;
               _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTDEP').asDateTime := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               _dMTBem.sqlIniciaMTDep.ParamByName('DATAULTCM').asDateTime  := _lDataSet.FieldByName('DATAULTDEP').AsDateTime;
               _dMTBem.sqlIniciaMTDep.ParamByName('FLGDEPREC').asInteger   := _lDataSet.FieldByName('FLGDEPREC').AsInteger;
               if not ExecSQL(_dMTBem.sqlIniciaMTDep.SQLChanged,False) then
                  Raise Exception.Create(CMTranslate('Registrando AcrescValorxDep') + #13 + MessageInfo);
            end;
            //----------------------------------------------------------------------------
            sSql := ' UPDATE HISTORICOMOVIMENTACAO ' + #13  +
                    ' SET IDREAVALACRESC = ' + _lDataSet.FieldByName('IDACRESCIMO').AsString + #13 +
                    ' WHERE (IDMOVIMENTACAO = ' + _lDataSet.FieldByName('IDMOVIMENTACAO').AsString + ') ';
            if not ExecSQL(sSql, True) then
               Raise Exception.Create(MessageInfo);
            //----------------------------------------------------------------------------
            _lDataSet.Next;
         end;
         //-------------------------------------------------------------------------------
         // Alimenta as tabelas HISTORICOMOVIMENTACAO, VLRHISTMOVBEM e HMBREAVAL
         //-------------------------------------------------------------------------------
         DecimalSeparator := '.';
         _lDataSet.Close;
         OpenDataSet(' SELECT IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, ' +
                     '        VALOFI, VALFIS, VALGER,             ' +
                     '        VALORGLAUDO, TAXADEPANT             ' +
                     ' FROM HISTORICOMOVIMENTACAO ' +
                     ' WHERE (IDPESSOA = ' + floattostr(nEmpresaProp) + ' )');
         //-------------------------------------------------------------------------------
         // Interface com a Aplicação Cliente (Barra de Progresso)
         //-------------------------------------------------------------------------------
         try
            sPrgBarMsg := CMTranslate('Processando Lançamentos...');
            iPrgBarMax  := _lDataSet.RecordCount;
            iPrgBarPos  := 0;
            DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
         except

         end;
         //-------------------------------------------------------------------------------
         while not _lDataSet.EOF do
         begin
            //----------------------------------------------------------------------------
            // Interface com a Aplicação Cliente (Barra de Progresso)
            //----------------------------------------------------------------------------
            try
               sPrgBarMsg := CMTranslate('Processando Lançamentos... (')+inttostr(iPrgBarPos)+'/'+inttostr(iPrgBarMax)+')';
               iPrgBarPos  := iPrgBarPos + 1;
               DoProgresso([sBilhete,iPrgBarMax,iPrgBarPos,sPrgBarMsg]);
            except

            end;
            //----------------------------------------------------------------------------
            // Processa a Moeda Oficial
            //----------------------------------------------------------------------------
            if _lDataSet.FieldByName('VALOFI').AsFloat <> 0 then
            begin
               if (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 14) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 17) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 18) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 33) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 35) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 21) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 19) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 36) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 43) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 47) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 51) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 44) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 48) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 52) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 29) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 27) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 71) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 39) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 24) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 26) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 29) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 40) then
                  sSql := ' INSERT INTO VLRHISTMOVBEM ' + #13  +
                          ' ( IDMOVIMENTACAO , MOECODIGO , IDTAXADEP, VALOR ) VALUES ' + #13 +
                          ' ( ' + _lDataSet.FieldByName('IDMOVIMENTACAO').AsString + ' , ' +
                                  floattostr(nMoedaOficial) + ' , 1, ' +
                                  _lDataSet.FieldByName('VALOFI').AsString + ') '
               else
                  sSql := ' INSERT INTO VLRHISTMOVBEM ' + #13  +
                          ' ( IDMOVIMENTACAO , MOECODIGO , IDTAXADEP, VALOR ) VALUES ' + #13 +
                          ' ( ' + _lDataSet.FieldByName('IDMOVIMENTACAO').AsString + ' , ' +
                                  floattostr(nMoedaOficial) + ' , 0, ' +
                                  _lDataSet.FieldByName('VALOFI').AsString + ') ';
               //-------------------------------------------------------------------------
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Processa a Moeda Fiscal, se for definida
            //----------------------------------------------------------------------------
            if (_lDataSet.FieldByName('VALFIS').AsFloat <> 0) and (nMoedaFiscal > 0) then
            begin
               if (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 14) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 17) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 18) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 33) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 35) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 21) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 19) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 36) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 43) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 47) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 51) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 44) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 48) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 52) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 29) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 27) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 71) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 39) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 24) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 26) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 29) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 40) then
                  sSql := ' INSERT INTO VLRHISTMOVBEM ' + #13  +
                          ' ( IDMOVIMENTACAO , MOECODIGO , IDTAXADEP, VALOR ) VALUES ' + #13 +
                          ' ( ' + _lDataSet.FieldByName('IDMOVIMENTACAO').AsString + ' , ' +
                                  floattostr(nMoedaFiscal) + ' , 1, ' +
                                  _lDataSet.FieldByName('VALFIS').AsString + ') '
               else
                  sSql := ' INSERT INTO VLRHISTMOVBEM ' + #13  +
                          ' ( IDMOVIMENTACAO , MOECODIGO, IDTAXADEP, VALOR ) VALUES ' + #13 +
                          ' ( ' + _lDataSet.FieldByName('IDMOVIMENTACAO').AsString + ' , ' +
                                  floattostr(nMoedaFiscal) + ' , 0, ' +
                                  _lDataSet.FieldByName('VALFIS').AsString + ') ';
               //-------------------------------------------------------------------------
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Processa a Moeda Gerencial, se for definida
            //----------------------------------------------------------------------------
            if (_lDataSet.FieldByName('VALGER').AsFloat <> 0) and (nMoedaGerencial > 0) then
            begin
               if (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 14) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 17) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 18) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 33) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 35) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 21) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 19) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 36) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 43) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 47) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 51) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 44) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 48) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 52) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 29) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 27) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 71) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 39) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 24) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 26) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 29) or
                  (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 40) then
                  sSql := ' INSERT INTO VLRHISTMOVBEM ' + #13  +
                          ' ( IDMOVIMENTACAO , MOECODIGO , IDTAXADEP, VALOR ) VALUES ' + #13 +
                          ' ( ' + _lDataSet.FieldByName('IDMOVIMENTACAO').AsString + ' , ' +
                                  floattostr(nMoedaGerencial) + ' , 1,' +
                                  _lDataSet.FieldByName('VALGER').AsString + ') '
               else
                  sSql := ' INSERT INTO VLRHISTMOVBEM ' + #13  +
                          ' ( IDMOVIMENTACAO , MOECODIGO , IDTAXADEP, VALOR ) VALUES ' + #13 +
                          ' ( ' + _lDataSet.FieldByName('IDMOVIMENTACAO').AsString + ' , ' +
                                  floattostr(nMoedaGerencial) + ' , 0,' +
                                  _lDataSet.FieldByName('VALGER').AsString + ') ';
               //-------------------------------------------------------------------------
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            // Processa os dados das reavaliacoes no subtipo que segrega moeda x taxadep
            //----------------------------------------------------------------------------
            if (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 08) or
               (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 23) or
               (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 32) or
               (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 53) or
               (_lDataSet.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 54) then
            begin
               sSql := ' INSERT INTO HMBREAVAL ' + #13  +
                       ' ( IDMOVIMENTACAO , MOECODIGO , IDTAXADEP, VALORLAUDO, TAXADEPANT ) VALUES ' + #13 +
                       ' ( ' + _lDataSet.FieldByName('IDMOVIMENTACAO').AsString + ' , ' +
                               floattostr(nMoedaOficial) + ' , ' +
                               ' 1 , ' +
                               floattostr(_lDataSet.FieldByName('VALORGLAUDO').AsFloat) + ' , ' +
                               floattostr(_lDataSet.FieldByName('TAXADEPANT').AsFloat) + ' ) ';
               //-------------------------------------------------------------------------
               if not ExecSQL(sSql, True) then
                  Raise Exception.Create(MessageInfo);
            end;
            //----------------------------------------------------------------------------
            _lDataSet.Next;
         end;
         //-------------------------------------------------------------------------------
         // Atualiza os parametros do sistema, informando que os dados estão convertidos
         //-------------------------------------------------------------------------------
         sSql := ' UPDATE PARAMETROSCAFMANUT ' + #13 +
                 ' SET DTAINICAFMT = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',date) + #39 + ' , ' + #39 + 'DD/MM/YYYY' + #39 + ')' + #13 +
                 ' WHERE (IDPESSOA = ' + floattostr(nEmpresaProp) + ') ';
         if not ExecSQL(sSql, True) then
            Raise Exception.Create(MessageInfo);
         //-------------------------------------------------------------------------------
         Commit;
         DecimalSeparator := ',';
         Result := True;
      except
         On E : Exception Do
         begin
            RollBack;
            DecimalSeparator := ',';
            Result := False;
         end;
      end;
   end;
end;

procedure TCtrlIniciaMultiTaxa.SetCdsGrupoTaxaDep(const Value: TClientDataSet);
begin
  FcdsGrupoTaxaDep := Value;
end;

procedure TCtrlIniciaMultiTaxa.SetcdsAcrescimoValor(const Value: TClientDataSet);
begin
  FcdsAcrescimoValor := Value;
end;

procedure TCtrlIniciaMultiTaxa.SetcdsReavaliacao(const Value: TClientDataSet);
begin
  FcdsReavaliacao := Value;
end;

procedure TCtrlIniciaMultiTaxa.SetcdsPais(const Value: TClientDataSet);
begin
  FcdsPais := Value;
end;

function TCtrlIniciaMultiTaxa.CMTranslate(sIgor: String): String;
begin
   Result := sIgor;
end;

end.

