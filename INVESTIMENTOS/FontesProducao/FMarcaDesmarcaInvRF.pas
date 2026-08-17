//******************************************************************************
// Autor     : Marco Turon
// Data      : 11/03/2008
// Código    : AL_1
// Pendência : 24716
// SOL       : 55534
//           : Desenvolvimento do Form
//******************************************************************************
unit FMarcaDesmarcaInvRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook,
  Db, DBTables, Wwquery, wwdbdatetimepicker, CMDateTimePicker, Wwdatsrc,
  faMensagem, uDiasUteisInv;

type
  TfrmMarcaDesmarcaInvRF = class(TfrmOkCancelarInv)
    Panel1: TPanel;
    dbgBuscaMarcados: TwwDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dDataIni: TCMDateTimePicker;
    dDataFim: TCMDateTimePicker;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    dblInvestimento: TwwDBLookupCombo;
    lblInvestimento: TLabel;
    qryBuscaMarcados: TwwQuery;
    dsBuscaMarcados: TwwDataSource;
    bbtnTodos: TBitBtn;
    bbtnUm: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    Label2: TLabel;
    fraMens: TfraMensagem;
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    dblCarteira: TwwDBLookupCombo;
    Label3: TLabel;
    Label4: TLabel;
    dblPlanoPatro: TwwDBLookupCombo;
    rdgMarcaDesmarca: TRadioGroup;
    qryPlanoPatro: TwwQuery;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryBuscaMarcadosDATAHISTRENFIX: TDateTimeField;
    qryBuscaMarcadosPLANPRVCONTABPATRO: TStringField;
    qryBuscaMarcadosDESCCARTINVEST: TStringField;
    qryBuscaMarcadosDESCINVESTIMENTO: TStringField;
    qryBuscaMarcadosDATAOPERACAO: TDateTimeField;
    qryBuscaMarcadosVENCOPERACAO: TDateTimeField;
    qryBuscaMarcadosIDPLANPREVCTBPATR: TFloatField;
    qryBuscaMarcadosIDCARTEIRAINVEST: TFloatField;
    qryBuscaMarcadosIDINVESTIMENTO: TFloatField;
    qryBuscaMarcadosIDOPERRENFIXAPLIC: TFloatField;
    lblNumInv: TfcLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rdgMarcaDesmarcaClick(Sender: TObject);
    procedure bbtnUmClick(Sender: TObject);
    procedure bbtnTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dDataIniExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaBotoes;
  public
    { Public declarations }
  end;

var
  frmMarcaDesmarcaInvRF: TfrmMarcaDesmarcaInvRF;

implementation

uses UMensErro, dBaseDados, UOperComum, UDataBase, URendaFixa, dRendaFixa;

{$R *.DFM}

procedure TfrmMarcaDesmarcaInvRF.bbtnConfirmarClick(Sender: TObject);
var sDataIni, sDataFim: String;
begin
   inherited;
   try
      if RendaFixa.VerEmAbertura then
         Exit;
      try
         if rdgMarcaDesmarca.ItemIndex = 0 then
         begin
            if Trim(dDataIni.Text) = '' then
               Raise Exception.Create('Para Marcar qualquer investimento, selecione uma data');
            sDataIni := DateToStr(DiasUteisInv.UltDiaUtilAnterior(dDataIni.DateTime, -1, 1, '', True, False, False));
            sDataFim := dDataIni.Text;
         end
         else
         begin
            sDataIni := dDataIni.Text;
            sDataFim := dDataFim.Text;
         end;

         OperComum.LimpaParametros(qryBuscaMarcados);
         if Trim(sDataIni) <> '' then
            qryBuscaMarcados.ParamByName('DATAINI').AsString := sDataIni;
         if Trim(sDataFim) <> '' then
            qryBuscaMarcados.ParamByName('DATAFIM').AsString := sDataFim;
         if Trim(dblInvestimento.Text) <> '' then
            qryBuscaMarcados.ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
         if Trim(dblPlanoPatro.Text) <> '' then
            qryBuscaMarcados.ParamByName('IDPLANPREVCTBPATR').AsInteger := qryPlanoPatroIDPLANPREVCTBPATR.AsInteger;
         if Trim(dblCarteira.Text) <> '' then
            qryBuscaMarcados.ParamByName('IDCARTEIRAINVEST').AsInteger := qryCarteiraIDCARTEIRAINVEST.AsInteger;
         if rdgMarcaDesmarca.ItemIndex = 1 then
            qryBuscaMarcados.ParamByName('FLGRECALC').AsString := 'S';
         qryBuscaMarcados.Open;

         lblNumInv.Caption := IntToStr(qryBuscaMarcados.RecordCount) + ' Posições selecionadas';

      except
         on E: Exception do
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      end;
   finally
      AtualizaBotoes;
   end;
end;

procedure TfrmMarcaDesmarcaInvRF.rdgMarcaDesmarcaClick(Sender: TObject);
begin
  inherited;
  if rdgMarcaDesmarca.ItemIndex = 0 then
  begin
     bbtnUm.Hint := 'Marca Um';
     bbtnTodos.Hint := 'Marca Todos';
     dDataFim.Clear;
     dDataFim.Enabled := False;
  end
  else
  if rdgMarcaDesmarca.ItemIndex = 1 then
  begin
     bbtnUm.Hint := 'Desmarca Um';
     bbtnTodos.Hint := 'Desmarca Todos';
     dDataFim.Enabled := True;
  end;
end;

procedure TfrmMarcaDesmarcaInvRF.bbtnUmClick(Sender: TObject);
var sMensErro, sMarca: String;
begin

   inherited;

   if RendaFixa.VerEmAbertura then
      Exit;

   try
      try

         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         if rdgMarcaDesmarca.ItemIndex = 0 then
         begin
            sMarca := 'S';
            sMensErro := 'marca';
         end
         else
         begin
            sMarca := 'N';
            sMensErro := 'desmarca';
         end;

         // Marca ou Desmarca o Investimento
         if RendaFixa.MarcaInvRep(qryBuscaMarcadosDATAHISTRENFIX.AsDateTime,
                                  qryBuscaMarcadosIDINVESTIMENTO.AsInteger,
                                  qryBuscaMarcadosIDOPERRENFIXAPLIC.AsInteger,
                                  qryBuscaMarcadosIDPLANPREVCTBPATR.AsInteger,
                                  qryBuscaMarcadosIDCARTEIRAINVEST.AsInteger,
                                  sMarca) < 1 then
            Raise Exception.Create('Não foi possível ' + sMensErro + 'r o investimento para reprocessamento.');

         MsgDlg('Investimento ' + sMensErro + 'do para reprocessamento.',
                'Mensagem do Sistema ',mtInformation,[mbOK],0);

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
      except
         on E: Exception do
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um problema ao ' + sMensErro + 'r o investimento para reprocessamento.' + #13 +
                   E.Message, 'Mensagem do Sistema ',mtWarning,[mbOK],0)
         end;
      end;
   finally
      bbtnConfirmar.Click;
   end;
end;

procedure TfrmMarcaDesmarcaInvRF.bbtnTodosClick(Sender: TObject);
var iInvProc: Integer;
    sMensErro, sMarca: String;
begin

   inherited;

   if RendaFixa.VerEmAbertura then
      Exit;

   try
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         if rdgMarcaDesmarca.ItemIndex = 0 then
         begin
            sMarca := 'S';
            sMensErro := 'marca';
         end
         else
         begin
            sMarca := 'N';
            sMensErro := 'desmarca';
         end;

         fraMens.Mostra;
         fraMens.Max := qryBuscaMarcados.RecordCount;
         qryBuscaMarcados.DisableControls;

         while not qryBuscaMarcados.Eof do
         begin
            fraMens.Mes := 'Processando ' + qryBuscaMarcadosDESCINVESTIMENTO.AsString + ' comprada em ' + qryBuscaMarcadosDATAOPERACAO.AsString + #13 +
                            sMensErro + 'ndo para reprocessamento em ' + qryBuscaMarcadosDATAHISTRENFIX.AsString;

            // Marca ou Desmarca o Investimento
            if RendaFixa.MarcaInvRep(qryBuscaMarcadosDATAHISTRENFIX.AsDateTime,
                                     qryBuscaMarcadosIDINVESTIMENTO.AsInteger,
                                     qryBuscaMarcadosIDOPERRENFIXAPLIC.AsInteger,
                                     qryBuscaMarcadosIDPLANPREVCTBPATR.AsInteger,
                                     qryBuscaMarcadosIDCARTEIRAINVEST.AsInteger,
                                     sMarca) < 1 then
               Raise Exception.Create('Não foi possível ' + sMensErro + 'r um investimento para reprocessamento.' + #13 +
                                      'Investimento: ' + qryBuscaMarcadosDESCINVESTIMENTO.AsString + #13 +
                                      'Carteira: ' + qryBuscaMarcadosDESCCARTINVEST.AsString + #13 +
                                      'Plano / Patrocinadora: ' + qryBuscaMarcadosPLANPRVCONTABPATRO.AsString + #13 +
                                      'Data: ' + qryBuscaMarcadosDATAHISTRENFIX.AsString);

            qryBuscaMarcados.Next;
            fraMens.Incrementa;
            Application.ProcessMessages;
         end;

         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;

         MsgDlg('Investimentos ' + sMensErro + 'dos para reprocessamento.',
                'Mensagem do Sistema ',mtInformation,[mbOK],0)

      except
         on E: Exception do
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um problema ao ' + sMensErro + 'r um dos investimentos para reprocessamento.' + #13 + E.Message,
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   finally
      fraMens.Apaga;
      bbtnConfirmar.Click;
      qryBuscaMarcados.EnableControls;
   end;
end;

procedure TfrmMarcaDesmarcaInvRF.FormShow(Sender: TObject);
begin
   qryInvestimento.Open;
   qryCarteira.Open;
   qryPlanoPatro.Open;
   inherited;
   fraMens.Apaga;
   AtualizaBotoes;
   rdgMarcaDesmarcaClick(Sender);
end;

procedure TfrmMarcaDesmarcaInvRF.AtualizaBotoes;
begin
   if (qryBuscaMarcados.State = dsInactive) or
      (qryBuscaMarcados.IsEmpty) then
   begin
      if qryBuscaMarcados.State = dsInactive then
         bbtnCancelar.Enabled := False;
      bbtnUm.Enabled := False;
      bbtnTodos.Enabled := False;
   end
   else
   begin
      bbtnCancelar.Enabled := True;
      bbtnUm.Enabled := True;
      bbtnTodos.Enabled := True;
   end;
end;

procedure TfrmMarcaDesmarcaInvRF.dDataIniExit(Sender: TObject);
begin
   inherited;
   if (Trim(dDataIni.Text) <> '') and
      (rdgMarcaDesmarca.ItemIndex = 0) then
      dDataFim.Text := dDataIni.Text;
end;

procedure TfrmMarcaDesmarcaInvRF.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   OperComum.LimpaParametros(qryBuscaMarcados);
   lblNumInv.Caption := '0 Posições selecionadas';
   AtualizaBotoes;
end;

end.





