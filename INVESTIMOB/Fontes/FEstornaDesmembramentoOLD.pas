unit FEstornaDesmembramento;

// ------------------------------------------------------------------------------------------------
//
//      Estorna o Desmembramento de Imóveis
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  08/01/2002
//	Data de Término   :  08/01/2002
//
// -------------------------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  mImovel, Db, DBTables, Wwquery, mImovelDesmembra, Mask, DBCtrls, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, uCtrlMovDesmembramento;

type
  TfrmEstornaDesmembramento = class(TFrmOkCancelarImob)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    molImovelDesmembra1: TmolImovelDesmembra;
    qryEventoImovel: TwwQuery;
    dsEventoImovel: TwwDataSource;
    DBmemEvento: TDBMemo;
    DBedtCabecalhoEvento: TDBEdit;
    DBedtUsuario: TDBEdit;
    Panel5: TPanel;
    DBgrdBemOriginal: TwwDBGrid;
    qryDesmembraImovel: TwwQuery;
    qryDesmembraImovelIDIMOVELINI: TFloatField;
    qryDesmembraImovelIDIMOVELFIM: TFloatField;
    qryDesmembraImovelDMRDATA: TDateTimeField;
    qryDesmembraImovelNOMEIMOVEL: TStringField;
    dsDesmembraImovel: TwwDataSource;
    qryDesmembraImovelIDEVENTOIMOVELINI: TFloatField;
    qryEventoImovelIDEVENTOIMOVEL: TFloatField;
    qryEventoImovelEVIDATA: TDateTimeField;
    qryEventoImovelEVICABECALHO: TStringField;
    qryEventoImovelEVIDESCRICAO: TMemoField;
    qryEventoImovelIDUSUARIO: TFloatField;
    qryEventoImovelUSUARIO_EXTENSO: TStringField;
    qryDesmembraImovelIDCONJUNTOFIM: TFloatField;
    qryDesmembraImovelIDEVENTOIMOVELFIM: TFloatField;

    procedure bbtnCancelarClick(Sender: TObject);
    procedure molImovelDesmembra1btnBuscaImovelClick(Sender: TObject);
    procedure molImovelDesmembra1btnLimpaImovelClick(Sender: TObject);
    procedure DBgrdBemOriginalCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure DBgrdBemOriginalTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private { Private declarations }

    CtrlMovDesmembramento : TCtrlMovDesmembramento;

    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;
    function  VerificaExclusao : Boolean;
    function  DesfazDesmembramentoCAF: boolean;
    function  ExcluiImoveis: boolean;

  public { Public declarations }

  end;

var
  frmEstornaDesmembramento: TfrmEstornaDesmembramento;



implementation
{$R *.DFM}
uses
   uSistema, uModulo, dImobiliario, dLookImobiliario, uComunsImobiliario, uVerificaPreenchimento, uMensErro,
   uFuncoesImob, uDataBase, dBaseDados, uEventoImovel, DMS, DCAF;


procedure TfrmEstornaDesmembramento.FormCreate(Sender: TObject);
begin
  inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   CtrlMovDesmembramento := TCtrlMovDesmembramento.Create;
   CtrlMovDesmembramento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                    Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                    ComunsImobiliario.MensErroMT);
end;

procedure TfrmEstornaDesmembramento.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlMovDesmembramento );
  inherited;
end;

procedure TfrmEstornaDesmembramento.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   pnlFundo.Enabled     := False;
   bbtnCancelar.Enabled := False;
   bbtnSair.Enabled     := False;
end;


procedure TfrmEstornaDesmembramento.HabilitaBotoes;
begin
   bbtnCancelar.Enabled := True;
   bbtnSair.Enabled     := True;
   pnlFundo.Enabled     := True;
   Screen.Cursor        := crDefault;
end;


procedure TfrmEstornaDesmembramento.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   if VerificaExclusao then begin
      DesabilitaBotoes;
      try
         StartTransacao;
         if DesfazDesmembramentoCAF then begin
            if ExcluiImoveis then begin
               CommitTransacao;
               MsgDlg('Desmembramento desfeito com sucesso!', 'Informação', mtInformation, [mbOk], 0);
               molImovelDesmembra1btnLimpaImovelClick(self);
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


function TfrmEstornaDesmembramento.VerificaExclusao: Boolean;
begin
   Result := True;
   if molImovelDesmembra1.iImovel < 1 then begin
      MsgDlg('Selecione o Imóvel que originou o desmembramento', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;
   if qryDesmembraImovel.IsEmpty then begin
      MsgDlg('Não existem imóveis resultantes de desmembramento para o imóvel selecionado', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;
   if MsgDlg('Confirma a Exclusão do Desmembramento ?', 'Confirmação', mtConfirmation,
             [mbYes, mbNo], 0) = mrNo then begin
      Result := False;
   end;
end;


function TfrmEstornaDesmembramento.DesfazDesmembramentoCAF: boolean;
begin
   Result := True;
   try
      if dtmCAF.qryImovelxBem.isEmpty then begin
         raise Exception.Create('Não foi possível encontrar os bens relacionados ao imovel original em IMOVELXBEM');
      end;

      // Exclui ImovelxBem para cada imovel resultante
      try
         qryDesmembraImovel.First;
         while not qryDesmembraImovel.EOF do begin
            LimpaParametros(dtmCAF.qryDelImovelxBem);
            dtmCAF.qryDelImovelxBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
            dtmCAF.qryDelImovelxBem.ParamByName('PIDIMOVEL').AsInteger := qryDesmembraImovelIDIMOVELFIM.AsInteger;
            dtmCAF.qryDelImovelxBem.ExecSQL;
            qryDesmembraImovel.Next;
         end;
      except
         raise Exception.Create('Erro ao excluir em IMOVELXBEM');
      end;

      // Desfaz o desmembramento a partir dos bens do Imóvel original
      dtmCAF.qryImovelxBem.First;
      while not(dtmCAF.qryImovelxBem.EOF) do begin

         CtrlMovDesmembramento.OpenTransaction := False;
         if not CtrlMovDesmembramento.EstornaDesmembramento(Sistema.IdModulo,
                                                            Sistema.IdEmpresa,
                                                            Sistema.IdUsuario,
                                                            dtmCAF.qryImovelxBemIDBEM.AsInteger,
                                                            qryEventoImovelEVIDATA.asDateTime,
                                                            Date() ) then begin
            raise Exception.Create( CtrlMovDesmembramento.MessageInfo );
         end;

         dtmCAF.qryImovelxBem.Next;
      end;
   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;



function TfrmEstornaDesmembramento.ExcluiImoveis: boolean;
begin
   Result := True;
   try
      qryDesmembraImovel.First;
      while not qryDesmembraImovel.EOF do begin

         // Exclui em RateioDepreciação
         LimpaParametros(dtmCAF.qryDelRateioDepreciacao);
         dtmCAF.qryDelRateioDepreciacao.ParamByName('PIDEMPRESA').AsInteger  := Sistema.IdEmpresa;
         dtmCAF.qryDelRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger := qryDesmembraImovelIDCONJUNTOFIM.AsInteger;
         dtmCAF.qryDelRateioDepreciacao.ExecSQL;

         // Exclui em Conjunto
         LimpaParametros(dtmCAF.qryDelConjunto);
         dtmCAF.qryDelConjunto.ParamByName('PIDPESSOA').AsInteger   := Sistema.IdEmpresa;
         dtmCAF.qryDelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qryDesmembraImovelIDCONJUNTOFIM.AsInteger;
         dtmCAF.qryDelConjunto.ExecSQL;

         // exclui os imóveis em DESMEMBRAIMOVEL
         LimpaParametros(dtmCAF.qryDelDesmembraImovel);
         dtmCAF.qryDelDesmembraImovel.ParamByName('PIDIMOVELFIM').AsInteger := qryDesmembraImovelIDIMOVELFIM.AsInteger;
         dtmCAF.qryDelDesmembraImovel.ExecSQL;

         // exclui os eventos: inicial e final
         EventoImovel.ExcluiEvento(qryDesmembraImovelIDEVENTOIMOVELINI.asInteger, False);
         EventoImovel.ExcluiEvento(qryDesmembraImovelIDEVENTOIMOVELFIM.asInteger, False);

         // exclui o imóvel resultante em ATIVOCOTA
         LimpaParametros(dtmCAF.qryDelAtivoCota);
         dtmCAF.qryDelAtivoCota.ParamByName('PIDIMOVEL').AsInteger := qryDesmembraImovelIDIMOVELFIM.AsInteger;
         dtmCAF.qryDelAtivoCota.ExecSQL;

         // exclui o imóvel resultante em IMOVEL
         LimpaParametros(dtmCAF.qryDelImovel);
         dtmCAF.qryDelImovel.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         dtmCAF.qryDelImovel.ParamByName('PIDIMOVEL').AsInteger := qryDesmembraImovelIDIMOVELFIM.AsInteger;
         dtmCAF.qryDelImovel.ExecSQL;

         qryDesmembraImovel.Next;
      end;

      // Altera a situação do Imóvel original p/ "Em Carteira" = "N"
      EventoImovel.AlteraSituacaoImovel(molImovelDesmembra1.iImovel, 'N');
   except
      Result := False;
      Raise;
      Repaint;
   end;
end;



procedure TfrmEstornaDesmembramento.molImovelDesmembra1btnBuscaImovelClick(Sender: TObject);
begin
   inherited;
   molImovelDesmembra1.btnBuscaImovelClick(Sender);
   if molImovelDesmembra1.MS_ImovelInativo.RetornouValor then begin

      // Abre imóveis resultantes do desmembramento
      with qryDesmembraImovel do begin
         LimpaParametros(qryDesmembraImovel);
         ParamByName('PIDIMOVELORIG').asInteger := molImovelDesmembra1.iImovel;
         Open;
      end;

      // Abre os bens do imóvel original para desfazer o desmembramento
      with dtmCAF.qryImovelxBem do begin
         LimpaParametros(dtmCAF.qryImovelxBem);
         ParamByName('PIDIMOVEL').asInteger := molImovelDesmembra1.iImovel;
         Open;
      end;

      // Abre Evento de registro do desmembramento
      with qryEventoImovel do begin
         LimpaParametros(qryEventoImovel);
         ParamByName('PIDEVENTOIMOVEL').asInteger := qryDesmembraImovelIDEVENTOIMOVELINI.AsInteger;
         Open;
      end;
   end;
end;



procedure TfrmEstornaDesmembramento.molImovelDesmembra1btnLimpaImovelClick(
  Sender: TObject);
begin
   inherited;
   molImovelDesmembra1.btnLimpaImovelClick(Sender);
   LimpaParametros(qryDesmembraImovel);
   LimpaParametros(qryEventoImovel);
   LimpaParametros(dtmCAF.qryImovelXBem);
end;


procedure TfrmEstornaDesmembramento.DBgrdBemOriginalCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

procedure TfrmEstornaDesmembramento.DBgrdBemOriginalTopRowChanged(
  Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



end.
