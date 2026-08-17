unit FEstornaDesmembramento;
//------------------------------------------------------------------------------
//Solicitação.: WO1900
//Data........: 14/08/2023
//Responsável.: Cássio Florencio Rovaroto
//Descrição...: Correção do estorno de provisionamento de custos.
//------------------------------------------------------------------------------
//Nº SIG......: 113136
//Data........: 04/07/2022
//Responsável.: Cássio Florencio Rovaroto
//Descrição...: Implementação da provisão de custos de imóveis.
//------------------------------------------------------------------------------
//Rotina......: -
//Nº SOL......: 212226
//Nº KINTANA..: 2037651
//Data........: 08/04/2014
//Responsável.: Helio Lima Custódio
//Descrição...: Excluir dados do historico de vida útil do imovel antes de excluir o imovel.
//---------------------------------------------------------------------------------------------------
{--------------------------------------------------------------------------------------------------
Rotina...........: DesfazDesmembramentoCAF
Nº SOL...........: 154328-5901
Nº KINTANA.......: 1373449
Data da Alteração: 13/03/2014
Responsável......: Vando Souza Amancio
Descrição........: Segregação por plano previdenciário de todas as movimentações
                   que são contabilizadas.
---------------------------------------------------------------------------------------------------}
//Rotina......: -
//Nº SOL......: 172902/8222
//Nº KINTANA..: 1577546
//Data........: 28/03/2012
//Responsável.: Wylliam Leite da Silva
//Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
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
  Grids, Wwdbigrd, Wwdbgrid, uCtrlMovDesmembramento, DBClient,
  uCMClientDataSet,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab,

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  uCtrlHistoricoVidaUtil,
  uCtrlProvisaoImovel;

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
    dbedtData: TDBEdit;

    procedure bbtnCancelarClick(Sender: TObject);
    procedure molImovelDesmembra1btnBuscaImovelClick(Sender: TObject);
    procedure molImovelDesmembra1btnLimpaImovelClick(Sender: TObject);
    procedure DBgrdBemOriginalCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure DBgrdBemOriginalTopRowChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);


  private { Private declarations }

    CtrlMovDesmembramento : TCtrlMovDesmembramento;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
    CtrlHistoricoVidaUtil : TCtrlHistoricoVidaUtil; //Helio - SOL Nº 212226 KINTANA Nº 2037651
    CtrlProvisaoImovel : TCtrlProvisaoImovel; //Cássio Rovaroto - SIG  nº 113136
    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;
    function  VerificaExclusao : Boolean;
    function  DesfazDesmembramentoCAF: boolean;
    function  ExcluiImoveis: boolean;
    function EstornaProvisaoDesmembramento: Boolean;
    //Cássio - SOL Nº 128010 KINTANA Nº 684003
    function  VerificaGrupoxImovel : boolean;

  public { Public declarations }

  end;

var
  frmEstornaDesmembramento: TfrmEstornaDesmembramento;



implementation
{$R *.DFM}
uses
   uSistema, dImobiliario, dLookImobiliario, uComunsImobiliario, uVerificaPreenchimento, uMensErro,
   uFuncoesImob, uDataBase, dBaseDados, uEventoImovel, DMS, DCAF;


procedure TfrmEstornaDesmembramento.FormCreate(Sender: TObject);
begin
  inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   CtrlMovDesmembramento := TCtrlMovDesmembramento.Create;
   CtrlMovDesmembramento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                    Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(CtrlMovDesmembramento);


   //Helio - SOL Nº 212226 KINTANA Nº 2037651
   CtrlHistoricoVidaUtil := TCtrlHistoricoVidaUtil.Create;
   CtrlHistoricoVidaUtil.InitializeAs(CtrlMovDesmembramento);
   //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

   //Cássio Rovaroto - SIG nº 113136 - Início
   CtrlProvisaoImovel := TCtrlProvisaoImovel.Create;
   CtrlProvisaoImovel.InitializeAs((CtrlMovDesmembramento));
   //Cássio Rovaroto - SIG nº 113136 - Fim
end;

procedure TfrmEstornaDesmembramento.FormDestroy(Sender: TObject);
begin
  FreeAndNil( CtrlMovDesmembramento );
  FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  FreeAndNil( CtrlHistoricoVidaUtil ); //Helio - SOL Nº 212226 KINTANA Nº 2037651
  FreeAndNil(CtrlProvisaoImovel); //Cássio Rovaroto - SIG nº 113136
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
   
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   if dbedtData.text <> '' then
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,dbedtData.Text) then
      begin
         MsgDlg ('Período bloqueado pela Contabilidade','Aviso',mtWarning,[mbok],0);
         Result := False;
         Exit;
      end;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

   if qryDesmembraImovel.IsEmpty then begin
      MsgDlg('Não existem imóveis resultantes de desmembramento para o imóvel selecionado', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

    //Cássio - SOL Nº 128010 KINTANA Nº 684003 - Início
   if VerificaGrupoxImovel then
   begin
    MsgDlg('Os imóveis resultantes estão relacionados a um Grupo de Imóveis.' + #10#13 +
           'Necessário excluí-los do grupo antes de desfazer o desmembramento.' ,
           'Aviso', mtInformation, [mbOK], 0);
    Result := False;
    Exit;
   end;
   //Cássio - SOL Nº 128010 KINTANA Nº 684003 - Fim

   if MsgDlg('Confirma a Exclusão do Desmembramento ?', 'Confirmação', mtConfirmation,
             [mbYes, mbNo], 0) = mrNo then begin
      Result := False;
   end;
end;


function TfrmEstornaDesmembramento.DesfazDesmembramentoCAF: boolean;
var
  qryDelPlanoPatroXImovel : TQuery;
  sSQL : String;
begin
   Result := True;
   qryDelPlanoPatroXImovel := TQuery.Create(nil);
   qryDelPlanoPatroXImovel.DatabaseName := FuncaoGeral.DataBaseName;
   sSQL := '';
   try
   try
      if dtmCAF.qryImovelxBem.isEmpty then begin
         raise Exception.Create('Não foi possível encontrar os bens relacionados ao imovel original em IMOVELXBEM');
      end;

      //Cássio Rovaroto - SIG nº 113136 - Início
      if not EstornaProvisaoDesmembramento then
        raise Exception.Create('Não possível estornar a provisão do custo dos imóveis.');
      //Cássio Rovaroto - SIG nº 113136 - Fim
      
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

        //Exclui PlanoPatroxImovel para cada imóvel resultante
        try
          qryDesmembraImovel.First;
           while not qryDesmembraImovel.EOF do
           begin
            sSQL := 'DELETE FROM PLANOPATROXIMOVEL ' + #10#13 +
                    ' WHERE IDIMOVEL = ' + qryDesmembraImovelIDIMOVELFIM.AsString;

            qryDelPlanoPatroXImovel.SQL.Clear;
            qryDelPlanoPatroXImovel.SQL.Add(sSQL);
            qryDelPlanoPatroXImovel.ExecSQL;

            qryDesmembraImovel.Next;
           end;
        except
           raise Exception.Create('Erro ao excluir em PLANOPATROXIMOVEL');
        end;

        // Vando - SOL 154328-5901 / KTN 1373449 - INICIO
        //Exclui PlanoPatroxVigenciaImob para cada imóvel resultante
        try
          qryDesmembraImovel.First;
           while not qryDesmembraImovel.EOF do
           begin
            sSQL := 'DELETE FROM PLANOPATROXVIGENCIAIMOB ' + #10#13 +
                    ' WHERE IDIMOVEL = ' + qryDesmembraImovelIDIMOVELFIM.AsString;

            qryDelPlanoPatroXImovel.SQL.Clear;
            qryDelPlanoPatroXImovel.SQL.Add(sSQL);
            qryDelPlanoPatroXImovel.ExecSQL;

            qryDesmembraImovel.Next;
           end;
        except
           raise Exception.Create('Erro ao excluir em PLANOPATROXIMOVEL');
        end;
        // Vando - SOL 154328-5901 / KTN 1373449 - FIM

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
   finally
    FreeAndNil(qryDelPlanoPatroXImovel);
   end;
end;



function TfrmEstornaDesmembramento.ExcluiImoveis: boolean;
var
  cdsProvisao : TCMClientDataSet;
begin
   Result := True;
   cdsProvisao := TCMClientDataSet.Create(nil);
   try
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
         EventoImovel.ExcluiEvento(qryDesmembraImovelIDEVENTOIMOVELFIM.asInteger, False);
         EventoImovel.ExcluiEvento(qryDesmembraImovelIDEVENTOIMOVELINI.asInteger, False);

         //Helio - SOL Nº 212226 KINTANA Nº 2037651
         //exclui dados de historico vida util
         CtrlHistoricoVidaUtil.ExcluiPorImovel(qryDesmembraImovelIDIMOVELFIM.AsInteger);
         //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

         // exclui o imóvel resultante em ATIVOCOTA
         LimpaParametros(dtmCAF.qryDelAtivoCota);
         dtmCAF.qryDelAtivoCota.ParamByName('PIDIMOVEL').AsInteger := qryDesmembraImovelIDIMOVELFIM.AsInteger;
         dtmCAF.qryDelAtivoCota.ExecSQL;

         cdsProvisao.Data := CtrlProvisaoImovel.LookupProvisaoImovel(qryDesmembraImovelIDIMOVELFIM.AsInteger);
         if not cdsProvisao.IsEmpty then
         begin
          while not cdsProvisao.Eof do
          begin
            LimpaParametros(dtmCAF.qryDelProvisaoImovel);
            dtmCAF.qryDelProvisaoImovel.Prepare;
            dtmCAF.qryDelProvisaoImovel.ParamByName('PIDPROVISAOIMOVEL').AsInteger := cdsProvisao.FieldByName('IDPROVISAOIMOVEL').asInteger;
            dtmCAF.qryDelProvisaoImovel.ExecSQL;
            cdsProvisao.Next;
          end;
         end;

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
   finally
     FreeAndNil(cdsProvisao);
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



function TfrmEstornaDesmembramento.VerificaGrupoxImovel: boolean;
var
  sIdImovelFim, sSQL :  String;
  oQry : TwwQuery;
begin
  oQry := TwwQuery.Create(Nil);
  oQry.DatabaseName := 'BaseDados'; 
  Result := False;
  sIDImovelFim := '';
  qryDesmembraImovel.First;
  while not qryDesmembraImovel.EOF do
  begin
    if sIdImovelFim = '' then
      sIdImovelFim :=  qryDesmembraImovelIDIMOVELFIM.asString
    else
      sIdImovelFim :=  sIdImovelFim + ', ' + qryDesmembraImovelIDIMOVELFIM.asString;
    qryDesmembraImovel.Next;
  end;

  oQry.Sql.Text := 'SELECT IDIMOVEL FROM GRUPOXIMOVEL WHERE IDIMOVEL IN ('+sIDImovelFim+')';
  oQry.Open;
  {dtmCAF.qryGrupoxImovel.SQL.Clear;
  dtmCAF.qryGrupoxImovel.SQL.Add('SELECT IDIMOVEL FROM GRUPOXIMOVEL ');
  dtmCAF.qryGrupoxImovel.SQL.Add(' WHERE IDIMOVEL IN ('+sIDImovelFim+')');
  dtmCAF.qryGrupoxImovel.ExecSQL;}

  if not oQry.IsEmpty then
    Result := True;
  qryDesmembraImovel.First;
 FreeAndNil(oQry);
end;
//Cássio - SOL Nº 128010 KINTANA Nº 684003 - Fim

procedure TfrmEstornaDesmembramento.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
  if dbedtData.text <> '' then
  if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,dbedtData.Text) then
  begin
       MsgDlg ('Período bloqueado pela Contabilidade','Aviso',mtWarning,[mbok],0);
       exit;
  end;
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
end;

function TfrmEstornaDesmembramento.EstornaProvisaoDesmembramento: Boolean;
var
  cdsBemAux: TCMClientDataSet;
  cdsProvisao : TCMClientDataSet;
begin
  Result := True;
  cdsBemAux := TCMClientDataSet.Create(nil);
  cdsProvisao := TCMClientDataSet.Create(nil);
  try
    try
      //Estorna a provisão dos imóveis gerados.
      qryDesmembraImovel.First;
      while not qryDesmembraImovel.Eof do
      begin
        cdsProvisao.Data := CtrlProvisaoImovel.LookupProvisaoImovel(qryDesmembraImovelIDIMOVELFIM.AsInteger);
        if not cdsProvisao.IsEmpty then
        begin
          cdsBemAux.Data := CtrlProvisaoImovel.RetornaBem(qryDesmembraImovelIDIMOVELFIM.AsInteger);

          while not cdsBemAux.Eof do
          begin
            //Exclui Provisão de Custo.
            if not CtrlProvisaoImovel.EstornaProvisaoCustoImovel(Sistema.IdUsuario,
                                                               Sistema.IdModulo,
                                                               Sistema.IdEmpresa,
                                                               202,
                                                               qryEventoImovel.FieldByName('EVIDATA').AsDateTime,
                                                               True,
                                                               True,
                                                               cdsBemAux.FieldByName('IDBEM').AsInteger)  then
              raise Exception.Create(CtrlProvisaoImovel.MessageInfo);
            cdsBemAux.Next;
          end;
        end;
        qryDesmembraImovel.Next;
      end;

      cdsProvisao.Data := CtrlProvisaoImovel.LookupProvisaoImovel(molImovelDesmembra1.iImovel);
      if not cdsProvisao.IsEmpty then
      begin
        //Estorna a movimentação de reversão da provisão do imóvel original.
        cdsBemAux.Data := CtrlProvisaoImovel.RetornaBem(molImovelDesmembra1.iImovel);
        while not cdsBemAux.Eof do
        begin
          //Exclui Provisão de Custo.
          if not CtrlProvisaoImovel.EstornaProvisaoCustoImovel(Sistema.IdUsuario,
                                                               Sistema.IdModulo,
                                                               Sistema.IdEmpresa,
                                                               203,
                                                               qryEventoImovel.FieldByName('EVIDATA').AsDateTime,
                                                               True,
                                                               True,
                                                               cdsBemAux.FieldByName('IDBEM').AsInteger)  then
            raise Exception.Create(CtrlProvisaoImovel.MessageInfo);
          cdsBemAux.Next;
        end;

        LimpaParametros(dtmCAF.qryUpdEstornoProvisaoImovel);
        dtmCAF.qryUpdEstornoProvisaoImovel.Prepare;
        dtmCAF.qryUpdEstornoProvisaoImovel.ParamByName('PFLGATIVO').asString := 'S';
        dtmCAF.qryUpdEstornoProvisaoImovel.ParamByName('PIDIMOVEL').asInteger := molImovelDesmembra1.iImovel;
        dtmCAF.qryUpdEstornoProvisaoImovel.ParamByName('PVIGENCIAFIM').AsDate := qryEventoImovel.FieldByName('EVIDATA').AsDateTime;
        dtmCAF.qryUpdEstornoProvisaoImovel.ExecSQL;
      end;

    except
      on e: Exception do
        Result := False;
    end;
  finally
    FreeAndNil(cdsBemAux);
    FreeAndNil(cdsProvisao);
  end;
end;

end.
