unit FCadProvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, Db, DBTables, Wwquery, StdCtrls, DBCtrls, ExtCtrls,
  wwdblook, Mask, wwdbedit, cmseldlg, wwidlg, Wwdatsrc, MAHlpBtn, Buttons,
  ComCtrls, ToolWin, Grids, Wwdbigrd, Wwdbgrid, TB97, TB97Ctls, TB97Tlbr,
  Wwdotdot, Wwdbcomb, IvDictio, IvMulti, IvEMulti, FCadastroGridCS,
  CmEventosCadastro, wwDialog, ImgList;
/////////////////////////////////////////
//ATENÇÃO: objeto DBNAV... fora da tela//
/////////////////////////////////////////
type
  TfrmCadProvento = class(TfrmCadastroGrid)
    Label2: TLabel;
    Label3: TLabel;
    dblkcmbRegra: TwwDBLookupCombo;
    dbedDescricao: TwwDBEdit;
    dbckINSS: TDBCheckBox;
    dbckFGTS: TDBCheckBox;
    dbckIRRF: TDBCheckBox;
    qryRegra: TwwQuery;
    qry: TwwQuery;
    qryIDPROVENTO: TFloatField;
    qryIDREGRA: TFloatField;
    qryFLGDESCONTO: TFloatField;
    qryFLGIRRF: TFloatField;
    qryFLGFGTS: TFloatField;
    qryFLGINSS: TFloatField;
    qrycalcRegra: TStringField;
    qryAux: TwwQuery;
    pnlPrioridadeDesconto: TPanel;
    Label1: TLabel;
    dbedNumPrioridade: TDBEdit;
    qryNUMPRIORIDADE: TFloatField;
    qryFLGINTERNO: TFloatField;
    qryDESCRICAO: TStringField;
    qryFLGCONSOLIDA: TFloatField;
    qryFLGCONSTAFOLHA: TFloatField;
    qryFLGOBRIGAFAVOREC: TFloatField;
    dbchkConsolida: TDBCheckBox;
    dbchkObrigaFavorecido: TDBCheckBox;
    dbchkConstaFolha: TDBCheckBox;
    qryFLGESPECIAL: TFloatField;
    dbrgrpTipo: TDBRadioGroup;
    dbrgrpDesconto: TDBRadioGroup;
    GroupBox1: TGroupBox;
    dbchkCompoeSalPart: TDBCheckBox;
    dbchkCompoeSalBenef: TDBCheckBox;
    qryFLGRAIS: TFloatField;
    qryFLGSALFAMILIA: TFloatField;
    qryFLGDECIMOTERCEIRO: TFloatField;
    qryFLGFERIAS: TFloatField;
    qryFLGRESCISAO: TFloatField;
    qryFLGUSO: TStringField;
    qryIDBENEFSALAR: TFloatField;
    qryFLGCOMPOESALPART: TFloatField;
    qryFLGCOMPOESALBENEF: TFloatField;
    DBCheckBox1: TDBCheckBox;
    qryFLGCOMPOEREMTOTAL: TFloatField;
    Label4: TLabel;
    dbcmbTpRubrica: TwwDBComboBox;
    qryFLGTPRUBRICA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure qryCalcFields(DataSet: TDataSet);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure dbrgrpDescontoClick(Sender: TObject);
    procedure qryAfterEdit(DataSet: TDataSet);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
   // function  FazerOpenAutomatico : Boolean; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProvento: TfrmCadProvento;

implementation

uses UDataBase, USistema, UMensErro;

{$R *.DFM}

(*
function TfrmCadProvento.FazerOpenAutomatico : Boolean;
begin
  result := false;
end;
*)

procedure TfrmCadProvento.FormCreate(Sender: TObject);
begin
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add
    ('SELECT IDPROVENTO,FLGDESCONTO,IDREGRA,DESCRICAO,FLGIRRF,FLGFGTS, '+
            'FLGINSS,NUMPRIORIDADE,FLGINTERNO,FLGCONSOLIDA,FLGCONSTAFOLHA, '+
            'FLGOBRIGAFAVOREC,FLGRAIS,FLGSALFAMILIA,FLGDECIMOTERCEIRO, '+
            'FLGFERIAS,FLGRESCISAO,FLGUSO,IDBENEFSALAR,FLGESPECIAL,FLGINCIDECONTRIB, '+
            'FLGINCIDESALPART,FLGCOMPOESALPART,FLGCOMPOESALBENEF,FLGCOMPOEREMTOTAL, FLGTPRUBRICA '+
       'FROM '+Sistema.PrefixoServidor+'PROVDESC '+
      'ORDER BY DESCRICAO');
  inherited;
  qryRegra.Close;
  qryRegra.open;
end;

procedure TfrmCadProvento.qryCalcFields(DataSet: TDataSet);
begin
  inherited;
  if not qry.Active then
    Exit;
  if not qryRegra.Active then
    Exit;
  if qryRegra.Locate('IdRegra',qry.FieldByName('IdRegra').AsInteger,
                     [loCaseInsensitive, loPartialKey]) then
    qry.FieldByName('calcRegra').AsString := qryRegra.FieldbyName('NomeRegra').AsString
  else
    qry.FieldByName('calcRegra').AsString := '';
end;

procedure TfrmCadProvento.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //  qry.fieldbyname('IdProvento').AsInteger := LeUltRegistro(qryaux,'PROVDESC');

  //Limpa os Campos p/ nova inclusao}
  qry.fieldbyname('flgIRRF').AsInteger := 0;
  qry.fieldbyname('flgFGTS').AsInteger := 0;
  qry.fieldbyname('flgINSS').AsInteger := 0;
  qry.fieldbyname('flgCompoeSalPart').AsInteger := 0;
  qry.fieldbyname('flgCompoeSalBenef').AsInteger := 0;
  qry.fieldbyname('flgCompoeSalBenef').AsInteger := 0;
  dbckINSS.Checked := false;
  dbckFGTS.Checked := false;
  dbckIRRF.Checked := false;
  dbchkCompoeSalPart.Checked := false;
  dbchkCompoeSalBenef.Checked := false;
  dbrgrpDesconto.ItemIndex := 0;
  dbrgrpTipo.ItemIndex := 0;
end;

procedure TfrmCadProvento.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qry.Active then
    exit;

  if qry.FieldByName('flgDesconto').AsInteger = 0 then
  begin
    pnlPrioridadeDesconto.Visible := false;
    dbckIRRF.Visible := true // nao é desconto -> tem IRRF
  end
  else
  begin
    pnlPrioridadeDesconto.Visible := true;
    dbckIRRF.Visible := true; // é desconto -> TEM IRRF
  end;
end;

procedure TfrmCadProvento.dbrgrpDescontoClick(Sender: TObject);
begin
  inherited;
  if dbrgrpDesconto.ItemIndex = 0 then
  begin// Provento
    dbedNumPrioridade.Text := '';
    pnlPrioridadeDesconto.Visible := false;
    dbckIRRF.Visible := true; // nao é desconto -> tem IRRF
    dbchkConstaFolha.Visible := False;
  end
  else
  begin
    if dbrgrpDesconto.ItemIndex = 1 then // Desconto
    begin
      pnlPrioridadeDesconto.Visible := true;
      dbckIRRF.Checked := false;
      dbckIRRF.Visible := true; // é desconto -> tem IRRF (alterado por Pierre em 13/03)
      dbchkConstaFolha.Visible := false;
    end;
  end;
end;

procedure TfrmCadProvento.qryAfterEdit(DataSet: TDataSet);
begin
  inherited;
  if qry.FieldByName('flgDesconto').AsInteger = 0 then // Provento
  begin
    pnlPrioridadeDesconto.Visible := false;
    dbckIRRF.Visible := true; // nao é desconto -> tem IRRF
    dbchkConstaFolha.Visible := false;
  end
  else
  begin
    if qry.FieldByName('flgDesconto').AsInteger = 1 then //Desconto
    begin
      pnlPrioridadeDesconto.Visible := true;
      dbckIRRF.Visible := true; // é desconto -> nao tem IRRF
      dbchkConstaFolha.Visible := false;
    end;
  end;
end;

procedure TfrmCadProvento.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qry.State = dsInsert then
    qry.fieldbyname('IdProvento').AsInteger := LeUltRegistro(qryaux,'PROVDESC');

  qry.FieldByName('flgInterno').AsInteger := 0;

  if dblkcmbRegra.Text = '' then
    qry.FieldByName('IDREGRA').AsString := '';
end;

procedure TfrmCadProvento.FormActivate(Sender: TObject);
begin
  inherited;
  qryRegra.Close;
  qryRegra.open;
  if not qry.Active then
    qry.Open;
  //  dbrgrpDesconto.ItemIndex := 0;
end;

procedure TfrmCadProvento.dsStateChange(Sender: TObject);
begin
  inherited;
  if qry.State in [dsinsert, dsedit] then
    dbedDescricao.SetFocus;
end;

procedure TfrmCadProvento.bbtnConfirmarClick(Sender: TObject);
begin
  // Testar campos obrigatorios
  if Trim(dbedDescricao.Text) = '' then
  begin
    MsgDlg('Nome da Rubrica não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    exit;
  end;

  if dbrgrpDesconto.ItemIndex < 0 then
  begin
    MsgDlg('Finalidade da Rubrica não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    exit;
  end;

  if dbrgrpTipo.ItemIndex < 0 then
  begin
    MsgDlg('Tipo da Rubrica não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    exit;
  end;
  inherited;
end;

procedure TfrmCadProvento.sbtnApagarClick(Sender: TObject);
begin
  if qry.FieldbyName('flgInterno').AsInteger = 1 then
  begin
    MsgDlg('Esta rubrica não pode ser excluída.','Erro',mtError,[mbOk,mbHelp],0);
    exit;
  end;
  inherited;
end;

end.
