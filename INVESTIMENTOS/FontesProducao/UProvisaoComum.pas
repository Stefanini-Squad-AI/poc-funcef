//******************************************************************************
// Data     : 31/08/2006
// Codigo   : AL_2
// Pendência:
// Sol      :
// Motivo   :  Implementação do plano/patrocinador
//******************************************************************************
// Data     : 25/01/2005
// Codigo   : AL_1
// Motivo   : Implementacao do result na rotina, caracterizando a parametrizacao
//******************************************************************************

unit UProvisaoComum;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls;


type

   TProvisaoComum = Class(TObject)

   private

   public

      function  GravaProvisao(dData, dDataProv  : TDateTime;
                              idCarteiraP, idCarteiraG,  idCarteiraXEvento, idOperacaoInvest,
                              idOperacaoDireito, iPlanoPrev : Integer;
                              fValor: Double): Boolean;

      function  AtualizaProvisao(dData  : TDateTime) : Boolean;

      function  VerProvisionaCPMF(iIdOperInvest, idCarteiraP,
                                  idCarteiraG, iPlanoPrev : Integer) : Boolean;

      function  GravaCPMFProvisao(dDataMov          : TDateTime;
                                  fVlrMov           : Double;
                                  idOperDir, iIdOperInvest, idCarteiraP,
                                  idCarteiraG, iPlanoPrev : Integer) : Boolean;
   End;

var
  ProvisaoComum : TProvisaoComum;

implementation

uses UDataBase, UOperComum, DProvisaoComum, uMensErro, UCaixaComum, UCotaComum,UImpostos;

//-----------------------------------------------------------------
// Retorna:  0: Tudo OK
//           1: O Evento encontrado não é Evento de Caixa
//           2: A carteira não possui Evento de Caixa cadastrado
//           3: Erro na Abertura de queries ou na Gravação de dados
//-----------------------------------------------------------------
function TProvisaoComum.GravaProvisao(dData, dDataProv: TDateTime;
                                      idCarteiraP, idCarteiraG,
                                      idCarteiraXEvento,
                                      idOperacaoInvest,
                                      idOperacaoDireito, iPlanoPrev : Integer;
                                      fValor: Double): Boolean;
var
    iIdHistProvisao : Integer;
    qryAux          : TwwQuery;
begin
   qryAux := TwwQuery.Create(Application);
   qryAux.DatabaseName := 'BaseDados';

   try
      // Busca o Evento
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT EC.STACAIXA, EC.STASOMADIMINUI ' +
                     'FROM CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC ' +
                     'WHERE CX.IDCARTEIRAXEVENTO = ' + IntToStr(idCarteiraXEvento) + ' AND ' +
                     '      CX.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA');
      qryAux.Open;

      //AL_1 - 25/01/2005
      if qryAux.IsEmpty then
      begin
         Result := False;
         Exit;
      end;

      if not (qryAux.FieldByName('STACAIXA').AsString  = 'S')  then
      begin
         Result := True;
         Exit;
      end;
      //AL_1 - Fim

      if (qryAux.FieldByName('STASOMADIMINUI').AsString = 'S') then
         fValor := fValor
      else
         fValor := fValor*-1;

      // Grava o Histórico do Evento com o novo saldo
      iIdHistProvisao := LeUltRegistro(Nil,'HISTPROVISAO');

      OperComum.LimpaParametros(DtmProvisaoComum.qryInsereHistProvisao);
      with DtmProvisaoComum.qryInsereHistProvisao do
      begin
         ParamByName('IDHISTPROVISAO').AsInteger       := iIdHistProvisao;
         If iPlanoPrev > 0 Then
            ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanoPrev;

         ParamByName('IDCARTEIRAXEVENTO').AsInteger    := idCarteiraXEvento;
         ParamByName('IDCARTEIRAINVEST').AsInteger     := idCarteiraP;

         If idCarteiraG > 0 Then
            ParamByName('IDCARTEIRAGERENC').AsInteger  := idCarteiraG;

         if idOperacaoInvest > 0 then
            ParamByName('IDOPERACAOINVEST').AsInteger  := idOperacaoInvest;

         if idOperacaoDireito > 0 then
            ParamByName('IDOPERACAODIREITO').AsInteger := idOperacaoDireito;
         //AL_2
         if iPlanoPrev > 0 then
            ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanoPrev;

         ParamByName('DATAORIGEM').AsDateTime          := dData;
         ParamByName('DATAHISTPROVISAO').AsDateTime    := dDataProv;
         ParamByName('VLRHISTPROVISAO').AsFloat        := fValor;
         ParamByName('SLDHISTPROVISAO').AsFloat        := fValor;
         Prepare;
         ExecSQL;
      end;

      Result := True;
   except
      Result := False;
   end;
   qryAux.Close;
   qryAux.Free;
end;

function  TProvisaoComum.AtualizaProvisao(dData : TDateTime) : Boolean;
Var
   idCarteiraXEvento : Integer;
   fSaldoCaixa       : Currency;
begin
   With DtmProvisaoComum Do
   begin
      Try
         OperComum.LimpaParametros(QryProvisaoNaoVenc);
         QryProvisaoNaoVenc.ParamByName('DATAHISTPROVISAO').AsDateTime := dData;
         QryProvisaoNaoVenc.Open;
         QryProvisaoNaoVenc.First;
         While Not QryProvisaoNaoVenc.Eof Do
         begin
            If (QryProvisaoNaoVenc.FieldByName('IDOPERACAODIREITO').AsInteger <> 0)    Then
            Begin
                OperComum.LimpaParametros(QryBuscaOperacaoDireito);
                QryBuscaOperacaoDireito.Close;
                QryBuscaOperacaoDireito.ParamByName('IDOPERACAODIREITO').AsInteger :=
                            QryProvisaoNaoVenc.FieldByName('IDOPERACAODIREITO').AsInteger;
                QryBuscaOperacaoDireito.Open;

                If QryBuscaOperacaoDireito.FieldByName('DATAEX').AsDateTime > dData Then
                    CotaComum.AtualizaCota(dData,
                              QryProvisaoNaoVenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                              QryProvisaoNaoVenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                              QryProvisaoNaoVenc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                              QryProvisaoNaoVenc.FieldByName('IDCARTEIRAXEVENTO').AsInteger,
                              QryProvisaoNaoVenc.FieldByName('VLRHISTPROVISAO').AsFloat);
            End
            Else
            Begin
               If QryProvisaoNaoVenc.FieldByName('DATAHISTPROVISAO').AsDateTime > dData Then
                  CotaComum.AtualizaCota(dData,
                            QryProvisaoNaoVenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                            QryProvisaoNaoVenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                            QryProvisaoNaoVenc.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                            QryProvisaoNaoVenc.FieldByName('IDCARTEIRAXEVENTO').AsInteger,
                            QryProvisaoNaoVenc.FieldByName('VLRHISTPROVISAO').AsFloat);
            End;

            If (QryProvisaoNaoVenc.FieldByName('DATAHISTPROVISAO').AsDateTime = dData) And
               (QryProvisaoNaoVenc.FieldByName('IDOPERACAOINVEST').AsInteger <> 0)     Then
            Begin
                OperComum.LimpaParametros(QryBuscaOperacaoInvest);
                QryBuscaOperacaoInvest.Close;
                QryBuscaOperacaoInvest.ParamByName('IDOPERACAOINVEST').AsInteger :=
                                   QryProvisaoNaoVenc.FieldByName('IDOPERACAOINVEST').AsInteger;
                QryBuscaOperacaoInvest.Open;

                idCarteiraXEvento := CotaComum.BuscaCarteiraXevento(
                                               QryProvisaoNaoVenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               QryProvisaoNaoVenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                               QryProvisaoNaoVenc.FieldByName('IDEVENTOCAIXACOTA').AsInteger);

                fSaldoCaixa       := CaixaComum.BuscaSaldoCaixa(dData,
                                                QryProvisaoNaoVenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                QryProvisaoNaoVenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                                -1, 'OPE');

                CaixaComum.AtualizaHistCaixa(dData,
                                             QryProvisaoNaoVenc.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                             QryProvisaoNaoVenc.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                             idCarteiraXEvento,
                                             QryProvisaoNaoVenc.FieldByName('IDOPERACAOINVEST').AsInteger,
                                             -1,
                                             -1,
                                             QryBuscaOperacaoInvest.FieldByName('DESCINVESTIMENTO').AsString,
                                             QryProvisaoNaoVenc.FieldByName('VLRHISTPROVISAO').AsFloat,
                                             fSaldoCaixa);
                QryBuscaOperacaoInvest.Close;
            End;

            QryProvisaoNaoVenc.Next;

         end;
         
         QryProvisaoNaoVenc.Close;

         OperComum.LimpaParametros(QryProvisaoCPMFVencSint);
         QryProvisaoCPMFVencSint.Close;
         QryProvisaoCPMFVencSint.ParamByName('DATAHISTPROVISAO').AsDateTime := dData;
         QryProvisaoCPMFVencSint.Open;
         QryProvisaoCPMFVencSint.First;
         While Not QryProvisaoCPMFVencSint.Eof Do
         begin
            idCarteiraXEvento := CotaComum.BuscaCarteiraXevento(
                                           QryProvisaoCPMFVencSint.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                           QryProvisaoCPMFVencSint.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                           QryProvisaoCPMFVencSint.FieldByName('IDEVENTOCAIXACOTA').AsInteger);

            OperComum.LimpaParametros(QryDeleteHistCaixaCPMF);
            QryDeleteHistCaixaCPMF.ParamByName('IDCARTEIRAXEVENTO').AsInteger := idCarteiraXEvento;
            QryDeleteHistCaixaCPMF.ParamByName('DATAHISTCAIXA').AsDateTime    := dData;
            QryDeleteHistCaixaCPMF.ExecSql;

            fSaldoCaixa       := CaixaComum.BuscaSaldoCaixa(dData,
                                            QryProvisaoCPMFVencSint.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            QryProvisaoCPMFVencSint.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                            -1, 'OPE');

            CaixaComum.AtualizaHistCaixa(dData,
                                         QryProvisaoCPMFVencSint.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryProvisaoCPMFVencSint.FieldByName('IDCARTEIRAGERENC').AsInteger,
                                         idCarteiraXEvento,
                                         QryProvisaoCPMFVencSint.FieldByName('IDOPERACAOINVEST').AsInteger,
                                         QryProvisaoCPMFVencSint.FieldByName('IDOPERACAODIREITO').AsInteger,
                                         QryProvisaoCPMFVencSint.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                         '',
                                         QryProvisaoCPMFVencSint.FieldByName('VLRHISTPROVISAO').AsFloat,
                                         fSaldoCaixa);
            QryProvisaoCPMFVencSint.Next;
         end;
         QryProvisaoCPMFVencSint.Close;
         Result := True;
      Except
         QryProvisaoCPMFVencSint.Close;
         QryBuscaOperacaoDireito.Close;         
         QryProvisaoNaoVenc.Close;
         MsgDlg('Não foi possível atualizar as Provisões. Verifique!',
                'Mensagem do Sistema', mtWarning, [mbOk], 0);
         Result := False;
      end;
   end;
end;

function  TProvisaoComum.VerProvisionaCPMF(iIdOperInvest, idCarteiraP,
                                           idCarteiraG, iPlanoPrev : Integer) : Boolean;
begin
   With DtmProvisaoComum Do
   begin
      Result := True;
      If iIdOperInvest <> 0 Then
      begin
         OperComum.LimpaParametros(QryBuscaOperCPMF);
         QryBuscaOperCPMF.ParamByName('IDOPERACAOINVEST').AsInteger := iIdOperInvest;
         If idCarteiraP <> 0 Then
            QryBuscaOperCPMF.ParamByName('IDCARTEIRAINVEST').AsInteger := idCarteiraP;
         If idCarteiraG <> 0 Then
            QryBuscaOperCPMF.ParamByName('IDCARTEIRAGERENC').AsInteger := idCarteiraG;
         QryBuscaOperCPMF.Open;

         If QryBuscaOperCPMF.FieldByName('STACPMF').AsString <> 'S' Then
            Result := False;
            
         QryBuscaOperCPMF.Close;
      end;
   end;
end;

function  TProvisaoComum.GravaCPMFProvisao(dDataMov          : TDateTime;
                                           fVlrMov           : Double;
                                           idOperDir, iIdOperInvest, idCarteiraP,
                                           idCarteiraG, iPlanoPrev : Integer) : Boolean;
var
   fVlrCPMFProv, fAliquotaCPMF : Double;
   dDataLiqCPMF                : TDateTime;
   wIdCarteiraXEvento          : Integer;
begin
   Try
      With DtmProvisaoComum Do
      begin
         If VerProvisionaCPMF(iIdOperInvest, idCarteiraP, idCarteiraG, iPlanoPrev) Then
         begin
            wIdCarteiraXEvento := CotaComum.BuscaCarteiraXevento(idCarteiraP, idCarteiraG, -13);

            If wIdCarteiraXEvento = 0 then
               Raise Exception.Create('Não a evento de CPMF para as Carteiras Gerenciais utilizadas. Verifique!');

            fAliquotaCPMF      := Impostos.BuscaAliquotaCPMF(DateToStr(dDataMov));

            If fAliquotaCPMF = 0 Then
               Raise Exception.Create('A aliquota do CPMF está zerada. Verifique!');

            dDataLiqCPMF  := Impostos.CalculaDataLiqCPMF(dDataMov);

            If dDataLiqCPMF = 0 Then
               Raise Exception.Create('O dia de recolhimento para CPMF não está cadastrado. Verifique!');

            fVlrCPMFProv := (fVlrMov * (fAliquotaCPMF/100));

            fVlrCPMFProv := fVlrCPMFProv - 0.0049;

            OperComum.LimpaParametros(QryDeleteCPMFProv);
            If idCarteiraP > 0 Then
               QryDeleteCPMFProv.ParamByName('IDCARTEIRAINVEST').AsInteger := idCarteiraP;
            If idCarteiraG > 0 Then
               QryDeleteCPMFProv.ParamByName('IDCARTEIRAGERENC').AsInteger := idCarteiraG;
            QryDeleteCPMFProv.ParamByName('DATAORIGEM').AsString           := DateToStr(dDataMov);
            QryDeleteCPMFProv.ParamByName('DATAHISTPROVISAO').AsString     := DateToStr(dDataLiqCPMF);
            //AL_2
            QryDeleteCPMFProv.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanoPrev;
            QryDeleteCPMFProv.ExecSql;

            If Not GravaProvisao(dDataMov,
                                 dDataLiqCPMF,
                                 idCarteiraP, idCarteiraG,
                                 wIdCarteiraXEvento,
                                 iIdOperInvest,
                                 idOperDir,
                                 iPlanoPrev,
                                 fVlrCPMFProv*-1) Then
               Raise Exception.Create('Não foi possível gravar a Provisão para CPMF das Carteiras Gerenciais. Verifique!');
         end;
         Result := True;
      end;
   except on E: Exception do
      begin
         MsgDlg(E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := false;
      end;
   end;
end;

end.
