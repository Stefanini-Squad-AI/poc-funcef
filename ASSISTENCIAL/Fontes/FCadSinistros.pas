unit FCadSinistros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, DBCtrls, DBGrids, wwdblook, Mask,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmCadSinistros = class(TfrmCadMestreDetalheCS)
    qryInfPlano: TwwQuery;
    qryInfPlanoIDCAPSEGASS: TFloatField;
    qryInfPlanoIDPLANASS: TFloatField;
    qryInfPlanoTIPOSEG: TStringField;
    qryInfPlanoCAPITALMN: TFloatField;
    qryInfPlanoCAPITALIP: TFloatField;
    qryInfPlanoCAPITALMA: TFloatField;
    qryInfPlanoPREMIOFXA: TFloatField;
    qryInfPlanoPREMIOFXB: TFloatField;
    qryInfPlanoPREMIOFXC: TFloatField;
    qryInfPlanoPREMIOFXD: TFloatField;
    qryInfPlanoDESCPLANO: TStringField;
    qryInfPlanoDTVIGENCIA: TDateTimeField;
    qryInfPlanoFLGVIGENCIA: TStringField;
    DsInfPlano: TwwDataSource;
    GroupBox1: TGroupBox;
    dbTPlano: TDBText;
    lblPlanoPrev: TLabel;
    dbTPatro: TDBText;
    lblPatro: TLabel;
    dbTNome: TDBText;
    lblParticipante: TLabel;
    dbTInscricao: TDBText;
    lblInscricao: TLabel;
    dbTMatricula: TDBText;
    lblMatricula: TLabel;
    GroupBox2: TGroupBox;
    dbTPlanassist: TDBText;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    dsBeneficiarios: TDataSource;
    qryBeneficiarios: TQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dblkpcmbSitDependente: TwwDBLookupCombo;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dbeApolice: TDBEdit;
    dbeTipoSinistrro: TDBEdit;
    dbeRamoSinistro: TDBEdit;
    dbeSeguradora: TDBEdit;
    Label15: TLabel;
    dbdeDataMorte: TCMDateTimePicker;
    CMDateTimePicker1: TCMDateTimePicker;
    CMDateTimePicker2: TCMDateTimePicker;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    CMDateTimePicker3: TCMDateTimePicker;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    CMDateTimePicker4: TCMDateTimePicker;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    qryValorPago: TwwQuery;
    dsValorpago: TwwDataSource;
    updValorpago: TUpdateSQL;
    CMDateTimePicker5: TCMDateTimePicker;
    Label8: TLabel;
    dbmValores: TDBMemo;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadSinistros: TFrmCadSinistros;

implementation

Uses
  UDataBase, UmensErro;

{$R *.DFM}

procedure TFrmCadSinistros.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    qry.Close;
    if not qry.Prepared then qry.prepare;
    qry.ParamByName('IDPESSOA').Value    := StrToIntDef(MontaSelect.ValoresChave[0],0);
    qry.ParamByName('IDPESSJUR').Value   := StrToIntDef(MontaSelect.ValoresChave[1],0);
    qry.ParamByName('IDPLANOPREV').Value := StrToIntDef(MontaSelect.ValoresChave[2],0);
    qry.ParamByName('SEQPROPOSTA').Value := StrToIntDef(MontaSelect.ValoresChave[3],0);
    qry.Open;

    qryInfPlano.close;
    if not qryInfPlano.Prepared then qryInfPlano.prepare;
    qryInfPlano.ParamByName('IDPLANASS').Value :=  StrToIntDef(MontaSelect.ValoresChave[5],0);
    qryInfPlano.open;

    qryBeneficiarios.close;
    if not qryBeneficiarios.Prepared then qryBeneficiarios.prepare;
    qryBeneficiarios.ParamByName('TITULAR').Value :=  StrToIntDef(MontaSelect.ValoresChave[0],0);
    qryBeneficiarios.OPEN;

    qryDet.Close;
    if not qryDet.Prepared then qryDet.prepare;
    qryDet.ParamByName('IDTITULAR').Value := StrToIntDef(MontaSelect.ValoresChave[0],0);
    qryDet.ParamByName('IDPESSOA').Value  := StrToIntDef(MontaSelect.ValoresChave[4],0);
    qryDet.Open;

    qryValorPago.close;
    if not qryValorPago.Prepared then qryValorPago.prepare;
    qryValorPago.ParamByName('IDTITULAR').Value := qryBeneficiarios.fieldbyname('IDTITULAR').asInteger;
    qryValorPago.ParamByName('IDPESSOA').Value  := qryBeneficiarios.fieldbyname('IDPESSOA').asInteger;
    qryValorPago.Open;

  end;

end;

procedure TFrmCadSinistros.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qrydet.Insert;

end;

procedure TFrmCadSinistros.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;

  If qryDet.State = dsInsert then
     qryDet.fieldbyname('IDSINISTRO').asInteger := LeUltRegistro(nil,'SINISTROS');

  qryDet.ParamByName('IDTITULAR').Value  := qryBeneficiarios.fieldbyname('IDTITULAR').asInteger;
  qryDet.ParamByName('IDPESSOA').Value   := qryBeneficiarios.fieldbyname('IDPESSOA').asInteger;

  qryDet.FieldByName('NOME').AsString    := qryBeneficiarios.FieldByName('NOME').AsString; //Pend. 17423 - Bruno Bastos

  qryDet.FieldByName('IDTITULAR').Value  := qryBeneficiarios.fieldbyname('IDTITULAR').asInteger;
  qryDet.FieldByName('IDPESSOA').Value   := qryBeneficiarios.fieldbyname('IDPESSOA').asInteger;

  qrydet.Fieldbyname('VLRPAGO').AsString := dbmValores.Text;
end;


procedure TFrmCadSinistros.CmeDetalheConfirma(Sender: TObject);
begin
  if qryDet.State in [dsEdit, dsInsert] then qryDet.Post;
  inherited;
end;

procedure TFrmCadSinistros.bbtnOkDetClick(Sender: TObject);
begin
  If pgctrlDetalhe.ActivePageIndex = 1 then
     qrydet.edit;
  qrydet.post;
  inherited;

end;

procedure TFrmCadSinistros.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  AplicaAlteracoes([qryDet])
end;


procedure TFrmCadSinistros.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  if not qryDet.Active then
     Exit;
end;

end.
