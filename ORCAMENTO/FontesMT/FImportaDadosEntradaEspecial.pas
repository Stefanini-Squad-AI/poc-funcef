{ --------------------------------------------------------------------------------------------------
Rotina......: ValidaDados, GravarOrcamento
Nº SOL......: 190498
Nº KINTANA..: 1969004
Data........: 22/11/2013
Responsável.: Felipe A. Santos
Descrição...: inclusão dos campos Atividade/projeto e Fornecedor/SubDespesa na importação dos dados,
              o campo PLANO DE TRABALHO foi retirado.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaPlanoOrcamento, ImportarDados, GravarOrcamento
Nº SOL......: 172383-7765
Nº KINTANA..: 1556948
Data........: 26/03/2012
Responsável.: Edilaine Ferraresi
Descrição...: seleção do parametro Plano Orçamentário na tela de importação
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: Retornar_IdCriterio_porGrupoPeriodo
Nº SOL......: 122291
Nº KINTANA..: 597829
Data........: 23/03/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Nova tela de importação de Dados.
----------------------------------------------------------------------------------------------------}
unit FImportaDadosEntradaEspecial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, TB97Tlbr, TB97, Gauges, StdCtrls, Buttons, fcLabel, ExtCtrls,
  ComCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBClient,UCtrlImportaEntDados,
  DBGrids,uSistema,FCadastroMT,uCtrlPadroes, wwdblook, CMDBLookupCombo,
  uCMClientDataSet;

type
  TFImportaEntradaDadosEspecial = class(TForm)
    pnl_Top: TPanel;
    lblTitulo: TfcLabel;
    edtCaminho: TEdit;
    lblCaminho: TLabel;
    btnAbrir: TBitBtn;
    gProgresso: TGauge;
    lblStatus_Progresso: TLabel;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    CMSeparaWizard2: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    pgcImporta: TPageControl;
    ts_Log: TTabSheet;
    tsGrade: TTabSheet;
    Label1: TLabel;
    BtnExcelparaCds: TBitBtn;
    btnComecaImportacao: TBitBtn;
    btnSalvaLog: TBitBtn;
    ds_Excel: TDataSource;
    dlgOpen: TOpenDialog;
    cds_Excel: TClientDataSet;
    dbgrd1: TDBGrid;
    strngfld_ExcelCODIGO_GRUPO: TStringField;
    strngfld_ExcelPLANO_PREVIDENCIARIO: TStringField;
    strngfld_ExcelPATROCIONADORA: TStringField;
    strngfld_ExcelPERIODO: TStringField;
    strngfld_ExcelEXERCICIO: TStringField;
    strngfld_ExcelSOBREESCREVER: TStringField;
    strngfld_ExcelCRITERIO_RATEIO: TStringField;
    strngfld_ExcelVALOR_RATEIO: TStringField;
    strngfld_ExcelCENTRO_CUSTO: TStringField;
    cds_ExcelLINHA_EXCEL: TIntegerField;
    dlgSave: TSaveDialog;
    ts1: TTabSheet;
    mmoLayout: TMemo;
    btnPararImportacao: TBitBtn;
    mmoLog: TMemo;
    cds_ExcelPROGRAMA: TStringField;
    cds_ExcelTIPODESPESA: TStringField;
    cdsPlanoOrc: TCMClientDataSet;
    Label5: TLabel;
    cboPlanoOrc: TCMDBLookupCombo;
    cds_ExcelATIVIDADEPROJETO: TStringField;
    cds_ExcelIDDESPESAORC: TStringField;
    procedure bbtnSairClick(Sender: TObject);
    procedure btnSalvaLogClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExcelparaCdsClick(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure btnComecaImportacaoClick(Sender: TObject);
    procedure btnPararImportacaoClick(Sender: TObject);
    procedure cboPlanoOrcChange(Sender: TObject);
  private
    { Private declarations }
    iIdPlanoOrc : integer;
  public
    { Public declarations }
    CtrlImportaEntDados: TCtrlImportaEntDados;
  end;

var
  FImportaEntradaDadosEspecial: TFImportaEntradaDadosEspecial;

implementation

{$R *.DFM}

procedure TFImportaEntradaDadosEspecial.bbtnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFImportaEntradaDadosEspecial.btnSalvaLogClick(Sender: TObject);
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

procedure TFImportaEntradaDadosEspecial.FormCreate(Sender: TObject);
begin
     //Cria Dataset
     cds_Excel.CreateDataSet;
     cds_Excel.EmptyDataSet;

     //Cria Controle
     CtrlImportaEntDados            := TCtrlImportaEntDados.Create();
     CtrlImportaEntDados.InitializeAs(Padroes);
     CtrlImportaEntDados.cdsExcel   := cds_Excel;
     CtrlImportaEntDados.bProgresso := gProgresso;

     // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948
     iIdPlanoOrc := -1;
     cdsPlanoOrc.data := CtrlImportaEntDados.ListaPlanoOrcamento;
     // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948 - fim

     //Controles
     BtnExcelparaCds.Enabled     := false;
     btnComecaImportacao.Enabled := false;
     btnSalvaLog.Enabled         := false;
     pgcImporta.ActivePageIndex  := 0;
end;

procedure TFImportaEntradaDadosEspecial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //Destrói Controle
   FreeAndNil(CtrlImportaEntDados);

   //Destrói Dataset
   cds_Excel.CLose;
end;

procedure TFImportaEntradaDadosEspecial.BtnExcelparaCdsClick(
  Sender: TObject);
begin
      pgcImporta.ActivePageIndex := 1;
      Application.ProcessMessages;

      //Importar Planilha
      lblStatus_Progresso.Caption := 'Importando os dados da planilha excel...';
      CtrlImportaEntDados.ImportarPlanilhaEXCEL(Trim(edtCaminho.Text), cdsPlanoOrc.FieldByName('ANO').AsString);

      lblStatus_Progresso.Caption := 'Pronto para começar.';
      btnComecaImportacao.Enabled :=  (CtrlImportaEntDados.Total_Importar > 0);
      btnSalvaLog.Enabled         :=  (CtrlImportaEntDados.Total_Importar > 0);

      if (CtrlImportaEntDados.Total_Importar > 0) then
      begin
           pgcImporta.ActivePageIndex := 2;
      end;
end;

procedure TFImportaEntradaDadosEspecial.btnAbrirClick(Sender: TObject);
begin
     if (dlgOpen.Execute) then
         edtCaminho.text := dlgOpen.FileName
     else
         edtCaminho.text := '';

     // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948 - acrescentado plano orçamentario na condição
     BtnExcelparaCds.Enabled := (Trim(edtCaminho.text) <> '') and (cboPlanoOrc.text <> '');
     mmoLog.Lines.Clear;

end;

procedure TFImportaEntradaDadosEspecial.btnComecaImportacaoClick(
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
             CtrlImportaEntDados.ImportarDados( iIdPlanoOrc );   // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948 - passar plano para função

             //Carregar Log
             mmoLog.Lines := CtrlImportaEntDados.Log;

             if CtrlImportaEntDados.Total_Erros > 0 then
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

procedure TFImportaEntradaDadosEspecial.btnPararImportacaoClick(
  Sender: TObject);
begin
     CtrlImportaEntDados.InterromperImportacao();
     Application.ProcessMessages;
end;


procedure TFImportaEntradaDadosEspecial.cboPlanoOrcChange(Sender: TObject);
begin
  // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948
  iIdPlanoOrc := -1;
  if (cboPlanoOrc.text <> '') then
  begin
    if cboPlanoOrc.LookUpValue <> '' then
    begin
      if cdsPlanoOrc.FieldByName('ANO').AsString = '' then
      begin
        Application.MessageBox(PChar('Atenção, o Plano selecionado não tem Ano definido.' + #13 +
                                     'Favor acessar o cadastro de Plano Orçamentário e efetuar a alteração.'),'Atenção', 48);
        cboPlanoOrc.text := '';
        Exit;
      end;

      iIdPlanoOrc := StrToInt( cboPlanoOrc.LookUpValue );
    end;
  end;
  BtnExcelparaCds.Enabled := (Trim(edtCaminho.text) <> '') and (cboPlanoOrc.text <> '');
  // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948 - fim
end;

end.
