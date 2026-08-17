// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
//Data     : 16/06/2008
//Pendencia: 26902
//Descrição: Após transf, se horver diferenças de autorizações, emite um txt no C:/,
//           e emite o relatório de diferenças de autorizações.
//==============================================================================
//Data     : 31/01/2007
//Pendencia: 24363
//Descrição: Removido o owner CM. Componente CMDataTransf.PrefixoServidor
//==============================================================================
//Data     : 28/01/2008
//Pendencia: 26902
//Descrição: Se houver diferenças na importação do transf, será mostrado o relatório comparativo de Autorizações.
//==============================================================================
unit fLeArqReports;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, StdCtrls, MontaSelect, Grids, Wwdbigrd, Wwdbgrid,
  Db, Wwdatsrc, DBTables, CMwwQuery, DBCtrls, uString, uSistema, ppComm,
  ppProd, ppClass, ppReport, ppBands, ppCache, Buttons, fOkCancelar,
  MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, DBGrids, ZipMstr, Wwtable, IvDictio,
  IvMulti, IvEMulti, ComCtrls, fcStatusBar, CMDataTransf, Menus, UMensErro,
  wwQuery, fParamReports_Padrao, AppEvnts, CMApplicationEvents, rAutorizacao;

type
  TfrmLeArqReports = class(TfrmOkCancelar)
    lbl2: TLabel;
    spd2: TSpeedButton;
    DlgOpen: TOpenDialog;
    GroupBox1: TGroupBox;
    chkddTable: TCheckBox;
    chkddField: TCheckBox;
    chkDataView: TCheckBox;
    chkReports: TCheckBox;
    chkGrupoRelatorio: TCheckBox;
    GroupBox2: TGroupBox;
    edNomeArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    CkbConsultasGerais: TCheckBox;
    CkbAutoriza: TCheckBox;
    SbTransf: TfcStatusBar;
    Pbtransf: TProgressBar;
    CMDataTransf: TCMDataTransf;
    MemErroImport: TMemo;
    Label1: TLabel;
    PpmErro: TPopupMenu;
    Limparlog1: TMenuItem;
    SalvarLog1: TMenuItem;
    DlgSave: TSaveDialog;
    procedure SpeedButton1Click(Sender: TObject);
    procedure CMDataTransfRequestLoginDBA(Sender: TObject; var LoginName,
      Password: String; var Continue: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CMDataTransfTransfProgress(const Msg: String;
      Operation: TTransfOperation; StepNum, TotalSteps: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CMDataTransfErrorMessage(Sender: TObject; sMessage: String);
    procedure SalvarLog1Click(Sender: TObject);
    procedure Limparlog1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    iIdBack : integer;
    function VerificaDiferencas : integer;
    function EncontrouNaOPERFUNC(iIdOperFunc: integer): boolean;
    procedure GeraAutorizacoesPerdidas(iIdOperfunc, iIdEspacesso, iIdBackCtrl : integer);
    procedure GeraTXTAutorizacoes;
  public
    { Public declarations }
    ArqAutorizaPerdida   : TextFile;
    ListaAutorizaPerdida : TStringList;
  end;

var
  frmLeArqReports: TfrmLeArqReports;

implementation

uses fLogin;

{$R *.DFM}

procedure TfrmLeArqReports.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  with DlgOpen do
       if Execute then
          edNomeArquivo.text := FileName;
end;

procedure TfrmLeArqReports.CMDataTransfRequestLoginDBA(Sender: TObject;
  var LoginName, Password: String; var Continue: Boolean);
var
  frmlogin: TfrmLogin;
begin
  Continue := False;
  inherited;
  Try
    Application.CreateForm(TfrmLogin,frmLogin);
    frmLogin.Caption := Translate('Login Para Autorização');
    frmLogin.Label1.Caption := Translate('Usuário do Banco de Dados');
    frmLogin.Label2.Caption := Translate('Senha de Acesso');

    If (frmLogin.ShowModal = MrOk) Then
    Begin
      LoginName := frmLogin.edUsuario.Text;
      Password := frmLogin.edSenha.Text;
      Continue := True;
    End;
  finally
    frmLogin.Free;
    Repaint;
    Application.ProcessMessages;
  End;
end;

procedure TfrmLeArqReports.bbtnConfirmarClick(Sender: TObject);
var
  sparam : string;
  PrintReport : Boolean;
begin
  inherited;

  sparam := '';
  PrintReport := False;
  If edNomeArquivo.text <> '' Then
     Try
        Sistema.GravaLogOperacoes(Translate('Processamento do TransfRelatorios'));

        MemErroImport.Lines.Append(Translate('- Início do Processamento: ') + DateTimeToStr(Now));

        bbtnConfirmar.Enabled := False;
        bbtnCancelar.Enabled := False;
        bbtnSair.Enabled := False;
        bbtnAjuda.Enabled := False;

        // Busca o owner do banco
        if Sistema.UsuarioUnico Then
           CMDataTransf.PrefixoServidor := Sistema.Owner + '.';

        CMDataTransf.FileTransfs := [];

        if chkReports.Checked Then
        Begin
           Sistema.GravaLogOperacoes(Translate('Importação da tabela REPORTS'));
           CMDataTransf.FileTransfs := CMDataTransf.FileTransfs + [ftReports];
        End;

        if chkDataView.Checked Then
        Begin
           Sistema.GravaLogOperacoes(Translate('Importação da tabela DATAVIEW'));
           CMDataTransf.FileTransfs := CMDataTransf.FileTransfs + [ftDataView];
        End;

        if chkGrupoRelatorio.Checked Then
        Begin
           Sistema.GravaLogOperacoes(Translate('Importação da tabela GRUPORELATORIO'));
           CMDataTransf.FileTransfs := CMDataTransf.FileTransfs + [ftGrupoRelatorio];
        End;


        if CkbConsultasGerais.Checked Then
        Begin
           Sistema.GravaLogOperacoes(Translate('Importação da tabela CONSULTASGERAIS'));
           CMDataTransf.FileTransfs := CMDataTransf.FileTransfs + [ftConsultas];
        End;

        if chkddTable.Checked Then
        Begin
           Sistema.GravaLogOperacoes(Translate('Importação da tabela DDTABLE'));
           CMDataTransf.FileTransfs := CMDataTransf.FileTransfs + [ftDDTable];
        End;

        if chkddField.Checked Then
        Begin
           Sistema.GravaLogOperacoes(Translate('Importação da tabela DDFIELD'));
           CMDataTransf.FileTransfs := CMDataTransf.FileTransfs + [ftDDField];
        End;

        if CkbAutoriza.Checked Then
        Begin
           Sistema.GravaLogOperacoes(Translate('Importação da tabela AUTORIZACAO'));
           CMDataTransf.FileTransfs := CMDataTransf.FileTransfs + [ftAutorizacoes];
        End;

        //Hugo Luna - Pendência 26902 - Inicio
        If CMDataTransf.ImportFile(edNomeArquivo.text) Then
        Begin
           if VerificaDiferencas >= 1 then
             begin
               GeraTXTAutorizacoes;
               Sistema.GravaLogOperacoes(Translate('Processamento do TransfRelatorios Encerrado com Diferenças'));
               MemErroImport.Lines.Append(Translate('- Término do Processamento: ') + DateTimeToStr(Now));
               ShowMessage(Translate('Dados Importados Com Sucesso.'));
               if (MsgDlg('Houveram Diferenças !!! Deseja imprimir o relatório comparativo?', 'Informação', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
                 begin
                   with TrptParamAutoriza.Create(self) do
                   begin
                     CmpRptCM.ParamValues[0].Value := '';
                     CmpRptCM.ParamValues[1].Value := iIdBack;
                     CrmRptCM.LabelEmpresa.Caption := Sistema.NomeEmpresa;
                     CrmRptCMBeforePrint(Sender);
                     rpCompara.PreviewFormSettings.WindowState:= wsMaximized;
                     rpCompara.Print;
                   end;
                 end;
             end
           else
             begin
               Sistema.GravaLogOperacoes(Translate('Processamento do TransfRelatorios Encerrado com Sucesso'));
               MemErroImport.Lines.Append(Translate('- Término do Processamento: ') + DateTimeToStr(Now));
               ShowMessage(Translate('Dados Importados Com Sucesso.'));
             end;
        //Hugo Luna - Pendência 26902 - Fim
        End
        Else
        Begin
           Sistema.GravaLogOperacoes(Translate('Processamento do TransfRelatorios Encerrado com Erros'));
           MemErroImport.Lines.Append(Translate('- Término do Processamento: ') + DateTimeToStr(Now));
           ShowMessage(Translate('Erro na Importação de Dados.'));
        End;


     finally
        bbtnConfirmar.Enabled := True;
        bbtnCancelar.Enabled := True;
        bbtnSair.Enabled := True;
        bbtnAjuda.Enabled := True;
     end;
end;

procedure TfrmLeArqReports.CMDataTransfTransfProgress(const Msg: String;
  Operation: TTransfOperation; StepNum, TotalSteps: Integer);
begin
  inherited;
  If TotalSteps <> 0 Then
     Pbtransf.Max := TotalSteps;

  Pbtransf.Position := StepNum;
  SbTransf.Panels[0].Text := Msg;
end;

procedure TfrmLeArqReports.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := bbtnConfirmar.Enabled
end;

procedure TfrmLeArqReports.CMDataTransfErrorMessage(Sender: TObject;
  sMessage: String);
begin
  inherited;
  If Pos('ORA-02291'{ivlm},sMessage) > 0 Then
  Begin
    MemErroImport.Lines.Append(sMessage);
    Application.ProcessMessages;
  End;
end;

procedure TfrmLeArqReports.SalvarLog1Click(Sender: TObject);
begin
  inherited;
  If DlgSave.Execute Then
     MemErroImport.Lines.SaveToFile('- '{ivlm} + DlgSave.FileName);
end;

procedure TfrmLeArqReports.Limparlog1Click(Sender: TObject);
begin
  inherited;
  MemErroImport.Lines.Clear;
end;

//Hugo Luna - Pendência 26902 - Inicio - Esta rotina já existe na CMDataTransf.
//Por não poder alterar a bpl cmcomponentes e recompilar o Padrão, foi necessário
//repiti-la aqui, com isso, podendo tornar o processo um pouco mais lento.
function TfrmLeArqReports.VerificaDiferencas: integer;
var
  qryBack, qryPegaBackup : TwwQuery;
  sSQL                   : String;
  iCount         : Integer;
begin
  Try
    iCount:= 0;
    qryBack                     := TwwQuery.Create(nil);
    qryBack.DatabaseName        := 'BaseDados';

    qryPegaBackup               := TwwQuery.Create(nil);
    qryPegaBackup.DatabaseName  := 'BaseDados';


    sSQL:= 'select MAX(idbackctrl) as idbackctrl from backctrl '+
           'order by idbackctrl desc                           ';

    qryPegaBackup.Close;
    qryPegaBackup.SQL.Clear;
    qryPegaBackup.SQL.Add(sSQL);
    qryPegaBackup.Open;

    iIdBack:= qryPegaBackup.FieldByName('IDBACKCTRL').AsInteger;

    sSQL:= ' SELECT AUTORIZABACK.IDESPACESSO, '+
           ' AUTORIZABACK.IDOPERFUNC,         '+
           ' AUTORIZABACK.IDPESSOA            '+
           ' FROM AUTORIZABACK                '+
           ' WHERE AUTORIZABACK.IDBACKCTRL =  '+ IntToStr(iIdBack);

    qryBack.Close;
    qryBack.SQL.Clear;
    qryBack.SQL.Add(sSQL);
    qryBack.Open;

    while (not qryBack.Eof) do
      begin
        if not EncontrouNaOPERFUNC(qryBack.FieldByName('IDOPERFUNC').AsInteger) then
        begin
           iCount:= iCount + 1;
           GeraAutorizacoesPerdidas(qryBack.FieldByName('IDOPERFUNC').AsInteger,
                                    qryBack.FieldByName('IDESPACESSO').AsInteger,
                                    iIdBack);
           qryBack.Next;
           Continue;
        end;
        qryBack.Next;
      end;

    Result:= iCount;

  Finally
    qryBack.Free;
    qryPegaBackup.Free;
  end;
end;

function TfrmLeArqReports.EncontrouNaOPERFUNC(
  iIdOperFunc: integer): boolean;
var
  qryOper: TwwQuery;
  sSQL   : String;
begin
  Try
    Result := True;
    qryOper              := TwwQuery.Create(nil);
    qryOper.DatabaseName := 'BaseDados';

    sSQL :=
      'SELECT OPERFUNC.IDOPERFUNC                '+
      'FROM OPERFUNC                             '+
      'WHERE IDOPERFUNC = ' + IntToStr(iIdOPerFunc);
    qryOper.SQL.Text := sSQL;
    qryOper.Open;
    Result := qryOper.RecordCount > 0;
  Finally
    qryOper.Free;
  end;
end;
//Hugo Luna - Pendência 26902 - Fim

procedure TfrmLeArqReports.FormCreate(Sender: TObject);
begin
  inherited;

  ListaAutorizaPerdida := TStringList.Create;
end;

procedure TfrmLeArqReports.GeraAutorizacoesPerdidas(iIdOperfunc,iIdEspacesso, iIdBackCtrl : Integer);
var
  qryPegaDadosBack : TwwQuery;
  sSQL, sLinha     : String;

begin
  qryPegaDadosBack              := TwwQuery.Create(nil);
  qryPegaDadosBack.DatabaseName := 'BaseDados';

  sSQL := ' select distinct a.trgdtinclusao, ' +
          '   a.idespacesso, ' +
          '   a.idoperfunc, ' +
          '   a.idpessoa, ' +
          '   a.idbackctrl, ' +
          '   f.nomefuncao, ' +
          '   op.nomeoperacao, ' +
          '   m.nomemodulo ' +
          ' from autorizaback a, operfuncback o, funcaoback f, operacaoback op, modulo m ' +
          ' where a.idoperfunc = o.idoperfunc ' +
          '   and f.idfuncao = o.idfuncao ' +
          '   and op.idoperacao = o.idoperacao ' +
          '   and m.idmodulo = f.idmodulo ' +
          '   and a.idoperfunc = ' + IntToStr(iIdOperfunc) +
          '   and a.idbackctrl = ' + IntToStr(iIdBackCtrl) +
          '   and o.idbackctrl = ' + IntToStr(iIdBackCtrl) +
          '   and f.idbackctrl = ' + IntToStr(iIdBackCtrl) +
          '   and op.idbackctrl = ' + IntToStr(iIdBackCtrl) +
          '   and a.idespacesso = ' + IntToStr(iIdEspacesso);

  qryPegaDadosBack.Close;
  qryPegaDadosBack.SQL.Clear;
  qryPegaDadosBack.SQL.Add(sSQL);
  qryPegaDadosBack.Open;

  sLinha := 'Data Inclusão: ' +  qryPegaDadosBack.FieldByName('trgdtinclusao').AsString + '   ' ;
  sLinha := sLinha + 'IdEspAcesso: ' + qryPegaDadosBack.FieldByName('idespacesso').AsString + '   ' ;
  sLinha := sLinha + 'IdPessoa: ' + qryPegaDadosBack.FieldByName('idpessoa').AsString + '   ' ;
  sLinha := sLinha + 'IdBackCtrl: ' + qryPegaDadosBack.FieldByName('idbackctrl').AsString + '   ' ;
  sLinha := sLinha + 'IdOperFunc: ' + qryPegaDadosBack.FieldByName('idoperfunc').AsString + '   ' ;
  sLinha := sLinha + 'Nome da Função: ' + qryPegaDadosBack.FieldByName('NomeFuncao').AsString + '   ' ;
  sLinha := sLinha + 'Nome da Operação: ' + qryPegaDadosBack.FieldByName('nomeoperacao').AsString + '   ' ;
  sLinha := sLinha + 'NomeModulo: ' + qryPegaDadosBack.FieldByName('nomemodulo').AsString + '   ' ;

  ListaAutorizaPerdida.Add(sLinha);

end;

procedure TfrmLeArqReports.GeraTXTAutorizacoes;
var
  i : integer;
begin
  if ListaAutorizaPerdida.Count <> 0 then
    begin

       Try
         //AssignFile(ArqAutorizaPerdida,'C:\Alteracoes-Cancelamentos.txt');
         AssignFile(ArqAutorizaPerdida,Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\Alteracoes-Cancelamentos.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
         Rewrite(ArqAutorizaPerdida);
       Except

       End;


       For i:=0 to Pred(ListaAutorizaPerdida.Count) do
         begin
           Writeln(ArqAutorizaPerdida, ListaAutorizaPerdida.Strings[i]);
         end;

       CloseFile(ArqAutorizaPerdida);
    end;
end;

end.
