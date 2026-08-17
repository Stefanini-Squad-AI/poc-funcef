// Alterações
{**********************************************************************
Analista.: André Imakawa
Pendencia: SIG 127483
Descrição: Correção na query do IOF.
**********************************************************************}
{**********************************************************************
Analista.: Vinicius Ferreira
Pendencia: SOL 179260 KINTANA 1649145
Rotina...: TCtrlBuscaIOFEmprestimo.AfterInitialize
Descrição: Alteração na parametrização para DATAEFETIVA onde
           sub-query de itens internos deve continuar a considerar a DATAPREVISTA
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 26212
Rotina...: BuscaIOF
Descrição: Coloquei o Idlancirrf is null.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 26003
Rotina...: BuscaIOF
Descrição: Utilizar nova query que o pessoal do empréstimo nos passou.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 25818
Rotina...: BuscaIOF
Descrição: Filtrar somente registros diferente de zero.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 22465
Rotina...: BuscaIOF
Descrição: Passar a variável sPlaContaD para o parâmetro que grava o campo
           PlaConta pois o campo PlaContaRecDes não será mais utilizado.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23234
Rotina...: BuscaIOF
Descrição: Buscar item de devolução de iof na SubQuery CRE da query principal.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 23143
Rotina...: BuscaIOF
Descrição: Ajuste na query para buscar item de devolução de empréstimo.
**********************************************************************}
{**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19179
Rotina...: BuscaIOF
Descrição: Filtrar registros com flgsituacao <> 'C' da contratoemptmo
           ao invés de flgsituacao = 'A'
**********************************************************************}
{**********************************************************************
Analista.: Marchetti
Pendencia: 17951
Rotina...: BuscaIOF
Descrição: Gravação do Centro de Responsabilidade
**********************************************************************}
{**********************************************************************
Analista.: Marchetti
Pendencia: 17801
Rotina...: BuscaIOF
Descrição: Gravação do IDPROGRAMA
**********************************************************************}
{**********************************************************************
Analista.: Marchetti
Pendencia: 17945
Rotina...: BuscaIOF
Descrição: Está buscando a conta do Historico do Emprestimo para que a mesma
           seja utilizada como conta a debito, nao buscando mais da
           TIPORECEBDESEMB
**********************************************************************}


unit uCtrlBuscaIOFEmprestimo;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uSistema,
     uCtrLancIRRF, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};
  Type
    TCtrlBuscaIOFEmprestimo = Class(TCmControlObject)

    private
      cdsGeral : TclientDataSet;
      cdsDePara : TclientDataSet;
      cdsDocumento : TclientDataSet;
      cdsInfo : TclientDataSet;
      cdsAux : TclientDataSet;
      cdsPlano : TclientDataset;
      LancIRRF : TCtrLancIRRF;
      function FazDePara(iPlanoPrev : LongInt) : LongInt;

    protected
      procedure DoChangeDataBase; Override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      function BuscaIOF(IdEmpresa : LongInt; DataIni, dataFim : string; UsaPlanoPatro, bPrimVez : Boolean) : Boolean;
      procedure Atualizaposicao (cTexto : String);
      procedure Linha;
    protected

    End;

implementation
Uses
    FBuscaIOFEmprestimoMT;

{ TCtrlBuscaIOFEmprestimo }

procedure TCtrlBuscaIOFEmprestimo.AfterInitialize;
begin
  inherited;
  LancIRRF.InitializeAs(self);
  LancIRRF.OpenTransaction := False;
end;

function TCtrlBuscaIOFEmprestimo.BuscaIOF(IdEmpresa : Integer; DataIni, dataFim : string; UsaPlanoPatro, bPrimVez : Boolean) : Boolean;
Var
 IdiTemIOF, IdPrograma, IdItemIofCompl,
 iPlanoPrevC, iPlanoPrev, iPatro : LongInt;
 iBenef, iCodLanc, rValor, rValBase : Double;
 CodCentroRespon, CodCentroCusto, Ssql : string;
 dData    : TDateTime;
 dDataSelecionada : TDateTime;  
 iTipoBuscaIOF : Integer;
 sCodtiprecdes, sPlacontad, sNaturenMantido : String;
 bProcessa : Boolean;
 iProcessado : Integer;
 iPlanoContab : Integer;
 bFaltaPrograma : Boolean;

begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.BuscaIOF(IdEmpresa, DataIni, DataFim, UsaPlanoPatro, bPrimVez);
    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  else
  Begin
    Result         := true;
    bFaltaPrograma := False;
    frmBuscaIOFEmprestimoMT.ProgressBar1.Position:=0;
    frmBuscaIOFEmprestimoMT.ProgressBar1.Min:=0;
    frmBuscaIOFEmprestimoMT.ProgressBar1.Max:=100;
    frmBuscaIOFEmprestimoMT.ProgressBar1.update;
    frmBuscaIOFEmprestimoMT.lblcontagem.caption:='';
    frmBuscaIOFEmprestimoMT.lblcontagem.update;
    frmBuscaIOFEmprestimoMT.repaint;
    Linha;
    frmBuscaIOFEmprestimoMT.memResult.Lines.Add('BUSCA IOF - EMPRÉSTIMO');
    Linha;
    frmBuscaIOFEmprestimoMT.memResult.Lines.Add('Início do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
    Linha;
    // BUSCA PARAMETROS - INICIO

    cdsGeral.data := GetDataPacket('SELECT IDPROGRAMA FROM PROGRAMA WHERE FLGTIPOPROGRAMA = ''PRE''');

    if cdsGeral.IsEmpty then
      bFaltaPrograma := True;

    CodCentroCusto  := '';
    Ssql            := 'SELECT CODCENTROCUSTOIOF, FLGBUSCAIOF,CODIRRFDARFIOF FROM PARAMIRRF WHERE IDPESSOA = '+inttostr(Sistema.idempresa);
    cdsGeral.data   := GetDataPacket(Ssql);

    if cdsGeral.IsEmpty then
    begin
      iTipoBuscaIOF   := 0;
      sNaturenMantido := '';
    end
    else
    begin
      iTipoBuscaIOF   := cdsGeral.fieldbyname('flgbuscaiof').asInteger;
      sNaturenMantido := cdsGeral.fieldbyname('CODIRRFDARFIOF').asString;

      if not cdsGeral.fieldbyname('CODCENTROCUSTOIOF').IsNull then
        CodCentroCusto := cdsGeral.fieldbyname('CODCENTROCUSTOIOF').AsString;
    end;
    //

    // A Conta será utilizada a mesma do Historico do Emprestimo (CCCREDFINAN)
    // a conta do Select abaixo não influi para nada.
    ssql := ' SELECT '                                               + #13+
    	    '   NAT.CODTIPRECDES, '                                  + #13+
            '   TRD.PLACONTA '                                       + #13+
            ' FROM '                                                 + #13+
    	    '   NATURENDIMENTO NAT, '                                + #13+
    	    '   TIPORECEBDESEMB TRD '                                + #13+
            ' WHERE NAT.CODNATUREZA  = '+ QuotedStr(sNaturenMantido) + #13+
            '   AND TRD.CODTIPRECDES = NAT.CODTIPRECDES '            + #13;
    cdsAux.data := GetDataPacket(ssql);

    If cdsAux.IsEmpty then
      sCodtiprecdes := ''
    else
      sCodtiprecdes := cdsAUX.fieldbyname('CODTIPRECDES').asString;

    iPlanoContab  := 0;
    ssql          := ' SELECT '                                        + #13+
                     '   NVL(PLANO,0) AS PLANO '                       + #13+
                     ' FROM '                                          + #13+
                     '   PARAMCONTAB '                                 + #13+
                     ' WHERE IDPESSOA = '+inttostr(Sistema.idempresa)  + #13;

    cdsPlano.Data := GetDataPacket(Ssql);
    iPlanoContab  := cdsplano.fieldbyname('PLANO').asInteger;

    // BUSCA PARAMETROS - FIM
    // VERIFICANDO SE AS PARAMETRIZAÇÕES ESTÃO SATISFEITAS - INICIO
    AtualizaPosicao ('VERIFICANDO A PARAMETRIZAÇÃO. AGUARDE');
    bProcessa := true;

    if bFaltaPrograma then
    begin
      bProcessa := false;
      frmBuscaIOFEmprestimoMT.memResult.Lines.Add('Tipo de Programa de Investimentos no cadastro Global não está cadastrado corretamente.');
    end;

    If iPlanoContab = 0 then
    begin
      bProcessa := false;
      frmBuscaIOFEmprestimoMT.memResult.Lines.Add('O parâmetro que indica o  Plano Contábil em uso não está preenchido.');
    end;

    If trim(sNaturenMantido) = '' then
    begin
      bprocessa := false;
      frmBuscaIOFEmprestimoMT.memResult.Lines.Add('O parâmetro que indica a Natureza de Rendimento Padrão para a Busca do IOF não está preenchido.');
    end;

    If trim(sCodtiprecdes) = '' then
    begin
      bprocessa := false;
      frmBuscaIOFEmprestimoMT.memResult.Lines.Add(' O código de Recebimento/Desembolso não está '+
                                                  ' parametrizado para a Natureza de Rendimento Padrão '+
                                                  ' da busca do IOF .');
    end;

    // VERIFICANDO SE AS PARAMETRIZAÇÕES ESTÃO SATISFEITAS - FIM
    If bProcessa then
    begin
      Linha;
      frmBuscaIOFEmprestimoMT.memResult.Lines.Add('A parametrização necessária ao processamento foi verificada e está OK.');
      Linha;
      AtualizaPosicao ('SELECIONANDO DADOS . AGUARDE');
      // PROCESSAMENTO PRINCIPAL - INICIO
      with cdsDocumento do
      Begin

        sSQL := 'SELECT '                                                                                + #13;  // Andre Imakawa - SIG 127483

        sSQL := sSQL +
                '   IOF.HMEVLRPREVISTO AS VLRPREVISTO, IOF.HMEVLRBASE AS VLRBASE,                                 '  + #13+
                '   IOF.HMEDATAPREVISTA, CRE.HMEDATAEFETIVA, IOF.CCCREDFINAN,                                     '  + #13+
                '   (SELECT PI.IDPLANPREVCONTAB                                                                   '  + #13+
                '    FROM PERFILINVXELEG PIE                                                                      '  + #13+
                '         JOIN PERFILINVEST PI ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST                          '  + #13+
                '                             AND PIE.IDPLANOPREV = PI.IDPLANOPREV                                '  + #13+
                '    WHERE PIE.IDPESSOA = CON.IDPESSOA AND                                                        '  + #13+
                '          PIE.IDPLANOPREV = CON.IDPLANOPREV AND                                                  '  + #13+
                '          PIE.DTINICIO <= CRE.HMEDATAEFETIVA AND                                                 '  + #13+
                '          (PIE.DTFIM IS NULL OR PIE.DTFIM > CRE.HMEDATAEFETIVA)) AS IDPLANOORIGEM,               '  + #13+
                '   IOF.IDPATRO, CON.IDPLANOPREV, IOF.IDHISTMOVEMPTMO, CON.IDBENEF,                               '  + #13+
                '   CON.IDTIPOCONTREMPTMO, IOF.IDITEMEMPTMO                                                       '  + #13+

                'FROM                                                                                             '  + #13+
                '   PESSOA            MUT,                                                                        '  + #13+
                '   PESSOA            PTR,                                                                        '  + #13+
                '   PLANPREVCONTABIL  PPC,                                                                        '  + #13+
                '   DEPENTIT          DEP,                                                                        '  + #13+
                '   TIPOCONTREMPTMO   TCE,                                                                        '  + #13+
                '   TIPOEMPTMO        TEP,                                                                        '  + #13+
                '   ITEMEMPTMO        ITE,                                                                        '  + #13+
                '   CONTRATOEMPTMO    CON,                                                                        '  + #13+
                '   (                                                                                             '  + #13;

        sSQL := sSQL + '    SELECT '                                                                     + #13;  // Andre Imakawa - SIG 127483

        // Andre Imakawa - SIG 127483 - Inicio
        sSQL := sSQL +
                '               HME.IDCONTRATOEMPTMO,                                                         ' + #13#10 +
                '               HME.VLRPREVISTO AS HMEVLRPREVISTO,                                            ' + #13#10 +
                '               HME.VLRBASE AS HMEVLRBASE,                                                    ' + #13#10 +
                '               HME.IDITEMEMPTMO,                                                             ' + #13#10 +
                '               (SELECT HMEC.CCCREDFINAN                                                      ' + #13#10 +
                '                  FROM CM.HMECONTABILIZACAO HMEC                                             ' + #13#10 +
                '                 WHERE HMEC.IDHISTMOVEMPTMO = HME.IDHISTMOVEMPTMO) AS CCCREDFINAN,           ' + #13#10 +
                '               HME.IDHISTMOVEMPTMO,                                                          ' + #13#10 +
                '               HME.DATAPREVISTA AS HMEDATAPREVISTA,                                          ' + #13#10 +
                '               NULL AS IDLANCIRRF,                                                           ' + #13#10 +
                '               HME.NUMPARCELAS AS HMENUMPARCELAS,                                            ' + #13#10 +
                '               HME.TIPOMOV AS HMETIPOMOV,                                                    ' + #13#10 +
                '               CON.IDPATRO AS IDPATRO,                                                       ' + #13#10 +
                '               CON.IDPLANOORIGEM AS IDPLANO                                                  ' + #13#10 +
                '          FROM CONTRATOEMPTMO CON                                                            ' + #13#10 +
                '          JOIN HMEALL HME                                                                    ' + #13#10 +
                '            ON HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO                                   ' + #13#10 +
                '         WHERE CON.FLGSITUACAO <> ''C''                                                      ' + #13#10 +
                '           AND NOT EXISTS                                                                    ' + #13#10 +
                '         (SELECT 1                                                                           ' + #13#10 +
                '                  FROM CM.HMEIMPOSTOS I                                                      ' + #13#10 +
                '                 WHERE I.IDHISTMOVEMPTMO = HME.IDHISTMOVEMPTMO)                              ' + #13#10 +
                '           AND HME.NATUREZAITEM = 0                                                          ' + #13#10 +
                '           AND HME.IDITEMEMPTMO IN                                                           ' + #13#10 +
                '               (SELECT IDITEMEMPTMO                                                          ' + #13#10 +
                '                  FROM ITEMXPROCESSOEP ITP                                                   ' + #13#10 +
                '                 WHERE ITP.FLGTIPOITEM = 4                                                   ' + #13#10 +
                '                   AND ITP.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO)                        ' + #13#10 +
                '           AND HME.FLGQUITABONOESTORNO <> 3';
        // Andre Imakawa - SIG 127483 - Fim

        //if iTipoBuscaIOF = 1 then  // Vinicius Ferreira SOL 179260 KINTANA 1649145
          sSQL := sSQL +
                  '      AND ( HME.DATAPREVISTA    BETWEEN TO_DATE(' + QuotedStr(DataIni) + ',''dd/mm/yyyy'')      '   + #13+
                                                         'AND TO_DATE(' + QuotedStr(DataFim) + ',''dd/mm/yyyy'') )    '   + #13;


        sSQL := sSQL +
        '   ) IOF,                                                                                        '  + #13+
        '   (                                                                                             '  + #13;

        sSQL := sSQL + '    SELECT '                                                                     + #13;  // Andre Imakawa - SIG 127483
        
        // Andre Imakawa - SIG 127483 - Inicio
        sSQL := sSQL +
                '               HME.IDCONTRATOEMPTMO,                                                        ' + #13#10 +
                '               HME.DATAPREVISTA     AS HMEDATAPREVISTA,                                     ' + #13#10 +
                '               HME.TIPOMOV          AS HMETIPOMOV,                                          ' + #13#10 +
                '               HME.DATAEFETIVA      AS HMEDATAEFETIVA,                                      ' + #13#10 +
                '               HME.FLGBAIXADO,                                                              ' + #13#10 +
                '               CON.IDPATRO          AS IDPATRO,                                             ' + #13#10 +
                '               CON.IDPLANOORIGEM    AS IDPLANO                                              ' + #13#10 +
                '          FROM CONTRATOEMPTMO CON                                                           ' + #13#10 +
                '          JOIN HMEALL HME                                                                   ' + #13#10 +
                '            ON HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO                                  ' + #13#10 +
                '         WHERE CON.FLGSITUACAO <> ''C''                                                     ' + #13#10 +
                '           AND HME.FLGQUITABONOESTORNO <> 3                                                 ' + #13#10 +
                '           AND HME.NATUREZAITEM = 2';

        case iTipoBuscaIOF of
          0: sSQL := sSQL +
                     '    AND ( HME.DATAEFETIVA      BETWEEN TO_DATE(' + QuotedStr(DataIni) + ',''dd/mm/yyyy'') '        +
                     '                                      AND TO_DATE(' + QuotedStr(DataFim) + ',''dd/mm/yyyy'') ) '      + #13;
          1: sSQL := sSQL +
                     '    AND ( HME.DATAPREVISTA     BETWEEN TO_DATE(' + QuotedStr(DataIni) + ',''dd/mm/yyyy'') '        +
                     '                                      AND TO_DATE(' + QuotedStr(DataFim) + ',''dd/mm/yyyy'') ) '      + #13;
        end;

        sSQL := sSQL +
                '   ) CRE                                                                               ' + #13#10 +
                'WHERE TEP.IDEMPRESAPROP = ' + IntToStr(Sistema.IdEmpresa)                                     + #13+
                '   AND IOF.IDPLANO = PPC.IDPLANOPREV                                                   ' + #13#10 +
                '   AND IOF.IDCONTRATOEMPTMO = CRE.IDCONTRATOEMPTMO                                     ' + #13#10 +
                '   AND IOF.HMETIPOMOV = CRE.HMETIPOMOV                                                 ' + #13#10 +
                '   AND IOF.HMEDATAPREVISTA = CRE.HMEDATAPREVISTA                                       ' + #13#10 +
                '   AND CON.IDCONTRATOEMPTMO = IOF.IDCONTRATOEMPTMO                                     ' + #13#10 +
                '   AND ITE.IDITEMEMPTMO = IOF.IDITEMEMPTMO                                             ' + #13#10 +
                '   AND CON.IDCONTRATOEMPTMO = CRE.IDCONTRATOEMPTMO                                     ' + #13#10 +
                '   AND CON.IDBENEF = MUT.IDPESSOA                                                      ' + #13#10 +
                '   AND CON.IDBENEF = DEP.IDPESSOA                                                      ' + #13#10 +
                '   AND CON.IDPESSOA = DEP.IDTITULAR                                                    ' + #13#10 +
                '   AND CON.IDPATRO = PTR.IDPESSOA                                                      ' + #13#10 +
                '   AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO                                   ' + #13#10 +
                '   AND TCE.IDTIPOEMPTMO = TEP.IDTIPOEMPTMO                                             ' + #13#10 +
                'UNION                                                                                  ' + #13#10 +
                'SELECT HME.HMEVLRPREVISTO AS VLRPREVISTO,                                              ' + #13#10 +
                '       HME.HMEVLRBASE AS VLRBASE,                                                      ' + #13#10 +
                '       HME.HMEDATAPREVISTA,                                                            ' + #13#10 +
                '       HME.HMEDATAEFETIVA,                                                             ' + #13#10 +
                '       HME.CCCREDFINAN,                                                                ' + #13#10 +
                '       (SELECT PI.IDPLANPREVCONTAB                                                     ' + #13#10 +
                '          FROM PERFILINVXELEG PIE                                                      ' + #13#10 +
                '          JOIN PERFILINVEST PI                                                         ' + #13#10 +
                '            ON PIE.IDPERFILINVEST = PI.IDPERFILINVEST                                  ' + #13#10 +
                '           AND PIE.IDPLANOPREV = PI.IDPLANOPREV                                        ' + #13#10 +
                '         WHERE PIE.IDPESSOA = CON.IDPESSOA                                             ' + #13#10 +
                '           AND PIE.IDPLANOPREV = CON.IDPLANOPREV                                       ' + #13#10 +
                '           AND PIE.DTINICIO <= HME.HMEDATAEFETIVA                                      ' + #13#10 +
                '           AND (PIE.DTFIM IS NULL OR PIE.DTFIM > HME.HMEDATAEFETIVA)) AS IDPLANOORIGEM,' + #13#10 +
                '       HME.IDPATRO,                                                                    ' + #13#10 +
                '       CON.IDPLANOPREV,                                                                ' + #13#10 +
                '       HME.IDHISTMOVEMPTMO,                                                            ' + #13#10 +
                '       CON.IDBENEF,                                                                    ' + #13#10 +
                '       CON.IDTIPOCONTREMPTMO,                                                          ' + #13#10 +
                '       HME.IDITEMEMPTMO                                                                ' + #13#10 +
                '  FROM PESSOA MUT,                                                                     ' + #13#10 +
                '       PESSOA PTR,                                                                     ' + #13#10 +
                '       PLANPREVCONTABIL PPC,                                                           ' + #13#10 +
                '       DEPENTIT DEP,                                                                   ' + #13#10 +
                '       TIPOCONTREMPTMO TCE,                                                            ' + #13#10 +
                '       TIPOEMPTMO TEP,                                                                 ' + #13#10 +
                '       ITEMEMPTMO ITE,                                                                 ' + #13#10 +
                '       CONTRATOEMPTMO CON,                                                             ';
        // Andre Imakawa - SIG 127483 - Fim

        sSQL := sSQL + '   (SELECT '                                                                     + #13; // Andre Imakawa - SIG 127483
        
        // Andre Imakawa - SIG 127483 - Inicio
        sSQL := sSQL +
                '         H.IDCONTRATOEMPTMO,                                                                 ' + #13#10 +
                '         H.IDITEMEMPTMO,                                                                     ' + #13#10 +
                '         H.IDHISTMOVEMPTMO,                                                                  ' + #13#10 +
                '         H.NUMPARCELAS AS HMENUMPARCELAS,                                                    ' + #13#10 +
                '         H.DATAPREVISTA AS HMEDATAPREVISTA,                                                  ' + #13#10 +
                '         (SELECT HMEC.CCCREDFINAN                                                            ' + #13#10 +
                '            FROM CM.HMECONTABILIZACAO HMEC                                                   ' + #13#10 +
                '           WHERE HMEC.IDHISTMOVEMPTMO = H.IDHISTMOVEMPTMO) AS CCCREDFINAN,                   ' + #13#10 +
                '         H.DATAEFETIVA AS HMEDATAEFETIVA,                                                    ' + #13#10 +
                '         H.VLRPREVISTO AS HMEVLRPREVISTO,                                                    ' + #13#10 +
                '         H.FLGBAIXADO,                                                                       ' + #13#10 +
                '         NULL AS IDLANCIRRF,                                                                 ' + #13#10 +
                '         H.VLRBASE AS HMEVLRBASE,                                                            ' + #13#10 +
                '         H.TIPOMOV AS HMETIPOMOV,                                                            ' + #13#10 +
                '         C.IDPATRO AS IDPATRO,                                                               ' + #13#10 +
                '         C.IDPLANOORIGEM AS IDPLANO                                                          ' + #13#10 +
                '          FROM CONTRATOEMPTMO C                                                              ' + #13#10 +
                '          JOIN HMEALL H                                                                      ' + #13#10 +
                '            ON C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO                                       ' + #13#10 +
                '         WHERE C.FLGSITUACAO <> ''C''                                                        ' + #13#10 +
                '           AND H.NATUREZAITEM = 1                                                            ' + #13#10 +
                '           AND NOT EXISTS                                                                    ' + #13#10 +
                '         (SELECT 1                                                                           ' + #13#10 +
                '                  FROM CM.HMEIMPOSTOS I                                                      ' + #13#10 +
                '                 WHERE I.IDHISTMOVEMPTMO = H.IDHISTMOVEMPTMO)                                ' + #13#10 +
                '           AND H.IDITEMEMPTMO IN                                                             ' + #13#10 +
                '               (SELECT IDITEMEMPTMO                                                          ' + #13#10 +
                '                  FROM ITEMXPROCESSOEP                                                       ' + #13#10 +
                '                 WHERE FLGTIPOITEM = 4                                                       ' + #13#10 +
                '                   AND IDTIPOCONTREMPTMO = C.IDTIPOCONTREMPTMO)                              ' + #13#10 +
                '           AND FLGQUITABONOESTORNO <> 3                                                      ';
        // Andre Imakawa - SIG 127483 - Fim
                                           
        case iTipoBuscaIOF of
          0: sSQL := sSQL +
                     '    AND ( H.DATAEFETIVA      BETWEEN TO_DATE(' + QuotedStr(DataIni) + ',''dd/mm/yyyy'') '     +
                     '                                    AND TO_DATE(' + QuotedStr(DataFim) + ',''dd/mm/yyyy'') ) ' + #13;
          1: sSQL := sSQL +
                     '    AND ( H.DATAPREVISTA     BETWEEN TO_DATE(' + QuotedStr(DataIni) + ',''dd/mm/yyyy'') '     +
                     '                                    AND TO_DATE(' + QuotedStr(DataFim) + ',''dd/mm/yyyy'') ) ' + #13;
        end;

        sSQL := sSQL +
                '   ) HME                                                                              '             + #13+
                'WHERE                                                                                 '             + #13+
                '      TEP.IDEMPRESAPROP       = ' + IntToStr(Sistema.IdEmpresa)                                     + #13+
                '  AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO                                 '             + #13+
                '  AND TCE.IDTIPOEMPTMO        = TEP.IDTIPOEMPTMO                                      '             + #13+
                '  AND CON.FLGSITUACAO         <> ''C''                                                '             + #13+
                '  AND CON.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO                                  '             + #13+
                '  AND CON.IDBENEF             = MUT.IDPESSOA                                          '             + #13+
                '  AND CON.IDBENEF             = DEP.IDPESSOA                                          '             + #13+
                '  AND CON.IDPESSOA            = DEP.IDTITULAR                                         '             + #13+
                '  AND CON.IDPATRO             = PTR.IDPESSOA                                          '             + #13+
                '  AND ITE.IDITEMEMPTMO        = HME.IDITEMEMPTMO                                      '             + #13+
                '  AND CON.IDTIPOCONTREMPTMO   = TCE.IDTIPOCONTREMPTMO                                 '             + #13+
                '  AND TCE.IDTIPOEMPTMO        = TEP.IDTIPOEMPTMO                                      '             + #13+
                '  AND HME.IDPLANO             = PPC.IDPLANOPREV                                       '             + #13;


        Data := GetDataPacket(Ssql);

        If cdsDocumento.recordcount > 0 then
        begin
          Try
            sPlacontad    := fieldbyname('CCCREDFINAN').asString;

            AtualizaPosicao ('PROCESSANDO . AGUARDE');
            startTransaction;
            frmBuscaIOFEmprestimoMT.ProgressBar1.Position:=0;
            frmBuscaIOFEmprestimoMT.ProgressBar1.Max:=cdsDocumento.RecordCount;
            frmBuscaIOFEmprestimoMT.Repaint;
            iProcessado := 0;
            First;
            While not EOF do
            Begin
              If iTipoBuscaIOF = 0 then
                dDataSelecionada := FieldByName('HMEDATAEFETIVA').AsDateTime
              else
                dDataSelecionada := FieldByName('HMEDATAPREVISTA').AsDateTime;

              rValor        := 0;
              rValBase      := 0;
              dData         := dDataSelecionada;
              iPlanoPrev    := FieldByName('IDPLANOPREV').AsInteger;
              iPlanoPrevC   := FazDePara(FieldByName('IDPLANOORIGEM').AsInteger);
              iPatro        := FieldByName('IDPATRO').AsInteger;
              iBenef        := FieldByName('IDBENEF').AsFloat;

              sSQL          :=  ' SELECT '                         + #13+
                                '   IDPROGRAMA '                   + #13+
                                ' FROM '                           + #13+
                                '   PROGRAMA '                     + #13+
                                ' WHERE FLGTIPOPROGRAMA = ''INV''' + #13;

              cdsGeral.data := GetDataPacket(Ssql);
              IdPrograma    := cdsGeral.FieldByName('IDPROGRAMA').AsInteger;

              sSQL := ' SELECT '                                                                                        + #13+
                      '   EP.CCUSTCREDFINAN, '                                                                          + #13+
                      '   EP.CCCREDFINAN, '                                                                             + #13+
                      '   EP.TIPORECDESFINAN, '                                                                         + #13+
                      '   DECODE(EP.CODCENTRORESPON, NULL, PI.CODCENTRORESPON, EP.CODCENTRORESPON) AS CODCENTRORESPON ' + #13+
                      ' FROM '                                                                                          + #13+
                      '   PARAMINTEGRAEP EP, '                                                                          + #13+
                      '   PARAMIRRF PI '                                                                                + #13+
                      ' WHERE EP.IDITEMEMPTMO      = ' + FieldByName('IDITEMEMPTMO').AsString                           + #13+
                      '   AND EP.IDTIPOCONTREMPTMO = ' + FieldByName('IDTIPOCONTREMPTMO').AsString                      + #13;
              cdsGeral.data   := GetDataPacket(Ssql);
              CodCentroRespon := cdsGeral.FieldByName('CODCENTRORESPON').AsString;
              //INIBIDO PARA UTILIZAR TIPO DE DESEMBOLSO DA NATUREZA DE RENDIMENTO E NÃO DO EMPRÉSTIMO

              if CodCentroCusto = '' then
                CodCentroCusto := cdsGeral.FieldByName('CCUSTCREDFINAN').AsString;

              if cdsDocumento.FieldByName('CCCREDFINAN').IsNull then
                sPlacontad := cdsGeral.fieldbyname('CCCREDFINAN').asString;


              Ssql := ' SELECT '            + #13+
                      '   IDHISTMOVEMPTMO ' + #13+
                      ' FROM '              + #13+
                      '   HISTMOVEMPTMO '   + #13+
                      ' WHERE (1 = 2)'      + #13;
              cdsGeral.data := GetDataPacket(Ssql);

              While (not EOF)                                           and
                    (dData      = dDataSelecionada)                     and
                    (iPlanoPrev = FieldByName('IDPLANOPREV').AsInteger) and
                    (iPatro     = FieldByName('IDPATRO').AsInteger)     and
                    (iBenef     = FieldByName('IDBENEF').AsFloat)       do
              Begin
                rValor   := rValor + FieldByName('VLRPREVISTO').AsFloat;
                rValBAse := rValBAse + FieldByName('VLRBASE').AsFloat;
                cdsGeral.Insert;
                cdsGeral.FieldByName('IDHISTMOVEMPTMO').AsFloat := FieldByName('IDHISTMOVEMPTMO').AsFloat;
                cdsGeral.Post;
                Next;
                frmBuscaIOFEmprestimoMT.ProgressBar1.Position:=frmBuscaIOFEmprestimoMT.ProgressBar1.Position + frmBuscaIOFEmprestimoMT.ProgressBar1.Step;
                iProcessado:=frmBuscaIOFEmprestimoMT.ProgressBar1.Position;
                frmBuscaIOFEmprestimoMT.lblcontagem.caption:='Processando '+inttostr(iProcessado)+
                                       ' de '+inttostr(frmBuscaIOFEmprestimoMT.ProgressBar1.Max);
                frmBuscaIOFEmprestimoMT.repaint;
              end;

              iCodLanc := 0;
              if not LancIRRF.GravaIRRF(IdEmpresa,
                                        UsaPlanoPatro,
                                        0,
                                        IdEmpresa,
                                        iBenef,
                                        sNaturenMantido,
                                        DateToStr(dData),
                                        rValBase, 
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        0,
                                        cdsInfo.data,
                                        iCodLanc,
                                        sPlacontad,
                                        iPlanoContab,
                                        'N',
                                        iPlanoPrevC,
                                        iPatro,
                                        IdPrograma,
                                        bPrimVez,
                                        15,
                                        15,
                                        0,
                                        CodCentroCusto,
                                        -1,
                                        sCodtiprecdes,
                                        sPlacontad,
                                        CodCentroRespon,
                                        0,
                                        rValor) then
              begin
                Result := False;
                Raise Exception.Create(LancIRRF.MessageInfo);
              end;

              //  AtualizaPosicao ('ATUALIZANDO O HISTORICO DE EMPRÉSTIMOS .');
              if iCodLanc > 0 then
              begin
                cdsGeral.First;
                while not cdsGeral.Eof do
                begin
                  Ssql := ' UPDATE '                                                                              + #13+
                          '   HISTMOVEMPTMO '                                                                     + #13+
                          ' SET '                                                                                 + #13+
                          '   IDLANCIRRF = '+FloatToStr(iCodLanc)                                                 + #13+
                          ' WHERE IDHISTMOVEMPTMO = '+FloatToStr(cdsGeral.FieldByName('IDHISTMOVEMPTMO').AsFloat) + #13;

                  if not ExecSQL(Ssql) then
                  Begin
                    Result := False;
                    Raise Exception.Create(messageinfo);
                  end;
                  cdsGeral.Next;
                end;
              end
              else
              begin
                Result := False;
                Raise Exception.Create(LancIRRF.MessageInfo);
              end;
            end;
            Commit;
            AtualizaPosicao ('Fim do Processo .');
            Linha;
            frmBuscaIOFEmprestimoMT.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
            Linha;
          Except
            On E:Exception Do
            Begin
              Rollback;
              Result      := False;
              MessageInfo := E.Message;
            End;
          end;
        end
        else
        begin
          Linha;
          AtualizaPosicao ('> NÃO HÁ NADA A PROCESSAR.');
          Linha;
          frmBuscaIOFEmprestimoMT.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
          Linha;
        end;
      end;
    end
    else
    begin
      Linha;
      frmBuscaIOFEmprestimoMT.memResult.Lines.Add('Estes erros precisam ser resolvidos para que o processamento possa ser efetuado ');
      AtualizaPosicao ('> PROC. CANCELADO DEVIDO A AUSENCIA DE PARAMETRIZAÇÃO');
      Linha;
      frmBuscaIOFEmprestimoMT.memResult.Lines.Add('Fim do Processamento: '+formatdatetime('dd/mm/yyyy hh:nn:ss', now));
      Linha;
    end;
  end;
end;

constructor TCtrlBuscaIOFEmprestimo.Create;
begin
  inherited;
  cdsGeral     := TClientDataSet.Create(nil);
  cdsDePara    := TclientDataSet.create(nil);
  cdsDocumento := TclientDataSet.create(nil);
  cdsInfo      := TclientDataSet.create(nil);
  cdsAux       := TclientDataSet.create(nil);
  cdsPlano     := TclientDataSet.create(nil);
  LancIRRF     := TCtrLancIRRF.create;
end;

destructor TCtrlBuscaIOFEmprestimo.Destroy;
begin
  inherited;
  cdsGeral.free;
  cdsDePara.free;
  cdsDocumento.free;
  cdsInfo.free;
  cdsPlano.free;
  LancIRRF.free;
  cdsAux.free;
end;

procedure TCtrlBuscaIOFEmprestimo.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlBuscaIOFEmprestimo.FazDePara(iPlanoPrev: Integer): LongInt;
Var
  Ssql  : string;
  iTipo : Integer;
begin

  cdsGeral.Data := GetDataPacket('SELECT  NVL(FLGEXCEPCIONAL,0) AS FLGEXCEPCIONAL FROM PARAMEMPTMO');

  iTipo := cdsGeral.fieldByname('FLGEXCEPCIONAL').AsInteger;

  if iTipo = 0 then
  begin
     Ssql := 'SELECT IDPLANPREVC '+
             '  FROM PLANPREVXCONTABIL '+
             ' WHERE (IDPLANOPREV = '+IntToStr(iPlanoPrev)+') ';
  end
  else
  begin
     Ssql := 'SELECT IDPLANOPREV AS IDPLANPREVC'+
             '  FROM PLANPREVXCONTABIL '+
             ' WHERE (IDPLANPREVC = '+IntToStr(iPlanoPrev)+') ';
  end;

  cdsDePara.data := GetDataPacket(Ssql);
  if cdsDePara.IsEmpty then
    Result:=iPlanoPrev
  else
    Result:=cdsDePara.fieldByname('IDPLANPREVC').AsInteger;
end;

procedure TCtrlBuscaIOFEmprestimo.Atualizaposicao (cTexto : String);
begin
    frmBuscaIOFEmprestimoMT.pnlPosicao.caption := cTexto;
    frmBuscaIOFEmprestimoMT.Repaint;
end;

procedure TCtrlBuscaIOFEmprestimo.Linha;
begin
  frmBuscaIOFEmprestimoMT.memResult.Lines.Add('-------------------------------------------------------'+
                                         '-------------------------');
  frmBuscaIOFEmprestimoMT.Repaint;
end;

end.




SELECT
  IOF.HMEVLRPREVISTO AS VLRPREVISTO,     IOF.HMEVLRBASE AS VLRBASE,       IOF.HMEDATAPREVISTA,       CRE.HMEDATAEFETIVA,
  IOF.CCCREDFINAN,                       CON.IDPLANOORIGEM,               CON.IDPATRO,               CON.IDPLANOPREV,
  IOF.IDHISTMOVEMPTMO,                   CON.IDBENEF,                     CON.IDTIPOCONTREMPTMO,     IOF.IDITEMEMPTMO 
FROM
  CONTRATOEMPTMO CON,
  TIPOCONTREMPTMO TCE,
  TIPOEMPTMO TEP,
 (SELECT  /*+INDEX(CON) */
    HME.IDHISTMOVEMPTMO,       HME.IDCONTRATOEMPTMO,          HME.HMEDATAPREVISTA,              HME.IDITEMEMPTMO,
    HME.HMEVLRPREVISTO,        HME.HMEVLRBASE,                HME.HMETIPOMOV,                   HME.CCCREDFINAN
  FROM
    HISTMOVEMPTMO HME,
    CONTRATOEMPTMO CON
  WHERE NVL(HME.FLGESTORNADO,0) = 0
    --AND HME.IDLANCIRRF IS NULL
/*    AND (HME.HMECENTRALIZA = 0 AND HME.HMEDESTACADO = 0)
    AND HME.IDITEMEMPTMO IN (SELECT      DISTINCT IDITEMEMPTMO FROM      ITEMXPROCESSOEP WHERE FLGTIPOITEM = 4)
    AND CON.FLGSITUACAO <> 'C'
AND CON.IDCONTRATOEMPTMO = 204786840088
    AND CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) IOF,

 (SELECT /*+INDEX(HME) */
    HME.IDCONTRATOEMPTMO,       HME.HMEDATAPREVISTA,               HME.HMEDATAEFETIVA,            HME.HMETIPOMOV
  FROM
    HISTMOVEMPTMO HME,
    CONTRATOEMPTMO CON

  WHERE (HME.HMECENTRALIZA = 1)

    AND NVL(HME.FLGESTORNADO,0) = 0
    AND ( HME.HMEDATAEFETIVA BETWEEN TO_DATE('01/07/2006','DD/MM/YYYY') AND TO_DATE('30/08/2006','DD/MM/YYYY'))
    AND CON.FLGSITUACAO <> 'C'
AND CON.IDCONTRATOEMPTMO = 204786840088

    AND CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO) CRE

WHERE ( TEP.IDEMPRESAPROP = 1 )
  AND ( CRE.HMEDATAEFETIVA BETWEEN TO_DATE('01/07/2006','DD/MM/YYYY') AND TO_DATE('31/08/2006','DD/MM/YYYY'))
  AND IOF.IDCONTRATOEMPTMO = CRE.IDCONTRATOEMPTMO
  AND IOF.HMETIPOMOV = CRE.HMETIPOMOV
  AND IOF.HMEDATAPREVISTA = CRE.HMEDATAPREVISTA
  AND CON.IDCONTRATOEMPTMO = IOF.IDCONTRATOEMPTMO
  AND CON.IDCONTRATOEMPTMO = CRE.IDCONTRATOEMPTMO
  AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO
  AND TCE.IDTIPOEMPTMO = TEP.IDTIPOEMPTMO


UNION

 SELECT  /*+INDEX(CON) */

  HME.HMEVLRPREVISTO AS VLRPREVISTO,     HME.HMEVLRBASE AS VLRBASE,       HME.HMEDATAPREVISTA,       HME.HMEDATAEFETIVA,
  HME.CCCREDFINAN,                       CON.IDPLANOORIGEM,               CON.IDPATRO,               CON.IDPLANOPREV,
  HME.IDHISTMOVEMPTMO,                   CON.IDBENEF,                     CON.IDTIPOCONTREMPTMO,     HME.IDITEMEMPTMO

  FROM
    HISTMOVEMPTMO HME,
    CONTRATOEMPTMO CON,
    TIPOCONTREMPTMO TCE,
    TIPOEMPTMO TEP

  WHERE NVL(HME.FLGESTORNADO,0) = 0
    --AND HME.IDLANCIRRF IS NULL

    AND (HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)
    AND HME.HMEDATAEFETIVA  BETWEEN TO_DATE('01/07/2006','DD/MM/YYYY') AND TO_DATE('31/08/2006','DD/MM/YYYY')
    AND CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO
    AND TCE.IDTIPOEMPTMO = TEP.IDTIPOEMPTMO
    AND TEP.IDEMPRESAPROP = 1

    AND HME.IDITEMEMPTMO IN (SELECT      DISTINCT IDITEMEMPTMO FROM      ITEMXPROCESSOEP WHERE FLGTIPOITEM = 4)
    AND CON.FLGSITUACAO <> 'C'
    AND CON.IDCONTRATOEMPTMO = 204786840088

    AND CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO


