//************************************************************************************************//
// Data      : 24/08/2005
// Código    : AL_1
// Descrição : Novos parametros (DFM),
//             Criação de orelha "fantasma", só para usuário .CM  (PAS)
//************************************************************************************************//
unit fParamCota;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   fCadastroMTCotas, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
   uSistema, Provider, DBTables, Wwquery, wwdblook, dBaseDados, uMidasUtil,
   ComCtrls, uCtrlParamCota, Mask, wwdbedit, DBCtrls,
   wwdbdatetimepicker, CMDateTimePicker, uCMTypes, Pessoa, uMensErro, uValidaDoc,
   CMDBLookupCombo, TREdit;


type
   TfrmParamCota = class(TFrmCadastroMTCotas)
      Label4: TLabel;
      Label7: TLabel;
      wwQuery1: TwwQuery;
      DataSetProvider1: TDataSetProvider;
      PageControl1: TPageControl;
      pagGlobais: TTabSheet;
      dbEdtMascTipoOper: TwwDBEdit;
      Label3: TLabel;
      chkIntegraContabil: TDBCheckBox;
      pagInformacoes: TTabSheet;
      pagResponsaveis: TTabSheet;
      Label1: TLabel;
      Label6: TLabel;
      Label8: TLabel;
      BitBtn3: TBitBtn;
      Label2: TLabel;
      Label5: TLabel;
      BitBtn1: TBitBtn;
      BitBtn2: TBitBtn;
      Bevel1: TBevel;
      Bevel2: TBevel;
      Label9: TLabel;
      Bevel3: TBevel;
      Label10: TLabel;
      BitBtn4: TBitBtn;
      BitBtn5: TBitBtn;
      Bevel4: TBevel;
      Label11: TLabel;
      BitBtn6: TBitBtn;
      BitBtn7: TBitBtn;
      DBEdit1: TDBEdit;
      DBEdit2: TDBEdit;
      DBEdit3: TDBEdit;
      DBEdit4: TDBEdit;
      DBEdit5: TDBEdit;
      DBEdit6: TDBEdit;
      DBEdit7: TDBEdit;
      MSPF: TMontaSelect;
      MSPJ: TMontaSelect;
      BitBtn8: TBitBtn;
      DBEdit9: TDBEdit;
      Label12: TLabel;
      Label13: TLabel;
      Bevel5: TBevel;
      Label14: TLabel;
      Bevel6: TBevel;
      DBEdit10: TDBEdit;
      BitBtn10: TBitBtn;
      BitBtn12: TBitBtn;
      DBEdit13: TDBEdit;
      Label17: TLabel;
      Bevel7: TBevel;
      Bevel8: TBevel;
      BitBtn14: TBitBtn;
      DBEdit14: TDBEdit;
      Label18: TLabel;
      CMDateTimePicker1: TCMDateTimePicker;
      Label19: TLabel;
      CMDateTimePicker2: TCMDateTimePicker;
      Label15: TLabel;
      CMDateTimePicker3: TCMDateTimePicker;
      CMDateTimePicker4: TCMDateTimePicker;
      Label16: TLabel;
      Label20: TLabel;
      CMDateTimePicker5: TCMDateTimePicker;
      CMDateTimePicker6: TCMDateTimePicker;
      Label21: TLabel;
      Label22: TLabel;
      wwDBEdit1: TwwDBEdit;
      ValidaPF: TCMValidaDoc;
      ValidaPJ: TCMValidaDoc;
    tbsDatasFech: TTabSheet;
      Label23: TLabel;
      Label24: TLabel;
      Label25: TLabel;
      Label26: TLabel;
      Label27: TLabel;
      Label28: TLabel;
      Label29: TLabel;
      Label30: TLabel;
      Label31: TLabel;
      Label32: TLabel;
      edtDataPrimManual: TCMDateTimePicker;
      Label33: TLabel;
      Label34: TLabel;
      Label35: TLabel;
      Bevel9: TBevel;
      Bevel10: TBevel;
      Bevel11: TBevel;
      Bevel13: TBevel;
      Bevel14: TBevel;
      edtDataPrimEP: TCMDateTimePicker;
      Bevel15: TBevel;
      edtDataPrimImob: TCMDateTimePicker;
      edtDataPrimRF: TCMDateTimePicker;
      edtDataPrimRV: TCMDateTimePicker;
      edtDataPrimBMF: TCMDateTimePicker;
      edtDataPrimFundoRF: TCMDateTimePicker;
      edtDataPrimFundoRV: TCMDateTimePicker;
      edtDataPrimFundoImob: TCMDateTimePicker;
      edtDataPrimFundoDIC: TCMDateTimePicker;
      Bevel16: TBevel;
      Bevel17: TBevel;
      Bevel18: TBevel;
      Bevel19: TBevel;
      Bevel20: TBevel;
      Bevel21: TBevel;
      Bevel22: TBevel;
      edtDataFechaManual: TCMDateTimePicker;
      edtDataFechaEP: TCMDateTimePicker;
      edtDataFechaImob: TCMDateTimePicker;
      edtDataFechaRF: TCMDateTimePicker;
      edtDataFechaRV: TCMDateTimePicker;
      edtDataFechaBMF: TCMDateTimePicker;
      edtDataFechaFundoRF: TCMDateTimePicker;
      edtDataFechaFundoRV: TCMDateTimePicker;
      edtDataFechaFundoImob: TCMDateTimePicker;
      edtDataFechaFundoDIC: TCMDateTimePicker;
      edtDataAbreManual: TCMDateTimePicker;
      edtDataAbreEP: TCMDateTimePicker;
      edtDataAbreImob: TCMDateTimePicker;
      edtDataAbreRF: TCMDateTimePicker;
      edtDataAbreRV: TCMDateTimePicker;
      edtDataAbreFundoRF: TCMDateTimePicker;
      edtDataAbreFundoRV: TCMDateTimePicker;
      edtDataAbreFundoImob: TCMDateTimePicker;
      edtDataAbreFundoDIC: TCMDateTimePicker;
      Bevel12: TBevel;
      edtDataAbreBMF: TCMDateTimePicker;
      DBRadioGroup1: TDBRadioGroup;
    pgRegra: TTabSheet;
    Bevel23: TBevel;
    Label36: TLabel;
    Label37: TLabel;
    tbsRegraIndicador: TTabSheet;
    cboGrupo: TCMDBLookupCombo;
    Label38: TLabel;
    cboTipo: TCMDBLookupCombo;
    Label39: TLabel;
    CdsGrupoRegra: TCMClientDataSet;
    CdsTipoRegra: TCMClientDataSet;
    CdsGrupoRegraIDGRUPOREGRA: TFloatField;
    CdsGrupoRegraDESCRICAO: TStringField;
    CdsTipoRegraDESCREGRA: TStringField;
    CdsTipoRegraIDTIPOREG: TFloatField;
    tbsDiversos: TTabSheet;
    dtpDTPrimeira: TCMDateTimePicker;
    Label40: TLabel;
    dbrVlrPrimeira: TDBRealEdit;
    Label41: TLabel;
    dbcDiasUteis: TDBCheckBox;
    dbcCotDataAnt: TDBCheckBox;

      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroAfterConfirma(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure BitBtn3Click(Sender: TObject);
      procedure BitBtn1Click(Sender: TObject);
      procedure BitBtn4Click(Sender: TObject);
      procedure BitBtn7Click(Sender: TObject);
      procedure BitBtn2Click(Sender: TObject);
      procedure BitBtn5Click(Sender: TObject);
      procedure BitBtn6Click(Sender: TObject);
      procedure BitBtn8Click(Sender: TObject);
      procedure BitBtn10Click(Sender: TObject);
      procedure BitBtn12Click(Sender: TObject);
      procedure BitBtn14Click(Sender: TObject);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure cboTipoEnter(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);

   private  // Private declarations

      CtrlParamCota: TCtrlParamCota;

      function  VerificaCPF: boolean;
      procedure MensErroMT(sMsgInfo: string);


   public   // Public declarations

   end;



var
  frmParamCota: TfrmParamCota;



implementation
{$R *.DFM}



procedure TfrmParamCota.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlParamCota := TCtrlParamCota.Create;
   CtrlParamCota.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                             MensErroMT);
   CtrlParamCota.CdsParamCota := Cds;

   CdsGrupoRegra.Data := CtrlParamCota.ListaGrupoRegra;
   CdsTipoRegra.Data  := CtrlParamCota.ListaTipoRegra;

   dbEdtMascTipoOper.Enabled := not ( CtrlParamCota.ExisteCotaTipoOper );

   PageControl1.ActivePageIndex := 0;
end;



procedure TfrmParamCota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   FreeAndNil(CtrlParamCota);
end;



procedure TfrmParamCota.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := CtrlParamCota.GravaParamCota;
end;



procedure TfrmParamCota.CmeCadastroAfterConfirma(Sender: TObject);
begin
   inherited;
   Cds.Data := CtrlParamCota.ListaParamCota(Sistema.IdEmpresa);

end;



procedure TfrmParamCota.FormShow(Sender: TObject);
begin
   inherited;

   Cds.Data := CtrlParamCota.ListaParamCota(Sistema.IdEmpresa);

   // primeira vez que entrar na tela
   if Cds.IsEmpty then
   begin
      Cds.Insert;
      Cds.FieldByName('IDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
      Cds.Post;

      if CtrlParamCota.GravaParamCota then
         Cds.Data := CtrlParamCota.ListaParamCota(Sistema.IdEmpresa);
   end;

   sbtnAlterar.Enabled := True;
end;



procedure TfrmParamCota.BitBtn3Click(Sender: TObject);
begin
  inherited;

   MSPF.Executar;
   if MSPF.RetornouValor then
   begin
      if VerificaCPF then
      begin
//         CdsIDPFRISCO.AsInteger := StrToInt (MSPF.ValoresChave[0]);
//         CdsPFR.AsString := MSPF.ValoresChave[1];
      end;
   end;
end;



procedure TfrmParamCota.BitBtn1Click(Sender: TObject);
begin
   inherited;

   MSPF.Executar;
   if MSPF.RetornouValor then
   begin
      if VerificaCPF then
      begin
//         CdsIDPFCONSOLID.AsInteger := StrToInt (MSPF.ValoresChave[0]);
//         CdsPFC.AsString := MSPF.ValoresChave[1];
      end;
   end;
end;



procedure TfrmParamCota.BitBtn4Click(Sender: TObject);
begin
  inherited;

   MSPF.Executar;
   if MSPF.RetornouValor then
   begin
      if VerificaCPF then
      begin
//         CdsIDPFAUDITORIA.AsInteger := StrToInt (MSPF.ValoresChave[0]);
//         CdsPFA.AsString := MSPF.ValoresChave[1];
      end;
   end;
end;



procedure TfrmParamCota.BitBtn7Click(Sender: TObject);
begin
   inherited;

   MSPJ.Executar;
   if MSPJ.RetornouValor then
   begin
      ValidaPJ.NumDocumento := MSPJ.ValoresChave[2];
      if ValidaPJ.DocumentoValido then
      begin
//         CdsIDPJRISCO.AsInteger := StrToInt (MSPJ.ValoresChave[0]);
//         CdsPJR.AsString := MSPJ.ValoresChave[1];
      end;
   end;
end;



procedure TfrmParamCota.BitBtn2Click(Sender: TObject);
begin
   inherited;

   MSPJ.Executar;
   if MSPJ.RetornouValor then
   begin
      ValidaPJ.NumDocumento := MSPJ.ValoresChave[2];
      if ValidaPJ.DocumentoValido then
      begin
//         CdsIDPJCONSOLID.AsInteger := StrToInt (MSPJ.ValoresChave[0]);
//         CdsPJC.AsString := MSPJ.ValoresChave[1];
      end;
   end;
end;



procedure TfrmParamCota.BitBtn5Click(Sender: TObject);
begin
   inherited;

   MSPJ.Executar;
   if MSPJ.RetornouValor then
   begin
      ValidaPJ.NumDocumento := MSPJ.ValoresChave[2];
      if ValidaPJ.DocumentoValido then
      begin
//         CdsIDPJAUDITORIA.AsInteger := StrToInt (MSPJ.ValoresChave[0]);
//         CdsPJA.AsString := MSPJ.ValoresChave[1];
      end;
   end;
end;



procedure TfrmParamCota.BitBtn6Click(Sender: TObject);
begin
   inherited;

   MSPJ.Executar;
   if MSPJ.RetornouValor then
   begin
      ValidaPJ.NumDocumento := MSPJ.ValoresChave[2];
      if ValidaPJ.DocumentoValido then
      begin
//         CdsIDCUSTODIANTE.AsInteger := StrToInt (MSPJ.ValoresChave[0]);
//         CdsPCU.AsString := MSPJ.ValoresChave[1];
      end;
   end;
end;



procedure TfrmParamCota.BitBtn8Click(Sender: TObject);
begin
   inherited;
   MSPF.Executar;
   if MSPF.RetornouValor then
   begin
      if VerificaCPF then
      begin
//         CdsIDPRESIDENTE.AsInteger := StrToInt (MSPF.ValoresChave[0]);
//         CdsPRE.AsString := MSPF.ValoresChave[1];
      end;
   end;
end;



procedure TfrmParamCota.BitBtn10Click(Sender: TObject);
begin
   inherited;

   MSPF.Executar;
   if MSPF.RetornouValor then
   begin
      if VerificaCPF then
      begin
//         CdsIDDIRFINANCEIRO.AsInteger := StrToInt (MSPF.ValoresChave[0]);
//         CdsDIR.AsString := MSPF.ValoresChave[1];
      end;
   end;
end;



procedure TfrmParamCota.BitBtn12Click(Sender: TObject);
begin
   inherited;

   MSPF.Executar;
   if MSPF.RetornouValor then
   begin
      if VerificaCPF then
      begin
//         CdsIDADMINRESPON.AsInteger := StrToInt (MSPF.ValoresChave[0]);
//         CdsADM.AsString := MSPF.ValoresChave[1];
      end;
   end;
end;



procedure TfrmParamCota.BitBtn14Click(Sender: TObject);
begin
  inherited;

   MSPF.Executar;
   if MSPF.RetornouValor then
   begin
      if VerificaCPF then
      begin
//         CdsIDRESPONINF.AsInteger := StrToInt (MSPF.ValoresChave[0]);
//         CdsRIN.AsString := MSPF.ValoresChave[1];
      end;
   end;
end;



procedure TfrmParamCota.CmeCadastroAtualizaBotoes(Sender: TObject);
var
   i: integer;
begin
   inherited;

   pnlFundo.Enabled := true;

   if CmeCadastro.Operacao in [opInserir, opAlterar] then
   begin
      for i:= 0 to PageControl1.PageCount - 1 do PageControl1.Pages[i].Enabled := true;
   end
   else
   begin
      for i:= 0 to PageControl1.PageCount - 1 do PageControl1.Pages[i].Enabled := false;
   end;
end;



function TfrmParamCota.VerificaCPF: boolean;
var
   vCpf: string;
begin
   vCpf := MSPF.ValoresChave[2];

   if vCpf = '00000000000' then vCpf := 'erro' else
   if vCpf = '11111111111' then vCpf := 'erro' else
   if vCpf = '22222222222' then vCpf := 'erro' else
   if vCpf = '33333333333' then vCpf := 'erro' else
   if vCpf = '44444444444' then vCpf := 'erro' else
   if vCpf = '55555555555' then vCpf := 'erro' else
   if vCpf = '66666666666' then vCpf := 'erro' else
   if vCpf = '77777777777' then vCpf := 'erro' else
   if vCpf = '88888888888' then vCpf := 'erro' else
   if vCpf = '99999999999' then vCpf := 'erro';

   ValidaPF.NumDocumento := vCpf;

   Result := ValidaPF.DocumentoValido;
end;



procedure TfrmParamCota.cboTipoEnter(Sender: TObject);
begin
  inherited;
  if cboGrupo.Text <> '' then
     CdsTipoRegra.Data := CtrlParamCota.ListaTipoRegra(CdsGrupoRegraIDGRUPOREGRA.AsInteger)
  else
     CdsTipoRegra.Data := CtrlParamCota.ListaTipoRegra;
end;



procedure TfrmParamCota.MensErroMT(sMsgInfo: string);
begin
 //forma a mensagem de erro
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;

procedure TfrmParamCota.sbtnAlterarClick(Sender: TObject);
begin
  // AL_1
  if Pos('.CM', Sistema.NomeUsuario) > 0 then
     tbsDiversos.TabVisible := True;
  inherited;
end;

procedure TfrmParamCota.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  // AL_1
  tbsDiversos.TabVisible := False;
end;

procedure TfrmParamCota.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  // AL_1
  tbsDiversos.TabVisible := False;
end;

end.
