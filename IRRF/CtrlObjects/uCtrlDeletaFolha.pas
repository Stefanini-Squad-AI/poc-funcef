{ Alterações
----------------------------------------------------------------------------------------------------
Analista....: MARCIO SANCHES SPINOSA SOL 209778 Kintana 2023486
Sol_........: 209778
Kintana.....: 2023486
Data........: 19/06/2013
Rotina......: DeletaLancFolha
Descrição...: Retirada de filtro incorreto conforme o comentario.
----------------------------------------------------------------------------------------------------
Analista....: Brunno Mattos
Sol_Kintana.: 137153_826536
Data........: 24/08/2010
Rotina......: DeletaLancFolha
Descrição...: Alteração funcionalidade para que apenas os beneficiarios contidos na lista
              tenham a busca desfeita.
----------------------------------------------------------------------------------------------------
Analista....: Bruno Bastos
Sol_Kintana.: 121131_580066
Data........: 24/06/2009
Rotina......: DeletaLancFolha
Descrição...: Reprodução do not exists no delete da lancirrf.
----------------------------------------------------------------------------------------------------
Analista.: Bruno Bastos
Pendencia: 26494
Data.....: 03/12/2007
Rotina...: DeletaLancFolha
Descrição: Coloquei um not exists para não desfazer a busca de pessoas que tenham resgitros com
           valor zerado e com valor maior que zero com o darf jé gerado.
----------------------------------------------------------------------------------------------------
Analista.: Bruno Bastos
Pendencia: 26089
Data.....: 30/08/2007
Rotina...: DeletaLancFolha
Descrição: Refiz a pendência colocando o retorno da função corretamente.
----------------------------------------------------------------------------------------------------
Analista.: Bruno Bastos
Pendencia: 26089
Data.....: 13/08/2007
Rotina...: DeletaLancFolha
Descrição: Na hora de verificar se a pessoa tem darf gerado buscar somente valores maio que zero.
----------------------------------------------------------------------------------------------------
Analista.: Claudio Faria
Pendencia: 24606
Data.....: 04/04/2007
Rotina...: DeletaLancFolha
Descrição: Verificar se existe acertos entes de desfazer a busca
----------------------------------------------------------------------------------------------------
Analista.: André Pontes
Pendencia: 23599
Data.....: 10/11/2006
Rotina...: DeletaLancFolha
Descrição: Tratamento de erros no retorno do ExecSQL
----------------------------------------------------------------------------------------------------
Analista.: Bruno Bastos
Pendencia: 19153
Data.....: 04/10/2006
Rotina...: DeletaLancFolha
Descrição: Permitir desfazer a geração de folha de pagamento individualmente.
----------------------------------------------------------------------------------------------------
Analista.: Bruno Bastos
Pendencia: 18883
Data.....: 27/03/2006
Rotina...: DeletaLancFolha
Descrição: Permitir desfazer busca filtrando o código da natureza de rendimento.
----------------------------------------------------------------------------------------------------
}

unit uCtrlDeletaFolha;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCtrlUtil; 

  Type
    TCtrlDeletaFolha = Class(TCmControlObject)

    private
           CtrlUtil : TCtrlUtil;  
           cdsAux : TclientDataSet; 
    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      {Deleta lançamentos da folha lançados no IRRF}
      function DeletaLancFolha(IdPessoa, iSistema, iVersao, iPessoa : Integer; sCodNatureza, DataIni, dataFim: String; iListaPessoas: integer) : Boolean;
      procedure Atualizaposicao (cTexto : String);

    protected

    End;


implementation

Uses
    FdeletaFolhaMT;

constructor TCtrlDeletaFolha.Create;
begin
  inherited;
  cdsAux := TClientDataSet.Create(nil); 
end;


function TCtrlDeletaFolha.DeletaLancFolha(IdPessoa, iSistema, iVersao, iPessoa: Integer;
                                          sCodNatureza, DataIni, dataFim: String; iListaPessoas: integer): Boolean;
Var sSQLPrincipal, sSQL, sGravaLog : string;
begin
  Result := False;
  try
    // MONTA QUERY PRINCIPAL - INICIO --------------------------------------------------------------------------------
    sSQLPrincipal := 'SELECT L.IDLANCIRRF FROM LANCIRRF L WHERE ';
    Case iSistema Of
      0: Begin
           sSQLPrincipal := sSQLPrincipal + ' (L.IDMODULO = 21) AND ';
           sSQLPrincipal := sSQLPrincipal + ' (L.IDDARF IS NULL)  '+
                                            '   AND (L.DATAPAGAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
                                            '   AND (L.DATAPAGAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY'')) ';
//                                            '   AND (L.DATALANCAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
//                                            '   AND (L.DATALANCAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY'')) ';

         End;

      1: Begin
           sSQLPrincipal := sSQLPrincipal + ' (L.IDMODULO = 18) ';

           If ((dataini <> '') and (datafim <> '')) Then
           Begin
             sSQLPrincipal := sSQLPrincipal + '   AND (L.DATAPAGAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
                                              '   AND (L.DATAPAGAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY'')) ';
//             sSQLPrincipal := sSQLPrincipal + '   AND (L.DATALANCAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
//                                              '   AND (L.DATALANCAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY'')) ';
           End
           Else
           Begin
             If iVersao > 0 Then
               sSQLPrincipal := sSQLPrincipal + ' AND (L.IDHSTFOLHABENEF = '+Inttostr(iVersao)+' )' ;
           End;

           sSQLPrincipal := sSQLPrincipal + '   AND (L.IDDARF IS NULL) ';

           //CPREV - 26494 - Início
//           MARCIO SANCHES SPINOSA SOL 209778 Kintana 2023486 - Inicio
//           sSqlPrincipal := sSqlPrincipal + '   AND (NOT EXISTS (SELECT 1 '+
//                                                               ' FROM LANCIRRF LIR, '+
//                                                                    ' LANCIRRF LI2  '+
//                                                               ' WHERE LIR.IDBENEFIRRF     = L.IDBENEFIRRF '+
//                                                                 ' AND LIR.IDHSTFOLHABENEF = L.IDHSTFOLHABENEF '+
//                                                                 ' AND LIR.CODNATUREZA     = L.CODNATUREZA '+
//                                                                 ' AND LIR.IDMODULO        = L.IDMODULO '+
//                                                                 ' AND LIR.IDDARF         IS NULL '+
//                                                                 ' AND LIR.VLRIRRF         = 0 '+
//                                                                 ' AND LI2.IDBENEFIRRF     = L.IDBENEFIRRF '+
//                                                                 ' AND LI2.IDHSTFOLHABENEF = L.IDHSTFOLHABENEF '+
//                                                                 ' AND LI2.CODNATUREZA     = L.CODNATUREZA '+
//                                                                 ' AND LI2.IDMODULO        = L.IDMODULO '+
//                                                                 ' AND LI2.IDDARF         IS NOT NULL '+
//                                                                 ' AND LI2.VLRIRRF         > 0)) ';
           //CPREV - 26494 - Fim
//MARCIO SANCHES SPINOSA SOL 209778 Kintana 2023486 - Fim           
         End;
    Else
      sSQLPrincipal := sSQLPrincipal + ' (L.IDDARF IS NULL) '+
                                       '   AND (L.DATAPAGAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
                                       '   AND (L.DATAPAGAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY'')) ';
//                                       '   AND (L.DATALANCAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
//                                       '   AND (L.DATALANCAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY'')) ';
    End;

    If iPessoa > 0 then
      sSQLPrincipal := sSQLPrincipal + ' AND (L.IDBENEFIRRF = '+InttoStr(iPessoa)+ ' )';

    //Brunno Mattos - SOL:137153_ KTN:826536 - Início
     If iListaPessoas <> 0 Then
      sSQLPrincipal := sSQLPrincipal +  ' AND EXISTS (SELECT 1 FROM LISTAFOLHABENEFDET LD '+ #13 +
                                        ' WHERE L.IDBENEFIRRF = LD.IDPESSOA '+ #13 +//Bruno Bastos - 29/09/2010 -
                                        //Bruno Bastos - 29/09/2010 - ' WHERE L.IDBENEFIRRF = LD.IDTITULAR '+ #13 +//Bruno Bastos
                                        ' AND LD.IDLISTA     = ('+ IntToStr(iListaPessoas) +') )';
    //Brunno Mattos - SOL:137153_ KTN:826536 - Fim

    If sCodNatureza <> '' Then
      sSQLPrincipal := sSQLPrincipal + ' AND L.CODNATUREZA = '+QuotedStr(sCodNatureza);


    // MONTA QUERY PRINCIPAL - FIM --------------------------------------------------------------------------------

    // VERIFICA LANCIRRFACERTO - INICIO ------------------------------------------------------------------------
    If iSistema = 1 Then
    Begin
      sSQL := 'SELECT I.IDLANCIRRFACERTO FROM LANCIRRFACERTO I WHERE I.IDLANCIRRFACERTO IN  ( ' + sSQLPrincipal + ' ) ';

      cdsAux.data := GetDataPacket(sSQL);
      If Not cdsAux.IsEmpty Then
      Begin
        AtualizaPosicao ('> NÂO FOI POSSÍVEL DESFAZER A BUSCA, POIS EXISTEM ACERTOS A SEREM DESFEITOS ANTES DESSA ETAPA.');
        Exit;
      End;
    End;
    // VERIFICA LANCIRRFACERTO - FIM ------------------------------------------------------------------------

    AtualizaPosicao ('Fase 1/4 : Verificando registros a processar ...');

    StartTransaction;

    cdsAux.data := GetDataPacket(sSQLPrincipal);

    If not cdsAux.EOF Then
    Begin
      //  HISTRUBSAL - INICIO -----------------------------------------------------------------------------------
      sSQL := 'UPDATE HISTRUBSAL H SET H.IDLANCIRRF = NULL WHERE H.IDLANCIRRF IN ( ' + sSQLPrincipal + ' ) ';

      AtualizaPosicao ('Fase 2/4 : Atualizando o Histórico de Rubricas Salariais.');

      If not(ExecSQL(sSQL)) Then
      begin
        MessageInfo := 'Erro na atualização do histórico Rubricas Salariais.';
        Abort;
      End;
      //  HISTRUBSAL - FIM ------------------------------------------------------------------------------------

      //  LANCXINFORME - INICIO ----------------------------------------------------------------------------
      sSQL := 'DELETE LANCXINFORME I WHERE I.IDLANCIRRF IN  ( ' + sSQLPrincipal + ' ) ';

      AtualizaPosicao ('Fase 3/4 : Apagando os Lançamentos de IRRF para o Informe de Rendimentos');

      if not(ExecSQL(sSQL)) then
      begin
        MessageInfo := 'Erro ao apagar os lançamentos para o Informe de Rendimentos.';
        Abort;
      end;
      //  LANCXINFORME - FIM ----------------------------------------------------------------------------

      //  LANCIRRF - INICIO ----------------------------------------------------------------------------
      sSQL := 'DELETE LANCIRRF L '+
              ' WHERE ';
      Case iSistema of
        0: Begin
             sSQL := sSQL + ' (L.IDMODULO = 21) AND ';
             sSQL := sSQL + ' (L.IDDARF IS NULL) AND '+
                            ' (L.DATAPAGAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
                            '  AND (L.DATAPAGAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY''))';
//                            ' (L.DATALANCAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
//                            '  AND (L.DATALANCAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY''))';
           end;

        1: begin
             sSQL := sSQL + ' (L.IDMODULO = 18) ';
             If ((dataini <> '') and (datafim <> '')) then
               sSQL := sSQL + '   AND (L.IDDARF IS NULL) '+
                              '   AND (L.DATAPAGAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
                              '   AND (L.DATAPAGAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY'')) '
//                              '   AND (L.DATALANCAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
//                              '   AND (L.DATALANCAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY'')) '
             Else
             Begin
               sSQL := sSQL + ' AND (L.IDHSTFOLHABENEF = '+Inttostr(iVersao)+' )' ;

               sSQL := sSQL +' AND (L.IDDARF IS NULL) '
             End;

             sSql := sSql +
             //Bruno Bastos - 121131_580066 - Início
                 '   AND (NOT EXISTS (SELECT 1 '+
                 ' FROM LANCIRRF LIR, '+
                      ' LANCIRRF LI2  '+
                 ' WHERE LIR.IDBENEFIRRF     = L.IDBENEFIRRF '+
                   ' AND LIR.IDHSTFOLHABENEF = L.IDHSTFOLHABENEF '+
                   ' AND LIR.CODNATUREZA     = L.CODNATUREZA '+
                   ' AND LIR.IDMODULO        = L.IDMODULO '+
                   ' AND LIR.IDDARF         IS NULL '+
                   ' AND LIR.VLRIRRF         = 0 '+
                   ' AND LI2.IDBENEFIRRF     = L.IDBENEFIRRF '+
                   ' AND LI2.IDHSTFOLHABENEF = L.IDHSTFOLHABENEF '+
                   ' AND LI2.CODNATUREZA     = L.CODNATUREZA '+
                   ' AND LI2.IDMODULO        = L.IDMODULO '+
                   ' AND LI2.IDDARF         IS NOT NULL '+
                   ' AND LI2.VLRIRRF         > 0)) ';
             //Bruno Bastos - 121131_580066 - Fim

           End ;
      Else
        sSQL := sSQL + ' (L.IDDARF IS NULL) AND '+
                       ' (L.DATAPAGAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
                       '  AND (L.DATAPAGAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY''))';
//                       ' (L.DATALANCAMENTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'')) '+
//                       '  AND (L.DATALANCAMENTO <= TO_DATE('+quotedStr(dataFim)+',''DD/MM/YYYY''))';
      End;

      If iPessoa > 0 then
        sSQL := sSQL + ' AND (L.IDBENEFIRRF = '+InttoStr(iPessoa)+ ' )';

      //Brunno Mattos - SOL:137153_ KTN:826536 - Início
      If iListaPessoas <> 0 Then
        ssql := ssql + ' AND (L.IDBENEFIRRF in (SELECT IDPESSOA FROM LISTAFOLHABENEFDET WHERE IDLISTA = '+IntToStr(iListaPessoas)+') )';
      //Brunno Mattos - SOL:137153_ KTN:826536 - Fim

      If sCodNatureza <> '' Then
        sSQL := sSQL + ' AND L.CODNATUREZA = '+QuotedStr(sCodNatureza);

      AtualizaPosicao ('Fase 4/4 : Apagando os Lançamentos de Imposto de Renda .');

      If not(ExecSQL(sSQL)) Then
      Begin
        MessageInfo := 'Erro ao apagar os lançamentos de Imposto de Renda.';
        Abort;
      End;

      Result := True;

      Case iSistema of
        0: Begin
             sGravaLog := ' Apagou Geração da Folha de Pagamentos  '+
                          ' período de: '+DataIni+' até '+DataFim;

             If sCodnatureza <> '' Then
               sGravaLog := sGravaLog + ' para a Natureza de Rendimento '+sCodNatureza;

             If iPessoa > 0 Then
               sGravaLog := sGravaLog + ' para o IDPESSOA: '+IntToStr(iPessoa);
           End;

        1: Begin
             If ((dataIni <> '') and (dataFim <> '')) then
             Begin
               sGravaLog := ' Apagou Geração da Folha de Benefícios '+
                            ' relativa ao período de: '+DataIni+' até '+DataFim;

               If sCodnatureza <> '' Then
                 sGravaLog := sGravaLog + ' para a Natureza de Rendimento '+sCodNatureza;

               If iPessoa > 0 Then
                 sGravaLog := sGravaLog + ' para o IDPESSOA: '+IntToStr(iPessoa);
             End
             Else
             Begin
               sGravaLog := ' Apagou Geração da Folha de Benefícios '+
                            ' da versão: '+ inttostr(iVersao);

               If sCodnatureza <> '' Then
                 sGravaLog := sGravaLog + ' para a Natureza de Rendimento '+sCodNatureza;

               If iPessoa > 0 Then
                 sGravaLog := sGravaLog + ' para o IDPESSOA: '+IntToStr(iPessoa);
             End;
           End;

        2: Begin
             CtrlUtil.GravaLogTOTALPREV ('Apagou Geração da Folha de Mantidos  '+
             'relativa ao período de: '+DataIni+' até '+DataFim);

           End;

        3: Begin
             CtrlUtil.GravaLogTOTALPREV ('Apagou Geração da Folha de PIS  '+
             'relativa ao período de: '+DataIni+' até '+DataFim);
           End;
      End;
      CtrlUtil.GravaLogTOTALPREV (sGravaLog);

      AtualizaPosicao ('Fim do Processo.');
      //  LANCIRRF - FIM ----------------------------------------------------------------------------
    End
    Else
    Begin
      AtualizaPosicao ('> NÃO EXISTE NENHUMA INFORMAÇÃO A SER PROCESSADA OU DARF JÁ IMPRESSO.'); 
    End;

    Commit;
  Except
    On E:Exception Do
    Begin
      Rollback;
      Result := False;
      MessageInfo := E.Message;
    End;
  End;
end;

procedure TCtrlDeletaFolha.Atualizaposicao (cTexto : String);
begin
    FrmdeletaFolhaMT.pnlPosicao.caption := cTexto;
    FrmdeletaFolhaMT.Repaint;
end;

destructor TCtrlDeletaFolha.Destroy;
begin
  inherited;
  cdsAux.free; 
end;

procedure TCtrlDeletaFolha.DoChangeDataBase;
begin
  inherited;

end;
end.



