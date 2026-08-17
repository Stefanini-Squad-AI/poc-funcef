unit FCadMotivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, Mask, wwdbedit, cmseldlg, wwidlg, Db, Wwdatsrc,
  DBCtrls, MAHlpBtn, Buttons, ComCtrls, ToolWin, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery, TB97, TB97Ctls, TB97Tlbr,
  CmEventosCadastro, wwDialog, ImgList, IvDictio, IvMulti, IvEMulti,
  FCadastroGrid, MontaSelect;

type
  Tfrmcadmotivo = class(TfrmCadastroGridCS)
    lblmotivo: TLabel;
    dbedDesc: TwwDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadmotivo: Tfrmcadmotivo;

implementation

uses UDataBase, UMensErro;

{$R *.DFM}

procedure Tfrmcadmotivo.FormActivate(Sender: TObject);
begin
  inherited;
  if not qry.Active
  then begin
     qry.Close;
     qry.Open;
  end;
end;

procedure Tfrmcadmotivo.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedDesc.SetFocus;
end;

procedure Tfrmcadmotivo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedDesc.SetFocus;
end;

procedure Tfrmcadmotivo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if not MontaSelect.RetornouValor then Exit;

  qry.Locate('IDMOTIVO',StrToInt(MontaSelect.ValoresChave[0]),[loCaseInsensitive]);
end;

procedure Tfrmcadmotivo.qryBeforePost(DataSet: TDataSet);
begin
  inherited;

  // Verificar campos obrigatorios
  if Trim(dbedDesc.Text) = ''
  then begin
     MsgDlg('Preencha a Descrição do Motivo.','Empréstimo',mtError,[mbOK],0);
     Abort;
  end;

  if qry.State = dsInsert
  then begin
     qry.FieldByName('IdMotivo').AsInteger := LeUltRegistro(nil,'MOTIVO');
//     qry.FieldByName('FLGTIPO').AsString   := 'P';
  end;
end;


end.
