unit FExecConcessaoAutomatica;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, ComCtrls, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
   URegra, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, wwriched, Spin, MontaSelect,
   StdCtrls, wwdbdatetimepicker, CMDateTimePicker,

   uTypesEmptmo;

type
   TfrmExecConcessaoAutomatica = class(TfrmOkCancelar)
      qry: TwwQuery;
      MsPlano: TMontaSelect;
      pgcConcessao: TPageControl;
      tbsOpcoes: TTabSheet;
      tbsResultado: TTabSheet;
      MemoResultado: TMemo;
      Label2: TLabel;
      Label3: TLabel;
      edtDataAssinatura: TCMDateTimePicker;
      EdPlano: TEdit;
      btnPlano: TBitBtn;
      btnLimpaPlano: TBitBtn;
      qryFLGINTERNO: TStringField;
      qryIDTIPOEMPTMO: TFloatField;
      qryIDREGRAJURCONC: TFloatField;
      qryIDREGRALIMITES: TFloatField;
      qryIDREGRAELEG: TFloatField;
      qryIDREGRAPRAZOSCONC: TFloatField;
      qryIDREGRARESERVA: TFloatField;
      qryIDREGRAMARGEM: TFloatField;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryIDPESSOA: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryIDPATRO: TFloatField;
      qryVLRSOLIC: TFloatField;
      qryIDBENEF: TFloatField;
      qryIDCBANCARIA: TFloatField;
      qryFLGFORMAPAG: TStringField;
      qryPORTFORMAPAG: TFloatField;
      qryCODFORMAPAG: TFloatField;
      qryNUMPARCELAS: TFloatField;
      qryFLGFORMAREC: TStringField;
      qryPORTFORMAREC: TFloatField;
      qryFLGPENDENTE: TStringField;
      qryFLGSITUACAO: TStringField;
      qryDATAINSC: TDateTimeField;
      qryDATACANCINSC: TDateTimeField;
      qryIDMOTIVOCANC: TFloatField;
      qryIDSITPART: TFloatField;

      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure btnPlanoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);


   private { Private declarations }

      i, iResult, iPlanilhaResult   : Integer;
      rContrato                     : TDadosContrato;
      vLista                        : TListaItem;
      sErro, sResult                : TStringList;
      fMargem, fReserva             : Currency;
      fSalParticipacao, fSalMantido : Currency;
      fSalAuxDoenca, fSalBenef      : Currency;
      bErro                         : Boolean;
      sMensErro                     : String;


      function SelecionaInscricoes(var sErro: TStringList): Boolean;

      function MontaInscricoes(var rContrato: TDadosContrato; var sErro: TStringList): Boolean;

      procedure CalculaParcelas(qry, qryParticip, qryRecCredito: TwwQuery; sDtCredito, sDtAssinatura,
                                sIdContrato, sCodPortForma: String);

      Function QuitaContratoAnterior(qryQuitacao: TwwQuery; sIdParticip, sDtCredito,
                                     DiaReferencia: String): TResultFunction;

      function GeraContrato: Boolean;

      function ContabilizaConcessao(const iContrato: Int64; var iPlanilhaResult: Integer;
                                    var sResult, sErro : TStringList): Integer;


   public { Public declarations }

   end;



var
  frmExecConcessaoAutomatica: TfrmExecConcessaoAutomatica;



implementation
{$R *.DFM}
uses
   fAguarde, UDataBase, DBaseDados, UDocumento, USistema, ULancContab, uDiasInUteis,
   UCalcEmptmo, uFuncoesEmptmo,
   UModulo, FPrincipal, uMensErro, dEmptmo, UIntegraEmptmo; //UIntegraBack



procedure TfrmExecConcessaoAutomatica.bbtnConfirmarClick(Sender: TObject);
var
   sAnoMesCompet : String;
begin
   inherited;

   (* Verifico se a Data de Assinatura está preenchida. *)
   if Length(Trim(edtDataAssinatura.Text)) = 0 then begin
      MsgDlg('Escolha uma Data de Assinatura antes de iniciar a Concessão Automática.','Empréstimo', mtWarning, [mbOK], 0);
      edtDataAssinatura.SetFocus;
      Exit;
   end;

   (* Limpa Memo de Resultado *)
   MemoResultado.Lines.Clear;

   MemoResultado.Lines.Add('Gerar Contratos, Inicio do Processo : '+TimeToStr(Time));

   sErro   := TStringList.Create;

   if not(SelecionaInscricoes(sErro)) then Exit;

   (* tendo conseguido, começa a iterar pela query *)
   with qry do begin

      First;
      i := 0;

      MostraFormProgresso('Gravando Contratos...', i, qry.RecordCount, True, True);
      Application.ProcessMessages;

      (* Processo todas as inscrições selecionadas. *)
      while not(qry.EOF) do begin

         try
            if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

            bErro := False;

            (* Procedimento que armazena os dados da Inscrição num registro *)
            if not MontaInscricoes(rContrato, sErro) then begin

               MsgDlg('Não foi possível montar a inscrição.' + #13 + IntToStr(rContrato.IDInscricaoEmptmo) +
                      ' ' ,'Empréstimo', mtWarning, [mbOK], 0);

               sErro.Add('Erro ao Gravar EP: ' + IntToStr(rContrato.IDInscricaoEmptmo));
               bErro := True;

            end else begin

               (* função da unit UCalcEmptmo que busca a Margem Consignável do participante *)
               fMargem := CalcEmptmo.BuscaMargem(qryIDPESSOA.AsInteger, qryIDBENEF.AsInteger,
                                                 qryIDREGRAMARGEM.AsInteger,
                                                 fSalParticipacao, fSalMantido, fSalAuxDoenca,
                                                 fSalBenef, False);

               (* função da unit UCalcEmptmo que busca a Reserva de Poupança do participante
                  ou do beneficiário, no caso do pensionista  *)
               fReserva := CalcEmptmo.BuscaReserva(qryIDBENEF.AsInteger, qryIDPATRO.AsInteger,
                                                   qryIDPLANOPREV.AsInteger, qryIDREGRARESERVA.AsInteger,
                                                   qryDATAINSC.AsDateTime, False);

               if not CalcEmptmo.GravaContrato(rContrato) then begin

                  MsgDlg('Não foi possível gravar a inscrição de EP.'+#13
                    + IntToStr(rContrato.IDInscricaoEmptmo)+' ' ,'Empréstimo', mtWarning, [mbOK], 0);
                  sErro.Add('Erro ao Gravar EP: ' + IntToStr(rContrato.IDInscricaoEmptmo));
                  bErro := True;

               end else begin

                  sAnoMesCompet  := FormatDateTime('YYYYMM', rContrato.DataAssinatura);

                  if not(CalcEmptmo.CalculaItens(rContrato,
                                                 0,(* Tipo do item - É parcela 0 na Concessão *)
                                                 0,(* Origem - 0 na Inscrição *)
                                                 0,(* parcela *)
                                                 qryIDSITPART.AsInteger,
                                                 (* Débito - Folha ou Contas a Receber *)
                                                 rContrato.FlgFormaRec,
                                                 rContrato.Txjuros,
                                                 (* Na concessão o Saldo Devedor inicia com Zero e depois de
                                                    calculado será o Valor Solicitado *)
                                                 0,
                                                 0,(* Saldo de Empréstimo Anteriores *)
                                                 rContrato.VlrContrato,
                                                 fMargem,
                                                 fReserva,
                                                 fSalParticipacao,
                                                 fSalMantido,
                                                 fSalAuxDoenca,
                                                 fSalBenef,
                                                 rContrato.DataAssinatura, rContrato.DataAssinatura,
                                                 sAnoMesCompet,
                                                 False, True, False, vLista) )then
                  begin
                     MsgDlg('Não foi possível calcular os itens da Inscrição.'+#13
                       + IntToStr(rContrato.IDInscricaoEmptmo)+' ' ,'Empréstimo', mtWarning, [mbOK], 0);
                     sErro.Add('Erro ao Gravar EP: ' + IntToStr(rContrato.IDInscricaoEmptmo));
                     bErro := True;

                  end else begin

                     if not(CalcEmptmo.GravaMovEmptmo(rContrato,
                                                      vLista,
                                                      0, (* Evento 0 - Concessão *)
                                                      0, (* Será Parcela de número 0 - Zero *)
                                                      (* Ano Competência - Ano da Data de Crédito do Novo Contrato *)
                                                      DiasInUteis.ExtraiAno(rContrato.DataCredito),
                                                      (* Mês Competência - Mês da Data de Crédito do Novo Contrato *)
                                                      DiasInUteis.ExtraiMes(rContrato.DataCredito),
                                                      (* Ano Cobrança - Ano da Data de Crédito do Novo Contrato *)
                                                      DiasInUteis.ExtraiAno(rContrato.DataCredito),
                                                      (* Mês Cobranca - Mês da Data de Crédito do Novo Contrato *)
                                                      DiasInUteis.ExtraiMes(rContrato.DataCredito),
                                                      rContrato.NumParcelas,
                                                      (* DataPrevista -> Data do Crédito*)
                                                      rContrato.DataCredito,
                                                      (* Data última atualização *)
                                                      rContrato.DataCredito,
                                                      True(* Mostra o Form de Progresso *)
                                                     ) ) then
                     begin
                        MsgDlg('Não foi possível gravar a inscrição do EP.'+#13
                          + IntToStr(rContrato.IDInscricaoEmptmo)+' ' ,'Empréstimo', mtWarning, [mbOK], 0);
                        sErro.Add('Erro ao Gravar EP: ' + IntToStr(rContrato.IDInscricaoEmptmo));
                        bErro := True;

                     end else begin

                        if ( (ParametrosSistema) and (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) ) then
                        begin
                           iResult := ContabilizaConcessao(rContrato.IDContratoEmptmo,
                                                             iPlanilhaResult,
                                                             sResult, sErro);
                           if iResult <> 0  then begin
                              (* Contabilização com Erro *)
                              bErro := True;
                              case iResult of
                                 -1 : sMensErro := '[ ERRO ao tentar selecionar os itens a contabilizar ]';
                                 -2 : sMensErro := '[ Query não retornou itens a contabilizar ]';
                                 -3 : sMensErro := '[ ERRO ao tentar criar tabela para agrupamento ]';
                                 -4 : sMensErro := '[ ERRO ao buscar Parâmetros de Integração ]';
                                 -5 : sMensErro := '[ ERRO ao fazer o Lançamento Contábil ]';
                                 -6 : sMensErro := '[ ERRO no Período Contábil ]';
                                 -7 : sMensErro := '[ Processo interrompido pelo usuário sem contabilização ]';
                              end;(* case *)
                              sMensErro := sMensErro + #13 +
                                           sErro.Strings[sErro.Count -1];
                           end;(* if *)
                        end;
                     end;
                  end;
               end;
            end;(* if MontaInscrições *)

            if dtmBaseDados.dbBaseDados.InTransaction then
            begin
               if not bErro then
                  dtmBaseDados.dbBaseDados.Commit
               else
                  dtmBaseDados.dbBaseDados.Rollback
            end;
            inc(i);
            MemoResultado.Lines.Add('Inscrição concedida. :' + IntToStr(rContrato.IDInscricaoEmptmo));
            AndaFormProgresso(i);
            qry.Next;
            Continue;
         finally
            MemoResultado.Lines.AddStrings(sErro);
            MemoResultado.Lines.Add(' ');
            MemoResultado.Lines.Add('Final do Processo : '+TimeToStr(Time));
            sErro.Free;
            pgcConcessao.ActivePage := tbsResultado;
            EscondeFormProgresso;
            Repaint;
         end;(* try..finally *)
      end;(* while *)
   end;
end;



function TfrmExecConcessaoAutomatica.SelecionaInscricoes(var sErro: TStringList): Boolean;
begin
   (* Retorno da Função *)
   Result := True;

   try

      MostraEspera('Selecionando Inscrições...');
      try
         LimpaParametros(qry);
         (* Preenche Plano Previdenciário *)
         if Trim(EdPlano.Text) <> '' then
            qry.ParamByName('PIDPLANOPREV').AsInteger := StrToInt(MsPlano.ValoresChave[0]);

         qry.Open;

      except
         on E:Exception do begin
            sErro.Add('ERRO ao tentar selecionar Inscrições');
            sErro.Add(E.Message);
            Result := False;
            Exit;
         end;(* on *)
      end;(* try..except *)

   finally
      EscondeEspera;
   end;(* try..finally *)


   (* Verifico se existem Inscrições a serem processadas. *)
   if qry.IsEmpty then begin
      sErro.Add('Não existem Inscrições a serem processadas');
      MemoResultado.Lines.AddStrings(sErro);
      MemoResultado.Lines.Add(' ');
      MemoResultado.Lines.Add('Final do Processo : '+TimeToStr(Time));
      pgcConcessao.ActivePage := tbsResultado;
      sErro.Free;
      Result := False;
      Exit;
   end;
end;

function TfrmExecConcessaoAutomatica.MontaInscricoes(var rContrato: TDadosContrato;
                                                     var sErro: TStringList): Boolean;
var sMes, sAno    : String;
begin
(* Procedimento que armazena os dados da Inscrição num registro que é
   passado como parâmetro para a função GravaContrato da unit UCalcEmptmo
   que insere os dados na tabela Contrato e se obtiver sucesso Contabiliza
   o Contrato *)

   (* Retorno da Função *)
   Result := True;

   CalcEmptmo.LimpaRegistroContrato(rContrato);

   (* É nulo na Concessão *)
   rContrato.IDContrQuitacao := -1;

   rContrato.IdPessoa          := qryIDPESSOA.AsInteger;
   rContrato.IDTipoContrEmptmo := qryIDTipoContrEmptmo.AsInteger;
   rContrato.IDTipoEmptmo      := qryIDTIPOEMPTMO.AsInteger;
   rContrato.IdPlanoPrev       := qryIDPLANOPREV.AsInteger;
   rContrato.IdPatro           := qryIDPATRO.AsInteger;

   (* Número da Inscrição *)
   rContrato.IDInscricaoEmptmo := qryIDInscricaoEmptmo.AsInteger;

   (* É nulo *)
   rContrato.IDVerba := -1;
   (* Beneficiário do Contrato
      IDBENEF = IDPESSOA -> do Titular no caso de estar vivo
      e do Beneficiário no caso de Pensionista *)
   rContrato.IdBenef := qryIDBENEF.AsInteger;

//   if qryFLGFORMAPAG.AsString = 'R' then begin
   if qryFLGFORMAPAG.AsString = 'C' then begin
      rContrato.IDCBancaria := qryIDCBANCARIA.AsInteger;
   end else begin
      (* É nulo *)
      rContrato.IDCBancaria := -1;
   end;

   (* É nulo *)
   rContrato.IDMotivoCanc := -1;

{
   if ParametrosSistema then begin
      if dtmEmptmo.qryParamEmptmoFLGFORMAPORT.AsString = 'F' then begin
         (* Será indicado a Forma de Pagamento *)
         rContrato.CodFormaPag := dtmEmptmo.qryParamEmptmoCODFORMAPAGTO.AsInteger;
      end else begin
         (* Será indicado o PortadorForma *)
         rContrato.PortFormaPag := dtmEmptmo.qryParamEmptmoPORTFORMAPAGTO.AsInteger;
      end;(* if FLGFORMAPORT *)
   end;

   rContrato.PortFormaRec := qryPORTFORMAREC.AsInteger;
}

   rContrato.CodFormaPag  := -1;
   if qryCODFORMAPAG.AsString <> '' then begin
      rContrato.CodFormaPag  := qryCODFORMAPAG.AsInteger;
   end;

   rContrato.PortFormaPag := -1;
   if qryPORTFORMAPAG.AsString <> '' then begin
      rContrato.PortFormaPag := qryPORTFORMAPAG.AsInteger;
   end;

   rContrato.PortFormaRec := -1;
   if qryPORTFORMAREC.AsString <> '' then begin
      rContrato.PortFormaRec := qryPORTFORMAREC.AsInteger;
   end;

   (* Número de Parcelas *)
   rContrato.NumParcelas := qryNUMPARCELAS.AsInteger;

   sMes := FormatDateTime('MM', qryDATAINSC.AsDateTime);
   sAno := FormatDateTime('YYYY', qryDATAINSC.AsDateTime);

   (* FLGFORMAREC = C -> indicando que o Débito é pelo Contas a Receber
                    F -> indicando que o Débito é pela Folha *)
   rContrato.flgFormaRec  := qryFLGFORMAREC.AsString;


   (* FLGFORMAPAG = C -> indicando que o Crédito é pelo Contas a Pagar
                    F -> indicando que o Crédito é pela Folha *)
   rContrato.flgFormaPag := qryFLGFORMAPAG.AsString;

   try

      (* Data em que o empréstimo será creditado usando a função BuscaData da
         unit UCalcEmptmo *)
      rContrato.DataCredito := CalcEmptmo.BuscaData('C', (* Crédito *)
                                                    (* Tipo de cobrança *)
                                                    rContrato.FlgFormaRec,
                                                    qryFLGINTERNO.AsString,
                                                    rContrato.IDPatro,
                                                    rContrato.IDPlanoPrev,
                                                    1, (* Parcelas *)
                                                    qryDATAINSC.AsDateTime);

      sMes := FormatDateTime('MM', rContrato.DataCredito);
      sAno := FormatDateTime('YYYY', rContrato.DataCredito);

      (* Data do pagamento da Primeira Parcela do Contrato usando a função
         BuscaData da unit UCalcEmptmo *)
      rContrato.DataPrimParc := CalcEmptmo.BuscaData('N', (* Normal *)
                                                     rContrato.FlgFormaRec, (* Tipo de cobrança *)
                                                     qryFLGINTERNO.AsString,
                                                     rContrato.IDPatro,
                                                     rContrato.IDPlanoPrev,
                                                     2, (* Parcelas, isto é mais de 1 parcela *)
                                                     rContrato.DataCredito);

      (* Data da Situação do Contrato como a data escolhida pelo usuário *)
      rContrato.DataSituacao := edtDataAssinatura.Date;

      (* Data de Assinatura do Contrato como a data escolhida pelo usuário *)
      rContrato.DataAssinatura := edtDataAssinatura.Date;

      (* Data nula *)
      rContrato.DataCanc :=  0;

      (* Valor do Contrato *)
      rContrato.VlrContrato := qryVLRSOLIC.AsFloat;

      (* função da unit UCalcEmptmo que busca a Taxa de Juros. Será utilizada
         a regra cadastrada na tabela TIPOCONTREMPTMO para buscar a Taxa de Juros *)
      rContrato.Txjuros := CalcEmptmo.BuscaTxJuros(rContrato,
                                                   qryIDREGRAJURCONC.AsInteger,
                                                   0,(* É parcela 0 na Concessão *)
                                                   rContrato.DataCredito,
                                                   (* Taxa de Juros Anterior é 0 na concessão *)
                                                   0,
                                                   (* Saldo Devedor Anterior é o Valor Solicitado
                                                      na concessão*)
                                                   rContrato.VlrContrato,
                                                   False)(* NÃO Mostra a mensagem de erro *);

      (****************************************************************************
       * FLGSITUACAO = 'A' -> 'Ativo'             -> Em curso normal              *
       *               'C' -> 'Cancelado'         -> por opção do usuário         *
       *               'E' -> 'Encerrado'         -> por quitacao no prazo normal *
       *               'R' -> 'Refinanciado'      -> Refinanciado                 *
       *               'Q' -> 'Quitado'           -> por quitacao solicitada      *
       *               'S' -> 'Suspenso'          -> Inadimplencia                *
       *               'K' -> 'Pend. de Quitação' -> Envio p/ cobrança            *
       ****************************************************************************)
      rContrato.FlgSituacao := 'A';


   except
      on E:Exception do begin
         sErro.Add('Erro ao calcular dados da inscrição: ' + IntToStr(rContrato.IDInscricaoEmptmo));
         sErro.Add(E.Message);
         Result := False;
      end;(* on *)
   end;(* try..except *)

end;














(****************************************************************************************************
    CalculaParcelas()
    Descrição:  Calcula os valores das parcelas de um contrato.
    Entrada  :  qry  - Query com as informações sobre a inscrição que dará origem ao contrato.
                qryParticip   - Query com as informações do participante.
                qryRecCredito - Query com as informações sobre os itens de recebimento do tipo de contrato do contrato.
                sDtCredito    - Data de crédito do contrato.
                sDtAssinatura - Data de assinatura do contrato.
                sIdContrato   - N°. do contrato.
                sCodPortForma - Tipo do documento.
    Saída    :  void.
****************************************************************************************************)
procedure TfrmExecConcessaoAutomatica.CalculaParcelas(qry, qryParticip, qryRecCredito: TwwQuery; sDtCredito,
                                                  sDtAssinatura, sIdContrato, sCodPortForma: String);
var
   indPs           ,
//   ind2            ,
   indGera         ,
   iIdParticipante ,
   iIdPatrocin     ,
   iIdPlanoPrev    : Integer;
//   iPos            : Integer;
   sValor          ,
   sDtPag          ,
   sAno            ,
   sMes            ,
   sProxData       ,
   sTpCob          ,
   sMesRef         ,
   sSit            ,
   sSaldoDev       ,
   sDtPrimPagto    ,
   sCarencia       ,
   sJuros          ,
   sSaldoConvertido: String;  //VERIFICAR ONDE PEGAR ESTA INFORMAÇÃO.
   bCriaReg        : Boolean;
   dValorDestacado : Double;  //Soma dos valores dos itens destacados.  Fred 03/10/2000.
   wDia            ,
   wMes            ,
   wAno            : Word;
begin

     bCriaReg   := True;
     indGera    := -1;
//     LinSimula  := TStringList.Create;

     (* Pego alguns dados do participante. *)
     iIdParticipante := qryParticip.ParamByName('IDPESSOA').AsInteger    ;
     iIdPatrocin     := qryParticip.ParamByName('IDPESSJUR').AsInteger   ;
     iIdPlanoPrev    := qryParticip.ParamByName('IDPLANOPREV').AsInteger ;

     (* Gravo a parcela de n°. zero na VALEFETREC. *)
     DecodeDate(StrToDate(sDtCredito), wAno, wMes, wDia);
     sMesRef := IntToStr(wAno);
     if wMes < 10 then
        sMesRef := sMesRef + '/0' + IntToStr(wMes)
     else
        sMesRef := sMesRef + '/' + IntToStr(wMes);
     dValorDestacado := 0;
//     GravaValEfetRec(qryAux, sIdContrato, sMesRef, sDtCredito, OraNumero(FloatToStr(dValorDestacado)), IntToStr(indPS), sSaldoDev, sCodPortForma);
     (* Fred - (fim). *)

     sAno    := Copy(sDtPrimPagto, 7, 4);
     sMes    := Copy(sDtPrimPagto, 4, 2);
     sMesRef := sAno + '/' + sMes;
     sDtPag  := sDtPrimPagto;
     sTpCob  := 'F'; //ASSUMI QUE A COBRANÇA VAI SER FEITA EM FOLHA.  VER COMO ACHAR ESTA INFORMAÇÃO.

     (* Pego a situação do participante. *)
     sSit := qryParticip.FieldByName('FLGINTERNO').AsString;

     for indPS := 1 to Trunc(qry.FieldByName('PARCELAS').AsInteger) do
     begin
          (* Fred - 25/10/2000 - (início) *)
          (* Processo as mensagens do Windows e vejo se o botão cancelar foi acionado. *)
          Application.ProcessMessages;
{          if bCancelou then
          begin
               if dtmBaseDados.dbBaseDados.InTransaction then
                  dtmBaseDados.dbBaseDados.Rollback ;
               Exit;
          end;
}          (* Fred - (fim). *)

          dValorDestacado := 0;  //Fred - 03/10/2000.

          qryRecCredito.First;
{          while not qryRecCredito.EOF do
          begin
               if (qryRecCredito.FieldByName('IDREGRACALC').AsString <> '')                                                             and
                  (qryRecCredito.FieldByName('FLGCOBRALIB').AsInteger = 0)                                                              then
               begin
                    for ind2 := 0 to LinSimula.Count - 1 do
                    begin
                         mRegSimula  := (LinSimula.Objects[ind2] as TRegSimula);
                         if mRegSimula.IdItem = qryRecCredito.FieldByName('IDItemEmptmo').AsInteger then
                         begin
                              bCriaReg := False;
                              Break;
                         end
                         else bCriaReg := True;
                    end; //for

                    if bCriaReg then
                    begin
                         mRegSimula            := TRegSimula.Create;
                         mRegSimula.IdItem     := qryRecCredito.FieldByName('IDItemEmptmo').AsInteger;
                         mRegSimula.NumSeq     := qryRecCredito.FieldByName('seqcalculo').AsInteger;
                         mRegSimula.Valor      := '0';
                         mRegSimula.Periodo    := qryRecCredito.FieldByName('periodicidade').AsInteger;
                         mRegSimula.FlgTemp    := qryRecCredito.FieldByName('flgTemporario').AsInteger;
                         mRegSimula.UltData    := sDtPag;
                         mRegSimula.DataAnt    := sDtPag;
                         mRegSimula.AbateSd    := qryRecCredito.FieldByName('controlasaldo').AsInteger;

                         if (mRegSimula.FlgTemp = 0) and (qryRecCredito.FieldByName('numvezes').AsInteger = 0) then
                            mRegSimula.NumVezes := -1
                         else
                            mRegSimula.NumVezes := qryRecCredito.FieldByName('numvezes').AsInteger;

                         inc(indGera,1);
                         LinSimula.AddObject(IntToStr(indGera),mRegSimula);
                    end; //Cria regra?

                    if mRegSimula.UltData = sDtPag then
                    begin
                         mRegSimula.DataAnt := sDtPag;

                         mRegSimula.Valor := RodaRegra(qry.FieldByName('PARCELAS').AsInteger, indPS, sDtPag, sSaldoDev,
                                                       qry.FieldByName('DATAINSC').AsString, sSaldoConvertido,
                                                       sJuros, qry.FieldByName('IDTipoContrEmptmo').AsString,
                                                       IntToStr(iIdParticipante), IntToStr(mRegSimula.IdItem), IntToStr(iIdPatrocin),
                                                       qryRecCredito.FieldByName('IDREGRACALC').AsString, IntToStr(iIdPlanoPrev), LinSimula);

                         (* Fred - 03/10/2000 - (início)                                                         *)
                         (* Somo o valor dos itens destacados para ser usado como valor previsto de recebimento. *)
                         if qryRecCredito.FieldByName('FLGDESTACADO').AsInteger = 1 then
                            dValorDestacado := dValorDestacado + StrToFloat(ClienteNumero(mRegSimula.Valor));
                         (* Fred - (fim). *)

                         GravaItemRec(qryAux, qryTpContr, qryRecCredito, IntToStr(mRegSimula.IdItem), '0', sIdContrato,
                                      sMesRef, sDtPag, mRegSimula.Valor, IntToStr(indPS), '', 1);

                         if mRegSimula.FlgTemp = 1 then
                         begin
                              if mRegSimula.NumVezes = 0 then
                              begin
                                   sProxData := IncData(sDtPag,0,mRegSimula.Periodo-1,0);
                                   sMes      := Copy(sProxData,4,2);
                                   sAno      := Copy(sProxData,7,4);
                                   sProxData := CritDataEmptmo(qryAux,qryParticip.ParamByName('IDPESSJUR').AsString,
                                                               qryParticip.ParamByName('IDPLANOPREV').AsString,sSit,'N',sMes,sAno,sTpCob,
                                                               sDtPrimPagto, indPS + 1);
                                   mRegSimula.UltData  := sProxData; // guardando a proxima vez de cobrar o item
                              end
                              else begin
                                   mRegSimula.NumVezes := (mRegSimula.NumVezes) - 1;
                                   if mRegSimula.NumVezes = 0 then
                                      mRegSimula.NumVezes := -1
                                   else begin
                                        sProxData := IncData(sDtPag, 0, mRegSimula.Periodo - 1, 0);
                                        sMes      := Copy(sProxData, 4, 2);
                                        sAno      := Copy(sProxData, 7, 4);
                                        sProxData := CritDataEmptmo(qryAux,qryParticip.ParamByName('IDPESSJUR').AsString,
                                                                    qryParticip.ParamByName('IDPLANOPREV').AsString,sSit,'N',sMes,sAno,sTpCob, sDtPrimPagto, indPS + 1);
                                        mRegSimula.UltData  := sProxData;
                                   end;
                              end; //Numvezes = 0
                         end
                         else begin
                              sMes      := Copy(sDtPag,4,2);
                              sAno      := Copy(sDtPag,7,4);
                              sProxData := CritDataEmptmo(qryAux,qryParticip.ParamByName('IDPESSJUR').AsString,
                                           qryParticip.ParamByName('IDPLANOPREV').AsString,sSit,'N',sMes,sAno,sTpCob,
                                           sDtPrimPagto, indPS + 1);
                              mRegSimula.UltData := sProxData;
                         end;//flgTemp?
                    end;//ultData = DtPag?
               end;//itens

               qryRecCredito.Next;

          end; // se é item a ser cobrado na parcela

          RecalculaSaldo(LinSimula, sSaldoDev);  (* <-- Fred 25/10/2000. *)

          (* Gravo a parcela na valefetrec. *)
          GravaValEfetRec(qryAux, sIdContrato, sMesRef, sDtPag, OraNumero(FloatToStr(dValorDestacado)), IntToStr(indPS), sSaldoDev, sCodPortForma);

          sMes    := Copy(sDtPag,4,2);
          sAno    := Copy(sDtPag,7,4);
          sDtPag  := CritDataEmptmo(qryAux,qryParticip.ParamByName('IDPESSJUR').AsString,
                     qryParticip.ParamByName('IDPLANOPREV').AsString,sSit,'N',sMes,sAno,sTpCob,
                     sDtPrimPagto, indPS + 1);
          sAno    := Copy(sDtPag,7,4);
          sMes    := Copy(sDtPag,4,2);
          sMesRef := sAno+'/'+sMes;

          (* Incremento a Progress Bar. *)
          pgbParcelas.StepIt;
}

     end;  //  quantos numeros de parcela
end;








procedure TfrmExecConcessaoAutomatica.FormActivate(Sender: TObject);
begin
  inherited;
  edtDataAssinatura.ButtonWidth := 21;
end;



procedure TfrmExecConcessaoAutomatica.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

  (* Invalido as últimas alterações. *)
  if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Rollback ;

  (* Limpa Memo de Resultado *)
  MemoResultado.Lines.Clear;

end;


function TfrmExecConcessaoAutomatica.GeraContrato: Boolean;
var i: Integer;
    vListaItensContrato  : TListaItem;
//    rContrato : TDadosContrato;
    sErro: TStringList;
begin
(* Gera e grava novos contratos para inscrições ativas e não pendentes. *)

   Result := True;


{               if (ResultFunction.Resultado = False) then begin
                  (* Caso não tenha conseguido Quitar os Contratos Guarda Log *)
                  MemoResultado.Lines.Add('-------------------------------------------------------');
                  MemoResultado.Lines.Add('Inscrição Numero "'+
                                      qry.FieldByName('IDInscricaoEmptmo').AsString+
                                      '" Rejeitada, Motivo;');
                  MemoResultado.Lines.Add(' Não foi possivel quitar o(s) Contrato(s) anterior(es). ');
                  qry.Next;
                  Continue;
               end;
               (* Caso valor da divida maior que o Solicitado Rejeita *)
               if (ResultFunction.Valor >= qry.FieldByName('VALORSOLIC').AsFloat) then begin
               (* Caso não tenha conseguido Quitar os Contratos Guarda Log *)
                  MemoResultado.Lines.Add('-------------------------------------------------------');
                  MemoResultado.Lines.Add('Inscrição Numero "'+
                                       qry.FieldByName('IDInscricaoEmptmo').AsString+
                                       '" Rejeitada, Motivo;');
                  MemoResultado.Lines.Add('Valor Solicitado menor do que divida anterior. ');
                  Inc(wTotErros);
                  (* Próxima inscrição e Volta para Inicio do Loop *)
                  qry.Next;
                  Continue;
             end;

         (* Grava Contrato
            função da unit UCalcEmptmo que grava as informações pertinentes a um contrato, tendo
            como saída True se a operação foi bem sucedida e False caso negativo *)
         if CalcEmptmo.GravaContrato(rContratoAserGravado) then begin
            (* Contrato Gravado com Sucesso *)

            (* Utiliza a função BuscaValorItem da unit UCalcEmptmo para pegar a parcela e
               os itens de concessão com seus respectivos valores, em relação ao número de
               parcelas escolhida pelo participante *)
   {DINIZ         vListaItensContrato := CalcEmptmo.CalculaItens(rContratoAserGravado.IdTitular,
                                                           rContratoAserGravado.IdPessJur,
                                                           rContratoAserGravado.IdPlanoPrev,
                                                           rContratoAserGravado.IDTipoContrEmptmo,
                                                           rContratoAserGravado.IdTipoEmptmo,
                                                           rContratoAserGravado.SeqProposta,
                                                           rContratoAserGravado.NumParcelas,
                                                           rContratoAserGravado.FlgTipoCobr,
                                                           rContratoAserGravado.Txjuros,
                                                           rContratoAserGravado.ValorContr,
                                                           rContratoAserGravado.DataAssin,
                                                           rContratoAserGravado.DataRefValor,
                                                           False)(* Mostra a mensagem de erro *);

         (* função da unit UCalcEmptmo que grava as informações pertinentes aos
            itens de um contrato na tabela ITEMRECCONTR e se for o caso, chama a
            função que grava o Histórico do Movimento na tabela HISTMOVEMPTMO.
            A saída será True se a operação foi bem sucedida e False caso negativo *)
            if not CalcEmptmo.GravaMovEmptmo(rContrato,
                                           vListaItensContrato,
                                           1, (* Evento - gravo somente os itens de concessão *)
                                           (* Será Parcela de número 0 - Zero *)
                                           0,
                                           (* Ano Competência - Ano da Data de Crédito *)
                                           StrToInt(Copy(FormatDateTime('DD/MM/YYYY',rContrato.DataCredito),7,4)),
                                           (* Mês Competência - Mês da Data de Crédito *)
                                           StrToInt(Copy(FormatDateTime('DD/MM/YYYY',rContrato.DataCredito),4,2)),
                                           (* Ano Cobrança - Ano da Data de Crédito *)
                                           StrToInt(Copy(FormatDateTime('DD/MM/YYYY',rContrato.DataCredito),7,4)),
                                           (* Mês Cobranca - Mês da Data de Crédito *)
                                           StrToInt(Copy(FormatDateTime('DD/MM/YYYY',rContrato.DataCredito),4,2)),
                                           (* DataPrevista -> Data do Crédito*)
                                           rContrato.DataCredito,
                                           rContrato.DataCredito,
                                           True(* Mostra o Form de Progresso *)
                                           )

   {verificar a data atualiza

             (* Faz a contabilização. *)
             VaiTmpDesc(qryAux, qryAux2, qryRegra,
                        qryContrato.FieldByName('IDPATRO').AsString,
                        qryContrato.FieldByName('IDPESSOA').AsString,
                        qryContrato.FieldByName('IDPLANOPREV').AsString,
                        qryContrato.FieldByName('IDContratoEmptmo').AsString,
                        qryTpContr.FieldByName('IDFUNDACAO').AsString,
                        qryContrato.FieldByName('DATAASSIN').AsString,
                        qryAux.FieldByName('DATAPREVISTA').AsString,
                        0);

             (* Fred - 25/10/2000 - (início) *)



            then begin
               (* Gravação dos Itens de Contrato com problemas *)

//               Inc(wTotErros);
               (* Próxima inscrição e Volta para Inicio do Loop *)
//               qry.Next;
//               Continue;

            end;(* if GravaItensContrato *)

         end
         else begin
            (* Gravação do Contrato com problemas *)

            Inc(wTotErros);
            (* Próxima inscrição e Volta para Inicio do Loop *)
            qry.Next;
            Continue;

         end;


             (* Calculo o valor das parcelas e dos itens de recebimento. *)
   //          CalculaParcelas(qry, qryParticip, qryRecCredito, sDtCredito, sDtAssinatura, sIdContr, sCodPortForma);

             (* Processo as mensagens do Windows e vejo se o botão cancelar foi acionado. *)
             Application.ProcessMessages;
   {          if bCancelou then
             begin
                  if dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.Rollback ;
                  Exit;
             end;
    }         (* Fred - (fim). *)

             (* Calcula os Itens de Recebimento cobrados na liberação. *)
   {          GeraItensNaLiberacao(qry, qryTpContr, qryRegra, qryRecCredito,
                                  qry.FieldByName('VALORPARCELA').AsString,
                                  FloatToStr((qry.FieldByName('VALORSOLIC').AsFloat-
                                              ResultFunction.Valor)),
                                  qry.FieldByName('DATAINSC').AsString,
                                  FloatToStr((qry.FieldByName('VALORSOLIC').AsFloat-
                                              ResultFunction.Valor)),
                                  qry.FieldByName('PARCELAS').AsString,
                                  qry.FieldByName('TXJUROS').AsString,
                                  FloatToStr((qry.FieldByName('VALORSOLIC').AsFloat-
                                              ResultFunction.Valor)),
                                  sIdContr,
                                  qry.FieldByName('SALDODEVINTERNET').AsString,
                                  ckbDividasInternet.Checked);
   }

         (* função da unit UCalcEmptmo que Atualiza a Situação da Inscrição para
            'E' -> 'Contrato Associado' -> Já utilizada em contrato, tendo como saída
            True se a operação foi bem sucedida e False caso negativo *)
   //      CalcEmptmo.AtualizaFlgSituacao(qryIDInscricaoEmptmo.AsInteger);

         (* Próxima inscrição. *)
   {      qry.Next;

         (* Finalizo a Transaction. *)
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
         end;

        (* Inclui Totais no Log *)
        MemoResultado.Lines.Add('-------------------------------------------------------');
        MemoResultado.Lines.Add('Numero Total de Processados .:  "'+ IntToStr(qry.RecordCount) +'"');
        MemoResultado.Lines.Add('Numero Total de Rejeitados  .:  "'+ IntToStr(wTotErros) +'"');

        (* Caso Existam Inscrições Rejeitadas Exibe Mensagem *)
        if (wTotErros > 0) then begin
          MsgDlg('Existem Inscrições rejeitadas.','Empréstimo',mtWarning,
                 [mbOk],0);
        end;
     }
end;




(****************************************************************************************************
    QuitaContratoAnterior()
    Descrição:  Faz a quitação do saldo devedor anterior do participante.
    Entrada  :  sIdParticip - Identificação do participante
                sDtCredito  - Data de crédito do empréstimo.
                DiaReferencia - Dia de Referencia para Calculos de Prorrata  (Serpros)
    Saída    :  Boolean (Quitado ou Não )
****************************************************************************************************)
Function TfrmExecConcessaoAutomatica.QuitaContratoAnterior(QryQuitacao: TwwQuery;
                                                       sIdParticip,  // Augusto 05/04/2001
                                                       sDtCredito, DiaReferencia: String):TResultFunction;
var
  sSQL  : String;
  eValor: Extended;
//  SaldoEmprestimo : TCalculaSaldo;
begin
     (* Quita contratos anteriores *)
//     SaldoDevEmp(StrToInt(sIdParticip), eValor, sSQL, sDtCredito, False);

  (* Inicia Resultado da Funcao *)
  Result.Resultado := False;
  (* Inicia Mensagem de Retorno *)
  Result.Mensagem := '';
  (* Inicia Valor da Quitacao *)
  Result.Valor := 0;

  (* Nova Rotina de Quitação Automática *)
  (*------------------------------------*)

  (* Busca Contratos do Participante *)
  if FazQuery(QryQuitacao, 'SELECT * FROM CONTRATO '+
                           'WHERE IDPESSOA       = '+ sIdParticip    +' AND '+
                           '      SITUACAOCONTR  = '+ QuotedStr('A') +'     '+
                           'ORDER BY IDContratoEmptmo ')
  then begin
   (* Busca Saldo atualizado do Emprestimo *)
//   SaldoEmprestimo := CalculaSaldo(QryQuitacao.FieldByName('IDContratoEmptmo').AsInteger,
//                                   sDtCredito, DiaReferencia , 0, True);
   (* Quita Contrato de Emprestimo *)
//   if not ConfirmarDadosQuitacao(SaldoEmprestimo, True) then begin
//     Result.Resultado := False;
//     Exit;
//   end;
  end;
  (* Seta Mensagem de Retorno *)
  Result.Mensagem := '';
  (* Seta Valor da Quitacao *)
//  Result.Valor := SaldoEmprestimo.ValorAPagar;
  (* Seta Resultado da Funcao OK*)
  Result.Resultado := True;
end;



procedure TfrmExecConcessaoAutomatica.FormCreate(Sender: TObject);
begin
  inherited;
//  Show;
   edtDataAssinatura.Date := Now;
end;

procedure TfrmExecConcessaoAutomatica.btnPlanoClick(Sender: TObject);
begin
   inherited;

   try

      MsPlano.Executar;

      if MsPlano.RetornouValor then
         EdPlano.Text := MsPlano.ValoresChave[1];

   except

      EdPlano.Text := '';

   end;(* try .. except *)

end;

function TfrmExecConcessaoAutomatica.ContabilizaConcessao(const iContrato: Int64;
                                                          var iPlanilhaResult: Integer;
                                                          var sResult, sErro : TStringList): Integer;
var sSql, sMensagem: String;
begin

   sSql :=
   'SELECT ' +
   '  HME.IDHISTMOVEMPTMO  , HME.IDCONTRATOEMPTMO, HME.IDITEMEMPTMO, ' +
   '  HME.HMEFORMACOBRANCA , HME.HMEVLRPREVISTO  , ' +
   '  CNT.IDTIPOCONTREMPTMO, CNT.IDPLANOPREV     , CNT.IDPATRO, ' +
   '  ITC.TIPCODIGO ' +
   'FROM '  +
   '  HISTMOVEMPTMO   HME, ' +
   '  CONTRATOEMPTMO  CNT, ' +
   '  ITEMXTIPOCONTR  ITC, ' +
   '  TIPOCONTREMPTMO TIP, ' +
   '  TIPOEMPTMO      TEM '  +
   'WHERE ' +
   '  ( HME.IDCONTRATOEMPTMO = '+ IntToStr(iContrato) + ' ) AND ' +
   '  ( TEM.IDEMPRESAPROP    = 1 ) AND ' +
   '  ( HME.HMETIPOMOV       = 2 ) AND ' +
   '  ( ( HME.HMECENTRALIZA  = 0 ) OR ( HME.HMECENTRALIZA IS NULL ) ) AND ' +
   '  ( HME.IDCONTRATOEMPTMO  = CNT.IDCONTRATOEMPTMO  ) AND ' +
   '  ( CNT.IDTIPOCONTREMPTMO = TIP.IDTIPOCONTREMPTMO ) AND ' +
   '  ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) AND ' +
   '  ( CNT.IDTIPOCONTREMPTMO = ITC.IDTIPOCONTREMPTMO ) AND ' +
   '  ( HME.IDITEMEMPTMO      = ITC.IDITEMEMPTMO )';

   sMensagem := 'Concessão Automática EP - ' + IntToStr(iContrato);

   Result := IntegraEmptmo.ContabilizaItens('C', 'N', sSql, sMensagem,	(* Histórico *)
                                            edtDataAssinatura.Date,			(* Data do Lançamento *)
                                            sResult(* Acertos *), sErro (* Erros *),
                                            iPlanilhaResult); 				(* Planilha *)
end;

procedure TfrmExecConcessaoAutomatica.FormShow(Sender: TObject);
begin
  inherited;
   pgcConcessao.ActivePage := tbsOpcoes;
end;

end.

