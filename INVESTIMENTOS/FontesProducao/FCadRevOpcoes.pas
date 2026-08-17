unit FCadRevOpcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmCadRevOpcoes = class(TfrmCadastroCSInv)
    pnlPrincipal: TPanel;
    lblInvestimento: TLabel;
    lblEmissor: TLabel;
    lblCarteira: TLabel;
    Label2: TLabel;
    lblBolsa: TLabel;
    dblkInvestimento: TwwDBLookupCombo;
    dblkEmissor: TwwDBLookupCombo;
    dblkCarteira: TwwDBLookupCombo;
    dblkBolsa: TwwDBLookupCombo;
    dbeDataRef: TCMDateTimePicker;
    pnlQtd: TPanel;
    Label5: TLabel;
    dbrQtdeOperacao: TDBRealEdit;
    qryBolsa: TwwQuery;
    qryBolsaSGLBOLSAVALORES: TStringField;
    qryBolsaIDBOLSAVALORES: TFloatField;
    qryEmissor: TwwQuery;
    qryEmissorSIGLAEMISSOR: TStringField;
    qryEmissorIDEMISSOR: TFloatField;
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryAux: TwwQuery;
    procedure dblkCarteiraExit(Sender: TObject);
    procedure dblkEmissorExit(Sender: TObject);
    procedure dblkBolsaExit(Sender: TObject);
    procedure dblkInvestimentoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaInvest;
    function HabilitaQtd:boolean;
    function VerificaCampos:boolean;
  public
    { Public declarations }
  end;

var
  frmCadRevOpcoes: TfrmCadRevOpcoes;
  fQtdOper : Double;

implementation

uses UBibliotecaInvest, UOperComum, dOpcoes, UOpcoes, UMensErro,
     dBaseDados;

{$R *.DFM}

procedure TfrmCadRevOpcoes.dblkCarteiraExit(Sender: TObject);
begin
  inherited;
   HabilitaQtd;
end;

procedure TfrmCadRevOpcoes.dblkEmissorExit(Sender: TObject);
begin
  inherited;
   AtualizaInvest;
   HabilitaQtd;
end;

procedure TfrmCadRevOpcoes.dblkBolsaExit(Sender: TObject);
begin
  inherited;
   AtualizaInvest;
   HabilitaQtd;
end;

procedure TfrmCadRevOpcoes.dblkInvestimentoExit(Sender: TObject);
begin
  inherited;
   HabilitaQtd;
end;

procedure TfrmCadRevOpcoes.FormShow(Sender: TObject);
begin
   inherited;
   dbeDataRef.Date := pRPI.DATAULTFECH;
   qryBolsa.Open;
   qryEmissor.Open;
   qryInvestimento.Open;
   qryCarteira.Open;
   HabilitaQtd;
   MontaSelect.Filtro.Add('HISTCARTINV.IDHISTCARTINV  IN (SELECT MAX(H2.IDHISTCARTINV) '+
                          'FROM HISTCARTINV H2, INVESTIMENTO I2               '+
                          'WHERE                                              '+
                          '  (H2.IDINVESTIMENTO = I2.IDINVESTIMENTO) AND      '+
                          '  (I2.STAOPCAO = ''Y'') AND                          '+
                          '  (H2.IDTIPOINVEST = 2) AND                        '+
                          '  ((H2.DATAMOVCARTINV || H2.IDINVESTIMENTO) IN (SELECT (MAX(H3.DATAMOVCARTINV) || H3.IDINVESTIMENTO)                    '+
                          '                                                FROM HISTCARTINV H3, INVESTIMENTO I3                                    '+
                          '                                                WHERE                                                                   '+
                          '                                                   (H3.IDINVESTIMENTO = I3.IDINVESTIMENTO) AND                          '+
                          '                                                   (I3.STAOPCAO = ''Y'') AND                                            '+
                          '                                                   (H3.IDTIPOINVEST = 2)         AND                                    '+
                          '                                                   (H3.DATAMOVCARTINV <= PARAMINVEST.DATAULTFECH)                       '+
                          '                                                GROUP BY H3.IDINVESTIMENTO,H3.IDPLANPREVCTBPATR,H3.IDCARTEIRAINVEST ))  '+
                          'GROUP BY H2.IDINVESTIMENTO,H2.IDPLANPREVCTBPATR,H2.IDCARTEIRAINVEST)');
end;

procedure TfrmCadRevOpcoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryBolsa.Close;
   qryEmissor.Close;
   qryInvestimento.Close;
   qryCarteira.Close;
end;

procedure TfrmCadRevOpcoes.AtualizaInvest;
begin
   OperComum.LimpaParametros(qryInvestimento);
   if Trim(dblkEmissor.Text) <> '' then
      qryInvestimento.ParamByName('IDEMISSOR').AsInteger := qryEmissorIDEMISSOR.AsInteger;
   if Trim(dblkBolsa.Text) <> '' then
      qryInvestimento.ParamByName('IDBOLSAVALORES').AsInteger := qryBolsaIDBOLSAVALORES.AsInteger;
   qryInvestimento.Open;
end;

function TfrmCadRevOpcoes.HabilitaQtd:boolean;
begin
   if (Trim(dblkCarteira.Text) <> '') and
      (Trim(dblkEmissor.Text) <> '') and
      (Trim(dblkBolsa.Text) <> '') and
      (Trim(dblkInvestimento.Text) <> '') then
   begin
      Opcoes.BuscaSaldosOpcoes(dbeDataRef.Date,
                        qryInvestimentoIDINVESTIMENTO.AsInteger,
                        qryCarteiraIDCARTEIRAINVEST.AsInteger,
                        iPlanPrevCtbPatro,'');
      dbrQtdeOperacao.Value := DMOpcoes.qryBuscaSaldosOpcoes.FieldByName('SALDOQTDEINVCART').AsFloat;
      pnlQtd.Enabled := True;
      if dbrQtdeOperacao.CanFocus then
         dbrQtdeOperacao.SetFocus;
      Result := True;
   end
   else
   begin
      pnlQtd.Enabled := False;
      Result := False;
   end;
end;

function TfrmCadRevOpcoes.VerificaCampos:boolean;
begin
   Result := True;
   if dbeDataRef.Text = '' then
   begin
      MsgDlg('Data da Reversão não informada.', 'Warning', mtWarning, [mbOk], 0);
      if dbeDataRef.CanFocus then
         dbeDataRef.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dblkCarteira.Text) = '' then
   begin
      MsgDlg('Carteira não informada.', 'Warning', mtWarning, [mbOk], 0);
      if dblkCarteira.CanFocus then
         dblkCarteira.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dblkEmissor.Text) = '' then
   begin
      MsgDlg('Emissor não informado.', 'Warning', mtWarning, [mbOk], 0);
      if dblkEmissor.CanFocus then
         dblkEmissor.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dblkBolsa.Text) = '' then
   begin
      MsgDlg('Bolsa não informada.', 'Warning', mtWarning, [mbOk], 0);
      if dblkBolsa.CanFocus then
         dblkBolsa.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dblkInvestimento.Text) = '' then
   begin
      MsgDlg('Opção não informada.', 'Warning', mtWarning, [mbOk], 0);
      if dblkInvestimento.CanFocus then
         dblkInvestimento.SetFocus;
      Result := False;
      Exit;
   end
   else if Trim(dbrQtdeOperacao.Text) = '' then
      fQtdOper := 0
   else
      fQtdOper := StrToFloat(FormatFloat('#0',dbrQtdeOperacao.Value));
end;

procedure TfrmCadRevOpcoes.bbtnConfirmarClick(Sender: TObject);
var
   iEmissor,iInvestimento,iCarteira : Integer;
begin
   iInvestimento := -1;
   iEmissor      := -1;
   iCarteira     := -1;
  inherited;
   if (VerificaCampos) and (HabilitaQtd) then
   begin
      if Trim(dblkEmissor.Text) <> '' then
         iEmissor := qryEmissorIDEMISSOR.AsInteger;
      if Trim(dblkInvestimento.Text) <> '' then
         iInvestimento := qryInvestimentoIDINVESTIMENTO.AsInteger;
      if Trim(dblkCarteira.Text) <> '' then
         iCarteira := qryCarteiraIDCARTEIRAINVEST.AsInteger;

      if fQtdOper <> 0 then
      begin
         Try
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;

            if not Opcoes.GeraReversaoOpcoes(dbeDataRef.Date,iInvestimento,iEmissor,
                                             iCarteira,iPlanPrevCtbPatro,
                                             fQtdOper,True,'') then
               Exit;

            DtmBaseDados.dbBaseDados.Commit;

            MsgDlg('Processo concluído com sucesso.',
                   'Mensagem do Sistema', mtInformation,[MbOk],0);

         except
            on E:Exception do
            begin
               DtmBaseDados.dbBaseDados.Rollback;
               MsgDlg('Ocorreu problema no processamento.'+
                      #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
            end;
         end;
      end;
   end;
end;

procedure TfrmCadRevOpcoes.sbtnProcurarClick(Sender: TObject);
var a : string;
begin
  inherited;
   if MontaSelect.RetornouValor then
   begin
      dblkCarteira.LookupValue := MontaSelect.ValoresChave[2];
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DESCCARTINVEST FROM CARTEIRAINVEST WHERE IDCARTEIRAINVEST = ' + MontaSelect.ValoresChave[2]);
      qryAux.Open;
      dblkCarteira.Text := qryAux.FieldByName('DESCCARTINVEST').AsString;
      qryCarteira.Locate('IDCARTEIRAINVEST',MontaSelect.ValoresChave[2],[]);

      dblkEmissor.LookupValue := MontaSelect.ValoresChave[6];
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT SIGLAEMISSOR FROM EMISSOR WHERE IDEMISSOR = ' + MontaSelect.ValoresChave[6]);
      qryAux.Open;
      dblkEmissor.Text := qryAux.FieldByName('SIGLAEMISSOR').AsString;
      qryEmissor.Locate('IDEMISSOR',MontaSelect.ValoresChave[6],[]);

      dblkInvestimento.LookupValue := MontaSelect.ValoresChave[1];
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT DESCINVESTIMENTO FROM INVESTIMENTO WHERE IDINVESTIMENTO = ' + MontaSelect.ValoresChave[1]);
      qryAux.Open;
      dblkInvestimento.Text := qryAux.FieldByName('DESCINVESTIMENTO').AsString;
      qryInvestimento.Locate('IDINVESTIMENTO',MontaSelect.ValoresChave[1],[]);

      dblkBolsa.LookupValue := MontaSelect.ValoresChave[9];
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add('SELECT SGLBOLSAVALORES FROM BOLSAVALORES WHERE IDBOLSAVALORES = ' + MontaSelect.ValoresChave[9]);
      qryAux.Open;
      dblkBolsa.Text := qryAux.FieldByName('SGLBOLSAVALORES').AsString;
      qryBolsa.Locate('IDBOLSAVALORES',MontaSelect.ValoresChave[9],[]);

      dbeDataRef.Date := pRPI.DATAULTFECH;
      dbrQtdeOperacao.Text := MontaSelect.ValoresChave[3];

      pnlFundo.Enabled := True;
   end;
end;

procedure TfrmCadRevOpcoes.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
   pnlFundo.Enabled := True;
end;

end.
