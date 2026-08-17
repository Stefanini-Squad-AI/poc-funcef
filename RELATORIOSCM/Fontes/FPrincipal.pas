unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, fTelaAut,
  TB97, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery, 
  StdCtrls, wwdblook, Mask, wwdbedit, DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls,
  IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti, Spin, ppViewr, ImgList,
  DBGrids, fcClearPanel, fcButtonGroup, fcOutlookBar, fcOutlookList,
  fcButton, fcImgBtn, fcShapeBtn, CorreioCM, fcLabel, AppEvnts, DBClient,
  CMApplicationEvents, StdActns, ActnList, fcStatusBar, SConnect, MConnect,
  uResource, FExportaRelatorioMT, CMNetUsers;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    ToolbarSep971: TToolbarSep97;
    Grupos2: TMenuItem;
    Manuteno1: TMenuItem;
    BtnDesign: TToolbarButton97;
    Consultas1: TMenuItem;
    Etiquetas1: TMenuItem;
    Configurao1: TMenuItem;
    Impresso1: TMenuItem;
    mnuGraficos: TMenuItem;
    MnutransfRelat: TMenuItem;
    MenuSep: TMenuItem;
    qryWorkFlow: TwwQuery;
    dsWorkFlow: TwwDataSource;
    mnuExpotar1: TMenuItem;
    mnuImportar: TMenuItem;
    procedure Grupos2Click(Sender: TObject);
    procedure Manuteno1Click(Sender: TObject);
    procedure BtnDesignClick(Sender: TObject);
    procedure Consultas1Click(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure Impresso1Click(Sender: TObject);
    procedure mnuGraficosClick(Sender: TObject);
    procedure MnutransfRelatClick(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure mnuExpotar1Click(Sender: TObject);
    procedure mnuImportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uSistema, uModulo, uEtiquetaCm, fMostraGraf, fTransfRelats,
     FDesenhoOutLookMT, FConsultaManualMT, FCadGrupoRelatorioMT, FImportaRelatorioMT;

{$R *.DFM}

procedure TfrmPrincipal.Grupos2Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmCadGrupoRelatorio, TFrmCadGrupoRelatorio, false );
end;

procedure TfrmPrincipal.Manuteno1Click(Sender: TObject);
begin
  inherited;
  Modulo.CadastraReports( trRelatorio );
end;

procedure TfrmPrincipal.BtnDesignClick(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmDesenhoOutLook, TFrmDesenhoOutLook, False );
end;

procedure TfrmPrincipal.Consultas1Click(Sender: TObject);
begin
  inherited;
  AbrirForm( FrmConsultaManual, TFrmConsultaManual, false );
end;

procedure TfrmPrincipal.Configurao1Click(Sender: TObject);
begin
  inherited;
  EtiquetaCm.AbrirFormConfig;
end;

procedure TfrmPrincipal.Impresso1Click(Sender: TObject);
begin
  inherited;
  EtiquetaCm.AbrirFormImpressao;
end;

procedure TfrmPrincipal.mnuGraficosClick(Sender: TObject);
begin
  inherited;
  Modulo.CadastraReports( TrGrafico );
end;

procedure TfrmPrincipal.MnutransfRelatClick(Sender: TObject);
begin
  inherited;
  AbrirFormModal( frmTransfRelats, TfrmTransfRelats );
end;



procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
begin
   inherited;

   if Sistema.FezLogin then
   begin
      stbarStatusBar.Panels[2].Text := Sistema.AliasServidor;

      Modulo.BuscaParam( Sistema.IdEmpresa );
      BtnDesign.Click;
   end;
end;



// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------



procedure TfrmPrincipal.mnuExpotar1Click(Sender: TObject);
begin
  inherited;
   AbrirForm( FrmExportaRelatorioMT, TFrmExportaRelatorioMT, false );
end;

procedure TfrmPrincipal.mnuImportarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmImportarRelatorioMT, TfrmImportarRelatorioMT, false );
end;

initialization

   Sistema.NomeModulo      := 'Gerador de Relatórios, Consultas e Gráficos';  // Nome do Módulo
   Sistema.IdModulo        := 33 ;                                            // IdModulo cadastrado no SAD
   Sistema.Versao := '3.04.21';
   Sistema.NomeAplicativo  := 'Gerador de Relatórios, Consultas e Gráficos';
   Modulo                  := TModulo.Create;


finalization

   Modulo.free;

end.
