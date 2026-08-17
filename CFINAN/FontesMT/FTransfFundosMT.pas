//***************************************************************************************
// WO11468 - Controle Financeiro - Transferência entre contas (incluir)
// Alterado por Arnaldo V. Scarin em 18/07/2024
// A rotina Abaixo é executada a cada alteração do Tipo de Recebimento de Transferencia
// Mas se a Rotina não teve mudança no texto, o Tipo de Desembolso não é Liberado
// ficando inativo. Para corrigir a situação, se o Tipo de Desembolso estiver ativo
// mesmo que não haja mudança no Tipo de Recebimento, esse LookupComboBox ficará ativo
//***************************************************************************************
//Nº SOL............: 260642
//Nº PPM............: 1201711
//Data da Alteração.: 11/12/2015
//Alteração Form....: btnIncluirRateioClick
//Responsável.......: William Santana
//Descrição.........: O histórico do lançamento está ficando errado...
//**************************************************************************************


unit FTransfFundosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient, uCMClientDataSet,
  Wwdatsrc, Mask, wwdbedit, uCtrlTransfFundos, uCtrlListTercFinanc,
  uCtrlParamFinanc, uCtrlHistPadrao, ComCtrls, uCmSqlParams, uCtrlPlanPrevContabPatro;

type
  TfrmTransfFundosMT = class(TfrmOkCancelar)
    dsContaOrigem: TwwDataSource;
    dsContaDestino: TwwDataSource;
    cdsContaOrigem: TCMClientDataSet;
    cdsContaDestino: TCMClientDataSet;
    cdsUnidNegocio: TCMClientDataSet;
    cdsTipoRec: TCMClientDataSet;
    cdsPatrocinador: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsHistorico: TCMClientDataSet;
    pgcTransfFundos: TPageControl;
    tbsGeral: TTabSheet;
    tbsPrevidenciario: TTabSheet;
    pnlGrids: TPanel;
    dbgRateio: TwwDBGrid;
    pnlDadosRateio: TPanel;
    Label4: TLabel;
    dblcPatrocinadorOrigem: TwwDBLookupCombo;
    Label5: TLabel;
    dblcPlanoPrevOrigem: TwwDBLookupCombo;
    pnlBotoesRateio: TPanel;
    redValorRateio: TRealEdit;
    Label1: TLabel;
    btnIncluirRateio: TBitBtn;
    btnExcluirRateio: TBitBtn;
    dsRateios: TDataSource;
    cdsRateios: TCMClientDataSet;
    spRateios: TCMSqlParams;
    Label2: TLabel;
    dblcPatrocinadorDestino: TwwDBLookupCombo;
    Label9: TLabel;
    dblcPlanoPrevDestino: TwwDBLookupCombo;
    cdsTipoDes: TCMClientDataSet;
    pnlDadosTransf: TPanel;
    lblContaDe: TLabel;
    dbeContaOrigem: TwwDBEdit;
    lblContaPara: TLabel;
    dbeContaDestino: TwwDBEdit;
    lblData: TLabel;
    edDataLanc: TCMDateTimePicker;
    lblValor: TLabel;
    ednValorCorrente: TRealEdit;
    lblDocumento: TLabel;
    edNumDoc: TEdit;
    lblHistorico: TLabel;
    edHistorico: TEdit;
    lblHistPad: TLabel;
    dblcHistPad: TwwDBLookupCombo;
    lblUnidNegoc: TLabel;
    dblcUnidNegocOri: TwwDBLookupCombo;
    rgTipoDocTransf: TGroupBox;
    Label6: TLabel;
    lblTituloTipoDes: TLabel;
    dblcTipoRecTransf: TwwDBLookupCombo;
    dblcTipoDesTransf: TwwDBLookupCombo;
    cbImprimecheque: TCheckBox;
    PnlDadosOrigem: TPanel;
    pnlContaDe: TPanel;
    dbgContaDe: TwwDBGrid;
    pnlSaldoOrigem: TPanel;
    Label7: TLabel;
    edSaldoOrigem: TRealEdit;
    pnlDadosDestino: TPanel;
    pnlContaPara: TPanel;
    dbgContaPara: TwwDBGrid;
    pnlSaldoDestino: TPanel;
    Label8: TLabel;
    edSaldoDestino: TRealEdit;
    redRateado: TRealEdit;
    Label10: TLabel;
    CMSqlParams1: TCMSqlParams;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cdsContaOrigemAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnIncluirRateioClick(Sender: TObject);
    procedure btnExcluirRateioClick(Sender: TObject);
    procedure dsRateiosDataChange(Sender: TObject; Field: TField);
    procedure redValorRateioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dblcTipoRecTransfChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure dbgContaDeEnter(Sender: TObject);
    procedure pgcTransfFundosChanging(Sender: TObject; var AllowChange: Boolean);
    procedure cdsRateiosAfterOpen(DataSet: TDataSet);


  private { Private declarations }
    TipoRecTransf : String;
    TipoDesTransf : String;


   DadosTransf : TDadosTransf;

    bImpCheque        : Boolean;
    rTotalRateado     : Double;

    PlanPrevContabPatro: TCtrlPlanPrevContabPatro;

    CtrlListTerceiros : TCtrlListTercFinanc;
    CtrlHistPadrao    : TCtrlHistPadrao;
    CtrlTransfFundos  : TCtrlTransfFundos;
    CtrlParamFinanc   : TCtrlParamFinanc;

    procedure CarregaSaldos;
    procedure HabDesControles(rValor: Double);
    procedure MontaDefaultPlanoPatro;


  public  { Public declarations }


  end;




var
  frmTransfFundosMT: TfrmTransfFundosMT;




implementation
{$R *.DFM}
uses
  uSistema, dBaseDados, uMensErro, uCtrlParamIntegra, FEmiteChequeMT;



procedure TfrmTransfFundosMT.FormCreate(Sender: TObject);
var
   cdsAux : TCMClientDataSet;
begin
   inherited;

   //Inicializa CtrlTransfFundos
   CtrlTransfFundos:=TCtrlTransfFundos.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                              Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlTransfFundos.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlParamFinanc
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True);


   PlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
   PlanPrevContabPatro.Initialize(dtmBaseDados.dbBaseDados,True);


   //Carrega cds's de Conta Origem e Destino
   cdsContaOrigem.Data  := CtrlTransfFundos.ListPortadorComSaldo;
   cdsContaDestino.Data := cdsContaOrigem.Data;

   cdsAux:=TCMClientDataSet.Create(nil);
   try
      //Carrega Parâmetros Globais
      cdsAux.Data:=CtrlListTerceiros.ListParamGlobal(Sistema.IdEmpresa);

      //Carrega cds de Unidade de Negócio
      if (cdsAux.FieldByName('USAABC').AsString='S') then
          cdsUnidNegocio.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,0,'A','')
      else
       begin
          cdsUnidNegocio.Data:=CtrlListTerceiros.ListUnidNegocio(Sistema.IdEmpresa,
                                                     cdsAux.FieldByName('UNIDNEGOC').AsFloat,'','');
          dblcUnidNegocOri.Enabled:=False;
       end;

      if (cdsUnidNegocio.RecordCount=1) then
       begin
          dblcUnidNegocOri.LookupValue  := cdsUnidNegocio.FieldByName('UNIDNEGOC').AsString;
       end;

       //Carrega cds Tipo de Rec/Des
       cdsTipoRec.Data:=CtrlListTerceiros.ListTipoRD(Sistema.IdEmpresa,'R','');
       cdsTipoDes.Data:=CtrlListTerceiros.ListTipoRD(Sistema.IdEmpresa,'P','');

       if Sistema.UsaPlanoPatro then
        begin
           cdsPatrocinador.Data := CtrlListTerceiros.ListPatrocinador;
           cdsPlanoPrev.Data    := CtrlListTerceiros.ListPlanoPrev;
        end;

       //Inicializa CtrlHistPadrao
       CtrlHistPadrao:=TCtrlHistPadrao.Create;
       CtrlHistPadrao.Initialize(dtmBaseDados.dbBaseDados,True);

       //Carrega cds de Históricos
       cdsHistorico.Data:=CtrlHistPadrao.ListHsitoricoPadrao(0);

       //Carrega Parâmetros do Param Financ
       cdsAux.Close;
       cdsAux.Data   := CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);
       bImpCheque    := (cdsAux.FieldByName('FlgImpCheque').AsString='S');

       TipoRecTransf := (cdsAux.FieldByName('TIPORECEB').AsString);
       TipoDesTransf := (cdsAux.FieldByName('TIPODESEMB').AsString);

       dblcTipoRecTransf.LookupValue := TipoRecTransf;
       dblcTipoDesTransf.LookupValue := TipoDesTransf;

       cbImprimecheque.Checked := bImpCheque;
       edDataLanc.Date         := Date;

   finally
      cdsAux.Free;
   end;

   pgcTransfFundos.ActivePageIndex := 0;
   tbsPrevidenciario.TabVisible    := Sistema.UsaPlanoPatro;
   lblValor.Enabled                := not(Sistema.UsaPlanoPatro);
   ednValorCorrente.Enabled        := not(Sistema.UsaPlanoPatro);

   spRateios.Open;

   rTotalRateado := 0;

   MontaDefaultPlanoPatro;
   HabDesControles(1);  // desabilitar compo plano / patro
end;



procedure TfrmTransfFundosMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlTransfFundos.Free;
   CtrlListTerceiros.Free;
   CtrlParamFinanc.Free;
   CtrlHistPadrao.Free;
   PlanPrevContabPatro.Free;
   inherited;
   Action := caFree;
end;



procedure TfrmTransfFundosMT.FormShow(Sender: TObject);
begin
   inherited;
   WindowState:=wsMaximized;
   if (cdsContaOrigem.RecordCount<2) then
    begin
       MsgDlg('Para fazer Transferência entre Contas deve-se ter pelo '+
              'menos duas contas cadastradas','Erro',mtError,[mbOk],0);
       bbtnSairClick(Self);
    end
   else
    CarregaSaldos;
end;

procedure TfrmTransfFundosMT.FormResize(Sender: TObject);
begin
   inherited;
   PnlDadosOrigem.Width:=Trunc((pnlGrids.Width-4)/2);
end;

procedure TfrmTransfFundosMT.cdsContaOrigemAfterScroll(DataSet: TDataSet);
begin
   if not(cdsContaOrigem.Active) or not(cdsContaDestino.Active) then Exit;
   if (cdsContaOrigem.FieldByName('CODPORTADOR').AsFloat=
       cdsContaDestino.FieldByName('CODPORTADOR').AsFloat) then
    begin
       cdsContaDestino.Next;
       if (cdsContaDestino.Eof) then cdsContaDestino.First;
    end;

    if   rTotalRateado < 0 then
           edHistorico.Text := 'Transf. '+Copy(Trim(dbeContaDestino.Text),1,23)+' para '+
                                      Copy(Trim(dbeContaOrigem.Text),1,23)
      else
           edHistorico.Text := 'Transf. '+Copy(Trim(dbeContaOrigem.Text),1,23)+' para '+
                                      Copy(Trim(dbeContaDestino.Text),1,23);



   CarregaSaldos;
end;



procedure TfrmTransfFundosMT.bbtnConfirmarClick(Sender: TObject);
var
   bRespostaChk : Boolean;
begin
   inherited;

   if Trim(dblcTipoRecTransf.Text)='' then
    begin
       pgcTransfFundos.ActivePage := tbsGeral;
       MsgDlg('Obrigatório preencher o Tipo de Documento para Transferência de Recebimento','Erro',mtError,[mbOk],0);
       edDataLanc.SetFocus;
       Exit;
    end;

    if Trim(dblcTipoDesTransf.Text)='' then
    begin
       pgcTransfFundos.ActivePage := tbsGeral;
       MsgDlg('Obrigatório preencher o Tipo de Documento para Transferência de Pagamento','Erro',mtError,[mbOk],0);
       edDataLanc.SetFocus;
       Exit;
    end;
   if Trim(edDataLanc.Text)='' then
    begin
       pgcTransfFundos.ActivePage := tbsGeral;
       MsgDlg('Obrigatório preencher a Data de Lançamento','Erro',mtError,[mbOk],0);
       edDataLanc.SetFocus;
       Exit;
    end;

   if Trim(dblcUnidNegocOri.Text)='' then
    begin
       pgcTransfFundos.ActivePage := tbsGeral;
       MsgDlg('Obrigatório preencher a Atividade/Projeto','Erro',mtError,[mbOk],0);
       dblcUnidNegocOri.SetFocus;
       Exit;
    end;

   if (Sistema.UsaPlanoPatro) and (cdsRateios.IsEmpty) then
   begin
      pgcTransfFundos.ActivePage := tbsGeral;
      MsgDlg('Rateio Previdenciário não informado.','Erro',mtError,[mbOk],0);
      pgcTransfFundos.ActivePageIndex:=1;
      if dblcPatrocinadorOrigem.CanFocus then dblcPatrocinadorOrigem.SetFocus;
      Exit;
   end;

   if (ednValorCorrente.Value=0) then
    begin
       pgcTransfFundos.ActivePage := tbsGeral;
       MsgDlg('Obrigatório preencher o Valor em Moeda Corrente','Erro',mtError,[mbOk],0);
       ednValorCorrente.SetFocus;
       Exit;
    end;

   if Trim(dblcHistPad.Text)='' then
   begin
      pgcTransfFundos.ActivePage := tbsGeral;
      MsgDlg('Obrigatório preencher o Histórico Padrão','Erro',mtError,[mbOk],0);
      dblcHistPad.SetFocus;
      Exit;
   end;

   if Trim(edHistorico.Text)='' then
    begin
       pgcTransfFundos.ActivePage := tbsGeral;
       MsgDlg('Obrigatório preencher o Histórico do Lançamento','Erro',mtError,[mbOk],0);
       edHistorico.SetFocus;
       Exit;
    end;

   if ParamIntegra.IntegraContab then
    begin
       if (Trim(cdsContaOrigem.FieldByName('PLACONTA').AsString)='') or
          (Trim(cdsContaDestino.FieldByName('PLACONTA').AsString)='') then
       begin
          pgcTransfFundos.ActivePage := tbsGeral;
          MsgDlg('Como a contabilidade está integrada é obrigatório preencher a conta contábil das contas bancárias/caixas','Erro',mtError,[mbOk],0);
          ednValorCorrente.SetFocus;
          Exit;
       end;
    end;

  if cbImprimecheque.Checked then
   begin
      //Exibe formulário de Emissão de Cheque
      with TfrmEmiteChequeMT.Create(Self,ednValorCorrente.Value,
                                    cdsContaOrigem.FieldByName('CODPORTADOR').AsFloat,
                                    cdsContaOrigem.FieldByName('NUMBANCO').AsString ) do
       try
          ShowModal;
          bRespostaChk:=(ModalResult=mrCancel);
       finally
          Free;
       end;

      if bRespostaChk then
         if MsgDlg('Deseja também Cancelar a Transferência',
                   'Atenção', mtConfirmation, [mbYes,mbNo],0) = mrYes then Exit;
   end;

   //Carrega dados da Transferência

   DadosTransf.sPlaContaOrig       := cdsContaOrigem.FieldByName('PLACONTA').AsString;
   DadosTransf.rPlanoOrig          := cdsContaOrigem.FieldByName('PLANO').AsFloat;
   DadosTransf.rCodSubContaOrig    := cdsContaOrigem.FieldByName('CODSUBCONTA').AsFloat;
   DadosTransf.sCodCentroCustoOrig := cdsContaOrigem.FieldByName('CODCENTROCUSTO').AsString;
   DadosTransf.rUnidNegOrig        := StrToFloat(dblcUnidNegocOri.LookupValue);
   DadosTransf.rCodPortadorOrig    := cdsContaOrigem.FieldByName('CODPORTADOR').AsFloat;
   DadosTransf.rMoeCodigoOrig      := cdsContaOrigem.FieldByName('MOECODIGO').AsFloat;

   DadosTransf.sPlaContaDest       := cdsContaDestino.FieldByName('PLACONTA').AsString;
   DadosTransf.rPlanoDest          := cdsContaDestino.FieldByName('PLANO').AsFloat;
   DadosTransf.rCodSubContaDest    := cdsContaDestino.FieldByName('CODSUBCONTA').AsFloat;
   DadosTransf.sCodCentroCustoDest := cdsContaDestino.FieldByName('CODCENTROCUSTO').AsString;

   DadosTransf.iBancoDest          := cdscontaDestino.FieldByName('IDBANCO').AsInteger;

   DadosTransf.rUnidNegDest        := StrToFloat(dblcUnidNegocOri.LookupValue);

   DadosTransf.rCodPortadorDest    := cdsContaDestino.FieldByName('CODPORTADOR').AsFloat;
   DadosTransf.rMoeCodigoDest      := cdsContaDestino.FieldByName('MOECODIGO').AsFloat;
   DadosTransf.rValor              := ednValorCorrente.Value;
   DadosTransf.sNumDoc             := edNumDoc.Text;
   DadosTransf.rHistPadrao         := StrToFloat(dblcHistPad.LookupValue);
   DadosTransf.sHistorico          := edHistorico.Text;
   DadosTransf.sCodTipRec          := dblcTipoRecTransf.LookupValue;
   DadosTransf.sCodTipDes          := dblcTipoDesTransf.LookupValue;
   DadosTransf.dDataLanc           := edDataLanc.Date;

   DadosTransf.iFlgContaInvestOrig := cdsContaOrigem.FieldByName('FLGCONTAINVEST').AsInteger;
   DadosTransf.iFlgContaInvestDest := cdsContaDestino.FieldByName('FLGCONTAINVEST').AsInteger;
   DadosTransf.iEmpresa            := Sistema.IdEmpresa;
   DadosTransf.iBanco              := cdsContaOrigem.FieldByName('IDBANCO').AsInteger;

   if not(CtrlTransfFundos.TransfereFundos(DadosTransf,cdsRateios.Data)) then
      MsgDlg(CtrlTransfFundos.MessageInfo,'Erro',mtError,[mbOk],0)
   else
    begin
       MsgDlg('Transferência Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
       edDataLanc.Date:=Date;
       ednValorCorrente.Value:=0;
       edNumDoc.Text:='';
       pgcTransfFundos.ActivePageIndex:=0;
       edDataLanc.SetFocus;
       cdsRateios.EmptyDataSet;
       rTotalRateado        := 0;
       redRateado.Value     := 0;
       redValorRateio.Value := 0;

       // WO11468 - Controle Financeiro - Transferência entre contas (incluir)
       // Alterado por Arnaldo V. Scarin em 31/07/2024
       // dblcTipoRecTransf.Clear;
       // dblcTipoDesTransf.Clear;

       dblcTipoRecTransf.LookupValue := TipoRecTransf;
       dblcTipoDesTransf.LookupValue := TipoDesTransf;
       // WO11468 - FIM
    end;
end;



procedure TfrmTransfFundosMT.dblcTipoRecTransfChange(Sender: TObject);
begin
   // WO11468 - Controle Financeiro - Transferência entre contas (incluir)
   // Alterado por Arnaldo V. Scarin em 18/07/2024
   // A rotina Abaixo é executada a cada alteração do Tipo de Recebimento de Transferencia
   // Mas se a Rotina não teve mudança no texto, o Tipo de Desembolso não é Liberado
   // ficando inativo. Para corrigir a situação, se o Tipo de Desembolso estiver ativo
   // mesmo que não haja mudança no Tipo de Recebimento, esse LookupComboBox ficará ativo
   // dblcTipoDesTransf.Enabled := (Trim(dblcTipoRecTransf.Text)<>'');
   // lblTituloTipoDes.Enabled  := (Trim(dblcTipoRecTransf.Text)<>'');
   dblcTipoDesTransf.Enabled := (dblcTipoDesTransf.Enabled) or (Trim(dblcTipoRecTransf.Text) <> '');
   lblTituloTipoDes.Enabled  := dblcTipoDesTransf.Enabled;
   dblcTipoRecTransf.LookupValue := TipoRecTransf;
   dblcTipoDesTransf.LookupValue := TipoDesTransf;
end;



procedure TfrmTransfFundosMT.CarregaSaldos;
begin
   edSaldoOrigem.Value:=cdsContaOrigem.FieldByName('SALDO').AsFloat;

   if (cdsContaOrigem.FieldByName('SALDO').AsFloat>=0) then
      edSaldoOrigem.Font.Color:=clWindowText
   else
      edSaldoOrigem.Font.Color:=clRed;

   edSaldoDestino.Value:=cdsContaDestino.FieldByName('SALDO').AsFloat;
   if (cdsContaDestino.FieldByName('SALDO').AsFloat>=0) then
      edSaldoDestino.Font.Color:=clWindowText
   else
      edSaldoDestino.Font.Color:=clRed;
end;



procedure TfrmTransfFundosMT.btnIncluirRateioClick(Sender: TObject);
begin
   if (dblcPatrocinadorOrigem.Text='') then
    begin
       MsgDlg('Obrigatório preencher o Patrocinador.','Erro',mtError,[mbOk],0);
       dblcPatrocinadorOrigem.SetFocus;
       Exit;
    end;

   if (dblcPlanoPrevOrigem.Text='') then
    begin
       MsgDlg('Obrigatório preencher o Plano Previdenciário.','Erro',mtError,[mbOk],0);
       dblcPlanoPrevOrigem.SetFocus;
       Exit;
    end;

   if not PlanPrevContabPatro.ValidaPlanoPatro(StrToIntDef(dblcPatrocinadorOrigem.LookupValue, -1),
                                               StrToIntDef(dblcPlanoPrevOrigem.LookupValue, -1)) then
   begin
     MsgDlg('Não existe relacionamento entre Patrocinadora e Plano escolhidos!','Erro',mtError,[mbOk],0);
     abort;
   end;

   // Atualiza Valor de Rateio, antes de chamar o cdsRateiosAfterScroll
   rTotalRateado          := rTotalRateado + redValorRateio.Value; //William Santana - SOL 260642 PPM 1201711

   cdsRateios.Append;
   cdsRateios.FieldByName('IDPATROORIG').AsFloat        := StrToFloat(dblcPatrocinadorOrigem.LookupValue);
   cdsRateios.FieldByName('IDPLANOPREVORIG').AsFloat    := StrToFloat(dblcPlanoPrevOrigem.LookupValue);
   cdsRateios.FieldByName('DescPATROORIG').AsString     := Trim(dblcPatrocinadorOrigem.Text);
   cdsRateios.FieldByName('DescPLANOPREVORIG').AsString := Trim(dblcPlanoPrevOrigem.Text);

   cdsRateios.FieldByName('IDPATRODEST').AsFloat        := StrToFloat(dblcPatrocinadorOrigem.LookupValue);
   cdsRateios.FieldByName('IDPLANOPREVDEST').AsFloat    := StrToFloat(dblcPlanoPrevOrigem.LookupValue);
   cdsRateios.FieldByName('DescPATRODEST').AsString     := Trim(dblcPatrocinadorOrigem.Text);
   cdsRateios.FieldByName('DescPLANOPREVDEST').AsString := Trim(dblcPlanoPrevOrigem.Text);

   cdsRateios.FieldByName('IDPATRO').AsFloat            := StrToFloat(dblcPatrocinadorOrigem.LookupValue);
   cdsRateios.FieldByName('IDPLANOPREV').AsFloat        := StrToFloat(dblcPlanoPrevOrigem.LookupValue);

   cdsRateios.FieldByName('VALOR').AsFloat              := redValorRateio.Value;

   cdsRateios.FieldByName('PLANO').asInteger            := paramIntegra.Plano;
   cdsRateios.FieldByName('CODCENTROCUSTO').asString    := cdsContaOrigem.FieldByName('CODCENTROCUSTO').AsString;
   cdsRateios.Post;

   // Atualiza Valor de Rateio
  // rTotalRateado          := rTotalRateado + redValorRateio.Value; //William Santana - SOL 260642 PPM 1201711

   redRateado.Value       := rTotalRateado;
   ednValorCorrente.Value := rTotalRateado;

   if dblcPatrocinadorOrigem.CanFocus then dblcPatrocinadorOrigem.SetFocus;

   MontaDefaultPlanoPatro;

   if ParamIntegra.SegregaVirtual then begin
     dblcPatrocinadorOrigem.LookupValue := IntToStr(ParamIntegra.PatroGlobal);
     dblcPlanoPrevOrigem.LookupValue    := IntToStr(ParamIntegra.PlanoPrevGlobal);
   end;
end;



procedure TfrmTransfFundosMT.btnExcluirRateioClick(Sender: TObject);
begin
   rTotalRateado          := rTotalRateado-cdsRateios.FieldByName('VALOR').AsFloat;
   redRateado.Value       := rTotalRateado;
   ednValorCorrente.Value := rTotalRateado;

   cdsRateios.Delete;
end;



procedure TfrmTransfFundosMT.dsRateiosDataChange(Sender: TObject; Field: TField);
begin
   if not(cdsRateios.Active) then Exit;
   btnExcluirRateio.Enabled:=(cdsRateios.RecordCount<>0);
end;



procedure TfrmTransfFundosMT.redValorRateioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key=27) then
    begin
       redValorRateio.Value := ednValorCorrente.Value-rTotalRateado;
       redValorRateio.Text  := FloatToStr(redValorRateio.Value);
       redValorRateio.Refresh;
    end;

   if (Key=107) then
    begin
       btnIncluirRateioClick(Self);
    end;
end;



procedure TfrmTransfFundosMT.HabDesControles(rValor: Double);
begin
   dblcPatrocinadorOrigem.Enabled  := (rValor>0);
   dblcPlanoPrevOrigem.Enabled     := (rValor>0);
   dblcPatrocinadorDestino.Enabled := (rValor>0);
   dblcPlanoPrevDestino.Enabled    := (rValor>0);
   redValorRateio.Enabled          := (rValor>0);
   btnIncluirRateio.Enabled        := (rValor>0);
end;




procedure TfrmTransfFundosMT.dbgContaDeEnter(Sender: TObject);
begin
  inherited;
  if rTotalRateado <> 0 then
     if MsgDlg('Rateio não finalizado - deseja Cancelar a Transferência',
               'Atenção', mtConfirmation, [mbYes,mbNo],0) = mrYes then Begin

       edDataLanc.Date        := Date;
       ednValorCorrente.Value := 0;
       edNumDoc.Text          := '';

       cdsRateios.EmptyDataSet;

       rTotalRateado          := 0;
       redRateado.Value       := 0;
       redValorRateio.Value   := 0;

       dblcTipoRecTransf.Clear;
       dblcTipoDesTransf.Clear;
     end
     else
       edDataLanc.SetFocus;
end;



procedure TfrmTransfFundosMT.pgcTransfFundosChanging(Sender: TObject; var AllowChange: Boolean);
begin
  inherited;
  if pgcTransfFundos.ActivePageIndex = 0 Then begin
     if edDataLanc.CanFocus then edDataLanc.SetFocus
  end else begin
     if dblcPatrocinadorOrigem.CanFocus then dblcPatrocinadorOrigem.SetFocus;
  end;
end;



procedure TfrmTransfFundosMT.MontaDefaultPlanoPatro;
begin
  if ParamIntegra.SegregaVirtual then
  begin
    dblcPatrocinadorOrigem.LookupValue := IntToStr(ParamIntegra.PatroGlobal);
    dblcPlanoPrevOrigem.LookupValue := IntToStr(ParamIntegra.PlanoPrevGlobal);
  end;
end;


procedure TfrmTransfFundosMT.cdsRateiosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(cdsRateios.FieldByName('VALOR')).DisplayFormat := '#,##0.00;-#,##0.00';
end;



end.
