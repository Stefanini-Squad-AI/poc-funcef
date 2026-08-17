unit FCadCapSegAss;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Db, StdCtrls, Mask, wwdbedit, CmEventosCadastro,
  ImgList, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwdatsrc,
  Wwquery, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  DBCtrls, Wwdotdot, Wwdbcomb, uDataBase, TREdit;

type
  TFRMCadCapSegAss = class(TfrmCadMestreDetalheCS)
    DbEdtPlanoAss: TwwDBEdit;
    Label1: TLabel;
    qryDet: TwwQuery;
    qryDetIDCAPSEGASS: TFloatField;
    qryDetIDPLANASS: TFloatField;
    qryDetTIPOSEG: TStringField;
    qryDetCAPITALMN: TFloatField;
    qryDetCAPITALIP: TFloatField;
    qryDetCAPITALMA: TFloatField;
    qryDetPREMIOFXA: TFloatField;
    qryDetPREMIOFXB: TFloatField;
    qryDetPREMIOFXC: TFloatField;
    qryDetPREMIOFXD: TFloatField;
    qryDetDESCPLANO: TStringField;
    qryDetDTVIGENCIA: TDateTimeField;
    qryDetFLGVIGENCIA: TStringField;
    qryDetTRGDTINCLUSAO: TDateTimeField;
    qryDetTRGUSERINCLUSAO: TStringField;
    qryDetORDEM: TFloatField;
    wwDBEdit2: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    wwDBDateTimePicker1: TwwDBDateTimePicker;
    UpdDet: TUpdateSQL;
    qryAux: TwwQuery;
    qryIDPLANASS: TFloatField;
    qryNOME: TStringField;
    wwDBComboBox1: TwwDBComboBox;
    dbreValorOutros: TDBRealEdit;
    DBRealEdit1: TDBRealEdit;
    DBRealEdit2: TDBRealEdit;
    DBRealEdit3: TDBRealEdit;
    DBRealEdit4: TDBRealEdit;
    DBRealEdit5: TDBRealEdit;
    DBRealEdit6: TDBRealEdit;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure wwDBComboBox1Change(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    sTipoPlano, sIdPlanAss, sOrdem : String;
  public
    { Public declarations }
  end;

var
  FRMCadCapSegAss: TFRMCadCapSegAss;

implementation

{$R *.DFM}

procedure TFRMCadCapSegAss.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    qry.paramByName('IDPLANASS').asInteger := strToIntDef(montaSelect.ValoresChave[0], -1);
    qry.Open;
    DbEdtPlanoAss.Text := montaSelect.ValoresChave[1];
    qryDet.Close;
    qryDet.ParamByName('IDPLANASS').asInteger := strToIntDef(montaSelect.ValoresChave[0], -1);
    qryDet.Open;
    sIdPlanAss := qryDetIDPLANASS.asString;
    sTipoPlano := qryDetTIPOSEG.asString;
    sOrdem     := qryDetORDEM.asString;
    qry.edit;
  end;
end;

procedure TFRMCadCapSegAss.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  qryDet.ApplyUpdates;
  qryDet.Close;
  qryDet.Open;
end;

procedure TFRMCadCapSegAss.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  bbtnCancelarDetClick(Sender);
end;

procedure TFRMCadCapSegAss.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
{  qryAux.Close;
  qryAux.Sql.Text := ' SELECT * FROM CAPSEGASS '+
                     ' WHERE IDPLANASS = ' + sIdPlanAss + ' AND '+
                     ' TIPOSEG = ' + quotedStr(sTipoPlano) +
                     ' AND FLGVIGENCIA = 1 ';

  qryAux.Open;}
{
  if not qryAux.IsEmpty then
  begin
              }

  qryDetIDCAPSEGASS.asInteger := LeUltRegistro(nil, 'CAPSEGASS');
  qryDetIDPLANASS.asInteger   := strToInt(sIdPlanAss);
  qryDetFLGVIGENCIA.asInteger := 1;
  qryAux.Close;
{  qryAux.Sql.Text := ' SELECT * FROM CAPSEGASS '+
                       ' WHERE IDPLANASS = ' + sIdPlanAss + ' AND '+
                       ' trim(TIPOSEG) = ' + quotedStr(trim(sTipoPlano));
}
//  qryAux.Open;
//  sOrdem := qryAux.fieldByName('ORDEM').asString;
//  qryDetORDEM.asInteger       := StrToInt(sOrdem);
  qryDetTIPOSEG.asString      := sTipoPlano;

end;

procedure TFRMCadCapSegAss.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  qryDet.Close;
  qryDet.Open;
end;

procedure TFRMCadCapSegAss.wwDBComboBox1Change(Sender: TObject);
begin
  inherited;
  sIdPlanAss := qry.paramByName('IDPLANASS').asString;
  if (trim(wwDBComboBox1.text) <> '') then
    sTipoPlano := trim(wwDBComboBox1.text);


  if (trim(wwDBComboBox1.text) <> '') and (sIdPlanAss <> '') then
  begin
    qryAux.Close;
    qryAux.Sql.Text := ' SELECT * FROM CAPSEGASS '+
                       ' WHERE IDPLANASS = ' + sIdPlanAss + ' AND '+
                       ' trim(TIPOSEG) = ' + quotedStr(trim(sTipoPlano));
    qryAux.Open;
//    sOrdem := qryAux.fieldByName('ORDEM').asString;
  end;
end;

procedure TFRMCadCapSegAss.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryDet.State = dsInsert then
  begin
  try
      sTipoPlano := trim(wwDBComboBox1.text);
      qryAux.Close;
      qryAux.Sql.Text := ' UPDATE CAPSEGASS '+
                         '  SET FLGVIGENCIA = 0 '+
                         ' WHERE IDPLANASS = ' +  sIdPlanAss  + ' AND '+
                         ' trim(TIPOSEG) = ' + quotedStr(trim(sTipoPlano))+
                         ' AND FLGVIGENCIA = 1 ';
      qryAux.ExecSql;

      qryDetIDPLANASS.asInteger   := strToInt(sIdPlanAss);
      qryDetFLGVIGENCIA.asInteger := 1;
      qryAux.Close;
      qryAux.Sql.Text := ' SELECT * FROM CAPSEGASS '+
                           ' WHERE IDPLANASS = ' + sIdPlanAss + ' AND '+
                           ' trim(TIPOSEG) = ' + quotedStr(trim(sTipoPlano));
      qryAux.Open;

      sOrdem := qryAux.fieldByName('ORDEM').asString;
      qryDetORDEM.asInteger       := StrToIntDef(sOrdem, 0);
      qryDetTIPOSEG.asString      := sTipoPlano;
    except
      qryDet.CancelUpdates;
      qryAux.CancelUpdates;
      showMessage('Erro na Atualização de Dados');
      RollBackTransacao;
      bbtnCancelarClick(self);
    end;
  end;
end;

end.
