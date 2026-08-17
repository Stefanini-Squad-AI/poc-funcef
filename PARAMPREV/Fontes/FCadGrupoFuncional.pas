// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : qryDet
// Autor(a)    : Hugo Luna
// Pendência   : 24737
// Data        : 24/10/2007
// Descricao   : Retirados os decodes dos campos Piso Mercado e Piso Mercado dos
//               Licensiados na qryDet.
//------------------------------------------------------------------------------
// Rotina      : qryDet
// Autor(a)    : Claudio Faria
// Pendência   : 23047
// Data        : 28/09/2006
// Descricao   : Inclusão do campo Piso de Mercado dos Licenciados
//------------------------------------------------------------------------------
// Rotina      : qryDet
// Autor(a)    : Claudio Faria
// Pendência   : 23045
// Data        : 28/09/2006
// Descricao   : Inclusão do campo Piso de Mercado
//------------------------------------------------------------------------------
// Rotina      : qry
// Autor(a)    : Gleyber
// Pendência   : 18119
// Data        : 29/11/2004
// Descricao   : Acerto na inserção do VALORPCC ou VALORPCS
//------------------------------------------------------------------------------
// Rotina      : qryDetBeforePost, qryDetAfterOpen
// Autor(a)    : Gleyber
// Pendência   : 16277
// Data        : 01/04/2004
// Descricao   : Acerto na visualização do  VALORPCC ou VALORPCS
//------------------------------------------------------------------------------
unit FCadGrupoFuncional;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmCadGrupoFuncional = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Panel1: TPanel;
    stPatro: TStaticText;
    stNomePatro: TStaticText;
    lblCodigo: TLabel;
    lblNome: TLabel;
    dbeCodigo: TDBEdit;
    dbeNome: TDBEdit;
    lblDtEfetivacao: TLabel;
    lblValor: TLabel;
    dbeValor: TDBEdit;
    dbdeDataEfetivacao: TCMDateTimePicker;
    qryDetIDFAIXASALEXT: TFloatField;
    qryDetDATAEFETIVACAO: TDateTimeField;
    qryDetIDGRUPOFUNC: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetFLGPCC: TFloatField;
    qryDetVALORPCC: TFloatField;
    qryDetVALORNAOPCC: TFloatField;
    qryDetVALOR: TFloatField;
    dbePisoMercado: TDBEdit;
    Label1: TLabel;
    dbePisoMercadoLic: TDBEdit;
    Label2: TLabel;
    qryDetPISOMERCADO: TFloatField;
    qryDetPISOMERCADOLIC: TFloatField;
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure qryDetAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    iFLGPCC : Integer; 
  public
    { Public declarations }
  end;

var
  frmCadGrupoFuncional: TfrmCadGrupoFuncional;

implementation

uses FPrincipal, UAdmPrev, UDataBase, UMensErro;

{$R *.DFM}

procedure TfrmCadGrupoFuncional.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbeCodigo.SetFocus;
  
  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value      := frmPrincipal.liIdPessJurGrupo;
  qryDet.ParamByName('IDGRUPOFUNC').Value    := 0;
  qryDet.Open;
end;


procedure TfrmCadGrupoFuncional.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbeCodigo.SetFocus;
end;

procedure TfrmCadGrupoFuncional.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    qry.Close;
    qry.ParamByName('IDPESSJUR').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qry.ParamByName('IDGRUPOFUNC').Value := StrToInt(MontaSelect.ValoresChave[1]);
    qry.Open;

    qryDet.Close;
    qryDet.ParamByName('IDPESSJUR').Value      := qry.FieldByName('IDPESSJUR').AsInteger;
    qryDet.ParamByName('IDGRUPOFUNC').Value    := qry.FieldByName('IDGRUPOFUNC').AsInteger;
    qryDet.Open;
  end;

end;

procedure TfrmCadGrupoFuncional.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  try
      AplicaAlteracoes([qryDet]);
  except
      raise;
  end;

end;

procedure TfrmCadGrupoFuncional.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDPESSJUR').Value := frmPrincipal.liIdPessJurGrupo;
  qry.ParamByName('IDGRUPOFUNC').Value := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value      := frmPrincipal.liIdPessJurGrupo;
  qryDet.ParamByName('IDGRUPOFUNC').Value    := qry.ParamByName('IDGRUPOFUNC').Value;
  qryDet.Open;

  stNomePatro.Caption:=frmPrincipal.sNomepatroGrupo;
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('GRUPOFUNC.IDPESSJUR = '+ intToStr(frmPrincipal.liIdPessJurGrupo));
end;

procedure TfrmCadGrupoFuncional.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if dbeCodigo.Text = '' then
  begin
    MsgDlg('Código não preenchido','Erro',mtError,[mbOk,mbHelp],0);
    dbeCodigo.SetFocus;
    Exit;
  end;

  if dbeNome.Text = '' then
  begin
    MsgDlg('Nome não preenchido','Erro',mtError,[mbOk,mbHelp],0);
    dbeNome.SetFocus;
    Exit;
  end;

  if qry.State = dsInsert
  then begin
     qry.FieldByName('IDPESSJUR').AsInteger   := frmPrincipal.liIdPessJurGrupo;
     qry.FieldByName('IDGRUPOFUNC').AsInteger := LeUltRegistro(nil,'GRUPOFUNC');
  end;

  Accept := True;
end;

procedure TfrmCadGrupoFuncional.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value      := qry.FieldByName('IDPESSJUR').AsInteger;
  qryDet.ParamByName('IDGRUPOFUNC').Value    := qry.FieldByName('IDGRUPOFUNC').AsInteger;
  qryDet.Open;

end;

procedure TfrmCadGrupoFuncional.qryDetBeforePost(DataSet: TDataSet);
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
    qryDet.FieldByName('IDGRUPOFUNC').AsInteger   := qry.FieldByName('IDGRUPOFUNC').AsInteger;
    qryDet.FieldByName('IDFAIXASALEXT').AsInteger := LeUltRegistro(nil,'FAIXAGRUPO');
  end;

  
  If qry.FieldbyName('FLGPCC').AsInteger = 0
  then begin
     qryDet.FieldByName('VALORPCC').AsFloat        := 0;
     qryDet.FieldByName('VALORNAOPCC').AsFloat     := StrToFloat(ClienteNumero(dbeValor.Text));
  end
  else begin
     qryDet.FieldByName('VALORPCC').AsFloat        := StrToFloat(ClienteNumero(dbeValor.Text));
     qryDet.FieldByName('VALORNAOPCC').AsFloat     := 0;
  end;
end;

procedure TfrmCadGrupoFuncional.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  
  qryDet.FieldByName('IDGRUPOFUNC').AsInteger := qry.FieldByName('IDGRUPOFUNC').AsInteger;
  qryDet.FieldByName('IDPESSJUR').AsInteger := qry.FieldByName('IDPESSJUR').AsInteger;
end;

procedure TfrmCadGrupoFuncional.qryDetAfterOpen(DataSet: TDataSet);
begin
  inherited;

end;

end.
