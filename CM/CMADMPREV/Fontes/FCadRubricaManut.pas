unit FCadRubricaManut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdblook, wwdbedit, CmEventosCadastro, ImgList;

type
  TfrmCadRubricaManut = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    qryProvDesc: TwwQuery;
    grpMesAnoRef: TGroupBox;
    Label6: TLabel;
    edAnoRef: TEdit;
    edMesRef: TEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    edAnoCob: TEdit;
    edMesCob: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbrgrpFlgSRB: TDBRadioGroup;
    qryDetIDPESSOA: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryDetMES: TStringField;
    qryDetMESCOBRANCA: TStringField;
    qryDetREFERENCIA: TStringField;
    qryDetIDRUBRICA: TFloatField;
    qryDetVALORPROVENTO: TFloatField;
    qryDetFLGCOMPOESALPART: TFloatField;
    qryDetFLGCOMPOESALBENEF: TFloatField;
    qryDetFLGIRRF: TFloatField;
    qryDetSEQRUBRICA: TFloatField;
    qryDetFLGSRB: TFloatField;
    dblkpcmbRubrica: TwwDBLookupCombo;
    qryauxrubrica: TwwQuery;
    qryDetCODPROVDESC: TStringField;
    redValor: TMaskEdit;
    qryDetDESCRICAO: TStringField;
    qryDetDESCFLGSRB: TStringField;
    qryauxrubricaIDRUBSALPARTICIP: TFloatField;
    Label10: TLabel;
    redIntegral: TMaskEdit;
    qryDetVALORINTEGRAL: TFloatField;
    qryDetIDMODULO: TFloatField;
    qryDetIDPATRO: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edMesRefExit(Sender: TObject);
    procedure edMesCobExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Subtrai;
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
     sMes, sFlgSitPart : String;
     procedure AbreTela(sidPessjur , sIdPlanoPrev , sIdPessoa, sMes, sFlgSitPart : String);


  end;



var
  frmCadRubricaManut: TfrmCadRubricaManut;
  rValor : Double;
  sIdPessoa, sIdPessJur  : string;



implementation
{$R *.DFM}
uses
  UAdmPrev, UMensErro, UDataBase, uSistema;



procedure TfrmCadRubricaManut.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')
  then begin
     sIdPessoa := MontaSelect.ValoresChave[0];
     sIdPessJur := MontaSelect.ValoresChave[1];
     sIdPlanoPrev := MontaSelect.ValoresChave[2];
     qry.Close;
     qry.ParamByName('IdPessoa').Value  := StrToInt(sIdPessoa);
     qry.ParamByName('IdPessJur').Value := StrToInt(sIdPessJur);
     qry.ParamByName('IdPlanoPrev').Value := StrToInt(sIdPlanoPrev);
     qry.Open;

     qryDet.Close;
     qryDet.ParamByName('IdPessoa').Value  := StrToInt(sIdPessoa);
     qryDet.ParamByName('IdPessJur').Value := StrToInt(sIdPessJur);
     qryDet.Open;

     qryProvDesc.Close;
     qryProvDesc.ParamByName('IdPessoa').Value := StrToInt(sIdPessJur);
     qryProvDesc.Open;
  end;
end;

procedure TfrmCadRubricaManut.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  dblkpcmbRubrica.Clear;

end;

procedure TfrmCadRubricaManut.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  edAnoRef.Text    := Copy(qryDet.FieldByName('Mes').AsString,1,4);
  edMesRef.Text    := Copy(qryDet.FieldByName('Mes').AsString,6,2);
  edAnoCob.Text    := Copy(qryDet.FieldByName('MesCobranca').AsString,1,4);
  edMesCob.Text    := Copy(qryDet.FieldByName('MesCobranca').AsString,6,2);
  redValor.Text    := FloattoStr(qryDet.FieldByName('VALORPROVENTO').AsFloat);
  redIntegral.Text := FloattoStr(qryDet.FieldByName('VALORINTEGRAL').AsFloat);
end; // CmeDetalhe.Edit(Self)

procedure TfrmCadRubricaManut.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   try
      AplicaAlteracoes([qryDet]);
   except
      raise;
   end;
   
end; // CmeCadastro.Confirma(Self)

procedure TfrmCadRubricaManut.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;

end; // CmeDetalhe.Confirma(Self)


procedure TfrmCadRubricaManut.sbtnInserirClick(Sender: TObject);
begin
  MsgDlg('Esta tela permite apenas a inclusão de rubricas. Utilize o botão "Alterar". ','Atenção',mterror,[mbOK],0);
  sbtnInserir.Down := False;
  Abort;
  inherited;

end;

procedure TfrmCadRubricaManut.sbtnApagarClick(Sender: TObject);
begin
  MsgDlg('Esta tela permite apenas a exclusão de rubricas. Utilize o botão "Alterar". ','Atenção',mterror,[mbOK],0);
  sbtnApagar.Down := False;
  Abort;
  inherited;
end;

procedure TfrmCadRubricaManut.FormShow(Sender: TObject);
begin
  inherited;
  edAnoRef.Text := '';
  edMesRef.Text := '';
  edAnoCob.Text := '';
  edMesCob.Text := '';
  rValor        := 0;
end;

procedure TfrmCadRubricaManut.bbtnOkDetClick(Sender: TObject);
begin
  rvalor := StrtoFloat(ClienteNumero(redValor.Text));
  // Verificar dados obrigatorios
  if Trim(edAnoRef.Text) = ''
  then begin
     MsgDlg('Preencha o Ano de Referência.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  if Trim(edMesRef.Text) = ''
  then begin
     MsgDlg('Preencha o Mês de Referência.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  if Trim(edAnoCob.Text) = ''
  then begin
     MsgDlg('Preencha o Ano de Cobrança / Pagamento.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  if Trim(edMesCob.Text) = ''
  then begin
     MsgDlg('Preencha o Mês de Cobrança.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  if Trim(dblkpcmbRubrica.Text) = ''
  then begin
     MsgDlg('Preencha a Rubrica.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  if Trim(redValor.Text) = ''
  then begin
     MsgDlg('Preencha o Valor da Rubrica.','Atenção',mterror,[mbOK],0);
     Exit;
  end;

  // Verificar motivo
  if qryDet.state = dsinsert then
  begin
     if prmIdMotivoContrib <= 0 then
     begin
       MsgDlg('O Parâmetro -> Motivo Padrão de Contribuição deve ser cadastrado !','Atenção',mterror,[mbOK],0);
       Exit;
     end;
  end;


  // só apresentar a rubrica de salário de participação se não tiver nenhuma já escolhida
  if (qryauxrubrica.fieldbyname('IDRUBSALPARTICIP').AsString <> '') and (rValor = 0)
  then qryprovdesc.Locate('IDRUBRICA',qryauxrubrica.fieldbyname('IDRUBSALPARTICIP').AsInteger,[locaseinsensitive]);
  dblkpcmbRubrica.text :=  qryprovdesc.fieldbyname('DESCRPROVDESC').AsString;

  inherited;

end;

procedure TfrmCadRubricaManut.bbtnConfirmarClick(Sender: TObject);
var
   i:integer;
begin

   i := 0;
   while (i < ComponentCount)  do begin
         if (TObject(Components[i]).ClassNameIs('TwwQuery')) and
            (TwwQuery(Components[i]).Active) and
            (TwwQuery(Components[i]).CachedUpdates) and
            (TwwQuery(Components[i]).UpdatesPending) then
            TwwQuery(Components[i]).ApplyUpdates;
         Inc(i);
   end;

end;

procedure TfrmCadRubricaManut.edMesRefExit(Sender: TObject);
begin
  inherited;

  if (edMesRef.Text <> '') and ((StrtoInt(edMesRef.Text) > 13) or (StrtoInt(edMesRef.Text) <= 0)) Then Begin
     MsgDlg('Mês inválido','Atenção',mterror,[mbOK],0);
     edMesRef.SetFocus;
  end;
end;

procedure TfrmCadRubricaManut.edMesCobExit(Sender: TObject);
begin
  inherited;

  if (edMesCob.Text <> '') and ((StrtoInt(edMesCob.Text) > 12) or (StrtoInt(edMesCob.Text) <= 0)) Then Begin
     MsgDlg('Mês inválido','Atenção',mterror,[mbOK],0);
     edMesCob.SetFocus;
  end;
end;

procedure TfrmCadRubricaManut.FormCreate(Sender: TObject);
begin
  inherited;
  sbtnInserir.Visible := false;
  sbtnApagar.Visible := false;
  sbtnProcurar.visible := false;

end;

procedure TfrmCadRubricaManut.Subtrai;
begin
  // Subtrair mes / ano ao anterior
  if (Trim(edAnoRef.Text) <> '') and (Trim(edMesRef.Text) <> '')
  then begin
     if StrToInt(Trim(edMesRef.Text)) = 01
     then begin
        edAnoRef.Text := IntToStr( StrToInt(edAnoRef.Text) - 1);
        edMesRef.Text := '12';
     end
     else begin
        edMesRef.Text := IntToStr( StrToInt(edMesRef.Text) - 1);
        if StrToInt(edMesRef.Text) <= 9
        then edMesRef.Text := '0'+edMesRef.Text;
     end;
     redValor.SetFocus;
  end;

  if (Trim(edAnoCob.Text) <> '') and (Trim(edMesCob.Text) <> '')
  then begin
     if StrToInt(Trim(edMesCob.Text)) = 01
     then begin
        edAnoCob.Text := IntToStr( StrToInt(edAnoCob.Text) - 1);
        edMesCob.Text := '12';
     end
     else begin
        edMesCob.Text := IntToStr( StrToInt(edMesCob.Text) - 1);
        if StrToInt(edMesCob.Text) <= 9
        then edMesCob.Text := '0'+edMesCob.Text;
     end;
     redValor.SetFocus;
  end;
end;

procedure TfrmCadRubricaManut.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;


  dbgrdDet.Refresh;
end;

procedure TfrmCadRubricaManut.qryDetAfterInsert(DataSet: TDataSet);
var sAnoMesReferencia,sAnoReferencia,sMesReferencia,
    sAnoMesCobranca,sAnoCobranca,sMesCobranca : string;
begin
  qrydet.fieldbyname('IDMOTIVO').AsInteger := prmIdMotivoSalManut;
  qrydet.fieldbyname('IDMODULO').AsInteger := Sistema.IDModulo;

  if sFlgSitPart = 'MP' then
  begin
     dbrgrpFlgSRB.ItemIndex := 4;
     qrydet.fieldbyname('FLGSRB').AsString := '5';
  end
  else
  begin
     dbrgrpFlgSRB.ItemIndex := 0;
     qrydet.fieldbyname('FLGSRB').AsString := '1';
  end;
  qrydet.fieldbyname('MES').AsString := smes;
  qrydet.fieldbyname('MESCOBRANCA').AsString := smes;

  edAnoRef.TexT := copy(smes,1,4);
  edMesRef.text := copy(smes,6,2);
  edAnoCob.text := copy(smes,1,4);
  edMesCob.text := copy(smes,6,2);
end;



procedure TfrmCadRubricaManut.qryDetBeforePost(DataSet: TDataSet);
var sAnoMesReferencia,sAnoReferencia,sMesReferencia,
    sAnoMesCobranca,sAnoCobranca,sMesCobranca : string;
begin
  inherited;
  if trim(edAnoRef.Text) <> '' then
  begin
  sAnoReferencia := Trim(edAnoRef.Text);
  if (StrToInt(Trim(edMesRef.Text))  <= 8) and
     (Length(Trim(edMesRef.Text)) = 1)
  then sMesReferencia := '0'+Trim(edMesRef.Text)
  else sMesReferencia := Trim(edMesRef.Text);
  sAnoMesReferencia   := Trim(edAnoRef.Text)+'/'+sMesReferencia;
  end;


  if trim(edAnoCob.Text) <> '' then
  begin
  sAnoCobranca := Trim(edAnoCob.Text);
  if (StrToInt(Trim(edMesCob.Text))  <= 8) and
     (Length(Trim(edMesCob.Text)) = 1)
  then sMesCobranca := '0'+Trim(edMesCob.Text)
  else sMesCobranca := Trim(edMesCob.Text);
  sAnoMesCobranca   := sAnoCobranca+'/'+sMesCobranca;
  end;

  if qryDet.State = dsInsert then
  begin
     qryDet.FieldByName('IdPessoa').AsInteger := qry.FieldByName('IdPessoa').AsInteger;
     qryDet.FieldByName('IdPessJur').AsInteger := qry.FieldByName('IdPessJur').AsInteger;
     qryDet.FieldByName('IdRubrica').AsInteger := qryProvDesc.FieldbyName('IdRubrica').AsInteger;
  end;

  qryDet.FieldByName('Mes').AsString                := sAnoMesReferencia;
  qryDet.FieldByName('MesCobranca').AsString        := sAnoMesCobranca;
  qryDet.FieldByName('CodProvDesc').AsString        := qryProvDesc.FieldByName('CodProvDesc').AsString;
  qryDet.FieldByName('flgCompoeSalPart').AsInteger  := qryProvDesc.FieldByName('flgCompoeSalPart').AsInteger;
  qryDet.FieldByName('flgCompoeSalBenef').AsInteger := qryProvDesc.FieldByName('flgCompoeSalBenef').AsInteger;
  qryDet.FieldByName('flgIRRF').AsInteger           := qryProvDesc.FieldByName('flgIRRF').AsInteger;
  qryDet.FieldByName('Referencia').AsString         := '***';
  qryDet.FieldByName('SeqRubrica').AsInteger        := 1;
  qryDet.FieldByName('VALORPROVENTO').AsFloat       := StrtoFloat(redValor.text);

  
  qryDet.FieldByName('IDPATRO').AsInteger     := qry.FieldByName('IDPESSJUR').AsInteger;
  qryDet.FieldByName('IDPLANOPREV').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;
  

  if Trim(redIntegral.Text) <> ''
  then qryDet.FieldByName('VALORINTEGRAL').AsFloat  := StrtoFloat(redIntegral.text)
  else qryDet.FieldByName('VALORINTEGRAL').AsFloat  := StrtoFloat(redValor.text);

  qryDet.FieldByName('DESCRICAO').AsString          := qryProvDesc.FieldByName('DESCRPROVDESC').AsString;

end;

procedure TfrmCadRubricaManut.AbreTela(sidPessjur , sIdPlanoPrev , sIdPessoa, sMes, sFlgSitPart : String);
begin

   frmCadRubricaManut := TfrmCadRubricaManut.create(application);
   frmCadRubricaManut.sMes := sMes;
   frmCadRubricaManut.sFlgSitPart := sFlgSitPart;

   frmCadRubricaManut.qry.close;
   frmCadRubricaManut.qry.parambyname('IDPESSJUR').AsString := sIdPessjur;
   frmCadRubricaManut.qry.parambyname('IDPLANOPREV').AsString := sIdPlanoPrev;
   frmCadRubricaManut.qry.parambyname('IDPESSOA').AsString := sIdPessoa;
   frmCadRubricaManut.qry.open;

   frmCadRubricaManut.qrydet.close;
   frmCadRubricaManut.qrydet.parambyname('IDPESSJUR').AsString := sIdPessjur;
   frmCadRubricaManut.qrydet.parambyname('MES').AsString := sMes;
   frmCadRubricaManut.qrydet.parambyname('IDPESSOA').AsString := sIdPessoa;
   frmCadRubricaManut.qrydet.open;


   frmCadRubricaManut.qryProvDesc.Close;
   frmCadRubricaManut.qryProvDesc.ParamByName('IdPessoa').AsString := sIdPessjur;
   frmCadRubricaManut.qryProvDesc.Open;

   frmCadRubricaManut.sbtnAlterarClick(self);

   frmCadRubricaManut.ShowModal;
end;

procedure TfrmCadRubricaManut.bbtnCancelarClick(Sender: TObject);
begin

  close;
end;

procedure TfrmCadRubricaManut.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  {}
end;

procedure TfrmCadRubricaManut.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //inherited;

end;

end.
