unit fMovTransfBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, 
  Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, ComCtrls, DBCtrls, wwdbedit, Mask,
  TB97Ctls, CMTree, wwriched, Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmMovTransfBem = class(TfrmOkCancelar)
    qryPlaca: TwwQuery;
    qryPlacaIDBEM: TFloatField;
    qrySelBem: TwwQuery;
    qrySelConjunto: TwwQuery;
    MSConjunto: TMontaSelect;
    qryRateioN: TwwQuery;
    dsRateioN: TwwDataSource;
    qryRateioNCODCENTROCUSTO: TStringField;
    qryRateioNDESCCCUSTO: TStringField;
    qryRateioNPARTICIPACAO: TFloatField;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDCONJUNTO: TFloatField;
    qrySelBemPLACA: TFloatField;
    qrySelBemDESCCONJUNTO: TStringField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDESCLOCALIZACAO: TStringField;
    qrySelBemNOMERESPONSAVEL: TStringField;
    qrySelConjuntoDESCCONJUNTO: TStringField;
    qrySelConjuntoIDCONJUNTO: TFloatField;
    qrySelConjuntoIDLOCALIZACAO: TFloatField;
    qrySelConjuntoIDRESPONSAVEL: TFloatField;
    qrySelConjuntoDESCLOCALIZACAO: TStringField;
    qrySelConjuntoDESCRESPONSAVEL: TStringField;
    qrySelConjuntoIDPESSOA: TFloatField;
    pgctlTransf: TPageControl;
    TabSelBem: TTabSheet;
    TabBem: TTabSheet;
    pnlMestre: TPanel;
    Data: TLabel;
    Label22: TLabel;
    Label26: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label17: TLabel;
    edData: TCMDateTimePicker;
    spdPesquisa: TBitBtn;
    edPlaca: TEdit;
    pnlSelBens: TPanel;
    MSTermo: TMontaSelect;
    qrySelTermo: TwwQuery;
    qrySelTermoIDSELBAIXA: TFloatField;
    qrySelTermoSBXTERMO: TFloatField;
    qrySelTermoSBXPROCESSO: TStringField;
    qrySelTermoSBXDATA: TDateTimeField;
    qrySelTermoSBXNOMERESP: TStringField;
    qrySelTermoSBXFLGEXECUTADO: TFloatField;
    qrySelTermoSBXDTAEXECUTADO: TDateTimeField;
    dsSelTermo: TwwDataSource;
    updSelTermo: TUpdateSQL;
    Label8: TLabel;
    bbtnTermoTransf: TBitBtn;
    Label9: TLabel;
    edDataSel: TCMDateTimePicker;
    Label10: TLabel;
    Processo: TLabel;
    dbeSbxProcesso: TwwDBEdit;
    dsSelConjunto: TwwDataSource;
    dbeRespConj: TwwDBEdit;
    dbeConjunto: TwwDBEdit;
    dbeDescLocalizacao: TwwDBEdit;
    dbeNomeResp: TwwDBEdit;
    dbeDesBem: TDBMemo;
    dsSelBem: TwwDataSource;
    qrySelTermoSBTIPOMOV: TFloatField;
    Label11: TLabel;
    qryBensSelec: TwwQuery;
    qryBensSelecPLACA: TFloatField;
    qryBensSelecDESBEM: TStringField;
    qryBensSelecDESCCONJATUAL: TStringField;
    qryBensSelecNOMELOCAATUAL: TStringField;
    qryBensSelecNOMERESPATUAL: TStringField;
    qryBensSelecDESCGRUPATUAL: TStringField;
    qryBensSelecDESCCONJNOVO: TStringField;
    qryBensSelecNOMELOCANOVO: TStringField;
    qryBensSelecNOMERESPNOVO: TStringField;
    qryBensSelecDESCGRUPNOVO: TStringField;
    qryBensSelecIDSELBAIXA: TFloatField;
    qryBensSelecIDBEM: TFloatField;
    qryBensSelecIDPESSOA: TFloatField;
    qryBensSelecIDCONJUNTO: TFloatField;
    qryBensSelecIDGRUPO: TFloatField;
    dsBensSelec: TwwDataSource;
    dsGrupos: TwwDataSource;
    qryGrupos: TwwQuery;
    qryGruposIDGRUPO: TFloatField;
    qryGruposCLASSE: TStringField;
    qryGruposNOME: TStringField;
    qryGruposTIPO: TStringField;
    qryGruposSTATUS: TStringField;
    qryGruposDEPRECIACAO: TFloatField;
    qryGruposDATAULTDEP: TDateTimeField;
    qryGruposFLGIMOVEL: TFloatField;
    PnlDetalhe: TPanel;
    Label4: TLabel;
    pnlTree: TPanel;
    treeGrupos: TCMTreeView;
    pnlTransfConj: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    dbgRateioN: TwwDBGrid;
    Label3: TLabel;
    spdSelConjunto: TBitBtn;
    dbeTermo: TwwDBEdit;
    qryAux: TwwQuery;
    Label2: TLabel;
    dbeConjuntoNovo: TwwDBEdit;
    edGrupoNovo: TMaskEdit;
    dbeLocalNovo: TwwDBEdit;
    dbeRespNovo: TwwDBEdit;
    qryVerificaGrupo: TwwQuery;
    qryVerificaGrupoIDGRUPO: TFloatField;
    qryBuscaGrupo: TwwQuery;
    qryBuscaGrupoIDGRUPO: TFloatField;
    qrySelBemIDCLASSEBEM: TFloatField;
    qrySelBemIDGRUPO: TFloatField;
    sbtnGrupo: TBitBtn;
    dbgBalPatBem: TwwDBGrid;
    qrySelBemDESCGRUPO: TStringField;
    dbeDescGrupo: TwwDBEdit;
    qryBensSelecIDLOCALIZACAO: TFloatField;
    qrySelBemIDLOCALIZACAO: TFloatField;
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
    qryResp: TwwQuery;
    qryRespIDRESPONSAVEL: TFloatField;
    qryRespDESCRESPONSAVEL: TStringField;
    dsResp: TwwDataSource;
    MSResp: TMontaSelect;
    bbtnSelResp: TBitBtn;
    qrySelBemIDRESPONSAVEL: TFloatField;
    qryBensSelecIDRESPONSAVEL: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure spdPesquisaClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure spdSelConjuntoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnTermoTransfClick(Sender: TObject);
    procedure edDataSelExit(Sender: TObject);
    procedure sbtnGrupoClick(Sender: TObject);
    procedure treeGruposExit(Sender: TObject);
    procedure pgctlTransfChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure treeGruposDblClick(Sender: TObject);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iIdGrupoNovo,
    iSoma,ind                   : Integer;
    lNivel                      : Array [0..20] of Integer;
    sMascPict, sMascaraGrupoBem : String;
    bCorrompido, bMovimento     : Boolean;
    //------------------------------------------------------------------------------------
    procedure LimpaCampos;
    function  MascaraOK(sMascara : String; var sMascPict : String;
                              var lNivel  : Array of Integer;
                              var iSoma : Integer; var ind : Integer) : Boolean;
  end;

var
  frmMovTransfBem: TfrmMovTransfBem;

implementation

uses uAutorizacao, uSistema,  uAtivoFixo, uMensErro, uDataBase, dBaseDados,
     fAguarde, dAtivoFixo;

{$R *.DFM}

procedure TfrmMovTransfBem.FormCreate(Sender: TObject);
begin
   inherited;
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
         bbtnSelLocal.Enabled := False;
         bbtnSelResp.Enabled  := False;
      end else
      begin
         bbtnSelLocal.Enabled := True;
         bbtnSelResp.Enabled  := True;
      end;
   end;
   //-------------------------------------------------------------------------------------
   qrySelBem.Prepare;
   qryPlaca.Prepare;
   qrySelTermo.Prepare;
   qryBensSelec.Prepare;
   qrySelConjunto.Prepare;
   qryRateioN.Prepare;
   qryGrupos.Prepare;
   qryGrupos.Open;
   qryVerificaGrupo.Prepare;
   qryBuscaGrupo.Prepare;
   //-------------------------------------------------------------------------------------
   with qryAux do
   begin
      Close;
      Sql.Clear;
      Sql.Text := 'SELECT MASCARACLASSE,MASCCODGRUPO,IDPESSOA FROM PARAMETROSCAFMANUT '+
                  'WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);
      Open;
   end;
   //-------------------------------------------------------------------------------------
   sMascaraGrupoBem := qryAux.FieldByName('MASCCODGRUPO').AsString;
   sMascPict := '';
   if not MascaraOK(sMascaraGrupoBem,sMascPict,lNivel,iSoma,ind) then
   begin
      MessageBeep(0);
      ShowMessage('Máscara de Grupo Inválida');
      bbtnSairClick(Self);
      exit;
   end;
   //=====================================================================================
   bMovimento := False;
   treeGrupos.Mascara := sMascaraGrupoBem;
   treeGrupos.MontaArvore;
   pnlTransfConj.BringToFront;
   //-------------------------------------------------------------------------------------
   edData.Date := date();
   pgctlTransf.Height := 387;
   pgctlTransf.ActivePage := TabSelBem;
   Screen.Cursor := crDefault;
end;
//========================================================================================
function TfrmMovTransfBem.MascaraOK(sMascara : String; var sMascPict : String;
                                    var lNivel  : Array of Integer;
                                    var iSoma : Integer; var ind : Integer) : Boolean;
var
   i : Integer;

begin
   MascaraOK := True;
   lNivel[0] := 1;
   iSoma     := 0;
   sMascPict := copy(sMascara, 1, 1);
   //-------------------------------------------------------------------------------------
   for i := 1 to Length(sMascara) do
   begin
      if i > 1 then
         sMascPict := sMascPict + copy(sMascara,i,1);
      //----------------------------------------------------------------------------------
      if copy(sMascara, i, 1) = '.' then
      begin
         ind := ind + 1;
         lNivel[ind] := i - ind - iSoma;
         iSoma := iSoma + lNivel[ind];
      end;
   end;
   //-------------------------------------------------------------------------------------
   if (ind = 0) and (length(sMascara) > 0) then
   begin
      lNivel[1] := length(sMascara);
      ind := 1;
   end;
   //-------------------------------------------------------------------------------------
   if ind = 0 then
      MascaraOK := False;
   lNivel[ind + 1] := Length(sMascara) - ind - iSoma;
end;
//========================================================================================
procedure TfrmMovTransfBem.LimpaCampos;
begin
   pnlDetalhe.Enabled  := False;
   edPlaca.Text        := '';
   edGrupoNovo.Text    := '';
   qrySelBem.Close;
   qrySelTermo.Close;
   qryBensSelec.Close;
   //-------------------------------------------------------------------------------------
   qryLocal.Close;
   qryResp.Close;
   qrySelConjunto.Close;
   qryRateioN.Close;
end;
//========================================================================================
procedure TfrmMovTransfBem.edDataExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if (edData.Text = '') then
   begin
      MsgDlg('Preencha o campo Data','Erro',mtError,[mbOk],0);
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovTransfBem.edDataSelExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if (edDataSel.Text = '') then
   begin
      MsgDlg('Preencha o campo Data da Movimentação','Erro',mtError,[mbOk],0);
      edDataSel.SetFocus;
   end else
   begin
      bbtnTermoTransf.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovTransfBem.bbtnTermoTransfClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   MSTermo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSTermo.ValoresChave.Count > 0) and (MSTermo.ValoresChave[0] <> '') then
   begin
      qrySelTermo.Close;
      qrySelTermo.ParamByName('PIDSELBAIXA').AsInteger := StrToInt(MSTermo.ValoresChave[1]);
      qrySelTermo.Open;
      //----------------------------------------------------------------------------------
      qryBensSelec.Close;
      qryBensSelec.ParamByName('PIDSELBAIXA').AsInteger := StrToInt(MSTermo.ValoresChave[1]);
      qryBensSelec.Open;
      //----------------------------------------------------------------------------------
      if (qrySelTermoSBXFLGEXECUTADO.AsInteger = 1) then
      begin
         MsgDlg('Termo de Transferencia já executado em ' + qrySelTermoSBXDTAEXECUTADO.AsString,
                'Erro', mtError, [mbOk], 0);
         LimpaCampos;
         bbtnTermoTransf.SetFocus;
      end;
   end else
   begin
      LimpaCampos;
      bbtnTermoTransf.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovTransfBem.spdPesquisaClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      qrySelBem.Close;
      qrySelBem.ParamByName('PIDPESSOA').AsInteger := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[0]);
      qrySelBem.ParamByName('PIDBEM').AsInteger    := StrToInt(dtmAtivoFixo.MSBem.ValoresChave[1]);
      qrySelBem.Open;
      if qrySelBem.IsEmpty then
      begin
         MsgDlg('Bem já baixado!','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edData.SetFocus;
      end else
      begin
         edPlaca.Text := qrySelBemPLACA.AsString;
         //-------------------------------------------------------------------------------
         qrySelConjunto.Close;
         qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qrySelBemIDCONJUNTO.AsInteger;
         qrySelConjunto.Open;
         qryRateioN.Close;
         qryRateioN.ParamByName('PIDPESSOA').AsInteger   := qrySelConjuntoIDPESSOA.AsInteger;
         qryRateioN.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
         qryRateioN.Open;
         //-------------------------------------------------------------------------------
         qryLocal.Close;
         qryLocal.ParamByName('PIDLOCAL').AsInteger   := qrySelConjuntoIDLOCALIZACAO.AsInteger;
         qryLocal.ParamByName('PIDEMPRESA').AsInteger := qrySelConjuntoIDPESSOA.AsInteger;
         qryLocal.Open;
         //-------------------------------------------------------------------------------
         qryResp.Close;
         qryResp.ParamByName('PIDRESP').AsFloat := qrySelConjuntoIDRESPONSAVEL.AsFloat;
         qryResp.Open;
         //-------------------------------------------------------------------------------
         if qryGrupos.Locate('IDGRUPO',qrySelBemIDGRUPO.AsInteger,[]) then
            edGrupoNovo.Text := qryGruposNOME.AsString
         else
            edGrupoNovo.Text := '';
         //-------------------------------------------------------------------------------
         pnlDetalhe.Enabled  := True;
         spdSelConjunto.SetFocus;
      end;
   end else
   begin
      LimpaCampos;
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovTransfBem.edPlacaEnter(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMovTransfBem.edPlacaExit(Sender: TObject);
begin
   inherited;
   if (edPlaca.Text <> '') then
   begin
      qryPlaca.Close;
      qryPlaca.ParamByName('PPLACA').AsFloat := StrToFloat(edPlaca.Text);
      qryPlaca.Open;
      if (not qryPlaca.isEmpty) then
      begin
         qrySelBem.Close;
         qrySelBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelBem.ParamByName('PIDBEM').AsInteger    := qryPlacaIDBEM.AsInteger;
         qrySelBem.Open;
         //-------------------------------------------------------------------------------
         edPlaca.Text := qrySelBemPLACA.AsString;
         //-------------------------------------------------------------------------------
         qrySelConjunto.Close;
         qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qrySelBemIDCONJUNTO.AsInteger;
         qrySelConjunto.Open;
         qryRateioN.Close;
         qryRateioN.ParamByName('PIDPESSOA').AsInteger   := qrySelConjuntoIDPESSOA.AsInteger;
         qryRateioN.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
         qryRateioN.Open;
         qryLocal.Close;
         qryLocal.ParamByName('PIDLOCAL').AsInteger   := qrySelConjuntoIDLOCALIZACAO.AsInteger;
         qryLocal.ParamByName('PIDEMPRESA').AsInteger := qrySelConjuntoIDPESSOA.AsInteger;
         qryLocal.Open;
         //-------------------------------------------------------------------------------
         qryResp.Close;
         qryResp.ParamByName('PIDRESP').AsFloat := qrySelConjuntoIDRESPONSAVEL.AsFloat;
         qryResp.Open;
         //-------------------------------------------------------------------------------
         if qryGrupos.Locate('IDGRUPO',qrySelBemIDGRUPO.AsInteger,[]) then
            edGrupoNovo.Text := qryGruposNOME.AsString
         else
            edGrupoNovo.Text := '';
         //-------------------------------------------------------------------------------
         pnlDetalhe.Enabled  := True;
         spdSelConjunto.SetFocus;
      end else
      begin
         MsgDlg('Placa não cadastrada ou Bem Baixado!','Erro',mtError,[mbOk],0);
         LimpaCampos;
         edData.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovTransfBem.spdSelConjuntoClick(Sender: TObject);
begin
   inherited;
   MSConjunto.Executar;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := StrToInt(MSConjunto.ValoresChave[0]);
      qrySelConjunto.Open;
      qryRateioN.Close;
      qryRateioN.ParamByName('PIDPESSOA').AsInteger   := qrySelConjuntoIDPESSOA.AsInteger;
      qryRateioN.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
      qryRateioN.Open;
      //----------------------------------------------------------------------------------
      // Seleciona a localização atual do conjunto
      //----------------------------------------------------------------------------------
      qryLocal.Close;
      qryLocal.ParamByName('PIDLOCAL').AsInteger   := qrySelConjuntoIDLOCALIZACAO.AsInteger;
      qryLocal.ParamByName('PIDEMPRESA').AsInteger := qrySelConjuntoIDPESSOA.AsInteger;
      qryLocal.Open;
      //----------------------------------------------------------------------------------
      qryResp.Close;
      qryResp.ParamByName('PIDRESP').AsFloat := qrySelConjuntoIDRESPONSAVEL.AsFloat;
      qryResp.Open;
      //----------------------------------------------------------------------------------
      // Verificar se a mudança de conjunto irá acarretar uma mudança de grupo
      //----------------------------------------------------------------------------------
      qryVerificaGrupo.Close;
      qryVerificaGrupo.ParamByName('PIDGRUPO').AsInteger    := qryGruposIDGRUPO.AsInteger;
      qryVerificaGrupo.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
      qryVerificaGrupo.Open;
      if qryVerificaGrupo.IsEmpty then
      begin
         MsgDlg('Grupo atual inválido para o Conjunto/Localização/Centro de Custo selecionado. '+
                'Selecione o Grupo Correto','Erro',mtError,[mbOk],0);
         qryBuscaGrupo.Close;
         qryBuscaGrupo.ParamByName('PIDLOCAL').AsInteger  := qrySelConjuntoIDLOCALIZACAO.AsInteger;
         qryBuscaGrupo.ParamByName('PIDCLASSE').AsInteger := qrySelBemIDCLASSEBEM.AsInteger;
         qryBuscaGrupo.Open;
         if (not qryBuscaGrupo.IsEmpty) then
         begin
            if qryGrupos.Locate('IDGRUPO',qrySelBemIDGRUPO.AsInteger,[]) then
               edGrupoNovo.Text := qryGruposNOME.AsString
            else
               edGrupoNovo.Text := '';
         end;
      end;
      //----------------------------------------------------------------------------------
      sbtnGrupo.SetFocus;
   end else
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qrySelBemIDCONJUNTO.AsInteger;
      qrySelConjunto.Open;
      qryRateioN.Close;
      qryRateioN.ParamByName('PIDPESSOA').AsInteger   := qrySelConjuntoIDPESSOA.AsInteger;
      qryRateioN.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
      qryRateioN.Open;
      //----------------------------------------------------------------------------------
      // Seleciona a localização atual do conjunto
      //----------------------------------------------------------------------------------
      qryLocal.Close;
      qryLocal.ParamByName('PIDLOCAL').AsInteger   := qrySelConjuntoIDLOCALIZACAO.AsInteger;
      qryLocal.ParamByName('PIDEMPRESA').AsInteger := qrySelConjuntoIDPESSOA.AsInteger;
      qryLocal.Open;
      //----------------------------------------------------------------------------------
      qryResp.Close;
      qryResp.ParamByName('PIDRESP').AsFloat := qrySelConjuntoIDRESPONSAVEL.AsFloat;
      qryResp.Open;
   end;
   //-------------------------------------------------------------------------------------
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMovTransfBem.sbtnGrupoClick(Sender: TObject);
begin
   inherited;
   pnlTransfConj.SendToBack;
   treeGrupos.Visible := not treeGrupos.Visible;
   if treeGrupos.Visible then
      treeGrupos.SetFocus;
end;
//========================================================================================
procedure TfrmMovTransfBem.treeGruposDblClick(Sender: TObject);
begin
   inherited;
   if qryGrupos.FieldByName('TIPO').asString = 'A' then
      treeGrupos.Visible := False;
end;
//========================================================================================
procedure TfrmMovTransfBem.treeGruposExit(Sender: TObject);
begin
   inherited;
   treeGrupos.Visible := False;
   pnlTransfConj.BringToFront;
   //-------------------------------------------------------------------------------------
   // Verificar se a mudança de grupo irá acarretar uma mudança de conjunto
   //-------------------------------------------------------------------------------------
   qryVerificaGrupo.Close;
   qryVerificaGrupo.ParamByName('PIDGRUPO').AsInteger    := qryGruposIDGRUPO.AsInteger;
   qryVerificaGrupo.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
   qryVerificaGrupo.Open;
   if (qryVerificaGrupo.IsEmpty) then
   begin
      MsgDlg('Grupo atual inválido para o Conjunto/Localização/Centro de Custo selecionado. '+
             'Selecione o Novo Grupo ou/e Novo Conjunto!','Erro',mtError,[mbOk],0);
      iIdGrupoNovo := 0;
   end else
   begin
      iIdGrupoNovo     := qryGruposIDGRUPO.AsInteger;
      edGrupoNovo.Text := qryGruposNOME.AsString;
      bbtnConfirmar.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMovTransfBem.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   MSLocal.Executar;
   //-------------------------------------------------------------------------------------
   qryLocal.Close;
   if MSLocal.RetornouValor then
   begin
      qryLocal.ParamByName('PIDLOCAL').AsInteger   := StrToInt(MSLocal.ValoresChave[0]);
      qryLocal.ParamByName('PIDEMPRESA').AsInteger := StrToInt(MSLocal.ValoresChave[1]);
      qryLocal.Open;
      //----------------------------------------------------------------------------------
      qryResp.Close;
      qryResp.ParamByName('PIDRESP').AsFloat := qryLocalIDRESPONSAVEL.AsFloat;
      qryResp.Open;
      //----------------------------------------------------------------------------------
      // Verificar se a Localização do Conjunto foi alterada
      //----------------------------------------------------------------------------------
      if qrySelConjuntoIDLOCALIZACAO.AsInteger <> qryLocalIDLOCALIZACAO.AsInteger then
      begin
         if MsgDlg('Foi selecionada uma localização diferente da atualmente cadastrada para o '+
                   'Conjunto.'+#13+#13+'Se for realizar uma Transferência de Localização do Conjunto '+
                   'selecione SIM. Caso a sua opção seja a criação de um novo conjunto, selecione NÃO '+
                   'e cadastre o novo conjunto no Cadastro de Conjuntos.',
                   'Atenção',mtConfirmation,[mbYes,mbNo],0) = mrNo then
         begin
            qryLocal.Close;
            qryLocal.ParamByName('PIDLOCAL').AsInteger   := qrySelConjuntoIDLOCALIZACAO.AsInteger;
            qryLocal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
            qryLocal.Open;
            //----------------------------------------------------------------------------
            qryResp.Close;
            qryResp.ParamByName('PIDRESP').AsFloat := qrySelConjuntoIDRESPONSAVEL.AsFloat;
            qryResp.Open;
         end;
      end;
   end else
   begin
      qryLocal.ParamByName('PIDLOCAL').AsInteger   := qrySelConjunto.FieldByName('IDLOCALIZACAO').AsInteger;
      qryLocal.ParamByName('PIDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qryLocal.Open;
      //----------------------------------------------------------------------------------
      qryResp.Close;
      qryResp.ParamByName('PIDRESP').AsFloat := qrySelConjunto.FieldByName('IDRESPONSAVEL').AsFloat;
      qryResp.Open;
   end;
   //-------------------------------------------------------------------------------------
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMovTransfBem.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResp.Executar;
   //-------------------------------------------------------------------------------------
   qryResp.Close;
   if MSResp.RetornouValor then
   begin
      qryResp.ParamByName('PIDRESP').AsFloat := StrToFloat(MSResp.ValoresChave[0]);
      qryResp.Open;
   end else
   begin
      qryResp.ParamByName('PIDRESP').AsFloat := qrySelConjunto.FieldByName('IDRESPONSAVEL').AsFloat;
      qryResp.Open;
   end;
   //-------------------------------------------------------------------------------------
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMovTransfBem.bbtnConfirmarClick(Sender: TObject);
var
   iConjuntoNovo, iGrupoNovo, iLocalNovo, iRespNovo, iResult : Integer;
   fIdMovimTransfGrupo : Extended;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if pgctlTransf.ActivePage = TabBem then
   begin
      //----------------------------------------------------------------------------------
      // Criticas aos campos detalhe
      //----------------------------------------------------------------------------------
      if edData.Text = '' then
      begin
         MsgDlg('Data da Movimentação não pode estar vazia! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if edPlaca.Text = '' then
      begin
         MsgDlg('Selecione um bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if (qrySelBemIDCONJUNTO.AsInteger    = qrySelConjuntoIDCONJUNTO.AsInteger) and
         (qrySelBemIDGRUPO.AsInteger       = qryGruposIDGRUPO.AsInteger) and
         (qrySelBemIDLOCALIZACAO.AsInteger = qryLocalIDLOCALIZACAO.AsInteger) and
         (qrySelBemIDRESPONSAVEL.AsFloat   = qryRespIDRESPONSAVEL.AsFloat) then
      begin
         MsgDlg('Não foi feita a seleção do novo Conjunto/Grupo Contábil do Bem!',
                'Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if dbeConjuntoNovo.Text = '' then
      begin
         MsgDlg('Selecione o novo conjunto do bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if edGrupoNovo.Text = '' then
      begin
         MsgDlg('Selecione o novo Grupo do bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      iConjuntoNovo := qrySelConjunto.FieldByName('IDCONJUNTO').AsInteger;
      iLocalNovo    := qryLocal.FieldByName('IDLOCALIZACAO').AsInteger;
      iRespNovo     := qryResp.FieldByName('IDRESPONSAVEL').AsInteger;
      if (qrySelBem.FieldbyName('IDCONJUNTO').AsInteger <> iConjuntoNovo) and
         ((qrySelConjunto.FieldbyName('IDLOCALIZACAO').AsInteger <> iLocalNovo) or
          (qrySelConjunto.FieldbyName('IDRESPONSAVEL').AsInteger <> iRespNovo)) then
      begin
         MsgDlg('Não é possível transferir um bem de conjunto e localização/responsável no mesmo movimento!',
                'Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      iResult := AtivoFixo.ExecutaTransferencia(Sistema.IdModulo, Sistema.IdEmpresa,
                                                qrySelBem.FieldByName('IDBEM').asInteger,
                                                qryGrupos.FieldByName('IDGRUPO').AsInteger,
                                                iConjuntoNovo,
                                                iLocalNovo,
                                                iRespNovo,
                                                edData.Date,
                                                fIdMovimTransfGrupo,
                                                True);
      //----------------------------------------------------------------------------------
      if iResult >= 0 then
      begin
         MsgDlg('Movimentação Realizada!','Atenção',mtInformation,[mbOk],0);
      end else
      begin
         MsgDlg('Movimentação não Realizada!' + #13 + #13 +
                'Causa : ' + AtivoFixo.MensagemErro + #13 + #13 +
                ' na transferência do bem ' + qrySelBem.FieldByName('PLACA').AsString,
                'Erro', mtError, [mbOk], 0);
      end;
      //----------------------------------------------------------------------------------
      LimpaCampos;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
   end else
   begin
      if edDataSel.Text = '' then
      begin
         MsgDlg('Data da Movimentação não pode estar vazia! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlTransf.Enabled := True;
         edDataSel.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if dbeTermo.Text = '' then
      begin
         MsgDlg('Selecione um Termo de Seleção de Transferência! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlTransf.Enabled := True;
         bbtnTermoTransf.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      StartTransacao;
      try
         qryBensSelec.DisableControls;
         frmAguarde.Min := 0;
         frmAguarde.Max := qryBensSelec.RecordCount;
         frmAguarde.Mostra('Transferindo os Bens do Termo');
         //-------------------------------------------------------------------------------
         qryBensSelec.First;
         while not qryBensSelec.EOF do
         begin
            frmAguarde.Pos := frmAguarde.Pos + 1;
            frmAguarde.Caption := 'Processando Placa ' + qryBensSelec.FieldByName('PLACA').AsString +
                                  ' (' + inttostr(frmAguarde.Pos) + '/' + inttostr(frmAguarde.Max) + ')';
            frmAguarde.Mostra('Estornando Transferência de Bens do Termo');
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            iConjuntoNovo := qryBensSelec.FieldByName('IDCONJUNTO').AsInteger;
            iLocalNovo    := qryBensSelec.FieldByName('IDLOCALIZACAO').AsInteger;
            iRespNovo     := qryBensSelec.FieldByName('IDRESPONSAVEL').AsInteger;
            iGrupoNovo    := qryBensSelec.FieldByName('IDGRUPO').AsInteger;
            iResult       := AtivoFixo.ExecutaTransferencia(Sistema.IdModulo,
                                                            qryBensSelec.FieldByName('IDPESSOA').AsInteger,
                                                            qryBensSelec.FieldByName('IDBEM').AsInteger,
                                                            iGrupoNovo, iConjuntoNovo,
                                                            iLocalNovo, iRespNovo,
                                                            edDataSel.Date,
                                                            fIdMovimTransfGrupo,
                                                            True);
            //----------------------------------------------------------------------------
            if iResult < 0 then
               Raise Exception.Create(AtivoFixo.MensagemErro + #13 + ' na transferência do bem ' +
                                      qryBensSelec.FieldByName('PLACA').AsString);
            //----------------------------------------------------------------------------
            qryBensSelec.Next;
         end;
         //-------------------------------------------------------------------------------
         // Seta o Termo como Executado
         //-------------------------------------------------------------------------------
         qrySelTermo.Edit;
         qrySelTermoSBXFLGEXECUTADO.AsInteger  := 1;
         qrySelTermoSBXDTAEXECUTADO.AsDateTime := edDataSel.Date;
         qrySelTermo.Post;
         qrySelTermo.ApplyUpdates;
         //-------------------------------------------------------------------------------
         CommitTransacao;
         qryBensSelec.EnableControls;
         frmAguarde.Apaga;
         //-------------------------------------------------------------------------------
         MsgDlg('Movimentação Realizada!','Atenção',mtInformation,[mbOk],0);
         //-------------------------------------------------------------------------------
         LimpaCampos;
         pgctlTransf.Enabled    := True;
         pgctlTransf.ActivePage := TabSelBem;
         bbtnConfirmar.Enabled  := True;
         bbtnCancelar.Enabled   := True;
         bbtnTermoTransf.SetFocus;
      except
         on E : Exception do
         begin
            RollBackTransacao;
            qryBensSelec.EnableControls;
            frmAguarde.Apaga;
            //----------------------------------------------------------------------------
            MsgDlg('Movimentação não Realizada!' + #13 + #13 + 'Causa : ' + E.Message,
                   'Erro', mtError, [mbOk], 0);
            //----------------------------------------------------------------------------
            LimpaCampos;
            pgctlTransf.Enabled    := True;
            pgctlTransf.ActivePage := TabSelBem;
            bbtnConfirmar.Enabled    := True;
            bbtnCancelar.Enabled     := True;
            bbtnTermoTransf.SetFocus;
         end;
      end;
   end;
end;
//========================================================================================
procedure TfrmMovTransfBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelBem.Close;
   qryPlaca.Close;
   qrySelConjunto.Close;
   qryRateioN.Close;
   qrySelTermo.Close;
   qryBensSelec.Close;
   qryGrupos.Close;
   qryVerificaGrupo.Close;
   qryBuscaGrupo.Close;
   //-------------------------------------------------------------------------------------
   qrySelBem.UnPrepare;
   qryPlaca.UnPrepare;
   qrySelConjunto.UnPrepare;
   qryRateioN.UnPrepare;
   qrySelTermo.UnPrepare;
   qryBensSelec.UnPrepare;
   qryGrupos.UnPrepare;
   qryVerificaGrupo.UnPrepare;
   qryBuscaGrupo.UnPrepare;
end;
//========================================================================================
procedure TfrmMovTransfBem.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   pgctlTransf.Enabled    := True;
   pgctlTransf.ActivePage := TabSelBem;
   pgctlTransf.Height     := 387;
   bbtnConfirmar.Enabled  := True;
   bbtnTermoTransf.SetFocus;
end;
//========================================================================================
procedure TfrmMovTransfBem.FormKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if key = #13 then
   begin
      key := #0;
      Perform(Wm_NextDlgCtl, 0, 0);
   end;
end;
//========================================================================================
procedure TfrmMovTransfBem.pgctlTransfChanging(Sender: TObject; var AllowChange: Boolean);
begin
   inherited;
   if pgctlTransf.ActivePage = TabSelBem then
      pgctlTransf.Height := 205
   else
      pgctlTransf.Height := 387;
end;

end.

