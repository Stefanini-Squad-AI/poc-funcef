unit FCadSitPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  Wwdotdot, Wwdbcomb, Mask, wwdbedit;

type
  TFrmCadSitPart = class(TFrmCadastroGridCS)
    dbedtDescricao: TwwDBEdit;
    LblDescricao: TLabel;
    LblFlagInterno: TLabel;
    dbedtCodigo: TwwDBEdit;
    Label1: TLabel;
    cbFlgInterno: TComboBox;
    qryAux: TwwQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure MostraDescricaoFlgInt;
    procedure CmeCadastroConfirma(Sender: TObject);

  private

    { Private declarations }

     EstadoAnt : TDataSetState;
  public
    { Public declarations }
  end;

var
  FrmCadSitPart: TFrmCadSitPart;
     
implementation

uses
    UDataBase, UMensErro, USistema;
    
{$R *.DFM}

procedure TFrmCadSitPart.FormActivate(Sender: TObject);
begin
  inherited;
  If not qry.Active then qry.Open;
end;

procedure TFrmCadSitPart.FormCreate(Sender: TObject);
begin
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('Select IDSITPART,DESCRICAO,FLGINTERNO FROM '+ Sistema.PrefixoServidor+' SITPART');
  qry.SQL.Add('order by DESCRICAO');
  dbGrd.BringToFront;
  inherited;
end;

procedure TFrmCadSitPart.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedtDescricao.SetFocus;
end;

procedure TFrmCadSitPart.dsStateChange(Sender: TObject);
begin
  inherited;
  if ds.DataSet.State in [dsEdit, dsInsert] then
  dbedtDescricao.SetFocus;
end;

procedure TFrmCadSitPart.sbtnApagarClick(Sender: TObject);
begin
 {Verificar se existe algum participante com esta situação}
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT COUNT(IDPESSOA) as numParticip FROM PARTPREVPLAN '+
                 ' WHERE IDSITPART = ' + qry.FieldByName('IdSITPART').AsString);
  qryAux.Open;
  if qryAux.FieldByName('NumParticip').AsInteger > 0
  then begin
     if qryAux.FieldByName('NumParticip').AsInteger = 1
     then MsgDlg('Existe um participante inscrito nesta situação.','Erro',mtError,[mbOk,mbHelp],0)
     else MsgDlg('Existem '+qryAux.FieldByName('NumParticip').AsString+
                 ' participantes nesta situação.','Erro',mtError,[mbOk,mbHelp],0);

     qryAux.Close;
     sbtnApagar.Down := False;
     Exit;
  end;
  qryAux.Close;
  dbedtDescricao.text:='';
  cbFlgInterno.Text:= '';
  inherited;

end;

procedure TFrmCadSitPart.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if not MontaSelect.RetornouValor then Exit;

  qry.Locate('IDSITPART',StrToInt(MontaSelect.ValoresChave[0]),[loCaseInsensitive]);
  dbedtDescricao.text:=qry.FieldByName('DESCRICAO').AsString ;
  MostraDEscricaoFlgInt;
end;

procedure TFrmCadSitPart.bbtnConfirmarClick(Sender: TObject);
begin


 if Trim(dbedtDescricao.text) = '' then
     begin
          MsgDlg('Descrição não preenchida','Erro',mtError,[mbOk,mbHelp],0);
          dbedtDescricao.SetFocus;
          Exit;
     end;

  if (cbFlgInterno.Text) = 'Ativo' then
     qry.FieldByName('FLGINTERNO').AsString := 'AT'
  else
  if (cbFlgInterno.Text) = 'Mantido' then
      qry.FieldByName('FLGINTERNO').AsString := 'MA'
  else
  if (cbFlgInterno.Text) = 'Mantido Parcial' then
      qry.FieldByName('FLGINTERNO').AsString := 'MP'
  else
  if (cbFlgInterno.Text) = 'Assistido' then
     qry.FieldByName('FLGINTERNO').AsString := 'AS'
  else
  if (cbFlgInterno.Text) = 'Manutenção de Saldo de Conta' then
     qry.FieldByName('FLGINTERNO').AsString := 'MS'
  else
  if (cbFlgInterno.Text) = 'Cancelado' then
    qry.FieldByName('FLGINTERNO').AsString := 'CA'
  else
  if (cbFlgInterno.Text) = 'Ativo Especial' then
     qry.FieldByName('FLGINTERNO').AsString := 'AE'
  else
  if (cbFlgInterno.Text) = 'Pendente' then
     qry.FieldByName('FLGINTERNO').AsString := 'PN'
  else
     begin
          MsgDlg('Situação Inválida','Erro',mtError,[mbOk,mbHelp],0);
          cbFlgInterno.Text := '';
          cbFlgInterno.SetFocus;
          Exit;
     end;

  qry.FieldByName('IDSITPART').AsInteger := dbedtCodigo.Field.AsInteger;
  qry.FieldByName('DESCRICAO').AsString  := dbedtDescricao.Text;
 
 inherited;

end;

procedure TFrmCadSitPart.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  MostraDescricaoFlgInt;
  bbtnConfirmar.Enabled:= TRUE;

end;

procedure TFrmCadSitPart.MostraDescricaoFlgInt;
begin
  if UPPERCASE(qry.FieldByName('FLGINTERNO').AsString) = 'AT' then
     cbFlgInterno.Text := 'Ativo'
  else
  if UPPERCASE(qry.FieldByName('FLGINTERNO').AsString) = 'MA' then
     cbFlgInterno.Text := 'Mantido'
  else
  if UPPERCASE(qry.FieldByName('FLGINTERNO').AsString) = 'MP' then
     cbFlgInterno.Text := 'Mantido Parcial'
  else
  if UPPERCASE(qry.FieldByName('FLGINTERNO').AsString) = 'AS' then
     cbFlgInterno.Text := 'Assistido'
  else
  if UPPERCASE(qry.FieldByName('FLGINTERNO').AsString) = 'MS' then
     cbFlgInterno.Text := 'Manutenção de Saldo de Conta'
  else
  if UPPERCASE(qry.FieldByName('FLGINTERNO').AsString) = 'CA' then
     cbFlgInterno.Text := 'Cancelado'
  else
  if UPPERCASE(qry.FieldByName('FLGINTERNO').AsString) = 'AE' then
     cbFlgInterno.Text := 'Ativo Especial'
  else
  if UPPERCASE(qry.FieldByName('FLGINTERNO').AsString) = 'PN' then
     cbFlgInterno.Text := 'Pendente';

     dbedtDescricao.Text:= qry.FieldByName('DESCRICAO').AsString;

end;

procedure TFrmCadSitPart.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedtDescricao.text:='';
  cbFlgInterno.Text:= '';
  dbedtDescricao.SetFocus;

end;

procedure TFrmCadSitPart.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
   EstadoAnt := qry.State;
  if qry.State in [dsinsert] then
     qry.FieldByName('IDSITPART').AsInteger := LeUltRegistro(qryAux,'SITPART');
end;

procedure TFrmCadSitPart.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

end.
