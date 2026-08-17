unit FSimulacaoOperBMF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Db, DBTables, Wwquery, TREdit, Wwdatsrc;

type
  TFrmSimulacaoOperBMF = class(TfrmOkCancelarInv)
    lblDataRef: TLabel;
    dtDataRef: TCMDateTimePicker;
    lblCarteiraInvest: TLabel;
    dblkCarteira: TwwDBLookupCombo;
    lblBeta: TLabel;
    dblkParamExcel: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    qryCarteiraCARTEIRA: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraIDCARTEIRAGERENC: TFloatField;
    qryCarteiraIDCARTEIRA: TStringField;
    qryHistBeta: TwwQuery;
    qryParamExcel: TwwQuery;
    qryParamExcelIDPARAMIMPEXCEL: TFloatField;
    qryParamExcelNOMEPARAM: TStringField;
    lblContrato: TLabel;
    dblkContrato: TwwDBLookupCombo;
    qryContrato: TwwQuery;
    qryContratoDESCTIPOCTINVEST: TStringField;
    qryContratoPESOCONTRATO: TFloatField;
    qryContratoIDTIPOCONTRINVEST: TFloatField;
    Panel1: TPanel;
    lblPeso: TLabel;
    lblVlrPeso: TLabel;
    lblBetaCarteira: TLabel;
    lblCarteira: TLabel;
    lblVlrCarteira: TLabel;
    lblVlrBetaCarteira: TLabel;
    lblPuAjuste: TLabel;
    lblPercentual: TLabel;
    qryHistBetaVLRBETA: TFloatField;
    qryHistBetaVLRCARTEIRA: TFloatField;
    redtPuAjuste: TRealEdit;
    redtPercentual: TRealEdit;
    lblNrContratos: TLabel;
    redtNrContratos: TRealEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkContratoExit(Sender: TObject);
    procedure dtDataRefExit(Sender: TObject);
    procedure dblkCarteiraExit(Sender: TObject);
    procedure dblkParamExcelExit(Sender: TObject);
    procedure redtPuAjusteExit(Sender: TObject);
    procedure redtPercentualExit(Sender: TObject);
    procedure redtNrContratosExit(Sender: TObject);
  private
    { Private declarations }
    procedure BuscaHistBeta;
    function VerificaParametros:boolean;
  public
    { Public declarations }
  end;

var
  FrmSimulacaoOperBMF: TFrmSimulacaoOperBMF;
  fVlrBetaCarteira,fVlrCarteira,fVlrPeso,fVlrPencentual100,fVlrPencentual, fNrContratos100, fNrContratos : Double;

implementation

uses UOperComum,UBibliotecaInvest,UMensErro,FCadOrdemMovBMF;

{$R *.DFM}

procedure TFrmSimulacaoOperBMF.FormShow(Sender: TObject);
begin
  inherited;
   dtDataRef.DateTime := pRPI.DATAULTFECHBMF;
   OperComum.LimpaParametros(qryContrato);
   qryContrato.ParamByName('dDataRef').AsString := dtDataRef.Text;
   qryContrato.Open;
   qryParamExcel.Open;
   qryCarteira.Open;
   WindowState := wsNormal;
end;

procedure TFrmSimulacaoOperBMF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qryContrato.Close;
   qryParamExcel.Close;
   qryCarteira.Close;

   frmOrdemMovBMF.WindowState := wsMaximized;
end;

procedure TFrmSimulacaoOperBMF.dblkContratoExit(Sender: TObject);
begin
  inherited;
   lblVlrPeso.Caption := FormatFloat('###,###,##0.00',qryContratoPESOCONTRATO.AsFloat);
   fVlrPeso           := qryContratoPESOCONTRATO.AsFloat;
   BuscaHistBeta;
end;

procedure TFrmSimulacaoOperBMF.BuscaHistBeta;
begin
   if (Trim(dtDataRef.Text) <> '') and
      (Trim(dblkCarteira.Text) <> '') and
      (Trim(dblkParamExcel.Text) <> '') and
      (Trim(dblkContrato.Text) <> '') then
   begin
      if not VerificaParametros then
         Exit
      else
      begin
         with qryHistBeta do
         begin
             OperComum.LimpaParametros(qryHistBeta);
             ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
             ParamByName('IDCARTEIRAINVEST').AsInteger  := qryCarteiraIDCARTEIRAINVEST.AsInteger;
             ParamByName('DATAHISTBETA').AsString       := dtDataRef.Text;
             ParamByName('IDPARAMIMPEXCEL').AsInteger   := qryParamExcelIDPARAMIMPEXCEL.AsInteger;
             if qryCarteiraIDCARTEIRAGERENC.IsNull then
                ParamByName('IDCARTEIRAGERENC').Clear
             else
                ParamByName('IDCARTEIRAGERENC').AsInteger := qryCarteiraIDCARTEIRAGERENC.AsInteger;
             Open;
             if not IsEmpty then
             begin
                lblVlrBetaCarteira.Caption := FormatFloat('###,###,##0.000000000',qryHistBetaVLRBETA.AsFloat);
                fVlrBetaCarteira           := qryHistBetaVLRBETA.AsFloat;
                lblVlrCarteira.Caption     := FormatFloat('###,###,###,###,##0.00',qryHistBetaVLRCARTEIRA.AsFloat);
                fVlrCarteira               := qryHistBetaVLRCARTEIRA.AsFloat;
             end;
         end;
      end;
   end;
end;

function TFrmSimulacaoOperBMF.VerificaParametros : boolean;
begin
   if Trim(dtDataRef.Text) = '' then
   begin
     MsgDlg('Falta a data da Referência.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dtDataRef.CanFocus then
        dtDataRef.SetFocus;
     Result := False;
     Exit;
   end
   else if Trim(dblkCarteira.Text) = '' then
   begin
     MsgDlg('Falta a Carteira de Investimento.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dblkCarteira.CanFocus then
        dblkCarteira.SetFocus;
     Result := False;
     Exit;
   end
   else if Trim(dblkParamExcel.Text) = '' then
   begin
     MsgDlg('Falta a Tipo de Beta.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dblkParamExcel.CanFocus then
        dblkParamExcel.SetFocus;
     Result := False;
     Exit;
   end
   else if Trim(dblkContrato.Text) = '' then
   begin
     MsgDlg('Falta o Contrato do Mercado Futuro.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     if dblkContrato.CanFocus then
        dblkContrato.SetFocus;
     Result := False;
     Exit;
   end
   else
      Result := True;
end;

procedure TFrmSimulacaoOperBMF.dtDataRefExit(Sender: TObject);
begin
  inherited;
   BuscaHistBeta;
end;

procedure TFrmSimulacaoOperBMF.dblkCarteiraExit(Sender: TObject);
begin
  inherited;
   BuscaHistBeta;
end;

procedure TFrmSimulacaoOperBMF.dblkParamExcelExit(Sender: TObject);
begin
  inherited;
   BuscaHistBeta;
end;

procedure TFrmSimulacaoOperBMF.redtPuAjusteExit(Sender: TObject);
begin
  inherited;
     if (fVlrBetaCarteira <> 0) and
        (fVlrCarteira >0) and
        (fVlrPeso <> 0) then
     begin
        redtPercentual.Value := 100;
        fVlrPencentual100 := 100;
        fNrContratos100 :=
           OperComum.DivValorZero((fVlrCarteira * fVlrBetaCarteira),(redtPuAjuste.Value * fVlrPeso));
        fNrContratos100 := OperComum.Round(fNrContratos100,0);
        redtNrContratos.Value := fNrContratos100;
     end;
end;

procedure TFrmSimulacaoOperBMF.redtPercentualExit(Sender: TObject);
begin
  inherited;
  if redtPuAjuste.Value = 0 then
  begin
     MsgDlg('O PU de Ajuste não foi informado.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
  end
  else
  begin
     if (fVlrBetaCarteira <> 0) and
        (fVlrCarteira >0) and
        (fVlrPeso <> 0) then
     begin
         fNrContratos :=
            OperComum.DivValorZero((fNrContratos100 * redtPercentual.Value),fVlrPencentual100);
         fNrContratos := OperComum.Round(fNrContratos,0);
         redtNrContratos.Value := fNrContratos;
     end;
  end;
end;

procedure TFrmSimulacaoOperBMF.redtNrContratosExit(Sender: TObject);
begin
  inherited;
  if redtPuAjuste.Value = 0 then
  begin
     MsgDlg('O PU de Ajuste não foi informado.', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
  end
  else
  begin
     if (fVlrBetaCarteira <> 0) and
        (fVlrCarteira >0) and
        (fVlrPeso <> 0) then
     begin
         fVlrPencentual :=
            OperComum.DivValorZero((redtNrContratos.Value * fVlrPencentual100),fNrContratos100);
         redtPercentual.Value := fVlrPencentual;
     end;
  end;
end;

end.
