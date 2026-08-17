//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_6
// Motivo    : Implementação do plano/patrocinador
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_5
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//*****************************************************************************
//Data	    : 09/06/2006
//Código    : Al_4
//Motivo(S) : Ajuste na busca da proxima data de fechamento
//*****************************************************************************
//Data	    : 06/03/2006
//Código    : Al_3
//Motivo(S) : Implementação da trava de fechamento de renda variavel
// ******************************************************************************
// Data     : 06/06/2005
// Código   : AL_2
// Motivo   : Alteração da procedure para function(CalculaCaixaCota),
//            implementado tratamento para a mesma
//******************************************************************************
// Data     : 01/06/2005
// Código   : AL_1
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************

unit FFechtoCartGerenc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, ComCtrls, Db, DBTables, Wwquery, uCtrlInvContab;

type
  TfrmFechtoCartGerenc = class(TfrmOkCancelarInv)
    Label4: TLabel;
    dteDataInicio: TCMDateTimePicker;
    Label1: TLabel;
    dteDataFinal: TCMDateTimePicker;
    grbRendaVariavel: TGroupBox;
    prbAtualiza: TProgressBar;
    pnlMensagens: TPanel;
    lblEventos: TLabel;
    BtProcessar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    QryBuscaDataFech: TwwQuery;
    QryUltDataMov: TwwQuery;
    //AL_6
    lblPlano: TLabel;
    lblCartGerenc: TLabel;
    prbCartGerenc: TProgressBar;
    procedure BtProcessarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dteDataFinalExit(Sender: TObject);
    procedure dteDataInicioExit(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaDatas;    
  public
    { Public declarations }
  end;

var
  frmFechtoCartGerenc: TfrmFechtoCartGerenc;

implementation

uses UBibliotecaInvest, UCotaComum, UDiasUteisInv, dBaseDados, uMensErro, URendaVariavel;

{$R *.DFM}

procedure TfrmFechtoCartGerenc.BtProcessarClick(Sender: TObject);
var
   DataProc : TDateTime;
   bFechado : Boolean;
begin
   // AL_3 - Trava de Fechamento de RV
   if RendaVariavel.VerEmAbertura then
      Exit;

   // Retirada de warnings
   bFechado := False;

   inherited;
   // AL_1
   //AL_5
   if not CtrlInvContab.TestaPeriodo(dteDataInicio.Text, 2) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dteDataInicio.CanFocus then
         dteDataInicio.SetFocus;
      Exit;
   end;

   Try
      If Not DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.StartTransaction;

      QryBuscaDataFech.Close;
      QryBuscaDataFech.Open;

      DataProc       := StrToDate(dteDataInicio.Text);

      While DataProc <= StrToDate(dteDataFinal.Text) Do
      Begin
         pnlMensagens.Caption := 'Processando Dia : ' + DateToStr(DataProc);
         pnlMensagens.Repaint;

         bFechado    := False;
         //Verifica data de fechamnto dos FAQ/FIF, se esses estao fechados
         If QryBuscaDataFech.FieldByName('DATAULTFECH').AsDateTime  >= DataProc Then
            bFechado := True;

         //Atualiza o Saldo de Caixa e Calcula a Cota
         //Al_2
         If (bFechado) Then
         begin                                                                      
            if not CotaComum.CalculaCaixaCota(DataProc, DataProc) then
            begin
               bbtnCancelarClick(Sender);
               exit;
            end;
         end
         //Al_2 - Fim
         else
            MsgDlg('Não é possível atualizar as Carteiras para o dia '+DateToStr(DataProc)+'.'+#13+#10+
                   'Verifica o fechamnto dos FAQ/FIF para esse dia.',
                   'Mensagem do Sistema', mtWarning, [mbOk], 0);

         iTipoInvestUsu := 5;
         // Incrementa data de Processamento
         DataProc       := DataProc+1;
         While not DiasUteisInv.DiaUtil(DataProc,-1,1,'',True,False,False) Do
            DataProc    := DataProc+1;   // Achar o próximo dia útil
         iTipoInvestUsu := 2;
         // Limpa Progressbars
         prbAtualiza.Position := 0;
      End;

      If (bFechado) Then
      begin
          pnlMensagens.Caption  := 'Processamento Ok.  '+DateToStr(DataProc-1);
          pnlMensagens.Repaint;
      end;

      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
   Except
      bbtnCancelar.Enabled  := True;
      bbtnCancelarClick(Sender);
      bbtnCancelar.Enabled  := False;
   End;

end;

procedure TfrmFechtoCartGerenc.AtualizaDatas;
var
   dDtaAtual : TDateTime;
begin
   QryUltDataMov.Close;
   QryUltDataMov.Open;
   dDtaAtual    := QryUltDataMov.FieldByName('DATAHISTCOTA').AsDateTime;
   QryUltDataMov.Close;

   //Al_4 
   if dDtaAtual = 0 then
      dDtaAtual := pRPI.DATAULTFECH;

   if dDtaAtual = 0 then
      dDtaAtual := Date;   

   if (pRPI.DATAULTFECH <> 0) And (pRPI.DATAULTFECH < dDtaAtual) then
   begin
      dteDataInicio.Date    := pRPI.DATAULTFECH;
      While not DiasUteisInv.DiaUtil(dteDataInicio.Date,-1,1,'',True,False,False) Do
         dteDataInicio.Date := dteDataInicio.Date + 1;

      dteDataFinal.Date     := dDtaAtual;
   end
   else
   begin
      dteDataInicio.Date    := dDtaAtual + 1;
      While not DiasUteisInv.DiaUtil(dteDataInicio.Date,-1,1,'',True,False,False) Do
         dteDataInicio.Date := dteDataInicio.Date + 1;

      dteDataFinal.Date     := dteDataInicio.Date;
   end;
end;

procedure TfrmFechtoCartGerenc.FormShow(Sender: TObject);

begin
  inherited;
   AtualizaDatas;
end;

procedure TfrmFechtoCartGerenc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   prbAtualiza.Max       := 0;
   prbAtualiza.StepIt;

   pnlMensagens.Caption  := '';
   pnlMensagens.Repaint;

   lblEventos.Caption    := '';
   lblEventos.Repaint;

   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;

   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Commit;

   AtualizaDatas;          

end;

procedure TfrmFechtoCartGerenc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

   prbAtualiza.Max       := 0;
   prbAtualiza.StepIt;

   pnlMensagens.Caption  := '';
   pnlMensagens.Repaint;

   lblEventos.Caption    := '';
   lblEventos.Repaint;

   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;

   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
end;

procedure TfrmFechtoCartGerenc.dteDataFinalExit(Sender: TObject);
begin
  inherited;

   If (dteDataInicio.Date > dteDataFinal.Date) Then
   begin
      dteDataFinal.Date := dteDataInicio.Date;
      dteDataFinal.SetFocus;
   end;
   
end;

procedure TfrmFechtoCartGerenc.dteDataInicioExit(Sender: TObject);
begin
  inherited;
   If dteDataInicio.Date <= StrToDate('02/01/2004') Then
   begin
      dteDataInicio.Date := StrToDate('05/01/2004');
      dteDataInicio.Text := '05/01/2004';
   end;
end;

end.
