unit FEstornaDesmembraObra;

// -----------------------------------------------------------------------------
//
//      Estorna o Desmembramento de Obras
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  01/04/2003
//	Data de Término   :  01/04/2003
//
// -----------------------------------------------------------------------------
// -------------------------------------------------------------------------------------------------
{-------------------------------------------------------------------------------
----------------------- ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------
--------------------------------------------------------------------------------
Rotina...........: ExcluiImoveis
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 13/03/2014
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
--------------------------------------------------------------------------------
N. Sol..........: 172902/8222
N. Kintana......: 1577546
Data............: 04/04/2012
Responsável.....: Wylliam Leite da Silva
Descrição.......: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------
SOL..........: 179583
Kintana......: 1655783
Responsável..: Helen V. Bianchi
Data.........: 04/05/2012
Descrição....: Adicionado uma verificação no Historico antes de desfazer
-------------------------------------------------------------------------------
}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  mImovel, Db, DBTables, Wwquery, mImovelDesmembra, Mask, DBCtrls, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, mObraDesmembra, {uCtrlCafObra}uCtrlImobObra, uCtrlMovDesmembramento,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab;

type
  TfrmEstornaDesmembraObra = class(TFrmOkCancelarImob)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    DBmemEvento: TDBMemo;
    DBedtCabecalhoEvento: TDBEdit;
    DBedtUsuario: TDBEdit;
    Panel5: TPanel;
    DBgrdBemOriginal: TwwDBGrid;
    qryDesmembraObra: TwwQuery;
    dsDesmembraObra: TwwDataSource;
    molObraDesmembra1: TmolObraDesmembra;
    qryDesmembraObraIDCAFOBRA: TFloatField;
    qryDesmembraObraIDOBRARESULT: TFloatField;
    qryDesmembraObraDTAENCERRAOBRA: TDateTimeField;
    qryDesmembraObraDSC_OBRA: TStringField;
    qryDesmembraObraDSC_OBRARESULT: TStringField;
    qryDesmembraObraEVIDATA: TDateTimeField;
    qryDesmembraObraEVICABECALHO: TStringField;
    qryDesmembraObraEVIDESCRICAO: TMemoField;
    qryDesmembraObraUSUARIO_EXTENSO: TStringField;
    qryDesmembraImovel: TwwQuery;
    qryDesmembraImovelIDIMOVELINI: TFloatField;
    qryDesmembraImovelIDIMOVELFIM: TFloatField;
    qryDesmembraImovelDMRDATA: TDateTimeField;
    qryDesmembraImovelNOMEIMOVEL: TStringField;
    qryDesmembraImovelIDEVENTOIMOVELINI: TFloatField;
    qryDesmembraImovelIDCONJUNTOFIM: TFloatField;
    qryDesmembraImovelIDEVENTOIMOVELFIM: TFloatField;
    dbeditData: TDBEdit;

    procedure bbtnCancelarClick(Sender: TObject);
    procedure DBgrdBemOriginalCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure DBgrdBemOriginalTopRowChanged(Sender: TObject);
    procedure molObraDesmembra1btnBuscaObraClick(Sender: TObject);
    procedure molObraDesmembra1btnLimpaObraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private { Private declarations }

    //CtrlCafObra : TCtrlCafObra;
    CtrlCafObra : TCtrlImobObra;
    CtrlMovDesmembramento: TCtrlMovDesmembramento;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
    
    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;
    function  VerificaExclusao : Boolean;
    function  DesfazDesmembraObraCAF: Boolean;
    function  DesfazDesmembraTerrenoCAF: Boolean;
    function  ExcluiImoveis: boolean;
    procedure DelSegregacao(iIdImovelFim: integer);

  public { Public declarations }

  end;

var
  frmEstornaDesmembraObra: TfrmEstornaDesmembraObra;



implementation
{$R *.DFM}
uses
   uSistema, uModuloInvestImob, dImobiliario, dLookImobiliario, uComunsImobiliario, uVerificaPreenchimento, uMensErro,
   uFuncoesImob, uDataBase, dBaseDados, uEventoImovel, DMS, DCAF;



procedure TfrmEstornaDesmembraObra.FormCreate(Sender: TObject);
begin
   inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   //CtrlCafObra := TCtrlCafObra.Create;
   CtrlCafObra := TCtrlImobObra.Create;
   CtrlMovDesmembramento := TCtrlMovDesmembramento.Create;
   CtrlCafObra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                          ComunsImobiliario.MensErroMT);
   CtrlMovDesmembramento.InitializeAs( CtrlCafObra );
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlCafObra);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
end;

procedure TfrmEstornaDesmembraObra.FormDestroy(Sender: TObject);
begin
   FreeAndNil( CtrlCafObra );
   FreeAndNil( CtrlMovDesmembramento );
   FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   inherited;
end;


procedure TfrmEstornaDesmembraObra.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   pnlFundo.Enabled     := False;
   bbtnCancelar.Enabled := False;
   bbtnSair.Enabled     := False;
end;


procedure TfrmEstornaDesmembraObra.HabilitaBotoes;
begin
   bbtnCancelar.Enabled := True;
   bbtnSair.Enabled     := True;
   pnlFundo.Enabled     := True;
   Screen.Cursor        := crDefault;
end;


procedure TfrmEstornaDesmembraObra.bbtnCancelarClick(Sender: TObject);
var bResult : Boolean;
begin
   inherited;
   bResult := True;
   if VerificaExclusao then begin
      DesabilitaBotoes;
      try
         try
            StartTransacao;
            bResult := DesfazDesmembraObraCAF;
            if bResult then bResult := DesfazDesmembraTerrenoCAF;
            if bResult then bResult := ExcluiImoveis;
            if bResult then begin
               CommitTransacao;
               MsgDlg('Desmembramento desfeito com sucesso!', 'Informação', mtInformation, [mbOk], 0);
               molObraDesmembra1btnLimpaObraClick( Self );
               Repaint;
            end else begin
               Abort;
            end;
         except
            RollBackTransacao;
            MsgDlg('Ocorreram ERROS durante a tentativa de desfazer o Desmembramento', 'Erro', mtError, [mbOk], 0);
            Repaint;
         end;
      finally
         HabilitaBotoes;
      end;
   end;
end;


function TfrmEstornaDesmembraObra.VerificaExclusao: Boolean;
begin
   Result := True;

   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,dbeditData.Text) then
      begin
         Result := False;
         Exit;
      end;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
  
   if molObraDesmembra1.iObra < 0 then begin
      MsgDlg('Selecione a obra que originou o desmembramento', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;
   if qryDesmembraObra.IsEmpty then begin
      MsgDlg('Não existem obras resultantes de desmembramento para a obra selecionada', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;
   if MsgDlg('Confirma a Exclusão do Desmembramento da obra ?', 'Confirmação', mtConfirmation,
             [mbYes, mbNo], 0) = mrNo then begin
      Result := False;
   end;
end;


function TfrmEstornaDesmembraObra.DesfazDesmembraObraCAF: boolean;
begin
   Result := True;
   try
      CtrlCafObra.OpenTransaction := False;
      if not CtrlCafObra.EstornaDesmembraObra(Sistema.IdModulo,
                                              Sistema.IdEmpresa,
                                              molObraDesmembra1.iObra ) then begin
         //raise Exception.create( CtrlCafObra.MessageInfo );
         if CtrlCafObra.MessageInfo <> '' then
            raise Exception.create( CtrlCafObra.MessageInfo );
         if (CtrlCafObra.iHistorico ) = 1 then
             Result := False;
         //Helen - SOL:179583 KTN : 1655783 - Fim
      end;

   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.Message,'Aviso',mtWarning,[mbOk],0);
      end;
   end;
end;



function TfrmEstornaDesmembraObra.DesfazDesmembraTerrenoCAF: Boolean;
begin
   Result := True;
   try
      // O imóvel não possuia bem de terreno para ser desmembrado
      if dtmCAF.qryImovelxBem.isEmpty then Exit;

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
                                                            qryDesmembraObraEVIDATA.asDateTime,
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


function TfrmEstornaDesmembraObra.ExcluiImoveis: boolean;
var bExcluiCAF : Boolean;
    iEventoIni : Integer;
begin
   Result := True;
   try
      // Não existiam bens associados ao terreno, portanto, não foram desmembrados
      if dtmCAF.qryImovelxBem.isEmpty then
           bExcluiCAF := False
      else bExcluiCAF := True;

      qryDesmembraImovel.First;
      iEventoIni := qryDesmembraImovelIDEVENTOIMOVELINI.asInteger;
      while not qryDesmembraImovel.EOF do begin

         // Exclui as tabelas do CAF
         if bExcluiCAF then begin
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
         end;

         // exclui os imóveis em DESMEMBRAIMOVEL
         LimpaParametros(dtmCAF.qryDelDesmembraImovel);
         dtmCAF.qryDelDesmembraImovel.ParamByName('PIDIMOVELFIM').AsInteger := qryDesmembraImovelIDIMOVELFIM.AsInteger;
         dtmCAF.qryDelDesmembraImovel.ExecSQL;

         // exclui o evento final
         if EventoImovel.ExcluiEvento(qryDesmembraImovelIDEVENTOIMOVELFIM.asInteger, False) = -1 then
            raise Exception.Create('');

         //Exclui Registros na PLANOPATROXIMOVEL
         LimpaParametros(dtmCAF.qryDelPlanoPatroxImovel);
         dtmCAF.qryDelPlanoPatroxImovel.ParamByName('IDIMOVEL').AsInteger := qryDesmembraImovelIDIMOVELFIM.AsInteger;
         dtmCAF.qryDelPlanoPatroxImovel.ExecSQL;

         // Vando - SOL 154328-5901 / KTN 1373449 - inicio
         //Exclui Registros na PLANOPATROXVIGENCIAIMOB
         LimpaParametros(dtmCAF.qryDelPlanoPatroxVigente);
         dtmCAF.qryDelPlanoPatroxVigente.ParamByName('IDIMOVEL').AsInteger := qryDesmembraImovelIDIMOVELFIM.AsInteger;
         dtmCAF.qryDelPlanoPatroxVigente.ExecSQL;
         // Vando - SOL 154328-5901 / KTN 1373449 - fim

         // exclui o imóvel resultante em IMOVEL
         LimpaParametros(dtmCAF.qryDelImovel);
         dtmCAF.qryDelImovel.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         dtmCAF.qryDelImovel.ParamByName('PIDIMOVEL').AsInteger := qryDesmembraImovelIDIMOVELFIM.AsInteger;
         dtmCAF.qryDelImovel.ExecSQL;

         qryDesmembraImovel.Next;
      end;

      // Exclui o Evento inicial
      if EventoImovel.ExcluiEvento(iEventoIni, False) = -1 then
         raise Exception.Create('');

      // Altera a situação do Imóvel original p/ "Em Obras" = "O"
      EventoImovel.AlteraSituacaoImovel(molObraDesmembra1.iImovel, 'O');
   except
      Result := False;
   end;
end;



procedure TfrmEstornaDesmembraObra.molObraDesmembra1btnBuscaObraClick(Sender: TObject);
begin
  inherited;
  molObraDesmembra1.btnBuscaObraClick(Sender);
  if molObraDesmembra1.MS_Obra.RetornouValor then begin

     // Abre obras resultantes do desmembramento
     with qryDesmembraObra do begin
        LimpaParametros(qryDesmembraImovel);
        ParamByName('PIDCAFOBRA').asInteger := molObraDesmembra1.iObra;
        Open;
     end;

     // Abre imoveis resultantes do desmembramento
     with qryDesmembraImovel do begin
        LimpaParametros(qryDesmembraImovel);
        ParamByName('PIDIMOVELORIG').asInteger := molObraDesmembra1.iImovel;
        Open;
     end;

     // Abre os bens do imóvel original para desfazer o desmembramento
     with dtmCAF.qryImovelxBem do begin
        LimpaParametros(dtmCAF.qryImovelxBem);
        ParamByName('PIDIMOVEL').asInteger := molObraDesmembra1.iImovel;
        Open;
     end;
  end;
end;

procedure TfrmEstornaDesmembraObra.molObraDesmembra1btnLimpaObraClick(Sender: TObject);
begin
  inherited;
  molObraDesmembra1.btnLimpaObraClick(Sender);
  LimpaParametros(qryDesmembraObra);
  LimpaParametros(qryDesmembraImovel);  
  LimpaParametros(dtmCAF.qryImovelXBem);
end;


procedure TfrmEstornaDesmembraObra.DBgrdBemOriginalCalcCellColors(
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

procedure TfrmEstornaDesmembraObra.DBgrdBemOriginalTopRowChanged(
  Sender: TObject);
begin
   inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;


procedure TfrmEstornaDesmembraObra.DelSegregacao(iIdImovelFim: integer);
var
  sSQL : string;
  qryAux : TwwQuery;
begin
  qryAux := TwwQuery.Create(nil);
  try
    sSQL := 'DELETE FROM PLANOPATROXIMOVEL WHERE IDIMOVEL = ' + IntToStr(iIdImovelFim);
    if not ExecutarQuery(qryAux, sSQL) then
      raise Exception.Create('');
  finally
    FreeAndNil(qryAux);
  end;
end;

end.
