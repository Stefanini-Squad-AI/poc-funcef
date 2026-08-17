unit fMovSelTransf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  wwdblook, CMDBLookupCombo, Spin, TREdit, CMTree, wwdbedit,
  Wwdotdot, Wwdbcomb, wwdbdatetimepicker, CMDateTimePicker, Mask,
  CmEventosCadastro, ImgList{$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmMovSelTransf = class(TfrmCadMestreDetalheCS)
    Label3: TLabel;
    qryDet: TwwQuery;
    dbeSbxTermo: TwwDBEdit;
    Label1: TLabel;
    dbeSbxProcesso: TwwDBEdit;
    Processo: TLabel;
    dbeSbxData: TCMDateTimePicker;
    Label2: TLabel;
    dbeResponsavel: TwwDBEdit;
    qryResp: TwwQuery;
    qryRespIDRESPONSAVEL: TFloatField;
    qryRespDESCRESPONSAVEL: TStringField;
    dsResp: TwwDataSource;
    MSResp: TMontaSelect;
    bbtnSelResp: TBitBtn;
    Label4: TLabel;
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    qrySelBem: TwwQuery;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDCONJUNTO: TFloatField;
    qrySelBemPLACA: TFloatField;
    qrySelBemDESCCONJUNTO: TStringField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDESCLOCALIZACAO: TStringField;
    qrySelBemNOMERESPONSAVEL: TStringField;
    Label26: TLabel;
    edPlaca: TEdit;
    bbtnSelBem: TBitBtn;
    Label22: TLabel;
    dsSelBem: TwwDataSource;
    dbmDesBem: TDBMemo;
    updDet: TUpdateSQL;
    Toolbar972: TToolbar97;
    bbtnGeraDet: TBitBtn;
    bbtnLimpar: TBitBtn;
    MSGrupo: TMontaSelect;
    MSConjunto: TMontaSelect;
    dsConjunto: TwwDataSource;
    qryConjunto: TwwQuery;
    qryConjuntoDESCCONJUNTO: TStringField;
    qryConjuntoIDCONJUNTO: TFloatField;
    qryConjuntoIDLOCALIZACAO: TFloatField;
    qryConjuntoIDRESPONSAVEL: TFloatField;
    qryConjuntoDESCLOCALIZACAO: TStringField;
    qryConjuntoDESCRESPONSAVEL: TStringField;
    qryConjuntoIDPESSOA: TFloatField;
    qryConjuntoDISPONIVEL: TFloatField;
    qryConjuntoALUGADO: TFloatField;
    dsGrupo: TwwDataSource;
    qryGrupo: TwwQuery;
    qryGrupoNOME: TStringField;
    qryGrupoIDGRUPO: TFloatField;
    qryGrupoDEPRECIACAO: TFloatField;
    qryGrupoULTIDBEM: TFloatField;
    qryGrupoCLASSE: TStringField;
    qryIDSELBAIXA: TFloatField;
    qrySBTIPOMOV: TFloatField;
    qrySBXTERMO: TFloatField;
    qrySBXPROCESSO: TStringField;
    qrySBXDATA: TDateTimeField;
    qryIDRESPONSAVEL: TFloatField;
    qrySBXFLGEXECUTADO: TFloatField;
    qrySBXDTAEXECUTADO: TDateTimeField;
    pnlRegNovos: TPanel;
    Label5: TLabel;
    dbeConjunto: TwwDBEdit;
    bbtnSelConjunto: TBitBtn;
    Label6: TLabel;
    dbeGrupo: TwwDBEdit;
    Label7: TLabel;
    dbeConjNovo: TwwDBEdit;
    Label8: TLabel;
    dbeGrupoNovo: TwwDBEdit;
    bbtnSelGrupo: TBitBtn;
    Dock975: TDock97;
    Toolbar973: TToolbar97;
    bbtnOkConjGrup: TBitBtn;
    bbtnCancConjGrup: TBitBtn;
    qrySelBemDESCGRUPO: TStringField;
    Splitter1: TSplitter;
    Label9: TLabel;
    dbeLocal: TwwDBEdit;
    Label10: TLabel;
    dbeLocalNovo: TwwDBEdit;
    qrySelBemIDGRUPO: TFloatField;
    qryVerificaGrupo: TwwQuery;
    qryVerificaGrupoIDGRUPO: TFloatField;
    qryVerificaClasse: TwwQuery;
    qryVerificaClasseIDCLASSEBEM: TFloatField;
    qryVerificaClasseIDGRUPO: TFloatField;
    qrySelBemIDCLASSEBEM: TFloatField;
    qryBuscaGrupo: TwwQuery;
    qryBuscaGrupoIDGRUPO: TFloatField;
    qryInventBens: TwwQuery;
    updInventBens: TUpdateSQL;
    qryInventBensIDINVENTARIOBENS: TFloatField;
    qryInventBensIDEMPRESA: TFloatField;
    qryInventBensSTATUS: TFloatField;
    qryInventBensIDSELBAIXA: TFloatField;
    qryLocal: TwwQuery;
    qryLocalIDLOCALIZACAO: TFloatField;
    qryLocalDESCLOCALIZACAO: TStringField;
    qryLocalIDRESPONSAVEL: TFloatField;
    qryLocalNOMERESPONSAVEL: TStringField;
    qryLocalIDEMPRESA: TFloatField;
    qryLocalCODCENTROCUSTO: TStringField;
    dsLocal: TwwDataSource;
    MSLocal: TMontaSelect;
    bbtnSelLocal: TBitBtn;
    qrySelBemIDLOCALIZACAO: TFloatField;
    dbeResp: TwwDBEdit;
    dbeRespNovo: TwwDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    MSRespConj: TMontaSelect;
    qryRespConj: TwwQuery;
    dsRespConj: TwwDataSource;
    qryDetIDSELBAIXA: TFloatField;
    qryDetIDBEM: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetIDCONJATUAL: TFloatField;
    qryDetIDLOCALATUAL: TFloatField;
    qryDetIDRESPATUAL: TFloatField;
    qryDetIDGRUPATUAL: TFloatField;
    qryDetIDCONJUNTO: TFloatField;
    qryDetIDLOCALIZACAO: TFloatField;
    qryDetIDRESPONSAVEL: TFloatField;
    qryDetIDGRUPO: TFloatField;
    qryDetPLACA: TFloatField;
    qryDetDESBEM: TStringField;
    qryDetDESCCONJUNTO: TStringField;
    qryDetDESCGRUPO: TStringField;
    qryDetDESCLOCAL: TStringField;
    qryDetIDCONJUNTOATUAL: TFloatField;
    qryDetIDGRUPOATUAL: TFloatField;
    qryDetIDLOCALIZACAOATUAL: TFloatField;
    qryDetIDRESPONSAVELATUAL: TFloatField;
    qryDetIDCLASSEBEM: TFloatField;
    bbtnSelRespConj: TBitBtn;
    qrySelBemIDRESPONSAVEL: TFloatField;
    qryDetNOMERESP: TStringField;
    qryRespConjIDRESPONSAVEL: TFloatField;
    qryRespConjDESCRESPONSAVEL: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnGeraDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnLimparClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure bbtnOkConjGrupClick(Sender: TObject);
    procedure bbtnCancConjGrupClick(Sender: TObject);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure bbtnSelRespConjClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    bInsert, bTstConf : Boolean;
    aIdBem  : Array of Integer;
    iaIdBem : Integer;
    function  InsertIdBem(iIdBem : Integer) : boolean;
    function  DeleteIdBem(iIdBem : Integer) : boolean;
    function  FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
    Procedure SelMestreDet(n : LongInt);
  public
    { Public declarations }
  end;

var
  frmMovSelTransf : TfrmMovSelTransf;

implementation

{$R *.DFM}

Uses uMensErro, uSistema, uDataBase, dBaseDados, fSelBem, dAtivoFixo;

//========================================================================================
procedure TfrmMovSelTransf.FormCreate(Sender: TObject);
begin
   inherited;
   qry.Prepare;
   qryDet.Prepare;
   qryResp.Prepare;
   qryPlaca.Prepare;
   qrySelBem.Prepare;
   qryConjunto.Prepare;
   qryGrupo.Prepare;
   qryVerificaGrupo.Prepare;
   qryVerificaClasse.Prepare;
   qryBuscaGrupo.Prepare;
   bbtnGeraDet.Enabled := False;
   bbtnLimpar.Enabled  := False;
   pnlRegNovos.Height  := 0;
   dbgrdDet.Enabled    := True;
   //-------------------------------------------------------------------------------------
   // Bloqueia transferência de local/responsável qdo PARAMETROSCAFMANUT.TIPOCONJUNTO = 1
   //-------------------------------------------------------------------------------------
   with dtmAtivoFixo do
   begin
      qryParamCAF.Close;
      qryParamCAF.ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
      qryParamCAF.Open;
      if qryParamCAF.FieldByName('TIPOCONJUNTO').AsInteger = 1 then
      begin
         bbtnSelLocal.Enabled    := False;
         bbtnSelRespConj.Enabled := False;
      end else
      begin
         bbtnSelLocal.Enabled    := True;
         bbtnSelRespConj.Enabled := True;
      end;
   end;
   //-------------------------------------------------------------------------------------
   SelMestreDet(-1);
end;
//========================================================================================
procedure TfrmMovSelTransf.SelMestreDet( n : LongInt );
begin
   qry.Close;
   qry.Params[0].Value := n;
   qry.Open;
   //-------------------------------------------------------------------------------------
   qryResp.Close;
   qryResp.ParamByName('PIDRESP').AsInteger := qry.FieldByName('IDRESPONSAVEL').AsInteger;
   qryResp.Open;
   //-------------------------------------------------------------------------------------
   qryDet.Close;
   qryDet.ParamByName('PIDSELBAIXA').Value := n;
   qryDet.Open;
   //-------------------------------------------------------------------------------------
   // Preenche a lista de bens
   //-------------------------------------------------------------------------------------
   iaIdBem := 0;
   SetLength(aIdBem, iaIdBem);
   if not qryDet.IsEmpty then
   begin
      while not qryDet.EOF do
      begin
         InsertIdBem(qryDet.FieldByName('IDBEM').AsInteger);
         qryDet.Next;
      end;
      qryDet.First
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.CmeCadastroInsert(Sender: TObject);
begin
   bInsert := True;
   SelMestreDet(-1);
   inherited;
   bbtnGeraDet.Enabled := True;
   bbtnLimpar.Enabled  := True;
   dbeSbxTermo.Enabled := True;
end;
//========================================================================================
procedure TfrmMovSelTransf.CmeCadastroEdit(Sender: TObject);
begin
   bInsert := False;
   inherited;
   bbtnGeraDet.Enabled := True;
   bbtnLimpar.Enabled  := True;
   dbeSbxTermo.Enabled := False;
end;
//========================================================================================
procedure TfrmMovSelTransf.CmeCadastroDelete(Sender: TObject);
begin
   qryDet.First;
   while not qryDet.EOF Do
   begin
      qryDet.Delete;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
   bbtnGeraDet.Enabled := False;
   bbtnLimpar.Enabled := False;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSConjunto.ValoresChave.Count > 0) and (MSConjunto.ValoresChave[0] <> '') then
   begin
      qryConjunto.Close;
      qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := StrToInt(MSConjunto.ValoresChave[0]);
      qryConjunto.Open;
      //----------------------------------------------------------------------------------
      // Seleciona a localização atual do conjunto
      //----------------------------------------------------------------------------------
      qryLocal.Close;
      qryLocal.ParamByName('PIDLOCAL').AsInteger   := qryConjuntoIDLOCALIZACAO.AsInteger;
      qryLocal.ParamByName('PIDEMPRESA').AsInteger := qryConjuntoIDPESSOA.AsInteger;
      qryLocal.Open;
      //----------------------------------------------------------------------------------
      // Seleciona o responsável atual do conjunto
      //----------------------------------------------------------------------------------
      qryRespConj.Close;
      qryRespConj.ParamByName('PIDRESP').AsFloat := qryConjuntoIDRESPONSAVEL.AsFloat;
      qryRespConj.Open;
      //----------------------------------------------------------------------------------
      // Verificar se a mudança de conjunto irá acarretar uma mudança de grupo
      //----------------------------------------------------------------------------------
      qryVerificaGrupo.Close;
      qryVerificaGrupo.ParamByName('PIDGRUPO').AsInteger    := qryGrupoIDGRUPO.AsInteger;
      qryVerificaGrupo.ParamByName('PIDCONJUNTO').AsInteger := qryConjuntoIDCONJUNTO.AsInteger;
      qryVerificaGrupo.Open;
      if qryVerificaGrupo.IsEmpty then
      begin
         MsgDlg('Grupo atual inválido para o Conjunto/Localização/Centro de Custo selecionado. '+
                'Selecione o Grupo Correto','Erro',mtError,[mbOk],0);
         qryBuscaGrupo.Close;
         qryBuscaGrupo.ParamByName('PIDLOCAL').AsInteger  := qryConjuntoIDLOCALIZACAO.AsInteger;
         qryBuscaGrupo.ParamByName('PIDCLASSE').AsInteger := qryDetIDCLASSEBEM.AsInteger;
         qryBuscaGrupo.Open;
         if (not qryBuscaGrupo.IsEmpty) then
         begin
            qryGrupo.Close;
            qryGrupo.ParamByName('PIDGRUPO').AsInteger := qryBuscaGrupoIDGRUPO.AsInteger;
            qryGrupo.Open;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   MSLocal.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSLocal.RetornouValor) then
   begin
      qryLocal.Close;
      qryLocal.ParamByName('PIDLOCAL').AsInteger   := StrToInt(MSLocal.ValoresChave[0]);
      qryLocal.ParamByName('PIDEMPRESA').AsInteger := StrToInt(MSLocal.ValoresChave[1]);
      qryLocal.Open;
      //----------------------------------------------------------------------------------
      // Seleciona o responsável atual do conjunto
      //----------------------------------------------------------------------------------
      qryRespConj.Close;
      qryRespConj.ParamByName('PIDRESP').AsFloat := qryLocalIDRESPONSAVEL.AsFloat;
      qryRespConj.Open;
      //----------------------------------------------------------------------------------
      // Verificar se a Localização do Conjunto foi alterada
      //----------------------------------------------------------------------------------
      if (qryConjuntoIDLOCALIZACAO.AsInteger <> qryLocalIDLOCALIZACAO.AsInteger) then
      begin
         if MsgDlg('Foi selecionada uma localização diferente da atualmente cadastrada para o '+
                   'Conjunto.'+#13+#13+'Se for realizar uma Transferência de Localização do Conjunto '+
                   'selecione SIM. Caso a sua opção seja a criação de um novo conjunto, selecione NÃO '+
                   'e cadastre o novo conjunto no Cadastro de Conjuntos.',
                   'Atenção',mtConfirmation,[mbYes,mbNo],0) = mrNo then
         begin
            qryLocal.Close;
            qryLocal.ParamByName('PIDLOCAL').AsInteger   := qryDetIDLOCALIZACAOATUAL.AsInteger;
            qryLocal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
            qryLocal.Open;
            //----------------------------------------------------------------------------
            qryRespConj.Close;
            qryRespConj.ParamByName('PIDRESP').AsFloat := qryLocalIDRESPONSAVEL.AsFloat;
            qryRespConj.Open;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnSelRespConjClick(Sender: TObject);
begin
   inherited;
   MSRespConj.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSRespConj.RetornouValor then
   begin
      qryRespConj.Close;
      qryRespConj.ParamByName('PIDRESP').AsInteger := StrToInt(MSRespConj.ValoresChave[0]);
      qryRespConj.Open;
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSGrupo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSGrupo.RetornouValor) then
   begin
      qryGrupo.Close;
      qryGrupo.ParamByName('PIDGRUPO').AsInteger  := StrToInt(MSGrupo.ValoresChave[0]);
      qryGrupo.Open;
      //----------------------------------------------------------------------------------
      // Verificar se a mudança de Grupo irá acarretar uma mudança de Conjunto
      //----------------------------------------------------------------------------------
      qryVerificaClasse.Close;
      qryVerificaClasse.ParamByName('PIDGRUPO').AsInteger     := qryGrupoIDGRUPO.AsInteger;
      qryVerificaClasse.ParamByName('PIDCLASSEBEM').AsInteger := qryDetIDCLASSEBEM.AsInteger;
      qryVerificaClasse.Open;
      if qryVerificaClasse.IsEmpty then
      begin
         MsgDlg('Grupo escolhido é inválido para os bens selecionados. '+
                'Selecione o Grupo Correto','Erro',mtError,[mbOk],0);
      end;
      //----------------------------------------------------------------------------------
      // Verificar se a mudança de conjunto irá acarretar uma mudança de grupo
      //----------------------------------------------------------------------------------
      qryVerificaGrupo.Close;
      qryVerificaGrupo.ParamByName('PIDGRUPO').AsInteger    := qryGrupoIDGRUPO.AsInteger;
      qryVerificaGrupo.ParamByName('PIDCONJUNTO').AsInteger := qryConjuntoIDCONJUNTO.AsInteger;
      qryVerificaGrupo.Open;
      if qryVerificaGrupo.IsEmpty then
      begin
         MsgDlg('Grupo atual inválido para o Conjunto/Localização/Centro de Custo selecionado. '+
                'Selecione o Grupo Correto','Erro',mtError,[mbOk],0);
      end;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResp.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qryResp.Close;
   if (MSResp.ValoresChave.Count > 0) and (MSResp.ValoresChave[0] <> '') then
   begin
      qryResp.ParamByName('PIDRESP').AsInteger := StrToInt(MSResp.ValoresChave[0]);
      qryResp.Open;
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      qryDet.First;
      dbgrdDet.SelectRecord;
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDBEM').Clear;
   qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelBem.Open;
   edPlaca.Text := '';
   //-------------------------------------------------------------------------------------
   edPlaca.SetFocus;
end;
//========================================================================================
procedure TfrmMovSelTransf.CmeDetalheDelete(Sender: TObject);
begin
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDBEM').AsInteger    := qryDetIDBEM.AsInteger;
   qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelBem.Open;
   edPlaca.Text := floattostr(qrySelBemPLACA.AsFloat);
   //-------------------------------------------------------------------------------------
   if (MsgDlg('Confirma a remoção do Bem da Seleção para Transferência','Remoção',
             mtConfirmation,[mbOk,mbCancel],0) = mrOk) then
   begin
      inherited;
      DeleteIdBem(qrySelBem.FieldByName('IDBEM').AsInteger);
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qrySelBem.Close;
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelBem.ParamByName('PIDPESSOA').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qrySelBem.ParamByName('PIDBEM').AsInteger    := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
   end else
   begin
      qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelBem.ParamByName('PIDBEM').Clear;
   end;
   qrySelBem.Open;
   //-------------------------------------------------------------------------------------
   if (qrySelBem.IsEmpty) then
   begin
      edPlaca.Text := '';
   end else
   begin
      edPlaca.Text := qrySelBemPLACA.AsString;
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.edPlacaExit(Sender: TObject);
begin
   inherited;
   if edPlaca.Text <> '' then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsFloat := StrToFloat(edPlaca.Text);
      qryPlaca.Open;
      if not qryPlaca.isEmpty then
      begin
         qrySelBem.Close;
         qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelBem.ParamByName('PIDBEM').AsInteger    := qryPlacaIDBEM.AsInteger;
         qrySelBem.Open;
         //-------------------------------------------------------------------------------
         if not qrySelBem.IsEmpty then
         begin
            edPlaca.Text := qrySelBemPLACA.AsString;
         end else
         begin
            MsgDlg('Bem já totalmente Baixado ou com Controle Físico','Erro',mtError,[mbOk],0);
            edPlaca.SetFocus;
         end;
      end else
      begin
         qrySelBem.Close;
         qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelBem.ParamByName('PIDBEM').Clear;
         qrySelBem.Open;
         //-------------------------------------------------------------------------------
         edPlaca.Text := '';
         edPlaca.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnConfirmarClick(Sender: TObject);
var
   bResult : boolean;

begin
   CmeCadastro.BeforeConfirma(Self,bResult);
   if bResult then
   begin
      inherited;
      if ( bInsert ) And ( bTstConf ) Then
         SelMestreDet(-1);
   end;
end;
//========================================================================================
Procedure TfrmMovSelTransf.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
var
   fTotPerc : Double;

begin
   Accept := True;
   //-------------------------------------------------------------------------------------
   if (trim(dbeSbxTermo.Text) = '') then
   begin
      MsgDlg('O número do termo de transferência não foi preenchido', 'Erro', mtError, [mbOK], 0);
      dbeSbxTermo.SetFocus;
      Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeSbxProcesso.Text) = '') then
   begin
       MsgDlg('Processo não foi preenchido', 'Erro', mtError, [mbOK], 0);
       dbeSbxProcesso.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeSbxData.Text) = '') then
   begin
       MsgDlg('Data do cadastramento do termo não foi preenchida','Erro',mtError,[mbOK],0);
       dbeSbxData.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   if (trim(dbeResponsavel.Text) = '') then
   begin
       MsgDlg('Responsável pelo termo não foi selecionado','Erro',mtError,[mbOK],0);
       dbeResponsavel.SetFocus;
       Accept := False;
   end else
   //-------------------------------------------------------------------------------------
   begin
      fTotPerc := 0;
      qryDet.First;
      while not qryDet.EOF do
      begin
         fTotPerc := fTotPerc + 1;
         qryDet.Next;
      end;
      if (fTotperc <= 0) then
      begin
         MsgDlg('Selecione os bens que serão transferidos...!', 'Erro', mtError, [mbOK], 0);
         Accept := False;
      end;
   end;
   //-------------------------------------------------------------------------------------
   bTstConf := Accept;
end;
//========================================================================================
procedure TfrmMovSelTransf.CmeCadastroConfirma(Sender: TObject);
begin
   if qry.State in [dsInsert,dsEdit] then
   begin
      try
         StartTransacao;
         //-------------------------------------------------------------------------------
         if (qry.State = dsInsert) then
         begin
            qryIDSELBAIXA.AsInteger := LeUltRegistro(nil,'SELBAIXA');
         end;
         qrySBTIPOMOV.AsInteger  := 1;  // 0 - Baixa, 1 - Transferência
         qryIDRESPONSAVEL.AsInteger := qryRespIDRESPONSAVEL.AsInteger;
         //----------------------------------------------------------------------------
         qryDet.First;
         while not qryDet.EOF do
         begin
            qryDet.Edit;
            qryDetIDSELBAIXA.AsInteger   := qryIDSELBAIXA.AsInteger;
            qryDetIDCONJATUAL.AsInteger  := qryDetIDCONJUNTOATUAL.AsInteger;
            qryDetIDGRUPATUAL.AsInteger  := qryDetIDGRUPOATUAL.AsInteger;
            qryDetIDLOCALATUAL.AsInteger := qryDetIDLOCALIZACAOATUAL.AsInteger;
            qryDetIDRESPATUAL.AsFloat    := qryDetIDRESPONSAVELATUAL.AsFloat;
            qryDet.Next;
         end;
         //-------------------------------------------------------------------------------
         qry.ApplyUpdates;
         qryDet.ApplyUpdates;
         //-------------------------------------------------------------------------------
         case CmeCadastro.Operacao of
            opInserir :
               if not Sistema.GravaLogOperacoes('Inclusao de Seleção de Bens para Transferência') then
                  raise Exception.Create('Erro ao gravar Log de Operação');
            opAlterar :
               if not Sistema.GravaLogOperacoes('Alteracao de Seleção de Bens para Transferência') then
                  raise Exception.Create('Erro ao gravar Log de Operação');
         end;
         //-------------------------------------------------------------------------------
         CommitTransacao;
      except
         RollbackTransacao;
         Abort;
      end;
   end else
   begin
      qryDet.ApplyUpdates;
      qry.ApplyUpdates;
      //----------------------------------------------------------------------------------
      case CmeCadastro.Operacao of
         opApagar :
            if not Sistema.GravaLogOperacoes('Remocao de Seleção de Bens para Transferência') then
               raise Exception.Create('Erro ao gravar Log de Operação');
      end;
   end;
   inherited;
   qryConjunto.Close;
   qryGrupo.Close;
   bbtnLimpar.Enabled  := False;
   bbtnGeraDet.Enabled := False;
end;
//========================================================================================
procedure TfrmMovSelTransf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qry.Close;
   qryDet.Close;
   qryResp.Close;
   qryPlaca.Close;
   qrySelBem.Close;
   qryGrupo.Close;
   qryConjunto.Close;
   qryVerificaGrupo.Close;
   qryVerificaClasse.Close;
   qryBuscaGrupo.Close;
   qryInventBens.Close;
   //
   qry.UnPrepare;
   qryDet.UnPrepare;
   qryResp.UnPrepare;
   qryPlaca.UnPrepare;
   qrySelBem.UnPrepare;
   qryGrupo.UnPrepare;
   qryConjunto.UnPrepare;
   qryVerificaGrupo.UnPrepare;
   qryVerificaClasse.UnPrepare;
   qryBuscaGrupo.UnPrepare;
   qryInventBens.UnPrepare;
end;
//========================================================================================
procedure TfrmMovSelTransf.sbtnInsDetClick(Sender: TObject);
begin
   bbtnGeraDet.Enabled    := False;
   bbtnLimpar.Enabled     := False;
   bbtnConfirmar.Enabled  := False;
   bbtnCancelar.Enabled   := False;
   inherited;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnOkDetClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnCancelarDetClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnVoltarDetClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled := True;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmMovSelTransf.sbtnApagarClick(Sender: TObject);
begin
   if (qrySBXFLGEXECUTADO.AsInteger = 0) then
   begin
      //----------------------------------------------------------------------------------
      // Remove o link com inventário (Se Houver)
      //----------------------------------------------------------------------------------
      if not qryInventBens.Prepared then qryInventBens.Prepare;
      qryInventBens.Open;
      if (qryInventBens.Locate('IDSELBAIXA',qryIDSELBAIXA.AsInteger,[])) then
      begin
         qryInventBens.Edit;
         qryInventBensSTATUS.AsInteger := 1;   // Inventário não Processado
         qryInventBensIDSELBAIXA.Clear ;       // Limpa o Termo de Transf
         qryInventBens.Post;
         qryInventBens.ApplyUpdates;
      end;
      //----------------------------------------------------------------------------------
      inherited;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      SelMestreDet(-1);
   end else
   begin
      MsgDlg('Termo de Seleção de Bens executado em ' + qrySBXDTAEXECUTADO.AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelMestreDet(-1);
      bbtnCancelar.Click;
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.sbtnAlterarClick(Sender: TObject);
begin
   if (qrySBXFLGEXECUTADO.AsInteger = 0) then
   begin
      inherited;
   end else
   begin
      MsgDlg('Termo de Seleção de Bens executado em ' + qrySBXDTAEXECUTADO.AsString,
             'Informação', mtInformation, [mbOk], 0);
      SelMestreDet(-1);
      bbtnCancelar.Click;
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.sbtnAltDetClick(Sender: TObject);
var
   iSel,
   iIdLoc1 , iIdLoc2,
   iIdGrup1, iIdGrup2        : Integer;
   bOk                       : Boolean;

begin
   bOk := True;
   qryDet.DisableControls;
   with dbgrdDet,dbgrdDet.DataSource.DataSet do
   begin
      if (SelectedList.Count > 0) then
      begin
         GotoBookmark(SelectedList.Items[0]);
         iIdLoc1  := qryDetIDLOCALIZACAOATUAL.AsInteger;
         iIdGrup1 := qryDetIDGRUPOATUAL.AsInteger;
         //-------------------------------------------------------------------------------
         for iSel := 1 to (SelectedList.Count - 1) do
         begin
            GotoBookmark(SelectedList.Items[iSel]);
            iIdLoc2  := qryDetIDLOCALIZACAOATUAL.AsInteger;
            iIdGrup2 := qryDetIDGRUPOATUAL.AsInteger;
            if (iIdLoc2 <> iIdLoc1) or (iIdGrup2 <> iIdGrup1) then
            begin
               bOk := False;
               MsgDlg('Existem bens selecionados pertencentes a localizações/conjuntos/grupos/responsáveis diferentes.',
                      'Erro', mtError, [mbOK], 0);
               UnSelectAll;
               bbtnCancConjGrup.Click;
               break;
            end;
         end;
         //-------------------------------------------------------------------------------
      end else
         bOk := False;
   end;
   qryDet.EnableControls;
   //-------------------------------------------------------------------------------------
   if bOk then
   begin
      with dbgrdDet,dbgrdDet.DataSource.DataSet do
      begin
         GotoBookmark(SelectedList.Items[0]);
      end;
      //----------------------------------------------------------------------------------
      qryConjunto.Close;
      if (not qryDetIDCONJUNTO.IsNull) then
      begin
         qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := qryDetIDCONJUNTO.AsInteger;
      end else
      begin
         qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := qryDetIDCONJUNTOATUAL.AsInteger;
      end;
      qryConjunto.Open;
      //----------------------------------------------------------------------------------
      qryLocal.Close;
      if (not qryDetIDLOCALIZACAO.IsNull) then
      begin
         qryLocal.ParamByName('PIDLOCAL').AsInteger   := qryDetIDLOCALIZACAO.AsInteger;
         qryLocal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
      end else
      begin
         qryLocal.ParamByName('PIDLOCAL').AsInteger   := qryDetIDLOCALIZACAOATUAL.AsInteger;
         qryLocal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
      end;
      qryLocal.Open;
      //----------------------------------------------------------------------------------
      qryRespConj.Close;
      if (not qryDetIDRESPONSAVEL.IsNull) then
      begin
         qryRespConj.ParamByName('PIDRESP').AsFloat := qryDetIDRESPONSAVEL.AsInteger;
      end else
      begin
         qryRespConj.ParamByName('PIDRESP').AsFloat := qryDetIDRESPONSAVELATUAL.AsInteger;
      end;
      qryRespConj.Open;
      //----------------------------------------------------------------------------------
      qryGrupo.Close;
      if (not qryDetIDGRUPO.IsNull) then
      begin
         qryGrupo.ParamByName('PIDGRUPO').AsInteger := qryDetIDGRUPO.AsInteger;
      end else
      begin
         qryGrupo.ParamByName('PIDGRUPO').AsInteger := qryDetIDGRUPOATUAL.AsInteger;
      end;
      qryGrupo.Open;
      //----------------------------------------------------------------------------------
      bbtnGeraDet.Enabled    := False;
      bbtnLimpar.Enabled     := False;
      bbtnConfirmar.Enabled  := False;
      bbtnCancelar.Enabled   := False;
      //----------------------------------------------------------------------------------
      if sbtnAltDet.Down then
      begin
         CmeDetalhe.Edit(Self);
         CmeDetalhe.AtualizaBotoes(Self);
      end else
         sbtnAltDet.Down := True;
   end;
   //-------------------------------------------------------------------------------------
   sbtnInsDet.Enabled    := False;
   sbtnExcluiDet.Enabled := False;
end;
//========================================================================================
procedure TfrmMovSelTransf.CmeDetalheEdit(Sender: TObject);
begin
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDBEM').AsInteger    := qryDetIDBEM.AsInteger;
   qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelBem.Open;
   pnlRegNovos.Height := 167;
   dbgrdDet.Enabled   := False;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnOkConjGrupClick(Sender: TObject);
begin
   pnlRegNovos.Height := 0;
   dbgrdDet.Enabled   := True;
   qryDet.Edit;
   CmeDetalhe.Confirma(Self);
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   //-------------------------------------------------------------------------------------
   sbtnInsDet.Enabled    := True;
   sbtnExcluiDet.Enabled := True;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled    := True;
end;
//========================================================================================
Procedure TfrmMovSelTransf.CmeDetalheConfirma(Sender: TObject);
var
   iSel, iPos : Integer;
Begin
   if (qryDet.State in [dsInsert,dsEdit]) then
   begin
      if (qryDet.State = dsInsert) then
      begin
         if (trim(edPlaca.Text) = '') or (qrySelBem.IsEmpty) Then
         begin
            MsgDlg('Nenhum Bem foi Selecionado','Erro',mtError,[mbOK],0);
            bbtnSelBem.SetFocus;
         end else
         begin
            //----------------------------------------------------------------------------
            // Pesquisa se o bem já foi cadastrado, tentando incluir na lista de idbem
            //----------------------------------------------------------------------------
            if not FindIdBem(qrySelBem.FieldByName('IDBEM').AsInteger,iPos) then
            begin
               qryDetIDPESSOA.AsInteger           := qrySelBemIDPESSOA.AsInteger;
               qryDetIDBEM.AsInteger              := qrySelBemIDBEM.AsInteger;
               qryDetPLACA.AsFloat                := qrySelBemPLACA.AsFloat;
               qryDetDESBEM.AsString              := qrySelBemDESBEM.AsString;
               qryDetDESCCONJUNTO.AsString        := qrySelBemDESCCONJUNTO.AsString;
               qryDetDESCGRUPO.AsString           := qrySelBemDESCGRUPO.AsString;
               qryDetDESCLOCAL.AsString           := qrySelBemDESCLOCALIZACAO.AsString;
               qryDetIDCONJUNTOATUAL.AsInteger    := qrySelBemIDCONJUNTO.AsInteger;
               qryDetIDLOCALIZACAOATUAL.AsInteger := qrySelBemIDLOCALIZACAO.AsInteger;
               qryDetIDRESPONSAVELATUAL.AsInteger := qrySelBemIDRESPONSAVEL.AsInteger;
               qryDetIDGRUPOATUAL.AsInteger       := qrySelBemIDGRUPO.AsInteger;
               qryDetIDCLASSEBEM.AsInteger        := qrySelBemIDCLASSEBEM.AsInteger;
               //-------------------------------------------------------------------------
               InsertIdBem(qrySelBem.FieldByName('IDBEM').AsInteger);
            end;
         end;
      end else
      //----------------------------------------------------------------------------------
      begin
         qryDet.DisableControls;
         with dbgrdDet,dbgrdDet.DataSource.DataSet do
         begin
            for iSel := 0 to (SelectedList.Count - 1) do
            begin
               GotoBookmark(SelectedList.Items[iSel]);
               qryDet.Edit;
               qryDetIDCONJUNTO.AsInteger    := qryConjuntoIDCONJUNTO.AsInteger;
               qryDetIDLOCALIZACAO.AsInteger := qryLocalIDLOCALIZACAO.AsInteger;
               qryDetIDRESPONSAVEL.AsFloat   := qryRespConjIDRESPONSAVEL.AsFloat;
               qryDetIDGRUPO.AsInteger       := qryGrupoIDGRUPO.AsInteger;
               qryDet.Post;
            end;
         end;
         qryDet.EnableControls;
         qryDet.Edit;
      end;
      inherited;
   end else
   begin
      inherited;
   end;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnCancConjGrupClick(Sender: TObject);
begin
   pnlRegNovos.Height := 0;
   dbgrdDet.Enabled   := True;
   CmeDetalhe.Cancel(Self);
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
   //-------------------------------------------------------------------------------------
   sbtnInsDet.Enabled    := True;
   sbtnExcluiDet.Enabled := True;
   bbtnGeraDet.Enabled   := True;
   bbtnLimpar.Enabled    := True;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnGeraDetClick(Sender: TObject);
var
   iPos : Integer;

begin
   inherited;
   Application.CreateForm(TfrmSelBem,frmSelBem);
   frmSelBem.FormStyle := FsNormal;
   frmSelBem.Visible   := False;
   frmSelBem.Top       := 84;
   frmSelBem.ShowModal;
   //-------------------------------------------------------------------------------------
   if frmSelBem.bResult then
   begin
      qryDet.DisableControls;
      frmSelBem.qry.First;
      while not frmSelBem.qry.EOF do
      begin
         if frmSelBem.qry.FieldByName('PROCESSAR').AsInteger = 1 then
         begin
            //----------------------------------------------------------------------------
            // Processa somente os bens não baixados
            //----------------------------------------------------------------------------
            if frmSelBem.qry.FieldByName('BAIXATOTAL').AsString <> 'S' then
            begin
               //-------------------------------------------------------------------------
               // Pesquisa se o bem já foi cadastrado, tentando incluir na lista de idbem
               //-------------------------------------------------------------------------
               if not FindIdBem(frmSelBem.qry.FieldByName('IDBEM').AsInteger,iPos) then
               begin
                  qryDet.Append;
                  qryDet.FieldByName('IDPESSOA').AsInteger           := frmSelBem.qry.FieldByName('IDPESSOA').AsInteger;
                  qryDet.FieldByName('IDBEM').AsInteger              := frmSelBem.qry.FieldByName('IDBEM').AsInteger;
                  qryDet.FieldByName('PLACA').AsFloat                := frmSelBem.qry.FieldByName('PLACA').AsFloat;
                  qryDet.FieldByName('DESBEM').AsString              := frmSelBem.qry.FieldByName('DESBEM').AsString;
                  qryDet.FieldByName('DESCCONJUNTO').AsString        := frmSelBem.qry.FieldByName('DESCCONJUNTO').AsString;
                  qryDet.FieldByName('DESCGRUPO').AsString           := frmSelBem.qry.FieldByName('DESCGRUPO').AsString;
                  qryDet.FieldByName('DESCLOCAL').AsString           := frmSelBem.qry.FieldByName('DESCLOCAL').AsString;
                  qryDet.FieldByName('IDCONJUNTOATUAL').AsInteger    := frmSelBem.qry.FieldByName('IDCONJUNTO').AsInteger;
                  qryDet.FieldByName('IDGRUPOATUAL').AsInteger       := frmSelBem.qry.FieldByName('IDGRUPO').AsInteger;
                  qryDet.FieldByName('IDLOCALIZACAOATUAL').AsInteger := frmSelBem.qry.FieldByName('IDLOCALIZACAO').AsInteger;
                  qryDet.FieldByName('IDRESPONSAVELATUAL').AsInteger := frmSelBem.qry.FieldByName('IDRESPONSAVEL').AsInteger;
                  qryDet.FieldByName('IDCLASSEBEM').AsInteger        := frmSelBem.qry.FieldByName('IDCLASSEBEM').AsInteger;
                  qryDet.Post;
                  //----------------------------------------------------------------------
                  InsertIdBem(frmSelBem.qry.FieldByName('IDBEM').AsInteger);
               end;
            end;
         end;
         //-------------------------------------------------------------------------------
         frmSelBem.qry.Next;
      end;
      qryDet.First;
      qryDet.EnableControls;
      sbtnAltDet.Enabled := not (frmSelBem.qry.IsEmpty);
      sbtnExcluiDet.Enabled := not (frmSelBem.qry.IsEmpty);
   end;
   //-------------------------------------------------------------------------------------
   frmSelBem.qry.Close;
   frmSelBem.qry.UnPrepare;
   frmSelBem.Release;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   bbtnGeraDet.Enabled := False;
   bbtnLimpar.Enabled := False;
   qryGrupo.Close;
   qryConjunto.Close;
end;
//========================================================================================
procedure TfrmMovSelTransf.bbtnLimparClick(Sender: TObject);
begin
   inherited;
   qryDet.DisableControls;
   qryDet.First;
   while not qryDet.EOF do
   begin
      qryDet.Delete;
   end;
   qryDet.EnableControls;
end;
//========================================================================================
function TfrmMovSelTransf.InsertIdBem(iIdBem : Integer) : boolean;
begin
   try
      SetLength(aIdBem,iaIdBem + 1);
      aIdBem[iaIdBem] := iIdBem;
      iaIdBem := iaIdBem + 1;
      Result := True;
   except
      Result := False;
   end;
end;
//========================================================================================
function TfrmMovSelTransf.DeleteIdBem(iIdBem : Integer) : boolean;
var
   iPos : Integer;
begin
   if FindIdBem(iIdBem,iPos) then
   begin
      aIdBem[iPos] := -1;
      Result := True;
   end else
   begin
      Result := False;
   end;
end;
//========================================================================================
function TfrmMovSelTransf.FindIdBem(iIdBem : Integer; Var iPos : Integer) : boolean;
begin
   try
      iPos := 0;
      while iPos <= (iaIdBem - 1) do
      begin
         if aIdBem[iPos] = iIdBem then
         begin
            Result := True;
            exit;
         end;
         iPos := iPos + 1;
      end;
      Result := False;
   except
      Result := False;
   end;
end;

end.

