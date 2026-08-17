unit FCadSitDependente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, Db, DBTables, Wwquery, Mask, wwdbedit, cmseldlg,
  wwidlg, Wwdatsrc, TB97, MAHlpBtn, DBCtrls, Buttons, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, TB97Ctls, TB97Tlbr, CmEventosCadastro, wwDialog,
  ImgList, IvDictio, IvMulti, IvEMulti, FCadastroGrid, MontaSelect;

type
  TfrmCadSitDependente = class(TfrmCadastroGridCS)
    dbedCodigo: TwwDBEdit;
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadSitDependente: TfrmCadSitDependente;

implementation

uses UDataBase, UMensErro, usistema;

{$R *.DFM}

procedure TfrmCadSitDependente.FormActivate(Sender: TObject);
begin
  inherited;
  if not qry.Active
  then begin
     qry.Close;
     qry.Open;
  end;

end;

procedure TfrmCadSitDependente.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedCodigo.SetFocus;
end;

procedure TfrmCadSitDependente.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedCodigo.SetFocus;
end;

procedure TfrmCadSitDependente.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if not MontaSelect.RetornouValor then Exit;

  qry.Locate('IDSITDEPENDENTE',MontaSelect.ValoresChave[0],[loCaseInsensitive]);

end;

procedure TfrmCadSitDependente.qryBeforePost(DataSet: TDataSet);
begin
  inherited;

  if Trim(dbedCodigo.Text) = ''
  then begin
     MsgDlg('Código não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
     dbedDescricao.SetFocus;
     Abort;
  end;

  if Trim(dbedDescricao.Text) = ''
  then begin
     MsgDlg('Descrição não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
     dbedDescricao.SetFocus;
     Abort;
  end;

end;

procedure TfrmCadSitDependente.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

end.
