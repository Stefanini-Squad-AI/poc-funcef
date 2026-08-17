{----------------------------------------Histórico de Alterações--------------------------------------------------------------------
Rotina......: (dfm SQLReport)
Atender.....: WO38027
Data........: 08/05/2026
Responsável.: Edilaine
Descrição...: Alterar a impressão para usar o componente ADO caso esteja parametrizado
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AbreQuery
Atender.....: WO8290
Data........: 27/02/2024
Responsável.: Luis Ferrari
Descrição...: Alteração no relatorio 4234 foi necessario efetuar o mesmo tratamento para o relatorio 4283.(Memoria Insuficiente)
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: MostraFormularioFiltro
Nº SIG......: 129723
Data........: 07/10/2022
Responsável.: Everson Cunha
Descrição...: Ajuste no sig 129094
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: MostraFormularioFiltro
Nº SIG......: 129094
Data........: 22/09/2022
Responsável.: André Imakawa
Descrição...: Ao cancelar a tela de filtro a rotina do ajuste de impressora apresentava erro.
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: bbExportarClick
Nº SIG......: 123112
Data........: 07/03/2022
Responsável.: edilaine
Descrição...: ao exportar dados não considera todas as linhas do relatório
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: bbExportarClick
Nº SIG......: 103891
Data........: 03/01/2021
Responsável.: edilaine
Descrição...: exportar subconsultas
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: bbExportarClick
Nº SIG......: 101433
Data........: /12/2020
Responsável.: edilaine
Descrição...: crítica de planilha bloqueada
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: bbExportarClick, ExportacaoManual
Nº SIG......: 94698
Data........: 27/03/2020
Responsável.: Fábio Sampaio
Descrição...: Alteração para exportar as subconsultas de relatórios que seja FLGEXPORTAMANUAL = 'S' e FLGEXPORTAMANUALSUB = 'S'
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: bbExportarClick, VisualizaRelatorio,ExportaDados
Nº SIG......: 90059/90065
Data........: 06/11/2019
Responsável.: Darivaldo Alencar
Descrição...: Habilitar exportação para relatórios manuais
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: bbExportarClick
Nº SIG......: 86348
Data........: 23/05/2019
Responsável.: Taffarel Sevaybriker
Descrição...: Componente padrão exportando linhas divergentes da query.
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: bbExportarClick
Nº SIG......: 87517
Data........: 21/05/2018
Responsável.: Darivaldo Alencar
Descrição...: Relatório não mostra observações devido a quantidade de páginas.
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: bbExportarClick
Nº SIG......: 82210
Data........: 15/04/2019
Responsável.: Darivaldo Alencar
Descrição...: Componente padrão exportando linhas divergentes da query
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AbreQuery
Nº SIG......: 77327
Data........: 01/11/2018
Responsável.: Andre Imakawa
Descrição...: Corrigido query do report 2095
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AbreQuery e TreeReportsChange
Nº SIG......: 77119 - TIBERO
Data........: 20/10/2018
Responsável.: Andre Imakawa / Everson Luiz Pereira da Cunha
Descrição...: Retirar o comando de alter session que era executado para o Oracle
              Invalid Month Value.
------------------------------------------------------------------------------------------------------------------------------------
Rotina......:
Nº SIG......: 62086
Data........: 13/07/2018
Responsável.: Darivaldo Alencar
Descrição...: Impressora padrão mudando sozinha durante a geração do relatório.
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AbreQuery
Nº SIG......: 67981
Data........: 21/05/2018
Responsável.: Darivaldo Alencar
Descrição...: Relatório não mostra observações devido a quantidade de páginas.
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AbreQuery
Nº SIG......: 67223
Data........: 20/04/2018
Responsável.: Andre Imakawa
Descrição...: Com a alteração do SIG 66116, alem do relatorio 4234 foi necessario
              efetuar o mesmo tratamento para o relatorio 2095.
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AbreQuery
Nº SIG......: 66116
Data........: 11/04/2018
Responsável.: Andre Imakawa
Descrição...: Memoria Insuficiente, erro ocorrendo devido implementação do SIG
              56322, O tratamento do SIG 56322 sera utilizado apenas no report
              4234.
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AbreQuery
Nº SIG......: 62683
Data........: 02/03/2018
Responsável.: Darivaldo Alencar
Descrição...: Colunas vazias ao exportar para .XLS
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AbreQuery
Nº SIG......: 56322
Responsável.: Luiz Carlos
Descrição...: Ajuste para impressao de observacoes para relatorios
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: FormCreate, ChangeDefaultPrinter, FormActivate, FormDeactivate
              ApplicationDeActivate, ApplicationActivate, FormClose e
              spbPreviewPrintClick
Nº SIG......: 34269
Responsável.: André Imakawa
Descrição...: Erro na impressora padrão
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: VisualizaRelatorio
Nº SIG......: 42704
Responsável.: André Imakawa
Descrição...: cdsConsulta não esta ativo para alguns relatorios
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: FazerSelectsGeraisReport
Nº SOL......: 244125.18329
Data........: 06/10/2016
Responsável.: Marcelo Cardoso
Descrição...: Melhoria no Cad. de Relatórios, para que seja validado na primeira consulta, se existe
              dados para o parametro informado. Deve ser apresentado uma menssagem
-------------------------------------------------------------------------------------------------
Rotina......: criação de relatorios
Nº SIG......: 23984
Responsável.: Peterson Victor
Descrição...: Exibir o botao exportar de acordo com a parametrização do sistema
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: criação de relatorios
Nº SOL......: 253577/18061
Nº PPM......: 1238748
Responsável.: Robson Andrade
Descrição...: Relatorios movimento de contribuição e relatorio financeiro
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: ExportaDados
Nº SOL......: 268092
Nº PPM......: 1246018
Data........: 21/01/2016
Responsável.: William Santana
Descrição...: erro nos relatórios que estão com a marcação para exportar
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: visualiza relatorio
Nº SOL......: 260951
Nº PPM..: 1050490
Data........: 01/09/2015
Responsável.: William Moreira da Silva
Descrição...: Erro na consulta do relatorio por causa da SESSION
------------------------------------------------------------------------------------------------------------------------------------
Data       : 07.08.2015
Sol        : 148922/8841
PPM        : 1628565
Autor      : Jonas Otavio
Rotina     : Botão Ajuda
Descrição  : Confeccionar documentação do módulo de Empréstimo
-------------------------------------------------------------------------------------------------------------------------------------
Rotina......: Grid
Nº SOL......: 231267/16158
Nº KINTANA..: 412192
Data........: 10/10/2014
Responsável.: Higor Nayde
Descrição...: Criação de relacionamento entre consultas
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: Exportar
Nº SOL......: 213740/15967
Nº KINTANA..: 347314
Data........: 13/06/2014
Responsável.: Higor Nayde Ferreira
Descrição...: Criar o botão Exportar para o relatório de idreports = 4124.
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AjustaQueryRelatorios
Nº SOL......: 212230
Nº KINTANA..: 2036837
Data........: 18/07/2013
Responsável.: William Moreira da Silva
Descrição...: Erro ao abrir relatórios com subqueries
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AjustaQueryRelatorios
Nº SOL......: 211165
Nº KINTANA..: 2031517
Data........: 09/07/2013
Responsável.: William Moreira da Silva
Descrição...: Erro ao Cancelar relatorios com sub query
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AjustaQueryRelatorios
Nº SOL......: 141429
Nº KINTANA..: 893321
Data........: 10/08/2010
Responsável.: Thaise Amaral Martins
Descrição...: Na procedure AjustaQueryRelatorios, verificar se a query está vazia.
------------------------------------------------------------------------------------------------------------------------------------
Rotina......: AjustaQueryRelatorios
Nº SOL......: 60478
Nº KINTANA..: 523185
Data........: 28/07/2010
Responsável.: Marilza Colpani
Descrição...: Ajuste para fazer quebra de linhas no select.
------------------------------------------------------------------------------------------------------------------------------------
Pendência   : SOL 134184 KINTANA 789338
Responsável : BRUNO AZEVEDO
Data        : 28/05/2010
Descrição   : Exportação de relatórios para o excel.
------------------------------------------------------------------------------------------------------------------------------------
  Desenvolvedor: Arnaldo Vicente Scarin
  Data.........: 29/04/2010
  SOL / Kintana: 132513 / 765092
  Alteração....: Implementação de SubRelatorio nos Relatórios definidos pelo sistema
-----------------------------------------------------------------------------------------------------------------------------------}
//*********************************************************************************************************
//Rotina..........: ExportaDados(), FiltraRegistrosManual(), TreeReportsChange()
//N. Sol..........: 106554
//N. Kintana......: 492516
//Data............: 18/08/2009
//Responsável.....: William Santos
//Descrição.......: Implementação do Componente QExport3Dialog para o Relatório de Levantamentos do Sistema
//                  Jurídico. Criado uma coluna no banco chamada 'FLGEXPORTADADOS', para os registros que estiverem
//                  com a informação 'S' o botão EXPORTAR estará visível para os que estiverm 'N" não.
//*********************************************************************************************************

//andre tavares - 20/01/2005 - pendência ????? - Aumentei o tamanho do label para
//que seja possível ver a quantidade de páginas total de relaórios com mais de 1000 páginas;
//maximizei o form para que se tenha um pouco mais de espaço.
{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Form padrão de exibição de relatórios               }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 28/05/2001                             }
{                                                       }
{*******************************************************}

unit fMostraRelat;

interface

uses
  Windows, FSairAjuda, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ppDBBDE, TB97, Buttons, Db, DBTables, ppReport, ExtCtrls,
  StdCtrls, Wwdatsrc, ppBands, ppProd, ppComm, ppCache, ppDB, ComCtrls,
  Spin, Grids, Wwdbigrd, Wwdbgrid, ppViewr, MAHlpBtn, dvDataVw, ppForms,
  uSistema, ppTypes, ppFilDev, uMensErro, TB97Tlbr, TB97Ctls,
  IvDictio, IvMulti, IvEMulti, FFiltraSql, fcTreeView, dAutorizacao,
  ImgList, ppRelatv, ppDBPipe, TXComp, ppClass, ppArchiv, Menus, uCMTypes,
  DBClient, uCmSqlParams, TXRB, QExport3Dialog, ppSubRpt,Wwquery,
  IniFiles,ComObj,FAguarde, BfDialogs, BrowseFolder, uProcuraDir,FileCtrl, // Robson Andrade - SOL.253577/18061 ppm.1238748
  WinSpool, Printers, // Andre Imakawa - SIG34269
  fExportD, //Darivaldo Alencar SIG62683
  QExport3,   //edilaine SIG123112 
  ADODB, uAutorizacao
  ;

type
  TTipoRelatorio  = (trFinanceiro,trContabil);// Robson Andrade - SOL.253577/18061 ppm.1238748
  TfrmMostraRelat = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    BtnVisualizar: TBitBtn;
    PnlPreview: TPanel;
    C: TDock97;
    Toolbar972: TToolbar97;
    spbPreview100Percent: TToolbarButton97;
    spbPreviewWhole: TToolbarButton97;
    spbPreviewPrint: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    lblRelatPct: TLabel;
    spbPreviewWidth: TToolbarButton97;
    SpinEdit1: TSpinEdit;
    ppViewer1: TppViewer;
    PnlRel: TPanel;
    MemHistorico: TMemo;
    ToolbarSep975: TToolbarSep97;
    SpBtnNextPage: TSpeedButton;
    SpBtnLastPage: TSpeedButton;
    LblPreviewPage: TLabel;
    SpBtnPriorPage: TSpeedButton;
    SpBrnFirstPage: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    pnlTree: TPanel;
    bbtnExportar: TToolbarButton97;
    bbtnSalvar: TToolbarButton97;
    opnReport: TOpenDialog;
    svReport: TSaveDialog;
    btnTelaUnica: TBitBtn;
    ImlReports: TImageList;
    TreeReports: TfcTreeView;
    ExtReport: TExtraOptions;
    BtnGoToPage: TSpeedButton;
    DsSql: TwwDataSource;
    btnSendMail: TToolbarButton97;
    pprPadrao: TppArchiveReader;
    ToolbarSep972: TToolbarSep97;
    sbnAreader: TToolbarButton97;
    ppmImpAreader: TPopupMenu;
    MnuImprimir: TMenuItem;
    MnuVisualizar: TMenuItem;
    DlgAreade: TOpenDialog;
    CdsReport: TClientDataSet;
    SQLReport: TCMSqlParams;
    Consulta: TppDBPipeline;
    CdsConsulta: TClientDataSet;
    SqlConsulta: TCMSqlParams;
    qe3dPadrao: TQExport3Dialog;
    ToolbarButton971: TToolbarButton97;
    bbExportar: TBitBtn;
    SubConsulta1: TppDBPipeline;
    dsSub1: TwwDataSource;
    cdsSub1: TClientDataSet;
    sqlSub1: TCMSqlParams;
    SubConsulta2: TppDBPipeline;
    dsSub2: TwwDataSource;
    cdsSub2: TClientDataSet;
    sqlSub2: TCMSqlParams;
    SubConsulta3: TppDBPipeline;
    dsSub3: TwwDataSource;
    cdsSub3: TClientDataSet;
    sqlSub3: TCMSqlParams;
    SubConsulta4: TppDBPipeline;
    dsSub4: TwwDataSource;
    cdsSub4: TClientDataSet;
    sqlSub4: TCMSqlParams;
    cdsDub5: TClientDataSet;
    sqlDub5: TCMSqlParams;
    AbrirDlg: TProcuraDirDlg;
    SubConsulta5: TppDBPipeline;
    dsSub5: TwwDataSource;
    cdsSub5: TClientDataSet;
    sqlSub5: TCMSqlParams;
    sqlSub6: TCMSqlParams;
    cdsSub6: TClientDataSet;
    dsSub6: TwwDataSource;
    SubConsulta6: TppDBPipeline; //Robson Andrade - SOL.253577/18061 ppm.1238748
    qryADO: TADOQuery;
    SQLBackup: TCMSqlParams;
    // Inicio - Arnaldo V. Scarin - Sol 132513
    procedure FormCreate(Sender: TObject);
    procedure BtnVisualizarClick(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewPrintClick(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpBrnFirstPageClick(Sender: TObject);
    procedure SpBtnPriorPageClick(Sender: TObject);
    procedure SpBtnNextPageClick(Sender: TObject);
    procedure SpBtnLastPageClick(Sender: TObject);
    procedure ppViewer1PageChange(Sender: TObject);
    procedure ppViewer1PrintStateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnExportarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure btnTelaUnicaClick(Sender: TObject);
    procedure TreeReportsDblClick(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure TreeReportsChange(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
    procedure BtnGoToPageClick(Sender: TObject);
    procedure btnSendMailClick(Sender: TObject);
    procedure MnuImprimirClick(Sender: TObject);
    procedure MnuVisualizarClick(Sender: TObject);
    procedure bbExportarClick(Sender: TObject);
    procedure bbtnAjudaClick(Sender: TObject);
    // Andre Imakawa - SIG34269 - Inicio
    procedure ApplicationDeactivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApplicationActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qe3dPadraoBeginExport(Sender: TQExport3);     //edilaine SIG123112


  private
     Autorizacao: TAutorizacao; //Darivaldo Alencar SIG67981
    { Private declarations }
    viIdReport: Integer; //BRUNO AZEVEDO SOL 134184 KINTANA 789338
    //Robson Andrade - SOL.253577/18061 ppm.1238748 - inicio
    bExportar : Boolean;
    tipoRelat : TTipoRelatorio;
    sSqlParam     : String;
    bSemRegistro :Boolean;
    //Robson Andrade - SOL.253577/18061 ppm.1238748 --fim
    ChangeZoom, SemRelatorio: Boolean;
    RelatManual, RelatGerador, RelatCmReport : TppReport;
    {Exibe a tela de filtro manual e aplica a seleção a query do relatório}
    // Robson Andrade - SOL.253577/18061 ppm.1238748 --inicio
    //Function  FiltraRegistrosManual: TFrResult;
    function FiltraRegistrosManual(bExporta: Boolean = False): TFrResult;
    // Robson Andrade - SOL.253577/18061 ppm.1238748 --fim
    {Procedimentos para visualização do relatório}
    Procedure VisualizaRelatorio;
    {Executa o preview do relatório em tela}
    Procedure PreviewRelatorio;
    {Exibe o relatório de acordo com o tipo de device fazendo controle de paginação}
    Procedure MostraRelat;
    function ExportaDados( pidReport : integer) : boolean;
    // Inicio - Arnaldo V. Scarin - Sol 132513
    procedure AjustaQueryRelatorios;
    //procedure AbreQuerys; // Andre Imakawa - TIBERO
    Function AbreQuerys: Boolean;    // Andre Imakawa - TIBERO
    procedure MontaDataPipeLineSubReport;
    procedure ValidaFuncionario;
    // Robson Andrade - SOL.253577/18061 ppm.1238748 --inicio
    Procedure MontaRelatorio(tipoRel : TTipoRelatorio);
    Procedure SubstituiSQL(oSQL: String; var oSQLGuarda: String);
    // Robson Andrade - SOL.253577/18061 ppm.1238748 --fim
    // Inicio - Arnaldo V. Scarin - Sol 132513
    function MostraFormularioFiltro: TFrResult;   //William M. Santos  SOL nº 106554 KINTANA nº 492516
    function MesExtemso( mes:string):string;

  // Robson Andrade - SOL.253577/18061 ppm.1238748 --inicio
  Function TrazDados(sSessao: String; sChave : String): String;
  //Procedure ExportacaoManual;//Darivaldo Alencar SIG62683 // Alterado por FHBS - 27/03/2020 - SIG94698

  procedure SetarImpressoraComponente(sImpressoraPadrao: String; bPrintDevice: Boolean); //Darivaldo Alencar SIG62086

  public
    { Public declarations }
     ArquivoSaida    : TppArchiveDevice;
     TipoReport      : TTipoReport;
     TipoPreview     : TTipoPreview;
     TipoNomeEmpresa : TTipoNomeEmpresa;
     OutPutDevice    : TOutPutDevice;
  end;
  // Robson Andrade - SOL.253577/18061 ppm.1238748 --fim

var
  frmMostraRelat: TfrmMostraRelat;
  lReport: TppCustomReport;
  sPrinterDefault, sPrinterDefault_Aux: String; // Andre Imakawa - SIG34269
  bImprimiu: Boolean;		        // Andre Imakawa - SIG34269
implementation

uses FPreview, uString, dReports, uDataBase, DBaseDados,  FSendMail, fCmPrincipalForms,
     JclShell, registry, uCMFileUtils;

{$R *.DFM}

  // Robson Andrade - SOL.253577/18061 ppm.1238748 --inicio
Function TfrmMostraRelat.TrazDados(sSessao: String; sChave : String): String;  //Robson Andrade - SOL.253577/18061 ppm.1238748
var
  iniArq    : TIniFile;
  strRetorno: String;
begin
  iniArq     := tIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\sSQL.ini');
  strRetorno := iniArq.ReadString(sSessao,sChave,strRetorno);
  iniArq.Free;
  Result     := strRetorno;
end;
  // Robson Andrade - SOL.253577/18061 ppm.1238748 --fim

procedure TfrmMostraRelat.FormCreate(Sender: TObject);
Var sRegKeyValue,
    sRegKeyValue_aux: String; // Andre Imakawa - SIG34269
    I: Integer;                             // Andre Imakawa - SIG34269
begin
  inherited;
  Autorizacao:= TAutorizacao.Create; //Darivaldo Alencar SIG67981

  //Abre Tabelas e Inicializa Gerentes de Reports e Dataviews
  TipoPreview := tpAllPages;
  OutPutDevice := todScreen;
  TipoNomeEmpresa := tnNomeEmpresa;

  SemRelatorio := True;
  btnTelaUnica.Enabled := not SemRelatorio;

  DtmAutorizacao.MontaArvoreRelatorio(TreeReports, Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdModulo, Sistema.IdEspacesso, False, True, False);

  ArquivoSaida := TppArchiveDevice.Create(self);

  ppRegisterForm(TppCustomPreviewer, TFrmPreview);

  ppRegisterForm(TfrmSairAjuda, TFrmMostraRelat);

  RelatManual := TppReport.Create(self);
                 RelatManual.Device := dvScreen;
                 RelatManual.Language := lgPortugueseBrazil;

  RelatGerador := TppReport.Create(self);
                 RelatGerador.Device := dvScreen;
                 RelatGerador.Language := lgPortugueseBrazil;

  RelatCmReport := TppReport.Create(self);
                 RelatCmReport.Device := dvScreen;
                 RelatCmReport.Language := lgPortugueseBrazil;

  // Andre Imakawa - SIG34269 - Inicio
  if Printer.Printers.Count > 1 then
  Begin
    sRegKeyValue   := Autorizacao.ImpressoraPadraoWindows;
    sPrinterDefault:= sRegKeyValue;
    
    //Darivaldo Alencar SIG62086 -Inicio
    if not(Autorizacao.GerandoRelatorio(False)) then
       Autorizacao.ImpressoraPadrao(True, sPrinterDefault)
    else begin
      sPrinterDefault:= Autorizacao.ImpressoraPadrao(False);
      Autorizacao.ImpressoraPadrao(True, sPrinterDefault);
    end;
    //Darivaldo Alencar SIG62086 -Fim

    for I := 0 to Printer.Printers.Count - 1 do
    begin             
      if (sRegKeyValue <> Printer.Printers.Strings[I]) then
      begin
        sRegKeyValue_aux := Printer.Printers.Strings[I];
        Autorizacao.ChangeDefaultPrinter(sRegKeyValue_aux, 1); //Darivaldo Alencar SIG62086
        SetarImpressoraComponente(sRegKeyValue_aux, false);

        sPrinterDefault_Aux := sRegKeyValue_aux;
        Break;
      end;

    end;

    SetarImpressoraComponente(sPrinterDefault, true); 

    bImprimiu := False;
    Application.OnDeactivate := ApplicationDeactivate;
    Application.OnActivate := ApplicationActivate;
  end;
  // Andre Imakawa - SIG34269 - Fim
end;

//Robson Andrade - SOL.253577/18061 ppm.1238748 --inicio
//Function TfrmMostraRelat.FiltraRegistrosManual: TFrResult;
Function TfrmMostraRelat.FiltraRegistrosManual(bExporta: Boolean = False): TFrResult;
//Robson Andrade - SOL.253577/18061 ppm.1238748 --fim
var
  FrmFiltraSql: TFrmFiltraSql;
  // Rodolpho da Silva - P: - 18/04/2007
  i: integer;
Begin
     Result := FrFull;
     viIdReport:= 0; //BRUNO AZEVEDO SOL 134184 KINTANA 789338

     // Rodolpho da Silva - P: - 18/04/2007
     // Verifica se o relatório foi desenvolvido pelo Gerador de Relatórios
     //Se for, verificar se existe parâmetros na qry e se o cadastro
     //está marcado para exibir a tela de filtro. Se não estiver,
     //informar ao usuário que este relatório tem que estar marcado para exibir
     //a tela de parâmetros.
     if StrToIntDef(TreeReports.Selected.Stringdata2,0) = 0 then
     begin
        // Varre a qry
        for i := 1 to Length(SqlConsulta.Sql.Text) do
        begin
           // Se encontrar o parâmetro, informa ao usuário...
           //Robson Andrade - SOL.253577/18061 ppm.1238748 --inicio
           //if ((SqlConsulta.Sql.Text[i] = '#') and not (CdsReport.FieldByName('flgFiltroManual').AsString = 'S')) then
           if ((SqlConsulta.Sql.Text[i] = '#') and not (CdsReport.FieldByName('flgFiltroManual').AsString = 'S') ) then
           //Robson Andrade - SOL.253577/18061 ppm.1238748 --fim
           begin
               MsgDlg('Este relatório foi desenvolvido através do Gerador de Relatórios.  ' + #13 +
                      'A consulta utilizada possui parâmetros, porém no cadastro do relatório, a opção ' +
                      '"Exibe tela de filtro" não está selecionada. Para que o mesmo  ' +
                      'possa ser visualizado, é necessário que a opção esteja selecionada.',
                      'Aviso',mtWarning,[mbOk],0);
               Result := FrError;
               Exit;
           end;
        end;
     end;

     //BRUNO AZEVEDO SOL 134184 KINTANA 789338
     viIdReport:= Strtoint(TreeReports.Selected.Stringdata); //William M. Santos  SOL nº 106554 KINTANA nº 492516

     if CdsReport.FieldByName('flgFiltroManual').AsString = 'S' then
       Result := MostraFormularioFiltro;
end;


// Inicio - Arnaldo V. Scarin - Sol 132513
Function TFrmMostraRelat.MostraFormularioFiltro : TFrResult;
var oQry         : TClientDataSet;
    oSql         : TCMSqlParams;
    iCount       : Integer;
    FrmFiltraSql : TFrmFiltraSql;

  //SOL244125.18329 - Marcelo Cardoso - INICIO
    listFiltroConsulta : TStringList;
    x: Integer;

  function ConsultaRegistro(Consulta: string):boolean;
  var
  cdsAux: TClientDataSet;
  retorno : boolean;
  qryAux :TwwQuery;

  begin

    qryAux := TwwQuery.create(application);
    qryAux.DataBaseName := 'BaseDados';

    retorno := true;
    try
      try
           qryAux.close;
           qryAux.SQL.Text := Consulta;
           qryAux.Open;

         if qryAux.isEmpty then
         retorno := false;

      except
         retorno := false;

      end;
    finally
      freeAndNil(qryAux);
    end;

    result := retorno;

  end;
//SOL244125.18329 - Marcelo Cardoso - FIM

var bPula : Boolean;
    //sSqlOrigemConsulta: string; //Everson Cunha - SIG129723
begin
  Try

    //SOL244125.18329- Marcelo Cardoso - INICIO
    listFiltroConsulta := TStringList.Create;
    listFiltroConsulta.sorted := true;
    listFiltroConsulta.Duplicates := dupIgnore;
    //SOL244125.18329- Marcelo Cardoso - FIM

    Application.CreateForm(TFrmFiltraSql,FrmFiltraSql);
    FrmFiltraSql.sIdReport:= IntToStr(viIdReport);
    //For iCount := 0 to 4 doFor iCount := 0 to 4 do  //SOL244125.18329- Marcelo Cardoso
    For iCount := 0 to 6 do
    begin
      Case iCount of
        0 : begin
              FrmFiltraSql.Caption := 'Filtra Consulta Principal';
              oQry := cdsConsulta;
              oSql := SqlConsulta;
            end;
        1 : begin
              FrmFiltraSql.Caption := 'Filtra Sub Consulta 1';
              oQry := cdsSub1;
              oSql := SqlSub1;
            end;
        2 : begin
              FrmFiltraSql.Caption := 'Filtra Sub Consulta 2';
              oQry := cdsSub2;
              oSql := SqlSub2;
            end;
        3 : begin
              FrmFiltraSql.Caption := 'Filtra Sub Consulta 3';
              oQry := cdsSub3;
              oSql := SqlSub3;
            end;
        4 : begin
              FrmFiltraSql.Caption := 'Filtra Sub Consulta 4';
              oQry := cdsSub4;
              oSql := SqlSub4;
            end;
         //SOL244125.18329 - Marcelo Cardoso - INICIO
        5 : begin
              FrmFiltraSql.Caption := 'Filtra Sub Consulta 5';
              oQry := cdsSub5;
              oSql := SqlSub5;
            end;

        6 : begin
              FrmFiltraSql.Caption := 'Filtra Sub Consulta 6';
              oQry := cdsSub6;
              oSql := SqlSub6;
            end;
          //SOL244125.18329 - Marcelo Cardoso - FIM
      end;

      If oSql.Sql.Text <> '' then
      begin
        If oQry.Active Then
          oQry.Close;
        oQry.Filtered      := False;
        oQry.FilterOptions := [];
        oQry.Filter        := '';

        FrmFiltraSql.SQLOrigem.Sql.Assign(oSql.Sql);

        // Andre Imakawa - SIG129094 - Inicio
        SQLBackup.sql.Assign(oSql.Sql);
        //Everson Cunha - SIG129723 - Ini
        {sSqlOrigemConsulta := oSql.Sql.text;
        oSql.Sql.Clear;

        if viIdReport <> 4093 then
          oSql.Sql.Add('SELECT * FROM (')
        else
          oSql.Sql.Add('SELECT /'+ '*' +'+ no_pre_run_subquery *' + '/' + '* FROM (');

        oSql.Sql.Add(sSqlOrigemConsulta);
        oSql.Sql.Add(') WHERE 1=2');}

        oSql.Sql.Clear;
        oSql.Sql.Add('SELECT 1 FROM DUAL');
        //Everson Cunha - SIG129723 - Fim

        oSql.Open;

        oSql.sql.Assign(SQLBackup.Sql);
        // Andre Imakawa - SIG129094 - Fim

        FrmFiltraSql.ShowModal();
        if FrmFiltraSql.ModalResult = MrOk then
        Begin
          If oQry.Active Then
            oQry.Close;

          If FrmFiltraSql.bFiltered Then
          Begin
            oQry.Filter := FrmFiltraSql.sCondicoes;
            oQry.Filtered := True;
          End;

          oSql.SQL.Assign(FrmFiltraSql.SQLOrigem.SQL);

          //SOL244125.18329- Marcelo Cardoso - INICIO

          bSemRegistro := False;

          if (SqlConsulta.Sql.Text <> '')  then
          begin
               if not ConsultaRegistro(SqlConsulta.Sql.Text) then
                  bSemRegistro := true;
          end;
          //SOL244125.18329- Marcelo Cardoso - FIM

          Result := FrFiltrado;

          //William M. Santos  SOL nº 106554 KINTANA nº 492516 - INI
          if ExportaDados(viIdReport) then
          begin
            bbExportar.Visible := True;
            bbtnExportar.Visible := True;
            qe3dPadrao.DataSet := cdsConsulta; // passar o novo parametro aqui.
          end
          else
          begin
            bbExportar.Visible := false;
            bbtnExportar.Visible := false;
          end;
          //William M. Santos  SOL nº 106554 KINTANA nº 492516 - FIM

          If FrmFiltraSql.CkbPrinter.Checked Then
            OutPutDevice := todPrinter
          Else
            OutPutDevice := todScreen;
        End
        Else
          Result := FrError;

      end
      else
      //William Moreira da Silva - SOL 212230 KINTANA 2036837
          if FrmFiltraSql.ModalResult = MrCancel then
          begin
               Result := FrError;
               oQry := Nil;
               oSql := Nil;
          end
          else
          begin
               Result := {FrError;}FrFiltrado;//William Moreira da Silva - SOL 211165 KINTANA 2031517
               oQry := Nil;
               oSql := Nil;
          end;
          //William Moreira da Silva - SOL 212230 KINTANA 2036837
      If CdsReport.FieldByName('FLGSUBREPORT').asString <> 'S' then
        Break;
    end;

    FrmFiltraSql.Free;

  Except
    If oQry.Active Then
      oQry.Close;
    oQry.Filtered := False;
    oQry.FilterOptions := [];
    oQry.Filter := '';
    Result := FrError;

    FrmFiltraSql.Free;
  End;
end;


Procedure TFrmMostraRelat.AjustaQueryRelatorios;
begin
  RelatManual.CloseDataPipelines;
  SqlConsulta.Sql.Clear;
  //Marilza Colpani - SOL 60478 /KTN 523185 - Início
  //Alterado a propriedade Text para Add, pois não estava efetuando a quebra de linhas.
  SqlConsulta.Sql.Add(CdsReport.FieldByName('DATAVIEWTEMPLATE').AsString); //Marilza
  //SqlConsulta.Sql.Text := CdsReport.FieldByName('DATAVIEWTEMPLATE').AsString;
  If CdsReport.FieldByName('FLGSUBREPORT').asString = 'S' then
  begin
    SqlSub1.Sql.Clear;
    //SqlSub1.Sql.Text := CdsReport.FieldByName('DATAVIEWTEMPLATESUB1').AsString;
    if Trim(CdsReport.FieldByName('DATAVIEWTEMPLATESUB1').AsString) <> '' then  //Thaise - 10/08/2010
      SqlSub1.Sql.Add(CdsReport.FieldByName('DATAVIEWTEMPLATESUB1').AsString);
    SqlSub2.Sql.Clear;
    //SqlSub2.Sql.Text := CdsReport.FieldByName('DATAVIEWTEMPLATESUB2').AsString;
    if Trim(CdsReport.FieldByName('DATAVIEWTEMPLATESUB2').AsString) <> '' then  //Thaise - 10/08/2010
      SqlSub2.Sql.Add(CdsReport.FieldByName('DATAVIEWTEMPLATESUB2').AsString);
    SqlSub3.Sql.Clear;
    //SqlSub3.Sql.Text := CdsReport.FieldByName('DATAVIEWTEMPLATESUB3').AsString;
    if Trim(CdsReport.FieldByName('DATAVIEWTEMPLATESUB3').AsString) <> '' then  //Thaise - 10/08/2010
      SqlSub3.Sql.Add(CdsReport.FieldByName('DATAVIEWTEMPLATESUB3').AsString);
    SqlSub4.Sql.Clear;
    //SqlSub4.Sql.Text := CdsReport.FieldByName('DATAVIEWTEMPLATESUB4').AsString;
    if Trim(CdsReport.FieldByName('DATAVIEWTEMPLATESUB4').AsString) <> '' then  //Thaise - 10/08/2010
      SqlSub4.Sql.Add(CdsReport.FieldByName('DATAVIEWTEMPLATESUB4').AsString);
    //Marilza Colpani - SOL 60478 /KTN 523185 - Fim

    //SOL244125.18329 - Marcelo Cardoso - INICIO
    SqlSub5.Sql.clear;
    if Trim(CdsReport.FieldByName('DATAVIEWTEMPLATESUB5').AsString) <> '' then
      SqlSub5.Sql.Add(CdsReport.FieldByName('DATAVIEWTEMPLATESUB5').AsString);

    SqlSub6.Sql.clear;
    if Trim(CdsReport.FieldByName('DATAVIEWTEMPLATESUB6').AsString) <> '' then
      SqlSub6.Sql.Add(CdsReport.FieldByName('DATAVIEWTEMPLATESUB6').AsString);
    //SOL244125.18329 - Marcelo Cardoso - FIM
  end;

end;

//Procedure TFrmMostraRelat.AbreQuerys; // Andre Imakawa - TIBERO
Function TFrmMostraRelat.AbreQuerys: Boolean;
//Darivaldo Alencar SIG67981 -inicio
//var
  // Luiz Carlos - SIG56322 - Inicio
//  i: Integer;
//  qry: TwwQuery;
//  cds2: tclientdataset;
  // Luiz Carlos - SIG56322 - Fim
//Darivaldo Alencar SIG67981 -fim
begin

  // Andre Imakawa - Tibero - Inicio
  Result:= True;
  try
    // Andre Imakawa - SIG 66116 - Incio
    //if (viIdReport <> 4234) and (viIdReport <> 2095) then  // Andre Imakawa - SIG 67223 // Andre Imakawa - SIG 77327
    //if (viIdReport <> 4234) then  // Andre Imakawa - SIG 77327
    //if (viIdReport <> 4234) and (viIdReport <> 4283) then  // WO8290 Ferrari  //edilaine WO38027
    if (CdsReport.FieldByName('FLGUSARADO').asString = 'N') then                //edilaine WO38027
      SqlConsulta.Open;
    // Andre Imakawa - SIG 66116 - Fim
  except  on e: exception do
    begin
      if pos('Invalid month value',e.message) <= 0 then
        raise exception.create('ERROR: '+ e.message)
      else
        MsgDlg( 'Não existem informações a serem exibidas.', 'Atenção', MtInformation, [MbOk], 0 );
      Result := False;  
    end;
  end;
  // Andre Imakawa - Tibero - Fim

  If CdsReport.FieldByName('FLGSUBREPORT').asString = 'S' then
  begin
    If sqlSub1.Sql.Text <> '' then
      sqlSub1.Open;
    If sqlSub2.Sql.Text <> '' then
      sqlSub2.Open;
    If sqlSub3.Sql.Text <> '' then
      sqlSub3.Open;
    If sqlSub4.Sql.Text <> '' then
      sqlSub4.Open;
    //SOL244125.18329 - Marcelo Cardoso - INICIO
    If sqlSub5.Sql.Text <> '' then
      sqlSub5.Open;
    If sqlSub6.Sql.Text <> '' then
      sqlSub6.Open;
    //SOL244125.18329 - Marcelo Cardoso - FIM
  end;

  // Andre Imakawa - SIG 66116 - Incio
  //if (viIdReport = 4234) or (viIdReport = 2095) then // Andre Imakawa - SIG 67223 // Andre Imakawa - SIG 77327
  //if (viIdReport = 4234) then // Andre Imakawa - SIG 77327
  //if (viIdReport = 4234) or (viIdReport = 4283) then // WO8290 Ferrari      //edilaine WO38027
  if (CdsReport.FieldByName('FLGUSARADO').asString = 'S') then                //edilaine WO38027
  begin
//Darivaldo Alencar SIG67981 -inicio
// Luiz Carlos - SIG56322 - Inicio
//    try
//       qry:= TwwQuery.create(nil);
//       qry.databasename:='BaseDados';
//
//       FazQuery(qry,SqlConsulta.SQL.text);
//       cds2:= tclientdataset.create(nil);
//
//       for i:= 0 to qry.FieldCount-1 do
//          cds2.FieldDefs.Add(qry.Fields[i].FieldName,qry.Fields[i].DataType,qry.Fields[i].Size,false);
//
//      cds2.CreateDataSet;
//
//      while not(qry.eof) do
//      begin
//         CdsConsulta.Insert;
//         for i:= 0 to qry.FieldCount-1 do
//            cds2.fields[i].asString:= qry.fields[i].asString;
//         CdsConsulta.Post;
//
//        qry.next;
//      end;

//      CdsConsulta.Data := cds2.Data;
//    finally
//       FreeAndNil(cds2);
//       FreeAndNil(qry);
//    end;
// Luiz Carlos - SIG56322 - fim

   with qryADO do
     begin
       Close;
       ConnectionString := Autorizacao.getStringConexaoADO;
       SQL.clear;
       SQL.add(SqlConsulta.SQL.text);
       Open;
     end;
      DsSql.DataSet:= qryADO;
  end
  // Andre Imakawa - SIG 66116 - Fim
  else DsSql.DataSet:= cdsConsulta;
//Darivaldo Alencar SIG67981 -Fim

end;

Procedure TFrmMostraRelat.MontaDataPipeLineSubReport;
var lReports: TStringList;
    liReport: Integer;
begin
  lReports := TStringList.Create;

  // Relatorio Manual (mostrado na tela)
  RelatManual.GetSubReports(lReports);

  lReports.Sort;

  for liReport := 0 to lReports.Count - 1 do
  begin
    lReport := TppCustomReport(lReports.Objects[liReport]);
    Case liReport  of
      0: lReport.DataPipeline := SubConsulta1;
      1: lReport.DataPipeline := SubConsulta2;
      2: lReport.DataPipeline := SubConsulta3;
      3: lReport.DataPipeline := SubConsulta4;
      4: lReport.DataPipeline := SubConsulta5; //SOL244125.18329 - MARCELO CARDOSO
      5: lReport.DataPipeline := SubConsulta6; //SOL244125.18329 - MARCELO CARDOSO

    end;
  end;

  lReports.Free;
end;
// Final - Arnaldo V. Scarin - Sol 132513

Procedure TfrmMostraRelat.VisualizaRelatorio;
Var
  Mostra: boolean;
  dtm: TdtmReports;
  sMensagem: String;
  aStrReports: TMemoryStream;
  //Robson Andrade - SOL.253577/18061 ppm.1238748--inicio
  bExporta   : Boolean;
  sSQL       : string;
begin
    bExportar := False;
    bExporta := False; // Peterson Victor - SIG23984

    //Robson Andrade - SOL.253577/18061 ppm.1238748--fim
    with CdsReport do
    begin

         TipoPreview := TpAllPages;
         OutPutDevice := todScreen;

         If (TreeReports.Selected <> Nil) and (TreeReports.Selected.ImageIndex = 1) Then
         begin
              If (Application.MainForm Is TfrmCMPrincipalForms) And
                 (TfrmCMPrincipalForms(Application.MainForm).AppPadrao.PrintReportPadrao(SQLReport.Params[0].AsInteger,'')) Then
                 TipoReport := trFCmReport
              Else
                 If (UPPERCASE(TRIM(FieldByName('CLASSNAME').AsString)) = 'TDVQRYMANUAL') Or
                    (UPPERCASE(TRIM(FieldByName('CLASSNAME').AsString)) = 'TDVQUERYWZD') Then
                    TipoReport := trQryManual
                 else
                    if TRIM(FieldByName('CLASSNAME').AsString) = '' Then
                         TipoReport := trDataModulo
                    else
                       TipoReport := trGerador;

              dtm := nil;

              case TipoReport of
                   trQryManual: AjustaQueryRelatorios;

                   trDataModulo:
                   begin
                        try
                           sMensagem := 'Não encontrei o Report: '+
                                        UPPERCASE(FieldByName('ppReport').AsString)+
                                        ' em '+ UPPERCASE(FieldByName('FORMEVENTOS').AsString)+#10#13+
                                        'Possivelmente os dados cadastrados na tabela "REPORTS" estão desatualizados';

                           dtm := TdtmReports(Application.FindComponent(FieldByName('FORMEVENTOS').AsString));
                           //Robson Andrade - SOL.253577/18061 ppm.1238748 --inicio
                           if FieldByName('ppReport').AsString = 'rpRel' then
                             begin
                               bExporta := True;
                               bExportar := bExporta;
                               if CdsReport.FieldByName('FORMEVENTOS').AsString = 'dtmParamRelMovContrib' then
                                 tipoRelat := trContabil
                               else
                                 tipoRelat := trFinanceiro;
                             end;
                             //Robson Andrade - SOL.253577/18061 ppm.1238748 --fim
                           ppViewer1.Report := TppReport(dtm.FindComponent(FieldByName('ppReport').AsString));

                           If (upperCase(ppViewer1.Report.ClassName) <> 'TPPREPORT') Then
                           Begin
                              sMensagem := 'O componente cadastrado no banco "' + FieldByName('ppReport').AsString + '" não é um componente de Relatório. Verifique.';
                              Abort;
                           End;

                           ppViewer1.Report.Device := dvScreen;
                           ppViewer1.Report.Language := lgPortugueseBrazil;
                        except
                              MsgDlg(sMensagem, 'Relatorios com eventos', mtError, [mbOK],0);
                              exit;
                        end;
                   end;

                   trFCmReport:
                   Begin

                   End;
              end;

              Caption := 'Visualizar Relatórios ' +  TreeReports.Selected.Text +
                         ' - ' + TreeReports.Selected.Stringdata + '\' + TreeReports.Selected.Stringdata2 ;
              Mostra := false;

              case TipoReport of
                   trQryManual  :
                   Begin
                     Mostra  := (FiltraRegistrosManual <> FrError);

                     If Mostra Then
                       with RelatManual do
                       begin
                         Try
                         
                           // Andre Imakawa - TIBERO - Inicio
                           // Arnaldo V. Scarin - Sol 132513
                           if not AbreQuerys then
                             exit;
                           // Andre Imakawa - TIBERO - Fim

                           aStrReports := TMemoryStream.Create;

                           aStrReports.Clear;
                           TBlobField(CdsReport.FieldByName('REPORTTEMPLATE')).SaveToStream(aStrReports);

                           aStrReports.Position := 0;
                           Template.LoadFromStream(aStrReports);

                           AllowPrintToArchive := True;
                           AllowPrintToFile := True;

                           DataPipeline := Consulta;

                           If CdsReport.FieldByName('FLGSUBREPORT').asString = 'S' then
                             MontaDataPipeLineSubReport;

                         finally
                           aStrReports.Free;
                         end;
                       End;
                   End;
                   trDataModulo :
                        begin
                            bExporta:= ExportaDados(Strtoint(TreeReports.Selected.Stringdata)); //SIG90059
                           // Robson Andrade - SOL.253577/18061 ppm.1238748 --inicio
                            if bExporta then
                            begin
                              viIdReport:= Strtoint(TreeReports.Selected.Stringdata); //William M. Santos  SOL nº 106554 KINTANA nº 492516
                              Mostra := dtm.MostraParam(CdsReport.FieldByName('FORMPARAMREL').AsString); //Robson Andrade  - SOL.253577/18061 ppm.1238748
                              if Mostra then
                                begin
                                  //Robson Andrade - SOL.253577/18061 ppm.1238748 --inicio
                                  bbtnExportar.Visible := Mostra;
                                  bbExportar.Visible   := Mostra;
                                  //Robson Andrade - SOL.253577/18061 ppm.1238748 --fim
                                  MostraRelat;
                                end;


                              Exit;
                            end else
                            Mostra := (FiltraRegistrosManual(bExporta) <> FrError) And
                                      dtm.MostraParam(CdsReport.FieldByName('FORMPARAMREL').AsString);
                           //Robson Andrade - SOL.253577/18061 ppm.1238748 --fim
                        end;
              end;


              if Mostra then
              Begin
                //SOL244125.18329 - Marcelo Cardoso - INICIO
                // Andre Imakawa - SIG 42704 - Inicio
                if assigned(cdsConsulta) then
                  if cdsConsulta.active then
                    if cdsConsulta.recordcount = 0 then
                      MsgDlg( 'Não existem informações a serem exibidas.', 'Atenção', MtInformation, [MbOk], 0 );
                MostraRelat;
                // Andre Imakawa - SIG 42704 - Fim

              end;
                //SOL244125.18329 - Marcelo Cardoso - FIM


              SemRelatorio := (ppViewer1.Report = nil);
              btnTelaUnica.Enabled := not SemRelatorio;
         end;
    end;
End;

procedure TfrmMostraRelat.BtnVisualizarClick(Sender: TObject);
begin
  inherited;
  If (TreeReports.Selected <> Nil) And (TreeReports.Selected.ImageIndex = 1) Then
     VisualizaRelatorio;
end;

procedure TfrmMostraRelat.spbPreviewWidthClick(Sender: TObject);
begin
  inherited;
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zsPageWidth;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end;

procedure TfrmMostraRelat.spbPreview100PercentClick(Sender: TObject);
begin
  inherited;
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zs100Percent;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end;

procedure TfrmMostraRelat.spbPreviewWholeClick(Sender: TObject);
begin
  inherited;
  ChangeZoom := False;
  ppViewer1.ZoomSetting := zsWholePage;
  SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
  ChangeZoom := True;
end;

procedure TfrmMostraRelat.SpinEdit1Change(Sender: TObject);
begin
  inherited;
  If Not ChangeZoom Then Exit;
  ppViewer1.ZoomPercentage := StrToIntDef(SpinEdit1.Text,100);
end;

procedure TfrmMostraRelat.SpBrnFirstPageClick(Sender: TObject);
begin
  inherited;
  ppViewer1.FirstPage;
end;

procedure TfrmMostraRelat.SpBtnPriorPageClick(Sender: TObject);
begin
  inherited;
  ppViewer1.PriorPage;
end;

procedure TfrmMostraRelat.SpBtnNextPageClick(Sender: TObject);
begin
  inherited;
  ppViewer1.NextPage;
end;

procedure TfrmMostraRelat.SpBtnLastPageClick(Sender: TObject);
begin
  inherited;
  ppViewer1.LastPage;
end;

procedure TfrmMostraRelat.ppViewer1PageChange(Sender: TObject);
begin
  inherited;
  If not SemRelatorio Then
  begin
     If (ppViewer1.Report is TppReport) Then
     Begin
        LblPreviewPage.Caption := 'Pág. ' + IntToStr((ppViewer1.Report as TppReport).AbsolutePageNo) + ' de ' +
        IntToStr((ppViewer1.Report as TppReport).AbsolutePageCount);
     End
     Else
     Begin
        LblPreviewPage.Caption := 'Pág. ' + IntToStr((ppViewer1.Report as TppArchiveReader).ArchivePageNo) + ' de ' +
        IntToStr((ppViewer1.Report as TppArchiveReader).ArchivePageCount);
     End;

     ChangeZoom := False;
     SpinEdit1.Text := IntToStr(ppViewer1.CalculatedZoom);
     ChangeZoom := True;
  end;
end;

procedure TfrmMostraRelat.ppViewer1PrintStateChange(Sender: TObject);
var
  lPosition: TPoint;
begin
  inherited;

  if ppViewer1.Busy then
     ppViewer1.Cursor := crHourGlass
  else
      ppViewer1.Cursor := crDefault;

  GetCursorPos(lPosition);
  SetCursorPos(lPosition.X, lPosition.Y);
end;


procedure TfrmMostraRelat.FormDestroy(Sender: TObject);
begin
     ArquivoSaida.Free;
     ppUnRegisterForm(TppCustomPreviewer);
     ppUnRegisterForm(TfrmSairAjuda);
     RelatManual.free;
     RelatGerador.free;
     RelatCmReport.free;
     Autorizacao.free;  //Darivaldo Alencar SIG67981
     inherited;
end;

Procedure TfrmMostraRelat.PreviewRelatorio;
var
   LastState : TWindowState ;
   OldCachePages :Boolean;
begin
   inherited;
   OldCachePages := TppReport(ppViewer1.Report).CachePages;

   try
      Screen.Cursor := crHourGlass ;
      LastState := WindowState ;
      ArquivoSaida.FileName := NomeArqTemp;
      ArquivoSaida.Publisher := ppViewer1.Report.Publisher ;

      ppViewer1.Report.ResetDevices;

      TppReport(ppViewer1.Report).CachePages  := False;

      ppViewer1.Report.PrintToDevices;
      TfrmPreview.CreatePreview(Self, ArquivoSaida.FileName, TreeReports.Selected.Text );
      ArquivoSaida.Publisher := nil ;
      WindowState := LastState;
   finally
       Screen.Cursor := crDefault ;
       TppReport(ppViewer1.Report).CachePages := OldCachePages;
   end;
End;

Procedure TfrmMostraRelat.MostraRelat;
begin
  case TipoReport of
    trQryManual: ppViewer1.Report := RelatManual;
    trGerador: ppViewer1.Report := RelatGerador;
    trFCmReport: Exit;
  end;

  SemRelatorio := false;
  btnTelaUnica.Enabled := not SemRelatorio;

  ppViewer1.Report.ResetDevices;

  If OutPutDevice = todScreen Then
  Begin
    Try// Robson Andrade - SOL.253577/18061 ppm.1238748 -inicio - somente try  execept
      ppViewer1.Report.PrintToDevices;
      Case TipoPreview Of
        tpAllPages:
        Begin
           ppViewer1.LastPage;
           ppViewer1.FirstPage;
        end;
        tpLastPage:
         ppViewer1.LastPage;
      End;
    except
    end;// Robson Andrade - SOL.253577/18061 ppm.1238748 --fim
  End
  Else
  Begin
    ppViewer1.Report.Device := dvPrinter;
    ppViewer1.Report.Print;
    ppViewer1.Report.Device := dvScreen;
  End;

  TipoPreview := tpAllPages;
  OutPutDevice := todScreen;
end;

procedure TfrmMostraRelat.bbtnExportarClick(Sender: TObject);
begin
  inherited;
  if opnReport.Execute then
     TfrmPreview.CreatePreview(Application.MainForm, opnReport.FileName, opnReport.FileName);
end;

procedure TfrmMostraRelat.bbtnSalvarClick(Sender: TObject);
begin
     inherited;
     if svReport.Execute then
     begin
          try
            Screen.Cursor := crHourGlass ;
            ArquivoSaida.FileName := svReport.FileName;
            ArquivoSaida.Publisher := ppViewer1.Report.Publisher ;
            ppViewer1.Report.ResetDevices;
            ppViewer1.Report.PrintToDevices;
            ArquivoSaida.Publisher := nil ;
          finally
             Screen.Cursor := crDefault ;
          end;
     end;
end;

procedure TfrmMostraRelat.btnTelaUnicaClick(Sender: TObject);
begin
  inherited;
  PreviewRelatorio;
end;

procedure TfrmMostraRelat.TreeReportsDblClick(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  If Node <> nil Then
     If Node.ImageIndex = 1 Then
        VisualizaRelatorio;
end;

procedure TfrmMostraRelat.TreeReportsChange(TreeView: TfcCustomTreeView;
  Node: TfcTreeNode);
Var
 iIdReport, iOrigemCM: LongInt;
begin
  inherited;
  //William M. Santos  SOL nº 106554 KINTANA nº 492516 - INI
  if bbExportar.Visible and bbtnExportar.Visible then
  begin
    bbExportar.Visible := false;
    bbtnExportar.Visible := false;
  end;
  //William M. Santos  SOL nº 106554 KINTANA nº 492516 - FIM

  If (Node <> Nil) And (Node.ImageIndex = 1) Then
  Begin
       iIdReport := StrToInt(Node.Stringdata);
       iOrigemCM := StrToInt(Node.Stringdata2);
       With SQLReport Do
       Begin
          Prepare;
          Params[0].AsInteger := iIdReport;
          Params[1].AsInteger := iOrigemCM;
          Open;

          MemHistorico.Lines.Clear;

          if Not CdsReport.IsEmpty then
          Begin
             MemHistorico.Lines.Add('Relatório. Nº ' + Node.Stringdata + '\' + Node.Stringdata2);
             MemHistorico.Lines.Add(CdsReport.FieldByName('DESCRIPTION').AsString);
          End;

          BtnVisualizar.Enabled := true;
       End;

       //Everson Luiz - SIG TIBERO - Início
       //William Moreira da Silva - SOL 260951 PPM 1050490
       //  If (CdsReport.FieldByName('IDREPORTS').asInteger = 1270) and (CdsReport.FieldByName('ORIGEMCM').asInteger = 0) then
       // begin
       //      dtmBaseDados.dbBaseDados.Execute(' alter session set optimizer_features_enable=''9.2.0'' ');
       // end;
       //William Moreira da Silva - SOL 260951 PPM 1050490
       //Everson Luiz - SIG TIBERO - Fim
       
  End
  else
      BtnVisualizar.Enabled := false;
end;

procedure TfrmMostraRelat.BtnGoToPageClick(Sender: TObject);
Var
  sPageNumber :String;
begin
  inherited;
  sPageNumber := '1';
  If InputQuery('Visualizar Relatórios','Ir para a página nº',sPageNumber) Then
     ppViewer1.GotoPage(StrToIntDef(sPageNumber,1));
end;

procedure TfrmMostraRelat.btnSendMailClick(Sender: TObject);
begin
  inherited;
  If Assigned(ppViewer1.Report) Then
     With TFrmSendMail.Create(Self) Do
       Try
          sNomeRelat := TreeReports.Selected.Text;
          appViewer := ppViewer1;
          ArquivoRpt := ArquivoSaida;
          if (viIdReport = 4074) then  //Darivaldo Alencar SIG62683
            cdsExport := cdsConsulta;  //Darivaldo Alencar SIG62683
          ShowModal;
       finally
          Free;
       end;
end;

procedure TfrmMostraRelat.MnuImprimirClick(Sender: TObject);
Var
  sAreaderFile: String;
  RegPdf: TRegistry;
begin
  inherited;
  If Assigned(ppViewer1.Report) Then
  Begin
    sAreaderFile := '';
    RegPdf:=TRegistry.Create;
    try
      RegPdf.RootKey:=HKEY_LOCAL_MACHINE;
      RegPdf.OpenKey('Software\CM\' + Sistema.NomeModulo,True);
      sAreaderFile := RegPdf.ReadString('Acrobat Reader File');

      If sAreaderFile = '' Then
      Begin
         If DlgAreade.Execute Then
         Begin
            sAreaderFile := DlgAreade.FileName;
            RegPdf.WriteString('Acrobat Reader File',sAreaderFile);
         End
         Else
           Abort;
      End;

      Screen.Cursor := crHourGlass ;
      ppViewer1.Report.TextFileName := Sistema.TempDir + IntToStr(GetTickCount) + '.pdf';
      ppViewer1.Report.AllowPrintToFile := True;
      ppViewer1.Report.ShowPrintDialog := False;
      ppViewer1.Report.DeviceType :='PDFFile';
      ppViewer1.Report.Print;

      ShellExecAndWait(sAreaderFile,'/p ' + ppViewer1.Report.TextFileName);

    finally
      RegPdf.CloseKey;
      RegPdf.Free;
      ppViewer1.Report.ShowPrintDialog := True;
      ppViewer1.Report.DeviceType := 'Screen';
      Screen.Cursor := crDefault;
      DeleteFile(ppViewer1.Report.TextFileName);
    end;
  end;
end;

procedure TfrmMostraRelat.MnuVisualizarClick(Sender: TObject);
begin
  inherited;
  If Assigned(ppViewer1.Report) Then
    try
      Screen.Cursor := crHourGlass ;
      ppViewer1.Report.TextFileName := Sistema.TempDir + IntToStr(GetTickCount) + '.pdf';
      ppViewer1.Report.AllowPrintToFile := True;
      ppViewer1.Report.ShowPrintDialog := False;
      ppViewer1.Report.DeviceType :='PDFFile';
      ppViewer1.Report.Print;

      ShellExecAndWait(ppViewer1.Report.TextFileName);
    finally
      ppViewer1.Report.ShowPrintDialog := True;
      ppViewer1.Report.DeviceType := 'Screen';
      Screen.Cursor := crDefault;
      DeleteFile(ppViewer1.Report.TextFileName);
    end;
end;

procedure TfrmMostraRelat.bbExportarClick(Sender: TObject);
//Robson Andrade - SOL.253577/18061 ppm.1238748 --inicio

var
  iCount : Integer;
  sNovoSQL : string;
  sSql     : string;
begin
  inherited;

    if bExportar then
       MontaRelatorio(tipoRelat)
  //BRUNO AZEVEDO SOL 134184 KINTANA 789338
  else
  //Robson Andrade - SOL.253577/18061 ppm.1238748 --fim

  if not (cdsConsulta.IsEmpty) then begin
    if viIdReport = 4124 then
        ValidaFuncionario;

    // Alterado por FHBS - 27/03/2020 - SIG94698
    // Parametro de verificação passado para o banco.
    if (Trim(cdsReport.FieldByName('FLGEXPORTAMANUAL').AsString) = 'S') then
    begin
      fmQrExportD := TfmQrExportD.Create(nil);

      if (Trim(cdsReport.FieldByName('FLGEXPORTAMANUALSUB').AsString) = 'S') then
        fmQrExportD.DataSet(cdsConsulta, viIdReport, cdsSub1, cdsSub2, cdsSub3, cdsSub4, cdsSub5, cdsSub6)
      else
        fmQrExportD.DataSet(cdsConsulta, viIdReport);

      fmQrExportD.ShowModal;
      FreeAndNil(fmQrExportD);
    end {
    //SIG82210 -inicio
    //Darivaldo Alencar SIG62683 -inicio
    //if (viIdReport = 4074) then
    if (viIdReport = 4074)or
	   (viIdReport = 2114) or (viIdReport = 1270)
    //SIG82210 -fim
		or (viIdReport = 4430) //SIG87517
		or (viIdReport = 4421) //Taffarel - SIG86348
    then
      ExportacaoManual
    } // Fim - Alterado por FHBS - 27/03/2020 - SIG94698
    else
    //Darivaldo Alencar SIG62683 -fim

    qe3dPadrao.Execute;
  end else begin
    if (TipoReport <> trDataModulo) then //SIG90059
       MsgDlg('Não existem informações a serem exportadas!','Aviso', mtInformation, [mbOk], 0)

    //SIG90059 -Inicio
    else begin
      // 101433 : inicio
      // Parametro de verificação passado para o banco.
      if (Trim(cdsReport.FieldByName('FLGEXPORTAMANUAL').AsString) = 'S') then
      begin
        fmQrExportD := TfmQrExportD.Create(nil);

        //edilaine SIG103891 : inicio
        if (Trim(cdsReport.FieldByName('FLGEXPORTAMANUALSUB').AsString) = 'S') then
          fmQrExportD.DataSet(TppBDEPipeline(TppReport(ppViewer1.Report).DataPipeline).DataSource.DataSet, viIdReport,
                              dsSub1.DataSet, dsSub2.DataSet, dsSub3.DataSet, dsSub4.DataSet, dsSub5.DataSet, dsSub6.DataSet )
        else
          fmQrExportD.DataSet(TppBDEPipeline(TppReport(ppViewer1.Report).DataPipeline).DataSource.DataSet, viIdReport);
        //edilaine SIG103891 : fim

        fmQrExportD.ShowModal;
        FreeAndNil(fmQrExportD);
      end
      else
      begin
        qe3dPadrao.DataSet := TppBDEPipeline(TppReport(ppViewer1.Report).DataPipeline).DataSource.DataSet;
        qe3dPadrao.Execute;
      end;
      // 101433 : fim
    end;
    //SIG90059 -Fim
  end;
end;

//BRUNO AZEVEDO SOL 134184 KINTANA 789338
function TfrmMostraRelat.ExportaDados(pidReport: integer): boolean;
var
  xQryExportaDados : TQuery;
begin
  try
    xQryExportaDados := TQuery.Create(Self);
    with xQryExportaDados do begin
      DataBaseName := 'BaseDados';
      Close;
      SQL.Clear;
      SQL.Add('SELECT FLGEXPORTADADOS');
      SQL.Add('  FROM REPORTS');
      SQL.Add(' WHERE IDREPORTS = '+IntToStr(pidReport));
      if (TipoReport <> trDataModulo) then //SIG90059
        begin
          //SQL.Add('   AND IDMODULO  = '+IntToStr(Sistema.IdModulo));  //William Santana - SOL 268092 PPM 1246018
          SQL.Add('   AND ORIGEMCM  = 0');
        end
      else SQL.Add('   AND IDMODULO  = ' + IntToStr(Sistema.IdModulo)); //SIG90059
      Open;

      Result := (FieldByName('FLGEXPORTADADOS').asString = 'S');
    end;
  finally
    FreeAndNil(xQryExportaDados);
  end;
end;
//BRUNO AZEVEDO SOL 134184 KINTANA 789338

procedure TfrmMostraRelat.ValidaFuncionario;
var sNome :string;
    //sqlSub5: TwwQuery;
begin
   try
      //sqlSub5.sql.clear; //SOL244125.18329 - Marcelo Cardoso
      sqlDub5.sql.clear;   //SOL244125.18329 - Marcelo Cardoso
      sNome := ' SELECT SUB.* FROM ( ';
      sNome := sNome +SqlConsulta.sql.text;
      sNome := sNome + ('   ) SUB,     '+
                       ' FUNCIONARIO F, '+
                       ' USUARIOSISTEMA U '+
                       ' WHERE U.NOMEUSUARIO = SUB.NOMEUSUARIO '+
                       ' AND F.IDPESSOA = U.IDUSUARIO '+
                       ' AND F.DATADESLIGAMENTO IS NULL ');
      //sqlSub5.sql.Add(sNome); //SOL244125.18329 - Marcelo Cardoso - INICIO
      //sqlSub5.open;
      sqlDub5.sql.Add(sNome);
      sqlDub5.open;
      //SOL244125.18329 - Marcelo Cardoso - FIM
      qe3dPadrao.DataSet :=  cdsDub5;
      qe3dPadrao.Header.Add('FUNCEF - FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS');
      qe3dPadrao.Header.Add('AUDITORIA PROCESSO DE PAGAMENTO DE BENEFÍCIOS E PENSÕES');
      qe3dPadrao.Header.Add('1.5 - RELAÇÃO DE TODOS OS USUÁRIOS QUE ESTÃO ATIVOS NO SISTEMA DE PLANUS - MÓDULO PAGAMENTO DE BENEFÍCIOS');
      qe3dPadrao.Header.Add('REFERÊNCIA: '+ MesExtemso(formatDateTime('mm',now))+' '+formatDateTime('yyyy',now));
      qe3dPadrao.Header.Add('FONTE: PLANUS');
      qe3dPadrao.AllowedExports := [aeXLS,aeTXT,aeCSV];
      qe3dPadrao.CommonOptions  := [coFields,coColons];
   except
     MsgDlg('Ocorreu erro na geração ou gravação de dados, entre em contato com o Analista responsável!', 'Informação', mtInformation, [mbOk], 0);
     Exit;
   end;
end;

function TfrmMostraRelat.MesExtemso(mes: string): string;
begin
  if StrToInt(mes) = 1 then
     result := 'JANEIRO'
  else if StrToInt(mes) = 2 then
    result := 'FEVEREIRO'
  else if StrToInt(mes) = 3 then
    result := 'MARÇO'
  else if StrToInt(mes) = 4 then
    result := 'ABRIL'
  else if StrToInt(mes) = 5 then
    result := 'MAIO'
  else if StrToInt(mes) = 6 then
    result := 'JUNHO'
  else if StrToInt(mes) = 7 then
    result := 'JULHO'
  else if StrToInt(mes) = 8 then
    result := 'AGOSTO'
  else if StrToInt(mes) = 9 then
    result := 'SETEMBRO'
  else if StrToInt(mes) = 10 then
    result := 'OUTUBRO'
  else if StrToInt(mes) = 11 then
    result := 'NOVEMBRO'
  else if StrToInt(mes) = 12 then
    result := 'DEZEMBRO';
end;

procedure TfrmMostraRelat.bbtnAjudaClick(Sender: TObject);
begin
  inherited;
  //SOL 148922/8841 - Jonas
  if  (Sistema.IdModulo        = 15)  then
      begin
           Application.HelpContext(230030)
      end;
end;


//Robson Andrade - SOL.253577/18061 ppm.1238748 - inicio
//Expostação de relatórios para excel dParamRelMovContrib, dParamRelfinanc
procedure TfrmMostraRelat.MontaRelatorio(tipoRel : TTipoRelatorio);
var
   qryRelat       : TwwQuery;
   iCount         : Integer;
   sPeriodoRef    : string;
   sPeriodoCob    : string;
   sPatroSel      : string;
   sPlanosSel     : string;
   sMatricula     : String;
   sNome          : String;
   sGrupo         : string;
   sNDocumento    : string;
   iLinhaGrupo    : Integer;
   dTotalRecebido : Double;
   dTotalAlterador: Double;
   dTotalEsperado : Double;
   iTotal         : Integer;
   sArquivo       : string;
   iTotaliza      : Integer;
   sMensagem      : string;
   sResult        : string;
   sDataBaseTela  : string;
   wDia,wMes,wAno : Word;
   tVar           : Array of String;
   sAgora         : String;
   oDia,oMes,oAno : string;
   sColunaFim     : String;
   sTitulo        : string;
   sDocumento     : string;
   intIdAnterior  : Integer;
   sPlanoAnterior : string;
   aQry           : TwwQuery;
   slPrint        : TStringList;
   iPosicao       : Integer;


   function LeSQL(sArquivo: String): string;
   var
     arq: TextFile; // declarando a variável "arq" do tipo arquivo texto
     linha: string;
     sqlResult : string;
   begin
     sqlResult :='';
     AssignFile(arq,sArquivo); {$I-} // desativa a diretiva de Input
     // [ 3 ] Abre o arquivo texto para leitura {$I+} // ativa a diretiva de Input
     Reset(arq);
     if (IOResult <> 0) then
       ShowMessage('Erro na abertura do arquivo !!!')
     else
     begin
       while (not eof(arq)) do
       begin
        readln(arq, linha);
        sqlResult := sqlResult + linha;
       end;
       CloseFile(arq);
     end;
     Result := sqlResult;
   end;

   Function iif(bCondicao : Boolean; SeVerdadeiro,SeFalso : Variant):Variant;
   begin
     if bCondicao then
       Result := SeVerdadeiro
     else
       Result := SeFalso;
   end;

   Function GetMatriculaNome(sMatricula: string):string;
   begin
     sResult := '';
     Try
       aQry := TwwQuery.Create(Self);
       aQry.DatabaseName := 'BaseDados';
       aQry.SQL.Clear;
       aQry.sql.Add(' SELECT P.NOME, E.MATRICULA FROM PESSOA P INNER JOIN ELEGPATRO E ON ');
       aQry.sql.Add('((P.IDPESSOA = E.IDPESSOA) AND (E.MATRICULA = '+ QuotedStr(sMatricula) + '))');
       aQry.Open;
       sResult   := aQry.FieldByName('MATRICULA').AsString + ' - ' + aQry.FieldByName('NOME').AsString;
       aQry.Close;
     Finally
       if Assigned(aQry) then
         FreeAndNil(aQry);
      end;
     Result := sResult;
   end;

   Function GetPlanoPrev(intId: Integer; var intIdAnt: Integer; var sPlanoAnt: string): String;
   var
      sResult : string;
   begin
     sResult := '';
     if intidAnt <> intId then
       begin
         intIdAnt := intId;
         try
           aQry := TwwQuery.Create(Self);
           aQry.DatabaseName := 'BaseDados';
           aQry.SQL.Clear;
           aQry.sql.Add(' SELECT PPC.NOME FROM PLANPREVCONTABIL PPC WHERE PPC.IDPLANOPREV = '+ IntToStr(intId));
           aQry.Open;
           sResult   := aQry.FieldByName('NOME').AsString;
           sPlanoAnt := sResult;
         finally
           if Assigned(aQry) then
             begin
              aQry.Close;
              FreeAndNil(aQry);
             end;
         end;
       end else
       sResult := sPlanoAnt;

     Result := sResult;
   end;

   function TrataData(dt: TDate):TDate;
   var
      data: String;
   begin
        data:= FormatDateTime('dd/mm/yyyy', dt);
        dt:= StrToDate(data);
        result:= dt;
   end;

   Function VerificaSeASituacaoEAtrasadaEJaTratada(sSituacao: String; dtBaseTela, dtTrgAlteracao: TDate): String;
   begin
     if trim(sSituacao) = trim('4') then
       Result := iif(TrataData(dtBaseTela) >= TrataData(dtTrgAlteracao),'Atrasada e já tratada','')
     else
       Result := '';
   end;

  Function VerificaSeADataBaseEMaiorOuIgualDataRecebimento(dtBaseTela, dtRecebimento: TDate; dValorRecebido,dValorEsperado: Double ): String;
  begin
    if TrataData(dtBaseTela) >= TrataData(dtRecebimento) then
       Result := iif(dValorRecebido <> dValorEsperado,'Recebida com divergência','Recebida corretamente')
    else
       Result := '';
  end;

  Function VerificaSeADatabaseEMaiorQueDataDeInclusao(dtDataBase, dtDataInclusao: TDate): String;
  begin
    Result := iif(TrataData(dtDataBase) >= TrataData(dtDataInclusao),'Não enviada para cobrança','Contribuição Inexistente');
  end;

  Function VerificaSeADataBaseEMaiorOuIgualDataEmissaoCobranca(dtDataBase, dtEmissaoCobranca: TDate; dtDataInclusao: TDate): String;
  begin
     Result := iif(TrataData(dtDataBase) >= TrataData(dtEmissaoCobranca),'Enviada e não recebida',
     VerificaSeADatabaseEMaiorQueDataDeInclusao(dtDataBase,dtDataInclusao));
  end;

  function VerificaSeContribuicaoPossuiDataRecebimento(dtDataRecebimento: TDate): Boolean;
  begin
    if TrataData(dtDataRecebimento) <> StrToDate('30/12/1899') then
      Result := True
    else
      Result := False;
  end;

  function VerificaSeContribuicaoPossuiDataDeEmissaoDeCobranca(dtDataCobranca: TDate): Boolean;
  begin
    if TrataData(dtDataCobranca) <> StrToDate('30/12/1899') then
      Result := True
    else
      Result := False;
  end;


  Function GetDataInclusaoDaContribOriginal(sNumRecebimentoPai: String; sDataInclusao: String):String;
  var
     aQry              : TwwQuery;
     sDataResult       : string;
     sNumRecebPaiClone : string;
     bTemPai           : Boolean;
  begin
    sDataResult       := sDataInclusao;
    sNumRecebPaiClone := sNumRecebimentoPai;

    if Length(Trim(sNumRecebimentoPai)) > 0 then
      begin
        try
          aQry := TwwQuery.Create(Self);
          aQry.DatabaseName := 'BaseDados';
          // passa nº do recebimentoPai para NumeroRecebimento, depois verifica se a linha possui numeroRecebimentoPai
          aQry.SQL.Add('SELECT HST.TRGDTINCLUSAO, HST.NUMRECEBIMENTO, HST.NUMRECEBIMENTOPAI FROM HSTCONTRIBPREV HST WHERE HST.NUMRECEBIMENTO = ' + sNumRecebPaiClone);
          bTemPai := True;
          while bTemPai do
            begin
               if aQry.Active then aQry.Close;

               aQry.Open;
               if Length(Trim(aQry.FieldByName('NUMRECEBIMENTOPAI').AsString)) > 0 then
                 begin
                   sNumRecebPaiClone := aQry.FieldByName('NUMRECEBIMENTOPAI').AsString;
                   sDataResult       := DateToStr(aQry.FieldByName('TRGDTINCLUSAO').AsDateTime);
                 end else
                 bTemPai := False;
            end;
          aQry.Close;
        finally
          if Assigned(aQry) then
            FreeAndNil(aQry);
        end;
      end;
    Result := sDataResult;
  end;

begin
    sPlanoAnterior := '';
    intIdAnterior  := 0;
    iTotaliza      := 0;

    qryRelat := TwwQuery.Create(Self);
    qryRelat.DatabaseName := 'BaseDados';
    qryRelat.SQL.Add(LeSql(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\sqlResult.txt'));
    qryRelat.Open;
    iTotal    := qryRelat.RecordCount;
    qryRelat.First;
   if iTotal > 0 then
     begin
        Try
           dTotalRecebido  := 0;
           dTotalAlterador := 0;
           dTotalEsperado  := 0;
           sGrupo          := '';

           sPeriodoRef    := TrazDados('Periodo do Relatorio','PeriodoReferencia');

           if tipoRel = trFinanceiro then
             sPeriodoCob    := TrazDados('Periodo do Relatorio','PeriodoCobranca');

           sPatroSel      := TrazDados('Selecionados','Patro');
           sMatricula     := TrazDados('Beneficiario','Matricula');

           if Length(Trim(SMatricula)) > 0 then
             sNome := TrazDados('Beneficiario','Nome');

           Case Integer(tipoRelat) of
             0:begin
                 sColunaFim := 'J';
                 sTitulo    := 'Recebimento_Financeiro_';
               end;
             1:begin
                  sColunaFim    := 'M';
                  sTitulo       := 'Movimentacao_Contribuicao_';
                  sDataBaseTela := TrazDados('Tela','Datas');
               end;
           end;

           slPrint := TStringList.Create;
           slPrint.Add('FUNCEF - FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS');
           slPrint.Add('SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e 13 Andares');
           slPrint.Add('Brasília  DF CEP 70.712-900 - (061)3329-1700 - www.funcef.com.br');
           slPrint.Add('CNPJ: 00.436.923/0001-90');


           case Integer(tipoRelat) of
               0:slPrint.Add('Relatório de Recebimento Financeiro'); // Financeiro
               1:slPrint.Add('Relatório de Movimentação de Contribuições'); // Contábil
           end;

           if Integer(tipoRelat) = 0 then
             slPrint.Add('Ano/Mês Cobrança : ' + sPeriodoCob);

          if Length(Trim(sPeriodoRef)) > 0 then
            begin
              case Integer(tipoRelat) of
                  0:slPrint.Add('Ano/Mês Referência : ' + sPeriodoRef); // Financeiro
                  1:slPrint.Add('Mês/Ano Inclusão   : ' + sPeriodoRef);  // Contábil
              end;
            end;

           if tipoRel = trContabil then
              slPrint.Add('Data base : ' + sDataBaseTela);  // Contábil


           slPrint.Add('');
           slPrint.Add('');

            case Integer(tipoRelat) of
               0:slPrint.Add('MATRÍCULA;PLANO CONTÁBIL;MÊS REF.;MÊS COB.;DATA PAGTO;DATA RECEB;CONTRIBUIÇÃO;Nº DOCTO;VALOR ESPERADO;ALTERADORES;VALOR RECEBIDO');// Financeiro
               1:slPrint.Add('MATRÍCULA;PLANO CONTÁBIL;MÊS REF.;MÊS COB.;DATA PAGTO;DATA RECEB;DATA INC. ORIG.;SITUAÇÃO CONTRIBUIÇÃO DATA BASE;SIT. CONTRIBUIÇÃO;CONTRIBUIÇÃO;Nº DOCTO;VALOR ESPERADO;ALTERADORES;VALOR RECEBIDO');// Contábil
            end;

            iPosicao := 0;
            frmAguarde.pbAguarde.Max := ITotal;
            while not qryRelat.Eof do
              begin

                frmAguarde.Mostra('Aguarde ....');
                inc(Iposicao);
                frmAguarde.pbAguarde.Position := iPosicao;


                 case Integer(tipoRel) of
                      0: begin // Financeiro
                            // insere os dados

                            sDocumento := iif(qryRelat.FieldByName('NODOCUMENTO').AsInteger = 0,'',intToStr(qryRelat.FieldByName('NODOCUMENTO').AsInteger));

                            slPrint.Add(qryRelat.FieldByName('MATRICULA').AsString                              +';' +
                                        qryRelat.FieldByName('NOME').AsString                                   +';' +
                                        qryRelat.FieldByName('MESREFERENCIA').AsString                          +';' +
                                        qryRelat.FieldByName('MESCOBRANCA').AsString                            +';' +
                                        qryRelat.FieldByName('DATAPREVISAORECE').AsString                       +';' +
                                        qryRelat.FieldByName('DATARECEBIMENTO').AsString                        +';' +
                                        qryRelat.FieldByName('CONTRIBUICAO').AsString                           +';' +
                                        sDocumento                                                          +';' +
                                        FormatFloat('#,#0.00', qryRelat.FieldByName('VALORESPERADO').AsFloat)   +';' +
                                        FormatFloat('#,#0.00', qryRelat.FieldByName('SOMAALTERADORES').AsFloat) +';' +
                                        FormatFloat('#,#0.00', qryRelat.FieldByName('TOTALRECEBIDO').AsFloat));
                            qryRelat.Next;

                         end;

                       1:begin
                            sResult := VerificaSeASituacaoEAtrasadaEJaTratada(qryRelat.FieldByName('SITRECEBIMENTO').AsString,strToDate(sDataBaseTela),StrToDate(DateToStr(qryRelat.FieldByName('TRGDTALTERACAO').AsDateTime)));
                             if Trim(sResult) = '' then
                                begin
                                   if VerificaSeContribuicaoPossuiDataRecebimento(qryRelat.FieldByName('DATARECEBIMENTO').AsDateTime) then
                                      sResult := VerificaSeADataBaseEMaiorOuIgualDataRecebimento( strToDate(sDataBaseTela),qryRelat.FieldByName('DATARECEBIMENTO').AsDateTime,qryRelat.FieldByName('VALORRECEBIDO').AsFloat,qryRelat.FieldByName('VALORESPERADO').AsFloat);

                                   if sResult= '' then
	                              begin
                                          if VerificaSeContribuicaoPossuiDataDeEmissaoDeCobranca(qryRelat.FieldByName('DATAEMISSCOB').AsDateTime) then
			                     sResult:= VerificaSeADataBaseEMaiorOuIgualDataEmissaoCobranca(strToDate(sDataBaseTela),qryRelat.FieldByName('DATAEMISSCOB').AsDateTime,qryRelat.FieldByName('TRGDTINCLUSAO').AsDatetime)
                                          else
			                     sResult := VerificaSeADatabaseEMaiorQueDataDeInclusao(strToDate(sDataBaseTela),qryRelat.FieldByName('TRGDTINCLUSAO').AsDatetime);
                                      end;
	                        end;

                           sNDocumento := iif(qryRelat.FieldByName('NODOCUMENTO').AsInteger > 0, IntToStr(qryRelat.FieldByName('NODOCUMENTO').AsInteger),'');
 //                               // insere os dados
                            slPrint.Add(qryRelat.FieldByName('MATRICULA').AsString        +';' +
                                        qryRelat.FieldByName('NOME').AsString             +';' +
                                        qryRelat.FieldByName('MESREFERENCIA').AsString    +';' +
                                        qryRelat.FieldByName('MESCOBRANCA').AsString      +';' +
                                        qryRelat.FieldByName('DATAPREVISAORECE').AsString +';' +
                                        qryRelat.FieldByName('DATARECEBIMENTO').AsString  +';' +
                                        GetDataInclusaoDaContribOriginal(intToStr(qryRelat.FieldByName('NUMRECEBIMENTOPAI').AsInteger), DateToStr(qryRelat.FieldByName('TRGDTINCLUSAO').AsDateTime)) + ';' +
                                        sResult                                       +';' +
                                        qryRelat.FieldByName('FORMARECEBIMENTO').AsString +';' +
                                        qryRelat.FieldByName('CONTRIBUICAO').AsString     +';' +
                                        sNDocumento                                   +';' +
                                        FormatFloat('#,#0.00', qryRelat.FieldByName('VALORESPERADO').AsFloat) + ';' +
                                        FormatFloat('#,#0.00', qryRelat.FieldByName('SOMAALTERADORES').AsFloat)         + ';' +
                                        FormatFloat('#,#0.00', qryRelat.FieldByName('TOTALRECEBIDO').AsFloat));
                            qryRelat.Next;
                         end;
                 end;
              end;

           qryRelat.Close;
           FreeAndNil(qryRelat);
           frmAguarde.pbAguarde.Visible := False;
           frmAguarde.lblMensagem.Caption := 'Aguarde ....' + chr(13)+'Salvando arquivo ...';
           application.ProcessMessages;
           frmAguarde.Apaga;
           frmAguarde.pbAguarde.Visible := True;
//            Salvando Arquivo
           Try
             if not DirectoryExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)) then
               CreateDir(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa));

              DecodeDate(Date,wAno,wMes,wDia);
              sAgora := TimeToStr(Time);
              SetLength(tVar,2);
              tVar[0] := '';
              tVar[1] := tVar[0];

              For iCount:= 1 to Length(sAgora) do
                begin
                   if Length(tVar[0]) < 2 then
                     tVar[0] := tVar[0] + sAgora[iCount]
                   else
                   begin
                      if (sAgora[iCount] <>':') and (Length(tVar[1]) < 2 ) then
                        tVar[1] := tVar[1] + sAgora[iCount];

                      if Length(tVar[1]) = 2 then
                        Break;
                    end;
                end;
              oDia := iif(Length(intToStr(wDia)) = 1,'0' + intToStr(wDia),intToStr(wDia));
              oMes := iif(Length(intToStr(wMes)) = 1,'0' + intToStr(wMes),intToStr(wMes));
              oAno := intToStr(wAno);

              if FileExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +'\' + sTitulo + oDia +'_' + oMes +'_' + oAno + '_' + tVar[0] + '_' + tVar[1] +'.csv') then
                 DeleteFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +'\' + sTitulo + oDia +'_' + oMes +'_' + oAno + '_' + tVar[0] + '_' + tVar[1] +'.csv');


              slPrint.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +'\'+ sTitulo + oDia +'_' + oMes +'_' + oAno + '_' + tVar[0] + '_' + tVar[1] +'.csv');

              MsgDlg('Arquivo gerado com sucesso!', 'Informação', mtInformation, [mbOk], 0);

              if Assigned(slPrint) then
                FreeAndNil(slPrint);

           except
              MsgDlg('Não foi possível gerar o arquivo!', 'Informação', mtInformation, [mbOk], 0);
           end;

           if Length(Trim(sMensagem)) > 0 then
             MsgDlg(sMensagem, 'Informação', mtInformation, [mbOk], 0);

        except
           MsgDlg('Não foi possível gerar o arquivo!', 'ERRO', mtError, [mbOk], 0);
           if Assigned(slPrint) then
             FreeAndNil(slPrint);
           if Assigned(qryRelat) then
             FreeAndNil(qryRelat);
           frmAguarde.Apaga;
         end;
     end;
end;

procedure TfrmMostraRelat.SubstituiSQL(oSQL: String; var oSQLGuarda: String );
begin
    CDSConsulta.close;
    oSQLGuarda  := sqlConsulta.SQL.GetText;
    sqlConsulta.SQL.Clear;
    SQLConsulta.SQL.Add(oSQL);
    SqlConsulta.SQL.SaveToFile('C:\sql2.txt');
    if SqlConsulta.ParamCount = 0 then
    sqlconsulta.open;
end;
//Robson Andrade - SOL.253577/18061 ppm.1238748 - fim

// Andre Imakawa - SIG34269 - Inicio
procedure TfrmMostraRelat.spbPreviewPrintClick(Sender: TObject);
begin
  Autorizacao.FecharTelaPreviewRel;//Darivaldo Alencar SIG62086 

  if (Printer.Printers.Count > 1) and not(ppViewer1.report =  nil) then
  begin
    ppViewer1.report.PrinterSetup.PrinterName := sPrinterDefault;
    ppViewer1.report.PrintToDevices;
    bImprimiu := True;
  end;
  inherited;
  ppViewer1.Print;
end;

procedure TfrmMostraRelat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (Printer.Printers.Count > 1) then
  Begin
    bImprimiu:= False; //Darivaldo Alencar SIG62086
    if not (bImprimiu ) then ApplicationDeactivate(sender);
    Application.OnDeactivate := nil;
    Application.OnActivate := nil;
  end;
  inherited;
end;

procedure TfrmMostraRelat.ApplicationActivate(Sender: TObject);
begin
{Quando está descomentado, a impressora não muda para padrão correta após imprimir o relatório em outro preview diferente do Mostrarelat}
//Darivaldo Alencar SIG62086 -Inicio
//  if (Printer.Printers.Count > 1) and not (bImprimiu )then
//  Begin
//    Autorizacao.ChangeDefaultPrinter(sPrinterDefault_Aux, 1);
//    SetarImpressoraComponente(sPrinterDefault_Aux, true);
//  End;
//Darivaldo Alencar SIG62086 -Fim
end;

procedure TfrmMostraRelat.ApplicationDeActivate(Sender: TObject);
begin
  if (Printer.Printers.Count > 1) and not(bImprimiu) then
  Begin
    Autorizacao.ChangeDefaultPrinter(sPrinterDefault, 0);//Darivaldo Alencar SIG62086
    SetarImpressoraComponente(sPrinterDefault, true);
  End;
end;

procedure TfrmMostraRelat.FormDeactivate(Sender: TObject);
begin
  inherited;
  if (Printer.Printers.Count > 1) and not (bImprimiu )then ApplicationDeActivate(sender);
end;

procedure TfrmMostraRelat.FormActivate(Sender: TObject);
begin
  inherited;
  if (Printer.Printers.Count > 1) and not (bImprimiu ) then  ApplicationActivate(sender);
end;
// Andre Imakawa - SIG34269 - Fim


{ // Alterado por FHBS - 27/03/2020 - SIG94698
// Parametro de verificação passado para o banco.
//Darivaldo Alencar SIG62683
Procedure TfrmMostraRelat.ExportacaoManual;
begin
  fmQrExportD:= TfmQrExportD.create(nil);
  fmQrExportD.DataSet(cdsConsulta,viIdReport);

  fmQrExportD.show;
end;
//Darivaldo Alencar SIG62683
} // Fim - Alterado por FHBS - 27/03/2020 - SIG94698


//Darivaldo Alencar SIG62086 -Inicio
procedure TfrmMostraRelat.SetarImpressoraComponente(sImpressoraPadrao: String; bPrintDevice: Boolean);
begin
   {Centralizando código do SIG34269}
   RelatManual.PrinterSetup.PrinterName  := sImpressoraPadrao;
   RelatGerador.PrinterSetup.PrinterName := sImpressoraPadrao;
   RelatCmReport.PrinterSetup.PrinterName:= sImpressoraPadrao;
   if (bPrintDevice) then
     begin
        RelatManual.PrintToDevices;
        RelatGerador.PrintToDevices;
        RelatCmReport.PrintToDevices;
     end;
end;
//Darivaldo Alencar SIG62086 -FIm


//edilaine SIG123112 : inicio
procedure TfrmMostraRelat.qe3dPadraoBeginExport(Sender: TQExport3);
begin
  inherited;
  qe3dPadrao.DataSet.first;
end;
//edilaine SIG123112 : fim

End.

