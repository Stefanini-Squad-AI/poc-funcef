unit fCadParamCaf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, wwdbedit, wwdblook, ComCtrls, uProcuraDir, BfDialogs, BrowseFolder,
  wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, ImgList
  {$IFNDEF VERSAO0505},uCMTypes {$ENDIF};

type
  TfrmCadParamCaf = class(TfrmCadastroCS)
    qryAux: TwwQuery;                              
    qryMoeda: TwwQuery;
    qryPlano: TwwQuery;
    qryPlanoPLANO: TFloatField;
    qryPlanoDESCPLANO: TStringField;
    PageControl1: TPageControl;
    TabCadastros: TTabSheet;
    TabIntegracao: TTabSheet;
    TabIntegraContab: TTabSheet;
    TabCalculos: TTabSheet;
    grpbxIntegra: TGroupBox;
    cbxContab: TCheckBox;
    cbxCre: TCheckBox;
    cbxCpg: TCheckBox;
    gbSistemas: TGroupBox;
    cbCAF: TCheckBox;
    cbManut: TCheckBox;
    cbImob: TCheckBox;
    cbAlmox: TCheckBox;
    GroupBox4: TGroupBox;
    dbcbCodPlaca: TDBCheckBox;
    dbrgEmpresaGrupo: TDBRadioGroup;
    GroupBox3: TGroupBox;
    dbeMascaraGrupo: TwwDBEdit;
    GroupBox6: TGroupBox;
    dbeMascaraClasse: TwwDBEdit;
    GroupBox1: TGroupBox;
    dbednumdiasano: TwwDBEdit;
    gbCalcula: TGroupBox;
    cbCorrMonet: TCheckBox;
    GroupBox7: TGroupBox;
    dblkcmbPlano: TwwDBLookupCombo;
    dbrgFlgReaval: TDBRadioGroup;
    GroupBox2: TGroupBox;
    dbdDataInicial: TCMDateTimePicker;
    gbcalculo: TDBRadioGroup;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    dblcMoedaFiscal: TwwDBLookupCombo;
    dblcMoedaOficial: TwwDBLookupCombo;
    dblcMoedaGerencial: TwwDBLookupCombo;
    GroupBox8: TGroupBox;
    dblkcmbTipoOper: TwwDBLookupCombo;
    qryTipOper: TwwQuery;
    qryTipOperTIPCODIGO: TStringField;
    qryTipOperTIPDESCRICAO: TStringField;
    dbrgEstornoPlan: TDBRadioGroup;
    GroupBox9: TGroupBox;
    dblkcmbAtivProjeto: TwwDBLookupCombo;
    qryAtivProjeto: TwwQuery;
    qryAtivProjetoUNIDNEGOC: TFloatField;
    qryAtivProjetoUNECODIGO: TStringField;
    qryAtivProjetoNOME: TStringField;
    gboxNumPlacaIni: TGroupBox;
    dbeProxPlaca: TwwDBEdit;
    dbcbNomeBem: TDBCheckBox;
    TabInventario: TTabSheet;
    grbColetor: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbColetor: TComboBox;
    cmbPorta: TComboBox;
    cmbVeloc: TComboBox;
    dbeCDPath: TwwDBEdit;
    Label7: TLabel;
    bbtnSelPasta: TBitBtn;
    dbeDigitos: TwwDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    qryPatro: TwwQuery;
    qryPlanoPrev: TwwQuery;
    GroupBox10: TGroupBox;
    dblkcmbPlanoPrev: TwwDBLookupCombo;
    GroupBox11: TGroupBox;
    dblkcmbPatro: TwwDBLookupCombo;
    qryPatroIDPATRO: TFloatField;
    qryPatroNOME: TStringField;
    qryPlanoPrevIDPLANOPREV: TFloatField;
    qryPlanoPrevNOME: TStringField;
    pDirColetor: TProcuraDirDlg;
    dbrdgTipAtuSaldoContab: TDBRadioGroup;
    dbcbAluguelInterno: TDBCheckBox;
    dbcbGeraRequis: TDBCheckBox;
    dbgTipoConjunto: TDBRadioGroup;
    dbgPartidaContabil: TDBRadioGroup;
    dbgCtaDespesaDepreciacao: TDBRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcMoedaGerencialExit(Sender: TObject);
    procedure cbCAFExit(Sender: TObject);
    procedure cbManutExit(Sender: TObject);
    procedure cbAlmoxExit(Sender: TObject);
    procedure cbImobExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelPastaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sSistemas : String[8];
  end;

var
  frmCadParamCaf: TfrmCadParamCaf;

implementation

{$R *.DFM}

uses uMensErro, uDataBase, dBaseDados, uAutorizacao, uSistema, uIntegraBack;


procedure TfrmCadParamCaf.FormCreate(Sender: TObject);
var
   iTotBem, iTotConjunto : Integer;

begin
   inherited;
   PageControl1.ActivePage := TabCadastros;
   dbgTipoConjunto.Hint := 'Método 1 : Agrupar-se os bens associados de uma forma selecionada,'+#13+
                           'como os componentes de um computador, um veículo e seus acessórios.'+#13+
                           '(Recomendado)'+#13+
                           'Método 2 : Os conjuntos são associados as localizações.'+#13+
                           'Não recomendado, pois gera inconsistências.';
   //-------------------------------------------------------------------------------------
   // Verifica se existem grupos cadastrados
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Text := 'SELECT IDGRUPO FROM GRUPO';
   qryAux.Open;
   if not (qryAux.IsEmpty) then
   begin
      dbeMascaraGrupo.Enabled := False;
   end else
   begin
      dbeMascaraGrupo.Enabled := True;
   end;
   //-------------------------------------------------------------------------------------
   // Verifica se existem Classes Cadastradas
   //-------------------------------------------------------------------------------------
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Text := 'SELECT IDCLASSEBEM FROM CLASSEDEBEM';
   qryAux.Open;
   if not (qryAux.IsEmpty ) then
   begin
      dbeMascaraClasse.Enabled := False;
   end else
   begin
      dbeMascaraClasse.Enabled := True;
   end;
   //-------------------------------------------------------------------------------------
   qryMoeda.Prepare;
   qryMoeda.Open;
   qryPlano.Prepare;
   qryPlano.Open;
   qryTipOper.Prepare;
   qryTipOper.Open;
   qryAtivProjeto.Prepare;
   qryAtivProjeto.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryAtivProjeto.Open;
   qryPlanoPrev.Prepare;
   qryPlanoPrev.Open;
   qryPatro.Prepare;
   qryPatro.Open;
   //-------------------------------------------------------------------------------------
   // Prepara a Tabela de Parametros
   //-------------------------------------------------------------------------------------
   qry.Prepare;
   qry.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qry.Open;
   //-------------------------------------------------------------------------------------
   if not qry.IsEmpty then
   begin
      //----------------------------------------------------------------------------------
      // Setar o flag do campo TIPOCONJUNTO
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT COUNT(IDBEM) AS TOTBEM ' +
                         ' FROM BEM ' +
                         ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')';
      qryAux.Open;
      iTotBem := qryAux.FieldByName('TOTBEM').AsInteger;
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT COUNT(IDCONJUNTO) AS TOTCONJUNTO ' +
                         ' FROM CONJUNTO ' +
                         ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')';
      qryAux.Open;
      iTotConjunto := qryAux.FieldByName('TOTCONJUNTO').AsInteger;
      if iTotConjunto > (iTotBem / 2) then
      begin
         qry.Edit;
         qry.FieldByName('TIPOCONJUNTO').AsInteger := 0;
         qry.Post;
         qry.ApplyUpdates;
      end else
      begin
         qry.Edit;
         qry.FieldByName('TIPOCONJUNTO').AsInteger := 1;
         qry.Post;
         qry.ApplyUpdates;
      end;
      //----------------------------------------------------------------------------------
      if qry.FieldByName('SISTEMAS').IsNull then
         sSistemas := '1000'
      else
         sSistemas := qry.FieldByName('SISTEMAS').AsString;
      //----------------------------------------------------------------------------------
      cbCAF.Checked   := (sSistemas[1] = '1');
      cbManut.Checked := (sSistemas[2] = '1');
      cbAlmox.Checked := (sSistemas[3] = '1');
      cbImob.Checked  := (sSistemas[4] = '1');
      //----------------------------------------------------------------------------------
      if qry.FieldByName('FLGCALCCM').AsInteger = 1 then
         cbCorrMonet.Checked := True
      else
         cbCorrMonet.Checked := False;
      //----------------------------------------------------------------------------------
      if gbCalculo.ItemIndex = -1 then
         gbCalculo.ItemIndex := 1;
      //----------------------------------------------------------------------------------
      // Integração
      //----------------------------------------------------------------------------------
      cbxContab.Checked := (qry.FieldByName('INTEGRACONTAB').AsString = 'S');
      cbxCre.Checked    := (qry.FieldByName('INTEGRACAR').AsString = 'S');
      cbxCpg.Checked    := (qry.FieldByName('INTEGRACAP').AsString = 'S');
      //----------------------------------------------------------------------------------
      if qry.FieldByName('COLETORDADOS').IsNull then
         cmbColetor.ItemIndex := 0
      else
         cmbColetor.ItemIndex := qry.FieldByName('COLETORDADOS').AsInteger;
      //----------------------------------------------------------------------------------
      if qry.FieldByName('CDPORTA').IsNull then
         cmbPorta.ItemIndex := 1
      else
         cmbPorta.ItemIndex := qry.FieldByName('CDPORTA').AsInteger;
      //----------------------------------------------------------------------------------
      if qry.FieldByName('CDVELOC').IsNull then
         cmbVeloc.ItemIndex := 0
      else
         cmbVeloc.ItemIndex := qry.FieldByName('CDVELOC').AsInteger;
   end else
   begin
      try
         StartTransacao;
         //-------------------------------------------------------------------------------
         qry.Insert;
         qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
         qry.FieldByName('MOEDAOFICIAL').clear;
         qry.FieldByName('MOEDAFISCAL').clear;
         qry.FieldByName('MOEDAGERENCIAL').clear;
         qry.FieldByName('PLANOVIGENTE').AsInteger := IntegraBack.Plano;
         qry.FieldByName('TIPOPERCTB').AsString := qryTipOperTIPCODIGO.AsString;
         qry.FieldByName('SISTEMAS').AsString := '1000';
         qry.FieldByName('INTEGRACONTAB').AsString := 'N';
         qry.FieldByName('INTEGRACAP').AsString := 'N';
         qry.FieldByName('INTEGRACAR').AsString := 'N';
         qry.FieldByName('NUMDIASANO').AsInteger := 360;
         qry.FieldByName('DATAINICIAL').AsDateTime := date;
         qry.FieldByName('FLGTIPOCALC').AsString := 'M';
         qry.FieldByName('FLGCALCCM').AsInteger := 0;
         qry.FieldByName('FLGREAVAL').AsString := '0';
         qry.FieldByName('ALUGUELINTERNO').AsInteger := 0;
         qry.FieldByName('GERARREQMAT').AsInteger := 0;
         qry.FieldByName('EDITACODBEM').AsInteger := 0;
         qry.FieldByName('EDITACODGRUPO').AsInteger := 0;
         qry.FieldByName('SEQBEMEMP').AsInteger := 0;
         qry.FieldByName('FLGREMOVEPLANCTB').AsString := 'S';
         qry.FieldByName('ATIVPROJETO').AsInteger := qryAtivProjeto.FieldByName('UNIDNEGOC').AsInteger;
         qry.FieldByName('PROXIMAPLACA').AsFloat := 1;
         qry.FieldByName('FLGCLSDESBEM').AsFloat := 0;
         qry.FieldByName('PLANPREVPADRAO').AsFloat := qryPlanoPrev.FieldByName('IDPLANOPREV').AsFloat;
         qry.FieldByName('PATROPADRAO').AsFloat := qryPatro.FieldByName('IDPATRO').AsFloat;
         qry.FieldByName('TIPATUSALDOCONTAB').AsInteger := 0;
         qry.FieldByName('FLGCONTABFECHAM').AsInteger := 0;
         qry.FieldByName('TIPOCONJUNTO').AsInteger := 0;
         qry.FieldByName('COLETORDADOS').AsInteger := 0;
         qry.FieldByName('CDPORTA').AsInteger := 1;
         qry.FieldByName('CDVELOC').AsString := '0';
         qry.FieldByName('DIGMASCPLACA').AsInteger := 0;
         qry.FieldByName('FLGCTADEPREC').AsInteger := 0;
         qry.Post;
         qry.ApplyUpdates;
         CommitTransacao;
         //-------------------------------------------------------------------------------
         sSistemas            := '1000';
         cbCAF.Checked        := (sSistemas[1] = '1');
         cbManut.Checked      := (sSistemas[2] = '1');
         cbAlmox.Checked      := (sSistemas[3] = '1');
         cbImob.Checked       := (sSistemas[4] = '1');
         cbCorrMonet.Checked  := False;
         gbCalculo.ItemIndex  := 1;
         cbxContab.Checked    := False;
         cbxCre.Checked       := False;
         cbxCpg.Checked       := False;
         cmbColetor.ItemIndex := 0;
         cmbPorta.ItemIndex   := 1;
         cmbVeloc.ItemIndex   := 0;
      except
         on E : Exception do
         begin
            RollBackTransacao;
            MsgDlg('Falha na inicialização dos parâmetros do sistema!' + #13 + #13 +
                   'Causa : ' + E.Message,
                   'Erro', mtError, [mbOk], 0);
         end;
      end;
   end;
   //-------------------------------------------------------------------------------------
   sbtnInserir.Enabled  := False;
   sbtnAlterar.Enabled  := True;
   sbtnApagar.Enabled   := False;
   sbtnProcurar.Enabled := False;
end;
//========================================================================================
procedure TfrmCadParamCaf.FormShow(Sender: TObject);
begin
   inherited;
   sbtnInserir.Enabled  := False;
   sbtnAlterar.Enabled  := True;
   sbtnApagar.Enabled   := False;
   sbtnProcurar.Enabled := False;
end;
//========================================================================================
procedure TfrmCadParamCaf.bbtnConfirmarClick(Sender: TObject);
begin
   qry.FieldByName('SISTEMAS').AsString := sSistemas;
   //-------------------------------------------------------------------------------------
   if (cbCorrMonet.Checked) then
      qry.FieldByName('FLGCALCCM').AsInteger := 1
   else
      qry.FieldByName('FLGCALCCM').AsInteger := 0;
   //-------------------------------------------------------------------------------------
   if dblcMoedaOficial.Text = '' then
      qry.FieldByName('MOEDAOFICIAL').Clear;
   //-------------------------------------------------------------------------------------
   if dblcMoedaFiscal.Text = '' then
      qry.FieldByName('MOEDAFISCAL').Clear;
   //-------------------------------------------------------------------------------------
   if dblcMoedaGerencial.Text = '' then
      qry.FieldByName('MOEDAGERENCIAL').Clear;
   //-------------------------------------------------------------------------------------
   if cbxContab.Checked then
      qry.FieldByName('INTEGRACONTAB').AsString := 'S'
   else
      qry.FieldByName('INTEGRACONTAB').AsString := 'N';
   //-------------------------------------------------------------------------------------
   if cbxCpg.Checked then
      qry.FieldByName('INTEGRACAP').AsString := 'S'
   else
      qry.FieldByName('INTEGRACAP').AsString := 'N';
   //-------------------------------------------------------------------------------------
   if cbxCre.Checked then
      qry.FieldByName('INTEGRACAR').AsString := 'S'
   else
      qry.FieldByName('INTEGRACAR').AsString := 'N';
   //-------------------------------------------------------------------------------------
   qry.FieldByName('COLETORDADOS').AsInteger := cmbColetor.ItemIndex;
   qry.FieldByName('CDPORTA').AsInteger := cmbPorta.ItemIndex;
   qry.FieldByName('CDVELOC').AsString := inttostr(cmbVeloc.ItemIndex);
   qry.Post;
   qry.ApplyUpdates;
   //-------------------------------------------------------------------------------------
   inherited;
   sbtnInserir.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnProcurar.Enabled := False;
end;
//========================================================================================
procedure TfrmCadParamCaf.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   sbtnInserir.Enabled  := False;
   sbtnApagar.Enabled   := False;
   sbtnProcurar.Enabled := False;
end;
//========================================================================================
procedure TfrmCadParamCaf.dblcMoedaGerencialExit(Sender: TObject);
begin
   inherited;
   if dblcMoedaGerencial.Text = '' then
      dblcMoedaGerencial.Clear;
end;
//========================================================================================
procedure TfrmCadParamCaf.cbCAFExit(Sender: TObject);
begin
   inherited;
   if cbCAF.Checked then
      sSistemas[1] := '1'
   else
      sSistemas[1] := '0';
end;
//========================================================================================
procedure TfrmCadParamCaf.cbManutExit(Sender: TObject);
begin
   inherited;
   if cbManut.Checked then
      sSistemas[2] := '1'
   else
      sSistemas[2] := '0';
end;
//========================================================================================
procedure TfrmCadParamCaf.cbAlmoxExit(Sender: TObject);
begin
   inherited;
   if cbAlmox.Checked then
      sSistemas[3] := '1'
   else
      sSistemas[3] := '0';
end;
//========================================================================================
procedure TfrmCadParamCaf.cbImobExit(Sender: TObject);
begin
   inherited;
   if cbImob.Checked then
      sSistemas[4] := '1'
   else
      sSistemas[4] := '0';
end;
//========================================================================================
procedure TfrmCadParamCaf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryMoeda.Close;
   qryMoeda.UnPrepare;
   qryPlano.Close;
   qryPlano.Unprepare;
   qryAtivProjeto.Close;
   qryAtivProjeto.UnPrepare;
   qryTipOper.Close;
   qryTipOper.UnPrepare;
   qryPlanoPrev.Close;
   qryPatro.Close;
   qryPlanoPrev.UnPrepare;
   qryPatro.UnPrepare;
   inherited;
end;
//========================================================================================
procedure TfrmCadParamCaf.bbtnSelPastaClick(Sender: TObject);
begin
   inherited;
   pDirColetor.ShowPath := False;
   pDirColetor.Caption := 'Pasta de Trabalho do Coletor de Dados';
   pDirColetor.Execute;
   qry.FieldByName('CDPATH').AsString := pDirColetor.Directory;
end;

procedure TfrmCadParamCaf.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   case CmeCadastro.Operacao of
      opInserir :
         if not Sistema.GravaLogOperacoes('Inicializacao dos Parametros do Sistema') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opAlterar :
         if not Sistema.GravaLogOperacoes('Alteracao dos Parametros do Sistema') then
            raise Exception.Create('Erro ao gravar Log de Operação');
      opApagar :
         if not Sistema.GravaLogOperacoes('Remocao dos Parametros do Sistema') then
            raise Exception.Create('Erro ao gravar Log de Operação');
   end;
end;

end.

