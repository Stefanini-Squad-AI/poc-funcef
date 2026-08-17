// *************************************************************************************************
//                                   REGISTRO DE ALTERAÇÕES
// *************************************************************************************************
// Data        : 11/09/2006
// Responsável : Claudio Faria
// Alteração   : Corrigido importacao dos Valores do participante
// -------------------------------------------------------------------------------------------------
unit uImportaTotalPrev;

interface

uses uInterfaceAtuarial, uFuncGerais, FAnimacao, DBaseDados, uGlobal,
     dImportaTotalPrev, Dialogs, Messages, Forms, Controls, Classes, comctrls,
     SysUtils, USistema;

    procedure InsereTabelasAuxiliares(iEntid: Integer; bExibeMensagem: Boolean = True);
    procedure InsereTipoValor(iCD_TIPO: Integer; sDS_TIPO: String);
    procedure InsereTipoTempo(iCD_TIPO: Integer; sDS_TIPO, sDOMINIO: String);
    procedure InsereEstadoCivil(sCod, sDescr: String);
    procedure InsereCargo(iCod: Integer; sDescr: String);

    procedure ImportaParticipanteTotalPrev(sPatrocinadoras, sPlanos, sAnoMes, sSitFundacao,
                                           sSitPatrocinadora, sSitPlano: String;
                                           piApenasDepMenores, piMaiorIdade: Integer;
                                           bHistoricoSituacao: Boolean);
    procedure ImportaParticipanteTotalPrevSemEventos(sPatrocinadoras, sPlanos, sAnoMes, sSitFundacao,
                                                     sSitPatrocinadora, sSitPlano: String;
                                                     piApenasDepMenores, piMaiorIdade, piTipoSituacao: Integer;
                                                     bHistoricoSituacao: Boolean);

    procedure InsereParticipante(iVersao, iTitular, iPatroc, iPlano, iPlanoAnterior,
           iSit_Fundacao, iSit_Patrocinadora, iCargo, iOutraFundacao: Integer;
        sNome, sMatricula, sCPF, sEstado_Civil, sSexo, sRegional, sFundacaoOrigem,
           sPertencePatrocinadora, sDiretor, sTpParticipante, sVinculaPartic: String);
    procedure InsereDependente(iDependente, iParticipante, iDuracao, iSituacaoPlano, iGrauInstrucao: Integer;
                dNascimento: TDateTime;
                sNome, sMatricula, sSexo, sGrauDependencia: String);
    procedure InsereBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO, iCD_PESSOA_PATROC,
                 iCD_PLANO, iCD_TIPO_BENEF, iCD_DURACAO, iCD_SITUACAO_PLANO, iCD_GRAU_INSTRUCAO: Integer;
                sNO_BENEFICIARIO, sNR_MATRICULA, sIR_SEXO, sCD_GRAU_DEPENDENCIA, sAnoMes: String;
                dDT_NASCIMENTO: TDateTime);
    procedure InsereValorBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO,
                iCD_TIPO: Integer;
                fVL_BENEFICIARIO: Extended);
    procedure ImportaValoresFuncef(iPartic, iPlano: Integer);
    procedure ImportaTemposFuncef(iPartic, iPlano, iPlanoAnterior: Integer);
    procedure setValorBeneficio(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO: Integer; sAnoMes: String);
    
    function MontaCriterioAtivos ( sPatrocinadoras, sPlanos, sAnoMes : string ) : string;
    function MontaCriterioAssistidos ( sPatrocinadoras, sPlanos, sAnoMes : string ) : string;
    
    function GetOutraFundacao(iCD_PESSOA: Integer): Integer;
    //--
implementation

procedure ImportaParticipanteTotalPrev(sPatrocinadoras, sPlanos, sAnoMes, sSitFundacao,
                                       sSitPatrocinadora, sSitPlano: String;
                                       piApenasDepMenores, piMaiorIdade: Integer;
                                       bHistoricoSituacao: Boolean);
var
  iPartic, iDependente, iLinhaAtual, iSituacaoFundacao, iPlanoAnterior,
    iSituacaoPatrocinadora, iTBeneficio: Integer;
  sSQL, sNumRegra, sResultado, sFLGINTERNO, sTpParticipante: String;
  bErro: Boolean;
begin
  Try
   try
    Screen.Cursor := crHourGlass;
    bHouveErro := False;
    iLinhaAtual := 0;
    frmAnimacao := TfrmAnimacao.Create(Application);

    with dtmImportaTotalPrev do
     begin
       qryParticipante.Close;
       qryParticipante.ParamByName('DATAREF').asDateTime := WG_DT_REFER_BASE;
       qryParticipante.SQL[56] := '  AND EL.IDPESSJUR IN (' + sPatrocinadoras + ')';
       qryParticipante.SQL[57] := '  AND PP.IDPLANOPREV IN (' + sPlanos + ')';
       //Caso não selecionar nenhma Situação buscar Todas.
       if Trim(sSitFundacao) = '' then
         qryParticipante.SQL[58] := ' '
       else
       //---
         qryParticipante.SQL[58] := '  AND (EV.IDSITPARTNOVO IN (' + sSitFundacao + ') OR EV.IDSITPARTNOVO IS NULL)';

       
       if Trim(sSitPatrocinadora) = '' then
         QryParticipante.SQL[59] := ' '
       else
         QryParticipante.SQL[59] := '  AND EL.IDSITFUNC IN (' + sSitPatrocinadora + ')';

       if Trim(sSitPlano) = '' then
         QryParticipante.SQL[60] := ' '
       else
         QryParticipante.SQL[60] := '  AND PP.IDSITPLANOPREV IN (' + sSitPlano + ')';
       //---

       qryParticipante.Open;

       if QryParticipante.Eof then
        begin
          MessageDlg('Não foi encontrado nenhum Participante.', mtWarning, [mbOk], 0);
          bHouveErro := True;
          Exit;
        end;

       frmAnimacao.SetAnimacao('Importando Participantes da Base TotalPrev...',
           QryParticipante.RecordCount, True, True, aviCopyFiles);

       while not qryParticipante.Eof do
        begin
          inc(iLinhaAtual);
          frmAnimacao.SetProgressBar(iLinhaAtual);

          iPartic := qryParticipante.FieldByname('IDTITULAR').asInteger;

          if dtmBaseDados.dbBaseDados.inTransaction then
            dtmBaseDados.dbBaseDados.Commit;
          dtmBaseDados.dbBaseDados.StartTransaction;

          qryRegra.Close;
          qryRegra.ParamByName('ANOMES').asString := sAnoMes;
          qryRegra.ParamByName('DATA').asDateTime := WG_DT_REFER_BASE;
          qryRegra.ParamByName('IDPESSJUR').asInteger :=
              QryParticipante.FieldByname('PATROCINADORA').asInteger;
          qryRegra.ParamByName('IDPLANOPREV').asInteger :=
              QryParticipante.FieldByname('PLANO').asInteger;
          qryRegra.ParamByName('IDPESSOA').asInteger := iPartic;


{          sSQL := 'SELECT '+ IntToStr(iPartic) + ' AS IDPESSOA,  ' +
              QryParticipante.FieldByname('PATROCINADORA').asString + ' AS IDPESSJUR, ' +
              QryParticipante.FieldByname('PLANO').asString + ' AS IDPLANOPREV, ' +
              QryParticipante.FieldByname('SEQPROPOSTA').asString + ' AS SEQPROPOSTA, ''' +
              FormatDateTime('dd/mm/yyyy', WG_DT_REFER_BASE) + ''' AS DATAREF ' +
              'FROM  DUAL ';}

          QrySitParticipante.Close;
          QrySitParticipante.ParamByName('IDPESSJUR').asInteger :=
              QryParticipante.FieldByname('PATROCINADORA').asInteger;
          QrySitParticipante.ParamByName('IDPESSOA').asInteger := iPartic;
          QrySitParticipante.ParamByName('DATAREF').asDateTime := WG_DT_REFER_BASE;
          QrySitParticipante.Open;

{RCM - REFER 16/10/2002 - Importar Participantes mesmo sem Situação
          if QrySitParticipante.Eof then
           begin
             QryParticipante.Next;
             Continue;
           end;}

          sFLGINTERNO := QrySitParticipante.FieldByName('FLGINTERNO').asString;


          iSituacaoFundacao := QryParticipante.FieldByName('SITUACAOFUNDEVENTO').asInteger;

          if iSituacaoFundacao = 0 then
            iSituacaoFundacao := QryParticipante.FieldByName('SITUACAOFUNDACAO').asInteger;


          QryRegional.Close;
          QryRegional.ParamByName('IDESTAB').asInteger :=
              QryParticipante.FieldByName('IDESTAB').asInteger;
          QryRegional.Open;

          Application.ProcessMessages;
          if frmAnimacao.Cancel then
           begin
             if MessageDlg('Deseja cancelar a importação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                MessageDlg('Processamento cancelado por intervenção do usuário.',
                    mtWarning, [mbOk], 0);
                bHouveErro := True;
                Exit;
              end
             else
               frmAnimacao.Cancel := False;
           end;

          //Plano Anterior
          QryPlanoAnterior.Close;
          QryPlanoAnterior.ParamByName('PATROCINADORA').asInteger :=
              QryParticipante.FieldByName('PATROCINADORA').asInteger;
          QryPlanoAnterior.ParamByName('IDTITULAR').asInteger :=
              QryParticipante.FieldByName('IDTITULAR').asInteger;
          QryPlanoAnterior.Open;
          if QryPlanoAnterior.recordCount > 1 then
           begin
             QryPlanoAnterior.Next;
             iPlanoAnterior := QryPlanoAnterior.FieldByName('IDPLANOPREV').asInteger;
           end
          else
           begin
             iPlanoAnterior := 0;
             QryPlanoAnterior.Close;
           end;

          // -- Verifica se o PARTICIPANTE possui Beneficios
          QryBeneficios.Close;
          QryBeneficios.ParamByName('IDPESSOA').asInteger := iPartic;
          QryBeneficios.ParamByName('ANOMESREF').asString := sAnoMes;
          QryBeneficios.ParamByName('DATAREF').asDateTime := WG_DT_REFER_BASE;
          QryBeneficios.Open;

          if QryBeneficios.IsEmpty then
            sTpParticipante := 'A'
          else
            sTpParticipante := 'B';

            
          if bHistoricoSituacao then
            iSituacaoPatrocinadora := QrySitParticipante.FieldByName('SITUACAONAPATROCINADORA').asInteger
          else
            iSituacaoPatrocinadora := QryParticipante.FieldByname('SITUACAO_PATROCINADORA').asInteger;
          //---

          ////////////////////
          //  PARTICIPANTE  //
          ////////////////////
          InsereParticipante(WG_CD_VERSAO, iPartic,
              QryParticipante.FieldByname('PATROCINADORA').asInteger,
              QryParticipante.FieldByname('PLANO').asInteger,
              iPlanoAnterior, iSituacaoFundacao,
              iSituacaoPatrocinadora,
              QryParticipante.FieldByName('CD_CARGO').asInteger,
              GetOutraFundacao(iPartic),
              QryParticipante.FieldByName('NOME').asString,
              QryParticipante.FieldByName('MATRICULA').asString,
              QryParticipante.FieldByName('CPF').asString,
              QryParticipante.FieldByName('ESTADOCIVIL').asString,
              QryParticipante.FieldByName('SEXO').asString,
              QryRegional.FieldByName('REGIONAL').asString,
              QryParticipante.FieldByName('SITUACAOESPECIAL').asString,
              QryParticipante.FieldByName('PERTENCE_PATROCINADORA').asString,
              QryParticipante.FieldByName('IR_DIRETOR').asString, sTpParticipante,
              QryParticipante.FieldByName('CD_VINCULA_PARTIC').asString);
          QryRegional.Close;
          QryPlanoAnterior.Close;


          while not QryBeneficios.Eof do
           begin
             //Somente os Benefícios com data final maior que a referência.
             if ((QryBeneficios.FieldByname('SITUACAOBENEFICIO').asInteger <> 1) and
                 (QryBeneficios.FieldByname('DATAFINAL').asDateTime >= WG_DT_REFER_BASE)) or
                (QryBeneficios.FieldByname('SITUACAOBENEFICIO').asInteger = 1) then
               //Insere Benefício do PARTICIPANTE
               InsereBeneficiario(iPartic, iPartic, iPartic,
                 QryParticipante.FieldByname('PATROCINADORA').asInteger,
                 QryParticipante.FieldByname('PLANO').asInteger,
                 QryBeneficios.FieldByName('BENEFICIO').asInteger,
                 QryBeneficios.FieldByName('DURACAO').asInteger,
                 QryBeneficios.FieldByName('CD_SITUACAO_PLANO').asInteger,
                 QryParticipante.FieldByName('GRAUINSTRUCAO').asInteger,
                 QryParticipante.FieldByName('NOME').asString,
                 QryParticipante.FieldByName('MATRICULA').asString,
                 QryParticipante.FieldByName('SEXO').asString, 'PRP',
                 sAnoMes,
                 QryParticipante.FieldByName('DATANASCIMENTO').asDateTime);
                 
             QryBeneficios.Next;
           end;
          QryBeneficios.Close;


          ///////////////////
          //  DEPENDENTES  //
          ///////////////////
          QryDependente.Close;
          if piApenasDepMenores = 1
          then QryDependente.SQL[26] := ' AND ( ( (TO_DATE('''+DateToStr(WG_DT_REFER_BASE)+''',''DD/MM/YYYY'') - PF.DATANASC) / 365.5 < '+IntToStr(piMaiorIdade)+' ) OR (PF.INICIOINVALIDEZ IS NOT NULL) ) '
          else QryDependente.SQL[26] := ' ';
          QryDependente.ParamByName('IDPESSOA').asInteger := iPartic;
          QryDependente.Open;
          while not QryDependente.Eof do
           begin
             iDependente := QryDependente.FieldByName('IDDEPENDENTE').asInteger;

             // -- Verifica se o DEPENDENTE possui Beneficios
             QryBeneficios.Close;
             QryBeneficios.ParamByName('IDPESSOA').asInteger := iDependente;
             QryBeneficios.ParamByName('ANOMESREF').asString := sAnoMes;
             QryBeneficios.ParamByName('DATAREF').asDateTime := WG_DT_REFER_BASE;
             QryBeneficios.Open;

             if QryBeneficios.Eof then
              begin
                //DEPENDENTE sem Benefícios
                InsereDependente(iDependente, iPartic, 0, 0,
                  QryDependente.FieldByName('GRAUINSTRUCAO').asInteger,
                  QryDependente.FieldByName('DATANASCIMENTO_DEP').asDateTime,
                  QryDependente.FieldByName('NOME_DEP').asString,
                  QryDependente.FieldByName('MATRICULA_DEP').asString,
                  QryDependente.FieldByName('SEXO_DEP').asString,
                  QryDependente.FieldByName('GRAUDEPENDENCIA').asString);
              end //if
             else
               while not QryBeneficios.Eof do
                begin
                  if (((QryBeneficios.FieldByname('SITUACAOBENEFICIO').asInteger <> 1) and
                       ((QryBeneficios.FieldByname('DATAFINAL').asDateTime = 0) or
                        (QryBeneficios.FieldByname('DATAFINAL').asDateTime >= WG_DT_REFER_BASE))) or
                     (QryBeneficios.FieldByname('SITUACAOBENEFICIO').asInteger = 1)) then
                    //DEPENDENTE possui Benefícios
                    InsereBeneficiario(iPartic,
                      QryBeneficios.FieldByName('TITULAR').asInteger,
                      iDependente,
                      QryParticipante.FieldByname('PATROCINADORA').asInteger,
                      QryParticipante.FieldByname('PLANO').asInteger,
                      QryBeneficios.FieldByName('BENEFICIO').asInteger,
                      QryBeneficios.FieldByName('DURACAO').asInteger,
                      QryBeneficios.FieldByName('CD_SITUACAO_PLANO').asInteger,
                      QryDependente.FieldByName('GRAUINSTRUCAO').asInteger,
                      QryDependente.FieldByName('NOME_DEP').asString,
                      QryDependente.FieldByName('MATRICULA_DEP').asString,
                      QryDependente.FieldByName('SEXO_DEP').asString,
                      QryDependente.FieldByName('GRAUDEPENDENCIA').asString,
                      sAnoMes,
                      QryDependente.FieldByName('DATANASCIMENTO_DEP').asDateTime);
                      
                  QryBeneficios.Next;
                end; //while
             QryBeneficios.Close;

             QryDependente.Next;
           end; //while
          QryDependente.Close;

          Application.ProcessMessages;
          if frmAnimacao.Cancel then
           begin
             if MessageDlg('Deseja cancelar a importação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                MessageDlg('Processamento cancelado por intervenção do usuário.',
                    mtWarning, [mbOk], 0);
                bHouveErro := True;
                Exit;
              end
             else
               frmAnimacao.Cancel := False;
           end;


          ///////////////////////////////
          //  Valores do Participante  //
          ///////////////////////////////


          //ÚLTIMO SALÁRIO
          if ImportaValor(1) then
           begin
             if (sFLGINTERNO = 'MA') or (sFLGINTERNO = 'MS') then
              begin
                QryValorSalarioManut.Close;
                QryValorSalarioManut.ParamByName('IDPESSJUR').asInteger :=
                    QryParticipante.FieldByname('PATROCINADORA').asInteger;
                QryValorSalarioManut.ParamByName('IDPLANOPREV').asInteger :=
                    QryParticipante.FieldByname('PLANO').asInteger;
                QryValorSalarioManut.ParamByName('IDPESSOA').asInteger := iPartic;
                QryValorSalarioManut.ParamByName('ANOMES').asString := sAnoMes;
                QryValorSalarioManut.Open;
              end
             else if sFLGINTERNO = 'MP' then
              begin
                QryValorSalarioManutParc.Close;
                QryValorSalarioManutParc.ParamByName('IDPESSJUR').asInteger :=
                    QryParticipante.FieldByname('PATROCINADORA').asInteger;
                QryValorSalarioManutParc.ParamByName('IDPLANOPREV').asInteger :=
                    QryParticipante.FieldByname('PLANO').asInteger;
                QryValorSalarioManutParc.ParamByName('IDPESSOA').asInteger := iPartic;
                QryValorSalarioManutParc.ParamByName('ANOMES').asString := sAnoMes;
                QryValorSalarioManutParc.Open;
              end
             else
              begin
                QryValorSalario.Close;
                QryValorSalario.ParamByName('IDPESSJUR').asInteger :=
                    QryParticipante.FieldByname('PATROCINADORA').asInteger;
                QryValorSalario.ParamByName('IDPLANOPREV').asInteger :=
                    QryParticipante.FieldByname('PLANO').asInteger;
                QryValorSalario.ParamByName('IDPESSOA').asInteger := iPartic;
                QryValorSalario.ParamByName('ANOMES').asString := sAnoMes;
                QryValorSalario.Open;
              end;              

             if CalcularValor(1, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 1, StrToFloat(sResultado));
                if bErro then
                 begin
                   if (sFLGINTERNO = 'MA') or (sFLGINTERNO = 'MS') then
                     InsereValorParticipante(iPartic, 1,
                         QryValorSalarioManut.FieldByName('ULTIMOSALARIO').asFloat)
                   else if sFLGINTERNO = 'MP' then
                     InsereValorParticipante(iPartic, 1,
                         QryValorSalarioManutParc.FieldByName('ULTIMOSALARIO').asFloat)
                   else 
                     InsereValorParticipante(iPartic, 1,
                         QryValorSalario.FieldByName('ULTIMOSALARIO').asFloat);
                 end;
              end
             else
              begin
                if (sFLGINTERNO = 'MA') or (sFLGINTERNO = 'MS') then
                  InsereValorParticipante(iPartic, 1,
                      QryValorSalarioManut.FieldByName('ULTIMOSALARIO').asFloat)
                else if sFLGINTERNO = 'MP' then
                  InsereValorParticipante(iPartic, 1,
                      QryValorSalarioManutParc.FieldByName('ULTIMOSALARIO').asFloat)
                else
                  InsereValorParticipante(iPartic, 1,
                      QryValorSalario.FieldByName('ULTIMOSALARIO').asFloat);
              end;
           end;
          QryValorSalario.Close;
          QryValorSalarioManut.Close;
          QryValorSalarioManutParc.Close;

          if Not qryTipoBeneficio.Active Then qryTipoBeneficio.Open;

          While Not qryTipoBeneficio.EOF do
          Begin
             iTBeneficio := qryTipoBeneficio.FieldByName('CD_TIPO_VALOR').AsInteger;

             if ImportaValor(iTBeneficio) then
             begin
                //Campo calculado
                if CalcularValor(iTBeneficio, sNumRegra) then
                begin
                   sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                   InsereValorParticipante(iPartic, iTBeneficio, StrToFloat(sResultado));
                end;
             end;

             qryTipoBeneficio.Next;
          End;

          //INTERFACE ATUARIAL
          CalculaValores(QryParticipante.FieldByname('PLANO').asInteger, iPartic);

          if bHouveErro then
            Exit;

          qryRegra.Close;
          qryRegra.ParamByName('ANOMES').asString := sAnoMes;
          qryRegra.ParamByName('DATA').asDateTime := WG_DT_REFER_BASE;
          qryRegra.ParamByName('IDPESSJUR').asInteger :=
              QryParticipante.FieldByname('PATROCINADORA').asInteger;
          qryRegra.ParamByName('IDPLANOPREV').asInteger :=
              QryParticipante.FieldByname('PLANO').asInteger;
          qryRegra.ParamByName('IDPESSOA').asInteger := iPartic;

          Application.ProcessMessages;
          if frmAnimacao.Cancel then
           begin
             if MessageDlg('Deseja cancelar a importação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                MessageDlg('Processamento cancelado por intervenção do usuário.',
                    mtWarning, [mbOk], 0);
                bHouveErro := True;
                Exit;
              end
             else
               frmAnimacao.Cancel := False;
           end;

          ImportaValoresFuncef(iPartic, QryParticipante.FieldByname('PLANO').asInteger);

          // VERIFICA A EXISTÊNCIA DE NOVOS TIPOS DE VALOR PARA IMPORTAÇÃO
          QryVerifTipoValor.Close;
          QryVerifTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 24;
          QryVerifTipoValor.Open;
          while not QryVerifTipoValor.Eof do
           begin
             if ImportaValor(QryVerifTipoValor.FieldByName('CD_TIPO_VALOR').asInteger) then
              begin
                //Campo calculado
                if CalcularValor(QryVerifTipoValor.FieldByName('CD_TIPO_VALOR').asInteger, sNumRegra) then
                 begin
                   sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                   InsereValorParticipante(iPartic,
                       QryVerifTipoValor.FieldByName('CD_TIPO_VALOR').asInteger,
                       StrToFloat(sResultado));
                 end;
              end;

             QryVerifTipoValor.Next;
           end;
          QryVerifTipoValor.Close;

          if bHouveErro then
            Exit;

          Application.ProcessMessages;
          if frmAnimacao.Cancel then
           begin
             if MessageDlg('Deseja cancelar a importação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                MessageDlg('Processamento cancelado por intervenção do usuário.',
                    mtWarning, [mbOk], 0);
                bHouveErro := True;
                Exit;
              end
             else
               frmAnimacao.Cancel := False;
           end;


          //////////////////////////////
          //  Tempos do Participante  //
          //////////////////////////////

          //DATA DE INSCRIÇÃO NO PLANO
          if ImportaTempo(1) then
           begin
             if CalcularTempo(1, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 1, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 1,
                      QryParticipante.FieldByName('DATAINSCRICAO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 1,
                   QryParticipante.FieldByName('DATAINSCRICAO').asDateTime);
           end;

          //DATA DO NASCIMENTO
          if ImportaTempo(2) then
           begin
             if CalcularTempo(2, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 2, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 2,
                      QryParticipante.FieldByName('DATANASCIMENTO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 2,
                   QryParticipante.FieldByName('DATANASCIMENTO').asDateTime);
           end;

          //DATA DA ADMISSÃO
          if ImportaTempo(3) then
           begin
             if CalcularTempo(3, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 3, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 3,
                      QryParticipante.FieldByName('DATAADMISSAO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 3,
                   QryParticipante.FieldByName('DATAADMISSAO').asDateTime);
           end;


          //TEMPO DE SERVIÇO ANTERIOR
          if ImportaTempo(5) then
           begin
             if CalcularTempo(5, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                if Trim(sResultado) <> '' then
                  InsereTempoParticipante(iPartic, 5, StrToInt(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 5,
                      QryParticipante.FieldByName('TEMPOSERVICOANTERIOR').asInteger);
              end
             else
               InsereTempoParticipante(iPartic, 5,
                   QryParticipante.FieldByName('TEMPOSERVICOANTERIOR').asInteger);
           end;

          //TEMPO DE SERVIÇO
          if ImportaTempo(6) then
           begin
             if CalcularTempo(6, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 6, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 6,
                      QryParticipante.FieldByName('DATAADMISSAO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 6,
                   QryParticipante.FieldByName('DATAADMISSAO').asDateTime);
           end;

          //ÚLTIMO SALÁRIO DE PARTICIPAÇÃO
          if ImportaTempo(7) then
           begin
             QryUltimoSalario.Close;
             QryUltimoSalario.ParamByName('PATROC').asInteger :=
                 QryParticipante.FieldByname('PATROCINADORA').asInteger;
             QryUltimoSalario.ParamByName('PARTIC').asInteger := iPartic;
             QryUltimoSalario.ParamByName('ANOMES').asString := sAnoMes;
             QryUltimoSalario.Open;

             if not (QryUltimoSalario.isEmpty)
                and (Trim(QryUltimoSalario.FieldByName('DATA_ULTIMO_SALARIO').asString) <> '') then
              begin
                if CalcularTempo(7, sNumRegra) then
                 begin
                   sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                   InsereTempoParticipante(iPartic, 7, StrToDate(sResultado));
                   if bErro then
                     InsereTempoParticipante(iPartic, 7, StrToDate('01/' +
                         copy(QryUltimoSalario.FieldByName('DATA_ULTIMO_SALARIO').asString, 6, 2) + '/' +
                         copy(QryUltimoSalario.FieldByName('DATA_ULTIMO_SALARIO').asString, 1, 4)));
                 end
                else
                  InsereTempoParticipante(iPartic, 7, StrToDate('01/' +
                      copy(QryUltimoSalario.FieldByName('DATA_ULTIMO_SALARIO').asString, 6, 2) + '/' +
                      copy(QryUltimoSalario.FieldByName('DATA_ULTIMO_SALARIO').asString, 1, 4)));
              end;
             QryUltimoSalario.Close;
           end;


          QrySitParticipante.Close;
          QrySitParticipante.ParamByName('IDPESSJUR').asInteger :=
              QryParticipante.FieldByname('PATROCINADORA').asInteger;
          QrySitParticipante.ParamByName('IDPESSOA').asInteger := iPartic;
          QrySitParticipante.ParamByName('DATAREF').asDateTime := WG_DT_REFER_BASE;
          QrySitParticipante.Open;

          //DATA DA SITUAÇÃO NA FUNDAÇÃO
          if ImportaTempo(8) then
           begin
             if CalcularTempo(8, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 8, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 8,
                      QrySitParticipante.FieldByName('DATASITUACAO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 8,
                   QrySitParticipante.FieldByName('DATASITUACAO').asDateTime);
           end;

          //DATA DA SITUAÇÃO NA PATROCINADORA
          if ImportaTempo(9) then
           begin
             if CalcularTempo(9, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 9, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 9,
                      QrySitParticipante.FieldByName('DATASITUACAO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 9,
                   QrySitParticipante.FieldByName('DATASITUACAO').asDateTime);
           end;
          QrySitParticipante.Close;

          //DATA DE CANCELAMENTO NO PLANO
          if ImportaTempo(10) then
           begin
             QryCancelamento.Close;
             QryCancelamento.ParamByName('IDPESSJUR').asInteger :=
                 QryParticipante.FieldByname('PATROCINADORA').asInteger;
             QryCancelamento.ParamByName('IDPLANOPREV').asInteger :=
                 QryParticipante.FieldByname('PLANO').asInteger;
             QryCancelamento.ParamByName('IDPESSOA').asInteger := iPartic;
             QryCancelamento.ParamByName('DATAREF').asDateTime := WG_DT_REFER_BASE;
             QryCancelamento.Open;

             if CalcularTempo(10, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 10, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 10,
                      QryCancelamento.FieldByName('DATACANCELAMENTO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 10,
                   QryCancelamento.FieldByName('DATACANCELAMENTO').asDateTime);

             QryCancelamento.Close;
           end;

          //TEMPO NÃO CREDITADO
          if ImportaTempo(11) then
           begin
             if CalcularTempo(11, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                if Trim(sResultado) <> '' then
                  InsereTempoParticipante(iPartic, 11, StrToInt(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 11,
                      QryParticipante.FieldByName('TEMPONAOCREDITADO').asInteger);
              end
             else
               InsereTempoParticipante(iPartic, 11,
                   QryParticipante.FieldByName('TEMPONAOCREDITADO').asInteger);
           end;


          //DATA DO FALECIMENTO
          if ImportaTempo(12) then
           begin
             if CalcularTempo(12, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 12, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 12,
                      QryParticipante.FieldByName('DATAFALECIMENTO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 12,
                   QryParticipante.FieldByName('DATAFALECIMENTO').asDateTime);
           end;

          //DATA DE DEMISSÃO
          if ImportaTempo(13) then
           begin
             if CalcularTempo(13, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 13, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 13,
                      QryParticipante.FieldByName('DATADEMISSAO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 13,
                   QryParticipante.FieldByName('DATADEMISSAO').asDateTime);
           end;

          //Importa Novos tempos (FUNCEF)
          ImportaTemposFuncef(iPartic, QryParticipante.FieldByname('PLANO').asInteger, iPlanoAnterior);
          

          // VERIFICA A EXISTÊNCIA DE NOVOS TIPOS DE TEMPO PARA IMPORTAÇÃO
          QryVerifTipoTempo.Close;
          QryVerifTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 15;
          QryVerifTipoTempo.Open;
          while not QryVerifTipoTempo.Eof do
           begin
             if (ImportaTempo(QryVerifTipoTempo.FieldByName('CD_TIPO_TEMPO').asInteger))
                 and (CalcularTempo(QryVerifTipoTempo.FieldByName('CD_TIPO_TEMPO').asInteger, sNumRegra)) then
              begin
                //Campo calculado
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic,
                    QryVerifTipoTempo.FieldByName('CD_TIPO_TEMPO').asInteger,
                    StrToDate(sResultado));
              end;

             QryVerifTipoTempo.Next;
           end;
          QryVerifTipoTempo.Close;


          if frmAnimacao.Cancel then
           begin
             if MessageDlg('Deseja cancelar a importação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                MessageDlg('Processamento cancelado por intervenção do usuário.',
                    mtWarning, [mbOk], 0);
                bHouveErro := True;
                Exit;
              end
             else
               frmAnimacao.Cancel := False;   
           end;

          qryParticipante.Next;
          Application.ProcessMessages;

          if dtmBaseDados.dbBaseDados.inTransaction then
            dtmBaseDados.dbBaseDados.Commit;
        end; //while
     end; //with

   except on E: Exception do
    begin
      bHouveErro := True;
      MessageDlg('Houve erros durante a importação do TotalPrev:' + #13#10 + E.Message,
          mtError, [mbOk], 0);
      Exit;
    end;
   end; //try-except-end
  Finally
    Screen.Cursor := crDefault;
    frmAnimacao.Close;
    if frmAnimacao <> nil then
      frmAnimacao.Free;

    if bHouveErro then
     begin
       if dtmBaseDados.dbBaseDados.inTransaction then
         dtmBaseDados.dbBaseDados.RollBack;
     end
    else
     begin
       if dtmBaseDados.dbBaseDados.inTransaction then
         dtmBaseDados.dbBaseDados.Commit;
       MessageDlg('Importação concluída com sucesso.', mtInformation, [mbOk], 0);
     end;
  End;
end;

function MontaCriterioAtivos ( sPatrocinadoras, sPlanos, sAnoMes : string ) : string;
var sSQL : string;
begin
   sSQL := ' SELECT PP.IDPLANOPREV        AS PLANO,                                                                          '+
           '        EL.IDPESSJUR          AS PATROCINADORA,                                                                  '+
           '        EL.IDESTAB            AS IDESTAB,                                                                        '+
           '        PP.IDPESSOA           AS IDTITULAR,                                                                      '+
           '        DECODE(PP.DTINICIOINSC, NULL, DECODE(PP.INSCRICAODATA,NULL,SYSDATE,PP.INSCRICAODATA), PP.DTINICIOINSC) AS DATAINSCRICAO, '+
           '        EL.DATAADMISSAO       AS DATAADMISSAO,                                                                   '+
           '        EL.DATADEMISSAO       AS DATADEMISSAO,                                                                   '+
           '        PF.DATANASC           AS DATANASCIMENTO,                                                                 '+
           '        P.NOME                AS NOME,                                                                           '+
           '        P.NUMDOCUMENTO        AS CPF,                                                                            '+
           '        PF.SEXO               AS SEXO,                                                                           '+
           '        PF.ESTCIVIL           AS ESTADOCIVIL,                                                                    '+
           '        EL.MATRICULA          AS MATRICULA,                                                                      '+
           '        EL.TEMPOSERVANTERIOR  AS TEMPOSERVICOANTERIOR,                                                           '+
           '        EL.TEMPONAOCREDITADO  AS TEMPONAOCREDITADO,                                                              '+
           '        PF.DATAMORTE          AS DATAFALECIMENTO,                                                                '+
           '        PF.IDESTADO           AS NATURALIDADE,                                                                   '+
           '        PF.IDPAIS             AS NACIONALIDADE,                                                                  '+
           '        PF.NUMDEPIRRF         AS NUMDEPENIR,                                                                     '+
           '        PF.NUMDEPSALF         AS NUMDEPENSALARIOFAMILIA,                                                         '+
           '        PF.TIPOSANG           AS TIPOSANGUINEO,                                                                  '+
           '        PF.IDGRINSTR          AS GRAUINSTRUCAO,                                                                  '+
           '        P.FLGINVALIDO         AS INVALIDO,                                                                       '+
           '        EL.CODVINCULAFUNC     AS VINCULACAOFUNCIONAL,                                                            '+
           '        PP.FLGFITESPECIAL     AS SITUACAOESPECIAL,                                                               '+
           '        PP.SEQPROPOSTA        AS SEQPROPOSTA,                                                                    '+
           '        PP.IDSITPART          AS SITUACAOFUNDEVENTO,                                                             '+
           '        PP.IDSITPART          AS SITUACAOFUNDACAO,                                                               '+
           '        EL.FLGDIRETOR         AS IR_DIRETOR,                                                                     '+
           '        EL.IDCARGOEXT         AS CD_CARGO,                                                                       '+
           '        EL.IDPESSJURCEDIDO    AS PERTENCE_PATROCINADORA,                                                         '+
           '        EL.IDSITFUNC          AS SITUACAO_PATROCINADORA,                                                         '+ 
           '        EL.CODVINCULAFUNC     AS CD_VINCULA_PARTIC,                                                              '+ 
           '        SP.FLGINTERNO         AS FLGINTERNO,                                                                     '+
           '        EL.IDSITFUNC          AS SITUACAONAPATROCINADORA,                                                        '+
           '        PP.DATACANCELAMENTO   AS DATACANCELAMENTO,                                                               '+
           '        REGIONAL.NOME         AS REGIONAL                                                                        '+
           ' FROM PESSOA P, PESSOA REGIONAL, PESSOAFISICA PF, PATRO PT, ELEGPATRO EL,                                        '+
           '      PARTPREVPLAN PP, SITFUNC SF, SITPART SP,                                                                   '+
           '      ( SELECT IDPESSOA, MAX(INSCRICAODATA) AS INSCRICAODATA                                                     '+
           '        FROM   PARTPREVPLAN                                                                                      '+
           '        WHERE  TO_CHAR(INSCRICAODATA,''YYYY/MM'') <= '''+sAnoMes+'''                                             '+
           '        GROUP  BY IDPESSOA ) INSC                                                                                '+
           ' WHERE ((PP.DATACANCELAMENTO IS NULL) OR                                                                         '+
           '        (ROUND(MONTHS_BETWEEN (TO_DATE('''+DateToStr(WG_DT_REFER_BASE)+''',''DD/MM/YYYY''),                      '+
           '                               PP.DATACANCELAMENTO)) <= 36 ) )                                                   '+
           ' AND   TO_CHAR(PP.INSCRICAODATA,''YYYY/MM'') <= '''+sAnoMes+'''                                                  '+
           ' AND   SP.IDSITPART                          = PP.IDSITPART                                                      '+
           ' AND   EL.IDPESSJUR                          = PP.IDPESSJUR                                                      '+
           ' AND   EL.IDPESSOA                           = PP.IDPESSOA                                                       '+
           ' AND   SF.IDSITFUNC                          = EL.IDSITFUNC                                                      '+
           ' AND   P.IDPESSOA                            = EL.IDPESSOA                                                       '+
           ' AND   PF.IDPESSOA                           = EL.IDPESSOA                                                       '+
           ' AND   REGIONAL.IDPESSOA(+)                  = EL.IDESTAB                                                        '+
           ' AND   PT.IDPESSOA                           = EL.IDPESSJUR                                                      '+
           ' AND   INSC.IDPESSOA                         = PP.IDPESSOA                                                       '+
           ' AND   INSC.INSCRICAODATA                    = PP.INSCRICAODATA                                                  '+
           ' AND   EL.IDPESSJUR                          IN ('+sPatrocinadoras+')                                            '+
           ' AND   PP.IDPLANOPREV                        IN ('+sPlanos+')                                                    '+
           ' AND   NOT EXISTS                                                                                                '+
           '       ( SELECT 1 FROM HSTBENEFBFCIARIO BF                                                                       '+
           '         WHERE  BF.IDPESSJUR     = PP.IDPESSJUR                                                                  '+
           '         AND    BF.IDPLANOPREV   = PP.IDPLANOPREV                                                                '+
           '         AND    BF.IDTITULAR     = PP.IDPESSOA                                                                   '+
           '         AND    BF.SEQPROPOSTA   = PP.SEQPROPOSTA                                                                '+
           '         AND    BF.MES           = '''+sAnoMes+'''                                                               '+
           '         AND    BF.MESREFERENCIA = '''+sAnoMes+''' )                                                             '+
           ' ORDER BY EL.MATRICULA                                                                                           ';
   Result := sSQL;
end;


function MontaCriterioAssistidos ( sPatrocinadoras, sPlanos, sAnoMes : string ) : string;
var sSQL : string;
begin
   sSQL := ' SELECT PP.IDPLANOPREV        AS PLANO,                                                                          '+
           '        EL.IDPESSJUR          AS PATROCINADORA,                                                                  '+
           '        EL.IDESTAB            AS IDESTAB,                                                                        '+
           '        PP.IDPESSOA           AS IDTITULAR,                                                                      '+
           '        DECODE(PP.DTINICIOINSC, NULL, DECODE(PP.INSCRICAODATA,NULL,SYSDATE,PP.INSCRICAODATA), PP.DTINICIOINSC)   '+
           '                                                                                              AS DATAINSCRICAO,  '+
           '        EL.DATAADMISSAO       AS DATAADMISSAO,                                                                   '+
           '        EL.DATADEMISSAO       AS DATADEMISSAO,                                                                   '+
           '        PF.DATANASC           AS DATANASCIMENTO,                                                                 '+
           '        P.NOME                AS NOME,                                                                           '+
           '        P.NUMDOCUMENTO        AS CPF,                                                                            '+
           '        PF.SEXO               AS SEXO,                                                                           '+
           '        PF.ESTCIVIL           AS ESTADOCIVIL,                                                                    '+
           '        EL.MATRICULA          AS MATRICULA,                                                                      '+
           '        EL.TEMPOSERVANTERIOR  AS TEMPOSERVICOANTERIOR,                                                           '+
           '        EL.TEMPONAOCREDITADO  AS TEMPONAOCREDITADO,                                                              '+
           '        PF.DATAMORTE          AS DATAFALECIMENTO,                                                                '+
           '        PF.IDESTADO           AS NATURALIDADE,                                                                   '+
           '        PF.IDPAIS             AS NACIONALIDADE,                                                                  '+
           '        PF.NUMDEPIRRF         AS NUMDEPENIR,                                                                     '+
           '        PF.NUMDEPSALF         AS NUMDEPENSALARIOFAMILIA,                                                         '+
           '        PF.TIPOSANG           AS TIPOSANGUINEO,                                                                  '+
           '        PF.IDGRINSTR          AS GRAUINSTRUCAO,                                                                  '+
           '        P.FLGINVALIDO         AS INVALIDO,                                                                       '+
           '        EL.CODVINCULAFUNC     AS VINCULACAOFUNCIONAL,                                                            '+
           '        PP.FLGFITESPECIAL     AS SITUACAOESPECIAL,                                                               '+
           '        PP.SEQPROPOSTA        AS SEQPROPOSTA,                                                                    '+
           '        PP.IDSITPART          AS SITUACAOFUNDEVENTO,                                                             '+
           '        PP.IDSITPART          AS SITUACAOFUNDACAO,                                                               '+
           '        EL.FLGDIRETOR         AS IR_DIRETOR,                                                                     '+
           '        EL.IDCARGOEXT         AS CD_CARGO,                                                                       '+
           '        EL.IDPESSJURCEDIDO    AS PERTENCE_PATROCINADORA,                                                         '+
           '        SP.FLGINTERNO         AS FLGINTERNO,                                                                     '+
           '        EL.IDSITFUNC          AS SITUACAONAPATROCINADORA,                                                        '+
           '        EL.IDSITFUNC          AS SITUACAO_PATROCINADORA,                                                         '+ 
           '        EL.CODVINCULAFUNC     AS CD_VINCULA_PARTIC,                                                              '+ 
           '        PP.DATACANCELAMENTO   AS DATACANCELAMENTO,                                                               '+
           '        REGIONAL.NOME         AS REGIONAL,                                                                       '+
           '        BF.DATAINICIOBENEFICIO AS DATAINICIOBENEFICIO,                                                           '+
           '        BF.VALORDOBENEFICIO		 AS VALORDOBENEFICIO,                                                        '+
           '        BF.DURACAO            AS DURACAO,                                                                        '+
           '        BF.BENEFICIO		        AS BENEFICIO,                                                        '+
           '        BF.SITUACAOBENEFICIO	 AS SITUACAOBENEFICIO,                                                       '+
           '        BF.DATAFINAL          AS DATAFINAL,                                                                      '+
           '        BF.TITULAR            AS TITULAR                                                                         '+
           ' FROM PESSOA P, PESSOA REGIONAL, PESSOAFISICA PF, PATRO PT, ELEGPATRO EL,                                        '+
           '      PARTPREVPLAN PP, SITFUNC SF, SITPART SP,                                                                   '+
           '      (SELECT BF.IDPESSJUR, BF.IDPLANOPREV, BF.IDPESSOA, BF.SEQPROPOSTA,                                         '+
           '              BF.DATAINICIOFUND	       AS DATAINICIOBENEFICIO,                                               '+
           '              H.VALORINTEGRAL		        AS VALORDOBENEFICIO,                                         '+
           '              BF.IDTPPAGTOBENEFIC     	AS DURACAO,                                                          '+
           '              BF.IDBENEFICIO		         AS BENEFICIO,                                               '+
           '              BF.IDSITBENEFICIO	       AS SITUACAOBENEFICIO,                                                 '+
           '              BF.DATAFINAL             AS DATAFINAL,                                                             '+
           '              BF.IDPESSOA              AS TITULAR                                                                '+
           '       FROM   BENEFBFCIARIO BF, HSTBENEFBFCIARIO H, BENEFICIO B                                                  '+
           '       WHERE  H.MESREFERENCIA   = '''+sAnoMes+'''                                                                '+
           '       AND    H.MES             = '''+sAnoMes+'''                                                                '+
           '       AND    H.FLGDEVOLUCAO   = 0                                                                               '+
           '       AND    UPPER(B.NOME) NOT LIKE ''%ABONO%''                                                                 '+
           '       AND    UPPER(B.NOME) NOT LIKE ''%INSS%''                                                                  '+
           '       AND    BF.IDPESSOA      = BF.IDTITULAR                                                                    '+
           '       AND    H.NUMEROPROCESSO = BF.NUMEROPROCESSO                                                               '+
           '       AND    H.IDPESSJUR      = BF.IDPESSJUR                                                                    '+
           '       AND    H.IDPLANOPREV    = BF.IDPLANOPREV                                                                  '+
           '       AND    H.IDTITULAR      = BF.IDTITULAR                                                                    '+
           '       AND    H.IDPESSOA       = BF.IDPESSOA                                                                     '+
           '       AND    H.SEQPROPOSTA    = BF.SEQPROPOSTA                                                                  '+
           '       AND    H.IDBENEFICIO    = BF.IDBENEFICIO                                                                  '+
           '       AND    B.IDBENEFICIO    = BF.IDBENEFICIO ) BF                                                             '+
           ' WHERE SP.IDSITPART                          = PP.IDSITPART                                                      '+
           ' AND   EL.IDPESSJUR                          = PP.IDPESSJUR                                                      '+
           ' AND   EL.IDPESSOA                           = PP.IDPESSOA                                                       '+
           ' AND   SF.IDSITFUNC                          = EL.IDSITFUNC                                                      '+
           ' AND   P.IDPESSOA                            = EL.IDPESSOA                                                       '+
           ' AND   PF.IDPESSOA                           = EL.IDPESSOA                                                       '+
           ' AND   REGIONAL.IDPESSOA(+)                  = EL.IDESTAB                                                        '+
           ' AND   PT.IDPESSOA                           = EL.IDPESSJUR                                                      '+
           ' AND   EL.IDPESSJUR                          IN ('+sPatrocinadoras+')                                            '+
           ' AND   PP.IDPLANOPREV                        IN ('+sPlanos+')                                                    '+
           ' AND   BF.IDPESSJUR(+)                       = PP.IDPESSJUR                                                      '+
           ' AND   BF.IDPLANOPREV(+)                     = PP.IDPLANOPREV                                                    '+
           ' AND   BF.IDPESSOA(+)                        = PP.IDPESSOA                                                       '+
           ' AND   BF.SEQPROPOSTA(+)                     = PP.SEQPROPOSTA                                                    '+
           ' AND   EXISTS                                                                                                    '+
           '       ( SELECT 1 FROM HSTBENEFBFCIARIO BF                                                                       '+
           '         WHERE  BF.IDPESSJUR     = PP.IDPESSJUR                                                                  '+
           '         AND    BF.IDPLANOPREV   = PP.IDPLANOPREV                                                                '+
           '         AND    BF.IDTITULAR     = PP.IDPESSOA                                                                   '+
           '         AND    BF.SEQPROPOSTA   = PP.SEQPROPOSTA                                                                '+
           '         AND    BF.MES           = '''+sAnoMes+'''                                                               '+
           '         AND    BF.MESREFERENCIA = '''+sAnoMes+''' )                                                             '+
           ' ORDER BY EL.MATRICULA                                                                                           ';
   Result := sSQL;
end; // MontaCriterioAssitidos

procedure ImportaParticipanteTotalPrevSemEventos(sPatrocinadoras, sPlanos, sAnoMes, sSitFundacao,
                                                 sSitPatrocinadora, sSitPlano: String;
                                                 piApenasDepMenores, piMaiorIdade, piTipoSituacao: Integer;
                                                 bHistoricoSituacao: Boolean);
var
  iPartic, iDependente, iLinhaAtual, iSituacaoFundacao, iPlanoAnterior,
    iSituacaoPatrocinadora: Integer;
  sSQL, sNumRegra, sResultado, sFLGINTERNO, sTpParticipante: String;
  bErro: Boolean;
  sDataSituacao : string;
begin
  Try
   try
    Screen.Cursor := crHourGlass;
    bHouveErro := False;
    uFuncGerais.rTempo.Criatempo;
    iLinhaAtual := 0;
    frmAnimacao := TfrmAnimacao.Create(Application);

    with dtmImportaTotalPrev do
    begin
        qryParticipante.Close;
        qryParticipante.SQL.Clear;
        if piTipoSituacao = 0 // ativos
        then sSQL := MontaCriterioAtivos ( sPatrocinadoras, sPlanos, sAnoMes)
        else sSQL := MontaCriterioAssistidos ( sPatrocinadoras, sPlanos, sAnoMes );


        qryParticipante.SQL.Add(sSQL);
        qryParticipante.Open;

        if QryParticipante.Eof
        then begin
           MessageDlg('Não foi encontrado nenhum Participante.', mtWarning, [mbOk], 0);
           bHouveErro := True;
           Exit;
        end;

        frmAnimacao.SetAnimacao('Importando Participantes da Base TotalPrev...', QryParticipante.RecordCount, True, True, aviCopyFiles);

        while not qryParticipante.Eof do
        begin
          inc(iLinhaAtual);
          frmAnimacao.SetProgressBar(iLinhaAtual);

          iPartic := qryParticipante.FieldByname('IDTITULAR').asInteger;

          if dtmBaseDados.dbBaseDados.inTransaction then dtmBaseDados.dbBaseDados.Commit;

          dtmBaseDados.dbBaseDados.StartTransaction;

          qryRegra.Close;
          qryRegra.ParamByName('ANOMES').asString       := sAnoMes;
          qryRegra.ParamByName('DATA').asDateTime       := WG_DT_REFER_BASE;
          qryRegra.ParamByName('IDPESSJUR').asInteger   := QryParticipante.FieldByname('PATROCINADORA').asInteger;
          qryRegra.ParamByName('IDPLANOPREV').asInteger := QryParticipante.FieldByname('PLANO').asInteger;
          qryRegra.ParamByName('IDPESSOA').asInteger    := iPartic;


{          QrySitParticipante.Close;
          QrySitParticipante.ParamByName('IDPESSJUR').asInteger :=
              QryParticipante.FieldByname('PATROCINADORA').asInteger;
          QrySitParticipante.ParamByName('IDPESSOA').asInteger := iPartic;
          QrySitParticipante.ParamByName('DATAREF').asDateTime := WG_DT_REFER_BASE;
          QrySitParticipante.Open;
}

          sFLGINTERNO       := qryParticipante.FieldByName('FLGINTERNO').asString;
          iSituacaoFundacao := qryParticipante.FieldByName('SITUACAOFUNDEVENTO').asInteger;
          iSituacaoFundacao := qryParticipante.FieldByName('SITUACAOFUNDACAO').asInteger;


{          QryRegional.Close;
          QryRegional.ParamByName('IDESTAB').asInteger := qryParticipante.FieldByName('IDESTAB').asInteger;
          QryRegional.Open;
}
          Application.ProcessMessages;
          if frmAnimacao.Cancel then
           begin
             if MessageDlg('Deseja cancelar a importação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                MessageDlg('Processamento cancelado por intervenção do usuário.',
                    mtWarning, [mbOk], 0);
                bHouveErro := True;
                Exit;
              end
             else
               frmAnimacao.Cancel := False;
           end;

          //Plano Anterior
          QryPlanoAnterior.Close;
          QryPlanoAnterior.ParamByName('PATROCINADORA').asInteger :=  qryParticipante.FieldByName('PATROCINADORA').asInteger;
          QryPlanoAnterior.ParamByName('IDTITULAR').asInteger     :=  qryParticipante.FieldByName('IDTITULAR').asInteger;
          QryPlanoAnterior.Open;
          if QryPlanoAnterior.recordCount > 1
          then begin
             QryPlanoAnterior.Next;
             iPlanoAnterior := QryPlanoAnterior.FieldByName('IDPLANOPREV').asInteger;
          end
          else begin
             iPlanoAnterior := 0;
             QryPlanoAnterior.Close;
          end;

          if piTipoSituacao = 0 // ativos
          then sTpParticipante := 'A'
          else begin
             // -- Verifica se o PARTICIPANTE possui Beneficios
             if qryParticipante.FieldByName('DATAINICIOBENEFICIO').asString = ''
             then sTpParticipante := 'A'
             else sTpParticipante := 'B';
          end;

          if piTipoSituacao = 0 // ativos
          then sDataSituacao := qryParticipante.FieldByName('DATAINSCRICAO').asString
          else if not (qryParticipante.FieldByName('DATAINICIOBENEFICIO').asString = '')
               then sDataSituacao := qryParticipante.FieldByName('DATAINICIOBENEFICIO').asString
               else sDataSituacao := qryParticipante.FieldByName('DATAINSCRICAO').asString;


          QryParticipante.SQL.SaveToFile('c:\participa.sql');

          if bHistoricoSituacao then
            iSituacaoPatrocinadora := QrySitParticipante.FieldByName('SITUACAONAPATROCINADORA').asInteger
          else
            iSituacaoPatrocinadora := QryParticipante.FieldByname('SITUACAO_PATROCINADORA').asInteger;
          //---

          ////////////////////
          //  PARTICIPANTE  //
          ////////////////////
          InsereParticipante(WG_CD_VERSAO, iPartic,
              qryParticipante.FieldByname('PATROCINADORA').asInteger,
              qryParticipante.FieldByname('PLANO').asInteger,
              iPlanoAnterior, iSituacaoFundacao,
              qryParticipante.FieldByName('SITUACAONAPATROCINADORA').asInteger,
              qryParticipante.FieldByName('CD_CARGO').asInteger,
              iPartic,
              qryParticipante.FieldByName('NOME').asString,
              qryParticipante.FieldByName('MATRICULA').asString,
              qryParticipante.FieldByName('CPF').asString,
              qryParticipante.FieldByName('ESTADOCIVIL').asString,
              qryParticipante.FieldByName('SEXO').asString,
              qryParticipante.FieldByName('REGIONAL').asString,
              qryParticipante.FieldByName('SITUACAOESPECIAL').asString,
              qryParticipante.FieldByName('PERTENCE_PATROCINADORA').asString,
              qryParticipante.FieldByName('IR_DIRETOR').asString, sTpParticipante,
              QryParticipante.FieldByName('CD_VINCULA_PARTIC').asString);
          QryRegional.Close;
          QryPlanoAnterior.Close;


          if piTipoSituacao = 1 // assistidos
          then begin
            if ((qryParticipante.FieldByname('SITUACAOBENEFICIO').asInteger <> 1) and
                (qryParticipante.FieldByname('DATAFINAL').asDateTime >= WG_DT_REFER_BASE)) or
               (qryParticipante.FieldByname('SITUACAOBENEFICIO').asInteger = 1) then
                //Insere Benefício do PARTICIPANTE
              InsereBeneficiario(iPartic, iPartic, iPartic,
                QryParticipante.FieldByName('PATROCINADORA').asInteger,
                QryParticipante.FieldByName('PLANO').asInteger,
                QryParticipante.FieldByName('BENEFICIO').asInteger,
                QryParticipante.FieldByName('DURACAO').asInteger, 0,
                QryParticipante.FieldByName('GRAUINSTRUCAO').asInteger,
                QryParticipante.FieldByName('NOME').asString,
                QryParticipante.FieldByName('MATRICULA').asString,
                QryParticipante.FieldByName('SEXO').asString, 'PRP',
                sAnoMes,
                QryParticipante.FieldByName('DATANASCIMENTO').asDateTime);
          end;


          ///////////////////
          //  DEPENDENTES  //
          ///////////////////
          QryDependente.Close;
          if piApenasDepMenores = 1
          then QryDependente.SQL[26] := ' AND ( ( (TO_DATE('''+DateToStr(WG_DT_REFER_BASE)+''',''DD/MM/YYYY'') - PF.DATANASC) / 365.5 < '+IntToStr(piMaiorIdade)+' ) OR (PF.INICIOINVALIDEZ IS NOT NULL) ) '
          else QryDependente.SQL[26] := ' ';
          QryDependente.ParamByName('IDPESSOA').asInteger := iPartic;
          QryDependente.Open;
          while not QryDependente.Eof do
          begin
             iDependente := QryDependente.FieldByName('IDDEPENDENTE').asInteger;

             // -- Verifica se o DEPENDENTE possui Beneficios
             QryBeneficios.Close;
             QryBeneficios.ParamByName('IDPESSOA').asInteger := iDependente;
             QryBeneficios.ParamByName('ANOMESREF').asString := sAnoMes;
             QryBeneficios.ParamByName('DATAREF').asDateTime := WG_DT_REFER_BASE;
             QryBeneficios.Open;

             if QryBeneficios.Eof
             then begin
                //DEPENDENTE sem Benefícios
                InsereDependente(iDependente, iPartic, 0, 0,
                  QryDependente.FieldByName('GRAUINSTRUCAO').asInteger,
                  QryDependente.FieldByName('DATANASCIMENTO_DEP').asDateTime,
                  QryDependente.FieldByName('NOME_DEP').asString,
                  QryDependente.FieldByName('MATRICULA_DEP').asString,
                  QryDependente.FieldByName('SEXO_DEP').asString,
                  QryDependente.FieldByName('GRAUDEPENDENCIA').asString);
             end //if
             else begin
                while not QryBeneficios.Eof do
                begin
                  if (((QryBeneficios.FieldByname('SITUACAOBENEFICIO').asInteger <> 1) and
                       ((QryBeneficios.FieldByname('DATAFINAL').asDateTime = 0) or
                        (QryBeneficios.FieldByname('DATAFINAL').asDateTime >= WG_DT_REFER_BASE))) or
                     (QryBeneficios.FieldByname('SITUACAOBENEFICIO').asInteger = 1)) then
                    //DEPENDENTE possui Benefícios
                    InsereBeneficiario(iPartic,
                      QryBeneficios.FieldByName('TITULAR').asInteger,
                      iDependente,
                      qryParticipante.FieldByname('PATROCINADORA').asInteger,
                      qryParticipante.FieldByname('PLANO').asInteger,
                      QryBeneficios.FieldByName('BENEFICIO').asInteger,
                      QryBeneficios.FieldByName('DURACAO').asInteger,
                      QryBeneficios.FieldByName('CD_SITUACAO_PLANO').asInteger,
                      QryDependente.FieldByName('GRAUINSTRUCAO').asInteger,
                      QryDependente.FieldByName('NOME_DEP').asString,
                      QryDependente.FieldByName('MATRICULA_DEP').asString,
                      QryDependente.FieldByname('SEXO_DEP').asString,
                      QryDependente.FieldByName('GRAUDEPENDENCIA').asString,
                      sAnoMes,
                      QryDependente.FieldByName('DATANASCIMENTO_DEP').asDateTime);
                      
                  QryBeneficios.Next;
                end; //while
             end;

             QryBeneficios.Close;

             QryDependente.Next;
          end; //while
          QryDependente.Close;

          Application.ProcessMessages;
          if frmAnimacao.Cancel
          then begin
             if MessageDlg('Deseja cancelar a importação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
             then begin
                MessageDlg('Processamento cancelado por intervenção do usuário.', mtWarning, [mbOk], 0);
                bHouveErro := True;
                Exit;
             end
             else frmAnimacao.Cancel := False;
          end;


          ///////////////////////////////
          //  Valores do Participante  //
          ///////////////////////////////

          //ÚLTIMO SALÁRIO
          if ImportaValor(1)
          then begin
             if (sFLGINTERNO = 'MA') or (sFLGINTERNO = 'MS') then
              begin
                QryValorSalarioManut.Close;
                QryValorSalarioManut.ParamByName('IDPESSJUR').asInteger :=
                    qryParticipante.FieldByname('PATROCINADORA').asInteger;
                QryValorSalarioManut.ParamByName('IDPLANOPREV').asInteger :=
                    qryParticipante.FieldByname('PLANO').asInteger;
                QryValorSalarioManut.ParamByName('IDPESSOA').asInteger := iPartic;
                QryValorSalarioManut.ParamByName('ANOMES').asString := sAnoMes;
                QryValorSalarioManut.Open;
              end
             else if sFLGINTERNO = 'MP' then
              begin
                QryValorSalarioManutParc.Close;
                QryValorSalarioManutParc.ParamByName('IDPESSJUR').asInteger :=
                    qryParticipante.FieldByname('PATROCINADORA').asInteger;
                QryValorSalarioManutParc.ParamByName('IDPLANOPREV').asInteger :=
                    qryParticipante.FieldByname('PLANO').asInteger;
                QryValorSalarioManutParc.ParamByName('IDPESSOA').asInteger := iPartic;
                QryValorSalarioManutParc.ParamByName('ANOMES').asString := sAnoMes;
                QryValorSalarioManutParc.Open;
              end
             else
              begin
                QryValorSalario.Close;
                QryValorSalario.ParamByName('IDPESSJUR').asInteger :=
                    qryParticipante.FieldByname('PATROCINADORA').asInteger;
                QryValorSalario.ParamByName('IDPLANOPREV').asInteger :=
                    qryParticipante.FieldByname('PLANO').asInteger;
                QryValorSalario.ParamByName('IDPESSOA').asInteger := iPartic;
                QryValorSalario.ParamByName('ANOMES').asString := sAnoMes;
                QryValorSalario.Open;
              end;

             if CalcularValor(1, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 1, StrToFloat(sResultado));
                if bErro then
                 begin
                   if (sFLGINTERNO = 'MA') or (sFLGINTERNO = 'MS') then
                     InsereValorParticipante(iPartic, 1,
                         QryValorSalarioManut.FieldByName('ULTIMOSALARIO').asFloat)
                   else if sFLGINTERNO = 'MP' then
                     InsereValorParticipante(iPartic, 1,
                         QryValorSalarioManutParc.FieldByName('ULTIMOSALARIO').asFloat)
                   else
                     InsereValorParticipante(iPartic, 1,
                         QryValorSalario.FieldByName('ULTIMOSALARIO').asFloat);
                 end;
              end
             else
              begin
                if (sFLGINTERNO = 'MA') or (sFLGINTERNO = 'MS') then
                  InsereValorParticipante(iPartic, 1,
                      QryValorSalarioManut.FieldByName('ULTIMOSALARIO').asFloat)
                else if sFLGINTERNO = 'MP' then
                  InsereValorParticipante(iPartic, 1,
                      QryValorSalarioManutParc.FieldByName('ULTIMOSALARIO').asFloat)
                else
                  InsereValorParticipante(iPartic, 1,
                      QryValorSalario.FieldByName('ULTIMOSALARIO').asFloat);
              end;
           end;
          QryValorSalario.Close;
          QryValorSalarioManut.Close;
          QryValorSalarioManutParc.Close;

          //Valor do Beneficio
          InsereValorParticipante(iPartic, 2, qryParticipante.FieldByname('VALORDOBENEFICIO').asInteger);  

          //PERCENTUAL DE CONTRIBUIÇÃO
          if ImportaValor(3) then
           begin
             //Campo calculado
             if CalcularValor(3, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 3, StrToFloat(sResultado));
              end;
           end;


          //INTERFACE ATUARIAL
          CalculaValores(qryParticipante.FieldByname('PLANO').asInteger, iPartic);

          if bHouveErro then
            Exit;

          qryRegra.Close;
          qryRegra.ParamByName('ANOMES').asString := sAnoMes;
          qryRegra.ParamByName('DATA').asDateTime := WG_DT_REFER_BASE;
          qryRegra.ParamByName('IDPESSJUR').asInteger :=
              qryParticipante.FieldByname('PATROCINADORA').asInteger;
          qryRegra.ParamByName('IDPLANOPREV').asInteger :=
              qryParticipante.FieldByname('PLANO').asInteger;
          qryRegra.ParamByName('IDPESSOA').asInteger := iPartic;

          Application.ProcessMessages;
          if frmAnimacao.Cancel then
           begin
             if MessageDlg('Deseja cancelar a importação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                MessageDlg('Processamento cancelado por intervenção do usuário.',
                    mtWarning, [mbOk], 0);
                bHouveErro := True;
                Exit;
              end
             else
               frmAnimacao.Cancel := False;
           end;

          
          
          //VALOR DE CONTRIBUIÇÃO - ABONO
          if ImportaValor(11) then
           begin
             //Campo calculado
             if CalcularValor(11, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 11, StrToFloat(sResultado));
              end;
           end;

          
          
          //VALOR DO BENEFÍCIO - INSS
          if ImportaValor(12) then
           begin
             //Campo calculado
             if CalcularValor(12, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 12, StrToFloat(sResultado));
              end;
           end;

          //VALOR DE CONTRIBUIÇÃO SUPLEMENTAR
          if ImportaValor(13) then
           begin
             //Campo calculado
             if CalcularValor(13, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 13, StrToFloat(sResultado));
              end;
           end;

          //TAXA DE JÓIA
          if ImportaValor(14) then
           begin
             //Campo calculado
             if CalcularValor(14, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 14, StrToFloat(sResultado));
              end;
           end;

          
           
          //SALDO DA CONTA PARTICIPANTE
          if ImportaValor(15) then
           begin
             //Campo calculado
             if CalcularValor(15, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 15, StrToFloat(sResultado));
              end;
           end;

          //VALOR DE CONTRIBUIÇÃO ASSISTIDO
          if ImportaValor(16) then
           begin
             //Campo calculado
             if CalcularValor(16, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 16, StrToFloat(sResultado));
              end;
           end;

          //TAXA DE CONTRIBUIÇÃO BÁSICA
          if ImportaValor(17) then
           begin
             //Campo calculado
             if CalcularValor(17, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 17, StrToFloat(sResultado));
              end;
           end;

          //TAXA DE CONTRIBUIÇÃO NORMAL
          if ImportaValor(18) then
           begin
             //Campo calculado
             if CalcularValor(18, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 18, StrToFloat(sResultado));
              end;
           end;

          //TAXA DE CONTRIBUIÇÃO VOLUNTÁRIA
          if ImportaValor(19) then
           begin
             //Campo calculado
             if CalcularValor(19, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 19, StrToFloat(sResultado));
              end;
           end;

          //QUANTIDADE DE COTAS DO BENEFÍCIO
          if ImportaValor(20) then
           begin
             //Campo calculado
             if CalcularValor(20, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 20, StrToFloat(sResultado));
              end;
           end;

          //PERCENTUAL DE RESGATE DA APOSENTADORIA
          if ImportaValor(21) then
           begin
             //Campo calculado
             if CalcularValor(21, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                InsereValorParticipante(iPartic, 21, StrToFloat(sResultado));
              end;
           end;

          if Pos('FUNCEF', Sistema.NomeEmpresa) > 0
          then ImportaValoresFuncef(iPartic, qryParticipante.FieldByname('PLANO').asInteger);


          // VERIFICA A EXISTÊNCIA DE NOVOS TIPOS DE VALOR PARA IMPORTAÇÃO
          QryVerifTipoValor.Close;
          QryVerifTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := 24;
          QryVerifTipoValor.Open;
          while not QryVerifTipoValor.Eof do
           begin
             if ImportaValor(QryVerifTipoValor.FieldByName('CD_TIPO_VALOR').asInteger) then
              begin
                //Campo calculado
                if CalcularValor(QryVerifTipoValor.FieldByName('CD_TIPO_VALOR').asInteger, sNumRegra) then
                 begin
                   sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                   InsereValorParticipante(iPartic,
                       QryVerifTipoValor.FieldByName('CD_TIPO_VALOR').asInteger,
                       StrToFloat(sResultado));
                 end;
              end;

             QryVerifTipoValor.Next;
           end;
          QryVerifTipoValor.Close;

          if bHouveErro then
            Exit;

          Application.ProcessMessages;
          if frmAnimacao.Cancel then
           begin
             if MessageDlg('Deseja cancelar a importação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                MessageDlg('Processamento cancelado por intervenção do usuário.',
                    mtWarning, [mbOk], 0);
                bHouveErro := True;
                Exit;
              end
             else
               frmAnimacao.Cancel := False;
           end;


          //////////////////////////////
          //  Tempos do Participante  //
          //////////////////////////////

          //DATA DE INSCRIÇÃO NO PLANO
          if ImportaTempo(1) then
           begin
             if CalcularTempo(1, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 1, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 1,
                      qryParticipante.FieldByName('DATAINSCRICAO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 1,
                   qryParticipante.FieldByName('DATAINSCRICAO').asDateTime);
           end;

          //DATA DO NASCIMENTO
          if ImportaTempo(2) then
           begin
             if CalcularTempo(2, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 2, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 2,
                      qryParticipante.FieldByName('DATANASCIMENTO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 2,
                   qryParticipante.FieldByName('DATANASCIMENTO').asDateTime);
           end;

          //DATA DA ADMISSÃO
          if ImportaTempo(3) then
           begin
             if CalcularTempo(3, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 3, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 3,
                      qryParticipante.FieldByName('DATAADMISSAO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 3,
                   qryParticipante.FieldByName('DATAADMISSAO').asDateTime);
           end;


          //TEMPO DE SERVIÇO ANTERIOR
          if ImportaTempo(5) then
           begin
             if CalcularTempo(5, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                if Trim(sResultado) <> '' then
                  InsereTempoParticipante(iPartic, 5, StrToInt(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 5,
                      qryParticipante.FieldByName('TEMPOSERVICOANTERIOR').asInteger);
              end
             else
               InsereTempoParticipante(iPartic, 5,
                   qryParticipante.FieldByName('TEMPOSERVICOANTERIOR').asInteger);
           end;

          //TEMPO DE SERVIÇO
          if ImportaTempo(6) then
           begin
             if CalcularTempo(6, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 6, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 6,
                      qryParticipante.FieldByName('DATAADMISSAO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 6,
                   qryParticipante.FieldByName('DATAADMISSAO').asDateTime);
           end;

          //ÚLTIMO SALÁRIO DE PARTICIPAÇÃO
          if ImportaTempo(7) then
           begin
             QryUltimoSalario.Close;
             QryUltimoSalario.ParamByName('PATROC').asInteger :=
                 qryParticipante.FieldByname('PATROCINADORA').asInteger;
             QryUltimoSalario.ParamByName('PARTIC').asInteger := iPartic;
             QryUltimoSalario.ParamByName('ANOMES').asString := sAnoMes;
             QryUltimoSalario.Open;

             if not (QryUltimoSalario.isEmpty)
                and (Trim(QryUltimoSalario.FieldByName('DATA_ULTIMO_SALARIO').asString) <> '') then
              begin
                if CalcularTempo(7, sNumRegra) then
                 begin
                   sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                   InsereTempoParticipante(iPartic, 7, StrToDate(sResultado));
                   if bErro then
                     InsereTempoParticipante(iPartic, 7, StrToDate('01/' +
                         copy(QryUltimoSalario.FieldByName('DATA_ULTIMO_SALARIO').asString, 6, 2) + '/' +
                         copy(QryUltimoSalario.FieldByName('DATA_ULTIMO_SALARIO').asString, 1, 4)));
                 end
                else
                  InsereTempoParticipante(iPartic, 7, StrToDate('01/' +
                      copy(QryUltimoSalario.FieldByName('DATA_ULTIMO_SALARIO').asString, 6, 2) + '/' +
                      copy(QryUltimoSalario.FieldByName('DATA_ULTIMO_SALARIO').asString, 1, 4)));
              end;
             QryUltimoSalario.Close;
           end;

          //DATA DA SITUAÇÃO NA FUNDAÇÃO
          if ImportaTempo(8)
          then begin
             if CalcularTempo(8, sNumRegra)
             then begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 8, StrToDate(sResultado));
                if bErro
                then InsereTempoParticipante(iPartic, 8, StrToDate(sDataSituacao) );
             end
             else InsereTempoParticipante(iPartic, 8, StrToDate(sDataSituacao) );
          end;

          //DATA DA SITUAÇÃO NA PATROCINADORA
          if ImportaTempo(9) then
           begin
             if CalcularTempo(9, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 9, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 9, StrToDate(sDataSituacao) );
              end
             else
               InsereTempoParticipante(iPartic, 9, StrToDate(sDataSituacao) );
           end;

          //DATA DE CANCELAMENTO NO PLANO
          if ImportaTempo(10) then
           begin
             if CalcularTempo(10, sNumRegra)
             then begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 10, StrToDate(sResultado));
                if bErro
                then InsereTempoParticipante(iPartic, 10, qryParticipante.FieldByName('DATACANCELAMENTO').asDateTime);
             end
             else InsereTempoParticipante(iPartic, 10, qryParticipante.FieldByName('DATACANCELAMENTO').asDateTime);
           end;

          //TEMPO NÃO CREDITADO
          if ImportaTempo(11) then
           begin
             if CalcularTempo(11, sNumRegra) then
              begin
                sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                if Trim(sResultado) <> '' then
                  InsereTempoParticipante(iPartic, 11, StrToInt(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 11,
                      qryParticipante.FieldByName('TEMPONAOCREDITADO').asInteger);
              end
             else
               InsereTempoParticipante(iPartic, 11,
                   qryParticipante.FieldByName('TEMPONAOCREDITADO').asInteger);
           end;

          //DATA DO FALECIMENTO
          if ImportaTempo(12) then
           begin
             if CalcularTempo(12, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 12, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 12,
                      qryParticipante.FieldByName('DATAFALECIMENTO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 12,
                   qryParticipante.FieldByName('DATAFALECIMENTO').asDateTime);
           end;

          //DATA DE DEMISSÃO
          if ImportaTempo(13) then
           begin
             if CalcularTempo(13, sNumRegra) then
              begin
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic, 13, StrToDate(sResultado));
                if bErro then
                  InsereTempoParticipante(iPartic, 13,
                      qryParticipante.FieldByName('DATADEMISSAO').asDateTime);
              end
             else
               InsereTempoParticipante(iPartic, 13,
                   qryParticipante.FieldByName('DATADEMISSAO').asDateTime);
           end;

          ImportaTemposFuncef(iPartic, qryParticipante.FieldByname('PLANO').asInteger, iPlanoAnterior);

          // VERIFICA A EXISTÊNCIA DE NOVOS TIPOS DE TEMPO PARA IMPORTAÇÃO
          QryVerifTipoTempo.Close;
          QryVerifTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := 15;
          QryVerifTipoTempo.Open;
          while not QryVerifTipoTempo.Eof do
           begin
             if (ImportaTempo(QryVerifTipoTempo.FieldByName('CD_TIPO_TEMPO').asInteger))
                 and (CalcularTempo(QryVerifTipoTempo.FieldByName('CD_TIPO_TEMPO').asInteger, sNumRegra)) then
              begin
                //Campo calculado
                sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                InsereTempoParticipante(iPartic,
                    QryVerifTipoTempo.FieldByName('CD_TIPO_TEMPO').asInteger,
                    StrToDate(sResultado));
              end;

             QryVerifTipoTempo.Next;
           end;
          QryVerifTipoTempo.Close;


          if frmAnimacao.Cancel then
           begin
             if MessageDlg('Deseja cancelar a importação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                MessageDlg('Processamento cancelado por intervenção do usuário.',
                    mtWarning, [mbOk], 0);
                bHouveErro := True;
                Exit;
              end
             else
               frmAnimacao.Cancel := False;
           end;

          qryParticipante.Next;
          Application.ProcessMessages;

          if dtmBaseDados.dbBaseDados.inTransaction then
            dtmBaseDados.dbBaseDados.Commit;
        end; //while
     end; //with

   except on E: Exception do
    begin
      bHouveErro := True;
      MessageDlg('Houve erros durante a importação do TotalPrev:' + #13#10 + E.Message,
          mtError, [mbOk], 0);
      Exit;
    end;
   end; //try-except-end
  Finally
    Screen.Cursor := crDefault;
    frmAnimacao.Close;
    if frmAnimacao <> nil then
      frmAnimacao.Free;

    if bHouveErro then
     begin
       if dtmBaseDados.dbBaseDados.inTransaction then
         dtmBaseDados.dbBaseDados.RollBack;
     end
    else
     begin
       if dtmBaseDados.dbBaseDados.inTransaction then
         dtmBaseDados.dbBaseDados.Commit;
       MessageDlg('Importação concluída com sucesso.', mtInformation, [mbOk], 0);
     end;
  End;
end;

procedure InsereParticipante(iVersao, iTitular, iPatroc, iPlano, iPlanoAnterior,
           iSit_Fundacao, iSit_Patrocinadora, iCargo, iOutraFundacao: Integer;
        sNome, sMatricula, sCPF, sEstado_Civil, sSexo, sRegional, sFundacaoOrigem,
           sPertencePatrocinadora, sDiretor, sTpParticipante, sVinculaPartic: String);
begin
  with DtmImportaTotalPrev do
   begin
     Try
       qryInsParticipante.ParamByName('CD_VERSAO').asInteger := iVersao;
       qryInsParticipante.ParamByName('IDTITULAR').asInteger := iTitular;
       qryInsParticipante.ParamByName('PATROC').asInteger := iPatroc;
       qryInsParticipante.ParamByName('CD_ENTID').asInteger := WG_CD_PESSOA_ENTID;
       qryInsParticipante.ParamByName('PLANO').asInteger := iPlano;
       qryInsParticipante.ParamByName('TP_PARTICIPANTE').asString := sTpParticipante;
       if Trim(sNome) = '' then
         qryInsParticipante.ParamByName('NOME').Clear
       else
         qryInsParticipante.ParamByName('NOME').asString := sNome;
       if Trim(sMatricula) = '' then
         qryInsParticipante.ParamByName('MATRICULA').Clear
       else
         qryInsParticipante.ParamByName('MATRICULA').asString := sMatricula;
       if Trim(sCPF) = '' then
         qryInsParticipante.ParamByName('CPF').Clear
       else
         qryInsParticipante.ParamByName('CPF').asString := sCPF;
       if Trim(sEstado_Civil) = '' then
         qryInsParticipante.ParamByName('ESTADO_CIVIL').Clear
       else
         qryInsParticipante.ParamByName('ESTADO_CIVIL').asString := sEstado_Civil;
       if Trim(sSexo) = '' then
         qryInsParticipante.ParamByName('SEXO').Clear
       else
         qryInsParticipante.ParamByName('SEXO').asString := sSexo;
       if Trim(sRegional) = '' then
         qryInsParticipante.ParamByName('REGIONAL').Clear
       else
         qryInsParticipante.ParamByName('REGIONAL').asString := sRegional;

       if iSit_Fundacao = 0 then
         qryInsParticipante.ParamByName('SITUACAO_FUNDACAO').asInteger := 1
       else
         qryInsParticipante.ParamByName('SITUACAO_FUNDACAO').asInteger := iSit_Fundacao;

       if iSit_Patrocinadora = 0 then
         qryInsParticipante.ParamByName('SITUACAO_PATROCINADORA').Clear
       else
         qryInsParticipante.ParamByName('SITUACAO_PATROCINADORA').asInteger := iSit_Patrocinadora;

       if Trim(sFundacaoOrigem) = '1' then
         qryInsParticipante.ParamByName('IR_FUNDACAO_ORIGEM').asString := sFundacaoOrigem
       else
         qryInsParticipante.ParamByName('IR_FUNDACAO_ORIGEM').asString := '0';

       if sPertencePatrocinadora = 'S' then
         qryInsParticipante.ParamByName('IR_PERTENCE_PATROCINADORA').asString := sPertencePatrocinadora
       else
         qryInsParticipante.ParamByName('IR_PERTENCE_PATROCINADORA').asString := 'N';

       if Trim(sDiretor) = '' then
         qryInsParticipante.ParamByName('IR_DIRETOR').Clear
       else if (Trim(sDiretor) = 'S') or (Trim(sDiretor) = '1') then
         qryInsParticipante.ParamByName('IR_DIRETOR').asString := 'D'
       else
        begin
          QryExDiretor.Close;
          QryExDiretor.ParamByName('IDTITULAR').asInteger := iTitular;
          QryExDiretor.ParamByName('DATA').asDateTime := WG_DT_REFER_BASE;
          QryExDiretor.Open;
          while not QryExDiretor.Eof do
           begin
             if pos('DIRETOR', QryExDiretor.FieldByName('TITULO').asString) > 0 then
               qryInsParticipante.ParamByName('IR_DIRETOR').asString := 'E';

             QryExDiretor.Next;
           end;
          QryExDiretor.Close;
        end;

       if iPlanoAnterior = 0 then
        begin
          qryInsParticipante.ParamByName('CD_PLANO_ANTERIOR').Clear;
          qryInsParticipante.ParamByName('IR_MIGRACAO_PLANO').asString := 'N';
        end
       else
        begin
          qryInsParticipante.ParamByName('CD_PLANO_ANTERIOR').asInteger := iPlanoAnterior;
          qryInsParticipante.ParamByName('IR_MIGRACAO_PLANO').asString := 'S';
        end;

       if iCargo = 0 then
         qryInsParticipante.ParamByName('CD_TIPO_CAT_PROF_ESP').Clear
       else
        begin
          QryDescrCargo.Close;
          QryDescrCargo.ParamByName('CD_CARGO').asInteger := iCargo;
          QryDescrCargo.Open;

          if (pos('MEDICO', AnsiUpperCase(QryDescrCargo.FieldByName('TITULO').asString)) > 0) or
             (pos('MÉDICO', AnsiUpperCase(QryDescrCargo.FieldByName('TITULO').asString)) > 0) then
            qryInsParticipante.ParamByName('CD_TIPO_CAT_PROF_ESP').asInteger := 1
          else if pos('DENTISTA', AnsiUpperCase(QryDescrCargo.FieldByName('TITULO').asString)) > 0 then
            qryInsParticipante.ParamByName('CD_TIPO_CAT_PROF_ESP').asInteger := 2
          else
            qryInsParticipante.ParamByName('CD_TIPO_CAT_PROF_ESP').Clear;
        end;

       if Trim(sVinculaPartic) = '' then
         QryInsParticipante.ParamByName('CD_VINCULA_PARTIC').Clear
       else
         QryInsParticipante.ParamByName('CD_VINCULA_PARTIC').asString := sVinculaPartic;

       if iOutraFundacao = 0 then
         QryInsParticipante.ParamByName('CD_OUTRA_FUNDACAO').Clear
       else
         QryInsParticipante.ParamByName('CD_OUTRA_FUNDACAO').asInteger := iOutraFundacao;
       //---

       QryInsParticipante.ParamByName('IR_CONDICAO_TRABALHO').asString := 'N'; //N - Normal
       //---

       qryInsParticipante.ExecSQL;
     Except
       qryUpdParticipante.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
       qryUpdParticipante.ParamByName('IDTITULAR').asInteger := iTitular;
       qryUpdParticipante.ParamByName('NOME').asString := sNome;
       qryUpdParticipante.ParamByName('MATRICULA').asString := sMatricula;
       qryUpdParticipante.ParamByName('CPF').asString := sCPF;
       qryUpdParticipante.ParamByName('ESTADO_CIVIL').asString := sEstado_Civil;
       qryUpdParticipante.ParamByName('SEXO').asString := sSexo;
       qryUpdParticipante.ParamByName('REGIONAL').asString := sRegional;
       QryUpdParticipante.ParamByName('TP_PARTICIPANTE').asString := sTpParticipante;
       if iSit_Fundacao = 0 then
         qryUpdParticipante.ParamByName('SITUACAO_FUNDACAO').asInteger := 1
       else
         qryUpdParticipante.ParamByName('SITUACAO_FUNDACAO').asInteger := iSit_Fundacao;

       if iSit_Patrocinadora = 0 then
         qryUpdParticipante.ParamByName('SITUACAO_PATROCINADORA').Clear
       else
         qryUpdParticipante.ParamByName('SITUACAO_PATROCINADORA').asInteger := iSit_Patrocinadora;


       if Trim(sFundacaoOrigem) = '1' then
         qryUpdParticipante.ParamByName('IR_FUNDACAO_ORIGEM').asString := sFundacaoOrigem
       else
         qryUpdParticipante.ParamByName('IR_FUNDACAO_ORIGEM').asString := '0';

       if sPertencePatrocinadora = 'S' then
         qryUpdParticipante.ParamByName('IR_PERTENCE_PATROCINADORA').asString := sPertencePatrocinadora
       else
         qryUpdParticipante.ParamByName('IR_PERTENCE_PATROCINADORA').asString := 'N';

       if Trim(sDiretor) = '' then
         qryUpdParticipante.ParamByName('IR_DIRETOR').Clear
       else if (Trim(sDiretor) = 'S') or (Trim(sDiretor) = '1') then
         qryUpdParticipante.ParamByName('IR_DIRETOR').asString := 'D'
       else
        begin
          QryExDiretor.Close;
          QryExDiretor.ParamByName('IDTITULAR').asInteger := iTitular;
          QryExDiretor.ParamByName('DATA').asDateTime := WG_DT_REFER_BASE;
          QryExDiretor.Open;
          while not QryExDiretor.Eof do
           begin
             if pos('DIRETOR', QryExDiretor.FieldByName('TITULO').asString) > 0 then
               qryUpdParticipante.ParamByName('IR_DIRETOR').asString := 'E';

             QryExDiretor.Next;
           end;
          QryExDiretor.Close;
        end;          

       if iPlanoAnterior = 0 then
        begin
          qryUpdParticipante.ParamByName('CD_PLANO_ANTERIOR').Clear;
          qryUpdParticipante.ParamByName('IR_MIGRACAO_PLANO').asString := 'N';
        end
       else
        begin
          qryUpdParticipante.ParamByName('CD_PLANO_ANTERIOR').asInteger := iPlanoAnterior;
          qryUpdParticipante.ParamByName('IR_MIGRACAO_PLANO').asString := 'S';
        end;

       if iCargo = 0 then
         qryUpdParticipante.ParamByName('CD_TIPO_CAT_PROF_ESP').Clear
       else
        begin
          QryDescrCargo.Close;
          QryDescrCargo.ParamByName('CD_CARGO').asInteger := iCargo;
          QryDescrCargo.Open;

          if (pos('MEDICO', AnsiUpperCase(QryDescrCargo.FieldByName('TITULO').asString)) > 0) or
             (pos('MÉDICO', AnsiUpperCase(QryDescrCargo.FieldByName('TITULO').asString)) > 0) then
            qryUpdParticipante.ParamByName('CD_TIPO_CAT_PROF_ESP').asInteger := 1
          else if pos('DENTISTA', AnsiUpperCase(QryDescrCargo.FieldByName('TITULO').asString)) > 0 then
            qryUpdParticipante.ParamByName('CD_TIPO_CAT_PROF_ESP').asInteger := 2
          else
            qryUpdParticipante.ParamByName('CD_TIPO_CAT_PROF_ESP').Clear;
        end;

       if Trim(sVinculaPartic) = '' then
         QryUpdParticipante.ParamByName('CD_VINCULA_PARTIC').Clear
       else
         QryUpdParticipante.ParamByName('CD_VINCULA_PARTIC').asString := sVinculaPartic;
         
       if iOutraFundacao = 0 then
         QryUpdParticipante.ParamByName('CD_OUTRA_FUNDACAO').Clear
       else
         QryUpdParticipante.ParamByName('CD_OUTRA_FUNDACAO').asInteger := iOutraFundacao;
       //---

       QryUpdParticipante.ParamByName('IR_CONDICAO_TRABALHO').asString := 'N'; //N - Normal
       //---

       qryUpdParticipante.ExecSQL;
     End;
   end;
end;

procedure InsereDependente(iDependente, iParticipante, iDuracao, iSituacaoPlano, iGrauInstrucao: Integer;
            dNascimento: TDateTime;
            sNome, sMatricula, sSexo, sGrauDependencia: String);
begin
  with DtmImportaTotalPrev do
   begin
     Try
       QryInsDependente.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
       QryInsDependente.ParamByName('CD_PARTIC').asInteger := iParticipante;
       QryInsDependente.ParamByName('CD_DEPENDENTE').asInteger := iDependente;
       QryInsDependente.ParamByName('NR_MATRICULA').asString := sMatricula;
       QryInsDependente.ParamByName('NO_DEPENDENTE').asString := sNome;
       QryInsDependente.ParamByName('IR_SEXO').asString := sSexo;
       QryInsDependente.ParamByName('CD_GRAU_DEPENDENCIA').asString := sGrauDependencia;

       if iDuracao = 0 then
         QryInsDependente.ParamByName('CD_DURACAO').Clear
       else
         QryInsDependente.ParamByName('CD_DURACAO').asInteger := iDuracao;

       if dNascimento = 0 then
        begin
          QryInsDependente.ParamByName('DT_NASC').Clear;
          QryInsDependente.ParamByName('NR_ANOS_DEPENDENTE').Clear;
        end
       else
        begin
          QryInsDependente.ParamByName('DT_NASC').asDateTime := dNascimento;
          QryInsDependente.ParamByName('NR_ANOS_DEPENDENTE').asInteger := getIDADE(dNascimento);
        end;

       if iSituacaoPlano = 0 then
         QryInsDependente.ParamByName('CD_SITUACAO_PLANO').Clear
       else
         QryInsDependente.ParamByName('CD_SITUACAO_PLANO').asInteger := iSituacaoPlano;

       if iGrauInstrucao = 0 then
         QryInsDependente.ParamByName('CD_GRAU_INSTRUCAO').Clear
       else
         QryInsDependente.ParamByName('CD_GRAU_INSTRUCAO').asInteger := iGrauInstrucao;
       //---

       QryInsDependente.ExecSQL;
     Except on E: Exception do
      begin

       QryUpdDependente.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
       QryInsDependente.ParamByName('CD_PARTIC').asInteger := iParticipante;
       QryUpdDependente.ParamByName('CD_DEPENDENTE').asInteger := iDependente;
       QryUpdDependente.ParamByName('NR_MATRICULA').asString := sMatricula;
       QryUpdDependente.ParamByName('NO_DEPENDENTE').asString := sNome;
       QryUpdDependente.ParamByName('IR_SEXO').asString := sSexo;
       QryUpdDependente.ParamByName('CD_GRAU_DEPENDENCIA').asString := sGrauDependencia;

       if iDuracao = 0 then
         QryUpdDependente.ParamByName('CD_DURACAO').Clear
       else
         QryUpdDependente.ParamByName('CD_DURACAO').asInteger := iDuracao;

       if dNascimento = 0 then
        begin
          QryUpdDependente.ParamByName('DT_NASC').Clear;
          QryUpdDependente.ParamByName('NR_ANOS_DEPENDENTE').clear;
        end
       else
        begin
          QryUpdDependente.ParamByName('DT_NASC').asDateTime := dNascimento;
          QryUpdDependente.ParamByName('NR_ANOS_DEPENDENTE').asInteger := getIDADE(dNascimento);
        end;

       if iSituacaoPlano = 0 then
         QryUpdDependente.ParamByName('CD_SITUACAO_PLANO').Clear
       else
         QryUpdDependente.ParamByName('CD_SITUACAO_PLANO').asInteger := iSituacaoPlano;

       if iGrauInstrucao = 0 then
         QryUpdDependente.ParamByName('CD_GRAU_INSTRUCAO').Clear
       else
         QryUpdDependente.ParamByName('CD_GRAU_INSTRUCAO').asInteger := iGrauInstrucao;         
       //---

       QryUpdDependente.ExecSQL;
      end;
     End;
   end;
end;

procedure InsereBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO, iCD_PESSOA_PATROC,
             iCD_PLANO, iCD_TIPO_BENEF, iCD_DURACAO, iCD_SITUACAO_PLANO, iCD_GRAU_INSTRUCAO: Integer;
            sNO_BENEFICIARIO, sNR_MATRICULA, sIR_SEXO, sCD_GRAU_DEPENDENCIA, sAnoMes: String;
            dDT_NASCIMENTO: TDateTime);
begin
  with DtmImportaTotalPrev do
   Try
     QryInsBeneficiario.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
     QryInsBeneficiario.ParamByName('CD_PARTIC').asInteger := iCD_PARTIC;
     QryInsBeneficiario.ParamByName('CD_BENEF_TITULAR').asInteger := iCD_BENEF_TITULAR;
     QryInsBeneficiario.ParamByName('CD_BENEFICIARIO').asInteger := iCD_BENEFICIARIO;
     QryInsBeneficiario.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
     QryInsBeneficiario.ParamByName('CD_PESSOA_PATROC').asInteger := iCD_PESSOA_PATROC;
     QryInsBeneficiario.ParamByName('CD_PLANO').asInteger := iCD_PLANO;
     QryInsBeneficiario.ParamByName('CD_TIPO_BENEF').asInteger := iCD_TIPO_BENEF;

     if Trim(sCD_GRAU_DEPENDENCIA) = '' then
       QryInsBeneficiario.ParamByName('CD_GRAU_DEPENDENCIA').Clear
     else
       QryInsBeneficiario.ParamByName('CD_GRAU_DEPENDENCIA').asString := sCD_GRAU_DEPENDENCIA;

     if iCD_DURACAO = 0 then
       QryInsBeneficiario.ParamByName('CD_DURACAO').Clear
     else
       QryInsBeneficiario.ParamByName('CD_DURACAO').asInteger := iCD_DURACAO;

     if iCD_SITUACAO_PLANO = 0 then
       QryInsBeneficiario.ParamByName('CD_SITUACAO_PLANO').Clear
     else
       QryInsBeneficiario.ParamByName('CD_SITUACAO_PLANO').asInteger := iCD_SITUACAO_PLANO;

     if iCD_GRAU_INSTRUCAO = 0 then
       QryInsBeneficiario.ParamByName('CD_GRAU_INSTRUCAO').Clear
     else
       QryInsBeneficiario.ParamByName('CD_GRAU_INSTRUCAO').asInteger := iCD_GRAU_INSTRUCAO;

     QryInsBeneficiario.ParamByName('NO_BENEFICIARIO').asString := sNO_BENEFICIARIO;
     QryInsBeneficiario.ParamByName('IR_SEXO').asString := sIR_SEXO;

     if Trim(sNR_MATRICULA) = '' then
       QryInsBeneficiario.ParamByName('NR_MATRICULA').Clear
     else
       QryInsBeneficiario.ParamByName('NR_MATRICULA').asString := sNR_MATRICULA;

     if dDT_NASCIMENTO = 0 then
      begin
        QryInsBeneficiario.ParamByName('DT_NASC').Clear;
        QryInsBeneficiario.ParamByName('NR_IDADE_BENEFICIARIO').Clear;
      end
     else
      begin
        QryInsBeneficiario.ParamByName('DT_NASC').asDateTime := dDT_NASCIMENTO;
        QryInsBeneficiario.ParamByName('NR_IDADE_BENEFICIARIO').asInteger := getIDADE(dDT_NASCIMENTO);
      end;

     QryInsBeneficiario.ExecSQL;
   Except
     QryUpdBeneficiario.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
     QryUpdBeneficiario.ParamByName('CD_PARTIC').asInteger := iCD_PARTIC;
     QryUpdBeneficiario.ParamByName('CD_BENEF_TITULAR').asInteger := iCD_BENEF_TITULAR;
     QryUpdBeneficiario.ParamByName('CD_BENEFICIARIO').asInteger := iCD_BENEFICIARIO;
     QryUpdBeneficiario.ParamByName('CD_PESSOA_ENTID').asInteger := WG_CD_PESSOA_ENTID;
     QryUpdBeneficiario.ParamByName('CD_PESSOA_PATROC').asInteger := iCD_PESSOA_PATROC;
     QryUpdBeneficiario.ParamByName('CD_PLANO').asInteger := iCD_PLANO;
     QryUpdBeneficiario.ParamByName('CD_TIPO_BENEF').asInteger := iCD_TIPO_BENEF;

     if Trim(sCD_GRAU_DEPENDENCIA) = '' then
       QryUpdBeneficiario.ParamByName('CD_GRAU_DEPENDENCIA').Clear
     else
       QryUpdBeneficiario.ParamByName('CD_GRAU_DEPENDENCIA').asString := sCD_GRAU_DEPENDENCIA;

     if iCD_DURACAO = 0 then
       QryUpdBeneficiario.ParamByName('CD_DURACAO').Clear
     else
       QryUpdBeneficiario.ParamByName('CD_DURACAO').asInteger := iCD_DURACAO;

     if iCD_SITUACAO_PLANO = 0 then
       QryUpdBeneficiario.ParamByName('CD_SITUACAO_PLANO').Clear
     else
       QryUpdBeneficiario.ParamByName('CD_SITUACAO_PLANO').asInteger := iCD_SITUACAO_PLANO;

     if iCD_GRAU_INSTRUCAO = 0 then
       QryUpdBeneficiario.ParamByName('CD_GRAU_INSTRUCAO').Clear
     else
       QryUpdBeneficiario.ParamByName('CD_GRAU_INSTRUCAO').asInteger := iCD_GRAU_INSTRUCAO;

     QryUpdBeneficiario.ParamByName('NO_BENEFICIARIO').asString := sNO_BENEFICIARIO;
     QryUpdBeneficiario.ParamByName('IR_SEXO').asString := sIR_SEXO;

     if Trim(sNR_MATRICULA) = '' then
       QryUpdBeneficiario.ParamByName('NR_MATRICULA').Clear
     else
       QryUpdBeneficiario.ParamByName('NR_MATRICULA').asString := sNR_MATRICULA;

     if dDT_NASCIMENTO = 0 then
      begin
        QryUpdBeneficiario.ParamByName('DT_NASC').Clear;
        QryUpdBeneficiario.ParamByName('NR_IDADE_BENEFICIARIO').Clear;
      end
     else
      begin
        QryUpdBeneficiario.ParamByName('DT_NASC').asDateTime := dDT_NASCIMENTO;
        QryUpdBeneficiario.ParamByName('NR_IDADE_BENEFICIARIO').asInteger := getIDADE(dDT_NASCIMENTO);
      end;

     QryUpdBeneficiario.ExecSQL;
   End;

  //VALOR DO BENEFICIARIO
  setValorBeneficio(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO, sAnoMes);
end;

procedure InsereValorBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO, iCD_TIPO: Integer;
            fVL_BENEFICIARIO: Extended);
begin
  with DtmImportaTotalPrev do
   Try
     QryInsValorBeneficiario.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
     QryInsValorBeneficiario.ParamByName('CD_PARTIC').asInteger := iCD_PARTIC;
     QryInsValorBeneficiario.ParamByName('CD_BENEF_TITULAR').asInteger := iCD_BENEF_TITULAR;
     QryInsValorBeneficiario.ParamByName('CD_BENEFICIARIO').asInteger := iCD_BENEFICIARIO;
     QryInsValorBeneficiario.ParamByName('CD_TIPO_VALOR').asInteger := iCD_TIPO;
     QryInsValorBeneficiario.ParamByName('VL_PARTICIPANTE').asFloat := fVL_BENEFICIARIO;

     if fVL_BENEFICIARIO <> 0 then
       QryInsValorBeneficiario.ExecSQL;
   Except
     QryUpdValorBeneficiario.ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
     QryUpdValorBeneficiario.ParamByName('CD_PARTIC').asInteger := iCD_PARTIC;
     QryUpdValorBeneficiario.ParamByName('CD_BENEF_TITULAR').asInteger := iCD_BENEF_TITULAR;
     QryUpdValorBeneficiario.ParamByName('CD_BENEFICIARIO').asInteger := iCD_BENEFICIARIO;
     QryUpdValorBeneficiario.ParamByName('CD_TIPO_VALOR').asInteger := iCD_TIPO;
     QryUpdValorBeneficiario.ParamByName('VL_PARTICIPANTE').asFloat := fVL_BENEFICIARIO;

     if fVL_BENEFICIARIO <> 0 then
       QryUpdValorBeneficiario.ExecSQL;
   End;
end;

procedure InsereTabelasAuxiliares(iEntid: Integer; bExibeMensagem: Boolean = True);
var
  bI: Byte;
begin
  Try
    Screen.Cursor := crHourGlass;
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
    dtmBaseDados.dbBaseDados.StartTransaction;
    bHouveErro := False;

    with DtmImportaTotalPrev do
     begin
       Try
         // Entidades
         qryInsPessoa.ExecSQL;

         // Patrocinadoras
         qryInsPatroc.ParamByName('DT_REAJUSTE_SALARIO').asDateTime := Date;
         qryInsPatroc.ExecSQL;

         // Planos
         qryPatroc.Close;
         qryPlano.Close;
         qryPatroc.Open;
         qryPlano.Open;

         qryInsDependencia.ExecSQL;
         qryInsSitFundacao.ExecSQL;
         qryInsSitPatroc.ExecSQL;
         qryInsDuracao.ExecSQL;
         qryInsTipoBeneficio.ExecSQL;

         QryInsSituacaoPlano.ExecSQL;
         QryInsVinculoParticipante.ExecSQL;

	 QryInsOutrasFundacoes.ExecSQL;

         QryInsGrupoBeneficio.ExecSQL;

         QryInsGrauInstrucao.ExecSQL;
         //---

         while not qryPatroc.Eof do
          begin
            // Patrocinadoras
            qryInsPlano.ParamByName('CD_PESSOA_ENTID').asInteger := iEntid;
            qryInsPlano.ParamByName('CD_PESSOA_PATROC').asInteger :=
                qryPatroc.FieldByName('IDPESSOA').asInteger;
            qryInsPlano.ExecSQL;

            // Planos de Benefício
            qryPlano.First;
            while not qryPlano.Eof do
             begin
               qryInsPlanoBeneficio.ParamByName('CD_PESSOA_ENTID').asInteger := iEntid;
               qryInsPlanoBeneficio.ParamByName('CD_PESSOA_PATROC').asInteger :=
                   qryPatroc.FieldByName('IDPESSOA').asInteger;

               Try
               qryInsPlanoBeneficio.ExecSQL;
               Except End;   
               qryPlano.Next;
             end;
            qryPatroc.Next;
          end;
         qryPatroc.Close;
         qryPlano.Close;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE FI_PLANO_PATRONAL F '+
                        ' SET    NO_PLANO = ( SELECT NOME FROM PLANPREV PL WHERE F.CD_PLANO = PL.IDPLANOPREV) ');
         qryAux.ExecSQL;

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE FI_PESSOA_JURIDICA F '+
                        ' SET    NO_PESSOA = ( SELECT NOME FROM PESSOA P WHERE F.CD_PESSOA = P.IDPESSOA) ');
         qryAux.ExecSQL;


         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE FI_SITUACAO_FUNDACAO F '+
                        ' SET    DS_SITUACAO_FUNDACAO = ( SELECT DESCRICAO FROM SITPART P WHERE F.CD_SITUACAO_FUNDACAO = P.IDSITPART) ');
         qryAux.ExecSQL;

         // Relacionamento Tempo X Regra
         for bI := 1 to 13 do
           InsereTempoRegra(bI, iEntid);

         //Relacionamento Valor X Regra
         InsereValorRegra(1, iEntid);
         InsereValorRegra(2, iEntid);
         InsereValorRegra(4, iEntid);
         InsereValorRegra(5, iEntid);
         InsereValorRegra(6, iEntid);
         InsereValorRegra(7, iEntid);
         InsereValorRegra(8, iEntid);
         InsereValorRegra(9, iEntid);
         InsereValorRegra(10, iEntid);
         InsereValorRegra(11, iEntid);
         InsereValorRegra(12, iEntid);
       Except on E: Exception do
        begin
          MessageDlg('Erro ao inserir Tabela Auxiliar: ' + #13#10 + E.Message,
              mtError, [mbOk], 0);
          bHouveErro := True;
          Exit;
        end;
       End;
     end;

    InsereEstadoCivil('C', 'CASADO(A)');
    InsereEstadoCivil('D', 'DIVORCIADO(A)');
    InsereEstadoCivil('S', 'SOLTEIRO(A)');
    InsereEstadoCivil('V', 'VIÚVO(A)');
    InsereEstadoCivil('E', 'DESQUITADO(A)');
    InsereEstadoCivil('J', 'SEPARADO(A) JUDICIAL');
    InsereEstadoCivil('M', 'MARITAL');
    InsereEstadoCivil('O', 'OUTROS');

    InsereCargo(1, 'MÉDICO');
    InsereCargo(2, 'DENTISTA');

    InsereTipoTempo(1, 'DATA DE INSCRIÇÃO NO PLANO', 'INS');
    InsereTipoTempo(2, 'DATA DO NASCIMENTO', 'NAS');
    InsereTipoTempo(3, 'DATA DA ADMISSÃO', 'ADM');
    InsereTipoTempo(4, 'DATA DE INÍCIO DO BENEFÍCIO', 'DIB');
    InsereTipoTempo(5, 'TEMPO DE SERVIÇO ANTERIOR', 'ANT');
    InsereTipoTempo(6, 'TEMPO DE SERVIÇO', 'TPS');
    InsereTipoTempo(7, 'ÚLTIMO SALÁRIO DE PARTICIPAÇÃO', 'USP');
    InsereTipoTempo(8, 'DATA DA SITUAÇÃO NA FUNDAÇÃO', 'STF');
    InsereTipoTempo(9, 'DATA DA SITUAÇÃO NA PATROCINADORA', 'STP');
    InsereTipoTempo(10, 'DATA DE CANCELAMENTO NO PLANO', 'CAN');
    InsereTipoTempo(11, 'TEMPO NÃO CREDITADO', 'TNC');
    InsereTipoTempo(12, 'DATA DO FALECIMENTO', 'FAL');
    InsereTipoTempo(13, 'DATA DE DEMISSÃO', 'DEM');

    InsereTipoTempo(14, 'DATA DE INÍCIO DO PAGAMENTO DO BENEFÍCIO DE INSS', 'DII');
    InsereTipoTempo(15, 'DATA DE INÍCIO DO PAGAMENTO DO BENEFÍCIO DO MIGRAÇÃO', 'DIM');

    InsereTipoValor(1, 'ÚLTIMO SALÁRIO DE PARTICIPAÇÃO');
    InsereTipoValor(2, 'VALOR DO BENEFÍCIO');
    InsereTipoValor(3, 'PERCENTUAL DE CONTRIBUIÇÃO');
    InsereTipoValor(4, 'SALDO DA CONTA');
    InsereTipoValor(5, 'SALÁRIO MÉDIO');
    InsereTipoValor(6, 'SALDO DE CONTR. DO PARTICIP.');
    InsereTipoValor(7, 'SALDO DE CONTR. DA PATROCIN.');
    InsereTipoValor(8, 'SALDO DE TRANSF. DO PARTICIP.');
    InsereTipoValor(9, 'SALDO DE TRANSF. DA PATROCIN.');
    InsereTipoValor(10, 'GARANTIA');
    InsereTipoValor(11, 'VALOR DO BENEFÍCIO - ABONO');
    InsereTipoValor(12, 'VALOR DO BENEFÍCIO - INSS');
    InsereTipoValor(13, 'VALOR DE CONTRIBUIÇÃO SUPLEMENTAR');
    InsereTipoValor(14, 'TAXA DE JÓIA');
    InsereTipoValor(16, 'VALOR DE CONTRIBUIÇÃO ASSISTIDO');
    InsereTipoValor(17, 'TAXA DE CONTRIBUIÇÃO BÁSICA');
    InsereTipoValor(18, 'TAXA DE CONTRIBUIÇÃO NORMAL');
    InsereTipoValor(19, 'TAXA DE CONTRIBUIÇÃO VOLUNTÁRIA');
    InsereTipoValor(20, 'QUANTIDADE DE COTAS DO BENEFÍCIO');
    InsereTipoValor(21, 'PERCENTUAL DE RESGATE DA APOSENTADORIA');

    InsereTipoValor(22, 'PERCENTUAL DO FATOR REDUTOR DO BENEFÍCIO');
    InsereTipoValor(23, 'VALOR DA RESERVA DE MIGRAÇÃO');
    InsereTipoValor(24, 'PERCENTUAL DE RENDA ANTECIPADA');

  Finally
    Screen.Cursor := crDefault;
    if bHouveErro then
     begin
       dtmBaseDados.dbBaseDados.Rollback;
     end
    else
     begin
       dtmBaseDados.dbBaseDados.Commit;
       if bExibeMensagem then
         MessageDlg('Importação realizada com sucesso.', mtInformation, [mbOk], 0);
     end;
  End;
end;

procedure InsereTipoTempo(iCD_TIPO: Integer; sDS_TIPO, sDOMINIO: String);
begin
  with DtmImportaTotalPrev do
   begin
     Try
       qryInsTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := iCD_TIPO;
       qryInsTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := sDS_TIPO;
       qryInsTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := sDOMINIO;
       qryInsTipoTempo.ExecSQL;
     Except
       qryUpdTipoTempo.ParamByName('CD_TIPO_TEMPO').asInteger := iCD_TIPO;
       qryUpdTipoTempo.ParamByName('DS_TIPO_TEMPO').asString := sDS_TIPO;
       qryUpdTipoTempo.ParamByName('IR_DOMINIO_SISTEMA').asString := sDOMINIO;
       qryUpdTipoTempo.ExecSQL;
     End;
   end;
end;

procedure InsereTipoValor(iCD_TIPO: Integer; sDS_TIPO: String);
begin
  with DtmImportaTotalPrev do
   begin
     Try
       qryInsTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := iCD_TIPO;
       qryInsTipoValor.ParamByName('DS_TIPO_VALOR').asString := sDS_TIPO;
       qryInsTipoValor.ExecSQL;
     Except
       qryUpdTipoValor.ParamByName('CD_TIPO_VALOR').asInteger := iCD_TIPO;
       qryUpdTipoValor.ParamByName('DS_TIPO_VALOR').asString := sDS_TIPO;
       qryUpdTipoValor.ExecSQL;
     End;
   end;
end;

procedure InsereEstadoCivil(sCod, sDescr: String);
begin
  with DtmImportaTotalPrev do
   begin
     Try
       qryInsEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := sCod;
       qryInsEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := sDescr;
       qryInsEstadoCivil.ExecSQL;
     Except
       qryUpdEstadoCivil.ParamByName('CD_ESTADO_CIVIL').asString := sCod;
       qryUpdEstadoCivil.ParamByName('DS_ESTADO_CIVIL').asString := sDescr;
       qryUpdEstadoCivil.ExecSQL;
     End;
   end;
end;

procedure InsereCargo(iCod: Integer; sDescr: String);
begin
  with DtmImportaTotalPrev do
    Try
      qryInsCargo.ParamByName('CD_CARGO').asInteger := iCod;
      qryInsCargo.ParamByName('DS_CARGO').asString := sDescr;
      qryInsCargo.ExecSQL;
    Except
      qryUpdCargo.ParamByName('CD_CARGO').asInteger := iCod;
      qryUpdCargo.ParamByName('DS_CARGO').asString := sDescr;
      qryUpdCargo.ExecSQL;
    End;
end;

procedure ImportaValoresFuncef(iPartic, iPlano: Integer);
var
  sNumRegra, sResultado: String;
  bErro: Boolean;
begin
  //PERCENTUAL DO FATOR REDUTOR DO BENEFÍCIO
  if ImportaValor(22) then
   begin
     if CalcularValor(22, sNumRegra) then
      begin
        sResultado := ExecutaRegraNumerica(sNumRegra, '', bErro);
        InsereValorParticipante(iPartic, 22, StrToFloat(sResultado));
      end
     else
       with DtmImportaTotalPrev do
        begin
          //VALORBASE1
          QryPercFatorBeneficio1.Close;
          QryPercFatorBeneficio1.ParamByName('IDPLANOPREV').asInteger := iPlano;
          QryPercFatorBeneficio1.ParamByName('IDTITULAR').asInteger := iPartic;
          QryPercFatorBeneficio1.ParamByName('DESCRICAO').asString := '%FATOR%REDUTOR%BENEF%';
          QryPercFatorBeneficio1.Open;

          if not QryPercFatorBeneficio1.isEmpty then
            InsereValorParticipante(iPartic, 22,
                QryPercFatorBeneficio1.FieldByName('VALORBASE1').asFloat)
          else
           begin
             //VALORBASE2
             QryPercFatorBeneficio2.Close;
             QryPercFatorBeneficio2.ParamByName('IDPLANOPREV').asInteger := iPlano;
             QryPercFatorBeneficio2.ParamByName('IDTITULAR').asInteger := iPartic;
             QryPercFatorBeneficio2.ParamByName('DESCRICAO').asString := '%FATOR%REDUTOR%BENEF%';
             QryPercFatorBeneficio2.Open;

             if not QryPercFatorBeneficio2.isEmpty then
               InsereValorParticipante(iPartic, 22,
                   QryPercFatorBeneficio2.FieldByName('VALORBASE2').asFloat)
             else
              begin
                //VALORBASE3
                QryPercFatorBeneficio3.Close;
                QryPercFatorBeneficio3.ParamByName('IDPLANOPREV').asInteger := iPlano;
                QryPercFatorBeneficio3.ParamByName('IDTITULAR').asInteger := iPartic;
                QryPercFatorBeneficio3.ParamByName('DESCRICAO').asString := '%FATOR%REDUTOR%BENEF%';
                QryPercFatorBeneficio3.Open;

                if not QryPercFatorBeneficio3.isEmpty then
                  InsereValorParticipante(iPartic, 22,
                      QryPercFatorBeneficio3.FieldByName('VALORBASE3').asFloat);
              end; //else - 2
           end; //else - 1

          QryPercFatorBeneficio1.Close;
          QryPercFatorBeneficio2.Close;
          QryPercFatorBeneficio3.Close;
        end; //with
   end; //if

  //VALOR DA RESERVA DE MIGRAÇÃO
  if ImportaValor(23) then
   begin
     if CalcularValor(23, sNumRegra) then
      begin
        sResultado := ExecutaRegraNumerica(sNumRegra, '', bErro);
        InsereValorParticipante(iPartic, 23, StrToFloat(sResultado));
      end
     else
       with DtmImportaTotalPrev do
        begin
          QryReservaMigracao.Close;
          QryReservaMigracao.ParamByName('IDPLANOPREV').asInteger := iPlano;
          QryReservaMigracao.ParamByName('IDTITULAR').asInteger := iPartic;
          QryReservaMigracao.Open;

          if not QryReservaMigracao.isEmpty then
            InsereValorParticipante(iPartic, 23,
                QryReservaMigracao.FieldByName('VALORRESERVA').asFloat)
        end; //with
   end; //if

  //PERCENTUAL DE RENDA ANTECIPADA
  if ImportaValor(24) then
   begin
     if CalcularValor(24, sNumRegra) then
      begin
        sResultado := ExecutaRegraNumerica(sNumRegra, '', bErro);
        InsereValorParticipante(iPartic, 24, StrToFloat(sResultado));
      end
     else
       with DtmImportaTotalPrev do
        begin
          //VALORBASE1
          QryPercFatorBeneficio1.Close;
          QryPercFatorBeneficio1.ParamByName('IDPLANOPREV').asInteger := iPlano;
          QryPercFatorBeneficio1.ParamByName('IDTITULAR').asInteger := iPartic;
          QryPercFatorBeneficio1.ParamByName('DESCRICAO').asString := '%RENDA%ANTECIPADA%';
          QryPercFatorBeneficio1.Open;

          if not QryPercFatorBeneficio1.isEmpty then
            InsereValorParticipante(iPartic, 24,
                QryPercFatorBeneficio1.FieldByName('VALORBASE1').asFloat)
          else
           begin
             //VALORBASE2
             QryPercFatorBeneficio2.Close;
             QryPercFatorBeneficio2.ParamByName('IDPLANOPREV').asInteger := iPlano;
             QryPercFatorBeneficio2.ParamByName('IDTITULAR').asInteger := iPartic;
             QryPercFatorBeneficio2.ParamByName('DESCRICAO').asString := '%RENDA%ANTECIPADA%';
             QryPercFatorBeneficio2.Open;

             if not QryPercFatorBeneficio2.isEmpty then
               InsereValorParticipante(iPartic, 24,
                   QryPercFatorBeneficio2.FieldByName('VALORBASE2').asFloat)
             else
              begin
                //VALORBASE3
                QryPercFatorBeneficio3.Close;
                QryPercFatorBeneficio3.ParamByName('IDPLANOPREV').asInteger := iPlano;
                QryPercFatorBeneficio3.ParamByName('IDTITULAR').asInteger := iPartic;
                QryPercFatorBeneficio3.ParamByName('DESCRICAO').asString := '%RENDA%ANTECIPADA%';
                QryPercFatorBeneficio3.Open;

                if not QryPercFatorBeneficio3.isEmpty then
                  InsereValorParticipante(iPartic, 24,
                      QryPercFatorBeneficio3.FieldByName('VALORBASE3').asFloat);
              end; //else - 2
           end; //else - 1

          QryPercFatorBeneficio1.Close;
          QryPercFatorBeneficio2.Close;
          QryPercFatorBeneficio3.Close;
        end; //with
   end; //if
end;

procedure ImportaTemposFuncef(iPartic, iPlano, iPlanoAnterior: Integer);
var
  sNumRegra, sResultado: String;
  bErro: Boolean;
begin
  //DATA DE INÍCIO DO BENEFÍCIO INSS
  if ImportaTempo(14) then
   begin
     if CalcularTempo(14, sNumRegra) then
      begin
        sResultado := ExecutaRegraTempo(sNumRegra, '', bErro);
        InsereTempoParticipante(iPartic, 14, StrToDate(sResultado));
      end
     else
       with DtmImportaTotalPrev do
        begin
          QryDibINSS.Close;
          QryDibINSS.ParamByName('IDPLANOPREV').asInteger := iPlano;
          QryDibINSS.ParamByName('IDTITULAR').asInteger := iPartic;
          QryDibINSS.Open;

          if not QryDibINSS.isEmpty then
            InsereTempoParticipante(iPartic, 14,
                QryDibINSS.FieldByName('DATAINICIO').asDateTime);
                
          QryDibINSS.Close;
        end; //with
   end; //if

  //DATA DE INÍCIO DO MIGRACAO
  if ImportaTempo(15) then
   begin
     if CalcularTempo(15, sNumRegra) then
      begin
        sResultado := ExecutaRegraTempo(sNumRegra, '', bErro);
        InsereTempoParticipante(iPartic, 15, StrToDate(sResultado));
      end
     else
       with DtmImportaTotalPrev do
        begin
          QryDibMigracao.Close;
          QryDibMigracao.ParamByName('IDPLANOPREV').asInteger := iPlanoAnterior;
          QryDibMigracao.ParamByName('IDTITULAR').asInteger := iPartic;
          if iPlanoAnterior > 0 then
            QryDibMigracao.Open;

          if not QryDibMigracao.isEmpty then
            InsereTempoParticipante(iPartic, 15,
                QryDibMigracao.FieldByName('DATAINICIO').asDateTime);

          QryDibMigracao.Close; 
        end; //with
   end; //if
end;

function GetOutraFundacao(iCD_PESSOA: Integer): Integer;
begin
  with DtmImportaTotalPrev do
    Try
      QryPessoaParam.Close;
      QryPessoaParam.ParamByName('IDPESSOA').asInteger := iCD_PESSOA;
      QryPessoaParam.Open;

      Result := QryPessoaParam.FieldByName('IDPARAM').asInteger;
    Finally
      QryPessoaParam.Close;
    End;
end;

procedure setValorBeneficio(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO: Integer; sAnoMes: String);
var
  sNumRegra, sResultado, sSQL: String;
  bErro: Boolean;
begin
  with DtmImportaTotalPrev do
   Try
     //VALOR DO BENEFÍCIO
     QryValorBeneficio.Close;
     QryValorBeneficio.ParamByName('IDPESSOA').asInteger := iCD_BENEFICIARIO;
     QryValorBeneficio.ParamByName('DATAREF').asDateTime := WG_DT_REFER_BASE;
     QryValorBeneficio.ParamByName('ANOMESREF').asString := sAnoMes;
     QryValorBeneficio.Open;

     while not QryValorBeneficio.Eof do
      begin
        if ((QryValorBeneficio.FieldByname('SITBENEFICIO').asInteger <> 1) and
            (QryValorBeneficio.FieldByname('DATAFINAL').asDateTime >= WG_DT_REFER_BASE)) or
           (QryValorBeneficio.FieldByname('SITBENEFICIO').asInteger = 1) then
         begin
           if (pos('ABONO', AnsiUpperCase(QryValorBeneficio.FieldByName('NOMEBENEFICIO').asString)) > 0) and
               (ImportaValor(11)) then
            begin
              //VALOR DO BENEFICIO - ABONO
              if CalcularValor(11, sNumRegra) then
               begin
                 sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                 InsereValorBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO,
                   11, StrToFloat(sResultado));
                 if bErro then
                   InsereValorBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO,
                     11, QryValorBeneficio.FieldByName('VALORDOBENEFICIO').asFloat);
               end
              else
                InsereValorBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO,
                  11, QryValorBeneficio.FieldByName('VALORDOBENEFICIO').asFloat);
            end
           else if (pos('INSS', AnsiUpperCase(QryValorBeneficio.FieldByName('NOMEBENEFICIO').asString)) > 0)
               and (ImportaValor(12)) then
            begin
              //VALOR DO BENEFICIO - INSS
              if CalcularValor(12, sNumRegra) then
               begin
                 sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                 InsereValorBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO,
                   12, StrToFloat(sResultado));
                 if bErro then
                   InsereValorBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO,
                     12, QryValorBeneficio.FieldByName('VALORDOBENEFICIO').asFloat);
               end
              else
                InsereValorBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO,
                  12, QryvalorBeneficio.FieldByName('VALORDOBENEFICIO').asFloat);
            end
           else
            begin
              //VALOR DO BENEFICIO
              if ImportaValor(2) then
               begin
                 if CalcularValor(2, sNumRegra) then
                  begin
                    sResultado := ExecutaRegraNumerica(sNumRegra, sSQL, bErro);
                    InsereValorBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO,
                      2, StrToFloat(sResultado));
                    if bErro then
                      InsereValorBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO,
                        2, QryValorBeneficio.FieldByName('VALORDOBENEFICIO').asFloat);
                  end
                 else
                   InsereValorBeneficiario(iCD_PARTIC, iCD_BENEF_TITULAR, iCD_BENEFICIARIO,
                     2, QryValorBeneficio.FieldByName('VALORDOBENEFICIO').asFloat);
               end;

              //DATA DE INÍCIO DO BENEFICIO
              if (iCD_PARTIC = iCD_BENEF_TITULAR) and (ImportaTempo(4)) then
               begin
                 if CalcularTempo(4, sNumRegra) then
                  begin
                    sResultado := ExecutaRegraTempo(sNumRegra, sSQL, bErro);
                    InsereTempoParticipante(iCD_PARTIC, 4, StrToDate(sResultado));
                    if bErro then
                      InsereTempoParticipante(iCD_PARTIC, 4,
                          QryValorBeneficio.FieldByName('DATAINICIOBENEFICIO').asDateTime);
                  end
                 else
                   InsereTempoParticipante(iCD_PARTIC, 4,
                       QryValorBeneficio.FieldByName('DATAINICIOBENEFICIO').asDateTime);
               end;
            end;
         end;
        QryValorBeneficio.Next;
      end; //while
   Finally
     QryValorBeneficio.Close;
   End;
end;

end.
