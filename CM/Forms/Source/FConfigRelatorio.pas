(*******************************************************************************
 13/01/2000 - Implementação do Formulário
 
 > Descrição dos Componentes
 qry          - Contém a consulta principal coma a TABELA onde são gravados os
                dados do modelo;
 qryReports   - Responsável pela gravação do layout do relatório na tabela REPORTS
 QryDados     - Contém a consulta que é fonte de dados para o relatório;
 QryCadModelo - Contém a consulta que alimenta o combobox para a escolha do modelo
                no momento da impressão;
 RptModelo    - Neste report deve ser definido em tempo de desenho o layout padrão;
                No caso de possuirmos mais de um layout default, devemos alterar
                a propriedade Report do DsgnCM no momento da inclusão, alteração
                ou impressão do relatório;

 > Descrição dos Métodos
  Procedure AbreQueryDados; Virtual;
    Este Método deve ser sobrescrito para passagem dos parâmetros nescessário
    para abertura da query QryModelo que é fonte de dados para o relatório que
    está sendo configurado/impresso;
  Procedure AbreQueryModelo; Virtual;
    Este Método deve ser sobrescrito para passagem dos parâmetros nescessário
    para abertura da query QryCadModelo que Contém a consulta que alimenta o
    combobox para a escolha do modelo no momento da impressão;
  Procedure ExecutaErroImpressao; Virtual;
    Este Método é chamado quando o TestaImpressao falha;
    Todas as mensagens e procedimentos decorrentes da ação descrita anteriormente
    devem ser executados aqui;
  function TestaImpressao: Boolean; Virtual;
    Este Método deve ser sobrescrito no caso da nescessidade de testar se todos
    os parâmetros nescessários para a impressão do relatório foram informados;
  procedure InsereQryPrincipal; Virtual;
    Este método deve ser sobrescrito com os campos nescessários para a inserção
    na query principal do formulário;
  Procedure HabilitaImpressao(bImprime:Boolean);
    A chamada a este método deverá ser logo após a chamada do formulário,
    indicando se a operação corrente corresponde a Impressão ou Configuração do
    Relatório;

  No caso da tabela de configuração ser a CARTACOBRANÇA, atentar para os valores
  já ultilizados pela coluna FLGTIPOCARTA

    |-----------------------------------------------|
    | Valor | Descrição          | Sistema          |
    |-----------------------------------------------|
    |B      | Recibo             | Imobiliário      |
    |I      | Aviso de Cobrança  | Imobiliário      |
    |R      | Recadastramento    | AdmPrev          |
    |P      | Proposta           | Eventos          |
    |C      | Carta de Cobrança  | Contas a Receber |
    |O      | Recibo             | CapCar           |
    |J      | Aviso de Reajuste  | Imobiliário      |
    |X      | Pendencia RUBS     | Central AP       |
    |F      | Info Rendimento    | IRRF             |
    |-----------------------------------------------|

*******************************************************************************)

unit FConfigRelatorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, wwQuery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Menus, ppEndUsr, ppCache, ppDB, ppDBBDE, ppForms,
  ppComm, ppProd, ppClass, ppReport, ppPrnabl, ppCtrls, ppBands, Pptypes,
  ppDsgnCt, ppUtils, ppSubRpt, ppRuler, ppViewr, ppRegion, ppPrintr,
  ppTmplat, Printers, ppStrtch, wwdblook, CMDBLookupCombo, ppPrvDlg,
  ppRelatv, ppDBPipe, ImgList, CmEventosCadastro{$IFNDEF VER0505}, uCMTypes {$ENDIF};

type
  TFrmConfigRelatorio = class(TfrmCadastroCS)
    DsgnCM: TppDesigner;
    MergeMenu: TMainMenu;
    mniFile: TMenuItem;
    mniFileSave: TMenuItem;
    mniFileLine3: TMenuItem;
    mniFilePageSetup: TMenuItem;
    mniFilePrintToFileSetup: TMenuItem;
    mniFileLine4: TMenuItem;
    mniFilePrint: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    MnuRlatorio: TMenuItem;
    MnuTitulo: TMenuItem;
    MnuSumario: TMenuItem;
    N2: TMenuItem;
    MnuCabecalho: TMenuItem;
    MnuRodape: TMenuItem;
    N3: TMenuItem;
    MnuGrupos: TMenuItem;
    MnuLInha: TMenuItem;
    MnuRetrato: TMenuItem;
    MnuPaisagem: TMenuItem;
    N5: TMenuItem;
    MnuUnidades: TMenuItem;
    MnuPixelsTela: TMenuItem;
    MnuPixelsImpressora: TMenuItem;
    MnuPolegada: TMenuItem;
    MnuMilimetros: TMenuItem;
    MnuMMilimetros: TMenuItem;
    qryReports: TwwQuery;
    qryReportsNAME: TStringField;
    qryReportsIDREPORTS: TFloatField;
    qryReportsORIGEMCM: TFloatField;
    qryReportsTEMPLATE: TBlobField;
    PpDados: TppBDEPipeline;
    DsDados: TwwDataSource;
    QryDados: TwwQuery;
    RptModelo: TppReport;
    ppDetailBand2: TppDetailBand;
    QryCadModelo: TwwQuery;
    PnlCadastro: TPanel;
    Label1: TLabel;
    DeRelatorio: TwwDBEdit;
    BtnDesenho: TBitBtn;
    PnlImprime: TPanel;
    Label2: TLabel;
    CmbModelo: TCMDBLookupCombo;
    BtnImprime: TToolbarButton97;
    procedure BtnDesenhoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniFileSaveClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure mniFilePrintToFileSetupClick(Sender: TObject);
    procedure mniFilePrintClick(Sender: TObject);
    procedure mniFilePageSetupClick(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    bCarregaModelo,
    bImprimeModelo  :Boolean;
    sNomeRelatorio,
    sNomeModelo     :String;
    Procedure AbreQryReports(iIdReporst, iOrigemReports: Integer);
    function  GravaRelatorio: Boolean;
    //Este método grava o relatório na Tabela Reports retornando o status da operação
  public
    { Public declarations }
    Procedure AbreQueryDados; Virtual;
    //Este Método deve ser sobrescrito para passagem dos parâmetros nescessários
    //para abertura da query QryDados o que é fonte de dados para o relatório que
    //está sendo configurado/impresso
    Procedure AbreQueryModelo; Virtual;
    //Este Método deve ser sobrescrito para passagem dos parâmetros nescessário
    //para abertura da query QryCadModelo que Contém a consulta que alimenta o
    //combobox para a escolha do modelo no momento da impressão;
    Procedure ExecutaErroImpressao; Virtual;
    //Este Método é chamado quando o TestaImpressao falha;
    //Todas as mensagens e procedimentos decorrentes da ação descrita anteriormente
    //devem ser executados aqui.
    function TestaImpressao: Boolean; Virtual;
    //Este Método deve ser sobrescrito no caso da nescessidade de testar se todos
    //os parâmetros nescessários para a impressão do relatório foram informados
    procedure InsereQryPrincipal; Virtual;
    //Este método deve ser sobrescrito com os campos nescessários para a inserção
    //na query principal do formulário
    Procedure HabilitaImpressao(bImprime:Boolean); Virtual;
    //A chamada a este método deverá ser logo após a chamada do formulário,
    //indicando se a operação corrente corresponde a Impressão ou Configuração do
    //Relatório
  end;

var
  FrmConfigRelatorio: TFrmConfigRelatorio;

implementation

Uses uSistema, uDataBase, uMensErro, FPreview;

{$R *.DFM}

procedure TFrmConfigRelatorio.BtnDesenhoClick(Sender: TObject);
begin
  inherited;
  {Ok!}
  If (Trim(DeRelatorio.Text) <> '') Then
  Begin
    AbreQueryDados;

    DsgnCM.Report.Template.SaveTo   := stFile;
    DsgnCM.Report.Template.Format   := ftASCII;

    If (CmeCadastro.Operacao = OpInserir) And (bCarregaModelo) Then
    Begin
      DsgnCM.Report.Template.FileName := sNomeModelo;
      bCarregaModelo                  := False;
    End
    Else
      DsgnCM.Report.Template.FileName := sNomeRelatorio;

    DsgnCM.Report.Template.LoadFromFile;

    DsgnCM.ShowModal;

    DsgnCM.Report.Template.SaveTo   := stFile;
    DsgnCM.Report.Template.Format   := ftASCII;
    DsgnCM.Report.Template.FileName := sNomeRelatorio;
    DsgnCM.Report.Template.SaveToFile;
  End
  Else
    MsgDlg('Favor informar o nome do relatorio','Aviso',mtError,[mbOk],0);
end;

procedure TFrmConfigRelatorio.InsereQryPrincipal;
Begin
  {Ok!}
  //Este método deve ser sobrescrito com os campos nescessários para a inserção
  //na query principal do formulário
  //Exemplo para a carta de cobrança
  //Qry.FieldByName('IdCartaCobranca').AsFloat := LeUltRegistro(nil,'CARTACOBRANCA');
  //Qry.FieldByName('IDREPORTS').AsInteger     := LeUltRegistro(nil,'REPORTS');
  //Qry.FieldByName('ORIGEMCM').AsInteger      := 0;
  //Qry.FieldByName('FlgTipoCarta').AsString   := sTipoCarta;
End;


Procedure TFrmConfigRelatorio.AbreQryReports(iIdReporst, iOrigemReports: Integer);
Begin
  {Ok!}
  With qryReports Do
  Begin
    If Active Then Close;
    If Not Prepared Then Prepare;
    Params[0].AsInteger := iIdReporst;
    Params[1].AsInteger := iOrigemReports;
    Open;
    //Implemetar a gravação de relatório para registro alterados e gravados
    //sem layout de relatório definido
    If ((CmeCadastro.Operacao = OpAlterar) And
        (iIdReporst = 0)               And
        (iOrigemReports = 0))          Or
        (IsEmpty)                      Then
    Begin
      Qry.FieldByName('IDREPORTS').AsInteger  := LeUltRegistro(nil,'REPORTS');
      Qry.FieldByName('ORIGEMCM').AsInteger   := 0;
      CopyFile(PChar(sNomeModelo),PChar(sNomeRelatorio),false);
    End
    Else
      qryReportsTEMPLATE.SaveToFile(sNomeRelatorio);
  End;
End;

procedure TFrmConfigRelatorio.FormCreate(Sender: TObject);
begin
  inherited;
  {Ok!}
  // Rodolpho da Silva - 22/01/2007
  DsgnCM.IniStorageName := Sistema.TempDir + '\RBuilder.ini';
  
  sNomeRelatorio := Sistema.TempDir + 'Relatorio.Tcm';
  sNomeModelo    := Sistema.TempDir + 'Modelo.Tcm';
end;

procedure TFrmConfigRelatorio.mniFileSaveClick(Sender: TObject);
begin
  inherited;
  {Ok!}
  DsgnCM.Report.Template.SaveTo   := stFile;
  DsgnCM.Report.Template.Format   := ftASCII;
  DsgnCM.Report.Template.FileName := sNomeRelatorio;
  DsgnCM.Report.Template.SaveToFile;
end;

procedure TFrmConfigRelatorio.Sair1Click(Sender: TObject);
begin
  inherited;
  {Ok!}
  DsgnCM.Close;  
end;

procedure TFrmConfigRelatorio.mniFilePageSetupClick(Sender: TObject);
var
  lPageSetupDlg: TppCustomPageSetupDialog;
  lFormClass: TFormClass;
begin
  Inherited;
  {Ok!}
  if (DsgnCM.CurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPageSetupDialog);
  lPageSetupDlg := TppCustomPageSetupDialog(lFormClass.Create(Self));

  lPageSetupDlg.Report := DsgnCM.CurrentReport;
  lPageSetupDlg.ShowModal;

  lPageSetupDlg.Free;
end;

procedure TFrmConfigRelatorio.mniFilePrintClick(Sender: TObject);
begin
  inherited;
  {Ok!}
  if (DsgnCM.Report = nil) then Exit;
      DsgnCM.PrintReport;                                 
end;

procedure TFrmConfigRelatorio.mniFilePrintToFileSetupClick(Sender: TObject);
var
  lTextFileDialog: TppCustomPrintToFileSetupDialog;
  lFormClass: TFormClass;
begin
  Inherited;
  {Ok!}
  if (DsgnCM.CurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPrintToFileSetupDialog);

  lTextFileDialog := TppCustomPrintToFileSetupDialog(lFormClass.Create(Self));

  lTextFileDialog.Report := DsgnCM.Report;
  lTextFileDialog.CurrentReport := DsgnCM.CurrentReport;
  lTextFileDialog.ShowModal;

  lTextFileDialog.Free;
end;

procedure TFrmConfigRelatorio.BtnImprimeClick(Sender: TObject);
begin
  inherited;
  {Ok!}
  If TestaImpressao Then
  Begin
    AbreQueryDados;

    AbreQryReports(QryCadModelo.FieldByName('IDREPORTS').AsInteger,QryCadModelo.FieldByName('ORIGEMCM').AsInteger);

    If (Not qryReports.IsEmpty) And (Not qryReportsTEMPLATE.IsNull) Then
    Begin
      qryReportsTEMPLATE.SaveToFile(sNomeRelatorio);

      DsgnCM.Report.Template.SaveTo   := stFile;
      DsgnCM.Report.Template.Format   := ftASCII;
      DsgnCM.Report.Template.FileName := sNomeRelatorio;
      DsgnCM.Report.Device            := dvScreen;
      DsgnCM.Report.Template.LoadFromFile;

      TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, CmbModelo.Text);
    End
    Else
      MsgDlg('Não foi cadastrado o desenho para o layout especificado','Erro',mtError,[mbOK],0);
  End
  Else
    ExecutaErroImpressao;
end;


Procedure TFrmConfigRelatorio.AbreQueryModelo;
Begin
  {Ok!}
  //Este Método deve ser sobrescrito para passagem dos parâmetros nescessário
  //para abertura da query QryCadModelo contem o Id do Relatório que está sendo
  //Configurado
  //Esemplo...
  //If QryCadModelo.Active       Then QryCadModelo.Close;
  //If Not QryCadModelo.Prepared Then QryCadModelo.Prepare;
  //QryCadModelo.ParamByname('FLGTIPOCARTA').AsString := sTipoCarta;
  //QryCadModelo.Open;
End;

Procedure TFrmConfigRelatorio.AbreQueryDados;
Begin
  {Ok!}
  //Este Método deve ser sobrescrito para passagem dos parâmetros nescessário
  //para abertura da query QryModelo que é fonte de dados para o relatório que
  //está sendo configurado/impresso
End;

function TFrmConfigRelatorio.TestaImpressao: Boolean;
Begin
  {Ok!}
  //Este Método deve ser sobrescrito no caso da nescessidade de testar se todos
  //os parâmetros nescessários para a impressão do relatório foram informados
  Result := (Trim(CmbModelo.Text) <> '');
End;

Procedure TFrmConfigRelatorio.ExecutaErroImpressao;
Begin
  {Ok!}
  //Este Método é chamado quando o TestaImpressao falha;
  //Todas as mensagens e procedimentos decorrentes da ação descrita anteriormente
  //devem ser executados aqui.
  MsgDlg('Não foi possível imprimir o relatório','Erro',mtError,[mbOK],0);
End;

function TFrmConfigRelatorio.GravaRelatorio: Boolean;
Begin
  //Este método grava o relatório na Tabela Reports retornando o status da operação
  {Ok!}
  Try
   StartTransacao;

   If CmeCadastro.Operacao In [OpInserir,OpAlterar] Then
   Begin
      qryReports.Edit;
      qryReportsIDREPORTS.AsInteger := Qry.FieldByName('IDREPORTS').AsInteger;
      qryReportsNAME.AsString       := 'TRelatCfg';
      qryReportsTEMPLATE.LoadFromFile(sNomeRelatorio);
      qryReports.Post;
      qryReports.Close;
   End;

   CommitTransacao;

   If FileExists(sNomeRelatorio) Then  DeleteFile(sNomeRelatorio);
   Result := True;

  Except
   RollbackTransacao;
   Raise;
  End;
End;

Procedure TFrmConfigRelatorio.HabilitaImpressao(bImprime:Boolean);
Begin
  {Ok!}
  //A chamada a este método deverá ser logo após a chamada do formulário,
  //indicando se a operação corrente corresponde a Impressão ou Configuração do
  //Relatório

  bImprimeModelo := bImprime;

  If bImprimeModelo Then
  Begin
     AbreQueryDados;

     AbreQueryModelo;

     Toolbar971.Visible     := False;
     TB97oKCancelar.Visible := False;
     BtnImprime.Enabled     := True;
     PnlCadastro.Visible    := False;
  End
  Else
  Begin
     If Qry.Active Then Qry.Close;
     Qry.Open;

     BtnImprime.Visible                 := False;
     DsgnCM.Report.Template.SaveTo      := stFile;
     DsgnCM.Report.Template.Format      := ftASCII;
     DsgnCM.Report.Template.FileName    := sNomeModelo;
     PnlImprime.Visible                 := False;
     DsgnCM.Report.Template.SaveToFile;
  End;

  CmeCadastro.AtualizaBotoes(Self);
End;

procedure TFrmConfigRelatorio.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  {Ok!}                
  If bImprimeModelo Then pnlFundo.Enabled := True;
end;

procedure TFrmConfigRelatorio.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  {Ok!} 
  bCarregaModelo := True;
  InsereQryPrincipal;
  AbreQryReports(Qry.FieldByName('IDREPORTS').AsInteger,Qry.FieldByName('ORIGEMCM').AsInteger);
end;

procedure TFrmConfigRelatorio.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  AbreQryReports(Qry.FieldByName('IDREPORTS').AsInteger,Qry.FieldByName('ORIGEMCM').AsInteger);
end;

procedure TFrmConfigRelatorio.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravaRelatorio;
end;

End.
