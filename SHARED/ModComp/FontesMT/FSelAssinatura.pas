unit FSelAssinatura;

{***************************************************************************************************
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
Rotinas.....: bbtnConfirmarClick
****************************************************************************************************}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Buttons, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97,
  MontaSelect, uCMClientDataSet, uCtrlAssinatura, uCtrlPadroes, RCertificado,
  uCMFileUtils, JPEG, FCadastroMT, Db, DBClient;

type
  TfrmSelecaoAssinatura = class(TfrmOkCancelar)
    grp1: TGroupBox;
    dteAssinatura: TCMDateTimePicker;
    rgQtdeAssinatura: TRadioGroup;
    grpAssinatura1: TGroupBox;
    rgTipoAssinatura1: TRadioGroup;
    pnl1: TPanel;
    lbl1: TLabel;
    btnProcurar1: TSpeedButton;
    rbInterna1: TRadioButton;
    rbExterna1: TRadioButton;
    edtNome1: TEdit;
    grpAssinatura2: TGroupBox;
    rgTipoAssinatura2: TRadioGroup;
    pnl2: TPanel;
    lbl2: TLabel;
    btnProcurar2: TSpeedButton;
    rbInterna2: TRadioButton;
    rbExterna2: TRadioButton;
    edtNome2: TEdit;
    grpAssinatura3: TGroupBox;
    rgTipoAssinatura3: TRadioGroup;
    pnl3: TPanel;
    lbl3: TLabel;
    btnProcurar3: TSpeedButton;
    rbInterna3: TRadioButton;
    rbExterna3: TRadioButton;
    edtNome3: TEdit;
    grpAssinatura4: TGroupBox;
    rgTipoAssinatura4: TRadioGroup;
    pnl4: TPanel;
    lbl4: TLabel;
    btnProcurar4: TSpeedButton;
    rbInterna4: TRadioButton;
    rbExterna4: TRadioButton;
    edtNome4: TEdit;
    MontaSelectLocalAssinatura1: TMontaSelect;
    lblCargo3: TLabel;
    edtCargo3: TEdit;
    lblCargo4: TLabel;
    edtCargo4: TEdit;
    edtCargo1: TEdit;
    lblCargo1: TLabel;
    edtCargo2: TEdit;
    lblCargo2: TLabel;
    MontaSelectLocalAssinatura2: TMontaSelect;
    MontaSelectLocalAssinatura3: TMontaSelect;
    MontaSelectLocalAssinatura4: TMontaSelect;
    MontaSelectTodosFuncionarios1: TMontaSelect;
    MontaSelectTodosFuncionarios2: TMontaSelect;
    MontaSelectTodosFuncionarios3: TMontaSelect;
    MontaSelectTodosFuncionarios4: TMontaSelect;
    grp2: TGroupBox;
    edtLocal: TEdit;
    procedure rgQtdeAssinaturaClick(Sender: TObject);
    procedure btnProcurar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProcurar2Click(Sender: TObject);
    procedure btnProcurar3Click(Sender: TObject);
    procedure btnProcurar4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure formataRelatorio;
    function  validaCampos() : Boolean;
    procedure PreencherCamposRelatorio;

    procedure rbInterna1Click(Sender: TObject);
    procedure rbInterna2Click(Sender: TObject);
    procedure rbInterna3Click(Sender: TObject);
    procedure rbInterna4Click(Sender: TObject);
    procedure rbExterna1Click(Sender: TObject);
    procedure rbExterna2Click(Sender: TObject);
    procedure rbExterna3Click(Sender: TObject);
    procedure rbExterna4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cdsAssinatura1     : TCMClientDataSet;
    cdsAssinatura2     : TCMClientDataSet;
    cdsAssinatura3     : TCMClientDataSet;
    cdsAssinatura4     : TCMClientDataSet;
    objCtrlAssinatura  : TCtrlASSINATURA;
    sCurso             : String;
    sEntid             : String;
    sInstrutor         : String;
    sIdCurso           : String;
    sIdEntid           : String;
    sIdInstruto        : String;
    sIniPlan           : String;
    sFimPlan           : String;
    sIniReal           : String;
    sFimReal           : String;
    sDataIni           : String;
    sDataFim           : String;
    sPessoasInscritas  : String;
    sIdInstrutor       : String;
    sIdTurma           : String;              // Edilaine - SOL 137268-7062 / KTN 1497173
    Rpt                : TRptCertificado;
    pIsTodos           : Integer;
    ListaCodPessoasNaoInscritas,
    ListaCodPessoasInscritas,
    ListaNumSeqPessoasInscritas: TStringList;
    IdEmpresa                    : Integer;
    IdModulo                     : integer;
    IdUsuario                    : Integer;
    ST1                           : TStream;
    BM1                           : TBitmap;
    ST2                           : TStream;
    BM2                           : TBitmap;
    ST3                           : TStream;
    BM3                          : TBitmap;
    ST4                           : TStream;
    BM4                           : TBitmap;

  end;


  var frmSelecaoAssinatura: TfrmSelecaoAssinatura;


implementation


{$R *.DFM}

procedure TfrmSelecaoAssinatura.rgQtdeAssinaturaClick(Sender: TObject);
begin
  if rgQtdeAssinatura.ItemIndex = 0 then
  begin
    grpAssinatura1.Visible := True;
    grpAssinatura2.Visible := False;
    grpAssinatura3.Visible := False;
    grpAssinatura4.Visible := False;
  end
  else
  if rgQtdeAssinatura.ItemIndex = 1 then
  begin
    grpAssinatura1.Visible := True;
    grpAssinatura2.Visible := True;
    grpAssinatura3.Visible := False;
    grpAssinatura4.Visible := False;
  end
  else
  if rgQtdeAssinatura.ItemIndex = 2 then
  begin
    grpAssinatura1.Visible := True;
    grpAssinatura2.Visible := True;
    grpAssinatura3.Visible := True;
    grpAssinatura4.Visible := False;
  end
  else
  if rgQtdeAssinatura.ItemIndex = 3 then
  begin
    grpAssinatura1.Visible := True;
    grpAssinatura2.Visible := True;
    grpAssinatura3.Visible := True;
    grpAssinatura4.Visible := True;
  end;
end;

procedure TfrmSelecaoAssinatura.btnProcurar1Click(Sender: TObject);
var g:TGraphic;
begin
  inherited;
  if (rgTipoAssinatura1.ItemIndex = 0) then
  begin
    MontaSelectTodosFuncionarios1.Executar;
    if (MontaSelectTodosFuncionarios1.RetornouValor) then
    begin
       edtNome1.Text                := MontaSelectTodosFuncionarios1.ValoresChave[1];
       Rpt.lblAssinatura1.Caption   := MontaSelectTodosFuncionarios1.ValoresChave[1];
       Rpt.lblCargo1.Caption        := MontaSelectTodosFuncionarios1.ValoresChave[2];
    end;
  end
  else
  begin
    MontaSelectLocalAssinatura1.Executar;
    if MontaSelectLocalAssinatura1.RetornouValor then
    begin
       cdsAssinatura1.Data          := objCtrlAssinatura.AssinaturaRelatorio(MontaSelectLocalAssinatura1.ValoresChave[0]);
       edtNome1.Text                := cdsAssinatura1.FieldByName('NOME').AsString;
       Rpt.lblAssinatura1.Caption   := cdsAssinatura1.FieldByName('NOME').AsString;
       Rpt.lblCargo1.Caption        := cdsAssinatura1.FieldByName('CARGO').AsString;

       if (rgTipoAssinatura1.ItemIndex = 1) then
       begin
         ST1 := cdsAssinatura1.CreateBlobStream(cdsAssinatura1.FieldByName('ASSINATURA'), BmRead);
         BM1.LoadFromStream(ST1);
         Rpt.lblImgAssinatura1.Picture.Bitmap := bm1;
       end;
    end;
  end;

end;

procedure TfrmSelecaoAssinatura.FormCreate(Sender: TObject);
begin
  objCtrlAssinatura := TCtrlASSINATURA.Create;
  objCtrlAssinatura.InitializeAs(Padroes);

  cdsAssinatura1 := TCMClientDataSet.Create(nil);
  cdsAssinatura2 := TCMClientDataSet.Create(nil);
  cdsAssinatura3 := TCMClientDataSet.Create(nil);
  cdsAssinatura4 := TCMClientDataSet.Create(nil);

  cdsAssinatura1.Data := objCtrlAssinatura.AssinaturaRelatorio('-1');
  cdsAssinatura2.Data := objCtrlAssinatura.AssinaturaRelatorio('-1');
  cdsAssinatura3.Data := objCtrlAssinatura.AssinaturaRelatorio('-1');
  cdsAssinatura4.Data := objCtrlAssinatura.AssinaturaRelatorio('-1');

  Rpt := TRptCertificado.Create(Application);
  BM1  := TBitmap.Create;
  BM2  := TBitmap.Create;
  BM3  := TBitmap.Create;
  BM4  := TBitmap.Create;

end;

procedure TfrmSelecaoAssinatura.btnProcurar2Click(Sender: TObject);
begin
  inherited;
  if (rgTipoAssinatura2.ItemIndex = 0) then
  begin
    MontaSelectTodosFuncionarios2.Executar;
    if (MontaSelectTodosFuncionarios2.RetornouValor) then
    begin
       edtNome2.Text                := MontaSelectTodosFuncionarios2.ValoresChave[1];
       Rpt.lblAssinatura2.Caption   := MontaSelectTodosFuncionarios2.ValoresChave[1];
       Rpt.lblCargo2.Caption        := MontaSelectTodosFuncionarios2.ValoresChave[2];
    end;
  end
  else
  begin
    if (rbInterna2.Checked) then
    begin
        MontaSelectLocalAssinatura2.Executar;
      if MontaSelectLocalAssinatura2.RetornouValor then
      begin
         cdsAssinatura2.Data          := objCtrlAssinatura.AssinaturaRelatorio(MontaSelectLocalAssinatura2.ValoresChave[0]);
         edtNome2.Text                := cdsAssinatura2.FieldByName('NOME').AsString;
         Rpt.lblAssinatura2.Caption   := cdsAssinatura2.FieldByName('NOME').AsString;
         Rpt.lblCargo2.Caption        := cdsAssinatura2.FieldByName('CARGO').AsString;

         if (rgTipoAssinatura2.ItemIndex = 1) then
         begin
           ST2 := cdsAssinatura2.CreateBlobStream(cdsAssinatura2.FieldByName('ASSINATURA'), BmRead);
           BM2.LoadFromStream(ST2);
           Rpt.lblImgAssinatura2.Picture.Bitmap := bm2;
         end;
      end;
    end
    else if (rbExterna2.Checked) then
    begin
       btnProcurar2.Enabled := False;
       edtNome2.Enabled     := True;
       lblCargo2.Visible    := True;
       edtCargo2.Visible    := True;
    end;
  end;
end;

procedure TfrmSelecaoAssinatura.btnProcurar3Click(Sender: TObject);
begin
  inherited;
  if (rgTipoAssinatura3.ItemIndex = 0) then
  begin
    MontaSelectTodosFuncionarios3.Executar;
    if (MontaSelectTodosFuncionarios3.RetornouValor) then
    begin
       edtNome3.Text                := MontaSelectTodosFuncionarios3.ValoresChave[1];
       Rpt.lblAssinatura3.Caption   := MontaSelectTodosFuncionarios3.ValoresChave[1];
       Rpt.lblCargo3.Caption        := MontaSelectTodosFuncionarios3.ValoresChave[2];
    end;
  end
  else
  begin
    if (rbInterna3.Checked) then
    begin
    MontaSelectLocalAssinatura3.Executar;
    if MontaSelectLocalAssinatura3.RetornouValor then
    begin
       cdsAssinatura3.Data          := objCtrlAssinatura.AssinaturaRelatorio(MontaSelectLocalAssinatura3.ValoresChave[0]);
       edtNome3.Text                := cdsAssinatura3.FieldByName('NOME').AsString;
       Rpt.lblAssinatura3.Caption   := cdsAssinatura3.FieldByName('NOME').AsString;
       Rpt.lblCargo3.Caption        := cdsAssinatura3.FieldByName('CARGO').AsString;

       if (rgTipoAssinatura3.ItemIndex = 1) then
       begin
         ST3 := cdsAssinatura3.CreateBlobStream(cdsAssinatura3.FieldByName('ASSINATURA'), BmRead);
         BM3.LoadFromStream(ST3);
         Rpt.lblImgAssinatura3.Picture.Bitmap := bm3;
       end;
    end;
    end
    else if (rbExterna3.Checked) then
    begin
       btnProcurar3.Enabled := False;
       edtNome3.Enabled     := True;
       lblCargo3.Visible    := True;
       edtCargo3.Visible    := True;
    end;
  end;
end;

procedure TfrmSelecaoAssinatura.btnProcurar4Click(Sender: TObject);
begin
  inherited;
  if (rgTipoAssinatura4.ItemIndex = 0) then
  begin
    MontaSelectTodosFuncionarios4.Executar;
    if (MontaSelectTodosFuncionarios4.RetornouValor) then
    begin
       edtNome4.Text                := MontaSelectTodosFuncionarios4.ValoresChave[1];
       Rpt.lblAssinatura4.Caption   := MontaSelectTodosFuncionarios4.ValoresChave[1];
       Rpt.lblCargo4.Caption        := MontaSelectTodosFuncionarios4.ValoresChave[2];
    end;
  end
  else
  begin
    if (rbInterna4.Checked) then
    begin
      MontaSelectLocalAssinatura4.Executar;
      if MontaSelectLocalAssinatura4.RetornouValor then
      begin
         cdsAssinatura4.Data          := objCtrlAssinatura.AssinaturaRelatorio(MontaSelectLocalAssinatura4.ValoresChave[0]);
         edtNome4.Text                := cdsAssinatura4.FieldByName('NOME').AsString;
         Rpt.lblAssinatura4.Caption   := cdsAssinatura4.FieldByName('NOME').AsString;
         Rpt.lblCargo4.Caption        := cdsAssinatura4.FieldByName('CARGO').AsString;

         if (rgTipoAssinatura4.ItemIndex = 1) then
         begin
           ST4 := cdsAssinatura4.CreateBlobStream(cdsAssinatura4.FieldByName('ASSINATURA'), BmRead);
           BM4.LoadFromStream(ST4);
           Rpt.lblImgAssinatura4.Picture.Bitmap := bm4;
         end;
      end;
    end
    else if (rbExterna4.Checked) then
    begin
       btnProcurar4.Enabled := False;
       edtNome4.Enabled     := True;
       lblCargo4.Visible    := True;
       edtCargo4.Visible    := True;
    end;
  end;
end;

procedure TfrmSelecaoAssinatura.FormShow(Sender: TObject);
begin
  dteAssinatura.SetFocus;
  rbInterna1.Checked := True;
  grpAssinatura1.Visible := True;
end;

procedure TfrmSelecaoAssinatura.bbtnConfirmarClick(Sender: TObject);
begin

  if (validaCampos) then
  begin
      PreencherCamposRelatorio;
      Rpt.sCurso := sCurso;
      Rpt.sEntid := sEntid;
      Rpt.sInstrutor := sInstrutor;
      Rpt.sIdCurso := sIdCurso;
      Rpt.sIdEntid := sIdEntid;
      Rpt.sIdInstrutor := sIdInstrutor;
      Rpt.sIniPlan := sIniPlan;
      Rpt.sFimPlan := sFimPlan;
      Rpt.sIniReal := sIniReal;
      Rpt.sFimReal := sFimReal;
      Rpt.sDataIni := sDataIni;
      Rpt.sDataFim := sDataFim;
      Rpt.sLocal   := Trim(edtLocal.Text);
      rpt.pQtdeAssinatura := rgQtdeAssinatura.ItemIndex;
      Rpt.SdataCalendario := dteAssinatura.Text;
      rpt.sPessoasInscritas := sPessoasInscritas;
      Rpt.sIdTurma := sIdTurma;     // Edilaine - SOL 137268-7062 / KTN 1497173

      Rpt.CrmRptCM.IdReports := 4377;
      Rpt.CrmRptCM.IdEmpresa := IdEmpresa;
      Rpt.CrmRptCM.OrigemCM := 1;
      Rpt.CrmRptCM.IdModulo := IdModulo;
      Rpt.CrmRptCM.IdUsuario := IdUsuario;

      formataRelatorio();

      Rpt.CrmRptCM.Print;
  end;
end;

procedure TfrmSelecaoAssinatura.formataRelatorio;
begin
  if (rgQtdeAssinatura.ItemIndex = 0) then
  begin
    Rpt.lblAssinatura2.Visible := False;
    Rpt.lblImgAssinatura2.Visible := False;
    Rpt.lblCargo2.Visible := False;
    Rpt.LineAssinatura2.Visible := False;

    Rpt.lblAssinatura3.Visible := False;
    Rpt.lblImgAssinatura3.Visible := False;
    Rpt.lblCargo3.Visible := False;
    Rpt.LineAssinatura3.Visible := False;

    Rpt.lblAssinatura4.Visible := False;
    Rpt.lblImgAssinatura4.Visible := False;
    Rpt.lblCargo4.Visible := False;
    Rpt.LineAssinatura4.Visible := False;

    Rpt.lblAssinatura1.Left := 110 * 3.779527559;
    Rpt.lblImgAssinatura1.Left := 110 * 3.779527559;
    Rpt.lblCargo1.Left := 110 * 3.779527559;
    Rpt.LineAssinatura1.Left := 110 * 3.779527559;
    Rpt.lblAssinatura1.Alignment := taCenter;
    Rpt.lblImgAssinatura1.Alignment := taCenter;
    Rpt.lblCargo1.Alignment := taCenter;
  end
  else if (rgQtdeAssinatura.ItemIndex = 1) then
  begin
    Rpt.lblAssinatura3.Visible := False;
    Rpt.lblImgAssinatura3.Visible := False;
    Rpt.lblCargo3.Visible := False;
    Rpt.LineAssinatura3.Visible := False;

    Rpt.lblAssinatura4.Visible := False;
    Rpt.lblImgAssinatura4.Visible := False;
    Rpt.lblCargo4.Visible := False;
    Rpt.LineAssinatura4.Visible := False;

    Rpt.lblAssinatura1.Left := 39 * 3.779527559;
    Rpt.lblImgAssinatura1.Left := 39 * 3.779527559;
    Rpt.lblCargo1.Left := 39 * 3.779527559;
    Rpt.LineAssinatura1.Left := 39 * 3.779527559;
    Rpt.lblAssinatura1.Alignment := taCenter;
    Rpt.lblImgAssinatura1.Alignment := taCenter;
    Rpt.lblCargo1.Alignment := taCenter;

    Rpt.lblAssinatura2.Left := 178 * 3.779527559;
    Rpt.lblImgAssinatura2.Left := 178 * 3.779527559;
    Rpt.lblCargo2.Left := 178 * 3.779527559;
    Rpt.LineAssinatura2.Left := 178 * 3.779527559;
    Rpt.lblAssinatura2.Alignment := taCenter;
    Rpt.lblImgAssinatura2.Alignment := taCenter;
    Rpt.lblCargo2.Alignment := taCenter;
  end
  else if (rgQtdeAssinatura.ItemIndex = 2) then
  begin
    Rpt.lblAssinatura4.Visible := False;
    Rpt.lblImgAssinatura4.Visible := False;
    Rpt.lblCargo4.Visible := False;
    Rpt.LineAssinatura4.Visible := False;

    Rpt.lblAssinatura1.Left := 13 * 3.779527559;
    Rpt.lblImgAssinatura1.Left := 13 * 3.779527559;
    Rpt.lblCargo1.Left := 13 * 3.779527559;
    Rpt.LineAssinatura1.Left := 13 * 3.779527559;
    Rpt.lblAssinatura1.Alignment := taCenter;
    Rpt.lblImgAssinatura1.Alignment := taCenter;
    Rpt.lblCargo1.Alignment := taCenter;

    Rpt.lblAssinatura2.Left := 110 * 3.779527559;
    Rpt.lblImgAssinatura2.Left := 110 * 3.779527559;
    Rpt.lblCargo2.Left := 110 * 3.779527559;
    Rpt.LineAssinatura2.Left := 110 * 3.779527559;
    Rpt.lblAssinatura2.Alignment := taCenter;
    Rpt.lblImgAssinatura2.Alignment := taCenter;
    Rpt.lblCargo2.Alignment := taCenter;

    Rpt.lblAssinatura3.Left := 209 * 3.779527559;
    Rpt.lblImgAssinatura3.Left := 209 * 3.779527559;
    Rpt.lblCargo3.Left := 209 * 3.779527559;
    Rpt.LineAssinatura3.Left := 209 * 3.779527559;
    Rpt.lblAssinatura2.Alignment := taCenter;
    Rpt.lblImgAssinatura2.Alignment := taCenter;
    Rpt.lblCargo2.Alignment := taCenter;

  end;

end;

function TfrmSelecaoAssinatura.validaCampos: Boolean;
var isValidaCampo : Boolean;
begin
 isValidaCampo := True;
if (Trim(dteAssinatura.Text) = EmptyStr) then
 begin
   isValidaCampo := false;
   ShowMessage('Falta preencher a Data Assinatura.');
 end
 else if (Trim(edtLocal.Text) = EmptyStr) then
 begin
   isValidaCampo := false;
   ShowMessage('Falta preencher o Local.');
 end
 else if (Trim(edtNome1.Text) = EmptyStr) then
 begin
   isValidaCampo := false;
   ShowMessage('Falta preencher o Nome.');
 end;

 Result := isValidaCampo;

end;

procedure TfrmSelecaoAssinatura.rbInterna1Click(Sender: TObject);
begin
  inherited;
  if (rbInterna1.Checked) then
  begin
     rbExterna1.Checked := False;
     lblCargo1.Visible := false;
     edtCargo1.Visible := false;
     edtNome1.Enabled  := False;
     btnProcurar1.Enabled := True;
  end;
end;

procedure TfrmSelecaoAssinatura.rbInterna2Click(Sender: TObject);
begin
  inherited;
  if (rbInterna2.Checked) then
  begin
     rbExterna2.Checked := False;
     lblCargo2.Visible := false;
     edtCargo2.Visible := false;
     edtNome2.Enabled  := False;
     btnProcurar2.Enabled := True;
  end;
end;

procedure TfrmSelecaoAssinatura.rbInterna3Click(Sender: TObject);
begin
  inherited;
  if (rbInterna3.Checked) then
  begin
     rbExterna3.Checked := False;
     lblCargo3.Visible := false;
     edtCargo3.Visible := false;
     edtNome3.Enabled  := False;
     btnProcurar3.Enabled := True;
  end;

end;

procedure TfrmSelecaoAssinatura.rbInterna4Click(Sender: TObject);
begin
  inherited;
  if (rbInterna4.Checked) then
  begin
     rbExterna4.Checked := False;
     lblCargo4.Visible := false;
     edtCargo4.Visible := false;
     edtNome4.Enabled  := False;     
     btnProcurar4.Enabled := True;
  end;
end;

procedure TfrmSelecaoAssinatura.rbExterna1Click(Sender: TObject);
begin
  inherited;
  if (rbExterna1.Checked) then
  begin
    rbInterna1.Checked := False;
    btnProcurar1.Enabled := False;
    edtNome1.Enabled     := True;
    lblCargo1.Visible    := True;
    edtCargo1.Visible    := True;
  end;
end;

procedure TfrmSelecaoAssinatura.rbExterna2Click(Sender: TObject);
begin
  inherited;
  if (rbExterna2.Checked) then
  begin
    rbInterna2.Checked := False;
    btnProcurar2.Enabled := False;
    edtNome2.Enabled     := True;
    lblCargo2.Visible    := True;
    edtCargo2.Visible    := True;
  end;
end;

procedure TfrmSelecaoAssinatura.rbExterna3Click(Sender: TObject);
begin
  inherited;
  if (rbExterna3.Checked) then
  begin
    rbInterna3.Checked := False;
    btnProcurar3.Enabled := False;
    edtNome3.Enabled     := True;
    lblCargo3.Visible    := True;
    edtCargo3.Visible    := True;
  end;

end;

procedure TfrmSelecaoAssinatura.rbExterna4Click(Sender: TObject);
begin
  inherited;
  if (rbExterna4.Checked) then
  begin
    rbInterna4.Checked := False;
    btnProcurar4.Enabled := False;
    edtNome4.Enabled     := True;
    lblCargo4.Visible    := True;
    edtCargo4.Visible    := True;
  end;

end;

procedure TfrmSelecaoAssinatura.PreencherCamposRelatorio;
begin
 if (rgQtdeAssinatura.ItemIndex = 0) then
 begin
   if not (btnProcurar1.Enabled) then
   begin
     rpt.lblAssinatura1.Caption := UpperCase(edtNome1.Text);
     rpt.lblCargo1.Caption := UpperCase(edtCargo1.Text);
   end;
 end
 else if (rgQtdeAssinatura.ItemIndex = 1) then
 begin
   if not (btnProcurar1.Enabled) then
   begin
     rpt.lblAssinatura1.Caption := UpperCase(edtNome1.Text);
     rpt.lblCargo1.Caption := UpperCase(edtCargo1.Text);
   end;

   if not (btnProcurar2.Enabled) then
   begin
     rpt.lblAssinatura2.Caption := UpperCase(edtNome2.Text);
     rpt.lblCargo2.Caption := UpperCase(edtCargo2.Text);
   end;
 end
 else if (rgQtdeAssinatura.ItemIndex = 2) then
 begin
  if not (btnProcurar1.Enabled) then
   begin
     rpt.lblAssinatura1.Caption := UpperCase(edtNome1.Text);
     rpt.lblCargo1.Caption := UpperCase(edtCargo1.Text);
   end;

   if not (btnProcurar2.Enabled) then
   begin
     rpt.lblAssinatura2.Caption := UpperCase(edtNome2.Text);
     rpt.lblCargo2.Caption := UpperCase(edtCargo2.Text);
   end;

   if not (btnProcurar3.Enabled) then
   begin
     rpt.lblAssinatura3.Caption := UpperCase(edtNome3.Text);
     rpt.lblCargo3.Caption := UpperCase(edtCargo3.Text);
   end;

 end
 else
 begin
  if not (btnProcurar1.Enabled) then
   begin
     rpt.lblAssinatura1.Caption := UpperCase(edtNome1.Text);
     rpt.lblCargo1.Caption := UpperCase(edtCargo1.Text);
   end;

   if not (btnProcurar2.Enabled) then
   begin
     rpt.lblAssinatura2.Caption := UpperCase(edtNome2.Text);
     rpt.lblCargo2.Caption := UpperCase(edtCargo2.Text);
   end;

   if not (btnProcurar3.Enabled) then
   begin
     rpt.lblAssinatura3.Caption := UpperCase(edtNome3.Text);
     rpt.lblCargo3.Caption := UpperCase(edtCargo3.Text);
   end;

   if not (btnProcurar4.Enabled) then
   begin
     rpt.lblAssinatura4.Caption := UpperCase(edtNome4.Text);
     rpt.lblCargo4.Caption := UpperCase(edtCargo4.Text);
   end;

 end;

end;

end.
