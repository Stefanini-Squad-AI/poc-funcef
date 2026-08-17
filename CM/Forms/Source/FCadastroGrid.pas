unit FCadastroGrid;

interface
             
uses              
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, Grids, Wwdbigrd, Wwdbgrid, DB, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ExtCtrls, cmseldlg, wwidlg, DBTables, wwQuery, DBGrids,
  ToolWin, ComCtrls, TB97, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwDialog, CmDock, ActnList, ImgList, CmEventosCadastro{$IFNDEF VER0505}, uCMTypes,
  Gauges, fcLabel {$ENDIF};

type
  TfrmCadastroGrid = class(TfrmCadastro)
    pnlControles: TPanel;
    dbGrd: TwwDBGrid;
    procedure dbGrdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
	 procedure sbtnInserirClick(Sender: TObject);
	 procedure sbtnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroGrid: TfrmCadastroGrid;

implementation

{$R *.DFM}

procedure TfrmCadastroGrid.dbgrdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
     VK_DELETE: begin
        if CmeCadastro.Operacao = opIdle then
        begin
           sbtnApagar.Click;
           Key := 0;
        end;
     end;
     else
        inherited;
   end; { case }
end;

procedure TfrmCadastroGrid.sbtnInserirClick(Sender: TObject);
begin
   pnlControles.Visible := True;
   dbGrd.Visible        := False;
   inherited;
end;

procedure TfrmCadastroGrid.sbtnAlterarClick(Sender: TObject);
begin
   pnlControles.Visible := True;
   dbGrd.Visible        := False;
   inherited;
end;

procedure TfrmCadastroGrid.FormCreate(Sender: TObject);
begin
   inherited;
   dbGrd.Visible        := True;
   pnlControles.Visible := False;
end;

procedure TfrmCadastroGrid.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  pnlControles.Visible := False;
  dbGrd.Visible        := True;
  dbGrd.SetFocus;
end;

procedure TfrmCadastroGrid.CmeCadastroConfirma(Sender: TObject);
Var
  OldOperacao :TOperacao;
begin
  OldOperacao := CmeCadastro.Operacao;

  inherited;

  If OldOperacao <> OpInserir Then
  Begin
     pnlControles.Visible := False;
     dbGrd.Visible        := True;
     dbGrd.SetFocus;
  End;

end;

end.
