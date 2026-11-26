unit FCadReajINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, CmEventosCadastro, ImgList;

type
  TfrmCadReajINSS = class(TfrmCadastroCS)
    dbgrdReajINSS: TwwDBGrid;
    qryRegra: TwwQuery;
    Panel1: TPanel;
    grpAnoMes: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edAno: TEdit;
    edMes: TEdit;
    grpRegra: TGroupBox;
    Label4: TLabel;
    dblkpcmbRegra: TwwDBLookupCombo;
    qryGrid: TwwQuery;
    dsGrid: TwwDataSource;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryGridAfterScroll(DataSet: TDataSet);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
    sAno, sMes : string;
  public
    { Public declarations }
  end;

var
  frmCadReajINSS: TfrmCadReajINSS;

implementation

uses UAdmPrev, UMensErro, usistema;

{$R *.DFM}

procedure TfrmCadReajINSS.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     qry.Close;
     qry.ParamByName('MesReaj').AsString := MontaSelect.ValoresChave[0];
     qry.Open;
     qryGrid.Close;
     qryGrid.Open;
     qryGrid.Locate('MesReaj',qry.FieldByName('MesReaj').AsString,[loCaseInsensitive]);
     sAno := Copy(qry.FieldByName('MesReaj').AsString,1,4);
     sMes := Copy(qry.FieldByName('MesReaj').AsString,6,2);
     edAno.Text := sAno;
     edMes.Text := sMes;
  end;
end;
procedure TfrmCadReajINSS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  edAno.SetFocus; 
end;

procedure TfrmCadReajINSS.FormActivate(Sender: TObject);
begin
  inherited;
  edAno.Text := '';
  edMes.Text := '';
  dblkpcmbRegra.Text := '';

  qryRegra.Close;
  qryRegra.Open;

  qry.Close;
  qry.ParamByName('MesReaj').AsString := '0000/00';
  qry.Open;
end;

procedure TfrmCadReajINSS.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qry.Active then Exit;
  sAno := Copy(qry.FieldByName('MesReaj').AsString,1,4);
  sMes := Copy(qry.FieldByName('MesReaj').AsString,6,2);
  edAno.Text := sAno;
  edMes.Text := sMes;

end;

procedure TfrmCadReajINSS.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  sAno := Trim(edAno.Text);
  sMes := Trim(edMes.Text);
  if (StrToInt(sMes) <= 9) and (Length(Trim(sMes)) < 2)
  then sMes := '0'+sMes;
  qry.FieldByName('MesReaj').AsString := sAno+'/'+sMes;
end;

procedure TfrmCadReajINSS.bbtnConfirmarClick(Sender: TObject);
begin
  // verificar campos obrigatorios
  if Trim(edAno.Text) = ''
  then begin
     MsgDlg('Informe o Ano de Reajuste. ','Erro',mtError,[mbOk,mbHelp],0);
     edAno.SetFocus;
     Exit;
  end;

  if Trim(edMes.Text) = ''
  then begin
     MsgDlg('Informe o Mês de Reajuste. ','Erro',mtError,[mbOk,mbHelp],0);
     edMes.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbRegra.Text) = ''
  then begin
     MsgDlg('Informe a Regra de Reajuste. ','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbRegra.SetFocus;
     Exit;
  end;
  inherited;
  qryGrid.Close;
  qryGrid.Open;
  qryGrid.Locate('MesReaj',qry.FieldByName('MesReaj').AsString,[loCaseInsensitive]);
end;

procedure TfrmCadReajINSS.qryGridAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if ds.DataSet.State = dsEdit
  then begin
     qry.Close;
     qry.ParamByName('MesReaj').AsString := qryGrid.FieldByName('MesReaj').AsString;
     qry.Open;
     qryRegra.Locate('IdRegra',qry.FieldByName('IdRgReaj').AsInteger,[loCaseInsensitive]);
     sAno := Copy(qry.FieldByName('MesReaj').AsString,1,4);
     sMes := Copy(qry.FieldByName('MesReaj').AsString,6,2);
     edAno.Text := sAno;
     edMes.Text := sMes;
     sbtnAlterarClick(Application);
  end;
end;

procedure TfrmCadReajINSS.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;

    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
end;



end.