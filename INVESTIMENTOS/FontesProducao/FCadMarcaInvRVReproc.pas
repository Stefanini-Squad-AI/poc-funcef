//******************************************************************************
// Autor    : Marco Turon
// Data	    : 12/05/2004
// Função   : Marcar Investimentos a serem Reprocessados
// Motivo(S): Criação do Form
//******************************************************************************
unit FCadMarcaInvRVReproc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, wwdbdatetimepicker,
  wwdblook;

type
  TfrmCadMarcaInvRVReproc = class(TfrmCadastroCSInv)
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    dblInvestimento: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    dblCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    dtpData: TwwDBDateTimePicker;
    Label3: TLabel;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    dsCarteira: TDataSource;
    qryVerInvMarcado: TwwQuery;
    chkMarca: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure chkMarcaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure StatusNormal;
  public
    { Public declarations }
  end;

var
  frmCadMarcaInvRVReproc: TfrmCadMarcaInvRVReproc;

implementation

uses dBaseDados, UMensErro, USistema, UDataBase, URendaVariavel,
     dRendaVariavel, UOperComum, FAutorizaParametros, FTelaAut;

{$R *.DFM}

{ TfrmCadMarcaInvRVReproc }

procedure TfrmCadMarcaInvRVReproc.StatusNormal;
begin
   pnlFundo.Enabled := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
end;

procedure TfrmCadMarcaInvRVReproc.FormShow(Sender: TObject);
begin
   inherited;
   qryInvestimento.Open;
   qryCarteira.Open;

   StatusNormal;

end;

procedure TfrmCadMarcaInvRVReproc.bbtnConfirmarClick(Sender: TObject);
begin
   // inherited;

   try
      // Verifica Dados Informados
      if Trim(dblInvestimento.Text) = '' then
      begin
         MsgDlg('Falta Selecionar o Investimento',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         if dblInvestimento.CanFocus then
            dblInvestimento.SetFocus;
         Exit;
      end;

      if Trim(dblCarteira.Text) = '' then
      begin
         MsgDlg('Falta Selecionar a Carteira Própria',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         if dblCarteira.CanFocus then
            dblCarteira.SetFocus;
         Exit;
      end;

      if Trim(dtpData.Text) = '' then
      begin
         if chkMarca.Checked then
         begin
            MsgDlg('Falta Selecionar Data a partir da qual o Investimento será Reprocessado',
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
            if dtpData.CanFocus then
               dtpData.SetFocus;
            Exit;
         end;
      end;

      // Verificar se o investimento já está marcado
      OperComum.LimpaParametros(qryVerInvMarcado);
      qryVerInvMarcado.ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimentoIDINVESTIMENTO.AsInteger;
      qryVerInvMarcado.ParamByName('IDCARTEIRAINVEST').AsInteger := qryCarteiraIDCARTEIRAINVEST.AsInteger;
      qryVerInvMarcado.Open;
      if not qryVerInvMarcado.IsEmpty then
      begin
         if chkMarca.Checked then
         begin
            if MsgDlg('Este Investimento já está Marcado para Reprocessamento' + #13 +
                      'A partir do Dia: ' + qryVerInvMarcado.FieldByName('DATAMOVCARTINV').AsString + #13 +
                      'Marca Também para o dia ' + dtpData.Text,
                      'Mensagem do Sistema ',mtWarning,[mbYes, mbNo],0) = mrNo then
            begin
               if dblInvestimento.CanFocus then
                  dblInvestimento.SetFocus;
               Exit;
            end;
         end;
      end
      else if not chkMarca.Checked then
      begin
         MsgDlg('O Investimento Não está Marcado para Reprocessamento',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         if dblInvestimento.CanFocus then
            dblInvestimento.SetFocus;
         Exit;
      end;

      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;


      if chkMarca.Checked then
      begin
         // Marcar o Investimento
         if not RendaVariavel.MarcarFlagReproc(qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger,
                                               qryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               -1 {IDPLANPREVCTBPATR},
                                               dtpData.DateTime) then
            Raise Exception.Create('Não Foi Possível Marcar o Investimento para Reprocessamento.');

         if DMRendaVariavel.qryMarcaFlagReprocMenor.RowsAffected > 0 then
            MsgDlg('Investimento Marcado para Reprocessamento.',
                   'Mensagem do Sistema ',mtInformation,[mbOK],0)
         //Al_Ri - Ricardo - 06/12/2004
         else if DMRendaVariavel.qryMarcaFlagReprocIgual.RowsAffected > 0 then
            MsgDlg('Investimento Marcado para Reprocessamento.',
                   'Mensagem do Sistema ',mtInformation,[mbOK],0)
         //Al_ri - Fim
         else
            MsgDlg('O Investimento não pode ser Marcado para Reprocessamento.',
                   'Mensagem do Sistema ',mtInformation,[mbOK],0);
      end
      else
      begin
         with DMRendaVariavel, DMRendaVariavel.qryDesmarcaFlgReproc do
         begin
            OperComum.LimpaParametros(qryDesmarcaFlgReproc, True);
            ParamByName('IDINVESTIMENTO').AsInteger := qryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
            ParamByName('IDCARTEIRAINVEST').AsInteger := qryCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
            if Trim(dtpData.Text) <> '' then
               ParamByName('DATAMOVCARTINV').AsString := dtpData.Text;
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
      if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;

      dblInvestimento.Clear;
      dblCarteira.Clear;
      dtpData.Clear;
      dtpData.ClearDateTime;

      if dblInvestimento.CanFocus then
         dblInvestimento.SetFocus;

   except
      on E: Exception do
      begin
         if dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;

         MsgDlg('Ocorreu um Problema ao Marcar o Investimento para Reprocessamento.'+#13+E.Message,
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
      end;

   end;

end;

procedure TfrmCadMarcaInvRVReproc.chkMarcaClick(Sender: TObject);
begin
   inherited;
   if chkMarca.Checked then
      chkMarca.Caption := 'Marca o Investimento'
   else
      chkMarca.Caption := 'Desmarca o Investimento';
end;

procedure TfrmCadMarcaInvRVReproc.FormCreate(Sender: TObject);
begin
  inherited;
  if Pos('.CM',Sistema.NomeUsuario) = 0 then
  begin
     if not (AbrirFormModal(frmAutorizaParametros,TfrmAutorizaParametros) = mrOk) then
        Close;
  end;
end;

end.


{
      MsgDlg('Ocorreu problema ao excluir o Histórico.' + #13 + E.Message + ' ' + #13 +
             'Último Ação: ' + sAcao,
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
}