unit fMTCadGrupoContab;


{===============================================================================
Pendência: MIGRACAO-ORACLE
Analista : edilaine
Data     : 13/10/2025
Solução  : remover concatenaçao de espaços nas contas contábeis
           mudança de CHAR para VARCHAR2 na migração
===============================================================================}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, Mask, wwdbedit, uCMTypes,
  TREdit, uCtrlGrupoContab, uCtrlCentroCusto, uCtrlParamCAF;

type                                                                                                      
  TfrmMTCadGrupoContab = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedCod: TwwDBEdit;
    pnlAnaSint: TPanel;
    sbtnAnalitico: TSpeedButton;
    sbtnSintetico: TSpeedButton;
    Label2: TLabel;
    dbeDescricao: TwwDBEdit;
    rdgrpControle: TDBRadioGroup;
    rdgrpstatus: TDBRadioGroup;
    GroupBox1: TGroupBox;
    dbckbSemPlaca: TDBCheckBox;
    TabDetCCusto: TTabSheet;
    Label4: TLabel;
    dbeTaxaDep: TDBRealEdit;
    Label6: TLabel;
    dbeDescTaxaDep: TwwDBEdit;
    Label5: TLabel;
    pnlDetCCusto: TPanel;
    Label7: TLabel;
    IncludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    ExAllBtn: TSpeedButton;
    Label8: TLabel;
    SrcList: TListBox;
    DstList: TListBox;
    cdsDet: TCMClientDataSet;
    cdsGrupoBemxCC: TCMClientDataSet;
    cdsPlanoGrupo: TCMClientDataSet;
    cdsParamCAF: TCMClientDataSet;
    cdsCentroCusto: TCMClientDataSet;
    cdsGrupos: TCMClientDataSet;
    cdsGrupoBemxCC2: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dbedCodExit(Sender: TObject);
    procedure IncludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CdsAfterScroll(DataSet: TDataSet);
    procedure sbtnSinteticoClick(Sender: TObject);
    procedure sbtnAnaliticoClick(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
  private
    { Private declarations }
    GrupoContab               : TCtrlGrupoContab;
    CentroCusto               : TCtrlCentroCusto;
    ParamCAF                  : TCtrlParamCAF;
    iSoma, Ind                : Integer;
    sMascaraGrupo, sMascPict  : String;
    lNivel                    : Array [0..20] of Integer;
    iNumTaxaDep, iProxTaxaDep : Integer;
    //------------------------------------------------------------------------------------
    procedure ProcessaDetalhes;
    procedure SelGrupoContab(fIdPessoa, fIdGrupo : Extended);
    procedure CarregaListaGrupoxCC(fIdPessoa, fIdGrupo : Extended);
    procedure GravaGrupoBemxCC;
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function  GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
  public
    { Public declarations }
  end;

var
  frmMTCadGrupoContab: TfrmMTCadGrupoContab;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uIntegraBack;

procedure TfrmMTCadGrupoContab.FormCreate(Sender: TObject);
var
   iGrau       : Integer;
   bCorrompido : Boolean;
begin
   inherited;
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   GrupoContab.cds             := cds;
   GrupoContab.cdsPlanoGrupo   := cdsPlanoGrupo;
   GrupoContab.cdsGrupoBemxCC  := cdsGrupoBemxCC;
   GrupoContab.cdsGrupoTaxaDep := cdsDet;
   //-------------------------------------------------------------------------------------
   CentroCusto := TCtrlCentroCusto.Create;
   CentroCusto.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsCentroCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,1);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType, // False no 2o.Parâmetro
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
   cdsParamCAF.Data := ParamCAF.ListaParamCAF(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   iNumTaxaDep   := cdsParamCAF.FieldByName('NUMTAXADEP').AsInteger;
   sMascaraGrupo := cdsParamCAF.FieldByName('MASCCODGRUPO').AsString;
   sMascPict := '';
   if not GrupoContab.MascaraOK(sMascaraGrupo,sMascPict,lNivel,iSoma,ind) then
   begin
      MsgDlg(GrupoContab.MessageInfo,'Erro',mtError,[mbOK],0);
      bbtnSairClick(Self);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('PLANOGRUPO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   SelGrupoContab(Sistema.IdEmpresa,-1);
   //-------------------------------------------------------------------------------------
   // Confere a estrutura hierarquica
   //-------------------------------------------------------------------------------------
   cdsGrupos.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa);
   bCorrompido := False;
   cdsGrupos.First;
   while not cdsGrupos.EOF do
   begin
      if not GrupoContab.Verifica_Node(trim(cdsGrupos.FieldByName('CLASSE').AsString),
                                       trim(cdsGrupos.FieldByName('CLASSE').AsString),
                                       False, iGrau, lNivel, Ind) then
      begin
         bCorrompido := True;
      end;
      cdsGrupos.Next;
   end;
   //-------------------------------------------------------------------------------------
   if bCorrompido then
   begin
      MsgDlg('A Estrutura Hierarquica de Grupos está corrompida','Erro',mtError,[mbOk],0);
      bbtnSairClick(Self);
      exit;
   end;
   pnlDetCCusto.Enabled := False;
end;
//========================================================================================
procedure TFrmMTCadGrupoContab.SelGrupoContab(fIdPessoa, fIdGrupo : Extended);
begin
   cds.Data := GrupoContab.ProcurarGrupoContab(-1);
   cdsPlanoGrupo.Data := GrupoContab.ProcurarPlanoGrupo(fIdPessoa,fIdGrupo);
   if cdsPlanoGrupo.IsEmpty then
   begin
      cds.Data             := GrupoContab.ProcurarGrupoContab(-1);
      cdsDet.Data          := GrupoContab.ListaGrupoTaxaDep(-1,fIdPessoa);
      cdsGrupoBemxCC.Data  := GrupoContab.ListaGrupoBemxCC(-1,-1);
   end else
   begin
      cds.Data             := GrupoContab.ProcurarGrupoContab(fIdGrupo);
      cdsDet.Data          := GrupoContab.ListaGrupoTaxaDep(fIdGrupo,fIdPessoa);
      cdsGrupoBemxCC.Data  := GrupoContab.ListaGrupoBemxCC(fIdGrupo,fIdpessoa);
   end;
   TStringField(cds.FieldByName('CLASSE')).EditMask := sMascaraGrupo + ';0;_';
   //-------------------------------------------------------------------------------------
   iProxTaxaDep := cdsDet.RecordCount + 1;
   CarregaListaGrupoxCC(fIdPessoa, fIdGrupo);
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   GrupoContab.Free;
   CentroCusto.Free;
   ParamCAF.Free;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := GrupoContab.AplicaOperacao('S');
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   ProcessaDetalhes;
   Accept := GrupoContab.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   ProcessaDetalhes;
   Accept := GrupoContab.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(GrupoContab.MessageInfo,'Erro',mtError,[mbOK],0);
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelGrupoContab(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroInsert(Sender: TObject);
begin
   pnlDetCCusto.Enabled := True;
   SelGrupoContab(Sistema.IdEmpresa,-1);
   inherited;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroEdit(Sender: TObject);
begin
   pnlDetCCusto.Enabled := True;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroDelete(Sender: TObject);
begin
   if not GrupoContab.BensnoGrupo(cds.FieldByName('IDGRUPO').AsFloat,
                                  Sistema.IdEmpresa) then
   begin
      if not GrupoContab.Tem_Filhos(cds.FieldByName('TIPO').AsString,
                                    cds.FieldByName('CLASSE').AsString) then
      begin
         cdsDet.First;
         while not cdsDet.EOF do
            cdsDet.Delete;
         cdsGrupoBemxCC.First;
         while not cdsGrupoBemxCC.EOF do
            cdsGrupoBemxCC.Delete;
         cdsPlanoGrupo.First;
         while not cdsPlanoGrupo.EOF do
            cdsPlanoGrupo.Delete;
         inherited;                                                               
      end else
      begin
         MsgDlg(GrupoContab.MessageInfo,'Erro',mtError,[mbOk],0);
      end;
   end else
   begin
      MsgDlg(GrupoContab.MessageInfo,'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.dbedCodExit(Sender: TObject);
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
      if trim(dbedCod.Text) <> '' then
      begin
         bOk := GrupoContab.Verifica_Node(trim(dbedCod.Text),
                                          trim(dbedCod.Text),
                                          False, iGrau, lNivel, Ind);
         if not bOk then
         begin
            dbedCod.Text := '';
            dbedCod.EditText := '';
            cds.FieldValues['CLASSE'] := '';
            dbedCod.SetFocus;
            exit;
         end;
         //-------------------------------------------------------------------------------
         if (iGrau = 1) and ((Ind + 1) > 1) then
            if pos('.',sMascaraGrupo) <> 0 then
            begin
               sbtnSintetico.Down := True;
               sbtnAnalitico.Down := False;
               cds.FieldByName('TIPO').AsString := 'S';
               pnlAnaSint.Enabled := False;
            end else
            begin
               sbtnSintetico.Down := False;
               sbtnAnalitico.Down := True;
               cds.FieldByName('TIPO').AsString := 'A';
               pnlAnaSint.Enabled := False;
            end;
         //-------------------------------------------------------------------------------
         if iGrau = (Ind + 1) then
         begin
            sbtnSintetico.Down := False;
            sbtnAnalitico.Down := True;
            cds.FieldByName('TIPO').AsString := 'A';
            pnlAnaSint.Enabled := False;
         end;
      end;
   except
      Raise;
   end;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeDetalheDelete(Sender: TObject);
begin
   inherited;
   cdsDet.First;
   while cdsDet.EOF do
   begin
      if cdsDet.FieldByName('IDTAXADEP').AsInteger <> 1 then
      begin
         cdsDet.Edit;
         cdsDet.FieldByName('IDTAXADEP').AsInteger := cdsDet.FieldByName('IDTAXADEP').AsInteger - 1;
         cdsDet.Post;
      end;
      cdsDet.Next;
   end;
   iProxTaxaDep := iProxTaxaDep - 1;
   if iProxTaxaDep < 1 then
      iProxTaxaDep := 1;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeDetalheConfirma(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if cdsDet.State in [dsInsert,dsEdit] then
      begin
         if trim(dbeTaxaDep.Text) = '' then
         begin
            MsgDlg('Informe um valor para taxa de depreciação','Erro',mtError,[mbOK],0);
            dbeTaxaDep.SetFocus;
         end else
         if trim(dbeDescTaxaDep.Text) = '' then
         begin
             MsgDlg('Informe uma descrição para a taxa de depreciação','Erro',mtError,[mbOK],0);
             dbeDescTaxaDep.SetFocus;
         end else
         begin
            if cdsDet.State = dsInsert then
            begin
               cdsDet.FieldByName('IDTAXADEP').AsInteger := iProxTaxaDep;
               cdsDet.FieldByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
               iProxTaxaDep := iProxTaxaDep + 1;
            end;
            inherited;
         end;
      end else
      begin
         inherited;
      end;
   end else
   begin
      inherited;
   end;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.ProcessaDetalhes;
begin
   if (cds.State in [dsInsert,dsEdit]) then
   begin
      cdsDet.First;
      while not cdsDet.EOF do
      begin
         if cdsDet.FieldByName('IDTAXADEP').AsInteger = 1 then
         begin
            cds.FieldByName('DEPRECIACAO').AsFloat := cdsDet.FieldByName('TAXADEP').AsFloat;
         end;
         cdsDet.Next;
      end;
      //----------------------------------------------------------------------------------
      if cds.State = dsInsert then
      begin
         cdsPlanoGrupo.Insert;
         cdsPlanoGrupo.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   Accept := False;
   if trim(dbedCod.Text) = '' then
   begin
      MsgDlg('Obrigatório Preencher o Código do Grupo',LerMensagem(2),mtError,[mbOk],0);
      dbedCod.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if (sbtnAnalitico.down = false) and (sbtnSintetico.down = false) then
   begin
      MsgDlg('Obrigatório Selecionar o Tipo do Grupo',LerMensagem(2),mtError,[mbOk],0);
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
   if cdsDet.RecordCount <> iNumTaxaDep then
   begin
      MsgDlg('Obrigatório informar todas as Taxas de Depreciações'+#13+
             'definidas nos Parâmetros do Sistema.',LerMensagem(2),mtError,[mbOk],0);
      dbeDescricao.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if sbtnAnalitico.down then
      cds.FieldByName('TIPO').AsString := 'A';
   if sbtnSintetico.down then
      cds.FieldByName('TIPO').AsString := 'S';
   //-------------------------------------------------------------------------------------
   GravaGrupoBemxCC;
   //-------------------------------------------------------------------------------------
   Accept := True;
   inherited;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;

begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelGrupoContab(Sistema.IdEmpresa,-1);
   pnlDetCCusto.Enabled := False;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   pnlDetCCusto.Enabled := False;
   SelGrupoContab(Sistema.IdEmpresa,-1);
end;
//========================================================================================
// Manipulação da Dual List Box
//========================================================================================
procedure TfrmMTCadGrupoContab.CarregaListaGrupoxCC(fIdPessoa, fIdGrupo : Extended);
var
   iPos   : Integer;
   sCodCC : String;

begin
   inherited;
   SrcList.Clear;
   DstList.Clear;
   //-------------------------------------------------------------------------------------
   cdsGrupoBemxCC.Data := GrupoContab.ListaGrupoBemxCC(fIdGrupo,fIdPessoa);
   cdsCentroCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,1);
   while (not cdsCentroCusto.EOF) do
   begin
      if cdsCentroCusto.FieldByName('STATUSGRUPOCDC').AsString = 'A' then
      begin
         sCodCC := '';
         for iPos := 1 to 10 do
         begin
            if (iPos <= length(cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString)) then
               sCodCC := sCodCC + copy(cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString,iPos,1)
            else
               sCodCC := sCodCC + ' ';
         end;
         //----------------------------------------------------------------------------------
         if cdsGrupoBemxCC.Locate('CODCENTROCUSTO', cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString, []) then
            DstList.Items.Add(sCodCC + ' ' + cdsCentroCusto.FieldByName('NOME').AsString)
         else
            SrcList.Items.Add(sCodCC + ' ' + cdsCentroCusto.FieldByName('NOME').AsString);
      end;
      cdsCentroCusto.Next;
   end;
   SetItem(SrcList,0);
   SetItem(DstList,0);
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.GravaGrupoBemxCC;
var
   iListPos   : Integer;

begin
   //-------------------------------------------------------------------------------------
   // Insere os Centros de Custos acrescentados a lista
   //-------------------------------------------------------------------------------------
   if cds.State = dsEdit then
      cdsGrupoBemxCC2.Data  := GrupoContab.ListaGrupoBemxCC(cds.FieldByName('IDGRUPO').AsInteger,
                                                            Sistema.IdEmpresa)
   else
      cdsGrupoBemxCC2.Data  := GrupoContab.ListaGrupoBemxCC(-1,-1);
   //-------------------------------------------------------------------------------------
   iListPos := 0;
   while (iListPos <= (DstList.Items.Count - 1)) do
   begin
      if cds.State = dsEdit then
      begin
         if not cdsGrupoBemxCC2.IsEmpty then
         begin
            if not cdsGrupoBemxCC2.Locate('IDGRUPO;IDEMPRESA;CODCENTROCUSTO',
                                          VarArrayOf([cds.FieldByName('IDGRUPO').AsInteger,
                                                      Sistema.IdEmpresa,
                                                      //trim(copy(DstList.Items.Strings[iListPos],1,10))]),[]) then     //MIGRACAO-ORACLE
                                                      trim(DstList.Items.Strings[iListPos])]),[]) then                  //MIGRACAO-ORACLE
            begin
               cdsGrupoBemxCC.Append;
               cdsGrupoBemxCC.FieldByName('IDGRUPO').AsInteger       := cds.FieldByName('IDGRUPO').AsInteger;
               cdsGrupoBemxCC.FieldByName('IDEMPRESA').AsInteger     := Sistema.IdEmpresa;
               //cdsGrupoBemxCC.FieldByName('CODCENTROCUSTO').AsString := trim(copy(DstList.Items.Strings[iListPos],1,10));   //MIGRACAO-ORACLE
               cdsGrupoBemxCC.FieldByName('CODCENTROCUSTO').AsString := trim(DstList.Items.Strings[iListPos]);                //MIGRACAO-ORACLE
               cdsGrupoBemxCC.Post;
            end;
         end else
         begin
            cdsGrupoBemxCC.Append;
            cdsGrupoBemxCC.FieldByName('IDGRUPO').AsInteger       := cds.FieldByName('IDGRUPO').AsInteger;
            cdsGrupoBemxCC.FieldByName('IDEMPRESA').AsInteger     := Sistema.IdEmpresa;
            //cdsGrupoBemxCC.FieldByName('CODCENTROCUSTO').AsString := trim(copy(DstList.Items.Strings[iListPos],1,10));    //MIGRACAO-ORACLE
            cdsGrupoBemxCC.FieldByName('CODCENTROCUSTO').AsString := trim(DstList.Items.Strings[iListPos]);                 //MIGRACAO-ORACLE
            cdsGrupoBemxCC.Post;
         end;
      end else
      begin
         cdsGrupoBemxCC.Append;
         cdsGrupoBemxCC.FieldByName('IDEMPRESA').AsInteger     := Sistema.IdEmpresa;
         //cdsGrupoBemxCC.FieldByName('CODCENTROCUSTO').AsString := trim(copy(DstList.Items.Strings[iListPos],1,10));   //MIGRACAO-ORACLE
         cdsGrupoBemxCC.FieldByName('CODCENTROCUSTO').AsString := trim(DstList.Items.Strings[iListPos]);                //MIGRACAO-ORACLE
         cdsGrupoBemxCC.Post;
      end;
      iListPos := iListPos + 1;
   end;
   //-------------------------------------------------------------------------------------
   // Remove os Centros de Custos retirados da lista
   //-------------------------------------------------------------------------------------
   iListPos := 0;
   while (iListPos <= (srcList.Items.Count - 1)) do
   begin
      if cds.State = dsEdit then
      begin
         if cdsGrupoBemxCC.Locate('IDGRUPO;IDEMPRESA;CODCENTROCUSTO',
                                  VarArrayOf([cds.FieldByName('IDGRUPO').AsInteger,
                                              Sistema.IdEmpresa,
                                              //trim(copy(srcList.Items.Strings[iListPos],1,10))]),[]) then     //MIGRACAO-ORACLE
                                              trim(srcList.Items.Strings[iListPos])]),[]) then                  //MIGRACAO-ORACLE
         begin
            cdsGrupoBemxCC.Delete;
         end;
      end;
      iListPos := iListPos + 1;
   end;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.IncludeBtnClick(Sender: TObject);
var
   Index: Integer;

begin
   inherited;
   Index := GetFirstSelection(SrcList);
   MoveSelected(SrcList, DstList.Items);
   SetItem(SrcList, Index);
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.IncAllBtnClick(Sender: TObject);
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
procedure TfrmMTCadGrupoContab.ExAllBtnClick(Sender: TObject);
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
procedure TfrmMTCadGrupoContab.ExcludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   inherited;
   Index := GetFirstSelection(DstList);
   MoveSelected(DstList, SrcList.Items);
   SetItem(DstList, Index);
end;
//========================================================================================
function TfrmMTCadGrupoContab.GetFirstSelection(List: TCustomListBox): Integer;
begin
   for Result := 0 to List.Items.Count - 1 do
     if List.Selected[Result] then Exit;
   Result := LB_ERR;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.MoveSelected(List: TCustomListBox; Items: TStrings);
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
procedure TfrmMTCadGrupoContab.SetItem(List: TListBox; Index: Integer);
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
procedure TfrmMTCadGrupoContab.SetButtons;
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
procedure TfrmMTCadGrupoContab.CdsAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if cds.FieldByName('TIPO').AsString = 'A' then
      sbtnAnalitico.down := True
   else
   if cds.FieldByName('TIPO').AsString = 'S' then
      sbtnSintetico.down := True;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.sbtnSinteticoClick(Sender: TObject);
begin
   inherited;
   if sbtnSintetico.Down then
      sbtnAnalitico.Down := False
   else
      sbtnAnalitico.Down := True;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.sbtnAnaliticoClick(Sender: TObject);
begin
   inherited;
   if sbtnSintetico.Down then
      sbtnAnalitico.Down := False
   else
      sbtnAnalitico.Down := True;
end;

end.



