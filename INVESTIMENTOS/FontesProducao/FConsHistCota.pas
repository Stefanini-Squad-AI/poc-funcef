//******************************************************************************
// Data      : 08/05/2007
// Codigo    : AL_4
// Pendência : 25299
// Sol       :
// Motivo    : Implementação da Permissão do Uso da Carteira Gerencial em
//             virtude do parâmetro do sistema Utiliza carteira/Data
//******************************************************************************
// Data      : 05/10/2006
// Codigo    : AL_3
// Pendência :
// Sol       :
// Motivo    : Implementação do de mensagem de alerta
//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_2
// Pendência :
// Sol       :
// Motivo    : Implementação do plano/patrocinador
//******************************************************************************
// Data      : 09/06/2006
// Código    : Al_1
// Pendencia :
// SOL       :
// Motivo    : Implementação do controle de tamanho de tela conforme configuração
//******************************************************************************
{
Erro Quadrático Médio (EQM):
---------------------------
Calcula-se esta medida através da soma dos quadrados das diferenças entre os retornos diários do fundo de investimento,
e os retornos diários do benchmark do fundo.
Esta medida é empregada para a avaliação de fundos passivos, ou que tem como objetivo acompanhar o seu índice de referência.
Quanto menor, e mais próximo de zero for o EQM, melhor será o fundo de investimento, pois mais próximo ele estará do seu benchmark.
}
unit FConsHistCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Wwdbigrd, Grids, Wwdbgrid, Db, Wwdatsrc,
  DBTables, Wwquery, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  FOkCancelarInv, fcLabel, FPreview, TREdit,
  Spin, URegra, dxCntner, dxExEdtr, dxEdLib, Math;

type
  TfrmConsHistCota = class(TfrmOkCancelarInv)
    PlnParam: TPanel;
    PlnGrid: TPanel;
    DBGrid: TwwDBGrid;
    DBGridIButton: TwwIButton;
    QryHistCota: TwwQuery;
    DsHistCota: TwwDataSource;
    QryCarteira: TwwQuery;
    dblCarteira: TwwDBLookupCombo;
    Label1: TLabel;
    QryCarteiraDESCCARTGERENC: TStringField;
    QryCarteiraIDCARTEIRAGERENC: TFloatField;
    QryHistCotaDATAHISTCOTA: TDateTimeField;
    QryHistCotaDESCCARTGERENC: TStringField;
    QryHistCotaDESCCAIXACOTA: TStringField;
    QryHistCotaVLRHISTCOTA: TFloatField;
    UpdHistCota: TUpdateSQL;
    Qry: TwwQuery;
    Upd: TUpdateSQL;
    Ds: TwwDataSource;
    QryCARTEIRA2: TStringField;
    QryQTDEAPL: TFloatField;
    QryQTDERES: TFloatField;
    QryQUANTIDADE: TFloatField;
    QrySALDO: TFloatField;
    QryCOTA: TFloatField;
    QryDATA: TStringField;
    QryHistCotaIDEVENTOCAIXACOTA: TFloatField;
    qryRegra: TwwQuery;
    qryRegraNOMEREGRA: TStringField;
    qryRegraIDREGRA: TFloatField;
    qryRegraJur: TwwQuery;
    qryRegraJurIDREGRA: TFloatField;
    qryRegraJurNOMEREGRA: TStringField;
    Label4: TLabel;
    dblkRegra: TwwDBLookupCombo;
    Label8: TLabel;
    dblRegraJur: TwwDBLookupCombo;
    spePercentual: TSpinEdit;
    Label5: TLabel;
    chkPassoaPasso: TdxCheckEdit;
    edtJuros: TRealEdit;
    Label6: TLabel;
    pnlValores: TPanel;
    pnlIndicador: TPanel;
    pnlPerSInd: TPanel;
    pnlTitPerSInd: TPanel;
    pnlNomeInd: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    pnlValorizacao: TPanel;
    Panel2: TPanel;
    DtaInicio: TCMDateTimePicker;
    DtaFim: TCMDateTimePicker;
    Label2: TLabel;
    Label7: TLabel;
    regRentabilidade: TRegra;
    qryAux: TwwQuery;
    pnlTitMovimento: TPanel;
    bt_Imprime: TBitBtn;
    pnlEqmCab: TPanel;
    pnlEQM: TPanel;
    QryINDICEEQM: TFloatField;
    QryCarteiraIDCARTEIRAINVEST: TFloatField;
    QryPatroPlanPrevContab: TwwQuery;
    QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    QryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    QryPatroPlanPrevContabIDPATRO: TFloatField;
    dblPlanoPatr: TwwDBLookupCombo;
    Label3: TLabel;
    CbxEQM: TCheckBox;
    QryHistCotaPLANPRVCONTABPATRO: TStringField;
    QryHistCotaIDHISTCOTA: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    //Al_1 
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //AL_4
    procedure DtaFimExit(Sender: TObject);
  private
    { Private declarations }
     procedure PreencheGrid;
     procedure VariacaoIndicadores;

  public
    { Public declarations }
  end;

var
  frmConsHistCota : TfrmConsHistCota;
  fValorizacao    : Double;

implementation

//Al_1
uses FDmRelHistCota, UOperComum, UBibliotecaInvest, UMensErro, UDiasUteisInv,
     UCotaComum, FPrincipal,
//AL_4
URendaVariavel;

{$R *.DFM}

procedure TfrmConsHistCota.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
end;

procedure TfrmConsHistCota.FormShow(Sender: TObject);
begin
  inherited;
  DtaInicio.Date := Date;
  DtaFim.Date    := Date;
  Qry.Open;
  QryCarteira.Open;
  QryPatroPlanPrevContab.Open;
  QryHistCota.Open;
  qryRegra.ParamByName('IDTIPOREGRA').AsInteger    := pRPI.IDTIPOREGRARENT;
  qryRegra.Open;
  qryRegraJur.ParamByName('IDTIPOREGRA').AsInteger := pRPI.IDTIPOREGRARENT;
  qryRegraJur.Open;
end;

procedure TfrmConsHistCota.PreencheGrid;
var
   iTipoInvest, iDiasEQM, iPos     : Integer;
   fDifCotaIndEQM, fSomaDif, fCotacao, fCotacaoAnt, fCotaAnt, fCotaIni, fCotaFim : Double;
   fLnIndice, fLnCota, fRaiz, fEQM : Extended;
   dDataAnt, dDataCotacao          : TDateTime;
begin
   OperComum.LimpaParametros(QryHistCota);
   QryHistCota.ParamByName('DATAINICIO').AsString := DtaInicio.Text;
   QryHistCota.ParamByName('DATAFIM').AsString    := DtaFim.Text;
   if dblCarteira.LookupValue <> '' then
      QryHistCota.ParamByName('IDCARTEIRAGERENC').AsInteger     :=
                  QryCarteira.FieldByName('IDCARTEIRAGERENC').AsInteger;
   if dblPlanoPatr.LookupValue <> '' then
      QryHistCota.ParamByName('IDPLANPREVCTBPATR').AsInteger     :=
                  QryPatroPlanPrevContab.FieldByName('IDPLANPREVCTBPATR').AsInteger;
   QryHistCota.Open;

   fCotaAnt       := 0;
   fEQM           := 0;
   fRaiz          := 0;
   fCotacao       := 0;
   fCotacaoAnt    := 0;
   iDiasEQM       := 0;
   fSomaDif       := 0;
   fDifCotaIndEQM := 0;

   pnlEqmCab.Caption := 'EQM';
   if CbxEQM.Checked then
      pnlEqmCab.Caption := CbxEQM.Caption;

   OperComum.LimpaParametros(Qry);
   Qry.Open;
   Qry.DisableControls;
   Qry.Delete;

   iTipoInvest    := iTipoInvestUsu;
   iTipoInvestUsu := 5;
   While Not QryHistCota.Eof Do
   Begin
      If Not DiasUteisInv.DiaUtil(QryHistCota.FieldByName('DATAHISTCOTA').AsDateTime,-1,1,'',True,False,False) Then
      begin
         QryHistCota.Next;
         Continue;
      end;

      Qry.Append;
      Qry.FieldByName('DATA').AsString       :=
                QryHistCota.FieldByName('DATAHISTCOTA').AsString;
      While (Qry.FieldByName('DATA').AsString =
                QryHistCota.FieldByName('DATAHISTCOTA').AsString) And
            (Not QryHistCota.Eof)   Do
      Begin
         If POS('APLICA',UpperCase(QryHistCota.FieldByName('DESCCAIXACOTA').AsString)) <> 0 Then
            Qry.FieldByName('QTDEAPL').AsFloat    :=
                QryHistCota.FieldByName('VLRHISTCOTA').AsFloat
         Else If POS('RESGATE',UpperCase(QryHistCota.FieldByName('DESCCAIXACOTA').AsString)) <> 0 Then
            Qry.FieldByName('QTDERES').AsFloat    :=
                QryHistCota.FieldByName('VLRHISTCOTA').AsFloat
         Else If POS('QUANTIDADE',UpperCase(QryHistCota.FieldByName('DESCCAIXACOTA').AsString)) <> 0 Then
            Qry.FieldByName('QUANTIDADE').AsFloat :=
                QryHistCota.FieldByName('VLRHISTCOTA').AsFloat
         Else If POS('PATRIM',UpperCase(QryHistCota.FieldByName('DESCCAIXACOTA').AsString)) <> 0 Then
            Qry.FieldByName('SALDO').AsFloat      :=
                QryHistCota.FieldByName('VLRHISTCOTA').AsFloat
         Else If POS('COTA',UpperCase(QryHistCota.FieldByName('DESCCAIXACOTA').AsString)) <> 0 Then
         begin
            Qry.FieldByName('COTA').AsFloat         :=
                QryHistCota.FieldByName('VLRHISTCOTA').AsFloat;
            OperComum.BuscaCotacaoMoeda(pRPI.MOEDAEQM, Qry.FieldByName('DATA').AsDateTime,
                                     '', fCotacao, dDataCotacao);

            If Qry.FieldByName('DATA').AsDateTime    = dDataCotacao Then
               Qry.FieldByName('INDICEEQM').AsFloat := fCotacao
            Else
               Qry.FieldByName('INDICEEQM').AsFloat := 0;

            If fCotaAnt     <> 0 Then
            begin
               iDiasEQM     := iDiasEQM + 1;

               If CbxEQM.Checked Then
               begin
                  fLnCota        := Ln(OperComum.DivValorZero(QryHistCota.FieldByName('VLRHISTCOTA').AsFloat, fCotaAnt));
                  fLnIndice      := Ln(OperComum.DivValorZero(fCotacao, fCotacaoAnt));
               end
               Else
               begin
                  fLnCota        := OperComum.DivValorZero(QryHistCota.FieldByName('VLRHISTCOTA').AsFloat, fCotaAnt)-1;
                  fLnIndice      := OperComum.DivValorZero(fCotacao, fCotacaoAnt)-1;
               end;

               fDifCotaIndEQM := Power((fLnCota - fLnIndice),2);

               fSomaDif       := fSomaDif + fDifCotaIndEQM;
            end;

            fCotaAnt       := QryHistCota.FieldByName('VLRHISTCOTA').AsFloat;

            fCotacaoAnt    := fCotacao;

         end;

         Qry.Post;
         Qry.Edit;
         QryHistCota.Next;
      End;
   End;

   iTipoInvestUsu := iTipoInvest;

   fRaiz := Sqrt(252);

   fEQM  := Sqrt(OperComum.DivValorZero(fSomaDif,iDiasEQM));

   fEQM  := (fEQM * fRaiz)*100;

   If Trim(Qry.FieldByName('Data').AsString) <> '' Then
      DtaFim.Text := Qry.FieldByName('Data').AsString;

   fCotaFim       := Qry.FieldByName('COTA').AsFloat;

   Qry.First;

   fCotaIni       := Qry.FieldByName('COTA').AsFloat;

   fValorizacao   := (OperComum.DivValorZero(fCotaFim,fCotaIni)-1)*100;

   pnlValorizacao.Caption := FormatFloat('###,###,###0.0000',fValorizacao)+' % ';
   pnlEQM.Caption         := FormatFloat('###,###,###0.0000',fEQM)+' % ';

   VariacaoIndicadores;

   Qry.EnableControls;
end;

procedure TfrmConsHistCota.VariacaoIndicadores;
Var
   wFatorCDI : Double;
   dDataIni, dDataAnt, dDataFim : TDateTime;
   sIndicador: String;
   iPos: Word;
   bAchou: Boolean;
begin

   wFatorCDI := 1;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT ');
   qryAux.SQL.Add(QuotedStr(DtaInicio.Text) + ' AS DATAINICIO, ');
   qryAux.SQL.Add(QuotedStr(DtaFim.Text) + ' AS DATAFINAL, ');
   qryAux.SQL.Add(TrocaVirgulaPonto(spePercentual.Text) + ' AS PERCENTUAL, ');
   qryAux.SQL.Add(TrocaVirgulaPonto(edtJuros.Text) + ' AS TAXA, ');
   qryAux.SQL.Add('-1 AS IDCIDADES, ');
   qryAux.SQL.Add(' 1 AS IDPAIS, ');
   qryAux.SQL.Add(''' '' AS CODESTADO');
   qryAux.SQL.Add('FROM DUAL');
   qryAux.Open;

   sIndicador := dblkRegra.Text;
   iPos       := Pos('INV - ',sIndicador);
   if iPos > 0 then
      Delete(sIndicador, iPos, 6);

   sIndicador := ' ' + sIndicador;

   // Chama regra de cálculo da Variação do Indicador
   if Trim(dblkRegra.Text) <> '' then
   begin
      regRentabilidade.RuleName := qryRegraIDREGRA.AsString;
      regRentabilidade.QueryIn  := qryAux;
      try
         if chkPassoaPasso.Checked then
            regRentabilidade.PassoaPasso
         else
            regRentabilidade.Execute;
      except
         on E:Exception do
         begin
            MsgDlg('Ocorreu um problema ao calcular a Variação do : ' + #13 +
                  '  ' + sIndicador + #13 +
                  'Regra: ' + #13 +
                  '  ' + qryRegraNOMEREGRA.AsString +
                  'Com a Mensagem:' + #13 +
                  '  ' + E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
            Exit;
         end;
      end;
      wFatorCDI := StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));
   end;

   // Chama regra de cálculo do Juros
   if Trim(dblRegraJur.Text) <> '' then
   begin
      regRentabilidade.RuleName := qryRegraJurIDREGRA.AsString;
      regRentabilidade.QueryIn  := qryAux;
      try
         if chkPassoaPasso.Checked then
            regRentabilidade.PassoaPasso
         else
            regRentabilidade.Execute;
      except
         on E:Exception do
         begin
            MsgDlg('Ocorreu um problema ao calcular a Variação do : ' + #13 +
                  '  ' + sIndicador + #13 +
                  'Regra : ' + #13 +
                  '  ' + qryRegraNOMEREGRA.AsString +
                  'Com a Mensagem:' + #13 +
                  '  ' + E.Message, 'Mensagem do Sistema', mtWarning,[MbOk],0);
            Exit;
         end;
      end;
      wFatorCDI := wFatorCDI * StrToFloat(TrocaPontoVirgula(regRentabilidade.Result));
   end;

   wFatorCDI  := ((wFatorCDI -1) * 100);

   pnlNomeInd.Caption   := sIndicador;

   pnlIndicador.Caption := FormatFloat('#0.0000', wFatorCDI)+' % ';

   if (wFatorCDI = 0) or (wFatorCDI = 1) then
      pnlPerSInd.Caption := FormatFloat('#,##0.0000', 0)+' % '
   else begin
      if ((wFatorCDI * fValorizacao) > 0) then
         pnlPerSInd.Caption := FormatFloat('#,##0.0000', (fValorizacao / wFatorCDI) * 100) + ' % '
      else if wFatorCDI < 0 then
         pnlPerSInd.Caption := FormatFloat('#,##0.0000', ((fValorizacao / Abs(wFatorCDI)) * 100) + 100) + ' % '
      else
         pnlPerSInd.Caption := FormatFloat('#,##0.0000', ((Abs(fValorizacao) / wFatorCDI) * 100) - 100) + ' % '
   end;

end;

procedure TfrmConsHistCota.bt_ImprimeClick(Sender: TObject);
begin
  inherited;
   with DmRelHistCota do
   begin
      lblPlan.Caption          := 'Todos os Planos/Patrocinadoras';
      if Trim(dblPlanoPatr.Text) <> '' then
         lblPlan.Caption       := dblPlanoPatr.Text;

      lblCartGerenc.Caption := dblCarteira.Text;

      ppLData.Caption          := DtaInicio.Text+' até '+DtaFim.Text;

      lblValorizacao.Caption   := pnlValorizacao.Caption;

      lblIndicador.Caption     := pnlNomeInd.Caption;

      lblPerIndicador.Caption  := pnlIndicador.Caption;

      lblPerSind.Caption       := pnlPerSInd.Caption;

      lblEqmCab.Caption        := pnlEqmCab.Caption;

      lblEQM.Caption           := pnlEQM.Caption;

      Qry.DisableControls;
      QryHistCota.DisableControls;
      DsHistoricoCota.DataSet   := frmConsHistCota.Qry;
      TfrmPreview.CreateModalPreview(Application,
                                     RptHistoricoCota,
                                     RptHistoricoCota.PrinterSetup.DocumentName);
      QryHistCota.EnableControls;
      Qry.EnableControls;
   end;
   //Al_1
end;

procedure TfrmConsHistCota.bbtnConfirmarClick(Sender: TObject);
//AL_4
Var
   sMens: String;
begin
   sMens := '';
   If (DtaFim.Text <> '') and
      (Not RendaVariavel.PermiteUtilizarCarteiraGerenc(DtaFim.date,sMens)) then
   begin
      MsgDlg(sMens,'Mensagem do Sistema', mtWarning, [mbOk],0);
      OperComum.LimpaParametros(Qry);
      DtaFim.Clear;
      dblCarteira.Clear;
      dblPlanoPatr.Clear;
      dblkRegra.Clear;
      dblRegraJur.Clear;
      DtaFim.SetFocus;
      Exit;
   end
   else
   begin
      If DtaInicio.Text = '' Then
      Begin
         //AL_3
         MsgDlg('Selecione a data início.','Mensagem do Sistema', mtWarning,[MbOk],0);
         DtaInicio.SetFocus;
         Exit;
      End;

      If DtaFim.Text = '' Then
      Begin
         //AL_3
         MsgDlg('Selecione a data fim.','Mensagem do Sistema', mtWarning,[MbOk],0);
         DtaFim.SetFocus;
         Exit;
      End;

      If DtaFim.Date < DtaInicio.Date Then
      begin
         //AL_3
         MsgDlg('A data fim não pode ser menor que a data início.','Mensagem do Sistema', mtWarning,[MbOk],0);
         if DtaInicio.CanFocus then
            DtaInicio.SetFocus;
         exit;
      end;

      if Trim(dblCarteira.Text) = '' then
      begin
         //AL_3
         MsgDlg('Selecione a carteira gerencial.','Mensagem do Sistema', mtWarning,[MbOk],0);
         if dblCarteira.CanFocus then
            dblCarteira.SetFocus;
         exit;
      end;

      if spePercentual.Value <= 0 then
      begin
         //AL_3
         MsgDlg('O percentual não pode ser igual ou menor que zero.','Mensagem do Sistema', mtWarning,[MbOk],0);
         if spePercentual.CanFocus then
            spePercentual.SetFocus;
         exit;
      end;

      if spePercentual.Value > 100 then
      begin
         //AL_3
         MsgDlg('O percentual não pode maior que 100%.','Mensagem do Sistema', mtWarning,[MbOk],0);
         if spePercentual.CanFocus then
            spePercentual.SetFocus;
         exit;
      end;

      if edtJuros.Value < 0 then
      begin
         //AL_3
         MsgDlg('A Taxa de Juros não pode ser menor que zero.','Mensagem do Sistema', mtWarning,[MbOk],0);
         if edtJuros.CanFocus then
            edtJuros.SetFocus;
         exit;
      end;

     inherited;

     PreencheGrid;
  end;
end;

//Al_1
procedure TfrmConsHistCota.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

procedure TfrmConsHistCota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Qry.Close;
  QryCarteira.Close;
  QryPatroPlanPrevContab.Close;
  QryHistCota.Close;
  qryRegra.Close;
  qryRegraJur.Close;
end;

//AL_4
procedure TfrmConsHistCota.DtaFimExit(Sender: TObject);
Var
   sMens: String;
begin
   inherited;
   sMens := '';
   If (DtaFim.Text <> '') and
      (Not RendaVariavel.PermiteUtilizarCarteiraGerenc(DtaFim.date,sMens)) then
   begin
      MsgDlg(sMens,'Mensagem do Sistema', mtWarning, [mbOk],0);
      OperComum.LimpaParametros(Qry);
      DtaFim.Clear;
      dblCarteira.Clear;
      dblPlanoPatr.Clear;
      dblkRegra.Clear;
      dblRegraJur.Clear;
      DtaFim.SetFocus;
      Exit;
   end;
end;

end.
