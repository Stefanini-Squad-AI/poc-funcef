// Alterações:
{ --------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Autor(a)    : Douglas.Siqueira
// Pendência   : SOL 174224 Kintana 1571553
// Data        : 15/02/2012
// Descricao   : Desbloqueio da Atividade/Projeto para selecionar outro padrão.
//-------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
}
{ --------------------------------------------------------------------------------------------------
Data      : 30.03.2007
Pendencia : 24190
Descrição : Adicionei um parâmetro (no .dfm) de crítica relacionado com o grupo de acesso.
---------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 13/01/2005
Pendencia : 18474
Descrição : Inserir o campo DTSEGREGAVIRTUAL
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 19/05/2004
Pendencia : 16814
Descrição : preenchi a propriedade lookupTable do combo cmbPatro da pasta previdência.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 10/12/2003
Pendencia : 15773
Descrição : criação do parâmetro FLGSEGREGAVIRTUAL

Data      : 18/10/2004
Descrição : Criação dos parâmetros
            IDPLANOPREVADM   => Plano de Operações Administrativas
            FLGSEGREGAORCOMU => Segrega o plano de operações Comuns na origem
            FLGSEGREGAORADM  => Segrega o plano de operações Administrativas na origem
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/12/2003
Pendencia : 14891
Descrição : criação do parâmetro FLGCGCAGENCIA
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 28/10/2003
Pendencia : 15453
Descrição : Gravação dos Planos (vigentes) de Centros de Responsabilidade e Custo
---------------------------------------------------------------------------------------------------}

unit fParamGlobalMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
   Wwdbspin, CMDBLookupCombo, Mask, wwdbedit, DBCtrls, wwdblook, ComCtrls,
   uModulo, uCripto, uCtrlParamGlobal, uCtrlTipoDocPessoa, uCtrlSeguranca,
   uCtrlMoeda, uCtrlCentroCusto, uCtrlCentRespon, uCtrlUnidNegocio,
  wwdbdatetimepicker, CMDateTimePicker, BfDialogs, BrowseFolder,
  uProcuraDir,CmDock, fcTreeView,Registry,fParamSysPadrao;


type
   TfrmParamGlobal = class(TFrmCadastroMT)
      PageGlobal: TPageControl;
      TbsGeral: TTabSheet;
      lblMoedaCorrente: TLabel;
      grpIntegracao: TGroupBox;
      sbtnSim: TSpeedButton;
      sbtnNao: TSpeedButton;
      CkbCriaAgencia: TDBCheckBox;
      DBCbMaiuscula: TDBCheckBox;
      DBCbPesquisa: TDBCheckBox;
      CkbObrigaDocPessoa: TDBCheckBox;
      DBCbDuplicidade: TDBCheckBox;
      dblkcmbMoeda: TwwDBLookupCombo;
      DBCbModuloCadastro: TDBCheckBox;
      TbsMascara: TTabSheet;
      Label6: TLabel;
      Label5: TLabel;
      GbAtividadeProjeto: TGroupBox;
      Label4: TLabel;
      dbedMascaraAP: TwwDBEdit;
      DBCbObrigaAtividade: TDBCheckBox;
      DbEdMascAgencia: TwwDBEdit;
      DbEdMascCliente: TwwDBEdit;
      TbsPrevidencia: TTabSheet;
      Label11: TLabel;
      Label12: TLabel;
      CmbPlano: TCMDBLookupCombo;
      CmbPatro: TCMDBLookupCombo;
      TbsSenha: TTabSheet;
      CdsSeguranca: TCMClientDataSet;
      CdsAux: TCMClientDataSet;
      CdsMoeda: TCMClientDataSet;
      CdsTipoDocPF: TCMClientDataSet;
      CdsTipoDocPJ: TCMClientDataSet;
      CdsPlanoPrev: TCMClientDataSet;
      DsSeguranca: TwwDataSource;
      DBCbPartidaDobrada: TDBCheckBox;
      TbsDocumento: TTabSheet;
      GbDocumentos: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      dblkPesJuridica: TwwDBLookupCombo;
      dblkPesFisica: TwwDBLookupCombo;
      GbInscricao: TGroupBox;
      Label10: TLabel;
      Label16: TLabel;
      DbLcbInscrMun: TwwDBLookupCombo;
      DbLcbInscrEst: TwwDBLookupCombo;
      GbObrigatorio: TGroupBox;
      DbCkbLetras: TDBCheckBox;
      DbCkbNumeros: TDBCheckBox;
      GbAlteraSuper: TGroupBox;
      Label14: TLabel;
      Label15: TLabel;
      DbCkbSuper: TDBCheckBox;
      EdSenhaSuper: TEdit;
      EdSenhaSuper2: TEdit;
      DbCkbSubContaClie: TDBCheckBox;
      DbCkbSubContaForn: TDBCheckBox;
      GbPadroes: TGroupBox;
      DbLcbAtivProjPadrao: TwwDBLookupCombo;
      Label18: TLabel;
      CdsAtivProj: TCMClientDataSet;
      DbLcbCentResponPadrao: TwwDBLookupCombo;
      Label19: TLabel;
      CdsCentRespon: TCMClientDataSet;
      tbsPlanos: TTabSheet;
      Label20: TLabel;
      dbedMascaraCR: TwwDBEdit;
      Label3: TLabel;
      DBCbObrigaCentroRespon: TDBCheckBox;
      Label22: TLabel;
      Label7: TLabel;
      dbedMascaraCC: TwwDBEdit;
      DBCbObrigaCentroCusto: TDBCheckBox;
      DBCbNomeSenha: TDBCheckBox;
      Label8: TLabel;
      DbSeTamMinimo: TwwDBSpinEdit;
      DbSeHisorico: TwwDBSpinEdit;
      Label9: TLabel;
      GroupBox1: TGroupBox;
      DbCkbRepete: TDBCheckBox;
      DbSelDias: TwwDBSpinEdit;
      Label17: TLabel;
      Label21: TLabel;
      Label23: TLabel;
      DbSelTempo: TwwDBSpinEdit;
      Label13: TLabel;
      DBcboPlanCentRespon: TwwDBLookupCombo;
      DBcboPlanCentCust: TwwDBLookupCombo;
      DBCheckBox1: TDBCheckBox;
      GroupBox2: TGroupBox;
      chkSegregaVirtual: TDBCheckBox;
      Label24: TLabel;
      CdsPatroPrev: TCMClientDataSet;
      dbchkSegregaComumOri: TDBCheckBox;
      Bevel1: TBevel;
      Label25: TLabel;
      CMDBLookupCombo1: TCMDBLookupCombo;
      dbchkSegregaAdminOri: TDBCheckBox;
      CdsPlanoPrevAdm: TCMClientDataSet;
      edtDataInicial: TCMDateTimePicker;
      Label26: TLabel;
      DBCheckBox2: TDBCheckBox;
      dbchkApenasFinComum: TDBCheckBox;
      dbchkApenasFinAdmin: TDBCheckBox;
      dbckCritica: TDBCheckBox;
    EdtVersao: TEdit;
    BtnFolder: TSpeedButton;
    Label27: TLabel;
    DlgDir: TProcuraDirDlg;

      procedure HabilitaPaginas(bStatus: Boolean);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure dbedMascaraCCKeyPress(Sender: TObject; var Key: Char);
      procedure dbedMascaraCCExit(Sender: TObject);
      procedure DbEdMascAgenciaKeyPress(Sender: TObject; var Key: Char);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure DbSelTempoAfterUpClick(Sender: TObject);
      procedure DbSelTempoAfterDownClick(Sender: TObject);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroAfterConfirma(Sender: TObject);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure CdsBeforePost(DataSet: TDataSet);
      procedure DBcboPlanCentResponCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure DBcboPlanCentCustCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure chkSegregaVirtualClick(Sender: TObject);
      procedure dbchkSegregaComumOriClick(Sender: TObject);
      procedure dbchkSegregaAdminOriClick(Sender: TObject);
    procedure BtnFolderClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);


   private  // Private declarations

      procedure mensagem(msg: String);


   public   // Public declarations

      Modulo         : TModulo;
      TipoDoc        : TCtrlTipoDocPessoa;
      CentroCusto    : TCtrlCentroCusto;
      CentroRespon   : TCtrlCentRespon;
      UnidNegocio    : TCtrlUnidNegocio;
      Moeda          : TCtrlMoeda;
      Seguranca      : TCtrlSeguranca;
      ParamGlobal    : TCtrlParamGlobal;

   end;



var
  frmParamGlobal: TfrmParamGlobal;
     FrmParamSysPadrao: TFrmParamSysPadrao;


implementation
{$R *.DFM}
uses
   uMensErro, dBasedados, uSistema, uMidasUtil, uAutorizacao, dGlobal, uCMTypes, uCmRegister;




procedure TfrmParamGlobal.HabilitaPaginas(bStatus: Boolean);
var
   i: Integer;
begin
   for i := 0 To PageGlobal.PageCount - 1 do PageGlobal.Pages[i].Enabled := bStatus;
end;



procedure TfrmParamGlobal.FormCreate(Sender: TObject);
var
   sSql: String;
begin
   inherited;
   EdtVersao.Text := Sistema.DirVersao;
   TbsPrevidencia.TabVisible := Sistema.UsaPlanoPatro;
   PageGlobal.ActivePage     := TbsGeral;

   Modulo         := TModulo.Create;
   ParamGlobal    := TCtrlParamGlobal.Create;
   Seguranca      := TCtrlSeguranca.Create;
   CentroCusto    := TCtrlCentroCusto.Create;
   CentroRespon   := TCtrlCentRespon.Create;
   UnidNegocio    := TCtrlUnidNegocio.Create;
   Moeda          := TCtrlMoeda.Create;
   TipoDoc        := TCtrlTipoDocPessoa.Create;

   ParamGlobal.Initialize(DtmBaseDados.dbBaseDados,
                          True,
                          Sistema.ConnectionType,
                          Sistema.ConnectionSide,
                          Sistema.AppRemoteServer,
                          True,
                          Mensagem);

   Seguranca.InitializeAs(ParamGlobal);
   CentroCusto.InitializeAs(ParamGlobal);
   CentroRespon.InitializeAs(ParamGlobal);
   UnidNegocio.InitializeAs(ParamGlobal);
   Moeda.InitializeAs(ParamGlobal);
   TipoDoc.InitializeAs(ParamGlobal);

   ParamGlobal.cds   := Cds;
   Seguranca.cds     := CdsSeguranca;

   CdsMoeda.Data     := Moeda.ListaMoeda(0,False,True,'',0);

   CdsTipoDocPF.Data := TipoDoc.ListaTipoDocPessoa(0, 'F'{ivlm});
   CdsTipoDocPJ.Data := TipoDoc.ListaTipoDocPessoa(0, 'J'{ivlm});
   CdsPatroPrev.Data := ParamGlobal.ListaPatro();
   CdsPlanoPrev.Data := ParamGlobal.ListaPlanoPrevContabil();
   // 18/10/04 15773
   CdsPlanoPrevAdm.Data := ParamGlobal.ListaPlanoPrevContabil();
   cds.Data          := ParamGlobal.ListaParamGlobal(Sistema.IdEmpresa);
   CdsSeguranca.Data := Seguranca.ListaSeguranca();

   if not(cds.IsEmpty) then
   begin
      sbtnSim.Down := (cds.FieldByName('FLGINTEGRAORC'{ivlm}).AsString = 'S'{ivlm});
      sbtnNao.Down := ((cds.FieldByName('FLGINTEGRAORC'{ivlm}).AsString = 'N'{ivlm}) or (cds.FieldByName('FLGINTEGRAORC'{ivlm}).IsNull));
   end;

   CdsAtivProj.Data      := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);
   dbedMascaraAP.Enabled := (CdsAtivProj.IsEmpty);
//   DbLcbAtivProjPadrao.Enabled := (not(CdsAtivProj.IsEmpty) and Cds.FieldByName('UnidNegoc').IsNull); Douglas.siqueira SOL 174224 Kintana 1571553

   sSql := 'SELECT CODCENTRORESPON, NOME ' +
             'FROM CENTRESPON ' +
            'WHERE IDPESSOA = ' + FloatToStr(Sistema.IdEmpresa) +
            ' ORDER BY NOME';

   CdsCentRespon.Data    := CentroRespon.GetDataPacket(sSql);
   dbedMascaraCR.Enabled := (CdsCentRespon.IsEmpty);
   DbLcbCentResponPadrao.Enabled := (not(CdsCentRespon.IsEmpty) and Cds.FieldByName('CodCentroRespon').IsNull);

   CdsAux.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa);
   dbedMascaraCC.Enabled := (cdsAux.IsEmpty);
   CdsAux.Close;


end;



procedure TfrmParamGlobal.FormShow(Sender: TObject);
begin
   inherited;
   AutorizarForm(afSoDesabilitar);

   dtmGlobal.sqlPlanCentCust.Open;
   dtmGlobal.sqlPlanCentRespon.Open;
end;



procedure TfrmParamGlobal.dbedMascaraCCKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if (key = '.'{ivlm}) and (Copy((Sender as TwwDbEdit).Text, Length((Sender as TwwDbEdit).Text), 1) = '.'{ivlm}) then
   begin
      MessageBeep(0);
      ShowMessage(Translate('Caracter Inválido'));
      Repaint;
      key := #0;
   end
   else
   if (key <> '9'{ivlm}) and (key <> '.'{ivlm}) and (key <> '-'{ivlm}) and (key <> #8) then
   begin
      MessageBeep(0);
      ShowMessage(Translate('Caracter Inválido'));
      Repaint;
      key := #0;
   end
   else
   if (key <> '9'{ivlm}) and (Length((Sender as TwwDbEdit).Text) = 0) then
   begin
      MessageBeep(0);
      ShowMessage(Translate('Caracter Inválido'));
      Repaint;
      key := #0;
   end;
end;



procedure TfrmParamGlobal.dbedMascaraCCExit(Sender: TObject);
var
   x, iNum9: Integer;
   sAux: String;
begin
   inherited;

   sAux  := dbedMascaraCC.Text;
   iNum9 := 0;

   for x := 1 To Length(sAux) do
       if sAux[x] = '9'{ivlm} then
          Inc(iNum9);

   if iNum9 > 10 then
    begin
      MsgDlg('O Número de dígitos da Mascara de Centro de Custo excedeu o limite máximo de 10 Dígitos.',
              'Atenção', mtError, [mbOk], 0);

      if dbedMascaraCC.CanFocus then
         dbedMascaraCC.SetFocus;
   end;
end;



procedure TfrmParamGlobal.DbEdMascAgenciaKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if (key = '.'{ivlm}) and (Copy((Sender as TwwDbEdit).Text, Length((Sender as TwwDbEdit).Text), 1) = '.'{ivlm}) then
   begin
      MessageBeep(0);
      ShowMessage(Translate('Caracter Inválido'));
      Repaint;
      key := #0;
   end
   else
   if (key <> '9'{ivlm}) and (key <> '.'{ivlm}) and (key <> '-'{ivlm}) and (key <> #8) then
   begin
      MessageBeep(0);
      ShowMessage(Translate('Caracter Inválido'));
      Repaint;
      key := #0;
   end
   else
   if (key <> '9'{ivlm}) and (Length((Sender as TwwDbEdit).Text) = 0) then
   begin
      MessageBeep(0);
      ShowMessage(Translate('Caracter Inválido'));
      Repaint;
      key := #0;
   end;
end;



procedure TfrmParamGlobal.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   sbtnInserir.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnprocurar.Enabled := False;
   sbtnAlterar.Enabled  := not(bbtnConfirmar.Enabled);
   pnlFundo.Enabled     := True;
end;



procedure TfrmParamGlobal.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
   inherited;


   if dblkcmbMoeda.Text = '' then
   begin
      MsgDlg('Obrigatório preenchimento da Moeda', LerMensagem(2), mtError, [mbOk], 0);
      Repaint;

      if dblkcmbMoeda.Canfocus then dblkcmbMoeda.SetFocus;

      Accept := False;
   end
   else
   if CdsSeguranca.FieldByName('FlgAltSenhaSuper'{ivlm}).AsString <> 'S'{ivlm} then
   begin
      CdsSeguranca.FieldByName('SenhaSuper'{ivlm}).Clear;
      Sistema.SenhaSuper := '';
   end
   else
   if (CdsSeguranca.FieldByName('FlgAltSenhaSuper'{ivlm}).OldValue = 'S'{ivlm}) and
      (EdSenhaSuper.Text = '') and (EdSenhaSuper2.Text = '') then
   begin
      Accept := True;
   end
   else
   // verifica se a senha foi digitada
   if (EdSenhaSuper.Text <> EdSenhaSuper2.Text) or (EdSenhaSuper.Text = '') then
   begin
      MsgDlg('Redigite a nova senha corretamente', 'Parametros Globais', mtWarning, [mbOk, mbHelp], 0);
      Repaint;

      edSenhaSuper.Clear;
      edSenhaSuper2.Clear;

      PageGlobal.ActivePage := TbsSenha;
      edSenhaSuper.SetFocus;

      Accept := False;
   end
   else
   // se nao pode permanecer a mesma senha, testar se a nova e' diferente da atual
   if not(CdsSeguranca.FieldByName('FlgRepeteSenha'{ivlm}).AsString = 'S'{ivlm}) and
          (CriptografarHash(EdSenhaSuper.Text, 0, 15) = CdsSeguranca.FieldByName('SenhaSuper'{ivlm}).AsString ) then
   begin
      MsgDlg('A nova senha deve ser diferente da antiga', 'Parametros Globais', mtError, [mbOk, mbHelp], 0);
      Repaint;

      edSenhaSuper.Clear;
      edSenhaSuper2.Clear;

      PageGlobal.ActivePage := TbsSenha;
      edSenhaSuper.SetFocus;

      Accept := False;
   end
   else
   // compara com o tamanho padrão
   if Length(edSenhaSuper.Text) < CdsSeguranca.FieldByName('TamMinSenha'{ivlm}).AsInteger  then
   begin
      MsgDlg('Senha deve ter pelo menos ' + IntToStr(CdsSeguranca.FieldByName('TamMinSenha'{ivlm}).AsInteger) +
             ' caracteres', 'Parametros Globais', mtError, [mbOk, mbHelp], 0);
      Repaint;

      edSenhaSuper.Clear;
      edSenhaSuper2.Clear;

      PageGlobal.ActivePage := TbsSenha;
      edSenhaSuper.SetFocus;

      Accept := False;
   end
   else
   // verifica se tem os caracteres obrigatórios (numeros e/ou letras)
   if not(Modulo.StrIsAlphaNum(edSenhaSuper.Text, CdsSeguranca.FieldByName('FlgSenhaLetras'{ivlm}).AsString,
          CdsSeguranca.FieldByName('FlgSenhaNumeros'{ivlm}).AsString)) then
   begin
      if CdsSeguranca.FieldByName('FlgSenhaLetras'{ivlm}).AsString = 'S'{ivlm} then
      begin
         if CdsSeguranca.FieldByName('FlgSenhaNumeros'{ivlm}).AsString = 'S'{ivlm} then
         begin
            MsgDlg('Senha deve possuir números e letras', 'Parametros Globais', mtError, [mbOk, mbHelp], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('Senha deve possuir pelo menos uma letra', 'Parametros Globais', mtError, [mbOk, mbHelp], 0);
            Repaint;
         end;
      end
      else
      begin
         if CdsSeguranca.FieldByName('FlgSenhaNumeros'{ivlm}).AsString = 'S'{ivlm} then
         begin
            MsgDlg('Senha deve possuir pelo menos um número', 'Parametros Globais', mtError, [mbOk, mbHelp], 0);
            Repaint;
         end
         else
         begin
            MsgDlg('Senha inválida', 'Parametros Globais', mtError, [mbOk, mbHelp], 0);
            Repaint;
         end;
      end;

      edSenhaSuper.Clear;
      edSenhaSuper2.Clear;

      PageGlobal.ActivePage := TbsSenha;
      edSenhaSuper.SetFocus;

      Accept := False;
   end
   else
   // verifica se tem caracters seguidos repetidos
   if Modulo.ExistsMultChar(edSenhaSuper.Text) then
   begin
      MsgDlg('Senha não pode ter caracteres repetidos consecutivos', 'Parametros Globais', mtError, [mbOk, mbHelp], 0);
      Repaint;

      edSenhaSuper.Clear;
      edSenhaSuper2.Clear;

      PageGlobal.ActivePage := TbsSenha;
      edSenhaSuper.SetFocus;
      Accept := False;
   end

   //  Início - P: 18474 - 13/01/2005
   else
   if chkSegregaVirtual.Checked then
   begin
      if edtDataInicial.Text = '' then
      begin
         MsgDlg('É necessário informar a data inicial!', 'Parametros Globais', mtError, [mbOk, mbHelp], 0);
         Accept := False;
      end;
   //  Início - P: 18474 - 13/01/2005
   end;

   // Pendência 19573  - 18/08/2006
   if DbCkbSuper.Checked then
   begin
      if (EdSenhaSuper.Text <> EdSenhaSuper2.Text) or (EdSenhaSuper.Text = '') then
      begin
        MsgDlg('Redigite a nova senha corretamente', 'Parametros Globais', mtWarning, [mbOk, mbHelp], 0);
        Repaint;

        edSenhaSuper.Clear;
        edSenhaSuper2.Clear;

        PageGlobal.ActivePage := TbsSenha;
        edSenhaSuper.SetFocus;

        Accept := False;
      end;
   end;

   if Accept then
   begin
      if sbtnSim.Down then
      begin
         cds.FieldByName('FLGINTEGRAORC'{ivlm}).AsString := 'S'{ivlm};
      end
      else
      begin
         cds.FieldByName('FLGINTEGRAORC'{ivlm}).AsString := 'N'{ivlm};
      end;

      if CdsSeguranca.FieldByName('TempoTrava'{ivlm}).AsInteger < 60 then CdsSeguranca.FieldByName('TempoTrava'{ivlm}).AsInteger := 0;

      CdsSeguranca.FieldByName('SenhaSuper'{ivlm}).AsString := CriptografarHash(EdSenhaSuper.Text, 0, 15);

      Sistema.SenhaSuper := CdsSeguranca.FieldByName('SenhaSuper'{ivlm}).AsString;
   end;
end;



procedure TfrmParamGlobal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   dtmGlobal.cdsPlanCentCust.Close;
   dtmGlobal.cdsPlanCentRespon.Close;

   Modulo.Free;
   Moeda.Free;
   TipoDoc.Free;
   CentroCusto.Free;
   CentroRespon.Free;
   UnidNegocio.Free;
   Seguranca.Free;
   ParamGlobal.Free;
end;



procedure TfrmParamGlobal.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   Sistema.SetParametrosSeguranca;
end;



procedure TfrmParamGlobal.CmeCadastroEdit(Sender: TObject);
begin
   with Cds do
   begin
      if IsEmpty then
      begin
         Append;
         FieldByName('FLGOBRIGACC'{ivlm}).AsString         := 'N'{ivlm};
         FieldByName('USACRESPON'{ivlm}).AsString          := 'N'{ivlm};
         FieldByName('USAABC'{ivlm}).AsString              := 'N'{ivlm};
         FieldByName('FLGINTEGRAORC'{ivlm}).AsString       := 'N'{ivlm};
         FieldByName('FLGCRIAAGENCIA'{ivlm}).AsString      := 'N'{ivlm};
         FieldByName('FLGUSAUPPERPESSOA'{ivlm}).AsString   := 'N'{ivlm};
         FieldByName('FLGUSAENDPESSOA'{ivlm}).AsString     := 'N'{ivlm};
         FieldByName('FLGOBRIDOCPESSOA'{ivlm}).AsString    := 'N'{ivlm};
         FieldByName('FLGDUPLDOCPESSOA'{ivlm}).AsString    := 'N'{ivlm};
         FieldByName('FLGUSAMODRESPON'{ivlm}).AsString     := 'N'{ivlm};
         FieldByName('FLGCONTABPARTDOB'{ivlm}).AsString    := 'N'{ivlm};
         FieldByName('FLGSUBCONTAFORN'{ivlm}).AsString     := 'N'{ivlm};
         FieldByName('FLGSUBCONTACLIE'{ivlm}).AsString     := 'N'{ivlm};

         sbtnNao.Down := True;
      end;
   end;


   with CdsSeguranca do
   begin
      if IsEmpty then
      begin
         Append;
         FieldByname('IDEMPRESA'{ivlm}).AsFloat           := 1;
         FieldByname('FLGSENHALETRAS'{ivlm}).AsString     := 'S'{ivlm};
         FieldByname('FLGSENHANUMEROS'{ivlm}).AsString    := 'N'{ivlm};
         FieldByname('FLGREPETESENHA'{ivlm}).AsString     := 'S'{ivlm};
         FieldByname('FLGALTSENHASUPER'{ivlm}).AsString   := 'N'{ivlm};
         FieldByname('FLGVALSENHANOME'{ivlm}).AsString    := 'N'{ivlm};
         FieldByname('TAMMINSENHA'{ivlm}).AsInteger       := 6;
         FieldByname('TAMHISTORICOSENHA'{ivlm}).AsInteger := 5;
         FieldByname('TEMPOTRAVA'{ivlm}).AsInteger        := 0;
         FieldByname('DIASTROCASENHA'{ivlm}).AsInteger    := 0;
      end
      else
      begin
         Edit;

         if FieldByName('IDEMPRESA'{ivlm}).IsNull then         FieldByName('IDEMPRESA'{ivlm}).AsFloat             := 1;
         if FieldByName('FLGSENHALETRAS'{ivlm}).IsNull then    FieldByName('FLGSENHALETRAS'{ivlm}).AsString       := 'S'{ivlm};
         if FieldByName('FLGSENHANUMEROS'{ivlm}).IsNull then   FieldByName('FLGSENHANUMEROS'{ivlm}).AsString      := 'N'{ivlm};
         if FieldByName('FLGREPETESENHA'{ivlm}).IsNull then    FieldByName('FLGREPETESENHA'{ivlm}).AsString       := 'S'{ivlm};
         if FieldByName('FLGALTSENHASUPER'{ivlm}).IsNull then  FieldByName('FLGALTSENHASUPER'{ivlm}).AsString     := 'N'{ivlm};
         if FieldByName('TAMMINSENHA'{ivlm}).IsNull then       FieldByName('TAMMINSENHA'{ivlm}).AsInteger         := 6;
         if FieldByName('TAMHISTORICOSENHA'{ivlm}).IsNull then FieldByName('TAMHISTORICOSENHA'{ivlm}).AsInteger   := 5;
         if FieldByName('TEMPOTRAVA'{ivlm}).IsNull then        FieldByName('TEMPOTRAVA'{ivlm}).AsInteger          := 0;
         if FieldByName('DIASTROCASENHA'{ivlm}).IsNull then    FieldByName('DIASTROCASENHA'{ivlm}).AsInteger      := 0;
         if FieldByName('FLGVALSENHANOME'{ivlm}).IsNull then   FieldByName('FLGVALSENHANOME'{ivlm}).AsString      := 'N'{ivlm};
      end;
   end;

   inherited;

   HabilitaPaginas(True);
   PageGlobal.ActivePage := tbsGeral;

   if dbedMascaraCC.Enabled = True then
   begin
      if dbedMascaraCC.CanFocus then dbedMascaraCC.SetFocus;
   end
   else
   begin
      if dbedMascaraCR.CanFocus then dbedMascaraCR.SetFocus;
   end;

   if cds.FieldByName('FLGUSAMODRESPON'{ivlm}).IsNull then cds.FieldByname('FLGUSAMODRESPON'{ivlm}).AsString := 'N'{ivlm};
end;



procedure TfrmParamGlobal.DbSelTempoAfterUpClick(Sender: TObject);
begin
   inherited;
   if DbSelTempo.Value < 60 then DbSelTempo.Value := 60;
end;



procedure TfrmParamGlobal.DbSelTempoAfterDownClick(Sender: TObject);
begin
   inherited;
   if DbSelTempo.Value < 60 then DbSelTempo.Value := 0;
end;



procedure TfrmParamGlobal.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;

   if ( not(ParamGlobal.Gravar) or not(Seguranca.Gravar) ) then
   begin
      MsgDlg('Ocorreu um erro durante a gravação das informações', 'ParamGlobal', MtInformation, [MbOk], 0);
      Repaint;
      Accept := False;
      Exit;
   end;

   Sistema.GravaLogOperacoes(Translate('Atualização de Parâmetros do Sistema'));

   cds.Data          := ParamGlobal.ListaParamGlobal(Sistema.IdEmpresa);
   CdsSeguranca.Data := Seguranca.ListaSeguranca();
end;



procedure TfrmParamGlobal.CmeCadastroAfterConfirma(Sender: TObject);
begin
   inherited;
   HabilitaPaginas(False);
end;



procedure TfrmParamGlobal.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   HabilitaPaginas(False);
end;



procedure TfrmParamGlobal.mensagem(msg: String);
begin
   MsgDlg(msg, 'Atenção', mtWarning, [mbOk], 0);
   Repaint;
end;



procedure TfrmParamGlobal.CdsBeforePost(DataSet: TDataSet);
begin
   inherited;
   with Cds do
   begin
      FieldByName('IDPESSOA'{ivlm}).AsInteger  := Sistema.IdEmpresa;
      FieldByName('IDUSUARIO'{ivlm}).AsInteger := Sistema.IdEmpresa;

      if FieldByname('FLGSEGREGAORCOMUM').AsString = 'N' then FieldByname('FLGSEGORCOMFIN').AsString := 'N';
      if FieldByname('FLGSEGREGAORADM').AsString   = 'N' then FieldByname('FLGSEGORADMFIN').AsString := 'N';

   end;
end;



procedure TfrmParamGlobal.DBcboPlanCentResponCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if Cds.State in [dsInsert, dsEdit] then
   begin
      Cds.FieldByName('MASCCENTRORESPON').AsString := dtmGlobal.cdsPlanCentRespon.FieldByName('MASCARA').AsString;
   end;
end;



procedure TfrmParamGlobal.DBcboPlanCentCustCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;

   if Cds.State in [dsInsert, dsEdit] then
   begin
      Cds.FieldByName('MASCARACC').AsString := dtmGlobal.cdsPlanCentCust.FieldByName('MASCARA').AsString;
   end;
end;



procedure TfrmParamGlobal.chkSegregaVirtualClick(Sender: TObject);
begin
  inherited;
  //  Início P: 18474 - 13/01/2005
  if Cds.State in [dsInsert, dsEdit] then
     begin
     if chkSegregaVirtual.Checked then
        edtDataInicial.ReadOnly := False
     else
     begin
        Cds.FieldByName('DTSEGREGAVIRTUAL').AsString := '';
        edtDataInicial.ReadOnly := True;
     end;
  //  Fim P: 18474 - 13/01/2005
  end;
end;

procedure TfrmParamGlobal.dbchkSegregaComumOriClick(Sender: TObject);
begin
  inherited;
  dbchkApenasFinComum.Enabled := dbchkSegregaComumOri.Checked;
  if not dbchkSegregaComumOri.Checked then dbchkApenasFinComum.Checked := False;
end;

procedure TfrmParamGlobal.dbchkSegregaAdminOriClick(Sender: TObject);
begin
  inherited;
  dbchkApenasFinAdmin.Enabled := dbchkSegregaAdminOri.Checked;
  if not dbchkSegregaAdminOri.Checked then dbchkApenasFinAdmin.Checked := False;
end;

procedure TfrmParamGlobal.BtnFolderClick(Sender: TObject);
begin
  If DlgDir.Execute Then
     EdtVersao.Text := DlgDir.Directory;
end;

procedure TfrmParamGlobal.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
            Begin
              If (EdtVersao.Text <> Sistema.DirVersao) Then
                 with TRegistry.Create do
                   Try
                     try
                        OpenKey('Software\CM', True);
                     except
                        OpenKeyReadOnly('Software\CM');
                     end;

                     if Sistema.GravaRegister then
                        WriteString(KEY_DIR_VERSAO, EdtVersao.Text)
                   finally
                     CloseKey;
                     free;
                   End;
            End;
end;

end.

