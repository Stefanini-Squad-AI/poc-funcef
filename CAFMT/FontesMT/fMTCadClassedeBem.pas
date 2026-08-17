unit fMTCadClassedeBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet, uCMTypes,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, wwdbedit,
  uCtrlClassedeBem, uCtrlGrupoContab, uCtrlParamCAF;

type
  TfrmMTCadClassedeBem = class(TFrmCadastroMestreDetMT)
    Label2: TLabel;
    dbeCodigo: TwwDBEdit;
    Label3: TLabel;
    dbeDescricao: TwwDBEdit;
    pnlAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    Label4: TLabel;
    dbeMaskIdOpc: TwwDBEdit;
    cdsClassexGrupo: TCMClientDataSet;
    cdsGrupoContab: TCMClientDataSet;
    cdsClasses: TCMClientDataSet;
    cdsClassexGrupo2: TCMClientDataSet;
    cdsParamCAF: TCMClientDataSet;
    pnlDetGrupos: TPanel;
    Label5: TLabel;
    SrcList: TListBox;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    Label6: TLabel;
    DstList: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure dbeCodigoExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure IncludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure sbtnSinteticoClick(Sender: TObject);
    procedure sbtnAnaliticoClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    ClassedeBem               : TCtrlClassedeBem;
    GrupoContab               : TCtrlGrupoContab;
    ParamCAF                  : TCtrlParamCAF;
    iSoma, Ind                : Integer;
    sMascaraClasse, sMascPict : String;
    lNivel                    : Array [0..20] of Integer;
    //------------------------------------------------------------------------------------
    procedure SelClassedeBem(fIdClasse : Extended);
    procedure CarregaListaClassexGrupo(fIdClasse : Extended);
    procedure GravaClassexGrupo;
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function  GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
  public
    { Public declarations }
  end;

var
  frmMTCadClassedeBem: TfrmMTCadClassedeBem;

implementation

{$R *.DFM}

uses uMensErro, dBasedados, uSistema, uIntegraBack;

procedure TfrmMTCadClassedeBem.FormCreate(Sender: TObject);
var
   iGrau       : Integer;
   bCorrompido : Boolean;
begin
   inherited;
   ClassedeBem := TCtrlClassedeBem.Create;
   ClassedeBem.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   ClassedeBem.cds             := cds;
   ClassedeBem.cdsClassexGrupo := cdsClassexGrupo;
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsGrupoContab.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsParamCAF.Data := ParamCAF.ListaParamCAF(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   sMascaraClasse := cdsParamCAF.FieldByName('MASCARACLASSE').AsString;
   sMascPict := '';
   if not ClassedeBem.MascaraOK(sMascaraClasse,sMascPict,lNivel,iSoma,ind) then
   begin
      MsgDlg(GrupoContab.MessageInfo,'Erro',mtError,[mbOK],0);
      bbtnSairClick(Self);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   SelClassedeBem(-1);
   //-------------------------------------------------------------------------------------
   // Confere a estrutura hierarquica
   //-------------------------------------------------------------------------------------
   cdsClasses.Data := ClassedeBem.ListaClassedeBem;
   bCorrompido := False;
   cdsClasses.First;
   while not cdsClasses.EOF do
   begin
      if not ClassedeBem.Verifica_Node(trim(cdsClasses.FieldByName('CODHIERARQ').AsString),
                                       trim(cdsClasses.FieldByName('CODHIERARQ').AsString),
                                       False, iGrau, lNivel, Ind) then
      begin
         bCorrompido := True;
      end;
      cdsClasses.Next;
   end;
   //-------------------------------------------------------------------------------------
   if bCorrompido then
   begin
      MsgDlg('A Estrutura hierárquica da Classe de Bens está corrompida','Erro',mtError,[mbOk],0);
      bbtnSairClick(Self);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   pnlDetGrupos.Enabled := False;
end;
//========================================================================================
procedure TFrmMTCadClassedeBem.SelClassedeBem(fIdClasse : Extended);
begin
   cds.Data             := ClassedeBem.ProcurarClassedeBem(fIdClasse);
   cdsClassexGrupo.Data := ClassedeBem.ListaClassexGrupo(fIdClasse,Sistema.IdEmpresa);
   TStringField(cds.FieldByName('CODHIERARQ')).EditMask := sMascaraClasse + ';0;_';
   //-------------------------------------------------------------------------------------
   CarregaListaClassexGrupo(fIdClasse);
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ClassedeBem.Free;
   GrupoContab.Free;
   ParamCAF.Free;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ClassedeBem.AplicaOperacao('S');
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ClassedeBem.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := ClassedeBem.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroAbortConfirma(Sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(GrupoContab.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelClassedeBem(strtofloat(MontaSelect.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroInsert(Sender: TObject);
begin
   pnlDetGrupos.Enabled := True;
   SelClassedeBem(-1);
   inherited;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroEdit(Sender: TObject);
begin
   pnlDetGrupos.Enabled := True;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroDelete(Sender: TObject);
begin
   if not ClassedeBem.BensnaClasse(cds.FieldByName('IDCLASSEBEM').AsFloat) then
   begin
      if not ClassedeBem.Tem_Filhos(cds.FieldByName('ANASINT').AsString,
                                    cds.FieldByName('CODHIERARQ').AsString) then
      begin
         cdsClassexGrupo.First;
         while not cdsClassexGrupo.EOF do
            cdsClassexGrupo.Delete;
         inherited;
      end else
      begin
         MsgDlg(ClassedeBem.MessageInfo,'Erro',mtError,[mbOk],0);
      end;
   end else
   begin
      MsgDlg(ClassedeBem.MessageInfo,'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.dbeCodigoExit(Sender: TObject);
var
   bOk   : Boolean;
   iGrau : Integer;

begin
   if bbtnCancelar.Focused then
      exit;
   //-------------------------------------------------------------------------------------
   try
      inherited;
      pnlAnaSint.Enabled := True;
      //----------------------------------------------------------------------------------
      if trim(dbeCodigo.Text) <> '' then
      begin
         bOk := ClassedeBem.Verifica_Node(trim(dbeCodigo.Text),
                                          trim(dbeCodigo.Text),
                                          False, iGrau, lNivel, Ind);
         if not bOk then
         begin
            dbeCodigo.Text := '';
            dbeCodigo.EditText := '';
            cds.FieldValues['CODHIERARQ'] := '';
            dbeCodigo.SetFocus;
            exit;
         end;
         //-------------------------------------------------------------------------------
         if (iGrau = 1) and ((Ind + 1) > 1) then
            if pos('.',sMascaraClasse) <> 0 then
            begin
               sbtnSintetico.Down := True;
               sbtnAnalitico.Down := False;
               cds.FieldByName('ANASINT').AsString := 'S';
               pnlAnaSint.Enabled := False;
            end else
            begin
               sbtnSintetico.Down := False;
               sbtnAnalitico.Down := True;
               cds.FieldByName('ANASINT').AsString := 'A';
               pnlAnaSint.Enabled := False;
            end;
         //-------------------------------------------------------------------------------
         if iGrau = (Ind + 1) then
         begin
            sbtnSintetico.Down := False;
            sbtnAnalitico.Down := True;
            cds.FieldByName('ANASINT').AsString := 'A';
            pnlAnaSint.Enabled := False;
         end;
      end;
   except
      Raise;
   end;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := False;
   if trim(dbeCodigo.Text) = '' then
   begin
      MsgDlg('Obrigatório preencher o Código Hierárquico da Classe',LerMensagem(2),mtError,[mbOk],0);
      dbeCodigo.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sbtnAnalitico.down = False) and (sbtnSintetico.down = False) then
   begin
      MsgDlg('Obrigatório selecionar o Tipo Hierárquico da Classe',LerMensagem(2),mtError,[mbOk],0);
      pnlAnaSint.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if trim(dbeDescricao.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher a Descrição.',LerMensagem(2),mtError,[mbOk],0);
      dbeDescricao.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if sbtnAnalitico.down then
      cds.FieldByName('ANASINT').AsString := 'A';
   if sbtnSintetico.down then
      cds.FieldByName('ANASINT').AsString := 'S';
   //-------------------------------------------------------------------------------------
   GravaClassexGrupo;
   //-------------------------------------------------------------------------------------
   Accept := True;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;

begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelClassedeBem(-1);
   pnlDetGrupos.Enabled := False;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   pnlDetGrupos.Enabled := False;
   SelClassedeBem(-1);
end;
//========================================================================================
// Manipulação da Dual List Box
//========================================================================================
procedure TfrmMTCadClassedeBem.CarregaListaClassexGrupo(fIdClasse : Extended);
var
   iPos    : Integer;
   sClasse : String;

begin
   inherited;
   SrcList.Clear;
   DstList.Clear;
   //-------------------------------------------------------------------------------------
   cdsClassexGrupo.Data := ClassedeBem.ListaClassexGrupo(fIdClasse,Sistema.IdEmpresa);
   cdsGrupoContab.Data  := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa);
   while (not cdsGrupoContab.EOF) do
   begin
      if cdsGrupoContab.FieldByName('TIPO').AsString = 'A' then
      begin
         sClasse := '';
         for iPos := 1 to 15 do
         begin
            if iPos <= length(cdsGrupoContab.FieldByName('CLASSE').AsString) then
               sClasse := sClasse + copy(cdsGrupoContab.FieldByName('CLASSE').AsString,iPos,1)
            else
               sClasse := sClasse + ' ';
         end;
         //-------------------------------------------------------------------------------
         if cdsClassexGrupo.Locate('IDGRUPO',cdsGrupoContab.FieldByName('IDGRUPO').AsInteger,[]) then
            DstList.Items.Add(sClasse+' '+cdsGrupoContab.FieldByName('NOME').AsString)
         else
            SrcList.Items.Add(sClasse+' '+cdsGrupoContab.FieldByName('NOME').AsString);
      end;
      cdsGrupoContab.Next;
   end;
   SetItem(SrcList,0);
   SetItem(DstList,0);
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.GravaClassexGrupo;
var
   iListPos   : Integer;
   sClasse    : String;

begin
   cdsGrupoContab.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   // Insere os Grupos Contábeis acrescentados a lista
   //-------------------------------------------------------------------------------------
   if cds.State = dsEdit then
      cdsClassexGrupo2.Data  := ClassedeBem.ListaClassexGrupo(cds.FieldByName('IDCLASSEBEM').AsInteger,
                                                              Sistema.IdEmpresa)
   else
      cdsClassexGrupo2.Data  := ClassedeBem.ListaClassexGrupo(-1,-1);
   //-------------------------------------------------------------------------------------
   iListPos := 0;
   while (iListPos <= (DstList.Items.Count - 1)) do
   begin
      sClasse := trim(copy(DstList.Items.Strings[iListPos],1,15));
      cdsGrupoContab.Locate('CLASSE',sClasse,[]);
      if cds.State = dsEdit then
      begin
         if not cdsClassexGrupo2.IsEmpty then
         begin
            if not cdsClassexGrupo2.Locate('IDCLASSEBEM;IDGRUPO',
                                           VarArrayOf([cds.FieldByName('IDCLASSEBEM').AsInteger,
                                                       cdsGrupoContab.FieldByName('IDGRUPO').AsInteger]),[]) then
            begin
               cdsClassexGrupo.Append;
               cdsClassexGrupo.FieldByName('IDCLASSEBEM').AsInteger := cds.FieldByName('IDCLASSEBEM').AsInteger;
               cdsClassexGrupo.FieldByName('IDGRUPO').AsInteger     := cdsGrupoContab.FieldByName('IDGRUPO').AsInteger;
               cdsClassexGrupo.Post;
            end;
         end else
         begin
            cdsClassexGrupo.Append;
            cdsClassexGrupo.FieldByName('IDCLASSEBEM').AsInteger := cds.FieldByName('IDCLASSEBEM').AsInteger;
            cdsClassexGrupo.FieldByName('IDGRUPO').AsInteger     := cdsGrupoContab.FieldByName('IDGRUPO').AsInteger;
            cdsClassexGrupo.Post;
         end;
      end else
      begin
         cdsClassexGrupo.Append;
         cdsClassexGrupo.FieldByName('IDCLASSEBEM').AsInteger := cds.FieldByName('IDCLASSEBEM').AsInteger;
         cdsClassexGrupo.FieldByName('IDGRUPO').AsInteger     := cdsGrupoContab.FieldByName('IDGRUPO').AsInteger;
         cdsClassexGrupo.Post;
      end;
      iListPos := iListPos + 1;
   end;
   //-------------------------------------------------------------------------------------
   // Remove os Centros de Custos retirados da lista
   //-------------------------------------------------------------------------------------
   iListPos := 0;
   while (iListPos <= (srcList.Items.Count - 1)) do
   begin
      cdsGrupoContab.Locate('CLASSE',trim(copy(srcList.Items.Strings[iListPos],1,15)),[]);
      if cds.State = dsEdit then
      begin
         if cdsClassexGrupo.Locate('IDCLASSEBEM;IDGRUPO',
                                   VarArrayOf([cds.FieldByName('IDCLASSEBEM').AsInteger,
                                               cdsGrupoContab.FieldByName('IDGRUPO').AsInteger]),[]) then
         begin
            cdsClassexGrupo.Delete;
         end;
      end;
      iListPos := iListPos + 1;
   end;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.IncludeBtnClick(Sender: TObject);
var
   Index: Integer;

begin
   inherited;
   Index := GetFirstSelection(SrcList);
   MoveSelected(SrcList, DstList.Items);
   SetItem(SrcList, Index);
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.IncAllBtnClick(Sender: TObject);
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
procedure TfrmMTCadClassedeBem.ExAllBtnClick(Sender: TObject);
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
procedure TfrmMTCadClassedeBem.ExcludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   inherited;
   Index := GetFirstSelection(DstList);
   MoveSelected(DstList, SrcList.Items);
   SetItem(DstList, Index);
end;
//========================================================================================
function TfrmMTCadClassedeBem.GetFirstSelection(List: TCustomListBox): Integer;
begin
   for Result := 0 to List.Items.Count - 1 do
     if List.Selected[Result] then Exit;
   Result := LB_ERR;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.MoveSelected(List: TCustomListBox; Items: TStrings);
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
procedure TfrmMTCadClassedeBem.SetItem(List: TListBox; Index: Integer);
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
procedure TfrmMTCadClassedeBem.SetButtons;
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
procedure TfrmMTCadClassedeBem.CdsAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if cds.FieldByName('ANASINT').AsString = 'A' then
      sbtnAnalitico.down := True
   else
   if cds.FieldByName('ANASINT').AsString = 'S' then
      sbtnSintetico.down := True;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.sbtnSinteticoClick(Sender: TObject);
begin
   inherited;
   if sbtnSintetico.Down then
      sbtnAnalitico.Down := False
   else
      sbtnAnalitico.Down := True;
end;
//========================================================================================
procedure TfrmMTCadClassedeBem.sbtnAnaliticoClick(Sender: TObject);
begin
   inherited;
   if sbtnSintetico.Down then
      sbtnAnalitico.Down := False
   else
      sbtnAnalitico.Down := True;
end;

end.
