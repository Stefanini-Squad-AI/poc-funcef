unit FCadParamReserva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, Mask, wwdbedit, CMTree, wwdblook;

type
  TfrmCadParamReserva = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label2: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    updDet: TUpdateSQL;
    qryDet: TwwQuery;
    qryCCustoC: TwwQuery;
    qryCCustoD: TwwQuery;
    qryContaContabilD: TwwQuery;
    qryContaContabilDPLACONTA: TStringField;
    qryContaContabilDPLANOME: TStringField;
    qryContaContabilDPLATIPO: TStringField;
    dsContaContabilD: TwwDataSource;
    qrySubConta: TwwQuery;
    qryAtividade: TwwQuery;
    dsContaContabilC: TwwDataSource;
    qryContaContabilC: TwwQuery;
    qryContaContabilCPLACONTA: TStringField;
    qryContaContabilCPLANOME: TStringField;
    qryContaContabilCPLATIPO: TStringField;
    qryContaContabilCPLACCUST: TStringField;
    grpDebContab: TGroupBox;
    spdContaContabilD: TSpeedButton;
    lblPlaContaD: TLabel;
    Label3: TLabel;
    edContaContabilD: TMaskEdit;
    cmbCCustoD: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
    lbDescricaoContaD: TLabel;
    treeContaContabilC: TCMTreeView;
    treeContaContabilD: TCMTreeView;
    GroupBox3: TGroupBox;
    Label43: TLabel;
    lbAtividade: TLabel;
    dblkSubconta: TwwDBLookupCombo;
    lkcmbDescAtividade: TwwDBLookupCombo;
    grpCreContab: TGroupBox;
    spdContaContabilC: TSpeedButton;
    lbCcusto1: TLabel;
    lbConta1: TLabel;
    edContaContabilC: TMaskEdit;
    cmbCCustoC: TwwDBLookupCombo;
    grbGrConta1: TGroupBox;
    lbDescricaoContaC: TLabel;
    GroupBox1: TGroupBox;
    dblkpcmbReserva: TwwDBLookupCombo;
    qryTipoReserva: TwwQuery;
    procedure spdContaContabilDClick(Sender: TObject);
    procedure spdContaContabilCClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure treeContaContabilDDblClick(Sender: TObject);
    procedure treeContaContabilCExit(Sender: TObject);
    procedure treeContaContabilCDblClick(Sender: TObject);
    procedure treeContaContabilDExit(Sender: TObject);
    procedure edContaContabilCExit(Sender: TObject);
    procedure edContaContabilDExit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadParamReserva: TfrmCadParamReserva;

implementation

uses USistema, UIntegraBack, UDataBase, UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmCadParamReserva.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IDPESSJUR').AsInteger   := 0;
  qry.ParamByName('IDPLANOPREV').AsInteger := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPESSJUR').AsInteger   := 0;
  qryDet.ParamByName('IDPLANOPREV').AsInteger := 0;
  qryDet.Open;

  qryTipoReserva.Close;
  qryTipoReserva.ParamByName('IDPLANOPREV').AsInteger := 0;
  qryTipoReserva.Open;

   // Abrir querys de Integracao Contabil
   qryAtividade.Close;
   qryAtividade.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryAtividade.Open;

   qrySubConta.Close;
   qrySubConta.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qrySubConta.Open;

   qryContaContabilD.Close;
   qryContaContabilD.ParamByName('PLANO').AsInteger := IntegraBack.Plano;
   qryContaContabilD.Open;

   qryContaContabilC.Close;
   qryContaContabilC.ParamByName('PLANO').AsInteger := IntegraBack.Plano;
   qryContaContabilC.Open;

   qryCCustoC.Close;
   qryCCustoC.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryCCustoC.ParamByName('PLANO').AsInteger     := IntegraBack.Plano;
   qryCCustoC.ParamByName('PLACONTA').AsString   := '0';
   qryCCustoC.Open;

   qryCCustoD.Close;
   qryCCustoD.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryCCustoD.ParamByName('PLANO').AsInteger     := IntegraBack.Plano;
   qryCCustoD.ParamByName('PLACONTA').AsString   := '0';
   qryCCustoD.Open;

   treeContaContabilD.Mascara       := IntegraBack.MascaraPlano;
   treeContaContabilC.Mascara       := IntegraBack.MascaraPlano;
   edContaContabilD.EditMask        := IntegraBack.MascaraPlano + ';0; ';
   edContaContabilC.EditMask        := IntegraBack.MascaraPlano + ';0; ';
   treeContaContabilD.MontaArvore;
   treeContaContabilC.MontaArvore;

end;

procedure TfrmCadParamReserva.CmeCadastroFind(Sender: TObject);
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

  qryTipoReserva.Close;
  qryTipoReserva.ParamByName('IDPLANOPREV').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;
  qryTipoReserva.Open;

end;

procedure TfrmCadParamReserva.CmeCadastroConfirma(Sender: TObject);
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

procedure TfrmCadParamReserva.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;

  qryDet.FieldByName('IDPESSJUR').AsInteger   := qry.FieldByName('IDPESSJUR').AsInteger;
  qryDet.FieldByName('IDPLANOPREV').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;

  if (Trim(cmbCCustoC.Text) = '') and (Trim(cmbCCustoD.Text) = '')
  then qryDet.FieldbyName('IDEMPRESA').Clear
  else qryDet.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;

  if Trim(edContaContabilD.Text) = ''
  then qryDet.FieldByname('PLACONTAD').Clear
  else qryDet.FieldByname('PLACONTAD').AsString := edContaContabilD.Text;

  if Trim(edContaContabilC.Text) = ''
  then qryDet.FieldByname('PLACONTAC').Clear
  else qryDet.FieldByname('PLACONTAC').AsString := edContaContabilC.Text;

  qryDet.FieldByname('CODHIERARQUIA').AsString := qryTipoReserva.FieldByName('CODHIERARQUIA').AsString;
  qryDet.FieldByname('NOME').AsString          := qryTipoReserva.FieldByName('NOME').AsString;

end;

procedure TfrmCadParamReserva.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if qryDet.FieldByName('PLACONTAC').AsString <> ''
  then begin
     edContaContabilC.Text := qryDet.FieldByName('PLACONTAC').AsString;
     qryContaContabilC.Locate('PLACONTA', qryDet.FieldByName('PLACONTAC').AsString, [loCaseInsensitive]);

     lbDescricaoContaC.Caption := qryContaContabilC.FieldByName('PLANOME').AsString;
  end;

  if qryDet.FieldByName('PLACONTAD').AsString <> ''
  then begin
     edContaContabilD.Text := qryDet.FieldByName('PLACONTAD').AsString;
     qryContaContabilD.Locate('PLACONTA', qryDet.FieldByName('PLACONTAD').AsString, [loCaseInsensitive]);

     lbDescricaoContaD.Caption := qryContaContabilD.FieldByName('PLANOME').AsString;
  end;

end;

procedure TfrmCadParamReserva.spdContaContabilDClick(Sender: TObject);
begin
  inherited;
  treeContaContabilD.Top     := 91;
  treeContaContabilD.Left    := 13;
  treeContaContabilD.Visible := not treeContaContabilD.Visible;
  treeContaContabilD.Height  := 170;
  treeContaContabilD.Width   := 250;
  if treeContaContabilD.Visible
  then begin
     treeContaContabilD.SetFocus;
     treeContaContabilD.BringToFront;
  end;

end;

procedure TfrmCadParamReserva.spdContaContabilCClick(Sender: TObject);
begin
  inherited;
  treeContaContabilC.Top     := 91;
  treeContaContabilC.Left    := 282;
  treeContaContabilC.Visible := not treeContaContabilC.Visible;
  treeContaContabilC.Height  := 170;
  treeContaContabilC.Width   := 250;
  if treeContaContabilC.Visible
  then begin
     treeContaContabilC.SetFocus;
     treeContaContabilC.BringToFront;
  end;

end;

procedure TfrmCadParamReserva.treeContaContabilDDblClick(Sender: TObject);
begin
  inherited;
  if (qryContaContabilD.FieldByName('PLATIPO').AsString = 'A')
  then treeContaContabilDExit(treeContaContabilD)
  else Exit;
end;

procedure TfrmCadParamReserva.treeContaContabilCExit(Sender: TObject);
begin
  inherited;
  treeContaContabilC.Visible := false;
  if (qryContaContabilC.FieldByName('PLATIPO').asString = 'A')
  then begin
     edContaContabilC.Text := '';
     edContaContabilC.Text := treeContaContabilC.ValorChave;
     lbDescricaoContaC.Caption := qryContaContabilC.FieldByName('PLANOME').AsString;
  end;

end;

procedure TfrmCadParamReserva.treeContaContabilCDblClick(Sender: TObject);
begin
  inherited;
  if (qryContaContabilC.FieldByName('PLATIPO').AsString = 'A')
  then treeContaContabilCExit(treeContaContabilC)
  else Exit;
end;

procedure TfrmCadParamReserva.treeContaContabilDExit(Sender: TObject);
begin
  inherited;
  treeContaContabilD.Visible := false;
  if (qryContaContabilD.FieldByName('PLATIPO').asString = 'A')
  then begin
     edContaContabilD.Text := '';
     edContaContabilD.Text := treeContaContabilD.ValorChave;
     lbDescricaoContaD.Caption := qryContaContabilD.FieldByName('PLANOME').AsString;
  end;
end;

procedure TfrmCadParamReserva.edContaContabilCExit(Sender: TObject);
begin
  inherited;
  try
    cmbCCustoC.Text    := '';
    cmbCCustoC.Enabled := False;
    // Posicionar a Query PlanoConta na conta certa
    if (Trim(edContaContabilC.Text) <> '') and (qryContaContabilC.Active)
    then begin
       if (qryContaContabilC.LOCATE('PLACONTA', edContaContabilC.Text,[loCaseInsensitive,loPartialKey]))
       then begin
          if (qryContaContabilC.FieldByName('PLATIPO').asString = 'A')
          then begin
            lbDescricaoContaC.Caption := qryContaContabilC.FieldByName('PLANOME').AsString;
            qryCCustoC.Close;
            qryCCustoC.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
            qryCCustoC.ParamByName('PLANO').AsInteger     := IntegraBack.Plano;
            qryCCustoC.ParamByName('PLACONTA').AsString   := edContaContabilC.Text;
            qryCCustoC.Open;
            if not qryCCustoC.IsEmpty
            then cmbCCustoC.Enabled := True
            else cmbCCustoC.Enabled := False;
          end
          else begin
              MsgDlg('Conta contábil tem que ser analítica','Erro',mtError,[mbOK],0);
              edContaContabilC.Text := '';
              edContaContabilC.SetFocus;
          end
       end
       else begin
          MsgDlg('Conta contábil não cadastrada','Erro',mtError,[mbOK],0);
          edContaContabilC.Text := '';
          edContaContabilC.SetFocus;
       end;
    end;
  except
    raise;
  end;


end;

procedure TfrmCadParamReserva.edContaContabilDExit(Sender: TObject);
begin
  inherited;

  try
    cmbCCustoD.Text    := '';
    cmbCCustoD.Enabled := False;
    // Posicionar a Query PlanoConta na conta certa
    if (Trim(edContaContabilD.Text) <> '') and (qryContaContabilD.Active)
    then begin
       if (qryContaContabilD.LOCATE('PLACONTA', edContaContabilD.Text,[loCaseInsensitive,loPartialKey]))
       then begin
          if (qryContaContabilD.FieldByName('PLATIPO').asString = 'A')
          then begin
            lbDescricaoContaD.Caption := qryContaContabilD.FieldByName('PLANOME').AsString;
            qryCCustoD.Close;
            qryCCustoD.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
            qryCCustoD.ParamByName('PLANO').AsInteger     := IntegraBack.Plano;
            qryCCustoD.ParamByName('PLACONTA').AsString   := edContaContabilD.Text;
            qryCCustoD.Open;
            if not qryCCustoD.IsEmpty
            then cmbCCustoD.Enabled := True
            else cmbCCustoD.Enabled := False;
          end
          else begin
              MsgDlg('Conta contábil tem que ser analítica','Erro',mtError,[mbOK],0);
              edContaContabilD.Text := '';
              edContaContabilD.SetFocus;
          end
       end
       else begin
          MsgDlg('Conta contábil não cadastrada','Erro',mtError,[mbOK],0);
          edContaContabilD.Text := '';
          edContaContabilD.SetFocus;
       end;
    end;
  except
    raise;
  end;
end;

procedure TfrmCadParamReserva.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dblkpcmbReserva.Text      := '';
  edContaContabilD.Text     := '';
  edContaContabilC.Text     := '';
  lbDescricaoContaD.Caption := '';
  lbDescricaoContaC.Caption := '';
  cmbCCustoD.Text           := '';
  cmbCCustoC.Text           := '';
  dblkSubconta.Text         := '';
  lkcmbDescAtividade.Text   := '';

end;

procedure TfrmCadParamReserva.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add(' PLP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;

end.



