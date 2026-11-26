unit uExportacao;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA


// Alterações:
{---------------------------------------------------------------------------------------------------
Autor     : Bruno Bastos
Data      : 29/11/2007
Rotina    : Processar
Pendência : 26965
Descricao : Colocar parenteses no início dos joins porque só tinha parenteses no final dos joins.
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Autor     : André Pontes
Data      : 09/01/2007
Rotina    : - queries que serão usadas em ProcessaQuery
Pendência : 19869
Descricao : Não incluir registros de excesso de débito
            Foi colocado filtro de "ValorRecebido" > 0
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Autor     : Paulo Ramos
Data      : 20/09/2006
Rotina    : Diversas
Pendência : 23361
Descricao : Retirar RULE de consultas.
----------------------------------------------------------------------------------------------------}

interface

uses
  sysutils, wwQuery, UDatabase, usistema, Classes, Forms, uMensErro, Dialogs,
  ComCtrls, uObjFolha, JclStrings;

Const MaxTamVetor = 14;

Type
  rArq = Record
    iColuna  : Integer;
    iNome    : String;
    iTamanho : Integer;
  end;

procedure Processar(qry                 : TwwQuery;
                    iFlgAbonoAnual      : Integer;
                    iIdLayoutEnt        : Integer;
                    iIdLayoutSaida      : Integer;
                    iTpConvenio         : Integer;
                    sMesRefEsc          : String;
                    sAbono              : String;
                    LocaleNomeArq       : String;
                    bHouveErro          : Boolean;
                    ProgressBar         : TProgressBar;
                    bLayoutTemRubricas  : Boolean;      
                    sFiltroVersao       : String;       
                    sFiltroRubricas     : String = '-1';
                    bIgnoraExcesso      : Boolean = True
                   );

function FAcertaColuna(sParm : String ; nTam : Integer) : String;
function FAcertaTamanho(sParm : String ; nTam : Integer ; sTipo : String) : String;
function FAcertaValor(nParm : Real) : String;



implementation


// -----------------------------------------------------------------------------------------------
// Processar(...)
// -----------------------------------------------------------------------------------------------
procedure Processar(qry                 : TwwQuery;
                    iFlgAbonoAnual      : Integer;
                    iIdLayoutEnt        : Integer;
                    iIdLayoutSaida      : Integer;
                    iTpConvenio         : Integer;
                    sMesRefEsc          : String;
                    sAbono              : String;
                    LocaleNomeArq       : String;
                    bHouveErro          : Boolean;
                    ProgressBar         : TProgressBar;
                    bLayoutTemRubricas  : Boolean;      
                    sFiltroVersao       : String;       
                    sFiltroRubricas     : String = '-1';
                    bIgnoraExcesso      : Boolean = True
                   );
var
  sMesRef, sMesRef2, sMesCob, sCodControle, sIdent, AuxNome, sSQL : String;
  nDescontado, nNaoDescontado : Real;
  iDescontado, iNaoDescontado, I, W, AuxColuna, Auxtam, iContReg : Integer;

  //Declaração das queries - Início
  qryLayoutDescontoSaida : TwwQuery;
  qryLayoutxColunas      : TwwQuery;
  //Declaração das queries - Fim

  aVetor    : array[1..14] of rArq ;
  ListaExp  : TStringList;


  // -----------------------------------------------------------------------------------------------
  // ProcessaAvulso
  // -----------------------------------------------------------------------------------------------
  procedure ProcessaAvulso;
  var
    sSQL              : String;
    sAux              : string;
    qryCtrlInterface  : TwwQuery;
    qryTmp            : TwwQuery;

    // ---------------------------------------------------------------------------------------------
    // ProcessaQuery;
    // ---------------------------------------------------------------------------------------------
    procedure ProcessaQuery;
    var
      Z : Integer;
    begin
      qryTmp.Close;
      qryTmp.SQL.Clear;
      qryTmp.SQL.Add(sSQL);
      qrytmp.Open;

      ProgressBar.Position  := ProgressBar.Min;
      ProgressBar.Max       := qrytmp.RecordCount;

      while not(qryTmp.EOF) do
      begin
        ProgressBar.Position  := ProgressBar.Position + 1;
        ProgressBar.Update;
        sIdent                := '2';

        for Z := 1 to MaxTamVetor do
        begin
          if aVetor[Z].Icoluna > 0 then
          begin

            if aVetor[Z].Inome = 'Matricula' then
            begin
              sIdent  := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              saux    := qrytmp.FieldByName('MATRICULA').AsString;
              sIdent  := sIdent + FAcertaTamanho(saux,aVetor[Z].Itamanho,'N');
            end;

            if aVetor[Z].Inome = 'Inscricao' then
            begin
              sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              sIdent := sIdent + FAcertaTamanho(qrytmp.FieldByName('INSCRICAONUMERO').AsString,aVetor[Z].Itamanho,'N');
            end;

            if aVetor[Z].Inome = 'Rubrica' then
            begin
              sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              if SistemaFolha.FlgUsaCodRubExt = 0 then
                sIdent := sIdent + FAcertaTamanho(qryTmp.FieldByName('IDPROVENTO').AsString,aVetor[Z].Itamanho,'N')
              else
                sIdent := sIdent + FAcertaTamanho(qryTmp.FieldByName('CODPROVDESC').AsString,aVetor[Z].Itamanho,'S');
            end;

            if aVetor[Z].Inome = 'SeqRubrica' then
            begin
              sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              sIdent := sIdent + FAcertaTamanho(qrytmp.FieldByName('ORDEM').AsString,aVetor[Z].Itamanho,'N');
            end;

            if aVetor[Z].Inome = 'ValorRubrica' then
            begin
              sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              sIdent := sIdent + FAcertaTamanho(FAcertaValor(qrytmp.FieldByName('VALOR').asfloat),aVetor[Z].Itamanho,'N');
            end;

            if aVetor[Z].Inome = 'ValorDescontado' then
            begin
              sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              sIdent := sIdent + FAcertaTamanho(FAcertaValor(qrytmp.FieldByName('VALORRECEBIDO').asfloat),aVetor[Z].Itamanho,'N');
            end;

            if aVetor[Z].Inome = 'ValorDiferenca' then
            begin
              sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              if qrytmp.FieldByName('VALOR').asfloat > 0 then
                sIdent := sIdent + FAcertaTamanho(FAcertaValor((qrytmp.FieldByName('VALOR').asfloat) - (qrytmp.FieldByName('VALORRECEBIDO').asfloat)),aVetor[Z].Itamanho,'N')
              else
                sIdent := sIdent + FAcertaTamanho('000000000',aVetor[Z].Itamanho, 'N');
            end;

            if aVetor[Z].Inome = 'Nome' then
            begin
              sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              sIdent := sIdent + FAcertaTamanho(qrytmp.FieldByName('NOME').AsString,aVetor[Z].Itamanho,'S');
            end;

            if aVetor[Z].Inome = 'SeqDependente' then
            begin
              sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              sIdent := sIdent + FAcertaTamanho(qrytmp.FieldByName('NUMSEQUENCIA').AsString,aVetor[Z].Itamanho, 'N');
            end;

            if aVetor[Z].Inome = 'Excesso' then
            begin
              sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              if qrytmp.FieldByName('VALORRECEBIDO').asfloat <> qrytmp.FieldByName('VALOR').asfloat then
                sIdent := sIdent + '1'
              else
                sIdent := sIdent + '0';
            end;

            if aVetor[Z].Inome = 'MesCob' then
            begin
              sMesCob := (Copy(qrytmp.FieldByName('MESCOBRANCA').AsString,1,4)+Copy(qrytmp.FieldByName('MESCOBRANCA').AsString,6,2));
              sIdent  := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              sIdent  := sIdent + FAcertaTamanho(sMesCob,aVetor[Z].Itamanho,'S');
            end;

            if aVetor[Z].Inome = 'MesRef' then
            begin
              sMesRef2  := (Copy(qrytmp.FieldByName('MESREFERENCIA').AsString, 1, 4)+
              Copy(qrytmp.FieldByName('MESREFERENCIA').AsString, 6, 2));
              sIdent    := FAcertaColuna(sIdent, aVetor[Z].Icoluna);
              sIdent    := sIdent + FAcertaTamanho(sMesRef2,aVetor[Z].Itamanho, 'S');
            end;

            if aVetor[Z].Inome = 'CodControle' then
            begin
              sCodControle  := Trim(qrytmp.FieldByName('CODIGOCONTROLE').AsString);
              sIdent        := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
              sIdent        := sIdent + FAcertaTamanho(sCodControle, aVetor[Z].Itamanho, 'S');
            end;

            if aVetor[Z].Inome = 'Prazo' then
            begin
              sIdent := FAcertaColuna(sIdent, aVetor[Z].Icoluna);
              sIdent := sIdent + FAcertaTamanho(qryTmp.FieldByName('PRAZORUB').AsString, aVetor[Z].Itamanho,'N');
            end;

          end;  // if aVetor[Z].Icoluna > 0 then
        end;  // for Z := 1 to MaxTamVetor

        Inc(iContReg);
        ListaExp.Add(sIdent);
        qryTmp.Next;
      end;  // while not(qryTmp.EOF) do
    end;  // procedure ProcessaQuery
    // ---------------------------------------------------------------------------------------------
    // FIM ProcessaQuery;
    // ---------------------------------------------------------------------------------------------


  begin
    ListaExp            := TStringList.Create;

    qryTmp              := TwwQuery.Create(Application);
    qryTmp.DatabaseName := 'BaseDados';

    if sFiltroVersao <> '-1' then
    begin
      //COLOCA CABEÇALHO do ARQUIVO

      if Sistema.TipoCliente = 19991 then 
        ListaExp.Add('1' + StrPadRight('P142020', 17, ' ') + Copy(sMesRef, 1, 4) + Copy(sMesRef, 6, 2) + '00000000');

      if bLayoutTemRubricas then
      begin
        sSQL :=
        'SELECT DISTINCT '                                      + #13 +
        '  TD.IDLOTE '                                          + #13 +

        'FROM '                                                 + #13 +
        '  TMPDESC       TD, '                                  + #13 +
        '  CTRLINTERFACE CT  '                                  + #13 +

        'WHERE '                                                + #13 +
        '      TD.IDLOTE          = CT.IDLOTE '                 + #13 +
        '  AND CT.IDREFERENCIA    = ' + IntToStr(iIdLayoutEnt)  + #13 +
        '  AND CT.MESREFERENCIA   = ' + QuotedStr(sMesRef)      + #13;

        // Se lote de abono anual
        if iFlgAbonoAnual = 1 then sSQL := sSQL +
        '  AND TD.MESREFERENCIA   = ' + QuotedStr(sAbono)
        else sSQL := sSQL +
        '  AND TD.MESREFERENCIA  <> ' + QuotedStr(sAbono);

        qryCtrlInterface              := TwwQuery.Create(Application);
        qryCtrlInterface.DatabaseName := 'BaseDados';

        qryCtrlInterface.Close;
        qryCtrlInterface.SQL.Clear;
        qryCtrlInterface.SQL.Text := sSQL;
        qryCtrlInterface.Open;

        if not(qryCtrlInterface.EOF) then
        begin
          // Abre a query da tabela TMPDESC
          sSQL:=
          'SELECT '                                                                       + #13 +
          '  L.INSCRICAONUMERO, E.MATRICULA, D.NUMSEQUENCIA, P.NOME, '                    + #13 +
          '  T.VALOR, T.VALORRECEBIDO, T.IDPROVENTO, T.ORDEM, '                           + #13 +
          '  T.MESREFERENCIA, T.MESCOBRANCA, T.CODIGOCONTROLE '                           + #13 +

          'FROM '                                                                         + #13 +
          '  TMPDESC      T, '                                                            + #13 +
          '  DEPENTIT     D, '                                                            + #13 +
          '  PESSOA       P, '                                                            + #13 +
          '  PARTPREVPLAN L, '                                                            + #13 +
          '  ELEGPATRO    E  '                                                            + #13 +

          'WHERE '                                                                        + #13 +
          '      (T.IDLOTE         = '+qryCtrlInterface.FieldByName('IDLOTE').AsString+')'+ #13 +
          '  AND (L.IDPESSOA       = T.IDTITULAR) '                                       + #13 +
          '  AND (L.FLGDESATIVADO  = 0) '                                                 + #13 +
          '  AND (E.IDPESSJUR      = L.IDPESSJUR) '                                       + #13 +
          '  AND (E.IDPESSOA       = L.IDPESSOA) '                                        + #13 +
          '  AND (D.IDTITULAR      = E.IDPESSOA) '                                        + #13 +
          '  AND (D.IDTITULAR      = T.IDTITULAR) '                                       + #13 +
          '  AND (D.IDPESSOA       = T.IDPESSOA) '                                        + #13 +
          '  AND (P.IDPESSOA       = T.IDPESSOA) '                                        + #13;

          if bIgnoraExcesso then sSQL := sSQL +
          '  AND (NVL(T.VALORRECEBIDO, 0) > 0) '                                            + #13;

          sSQL := sSQL +
          'ORDER BY '                                                                     + #13 +
          '  L.INSCRICAONUMERO ';

          qryTmp.Close;
          qryTmp.SQL.Clear;
          qryTmp.SQL.Text := sSQL;
          qrytmp.Open;

          ProcessaQuery;
        end;

        qryCtrlInterface.Close;
        qryCtrlInterface.Free;
      end
      else
      begin
        // -----------------------------------------------------------------------------------------
        // Processa registros da HISTRUBSAL

        sSQL:=
        'SELECT '                                                                         + #13 +
        '  L.INSCRICAONUMERO, NVL(D.MATRICULA, E.MATRICULA) AS MATRICULA, '               + #13 +
        '  D.NUMSEQUENCIA, P.NOME, T.VALORPROVENTO AS VALORRECEBIDO, '                    + #13 +
        '  T.VALORRECEBIDO AS VALOR, T.IDRUBRICA AS IDPROVENTO, '                         + #13 +
        '  NVL(T.ORDEM, 1) AS ORDEM, T.MES AS MESREFERENCIA, T.MESCOBRANCA, '             + #13 +
        '  NVL(TMP.CODIGOCONTROLE, '' '') AS CODIGOCONTROLE, '                            + #13 +
        '  PD.CODPROVDESC, NVL(T.PARCELAS, 1) AS PRAZORUB '                               + #13 +

        'FROM '                                                                           + #13 +
        '  HISTRUBSAL     T,   '                                                          + #13 +
        '  DEPENTIT       D,   '                                                          + #13 +
        '  PESSOA         P,   '                                                          + #13 +
        '  PARTPREVPLAN   L,   '                                                          + #13 +
        '  ELEGPATRO      E,   '                                                          + #13 +
        '  PROVDESC       PD,  '                                                          + #13 +
        '  LAYOUTXCOLUNAS LC,  '                                                          + #13 +
        '  TMPDESC        TMP  '                                                          + #13 +

        'WHERE '                                                                          + #13;

        if Pos(',', sFiltroVersao) > 0 then sSQL := sSQL +
        '      T.IDHSTFOLHABENEF     IN (' + sFiltroVersao + ') '                         + #13
        else sSQL := sSQL +
        '      T.IDHSTFOLHABENEF      = ' + sFiltroVersao                                 + #13;

        if (trim(sFiltroRubricas) <> '') and (sFiltroRubricas <> '-1') then
        begin
          if Pos(',', sFiltroRubricas) > 0 then sSQL := sSQL +
        '  AND T.IDRUBRICA           IN (' + sFiltroRubricas + ') '                       + #13
          else sSQL := sSQL +
        '  AND T.IDRUBRICA            = (' + sFiltroRubricas + ') '                       + #13;
        end;

        sSQL := sSQL +
        '  AND LC.IDLAYOUT            = ' + IntToStr(iIdLayoutEnt)                        + #13 +
        '  AND LC.IDFAVORECIDO        = T.IDFAVORECIDO '                                  + #13 +
        '  AND T.IDMODULO             = 18 '                                              + #13 +
        '  AND L.IDPESSOA             = T.IDTITULAR '                                     + #13 +
        '  AND T.FLGESTORNO           = 0 '                                               + #13 +
        '  AND E.IDPESSJUR            = L.IDPESSJUR '                                     + #13 +
        '  AND E.IDPESSOA             = L.IDPESSOA '                                      + #13 +
        '  AND D.IDTITULAR(+)         = T.IDTITULAR '                                     + #13 +
        '  AND D.IDPESSOA(+)          = T.IDPESSOA '                                      + #13 +
        '  AND P.IDPESSOA             = T.IDPESSOA '                                      + #13 +
        '  AND T.IDRUBRICA            = PD.IDPROVENTO '                                   + #13 +
        '  AND T.IDTITULAR            = E.IDPESSOA '                                      + #13 +
        '  AND ( '                                                                        + #13 +
        '         (T.IDPLANOPREV      = L.IDPLANOPREV AND T.IDPESSOA  = T.IDTITULAR) '    + #13 +
        '      OR (T.IDPLANOORIGEM    = L.IDPLANOPREV AND T.IDPESSOA <> T.IDTITULAR) '    + #13 +
        '      ) '                                                                        + #13 +
        '  AND T.IDPATRO              = L.IDPESSJUR '                                     + #13 +
        '  AND TMP.IDSEQINTERNOFB(+)  = T.SEQORIGINAL '                                   + #13 +
        '  AND TMP.IDTITULAR(+)       = T.IDTITULAR '                                     + #13 +
        '  AND TMP.IDPROVENTO(+)      = T.IDRUBRICA '                                     + #13 +
        '  AND TMP.IDPLANOPREV(+)     = T.IDPLANOPREV '                                   + #13 +
        '  AND TMP.IDPESSJUR(+)       = T.IDPATRO '                                       + #13;

        if bIgnoraExcesso then sSQL := sSQL +
        '  AND NVL(T.VALORPROVENTO, 0) > 0 '                                              + #13;

        sSQL := sSQL +
        'ORDER BY '                                                                       + #13 +
        '  MATRICULA ';

        // -----------------------------------------------------------------------------------------

        ProcessaQuery;

        // -----------------------------------------------------------------------------------------

        sSQL:=
        'SELECT DISTINCT '                                                                + #13 +
        '  L.INSCRICAONUMERO, NVL(D.MATRICULA, E.MATRICULA) AS MATRICULA, '               + #13 +
        '  D.NUMSEQUENCIA, P.NOME, '                                                      + #13 +
        '  T.IDTITULAR, T.IDPESSOA, T.VALORRECEBIDO, T.VALOR, '                           + #13 +
        '  T.IDPROVENTO, T.ORDEM, T.MESREFERENCIA, T.MESCOBRANCA, '                       + #13 +
        '  NVL(T.CODIGOCONTROLE, '' '') AS CODIGOCONTROLE, '                              + #13 +
        '  PD.CODPROVDESC, NVL(T.NUMPARCELAS, 1) AS PRAZORUB '                            + #13 +

        'FROM '                                                                           + #13 +
        '  LAYOUTXCOLUNAS LC, '                                                           + #13 +
        '  TMPDESC        T,  '                                                           + #13 +
        '  DEPENTIT       D,  '                                                           + #13 +
        '  PESSOA         P,  '                                                           + #13 +
        '  PARTPREVPLAN   L,  '                                                           + #13 +
        '  ELEGPATRO      E,  '                                                           + #13 +
        '  PROVDESC       PD  '                                                           + #13 +

        'WHERE '                                                                          + #13 +
        '      LC.IDLAYOUT      = ' + IntToStr(iIdLayoutEnt)                              + #13 +
        '  AND LC.IDFAVORECIDO  = T.IDFAVORECIDO '                                        + #13 +
        '  AND T.MESCOBRANCA    = ' + QuotedStr(sMesRef)                                  + #13 +
        '  AND T.SITENVIO       = ''0'' '                                                 + #13 +
        '  AND T.FLGDESCFOLHA   = ''B'' '                                                 + #13 +
        '  AND T.LOTEPREVIA     IS NULL '                                                 + #13 +
        '  AND L.IDPESSOA       = T.IDTITULAR '                                           + #13 +
        '  AND L.IDPESSJUR      = T.IDPESSJUR '                                           + #13 +
        '  AND E.IDPESSJUR      = T.IDPESSJUR '                                           + #13 +
        '  AND E.IDPESSOA       = T.IDTITULAR '                                           + #13 +
        '  AND L.INSCRICAODATA  = ( '                                                     + #13 +
        '                         SELECT MAX(P1.INSCRICAODATA) '                          + #13 +
        '                         FROM   PARTPREVPLAN P1 '                                + #13 +
        '                         WHERE  P1.IDPESSOA  = L.IDPESSOA '                      + #13 +
        '                         ) '                                                     + #13 +
        '  AND D.IDTITULAR(+)   = T.IDTITULAR '                                           + #13 +
        '  AND D.IDPESSOA(+)    = T.IDPESSOA '                                            + #13 +
        '  AND P.IDPESSOA       = T.IDPESSOA '                                            + #13 +
        '  AND T.IDPROVENTO     = PD.IDPROVENTO '                                         + #13;

        if (trim(sFiltroRubricas) <> '') and (sFiltroRubricas <> '-1') then
        begin
          if Pos(',', sFiltroRubricas) > 0 then sSQL := sSQL +
        '  AND T.IDPROVENTO    IN (' + sFiltroRubricas + ') '                             + #13
          else sSQL := sSQL +
        '  AND T.IDPROVENTO     = (' + sFiltroRubricas + ') '                             + #13;
        end;

        if bIgnoraExcesso then sSQL := sSQL +
        '  AND NVL(T.VALORRECEBIDO, 0) > 0 '                                              + #13;

        sSQL := sSQL +
        'ORDER BY '                                                                       + #13 +
        '  MATRICULA ';

        // -----------------------------------------------------------------------------------------

        ProcessaQuery;

        // -----------------------------------------------------------------------------------------
      end;

      if Copy(Sistema.NomeEmpresa, 1, 6) = 'FUNCEF' then ListaExp.Add('9' + StrPadLeft(IntToStr(iContReg), 6, '0'));

      ListaExp.SaveToFile(LocaleNomeArq)
    end;

    ProgressBar.Visible := False;

    ListaExp.Clear;
    ListaExp.Free;
    ListaExp := nil;

    qryTmp.Close;
    qryTmp.Free;
  end; // Processa Avulso
  // -----------------------------------------------------------------------------------------------
  // FIM ProcessaAvulso
  // -----------------------------------------------------------------------------------------------

  // -----------------------------------------------------------------------------------------------
  // ProcessaContinuado
  // -----------------------------------------------------------------------------------------------
  procedure ProcessaContinuado;
  var
    Z         : Integer;
    sSQL      : String;
    qryRIndiv : TwwQuery;
  begin
    ListaExp := TStringList.Create;

    qryRIndiv               := TwwQuery.Create(Application);
    qryRIndiv.DatabaseName  := 'BaseDados';

    if sFiltroVersao <> '-1' then
    begin
      // Abre a query da tabela RUBRICAINDIV
      sSQL :=
      'SELECT '                                                                           + #13 +
      '  L.INSCRICAONUMERO, NVL(D.MATRICULA, E.MATRICULA) AS MATRICULA, '                 + #13 +
      '  D.NUMSEQUENCIA, P.NOME, '                                                        + #13 +
      '  T.VALORPROVENTO AS VALORRECEBIDO, T.VALORRECEBIDO AS VALOR, '                    + #13 +
      '  T.IDRUBRICA AS IDPROVENTO, NVL(T.ORDEM, 1) AS ORDEM, '                           + #13 +
      '  T.PARCELAS AS PRAZO, '                                                           + #13 +
      '  T.MES AS MESREFERENCIA, T.MESCOBRANCA AS MESCOBRANCA, '                          + #13 +
      '  PD.CODPROVDESC, NVL(PD.PRAZO, 0) AS PRAZORUB '                                   + #13 +

      'FROM '                                                                             + #13 +
      '  HISTRUBSAL     T,  '                                                             + #13 +
      '  DEPENTIT       D,  '                                                             + #13 +
      '  PESSOA         P,  '                                                             + #13 +
      '  PARTPREVPLAN   L,  '                                                             + #13 +
      '  ELEGPATRO      E,  '                                                             + #13 +
      '  PROVDESC       PD, '                                                             + #13 +
      '  LAYOUTXCOLUNAS LC  '                                                             + #13 +

      'WHERE '                                                                            + #13;

      if Pos(',', sFiltroVersao) > 0 then sSQL := sSQL +
      '      T.IDHSTFOLHABENEF   IN (' + sFiltroVersao + ') '                             + #13
      else sSQL := sSQL +
      '      T.IDHSTFOLHABENEF    = ' + sFiltroVersao                                     + #13;

      if (trim(sFiltroRubricas) <> '') and (sFiltroRubricas <> '-1') then
      begin
        if Pos(',', sFiltroRubricas) > 0 then sSQL := sSQL +
      '  AND T.IDRUBRICA         IN (' + sFiltroRubricas + ') '                           + #13
        else sSQL := sSQL +
      '  AND T.IDRUBRICA          = (' + sFiltroRubricas + ') '                           + #13;
      end;

      sSQL := sSQL+
      '  AND LC.IDLAYOUT          = ' + IntToStr(iIdLayoutEnt)                            + #13 +
      '  AND LC.IDFAVORECIDO      = T.IDFAVORECIDO '                                      + #13 +
      '  AND T.IDMODULO           = 18 '                                                  + #13 +
      '  AND L.IDPESSOA           = T.IDTITULAR '                                         + #13 +
      '  AND T.FLGESTORNO         = 0 '                                                   + #13 +
      '  AND E.IDPESSJUR          = L.IDPESSJUR '                                         + #13 +
      '  AND E.IDPESSOA           = L.IDPESSOA '                                          + #13 +
      '  AND T.IDTITULAR          = D.IDTITULAR(+) '                                      + #13 +
      '  AND T.IDPESSOA           = D.IDPESSOA(+) '                                       + #13 +
      '  AND T.IDPESSOA           = P.IDPESSOA '                                          + #13 +
      '  AND PD.IDPROVENTO        = T.IDRUBRICA '                                         + #13 +
      '  AND T.IDTITULAR          = E.IDPESSOA '                                          + #13 +
      '  AND ( '                                                                          + #13 +
      '         (T.IDPLANOPREV    = L.IDPLANOPREV AND T.IDPESSOA  = T.IDTITULAR) '        + #13 +
      '      OR (T.IDPLANOORIGEM  = L.IDPLANOPREV AND T.IDPESSOA <> T.IDTITULAR) '        + #13 +
      '      ) '                                                                          + #13;

      if bIgnoraExcesso then sSQL := sSQL +
      '  AND NVL(T.VALORPROVENTO, 0) > 0 '                                                + #13;

      sSQL := sSQL +
      'ORDER BY '                                                                         + #13 +
      '  MATRICULA';

      qryRIndiv.SQL.Text := sSQL;
      qryRIndiv.Open;

      ProgressBar.Max := qryRIndiv.RecordCount;
      if not qryRindiv.EOF then
      begin
        sMesRef := Copy(sMesRef, 1, 4) + Copy(sMesRef, 6, 2);

        if Sistema.TipoCliente = 19991 then 
          ListaExp.Add('1' + StrPadRight('P142020', 17, ' ') + sMesRef + '00000000');

        while not(qryRIndiv.EOF) do
        begin
          ProgressBar.Position  := ProgressBar.Position + 1;
          ProgressBar.Update;
          sIdent                := '2';

          for Z := 1 to MaxTamVetor do
          begin
            if aVetor[Z].Icoluna > 0 then
            begin

              if aVetor[Z].Inome = 'Matricula' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                sIdent := sIdent + FAcertaTamanho(qryRIndiv.FieldByName('MATRICULA').AsString,aVetor[Z].Itamanho,'S');
              end;

              if aVetor[Z].Inome = 'Inscricao' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                sIdent := sIdent + FAcertaTamanho(qryRIndiv.FieldByName('INSCRICAONUMERO').AsString,aVetor[Z].Itamanho,'S');
              end;

              if aVetor[Z].Inome = 'Rubrica' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                if SistemaFolha.FlgUsaCodRubExt = 0 then
                  sIdent := sIdent + FAcertaTamanho(qryRIndiv.FieldByName('IDPROVENTO').AsString,aVetor[Z].Itamanho,'N')
                else
                  sIdent := sIdent + FAcertaTamanho(qryRIndiv.FieldByName('CODPROVDESC').AsString,aVetor[Z].Itamanho,'S');
              end;

              if aVetor[Z].Inome = 'SeqRubrica' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                sIdent := sIdent + FAcertaTamanho(qryRIndiv.FieldByName('ORDEM').AsString,aVetor[Z].Itamanho,'N');
              end;

              if aVetor[Z].Inome = 'ValorRubrica' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                sIdent := sIdent + FAcertaTamanho(FAcertaValor(qryRIndiv.FieldByName('VALOR').asfloat),aVetor[Z].Itamanho,'N');
              end;

              if aVetor[Z].Inome = 'ValorDescontado' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                sIdent := sIdent + FAcertaTamanho(FAcertaValor(qryRIndiv.FieldByName('VALORRECEBIDO').asfloat),aVetor[Z].Itamanho,'N');
              end;

              if aVetor[Z].Inome = 'ValorDiferenca' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                if qryRIndiv.FieldByName('VALOR').asfloat > 0 then
                  sIdent := sIdent + FAcertaTamanho(FAcertaValor(qryRIndiv.FieldByName('VALOR').asfloat - qryRIndiv.FieldByName('VALORRECEBIDO').asfloat),aVetor[Z].Itamanho,'N')
                else
                  sIdent := sIdent + FAcertaTamanho('000000000',aVetor[Z].Itamanho,'N');
              end;

              if aVetor[Z].Inome = 'Nome' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                sIdent := sIdent + FAcertaTamanho(qryRIndiv.FieldByName('NOME').AsString,aVetor[Z].Itamanho,'S');
              end;

              if aVetor[Z].Inome = 'SeqDependente' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                sIdent := sIdent + FAcertaTamanho(qryRIndiv.FieldByName('NUMSEQUENCIA').AsString,aVetor[Z].Itamanho,'N');
              end;

              if aVetor[Z].Inome = 'Excesso' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                if qryRIndiv.FieldByName('VALORRECEBIDO').asfloat <> qryRIndiv.FieldByName('VALOR').asfloat then
                  sIdent := sIdent + '1'
                else
                  sIdent := sIdent + '0';
              end;

              if aVetor[Z].Inome = 'MesCob' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                sIdent := sIdent + FAcertaTamanho(qryRIndiv.FieldByName('MESCOBRANCA').AsString,aVetor[Z].Itamanho,'S');
              end;

              if aVetor[Z].Inome = 'MesRef' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                sIdent := sIdent + FAcertaTamanho(qryRIndiv.FieldByName('MESREFERENCIA').AsString,aVetor[Z].Itamanho,'S');
              end;

              if aVetor[Z].Inome = 'Prazo' then
              begin
                sIdent := FAcertaColuna(sIdent,aVetor[Z].Icoluna);
                case qryRIndiv.FieldByName('PRAZORUB').AsInteger Of
                    0 : sIdent := sIdent + FAcertaTamanho('999',aVetor[Z].Itamanho,'N');
                    2 : sIdent := sIdent + FAcertaTamanho('001',aVetor[Z].Itamanho,'N');
                  else
                    sIdent := sIdent + FAcertaTamanho(qryRIndiv.FieldByName('PRAZO').AsString,aVetor[Z].Itamanho,'N');
                end;
              end;
            end;
          end;  // for

          Inc(iContReg);
          ListaExp.Add(sIdent);
          qryRIndiv.Next;
        end;

        if Sistema.TipoCliente = 19991 then 
          ListaExp.Add('9' + StrPadLeft(IntToStr(iContReg), 6, '0'));

        ListaExp.SavetoFile(LocaleNomeArq);
      end;
      ProgressBar.Visible := False;
      ListaExp.Clear;
    end
    else
    begin
      ShowMessage('As informações solicitadas não foram encontradas ...');
    end;

    qryRIndiv.Close;
    qryRIndiv.Free;
    ListaExp.Clear;
    ListaExp.Free;
    ListaExp := nil;
  end; // Processa Continuado
  // -----------------------------------------------------------------------------------------------
  // FIM ProcessaContinuado
  // -----------------------------------------------------------------------------------------------

begin
  iContReg := 0;

  qryLayoutxColunas      := TwwQuery.Create(Application);
  qryLayoutDescontoSaida := TwwQuery.Create(Application);

  qryLayoutDescontoSaida.DatabaseName := 'BaseDados';
  qryLayoutxColunas.DatabaseName      := 'BaseDados';

  sSQL :=
  'SELECT '                                                                           + #13 +
  '  IDLAYOUTSAIDA, DESCRICAO, '                                                      + #13 +
  '  NVL(COLMATRICULA, 0) COLMATRICULA,   NVL(TAMMATRICULA, 0)  TAMMATRICULA, '       + #13 +
  '  NVL(COLINSCRICAO, 0) COLINSCRICAO,   NVL(TAMINSCRICAO, 0)  TAMINSCRICAO, '       + #13 +
  '  NVL(COLVALORRUB, 0)  COLVALORRUB,    NVL(TAMVALORRUB, 0)   TAMVALORRUB, '        + #13 +
  '  NVL(COLVALORDES, 0)  COLVALORDES,    NVL(TAMVALORDES, 0)   TAMVALORDES, '        + #13 +
  '  NVL(COLVALORDIF, 0)  COLVALORDIF,    NVL(TAMVALORDIF, 0)   TAMVALORDIF, '        + #13 +
  '  NVL(COLRUBRICA, 0)   COLRUBRICA,     NVL(TAMRUBRICA, 0)    TAMRUBRICA, '         + #13 +
  '  NVL(COLNOME, 0)      COLNOME,        NVL(TAMNOME, 0)       TAMNOME, '            + #13 +
  '  NVL(COLSEQDEP, 0)    COLSEQDEP,      NVL(TAMSEQDEP, 0)     TAMSEQDEP, '          + #13 +
  '  NVL(COLSEQRUB, 0)    COLSEQRUB,      NVL(TAMSEQRUB, 0)     TAMSEQRUB, '          + #13 +
  '  NVL(COLEXCESSO, 0)   COLEXCESSO,     NVL(TAMEXCESSO, 0)    TAMEXCESSO, '         + #13 +
  '  NVL(COLMESREF, 0)    COLMESREF,      NVL(TAMMESREF, 0)     TAMMESREF, '          + #13 +
  '  NVL(COLMESCOB, 0)    COLMESCOB,      NVL(TAMMESCOB, 0)     TAMMESCOB, '          + #13 +
  '  NVL(COLCONTROLE, 0)  COLCONTROLE,    NVL(TAMCONTROLE, 0)   TAMCONTROLE, '        + #13 +
  '  NVL(COLPRAZO, 0)     COLPRAZO,       NVL(TAMPRAZO, 0) TAMPRAZO '                 + #13 +

  'FROM '                                                                             + #13 +
  '  LAYOUTDESCONTOSAIDA '                                                            + #13 +
  'WHERE '                                                                            + #13 +
  '  IDLAYOUTSAIDA = ' + IntToStr(iIdLayoutSaida)                                     + #13 +
  'ORDER BY '                                                                         + #13 +
  '  DESCRICAO ';

  qryLayoutDescontoSaida.Close;
  qryLayoutDescontoSaida.SQL.Clear;
  qryLayoutDescontoSaida.SQL.Text := sSQL;
  qryLayoutDescontoSaida.Open;

  //------------------------ TRATAMENTO do VETOR -------------------------------------//

  // Limpa o Vetor
  for I := 1 to MaxTamVetor do
  begin
    aVetor[I].IColuna  := 0;
    aVetor[I].iNome    := '';
    aVetor[I].Itamanho := 0;
  end;

  // Carrega o Vetor
  aVetor[1].Icoluna   := qryLayoutDescontoSaida.FieldByName('COLMATRICULA').asInteger;
  aVetor[1].INome     := 'Matricula';
  aVetor[1].Itamanho  := qryLayoutDescontoSaida.FieldByName('TAMMATRICULA').asInteger;
  aVetor[2].Icoluna   := qryLayoutDescontoSaida.FieldByName('COLINSCRICAO').asInteger;
  aVetor[2].INome     := 'Inscricao';
  aVetor[2].ITamanho  := qryLayoutDescontoSaida.FieldByName('TAMINSCRICAO').asInteger;
  aVetor[3].Icoluna   := qryLayoutDescontoSaida.FieldByName('COLRUBRICA').asInteger;
  aVetor[3].Inome     := 'Rubrica';
  aVetor[3].Itamanho  := qryLayoutDescontoSaida.FieldByName('TAMRUBRICA').asInteger;
  aVetor[4].Icoluna   := qryLayoutDescontoSaida.FieldByName('COLSEQRUB').asInteger;
  aVetor[4].Inome     := 'SeqRubrica';
  aVetor[4].ITamanho  := qryLayoutDescontoSaida.FieldByName('TAMSEQRUB').asInteger;
  aVetor[5].Icoluna   := qryLayoutDescontoSaida.FieldByName('COLVALORRUB').asInteger;
  aVetor[5].Inome     := 'ValorRubrica';
  aVetor[5].Itamanho  := qryLayoutDescontoSaida.FieldByName('TAMVALORRUB').asInteger;
  aVetor[6].Icoluna   := qryLayoutDescontoSaida.FieldByName('COLVALORDES').asInteger;
  aVetor[6].Inome     := 'ValorDescontado';
  aVetor[6].ITamanho  := qryLayoutDescontoSaida.FieldByName('TAMVALORDES').asInteger;
  aVetor[7].Icoluna   := qryLayoutDescontoSaida.FieldByName('COLVALORDIF').asInteger;
  aVetor[7].Inome     := 'ValorDiferenca';
  aVetor[7].Itamanho  := qryLayoutDescontoSaida.FieldByName('TAMVALORDIF').asInteger;
  aVetor[8].Icoluna   := qryLayoutDescontoSaida.FieldByName('COLNOME').asInteger;
  aVetor[8].Inome     := 'Nome';
  aVetor[8].Itamanho  := qryLayoutDescontoSaida.FieldByName('TAMNOME').asInteger;
  aVetor[9].Icoluna   := qryLayoutDescontoSaida.FieldByName('COLSEQDEP').asInteger;
  aVetor[9].INome     := 'SeqDependente';
  aVetor[9].Itamanho  := qryLayoutDescontoSaida.FieldByName('TAMSEQDEP').asInteger;
  aVetor[10].Icoluna  := qryLayoutDescontoSaida.FieldByName('COLEXCESSO').asInteger;
  aVetor[10].Inome    := 'Excesso';
  aVetor[10].ITamanho := qryLayoutDescontoSaida.FieldByName('TAMEXCESSO').asInteger;
  aVetor[11].Icoluna  := qryLayoutDescontoSaida.FieldByName('COLMESCOB').asInteger;
  aVetor[11].Inome    := 'MesCob';
  aVetor[11].ITamanho := qryLayoutDescontoSaida.FieldByName('TAMMESCOB').asInteger;
  aVetor[12].Icoluna  := qryLayoutDescontoSaida.FieldByName('COLMESREF').asInteger;
  aVetor[12].Inome    := 'MesRef';
  aVetor[12].ITamanho := qryLayoutDescontoSaida.FieldByName('TAMMESREF').asInteger;
  aVetor[13].Icoluna  := qryLayoutDescontoSaida.FieldByName('COLCONTROLE').asInteger;
  aVetor[13].Inome    := 'CodControle';
  aVetor[13].ITamanho := qryLayoutDescontoSaida.FieldByName('TAMCONTROLE').asInteger;
  aVetor[14].Icoluna  := qryLayoutDescontoSaida.FieldByName('COLPRAZO').AsInteger;
  aVetor[14].INome    := 'Prazo';
  aVetor[14].ITamanho := qryLayoutDescontoSaida.FieldByName('TAMPRAZO').AsInteger;

  // Ordena o Vetor (Menor coluna para a Maior)
  for W := 1 to MaxTamVetor do
  begin
    for I := 1 to MaxTamVetor do
    begin
      if ((aVetor[I].Icoluna < aVetor[I-1].IColuna) and (I > 1)) then
      begin
        AuxColuna           := aVetor[I-1].Icoluna;
        AuxNome             := aVetor[I-1].Inome;
        AuxTam              := aVetor[I-1].ITamanho;
        aVetor[I-1].IColuna := aVetor[I].Icoluna;
        aVetor[I-1].Inome   := aVetor[I].Inome;
        aVetor[I-1].Itamanho:= aVetor[I].Itamanho;
        aVetor[I].Icoluna   := AuxColuna;
        aVetor[I].Inome     := AuxNome;
        aVetor[I].Itamanho  := AuxTam;
      end;  // if ((aVetor[I].Icoluna < aVetor[I-1].IColuna) and (I > 1)) then
    end;  // for I := 1 to MaxTamVetor do
  end;  // for W := 1 to MaxTamVetor do

  sMesRef := sMesRefEsc;

  qryLayoutxColunas.Close;
  qryLayoutxColunas.SQL.Clear;
  qryLayoutxColunas.SQL.Text := 'SELECT * FROM LAYOUTXCOLUNAS WHERE IDLAYOUT = ' + IntToStr(iIdLayoutEnt);
  qryLayoutxColunas.Open;

  iDescontado    := 0;
  nDescontado    := 0;
  iNaoDescontado := 0;
  nNaoDescontado := 0;

  // Determina o tipo do convenio (Avulso ou Continuado)
  if iTpConvenio = 0 then
  begin
    ProcessaAvulso;      // Avulso - TMPDESC
  end
  else
  begin
    ProcessaContinuado; // Continuado - RUBRICAINDIV
  end;
end;
// -------------------------------------------------------------------------------------------------
// Processar(...)
// -------------------------------------------------------------------------------------------------



function FAcertaColuna(sParm : String ; nTam : Integer) : String;
var
  nTamAtual , I, Diferenca : Integer;
begin
  nTamAtual := Length(sParm);
  if nTamAtual > 0 then
  begin
    if nTamAtual+1 < nTam then
    begin
      Diferenca := (nTam - (ntamAtual+1));
      for I := 1 to Diferenca do
        sParm := sParm + ' ';
    end;
    if nTamAtual+1 > nTam then
      sParm := Copy(sParm,1,nTam-1);
  end;
  Result := sParm;
end;



function FAcertaTamanho(sParm : String ; nTam : Integer ; sTipo : String) : String;
var
  cRetorno : String;
  nDif, I  : Integer;
begin
  cRetorno := sParm;
  if Length(cRetorno) < nTam then
  begin
    nDif := nTam-Length(cRetorno);
    for I := 1 to nDif do
    begin
      if sTipo = 'S' then
        cRetorno := cRetorno + ' ';
      if sTipo = 'N' then
        cRetorno := '0' + cRetorno;
    end;
  end;
  if Length(cRetorno) > nTam then
  begin
    cRetorno := Copy(cRetorno, 1, nTam);
  end;
  Result := cRetorno;
end;



function FAcertaValor(nParm : Real) : String;
var
  cRetorno, cNumero : String;
  nPosicao          : Integer;
begin
  cRetorno := FormatFloat('0.00', nParm);
  nPosicao := Pos(',', cRetorno);
  cNumero  := Copy(cRetorno, 1, nPosicao - 1);
  cNumero  := cNumero + Copy(cRetorno, nPosicao + 1 , 2);
  Result   := cNumero;
end;



end.
