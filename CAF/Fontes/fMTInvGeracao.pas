{-------------------------------------------------------------------------------
----------------------ALTERAÇÕES / IMPLEMENTAÇÕES ------------------------------
--------------------------------------------------------------------------------
//Ewerton Beltramini .. Remoção da mascara segundo solicitado no SIG96251.
Rotina......: bbtnGerarClick
Nº SIG......: 96251
Data........: 22/01/2020
Responsável.: Ewerton Beltramini
Descrição...: Remoção da mascara da placa para exibição em tela de todas as
              placas localizadas na consulta.
--------------------------------------------------------------------------------
Rotina......: bbtnGerarClick
Nº SIG......: 48344
Data........: 12/12/2018
Responsável.: Everson Cunha
Descrição...: Segregação do inventário dos bens
De acordo com o MEG 075 de infraestrutura, subitem 5.1.10.1 - A COPAD realizará
inventário anual dos Bens Patrimoniais, exceto os equipamentos de TI.
Os equipamentos de TI serão inventariados pela GETIF.
--------------------------------------------------------------------------------
Pendência    : 117371_552815
Responsável  : Bruno Bastos
Data         : 04/06/2009
Descrição    : Tornar alguns componentes readonly da tela de importação e
               exportação.
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27279
Responsável  : Daniel Simões
Data         : 24/01/2008
Descrição    : Sobreposição do form em função da pendência...    
-------------------------------------------------------------------------------}

unit fMTInvGeracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCadastroMestreDetMT, MontaSelect, DB, DBClient, uCmSqlParams,
  fcLabel, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit,
  Buttons, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  uCMTypes, uCtrlPadroes, uCtrlInventarioBens, uCtrlParamCAF,
  uCtrlLocalizacoes, uCtrlResponsavel, DBTables, Wwquery;

type
  TfrmMTInvGeracao = class(TFrmCadastroMestreDetMT)
    dsResp: TwwDataSource;
    Label1: TLabel;
    dbeIdInventario: TwwDBEdit;
    bbtnGeraIdInvent: TBitBtn;
    Label2: TLabel;
    dbeDataInicio: TCMDateTimePicker;
    Label9: TLabel;
    dbeResponsavel: TwwDBEdit;
    bbtnSelResp: TBitBtn;
    DstList: TListBox;
    Label5: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    SrcList: TListBox;
    Label4: TLabel;
    cdsDet: TCMClientDataSet;
    cdsResp: TCMClientDataSet;
    MSResp: TMontaSelect;
    bbtnGerar: TToolbarButton97;
    bbtnExportar: TToolbarButton97;
    lblNumBens: TfcLabel;
    cdsBensLocal: TCMClientDataSet;
    cdsLocal: TCMClientDataSet;
    sqlDet: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure bbtnGeraIdInventClick(Sender: TObject);
    procedure bbtnGerarClick(Sender: TObject);
    procedure bbtnExportarClick(Sender: TObject);
    procedure cdsDetAfterOpen(DataSet: TDataSet);
    procedure cdsDetAfterInsert(DataSet: TDataSet);
    procedure cdsDetAfterDelete(DataSet: TDataSet);
    procedure cdsDetAfterClose(DataSet: TDataSet);
    procedure IncludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);
  private
    { Private declarations }
    InventarioBens : TCtrlInventarioBens;
    ParamCAF       : TCtrlParamCAF;
    Localizacao    : TCtrlLocalizacoes;
    Responsavel    : TCtrlResponsavel;
    //------------------------------------------------------------------------------------
    bFlgColetor   : Boolean;
    iTipoColetor,
    iDigMascPlaca : Integer;
    //------------------------------------------------------------------------------------
    procedure SelInventarioBens(fIdPessoa, fIdInventarioBens : Extended);
    //------------------------------------------------------------------------------------
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function  GetFirstSelection(List: TCustomListBox): Integer;
    function  CentroCustoTI(IdUsuario: Double): Boolean; //Everson Cunha - SIG48344
    procedure SetButtons;
    procedure CarregaListaLocalizacoes;

  public
    { Public declarations }
  end;

var
  frmMTInvGeracao: TfrmMTInvGeracao;

implementation

{$R *.dfm}

Uses uMensErro, uSistema, fMTInvColPDT3100, fMTInvColScwLucas7000, fMTInvColCMNet;

procedure TfrmMTInvGeracao.FormCreate(Sender: TObject);
begin
   inherited;
   InventarioBens := TCtrlInventarioBens.Create;
   InventarioBens.InitializeAs(Padroes);
   InventarioBens.cds             := cds;
   InventarioBens.cdsItensInvBens := cdsDet;
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   bFlgColetor := not (ParamCAF.COLETORDADOS = 0);
   iTipoColetor := ParamCAF.COLETORDADOS;
   iDigMascPlaca := ParamCAF.DIGMASCPLACA;
   bbtnExportar.Visible := bFlgColetor;
   //-------------------------------------------------------------------------------------
   Localizacao := TCtrlLocalizacoes.Create;
   Localizacao.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('INVENTARIOBENS.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
   SelInventarioBens(Sistema.IdEmpresa, 0);
   //-------------------------------------------------------------------------------------
   bbtnGerar.Enabled := False;
end;
//========================================================================================
procedure TFrmMTInvGeracao.SelInventarioBens(fIdPessoa, fIdInventarioBens : Extended);
begin
   cds.Data := InventarioBens.ListaInventarioBens(fIdPessoa, fIdInventarioBens);
   if not cds.IsEmpty then
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(cds.FieldByName('IDRESPONSAVEL').AsFloat);
      cdsDet.Data  := InventarioBens.ListaItensInvBens(cds.FieldByName('IDEMPRESA').AsFloat,
                                                       cds.FieldByName('IDINVENTARIOBENS').AsFloat);
   end else
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(0);
      cdsDet.Data  := InventarioBens.ListaItensInvBens(Sistema.IdEmpresa, 0);
   end;
   //-------------------------------------------------------------------------------------
   bbtnExportar.Visible := bFlgColetor;
   bbtnExportar.Enabled := not cds.IsEmpty;
   CarregaListaLocalizacoes;
end;
//========================================================================================
procedure TfrmMTInvGeracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   InventarioBens.Free;
   ParamCAF.Free;
   Localizacao.Free;
   Responsavel.Free;
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := InventarioBens.AplicaOperacao('S');
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := InventarioBens.AplicaOperacao('EC');
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := InventarioBens.AplicaOperacao('EC');
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if trim(InventarioBens.MessageInfo) <> '' then
      MsgDlg(InventarioBens.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelInventarioBens(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroInsert(Sender: TObject);
begin
   SelInventarioBens(0, 0);
   CarregaListaLocalizacoes;
   inherited;
   dbeIdInventario.Enabled  := True;
   bbtnGeraIdInvent.Enabled := True;
   bbtnGerar.Enabled := True;
   dbeIdInventario.SetFocus;
   //-------------------------------------------------------------------------------------
   cds.FieldByName('STATUS').AsInteger := 0;
   cds.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroEdit(Sender: TObject);
begin
   if cds.FieldbyName('STATUS').AsInteger < 1 then
   begin
      inherited;
      dbeIdInventario.Enabled  := False;
      bbtnGeraIdInvent.Enabled := False;
      bbtnGerar.Enabled := True;
      dbeDataInicio.SetFocus;
   end else
   begin
      MsgDlg('Não é possível alterar um Levantamento de Inventário já Encerrado e/ou Processado!',
             'Erro', mtError, [mbOk], 0);
   end;
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroDelete(Sender: TObject);
begin
   if cds.FieldbyName('STATUS').AsInteger < 1 then
   begin
      cdsDet.First;
      while not cdsDet.EOF do
         cdsDet.Delete;
      inherited;
      bbtnExportar.Enabled := False;
   end else
   begin
      MsgDlg('Não é possível remover um Levantamento de Inventário já Encerrado e/ou Processado!',
             'Erro', mtError, [mbOk], 0);
   end;
end;
//========================================================================================
procedure TfrmMTInvGeracao.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResp.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSResp.RetornouValor then
   begin
      cdsResp.Data := Responsavel.ListaResponsavel(StrToFloat(MSResp.ValoresChave[0]));
      cds.FieldbyName('IDRESPONSAVEL').AsFloat := cdsResp.FieldbyName('IDRESPONSAVEL').AsFloat;
   end;
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := True;
   if trim(dbeIdInventario.Text) = '' then
   begin
      MsgDlg('Número do Levantamento de Inventário não foi preenchido',
             'Erro',mtError,[mbOK],0);
      dbeIdInventario.SetFocus;
      Accept := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if trim(dbeDataInicio.Text) = '' then
   begin
      MsgDlg('Data de Início do Levantamento não foi preenchida','Erro',mtError,[mbOK],0);
      dbeDataInicio.SetFocus;
      Accept := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if trim(dbeResponsavel.Text) = '' then
   begin
      MsgDlg('Responsável pelo Levantamento não foi selecionado','Erro',mtError,[mbOK],0);
      dbeResponsavel.SetFocus;
      Accept := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   if cdsDet.IsEmpty then
   begin
      MsgDlg('Selecione as localizações/bens que serão usados no Levantamento',
             'Erro',mtError,[mbOK],0);
      SrcList.SetFocus;
      Accept := False;
      Exit;
   end;
   //-------------------------------------------------------------------------------------
   // Códigos de Status
   //-------------------------------------------------------------------------------------
   // 0 - Inventário em Andamento
   // 1 - Inventário Encerrado
   // 2 - Inventário Processado
   //-------------------------------------------------------------------------------------
   inherited;
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;

begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelInventarioBens(Sistema.IdEmpresa, 0);
   dbeIdInventario.Enabled  := True;
   bbtnGeraIdInvent.Enabled := True;
   bbtnGerar.Enabled := False;
end;
//========================================================================================
procedure TfrmMTInvGeracao.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelInventarioBens(Sistema.IdEmpresa, 0);
   dbeIdInventario.Enabled  := True;
   bbtnGeraIdInvent.Enabled := True;
   bbtnGerar.Enabled := False;
end;
//========================================================================================
procedure TfrmMTInvGeracao.dbgrdDetDblClick(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTInvGeracao.bbtnGeraIdInventClick(Sender: TObject);
begin
   inherited;
   cds.FieldByName('IDINVENTARIOBENS').AsFloat := InventarioBens.ProximoInventario;
end;
//========================================================================================
procedure TfrmMTInvGeracao.bbtnGerarClick(Sender: TObject);
var
   iListPos     : Integer;
   sPlacaMestre : String;
   vTI : string;  //Everson Cunha - SIG48344
begin
   inherited;
   //---------------------------------------------------------------------------
   // Remove a Seleção Anterior
   //---------------------------------------------------------------------------
   cdsDet.Data := InventarioBens.ListaItensInvBens(0, 0);
   cdsDet.DisableControls;
   //---------------------------------------------------------------------------

   //Everson Cunha - SIG48344 - Início
   //---------------------------------------------------------------------------
   // Identifica o centro de custo do funcionário a fim de saber se realizará
   // o inventário dos equipamentos de TI ou os demais itens do inventário
   // A marcação do centro de custo é realizada no GlobalCM >> Cadastro >>
   // Centro de Custo
   //---------------------------------------------------------------------------
      if CentroCustoTI(Sistema.IdUsuario) then
      begin
        MsgDlg('Serão carregados apenas os Equipamentos de TI', 'CAF', mtInformation, [mbOK], 0);
        vTI := '1';
      end
      else
      begin
        MsgDlg('Serão carregados todos os Bens, exceto os Equipamentos de TI', 'CAF', mtInformation, [mbOK], 0);
        vTI := '0';
      end;
   //Everson Cunha - SIG48344 - Fim

   iListPos := 0;
   while (iListPos <= (DstList.Items.Count - 1)) do
   begin
      cdsBensLocal.Data := InventarioBens.BensNaLocalizacao(Sistema.IdEmpresa,
//                                                            strtofloat(trim(copy(DstList.Items.Strings[iListPos],52,6))));    //Everson Cunha - SIG48344
                                                            strtofloat(trim(copy(DstList.Items.Strings[iListPos],52,6))), vTI); //Everson Cunha - SIG48344
      while not cdsBensLocal.EOF do
      begin
         //Ewerton Beltramini .. Remoção da mascara segundo solicitado no SIG96251.
         //sPlacaMestre := copy(cdsBensLocal.FieldByName('PLACA').AsString,1,(length(cdsBensLocal.FieldByName('PLACA').AsString) - iDigMascPlaca)) + StringOfChar('0',iDigMascPlaca);
         sPlacaMestre := Trim(cdsBensLocal.FieldByName('PLACA').AsString);

         if cdsBensLocal.FieldByName('PLACA').AsString = sPlacaMestre then
         begin
            cdsDet.Append;
            cdsDet.FieldByName('IDEMPRESA').AsFloat          := cdsBensLocal.FieldByName('IDPESSOA').AsFloat;
            cdsDet.FieldByName('IIBIDBEM').AsInteger         := cdsBensLocal.FieldByName('IDBEM').AsInteger;
            cdsDet.FieldByName('IIBPLACA').AsFloat           := cdsBensLocal.FieldByName('PLACA').AsFloat;
            cdsDet.FieldByName('IIBFLGPLACA').AsInteger      := 0;
            cdsDet.FieldByName('IIBLOCALATUAL').AsInteger    := cdsBensLocal.FieldByName('IDLOCALIZACAO').AsInteger;
            cdsDet.FieldByName('IIBCONJUNTOATUAL').AsInteger := cdsBensLocal.FieldByName('IDCONJUNTO').AsInteger;
            cdsDet.FieldByName('IIBFLGSITFISICA').AsInteger  := 0;
            cdsDet.FieldByName('IDPESSOA').AsInteger         := cdsBensLocal.FieldByName('IDPESSOA').AsInteger;
            cdsDet.FieldByName('IDBEM').AsInteger            := cdsBensLocal.FieldByName('IDBEM').AsInteger;
            cdsDet.FieldByName('PLACA').AsFloat              := cdsBensLocal.FieldByName('PLACA').AsFloat;
            cdsDet.FieldByName('DESBEM').AsString            := cdsBensLocal.FieldByName('DESBEM').AsString;
            cdsDet.FieldByName('DESCCONJUNTO').AsString      := cdsBensLocal.FieldByName('DESCCONJUNTO').AsString;
            cdsDet.FieldByName('DESCLOCAL').AsString         := cdsBensLocal.FieldByName('DESCLOCAL').AsString;
            cdsDet.FieldByName('IDCLASSEBEM').AsInteger      := cdsBensLocal.FieldByName('IDCLASSEBEM').AsInteger;
            cdsDet.FieldByName('CODHIERARQ').AsString        := cdsBensLocal.FieldByName('CODHIERARQ').AsString;
            cdsDet.FieldByName('DESCCLASSE').AsString        := cdsBensLocal.FieldByName('DESCCLASSE').AsString;
            cdsDet.Post;
         end;
         cdsBensLocal.Next;
      end;
      iListPos := iListPos + 1;
   end;
   cdsDet.First;
   cdsDet.EnableControls;
   lblNumBens.Caption := inttostr(cdsDet.RecordCount) + ' Bens' ;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTInvGeracao.bbtnExportarClick(Sender: TObject);
begin
   inherited;
   if iTipoColetor = 1 then
   begin
      Application.CreateForm(TfrmMTInvColPDT3100, frmMTInvColPDT3100);
      frmMTInvColPDT3100.FormStyle          := FsNormal;
      frmMTInvColPDT3100.Visible            := False;
      frmMTInvColPDT3100.rdgpOper.ItemIndex := 0;
      frmMTInvColPDT3100.ShowModal;
      frmMTInvColPDT3100.Release;
   end else
   if iTipoColetor = 2 then
   begin
      Application.CreateForm(TfrmMTInvColScwLucas7000, frmMTInvColScwLucas7000);
      frmMTInvColScwLucas7000.FormStyle          := FsNormal;
      frmMTInvColScwLucas7000.Visible            := False;
      frmMTInvColScwLucas7000.rdgpOper.ItemIndex := 0;
      frmMTInvColScwLucas7000.ShowModal;
      frmMTInvColScwLucas7000.Release;
   end else
   if iTipoColetor = 3 then
   begin
      {Application.CreateForm(TfrmMTInvColPalmCTRQ, frmMTInvColPalmCTRQ);
      frmMTInvColPalmCTRQ.FormStyle := FsNormal;
      frmMTInvColPalmCTRQ.Visible := False;
      frmMTInvColPalmCTRQ.rdgpOper.ItemIndex := 0;
      frmMTInvColPalmCTRQ.ShowModal;
      frmMTInvColPalmCTRQ.Release;}
   end else
   if iTipoColetor = 4 then
   begin
      Application.CreateForm(TfrmMTInvColCMNet, frmMTInvColCMNet);
      frmMTInvColCMNet.FormStyle := FsNormal;
      frmMTInvColCMNet.Visible := False;
      frmMTInvColCMNet.rdgpOper.ItemIndex := 0;
      frmMTInvColCMNet.grbArquivos.Enabled := False; //Bruno Bastos - 04/06/2009 - 117371_552815
      frmMTInvColCMNet.ShowModal;
      frmMTInvColCMNet.Release;
   end;
   bbtnExportar.Down := False;
end;
//========================================================================================
// Manipulação da Dual List Box
//========================================================================================
procedure TfrmMTInvGeracao.CarregaListaLocalizacoes;
var
   iPos : Integer;
   sDescLocal, sIdLocal : String;

begin
   inherited;
   SrcList.Clear;
   DstList.Clear;
   //-------------------------------------------------------------------------------------
   cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa);
   while not cdsLocal.EOF do
   begin
      sDescLocal := '';
      for iPos := 1 to 50 do
      begin
         if (iPos <= length(cdsLocal.FieldByName('NOME').AsString)) then
            sDescLocal := sDescLocal + copy(cdsLocal.FieldByName('NOME').AsString, iPos, 1)
         else
            sDescLocal := sDescLocal + ' ';
      end;
      //----------------------------------------------------------------------------------
      sIdLocal := '';
      for iPos := 1 to 6 do
      begin
         if (iPos <= length(cdsLocal.FieldByName('IDLOCALIZACAO').AsString)) then
            sIdLocal := sIdLocal + copy(cdsLocal.FieldByName('IDLOCALIZACAO').AsString, iPos, 1)
         else
            sIdLocal := sIdLocal + ' ';
      end;
      //----------------------------------------------------------------------------------
      if cdsDet.Locate('IDLOCALIZACAO', cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat, []) then
         DstList.Items.Add(sDescLocal + ' ' + sIdLocal)
      else
         SrcList.Items.Add(sDescLocal + ' ' + sIdLocal);
      //----------------------------------------------------------------------------------
      cdsLocal.Next;
   end;
   SetItem(SrcList,0);
   SetItem(DstList,0);
end;
//========================================================================================
procedure TfrmMTInvGeracao.IncludeBtnClick(Sender: TObject);
var
   Index: Integer;

begin
   inherited;
   Index := GetFirstSelection(SrcList);
   MoveSelected(SrcList, DstList.Items);
   SetItem(SrcList, Index);
end;
//========================================================================================
procedure TfrmMTInvGeracao.IncAllBtnClick(Sender: TObject);
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
procedure TfrmMTInvGeracao.ExcludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   inherited;
   Index := GetFirstSelection(DstList);
   MoveSelected(DstList, SrcList.Items);
   SetItem(DstList, Index);
end;
//========================================================================================
procedure TfrmMTInvGeracao.ExAllBtnClick(Sender: TObject);
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
procedure TfrmMTInvGeracao.SetButtons;
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
procedure TfrmMTInvGeracao.MoveSelected(List: TCustomListBox; Items: TStrings);
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
procedure TfrmMTInvGeracao.SetItem(List: TListBox; Index: Integer);
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
function TfrmMTInvGeracao.GetFirstSelection(List: TCustomListBox): Integer;
begin
   for Result := 0 to List.Items.Count - 1 do
     if List.Selected[Result] then Exit;
   Result := LB_ERR;
end;
//========================================================================================
procedure TfrmMTInvGeracao.cdsDetAfterOpen(DataSet: TDataSet);
begin
   inherited;
   lblNumBens.Caption := inttostr(cdsDet.RecordCount) + ' Bens' ;
end;
//========================================================================================
procedure TfrmMTInvGeracao.cdsDetAfterInsert(DataSet: TDataSet);
begin
   inherited;
   lblNumBens.Caption := inttostr(cdsDet.RecordCount) + ' Bens' ;
end;
//========================================================================================
procedure TfrmMTInvGeracao.cdsDetAfterDelete(DataSet: TDataSet);
begin
   inherited;
   lblNumBens.Caption := inttostr(cdsDet.RecordCount) + ' Bens' ;
end;
//========================================================================================
procedure TfrmMTInvGeracao.cdsDetAfterClose(DataSet: TDataSet);
begin
   inherited;
   lblNumBens.Caption := '0 Bens' ;
end;

//Everson Cunha - SIG48344 - Início
//Identifica se o centro de custo do funcionário logado no sistema é responsável
//pelo inventário dos equipamentos de TI
function TfrmMTInvGeracao.CentroCustoTI(IdUsuario: Double): Boolean;
var
  sSql : TwwQuery;
begin
  sSql := TwwQuery.Create(nil);
  sSql.DatabaseName := 'BaseDados';

  Result := False;

  try
    sSql.Close;
    sSql.sql.Clear;
    sSql.SQL.Add('SELECT 1                                                   ');
    sSql.SQL.Add('  FROM FUNCIONARIO F                                       ');
    sSql.SQL.Add('  JOIN CENTCUST C ON C.CODCENTROCUSTO = F.CODCENTROCUSTO   ');
    sSql.SQL.Add(' WHERE F.IDPESSOA = ' + FloatToStr( IdUsuario ) + '        ');
    sSql.SQL.Add('   AND C.FLGINVENTARIOTI = ''1''                           ');

    sSql.Open;

    if sSql.RecordCount = 1 then
      Result := True;

  finally
    sSql.Free;
  end;    
end;
//Everson Cunha - SIG 48344- Fim

end.
