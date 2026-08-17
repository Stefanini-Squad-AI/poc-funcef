unit FTransfFundosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient, uCMClientDataSet,
  Wwdatsrc, Mask, wwdbedit, uCtrlTransfFundos, uCtrlListTercFinanc,
  uCtrlParamFinanc, uCtrlHistPadrao;

type
  TfrmTransfFundosMT = class(TfrmOkCancelar)
    pnlGrids: TPanel;
    pnlContaDe: TPanel;
    pnlContaPara: TPanel;
    lblContaDe: TLabel;
    lblHistPad: TLabel;
    dblcHistPad: TwwDBLookupCombo;
    lblUnidNegoc: TLabel;
    dblcUnidNegocOri: TwwDBLookupCombo;
    Label4: TLabel;
    dblcPatrocinador: TwwDBLookupCombo;
    lblContaPara: TLabel;
    lblData: TLabel;
    edDataLanc: TCMDateTimePicker;
    lblValor: TLabel;
    ednValorCorrente: TRealEdit;
    lblHistorico: TLabel;
    edHistorico: TEdit;
    lblDocumento: TLabel;
    edNumDoc: TEdit;
    Label6: TLabel;
    dblcTipoRecDes: TwwDBLookupCombo;
    Label3: TLabel;
    dblcUnidNegocDest: TwwDBLookupCombo;
    Label5: TLabel;
    dblcPlanoPrev: TwwDBLookupCombo;
    cbImprimecheque: TCheckBox;
    dsContaOrigem: TwwDataSource;
    dsContaDestino: TwwDataSource;
    dbgContaDe: TwwDBGrid;
    dbgContaPara: TwwDBGrid;
    cdsContaOrigem: TCMClientDataSet;
    cdsContaDestino: TCMClientDataSet;
    dbeContaOrigem: TwwDBEdit;
    dbeContaDestino: TwwDBEdit;
    cdsUnidNegocio: TCMClientDataSet;
    cdsTipoRecDes: TCMClientDataSet;
    cdsPatrocinador: TCMClientDataSet;
    cdsPlanoPrev: TCMClientDataSet;
    cdsHistorico: TCMClientDataSet;
    Label7: TLabel;
    edSaldoOrigem: TRealEdit;
    edSaldoDestino: TRealEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cdsContaOrigemAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    bImpCheque        : Boolean;
    CtrlListTerceiros : TCtrlListTercFinanc;
    CtrlHistPadrao    : TCtrlHistPadrao;
    CtrlTransfFundos  : TCtrlTransfFundos;
    CtrlParamFinanc   : TCtrlParamFinanc;
    procedure CarregaSaldos;
  public
    { Public declarations }
  end;

var
  frmTransfFundosMT: TfrmTransfFundosMT;

implementation

{$R *.DFM}

uses uSistema, dBaseDados, uMensErro, uCtrlParamIntegra, FEmiteChequeMT;

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

   //Carrega cds's de Conta Origem e Destino
   cdsContaOrigem.Data:=CtrlTransfFundos.ListPortadorComSaldo;
   cdsContaDestino.Data:=cdsContaOrigem.Data;
  
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
          dblcUnidNegocDest.Enabled:=False;
       end;

      if (cdsUnidNegocio.RecordCount=1) then
       begin
          dblcUnidNegocOri.LookupValue:=cdsUnidNegocio.FieldByName('UNIDNEGOC').AsString;
          dblcUnidNegocDest.LookupValue:=cdsUnidNegocio.FieldByName('UNIDNEGOC').AsString;
       end;

       //Carrega cds Tipo de Rec/Des
       cdsTipoRecDes.Data:=CtrlListTerceiros.ListTipoRD(Sistema.IdEmpresa,'R','');

       //Carrega cds's de Patrocinador e Plano Previdenciário
       dblcPatrocinador.Enabled:=Sistema.UsaPlanoPatro;
       dblcPlanoPrev.Enabled:=Sistema.UsaPlanoPatro;

       if Sistema.UsaPlanoPatro then
        begin
           cdsPatrocinador.Data:=CtrlListTerceiros.ListPatrocinador;
           cdsPlanoPrev.Data:=CtrlListTerceiros.ListPlanoPrev;
        end;

       //Inicializa CtrlHistPadrao
       CtrlHistPadrao:=TCtrlHistPadrao.Create;
       CtrlHistPadrao.Initialize(dtmBaseDados.dbBaseDados,True);

       //Carrega cds de Históricos
       cdsHistorico.Data:=CtrlHistPadrao.ListHsitoricoPadrao(0);

       edHistorico.Text := 'Transf. '+Copy(Trim(dbeContaOrigem.Text),1,23)+' para '+
                                      Copy(Trim(dbeContaDestino.Text),1,23);

       //Carrega Parâmetros do Param Financ
       cdsAux.Close;
       cdsAux.Data:=CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);
       bImpCheque:=(cdsAux.FieldByName('FlgImpCheque').AsString='S');
       cbImprimecheque.Checked:=bImpCheque;
       edDataLanc.Date:=Date;
   finally
      cdsAux.Free;
   end;
end;

procedure TfrmTransfFundosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlTransfFundos.Free;
   CtrlListTerceiros.Free;
   CtrlParamFinanc.Free;
   CtrlHistPadrao.Free;
   inherited;
   Action:=caFree;
end;

procedure TfrmTransfFundosMT.FormShow(Sender: TObject);
begin
   inherited;
   if (cdsContaOrigem.RecordCount<2) then
    begin
       MsgDlg('Para fazer Transferência entre Contas deve-se ter pelo '+
              'menos duas contas cadastradas','Erro',mtError,[mbOk],0);
       bbtnSairClick(Self);
    end
   else
    CarregaSaldos;
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
   edHistorico.Text := 'Transf. '+Copy(Trim(dbeContaOrigem.Text),1,23)+' para '+
                                  Copy(Trim(dbeContaDestino.Text),1,23);

   CarregaSaldos;
end;

procedure TfrmTransfFundosMT.bbtnConfirmarClick(Sender: TObject);
var
   DadosTransf  : TDadosTransf;
   bRespostaChk : Boolean;
begin
   inherited;

   if Trim(edDataLanc.Text)='' then
    begin
       MsgDlg('Obrigatório preencher a Data de Lançamento','Erro',mtError,[mbOk],0);
       edDataLanc.SetFocus;
       Exit;
    end;

   if Trim(dblcUnidNegocOri.Text)='' then
    begin
       MsgDlg('Obrigatório preencher a Atividade da Conta Origem','Erro',mtError,[mbOk],0);
       dblcUnidNegocOri.SetFocus;
       Exit;
    end;

   if Trim(dblcUnidNegocDest.Text)='' then
    begin
       MsgDlg('Obrigatório preencher a Atividade da Conta Destino','Erro',mtError,[mbOk],0);
       dblcUnidNegocDest.SetFocus;
       Exit;
    end;

   if (ednValorCorrente.Value=0) then
    begin
       MsgDlg('Obrigatório preencher o Valor em Moeda Corrente','Erro',mtError,[mbOk],0);
       ednValorCorrente.SetFocus;
       Exit;
    end;

   if Trim(dblcHistPad.Text)='' then
   begin
      MsgDlg('Obrigatório preencher o Histórico Padrão','Erro',mtError,[mbOk],0);
      dblcHistPad.SetFocus;
      Exit;
   end;

   if Trim(edHistorico.Text)='' then
    begin
       MsgDlg('Obrigatório preencher o Histórico do Lançamento','Erro',mtError,[mbOk],0);
       edHistorico.SetFocus;
       Exit;
    end;

   if Trim(edNumDoc.Text)='' then
    begin
       MsgDlg('Obrigatório preencher o Número do Documento','Erro',mtError,[mbOk],0);
       edNumDoc.SetFocus;
       Exit;
    end;

   if ParamIntegra.IntegraContab then
    begin
       if (Trim(cdsContaOrigem.FieldByName('PLACONTA').AsString)='') or
          (Trim(cdsContaDestino.FieldByName('PLACONTA').AsString)='') then
       begin
          MsgDlg('Como a contabilidade está integrada é obrigatório preencher a conta contábil das contas bancárias/caixas','Erro',mtError,[mbOk],0);
          ednValorCorrente.SetFocus;
          Exit;
       end;
   end;

  if Sistema.UsaPlanoPatro then
   begin
      if (dblcPatrocinador.Text='') then
       begin
          MsgDlg('Obrigatório preencher o Patrocinador.','Erro',mtError,[mbOk],0);
          dblcPatrocinador.SetFocus;
          Exit;
       end;

      if (dblcPlanoPrev.Text='') then
       begin
          MsgDlg('Obrigatório preencher o Previdenciário.','Erro',mtError,[mbOk],0);
          dblcPlanoPrev.SetFocus;
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
   DadosTransf.sPlaContaOrig:=cdsContaOrigem.FieldByName('PLACONTA').AsString;
   DadosTransf.rPlanoOrig:=cdsContaOrigem.FieldByName('PLANO').AsFloat;
   DadosTransf.rCodSubContaOrig:=cdsContaOrigem.FieldByName('CODSUBCONTA').AsFloat;
   DadosTransf.sCodCentroCustoOrig:=cdsContaOrigem.FieldByName('CODCENTROCUSTO').AsString;
   DadosTransf.rUnidNegOrig:=StrToFloat(dblcUnidNegocOri.LookupValue);
   DadosTransf.rCodPortadorOrig:=cdsContaOrigem.FieldByName('CODPORTADOR').AsFloat;
   DadosTransf.rMoeCodigoOrig:=cdsContaOrigem.FieldByName('MOECODIGO').AsFloat;

   DadosTransf.sPlaContaDest:=cdsContaDestino.FieldByName('PLACONTA').AsString;
   DadosTransf.rPlanoDest:=cdsContaDestino.FieldByName('PLANO').AsFloat;
   DadosTransf.rCodSubContaDest:=cdsContaDestino.FieldByName('CODSUBCONTA').AsFloat;
   DadosTransf.sCodCentroCustoDest:=cdsContaDestino.FieldByName('CODCENTROCUSTO').AsString;
   DadosTransf.rUnidNegDest:=StrToFloat(dblcUnidNegocDest.LookupValue);
   DadosTransf.rCodPortadorDest:=cdsContaDestino.FieldByName('CODPORTADOR').AsFloat;
   DadosTransf.rMoeCodigoDest:=cdsContaDestino.FieldByName('MOECODIGO').AsFloat;

   DadosTransf.rValor:=ednValorCorrente.Value;
   DadosTransf.sNumDoc:=edNumDoc.Text;

   if Sistema.UsaPlanoPatro then
    begin
       DadosTransf.rIDPatro:=StrToFloat(dblcPatrocinador.LookupValue);
       DadosTransf.rIDPlanoPrev:=StrToFloat(dblcPlanoPrev.LookupValue);
    end
   else
    begin
       DadosTransf.rIDPatro:=0;
       DadosTransf.rIDPlanoPrev:=0;
    end;

   DadosTransf.rHistPadrao:=StrToFloat(dblcHistPad.LookupValue);
   DadosTransf.sHistorico:=edHistorico.Text;
   DadosTransf.sCodTipRecDes:=dblcTipoRecDes.LookupValue;
   DadosTransf.dDataLanc:=edDataLanc.Date;


   if not(CtrlTransfFundos.TransfereFundos(DadosTransf)) then
      MsgDlg(CtrlTransfFundos.MessageInfo,'Erro',mtError,[mbOk],0)
   else
    begin
       MsgDlg('Transferência Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
       edDataLanc.Date:=Date;
       ednValorCorrente.Value:=0;
       edNumDoc.Text:='';
       edDataLanc.SetFocus;
    end;
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

end.
