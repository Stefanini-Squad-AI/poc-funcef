{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  26/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}

unit FAcertoSalario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Grids, Menus, Db, DBTables, Wwquery;

type
  TfrmAcertoSalario = class(TfrmOkCancelar)
    PageControl1: TPageControl;
    tbgrid: TTabSheet;
    stgridacerto: TStringGrid;
    tbtresult: TTabSheet;
    RichEdAdaptacao: TRichEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    memdemo: TMemo;
    qryaux: TwwQuery;
    popupmenuop: TPopupMenu;
    CalcularContribuio1: TMenuItem;
    N1: TMenuItem;
    C1: TMenuItem;
    SaveDlg: TSaveDialog;
    procedure bbtnSairClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure stgridacertoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure stgridacertoSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure C1Click(Sender: TObject);
    procedure CalcularContribuio1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     bSel : Boolean;  
    { Private declarations }
  public

    { Public declarations }
  end;

var
  berroacerto : boolean;
  frmAcertoSalario: TfrmAcertoSalario;

implementation

uses URetro, UmensErro;

{$R *.DFM}

procedure TfrmAcertoSalario.bbtnSairClick(Sender: TObject);
begin
//  inherited;
   close;
end;

procedure TfrmAcertoSalario.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
     memdemo.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmAcertoSalario.BitBtn2Click(Sender: TObject);
begin
  inherited;
  RichEdAdaptacao.Lines.Text := memdemo.Lines.Text;
  RichEdAdaptacao.Print('');
end;

procedure TfrmAcertoSalario.stgridacertoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (ssShift in Shift) and (Key = 40) then
  begin
     bSel := true;
  end
  else bSel := false;
end;

procedure TfrmAcertoSalario.stgridacertoSelectCell(Sender: TObject; Col,
  Row: Integer; var CanSelect: Boolean);
begin
  inherited;
  if stgridacerto.row = 0 then
  stgridacerto.PopupMenu := nil
  else   stgridacerto.PopupMenu := popupmenuop;


  if (bSel)  then
  begin
     try
        if row-1 = 0 then exit;
        stgridacerto.Cells[col,row] :=  stgridacerto.Cells[col,row-1];
     except end;
  end;
end;

procedure TfrmAcertoSalario.C1Click(Sender: TObject);
begin
  inherited;
  memdemo.lines.clear;

  if not CalculaSalarioAcerto(qryaux,uretro.varfieldssal,memdemo.Lines)
  then
  begin
     MsgDlg('Ocorreram erros no cálculo do Salário.','Atenção',mtWarning,[mbOK],0);
     tbtresult.TabVisible := true ;
     PageControl1.ActivePage:= tbtresult ;
  end
  else
  begin
     tbtresult.TabVisible := false ;
     PageControl1.ActivePage:= tbgrid ;
  end;
end;

procedure TfrmAcertoSalario.CalcularContribuio1Click(Sender: TObject);
var i : Integer;
    berro : boolean;
begin
  inherited;
  berro := false;
  memdemo.lines.clear;
  for i := 1 to stgridacerto.rowcount - 1 do
  begin
     stgridacerto.row := i;

     if not CalculaSalarioAcerto(qryaux,uretro.varfieldssal,memdemo.Lines)
     then berro := true;
  end;

  if berro then
  begin
     MsgDlg('Ocorreram erros no cálculo dos Salários.','Atenção',mtWarning,[mbOK],0);
     tbtresult.TabVisible := true ;
     PageControl1.ActivePage:= tbtresult ;
  end
  else
  begin
     tbtresult.TabVisible := false ;
     PageControl1.ActivePage:= tbgrid ;
  end;

end;

procedure TfrmAcertoSalario.bbtnConfirmarClick(Sender: TObject);
var i : Integer;
begin

  for  i := 1 to frmacertoSalario.stgridacerto.RowCount-1  do
  begin
     if trim(frmacertoSalario.stgridacerto.Cells[2,i]) = '' then
     begin
        MsgDlg('Todos os Salários devem ser preenchidos.','Atenção',mtWarning,[mbOK],0);
        exit;
     end;
  end;

  if not InsereSalarioAcerto(qryaux, varfieldssal,memdemo.Lines)
  then berroacerto := true
  else berroacerto := false;

  close;
  inherited;
end;

procedure TfrmAcertoSalario.FormCreate(Sender: TObject);
begin
  inherited;
   //Henrique Massão
   SaveDlg.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

end.
