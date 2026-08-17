unit UEventos;

interface

uses
  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

var
   strContribuicaoAAssociar: string;
  {Rotina para testar se o participante pode ser registrado em um determinado evento}
   function PodeRegistrarEvento(qry: TwwQuery; sIdpessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta: string): boolean;

  {Grava o Histórico de contribuições por eventos: Todas as Contribuições suspensas e todas as novas contribuições associadas}
   function GravaHSTCONTEVENTOSPRFechado(pIdEventosPrev, pIdPlanoPrev, pIdEventoGerador, pIdPessoa, pIdPessJur,
                                           pSeqProposta: string; bEventoSuspendeContribuicoes: boolean; qryAux, qryGrava: TwwQuery): Boolean;

   function GravaHSTCONTEVENTOSPRAberto(pIdEventosPrev, pIdPlanoPrev, pIdEventoGerador, pIdPessoa, pIdPessJur,
                                          pSeqProposta: string; bEventoSuspendeContribuicoes: boolean; qryAux, qryGrava: TwwQuery): Boolean;

   function AssociaNovasContribuicoes(pIdPessJur, pIdPlanoPrev, pIdPessoa, pSeqProposta, pIdEventoGerador, pDtEventoIni, pDtEventoFin,
                                      pMatricula, pIdSitPart, sSalarioPart : string; bRequerBenef, bPrepararContrib: boolean; qryAux, qryGrava: TwwQuery): boolean;

  {Suspende a Cobrança de todas as Contribuições Previdenciarias do Participante}
   function SuspendeContribuicoes(pIdPessJur, pIdPlanoPrev, pIdPessoa, pSeqProposta, pIdEventoGerador, pDtEventoIni, pDtEventoFin,
                                  pMatricula, pIdSitPart: string; qryAux, qryGrava: TwwQuery): boolean;

  {Verifica se o Participante possui beneficios para o evento solicitado (Somente para o Aberto)}
   function ParticipantePossuiBeneficiosParaEvento(pIdPessJur, pIdPlanoPrev, pIdPessoa, pIdEventoGerador: string; qryAux: TwwQuery): boolean;

   function PlanosIndividuais(qryConsulta: TwwQuery; sIdPlanoPrev:string):Boolean;  // ABERTO - 05/10/98//

implementation

uses
    UMensErro, UAdmPrev, UContribuicaoPrev{, FCadContribParticipante};

function PodeRegistrarEvento(qry: TwwQuery; sIdpessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta: string): boolean;
begin
  Result := False;

 {Verifica se o Participante não está Demitido, Aposentado ou Falecido}
  qry.Close;
  qry.Sql.Clear;
  qry.Sql.Add(' SELECT EG.IDEVENTOGERADOR ' +
              ' FROM EVENTOGERADOR EG, EVENTOSPREV EP ' +
              ' WHERE EG.FLGINTERNO IN ' + '(''DC'', ''DM'', ''DS'', ''TS'', ''ID'', ''IN'', ''FL'')' + ' AND ' +
              '       EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR AND ' +
              '       EP.SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
              '       EP.IDPESSJUR       = ' + sIdPessJur   + ' AND ' +
              '       EP.IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
              '       EP.IDPESSOA        = ' + sIdPessoa);
  try
     qry.Open;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  if not qry.IsEmpty then
     Result := False //Não pode registrar o evento
 {Fim - Verifica se o Participante não está Demitido, Aposentado ou Falecido}
  else
     begin
         {Verifica se o Participante não está Afastado, em Assistência Temporária,
          Cancelado por iniciativa, ou Cancelado por inadimplência}
          qry.Close;
          qry.Sql.Clear;
          qry.Sql.Add(' SELECT EG.NOME ' +
                      ' FROM EVENTOGERADOR EG, EVENTOSPREV EP ' +
                      ' WHERE EG.FLGINTERNO IN ' + '(''AF'', ''DO'', ''AC'', ''OE'', ''CP'', ''CI'')' + ' AND ' +
                      '       EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR AND ' +
                      '       EP.SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
                      '       EP.IDPESSJUR       = ' + sIdPessJur   + ' AND ' +
                      '       EP.IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
                      '       EP.IDPESSOA        = ' + sIdPessoa    + ' AND ' +
                      '       EP.DATAVOLTA IS NULL ');
          try
             qry.Open;
          except
             on E:EDBEngineError do
                begin
                     MostrarErro(E);
                     Exit;
                end;
          end;

          if not qry.IsEmpty then
             Result := False //Não pode registrar o evento
         {Fim - Verifica se o Participante não está Afastado, em Assistência Temporária,
          Cancelado por iniciativa, ou Cancelado por inadimplência}
          else
             Result := True;
     end;
end;

function GravaHSTCONTEVENTOSPRFechado(pIdEventosPrev, pIdPlanoPrev, pIdEventoGerador, pIdPessoa, pIdPessJur,
                                        pSeqProposta: string; bEventoSuspendeContribuicoes: boolean; qryAux, qryGrava: TwwQuery): Boolean;
var
  iIdAssociacao: Integer;
  sSQL: string;
  bErro: Boolean;
begin
  Result := False;
  iIdAssociacao := 0;

 {Grava HSTCONTEVENTOSPR as contribuições que serão suspensas}
  if bEventoSuspendeContribuicoes then
     begin
         {Filtra todas as contribuições atuais que serão suspensas}
          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add(' SELECT IDCONTRIBUICAO FROM CONTRIBPREVPARTP ' +
                         ' WHERE SEQPROPOSTA = ' + pSeqProposta + ' AND ' +
                         '       IDPESSJUR   = ' + pIdPessJur   + ' AND ' +
                         '       IDPLANOPREV = ' + pIdPlanoPrev + ' AND ' +
                         '       IDPESSOA    = ' + pIdPessoa    + ' AND ' +
                         '       FLGCOBRA    = 1 ');
          qryAux.Open;
          while not qryAux.EOF do
              begin
                   iIdAssociacao := iIdAssociacao + 1;
                  {Grava todas as contribuiçoes atuais que serão suspensas, como não associadas}
                   qryGrava.Close;
                   qryGrava.Sql.Clear;
                   qryGrava.Sql.Add(' INSERT INTO HSTCONTEVENTOSPR(IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORF, ' +
                                    '             IDPLANOPREVF, IDCONTRIBUICAOF, TIPO, FLGASSOCIADA) ' +
                                    ' VALUES( ' + pIdEventosPrev + ',' + IntToStr(iIdAssociacao) + ',' + pIdEventoGerador + ',' +
                                                  pIdPlanoPrev + ',' + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',' + '''F''' + ', 0' + ')');
                   try
                      qryGrava.ExecSQL;
                   except
                      on E:EDBEngineError do
                         begin
                              MostrarErro(E);
                              Exit;
                         end;
                   end;

                   qryAux.Next;
              end;
     end;
 {Fim - Grava HSTCONTEVENTOSPR as contribuições que serão suspensas}

 {Grava HSTCONTEVENTOSPR as novas contribuições que serão associadas}

 {Filtra todas as novas contribuições que deverão ser associadas}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDCONTRIBUICAO, IDREGRAVALIDASSOC FROM CONTPREVEVENTO ' +
                 ' WHERE  IDPLANOPREV     = ' + pIdPlanoPrev    + ' AND ' +
                 '        IDEVENTOGERADOR = ' + pIdEventoGerador);
  qryAux.Open;
  qryAux.First;
  strContribuicaoAAssociar := '';
 {Chama regra de Validação de Associação de Contrib, para verificar se a contribuição deve ser associada ao Participante ou não}
  while not qryAux.EOF do
     begin
          if qryAux.FieldByName('IDREGRAVALIDASSOC').AsString = '' then
             begin
                  strContribuicaoAAssociar := strContribuicaoAAssociar + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ', ';
                  qryAux.Next;
                  Continue;
             end
          else
             begin
                 {Executar Regra de Validação da Associação de Contribuição - Passa para a regra os dados cadastrais do Participante}
                  sSQL := ' SELECT PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.SALPARTICIPACAO, SALINSCRICAO, ' +
                          '        PP.SEQPROPOSTA, EL.IDSITFUNC, EL.CODCENTROCUSTO, EL.IDCARGO, EL.MATRICULA, ' +
                          '        EL.DATAADMISSAO, EL.SALTOTAL, EL.PARTICIPPREVID, EL.PARTICIPASSIST, ' +
                          '        EL.NIVEL, EL.TEMPOSERVANTERIOR, PF.DATANASC, PF.SEXO, PF.DATAMORTE, ' +
                          '        PF.ESTCIVIL, P.NUMDOCUMENTO ' +
                          ' FROM PARTPREVPLAN PP, ELEGPATRO EL, PESSOAFISICA PF, PESSOA P ' +
                          ' WHERE PP.IDPESSOA    = ' + pIdPessoa    + ' AND ' +
                          '       PP.IDPESSJUR   = ' + pIdPessJur   + ' AND ' +
                          '       PP.IDPLANOPREV = ' + pIdPlanoPrev + ' AND ' +
                          '       PP.SEQPROPOSTA = ' + pSeqProposta + ' AND ' +
                          '       EL.IDPESSOA  = PP.IDPESSOA AND ' +
                          '       EL.IDPESSJUR = PP.IDPESSJUR AND ' +
                          '       PP.IDPESSOA = PF.IDPESSOA AND ' +
                          '       PP.IDPESSOA = P.IDPESSOA ';

                  if RegraBooleana(qryAux.FieldByName('IDREGRAVALIDASSOC').AsString, sSQL, bErro) then
                     strContribuicaoAAssociar := strContribuicaoAAssociar + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ', '
                  else
                  if bErro then
                     begin
                         MsgDlg('Erro na Execução da Regra de Associação de Contribuição.','Informação',mtInformation,[mbOk,mbHelp],0);
                         Exit;
                     end;
             end;

          qryAux.Next;
     end;
 {Fim - Chama regra de Validação de Associação de Contrib, para cada contribuição a ser associada}

 {Grava todas as novas contribuiçoes que serão associadas, como associadas}
  if Trim(strContribuicaoAAssociar) <> '' then
     strContribuicaoAAssociar := Copy(strContribuicaoAAssociar, 1, Length(strContribuicaoAAssociar) - 2)
  else
     strContribuicaoAAssociar := '0';

 {Filtra somente as contribuição que a regra validou}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDCONTRIBUICAO FROM CONTPREVEVENTO ' +
                 ' WHERE IDPLANOPREV     = ' + pIdPlanoPrev     + ' AND ' +
                 '       IDEVENTOGERADOR = ' + pIdEventoGerador + ' AND ' +
                 '       IDCONTRIBUICAO IN (' + strContribuicaoAAssociar + ')');
  qryAux.Open;
  qryAux.First;
  while not qryAux.EOF do
     begin
          iIdAssociacao := iIdAssociacao + 1;
          qryGrava.Close;
          qryGrava.Sql.Clear;
          qryGrava.Sql.Add(' INSERT INTO HSTCONTEVENTOSPR(IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORF, ' +
                           '             IDPLANOPREVF, IDCONTRIBUICAOF, TIPO, FLGASSOCIADA) ' +
                           ' VALUES( ' + pIdEventosPrev + ',' + IntToStr(iIdAssociacao) + ',' + pIdEventoGerador + ',' +
                                         pIdPlanoPrev + ',' + qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',' + '''F''' + ', 1' + ')');
          try
             qryGrava.ExecSQL;
          except
             on E:EDBEngineError do
                begin
                     MostrarErro(E);
                     Exit;
                end;
          end;

          qryAux.Next;
     end;
 {Fim - Grava todas as novas contribuiçoes que serão associadas, como associadas}

 {Fim - Grava HSTCONTEVENTOSPR as novas contribuições que serão associadas}

  Result := True;
end;

function GravaHSTCONTEVENTOSPRAberto(pIdEventosPrev, pIdPlanoPrev, pIdEventoGerador, pIdPessoa, pIdPessJur,
                                       pSeqProposta: string; bEventoSuspendeContribuicoes: boolean; qryAux, qryGrava: TwwQuery): Boolean;
var
  iIdAssociacao: Integer;
  sIdProduto, sIdBeneficio : string;
begin
  Result := False;

  iIdAssociacao := 0;

 {Grava HSTCONTEVENTOSPR as contribuições que serão suspensas}
  if bEventoSuspendeContribuicoes then
     begin
         {Filtra todas as contribuições atuais que serão suspensas}
          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add(' SELECT CP.IDCONTRIBUICAO, C.IDBENEFICIO, BF.IDPRODUTO ' +
                         ' FROM CONTRIBPREVPARTP CP, CONTRIBUICAO C, BENEFPLANPREV BF ' +
                         ' WHERE CP.SEQPROPOSTA = ' + pSeqProposta + ' AND ' +
                         '       CP.IDPESSJUR   = ' + pIdPessJur   + ' AND ' +
                         '       CP.IDPLANOPREV = ' + pIdPlanoPrev + ' AND ' +
                         '       CP.IDPESSOA    = ' + pIdPessoa    + ' AND ' +
                         '       CP.FLGCOBRA    = 1 AND ' +
                         '       CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND ' +
                         '       CP.IDPLANOPREV = BF.IDPLANOPREV AND ' +
                         '       C.IDBENEFICIO  = BF.IDBENEFICIO ');
          qryAux.Open;
          while not qryAux.EOF do
              begin
                   iIdAssociacao := iIdAssociacao + 1;
                  {Grava todas as contribuiçoes atuais que serão suspensas, como não associadas}
                   qryGrava.Close;
                   qryGrava.Sql.Clear;
                   qryGrava.Sql.Add(' INSERT INTO HSTCONTEVENTOSPR(IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORA, ' +
                                    '             IDPRODUTOA, IDBENEFICIOA, IDCONTRIBUICAOA, ' +
                                    '             TIPO, FLGASSOCIADA) ' +
                                    ' VALUES( ' + pIdEventosPrev + ',' + IntToStr(iIdAssociacao) + ',' + pIdEventoGerador + ',' +
                                                  qryAux.FieldByName('IDPRODUTO').AsString  + ',' + qryAux.FieldByName('IDBENEFICIO').AsString + ',' +
                                                  qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',' + '''A''' + ', 0' + ')');
                   try
                      qryGrava.ExecSQL;
                   except
                      on E:EDBEngineError do
                         begin
                              MostrarErro(E);
                              Exit;
                         end;
                   end;

                   qryAux.Next;
              end;
     end;
 {Fim - Grava HSTCONTEVENTOSPR as contribuições que serão suspensas}


 {Grava HSTCONTEVENTOSPR as novas contribuições que serão associadas}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT C.IDBENEFICIO, BF.IDPRODUTO ' +
                 ' FROM CONTRIBPREVPARTP CP, CONTRIBUICAO C, BENEFPLANPREV BF, BENEFICIO B ' +
                 ' WHERE CP.IDPESSJUR   = ' + pIdPessJur   + ' AND ' +
                 '       CP.IDPLANOPREV = ' + pIdPlanoPrev + ' AND ' +
                 '       CP.IDPESSOA    = ' + pIdPessoa    + ' AND ' +
                 '       CP.SEQPROPOSTA = ' + pSeqProposta + ' AND ' +
                 '       CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND ' +
                 '       CP.IDPLANOPREV = BF.IDPLANOPREV AND ' +
                 '       C.IDBENEFICIO  = BF.IDBENEFICIO AND ' +
                 '       C.IDBENEFICIO  = B.IDBENEFICIO  AND ' +
                 '       B.IDEVENTOGERADOR = ' + pIdEventoGerador );
  qryAux.Open;
  if qryAux.IsEmpty then exit;

  sIdProduto   := qryAux.FieldByName('IDPRODUTO').AsString;
  sIdBeneficio := qryAux.FieldByName('IDBENEFICIO').AsString;

 {Filtra todas as novas contribuições que serão associadas}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDPRODUTO, IDBENEFICIO, IDCONTRIBUICAO FROM PRODCONTEVENTO ' +
                 ' WHERE IDPRODUTO       = ' + sIdProduto   + ' AND ' +
                 '       IDBENEFICIO     = ' + sIdBeneficio + ' AND ' +
                 '       IDEVENTOGERADOR = ' + pIdEventoGerador);
  qryAux.Open;
  while not qryAux.EOF do
     begin
          iIdAssociacao := iIdAssociacao + 1;
         {Grava todas as novas contribuiçoes que serão associadas, como associadas}
          qryGrava.Close;
          qryGrava.Sql.Clear;
          qryGrava.Sql.Add(' INSERT INTO HSTCONTEVENTOSPR(IDEVENTOSPREV, IDASSOCIACAO, IDEVENTOGERADORA, ' +
                           '             IDPRODUTOA, IDBENEFICIOA, IDCONTRIBUICAOA, ' +
                           '             TIPO, FLGASSOCIADA) ' +
                           ' VALUES( ' + pIdEventosPrev + ',' + IntToStr(iIdAssociacao) + ',' + pIdEventoGerador + ',' +
                                         qryAux.FieldByName('IDPRODUTO').AsString + ',' + qryAux.FieldByName('IDBENEFICIO').AsString + ',' +
                                         qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',' + '''A''' + ', 1' + ')');
          try
             qryGrava.ExecSQL;
          except
             on E:EDBEngineError do
                begin
                     MostrarErro(E);
                     Exit;
                end;
          end;

          qryAux.Next;
     end;
 {Fim - Grava HSTCONTEVENTOSPR as novas contribuições que serão associadas}
  Result := True;
end;

function AssociaNovasContribuicoes(pIdPessJur, pIdPlanoPrev, pIdPessoa, pSeqProposta, pIdEventoGerador, pDtEventoIni, pDtEventoFin,
                                   pMatricula, pIdSitPart, sSalarioPart : string; bRequerBenef, bPrepararContrib: boolean; qryAux, qryGrava: TwwQuery): boolean;
var
  sFlgCobra, sFlgRetroativo, sDataFinal, sIdTpPeriodicidade: string;
  sSql, sFlgInternoSitPart, sDescPreparo, sMsgErro: string;
  sSQLBuscaInf, sBrancosBuscaInf, sValorEncontrado, sCodPortForma, sFlgDescFolha: string;
  iIdLote : integer;
begin
  Result  := False;

  if Trim(strContribuicaoAAssociar) = '' then
     strContribuicaoAAssociar := '0';
      
 {Verifica se as Cont. associadas pelo evento devem ser para banco(Mantido) ou folha}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT FLGINTERNO FROM EVENTOGERADOR WHERE IDEVENTOGERADOR = '+pIdEventoGerador);
  qryAux.Open;
  if qryAux.FieldByName('FLGINTERNO').AsString = 'DM' //Demissão com Manutenção de Contribuição
  then sFlgDescFolha := '0'
  else sFlgDescFolha := '';
 {Fim - Verifica se as Cont. associadas pelo evento devem ser para banco(Mantido) ou folha}


 {Verifica se o Evento possui Contribuições associadas}
  qryAux.Close;
  qryAux.Sql.Clear;
  if sTipoPrevidencia = 'F' then
     qryAux.Sql.Add(' SELECT CP.IDCONTRIBUICAO, C.QTDEPARCELAS, C.IDTPPERIODICIDADE, TP.QTDEMESES, CT.FLGDESCFOLHA ' +
                    ' FROM  CONTPREVEVENTO CP, CONTRIBUICAO C, TPPERIODICIDADE TP, CONTPREV CT ' +
                    ' WHERE CP.IDPLANOPREV      = ' + pIdPlanoPrev     + ' AND ' +
                    '       CP.IDEVENTOGERADOR  = ' + pIdEventoGerador + ' AND ' +
                    '       CP.IDCONTRIBUICAO IN (' + strContribuicaoAAssociar + ') AND ' +
                    '       CP.IDCONTRIBUICAO   = C.IDCONTRIBUICAO AND ' +
                    '       CP.IDPLANOPREV      = CT.IDPLANOPREV    AND ' +
                    '       CP.IDCONTRIBUICAO   = CT.IDCONTRIBUICAO AND ' +
                    '       C.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+) ')
  else
     qryAux.Sql.Add(' SELECT PC.IDCONTRIBUICAO, C.QTDEPARCELAS, C.IDTPPERIODICIDADE, TP.QTDEMESES, CT.FLGDESCFOLHA ' +
                    ' FROM BENEFPLANPREV BF, PRODCONTEVENTO PC, CONTRIBUICAO C, TPPERIODICIDADE TP, CONTPREV CT ' +
                    ' WHERE BF.IDPLANOPREV     = ' + pIdPlanoPrev + ' AND ' +
                    '       BF.IDPRODUTO       = PC.IDPRODUTO AND ' +
                    '       BF.IDBENEFICIO     = PC.IDBENEFICIO AND ' +
                    '       PC.IDEVENTOGERADOR = ' + pIdEventoGerador + ' AND ' +
                    '       PC.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND ' +
                    '       BF.IDPLANOPREV    = CT.IDPLANOPREV    AND ' +
                    '       PC.IDCONTRIBUICAO = CT.IDCONTRIBUICAO AND ' +
                    '       C.IDTPPERIODICIDADE = TP.IDTPPERIODICIDADE(+) AND ' +
                    '       BF.IDBENEFICIO IN ' +
                    '      (SELECT IDBENEFICIO FROM BENEFICIO ' +
                    '       WHERE IDEVENTOGERADOR = ' + pIdEventoGerador + ')');
  qryAux.Open;
  qryAux.First;

  if bRequerBenef then {Se o evento permite requerer beneficio, Só passa a cobrar as novas contribuições na Concessão}
     begin
          sFlgCobra      := '0';
          sFlgRetroativo := '1';
     end
  else {Se o evento não permite requerer beneficio, passa a cobrar as novas contribuições imediatamente}
     begin
          sFlgCobra      := '1';
          sFlgRetroativo := '0';
     end;
 {Fim - Verifica se o Evento possui Contribuições associadas}


 // Data de Inicio da Contribuição
  if Trim(pDtEventoIni) = '' then
     pDtEventoIni := DateToStr(Date);

 {Associa novas Contribuicaoes}
  while not qryAux.EOF do
     begin
        //Data Final da Contribuição
          sDataFinal := CalcDataFinal(StrToDate(pDtEventoIni), qryAux.FieldByName('QTDEPARCELAS').AsString, qryAux.FieldByName('QTDEMESES').AsString);
          if Trim(sDataFinal) <> '' then
             try
                StrToDate(sDataFinal);
             except
                  if MsgDlg('Erro no Cálculo da Data Final da contribuição. A Data será gravada em Branco, Confirma ?','Informação', mtInformation, [mbNo, mbYes], 1) = mrYes then
                     sDataFinal := ''
                  else
                     exit; //Nao efetiva o evento.
             end;

          if qryAux.FieldByName('IDTPPERIODICIDADE').AsString <> '' then
             sIdTpPeriodicidade := qryAux.FieldByName('IDTPPERIODICIDADE').AsString
          else
             sIdTpPeriodicidade := 'NULL';

         {Verifica CODPORTFORMA}
          if sFlgDescFolha = ''
          then
             if (qryAux.FieldByName('FLGDESCFOLHA').AsString = '') then
                sFlgDescFolha := '1'
             else
                sFlgDescFolha := qryAux.FieldByName('FLGDESCFOLHA').AsString;

          if sFlgDescFolha = '1' then
             sCodPortForma := 'NULL'
          else
             if BuscaInfFinancContrib(sSQLBuscaInf, sBrancosBuscaInf, sValorEncontrado,
                                      'CODPORTFORMA','','N', StrToInt(pIdPessJur), StrToInt(pIdPlanoPrev),
                                      qryAux.FieldByName('IDCONTRIBUICAO').AsInteger,-1) then
                sCodPortForma := sValorEncontrado
             else
                begin
                     MsgDlg('Forma de Pagamento não Preenchida.','Error',mtError,[mbOk,mbHelp],0);
                     exit; //Nao efetiva o evento.
                end;
         {Fim - Verifica CODPORTFORMA}

         {Verifica se a contribuição já está associada ao participante}
          qryGrava.Close;
          qryGrava.Sql.Clear;
          qryGrava.Sql.Add(' SELECT IDCONTRIBUICAO FROM CONTRIBPREVPARTP ' +
                           ' WHERE SEQPROPOSTA    = ' + pSeqProposta + ' AND ' +
                           '       IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
                           '       IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
                           '       IDPESSOA       = ' + pIdPessoa    + ' AND ' +
                           '       IDCONTRIBUICAO = ' + qryAux.FieldByName('IDCONTRIBUICAO').AsString);
          qryGrava.Open;
         {Fim - Verifica se a contribuição já está associada ao participante}

          if qryGrava.IsEmpty then
             begin
                 {Associa a contribuição ao participante}
                  qryGrava.Close;
                  qryGrava.Sql.Clear;
                  qryGrava.Sql.Add(' INSERT INTO CONTRIBPREVPARTP(IDPESSJUR, IDPESSOA, IDPLANOPREV, IDCONTRIBUICAO, SEQPROPOSTA, ' +
                                   '                                 FLGRETROATIVO, FLGCOBRA, DATAINICIO, DATAFINAL, IDTPPERIODICIDADE, ' +
                                   '                                 FLGDESCFOLHA, CODPORTFORMA ) ' +
                                   ' VALUES( ' + pIdPessJur + ',' + pIdPessoa + ',' + pIdPlanoPrev + ',' +
                                             qryAux.FieldByName('IDCONTRIBUICAO').AsString + ',' + pSeqProposta + ',' +
                                             sFlgRetroativo + ',' + sFlgCobra + ', To_Date('''+pDtEventoIni+''',''DD/MM/YYYY'') ' + ',' +
                                             'To_Date(''' + sDataFinal + ''',''DD/MM/YYYY'') ' + ',' + sIdTpPeriodicidade + ',' +
                                             sFlgDescFolha + ',' + sCodPortForma + ')');
                  try
                     qryGrava.ExecSQL;
                  except
                     on E:EDBEngineError do
                        begin
                             MostrarErro(E);
                             Exit;
                        end;
                  end;
                 {Fim - Associa a contribuição ao participante}
             end
          else
             begin
                 {Altera a contribuição do participante}
                  qryGrava.Close;
                  qryGrava.Sql.Clear;
                  qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGRETROATIVO = ' + sFlgRetroativo + ',' +
                                   '                                FLGCOBRA   = ' + sFlgCobra + ',' +
                                   '                                DATAINICIO = To_Date(''' + pDtEventoIni + ''',''DD/MM/YYYY'')' + ',' +
                                   '                                DATAFINAL  = To_Date(''' + sDataFinal   + ''',''DD/MM/YYYY'')' + ',' +
                                   '                                FLGDESCFOLHA = ' + sFlgDescFolha + ',' +
                                   '                                CODPORTFORMA = ' + sCodPortForma +
                                   ' WHERE SEQPROPOSTA    = ' + pSeqProposta + ' AND ' +
                                   '       IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
                                   '       IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
                                   '       IDPESSOA       = ' + pIdPessoa    + ' AND ' +
                                   '       IDCONTRIBUICAO = ' + qryAux.FieldByName('IDCONTRIBUICAO').AsString);
                  try
                     qryGrava.ExecSQL;
                  except
                     on E:EDBEngineError do
                        begin
                             MostrarErro(E);
                             Exit;
                        end;
                  end;
                 {Fim - Altera a contribuicao do participante}
             end;

          qryAux.Next;
     end;
 {Fim - Associa novas Contribuicoes}


 {Se a Contribuição possui opções, chamar tela de Cadastro de Contribuições para informar o Valor base para a regra de Cálculo da Contribuição}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT CP.IDCONTRIBUICAO, PL.NOME AS PLANO, P1.NOME AS PARTICIPANTE, P2.NOME AS PATRO ' +
                 ' FROM CONTPREV CP, CONTRIBUICAO C, PLANPREV PL, PESSOA P1, PESSOA P2 ' +
                 ' WHERE CP.IDPLANOPREV = ' + pIdPlanoPrev + ' AND ' +
                 '       CP.IDCONTRIBUICAO IN (' + strContribuicaoAAssociar + ') AND ' +
                 '       CP.FLGACEITAOPCAO = 1 AND ' +
                 '       CP.IDCONTRIBUICAO = C.IDCONTRIBUICAO AND ' +
                 '       CP.IDPLANOPREV = PL.IDPLANOPREV AND ' +
                 '       P1.IDPESSOA = ' + pIdPessoa + ' AND ' +
                 '       P2.IDPESSOA = ' + pIdPessJur);
  qryAux.Open;
  if not qryAux.IsEmpty then
     begin
          //== frmCadContribParticipante := TfrmCadContribParticipante.Create(Application);
          //==frmCadContribParticipante.AssociaContrib(qryAux.FieldByName('PARTICIPANTE').AsString, qryAux.FieldByName('PATRO').AsString,
          //==                                         qryAux.FieldByName('PLANO').AsString, '',
          //==                                         StrToInt(pIdPessoa), StrToInt(pIdPessJur),
          //==                                         StrToInt(pIdPlanoPrev), StrToInt(pSeqProposta), False);
          //==frmCadContribParticipante.Free;
     end;
 {Se a Contribuição possui opções, chamar tela de Cadastro de Contribuições para informar o Valor base para a regra de Cálculo da Contribuição}

  if not bPrepararContrib then // Se não for para preparar as Contribuições (No caso do Evento Inscrição do Participante}
     begin
          Result := True;
          Exit;
     end;

 {Chama Função de Preparo de Contribuições}
  // ALTERADA POR CAMILLE EM 13.11.98
  sSQL := ' SELECT CPP.IDCONTRIBUICAO, CPP.SEQPROPOSTA, CPP.IDPESSOA, CPP.CODPORTFORMA, ' +
          '        CPP.FLGDESCFOLHA, CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
          '        CPP.DATAINICIO, CPP.DATAFINAL, CP.ORDEMCALCULO, PP.INSCRICAODATA, PF.DATANASC  ' +
          ' FROM   CONTPREV CP , PARTPREVPLAN PP, CONTRIBPREVPARTP CPP, PESSOAFISICA PF ' +
          ' WHERE  CPP.IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
          '        CPP.IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
          '        CPP.IDPESSOA       = ' + pIdPessoa    + ' AND ' +
          '        CPP.SEQPROPOSTA    = ' + pSeqProposta + ' AND ' +
          '        CPP.IDCONTRIBUICAO IN (' + strContribuicaoAAssociar + ') AND ' +
          '        CPP.FLGCOBRA      = 1 AND '+
          '        PP.IDPESSJUR      = CPP.IDPESSJUR AND   '+
          '        PP.IDPLANOPREV    = CPP.IDPLANOPREV AND '+
          '        PP.IDPESSOA       = CPP.IDPESSOA AND    '+
          '        PP.SEQPROPOSTA    = CPP.SEQPROPOSTA AND '+
          '        PF.IDPESSOA       = PP.IDPESSOA     AND '+
          '        CP.IDPLANOPREV    = CPP.IDPLANOPREV AND '+
          '        CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO  '+
          ' ORDER BY CP.ORDEMCALCULO ';

 {Verifica se a tabela nao esta vazia}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(sSQL);
  qryAux.Open;
  if qryAux.IsEmpty then
     begin
         Result := True;
         exit;
     end;
 {Fim - Verifica se a tabela nao esta vazia}

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT DESCRICAO, FLGINTERNO FROM SITPART ' +
                 ' WHERE IDSITPART = ' + pIdSitPart);
  qryAux.Open;
  sFlgInternoSitPart := qryAux.FieldByName('FLGINTERNO').AsString;
  sDescPreparo := 'Contribuição de ' + qryAux.FieldByName('DESCRICAO').AsString + ' - Matrícula: ' + pMatricula;

  if PreparaContribuicao(StrToInt(pIdPessJur), StrToInt(pIdPlanoPrev), prmIdMotivoContrib,
                         0, qryGrava, qryAux, sSQL, '', '', '', sFlgInternoSitPart, pDtEventoIni,
                         pDtEventoFin, sDescPreparo, 'R', False, False, sMsgErro, iIdLote, sSalarioPart) then
     begin
         MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
         exit;
     end;
 {Fim - Chama Função de Preparo de Contribuições}

  Result := True;
end;

function SuspendeContribuicoes(pIdPessJur, pIdPlanoPrev, pIdPessoa, pSeqProposta, pIdEventoGerador, pDtEventoIni, pDtEventoFin,
                               pMatricula, pIdSitPart: string; qryAux, qryGrava: TwwQuery): boolean;
var
  sAnoMesAtual, sAnoMesEvento, sSql, sFlgInternoSitPart, sDescPreparo, sMsgErro: string;
  sFlgDescFolhaUlt, sCodPortFormaUlt: string;
  sNomeEvento : string;
  iIdLote : integer;
begin
  Result := False;

 {Grava Data Final de todas as Contribuições Previdenciarias do Participante que serão suspensas}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET DATAFINAL = To_Date('''+pDtEventoIni+''',''DD/MM/YYYY'')' +
                 ' WHERE SEQPROPOSTA = ' + pSeqProposta + ' AND ' +
                 '       IDPESSJUR   = ' + pIdPessJur   + ' AND ' +
                 '       IDPLANOPREV = ' + pIdPlanoPrev + ' AND ' +
                 '       IDPESSOA    = ' + pIdPessoa    + ' AND ' +
                 '       FLGCOBRA    = 1 ');
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;
 {Fim - Grava Data Final de todas as Contribuições Previdenciarias do Participante que serão suspensas}

 {Verifica se e para preparar as contribuições que serao suspensas}
  sAnoMesAtual  := Copy(DateToStr(Date),7,4) + '/' + Copy(DateToStr(Date),4,2);
  sAnoMesEvento := Copy(Trim(pDtEventoIni),7,4) + '/' + Copy(Trim(pDtEventoIni),4,2);

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT FLGCOBRAULTIMA, FLGDESCFOLHAULT, CODPORTFORMAULT, NOME '+ //CAMILLE
                 ' FROM EVENTOGERADOR ' +
                 ' WHERE IDEVENTOGERADOR = ' + sIdEventoGerador);
  qryAux.Open;

  if not qryAux.IsEmpty then sNomeEvento := qryAux.FieldByName('nome').AsString;

  if (qryAux.FieldByName('FLGCOBRAULTIMA').AsString = '1') and
     (sAnoMesAtual = sAnoMesEvento) then
      begin
         {Chama Função de Preparo de Contribuições}
          sFlgDescFolhaUlt := qryAux.FieldByName('FLGDESCFOLHAULT').AsString;
          if Trim(sFlgDescFolhaUlt) = '' then sFlgDescFolhaUlt := '0';

          if qryAux.FieldByName('CODPORTFORMAULT').AsString <> '' then
             sCodPortFormaUlt := qryAux.FieldByName('CODPORTFORMAULT').AsString
          else
             sCodPortFormaUlt := '0';

          // ALTERADO POR CAMILLE EM 13.11.98
          sSQL := ' SELECT CPP.IDCONTRIBUICAO, CPP.SEQPROPOSTA, CPP.IDPESSOA, ' +
                  sCodPortFormaUlt + ' AS CODPORTFORMA, ' +
                  sFlgDescFolhaUlt + ' AS FLGDESCFOLHA, ' +
                  ' CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3, '+
                  ' CPP.DATAINICIO, CPP.DATAFINAL, CP.ORDEMCALCULO, PP.INSCRICAODATA, PF.DATANASC ' +
                  ' FROM CONTPREV CP, PARTPREVPLAN PP, CONTRIBPREVPARTP CPP, PESSOAFISICA PF  ' +
                  ' WHERE CPP.IDPESSJUR      = ' + pIdPessJur   + ' AND ' +
                  '       CPP.IDPLANOPREV    = ' + pIdPlanoPrev + ' AND ' +
                  '       CPP.IDPESSOA       = ' + pIdPessoa    + ' AND ' +
                  '       CPP.SEQPROPOSTA    = ' + pSeqProposta + ' AND ' +
                  '       CPP.FLGCOBRA       = 1 AND '+
                  '       PP.IDPESSJUR       = CPP.IDPESSJUR AND   '+
                  '       PP.IDPLANOPREV     = CPP.IDPLANOPREV AND '+
                  '       PP.IDPESSOA        = CPP.IDPESSOA AND    '+
                  '       PP.SEQPROPOSTA     = CPP.SEQPROPOSTA AND '+
                  '       PF.IDPESSOA        = PP.IDPESSOA     AND '+
                  '       CP.IDPLANOPREV     = CPP.IDPLANOPREV AND '+
                  '       CP.IDCONTRIBUICAO  = CPP.IDCONTRIBUICAO ';

         {Verifica se a tabela nao esta vazia}
          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add(sSQL);
          qryAux.Open;
          if qryAux.IsEmpty then
             begin
                  Result := True;
                  exit;
             end;
         {Fim - Verifica se a tabela nao esta vazia}


          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add(' SELECT DESCRICAO, FLGINTERNO FROM SITPART ' +
                         ' WHERE IDSITPART = ' + pIdSitPart);
          qryAux.Open;
          sFlgInternoSitPart := qryAux.FieldByName('FLGINTERNO').AsString;
          sDescPreparo := 'Última Contribuição antes do evento ' +
                          sNomeEvento + ' - Matrícula: ' + pMatricula; // camille

          if PreparaContribuicao(StrToInt(pIdPessJur), StrToInt(pIdPlanoPrev), prmIdMotivoContrib,
                                 0, qryGrava, qryAux, sSQL, '', '', '', sFlgInternoSitPart, DateToStr(Date),
                                 DateToStr(Date), sDescPreparo, 'N', False, False, sMsgErro, iIdLote,'' ) then
             MsgDlg(sMsgErro,'Erro',mtError,[mbOk,mbHelp],0);
         {Fim - Chama Função de Preparo de Contribuições}
      end;


 {Suspende a Cobrança de todas as Contribuições Previdenciarias do Participante}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA  = 0  ' +
                 ' WHERE SEQPROPOSTA = ' + pSeqProposta + ' AND ' +
                 '       IDPESSJUR   = ' + pIdPessJur   + ' AND ' +
                 '       IDPLANOPREV = ' + pIdPlanoPrev + ' AND ' +
                 '       IDPESSOA    = ' + pIdPessoa    + ' AND ' +
                 '       FLGCOBRA    = 1');
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;
 {Fim - Suspende a Cobrança de todas as Contribuições Previdenciarias do Participante}

  Result := True;
end;

function ParticipantePossuiBeneficiosParaEvento(pIdPessJur, pIdPlanoPrev, pIdPessoa, pIdEventoGerador: string; qryAux: TwwQuery): boolean;
begin
//  Result := False;

 {Verifica se o Participante possui beneficios para o evento solicitado}
 {Somente para o Aberto}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDBENEFICIO FROM BENEFPLANOPART ' +
                 ' WHERE IDPESSOA     = ' + pIdPessoa    + ' AND ' +
                 '       IDPESSJUR    = ' + pIdPessJur   + ' AND ' +
                 '       IDPLANOPREV  = ' + pIdPlanoPrev + ' AND ' +
                 '       IDBENEFICIO IN ' +
                 '      (SELECT IDBENEFICIO FROM BENEFICIO ' +
                 '       WHERE IDEVENTOGERADOR = ' + pIdEventoGerador + ')');
  qryAux.Open;

  if not qryAux.IsEmpty then // Se possui beneficios
     Result := True
  else
     begin
          Result := False;
          MsgDlg('Este Participante não possui benefícios para o evento solicitado.','Informação',mtInformation,[mbOk,mbHelp],0);
     end;
end;

function PlanosIndividuais(qryConsulta: TwwQuery; sIdPlanoPrev:string):Boolean;
begin
  qryConsulta.Close;
  qryConsulta.Sql.Clear;
  qryConsulta.Sql.Add('SELECT TPPLANOPREV FROM PLANPREV WHERE IDPLANOPREV = '''+sIdplanoPrev+'''');
  qryConsulta.Open;
  result := qryConsulta.FieldByName('TPPLANOPREV').AsString = 'I';
  qryConsulta.Close;
end;

end.
