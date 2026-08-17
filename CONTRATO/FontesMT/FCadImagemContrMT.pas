unit FCadImagemContrMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  wwdbedit, Wwdbspin, wwdblook, ExtDlgs, DBCtrls, uCtrlImagemContr,
  uCtrlContratos, Jpeg, CMProcura, ShellAPI, uCmSqlParams;

type
  TfrmCadImagemContrMT = class(TFrmCadastroMT)
    pnlInfo: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    dbspPagina: TwwDBSpinEdit;
    ScrollBox1: TScrollBox;
    opdImagem: TOpenPictureDialog;
    sbtnProcurarImagem: TSpeedButton;
    sbtnGetAllFromDir: TSpeedButton;
    msContratos: TMontaSelect;
    cmpContrato: TCMProcura;
    dbiImagem: TDBImage;
    iImagem: TImage;
    GroupBox1: TGroupBox;
    btnPaginaInicial: TBitBtn;
    btnPaginaAnterior: TBitBtn;
    btnProximaPagina: TBitBtn;
    btnUltimaPagina: TBitBtn;
    bbtnZoomIN: TBitBtn;
    bbtnZoomOUT: TBitBtn;
    bbtnTamOriginal: TBitBtn;
    procedure dsStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure btnPaginaInicialClick(Sender: TObject);
    procedure btnPaginaAnteriorClick(Sender: TObject);
    procedure btnProximaPaginaClick(Sender: TObject);
    procedure btnUltimaPaginaClick(Sender: TObject);
    procedure sbtnProcurarImagemClick(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure cmpContratoValidaDados(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure iImagemDblClick(Sender: TObject);
    procedure bbtnZoomINClick(Sender: TObject);
    procedure bbtnZoomOUTClick(Sender: TObject);
    procedure bbtnTamOriginalClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlImagemContr : TCtrlImagemContr;
    CtrlContratos   : TCtrlContratos;
    rIDContratoAux  : Double;
    rPaginaAux      : Double;
    HeightImage     : integer;
    WidthImage      : integer;
    AbrirImagem     : Boolean;
    procedure VerificaBotoes;
    procedure AtributosImagem;
    procedure HabilitaBotoes;
    procedure DesabilitaBotoes;


  public
    { Public declarations }
  end;

var
  frmCadImagemContrMT: TfrmCadImagemContrMT;
  ListaArquivosTemp : TSTringList;
  
implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadImagemContrMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa Controls
   CtrlImagemContr:=TCtrlImagemContr.Create;
   CtrlImagemContr.Initialize(dtmBaseDados.dbBaseDados,True);
   CtrlImagemContr.CdsImagens:=Cds;

   CtrlContratos:=TCtrlContratos.Create(Sistema.IdEmpresa, Sistema.IdUsuario);
   CtrlContratos.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega Cds Principal
   Cds.Data:=CtrlImagemContr.ListImagensContr(-1); //vazio

   //Acerta Filtro do MontaSelect
   MontaSelect.Filtro.Add('C.IDPESSOA = '+FloatToStr(Sistema.IdEmpresa));

   msContratos.Filtro.Add('CONTRATOCONTR.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) +
                          'AND CONTRATOCONTR.IDCONTRATO IN (SELECT IDCONTRATO FROM CONTRATOUSUARIO '+
                          'WHERE IDUSUARIO = '+IntToStr(Sistema.IDUsuario)+')');
   rIDContratoAux:=0;
   rPaginaAux:=0;

   ListaArquivosTemp := TSTringList.Create;
   DesabilitaBotoes;
   AbrirImagem := False;
end;

procedure TfrmCadImagemContrMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   if (Trim(cmpContrato.Text)<>'') then rPaginaAux:=rPaginaAux+1;
   Cds.FieldByName('PAGINA').AsFloat:=rPaginaAux;
   if (rIDContratoAux<>0) then Cds.FieldByName('IDCONTRATO').AsFloat:=rIDContratoAux;
end;

procedure TfrmCadImagemContrMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dbspPagina.MinValue:=0;
end;

procedure TfrmCadImagemContrMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
     Cds.Close;
     Cds.Data:=CtrlImagemContr.ListImagensContr(StrToFloat(MontaSelect.ValoresChave[0]));
     iImagem.Picture:=dbiImagem.Picture;
     if cds.RecordCount > 0 then begin
       // Guarda o tamanho original da imagem - Marcio Motta - Pendência: 16567
       HeightImage := iImagem.Height;
       WidthImage  := iImagem.Width;
       HabilitaBotoes;
       AbrirImagem := True;
     end else begin
       DesabilitaBotoes;
       AbrirImagem := False;
     end;
   end;
end;

procedure TfrmCadImagemContrMT.CmeCadastroConfirma(Sender: TObject);
begin
   if not(sbtnApagar.Down) then
    begin
       if not(CtrlImagemContr.AplicaAtualImagemContr) then
        begin
           MsgDlg(CtrlImagemContr.MessageInfo,'Erro',mtError,[mbOK],0);
           Abort;
        end;

       rIDContratoAux:=Cds.FieldByName('IDCONTRATO').AsFloat;
    end;
   inherited;
end;

procedure TfrmCadImagemContrMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
   if not(CtrlImagemContr.ExcluiImagemContr) then
    begin
       MsgDlg(CtrlImagemContr.MessageInfo,'Erro',mtError,[mbOK],0);
       Accept:=False;
       Abort;
    end;
   inherited;
end;

procedure TfrmCadImagemContrMT.dsStateChange(Sender: TObject);
begin
   inherited;
   btnPaginaInicial.Enabled   := (Cds.State in [dsBrowse]);
   btnPaginaAnterior.Enabled  := (Cds.State in [dsBrowse]);
   btnProximaPagina.Enabled   := (Cds.State in [dsBrowse]);
   btnUltimaPagina.Enabled    := (Cds.State in [dsBrowse]);
   pnlInfo.Enabled            := not (Cds.State in [dsBrowse]);
   sbtnProcurarImagem.Enabled := (Cds.State in [dsInsert,dsEdit]);
end;

procedure TfrmCadImagemContrMT.cmpContratoValidaDados(Sender: TObject);
begin
   if (msContratos.RetornouValor) and (cds.State in [dsInsert,dsEdit]) then
    begin
       dbspPagina.MinValue:=CtrlImagemContr.
                                BuscaUltimoNumeroPagina(StrToIntDef(msContratos.ValoresChave[0],0))+1;

       dbspPagina.Value:=dbspPagina.MinValue;
       if not(Cds.State in [dsInsert]) then Cds.FieldByName('PAGINA').AsFloat:=dbspPagina.MinValue;

       rPaginaAux:=dbspPagina.MinValue;
       rIDContratoAux:=StrToIntDef(msContratos.ValoresChave[0],0);
    end;
end;

procedure TfrmCadImagemContrMT.btnPaginaInicialClick(Sender: TObject);
begin
   Cds.First;
   AtributosImagem;
end;

procedure TfrmCadImagemContrMT.btnPaginaAnteriorClick(Sender: TObject);
begin
   Cds.Prior;
   AtributosImagem;
end;

procedure TfrmCadImagemContrMT.btnProximaPaginaClick(Sender: TObject);
begin
   Cds.Next;
   AtributosImagem;
end;

procedure TfrmCadImagemContrMT.btnUltimaPaginaClick(Sender: TObject);
begin
   Cds.Last;
   AtributosImagem;
end;

procedure TfrmCadImagemContrMT.sbtnProcurarImagemClick(Sender: TObject);
var
   Imagem    : TBitmap;
   ImagemJPG : TJPEGImage;
   Extensao  : String;
   Arquivo   : File of Byte;
   Tamanho   : Longint;
   
begin
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

procedure TfrmCadImagemContrMT.CdsAfterScroll(DataSet: TDataSet);
begin
   inherited;
   iImagem.Picture:=dbiImagem.Picture;
end;

procedure TfrmCadImagemContrMT.iImagemDblClick(Sender: TObject);
var
   sFileName : string;
   i : integer;
begin
  inherited;
//---------- 14/05/2004 - Marcio Motta - Pendência: 16567-------------------------------------------

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

//------- Fim Implementação/Alteração - Marcio Motta -------------------------------
end;

procedure TfrmCadImagemContrMT.bbtnZoomINClick(Sender: TObject);
begin
  inherited;
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

procedure TfrmCadImagemContrMT.bbtnZoomOUTClick(Sender: TObject);
begin
  inherited;
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

procedure TfrmCadImagemContrMT.bbtnTamOriginalClick(Sender: TObject);
begin
  inherited;
  iImagem.Stretch := False;
  iImagem.AutoSize := True;
  VerificaBotoes;
end;

procedure TfrmCadImagemContrMT.VerificaBotoes;
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

procedure TfrmCadImagemContrMT.dsDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  // Guarda o tamanho original da imagem - Marcio Motta - Pendência: 16567
  iImagem.Stretch  := False;
  iImagem.AutoSize := True;
  AtributosImagem;
  VerificaBotoes;
end;

procedure TfrmCadImagemContrMT.AtributosImagem;
begin
  HeightImage := iImagem.Height;
  WidthImage  := iImagem.Width;
  bbtnTamOriginal.Enabled := False;
end;

procedure TfrmCadImagemContrMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled := True;
end;

procedure TfrmCadImagemContrMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i:integer;
begin
  inherited;
  if ListaArquivosTemp.Count > 0 then begin
    for i := 0 to ListaArquivosTemp.Count - 1 do begin
      DeleteFile(ListaArquivosTemp[i]);
    end;
  end;
  FreeAndNil(ListaArquivosTemp);
end;

procedure TfrmCadImagemContrMT.DesabilitaBotoes;
begin
  bbtnTamOriginal.Enabled   := False;
  bbtnZoomIN.Enabled        := False;
  bbtnZoomOUT.Enabled       := False;
  btnPaginaInicial.Enabled  := False;
  btnPaginaAnterior.Enabled := False;
  btnProximaPagina.Enabled  := False;
  btnUltimaPagina.Enabled   := False;
end;

procedure TfrmCadImagemContrMT.HabilitaBotoes;
begin
  bbtnZoomIN.Enabled        := True;
  bbtnZoomOUT.Enabled       := True;
  btnPaginaInicial.Enabled  := True;
  btnPaginaAnterior.Enabled := True;
  btnProximaPagina.Enabled  := True;
  btnUltimaPagina.Enabled   := True;
end;

end.
