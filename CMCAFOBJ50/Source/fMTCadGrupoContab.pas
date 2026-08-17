{-----------------------------------------------------------------------------------------------------------------------------------
Pendência: MIGRACAO-ORACLE
Analista : edilaine
Data     : 13/10/2025
Solução  : remover concatenaçao de espaços nas contas contábeis
           mudança de CHAR para VARCHAR2 na migração
-----------------------------------------------------------------------------------------------------------------------------------
Rotina...........: FormCreate
Nº SOL...........: 198886.18334
Data da Alteração: 10/01/2017
Responsável......: Darivaldo Alencar
Descrição........: Removido taxa de depreciação desta tela.
                   Foi incluído na tela Cadastro de Classe de Bens a opção para
                   inclusão da taxa de depreciação
-----------------------------------------------------------------------------------------------------------------------------------}
unit fMTCadGrupoContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, 
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, Mask, wwdbedit, uCMTypes,
  TREdit, uCtrlGrupoContab, uCtrlCentroCusto, uCtrlParamCAF, uCtrlPadroes,
  uCmSqlParams, IvEMulti,uCtrlClasseTaxaDep;

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
    cdsGrupoEmpresas: TCMClientDataSet;
    sqlGrupoEmpresas: TCMSqlParams;
    cdsCAFPaises: TCMClientDataSet;
    sqlCAFPaises: TCMSqlParams;
    rgTipoFechamento: TDBRadioGroup;
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
    procedure CmeDetalheInsert(Sender: TObject);
    procedure rdgrpstatusChange(Sender: TObject);
  private
    { Private declarations }
    ClasseTaxaDep             : TCtrlClasseTaxaDep;//Darivaldo Alencar SOL.198886.18334
    GrupoContab               : TCtrlGrupoContab;
    CentroCusto               : TCtrlCentroCusto;
    ParamCAF                  : TCtrlParamCAF;
    iSoma, Ind                : Integer;
    sMascaraGrupo, sMascPict  : String;
    lNivel                    : Array [0..20] of Integer;
    iNumTaxaDep, iProxTaxaDep : Integer;
    //------------------------------------------------------------------------------------
    function GrupoEmOutrasEmpresas(fIdGrupo : Extended) : Boolean;
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

Uses uMensErro, uSistema ;

procedure TfrmMTCadGrupoContab.FormCreate(Sender: TObject);
var
   iGrau       : Integer;
   bCorrompido : Boolean;
begin
   inherited;
   if (Sistema.IdModulo = 7) then //Darivaldo Alencar SOL198886.18334
     begin
       tbcDetalhe.Tabs.Clear;
       tbcDetalhe.Tabs.Add('Centros de Custo');
       tb97BotoesDetalhe.Visible:= false;
       pgctrlDetalhe.ActivePage:=  TabDetCCusto;
     end;

   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   GrupoContab.cds := cds;
   GrupoContab.cdsPlanoGrupo := cdsPlanoGrupo;
   GrupoContab.cdsGrupoBemxCC := cdsGrupoBemxCC;
   if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
      GrupoContab.cdsGrupoTaxaDep := cdsDet;
   //-------------------------------------------------------------------------------------
   // Inicializa PLANOGRUPO com a empresa selecionada
   //-------------------------------------------------------------------------------------
   cdsPlanoGrupo.Data := GrupoContab.ListaPlanoGrupo(Sistema.IdEmpresa);
   if cdsPlanoGrupo.IsEmpty then
      GrupoContab.IniciaEmpresaxGrupo(Sistema.IdEmpresa)
   else
      cdsPlanoGrupo.Close;
   //-------------------------------------------------------------------------------------
   CentroCusto := TCtrlCentroCusto.Create;
   CentroCusto.InitializeAs(Padroes);
   cdsCentroCusto.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,1);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   cdsParamCAF.Data := ParamCAF.ListaParamCAF(Sistema.IdEmpresa);
   //-------------------------------------------------------------------------------------
   sMascaraGrupo := trim(cdsParamCAF.FieldByName('MASCCODGRUPO').AsString);
   sMascPict := '';
   if not GrupoContab.MascaraOK(sMascaraGrupo,sMascPict,lNivel,iSoma,ind) then
   begin
      MsgDlg(GrupoContab.MessageInfo,'Erro',mtError,[mbOK],0);
      bbtnSairClick(Self);
      exit;
   end;
   //-------------------------------------------------------------------------------------
    if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL 198886.18334 
      begin
       sqlCAFPaises.Prepare;
       sqlCAFPaises.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
       sqlCAFPaises.Open;
       if cdsCAFPaises.IsEmpty then
       begin
          MsgDlg('Os Países com os quais o CAF irá processar as taxas de depreciação ' + #13 +
                 'do Grupos Contábeis não foram cadastrados!', 'Erro', mtError, [mbOK], 0);
          cdsCAFPaises.Close;
          bbtnSair.Click;
       end;
       iNumTaxaDep := cdsCAFPaises.RecordCount;
       cdsCAFPaises.Close;
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
      if not GrupoContab.Verifica_Node(Sistema.IdEmpresa,
                                       trim(cdsGrupos.FieldByName('CLASSE').AsString),
                                       trim(cdsGrupos.FieldByName('CLASSE').AsString),
                                       False, iGrau, lNivel, Ind) then
      begin
         bCorrompido := True;
         break;
      end;
      cdsGrupos.Next;
   end;
   //-------------------------------------------------------------------------------------
   if bCorrompido then
   begin
      MsgDlg('A Estrutura Hierárquica de Grupos está corrompida','Erro',mtError,[mbOk],0);
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
      cds.Data := GrupoContab.ProcurarGrupoContab(-1);
      if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
         cdsDet.Data := GrupoContab.ListaGrupoTaxaDep(-1,fIdPessoa);
      cdsGrupoBemxCC.Data := GrupoContab.ListaGrupoBemxCC(-1,-1);
   end else
   begin
      cds.Data := GrupoContab.ProcurarGrupoContab(fIdGrupo);
      if not (Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
          cdsDet.Data := GrupoContab.ListaGrupoTaxaDep(fIdGrupo,fIdPessoa);
      cdsGrupoBemxCC.Data := GrupoContab.ListaGrupoBemxCC(fIdGrupo,fIdpessoa);
   end;
   TStringField(cds.FieldByName('CLASSE')).EditMask := sMascaraGrupo + ';0;_';
   //-------------------------------------------------------------------------------------
   if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
      iProxTaxaDep := cdsDet.RecordCount + 1;
   CarregaListaGrupoxCC(fIdPessoa, fIdGrupo);
   //-------------------------------------------------------------------------------------
   if cdsPlanoGrupo.FieldByName('IDGRUPO').IsNull then
   begin
      sbtnAnalitico.Down := False;
      sbtnSintetico.Down := False;
   end;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   GrupoContab.Free;
   CentroCusto.Free;
   ParamCAF.Free;
   ClasseTaxaDep.Free;//Darivaldo Alencar SOL.198886.18334
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   if not GrupoEmOutrasEmpresas(cds.FieldByName('IDGRUPO').AsFloat) then
      Accept := GrupoContab.AplicaOperacao('S')
   else
      Accept := GrupoContab.AplicaOperacao('SP');
end;
//========================================================================================
function TfrmMTCadGrupoContab.GrupoEmOutrasEmpresas(fIdGrupo: Extended): Boolean;
begin
   sqlGrupoEmpresas.Prepare;
   sqlGrupoEmpresas.ParamByName('IDGRUPO').AsFloat := fIdGrupo;
   sqlGrupoEmpresas.Open;
   Result := (cdsGrupoEmpresas.RecordCount > 1);
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
     ProcessaDetalhes;
   Accept := GrupoContab.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
     ProcessaDetalhes;
   Accept := GrupoContab.AplicaOperacao('E');
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if GrupoContab.MessageInfo <> '' then
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
   cds.FieldByName('STATUS').AsString := 'A';
   cds.FieldByName('FLGIMOVEL').AsInteger := 0;
   cds.FieldByName('FLGSEMPLACA').AsInteger := 0;
   cds.FieldByName('INATIVO').AsInteger := 0;
   cdsPlanoGrupo.Append;
   cdsPlanoGrupo.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   cdsPlanoGrupo.FieldByName('INATIVO').AsInteger := 0;
   //-------------------------------------------------------------------------------------
   // Preenche as linhas das taxas de depreciação com os paises previamente cadastrados
   //-------------------------------------------------------------------------------------
   if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
     begin
           sqlCAFPaises.Prepare;
           sqlCAFPaises.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
           sqlCAFPaises.Open;
           if cdsCAFPaises.IsEmpty then
           begin
              MsgDlg('Os Países com os quais o CAF irá processar as taxas de depreciação' + #13 +
                     'não foram definidos!', 'Erro', mtError, [mbOK], 0);
              bbtnSair.Click;
           end;
   //-------------------------------------------------------------------------------------
           while not cdsCAFPaises.EOF do
           begin
              cdsDet.Append;
              cdsDet.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
              cdsDet.FieldByName('IDTAXADEP').AsInteger := cdsCAFPaises.FieldByName('IDCAFPAISES').AsInteger;
              cdsDet.FieldByName('DESCTAXADEP').AsString := cdsCAFPaises.FieldByName('NOMEPAIS').AsString;
              cdsDet.FieldByName('TAXADEP').AsFloat := 0;
              cdsDet.Post;
              cdsCAFPaises.Next;
           end;
                 cdsCAFPaises.Close;
     end;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroEdit(Sender: TObject);
begin
   if GrupoContab.Tem_Filhos(Sistema.IdEmpresa,
                             cds.FieldByName('TIPO').AsString,
                             cds.FieldByName('CLASSE').AsString) then
   begin
      dbedCod.ReadOnly := True;
      pnlAnaSint.Enabled := False;
      rdgrpStatus.Enabled := False;
   end else
   begin
      dbedCod.ReadOnly := False;
      pnlAnaSint.Enabled := True;
      rdgrpStatus.Enabled := True;
   end;
   pnlDetCCusto.Enabled := True;
   inherited;
   cdsPlanoGrupo.Edit;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroDelete(Sender: TObject);
begin
   if not GrupoContab.BensnoGrupo(cds.FieldByName('IDGRUPO').AsFloat,
                                  Sistema.IdEmpresa) then
   begin
      if not GrupoContab.Tem_Filhos(Sistema.IdEmpresa,
                                    cds.FieldByName('TIPO').AsString,
                                    cds.FieldByName('CLASSE').AsString) then
      begin
         if GrupoContab.TransfOK(cdsPlanoGrupo.FieldByName('IDPESSOA').AsInteger,
                                 cdsPlanoGrupo.FieldByName('IDGRUPO').AsInteger) then
         begin
            if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
              begin
                  cdsDet.First;
                  while not cdsDet.EOF do
                     cdsDet.Delete;
              end;
            cdsGrupoBemxCC.First;
            while not cdsGrupoBemxCC.EOF do
               cdsGrupoBemxCC.Delete;
            cdsPlanoGrupo.First;
            while not cdsPlanoGrupo.EOF do
               cdsPlanoGrupo.Delete;
            inherited;
         end else
         begin
            MsgDlg('Grupo Contábil registrado em Transferências. Coloque-o como Inativo!',
                   'Erro',mtError,[mbOk],0);
         end;
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
   if dbedCod.ReadOnly then
      exit;
   //-------------------------------------------------------------------------------------
   try
      inherited;
      pnlAnaSint.Enabled := True;
      //----------------------------------------------------------------------------------
      if trim(dbedCod.Text) <> '' then
      begin
         bOk := GrupoContab.Verifica_Node(Sistema.IdEmpresa,
                                          trim(dbedCod.Text),
                                          trim(dbedCod.Text),
                                          True, iGrau, lNivel, Ind);
         if not bOk then
         begin
            MsgDlg(GrupoContab.MessageInfo, 'Erro', mtError, [mbOK], 0);
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
      end else
      begin
         MsgDlg('Informe o Código Hierárquico do Grupo Contábil!','Erro',mtError,[mbOK],0);
         dbedCod.SetFocus;
      end;
   except
      Raise;
   end;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.rdgrpstatusChange(Sender: TObject);
begin
   inherited;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeDetalheInsert(Sender: TObject);
var
   bPrimeiro : Boolean;
begin
  if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
    begin
       bPrimeiro := False;
       if pgctrlDetalhe.ActivePage = tbsDet then
          if cdsDet.IsEmpty then
             bPrimeiro := True;
       inherited;
       if bPrimeiro then
          cdsDet.FieldByName('DESCTAXADEP').AsString := 'Brasil';
    end
  else inherited;//Darivaldo Alencar SOL.198886.18334
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeDetalheDelete(Sender: TObject);
begin
   inherited;
   if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
     begin
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
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeDetalheConfirma(Sender: TObject);
begin
if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
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
     end
   else begin
        inherited;
   end;
  end
  else inherited; //Darivaldo Alencar SOL.198886.18334
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.ProcessaDetalhes;
begin
  if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
    begin
       if cds.State in [dsInsert,dsEdit] then
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
   if not(Sistema.IdModulo = 7) then //Darivaldo Alencar SOL.198886.18334
     begin
       if cdsDet.RecordCount <> iNumTaxaDep then
       begin
          MsgDlg('Obrigatório informar todas as Taxas de Depreciações' + #13 +
                 'definidas nos Parâmetros do Sistema.',LerMensagem(2),mtError,[mbOk],0);
          dbeDescricao.SetFocus;
          exit;
       end;
     end;
   //-------------------------------------------------------------------------------------
   if sbtnAnalitico.down then
      cds.FieldByName('TIPO').AsString := 'A';
   if sbtnSintetico.down then
      cds.FieldByName('TIPO').AsString := 'S';
   //-------------------------------------------------------------------------------------
   if cds.FieldByName('STATUS').AsString = 'A' then
   begin
      cds.FieldByName('INATIVO').AsInteger := 0;
      cdsPlanoGrupo.FieldByName('INATIVO').AsInteger := 0;
   end else
   begin
      cds.FieldByName('INATIVO').AsInteger := 1;
      cdsPlanoGrupo.FieldByName('INATIVO').AsInteger := 1;
   end;
   //-------------------------------------------------------------------------------------
   GravaGrupoBemxCC;
   //-------------------------------------------------------------------------------------
   Accept := True;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroConfirma(Sender: TObject);
var
   OldOperacao : TOperacao;

begin
   OldOperacao := CMECadastro.Operacao;
   inherited;
   if OldOperacao = opApagar then
      SelGrupoContab(Sistema.IdEmpresa,-1)
   else
   if OldOperacao = opAlterar then
      SelGrupoContab(Sistema.IdEmpresa,cds.FieldByName('IDGRUPO').AsFloat);
   pnlDetCCusto.Enabled := False;
   //-------------------------------------------------------------------------------------
   dbedCod.ReadOnly := False;
   pnlAnaSint.Enabled := True;
   rdgrpStatus.Enabled := True;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelGrupoContab(Sistema.IdEmpresa,-1);
   //-------------------------------------------------------------------------------------
   pnlDetCCusto.Enabled := False;
   dbedCod.ReadOnly := False;
   pnlAnaSint.Enabled := True;
   rdgrpStatus.Enabled := True;
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
         //-------------------------------------------------------------------------------
         if cdsGrupoBemxCC.Locate('CODCENTROCUSTO', trim(cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString), []) then
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
   iListPos : Integer;

begin
   //-------------------------------------------------------------------------------------
   // Insere os Centros de Custos acrescentados a lista
   //-------------------------------------------------------------------------------------
   if cds.State = dsEdit then
      cdsGrupoBemxCC2.Data  := GrupoContab.ListaGrupoBemxCC(cds.FieldByName('IDGRUPO').AsInteger, Sistema.IdEmpresa)
   else
      cdsGrupoBemxCC2.Data  := GrupoContab.ListaGrupoBemxCC(-1,-1);
   //-------------------------------------------------------------------------------------
   iListPos := 0;
   while iListPos <= (DstList.Items.Count - 1) do
   begin
      if cds.State = dsEdit then
      begin
         if not cdsGrupoBemxCC2.IsEmpty then
         begin
            if not cdsGrupoBemxCC2.Locate('IDGRUPO;IDPESSOA;IDEMPRESA;CODCENTROCUSTO',
                                          VarArrayOf([cds.FieldByName('IDGRUPO').AsInteger,
                                                      Sistema.IdEmpresa,
                                                      Sistema.IdEmpresa,
                                                      //trim(copy(DstList.Items.Strings[iListPos],1,10))]),[]) then    //MIGRACAO-ORACLE
                                                      trim(DstList.Items.Strings[iListPos])]),[]) then                 //MIGRACAO-ORACLE
            begin
               cdsGrupoBemxCC.Append;
               cdsGrupoBemxCC.FieldByName('IDGRUPO').AsInteger       := cds.FieldByName('IDGRUPO').AsInteger;
               cdsGrupoBemxCC.FieldByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
               cdsGrupoBemxCC.FieldByName('IDEMPRESA').AsInteger     := Sistema.IdEmpresa;
               //cdsGrupoBemxCC.FieldByName('CODCENTROCUSTO').AsString := trim(copy(DstList.Items.Strings[iListPos],1,10));  //MIGRACAO-ORACLE
               cdsGrupoBemxCC.FieldByName('CODCENTROCUSTO').AsString := trim(DstList.Items.Strings[iListPos]);               //MIGRACAO-ORACLE
               cdsGrupoBemxCC.Post;
            end;
         end else
         begin
            cdsGrupoBemxCC.Append;
            cdsGrupoBemxCC.FieldByName('IDGRUPO').AsInteger       := cds.FieldByName('IDGRUPO').AsInteger;
            cdsGrupoBemxCC.FieldByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
            cdsGrupoBemxCC.FieldByName('IDEMPRESA').AsInteger     := Sistema.IdEmpresa;
            //cdsGrupoBemxCC.FieldByName('CODCENTROCUSTO').AsString := trim(copy(DstList.Items.Strings[iListPos],1,10));   //MIGRACAO-ORACLE
            cdsGrupoBemxCC.FieldByName('CODCENTROCUSTO').AsString := trim(DstList.Items.Strings[iListPos]);                //MIGRACAO-ORACLE
            cdsGrupoBemxCC.Post;
         end;
      end else
      begin
         cdsGrupoBemxCC.Append;
         cdsGrupoBemxCC.FieldByName('IDPESSOA').AsInteger      := Sistema.IdEmpresa;
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
   while iListPos <= (srcList.Items.Count - 1) do
   begin
      if cds.State = dsEdit then
      begin
         if cdsGrupoBemxCC.Locate('IDGRUPO;IDPESSOA;IDEMPRESA;CODCENTROCUSTO',
                                  VarArrayOf([cds.FieldByName('IDGRUPO').AsInteger,
                                              Sistema.IdEmpresa, Sistema.IdEmpresa,
                                              //trim(copy(srcList.Items.Strings[iListPos],1,10))]),[]) then    //MIGRACAO-ORACLE
                                              trim(srcList.Items.Strings[iListPos])]),[]) then                 //MIGRACAO-ORACLE
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
procedure TfrmMTCadGrupoContab.cdsAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if cds.FieldByName('TIPO').AsString = 'A' then
   begin
      sbtnAnalitico.down := True;
      sbtnSintetico.down := False;
   end else
   if cds.FieldByName('TIPO').AsString = 'S' then
   begin
      sbtnAnalitico.down := False;
      sbtnSintetico.down := True;
   end else
   begin
      sbtnAnalitico.down := False;
      sbtnSintetico.down := False;
   end;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.sbtnSinteticoClick(Sender: TObject);
begin
   inherited;
   if sbtnSintetico.Down then
   begin
      sbtnAnalitico.down := False;
      sbtnSintetico.down := True;
   end else
   begin
      sbtnAnalitico.down := True;
      sbtnSintetico.down := False;
   end;
end;
//========================================================================================
procedure TfrmMTCadGrupoContab.sbtnAnaliticoClick(Sender: TObject);
begin
   inherited;
   if sbtnAnalitico.Down then
   begin
      sbtnAnalitico.down := True;
      sbtnSintetico.down := False;
   end else
   begin
      sbtnAnalitico.down := False;
      sbtnSintetico.down := True;
   end;
end;

end.



