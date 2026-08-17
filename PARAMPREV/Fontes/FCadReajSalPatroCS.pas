// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 26.10.2004
// Alteração   : Permitir cadastrar percentual e regra ao mesmo tempo,
//               pois para reajustar o SRB da FUNCEF isto é necessário
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 25.11.2003
// Alteração   : Inclusao da Opção de Reajustar Salário ou Cargo
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 16.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FCadReajSalPatroCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, TREdit, wwdblook, Mask, wwdbedit, DBCtrls;

type
  TfrmCadReajSalPatroCS = class(TfrmCadMestreDetalheCS)
    lblPatro: TLabel;
    lblPlano: TLabel;
    dbedPatrocinadora: TwwDBEdit;
    dbedPlano: TwwDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dbedMesReaj: TwwDBEdit;
    qryDetMESREAJ: TStringField;
    qryDetIDRGREAJ: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetPERCENTUAL: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    lblAnoMesReaj: TLabel;
    rgrpReajuste: TRadioGroup;
    grpRegra: TGroupBox;
    lblRegra: TLabel;
    grpPercentual: TGroupBox;
    Percentual: TLabel;
    Label2: TLabel;
    dbedPercentual: TDBRealEdit;
    qryRegra: TwwQuery;
    qryDetNOMEREGRA: TStringField;
    dblkpcmbRegra: TwwDBLookupCombo;
    rgrpTpReajuste: TDBRadioGroup;
    qryDetFLGTPREAJUSTE: TFloatField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure rgrpReajusteClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadReajSalPatroCS: TfrmCadReajSalPatroCS;

implementation

uses UMensErro, UDataBase, USistema, UAdmPrev;

{$R *.DFM}

procedure TfrmCadReajSalPatroCS.FormActivate(Sender: TObject);
begin
  inherited;

  qryRegra.Close;
  qryRegra.Open;

  qry.Close;
  qry.ParamByName('IDPESSJUR').AsInteger   := 0;
  qry.ParamByName('IDPLANOPREV').AsInteger := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').AsInteger   := 0;
  qryDet.ParamByName('IDPLANOPREV').AsInteger := 0;
  qryDet.Open;

end;

procedure TfrmCadReajSalPatroCS.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if not MontaSelect.RetornouValor then Exit;
  qry.Close;
  qry.ParamByName('IDPESSJUR').AsInteger   := StrToInt(MontaSelect.ValoresChave[0]);
  qry.ParamByName('IDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').AsInteger   := qry.FieldByName('IDPESSJUR').AsInteger;
  qryDet.ParamByName('IDPLANOPREV').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;
  qryDet.Open;

end;                                            


procedure TfrmCadReajSalPatroCS.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dbedMesReaj.SetFocus;
  rgrpReajuste.ItemIndex := 0;
  grpRegra.Visible       := True;
  grpPercentual.Visible  := False;
end;

procedure TfrmCadReajSalPatroCS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedMesReaj.SetFocus;
end;

procedure TfrmCadReajSalPatroCS.rgrpReajusteClick(Sender: TObject);
begin
  inherited;
  grpRegra.Visible      := (rgrpReajuste.ItemIndex <> 1);
  grpPercentual.Visible := (rgrpReajuste.ItemIndex <> 0);

end;

procedure TfrmCadReajSalPatroCS.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (qryDet.Active) and (not qryDet.IsEmpty)
  then begin
     if qryDet.FieldByName('IDRGREAJ').AsInteger > 0
     then begin
        grpRegra.Visible      := True;
        grpPercentual.Visible := False;
     end
     else begin
        grpRegra.Visible      := False;
        grpPercentual.Visible := True;
     end;
  end;

end;

procedure TfrmCadReajSalPatroCS.qryDetBeforePost(DataSet: TDataSet);
begin
  if (rgrpReajuste.ItemIndex = 0) and (Trim(dblkpcmbRegra.Text) = '')
  then begin
     MsgDlg('Informe a Regra de Reajuste. ','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbRegra.SetFocus;
     Abort;
  end;

  if (rgrpReajuste.ItemIndex = 1) and (dbedPercentual.Value <= 0)
  then begin
     MsgDlg('Percentual Inválido. ','Erro',mtError,[mbOk,mbHelp],0);
     dbedPercentual.SetFocus;
     Abort;
  end;

  if rgrpReajuste.ItemIndex = 0
  then begin
     qryDet.FieldByName('PERCENTUAL').AsString   := '';
     qryDet.FieldByName('NOMEREGRA').AsString    := qryRegra.FieldByName('NOMEREGRA').AsString;
  end
  else if rgrpReajuste.ItemIndex = 1
       then begin
          qryDet.FieldByName('NOMEREGRA').AsString    := '';
          qryDet.FieldByName('IDRGREAJ').AsString     := '';
       end;

  qryDet.FieldByName('IDPESSJUR').AsInteger   := qry.FieldByName('IDPESSJUR').AsInteger;
  qryDet.FieldByName('IDPLANOPREV').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;

  inherited;

end;

procedure TfrmCadReajSalPatroCS.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (qryDet.Active) and (not qryDet.IsEmpty)
  then begin
     if (qryDet.FieldByName('IDRGREAJ').AsInteger > 0) and (qryDet.FieldByName('PERCENTUAL').AsFloat <= 0)
     then begin
        rgrpReajuste.ItemIndex := 0;
        grpRegra.Visible       := True;
        grpPercentual.Visible  := False;
     end
     else if (qryDet.FieldByName('IDRGREAJ').AsInteger > 0) and (qryDet.FieldByName('PERCENTUAL').AsFloat > 0)
          then begin
             rgrpReajuste.ItemIndex := 2;
             grpRegra.Visible       := True;
             grpPercentual.Visible  := True;
          end
          else begin
             rgrpReajuste.ItemIndex := 1;
             grpRegra.Visible       := False;
             grpPercentual.Visible  := True;
          end;
  end
  else begin
     rgrpReajuste.ItemIndex := 0;
     grpRegra.Visible       := True;
     grpPercentual.Visible  := False;
  end;
end;

procedure TfrmCadReajSalPatroCS.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  try
      AplicaAlteracoes([qryDet]);
  except
      raise;
  end;
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmCadReajSalPatroCS.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PLP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;

end.
