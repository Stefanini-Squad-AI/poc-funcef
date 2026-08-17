{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 152857
Nº KINTANA..: 1148170
Data........: 18/02/2011
Responsável.: Thaise Amaral Martins
Descrição...: Trocar campo errado no dataset pelo correto.
-------------------------------------------------------------------------------------------------- }

unit fMTMovTransfBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Grids, Wwdbigrd, Wwdbgrid,
  Wwdatsrc, ComCtrls, DBCtrls, wwdbedit, Mask, TB97Ctls, CMTree, wwRiched, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  uCMTypes, uCtrlPadroes, uCtrlMovTransfBem, uCtrlResponsavel, uCtrlParamCAF,
  uCtrlDomBem, uCtrlConjunto, uCtrlLocalizacoes, uCtrlGrupoContab, uCmSqlParams, IvEMulti;

type
  TfrmMTMovTransfBem = class(TfrmOkCancelar)
    dsRateioN: TwwDataSource;
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
    bbtnSelBem: TBitBtn;
    edPlaca: TEdit;
    pnlSelBens: TPanel;
    Label8: TLabel;
    bbtnTermoTransf: TBitBtn;
    Label9: TLabel;
    edDataSel: TCMDateTimePicker;
    Label10: TLabel;
    Processo: TLabel;
    dbeSbxProcesso: TwwDBEdit;
    dbeResp: TwwDBEdit;
    dbeConjunto: TwwDBEdit;
    dbeDescLocalizacao: TwwDBEdit;
    dbeNomeResp: TwwDBEdit;
    dbeDesBem: TDBMemo;
    Label11: TLabel;
    dsDet: TwwDataSource;
    PnlDetalhe: TPanel;
    Label4: TLabel;
    pnlTransfConj: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    dbgRateioN: TwwDBGrid;
    Label3: TLabel;
    bbtnSelConjunto: TBitBtn;
    dbeTermo: TwwDBEdit;
    Label2: TLabel;
    dbeConjuntoNovo: TwwDBEdit;
    dbeLocalNovo: TwwDBEdit;
    dbeRespNovo: TwwDBEdit;
    bbtnGrupo: TBitBtn;
    dbgDet: TwwDBGrid;
    dbeDescGrupo: TwwDBEdit;
    bbtnSelLocal: TBitBtn;
    bbtnSelResp: TBitBtn;
    dsSelBem: TwwDataSource;
    cdsSelBem: TCMClientDataSet;
    dbeGrupoNovo: TwwDBEdit;
    cdsConjunto: TCMClientDataSet;
    cdsLocal: TCMClientDataSet;
    dsLocal: TwwDataSource;
    dsResp: TwwDataSource;
    cdsResp: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    dsGrupo: TwwDataSource;
    dsConjunto: TwwDataSource;
    cdsRateioN: TCMClientDataSet;
    sqlRateioN: TCMSqlParams;
    sqlDet: TCMSqlParams;
    cdsDet: TCMClientDataSet;
    cdsSelTermo: TCMClientDataSet;
    dsSelTermo: TwwDataSource;
    MSGrupo: TMontaSelect;
    MSConjunto: TMontaSelect;
    MSTermo: TMontaSelect;
    MSLocal: TMontaSelect;
    MSResp: TMontaSelect;
    MSBem: TMontaSelect;
    cdsGrupoTaxaDep2: TCMClientDataSet;
    cdsGrupoTaxaDep1: TCMClientDataSet;
    TabConjunto: TTabSheet;
    Panel1: TPanel;
    Label14: TLabel;
    lbl: TLabel;
    bbtnSelConjunto3: TBitBtn;
    edDataTransf3: TCMDateTimePicker;
    Label13: TLabel;
    dbeDescLocal3: TwwDBEdit;
    bbtnSelLocal3: TBitBtn;
    Label15: TLabel;
    dbeNomeResp3: TwwDBEdit;
    bbtnSelResp3: TBitBtn;
    Label16: TLabel;
    dbeDescConjunto3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    dsBensnoConjunto3: TwwDataSource;
    cdsBensnoConjunto3: TCMClientDataSet;
    sqlBensnoConjunto3: TCMSqlParams;
    qryBensNoConjunto3: TwwQuery;
    dsConjunto3: TwwDataSource;
    cdsConjunto3: TCMClientDataSet;
    dsLocal3: TwwDataSource;
    cdsLocal3: TCMClientDataSet;
    dsResp3: TwwDataSource;
    cdsResp3: TCMClientDataSet;
    dbgBensNoConjunto: TwwDBGrid;
    wwDBEdit1: TwwDBEdit;
    Label20: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnTermoTransfClick(Sender: TObject);
    procedure bbtnGrupoClick(Sender: TObject);
    procedure bbtnSelLocalClick(Sender: TObject);
    procedure bbtnSelRespClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSelConjunto3Click(Sender: TObject);
    procedure bbtnSelLocal3Click(Sender: TObject);
    procedure bbtnSelResp3Click(Sender: TObject);
    procedure pgctlTransfChange(Sender: TObject);
  private
    { Private declarations }
    MovTransfBem : TCtrlMovTransfBem;
    Responsavel  : TCtrlResponsavel;
    ParamCAF     : TCtrlParamCAF;
    Bem          : TCtrlDomBem;
    Conjunto     : TCtrlConjunto;
    Localizacao  : TCtrlLocalizacoes;
    GrupoContab  : TCtrlGrupoContab;

  public
    { Public declarations }
    fGrupoNovo                  : Extended;
    iSoma,ind                   : Integer;
    lNivel                      : Array [0..20] of Integer;
    sMascPict, sMascaraGrupoBem : String;
    bCorrompido, bMovimento     : Boolean;
    //------------------------------------------------------------------------------------
    procedure SelTermoTransf(fIdPessoa, fIdSelBaixa : Extended);
    procedure LimpaCampos;
    function  MascaraOK(sMascara : String;
                        var sMascPict : String;
                        var lNivel : Array of Integer;
                        var iSoma : Integer;
                        var ind : Integer) : Boolean;
    //------------------------------------------------------------------------------------
    procedure Progresso(vParam : Array of Variant);
  end;

var
  frmMTMovTransfBem: TfrmMTMovTransfBem;

implementation

uses uSistema, uMensErro, fMTInvProcSelTermo, fAguarde;

{$R *.DFM}

procedure TfrmMTMovTransfBem.Progresso(vParam: array of Variant);
begin
   frmAguarde.Max     := vParam[1];
   frmAguarde.Pos     := vParam[2];
   frmAguarde.Caption := vParam[3];
   Application.ProcessMessages;
end;

procedure TfrmMTMovTransfBem.FormCreate(Sender: TObject);
begin
   inherited;
   MovTransfBem := TCtrlMovTransfBem.Create;
   MovTransfBem.InitializeAs(Padroes);
   MovTransfBem.cdsBem := cdsSelBem;
   MovTransfBem.cdsGrupo := cdsGrupo;
   MovTransfBem.cdsConjunto := cdsConjunto;
   MovTransfBem.cdsLocalizacao := cdsLocal;
   MovTransfBem.cdsResponsavel := cdsResp;
   MovTransfBem.cdsSelBaixaBens := cdsDet;
   MovTransfBem.Progresso := Progresso;
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Conjunto := TCtrlConjunto.Create;
   Conjunto.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Localizacao := TCtrlLocalizacoes.Create;
   Localizacao.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MSTermo.Filtro.Add('SELBAIXA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.INATIVO = 0');
   MSGrupo.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupo.Filtro.Add('PLANOGRUPO.INATIVO = 0');
   MSLocal.Filtro.Add('LOCALIZACAO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSLocal.Filtro.Add('LOCALIZACAO.INATIVO = 0');
   MSBem.Filtro.Add('BEM.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSBem.Filtro.Add('BEM.FLGSAIDATEMP = 0');
   MSBem.Filtro.Add('BEM.BAIXATOTAL <> ''S''');
   //-------------------------------------------------------------------------------------
   // Bloqueia transferência de local/responsável qdo PARAMCAF.TIPOCONJUNTO = 1
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      MsgDlg('Parâmetros do sistema inválidos!', 'Erro', mtError, [mbOK], 0);
   //-------------------------------------------------------------------------------------
   bbtnSelLocal.Enabled := (ParamCAF.TIPOCONJUNTO = 0);
   bbtnSelResp.Enabled  := (ParamCAF.TIPOCONJUNTO = 0);
   //-------------------------------------------------------------------------------------
   TabConjunto.TabVisible := (ParamCAF.TIPOCONJUNTO <> 0);
   bbtnSelLocal3.Enabled := (ParamCAF.TIPOCONJUNTO = 0);
   //-------------------------------------------------------------------------------------
   sMascaraGrupoBem := ParamCAF.MASCCODGRUPO;
   sMascPict := '';
   if not MascaraOK(sMascaraGrupoBem,sMascPict,lNivel,iSoma,ind) then
   begin
      ShowMessage('Máscara de Grupo Inválida');
      bbtnSairClick(Self);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   bMovimento := False;
   pnlTransfConj.BringToFront;
   //-------------------------------------------------------------------------------------
   pgctlTransf.Height := 387;
   pgctlTransf.ActivePage := TabSelBem;
   //-------------------------------------------------------------------------------------
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.FormShow(Sender: TObject);
begin
   inherited;
   if not Conjunto.ValidarCentroCusto(Sistema.IdEmpresa) then
      MsgDlg(Conjunto.MessageInfo, 'Atenção', mtWarning, [mbOK], 0);
end;
//========================================================================================
function TfrmMTMovTransfBem.MascaraOK(sMascara : String; var sMascPict : String;
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
procedure TfrmMTMovTransfBem.LimpaCampos;
begin
   pnlDetalhe.Enabled  := False;
   edPlaca.Text := '';
   cdsSelBem.Close;
   SelTermoTransf(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   cdsGrupo.Close;
   cdsLocal.Close;
   cdsResp.Close;
   cdsConjunto.Close;
   cdsRateioN.Data := Conjunto.ListaRateioCustos(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   cdsConjunto3.Data := Conjunto.ListaConjunto(-1,-1);
   cdsLocal3.Data := Localizacao.ListaLocalizacao(-1,-1);
   cdsResp3.Data := Responsavel.ListaResponsavel(-2);
   cdsBensNoConjunto3.Close;
   sqlBensNoConjunto3.Prepare;
   sqlBensNoConjunto3.ParamByName('IDCONJUNTO').AsFloat := -1;
   sqlBensNoConjunto3.ParamByName('IDPESSOA').AsFloat := -1;
   sqlBensNoConjunto3.Open;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.SelTermoTransf(fIdPessoa, fIdSelBaixa : Extended);
begin
   cdsSelTermo.Data := MovTransfBem.ListaSelBaixa(fIdPessoa,fIdSelBaixa);
   if not cdsSelTermo.IsEmpty then
   begin
      cdsDet.Data := MovTransfBem.ListaSelTransfBens(cdsSelTermo.FieldByName('IDPESSOA').AsFloat,
                                                     cdsSelTermo.FieldByName('IDSELBAIXA').AsFloat);
   end else
   begin
      cdsDet.Data := MovTransfBem.ListaSelTransfBens(fIdPessoa,0);
   end;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.bbtnTermoTransfClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   MSTermo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSTermo.RetornouValor then
   begin
      SelTermoTransf(strtofloat(MSTermo.ValoresChave[1]),strtofloat(MSTermo.ValoresChave[0]));
      //----------------------------------------------------------------------------------
      if cdsSelTermo.FieldByName('SBXFLGEXECUTADO').AsInteger = 1 then
      begin
         MsgDlg('Termo de Transferencia já executado em ' + cdsSelTermo.FieldByName('SBXDTAEXECUTADO').AsString,
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
procedure TfrmMTMovTransfBem.bbtnSelBemClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if not MSBem.RetornouValor then
   begin
      cdsSelBem.Data := Bem.ListaBem(0,0);
      edPlaca.Text := '';
      edData.SetFocus;
   end else
   begin
      cdsSelBem.Data := Bem.ListaBem(strtofloat(MSBem.ValoresChave[0]),strtofloat(MSBem.ValoresChave[1]));
      edPlaca.Text := MSBem.ValoresChave[2];
      //----------------------------------------------------------------------------------
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,cdsSelBem.FieldByName('IDGRUPO').AsFloat);
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,cdsSelBem.FieldByName('IDCONJUNTO').AsInteger);
      cdsRateioN.Data := Conjunto.ListaRateioCustos(Sistema.IdEmpresa,cdsSelBem.FieldByName('IDCONJUNTO').AsFloat);
      cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa, cdsSelBem.FieldByName('IDLOCALIZACAO').AsFloat);
      cdsResp.Data := Responsavel.ListaResponsavel(cdsSelBem.FieldByName('IDRESPONSAVEL').AsFloat);
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
      begin
         MsgDlg('Bem em Saída Temporária!','Erro', mtError, [mbOk], 0);
         cdsSelBem.Data  := Bem.ListaBem(0, 0);
         edPlaca.Text := '';
         edData.SetFocus;
         exit;
      end else
      if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
      begin
         MsgDlg('Bem Baixado!','Erro', mtError, [mbOk], 0);
         cdsSelBem.Data  := Bem.ListaBem(0, 0);
         edPlaca.Text := '';
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      pnlDetalhe.Enabled := True;
      bbtnSelConjunto.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.edPlacaEnter(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.edPlacaExit(Sender: TObject);
var
   fIdBem : Extended;

begin
   inherited;
   if bbtnSair.Focused then Exit;
   //-------------------------------------------------------------------------------------
   if edPlaca.Text <> '' then
   begin
      fIdBem := Bem.PlacaIdBem(Sistema.IdEmpresa, edPlaca.Text);
      if fIdBem <= 0 then
      begin
         MsgDlg('Placa Inexistente','Erro', mtError, [mbOk], 0);
         cdsSelBem.Data  := Bem.ListaBem(0, 0);
         edPlaca.Text := '';
         edData.SetFocus;
      end else
      begin
         cdsSelBem.Data  := Bem.ListaBem(Sistema.IdEmpresa,fIdBem);
         edPlaca.Text    := cdsSelBem.FieldByName('PLACA').AsString;
         //-------------------------------------------------------------------------------
         cdsGrupo.Data    := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,cdsSelBem.FieldByName('IDGRUPO').AsFloat);
         cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,cdsSelBem.FieldByName('IDCONJUNTO').AsInteger);
         cdsRateioN.Data  := Conjunto.ListaRateioCustos(Sistema.IdEmpresa,cdsSelBem.FieldByName('IDCONJUNTO').AsFloat);
         cdsLocal.Data    := Localizacao.ListaLocalizacao(Sistema.IdEmpresa, cdsSelBem.FieldByName('IDLOCALIZACAO').AsFloat);
         cdsResp.Data     := Responsavel.ListaResponsavel(cdsSelBem.FieldByName('IDRESPONSAVEL').AsFloat);
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         if cdsSelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
         begin
            MsgDlg('Bem em Saída Temporária!','Erro', mtError, [mbOk], 0);
            cdsSelBem.Data  := Bem.ListaBem(0, 0);
            edPlaca.Text := '';
            edData.SetFocus;
            exit;
         end else
         if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
         begin
            MsgDlg('Bem Baixado!','Erro', mtError, [mbOk], 0);
            cdsSelBem.Data  := Bem.ListaBem(0, 0);
            edPlaca.Text := '';
            edData.SetFocus;
            exit;
         end;
         pnlDetalhe.Enabled := True;
         bbtnSelConjunto.SetFocus;
      end;
   end;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
   begin
      cdsConjunto.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,StrToFloat(MSConjunto.ValoresChave[0]));
      cdsRateioN.Data  := Conjunto.ListaRateioCustos(Sistema.IdEmpresa,StrToFloat(MSConjunto.ValoresChave[0]));
      cdsLocal.Data := Localizacao.ListaLocalizacao(Sistema.IdEmpresa, cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat);
      cdsResp.Data := Responsavel.ListaResponsavel(cdsConjunto.FieldByName('IDRESPONSAVEL').AsFloat);
   end;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.bbtnGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupo.RetornouValor then
   begin
      fGrupoNovo := MovTransfBem.RetornaGrupoContabil(Sistema.IdEmpresa,
                                                      cdsSelBem.FieldByName('IDCLASSEBEM').AsFloat,
                                                      cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat);
      if fGrupoNovo <> StrToFloat(MSGrupo.ValoresChave[0]) then
      begin
         MsgDlg('O Centro de Custo da Localização selecionada não está relacionado com o grupo contábil da placa '+
                cdsSelBem.FieldByName('PLACA').AsString +' ou está relacionado a mais que um grupo contábil.' + #13 +
                'Verifique o relacionamento da CLASSE do Bem com os possíveis Grupos Contábeis no Cadastro de Classes e '+
                'o relacionamento dos Centros de Custo com o Grupo Contábil do Bem no Cadastro de Grupo Contábil.',
                'Erro',mtError,[mbOk],0);
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,cdsSelBem.FieldByName('IDGRUPO').AsFloat);
      end else
      begin
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,StrToFloat(MSGrupo.ValoresChave[0]));
      end;
   end;      
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.bbtnSelLocalClick(Sender: TObject);
begin
   inherited;
   MSLocal.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSLocal.RetornouValor then
   begin
      cdsLocal.Data := Localizacao.ListaLocalizacao(StrToFloat(MSLocal.ValoresChave[1]), StrToFloat(MSLocal.ValoresChave[0]));
      cdsResp.Data := Responsavel.ListaResponsavel(cdsLocal.FieldByName('IDRESPONSAVEL').AsFloat);
   end;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.bbtnSelRespClick(Sender: TObject);
begin
   inherited;
   MSResp.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSResp.RetornouValor then
      cdsResp.Data := Responsavel.ListaResponsavel(StrToFloat(MSResp.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTMovTransfBem.bbtnConfirmarClick(Sender: TObject);
var
   iConjuntoNovo, iLocalNovo, iRespNovo : Integer;
   fTermo, fRespTermo,
   fIdSelBaixa, fResult : Extended;
   bOk : Boolean;
   dDataTermo : TDate;
   sProcesso : String;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if cdsSelBem.IsEmpty and cdsSelTermo.IsEmpty and cdsConjunto3.IsEmpty then
   begin
      MsgDlg('Selecione um Termo ou um Bem!','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Processa um Bem
   //-------------------------------------------------------------------------------------
   if pgctlTransf.ActivePage = TabBem then
   begin
      //----------------------------------------------------------------------------------
      // Criticas aos campos detalhe
      //----------------------------------------------------------------------------------
      if edData.Text = '' then
      begin
         MsgDlg('Informe a Data da Movimentação! ','Erro',mtError,[mbOk],0);
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
      if (cdsSelBem.FieldByName('IDCONJUNTO').AsFloat = cdsConjunto.FieldByName('IDCONJUNTO').AsFloat) and
         (cdsSelBem.FieldByName('IDGRUPO').AsFloat = cdsGrupo.FieldByName('IDGRUPO').AsFloat) and
         (cdsSelBem.FieldByName('IDLOCALIZACAO').AsFloat = cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat) and
         (cdsSelBem.FieldByName('IDRESPONSAVEL').AsFloat = cdsResp.FieldByName('IDRESPONSAVEL').AsFloat) then
      begin
         MsgDlg('Não foi feita a seleção do novo Conjunto/Localização/Responsável/Grupo Contábil do Bem!',
                'Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if dbeConjuntoNovo.Text = '' then
      begin
         MsgDlg('Selecione o novo Conjunto do bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if dbeGrupoNovo.Text = '' then
      begin
         MsgDlg('Selecione o novo Grupo do bem! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Verifica consistencia do novo conjunto
      //----------------------------------------------------------------------------------
      if not cdsConjunto.FieldByName('IDCONJUNTO').IsNull then
      begin
         fGrupoNovo := MovTransfBem.RetornaGrupoContabil(Sistema.IdEmpresa,
                                                         cdsSelBem.FieldByName('IDCLASSEBEM').AsFloat,
                                                         cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat);
         if fGrupoNovo < 0 then
         begin
            MsgDlg('O Centro de Custo da Localização do Conjunto selecionado não está relacionado com o grupo contábil da placa '+
                   cdsSelBem.FieldByName('PLACA').AsString +' ou está relacionado a mais que um grupo contábil.' + #13 +
                   'Verifique o relacionamento da CLASSE do Bem com os possíveis Grupos Contábeis no Cadastro de Classes e '+
                   'o relacionamento dos Centros de Custo com o Grupo Contábil do Bem no Cadastro de Grupo Contábil.',
                   'Erro',mtError,[mbOk],0);
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := True;
            edData.SetFocus;
            exit;
         end else
         begin
            cdsGrupo.Data := GrupoContab.ListaGrupoContab(cdsSelBem.FieldByName('IDPESSOA').AsFloat,fGrupoNovo);
            Application.ProcessMessages;
         end;
      end else
      begin
         cdsConjunto.Data := Conjunto.ListaConjunto(cdsSelBem.FieldByName('IDPESSOA').AsFloat,
                                                    cdsSelBem.FieldByName('IDCONJUNTOATUAL').AsFloat);
      end;
      //----------------------------------------------------------------------------------
      // Verifica consistencia da nova localizacao
      //----------------------------------------------------------------------------------
      if not cdsLocal.FieldByName('IDLOCALIZACAO').IsNull then
      begin
         if cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat <> cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat then
         begin
            if ParamCAF.TIPOCONJUNTO = 1 then
            begin
               if MsgDlg('Foi selecionada uma localização diferente da atualmente cadastrada para o '+
                         'Conjunto '+ cdsConjunto.FieldByName('DESCCONJUNTO').AsString +'.'+#13+#13+
                         'Se for realizar uma Transferência de Localização de todos os bens deste conjunto '+
                         'selecione SIM.',
                         'Atenção',mtConfirmation,[mbYes,mbNo],0) = mrNo then
               begin
                  MsgDlg('Foi selecionada uma localização diferente da atualmente cadastrada para o '+
                         'Conjunto '+ cdsConjunto.FieldByName('DESCCONJUNTO').AsString,
                         'Erro', mtError, [mbOk], 0);
                  bbtnConfirmar.Enabled := True;
                  bbtnCancelar.Enabled  := True;
                  edData.SetFocus;
                  exit;
               end;
            end;   
         end;
         //-------------------------------------------------------------------------------
         fGrupoNovo := MovTransfBem.RetornaGrupoContabil(Sistema.IdEmpresa,
                                                         cdsSelBem.FieldByName('IDCLASSEBEM').AsFloat,
                                                         cdsLocal.FieldByName('IDLOCALIZACAO').AsFloat);
         if fGrupoNovo < 0 then
         begin
            MsgDlg('O Centro de Custo da Localização selecionada não está relacionado com o grupo contábil da placa '+
                   cdsSelBem.FieldByName('PLACA').AsString +' ou está relacionado a mais que um grupo contábil.' + #13 +
                   'Verifique o relacionamento da CLASSE do Bem com os possíveis Grupos Contábeis no Cadastro de Classes e '+
                   'o relacionamento dos Centros de Custo com o Grupo Contábil do Bem no Cadastro de Grupo Contábil.',
                   'Erro', mtError, [mbOk], 0);
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := True;
            edData.SetFocus;
            exit;
         end else
         begin
            cdsGrupo.Data := GrupoContab.ListaGrupoContab(cdsSelBem.FieldByName('IDPESSOA').AsFloat,fGrupoNovo);
            Application.ProcessMessages;
         end;
      end else
      begin
         cdsLocal.Data := Localizacao.ListaLocalizacao(cdsConjunto.FieldByName('IDPESSOA').AsFloat, cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat);
         cdsResp.Data := Responsavel.ListaResponsavel(cdsConjunto.FieldByName('IDRESPONSAVEL').AsFloat);
      end;
      //----------------------------------------------------------------------------------
      // Verifica consistencia do novo Grupo Contabil
      //----------------------------------------------------------------------------------
      if cdsGrupo.FieldByName('IDGRUPO').IsNull then
         //Thaise SOL 152857 - Não existe IDGRUPOCONTABATUAL no cdsSelBem, portanto,
         //foi mudado para o IDGRUPO (IDGRUPOCONTABATUAL foi uma tentativa de renomear o nome do
         //do campo IDGRUPO.
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(cdsSelBem.FieldByName('IDPESSOA').AsFloat,
                                                       {cdsSelBem.FieldByName('IDGRUPOCONTABATUAL').AsFloat}
                                                       cdsSelBem.FieldByName('IDGRUPO').AsFloat);
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if not MovTransfBem.VerificaClasse(cdsSelBem.FieldByName('IDPESSOA').AsFloat,
                                         cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                         cdsSelBem.FieldByname('IDCLASSEBEM').AsFloat) then
      begin
         MsgDlg('O Grupo Contábil escolhido é inválido para a Classe do Bem '+
                cdsSelBem.FieldByName('PLACA').AsString + '.' + #13 +
                'Verifique os Grupos relacionados a Classe do Bem no Cadastro de Classes!',
                'Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if not MovTransfBem.VerificaGrupo(cdsSelBem.FieldByName('IDPESSOA').AsFloat,
                                        cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                        cdsConjunto.FieldByName('IDCONJUNTO').AsFloat) then
      begin
         MsgDlg('O Centro de Custo da localização do conjunto selecionado não está relacionado com o grupo contábil '+
                'do bem '+cdsSelBem.FieldByName('PLACA').AsString +' ou está relacionado a mais que um grupo contábil.' + #13 +
                'Verifique o relacionamento da classe com o grupo contábil do bem no Cadastro de Classes e '+ #13 +
                'o relacionamento do centro de custo com o grupo contábil do bem no Cadastro de Grupo Contábil.',
                'Erro', mtError, [mbOk], 0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      iConjuntoNovo := cdsConjunto.FieldByName('IDCONJUNTO').AsInteger;
      iLocalNovo    := cdsLocal.FieldByName('IDLOCALIZACAO').AsInteger;
      iRespNovo     := cdsResp.FieldByName('IDRESPONSAVEL').AsInteger;
      if (cdsSelBem.FieldbyName('IDCONJUNTO').AsInteger <> iConjuntoNovo) and
         ((cdsConjunto.FieldByName('IDLOCALIZACAO').AsInteger <> iLocalNovo) or
          (cdsConjunto.FieldByName('IDRESPONSAVEL').AsInteger <> iRespNovo)) then
      begin
         MsgDlg('Não é possível transferir um bem de conjunto e localização/responsável no mesmo movimento!',
                'Erro', mtError, [mbOk], 0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edData.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Verifica se o grupo novo possui as mesmas taxas de depreciacao do grupo atual
      //----------------------------------------------------------------------------------
      bOk := True;
      cdsGrupoTaxaDep1.Data := GrupoContab.ListaGrupoTaxaDep(cdsSelBem.FieldbyName('IDGRUPO').AsFloat,
                                                             Sistema.IdEmpresa);
      cdsGrupoTaxaDep2.Data := GrupoContab.ListaGrupoTaxaDep(cdsGrupo.FieldbyName('IDGRUPO').AsFloat,
                                                             Sistema.IdEmpresa);
      while not cdsGrupoTaxaDep1.EOF do
      begin
         if cdsGrupoTaxaDep1.FieldByName('TAXADEP').AsFloat <> cdsGrupoTaxaDep2.FieldByName('TAXADEP').AsFloat then
         begin
            if MsgDlg('As taxas de depreciação do Grupo Novo são diferentes das '+ #13 +
                      'taxas do Grupo Atual.' + #13 + #13 + 'Deseja Prosseguir ?',
                      'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
            begin
               bOk := True;
            end else
            begin
               bOk := False;
            end;
            Break;
         end;
         cdsGrupoTaxaDep1.Next;
         cdsGrupoTaxaDep2.Next;
      end;
      //----------------------------------------------------------------------------------
      if bOk then
      begin
         fResult := MovTransfBem.ExecutaTransferencia(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                                      cdsSelBem.FieldByName('IDBEM').AsFloat,
                                                      edData.Date,
                                                      False);  // leandro sig 133082
         //-------------------------------------------------------------------------------
         if fResult >= 0 then
            MsgDlg('Movimentação Realizada!','Atenção',mtInformation,[mbOk],0)
         else
            MsgDlg('Movimentação não Realizada!' + #13 + #13 +
                   'Causa : ' + MovTransfBem.MessageInfo,
                   'Erro', mtError, [mbOk], 0);
      end else
      begin
         MsgDlg('Movimentação não Realizada!' + #13 + #13 +
                'Causa : As taxas de depreciação do Grupo Novo são diferentes das taxas do Grupo Atual.',
                'Erro', mtError, [mbOk], 0);
      end;
      //----------------------------------------------------------------------------------
      LimpaCampos;
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      edData.SetFocus;
   end else
   //-------------------------------------------------------------------------------------
   // Processa um Termo de Transferência
   //-------------------------------------------------------------------------------------
   if pgctlTransf.ActivePage = TabSelBem then
   begin
      if edDataSel.Text = '' then
      begin
         MsgDlg('Informe a Data da Movimentação! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlTransf.Enabled := True;
         edDataSel.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if dbeTermo.Text = '' then
      begin
         MsgDlg('Informe o Termo de Seleção de Transferência! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         pgctlTransf.Enabled := True;
         bbtnTermoTransf.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      frmAguarde.Min := 0;
      frmAguarde.Max := cdsDet.RecordCount;
      frmAguarde.Mostra('Transferindo os Bens do Termo');
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      MovTransfBem.CreateThreadProgresso;
      try
         if MovTransfBem.ExecutaTermoTransferencia(Sistema.IdModulo,
                                                   cdsSelTermo.FieldByName('IDPESSOA').AsFloat,
                                                   Sistema.IdUsuario,
                                                   cdsSelTermo.FieldByName('IDSELBAIXA').AsFloat,
                                                   edDataSel.Date,
                                                   MovTransfBem.ProgressFileName) then
         begin
            frmAguarde.Apaga;
            MsgDlg('Movimentação Realizada!','Atenção',mtInformation,[mbOk],0);
         end else
         begin
            frmAguarde.Apaga;
            MsgDlg('Movimentação não Realizada!' + #13 +
                   'Causa : ' + MovTransfBem.MessageInfo,
                   'Erro', mtError, [mbOk], 0);
         end;
      finally
         MovTransfBem.FreeThreadProgresso;
      end;
      //----------------------------------------------------------------------------------
      LimpaCampos;
      pgctlTransf.Enabled := True;
      pgctlTransf.ActivePage := TabSelBem;
      bbtnTermoTransf.SetFocus;
   end else
   //-------------------------------------------------------------------------------------
   // Processa um Conjunto, gerando um Termo de Transferência e
   // processando-o automaticamente.
   // Está aba só está disponível para os clientes que usam o conjunto no "tipo 2"
   //-------------------------------------------------------------------------------------
   if pgctlTransf.ActivePage = TabConjunto then
   begin
      if edDataTransf3.Text = '' then
      begin
         MsgDlg('Informe a Data da Movimentação!','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         edDataTransf3.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if dbeDescConjunto3.Text = '' then
      begin
         MsgDlg('Informe o Conjunto!','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         bbtnSelConjunto3.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if cdsConjunto3.FieldbyName('IDRESPONSAVEL').AsFloat = cdsResp3.FieldbyName('IDRESPONSAVEL').AsFloat then
      begin
         MsgDlg('Informe o Responsável Novo!','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         bbtnSelResp3.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if MsgDlg('Todos os Bens do Conjunto ' + trim(cdsConjunto3.FieldByName('DESCCONJUNTO').AsString) +
                ' terão o Responsável modificado pela Transferência.' + #13 + #13 +
                'Deseja continuar ? ', 'Atenção', mtConfirmation,[mbNo,mbYes],0) = mrNo then
      begin
         MsgDlg('Movimentação cancelada pelo Usuário!', 'Informação', mtInformation, [mbOk], 0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         LimpaCampos;
         edDataTransf3.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Le os Dados para a Geração do Termo de Transferência
      //----------------------------------------------------------------------------------
      Application.CreateForm(TfrmMTInvProcSelTermo,frmMTInvProcSelTermo);
      frmMTInvProcSelTermo.FormStyle := FsNormal;
      frmMTInvProcSelTermo.Visible := False;
      frmMTInvProcSelTermo.edDataTermo.Date := edDataTransf3.Date;
      frmMTInvProcSelTermo.edDataTermo.ReadOnly := True;
      frmMTInvProcSelTermo.ShowModal;
      //----------------------------------------------------------------------------------
      if ((frmMTInvProcSelTermo.edTermo.Value <= 0 )  or
          (frmMTInvProcSelTermo.edTermo.Text = '')  or
          (frmMTInvProcSelTermo.edProcesso.Text = '')  or
          (frmMTInvProcSelTermo.edNomeResp.Text = '')) then
      begin
         frmMTInvProcSelTermo.Release;
         MsgDlg('Informe os dados corretos do Termo de Transferência! ','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         bbtnSelResp3.SetFocus;
         exit;
      end else
      //----------------------------------------------------------------------------------
      begin
         fTermo     := frmMTInvProcSelTermo.edTermo.Value;
         sProcesso  := frmMTInvProcSelTermo.edProcesso.Text;
         dDataTermo := frmMTInvProcSelTermo.edDataTermo.Date;
         fRespTermo := frmMTInvProcSelTermo.fResponsavel;
         frmMTInvProcSelTermo.Release;
      end;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      // Gera o termo de transferência
      //----------------------------------------------------------------------------------
      fIdSelBaixa := MovTransfBem.GerarTermoTransfConjunto(Sistema.IdEmpresa, fTermo, sProcesso,
                                                           dDataTermo, fRespTermo,
                                                           cdsConjunto3.FieldByName('IDCONJUNTO').AsFloat,
                                                           cdsLocal3.FieldByName('IDLOCALIZACAO').AsFloat,
                                                           cdsResp3.FieldByName('IDRESPONSAVEL').AsFloat);
      if fIdSelBaixa <= 0 then
         MsgDlg('Erro na Geração do Termo de Transferência!' + #13 +
                'Causa : ' + MovTransfBem.MessageInfo, 'Erro', mtError, [mbOk], 0);
      //----------------------------------------------------------------------------------
      // Carrega o termo de transferencia gerado
      //----------------------------------------------------------------------------------
      SelTermoTransf(Sistema.IdEmpresa, fIdSelBaixa);
      //----------------------------------------------------------------------------------
      // Processa o termo de transferencia gerado
      //----------------------------------------------------------------------------------
      frmAguarde.Min := 0;
      frmAguarde.Max := cdsDet.RecordCount;
      frmAguarde.Mostra('Processando Termo');
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      MovTransfBem.CreateThreadProgresso;
      try
         if MovTransfBem.ExecutaTermoTransferencia(Sistema.IdModulo,
                                                   cdsSelTermo.FieldByName('IDPESSOA').AsFloat,
                                                   Sistema.IdUsuario,
                                                   cdsSelTermo.FieldByName('IDSELBAIXA').AsFloat,
                                                   edDataTransf3.Date,
                                                   MovTransfBem.ProgressFileName) then
         begin
            frmAguarde.Apaga;
            MsgDlg('Movimentação Realizada!','Atenção',mtInformation,[mbOk],0);
         end else
         begin
            frmAguarde.Apaga;
            MsgDlg('Movimentação não Realizada!' + #13 +
                   'Causa : ' + MovTransfBem.MessageInfo,
                   'Erro', mtError, [mbOk], 0);
            MovTransfBem.RemoveTermoTransfConjunto(Sistema.IdEmpresa, fIdSelBaixa);
            MsgDlg('O Termo de Transferencia ' + floattostr(fTermo) + ' foi removido!',
                   'Informação', mtInformation, [mbOk], 0);
         end;
      finally
         MovTransfBem.FreeThreadProgresso;
      end;
      //----------------------------------------------------------------------------------
      LimpaCampos;
   end;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ParamCAF.Free;
   Responsavel.Free;
   Localizacao.Free;
   Conjunto.Free;
   GrupoContab.Free;
   Bem.Free;
   MovTransfBem.Free;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   LimpaCampos;
   pgctlTransf.Enabled := True;
   pgctlTransf.ActivePage := TabSelBem;
   pgctlTransf.Height := 387;
   bbtnConfirmar.Enabled := True;
   bbtnTermoTransf.SetFocus;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.FormKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if key = #13 then
   begin
      key := #0;
      Perform(Wm_NextDlgCtl, 0, 0);
   end;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.pgctlTransfChange(Sender: TObject);
begin
   inherited;
   if pgctlTransf.ActivePage = TabSelBem then
   begin
      pgctlTransf.Height := 394;
   end else
   if pgctlTransf.ActivePage = TabBem then
   begin
      pgctlTransf.Height := 208;
   end else
   if pgctlTransf.ActivePage = TabConjunto then
   begin
      pgctlTransf.Height := 394;
   end;
end;
//========================================================================================
// Processamento de Conjuntos
//========================================================================================
procedure TfrmMTMovTransfBem.bbtnSelConjunto3Click(Sender: TObject);
begin
   inherited;
   MSConjunto.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSConjunto.RetornouValor then
   begin
      cdsConjunto3.Data := Conjunto.ListaConjunto(Sistema.IdEmpresa,StrToFloat(MSConjunto.ValoresChave[0]));
      cdsLocal3.Data := Localizacao.ListaLocalizacao(cdsConjunto3.FieldByName('IDPESSOA').AsFloat,
                                                     cdsConjunto3.FieldByName('IDLOCALIZACAO').AsFloat);
      cdsResp3.Data := Responsavel.ListaResponsavel(cdsConjunto3.FieldByName('IDRESPONSAVEL').AsFloat);
      //----------------------------------------------------------------------------------
      cdsBensNoConjunto3.Close;
      sqlBensNoConjunto3.Prepare;
      sqlBensNoConjunto3.ParamByName('IDCONJUNTO').AsFloat := cdsConjunto3.FieldByName('IDCONJUNTO').AsFloat;
      sqlBensNoConjunto3.ParamByName('IDPESSOA').AsFloat := cdsConjunto3.FieldByName('IDPESSOA').AsFloat;
      sqlBensNoConjunto3.Open;
   end else
   begin
      cdsConjunto3.Data := Conjunto.ListaConjunto(-1,-1);
      cdsLocal3.Data := Localizacao.ListaLocalizacao(-1,-1);
      cdsResp3.Data := Responsavel.ListaResponsavel(-2);
      //----------------------------------------------------------------------------------
      cdsBensNoConjunto3.Close;
      sqlBensNoConjunto3.Prepare;
      sqlBensNoConjunto3.ParamByName('IDCONJUNTO').AsFloat := -1;
      sqlBensNoConjunto3.ParamByName('IDPESSOA').AsFloat := -1;
      sqlBensNoConjunto3.Open;
   end;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.bbtnSelLocal3Click(Sender: TObject);
begin
   inherited;
   MSLocal.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSLocal.RetornouValor then
   begin
      cdsLocal3.Data := Localizacao.ListaLocalizacao(StrToFloat(MSLocal.ValoresChave[1]), StrToFloat(MSLocal.ValoresChave[0]));
      cdsResp3.Data := Responsavel.ListaResponsavel(cdsLocal3.FieldByName('IDRESPONSAVEL').AsFloat);
   end;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTMovTransfBem.bbtnSelResp3Click(Sender: TObject);
begin
   inherited;
   MSResp.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSResp.RetornouValor then
      cdsResp3.Data := Responsavel.ListaResponsavel(StrToFloat(MSResp.ValoresChave[0]));
end;

end.


