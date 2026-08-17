unit FCadTpPeriodicidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, Db, DBTables, Wwquery, StdCtrls, cmseldlg, wwidlg,
  Wwdatsrc, DBCtrls, MAHlpBtn, Buttons, ComCtrls, ToolWin,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, TB97, TB97Ctls,
  TB97Tlbr, FCadastroGrid, CmEventosCadastro, wwDialog, ImgList, IvDictio,
  IvMulti, IvEMulti, MontaSelect;

type
  TfrmCadTpPeriodicidade = class(TfrmCadastroGridCS)
    Label1: TLabel;
    Label2: TLabel;
    dbedDesc: TwwDBEdit;
    dbedQtdeMeses: TwwDBEdit;
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
  frmCadTpPeriodicidade: TfrmCadTpPeriodicidade;

implementation

uses UMensErro, UDataBase, usistema;

{$R *.DFM}

procedure TfrmCadTpPeriodicidade.FormActivate(Sender: TObject);
begin
  inherited;
  if not qry.Active
  then begin
     qry.Close;
     qry.Open;
  end;
end;

procedure TfrmCadTpPeriodicidade.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedDesc.SetFocus;
end;

procedure TfrmCadTpPeriodicidade.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedDesc.SetFocus;
end;

procedure TfrmCadTpPeriodicidade.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if not MontaSelect.RetornouValor then Exit;

  qry.Locate('IDTPPERIODICIDADE',StrToInt(MontaSelect.ValoresChave[0]),[loCaseInsensitive]);
end;

procedure TfrmCadTpPeriodicidade.qryBeforePost(DataSet: TDataSet);
begin
  if Trim(dbedDesc.Text) = ''
  then begin
    MsgDlg('Descrição da Periodicidade não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    dbedDesc.SetFocus;
    Abort;
  end;

  if Trim(dbedQtdeMeses.Text) = ''
  then begin
    MsgDlg('Quantidade de Meses não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    dbedQtdeMeses.SetFocus;
    Abort;
  end;

  if qry.State = dsInsert
  then qry.FieldByName('IDTPPERIODICIDADE').AsInteger := LeUltRegistro(nil,'TPPERIODICIDADE');

  inherited;

end;

procedure TfrmCadTpPeriodicidade.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

end.

