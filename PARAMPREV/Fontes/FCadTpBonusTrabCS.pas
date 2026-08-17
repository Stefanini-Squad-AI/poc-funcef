unit FCadTpBonusTrabCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit,
  wwdblook, Wwdotdot, Wwdbcomb, DBCtrls, CmEventosCadastro, ImgList,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmCadTpBonusTrabCS = class(TfrmCadastroCS)
    dbedCodBonusTrab: TwwDBEdit;
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbedTempoPermanMinimo: TwwDBEdit;
    Label5: TLabel;
    dbchkFlgTempoContinuo: TDBCheckBox;
    qryRegra: TwwQuery;
    qryAux: TwwQuery;
    Label3: TLabel;
    lblRegra: TLabel;
    dblkpcmbIdRegraUsado: TwwDBLookupCombo;
    Label4: TLabel;
    dblkpcmbIdRegraNaoUsado: TwwDBLookupCombo;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure dsStateChange(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTpBonusTrabCS: TfrmCadTpBonusTrabCS;

implementation

uses
   UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmCadTpBonusTrabCS.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('pCodBonusTrab').Value := 0;
  qry.Open;

  dbchkFlgTempoContinuo.Checked := True;

  qryRegra.Close; qryRegra.Open;
end;

procedure TfrmCadTpBonusTrabCS.bbtnConfirmarClick(Sender: TObject);
begin
  if Trim(dbedCodBonusTrab.Text) = '' then
     begin
          MsgDlg('Código não preenchido','Erro',mtError,[mbOk,mbHelp],0);
          dbedCodBonusTrab.SetFocus;
          Exit;
     end;

  if (qry.State in [dsInsert]) then
      begin
          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add(' SELECT CODBONUSTRAB FROM TPBONUSTRAB ' +
                         ' WHERE  CODBONUSTRAB = ' + '''' + Trim(dbedCodBonusTrab.Text) + '''');
          qryAux.Open;
          if not qryAux.IsEmpty then
             begin
                  MsgDlg('Código já cadastrado.','Erro',mtError,[mbOk,mbHelp],0);
                  dbedCodBonusTrab.SetFocus;
                  TiraSql(qryAux);
                  Exit;
             end;
      end;

  if Trim(dbedDescricao.Text) = '' then
     begin
          MsgDlg('Descrição não preenchida','Erro',mtError,[mbOk,mbHelp],0);
          dbedDescricao.SetFocus;
          Exit;
     end;

  inherited;
end;

procedure TfrmCadTpBonusTrabCS.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dbchkFlgTempoContinuo.Checked := True;
end;

procedure TfrmCadTpBonusTrabCS.dsStateChange(Sender: TObject);
begin
  inherited;
  if ds.DataSet.State in [dsInsert] then
     begin
          dbedCodBonusTrab.Enabled := True;
          dbedCodBonusTrab.SetFocus;
     end;

  if ds.DataSet.State in [dsEdit] then
     begin
          dbedCodBonusTrab.Enabled := False;
          dbedDescricao.SetFocus;
     end;
end;

procedure TfrmCadTpBonusTrabCS.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
      begin
           qry.Close;
           qry.ParamByName('pCodBonusTrab').AsString := MontaSelect.ValoresChave[0];
           qry.Open;
      end;
end;

procedure TfrmCadTpBonusTrabCS.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dbchkFlgTempoContinuo.Checked then
     qry.FieldByName('FLGTEMPOCONTINUO').AsString := '1'
  else
     qry.FieldByName('FLGTEMPOCONTINUO').AsString := '0';
end;

end.
