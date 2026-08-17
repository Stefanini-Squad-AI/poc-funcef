unit UEventoImovel;


interface

uses
  SysUtils, Math, wwQuery, wwDBGrid, Forms, ComCtrls, StdCtrls, Mask, Dialogs,
  MontaSelect, Classes, uCtrlImovel, uComunsImobiliario, uVerificaPreenchimento;


type
   TEventoImovel = Class

   private
      procedure MarcaRescisao(iContrato: integer; dData: TDateTime);

   public

      // ===========================================================================================
      //    Manipulação de Eventos
      // ===========================================================================================

      function RegistraEvento(const iImovel, iContrato, iUsuario, iIndice, iHistCartInv: int64;
               const dDataEvento, dDataProx: TDateTime; const sTipoEvento, sCabecalho, sDescricao: string;
               const fPercent, fVlrAnt, fVlr: double; const bMostraMsg: boolean): int64;

      function ExcluiEvento(const iEventoImovel: int64; const bMostraMsg: boolean): integer;

      // Função para alterar o status de um Imóvel: retorna o Status resultante
      function AlteraSituacaoImovel(const iImovel: int64; const sSituacao: string): shortint;


      // ===========================================================================================
      //    Movimentações Contratuais
      // ===========================================================================================

      // função que executa todo o processamento ligado à rescisão:
      // ocupação / desocupação
      function RescisaoContratual(const iContrato: integer; dData: TDateTime): boolean;

      function ReajRenegContrato(const iContrato,iIndice, iPeriodicidade: integer;
               const fValorAnterior, fValorAtual: double; const dDataReaj, dDataProx: TDateTime;
               const bMostraMsg: Boolean; const sTipoMov, sDescricao: string): integer;

      function RescindeContrato(const iContrato: integer; dDataRescisao: TDateTime; sObs: TStrings;
               bExcluiLancamentos, bMostraMsg: boolean): integer;

      function ProrrogaContrato(const iContrato: integer; const dDataMovimento,dDataProrrogacao: TDateTime;
               const bMostraMsg: boolean): integer;

      // ===========================================================================================

   end;



var
  EventoImovel : TEventoImovel;



implementation

uses
   dBaseDados, uDataBase, uSistema, uMensErro, uFuncoesImob, dEventoImovel, dImobiliario;



function TEventoImovel.RegistraEvento(const iImovel, iContrato, iUsuario, iIndice, iHistCartInv: int64;
         const dDataEvento, dDataProx: TDateTime; const sTipoEvento, sCabecalho, sDescricao: string;
         const fPercent, fVlrAnt, fVlr: double; const bMostraMsg: boolean): int64;
var
   iEvento     : int64;
   bTransacao  : boolean;
   IdTpoEvento : Integer;
begin
  // verifica se há transação em andamento; se não houver, inicia uma
  if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
     bTransacao := True;
     StartTransacao;
  end else begin
     bTransacao := False;
  end;

  try
    iEvento := LeUltRegistro(nil, 'EVENTOIMOVEL');

    LimpaParametros(dtmEventoImovel.qryInsertEventoImovel);
    with dtmEventoImovel do
    begin
      qryInsertEventoImovel.ParamByName('PIDEVENTOIMOVEL').AsInteger := iEvento;
      qryInsertEventoImovel.ParamByName('PEVIDATA').AsDateTime       := dDataEvento;
      qryInsertEventoImovel.ParamByName('PEVICABECALHO').AsString    := sCabecalho;
      qryInsertEventoImovel.ParamByName('PEVIDESCRICAO').AsString    := sDescricao;
      qryInsertEventoImovel.ParamByName('PIDUSUARIO').AsInteger      := iUsuario;

      if sTipoEvento <> '' then
      begin
        LimpaParametros(dtmEventoImovel.qryTipoEventoImob);
        qryTipoEventoImob.Params.ParamByName('FLGTIPOEVENTO').AsString := sTipoEvento;
        qryTipoEventoImob.Open;

        if qryTipoEventoImob.IsEmpty then
           raise Exception.create( 'Não foi encontrado um tipo de evento cadastrado referente ao processo realizado. ' );

        if qryTipoEventoImob.RecordCount > 1 then
           raise Exception.create( 'Duplicidade na definição de tipo de evento cadastrado referente ao processo realizado. ' );

        IdTpoEvento := qryTipoEventoImob.FieldByName('IDTIPOEVENTOIMOB').AsInteger;

        if IdTpoEvento > 0 then
           qryInsertEventoImovel.ParamByName('PIDTIPOEVENTOIMOB').AsInteger := IdTpoEvento;

        qryInsertEventoImovel.ParamByName('PFLGTIPOEVENTO').AsString      := sTipoEvento;
      end;
      if iImovel > 0 then
        qryInsertEventoImovel.ParamByName('PIDIMOVEL').AsInteger          := iImovel;
      if iContrato > 0 then
        qryInsertEventoImovel.ParamByName('PIDCONTRATOIMOVEL').AsInteger  := iContrato;
      if fVlrAnt > 0 then
        qryInsertEventoImovel.ParamByName('PEVIVLRANTERIOR').AsFloat      := fVlrAnt;
      if fVlr > 0 then
        qryInsertEventoImovel.ParamByName('PEVIVLRAJUSTADO').AsFloat      := fVlr;
      if dDataProx > 0 then
        qryInsertEventoImovel.ParamByName('PEVIDATAPROX').AsDateTime      := dDataProx;
      if fPercent > -99 then
        qryInsertEventoImovel.ParamByName('PEVIPERCENT').AsFloat          := fPercent;
      if iIndice > 0 then
        qryInsertEventoImovel.ParamByName('PEVIINDICEREAJUSTE').AsInteger := iIndice;

      qryInsertEventoImovel.ExecSQL;
    end;

    // Tudo havendo corrido bem...
    if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;
    Result := iEvento;
  except
    on E : Exception do begin
      Result := -1;
      if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;
      if bMostraMsg then Raise;
    end;
  end;
end;



function TEventoImovel.ExcluiEvento(const iEventoImovel: int64; const bMostraMsg: boolean): integer;
var
   bTransacao  : boolean;
begin
   Result := 0;

   // verifica se há transação em andamento; se não houver, inicia uma
   if not(dtmBaseDados.dbBaseDados.InTransaction) then begin
      bTransacao := True;
      StartTransacao;
   end else begin
      bTransacao := False;
   end;

   try
      LimpaParametros(dtmEventoImovel.qryDeleteEventoImovel);
      with dtmEventoImovel.qryDeleteEventoImovel do begin
         ParamByName('PIDEVENTOIMOVEL').AsInteger   := iEventoImovel;
         ExecSQL;
      end;

      if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then CommitTransacao;
      Result := 0;
   except
      Result := -1;
      if ( (bTransacao) and (dtmBaseDados.dbBaseDados.InTransaction) ) then RollBackTransacao;

      if bMostraMsg then Raise;
   end;
end;


// Função para alterar o status de um Imóvel: retorna o Status resultante
function TEventoImovel.AlteraSituacaoImovel(const iImovel: int64; const sSituacao: string): shortint;
begin
   Result := 0;

   if iImovel <= 0 then                   Result := -3;
   if length(trim(sSituacao)) <> 1 then   Result := -2;

   with dtmEventoImovel.qryUpdateSituacao do begin
      LimpaParametros(dtmEventoImovel.qryUpdateSituacao);
      ParamByName('PIDIMOVEL').AsInteger     := iImovel;
      ParamByName('PFLGSTATUS').AsString     := sSituacao;

      if sSituacao[1] in ['O', 'N'] then begin
         ParamByName('PFLGATIVO').AsInteger  := 1;
      end else begin
         ParamByName('PFLGATIVO').AsInteger  := 0;
      end;
      ExecSQL;
   end;
end;


//==================================================================================================
//    Movimentações Contratuais
//==================================================================================================

function TEventoImovel.RescisaoContratual(const iContrato: integer; dData: TDateTime): boolean;
var CtrlImovel : TCtrlImovel;
begin
   Result := True;
   try
      MarcaRescisao(iContrato, dData);
   except
      Result := False;
   end;

   // atualiza a ocupação dos imoveis
   try
     try
       CtrlImovel := TCtrlImovel.Create;
       CtrlImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                             ComunsImobiliario.MensErroMT);

       CtrlImovel.AtualizaOcupacao('O', -1, iContrato, False);
       CtrlImovel.AtualizaOcupacao('D', -1, iContrato, False);
     except
        Result := False;
     end;
   finally
     FreeAndNil( CtrlImovel );
   end;
end;

//--------------------------------------------------------------------------------------------------

procedure TEventoImovel.MarcaRescisao(iContrato: integer; dData: TDateTime);
begin
   with dtmEventoImovel.qryMarcaRescisao do begin
      LimpaParametros(dtmEventoImovel.qryMarcaRescisao);
      ParamByName('CONTRATO').AsInteger := iContrato;
      ExecSQL;
   end;
end;


function TEventoImovel.ReajRenegContrato(const iContrato,iIndice, iPeriodicidade: integer;
         const fValorAnterior, fValorAtual: double; const dDataReaj, dDataProx: TDateTime;
         const bMostraMsg: Boolean; const sTipoMov, sDescricao: string): integer;
var
   sUpdContratoImovel: string;
   fPercReajuste, fSaldoReajuste, fSaldoAnterior: Double;
   fValorAtuImo, fValorAntImo: double;
begin
   Result := 0;  // situação normal - sem erro

   // utilizar o dImobiliario

   // -3 Registrar a movimentação na tabela de EventoImovel
   try
      LimpaParametros(dtmEventoImovel.qryInsertEventoImovel);
      with dtmEventoImovel.qryInsertEventoImovel do begin
         ParamByName('PIDEVENTOIMOVEL').AsInteger   := LeUltRegistro(nil, 'EVENTOIMOVEL');
         ParamByName('PEVIDATA').AsDateTime         := dDataReaj;

         if sTipoMov = 'RE' then begin
            ParamByName('PEVICABECALHO').AsString    := 'Renegociação Contratual'
         end else if sTipoMov = 'RJ' then begin
            ParamByName('PEVICABECALHO').AsString    := 'Rejuste Contratual';
         end;

         ParamByName('PEVIDESCRICAO').AsString       := sDescricao;
         ParamByName('PIDUSUARIO').AsInteger         := Sistema.IdUsuario;
         ParamByName('PIDCONTRATOIMOVEL').AsInteger  := iContrato;
         ParamByName('PFLGTIPOEVENTO').AsString      := sTipoMov;
         ParamByName('PEVIVLRANTERIOR').AsFloat      := fValorAnterior;
         ParamByName('PEVIVLRAJUSTADO').AsFloat      := fValorAtual;
         ParamByName('PEVIDATAPROX').AsDateTime      := dDataProx;

         fPercReajuste := ((fValorAtual / fValorAnterior) -1) * 100;
         ParamByName('PEVIPERCENT').AsFloat          := fPercReajuste;
         ParamByName('PEVIINDICEREAJUSTE').AsInteger := iIndice;
         ExecSQL;
      end;

   except
      Result := -3;
      if bMostraMsg then MsgDlg ('Erro na tentativa de se registrar a tabela EventoImovel.', 'Erro', mtError, [mbOk], 0);
      exit;
   end;

   // atualizar os imoveis x contratos
   LimpaParametros(dtmImobiliario.qryContratoXImovel);
   dtmImobiliario.qryContratoXImovel.ParamByName('PIDCONTRATOIMOVEL').AsInteger := iContrato;
   dtmImobiliario.qryContratoXImovel.Open;

   fSaldoReajuste := Arredonda(fValorAtual,2);
   fSaldoAnterior := Arredonda(fValorAnterior,2);

   try

      while not dtmImobiliario.qryContratoXImovel.EOF do begin

         if dtmImobiliario.qryContratoXImovelCIMVLRALUGUEL.AsFloat > 0 then begin

            fSaldoAnterior := fSaldoAnterior - dtmImobiliario.qryContratoXImovelCIMVLRALUGUEL.AsFloat;

            if (fSaldoAnterior = 0) and (fSaldoReajuste > 0) then begin
               fValorAntImo   := fSaldoAnterior;
               fValorAtuImo   := fSaldoReajuste;
               fSaldoReajuste := 0;
            end else begin
               fValorAntImo   := dtmImobiliario.qryContratoXImovelCIMVLRAJUSTADO.AsFloat;
               fValorAtuImo   := Arredonda(fValorAtual * (fValorAnterior / fValorAntImo),2);
               fSaldoReajuste := fSaldoReajuste - fValorAtuImo
            end;


            sUpdContratoImovel := ' UPDATE CONTRATOXIMOVEL SET '+#13+
                                  ' CIMVLRALUGUEL  = ' +  NumeroIngles(fValorAntImo) +','+#13 +
                                  ' CIMVLRAJUSTADO = ' +  NumeroIngles(fValorAtuImo) +#13 +
                                  ' WHERE IDCONTRATOIMOVEL = ' + inttostr(iContrato) + #13 +
                                  ' AND IDIMOVEL = ' + inttostr(dtmImobiliario.qryContratoXImovelIDIMOVEL.AsInteger);

            if not ExecutaQuery(dtmBaseDados.qry,sUpdContratoImovel) then begin
               Result := -4;
               if bMostraMsg then MsgDlg ('Erro na tentativa de se alterar os dados cadastrais do Imovel x Contrato.', 'Erro', mtError, [mbOk], 0);
            end;

         end;
         dtmImobiliario.qryContratoXImovel.Next;
      end;

   except
      Result := -4;
      if bMostraMsg then MsgDlg ('Erro na tentativa de se alterar os dados cadastrais do Imovel x Contrato.', 'Erro', mtError, [mbOk], 0);
   end;
end;

//--------------------------------------------------------------------------------------------------

function TEventoImovel.RescindeContrato(const iContrato: integer; dDataRescisao: TDateTime; sObs: TStrings;
         bExcluiLancamentos, bMostraMsg: boolean): integer;
var
   sUpdContratoImovel   : string;
   sDataRescisao        : string;
   CtrlImovel           : TCtrlImovel;
begin
   Result := 0;  // situação normal - sem erro

   // utilizar o dImobiliario

   // -1 = excluir lançamentos não integrados com a data de vencimento > data rescisão
   try

      with dtmImobiliario.qryExcluiLancamentos do begin
         LimpaParametros(dtmImobiliario.qryExcluiLancamentos);
         ParamByName('PIDCONTRATOIMOVEL').AsInteger := iContrato;
         ParamByName('PDATAVENCIMENTO').AsDateTime  := dDataRescisao;
         ExecSQL;
      end;

   except
      Result := -1;
      if bMostraMsg then MsgDlg('Houve erro na tentativa de exclusão dos lançamentos futuros.', 'Erro', mtError, [mbOk], 0);
      Exit;
   end;

   // -3 Registrar a movimentação na tabela de EventoImovel
   try
      LimpaParametros(dtmEventoImovel.qryInsertEventoImovel);
      with dtmEventoImovel.qryInsertEventoImovel do begin
         ParamByName('PIDEVENTOIMOVEL').AsInteger   := LeUltRegistro(nil, 'EVENTOIMOVEL');
         ParamByName('PEVIDATA').AsDateTime         := dDataRescisao;
         ParamByName('PEVICABECALHO').AsString      := 'Rescisão Contratual';
         ParamByName('PIDUSUARIO').AsInteger        := Sistema.IdUsuario;
         ParamByName('PIDCONTRATOIMOVEL').AsInteger := iContrato;
         ParamByName('PFLGTIPOEVENTO').AsString     := 'RC';
         ParamByName('PEVIDESCRICAO').AsString      := sObs.Text;
         ExecSQL;
      end;

   except
      Result := -3;
      if bMostraMsg then MsgDlg ('Erro na tentativa de se registrar a tabela EventoImovel.', 'Erro', mtError, [mbOk], 0);
      exit;
   end;


   // -4 alterar os dados contratuais com as respectivas mudanças em ContratoImovel
   try
      sDataRescisao := FormatDateTime('DD/MM/YYYY',dDataRescisao);
      sUpdContratoImovel := ' UPDATE CONTRATOIMOVEL SET ' + #13 +
                            ' FLGSTATUS = ''R'', ' + #13 +
                            ' FLGINDETERMINADO = ''N'', ' + #13 +
                            ' CONDATAFIM = TO_DATE('''  + sDataRescisao + ''',''DD/MM/YYYY'')' + #13 +
                            ' WHERE IDCONTRATOIMOVEL = ' + inttostr(iContrato);

      if not ExecutaQuery(dtmBaseDados.qry,sUpdContratoImovel) then begin
         Result := -4;
         if bMostraMsg then MsgDlg ('Erro na tentativa de se alterar os dados cadastrais do contrato.', 'Erro', mtError, [mbOk], 0);
      end;
   except
      Result := -4;
      if bMostraMsg then MsgDlg ('Erro na tentativa de se alterar os dados cadastrais do contrato.', 'Erro', mtError, [mbOk], 0);
   end;

   // -5 atualiza a ocupação dos imoveis
   try
     try
       CtrlImovel := TCtrlImovel.Create;
       CtrlImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                             ComunsImobiliario.MensErroMT);

       CtrlImovel.AtualizaOcupacao('O', -1, iContrato, False);
       CtrlImovel.AtualizaOcupacao('D', -1, iContrato, False);
     except
        Result := -5;
        if bMostraMsg then MsgDlg ('Erro na tentativa de se atualizar a ocupação dos imóveis.', 'Erro', mtError, [mbOk], 0);
     end;
   finally
     FreeAndNil( CtrlImovel );
   end;

end;

// -------------------------------------------------------------------------------------------------

function TEventoImovel.ProrrogaContrato(const iContrato: integer; const dDataMovimento,
dDataProrrogacao: TDateTime; const bMostraMsg: boolean): integer;
var
   sUpdContratoImovel, sDataProrrogada: string;
begin
   Result := 0;

   // -3 Registrar a movimentação na tabela de EventoImovel
   try
      LimpaParametros(dtmEventoImovel.qryInsertEventoImovel);
      with dtmEventoImovel.qryInsertEventoImovel do begin
         ParamByName('PIDEVENTOIMOVEL').AsInteger   := LeUltRegistro(nil, 'EVENTOIMOVEL');
         ParamByName('PEVIDATA').AsDateTime         := dDataProrrogacao;
         ParamByName('PEVICABECALHO').AsString      := 'Prorrogação Contratual';
         ParamByName('PIDUSUARIO').AsInteger        := Sistema.IdUsuario;
         ParamByName('PIDCONTRATOIMOVEL').AsInteger := iContrato;
         ParamByName('PFLGTIPOEVENTO').AsString     := 'PC';
         ParamByName('PEVIDATAPROX').AsDateTime     := dDataProrrogacao;
         ExecSQL;
      end;
   except
      Result := -3;
      if bMostraMsg then MsgDlg ('Erro na tentativa de se registrar a tabela EventoImovel.', 'Erro', mtError, [mbOk], 0);
      exit;
   end;

   // -4 alterar os dados contratuais com as respectivas mudanças em ContratoImovel
   try
      if dDataProrrogacao = -1 then begin
         sDataProrrogada := ' CONDATAFIM = NULL, '
      end else begin
         sDataProrrogada := ' CONDATAFIM = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dDataProrrogacao) + ''', ''DD/MM/YYYY''),';
      end;

      sUpdContratoImovel := ' UPDATE CONTRATOIMOVEL SET ' + #13 +
                            sDataProrrogada + #13 +
                            ' FLGINDETERMINADO = ''S'' ' + #13 +
                            ' WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato);

      if not ExecutaQuery(dtmBaseDados.qry, sUpdContratoImovel) then begin
         Result := -4;
         if bMostraMsg then MsgDlg ('Erro na tentativa de se alterar os dados cadastrais do contrato.', 'Erro', mtError, [mbOk], 0);
      end;

// Daniel Simões - 17/02/2006 - ------------------------------------------------
      if dDataProrrogacao = -1 then begin
         sDataProrrogada := ' CIMDTFIM = NULL '
      end else begin
         sDataProrrogada := ' CIMDTFIM = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dDataProrrogacao) + ''', ''DD/MM/YYYY'') ';
      end;

      sUpdContratoImovel := ' UPDATE CONTRATOXIMOVEL SET ' + #13 + sDataProrrogada + #13 +
                            ' WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato);

      if not ExecutaQuery(dtmBaseDados.qry, sUpdContratoImovel) then begin
         Result := -4;
         if bMostraMsg then MsgDlg ('Erro na tentativa de se alterar os dados cadastrais do contrato.', 'Erro', mtError, [mbOk], 0);
      end;
// Daniel Simões - 17/02/2006 - ------------------------------------------------

   except
      Result := -4;
      if bMostraMsg then MsgDlg ('Erro na tentativa de se alterar os dados cadastrais do contrato.', 'Erro', mtError, [mbOk], 0);
   end;
end;

//==================================================================================================
//    Fim de Movimentações Contratuais
//==================================================================================================



end.
