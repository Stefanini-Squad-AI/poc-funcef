unit fMTUtilCorrGrupoBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, 
  TB97Tlbr, TB97, ExtCtrls, MontaSelect, Db, DBTables, Grids, Wwdbigrd, Wwdbgrid,
  Wwdatsrc, ComCtrls, DBCtrls, wwdbedit, Mask, TB97Ctls, CMTree, wwRiched, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  uCMTypes, uCtrlPadroes, uCtrlMovTransfBem, uCtrlResponsavel, uCtrlParamCAF,
  uCtrlDomBem, uCtrlGrupoContab, uCmSqlParams, IvEMulti;

type
  TfrmMTUtilCorrGrupoBem = class(TfrmOkCancelar)
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
    dsDet9: TwwDataSource;
    dbeTermo: TwwDBEdit;
    Label2: TLabel;
    dbgDet: TwwDBGrid;
    dbeDescGrupo: TwwDBEdit;
    dsSelBem: TwwDataSource;
    cdsSelBem: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    dsGrupo: TwwDataSource;
    sqlDet9: TCMSqlParams;
    cdsDet9: TCMClientDataSet;
    cdsSelTermo: TCMClientDataSet;
    dsSelTermo: TwwDataSource;
    MSGrupo: TMontaSelect;
    MSTermo: TMontaSelect;
    MSBem: TMontaSelect;
    cdsGrupoTaxaDep2: TCMClientDataSet;
    cdsGrupoTaxaDep1: TCMClientDataSet;
    Label4: TLabel;
    dbeGrupoNovo: TwwDBEdit;
    bbtnGrupo: TBitBtn;
    cdsReavaliacao: TCMClientDataSet;
    sqlReavaliacao: TCMSqlParams;
    dsDet: TwwDataSource;
    cdsDet: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure edDataExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnSelBemClick(Sender: TObject);
    procedure edPlacaEnter(Sender: TObject);
    procedure edPlacaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnTermoTransfClick(Sender: TObject);
    procedure edDataSelExit(Sender: TObject);
    procedure bbtnGrupoClick(Sender: TObject);
    procedure pgctlTransfChanging(Sender: TObject; var AllowChange: Boolean);
  private
    { Private declarations }
    MovTransfBem : TCtrlMovTransfBem;
    Responsavel  : TCtrlResponsavel;
    ParamCAF     : TCtrlParamCAF;
    Bem          : TCtrlDomBem;
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
    procedure BarraProgresso(const sLabelPrgBar: WideString; iMaxPrgBar, iPosPrgBar: Integer);
    procedure LimpaCampos;
    function  MascaraOK(sMascara : String;
                        var sMascPict : String;
                        var lNivel : Array of Integer;
                        var iSoma : Integer;
                        var ind : Integer) : Boolean;
  end;

var
  frmMTUtilCorrGrupoBem: TfrmMTUtilCorrGrupoBem;

implementation

uses uSistema, uMensErro, fAguarde;

{$R *.DFM}

procedure TfrmMTUtilCorrGrupoBem.BarraProgresso(const sLabelPrgBar: WideString; iMaxPrgBar, iPosPrgBar: Integer);
begin
   frmAguarde.Max := iMaxPrgBar;
   frmAguarde.Pos := iPosPrgBar;
   frmAguarde.Caption := sLabelPrgBar;
   Application.ProcessMessages;
end;

procedure TfrmMTUtilCorrGrupoBem.FormCreate(Sender: TObject);
begin
   inherited;
   MovTransfBem := TCtrlMovTransfBem.Create;
   MovTransfBem.InitializeAs(Padroes);
   MovTransfBem.cdsBem := cdsSelBem;
   MovTransfBem.cdsGrupo := cdsGrupo;
   MovTransfBem.cdsSelBaixaBens := cdsDet;
   //-------------------------------------------------------------------------------------
   Bem := TCtrlDomBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Responsavel := TCtrlResponsavel.Create;
   Responsavel.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   MSTermo.Filtro.Add('SELBAIXA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupo.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupo.Filtro.Add('PLANOGRUPO.INATIVO = 0');
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
      Raise Exception.Create('Parâmetros do sistema inválidos!');
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
   edData.Date := Date();
   pgctlTransf.ActivePage := TabSelBem;
   //-------------------------------------------------------------------------------------
   LimpaCampos;
end;
//========================================================================================
function TfrmMTUtilCorrGrupoBem.MascaraOK(sMascara : String; var sMascPict : String;
                                          var lNivel : Array of Integer;
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
procedure TfrmMTUtilCorrGrupoBem.LimpaCampos;
begin
   edPlaca.Text := '';
   cdsSelBem.Close;
   SelTermoTransf(Sistema.IdEmpresa,0);
   //-------------------------------------------------------------------------------------
   cdsGrupo.Close;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.SelTermoTransf(fIdPessoa, fIdSelBaixa : Extended);
begin
   cdsDet9.Close;
   cdsSelTermo.Data := MovTransfBem.ListaSelBaixa(fIdPessoa,fIdSelBaixa);
   if not cdsSelTermo.IsEmpty then
   begin
      cdsDet.Data := MovTransfBem.ListaSelTransfBens(cdsSelTermo.FieldByName('IDPESSOA').AsFloat,
                                                     cdsSelTermo.FieldByName('IDSELBAIXA').AsFloat);
      sqlDet9.Prepare;
      sqlDet9.ParamByName('IDSELBAIXA').AsFloat := cdsSelTermo.FieldByName('IDSELBAIXA').AsFloat;
      sqlDet9.ParamByName('IDPESSOA').AsFloat := cdsSelTermo.FieldByName('IDPESSOA').AsFloat;
      sqlDet9.Open;
   end else
   begin
      cdsDet.Data := MovTransfBem.ListaSelTransfBens(fIdPessoa,0);
      sqlDet9.Prepare;
      sqlDet9.ParamByName('IDSELBAIXA').AsFloat := 0;
      sqlDet9.ParamByName('IDPESSOA').AsFloat := fIdPessoa;
      sqlDet9.Open;
   end;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.edDataExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if edData.Text = '' then
   begin
      MsgDlg('Preencha o campo Data','Erro',mtError,[mbOk],0);
      edData.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.edDataSelExit(Sender: TObject);
begin
   inherited;
   if (bbtnCancelar.Focused) or (bbtnSair.Focused) then
      exit;
   //-------------------------------------------------------------------------------------
   if edDataSel.Text = '' then
   begin
      MsgDlg('Preencha o campo Data da Movimentação','Erro',mtError,[mbOk],0);
      edDataSel.SetFocus;
   end else
   begin
      bbtnTermoTransf.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.bbtnTermoTransfClick(Sender: TObject);
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
         bbtnConfirmar.Enabled := False;
         bbtnCancelar.Enabled  := True;
      end else
      begin
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := False;
      end;
   end else
   begin
      LimpaCampos;
      bbtnTermoTransf.SetFocus;
   end;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.bbtnSelBemClick(Sender: TObject);
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
      //----------------------------------------------------------------------------------
      edPlaca.Text := MSBem.ValoresChave[2];
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,cdsSelBem.FieldByName('IDGRUPO').AsFloat);
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
   end;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.edPlacaEnter(Sender: TObject);
begin
   inherited;
   LimpaCampos;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.edPlacaExit(Sender: TObject);
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
         //-------------------------------------------------------------------------------
         edPlaca.Text := cdsSelBem.FieldByName('PLACA').AsString;
         cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,cdsSelBem.FieldByName('IDGRUPO').AsFloat);
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
      end;
   end;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.bbtnGrupoClick(Sender: TObject);
begin
   inherited;
   MSGrupo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupo.RetornouValor then
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,StrToFloat(MSGrupo.ValoresChave[0]));
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.bbtnConfirmarClick(Sender: TObject);
var
   fResult : Extended;
   bOk : Boolean;

begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if cdsSelBem.IsEmpty and cdsSelTermo.IsEmpty then
   begin
      MsgDlg('Selecione um Termo ou um Bem!','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      exit;
   end;
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
      if cdsSelBem.FieldByName('IDGRUPO').AsFloat = cdsGrupo.FieldByName('IDGRUPO').AsFloat then
      begin
         MsgDlg('Não foi feita a seleção do Grupo Contábil Correto do Bem!',
                'Erro',mtError,[mbOk],0);
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
      // Verifica consistencia do novo Grupo Contabil
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
         exit;
      end;
      //----------------------------------------------------------------------------------
      if not MovTransfBem.VerificaGrupo(cdsSelBem.FieldByName('IDPESSOA').AsFloat,
                                        cdsGrupo.FieldByName('IDGRUPO').AsFloat,
                                        cdsSelBem.FieldByName('IDCONJUNTO').AsFloat) then
      begin
         MsgDlg('O Centro de Custo da localização do conjunto selecionado não está relacionado com o grupo contábil '+
                'do bem '+cdsSelBem.FieldByName('PLACA').AsString+' ou está relacionado a mais que um grupo contábil.' + #13 +
                'Verifique o relacionamento da classe com o grupo contábil do bem no Cadastro de Classes e '+ #13 +
                'o relacionamento do centro de custo com o grupo contábil do bem no Cadastro de Grupo Contábil.',
                'Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
         exit;
      end;
      //----------------------------------------------------------------------------------
      sqlReavaliacao.Prepare;
      sqlReavaliacao.ParamByName('IDBEM').AsInteger := cdsSelBem.FieldByName('IDBEM').AsInteger;
      sqlReavaliacao.ParamByName('IDPESSOA').AsInteger := cdsSelBem.FieldByName('IDPESSOA').AsInteger;
      sqlReavaliacao.Open;
      if not cdsReavaliacao.IsEmpty then
      begin
         MsgDlg('O bem já foi reavaliado!','Erro',mtError,[mbOk],0);
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
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
         if cdsGrupoTaxaDep1.FieldByName('TAXADEP').AsFloat = cdsGrupoTaxaDep2.FieldByName('TAXADEP').AsFloat then
         begin
            MsgDlg('As taxas de depreciação do Grupo Correto não são diferentes das '+ #13 +
                   'taxas do Grupo Atual.' + #13 + #13 + 'Use a TRANSFERENCIA DE BENS.',
                   'Erro', mtError, [mbOk], 0);
            bOk := False;
            Break;
         end;
         cdsGrupoTaxaDep1.Next;
         cdsGrupoTaxaDep2.Next;
      end;
      //----------------------------------------------------------------------------------
      if bOk then
      begin
         fResult := MovTransfBem.ExecutaCorrGrupoBem(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                                     cdsSelBem.FieldByName('IDBEM').AsFloat, edData.Date);
         //-------------------------------------------------------------------------------
         if fResult >= 0 then
            MsgDlg('Movimentação Realizada!','Atenção',mtInformation,[mbOk],0)
         else
            MsgDlg('Movimentação não Realizada!' + #13 + #13 +
                   'Causa : ' + MovTransfBem.MessageInfo,
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
         if cdsSelTermo.FieldByName('SBXFLGEXECUTADO').AsInteger = 1 then
         begin
            bbtnConfirmar.Enabled := False;
            bbtnCancelar.Enabled  := True;
         end else
         begin
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := False;
         end;
         pgctlTransf.Enabled := True;
         edDataSel.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if dbeTermo.Text = '' then
      begin
         MsgDlg('Selecione um Termo de Seleção de Transferência! ','Erro',mtError,[mbOk],0);
         if cdsSelTermo.FieldByName('SBXFLGEXECUTADO').AsInteger = 1 then
         begin
            bbtnConfirmar.Enabled := False;
            bbtnCancelar.Enabled  := True;
         end else
         begin
            bbtnConfirmar.Enabled := True;
            bbtnCancelar.Enabled  := False;
         end;
         pgctlTransf.Enabled := True;
         bbtnTermoTransf.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Verifica os parametros dos bens contidos no termo
      //----------------------------------------------------------------------------------
      cdsDet.First;
      while not cdsDet.EOF do
      begin
         //-------------------------------------------------------------------------------
         // Verifica se o grupo novo possui as mesmas taxas de depreciacao do grupo atual
         //-------------------------------------------------------------------------------
         cdsGrupoTaxaDep1.Data := GrupoContab.ListaGrupoTaxaDep(cdsDet.FieldbyName('IDGRUPOATUAL').AsFloat,
                                                                Sistema.IdEmpresa);
         cdsGrupoTaxaDep2.Data := GrupoContab.ListaGrupoTaxaDep(cdsDet.FieldbyName('IDGRUPO').AsFloat,
                                                                Sistema.IdEmpresa);
         bOk := True;
         while not cdsGrupoTaxaDep1.EOF do
         begin
            if cdsGrupoTaxaDep1.FieldByName('TAXADEP').AsFloat = cdsGrupoTaxaDep2.FieldByName('TAXADEP').AsFloat then
            begin
               bOk := False;
               Break;
            end;
            cdsGrupoTaxaDep1.Next;
            cdsGrupoTaxaDep2.Next;
         end;
         if not bOk then
         begin
            MsgDlg('As taxas de depreciação do Grupo Correto não são diferentes das '+ #13 +
                   'taxas do Grupo Atual no bem ' + cdsDet.FieldByName('PLACA').AsString + #13 + #13 +
                   'Altere o Termo ou Use a TRANSFERENCIA DE BENS.', 'Erro', mtError, [mbOk], 0);
            if cdsSelTermo.FieldByName('SBXFLGEXECUTADO').AsInteger = 1 then
            begin
               bbtnConfirmar.Enabled := False;
               bbtnCancelar.Enabled  := True;
            end else
            begin
               bbtnConfirmar.Enabled := True;
               bbtnCancelar.Enabled  := False;
            end;
            pgctlTransf.Enabled := True;
            edDataSel.SetFocus;
            exit;
         end;
         //-------------------------------------------------------------------------------
         sqlReavaliacao.Prepare;
         sqlReavaliacao.ParamByName('IDBEM').AsInteger    := cdsDet.FieldByName('IDBEM').AsInteger;
         sqlReavaliacao.ParamByName('IDPESSOA').AsInteger := cdsDet.FieldByName('IDPESSOA').AsInteger;
         sqlReavaliacao.Open;
         if not cdsReavaliacao.IsEmpty then
         begin
            MsgDlg('O bem ' + cdsDet.FieldByName('PLACA').AsString + ' já foi reavaliado!' + #13 + #13 +
                   'Altere o Termo ou Use a TRANSFERENCIA DE BENS.' ,'Erro',mtError,[mbOk],0);
            if cdsSelTermo.FieldByName('SBXFLGEXECUTADO').AsInteger = 1 then
            begin
               bbtnConfirmar.Enabled := False;
               bbtnCancelar.Enabled  := True;
            end else
            begin
               bbtnConfirmar.Enabled := True;
               bbtnCancelar.Enabled  := False;
            end;
            pgctlTransf.Enabled := True;
            edDataSel.SetFocus;
            exit;
         end;
         //-------------------------------------------------------------------------------
         if (cdsDet.FieldByName('IDLOCALATUAL').AsFloat <> cdsDet.FieldByName('IDLOCALIZACAO').AsFloat) or
            (cdsDet.FieldByName('IDCONJATUAL').AsFloat <> cdsDet.FieldByName('IDCONJUNTO').AsFloat) then
         begin
            MsgDlg('O Bem '+cdsDet.FieldByName('PLACA').AsString+' está com Localização/Conjunto ' + #13 +
                   'diferentes dos atuais.' + #13 + #13 + 'Altere o Termo ou Use a TRANSFERENCIA DE BENS.' ,
                   'Erro', mtError, [mbOk], 0);
            if cdsSelTermo.FieldByName('SBXFLGEXECUTADO').AsInteger = 1 then
            begin
               bbtnConfirmar.Enabled := False;
               bbtnCancelar.Enabled  := True;
            end else
            begin
               bbtnConfirmar.Enabled := True;
               bbtnCancelar.Enabled  := False;
            end;
            edDataSel.SetFocus;
            exit;
         end;
         //-------------------------------------------------------------------------------
         cdsDet.Next;
      end;
      //----------------------------------------------------------------------------------
      frmAguarde.Min := 0;
      frmAguarde.Max := cdsDet.RecordCount;
      frmAguarde.Mostra('Transferindo os Bens do Termo');
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      MovTransfBem.CreateThreadProgresso;
      try
         if MovTransfBem.ExecutaTermoCorrGrupoBem(Sistema.IdModulo,
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
   end;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled := True;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   //-------------------------------------------------------------------------------------
   if cdsSelBem.IsEmpty and cdsSelTermo.IsEmpty then
   begin
      MsgDlg('Selecione um Termo ou um Bem!','Erro',mtError,[mbOk],0);
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
      exit;
   end;
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
      if MovTransfBem.EstornaCorrGrupoBem(Sistema.IdModulo, Sistema.IdEmpresa, Sistema.IdUsuario,
                                          cdsSelBem.FieldByName('IDBEM').AsFloat, edData.Date, edData.Date) then
      begin
         MsgDlg('Movimentação Realizada!','Atenção',mtInformation,[mbOk],0)
      end else
      begin
         MsgDlg('Movimentação não Realizada!' + #13 + #13 +
                'Causa : ' + MovTransfBem.MessageInfo,
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
         bbtnCancelar.Enabled := True;
         pgctlTransf.Enabled := True;
         bbtnTermoTransf.SetFocus;
         exit;
      end;
      //----------------------------------------------------------------------------------
      if MovTransfBem.EstornaTermoCorrGrupoBem(Sistema.IdModulo,
                                               cdsSelTermo.FieldByName('IDPESSOA').AsFloat,
                                               Sistema.IdUsuario,
                                               cdsSelTermo.FieldByName('IDSELBAIXA').AsFloat,
                                               edDataSel.Date, edDataSel.Date) then
      begin
         MsgDlg('Movimentação Realizada!', 'Atenção', mtInformation, [mbOk], 0);
      end else
      begin
         MsgDlg('Movimentação não Realizada!' + #13 + 'Causa : ' + MovTransfBem.MessageInfo,
                'Erro', mtError, [mbOk], 0);
      end;
      //----------------------------------------------------------------------------------
      LimpaCampos;
      pgctlTransf.Enabled := True;
      pgctlTransf.ActivePage := TabSelBem;
      bbtnTermoTransf.SetFocus;
   end;
   bbtnConfirmar.Enabled  := True;
   bbtnCancelar.Enabled   := True;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   ParamCAF.Free;
   Responsavel.Free;
   GrupoContab.Free;
   Bem.Free;
   MovTransfBem.Free;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.FormKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;
   if key = #13 then
   begin
      key := #0;
      Perform(Wm_NextDlgCtl, 0, 0);
   end;
end;
//========================================================================================
procedure TfrmMTUtilCorrGrupoBem.pgctlTransfChanging(Sender: TObject; var AllowChange: Boolean);
begin
   inherited;
   if pgctlTransf.ActivePage = TabSelBem then
      pgctlTransf.Height := 205
   else
      pgctlTransf.Height := 387;
end;

end.

