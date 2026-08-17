unit uCtrlContrRateioOrc;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE
//
//      Módulo          :
//	Autor           :  Marcos Ventura Topini / João Marchetti
//	Data de Início  :  06/09/2005
//	Data de Término :
//
//  FUNÇÕES PUBLICADAS:
//
//
// -----------------------------------------------------------------------------

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, DB, Math,
     uCMTypes, Classes, uDbContrRateioOrc, StdCtrls, uCtrlSaldoOrcado, uDiasUteis,
     uCtrlVlrRefContr, uCtrlMoeda, uCtrlCotacaoMoeda, uCtrlCorrecoesContratuais;

type
    TRegistroOrcado = Record
       Valor      : Currency;
       Quantidade : Double;
       NomeItem   : String;
       Forma      : String;

end;

type TCtrlContratoRateioOrc = class(TCmControlObject)
     private
       FDbContrRateioOrc :  TDbContrRateioOrc;
       FCdsContrRateioOrc: TCMClientDataSet;

       CtrlSaldoOrcado   : TCtrlSaldoOrcado;
       CtrlCorrecao      : TCtrlCorrecoesContratuais;
       CtrlVlrReferencia : TCtrlVlrRefContr;
       CtrlMoeda         : TCtrlMoeda;
       CtrlCotacaoMoeda  : TCtrlCotacaoMoeda;

       _DiasUteis        : TDiasUteis;
       FcdsContratos     : TCMClientDataSet;
       FcdsItens         : TCMClientDataSet;

       RegistroOrcado : TRegistroOrcado;
       procedure SetDbContrRateioOrc(const Value: TDbContrRateioOrc);
       procedure SetCdsContrRateioOrc(const Value: TCMClientDataSet);
       procedure SetcdsContratos(const Value: TCMClientDataSet);

       function ArredondaFloat(Valor: double; TipoArred: integer): double;

       function ProcessaFormaTipo1      : TRegistroOrcado;
       function ProcessaFormaTipo2      : TRegistroOrcado;
       function ProcessaFormaTipo3      : TRegistroOrcado;
       function ProcessaFormaTipo4      : TRegistroOrcado;
       function ProcessaFormaTipo5      : TRegistroOrcado;
       function ExecutaCorrecaoContrato(const iContrato, iPessoa : Integer; const fValor : Currency; var fValorReajustado : Currency) : Boolean;

       function FatorCorrecao(const iIdMoeda: Integer;
                              const dDataIni, dDataFim: TDateTime;
                              const bFatorNegativo: boolean): Extended;

       procedure SetcdsItens(const Value: TCMClientDataSet);

     protected
       procedure AfterInitialize;   Override;
       procedure OnCreateAppServer; Override;
     public
       constructor Create;  override;
       destructor  Destroy; override;
       property DbContrRateioOrc  : TDbContrRateioOrc read FDbContrRateioOrc  write SetDbContrRateioOrc;
       property CdsContrRateioOrc : TCMClientDataSet  read FCdsContrRateioOrc write SetCdsContrRateioOrc;

       property cdsContratos : TCMClientDataSet read FcdsContratos write SetcdsContratos;
       property cdsItens     : TCMClientDataSet read FcdsItens write SetcdsItens;

       function GravaContratoRateioOrc  : Boolean;

       function IntegraOrcamento(const iAno : Integer) : Boolean;

       function LookupContratoRateioOrc(const iAno: integer): OleVariant;


       function LookupItensContrato(const iAno : Integer) : OleVariant;

       function LookupRateiosLancados(const iAno      : Integer;
                                      const iContrato : Integer = -1;
                                      const iObjeto   : Integer = -1;
                                      const iItem     : Integer = -1) : OleVariant;

       function ListaFormulaApuraOrc(idFormula: Double = 0): Olevariant;
       function ListaFormasApuracao(idFormula: Double; iPeriodo : Integer): Olevariant;

       function ListaContratosParaOrcamento(const iContrato : Integer = -1;
                                            const iFormula  : Integer = -1) : OleVariant;

       function ListaContratosComFormulas(const iContrato : Integer = -1;
                                          const iFormula  : Integer = -1) : OleVariant;

       function ListaMovimentacaoContrato(const iMesIni   : Integer;
                                          const iAnoIni   : Integer;
                                          const iMesFim   : Integer;
                                          const iAnoFim   : Integer;
                                          const iContrato : Integer;
                                          const iObjeto   : Integer;
                                          const iItem     : Integer
                                          ) : OleVariant;

       function ProcessaCalculoOrcamento(const iMesIni   : Integer;
                                         const iAnoIni   : Integer;
                                         const iMesFim   : Integer;
                                         const iAnoFim   : Integer;
                                         const iAnoApura : Integer;
                                         const iContrato : Integer = -1;
                                         const iFormula  : Integer = -1) : Boolean;


     published

end;


implementation

{ TCtrlContratoRateioOrc }


constructor TCtrlContratoRateioOrc.Create;
begin
   inherited;
   // Cria os DbOjbects
   FDbContrRateioOrc := TDbContrRateioOrc.Create(Self);
   CtrlSaldoOrcado   := TCtrlSaldoOrcado.Create;
   CtrlCorrecao      := TCtrlCorrecoesContratuais.Create;
   CtrlVlrReferencia := TCtrlVlrRefContr.Create;
   CtrlMoeda         := TCtrlMoeda.Create;
   CtrlCotacaoMoeda  := TCtrlCotacaoMoeda.Create;

   _DiasUteis        := TDiasUteis.Create;
end;



destructor TCtrlContratoRateioOrc.Destroy;
begin
   // Destrói os DbObjects criados
   FDbContrRateioOrc.Free;
   FreeAndNil(CtrlSaldoOrcado);
   FreeAndNil(CtrlCorrecao);
   FreeAndNil(CtrlVlrReferencia);
   FreeAndNil(CtrlMoeda);
   FreeAndNil(CtrlCotacaoMoeda);
   FreeAndNil(_DiasUteis);

   // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
   if isAppServer then begin
     FCdsContrRateioOrc.Free;
   end;

   inherited
end;



function TCtrlContratoRateioOrc.LookupContratoRateioOrc(const iAno: integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                     + #13 +
   '      CRO.IDCONTRATO,'                                                      + #13 +
   '      C.CODCONTRATOEMPR,'                                                   + #13 +
   '      C.NOMECONTRATO,'                                                      + #13 +
   '      OC.NOMEOBJETO,'                                                       + #13 +
   '      IC.NOME_ITEM,'                                                        + #13 +
   '      CRO.IDOBJETO,'                                                        + #13 +
   '      CRO.IDITEM,'                                                          + #13 +
   '      CRO.ANO,'                                                             + #13 +
   '      CRO.MES,'                                                             + #13 +
   '      CRO.VALOR,'                                                           + #13 +
   '      DECODE(CRO.QTDE,0,1,NVL(CRO.QTDE,1)) AS QTDE,'                        + #13 +
   '      (CRO.VALOR*DECODE(CRO.QTDE,0,1,NVL(CRO.QTDE,1))) AS TOTAL'            + #13 +
   'FROM'                                                                       + #13 +
   '      CONTRATOCONTR C,'                                                     + #13 +
   '      CONTRATOXORCAMEN CRO,'                                                + #13 +
   '      ITEMCONTRATUAL   IC,'                                                 + #13 +
   '      OBJETOCONTRATUAL OC'                                                  + #13 +
   'WHERE'                                                                      + #13 +
   '      C.IDCONTRATO = CRO.IDCONTRATO'                                        + #13 +
   '  AND OC.IDOBJETO  = CRO.IDOBJETO'                                          + #13 +
   '  AND IC.IDITEM    = CRO.IDITEM'                                            + #13 +
   '  AND CRO.ANO      = ' + IntToStr(iAno)                                     + #13 +
   'ORDER BY'                                                                   + #13 +
   '  CRO.IDCONTRATO, CRO.IDITEM, CRO.ANO, CRO.MES'                             + #13;

   Result := GetDataPacket(sSQL);
end;



procedure TCtrlContratoRateioOrc.AfterInitialize;
begin
   inherited;
   // define o DataBase a ser utilizado
   FDbContrRateioOrc.DataBaseName := DataBaseName;
   CtrlSaldoOrcado.InitializeAs(Self);
   CtrlCorrecao.InitializeAs(Self);
   CtrlVlrReferencia.InitializeAs(Self);
   CtrlMoeda.InitializeAs( Self );
   CtrlCotacaoMoeda.InitializeAs( Self );

   _DiasUteis.InitializeAs(Self);
end;



procedure TCtrlContratoRateioOrc.OnCreateAppServer;
begin
   inherited;
   // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
   // aplicação cliente, os mesmos já foram criados.
   FCdsContrRateioOrc := TCMClientDataSet.Create( nil );
end;



procedure TCtrlContratoRateioOrc.SetDbContrRateioOrc(const Value: TDbContrRateioOrc);
begin
   FDbContrRateioOrc := Value;
end;



procedure TCtrlContratoRateioOrc.SetCdsContrRateioOrc(const Value: TCMClientDataSet);
begin
   FCdsContrRateioOrc := Value;
end;



function TCtrlContratoRateioOrc.GravaContratoRateioOrc: Boolean;
var
   sMsg : String;
begin
   // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
   // através da aplicação servidora
   if ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.GravaAtividade( CdsContrRateioOrc.Data );
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end else begin
      try
         StartTransaction;

         // Aplica as alterações do Cds através do DbObject
         Result := ApplyCds( CdsContrRateioOrc, DbContrRateioOrc, [], [] );
         if not Result then raise Exception.Create( DbContrRateioOrc.MessageInfo );
         Commit;
      except
         on E : Exception do begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;



function TCtrlContratoRateioOrc.LookupRateiosLancados(const iAno      : Integer;
                                                      const iContrato : Integer = -1;
                                                      const iObjeto   : Integer = -1;
                                                      const iItem     : Integer = -1): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                     + #13 +
   '    C.CODCONTRATOEMPR,'                     + #13 +
   '    C.NOMECONTRATO,'                        + #13 +
   '    I.NOME_ITEM,'                           + #13 +
   '    CO.IDCONTRATO,'                         + #13 +
   '    CO.IDOBJETO,'                           + #13 +
   '    CO.IDITEM,'                             + #13 +
   '    CO.ANO,'                                + #13 +
   '    CO.MES,'                                + #13 +
   '    CO.QTDE,'                               + #13 +
   '    CO.VALOR,'                              + #13 +
   '    (CO.QTDE*CO.VALOR) AS TOTAL,'           + #13 +
   '    ''                              '' AS FORMA'      + #13 +   
   'FROM'                                       + #13 +
   '    CONTRATOXORCAMEN CO,'                   + #13 +
   '    CONTRATOCONTR C,'                       + #13 +
   '    ITEMCONTRATUAL I'                       + #13 +
   'WHERE'                                      + #13 +
   '    CO.IDCONTRATO = C.IDCONTRATO'           + #13 +
   'AND I.IDITEM      = CO.IDITEM'              + #13 +
   'AND CO.ANO        = ' + IntToStr(iAno)      + #13;

   if iContrato > 0 then sSQL := sSQL + 'AND CO.IDCONTRATO = ' + IntToStr(iContrato) + #13;
   if iObjeto > 0   then sSQL := sSQL + 'AND CO.IDOBJETO   = ' + IntToStr(iObjeto)   + #13;
   if iItem > 0     then sSQL := sSQL + 'AND CO.IDITEM     = ' + IntToStr(iItem)     + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlContratoRateioOrc.IntegraOrcamento(const iAno : Integer): Boolean;
var
   sSQL            : String;
   i               : Integer;
   dDataReferencia : TDateTime;
begin
   Result := True;

   sSQL :=
   'SELECT'                                                                                          + #13 +
   '    RCC.IDPESSOA,'                                                                               + #13 +
   '    RCC.IDPLANOORCAMEN,'                                                                         + #13 +
   '    RCC.IDCONTAORCAMEN,'                                                                         + #13 +
   '    CRO.MES,'                                                                                    + #13 +
   '    SUM((CRO.VALOR*DECODE(CRO.QTDE,0,1,NVL(CRO.QTDE,1))) * (RCC.PERCRATEIOCONTR/100)) AS TOTAL'  + #13 +
   'FROM'                                                                                            + #13 +
   '    RATEIOCENTROCUSTO RCC,'                                                                      + #13 +
   '    CONTRATOXORCAMEN  CRO'                                                                       + #13 +
   'WHERE'                                                                                           + #13 +
   '    RCC.IDCONTRATO     = CRO.IDCONTRATO'                                                         + #13 +
   'AND RCC.IDOBJETO       = CRO.IDOBJETO'                                                           + #13 +
   'AND RCC.IDITEM         = CRO.IDITEM'                                                             + #13 +
   'AND RCC.IDCONTRATO     = CRO.IDCONTRATO'                                                         + #13 +
   'AND RCC.IDCONTAORCAMEN IS NOT NULL'                                                              + #13 +
   'AND CRO.ANO            = ' + IntToStr(iAno)                                                      + #13 +
   'GROUP BY'                                                                                        + #13 +
   '    RCC.IDPESSOA,'                                                                               + #13 +
   '    RCC.IDPLANOORCAMEN,'                                                                         + #13 +
   '    RCC.IDCONTAORCAMEN,'                                                                         + #13 +
   '    CRO.MES'                                                                                     + #13; 

   FCdsContrRateioOrc.Data := GetDataPacket(sSQL);
   StartTransaction;

   try
      while not FCdsContrRateioOrc.eof do
      begin
         sSQL :=
         'DELETE FROM SALDOORCADO '                                                                   + #13 +
         'WHERE IDPESSOA       = ' + FCdsContrRateioOrc.FieldByName('IDPESSOA').AsString              + #13 +
         'AND   IDPLANOORCAMEN = ' + FCdsContrRateioOrc.FieldByName('IDPLANOORCAMEN').AsString        + #13 +
         'AND   IDCONTAORCAMEN = ' + FCdsContrRateioOrc.FieldByName('IDCONTAORCAMEN').AsString        + #13 +
         'AND   EXERCICIO      = ' + IntToStr(iAno)                                                   + #13;
         if not ExecSql(sSQL) then
            Raise Exception.Create('Erro ao excluir o saldo orçado da conta ' + FCdsContrRateioOrc.FieldByName('IDCONTAORCAMEN').AsString);
         FCdsContrRateioOrc.Next;
      end;

      FCdsContrRateioOrc.First;
      while not FCdsContrRateioOrc.eof do
      begin
         dDataReferencia := EncodeDate(iAno,FCdsContrRateioOrc.FieldByName('MES').AsInteger,1);
         CtrlSaldoOrcado.InsereSaldo(iAno,
                                     FCdsContrRateioOrc.FieldByName('MES').AsInteger,
                                     FCdsContrRateioOrc.FieldByName('IDPLANOORCAMEN').AsInteger,
                                     FCdsContrRateioOrc.FieldByName('IDPESSOA').AsInteger,
                                     FCdsContrRateioOrc.FieldByName('IDCONTAORCAMEN').AsString,
                                     FormatDateTime('dd/mm/yyyy',dDataReferencia),
                                     FCdsContrRateioOrc.FieldByName('TOTAL').AsFloat,
                                     0,0,0,0,0);
         FCdsContrRateioOrc.Next;
      end;
      commit;
      MessageInfo := 'Integração realizada com sucesso';
   except
      on E : Exception do begin
         Result := False;
         RollBack;
         MessageInfo := E.Message;
      end;
   end;
end;



function TCtrlContratoRateioOrc.ListaFormasApuracao(idFormula: Double; iPeriodo : Integer): Olevariant;
var
   sSql : TStringList;
begin
   sSql := TStringList.Create;
   try
      sSql.Add('SELECT FD.IDFORMORCADODET, ');
      sSql.Add('       FD.IDFORMAAPURACAO, ');
      sSql.Add('       FD.IDFORMORCADO, ');
      sSql.Add('       FD.MOECODIGO, ');
      sSql.Add('       FD.DATA, ');
      sSql.Add('       FD.PERIODOINI, ');
      sSql.Add('       FD.PERIODOFIM, ');
      sSql.Add('       FD.PERCENTUAL, ');
      sSql.Add('       FD.FLGACUMPERC, ');
      sSql.Add('       FD.FLGACUMULAMOEDA, ');
      sSql.Add('       F.BASEARREDONDAMENTO, ');
      sSql.Add('       MO.MOEDESC, ');
      sSql.Add('       MO.MOESIGLA, ');
      sSql.Add('       DECODE(FD.IDFORMAAPURACAO, 1, ''Moviment. Último Mês Apurado'', ');
      sSql.Add('                                  2, ''Média Moviment. dos Meses'', ');
      sSql.Add('                                  3, ''Somatório Moviment. dos Meses'', ');
      sSql.Add('                                  4, ''Período a Período'', ');
      sSql.Add('                                  5, ''Orçado do Mês anterior'', ');
      sSql.Add('                                     ''Não Definida'') AS FORMAAPURACAO ');

      sSql.Add('  FROM FORMORCADODET FD, ');
      sSql.Add('       FORMORCADO F, ');
      sSql.Add('       MOEDA MO ');

      sSql.Add(' WHERE FD.IDFORMORCADO = ' + IntToStr(Trunc(idFormula)));
      sSql.Add(' AND   FD.IDFORMORCADO = F.IDFORMORCADO ');
      sSql.Add(' AND   FD.MOECODIGO    = MO.MOECODIGO(+) ');
      sSql.Add(' AND  ' + IntToStr(iPeriodo) + ' BETWEEN FD.PERIODOINI AND FD.PERIODOFIM ');

      sSql.Add(' ORDER BY PERIODOINI, PERIODOFIM ');

      Result  := GetDataPacket(sSql);
   finally
      FreeAndNil(sSql);
   end;
end;



function TCtrlContratoRateioOrc.ListaFormulaApuraOrc(idFormula: Double): Olevariant;
var
   sSql : TStringList;
begin
   sSql := TStringList.Create;
   try
      sSql.Add('SELECT IDFORMORCADO, ');
      sSql.Add('       NOME, ');
      sSql.Add('       DESCRICAO,');
      sSql.Add('       BASEARREDONDAMENTO, ');
      sSql.Add('       BASECALCULO ');
      sSql.Add('  FROM FORMORCADO ');

      if idFormula <> 0 then
        sSql.Add(' WHERE IDFORMORCADO = ' + IntToStr(Trunc(idFormula)));

      Result := GetDataPacket(sSql);
   finally
      FreeAndNil(sSql);
   end;
end;



function TCtrlContratoRateioOrc.ListaContratosComFormulas(const iContrato,iFormula: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT DISTINCT'                                                            + #13 +
   '    CON.IDCONTRATO,'                                                        + #13 +
   '    CON.IDPESSOA,'                                                          + #13 +
   '    CON.CODCONTRATOEMPR,'                                                   + #13 +
   '    CON.NOMECONTRATO,'                                                      + #13 +
   '    CON.DATAPREVENCERRA,'                                                   + #13 +
   '    OIC.IDOBJETO,'                                                          + #13 +
   '    OIC.IDITEM'                                                             + #13 +                                                              
   'FROM'                                                                       + #13 +
   '    CONTRATOCONTR CON,'                                                     + #13 +
   '    RATEIOCENTROCUSTO RCC,'                                                 + #13 +
   '    OBJETOSXITEMCONTR OIC'                                                  + #13 +
   'WHERE'                                                                      + #13 +
   '    RCC.IDCONTRATO     = CON.IDCONTRATO'                                    + #13 +
   'AND RCC.IDOBJETO       = OIC.IDOBJETO'                                      + #13 +
   'AND RCC.IDITEM         = OIC.IDITEM'                                        + #13 +
   'AND OIC.IDCONTRATO     = CON.IDCONTRATO'                                    + #13 +
   'AND CON.FLGFIMCONTRATO <> ''E'''                                            + #13 +
   'AND OIC.IDFORMORCADO   IS NOT NULL'                                         + #13 +
   'AND RCC.IDCONTAORCAMEN IS NOT NULL'                                         + #13;

   if iContrato > 0 then sSQL := sSQL + 'AND CON.IDCONTRATO   = ' + IntToStr(iContrato) + #13;
   if iFormula > 0  then sSQL := sSQL + 'AND OIC.IDFORMORCADO = ' + IntToStr(iFormula)  + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlContratoRateioOrc.ListaMovimentacaoContrato(const iMesIni,iAnoIni, iMesFim, iAnoFim, iContrato, iObjeto, iItem: Integer): OleVariant;
var
   sAnoIni, sAnoFim, sMesIni, sMesFim, sSQL : String;
begin
   sAnoIni := IntToStr(iAnoIni);
   sAnoFim := IntToStr(iAnoFim);

   sMesIni := IntToStr(iMesIni);
   sMesFim := IntToStr(iMesFim);

   if Length(sMesIni) = 1 then sMesIni := '0' + sMesIni;
   if Length(sMesFim) = 1 then sMesFim := '0' + sMesFim;

   sSQL :=
   'SELECT'                                                                             + #13 +
   '    P.IDCONTRATO,'                                                                  + #13 +
   '    P.IDPESSOA,'                                                                    + #13 +
   '    I.NOME_ITEM,'                                                                   + #13 +
   '    P.IDOBJETO,'                                                                    + #13 +
   '    P.IDITEM,'                                                                      + #13 +
   '    OIC.IDFORMORCADO,'                                                              + #13 +
   '    TO_CHAR(DECODE(C.DATABASE,NULL,SYSDATE,C.DATABASE),''YYYYMM'') AS DATABASE,'    + #13 +
   '    TO_CHAR(DATAVENCPARCELA,''MM'') AS MES,'                                        + #13 +
   '    NVL(SUM(P.QTDEPARCELA),1) AS QUANTIDADE,'                                       + #13 +
   '    ROUND(SUM(P.VALOROBJPARCELA),2) AS VALOR'                                       + #13 +
   'FROM'                                                                               + #13 +
   '    PARCELAREALCONTR P,'                                                            + #13 +
   '    CORRECAOCONTR C,'                                                               + #13 +
   '    OBJETOSXITEMCONTR OIC,'                                                         + #13 +
   '    ITEMCONTRATUAL I'                                                               + #13 +
   'WHERE'                                                                              + #13 +
   '    P.IDCONTRATO = C.IDCONTRATO(+)'                                                 + #13 +
   'AND P.IDOBJETO   = C.IDOBJETO(+)'                                                   + #13 +
   'AND P.IDITEM     = C.IDITEM(+)'                                                     + #13 +
   'AND I.IDITEM     = P.IDITEM'                                                        + #13 +
   'AND TO_CHAR(P.DATAVENCPARCELA,''YYYYMM'') >= ' + (sAnoIni + sMesIni)                + #13 +
   'AND TO_CHAR(P.DATAVENCPARCELA,''YYYYMM'') <= ' + (sAnoFim + sMesFim)                + #13 +
   'AND P.IDCONTRATO = ' + IntToStr(iContrato)                                          + #13 +
   'AND P.IDOBJETO   = ' + IntToStr(iObjeto)                                            + #13 +
   'AND P.IDITEM     = ' + IntToStr(iItem)                                              + #13 +
   'AND OIC.IDCONTRATO = P.IDCONTRATO'                                                  + #13 +
   'AND OIC.IDOBJETO  = P.IDOBJETO'                                                     + #13 +
   'AND OIC.IDITEM    = P.IDITEM'                                                       + #13 +
   'AND OIC.IDFORMORCADO IS NOT NULL'                                                   + #13 +
   'GROUP BY'                                                                           + #13 +
   '    P.IDCONTRATO,'                                                                  + #13 +
   '    P.IDPESSOA,'                                                                    + #13 +
   '    I.NOME_ITEM,'                                                                   + #13 +
   '    P.IDOBJETO,'                                                                    + #13 +
   '    P.IDITEM,'                                                                      + #13 +
   '    OIC.IDFORMORCADO,'                                                              + #13 +
   '    C.DATABASE,'                                                                    + #13 +
   '    TO_CHAR(DATAVENCPARCELA,''MM'')'                                                + #13 +
   'ORDER BY'                                                                           + #13 +
   '    MES'                                                                            + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlContratoRateioOrc.LookupItensContrato(const iAno: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT DISTINCT'                                    + #13 +
   '     CRO.IDCONTRATO,'                               + #13 +
   '     C.CODCONTRATOEMPR,'                            + #13 +
   '     C.NOMECONTRATO,'                               + #13 +
   '     OC.NOMEOBJETO,'                                + #13 +
   '     IC.NOME_ITEM,'                                 + #13 +
   '     CRO.IDOBJETO,'                                 + #13 +
   '     CRO.IDITEM'                                    + #13 +
   'FROM'                                               + #13 +
   '      CONTRATOCONTR C,'                             + #13 +
   '      OBJETOCONTRATUAL OC,'                         + #13 +
   '      ITEMCONTRATUAL IC,'                           + #13 +
   '      CONTRATOXORCAMEN CRO'                         + #13 +
   'WHERE'                                              + #13 +
   '      OC.IDOBJETO  = CRO.IDOBJETO'                  + #13 +
   '  AND IC.IDITEM    = CRO.IDITEM'                    + #13 +
   '  AND C.IDCONTRATO = CRO.IDCONTRATO'                + #13 +
   '  AND CRO.ANO      = ' + IntToStr(iAno)             + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlContratoRateioOrc.ListaContratosParaOrcamento(const iContrato, iFormula  : Integer) : OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT DISTINCT'                                            + #13 +
   '    1 AS FLGPROCESSA,'                                      + #13 +
   '    CON.IDCONTRATO,'                                        + #13 +
   '    CON.NOMECONTRATO'                                       + #13 +
   'FROM'                                                       + #13 +
   '    CONTRATOCONTR CON,'                                     + #13 +
   '    RATEIOCENTROCUSTO RCC,'                                 + #13 +
   '    OBJETOSXITEMCONTR OIC'                                  + #13 +
   'WHERE'                                                      + #13 +
   '    RCC.IDCONTRATO     = CON.IDCONTRATO'                    + #13 +
   'AND RCC.IDOBJETO       = OIC.IDOBJETO'                      + #13 +
   'AND RCC.IDITEM         = OIC.IDITEM'                        + #13 +
   'AND OIC.IDCONTRATO     = CON.IDCONTRATO'                    + #13 +
   'AND CON.FLGFIMCONTRATO <> ''E'''                            + #13 +
   'AND OIC.IDFORMORCADO   IS NOT NULL'                         + #13 +
   'AND RCC.IDCONTAORCAMEN IS NOT NULL'                         + #13;

   if iContrato > 0 then sSQL := sSQL + 'AND CON.IDCONTRATO = '   + IntToStr(iContrato) + #13;
   if iFormula > 0  then sSQL := sSQL + 'AND OIC.IDFORMORCADO = ' + IntToStr(iFormula)  + #13;

   sSQL := sSQL +
   'ORDER BY'                                                   + #13 +
   '    CON.IDCONTRATO'                                         + #13;


   Result := GetDataPacket(sSQL);
end;



function TCtrlContratoRateioOrc.ProcessaCalculoOrcamento(const iMesIni, iAnoIni, iMesFim, iAnoFim, iAnoApura, iContrato, iFormula: Integer): Boolean;
var
   cdsFormula  : TCMClientDataSet;
   iMesProc    : Integer;
   iRegistro   : TBookMark;
   sMes, sAno  : String;
   sMesAnt     : String;
   bReajustou  : Boolean;
   aValores    : array of TRegistroOrcado;
   iContador   : Integer;
   sForma      : String;

   sDataBase   : String;
begin
   Result     := True;

   sAno       := IntToStr(iAnoApura);
   SetLength(aValores,12);

   cdsFormula  := TCMClientDataSet.Create(nil);

   try
      cdsContratos.Data := ListaContratosComFormulas(iContrato, iFormula);
      cdsContratos.First;
      while not cdsContratos.eof do
      begin
         // Busca os itens e suas movimentações
         cdsItens.Data := ListaMovimentacaoContrato(iMesIni,
                                                    iAnoIni,
                                                    iMesFim,
                                                    iAnoFim,
                                                    cdsContratos.FieldByName('IDCONTRATO').AsInteger,
                                                    cdsContratos.FieldByName('IDOBJETO').AsInteger,
                                                    cdsContratos.FieldByName('IDITEM').AsInteger
                                                   );

         sDataBase := cdsItens.FieldByName('DATABASE').AsString;

         // Item não possui movimentação
         if cdsItens.IsEmpty then
         begin
            cdsContratos.Next;
            Continue;
         end;

         for iMesProc := 1 to 12 do
         begin

            sMes    := IntToStr(iMesProc);
            sMesAnt := IntToStr(iMesProc -1);
            if Length(sMes) = 1 then sMes := '0' + sMes;

            // Busca a forma de apuração da formula cadastrada no item para o periodo em processamento
            cdsFormula.Data           := ListaFormasApuracao(cdsItens.FieldByName('IDFORMORCADO').AsInteger,
                                                             iMesProc);

            // Inicializa os valores
            RegistroOrcado.Valor      := 0;
            RegistroOrcado.Quantidade := 0;

            iRegistro                 := cdsItens.GetBookmark;

            // Verifica o tipo de calculo que deve ser feito
            case cdsFormula.FieldByName('IDFORMAAPURACAO').AsInteger of
               1 : begin
                      RegistroOrcado := ProcessaFormaTipo1; // Moviment. Último Mês Apurado
                      sForma := 'Moviment. Último Mês'
                   end;

               2 : begin
                      RegistroOrcado := ProcessaFormaTipo2; // Média Moviment. dos Meses
                      sForma := 'Média Moviment. dos Meses'
                   end;

               3 : begin
                      RegistroOrcado := ProcessaFormaTipo3; // Somatório Moviment. dos Meses
                      sForma := 'Somatório Moviment. dos Meses';
                   end;

               4 : begin                                 // Período a Período
                      RegistroOrcado := ProcessaFormaTipo4;
                      sForma := 'Período a Período';
                   end;

               5 : begin                                // Orçado do Mês anterior
                      sForma := 'Orçado do Mês anterior';
                      if iMesProc >= 2 then
                      begin
                         aValores[iMesProc-1].Valor      := aValores[iMesProc-2].Valor;
                         aValores[iMesProc-1].Quantidade := aValores[iMesProc-2].Quantidade;
                         aValores[iMesProc-1].NomeItem   := aValores[iMesProc-2].NomeItem;
                         aValores[iMesProc-1].Forma      := sForma;
                      end;
                   end;
            end;

            cdsItens.GotoBookMark(iRegistro);
            cdsItens.FreeBookMark(iRegistro);


            // Armazena os valores do mes processado
            if cdsFormula.FieldByName('IDFORMAAPURACAO').AsInteger <> 5 then
            begin
               aValores[iMesProc-1].Valor      := ArredondaFloat(RegistroOrcado.Valor, cdsFormula.FieldByName('BASEARREDONDAMENTO').AsInteger);
               aValores[iMesProc-1].Quantidade := ArredondaFloat(RegistroOrcado.Quantidade, cdsFormula.FieldByName('BASEARREDONDAMENTO').AsInteger);
               aValores[iMesProc-1].NomeItem   := cdsItens.FieldByName('NOME_ITEM').AsString;
               aValores[iMesProc-1].Forma      := sForma;
            end;

         end;

         // Faz o loop no vetor dos meses para efetuar a gravação
         // Esse processo não efetiva a informações no banco de dados
         // apenas grava no ClientDataset para que seja visualizado, impresso
         // e se o usuário desejar, gravar no banco de dados
         for iContador := 0 to 11 do
         begin
            // Grava o valor apurado
            if not FCdsContrRateioOrc.Locate('IDCONTRATO;IDOBJETO;IDITEM;ANO;MES',
                                             VarArrayOf([CdsContratos.FieldByName('IDCONTRATO').AsInteger,
                                                         CdsContratos.FieldByName('IDOBJETO').AsInteger,
                                                         CdsContratos.FieldByName('IDITEM').AsInteger,
                                                         iAnoApura,
                                                         iContador+1
                                                         ]),
                                             []) then
            begin
               FCdsContrRateioOrc.Insert;
               FCdsContrRateioOrc.FieldByName('IDCONTRATO').AsInteger     := CdsContratos.FieldByName('IDCONTRATO').AsInteger;
               FCdsContrRateioOrc.FieldByName('IDOBJETO').AsInteger       := CdsContratos.FieldByName('IDOBJETO').AsInteger;
               FCdsContrRateioOrc.FieldByName('IDITEM').AsInteger         := CdsContratos.FieldByName('IDITEM').AsInteger;
               FCdsContrRateioOrc.FieldByName('ANO').AsInteger            := iAnoApura;
               FCdsContrRateioOrc.FieldByName('MES').AsInteger            := iContador+1;
               FCdsContrRateioOrc.FieldByName('NOMECONTRATO').AsString    := cdsContratos.FieldByName('NOMECONTRATO').AsString;
               FCdsContrRateioOrc.FieldByName('NOME_ITEM').AsString       := aValores[iContador].NomeItem;
               FCdsContrRateioOrc.FieldByName('CODCONTRATOEMPR').AsString := cdsContratos.FieldByName('CODCONTRATOEMPR').AsString;
            end
            else
               FCdsContrRateioOrc.Edit;


            sMes := IntToStr(iContador + 1);
            if Length(sMes) = 1 then sMes := '0' + sMes;

            if (not cdsContratos.FieldByName('DATAPREVENCERRA').IsNull) and (FormatDateTime('yyyymm',cdsContratos.FieldByName('DATAPREVENCERRA').AsDateTime) <= (sAno + sMes)) then
            begin
               aValores[iContador].Valor      := 0;
               aValores[iContador].Quantidade := 0;
            end;

            if sMes >= Copy(sDataBase,5,2) then
            begin
               ExecutaCorrecaoContrato(CdsContratos.FieldByName('IDCONTRATO').AsInteger,
                                       CdsContratos.FieldByName('IDPESSOA').AsInteger,
                                       aValores[iContador].Valor,
                                       aValores[iContador].Valor);
            end;

            FCdsContrRateioOrc.FieldByName('VALOR').AsFloat  := aValores[iContador].Valor;
            FCdsContrRateioOrc.FieldByName('QTDE').AsFloat   := aValores[iContador].Quantidade;
            FCdsContrRateioOrc.FieldByName('FORMA').AsString := aValores[iContador].Forma;

            FCdsContrRateioOrc.Post;
         end;
         cdsContratos.Next;
      end;
   finally
      FreeAndNil(cdsFormula);
   end;
end;



procedure TCtrlContratoRateioOrc.SetcdsContratos(const Value: TCMClientDataSet);
begin
   FcdsContratos := Value;
end;



function TCtrlContratoRateioOrc.ArredondaFloat(Valor: double; TipoArred: integer): double;
var
   sVal : string;
   valf : double;
begin
   sVal := '';
   case tipoArred of
      1: begin // 2 Casas Decimais = 10.845,55
            sVal  := FormatFloat('###0.00', valor);
            valor := StrToFloat(sVal);
         end;
      2: begin //Centavo = 10.846,00
            valf := frac(valor);
            if valf >= 0.50 then valor := trunc(valor) + 1
            else                 valor := trunc(valor);
         end;
      3: begin //Dezena = 10.850,00
            valor := trunc(valor);
            valor := valor / 10;
            valf := frac(valor);
            if valf >= 0.50 then valor := (trunc(valor) + 1) * 10
            else                 valor := trunc(valor) * 10;
         end;
      4: begin //10.845,55 para Centena = 10.900,00
            if valor >= 1000 then
            begin
               valor := trunc(valor);
               valor := valor / 1000;
               valf  := frac(valor);
               valf  := round(valf) * 100;
               valor := (trunc(valor * 10) * 100) + valf;
            end
            else
               valor := 0;
         end;
      5: begin //10.845,55 para Milhar = 11.000,00
            valor := trunc(valor);
            valor := valor / 1000;
            valor := round(valor) * 1000;
         end;
   end; //case
   result := valor;
end;



procedure TCtrlContratoRateioOrc.SetcdsItens(const Value: TCMClientDataSet);
begin
   FcdsItens := Value;
end;



function TCtrlContratoRateioOrc.ProcessaFormaTipo1: TRegistroOrcado; // Moviment. Último Mês Apurado
begin
   cdsItens.Last;
   RegistroOrcado.Valor      := cdsItens.FieldByName('VALOR').AsFloat;
   RegistroOrcado.Quantidade := cdsItens.FieldByName('QUANTIDADE').AsFloat;
   Result := RegistroOrcado;
end;



function TCtrlContratoRateioOrc.ProcessaFormaTipo2: TRegistroOrcado; // Média Moviment. dos Meses
var
   fValor, fQuant : Double;
   iMeses         : Integer;
begin
   cdsItens.First;
   fValor := 0;
   fQuant := 0;
   iMeses := 0;

   RegistroOrcado.Valor      := 0;
   RegistroOrcado.Quantidade := 0;

   while not cdsItens.Eof do
   begin
      if (cdsItens.FieldByName('VALOR').AsFloat <> 0) or
         (cdsItens.FieldByName('QUANTIDADE').AsFloat <> 0) then
      begin
         Inc(iMeses);
         fValor := fValor + cdsItens.FieldByName('VALOR').AsFloat;
         fQuant := fQuant + cdsItens.FieldByName('QUANTIDADE').AsFloat;
      end;
      cdsItens.Next;
   end;

   if iMeses > 0 then
   begin
      RegistroOrcado.Valor      := fValor / iMeses;
      RegistroOrcado.Quantidade := fQuant / iMeses;
   end;
   Result := RegistroOrcado;
end;



function TCtrlContratoRateioOrc.ProcessaFormaTipo3: TRegistroOrcado; // Somatório Moviment. dos Meses
begin
   cdsItens.First;

   RegistroOrcado.Valor      := 0;
   RegistroOrcado.Quantidade := 0;

   while not cdsItens.Eof do
   begin
      RegistroOrcado.Valor      := RegistroOrcado.Valor      + cdsItens.FieldByName('VALOR').AsFloat;
      RegistroOrcado.Quantidade := RegistroOrcado.Quantidade + cdsItens.FieldByName('QUANTIDADE').AsFloat;
      cdsItens.Next;
   end;

   Result := RegistroOrcado;
end;



function TCtrlContratoRateioOrc.ProcessaFormaTipo4: TRegistroOrcado; // Período a Período
begin
   RegistroOrcado.Valor      := cdsItens.FieldByName('VALOR').AsFloat;
   RegistroOrcado.Quantidade := cdsItens.FieldByName('QUANTIDADE').AsFloat;
   Result := RegistroOrcado;
end;



function TCtrlContratoRateioOrc.ProcessaFormaTipo5: TRegistroOrcado; // Orçado do Mês anterior
begin
   RegistroOrcado.Valor      := cdsItens.FieldByName('VALOR').AsFloat;
   RegistroOrcado.Quantidade := cdsItens.FieldByName('QUANTIDADE').AsFloat;
   Result := RegistroOrcado;
end;



function TCtrlContratoRateioOrc.ExecutaCorrecaoContrato(const iContrato, iPessoa : Integer; const fValor : Currency; var fValorReajustado : Currency) : Boolean;
var
   cdsCorrecao              : TCMClientDataSet;
   cdsCotacaoMoeda          : TCMClientDataSet;
   rValorBase               : Double;
   rValorTotal              : Double;
   sTipoAtualizacao         : String;
   sNomeRef                 : String;
   rFaixaInicial            : Double;
   rFaixaFinal              : Double;
   rVlrCorrProced           : Double;
   rVlrAux                  : Double;
   sFaixaAcumulativa        : String;
   fFatorReal, fFatorProj   : Extended;
begin
   cdsCorrecao     := TCMClientDataSet.Create(nil);
   cdsCotacaoMoeda := TCMClientDataSet.Create(nil);

   try
      cdsCorrecao.Data := CtrlCorrecao.ListCorrecoes(iContrato, iPessoa, True);

      rValorBase := fValor;
      sNomeRef   := '';

      if not cdsCorrecao.FieldByName('IDREFCONTR').IsNull then
      begin
         CtrlVlrReferencia.BuscaValorRef(cdsCorrecao.FieldByName('IDREFCONTR').AsFloat,
                                         cdsItens.FieldByName('IDPESSOA').AsInteger,
                                         cdsCorrecao.FieldByName('FREQUENCIA').AsString,
                                         cdsCorrecao.FieldByName('DATAEFETIVA').AsDateTime,
                                         rValorBase,
                                         sNomeRef,
                                         True);
      end;

      sTipoAtualizacao  := cdsCorrecao.FieldByName('TIPOCORRECAO').AsString;
      rFaixaInicial     := cdsCorrecao.FieldByName('FAIXAINICIAL').AsFloat;
      rFaixaFinal       := cdsCorrecao.FieldByName('FAIXAFINAL').AsFloat;
      rVlrCorrProced    := cdsCorrecao.FieldByName('VALOR').AsFloat;
      sFaixaAcumulativa := cdsCorrecao.FieldByName('FLGFAIXARATACU').AsString;

      if sTipoAtualizacao = '' then
         rValorTotal := rValorBase
      else
      if (sTipoAtualizacao = 'PC') then //Percentual
         rValorTotal := rValorBase + (rValorBase * (rVlrCorrProced /100) )
      else
      if (sTipoAtualizacao = 'VA') then //Valor Absoluto
         rValorTotal := rValorTotal + rVlrCorrProced
      else
      if (sTipoAtualizacao = 'FP') then //Faixa Percentual
      begin
         if (sFaixaAcumulativa = 'N') then //Normal
         begin
            if (rValorBase >= rFaixaInicial) and (rValorBase <= rFaixaFinal) then
               rValorTotal := rValorBase + (rValorBase * (rVlrCorrProced / 100));
         end
         else
         if (sFaixaAcumulativa = 'A') then //Acumulativa
         begin
            if (rValorBase >= rFaixaFinal) then
               rValorTotal := rValorBase + (rValorBase * (rVlrCorrProced / 100));
         end
         else
         if (sFaixaAcumulativa = 'P') then //Acumulativa Proporcional
         begin
            rVlrAux := 0;
            if (rValorBase >= rFaixaInicial) and (rValorBase <= rFaixaFinal) then
               rVlrAux := (rValorBase - rFaixaInicial) * (rVlrCorrProced / 100)
            else
            if (rValorBase > rFaixaFinal) then
               rVlrAux := (rFaixaFinal - rFaixaInicial) * (rVlrCorrProced / 100);
            rValorTotal := rValorBase + rVlrAux;
         end;
      end
      else
      if (sTipoAtualizacao = 'FV') then //Faixa Valor Absoluto
      begin
         if (((sFaixaAcumulativa = 'A') or (sFaixaAcumulativa = 'P')) and
              (rValorBase >= rFaixaInicial)) or
              ((rValorBase >= rFaixaInicial) and (rValorBase <= rFaixaFinal)) then
            rValorTotal := rValorBase + rVlrCorrProced;
      end
      else
      if (sTipoAtualizacao = 'MD') then //Moeda
      begin
          fFatorReal := 1;
          fFatorProj := 1;
          rVlrAux    := rValorBase;
          if (cdsCorrecao.FieldByName('DATAULTIMACORR').IsNull) then
          begin
             cdsCotacaoMoeda.Data := CtrlCotacaoMoeda.ListaCotacoesIntervalo(cdsCorrecao.FieldByName('MOECODIGO').AsFloat,
                                                                             cdsCorrecao.FieldByName('DATABASE').AsDateTime,
                                                                             cdsCorrecao.FieldByName('DATAEFETIVA').AsDateTime);
             fFatorReal := FatorCorrecao(cdsCorrecao.FieldByName('MOECODIGO').AsInteger,
                                         cdsCorrecao.FieldByName('DATABASE').AsDateTime,
                                         cdsCorrecao.FieldByName('DATAEFETIVA').AsDateTime-1,
                                         True);

             cdsCotacaoMoeda.Last;
             if cdsCotacaoMoeda.FieldByName('COTDATA').AsDateTime < cdsCorrecao.FieldByName('DATAEFETIVA').AsDateTime then
             begin
                fFatorProj := FatorCorrecao(cdsCorrecao.FieldByName('MOECODIGOPROJ').AsInteger,
                                            cdsCotacaoMoeda.FieldByName('COTDATA').AsDateTime + 1,
                                            cdsCorrecao.FieldByName('DATAEFETIVA').AsDateTime-1,
                                            True);
             end;
          end
          else
          begin
             cdsCotacaoMoeda.Data := CtrlCotacaoMoeda.ListaCotacoesIntervalo(cdsCorrecao.FieldByName('MOECODIGO').AsFloat,
                                                                             cdsCorrecao.FieldByName('DATAULTIMACORR').AsDateTime,
                                                                             cdsCorrecao.FieldByName('DATAEFETIVA').AsDateTime);

             fFatorReal := FatorCorrecao(cdsCorrecao.FieldByName('MOECODIGO').AsInteger,
                                         cdsCorrecao.FieldByName('DATAULTIMACORR').AsDateTime,
                                         cdsCorrecao.FieldByName('DATAEFETIVA').AsDateTime-1,
                                         True);

             cdsCotacaoMoeda.Last;
             if cdsCotacaoMoeda.FieldByName('COTDATA').AsDateTime < cdsCorrecao.FieldByName('DATAEFETIVA').AsDateTime then
             begin
                fFatorProj := FatorCorrecao(cdsCorrecao.FieldByName('MOECODIGOPROJ').AsInteger,
                                            cdsCotacaoMoeda.FieldByName('COTDATA').AsDateTime + 1,
                                            cdsCorrecao.FieldByName('DATAEFETIVA').AsDateTime-1,
                                            True);
             end;
          end;
          rValorTotal := rVlrAux * (fFatorReal * fFatorProj);
      end;

      fValorReajustado := rValorTotal;
   finally
      Result := True;
      FreeAndNil(cdsCotacaoMoeda);
      FreeAndNil(cdsCorrecao);
   end;
end;



function TCtrlContratoRateioOrc.FatorCorrecao(const iIdMoeda: Integer; const dDataIni, dDataFim: TDateTime; const bFatorNegativo: boolean): Extended;
var
   cdsTemp : TCMClientDataSet;
   sSQL, sTipoCotacao, sPeriodicidade, sAnoIni, sMesIni, sAnoFim, sMesFim, sUltMes, sUltAno : string;
   dDataIniCalc, dDataFimCalc, dDataIniNova, dDataFimNova, dUltCotacao: TDateTime;
   fCotacaoIni, fCotacaoFim, fFatorCorrecao : Double;
   iDiasMes, iDiasCalculo : Integer;
   rCodMoeda: Double;
   bUltDiaMes : Boolean;
begin
   fFatorCorrecao := 1;
   fCotacaoIni    := 0;
   fCotacaoFim    := 0;
   cdsTemp        := nil;
   rCodMoeda      := StrToFloat(IntToStr(iIdMoeda));

   try
     cdsTemp := TCMClientDataSet.Create( nil );

     // Sai do processo se não existir moeda
     if (iIdMoeda <= 0) then begin
        Result := fFatorCorrecao;
        Exit;
     end;

     // primeiro verifica a periodicidade e tipo da cotação
     cdsTemp.Data := CtrlMoeda.ListaMoeda(rCodMoeda, True);

     // se não se encontrar a moeda ou se as flags forem nulas, sai com Resultado 1
     if ( (cdsTemp.IsEmpty) or
          (cdsTemp.FieldByName('FLGPERCVALOR').isNull) or
          (cdsTemp.FieldByName('MOEPERIODICIDADE').isNULL) ) then begin

         Result := 1;
         Exit;
     end;

     sTipoCotacao   := cdsTemp.FieldByName('FLGPERCVALOR').AsString;
     sPeriodicidade := cdsTemp.FieldByName('MOEPERIODICIDADE').AsString;

     // utilia variáveis auxiliares para efetuar calculo, para não interferir no
     // valor recebido pela função
     dDataIniCalc := dDataIni;
     dDataFimCalc := dDataFim;

     sAnoIni := IntToStr(_DiasUteis.ExtraiAno(dDataIniCalc));
     sMesIni := IntToStr(_DiasUteis.ExtraiMes(dDataIniCalc));
     if length(sMesIni) = 1 then sMesIni := '0' + sMesIni;

     sAnoFim := IntToStr(_DiasUteis.ExtraiAno(dDataFimCalc));
     sMesFim := IntToStr(_DiasUteis.ExtraiMes(dDataFimCalc));
     if length(sMesFim) = 1 then sMesFim := '0' + sMesFim;

     // Calcula Cotações por PERCENTUAL
     if sTipoCotacao = 'P' then begin

       // Calcula cotações DIÁRIA
       if sPeriodicidade = 'D' then begin
         // Busca as cotações do intervalo
         cdsTemp.Data := CtrlCotacaoMoeda.ListaCotacoesIntervalo(rCodMoeda,dDataIni,dDataFim);

         dUltCotacao := (dDataIni -1);

         while not cdsTemp.Eof do begin
            fCotacaoFim := cdsTemp.FieldByName('COTVALOR').asFloat;
            dUltCotacao := cdsTemp.FieldByName('COTDATA').asDateTime;

            // Calculo Pro-Rata - fator composto
            fFatorCorrecao := fFatorCorrecao * (1 + (fCotacaoFim / 100) );

            cdsTemp.Next;
         end;
       end;

       // Calcula cotações MENSAL
       if sPeriodicidade = 'M' then begin
         // Busca as cotações do intervalo
         cdsTemp.Data := CtrlCotacaoMoeda.ListaCotacoesIntervalo(rCodMoeda,-1,-1,(sAnoIni+sMesIni),(sAnoFim+sMesFim));

         dDataIniNova := dDataIniCalc;
         while not cdsTemp.Eof do begin

            // CALCULA O PRO-RATA
            // calcula o último dia do mes com referência na data inicial nova
            dDataFimNova := _DiasUteis.UltDiaMes(_DiasUteis.ExtraiAno(dDataIniNova),_DiasUteis.ExtraiMes(dDataIniNova));
            if dDataFimCalc < dDataFimNova then dDataFimNova := dDataFimCalc;
            iDiasMes     := _DiasUteis.ExtraiDia(_DiasUteis.UltDiaMes(_DiasUteis.ExtraiAno(dDataIniNova), _DiasUteis.ExtraiMes(dDataIniNova)));
            iDiasCalculo := _DiasUteis.IntervaloDias(dDataIniNova, dDataFimNova) + 1;

            fCotacaoFim := cdsTemp.FieldByName('COTVALOR').AsFloat;

            // Calculo Pro-Rata - fator composto
            fFatorCorrecao := fFatorCorrecao * ( Power(1 + (fCotacaoFim/100), (iDiasCalculo/iDiasMes) ) );

            cdsTemp.Next;

            dDataIniNova := StrToDate('01/'+
                            copy(cdsTemp.FieldByName('COTMESREF').AsString,1,2) +'/'+ // mes
                            copy(cdsTemp.FieldByName('COTMESREF').AsString,3,4));     // ano
         end;
       end;

     end;

     if sTipoCotacao = 'V' then begin  // valor
       if ( CtrlCotacaoMoeda.TestarCotacaoMoeda(rCodMoeda, dDataIni, False, fCotacaoIni) ) and
          ( CtrlCotacaoMoeda.TestarCotacaoMoeda(rCodMoeda, dDataFim, False, fCotacaoFim) ) then begin
         fFatorCorrecao := fCotacaoFim / fCotacaoIni;
       end else begin
         Result := 1;
       end;
     end;

     // verifica se o fator pode ser negativo, se não puder, zera a correção
     if not( bFatorNegativo ) then if fFatorCorrecao < 1 then fFatorCorrecao := 1;
     Result := fFatorCorrecao;
   finally
     cdsTemp.Free;
   end;
end;



end.




function TCtrlContratoRateioOrc.ProcessaCalculoOrcamento(const iMesIni, iAnoIni, iMesFim, iAnoFim, iAnoApura, iContrato, iFormula: Integer): Boolean;
var
   cdsFormula  : TCMClientDataSet;
   iMesProc    : Integer;
   iRegistro   : TBookMark;
   sMes, sAno  : String;
   sMesAnt     : String;
   bReajustou  : Boolean;
   aValores    : array of TRegistroOrcado;
   iContador   : Integer;
   sForma      : String;
begin
   Result     := True;

   sAno       := IntToStr(iAnoApura);
   SetLength(aValores,12);

   cdsFormula  := TCMClientDataSet.Create(nil);

   try
      cdsContratos.Data := ListaContratosComFormulas(iContrato, iFormula);
      cdsContratos.First;
      while not cdsContratos.eof do
      begin
         // Busca os itens e suas movimentações
         cdsItens.Data := ListaMovimentacaoContrato(iMesIni,
                                                    iAnoIni,
                                                    iMesFim,
                                                    iAnoFim,
                                                    cdsContratos.FieldByName('IDCONTRATO').AsInteger,
                                                    cdsContratos.FieldByName('IDOBJETO').AsInteger,
                                                    cdsContratos.FieldByName('IDITEM').AsInteger
                                                   );
         // Processa os cálculos para cada item
         bReajustou  := False;

         iMesProc := 0;
         while not cdsItens.eof do
         begin

            // faz o loop para cada mes. Esse loop serve para determinar
            // o tipo de calculo para cada mes a ser processado
            inc(iMesProc);

            sMes    := IntToStr(iMesProc);
            sMesAnt := IntToStr(iMesProc -1);
            if Length(sMes) = 1 then sMes := '0' + sMes;

            // Faz a verificacao se o contrato tem reajuste no mes
            if (FormatDateTime('yyyymm',cdsItens.FieldByName('DATABASE').AsDateTime) = (sAno + sMes)) and
               (cdsItens.FieldByName('MES').AsString >= sMes) then
            begin
               // Aplica o reajuste
               iRegistro := cdsItens.GetBookmark;

               if not bReajustou then
               begin
                  if cdsItens.Locate('MES',sMes,[]) then bReajustou := ExecutaCorrecaoContrato;
               end;

               cdsItens.GotoBookMark(iRegistro);
               cdsItens.FreeBookMark(iRegistro);
            end;

            // Faz a verificação se o contrato está em atividade no mes
            if FormatDateTime('yyyymm',cdsContratos.FieldByName('DATAPREVENCERRA').AsDateTime) <= (sAno + sMes) then
            begin
               RegistroOrcado.Valor      := 0;
               RegistroOrcado.Quantidade := 0;
            end
            else
            begin
               // Busca a forma de apuração da formula cadastrada no item para o periodo em processamento
               cdsFormula.Data           := ListaFormasApuracao(cdsItens.FieldByName('IDFORMORCADO').AsInteger,
                                                                cdsItens.FieldByName('MES').AsInteger);

               // Inicializa os valores
               RegistroOrcado.Valor      := 0;
               RegistroOrcado.Quantidade := 0;

               iRegistro                 := cdsItens.GetBookmark;

               // Verifica o tipo de calculo que deve ser feito
               case cdsFormula.FieldByName('IDFORMAAPURACAO').AsInteger of
                  1 : begin
                         RegistroOrcado := ProcessaFormaTipo1; // Moviment. Último Mês Apurado
                         sForma := 'Moviment. Último Mês'
                      end;

                  2 : begin
                         RegistroOrcado := ProcessaFormaTipo2; // Média Moviment. dos Meses
                         sForma := 'Média Moviment. dos Meses'
                      end;

                  3 : begin
                         RegistroOrcado := ProcessaFormaTipo3; // Somatório Moviment. dos Meses
                         sForma := 'Somatório Moviment. dos Meses';
                      end;

                  4 : begin                                 // Período a Período
                         if cdsItens.Locate('MES',sMes,[]) then
                            RegistroOrcado := ProcessaFormaTipo4;
                         sForma := 'Período a Período';
                      end;

                  5 : begin                                // Orçado do Mês anterior
                         sForma := 'Orçado do Mês anterior';
                         aValores[iMesProc-1].Valor      := aValores[iMesProc-2].Valor;
                         aValores[iMesProc-1].Quantidade := aValores[iMesProc-2].Quantidade;
                         aValores[iMesProc-1].NomeItem   := aValores[iMesProc-2].NomeItem;
                         aValores[iMesProc-1].Forma      := sForma;

                      end;
               end;

               cdsItens.GotoBookMark(iRegistro);
               cdsItens.FreeBookMark(iRegistro);
            end;

            // Armazena os valores do mes processado
            if cdsFormula.FieldByName('IDFORMAAPURACAO').AsInteger <> 5 then
            begin
               aValores[iMesProc-1].Valor      := ArredondaFloat(RegistroOrcado.Valor, cdsFormula.FieldByName('BASEARREDONDAMENTO').AsInteger);
               aValores[iMesProc-1].Quantidade := ArredondaFloat(RegistroOrcado.Quantidade, cdsFormula.FieldByName('BASEARREDONDAMENTO').AsInteger);
               aValores[iMesProc-1].NomeItem   := cdsItens.FieldByName('NOME_ITEM').AsString;
               aValores[iMesProc-1].Forma      := sForma;
            end;

            cdsItens.Next;
         end;

         // Faz o loop no vetor dos meses para efetuar a gravação
         // Esse processo não efetiva a informações no banco de dados
         // apenas grava no ClientDataset para que seja visualizado, impresso
         // e se o usuário desejar, gravar no banco de dados
         for iContador := 0 to 11 do
         begin
            // Grava o valor apurado
            if not FCdsContrRateioOrc.Locate('IDCONTRATO;IDOBJETO;IDITEM;ANO;MES',
                                             VarArrayOf([CdsContratos.FieldByName('IDCONTRATO').AsInteger,
                                                         CdsContratos.FieldByName('IDOBJETO').AsInteger,
                                                         CdsContratos.FieldByName('IDITEM').AsInteger,
                                                         iAnoApura,
                                                         iContador+1
                                                         ]),
                                             []) then
            begin
               FCdsContrRateioOrc.Insert;
               FCdsContrRateioOrc.FieldByName('IDCONTRATO').AsInteger     := CdsContratos.FieldByName('IDCONTRATO').AsInteger;
               FCdsContrRateioOrc.FieldByName('IDOBJETO').AsInteger       := CdsContratos.FieldByName('IDOBJETO').AsInteger;
               FCdsContrRateioOrc.FieldByName('IDITEM').AsInteger         := CdsContratos.FieldByName('IDITEM').AsInteger;
               FCdsContrRateioOrc.FieldByName('ANO').AsInteger            := iAnoApura;
               FCdsContrRateioOrc.FieldByName('MES').AsInteger            := iContador+1;
               FCdsContrRateioOrc.FieldByName('NOMECONTRATO').AsString    := cdsContratos.FieldByName('NOMECONTRATO').AsString;
               FCdsContrRateioOrc.FieldByName('NOME_ITEM').AsString       := aValores[iContador].NomeItem;
               FCdsContrRateioOrc.FieldByName('CODCONTRATOEMPR').AsString := cdsContratos.FieldByName('CODCONTRATOEMPR').AsString;
               FCdsContrRateioOrc.FieldByName('FORMA').AsString           := aValores[iContador].Forma;
            end
            else
               FCdsContrRateioOrc.Edit;

            FCdsContrRateioOrc.FieldByName('VALOR').AsFloat := aValores[iContador].Valor;
            FCdsContrRateioOrc.FieldByName('QTDE').AsFloat  := aValores[iContador].Quantidade;

            FCdsContrRateioOrc.Post;
         end;
         cdsContratos.Next;
      end;
   finally
      FreeAndNil(cdsFormula);
   end;
end;

