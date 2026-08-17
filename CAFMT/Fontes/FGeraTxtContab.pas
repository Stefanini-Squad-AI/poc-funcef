unit FGeraTxtContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOKCancelar, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, Mask, Db,
  DBTables, TB97, IvDictio, IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmGeraTxtContab = class(TfrmOKCancelar)
    Label1: TLabel;
    Label2: TLabel;
    EDtaInicio: TMaskEdit;
    Label3: TLabel;
    EDtaFim: TMaskEdit;
    SprAltUltTxtContab: TStoredProc;
    SaveDialog1: TSaveDialog;
    QryParam: TQuery;
    QryParamULTTXTCONTAB: TDateTimeField;
    QryParamDATAINICIAL: TDateTimeField;
    QryLancamento: TQuery;
    QryLancamentoPLNCODIGO: TFloatField;
    QryLancamentoLACNUMLAN: TFloatField;
    QryLancamentoLACDEBCRE: TStringField;
    QryLancamentoIDPESSOA: TFloatField;
    QryLancamentoCODCENTROCUSTO: TStringField;
    QryLancamentoPLACONTA: TStringField;
    QryLancamentoPLANO: TFloatField;
    QryLancamentoLACTIPO: TStringField;
    QryLancamentoLACNUMDOC: TStringField;
    QryLancamentoLACHIST1: TStringField;
    QryLancamentoLACHIST2: TStringField;
    QryLancamentoLACHIST3: TStringField;
    QryLancamentoLACHIST4: TStringField;
    QryLancamentoLACHIST5: TStringField;
    QryLancamentoLACVALOR: TFloatField;
    QryLancamentoLACTIPCONVOFICIAL: TStringField;
    QryLancamentoLACVALOFICIAL: TFloatField;
    QryLancamentoLACTIPCONVGERENCIAL: TStringField;
    QryLancamentoLACVALGERENCIAL: TFloatField;
    QryLancamentoLACTIPCONVGEREN1: TStringField;
    QryLancamentoLACVALGEREN1: TFloatField;
    QryLancamentoLACTIPCONVGEREN2: TStringField;
    QryLancamentoLACVALGEREN2: TFloatField;
    QryLancamentoLACATOUTMOEDA: TStringField;
    QryLancamentoLACORIGEMAPLICACAO: TStringField;
    QryLancamentoLACMUTACOES: TStringField;
    QryLancamentoTIPCODIGO: TStringField;
    QryLancamentoIDUSUARIOINCLUSAO: TFloatField;
    SaveDialog2: TSaveDialog;
    QryPlanilha: TQuery;
    QryPlanilhaPLNCODIGO: TFloatField;
    QryPlanilhaPERNUMERO: TFloatField;
    QryPlanilhaUNIDNEGOC: TFloatField;
    QryPlanilhaPEREXERCICIO: TFloatField;
//  QryPlanilhaSISCODORIGEM: TStringField;
    QryPlanilhaPLNDATDIA: TDateTimeField;
    QryPlanilhaPLNPLANIL: TFloatField;
    QryPlanilhaPLNNUMLAN: TFloatField;
    QryPlanilhaPLNTOTDEB: TFloatField;
    QryPlanilhaPLNTOTCRE: TFloatField;
    QryPlanilhaPLNTOTDEBOFICIAL: TFloatField;
    QryPlanilhaPLNTOTCREOFICIAL: TFloatField;
    QryPlanilhaPLNTOTDEBGERENCIAL: TFloatField;
    QryPlanilhaPLNTOTCREGERENCIAL: TFloatField;
    QryPlanilhaPLNTOTDEBGEREN1: TFloatField;
    QryPlanilhaPLNTOTCREGEREN1: TFloatField;
    QryPlanilhaPLNTOTDEBGEREN2: TFloatField;
    QryPlanilhaPLNTOTCREGEREN2: TFloatField;
    QryPlanilhaPLNEFETIVADO: TStringField;
    QryPlanilhaIDPESSOA: TFloatField;
    QryPlanilhaTIPCODIGO: TStringField;
    QryPlanilhaPLNEMUSO: TFloatField;
    QryPlanilhaIDUSUARIOINCLUSAO: TFloatField;
    procedure EDtaInicioExit(Sender: TObject);
    procedure EDtaFimEnter(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraTxtContab: TfrmGeraTxtContab;

implementation

{$R *.DFM}

procedure TfrmGeraTxtContab.EDtaInicioExit(Sender: TObject);
begin
  inherited;
  if bbtnCancelar.focused then exit;
  if ((EDtaInicio.Text = '  /  /    ') or (EDtaInicio.Text = ''))then
  begin
     messagedlg('Data de Início do período não pode estar vazia !',mterror,[mbOk],0);
     EDtaFim.setfocus;
     exit;
  end;

   if EDtaFim.Text <> '  /  /    ' then
      if StrToDate(EDtaInicio.Text) > StrToDate(EDtaFim.Text) then
      begin
         messagedlg('Data de Fim não pode ser menor que a de início !',mterror,[mbOk],0);
         EDtaFim.setfocus;
         exit;
      end;
end;

procedure TfrmGeraTxtContab.EDtaFimEnter(Sender: TObject);
begin
  inherited;
  if bbtnCancelar.focused then exit;
  EDtaFim.Text := DateToStr(Date);
   if EDtaInicio.Text <> '  /  /    ' then
      if StrToDate(EDtaInicio.Text) > StrToDate(EDtaFim.Text) then
      begin
         messagedlg('Data de Fim não pode ser menor que a de início !',mterror,[mbOk],0);
         EDtaFim.setfocus;
         exit;
      end;
end;

procedure TfrmGeraTxtContab.bbtnConfirmarClick(Sender: TObject);
var Planil, Lanc : TextFile;
    Planilha, Cabecalho, Lancamento : String;
begin
  inherited;
    If ((EDtaFim.Text = '') or
        (EDtaFim.Text = '  /  /    ')) then
    Begin
      messagedlg('Data de Fim do período não pode estar vazia !',mterror,[mbOk],0);
      EDtaFim.setfocus;
      exit;
    end;
    If ((EDtaInicio.Text = '') or
        (EDtaInicio.Text = '  /  /    ')) then
    Begin
      messagedlg('Data de Início do período não pode estar vazia !',mterror,[mbOk],0);
      EDtaInicio.setfocus;
      exit;
    end;
       messagedlg('Defina nome e local de gravação para o texto contendo os dados das planilhas !',mterror,[mbOk],0);
       If SaveDialog1.Execute then
       Begin
          AssignFile(Planil, SaveDialog1.FileName);   { File selected in dialog box }
          ReWrite(Planil);
          Cabecalho := 'Periodo de ' + EDtaInicio.Text  + ' a ' + EDtaFim.Text + ' gerado em ' + DateToStr(Date) + '*';
          Writeln(Planil,Cabecalho);
          QryPlanilha.Close;
          QryPlanilha.ParamByName('DtaInicio').AsDate := StrToDate(EDtaInicio.Text);
          QryPlanilha.ParamByName('DtaFim').AsDate    := StrToDate(EDtaFim.Text);
          QryPlanilha.Open;
          QryPlanilha.First;
          while not QryPlanilha.eof do
          begin
             Planilha := QryPlanilhaPLNCODIGO.AsString    + ',' +
                         QryPlanilhaIDPESSOA.AsString     + ',' +
                         QryPlanilhaPERNUMERO.AsString    + ',' +
                         QryPlanilhaUNIDNEGOC.AsString    + ',' +
                         QryPlanilhaPEREXERCICIO.AsString + ',' +
//                       QryPlanilhaSISCODORIGEM.AsString + ',' +
                         QryPlanilhaPLNDATDIA.AsString    + ',' +
                         QryPlanilhaPLNPLANIL.AsString    + ',' +
                         QryPlanilhaPLNNUMLAN.AsString    + ',' +
                         FormatFloat('#,##0.00',QryPlanilhaPLNTOTDEB.AsFloat)          + ',' +
                         FormatFloat('#,##0.00',QryPlanilhaPLNTOTCRE.AsFloat)          + ',' +
                         FormatFloat('#,##0.00',QryPlanilhaPLNTOTDEBOFICIAL.AsFloat)   + ',' +
                         FormatFloat('#,##0.00',QryPlanilhaPLNTOTCREOFICIAL.AsFloat)   + ',' +
                         FormatFloat('#,##0.00',QryPlanilhaPLNTOTDEBGERENCIAL.AsFloat) + ',' +
                         FormatFloat('#,##0.00',QryPlanilhaPLNTOTCREGERENCIAL.AsFloat) + ',' +
                         FormatFloat('#,##0.00',QryPlanilhaPLNTOTDEBGEREN1.AsFloat)    + ',' +
                         FormatFloat('#,##0.00',QryPlanilhaPLNTOTCREGEREN1.AsFloat)    + ',' +
                         FormatFloat('#,##0.00',QryPlanilhaPLNTOTDEBGEREN2.AsFloat)    + ',' +
                         FormatFloat('#,##0.00',QryPlanilhaPLNTOTCREGEREN2.AsFloat)    + ',' +
                         QryPlanilhaPLNEFETIVADO.AsString + ','+
                         QryPlanilhaIDPESSOA.AsString     + ','+
                         QryPlanilhaTIPCODIGO.AsString    + ','+
                         QryPlanilhaPLNEMUSO.AsString     + '*';
             Writeln(Planil,Planilha);
             QryPlanilha.Next;
          end;
       end;
       messagedlg('Defina nome e local de gravação para o texto contendo os dados dos lançamentos feitos nas planilhas !',mterror,[mbOk],0);
       If SaveDialog2.Execute then
       Begin
          CloseFile(Planil);
          AssignFile(Lanc, SaveDialog2.FileName);   { File selected in dialog box }
          ReWrite(Lanc);
          Cabecalho := 'Periodo de ' + EDtaInicio.Text  + ' a ' + EDtaFim.Text + ' gerado em ' + DateToStr(Date) + '*';
          Writeln(Lanc,Cabecalho);
          QryLancamento.Close;
          QryLancamento.ParamByName('DtaInicio').AsDate := StrToDate(EDtaInicio.Text);
          QryLancamento.ParamByName('DtaFim').AsDate    := StrToDate(EDtaFim.Text);
          QryLancamento.Open;
          QryLancamento.First;
          while not QryLancamento.eof do
          begin
             Lancamento := QryLancamentoPLNCODIGO.AsString      + ',' +
                           QryLancamentoLACNUMLAN.AsString      + ',' +
                           QryLancamentoLACDEBCRE.AsString      + ',' +
                           QryLancamentoIDPESSOA.AsString       + ',' +
                           QryLancamentoIDPESSOA.AsString       + ',' +
                           QryLancamentoCODCENTROCUSTO.AsString + ',' +
                           QryLancamentoPLACONTA.AsString       + ',' +
                           QryLancamentoPLANO.AsString          + ',' +
//                         QryLancamentoSISCODORIGEM.AsString   + ',' +
                           QryLancamentoLACTIPO.AsString        + ',' +
                           QryLancamentoLACNUMDOC.AsString      + ',' +
                           QryLancamentoLACHIST1.AsString       + ',' +
                           QryLancamentoLACHIST2.AsString       + ',' +
                           QryLancamentoLACHIST3.AsString       + ',' +
                           QryLancamentoLACHIST4.AsString       + ',' +
                           QryLancamentoLACHIST5.AsString       + ',' +
                           FormatFloat('#,##0.00',QryLancamentoLACVALOR.AsFloat)        + ',' +
                           QryLancamentoLACTIPCONVOFICIAL.AsString                      + ',' +
                           FormatFloat('#,##0.00',QryLancamentoLACVALOFICIAL.AsFloat)   + ',' +
                           QryLancamentoLACTIPCONVGERENCIAL.AsString                    + ',' +
                           FormatFloat('#,##0.00',QryLancamentoLACVALGERENCIAL.AsFloat) + ',' +
                           QryLancamentoLACTIPCONVGEREN1.AsString                       + ',' +
                           FormatFloat('#,##0.00',QryLancamentoLACVALGEREN1.AsFloat)    + ',' +
                           QryLancamentoLACTIPCONVGEREN2.AsString                       + ',' +
                           FormatFloat('#,##0.00',QryLancamentoLACVALGEREN2.AsFloat)    + ',' +
                           QryLancamentoLACATOUTMOEDA.AsString                          + ',' +
                           QryLancamentoLACORIGEMAPLICACAO.AsString                     + ',' +
                           QryLancamentoLACMUTACOES.AsString                            + ',' +
                           QryLancamentoTIPCODIGO.AsString + '*';
             Writeln(Lanc,Lancamento);
             QryLancamento.Next;
          end;
          CloseFile(Lanc);
          SprAltUltTxtContab.ParambyName('PUltTxtContab').asDate := (StrToDate(EDtaFim.Text) + 1);
          SprAltUltTxtContab.Prepare;
          SprAltUltTxtContab.ExecProc;
       end;
    bbtnConfirmar.Enabled := False;
end;

procedure TfrmGeraTxtContab.FormActivate(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := True;
  bbtnConfirmar.Visible := True;
  QryParam.Close;
  QryParam.Open;
  If ((QryParamULTTXTCONTAB.AsString = '') or
      (QryParamULTTXTCONTAB.AsString = '  /  /    ')) then
     EDtaInicio.Text := QryParamDATAINICIAL.AsString
  else
     EDtaInicio.Text := QryParamULTTXTCONTAB.AsString;
  EDtaFim.SetFocus;
end;


procedure TfrmGeraTxtContab.bbtnCancelarClick(Sender: TObject);
begin
  EDtaInicio.Text := '  /  /   ';
  EDtaFim.Text    := '  /  /   ';
end;

end.
