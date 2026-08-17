unit FCadTipObjeto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBTables, Wwtable, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, TB97Tlbr, Wwquery, wwdblook, CmEventosCadastro,
  wwDialog, ImgList;

type
  TfrmCadTipObjeto = class(TfrmCadastroGrid)
    tblTipObjeto: TwwTable;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dbedDescricao: TDBEdit;
    Label3: TLabel;
    dblcGrpObjeto: TwwDBLookupCombo;
    qryGrpObjeto: TwwQuery;
    dbrgRubrica: TDBRadioGroup;
    gbxRubrica: TGroupBox;
    dblcRubrica: TwwDBLookupCombo;
    qryRubrica: TwwQuery;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure tblTipObjetoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dbrgRubricaClick(Sender: TObject);
    procedure dblcRubricaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipObjeto: TfrmCadTipObjeto;

implementation

uses FProcCodDesc, UMensErro;

{$R *.DFM}

procedure TfrmCadTipObjeto.sbtnProcurarClick(Sender: TObject);
begin
  //inherited;
  ProcurarCodDesc(tblTipObjeto,'Procura Tipo de Objeto','CODTIPOOBJETO',
                 'DESCRICAO','TIPOOBJPROCTRAB','N','','','');
  sbtnProcurar.down := false;
end;


procedure TfrmCadTipObjeto.tblTipObjetoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  tblTipObjeto.FieldByName('CLASSEOBJ').Value := '1';
end;

procedure TfrmCadTipObjeto.FormCreate(Sender: TObject);
begin
  inherited;
  tblTipObjeto.Open;
  qryGrpObjeto.Open;
  qryRubrica.Open;
  dbrgRubrica.Visible := not qryRubrica.Eof;
  gbxRubrica.Visible := (dbrgRubrica.ItemIndex = 0);
end;

procedure TfrmCadTipObjeto.dbrgRubricaClick(Sender: TObject);
begin
  inherited;
  gbxRubrica.Visible := (dbrgRubrica.ItemIndex = 0);
end;

procedure TfrmCadTipObjeto.dblcRubricaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (Modified) and (trim(dbedDescricao.Text) <> trim(dblcRubrica.Text))  then
     if MsgDlg('Altera a Descrição do Objeto ?', LerMensagem(4),
                 mtConfirmation, [mbYes, mbNo], 0) = mrYes
     then  dbedDescricao.Text := trim(dblcRubrica.Text);
end;

end.
