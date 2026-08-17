//******************************************************************************
// Data     : 03/10/2006
// Código   : AL_4
// Pendencia: 22965
// Desc     : Segregação Plano / Patrocinadora (DFM)
//******************************************************************************
// Data     : 12/06/2006
// Código   : AL_3
// Pendencia: 21854
// SOL      : 41388
// Desc     : Alterado o caption bbtnConfirmar para Consultar.
//            Implementado mensagem de Processo Concluído.
//******************************************************************************
// Data     : 12/06/2006
// Código   : AL_2
// Pendencia: 21854
// SOL      : 41388
// Desc     : Ajuste na forma de utilização da tela:
//              Marca investimentos em uma única data
//              Desmarca investimentos em um período
//******************************************************************************
// Data      : 06/03/2006
// Código    : AL_1
// Pendencia :
// SOL       :
//           : Ajuste nas rotinas para a nova rotina de marcar investimentos
//             Implementação da trava de fechamento de renda variavel
//******************************************************************************
unit FMarcaDesmarcaInvRV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook,
  Db, DBTables, Wwquery, wwdbdatetimepicker, CMDateTimePicker, Wwdatsrc,
  faMensagem;

type
  TfrmMarcaDesmarcaInvRV = class(TfrmOkCancelarInv)
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
    qryBuscaMarcadosDATAMOVCARTINV: TDateTimeField;
    qryBuscaMarcadosDESCINVESTIMENTO: TStringField;
    qryBuscaMarcadosIDINVESTIMENTO: TFloatField;
    bbtnTodos: TBitBtn;
    bbtnUm: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    Label2: TLabel;
    rdgMarcaDesmarca: TRadioGroup;
    fraMens: TfraMensagem;
    qryBuscaMarcadosDESCCARTINVEST: TStringField;
    qryBuscaMarcadosIDCARTEIRAINVEST: TFloatField;
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    dblCarteira: TwwDBLookupCombo;
    Label3: TLabel;
    qryBuscaMarcadosPLANPRVCONTABPATRO: TStringField;
    qryBuscaMarcadosIDPLANPREVCTBPATR: TFloatField;
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
  frmMarcaDesmarcaInvRV: TfrmMarcaDesmarcaInvRV;

implementation

uses UMensErro, dBaseDados, UOperComum, UDataBase, URendaVariavel,
     dRendaVariavel;

{$R *.DFM}

procedure TfrmMarcaDesmarcaInvRV.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   // AL_2
   try
      // AL_1
      RendaVariavel.VerEmAbertura;

      try
         if rdgMarcaDesmarca.ItemIndex = 0 then
         begin
            if (Trim(dDataIni.Text) = '') and (Trim(dDataFim.Text) = '') then
               Raise Exception.Create('Para Marcar qualquer investimento, selecione uma data ou período');
         end;
         with qryBuscaMarcados do
         begin
             OperComum.LimpaParametros(qryBuscaMarcados);
             if Trim(dDataIni.Text) <> '' then
                ParamByName('DATAINI').AsString := dDataIni.Text;
             //AL_2
             if Trim(dDataFim.Text) <> '' then
                ParamByName('DATAFIM').AsString := OperComum.IIF(rdgMarcaDesmarca.ItemIndex = 0, dDataIni.Text, dDataFim.Text);
             if Trim(dblInvestimento.Text) <> '' then
                ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
             if Trim(dblCarteira.Text) <> '' then
                ParamByName('IDCARTEIRAINVEST').AsInteger := qryCarteiraIDCARTEIRAINVEST.AsInteger;
             if rdgMarcaDesmarca.ItemIndex = 1 then
                ParamByName('FLGMARCADO').AsString := '5';
             Open;
         end;
      except
         on E: Exception do
            MsgDlg(E.Message, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      end;
   finally
      AtualizaBotoes;
   end;
end;

procedure TfrmMarcaDesmarcaInvRV.rdgMarcaDesmarcaClick(Sender: TObject);
begin
  inherited;
  if rdgMarcaDesmarca.ItemIndex = 0 then
  begin
     bbtnUm.Hint := 'Marca Um';
     bbtnTodos.Hint := 'Marca Todos';
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

procedure TfrmMarcaDesmarcaInvRV.bbtnUmClick(Sender: TObject);
begin

   inherited;

   // AL_1
   if RendaVariavel.VerEmAbertura then
      Exit;

   try
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;
         //AL_4 - Ini
         if rdgMarcaDesmarca.ItemIndex = 0 then
         begin
            // Marca o Investimento
            if not RendaVariavel.MarcarFlagReproc(qryBuscaMarcadosIDINVESTIMENTO.AsInteger,
                                                  qryBuscaMarcadosIDCARTEIRAINVEST.AsInteger,
                                                  qryBuscaMarcadosIDPLANPREVCTBPATR.AsInteger,
                                                  qryBuscaMarcadosDATAMOVCARTINV.AsDateTime) then
               Raise Exception.Create('Não Foi Possível Marcar o Investimento para Reprocessamento.');

               MsgDlg('Investimento Marcado para Reprocessamento.',
                      'Mensagem do Sistema ',mtInformation,[mbOK],0)
         end
         else
         begin
            with DMRendaVariavel, DMRendaVariavel.qryDesmarcaFlgReproc do
            begin
               OperComum.LimpaParametros(qryDesmarcaFlgReproc, True);
               ParamByName('IDPLANPREVCTBPATR').AsInteger := qryBuscaMarcadosIDPLANPREVCTBPATR.AsInteger;
               ParamByName('IDCARTEIRAINVEST').AsInteger := qryBuscaMarcadosIDCARTEIRAINVEST.AsInteger;
               ParamByName('IDINVESTIMENTO').AsInteger := qryBuscaMarcadosIDINVESTIMENTO.AsInteger;
               ParamByName('DATAMOVCARTINV').AsString := qryBuscaMarcadosDATAMOVCARTINV.AsString;
               ExecSQL;
               if RowsAffected > 0 then
                  MsgDlg('Investimento Desmarcado para Reprocessamento.',
                         'Mensagem do Sistema ',mtInformation,[mbOK],0)
               else
                  MsgDlg('O Investimento não pode ser Desmarcado para Reprocessamento.',
                         'Mensagem do Sistema ',mtInformation,[mbOK],0);
               OperComum.LimpaParametros(qryDesmarcaFlgReproc, True);
            end;
         end;
         //AL_4 - Fim
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
      except
         on E: Exception do
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um Problema ao Marcar o Investimento para Reprocessamento.'+#13+E.Message,
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   finally
      bbtnConfirmar.Click;
   end;
end;

procedure TfrmMarcaDesmarcaInvRV.bbtnTodosClick(Sender: TObject);
var iInvProc: Integer;
begin

   inherited;

   // AL_1
   if RendaVariavel.VerEmAbertura then
      Exit;

   try
      try
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;
         qryBuscaMarcados.DisableControls;
         //AL_4 - Ini
         if rdgMarcaDesmarca.ItemIndex = 0 then
         begin
            fraMens.Mostra;
            fraMens.Max := qryBuscaMarcados.RecordCount;
            iInvProc := 0;

            qryBuscaMarcados.First;
            while not qryBuscaMarcados.Eof do
            begin
               // Marca o Investimento
               fraMens.Mes := 'Marcando ' + Copy(qryBuscaMarcadosDESCINVESTIMENTO.AsString,1,40) + #13 +
                              'Carteira ' + Copy(qryBuscaMarcadosDESCCARTINVEST.AsString,1,40) + #13 +
                              'em ' + qryBuscaMarcadosDATAMOVCARTINV.AsString;
               if not RendaVariavel.MarcarFlagReproc(qryBuscaMarcadosIDINVESTIMENTO.AsInteger,
                                              qryBuscaMarcadosIDCARTEIRAINVEST.AsInteger,
                                              qryBuscaMarcadosIDPLANPREVCTBPATR.AsInteger,
                                              qryBuscaMarcadosDATAMOVCARTINV.AsDateTime) then
                  MsgDlg('O Investimento: ' + qryBuscaMarcadosDESCINVESTIMENTO.AsString + #13 +
                         'na Carteira:    ' + qryBuscaMarcadosDESCCARTINVEST.AsString + #13 +
                         'não pode ser Marcado para Reprocessamento em ' + qryBuscaMarcadosDATAMOVCARTINV.AsString,
                         'Mensagem do Sistema ', mtWarning, [mbOK],0);
               fraMens.Incrementa;
               qryBuscaMarcados.Next;
            end;
         end
         else
         begin
            with DMRendaVariavel, DMRendaVariavel.qryDesmarcaFlgReproc do
            begin
               fraMens.Mostra;
               fraMens.Max := qryBuscaMarcados.RecordCount;
               iInvProc := 0;

               qryBuscaMarcados.First;
               while not qryBuscaMarcados.Eof do
               begin
                  // Desmarca o Investimento
                  fraMens.Mes := 'Desmarcando ' + Copy(qryBuscaMarcadosDESCINVESTIMENTO.AsString,1,40) + #13 +
                                 'Carteira ' + Copy(qryBuscaMarcadosDESCCARTINVEST.AsString,1,40) + #13 +
                                 'em ' + qryBuscaMarcadosDATAMOVCARTINV.AsString;

                  OperComum.LimpaParametros(qryDesmarcaFlgReproc, True);
                  ParamByName('IDPLANPREVCTBPATR').AsInteger := qryBuscaMarcadosIDPLANPREVCTBPATR.AsInteger;
                  ParamByName('IDCARTEIRAINVEST').AsInteger := qryBuscaMarcadosIDCARTEIRAINVEST.AsInteger;
                  ParamByName('IDINVESTIMENTO').AsInteger := qryBuscaMarcadosIDINVESTIMENTO.AsInteger;
                  ParamByName('DATAMOVCARTINV').AsString := qryBuscaMarcadosDATAMOVCARTINV.AsString;
                  ExecSQL;
                  if RowsAffected > 0 then
                     Inc(iInvProc)
                  else
                     MsgDlg('O Investimento: ' + qryBuscaMarcadosDESCINVESTIMENTO.AsString + #13 +
                            'na Carteira:    ' + qryBuscaMarcadosDESCCARTINVEST.AsString + #13 +
                            'não pode ser Desmarcado para Reprocessamento em ' + qryBuscaMarcadosDATAMOVCARTINV.AsString,
                            'Mensagem do Sistema ', mtWarning, [mbOK],0);
                  OperComum.LimpaParametros(qryDesmarcaFlgReproc, True);
                  fraMens.Incrementa;
                  qryBuscaMarcados.Next;
               end;
            end;
         end;
         //AL_4 - Fim
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Commit;
         //AL_3
         MsgDlg('Investimentos Desmarcados para Reprocessamento.', 'Mensagem do Sistema ',mtInformation,[mbOK],0);

      except
         on E: Exception do
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            MsgDlg('Ocorreu um Problema ao Marcar o Investimento para Reprocessamento.'+#13+E.Message,
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
         end;
      end;
   finally
      fraMens.Apaga;
      bbtnConfirmar.Click;
      qryBuscaMarcados.EnableControls;
   end;
end;

procedure TfrmMarcaDesmarcaInvRV.FormShow(Sender: TObject);
begin
   qryInvestimento.Open;
   qryCarteira.Open;
   inherited;
   fraMens.Apaga;
   //AL_2
   AtualizaBotoes;
   rdgMarcaDesmarcaClick(Sender);
end;

//AL_2
procedure TfrmMarcaDesmarcaInvRV.AtualizaBotoes;
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

procedure TfrmMarcaDesmarcaInvRV.dDataIniExit(Sender: TObject);
begin
   inherited;
   // AL_2
   if (Trim(dDataIni.Text) <> '') and
      (rdgMarcaDesmarca.ItemIndex = 0) then
      dDataFim.Text := dDataIni.Text;
end;

procedure TfrmMarcaDesmarcaInvRV.bbtnCancelarClick(Sender: TObject);
begin
   // AL_2
   inherited;
   OperComum.LimpaParametros(qryBuscaMarcados);
   AtualizaBotoes;
end;

end.
