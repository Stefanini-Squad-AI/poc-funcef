{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 113136
Data........: 04/07/2022 
Responsável.: Cássio Florencio Rovaroto
Descrição...: Implementação da provisão de custos de imóveis.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8222
Nº KINTANA..: 1577546
Data........: 28/03/2012
Responsável.: Wylliam Leite da Silva
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
Padrão       : 5.10.18 em diante
Pendência    : 27573
Responsável  : Daniel Simões
Data         : 12/03/2008
Descrição    : Ajuste do Help Context...
--------------------------------------------------------------------------------
Pendência   : 21124
Responsável : Daniel Simões
Data        : 26/07/2006
Descrição   : Correção na hora de carregar o filtro do MontaSelect...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FExecRemembramento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, uCtrlRemembramento, Db, DBClient, uModuloImobiliario,
  uCMClientDataSet, mImovelMestre, uSistema, uComunsImobiliario, uVerificaPreenchimento, uMensErro,
  DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid, wwdblook, DMS, uDataBase, dBaseDados,
  mLocalizacao, uCAF,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab,
  uCtrlProvisaoImovel;

type
  TfrmExecRemembramento = class(TfrmWizardMT)
    Label3: TLabel;
    edtDataOper: TCMDateTimePicker;
    molImovelMestre: TmolImovelMestre;
    Label2: TLabel;
    dsImovelARemembrar: TDataSource;
    cdsImovelAtivo: TCMClientDataSet;
    cdsTipoImovel: TCMClientDataSet;
    dsTipoImovel: TDataSource;
    dbgImovelARemembrar: TwwDBGrid;
    cdsBens: TCMClientDataSet;
    dsBens: TDataSource;
    wwDBGrid2: TwwDBGrid;
    Label5: TLabel;
    memEvento: TMemo;
    spdSeleciona: TSpeedButton;
    spdExcluiSelecat: TSpeedButton;
    dblkTipoImovel: TwwDBLookupCombo;
    Label4: TLabel;
    Label1: TLabel;
    edtNomeImovel: TEdit;
    cdsImovelResult: TCMClientDataSet;
    cdsBemResult: TCMClientDataSet;
    molLocalizacao: TmolLocalizacao;
    procedure molImovelMestrebtnBuscaImovelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure spdSelecionaClick(Sender: TObject);
    procedure dbgImovelARemembrarCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgImovelARemembrarTopRowChanged(Sender: TObject);
    procedure spdExcluiSelecatClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure molImovelMestrebtnLimpaImovelClick(Sender: TObject);
  private
    { Private declarations }
    CtrlRemembramento : TCtrlRemembramento;
    sFiltro           : String;
    sListaImovel      : String;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
    CtrlProvisaoImovel : TCtrlProvisaoImovel; //Cássio Rovaroto - SIG nº 113136
    cdsAux            : TCMClientDataSet; //Cássio Rovaroto - SIG nº 113136
    procedure ProcessaMudancadePagina;

    function VerificaPreenchimentoSelecao: boolean;
    function VerificaPreenchimentoRemembra: boolean;

  public
    { Public declarations }
  end;

var
  frmExecRemembramento: TfrmExecRemembramento;

implementation

{$R *.DFM}



procedure TfrmExecRemembramento.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlRemembramento := TCtrlRemembramento.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
   CtrlRemembramento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
   cdsTipoImovel.Data := CtrlRemembramento.ListaTipoImovel;
   sFiltro            := dtmMS.MS_ImovelAtivo.Filtro.Text;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlRemembramento);
   //Cássio Rovaroto - SIG nº 113136 - Início
   CtrlProvisaoImovel := TCtrlProvisaoImovel.Create;
   CtrlProvisaoImovel.InitializeAs(CtrlRemembramento);
   cdsAux := TCMClientDataSet.Create(nil);
   //Cássio Rovaroto - SIG nº 113136 - Fim
end;



procedure TfrmExecRemembramento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlRemembramento.Free;
   dtmMS.MS_ImovelAtivo.Filtro.Text := sFiltro; // Daniel Simões - 21124
   FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   FreeAndNil(CtrlProvisaoImovel);//Cássio Rovaroto - SIG nº 113136
   FreeAndNil(cdsAux);
   inherited;
end;



procedure TfrmExecRemembramento.molImovelMestrebtnBuscaImovelClick(Sender: TObject);
begin
   inherited;
   dtmMS.MS_ImovelAtivo.Filtro.Text                                   := sFiltro;
   molImovelMestre.btnBuscaImovelClick(Sender);
   cdsImovelAtivo.Data                                                := CtrlRemembramento.ListaImovelAtivo(-1);
   TFloatField(cdsImovelAtivo.FieldByName('SUMVALCTB')).DisplayFormat := ',0.00';
   TFloatField(cdsImovelAtivo.FieldByName('SUMVALCTB')).EditMask      := ',0.00';

   dtmMS.MS_ImovelAtivo.Filtro.Add('I.IDIMOVELMESTRE = ' + IntToStr(molImovelMestre.iMestre));
   sListaImovel := '';

   cdsImovelResult.Data := CtrlRemembramento.ListaImovelVazio;
end;



procedure TfrmExecRemembramento.spdSelecionaClick(Sender: TObject);
begin
   inherited;
   if ( edtDataOper.Date = 0 ) then
   begin
      MsgDlg('Favor preencher a data da operação!','InvestImob',mtWarning,[mbOK],0);
      edtDataOper.SetFocus;
      Exit;
   end;
       // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataOper.Text) then
  begin
       MsgDlg ('Período bloqueado pela Contabilidade','Aviso',mtWarning,[mbok],0);
       exit;
  end;
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

   dtmMS.MS_ImovelAtivo.Executar;
   if dtmMS.MS_ImovelAtivo.RetornouValor then
   begin

      if not CtrlRemembramento.ImovelAlugado(StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[1])) then
      begin
         if not cdsImovelAtivo.Locate('IDIMOVEL',StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[1]),[]) then
         begin
            cdsImovelAtivo.Append;
            cdsImovelAtivo.FieldByName('IDIMOVEL').AsInteger   := StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[1]);
            cdsImovelAtivo.FieldByName('IMONOME').AsString     := dtmMS.MS_ImovelAtivo.ValoresChave[3];
            cdsImovelAtivo.FieldByName('IMOAREA').AsFloat      := StrToFloat(dtmMS.MS_ImovelAtivo.ValoresChave[8]); 
            cdsImovelAtivo.FieldByName('SUMVALCTB').AsCurrency := CtrlRemembramento.RetornaSaldoContabil(cdsImovelAtivo.FieldByName('IDIMOVEL').AsInteger,
                                                                                                         edtDataOper.Date);
            cdsImovelAtivo.Post;
         end;
      end
      else
      begin
         MsgDlg('O Imóvel selecionado possui contrato ativo de locação!','InvestImob',mtWarning,[mbOK],0);
      end;


   end;
end;



procedure TfrmExecRemembramento.spdExcluiSelecatClick(Sender: TObject);
begin
   inherited;
   if MsgDlg('Confirma excluir esse imóvel da lista?','InvestImob',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      cdsImovelAtivo.Delete;
end;



procedure TfrmExecRemembramento.btnContinuarClick(Sender: TObject);
begin
   inherited;
    ProcessaMudancadePagina;
end;



procedure TfrmExecRemembramento.ProcessaMudancadePagina;
var
  iIdImovelAnt: Integer;
  dPercentuaImovelAnt: Double;
begin
  iIdImovelAnt := -1;
   case PagControle.ActivePageIndex of
      0 : begin
             btnContinuar.Enabled := True;
             btnVoltar.Enabled    := False;
             btnConfirmar.Enabled := False;
          end;
      1 : begin
             if VerificaPreenchimentoSelecao then
             begin
                btnConfirmar.Enabled := True;

                sListaImovel := '';
                cdsImovelAtivo.DisableControls;
                cdsImovelAtivo.Filter   := '';
                cdsImovelAtivo.Filtered := False;
                cdsImovelAtivo.First;
                while not cdsImovelAtivo.eof do
                begin
                   if sListaImovel <> '' then sListaImovel := sListaImovel  + ',';
                   sListaImovel := sListaImovel + cdsImovelAtivo.FieldByName('IDIMOVEL').AsString;
                   cdsImovelAtivo.Next;
                end;
                cdsImovelAtivo.First;
                cdsImovelAtivo.EnableControls;

                cdsAux.Data := CtrlProvisaoImovel.VerificaProvisaoImoveis(sListaImovel);

                while not cdsAux.Eof do
                begin
                  if iIdImovelAnt <> cdsAux.FieldByName('IDIMOVEL').AsInteger then
                  begin
                    iIdImovelAnt := cdsAux.FieldByName('IDIMOVEL').AsInteger;
                    if dPercentuaImovelAnt <> 0 then
                    begin
                      if cdsAux.FieldByName('PERCENTUAL').asFloat <> dPercentuaImovelAnt then
                      begin
                        MessageDlg('Não é possível remembrar imóveis que possuam percentuais de provisão de custo diferentes.', mtWarning, [mbOK], 0);
                        PagControle.ActivePageIndex := 0;
                        btnContinuar.Enabled := True;
                        btnVoltar.Enabled    := False;
                        btnConfirmar.Enabled := False;
                        Exit;
                      end;
                    end;
                    dPercentuaImovelAnt := cdsAux.FieldByName('PERCENTUAL').asFloat;
                  end;
                  cdsAux.Next;
                end;

                cdsBens.Filter   := '';
                cdsBens.Filtered := False;
                cdsBens.Data := CtrlRemembramento.ListaBemImovel(sListaImovel);
             end
             else
             begin
                PagControle.ActivePageIndex := 0;
                btnContinuar.Enabled := True;
                btnVoltar.Enabled    := False;
                btnConfirmar.Enabled := False;
             end;
          end;
   end;
end;



function TfrmExecRemembramento.VerificaPreenchimentoSelecao: boolean;
begin
   Result           := False;
   try
      if ( length(trim(molImovelMestre.edtImovel.Text)) = 0 ) then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel Mestre!', molImovelMestre.btnBuscaImovel);

      if ( edtDataOper.Date = 0 ) then
         raise EValidacao.CreateVal('É necessário indicar a Data da Operação!', edtDataOper);
      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
      if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataOper.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataOper);
      // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
      if cdsImovelAtivo.IsEmpty then
         raise EValidacao.CreateVal('É necessário selecionar imóveis a remembrar!', dbgImovelARemembrar);

      if cdsImovelAtivo.RecordCount < 2 then
         raise EValidacao.CreateVal('É necessário selecionar pelo ao menos 2 (dois) imóveis a remembrar!', dbgImovelARemembrar);

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



function TfrmExecRemembramento.VerificaPreenchimentoRemembra: boolean;
begin
   Result           := False;
   try

      if Trim(molLocalizacao.edtLocalizacao.Text) = '' then
         raise EValidacao.CreateVal('É necessário indicar a localização do Novo Imóvel!', molLocalizacao.btnBuscaLocalizacao);

      if ( length(trim(edtNomeImovel.Text)) = 0 ) then
         raise EValidacao.CreateVal('É necessário indicar o Nome do Novo Imóvel!', molImovelMestre.btnBuscaImovel);

      if ( length(trim(memEvento.Text)) = 0 ) then
         raise EValidacao.CreateVal('É necessário indicar as observações do Evento!', memEvento);

      if ( dblkTipoImovel.LookupValue = '' ) then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Imóvel!', dblkTipoImovel);

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



procedure TfrmExecRemembramento.dbgImovelARemembrarCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;

end;



procedure TfrmExecRemembramento.dbgImovelARemembrarTopRowChanged(
  Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecRemembramento.btnConfirmarClick(Sender: TObject);
var
   fValorTotal : Extended;
   fAreaTotal  : Extended;
begin
   inherited;
   if VerificaPreenchimentoRemembra then
   begin
      fValorTotal := 0;
      fAreaTotal  := 0;
      cdsBens.DisableControls;
      cdsImovelAtivo.DisableControls;
      cdsImovelAtivo.First;
      while not cdsImovelAtivo.eof do
      begin
         fValorTotal := fValorTotal + cdsImovelAtivo.FieldByName('SUMVALCTB').AsCurrency;
         fAreaTotal  := fAreaTotal  + cdsImovelAtivo.FieldByName('IMOAREA').AsFloat;
         cdsImovelAtivo.Next;
      end;
      cdsImovelAtivo.First;

      cdsImovelResult.Insert;
      cdsImovelResult.FieldByName('IDIMOVELMESTRE').AsInteger   := molImovelMestre.iMestre;
      cdsImovelResult.FieldByName('NO_IMOVEL_RESULT').AsInteger := 1;
      cdsImovelResult.FieldByName('NOME_IMOVEL').AsString       := edtNomeImovel.Text;
      cdsImovelResult.FieldByName('PERCENT_DESMEMBRA').AsFloat  := 100;
      cdsImovelResult.FieldByName('CC_DESMEMBRA').AsFloat       := fValorTotal;
      cdsImovelResult.FieldByName('CODTIPIMOVEL').AsString      := dblkTipoImovel.LookupValue;
      cdsImovelResult.Post;

      cdsBemResult.Data := CtrlRemembramento.ListaBemResult(Sistema.IDEmpresa);


      cdsBens.First;
      while not cdsBens.eof do
      begin
         if not cdsBemResult.Locate('IXBGRUPO',cdsBens.FieldByName('IXBGRUPO').AsString,[]) then
         begin
            cdsBemResult.Append;
            cdsBemResult.FieldByName('DESBEM').AsString         := molImovelMestre.sMestre + ' - ' + edtNomeImovel.Text + ' - ' + CAF.GrupoExtenso(cdsBens.FieldByName('IXBGRUPO').AsString);
            cdsBemResult.FieldByName('IDCLASSEBEM').AsInteger   := cdsBens.FieldByName('IDCLASSEBEM').AsInteger;
            cdsBemResult.FieldByName('IDSITUACAO').AsInteger    := ModuloImobiliario.InvestImob.iIdSituacao;
            cdsBemResult.FieldByName('IDCONJUNTO').AsInteger    := cdsBens.FieldByName('IDCONJUNTO').AsInteger;
            cdsBemResult.FieldByName('DESCCONJUNTO').AsString   := cdsBens.FieldByName('DESCCONJUNTO').AsString;
            cdsBemResult.FieldByName('IDLOCALIZACAO').AsInteger := molLocalizacao.iLocalizacao;
            cdsBemResult.FieldByName('IDRESPONSAVEL').AsInteger := molLocalizacao.iResponsavel;
            cdsBemResult.FieldByName('DESCLOCAL').AsString      := cdsBens.FieldByName('DESCLOCAL').AsString;
            cdsBemResult.FieldByName('IDGRUPO').AsInteger       := cdsBens.FieldByName('IDGRUPO').AsInteger;
            cdsBemResult.FieldByName('DESCGRUPO').AsString      := cdsBens.FieldByName('DESCGRUPO').AsString;
            cdsBemResult.FieldByName('IXBGRUPO').AsString       := cdsBens.FieldByName('IXBGRUPO').AsString;
            cdsBemResult.FieldByName('FLGSEMPLACA').AsInteger   := cdsBens.FieldByName('FLGSEMPLACA').AsInteger;
            cdsBemResult.FieldByName('PROPBAIXA').AsInteger     := 0;
         end;
         cdsBens.Next;
      end;
      cdsBens.First;

      if CtrlRemembramento.EfetuaRemembramento(Sistema.IdModulo,
                                            Sistema.IdEmpresa,
                                            Sistema.IdUsuario,
                                            edtDataOper.Date,
                                            memEvento.Lines.Text,
                                            molImovelMestre.sMestre,
                                            fAreaTotal,
                                            cdsImovelResult,
                                            cdsImovelAtivo,
                                            cdsBens,
                                            cdsBemResult
                                           ) then
      begin
         PagControle.ActivePageIndex := 0;
         ProcessaMudancadePagina;
         molImovelMestre.btnLimpaImovelClick(Sender);
         MsgDlg('Remembramento efetuado com sucesso!','InvestImob',mtWarning,[mbOK],0);
         cdsImovelAtivo.Data := CtrlRemembramento.ListaImovelAtivo(-1);
      end
      else
      begin
         MsgDlg('Não foi possivel efetuar Remembramento ' + CtrlRemembramento.MessageInfo + '!','InvestImob',mtWarning,[mbOK],0);
         PagControle.ActivePageIndex := 0;
         ProcessaMudancadePagina;
      end;
      cdsBens.EnableControls;
      cdsImovelAtivo.EnableControls;
   end;
    // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataOper.Text) then
  begin
       MsgDlg ('Período bloqueado pela Contabilidade - 1º Vencimento!','Aviso',mtWarning,[mbok],0);
       exit;
  end;
end;



procedure TfrmExecRemembramento.molImovelMestrebtnLimpaImovelClick(
  Sender: TObject);
begin
   inherited;
   molImovelMestre.btnLimpaImovelClick(Sender);
end;

end.
