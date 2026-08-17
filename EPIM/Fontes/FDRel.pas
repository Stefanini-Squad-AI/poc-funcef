unit FDRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSImob, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Menus,
  ppEndUsr, ppCache, ppDB, ppDBBDE, ppForms,
  ppComm, ppReport, ppRelatv, ppDBPipe, CmEventosCadastro, ImgList;

type
  TfrmDesenhoRel = class(TfrmCadastroCSImob)
    DBedtNomeModelo: TwwDBEdit;
    Label1: TLabel;
    memReports: TMemo;
    btnDesenho: TBitBtn;
    btnLimpaArquivo: TBitBtn;
    btnAbreArquivo: TBitBtn;
    Label2: TLabel;
    dlgAbreArquivo: TOpenDialog;
    ppConsulta: TppBDEPipeline;
    DsgnCM: TppDesigner;
    dsConsulta: TwwDataSource;
    edtArquivoModelo: TEdit;
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

    // procedimentos definidos
    procedure FazerTrazer; override;

    // outros procedimentos
    procedure btnAbreArquivoClick(Sender: TObject);
    procedure btnLimpaArquivoClick(Sender: TObject);
    procedure DsgnCMCreate(Sender: TObject);
    procedure btnDesenhoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniFileSaveClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);

  protected { protected declarations }
   ArqModelo   : string;
   RptCM       : TppReport;

   function VerificaPreenchimento: boolean; virtual;
    Procedure CmeCadastroConfirma(Sender: TObject);

  private { Private declarations }

  public { Public declarations }

  end;



var
  frmDesenhoRel: TfrmDesenhoRel;



implementation
{$R *.DFM}
uses
   uSistema, uDataBase, uMensErro, uModeloRelatCM, uVerificaPreenchimento, FCadastroCS, uFuncoesImob;



procedure TfrmDesenhoRel.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
end;



procedure TfrmDesenhoRel.FazerTrazer;
begin
   inherited;

   if length(trim(edtArquivoModelo.Text)) > 0 then begin
      memReports.Lines.Clear;
      memReports.Lines.LoadFromFile(edtArquivoModelo.Text);
      memReports.Lines.SaveToFile(Sistema.TempDir + ArqModelo);

      MsgDlg('Arquivo carregado.', 'Informação', mtInformation, [mbOk], 0);
      Repaint;
   end;
end;



function TfrmDesenhoRel.VerificaPreenchimento: boolean;
begin
   Result := False;
   try

      if length(DBedtNomeModelo.Text) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Modelo!', DBedtNomeModelo);

      if memReports.Lines.Count = 0 then 
         raise EValidacao.CreateVal('É necessário indicar o Modelo!', DBedtNomeModelo);

   except

      on ev : EValidacao do begin
		   if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;

   end;

   Result := True;
end;



procedure TfrmDesenhoRel.btnAbreArquivoClick(Sender: TObject);
begin
   inherited;

   // pasta default = pasta da aplicação
   dlgAbreArquivo.InitialDir := ExtractFilePath(Application.ExeName);

   if dlgAbreArquivo.Execute then begin

      // mostra o nome do arquivo de modelo a ser trazido
      edtArquivoModelo.Text := dlgAbreArquivo.FileName;

      FazerTrazer;

   end;
end;



procedure TfrmDesenhoRel.btnLimpaArquivoClick(Sender: TObject);
begin
   inherited;

   // limpa o nome do arquivo de modelo
   edtArquivoModelo.Clear;
end;



procedure TfrmDesenhoRel.DsgnCMCreate(Sender: TObject);
var
   x, y : integer;
begin
   inherited;
{
   mnifile &Arquivo
   mnifileNew &Novo
   mnifileOpen &Abrir
   mnifileClose &Fechar
   mnifileLine1  -
   mnifileSave  A&brir Modelo
   mnifileSaveAs  Sa&lvar Modelo Como...
   mnifileLine3  -
   mnifilePageSetup  &Configurar Página
   mnifilePrint  &Imprimir
   mnifileLine4  -
   mnifilePrintToFileSetup  Print to &File Setup...
   *
   mniEdit  &Editar
   mniEditUndo  &Desfazer
   mniEditRedo  &Refazer
   mniEditLine1  -
   mniEditCut  &Recortar
   mniEditCopy  &Copiar
   mniEditPaste  C&olar
   mniEditDelete  &Apagar
   mniEditSelectAll  Se&elecionar Todos
   mniEditLine2  -
   mniEditBringToFront  Trazer para &Frente
   mniEditSendToBack  Enviar para &Traz
   *
   mniView  &Visualisar
   mniViewToolbars  Toolbars
   mniViewRulers  &Réguas
   mniViewGridOptions  &Opções da Grade
   mniViewLine1  -
   mniViewShowData  &Exibir Dados
   mniViewLine3  -
   mniViewOutline  Ou&tline
   *
   mniReport  &Relatório
   mniReportData  &Dados
   N1  -
   mniReportTitle  &Titúlo
   mniReportSummary  &Sumário
   mniReportLine1  -
   mniReportHeader  &Cabeçalho
   mniReportFooter  &Rodapé
   mniReportLine2  -
   mniReportGroups  &Grupos
   mniReportLine3  -
   mniReportPortrait  &Retrato
   mniReportLandscape  &Paisagem
   mniReportLine4  -
   mniReportUnits  &Units
   *
   mniHelp  &Ajuda
   mniHelpContents  Tópicos da &Ajuda
   mniMHelpLine1  -
   mniHelpAbout  &About...
   *

   ** Lista para um memo todos os Menus e Submenus do Design de relatórios}

   for x := 0 to (DsgnCM.Menu.Items.Count - 1) do begin
      for y := 0 to (DsgnCM.Menu.Items[x].Count - 1) do begin

         if DsgnCM.Menu.Items[x].Items[y].Name = 'mniReportData' then begin
            DsgnCM.Menu.Items[x].Items[y].Visible := False;
         end else begin
            if DsgnCM.Menu.Items[x].Items[y].Name = 'N1' then begin
               DsgnCM.Menu.Items[x].Items[y].Visible := False;
            end else begin
               if DsgnCM.Menu.Items[x].Items[y].Name = 'mniViewLine3' then begin
                  DsgnCM.Menu.Items[x].Items[y].Visible := False;
               end else begin
                  if DsgnCM.Menu.Items[x].Items[y].Name = 'mniViewOutline' then begin
                     DsgnCM.Menu.Items[x].Items[y].Visible := False;
                  end;
               end;
            end;
         end;

      end;
   end;
end;



procedure TfrmDesenhoRel.btnDesenhoClick(Sender: TObject);
begin
   RptCM := TppReport.Create(Application);

   //colocar report default
   ModeloRelatCM.SetaDadosRpt(RptCm, ppConsulta, ArqModelo);
   DsgnCM.Report := RptCM;

   memReports.Lines.SaveToFile(Sistema.TempDir + ArqModelo);

{
   case CmeCadastro.Operacao of

      OpInserir:
      begin
         if bCriaTemplate then begin
            Try
               ModeloRelatCM.CmCartaCob.SaveToFile(Sistema.TempDir + ArqModelo);
            finally
               bCriaTemplate := False;
            end;
         end;
      end;

      OpAlterar:
      begin
         if bCriaTemplate then begin
            memReports.Lines.SaveToFile(Sistema.TempDir + ArqModelo);
            bCriaTemplate := False;
         end;
      end;

   end;
}
   RptCM.Template.LoadFromFile;
   ModeloRelatCM.SetaDadosRpt(RptCm, ppConsulta, ArqModelo);

   DsgnCM.ShowModal;

   memReports.Lines.LoadFromFile(Sistema.TempDir + ArqModelo);

   RptCM.Free;
end;



procedure TfrmDesenhoRel.FormCreate(Sender: TObject);
begin
   inherited;

   ModeloRelatCM := TModeloRelatCM.Create;

   // -----------------------------------------------
   //    Nos descendetes, inicializar ArqModelo
   // -----------------------------------------------
end;



procedure TfrmDesenhoRel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ModeloRelatCM.Free;

   inherited;
end;



procedure TfrmDesenhoRel.mniFileSaveClick(Sender: TObject);
begin
   inherited;

   ModeloRelatCM.SetaDadosRpt(RptCm, ppConsulta, ArqModelo);
   RptCM.Template.SaveToFile;
end;



procedure TfrmDesenhoRel.Sair1Click(Sender: TObject);
begin
   inherited;

   ModeloRelatCM.SetaDadosRpt(RptCm, ppConsulta, ArqModelo);
   RptCM.Template.SaveToFile;

   DsgnCM.Close;
end;



procedure TfrmDesenhoRel.sbtnProcurarClick(Sender: TObject);
begin
   inherited;

   // se houver busca, limpa o arquivo de modelo a ser importado
   if MontaSelect.RetornouValor then edtArquivoModelo.Clear;
end;



procedure TfrmDesenhoRel.bbtnCancelarClick(Sender: TObject);
begin
   inherited;

   // limpa o arquivo de modelo a ser importado
   edtArquivoModelo.Clear;
end;



procedure TfrmDesenhoRel.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   try
      StartTransacao;
      if CmeCadastro.Operacao in [opInserir, opAlterar] then begin

         with qryReports do begin
            LimpaParametros(qryReports);
            Params[0].asInteger := qry.FieldByName('IDREPORTS').AsInteger;
            Params[1].asInteger := 0;
            Open;

            Edit;
            FieldByName('IDREPORTS').asInteger := qry.FieldByName('IDREPORTS').AsInteger;
            FieldByName('NAME').asString       := 'TCartaCobr';
            FieldByName('TEMPLATE').asString   := memReports.Lines.Text;
            Post;

            Close;
         end;
      end;

      CommitTransacao;

      if FileExists(Sistema.TempDir + ArqModelo) then DeleteFile(Sistema.TempDir + ArqModelo);

      Accept := VerificaPreenchimento;

   except
      Accept := false;
      RollbackTransacao;
      Raise;
      Repaint;
   end;

   // limpa o arquivo de modelo a ser importado
   edtArquivoModelo.Clear;
end;

end.
