unit FCadImgagensXcontrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, Mask, wwdbedit,
  Wwdbspin, ExtDlgs, uCtrlImagemContr, uDataBase, dBaseDados, usistema, jpeg,
  uMensErro, uCmSqlParams, Math, uCtrlPadroes, uCmFileUtils, shellApi;

type
  TFrmCadImgagensXcontrato = class(TFrmCadastroMestreDetMT)
    cdsImagem: TCMClientDataSet;
    cdsAnexos: TCMClientDataSet;
    dsImagem: TwwDataSource;
    TabSheet1: TTabSheet;
    ScrollBox1: TScrollBox;
    iImagem: TImage;
    dbiImagem: TDBImage;
    opdImagem: TOpenPictureDialog;
    OpenDlg: TOpenDialog;
    SaveDlg: TSaveDialog;
    dbedContrato: TwwDBEdit;
    Label2: TLabel;
    dbgImagem: TwwDBGrid;
    dbedNomeArquivo: TwwDBEdit;
    Label3: TLabel;
    bbtnAnexar: TBitBtn;
    tbAnexo: TToolbar97;
    btnVisual: TToolbarButton97;
    btnSalva: TToolbarButton97;
    tbImagem: TToolbar97;
    bbtnImagem: TToolbarButton97;
    btnUltimaPagina: TToolbarButton97;
    btnProximaPagina: TToolbarButton97;
    btnPaginaAnterior: TToolbarButton97;
    btnPaginaInicial: TToolbarButton97;
    bbtnZoomIN: TToolbarButton97;
    bbtnTamOriginal: TToolbarButton97;
    bbtnZoomOUT: TToolbarButton97;
    pnlPagina: TPanel;
    Label1: TLabel;
    dbspPagina: TwwDBSpinEdit;
    CMSqlParams1: TCMSqlParams;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnAnexarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheApplyDelete(sender: TObject; var Accept: Boolean);
    procedure tbcDetalheChange(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure cdsImagemAfterScroll(DataSet: TDataSet);
    procedure iImagemDblClick(Sender: TObject);
    procedure dsImagemDataChange(Sender: TObject; Field: TField);
    procedure btnVisualClick(Sender: TObject);
    procedure btnSalvaClick(Sender: TObject);
    procedure bbtnZoomINClick(Sender: TObject);
    procedure btnPaginaInicialClick(Sender: TObject);
    procedure btnPaginaAnteriorClick(Sender: TObject);
    procedure btnProximaPaginaClick(Sender: TObject);
    procedure bbtnImagemClick(Sender: TObject);
    procedure btnUltimaPaginaClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure bbtnZoomOUTClick(Sender: TObject);
    procedure bbtnTamOriginalClick(Sender: TObject);
    procedure dsImagemStateChange(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
  private
    { Private declarations }
    bdeletou : Boolean;
    sIdContrato : String;
    rIDContratoAux :double;
    rPaginaAux :double;
    ListaArquivosTemp : TstringList;
    CtrlImagemContr : TCtrlImagemContr;
    AbrirImagem : Boolean;
    HeightImage     : integer;
    WidthImage      : integer;
    procedure VerificaBotoes;
    procedure AtributosImagem;
    procedure HabilitaBotoes;
    procedure DesabilitaBotoes;
  public
    { Public declarations }
  end;

var
  FrmCadImgagensXcontrato: TFrmCadImgagensXcontrato;

implementation

{$R *.DFM}

procedure TFrmCadImgagensXcontrato.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  bdeletou := false;
  if MontaSelect.RetornouValor then
  begin
    sIdContrato       := MontaSelect.ValoresChave[0];
    dbedContrato.Text := MontaSelect.ValoresChave[1];
    Cds.Data          := CtrlImagemContr.ListaContrato(strToFloat(sIdContrato));
    CdsAnexos.Data := CtrlImagemContr.ListaAnexos(strToFloat(sIdContrato));
    tbAnexo.visible := tbcDetalhe.tabindex = 0;
    tbImagem.visible := tbcDetalhe.tabindex = 1;
    pnlPagina.visible := tbImagem.visible;
    tbAnexo.enabled := not cdsAnexos.IsEmpty;
    btnVisual.enabled := tbAnexo.enabled;
    btnsalva.enabled := tbAnexo.enabled;
    CdsImagem.Close;
    CdsImagem.Data:=CtrlImagemContr.ListImagensContr(StrToFloat(sIdContrato));
    iImagem.Picture := dbiImagem.Picture;
    if cds.RecordCount > 0 then
    begin
     HeightImage := iImagem.Height;
     WidthImage  := iImagem.Width;
     HabilitaBotoes;
     AbrirImagem := True;
    end
    else
    begin
     DesabilitaBotoes;
     AbrirImagem := False;
    end;

  end;
end;

procedure TFrmCadImgagensXcontrato.FormCreate(Sender: TObject);
begin
  inherited;
  bdeletou := false;
  sIdContrato := '0';
  CtrlImagemContr:=TCtrlImagemContr.Create;
  CtrlImagemContr.Initialize(dtmBaseDados.dbBaseDados,True);
  CtrlImagemContr.CdsImagens:=CdsImagem;
  CtrlImagemContr.CdsAnexos := CdsAnexos;

   //Carrega Cds Principal
  cds.Data := CtrlImagemContr.ListaContrato(-1);
  CdsImagem.Data := CtrlImagemContr.ListImagensContr(-1); //vazio
  CdsAnexos.Data := CtrlImagemContr.ListaAnexos(-1); //vazio // tavares
  tbAnexo.enabled := not cdsAnexos.IsEmpty;
  btnVisual.enabled := tbAnexo.enabled;
  btnsalva.enabled := tbAnexo.enabled;

  tbAnexo.visible := tbcDetalhe.tabindex = 0;
  tbImagem.visible := tbcDetalhe.tabindex = 1;
  pnlPagina.visible := tbImagem.visible;

   //Acerta Filtro do MontaSelect
  MontaSelect.Filtro.Add('C.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa));

  rIDContratoAux:=0;
  rPaginaAux:=0;

  ListaArquivosTemp := TSTringList.Create;
  DesabilitaBotoes;
  AbrirImagem := False;

end;

procedure TFrmCadImgagensXcontrato.DesabilitaBotoes;
begin
  bbtnTamOriginal.Enabled   := False;
  bbtnZoomIN.Enabled        := False;
  bbtnZoomOUT.Enabled       := False;
  btnPaginaInicial.Enabled  := False;
  btnPaginaAnterior.Enabled := False;
  btnProximaPagina.Enabled  := False;
  btnUltimaPagina.Enabled   := False;
  bbtnImagem.Enabled        := false;
end;

procedure TFrmCadImgagensXcontrato.bbtnAnexarClick(Sender: TObject);
begin
  inherited;
  OpenDlg.Execute;
  CtrlImagemContr.Caminho := OpenDlg.FileName;
  if cdsAnexos.state in [dsEdit, dsInsert] then
  begin
    if trim(OpenDlg.filename) <> '' then
    begin
      cdsAnexos.FieldByName('IDCONTRATO').asFloat := strToFloat(sIdcontrato);
      cdsAnexos.FieldByName('FLGTIPO').asString := 'A';
      cdsAnexos.FieldByName('NOMEARQUIVO').asString := extractFileName(OpenDlg.filename);
      cdsAnexos.FieldByName('EXTENSAO').asString    := ExtractFileExt(OpenDlg.filename);
      (cdsAnexos.FieldByName('IMAGEM')as TBlobField).LoadFromFile(OpenDlg.filename);

      OpenDlg.filename := '';
    end;
  end;
end;

procedure TFrmCadImgagensXcontrato.AtributosImagem;
begin
  HeightImage := iImagem.Height;
  WidthImage  := iImagem.Width;
  bbtnTamOriginal.Enabled := False;
end;

procedure TFrmCadImgagensXcontrato.HabilitaBotoes;
begin
  bbtnZoomIN.Enabled        := True;
  bbtnZoomOUT.Enabled       := True;
  btnPaginaInicial.Enabled  := True;
  btnPaginaAnterior.Enabled := True;
  btnProximaPagina.Enabled  := True;
  btnUltimaPagina.Enabled   := True;
  bbtnImagem.Enabled   := True;
end;

procedure TFrmCadImgagensXcontrato.VerificaBotoes;
begin
  // Verifica se habilita ou desabilita os botões de Zoom - Marcio Motta - Pendência: 16567
  if (iImagem.Width > (WidthImage * 2) ) then
    bbtnZoomIN.Enabled := False
  else
    bbtnZoomIN.Enabled := True;

  if ( iImagem.Width < (WidthImage * 0.3) )then
    bbtnZoomOUT.Enabled := False
  else
    bbtnZoomOUT.Enabled := True;

  if ( iImagem.Width <> WidthImage) then
    bbtnTamOriginal.Enabled := True
  else
    bbtnTamOriginal.Enabled := False;
end;

procedure TFrmCadImgagensXcontrato.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dbedContrato.Text := '';
  CdsImagem.Data := CtrlImagemContr.ListImagensContr(-1);
  CdsAnexos.Data := CtrlImagemContr.ListaAnexos(-1);
end;

procedure TFrmCadImgagensXcontrato.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dbedContrato.Text := '';
  CdsImagem.Data := CtrlImagemContr.ListImagensContr(-1);
  CdsAnexos.Data := CtrlImagemContr.ListaAnexos(-1);
end;

procedure TFrmCadImgagensXcontrato.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  if bdeletou then
  begin
    if not(CtrlImagemContr.ExcluiImagemContr) then
    begin
       MsgDlg(CtrlImagemContr.MessageInfo,'Erro',mtError,[mbOK],0);
       Abort;
    end
  end
  else
  begin
    if not(CtrlImagemContr.AplicaAtualImagemContr) then
    begin
       MsgDlg(CtrlImagemContr.MessageInfo,'Erro',mtError,[mbOK],0);
       Abort;
    end;
  end;
  bdeletou := false;
end;

procedure TFrmCadImgagensXcontrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlImagemContr.free;
end;

procedure TFrmCadImgagensXcontrato.CmeDetalheApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  bdeletou := true;
end;

procedure TFrmCadImgagensXcontrato.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  tbAnexo.visible := tbcDetalhe.tabindex = 0;
  tbImagem.visible := tbcDetalhe.tabindex = 1;
  pnlPagina.visible := tbImagem.visible;
end;

procedure TFrmCadImgagensXcontrato.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  tbAnexo.enabled := not cdsAnexos.IsEmpty;
  btnVisual.enabled := tbAnexo.enabled;
  btnsalva.enabled := tbAnexo.enabled;
  bbtnImagem.Enabled := cdsImagem.state in [dsEdit, dsInsert];
end;

procedure TFrmCadImgagensXcontrato.cdsImagemAfterScroll(DataSet: TDataSet);
begin
  inherited;
   iImagem.Picture:=dbiImagem.Picture;
end;

procedure TFrmCadImgagensXcontrato.iImagemDblClick(Sender: TObject);
var
   sFileName : string;
begin
  inherited;
  if AbrirImagem then begin
    // Busca o diretório temporário CM
    sFileName := Sistema.TempDir;

    // Adiciona '\' ao final do caminho, caso este não exista
    if sFileName[ length( sFileName ) ] <> '\' then sFileName := sFileName + '\';

    // Monta um nome para o arquivo temporário
    Randomize;
    sFileName := sFileName + Copy( FormatFloat( '000000', GetTickCount ), 1, 6 ) +
      FormatFloat( '0000', Random( 10000 ) ) + '.bmp';

    // Salva o arquivo
    DBIImagem.Picture.Bitmap.SaveToFile( sFileName );

    // Inclui em uma stringlist o nome do arquivo para deletar no fechamento do form
    ListaArquivosTemp.Add(sFileName);

    // Abre o arquivo
    ShellExecute( Self.Handle, 'open', PChar( sFileName ), '', '', SW_SHOW	);
  end else begin
    EXIT;
  end;
end;

procedure TFrmCadImgagensXcontrato.dsImagemDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  iImagem.Stretch  := False;
  iImagem.AutoSize := True;
  AtributosImagem;
  VerificaBotoes;
end;

procedure TFrmCadImgagensXcontrato.btnVisualClick(Sender: TObject);
var sNomeArquivo : string;
begin
  inherited;
  btnVisual.Down := false;
  sNomeArquivo := cmGetTempPath() + CdsAnexos.FieldByName( 'NOMEARQUIVO' ).AsString;
  If FileExists( sNomeArquivo ) Then
    DeleteFile( sNomeArquivo );
  TBlobField( CdsAnexos.FieldByName( 'IMAGEM' ) ).SaveToFile( sNomeArquivo );

  ShellExecute( Handle,
                'Open',
                pchar(sNomeArquivo),
                Nil,
                Nil,
                sw_shownormal );
end;

procedure TFrmCadImgagensXcontrato.btnSalvaClick(Sender: TObject);
begin
  inherited;
  btnSalva.Down := false;
  SaveDlg.filename := cdsAnexos.FieldByName('NOMEARQUIVO').asString;
  SaveDlg.Execute;
  If FileExists( SaveDlg.filename ) Then
    DeleteFile( SaveDlg.filename );
  TBlobField( CdsAnexos.FieldByName( 'IMAGEM' ) ).SaveToFile( SaveDlg.filename );
end;

procedure TFrmCadImgagensXcontrato.bbtnZoomINClick(Sender: TObject);
begin
  inherited;
  bbtnZoomIN.Down := false;
  if Assigned(iImagem.Picture) then begin
    if iImagem.Width < (WidthImage * 2) then begin
       iImagem.AutoSize := False;
       iImagem.Stretch  := True;
       iImagem.Height   := Trunc(iImagem.Height * 1.1);
       iImagem.Width    := Trunc(iImagem.Width  * 1.1);
    end;
    VerificaBotoes;
  end else
    EXIT;
end;

procedure TFrmCadImgagensXcontrato.btnPaginaInicialClick(Sender: TObject);
begin
  inherited;
  btnPaginaInicial.Down := false;
  CdsImagem.First;
  AtributosImagem;
end;

procedure TFrmCadImgagensXcontrato.btnPaginaAnteriorClick(Sender: TObject);
begin
  inherited;
  btnPaginaAnterior.Down := false;
  CdsImagem.Prior;
  AtributosImagem;
end;

procedure TFrmCadImgagensXcontrato.btnProximaPaginaClick(Sender: TObject);
begin
  inherited;
  btnProximaPagina.Down := false;
  CdsImagem.Next;
  AtributosImagem;
end;

procedure TFrmCadImgagensXcontrato.bbtnImagemClick(Sender: TObject);
var
   Imagem    : TBitmap;
   ImagemJPG : TJPEGImage;
   Extensao  : String;
   Arquivo   : File of Byte;
   Tamanho   : Longint;

begin
   inherited;
   Tamanho := 0;
   bbtnImagem.Down := false;
   if opdImagem.Execute then
    begin
       // Verifica o tamanho do arquivo
       AssignFile(Arquivo, OpdImagem.FileName);
       Reset(Arquivo);
       Tamanho := FileSize(Arquivo);
       CloseFile(Arquivo);

       if Tamanho > 2048000 then begin
         MsgDlg('O tamanho máximo permitido para' + #13 +
                'o arquivo é de 2.048.000 bytes!' , 'Aviso', mtWarning, [mbOk], 0);
         EXIT;
       end;

       Extensao:=ExtractFileExt(opdImagem.FileName);
       Extensao:=UpperCase(Trim(Copy(Extensao,2,(Length(Extensao)-1))));
       if (trim(OpdImagem.FileName) <> '') and (cdsImagem.state in [dsEdit, dsInsert]) then // tavares
       begin
         cdsImagem.FieldByName('IDCONTRATO').asFloat := strToFloat(sIdcontrato);
         cdsImagem.fieldByName('NOMEARQUIVO').asString  := ExtractFileName(opdImagem.FileName);
         cdsImagem.fieldByName('FLGTIPO').asString  := 'I';
         cdsImagem.fieldByName('EXTENSAO').asString := Extensao;
       end;
       Imagem:=TBitmap.Create;
       ImagemJPG:=TJPEGImage.Create;

       // Guarda o tamanho original da imagem - Marcio Motta - Pendência: 16567
       AtributosImagem;

       try
          if (Extensao='JPG') then
           begin
              ImagemJPG.LoadFromFile(opdImagem.FileName);
              Imagem.Assign(ImagemJPG);
           end
          else
            Imagem.LoadFromFile(opdImagem.FileName);

          dbiImagem.Picture.Assign(Imagem);
          iImagem.Picture.Assign(Imagem);
          iImagem.Stretch  := False;
          iImagem.AutoSize := True;
          HeightImage := iImagem.Height;
          WidthImage  := iImagem.Width;
          bbtnTamOriginal.Enabled := False;
       finally
          Imagem.Free;
       end;
    end;
end;

procedure TFrmCadImgagensXcontrato.btnUltimaPaginaClick(Sender: TObject);
begin
  inherited;
   btnUltimaPagina.Down := false;
   CdsImagem.Last;
   AtributosImagem;
end;

procedure TFrmCadImgagensXcontrato.CmeDetalheAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  bbtnImagem.Enabled := cdsImagem.state in [dsEdit, dsInsert];
end;

procedure TFrmCadImgagensXcontrato.bbtnZoomOUTClick(Sender: TObject);
begin
  inherited;
  bbtnZoomOUT.Down := false;
  if Assigned(iImagem.Picture) then begin
    if ( iImagem.Width > (WidthImage * 0.3) ) then begin
       iImagem.AutoSize := False;
       iImagem.Stretch  := True;
       iImagem.Height   := Trunc(iImagem.Height / 1.1);
       iImagem.Width    := Trunc(iImagem.Width  / 1.1);
    end;
    VerificaBotoes;
  end else
    EXIT;
end;

procedure TFrmCadImgagensXcontrato.bbtnTamOriginalClick(Sender: TObject);
begin
  inherited;
  bbtnTamOriginal.Down := false;
  iImagem.Stretch := False;
  iImagem.AutoSize := True;
  VerificaBotoes;
end;

procedure TFrmCadImgagensXcontrato.dsImagemStateChange(Sender: TObject);
begin
  inherited;
   btnPaginaInicial.Enabled   := (cdsImagem.State in [dsBrowse]);
   btnPaginaAnterior.Enabled  := (cdsImagem.State in [dsBrowse]);
   btnProximaPagina.Enabled   := (cdsImagem.State in [dsBrowse]);
   btnUltimaPagina.Enabled    := (cdsImagem.State in [dsBrowse]);
end;

procedure TFrmCadImgagensXcontrato.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  btnVisualClick(Sender);
end;

procedure TFrmCadImgagensXcontrato.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if tbcDetalhe.tabindex = 1 then // se inserir imagem
    bbtnImagemClick(Sender);
end;

end.
