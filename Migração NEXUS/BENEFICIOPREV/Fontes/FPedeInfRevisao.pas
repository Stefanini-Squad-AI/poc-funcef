// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************


// Autor(a)    : Douglas de Siqueira
// SOL        :  SOL 171026 KIN 1528962
// Pendência   : ----
// Descricao   : Desdobramento
//------------------------------------------------------------------------------
// Rotina      : edNumProcINSSExit
// Autor(a)    : Camille
// Data        : 31.08.2004
// Pendência   : ----
// Descricao   : Validar numero do processo no inss
//------------------------------------------------------------------------------
// Rotina      : PedeInfRevisao
// Autor(a)    : Gleyber
// Data        : 19/03/2004
// Pendência   : 16310
// Descricao   : Retirado o READONLY da dtDataFinal. Para parâmetro pcTipo = I
//               foi inserido uma mudança na cor do componente,
//------------------------------------------------------------------------------
unit FPedeInfRevisao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TEdNum, Mask, MskEdDlg, wwdbedit, wwdblook,
  Db, DBTables, Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmPedeInfRevisao = class(TfrmOkCancelar)
    qryTpPgtoBenef: TwwQuery;
    qryPortForma: TwwQuery;
    pnlInclusao: TPanel;
    pnlTitulo: TPanel;
    Label5: TLabel;
    lblBeneficiario: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblValorInfINSS: TLabel;
    grpPagamento: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    dblkcmbTpPgtoBenef: TwwDBLookupCombo;
    dblkpcmbPortForma: TwwDBLookupCombo;
    dtDataInicio: TCMDateTimePicker;
    dtDataFinal: TCMDateTimePicker;
    dtDataRequerimento: TCMDateTimePicker;
    dtInicioINSS: TCMDateTimePicker;
    dtInicioFund: TCMDateTimePicker;
    reValorInfINSS: TEditNum;
    Label6: TLabel;
    reValorCalcInss: TEditNum;
    qryBeneficio: TwwQuery;
    edNumProcINSS: TMaskEdit;
    dtDibAnterior: TCMDateTimePicker;
    Label7: TLabel;
    ckb_convenio: TCheckBox;//douglas.siqueira SOL171026
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edNumProcINSSExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpaTela;
    function  PedeInfRevisao( pcTipo : char; // I - Inclusao, E - Exclusao
                              psNomeBenef : string;
                              piIdPlanoPrev,
                              piIdBeneficio : longint;
                              psDataEvento : string;
                             var psNumProcINSS,
                                 psDtRequerimento,
                                 psDtInicioINSS,
                                 psDtInicioFund,
                                 psDtDIBAnterior,
                                 psDataInicio,
                                 psDataFinal,
                                 psVlrCalcINSS,
                                 psVlrInfINSS,
                                 psIdTpPagtoBenefic,
                                 psCodPortForma,sFontePagadora : string ) : boolean;/////douglas.siqueira SOL171026


  end;

var
  frmPedeInfRevisao: TfrmPedeInfRevisao;

implementation

uses UMensErro, UAdmPrev,FDesdobramentoBenef;

{$R *.DFM}

function TfrmPedeInfRevisao.PedeInfRevisao( pcTipo : char; // I - inclusao, E - Exclusao
                                            psNomeBenef : string;
                                            piIdPlanoPrev,
                                            piIdBeneficio : longint;
                                            psDataEvento : string;
                                        var psNumProcINSS,
                                            psDtRequerimento,
                                            psDtInicioINSS,
                                            psDtInicioFund,
                                            psDtDIBAnterior,
                                            psDataInicio,
                                            psDataFinal,
                                            psVlrCalcINSS,
                                            psVlrInfINSS,
                                            psIdTpPagtoBenefic,
                                            psCodPortForma,sFontePagadora : string ) : boolean;/////douglas.siqueira SOL171026
begin
   Result := False;
   LimpaTela;
   dtDataRequerimento.Text := psDtRequerimento;
   edNumProcINSS.Text      := psNumProcINSS;
   dtInicioINSS.Text       := psDtInicioINSS;
   dtInicioFund.Text       := psDtInicioFund;
   dtDataInicio.Text       := psDataInicio;
   dtDataFinal.Text        := psDataFinal;
   reValorCalcINSS.Text    := psVlrCalcINSS;
   reValorInfINSS.Text     := psVlrInfINSS;

   qryBeneficio.Close;
   qryBeneficio.ParamByName('IdBeneficio').AsInteger := piIdBeneficio;
   qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := piIdPlanoPrev;
   qryBeneficio.Open;

   qryTpPgtoBenef.Close;
   qryTpPgtoBenef.Open;
   if qryTpPgtoBenef.Locate('IDTPPAGTOBENEFIC',StrToInt(psIdTpPagtoBenefic),[loCaseInsensitive])
   then dblkcmbTpPgtoBenef.Text := qryTpPgtoBenef.FieldByName('Nome').AsString
   else dblkcmbTpPgtoBenef.Text := '';
   dblkcmbTpPgtoBenef.PerformSearch;

   dblkpcmbPortForma.Text  := psCodPortForma;
   lblBeneficiario.Caption := psNomeBenef;

   // Preencher defaults
   if Trim(dtDataRequerimento.Text) = '' then dtDataRequerimento.Text := DateToStr(date);
   if Trim(dtInicioFund.Text) = ''       then dtInicioFund.Text := psDataEvento;
   if Trim(dtDataInicio.Text) = ''       then dtDataInicio.Text := dtInicioFund.Text;

   lblBeneficiario.Caption    := psNomeBenef;
//douglas.siqueira SOL171026
   if sFontePagadora = '2' then ///RN002.1
      begin
      ckb_convenio.Visible:= TRUE;
      ckb_convenio.Checked:= TRUE;
      end
   else
      begin
      ckb_convenio.Visible:= FALSE;
      ckb_convenio.Checked:= FALSE;
      end;
//douglas.siqueira SOL171026
      
   if pcTipo = 'I'
   then begin
      dtDataRequerimento.Enabled := True;
      edNumProcINSS.Enabled      := True;
      dtInicioINSS.Enabled       := True;
      dtInicioFund.Enabled       := True;
      dtDataInicio.Enabled       := True;
      dtDataFinal.Color          := clWindow; 
      dtDataFinal.Enabled        := True;
      reValorInfINSS.Enabled     := True;
      dblkcmbTpPgtoBenef.Enabled := True;
      dblkpcmbPortForma.Enabled  := True;
      grpPagamento.Visible       := True;
   end
   else begin
      dtDataRequerimento.Enabled := False;
      edNumProcINSS.Enabled      := False;
      dtInicioINSS.Enabled       := False;
      dtInicioFund.Enabled       := False;
      dtDataInicio.Enabled       := False;
      dtDataFinal.Color          := clSilver; 
      dtDataFinal.Enabled        := False;
      reValorInfINSS.Enabled     := False;
      dblkcmbTpPgtoBenef.Enabled := False;
      dblkpcmbPortForma.Enabled  := False;
      grpPagamento.Visible       := False;
   end;

   ShowModal;

   if (ModalResult = mrOk)
   then begin
      psDtRequerimento   := dtDataRequerimento.Text;
      psNumProcINSS      := edNumProcINSS.Text;
      psDtInicioINSS     := dtInicioINSS.Text;
      psDtInicioFund     := dtInicioFund.Text;
      psDtDIBAnterior    := dtDIBAnterior.Text;
      psDataInicio       := dtDataInicio.Text;
      psDataFinal        := dtDataFinal.Text;

      if Trim(dblkcmbTpPgtoBenef.Text) <> ''
      then psIdTpPagtoBenefic := qryTpPgtoBenef.FieldByName('IDTPPAGTOBENEFIC').AsString
      else psIdTpPagtoBenefic := '';

      if Trim(dblkpcmbPortForma.Text) <> ''
      then psCodPortForma     := qryPortForma.FieldByName('CodPortForma').AsString
      else psCodPortForma     := '';


      Result := True;
   end
   else begin
      psDtRequerimento   := '';
      psNumProcINSS      := '';
      psDtInicioINSS     := '';
      psDtInicioFund     := '';
      psDtDIBAnterior    := '';
      psDataInicio       := '';
      psDataFinal        := '';
      psIdTpPagtoBenefic := '';
      psCodPortForma     := '';

      Result := False;
   end;
   qryTpPgtoBenef.Close;
   qryPortForma.Close;
end; // PedeInfRevisao

procedure TfrmPedeInfRevisao.LimpaTela;
begin
   dtDataRequerimento.Text := '';
   edNumProcINSS.Text      := '';
   dtInicioINSS.Text       := '';
   dtInicioFund.Text       := '';
   dtDataInicio.Text       := '';
   dtDataFinal.Text        := '';
   reValorInfINSS.Text     := '';
   dblkcmbTpPgtoBenef.Text := '';
   dblkpcmbPortForma.Text  := '';
   lblBeneficiario.Caption := '';

end; //LimpaTela

procedure TfrmPedeInfRevisao.FormShow(Sender: TObject);
begin
  inherited;

  qryPortForma.Close;
  qryPortForma.Open;

  if dtDataRequerimento.Enabled
  then dtDataRequerimento.SetFocus;

end;

procedure TfrmPedeInfRevisao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
end;

procedure TfrmPedeInfRevisao.bbtnConfirmarClick(Sender: TObject);
begin
  // Testar campos obrigatorrio
  if (qryBeneficio.FieldByName('FLGOBRIGANPROC').AsInteger = 1) and
     (Trim(edNumProcINSS.Text) = '')
  then begin
     MsgDlg('O Nº do Processo no INSS é obrigatório para este benefício.','Erro',mtError,[mbOk,mbHelp],0);
     ModalResult := mrNone;
     Abort;
  end;

  if Trim(dtDataRequerimento.Text) = ''
  then begin
     MsgDlg('Preencha a Data de Requerimento.','Erro',mtError,[mbOk,mbHelp],0);
     ModalResult := mrNone;
     Abort;
  end;

  if Trim(dtInicioFund.Text) = ''
  then begin
     MsgDlg('Preencha a Data de Início na Fundação.','Erro',mtError,[mbOk,mbHelp],0);
     ModalResult := mrNone;
     Abort;
  end;

  if Trim(dtDataInicio.Text) = ''
  then begin
     MsgDlg('Preencha a Data de Início do Pagamento.','Erro',mtError,[mbOk,mbHelp],0);
     ModalResult := mrNone;
     Abort;
  end;

  if Trim(dblkcmbTpPgtoBenef.Text) = ''
  then begin
     MsgDlg('Preencha o Tipo de Pagamento do Benefício.','Erro',mtError,[mbOk,mbHelp],0);
     ModalResult := mrNone;
     Abort;
  end;
  if (Trim(dtDataInicio.Text) <> '') and (Trim(dtDataFinal.Text) <> '') and
     (StrToDate(dtDataInicio.Text) > StrToDate(dtDataFinal.Text) )
  then begin
    MsgDlg('Inconsistência : a data de início do pagamento é maior que a data final.','Erro',mtError,[mbOk,mbHelp],0);
    if dtDataInicio.Enabled then dtDataInicio.SetFocus;
    ModalResult := mrNone;
    Abort;
  end;

  if (Trim(dtDataInicio.Text) <> '') and (Trim(dtInicioFund.Text) <> '') and
     (StrToDate(dtDataInicio.Text) < StrToDate(dtInicioFund.Text) )
  then begin
    MsgDlg('Inconsistência : a data de início do pagamento é menor a DIB.','Erro',mtError,[mbOk,mbHelp],0);
    if dtDataInicio.Enabled then dtDataInicio.SetFocus;
    ModalResult := mrNone;
    Abort;
  end;

  
//douglas.siqueira SOL171026
  if ckb_convenio.Checked then
     frmDesdobramentoBenef._sFlgPagaInss:='1'
  else
     frmDesdobramentoBenef._sFlgPagaInss:='0';
//douglas.siqueira SOL171026

  ModalResult := mrOk;
  inherited;

end;

procedure TfrmPedeInfRevisao.edNumProcINSSExit(Sender: TObject);
begin
  inherited;
  if (edNumProcINSS.text <> '') then 
  begin
     if not ValidaNumProcesso(edNumProcINSS.Text) then
     begin
        if MsgDlg('O Número do Processo no INSS informado é INVÁLIDO. '+#13+
                  'Deseja manter este número e continuar a operação ?', Caption, mtError , [mbNo, mbYes], 0) = mrNo then
        begin
           if edNumProcINSS.CanFocus then edNumProcINSS.setfocus;
        end;
     end;
  end;

end;



end.