unit FCadFuncaoSemGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, wwdbedit, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmCadFuncaoSemGrupo = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    updDet: TUpdateSQL;
    qryDet: TwwQuery;
    qryDetDATAEFETIVACAO: TDateTimeField;
    qryDetIDFAIXASALEXT: TFloatField;
    qryDetIDCARGOEXT: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetFLGPCC: TFloatField;
    qryDetVALOR: TFloatField;
    lblDtEfetivacao: TLabel;
    dbdeDataEfetivacao: TCMDateTimePicker;
    lblValor: TLabel;
    dbeValor: TDBEdit;
    Panel1: TPanel;
    stPatro: TStaticText;
    stNomePatro: TStaticText;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncaoSemGrupo: TfrmCadFuncaoSemGrupo;

implementation

uses FPrincipal, UDataBase, UMensErro, UAdmPREV;

{$R *.DFM}

procedure TfrmCadFuncaoSemGrupo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    qry.Close;
    qry.ParamByName('IDPESSJUR').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qry.ParamByName('IDCARGOEXT').Value := StrToInt(MontaSelect.ValoresChave[1]);
    qry.Open;

    qryDet.Close;
    qryDet.ParamByName('IDPESSJUR').Value    := qry.FieldByName('IDPESSJUR').AsInteger;
    qryDet.ParamByName('IDCARGOEXT').Value   := qry.FieldByName('IDCARGOEXT').AsInteger;
    qryDet.Open;

  end;

end;

procedure TfrmCadFuncaoSemGrupo.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  try
      AplicaAlteracoes([qryDet]);
  except
      raise;
  end;

end;

procedure TfrmCadFuncaoSemGrupo.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dbdeDataEfetivacao.Text = '' then
  begin
    MsgDlg('Data de Efetivação','Erro',mtError,[mbOk,mbHelp],0);
    dbdeDataEfetivacao.SetFocus;
    Abort;
  end;

  if dbeValor.Text = '' then
  begin
    MsgDlg('Valor não preenchido','Erro',mtError,[mbOk,mbHelp],0);
    dbeValor.SetFocus;
    Abort;
  end;

  if qryDet.State = dsInsert then
  begin
    qryDet.FieldByName('IDPESSJUR').AsInteger     := qry.FieldByName('IDPESSJUR').AsInteger;
    qryDet.FieldByName('IDCARGOEXT').AsInteger   := qry.FieldByName('IDCARGOEXT').AsInteger;
    qryDet.FieldByName('IDFAIXASALEXT').AsInteger := LeUltRegistro(nil,'FAIXAFUNCAO');
  end;
  qryDet.FieldByName('VALOR').AsFloat     := StrToFloat(ClienteNumero(dbeValor.Text));
end;

procedure TfrmCadFuncaoSemGrupo.FormShow(Sender: TObject);
begin
  inherited;

  qry.Close;
  qry.ParamByName('IDPESSJUR').Value := frmPrincipal.liIdPessJurGrupo;
  qry.ParamByName('IDCARGOEXT').Value := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value      := frmPrincipal.liIdPessJurGrupo;
  qryDet.ParamByName('IDCARGOEXT').Value    := qry.ParamByName('IDCARGOEXT').Value;
  qryDet.Open;

  stNomePatro.Caption:=frmPrincipal.sNomepatroGrupo;
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('CARGOEXT.IDPESSJUR = '+ intToStr(frmPrincipal.liIdPessJurGrupo));
  MontaSelect.Filtro.Add('TIPO = ''F'' ');
end;



end.
