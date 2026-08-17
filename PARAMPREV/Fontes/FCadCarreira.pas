unit FCadCarreira;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, CmEventosCadastro, ImgList;

type
  TfrmCadCarreira = class(TfrmCadastroCS)
    lblCodigo: TLabel;
    lblNome: TLabel;
    dbeCodigo: TDBEdit;
    dbeNome: TDBEdit;
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCadCarreira: TfrmCadCarreira;

implementation

uses UAdmPrev, UdataBase, DRelatAdmPrev, UMensErro;

{$R *.DFM}

procedure TfrmCadCarreira.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   dbeCodigo.SetFocus;
end;

procedure TfrmCadCarreira.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
     qry.Close;
     qry.ParamByName('IDCARREIRA').Value := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;
  end;
end;

procedure TfrmCadCarreira.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qry.State = dsInsert then
  begin
    try
      qry.FieldByName('IDCARREIRA').AsInteger := LeUltRegistro(dtmRelatAdmPrev.qryAux,'CARREIRA');
    except
      ShowMessage('Erro na geração do código');
    end;
  end;

  if dbeCodigo.Text = '' then
  begin
    MsgDlg('Código não preenchido','Erro',mtError,[mbOk,mbHelp],0);
    dbeCodigo.SetFocus;
    Abort;
  end;

  if dbeNome.Text = '' then
  begin
    MsgDlg('Nome não preenchido','Erro',mtError,[mbOk,mbHelp],0);
    dbeNome.SetFocus;
    Abort;
  end;

end;

procedure TfrmCadCarreira.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDCARREIRA').Value := 0;
  qry.Open;

end;

procedure TfrmCadCarreira.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   dbeCodigo.SetFocus;
end;

end.
