unit FEstornaEncerraObra;

// -----------------------------------------------------------------------------
//
//      Estorna o Encerramento de Obras
//
//	Autor             :  Vinícius Meyer Lana
//	Data de Início    :  16/01/2002
//	Data de Término   :  21/01/2002
//
// -----------------------------------------------------------------------------
//SIG..........: 60733 
//Responsável..: Peterson Victor
//Data.........: 12/01/2017
//Descrição....: Alterado a sql que carrega o objeto qryEventoImovel(.dfm)
// -----------------------------------------------------------------------------
//SOL..........: 212226
//Kintana......: 2037651
//Responsável..: Helio Lima Custódio
//Data.........: 08/04/2014
//Descrição....: Excluir dados do imóvel em histórico de vida útil antes de
//               excluir o imóvel.
// -----------------------------------------------------------------------------
//SOL..........: 172902/8222
//Kintana......: 1577546
//Responsável..: Wylliam Leite da Silva
//Data.........: 04/04/2012
//Descrição....: Não deixar fazer lançamentos com Período contabil Bloqueado
// -----------------------------------------------------------------------------
//SOL..........: 165889
//Kintana......: 1441365
//Responsável..: Helen V. Bianchi
//Data.........: 04/10/2010
//Descrição....: Correção dos processos de Encerramento de Obras e Estorno de
//               Encerramento de Obras, para deleção da tabela Conjunto
// -----------------------------------------------------------------------------
//SOL..........: 139388
//Kintana......: 766651
//Responsável..: Cássio Camargo
//Data.........: 08/07/2010
//Descrição....: Correção dos processos de Encerramento de Obras e Estorno de
//               Encerramento de Obras, para utilização da tabela
//               PLANOPATROXVIGENCIABEM e PLANOPATROXVIGENCIAIMOB
//------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker,
  mImovel, Db, DBTables, Wwquery, mImovelDesmembra, Mask, DBCtrls, Wwdatsrc,
  Grids, Wwdbigrd, Wwdbgrid, mImovelObra, uCmSqlParams, DBClient,
  uCMClientDataSet, {uCtrlCafObra,} uCtrlMovTransfBem, uCtrlImobObra,
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  uCtrlContab,

  //Helio - SOL Nº 212226 KINTANA Nº 2037651
  uCtrlHistoricoVidaUtil;

type
  TfrmEstornaEncerraObra = class(TFrmOkCancelarImob)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    qryEventoImovel: TwwQuery;
    dsEventoImovel: TwwDataSource;
    DBmemEvento: TDBMemo;
    DBedtCabecalhoEvento: TDBEdit;
    DBedtUsuario: TDBEdit;
    qryEventoImovelIDEVENTOIMOVEL: TFloatField;
    qryEventoImovelEVIDATA: TDateTimeField;
    qryEventoImovelEVICABECALHO: TStringField;
    qryEventoImovelEVIDESCRICAO: TMemoField;
    qryEventoImovelIDUSUARIO: TFloatField;
    qryEventoImovelUSUARIO_EXTENSO: TStringField;
    molImovelObra1: TmolImovelObra;
    GroupBox2: TGroupBox;
    memDescObra: TMemo;
    edtDataEvento: TDBEdit;
    qryImovelXBem: TwwQuery;
    qryImovelXBemIDIMOVEL: TFloatField;
    qryImovelXBemIDBEM: TFloatField;
    qryImovelXBemIXBPERCENT: TFloatField;
    qryImovelXBemDESBEM: TStringField;
    qryImovelXBemIDCONJUNTO: TFloatField;
    qryImovelXBemIXBGRUPO: TStringField;
    qryImovelXBemIDGRUPO: TFloatField;
    qryTransfBens: TwwQuery;
    qryTransfBensIDMOVIMENTACAO: TFloatField;
    qryTransfBensDATAMOVIMENTACAO: TDateTimeField;
    qryTransfBensIDBEM: TFloatField;
    qryTransfBensIDMESTREFIM: TFloatField;
    qryTransfBensIDTIPOMOVIMENTACAO: TFloatField;
    qryTransfBensIDIMOVELORIG: TFloatField;
    qryTransfBensIDIMOVELDEST: TFloatField;
    cdsObra: TCMClientDataSet;
    sqlBens: TCMSqlParams;
    cdsBens: TCMClientDataSet;
    qryTransfBensFLGOPERACAO: TStringField;
    qryTransfBensIDCONJUNTO: TFloatField;

    procedure bbtnCancelarClick(Sender: TObject);
    procedure molImovelObra1btnBuscaImovelClick(Sender: TObject);
    procedure molImovelObra1btnLimpaImovelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private { Private declarations }

    //CtrlCafObra : TCtrlCafObra;
    CtrlCafObra : TCtrlImobObra;
    CtrlMovTransfBem : TCtrlMovTransfBem;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

    //Helio - SOL Nº 212226 KINTANA Nº 2037651
    CtrlHistoricoVidaUtil : TCtrlHistoricoVidaUtil;

    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;
    function  VerificaExclusao : Boolean;

    function  DesfazTabelasRelacionamento : Boolean;
    function  DesfazTransfGrupo : Boolean;
    function  DesfazEncerraObra: boolean;

//    function  DesfazDesmembramentoCAF: boolean;

    function  ExcluiImoveis: boolean;

  public { Public declarations }

  end;

var
  frmEstornaEncerraObra: TfrmEstornaEncerraObra;



implementation
{$R *.DFM}
uses
   uSistema, uModuloInvestImob, dImobiliario, dLookImobiliario, uComunsImobiliario, uVerificaPreenchimento, uMensErro,
   uFuncoesImob, uDataBase, dBaseDados, uEventoImovel, uAtivoFixo, DMS, DCAF,
   dEventoImovel;


procedure TfrmEstornaEncerraObra.FormCreate(Sender: TObject);
begin
   inherited;
   //CtrlCafObra := TCtrlCafObra.Create;
   CtrlCafObra := TCtrlImobObra.Create;
   CtrlMovTransfBem := TCtrlMovTransfBem.Create;
   CtrlCafObra.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                          Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
   CtrlMovTransfBem.InitializeAs( CtrlCafObra );

   //Helio - SOL Nº 212226 KINTANA Nº 2037651
   CtrlHistoricoVidaUtil := TCtrlHistoricoVidaUtil.Create;
   CtrlHistoricoVidaUtil.InitializeAs( CtrlCafObra );
   //FIM Helio - SOL Nº 212226 KINTANA Nº 2037651

   CtrlCafObra.cds := cdsObra;
   CtrlCafObra.cdsCafObraEncerrar := cdsBens;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlMovTransfBem);
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
end;

procedure TfrmEstornaEncerraObra.FormDestroy(Sender: TObject);
begin
   FreeAndNil( CtrlCafObra );
   FreeAndNil( CtrlMovTransfBem );
   FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
   FreeAndNil(CtrlHistoricoVidaUtil); //Helio - SOL Nº 212226 KINTANA Nº 2037651
   inherited;
end;



procedure TfrmEstornaEncerraObra.DesabilitaBotoes;
begin
   Screen.Cursor        := crHourGlass;
   pnlFundo.Enabled     := False;
   bbtnCancelar.Enabled := False;
   bbtnSair.Enabled     := False;
end;


procedure TfrmEstornaEncerraObra.HabilitaBotoes;
begin
   bbtnCancelar.Enabled := True;
   bbtnSair.Enabled     := True;
   pnlFundo.Enabled     := True;
   Screen.Cursor        := crDefault;
end;


procedure TfrmEstornaEncerraObra.molImovelObra1btnBuscaImovelClick(
  Sender: TObject);
begin
   inherited;
   // Executa o MontaSelect somente com as obras encerradas
   molImovelObra1.btnBuscaImovelClick(Sender, 2);
   if dtmMS.MS_ImovelObra.RetornouValor then begin
      memDescObra.Text := molImovelObra1.sDescObra;

      // Abre Evento de registro do encerramento
      with qryEventoImovel do begin
         LimpaParametros(qryEventoImovel);
         ParamByName('PIDIMOVELINI').asInteger := molImovelObra1.iImovel;
         Open;
      end;

      // Abre tabela dos bens novos
      with qryTransfBens do begin
         LimpaParametros(qryTransfBens);
         ParamByName('PIDIMOVELORIG').asInteger := molImovelObra1.iImovel;
         Open;
      end;

      // Abre tabela ImovelxBem do Imovel antigo
      with qryImovelxBem do begin
         LimpaParametros(qryImovelxBem);
         ParamByName('PIDIMOVEL').asInteger := molImovelObra1.iImovel;
         Open;
      end;

      // Abre cds da obra a estornar
      cdsObra.Data := CtrlCafObra.ListaCafObra(Sistema.IdEmpresa, molImovelObra1.iObra);

      sqlBens.Prepare;
      sqlBens.ParamByName('IDCAFOBRA').AsInteger := cdsObra.FieldByName('IDCAFOBRA').AsInteger;
      sqlBens.ParamByName('IDPESSOA').AsInteger  := cdsObra.FieldByName('IDPESSOA').AsInteger;
      sqlBens.Open;

   end else begin
      memDescObra.Text := '';
      qryEventoImovel.Close;
      qryTransfBens.Close;
      qryImovelxBem.Close;
   end;
end;

procedure TfrmEstornaEncerraObra.molImovelObra1btnLimpaImovelClick(
  Sender: TObject);
begin
   inherited;
   molImovelObra1.btnLimpaImovelClick(Sender);
   LimpaParametros(qryEventoImovel);
   LimpaParametros(qryTransfBens);
   memDescObra.Text := '';
end;


procedure TfrmEstornaEncerraObra.bbtnCancelarClick(Sender: TObject);
var bResult : Boolean;
begin
   inherited;
   bResult := True;
   if VerificaExclusao then begin
      DesabilitaBotoes;
      try
         StartTransacao;
         bResult := DesfazTabelasRelacionamento;
         if bResult then bResult := DesfazTransfGrupo;

         if bResult then bResult := DesfazEncerraObra;
         if bResult then bResult := ExcluiImoveis;
         if bResult then begin
            CommitTransacao;
            MsgDlg('Encerramento da Obra desfeito com sucesso!', 'Informação', mtInformation, [mbOk], 0);
            molImovelObra1btnLimpaImovelClick(self);
            Repaint;
         end else begin
            Abort;
         end;
      except
         RollBackTransacao;
         MsgDlg('Ocorreram ERROS durante a tentativa de desfazer o Encerramento da Obra', 'Erro', mtError, [mbOk], 0);
         Repaint;
      end;
      HabilitaBotoes;
   end;
end;


function TfrmEstornaEncerraObra.VerificaExclusao: Boolean;
begin
   Result := True;
   if molImovelObra1.iImovel < 1 then begin
      MsgDlg('Selecione o Imóvel que estava relacionado a obra', 'Aviso', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;

   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio
   if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataEvento.Text) then
      begin
         MsgDlg ('Período bloqueado pela Contabilidade','Aviso',mtWarning,[mbok],0);
         Result := False;
         Exit;
      end;
   // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim

   if MsgDlg('Confirma a Exclusão do Encerramento da Obra ?', 'Confirmação', mtConfirmation,
             [mbYes, mbNo], 0) = mrNo then begin
      Result := False;
   end;
end;



function TfrmEstornaEncerraObra.DesfazTabelasRelacionamento: Boolean;
var sSql : String;
    bTerreno : Boolean;
begin
   Result   := True;
   bTerreno := False;
   try
      // se o bem foi transferido de conjunto, retorná-lo ao imovel original em IMOVELXBEM
      qryTransfBens.First;
      while not qryTransfBens.Eof do begin
         if qryTransfBensIDTIPOMOVIMENTACAO.AsInteger in[5,12] then begin  // Transf Grupo ou Conjunto
            bTerreno := True;
            sSql := ' UPDATE IMOVELXBEM SET '+
                    ' IDIMOVEL = ' + IntToStr(qryTransfBensIDIMOVELORIG.AsInteger) +
                    ' WHERE (IDBEM    = ' + IntToStr(qryTransfBensIDBEM.AsInteger) + ')' +
                    '   AND (IDIMOVEL = ' + IntToStr(qryTransfBensIDIMOVELDEST.AsInteger) + ')';

            Result := ExecutarQuery(dtmImobiliario.qryAux,sSql);
            if Result = False then Exit;

            // Altera o nome do bem Terreno para o nome antigo
            sSql := ' UPDATE BEM SET ' +
                    ' DESBEM = ' + QuotedStr(molImovelObra1.sImovelExtenso + ' - Terreno ') +
                    ' WHERE (IDBEM = '+IntToStr(qryTransfBensIDBEM.AsInteger) + ')';

            Result := ExecutarQuery(dtmImobiliario.qryAux,sSql);
            if Result = False then Exit;
         end;
         qryTransfBens.Next;
      end;

      // Altera a situação do Imóvel original p/ "Em Obras" = "O"
      // Se possuir bem Terreno, a situação é Ativa
      LimpaParametros(dtmCAF.qryUpdStatusImovel);
      dtmCAF.qryUpdStatusImovel.ParamByName('PIDIMOVEL').AsInteger := molImovelObra1.iImovel;
      dtmCAF.qryUpdStatusImovel.ParamByName('PFLGSTATUS').AsString := 'O';
      if bTerreno then
           dtmCAF.qryUpdStatusImovel.ParamByName('PFLGATIVO').AsInteger := 1
      else dtmCAF.qryUpdStatusImovel.ParamByName('PFLGATIVO').AsInteger := 0;
      dtmCAF.qryUpdStatusImovel.ExecSQL;

      qryTransfBens.First;

      // Exclui em ImovelxBem os bens do imovel novo
      LimpaParametros(dtmCAF.qryDelImovelxBem);
      dtmCAF.qryDelImovelxBem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      dtmCAF.qryDelImovelxBem.ParamByName('PIDIMOVEL').AsInteger := qryTransfBensIDIMOVELDEST.AsInteger;
      dtmCAF.qryDelImovelxBem.ExecSQL;

      // exclui os imóveis em TRANSFBEMIMOVEL com operação de encerramento - Tipo O
      LimpaParametros(dtmCAF.qryDelTransferencia);
      dtmCAF.qryDelTransferencia.ParamByName('PIDIMOVELORIG').AsInteger := qryTransfBensIDIMOVELORIG.AsInteger;
      dtmCAF.qryDelTransferencia.ParamByName('PFLGOPERACAO').AsString  := 'O';
      dtmCAF.qryDelTransferencia.ExecSQL;

      // exclui os imóveis em TRANSFBEMIMOVEL com operação de transferencia - Tipo X
      LimpaParametros(dtmCAF.qryDelTransferencia);
      dtmCAF.qryDelTransferencia.ParamByName('PIDIMOVELORIG').AsInteger := qryTransfBensIDIMOVELORIG.AsInteger;
      dtmCAF.qryDelTransferencia.ParamByName('PFLGOPERACAO').AsString  := 'X';
      dtmCAF.qryDelTransferencia.ExecSQL;

   except
      Result := False;
      Raise;
      Repaint;
   end;
end;


function TfrmEstornaEncerraObra.DesfazTransfGrupo: Boolean;
var iResult : Integer;
begin
   Result := True;
   try
      qryTransfBens.First;
      while not qryTransfBens.Eof do begin
         if qryTransfBensFLGOPERACAO.AsString = 'X' then begin
            CtrlMovTransfBem.OpenTransaction := False;
            if not CtrlMovTransfBem.EstornaTransferencia(Sistema.IdModulo,
                                                         Sistema.IdEmpresa,
                                                         Sistema.IdUsuario,
                                                         qryTransfBensIDBEM.AsInteger,
                                                         qryTransfBensDATAMOVIMENTACAO.AsDateTime,
                                                         Date(),
                                                         qryTransfBensIDMOVIMENTACAO.AsInteger) then
               raise Exception.Create( CtrlMovTransfBem.MessageInfo );
         end;
         qryTransfBens.Next;
      end;

   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;




function TfrmEstornaEncerraObra.DesfazEncerraObra: boolean;
begin
   Result := True;
   try
      CtrlCafObra.OpenTransaction := False;
      if not CtrlCafObra.EstornaEncerramentoObra( Sistema.IdModulo,
                                                  Sistema.IdEmpresa,
                                                  Sistema.IdUsuario,
                                                  molImovelObra1.iObra,
                                                  qryEventoImovelEVIDATA.asDateTime ) then
         raise Exception.Create( CtrlCafObra.MessageInfo );

   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
   end;
end;



function TfrmEstornaEncerraObra.ExcluiImoveis: boolean;
begin
   Result := True;
   try
      qryTransfBens.First;

      //Cássio - SOL Nº 139388 KINTANA Nº 855985 - Início
      //Fazer exclusao nas tabelas PLanoPatroxImovel e PLANOPATROXVIGENCIAIMOB
      LimpaParametros(dtmCAF.qryDelPlanoPatroxVigenciaImob);
      dtmCAF.qryDelPlanoPatroxVigenciaImob.ParamByName('IDIMOVEL').asInteger := qryTransfBensIDIMOVELDEST.AsInteger;
      dtmCAF.qryDelPlanoPatroxVigenciaImob.ExecSQL;
      //Cássio - SOL Nº 139388 KINTANA Nº 855985 - Início

      LimpaParametros(dtmCAF.qryDelPlanoPatroxImovel);
      dtmCAF.qryDelPlanoPatroxImovel.ParamByName('IDIMOVEL').asInteger := qryTransfBensIDIMOVELDEST.AsInteger;
      dtmCAF.qryDelPlanoPatroxImovel.ExecSQL;

      // Exclui em RateioDepreciação
      LimpaParametros(dtmCAF.qryDelRateioDepreciacao);
      dtmCAF.qryDelRateioDepreciacao.ParamByName('PIDEMPRESA').AsInteger  := Sistema.IdEmpresa;
      dtmCAF.qryDelRateioDepreciacao.ParamByName('PIDCONJUNTO').AsInteger := qryTransfBensIDCONJUNTO.AsInteger;
      dtmCAF.qryDelRateioDepreciacao.ExecSQL;

      //Helen: SOL : 165889 Kintana : 1441365 - Inicio
      //Adicionado um Try Except pois estava excluido um Conjunto, que possuia referencias ,
      //fora do escopo de Encerramento de Obra
      try
        // Exclui em Conjunto
        LimpaParametros(dtmCAF.qryDelConjunto);
        dtmCAF.qryDelConjunto.ParamByName('PIDPESSOA').AsInteger   := Sistema.IdEmpresa;
        dtmCAF.qryDelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qryTransfBensIDCONJUNTO.AsInteger;
        dtmCAF.qryDelConjunto.ExecSQL;
      except

      end;
      //Helen: SOL : 165889 Kintana : 1441365 - Fim

      // exclui o imóvel resultante em DESMEMBRAIMOVEL
      LimpaParametros(dtmCAF.qryDelDesmembraImovel);
      dtmCAF.qryDelDesmembraImovel.ParamByName('PIDIMOVELFIM').AsInteger := qryTransfBensIDIMOVELDEST.AsInteger;
      dtmCAF.qryDelDesmembraImovel.ExecSQL;

      // Exclui Evento do Imovel FINAL
      with dtmEventoImovel.qryDeleteEventoImovel do begin
         LimpaParametros(dtmEventoImovel.qryDeleteEventoImovel);
         ParamByName('PIDIMOVEL').AsInteger  := qryTransfBensIDIMOVELDEST.AsInteger;
         ExecSQL;
      end;

      // Exclui Evento do Imovel INICIAL
      with dtmEventoImovel.qryDeleteEventoImovel do begin
         LimpaParametros(dtmEventoImovel.qryDeleteEventoImovel);
         ParamByName('PIDIMOVEL').AsInteger  := qryTransfBensIDIMOVELORIG.AsInteger;
         ParamByName('PTIPOEVENTO').AsString := 'BO';  {baixa por encerramento de obra}
         ExecSQL;
      end;

      // exclui o Ativo resultante do imóvel no módulo de Cotas
      LimpaParametros(dtmCAF.qryDelAtivoCota);
      dtmCAF.qryDelAtivoCota.ParamByName('PIDIMOVEL').AsInteger := qryTransfBensIDIMOVELDEST.AsInteger;
      dtmCAF.qryDelAtivoCota.ExecSQL;

      //Helio - SOL Nº 212226 KINTANA Nº 2037651
      //exclui historico vida util
      CtrlHistoricoVidaUtil.ExcluiPorImovel( qryTransfBensIDIMOVELDEST.AsInteger, False );

      // exclui o imóvel resultante em IMOVEL
      LimpaParametros(dtmCAF.qryDelImovel);
      dtmCAF.qryDelImovel.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      dtmCAF.qryDelImovel.ParamByName('PIDIMOVEL').AsInteger := qryTransfBensIDIMOVELDEST.AsInteger;
      dtmCAF.qryDelImovel.ExecSQL;

      // exclui o imóvel Mestre resultante em IMOVEL
      LimpaParametros(dtmCAF.qryDelImovel);
      dtmCAF.qryDelImovel.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      dtmCAF.qryDelImovel.ParamByName('PIDIMOVEL').AsInteger := qryTransfBensIDMESTREFIM.AsInteger;
      dtmCAF.qryDelImovel.ExecSQL;
   except
      Result := False;
      Repaint;
   end;
end;

end.
