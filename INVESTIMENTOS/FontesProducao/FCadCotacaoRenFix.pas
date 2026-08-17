//******************************************************************************
// Data      : 31/08/2006
// Código    : AL_4
// Pendencia : 
// Desc      : Substituição do pRPI pelo CtrlPInv
//             Ajustes na seleção de vencimentos
//******************************************************************************
// Data      : 03/07/2006
// Código    : AL_3
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data   : 30/05/2005
// Código : AL_2
// Função : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data   : 04/08/2004
// Código : AL_1
// Função : Controle do processo de abertura
//******************************************************************************
//Data    : 07/05/2004
//Função  : Implementação de botão de consulta
//******************************************************************************
//Data	  : 28/04/2004
//Função  : Permite cadastrar uma cotação retroativa sem voltar a abertura do sistema
//Motivo  : Implementação do Reprocessamento
//******************************************************************************
unit FCadCotacaoRenFix;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMDetCSInv, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  fcLabel, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, DBCtrls, Mask, wwdbedit,
  Wwdbspin, TREdit, wwdbdatetimepicker, CMDateTimePicker, uCtrlInvContab,
  uCtrlPadroes, uCtrlParamInvest;

type
  TfrmCadCotacaoRenFix = class(TfrmCadastroMDetInv)
    Label11: TLabel;
    dblInvestimento: TwwDBLookupCombo;
    qryInvestimento: TwwQuery;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoVENCOPERACAO: TDateTimeField;
    qryInvestimentoCHAVE: TStringField;
    Label2: TLabel;
    dbdDataCotacao: TCMDateTimePicker;
    Label3: TLabel;
    dbrVlrCotacao: TDBRealEdit;
    qryDetalheDATACOTACAO: TDateTimeField;
    qryDetalheDATAVENCTO: TDateTimeField;
    qryDetalheVLRCOTACAO: TFloatField;
    qryDetalheIDINVESTIMENTO: TFloatField;
    dblDataVencto: TwwDBLookupCombo;
    Label1: TLabel;
    qryVencOperacao: TwwQuery;
    qryVencOperacaoIDINVESTIMENTO: TFloatField;
    qryVencOperacaoVENCOPERACAO: TDateTimeField;
    qryVencOperacaoCHAVE: TStringField;
    qryInvestimentoIDCLASSETIT: TFloatField;
    qryDetalheVLRPUPAR: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure dblInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblDataVenctoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblInvestimentoExit(Sender: TObject);
    procedure dblDataVenctoExit(Sender: TObject);
    procedure dblInvestimentoDropDown(Sender: TObject);
  private
    { Private declarations }
    //AL_4
    Procedure Sel(IDInvestimento: Integer = -1; DataVenc: String = ''; DataCota: String = '');
    procedure SelVenc(iInvestimento: Integer = -1; DataVenc: String = '');
    Procedure MostraDados(bBuscaVenc: Boolean = True);
    procedure ControlaBotoes;
  public
    { Public declarations }
  end;

var
  frmCadCotacaoRenFix: TfrmCadCotacaoRenFix;

implementation

{$R *.DFM}

Uses uMensErro, UDataBase, uSistema, UBibliotecaInvest, UOperacaoInvest, fAguardeInv,
     DBaseDados, UOperComum, URendaFixa, UDiasUteisInv;

{ TfrmCadCotacaoRenFix }

procedure TfrmCadCotacaoRenFix.FormShow(Sender: TObject);
begin
  inherited;
  //AL_4
  qryInvestimento.Open;
   MostraDados;
   // Mostra a Grid do Detalhe
  dbgrdDet.BringToFront;
  sbtnInsDet.Enabled := False;
  ControlaBotoes;
end;

procedure TfrmCadCotacaoRenFix.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInvestimento.Close;
  inherited;
end;

procedure TfrmCadCotacaoRenFix.Sel(IdInvestimento: Integer = -1; DataVenc: String = ''; DataCota: String = '');
begin
   //AL_4 - Ini
   OperComum.LimpaParametros(qryDetalhe);
   qryDetalhe.ParamByName('IDINVESTIMENTO').AsInteger := IDInvestimento;
   qryDetalhe.ParamByName('DATAVENCTO').AsString := DataVenc;

   // Se o Vencimento estiver preenchido, não mostra no grid
   dbgrdDet.Selected.Clear;
   if Trim(dblDataVencto.Text) <> '' then
   begin
      dbgrdDet.Selected.Add('DATACOTACAO'#9'26'#9'Data da Cotação');
      dbgrdDet.Selected.Add('VLRCOTACAO'#9'34'#9'Valor da Cotação');
   end
   else
   begin
      dbgrdDet.Selected.Add('DATAVENCTO'#9'18'#9'Vencimento');
      dbgrdDet.Selected.Add('DATACOTACAO'#9'18'#9'Data da Cotação');
      dbgrdDet.Selected.Add('VLRCOTACAO'#9'24'#9'Valor da Cotação');
   end;

   qryDetalhe.Open;

   if DataCota <> '' then
      qryDetalhe.Locate('DATACOTACAO', DataCota, []);
   //AL_4 - Fim
end;

procedure TfrmCadCotacaoRenFix.SelVenc(iInvestimento: Integer = -1; DataVenc: String = '');
begin
   //AL_4 - Ini
   OperComum.LimpaParametros(qryVencOperacao);
   qryVencOperacao.ParamByName('IDINVESTIMENTO').AsInteger := iInvestimento;
   qryVencOperacao.Open;

   if DataVenc <> '' then
   begin
      if qryVencOperacao.Locate('VENCOPERACAO', DataVenc, []) then
      begin
         dblDataVencto.Text := qryVencOperacaoVENCOPERACAO.AsString;
         dblDataVencto.PerformSearch;
      end;
   end;
   //AL_4 - Fim
end;

procedure TfrmCadCotacaoRenFix.MostraDados(bBuscaVenc: Boolean = True);
begin
   //AL_4 - Ini
   if Trim(dblInvestimento.Text) = '' then
   begin
      SelVenc;
      Sel;
   end
   else
   begin
      if Trim(dblDataVencto.Text) = '' then
      begin
         if bBuscaVenc then
         begin
            SelVenc(qryInvestimentoIDINVESTIMENTO.AsInteger, qryInvestimentoVENCOPERACAO.AsString);
            Sel(qryInvestimentoIDINVESTIMENTO.AsInteger, qryInvestimentoVENCOPERACAO.AsString);
         end
         else
         begin
            SelVenc(qryInvestimentoIDINVESTIMENTO.AsInteger);
            Sel(qryInvestimentoIDINVESTIMENTO.AsInteger);
         end;
      end
      else
      begin
         SelVenc(qryInvestimentoIDINVESTIMENTO.AsInteger, qryVencOperacaoVENCOPERACAO.AsString);
         Sel(qryInvestimentoIDINVESTIMENTO.AsInteger, qryVencOperacaoVENCOPERACAO.AsString);
      end;
   end;
   ControlaBotoes;
   //AL_4 - Fim
end;

procedure TfrmCadCotacaoRenFix.bbtnOkDetClick(Sender: TObject);
begin
   // AL_2 - Inicio
   if Trim(dblInvestimento.Text) = '' then
   begin
      MsgDlg('Selecione um Investimento.', 'Warning', mtWarning, [mbOk], 0);
      if dblInvestimento.CanFocus then
         dblInvestimento.SetFocus;
      Exit;
   end else if Trim(dbdDataCotacao.Text) = '' then
   begin
      MsgDlg('Data da Cotação não informada.', 'Warning', mtWarning, [mbOk], 0);
      if dbdDataCotacao.CanFocus then
         dbdDataCotacao.SetFocus;
      Exit;
   //AL_4
   end else if (dbrVlrCotacao.Value = 0) and (Trim(dblDataVencto.Text) <> '') then
   begin
      MsgDlg('Valor da Cotação não informado.', 'Warning', mtWarning, [mbOk], 0);
      if dbrVlrCotacao.CanFocus then
         dbrVlrCotacao.SetFocus;
      Exit;
   end
   //AL_4
   else if (dbdDataCotacao.Date > qryVencOperacaoVENCOPERACAO.AsDateTime) and (Trim(dblDataVencto.Text) <> '') then
   begin
      MsgDlg('Data da Cotação Após o Vencimento do Investimento.', 'Warning', mtWarning, [mbOk], 0);
      if dbdDataCotacao.CanFocus then
         dbdDataCotacao.SetFocus;
      Exit;
   end
   //AL_3
   else if not CtrlInvContab.TestaPeriodo(dbdDataCotacao.Text, 1, -1, qryInvestimentoIDCLASSETIT.AsInteger) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      if dbdDataCotacao.CanFocus then
         dbdDataCotacao.SetFocus;
      Exit;
   end;

   if qryDetalhe.State = dsInsert then
   begin
      qryDetalheIDINVESTIMENTO.AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
      //AL_4
      if (not qryVencOperacao.IsEmpty) then
         qryDetalheDATAVENCTO.AsDateTime := qryVencOperacaoVENCOPERACAO.AsDateTime
   end;

   // Inserindo ou Alterando uma Cotação atrasada, marca o Investimento para Reprocessamento
   //AL_4
   if dbdDataCotacao.Date <= CtrlPInv.DataUltFechRF then
   begin
      if ((qryDetalhe.State = dsInsert) or
          ((qryDetalhe.State = dsEdit) and
           (qryDetalheVLRCOTACAO.OldValue <> qryDetalheVLRCOTACAO.AsFloat))) then
      begin
         if RendaFixa.MarcaInvRep(dbdDataCotacao.Date, qryInvestimentoIDINVESTIMENTO.AsInteger,-1,-1) = -1 then
            MsgDlg('Não foi Possível Marcar este Título para Reprocessamento.' + #13 +
                   'o Título ' + qryInvestimentoDESCINVESTIMENTO.AsString +
                   ' deve ser Reprocessado desde o Dia ' + dbdDataCotacao.Text,
                   'Mensagem do Sistema', mtWarning, [mbOk], 0);
      end;
   end;

   CmeDetalhe.RepetirInsert := False;  // Cancela o Repetir Inserir
   inherited;

   try
      AplicaAlteracoes([qryDetalhe]);
   Finally
      //AL_4
      MostraDados;
      ControlaBotoes;
      pnlMestre.Enabled := True;
      pnlControlesDet.Enabled := False;
   end;
   //AL_2 - Fim
end;

procedure TfrmCadCotacaoRenFix.sbtnInsDetClick(Sender: TObject);
begin
   // AL_1 - Controle do processo de abertura de renda fixa
   // Não faz se estiver em Abertura
   if RendaFixa.VerEmAbertura then Exit;

   //AL_4
   if (Trim(dblDataVencto.Text) = '') then
   begin
      MsgDlg('Para inserir nova cotação selecione um vencimento', 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      sbtnInsDet.Down := False;
      if dblDataVencto.CanFocus then
         dblDataVencto.SetFocus;
      Exit;
   end;

   pnlMestre.Enabled := False;
   pnlControlesDet.Enabled := True;
   inherited;
   ControlaBotoes;
   dbdDataCotacao.Enabled := True;
   if dbdDataCotacao.CanFocus then
      dbdDataCotacao.SetFocus;
end;

procedure TfrmCadCotacaoRenFix.sbtnExcluiDetClick(Sender: TObject);
begin
   // AL_2 - Inicio
   // AL_1 - Controle do processo de abertura de renda fixa
   // Não faz se estiver em Abertura
   if RendaFixa.VerEmAbertura then Exit;

   if (not qryDetalhe.IsEmpty) then
   begin
      if (MsgDlg('Deseja realmente excluir esta Cotação?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
      begin
         if CtrlInvContab.TestaPeriodo(dbdDataCotacao.Text,
                                       //AL_3
                                       1, -1, qryInvestimentoIDCLASSETIT.AsInteger) then
         begin
            try
               //AL_4
               if dbdDataCotacao.Date <= CtrlPInv.DataUltFechRF then
               begin
                  // Excluindo uma cotação atrasada, marca o Investimento para Reprocessamento
                  if RendaFixa.MarcaInvRep(dbdDataCotacao.Date, qryInvestimentoIDINVESTIMENTO.AsInteger,-1,-1) = -1 then
                     Raise Exception.Create('Não foi Possível Marcar este Título para Reprocessamento.' + #13 +
                                            'o Título ' + qryInvestimentoDESCINVESTIMENTO.AsString +
                                            ' deve ser Reprocessado desde o Dia ' + dbdDataCotacao.Text);
               end;
               inherited;
               AplicaAlteracoes([qryDetalhe]);
            except
               on E: Exception do
                  MsgDlg(E.Message, 'Mensagem do Sistema', mtError, [mbOk], 0);
            end;
         end
         else
            MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      end;
      ControlaBotoes;
   end;
end;

procedure TfrmCadCotacaoRenFix.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   //AL_4 - Ini
   if MontaSelect.RetornouValor then
   begin
      if qryInvestimento.Locate('IDINVESTIMENTO', StrToInt(MontaSelect.ValoresChave[1]), []) then
      begin
         dblInvestimento.Text := qryInvestimentoDESCINVESTIMENTO.AsString;
         dblInvestimento.PerformSearch;
      end;
      SelVenc(StrToInt(MontaSelect.ValoresChave[1]), MontaSelect.ValoresChave[2]);
      Sel(StrToInt(MontaSelect.ValoresChave[1]), MontaSelect.ValoresChave[2], MontaSelect.ValoresChave[0]);
   end;
   //AL_4 - Fim
   PnlFundo.Enabled :=True;
   pnlMestre.Enabled:=True;
   ControlaBotoes;
end;

procedure TfrmCadCotacaoRenFix.ControlaBotoes;
begin
   //AL_4
   sbtnInsDet.Enabled := ((qryDetalhe.State = dsBrowse) and (Trim(dblInvestimento.Text) <> '') and (Trim(dblDataVencto.Text) <> '') );
   sbtnAltDet.Enabled := ((qryDetalhe.State = dsBrowse) and (not qryDetalhe.IsEmpty));
   sbtnExcluiDet.Enabled := ((qryDetalhe.State = dsBrowse) and (not qryDetalhe.IsEmpty));
   dbgrdDet.Enabled := (not qryDetalhe.IsEmpty);
end;

procedure TfrmCadCotacaoRenFix.FormPaint(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled :=True;
  pnlMestre.Enabled:=True;
end;

procedure TfrmCadCotacaoRenFix.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  QryDetalhe.Cancel;
  pnlMestre.Enabled := True;
  pnlControlesDet.Enabled := False;
  ControlaBotoes;
end;

procedure TfrmCadCotacaoRenFix.sbtnAltDetClick(Sender: TObject);
begin
  // AL_1 - Controle do processo de abertura de renda fixa
  // Não faz se estiver em Abertura
  if RendaFixa.VerEmAbertura then Exit;

  pnlMestre.Enabled := False;
  pnlControlesDet.Enabled := True;
  inherited;
  ControlaBotoes;
  dbdDataCotacao.Enabled := False;
  if dbrVlrCotacao.CanFocus then
     dbrVlrCotacao.SetFocus;
end;

procedure TfrmCadCotacaoRenFix.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  if sbtnAltDet.Enabled then
     sbtnAltDet.Click
end;

procedure TfrmCadCotacaoRenFix.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  ControlaBotoes;
  pnlMestre.Enabled := True;
  pnlControlesDet.Enabled := False;
end;

//AL_4
procedure TfrmCadCotacaoRenFix.dblInvestimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
      MostraDados;
end;

//AL_4
procedure TfrmCadCotacaoRenFix.dblInvestimentoExit(Sender: TObject);
begin
   inherited;
   MostraDados;
end;

//AL_4
procedure TfrmCadCotacaoRenFix.dblDataVenctoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if modified then
      MostraDados(False);
end;

//AL_4
procedure TfrmCadCotacaoRenFix.dblDataVenctoExit(Sender: TObject);
begin
   MostraDados(False);
   inherited;
end;

procedure TfrmCadCotacaoRenFix.dblInvestimentoDropDown(Sender: TObject);
begin
   inherited;
   dblDataVencto.Clear;
end;

end.


