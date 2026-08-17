unit FConfigPOA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, DBCtrls, DBCtrls2, wwdbedit,
  wwdblook, CMDBLookupCombo, Wwdotdot, Wwdbcomb, CmEventosCadastro, ImgList;

type
  TfrmConfigPOA = class(TFrmCadastroGridCS)
    qryIDLRELATELEMDEMO: TFloatField;
    qryIDHOTEL: TFloatField;
    qryIDLINHARELAT: TFloatField;
    qryIDDEMONSTRATIVO: TFloatField;
    qryIDELEMDEMONSTRAT: TFloatField;
    dbcbLinhas: TwwDBComboBox;
    lblLInha: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    qryElemDemo: TwwQuery;
    qryDemonst: TwwQuery;
    qryDemonstIDDEMONSTRATIVO: TFloatField;
    qryDemonstDEMDESCDEMONSTRAT: TStringField;
    dbDemonst: TwwDBLookupCombo;
    dblkElemDemo: TwwDBLookupCombo;
    qryElemDemoIDELEMDEMONSTRAT: TFloatField;
    qryElemDemoELEDESCELEM: TStringField;
    qryElemDemoIDDEMONSTRATIVO: TFloatField;
    dbckRateio: TDBCheckBox;
    qryFLGRATEIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbDemonstExit(Sender: TObject);
//    Procedure CmeCadastroDelete(Sender: TObject);
//    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    FieldAtual,
    FTextoSQL: string;
    OrderDesc: boolean;
  public
    { Public declarations }
  end;

var
  frmConfigPOA: TfrmConfigPOA;

implementation

uses uModulo, uSistema, uDataBase, uMensErro;

{$R *.DFM}

procedure TfrmConfigPOA.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  qry.FieldByName('IDHOTEL').AsInteger          := Modulo.iHotel;
  qry.FieldByName('IDLRELATELEMDEMO').AsInteger := LeUltRegistro(nil,'LRELATXELEMDEMO');
  dbDemonst.setfocus;
end;

procedure TfrmConfigPOA.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
//  if not qry.IsEmpty then
//  begin
//    dbcbLinhas.ItemIndex := qry.FieldByName('IDLINHARELAT').AsInteger;
//    dbcbLinhas.Text := dbcbLinhas.Items.Strings[dbcbLinhas.ItemIndex];
//  end;
  if qry.FieldByName('IDLRELATELEMDEMO').IsNull then
    qry.FieldByName('IDLRELATELEMDEMO').AsInteger := LeUltRegistro(nil,'LRELATXELEMDEMO');
  if qry.FieldByName('IDHOTEL').IsNull then
    qry.FieldByName('IDHOTEL').AsInteger          := Modulo.iHotel;
  // Somente Orçado
  dbDemonst.Setfocus;
end;

procedure TfrmConfigPOA.CmeCadastroFind(Sender: TObject);
begin
  if MontaSelect.RetornouValor then
    qry.Locate('IDLRELATELEMDEMO',StrToInt(MontaSelect.ValoresChave[0]),[]);
end;

procedure TfrmConfigPOA.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('IDHOTEL = '+IntToStr(Modulo.iHotel));

  FTextoSQL := ' select IDLRELATELEMDEMO, IDHOTEL, IDLINHARELAT,        '+
               ' IDDEMONSTRATIVO, IDELEMDEMONSTRAT from LRELATXELEMDEMO '+
               ' WHERE IDHOTEL = :IDHOTEL ';
  FieldAtual := 'IDLINHARELAT';
  OrderDesc  := False;

  qry.Close;
  qry.ParamByName('IDHOTEL').AsInteger := Modulo.iHotel;
  qry.Open;

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

end;

procedure TfrmConfigPOA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qry.Close;
  qryDemonst.Close;
  qryElemDemo.Close;
end;

procedure TfrmConfigPOA.dbGrdTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  if FieldAtual = AFieldName then
    OrderDesc := not OrderDesc
  else OrderDesc := False;
  FieldAtual := AFieldName;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(FTextoSQL + ' ORDER BY '+AFieldName);
  if OrderDesc then
    qry.SQL.Add('DESC');
  qry.ParamByName('IDHOTEL').AsInteger := Modulo.iHotel;
  qry.Open;
end;

procedure TfrmConfigPOA.bbtnConfirmarClick(Sender: TObject);
begin
//  if qry.FieldByName('IDLRELATELEMDEMO').IsNull then Exit;

  if qry.FieldByName('IDDEMONSTRATIVO').IsNull then
  begin
    MsgDlg('Obrigatório a escolha do demonstrativo.',LerMensagem(2),mtError,[mbOk],0);
    ModalResult := mrNone;
    dbDemonst.SetFocus;
    Exit;
  end;

  if qry.FieldByName('IDELEMDEMONSTRAT').IsNull then
  begin
    MsgDlg('Obrigatório a escolha do elemento do demonstrativo.',LerMensagem(2),mtError,[mbOk],0);
    ModalResult := mrNone;
    dblkElemDemo.SetFocus;
    Exit;
  end;

  if not qryElemDemo.Locate('IDDEMONSTRATIVO; IDELEMDEMONSTRAT',
         VarArrayOf([qry.FieldByName('IDDEMONSTRATIVO').AsInteger,
                     qry.FieldByName('IDELEMDEMONSTRAT').AsInteger]),[])
  then begin
    MsgDlg('Obrigatório a escolha do elemento do demonstrativo.',LerMensagem(2),mtError,[mbOk],0);
    ModalResult := mrNone;
    dblkElemDemo.SetFocus;
    Exit;
  end;

  if qry.FieldByName('IDLINHARELAT').IsNull then
  begin
    MsgDlg('Obrigatório a escolha da linha do relatório.',LerMensagem(2),mtError,[mbOk],0);
    ModalResult := mrNone;
    dbcbLinhas.SetFocus;
    Exit;
  end;

  if (qry.FieldByName('FLGRATEIO').AsString <> 'N') and
     (qry.FieldByName('FLGRATEIO').AsString <> 'S') then
    qry.FieldByName('FLGRATEIO').AsString := 'N';

  inherited;
end;

procedure TfrmConfigPOA.dbDemonstExit(Sender: TObject);
begin
  inherited;
  with qryElemDemo do
  begin
    Close;
    ParamByName('IDDEMO').AsInteger := qryDemonst.FieldByName('IDDEMONSTRATIVO').AsInteger;
    Open;
  end;
end;

end.
