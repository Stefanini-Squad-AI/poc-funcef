unit FCadAlteradorContribCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  wwdbedit, DBCtrls, wwdblook, CmEventosCadastro, ImgList;

type
  TfrmCadAlteradorContribCS = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label2: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryRegra: TwwQuery;
    qryAlterador: TwwQuery;
    dbrgrpAtrasoDevol: TDBRadioGroup;
    Label4: TLabel;
    dblkpcmbAlterador: TwwDBLookupCombo;
    dbchkDesativa: TDBCheckBox;
    GroupBox3: TGroupBox;
    dblkpcmbRegra: TwwDBLookupCombo;
    wwDBLookupCombo3: TwwDBLookupCombo;
    qryTipoRegra: TwwQuery;
    qryAux: TwwQuery;
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure dbrgrpAtrasoDevolClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure wwDBLookupCombo3CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCadAlteradorContribCS: TfrmCadAlteradorContribCS;

implementation

uses UMensErro, UDataBase;

{$R *.DFM}

procedure TfrmCadAlteradorContribCS.CmeCadastroFind(Sender: TObject);
var  sIdPlanAss, sIdContribuicao : string;
begin
  if (MontaSelect.ValoresChave.Count > 0)
     and (MontaSelect.ValoresChave[0] <> '') then
  begin
     sIdPlanAss      := MontaSelect.ValoresChave[0];
     sIdContribuicao := MontaSelect.ValoresChave[1];

     qry.Close;
     qry.ParamByName('IdPlanAss').Value := StrToIntDef(sIdPlanAss,0);
     qry.ParamByName('IdContribuicao').Value := StrToIntDef(sIdContribuicao,0);
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('IdPlanAss').Value      := StrToIntDef(sIdPlanAss,0);
     qryDet.ParamByName('IdContribuicao').Value := StrToIntDef(sIdContribuicao,0);
     qryDet.Open;
  end;
end;

procedure TfrmCadAlteradorContribCS.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryAlterador.Close;
  qryAlterador.ParamByName('RecPag').AsString := 'R';
  qryAlterador.Open;

  dbrgrpAtrasoDevol.ItemIndex := 0;
  qryDet.FieldByName('FLGCOBRA').AsInteger := 1;
end;

procedure TfrmCadAlteradorContribCS.CmeDetalheEdit(Sender: TObject);
var idTipoRegra: integer;
begin
   inherited;
   if qryDet.FieldByName('FLGCOBRA').AsString = '' then
     qryDet.FieldByName('FLGCOBRA').AsInteger := 0;

   qryaux.close;
   qryaux.sql.clear;
   qryaux.sql.Add
     ('SELECT IDTIPOREGRA'+
       ' FROM REGRA '+
      ' WHERE (IDREGRA = '+qryDet.FieldByName('IDREGRACALCULO').AsString+')');
   qryaux.open;
   idTipoRegra := qryaux.FieldByName('IDTIPOREGRA').asinteger;
   qryRegra.close;
   qryRegra.paramByName('IDTIPOREGRA').asinteger := idTipoRegra;
   qryRegra.open;
   wwDBLookupCombo3.LookupValue := intToStr(idTipoRegra);
   wwDBLookupCombo3.RefreshDisplay;
   dblkpcmbRegra.enabled := true;
end;

procedure TfrmCadAlteradorContribCS.CmeCadastroConfirma(Sender: TObject);
begin
  if (pnlControlesDet.Showing) then
  begin
    case qryDet.state of
      dsInsert:
        begin
          (* Testa campos obrigatórios *)
          if (Trim(dblkpcmbAlterador.Text) = '')
             and (Trim(dblkpcmbRegra.Text) = '') then
            bbtnCancelarDetClick(Self) (* Cancela caso nada tenha sido digitado *)
          else
          begin
            Screen.Cursor := crDefault;
            (* Grava ou força erro *)
            bbtnOkDetClick(Self);
            (* Verifica se existe campo obrigatório não preenchido *)
            if (Trim(dblkpcmbAlterador.Text) = '')
               and (Trim(dblkpcmbRegra.Text) = '') then
              bbtnVoltarDetClick(Self)
            else
              exit;
          end; {else}
        end; {Case of dsInsert}
      dsEdit:
        begin
          Screen.Cursor := crDefault;
          (* grava ou força erro *)
          bbtnOkDetClick(Self);
        end; {dsEdit}
    end; {Case}
  end; {If}
  inherited;

  try
      AplicaAlteracoes([qryDet]);
  except
     raise;
  end;
end;

procedure TfrmCadAlteradorContribCS.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IdPlanAss').Value  := 0;
  qry.ParamByName('IdContribuicao').Value := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IdPlanAss').Value  := 0;
  qryDet.ParamByName('IdContribuicao').Value := 0;
  qryDet.Open;

  qryRegra.Close;
  qryRegra.Open;

  qryAlterador.Close;
  qryAlterador.ParamByName('RecPag').AsString := 'R';
  qryAlterador.Open;
end;

procedure TfrmCadAlteradorContribCS.dbrgrpAtrasoDevolClick(
  Sender: TObject);
begin
  inherited;
  qryAlterador.Close;
  if dbrgrpAtrasoDevol.ItemIndex = 0 then
    qryAlterador.ParamByName('recpag').AsString := 'R'
  else qryAlterador.ParamByName('recpag').AsString := 'P';
  qryAlterador.Open;
end;

procedure TfrmCadAlteradorContribCS.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryDet.Active then Exit;
  qryAlterador.Close;
  if qryDet.FieldByName('FLGATRASO').AsInteger = 1 then
    qryAlterador.ParamByName('recpag').AsString := 'R'
  else qryAlterador.ParamByName('recpag').AsString := 'P';
  qryAlterador.Open;
end;

procedure TfrmCadAlteradorContribCS.bbtnOkDetClick(Sender: TObject);
begin
  if Trim(dblkpcmbAlterador.Text) = '' then
  begin
    MsgDlg('Alterador não selecionado.','Erro',mtError,[mbOk,mbHelp],0);
    dblkpcmbAlterador.SetFocus;
    abort;
  end;

  if Trim(dblkpcmbRegra.Text) = '' then
  begin
     MsgDlg('Regra não selecionada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbRegra.SetFocus;
     abort;
  end;
  inherited;
end;

procedure TfrmCadAlteradorContribCS.qryDetBeforePost(DataSet: TDataSet);
begin
  if dbrgrpAtrasoDevol.ItemIndex = 0 then
  begin
    qryDet.FieldByName('flgatraso').Asinteger := 1;
    qryDet.FieldByName('flgdevol').Asinteger  := 0;
  end
  else
  begin
    qryDet.FieldByName('flgatraso').Asinteger := 0;
    qryDet.FieldByName('flgdevol').Asinteger  := 1;
  end;

  qryDet.FieldByName('IdPlanAss').AsInteger := qry.FieldByName('IdPlanAss').AsInteger;
  qryDet.FieldByName('IdContribuicao').AsInteger := qry.FieldByName('IdContAss').AsInteger;
  qryDet.FieldByName('Descricao').AsString := qryAlterador.FieldByName('Descricao').AsString;
  inherited;
end;

procedure TfrmCadAlteradorContribCS.wwDBLookupCombo3CloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryRegra.close;
  qryRegra.ParamByName('IDTIPOREGRA').asInteger := qryTipoRegra.FieldByname('IDTIPOREGRA').asInteger;
  qryRegra.open;
  dblkpcmbRegra.enabled := true;
end;

procedure TfrmCadAlteradorContribCS.FormCreate(Sender: TObject);
begin
  inherited;
  dblkpcmbRegra.text := '';
end;

end.
