unit FCadSitFunc;



interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, CmEventosCadastro,
  ImgList;

type
  TfrmCadSitFunc = class(TfrmCadastroCS)
    Label3: TLabel;
    dbedDescricao: TwwDBEdit;
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label4: TLabel;
    cbFlgInterno: TComboBox;
    qryAux: TwwQuery;
    dbrdgrpTipoUso: TDBRadioGroup;
    procedure qryBeforePost(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    EstadoAnt : TDataSetState;
  public
    { Public declarations }
  end;
    
var
  frmCadSitFunc: TfrmCadSitFunc;
  sIdSitFunc   : string;
implementation

uses UAdmPrev, UdataBase, UMensErro, usistema;

{$R *.DFM}

procedure TfrmCadSitFunc.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cbFlgInterno.Text := '';
  dbrdgrpTipoUso.ItemIndex := 0;
  dbedDescricao.SetFocus;
end;

procedure TfrmCadSitFunc.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    With qry do
    begin
      Close;
      qry.ParamByName('IDSITFUNC').Value := StrToInt(MontaSelect.ValoresChave[0]);
      Open;
    end;
    sIdSitFunc := IntToStr(qry.FieldByName('IDSITFUNC').AsInteger);
    if qry.FieldByName('TIPOSIT').AsString = 'A' then
       cbFlgInterno.Text := 'Ativo'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '0' then
       cbFlgInterno.Text := 'Demitido'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '1' then
       cbFlgInterno.Text := 'Demitido Aposentado'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '2' then
       cbFlgInterno.Text := 'Afastado sem Remuneração'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '3' then
       cbFlgInterno.Text := 'Afastado com Remuneração'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '4' then
       cbFlgInterno.Text := 'Falecido Natural'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '5' then
       cbFlgInterno.Text := 'Falecido Acidental'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '6' then
       cbFlgInterno.Text := 'Demitido por PID'  
    else
    if qry.FieldByName('FLGINTERNO').AsString = '7' then
       cbFlgInterno.Text := 'Demitido por PIA'; 

  end;
end;

procedure TfrmCadSitFunc.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  EstadoAnt := qry.State;
  if qry.State = dsInsert then
  begin
    try
      qry.FieldByName('IDSITFUNC').AsInteger := LeUltRegistro(Nil,'SITFUNC');
      sIdSitFunc := IntToStr(qry.FieldByName('IDSITFUNC').AsInteger);
    except
      ShowMessage('Erro na geração do código');
    end;
  end;

  if (cbFlgInterno.Text) = 'Ativo' then
  begin
     qry.FieldByName('TIPOSIT').AsString := 'A';
     qry.FieldByName('FLGINTERNO').AsString := '0';
  end
  else
  if (cbFlgInterno.Text) = 'Demitido' then
  begin
    qry.FieldByName('TIPOSIT').AsString := 'D';
    qry.FieldByName('FLGINTERNO').AsString := '0';
  end
  else
  if (cbFlgInterno.Text) = 'Demitido Aposentado' then
  begin
     qry.FieldByName('TIPOSIT').AsString := 'D';
     qry.FieldByName('FLGINTERNO').AsString := '1';
  end
  else
  if (cbFlgInterno.Text) = 'Afastado sem Remuneração' then
  begin
    qry.FieldByName('TIPOSIT').AsString := 'F';
    qry.FieldByName('FLGINTERNO').AsString := '2';
  end
  else
  if (cbFlgInterno.Text) = 'Afastado com Remuneração' then
  begin
    qry.FieldByName('TIPOSIT').AsString := 'F';
    qry.FieldByName('FLGINTERNO').AsString := '3';
  end
  else
  if (cbFlgInterno.Text) = 'Falecido Natural' then
  begin
    qry.FieldByName('TIPOSIT').AsString := 'M';
    qry.FieldByName('FLGINTERNO').AsString := '4';
  end
  else
  if (cbFlgInterno.Text) = 'Falecido Acidental' then
  begin
    qry.FieldByName('TIPOSIT').AsString := 'M';
    qry.FieldByName('FLGINTERNO').AsString := '5';
  end
  else
  if (cbFlgInterno.Text) = 'Demitido por PID' then 
  begin
     qry.FieldByName('TIPOSIT').AsString := 'P';
     qry.FieldByName('FLGINTERNO').AsString := '6';
  end
  else
  if (cbFlgInterno.Text) = 'Demitido por PIA' then 
  begin
    qry.FieldByName('TIPOSIT').AsString := 'P';
    qry.FieldByName('FLGINTERNO').AsString := '7';
  end
  else
  begin
    MsgDlg('Situação Inválida','Erro',mtError,[mbOk,mbHelp],0);
    cbFlgInterno.Text := '';
    cbFlgInterno.SetFocus;
    Exit;
  end;

  if Trim(dbedDescricao.Text) = '' then
  begin
    MsgDlg('Descrição não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    dbedDescricao.SetFocus;
    Exit;
  end;

end;

procedure TfrmCadSitFunc.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedDescricao.SetFocus;
end;

procedure TfrmCadSitFunc.CmeCadastroConfirma(Sender: TObject);
var
  iIdProx : integer;
begin
  inherited;
  // inserir registro na SITGERAL
  // Tipos : Plano(SITPLANO) = L ;  Fundacao(SITPART) = P;  Patrocinadora(SITFUNC) = F
  if EstadoAnt = dsInsert then
  begin
    iIdProx := LeUltRegistro (Nil,'SITGERAL');
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' INSERT INTO SITGERAL (IDSITGERAL,IDSITFUNC,TIPO) ' +
                   ' VALUES('+IntToStr(iIdProx) + ',' +
                              (sIdSitFunc) +',' +
                            '''F''' + ')');
    try
      qryAux.ExecSQL;
    except
      on E:EDBEngineError do
      MostrarErro(E);
    end;

    cbFlgInterno.Text := '';
    dbrdgrpTipoUso.ItemIndex := 0;
  end;
    
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;
procedure TfrmCadSitFunc.CmeCadastroDelete(Sender: TObject);
begin
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM SITGERAL '+
                 ' WHERE IDSITFUNC = '+sIdSitFunc);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
        MostrarErro(E);
  end;

  inherited;
end;

procedure TfrmCadSitFunc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
    if qry.FieldByName('TIPOSIT').AsString = 'A' then
       cbFlgInterno.Text := 'Ativo'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '0' then
       cbFlgInterno.Text := 'Demitido'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '1' then
       cbFlgInterno.Text := 'Demitido Aposentado'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '2' then
       cbFlgInterno.Text := 'Afastado sem Remuneração'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '3' then
       cbFlgInterno.Text := 'Afastado com Remuneração'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '4' then
       cbFlgInterno.Text := 'Falecido Natural'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '5' then
       cbFlgInterno.Text := 'Falecido Acidental'
    else
    if qry.FieldByName('FLGINTERNO').AsString = '6' then
       cbFlgInterno.Text := 'Demitido por PID'  
    else
    if qry.FieldByName('FLGINTERNO').AsString = '7' then
       cbFlgInterno.Text := 'Demitido por PIA'; 
end;

end.

