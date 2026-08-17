unit FCadSitPlano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, cmseldlg, wwidlg, Db, Wwdatsrc, TB97, MAHlpBtn, DBCtrls,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery,
  Mask, wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CmEventosCadastro, wwDialog, ImgList, FCadastroGrid, MontaSelect;

type
  TfrmCadSitPlano = class(TfrmCadastroGridCS)
    Label3: TLabel;
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    cbFlgInterno: TComboBox;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure PreencheComboSituacao;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject); 
  private
    { Private declarations }
    EstadoAnt : TDataSetState;
  public
    { Public declarations }
  end;

var
  frmCadSitPlano: TfrmCadSitPlano;

implementation

uses UDataBase, UMensErro, usistema;

{$R *.DFM}

procedure TfrmCadSitPlano.FormActivate(Sender: TObject);
begin
  inherited;
  if not qry.Active
  then begin
     qry.Close;
     qry.Open;
  end;
end;

procedure TfrmCadSitPlano.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cbFlgInterno.Enabled := True;
  dbedDescricao.SetFocus;
  cbFlgInterno.Text := '';
end;

procedure TfrmCadSitPlano.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  cbFlgInterno.Enabled := True;
  dbedDescricao.SetFocus;
  PreencheComboSituacao;

end;

procedure TfrmCadSitPlano.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if not MontaSelect.RetornouValor then Exit;

  qry.Locate('IDSITPLANOPREV',StrToInt(MontaSelect.ValoresChave[0]),[loCaseInsensitive]);
  PreencheComboSituacao;
end;

procedure TfrmCadSitPlano.qryBeforePost(DataSet: TDataSet);
begin
  if Trim(dbedDescricao.Text) = ''
  then begin
     MsgDlg('Descrição não preenchida','Erro',mtError,[mbOk,mbHelp],0);
     dbedDescricao.SetFocus;
     Abort;
  end;

  if (cbFlgInterno.Text) = 'Normal'
  then qry.FieldByName('FLGINTERNO').AsString := 'NO'
  else if (cbFlgInterno.Text) = 'Cancelado'
  then qry.FieldByName('FLGINTERNO').AsString := 'CA'
  else if (cbFlgInterno.Text) = 'Suspenso' 
  then qry.FieldByName('FLGINTERNO').AsString := 'SU'
  else if (cbFlgInterno.Text) = 'Inadimplente'
  then qry.FieldByName('FLGINTERNO').AsString := 'IN'
  else if (cbFlgInterno.Text) = 'Desligado'
  then qry.FieldByName('FLGINTERNO').AsString := 'DE'
  else if (cbFlgInterno.Text) = 'Cancelado por Inadimplência'
  then qry.FieldByName('FLGINTERNO').AsString := 'CI'
  else if (cbFlgInterno.Text) = 'Transferência de Plano'
  then qry.FieldByName('FLGINTERNO').AsString := 'TR'
  else if (cbFlgInterno.Text) = 'Pendente'
  then qry.FieldByName('FLGINTERNO').AsString := 'PN'
  else begin
     MsgDlg('Situação Inválida','Erro',mtError,[mbOk,mbHelp],0);
     cbFlgInterno.Text := '';
     cbFlgInterno.SetFocus;
     Abort;
  end;

  if qry.State = dsInsert
  then qry.FieldByName('IDSITPLANOPREV').AsInteger := LeUltRegistro(nil,'SITPLANOPREV');

  inherited;

end;

procedure TfrmCadSitPlano.PreencheComboSituacao;
Begin
  if qry.FieldByName('FLGINTERNO').AsString = 'NO' then
     cbFlgInterno.Text := 'Normal'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'CA' then
     cbFlgInterno.Text := 'Cancelado'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'SU' then
     cbFlgInterno.Text := 'Suspenso'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'IN' then
     cbFlgInterno.Text := 'Inadimplente'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'DE' then
     cbFlgInterno.Text := 'Desligado'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'CI' then
     cbFlgInterno.Text := 'Cancelado por Inadimplência'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'TR' then
     cbFlgInterno.Text := 'Transferência de Plano'
  else
  if qry.FieldByName('FLGINTERNO').AsString = 'PN' then
     cbFlgInterno.Text := 'Pendente';
end;
procedure TfrmCadSitPlano.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cbFlgInterno.Enabled := False;
end;

procedure TfrmCadSitPlano.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

end.
