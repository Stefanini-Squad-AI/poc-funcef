//******************************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 08/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
//******************************************************************************************

unit fCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT, 
  wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, ImgList,
  CmEventosCadastro, DBClient, uCMClientDataSet, uCtrlParamRH;

type
  TfrmCadParam = class(TFrmCadastroMT)
    gbxFaixasSal: TGroupBox;
    Bevel1: TBevel;
    labTit1: TLabel;
    labTit2: TLabel;
    labTit3: TLabel;
    labTit4: TLabel;
    labTit5: TLabel;
    labTit6: TLabel;
    labTit7: TLabel;
    labTit8: TLabel;
    labTit9: TLabel;
    dbedSt1: TDBEdit;
    dbedSt2: TDBEdit;
    dbedSt3: TDBEdit;
    dbedSt4: TDBEdit;
    dbedSt5: TDBEdit;
    dbedSt6: TDBEdit;
    dbedSt7: TDBEdit;
    dbedSt8: TDBEdit;
    dbedSt9: TDBEdit;
    dbspeQtdSt: TwwDBSpinEdit;
    labStep: TLabel;
    gbxPoliticaSal: TGroupBox;
    dbrgIndPolitica: TDBRadioGroup;
    gbxDoisCargos: TDBRadioGroup;
    dbrgNivelIndiv: TDBRadioGroup;
    dbedSt10: TDBEdit;
    labTit10: TLabel;
    bvFx2: TBevel;
    labTit11: TLabel;
    labTit12: TLabel;
    labTit13: TLabel;
    labTit14: TLabel;
    labTit15: TLabel;
    labTit16: TLabel;
    labTit17: TLabel;
    labTit18: TLabel;
    labTit19: TLabel;
    dbedSt11: TDBEdit;
    dbedSt12: TDBEdit;
    dbedSt13: TDBEdit;
    dbedSt14: TDBEdit;
    dbedSt15: TDBEdit;
    dbedSt16: TDBEdit;
    dbedSt17: TDBEdit;
    dbedSt18: TDBEdit;
    dbedSt19: TDBEdit;
    dbedSt20: TDBEdit;
    labTit20: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dbspeQtdStChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure dbrgIndPoliticaChange(Sender: TObject);
  private
    CtrlParamRH: TCtrlParamRH;
    
    procedure Sel;
    function  GravarRegistro: boolean;

    // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    procedure ConfiguraTela;
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
  end;

var
  frmCadParam: TfrmCadParam;

implementation

uses uCtrlPadroes;

{$R *.DFM}

procedure TfrmCadParam.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlParamRH := TCtrlParamRH.Create;
  CtrlParamRH.InitializeAs(Padroes);
  CtrlParamRH.CdsParamRH := Cds;

  Sel;
  if (Cds.IsEmpty) then
  begin
    CtrlParamRH.ExecInsert;
    CtrlParamRH.GravarParamRH;
    Sel;
  end;

  ConfiguraTela();  // Edilaine Ferraresi - SOL 171426 / KTN 1537613
end;

procedure TfrmCadParam.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := not(Cds.IsEmpty);
end;

procedure TfrmCadParam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlParamRH);
  inherited;
end;

procedure TfrmCadParam.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadParam.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
  Sel;
end;

procedure TfrmCadParam.dbspeQtdStChange(Sender: TObject);
var
   iInd : integer;
begin
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - comentado
  {
  Label1.Visible  := (dbspeQtdSt.Value >= 1);
  dbedSt1.Visible := (dbspeQtdSt.Value >= 1);
  Label2.Visible  := (dbspeQtdSt.Value >= 2);
  dbedSt2.Visible := (dbspeQtdSt.Value >= 2);
  Label3.Visible  := (dbspeQtdSt.Value >= 3);
  dbedSt3.Visible := (dbspeQtdSt.Value >= 3);
  Label4.Visible  := (dbspeQtdSt.Value >= 4);
  dbedSt4.Visible := (dbspeQtdSt.Value >= 4);
  Label5.Visible  := (dbspeQtdSt.Value >= 5);
  dbedSt5.Visible := (dbspeQtdSt.Value >= 5);
  Label6.Visible  := (dbspeQtdSt.Value >= 6);
  dbedSt6.Visible := (dbspeQtdSt.Value >= 6);
  Label7.Visible  := (dbspeQtdSt.Value >= 7);
  dbedSt7.Visible := (dbspeQtdSt.Value >= 7);
  Label8.Visible  := (dbspeQtdSt.Value >= 8);
  dbedSt8.Visible := (dbspeQtdSt.Value >= 8);
  Label9.Visible  := (dbspeQtdSt.Value >= 9);
  dbedSt9.Visible := (dbspeQtdSt.Value >= 9);
  }

  // se inserir nova faixa, colocar na TAG do label e edit o no. correspondente a faixa
  // para que o 'for' abaixo possa ter efeito sobre o item novo
  for iInd := 0 to Self.ComponentCount-1 do
  begin
    if (Self.Components[iInd] is TLabel) then
       TLabel(Self.Components[iInd]).Visible := (TLabel(Self.Components[iInd]).Tag <= dbspeQtdSt.Value);

    if (Self.Components[iInd] is TDBEdit) then
       TDBEdit(Self.Components[iInd]).Visible := (TDBEdit(Self.Components[iInd]).Tag <= dbspeQtdSt.Value);
  end;

  ConfiguraTela();
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
end;

procedure TfrmCadParam.dbrgIndPoliticaChange(Sender: TObject);
begin
  inherited;
  dbrgNivelIndiv.Visible := (dbrgIndPolitica.ItemIndex <> 1);
  gbxFaixasSal.Visible := (dbrgIndPolitica.ItemIndex <> 1);
  gbxDoisCargos.Visible := (dbrgIndPolitica.ItemIndex <> 1);
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadParam.Sel;
begin
  Cds.Data := CtrlParamRH.ListParamRH;
end;

function TfrmCadParam.GravarRegistro: boolean;
begin
  Result := CtrlParamRH.GravarParamRH;
  if not(Result) then
    raise Exception.Create(CtrlParamRH.MessageInfo);
end;


procedure TfrmCadParam.ConfiguraTela;
   procedure Centraliza(var ALeft : integer; var  ATop : integer; AWidth, AHeight: Integer);
   var
     Rect: TRect;
     OurWidth: Integer;
     OurHeight: Integer;
   begin
     // Obtem o retângulo da área cliente MDI
     Windows.GetWindowRect(Application.MainForm.ClientHandle, Rect);

     // Calcular largura e altura da área cliente
     OurWidth := Rect.Right - Rect.Left;
     OurHeight := Rect.Bottom - Rect.Top;

     // Calcula a nova posição
     ALeft := (OurWidth - Width) div 2;
     ATop := (OurHeight - Height) div 2;

//    inherited SetBounds(ALeft, ATop, AWidth, AHeight);
   end;
var
  ALeft, ATop : integer;
begin
  if (dbspeQtdSt.Value >= 11) and (not bvFx2.visible) then
  begin
    labStep.left    := 188;
    dbspeQtdSt.left := 188;
    gbxFaixasSal.width := 467;
    Self.Width  := 770;

    bvFx2.visible := true;
    repaint;
  end
  else if (dbspeQtdSt.Value <= 10) and (bvFx2.visible) then
  begin
    labStep.left    := 80;
    dbspeQtdSt.left := 80;
    gbxFaixasSal.width := 243;
    Self.Width  := 545;

    bvFx2.visible := false;
    repaint;
  end;

  Centraliza(aLeft, aTop, self.width, self.Height);
  Self.Top  := aTop;
  Self.Left := aLeft;
end;

end.
