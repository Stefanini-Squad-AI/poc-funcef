{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Configuração de Relatórios Personalisados           }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/07/2002                             }
{                                                       }
{*******************************************************}                                                       
{                                                       }
{ 1)                                                    }
{  Caso da tabela de configuração seja a CARTACOBRANCA, }
{  basta atribuir para a variavel cFlag o valor         }
{  referente dao FLGTIPOCARTA do modelo a               }
{  ser configurado.                                     }
{  Verifique os valores implementados abaixo:           }
{                                                       }
{   |-----------------------------------------------|   }
{   | Valor | Descrição          | Sistema          |   }
{   |-----------------------------------------------|   }
{   |B      | Recibo             | Imobiliário      |   }
{   |I      | Aviso de Cobrança  | Imobiliário      |   }
{   |R      | Recadastramento    | AdmPrev          |   }
{   |P      | Proposta           | Eventos          |   }
{   |C      | Carta de Cobrança  | Contas a Receber |   }
{   |O      | Recibo             | CapCar           |   }
{   |J      | Aviso de Reajuste  | Imobiliário      |   }
{   |X      | Pendencia RUBS     | Central AP       |   }
{   |F      | Info Rendimento    | IRRF             |   }
{   |D      | Demonstração       | Global           |   }
{   |-----------------------------------------------|   }
{                                                       }
{ 2)                                                    }
{  Caso a tabela de configuração seja uma tabela        }
{  específica verificar a nescessidade de sobrescrever  }
{  os métodos abaixo bem como da implementação da       }
{  classe de controle referente a(s) tabelas(s)         }
{  específicas ( a descricação dos métodos encontra-se  }
{  na implementação dos mesmos ).                       }
{                                                       }
{  Procedure SelModelo;                                 }
{  Procedure ExecutaErroImpressao;                      }
{  function TestaImpressao: Boolean;                    }
{  procedure InsereCdsPrincipal;                        }
{  Procedure HabilitaImpressao(bImprime:Boolean);       }
{                                                       }
{ 3)                                                    }
{  Independente da tabela de configuração a Procedure   }
{  SelDados tem de ser sobrescrita sempre pois a fonte  }
{  de dados varia de acordo com o modelo a ser          }
{  implementado                                         }
{                                                       }
{*******************************************************}

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Helio Lima Custódio
// Data        : 23/06/2015
// Pendência   : SOL 253577/17359 PPM 842402
// Rotinas     : BtnImprimeClick e inclusão da Imprime
// Descricao   : Separacao da rotina BtnImprimeClick com uma subrotina,
// pemitindo especificar a procedure de origem dos dados e caminho do arquivo.
// A intenção é ter a opção de gravar em varios arquivos e guardar no hd.
//------------------------------------------------------------------------------

unit FConfigRelatorioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCmSqlParams, ppDB, ppDBPipe, ppDBBDE, ppCache, ppClass, ppBands,
  ppProd, ppReport, ppComm, ppEndUsr, Menus, wwdblook,
  CMDBLookupCombo, Mask, wwdbedit, uCtrlConfigRelatorio, ppTypes, ppForms,
  ppRelatv, ppModule, raCodMod, uSistema;

type
  ProcSelDados = procedure of Object;//Helio - SOL Nº 253577-17359 PPM Nº 842402

  TFrmConfigRelatorioMT = class(TFrmCadastroMT)
    Sql: TCMSqlParams;
    BtnImprime: TToolbarButton97;
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
    DsgnCM: TppDesigner;
    RptModelo: TppReport;
    ppDetailBand2: TppDetailBand;
    PpDados: TppBDEPipeline;
    DsDados: TwwDataSource;
    CdsModelo: TCMClientDataSet;
    SqlModelo: TCMSqlParams;
    SqlDados: TCMSqlParams;
    CdsDados: TCMClientDataSet;
    SqlReports: TCMSqlParams;
    CdsReports: TCMClientDataSet;
    PnlCadastro: TPanel;
    Label1: TLabel;
    DeRelatorio: TwwDBEdit;
    BtnDesenho: TBitBtn;
    PnlImprime: TPanel;
    Label2: TLabel;
    CmbModelo: TCMDBLookupCombo;
    raCodeModule1: TraCodeModule;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure mniFileSaveClick(Sender: TObject);
    procedure mniFilePageSetupClick(Sender: TObject);
    procedure mniFilePrintToFileSetupClick(Sender: TObject);
    procedure mniFilePrintClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure BtnDesenhoClick(Sender: TObject);
    procedure BtnImprimeClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    bCarregaModelo,  bImprimeModelo: Boolean;
    aReportDesign, aReportModelo: TMemoryStream;

    _ConfigRelatorio: TCtrlConfigRelatorio;

    Procedure SelReport(iIdReporst, iOrigemReports: Integer);

    //Inicio - SOL Nº 253577-17359 PPM Nº 842402
    procedure Imprime(filtroPorPagina : String = '';
                      ExecSelDados : Boolean = True;
                      pathArquivo : String = '');
    //Fim - SOL Nº 253577-17359 PPM Nº 842402

  protected
    cFlag: Char;
    Procedure Mensagem(sMens: String);

    Procedure SelDados; Virtual;
    Procedure SelModelo; Virtual;
    Procedure ExecutaErroImpressao; Virtual;
    function TestaImpressao: Boolean; Virtual;
    procedure InsereCdsPrincipal; Virtual;
    procedure AbreCdsPrincipal(iId: Integer); Virtual;

  public
    bImprimeRelat : Boolean; //Bruno Bastos - Pend. 14894 - 29/08/2003
    Procedure HabilitaImpressao(bImprime:Boolean); Virtual;

    //Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402
    procedure ImprimeTodasPaginas(pathArquivo : String = '');
    procedure ImprimePorRegistro(filtroPorPagina : String;
                                 ExecSelDados : Boolean = False;
                                 pathArquivo : String = '');
    //Fim - Helio - SOL Nº 253577-17359 PPM Nº 842402
  end;

var
  FrmConfigRelatorioMT: TFrmConfigRelatorioMT;

implementation

Uses uCtrlPadroes, uMensErro, uCMTypes, FPreview;

{$R *.DFM}

{ TFrmConfigRelatorioMT }

procedure TFrmConfigRelatorioMT.InsereCdsPrincipal;
begin
  {
    Este método deve ser sobrescrito com os campos nescessários para a inserção
    no CDS principal do formulário
    Exemplo para a carta de cobrança
  }
  
  Cds.FieldByName('IDCARTACOBRANCA').AsFloat := -1;
  Cds.FieldByName('IDREPORTS').AsInteger     := -1;
  Cds.FieldByName('ORIGEMCM').AsInteger      := 0;
  Cds.FieldByName('FLGTIPOCARTA').AsString   := cFlag;
end;

procedure TFrmConfigRelatorioMT.SelModelo;
begin
  {
    Este Método deve ser sobrescrito para passagem dos parâmetros nescessários
    para abertura do CdsModelo contem o Id do Relatório que está sendo Configurado
    Esemplo:
  }

  SqlModelo.Prepare;
  SqlModelo.ParamByname('FLGTIPOCARTA').AsString := cFlag;
  SqlModelo.Open;
end;

procedure TFrmConfigRelatorioMT.SelDados;
begin
  {
    Este Método deve ser sobrescrito para passagem dos parâmetros nescessários
    para abertura do CdsDados que é fonte de dados para o relatório que
    está sendo configurado/impresso
  }
end;

function TFrmConfigRelatorioMT.TestaImpressao: Boolean;
begin
  {
    Este Método deve ser sobrescrito no caso da nescessidade de testar se todos
    os parâmetros nescessários para a impressão do relatório foram informados
  }

  Result := (Trim(CmbModelo.Text) <> '');
end;

procedure TFrmConfigRelatorioMT.ExecutaErroImpressao;
begin
  {
    Este Método é chamado quando o TestaImpressao falha;
    Todas as mensagens e procedimentos decorrentes da ação descrita anteriormente
    devem ser executados aqui.
  }
  
  MsgDlg('Não foi possível imprimir o relatório','Erro',mtError,[mbOK],0);
end;

procedure TFrmConfigRelatorioMT.HabilitaImpressao(bImprime: Boolean);
begin
  {
    A chamada a este método deverá ser logo após a chamada do formulário,
    indicando se a operação corrente corresponde a Impressão ou Configuração do
    Relatório
  }

  bImprimeModelo := bImprime;

  If bImprimeModelo Then
  Begin
     SelDados;

     SelModelo;

     Toolbar971.Visible     := False;
     TB97oKCancelar.Visible := False;
     BtnImprime.Enabled     := True;
     PnlCadastro.Visible    := False;
  End
  Else
  Begin
     BtnImprime.Visible                 := False;
     DsgnCM.Report.Template.Format      := ftASCII;
     PnlImprime.Visible                 := False;
     aReportModelo.Clear;
     DsgnCM.Report.Template.SaveToStream(aReportModelo);
  End;

  CmeCadastro.AtualizaBotoes(Self);
end;

procedure TFrmConfigRelatorioMT.SelReport(iIdReporst,
  iOrigemReports: Integer);
begin
  SqlReports.Prepare;
  SqlReports.ParamByName('IDREPORTS').AsInteger := iIdReporst;
  SqlReports.ParamByName('ORIGEMCM').AsInteger := iOrigemReports;
  SqlReports.Open;

  If ((CmeCadastro.Operacao = OpAlterar) And (iIdReporst = 0) And (iOrigemReports = 0)) Or
      (CdsReports.IsEmpty) Then
  Begin
    Cds.FieldByName('IDREPORTS').AsInteger  := -1;
    Cds.FieldByName('ORIGEMCM').AsInteger   := -1;

    aReportModelo.Position := 0;
    aReportDesign.LoadFromStream(aReportModelo);
  End
  Else
  Begin
    aReportDesign.Clear;
    TBlobField(CdsReports.FieldByName('TEMPLATE')).SaveToStream(aReportDesign);
  End;
end;

procedure TFrmConfigRelatorioMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Rodolpho da Silva - 22/01/2007
  DsgnCM.IniStorageName := Sistema.TempDir + '\RBuilder.ini';

  aReportDesign := TMemoryStream.Create;
  aReportModelo := TMemoryStream.Create;

  _ConfigRelatorio := TCtrlConfigRelatorio.Create;
  _ConfigRelatorio.InitializeAs(Padroes);
  _ConfigRelatorio.OnMessageInfo := Mensagem;

  MontaSelect.Filtro.Add('CARTACOBRANCA.FLGTIPOCARTA = ' + QuotedStr(cFlag));
end;

procedure TFrmConfigRelatorioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  aReportDesign.Free;
  aReportModelo.Free;
  _ConfigRelatorio.Free;
end;

procedure TFrmConfigRelatorioMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  If bImprimeModelo Then pnlFundo.Enabled := True;
end;

procedure TFrmConfigRelatorioMT.mniFileSaveClick(Sender: TObject);
begin
  inherited;
  DsgnCM.Report.Template.SaveTo   := stFile;
  DsgnCM.Report.Template.Format   := ftASCII;
  aReportDesign.Clear;
  DsgnCM.Report.Template.SaveToStream(aReportDesign);
end;

procedure TFrmConfigRelatorioMT.mniFilePageSetupClick(Sender: TObject);
var
  lPageSetupDlg: TppCustomPageSetupDialog;
  lFormClass: TFormClass;
begin
  Inherited;

  if (DsgnCM.CurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPageSetupDialog);
  lPageSetupDlg := TppCustomPageSetupDialog(lFormClass.Create(Self));

  lPageSetupDlg.Report := DsgnCM.CurrentReport;
  lPageSetupDlg.ShowModal;

  lPageSetupDlg.Free;
end;

procedure TFrmConfigRelatorioMT.mniFilePrintToFileSetupClick(
  Sender: TObject);
var
  lTextFileDialog: TppCustomPrintToFileSetupDialog;
  lFormClass: TFormClass;
begin
  Inherited;
  if (DsgnCM.CurrentReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPrintToFileSetupDialog);

  lTextFileDialog := TppCustomPrintToFileSetupDialog(lFormClass.Create(Self));

  lTextFileDialog.Report := DsgnCM.Report;
  lTextFileDialog.CurrentReport := DsgnCM.CurrentReport;
  lTextFileDialog.ShowModal;

  lTextFileDialog.Free;
end;

procedure TFrmConfigRelatorioMT.mniFilePrintClick(Sender: TObject);
begin
  inherited;
  if (DsgnCM.Report = nil) then Exit;
      DsgnCM.PrintReport;
end;

procedure TFrmConfigRelatorioMT.Sair1Click(Sender: TObject);
begin
  inherited;
  DsgnCM.Close;
end;

procedure TFrmConfigRelatorioMT.BtnDesenhoClick(Sender: TObject);
begin
  inherited;

  If (Trim(DeRelatorio.Text) <> '') Then
  Begin
    SelDados;

    DsgnCM.Report.Template.SaveTo   := stFile;
    DsgnCM.Report.Template.Format   := ftASCII;

    If (CmeCadastro.Operacao = OpInserir) And (bCarregaModelo) Then
    Begin
      aReportModelo.Position := 0;
      DsgnCM.Report.Template.LoadFromStream(aReportModelo);
      bCarregaModelo := False;
    End
    Else
    Begin
      aReportDesign.Position := 0;
      DsgnCM.Report.Template.LoadFromStream(aReportDesign);
    End;

    DsgnCM.ShowModal;

    DsgnCM.Report.Template.SaveTo   := stFile;
    DsgnCM.Report.Template.Format   := ftASCII;

    aReportDesign.Clear;
    DsgnCM.Report.Template.SaveToStream(aReportDesign);
  End
  Else
    MsgDlg('Favor informar o nome do relatorio','Aviso',mtError,[mbOk],0);

end;

//Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402
procedure TFrmConfigRelatorioMT.BtnImprimeClick(Sender: TObject);
begin
      inherited;
      ImprimeTodasPaginas;
end;
{procedure TFrmConfigRelatorioMT.BtnImprimeClick(Sender: TObject);
begin
  inherited;
  bImprimeRelat := True; //Bruno Bastos
  If TestaImpressao Then
  Begin
    SelDados;

    SelReport(CdsModelo.FieldByName('IDREPORTS').AsInteger,CdsModelo.FieldByName('ORIGEMCM').AsInteger);

    If Not bImprimeRelat then Exit;//Bruno Bastos - Pend. 14894 - 29/08/2003

    If (Not CdsReports.IsEmpty) And (Not CdsReports.FieldByName('TEMPLATE').IsNull) Then
    Begin
      aReportDesign.Clear;
      TBlobField(CdsReports.FieldByName('TEMPLATE')).SaveToStream(aReportDesign);

      DsgnCM.Report.Template.SaveTo   := stFile;
      DsgnCM.Report.Template.Format   := ftASCII;
      DsgnCM.Report.Device            := dvScreen;

      aReportDesign.Position := 0;
      DsgnCM.Report.Template.LoadFromStream(aReportDesign);

      TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, CmbModelo.Text);
    End
    Else
      MsgDlg('Não foi cadastrado o desenho para o layout especificado','Erro',mtError,[mbOK],0);
  End
  Else
    ExecutaErroImpressao;
end;}
//Fim - Inicio - Helio - SOL Nº 253577-17359 PPM Nº 842402

//Helio - SOL Nº 253577-17359 PPM Nº 842402
procedure TFrmConfigRelatorioMT.ImprimeTodasPaginas(pathArquivo : String = '');
begin
       Imprime('', True, pathArquivo);
end;

//Helio - SOL Nº 253577-17359 PPM Nº 842402
procedure TFrmConfigRelatorioMT.ImprimePorRegistro(filtroPorPagina : String;
                                                   ExecSelDados : Boolean = False;
                                                   pathArquivo : String = '');
begin
       Imprime(filtroPorPagina, ExecSelDados, pathArquivo);
end;

//Helio - SOL Nº 253577-17359 PPM Nº 842402
procedure TFrmConfigRelatorioMT.Imprime(filtroPorPagina : String = '';
                                        ExecSelDados : Boolean = True;
                                        pathArquivo : String = '');
begin
  inherited;
  bImprimeRelat := True; //Bruno Bastos
  If TestaImpressao Then
  Begin

    if ExecSelDados then
         SelDados;

    if filtroPorPagina <> '' then
    begin
        cdsDados.Filtered := False;
        cdsDados.Filter := filtroPorPagina;
        cdsDados.Filtered := True;
    end;

    SelReport(CdsModelo.FieldByName('IDREPORTS').AsInteger,CdsModelo.FieldByName('ORIGEMCM').AsInteger);

    If Not bImprimeRelat then Exit;//Bruno Bastos - Pend. 14894 - 29/08/2003

    If (Not CdsReports.IsEmpty) And (Not CdsReports.FieldByName('TEMPLATE').IsNull) Then
    Begin
      aReportDesign.Clear;
      TBlobField(CdsReports.FieldByName('TEMPLATE')).SaveToStream(aReportDesign);

      DsgnCM.Report.Template.SaveTo   := stFile;
      DsgnCM.Report.Template.Format   := ftASCII;


      if pathArquivo = '' then
      begin
           DsgnCM.Report.Device            := dvScreen;

           aReportDesign.Position := 0;
           DsgnCM.Report.Template.LoadFromStream(aReportDesign);

           TFrmPreview.CreateModalPreview(Application, DsgnCM.Report, CmbModelo.Text);
      end else
      begin
            aReportDesign.Position := 0;
            DsgnCM.Report.Template.LoadFromStream(aReportDesign);
            DsgnCM.Report.TextFileName        := pathArquivo;
            DsgnCM.Report.DeviceType          := 'PDFFile';
            DsgnCM.Report.AllowPrintToFile    := True;
            DsgnCM.Report.ShowPrintDialog     := False;
            DsgnCM.Report.Print;
      end;
    End
    Else
      MsgDlg('Não foi cadastrado o desenho para o layout especificado','Erro',mtError,[mbOK],0);

    if filtroPorPagina <> '' then
          cdsDados.Filtered := False;

  End
  Else
    ExecutaErroImpressao;
end;

procedure TFrmConfigRelatorioMT.CmeCadastroInsert(Sender: TObject);
begin
  AbreCdsPrincipal(-1);

  inherited;
  
  bCarregaModelo := True;
  InsereCdsPrincipal;
  SelReport(Cds.FieldByName('IDREPORTS').AsInteger,Cds.FieldByName('ORIGEMCM').AsInteger);
end;

procedure TFrmConfigRelatorioMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If CmeCadastro.Operacao In [OpInserir,OpAlterar] Then
  Begin
     If CdsReports.IsEmpty Then
        CdsReports.Append
     Else
        CdsReports.Edit;

     CdsReports.FieldByName('NAME').AsString := 'TRelatCfg';
     aReportDesign.Position := 0;
     TBlobField(CdsReports.FieldByName('TEMPLATE')).LoadFromStream(aReportDesign);
     CdsReports.Post;
  End;
end;

procedure TFrmConfigRelatorioMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     AbreCdsPrincipal(StrToIntDef(MontaSelect.ValoresChave[0],0));
     SelReport(Cds.FieldByName('IDREPORTS').AsInteger,Cds.FieldByName('ORIGEMCM').AsInteger);     
  End;
end;

procedure TFrmConfigRelatorioMT.AbreCdsPrincipal(iId: Integer);
begin                                                                             
  Sql.Prepare;
  Sql.ParamByname('IDCARTACOBRANCA').AsFloat := iId;
  Sql.Open;
end;

procedure TFrmConfigRelatorioMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _ConfigRelatorio.ProcessaConfig(Cds.Data, CdsReports.Data, OpInserir);
end;

procedure TFrmConfigRelatorioMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _ConfigRelatorio.ProcessaConfig(Cds.Data, CdsReports.Data, OpAlterar);
end;

procedure TFrmConfigRelatorioMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _ConfigRelatorio.ProcessaConfig(Cds.Data, CdsReports.Data, opApagar);
end;

procedure TFrmConfigRelatorioMT.Mensagem(sMens: String);
begin
  MsgDlg(sMens, 'Erro', MtError, [ MbOk ], 0);
end;

end.
