// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 14/05/2004
Autor     : Rodolpho da Silva
Pendencia : 20157
Descrição : Correção de alguns bugs da tela.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 18/05/2004
Autor     : André Tavares
Pendencia : 17608
Descrição : usa o método que lista os planoprevcontábeis por patro.
---------------------------------------------------------------------------------------------------}

// André Tavares - pendência 16738 - 07/10/2004 - tranca a tabela paramorcamen
//para que usuarios concorrentes não gerem o mesmo número de compromisso orçamentário.

{ --------------------------------------------------------------------------------------------------
Rotina    : BtCalcClick
Data      : 18/05/2004
Autor     : André Pontes
Pendencia : 16459
Descrição : Correção do rateio pelos centros de custo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 27/10/2003
Autor     :
Pendencia : 14009
Descrição :
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 14.07.204
Autor     : FDias
Pendencia : 17185 - FDias - 14.07.2004
Descrição : Não filatrava o grupo pelo plano atual
---------------------------------------------------------------------------------------------------}



unit FEntCompromissoEspecialMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
   wwdbedit, TREdit, Mask, Wwdbspin, Spin, Db, DBTables, Wwquery,
   MontaSelect, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, FOkCancelar, DBCtrls,
   IvDictio, IvMulti, IvEMulti, wwdblook, CMDBLookupCombo, CMProcuraMask,
   DBClient, uCMClientDataSet, uCmSqlParams, uCtrlReservaorcamen,
   uCtrlSaldoorcado, uCtrlCompromisso, uCtrlResxcomp, wwdbdatetimepicker,
   CMDateTimePicker, uCMTypes, uCtrlPeriodoOrcamen,
   uCtrlPlanPrevContabPatro; // andré tavares - pendência 17608 - 17/05/2005

type
   TfrmEntCompromissoEspecialMT = class(TfrmOkCancelar)
      dbgrdConta: TwwDBGrid;
      dsConta: TwwDataSource;
      pnlValores: TPanel;
      Label6: TLabel;
      Label12: TLabel;
      Panel1: TPanel;
      lblCodigoConta: TLabel;
      dbeCodigoGrupo: TEdit;
      bbtnBuscaGrupo: TBitBtn;
      lblNome: TLabel;
      edtNomeGrupo: TEdit;
      Label21: TLabel;
      Label22: TLabel;
      dblcPlanoParamConta: TwwDBLookupCombo;
      Label23: TLabel;
      dblcPatroParamConta: TwwDBLookupCombo;
      MontaSelectGrupo: TMontaSelect;
      sqlGrupo: TCMSqlParams;
      cdsGrupo: TCMClientDataSet;
      SqlPlano: TCMSqlParams;
      cdsPlano: TCMClientDataSet;
      sqlPatrocinadora: TCMSqlParams;
      cdsPatrocinadora: TCMClientDataSet;
      sqlConta: TCMSqlParams;
      cdsConta: TCMClientDataSet;
      bbtnCCusto: TBitBtn;
      cdsContaVLRCOMPROMISSO: TCurrencyField;
      cdsContaIDCONTAORCAMEN: TStringField;
      cdsContaCODCENTRORESPON: TStringField;
      cdsContaNOME: TStringField;
      cdsContaCODCENTROCUSTO: TStringField;
      cdsContaDATAR: TDateTimeField;
      edtCCusto: TEdit;
      Label1: TLabel;
      cdsProxReserva: TCMClientDataSet;
      Label2: TLabel;
      redSaldo: TRealEdit;
      sqlPlanoTrabalho: TCMSqlParams;
      cdsPlanoTrabalho: TCMClientDataSet;
      dblcPlanoTrabalho: TwwDBLookupCombo;
      cdsContaCRESP: TStringField;
      lblCriterio: TLabel;
      dblcCriterio: TCMDBLookupCombo;
      sqlCriterio: TCMSqlParams;
      cdsCriterio: TCMClientDataSet;
      lblValBase: TLabel;
      redValorBase: TRealEdit;
      BtCalc: TBitBtn;
      sqlCompOrcamen: TCMSqlParams;
      cdsCompOrcamen: TCMClientDataSet;
      sqlSaldoContabil: TCMSqlParams;
      cdsSaldoContabil: TCMClientDataSet;
      cdsValorCentCust: TCMClientDataSet;
      sqlValorCentCust: TCMSqlParams;
      cdsDataView: TCMClientDataSet;
      sqlDataView: TCMSqlParams;
      cdsValorCCustAux: TCMClientDataSet;
      sqlValorCCustAux: TCMSqlParams;
      redValor: TDBRealEdit;
      dbeDataRef: TCMDateTimePicker;
    Label3: TLabel;
    edtCentroResp: TEdit;

      procedure FormCreate(Sender: TObject);
      procedure ZeraConta(Sender: TObject);
      procedure dbeCodigoGrupoExit(Sender: TObject);
      procedure dblcPlanoParamContaExit(Sender: TObject);
      procedure dblcPatroParamContaExit(Sender: TObject);
      procedure bbtnBuscaGrupoClick(Sender: TObject);
      procedure bbtnCCustoClick(Sender: TObject);
      procedure sqlContaFormartParam(sParamName, sOldValue: String; var sNewValue: String);
      procedure dbgrdContaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure dbgrdContaTopRowChanged(Sender: TObject);
      procedure dbgrdContaEnter(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure CancelarOp(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure dbeDataRefChange(Sender: TObject);
      procedure dblcPlanoTrabalhoExit(Sender: TObject);
      procedure cdsContaAfterScroll(DataSet: TDataSet);
      procedure dblcCriterioCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure BtCalcClick(Sender: TObject);
      procedure dbeDataRefExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblcPatroParamContaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbgrdContaUpdateFooter(Sender: TObject);


   private  // Private declarations

      iGrupo, iUnid, iPPrev, iPatro : Integer;
      iConta                        : String;

      CtrlReservaorcamen : TCtrlReservaorcamen;
      CtrlSaldoorcado    : TCtrlSaldoorcado;
      CtrlCompromisso    : TCtrlCompromisso;
      CtrlPeriodoOrcamen : TCtrlPeriodoOrcamen;
      CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro; // andré tavares - pendência 17608

      //  Rodolpho da Silva - P: 20157 - 14/09/2005
      procedure AbreCdsContas(bAbreVazio: boolean = false);

   public   // Public declarations

   end;



var
  frmEntCompromissoEspecialMT: TfrmEntCompromissoEspecialMT;
  iGrupoAnt : LongInt;



implementation
{$R *.DFM}
uses
   UMensErro, uDatabase, DBaseDados, uAutorizacao,
   uSistema, uModulo, uString, UData, UCtrlOrcamento;



procedure TfrmEntCompromissoEspecialMT.FormCreate(Sender: TObject);
begin
   inherited;

   //Inicializa variáveis
   CtrlReservaorcamen := TCtrlReservaorcamen.Create;
   CtrlSaldoorcado    := TCtrlSaldoOrcado.Create;
   CtrlCompromisso    := TCtrlCompromisso.Create;
   CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create; // andre tavares - pendencia 17608

   // Marcio Motta - 23/03/2005 - 17988
   CtrlPeriodoOrcamen := TCtrlPeriodoOrcamen.Create;
   // Fim................................

   MontaSelectGrupo.Filtro.Add('IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));

   CtrlReservaorcamen.Initialize(DtmBaseDados.dbBaseDados,
                                 True,
                                 Sistema.ConnectionType,
                                 Sistema.ConnectionSide,
                                 Sistema.AppRemoteServer,
                                 True,
                                 nil,
                                 nil,
                                 False
                               );

   CtrlSaldoorcado.InitializeAs(CtrlReservaorcamen);
   CtrlCompromisso.InitializeAs(CtrlReservaorcamen);

   // Marcio Motta - 23/03/2005 - 17988
   CtrlPeriodoOrcamen.InitializeAs(CtrlReservaorcamen);
   // Fim................................

   //início - andre tavares - pendência 17608
   CtrlPlanPrevContabPatro.InitializeAs(CtrlReservaorcamen);
   cdsPlano.data := CtrlPlanPrevContabPatro.ListaPlanoPatro;
   //fim - andre tavares - pendência 17608

   iUnid    := 0;
   iPPrev   := -1;
   iPatro   := -1;

   // Seleciona Unidades de Negócio
   with sqlPlanoTrabalho do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      ParamByName('IDUSUARIO').asInteger := Sistema.IdUsuario;
      Open;
   end;

   //  Rodolpho da Silva - P: 20157 - 14/09/2005
   AbreCdsContas(True);

{ andré tavares pendência 17608
   with sqlPlano do
   begin
      Prepare;
      Open;
   end;
}
   with sqlPatrocinadora do
   begin
      Prepare;
      Open;
   end;


   cdsCriterio.Close;
   with sqlCriterio do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
end;



procedure TfrmEntCompromissoEspecialMT.ZeraConta(Sender: TObject);
begin
   edtCCusto.Text := '';
   redSaldo.Value := 0;

   if cdsConta.State in [dsEdit] then cdsConta.Cancel;

   //  Rodolpho da Silva - P: 20157- 14/09/2005
   //cdsConta.Close;
   if not cdsConta.IsEmpty then
      AbreCdsContas(true);

   if Trim(dbeCodigoGrupo.Text) = '' then bbtnCCusto.Enabled := False;
end;



procedure TfrmEntCompromissoEspecialMT.dbeCodigoGrupoExit(Sender: TObject);
begin
   inherited;

   if dbeCodigoGrupo.Text <> '' then
   begin
      with sqlGrupo do
      begin
         cdsGrupo.Close;
         Prepare;
         ParamByName('CODGRUPOORC').AsString := dbeCodigoGrupo.Text;
         ParamByName('IPLANOORC').AsInteger  := Modulo.iPlanoOrc;    // 17185 - FDias - 14.07.2004
         Open;
      end;

      if cdsGrupo.IsEmpty then
      begin
         edtNomeGrupo.Clear;
         iGrupo := -1;
         if dbeCodigoGrupo.CanFocus then dbeCodigoGrupo.SetFocus;
      end
      else
      begin
         with cdsGrupo do
         begin
            edtNomeGrupo.Text  := FieldByName('NOMEGRUPOORCAMEN').AsString;
            iGrupo             := FieldByName('IDGRUPOORCAMEN').AsInteger;
            bbtnCCusto.Enabled := True;
         end;
      end;
   end
   else
   begin
      edtNomeGrupo.Clear;
      iGrupo := -1;
   end;
end;



procedure TfrmEntCompromissoEspecialMT.dblcPlanoParamContaExit(Sender: TObject);
begin
   inherited;

   if Trim(dblcPlanoParamConta.Text) <> '' then
      iPPrev := cdsPlano.FieldByName('IDPLANOPREV').AsInteger
   else
      iPPrev := -1;
end;



procedure TfrmEntCompromissoEspecialMT.dblcPatroParamContaExit(Sender: TObject);
begin
   inherited;

   if Trim(dblcPatroParamConta.Text) <> '' then
      iPatro := cdsPatrocinadora.FieldByName('IDPESSOA').AsInteger
   else
      iPatro := -1;
end;



procedure TfrmEntCompromissoEspecialMT.bbtnBuscaGrupoClick(Sender: TObject);
begin
   inherited;

   // Busca o Grupo Orçamentário
   MontaSelectGrupo.Executar;

   if MontaSelectGrupo.RetornouValor then
   begin
      ZeraConta(Sender);

      dbeCodigoGrupo.Text  := MontaSelectGrupo.ValoresChave[0];
      edtNomeGrupo.Text    := MontaSelectGrupo.ValoresChave[2];
      iGrupo               := StrToInt(MontaSelectGrupo.ValoresChave[3]);

      bbtnCCusto.Enabled := True;
   end;
end;



procedure TfrmEntCompromissoEspecialMT.bbtnCCustoClick(Sender: TObject);
begin
   inherited;
   AbreCdsContas;
end;



procedure TfrmEntCompromissoEspecialMT.sqlContaFormartParam(sParamName, sOldValue: String; var sNewValue: String);
begin
   inherited;

   if (sParamName = 'UNIDNEGOC') or
      (sParamName = 'IDPLANOPREV') or
      (sParamName = 'IDPATRO') or
      (sParamName = 'DATAREFERENCIA') then
   begin
      sNewValue := sOldValue;
   end;
end;



procedure TfrmEntCompromissoEspecialMT.dbgrdContaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
     if not(Highlight) then
     begin
       if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
       begin
         ABrush.color := clwhite
       end
       else
       begin
         ABrush.Color := $00C0FFFF; //Amarelo Bebê
       end;
     end;
   end
   else
   begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmEntCompromissoEspecialMT.dbgrdContaTopRowChanged(Sender: TObject);
begin
   inherited;

   // Acerta as cores quando muda a linha da grid
   dbgrdConta.invalidate;
end;



procedure TfrmEntCompromissoEspecialMT.dbgrdContaEnter(Sender: TObject);
begin
   inherited;

   if cdsConta.State in [dsEdit] then cdsConta.Cancel;

   edtCCusto.Text := cdsConta.FieldByName('NOME').AsString;
   redSaldo.Value := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                                                cdsConta.FieldByName('IDCONTAORCAMEN').asString,
                                                FormatDateTime('dd/mm/yyyy',
                                                cdsConta.FieldByName('DATAR').asDateTime),
                                                modulo.sTipoSaldo
                                               );
   edtCentroResp.Text := FormatMaskText(modulo.sMascaraCentRespon + ';0; ',
                               cdsConta.FieldByName('CODCENTRORESPON').AsString) + ' - ' +
                               cdsConta.FieldByName('CRESP').AsString;

end;



procedure TfrmEntCompromissoEspecialMT.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   if not(cdsConta.IsEmpty) then
   begin
      cdsConta.EmptyDataSet;
      //  Rodolpho da Silva - P: 20157 - 14/09/2005
      //cdsConta.Close;
      AbreCdsContas(True);
      
   end;

   CancelarOp(Sender);
end;



procedure TfrmEntCompromissoEspecialMT.CancelarOp(Sender: TObject);
begin
   dbeCodigoGrupo.Text        := '';
   edtNomeGrupo.Text          := '';
   dblcPlanoTrabalho.Text     := '';
   dblcPlanoParamConta.Text   := '';
   dblcPatroParamConta.Text   := '';
   edtCentroResp.Text         := '';

   ZeraConta(Sender);
   dbeCodigoGrupo.SetFocus;
end;



procedure TfrmEntCompromissoEspecialMT.bbtnConfirmarClick(Sender: TObject);
var
   iIdCompromisso    : Integer;
   iIdPessoa         : Integer;
   iExercicio        : Integer;
   iPeriodo          : Integer;
   iIdPlanoOrcamen   : Integer;
   iNumReserva       : Integer;
   iIdModulo         : Integer;
   sIdContaOrcamen   : String;
   sDataReferencia   : String;
   sObsReserva       : String;
   dVlrReserva       : Currency;
   bGravou           : Boolean;
begin
   inherited;

   // inicializa variáveis
   if not(CdsConta.IsEmpty) then
   begin
      // Marcio Motta - 23/03/2005 - 17988
      if not CtrlPeriodoOrcamen.PeriodoLiberado(dbeDataRef.Text, Sistema.IdEmpresa) then
        begin
          MsgDlg('Período BLOQUEADO para lançamentos e alterações!','Erro',mtError,[mbOk],0);
          if dbeDataRef.CanFocus then
             dbeDataRef.SetFocus;
          EXIT;
        end;
      // Fim.............................

      bgravou := True;

      CdsConta.DisableControls;
      CdsConta.First;

      while not(CdsConta.EOF) and (bGravou) do
      begin
         if cdsConta.FieldByName('VLRCOMPROMISSO').AsFloat > 0 then
         begin
            sIdContaOrcamen   := cdsConta.FieldByName('IDCONTAORCAMEN').AsString;
            sDataReferencia   := FormatDateTime('dd/mm/yyyy', cdsConta.FieldByName('DATAR').AsDateTime);
            sObsReserva       := '';
            iIdCompromisso    := CtrlReservaOrcamen.LerUltimaSequencia;
            iIdPessoa         := Sistema.idEmpresa;
            iExercicio        := Year(cdsConta.FieldByName('DATAR').AsDateTime);
            iPeriodo          := OrcamentoBackMT.EncontraPeriodo(sDataReferencia);
            iIdPlanoOrcamen   := Modulo.iPlanoOrc;

            // Verifica a tabela de Saldos para ver se o compromisso pode ser feita
            // com o Saldo corrente
            if Modulo.sPermiteSaldoNeg = 'N' then
            begin
               if not(OrcamentoBackMT.VerificaSaldoProcesso(Modulo.iPlanoOrc,
                                                            cdsConta.FieldByName('IDCONTAORCAMEN').AsString,
                                                            iExercicio,
                                                            iPeriodo,
                                                            CdsConta.FieldByName('VLRCOMPROMISSO').AsFloat,                   // redValor.value,
                                                            True
                                                           )) then
               begin
                  bGravou := False;
                  MsgDlg('Não existe saldo suficiente para este Compromisso. Conta('+cdsConta.FieldByName('IDCONTAORCAMEN').AsString+')' , 'Orçamento', mtWarning, [mbOk], 0);
                  Continue;
               end;
            end;

         // início - André Tavares - pendência 16738 - 07/10/2004
          {  with cdsProxReserva do
            begin
               Close;
               Data        := CtrlReservaorcamen.ProximaReserva(Sistema.idEmpresa);
               iNumReserva := FieldByName('PROXIMA').asInteger + 1;
            end;}
         // fim - André Tavares - pendência 16738 - 07/10/2004

            iIdModulo   := 52;
            dVlrReserva := cdsConta.FieldByName('VLRCOMPROMISSO').AsFloat;

            try
               CtrlSaldoorcado.StartTransactionOrc;

              // início - André Tavares - pendência 16738 - 07/10/2004
               with cdsProxReserva do
               begin
                 Close;
                 CtrlReservaorcamen.GetDataPacket('SELECT * FROM PARAMORCAMENTO FOR UPDATE');
                 Data        := CtrlReservaorcamen.ProximaReserva(Sistema.idEmpresa);
                 iNumReserva := FieldByName('PROXIMA').asInteger + 1;
               end;
              // fim - André Tavares - pendência 16738 - 07/10/2004

               // Atualiza a tabela de Saldos com o Valor do Saldo Compromissado
               if OrcamentoBackMT.VerificaSaldo(iIdPlanoOrcamen,
                                                sIdContaOrcamen,
                                                OrcamentoBackMT.PrimeiroDiaPeriodo(iExercicio, iPeriodo)
                                               ) then
               begin
                  CtrlSaldoorcado.TrocaSaldoReservadopCompromissado(0,
                                                                    dVlrReserva,
                                                                    iIdPessoa,
                                                                    iIdPlanoOrcamen,
                                                                    OrcamentoBackMT.PrimeiroDiaPeriodo(iExercicio,iPeriodo),
                                                                    sIdContaOrcamen
                                                                   );
               end
               else
               begin
                  CtrlSaldoorcado.InsereSaldo(iExercicio,
                                              iPeriodo,
                                              iIdPlanoOrcamen,
                                              iIdPessoa,
                                              sIdContaOrcamen,
                                              OrcamentoBackMT.PrimeiroDiaPeriodo(iExercicio,
                                              iPeriodo),
                                              0,
                                              0,
                                              //-(dVlrReserva),
                                              0,
                                              dVlrReserva,
                                              0,
                                              0
                                             );
               end;

               // Insere Compromisso
               CtrlReservaorcamen.CriaCompromisso(iIdCompromisso,
                                               iIdPessoa,
                                               iExercicio,
                                               iPeriodo,
                                               iIdPlanoOrcamen,
                                               iNumReserva,
                                               iIdModulo,
                                               sIdContaOrcamen,
                                               sDataReferencia,
                                               sObsReserva,
                                               dVlrReserva);

               CtrlSaldoorcado.CommitOrc;
            except
               CtrlSaldoorcado.RollBackOrc;
               bGravou := False;
            end;
         end;

         CdsConta.Next;
      end;

      CdsConta.EnableControls;
      CdsConta.First;

      if bgravou then
      begin
         //  Rodolpho da Silva - P: 20157 - 14/09/2005
         redValor.Value  := 0;
         redSaldo.Value  := 0;
         AbreCdsContas(true);

         MsgDlg('Compromisso(s) efetuado(s) com sucesso.', 'Orçamento', mtWarning, [mbOk], 0);
         Repaint;
      end
      else
      begin
         MsgDlg('Foram detectados problemas na realização do Compromisso.', 'Orçamento', mtWarning, [mbOk], 0);
         Repaint;
      end;
   end;

   // início - André Tavares - pendência 14009
   try
      Sistema.GravaLogOperacoes('Cadastro de Compromisso Orçamentário (Especial).');
   except
      Raise Exception.Create('Não foi possível Gravar o Log');
   end;
   // fim - André Tavares - pendência 14009
end;



procedure TfrmEntCompromissoEspecialMT.dbeDataRefChange(Sender: TObject);
begin
   inherited;

   if dbeDataRef.Focused then
   begin
      redSaldo.value := OrcamentoBackMT.ExibeSaldo(modulo.iPlanoOrc,
                                                   cdsConta.FieldByName('IDCONTAORCAMEN').asString,
                                                   FormatDateTime('dd/mm/yyyy', dbeDataRef.Date),
                                                   modulo.sTipoSaldo
                                                  );
   end;
end;



procedure TfrmEntCompromissoEspecialMT.dblcPlanoTrabalhoExit(Sender: TObject);
begin
   inherited;

   if Trim(dblcPlanoTrabalho.Text) <> '' then
      iUnid := cdsPlanoTrabalho.FieldByName('UNIDNEGOC').AsInteger
   else
      iUnid := 0;
end;



procedure TfrmEntCompromissoEspecialMT.cdsContaAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if dbgrdConta.Focused then dbgrdContaEnter(Self);
end;



procedure TfrmEntCompromissoEspecialMT.dblcCriterioCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var
   sPlaConta : String;
begin
   inherited;

   if (redValorBase.Value = 0) and not(cdsCriterio.FieldByName('PERNUMERO').IsNull) then
   begin
      sPlaConta := '';

      cdsCompOrcamen.Close;
      sqlCompOrcamen.UnPrepare;

      cdsCompOrcamen.Data := CtrlCompromisso.BuscaCompOrcamen(cdsPlanoTrabalho.FieldByName('UNIDNEGOC').AsString,
                                                              dblcPlanoParamConta.LookupValue,
                                                              dblcPatroParamConta.LookupValue,
                                                              iGrupo
                                                             );
      cdsCompOrcamen.First;

      while not(cdsCompOrcamen.EOF) do
      begin
         if sPlaConta = '' then
            sPlaConta := '''' + Espaco(cdsCompOrcamen.FieldByName('PLACONTA').AsString,18) + ''''
         else
            sPlaConta := sPlaConta + ',''' + Espaco(cdsCompOrcamen.FieldByName('PLACONTA').AsString,18) + '''';
         cdsCompOrcamen.Next;
      end;

      if trim(sPlaConta) <> '' then
      begin
         cdsSaldoContabil.Close;
         sqlSaldoContabil.Prepare;
         //  Rodolpho da Silva - P: 20157 - 14/09/2005
         //sqlSaldoContabil.ParamByName('PLACONTA').AsString       := '(PLACONTA IN (' + sPlaConta + ')) ';
         sqlSaldoContabil.SQL.Strings[7] := '(PLACONTA IN (' + sPlaConta + ')) ';

         sqlSaldoContabil.ParamByName('PERNUMERO').AsInteger     := cdsCriterio.FieldByName('PERNUMERO').AsInteger;
         sqlSaldoContabil.ParamByName('PEREXERCICIO').AsInteger  := cdsCriterio.FieldByName('PEREXERCICIO').AsInteger;
         sqlSaldoContabil.ParamByName('IDPESSOA').AsInteger      := Sistema.idEmpresa;
         sqlSaldoContabil.Open;

         redValorBase.Value := (cdsSaldoContabil.FieldByName('SALDOCONTAB').AsFloat * 12)
      end;
   end;
end;



procedure TfrmEntCompromissoEspecialMT.BtCalcClick(Sender: TObject);
var
  rTotal       : Double;
  bComLike     : Boolean;
  bComData     : Boolean;
  bComAnoMes   : Boolean;
  iAno         : Word;
  iMes         : Word;
  iDia         : Word;
  sAnoMes      : String;
  dDataRef     : TDateTime;

  iExercicio   : Integer;
  iPeriodo     : Integer;
begin
   inherited;

   if trim(dblcCriterio.Text) = '' then
   begin
     MsgDlg('Obrigatório indicar o Critério', 'Orçamento', mtError, [mbOk], 0);
     Repaint;

     dblcCriterio.SetFocus;
     Exit;
   end;

   if (CdsConta.IsEmpty) then Exit;

   if (cdsCriterio.FieldByName('TIPORATEIO').AsString = 'M') then
   begin
      CdsConta.DisableControls;
      CdsConta.First;

      rTotal := 0;

      // André Pontes - pendência 16649 - 18/05/2004
      iExercicio := Year(cdsConta.FieldByName('DATAR').AsDateTime);
      iPeriodo := OrcamentoBackMT.EncontraPeriodo(dbeDataRef.Text);
      // FIM André Pontes - pendência 16649 - 18/05/2004

      while not(CdsConta.EOF) do
      begin
         cdsValorCentCust.Close;

         with sqlValorCentCust do
         begin
            Prepare;
            ParamByName('CODCENTROCUSTO').asString     := Espaco(CdsConta.FieldByName('CODCENTROCUSTO').AsString,10);
            ParamByName('IDEMPRESA').asFloat           := Sistema.idEmpresa;
            // André Pontes - pendência 16649 - 18/05/2004
            ParamByName('EXERCICIO').asInteger         := iExercicio;
            ParamByName('PERIODO').asInteger           := iPeriodo;
            // FIM André Pontes - pendência 16649 - 18/05/2004
            ParamByName('IDPESSOA').asInteger          := Sistema.IdEmpresa;
            ParamByName('IDCRITERIORATORC').asInteger  := StrToInt(dblcCriterio.LookUpValue);
            Open;
         end;

         CdsConta.Edit;
         CdsConta.FieldByName('VLRCOMPROMISSO').AsFloat := cdsValorCentCust.FieldByName('VLRCRIRATORC').AsFloat;
         cdsConta.FieldByName('DATAR').AsDateTime       := StrToDate(FormatDateTime('dd/mm/yyyy', Now));
         CdsConta.Post;

         rTotal := rTotal + cdsValorCentCust.FieldByName('VLRCRIRATORC').AsFloat;
         CdsConta.Next;
      end;

      if rTotal <> 0 then
      begin
         CdsConta.First;

         while not(CdsConta.EOF) do
         begin
            CdsConta.Edit;
            CdsConta.FieldByName('VLRCOMPROMISSO').AsFloat := redValorBase.Value * (CdsConta.FieldByName('VLRCOMPROMISSO').AsFloat / rTotal);
            CdsConta.Post;
            CdsConta.Next;
         end;
      end;

      CdsConta.First;
      CdsConta.EnableControls;
   end;

   if cdsCriterio.FieldByName('TIPORATEIO').AsString = 'G' then
   begin
      cdsDataView.Close;

      with sqlDataView do
      begin
         Prepare;
         ParamByName('IDDATAVIEW').AsInteger := cdsCriterio.FieldByName('IDDATAVIEW').AsInteger;
         Open;
      end;

      if not(cdsDataView.FieldByName('TEMPLATE').isNull) then
      begin
         cdsValorCCustAux.Close;

         with sqlValorCCustAux do
         begin
            SQL.Clear;
            SQL.Add(cdsDataView.FieldByName('TEMPLATE').AsString);
         end;

         dDataRef := Date;
         if not(cdsCriterio.FieldByName('PERNUMERO').IsNull) then
         begin
            dDataRef := cdsCriterio.FieldByName('PERDATFIM').AsDatetime;
         end;

         bComData := True;
         if pos(':DATA', AnsiUpperCase(cdsDataView.FieldByName('TEMPLATE').AsString)) = 0 then
         begin
            bComData := False;
         end;

         sAnoMes  := '';
         bComLike := True;
         if pos('LIKE :CODCENTROCUSTO', AnsiUpperCase(cdsDataView.FieldByName('TEMPLATE').AsString)) = 0 then
         begin
            bComLike := False;
         end;

         if pos(':ANOMES',AnsiUpperCase(cdsDataView.FieldByName('TEMPLATE').AsString)) = 0 then
         begin
            bComAnoMes := False;
         end
         else
         begin
            bComAnoMes  := True;
            sAnoMes     := FormatDateTime('yyyy', dDataRef) + FormatDateTime('mm', dDataRef);
         end;


         rTotal  :=0;

         CdsConta.DisableControls;
         CdsConta.First;

         while not(CdsConta.EOF) do
         begin
            cdsValorCCustAux.Close;

            with sqlValorCCustAux do
            begin
               Prepare;

               if bComLike then
               begin
                  ParamByName('CODCENTROCUSTO').asString := TRIM(CdsConta.FieldByName('CODCENTROCUSTO').AsString) + '%';
               end
               else
               begin
                  ParamByName('CODCENTROCUSTO').asString := Espaco(CdsConta.FieldByName('CODCENTROCUSTO').AsString,10);
               end;

               ParamByName('IDEMPRESA').asFloat := Sistema.idEmpresa;

               if bComData then   ParamByName('DATA').asDateTime  := dDataRef;
               if bComAnoMes then ParamByName('ANOMES').AsString  := sAnoMes;

               Open;
            end;

            CdsConta.Edit;
            CdsConta.FieldByName('VLRCOMPROMISSO').AsFloat := cdsValorCCustAux.FieldByName('VALOR').AsFloat;
            CdsConta.Post;

            rTotal := rTotal + cdsValorCCustAux.FieldByName('VALOR').AsFloat;

            CdsConta.Next;
         end;

         if rTotal <> 0 then
         begin
            CdsConta.First;

            while not(CdsConta.EOF) do
            begin
               CdsConta.Edit;
               CdsConta.FieldByName('VLRCOMPROMISSO').AsFloat := redValorBase.Value * (CdsConta.FieldByName('VLRCOMPROMISSO').AsFloat/rTotal);
               CdsConta.Post;

               CdsConta.Next;
            end;
         end;

         CdsConta.First;
         CdsConta.EnableControls;
      end;
   end;
   dbgrdContaEnter(Self);
end;



procedure TfrmEntCompromissoEspecialMT.dbeDataRefExit(Sender: TObject);
begin
   inherited;

   if not(CdsConta.EOF) then
   begin
      if (dbeDataRef.Text = '') then
      begin
         MsgDlg('É preciso informar uma data', 'Orçamento', mtWarning, [ mbOk ], 0);
         Repaint;

         CdsConta.Cancel;
         dbeDataRef.SetFocus;
      end
      // Início - Rodolpho da Silva - P: 20157 - 14/09/2005
      else
      if redValor.Value > redSaldo.Value then
      begin
         MsgDlg('Não há saldo suficiente para este valor de compromisso ' + #13 +
                'Valor divergente: ' + FormatFloat('#,##0.00',(redSaldo.Value - redValor.Value)), 'Orçamento', mtWarning, [ mbOk ], 0);
         redValor.SetFocus;
         Repaint;
      end
      // Fim - Rodolpho da Silva - P: 20157 - 14/09/2005

      else
      begin
         if (CdsConta.State = dsEdit) then CdsConta.Post;
      end;
   end;
end;




procedure TfrmEntCompromissoEspecialMT.FormDestroy(Sender: TObject);
begin
  inherited;
  // Marcio Motta - 23/03/2005 - 17988
  // --> Ctrl's NÃO estavam sendo destruídos
  FreeAndNil(CtrlPeriodoOrcamen);
  FreeAndNil(CtrlReservaorcamen);
  FreeAndNil(CtrlSaldoorcado);
  FreeAndNil(CtrlCompromisso);
  // Fim................................

  FreeAndNil(CtrlReservaorcamen); //andré tavares - pendência 17608
end;

procedure TfrmEntCompromissoEspecialMT.dblcPatroParamContaCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //andre tavares - pendência 17608
  cdsPlano.data := CtrlPlanPrevContabPatro.ListaPlanoPatro(-1, strToIntDef(dblcPatroParamConta.LookupValue, -1));
end;




procedure TfrmEntCompromissoEspecialMT.AbreCdsContas(bAbreVazio: boolean);
begin
   if bAbreVazio then
      iGrupo := -1;

   // Faz a verificação do preenchimento dos campos e traz centros de custos
   with sqlConta do
   begin
      if not(cdsConta.IsEmpty) then
      begin
         cdsConta.EmptyDataSet;
         cdsConta.Close;
      end;

      Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := modulo.iPlanoOrc;
      ParamByName('IDPESSOAACESSO').AsInteger := sistema.IdUsuario;
      ParamByName('IDPESSOA').AsInteger       := sistema.idEmpresa;
      ParamByName('IDGRUPOORCAMEN').AsInteger := iGrupo;

      if iUnid = 0 then
         ParamByName('UNIDNEGOC').AsString    := '(C.UNIDNEGOC Is Null) AND '
      else
         ParamByName('UNIDNEGOC').AsString    := '(C.UNIDNEGOC = ' + IntToStr(iUnid) + ') AND ';

      if iPPrev = -1 then
         ParamByName('IDPLANOPREV').AsString  := '(C.IDPLANOPREV Is Null) AND '
      else
         ParamByName('IDPLANOPREV').AsString  := '(C.IDPLANOPREV = ' + IntToStr(iPPrev) + ') AND ';

      if iPatro = -1 then
         ParamByName('IDPATRO').AsString      := '(C.IDPATRO Is Null)'
      else
         ParamByName('IDPATRO').AsString      := '(C.IDPATRO = ' + IntToStr(iPatro) + ')';

      ParamByName('DATAREFERENCIA').AsString := 'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', date) + ''',''DD/MM/YYYY'') AS DATAR ';

      Open;
   end;



   // Se não for para abrir vazio, executa estas etapas
   if not bAbreVazio then
   begin
      if (cdsConta.IsEmpty) then
      begin
         MsgDlg('Não foi encontrada conta para os parâmetros informados', 'Orçamento', mtError, [mbOk], 0);
         Repaint;

         if dbeCodigoGrupo.CanFocus then dbeCodigoGrupo.SetFocus;
         dbgrdConta.Enabled := False;
         Exit;
      end
      else
      begin
         with cdsConta do
         begin
            dbgrdConta.Enabled := True;

            Next;                           // Para forçar atualização
            First;                         // de alguns controles

            iConta := FieldByName('IDCONTAORCAMEN').AsString;

            edtCCusto.Text := cdsConta.FieldByName('NOME').AsString;
            edtCentroResp.Text := FormatMaskText(modulo.sMascaraCentRespon + ';0; ',
                                  FieldByName('CODCENTRORESPON').AsString) + ' - ' +
                                  FieldByName('CRESP').AsString;
        end;
      end;
   end;
end;



//  Rodolpho da Silva - P: 20157 - 14/09/2005
procedure TfrmEntCompromissoEspecialMT.dbgrdContaUpdateFooter(
  Sender: TObject);
var
  CdsAux: TClientDataSet;
  rValor: Extended;

begin
  inherited;
  try
     CdsAux      := TCMClientDataSet.Create(nil);
     rValor      := 0;
     CdsAux.Data := CdsConta.Data;

     while not CdsAux.Eof do
     begin
        rValor := rValor + CdsAux.FieldByName('VLRCOMPROMISSO').AsFloat;
        CdsAux.Next;
     end;

     (sender as TwwDBGrid).ColumnByName('VLRCOMPROMISSO').FooterValue := FormatFloat('#,##0.00',rValor);

  finally
     FreeAndNil(CdsAux);
  end;
end;

end.
