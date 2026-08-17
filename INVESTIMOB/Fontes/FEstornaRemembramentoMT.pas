unit FEstornaRemembramentoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, uSistema,
  Buttons, TB97Tlbr, TB97, ExtCtrls, mImovelAtivo, Mask, DBCtrls, Grids, uEventoImovel, uMensErro,
  Wwdbigrd, Wwdbgrid, Db, DBClient, uCMClientDataSet, uCtrlEstornaRemembramento, uCtrlMovRemembramento,
  uDataBase, dBaseDados;

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
    procedure molImovelAtivobtnBuscaImovelClick(Sender: TObject);
    procedure molImovelAtivobtnLimpaImovelClick(Sender: TObject);
    procedure DBgrdBemOriginalCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdBemOriginalTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  private

    CtrlEstornaRemembramento : TCtrlEstornaRemembramento;
    CtrlMovRemembramento     : TCtrlMovRemembramento;

    { Private declarations }
    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;
    function  VerificaExclusao : Boolean;
    function  DesfazRemembramentoCAF: boolean;
    function  ExcluiImoveis: boolean;
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
   CtrlEstornaRemembramento := TCtrlEstornaRemembramento.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.IdEspAcesso,Sistema.UsaPlanoPatro);
   CtrlEstornaRemembramento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

   CtrlMovRemembramento     := TCtrlMovRemembramento.Create;
   CtrlMovRemembramento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                   Sistema.ConnectionSide, Sistema.AppRemoteServer, True)

end;



procedure TfrmEstornaRemembramentoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   FreeAndNil(CtrlEstornaRemembramento);
   FreeAndNil(CtrlMovRemembramento);
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
      cdsImoveisOriginais.Data := CtrlEstornaRemembramento.ListaImoveisRemembrados(molImovelAtivo.iImovel);

      // Abre os bens do imóvel original para desfazer o desmembramento
      cdsImovelXBem.Data       := CtrlEstornaRemembramento.ListaImovelXBem(molImovelAtivo.iImovel);

      // Abre Evento de registro do desmembramento
      cdsEventoImovel.Data     := CtrlEstornaRemembramento.ListaEventoImovel(cdsImoveisOriginais.FieldByName('IDEVENTOIMOVELFIM').AsInteger);
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
begin
   inherited;
   if VerificaExclusao then begin
      DesabilitaBotoes;
      try
         StartTransacao;
         if DesfazRemembramentoCAF then begin
            if ExcluiImoveis then begin
               CommitTransacao;
               MsgDlg('Remembramento desfeito com sucesso!', 'Informação', mtInformation, [mbOk], 0);
               molImovelAtivo.btnLimpaImovelClick(Self);
               Repaint;
            end else begin
               Abort;
            end;
         end else begin
            Abort;
         end;
      except
         RollBackTransacao;
         Raise;
         Repaint;
         MsgDlg('Ocorreram ERROS durante a tentativa de desfazer o Desmembramento', 'Erro', mtError, [mbOk], 0);
         Repaint;
      end;
      HabilitaBotoes;
   end;
end;



function TfrmEstornaRemembramentoMT.VerificaExclusao: Boolean;
begin
   Result := True;
   if molImovelAtivo.iImovel < 1 then begin
      MsgDlg('Selecione o Imóvel que original', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   if cdsImoveisOriginais.IsEmpty then begin
      MsgDlg('Não existem imóveis resultantes de desmembramento para o imóvel selecionado', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   if MsgDlg('Confirma a Exclusão do Desmembramento ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
      Result := False;
   end;
end;



function TfrmEstornaRemembramentoMT.DesfazRemembramentoCAF: boolean;
begin
   Result := True;
   try
      if cdsImovelxBem.isEmpty then begin
         raise Exception.Create('Não foi possível encontrar os bens relacionados ao imovel original em IMOVELXBEM');
      end;

      // Exclui ImovelxBem para cada imovel resultante
      try
         cdsImoveisOriginais.First;
         while not cdsImoveisOriginais.EOF do begin
            // Deleta ImovelXBem
            CtrlEstornaRemembramento.ExcluiImovelXBem(Sistema.IdEmpresa, cdsImoveisOriginais.FieldByName('IDIMOVELFIM').AsInteger);
            cdsImoveisOriginais.Next;
         end;
      except
         raise Exception.Create('Erro ao excluir em IMOVELXBEM');
      end;

      // Desfaz o desmembramento a partir dos bens do Imóvel original
      cdsImovelXBem.First;
      while not cdsImovelXBem.EOF do begin
         CtrlMovRemembramento.OpenTransaction := False;
         if not CtrlMovRemembramento.EstornaRemembramento(Sistema.IdModulo,
                                                          Sistema.IdEmpresa,
                                                          Sistema.IdUsuario,
                                                          cdsImovelXBem.FieldByName('IDBEM').AsInteger,
                                                          cdsEventoImovel.FieldByName('EVIDATA').asDateTime,
                                                          Date() ) then begin
            raise Exception.Create( CtrlMovRemembramento.MessageInfo );
         end;

         cdsImovelXBem.Next;
      end;
   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;



function TfrmEstornaRemembramentoMT.ExcluiImoveis: boolean;
begin
   Result := True;
   try
      cdsImoveisOriginais.First;
      while not cdsImoveisOriginais.EOF do begin

         CtrlEstornaRemembramento.ExcluiImoveis(Sistema.IdEmpresa,
                                                cdsImoveisOriginais.fieldByName('IDCONJUNTOFIM').AsInteger,
                                                cdsImoveisOriginais.fieldByName('IDIMOVELFIM').AsInteger,
                                                cdsImoveisOriginais.fieldByName('IDEVENTOIMOVELINI').asInteger,
                                                cdsImoveisOriginais.fieldByName('IDEVENTOIMOVELFIM').asInteger);

         cdsImoveisOriginais.Next;
      end;
      // Altera a situação do Imóvel original p/ "Em Carteira" = "N"
      EventoImovel.AlteraSituacaoImovel(molImovelAtivo.iImovel, 'N');
   except
      Result := False;
      Raise;
      Repaint;
   end;
end;




end.

