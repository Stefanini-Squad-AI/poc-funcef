unit FExecTranfTipoImovel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, MontaSelect,
  wwdbdatetimepicker, CMDateTimePicker, ComCtrls, FOkCancelarImob,
  uCtrlMovTransfBem, DBClient, uCMClientDataSet, uCtrlDomBem, uCtrlConjunto,
  uCtrlResponsavel, uCtrlLocalizacoes, uCtrlGrupoContab;

type
  TTipoTransf = (ttImovel, ttMestre);

  TfrmExecTranfTipoImovel = class(TFrmOkCancelarImob)
    qryBemXImovel: TwwQuery;
    qryLookTipoPara: TwwQuery;
    StringField2: TStringField;
    StringField3: TStringField;
    qryLookTipoParaIDGRUPOEDIFICACAO: TFloatField;
    qryLookTipoParaIDGRUPOTERRENO: TFloatField;
    qryLookTipoParaIDGRUPOINST: TFloatField;
    qryLookTipoParaIDGRUPOELET: TFloatField;
    qryBemXMestre: TwwQuery;
    qryBemXMestreIDBEM: TFloatField;
    qryBemXMestreIDIMOVEL: TFloatField;
    qryBemXMestreIXBGRUPO: TStringField;
    qryBemXMestreIDGRUPO: TFloatField;
    qryBemXImovelIDBEM: TFloatField;
    qryBemXImovelIDIMOVEL: TFloatField;
    qryBemXImovelIXBGRUPO: TStringField;
    qryBemXImovelIDGRUPO: TFloatField;
    qryBemXImovelCODTIPIMOVEL: TStringField;
    qryBemXMestreCODTIPIMOVEL: TStringField;
    qryBemXImovelNOME_MESTRE: TStringField;
    qryBemXImovelNOME_IMOVEL: TStringField;
    qryBemXImovelNOME_BEM: TStringField;
    qryTrocaTipoImovel: TwwQuery;
    qryBemXMestreNOME_MESTRE: TStringField;
    qryBemXMestreNOME_IMOVEL: TStringField;
    qryBemXMestreNOME_BEM: TStringField;
    qryBemXMestreIDCONJUNTO: TFloatField;
    qryBemXImovelIDCONJUNTO: TFloatField;
    pnlData: TPanel;
    Label3: TLabel;
    edtDataTransf: TCMDateTimePicker;
    Panel1: TPanel;
    ProgressBar: TProgressBar;
    lblProgress: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label20: TLabel;
    edtTipoImovel: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBcboTipoImovel: TwwDBLookupCombo;
    Panel4: TPanel;
    Panel5: TPanel;
    edtImovelMestre: TEdit;
    edtImovel: TEdit;
    btnBuscaImovel: TBitBtn;
    btnBuscaMestre: TBitBtn;
    qryTrocaTipoMestre: TwwQuery;
    qryLookTipoParaIDGRUPOAR: TFloatField;
    qryLookTipoParaIDGRUPOUTILITARIO: TFloatField;
    qryLookTipoParaIDGRUPOMAQUINA: TFloatField;
    qryLookTipoParaIDGRUPOVEICULO: TFloatField;
    Label7: TLabel;
    memEvento: TMemo;
    Image1: TImage;
    qryImovelEvento: TwwQuery;
    qryImovelEventoIDIMOVEL: TFloatField;
    lblContador: TLabel;
    qryLookTipoParaIDGRUPOMOVEL: TFloatField;
    cdsConjunto: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    cdsBem: TCMClientDataSet;
    cdsResponsavel: TCMClientDataSet;
    cdsLocalizacao: TCMClientDataSet;

    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnBuscaMestreClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private { Private declarations }
    iImovel, iMestre  : integer;
    tTransf           : TTipoTransf;

    CtrlDomBem        : TCtrlDomBem;
    CtrlConjunto      : TCtrlConjunto;
    CtrlGrupo         : TCtrlGrupoContab;
    CtrlResponsavel   : TCtrlResponsavel;
    CtrlLocalizacao   : TCtrlLocalizacoes;
    CtrlMovTransfBem  : TCtrlMovTransfBem;

    procedure DesabilitaBotoes;
    procedure HabilitaBotoes;

    procedure FechaQueries;

    procedure MostraEspera(const sMensagem: string);
    procedure EscondeEspera;

    procedure ExecutaTransferencia;
    procedure TrocaTipoMestre(iMestreTroca: integer; sTipoTroca: string);
    procedure TrocaTipoImovel(iImovelTroca: integer; sTipoTroca: string);

    function VerificaPreenchimento: boolean;

  public { Public declarations }

  end;



var
  frmExecTranfTipoImovel: TfrmExecTranfTipoImovel;



implementation
{$R *.DFM}
uses
  uSistema, uMensErro, uDatabase, DBaseDados, uModulo, uComunsImobiliario, uVerificaPreenchimento, 
  dLookImobiliario, dImobiliario, uFuncoesImob, DMS, FEspera, uEventoImovel, dCAF;


procedure TfrmExecTranfTipoImovel.FormCreate(Sender: TObject);
begin
   inherited;
   // Inicializa os CtrlObjects dos objetos a serem utilizados
   CtrlDomBem       := TCtrlDomBem.Create;
   CtrlConjunto     := TCtrlConjunto.Create;
   CtrlResponsavel  := TCtrlResponsavel.Create;
   CtrlGrupo        := TCtrlGrupoContab.Create;
   CtrlLocalizacao  := TCtrlLocalizacoes.Create;
   CtrlMovTransfBem := TCtrlMovTransfBem.Create;
   CtrlMovTransfBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
   CtrlDomBem.InitializeAs( CtrlMovTransfBem );
   CtrlConjunto.InitializeAs( CtrlMovTransfBem );
   CtrlGrupo.InitializeAs( CtrlMovTransfBem );
   CtrlResponsavel.InitializeAs( CtrlMovTransfBem );
   CtrlLocalizacao.InitializeAs( CtrlMovTransfBem );

   CtrlMovTransfBem.cdsBem         := cdsBem;
   CtrlMovTransfBem.cdsConjunto    := cdsConjunto;
   CtrlMovTransfBem.cdsGrupo       := cdsGrupo;
   CtrlMovTransfBem.cdsResponsavel := cdsResponsavel;
   CtrlMovTransfBem.cdsLocalizacao := cdsLocalizacao;
end;

procedure TfrmExecTranfTipoImovel.FormDestroy(Sender: TObject);
begin
   FreeAndNil( CtrlDomBem );
   FreeAndNil( CtrlMovTransfBem );
   FreeAndNil( CtrlResponsavel );
   FreeAndNil( CtrlConjunto );
   FreeAndNil( CtrlGrupo );
   FreeAndNil( CtrlLocalizacao );
   inherited;
end;



procedure TfrmExecTranfTipoImovel.DesabilitaBotoes;
begin
   Screen.Cursor           := crHourGlass;
   pnlData.Enabled         := False;
   pnlFundo.Enabled        := False;
   bbtnConfirmar.Enabled   := False;
   bbtnCancelar.Enabled    := False;
   bbtnSair.Enabled        := False;
   bbtnAjuda.Enabled       := False;
end;



procedure TfrmExecTranfTipoImovel.HabilitaBotoes;
begin
   pnlData.Enabled         := True;
   pnlFundo.Enabled        := True;

   bbtnConfirmar.Enabled   := True;
   bbtnCancelar.Enabled    := True;
   bbtnSair.Enabled        := True;
   bbtnAjuda.Enabled       := True;

   Screen.Cursor           := crDefault;
end;



procedure TfrmExecTranfTipoImovel.FechaQueries;
var
   i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;
end;



procedure TfrmExecTranfTipoImovel.MostraEspera(const sMensagem: string);
begin
   frmEspera.Config('Aguarde', sMensagem, False);
   frmEspera.Show;
   Application.ProcessMessages;
end;



procedure TfrmExecTranfTipoImovel.EscondeEspera;
begin
   frmEspera.Hide;
   frmEspera.Config('', '', False);
end;



procedure TfrmExecTranfTipoImovel.ExecutaTransferencia;
var
   iResultado  : integer;
   dDataTransf : TDateTime;
   qryBens     : TwwQuery;
   fRegistros  : double;
   fMovimentacao : Extended;
   iBem, iGrupoNovo, iConjunto         : integer;
   iLocalNovo, iRespNovo               : integer;
   sGrupoImovel, sMensagem, sCabecalho : string;
begin
   dDataTransf := edtDataTransf.Date;

   // define qual query será usada em função do tipo de transferência
   case tTransf of
      ttMestre: qryBens := qryBemXMestre;
      ttImovel: qryBens := qryBemXImovel;
   end;

   // abre a query
   with qryBens do begin
      LimpaParametros(qryBens);

      case tTransf of
         ttMestre : ParamByName('MESTRE').asInteger := iMestre;
         ttImovel : ParamByName('IMOVEL').asInteger := iImovel;
      end;

      ParamByName('EMPRESAPROP').asInteger   := Sistema.idEmpresa;
      Open;

      if qryBens.isEmpty then
           fRegistros := 1
      else fRegistros := qryBens.RecordCount;

      MostraProgresso(ProgressBar, lblProgress, lblContador, fRegistros, 'Processando transferência dos Bens...');
   end;

   try
      try
         StartTransacao;

         while not(qryBens.EOF) do begin

            // define, a partir do grupo do Imobiliário, o novo grupo do Ativo Fixo
            sGrupoImovel := qryBens.FieldByName('IXBGRUPO').asString;

            iConjunto   := qryBens.FieldByName('IDCONJUNTO').asInteger;
            iBem        := qryBens.FieldByName('IDBEM').asInteger;
            iLocalNovo  := -1;
            iRespNovo   := -1;
            iGrupoNovo  := qryLookTipoParaIDGRUPOEDIFICACAO.AsInteger;
            case sGrupoImovel[1] of
               'A': iGrupoNovo := qryLookTipoParaIDGRUPOAR.AsInteger;
               'E': iGrupoNovo := qryLookTipoParaIDGRUPOEDIFICACAO.AsInteger;
               'L': iGrupoNovo := qryLookTipoParaIDGRUPOELET.AsInteger;
               'I': iGrupoNovo := qryLookTipoParaIDGRUPOINST.AsInteger;
               'M': iGrupoNovo := qryLookTipoParaIDGRUPOMAQUINA.AsInteger;
               'O': iGrupoNovo := qryLookTipoParaIDGRUPOMOVEL.AsInteger;
               'T': iGrupoNovo := qryLookTipoParaIDGRUPOTERRENO.AsInteger;
               'U': iGrupoNovo := qryLookTipoParaIDGRUPOUTILITARIO.AsInteger;
               'V': iGrupoNovo := qryLookTipoParaIDGRUPOVEICULO.AsInteger;
            end;

            // só transfere o bem se o grupo novo for diferente do atual
            if qryBens.FieldByName('IDGRUPO').asInteger <> iGrupoNovo then begin

               cdsBem.Data         := CtrlDomBem.ListaBem(Sistema.IdEmpresa, qryBens.FieldByName('IDBEM').asInteger);
               cdsGrupo.Data       := CtrlGrupo.ListaGrupoContab(Sistema.IdEmpresa, iGrupoNovo);
               cdsConjunto.Data    := CtrlConjunto.ListaConjunto(Sistema.IdEmpresa,cdsBem.FieldByName('IDCONJUNTO').AsInteger);
               cdsResponsavel.Data := CtrlResponsavel.ListaResponsavel(cdsBem.FieldByName('IDRESPONSAVEL').AsFloat);
               cdsLocalizacao.Data := CtrlLocalizacao.ListaLocalizacao(Sistema.IdEmpresa, cdsBem.FieldByName('IDLOCALIZACAO').AsFloat);

               CtrlMovTransfBem.OpenTransaction := False;
               if CtrlMovTransfBem.ExecutaTransferencia( Sistema.IdModulo,
                                                         Sistema.IdEmpresa,
                                                         Sistema.IdUsuario,
                                                         cdsBem.FieldByName('IDBEM').AsInteger,
                                                         dDataTransf ) < 0 then begin
                  sMensagem   := 'Houve erro durante a tentativa de transferência.' + #13#10 +
                                 'Imóvel: ' + qryBens.FieldByName('NOME_MESTRE').asString + ' - ' +
                                 qryBens.FieldByName('NOME_IMOVEL').asString + #13#10 +
                                 'Bem: ' + qryBens.FieldByName('NOME_BEM').asString + #13#10 +
                                 'ERRO: ' + CtrlMovTransfBem.MessageInfo;
                  raise Exception.Create( sMensagem );
               end else begin
                  fMovimentacao := CtrlMovTransfBem.nMovimentacao;
               end;


{ // anterior 2 camadas
               // transfere o bem de grupo (Ativo Fixo)
               iResultado  := cAtivoFixo.ExecutaTransferencia(Sistema.idModulo,
                                                              Sistema.idEmpresa,
                                                              iBem,
                                                              iGrupoNovo,
                                                              iConjunto,
                                                              iLocalNovo,
                                                              iRespNovo,
                                                              dDataTransf,
                                                              fMovimentacao,
                                                              True);
               if iResultado < 0 then begin
                  sMensagem   := 'Houve erro durante a tentativa de transferência.' + #13#10 +
                                 'Imóvel: ' + qryBens.FieldByName('NOME_MESTRE').asString + ' - ' +
                                 qryBens.FieldByName('NOME_IMOVEL').asString + #13#10 +
                                 'Bem: ' + qryBens.FieldByName('NOME_BEM').asString + #13#10 +
                                 'ERRO: ' + cAtivoFixo.MensagemErro;
                  raise Exception.Create(sMensagem);
               end;
}


               // Registra transação em TRANSFBEMIMOVEL
               try
                  with dtmCAF do begin
                     LimpaParametros(dtmCAF.qryInsTransferencia);
                     qryInsTransferencia.ParamByName('PIDMOVIMENTACAO').AsFloat   := fMovimentacao;
                     qryInsTransferencia.ParamByName('PIDIMOVELORIG').AsInteger   := qryBens.FieldByName('IDIMOVEL').AsInteger;
                     qryInsTransferencia.ParamByName('PIDIMOVELDEST').AsInteger   := qryBens.FieldByName('IDIMOVEL').AsInteger;
                     qryInsTransferencia.ParamByName('PFLGOPERACAO').AsString     := 'G';
                     qryInsTransferencia.ParamByName('PCODTIPIMOVELANT').AsString := qryBens.FieldByName('CODTIPIMOVEL').AsString;
                     qryInsTransferencia.ExecSQL;
                  end;
               except
                  raise Exception.Create('Erro ao atualizar a tabela TRANSFBEMIMOVEL');
               end;

            end;
            AndaProgresso(ProgressBar, lblProgress, lblContador, qryBens.RecNo, fRegistros);
            qryBens.Next;
         end;

         EscondeProgresso(ProgressBar, lblProgress, lblContador);
         MostraEspera('Atualizando Tipo dos Imóveis...');

         // altera o Tipo do Imóvel
         case tTransf of
            ttMestre: TrocaTipoMestre(iMestre, DBcboTipoImovel.LookupValue);
            ttImovel: TrocaTipoImovel(iImovel, DBcboTipoImovel.LookupValue);
         end;

         // abre a tabela de imóveis para registro do evento
         with qryImovelEvento do begin
            LimpaParametros(qryImovelEvento);
            case tTransf of
               ttMestre: ParamByName('PIDIMOVELMESTRE').AsInteger := iMestre;
               ttImovel: ParamByName('PIDIMOVEL').AsInteger       := iImovel;
            end;
            Open;
         end;
         EscondeEspera;

         // Registra o evento
         if not(qryImovelEvento.IsEmpty) then begin
            fRegistros := qryImovelEvento.RecordCount;
            MostraProgresso(ProgressBar, lblProgress, lblContador, fRegistros, 'Registrando o Evento...');

            while not(qryImovelEvento.EOF) do begin
               sCabecalho := 'Transf. para ' + DBcboTipoImovel.Text;
               sCabecalho := copy(sCabecalho, 1, 59);

               EventoImovel.RegistraEvento(qryImovelEventoIDIMOVEL.AsInteger, -1, Sistema.idUsuario, -1,
                            -1, edtDataTransf.Date, -1, 'TT', sCabecalho, memEvento.Text, 100, -1, -1, True);

               AndaProgresso(ProgressBar, lblProgress, lblContador, qryImovelEvento.RecNo, fRegistros);
               qryImovelEvento.Next;
            end;
         end;

         // se correu tudo bem...
         CommitTransacao;
         MsgDlg('Transferência realizada.', 'Informação', mtInformation, [mbOk], 0);
      except
         on E : Exception do begin
            RollBackTransacao;
            MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
         end;
      end;
   finally
      EscondeProgresso(ProgressBar, lblProgress, lblContador);
      Repaint;
   end;
end;



procedure TfrmExecTranfTipoImovel.TrocaTipoMestre(iMestreTroca: integer; sTipoTroca: string);
begin
   with qryTrocaTipoMestre do begin
      LimpaParametros(qryTrocaTipoMestre);
      ParamByName('PIDIMOVELMESTRE').asInteger  := iMestreTroca;
      ParamByName('PCODTIPIMOVEL').asString     := sTipoTroca;
      ExecSQL;
   end;
end;



procedure TfrmExecTranfTipoImovel.TrocaTipoImovel(iImovelTroca: integer; sTipoTroca: string);
begin
   with qryTrocaTipoImovel do begin
      LimpaParametros(qryTrocaTipoImovel);
      ParamByName('IMOVEL').asInteger  := iImovelTroca;
      ParamByName('TIPO').asString     := sTipoTroca;
      ExecSQL;
   end;
end;


function TfrmExecTranfTipoImovel.VerificaPreenchimento: boolean;
begin
   Result := False;
   try
      // Data
      if length(trim(edtDataTransf.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar a Data da Transferência!', edtDataTransf);

      // Imóvel (basta verificar o Mestre)
      if length(trim(edtImovelMestre.Text)) = 0 then
         raise EValidacao.CreateVal('É necessário indicar o Imóvel Mestre ou o Imóvel que se deseja transferir!', btnBuscaMestre);

      // Tipo de Imóvel (para)
      if DBcboTipoImovel.LookupValue = '' then
         raise EValidacao.CreateVal('É necessário indicar o Tipo de Imóvel / Segmento!', DBcboTipoImovel);
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


procedure TfrmExecTranfTipoImovel.FormShow(Sender: TObject);
begin
   inherited;
   edtDataTransf.Date := Date;
   // abre a query de tipos de imóvel
   qryLookTipoPara.Open;
end;



procedure TfrmExecTranfTipoImovel.bbtnConfirmarClick(Sender: TObject);
var sMensagem : string;
begin
   inherited;
   if tTransf = ttMestre then begin
      sMensagem := 'Deseja realmente transferir TODOS os Imóveis do Imóvel Mestre selecionado?';
      if MsgDlg(sMensagem, 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
   end;

   try
      if VerificaPreenchimento then begin
         DesabilitaBotoes;
         ExecutaTransferencia;
      end;
   finally
      lblProgress.Visible  := False;
      ProgressBar.Visible  := False;
      HabilitaBotoes;
   end;
end;



procedure TfrmExecTranfTipoImovel.btnBuscaImovelClick(Sender: TObject);
begin
   dtmMS.MS_ImovelAtivo.Executar;
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelAtivo.RetornouValor then begin
      Screen.Cursor := crHourGlass;
      tTransf              := ttImovel;
      iImovel              := StrToInt(dtmMS.MS_ImovelAtivo.ValoresChave[1]);
      edtImovelMestre.Text := dtmMS.MS_ImovelAtivo.ValoresChave[2];
      edtImovel.Text       := dtmMS.MS_ImovelAtivo.ValoresChave[3];
      edtTipoImovel.Text   := dtmMS.MS_ImovelAtivo.ValoresChave[6];
      Screen.Cursor := crDefault;
   end;
   btnBuscaImovel.SetFocus;
end;



procedure TfrmExecTranfTipoImovel.btnBuscaMestreClick(Sender: TObject);
begin
   dtmMS.MS_ImovelMestre.Executar;
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelMestre.RetornouValor then begin
      Screen.Cursor := crHourGlass;
      tTransf              := ttMestre;
      iImovel              := -1;
      iMestre              := StrToInt(dtmMS.MS_ImovelMestre.ValoresChave[0]);
      edtImovelMestre.Text := dtmMS.MS_ImovelMestre.ValoresChave[1];
      edtImovel.Text       := '';
      edtTipoImovel.Text   := '< Vários >';
      Screen.Cursor := crDefault;
   end;
   btnBuscaMestre.SetFocus;
end;


procedure TfrmExecTranfTipoImovel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qryBemXImovel.Close;
   qryBemXMestre.Close;
   inherited;
end;


end.
