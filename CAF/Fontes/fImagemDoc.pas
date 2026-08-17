unit fImagemDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, TB97, DBCtrls, 
  Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, Wwdatsrc, ExtDlgs, db, wwQuery,
  DBTables, TB97Tlbr, IvDictio, IvMulti, IvEMulti, uCmSqlParams,
  DBClient, jPeg, uCMFileUtils, Menus, ImgList, TB97Ctls,
  twain, mcmTWAIN, mcmTWAINContainer, mcmTWAINKernel,  mcmTWAINIntf, mcmSTI;

type
  TfrmImagemDoc = class(TfrmSairAjuda)
    ToolbarSep971: TToolbarSep97;
    opnpicDoc: TOpenPictureDialog;
    ScrollBox1: TScrollBox;
    imgDoc: TImage;
    ToolbarSep972: TToolbarSep97;
    CdsImagemDoc: TClientDataSet;
    SQLImagemDoc: TCMSqlParams;
    PpmAssociar_Padrao: TPopupMenu;
    ImgPpmAssociar_Padrao: TImageList;
    MnuDoArquivo_Padrao: TMenuItem;
    MnuDigitalizar_Padrao: TMenuItem;
    BtnImagem: TToolbarButton97;
    MnuSep_Padrao: TMenuItem;
    MnuLimparImagem_Padrao: TMenuItem;
    mcmTWAIN: TmcmTWAIN;
    mcmSTI: TmcmSTI;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure MnuDoArquivo_PadraoClick(Sender: TObject);
    procedure MnuLimparImagem_PadraoClick(Sender: TObject);
    procedure MnuDigitalizar_PadraoClick(Sender: TObject);
    procedure mcmTWAINDeviceNotReady(Sender: TObject;
      var DoOpenSource: Boolean);
    procedure mcmTWAINEnableMenus(Sender: TObject);
    procedure mcmTWAINFailure(Sender: TObject; DG: Integer; DAT, CAP,
      MSG: Word; Error, Status: Integer);
    procedure mcmTWAINImageReady(Sender: TObject; pBmp: Pointer;
      pBmpInfo: PBitmapInfo; hImage: HBITMAP; FilePath: String);
    procedure mcmTWAINMemXferSize(Sender: TObject; MinSize,
      MaxSize: Integer; var BufSize: Integer; pBmpInfo: PBitmapInfo);
    procedure mcmTWAINNegotiation(Sender: TObject;
      var CancelScan: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure mcmTWAINDisableMenus(Sender: TObject);
  private
    { Private declarations }
    FdsImg: TwwDataSource;
    FCampoPai: TFloatField;
    FImagem: TBlobField;
    FColorFormat: integer;
    procedure ReTamanho;
  public
    { Public declarations }
   property dsImagem : TwwDataSource read FdsImg write FdsImg;
   property CampoPai : TFloatField read FCampoPai write FCampoPai;
   property Imagem   : TBlobField read FImagem write FImagem;
  end;

var
  frmImagemDoc: TfrmImagemDoc;

implementation

uses uMensErro, uSistema, uCMTypes, uCtrlPadroes, uConexaoPadrao, JclFileUtils,
     uCMDialogs, uCMRegister;

{$R *.DFM}

procedure TfrmImagemDoc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 (*
 FdsImg := nil;
 FCampoPai := nil;
 Action := caFree;
 inherited;
 *)
end;

procedure TfrmImagemDoc.FormShow(Sender: TObject);
begin
     Screen.Cursor := crHourGlass;
     inherited;
     with FdsImg.DataSet do
     begin
          if FCampoPai.Value <= 0 then
          begin
               Insert;
//               If Sistema.ConnectionSide = CnsServer Then
//                  FieldByName('IDIMAGEM').AsFloat := ConexaoPadrao.LeUltRegistro('IMAGENSDIGITALIZADAS');
//               Else
               FieldByName('IDIMAGEM').AsFloat := Abs(Padroes.GetNextID);
               Post;
          end;
     end;

     with SQLImagemDoc do
     begin
          if FCampoPai.Value <= 0 then
             imgDoc.Picture.Assign(nil)
          else
          if FImagem.IsNull then
             begin
                  Prepare;
                  ParamByName('IDIMAGEM').AsFloat := FCampoPai.AsFloat;
                  close;
                  open;
                  imgDoc.Picture.Assign(CdsImagemDoc.FieldByName('Imagem'));
                  CdsImagemDoc.close;
             end
          else
              imgDoc.Picture.Assign(FImagem);
     end;
     ReTamanho;
     Screen.Cursor := crDefault;
end;

procedure TfrmImagemDoc.ReTamanho;
begin
  if (FCampoPai.Value > 0) then
  begin
       imgDoc.Width  := imgDoc.Picture.Width +20;
       imgDoc.Height := imgDoc.Picture.Height +20;
  end
  else
  begin
      imgDoc.Height := 224;
      imgDoc.Width := 342;
  end;
  Width := imgDoc.Width+18;
  Height := imgDoc.Height+76;
  if width < 360 then
     width := 360;
  if width > Screen.Width then
     width := Screen.Width;
  if Height < 300 then
     Height := 300;
  if Height > Screen.Height then
     Height := Screen.Height;

  Top  := Round((Screen.Height - Height) / 2);
  Left := Round((Screen.width - width) / 2);
end;

procedure TfrmImagemDoc.bbtnSairClick(Sender: TObject);
begin
  inherited;
  if imgDoc.Picture = nil then (*  FCampoPai.Value <= 0 then *)
     FdsImg.DataSet.Delete;
end;

procedure TfrmImagemDoc.MnuDoArquivo_PadraoClick(Sender: TObject);
Var
  sFileName, sNewFile: String;
  bDeleteFile: Boolean;
begin
  inherited;
  if opnPicDoc.Execute then
  begin
       bDeleteFile := False;

       with FdsImg.DataSet do
       begin
          sFileName := OpnPicDoc.FileName;

          If (Pos('.jpg', LowerCase(sFileName)) <> 0) Or
             (Pos('.jpeg', LowerCase(sFileName)) <> 0) Then
          Begin
             sNewFile := cmGetTempPath + IntToStr(GetTickCount) + '.bmp';
             CMJPegToBitmap(sFileName, sNewFile);
             sFileName := sNewFile;
             bDeleteFile := True;
          End;

          imgDoc.Picture.LoadFromFile(sFileName); //Assign(FieldByName('Imagem'));

          Edit;
          FCampoPai.AsFloat := FieldByName('IDIMAGEM').AsFloat;
          FieldByName('DESCRIMAGEM').Value := Caption;
          TBlobField(FieldByName('Imagem')).LoadFromFile(sFileName);
          Post;

          If bDeleteFile Then DeleteFile(sFileName);
       end;

       ReTamanho;
  end;
end;

procedure TfrmImagemDoc.MnuLimparImagem_PadraoClick(Sender: TObject);
begin
  inherited;
  with FdsImg.DataSet do
  begin
       if (not eof) and
       (MsgDlg('Deseja desassociar a imagem?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrYes) then
     begin
          Edit;
          TBlobField(FieldByName('Imagem')).Clear;
          FCampoPai.Clear;
          Post;
          imgDoc.Picture.Assign(FieldByName('Imagem'));
          ReTamanho;
     end;
  end;
end;

procedure TfrmImagemDoc.MnuDigitalizar_PadraoClick(Sender: TObject);
Var
  sValor: String;
  lstSource: TStrings;
begin
  inherited;
  lstSource := TStringlist.Create;
  CmRegister := TCmRegister.Create;
  Try
    mcmTWAIN.GetSourceList(lstSource);

    if lstSource.Count = 0 then
      lstSource.Text := CmRegister.LerStringReg(HKEY_CURRENT_USER, 'Software\CM\Twain','Devices', '')
    else
      CmRegister.EscreverStringReg(HKEY_CURRENT_USER, 'Software\CM\Twain','Devices',lstSource.Text);

    if InputValue(Caption, 'Selecione o Dispositivo', sValor, LstSource) then
    begin
      if Not(mcmTWAIN.Acquire(sValor))
        then MsgDlg('Não foi possível abrir o dispositivo devido.' + (#13+#10) +
                    'Feche a tela de Associação de imagem e acesse novamente esta opção.',
                    'Atenção', mtInformation, [mbOk], 0);
    end;
  finally
    lstSource.Free;
    CmRegister.Free;
  end;
end;

procedure TfrmImagemDoc.mcmTWAINDeviceNotReady(Sender: TObject;
  var DoOpenSource: Boolean);
begin
  inherited;
  case MessageDlg('O hardware não está conectado, ligado ou perdeu a comunicação! ' + chr($0D) +
                  'Deseja tentar novamente ?', mtConfirmation, [mbYes, mbNo], 0) of
    mrYes   : Sleep(500);
    mrNo    : DoOpenSource := False;
  end;
end;

procedure TfrmImagemDoc.mcmTWAINEnableMenus(Sender: TObject);
begin
  inherited;
  BtnImagem.Enabled := True;
  bbtnSair.Enabled := True;
  bbtnAjuda.Enabled := True;
end;

procedure TfrmImagemDoc.mcmTWAINFailure(Sender: TObject; DG: Integer; DAT,
  CAP, MSG: Word; Error, Status: Integer);
begin
  inherited;
  if (Error = TWRC_EXCEPTION) then
    ShowMessage('Ocorreu um erro ao acessar o dispositivo: ' + mcmTWAIN.SourceInfo.ProductName);

  if (DG in [DG_CONTROL, DG_IMAGE])
  then
  begin
    case DAT of
      DAT_CAPABILITY :
         case CAP of
           ICAP_PIXELTYPE : ShowMessage('Erro ao adquirir imagem!');
         end;
    end;
  end;
end;

procedure TfrmImagemDoc.mcmTWAINImageReady(Sender: TObject; pBmp: Pointer;
  pBmpInfo: PBitmapInfo; hImage: HBITMAP; FilePath: String);
var
  JPEGImage : TJPEGImage;
  sFileName: String;
begin
//------------------------------------------------------------------------------
// Image is available.
// -------------------
// This event is fired after the Data Source has transferred the complete image
// to the mcmTWAIN component.
// This event returns the acquired image.
//------------------------------------------------------------------------------
  if (hImage <> 0)
  then begin
       if (mcmTWAIN.DIBHandleType <> THDT_DIBRAW)
       then begin
            // If you want to use the pBmpInfo pointer, make a copy!
            // The pBmpInfo pointer is only valid in this event procedure.
            // This pointer is only created when THDT_DIBSEC is chosen in
            // DIBHandleType.
            with imgDoc.Picture
            do begin
               // Do not set any properties on the TImage until after the assignment
               //   Bitmap.Handle := hImage;
               // Especially, omit doing
               //   Bitmap.Width  := mcmTWAIN.ImageWidth;
               //   Bitmap.Height := mcmTWAIN.ImageHeight;
               // as this will increase memory usage unnecessaryly.
               Bitmap.Handle := hImage;
            end;
       end
       // This example does not support the THDT_DIBRAW format.
       // In THDT_DIBRAW format, the hImage containes the BitmapInfo, i.e.
       // (BitmapInfoHeader and RGBQUAD palette) followed by the bitmap data.
       else GlobalFree(hImage);
  end
  else begin // A file name was returned.
       if FileExists(FilePath)
       then begin
            if (Pos('.bmp', lowercase(FilePath)) = Length(FilePath) - 3)
            then imgDoc.Picture.Bitmap.LoadFromFile(FilePath)
            else if (Pos('.jpg', lowercase(FilePath)) = Length(FilePath) - 3)
                 then begin
                      JPEGImage := TJPEGImage.Create;
                      try
                        JPEGImage.LoadFromFile(FilePath);
                        JPEGImage.DIBNeeded;
                        imgDoc.Picture.Bitmap.Width  := JPEGImage.Width;
                        imgDoc.Picture.Bitmap.Height := JPEGImage.Height;
                        imgDoc.Picture.Bitmap.HandleType := bmDIB;
                        imgDoc.Picture.Bitmap.Canvas.Draw(0, 0, JPEGImage);
                      except
                      end;
                      JPEGImage.Free;
                 end
                 //-------------------------------------------------------------
                 // To read tiff images you must supply your own import filter!
                 else if (Pos('.tif', lowercase(FilePath)) = Length(FilePath) - 3)
                      then ;
       end;
  end;

  // Grava a Imagem no ClientDataSet
  with FdsImg.DataSet do
  begin
    imgDoc.Picture.SaveToFile(mcmTWAIN.Filename);

    Edit;
    FCampoPai.AsFloat := FieldByName('IDIMAGEM').AsFloat;
    FieldByName('DESCRIMAGEM').Value := Caption;
    TBlobField(FieldByName('Imagem')).LoadFromFile(mcmTWAIN.Filename);
    Post;

    DeleteFile(mcmTWAIN.Filename);
  end;

  ReTamanho;
  //
end;

procedure TfrmImagemDoc.mcmTWAINMemXferSize(Sender: TObject; MinSize,
  MaxSize: Integer; var BufSize: Integer; pBmpInfo: PBitmapInfo);
var LongWidth  : integer;
    BufferSize : integer;
    FNoLines   : integer;
begin
  // Set-up number of lines/bytes to (Memory) transfer in each image chunk.
  with pBmpInfo^.bmiHeader
  do LongWidth := (((Longint(biWidth * biBitCount) + 31) div 32) * 4);
  FNoLines  := pBmpInfo^.bmiHeader.biHeight div 4; // Number of lines to transfer.
  BufferSize := FNoLines * LongWidth;

  // Validate that BufferSize satisfy the condition specified by the data source,
  // i.e. MinSize <= BufferSize <= MaxSize.
  if (BufferSize < MinSize)
  then begin
       FNoLines := Trunc(0.9999 + MinSize / LongWidth);
       BufferSize := FNoLines * LongWidth;
  end;

  if (BufferSize > MaxSize) and (MaxSize <> integer(TWON_DONTCARE32))
  then begin
       FNoLines := Trunc(MaxSize / LongWidth);
       BufferSize := FNoLines * LongWidth;
  end;

  BufSize := BufferSize;

end;

procedure TfrmImagemDoc.mcmTWAINNegotiation(Sender: TObject;
  var CancelScan: Boolean);
var i             : integer;
    r             : double;
    Resolution    : double;
    xRes, yRes    : double;
    xMin, yMin    : double;
    xMax, yMax    : double;
    ImageLayout   : TImageLayout;
    Container     : TtwnContainer;
    FADFAvailable : boolean;
    FBitDepth     : integer;
    FBitReduction : integer;
begin
//------------------------------------------------------------------------------
// Negotiate capabilities.
// -----------------------
// This event is fired when the Data Source is opened, but before it becomes
// enabled.
// When you negotiate capabilities, you should alway check that the capability
// is supported by calling IsCapSupported(CAP_xxxx).
// Unfortunatly some data sources promis just a bit more than they realy can
// live up. Therefore it's a fairly good idear to GET the capability before
// SETting it.
//
// Below, you'll find many examples on how to change the data source settings.
// You do not have to implement all or any of these negotiations, just the ones
// required by your application. But remember that some capabilities do depend
// on others.
//------------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // Feeder capabilities.

  // Is Feeder selected in the menu, then enable it.
  // Call FeederEnabled to enable/disable the feeder.
  if mcmTWAIN.FeederEnabled(False)
  then FADFAvailable := False
  else begin
       Container := mcmTWAIN.Containers.Items[CAP_FEEDERENABLED];
       if Assigned(Container)
       then FADFAvailable := Container.CurrentValue
       else FADFAvailable := False;
  end;

  if FADFAvailable
  then begin
       if mcmTWAIN.PaperDetectable
       then if Not(mcmTWAIN.FeederLoaded)
            then begin
                 // Inform user that feeder is not loaded.
                 ShowMessage('Could not detect paper in feeder.');
                 CancelScan := True;
                 // Could loop until paper is inserted or quit
                 // acquisition!
            end;

       // Enable auto-feed.
       mcmTWAIN.AutoFeed(False);

       // Check for Duplex scan unit, if found then enable it.
       if (mcmTWAIN.Duplex <> TWDX_NONE)
       then mcmTWAIN.DuplexEnabled := True;
  end;


  //----------------------------------------------------------------------------
  // Negotiate dimension unit.

  // Get/Set current unit.
  if (mcmTWAIN.Units <> TWUN_INCHES)
  then mcmTWAIN.Units := TWUN_INCHES;

  // Get native resolution (Devices optical resolution).
  // Use this and set to XResolution & YResolution if f. ex. you want an image
  // recorded with the scanners native/optical resolution.
  //xRes := mcmTWAIN.NativeXResolution;
  //yRes := mcmTWAIN.NativeYResolution;

  // Get physical max size.
  xMax := mcmTWAIN.PhysicalWidth;
  yMax := mcmTWAIN.PhysicalHeight;

  // Get scanners/cameras minimum scan height and width.
  if mcmTWAIN.IsCapSupported(ICAP_MINIMUMHEIGHT)
  then yMin := mcmTWAIN.MinimumHeight
  else yMin := 0;
  if (yMin < 0)
  then yMin := 0;
  if mcmTWAIN.IsCapSupported(ICAP_MINIMUMWIDTH)
  then xMin := mcmTWAIN.MinimumWidth
  else xMin := 0;
  if (xMin < 0)
  then xMin := 0;

  //----------------------------------------------------------------------------
  // Negotiate Color.

  // Get/Set current bit order.
  if (mcmTWAIN.BitOrder <> TWBO_MSBFIRST)
  then mcmTWAIN.BitOrder := TWBO_MSBFIRST;

  // Get/Set current pixel type.
  // FColorFormat := TWPT_RGB; //TWPT_BW; // TWPT_RGB; Value set via menu!
  if mcmTWAIN.IsCapSupported(ICAP_PIXELTYPE)
  then begin
       if (mcmTWAIN.PixelType <> FColorFormat)
       then begin
            mcmTWAIN.PixelType := FColorFormat;
            FColorFormat := mcmTWAIN.PixelType;
       end;
  end;

  // If you would like to negotiate other capabilities not directly supported
  // by the TmcmTWAIN component, this is how to proceed.
  // For example for setting PixelType:
  (*
  if mcmTwain.IsCapSupported(ICAP_PIXELTYPE)
  then begin
       Container := Nil;
       if (mcmTWAIN.GetCapabilityMsg(ICAP_PIXELTYPE, MSG_GET, Container) = TWRC_SUCCESS)
       then begin
            Container.CurrentValue := TWPT_GRAY;
            if (mcmTWAIN.SetCapabilityMsg(MSG_SET, True, Container) <> TWRC_SUCCESS)
            then { An Error occured. } ;
       end;
       Container := Nil;
  end;
  *)

  //----------------------------------------------------------------------------
  // Get/Set current bit depth.
  // The number of bits, are the total bits for a pixel (color).
  // TWPC_BW      -> ICAP_BITDEPTH = 1
  // TWPC_GRAY    -> ICAP_BITDEPTH = 4, 8 (maybe higher, if source supports this).
  // TWPC_PALETTE -> ICAP_BITDEPTH = 4 or 8.
  // TWPC_RGB     -> ICAP_BITDEPTH = 16, 24, 32 (maybe higher, if source supports this).
  FBitDepth := mcmTWAIN.BitDepth;
  case FColorFormat of
  TWPT_BW      : begin
                   if (FBitDepth <> 1)
                   then begin
                        mcmTWAIN.BitDepth := 1;
                        FBitDepth := mcmTWAIN.BitDepth;
                   end;
                 end;
  TWPT_GRAY,
  TWPT_PALETTE : begin
                   if (FBitDepth <> 8)
                   then begin
                        mcmTWAIN.BitDepth := 8;
                        FBitDepth := mcmTWAIN.BitDepth;
                   end;
                 end;
  TWPT_RGB     : begin
                   if (FBitDepth <> 24)
                   then begin
                        mcmTWAIN.BitDepth := 24;
                        FBitDepth := mcmTWAIN.BitDepth;
                   end;
                 end;
  end;

  // Did we get the requested bit depth ?
  if (FBitDepth in [1,8,24])
  then ; //

  // Get/Set current pixel flavor.
  if (mcmTWAIN.PixelFlavor <> TWPF_CHOCOLATE)
  then mcmTWAIN.PixelFlavor := TWPF_CHOCOLATE;

  // RGB Pixel data arrangement.
  if (FColorFormat = TWPT_RGB)
  then begin
       // We want the bitmap data returned as "RGBRGB..." not "RRR..GGG..BBB..".
       if (mcmTWAIN.PlanarChunky <> TWPC_CHUNKY)
       then mcmTWAIN.PlanarChunky := TWPC_CHUNKY;
  end;

  if (FColorFormat in [TWPT_BW,TWPT_GRAY,TWPT_PALETTE])
  then begin
       FBitReduction := -1;
       // Most commenly used with Black & White images.
       // Therefore, support for TWPT_GRAY and TWPT_PALETTE may not be available!
       if mcmTWAIN.IsCapSupported(ICAP_BITDEPTHREDUCTION)
       then begin
            Container := Nil;
            if (mcmTWAIN.GetCapabilityMsg(ICAP_BITDEPTHREDUCTION, MSG_GET, Container) = TWRC_SUCCESS)
            then begin
                 case FColorFormat of
                 TWPT_BW      : FBitReduction := TWBR_THRESHOLD;
                 TWPT_GRAY    : FBitReduction := TWBR_DIFFUSION;
                 TWPT_PALETTE : FBitReduction := TWBR_HALFTONE;
                 end;
                 if (FBitReduction <> Container.CurrentValue)
                 then begin
                      Container.CurrentValue := FBitReduction;
                      if (mcmTWAIN.SetCapabilityMsg(MSG_SET, True, Container) = TWRC_SUCCESS)
                      then mcmTWAIN.GetCapabilityMsg(ICAP_BITDEPTHREDUCTION, MSG_GET, Container);
                      FBitReduction := Container.CurrentValue;
                 end;
            end;
       end;

       // Threshold or Half-tones? Above Threshold was selected!
       case FBitReduction of
       TWBR_THRESHOLD    : if mcmTWAIN.IsCapSupported(ICAP_THRESHOLD)
                           then begin // Threshold method was selected.
                                Container := Nil;
                                if (mcmTWAIN.GetCapabilityMsg(ICAP_THRESHOLD, MSG_GET, Container) = TWRC_SUCCESS)
                                then begin
                                     Container.CurrentValue := 128;
                                     if (mcmTWAIN.SetCapabilityMsg(MSG_SET, True, Container) = TWRC_SUCCESS)
                                     then ; // Current value was changed to default item in the list.
                                end;
                           end;
       TWBR_HALFTONE     : if mcmTWAIN.IsCapSupported(ICAP_HALFTONES)
                           then begin // Half tone method was selected.
                                Container := Nil;
                                if (mcmTWAIN.GetCapabilityMsg(ICAP_HALFTONES, MSG_GET, Container) = TWRC_SUCCESS)
                                then begin
                                     // The current halftone is available through Container.CurrentValue.
                                     if (Container.NumItems >= 1)
                                     then begin
                                          // To iterate through items in a container,
                                          //for i := 0 to (Container.NumItems - 1)
                                          //do ShowMessage('Item[' + IntToStr(i) + '] := ' + Container.Items[i]);
                                     end;
                                     // We'll selected the source default.
                                     if (Container.CurrentIndex <> Container.DefaultIndex)
                                     then begin
                                          Container.CurrentIndex := Container.DefaultIndex;
                                          if (mcmTWAIN.SetCapabilityMsg(MSG_SET, True, Container) = TWRC_SUCCESS)
                                          then ; // Current value was changed to default item in the list.
                                     end;
                                end;
                           end;
       TWBR_CUSTHALFTONE : ;
       TWBR_DIFFUSION    : ;
       end;
  end;

  //----------------------------------------------------------------------------
  // Negotiate dimensions.

  Resolution := 150.0; // We'll try 150 dpi.

  // Get X resolution.
  xRes := mcmTWAIN.XResolution;
  if (xRes <> Resolution)
  then begin
       // Lets check that the resolution is in range.
       Container := mcmTWAIN.Containers.Items[ICAP_XRESOLUTION];
       if Assigned(Container)
       then if (Container.ContainerType <> TWON_ONEVALUE)
            then begin
                 if (Container.MinValue <= Resolution) and (Resolution <= Container.MaxValue)
                 then mcmTWAIN.XResolution := Resolution // Our choice was OK
                 else if (Container.MinValue > Resolution)
                      then mcmTWAIN.XResolution := Container.MinValue // Nop, it's too small
                      else if (Resolution > Container.MaxValue)
                           then mcmTWAIN.XResolution := Container.MaxValue; // Nop, it's too big
       end
       else mcmTWAIN.XResolution := Resolution;
       xRes := mcmTwain.XResolution;
       if (xRes = -1)
       then begin
            Container := Nil;
            mcmTWAIN.GetCapabilityMsg(ICAP_XRESOLUTION, MSG_RESET, Container);
            if (Container <> Nil)
            then xRes := Container.CurrentValue;
       end;

       // Had we just set "Resolution" to mcmTWAIN.XResolution and this value was
       // outside the range, mcmTWAIN would override the choice and use the
       // CurrentValue. Note that the same goes of all capabilities negotiated.
  end;

  // Get Y resolution.
  mcmTWAIN.YResolution := Resolution;
  yRes := mcmTWAIN.YResolution;
  if (yRes <> Resolution)
  then begin
       // Lets check that the resolution is in range.
       Container := mcmTWAIN.Containers.Items[ICAP_YRESOLUTION];
       if Assigned(Container)
       then if (Container.ContainerType <> TWON_ONEVALUE)
            then begin
                 if (Container.MinValue <= Resolution) and (Resolution <= Container.MaxValue)
                 then mcmTWAIN.YResolution := Resolution // Our choice was OK
                 else if (Container.MinValue > Resolution)
                      then mcmTWAIN.YResolution := Container.MinValue // Nop, it's too small
                      else if (Resolution > Container.MaxValue)
                           then mcmTWAIN.YResolution := Container.MaxValue; // Nop, it's too big
       end
       else mcmTWAIN.YResolution := Resolution;
       yRes := mcmTwain.YResolution;
       if (yRes = -1)
       then begin
            Container := Nil;
            mcmTWAIN.GetCapabilityMsg(ICAP_YRESOLUTION, MSG_RESET, Container);
            if (Container <> Nil)
            then yRes := Container.CurrentValue;
       end;
  end;
  Container := Nil;

  // Negotiate X & Y Scaling to default 1.0.
  if (mcmTWAIN.XScaling <> 1.0)
  then mcmTWAIN.XScaling := 1.0;
  if (mcmTWAIN.YScaling <> 1.0)
  then mcmTWAIN.YScaling := 1.0;

  //----------------------------------------------------------------------------
  // NOTE: If required negotiate Zoom factor here.

  //----------------------------------------------------------------------------
  // Negotiate Auto Brightness.
  mcmTWAIN.AutoBrightness := True;

  //----------------------------------------------------------------------------
  // NOTE: If required negotiate Brightness, Contract etc. here

  //----------------------------------------------------------------------------
  // We'll disable undefined images size, automatic boarder detection, rotate
  // and deskew!

  if mcmTwain.IsCapSupported(ICAP_UNDEFINEDIMAGESIZE)
  then begin
       Container := Nil;
       if (mcmTWAIN.GetCapabilityMsg(ICAP_UNDEFINEDIMAGESIZE, MSG_GET, Container) = TWRC_SUCCESS)
       then begin
            Container.CurrentValue := False;
            if (mcmTWAIN.SetCapabilityMsg(MSG_SET, True, Container) = TWRC_SUCCESS)
            then { An Error occured. }
            else begin
                 if (mcmTWAIN.GetCapabilityMsg(ICAP_UNDEFINEDIMAGESIZE, MSG_GET, Container) = TWRC_SUCCESS)
                 then begin
                      if (Container.CurrentValue = True)
                      then begin
                           if mcmTwain.IsCapSupported(ICAP_AUTOMATICBORDERDETECTION)
                           then begin
                                Container := Nil;
                                if (mcmTWAIN.GetCapabilityMsg(ICAP_AUTOMATICBORDERDETECTION, MSG_GET, Container) = TWRC_SUCCESS)
                                then begin
                                     Container.CurrentValue := False;
                                     if (mcmTWAIN.SetCapabilityMsg(MSG_SET, True, Container) = TWRC_SUCCESS)
                                     then { An Error occured. } ;
                                end;
                           end;
                      end;
                 end;
            end;
       end;
  end;

  if mcmTwain.IsCapSupported(ICAP_AUTOMATICDESKEW)
  then begin
       Container := Nil;
       if (mcmTWAIN.GetCapabilityMsg(ICAP_AUTOMATICDESKEW, MSG_GET, Container) = TWRC_SUCCESS)
       then begin
            if (Container.CurrentValue <> False)
            then begin
                 Container.CurrentValue := False;
                 if (mcmTWAIN.SetCapabilityMsg(MSG_SET, True, Container) = TWRC_SUCCESS)
                 then { An Error occured. } ;
            end;
       end;
  end;

  if mcmTwain.IsCapSupported(ICAP_AUTOMATICROTATE)
  then begin
       Container := Nil;
       if (mcmTWAIN.GetCapabilityMsg(ICAP_AUTOMATICROTATE, MSG_GET, Container) = TWRC_SUCCESS)
       then begin
            if (Container.CurrentValue <> False)
            then begin
                 Container.CurrentValue := False;
                 if (mcmTWAIN.SetCapabilityMsg(MSG_SET, True, Container) = TWRC_SUCCESS)
                 then { An Error occured. } ;
            end;
       end;
  end;

  //----------------------------------------------------------------------------
  // Negotiate paper size to an A4.
  if (mcmTWAIN.PageType <> TWSS_A4LETTER)  // See TWAIN.PAS for other fixed sizes.
  then mcmTWAIN.PageType := TWSS_A4LETTER; // f.ex. TWSS_USLETTER, TWSS_USLEGAL

  //----------------------------------------------------------------------------
  // Negotiate the Image layout her !
  // Remember to negotiate Unit and Resolution first, as above.

  // You should do this only after negotiating ADF, Units and resolution and
  // color.
  // We are requesting the a quater of the maximum area.

  mcmTWAIN.ResetImageLayout;
  ImageLayout := mcmTWAIN.GetImageLayout;
  with ImageLayout
  do begin
     // Set frame layout to an A4 size
     Frame.Left   := 0;
     Frame.Top    := 0;
     Frame.Right  := 8.2677;
     Frame.Bottom := 11.6929;

     if (yMin < (Frame.Bottom - Frame.Top))
     then ; // Correct for scanners minimum scan height!

     if (xMin < (Frame.Right - Frame.Left))
     then ; // Correct for scanners minimum scan height!

     // You could use xMax and yMax inquired earlier to ensure that the
     // requested frame is within limits.
     if (xMax > 0.0)
     then if (Frame.Right > xMax)
          then Frame.Right := xMax;
     if (yMax > 0)
     then if (Frame.Bottom > yMax)
          then Frame.Bottom := yMax;
  end;
  mcmTWAIN.SetImageLayout(ImageLayout);

  //----------------------------------------------------------------------------
  // Negotiate Frames!
  // Remember to negotiate Unit and Resolution first, as above.
  (*
  if mcmTwain.IsCapSupported(ICAP_MAXFRAMES) and
     (mcmTWAIN.DSResult <> TWRC_SUCCESS) // <- Setting ImageLayout didn't succeed.
  then begin
       // if data source provides more frames that app is willing to handle
       // then set the number of frames.
       mcmTWAIN.MaxFrames := 1;

       // Get maximum number of frames that the data source can provide.
       if (mcmTWAIN.MaxFrames > 0)
       then begin
            // Set-up one frame.
            Container := mcmTWAIN.GetFrames;
            if (Container <> Nil)
            then begin
                 Container.NumItems := 1;
                 Container.Frames[0].Left   := 0.0;
                 Container.Frames[0].Top    := 0.0;
                 Container.Frames[0].Right  := 8.27;
                 Container.Frames[0].Bottom := 11.69;
                 mcmTWAIN.SetFrames(Container);
            end;
       end;
  end;
  *)

  //----------------------------------------------------------------------------
  // Negotiate Orientation / Rotation.

  // Negotiating Orientation and/or Rotation shall be done after considering
  // the DAT_IMAGELAYOUT and ICAP_FRAMES.
  i := mcmTWAIN.Orientation;
  if (i <> TWOR_ROT0)
  then mcmTWAIN.Orientation := TWOR_ROT0;

  if mcmTwain.IsCapSupported(ICAP_FLIPROTATION)
  then begin
       Container := Nil;
       if (mcmTWAIN.GetCapabilityMsg(ICAP_FLIPROTATION, MSG_GET, Container) = TWRC_SUCCESS)
       then begin
            if (Container.CurrentValue <> TWFR_BOOK) // Alternativ to TWFR_BOOK is TWFR_FANFOLD
            then begin
                 Container.CurrentValue := TWFR_BOOK;
                 if (mcmTWAIN.SetCapabilityMsg(MSG_SET, True, Container) = TWRC_SUCCESS)
                 then { An Error occured. } ;
            end;
       end;
       Container := Nil;
  end;

  r := mcmTWAIN.Rotation;
  if (r <> 0.0)
  then mcmTWAIN.Rotation := 0.0;

  (*
  if (mcmTWAIN.XferMech = TWFX_FILES) or (mcmTWAIN.XferMech = TWFX_MEMORY)
  then begin
       // Might want to check that file format is set to TIFF.
       //...
       if mcmTWAIN.IsCapSupported(ICAP_COMPRESSION)
       then begin
            Container := Nil;
            if (mcmTWAIN.GetCapabilityMsg(ICAP_COMPRESSION, MSG_GET, Container) = TWRC_SUCCESS)
            then begin
                 Container.CurrentValue := TWCP_GROUP4;
                 if (mcmTWAIN.SetCapabilityMsg(MSG_SET, True, Container) = TWRC_SUCCESS)
                 then begin
                      Container := Nil;
                      if (mcmTWAIN.GetCapabilityMsg(ICAP_CCITTKFACTOR, MSG_GET, Container) = TWRC_SUCCESS)
                      then begin
                           Container.CurrentValue := 4; // valid values are 0..(2^16) - 1.
                           if (mcmTWAIN.SetCapabilityMsg(MSG_SET, True, Container) <> TWRC_SUCCESS)
                           then ; // Didn't succeed!
                      end;
                 end;
            end;
       end;
  end;
  *)

  //----------------------------------------------------------------------------
  // Just for fun - let's set the Author of the acquisition
  if mcmTWAIN.IsCapSupported(CAP_AUTHOR)
  then begin
       // If you do not have a fully initialized Container, make sure to set
       // it to Nil before calling GetCapabilityMsg. GetCapabilityMsg will
       // return a container holding the Cap's data. Note, that any Container
       // returned by mcmTWAIN is maintained by mcmTWAIN Container list.
       Container := Nil;

       // GetCapabilityMsg returnes TWRC_SUCCESS if the capability was obtained
       // successfully. If the returned value is different from TWRC_SUCCESS
       // the Container is not valid.
       if (mcmTWAIN.GetCapabilityMsg(CAP_AUTHOR, MSG_GET, Container) = TWRC_SUCCESS)
       then begin
            // Authors name is in ->
            // Container.CurrentValue - a string;
       end;

       // After calling Containers.DeleteItem the Container holding CAP_AUTHOR
       // is not vaild. Note, you do not have to delete the container. This
       // will be done automatically when the session is closed.
       mcmTWAIN.Containers.DeleteItem(CAP_AUTHOR);
  end;

  if FADFAvailable
  then begin
        // Control the number of pages to transfer. In the case transfer
        // we want all available images use "-1".
        mcmTWAIN.NumImagesToScan(3);

        if mcmTWAIN.AutoScan(True)
        then begin
             mcmTWAIN.MaxBatchBuffers := 1;
             if (mcmTWAIN.MaxBatchBuffers > 0)
             then mcmTWAIN.ClearBatchBuffers := TWCB_CLEAR; // TWCB_AUTO, TWCB_NOCLEAR
        end;
  end;
end;

procedure TfrmImagemDoc.FormCreate(Sender: TObject);
begin
  inherited;
  FColorFormat := TWPT_RGB;
end;

procedure TfrmImagemDoc.mcmTWAINDisableMenus(Sender: TObject);
begin
  inherited;
  BtnImagem.Enabled := False;
  bbtnSair.Enabled := False;
  bbtnAjuda.Enabled := False;                           
end;

end.


