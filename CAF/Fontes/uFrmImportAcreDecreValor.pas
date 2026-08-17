unit uFrmImportAcreDecreValor;
{*******************************************************************************
******************************** REGISTRO DE ALTERAÇÕES ************************
********************************************************************************
--------------------------------------------------------------------------------
Nº SOL......: 142552
Nº KINTANA..: 911795
Data........: 14/09/2011
Responsável.: Helen V. Bianchi/Leandro
Descrição...: Criação do Módulo --> Tem por finalidade fazer o Acrescimo/Decresc
              de valor atravez de uma importação via planilha de excel, desta
              forma agilizando o processo de inserção referente a tela
              fMTMovAcrescimoValor
-------------------------------------------------------------------------------}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ComCtrls, Gauges, fcLabel, ExtCtrls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Db, DBClient,uCtrlImportAcreDecreValor,uCtrlPadroes;

type
  TFrmImportAcreDecreValor = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    CMSeparaWizard2: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    pnl_Top: TPanel;
    lblTitulo: TfcLabel;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    dsExcel: TDataSource;
    cds_Excel: TClientDataSet;
    cds_ExcelPLACA: TIntegerField;
    cds_ExcelMOVIMENTACAO: TStringField;
    cds_ExcelTIPO_MOVIMENTACAO: TIntegerField;
    cds_ExcelVALOR: TFloatField;
    cds_ExcelDESCRICAO: TStringField;
    gbDocumento: TGroupBox;
    lblCaminho: TLabel;
    edtCaminho: TEdit;
    btnAbrir: TBitBtn;
    BtnExcelparaCds: TBitBtn;
    gbProgresso: TGroupBox;
    lblStatus_Progresso: TLabel;
    gProgresso: TGauge;
    cds_ExcelREGISTROVALIDO: TBooleanField;
    gbDados: TGroupBox;
    pgcImporta: TPageControl;
    tsLayout: TTabSheet;
    mmoLayout: TMemo;
    tsDados: TTabSheet;
    tsImportacao: TTabSheet;
    Label1: TLabel;
    btnComecaImportacao: TBitBtn;
    btnPararImportacao: TBitBtn;
    btnSalvaLog: TBitBtn;
    mmoLog: TMemo;
    GroupBox1: TGroupBox;
    dbgExcel: TDBGrid;
    cds_ExcelLOG_ERRO: TMemoField;
    cds_ExcelDT_MOVIMENTACAO: TStringField;
    procedure btnAbrirClick(Sender: TObject);
    procedure btnComecaImportacaoClick(Sender: TObject);
    procedure dbgExcelDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnExcelparaCdsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure dbgExcelDblClick(Sender: TObject);
    procedure cds_ExcelNewRecord(DataSet: TDataSet);
    procedure btnSalvaLogClick(Sender: TObject);
    procedure btnPararImportacaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    strlCampos:TStringList;
  public
    { Public declarations }
    CtrlImportAcreDecreValor: TCtrlImportAcreDecreValor;
  end;

var
  FrmImportAcreDecreValor: TFrmImportAcreDecreValor;

implementation

{$R *.DFM}

procedure TFrmImportAcreDecreValor.btnAbrirClick(Sender: TObject);
begin
 // -- > Abre caixa de dialogo para busca do documento...
  if (dlgOpen.Execute) then
      edtCaminho.text := dlgOpen.FileName
  else
      edtCaminho.text := '';

  BtnExcelparaCds.Enabled := (Trim(edtCaminho.text) <> '');
  mmoLog.Lines.Clear;
end;

procedure TFrmImportAcreDecreValor.btnComecaImportacaoClick(
  Sender: TObject);
begin

     //Mensagem de confirmação
     if Application.MessageBox('Deseja realmente iniciar a importação do orçamento?','Atenção',36) = 6 then
     begin
         try
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
             CtrlImportAcreDecreValor.ImportaDados;
             LockWindowUpdate(0);

             //Carregar Log
             mmoLog.Lines := CtrlImportAcreDecreValor.Log;

             if CtrlImportAcreDecreValor.Total_Erros > 0 then
             begin
                 Application.MessageBox(PChar('Ocorrem erros na importação do orçamento.' + #13 +
                                              'Favor verificar arquivo de log.'),'Atenção',48);
             end;

         Finally
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

procedure TFrmImportAcreDecreValor.dbgExcelDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 // --> Pinta a linha que contem Erro!
 if cds_ExcelREGISTROVALIDO.AsBoolean then
    dbgExcel.Canvas.Font.Color := clBlack
 else if not cds_ExcelREGISTROVALIDO.AsBoolean then
  dbgExcel.Canvas.Font.Color := clRed;

  dbgExcel.DefaultDrawDataCell(Rect, dbgExcel.columns[datacol].field, State);

end;

procedure TFrmImportAcreDecreValor.BtnExcelparaCdsClick(Sender: TObject);
begin
  pgcImporta.ActivePageIndex := 1;
  Application.ProcessMessages;
  mmoLog.Clear;

  //Importar Planilha
  lblStatus_Progresso.Caption := 'Importando os dados da planilha excel...';

  CtrlImportAcreDecreValor.ImportarPlanilhaEXCEL(Trim(edtCaminho.Text));

  lblStatus_Progresso.Caption := 'Pronto para começar.';
  btnComecaImportacao.Enabled :=  (CtrlImportAcreDecreValor.Total_Importar > 0);
  btnSalvaLog.Enabled         :=  (CtrlImportAcreDecreValor.Total_Importar > 0);

end;

procedure TFrmImportAcreDecreValor.FormCreate(Sender: TObject);
begin
   //Cria Dataset
   cds_Excel.CreateDataSet;
   cds_Excel.EmptyDataSet;

   //Cria Controle
   CtrlImportAcreDecreValor            := TCtrlImportAcreDecreValor.Create();
   CtrlImportAcreDecreValor.InitializeAs(Padroes);
   CtrlImportAcreDecreValor.cdsExcel   := cds_Excel;
   CtrlImportAcreDecreValor.bProgresso := gProgresso;

   // --> Lista a ordem dos campos a serem importados do excel, se o layout mudar, basta mudar aqui
   strlCampos := TStringList.Create;
   strlCampos.Add('DT_MOVIMENTACAO');   // 1ª Coluna do Excel
   strlCampos.Add('PLACA');             // 2ª Coluna do Excel
   strlCampos.Add('MOVIMENTACAO');      // 3ª Coluna do Excel
   strlCampos.Add('TIPO_MOVIMENTACAO'); // 4ª Coluna do Excel
   strlCampos.Add('VALOR');             // 5ª Coluna do Excel
   strlCampos.Add('DESCRICAO');         // 6ª Coluna do Excel
   CtrlImportAcreDecreValor.Campos := strlCampos;

   //Controles
   BtnExcelparaCds.Enabled     := False;
   btnComecaImportacao.Enabled := False;
   btnSalvaLog.Enabled         := False;
   pgcImporta.ActivePageIndex  := 0;
end;

procedure TFrmImportAcreDecreValor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //Destrói Controle
   FreeAndNil(CtrlImportAcreDecreValor);

   // --> Liberando objetos da memoria
   FreeAndNil(strlCampos);

   //Destrói Dataset
   cds_Excel.CLose;

   FrmImportAcreDecreValor := nil;
   Action := CaFree;
end;

procedure TFrmImportAcreDecreValor.bbtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmImportAcreDecreValor.dbgExcelDblClick(Sender: TObject);
begin
 if Trim(cds_ExcelLOG_ERRO.AsString) <> '' then
  Application.MessageBox(Pchar(cds_ExcelLOG_ERRO.AsString),'Informação',MB_ICONERROR);
end;

procedure TFrmImportAcreDecreValor.cds_ExcelNewRecord(DataSet: TDataSet);
begin
  cds_ExcelREGISTROVALIDO.AsBoolean := True;
end;

procedure TFrmImportAcreDecreValor.btnSalvaLogClick(Sender: TObject);
begin
   // --> Salva arquivo log de acordo com o local indicado
   if (mmoLog.Lines.Text = '') then
   begin
     Application.MessageBox('Não há log apra ser salvo.','Atenção',48);
     Exit;
   end
   else
   begin
     if dlgSave.Execute then
        mmoLog.Lines.SaveToFile(dlgSave.Filename + '.txt');
   end;
end;

procedure TFrmImportAcreDecreValor.btnPararImportacaoClick(
  Sender: TObject);
begin
  CtrlImportAcreDecreValor.InterromperImportacao;
end;

procedure TFrmImportAcreDecreValor.FormShow(Sender: TObject);
begin
  pgcImporta.ActivePage :=tsLayout;
end;

end.
