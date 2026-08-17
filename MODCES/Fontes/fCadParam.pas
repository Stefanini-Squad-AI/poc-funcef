//******************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 10/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
// *****************************************************************************

unit fCadParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroCS,
  wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  CmEventosCadastro, ImgList;

type
  TfrmCadParam = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label21: TLabel;
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
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dbedSt11: TDBEdit;
    dbedSt12: TDBEdit;
    dbedSt13: TDBEdit;
    dbedSt14: TDBEdit;
    dbedSt15: TDBEdit;
    dbedSt16: TDBEdit;
    dbedSt17: TDBEdit;
    dbedSt18: TDBEdit;
    dbedSt19: TDBEdit;
    Label10: TLabel;
    dbedSt10: TDBEdit;
    Label20: TLabel;
    dbedSt20: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure dbspeQtdStChange(Sender: TObject);
    procedure FormShow(Sender: TObject);

    private
      procedure ConfiguraTela; // Edilaine Ferraresi - SOL 171426 / KTN 1537613

  end;

var
  frmCadParam: TfrmCadParam;

implementation

{$R *.DFM}

procedure TfrmCadParam.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Open;
  if (qry.IsEmpty) then
  begin
    qry.Insert;
    qry.Post;
  end;

  if (qry.FieldByName('NUMSTEPS').IsNull) then
  begin
    qry.Edit;
    qry.FieldByName('NUMSTEPS').asInteger := 20 {9};  // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    qry.FieldByName('TITSTEP1').asString := 'Step 1';
    qry.FieldByName('TITSTEP2').asString := 'Step 2';
    qry.FieldByName('TITSTEP3').asString := 'Step 3';
    qry.FieldByName('TITSTEP4').asString := 'Step 4';
    qry.FieldByName('TITSTEP5').asString := 'Step 5';
    qry.FieldByName('TITSTEP6').asString := 'Step 6';
    qry.FieldByName('TITSTEP7').asString := 'Step 7';
    qry.FieldByName('TITSTEP8').asString := 'Step 8';
    qry.FieldByName('TITSTEP9').asString := 'Step 9';
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    qry.FieldByName('TITSTEP10').asString := 'Step 10';
    qry.FieldByName('TITSTEP11').asString := 'Step 11';
    qry.FieldByName('TITSTEP12').asString := 'Step 12';
    qry.FieldByName('TITSTEP13').asString := 'Step 13';
    qry.FieldByName('TITSTEP14').asString := 'Step 14';
    qry.FieldByName('TITSTEP15').asString := 'Step 15';
    qry.FieldByName('TITSTEP16').asString := 'Step 16';
    qry.FieldByName('TITSTEP17').asString := 'Step 17';
    qry.FieldByName('TITSTEP18').asString := 'Step 18';
    qry.FieldByName('TITSTEP19').asString := 'Step 19';
    qry.FieldByName('TITSTEP20').asString := 'Step 20';
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
    qry.Post;
  end;
  qry.ApplyUpdates;
end;

procedure TfrmCadParam.FormShow(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := not(qry.IsEmpty);
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
   end;
var
  ALeft, ATop : integer;
begin
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613
  if dbspeQtdSt.Value <= 10 then
     Self.width := 400
  else
     Self.width := 615;

  repaint;

  Centraliza(aLeft, aTop, self.width, self.Height);
  Self.Top  := aTop;
  Self.Left := aLeft;
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
end;



procedure TfrmCadParam.dbspeQtdStChange(Sender: TObject);
begin
  inherited;
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
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613
  Label10.Visible  := (dbspeQtdSt.Value >= 10);
  dbedSt10.Visible := (dbspeQtdSt.Value >= 10);
  Label11.Visible  := (dbspeQtdSt.Value >= 11);
  dbedSt11.Visible := (dbspeQtdSt.Value >= 11);
  Label12.Visible  := (dbspeQtdSt.Value >= 12);
  dbedSt12.Visible := (dbspeQtdSt.Value >= 12);
  Label13.Visible  := (dbspeQtdSt.Value >= 13);
  dbedSt13.Visible := (dbspeQtdSt.Value >= 13);
  Label14.Visible  := (dbspeQtdSt.Value >= 14);
  dbedSt14.Visible := (dbspeQtdSt.Value >= 14);
  Label15.Visible  := (dbspeQtdSt.Value >= 15);
  dbedSt15.Visible := (dbspeQtdSt.Value >= 15);
  Label16.Visible  := (dbspeQtdSt.Value >= 16);
  dbedSt16.Visible := (dbspeQtdSt.Value >= 16);
  Label17.Visible  := (dbspeQtdSt.Value >= 17);
  dbedSt17.Visible := (dbspeQtdSt.Value >= 17);
  Label18.Visible  := (dbspeQtdSt.Value >= 18);
  dbedSt18.Visible := (dbspeQtdSt.Value >= 18);
  Label19.Visible  := (dbspeQtdSt.Value >= 19);
  dbedSt19.Visible := (dbspeQtdSt.Value >= 19);
  Label20.Visible  := (dbspeQtdSt.Value >= 20);
  dbedSt02.Visible := (dbspeQtdSt.Value >= 20);

  ConfiguraTela();
  // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
end;

end.
