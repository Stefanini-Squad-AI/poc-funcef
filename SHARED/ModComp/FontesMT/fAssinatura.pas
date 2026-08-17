unit fAssinatura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, ExtCtrls, Buttons, StdCtrls, ExtDlgs, Mask, wwdbedit,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, uCtrlAssinatura,
  uCtrlPadroes, uCMFileUtils, JPEG, fCadMsgPreDef;

type
  TfrmAssinatura = class(TFrmCadastroMT)
    dbeDescricao: TwwDBEdit;
    odImagem: TOpenPictureDialog;
    MontaSelectFuncionario: TMontaSelect;
    lbl2: TLabel;
    lbl1: TLabel;
    edtFuncionario: TEdit;
    btnAssociar: TBitBtn;
    btnLimpar: TBitBtn;
    pnl1: TPanel;
    imgAssinatura: TImage;
    btnProcurarFuncionario: TSpeedButton;
    btnLimparFuncionario: TSpeedButton;
    lbl3: TLabel;
    lbl4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure btnProcurarFuncionarioClick(Sender: TObject);
    procedure btnLimparFuncionarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure btnAssociarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure sbtnApagarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    objCtrlAssinatura : TCtrlASSINATURA;
    pintIdPessoa      : Integer;
    pIsAlterar        : Boolean;
    PintIDAssinatura  : Integer;
    function validaCamposObrigatorios() : Boolean;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmAssinatura: TfrmAssinatura;

implementation

{$R *.DFM}

procedure TfrmAssinatura.FormCreate(Sender: TObject);
begin
  objCtrlAssinatura := TCtrlASSINATURA.Create;
  objCtrlAssinatura.InitializeAs(Padroes);

  Cds.Data := objCtrlAssinatura.ProcurarASSINATURA('-1');
  pIsAlterar := False;
end;

procedure TfrmAssinatura.sbtnProcurarClick(Sender: TObject);
var ST : TStream;
    BM : TBitmap;
begin

  sbtnProcurar.down := false;
  MontaSelect.Executar;
  if (MontaSelect.RetornouValor) then
  begin
     cds.Data := objCtrlAssinatura.ProcurarASSINATURA(MontaSelect.ValoresChave[0]);
     edtFuncionario.Text :=  cds.FieldByName('NOME').AsString;
     ST := Cds.CreateBlobStream(Cds.FieldByName('ASSINATURA'), bmRead);
     BM := TBitmap.Create;
     BM.LoadFromStream(ST);
     imgAssinatura.Picture.Assign(BM);
     pintIdPessoa := Cds.FieldByName('IDPESSOA').AsInteger;

     if (pintIdPessoa > 0) then
     begin
       sbtnAlterar.Enabled := true;
       sbtnApagar.Enabled := true;
     end
     else
     begin
       sbtnAlterar.Enabled := false;
       sbtnApagar.Enabled := false;
     end;
  end;


end;

procedure TfrmAssinatura.btnProcurarFuncionarioClick(Sender: TObject);
begin
 MontaSelectFuncionario.Executar;
  if (MontaSelectFuncionario.RetornouValor) then
  begin
     pintIdPessoa := StrToInt(MontaSelectFuncionario.ValoresChave[0]);
     edtFuncionario.Text := MontaSelectFuncionario.ValoresChave[1];
  end;
end;

procedure TfrmAssinatura.btnLimparFuncionarioClick(Sender: TObject);
begin
 LimparCampos;
 if (MontaSelectFuncionario.RetornouValor) then
    MontaSelectFuncionario.Cancela;
end;

procedure TfrmAssinatura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(objCtrlAssinatura);
end;

procedure TfrmAssinatura.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
  Var
  sFileName, sNewFile: String;
  bDeleteFile: Boolean;
begin

  cds.Edit;
  cds.FieldByName('IDPESSOA').Value := pintIdPessoa;

  sFileName := odImagem.FileName;

  if (sFileName <> EmptyStr) and ((Pos('.jpg', LowerCase(sFileName)) <> 0) Or
           (Pos('.jpeg', LowerCase(sFileName)) <> 0)) then
  begin
     sNewFile := cmGetTempPath + IntToStr(GetTickCount) + '.bmp';
     CMJPegToBitmap(sFileName, sNewFile);
     sFileName := sNewFile;
  end;

  TBlobField(Cds.FieldByName('ASSINATURA')).LoadFromFile(sFileName);


  if (objCtrlAssinatura.VerificaAssinatura(pintIdPessoa)) then
  begin
    cds.Post;
    Accept := objCtrlAssinatura.GravarASSINATURA(Cds);
  end
  else
  begin
    if MessageBox(handle, 'Assinatura já existente para este funcionário. Deseja continuar?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
    begin
      cds.Post;
      Accept := objCtrlAssinatura.GravarASSINATURA(Cds);
    end
  end;

  cds.close;
  cds.Data := objCtrlAssinatura.ProcurarASSINATURA('-1');

  if not(Accept) then
    raise Exception.Create(objCtrlAssinatura.MessageInfo);
end;

procedure TfrmAssinatura.btnAssociarClick(Sender: TObject);
begin

  odImagem.Execute;

  If (odImagem.FileName <> EmptyStr) then
     imgAssinatura.Picture.LoadFromFile(odImagem.FileName);
end;

function TfrmAssinatura.validaCamposObrigatorios: Boolean;
var isValidaCampos : Boolean;
begin
  isValidaCampos := False;
  if (Trim(dbeDescricao.Text) <> EmptyStr) then
  begin
      if (pintIdPessoa > 0) then
      begin
        if   not(imgAssinatura.Picture.Bitmap.Empty) or
              not(imgAssinatura.Picture.Metafile.Empty) or
              not(imgAssinatura.Picture.Graphic.Empty) then
             isValidaCampos := true
        else
            ShowMessage('Preencha a Assinatura.');
      end
      else
         ShowMessage('Preencha o Funcionário.');
  end
  else
     ShowMessage('Preencha a Descrição.');

  Result := isValidaCampos;

end;

procedure TfrmAssinatura.bbtnConfirmarClick(Sender: TObject);
begin
  if (validaCamposObrigatorios) then
     inherited;

  sbtnInserir.Down := False;
  sbtnProcurar.Enabled := True;

  if (pIsAlterar) then
  begin
    Cds.data := objCtrlAssinatura.ProcurarASSINATURA(IntToStr(PintIDAssinatura));
    pIsAlterar := False;
  end;
  btnLimpar.Enabled := False;
  btnAssociar.Enabled := False;
end;

procedure TfrmAssinatura.sbtnInserirClick(Sender: TObject);
begin
  sbtnInserir.Down := True;
  btnLimpar.Enabled := True;
  btnAssociar.Enabled := true;
  Cds.Data := objCtrlAssinatura.ProcurarASSINATURA('-1');
  inherited;
  LimparCampos;
  dbeDescricao.SetFocus();
end;

procedure TfrmAssinatura.LimparCampos;
begin
  edtFuncionario.Text := EmptyStr;
  pintIdPessoa := 0;
  imgAssinatura.Picture := nil;

end;

procedure TfrmAssinatura.sbtnAlterarClick(Sender: TObject);
begin
  btnLimpar.Enabled := True;
  btnAssociar.Enabled := true;
  inherited;
  pIsAlterar := True;
  PintIDAssinatura := Cds.FieldByName('IDASSINATURA').AsInteger;
end;

procedure TfrmAssinatura.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
 Var
  sFileName, sNewFile: String;
  bDeleteFile: Boolean;
begin
  Cds.Edit;
  Cds.FieldByName('DESCRICAO').Value := dbeDescricao.Text;
  Cds.FieldByName('IDPESSOA').Value := pintIdPessoa;


  sFileName := odImagem.FileName;

  IF (sFileName <> EmptyStr) then
  begin
    if (sFileName <> EmptyStr) and ((Pos('.jpg', LowerCase(sFileName)) <> 0) Or
             (Pos('.jpeg', LowerCase(sFileName)) <> 0)) then
    begin
       sNewFile := cmGetTempPath + IntToStr(GetTickCount) + '.bmp';
       CMJPegToBitmap(sFileName, sNewFile);
       sFileName := sNewFile;
    end;

    TBlobField(Cds.FieldByName('ASSINATURA')).LoadFromFile(sFileName);
  end;
  cds.Post;
  Accept := objCtrlAssinatura.GravarASSINATURA(Cds);

  if not(Accept) then
    raise Exception.Create(objCtrlAssinatura.MessageInfo);

end;

procedure TfrmAssinatura.sbtnApagarClick(Sender: TObject);
begin
  if not (Cds.IsEmpty) then
   if (MessageBox(Handle, 'Deseja realmente excluir este registro?','Confirmação', MB_YESNO + MB_ICONQUESTION) =ID_YES ) then
      begin
        objCtrlAssinatura.ApagarAssinatura(cds.FieldByName('IDASSINATURA').AsInteger);
        Cds.Close;
      end;
      LimparCampos;

  sbtnAlterar.Enabled := False;
  sbtnApagar.Enabled := False;
end;

procedure TfrmAssinatura.btnLimparClick(Sender: TObject);
begin
  imgAssinatura.Picture := nil;
end;

procedure TfrmAssinatura.bbtnCancelarClick(Sender: TObject);
begin
    btnLimpar.Enabled := False;
  btnAssociar.Enabled := False;
  inherited;

end;

end.
