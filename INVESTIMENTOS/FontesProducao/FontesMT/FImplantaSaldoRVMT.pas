//******************************************************************************
// Data      : 09/10/2007
// Código    : AL_3
// Pendencia : 26386
// Motivo    : Não permitir saldo de quantidade igual a zero
//             Saldo de QdadeTotal e QdadeAntiga sem decimais
//             saldoinvest = saldocusto + saldovariacao --> quanto vale o papel no dia
//             O valor do Custo deverá ser o custo médio de compra da ação
//******************************************************************************
// Data      : 03/10/2007
// Código    : AL_2
// Pendencia : 26012
// Motivo    : Acerto na Exclusão
//******************************************************************************
// Data      : 27/08/2007
// Código    : AL_1
// Pendencia : 26199
// Motivo    : Implementações da Implantação Saldo RV
//******************************************************************************
unit FImplantaSaldoRVMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMTInv, StdCtrls, TREdit, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls,
  uCtrlInvestimento, uCtrlRendaVariavel, uCtrlCustodia, uCtrlPadroes,
  uMensErro, dBaseDados, uCMTypes, UDataBase, uCtrlParamInvest, uRendaVariavel,
  uCtrlInvContab;

type
  TFrmImplantaSaldoRVMT = class(TFrmCadastroMTInv)
    cdsPlanoPrev: TCMClientDataSet;
    CdsCarteira: TCMClientDataSet;
    CdsCustodiante: TCMClientDataSet;
    CdsInvestimento: TCMClientDataSet;
    CdsOperCustodia: TCMClientDataSet;
    lblDtaSaldo: TLabel;
    dbeData: TCMDateTimePicker;
    Label5: TLabel;
    dblkPlanoPatro: TwwDBLookupCombo;
    lblCarteira: TLabel;
    dblkCarteira: TwwDBLookupCombo;
    lblCustodiante: TLabel;
    dblkCustodiante: TwwDBLookupCombo;
    dblkInvestimento: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    lblSaldoInvest: TLabel;
    DbeSaldoInvest: TDBRealEdit;
    lblSaldoCusto: TLabel;
    dbeSaldoAqui: TDBRealEdit;
    dbeSaldoVariacao: TDBRealEdit;
    lblSaldoVariacao: TLabel;
    DbeSaldoQtdInvest: TDBRealEdit;
    lblQtdInvest: TLabel;
    DbeSaldoQtdIAntiga: TDBRealEdit;
    lblQtdAntiga: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbeSaldoAquiExit(Sender: TObject);
    procedure dbeSaldoVariacaoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CtrlInvestimento  : TCtrlInvestimento;
    CtrlRendaVariavel : TCtrlRendaVariavel;
    CtrlCustodia      : TCtrlCustodia;
  end;

var
  FrmImplantaSaldoRVMT: TFrmImplantaSaldoRVMT;

implementation

{$R *.DFM}

procedure TFrmImplantaSaldoRVMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   CdsCustodiante.Close;
   FreeAndNil(CtrlInvestimento);
   FreeAndNil(CtrlRendaVariavel);
   FreeAndNil(CtrlCustodia);
end;

procedure TFrmImplantaSaldoRVMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin

    Accept := True;
    if Trim(dbeData.Text) = '' then
    begin
       MsgDlg('Data não informada.','Aviso do Sistema', mtWarning, [mbOk],0);
       if dbeData.CanFocus then
          dbeData.SetFocus;
       Accept := False;
       Exit;
    end
    else if Trim(dblkPlanoPatro.Text) = '' then
    begin
       MsgDlg('Plano / Patro não informado.','Aviso do Sistema', mtWarning, [mbOk],0);
       if dblkPlanoPatro.CanFocus then
          dblkPlanoPatro.SetFocus;
       Accept := False;
       Exit;
    end
    else if Trim(dblkCarteira.Text) = '' then
    begin
       MsgDlg('Carteira não informada.','Aviso do Sistema', mtWarning, [mbOk],0);
       if dblkCarteira.CanFocus then
          dblkCarteira.SetFocus;
       Accept := False;
       Exit;
    end
    else if Trim(dblkCustodiante.Text) = '' then
    begin
       if dblkCustodiante.CanFocus then
          dblkCustodiante.SetFocus;
       MsgDlg('Custodiante não informado.','Aviso do Sistema', mtWarning, [mbOk],0);
       Accept := False;
       Exit;
    end
    else if Trim(dblkInvestimento.Text) = '' then
    begin
       if dblkInvestimento.CanFocus then
          dblkInvestimento.SetFocus;
       MsgDlg('Investimento não informado.','Aviso do Sistema', mtWarning, [mbOk],0);
       Accept := False;
       Exit;
    end
    // AL_3
    else if dbeSaldoAqui.value = 0 then
    begin
       if dbeSaldoAqui.CanFocus then
          dbeSaldoAqui.SetFocus;
       MsgDlg('Saldo de Custo não informado.','Aviso do Sistema', mtWarning, [mbOk],0);
       Accept := False;
       Exit;
    end
    // AL_3
    else if dbeSaldoVariacao.value = 0 then
    begin
       if dbeSaldoVariacao.CanFocus then
          dbeSaldoVariacao.SetFocus;
       MsgDlg('Saldo de Variação não informado.','Aviso do Sistema', mtWarning, [mbOk],0);
       Accept := False;
       Exit;
    end
    // AL_3
    else if DbeSaldoInvest.Value = 0 then
    begin
       if DbeSaldoInvest.CanFocus then
          DbeSaldoInvest.SetFocus;
       MsgDlg('Saldo do Investimento não informado.','Aviso do Sistema', mtWarning, [mbOk],0);
       Accept := False;
       Exit;
    end
    // AL_3
    else if DbeSaldoQtdInvest.Value  = 0 then
    begin
       if DbeSaldoQtdInvest.CanFocus then
          DbeSaldoQtdInvest.SetFocus;
       MsgDlg('Saldo Total de Quantidade não informado.','Aviso do Sistema', mtWarning, [mbOk],0);
       Accept := False;
       Exit;
    end
    // AL_3
    else if (dbeSaldoVariacao.Value + dbeSaldoAqui.Value) <> DbeSaldoInvest.Value then
    begin
       if dbeSaldoAqui.CanFocus then
          dbeSaldoAqui.SetFocus;
       MsgDlg('A soma do Custo + Varição não pode se diferente do Saldo Total.','Aviso do Sistema', mtWarning, [mbOk],0);
       Accept := False;
       Exit;
    end
    else if (DbeSaldoQtdIAntiga.Value > DbeSaldoQtdInvest.Value) then
    begin
       MsgDlg('A Quantidade Antiga não pode ser maior que a Quantidade Total .','Aviso do Sistema', mtWarning, [mbOk],0);
       Accept := False;
       if DbeSaldoQtdIAntiga.CanFocus then
          DbeSaldoQtdIAntiga.SetFocus;
       Exit;
    end;
  inherited;
end;

procedure TFrmImplantaSaldoRVMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlInvestimento  := TCtrlInvestimento.Create;
   CtrlRendaVariavel := TCtrlRendaVariavel.Create;
   CtrlCustodia      := TCtrlCustodia.Create;

   CtrlInvestimento.InitializeAs(Padroes);
   CtrlRendaVariavel.InitializeAs(Padroes);
   CtrlCustodia.InitializeAs(Padroes);

   cdsPlanoPrev.Data    := CtrlInvestimento.ListPlanoPatro;
   CdsCarteira.Data     := CtrlInvestimento.ListCarteira(2,-1, 0);
   CdsCustodiante.Data  := CtrlInvestimento.ListCustodiante;
   CdsInvestimento.Data := CtrlRendaVariavel.ListInvestimentoRenVar;

   CtrlRendaVariavel.CdsHistcartinv := Cds;
   Cds.Data  := CtrlRendaVariavel.ListHistCartinv(0);
   CtrlCustodia.CdsOperCustodia := CdsOperCustodia;
   CdsOperCustodia.Data := CtrlCustodia.ListaOperCustodia('', -1);
end;

procedure TFrmImplantaSaldoRVMT.sbtnInserirClick(Sender: TObject);
begin
   if RendaVariavel.VerEmAbertura then
   begin
      CmeCadastro.AtualizaBotoes(Self);
      Exit;
   end;
  inherited;
   if dbeData.CanFocus then
      dbeData.SetFocus;
   CdsCustodiante.Close;
   CdsCustodiante.Data  := CtrlInvestimento.ListCustodiante;
end;

procedure TFrmImplantaSaldoRVMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   // Verifica se tem registros
   CdsAux.Data  := CtrlRendaVariavel.ListHistCartinv(-1,
                                                     -1,
                                                     CdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger,
                                                     CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                     CdsPlanoPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger);
   if not CdsAux.IsEmpty then
   begin
       MsgDlg('Já existe histórico para este Investimento / Carteira / Plano / Patro.' + #13 +
              'Não pode ser lançado uma operação de Implantação de Saldo.' ,'Aviso do Sistema', mtWarning, [mbOk],0);
       Exit;
   end
   else
   begin
      Try
         Try
            if not CtrlInvContab.TestaPeriodo(DateToStr(dbeData.Date), 2) then
            begin
               if dbeData.CanFocus then
                  dbeData.SetFocus;
               Raise Exception.Create(CtrlInvContab.MessageInfo);
            end;

            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

             Cds.FieldByName('DATAMOVCARTINV').AsDateTime   := dbeData.Date;
             Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger := cdsPlanoPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;
             Cds.FieldByName('IDMODULO').AsInteger          := CtrlPInv.Idmodulo;
             Cds.FieldByName('IDEMPRESAPROP').AsInteger     := CtrlPInv.IDEmpresa;
             Cds.FieldByName('IDINVESTIMENTO').AsInteger    := CdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
             Cds.FieldByName('IDCARTEIRAINVEST').AsInteger  := CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
             Cds.FieldByName('IDTIPOINVEST').AsInteger      := 2;
             Cds.FieldByName('VLRMOVCARTINV').AsFloat       := Cds.FieldByName('SALDOVLRINVCART').AsFloat;
             Cds.FieldByName('MOVIMAQUI').AsFloat           := Cds.FieldByName('SALDOAQUI').AsFloat;
             Cds.FieldByName('VLRVARIACAO').AsFloat         := Cds.FieldByName('SALDOVARIACAO').AsFloat;
             Cds.FieldByName('QTDEMOVINVCART').AsFloat      := Cds.FieldByName('SALDOQTDEINVCART').AsFloat;;
             Cds.FieldByName('HISTMOVCARTINV').AsString     := 'Saldo Inicial';
             Cds.FieldByName('NATURMOVCARTINV').AsString    := 'A';
             Cds.FieldByName('TIPMOVCARTINV').AsString      := 'INI';
             Cds.Post;

             if not CtrlRendaVariavel.AplicaAtualHistCartInv then
                Raise Exception.Create('Não foi possível incluir a operação no Histórico.');

             // Caso seja em data fechada marca o investimento para reprocessamento
             if Cds.FieldByName('DATAMOVCARTINV').AsDateTime <= CtrlPInv.DATAULTFECH then
             begin
                if not RendaVariavel.MarcarFlagReproc(Cds.FieldByName('IDINVESTIMENTO').AsInteger,
                                                      Cds.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                      Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                      Cds.FieldByName('DATAMOVCARTINV').AsDateTime + 1) then
                   Raise Exception.Create('Não foi possível marcar o Investimento para Reprocessamento.');
             end;

             CdsOperCustodia.Insert;
             CdsOperCustodia.FieldByName('IDMOTIVOBLOQORIG').AsInteger  := -1;
             CdsOperCustodia.FieldByName('IDMOTIVOBLOQDEST').AsInteger  := -1;
             CdsOperCustodia.FieldByName('IDHISTCARTINVDEST').AsInteger := CtrlRendaVariavel.IdHistCartinv;
             CdsOperCustodia.FieldByName('IDHISTCARTINVORIG').AsInteger := CtrlRendaVariavel.IdHistCartinv;
             CdsOperCustodia.FieldByName('IDCUSTODIANTEORIG').AsInteger := CdsCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;
             CdsOperCustodia.FieldByName('IDCUSTODIANTEDEST').AsInteger := CdsCustodiante.FieldByName('IDCUSTODIANTE').AsInteger;
             CdsOperCustodia.FieldByName('IDINVESTIMENTO').AsInteger    := CdsInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
             CdsOperCustodia.FieldByName('IDCARTEIRAORIG').AsInteger    := CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
             CdsOperCustodia.FieldByName('IDCARTEIRADEST').AsInteger    := CdsCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
             CdsOperCustodia.FieldByName('DATAMOVCUSTOD').AsDateTime    := dbeData.Date;
             CdsOperCustodia.FieldByName('QUANTIDADE').AsFloat          := DbeSaldoQtdInvest.Value;
             CdsOperCustodia.FieldByName('IDPLANPREVCTBPATR').AsInteger := cdsPlanoPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;
             CdsOperCustodia.FieldByName('IDPLANPREVCTBDEST').AsInteger := cdsPlanoPrev.FieldByName('IDPLANPREVCTBPATR').AsInteger;
             CdsOperCustodia.FieldByName('IDTIPOINVEST').AsInteger      := 2;
             CdsOperCustodia.FieldByName('IDTIPOOPERACAO').AsInteger    := -1;
             CdsOperCustodia.FieldByName('FLGTIPOCONTAORIG').AsInteger  := 1;
             CdsOperCustodia.FieldByName('FLGTIPOCONTADEST').AsInteger  := 1;

             CdsOperCustodia.Post;

             if not CtrlCustodia.GravaOperCustodia('INI', -1, CdsOperCustodia) then
                Raise Exception.Create('Não foi possível incluir a operação na Custódia.');

             if DtmBaseDados.dbBaseDados.InTransaction then
                DtmBaseDados.dbBaseDados.Commit;

             MsgDlg('Processo concluído com sucesso.','Mensagem do Sistema',mtConfirmation,[mbOk],0);

         except
            on E:Exception do
            begin
               if DtmBaseDados.dbBaseDados.InTransaction then
                  DtmBaseDados.dbBaseDados.Rollback;
               MsgDlg('Não foi possível efetuar esta operação.' + #13 +
                       E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
               bbtnCancelarClick(self);
            end;
         end;
      finally
         CdsCustodiante.Close;
      end;
   end;
end;

procedure TFrmImplantaSaldoRVMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      Cds.Data            := CtrlRendaVariavel.ListHistCartinv(StrToInt(MontaSelect.ValoresChave[8]));
      CdsCustodiante.Data := CtrlInvestimento.ListCustodiante(StrToInt(MontaSelect.ValoresChave[3]));
      if not CdsCustodiante.IsEmpty then
         dblkCustodiante.Text := CdsCustodiante.FieldByName('SGLCUSTODIANTE').AsString;
   end;
end;

procedure TFrmImplantaSaldoRVMT.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   sbtnAlterar.Enabled := False;
end;

procedure TFrmImplantaSaldoRVMT.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
   Try
      // AL_3
      //AL_2
      if MsgDlg('Existe histórico para este Investimento / Carteira / Plano / Patro.' + #13 +
                'Deseja continuar ?.','Mensagem do Sistema ',
                MtWarning,[MbOk, MbCancel],0) = MrCancel Then
         Exit
      else
      begin
         Try
            if not CtrlInvContab.TestaPeriodo(MontaSelect.ValoresChave[1], 2) then
            begin
               if dbeData.CanFocus then
                  dbeData.SetFocus;
               Raise Exception.Create(CtrlInvContab.MessageInfo);
            end;

            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            if Cds.FieldByName('DATAMOVCARTINV').AsDateTime <= CtrlPInv.DATAULTFECH then
            begin
               //AL_2
               if MontaSelect.ValoresChave[9] <> 'INI' then
               begin
               if not RendaVariavel.MarcarFlagReproc(Cds.FieldByName('IDINVESTIMENTO').AsInteger,
                                                     Cds.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                                     Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                                     Cds.FieldByName('DATAMOVCARTINV').AsDateTime) then
                  Raise Exception.Create('Não foi possível marcar o Investimento para Reprocessamento.');
               end;
            end;

            if not RendaVariavel.ExcluiHistRV(Cds.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                              Cds.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                              Cds.FieldByName('IDINVESTIMENTO').AsInteger,
                                              Cds.FieldByName('DATAMOVCARTINV').AsDateTime,
                                              -1, '') then
               Raise Exception.Create('Não foi possível excluir os Históricos Posteriores do Investimento.');

            if not CtrlCustodia.ExcluiOperCustodia(StrToInt(MontaSelect.ValoresChave[2])) then
               Raise Exception.Create('Não foi possível excluir esta operação.' + #13 +
                                       CtrlCustodia.MessageInfo);

            if DtmBaseDados.dbBaseDados.InTransaction then
             DtmBaseDados.dbBaseDados.Commit;

            MsgDlg('Processo concluído com sucesso.','Mensagem do Sistema',mtConfirmation,[mbOk],0);

         except
            on E:Exception do
            begin
               if DtmBaseDados.dbBaseDados.InTransaction then
                  DtmBaseDados.dbBaseDados.Rollback;
               MsgDlg(E.Message, 'Mensagem do Sistema', MtWarning,[MbOk],0);
            end;
         end;
      end;
   Finally
      bbtnCancelarClick(self);
      CdsCustodiante.Close;
      Cds.Close;
      sbtnAlterar.Enabled := False;
   end;
end;

procedure TFrmImplantaSaldoRVMT.sbtnApagarClick(Sender: TObject);
begin
  inherited;
   sbtnAlterar.Enabled := False;
end;

procedure TFrmImplantaSaldoRVMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
  inherited;

end;

// AL_3
procedure TFrmImplantaSaldoRVMT.dbeSaldoAquiExit(Sender: TObject);
begin
  inherited;
  DbeSaldoInvest.value := (dbeSaldoAqui.value + dbeSaldoVariacao.value);
end;

// AL_3
procedure TFrmImplantaSaldoRVMT.dbeSaldoVariacaoExit(Sender: TObject);
begin
  inherited;
  DbeSaldoInvest.value := (dbeSaldoAqui.value + dbeSaldoVariacao.value);
end;

end.


