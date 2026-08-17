//início - andre tavares - pendência 17317 - criaçcao do método TemTipoHistAtivo que verifica se há ao menos um modelo do mesmo tipo ativo 
unit FCadModeloHistoricoMT;
                                             
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCmSqlParams, DBCtrls, Mask, uCtrlModeloHistorico;

type
  TFrmCadModeloHistoricoMT = class(TFrmCadastroMT)
    SQL: TCMSqlParams;
    RgTipoHistorico: TDBRadioGroup;
    DbeDescricao: TDBEdit;
    CkbAtivo: TDBCheckBox;
    LblDescHistorico: TLabel;
    BvlHistorico: TBevel;
    PnlModelo: TPanel;
    LblCamposBanco: TLabel;
    LblTextoFixo: TLabel;
    LblCompoHistorico: TLabel;
    BtnAdd: TSpeedButton;
    BtnDelete: TSpeedButton;
    BtnUp: TSpeedButton;
    BtnDwn: TSpeedButton;
    EdtTextoFixo: TEdit;
    LbCampoBanco: TListBox;
    LbHistCompo: TListBox;
    SbtVisualizar: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure BtnDwnClick(Sender: TObject);
    procedure BtnUpClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure SbtVisualizarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
  protected
    //_LstFieldNames: TStrings;
  private
    { Private declarations }
    //_LstAux: TStrings;
    ModeloHistorico: TCtrlModeloHistorico;

    procedure Selecionar(Id: Integer);

    //function StringListToDbField(sText: String): String;
    //function DbFieldToStringList(sText: String): String;
  public
    { Public declarations }
  end;

var
  FrmCadModeloHistoricoMT: TFrmCadModeloHistoricoMT;

implementation

Uses uSistema, uMensErro, uCMTypes, uCtrlPadroes, FValoresHistorico;

{$R *.DFM}

procedure TFrmCadModeloHistoricoMT.FormCreate(Sender: TObject);
begin
  inherited;
  //_LstFieldNames := TStringList.Create;
  //_LstAux := TStringList.Create;

  ModeloHistorico := TCtrlModeloHistorico.Create;
  ModeloHistorico.InitializeAs(Padroes);

  MontaSelect.Filtro.Add('MODELOHISTORICO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) );
  MontaSelect.Filtro.Add('MODELOHISTORICO.IDMODULO = ' + IntToStr(Sistema.IdModulo) );

  Selecionar(-1);
end;

procedure TFrmCadModeloHistoricoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor then
     Selecionar(StrToIntDef(MontaSelect.ValoresChave[0], -1));
end;

procedure TFrmCadModeloHistoricoMT.Selecionar(Id: Integer);
begin
   SQL.Prepare;
   SQL.ParamByName('IDMODELOHISTORICO').AsInteger := Id;
   SQL.Open;

   LbHistCompo.Items.Text := Cds.FieldByName('COMPOHISTORICO').AsString;
   //LbHistCompo.Items.Text := DbFieldToStringList(Cds.FieldByName('COMPOHISTORICO').AsString);

   if not Cds.IsEmpty then
   begin
      (*
      if Cds.FieldByName('FLGMODELOPADRAO').AsString = 'S' then
      begin
         sbtnApagar.Enabled := false;
         PnlModelo.Enabled := false;
         RgTipoHistorico.Enabled := false;
         DbeDescricao.Enabled := false;

         MsgDlg('Este é um Modelo de Histórico padrão. Só é permitido alterar a opção de histórico preferencial', 'Atenção', mtError, [mbOk], 0 );
      end
      else
      begin
      *)
         sbtnApagar.Enabled := true;
         PnlModelo.Enabled := true;
         RgTipoHistorico.Enabled := true;
         DbeDescricao.Enabled := true;
      (*end;*)
   end;
end;

procedure TFrmCadModeloHistoricoMT.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
  inherited;
  if ( CmeCadastro.Operacao = OpAlterar ) then
      Selecionar(StrToIntDef(MontaSelect.ValoresChave[0], -1));
end;

procedure TFrmCadModeloHistoricoMT.BtnDwnClick(Sender: TObject);
Var
  sOldItem: String;
begin
  inherited;
  If (LbHistCompo.ItemIndex > -1) And
     (LbHistCompo.ItemIndex < (LbHistCompo.Items.Count - 1)) Then
  Begin
      sOldItem := LbHistCompo.Items[LbHistCompo.ItemIndex + 1];
      LbHistCompo.Items[LbHistCompo.ItemIndex + 1] := LbHistCompo.Items[LbHistCompo.ItemIndex];
      LbHistCompo.Items[LbHistCompo.ItemIndex] := sOldItem;
      LbHistCompo.ItemIndex := LbHistCompo.ItemIndex + 1;
  End;
end;

procedure TFrmCadModeloHistoricoMT.BtnUpClick(Sender: TObject);
Var
  sOldItem: String;
begin
  inherited;
  If (LbHistCompo.ItemIndex > 0) Then
  Begin
      sOldItem := LbHistCompo.Items[LbHistCompo.ItemIndex - 1];
      LbHistCompo.Items[LbHistCompo.ItemIndex - 1] := LbHistCompo.Items[LbHistCompo.ItemIndex];
      LbHistCompo.Items[LbHistCompo.ItemIndex] := sOldItem;
      LbHistCompo.ItemIndex := LbHistCompo.ItemIndex - 1;
  End;
end;

procedure TFrmCadModeloHistoricoMT.BtnDeleteClick(Sender: TObject);
begin
  inherited;
  If (LbHistCompo.ItemIndex <> -1) Then
      LbHistCompo.Items.Delete(LbHistCompo.ItemIndex);
end;

procedure TFrmCadModeloHistoricoMT.BtnAddClick(Sender: TObject);
begin
  inherited;
  If EdtTextoFixo.Focused Then
  Begin
     If (Trim(EdtTextoFixo.Text) <> '') Then
     Begin
       LbHistCompo.Items.Add('#' + EdtTextoFixo.Text);
       EdtTextoFixo.Text := '';
     End;
  End
  Else
   If (LbCampoBanco.ItemIndex <> -1) Then
      LbHistCompo.Items.Add(LbCampoBanco.Items[LbCampoBanco.ItemIndex]);
end;

procedure TFrmCadModeloHistoricoMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;
  // início andre tavares - pendência 17317
  if (not ModeloHistorico.TemTipoHistAtivo(Sistema.IdEmpresa, Sistema.IdModulo,
                                           Cds.FieldByName('TIPO').Asinteger,
                                           Cds.FieldByName('IDMODELOHISTORICO').Asinteger))
      and (not CkbAtivo.Checked) and (Cds.State = dsEdit) then
  begin
    Accept :=  MsgDlg('Você está desativando modelo de histórico deste tipo de operação, deseja realmente fazer isto?', 'Atenção', mtConfirmation, [mbYes,mbNo],0) = mrYes;
    if not Accept then
      exit;
  end;
  // fim andre tavares - pendência 17317

  If Accept And (CmeCadastro.Operacao In [opInserir, opAlterar]) Then
  begin
     if not ( Cds.State in [DsEdit, DsInsert] ) then Cds.Edit;

     Cds.FieldByName('COMPOHISTORICO').AsString := LbHistCompo.Items.Text;
     //Cds.FieldByName('COMPOHISTORICO').AsString := StringListToDbField(LbHistCompo.Items.Text);

     Cds.Post;
  end;
end;

procedure TFrmCadModeloHistoricoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //_LstFieldNames.Free;
  //_LstAux.Free;
  ModeloHistorico.Free;
end;

procedure TFrmCadModeloHistoricoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ModeloHistorico.ProcessaModeloHistorico(Cds.Data);
  if Accept then
  begin
     LbHistCompo.Items.Clear;
     EdtTextoFixo.Clear;
  end
  else
     MsgDlg(ModeloHistorico.MessageInfo, 'Atenção', mtError, [MbOk], 0 )
end;

(*
function TFrmCadModeloHistoricoMT.DbFieldToStringList(
  sText: String): String;
Var
  iPosFieldName, X: Integer;
begin
  _LstAux.Text := sText;
  for x:= 0 to pred(_LstAux.Count) do
  begin
     iPosFieldName := _LstFieldNames.IndexOf( _LstAux[x] );
     if ( iPosFieldName > 0 ) then _LstAux[x] := LbCampoBanco.Items[iPosFieldName];
  end;

  result := _LstAux.Text;
end;

function TFrmCadModeloHistoricoMT.StringListToDbField(
  sText: String): String;
Var
  iPosAlias, X: Integer;
begin
  _LstAux.Text := sText;
  for x:= 0 to pred(_LstAux.Count) do
  begin
     iPosAlias := LbCampoBanco.Items.IndexOf( _LstAux[x] );
     if ( iPosAlias > 0 ) then _LstAux[x] := _LstFieldNames[iPosAlias];
  end;

  result := _LstAux.Text;
end;
*)

procedure TFrmCadModeloHistoricoMT.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  LbHistCompo.Items.Clear;
  EdtTextoFixo.Clear;

  Cds.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  Cds.FieldByName('IDMODULO').AsFloat := Sistema.IdModulo;
  Cds.FieldByName('STATUS').AsString := 'I';
end;

procedure TFrmCadModeloHistoricoMT.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  SbtVisualizar.Enabled := ( Not Cds.IsEmpty ) And ( Not bbtnConfirmar.Enabled );
end;

procedure TFrmCadModeloHistoricoMT.SbtVisualizarClick(Sender: TObject);
Var
  X: Integer;
begin
  inherited;

  With TFrmValoresHistorico.Create(Self) do
    Try
       Caption := Self.Caption;
       SQLCamposeValores.Open;

       For X:=0 To Pred(LbCampoBanco.Items.Count) do
       begin
          CdsCamposeValores.Append;
          CdsCamposeValores.Fields[0].AsString := LbCampoBanco.Items[x];
          CdsCamposeValores.Post;
       end;

       if ShowModal = mrOk then
       begin
          ModeloHistorico.FieldNames.Clear;
          ModeloHistorico.FieldValues.Clear;

          CdsCamposeValores.First;
          While not CdsCamposeValores.Eof Do
          begin
            ModeloHistorico.FieldNames.Add(CdsCamposeValores.Fields[0].AsString);
            ModeloHistorico.FieldValues.Add(CdsCamposeValores.Fields[1].AsString);

            CdsCamposeValores.Next;
          end;

          MsgDlg(ModeloHistorico.GetHistorico(Sistema.IdEmpresa, Sistema.IdModulo,
                                              Cds.FieldByName('TIPO').Asinteger,
                                              'Teste de Modelo de Histórico',
                                              Cds.FieldByName('IDMODELOHISTORICO').Asinteger),
                 Self.Caption,
                 mtInformation,
                 [MBOK],
                 0);
       end;
    finally
      CdsCamposeValores.Close;
      Free;
    End;
end;

procedure TFrmCadModeloHistoricoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  // início - André Tavares - pendência ???? - 18/05/2005
  if Cds.State = dsInsert then
   cds.fieldByName('STATUS').asString := 'A';
  // fim - André Tavares - pendência ???? - 18/05/2005
end;

end.
