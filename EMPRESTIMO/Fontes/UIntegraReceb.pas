unit UIntegraReceb;

interface

uses
   forms,          (* TApplication *)
   wwquery,        (* TwwQuery *)
   dbtables,       (* TTable *)
   DB,             (* TFieldType *)
   classes,        (* TStringList *)
   dialogs,        (* Message_ *)
   sysutils,       (* FileExists *)
   stdctrls,       (* TLabel *)
   Controls,
   comctrls,       (* TProgressBar *)
   uTypesEmptmo;



type
   TIntegraReceb = Class(TObject)

   private { Private declarations }

      function MontaSQLContab(const iPatro: Int64; const iAno, iMes: Integer): String;

      function TotalizaDocPatro(const iPatro: Int64; const iAno, iMes: Integer): Currency;

      function GeraDocRecPatro(const iPatro      : Int64;
                               const iAno, iMes  : Integer;
                               const dDataLancto : TDateTime;
                               const dDataVencto : TDateTime;
                               const fValor      : Currency;
                               const sHistorico  : String;
                               var sErro         : TStringList
                               ): Int64;

      function MarcaPlnRecPatro(const iPatro, iPlanilha: Int64; const iAno, iMes: Integer): Boolean;

      function MarcaDocRecPatro(const iPatro, iDocumento, iPlanilha: Int64; const iAno, iMes: Integer): Boolean;

      procedure MontaParamCaPCaRReceb(const iPatro: Int64; var rParam: TParamIntegra);

      function InsereDocumentoReceb(const iPatro       : Int64;
                                    const fValor       : Currency;
                                    var rParam         : TParamIntegra;
                                    var sErro          : TStringList;
                                    const sHistorico   : String
                                   ): Int64;


   public { Public declarations }

      (* Verifica se há documento/contabilização de recebimento para uma determinada patrocinadora,
         para um determinado mês e ano de recebimento *)
      function ExisteRecebimentoPatro(const iPatro: Int64; const iAno, iMes: Integer): Boolean;

      (* totaliza os valores recebidos, cria o documento de recebimento e contabiliza os valores *)
      function GeraRecebimentoPatro(const iPatro       : Int64;
                                    const iAno, iMes   : Integer;
                                    const dDataLancto  : TDateTime;
                                    const dDataVencto  : TDateTime
                                    ): Integer;

      function InsereHistRecPatro(const iPatro      : Int64;
                                  const iDocumento  : Int64;
                                  const iPlanilha   : Int64;
                                  const iAno        : Integer;
                                  const iMes        : Integer;
                                  const fValor      : Currency
                                  ): Boolean;


      function ExcluiRecebimentoPatro(const iHistorico: Int64;
                                      const iDocumento: Int64;
                                      const iPlanilha : Int64
                                     ): Integer;


   end;




var IntegraReceb : TIntegraReceb;



implementation
uses
   dBaseDados, uDataBase, uMensErro, dEmptmo, FProgresso, uIntegraBack, uFuncaoGeral,
   UCalcEmptmo,    (* BuscaData *)
   UIntegraEmptmo,
   UFuncoesEmptmo,
   uSistema,
   UModulo,        (* TModulo *)
   UDocumento;     (* Rotinas do CAPCAR *)





function TIntegraReceb.ExisteRecebimentoPatro(const iPatro: Int64; const iAno, iMes: Integer): Boolean;
begin
   with dtmEmptmo.qryRecebimentoPatro do begin
      LimpaParametros(dtmEmptmo.qryRecebimentoPatro);

      ParamByName('PIDPATRO').AsInteger         := iPatro;
      ParamByName('PRPEANOCOBRANCA').AsInteger  := iAno;
      ParamByName('PRPEMESCOBRANCA').AsInteger  := iMes;

      Open;

      Result := not(isEmpty);

      Close;
   end;
end;



function TIntegraReceb.GeraRecebimentoPatro(const iPatro       : Int64;
                                            const iAno, iMes   : Integer;
                                            const dDataLancto  : TDateTime;
                                            const dDataVencto  : TDateTime
                                            ): Integer;
var
   sErro       : TStringList;
   sResult     : TStringList;
   fValor      : Currency;
   fValorCaR   : Currency;
   sSQLContab  : String;
   sHistorico  : String;
   iPlanilha   : Integer;
   iDocumento  : Integer;
   bTransacao  : Boolean;
begin
   iPlanilha   := -1;
   iDocumento  := -1;

   // ----------------------------------------------------------------------------------------------

   (* 1º - seleciona os registros a contabilizar *)
   sSQLContab := MontaSQLContab(iPatro, iAno, iMes);

   // ----------------------------------------------------------------------------------------------

   (* 2º - Contabiliza *)

   (* prepara o Histórico-padrão que será passado adiante *)
   sHistorico  := 'Recebimento da Patrocinadora ' + IntToStr(iPatro) + ', ref: ' +
                  IntToStr(iMes) + '/' + IntToStr(iAno);


   if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
      StartTransacao;
      bTransacao := True;
   end else begin
      bTransacao := False;
   end;


   try

      (* chama a função de contabilização passando o SQL acima *)
      Result := IntegraEmptmo.ContabilizaItens('F', 'N', sSQLContab, sHistorico, dDataLancto,
                                               sResult, sErro, iPlanilha);
      (*
      Códigos de retorno (controle de erro):
          0 : Lançamento(s) realizados com sucesso
         -1 : ERRO ao tentar selecionar os itens a contabilizar
         -2 : Query não retornou itens a contabilizar
         -3 : ERRO ao tentar criar tabela para agrupamento
         -4 : ERRO ao buscar Parâmetros de Integração
         -5 : ERRO ao fazer o Lançamento Contábil
         -6 : ERRO no Período Contábil
         -7 : Processo interrompido pelo usuário sem contabilização
      *)

      if Result < 0 then begin
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and (bTransacao) ) then RollBackTransacao;
         Exit;
      end;

      // ----------------------------------------------------------------------------------------------

      (* 3º - Totaliza o valor do Documento de CaR da Patrocinadora *)
      fValor      := TotalizaDocPatro(iPatro, iAno, iMes);
      fValorCaR   := fValor;

      if iPatro = Sistema.IDEmpresa then fValorCaR := 0;

      // ----------------------------------------------------------------------------------------------

      (* 4º - Cria o Documento de Contas a Pagar / Receber *)
      if fValorCaR > 0 then iDocumento := GeraDocRecPatro(iPatro, iAno, iMes, dDataLancto, dDataVencto,
                                          fValorCaR, sHistorico, sErro);

      if ( (fValorCaR > 0) and (iDocumento < 0) ) then begin
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and (bTransacao) ) then RollBackTransacao;
         Result := -8;
         (*
         Códigos de retorno (controle de erro):
            -8 : Erro na integração financeira
         *)
         Exit;
      end;

      // ----------------------------------------------------------------------------------------------

      (* 5º - Grava a planilha nos registros apropriados *)
      if not(MarcaPlnRecPatro(iPatro, iPlanilha, iAno, iMes)) then begin
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and (bTransacao) ) then RollBackTransacao;
         Result := -9;
      end;

      // ----------------------------------------------------------------------------------------------

      (* 6º - Grava o documento nos registros apropriados *)
      if not(MarcaDocRecPatro(iPatro, iDocumento, iPlanilha, iAno, iMes)) then begin
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and (bTransacao) ) then RollBackTransacao;
         Result := -10;
      end;

      // ----------------------------------------------------------------------------------------------

      (* 7º - Insere o Registro no Historico *)
      if not(InsereHistRecPatro(iPatro, iDocumento, iPlanilha, iAno, iMes, fValor)) then begin
         if ( (dtmBaseDados.dbBaseDados.InTransaction) and (bTransacao) ) then RollBackTransacao;
         Result := -11;
      end;

      // ----------------------------------------------------------------------------------------------

      if (Result >= 0) then if ( (dtmBaseDados.dbBaseDados.InTransaction) and (bTransacao) ) then CommitTransacao;

   except
      Raise;
      RollBackTransacao;
   end;
end;



function TIntegraReceb.MontaSQLContab(const iPatro: Int64; const iAno, iMes: Integer): String;
begin
   Result :=
   'SELECT '                                                                     + #13 +
   '   H.IDHISTMOVEMPTMO, H.IDCONTRATOEMPTMO,'                                   + #13 +
   '   TC.IDTIPOCONTREMPTMO, '                                                   + #13 +
   '   C.IDPLANOPREV, C.IDPATRO, '                                               + #13 +
   '   H.IDITEMEMPTMO, H.IDITEMCENTRALIZA, '                                     + #13 +

   '   ( ' +
   '   (LTRIM(RTRIM(TO_CHAR(HMEANOCOBRANCA, ''0000'')))) ' +
   '   || ' +
   '   (LTRIM(RTRIM(TO_CHAR(HMEMESCOBRANCA, ''00'')))) ' +
   '   ) AS ANOMES, '                                                            + #13 +

   '   H.HMEFORMACOBRANCA, '                                                     + #13 +
   '   H.HMEVLRPREVISTO, H.HMEVLREFETIVO, '                                      + #13 +

   '   ITC.TIPCODIGO '                                                           + #13 +

   'FROM '                                                                       + #13 +
   '   HISTMOVEMPTMO H, ITEMXTIPOCONTR ITC, CONTRATOEMPTMO C, '                  + #13 +
   '   TIPOCONTREMPTMO TC, TIPOEMPTMO TE '                                       + #13 +

   'WHERE '                                                                      + #13 +
   '       ( H.HMEANOCOBRANCA       = ' + IntToStr(iAno) + ' ) '                 + #13 +
   '   AND ( H.HMEMESCOBRANCA       = ' + IntToStr(iMes) + ' ) '                 + #13 +
   '   AND ( (H.HMECENTRALIZA       = 1) OR (H.HMEDESTACADO = 1) ) '             + #13 +
   '   AND ( (H.FLGESTORNADO        = 0) OR (H.FLGESTORNADO IS NULL) ) '         + #13 +
   '   AND ( H.FLGABONADO           IS NULL) '                                   + #13 +
   '   AND ( H.FLGQUITADO           IS NULL) '                                   + #13 +
   '   AND ( H.HMETIPOFOLHA         = ''P'' ) '                                  + #13 +
   '   AND ( H.HMEFORMACOBRANCA     = ''F'' ) '                                  + #13 +
   '   AND ( H.FLGRECEBIMENTO       = 0 ) '                                      + #13 +
   '   AND ( H.FLGBAIXADO           IS NULL ) '                                  + #13 +
   '   AND ( H.PLNCODIGOESTORNO     IS NULL ) '                                  + #13 +
   '   AND ( H.PLNCODIGORECEB       IS NULL ) '                                  + #13 +
   '   AND ( H.CODDOCUMENTORECEB    IS NULL ) '                                  + #13 +
   '   AND ( H.CODDOCUMENTO         IS NULL ) '                                  + #13 +
   '   AND ( H.HMEVLREFETIVO        IS NOT NULL ) '                              + #13 +
   '   AND ( C.IDPATRO              = ' + IntToStr(iPatro) + ' ) '               + #13 +
   '   AND ( TE.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa) + ' ) '    + #13 +
   '   AND ( H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO ) '                     + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO ) '                   + #13 +
   '   AND ( TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO ) '                        + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO ) '                  + #13 +
   '   AND ( H.IDITEMEMPTMO         = ITC.IDITEMEMPTMO ) '                       + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO ) ';
end;



function TIntegraReceb.TotalizaDocPatro(const iPatro: Int64; const iAno, iMes: Integer ) : Currency;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                     + #13 +
   '   NVL(SUM(H.HMEVLREFETIVO), 0) AS HMEVLREFETIVO '                           + #13 +

   'FROM '                                                                       + #13 +
   '   HISTMOVEMPTMO H, ITEMXTIPOCONTR ITC, CONTRATOEMPTMO C, '                  + #13 +
   '   TIPOCONTREMPTMO TC, TIPOEMPTMO TE '                                       + #13 +

   'WHERE '                                                                      + #13 +
   '       ( H.HMEANOCOBRANCA       = ' + IntToStr(iAno) + ' ) '                 + #13 +
   '   AND ( H.HMEMESCOBRANCA       = ' + IntToStr(iMes) + ' ) '                 + #13 +
   '   AND ( (H.HMECENTRALIZA       = 1) OR (H.HMEDESTACADO = 1) ) '             + #13 +
   '   AND ( (H.FLGESTORNADO        = 0) OR (H.FLGESTORNADO IS NULL) )'          + #13 +
   '   AND ( H.FLGABONADO           IS NULL) '                                   + #13 +
   '   AND ( H.FLGQUITADO           IS NULL) '                                   + #13 +
   '   AND ( H.HMETIPOFOLHA         = ''P'' ) '                                  + #13 +
   '   AND ( H.HMEFORMACOBRANCA     = ''F'' ) '                                  + #13 +
   '   AND ( H.FLGRECEBIMENTO       = 0 ) '                                      + #13 +
   '   AND ( H.FLGBAIXADO           IS NULL ) '                                  + #13 +
   '   AND ( H.PLNCODIGOESTORNO     IS NULL ) '                                  + #13 +
   '   AND ( H.PLNCODIGORECEB       IS NULL ) '                                  + #13 +
   '   AND ( H.CODDOCUMENTORECEB    IS NULL ) '                                  + #13 +
   '   AND ( H.CODDOCUMENTO         IS NULL ) '                                  + #13 +
   '   AND ( H.HMEVLREFETIVO        IS NOT NULL ) '                              + #13 +
   '   AND ( C.IDPATRO              = ' + IntToStr(iPatro) + ' ) '               + #13 +
   '   AND ( TE.IDEMPRESAPROP       = ' + IntToStr(Sistema.IDEmpresa) + ' ) '    + #13 +
   '   AND ( H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO ) '                     + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO ) '                   + #13 +
   '   AND ( TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO ) '                        + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO ) '                  + #13 +
   '   AND ( H.IDITEMEMPTMO         = ITC.IDITEMEMPTMO ) '                       + #13 +
   '   AND ( TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO ) ';

   Result := 0;

   with dtmEmptmo.qryAux do begin
      Close;
      Sql.Clear;
      Sql.Text := sSQL;
      Open;
      if not IsEmpty then Result := Fields[0].AsCurrency;
      Close;
   end;
end;



function TIntegraReceb.GeraDocRecPatro(const iPatro      : Int64;
                                       const iAno, iMes  : Integer;
                                       const dDataLancto : TDateTime;
                                       const dDataVencto : TDateTime;
                                       const fValor      : Currency;
                                       const sHistorico  : String;
                                       var sErro         : TStringList
                                       ): Int64;
var
   rParam : TParamIntegra;
begin

   (* 1º - Parâmetros para Integração *)
   MontaParamCaPCaRReceb(iPatro, rParam);

   rParam.dDataLanc  := dDataLancto;
   rParam.dDataVenc  := dDataVencto;

   (* 2º - *)
   Result := InsereDocumentoReceb(iPatro, fValor, rParam, sErro, sHistorico);
end;



procedure TIntegraReceb.MontaParamCaPCaRReceb(const iPatro: Int64; var rParam: TParamIntegra);
begin
   with dtmEmptmo.qryParamIntegraReceb do begin
      LimpaParametros(dtmEmptmo.qryParamIntegraReceb);
      ParamByName('PIDPATRO').AsInteger := iPatro;
      Open;
//      if isEmpty then (* ERRO *)
   end;

   with dtmEmptmo.qryParamIntegraReceb do begin

      rParam.iPatro           := dtmEmptmo.qryParamIntegraRecebIDPATRO.AsInteger;
      rParam.sRecPag          := 'R';
      rParam.sCCBaixa         := dtmEmptmo.qryParamIntegraRecebCCBAIXA.AsString;

      rParam.iCodPortForma    := dtmEmptmo.qryParamIntegraRecebCODPORTFORMA.AsInteger;
      rParam.bEmisBloq        := True;
      rParam.iCodForma        := -1;
      rParam.sDebCre          := 'D';
      rParam.iTipoDoc         := dtmEmptmo.qryParamIntegraRecebCODTIPDOC.AsInteger;
      rParam.iUnidNegoc       := dtmEmptmo.qryParamIntegraRecebUNIDNEGOC.AsInteger;
      rParam.sTipoRecDesFinan := dtmEmptmo.qryParamIntegraRecebCODTIPRECDES.AsString;

      rParam.iMoeda           := Modulo.iMoedaCorrente;

   end; (* with dtmEmptmo.qryParamIntegraReceb *)
end;



function TIntegraReceb.InsereDocumentoReceb(const iPatro       : Int64;
                                            const fValor       : Currency;
                                            var rParam         : TParamIntegra;
                                            var sErro          : TStringList;
                                            const sHistorico   : String
                                           ): Int64;
var
   qryAux      : TwwQuery;
   iPlanilha   : Integer;
begin
   Result := -1;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BaseDados';

   try
      (* Gerar codigo do documento *)
      rParam.iDocumento := Documento.GetCodigo(qryAux);

      if rParam.iDocumento <= 0 then begin
         sErro.Add('Erro ao Gerar código do Documento');
         Result := -1;
         Exit;
      end;

      try
         // ----------------------------------------------------------------------------------------
         // Documento
         // ----------------------------------------------------------------------------------------

         Documento.Inserir(qryAux,
                           rParam.iDocumento,            (* iCodDocumento        *)
                           IntToStr(Sistema.IdModulo),   (* sModulo              *)
                           IntToStr(IntegraBack.Plano),  (* sPlano               *)
                           rParam.sCCBaixa,              (* sPlaconta            *)
                           rParam.sCentroCustoDFinan,    (* sCCusto              *)
                           rParam.iMoeda,                (* iMoeCodigo           *)
                           0,                            (* UnidNegoc            *)
                           Sistema.IdEmpresa,            (* IdPessoa             *)
                           rParam.iPatro,                (* IdForCli             *)
                           rParam.iTipoDoc,              (* CodTipDoc            *)
                           rParam.iCodPortForma,         (* CodPortForma         *)
                           rParam.sRecPag,               (* sRecPag              *)
                           rParam.iDocumento,            (* NoDocumento          *)
                           '',                           (* ComplDocumento       *)
                           DateToStr(Sysdate),           (* DataEmissao          *)
                           DateToStr(rParam.dDataVenc),  (* DataVencto           *)
                           DateToStr(rParam.dDataVenc),  (* DataProgramada       *)
                           '0',  (* sStatus *)           (* documento em aberto  *)
                           -1,                           (* NumFatura            *)
                           '2',                          (* sOperacao            *)
                           Sistema.IdUsuario,            (* IdUsuarioInclusao    *)
                           -1,                           (* iCodSubConta         *)
                           rParam.iCodForma,             (* iCodForma            *)
                           '',                           (* sNumLeitCodBarras    *)
                           '',                           (* sNumDigCodBarras     *)
                           rParam.bEmisBloq,             (* bEmisBloq            *)
                           0,                            (* rValorJuros          *)
                           0,                            (* rVlrMulta            *)
                           0);                           (* iIndiceCorrecao      *)


         // ----------------------------------------------------------------------------------------
         // LanctoDocum
         // ----------------------------------------------------------------------------------------

         (* Gerar número do Lançamento *)
         rParam.iLanctoDocum := Documento.GerarNumLancto(qryAux, rParam.iDocumento);

         if rParam.iLanctoDocum <= 0 then begin
            sErro.Add('Erro ao Gerar código do Lançamento do Documento');
            Result := -1;
            Exit;
         end;

         Documento.CriarLanctoDoc(qryAux,                         (* query auxiliar *)
                                  rParam.iDocumento,              (* iCodDocumento *)
                                  rParam.iLanctoDocum,            (* iNumLancto *)
                                  -1,                             (* CodAlterador *)
                                  iPlanilha,                      (* PnlCodigo *)
                                  DateToStr(rParam.dDataLanc),    (* DataLancto *)
                                  fValor,                         (* Valor *)
                                  0,                              (* ValorOutraMoeda *)
                                  -1,                             (* Estorno *)
                                  rParam.sDebCre,                 (* DebCre *)
                                  '2',                            (* sOperacao *)
                                  sHistorico,                     (* HistoricoCompl *)
                                  Sistema.IdUsuario,              (* idUsuarioInclusao *)
                                  False,                          (* bContabiliza *)
                                  -1,                             (* iCodPortForma *)
                                  '');                            (* sNumChqBord *)

          (* variável passada como referência que retorna Código
             da planilha que contém a contabilização deste lançamento *)
         rParam.iPlanilha := iPlanilha;

         // ----------------------------------------------------------------------------------------
         // RateioDocum
         // ----------------------------------------------------------------------------------------

         rParam.iRateioDocum :=
         Documento.Rateio.Inserir(rParam.iDocumento,        (* iCodDocumento        *)
                                  rParam.sTipoRecDesFinan,	(* CodTipRecDes         *)
                                  rParam.sRecPag,           (* RecPag               *)
                                  rParam.sCentroRespon,     (* CodCentroRespon      *)
                                  Sistema.IdEmpresa,        (* IdPessoa             *)
                                  rParam.fVlrLanc,          (* Valor                *)
                                  0,                        (* ValorOutraMoeda      *)
                                  Sistema.IdUsuario,        (* IdUsuarioInclusao    *)
                                  rParam.iUnidNegoc,        (* UnidNegoc            *)
                                  -1,                       (* IdReservaOrcamen     *)
                                  Modulo.sCentroCusto,      (* sCodCentroCusto      *)
                                  rParam.iPatro,            (* IdPatro              *)
                                  Modulo.iPrograma,         (* IdPrograma           *)
                                  7);                       (* IdPlanoPrevContabil  *)

         // ----------------------------------------------------------------------------------------

         Result := rParam.iDocumento;

      except

         on E:Exception do begin
            sErro.Add('Erro ao Inserir Documento. Participante: ' + IntToStr(rParam.iPessoa));
            sErro.Add(E.Message);
            Result := -1;
            Exit;
         end;

      end;

   finally

     qryAux.Free;

   end;
end;



function TIntegraReceb.MarcaPlnRecPatro(const iPatro, iPlanilha: Int64; const iAno, iMes: Integer): Boolean;
begin
   Result := True;

   try

      with dtmEmptmo.qryMarcaPlnRecPatro do begin
         LimpaParametros(dtmEmptmo.qryMarcaPlnRecPatro);

         ParamByName('PIDPATRO').AsInteger            := iPatro;
         ParamByName('PHMEANOCOBRANCA').AsInteger     := iAno;
         ParamByName('PHMEMESCOBRANCA').AsInteger     := iMes;
         ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;

         if iPlanilha > 0 then   ParamByName('PPLNCODIGORECEB').AsInteger     := iPlanilha;

         ExecSQL;
      end;

   except
      Result := False;
   end;
end;



function TIntegraReceb.MarcaDocRecPatro(const iPatro, iDocumento, iPlanilha: Int64; const iAno, iMes: Integer): Boolean;
begin
   Result := True;

   try

      with dtmEmptmo.qryMarcaDocRecPatro do begin
         LimpaParametros(dtmEmptmo.qryMarcaDocRecPatro);

         ParamByName('PIDPATRO').AsInteger            := iPatro;
         ParamByName('PHMEANOCOBRANCA').AsInteger     := iAno;
         ParamByName('PHMEMESCOBRANCA').AsInteger     := iMes;
         ParamByName('PIDEMPRESAPROP').AsInteger      := Sistema.IDEmpresa;

         if iDocumento > 0 then   ParamByName('PCODDOCUMENTORECEB').AsInteger     := iDocumento;

         ExecSQL;
      end;

   except
      Result := False;
   end;
end;



function TIntegraReceb.InsereHistRecPatro(const iPatro      : Int64;
                                          const iDocumento  : Int64;
                                          const iPlanilha   : Int64;
                                          const iAno        : Integer;
                                          const iMes        : Integer;
                                          const fValor      : Currency
                                          ): Boolean;
var
   iHistorico : Int64;
begin
   Result      := True;
   iHistorico  := LeUltRegistro(nil, 'HISTRECPATROEP');

   try
      with dtmEmptmo.qryInsereHistRecPatro do begin
         LimpaParametros(dtmEmptmo.qryInsereHistRecPatro);

         ParamByName('PIDHISTRECPATROEP').AsInteger   := iHistorico;
         ParamByName('PIDPATRO').AsInteger            := iPatro;

         if iDocumento > 0 then  ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
         if iPlanilha > 0 then   ParamByName('PPLNCODIGO').AsInteger    := iPlanilha;

         ParamByName('PRPEDATA').AsDateTime           := Trunc(SysDate);
         ParamByName('PRPEVLR').AsCurrency            := fValor;
         ParamByName('PRPEMESCOBRANCA').AsInteger     := iMes;
         ParamByName('PRPEANOCOBRANCA').AsInteger     := iAno;

         ExecSQL;
      end;

   except
      Result := False;
   end;
end;



function TIntegraReceb.ExcluiRecebimentoPatro(const iHistorico: Int64;
                                              const iDocumento: Int64;
                                              const iPlanilha : Int64
                                             ): Integer;
var
    sMsg        : String;
    bTransacao  : Boolean;
begin

   try

      if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
         StartTransacao;
         bTransacao := True;
      end else begin
         bTransacao := False;
      end;

      with dtmEmptmo.qryExcluiHistRecPatro do begin
         LimpaParametros(dtmEmptmo.qryExcluiHistRecPatro);
         ParamByName('PIDHISTRECPATROEP').AsInteger := iHistorico;
         ExecSQL;

         Result := RowsAffected;

         Result := IntegraEmptmo.ExcluiFinanceiro(iDocumento, sMsg);

         if Result = 0 then begin
            (* Exclui Contabilidade *)
            Result := IntegraEmptmo.ExcluiContabil(iPlanilha, sMsg);
         end;

      end;


      if Result = 0 then begin
         if bTransacao and dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
      end else begin
         if bTransacao and dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
      end;


   except
      if bTransacao and dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
      Result := -1;
   end;
end;



end.
