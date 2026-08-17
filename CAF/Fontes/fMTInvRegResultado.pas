{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
 Nº SOL......: 172256
 Nº KINTANA..: 1547763
 Data........: 02/08/2012
 Responsável.: Vander Campos
 Descrição...: Retirar da interface Alteração de Bens do Inventário e da
               interface Localização / Conjunto dos Bens não Localizados a
               funcionalidade de Cadastro de Conjuntos.
--------------------------------------------------------------------------------
Desenvolvedor : Marcos Luiz de Jesus
Data          : 08.06.2010
SOL_Kintana   : 129624_713154
Descrição     : Alterado de PLACA para BEM a critica para validar se o Bem
                ja esta cadastrado para o inventario corrente.
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27279
Responsável  : Daniel Simões
Data         : 24/01/2008
Descrição    : Sobreposição do form em função da pendência...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fMTInvRegResultado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCadastroMestreDetMT, MontaSelect, DB, DBClient, IvEMulti,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, uCmSqlParams,
  Mask, wwdbedit, wwdbdatetimepicker, CMDateTimePicker, DBCtrls,
  uCMTypes, uCtrlPadroes, uCtrlInventarioBens, uCtrlDomBem,
  uCtrlParamCAF, uCtrlConjunto, uCtrlLocalizacoes, uCtrlResponsavel;


type
  //Vander - SOL: 172256 - KTN: 1547763
  EMTInvRegResultado = Class(Exception);
  //

  TfrmMTInvRegResultado = class(TFrmCadastroMestreDetMT)
    ToolbarSep972: TToolbarSep97;
    btnMarcaOK: TSpeedButton;
    bbtnFillNotFound: TSpeedButton;
    GroupBox1: TGroupBox;
    edDataFim: TCMDateTimePicker;
    pnlInventario: TPanel;
    Label1: TLabel;
    dbeIdInventario: TwwDBEdit;
    Label3: TLabel;
    dbeDataInicio: TCMDateTimePicker;
    Label2: TLabel;
    dbeResponsavel: TwwDBEdit;
    cdsDet: TCMClientDataSet;
    sqlDet: TCMSqlParams;
    Label7: TLabel;
    cmbFlgPlaca: TComboBox;
    Label6: TLabel;
    dbeSelLocal: TwwDBEdit;
    bbtnSelLocal: TBitBtn;
    Label5: TLabel;
    cmbFlgSitFisica: TComboBox;
    Label8: TLabel;
    dbeConjunto: TwwDBEdit;
    bbtnSelConjunto: TBitBtn;
    bbtnGeraConjunto: TBitBtn;
    cdsLocal: TCMClientDataSet;
    dsLocal: TwwDataSource;
    MSLocal: TMontaSelect;
    cdsConjunto: TCMClientDataSet;
    dsConjunto: TwwDataSource;
    MSConjunto: TMontaSelect;
    ckbEncerrado: TDBCheckBox;
    bbtnImportar: TToolbarButton97;
    sbtnProcurarBem: TToolbarButton97;
    cdsBem: TCMClientDataSet;
    MSBem: TMontaSelect;
    cdsPlacaIIB: TCMClientDataSet;
    sqlPlacaIIB: TCMSqlParams;
    bbtnGeraDet: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnGeraConjuntoClick(Sender: TObject);
    procedure cmbFlgPlacaChange(Sender: TObject);
    procedure cmbFlgPlacaExit(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure btnMarcaOKClick(Sender: TObject);
    procedure bbtnImportarClick(Sender: TObject);
    procedure bbtnFillNotFoundClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure cmbFlgPlacaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdDetTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure sbtnProcurarBemClick(Sender: TObject);
    procedure bbtnGeraDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    InventarioBens : TCtrlInventarioBens;
    ParamCAF       : TCtrlParamCAF;
    Conjunto       : TCtrlConjunto;
    Localizacao    : TCtrlLocalizacoes;
    Responsavel    : TCtrlResponsavel;
    Bem            : TCtrlDomBem;
    //------------------------------------------------------------------------------------
    bFlgColetor   : Boolean;
    iTipoColetor,
    iDigMascPlaca : Integer;
    //------------------------------------------------------------------------------------

    procedure SelInventarioBens(fIdPessoa, fIdInventarioBens : Extended);
    procedure AtualizaBotoesDet;
    procedure Reordenar_cdsDet(AFieldName : String);

    // Vander - SOL: 172256 - KTN: 1547763
    Procedure CadastroConjuntos(AVisivel : Boolean = True);
    Class Function GetResultado(AIIBFLGPLACA : ShortInt) : String;
    Procedure BeforePost;
  public
  end;



var
  frmMTInvRegResultado: TfrmMTInvRegResultado;

implementation

{$R *.dfm}

Uses uMensErro, uSistema, fMTInvColPDT3100, fMTInvColScwLucas7000,
     fMTInvColCMNet,
     fMTInvRegNaoEncontrados, fMTCadConjunto, fMTInvRegResLocBem,
     //
     fMTSelMultiBem
     ;

procedure TfrmMTInvRegResultado.FormCreate(Sender: TObject);
begin
   inherited;
   InventarioBens := TCtrlInventarioBens.Create;
   InventarioBens.InitializeAs(Padroes);
   InventarioBens.cds             := cds;
   //Marcio Sanches Spinosa
   InventarioBens.cdsItensInvBens := cdsDet;
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   bFlgColetor := not (ParamCAF.COLETORDADOS = 0);
   iTipoColetor := ParamCAF.COLETORDADOS;
   iDigMascPlaca := ParamCAF.DIGMASCPLACA;
   bbtnImportar.Visible := bFlgColetor;
   bbtnFillNotFound.Visible := bFlgColetor;
   bbtnGeraDet.Visible := bFlgColetor; // Vander - SOL: 172256 - KTN: 1547763
   btnMarcaOk.Visible := Not bFlgColetor;
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Localizacao := TCtrlLocalizacoes.Create;
   Localizacao.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MontaSelect.Filtro.Add('INVENTARIOBENS.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSLocal.Filtro.Add('LOCALIZACAO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   SelInventarioBens(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTInvRegResultado.FormShow(Sender: TObject);
begin
   inherited;
   AtualizaBotoesDet;
end;
//========================================================================================
procedure TFrmMTInvRegResultado.SelInventarioBens(fIdPessoa, fIdInventarioBens : Extended);
begin
   cds.Data := InventarioBens.ListaInventarioBens(fIdPessoa, fIdInventarioBens);
   if not cds.IsEmpty then
   begin
      cdsDet.Data  := InventarioBens.ListaItensInvBens(cds.FieldByName('IDEMPRESA').AsFloat,
                                                       cds.FieldByName('IDINVENTARIOBENS').AsFloat);
      cdsDet.DisableControls;
      while not cdsDet.eof do
      begin
         cdsDet.Edit;
         if cdsDet.FieldByname('IIBFLGPLACA').AsInteger = 0 then
            cdsDet.FieldByname('RESULTADO').AsString := 'Não informado'
         else
         if cdsDet.FieldByname('IIBFLGPLACA').AsInteger = 1 then
            cdsDet.FieldByname('RESULTADO').AsString := 'Ok'
         else
         if cdsDet.FieldByname('IIBFLGPLACA').AsInteger = 2 then
            cdsDet.FieldByname('RESULTADO').AsString := 'Placa não encontrada'
         else
         if cdsDet.FieldByname('IIBFLGPLACA').AsInteger = 3 then
            cdsDet.FieldByname('RESULTADO').AsString := 'Placa EM outro Local'
         else
         if cdsDet.FieldByname('IIBFLGPLACA').AsInteger = 4 then
            cdsDet.FieldByname('RESULTADO').AsString := 'Placa DE outro Local'
         else
         if cdsDet.FieldByname('IIBFLGPLACA').AsInteger = 5 then
            cdsDet.FieldByname('RESULTADO').AsString := 'Placa não cadastrada'
         else
            cdsDet.FieldByname('RESULTADO').Clear;

       //William Moreira da Silva SOL: 172256 KINTANA: 1547763
       cdsDet.FieldByName('IDEMPRESA').AsFloat := sistema.idempresa;
       cdsDet.FieldByName('IIBIDBEM').AsFloat  := cdsDet.FieldByName('IDBEM').AsFloat;
       //William Moreira da Silva SOL: 172256 KINTANA: 1547763
         cdsDet.Post;
         cdsDet.Next;
      end;
      cdsDet.First;
      cdsDet.EnableControls;
   end else
   begin
      cdsDet.Data := InventarioBens.ListaItensInvBens(0,0);
   end;
   //-------------------------------------------------------------------------------------
   AtualizaBotoesDet;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   InventarioBens.Free;
   ParamCAF.Free;
   Conjunto.Free;
   Localizacao.Free;
   Responsavel.Free;
   Bem.Free;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := InventarioBens.AplicaOperacao('S');
end;
//========================================================================================
procedure TfrmMTInvRegResultado.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := InventarioBens.AplicaOperacao('ER');
end;
//========================================================================================
procedure TfrmMTInvRegResultado.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := InventarioBens.AplicaOperacao('ER');
end;
//========================================================================================
procedure TfrmMTInvRegResultado.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   if trim(InventarioBens.MessageInfo) <> '' then
      MsgDlg(InventarioBens.MessageInfo, 'Erro', mtError, [mbOK], 0);
end;
//========================================================================================
procedure TfrmMTInvRegResultado.sbtnProcurarClick(Sender: TObject);
begin
   inherited;
   if not cds.IsEmpty then
      sbtnAlterar.Click;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      Application.ProcessMessages;
      SelInventarioBens(strtofloat(MontaSelect.ValoresChave[1]),strtofloat(MontaSelect.ValoresChave[0]));
   end;   
end;
//========================================================================================
procedure TfrmMTInvRegResultado.CmeCadastroAfterConfirma(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.sbtnInsDetClick(Sender: TObject);
begin
   //-------------------------------------------------------------------------------------
   // IIBFLGPLACA
   //-------------------------------------------------------------------------------------
   // 0 - ...
   // 1 - Ok
   // 2 - Placa não Encontrada
   // 3 - Placa em Outro Local
   // 4 - Placa de Outro Local
   // 5 - Placa não Cadastrada
   //-------------------------------------------------------------------------------------
   cdsDet.Append;
   AtualizaBotoesDet;
   //-------------------------------------------------------------------------------------
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSBem.RetornouValor then
   begin
      try
         sqlPlacaIIB.Prepare;
         sqlPlacaIIB.ParamByName('IDINVENTARIOBENS').AsFloat := cds.FieldByName('IDINVENTARIOBENS').AsFloat;
         sqlPlacaIIB.ParamByName('IDEMPRESA').AsFloat := cds.FieldByName('IDEMPRESA').AsFloat;
         // Alterado por Marcos Luiz em 08/06/2010 - Sol 129624 Kintana: 713154
         sqlPlacaIIB.ParamByName('IDBEM').AsFloat := StrToFloat(MSBem.ValoresChave[1]);
         sqlPlacaIIB.Open;
         if cdsPlacaIIB.IsEmpty then
         begin
            cdsBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
            //----------------------------------------------------------------------------
            cdsDet.FieldByName('IDPESSOA').AsFloat         := cdsBem.FieldByName('IDPESSOA').AsFloat;
            cdsDet.FieldByName('IDBEM').AsFloat            := cdsBem.FieldByName('IDBEM').AsFloat;
            cdsDet.FieldByName('PLACA').AsFloat            := cdsBem.FieldByName('PLACA').AsFloat;
            cdsDet.FieldByName('DESBEM').AsString          := cdsBem.FieldByName('DESBEM').AsString;
            cdsDet.FieldByName('IDINVENTARIOBENS').AsFloat := cds.FieldByName('IDINVENTARIOBENS').AsFloat;
            cdsDet.FieldByName('IDEMPRESA').AsFloat        := cds.FieldByName('IDEMPRESA').AsFloat;
            cdsDet.FieldByName('IIBPLACA').AsFloat         := cdsBem.FieldByName('PLACA').AsFloat;
            cdsDet.FieldByName('IIBIDBEM').AsFloat         := cdsBem.FieldByName('IDBEM').AsFloat;
            cdsDet.FieldByName('IIBFLGPLACA').AsFloat      := 4;
            cdsDet.FieldByname('RESULTADO').AsString       := 'Placa DE outro Local';
            cdsDet.FieldByName('IIBLOCALATUAL').AsFloat    := cdsBem.FieldByName('IDLOCALIZACAO').AsFloat;
            cdsDet.FieldByName('IIBCONJUNTOATUAL').AsFloat := cdsBem.FieldByName('IDCONJUNTO').AsFloat;
            cdsDet.FieldByName('IIBFLGSITFISICA').AsFloat  := 0;
            cdsDet.Post;
         end else
         begin
           // Alterado por Marcos Luiz em 08/06/2010 - Sol 129624 Kintana: 713154
            MsgDlg('Bem já incluído neste Levantamento de Inventário',
                   'Atenção', mtError, [mbOk], 0);
            cdsDet.Cancel;
         end;
      except
         cdsDet.Cancel;
         Raise;
         Repaint;
      end;
   end else
      cdsDet.Cancel;
   //-------------------------------------------------------------------------------------
   AtualizaBotoesDet;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   MSLocal.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSLocal.RetornouValor then
   begin
      cdsLocal.Data := Localizacao.ListaLocalizacao(StrToFloat(MSLocal.ValoresChave[1]),
                                                    StrToFloat(MSLocal.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      if ParamCAF.TIPOCONJUNTO = 1 then  // Método 2 
      begin
         cdsConjunto.Data := InventarioBens.ListaConjuntoxLocal(cdsLocal.FieldByName('IDPESSOA').AsFloat,
                                                                cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat);
         if cdsConjunto.RecordCount > 1 then
            cdsConjunto.Data := InventarioBens.ListaConjuntoxLocal(Sistema.IdEmpresa, cdsDet.FieldByName('IIBCONJUNTOATUAL').AsFloat);
      end;
   end;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   if cmbFlgPlaca.ItemIndex >= 2 then
   begin
      MSConjunto.Filtro.Strings[3] := 'CONJUNTO.IDLOCALIZACAO = ' + cdsLocal.FieldByName('IDLOCALIZACAO').AsString;
   end else
   begin
      MSConjunto.Filtro.Strings[3] := '1=1';
   end;
   //-------------------------------------------------------------------------------------
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                 StrToFloat(MSConjunto.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTInvRegResultado.bbtnGeraConjuntoClick(Sender: TObject);
var
   fIdConjunto, fIdPessoa : Extended;

begin
   Application.CreateForm(TfrmMTCadConjunto,frmMTCadConjunto);
   frmMTCadConjunto.FormStyle := FsNormal;
   frmMTCadConjunto.Visible   := False;
   frmMTCadConjunto.Top       := 76;
   frmMTCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   fIdConjunto := frmMTCadConjunto.fUltIdConjunto;
   fIdPessoa   := frmMTCadConjunto.fUltIdPessoa;
   frmMTCadConjunto.Release;
   //-------------------------------------------------------------------------------------
   if fIdConjunto > 0 then
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(fIdPessoa, fIdConjunto);
      cdsLocal.Data := Localizacao.ListaLocalizacao(fIdPessoa,
                                                    cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat);
   end;                                                 
end;
//========================================================================================
procedure TfrmMTInvRegResultado.cmbFlgPlacaEnter(Sender: TObject);
begin
   inherited;
   if (cmbFlgPlaca.ItemIndex = 3) or (cmbFlgPlaca.ItemIndex = 4) then
   begin
      bbtnSelLocal.Enabled     := True;
      bbtnSelConjunto.Enabled  := True;
      bbtnGeraConjunto.Enabled := True;
   end else
   begin
      bbtnSelLocal.Enabled     := False;
      bbtnSelConjunto.Enabled  := False;
      bbtnGeraConjunto.Enabled := False;
   end;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.cmbFlgPlacaChange(Sender: TObject);
begin
   inherited;
   if (cmbFlgPlaca.ItemIndex = 3) or (cmbFlgPlaca.ItemIndex = 4) then
   begin
      bbtnSelLocal.Enabled     := True;
      bbtnSelConjunto.Enabled  := True;
      bbtnGeraConjunto.Enabled := True;
   end else
   begin
      bbtnSelLocal.Enabled     := False;
      bbtnSelConjunto.Enabled  := False;
      bbtnGeraConjunto.Enabled := False;
   end;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.cmbFlgPlacaExit(Sender: TObject);
begin
   inherited;
   if (cmbFlgPlaca.ItemIndex = 3) or (cmbFlgPlaca.ItemIndex = 4) then
   begin
      bbtnSelLocal.Enabled     := True;
      bbtnSelConjunto.Enabled  := True;
      bbtnGeraConjunto.Enabled := True;
      //----------------------------------------------------------------------------------
      cdsLocal.Close;
      if not cdsDet.FieldByName('IIBLOCALNOVO').IsNull then
      begin
         cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa,
                                                       cdsDet.FieldByName('IIBLOCALNOVO').AsFloat)
      end else
      begin
         cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa,
                                                       cdsDet.FieldByName('IIBLOCALATUAL').AsFloat)
      end;
      //----------------------------------------------------------------------------------
      cdsConjunto.Close;
      if not cdsDet.FieldByName('IIBCONJUNTONOVO').IsNull then
      begin
         cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                    cdsDet.FieldByName('IIBCONJUNTONOVO').AsFloat);
      end else
      begin
         if ParamCAF.TIPOCONJUNTO = 0 then
         begin
            cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                       cdsDet.FieldByName('IIBCONJUNTOATUAL').AsFloat);
         end;
      end;
      //----------------------------------------------------------------------------------
   end else
   begin
      bbtnSelLocal.Enabled     := False;
      bbtnSelConjunto.Enabled  := False;
      bbtnGeraConjunto.Enabled := False;
   end;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   AtualizaBotoesDet;
   //-------------------------------------------------------------------------------------
   if cdsDet.FieldByName('IIBFLGPLACA').IsNull then
      cmbFlgPlaca.ItemIndex := 0
   else
      cmbFlgPlaca.ItemIndex := cdsDet.FieldByName('IIBFLGPLACA').AsInteger;
   //-------------------------------------------------------------------------------------
   cdsLocal.Close;
   if not cdsDet.FieldByName('IIBLOCALNOVO').IsNull then
      cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa,
                                                    cdsDet.FieldByName('IIBLOCALNOVO').AsFloat)
   else
      cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa,
                                                    cdsDet.FieldByName('IIBLOCALATUAL').AsFloat);
   //-------------------------------------------------------------------------------------
   cdsConjunto.Close;
   if not cdsDet.FieldByName('IIBCONJUNTONOVO').IsNull then
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                 cdsDet.FieldByName('IIBCONJUNTONOVO').AsFloat);
   end else
   begin
      if ParamCAF.TIPOCONJUNTO = 0 then
      begin
         cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,
                                                    cdsDet.FieldByName('IIBCONJUNTOATUAL').AsFloat);
      end;
   end;
   //-------------------------------------------------------------------------------------
   cmbFlgSitFisica.ItemIndex := cdsDet.FieldByName('IIBFLGSITFISICA').AsInteger;
   //-------------------------------------------------------------------------------------
   cmbFlgPlaca.SetFocus;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.CmeDetalheConfirma(Sender: TObject);
begin
   if pgctrlDetalhe.ActivePage = tbsDet then
   begin
      if cdsDet.State in [dsInsert, dsEdit] then
      begin
         if (cmbFlgPlaca.Text <> '') and (cmbFlgPlaca.Text <> '...') then
         begin
            cdsDet.FieldByName('IIBFLGPLACA').AsInteger := cmbFlgPlaca.ItemIndex;
            //----------------------------------------------------------------------------
            // Códigos de iibFlgPlaca
            //----------------------------------------------------------------------------
            // 0 - Resultado não informado
            // 1 - Ok
            // 2 - Placa não encontrada
            // 3 - Placa EM outro Local
            // 4 - Placa DE outro Local
            // 5 - Placa não cadastrada
            //----------------------------------------------------------------------------
            if cmbFlgPlaca.ItemIndex = 0 then
               cdsDet.FieldByname('RESULTADO').AsString := 'Não informado'
            else
            if cmbFlgPlaca.ItemIndex = 1 then
               cdsDet.FieldByname('RESULTADO').AsString := 'Ok'
            else
            if cmbFlgPlaca.ItemIndex = 2 then
               cdsDet.FieldByname('RESULTADO').AsString := 'Placa não encontrada'
            else
            if cmbFlgPlaca.ItemIndex = 3 then
               cdsDet.FieldByname('RESULTADO').AsString := 'Placa EM outro Local'
            else
            if cmbFlgPlaca.ItemIndex = 4 then
               cdsDet.FieldByname('RESULTADO').AsString := 'Placa DE outro Local'
            else
            if cmbFlgPlaca.ItemIndex = 5 then
               cdsDet.FieldByname('RESULTADO').AsString := 'Placa não cadastrada'
            else
               cdsDet.FieldByname('RESULTADO').Clear;
            //----------------------------------------------------------------------------
            if ((cmbFlgPlaca.ItemIndex = 1) or (cmbFlgPlaca.ItemIndex = 2) or
                (cmbFlgPlaca.ItemIndex = 5)) then
            begin
               cdsDet.FieldByName('IIBLOCALNOVO').Clear;
               cdsDet.FieldByName('IIBCONJUNTONOVO').Clear;
            end;
            //----------------------------------------------------------------------------
            if ((cmbFlgPlaca.ItemIndex = 3) or (cmbFlgPlaca.ItemIndex = 4)) and
               (dbeSelLocal.Text <> '') then
            begin
               cdsDet.FieldByName('IIBLOCALNOVO').AsFloat := cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat;
               if dbeConjunto.Text <> '' then
                  cdsDet.FieldByName('IIBCONJUNTONOVO').AsFloat := cdsConjunto.FieldByName('IDCONJUNTO').AsFloat
               else
                  cdsDet.FieldByName('IIBCONJUNTONOVO').Clear;
            end else
            begin
               cdsDet.FieldByName('IIBLOCALNOVO').Clear;
               cdsDet.FieldByName('IIBCONJUNTONOVO').Clear;
            end;
            //----------------------------------------------------------------------------
            if cmbFlgSitFisica.Text <> '' then
            begin
               cdsDet.FieldByName('IIBFLGSITFISICA').AsInteger := cmbFlgSitFisica.ItemIndex;
            end else
            begin
               cdsDet.FieldByName('IIBFLGSITFISICA').AsInteger := 0;
            end;
         end else
         begin
            cdsDet.FieldByName('IIBFLGPLACA').AsInteger := 0;
            cdsDet.FieldByName('IIBLOCALNOVO').Clear;
            cdsDet.FieldByName('IIBCONJUNTONOVO').Clear;
            cdsDet.FieldByName('IIBFLGSITFISICA').AsInteger := 0;
         end;
         cdsDet.FieldByName('IDEMPRESA').AsFloat := sistema.idempresa; //William Moreira da Silva SOL: 172256 KINTANA: 1547763
         cdsDet.FieldByName('IIBIDBEM').AsFloat  := cdsDet.FieldByName('IDBEM').AsFloat;//William Moreira da Silva SOL: 172256 KINTANA: 1547763
      end;
   end;
   //-------------------------------------------------------------------------------------
   inherited;
   AtualizaBotoesDet;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   SelInventarioBens(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTInvRegResultado.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   SelInventarioBens(Sistema.IdEmpresa, 0);
end;
//========================================================================================
procedure TfrmMTInvRegResultado.dbgrdDetDblClick(Sender: TObject);
begin
   //inherited;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.btnMarcaOKClick(Sender: TObject);
begin
   inherited;
   if MsgDlg('Confirma a marcação de todos os bens do levantamento como OK',
             'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      cdsDet.DisableControls;
      cdsDet.First;
      while not cdsDet.EOF do
      begin
         if (cdsDet.FieldByName('IIBFLGPLACA').IsNull) or (cdsDet.FieldByName('IIBFLGPLACA').AsInteger = 0) then
         begin
            cdsDet.Edit;
            cdsDet.FieldByName('IIBFLGPLACA').AsInteger := 1;
            cdsDet.FieldByname('RESULTADO').AsString    := 'Ok';
            cdsDet.Post;
         end;   
         //-------------------------------------------------------------------------------
         cdsDet.Next;
      end;
      cdsDet.First;
      cdsDet.EnableControls;
   end;
   btnMarcaOK.Down := False;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.bbtnImportarClick(Sender: TObject);
begin
   inherited;
   if iTipoColetor = 1 then
   begin
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      Application.CreateForm(TfrmMTInvColPDT3100,frmMTInvColPDT3100);
      frmMTInvColPDT3100.FormStyle := FsNormal;
      frmMTInvColPDT3100.Visible := False;
      try
         frmMTInvColPDT3100.rdgpOper.ItemIndex := 1;
      finally
         frmMTInvColPDT3100.ShowModal;
      end;
      frmMTInvColPDT3100.Release;
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
   end else
   if iTipoColetor = 2 then
   begin
      Application.CreateForm(TfrmMTInvColScwLucas7000,frmMTInvColScwLucas7000);
      frmMTInvColScwLucas7000.FormStyle := FsNormal;
      frmMTInvColScwLucas7000.Visible := False;
      frmMTInvColScwLucas7000.rdgpOper.ItemIndex := 1;
      frmMTInvColScwLucas7000.ShowModal;
      frmMTInvColScwLucas7000.Release;
   end else
   if iTipoColetor = 3 then
   begin
      {Application.CreateForm(TfrmMTInvColPalmCTRQ,frmMTInvColPalmCTRQ);
      frmMTInvColPalmCTRQ.FormStyle := FsNormal;
      frmMTInvColPalmCTRQ.Visible := False;
      frmMTInvColPalmCTRQ.rdgpOper.ItemIndex := 1;
      frmMTInvColPalmCTRQ.ShowModal;
      frmMTInvColPalmCTRQ.Release;}
   end else
   if iTipoColetor = 4 then
   begin
      Application.CreateForm(TfrmMTInvColCMNet, frmMTInvColCMNet);
      frmMTInvColCMNet.FormStyle := FsNormal;
      frmMTInvColCMNet.Visible := False;
      frmMTInvColCMNet.rdgpOper.ItemIndex := 1;
      frmMTInvColCMNet.ShowModal;
      frmMTInvColCMNet.Release;
   end;
   //-------------------------------------------------------------------------------------
   SelInventarioBens(Sistema.IdEmpresa, cds.FieldByName('IDINVENTARIOBENS').AsFloat);
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.bbtnFillNotFoundClick(Sender: TObject);
var
   iPessoa, iLocal, iConjunto : Integer;
begin
   inherited;
   Application.CreateForm(TfrmMTInvRegNaoEncontrados,frmMTInvRegNaoEncontrados);
   frmMTInvRegNaoEncontrados.FormStyle := FsNormal;
   frmMTInvRegNaoEncontrados.Visible   := False;

   //Vander - SOL: 172256 - KTN: 1547763
   frmMTInvRegNaoEncontrados.bbtnGeraConjunto.VisiBle := False;

   frmMTInvRegNaoEncontrados.ShowModal;
   //-------------------------------------------------------------------------------------
   iPessoa   := frmMTInvRegNaoEncontrados.iPessoa;
   iLocal    := frmMTInvRegNaoEncontrados.iLocal;
   iConjunto := frmMTInvRegNaoEncontrados.iConjunto;
   frmMTInvRegNaoEncontrados.Release;
   //-------------------------------------------------------------------------------------
   if (iPessoa > 0) and (iLocal > 0) and (iConjunto > 0) then
   begin
      if (MsgDlg('Confirma a marcação de todos os bens não localizados '+#13+
                 'na Localização / Conjunto selecionado',
                 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
         cdsDet.DisableControls;
         cdsDet.First;
         while not cdsDet.EOF do
         begin
            if cdsDet.FieldByName('IIBFLGPLACA').AsInteger = 2 then
            begin
               cdsDet.Edit;
               cdsDet.FieldByName('IIBLOCALNOVO').AsInteger := iLocal;
               cdsDet.FieldByName('IIBCONJUNTONOVO').AsInteger := iConjunto;
               cdsDet.Post;
            end;
            cdsDet.Next;
         end;
         cdsDet.First;
         cdsDet.EnableControls;
      end;
   end;
   bbtnFillNotFound.Down := False;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.AtualizaBotoesDet;
begin
   inherited;
   sbtnInsDet.Down := (cdsDet.State = dsInsert);
   sbtnAltDet.Down := (cdsDet.State = dsEdit);
   //-------------------------------------------------------------------------------------
   sbtnInsDet.Enabled := (not cdsDet.IsEmpty) and (not sbtnAltDet.Down);
   sbtnAltDet.Enabled := (not cdsDet.IsEmpty) and (not sbtnInsDet.Down);
   sbtnExcluiDet.Enabled := (not cdsDet.IsEmpty) and (not sbtnInsDet.Down) and (not sbtnAltDet.Down);
   //-------------------------------------------------------------------------------------
   btnMarcaOk.Enabled := (not cdsDet.IsEmpty) and (not (sbtnInsDet.Down or sbtnAltDet.Down));
   sbtnProcurarBem.Enabled := (not cdsDet.IsEmpty) and (not (sbtnInsDet.Down or sbtnAltDet.Down));
   bbtnImportar.Visible := bFlgColetor;
   bbtnImportar.Enabled := (not cdsDet.IsEmpty) and (not (sbtnInsDet.Down or sbtnAltDet.Down));
   bbtnFillNotFound.Enabled := (not cdsDet.IsEmpty) and (not (sbtnInsDet.Down or sbtnAltDet.Down));

   // INICIO - Vander - SOL: 172256 - KTN: 1547763
   CadastroConjuntos(cdsDet.State <> dsEdit);
   bbtnGeraDet.Enabled := (not cdsDet.IsEmpty) and (not (sbtnInsDet.Down or sbtnAltDet.Down));   
   // FIM    - Vander - SOL: 172256 - KTN: 1547763
end;
//========================================================================================
procedure TfrmMTInvRegResultado.CmeDetalheCancel(Sender: TObject);
begin
   inherited;
   AtualizaBotoesDet;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.dbgrdDetTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   inherited;
   if cdsDet.State in [dsBrowse] then
      Reordenar_cdsDet(AFieldName);
end;
//========================================================================================
procedure TfrmMTInvRegResultado.Reordenar_cdsDet(AFieldName: String);
begin
   cdsDet.DisableControls;
   cdsDet.IndexFieldNames := AFieldName;
   cdsDet.First;
   cdsDet.EnableControls;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTInvRegResultado.sbtnProcurarBemClick(Sender: TObject);
var
   sKeyFields : string;
   KeyValues  : array of Variant;
   bAchou, bProcura : boolean;

begin
   inherited;
   bProcura := False;
   frmMTInvRegResLocBem := TfrmMTInvRegResLocBem.Create(Self);
   try
      if frmMTInvRegResLocBem.ShowModal = mrOk then
      begin
         bProcura := True;
         sKeyFields := '';
         //-------------------------------------------------------------------------------
         if frmMTInvRegResLocBem.edtPlaca.Text <> '' then
         begin
           sKeyFields := 'PLACA';
           //sKeyFields := 'IIBPLACA';//William Moreira da Silva SOL: 172256 KINTANA: 1547763
           SetLength(KeyValues, length(KeyValues) + 1);
           KeyValues[High(KeyValues)] := StrToInt(frmMTInvRegResLocBem.edtPlaca.Text);
         end;
         //-------------------------------------------------------------------------------
         if frmMTInvRegResLocBem.edtDescricao.Text <> '' then
         begin
            if sKeyFields <> '' then
               sKeyFields := sKeyFields + ';';
            //----------------------------------------------------------------------------
            sKeyFields := sKeyFields + 'DESBEM';
            SetLength(KeyValues, length(KeyValues) + 1);
            KeyValues[High(KeyValues)] := frmMTInvRegResLocBem.edtDescricao.Text;
         end;
      end;
   finally
      frmMTInvRegResLocBem.Free;
   end;
   //-------------------------------------------------------------------------------------
   if bProcura then
   begin
      if length(KeyValues) > 1 then
        bAchou := cdsDet.Locate(sKeyFields, KeyValues, [loCaseInsensitive,loPartialKey])
      else
        bAchou := cdsDet.Locate(sKeyFields, KeyValues[0], [loCaseInsensitive,loPartialKey]);
      //----------------------------------------------------------------------------------
      if not bAchou then
         MsgDlg('Bem não localizado com os parâmetros fornecidos!', 'Erro', mtError, [mbOK], 0);
   end;
end;

procedure TfrmMTInvRegResultado.CadastroConjuntos(AVisivel: Boolean);
begin
  bbtnGeraConjunto.Visible := AVisivel;

  if AVisivel Then
     dbeConjunto.Width := 0
  Else
     dbeConjunto.Width := 999;

end;

procedure TfrmMTInvRegResultado.bbtnGeraDetClick(Sender: TObject);
begin
  inherited;
  // Vander - SOL: 172256 - KTN: 1547763
  Try
    TfrmMTSelMultiBem.BuscaSelecionados(CdsDet, BeforePost);
  Finally
    btnMarcaOK.Down := False;
  End;
end;

Class function TfrmMTInvRegResultado.GetResultado(AIIBFLGPLACA: ShortInt): String;
Const
  Resultado : Array[0..5] of String = ('Não informado',
                                       'Ok',
                                       'Placa não encontrada',
                                       'Placa EM outro Local',
                                       'Placa DE outro Local',
                                       'Placa não cadastrada');
Begin
  Try
    Result := Resultado[AIIBFLGPLACA];
  Except
    Result := '';
  End;
end;

procedure TfrmMTInvRegResultado.BeforePost;
begin

  With cdsDet.FieldByname('RESULTADO') do
  Begin
     AsString := GetResultado(cdsDet.FieldByname('IIBFLGPLACA').AsInteger);
     if Trim(AsString) = '' Then
        Clear;
  End;

end;

procedure TfrmMTInvRegResultado.bbtnConfirmarClick(Sender: TObject);
var i : integer;
begin
  //William Moreira da Silva SOL: 172256 KINTANA: 1547763
   if not cdsDet.isEmpty then
    begin
      if (cdsDet.state in [dsBrowse]) then
      begin
         cdsDet.First;
         while not cdsDet.eof do
         begin
             cdsDet.edit;
             //cdsDet.FieldByName('IIBPLACA').AsFloat
             cdsDet.FieldByName('IDEMPRESA').AsFloat := sistema.idempresa;
             cdsDet.FieldByName('IIBIDBEM').AsFloat  := cdsDet.FieldByName('IDBEM').AsFloat;
             cdsDet.Post;
             cdsDet.Next;
         end;
      end;
    end;
    InventarioBens.cdsItensInvBens := cdsDet;
    //William Moreira da Silva SOL: 172256 KINTANA: 1547763
  inherited;
end;

end.

