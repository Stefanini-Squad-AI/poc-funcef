{-------------------------------------------------------------------------------------------------
Nº SIG......: 56577 
Data........: 18/01/2018
Responsável.: Andre Imakawa
Descrição...: Campo OBS não esta sendo exibido quando campo é muito grande.
----------------------------------------------------------------------------------------------------
Rotina......: FazerSelectsGeraisReport
Nº SOL......: 244125.18329
Data........: 06/10/2016
Responsável.: Marcelo Cardoso
Descrição...: Melhoria no Cad. de Relatórios, para que seja validado na primeira consulta, se existe
              dados para o parametro informado. Deve ser apresentado uma menssagem
Obeservação.: Devido ao execesso de altereçoês realizado neste sol, foi necessario refazer este
              fonte para que tenhamos uma codigo mais legivel possivel. O fonte anterior se encontra
              no GIT na MASTER com a nomeclatura FCadRelatorioMT_old.pas
-------------------------------------------------------------------------------------------------}

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
  Wwquery, DBGrids, TabControlDetalhe, CmDock  , FCadastroMestreDetMT,
  wwclient
{$ENDIF}
;

const EOL = #13#10;


type
  TFrmCadRelatorio = class(TFrmCadastroMestreDetMT)
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
    MsConsulta_new: TMontaSelect;
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
    Label12: TLabel;
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
    cdsFiltro: TCMClientDataSet;
    MsConsulta: TMontaSelect;
    dbConsultaFiltro: TDBEdit;
    BtnSubConsFiltro: TSpeedButton;
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
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure cbxNomeConsultaChange(Sender: TObject);
    procedure BtnSubConsFiltroClick(Sender: TObject);
    procedure bbtnOkDetClick (Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure ckbExportaClick(Sender: TObject);
    procedure cbxNomeCampoClick(Sender: TObject);
    procedure cbxNomeCampoKeyPress(Sender: TObject; var Key: Char);
    procedure cbxNomeConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure cbxNomeCampoDropDown(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);



  private
    { Private declarations }
    bCriaTemplate, bChangeLayout: Boolean;
    aRptMemoryStream: TMemoryStream;
    iIdConsulta, iOrigemConsulta, iIdGrupo, iOrigemGrupo: Double;
    iIdSubConsulta1, iOrigemSubConsulta1: Double;
    iIdSubConsulta2, iOrigemSubConsulta2: Double;
    iIdSubConsulta3, iOrigemSubConsulta3: Double;
    iIdSubConsulta4, iOrigemSubConsulta4: Double;

    iIdSubConsulta5, iOrigemSubConsulta5: Double;
    iIdSubConsulta6, iOrigemSubConsulta6: Double;
    sOrigemConsultaGrid, sIdConsultaFiltro :String;

    TipoRelatorio: TTipoRelatorio;
    sSqlParam     : String;
    sSqlSubParam1,
    sSqlSubParam2,
    sSqlSubParam3,
    sSqlSubParam4,
    sSqlSubParam5,
    sSqlSubParam6,
    sExporta : String;
    iCod, iOrig: String;
    listFiltroConsulta : TStringList;
    bSemRegistro :Boolean;

    function  ExisteItem(const pItemMenu: tMenuItem): Boolean;
    procedure AjustaFormulario(const pbSubReport: Boolean);
    procedure AcertaConsultasSubConsultas(const oQry: TCmClientDataSet);
    procedure ValidaItemMenuReport(Const oDesigner : TppDesigner);
    function  ChamaTelaParametro : Boolean;

  public
    { Public declarations }
    Relatorio: TCtrlReportsRelCM;
    Modulo: TCtrlModulo;
    procedure SetTipoRelatorio( pTipoRelatorio: TTipoRelatorio );
    procedure Seleciona( IdReports: Double = 0; OrigemCm: Double = -1 );
    function  BuscaTipoDado(iIndiceCampo,IdCampo: Integer): String;
    procedure InsertirConsultaFiltro;
    procedure AlterarConsultaFiltro;
    procedure ExcluiConsulta;

  end;

var
  FrmCadRelatorio: TFrmCadRelatorio;
  sIdReports, sStatus : string;

implementation

Uses uMensErro, UDataBase,uSistema, dBaseDados, uMidasUtil, fConfigChartMT,
  FDesenhoOutLookMT, fFiltraSql, FCadSubGrpRelatoriosMT, FTelaAut;

{$R *.DFM}

procedure TFrmCadRelatorio.SetTipoRelatorio( pTipoRelatorio: TTipoRelatorio );
Begin
   TipoRelatorio := pTipoRelatorio;
   Case pTipoRelatorio Of

      trRelatorio:
      Begin
         Caption := 'Cadastro de Relatórios';
         MontaSelect.Filtro.Add('(REPORTS.FLGTIPO IS NULL OR REPORTS.FLGTIPO = ''R'')');
         ckbExporta.Visible := True;
      End;

      trGrafico:
      Begin
         Caption := 'Cadastro de Gráficos';
         MontaSelect.Filtro.Add('REPORTS.FLGTIPO = ''G''');
         ckbExporta.Visible := False;
      End;

   End;
End;

procedure TFrmCadRelatorio.Seleciona( IdReports: Double = 0; OrigemCm: Double = -1 );
begin
   Case TipoRelatorio Of

      trRelatorio: Cds.Data := Relatorio.ListaReports( IdReports, OrigemCm,'AND (FLGTIPO IS NULL OR FLGTIPO = ''R'')');
      trGrafico: Cds.Data := Relatorio.ListaReports( IdReports, OrigemCm, 'AND FLGTIPO = ''G''');

   End;

   if IdReports > 0 then
      begin
         sIdReports := FloatToStr(IdReports);
         if not(cds.State in [dsInsert]) then
         begin
            cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(IdReports,Cds.FieldByName( 'ORIGEMCMDV' ).AsString);
            sOrigemConsultaGrid := cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString;
            cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(IdReports);
         end;
      end;
end;

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
  AjustaFormulario(False);


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

   iOrigemSubConsulta5 := Cds.FieldByName('ORIGEMCMDV5').AsFloat;
   iIdSubConsulta5     := Cds.FieldByName('IDSUBDATAVIEW5').AsFloat;
   EdSubConsulta5.Text := Cds.FieldByName( 'NomeSubDataView5' ).AsString;

   iOrigemSubConsulta6 := Cds.FieldByName('ORIGEMCMDV6').AsFloat;
   iIdSubConsulta6     := Cds.FieldByName('IDSUBDATAVIEW6').AsFloat;
   EdSubConsulta6.Text := Cds.FieldByName( 'NomeSubDataView6' ).AsString;
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

      AcertaConsultasSubConsultas(cds);
      AjustaFormulario(chkSubReport.Checked);

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

   AjustaFormulario(False);

   EdNome.SetFocus;
end;

procedure TFrmCadRelatorio.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   bCriaTemplate := True;
   bChangeLayout := False;
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
    sLayoutRel,
    sLayoutRelSub1,
    sLayoutRelSub2,
    sLayoutRelSub3,
    sLayoutRelSub4,
    sLayoutRelSub5,
    sLayoutRelSub6 : TStringList;
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
        For iCount := 0 to 6 do
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

              5: begin
                    iConsulta := iIdSubConsulta5;
                    iOrigem   := iOrigemSubConsulta5;
                 end;

              6: begin
                    iConsulta := iIdSubConsulta6;
                    iOrigem   := iOrigemSubConsulta6;
                 end;
           end;
           CdsAux.Data := Relatorio.GetDataPacket( 'SELECT TEMPLATE' + EOL +
                                                   'FROM DATAVIEW' + EOL +
                                                   'WHERE IDDATAVIEW = ' + FloatToStr(iConsulta) + EOL +
                                                   'AND ORIGEMCMDV = ' + FloatToStr(iOrigem));

           sLayoutRel     := TStringList.Create;
           sLayoutRelSub1 := TStringList.Create;
           sLayoutRelSub2 := TStringList.Create;
           sLayoutRelSub3 := TStringList.Create;
           sLayoutRelSub4 := TStringList.Create;
           sLayoutRelSub5 := TStringList.Create;
           sLayoutRelSub6 := TStringList.Create;
      // ----------------Fim------------------

           If Not cdsAux.IsEmpty then
           begin
              Case iCount of
                 0: begin
                       //Passa valor do campo "Template"(layout do relatório selecionado na tela)
                       //para a StringList, fazendo isso o valor não será truncado.
                       sLayoutRel.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
                       //Chama método para substituir os parametros identificados entre "#"
                       //pelo valor NULL
                       Relatorio.SubstituiValorParam(sLayoutRel);
                    end;

                 1: begin
                       //Passa valor do campo "Template"(layout do relatório selecionado na tela)
                       //para a StringList, fazendo isso o valor não será truncado.
                       sLayoutRelSub1.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
                       //Chama método para substituir os parametros identificados entre "#"
                       //pelo valor NULL
                       Relatorio.SubstituiValorParam(sLayoutRelSub1);

                    end;
                 2: begin

                       //Passa valor do campo "Template"(layout do relatório selecionado na tela)
                       //para a StringList, fazendo isso o valor não será truncado.
                       sLayoutRelSub2.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
                       //Chama método para substituir os parametros identificados entre "#"
                       //pelo valor NULL
                       Relatorio.SubstituiValorParam(sLayoutRelSub2);

                    end;

                 3: begin
                       //---------------------Início-----------------------
                       // Wylliam Silva -> PPM: 667246 SOL: 248183
                       // Foi utilizado aqui o paramentro sLayoutRel(TStringList)
                       // para comportar o campo Long Raw do banco de dados sem truncar

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
                       //Passa valor do campo "Template"(layout do relatório selecionado na tela)
                       //para a StringList, fazendo isso o valor não será truncado.
                       sLayoutRelSub4.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
                       //Chama método para substituir os parametros identificados entre "#"
                       //pelo valor NULL
                       Relatorio.SubstituiValorParam(sLayoutRelSub4);
                       //------------------------Fim-----------------------
                    end;

                       //SOL244125.18329- Marcelo Cardoso - INICIO
                 5: begin
                       //Passa valor do campo "Template"(layout do relatório selecionado na tela)
                      //para a StringList, fazendo isso o valor não será truncado.
                       sLayoutRelSub5.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
                      //Chama método para substituir os parametros identificados entre "#"
                      //pelo valor NULL
                      Relatorio.SubstituiValorParam(sLayoutRelSub5);
                    end;

                 6: Begin
                       //Passa valor do campo "Template"(layout do relatório selecionado na tela)
                       //para a StringList, fazendo isso o valor não será truncado.
                       sLayoutRelSub6.Assign(CdsAux.FieldByName( 'TEMPLATE' ));
                       //Chama método para substituir os parametros identificados entre "#"
                       //pelo valor NULL
                       Relatorio.SubstituiValorParam(sLayoutRelSub6);
                    end;

              end;
           end;
           //SOL244125.18329- Marcelo Cardoso - FIM
           CdsAux.Close;
        end;
     end;
  // *************************************************************************//
  //Thaise: Adicionado parâmetros na procedure FazerSelectsGeraisReport,
  //que trarão as consultas vindas da tela de filtro.
  procedure FazerSelectsGeraisReport(spSql, spSubSql1, spSubSql2, spSubSql3, spSubSql4, spSubSql5, spSubSql6 : String);
  var
      //  Darivaldo Alencar - SIG 56577 -inicio
      i: Integer;
      qry: TwwQuery;
      cds2: tclientdataset;
      //  Darivaldo Alencar - SIG 56577 -fim
  begin
    //Se os parâmetros estiverem vazios, ele chamará a consulta original da tela, pois indica
    //que não houve nenhuma consulta na tela de filtro.

    //-----------------Início------------------
    // Wylliam Silva -> PPM: 667246 SOL: 248183
    // Todos os parâmetros string foram substituidos por um StringList
    if Trim(spSubSql1) <> '' then
      sLayoutRelSub1.Add(spSubSql1);

    if Trim(spSubSql2) <> '' then
      sLayoutRelSub2.Add(spSubSql2);

    if Trim(spSubSql3) <> '' then
      sLayoutRelSub3.Add(spSubSql3);

    if Trim(spSubSql4) <> '' then
    begin
      sLayoutRelSub4.Clear;
      sLayoutRelSub4.Add(spSubSql4);
    end;

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

    if Trim(spSql) <> '' then
      sLayoutRel.Add(spSql);

    //CdsConsulta.Data      := Relatorio.GetDataPacket(sSql); - Wylliam Silva -> PPM: 667246 SOL: 248183
    //  Darivaldo Alencar - SIG 56577 -inicio
    //CdsConsulta.Data      := Relatorio.GetDataPacket(sLayoutRel);
    // ----Fim Wylliam Silva -> PPM: 667246 SOL: 248183----
    try
      qry:= TwwQuery.create(nil);
      qry.databasename:='BaseDados';
      FazQuery(qry,sLayoutRel.text);
      cds2:= tclientdataset.create(nil);
      for i:= 0 to qry.FieldCount-1 do
         cds2.FieldDefs.Add(qry.Fields[i].FieldName,qry.Fields[i].DataType,qry.Fields[i].Size,false);

      cds2.CreateDataSet;

      while not(qry.eof) do
        begin
          cds2.insert;
          for i:= 0 to qry.FieldCount-1 do
             cds2.fields[i].asString:= qry.fields[i].asString;
          cds2.post;
          qry.next;
        end;
        CdsConsulta.data:= cds2.data;
    finally
      qry.free;
    end;
    //  Darivaldo Alencar - SIG 56577 -fim

    RptCM.DataPipeline    := ppConsulta;
    ppConsulta.DataSource := dsConsulta;
    If chkSubReport.checked then
    begin

      // Todos os parâmetros string foram substituidos por um StringList

      If sLayoutRelSub1.Text <> EmptyStr then
      begin
        cdsSub1.Data              := Relatorio.GetDataPacket(sLayoutRelSub1);
        ppSubConsulta1.DataSource := dsSub1;
      end;

      If sLayoutRelSub2.Text <> EmptyStr then
      begin
        cdsSub2.Data              := Relatorio.GetDataPacket(sLayoutRelSub2);
        ppSubConsulta2.DataSource := dsSub2;
      end;

      If sLayoutRelSub3.Text <> EmptyStr then
      begin
        cdsSub3.Data              := Relatorio.GetDataPacket(sLayoutRelSub3);
        ppSubConsulta3.DataSource := dsSub3;
      end;

      If sLayoutRelSub4.Text <> EmptyStr then
      begin
        cdsSub4.Data              := Relatorio.GetDataPacket(sLayoutRelSub4);
        ppSubConsulta4.DataSource := dsSub4;
      end;

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

  Procedure CloseQuerys;
  begin
    cdsConsulta.Close;
    cdsSub1.Close;
    cdsSub2.Close;
    cdsSub3.Close;
    cdsSub4.Close;
    CdsSub5.Close;
    CdsSub6.Close;
  end;

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
     sSqlSubParam5 := '';
     sSqlSubParam6 := '';

     if ChkFiltro.Checked then  //Thaise - Para abrir tela de parâmetros caso
     begin
       if (not ChamaTelaParametro) then    //a opção tela de filtro seja ticada
       begin
          exit;
       end;
     end;

     bChangeLayout := True;

     ValidaItemMenuReport(DsgnCM);

     If chkSubReport.checked then
       DsgnCM.ShowComponents := DsgnCM.ShowComponents + [scSubReport]
     else
       DsgnCM.ShowComponents := DsgnCM.ShowComponents - [scSubReport];

     AjustarSelectsGeraisReport;

     Case TipoRelatorio Of
        trRelatorio : Begin

					              FazerSelectsGeraisReport(sSqlParam, sSqlSubParam1, sSqlSubParam2, sSqlSubParam3, sSqlSubParam4, sSqlSubParam5, sSqlSubParam6);

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

                        if bSemRegistro then
                         begin
                              MsgDlg( 'Não existem informações a serem exibidas.', 'Atenção', MtInformation, [MbOk], 0 );
                         end;

                        While (true) do
                        begin
                         // Mostra a tela de desenho do relatorio
                          DsgnCM.ShowModal;
                          lstSubReports := tStringList.Create;
                          DsgnCM.Report.GetSubReports(lstSubReports);
                          iQteReports := lstSubReports.Count;
                          FreeAndNil(lstSubReports);
                          If chkSubReport.Checked then
                             begin
                                If (iQteReports > 6) then //SOL244125.18329 - Marcelo Cardoso -
                                begin
                                   MsgDlg( 'Existem mais de 6 Sub-Relatórios definidos. Favor Corrigir!',
                                           'Atenção', MtInformation, [MbOk], 0 );
                                   continue;
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

                         sLayoutRel.Add(sSqlParam);

                         Application.CreateForm(TfrmConfigChart, frmConfigChart);
                         frmConfigChart._DadosGrafico.Data := Relatorio.GetDataPacket(sLayoutRel);

                         frmConfigChart.ShowModal;
                      finally
                         frmConfigChart.Free;
                      End;
                   End;
     End;

  End
  Else
     MsgDlg( 'Antes de desenhar o Relatório, favor informar todos os dados do mesmo',
             'Atenção', MtInformation, [MbOk], 0 );

   freeAndNil(listFiltroConsulta);
end;

procedure TFrmCadRelatorio.BtnConsSqlClick(Sender: TObject);
begin
  inherited;
  If MsConsulta.Executar = MrOk Then
     Begin
        iIdConsulta     := StrToFloat( MsConsulta.ValoresChave[ 0 ] );
        iOrigemConsulta := StrToFloat( MsConsulta.ValoresChave[ 1 ] );
        EdConsulta.Text := MsConsulta.ValoresChave[ 2 ];
     End
  Else
     Begin
        iIdConsulta     := -1;
        iOrigemConsulta := -1;
        EdConsulta.Text := '';
     End;
end;

procedure TFrmCadRelatorio.BtnConsGrupoClick(Sender: TObject);
begin
  inherited;
  AbrirFormModal( frmCadSubGrpRelatorios, TfrmCadSubGrpRelatorios );

  if frmCadSubGrpRelatorios.Result = MB_OK then
     begin
        iIdGrupo     := frmCadSubGrpRelatorios.IdGrupoRelatorio;
        iOrigemGrupo := frmCadSubGrpRelatorios.Origem;
        EdGrupo.Text := frmCadSubGrpRelatorios.DescricaoGrupoMestre
     end
  else
     begin
        iIdGrupo     := -1;
        iOrigemGrupo := -1;
        EdGrupo.Text := '';
     end;
end;

procedure TFrmCadRelatorio.bbtnConfirmarClick(Sender: TObject);

var
  ssql: String;
begin
  If ( Trim( EdNome.Text ) = '' ) Or ( EdConsulta.Text = '' ) Or
         ( CbModulo.Text = '' ) Or ( EdGrupo.Text = '' ) Then Begin
     MsgDlg( 'Favor informar todos os dados do Relatório.', 'Atenção', MtInformation, [MbOk], 0 );

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

  If Not CdsAux.IsEmpty Then
     Begin
        If Not CdsAux.Locate( 'IDDATAVIEW;ORIGEMCMDV',
                           Vararrayof( [ iidConsulta, iorigemconsulta ] ), [] ) Then
        Begin
           CdsAux.Close;
           MsgDlg( 'Você não tem permissão de acesso a visão especificada.',
                   'Cadastro de Relatórios', MtInformation, [MbOk], 0 );
        Exit;
        End;
     End;

   CdsAux.Close;

   if dtmBaseDados.dbBaseDados.InTransaction then
      CommitTransacao;

  inherited;
end;

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


procedure TFrmCadRelatorio.DsgnCMCreate(Sender: TObject);
begin
  inherited;
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
      Cds.FieldByName( 'ORIGEMCMDV5' ).AsFloat      := iOrigemSubConsulta5;
      Cds.FieldByName( 'IDSUBDATAVIEW5' ).AsFloat   := iIdSubConsulta5;
      Cds.FieldByName( 'ORIGEMCMDV6' ).AsFloat      := iOrigemSubConsulta6;
      Cds.FieldByName( 'IDSUBDATAVIEW6' ).AsFloat   := iIdSubConsulta6;

      If TipoRelatorio = trGrafico Then
      Else
         Begin
            If bChangeLayout Then
               Begin
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
    edSubConsulta5.Text := '';
    iIdSubConsulta5     := -1;
    iOrigemSubConsulta5 := -1;
    edSubConsulta6.Text := '';
    iIdSubConsulta6     := -1;
    iOrigemSubConsulta6 := -1;
  end;
end;

procedure TFrmCadRelatorio.AjustaFormulario(Const pbSubReport : Boolean);
begin

  lblSubConsulta1.Enabled := pbSubReport;
  lblSubConsulta2.Enabled := pbSubReport;
  lblSubConsulta3.Enabled := pbSubReport;
  lblSubConsulta4.Enabled := pbSubReport;
  lblSubConsulta5.Enabled := pbSubReport;
  lblSubConsulta6.Enabled := pbSubReport;
  edSubConsulta1.Enabled  := pbSubReport;
  edSubConsulta2.Enabled  := pbSubReport;
  edSubConsulta3.Enabled  := pbSubReport;
  edSubConsulta4.Enabled  := pbSubReport;
  edSubConsulta5.Enabled  := pbSubReport;
  edSubConsulta6.Enabled  := pbSubReport;
  BtnSubCons1Sql.Enabled  := pbSubReport;
  BtnSubCons2Sql.Enabled  := pbSubReport;
  BtnSubCons3Sql.Enabled  := pbSubReport;
  BtnSubCons4Sql.Enabled  := pbSubReport;
  BtnSubCons5Sql.Enabled  := pbSubReport;
  BtnSubCons6Sql.Enabled  := pbSubReport;
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
    end;
  End;
end;


procedure TFrmCadRelatorio.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
    if dtmBaseDados.dbBaseDados.InTransaction then
       RollBackTransacao;

  if MontaSelect.retornouValor then
  begin
    Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ),
               StrToFloat( MontaSelect.ValoresChave[ 1 ] ) );
    AcertaConsultasSubConsultas(cds);
    AjustaFormulario(chkSubReport.Checked);
  end;
end;

function TFrmCadRelatorio.ChamaTelaParametro : Boolean;

var iCont: Integer;
    FormFiltro    : TFrmFiltraSql;
    oSql          : TCMSqlParams;
    x : Integer;

 function ConsultaRegistro(Consulta: string):boolean;
  var
  cdsAux: TClientDataSet;
  retorno : boolean;
  qryAux :TwwQuery;

  begin
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

begin
  Result := True;
  FormFiltro:= TFrmFiltraSql.Create(Self);
  FormFiltro.sIdReport := sIdReports;

  listFiltroConsulta := TStringList.Create;
  listFiltroConsulta.sorted := true;
  listFiltroConsulta.Duplicates := dupIgnore;

    for iCont:= 0 to 6 do

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
         //SOL244125.18329- Marcelo Cardoso - INICIO
      5: begin
           iCod  := FloatToStr(iIdSubConsulta5);
           iOrig := FloatToStr(iOrigemSubConsulta5);
         end;

      6: begin
           iCod  := FloatToStr(iIdSubConsulta6);
           iOrig := FloatToStr(iOrigemSubConsulta6);
         end;

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
       5: FormFiltro.Caption := 'Filtra Sub Consulta 5';
       6: FormFiltro.Caption := 'Filtra Sub Consulta 6';
      end;


      if FormFiltro.ShowModal = MrOk Then
      begin
        case iCont of
        0: begin
               sSqlParam:= FormFiltro.SQLOrigem.SQL.Text;
           end;
        1: begin
               sSqlSubParam1:= FormFiltro.SQLOrigem.SQL.Text;
           end;

        2: begin
               sSqlSubParam2:= FormFiltro.SQLOrigem.SQL.Text;
           end;

        3: begin
               sSqlSubParam3:= FormFiltro.SQLOrigem.SQL.Text;
           end;

        4: begin
               sSqlSubParam4:= FormFiltro.SQLOrigem.SQL.Text;
           end;
        5: begin
                sSqlSubParam5:= FormFiltro.SQLOrigem.SQL.Text;
           end;

        6: begin
               sSqlSubParam6:= FormFiltro.SQLOrigem.SQL.Text;
           end;

        end;
      end
      else
      begin
         sSqlParam := 'SELECT 1 FROM DUAL';
         Result := False;
      end;

    end;
  end;

  bSemRegistro := False;

  if (sSqlParam <> '') then
  begin
     if not ConsultaRegistro(sSqlParam) then
     bSemRegistro := True;
  end;
  oSql:= nil;
  FormFiltro.Free;

end;


procedure TFrmCadRelatorio.sbtnInserirClick(Sender: TObject);

begin
   inherited;
   cds.FieldByName('FLGRELATATIVO').asString := 'S';
   sbtnInsDet.Enabled := False;
   sbtnAltDet.Enabled := False;
   sbtnExcluiDet.Enabled := False;

   if not(cds.State = dsInsert) then
      begin
         cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(0,FloatToStr(iOrigemConsulta));
         sOrigemConsultaGrid := cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString;
         cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(0);
         cdsNOME.data:= Relatorio.CarregaNomeCompo('SELECT '' '' NOME,'''' TIPO FROM dual',2,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
         cdsFiltro.Data := Relatorio.CarregaNomeCompo('SELECT '' '' NOME,'''' TIPO FROM dual',2,'');
      end
   else
      begin
         cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(0);
      end;
end;

procedure TFrmCadRelatorio.cbxNomeConsultaChange(Sender: TObject);
var
    // Foi substituido a string pela String Lista para
    // comportar o layout do relatório sem truncar
    slLayoutRel: TStringList;
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
     cbxFiltro.Text:= '';
     // ----------------------------------Início--------------------------------
     // Passa o resultado da query do layout do relatório para uma string list
     // pois quando era passado para uma variavel do tipo string o valor do campo
     // long raw do oracle era truncado
     slLayoutRel := TStringList.Create;

     slLayoutRel.Assign(cdsCampo.FieldByName('TEMPLATE'));

     try
       Relatorio.substituiValorParam(slLayoutRel);
       cdsNomeCampo.Data := Relatorio.GetDataPacket('SELECT * FROM ('+slLayoutRel.Text+') WHERE 1=2');
     except
        MsgDlg('O template deste relatório está corrompido, o mesmo terá de ser redesenhado.','Erro',mtError,[mbOk],0);
       Exit;
     end;


     if sStatus = 'I' then
        cbxNomeCampo.Text:='';
        cdsNOME.data:= Relatorio.CarregaNomeCompo('SELECT ''		                                         '' NOME,''                   '' TIPO FROM dual',2,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
        for i:= 0 to cdsNomeCampo.Fields.Count-1 do
        begin
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
     begin
        if IdCampo = 1 then
        begin
           case cdsNomeCampo.Fields[iIndiceCampo].DataType of
              ftString                               : Result := 'S';
              ftBytes, ftSmallint, ftInteger, ftWord : Result := 'I';
              ftFloat, ftCurrency                    : Result := 'N';
              ftBoolean                              : Result := 'B';
              ftDate, ftDateTime                     : Result := 'D';
              ftTime                                 : Result := 'T';
              ftBlob, ftMemo, ftGraphic, ftFmtMemo   : Result := 'BL';
           end;
        end
        else
        begin
           case cdsNomeConsultaFiltro.Fields[iIndiceCampo].DataType of
              ftString                               : Result := 'S';
              ftBytes, ftSmallint, ftInteger, ftWord : Result := 'I';
              ftFloat, ftCurrency                    : Result := 'N';
              ftBoolean                              : Result := 'B';
              ftDate, ftDateTime                     : Result := 'D';
              ftTime                                 : Result := 'T';
              ftBlob, ftMemo, ftGraphic, ftFmtMemo   : Result := 'BL';
           end;
        end;
     end
  else
  begin
     Result := '';
  end;
end;

procedure TFrmCadRelatorio.BtnSubConsFiltroClick(Sender: TObject);
var
   sLayoutRel: TStringList;
   i: Integer;
begin
  inherited;
  sLayoutRel:= TStringList.Create;

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

       sLayoutRel.Assign(cdsNomeConsultaFiltro.FieldByName('TEMPLATE')); // Wylliam Silva -> PPM: 667246 SOL: 248183
       cdsNomeConsultaFiltro.Close;

       try
          Relatorio.substituiValorParam(sLayoutRel);
          cdsNomeConsultaFiltro.Data := Relatorio.GetDataPacket('SELECT * FROM ('+sLayoutRel.Text+') WHERE 1=2');
       except
          MsgDlg('O template deste relatório está corrompido, o mesmo terá de ser redesenhado.','Erro',mtError,[mbOk],0);
          Exit;
       end;

       cdsconsultagrid.fieldbyname('namefiltro').asstring:= MsConsulta.ValoresChave[ 2 ];
       sIdConsultaFiltro   := ( MsConsulta.ValoresChave[ 0 ] );
       iOrigemSubConsulta1 := StrToFloat( MsConsulta.ValoresChave[ 1 ] );


       if sStatus = 'I' then
          cbxFiltro.Text:='';
          cdsFiltro.data:= Relatorio.CarregaNomeCompo('SELECT ''		                                         '' NOME,''                   '' TIPO FROM dual',2,'');

       for i:= 0 to cdsNomeConsultaFiltro.Fields.Count-1 do
       begin
          if i = 0 then
             cdsFiltro.Edit
          else
             cdsFiltro.Append;

          cdsFiltro.Fields[0].AsString := cdsNomeConsultaFiltro.Fields[i].FieldName;
          cdsFiltro.Fields[1].AsString := BuscaTipoDado(i,0);
          cdsFiltro.Post;
       end;
    End;
  end
end;

procedure TFrmCadRelatorio.sbtnInsDetClick(Sender: TObject);
begin
   inherited;
   cdsNOME.data:= Relatorio.CarregaNomeCompo('SELECT '' '' NOME,'''' TIPO FROM dual',2,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);
   cdsFiltro.data:= Relatorio.CarregaNomeCompo('SELECT '' '' NOME,'''' TIPO FROM dual',2,'');
   sStatus:='I';
end;

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

  if CmeDetalhe.Operacao = opInserir then
     InsertirConsultaFiltro;

  if CmeDetalhe.Operacao = opAlterar  then
     AlterarConsultaFiltro;
end;


procedure TFrmCadRelatorio.InsertirConsultaFiltro;
var sSQL, IDReportView : string;
    qryInset :TwwQuery;
begin
   qryInset := TwwQuery.create(Application);
   qryInset.DataBaseName := 'BaseDados';

   sSQL:= ' SELECT MAX(IDREPORTSLISTADATAVIEW) REPORTSVIEW FROM CM.REPORTSLISTADATAVIEW ';
   qryInset.close;
   qryInset.SQL.Text := sSQL;
   qryInset.Open;
   IDReportView := IntToStr(qryInset.FieldByName('REPORTSVIEW').AsInteger + 1);
   if not dtmBaseDados.dbBaseDados.InTransaction then
   StartTransacao;
   try

      sSQL := 'INSERT into CM.REPORTSLISTADATAVIEW Values ('+IDReportView+','+
                          sIdReports+','+
                          cdsNomeConsulta.Fields[1].AsString+',' +
                          QuotedStr(cdsNome.Fields[0].AsString)+',' +
                          sIdConsultaFiltro+','+
                          cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString +','+
                          Cds.FieldByName('ORIGEMCMDV').AsString +','+
                          FloatToStr(iOrigemSubConsulta1) +','+
                          QuotedStr(cdsFiltro.FieldByName('NOME').AsString) + ')';
      qryInset.close;
      qryInset.SQL.Text := sSQL;
      qryInset.Prepare;
      qryInset.ExecSQL;
   except
      MsgDlg( 'Ocorreu um erro ao gravação, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
      bbtnCancelarDet.click (); // Marcelo Cardoso
      Exit;
   end;
   qryInset.Destroy;
end;

procedure TFrmCadRelatorio.sbtnExcluiDetClick(Sender: TObject);
 var sSQL  : string;
qryDelete :TwwQuery;
begin
   if sbtnExcluiDet.Down then
   begin
      if MsgDlg( 'Deseja realmente excluir este registro?','Atenção', MtInformation, [MbYes,MBNO], 0 ) = IdYes then begin

         if StrToFloat(sIdReports) > 0 then
         begin
            cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(StrToFloat(sIdReports),FloatToStr(iOrigemConsulta));
            sOrigemConsultaGrid := cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString;
            cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports));
         end;
      end;
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
         except
            bbtnCancelarDet.click ();
            Exit;
         end;

     cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports)); ///
     FreeAndNil(qryDelete);
  end;
  CmeDetalhe.Operacao:= opApagar;
end;

procedure TFrmCadRelatorio.sbtnAltDetClick(Sender: TObject);
 var
   sLayoutRel: TStringList;
   i: Integer;
   CdsAux: TClientDataSet;
begin
   inherited;

   CdsAux := TClientDataSet.Create( nil );
   sLayoutRel:= TStringList.Create;

   try

     sIdConsultaFiltro:=  cdsConsultaGrid.FieldByName('IDDATAVIEWCONSULTA').AsString;
     cdsAux.Data := Relatorio.CarregaNomeCompo(sIdConsultaFiltro,3,cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString);

     cdsNomeConsultaFiltro.Data :=  Relatorio.CarregaNomeCompo(cdsAux.Fields[0].value,1,cdsAux.Fields[1].value);

     sLayoutRel.Assign(cdsNomeConsultaFiltro.FieldByName('TEMPLATE'));
     cdsNomeConsultaFiltro.Close;

     Relatorio.substituiValorParam(sLayoutRel);
     cdsNomeConsultaFiltro.Data := Relatorio.GetDataPacket(sLayoutRel);

     cdsFiltro.data:= Relatorio.CarregaNomeCompo('SELECT ''		                                         '' NOME,''                   '' TIPO FROM dual',2,'');
     for i:= 0 to cdsNomeConsultaFiltro.Fields.Count-1 do
     begin
        if i = 0 then
           cdsFiltro.Edit
        else
        cdsFiltro.Append;

        cdsFiltro.Fields[0].AsString := cdsNomeConsultaFiltro.Fields[i].FieldName;
        cdsFiltro.Fields[1].AsString := BuscaTipoDado(i,0);
        cdsFiltro.Post;
     end;

   finally
     FreeAndNil(CdsAux);
     FreeAndNil(sLayoutRel);
   end;
end;

procedure TFrmCadRelatorio.AlterarConsultaFiltro;
var sSQL : string;
    qryInset :TwwQuery;
begin
   qryInset := TwwQuery.create(Application);
   qryInset.DataBaseName := 'BaseDados';
   if not dtmBaseDados.dbBaseDados.InTransaction then     ////
   StartTransacao;
   try
      sSQL := 'UPDATE CM.REPORTSLISTADATAVIEW SET IDREPORTS='+sIdReports+
                          ',IDDATAVIEWORIGEM='+cdsNomeConsulta.Fields[1].AsString+
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
      qryInset.Prepare;
      qryInset.ExecSQL;
   except
      MsgDlg( 'Ocorreu um erro ao gravação, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
      bbtnCancelarDet.click ();
      Exit;
   end;
   qryInset.Destroy;
end;

procedure TFrmCadRelatorio.btnCancelarClick(Sender: TObject);
begin
  sStatus:='B';
  if StrToFloat(sIdReports) > 0 then
  begin
     cdsNomeConsulta.Data := Relatorio.CarregaNomeConsulta(StrToFloat(sIdReports),FloatToStr(iOrigemConsulta));
     sOrigemConsultaGrid := cdsNomeConsulta.FieldByName('ORIGEMCMDV').AsString;
     cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports))
  end;
  dsConsultaGrid.AutoEdit:=False;
  dsNomeConsulta.AutoEdit:=False;
end;

procedure TFrmCadRelatorio.ExcluiConsulta;
var sSQL : string;
    qryInset :TwwQuery;
begin
   qryInset := TwwQuery.create(Application);
   qryInset.DataBaseName := 'BaseDados';
   if not dtmBaseDados.dbBaseDados.InTransaction then
   StartTransacao;
   try
      sSQL := 'DELETE FROM CM.REPORTSLISTADATAVIEW WHERE  IDREPORTSLISTADATAVIEW = '+cdsConsultaGrid.FieldByName('IDREPORTSLISTADATAVIEW').AsString+
                          ' AND IDREPORTS = '+sIdReports+
                          ' AND IDDATAVIEWORIGEM = '+cdsConsultaGrid.FieldByName('IDDATAVIEWORIGEM').AsString+
                          ' AND NOMECAMPO = '+QuotedStr(cdsConsultaGrid.FieldByName('NOMECAMPO').AsString)+
                          ' AND IDDATAVIEWCONSULTA = '+cdsConsultaGrid.FieldByName('IDDATAVIEWCONSULTA').AsString+
                          ' AND FILTRO = '+QuotedStr(cdsFiltro.fieldbyname('FILTRO').AsString);
      qryInset.close;
      qryInset.SQL.Text := sSQL;
      qryInset.Prepare;
      qryInset.ExecSQL;


   except
      MsgDlg( 'Ocorreu um erro ao Excluir, Por favor entrar em contato', 'Aviso', MtInformation, [MbOk], 0 );
      bbtnCancelarDet.click ();
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
  sIdConsultaFiltro   := '';
  iOrigemSubConsulta1 := 0;
end;

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

//O atualiza botoes foi feito desta maneira para não realizar altereção no fonte FCADASTROMESTREDETMT
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


procedure TFrmCadRelatorio.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(sIdReports));
end;

procedure TFrmCadRelatorio.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  cdsConsultaGrid.Data := Relatorio.CarregaGridConsulta(StrToFloat(Cds.FieldByName('IDREPORTS').AsString));
end;

end.

