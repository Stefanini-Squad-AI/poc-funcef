unit fInvGeracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdblook, CMDBLookupCombo, Spin, TREdit, CMTree, wwdbedit,
  fcLabel, wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro,
  ImgList;

type
  TfrmInvGeracao = class(TfrmCadMestreDetalheCS)
    Label3: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dbeResponsavel: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    bbtnGeraIdInvent: TBitBtn;
    dbeIdInventario: TwwDBEdit;
    dbeDataInicio: TCMDateTimePicker;
    bbtnSelResp: TBitBtn;
    qryResp: TwwQuery;
    qryRespIDRESPONSAVEL: TFloatField;
    qryRespDESCRESPONSAVEL: TStringField;
    dsResp: TwwDataSource;
    bbtnGerar: TToolbarButton97;
    dsLocal: TwwDataSource;
    qryLocal: TwwQuery;
    qryLocalDESCLOCALIZACAO: TStringField;
    qryLocalDESCCCUSTO: TStringField;
    qryLocalIDLOCALIZACAO: TFloatField;
    qryLocalIDRESPONSAVEL: TFloatField;
    qryLocalNOMERESPONSAVEL: TStringField;
    qryLocalIDEMPRESA: TFloatField;
    qryLocalCODCENTROCUSTO: TStringField;
    qryLocalIDPESSOA: TFloatField;
    qryBensLocal: TwwQuery;
    qryBensLocalIDBEM: TFloatField;
    qryBensLocalIDPESSOA: TFloatField;
    qryBensLocalPLACA: TFloatField;
    qryBensLocalDESBEM: TStringField;
    qryBensLocalIDCLASSEBEM: TFloatField;
    qryBensLocalIDCONJUNTO: TFloatField;
    qryBensLocalDESCCONJUNTO: TStringField;
    qryBensLocalIDLOCALIZACAO: TFloatField;
    qryBensLocalDESCLOCAL: TStringField;
    qryDetIDINVENTARIOBENS: TFloatField;
    qryDetIDEMPRESA: TFloatField;
    qryDetIIBPLACA: TFloatField;
    qryDetIIBFLGPLACA: TFloatField;
    qryDetIIBLOCALATUAL: TFloatField;
    qryDetIIBCONJUNTOATUAL: TFloatField;
    qryDetIIBFLGSITFISICA: TFloatField;
    qryDetPLACA: TFloatField;
    qryDetDESBEM: TStringField;
    qryDetIDBEM: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDCONJUNTO: TFloatField;
    qryDetDESCCONJUNTO: TStringField;
    qryDetIDLOCALIZACAO: TFloatField;
    qryDetDESCLOCAL: TStringField;
    qryIDINVENTARIOBENS: TFloatField;
    qryIDEMPRESA: TFloatField;
    qryIDRESPONSAVEL: TFloatField;
    qryDATAINILEVANT: TDateTimeField;
    qryDATAFIMLEVANT: TDateTimeField;
    qrySTATUS: TFloatField;
    bbtnExportar: TToolbarButton97;
    MSResp: TMontaSelect;
    qryParam: TwwQuery;
    qryParamCDPORTA: TFloatField;
    qryParamCDVELOC: TStringField;
    qryParamIDPESSOA: TFloatField;
    qryParamCOLETORDADOS: TFloatField;
    qryParamDIGMASCPLACA: TFloatField;
    qryDetIDCLASSEBEM: TFloatField;
    qryDetCODHIERARQ: TStringField;
    qryDetDESCCLASSE: TStringField;
    qryBensLocalCODHIERARQ: TStringField;
    qryBensLocalDESCCLASSE: TStringField;
    qryLocalSELECTED: TFloatField;
    SrcList: TListBox;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    DstList: TListBox;
    Label4: TLabel;
    Label5: TLabel;
    lblNumBens: TfcLabel;
    qryDetIIBIDBEM: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnGeraIdInventClick(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
    procedure dbgrdDetCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrdDetTopRowChanged(Sender: TObject);
    procedure bbtnGerarClick(Sender: TObject);
    procedure bbtnExportarClick(Sender: TObject);
    procedure IncludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure qryDetAfterOpen(DataSet: TDataSet);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure qryDetAfterClose(DataSet: TDataSet);
    procedure qryDetAfterDelete(DataSet: TDataSet);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Procedure SelMestreDet(n : LongInt);
  public
    { Public declarations }
    bFlgColetor   : Boolean;
    iTipoColetor,
    iDigMascPlaca : Integer;
    //------------------------------------------------------------------------------------
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function  GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure CarregaListaLocalizacoes;
  end;

var
   frmInvGeracao : TfrmInvGeracao;
   bInsert       : Boolean;
   bTstConf      : Boolean;

implementation

{$R *.DFM}

uses uMensErro, uSistema, uDataBase, dBaseDados, fInvColPDT3100,
     fInvColScwLucas7000;

procedure TfrmInvGeracao.FormCreate(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   inherited;
   Screen.Cursor := crSQLWait;
   qry.Prepare;
   qryDet.Prepare;
   qryResp.Prepare;
   qryBensLocal.Prepare;
   qryLocal.Prepare;
   qryLocal.Open;
   //-------------------------------------------------------------------------------------
   qryParam.Close;
   qryParam.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
   qryParam.Open;
   bFlgColetor   := not (qryParamCOLETORDADOS.AsInteger = 0);
   iTipoColetor  := qryParamCOLETORDADOS.AsInteger;
   iDigMascPlaca := qryParamDIGMASCPLACA.AsInteger;
   bbtnExportar.Visible := bFlgColetor;
   //-------------------------------------------------------------------------------------
   bbtnGerar.Enabled := False;
   SelMestreDet(-1);
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmInvGeracao.SelMestreDet( n : LongInt );
begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Params[1].Value := Sistema.IdEmpresa;
   qry.Open;
   //-------------------------------------------------------------------------------------
   bbtnExportar.Visible := bFlgColetor;
   bbtnExportar.Enabled := not qry.IsEmpty;
   //-------------------------------------------------------------------------------------
   qryResp.Close;
   qryResp.ParamByName('PIDRESP').AsInteger := qryIDRESPONSAVEL.AsInteger;
   qryResp.Open;
   //-------------------------------------------------------------------------------------
   qryDet.Close;
   qryDet.Params[0].Value := n;
   qryDet.Params[1].Value := Sistema.IdEmpresa;
   qryDet.Open;
   //-------------------------------------------------------------------------------------
   CarregaListaLocalizacoes;
end;
//========================================================================================
procedure TfrmInvGeracao.CmeCadastroInsert(Sender: TObject);
begin
   bInsert := True;
   SelMestreDet(-1);
   inherited;
   dbeIdInventario.Enabled  := True;
   bbtnGeraIdInvent.Enabled := True;
   bbtnGerar.Enabled := True;
   dbeIdInventario.SetFocus;
end;
//========================================================================================
procedure TfrmInvGeracao.CmeCadastroEdit(Sender: TObject);
begin
   bInsert := False;
   inherited;
   dbeIdInventario.Enabled  := False;
   bbtnGeraIdInvent.Enabled := False;
   bbtnGerar.Enabled := True;
   dbeDataInicio.SetFocus;
end;
//========================================================================================
procedure TfrmInvGeracao.CmeCadastroDelete(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   qryDet.First;
   while Not qryDet.EOF Do
   begin
      qryDet.Delete;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
   bbtnExportar.Enabled := False;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmInvGeracao.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if (MontaSelect.RetornouValor) then
      SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmInvGeracao.bbtnGeraIdInventClick(Sender: TObject);
begin
   inherited;
   qryIDINVENTARIOBENS.AsInteger := LeUltRegistro(nil,'INVENTARIOBENS');
end;
//========================================================================================
procedure TfrmInvGeracao.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResp.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryResp.Close;
   if (MSResp.RetornouValor) then
   begin
      qryResp.ParamByName('PIDRESP').AsInteger := StrToInt(MSResp.ValoresChave[0]);
      qryResp.Open;
   end;
end;
//========================================================================================
procedure TfrmInvGeracao.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
   Accept := True;
   if (trim(dbeIdInventario.Text) = '') then
   begin
      MsgDlg('Número do Levantamento de Inventário não foi preenchido',
             'Erro',mtError,[mbOK],0);
      dbeIdInventario.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeDataInicio.Text) = '') then
   begin
      MsgDlg('Data de Início do Levantamento não foi preenchida','Erro',mtError,[mbOK],0);
      dbeDataInicio.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeResponsavel.Text) = '') then
   begin
       MsgDlg('Responsável pelo Levantamento não foi selecionado','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
       Accept := False;
   end;
   //-------------------------------------------------------------------------------------
   if qryDet.IsEmpty then
   begin
       MsgDlg('Selecione as localizações/bens que serão usados no Levantamento',
              'Erro',mtError,[mbOK],0);
       SrcList.SetFocus;
       Accept := False;
   end;
   //-------------------------------------------------------------------------------------
   bTstConf := Accept;
end;
//========================================================================================
procedure TfrmInvGeracao.bbtnConfirmarClick(Sender: TObject);
var
   bResult : Boolean;

begin
   Screen.Cursor := crSQLWait;
   CmeCadastro.BeforeConfirma(Sender,bResult);
   if bResult then
   begin
      inherited;
      if ( bInsert ) And ( bTstConf ) Then
         SelMestreDet(-1);
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmInvGeracao.CmeCadastroConfirma(Sender: TObject);
var
   iIdInventarioBens : Integer;

begin
   Screen.Cursor := crSQLWait;
   if qry.State in [dsInsert,dsEdit] then
   begin
      try
         StartTransacao;
         //-------------------------------------------------------------------------------
         iIdInventarioBens := qry.FieldByName('IDINVENTARIOBENS').AsInteger;
         qry.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
         qry.FieldByName('IDRESPONSAVEL').AsInteger := qryRespIDRESPONSAVEL.AsInteger;
         if (qry.State = dsInsert) then
         begin
            qry.FieldByName('STATUS').AsInteger := 0;
         end;
         //-------------------------------------------------------------------------------
         // Códigos de Status
         //-------------------------------------------------------------------------------
         // 0 - Inventário em Andamento
         // 1 - Inventário Encerrado
         // 2 - Inventário Processado
         //-------------------------------------------------------------------------------
         qryDet.DisableControls;
         qryDet.First;
         while not qryDet.EOF do
         begin
            qryDet.Edit;
            qryDetIDINVENTARIOBENS.AsInteger := iIdInventarioBens;
            qryDetIDEMPRESA.AsInteger        := Sistema.IdEmpresa;
            qryDetIIBPLACA.AsFloat           := qryDetPLACA.AsFloat;
            qryDetIIBIDBEM.AsFloat           := qryDetIDBEM.AsFloat;
            qryDetIIBFLGPLACA.AsInteger      := 0;
            qryDetIIBFLGSITFISICA.AsInteger  := 0;
            qryDet.Next;
         end;
         //-------------------------------------------------------------------------------
         qry.ApplyUpdates;
         qryDet.ApplyUpdates;
         CommitTransacao;
         //-------------------------------------------------------------------------------
         // Caso seja inserção, pergunte se deseja exportar dados para o coletor de dados
         // Analizar a hipotese de colocar parâmetros sobre o uso do coletor.
         //-------------------------------------------------------------------------------
         //if bInsert then
         //begin
         //   {}
         //end;
      except
         RollBackTransacao;
         Abort;
      end;
   end else
   begin
      qryDet.ApplyUpdates;
      qry.ApplyUpdates;
   end;
   qryDet.EnableControls;
   dbeIdInventario.Enabled  := True;
   bbtnGeraIdInvent.Enabled := True;
   bbtnGerar.Enabled := False;
   inherited;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmInvGeracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qryDet.Close;
   qryLocal.Close;
   qryResp.Close;
   qryBensLocal.Close;
   //-------------------------------------------------------------------------------------
   qry.UnPrepare;
   qryDet.UnPrepare;
   qryLocal.UnPrepare;
   qryResp.Close;
   qryBensLocal.UnPrepare;
end;
//========================================================================================
procedure TfrmInvGeracao.bbtnCancelarClick(Sender: TObject);
begin
   dbeIdInventario.Enabled  := True;
   bbtnGeraIdInvent.Enabled := True;
   bbtnGerar.Enabled := False;
   SelMestreDet(-1);
   inherited;
end;
//========================================================================================
procedure TfrmInvGeracao.sbtnApagarClick(Sender: TObject);
begin
   if (qrySTATUS.AsInteger > 1) then
   begin
      MsgDlg('Exclusão não será permitida. Inventário já Processado',
             'Erro',mtError,[mbOK],0);
      sbtnApagar.Down := False;
      exit;
   end else
   begin
      qryLocal.Close;
      qryLocal.Open;
      inherited;
      SelMestreDet(-1);
   end;
end;
//========================================================================================
procedure TfrmInvGeracao.bbtnGerarClick(Sender: TObject);
var
   iListPos     : Integer;
   sPlacaMestre : String;
begin
   inherited;
   Screen.Cursor := crSQLWait;
   //-------------------------------------------------------------------------------------
   // Remove a Seleção Anterior
   //-------------------------------------------------------------------------------------
   qryDet.DisableControls;
   qryDet.Close;
   qryDet.Open;
   //-------------------------------------------------------------------------------------
   iListPos := 0;
   while (iListPos <= (DstList.Items.Count - 1)) do
   begin
      qryBensLocal.Close;
      qryBensLocal.ParamByName('PIDLOCAL').AsInteger   := StrToInt(trim(copy(DstList.Items.Strings[iListPos],52,6)));
      qryBensLocal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qryBensLocal.Open;
      while not qryBensLocal.EOF do
      begin
         sPlacaMestre := copy(qryBensLocalPLACA.AsString,1,(length(qryBensLocalPLACA.AsString) - iDigMascPlaca)) +
                              StringOfChar('0',iDigMascPlaca);
         if qryBensLocalPLACA.AsString = sPlacaMestre then
         begin
            qryDet.Append;
            qryDetIDPESSOA.AsInteger         := qryBensLocalIDPESSOA.AsInteger;
            qryDetIDBEM.AsInteger            := qryBensLocalIDBEM.AsInteger;
            qryDetPLACA.AsFloat              := qryBensLocalPLACA.AsFloat;
            qryDetDESBEM.AsString            := qryBensLocalDESBEM.AsString;
            qryDetIIBCONJUNTOATUAL.AsInteger := qryBensLocalIDCONJUNTO.AsInteger;
            qryDetDESCCONJUNTO.AsString      := qryBensLocalDESCCONJUNTO.AsString;
            qryDetIIBLOCALATUAL.AsInteger    := qryBensLocalIDLOCALIZACAO.AsInteger;
            qryDetDESCLOCAL.AsString         := qryBensLocalDESCLOCAL.AsString;
            qryDetIDCLASSEBEM.AsInteger      := qryBensLocalIDCLASSEBEM.AsInteger;
            qryDetCODHIERARQ.AsString        := qryBensLocalCODHIERARQ.AsString;
            qryDetDESCCLASSE.AsString        := qryBensLocalDESCCLASSE.AsString;
            qryDet.Post;
         end;
         qryBensLocal.Next;
      end;
      iListPos := iListPos + 1;
   end;
   qryDet.First;
   qryDet.EnableControls;
   lblNumBens.Caption := 'Número de Bens : ' + inttostr(qryDet.RecordCount);
   Application.ProcessMessages;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmInvGeracao.dbgrdDetCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;
//========================================================================================
procedure TfrmInvGeracao.dbgrdDetTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   DBgrdDet.Invalidate;
end;
//========================================================================================
procedure TfrmInvGeracao.bbtnExportarClick(Sender: TObject);
begin
   inherited;
   if iTipoColetor = 1 then
   begin
      Application.CreateForm(TfrmInvColPDT3100,frmInvColPDT3100);
      frmInvColPDT3100.FormStyle          := FsNormal;
      frmInvColPDT3100.Visible            := False;
      frmInvColPDT3100.rdgpOper.ItemIndex := 0;
      frmInvColPDT3100.ShowModal;
      frmInvColPDT3100.Release;
   end else
   if iTipoColetor = 2 then
   begin
      Application.CreateForm(TfrmInvColScwLucas7000,frmInvColScwLucas7000);
      frmInvColScwLucas7000.FormStyle          := FsNormal;
      frmInvColScwLucas7000.Visible            := False;
      frmInvColScwLucas7000.rdgpOper.ItemIndex := 0;
      frmInvColScwLucas7000.ShowModal;
      frmInvColScwLucas7000.Release;
   end;
   bbtnExportar.Down := False;
end;
//========================================================================================
procedure TfrmInvGeracao.sbtnInserirClick(Sender: TObject);
begin
   inherited;
   CarregaListaLocalizacoes;
end;
//========================================================================================
// Manipulação da Dual List Box
//========================================================================================
procedure TfrmInvGeracao.CarregaListaLocalizacoes;
var
   iPos : Integer;
   sDescLocal, sIdLocal : String;

begin
   inherited;
   SrcList.Clear;
   DstList.Clear;
   //-------------------------------------------------------------------------------------
   qryLocal.First;
   while not qryLocal.EOF do
   begin
      sDescLocal := '';
      for iPos := 1 to 50 do
      begin
         if (iPos <= length(qryLocalDESCLOCALIZACAO.AsString)) then
            sDescLocal := sDescLocal + copy(qryLocalDESCLOCALIZACAO.AsString, iPos, 1)
         else
            sDescLocal := sDescLocal + ' ';
      end;
      //----------------------------------------------------------------------------------
      sIdLocal := '';
      for iPos := 1 to 6 do
      begin
         if (iPos <= length(qryLocalIDLOCALIZACAO.AsString)) then
            sIdLocal := sIdLocal + copy(qryLocalIDLOCALIZACAO.AsString, iPos, 1)
         else
            sIdLocal := sIdLocal + ' ';
      end;
      //----------------------------------------------------------------------------------
      if qryDet.Locate('IDLOCALIZACAO', qryLocalIDLOCALIZACAO.AsInteger, []) then
         DstList.Items.Add(sDescLocal + ' ' + sIdLocal)
      else
         SrcList.Items.Add(sDescLocal + ' ' + sIdLocal);
      //----------------------------------------------------------------------------------
      qryLocal.Next;
   end;
   SetItem(SrcList,0);
   SetItem(DstList,0);
end;
//========================================================================================
procedure TfrmInvGeracao.IncludeBtnClick(Sender: TObject);
var
   Index: Integer;

begin
   inherited;
   Index := GetFirstSelection(SrcList);
   MoveSelected(SrcList, DstList.Items);
   SetItem(SrcList, Index);
end;
//========================================================================================
procedure TfrmInvGeracao.IncAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   inherited;
   for I := 0 to SrcList.Items.Count - 1 do
     DstList.Items.AddObject(SrcList.Items[I],
       SrcList.Items.Objects[I]);
   SrcList.Items.Clear;
   SetItem(SrcList, 0);
end;
//========================================================================================
procedure TfrmInvGeracao.ExcludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   inherited;
   Index := GetFirstSelection(DstList);
   MoveSelected(DstList, SrcList.Items);
   SetItem(DstList, Index);
end;
//========================================================================================
procedure TfrmInvGeracao.ExAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   inherited;
   for I := 0 to DstList.Items.Count - 1 do
      SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
   DstList.Items.Clear;
   SetItem(DstList, 0);
end;
//========================================================================================
procedure TfrmInvGeracao.SetButtons;
var
   SrcEmpty, DstEmpty: Boolean;
begin
   SrcEmpty := SrcList.Items.Count = 0;
   DstEmpty := DstList.Items.Count = 0;
   IncludeBtn.Enabled := not SrcEmpty;
   IncAllBtn.Enabled := not SrcEmpty;
   ExcludeBtn.Enabled := not DstEmpty;
   ExAllBtn.Enabled := not DstEmpty;
end;
//========================================================================================
procedure TfrmInvGeracao.MoveSelected(List: TCustomListBox; Items: TStrings);
var
   I: Integer;
begin
   for I := List.Items.Count - 1 downto 0 do
      if List.Selected[I] then
      begin
         Items.AddObject(List.Items[I], List.Items.Objects[I]);
         List.Items.Delete(I);
      end;
end;
//========================================================================================
procedure TfrmInvGeracao.SetItem(List: TListBox; Index: Integer);
var
   MaxIndex: Integer;
begin
   with List do
   begin
      if CanFocus then SetFocus;
      MaxIndex := List.Items.Count - 1;
      if Index = LB_ERR then Index := 0
      else if Index > MaxIndex then Index := MaxIndex;
      Selected[Index] := True;
   end;
   SetButtons;
end;
//========================================================================================
function TfrmInvGeracao.GetFirstSelection(List: TCustomListBox): Integer;
begin
   for Result := 0 to List.Items.Count - 1 do
     if List.Selected[Result] then Exit;
   Result := LB_ERR;
end;

procedure TfrmInvGeracao.qryDetAfterOpen(DataSet: TDataSet);
begin
   inherited;
   lblNumBens.Caption := inttostr(qryDet.RecordCount) + ' Bens' ;
end;

procedure TfrmInvGeracao.qryDetAfterInsert(DataSet: TDataSet);
begin
   inherited;
   lblNumBens.Caption := inttostr(qryDet.RecordCount) + ' Bens' ;
end;

procedure TfrmInvGeracao.qryDetAfterDelete(DataSet: TDataSet);
begin
   inherited;
   lblNumBens.Caption := inttostr(qryDet.RecordCount) + ' Bens' ;
end;

procedure TfrmInvGeracao.qryDetAfterClose(DataSet: TDataSet);
begin
   inherited;
   lblNumBens.Caption := '0 Bens' ;
end;

end.

