unit FCancelaInsc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, ComCtrls, Db,
  DBTables, Wwquery, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc,  Mask, wwdbedit, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCancelaInsc = class(TfrmOkCancelar)
    ds: TwwDataSource;
    qryAux: TwwQuery;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edSitAtual: TEdit;
    qrySitFunc: TwwQuery;
    Label3: TLabel;
    dtedcancel: TCMDateTimePicker;
    qry: TwwQuery;
    cmbSitPart: TwwDBLookupCombo;
    Label4: TLabel;
    Memo1: TMemo;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function  CancelaPorInadimplencia(qryPart: TwwQuery): boolean;
    function  Cancelar(qryPart: TwwQuery): boolean;
    function  CancelarBenef(qryPart: TwwQuery): boolean;
  end;

var
  frmCancelaInsc: TfrmCancelaInsc;

implementation

uses UMensErro, Message, DBaseDados, UDataBase;

{$R *.DFM}

function TfrmCancelaInsc.CancelaPorInadimplencia(qryPart: TwwQuery): boolean;
begin
  dtedcancel.Visible := true;

  Caption := 'Cancelamento de Inscrição por Inadimplência';
  edSitAtual.Text := qryPart.FieldByName('DESCSITUACAO').AsString;

  qry.Close;
  qry.ParamByName('FLGINTERNO').Value := 'CI';
  qry.Open;

  if qry.IsEmpty then
  begin
    MsgDlg('Não existe nenhuma situação cadastrada que faça referência a cancelamento por inadimplência !',
           'Erro', mtError, [mbOk,mbHelp], 0);
    Result:=False;
    exit;
  end;

  if (qryPart.FieldByName('FLGINTERNO').AsString = 'TR') then
  begin
    MsgDlg('O participante está transferido de plano !', 'Erro', mtError, [mbOk,mbHelp], 0);
    Result:=False;
    exit;
  end;

  if (qryPart.FieldByName('FLGINTERNO').AsString =  'CA') or
     (qryPart.FieldByName('FLGINTERNO').AsString =  'CI') or
     (qryPart.FieldByName('FLGINTERNO').AsString <> 'IN') then
  begin
    MsgDlg('O participante não está inadimplente ou já está cancelado !', 'Erro',
           mtError, [mbOk,mbHelp], 0);
    Result:=False;
    exit;
  end;

  ShowModal;
  if modalResult = mrOk then
  begin
    // Cancela o Participante
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add
      ('UPDATE PARTASS'+
         ' SET IDSITPART = '+qry.FieldByName('IDSITPART').AsString+','+
              'FLGINSCRICAOCANC = 1,'+
              'DATACANCELAMENTO = TO_DATE('''+dtedcancel.text+''',''DD/MM/YYYY''),'+
              'OBSCANCEL = '''+memo1.text+''' '+
       ' WHERE (IDPESSOA = '+qryPart.FieldByName('IDPESSOA').AsString+')'+
         ' AND (IDPESSJUR = '+qryPart.FieldByName('IDPESSJUR').AsString+')'+
         ' AND (IDPLANOPREV = '+qryPart.FieldByName('IDPLANOPREV').AsString+')'+
         ' AND (IDPLANASS  = '+qryPart.FieldByName('IDPLANASS').AsString+')');
    try
      qryAux.ExecSQL;
      dtedcancel.Visible := false;
    except
      on E:EDBEngineError do
      begin
        MsgDlg('Erro ao cancelar o participante.', 'Erro', mtError, [mbOk,mbHelp], 0);
        dtmBaseDados.dbBaseDados.RollBack;
        Result:=False;
        exit;
      end;
    end;

    // Cancela o(s) Dependente(s)
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add
     ('UPDATE BENEFASS'+
        ' SET FLGATIVO = 0,'+
            ' DTCANCELAMENTO = TO_DATE('''+dtedcancel.text+''',''DD/MM/YYYY''),'+
            ' OBSCANCEL = '''+memo1.text+''' '+
      ' WHERE (IDTITULAR = '+qryPart.FieldByName('IDPESSOA').AsString+')'+
        ' AND (IDPESSJUR = '+qryPart.FieldByName('IDPESSJUR').AsString+')'+
        ' AND (IDPLANOPREV = '+qryPart.FieldByName('IDPLANOPREV').AsString+')'+
        ' AND (IDPLANASS  = '+qryPart.FieldByName('IDPLANASS').AsString+')');
    try
      qryAux.ExecSQL;
      dtedcancel.Visible := false;
    except
      on E:EDBEngineError do
      begin
        MsgDlg('Erro ao cancelar o dependente do participante.', 'Erro', mtError,
               [mbOk,mbHelp], 0);
        dtmBaseDados.dbBaseDados.RollBack;
        Result:=False;
        exit;
      end;
    end;

    // Cancela as contribuições do Participante/Dependente
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add
      ('UPDATE CONTASS'+
         ' SET FLGATIVO = 0'+
       ' WHERE (IDTITULAR  = '+qryPart.FieldByName('IdPessoa').AsString+')'+
         ' AND (IDPESSJUR = '+qryPart.FieldByName('IdPessJur').AsString+')'+
         ' AND (IDPLANOPREV = '+qryPart.FieldByName('IdPlanoPrev').AsString+')'+
         ' AND (IDPLANASS  ='+qryPart.FieldByName('IdPlanass').AsString+')');
    try
      qryAux.ExecSQL;
    except
      on E:EDBEngineError do
      begin
        MsgDlg('Erro ao cancelar o participante.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.RollBack;
        Result:=False;
        Exit;
      end;
    end;
  end;
  Result:=True;
end;

function TfrmCancelaInsc.Cancelar(qryPart: TwwQuery): boolean;
begin
  dtedcancel.Visible := true;
  Label2.visible     := true;
  cmbSitPart.visible := true;

  Caption := 'Cancelamento de Titular como Beneficiário';
  edSitAtual.Text := qryPart.FieldByName('DESCSITUACAO').AsString;

  qry.Close;
  qry.ParamByName('FLGINTERNO').Value := 'CA';
  qry.Open;

  if qry.isempty then
  begin
    MsgDlg('Não existe nenhuma situação cadastrada que faça referência a cancelamento !','Erro',mtError,[mbOk,mbHelp],0);
    Result:=False;
    exit;
  end;

  if (qryPart.FieldByName('FLGINTERNO').AsString = 'TR') then
  begin
    MsgDlg('O participante está transferido de plano !', 'Erro', mtError, [mbOk,mbHelp], 0);
    Result:=False;
    exit;
  end;

  if (qryPart.FieldByName('FLGINTERNO').AsString = 'CA') or
     (qryPart.FieldByName('FLGINTERNO').AsString = 'CI') then
  begin
    MsgDlg('O participante já é cancelado !', 'Erro', mtError, [mbOk,mbHelp], 0);
    Result:=False;
    exit;
  end;

  ShowModal; //APRESENTA O FORM.
  if modalResult = mrOk then
  begin
    // Cancela na PARTASS quando cancela dependentes!!!
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add
      ('UPDATE PARTASS'+
         ' SET IDSITPART = '+qry.FieldByName('IDSITPART').AsString+','+
             ' FLGINSCRICAOCANC = 1,'+
             ' DATACANCELAMENTO = TO_DATE('''+dtedcancel.text+''',''DD/MM/YYYY''),'+
             ' OBSCANCEL = '''+memo1.text+''' '+
       ' WHERE (IDPESSOA = '+qryPart.FieldByName('IDPESSOA').AsString+')'+
         ' AND (IDPESSJUR = '+qryPart.FieldByName('IDPESSJUR').AsString+')'+
         ' AND (IDPLANOPREV = '+qryPart.FieldByName('IDPLANOPREV').AsString+')'+
         ' AND (IDPLANASS  = '+qryPart.FieldByName('IDPLANASS').AsString+')');
    try
      qryAux.ExecSQL;
      dtEdCancel.Visible := false;
    except
      on E:EDBEngineError do
      begin
        MsgDlg('Erro ao cancelar o participante.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.RollBack;
        Result:=False;
        exit;
      end;
    end;

    // Cancela na BENEFASS
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add
     ('UPDATE BENEFASS'+
        ' SET FLGATIVO = 0,'+
            ' DTCANCELAMENTO = TO_DATE('''+dtedcancel.text+''',''DD/MM/YYYY''),'+
            ' OBSCANCEL = '''+memo1.text+''' '+
      ' WHERE (IDTITULAR = '+qryPart.FieldByName('IDPESSOA').AsString+')'+
        ' AND (IDPESSJUR = '+qryPart.FieldByName('IDPESSJUR').AsString+')'+
        ' AND (IDPLANOPREV = '+qryPart.FieldByName('IDPLANOPREV').AsString+')'+
        ' AND (IDPLANASS  = '+qryPart.FieldByName('IDPLANASS').AsString+')');
    try
      qryAux.ExecSQL;
      dtEdCancel.Visible := false;
    except
      on E:EDBEngineError do
      begin
        MsgDlg('Erro ao cancelar o dependente do participante.', 'Erro', mtError,
               [mbOk,mbHelp], 0);
        dtmBaseDados.dbBaseDados.RollBack;
        Result:=False;
        exit;
      end;
    end;

    // Cancela as Contribuições
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add
      ('UPDATE CONTASS'+
         ' SET FLGATIVO = 0'+
       ' WHERE (IDTITULAR = '+qryPart.FieldByName('IDPESSOA').AsString+')'+
         ' AND (IDPESSJUR = '+qryPart.FieldByName('IDPESSJUR').AsString+')'+
         ' AND (IDPLANOPREV = '+qryPart.FieldByName('IDPLANOPREV').AsString+')'+
         ' AND (IDPLANASS ='+qryPart.FieldByName('IDPLANASS').AsString+')');
    try
      qryAux.ExecSQL;
    except
      on E:EDBEngineError do
      begin
        MsgDlg('Erro ao cancelar o participante.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.RollBack;
        Result:=False;
        exit;
      end;
    end;
  end;
  Result:=True;
end;

function TfrmCancelaInsc.CancelarBenef(qryPart: TwwQuery): boolean;
begin
  dtedcancel.Visible := true;
  Label2.visible     := true;
  cmbSitPart.visible := true;

  Caption := 'Cancelamento de Titular como Beneficiário';
  edSitAtual.Text := qryPart.FieldByName('DESCSITUACAO').AsString;

  qry.Close;
  qry.ParamByName('FLGINTERNO').Value := 'NO';
  qry.Open;

  if qry.isempty then
  begin
    MsgDlg('Não existe nenhuma situação cadastrada que faça referência a cancelamento !','Erro',mtError,[mbOk,mbHelp],0);
    Result:=False;
    exit;
  end;

  if (qryPart.FieldByName('FLGINTERNO').AsString = 'TR') then
  begin
    MsgDlg('O participante está transferido de plano !', 'Erro', mtError, [mbOk,mbHelp], 0);
    Result:=False;
    exit;
  end;

  if (qryPart.FieldByName('FLGINTERNO').AsString = 'CA') or
     (qryPart.FieldByName('FLGINTERNO').AsString = 'CI') then
  begin
    MsgDlg('O participante já é cancelado !', 'Erro', mtError, [mbOk,mbHelp], 0);
    Result:=False;
    exit;
  end;

  ShowModal; //APRESENTA O FORM.
  if modalResult = mrOk then
  begin
    //cancela somente como beneficiario
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add
      ('UPDATE PARTASS'+
         ' SET FLGPARTBENEF = 0,'+
             ' DATACANCELAMENTO = TO_DATE('''+dtedcancel.text+''',''DD/MM/YYYY''),'+
             ' OBSCANCEL = '''+memo1.text+''' '+
       ' WHERE (IDPESSOA = '+qryPart.FieldByName('IDPESSOA').AsString+')'+
         ' AND (IDPESSJUR = '+qryPart.FieldByName('IDPESSJUR').AsString+')'+
         ' AND (IDPLANOPREV = '+qryPart.FieldByName('IDPLANOPREV').AsString+')'+
         ' AND (IDPLANASS  = '+qryPart.FieldByName('IDPLANASS').AsString+')');
    try
      qryAux.ExecSQL;
      dtEdCancel.Visible := false;
    except
      on E:EDBEngineError do
      begin
        MsgDlg('Erro ao cancelar o titular como beneficiário.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.RollBack;
        Result:=False;
        exit;
      end;
    end;

    // Cancela na BENEFASS
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add
     ('UPDATE BENEFASS'+
        ' SET FLGATIVO = 0,'+
            ' DTCANCELAMENTO = TO_DATE('''+dtedcancel.text+''',''DD/MM/YYYY''),'+
            ' OBSCANCEL = '''+memo1.text+''' '+
      ' WHERE (IDTITULAR = '+qryPart.FieldByName('IDPESSOA').AsString+')'+
        ' AND (IDPESSJUR = '+qryPart.FieldByName('IDPESSJUR').AsString+')'+
        ' AND (IDPLANOPREV = '+qryPart.FieldByName('IDPLANOPREV').AsString+')'+
        ' AND (IDPLANASS  = '+qryPart.FieldByName('IDPLANASS').AsString+')'+
        ' AND (IDDEPENDENTE = '+qryPart.FieldByName('IDPESSOA').AsString+')');
    try
      qryAux.ExecSQL;
      dtEdCancel.Visible := false;
    except
      on E:EDBEngineError do
      begin
        MsgDlg('Erro ao cancelar o dependente do participante.', 'Erro', mtError,
               [mbOk,mbHelp], 0);
        dtmBaseDados.dbBaseDados.RollBack;
        Result:=False;
        exit;
      end;
    end;

    // Cancela as Contribuições
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add
      ('UPDATE CONTASS'+
         ' SET FLGATIVO = 0'+
       ' WHERE (IDTITULAR = '+qryPart.FieldByName('IDPESSOA').AsString+')'+
         ' AND (IDPESSJUR = '+qryPart.FieldByName('IDPESSJUR').AsString+')'+
         ' AND (IDPLANOPREV = '+qryPart.FieldByName('IDPLANOPREV').AsString+')'+
         ' AND (IDPLANASS ='+qryPart.FieldByName('IDPLANASS').AsString+')'+
         ' AND (IDDEPENDENTE = '+qryPart.FieldByName('IDPESSOA').AsString+')');
    try
      qryAux.ExecSQL;
    except
      on E:EDBEngineError do
      begin
        MsgDlg('Erro ao cancelar o participante.','Erro',mtError,[mbOk,mbHelp],0);
        dtmBaseDados.dbBaseDados.RollBack;
        Result:=False;
        exit;
      end;
    end;
  end;
  Result:=True;
end;

procedure TfrmCancelaInsc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dtedcancel.text := '';
end;

procedure TfrmCancelaInsc.bbtnConfirmarClick(Sender: TObject);
begin
  if (dtedcancel.visible) and (dtedcancel.text = '') then
  begin
    MsgDlg('É preciso digitar a data de Cancelamento/Suspensão !', 'Erro', mtError,
           [mbOk,mbHelp],0);
    dtedcancel.SetFocus;
    exit;
  end;

  if (cmbsitpart.text = '') then
  begin
    MsgDlg('É preciso selecionar a nova situação do participante !', 'Erro', mtError,
           [mbOk,mbHelp], 0);
    cmbsitpart.SetFocus;
    exit;
  end;

  ModalResult := mrOk;
end;

procedure TfrmCancelaInsc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Commit;
  Action := caFree;
end;

procedure TfrmCancelaInsc.bbtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCancelaInsc.FormCreate(Sender: TObject);
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
end;

end.
