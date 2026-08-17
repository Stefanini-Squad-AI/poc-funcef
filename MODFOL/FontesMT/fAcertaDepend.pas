// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fAcertaDepend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  Db, DBTables, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97,
  TB97Tlbr, ExtCtrls, wwdblook, Spin, TEdNum, wwdbdatetimepicker, ComCtrls, DBClient,
  CMDateTimePicker, uCmSqlParams, uCMClientDataSet, uCtrlAcertaDependente,
  CmParamReport, Usistema;

type
  TfrmAcertaDepend = class(TfrmSelPessoalMT)
    gbxDataBase: TGroupBox;
    dtBaseSalFam: TCMDateTimePicker;
    lblMsg: TLabel;
    pgbrPrincipal: TProgressBar;
    memResult: TMemo;
    bbtnSalvar: TBitBtn;
    SaveDlg: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSalvarClick(Sender: TObject);
  private
    CtrlAcertaDependente: TCtrlAcertaDependente;

    procedure Progresso(Args: array of variant);    
  end;

var
  frmAcertaDepend: TfrmAcertaDepend;

implementation

{$R *.DFM}

uses uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

procedure TfrmAcertaDepend.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAcertaDependente := TCtrlAcertaDependente.Create;
  CtrlAcertaDependente.InitializeAs(Padroes);
  CtrlAcertaDependente.Progresso := Progresso;

  dtBaseSalFam.Date := Date;
  cbxTemporarios.Checked := true;
  cbxEstagiarios.Checked := true;
  cbxTerceiros.Checked := true;
  cbxPropDirSemVinc.Checked := true;
  cbxAutonomos.Checked := true;
  cbxAfastados.Checked := true;

  IrPaginaResult := false;

  lblMsg.Caption := '';
  pgbrPrincipal.Visible := false;

  SaveDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

procedure TfrmAcertaDepend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlAcertaDependente);
  inherited;
end;

procedure TfrmAcertaDepend.bbtnSalvarClick(Sender: TObject);
begin
  if (SaveDlg.Execute) then
    memResult.Lines.SaveToFile(SaveDlg.FileName);
end;

procedure TfrmAcertaDepend.bbtnConfirmarClick(Sender: TObject);
var
  ListaIdPessoa: string;
begin
  if (MsgDlg('Você está prestes a executar um procedimento que vai alterar as' +CR_LF+
             'quantidades de dependentes dos empregados (pasta Dados Pessoais),' +CR_LF+
             'baseado no Cadastro de Dependentes.'+CR_LF+'Confirma a execução?',
             'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes) and
     (MsgDlg('Esta é uma segunda chance para se arrepender.' +CR_LF+
             'Confirma mesmo a execução?',
             'Confirmação', mtConfirmation, [mbYes,mbNo,mbHelp], 0) = mrYes) then
  begin
    memResult.Lines.Clear;
    pgctrlPrincipal.ActivePageIndex := 0;
    lblMsg.Caption := 'Verificando e ajustando a quantidade de dependentes...';
    lblMsg.Update;
    pgbrPrincipal.Position := 0;
    pgbrPrincipal.Visible := true;
    inherited;
    lblMsg.Update;

    if (CdsPrincipal.Active) then
    begin
      if (CdsPrincipal.IsEmpty) then
        MsgDlg('Nenhuma Pessoa foi selecionada.', 'Aviso', mtInformation, [mbOk,mbHelp], 0)
      else
      begin
        pgbrPrincipal.Min := 0;
        pgbrPrincipal.Max := CdsPrincipal.RecordCount;

        // Criar a lista com o IdPessoa de Cada Pessoa selecionada
        ListaIdPessoa := '';
        CdsPrincipal.First;
        while not(CdsPrincipal.EOF) do
        begin
          if (ListaIdPessoa = '') then
            ListaIdPessoa := CdsPrincipal.FieldByName('IDPESSOA').asString
          else
            ListaIdPessoa := ListaIdPessoa +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;
          CdsPrincipal.Next;
        end;
        CdsPrincipal.First;

        // Executar o Processamento
        CtrlAcertaDependente.CreateThreadProgresso;
        if (CtrlAcertaDependente.Processar(ListaIdPessoa, dtBaseSalFam.Date)) then
        begin
          CtrlAcertaDependente.FreeThreadProgresso;
          MsgDlg(CtrlAcertaDependente.MessageInfo, 'Aviso', mtWarning, [mbOk,mbHelp], 0);
        end
        else
        begin
          CtrlAcertaDependente.FreeThreadProgresso;
          MsgDlg(CtrlAcertaDependente.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
        end;

        ExecutarIrPaginaResult;
      end;
    end;
    lblMsg.Caption := '';
    pgbrPrincipal.Visible := false;
  end;
end;

procedure TfrmAcertaDepend.Progresso(Args: array of variant);
begin
  if (Args[0] <> '') then
    memResult.Lines.Add(Args[0]);

  pgbrPrincipal.StepIt;

  Self.Repaint;
end;

end.
