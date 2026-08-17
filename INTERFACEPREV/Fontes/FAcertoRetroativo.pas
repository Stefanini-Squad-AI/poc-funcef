{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  26/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
unit FAcertoRetroativo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Grids, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Menus, ComCtrls, Db, DBTables, Wwquery;

type
  TfrmAcertoRetroativo = class(TfrmOkCancelar)
    popupmenuop: TPopupMenu;
    CalcularContribuio1: TMenuItem;
    N1: TMenuItem;
    C1: TMenuItem;
    PageControl1: TPageControl;
    tbgrid: TTabSheet;
    tbtresult: TTabSheet;
    stgridacerto: TStringGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    memdemo: TMemo;
    SaveDlg: TSaveDialog;
    RichEdAdaptacao: TRichEdit;
    qryaux: TwwQuery;
    procedure bbtnSairClick(Sender: TObject);
    procedure stgridacertoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure stgridacertoSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure C1Click(Sender: TObject);
    procedure CalcularContribuio1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     bSel : Boolean;  
    { Private declarations }
  public
    bAcertoContrib : Boolean;
    { Public declarations }
  end;

var
  frmAcertoRetroativo: TfrmAcertoRetroativo;


implementation

uses URetro, umenserro;

{$R *.DFM}

procedure TfrmAcertoRetroativo.bbtnSairClick(Sender: TObject);
begin
//  inherited;
  close;
end;

procedure TfrmAcertoRetroativo.stgridacertoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (ssShift in Shift) and (Key = 40) then
  begin
     bSel := true;
  end
  else bSel := false;

end;

procedure TfrmAcertoRetroativo.stgridacertoSelectCell(Sender: TObject; Col,
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

procedure TfrmAcertoRetroativo.C1Click(Sender: TObject);
begin
  inherited;
  memdemo.lines.clear;
  if bAcertoContrib then
  begin
     if not CalculaContribAcerto(qryaux,uretro.varfields,memdemo.Lines)
     then
     begin
        MsgDlg('Ocorreram erros no cálculo da contribuição.','Atenção',mtWarning,[mbOK],0);
        tbtresult.TabVisible := true ;
        PageControl1.ActivePage:= tbtresult ;
     end
     else
     begin
        tbtresult.TabVisible := false ;
        PageControl1.ActivePage:= tbgrid ;
     end;
  end
  else
  begin
     if not CalculaBenefAcerto(qryaux,uretro.varfields,memdemo.Lines)
     then
     begin
        MsgDlg('Ocorreram erros no cálculo do Benefício.','Atenção',mtWarning,[mbOK],0);
        tbtresult.TabVisible := true ;
        PageControl1.ActivePage:= tbtresult ;
     end
     else
     begin
        tbtresult.TabVisible := false ;
        PageControl1.ActivePage:= tbgrid ;
     end;
  end;
end;

procedure TfrmAcertoRetroativo.CalcularContribuio1Click(Sender: TObject);
var i : Integer;
    berro : boolean;
begin
  inherited;
  berro := false;
  memdemo.lines.clear;
  for i := 1 to stgridacerto.rowcount - 1 do
  begin
     stgridacerto.row := i;

     if bAcertoContrib then
     begin
        if not CalculaContribAcerto(qryaux,uretro.varfields,memdemo.Lines)
        then berro := true;
     end
     else
     begin
        if not CalculaBenefAcerto(qryaux,uretro.varfields,memdemo.Lines)
        then berro := true;
     end;
  end;

  if berro then
  begin
     if  bAcertoContrib then
     MsgDlg('Ocorreram erros no cálculo das contribuições.','Atenção',mtWarning,[mbOK],0)
     else MsgDlg('Ocorreram erros no cálculo dos Benefícios.','Atenção',mtWarning,[mbOK],0);
     tbtresult.TabVisible := true ;
     PageControl1.ActivePage:= tbtresult ;
  end
  else
  begin
     tbtresult.TabVisible := false ;
     PageControl1.ActivePage:= tbgrid ;
  end;

end;

procedure TfrmAcertoRetroativo.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if savedlg.Execute then
     memdemo.Lines.SaveToFile(savedlg.filename);
end;

procedure TfrmAcertoRetroativo.BitBtn2Click(Sender: TObject);
begin
  inherited;
  RichEdAdaptacao.Lines.Text := memdemo.Lines.Text;
  RichEdAdaptacao.Print('');
end;

procedure TfrmAcertoRetroativo.bbtnConfirmarClick(Sender: TObject);
begin
  if bAcertoContrib then
    InsereContribAcerto(varfields, memdemo.Lines)
  else
    InsereBenefAcerto(varfields, memdemo.Lines);
  inherited;
end;

procedure TfrmAcertoRetroativo.FormShow(Sender: TObject);
begin
  inherited;
  if bAcertoContrib then
  begin
     frmAcertoRetroativo.caption := 'Acerto de Contribuições';
     tbgrid.caption := 'Contribuições não encontradas no Histórico';
     CalcularContribuio1.Caption := 'Calcular todas as Contribuições';
     C1.Caption := 'Calcular Contribuição Marcada';
  end
  else
  begin
     frmAcertoRetroativo.caption := 'Acerto de Benefícios';
     tbgrid.caption := 'Benefícios não encontrados no Histórico';
     CalcularContribuio1.Caption := 'Calcular todos os Benefícios';
     C1.Caption := 'Calcular Benefício Marcado';          
  end;
end;

procedure TfrmAcertoRetroativo.FormCreate(Sender: TObject);
begin
  inherited;
   //Henrique Massão
   SaveDlg.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;

end.
