unit FCadTipoFunc;



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, CmEventosCadastro, ImgList;

type
  TfrmCadTipoFunc = class(TfrmCadastroCS)
    lblDescricao: TLabel;
    dbeDescricao: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTipoFunc: TfrmCadTipoFunc;

implementation

uses UAdmPrev, UdataBase, DRelatAdmPrev, UMensErro;

{$R *.DFM}

procedure TfrmCadTipoFunc.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDTIPOFUNC').AsInteger := 0;
  qry.Open;
end;

procedure TfrmCadTipoFunc.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('IDTIPOFUNC').AsInteger := LeUltRegistro(nil,'TIPOFUNC');

  if dbeDescricao.Text = '' then
  begin
    MsgDlg('Descrição não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    dbeDescricao.SetFocus;
    Abort;
  end;

end;

procedure TfrmCadTipoFunc.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   dbeDescricao.SetFocus;
end;

procedure TfrmCadTipoFunc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     qry.Close;
     qry.ParamByName('IDTIPOFUNC').Value := StrToInt(MontaSelect.ValoresChave[0]);
     qry.Open;
  end;
end;

procedure TfrmCadTipoFunc.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   dbeDescricao.SetFocus;
end;

end.
