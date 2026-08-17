{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Nº SIG......: 113136  
Data........: 04/07/2022 
Responsável.: Cássio Florencio Rovaroto
Descrição...: Implementação da provisão de custos de imóveis.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina...........: bbtnCancelarClick
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 04/12/2013
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
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
-------------------------------------------------------------------------------}

unit FEstornaRemembramentoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, uSistema,
  Buttons, TB97Tlbr, TB97, ExtCtrls, mImovelAtivo, Mask, DBCtrls, Grids, uEventoImovel, uMensErro,
  Wwdbigrd, Wwdbgrid, Db, DBClient, uCMClientDataSet, uCtrlRemembramento,
  uDataBase, dBaseDados, Wwquery,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab,
  uCtrlProvisaoImovel, DCAF, UFuncoesImob;

type
  TfrmEstornaRemembramentoMT = class(TFrmOkCancelarImob)
    Panel5: TPanel;
    DBgrdBemOriginal: TwwDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    DBmemEvento: TDBMemo;
    DBedtCabecalhoEvento: TDBEdit;
    DBedtUsuario: TDBEdit;
    molImovelAtivo: TmolImovelAtivo;
    cdsImoveisOriginais: TCMClientDataSet;
    cdsEventoImovel: TCMClientDataSet;
    dsImoveisOriginais: TDataSource;
    dsEventoImovel: TDataSource;
    cdsImovelXBem: TCMClientDataSet;
    dbeditData: TDBEdit;
    procedure molImovelAtivobtnBuscaImovelClick(Sender: TObject);
    procedure molImovelAtivobtnLimpaImovelClick(Sender: TObject);
    procedure DBgrdBemOriginalCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdBemOriginalTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private

    CtrlRemembramento        : TCtrlRemembramento;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
    CtrlProvisaoImovel : TCtrlProvisaoImovel;//Cássio Rovaroto - SIG nº 113136
    { Private declarations }
    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;
    function  VerificaExclusao : Boolean;
  public
    { Public declarations }
  end;

var
  frmEstornaRemembramentoMT: TfrmEstornaRemembramentoMT;

implementation

{$R *.DFM}



procedure TfrmEstornaRemembramentoMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlRemembramento        := TCtrlRemembramento.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
   CtrlRemembramento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlRemembramento);

   //Cássio Rovaroto - SIG nº 113136
   CtrlProvisaoImovel := TCtrlProvisaoImovel.Create;
   CtrlProvisaoImovel.InitializeAs(CtrlRemembramento);
end;



procedure TfrmEstornaRemembramentoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(CtrlRemembramento);
   FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   FreeAndNil(CtrlProvisaoImovel); //Cássio Rovaroto - SIG nº 113136
   inherited;
end;



procedure TfrmEstornaRemembramentoMT.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   pnlFundo.Enabled     := False;
   bbtnCancelar.Enabled := False;
   bbtnSair.Enabled     := False;
end;


procedure TfrmEstornaRemembramentoMT.HabilitaBotoes;
begin
   bbtnCancelar.Enabled := True;
   bbtnSair.Enabled     := True;
   pnlFundo.Enabled     := True;
   Screen.Cursor        := crDefault;
end;



procedure TfrmEstornaRemembramentoMT.molImovelAtivobtnBuscaImovelClick(Sender: TObject);
begin
   inherited;
   molImovelAtivo.btnBuscaImovelClick(Sender);
   if molImovelAtivo.iImovel > 0 then begin

      // Abre imóveis resultantes do desmembramento
      cdsImoveisOriginais.Data := CtrlRemembramento.ListaImoveisRemembrados(molImovelAtivo.iImovel);

      // Abre os bens do imóvel original para desfazer o desmembramento
      cdsImovelXBem.Data       := CtrlRemembramento.ListaImovelXBem(molImovelAtivo.iImovel);

      // Abre Evento de registro do desmembramento
      cdsEventoImovel.Data     := CtrlRemembramento.ListaEventoImovel(cdsImoveisOriginais.FieldByName('IDEVENTOIMOVELFIM').AsInteger);
   end;
end;



procedure TfrmEstornaRemembramentoMT.molImovelAtivobtnLimpaImovelClick(Sender: TObject);
begin
   inherited;
   molImovelAtivo.btnLimpaImovelClick(Sender);
end;



procedure TfrmEstornaRemembramentoMT.DBgrdBemOriginalCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   // faz com que as linhas do grid tenham cores alternadas
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



procedure TfrmEstornaRemembramentoMT.DBgrdBemOriginalTopRowChanged(Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmEstornaRemembramentoMT.bbtnCancelarClick(Sender: TObject);
var
  qryDelPlanoPatroxImovel : TwwQuery;
  sSQL: string;
begin
   inherited;
   qryDelPlanoPatroxImovel := TwwQuery.Create(nil);
   qryDelPlanoPatroxImovel.DatabaseName := FuncaoGeral.DataBaseName;
   try
     if VerificaExclusao then begin
        DesabilitaBotoes;
        try
           StartTransacao;

           // Vando - SOL 154328-5901 / KTN 1373449

             // apaga a PLANOPATROXIMOVEL
             sSQL := 'DELETE FROM PLANOPATROXIMOVEL WHERE IDIMOVEL = ' + IntToStr(molImovelAtivo.iImovel);
             qryDelPlanoPatroxImovel.SQL.Clear;
             qryDelPlanoPatroxImovel.SQL.Add(sSQL);
             qryDelPlanoPatroxImovel.ExecSQL;

             // apaga a PLANOPATROXVIGENCIAIMOB
             sSQL := 'DELETE FROM PLANOPATROXVIGENCIAIMOB WHERE IDIMOVEL = ' + IntToStr(molImovelAtivo.iImovel);
             qryDelPlanoPatroxImovel.SQL.Clear;
             qryDelPlanoPatroxImovel.SQL.Add(sSQL);
             qryDelPlanoPatroxImovel.ExecSQL;

             // apaga a PLANOPATROXVIGENCIAIMOB
             cdsImovelXBem.First;
             while not cdsImovelXBem.Eof do
             begin
               sSQL := 'DELETE FROM PLANOPATROXVIGENCIABEM WHERE IDBEM = ' + cdsImovelXBem.FieldByName('IDBEM').AsString;
               qryDelPlanoPatroxImovel.SQL.Clear;
               qryDelPlanoPatroxImovel.SQL.Add(sSQL);
               qryDelPlanoPatroxImovel.ExecSQL;

               sSQL := 'DELETE FROM PLANOPATROXBEM WHERE IDBEM = ' + cdsImovelXBem.FieldByName('IDBEM').AsString;
               qryDelPlanoPatroxImovel.SQL.Clear;
               qryDelPlanoPatroxImovel.SQL.Add(sSQL);
               qryDelPlanoPatroxImovel.ExecSQL;
               cdsImovelXBem.next;
             end;

             // apaga a IMOVEL
             sSQL := 'UPDATE IMOVEL SET IMOCODIGO = NULL WHERE IDIMOVEL = ' + IntToStr(molImovelAtivo.iImovel);
             qryDelPlanoPatroxImovel.SQL.Clear;
             qryDelPlanoPatroxImovel.SQL.Add(sSQL);
             qryDelPlanoPatroxImovel.ExecSQL;
           // Vando - SOL 154328-5901 / KTN 1373449 - FIM


           cdsImoveisOriginais.DisableControls;
           if CtrlRemembramento.EstornaRemembramento(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,cdsImoveisOriginais,cdsImovelXBem,cdsEventoImovel) then
           begin
              // Vando - SOL 154328-5901 / KTN 1373449 - INICIO
              {sSQL := 'DELETE FROM PLANOPATROXIMOVEL WHERE IDIMOVEL = ' + IntToStr(molImovelAtivo.iImovel);
              qryDelPlanoPatroxImovel.SQL.Add(sSQL);
              qryDelPlanoPatroxImovel.ExecSQL;
              }// Vando - SOL 154328-5901 / KTN 1373449 - FIM

              CommitTransacao;
              MsgDlg('Remembramento desfeito com sucesso!', 'Informação', mtInformation, [mbOk], 0);
              molImovelAtivo.btnLimpaImovelClick(Self);

              cdsImoveisOriginais.Data := CtrlRemembramento.ListaImoveisRemembrados(-1);
              cdsImovelXBem.Data       := CtrlRemembramento.ListaImovelXBem(-1);
              cdsEventoImovel.Data     := CtrlRemembramento.ListaEventoImovel(-1);

              Repaint;
           end else begin
              RollBackTransacao;
              MsgDlg(CtrlRemembramento.MessageInfo, 'Erro', mtError, [mbOk], 0);
           end;
           cdsImoveisOriginais.EnableControls;
        except
           RollBackTransacao;
           Raise;
           Repaint;
           MsgDlg('Ocorreram ERROS durante a tentativa de desfazer o Remembramento', 'Erro', mtError, [mbOk], 0);
           Repaint;
        end;
        HabilitaBotoes;
     end;
   finally
    FreeAndNil(qryDelPlanoPatroxImovel);
   end;

end;



function TfrmEstornaRemembramentoMT.VerificaExclusao: Boolean;
begin
   Result := True;

    // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
    if dbeditData.text <> '' then
    if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,dbeditData.Text) then
    begin
         MsgDlg ('Período bloqueado pela Contabilidade','Aviso',mtWarning,[mbok],0);
         Result := False;
         exit;
    end;
    // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
    
   if molImovelAtivo.iImovel < 1 then begin
      MsgDlg('Selecione o Imóvel que original', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   if cdsImoveisOriginais.IsEmpty then begin
      MsgDlg('Não existem imóveis resultantes de remembramento para o imóvel selecionado', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   if MsgDlg('Confirma a Exclusão do Remembramento ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
      Result := False;
   end;
end;



procedure TfrmEstornaRemembramentoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
  if dbeditData.text <> '' then
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,dbeditData.Text) then
  begin
       MsgDlg ('Período bloqueado pela Contabilidade','Aviso',mtWarning,[mbok],0);
       exit;
  end;
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
end;

end.

