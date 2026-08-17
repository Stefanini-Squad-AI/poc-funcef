unit FCadTpInsalubridadeCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit,
  wwdblook, Wwdotdot, Wwdbcomb, DBCtrls, CmEventosCadastro, ImgList,
  IvDictio, IvMulti, IvEMulti;

type
  TfrmCadTpInsalubridadeCS = class(TfrmCadastroCS)
    dbedCodTpInsalubri: TwwDBEdit;
    dbedDescricao: TwwDBEdit;
    dbedFator: TwwDBEdit;
    dblkpcmbIdRegraInsalubri: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    lblFator: TLabel;
    lblRegra: TLabel;
    dbedTempoPermanMinimo: TwwDBEdit;
    Label5: TLabel;
    rgUtilizarFatorouRegra: TRadioGroup;
    dbchkFlgTempoContinuo: TDBCheckBox;
    qryRegra: TwwQuery;
    qryAux: TwwQuery;
    Label3: TLabel;
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure dsStateChange(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure rgUtilizarFatorouRegraClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
     procedure MostraFatorRegra;    
  public
    { Public declarations }
  end;

var
  frmCadTpInsalubridadeCS: TfrmCadTpInsalubridadeCS;

implementation

uses
   UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmCadTpInsalubridadeCS.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('pCodTpInsalubri').Value := 0;
  qry.Open;

  dbchkFlgTempoContinuo.Checked := True;

  qryRegra.Close; qryRegra.Open;
end;

procedure TfrmCadTpInsalubridadeCS.bbtnConfirmarClick(Sender: TObject);
begin
  if Trim(dbedCodTpInsalubri.Text) = '' then
     begin
          MsgDlg('Código não preenchido','Erro',mtError,[mbOk,mbHelp],0);
          dbedCodTpInsalubri.SetFocus;
          Exit;
     end;

  if (qry.State in [dsInsert]) then
      begin
          qryAux.Close;
          qryAux.Sql.Clear;
          qryAux.Sql.Add(' SELECT CODTPINSALUBRI FROM TPINSALUBRI ' +
                         ' WHERE  CODTPINSALUBRI = ' + '''' + Trim(dbedCodTpInsalubri.Text) + '''');
          qryAux.Open;
          if not qryAux.IsEmpty then
             begin
                  MsgDlg('Código já cadastrado.','Erro',mtError,[mbOk,mbHelp],0);
                  dbedCodTpInsalubri.SetFocus;
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

  if rgUtilizarFatorouRegra.ItemIndex = 0 then
     begin
          if Trim(dbedFator.Text) = '' then
             begin
                  MsgDlg('Fator Multiplicador não preenchido','Erro',mtError,[mbOk,mbHelp],0);
                  dbedFator.SetFocus;
                  Exit;
             end;
     end
  else
     begin
          if Trim(dblkpcmbIdRegraInsalubri.Text) = '' then
             begin
                  MsgDlg('Regra Alteradora não preenchida','Erro',mtError,[mbOk,mbHelp],0);
                  dblkpcmbIdRegraInsalubri.SetFocus;
                  Exit;
             end;
     end;

  inherited;
end;

procedure TfrmCadTpInsalubridadeCS.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dbchkFlgTempoContinuo.Checked := True;
end;

procedure TfrmCadTpInsalubridadeCS.dsStateChange(Sender: TObject);
begin
  inherited;
  if ds.DataSet.State in [dsInsert] then
     begin
          dbedCodTpInsalubri.Enabled := True;
          dbedCodTpInsalubri.SetFocus;
     end;

  if ds.DataSet.State in [dsEdit] then
     begin
          dbedCodTpInsalubri.Enabled := False;
          dbedDescricao.SetFocus;
     end;
end;

procedure TfrmCadTpInsalubridadeCS.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
      begin
           qry.Close;
           qry.ParamByName('pCodTpInsalubri').AsString := MontaSelect.ValoresChave[0];
           qry.Open;
      end;
end;

procedure TfrmCadTpInsalubridadeCS.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dbchkFlgTempoContinuo.Checked then
     qry.FieldByName('FLGTEMPOCONTINUO').AsString := '1'
  else
     qry.FieldByName('FLGTEMPOCONTINUO').AsString := '0';

  
  if rgUtilizarFatorouRegra.ItemIndex = 0 then
    
    qry.FieldByName('IDREGRAINSALUBRI').Clear
  else
     
     qry.FieldByName('FATOR').Clear;
end;

procedure TfrmCadTpInsalubridadeCS.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if qry.State in [dsInactive] then
     exit;

  MostraFatorRegra;
end;

procedure TfrmCadTpInsalubridadeCS.rgUtilizarFatorouRegraClick(Sender: TObject);
begin
  inherited;
  if rgUtilizarFatorouRegra.ItemIndex = 0 then
     begin
          lblFator.Visible  := True;
          dbedFator.Visible := True;
          lblRegra.Visible  := False;
          dblkpcmbIdRegraInsalubri.Visible := False;
     end
  else
     begin
          lblRegra.Visible  := True;
          dblkpcmbIdRegraInsalubri.Visible := True;
          lblFator.Visible  := False;
          dbedFator.Visible := False;
     end;
end;

procedure TfrmCadTpInsalubridadeCS.MostraFatorRegra;
begin
  if qry.FieldByName('IDREGRAINSALUBRI').AsString <> '' then
     begin
          lblRegra.Visible  := True;
          dblkpcmbIdRegraInsalubri.Visible := True;
          qryRegra.Locate('IDREGRA', qry.FieldByName('IDREGRAINSALUBRI').AsString, [loCaseInsensitive, loPartialKey]);
          dblkpcmbIdRegraInsalubri.Text := qryRegra.FieldByName('NOMEREGRA').AsString;
          lblFator.Visible  := False;
          dbedFator.Visible := False;
          rgUtilizarFatorouRegra.ItemIndex := 1
     end
  else
     begin
          lblFator.Visible  := True;
          dbedFator.Visible := True;
          lblRegra.Visible  := False;
          dblkpcmbIdRegraInsalubri.Visible := False;
          rgUtilizarFatorouRegra.ItemIndex := 0;
     end;
end;

procedure TfrmCadTpInsalubridadeCS.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  MostraFatorRegra;
end;

end.
