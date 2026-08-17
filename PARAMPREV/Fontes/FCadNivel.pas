(***********************************************************************************
* Autor  : Carlos Eduardo Guedes
* Data   : 15/10/2001
* Motivo : Retirada crítica na inserção de faixas com mesma data.
***********************************************************************************
* Autor  : Carlos Eduardo Guedes
* Data   : 20/11/2001
* Motivo : Mudança do tipo do campo IDNIVEL, devido a um cadastro do Sr. Eugênio
   utilizando decimal. Problema oriundo da FUNCEF.
***********************************************************************************)
unit FCadNivel;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, Mask, DBCtrls,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList,
  ExtCtrls;

type
  TfrmCadNivel = class(TfrmCadMestreDetalheCS)
    lblCodigo: TLabel;
    dbeCodigo: TDBEdit;
    dbdeDataEfetivacao: TCMDateTimePicker;
    lblDataReferencia: TLabel;
    lblValor: TLabel;
    updDet: TUpdateSQL;
    dbeValor: TDBEdit;
    qryDet: TwwQuery;
    Panel1: TPanel;
    stPatro: TStaticText;
    stNomePatro: TStaticText;
    qryFaixaAux: TwwQuery;
    updFaixaAux: TUpdateSQL;
    dsFaixaAux: TwwDataSource;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDNIVEL: TFloatField;
    qryDetIDFAIXASALEXT: TFloatField;
    qryDetDATAEFETIVACAO: TDateTimeField;
    qryDetVALOR: TFloatField;
    qryVerificaNivel: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure qryAfterScroll(DataSet: TDataSet);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadNivel: TfrmCadNivel;

implementation

uses FPrincipal, UAdmPrev, UDataBase, UMensErro, DAPrev, DRelatAdmPrev;

{$R *.DFM}

procedure TfrmCadNivel.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbeCodigo.SetFocus;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value  := frmPrincipal.liIdPessJurNivel;
  qryDet.ParamByName('IDNIVEL').Value    := 0;
  qryDet.Open;

  qryFaixaAux.Close;
  qryFaixaAux.ParamByName('IDPESSJUR').Value  := frmPrincipal.liIdPessJurNivel;
  qryFaixaAux.ParamByName('IDNIVEL').Value    := 0;
  qryFaixaAux.Open;

  // Preencher IdFaixaSalEst com leUltregistro
  // o Código com o codigo do obj qry
  // idpessjur com o da qry
  qry.FieldByName('IDPESSJUR').AsInteger   := frmPrincipal.liIdPessJurNivel;
  qry.FieldByName('IDNIVEL').AsFloat     := LeUltRegistro(nil,'NIVEL');

end;

procedure TfrmCadNivel.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbeCodigo.SetFocus;
end;

procedure TfrmCadNivel.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  begin
    qry.Close;
    qry.ParamByName('IDPESSJUR').Value := StrToInt(MontaSelect.ValoresChave[0]);
    qry.ParamByName('IDNIVEL').Value := StrToFloat(MontaSelect.ValoresChave[1]);
    qry.Open;


    qryDet.Close;
    qryDet.ParamByName('IDPESSJUR').Value      := qry.FieldByName('IDPESSJUR').AsInteger;
    qryDet.ParamByName('IDNIVEL').Value        := qry.FieldByName('IDNIVEL').AsFloat;
    qryDet.Open;

    qryFaixaAux.Close;
    qryFaixaAux.ParamByName('IDPESSJUR').Value      := qry.FieldByName('IDPESSJUR').AsInteger;
    qryFaixaAux.ParamByName('IDNIVEL').Value        := qry.FieldByName('IDNIVEL').AsFloat;
    qryFaixaAux.Open;
  end;
end;

procedure TfrmCadNivel.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   qryFaixaAux.CancelUpdates;
   try
      AplicaAlteracoes([qryDet]);
   except
      raise;
   end;

end;

procedure TfrmCadNivel.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;
   if qryFaixaAux.State in [dsInsert, dsEdit]
   then qryFaixaAux.Post;
end;


procedure TfrmCadNivel.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDPESSJUR').Value := frmPrincipal.liIdPessJurNivel;
  qry.ParamByName('IDNIVEL').Value := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value      := frmPrincipal.liIdPessJurNivel;
  qryDet.ParamByName('IDNIVEL').Value        := qry.ParamByName('IDNIVEL').Value;
  qryDet.Open;

  qryFaixaAux.Close;
  qryFaixaAux.ParamByName('IDPESSJUR').Value      := frmPrincipal.liIdPessJurNivel;
  qryFaixaAux.ParamByName('IDNIVEL').Value        := qry.ParamByName('IDNIVEL').Value;
  qryFaixaAux.Open;

  stNomePatro.Caption:=frmPrincipal.sNomepatroNivel;
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('NIVEL.IDPESSJUR = '+ intToStr(frmPrincipal.liIdPessJurNivel));
end;

procedure TfrmCadNivel.qryBeforePost(DataSet: TDataSet);
begin
  if dbeCodigo.Text = '' then
  begin
    MsgDlg('Código não preenchido','Erro',mtError,[mbOk,mbHelp],0);
    dbeCodigo.SetFocus;
    Abort;
  end;

  if qry.State = dsInsert
  then begin
     
     with qryVerificaNivel do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT CODIGO FROM NIVEL '+
                ' WHERE  IDPESSJUR = '+IntToStr(frmPrincipal.liIdPessJurNivel) +
                ' AND    CODIGO    = '+ QuotedStr(qry.FieldByName('CODIGO').AsString));
        Open;
        if not IsEmpty
        then begin
           MsgDlg('Já existe um nível cadastrado com este código para esta patrocinadora. Verifique. ','Erro',mtError,[mbOk,mbHelp],0);
           dbeCodigo.SetFocus;
           Abort;
        end;
        Close;
     end;
  end;

  inherited;
end;

procedure TfrmCadNivel.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;

  if dbdeDataEfetivacao.Text = '' then
  begin
    MsgDlg('Data de Efetivação não preenchida','Erro',mtError,[mbOk,mbHelp],0);
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
    qryFaixaAux.First;


    qryDet.FieldByName('IDPESSJUR').AsInteger      := qry.FieldByName('IDPESSJUR').AsInteger;
    qryDet.FieldByName('IDNIVEL').AsString         := qry.FieldByName('IDNIVEL').AsString;
    qryDet.FieldByName('IDFAIXASALEXT').AsInteger  := LeUltRegistro(dtmRelatAdmPrev.qryAux,'FAIXANIVEL');
  end;

  qryDet.FieldbyName('DataEfetivacao').AsDateTime := Trunc(dbdeDataEfetivacao.Date);

  if qryDet.State = dsInsert
  then begin
     qryFaixaAux.Insert;
     qryFaixaAux.FieldByName('IDPESSJUR').AsInteger       := qryDet.FieldByName('IDPESSJUR').AsInteger;
     qryFaixaAux.FieldByName('IDNIVEL').AsFloat         := qryDet.FieldByName('IDNIVEL').AsFloat;
     qryFaixaAux.FieldByName('IDFAIXASALEXT').AsInteger   := qryDet.FieldByName('IDFAIXASALEXT').AsInteger;
     qryFaixaAux.FieldByName('DATAEFETIVACAO').AsDateTime := qryDet.FieldByName('DATAEFETIVACAO').AsDateTime;
     qryFaixaAux.FieldByName('VALOR').AsFloat             := qryDet.FieldByName('VALOR').AsFloat;
  end
  else if qryDet.State = dsEdit
       then begin
          qryFaixaAux.Edit;
          qryFaixaAux.FieldByName('IDPESSJUR').AsInteger       := qryDet.FieldByName('IDPESSJUR').AsInteger;
          qryFaixaAux.FieldByName('IDNIVEL').AsFloat           := qryDet.FieldByName('IDNIVEL').AsFloat;
          qryFaixaAux.FieldByName('IDFAIXASALEXT').AsInteger   := qryDet.FieldByName('IDFAIXASALEXT').AsInteger;
          qryFaixaAux.FieldByName('DATAEFETIVACAO').AsDateTime := qryDet.FieldByName('DATAEFETIVACAO').AsDateTime;
          qryFaixaAux.FieldByName('VALOR').AsFloat             := qryDet.FieldByName('VALOR').AsFloat;
       end;
end;

procedure TfrmCadNivel.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').Value      := qry.FieldByName('IDPESSJUR').AsInteger;
  qryDet.ParamByName('IDNIVEL').Value        := qry.FieldByName('IDNIVEL').AsFloat;
  qryDet.Open;

  qryFaixaAux.Close;
  qryFaixaAux.ParamByName('IDPESSJUR').Value      := qry.FieldByName('IDPESSJUR').AsInteger;
  qryFaixaAux.ParamByName('IDNIVEL').Value        := qry.FieldByName('IDNIVEL').AsFloat;
  qryFaixaAux.Open; 
end;

end.
