unit FAssocPlanPatro;

//Definição Propprodutor

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, StdCtrls, Buttons, MAHlpBtn, ExtCtrls, DBCtrls, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, DBGrids, Wwdbigrd, Wwdbgrid, Menus, FSairAjuda,
  TB97, TB97Tlbr, wwdblook;

type
  TfrmAssocPlanPatro = class(TfrmSairAjuda)
    dsPlanPatro: TwwDataSource;
    qryDicionario: TwwQuery;
    Panel5: TPanel;
    nome2: TLabel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    nome1: TLabel;
    Descricao: TwwDBGrid;
    EscolheCampos: TListBox;
    campo: TListBox;
    LkcTabelas: TwwDBLookupCombo;
    Label1: TLabel;
    DsSelecionaTabela: TwwDataSource;
    QrySelecionaTabela: TwwQuery;
    QrySelecionaTabelaDESCRICAO: TStringField;
    QrySelecionaTabelaIDTABELA: TFloatField;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    total: TBitBtn;
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure dblkplistPlanoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dblkplistPlanoDragDrop(Sender, Source: TObject; X,Y: Integer);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure DescricaoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormActivate(Sender: TObject);
    procedure dbgrdPlanPatroMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LkcTabelasChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure totalClick(Sender: TObject);
  private
    sTpPlano : string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAssocPlanPatro: TfrmAssocPlanPatro;

implementation

uses
    UMensErro;

{$R *.DFM}

procedure TfrmAssocPlanPatro.sbtnDesassociaClick(Sender: TObject);
var
achou : boolean;
i : integer;
begin
  inherited;
  achou := false;
  for i := 0 to (EscolheCampos.Items.Count - 1) do
   if EscolheCampos.Items.strings[i] = qryDicionario['descricao'] then begin
    MsgDlg('Esta informação já foi escolhida','Atenção',mtError,[mbOk],0);
    achou := true;
    break;
  end;
  if not(achou) then begin
   EscolheCampos.Items.add(qryDicionario['descricao']);
   Campo.Items.add(qryDicionario['idcampo']);
  end;

end;

procedure TfrmAssocPlanPatro.sbtnAssociaClick(Sender: TObject);
var
 i : integer;
begin
  inherited;
  i := EscolheCampos.ItemIndex;
  EscolheCampos.items.delete(EscolheCampos.ItemIndex);
  Campo.items.delete(i);
end;

procedure TfrmAssocPlanPatro.sbtnDesassociaTodosClick(Sender: TObject);
var
i,j: integer;
achou : boolean;
begin
 inherited;
 j := EscolheCampos.Items.Count - 1;
 qryDicionario.first;
 while not(qryDicionario.eof) do begin
  achou := false;
  for i := 0 to j do
   if EscolheCampos.Items.strings[i] = qryDicionario['descricao'] then begin
    achou := true;
    break;
   end;
  if not(achou) then begin
   EscolheCampos.Items.add(qryDicionario['descricao']);
   Campo.Items.add(qryDicionario['idcampo']);
  end;
  qryDicionario.next;
 end;
end;

procedure TfrmAssocPlanPatro.sbtnAssociaTodosClick(Sender: TObject);
var
  sSql : String;
begin
  inherited;
  EscolheCampos.clear;
  Campo.clear;
end;

procedure TfrmAssocPlanPatro.DescricaoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  AFont.Color := clWindowText;
  ABrush.Color := clWindow;

end;

procedure TfrmAssocPlanPatro.FormActivate(Sender: TObject);
begin
  inherited;
end;

{ ***************************************************************** }
{ Métodos para implementar o Drag da Lista de Planos nao associados }
{ ***************************************************************** }
procedure TfrmAssocPlanPatro.dblkplistPlanoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TDBLookUpListBox
  then TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmAssocPlanPatro.dblkplistPlanoDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  { Este método é executado quando o usuario clica na lista de
    Planos JA associados (dblkplistPlano), arrasta um plano e
    solta o mouse. Ao soltar o mouse, se o método DragOver deste
    objeto retornar o Accept = True, este método é executado. }

  TwwDbGrid(Sender).EndDrag(True);
  sbtnDesassociaClick(Sender);
end;

{ ***************************************************************** }
{ Métodos para implementar o Drag da Lista de Planos JA associados }
{ ***************************************************************** }

procedure TfrmAssocPlanPatro.dbgrdPlanPatroMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft
  then if Sender is TwwDBGrid
       then TwwDBGrid(Sender).BeginDrag(True);
end;

procedure TfrmAssocPlanPatro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryDicionario.close;
  qrySelecionaTabela.close;
end;

procedure TfrmAssocPlanPatro.LkcTabelasChange(Sender: TObject);
var
i:integer;
anterior : string;
begin
  inherited;
  EscolheCampos.clear;
  Campo.clear;
  if lkctabelas.value <> '' then begin
     descricao.visible := true;
     anterior := lkctabelas.value;
     total.visible := true;
  end;
end;

procedure TfrmAssocPlanPatro.FormShow(Sender: TObject);
begin
  inherited;
   qrySelecionaTabela.open;
   qrydicionario.open;
   if lkctabelas.value = '' then
     descricao.visible := false;
   total.visible := false;
     
  
end;

procedure TfrmAssocPlanPatro.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
end;

procedure TfrmAssocPlanPatro.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  EscolheCampos.clear;
  Campo.clear;
end;

procedure TfrmAssocPlanPatro.totalClick(Sender: TObject);
begin
  inherited;
  showmessage('Total de campos selecionados : '+inttostr(escolhecampos.items.count));
end;

end.
