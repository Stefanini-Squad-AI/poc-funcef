{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     Cadastro de Obras

	Autor             :  Vinícius Meyer Lana
	Data de Início    :  09/01/2002
	Data de Término   :  09/01/2002

     OBS.: FORMULÁRIO HERDADO DE: Arquivos Comuns/AtivoFixo/FrmCadObra.pas

     Alterações :  08/02/2002 - Inclusão e Estorno da Transferencia de Grupos

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27213
Responsável  : Daniel Simões
Data         : 29/02/2008
Descrição    : Alteração nas rotinas de 'ExecutaTransferenciaGrupo' e
               'DesfazTransferenciaGrupo' para serem chamadas da
               'CtrlMovTransfBem' ...
--------------------------------------------------------------------------------
Pendência   : 27014
Responsável : Daniel Simões
Data        : 04/12/2007
Descrição   : Adicionado o parâmetro ( BAIXATOTAL = 'N' ) na 'qryImovelXBem' ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadObrasCAF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadObra, CmEventosCadastro, ImgList, MontaSelect, DBTables, IvDictio,
  IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, CMTree, StdCtrls, TREdit, TB97Ctls, TB97,
  TabControlDetalhe, wwdbdatetimepicker, CMDateTimePicker, Buttons, Mask,
  wwdbedit, DBCtrls, ExtCtrls, wwdblook, mImovelInativo, fcLabel, mImovel,
  wwriched,
  // Daniel - 27213
  uCMClientDataSet, uCtrlDomBem, uCtrlGrupoContab, uCtrlConjunto,
  uCtrlResponsavel, uCtrlLocalizacoes, uComunsImobiliario, uCtrlMovTransfBem;
  // Fim.

type
  TfrmCadObraCAF = class(TfrmCadObra)
    Label22: TLabel;
    DBcboTipoRecDes: TwwDBLookupCombo;
    qryImovel: TwwQuery;
    qryImovelNOMEIMOVEL: TStringField;
    lblEncerrado: TfcLabel;
    molImovel1: TmolImovel;
    qryImovelFLGATIVO: TFloatField;
    qryInsTransferencia: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure molImovel1btnBuscaImovelClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    iIdImovelAnt     : Integer;
    dDataAnt         : TDateTime;

// Daniel - 27213 - Início -----------------------------------------------------
    CtrlDomBem       : TCtrlDomBem;
    CtrlGrupoContab  : TCtrlGrupoContab;
    CtrlConjunto     : TCtrlConjunto;
    CtrlResponsavel  : TCtrlResponsavel;
    CtrlLocalizacoes : TCtrlLocalizacoes;
    CtrlMovTransfBem : TCtrlMovTransfBem;
// Daniel - 27213 - Fim --------------------------------------------------------

    procedure AbreQueries;
    procedure LimpaCampos;
    procedure Seleciona;
    function  VerificaTipoImovel: Boolean;
    function  VerificaImovelEmObra(const iIdImovel:Integer) : Boolean;
    function  ExecutaTransferenciaGrupo: Boolean;
    function  DesfazTransferenciaGrupo(const iIdImovel:Integer; const dDataMovto:TDateTime;
                                       const bExclusao: Boolean) : Boolean;
    function  AlteraTipoImovel(const iIdImovel:Integer; const sCodTipImovel:String):Boolean;

  public
    { Public declarations }
  end;

var
  frmCadObraCAF: TfrmCadObraCAF;

implementation

uses dLookImobiliario, UFuncoesImob, uSistema, uMensErro, dImobiliario,
     DCAF, uAtivoFixo, uDataBase, fAguarde, uModuloImobiliario, uCAF, dBaseDados;

{$R *.DFM}

{ TfrmCadObraCAF }

procedure TfrmCadObraCAF.AbreQueries;
begin
   // Abre Tipo de Despesa
   with dtmLookImobiliario.qryLookTipoRecDes do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      ParamByName('PRECCUSTO').AsString  := 'C';
      ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
      Open;
   end;

   // Abre Parametros do Sistema
   ParametrosSistema;
end;

procedure TfrmCadObraCAF.LimpaCampos;
begin
   // Limpa os dados do formulário
   molImovel1.btnLimpaImovel.Click;
   DBcboTipoRecDes.Text     := '';
   lblEncerrado.Caption     := '';
   dDataAnt                 := Date();
   iIdImovelAnt             := 0;
   dbeDtaInicioObra.Enabled := True;
   
   LimpaParametros(qrySelAtivProj);
   qrySelAtivProj.Open;
   LimpaParametros(qrySelGrupo);
   qrySelGrupo.Open;
end;

procedure TfrmCadObraCAF.Seleciona;
begin
   with qryImovel do begin
      LimpaParametros(qryImovel);
      ParamByName('PIDIMOVEL').AsInteger := qryIDIMOVEL.AsInteger;
      Open;
   end;
   molImovel1.edtImovel.Text := qryImovelNOMEIMOVEL.AsString;
   DBcboTipoRecDes.LookupValue := qryIDTIPOCUSTORECIMO.AsString;

   // Define Caption de encerramento
   if qryDTAENCERRAOBRA.IsNull then
        lblEncerrado.Caption := 'Em Andamento'
   else lblEncerrado.Caption := 'Encerrada em ' + DateToStr(qryDTAENCERRAOBRA.AsDateTime);
end;


procedure TfrmCadObraCAF.FormShow(Sender: TObject);
begin
   inherited;
   AbreQueries;
   lblEncerrado.Caption := '';
end;

procedure TfrmCadObraCAF.CmeCadastroConfirma(Sender: TObject);
var bEdita, bResult : boolean;
begin
   bEdita  := False;
   bResult := True;
   if qry.State in [dsInsert, dsEdit] then begin
      if qry.State = dsEdit then bEdita := True;
      if molImovel1.iImovel > 0 then begin

         // Atribui o novo imovel ao campo
         qryIDIMOVEL.AsInteger := molImovel1.iImovel;

         // Altera a situação do imovel novo para ativo - em obras
         LimpaParametros (dtmCAF.qryUpdStatusImovel);
         dtmCAF.qryUpdStatusImovel.ParamByName('PFLGSTATUS').AsString := 'O';
         dtmCAF.qryUpdStatusImovel.ParamByName('PFLGATIVO').AsInteger := 1;
         dtmCAF.qryUpdStatusImovel.ParamByName('PIDIMOVEL').AsInteger := molImovel1.iImovel;
         dtmCAF.qryUpdStatusImovel.ExecSQL;
      end;
      qryIDTIPOCUSTORECIMO.AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);

      // Executa a Transferencia de Grupos no CAF
      StartTransacao;
      try
         try
            bResult := DesfazTransferenciaGrupo(iIdImovelAnt,dDataAnt, False);
            if bResult then bResult := ExecutaTransferenciaGrupo;
            if bResult then begin
               CommitTransacao;
            end else begin
               MsgDlg('Ocorreram ERROS na Transferencia de Grupo do CAF','Aviso',mtWarning,[mbOK],0);
               RollBackTransacao;
            end;
         except
            MsgDlg('Ocorreram ERROS na Transferencia de Grupo do CAF','Aviso',mtWarning,[mbOK],0);
            RollBackTransacao;
            bResult := False;
         end;
      finally
         frmAguarde.Apaga;
      end;
   end;

   // Se não ocorreu erros durante a transferencia de grupo do CAF, continua o processo
   if bResult then begin
      inherited;
      if not bEdita then LimpaCampos;
   end;
end;

procedure TfrmCadObraCAF.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   Accept := True;
   if molImovel1.edtImovel.Text = '' then begin
      MsgDlg('Imóvel não foi selecionado','Aviso',mtWarning,[mbOK],0);
      molImovel1.btnBuscaImovel.SetFocus;
      Accept := False;
      Exit;
   end;
   if DBcboTipoRecDes.Text = '' then begin
      MsgDlg('Tipo de Despesa não foi selecionado','Aviso',mtWarning,[mbOK],0);
      DBcboTipoRecDes.SetFocus;
      Accept := False;
      Exit;
   end;
   if not VerificaImovelEmObra(molImovel1.iImovel) then begin
      molImovel1.btnBuscaImovel.SetFocus;
      Accept := False;
      Exit;
   end;

   if ModuloImobiliario.InvestImob.sCodTipImovelObra = '' then begin
      if MsgDlg('Quando um imóvel é colocado em Obra, o mesmo deverá ser transferido ' + #13#10 +
                'para um TIPO DE IMÓVEL EM OBRA, o qual NÃO está definido nos parâmetros' + #13#10 +
                'do Sistema. Confirma o Cadastro da Obra sem efetuar a transferência?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
         Accept := False;
         Exit;
      end;
   end;

   inherited;
end;


procedure TfrmCadObraCAF.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then Seleciona;
end;

procedure TfrmCadObraCAF.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   LimpaCampos;

   // Define Defaults
   ParametrosSistema;
   qrySelAtivProj.Close;
   qrySelAtivProj.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
   qrySelAtivProj.ParamByName('PIDATIVPROJETO').AsInteger := ModuloImobiliario.InvestImob.iUnidNegoc;
   qrySelAtivProj.Open;

   // Define Centro de Custos Default
   if ModuloImobiliario.InvestImob.sCodTipImovelObra <> '' then begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
      dtmLookImobiliario.qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := ModuloImobiliario.InvestImob.sCodTipImovelObra;
      dtmLookImobiliario.qryLookTipoImovel.Open;
      if not dtmLookImobiliario.qryLookTipoImovel.IsEmpty then begin
         qrySelGrupo.Close;
         qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsInteger;
         qrySelGrupo.Open;
      end;
   end;
end;


procedure TfrmCadObraCAF.molImovel1btnBuscaImovelClick(Sender: TObject);
begin
   inherited;
   molImovel1.btnBuscaImovelClick(Sender);
   if molImovel1.iImovel > 0 then begin
      if not VerificaTipoImovel then begin
         MsgDlg('O Imóvel Selecionado deverá estar inativo ou ' + #13#10 +
                'Possuir apenas um bem do tipo Terreno com Saldo Contábil','Aviso',mtWarning,[mbOK],0);
         molImovel1.edtImovel.Text := '';
         molImovel1.btnBuscaImovel.SetFocus;
      end;
   end;
end;

function TfrmCadObraCAF.VerificaTipoImovel: Boolean;
begin
   // Somente pode incluir imoveis inativos ou ativos com apenas um bem de terreno
   Result := False;
   with qryImovel do begin
      LimpaParametros(qryImovel);
      ParamByName('PIDIMOVEL').AsInteger := molImovel1.iImovel;
      Open;
   end;
   if qryImovelFLGATIVO.AsInteger = 0 then begin   {inativo}
      Result := True;
   end else begin
      with dtmCAF.qryImovelxBem do begin
         LimpaParametros(dtmCAF.qryImovelxBem);
         ParamByName('PIDIMOVEL').AsInteger  := molImovel1.iImovel;
         ParamByName('PBAIXATOTAL').AsString := 'N'; // Daniel - 27014
         Open;

         // verifica se possui apenas um bem do tipo Terreno
         if (RecordCount = 1) and (dtmCAF.qryImovelxBemIXBGRUPO.AsString = 'T') then begin
            Result := True;
         end;

         // Verifica se o imovel possui Saldo Contábil
         if CAF.SaldoContabilImovel(molImovel1.iImovel,-1,Date) <= 0 then begin
            Result := False;
         end;
      end;
   end;
end;


function TfrmCadObraCAF.VerificaImovelEmObra(const iIdImovel: Integer): Boolean;
var sSql:String;
begin
   Result := True;
   if (iIdImovel > 0) and (iIdImovel <> qryIDIMOVEL.AsInteger) then begin
      sSql := 'SELECT DESCCAFOBRA ' +
              '  FROM CAFOBRA ' +
                ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel);
      if ExecutaQuery(dtmImobiliario.qryAux,sSql) then begin
         if not dtmImobiliario.qryAux.IsEmpty then begin
            MsgDlg('O Imóvel selecionado já está relacionado a obra: ' + #13#10 +
                    dtmImobiliario.qryAux.FieldByName('DESCCAFOBRA').AsString,'Aviso',mtWarning,[mbOK],0);
            Result := False;
         end;
      end else begin
         MsgDlg('ERRO na Execução do SQL','Aviso',mtWarning,[mbOK],0);
         Result := False;
      end;
   end;
end;


procedure TfrmCadObraCAF.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   // Guarda dados do Imóvel antes da alteração do cadastro para na confirmação,
   // checar se precisa fazer a transferencia
   LimpaParametros(dtmImobiliario.qryImovel);
   dtmImobiliario.qryImovel.ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
   dtmImobiliario.qryImovel.ParamByName('PIDIMOVEL').AsInteger      := qryIDIMOVEL.AsInteger;
   dtmImobiliario.qryImovel.Open;
   dDataAnt     := qryDTAINICIOOBRA.AsDateTime;
   iIdImovelAnt := qryIDIMOVEL.AsInteger;

   // Desabilita o edit da data, pois para desfazer a transferencia, deve-se passar a data
   // em que foi efetuada a transferencia
   dbeDtaInicioObra.Enabled := False;
end;


function TfrmCadObraCAF.ExecutaTransferenciaGrupo: Boolean;
var sGrupoImovel : String;
    iGrupoNovo, iConjunto, iBem, iLocalNovo, iRespNovo : Integer;
    iResultado, prg : Integer;
    iIdMovto : Extended;

// Daniel - 27213 - Início -----------------------------------------------------
    sMensagem          : String;

    cdsTempConjTransf  : TCMClientDataSet;
    cdsTempGrupoTransf : TCMClientDataSet;
    cdsTempBemTransf   : TCMClientDataSet;
    cdsTempRespTransf  : TCMClientDataSet;
    cdsTempLocalTransf : TCMClientDataSet;
// Daniel - 27213 - Fim --------------------------------------------------------

begin
  Result := True;

// Daniel - 27213 - Início -----------------------------------------------------
  cdsTempConjTransf  := TCMClientDataSet.Create(nil);
  cdsTempGrupoTransf := TCMClientDataSet.Create(nil);
  cdsTempBemTransf   := TCMClientDataSet.Create(nil);
  cdsTempRespTransf  := TCMClientDataSet.Create(nil);
  cdsTempLocalTransf := TCMClientDataSet.Create(nil);

  CtrlMovTransfBem.cdsConjunto    := cdsTempConjTransf;
  CtrlMovTransfBem.cdsGrupo       := cdsTempGrupoTransf;
  CtrlMovTransfBem.cdsBem         := cdsTempBemTransf;
  CtrlMovTransfBem.cdsResponsavel := cdsTempRespTransf;
  CtrlMovTransfBem.cdsLocalizacao := cdsTempLocalTransf;
// Daniel - 27213 - Fim --------------------------------------------------------

  // Verifica Tipo de Imóvel Atual para comparar com o anterior
  LimpaParametros(dtmImobiliario.qryImovel);
  dtmImobiliario.qryImovel.ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IdEmpresa;
  dtmImobiliario.qryImovel.ParamByName('PIDIMOVEL').AsInteger      := qryIDIMOVEL.AsInteger;
  dtmImobiliario.qryImovel.Open;

  if (ModuloImobiliario.InvestImob.sCodTipImovelObra <> '') then begin

     // Só transfere se o grupo for diferente do definido nos parametros
     if (ModuloImobiliario.InvestImob.sCodTipImovelObra <> dtmImobiliario.qryImovelCODTIPIMOVEL.AsString) then begin

        // Abre o Tipo de Imóvel
        LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
        dtmLookImobiliario.qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := ModuloImobiliario.InvestImob.sCodTipImovelObra;
        dtmLookImobiliario.qryLookTipoImovel.Open;

        // Abre tabela de bens do imóvel
        LimpaParametros(dtmCAF.qryImovelxBem);
        dtmCAF.qryImovelxBem.ParamByName('PIDIMOVEL').AsInteger  := qryIDIMOVEL.AsInteger;
        dtmCAF.qryImovelxBem.ParamByName('PBAIXATOTAL').AsString := 'N'; // Daniel - 27014
        dtmCAF.qryImovelxBem.Open;

        // define a barra de progresso
        prg    := 0;
        FrmAguarde.Mostra('Executando a Transferência de Grupo...');
        FrmAguarde.Max := dtmCAF.qryImovelxBem.RecordCount;
        Application.ProcessMessages;

        try
           try
              // Executa a Transferencia para cada bem do imóvel
              while not dtmCAF.qryImovelxBem.Eof do begin

                 // incrementa barra de progresso
                 Inc(prg);
                 FrmAguarde.Pos := prg;
                 Application.ProcessMessages;

                 // verifica o grupo do bem do Imobiliário
                 sGrupoImovel := dtmCAF.qryImovelXBemIXBGRUPO.AsString;

                 // Define o novo grupo dependendo do tipo de bem
                 iGrupoNovo := dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsInteger;
                 case sGrupoImovel[1] of
                    'A': iGrupoNovo := dtmLookImobiliario.qryLookTipoImovelIDGRUPOAR.AsInteger;
                    'E': iGrupoNovo := dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsInteger;
                    'I': iGrupoNovo := dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsInteger;
                    'L': iGrupoNovo := dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.AsInteger;
                    'M': iGrupoNovo := dtmLookImobiliario.qryLookTipoImovelIDGRUPOMAQUINA.AsInteger;
                    'T': iGrupoNovo := dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsInteger;
                    'U': iGrupoNovo := dtmLookImobiliario.qryLookTipoImovelIDGRUPOUTILITARIO.AsInteger;
                    'V': iGrupoNovo := dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.AsInteger;
                 end;

                 // só transfere o bem se o grupo novo for diferente do atual
                 if dtmCAF.qryImovelXBemIDGRUPO.asInteger <> iGrupoNovo then begin
                    iConjunto  := dtmCAF.qryImovelXBemIDCONJUNTO.AsInteger;
                    iBem       := dtmCAF.qryImovelXBemIDBEM.AsInteger;
                    iLocalNovo := -1;
                    iRespNovo  := -1;
                    iIdMovto   := 0;

// Daniel - 27213 - Início -----------------------------------------------------
                    cdsTempConjTransf.Data  := CtrlConjunto.ListaConjunto(Sistema.IdEmpresa,iConjunto);
                    cdsTempGrupoTransf.Data := CtrlGrupoContab.ListaGrupoContab(Sistema.IdEmpresa,dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsInteger);
                    cdsTempBemTransf.Data   := CtrlDomBem.ListaBem(Sistema.IdEmpresa,iBem);
                    cdsTempRespTransf.Data  := CtrlResponsavel.ListaResponsavel(iRespNovo);
                    cdsTempLocalTransf.Data := CtrlLocalizacoes.ListaLocalizacao(Sistema.IdEmpresa,iLocalNovo);

                    { TROQUEI A CHAMADA DA FUNÇÃO 'ExecutaTransferencia' DO
                      'cAtivoFixo' ABAIXO PELA CHAMADA DO 'CtrlMovTransfBem' }
                    // transfere o bem de grupo (Ativo Fixo)
                    CtrlMovTransfBem.OpenTransaction := False;
                    if CtrlMovTransfBem.ExecutaTransferencia( Sistema.idModulo,
                                                              Sistema.idEmpresa,
                                                              Sistema.IdUsuario,
                                                              iBem,
                                                              dbeDtaInicioObra.Date )<0 then
                    begin
                      sMensagem := 'Houve erro durante a tentativa de transferência.'+#13#10+'Imóvel: '+
                                   dtmCAF.qryImovelXBem.FieldByName('NOME_MESTRE').AsString +' - '+
                                   dtmCAF.qryImovelXBem.FieldByName('NOME_IMOVEL').AsString +#13#10+
                                   'Bem: '+dtmCAF.qryImovelXBem.FieldByName('NOME_BEM').AsString+#13#10+
                                   'ERRO: '+CtrlMovTransfBem.MessageInfo;

                      raise Exception.Create( sMensagem );
                    end else iIdMovto := CtrlMovTransfBem.nMovimentacao;
// Daniel - 27213 - Fim --------------------------------------------------------

                    // Registra transação em TRANSFBEMIMOVEL
                    try
                       LimpaParametros(qryInsTransferencia);
                       qryInsTransferencia.ParamByName('PIDMOVIMENTACAO').AsFloat   := iIdMovto;
                       qryInsTransferencia.ParamByName('PIDIMOVELORIG').AsInteger   := qryIDIMOVEL.AsInteger;
                       qryInsTransferencia.ParamByName('PIDIMOVELDEST').AsInteger   := qryIDIMOVEL.AsInteger;
                       qryInsTransferencia.ParamByName('PFLGOPERACAO').AsString     := 'G';
                       qryInsTransferencia.ParamByName('PCODTIPIMOVELANT').AsString := dtmImobiliario.qryImovelCODTIPIMOVEL.AsString;
                       qryInsTransferencia.ExecSQL;
                    except
                       raise Exception.Create('Erro ao atualizar a tabela TRANSFBEMIMOVEL');
                    end;
                 end;
                 dtmCAF.qryImovelXBem.Next;
              end;

              // Altera o Tipo de Imovel em IMOVEL
              if not AlteraTipoImovel(qryIDIMOVEL.AsInteger, ModuloImobiliario.InvestImob.sCodTipImovelObra) then begin
                 raise Exception.Create('Erro ao alterar o tipo do imovel na tabela IMOVEL');
              end;
           except
              on E : Exception do begin
                 Result := False;
                 MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
              end;
           end;
        finally
// Daniel - 27213 - Início -----------------------------------------------------
           cdsTempConjTransf.Free;
           cdsTempGrupoTransf.Free;
           cdsTempBemTransf.Free;
           cdsTempRespTransf.Free;
           cdsTempLocalTransf.Free;
// Daniel - 27213 - Fim --------------------------------------------------------
        end;
     end;
  end;
end;


function TfrmCadObraCAF.DesfazTransferenciaGrupo(const iIdImovel: Integer;
                                                 const dDataMovto: TDateTime;
                                                 const bExclusao: Boolean): Boolean;
var iResult,prg : Integer;
begin
   Result := True;

   // Se já existisse imovel anteriormente e foi alterado, ou se for uma exclusão,
   // estornar a transferencia
   if ((iIdImovel > 0) and (iIdImovel <> qryIDIMOVEL.AsInteger)) or bExclusao then begin

      // Abre bens transferidos para estorno
      LimpaParametros(dtmCAF.qryTransferencia);
      dtmCAF.qryTransferencia.ParamByName('PIDIMOVELORIG').AsInteger      := iIdImovel;
      dtmCAF.qryTransferencia.ParamByName('PIDIMOVELDEST').AsInteger      := iIdImovel;
      dtmCAF.qryTransferencia.ParamByName('PDATAMOVIMENTACAO').AsDateTime := dDataMovto;
      dtmCAF.qryTransferencia.Open;

      // define a barra de progresso
      prg    := 0;
      FrmAguarde.Mostra('Desfazendo a Transferência de Grupo...');
      FrmAguarde.Max := dtmCAF.qryTransferencia.RecordCount;
      Application.ProcessMessages;

      // Se tiver ocorrido alguma transferencia, estorna cada bem transferido
      if not dtmCAF.qryTransferencia.isEmpty then begin
        try
           // Desfaz a transferencia de grupo para cada bem do imovel
           dtmCAF.qryTransferencia.First;
           while not dtmCAF.qryTransferencia.Eof do begin

              // incrementa barra de progresso
              Inc(prg);
              FrmAguarde.Pos := prg;
              Application.ProcessMessages;

              // Exclui o Lançamento em TRANSFBEMIMOVEL
              try
                 LimpaParametros(dtmCAF.qryDelTransferencia);
                 dtmCAF.qryDelTransferencia.ParamByName('PIDMOVIMENTACAO').AsInteger := dtmCAF.qryTransferenciaIDMOVIMENTACAO.AsInteger;
                 dtmCAF.qryDelTransferencia.ExecSQL;
              except
                 raise Exception.Create('Erro ao excluir o registro da tabela TRANSFBEMIMOVEL');
              end;

// Daniel - 27213 - Início -----------------------------------------------------
              // Desfaz a transferencia no Ativo Fixo
              CtrlMovTransfBem.OpenTransaction := False;
              if not CtrlMovTransfBem.EstornaTransferencia(Sistema.IdModulo,
                                                           Sistema.IdEmpresa,
                                                           Sistema.IdUsuario,
                                                           dtmCAF.qryTransferenciaIDBEM.AsInteger,
                                                           dtmCAF.qryTransferenciaDATAMOVIMENTACAO.AsDateTime,
                                                           Date,
                                                           dtmCAF.qryTransferenciaIDMOVIMENTACAO.AsInteger) then
                raise exception.create( CtrlMovTransfBem.MessageInfo );
// Daniel - 27213 - Fim --------------------------------------------------------

              dtmCAF.qryTransferencia.Next;
           end;

           // Retorna o Tipo de Imóvel para o definido anteriormente
           dtmCAF.qryTransferencia.First;
           if not AlteraTipoImovel(iIdImovel, dtmCAF.qryTransferenciaCODTIPIMOVELANT.AsString) then begin
              raise Exception.create('Erro ao atualizar a tabela IMOVEL');
           end;

           // Retorna a situação do imovel anterior para em carteira
           // Ativo - se tiver tipo de imóvel definido
           try
              LimpaParametros (dtmCAF.qryUpdStatusImovel);
              dtmCAF.qryUpdStatusImovel.ParamByName('PFLGSTATUS').AsString := 'N';
              if dtmCAF.qryTransferenciaCODTIPIMOVELANT.AsString = '' then
                   dtmCAF.qryUpdStatusImovel.ParamByName('PFLGATIVO').AsInteger := 0     // Inativo
              else dtmCAF.qryUpdStatusImovel.ParamByName('PFLGATIVO').AsInteger := 1;    // Ativo
              dtmCAF.qryUpdStatusImovel.ParamByName('PIDIMOVEL').AsInteger := iIdImovel;
              dtmCAF.qryUpdStatusImovel.ExecSQL;
           except
              raise Exception.Create('Erro ao atualizar a situação do IMOVEL');
           end;
        except
           on E : Exception do begin
              Result := False;
              MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
           end;
        end;
      end;
   end;
end;


function TfrmCadObraCAF.AlteraTipoImovel(const iIdImovel: Integer;
                                         const sCodTipImovel: String): Boolean;
var sSql : String;
begin
   Result := True;
   sSql   := 'UPDATE IMOVEL ' +
             '   SET CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel) +
             ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel);
   Result := ExecutaQuery(dtmImobiliario.qryAux,sSql);
end;


procedure TfrmCadObraCAF.CmeCadastroDelete(Sender: TObject);
var bResult : Boolean;
begin
   bResult := True;
   // Desfaz a transferencia de grupo do imovel antes de excluir a obra
   try
      try
         StartTransacao;
         if DesfazTransferenciaGrupo(qryIDIMOVEL.AsInteger, qryDTAINICIOOBRA.AsDateTime, True) then begin
            CommitTransacao;
         end else begin
            MsgDlg('Ocorreram ERROS na Transferencia de Grupo do CAF','Aviso',mtWarning,[mbOK],0);
            RollBackTransacao;
            bResult := False;
         end;
      except
         MsgDlg('Ocorreram ERROS na Transferencia de Grupo do CAF','Aviso',mtWarning,[mbOK],0);
         RollBackTransacao;
         bResult := False;
      end;
   finally
      frmAguarde.Apaga;
   end;

   // Executa a Exclusão quando não tiver ocorrido erros na Transferencia
   if bResult then begin
      inherited;
   end;
end;

procedure TfrmCadObraCAF.CmeCadastroCancel(Sender: TObject);
begin
  if (qry.State = dsInsert) then LimpaCampos;
  inherited;
end;

procedure TfrmCadObraCAF.FormCreate(Sender: TObject);
begin
  inherited;

// Daniel - 27213 - Início -----------------------------------------------------
  CtrlDomBem       := TCtrlDomBem.Create;
  CtrlGrupoContab  := TCtrlGrupoContab.Create;
  CtrlConjunto     := TCtrlConjunto.Create;
  CtrlResponsavel  := TCtrlResponsavel.Create;
  CtrlLocalizacoes := TCtrlLocalizacoes.Create;
  CtrlMovTransfBem := TCtrlMovTransfBem.Create;

  CtrlDomBem.Initialize(DtmBaseDados.DbBaseDados,
                        True,
                        Sistema.ConnectionType,
                        Sistema.ConnectionSide,
                        Sistema.AppRemoteServer,
                        True,
                        ComunsImobiliario.MensErroMT);

  CtrlGrupoContab.Initialize(DtmBaseDados.DbBaseDados,
                             True,
                             Sistema.ConnectionType,
                             Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,
                             True,
                             ComunsImobiliario.MensErroMT);

  CtrlConjunto.Initialize(DtmBaseDados.DbBaseDados,
                          True,
                          Sistema.ConnectionType,
                          Sistema.ConnectionSide,
                          Sistema.AppRemoteServer,
                          True,
                          ComunsImobiliario.MensErroMT);

  CtrlResponsavel.Initialize(DtmBaseDados.DbBaseDados,
                             True,
                             Sistema.ConnectionType,
                             Sistema.ConnectionSide,
                             Sistema.AppRemoteServer,
                             True,
                             ComunsImobiliario.MensErroMT);

  CtrlLocalizacoes.Initialize(DtmBaseDados.DbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True,
                              ComunsImobiliario.MensErroMT);

  CtrlMovTransfBem.Initialize(DtmBaseDados.DbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True,
                              ComunsImobiliario.MensErroMT);
// Daniel - 27213 - Fim --------------------------------------------------------

end;

procedure TfrmCadObraCAF.FormClose(Sender:TObject; var Action:TCloseAction);
begin
// Daniel - 27213 - Início -----------------------------------------------------
  FreeAndNil( CtrlDomBem       );
  FreeAndNil( CtrlGrupoContab  );
  FreeAndNil( CtrlConjunto     );
  FreeAndNil( CtrlResponsavel  );
  FreeAndNil( CtrlLocalizacoes );
  FreeAndNil( CtrlMovTransfBem  );
// Daniel - 27213 - Fim --------------------------------------------------------

  inherited;
end;

end.
