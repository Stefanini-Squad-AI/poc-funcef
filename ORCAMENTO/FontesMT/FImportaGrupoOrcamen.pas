unit FImportaGrupoOrcamen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ComCtrls, Buttons, Gauges, fcLabel, ExtCtrls,
  Db, DBClient,UCtrlImportaGrupoOrcamen,uCtrlPadroes,DBaseDados,USistema;

type
  TFImportacaoGrupoOrcamen = class(TForm)
    pnl_Top: TPanel;
    lblTitulo: TfcLabel;
    lblCaminho: TLabel;
    gProgresso: TGauge;
    lblStatus_Progresso: TLabel;
    edtCaminho: TEdit;
    btnAbrir: TBitBtn;
    BtnExcelparaCds: TBitBtn;
    pgcImporta: TPageControl;
    ts1: TTabSheet;
    mmoLayout: TMemo;
    tsGrade: TTabSheet;
    dbgrd1: TDBGrid;
    ts_Log: TTabSheet;
    Label1: TLabel;
    btnPararImportacao: TBitBtn;
    btnComecaImportacao: TBitBtn;
    btnSalvaLog: TBitBtn;
    mmoLog: TMemo;
    ds_Excel: TDataSource;
    cds_Excel: TClientDataSet;
    cds_ExcelLINHA_EXCEL: TIntegerField;
    dlgSave: TSaveDialog;
    dlgOpen: TOpenDialog;
    cds_ExcelPLANO_ORCAMENTARIO: TStringField;
    cds_ExcelCODIGO_GRUPO: TStringField;
    cds_ExcelDESCRICAO_GRUPO: TStringField;
    cds_ExcelFLAG_ANALITICO_SINTETICO: TStringField;
    cds_ExcelFLAG_POSITIVO_NEGATIVO: TStringField;
    cds_ExcelFLAG_RESULTADO: TStringField;
    cds_ExcelID_FORMULA: TStringField;
    cds_ExcelIDPLANOORCAMEN: TIntegerField;
    procedure btnAbrirClick(Sender: TObject);
    procedure BtnExcelparaCdsClick(Sender: TObject);
    procedure btnComecaImportacaoClick(Sender: TObject);
    procedure btnSalvaLogClick(Sender: TObject);
    procedure btnPararImportacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImportacaoGrupoOrcamen: TFImportacaoGrupoOrcamen;
  CtrlImportaGrupoOrcamen: TCtrlImportaGrupoOrcamen;

implementation


{$R *.DFM}

procedure TFImportacaoGrupoOrcamen.btnAbrirClick(Sender: TObject);
begin
     if (dlgOpen.Execute) then
         edtCaminho.text := dlgOpen.FileName
     else
         edtCaminho.text := '';

     BtnExcelparaCds.Enabled := (Trim(edtCaminho.text) <> '');
     mmoLog.Lines.Clear;
end;

procedure TFImportacaoGrupoOrcamen.BtnExcelparaCdsClick(Sender: TObject);
begin
      pgcImporta.ActivePageIndex := 1;
      Application.ProcessMessages;

      //Importar Planilha
      lblStatus_Progresso.Caption := 'Importando os dados da planilha excel...';
      cds_Excel.EmptyDataSet;
      CtrlImportaGrupoOrcamen.ImportarPlanilhaEXCEL(Trim(edtCaminho.Text));

      lblStatus_Progresso.Caption := 'Pronto para começar.';
      btnComecaImportacao.Enabled :=  (CtrlImportaGrupoOrcamen.Total_Importar > 0);
      btnSalvaLog.Enabled         :=  (CtrlImportaGrupoOrcamen.Total_Importar > 0);

      if (CtrlImportaGrupoOrcamen.Total_Importar > 0) then
      begin
           pgcImporta.ActivePageIndex := 2;
      end;
end;

procedure TFImportacaoGrupoOrcamen.btnComecaImportacaoClick(
  Sender: TObject);
begin
     //Mensagem de confirmação
     if Application.MessageBox('Deseja realmente iniciar a importação do orçamento?','Atenção',36) = 6 then
     begin
         TRY
             Screen.Cursor               := crHourGlass;
             mmoLog.Lines.Clear;
             btnComecaImportacao.Visible := false;
             btnPararImportacao.Visible  := true;
             btnSalvaLog.Enabled         := false;
             btnAbrir.Enabled            := false;
             BtnExcelparaCds.Enabled     := false;
             lblStatus_Progresso.Caption := 'Importando dados ao banco de dados...';
             Application.ProcessMessages;

             //Importar Dados
             CtrlImportaGrupoOrcamen.ImportarDados();

             //Carregar Log
             mmoLog.Lines := CtrlImportaGrupoOrcamen.Log;

             if CtrlImportaGrupoOrcamen.Total_Erros > 0 then
             begin
                 Application.MessageBox(PChar('Ocorrem erros na importação do orçamento.' + #13 +
                                              'Favor verificar arquivo de log.'),'Atenção',48);
             end;

         FINALLY
             btnComecaImportacao.Visible := true;
             btnPararImportacao.Visible  := false;
             btnSalvaLog.Enabled         := true;
             btnAbrir.Enabled            := true;
             BtnExcelparaCds.Enabled     := true;
             lblStatus_Progresso.Caption := 'Operação concluída.';
             Application.ProcessMessages;
             Screen.Cursor := crDefault;
         end;
     end;
end;

procedure TFImportacaoGrupoOrcamen.btnSalvaLogClick(Sender: TObject);
begin
     if (mmoLog.Lines.Text = '') then
     begin
        Application.MessageBox('Não há log apra ser salvo.','Atenção',48);
        Exit;
     end
     else
     begin
         if dlgSave.Execute then
            mmoLog.Lines.SaveToFile(dlgSave.Filename);
     end;
end;

procedure TFImportacaoGrupoOrcamen.btnPararImportacaoClick(
  Sender: TObject);
begin
     //CtrlImportaEntDados.InterromperImportacao();
     Application.ProcessMessages;
end;

procedure TFImportacaoGrupoOrcamen.FormCreate(Sender: TObject);
begin
     //Cria Dataset
     cds_Excel.CreateDataSet;
     cds_Excel.EmptyDataSet;

     //Cria Controle
     CtrlImportaGrupoOrcamen            := TCtrlImportaGrupoOrcamen.Create();
     CtrlImportaGrupoOrcamen.Initialize(DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False);


     CtrlImportaGrupoOrcamen.DataBase   := DtmBaseDados.dbBaseDados;
     CtrlImportaGrupoOrcamen.cdsExcel   := cds_Excel;
     CtrlImportaGrupoOrcamen.bProgresso := gProgresso;

     //Controles
     BtnExcelparaCds.Enabled     := false;
     btnComecaImportacao.Enabled := false;
     btnSalvaLog.Enabled         := false;
     pgcImporta.ActivePageIndex  := 0;
end;

procedure TFImportacaoGrupoOrcamen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //Destrói Controle
   FreeAndNil(CtrlImportaGrupoOrcamen);

   //Destrói Dataset
   cds_Excel.CLose;


   Action := caFree;
end;

end.
