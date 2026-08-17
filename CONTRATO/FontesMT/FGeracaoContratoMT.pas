{*******************************************************************************
  Alterações:
********************************************************************************
{-------------------------------------------------------------------------------
 Rotinas   : Várias
 Data      : 04/08/2004
 Autor     : David Ayrolla
 Pendências: 16832 e 17232
 Descrição : Limitar a retenção de INSS de autônomos ao teto.
-------------------------------------------------------------------------------}

unit FGeracaoContratoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, Wwdatsrc, DBTables,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker, uCtrlGeracaoContrato,
  uCtrlListTercContratos, mContrato, wwdblook, DBClient, uCMClientDataSet,
  Mask, wwdbedit, TREdit, DBCtrls, MontaSelect, mOrcamento, uCtrlOrcamento,
  uCtrlParamContrato, uCtrlUsuXContrato, uCtrlServProdxItemContr;

type
  TfrmGeracaoContratoMT = class(TfrmOkCancelar)
    cdsFormasPagamento: TCMClientDataSet;
    MsContaCor: TMontaSelect;
    cdsDadosConta: TCMClientDataSet;
    PgCtrl: TPageControl;
    tsFiltrosParam: TTabSheet;
    tsLog: TTabSheet;
    pbGeracao: TProgressBar;
    GroupBox2: TGroupBox;
    edtpDataGera: TCMDateTimePicker;
    GrpBoxDtLanc: TGroupBox;
    edtpDataLanc: TCMDateTimePicker;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    edtIni: TCMDateTimePicker;
    edtFim: TCMDateTimePicker;
    molContrato1: TmolContrato;
    RdGeraParc: TRadioGroup;
    chkNaoContabiliza: TCheckBox;
    Label5: TLabel;
    Panel2: TPanel;
    EdtLog: TMemo;
    pnlGeracao: TPanel;
    PageControl1: TPageControl;
    tsGeral: TTabSheet;
    lblFormaPG: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dblcFormaPG: TwwDBLookupCombo;
    edtHist: TEdit;
    dbeNumDocumento: TDBRealEdit;
    dbeComplDoc: TwwDBEdit;
    GpConta: TGroupBox;
    lblBanco: TLabel;
    lblNo: TLabel;
    lblAgencia: TLabel;
    BtnBuscaContaCor: TSpeedButton;
    dbeBanco: TwwDBEdit;
    dbeAgencia: TwwDBEdit;
    dbeConta: TwwDBEdit;
    molOrcamento1: TmolOrcamento;
    tsObs: TTabSheet;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    memObs: TMemo;
    tsFicha: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    edtCodBarra: TEdit;
    edtLinhaDig: TEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure molContrato1btnBuscaContratoClick(Sender: TObject);
    procedure molContrato1btnLimpaContratoClick(Sender: TObject);
    procedure BtnBuscaContaCorClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
     sOperacao              : String;
     CtrlListTerc           : TCtrlListTercContratos;
     CtrlGerContrato        : TCtrlGeracaoContrato;
     CtrlOrcamento          : TOrcamentoBackMT;
     CtrlParamContrato      : TCtrlParamContrato;
     CtrlUsuXContrato       : TCtrlUsuXContrato;
     cdsTemp                : TCMClientDataSet;
     CtrlServProdxItemContr : TCtrlServProdxItemContr;

     procedure AtualizaProgressBar(msg: String);
     procedure HabilitaPainel;
     procedure CarregaUltimaParcela;
     function GeraContratoNovo(const dDataGeracao,dDataLanc,dIniVencto,dFimVencto:TDateTime;
                               const bContabiliza:Boolean = True;
                               const iIdContrato:Integer = -1;
                               const iIdFormaRecPag:Integer = -1;
                               const fNumDoc:Double = 0;
                               const sCompDoc:String = '';
                               const sHistCompl:String = '';
                               const sCodBarra:String = '';
                               const sLinhaDig:String = '';
                               const sObs:String = '';
                               const iContaBanco:Integer = 0;
                               const iIdReservaOrcamen:Double = 0;
                               const iGeraVarias:Integer = 0): Boolean;


  public
    { Public declarations }
  end;

var
  frmGeracaoContratoMT: TfrmGeracaoContratoMT;
  iEmpresaProp,liExercicio,liPeriodo,liRetFuncao,
  IdPatro,IdPrograma,IdPlanoPrev:LongInt;
  IdContaBanco : Double;

implementation

uses dBaseDados, uSistema, uMensErro, dMS, FRetINSSOutros;

{$R *.DFM}

procedure TfrmGeracaoContratoMT.FormCreate(Sender: TObject);

begin
   inherited;
   CtrlGerContrato := TCtrlGeracaoContrato.Create(Sistema.IdEmpresa,
                                                  Sistema.IdModulo,
                                                  Sistema.IdUsuario,
                                                  Sistema.IdEspAcesso,
                                                  Sistema.UsaPlanoPatro);

   CtrlGerContrato.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer,True,
                              AtualizaProgressBar);

   //DAVID - Retenção de INSS
   CtrlGerContrato.OnRecuperaOutros := RetINSSOutrasEmpresas;

   CtrlListTerc := TCtrlListTercContratos.Create;
   CtrlListTerc.Initialize(dtmBaseDados.dbBaseDados,True);

   // Marcio Motta - 27/05/2004 - Pendência: 16788
   CtrlOrcamento := TOrcamentoBackMT.Create;
   CtrlOrcamento.InitializeAs(CtrlListTerc);
   CtrlOrcamento.IdEmpresa := Sistema.IdEmpresa;
   CtrlOrcamento.IdUsuario := Sistema.IdUsuario;

   cdsFormasPagamento.Data := CtrlListTerc.ListFormaRecPag(-1,''); //vazio

   molContrato1.btnLimpaContratoClick( Self );
   edtpDataGera.Date  := Date;
   edtpDataLanc.Date  := Date;
   pnlGeracao.Enabled := False;

   // Marcos Topini - Pendência 19333 - 28/07/2006 - Início -------------------

   PgCtrl.ActivePageIndex := 0;
   EdtLog.Clear;

   CtrlParamContrato := TCtrlParamContrato.Create;
   CtrlParamContrato.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlUsuXContrato := TCtrlUsuXContrato.Create;
   CtrlUsuXContrato.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlServProdxItemContr := TCtrlServProdxItemContr.Create;
   CtrlServProdxItemContr.Initialize(dtmBaseDados.dbBaseDados,True);

   cdsTemp := TCMClientDataSet.Create( nil );
   cdsTemp.Data := CtrlParamContrato.ListParamContrato( Sistema.IdEmpresa );
   if (cdsTemp.FieldByName('FLGDTLANCTO').AsString = 'S') then begin
      GrpBoxDtLanc.Enabled := False;
      edtpDataLanc.Enabled := False;
      edtpDataLanc.ClearDateTime;
      end
     else begin
       GrpBoxDtLanc.Enabled := True;
       edtpDataLanc.Enabled := True
     end;

   // Fim Pendência 19333 -----------------------------------------------------

end;

procedure TfrmGeracaoContratoMT.bbtnConfirmarClick(Sender: TObject);
var iFormaRecPag, iContaBanco, iIdReservaorcamento : Integer;
    cds         : TCMClientDataSet;
    dDataLanc   : TDateTime;
    Ano,Mes,Dia : Word;
    bContratoGerado : Boolean;
begin
   inherited;
   if (Trim(edtpDataGera.Text)='') then begin
      MsgDlg('Obrigatório preencher a Data de Geração','Atenção',mtWarning,[mbOk],0);
      edtpDataGera.SetFocus;
      Exit;
   end;

   if (Trim(edtpDataLanc.Text)='') and (cdsTemp.FieldByName('FLGDTLANCTO').AsString = 'N') then begin
      MsgDlg('Obrigatório preencher a Data de Lançamento','Atenção',mtWarning,[mbOk],0);
      edtpDataLanc.SetFocus;
      Exit;
   end;

   if (Trim(edtIni.Text)='') then begin
      MsgDlg('Obrigatório preencher a Data de Início do período de vencimento','Atenção',mtWarning,[mbOk],0);
      edtIni.SetFocus;
      Exit;
   end;

   if (Trim(edtFim.Text)='') then begin
      MsgDlg('Obrigatório preencher a Data de Término do período de vencimento','Atenção',mtWarning,[mbOk],0);
      edtFim.SetFocus;
      Exit;
   end;

   if edtFim.Date < edtIni.Date then begin
      MsgDlg('Data de Término não deve ser inferior a Data de Início','Atenção',mtWarning,[mbOk],0);
      edtFim.SetFocus;
      Exit;
   end;

   // Marcio Motta - 27/05/2004 - Pendência: 16788
   // Limpa o mol de orçamento caso o valor seja excluído manualmente do campo
   if (molOrcamento1.edtCompOrc.Value <= 0) then begin
     molOrcamento1.Clear;
   end else begin
     // Busca ID da reserva de orçamento caso tenha sido digitado, ao invés de buscar no MontaSelect
     if (molOrcamento1.edtCompOrc.Value > 0) and (molOrcamento1.iIdCompromisso <= 0) then begin
       molOrcamento1.iIdCompromisso := CtrlOrcamento.BuscaIdNumReserva(0, StrToInt(FloatToStr(molOrcamento1.edtCompOrc.Value)), True);
       if molOrcamento1.iIdCompromisso = 0 then begin
         MsgDlg(CtrlOrcamento.MessageInfo,'Aviso',mtWarning,[mbOk],0);
         molOrcamento1.Clear;
         EXIT;
       end;
     end;
   end;

   if dblcFormaPG.LookupValue <> '' then
        iFormaRecPag := StrToInt(dblcFormaPG.LookupValue)
   else iFormaRecPag := -1;

   // Marcio Motta - 28/05/2004 - 16788
   iContaBanco := 0;
   if not cdsDadosConta.IsEmpty then
     if not cdsDadosConta.FieldByName('IDCBANCARIA').IsNull then
        iContaBanco := cdsDadosConta.FieldByName('IDCBANCARIA').AsInteger;

   if (molContrato1.iContrato > 0) and (MsContaCor.RetornouValor) then
      iContaBanco := StrToIntDef(MsContaCor.ValoresChave[0],0);

   pbGeracao.Position := 0;

   // Marcio Motta - 21/05/2004 - 16788
   // Guarda o Número da Reserva orçamentária
   if molOrcamento1.iIdCompromisso > 0 then
        iIdReservaorcamento := molOrcamento1.iIdCompromisso
   else iIdReservaOrcamento := 0;

   // Inicio pendência 19333 - Marcos Topini - 28/07/2006 ................................
   cds := TCMClientDataSet.Create( nil );
    if (RdGeraParc.ItemIndex = 1) then begin // Gerar todas as parcelas existentes no intervalo
      bContratoGerado := False;
      While true do begin
        cds.Data := CtrlUsuXContrato.ListGeracaoContrato(Sistema.IdEmpresa,
                                                          Sistema.IdUsuario,
                                                          molContrato1.iContrato,
                                                          edtIni.Date,edtFim.Date);

         // Verifica se ainda existem parcelas pendentes para pagamento
         if not CtrlServProdxItemContr.ExisteParcPendente(Sistema.IdEmpresa,molContrato1.iContrato,cds.FieldByName('IDOBJETO').AsInteger,cds.FieldByName('IDITEM').AsInteger) then begin
            MsgDlg(CtrlServProdxItemContr.MessageInfo,'Aviso',mtWarning,[mbOk],0);
            EdtLog.Lines.Add('Erro - ' + CtrlServProdxItemContr.MessageInfo);
            Break;
         end else begin
            if CtrlServProdxItemContr.MessageInfo <> '' then begin
               if MsgDlg(CtrlServProdxItemContr.MessageInfo +#13+
                         'Confirma a geração da Parcela ?' ,'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then Break;
               EdtLog.Lines.Add('Aviso - ' + CtrlServProdxItemContr.MessageInfo);
            end;
         end;

         If (cds.IsEmpty) or ((cds.FieldByName('DATAVENC').AsDateTime < edtIni.Date) or
                              (cds.FieldByName('DATAVENC').AsDateTime > edtFim.Date)) then begin
            Break;
         end else begin

            if (cdsTemp.FieldByName('FLGDTLANCTO').AsString = 'S') then
                 dDataLanc := -1
            else dDataLanc := edtpDataLanc.Date;

            if GeraContratoNovo(edtpDataGera.Date, dDataLanc,
                                edtIni.Date, edtFim.Date,
                                ( not chkNaoContabiliza.Checked ),
                                molContrato1.iContrato,
                                iFormaRecPag, dbeNumDocumento.Value,
                                dbeComplDoc.Text, edtHist.Text,
                                edtCodBarra.Text, edtLinhaDig.Text,
                                memObs.Text, iContaBanco, iIdReservaOrcamento,
                                RdGeraParc.ItemIndex) then
               bContratoGerado := True;
         end; // else
      end; // While

      if bContratoGerado then begin
         if EdtLog.Text = '' then
              MsgDlg('Contrato Gerado com Sucesso','Atenção',mtWarning,[mbOk],0)
         else begin
           MsgDlg('Contrato Gerado com Restrições. Verifique o Log gerado','Atenção',mtWarning,[mbOk],0);
           PgCtrl.ActivePageIndex := 1;
         end;
         dbeNumDocumento.Clear;
         dbeComplDoc.Clear;
         edtCodBarra.Clear;
         edtLinhaDig.Clear;
      end
      else begin
        if CtrlServProdxItemContr.MessageInfo = '' then
          MsgDlg('Não existem parcelas a serem geradas no período informado','Atenção',mtWarning,[mbOk],0)
        else
          MsgDlg('O Contrato não foi gerado','Atenção',mtWarning,[mbOk],0)
      end;

   end  // If
   else begin
      GeraContratoNovo(edtpDataGera.Date, edtpDataLanc.Date,
                       edtIni.Date, edtFim.Date,
                       ( not chkNaoContabiliza.Checked ),
                       molContrato1.iContrato,
                       iFormaRecPag, dbeNumDocumento.Value,
                       dbeComplDoc.Text, edtHist.Text,
                       edtCodBarra.Text, edtLinhaDig.Text,
                       memObs.Text, iContaBanco, iIdReservaOrcamento,
                       RdGeraParc.ItemIndex);
   end;
   // Fim pendência 19333 ..................................................................

end;

function TfrmGeracaoContratoMT.GeraContratoNovo(const dDataGeracao,dDataLanc,dIniVencto,dFimVencto:TDateTime;
                                                const bContabiliza:Boolean;
                                                const iIdContrato:Integer;
                                                const iIdFormaRecPag:Integer;
                                                const fNumDoc:Double;
                                                const sCompDoc:String;
                                                const sHistCompl:String;
                                                const sCodBarra:String;
                                                const sLinhaDig:String;
                                                const sObs:String;
                                                const iContaBanco:Integer;
                                                const iIdReservaOrcamen:Double;
                                                const iGeraVarias:Integer): Boolean;
begin
   try
      Result := True;
      if not CtrlGerContrato.GeraContratoNovo(dDataGeracao,dDataLanc,dIniVencto,dFimVencto,
                                              bContabiliza,iIdContrato,iIdFormaRecPag,
                                              fNumDoc,sCompDoc,sHistCompl,
                                              sCodBarra,sLinhaDig,sObs,
                                              iContaBanco,iIdReservaOrcamen) then
         raise exception.create(CtrlGerContrato.MessageInfo);
      if iGeraVarias = 0 then begin
         MsgDlg('Contrato(s) Gerado(s) com Sucesso','Atenção',mtWarning,[mbOk],0);
         dbeNumDocumento.Clear;
         dbeComplDoc.Clear;
         edtCodBarra.Clear;
         edtLinhaDig.Clear;
      end;
   except
      on E:Exception do begin
         Result := False;
         MsgDlg( e.message, 'Erro', mtError, [mbOK], 0 );
      end;
   end;
end;


procedure TfrmGeracaoContratoMT.AtualizaProgressBar(msg: String);
begin
   if (Copy(msg,1,1)='*') then begin
     if (pbGeracao.Max <> CtrlGerContrato.MaxProgresso) then
         pbGeracao.Max := CtrlGerContrato.MaxProgresso;
     pbGeracao.StepIt;
   end;
end;

procedure TfrmGeracaoContratoMT.molContrato1btnBuscaContratoClick(Sender: TObject);
begin
  inherited;
  molContrato1.sStatus := 'A';
  molContrato1.btnBuscaContratoClick(Sender);

  // Marcio Motta - 27/05/2004 - Pendência: 16788
  cdsDadosConta.Close;
  cdsDadosConta.Data := CtrlListTerc.ListDadosContaBanc(molContrato1.iForCli);

  dbeBanco.Text      := cdsDadosConta.FieldByName('NUMBANCO').AsString;
  dbeAgencia.Text    := cdsDadosConta.FieldByName('NUMAGENCIA').AsString;
  dbeConta.Text      := cdsDadosConta.FieldByName('CONTACORRENTE').AsString;

  HabilitaPainel;
end;

procedure TfrmGeracaoContratoMT.molContrato1btnLimpaContratoClick(Sender: TObject);
begin
  inherited;
  molContrato1.btnLimpaContratoClick(Sender);
  HabilitaPainel;
end;

procedure TfrmGeracaoContratoMT.HabilitaPainel;
begin
  if molContrato1.iContrato > 0 then begin
     if molContrato1.sTipoContr = 'A' then
          cdsFormasPagamento.Data := CtrlListTerc.ListFormaRecPag(Sistema.IdEmpresa,'R')
     else cdsFormasPagamento.Data := CtrlListTerc.ListFormaRecPag(Sistema.IdEmpresa,'P');
     pnlGeracao.Enabled := True;
     CarregaUltimaParcela;

     RdGeraParc.Enabled := true;

     // Habilita o grupo de conta bancária
     lblFormaPG.Enabled  := True;
     dblcFormaPG.Enabled := True;
     lblBanco.Enabled    := True;
     dbeBanco.Enabled    := True;
     lblAgencia.Enabled  := True;
     dbeAgencia.Enabled  := True;
     lblNo.Enabled       := True;
     dbeConta.Enabled    := True;
     BtnBuscaContaCor.Enabled := True;

     dblcFormaPG.SetFocus;
  end else begin
     dblcFormaPG.LookupValue := '';
     dbeNumDocumento.Clear;
     dbeComplDoc.Clear;
     edtHist.Clear;
     memObs.Clear;
     dbeBanco.Clear;
     dbeAgencia.Clear;
     dbeConta.Clear;

     pnlGeracao.Enabled   := False;
     RdGeraParc.Enabled   := False;
     RdGeraParc.ItemIndex := 0;
  end;
end;


procedure TfrmGeracaoContratoMT.CarregaUltimaParcela;
var cdsTemp : TCMClientDataSet;
begin
  try
     // Traz a ultima parcela gerada como default
     cdsTemp := TCMClientDataSet.Create(nil);
     cdsTemp.Data := CtrlGerContrato.ListUltimaParcela( molContrato1.iContrato );
     if not cdsTemp.IsEmpty then begin
        dblcFormaPG.LookupValue := cdsTemp.FieldByName('CODFORMA').AsString;
        edtHist.Text := cdsTemp.FieldByName('HISTORICOCOMPL').AsString;
        memObs.Text  := cdsTemp.FieldByName('OBSERVACAO').AsString;
     end else begin
        dblcFormaPG.LookupValue := '';
        edtHist.Clear;
        memObs.Clear;
     end;
     dbeNumDocumento.Clear;
     dbeComplDoc.Clear;
  finally
     FreeAndNil( cdsTemp );
  end;
end;

procedure TfrmGeracaoContratoMT.BtnBuscaContaCorClick(Sender: TObject);
begin
   inherited;
   MsContaCor.Filtro.Clear;
   MsContaCor.Filtro.Add('PESSOA.IDPESSOA = BANCO.IDPESSOA');
   MsContaCor.Filtro.Add('AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA');
   MsContaCor.Filtro.Add('CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA');
   MsContaCor.Filtro.Add('CONTABANCARIA.IDPESSOA = '+ IntToStr(molContrato1.iForCli));

   MsContaCor.Executar;

   if MsContaCor.RetornouValor then begin
      dbeConta.Text   := MsContaCor.ValoresChave[1]; //CONTABANCARIA.CONTACORRENTE
      dbeBanco.Text   := MsContaCor.ValoresChave[2]; //BANCO.NUMBANCO
      dbeAgencia.Text := MsContaCor.ValoresChave[3]; //AGENCIABANCARIA.NUMAGENCIA
   end;
end;


procedure TfrmGeracaoContratoMT.FormDestroy(Sender: TObject);
begin
   CtrlGerContrato.Free;
   CtrlListTerc.Free;
   FreeAndNil(cdsTemp);
   FreeAndNil(CtrlParamContrato);
   FreeAndNil(CtrlUsuXContrato);
   FreeAndNil(CtrlUsuXContrato);
   inherited;
end;

end.
