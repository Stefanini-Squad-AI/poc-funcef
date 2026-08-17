unit FConfDeptRev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, wwdblook, CMDBLookupCombo, Db, wwdbedit, StdCtrls,
  DBCtrls, Mask, Wwdbspin, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  Wwdotdot, Wwdbcomb, CmEventosCadastro, ImgList;

const HOJE      = 'H';
      ACUMULADO = 'A';
      ORCADO    = 'O'; 
type
  TfrmConfDeptRev = class(TfrmCadMestreDetalheCS)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    dbNomeLinha: TwwDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryColisao: TwwQuery;
    qryIDGRUPODEPTREV: TFloatField;
    qryIDHOTEL: TFloatField;
    qryNOMELINHA: TStringField;
    qryDetIDITEMDEPTREV: TFloatField;
    qryDetIDGRUPODEPTREV: TFloatField;
    qryDetCOLUNA: TStringField;
    Label4: TLabel;
    dbDemonst: TwwDBLookupCombo;
    Label5: TLabel;
    dblkElemDemo: TwwDBLookupCombo;
    qryElemDemo: TwwQuery;
    qryElemDemoIDELEMDEMONSTRAT: TFloatField;
    qryElemDemoELEDESCELEM: TStringField;
    qryElemDemoIDDEMONSTRATIVO: TFloatField;
    qryDemonst: TwwQuery;
    qryDemonstIDDEMONSTRATIVO: TFloatField;
    qryDemonstDEMDESCDEMONSTRAT: TStringField;
    Label1: TLabel;
    dbcbColuna: TwwDBComboBox;
    qryDetIDELEMDEMONSTRAT: TFloatField;
    qryDetELEDESCELEM: TStringField;
    qryPOSICAORELAT: TFloatField;
    Label2: TLabel;
    dbPosRel: TwwDBSpinEdit;
    qryDetCOLGRID: TStringField;
    dbckRateio: TDBCheckBox;
    qryDetFLGRATEIO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbPosRelExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdDetTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbDemonstExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    FieldAtual,
    FTextoSQL: string;
    OrderDesc: boolean;
    procedure SelecionaFilhos;
    function ExisteColisao: Boolean;
  public
    { Public declarations }
  end;

var
  frmConfDeptRev: TfrmConfDeptRev;

implementation

uses uModulo, uSistema, uDataBase, uMensErro;

{$R *.DFM}

procedure TfrmConfDeptRev.SelecionaFilhos;
begin
  qryDet.Close;
  qryDet.ParamByName('IDGRUPODEPTREV').AsInteger := qry.FieldByName('IDGRUPODEPTREV').AsInteger;
  qryDet.Open;
end;

procedure TfrmConfDeptRev.CmeCadastroFind(Sender: TObject);
begin
  if MontaSelect.RetornouValor then
  begin
    qry.Close;
    qry.ParamByName('IDGRUPODEPTREV').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;
    SelecionaFilhos;
  end;
end;

procedure TfrmConfDeptRev.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('IDGRUPODEPTREV').AsInteger := LeUltRegistro(nil,'GRUPODEPTREV');
  qry.FieldByName('IDHOTEL').AsInteger := Modulo.iHotel;
  qryColisao.Close;
  qryColisao.ParamByName('IDHOTEL').AsInteger := Modulo.iHotel;
  qryColisao.Open;
  qryColisao.Last;
  qry.FieldByName('POSICAORELAT').AsInteger := qryColisao.FieldByName('POSICAORELAT').AsInteger + 1;
  dbPosRel.MinValue := qryColisao.FieldByName('POSICAORELAT').AsInteger + 1;
  qryColisao.Close;
  SelecionaFilhos;
  dbNomeLinha.SetFocus;
end;

procedure TfrmConfDeptRev.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbNomeLinha.SetFocus;
end;

procedure TfrmConfDeptRev.CmeDetalheConfirma(Sender: TObject);
begin
  if qryDet.State in ([dsEdit, dsInsert]) then
  begin
    qryDet.FieldByName('ELEDESCELEM').AsString := dblkElemDemo.Text;
    qryDet.FieldByName('COLGRID').AsString     := dbcbColuna.Text;
  end;
  inherited;
end;

procedure TfrmConfDeptRev.CmeCadastroConfirma(Sender: TObject);
begin
  AplicaAlteracoes([qry, qryDet]);
end;

procedure TfrmConfDeptRev.CmeCadastroDelete(Sender: TObject);
begin
  qryDet.First;
  while not qryDet.EOF do qryDet.Delete;
  AplicaAlteracoes([qryDet, qry]);
  inherited;
end;

procedure TfrmConfDeptRev.CmeDetalheInsert(Sender: TObject);
begin
  if (qry.State in ([dsInsert, dsEdit])) then
  begin
    inherited;
    qryDet.FieldByName('IDITEMDEPTREV').AsInteger := LeUltRegistro(nil,'ITEMDEPTREV');
    qryDet.FieldByName('IDGRUPODEPTREV').AsInteger := qry.FieldByName('IDGRUPODEPTREV').AsInteger;
    qryDet.FieldByName('IDELEMDEMONSTRAT').Clear;
    dbDemonst.Text := '';
//    dbckRateio.Enabled := False;
  end;
end;

procedure TfrmConfDeptRev.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if qryDemonst.Locate('IDDEMONSTRATIVO',
    qryElemDemo.FieldByName('IDDEMONSTRATIVO').AsInteger,[loCaseInsensitive]) then
    dbDemonst.Text := qryDemonst.FieldByName('DEMDESCDEMONSTRAT').AsString;
end;

function TfrmConfDeptRev.ExisteColisao: Boolean;
begin
  qryColisao.Close;
  qryColisao.ParamByName('IDHOTEL').AsInteger := Modulo.iHotel;
  qryColisao.Open;
  result := False;
  if qryColisao.Locate('POSICAORELAT',dbPosRel.Value,[loCaseInsensitive]) then
    result := (qryColisao.FieldByName('IDGRUPODEPTREV').AsInteger <>
               qry.FieldByName('IDGRUPODEPTREV').AsInteger);
  qryColisao.Close;
end;

procedure TfrmConfDeptRev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry.close;
  qryDet.close;
  qryDemonst.Close;
  qryElemDemo.Close;
  inherited;
end;

procedure TfrmConfDeptRev.dbPosRelExit(Sender: TObject);
begin
  inherited;
  if Trim(TwwDBSpinEdit(Sender).Text) <> '' then
  try
    StrToInt(Trim(TwwDBSpinEdit(Sender).Text));
  except on EConvertError do
    begin
      MsgDlg('Posição inválida !','Erro',mtError,[mbOK],0);
      TwwDBSpinEdit(Sender).SetFocus;
    end;
  end
  else
  begin
    MsgDlg('Posição inexistente !','Aviso',mtInformation,[mbOK],0);
    TwwDBSpinEdit(Sender).SetFocus;
  end;
end;

procedure TfrmConfDeptRev.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('IDHOTEL = '+IntToStr(Modulo.iHotel));
  FTextoSQL := ' select I.IDITEMDEPTREV, I.IDGRUPODEPTREV, I.IDELEMDEMONSTRAT,   '+
               ' I.COLUNA, E.ELEDESCELEM from ITEMDEPTREV I, ELEMDEMONSTRATIVO E '+
               ' where  I.IDGRUPODEPTREV = :IDGRUPODEPTREV                       '+
               ' and  E.IDELEMDEMONSTRAT = I.IDELEMDEMONSTRAT                    ';
  FieldAtual := 'ELEDESCELEM';
  OrderDesc  := False;

  with qryDemonst do
  begin
    Close;
    ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
    Open;
  end;

  with qryElemDemo do
  begin
    Close;
    ParamByName('IDDEMO').AsInteger := qryDemonst.FieldByName('IDDEMONSTRATIVO').AsInteger;
    Open;
  end;

  // Mestre
  qry.Close;
  qry.ParamByName('IDGRUPODEPTREV').AsInteger := -1;
  qry.Open;

  SelecionaFilhos;
end;

procedure TfrmConfDeptRev.dbgrdDetTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  if FieldAtual = AFieldName then
    OrderDesc := not OrderDesc
  else OrderDesc := False;
  FieldAtual := AFieldName;
  qryDet.Close;
  qryDet.SQL.Clear;
  qryDet.SQL.Add(FTextoSQL + ' ORDER BY '+AFieldName);
  if OrderDesc then qryDet.SQL.Add('DESC');
  qryDet.Open;
end;

procedure TfrmConfDeptRev.dbDemonstExit(Sender: TObject);
begin
  inherited;
  with qryElemDemo do
  begin
    Close;
    ParamByName('IDDEMO').AsInteger := qryDemonst.FieldByName('IDDEMONSTRATIVO').AsInteger;
    Open;
  end;
end;

procedure TfrmConfDeptRev.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  SelecionaFilhos;
end;

procedure TfrmConfDeptRev.bbtnOkDetClick(Sender: TObject);
begin
  if qryDet.State in ([dsEdit,dsInsert]) then
  begin

    if Trim(dbDemonst.LookupValue) = '' then
    begin
      MsgDlg('Obrigatório a escolha do demonstrativo.',LerMensagem(2),mtError,[mbOk],0);
      ModalResult := mrNone;
      dbDemonst.SetFocus;      
      Exit;
    end;

    if qryDet.FieldByName('IDELEMDEMONSTRAT').IsNull then
    begin
      MsgDlg('Obrigatório a escolha do elemento do demonstrativo.',LerMensagem(2),mtError,[mbOk],0);
      ModalResult := mrNone;
      dblkElemDemo.SetFocus;            
      Exit;
    end;

    if not qryElemDemo.Locate('IDDEMONSTRATIVO; IDELEMDEMONSTRAT',
           VarArrayOf([qryDemonst.FieldByName('IDDEMONSTRATIVO').AsInteger,
                       qryDet.FieldByName('IDELEMDEMONSTRAT').AsInteger]),[])
    then begin
      MsgDlg('Obrigatório a escolha do elemento do demonstrativo.',LerMensagem(2),mtError,[mbOk],0);
      ModalResult := mrNone;
      dblkElemDemo.SetFocus;
      Exit;
    end;

    if qryDet.FieldByName('COLUNA').IsNull then
    begin
      MsgDlg('Obrigatório a escolha da linha do relatório.',LerMensagem(2),mtError,[mbOk],0);
      ModalResult := mrNone;
      dbcbColuna.SetFocus;
      Exit;
    end;

    if (qryDet.FieldByName('FLGRATEIO').AsString <> 'N') and
       (qryDet.FieldByName('FLGRATEIO').AsString <> 'S') then
      qryDet.FieldByName('FLGRATEIO').AsString := 'N';

{    if (qryDet.FieldByName('FLGRATEIO').AsString = 'S') and
       (qryDet.FieldByName('COLUNA').AsString <> 'O') then
      qryDet.FieldByName('FLGRATEIO').AsString := 'N';}

    inherited;
  end;
end;

procedure TfrmConfDeptRev.bbtnConfirmarClick(Sender: TObject);
begin
  if qry.State in ([dsEdit,dsInsert]) then
  begin

    if Trim(dbNomeLinha.Text) = '' then
    begin
      MsgDlg('Descrição da linha inexistente .','Aviso',mtInformation,[mbOK],0);
      ModalResult := mrNone;
      dbNomeLinha.SetFocus;
      Exit;
    end;

    if Trim(dbPosRel.Text) <> '' then
    try
      StrToInt(Trim(dbPosRel.Text));
    except on EConvertError do
      begin
        MsgDlg('Posição inválida !','Erro',mtError,[mbOK],0);
        ModalResult := mrNone;
        dbPosRel.SetFocus;
        Exit;
      end;
    end
    else
    begin
      MsgDlg('Obrigatório preencher a posição relativa ao relatório.','Aviso',mtInformation,[mbOK],0);
      ModalResult := mrNone;
      dbPosRel.SetFocus;
      Exit;
    end;

    if ExisteColisao then
    begin
      MsgDlg('A posição no relatório está colidindo com uma já cadastrada .','Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
      dbPosRel.SetFocus;
      Exit;
    end;

    if qryDet.State in ([dsEdit,dsInsert]) then
    begin
      MsgDlg('Existem alterações de detalhe para confirmar .','Aviso',mtInformation,[mbOk],0);
      ModalResult := mrNone;
      bbtnOkDet.SetFocus;
      Exit;
    end;
    
    inherited;
  end;
end;

end.
