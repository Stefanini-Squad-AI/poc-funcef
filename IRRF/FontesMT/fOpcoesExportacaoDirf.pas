{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 155071 KTN 1471869
Responsável : Vinicius Eduardo N. Maciel
Data        : 10/01/2011
Descrição   : Criação dessa tela para o controle das opções de exportação do
              excel na tela de exportação de relatório individuais para a DIRF.
-------------------------------------------------------------------------------}
unit fOpcoesExportacaoDirf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  uMensErro, ShellApi, ComObj, OleServer, Word97, jpeg, QExport3,
  QExport3XLS, Db, DBTables, Wwquery;

type
  TfrmOpcoesExportacaoDirf = class(TForm)
    pnlSuperior: TPanel;
    pnlCentral: TPanel;
    btSelecione: TButton;
    pnlInferior: TPanel;
    btExportar: TButton;
    btFechar: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    sdSalvarArquivo: TSaveDialog;
    edFileName: TEdit;
    chShowFile: TCheckBox;
    laFileName: TLabel;
    rbOpcoes: TRadioGroup;
    qry: TwwQuery;
    qryENVIO: TFloatField;
    qryCONTRATO: TStringField;
    qryDOCUMENTO: TFloatField;
    qryDATA_VENCIMENTO: TDateTimeField;
    qryLOCATARIO: TStringField;
    qryFIADOR: TStringField;
    qryTIPO_DE_FIANCA: TStringField;
    qryENDERECO: TFloatField;
    qrySALDO: TFloatField;
    qryDATAAVISOCOBRANCA: TDateTimeField;
    qrySTATUS: TStringField;
    procedure btSelecioneClick(Sender: TObject);
    procedure edFileNameChange(Sender: TObject);
    procedure btExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FileName : String;
    abort : boolean;
    ppProducer1 : TppProducer;
  public
    bGeraCartas : boolean;
    procedure carregaRelatorio(relatorio: TppProducer);
  end;

var
  frmOpcoesExportacaoDirf: TfrmOpcoesExportacaoDirf;

implementation

{$R *.DFM}

procedure TfrmOpcoesExportacaoDirf.btSelecioneClick(Sender: TObject);
begin
  sdSalvarArquivo.FileName := FileName;
  if sdSalvarArquivo.Execute then
  begin
       FileName := sdSalvarArquivo.FileName;
       edFileName.Text :=sdSalvarArquivo.FileName;
  end;
end;

procedure TfrmOpcoesExportacaoDirf.edFileNameChange(Sender: TObject);
begin
     FileName := edFileName.Text;
     btExportar.Enabled := edFileName.text <> '';
end;

procedure TfrmOpcoesExportacaoDirf.btExportarClick(Sender: TObject);
begin
     Self.Enabled := False;
      try
             if sdSalvarArquivo.FileName <>'' then
             begin
                    ppProducer1.allowPrintToArchive := false;                     
                    ppProducer1.DeviceType := 'ExcelFile';
                    ppProducer1.TextFileName := FileName+'.xls';
                    ppProducer1.ShowAutoSearchDialog := true;
                    ppProducer1.ShowCancelDialog := false;
                    ppProducer1.ShowPrintDialog := false;
              try
                    ppProducer1.print;
              Except
                    MsgDlg('Houve erro na geração do arquivo, verifique se o arquivo não se encontra em uso.', 'Erro', mtWarning, [mbOk], 0);
              end;
              try
                     if(chShowFile.Checked) then
                     begin
                          ShellExecute(Handle, 'open', PChar(ppProducer1.TextFileName),nil,nil,SW_SHOWNORMAL) ;
                          Sleep(2500);
                     end;
              Except
                    MsgDlg('Houve erro na abertura do arquivo.', 'Atenção', mtWarning, [mbOk], 0);
              end;
             end
             else
                 MsgDlg('Para geração do arquivo é necessário o preenchimento do campos "Arquivo Destino".', 'Atenção', mtWarning, [mbOk], 0);
      finally
         Self.Enabled := True;
      end;
end;

procedure TfrmOpcoesExportacaoDirf.carregaRelatorio(relatorio: TppProducer);
begin
     ppProducer1 := relatorio;
     rbOpcoes.Items.Clear;
     rbOpcoes.Items.Add('Excel');
end;

procedure TfrmOpcoesExportacaoDirf.FormCreate(Sender: TObject);
begin
     ppProducer1 := TppProducer.Create(nil);
end;

procedure TfrmOpcoesExportacaoDirf.FormShow(Sender: TObject);
begin
     rbOpcoes.ItemIndex := 0;
end;

end.
