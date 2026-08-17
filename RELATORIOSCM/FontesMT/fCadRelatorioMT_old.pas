{-------------------------------------------------------------------------------------------------
Rotina......: FazerSelectsGeraisReport
<<<<<<< HEAD
=======
Nº SOL......: 244125.18329
Data........: 06/10/2016
Responsável.: Marcelo Cardoso
Descrição...: Melhoria no Cad. de Relatórios, para que seja validado na primeira consulta, se existe
              dados para o parametro informado. Deve ser apresentado uma menssagem
-------------------------------------------------------------------------------------------------
Rotina......: FazerSelectsGeraisReport
>>>>>>> remotes/origin/B_SOL244125
Nº SIG......: 24970
Data........: 13/07/2016
Responsável.: Peterson Victor
Descrição...: Erro ao executar a 4 consulta
--------------------------------------------------------------------------------------------------
Rotina......: Parametrização de Relatório Boletos- Acompanhamento
Nº SOL......: 248183
Nº PPM......: 667246
Data........: 12/02/2015
Responsável.: Wylliam Leite da Silva
Descrição...: Correção no tipo de dado utilizado para armazenar o layout de
              relatório armazenado no banco do tipo Long Raw.
--------------------------------------------------------------------------------------------------
Rotina......: BuscaTipoDado
Nº SOL......: 575651
Nº KINTANA..: 242482
Data........: 21/11/2014
Responsável.: Higor Nayde
Descrição...: Correção da busca por tipo
--------------------------------------------------------------------------------------------------
Rotina......: Grid
Nº SOL......: 231267/16158
Nº KINTANA..: 412192
Data........: 10/10/2014
Responsável.: Higor Nayde
Descrição...: Criação de relacionamento entre consultas
---------------------------------------------------------------------------------------------------
Rotina......: BtnConsGrupoClick
Nº SOL......: 143297
Nº KINTANA..: 928391
Data........: 15/08/2012
Responsável.: Thiago Melo
Descrição...: Inclusão de Grupo Mestre nos relatórios e gráficos
---------------------------------------------------------------------------------------------------
Rotina......: ChamaTelaParametro
Nº SOL......: 177563
Nº KINTANA..: 1627861
Data........: 05/04/2012
Responsável.: Vinicius Ferreira
Descrição...: Coreção de erro no botão CANCELAR da tela de filtro do RelatórioCM.
---------------------------------------------------------------------------------------------------
Rotina......: .dfm,
Nº SOL......: 168857
Nº KINTANA..: 1506883
Data........: 14/02/2012
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Inclusão do componente chkRelatAtivo, aumento no tamanho vertical
              do form e mudança da propriedade top de diversos componentes.
---------------------------------------------------------------------------------------------------
Rotina......: ChamaTelaParametro
Nº SOL......: 152622
Nº KINTANA..: 1136610
Data........: 10/02/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção para Mostrar os dados do relatório no Desenho.
---------------------------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Thaise Amaral Martins
  Data.........: 07/10/2010
  SOL: 86398
  Kintana: 523371
  Alteração....: Chamando tela de parâmetros para que estes sejam informados antes
                 de montar o relatório, para que na visualização traga apenas os parâmetros
                 informados.
------------------------------------------------------------------------------------}

{------------------------------------------------------------------------------
<<<<<<< HEAD
  Desenvolvedor: Arnaldo Vicente Scarin                                           
  Data.........: 29/04/2010                                        
=======
  Desenvolvedor: Arnaldo Vicente Scarin
  Data.........: 29/04/2010
>>>>>>> remotes/origin/B_SOL244125
  SOL / Kintana: 132513 / 765092
  Alteração....: Implementação de SubRelatorio nos Relatórios definidos pelo sistema
------------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Antonio Marcos Fernandes de Souza - mnemônico(amf)
  Data         : 09.02.2006
  Pendência    : 21515 - Ao inserir um campo texto no layout, não está vindo os campos
                 disponíveis na query.
  Solução      : Associei a propriedade DataSource do ppConsulta com o DataSource dsConsulta
------------------------------------------------------------------------------------------

// Atualizado em : 16/10/2003 - André Tavares - resoluão das pendências 14513 e 14160

-----------------------------------------------------------------------------------------}

unit fCadRelatorioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, DBCtrls, Mask, wwdbedit, wwdblook, Buttons,
  ExtCtrls, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  TB97Ctls, TB97, ppVar, ppCtrls, ppPrnabl, ppClass, ppEndUsr, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCtrlReportsRelCM, uCtrlModulo, uModulo, ppForms, fMostraGraf,
  ppParameter, Menus, uCmSqlParams, ppTypes
  {$IFNDEF VERSAO0505}
  , uCmTypes, raIDE, ppFormWrapper,
  ppRptExp, ComCtrls, wwriched, Grids, Wwdbigrd, Wwdbgrid, DBTables,
<<<<<<< HEAD
  Wwquery, DBGrids
=======
  Wwquery, DBGrids, TabControlDetalhe, CmDock  , FCadastroMestreDetMT
>>>>>>> remotes/origin/B_SOL244125
{$ENDIF}
;

const EOL = #13#10;


type
<<<<<<< HEAD
  TFrmCadRelatorio = class(TFrmCadastroMT)
=======
  //TFrmCadRelatorio = class(TFrmCadastroMT)//SOL244125.18329- Marcelo Cardoso
  TFrmCadRelatorio = class(TFrmCadastroMestreDetMT)
>>>>>>> remotes/origin/B_SOL244125
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    BtnConsGrupo: TSpeedButton;
    BtnConsSql: TSpeedButton;
    CbModulo: TwwDBLookupCombo;
    EdNome: TwwDBEdit;
    BtnDesenho: TBitBtn;
    EdConsulta: TEdit;
    EdGrupo: TEdit;
    ppConsulta: TppBDEPipeline;
    DsgnCM: TppDesigner;
    RptModelo: TppReport;
    HeaderBand1: TppHeaderBand;
    Label11: TppLabel;
    Line1: TppLine;
    LblEmpresa: TppLabel;
    DetailBand1: TppDetailBand;
    FooterBand1: TppFooterBand;
    Line2: TppLine;
    LblSistema: TppLabel;
    Calc2: TppSystemVariable;
    Calc1: TppSystemVariable;
<<<<<<< HEAD
    MsConsulta_old: TMontaSelect;
=======
    MsConsulta_new: TMontaSelect;
>>>>>>> remotes/origin/B_SOL244125
    MsGrupo: TMontaSelect;
    CdsModulo: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    SqlParReports: TCMSqlParams;
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
    DbEdCodigo: TwwDBEdit;
    Label6: TLabel;
    DbEdOrigem: TwwDBEdit;
    Label7: TLabel;
    CdsConsulta: TCMClientDataSet;
    dsConsulta: TDataSource;
    RptCM: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    mnuSalvarComo: TMenuItem;
    mnuAbrir: TMenuItem;
    dlgAbrir: TOpenDialog;
    dlgSalvar: TSaveDialog;
    ppParameterList1: TppParameterList;
    GroupBox1: TGroupBox;
    ChkFiltro: TDBCheckBox;
    chkSubReport: TDBCheckBox;
    edSubConsulta1: TEdit;
    BtnSubCons1Sql: TSpeedButton;
    lblSubConsulta1: TLabel;
    lblSubConsulta2: TLabel;
    edSubConsulta2: TEdit;
    BtnSubCons2Sql: TSpeedButton;
    lblSubConsulta3: TLabel;
    edSubConsulta3: TEdit;
    BtnSubCons3Sql: TSpeedButton;
    lblSubConsulta4: TLabel;
    edSubConsulta4: TEdit;
    BtnSubCons4Sql: TSpeedButton;
    ppSubConsulta1: TppBDEPipeline;
    ppSubConsulta2: TppBDEPipeline;
    ppSubConsulta3: TppBDEPipeline;
    ppSubConsulta4: TppBDEPipeline;
    cdsSub1: TCMClientDataSet;
    cdsSub4: TCMClientDataSet;
    dsSub4: TwwDataSource;
    dsSub3: TwwDataSource;
    dsSub2: TwwDataSource;
    dsSub1: TwwDataSource;
    cdsSub2: TCMClientDataSet;
<<<<<<< HEAD
    cdsSub3: TCMClientDataSet;
=======
>>>>>>> remotes/origin/B_SOL244125
    SqlConsulta: TCMSqlParams;
    chkRelatAtivo: TDBCheckBox;
    MemDescricao: TDBMemo;
    dsNomeConsulta: TwwDataSource;
    cdsNomeConsulta: TCMClientDataSet;
    cdsConsultaGrid: TCMClientDataSet;
    dsConsultaGrid: TwwDataSource;
    cdsNomeCampo: TCMClientDataSet;
    cdsCampo: TCMClientDataSet;
    cdsNome: TCMClientDataSet;
    cdsNomeConsultaFiltro: TCMClientDataSet;
    ckbExporta: TDBCheckBox;
<<<<<<< HEAD
    pnConsulta: TPanel;
    Panel1: TPanel;
    sbtnInsDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    Label8: TLabel;
    cbxNomeConsulta: TwwDBLookupCombo;
    Label9: TLabel;
    cbxNomeCampo: TwwDBLookupCombo;
    Label10: TLabel;
    edtNomeConsulta: TEdit;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    SpeedButton1: TSpeedButton;
    gridConsulta: TwwDBGrid;
    Label12: TLabel;
=======
    Label12: TLabel;
    //SOL244125.18329- Marcelo Cardoso - INICIO
    edSubConsulta5: TEdit;
    edSubConsulta6: TEdit;
    BtnSubCons5Sql: TSpeedButton;
    BtnSubCons6Sql: TSpeedButton;
    lblSubConsulta5: TLabel;
    lblSubConsulta6: TLabel;
    ppBDEPipeline1: TppBDEPipeline;
    ppSubConsulta5: TppBDEPipeline;
    ppSubConsulta6: TppBDEPipeline;
    dsSub5: TDataSource;
    dsSub6: TDataSource;
    cdsSub3: TCMClientDataSet;
    CdsSub5: TCMClientDataSet;
    CdsSub6: TCMClientDataSet;
    cbxNomeConsulta: TwwDBLookupCombo;
    cbxNomeCampo: TwwDBLookupCombo;
    cbxFiltro: TwwDBLookupCombo;
    //edtNomeConsulta: TEdit;
    cdsFiltro: TCMClientDataSet;
    MsConsulta: TMontaSelect;
    dbConsultaFiltro: TDBEdit;
    BtnSubConsFiltro: TSpeedButton;
    //SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure BtnDesenhoClick(Sender: TObject);
    procedure BtnConsSqlClick(Sender: TObject);
    procedure BtnConsGrupoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DsgnCMCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure mniFileSaveClick(Sender: TObject);
    procedure mniFilePageSetupClick(Sender: TObject);
    procedure mniFilePrintToFileSetupClick(Sender: TObject);
    procedure mniFilePrintClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure mnuAbrirClick(Sender: TObject);
    procedure mnuSalvarComoClick(Sender: TObject);
    procedure chkSubReportClick(Sender: TObject);
    procedure BtnSubConsSqlClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
<<<<<<< HEAD
    procedure sbtnInserirClick(Sender: TObject);
    procedure cbxNomeConsultaChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetsClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
=======
    procedure sbtnInserirClick(Sender: TObject);   
    procedure sbtnInsDetClick(Sender: TObject);
    procedure cbxNomeConsultaChange(Sender: TObject);
    procedure BtnSubConsFiltroClick(Sender: TObject);
//    procedure sbtnAltDetsClick(Sender: TObject);
    //procedure btnOKClick(Sender: TObject);
    procedure bbtnOkDetClick (Sender: TObject);
>>>>>>> remotes/origin/B_SOL244125
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure ckbExportaClick(Sender: TObject);
    procedure cbxNomeCampoClick(Sender: TObject);
<<<<<<< HEAD
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure cbxNomeCampoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxNomeConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure cbxNomeCampoDropDown(Sender: TObject);
=======
//    procedure sbtnAlterarClick(Sender: TObject);//SOL244125.18329- Marcelo Cardoso
//    procedure bbtnCancelarClick(Sender: TObject);//SOL244125.18329- Marcelo Cardoso
    procedure cbxNomeCampoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxNomeConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure cbxNomeCampoDropDown(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);


    //procedure tbshFiltrosConsultaContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);//SOL244125.18329- Marcelo Cardoso
    //procedure pnlFundoClick(Sender: TObject);//SOL244125.18329- Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125
  private
    { Private declarations }
    bCriaTemplate, bChangeLayout: Boolean;
    aRptMemoryStream: TMemoryStream;
    iIdConsulta, iOrigemConsulta, iIdGrupo, iOrigemGrupo: Double;
    iIdSubConsulta1, iOrigemSubConsulta1: Double;
    iIdSubConsulta2, iOrigemSubConsulta2: Double;
    iIdSubConsulta3, iOrigemSubConsulta3: Double;
    iIdSubConsulta4, iOrigemSubConsulta4: Double;
<<<<<<< HEAD
    sOrigemConsultaGrid, sIdConsultaFiltro :String;
=======
    //SOL244125.18329- Marcelo Cardoso - INICIO
    iIdSubConsulta5, iOrigemSubConsulta5: Double;
    iIdSubConsulta6, iOrigemSubConsulta6: Double;
    //SOL244125.18329- Marcelo Cardoso - FIM
    sOrigemConsultaGrid, sIdConsultaFiltro :String;

>>>>>>> remotes/origin/B_SOL244125
    TipoRelatorio: TTipoRelatorio;
    sSqlParam     : String;
    sSqlSubParam1,
    sSqlSubParam2,
    sSqlSubParam3,
    sSqlSubParam4,
<<<<<<< HEAD
    sExporta : String;
    iCod, iOrig: String;
=======
    sSqlSubParam5,//SOL244125.18329- Marcelo Cardoso
    sSqlSubParam6,//SOL244125.18329- Marcelo Cardoso
    sExporta : String;
    iCod, iOrig: String;
    listFiltroConsulta : TStringList;   //SOL244125.18329- Marcelo Cardoso
    bSemParametro, bSemRegistro :Boolean;        //SOL244125.18329- Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125

    // Inicio - Arnaldo V. Scarin - Sol 132513
    function  ExisteItem(const pItemMenu: tMenuItem): Boolean;
    procedure AjustaFormulario(const pbSubReport: Boolean);
    procedure AcertaConsultasSubConsultas(const oQry: TCmClientDataSet);
    procedure ValidaItemMenuReport(Const oDesigner : TppDesigner);
    function  ChamaTelaParametro : Boolean; // Vinicius Ferreira SOL 177563 KINTANA 1627861
    // Fim - Arnaldo V. Scarin - Sol 132513
  public
    { Public declarations }
    Relatorio: TCtrlReportsRelCM;
    Modulo: TCtrlModulo;
    procedure SetTipoRelatorio( pTipoRelatorio: TTipoRelatorio );
    procedure Seleciona( IdReports: Double = 0; OrigemCm: Double = -1 );
    function  BuscaTipoDado(iIndiceCampo,IdCampo: Integer): String;
    procedure InsertirConsultaFiltro;
    procedure AlterarConsultaFiltro;
<<<<<<< HEAD
    procedure ExcluiConsulta;
=======
  //  procedure ExcluiConsultaFiltro;    
    procedure ExcluiConsulta;

>>>>>>> remotes/origin/B_SOL244125
  end;

var
  FrmCadRelatorio: TFrmCadRelatorio;
  sIdReports, sStatus:string;

implementation

Uses uMensErro, UDataBase,uSistema, dBaseDados, uMidasUtil, fConfigChartMT,
  FDesenhoOutLookMT, fFiltraSql, FCadSubGrpRelatoriosMT, FTelaAut;

{$R *.DFM}

procedure TFrmCadRelatorio.SetTipoRelatorio( pTipoRelatorio: TTipoRelatorio );
Begin
  TipoRelatorio := pTipoRelatorio;

  Case pTipoRelatorio Of
       trRelatorio: Begin
           Caption := 'Cadastro de Relatórios';
           MontaSelect.Filtro.Add('(REPORTS.FLGTIPO IS NULL OR REPORTS.FLGTIPO = ''R'')');
<<<<<<< HEAD
           pnConsulta.Visible := True;
=======
           //pnConsulta.Visible := True;  SOL244125.18329 - Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125
           ckbExporta.Visible := True;
       End;

       trGrafico: Begin
           Caption := 'Cadastro de Gráficos';
           MontaSelect.Filtro.Add('REPORTS.FLGTIPO = ''G''');
<<<<<<< HEAD
           pnConsulta.Visible := False;
=======
          // pnConsulta.Visible := False; SOL244125.18329 - Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125
           ckbExporta.Visible := False;
       End;
  End;
End;

procedure TFrmCadRelatorio.Seleciona( IdReports: Double = 0; OrigemCm: Double = -1 );
begin
  Case TipoRelatorio Of
       trRelatorio:
           Cds.Data := Relatorio.ListaReports( IdReports, OrigemCm,
                                               'AND (FLGTIPO IS NULL OR FLGTIPO = ''R'')');

       trGrafico:
           Cds.Data := Relatorio.ListaReports( IdReports, OrigemCm,
                                              'AND FLGTIPO = ''G''');

<<<<<<< HEAD

=======
>>>>>>> remotes/origin/B_SOL244125
  End;

  if IdReports > 0 then begin
     sIdReports := FloatToStr(IdReports);
     if not(cds.State in [dsInsert]) then begin
//       cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(IdReports,FloatToStr(iOrigemConsulta));
       cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(IdReports,Cds.FieldByName( 'ORIGEMCMDV' ).AsString);
       sOrigemConsultaGrid := cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString;
       cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(IdReports);
     end;
<<<<<<< HEAD
     if cdsConsultaGrid.IsEmpty then begin
          sbtnAltDet.Enabled := False;
          sbtnExcluiDet.Enabled := False;
     end;
  end;

end;
=======
	//SOL244125.18329- Marcelo Cardoso -INICIO
  //if cdsConsultaGrid.IsEmpty then begin
  //sbtnAltDet.Enabled := False;
  //sbtnExcluiDet.Enabled := False;
  //SOL244125.18329- Marcelo Cardoso FIM
     end;

  end;
>>>>>>> remotes/origin/B_SOL244125

procedure TFrmCadRelatorio.FormCreate(Sender: TObject);
begin
  inherited;
  aRptMemoryStream := TMemoryStream.Create;
  Relatorio := TCtrlReportsRelCM.Create;
  Relatorio.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                        Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  Modulo := TCtrlModulo.Create;
  Modulo.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True );

  Relatorio.Cds     := Cds;
  sStatus:='B';
  CdsModulo.Data := Modulo.ListaModulo();

  Seleciona( -1, -1 );
  // Alterador por Arnaldo V. Scarin - Sol 132513
  AjustaFormulario(False);

<<<<<<< HEAD
  pnConsulta.Visible :=False;
  sbtnInsDet.Enabled:= False;
  sbtnAltDet.Enabled:= False;
  sbtnExcluiDet.Enabled:= False;
=======
  //SOL244125.18329 - Marcelo Cardoso - Inicio
  //sbtnInsDet.Enabled:= False;
  //sbtnAltDet.Enabled:= False;
  //sbtnExcluiDet.Enabled:= False;
  //SOL244125.18329 - Marcelo Cardoso - FIM
 
  
>>>>>>> remotes/origin/B_SOL244125
end;

procedure TFrmCadRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  aRptMemoryStream.Free;
  Modulo.Free;
  Relatorio.Free;

  If TipoRelatorio = TrRelatorio Then
     FrmDesenhoOutLook.MontaArvoreRelatorio;

  ModalResult := MrOk;
  inherited;
end;

procedure TFrmCadRelatorio.AcertaConsultasSubConsultas(const oQry : TCmClientDataSet);
begin
  iOrigemConsulta := Cds.FieldByName( 'ORIGEMCMDV' ).AsFloat;
  iIdConsulta     := Cds.FieldByName( 'IDDATAVIEW' ).AsFloat;
  EdConsulta.Text := Cds.FieldByName( 'NomeDataview' ).AsString;

  // Inicio - Arnaldo V. Scarin - Sol 132513
  iOrigemSubConsulta1 := Cds.FieldByName( 'ORIGEMCMDV1' ).AsFloat;
  iIdSubConsulta1     := Cds.FieldByName( 'IDSUBDATAVIEW1' ).AsFloat;
  EdSubConsulta1.Text := Cds.FieldByName( 'NomeSubDataView1' ).AsString;

  iOrigemSubConsulta2 := Cds.FieldByName( 'ORIGEMCMDV2' ).AsFloat;
  iIdSubConsulta2     := Cds.FieldByName( 'IDSUBDATAVIEW2' ).AsFloat;
  EdSubConsulta2.Text := Cds.FieldByName( 'NomeSubDataView2' ).AsString;

  iOrigemSubConsulta3 := Cds.FieldByName( 'ORIGEMCMDV3' ).AsFloat;
  iIdSubConsulta3     := Cds.FieldByName( 'IDSUBDATAVIEW3' ).AsFloat;
  EdSubConsulta3.Text := Cds.FieldByName( 'NomeSubDataView3' ).AsString;

  iOrigemSubConsulta4 := Cds.FieldByName( 'ORIGEMCMDV4' ).AsFloat;
  iIdSubConsulta4     := Cds.FieldByName( 'IDSUBDATAVIEW4' ).AsFloat;
  EdSubConsulta4.Text := Cds.FieldByName( 'NomeSubDataView4' ).AsString;
  // Final - Arnaldo V. Scarin - Sol 132513

<<<<<<< HEAD
=======
  // SOL244125.18329- Marcelo Cardoso - Início
  iOrigemSubConsulta5 := Cds.FieldByName('ORIGEMCMDV5').AsFloat;
  iIdSubConsulta5     := Cds.FieldByName('IDSUBDATAVIEW5').AsFloat;
  EdSubConsulta5.Text := Cds.FieldByName( 'NomeSubDataView5' ).AsString;

  iOrigemSubConsulta6 := Cds.FieldByName('ORIGEMCMDV6').AsFloat;
  iIdSubConsulta6     := Cds.FieldByName('IDSUBDATAVIEW6').AsFloat;
  EdSubConsulta6.Text := Cds.FieldByName( 'NomeSubDataView6' ).AsString;
  //SOL244125.18329 - Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
end;

procedure TFrmCadRelatorio.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ),
                StrToFloat( MontaSelect.ValoresChave[ 1 ] ) );

     iIdGrupo        := Cds.FieldByName( 'IDGRUPORELATORIO' ).AsFloat;
     iOrigemGrupo    := Cds.FieldByName( 'ORIGEMCMGR' ).AsFloat;
     EdNome.Text     := Cds.FieldByName( 'Name' ).AsString;
     EdGrupo.Text    := Cds.FieldByName( 'Descricao' ).AsString;

     // Inicio - Arnaldo V. Scarin - Sol 132513
     AcertaConsultasSubConsultas(cds);
     AjustaFormulario(chkSubReport.Checked);
     // Final - Arnaldo V. Scarin - Sol 132513

     bCriaTemplate   := True;
  End;
end;

procedure TFrmCadRelatorio.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  bChangeLayout := False;
  bCriaTemplate := True;
  aRptMemoryStream.Clear;
  Cds.FieldByName( 'ORIGEMCM' ).AsInteger       := 0;
  Cds.FieldByName( 'FLGFILTROMANUAL' ).AsString := 'N';
  // Arnaldo V. Scarin - Sol 132513
  Cds.FieldByName( 'FLGSUBREPORT' ).AsString := 'N';
  Cds.FieldByName('FLGEXPORTADADOS').AsString := sExporta;
  iIdConsulta     := -1;
  iOrigemConsulta := -1;
  iIdGrupo        := -1;
  iOrigemGrupo    := -1;
  EdConsulta.Text := '';
  EdGrupo.Text    := '';

  If TipoRelatorio = trGrafico Then
     Cds.FieldByName( 'FLGTIPO' ).AsString := 'G'
  Else
  Begin
    Cds.FieldByName( 'FLGTIPO' ).Clear;
    aRptMemoryStream.Clear;
    RptModelo.Template.SaveToStream( aRptMemoryStream );
    aRptMemoryStream.Position := 0;
    TBlobField( Cds.FieldByName( 'TEMPLATE' ) ).LoadFromStream( aRptMemoryStream );
  End;
  // Arnaldo V. Scarin - Sol 132513
  AjustaFormulario(False);

  EdNome.SetFocus;
end;

procedure TFrmCadRelatorio.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  bCriaTemplate := True;
  bChangeLayout := False;
  // Arnaldo V. Scarin - Sol 132513
  AjustaFormulario(chkSubReport.Checked);
  EdNome.SetFocus;
end;

procedure TFrmCadRelatorio.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Relatorio.Gravar;
end;

procedure TFrmCadRelatorio.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Relatorio.Gravar;
end;

procedure TFrmCadRelatorio.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Relatorio.Gravar;

  If Accept Then
  Begin
     EdConsulta.Text := '';
     EdGrupo.Text    := '';
  End;
end;

procedure TFrmCadRelatorio.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( Relatorio.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TFrmCadRelatorio.BtnDesenhoClick(Sender: TObject);
Var //-------------Início---------------
    // Não vamos mais utilizar variaveis do tipo string
    // para armazenar o layout do relatório
    // Wylliam Silva -> PPM: 667246 SOL: 248183 - 12/02/2015
    //sSql,
    //sSqlSub1,
    //sSqlSub2,
    //sSqlSub3,
    //sSqlSub4      : String;
    //-------------Fim------------------

    iQteReports   : Integer;
    lstSubReports : TStringList;
    Seltemplate   : String;

    //------------Início----------------
    // StringList para guardar o layout do relatório
    // selecionado na tela.
    // Wylliam Silva -> PPM: 667246 SOL: 248183 - 12/02/2015
    sLayoutRel,
    sLayoutRelSub1,
    sLayoutRelSub2,
    sLayoutRelSub3,
<<<<<<< HEAD
    sLayoutRelSub4  : TStringList;
=======
	//SOL244125.18329- Marcelo Cardoso -INICIO
	//sLayoutRelSub4  : TStringList;
    sLayoutRelSub4,
    sLayoutRelSub5,
    sLayoutRelSub6 : TStringList;
	//SOL244125.18329- Marcelo Cardoso -FIM
>>>>>>> remotes/origin/B_SOL244125
    //-------------Fim-----------------

  // Inicio - Arnaldo V. Scarin - Sol 132513
  // *************************************************************************//
  Procedure AjustarSelectsGeraisReport;
  var iConsulta,
      iOrigem : Double;
      iCount : integer;
  begin
    iConsulta := -1;
    iOrigem   := -1;
<<<<<<< HEAD
    For iCount := 0 to 4 do
=======
    //For iCount := 0 to 4 do //SOL244125.18329- Marcelo Cardoso
      For iCount := 0 to 6 do //SOL244125.18329- Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125
    begin
      Case iCount of
        0: begin
             if iIdConsulta <> 0 then
             iConsulta := iIdConsulta;
             iOrigem   := iOrigemConsulta;
           end;
        1: begin
             iConsulta := iIdSubConsulta1;
             iOrigem   := iOrigemSubConsulta1;
           end;
        2: begin
             iConsulta := iIdSubConsulta2;
             iOrigem   := iOrigemSubConsulta2;
           end;
        3: begin
             iConsulta := iIdSubConsulta3;
             iOrigem   := iOrigemSubConsulta3;
           end;
        4: begin
             iConsulta := iIdSubConsulta4;
             iOrigem   := iOrigemSubConsulta4;
           end;
<<<<<<< HEAD
=======

        //SOL244125.18329- Marcelo Cardoso - INICIO
        5: begin
             iConsulta := iIdSubConsulta5;
             iOrigem   := iOrigemSubConsulta5;
           end;

        6: begin
             iConsulta := iIdSubConsulta6;
             iOrigem   := iOrigemSubConsulta6;
             end;

        // SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
      end;
      CdsAux.Data := Relatorio.GetDataPacket( 'SELECT TEMPLATE' + EOL +
                                              'FROM DATAVIEW' + EOL +
                                              'WHERE IDDATAVIEW = ' + FloatToStr(iConsulta) + EOL +
                                              '  AND ORIGEMCMDV = ' + FloatToStr(iOrigem));

      // ---------------Inicio----------------
      // Wylliam Silva -> PPM: 667246 SOL: 248183
      sLayoutRel     := TStringList.Create;
      sLayoutRelSub1 := TStringList.Create;
      sLayoutRelSub2 := TStringList.Create;
      sLayoutRelSub3 := TStringList.Create;
      sLayoutRelSub4 := TStringList.Create;
<<<<<<< HEAD
=======
      sLayoutRelSub5 := TStringList.Create;//SOL244125.18329- Marcelo Cardoso
      sLayoutRelSub6 := TStringList.Create;//SOL244125.18329- Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125
      // ----------------Fim------------------

      If Not cdsAux.IsEmpty then
      begin
        Case iCount of
          0: begin
               //---------------------Início-----------------------
               // Wylliam Silva -> PPM: 667246 SOL: 248183
               // Foi utilizado aqui o paramentro sLayoutRel(TStringList)
               // para comportar o campo Long Raw do banco de dados sem truncar

               // Trecho comentado, não vamos mais utilizar variaveis
               // tipo string para armazenar o layout do relatório
               {sSql := CdsAux.FieldByName( 'TEMPLATE' ).AsString;
               Relatorio.SubstituiValorParam(sSql);}

               //Passa valor do campo "Template"(layout do relatório selecionado na tela)
               //para a StringList, fazendo isso o valor não será truncado.
               sLayoutRel.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
               //Chama método para substituir os parametros identificados entre "#"
               //pelo valor NULL
               Relatorio.SubstituiValorParam(sLayoutRel);
               //------------------------Fim-----------------------
             end;
          1: begin
               //---------------------Início-----------------------
               // Wylliam Silva -> PPM: 667246 SOL: 248183
               // Foi utilizado aqui o paramentro sLayoutRel(TStringList)
               // para comportar o campo Long Raw do banco de dados sem truncar

               // Trecho comentado, não vamos mais utilizar variaveis
               // tipo string para armazenar o layout do relatório
               {sSqlSub1 := CdsAux.FieldByName( 'TEMPLATE' ).AsString;
               Relatorio.SubstituiValorParam(sSqlSub1);}

               //Passa valor do campo "Template"(layout do relatório selecionado na tela)
               //para a StringList, fazendo isso o valor não será truncado.
               sLayoutRelSub1.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
               //Chama método para substituir os parametros identificados entre "#"
               //pelo valor NULL
               Relatorio.SubstituiValorParam(sLayoutRelSub1);
               //------------------------Fim-----------------------
             end;
          2: begin
               //---------------------Início-----------------------
               // Wylliam Silva -> PPM: 667246 SOL: 248183
               // Foi utilizado aqui o paramentro sLayoutRel(TStringList)
               // para comportar o campo Long Raw do banco de dados sem truncar

               // Trecho comentado, não vamos mais utilizar variaveis
               // tipo string para armazenar o layout do relatório
               {sSqlSub2 := CdsAux.FieldByName( 'TEMPLATE' ).AsString;
               Relatorio.SubstituiValorParam(sSqlSub2);}

               //Passa valor do campo "Template"(layout do relatório selecionado na tela)
               //para a StringList, fazendo isso o valor não será truncado.
               sLayoutRelSub2.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
               //Chama método para substituir os parametros identificados entre "#"
               //pelo valor NULL
               Relatorio.SubstituiValorParam(sLayoutRelSub2);
               //------------------------Fim-----------------------
             end;
          3: begin
               //---------------------Início-----------------------
               // Wylliam Silva -> PPM: 667246 SOL: 248183
               // Foi utilizado aqui o paramentro sLayoutRel(TStringList)
               // para comportar o campo Long Raw do banco de dados sem truncar

               // Trecho comentado, não vamos mais utilizar variaveis
               // tipo string para armazenar o layout do relatório
               {sSqlSub3 := CdsAux.FieldByName( 'TEMPLATE' ).AsString;
               Relatorio.SubstituiValorParam(sSqlSub3);}

               //Passa valor do campo "Template"(layout do relatório selecionado na tela)
               //para a StringList, fazendo isso o valor não será truncado.
               sLayoutRelSub3.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
               //Chama método para substituir os parametros identificados entre "#"
               //pelo valor NULL
               Relatorio.SubstituiValorParam(sLayoutRelSub3);
               //------------------------Fim-----------------------
             end;
          4: begin
               //---------------------Início-----------------------
               // Wylliam Silva -> PPM: 667246 SOL: 248183
               // Foi utilizado aqui o paramentro sLayoutRel(TStringList)
               // para comportar o campo Long Raw do banco de dados sem truncar

               // Trecho comentado, não vamos mais utilizar variaveis
               // tipo string para armazenar o layout do relatório
               {sSqlSub4 := CdsAux.FieldByName( 'TEMPLATE' ).AsString;
               Relatorio.SubstituiValorParam(sSqlSub4);}

               //Passa valor do campo "Template"(layout do relatório selecionado na tela)
               //para a StringList, fazendo isso o valor não será truncado.
               sLayoutRelSub4.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
               //Chama método para substituir os parametros identificados entre "#"
               //pelo valor NULL
               Relatorio.SubstituiValorParam(sLayoutRelSub4);
               //------------------------Fim-----------------------
<<<<<<< HEAD
             end;
        end;
      end;
=======

             end;

             //SOL244125.18329- Marcelo Cardoso - INICIO
          5: begin

               //Passa valor do campo "Template"(layout do relatório selecionado na tela)
               //para a StringList, fazendo isso o valor não será truncado.

                  sLayoutRelSub5.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
                  Relatorio.SubstituiValorParam(sLayoutRelSub5);

               //Chama método para substituir os parametros identificados entre "#"
               //pelo valor NULL

             end;

          6: Begin
               //Passa valor do campo "Template"(layout do relatório selecionado na tela)
               //para a StringList, fazendo isso o valor não será truncado.

                  sLayoutRelSub6.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
                  Relatorio.SubstituiValorParam(sLayoutRelSub6);

               //Chama método para substituir os parametros identificados entre "#"
               //pelo valor NULL

             end;            

        end;
      end;
	  //SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
      CdsAux.Close;
    end;
  end;
  // *************************************************************************//
  //Thaise: Adicionado parâmetros na procedure FazerSelectsGeraisReport,
  //que trarão as consultas vindas da tela de filtro.
<<<<<<< HEAD
  procedure FazerSelectsGeraisReport(spSql, spSubSql1, spSubSql2, spSubSql3, spSubSql4: String);
=======
  procedure FazerSelectsGeraisReport(spSql, spSubSql1, spSubSql2, spSubSql3, spSubSql4, spSubSql5, spSubSql6 : String);
>>>>>>> remotes/origin/B_SOL244125
  begin
    //Se os parâmetros estiverem vazios, ele chamará a consulta original da tela, pois indica
    //que não houve nenhuma consulta na tela de filtro.

    //-----------------Início------------------
    // Wylliam Silva -> PPM: 667246 SOL: 248183
    // Todos os parâmetros string foram substituidos por um StringList
    if Trim(spSubSql1) <> '' then
      //sSqlSub1:= spSubSql1; // Wylliam Silva -> PPM: 667246 SOL: 248183
      sLayoutRelSub1.Add(spSubSql1);

    if Trim(spSubSql2) <> '' then
      //sSqlSub2:= spSubSql2; // Wylliam Silva -> PPM: 667246 SOL: 248183
      sLayoutRelSub2.Add(spSubSql2);

    if Trim(spSubSql3) <> '' then
      //sSqlSub3:= spSubSql3; // Wylliam Silva -> PPM: 667246 SOL: 248183
      sLayoutRelSub3.Add(spSubSql3);

    if Trim(spSubSql4) <> '' then
    begin
      //sSqlSub4:= spSubSql4; // Wylliam Silva -> PPM: 667246 SOL: 248183
      sLayoutRelSub4.Clear; // Peterson Victor - SIG24970
      sLayoutRelSub4.Add(spSubSql4);
    end;
<<<<<<< HEAD
=======

    //SOL244125.18329 - Marcelo Cardoso - INICIO
     if Trim(spSubSql5) <> '' then
    begin
      sLayoutRelSub5.Clear;
      sLayoutRelSub5.Add(spSubSql5);
    end;

     if Trim(spSubSql6) <> '' then
    begin
      sLayoutRelSub6.Clear;
      sLayoutRelSub6.Add(spSubSql6);
    end;
    //SOL244125.18329 - Marcelo Cardoso - FIM

>>>>>>> remotes/origin/B_SOL244125
    if Trim(spSql) <> '' then
      //sSql:= spSql; // Wylliam Silva -> PPM: 667246 SOL: 248183
      sLayoutRel.Add(spSql);

    //CdsConsulta.Data      := Relatorio.GetDataPacket(sSql); - Wylliam Silva -> PPM: 667246 SOL: 248183
    CdsConsulta.Data      := Relatorio.GetDataPacket(sLayoutRel);
    // ----Fim Wylliam Silva -> PPM: 667246 SOL: 248183----

    RptCM.DataPipeline    := ppConsulta;
    ppConsulta.DataSource := dsConsulta;
    If chkSubReport.checked then
    begin
      //-----------------Início------------------
      // Wylliam Silva -> PPM: 667246 SOL: 248183
      // Todos os parâmetros string foram substituidos por um StringList

      //If sSqlSub1 <> EmptyStr then
      If sLayoutRelSub1.Text <> EmptyStr then
      begin
        //cdsSub1.Data              := Relatorio.GetDataPacket(sSqlSub1);
        cdsSub1.Data              := Relatorio.GetDataPacket(sLayoutRelSub1);
        ppSubConsulta1.DataSource := dsSub1;
      end;
      //If sSqlSub2 <> EmptyStr then
      If sLayoutRelSub2.Text <> EmptyStr then
      begin
        //cdsSub2.Data              := Relatorio.GetDataPacket(sSqlSub2);
        cdsSub2.Data              := Relatorio.GetDataPacket(sLayoutRelSub2);
        ppSubConsulta2.DataSource := dsSub2;
      end;
      //If sSqlSub3 <> EmptyStr then
      If sLayoutRelSub3.Text <> EmptyStr then
      begin
        //cdsSub3.Data              := Relatorio.GetDataPacket(sSqlSub3);
        cdsSub3.Data              := Relatorio.GetDataPacket(sLayoutRelSub3);
        ppSubConsulta3.DataSource := dsSub3;
      end;
      //If sSqlSub4 <> EmptyStr then
      If sLayoutRelSub4.Text <> EmptyStr then
      begin
        //cdsSub4.Data              := Relatorio.GetDataPacket(sSqlSub4);
        cdsSub4.Data              := Relatorio.GetDataPacket(sLayoutRelSub4);
        ppSubConsulta4.DataSource := dsSub4;
      end;
      // ----Fim Wylliam Silva -> PPM: 667246 SOL: 248183----
<<<<<<< HEAD
    end;
  end;
=======

      //SOL244125.18329- Marcelo Cardoso - INICIO
      If sLayoutRelSub5.Text <> EmptyStr then
      begin
        cdsSub5.Data              := Relatorio.GetDataPacket(sLayoutRelSub5);
        ppSubConsulta5.DataSource := dsSub5;
      end;

      If sLayoutRelSub6.Text <> EmptyStr then
      begin
        cdsSub6.Data              := Relatorio.GetDataPacket(sLayoutRelSub6);
        ppSubConsulta6.DataSource := dsSub6;
      end;      

    end;
  end;
  //SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
  // *************************************************************************//
  Procedure CloseQuerys;
  begin
    cdsConsulta.Close;
    cdsSub1.Close;
    cdsSub2.Close;
    cdsSub3.Close;
    cdsSub4.Close;
<<<<<<< HEAD
=======
    //SOL244125.18329- Marcelo Cardoso - INICIO
    CdsSub5.Close;
    CdsSub6.Close;
    //SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
  end;
  // Final - Arnaldo V. Scarin - Sol 132513
begin
  inherited;
  If ( EdNome.Text <> '' )     And
     ( EdConsulta.Text <> '' ) And
     ( CbModulo.Text <> '' )   And
     ( EdGrupo.Text <> '' )    Then
  Begin
     //Thaise criando novas variáveis para guardar
     //as consultas vindas da tela de filtro que começarão vazias.
     sSqlParam     := '';
     sSqlSubParam1 := '';
     sSqlSubParam2 := '';
     sSqlSubParam3 := '';
     sSqlSubParam4 := '';
<<<<<<< HEAD
=======
     sSqlSubParam5 := '';//SOL244125.18329- Marcelo Cardoso 
     sSqlSubParam6 := '';//SOL244125.18329- Marcelo Cardoso 
>>>>>>> remotes/origin/B_SOL244125

     // Vinicius Ferreira SOL 177563 KINTANA 1627861  - Inicio
     if ChkFiltro.Checked then  //Thaise - Para abrir tela de parâmetros caso
     begin
       if (not ChamaTelaParametro) then    //a opção tela de filtro seja ticada
       begin
          exit;
       end;
     end;
     // Vinicius Ferreira SOL 177563 KINTANA 1627861  - Fim

     bChangeLayout := True;

     // Arnaldo V. Scarin - Sol 132513
     ValidaItemMenuReport(DsgnCM);

     If chkSubReport.checked then
       DsgnCM.ShowComponents := DsgnCM.ShowComponents + [scSubReport]
     else
       DsgnCM.ShowComponents := DsgnCM.ShowComponents - [scSubReport];

     // Arnaldo V. Scarin - Sol 132513
     AjustarSelectsGeraisReport;

     Case TipoRelatorio Of
       trRelatorio : Begin
                       //Thaise: Novos parâmetros na procedure FazerSelectsGeraisReport.
<<<<<<< HEAD
                       FazerSelectsGeraisReport(sSqlParam, sSqlSubParam1, sSqlSubParam2, sSqlSubParam3, sSqlSubParam4);
=======
					   //SOL244125.18329- Marcelo Cardoso -INICIO
                       //FazerSelectsGeraisReport(sSqlParam, sSqlSubParam1, sSqlSubParam2, sSqlSubParam3, sSqlSubParam4);
					   FazerSelectsGeraisReport(sSqlParam, sSqlSubParam1, sSqlSubParam2, sSqlSubParam3, sSqlSubParam4, sSqlSubParam5, sSqlSubParam6);
					   //SOL244125.18329- Marcelo Cardoso -FIM
>>>>>>> remotes/origin/B_SOL244125
                       Case CmeCadastro.Operacao Of
                         OpInserir: Begin
                                      If bCriaTemplate Then
                                      Begin
                                        aRptMemoryStream.Clear;
                                        RptModelo.Template.SaveToStream( aRptMemoryStream );
                                        bCriaTemplate := False;
                                      End;
                                    End;

                         OpAlterar: Begin
                                      If bCriaTemplate Then
                                      Begin
                                        aRptMemoryStream.Clear;
                                        TBlobField( Cds.FieldByName( 'TEMPLATE' ) ).SaveToStream( aRptMemoryStream );
                                        bCriaTemplate := False;
                                      End;
                                    End;
                       End;

                       aRptMemoryStream.Position := 0;
                       try
                         RptCM.Template.LoadFromStream( aRptMemoryStream );
                       except
                         MsgDlg('O template deste relatório está corrompido, o mesmo terá de ser redesenhado.','Erro',mtError,[mbOk],0);
                         aRptMemoryStream.Clear;
                       end;
                       RptCM.DataPipeline := ppConsulta;

<<<<<<< HEAD
                       While (true) do
                       begin
=======
                       //SOL244125.18329 - Marcelo Cardoso - INICIO
                        if bSemParametro then
                         begin
                              MsgDlg( 'Não existem informações a serem exibidas.', 'Atenção', MtInformation, [MbOk], 0 );
                         end;

                        if bSemRegistro then
                         begin
                            MsgDlg( 'Não existem informações a serem exibidas conforme filtros informados:'+ #13#10 + listFiltroConsulta.text, 'Atenção', MtInformation, [MbOk], 0 );
                         end;
                        //SOL244125.18329 - Marcelo Cardoso - FIM
                       While (true) do
                       begin

>>>>>>> remotes/origin/B_SOL244125
                         // Mostra a tela de desenho do relatorio
                         DsgnCM.ShowModal;
                         // Inicio - Arnaldo V. Scarin - Sol 132513
                         lstSubReports := tStringList.Create;
                         DsgnCM.Report.GetSubReports(lstSubReports);
                         iQteReports := lstSubReports.Count;
                         FreeAndNil(lstSubReports);
                         If chkSubReport.Checked then
                         begin
<<<<<<< HEAD
                           If (iQteReports > 4) then
                           begin
                             MsgDlg( 'Existem mais de 4 Sub-Relatórios definidos. Favor Corrigir!',
                                     'Atenção', MtInformation, [MbOk], 0 );
                             continue;
=======

                           //If (iQteReports > 4) then //SOL244125.18329 - Marcelo Cardoso -
                           If (iQteReports > 6) then //SOL244125.18329 - Marcelo Cardoso -
                           begin
                             {MsgDlg( 'Existem mais de 4 Sub-Relatórios definidos. Favor Corrigir!',
                                     'Atenção', MtInformation, [MbOk], 0 );    }
                            //SOL244125.18329 - Marcelo Cardoso - INICIO
                              MsgDlg( 'Existem mais de 6 Sub-Relatórios definidos. Favor Corrigir!',
                                     'Atenção', MtInformation, [MbOk], 0 );
                             continue;
                            //SOL244125.18329 - Marcelo Cardoso -  FIM
>>>>>>> remotes/origin/B_SOL244125
                           end;
                         end
                         else If (iQteReports > 0) then
                         begin
                           If MsgDlg( 'Existem Sub-Relatórios definidos. Ativar Flag de Sub-Relatórios!',
                                   'Atenção', MtInformation, [MbYes,MBNO], 0 ) = IdYes then
                             chkSubReport.Checked := True
                           else
                             continue;
                         end;
                         break;
                         // Final - Arnaldo V. Scarin - Sol 132513
                       end;

                       // Salva o desenho do relatorio numa Stream
                       aRptMemoryStream.Clear;
                       RptCM.Template.SaveToStream( aRptMemoryStream );

                       RptCM.Reset;
                       RptCM.ResetDevices;

                       CloseQuerys;
                     End;

       trGrafico: Begin
                    Try
                      if Trim(sSqlParam) <> '' then
                        //sSql:= sSqlParam;
                        sLayoutRel.Add(sSqlParam);

                      Application.CreateForm(TfrmConfigChart, frmConfigChart);
                      //frmConfigChart._DadosGrafico.Data := Relatorio.GetDataPacket(sSql);
                      frmConfigChart._DadosGrafico.Data := Relatorio.GetDataPacket(sLayoutRel);

                      frmConfigChart.ShowModal;
                    finally
                      frmConfigChart.Free;
                    End;
                  End;
     End;
<<<<<<< HEAD
=======
       
>>>>>>> remotes/origin/B_SOL244125
  End
  Else
     MsgDlg( 'Antes de desenhar o Relatório, favor informar todos os dados do mesmo',
             'Atenção', MtInformation, [MbOk], 0 );
<<<<<<< HEAD
=======


   freeAndNil(listFiltroConsulta); //SOL244125.18329- Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125
end;

procedure TFrmCadRelatorio.BtnConsSqlClick(Sender: TObject);
begin
  inherited;
  If MsConsulta.Executar = MrOk Then Begin
     iIdConsulta     := StrToFloat( MsConsulta.ValoresChave[ 0 ] );
     iOrigemConsulta := StrToFloat( MsConsulta.ValoresChave[ 1 ] );
     EdConsulta.Text := MsConsulta.ValoresChave[ 2 ];
  End Else Begin
     iIdConsulta     := -1;
     iOrigemConsulta := -1;
     EdConsulta.Text := '';
  End;
end;

procedure TFrmCadRelatorio.BtnConsGrupoClick(Sender: TObject);
begin
  inherited;
  // Thiago Melo SOL 143297 Kintana 928391

{  If MsGrupo.Executar = MrOk Then Begin
     iIdGrupo     := StrToFloat( MsGrupo.ValoresChave[ 0 ] );
     iOrigemGrupo := StrToFloat( MsGrupo.ValoresChave[ 1 ] );
     EdGrupo.Text := MsGrupo.ValoresChave[ 2 ];
  End Else Begin
     iIdGrupo     := -1;
     iOrigemGrupo := -1;
     EdGrupo.Text := '';
  End; }

  AbrirFormModal( frmCadSubGrpRelatorios, TfrmCadSubGrpRelatorios );

  if frmCadSubGrpRelatorios.Result = MB_OK then begin
    iIdGrupo     := frmCadSubGrpRelatorios.IdGrupoRelatorio;
    iOrigemGrupo := frmCadSubGrpRelatorios.Origem;
    EdGrupo.Text := frmCadSubGrpRelatorios.DescricaoGrupoMestre
  end
  else begin
   iIdGrupo     := -1;
   iOrigemGrupo := -1;
   EdGrupo.Text := '';
  end;

  // Thiago Melo SOL 143297 Kintana 928391
end;

procedure TFrmCadRelatorio.bbtnConfirmarClick(Sender: TObject);
<<<<<<< HEAD
=======

>>>>>>> remotes/origin/B_SOL244125
var
  ssql: String;
begin
  If ( Trim( EdNome.Text ) = '' ) Or ( EdConsulta.Text = '' ) Or
         ( CbModulo.Text = '' ) Or ( EdGrupo.Text = '' ) Then Begin
<<<<<<< HEAD
     MsgDlg( 'Favor informar todos os dados do Relatório', 'Atenção', MtInformation, [MbOk], 0 );
=======
     MsgDlg( 'Favor informar todos os dados do Relatório.', 'Atenção', MtInformation, [MbOk], 0 );
>>>>>>> remotes/origin/B_SOL244125

     If Trim( EdNome.Text ) = '' Then
        EdNome.SetFocus
     Else
     If Trim( EdConsulta.Text ) = '' Then
        EdConsulta.SetFocus
     Else
     If Trim( CbModulo.Text ) = '' Then
        CbModulo.SetFocus
     Else
     If Trim( EdGrupo.Text ) = '' Then
        EdGrupo.SetFocus
     Else
        EdNome.SetFocus;

     Exit;
  End;

  If    ( Pos( '''', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Or
         ( Pos( '"', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Or
         ( Pos( '/', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Or
         ( Pos( ':', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Or
         ( Pos( ',', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Or
         ( Pos( ';', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Or
         ( Pos( '*', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Or
         ( Pos( '?', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Or
         ( Pos( '>', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Or
         ( Pos( '<', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Or
         ( Pos( '|', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Or
         ( Pos( '\', Cds.FieldByName( 'NAME' ).AsString ) > 0 ) Then Begin
     MsgDlg( 'O Nome do Relatório não pode conter caracters especiais ('' " : , ; * ? / \ | < >).',
             'Atenção', MtInformation, [MbOk], 0 );
     EdNome.SetFocus;
     Exit;
  End;

  ssql := 'SELECT IDDATAVIEW, ORIGEMCMDV FROM DATAVIEWACESSO ' +
          'WHERE IDESPACESSO = ' + FloatToStr( Sistema.IdEspAcesso ) +
          ' UNION ' +
          'SELECT A.IDDATAVIEW, A.ORIGEMCMDV ' +
          'FROM DATAVIEWACESSO A, GRUPOACESSO G, GRUPOUSU U ' +
          'WHERE U.IDUSUARIO = ' + FloatToStr( Sistema.IdUsuario ) + ' AND ' +
          'G.IDGRUPO = U.IDGRUPO AND ' +
          'A.IDESPACESSO = G.IDESPACESSO';

  CdsAux.Data := Relatorio.GetDataPacket( ssql );

  If Not CdsAux.IsEmpty Then Begin
     If Not CdsAux.Locate( 'IDDATAVIEW;ORIGEMCMDV',
                           Vararrayof( [ iidConsulta, iorigemconsulta ] ), [] ) Then Begin
        CdsAux.Close;
        MsgDlg( 'Você não tem permissão de acesso a visão especificada.',
                'Cadastro de Relatórios', MtInformation, [MbOk], 0 );
        Exit;
     End;
  End;
<<<<<<< HEAD
  if pnConsulta.Visible then begin
    sbtnInsDet.Enabled:= False;
    sbtnAltDet.Enabled:= False;
    sbtnExcluiDet.Enabled:= False;
  end;
  CdsAux.Close;
=======


  CdsAux.Close;

    //SOL244125.18329 - Marcelo Cardoso - Inicio
    //if pnConsulta.Visible then begin
    //sbtnInsDet.Enabled:= False;
    //sbtnAltDet.Enabled:= False;
    //sbtnExcluiDet.Enabled:= False;
    //end;

//   if sStatus = 'I' then
//     InsertirConsultaFiltro;
//
//   if sStatus = 'A' then
//      AlterarConsultaFiltro;

//   if sStatus = 'E' then
//      ExcluiConsultaFiltro;

   if dtmBaseDados.dbBaseDados.InTransaction then
   CommitTransacao;


  //SOL244125.18329 - Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
  inherited;
end;

// Inicio - Arnaldo V. Scarin - Sol 132513
function TFrmCadRelatorio.ExisteItem(const pItemMenu : tMenuItem) : Boolean;
begin
  Result := (pItemMenu.Name = 'mniViewLine3' ) Or
            (pItemMenu.Name = 'mniViewOutline' );
  If Not Result then
  begin
    Result := (pItemMenu.Name = 'mniReportData' ) Or
              (pItemMenu.Name = 'N1' );
    If Result and chkSubReport.Checked then
    Begin
      pItemMenu.Visible := Result;
      Result := False;
    end;
  end;
end;

procedure TFrmCadRelatorio.ValidaItemMenuReport(Const oDesigner : TppDesigner);
Var x, y: Integer;
begin
  For x := 0 To DsgnCM.Menu.Items.Count - 1 Do
    For y := 0 To DsgnCM.Menu.Items[ x ].Count - 1 Do
      If ExisteItem( DsgnCM.Menu.Items[ x ].Items[ y ] ) then
        DsgnCM.Menu.Items[ x ].Items[ y ].Visible := False;
end;
// Final - Arnaldo V. Scarin - Sol 132513

procedure TFrmCadRelatorio.DsgnCMCreate(Sender: TObject);
begin
  inherited;
  // Arnaldo V. Scarin - Sol 132513
  ValidaItemMenuReport(DsgnCM);
end;




procedure TFrmCadRelatorio.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin

   If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then Begin
      Cds.FieldByName( 'ORIGEMCMDV' ).AsFloat       := iOrigemConsulta;
      Cds.FieldByName( 'IDDATAVIEW' ).AsFloat       := iIdConsulta;
      Cds.FieldByName( 'IDGRUPORELATORIO' ).AsFloat := iIdGrupo;
      Cds.FieldByName( 'ORIGEMCMGR' ).AsFloat       := iOrigemGrupo;

      // Inicio - Arnaldo V. Scarin - Sol 132513
      Cds.FieldByName( 'ORIGEMCMDV1' ).AsFloat      := iOrigemSubConsulta1;
      Cds.FieldByName( 'IDSUBDATAVIEW1' ).AsFloat   := iIdSubConsulta1;
      Cds.FieldByName( 'ORIGEMCMDV2' ).AsFloat      := iOrigemSubConsulta2;
      Cds.FieldByName( 'IDSUBDATAVIEW2' ).AsFloat   := iIdSubConsulta2;
      Cds.FieldByName( 'ORIGEMCMDV3' ).AsFloat      := iOrigemSubConsulta3;
      Cds.FieldByName( 'IDSUBDATAVIEW3' ).AsFloat   := iIdSubConsulta3;
      Cds.FieldByName( 'ORIGEMCMDV4' ).AsFloat      := iOrigemSubConsulta4;
      Cds.FieldByName( 'IDSUBDATAVIEW4' ).AsFloat   := iIdSubConsulta4;
      // Final - Arnaldo V. Scarin - Sol 132513

<<<<<<< HEAD
=======
      //SOL244125.18329- Marcelo Cardoso - INICIO
      Cds.FieldByName( 'ORIGEMCMDV5' ).AsFloat      := iOrigemSubConsulta5;
      Cds.FieldByName( 'IDSUBDATAVIEW5' ).AsFloat   := iIdSubConsulta5;
      Cds.FieldByName( 'ORIGEMCMDV6' ).AsFloat      := iOrigemSubConsulta6;
      Cds.FieldByName( 'IDSUBDATAVIEW6' ).AsFloat   := iIdSubConsulta6;

      //SOL244125.18329- Marcelo Cardoso - FIM

>>>>>>> remotes/origin/B_SOL244125
      If TipoRelatorio = trGrafico Then
      Else Begin
         If bChangeLayout Then Begin
            aRptMemoryStream.Position := 0;
            TBlobField( Cds.FieldByName( 'TEMPLATE' ) ).LoadFromStream( aRptMemoryStream );
         End;
      End;
   End;
end;

procedure TFrmCadRelatorio.mniFileSaveClick(Sender: TObject);
begin
  inherited;
  aRptMemoryStream.Clear;
  RptCM.Template.SaveToStream( aRptMemoryStream );
end;

procedure TFrmCadRelatorio.mniFilePageSetupClick(Sender: TObject);
var
  lPageSetupDlg: TppCustomPageSetupDialog;
  lFormClass: TFormClass;
begin
  inherited;

  If DsgnCM.CurrentReport = Nil Then
     Exit;

  lFormClass := ppGetFormClass( TppCustomPageSetupDialog );
  lPageSetupDlg := TppCustomPageSetupDialog( lFormClass.Create( Self ) );
  lPageSetupDlg.Report := DsgnCM.CurrentReport;
  lPageSetupDlg.ShowModal;
  lPageSetupDlg.Free;
end;

procedure TFrmCadRelatorio.mniFilePrintToFileSetupClick(Sender: TObject);
var
  lTextFileDialog: TppCustomPrintToFileSetupDialog;
  lFormClass: TFormClass;
begin
  Inherited;
  If DsgnCM.CurrentReport = Nil Then
     Exit;

  lFormClass := ppGetFormClass( TppCustomPrintToFileSetupDialog );
  lTextFileDialog := TppCustomPrintToFileSetupDialog( lFormClass.Create( Self ) );
  lTextFileDialog.Report := DsgnCM.Report;
  lTextFileDialog.CurrentReport := DsgnCM.CurrentReport;
  lTextFileDialog.ShowModal;
  lTextFileDialog.Free;
end;

procedure TFrmCadRelatorio.mniFilePrintClick(Sender: TObject);
begin
  inherited;
  If DsgnCM.Report = Nil Then
     Exit;

  DsgnCM.PrintReport;
end;

procedure TFrmCadRelatorio.Sair1Click(Sender: TObject);
begin
  inherited;
  RptCM.DataPipeline := ppConsulta;
  aRptMemoryStream.Clear;
  RptCM.Template.SaveToStream( aRptMemoryStream );
  DsgnCM.Close;
end;

procedure TFrmCadRelatorio.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  if MontaSelect.retornouValor then
  begin
    Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ),
               StrToFloat( MontaSelect.ValoresChave[ 1 ] ) );
    // Inicio - Arnaldo V. Scarin - Sol 132513
    AcertaConsultasSubConsultas(cds);
    AjustaFormulario(chkSubReport.Checked);
    // Final - Arnaldo V. Scarin - Sol 132513
  end;
end;

procedure TFrmCadRelatorio.mnuAbrirClick(Sender: TObject);
begin
  inherited;
  if dlgAbrir.Execute then
  begin
     RptCM.Template.FileName := dlgAbrir.FileName;
     RptCM.Template.LoadFromFile;
  end;
end;

procedure TFrmCadRelatorio.mnuSalvarComoClick(Sender: TObject);
begin
  inherited;
  if dlgSalvar.Execute then
  begin
     RptCM.Template.FileName := dlgSalvar.FileName;
     RptCM.Template.SaveToFile;
  end;
end;

// Inicio - Arnaldo V. Scarin - Sol 132513
procedure TFrmCadRelatorio.chkSubReportClick(Sender: TObject);
begin
  inherited;
  AjustaFormulario(chkSubReport.Checked);
  If Not chkSubReport.Checked then
  begin
    edSubConsulta1.Text := '';
    iIdSubConsulta1     := -1;
    iOrigemSubConsulta1 := -1;
    edSubConsulta2.Text := '';
    iIdSubConsulta2     := -1;
    iOrigemSubConsulta2 := -1;
    edSubConsulta3.Text := '';
    iIdSubConsulta3     := -1;
    iOrigemSubConsulta3 := -1;
    edSubConsulta4.Text := '';
    iIdSubConsulta4     := -1;
    iOrigemSubConsulta4 := -1;
<<<<<<< HEAD
=======
    //SOL244125.18329- Marcelo Cardoso - INICIO
    edSubConsulta5.Text := '';
    iIdSubConsulta5     := -1;
    iOrigemSubConsulta5 := -1;
    edSubConsulta6.Text := '';
    iIdSubConsulta6     := -1;
    iOrigemSubConsulta6 := -1;
    //SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
  end;
end;

procedure TFrmCadRelatorio.AjustaFormulario(Const pbSubReport : Boolean);
begin
<<<<<<< HEAD
=======

>>>>>>> remotes/origin/B_SOL244125
  lblSubConsulta1.Enabled := pbSubReport;
  lblSubConsulta2.Enabled := pbSubReport;
  lblSubConsulta3.Enabled := pbSubReport;
  lblSubConsulta4.Enabled := pbSubReport;
<<<<<<< HEAD
=======
  lblSubConsulta5.Enabled := pbSubReport;//SOL244125.18329- Marcelo Cardoso
  lblSubConsulta6.Enabled := pbSubReport;//SOL244125.18329- Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125
  edSubConsulta1.Enabled  := pbSubReport;
  edSubConsulta2.Enabled  := pbSubReport;
  edSubConsulta3.Enabled  := pbSubReport;
  edSubConsulta4.Enabled  := pbSubReport;
<<<<<<< HEAD
=======
  edSubConsulta5.Enabled  := pbSubReport;//SOL244125.18329- Marcelo Cardoso
  edSubConsulta6.Enabled  := pbSubReport;//SOL244125.18329- Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125
  BtnSubCons1Sql.Enabled  := pbSubReport;
  BtnSubCons2Sql.Enabled  := pbSubReport;
  BtnSubCons3Sql.Enabled  := pbSubReport;
  BtnSubCons4Sql.Enabled  := pbSubReport;
<<<<<<< HEAD
=======
  BtnSubCons5Sql.Enabled  := pbSubReport;//SOL244125.18329- Marcelo Cardoso
  BtnSubCons6Sql.Enabled  := pbSubReport;//SOL244125.18329- Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125
end;

procedure TFrmCadRelatorio.BtnSubConsSqlClick(Sender: TObject);
begin
  inherited;
  If MsConsulta.Executar = MrOk Then
  Begin
    Case TWinControl(Sender).Tag of
       0 : begin
             edSubConsulta1.Text := MsConsulta.ValoresChave[ 2 ];
             iIdSubConsulta1     := StrToFloat( MsConsulta.ValoresChave[ 0 ] );
             iOrigemSubConsulta1 := StrToFloat( MsConsulta.ValoresChave[ 1 ] );
           end;
       1 : begin
             edSubConsulta2.Text := MsConsulta.ValoresChave[ 2 ];
             iIdSubConsulta2     := StrToFloat( MsConsulta.ValoresChave[ 0 ] );
             iOrigemSubConsulta2 := StrToFloat( MsConsulta.ValoresChave[ 1 ] );
           end;
       2 : begin
             edSubConsulta3.Text := MsConsulta.ValoresChave[ 2 ];
             iIdSubConsulta3     := StrToFloat( MsConsulta.ValoresChave[ 0 ] );
             iOrigemSubConsulta3 := StrToFloat( MsConsulta.ValoresChave[ 1 ] );
           end;
       3 : begin
             edSubConsulta4.Text := MsConsulta.ValoresChave[ 2 ];
             iIdSubConsulta4     := StrToFloat( MsConsulta.ValoresChave[ 0 ] );
             iOrigemSubConsulta4 := StrToFloat( MsConsulta.ValoresChave[ 1 ] );
           end;
<<<<<<< HEAD
=======

           //SOL244125.18329- Marcelo Cardoso - INICIO
        4 : begin
             edSubConsulta5.Text := MsConsulta.ValoresChave[ 2 ];
             iIdSubConsulta5     := StrToFloat( MsConsulta.ValoresChave[ 0 ] );
             iOrigemSubConsulta5 := StrToFloat( MsConsulta.ValoresChave[ 1 ] );
            end;

        5 : begin
             edSubConsulta6.Text := MsConsulta.ValoresChave[ 2 ];
             iIdSubConsulta6     := StrToFloat( MsConsulta.ValoresChave[ 0 ] );
             iOrigemSubConsulta6 := StrToFloat( MsConsulta.ValoresChave[ 1 ] );
            end;
           //SOL244125.18329- Marcelo Cardoso - FIM

>>>>>>> remotes/origin/B_SOL244125
    end;
  End
  Else
  Begin
    Case TWinControl(Sender).Tag of
       0 : begin
             edSubConsulta1.Text := '';
             iIdSubConsulta1     := -1;
             iOrigemSubConsulta1 := -1;
           end;
       1 : begin
             edSubConsulta2.Text := '';
             iIdSubConsulta2     := -1;
             iOrigemSubConsulta2 := -1;
           end;
       2 : begin
             edSubConsulta3.Text := '';
             iIdSubConsulta3     := -1;
             iOrigemSubConsulta3 := -1;
           end;
       3 : begin
             edSubConsulta4.Text := '';
             iIdSubConsulta4     := -1;
             iOrigemSubConsulta4 := -1;
           end;
<<<<<<< HEAD
=======
            //SOL244125.18329- Marcelo Cardoso - INICIO
       4 : begin
             edSubConsulta5.Text := '';
             iIdSubConsulta5     := -1;
             iOrigemSubConsulta5 := -1;
           end;
       5 : begin
             edSubConsulta6.Text := '';
             iIdSubConsulta6     := -1;
             iOrigemSubConsulta6 := -1;
           end;
        //SOL244125.18329- Marcelo Cardoso - FIM

>>>>>>> remotes/origin/B_SOL244125
    end;
  End;
end;
// Final - Arnaldo V. Scarin - Sol 132513

procedure TFrmCadRelatorio.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
<<<<<<< HEAD
=======
  if dtmBaseDados.dbBaseDados.InTransaction then ////
  RollBackTransacao;                             /////     

>>>>>>> remotes/origin/B_SOL244125
  if MontaSelect.retornouValor then
  begin
    Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ),
               StrToFloat( MontaSelect.ValoresChave[ 1 ] ) );
    // Inicio - Arnaldo V. Scarin - Sol 132513
    AcertaConsultasSubConsultas(cds);
    AjustaFormulario(chkSubReport.Checked);
    // Final - Arnaldo V. Scarin - Sol 132513
  end;
end;

function TFrmCadRelatorio.ChamaTelaParametro : Boolean; // Vinicius Ferreira SOL 177563 KINTANA 1627861
<<<<<<< HEAD
var iCont: Integer;
    FormFiltro    : TFrmFiltraSql;
    oSql          : TCMSqlParams;
=======

var iCont: Integer;
    FormFiltro    : TFrmFiltraSql;
    oSql          : TCMSqlParams;

    //SOL244125.18329- Marcelo Cardoso -INICIO
    x : Integer;

 function ConsultaRegistro(Consulta: string):boolean;
  var
  cdsAux: TClientDataSet;
  retorno : boolean;
  qryAux :TwwQuery;

  begin
    //cdsAux  := TClientDataSet.Create( nil );
    qryAux := TwwQuery.create(Self);
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

//SOL244125.18329- Marcelo Cardoso - INICIO
function trataMSG(msg: string) : string;
  begin

    msg := StringReplace(msg,'(','',[rfReplaceAll, rfIgnoreCase] );
    msg := StringReplace(msg,')','',[rfReplaceAll, rfIgnoreCase] );
    msg := StringReplace(msg,' and ',' ',[rfReplaceAll, rfIgnoreCase] );
    msg := StringReplace(msg,' or ',' ',[rfReplaceAll, rfIgnoreCase] );
    msg := StringReplace(msg,' <= ',' Menor Ou Igual a ',[rfReplaceAll, rfIgnoreCase] );
    msg := StringReplace(msg,' >= ',' Maior Ou Igual a ',[rfReplaceAll, rfIgnoreCase] );
    msg := StringReplace(msg,' =',' Igual a ',[rfReplaceAll, rfIgnoreCase] );
    msg := StringReplace(msg,' <> ',' Diferente de ',[rfReplaceAll, rfIgnoreCase] );
    msg := StringReplace(msg,' < ',' Menor Que ',[rfReplaceAll, rfIgnoreCase] );
    msg := StringReplace(msg,' > ',' Maior Que ',[rfReplaceAll, rfIgnoreCase] );
    msg := StringReplace(msg,'IS NULL ',' É Nulo ',[rfReplaceAll, rfIgnoreCase] );
    //if  Pos('É Nulo',msg) > 0 then msg := copy(msg,0,Pos(' É Nulo',msg)+5);

    msg := StringReplace(msg,' IS NOT NULL ',' Não é Nulo',[rfReplaceAll, rfIgnoreCase] );
    //if  Pos('Não é Nulo',msg) > 0 then msg := copy(msg,0,Pos('Não é Nulo',msg)+9);

    if (Pos(#39+'%',msg) > 0) and (Pos('%'+#39,msg) > 0) then
    begin
     msg := StringReplace(msg,'LIKE',' Possui o Texto',[rfReplaceAll, rfIgnoreCase] );
     msg := StringReplace(msg,'%','',[rfReplaceAll, rfIgnoreCase]);
    end;

    if Pos(#39+'%',msg) > 0 then
    begin
     msg := StringReplace(msg,'LIKE',' Terminando Com ',[rfReplaceAll, rfIgnoreCase] );
     msg := StringReplace(msg,'%','',[rfReplaceAll, rfIgnoreCase] );
    end;

    if Pos('%'+#39,msg) > 0 then
    begin
     msg := StringReplace(msg,'LIKE',' Começando Com ',[rfReplaceAll, rfIgnoreCase] );
     msg := StringReplace(msg,'%','',[rfReplaceAll, rfIgnoreCase] );
    end;

    if ((Pos('not like',msg) > 0)) then
    begin
          msg := StringReplace(msg,'not like',' Não Contêm',[rfReplaceAll, rfIgnoreCase] );

          msg := StringReplace(msg,'#','',[rfReplaceAll, rfIgnoreCase]);
          msg := StringReplace(msg,'%','',[rfReplaceAll, rfIgnoreCase] );
    end;

    if ((Pos('not in',msg) > 0)) then
    begin
          msg := StringReplace(msg,'not in',' Não Contêm',[rfReplaceAll, rfIgnoreCase] );

          msg := StringReplace(msg,'#','',[rfReplaceAll, rfIgnoreCase]);
          msg := StringReplace(msg,'%','',[rfReplaceAll, rfIgnoreCase] );
    end;

    if ((Pos('in',msg) > 0)) then
    begin
          msg := StringReplace(msg,'in',' Contêm',[rfReplaceAll, rfIgnoreCase] );

          msg := StringReplace(msg,'#','',[rfReplaceAll, rfIgnoreCase]);
          msg := StringReplace(msg,'%','',[rfReplaceAll, rfIgnoreCase] );
    end;

    if ((Pos('not between',msg) > 0)) then
    begin
          msg := StringReplace(msg,'not between','Não Está Entre',[rfReplaceAll, rfIgnoreCase] );

          msg := StringReplace(msg,'#','',[rfReplaceAll, rfIgnoreCase]);
          msg := StringReplace(msg,'%','',[rfReplaceAll, rfIgnoreCase] );
    end;

    if ((Pos('between',msg) > 0)) then
    begin
          msg := StringReplace(msg,'between','Entre',[rfReplaceAll, rfIgnoreCase] );

          msg := StringReplace(msg,'#','',[rfReplaceAll, rfIgnoreCase]);
          msg := StringReplace(msg,'%','',[rfReplaceAll, rfIgnoreCase] );
    end;

        if ((Pos('like',msg) > 0) and (Pos('not',msg) = 0)) then
    begin
          if (Pos('%#',msg) <= 0) and (Pos('#%',msg) <= 0) then
          begin
               msg := StringReplace(msg,'like',' Possui o Texto',[rfReplaceAll, rfIgnoreCase] );
          end;

          if ((Pos('%#',msg) > 0) AND (Pos('#%',msg) > 0)) then
          begin
               msg := StringReplace(msg,'like',' Possui o Texto',[rfReplaceAll, rfIgnoreCase] );
          end;

          if (Pos('#%',msg) > 0) and (Pos('%#',msg) = 0)  then
          begin
               msg := StringReplace(msg,'like',' Terminando Com ',[rfReplaceAll, rfIgnoreCase] );
          end;

          if (Pos('%#',msg) > 0) and ((Pos('#%',msg) = 0)) then
          begin
               msg := StringReplace(msg,'like',' Começando Com ',[rfReplaceAll, rfIgnoreCase] );
          end;

          msg := StringReplace(msg,'#','',[rfReplaceAll, rfIgnoreCase]);
          msg := StringReplace(msg,'%','',[rfReplaceAll, rfIgnoreCase] );
    end;

    Result := Trim(msg);
  end;
//SOL244125.18329- Marcelo Cardoso - FIM

   var bPula : Boolean;                
>>>>>>> remotes/origin/B_SOL244125
begin
  Result := True; // Vinicius Ferreira SOL 177563 KINTANA 1627861
  FormFiltro:= TFrmFiltraSql.Create(Self);
  FormFiltro.sIdReport := sIdReports;
<<<<<<< HEAD
  for iCont:= 0 to 4 do
=======

  //SOL244125.18329- Marcelo Cardoso - INICIO
  listFiltroConsulta := TStringList.Create;
  listFiltroConsulta.sorted := true;
  listFiltroConsulta.Duplicates := dupIgnore;
  //SOL244125.18329- Marcelo Cardoso - FIM


  //for iCont:= 0 to 4 do
    for iCont:= 0 to 6 do
  //SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
  begin
    case iCont of
      0: begin
           iCod  := FloatToStr(iIdConsulta);
           iOrig := FloatToStr(iOrigemConsulta);
         end;
      1: begin
           iCod  := FloatToStr(iIdSubConsulta1);
           iOrig := FloatToStr(iOrigemSubConsulta1);
         end;
      2: begin
           iCod  := FloatToStr(iIdSubConsulta2);
           iOrig := FloatToStr(iOrigemSubConsulta2);
         end;
      3: begin
           iCod  := FloatToStr(iIdSubConsulta3);
           iOrig := FloatToStr(iOrigemSubConsulta3);
         end;
      4: begin
           iCod  := FloatToStr(iIdSubConsulta4);
           iOrig := FloatToStr(iOrigemSubConsulta4);
         end;
<<<<<<< HEAD
=======
         //SOL244125.18329- Marcelo Cardoso - INICIO
      5: begin
           iCod  := FloatToStr(iIdSubConsulta5);
           iOrig := FloatToStr(iOrigemSubConsulta5);
         end;

      6: begin
           iCod  := FloatToStr(iIdSubConsulta6);
           iOrig := FloatToStr(iOrigemSubConsulta6);
         end;

         //SOL244125.18329- Marcelo Cardoso - FIM


>>>>>>> remotes/origin/B_SOL244125
    end;
    CdsAux.Data := Relatorio.GetDataPacket( 'SELECT TEMPLATE'     + EOL  +
                                            'FROM DATAVIEW'       + EOL  +
                                            'WHERE IDDATAVIEW = ' + iCod + EOL +
                                            '  AND ORIGEMCMDV = ' + iOrig);
    //Thaise: Chamando a tela somente se houver consulta válida.
    //Se, por exemplo houverem 2 subrelatórios, ela será chamada 2 vezes.
    if TRIM(CdsAux.FieldByName('TEMPLATE').AsString) <> '' then
    begin
      oSql := SqlConsulta;
      oSql.Sql.Clear;
      oSql.Sql.add(CdsAux.FieldByName('TEMPLATE').AsString);
      FormFiltro.SQLOrigem.Sql.Assign(oSql.Sql);
      Case iCont of
       0: FormFiltro.Caption := 'Filtra Consulta Principal';
       1: FormFiltro.Caption := 'Filtra Sub Consulta 1';
       2: FormFiltro.Caption := 'Filtra Sub Consulta 2';
       3: FormFiltro.Caption := 'Filtra Sub Consulta 3';
       4: FormFiltro.Caption := 'Filtra Sub Consulta 4';
<<<<<<< HEAD
      end;

=======
       //SOL244125.18329- Marcelo Cardoso - INICIO
       5: FormFiltro.Caption := 'Filtra Sub Consulta 5';
       6: FormFiltro.Caption := 'Filtra Sub Consulta 6';
       //SOL244125.18329- Marcelo Cardoso - FIM
      end;

      bPula := False;

>>>>>>> remotes/origin/B_SOL244125
      if FormFiltro.ShowModal = MrOk Then
      begin
        case iCont of
        0: begin
             // Alterado por FHBS - SOL: 152622 KTN: 1136610
             //if Trim(FormFiltro.sCondicoes) <> '' then
               sSqlParam:= FormFiltro.SQLOrigem.SQL.Text;
<<<<<<< HEAD
=======

               //SOL244125.18329- Marcelo Cardoso - INICIO
               for x := 0 to FormFiltro.lstTipoParam.Items.count - 1 do
               begin
                    if(bPula) then
                    begin
                         bPula := False;
                         Continue;
                    end;

                   //listFiltroConsulta.Add(FormFiltro.lstParam.Items[x]+ ' Igual a ' +FormFiltro.lstParamvalor.Items[x]);
                   if((FormFiltro.listFiltroConsulta[x] = 'between') OR (FormFiltro.listFiltroConsulta[x] = 'not between')) then
                   begin
                        listFiltroConsulta.Add(trataMSG(FormFiltro.lstParam.Items[x]+ ' '+ FormFiltro.listFiltroConsulta[x] +' ' +FormFiltro.lstParamvalor.Items[x] + ' a '+FormFiltro.lstParamvalor.Items[x+1]));
                        bPula := True;
                   end
                   else
                   begin
                        listFiltroConsulta.Add(trataMSG(FormFiltro.lstParam.Items[x]+ ' '+ FormFiltro.listFiltroConsulta[x] +' ' +FormFiltro.lstParamvalor.Items[x]));
                   end;
               end;

               for x := 0 to FormFiltro.LstCondicoes.Items.count - 1 do
                   listFiltroConsulta.Add(trataMSG(FormFiltro.LstCondicoes.Items[x]));

               //SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
           end;
        1: begin
             // Alterado por FHBS - SOL: 152622 KTN: 1136610
             //if Trim(FormFiltro.sCondicoes) <> '' then
               sSqlSubParam1:= FormFiltro.SQLOrigem.SQL.Text;
<<<<<<< HEAD
=======

                //SOL244125.18329- Marcelo Cardoso - INICIO
               //for x := 0 to FormFiltro.lstTipoParam.Items.count - 1 do
              //listFiltroConsulta.Add(FormFiltro.lstParam.Items[x] + ' ' + FormFiltro.CmbComparadores.Text + ' ' + FormFiltro.lstParamvalor.Items[x] + '' + FormFiltro.LstCondicoes.Items[x] );
               for x := 0 to FormFiltro.LstCondicoes.Items.count - 1 do
               listFiltroConsulta.Add( trataMSG(FormFiltro.LstCondicoes.Items[x]));
             //SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
            end;

        2: begin
             // Alterado por FHBS - SOL: 152622 KTN: 1136610
             //if Trim(FormFiltro.sCondicoes) <> '' then
               sSqlSubParam2:= FormFiltro.SQLOrigem.SQL.Text;
<<<<<<< HEAD
=======

               //SOL244125.18329- Marcelo Cardoso - INICIO
               //for x := 0 to FormFiltro.lstTipoParam.Items.count - 1 do
               //listFiltroConsulta.Add(FormFiltro.lstParam.Items[x] + ' ' + FormFiltro.CmbComparadores.Text + ' ' + FormFiltro.lstParamvalor.Items[x] + '' + FormFiltro.LstCondicoes.Items[x]);
               for x := 0 to FormFiltro.LstCondicoes.Items.count - 1 do
               listFiltroConsulta.Add( trataMSG(FormFiltro.LstCondicoes.Items[x]));
               //SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
           end;

        3: begin
             // Alterado por FHBS - SOL: 152622 KTN: 1136610
             //if Trim(FormFiltro.sCondicoes) <> '' then
               sSqlSubParam3:= FormFiltro.SQLOrigem.SQL.Text;
<<<<<<< HEAD
=======
               //SOL244125.18329- Marcelo Cardoso - INICIO
               //for x := 0 to FormFiltro.lstTipoParam.Items.count - 1 do
               //listFiltroConsulta.Add(FormFiltro.lstParam.Items[x] + ' ' + FormFiltro.CmbComparadores.Text + ' ' + FormFiltro.lstParamvalor.Items[x] + '' + FormFiltro.LstCondicoes.Items[x] );
               for x := 0 to FormFiltro.LstCondicoes.Items.count - 1 do
               listFiltroConsulta.Add( trataMSG(FormFiltro.LstCondicoes.Items[x]));
               //SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
           end;

        4: begin
             // Alterado por FHBS - SOL: 152622 KTN: 1136610
             //if Trim(FormFiltro.sCondicoes) <> '' then
               sSqlSubParam4:= FormFiltro.SQLOrigem.SQL.Text;
<<<<<<< HEAD
           end;
        end;
=======

               //SOL244125.18329- Marcelo Cardoso - INICIO
               //for x := 0 to FormFiltro.lstTipoParam.Items.count - 1 do
               //listFiltroConsulta.Add(FormFiltro.lstParam.Items[x] + ' ' + FormFiltro.CmbComparadores.Text + ' ' + FormFiltro.lstParamvalor.Items[x] + '' + FormFiltro.LstCondicoes.Items[x] );
               for x := 0 to FormFiltro.LstCondicoes.Items.count - 1 do
               listFiltroConsulta.Add( trataMSG(FormFiltro.LstCondicoes.Items[x]));
             //SOL244125.18329- Marcelo Cardoso - FIM
           end;
           //SOL244125.18329- Marcelo Cardoso - INICIO
        5: begin
                sSqlSubParam5:= FormFiltro.SQLOrigem.SQL.Text;

                  //for x := 0 to FormFiltro.lstTipoParam.Items.count - 1 do
                  //listFiltroConsulta.Add(FormFiltro.lstParam.Items[x] + ' ' + FormFiltro.CmbComparadores.Text + ' ' + FormFiltro.lstParamvalor.Items[x] + '' + FormFiltro.LstCondicoes.Items[x]);
                  for x := 0 to FormFiltro.LstCondicoes.Items.count - 1 do
                  listFiltroConsulta.Add( trataMSG(FormFiltro.LstCondicoes.Items[x]));

           end;

        6: begin
               sSqlSubParam6:= FormFiltro.SQLOrigem.SQL.Text;


               //for x := 0 to FormFiltro.lstTipoParam.Items.count - 1 do
               //listFiltroConsulta.Add(FormFiltro.lstParam.Items[x] + ' ' + FormFiltro.CmbComparadores.Text + ' ' + FormFiltro.lstParamvalor.Items[x] + '' + FormFiltro.LstCondicoes.Items[x]);
               for x := 0 to FormFiltro.LstCondicoes.Items.count - 1 do
               listFiltroConsulta.Add( trataMSG(FormFiltro.LstCondicoes.Items[x]));
               //SOL244125.18329- Marcelo Cardoso - FIM
           end;
           //SOL244125.18329- Marcelo Cardoso - FIM
        end;

>>>>>>> remotes/origin/B_SOL244125
      // Vinicius Ferreira SOL 177563 KINTANA 1627861  - Inicio
      end
      else
      begin
         sSqlParam := 'SELECT 1 FROM DUAL';
         Result := False;
      // Vinicius Ferreira SOL 177563 KINTANA 1627861  - Fim
      end;
<<<<<<< HEAD
    end;
  end;
  oSql:= nil;
  FormFiltro.Free;
end;

procedure TFrmCadRelatorio.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  cds.FieldByName('FLGRELATATIVO').asString := 'S';//Vinicius Maciel - SOL 168857 - KINTANA 1506883
   if pnConsulta.Visible then begin

=======

    end;
  end;

  //SOL244125.18329- Marcelo Cardoso - INICIO

  bSemParametro := False;
  bSemRegistro := False;

    if (sSqlParam <> '') then
  begin
    if Pos('NULO',sSqlParam) >= 1 then
      bSemParametro := true
    else
    if not ConsultaRegistro(sSqlParam) then
      bSemRegistro := True;
  end;

  if (sSqlSubParam1 <> '') then
  begin
    if Pos('NULO',sSqlSubParam1) >= 1 then
      bSemParametro := true
    else
    if not ConsultaRegistro(sSqlSubParam1) then
      bSemRegistro := True;
  end;

  if (sSqlSubParam2 <> '') then
  begin
    if Pos('NULO',sSqlSubParam2) >= 1 then
      bSemParametro := true
    else
    if not ConsultaRegistro(sSqlSubParam2) then
      bSemRegistro := True;
  end;

    if (sSqlSubParam3 <> '') then
  begin
    if Pos('NULO',sSqlSubParam3) >= 1 then
      bSemParametro := true
    else
    if not ConsultaRegistro(sSqlSubParam3) then
      bSemRegistro := True;
  end;

    if (sSqlSubParam4 <> '') then
  begin
    if Pos('NULO',sSqlSubParam4) >= 1 then
      bSemParametro := true
    else
    if not ConsultaRegistro(sSqlSubParam4) then
      bSemRegistro := True;
  end;

    if (sSqlSubParam5 <> '') then
  begin
    if Pos('NULO',sSqlSubParam5) >= 1 then
      bSemParametro := true
    else
    if not ConsultaRegistro(sSqlSubParam5) then
      bSemRegistro := True;
  end;

    if (sSqlSubParam6 <> '') then
  begin
    if Pos('NULO',sSqlSubParam6) >= 1 then
      bSemParametro := true
    else
    if not ConsultaRegistro(sSqlSubParam6) then
      bSemRegistro := True;
  end;

//SOL244125.18329- Marcelo Cardoso - FIM

  oSql:= nil;
  FormFiltro.Free;

end;


procedure TFrmCadRelatorio.sbtnInserirClick(Sender: TObject);

begin
  inherited;
  cds.FieldByName('FLGRELATATIVO').asString := 'S';//Vinicius Maciel - SOL 168857 - KINTANA 1506883


   //if pnConsulta.Visible then begin  - SOL244125.18329 - Marcelo Cardoso
      sbtnInsDet.Enabled := False; //SOL244125.18329- Marcelo Cardoso
      sbtnAltDet.Enabled := False;
      sbtnExcluiDet.Enabled := False;
            //sbtnInsDet.Enabled := False;
>>>>>>> remotes/origin/B_SOL244125
     if not(cds.State = dsInsert) then begin
       cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(0,FloatToStr(iOrigemConsulta));
       sOrigemConsultaGrid := cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString;
       cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(0);
<<<<<<< HEAD

       cdsNOME.data:= Relatorio.CarregaNomeCompo('SELECT ''		                                         '' NOME,''                   '' TIPO FROM dual',2,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
       if cdsConsultaGrid.IsEmpty then begin
            //sbtnAltDet.Enabled := False;
            //sbtnExcluiDet.Enabled := False;
            //sbtnInsDet.Enabled := False;
            pnConsulta.Enabled := False;
=======
	   //SOL244125.18329- Marcelo Cardoso - INICIO
       //cdsNOME.data:= Relatorio.CarregaNomeCompo('SELECT ''		                                         '' NOME,''                   '' TIPO FROM dual',2,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
       cdsNOME.data:= Relatorio.CarregaNomeCompo('SELECT '' '' NOME,'''' TIPO FROM dual',2,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
       //cdsConsultaGrid.fieldbyname('NAMEFILTRO').AssString:= '';
       cdsFiltro.Data := Relatorio.CarregaNomeCompo('SELECT '' '' NOME,'''' TIPO FROM dual',2,'');
	   //SOL244125.18329- Marcelo Cardoso - FIM
       if cdsConsultaGrid.IsEmpty then begin
            //sbtnAltDet.Enabled := False;
            //sbtnExcluiDet.Enabled := False;
            //sbtnInsDet.Enabled := False; //SOL244125.18329- Marcelo Cardoso - REMOVIDO COMENTARIO
            //pnConsulta.Enabled := False; //SOL244125.18329- Marcelo Cardoso - FEITO COMENTARIO
>>>>>>> remotes/origin/B_SOL244125
       end;
     end
     else
     begin
      cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(0);
     end;
<<<<<<< HEAD
  end;
=======
  //end; - SOL244125.18329 - Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125

end;

procedure TFrmCadRelatorio.cbxNomeConsultaChange(Sender: TObject);
var // ------------Início------------
    // Wylliam Silva -> Kintana: 667246 SOL: 248183
    // Foi substituido a string pela String Lista para
    // comportar o layout do relatório sem truncar

    {sSQL:string;}
    slLayoutRel: TStringList;
    //--------------Fim--------------

    i:Integer;
begin

  inherited;

  i:=0;
  if cbxNomeConsulta.DisplayValue <> '' then begin
     cbxNomeCampo.Text:='';
     cdsCampo.data := Relatorio.CarregOrigemNome(cbxNomeConsulta.DisplayValue);
     sOrigemConsultaGrid := cdsCampo.FieldByName('ORIGEMCMDV').AsString;
     cdsCampo.data := Relatorio.CarregaNomeCompo(cbxNomeConsulta.DisplayValue,1,sOrigemConsultaGrid);
     cbxNomeCampo.Text:='';
<<<<<<< HEAD
=======
     cbxFiltro.Text:= '';  //SOL244125.18329 - Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125

     // ----------------------------------Início--------------------------------
     // Passa o resultado da query do layout do relatório para uma string list
     // pois quando era passado para uma variavel do tipo string o valor do campo
     // long raw do oracle era truncado
     // Wylliam Silva -> PPM: 667246 SOL: 248183

     slLayoutRel := TStringList.Create;

     slLayoutRel.Assign(cdsCampo.FieldByName('TEMPLATE'));

     {sSQL := cdsCampo.FieldByName('TEMPLATE').AsString;}
     // ---------------Fim Wylliam Silva -> PPM: 667246 SOL: 248183-------------

     try
       //-------------------------------Início----------------------------------
       // Não vamos mais utilizar uma string
       // como paramentro e sim o String List
       // para poder comportar o campo Long Raw
       // Wylliam Silva -> PPM: 667246 SOL: 248183

       //Relatorio.substituiValorParam(sSQL);
       //cdsNomeCampo.Data := Relatorio.GetDataPacket(sSql); //Higor Nayde PPM 575651 SOL 242482

       Relatorio.substituiValorParam(slLayoutRel);
       cdsNomeCampo.Data := Relatorio.GetDataPacket('SELECT * FROM ('+slLayoutRel.Text+') WHERE 1=2');
       //--------------Fim Wylliam Silva -> PPM: 667246 SOL: 248183-------------

       //cdsNomeCampo.Data := Relatorio.CarregaNomeCompo('SELECT * FROM( '+sSQL +') t WHERE 1=2',2,sOrigemConsultaGrid);
     except
        MsgDlg('O template deste relatório está corrompido, o mesmo terá de ser redesenhado.','Erro',mtError,[mbOk],0);
       Exit;
     end;


     if sStatus = 'I' then
        cbxNomeCampo.Text:='';
     cdsNOME.data:= Relatorio.CarregaNomeCompo('SELECT ''		                                         '' NOME,''                   '' TIPO FROM dual',2,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
     for i:= 0 to cdsNomeCampo.Fields.Count-1 do begin
         if i = 0 then
            cdsNOME.Edit
         else
            cdsNOME.Append;

         cdsNOME.Fields[0].AsString := cdsNomeCampo.Fields[i].FieldName;
         cdsNOME.Fields[1].AsString := BuscaTipoDado(i,1);
        cdsNOME.Post;
     end;

  end;

end;

function TFrmCadRelatorio.BuscaTipoDado(iIndiceCampo,IdCampo: Integer): String;
begin
  if iIndiceCampo > -1 then
   begin //Higor Nayde PPM 575651 SOL 242482
      if IdCampo = 1 then begin
      case cdsNomeCampo.Fields[iIndiceCampo].DataType of

         ftString                               : Result := 'S';
         ftBytes, ftSmallint, ftInteger, ftWord : Result := 'I';
         ftFloat, ftCurrency                    : Result := 'N';
         ftBoolean                              : Result := 'B';
         ftDate, ftDateTime                     : Result := 'D';
         ftTime                                 : Result := 'T';
         ftBlob, ftMemo, ftGraphic, ftFmtMemo   : Result := 'BL';

      end;
      end else begin
      case cdsNomeConsultaFiltro.Fields[iIndiceCampo].DataType of

         ftString                               : Result := 'S';
         ftBytes, ftSmallint, ftInteger, ftWord : Result := 'I';
         ftFloat, ftCurrency                    : Result := 'N';
         ftBoolean                              : Result := 'B';
         ftDate, ftDateTime                     : Result := 'D';
         ftTime                                 : Result := 'T';
         ftBlob, ftMemo, ftGraphic, ftFmtMemo   : Result := 'BL';

      end;
      end; //Higor Nayde PPM 575651 SOL 242482
   end
   else
   begin
      Result := '';
   end;
end;

<<<<<<< HEAD
procedure TFrmCadRelatorio.SpeedButton1Click(Sender: TObject);
var
   //sSQL :string; Wylliam Silva -> PPM: 667246 SOL: 248183
   sLayoutRel: TStringList; //Wylliam Silva -> PPM: 667246 SOL: 248183
=======
procedure TFrmCadRelatorio.BtnSubConsFiltroClick(Sender: TObject);
var
   //sSQL :string; Wylliam Silva -> PPM: 667246 SOL: 248183
   sLayoutRel: TStringList; //Wylliam Silva -> PPM: 667246 SOL: 248183
   i: Integer;
>>>>>>> remotes/origin/B_SOL244125
begin
  inherited;
  sLayoutRel:= TStringList.Create; // Wylliam Silva -> PPM: 667246 SOL: 248183

  if (cbxNomeConsulta.Text <> '') and (cbxNomeCampo.Text <> '') then
  begin
    If MsConsulta.Executar = MrOk Then
    Begin
       try
          cdsNomeConsultaFiltro.Data :=  Relatorio.CarregaNomeCompo(MsConsulta.ValoresChave[ 2 ],1,MsConsulta.ValoresChave[ 1 ]);
         except
          MsgDlg('O template deste relatório está corrompido, o mesmo terá de ser redesenhado.','Erro',mtError,[mbOk],0);
          Exit;
       end;
       // cdsNomeConsultaFiltro.Data :=  Relatorio.CarregaNomeCompo(MsConsulta.ValoresChave[ 2 ],1);

       //sSQL := cdsNomeConsultaFiltro.FieldByName('TEMPLATE').AsString; Wylliam Silva -> PPM: 667246 SOL: 248183
       sLayoutRel.Assign(cdsNomeConsultaFiltro.FieldByName('TEMPLATE')); // Wylliam Silva -> PPM: 667246 SOL: 248183
       cdsNomeConsultaFiltro.Close;
       try
          //------------------------------Inicio--------------------------------
          //Wylliam Silva -> PPM: 667246 SOL: 248183

          //Relatorio.substituiValorParam(sSQL);
          //cdsNomeConsultaFiltro.Data := Relatorio.GetDataPacket(sSql);//Higor Nayde PPM 575651 SOL 242482
          Relatorio.substituiValorParam(sLayoutRel);
<<<<<<< HEAD
          cdsNomeConsultaFiltro.Data := Relatorio.GetDataPacket(sLayoutRel);//Higor Nayde PPM 575651 SOL 242482

=======
          //SOL244125.18329- Marcelo Cardoso -INICIO
          //cdsNomeConsultaFiltro.Data := Relatorio.GetDataPacket(sLayoutRel);//Higor Nayde PPM 575651 SOL 242482
          cdsNomeConsultaFiltro.Data := Relatorio.GetDataPacket('SELECT * FROM ('+sLayoutRel.Text+') WHERE 1=2');
          //SOL244125.18329- Marcelo Cardoso - FIM
>>>>>>> remotes/origin/B_SOL244125
          //------------Fim - Wylliam Silva -> PPM: 667246 SOL: 248183----------

        //cdsNomeConsultaFiltro.Data := Relatorio.CarregaNomeCompo(sSQL,2,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
       except
         MsgDlg('O template deste relatório está corrompido, o mesmo terá de ser redesenhado.','Erro',mtError,[mbOk],0);
        Exit;
       end;
<<<<<<< HEAD
                                                                                                 //IndexFieldCount
       if (cdsNomeConsultaFiltro.Fields.Count =1) AND (BuscaTipoDado(0,0) = cdsNOME.FieldByName('TIPO').AsString)   then begin

         edtNomeConsulta.Text := MsConsulta.ValoresChave[ 2 ];
         sIdConsultaFiltro     := ( MsConsulta.ValoresChave[ 0 ] );
         iOrigemSubConsulta1 := StrToFloat( MsConsulta.ValoresChave[ 1 ] );

       end else begin
          MsgDlg( 'Consulta selecionada não atende aos requisitos, por favor selecione outra', 'Atenção', mtWarning, [ mbOK ], 0 );
       end;
    End;
  end
end;

procedure TFrmCadRelatorio.sbtnInsDetClick(Sender: TObject);
begin
  //inherited;
  if sbtnInsDet.Down then
  begin
     //sbtnInsDet.Enabled:= True;
     dsConsultaGrid.AutoEdit:=True;
     dsNomeConsulta.AutoEdit:=True;
     sbtnAltDet.Enabled:= False;
     sbtnExcluiDet.Enabled:= False;
     gridConsulta.Visible := False;
     cbxNomeConsulta.Text:= '';
     cbxNomeCampo.Text:= '';
     edtNomeConsulta.Text:= '';
     sStatus:='I';
     //cdsNOME.data:= Relatorio.CarregaNomeCompo('SELECT ''		                                         '' NOME,''                   '' TIPO FROM dual',2);
     bbtnConfirmar.Enabled:= False;
     bbtnCancelar.Enabled:=False;
  end;


end;

procedure TFrmCadRelatorio.sbtnAltDetsClick(Sender: TObject);
begin
  //inherited;

end;

procedure TFrmCadRelatorio.btnOKClick(Sender: TObject);
begin
  if (cbxNomeConsulta.Text ='') then
  begin
     MsgDlg( 'Nome da Consulta é obrigatório', 'Aviso', MtInformation, [MbOk], 0 );
     Exit;
  end;

  if (cbxNomeCampo.Text ='') then
  begin
     MsgDlg( 'Nome Campo é obrigatório', 'Aviso', MtInformation, [MbOk], 0 );
     Exit;
  end;

  if edtNomeConsulta.Text = '' then begin
     MsgDlg( 'Campo Nome da Consulta por Filtro é obrigatório', 'Aviso', MtInformation, [MbOk], 0 );
     Exit;
  end;


  if sStatus = 'I' then
    InsertirConsultaFiltro
  else if sStatus = 'A' then
    AlterarConsultaFiltro;


  sbtnInsDet.Enabled:= True;
  sbtnExcluiDet.Enabled:= True;
  sbtnAltDet.Enabled:= true;
  sStatus:='B';
  if StrToFloat(sIdReports) > 0 then begin
    if not(cds.State in[dsInsert]) then begin
     cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(StrToFloat(sIdReports),FloatToStr(iOrigemConsulta));
     sOrigemConsultaGrid := cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString;
     cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports));
     if cdsConsultaGrid.IsEmpty then begin
          sbtnAltDet.Enabled := False;
          sbtnExcluiDet.Enabled := False;
     end;
    end;
     bbtnConfirmar.Enabled:= true;
     bbtnCancelar.Enabled:=true;

  end;
  dsConsultaGrid.AutoEdit:=False;
  dsNomeConsulta.AutoEdit:=False;
  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;
  sbtnExcluiDet.Down := False;
  gridConsulta.Visible := True;
end;
=======

      // if (cdsNomeConsultaFiltro.Fields.Count =1) AND (BuscaTipoDado(0,0) = cdsNOME.FieldByName('TIPO').AsString)   then
       //   begin
            //edtNomeConsulta.Text := MsConsulta.ValoresChave[ 2 ];
            cdsconsultagrid.fieldbyname('namefiltro').asstring:= MsConsulta.ValoresChave[ 2 ];
            sIdConsultaFiltro   := ( MsConsulta.ValoresChave[ 0 ] );
            iOrigemSubConsulta1 := StrToFloat( MsConsulta.ValoresChave[ 1 ] );
       //   end;

       // else begin
       //   MsgDlg( 'Consulta selecionada não atende aos requisitos, por favor selecione outra', 'Atenção', mtWarning, [ mbOK ], 0 );
       //   exit; // Marcelo Cardoso - Inicio - SOL244125.18329
       //end;

       //SOL244125.18329- Marcelo Cardoso -INICIO
       if sStatus = 'I' then
        cbxFiltro.Text:='';
        cdsFiltro.data:= Relatorio.CarregaNomeCompo('SELECT ''		                                         '' NOME,''                   '' TIPO FROM dual',2,'');
       for i:= 0 to cdsNomeConsultaFiltro.Fields.Count-1 do begin
          if i = 0 then
             cdsFiltro.Edit
           else
              cdsFiltro.Append;

          cdsFiltro.Fields[0].AsString := cdsNomeConsultaFiltro.Fields[i].FieldName;
          cdsFiltro.Fields[1].AsString := BuscaTipoDado(i,1);

          cdsFiltro.Post;
       end;

	   //SOL244125.18329- Marcelo Cardoso -FIM

    End;

  end
end;

//SOL244125.18329 - Marcelo Cardoso - Inicio
procedure TFrmCadRelatorio.sbtnInsDetClick(Sender: TObject);
begin
 inherited;
 // if sbtnInsDet.Down then
 //   begin
       //sbtnInsDet.Enabled:= True;
       //dsConsultaGrid.AutoEdit:=True;
       //dsNomeConsulta.AutoEdit:=True;
       //sbtnAltDet.Enabled:= False;
       //sbtnExcluiDet.Enabled:= False;
       //gridConsulta.Visible := False;

       //SOL244125.18329- Marcelo Cardoso - INICIO
       //dbgrdDet.SendToback;
       //cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(0,FloatToStr(iOrigemConsulta));
       cdsNOME.data:= Relatorio.CarregaNomeCompo('SELECT '' '' NOME,'''' TIPO FROM dual',2,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
       //edtNomeConsulta.Text:= '';
       cdsFiltro.data:= Relatorio.CarregaNomeCompo('SELECT '' '' NOME,'''' TIPO FROM dual',2,'');
       //cdsFiltro.Data := Relatorio.CarregaGridFiltro(-1);
       sStatus:='I';
       //cdsNOME.data:= Relatorio.CarregaNomeCompo('SELECT ''		                                         '' NOME,''                   '' TIPO FROM dual',2);
       //bbtnConfirmar.Enabled:= False;
       //bbtnCancelar.Enabled:=False;
  //  end
  //else
  //sbtnInsDet.Down := true;
  //SOL244125.18329- Marcelo Cardoso - FIM
  
end;

//SOL244125.18329 - Marcelo Cardoso - INICIO
//procedure TFrmCadRelatorio.sbtnAltDetsClick(Sender: TObject);
//begin
//  //inherited;
//
//end;
procedure TFrmCadRelatorio.bbtnOkDetClick(Sender: TObject);

begin

   if (cbxNomeConsulta.Text = EmptyStr) then
     begin
          MsgDlg( 'Informe a Consulta.', 'Atenção', MtInformation, [MbOk], 0 );
          Exit;
     end;

  if (cbxNomeCampo.Text = EmptyStr) then
     begin
          MsgDlg( 'Informe o Filtro da Consulta.', 'Atenção', MtInformation, [MbOk], 0 );
          Exit;
     end;

  if (dbConsultaFiltro.Text = EmptyStr) then
     begin
          MsgDlg( 'Informe a Consulta de Filtro.', 'Atenção', MtInformation, [MbOk], 0 );
          Exit;
     end;

  if (cbxFiltro.Text = EmptyStr) then
     begin
          MsgDlg( 'Informe o Filtro.', 'Atenção', MtInformation, [MbOk], 0 );

          Exit;
     end;

  inherited;
  //if (cbxNomeConsulta.Text ='') then
  //begin
  //   MsgDlg( 'Nome da Consulta é obrigatório', 'Aviso', MtInformation, [MbOk], 0 );
  //   Exit;
  //end;
  //    if (cbxNomeCampo.Text ='') then
  //    begin
  //       MsgDlg( 'Nome Campo é obrigatório', 'Aviso', MtInformation, [MbOk], 0 );
  //       Exit;
  //    end;
  //
  //    if edtNomeConsulta.Text = '' then begin
  //       MsgDlg( 'Campo Nome da Consulta por Filtro é obrigatório', 'Aviso', MtInformation, [MbOk], 0 );
  //       Exit;
  //    end;

    if CmeDetalhe.Operacao = opInserir then
        InsertirConsultaFiltro ;
    //else if sStatus = 'A' then

    if CmeDetalhe.Operacao = opAlterar then
     AlterarConsultaFiltro;

     

    //inherited;

//  //sbtnInsDet.Enabled:= True;
//  //sbtnExcluiDet.Enabled:= True;
//  //sbtnAltDet.Enabled:= true;
//  //SOL244125.18329- Marcelo Cardoso - FIM
//

//  sStatus:='B';
//  if StrToFloat(sIdReports) > 0 then begin
//    if not(cds.State in[dsInsert]) then begin
//     cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(StrToFloat(sIdReports),FloatToStr(iOrigemConsulta));
//     sOrigemConsultaGrid := cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString;
//     cdsFiltro.data:= Relatorio.CarregaNomeCompo('SELECT '' '' NOME,'''' TIPO FROM dual',2,'');
//     cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports));
////     SOL244125.18329- Marcelo Cardoso - INICIO
////     if cdsConsultaGrid.IsEmpty then begin
////         sbtnAltDet.Enabled := False;
////          sbtnExcluiDet.Enabled := False;
////     end;
//    end;
//
////     //bbtnConfirmar.Enabled:= true;
////     //bbtnCancelar.Enabled:=true;
//  end;

//  dsConsultaGrid.AutoEdit:=False;
//  dsNomeConsulta.AutoEdit:=False;
//  sbtnInsDet.Down := False;
//  sbtnAltDet.Down := False;
//  sbtnExcluiDet.Down := False;
//  gridConsulta.Visible := True;
//  SOL244125.18329 - Marcelo Cardoso - FIM
end;
  //SOL244125.18329 - Marcelo Cardoso - INICIO
>>>>>>> remotes/origin/B_SOL244125

procedure TFrmCadRelatorio.InsertirConsultaFiltro;
var sSQL, IDReportView : string;
    qryInset :TwwQuery;
begin
   qryInset := TwwQuery.create(Application);
   qryInset.DataBaseName := 'BaseDados';

   sSQL:= ' SELECT MAX(IDREPORTSLISTADATAVIEW) REPOTSVIEW FROM CM.REPORTSLISTADATAVIEW ';
   qryInset.close;
   qryInset.SQL.Text := sSQL;
   qryInset.Open;
   IDReportView := IntToStr(qryInset.FieldByName('REPOTSVIEW').AsInteger + 1);
<<<<<<< HEAD
=======

   if not dtmBaseDados.dbBaseDados.InTransaction then
>>>>>>> remotes/origin/B_SOL244125
   StartTransacao;

   try
      sSQL := 'INSERT into CM.REPORTSLISTADATAVIEW Values ('+IDReportView+','+
                          sIdReports+','+
                          //cdsNomeConsulta.Fields[1].AsString+',' +
                          cdsNomeConsulta.FieldByName('IDDATAVIEW').AsString+',' +
                          QuotedStr(cdsNome.Fields[0].AsString)+',' +
                          sIdConsultaFiltro+','+
                          cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString +','+
                          Cds.FieldByName('ORIGEMCMDV').AsString +','+
<<<<<<< HEAD
                          FloatToStr(iOrigemSubConsulta1) +')';
=======
                          FloatToStr(iOrigemSubConsulta1) +','+
                          QuotedStr(cdsFiltro.FieldByName('NOME').AsString) + ')';
>>>>>>> remotes/origin/B_SOL244125
      qryInset.close;
      qryInset.SQL.Text := sSQL;
      qryInset.Prepare;
      qryInset.ExecSQL;

<<<<<<< HEAD
      CommitTransacao;
   except
      RollBackTransacao;
      MsgDlg( 'Ocorreu um erro ao gravação, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
      qryInset.Destroy;
      Exit;
   end;
=======
      

      ///CommitTransacao;
      //dbgrdDet.SendToBack;   //
   except
      ///RollBackTransacao;
      MsgDlg( 'Ocorreu um erro ao gravação, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
      bbtnCancelarDet.click (); // Marcelo Cardoso
      Exit;
   end;

>>>>>>> remotes/origin/B_SOL244125
   qryInset.Destroy;
end;

procedure TFrmCadRelatorio.sbtnExcluiDetClick(Sender: TObject);
<<<<<<< HEAD
begin
  //inherited;
  if sbtnExcluiDet.Down then
  begin
    If MsgDlg( 'Deseja realmente excluir este registro?','Atenção', MtInformation, [MbYes,MBNO], 0 ) = IdYes then begin
      gridConsulta.Visible:=True;
      sbtnInsDet.Enabled:= True;
      sbtnAltDet.Enabled:= True;
      ExcluiConsulta;
      if StrToFloat(sIdReports) > 0 then begin
         cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(StrToFloat(sIdReports),FloatToStr(iOrigemConsulta));
         sOrigemConsultaGrid := cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString;
         cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports));
         if cdsConsultaGrid.IsEmpty then begin
            sbtnAltDet.Enabled := False;
            sbtnExcluiDet.Enabled := False;
         end;
      end;
    end;
  end;
  sbtnExcluiDet.Down := false;
end;

procedure TFrmCadRelatorio.sbtnAltDetClick(Sender: TObject);
begin
 //inherited;
  if sbtnAltDet.Down then
  begin
    dsConsultaGrid.AutoEdit:=True;
    dsNomeConsulta.AutoEdit:=True;
     sStatus:='A';
     sbtnInsDet.Enabled:= False;
     //sbtnAltDet.Enabled:= False;
     sbtnExcluiDet.Enabled:= False;
     gridConsulta.Visible := False;
     sIdConsultaFiltro:=  cdsConsultaGrid.FieldByName('IDDATAVIEWCONSULTA').AsString;
     cdsNomeConsultaFiltro.Data := Relatorio.CarregaNomeCompo(sIdConsultaFiltro,3,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
     edtNomeConsulta.Text := cdsConsultaGrid.FieldByName('NAMEFILTRO').AsString;//cdsNomeConsultaFiltro.FieldByName('NAME').AsString;

     sbtnAltDet.Enabled:= True;
     bbtnConfirmar.Enabled:= False;
     bbtnCancelar.Enabled:=False;
  end;
=======
//SOL244125.18329 - Marcelo Cardoso - INICIO
 var sSQL  : string;
qryDelete :TwwQuery;
begin
//sStatus:='E';
  if sbtnExcluiDet.Down then
   begin

   if MsgDlg( 'Deseja realmente excluir este registro?','Atenção', MtInformation, [MbYes,MBNO], 0 ) = IdYes then begin
      //SOL244125.18329 - Marcelo Cardoso - INICIO
      //gridConsulta.Visible:=True;
     //sbtnInsDet.Enabled:= True;
     //sbtnAltDet.Enabled:= True;      //ExcluiConsulta; SOL244125.18329 - Marcelo Cardoso - FIM

      if StrToFloat(sIdReports) > 0 then
        begin
          cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(StrToFloat(sIdReports),FloatToStr(iOrigemConsulta));
          sOrigemConsultaGrid := cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString;
          cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports));
          end;
     //SOL244125.18329 - Marcelo Cardoso

     //if cdsConsultaGrid.IsEmpty then begin
     //sbtnAltDet.Enabled := False;
    //sbtnExcluiDet.Enabled := False;
    end;//SOL244125.18329 - Marcelo Cardoso}    end;
 end;


  If MsgDlg( 'Deseja realmente excluir este registro?','Atenção', MtInformation, [MbYes,MBNO], 0 ) = IdYes then
  begin
         qryDelete := TwwQuery.create(Application);
         qryDelete.DataBaseName := 'BaseDados';
         if not dtmBaseDados.dbBaseDados.InTransaction then
         StartTransacao;
         try
            sSQL := 'DELETE FROM CM.REPORTSLISTADATAVIEW' +
                    ' WHERE IDREPORTSLISTADATAVIEW = '+cdsConsultaGrid.FieldByName('IDREPORTSLISTADATAVIEW').AsString;
            qryDelete.close;
            qryDelete.SQL.Text := sSQL;
            qryDelete.Prepare;
            qryDelete.ExecSQL;

            //CommitTransacao;  ////
         except
            //RollBackTransacao;   ////
           // MsgDlg( 'Ocorreu um erro ao excluir, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
            bbtnCancelarDet.click ();
            Exit;
         end;

         cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports)); ///
         FreeAndNil(qryDelete);
  end;
  CmeDetalhe.Operacao:= opApagar;
end;

//SOL244125.18329 - Marcelo Cardoso - FIM

procedure TFrmCadRelatorio.sbtnAltDetClick(Sender: TObject);
//SOL244125.18329 - Marcelo Cardoso - INICIO
var
   sLayoutRel: TStringList;
   i: Integer;
   CdsAux: TClientDataSet;
//SOL244125.18329 - Marcelo Cardoso - FIM
begin
  inherited;
 //  if sbtnAltDet.Down then
 //  begin
    //SOL244125.18329 - Marcelo Cardoso - INICIO
    //dsConsultaGrid.AutoEdit:=True;
    //dsNomeConsulta.AutoEdit:=True;
   //  sStatus:='A';
    // sbtnInsDet.Enabled:= False;
     //sbtnAltDet.Enabled:= False;
     //sbtnExcluiDet.Enabled:= False;
     //gridConsulta.Visible := False;
//     cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports));
//     sIdConsultaFiltro:=  cdsConsultaGrid.FieldByName('IDDATAVIEWCONSULTA').AsString;
//     cdsNomeConsultaFiltro.Data := Relatorio.CarregaNomeCompo(sIdConsultaFiltro,3,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
////     cdsConsultaGrid.FieldByName('NAMEFILTRO').AsString;
//     cdsNomeConsultaFiltro.FieldByName('NAME').AsString;
     {SOL244125.18329 - Marcelo Cardoso
     sbtnAltDet.Enabled:= True;
     bbtnConfirmar.Enabled:= False;
     bbtnCancelar.Enabled:=False; }
   //SOL244125.18329 - Marcelo Cardoso - INICIO
   // CdsAux := TClientDataSet.Create( nil );
   // sLayoutRel:= TStringList.Create;

//     try
//        cdsAux.Data :=  Relatorio.CarregaNomeCompo(cdsNomeConsultaFiltro.Fields[0].value,1,cdsNomeConsultaFiltro.Fields[1].value);
//       except
//        MsgDlg('O template deste relatório está corrompido, o mesmo terá de ser redesenhado.','Erro',mtError,[mbOk],0);
//        Exit;
//     end;
//
//     sLayoutRel.Assign(cdsAux.FieldByName('TEMPLATE'));
//     cdsAux.Close;
//     try
//        Relatorio.substituiValorParam(sLayoutRel);
//        cdsAux.Data := Relatorio.GetDataPacket(sLayoutRel);
//     except
//       MsgDlg('O template deste relatório está corrompido, o mesmo terá de ser redesenhado.','Erro',mtError,[mbOk],0);
//      Exit;
//     end;

//     cdsFiltro.data:= Relatorio.CarregaNomeCompo('SELECT ''		                                         '' NOME,''                   '' TIPO FROM dual',2,'');
//     for i:= 0 to cdsAux.Fields.Count-1 do begin
//         if i = 0 then
//            cdsFiltro.Edit
//         else
//            cdsFiltro.Append;
//
//         cdsFiltro.Fields[0].AsString := cdsAux.Fields[i].FieldName;
//         cdsFiltro.Fields[1].AsString := BuscaTipoDado(i,1);
//
//        cdsFiltro.Post;
//     end;
//
//     FreeAndNil(CdsAux);
//     FreeAndNil(sLayoutRel);

  // end;
 //  CmeDetalhe.Operacao:= opAlterar;
  //SOL244125.18329 - Marcelo Cardoso - fim

  //sbtnAltDet.Down := True;    //SOL244125.18329 - Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125
end;

procedure TFrmCadRelatorio.AlterarConsultaFiltro;
var sSQL : string;
    qryInset :TwwQuery;
begin
   qryInset := TwwQuery.create(Application);
   qryInset.DataBaseName := 'BaseDados';
<<<<<<< HEAD
=======
   if not dtmBaseDados.dbBaseDados.InTransaction then     ////
>>>>>>> remotes/origin/B_SOL244125
   StartTransacao;
   try
      sSQL := 'UPDATE CM.REPORTSLISTADATAVIEW SET IDREPORTS='+sIdReports+
                          ',IDDATAVIEWORIGEM='+cdsNomeConsulta.Fields[1].AsString+
<<<<<<< HEAD
                          ',NOMECAMPO='+QuotedStr(cdsNome.Fields[0].AsString)+
                          ',IDDATAVIEWCONSULTA='+sIdConsultaFiltro+ //de baixo
                          ',ORIGEMCMDV='+cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString +
                          ',ORIGEMCM='+Cds.FieldByName('ORIGEMCMDV').AsString +
                          ',ORIGEMCMDVORIGEM='+floatToStr(iOrigemSubConsulta1) +//até aqui
                          ' WHERE IDREPORTSLISTADATAVIEW = '+cdsConsultaGrid.FieldByName('IDREPORTSLISTADATAVIEW').AsString;
      qryInset.close;
      qryInset.SQL.Text := sSQL;
      qryInset.Prepare;
      qryInset.ExecSQL;

      CommitTransacao;
   except
      RollBackTransacao;
      MsgDlg( 'Ocorreu um erro ao gravação, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
      qryInset.Destroy;
=======
                          //',NOMECAMPO='+QuotedStr(cdsNome.Fields[0].AsString)+  //
                          ',NOMECAMPO='+QuotedStr(cbxNomeCampo.text);             //
      if  sIdConsultaFiltro <> '' then
            sSQL:= sSQL + ',IDDATAVIEWCONSULTA='+sIdConsultaFiltro; //de baixo
            sSQL:= sSQL + ',ORIGEMCMDV='+cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString +
                          ',ORIGEMCM='+Cds.FieldByName('ORIGEMCMDV').AsString +
                          ',ORIGEMCMDVORIGEM='+floatToStr(iOrigemSubConsulta1) +//até aqui
                          //',FILTRO='+QuotedStr(cdsFiltro.Fields[0].AsString)+
                          ',FILTRO='+QuotedStr(cbxFiltro.text)+
                          ' WHERE IDREPORTSLISTADATAVIEW = '+cdsConsultaGrid.FieldByName('IDREPORTSLISTADATAVIEW').AsString;
      qryInset.close;
      qryInset.SQL.Text := sSQL;
      //qryInset.Prepare;
      qryInset.ExecSQL;

      //CommitTransacao;  ///
   except
      //RollBackTransacao;   ///
      MsgDlg( 'Ocorreu um erro ao gravação, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
      bbtnCancelarDet.click ();
>>>>>>> remotes/origin/B_SOL244125
      Exit;
   end;
   qryInset.Destroy;
end;

<<<<<<< HEAD
=======
//procedure TFrmCadRelatorio.ExcluiConsultaFiltro;
//var sSQL  : string;
//    qryDelete :TwwQuery;
//begin
//   qryDelete := TwwQuery.create(Application);
//   qryDelete.DataBaseName := 'BaseDados';
//   StartTransacao;
//      try
//         sSQL := 'DELETE FROM CM.REPORTSLISTADATAVIEW' +
//                 'WHERE IDREPORTSLISTADATAVIEW = '+cdsConsultaGrid.FieldByName('IDREPORTSLISTADATAVIEW').AsString;
//         qryDelete.close;
//         qryDelete.SQL.Text := sSQL;
//         qryDelete.Prepare;
//         qryDelete.ExecSQL;
//
//        // CommitTransacao;  ///
//         except
//        // RollBackTransacao; ///
//       MsgDlg( 'Ocorreu um erro ao excluir, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
//         bbtnCancelarDet.click ();
//         Exit;
//         end;
//
//      cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports));
//      FreeAndNil(qryDelete);
//
//end;


>>>>>>> remotes/origin/B_SOL244125
procedure TFrmCadRelatorio.btnCancelarClick(Sender: TObject);
begin
  //inherited;
  sStatus:='B';
<<<<<<< HEAD
  sbtnInsDet.Enabled:= True;
  sbtnAltDet.Enabled:= True;
  sbtnExcluiDet.Enabled:= True;
=======
  //SOL244125.18329- Marcelo Cardoso -INICIO
  //sbtnInsDet.Enabled:= True;
  //sbtnAltDet.Enabled:= True;
  //sbtnExcluiDet.Enabled:= True;
  //SOL244125.18329 - Marcelo Cardoso -FIM

>>>>>>> remotes/origin/B_SOL244125
  sStatus:='B';
  if StrToFloat(sIdReports) > 0 then begin
     cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(StrToFloat(sIdReports),FloatToStr(iOrigemConsulta));
     sOrigemConsultaGrid := cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString;
     cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports));
<<<<<<< HEAD
     if cdsConsultaGrid.IsEmpty then begin
          sbtnAltDet.Enabled := False;
          sbtnExcluiDet.Enabled := False;
     end;

     bbtnConfirmar.Enabled:= True;
     bbtnCancelar.Enabled:=True;
=======

     {SOL244125.18329 - Marcelo Cardoso
     if cdsConsultaGrid.IsEmpty then begin
          sbtnAltDet.Enabled := False;
          sbtnExcluiDet.Enabled := False;
     end; SOL244125.18329 - Marcelo Cardoso}

     //bbtnConfirmar.Enabled:= True; //SOL244125.18329- Marcelo Cardoso
     //bbtnCancelar.Enabled:=True; SOL244125.18329 - Marcelo Cardoso
>>>>>>> remotes/origin/B_SOL244125

  end;
  dsConsultaGrid.AutoEdit:=False;
  dsNomeConsulta.AutoEdit:=False;

<<<<<<< HEAD
  sbtnInsDet.Down := False;
  sbtnAltDet.Down := False;
  sbtnExcluiDet.Down := False;
  gridConsulta.Visible := True;
=======
  //SOL244125.18329- Marcelo Cardoso -INICIO
  //sbtnInsDet.Down := False;
  //sbtnAltDet.Down := False;
  //sbtnExcluiDet.Down := False;
  //gridConsulta.Visible := True;
  //SOL244125.18329 - Marcelo Cardoso -FIM
>>>>>>> remotes/origin/B_SOL244125
end;

procedure TFrmCadRelatorio.ExcluiConsulta;
var sSQL : string;
    qryInset :TwwQuery;
begin
   qryInset := TwwQuery.create(Application);
   qryInset.DataBaseName := 'BaseDados';
<<<<<<< HEAD
=======
   if not dtmBaseDados.dbBaseDados.InTransaction then /////
>>>>>>> remotes/origin/B_SOL244125
   StartTransacao;
   try
      sSQL := 'DELETE FROM CM.REPORTSLISTADATAVIEW WHERE  IDREPORTSLISTADATAVIEW = '+cdsConsultaGrid.FieldByName('IDREPORTSLISTADATAVIEW').AsString+
                          ' AND IDREPORTS = '+sIdReports+
                          ' AND IDDATAVIEWORIGEM = '+cdsConsultaGrid.FieldByName('IDDATAVIEWORIGEM').AsString+
                          ' AND NOMECAMPO = '+QuotedStr(cdsConsultaGrid.FieldByName('NOMECAMPO').AsString)+
<<<<<<< HEAD
                          ' AND IDDATAVIEWCONSULTA = '+cdsConsultaGrid.FieldByName('IDDATAVIEWCONSULTA').AsString;
=======
                          ' AND IDDATAVIEWCONSULTA = '+cdsConsultaGrid.FieldByName('IDDATAVIEWCONSULTA').AsString+
                          ' AND FILTRO = '+QuotedStr(cdsFiltro.fieldbyname('FILTRO').AsString);
>>>>>>> remotes/origin/B_SOL244125
      qryInset.close;
      qryInset.SQL.Text := sSQL;
      qryInset.Prepare;
      qryInset.ExecSQL;

<<<<<<< HEAD
      CommitTransacao;
   except
      RollBackTransacao;
      MsgDlg( 'Ocorreu um erro ao Excluir, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
      qryInset.Destroy;
=======
      ///CommitTransacao; ////
   except
      //RollBackTransacao; ////
      MsgDlg( 'Ocorreu um erro ao Excluir, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );

      bbtnCancelarDet.click ();
>>>>>>> remotes/origin/B_SOL244125
      Exit;
   end;
   qryInset.Destroy;
end;

procedure TFrmCadRelatorio.ckbExportaClick(Sender: TObject);
begin
  inherited;
  if ckbExporta.Checked then
    sExporta := 'S'
  else
    sExporta := 'N';

end;

procedure TFrmCadRelatorio.cbxNomeCampoClick(Sender: TObject);
begin
 if cbxNomeConsulta.Text ='' then
    Exit;
  inherited;
<<<<<<< HEAD
  edtNomeConsulta.Text:= '';
=======
  //edtNomeConsulta.Text:= '';
>>>>>>> remotes/origin/B_SOL244125
  sIdConsultaFiltro   := '';
  iOrigemSubConsulta1 := 0;
end;

<<<<<<< HEAD
procedure TFrmCadRelatorio.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  if cdsConsultaGrid.IsEmpty then begin
      pnConsulta.Enabled := True;
      sbtnAltDet.Enabled:= False;
      sbtnExcluiDet.Enabled:= False;
      sbtnInsDet.Enabled:= True
  end else begin
      pnConsulta.Enabled := true;
      sbtnAltDet.Enabled:= True;
      sbtnInsDet.Enabled:= True;
      sbtnExcluiDet.Enabled:= True;
  end;

end;

procedure TFrmCadRelatorio.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if pnConsulta.Visible then begin
    sbtnInsDet.Enabled:= False;
    sbtnAltDet.Enabled:= False;
    sbtnExcluiDet.Enabled:= False;
  end;
end;
=======
//procedure TFrmCadRelatorio.sbtnAlterarClick(Sender: TObject);
//begin
//  inherited;
//  if cdsConsultaGrid.IsEmpty then begin
//      pnConsulta.Enabled := True;
//      sbtnAltDet.Enabled:= False;
//      sbtnExcluiDet.Enabled:= False;
//      sbtnInsDet.Enabled:= True
//  end else begin
//      pnConsulta.Enabled := true;
//      sbtnAltDet.Enabled:= True;
//     sbtnInsDet.Enabled:= True;
//      sbtnExcluiDet.Enabled:= True;
//  end;
//end;



//procedure TFrmCadRelatorio.bbtnCancelarClick(Sender: TObject);
//begin
//  inherited;
//  if pnConsulta.Visible then begin
//    sbtnInsDet.Enabled:= False;
//    sbtnAltDet.Enabled:= False;
//    sbtnExcluiDet.Enabled:= False;
//  end;
//end;
>>>>>>> remotes/origin/B_SOL244125

procedure TFrmCadRelatorio.cbxNomeCampoKeyPress(Sender: TObject;
  var Key: Char);
begin

  inherited;
 if key <> '' then
        Key := #0
end;

procedure TFrmCadRelatorio.cbxNomeConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
    inherited;
    if key <> '' then
        Key := #0 ;


end;

procedure TFrmCadRelatorio.cbxNomeCampoDropDown(Sender: TObject);
begin
  inherited;
 if cbxNomeConsulta.Text ='' then
 begin
   cbxNomeCampo.Text := '';
   cdsNOME.data:= Relatorio.CarregaNomeCompo('SELECT ''		                                         '' NOME,''                   '' TIPO FROM dual',2,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
   cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat('0'));
   Exit;
 end;
end;

<<<<<<< HEAD
=======
//SOL244125.18329 - Marcelo Cardoso - INICIO - O atualiza botoes foi feito desta maneira para não realizar altereção no fonte FCADASTROMESTREDETMT
procedure TFrmCadRelatorio.CmeCadastroAtualizaBotoes(Sender: TObject);
var ConfirmaVisible : Boolean;
begin
  inherited;
   { Configura o estado dos botões }
   ConfirmaVisible := false;
   sbtnInserir.Enabled := false;
   sbtnAlterar.Enabled := false;
   sbtnApagar.Enabled := false;
   sbtnProcurar.Enabled := false;
   case CmeCadastro.Operacao of
   opVazio :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;
               sbtnProcurar.Down := false;
               sbtnInserir.Enabled := true;
               sbtnAlterar.Enabled := false;
               sbtnApagar.Enabled := false;
               sbtnProcurar.Enabled := true;

               ConfirmaVisible := false;
          end;
   opIdle :
          begin
               sbtnInserir.Down := false;
               sbtnAlterar.Down := false;
               sbtnApagar.Down  := false;
               sbtnProcurar.Down := false;
               sbtnInserir.Enabled := true;
               sbtnProcurar.Enabled := true;

               if (cds.Active) and (not cds.IsEmpty) then
               begin
                  sbtnAlterar.Enabled := true;
                  sbtnApagar.Enabled := true;
               end
               else begin
                    sbtnAlterar.Enabled := false;
                    sbtnApagar.Enabled := false;
               end;
               ConfirmaVisible := false;
          end;
   opInserir :
             begin
                  sbtnInserir.Down := true;
                  sbtnInserir.Enabled := true;
                  ConfirmaVisible := true;
             end;
   opAlterar :
          begin
               sbtnAlterar.Down := true;
               sbtnAlterar.Enabled := true;
               ConfirmaVisible := true;
          end;
   opProcurar :
               begin
                    sbtnProcurar.Down := true;
                    sbtnProcurar.Enabled := true;
                    ConfirmaVisible := false;
               end;
   opApagar :
            begin
                 sbtnApagar.Down  := false;
                 sbtnApagar.Enabled := true;
                 ConfirmaVisible := false;
            end;
   else
       ConfirmaVisible := false;
   end;

   bbtnConfirmar.Enabled := ConfirmaVisible;
   bbtnCancelar.Enabled := ConfirmaVisible;

   if pnlfundo.Visible then
      pnlfundo.enabled := ConfirmaVisible;
end;
//SOL244125.18329 - Marcelo Cardoso - Fim


>>>>>>> remotes/origin/B_SOL244125
end.

